Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A27AEDE99A
	for <intel-xe@archiver.kernel.org>; Tue, 10 Sep 2024 15:29:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDFD810E85B;
	Tue, 10 Sep 2024 15:29:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FlShNOwO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C09510E864
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Sep 2024 15:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725982156; x=1757518156;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=LgI3HzFHnLvqIlZwkYYLWjTkXwTfZuIJ/5I44ckeZ+E=;
 b=FlShNOwO2i3wD7EtPoc0LH1RJE1cHCqz6ToF4NRtT0tflTpHcCkQwmHr
 6qDeBwfexoBknZL9pZriuyMx0u9nd3vLIaNBIZVtGuUCzZ5YGfIiJDGw+
 4/Z8UyGVyObVGt6ppKk2CY2Tpw+mL1aHeExdBwrf+NdkZTlVVdqfC8lXK
 9r8J/2ixfrbuhAkzq9WzZfzRXkwSPBY3YqFTIgH9GgshKGs/tfvCSoFq5
 Zfbj1ieVC7uOgTEv7c9wEkPXGJkg56NjJkQC2WHbBVaPT9/0HVn4Nhq8W
 YnG78/AjHuJgPqW2X1CL0VAWgP3948kHSrNtfXIejsxUssLr0L7cLZk1w Q==;
X-CSE-ConnectionGUID: TUkKHWYIQ06S8V+HcfZZiA==
X-CSE-MsgGUID: /ROPDWkiQOyvgd72UGZ+RA==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="42212844"
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600"; d="scan'208";a="42212844"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 08:29:03 -0700
X-CSE-ConnectionGUID: 3rvIbuuHShCIengPflOw7A==
X-CSE-MsgGUID: 6e2YUapQSDeode2zBnKhtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600"; d="scan'208";a="72043683"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Sep 2024 08:29:03 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 10 Sep 2024 08:29:02 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 10 Sep 2024 08:29:02 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 10 Sep 2024 08:29:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hg2Qv1uLrLvl+lwzZMkyZhEU/T1CXgWJipsboCGyxX229Pw+7GuYwlz1C6GJ5QmFMvJcvjQJuHeC1UoXt8ycaGVWgKIKV6VzQ8NIxxvXAOUEcZbMIVJSDLbZK138HIlNCiKJVPkL9D4H6+6K1XO7z8o18oADGK98CGtSJqtujQMtkvuic+jJnj9/QRMLEAmsUOsNEIXKkAdI1OgJOdfPfnawjT6OYIU88dKwTgBa9dpjMwTg/b2S2QAVMomj2qz+e6U/nE9VbRtA3BwVXZ/pUJetgI88PUYNm+RIkBvB6BEE2Iu+COrD5LODKbSM53sC6HCD1miTVKgMJyfjHZG5jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xolfQKoO1kXyzDq67W1Ib6nA7CYklyMzLZOdsTiV1Ns=;
 b=bRGTP0/Rd1EqxyIaA25W6bYsp5+86ikdYz+UWtFnkaOs/helTOA81lwFySXCCz8HW1qTUjeGG/tJTRDXNuaZ77/eiWaAwffzqh25dRTsj0jU3BhX0p5ITVAKUzR9Qj3QrQ68kis9yHa1aiUcL7QvfoosrFo7bZ17TVSelFFRNONt+mvpRH5jlUFaukEKIpj4XIGDOHw41ciSR82oiDUMCUNM+KMybBvziRzAXk2z0/PvWXJ8/gtxxHSRt9rKUVXp1HsS2PkvVbLZeq/NV2PNpCDMwrrjubMMwaUCIV+npLApIZ+Ryw/hHia78JXFnpHkvw6FSO8TilCl19DI7cFKQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA1PR11MB6490.namprd11.prod.outlook.com (2603:10b6:208:3a6::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.20; Tue, 10 Sep
 2024 15:28:56 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7939.022; Tue, 10 Sep 2024
 15:28:56 +0000
Date: Tue, 10 Sep 2024 15:26:42 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Himal Prasad Ghimiray
 <himal.prasad.ghimiray@intel.com>, Tejas Upadhyay <tejas.upadhyay@intel.com>, 
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH 4/4] drm/xe/bo: add some annotations in bo_put()
Message-ID: <ZuBlMnY/F736DbxW@DUT025-TGLU.fm.intel.com>
References: <20240910131145.136984-5-matthew.auld@intel.com>
 <20240910131145.136984-8-matthew.auld@intel.com>
 <ZuBccDRC0NkcJsux@DUT025-TGLU.fm.intel.com>
 <7c417b69-1730-44b4-94d6-cb86a7a5d981@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7c417b69-1730-44b4-94d6-cb86a7a5d981@intel.com>
X-ClientProxiedBy: BYAPR01CA0052.prod.exchangelabs.com (2603:10b6:a03:94::29)
 To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA1PR11MB6490:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c462326-3c54-4d5c-6451-08dcd1ad4920
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?aSOLoWGR2t0x0dSDLL+Y0DC8rZItjihVzKltbfr+rn5Xg2aIzli4G96dhm?=
 =?iso-8859-1?Q?enQRIHhzqn0fapzVvGkCQUC6Pcq98gd189ISlA79zjz2aJbWMjWpH/46qi?=
 =?iso-8859-1?Q?/inTBwO5UtaZe2RXjhtvfYMxnMXLTm69N6PQMrLJrOooH/zhuBLahQgVq7?=
 =?iso-8859-1?Q?FK1Up3abPKouVnxg6VJ42wbKWmc5CPJc9BRv5hIIh2AteHXFJjX4RA67Se?=
 =?iso-8859-1?Q?lSFFpcW4/jfmpv8ntIXIxQO6LSS9XHD5eycZ79qu5ZNwgAxVwdJ2OVtaKB?=
 =?iso-8859-1?Q?I3TWAB+dl5A7NA7goOx1f0ojw53liNeDY4vH53RbuEYR3w1oBJ6eG71wl4?=
 =?iso-8859-1?Q?0Oa1UBKSHcmuJRdo4XoaiOXTLAoczZpUzfDSybJGaKW81NewY0Pqysjik5?=
 =?iso-8859-1?Q?mgi9RXaaZ7o4leM2Otdp9xRGffQlhaVhJmNFBTtD3tbcpwXjqFIGPg56H9?=
 =?iso-8859-1?Q?jA/GovPP62OInt2mou5GyFhuMhgheXuAfg593TXUJNI7vPcjE7e5QBXvHl?=
 =?iso-8859-1?Q?tN192Yq+ICzxFqO41oykWqy2v9iQJYARTfRx0uFaVixXFDQ4/Eq9XXw6nB?=
 =?iso-8859-1?Q?2cOyysA/6tbGsLad8CphIYW9KGmwCRlWbDmFb0eyQsmy8oH9FpgejF1zs2?=
 =?iso-8859-1?Q?ZeSX02R3jKo5S7lI3/BWS+yRuXKuBTM4YDIEG6q7W0+ApLyfcYlQ44obsA?=
 =?iso-8859-1?Q?O+qWrZ6BIKQ+v/gx6Utsys449SGS5v7PnN63Y0h8vKfPVkUJF29H07EU7S?=
 =?iso-8859-1?Q?rWkpZWN60d6jpqijbek/DooKZnQVsFkZ/nTlpETWGE/+6aboSSId9vpUU9?=
 =?iso-8859-1?Q?Oogt1d1HLQ0Of3ayZElVvklXUFnIhlwhZiYBNZkdSwyPHQcceZrCikdRkS?=
 =?iso-8859-1?Q?Xa+/rnMeZmPEriF7MI2rWP6W7HpK/zxYeBzsjLP7/baGoMTITro7bjR1qH?=
 =?iso-8859-1?Q?7yTiSAbhd4xOzlIoqPDqjBiB+kx78siBY9v4v3C7kzuTxEHMzjN+WfYDbu?=
 =?iso-8859-1?Q?QOMKz7Iq9GOC0G31U//YtCOEUv8dyWmJYI8ac8fqi7DI5YccZMC6uQMNGC?=
 =?iso-8859-1?Q?q/l3xENqkP4yOCeczoW0m2n94jNI/8HCOqsp5mWqsfiILKHbYGJXeN6uXy?=
 =?iso-8859-1?Q?msc1rWXRHlZzwEAOSms4a60vNQVWGTps50ZN8bE+tGbg7NKrNUcwxtcDS3?=
 =?iso-8859-1?Q?SqVHM6iYresJZIUnQ8eDBeeH6HEZDh9ORlRDl2Ot458nJoJi/RLqsfOTQu?=
 =?iso-8859-1?Q?EjpXdnvb0pB67St04Fl0fEAewd/wH7lkGXy6quzOtFLt1iJFclfaPtgzt6?=
 =?iso-8859-1?Q?qHdH9b7NL+liy/MKT3gSQrUHSKU4SIWTzN/TAIyCrM6l0cqU554XppfFg9?=
 =?iso-8859-1?Q?ssX7Cye3OzLoCKJwhXG8h84J2O7EN94A=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?NlyIov1DwNalTDPEcFdUf2NT11FSXQk5SwL/0ALmDKI1sKDRuM1XZTczDr?=
 =?iso-8859-1?Q?tUn46d7TjEjYgEMC1Rl1XGDAirqU1FCTD8T/mXktCZzBrADjf72WQ2fg9R?=
 =?iso-8859-1?Q?V7YJof1cQlyPt0OnYMgnjmaLYZyt83KeIHTp+f5Q31ZD2pgSFfWNhOE0jC?=
 =?iso-8859-1?Q?s2z7lOov5NvhXCs8AzFG2cAfaHtcjj637fX0wlCFU5VwxfgwkiYFxoHhXO?=
 =?iso-8859-1?Q?KmKGvVpMXYblYMa0dyMlRjmDxwFjavmeX7LOM1cHAW0MRC0TB761yqyy3Q?=
 =?iso-8859-1?Q?K8z+yELIqivrL5y/m9ynQZV9dDfhUn2wIqIWpAvo9U3tAu5eOQ2AYcoq3q?=
 =?iso-8859-1?Q?wI9GcN2FSqMFU2JSZpAOdoTzlC8DgsWxrYho8WfsjJzWOakPr/INNlRLc5?=
 =?iso-8859-1?Q?4To/0TKRNVcMnpBx8LoCUmb/W2Cbhiksh2o8elvfhTOKFYzUacFKVH9/+O?=
 =?iso-8859-1?Q?vnY/XUdkmtvzq4CnCEJKxASuCte6ntjLWZEooj+P7DrRuX6nRz0OLZ5mAq?=
 =?iso-8859-1?Q?rGVXysSkakYF5J2h4xFYBppGBY7azGASyRUE2sJpFG+sLRpbuKV8bjazQt?=
 =?iso-8859-1?Q?pGgMfXbDYtj2yjEpAHm6d3Flo/C09olfpCWaCpBMBAruRk4ZeXE0xW1nWH?=
 =?iso-8859-1?Q?zZsR48Pwi80P2+rL/s7scb8QSP4nLdy1b7Je4R7Hs3VXDInDnhWAoKUhkk?=
 =?iso-8859-1?Q?DJhh/Lu83xbyEgznIjZOCBFI4RsTE0ZVTbtvtiBKDas23r+EU2Cb3MR84m?=
 =?iso-8859-1?Q?P1oglWwHpW4Q7VWw6yxYRGy8nKnlo2gdPw7Tfhp/ZO5vD/ndGYW6DrgMmi?=
 =?iso-8859-1?Q?2JyCtzVeVq8kiesiG00VXl6JljV1eGRX0VYw4L5B7pGTnXQXBXSv4vabVn?=
 =?iso-8859-1?Q?L4ejyHlEBeqzx+1uDCY+KVSRU0+XptQHNFqR13ywGDWw0HXc8RinjJItnh?=
 =?iso-8859-1?Q?HNcFTz6GH3yj/tDFAmTA4DSQU85gRHWBhiBzUHXtJ992Hou3bCqeoPN3iZ?=
 =?iso-8859-1?Q?StWzt0cEPHYlnktJF11lcB1Z+pQPOv530we4uU+iGAPnKdR0OZkJhz/TVD?=
 =?iso-8859-1?Q?R9INz6tCysLq55CVRXTXpgpemA3DFJXZerNj/5EPaNgdifVKk+99jq6i1/?=
 =?iso-8859-1?Q?uGAAx+ANDhybsHq9liFdXfXjLOh5zPE95vP0aJvcqkh2DroG6+7geRCrEx?=
 =?iso-8859-1?Q?5F5Pwjsd7L7lu3ffQCYNSKjwCzC9jnOf8AOWEnSxUR/lTXxjywj+5C99hh?=
 =?iso-8859-1?Q?6eM15vofD5qYSK35GWz9e2/bFdBs0gAkEi5plxwXY8/JyciIwbZo3k86Xh?=
 =?iso-8859-1?Q?9rB2/O2aVFCrAlOgIp8SbrArcaHJbO4Db8icpUw3+5SmNrym1gHfZlFCbq?=
 =?iso-8859-1?Q?Zj5DMZxIJDkAmBSKvjlVyV+swJAADPBkupi3drYDs1kN39hsQS8Ym68y8a?=
 =?iso-8859-1?Q?kKP9ebFhQfCEteU5N944UutU7ieyIFCQ6m+Iyp3gh9h72IXCO+Onvr8yXX?=
 =?iso-8859-1?Q?HxCKZwluKNMf3EkoUPIh+g+a7hIVQyl01IlSSCxBbF40pUVuUEnOufmvyH?=
 =?iso-8859-1?Q?ztm6H2q06QZi8tWC22dqBbFT1ktF05T67+Q+MwU5pCBFYwl3jCx5jnJBKJ?=
 =?iso-8859-1?Q?zEis3P2EiOa6Gnwvz3J/4LxrCYuZcD75PNJEH8pdB9oHHwuViK1x7AfA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c462326-3c54-4d5c-6451-08dcd1ad4920
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2024 15:28:56.7389 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0gQrJeaF3jMeZ+F18xnansyPVjkAd1jthF6qcx4FKdj+9l+0T0RCt9Qm8lyqD6RVQ4CMYo2ON4yWimjveQXQpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6490
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

On Tue, Sep 10, 2024 at 04:03:58PM +0100, Matthew Auld wrote:
> On 10/09/2024 15:49, Matthew Brost wrote:
> > On Tue, Sep 10, 2024 at 02:11:49PM +0100, Matthew Auld wrote:
> > > If the put() triggers bo destroy then there is at least one potential
> > > sleeping lock. Also annotate bos_lock and ggtt lock.
> > > 
> > > Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> > > Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> > > Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
> > > Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
> > > ---
> > >   drivers/gpu/drm/xe/xe_bo.c | 14 ++++++++++++++
> > >   drivers/gpu/drm/xe/xe_bo.h |  6 +-----
> > >   2 files changed, 15 insertions(+), 5 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> > > index 53948a965404..4176b302c38d 100644
> > > --- a/drivers/gpu/drm/xe/xe_bo.c
> > > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > > @@ -2320,6 +2320,20 @@ void xe_bo_put_commit(struct llist_head *deferred)
> > >   		drm_gem_object_free(&bo->ttm.base.refcount);
> > >   }
> > > +void xe_bo_put(struct xe_bo *bo)
> > > +{
> > > +	might_sleep();
> > > +	if (bo) {
> > > +#ifdef CONFIG_PROC_FS
> > > +		if (bo->client)
> > > +			might_lock(&bo->client->bos_lock);
> > > +#endif
> > > +		if (bo->ggtt_node && bo->ggtt_node->ggtt)
> > > +			might_lock(&bo->ggtt_node->ggtt->lock);
> > 
> > Missed this. We can take dma-resv lock too if we get into the TTM code
> > upon this put too, right? We should probably add that annotate too.
> 
> Yeah, I was also wondering the same thing, but it looks to only be trylock
> in ttm_bo_release(). AFAICT it will only grab the full dma-resv lock from a
> worker, which it does if the lock is contended, or if there are unsignalled
> fences and we need to wait.
> 

Ah ok. I was thinking about this in the path of reclaim, the does
trylocking make it ok to take a dma-resv lock? If it doesn't then I
think we need some sort additional annotation so the final put is not in
the path of reclaim.

Matt

> > 
> > Matt
> > 
> > > +		drm_gem_object_put(&bo->ttm.base);
> > > +	}
> > > +}
> > > +
> > >   /**
> > >    * xe_bo_dumb_create - Create a dumb bo as backing for a fb
> > >    * @file_priv: ...
> > > diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> > > index dbfb3209615d..6e4be52306df 100644
> > > --- a/drivers/gpu/drm/xe/xe_bo.h
> > > +++ b/drivers/gpu/drm/xe/xe_bo.h
> > > @@ -126,11 +126,7 @@ static inline struct xe_bo *xe_bo_get(struct xe_bo *bo)
> > >   	return bo;
> > >   }
> > > -static inline void xe_bo_put(struct xe_bo *bo)
> > > -{
> > > -	if (bo)
> > > -		drm_gem_object_put(&bo->ttm.base);
> > > -}
> > > +void xe_bo_put(struct xe_bo *bo);
> > >   static inline void __xe_bo_unset_bulk_move(struct xe_bo *bo)
> > >   {
> > > -- 
> > > 2.46.0
> > > 
