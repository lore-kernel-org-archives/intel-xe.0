Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8BC8C3DA7F
	for <intel-xe@archiver.kernel.org>; Fri,  2 Aug 2024 21:38:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C83510E0D1;
	Fri,  2 Aug 2024 21:38:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X8ifzfP4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38E2310E0D1
 for <intel-xe@lists.freedesktop.org>; Fri,  2 Aug 2024 21:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722634735; x=1754170735;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=tHJB4x+IzyxcqVWkAeY73IByN7T1dyktLVky6q7zzVo=;
 b=X8ifzfP4ft6pclYwNUTVGc0yBr+i6+73aOi5PRyJiPCh1UAVvObtMXpn
 kZ8WZTTUnzLPicuVNCIdybZrJPzt89SGvJj6M1UfR3Hi96H5/XaP2/rjA
 iny56V/ISnJCI2P2lru+itEQvqKY0ATtb8hbSTb+ZKneqKZPqD1EPAovu
 XKF4wdBI5k4bAzm3IJ5Qysub8zsQuWJScpZHRS7QnltXHpfkaCT6nq8Ge
 udZT1LpjmoZRN56TwDFb24RarZL6Voer1ihe4MXPx1RVU5HSGOzaogfGo
 ekoSM6aODEZ/jvyuGyCF/pZcU286OgbJEjRxm+3F805Tk5pmOWlTOO5fQ A==;
X-CSE-ConnectionGUID: ZtTcdBScTeKErIfwpzq1BQ==
X-CSE-MsgGUID: yMBhSYqwScmLkWr5x8wRRg==
X-IronPort-AV: E=McAfee;i="6700,10204,11152"; a="20833332"
X-IronPort-AV: E=Sophos;i="6.09,258,1716274800"; d="scan'208";a="20833332"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2024 14:38:55 -0700
X-CSE-ConnectionGUID: E28v4WEXTbK98BHsMELOSw==
X-CSE-MsgGUID: gtQU+pSWQ724r08IScDqQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,258,1716274800"; d="scan'208";a="60373664"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Aug 2024 14:38:55 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 2 Aug 2024 14:38:53 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 2 Aug 2024 14:38:53 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.48) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 2 Aug 2024 14:38:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wzl7BDGaFu98U3LrtacwrTDscM0Uw0V0zreEL/YP3Id513WMnGtHx6W9q2OBLsupgvamrXhTn84GXicR6IQuxlB7Pr7cXSWAZz2ocHF0KHEB0jzLkNgG5eYC+JgHMKZq+FP87WDsa48JNHsKFw/3WeAPrkgdn1sX0BOVTW36cXNJTs2x+MBcLbQFGMpiuRS5K61gXR+8T499DbohXhWM01yG/5km1xbVBvYw4ANQcJahe9IjthrFzkSOJbdh1z9PAxsiPwYEgToT1UhE4B5kf4sWqiV5QNGZWN1PTlLsLV1+DRtdEW44MSmWdUKD/sh4k0Hn8k3VlFUTIs0putMBmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/eaGn/Q/VU75QMQ06iHs9/cbr5/jVfsSgXeyqUPny4s=;
 b=i+pYb6geG83JK0K5w4k0mQzyz4dBHdQguA04Zh8kw2Aue//yszyKx0dVzBG15PUk5XHYYz+1Depxq/0cK1DyTryJux6MRCgLe9Bd7+HH22iJwADZLzQ1WAUkJrdcFCj4m6f5J++rZfYlLbL4H98ttNnXsd6KDhBV7xImPJ7wZEZy/7+YqEpo7STHIGHlzHJITZqhOK1KWd+BNg5U6wo3b7q575mkV1S0bKu658cyS9gFLfYoVcSQh5W3fSnkJaN4S8217vv7/ji0On0wry0hqFjEx72J1E+uWi47Rh5ExYLzaOuupQout/+NhJyFKC+yW3cMpnuiPZ7jUbEYOCSbmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by LV3PR11MB8601.namprd11.prod.outlook.com (2603:10b6:408:1b8::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.23; Fri, 2 Aug
 2024 21:38:49 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.7828.024; Fri, 2 Aug 2024
 21:38:49 +0000
Date: Fri, 2 Aug 2024 14:38:46 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <tejas.upadhyay@intel.com>
Subject: Re: [PATCH v3 1/1] drm/xe/xe2: Introduce performance changes
Message-ID: <20240802213846.GB5091@mdroper-desk1.amr.corp.intel.com>
References: <cover.1722607628.git.akshata.jahagirdar@intel.com>
 <c2dd753fdc55df6a6432026f2df9c2684a0d25c1.1722607628.git.akshata.jahagirdar@intel.com>
 <20240802212850.GA5091@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240802212850.GA5091@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: BY5PR03CA0023.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::33) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|LV3PR11MB8601:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ffb4bef-df10-4a50-1cc0-08dcb33b7ed2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?jykD4KI1fQ7XQxbao3sU6WHztZVWQL+/Y19dWqbgX4HP9KFZw8jtTl9D/WoC?=
 =?us-ascii?Q?PHtCKIpvZYvILjs9wxVFTnWLNUSs93A4Epoe/JXYS32gZLIPpH/CW/819bkv?=
 =?us-ascii?Q?PobJPSKI5KKRrNZGiYZ+QBusiK9FnPZr2xKFLNUvmCqpc617FIWcg2mn3KKl?=
 =?us-ascii?Q?+FGzVd1RJZB/2wv0+eedI1jphUr4XutZQYcHtuwsysxZ2NvR0GppccmM/LQs?=
 =?us-ascii?Q?zt1EsZkizhlOgytZzFkOfLx2IRE2TIAvd441cU3eoe4pkNCOz4EPG4o/GEMn?=
 =?us-ascii?Q?+mlXfS5N5EOKxZDwPE5xP6ZtWu9DvuHyd8PmXF9nc3UXjOojcrkBrNfyhPdC?=
 =?us-ascii?Q?XJFbwZ0WCJvEYRcX2diqM2sJ7s+iutSLZo1PqjEBREsk7AcqXnMptVWLKjEw?=
 =?us-ascii?Q?6fPajY+Nk73zdGFf6pe4suHtrctcu+Lj3OHeBPgxssczdCNyJPPQVNpyQ/iI?=
 =?us-ascii?Q?fKhn90wVs5Vw7KphSvk6MCaDoXlARXPVd4ZF956VPFbXZkJoRN8k6I891Rdn?=
 =?us-ascii?Q?iopQrCzheWzbruF36g21X4IO1Lm+CmzJ+I8op6WxuVS0pGCOdrMkfbiYZVOd?=
 =?us-ascii?Q?cjA6rnsvEjgoHzaqzRM/hNNa5NON8bX+UvBHuw+Qm7vcKX35yiqJTFQE1vtG?=
 =?us-ascii?Q?buEXsZuvFsyh+LViicP8dr5ctAm6ArDq6wolpGgK7VXX0o61dQn8jyaSF8Lt?=
 =?us-ascii?Q?STJOoHpdbU+naClfFjo41SGWJrAGaG+paD6XlTZfb7vE54hoGJxIxEqAJiKd?=
 =?us-ascii?Q?4mqAYtzRq32coau4v6g2d01QXtfLJpmJfvsSIZqEhi7s4DMC7OcVF78CqvRm?=
 =?us-ascii?Q?+yc7gWMG81vZFblCaBBGe444IkFz5ngiuzXPOq1x7yZOLzLgEohkGFDojrTp?=
 =?us-ascii?Q?Ji3Dtu0M8OuGYN2Ac/cDCdz70fuBUx9u+nUQ2dr3Nu2ZZUUp1vAR1IRF/DnP?=
 =?us-ascii?Q?q//0WccQ/xBY9VM8BjK0uNVhHS6tVS+E2KJtLvseu8b+J60eGW9KZ8x2MS6E?=
 =?us-ascii?Q?KpKy4PedGEMGZ24dDn1zrhaRAWe2MKtjA+4Rleu2K+PdrwDlVWlvvvYiFnZF?=
 =?us-ascii?Q?bKJCOlZIQCSCDILDBnd8glkUNAtrDt6u1vbgcLehIOcxj8uTcLqE91xXI9sV?=
 =?us-ascii?Q?MJwrUxYRywnp1+2qQ0i24z+a3hvIPTSAJV/LGglTsBwZGEA1I4Sx4PlAOPno?=
 =?us-ascii?Q?9EpxB+JCj9tmPqI+Vmr5KE5ir6+eq+De4amG0yXSgX2VVv8s6B3vImsbsr3T?=
 =?us-ascii?Q?S4LauQkg3Mi8VMGP23cFlKiqwf3SbAs4nJNjCWSG0BPm0Z52yB7KYIBwk9Cy?=
 =?us-ascii?Q?vT38K+S6xziaKRvdzHGAIotqs//JQptANZXiaaXM+xCADw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3l+Tjn2mwcWMBk+q4mUQ5qAlwRo4IaT7K4QhAeRmLPgOxlTcRIMKyQmL+2Wj?=
 =?us-ascii?Q?TleidF0LJi6XbSzLAJbOFeHfY9uaC7Xrw91SvOhzBG5Sn1aq5tbwJxgle6ak?=
 =?us-ascii?Q?781McRBdMPM9GCXv4v3btfh7+RZDBrQSNL+2KpblxwiHfg906ygjkNu5CsyJ?=
 =?us-ascii?Q?pkOly768vuz0Q+vN3O53/QKCvgbmPHHPF0ZkQY879KTtC1QO4TYsxWIndQYc?=
 =?us-ascii?Q?ox60v9DKSJHPJ1jbDs+s/UBjzQRlZntdrvPwGjmBevtn8EvVyfs31/UEAlS/?=
 =?us-ascii?Q?B7/NrTwi5StHa7T/jcsdBhmE3QJBz8qG4R/qRCs6Ihfajl5OP+ifMdRmnMLP?=
 =?us-ascii?Q?vHzggzfYuEW4CCS7sTrCrCISNKsSt00NYm0AdMXrf9eyqn+5FJ63abbw7Kn6?=
 =?us-ascii?Q?rCxrtqwhmQnt10feg38BOWMggkAUbN+N61whCwQ1D2AChe1qif/uc1VPFJbj?=
 =?us-ascii?Q?UnhNrhK0FACBEvtBkszFwweDL983heRy6a5wQ7l6lpKdsCjWGVBPSFegZ/cW?=
 =?us-ascii?Q?z8pb4EWF4NMIxLQTGqTEZwWyk4QOwY7gpnzubFttM6m8g8zNF0NQZyu92wQJ?=
 =?us-ascii?Q?BrBBUBV2xdB3LAopYqI2S/IBEWaRN+8AD+G1ATwyT8Rne4CAQqyJP3yTib3B?=
 =?us-ascii?Q?lDiahB9u4HUfY1QGxuF9LmXAPl7tFiXnOyNAIfOgwxxgMdK8zv1wOQB8RFvm?=
 =?us-ascii?Q?YIHaLeURxP+i1NWUEtCDU/WSkgkoq6omHaFy3+qupnanw/Nhk+HYfZX+atH/?=
 =?us-ascii?Q?3qrRlti/Lz4FwGxsaUhve3H7bWMdA9FiWPrQcYlu+uO8TDpRWCDrN83Qo+/1?=
 =?us-ascii?Q?KDPTVy5dgtc+J5Go/JfczADPtP/T1EewvVmGeCCdlfMjrSe/IUD9F47nJiBm?=
 =?us-ascii?Q?pcBPGBX4rFyZHacbxaKX/umaJC4kWqFYTZ9BSPPpoJgGuFrkouSSEmpbxmtt?=
 =?us-ascii?Q?38EfpaeNqY6IOvOvMRXl8BHDNDxV4hNA71MdBVUnrhZha4dGbUUSadje1G1H?=
 =?us-ascii?Q?oN2Hsybq2vczj1BPkFF9hUd+9VtBW3JI8sOQmMbI7mpNSuc8cd8WvbZo1XsF?=
 =?us-ascii?Q?88KGDW4CUQnRaCTkIcUy9M98b9hjzr1Ggl/WQYRfah95wPZO5ubzASg3KZwE?=
 =?us-ascii?Q?jFEwR24Bgs2HWDf+FJTikH2aiqwY22MagEG91aT0yB9IUTFxIwC6UorUFfUc?=
 =?us-ascii?Q?rYXZedPMMbkybO49DbCNUtc4ymdJfOCVbto5qiHPRC8ABsZ3tBuAEamzwdm/?=
 =?us-ascii?Q?uBla45UPF0Ru0yn/cHJ2iWTE5iGt6KLBSBzlL4NwthNtcBVRbgVikp0PnBk7?=
 =?us-ascii?Q?sQEOSKujYMHpXMBmXtLo2li1qsy199PwQ0XPv89yMS9LTQfLR3WxHlK/kIIS?=
 =?us-ascii?Q?A04d1lrvC59XwjS/X1IjXJs1fBCrl+kL3uXvtP7B93x5Fkj4zn1Dqz27c6yP?=
 =?us-ascii?Q?8ceeX20XzeriU6OpNvCOt52kbqaOsoWjmy1I0kcOvSLcTM26iDfhiORYnlyM?=
 =?us-ascii?Q?VKpYtJ7MATZ4Dk1sa8eOO0cTafYWHBditABWVX9PnF+lPqsTWIW56Ft/9tGZ?=
 =?us-ascii?Q?XC774nuHaAQnD5vShcZ19CYBIi7LM9+xanY9WoARNhDFETTfqd73fup2Ov+m?=
 =?us-ascii?Q?mw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ffb4bef-df10-4a50-1cc0-08dcb33b7ed2
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2024 21:38:49.3001 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2d5JCJ1C5od3qrvCB6kPUHXkaN+kJaONLQBHW6+YChIv7FzmYDqOBHcMcnjdHH2KleiZ0RMI3IFnOurvlb82aHOHqCvyHc8+D3fQ168Ksj4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8601
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

On Fri, Aug 02, 2024 at 02:28:50PM -0700, Matt Roper wrote:
> On Fri, Aug 02, 2024 at 07:12:03AM -0700, Akshata Jahagirdar wrote:
> > Add Compression Performance Improvement Changes in Xe2
> > 
> > v2: Rebase
> > 
> > v3: Rebase, updated as per latest changes on bspec,
> >     Removed unnecessary default actions (Matt)
> >     formatting nits (Tejas)
> > 
> > v4: Formatting nits, removed default set action for bit 14 (Matt)
> > 
> > Bspec: 72161
> > Signed-off-by: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
> 
> Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
> 
> 
> It looks like there were even more updates to the tuning page today.
> But we can handle those as a follow-up patch.

...and applied to drm-xe-next.  Thanks for the patch.


Matt

> 
> 
> Matt
> 
> > ---
> >  drivers/gpu/drm/xe/regs/xe_gt_regs.h | 3 +++
> >  drivers/gpu/drm/xe/xe_tuning.c       | 5 +++++
> >  2 files changed, 8 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > index 3b87f95f9ecf..c50643ab4c84 100644
> > --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > @@ -367,6 +367,9 @@
> >  #define XEHP_L3NODEARBCFG			XE_REG_MCR(0xb0b4)
> >  #define   XEHP_LNESPARE				REG_BIT(19)
> >  
> > +#define L3SQCREG2				XE_REG_MCR(0xb104)
> > +#define   COMPMEMRD256BOVRFETCHEN		REG_BIT(20)
> > +
> >  #define L3SQCREG3				XE_REG_MCR(0xb108)
> >  #define   COMPPWOVERFETCHEN			REG_BIT(28)
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tuning.c
> > index 77d4eec0118d..3817b7743b0c 100644
> > --- a/drivers/gpu/drm/xe/xe_tuning.c
> > +++ b/drivers/gpu/drm/xe/xe_tuning.c
> > @@ -45,6 +45,11 @@ static const struct xe_rtp_entry_sr gt_tunings[] = {
> >  	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, XE_RTP_END_VERSION_UNDEFINED)),
> >  	  XE_RTP_ACTIONS(SET(L3SQCREG3, COMPPWOVERFETCHEN))
> >  	},
> > +	{ XE_RTP_NAME("Tuning: L2 Overfetch Compressible Only"),
> > +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, XE_RTP_END_VERSION_UNDEFINED)),
> > +	  XE_RTP_ACTIONS(SET(L3SQCREG2,
> > +			     COMPMEMRD256BOVRFETCHEN))
> > +	},
> >  	{}
> >  };
> >  
> > -- 
> > 2.34.1
> > 
> 
> -- 
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
