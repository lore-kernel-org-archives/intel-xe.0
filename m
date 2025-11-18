Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B014CEE327
	for <intel-xe@archiver.kernel.org>; Tue, 18 Nov 2025 15:48:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F148710E4ED;
	Tue, 18 Nov 2025 15:48:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dvWyGOIQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65BAD10E4ED
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Nov 2025 15:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763480886; x=1795016886;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=x6d6qLRS+ur/7yo4GXld7dph4lIm5aPiESgfD3tGxO4=;
 b=dvWyGOIQd8M15KHgb1fG0/BZsByOOFAcJZKciqkYYiIXCEDHMnJ/KpAv
 6bsa7jh7oyyG1c5adKzHI+S+0tlvMBWH0JrFQLOO0QPiOh0OzdA2M0MOB
 3Y1DgJCfp+b6S1ngv2lwbcqKqVcgfH5bKkTBbXYhRKIopaAFEOSs/cWKG
 JUJbzUOP+IC7ZiQEhxHmI930Qy2KFBleknUTARlIxnwOrnaBOx6fPU/aZ
 Ujy2FRwEv2UnxfdEJzdZFxa33GQxbyFv8bA9e6VhJ7z3A8AUdfdmHiR68
 f/IOsvFmtoHAvSbNLXGTfsKjnnFju3Y5a/9J8bSZRI7QBnqAxWUye2CfJ Q==;
X-CSE-ConnectionGUID: WFCWs+4PS8mAzBB+vmn0Sw==
X-CSE-MsgGUID: lu6DNfT+ScCVqNOZfGkSwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="76108817"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="76108817"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 07:48:06 -0800
X-CSE-ConnectionGUID: BvMJLoFVQrSFoNt4jnPU0w==
X-CSE-MsgGUID: 6/VIoKzJTluy5phneHe+bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="191565037"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 07:48:06 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 18 Nov 2025 07:48:05 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 18 Nov 2025 07:48:05 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.68) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 18 Nov 2025 07:48:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CH7Nh0a8H2KvHvSdg8ifMrzogtnFkiT+4OwVio1QDjGEB1ftBaJUlXNjqCB0vjT3jwM3HQNZkteXH/SdBBDYnGW0nkJg4AdDic1tZjFXqPhzXYODo+1YAfNI21GBnPQkwkGhi+aOIvI+e3HDKVHpXSYdn88R3IMBFSoIzSkqwErGWqSTyWFVCLC9/0EZqoRctq0u9XhhCkEKo9Rk/CaXTwwrm8Gtg1vy6FXu1b4C/nE+UjEH16hG15OUZ8+rhEUEHdwnbxsf8v3BYqKkXmUAtcsvOohNjZ/FHVlv4KmlutdVhwtOfeMcHoMbGyAu7f7e9eG7jcCe5Yi0b9iACPyvyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PrZpRG0pMSffMtfC0LoN6smh8KkyAiJOgCuPfjp+MHU=;
 b=MPp7uWDthbrpcjk5yHwN3WXzv2HiVnSQLe/Z27okL0ikVIH4+s8odNiqzjVy4eS4Phg0vvV2sNq8Gz9o5ngU8BvIj7FUu70LfRznlz8i3J++h9ng6xgeTukSrIb66ckfYMm6yj5itcQM9f3B7Ti5g0WrcHaxysGthBtRKlXA8SGfsE61oRxII416ZpnaUpiiqIeIqrXaSej/JdreKTm+CMW2tchLYWtrJsQBi25FfW/HRgDF882sjAeUf4Zoi6b+mPyfphwRYjNzEbcgR0U8fIAdTjA5Lf+PjbzDkyu71jsKQHmUT620I/K1BmI19WqjNJon/jTosKVwG7ewXDy/9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by DS0PR11MB6445.namprd11.prod.outlook.com (2603:10b6:8:c6::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Tue, 18 Nov
 2025 15:48:02 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9320.021; Tue, 18 Nov 2025
 15:48:02 +0000
Date: Tue, 18 Nov 2025 10:47:57 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: <lucas.demarchi@intel.com>, <jani.nikula@intel.com>,
 <intel-xe@lists.freedesktop.org>, <riana.tauro@intel.com>,
 <matthew.brost@intel.com>, <michal.wajdeczko@intel.com>,
 <badal.nilawar@intel.com>, <ville.syrjala@linux.intel.com>,
 <karthik.poosa@intel.com>, <anshuman.gupta@intel.com>
Subject: Re: [PATCH v1 1/4] drm/xe/pcode: Introduce xe_pcode_read_probe()
Message-ID: <aRyVLY1kV9ZxvZZS@intel.com>
References: <20251118090012.608250-1-raag.jadav@intel.com>
 <20251118090012.608250-2-raag.jadav@intel.com>
 <aRx3u9LuWvhGvMZj@intel.com> <aRyTBkBgFK3OO_wT@black.igk.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aRyTBkBgFK3OO_wT@black.igk.intel.com>
X-ClientProxiedBy: BY3PR03CA0015.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::20) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|DS0PR11MB6445:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b91e1b0-c129-4829-2702-08de26b9db3c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?H/HYmOSkh+/jgAXyqNfGfykA0eXuWjawOZ3k9uqznGQJ93H0ajRBb0D3no?=
 =?iso-8859-1?Q?VJ7SZiwpoqYC8fXuPWmXVavOJxS6/DE9Nkzs7VcrkIqAl/xVmIwITDCV0h?=
 =?iso-8859-1?Q?ynteLCcTZtFb6kss++pohY70rktly0c7J5D3Vejx3LHOFk+vktwOjEsZW4?=
 =?iso-8859-1?Q?txFkYy54Zd6I53c5FHO2aUDUWkqAxtYiyjuWU7P9q6csc9wz9VM0JISWg/?=
 =?iso-8859-1?Q?YlACL95EuwFObEtec1GWq5ODDoc+Wpso6I57AyU4Z9ImBlqDoYBjpGIg+K?=
 =?iso-8859-1?Q?fzlctck9MAS/clbpUgS1hJI1LtfbLd7ldpqGNTQlKHSmCG7IATPBCXlReK?=
 =?iso-8859-1?Q?WHkVdD3deJcOmPtLsbYLo6qG5ywpha7kTR7heGVfJv8xp+5orC1BV6gi+T?=
 =?iso-8859-1?Q?TyEFkrXwTceMOnJZ1X8kLbpjV0+Y4+Wk3q2F9Jffm6lvfYm3MKOKsBvG8o?=
 =?iso-8859-1?Q?O1KN8a6ECySMh1z5x23QmKVrDIE9NFD2rqzwu9Y9nA6oAc5z5GZ2r25aFF?=
 =?iso-8859-1?Q?5hcaOCgu7pH5cVUWSxA6hC53dbzmRCPXMG8n480pV3fwYAbr2RfvEa3+iM?=
 =?iso-8859-1?Q?lBAyDUvdDLFTZ9N4xx/eg44qBhb11wJlbkysM487ClF+peqwBXSiY1TR00?=
 =?iso-8859-1?Q?NLCOr7iI5XUL1fy1p7n/hc5N7U2YZ2XRasdtJbymNsLFVEO5QvfRfgGKNb?=
 =?iso-8859-1?Q?xe6VuEkqgI9XzpaMEhGgUFMsueYcTePgQ9cOUIg9I+ne/WSy0enZxzPPtU?=
 =?iso-8859-1?Q?zc10SAIRbifkmlPvQkTEnrKQp1p8ZigZA+PE8Pxvaatp6RgnmTwddRADLh?=
 =?iso-8859-1?Q?wNH3ruDls0oz6KAgZEMamWMomIZE2DoYv3Fo4Fl0kk2ZwMmy/QRMBtgJG7?=
 =?iso-8859-1?Q?OGVVR1gFhiygtkKGnMZbvYRdAQLjchKKFncU17eZe68IFfV7hMbUIwZMnS?=
 =?iso-8859-1?Q?dhRS7Cdanq0ISlRnhE97R9orqY8RlkDGnKOMf6LuZtxJoE2qvHYPwQmq0V?=
 =?iso-8859-1?Q?wc1VoGFg7AkYSzf+/j69GuQMa3apM8+fGbMjyaa2YhjxmF3zfET7u0aQPs?=
 =?iso-8859-1?Q?Y6I7BIXdShGNvD0CHrHfo8N3y6yvBptIotHxN5tvml3ScgEvKYF8kS1zCk?=
 =?iso-8859-1?Q?E2PDG89Y0VXuK31mcvxbSBY4NDBrMtBrBTlUZs8QKTyExZb6ONa+n9vfzF?=
 =?iso-8859-1?Q?sukFbA4MC7V8H2CPKRCwUV/EKf16/wvsuwfb0pSmDmKe82MnzCwvd2Ju6R?=
 =?iso-8859-1?Q?NBl2iHx1CGyyHOlpt/JrjdTQMWMMlxJ9cT227VuzLzWXph0xtYSlv5l1ef?=
 =?iso-8859-1?Q?KRcJkXTPhl+V+GbGzCsCd4LGQTGudLZ1kNytjh74wa1PFtJDdIhsdDVm0U?=
 =?iso-8859-1?Q?KQvUP22ByRgLZVlI6SEewa2kOgyTpW6dSaJXXyunb+prL7M7mdoJF0VHNJ?=
 =?iso-8859-1?Q?eOHzDY5wLC5eXte4wealHalRjX+p0jkZDRN/WO+DzRox+p4lPw0T47mABW?=
 =?iso-8859-1?Q?/eIw4yxyEKrzrTxvyvIlXAY94D0QWj54VOSf++DDeyFw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?oNVwdEDPmZyxjSmC+jfo1FDMkMvHmWG8SjKPYm/dNUtCHrVePl/BDm8dSJ?=
 =?iso-8859-1?Q?m6y/YqCIJ2bqejNTPQu8KElYh6oqi2bINm4N6qatsV5eaN27xpGY8SGbzU?=
 =?iso-8859-1?Q?BdkbVR5ory8ZwFkS7viKCh2DLNPaC5k2bq07wG+i1ZWCFwFkOGax2OCOTA?=
 =?iso-8859-1?Q?aU7bgQF3GLEBX6aLK1OqAu7GvFxUlmsckx5Qav8gsKhTiMRCI8bdYkAbwR?=
 =?iso-8859-1?Q?YfITEn5s3tMZblF5chiAn0GsV0SilwxsKZL9pHXUA7gE+zROuNtDMg8C2w?=
 =?iso-8859-1?Q?F0uKwvObvubmWlgOr/hgYyfeObNBpFRv1aBZNetZIePeNTH90U4U1e+EER?=
 =?iso-8859-1?Q?nMgC62czK0uLKLWcMxEsooOvnEzSBw9qVQGAOO9ppjTmEenHwys8iCmiih?=
 =?iso-8859-1?Q?/q12elI9jE7WzYoNrj1HaWsDkUPNLIJz/Y0xSjVCGss0yHxGcr3Q8VNVMK?=
 =?iso-8859-1?Q?GIfQQM/Mw38STevvuj/Qp4itZ2dC8g7Gvd5DhliU3Tt/auF5kzb+aQnJ3T?=
 =?iso-8859-1?Q?rvzVw3s3RZEkMnHFAy4niMA9Ehu6EbtH3M4vHmhYo4MNJoZLhHjQwo0tqb?=
 =?iso-8859-1?Q?UouPZAI3fiEo+TzU14a5nrlQRWQEohJ1yp2ylguLhL3/ERS3QBhd8IRX5X?=
 =?iso-8859-1?Q?YTVgygv3cjQICnK8zb48tKLL2t3W/ITV62dducQOlxGeGtf8aZ9J3pmyOl?=
 =?iso-8859-1?Q?bvyPxV0pwdm4LEwQAkRTCM2rp7KGzT2bI0fWzj3hd8J642d6eR2Y7hbiZL?=
 =?iso-8859-1?Q?lopkejaGtNjW7jqgApQalqO/zh5j7tiBK5mxdYVxGICpolO+J3cspD6M1x?=
 =?iso-8859-1?Q?WRgkhPAXoO0+VJr//F/iEhtZ7h8BNLPl1NEKZm5qzfx+ZDwPt5IzTT0Jk+?=
 =?iso-8859-1?Q?AIhUQtkq6ELYVZ4D/AzSY0MtLU8wqUxQs2eyb1pvwJp0f1qiTXE9+Xr/Hh?=
 =?iso-8859-1?Q?IXhSJd5K8vByQX2T0YcR/rnL0BABZbFHe30yY/b1ez7IkSZ/S1KBiGbMNF?=
 =?iso-8859-1?Q?C0B16NfOcvpXtKVjSnqyAve1K/qhvHfIWEdYrlxqL+GkbUrogLvq43npUA?=
 =?iso-8859-1?Q?BbgkXHLHSQG9FSnjyv9HICfU6DaxVcqQl2IXsE1rrHw184mMnrx/5D7zkP?=
 =?iso-8859-1?Q?QEOmXTvirzPt29t1UxIQ66ZTJb2vo/wUAJTrxB4jlPyermmBbPOZUrMN6h?=
 =?iso-8859-1?Q?H70gAN5DQFuZIikND4S3EkBCMlqA+zfIkc+iAiom7RB5WlnzK/MwEkAnLU?=
 =?iso-8859-1?Q?8i5SuRGvl1Aozi/rzOS2YUDVDZPTr+eG0H0W2R/Pvcv5I7igJ+fWuFFTWn?=
 =?iso-8859-1?Q?suDBQOAxUxTB5RgHTFgK3eOpTnMbti0CBsqZc9ULPmXt28cN8dbdK1eJEv?=
 =?iso-8859-1?Q?YRGd784Xe4G8Z0s34uj3mgk8dGzs9tCVm3/CMmvXeZG1C6OjIUJB1BU4Yb?=
 =?iso-8859-1?Q?5bwWj+KY30ZLFOHXVCK1aNJN1zh/JIvDVqx5l9DGeTUeoI/5XBSiPDvPzM?=
 =?iso-8859-1?Q?BouuhjNxmvZrXUatFz02f1l3tnayCvdHriaEigoaqWuUhlP3xJLaEV3nhy?=
 =?iso-8859-1?Q?xCGHU8PJZDnKbwSxVWFcwaI8Lg8n7tnp8Y7ktc7+oy0zEVt6RIAV04OKF+?=
 =?iso-8859-1?Q?L3FVrUIB18l8DZwE6MY3UFgxvnUA2qfXOQvJ/NpHQrdW8VcAaN4GAuhA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b91e1b0-c129-4829-2702-08de26b9db3c
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 15:48:02.4909 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e+nuR+2ad5jBu7EYrRQlABmA+WM0VL8Ng9OmDsIrZUsHbSRTasbOsf97peQsNFPWhSe1vRohXpsAuO4FdS2emg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6445
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Nov 18, 2025 at 04:38:46PM +0100, Raag Jadav wrote:
> On Tue, Nov 18, 2025 at 08:42:19AM -0500, Rodrigo Vivi wrote:
> > On Tue, Nov 18, 2025 at 02:29:17PM +0530, Raag Jadav wrote:
> > > If the device is running older pcode firmware, it is possible that newer
> > > mailbox commands are not supported by it. The respective functionality
> > > isn't useful in that case but nor is error logging, as it doesn't
> > > particularly signify anything wrong with pcode firmware or device as a
> > > whole. Introduce xe_pcode_read_probe() which allows the caller to check
> > > for mailbox command support and determine if the respective functionality
> > > exists on the device without it being reported as an error. This is useful
> > > in cases where we want to make functionality decisions in the driver based
> > > on pcode return codes and a relatively simpler design choice compared to
> > > other solutions like checking pcode firmware version, which comes with
> > > additional complexity of binding every single command to a specific version
> > > and deems pcode commands useless in case the driver fails to obtain it for
> > > reasons unrelated to pcode.
> > > 
> > > This only silences command related failures and still reports other
> > > failures as errors, so we don't end up hiding the genuine ones.
> > > 
> > > Suggested-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_pcode.c | 42 ++++++++++++++++++++++++-----------
> > >  drivers/gpu/drm/xe/xe_pcode.h |  1 +
> > >  2 files changed, 30 insertions(+), 13 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
> > > index 0d33c14ea0cf..797b757f7a68 100644
> > > --- a/drivers/gpu/drm/xe/xe_pcode.c
> > > +++ b/drivers/gpu/drm/xe/xe_pcode.c
> > > @@ -30,7 +30,7 @@
> > >   * - PCODE for display operations
> > >   */
> > >  
> > > -static int pcode_mailbox_status(struct xe_tile *tile)
> > > +static int pcode_mailbox_status(struct xe_tile *tile, bool probe)
> > >  {
> > >  	const char *err_str;
> > >  	int err_decode;
> > > @@ -57,8 +57,12 @@ static int pcode_mailbox_status(struct xe_tile *tile)
> > >  	}
> > >  
> > >  	if (err) {
> > > -		drm_err(&tile_to_xe(tile)->drm, "PCODE Mailbox failed: %d %s",
> > > -			err_decode, err_str);
> > > +		if (probe && err_decode == -ENXIO)
> > > +			drm_dbg(&tile_to_xe(tile)->drm, "PCODE Mailbox unsupported: %d %s",
> > > +				err_decode, err_str);
> > > +		else
> > > +			drm_err(&tile_to_xe(tile)->drm, "PCODE Mailbox failed: %d %s",
> > > +				err_decode, err_str);
> > >  
> > >  		return err_decode;
> > >  	}
> > > @@ -69,7 +73,7 @@ static int pcode_mailbox_status(struct xe_tile *tile)
> > >  
> > >  static int __pcode_mailbox_rw(struct xe_tile *tile, u32 mbox, u32 *data0, u32 *data1,
> > >  			      unsigned int timeout_ms, bool return_data,
> > > -			      bool atomic)
> > > +			      bool atomic, bool probe)
> > >  {
> > >  	struct xe_mmio *mmio = &tile->mmio;
> > >  	int err;
> > > @@ -95,19 +99,20 @@ static int __pcode_mailbox_rw(struct xe_tile *tile, u32 mbox, u32 *data0, u32 *d
> > >  			*data1 = xe_mmio_read32(mmio, PCODE_DATA1);
> > >  	}
> > >  
> > > -	return pcode_mailbox_status(tile);
> > > +	return pcode_mailbox_status(tile, probe);
> > >  }
> > >  
> > >  static int pcode_mailbox_rw(struct xe_tile *tile, u32 mbox, u32 *data0, u32 *data1,
> > >  			    unsigned int timeout_ms, bool return_data,
> > > -			    bool atomic)
> > > +			    bool atomic, bool probe)
> > >  {
> > >  	if (tile_to_xe(tile)->info.skip_pcode)
> > >  		return 0;
> > >  
> > >  	lockdep_assert_held(&tile->pcode.lock);
> > >  
> > > -	return __pcode_mailbox_rw(tile, mbox, data0, data1, timeout_ms, return_data, atomic);
> > > +	return __pcode_mailbox_rw(tile, mbox, data0, data1, timeout_ms, return_data,
> > > +				  atomic, probe);
> > >  }
> > >  
> > >  int xe_pcode_write_timeout(struct xe_tile *tile, u32 mbox, u32 data, int timeout)
> > > @@ -115,7 +120,7 @@ int xe_pcode_write_timeout(struct xe_tile *tile, u32 mbox, u32 data, int timeout
> > >  	int err;
> > >  
> > >  	mutex_lock(&tile->pcode.lock);
> > > -	err = pcode_mailbox_rw(tile, mbox, &data, NULL, timeout, false, false);
> > > +	err = pcode_mailbox_rw(tile, mbox, &data, NULL, timeout, false, false, false);
> > >  	mutex_unlock(&tile->pcode.lock);
> > >  
> > >  	return err;
> > > @@ -126,7 +131,7 @@ int xe_pcode_write64_timeout(struct xe_tile *tile, u32 mbox, u32 data0, u32 data
> > >  	int err;
> > >  
> > >  	mutex_lock(&tile->pcode.lock);
> > > -	err = pcode_mailbox_rw(tile, mbox, &data0, &data1, timeout, false, false);
> > > +	err = pcode_mailbox_rw(tile, mbox, &data0, &data1, timeout, false, false, false);
> > >  	mutex_unlock(&tile->pcode.lock);
> > >  
> > >  	return err;
> > > @@ -137,7 +142,18 @@ int xe_pcode_read(struct xe_tile *tile, u32 mbox, u32 *val, u32 *val1)
> > >  	int err;
> > >  
> > >  	mutex_lock(&tile->pcode.lock);
> > > -	err = pcode_mailbox_rw(tile, mbox, val, val1, 1, true, false);
> > > +	err = pcode_mailbox_rw(tile, mbox, val, val1, 1, true, false, false);
> > > +	mutex_unlock(&tile->pcode.lock);
> > > +
> > > +	return err;
> > > +}
> > > +
> > > +int xe_pcode_read_probe(struct xe_tile *tile, u32 mbox, u32 *val, u32 *val1)
> > > +{
> > > +	int err;
> > > +
> > > +	mutex_lock(&tile->pcode.lock);
> > > +	err = pcode_mailbox_rw(tile, mbox, val, val1, 1, true, false, true);
> > >  	mutex_unlock(&tile->pcode.lock);
> > >  
> > >  	return err;
> > > @@ -154,10 +170,10 @@ static int pcode_try_request(struct xe_tile *tile, u32 mbox,
> > >  	for (slept = 0; slept < timeout_us; slept += wait) {
> > >  		if (locked)
> > >  			*status = pcode_mailbox_rw(tile, mbox, &request, NULL, 1, true,
> > > -						   atomic);
> > > +						   atomic, false);
> > >  		else
> > >  			*status = __pcode_mailbox_rw(tile, mbox, &request, NULL, 1, true,
> > > -						     atomic);
> > > +						     atomic, false);
> > >  		if ((*status == 0) && ((request & reply_mask) == reply))
> > >  			return 0;
> > >  
> > > @@ -268,7 +284,7 @@ int xe_pcode_init_min_freq_table(struct xe_tile *tile, u32 min_gt_freq,
> > >  		u32 data = freq << PCODE_FREQ_RING_RATIO_SHIFT | freq;
> > >  
> > >  		ret = pcode_mailbox_rw(tile, PCODE_WRITE_MIN_FREQ_TABLE,
> > > -				       &data, NULL, 1, false, false);
> > > +				       &data, NULL, 1, false, false, false);
> > >  		if (ret)
> > >  			goto unlock;
> > >  	}
> > > diff --git a/drivers/gpu/drm/xe/xe_pcode.h b/drivers/gpu/drm/xe/xe_pcode.h
> > > index a5584c1c75f9..688eca8f24e6 100644
> > > --- a/drivers/gpu/drm/xe/xe_pcode.h
> > > +++ b/drivers/gpu/drm/xe/xe_pcode.h
> > > @@ -18,6 +18,7 @@ int xe_pcode_ready(struct xe_device *xe, bool locked);
> > >  int xe_pcode_init_min_freq_table(struct xe_tile *tile, u32 min_gt_freq,
> > >  				 u32 max_gt_freq);
> > >  int xe_pcode_read(struct xe_tile *tile, u32 mbox, u32 *val, u32 *val1);
> > > +int xe_pcode_read_probe(struct xe_tile *tile, u32 mbox, u32 *val, u32 *val1);
> > 
> > Is "probe" the right condition? I mean, the right name for the exported function?
> > 
> > The caller is deciding to downgrade the Illegal command from error to debug, but
> > is it because it is in the probe? Or because we know that most of FW out there
> > might not have this command yet and driver knows that and will handle the
> > lack of backward compatibility properly... in a way that this is not an error.
> > 
> > But is this 'probe' ?!
> 
> This is following Ville's original comment[1] as in 'probing' for something
> that may or may not exist.
> 
> [1] https://lore.kernel.org/intel-xe/aQ3xItyGMVnKdzoi@intel.com/
> 
> > I'm bad with naming as well, so asking help from AI:
> > 
> > Alternative naming ideas:
> > xe_pcode_read_optional
> > (Indicates the command is optional and failure is acceptable.)
> > xe_pcode_read_safe
> > (Suggests a safe read that won't break if unsupported.)
> > xe_pcode_read_tolerant
> > (Highlights tolerance for missing command.)
> > xe_pcode_try_read
> > (Common pattern for non-fatal attempts.)
> > xe_pcode_read_if_supported
> > (Explicit about conditional support.)
> 
> I don't even begin to qualify here so it's upto you all.

Ville, thoughts?

> 
> Raag
