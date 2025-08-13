Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DBE4CA0EE0
	for <intel-xe@archiver.kernel.org>; Wed, 13 Aug 2025 21:19:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F410010E7CB;
	Wed, 13 Aug 2025 21:19:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mVFFMiWr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9E5710E7CB
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Aug 2025 21:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755119978; x=1786655978;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=7y62iHAzSUAVQXytSoZ17N1aTRdwwKJ5GzCaAVZqXbo=;
 b=mVFFMiWrg1Kk8smaGt6609HoUvd80mOBM3hXRqCfu47GPc4RPz1+xhh0
 2gkunpp13nNj/F5Y6pgggL10QxhJLW46cj5dxvFWR/iCSqaRRNPWCeDdD
 h6BRFQBgI+cqv6+dvyvUp73zq1gou1KNmV8ucT8z1ZkH1VH+cFMzuI0OS
 Frx3Hf0htVDQ6Cy5yOOyn4RD1WUt1YUYNlMunkvzVBkAA7vcxKkFMzSQ5
 YSrdHFlOLl2Jy+wThyCHiKffAvqUrpR+7cqjhdj1f1pp2VdbYhVP5W0+F
 o6Y+ni2/YA+gItK7BwzA5qbefE/u8LcKg9T4F0OhvhPaQMwSoPes65cdc g==;
X-CSE-ConnectionGUID: dKo7+Lo1S4iDN7UK2kLnFg==
X-CSE-MsgGUID: Jr43hiuzTr6C5bFl+10S9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="57332761"
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; d="scan'208";a="57332761"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2025 14:19:37 -0700
X-CSE-ConnectionGUID: wylIz7vaQveT9zT3T3cqag==
X-CSE-MsgGUID: c3W+1/JORbacIy6XX7+K+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; d="scan'208";a="170783341"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2025 14:19:37 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 13 Aug 2025 14:19:36 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 13 Aug 2025 14:19:36 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.80) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 13 Aug 2025 14:19:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ynWRJ0pPvlIMgGDHBeXU1c9jO9ZY5+YELRleFGZ9VD9YH7+Y2ST4IX37SthLFYSxYphoxh3+PPgaZCLOOXOw0GIMNuk0YXjFepseXSiESUBe21TOoMCnJd+kDTjCDXk9r9pVxdHM/MRWwrtrFPE7JXUo3vFPTvz7b09i67wFzxrfRdIFMW2/Q5fvgAaw5sFkEK5J8rT/tFvr2cn5qC89l86zqAA25yxvPM4ywMtCCTW1/nOkD3YCn9qjrXmQ/Ean5xBZRlBkeTATR1Fx0aO+f8IkbjTvcbZ5W34iy2i7tHWSxVOphA0s+KB/UxmVfq15NM7669iGbzA/ydVtjwMFWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BgSgskCz6YlqyOruwTNMIGxQiKtjoUnD45KadHl7uTM=;
 b=KX/8hN2nGymdkHFnJDQ1xiobd/3ok052XcREi0WkHsl/MMkBjwz4uvKtnYFVdd1ip0TKH8LkygroCnjeJEbJKrU2HrGSERZon/QrY29vSEMKP2rgF86qF4FnHdnmhwuSXHjrF0iA2bcw1Qe0jfq4UPG1dZDlo9HCSQMzjhNCfpsMz7c1unA987UuPyyKgO83Evzlq1Mz/k+FZhUv4xF3FJ5sUERq61TPFloFA1qytca36771ptD2Ta5Ap9Vf0pMRdEYLtUBsB0mT1WNZ+IfjzGWGaSz0jZjhihChlrWFcmhKd/2JDqcETKUrnPLbjEqVeV++M0M0HGgi0achDt+dsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH0PR11MB7167.namprd11.prod.outlook.com (2603:10b6:510:1e9::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.15; Wed, 13 Aug
 2025 21:19:28 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9031.014; Wed, 13 Aug 2025
 21:19:22 +0000
Date: Wed, 13 Aug 2025 14:19:20 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: stuartsummers <stuart.summers@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <farah.kassabri@intel.com>
Subject: Re: [PATCH 2/9] drm/xe: Stop the TLB fence timer on driver teardown
Message-ID: <aJ0BWL5lxyIOjHvj@lstrano-desk.jf.intel.com>
References: <20250813194806.140500-1-stuart.summers@intel.com>
 <20250813194806.140500-3-stuart.summers@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250813194806.140500-3-stuart.summers@intel.com>
X-ClientProxiedBy: SJ0PR05CA0078.namprd05.prod.outlook.com
 (2603:10b6:a03:332::23) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH0PR11MB7167:EE_
X-MS-Office365-Filtering-Correlation-Id: 557a29f1-863e-46e0-d663-08dddaaf12ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?dwZFNS18Yumguo5JxZNV13kPhQ4zXZu3OiluZbSUd3JUKa3g8eIxrL6pH7bG?=
 =?us-ascii?Q?0zZe9Di+MhMVSqOYng7cNUkv839IE17xlk+SwvLO+feiJB4S1tOvoOGyxr4w?=
 =?us-ascii?Q?itjj6Mb/nSj7l10NzsUkFUqJ/D/KrdSFK7QOvjpeQn5TaXKLV1VCPwnlNOdm?=
 =?us-ascii?Q?reyPU4/38fN/NGooyB1xXQL/CUJH25bZKL3+nUXlceanNXts6XKfjD+i059r?=
 =?us-ascii?Q?Ulg9tS1bOPdBo2SIIhjzp1E0Btht68tFF0SpiNF2Wqh6X/sIP9pxPMzUE8aC?=
 =?us-ascii?Q?UnC9h15jQ2V6F4nSMmM3Iynnrptg+0GMS/Jw2QCDjMKYHr+hwZWgQuF/i9FU?=
 =?us-ascii?Q?D12ZdjxR+RmaHTmQXZdlPeZgLo1z8TcxYhDuTLZWDBiryvJWABovhl0b+EEd?=
 =?us-ascii?Q?DsKBykGfCIEWSzd0r3YBJ7+nPaK3tMiB7wXaYu+XhkWABrxrHP+SG3z1pqMq?=
 =?us-ascii?Q?1P5o/T1Fn+Dh48Vt1hDLVyv2iN3Yg64nHMTrS5+hrpzswJ5onIYeqPFfw3YI?=
 =?us-ascii?Q?R7J96L260UkQdY87gXQr8v+AbYET1lG1AKqOmBFp+mh0XPWXijLsGvcWgI8n?=
 =?us-ascii?Q?jhkFmoGVBcw7IdbTTF2vl0BvmCe0L+WoSgNYfYL0TwJ/jDoByBAqn+rTm+i5?=
 =?us-ascii?Q?5Uv3dcsE/mAOXmKdiEdR7wzGhiWyMGJcoktWOG7v5ib+kTVxlHGr4FyvOqDZ?=
 =?us-ascii?Q?MnvaRZ4w2sta1bGuvSEwqWBH792ocD3QP4Isyp7dDpWbvLnIIjL7ux66C8ha?=
 =?us-ascii?Q?PDr6ov6Ri0T6c9nrrPPoiiCPHhxk7lfW425WnX8ibhCadrnydb5axKZr3gf7?=
 =?us-ascii?Q?YMvBDEGOQNvNA7yIYHYpIksskBMjktSbhQQJ2L+Jj54C1Nu5PpECRJlAw3wO?=
 =?us-ascii?Q?hgciMyY05NHjgba2DPimgNARExDHqWjRtfZPkBRbetzGLGubFxJlt5NA7mID?=
 =?us-ascii?Q?RNapabjb92ZminTq1AptW5KIliw5gyGAr94OEDWFqUObrkXTRRU0q09ZBOuU?=
 =?us-ascii?Q?PVn2COFJfVozNj0i/vEWqEGVWuYRZ0BE1cSSMHxTlrfKNXsjbZGrAvHiUse+?=
 =?us-ascii?Q?FrLRs8nBnHuEm5wvPtOpkt/v4ytNn8TdVIwBF/VQg2jMS40fPsVVlO3lNYSL?=
 =?us-ascii?Q?yqgHm9Zrp8Fh41nnwz1eJNVLW/Q91laNeC7CGudBnZwJTrIluLABq9gfSN8l?=
 =?us-ascii?Q?urBbqtt1S3cTsRzXEtfVvmA0mZCySLpz/+o7lPFRxy5V9xpnSdjtaMWqsXTP?=
 =?us-ascii?Q?cZ/in2duUj0hPSqIL3EcwYDV0oFu4SUyG1whBGdmoTZonkJmOSbCyisogddU?=
 =?us-ascii?Q?5W1at0dENj+2SErk3iCF8tYGcT6H/i1TPCD2v33cvFIUPWODXxsAW30vIdDH?=
 =?us-ascii?Q?Iyh6du3J4BLcPD8HcJIma7NgGWVrMt6DK5rgHiOrY9HmPKoQsspi55IIOw3Y?=
 =?us-ascii?Q?L9vrr5Z2XAM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?y/xvypiWheBsPQE2XpNGLXofeDnGx4MNsLNCpCzHgFHhvakAoik3mUQO/zAi?=
 =?us-ascii?Q?X6lAXpgH8Q1prQO467Nv8G8KS4nGZpDMa++kku8opzeo93ZbWenT9WV2vgz7?=
 =?us-ascii?Q?VXaGcyLzU3mcPoyCdGMkxig8P5fxPjkMKT3U/QEShVEfiiCYSXQUuza5cKlL?=
 =?us-ascii?Q?QYHVJ57KwqMd1eB+2nwkGLQqGNWhyV4CqhQFJrr8yHiz2LRtG84yaiuXfcX5?=
 =?us-ascii?Q?cigeFH9CEJrlndte6sBKgCCMG9lqEBF4h3HvJHYt/NWHLa9FMjRVT0UVb+cX?=
 =?us-ascii?Q?ahbKIP8A6Wn2T20uO2W+grEy3nlMDCfTiVx3YdTALawE9tIRN3UXrJUWGdD3?=
 =?us-ascii?Q?zDlDc1mo182UDI3ag3aig1Gh9/Bue3JQA9VW2X94htIPpmxSpu2gPkbh35ts?=
 =?us-ascii?Q?qjaRUZA84tI2zcNmKNmQFOdvU3x8XKI7gt8umY/fQuUVYogVP6vdQfdbxrKc?=
 =?us-ascii?Q?JKd5DMFDTC+/+as32qu8tidTelT9PhA7iw7Blxi0LmduGVOqOjwW7CUa3vyu?=
 =?us-ascii?Q?9bnkg37CI1qHyfbeWIxw3FrDdlqaXz+oWB48ihSB+hEH/V9GRrma69mubY1G?=
 =?us-ascii?Q?GcjRCAzuBUy36t8gBineAidy+wdkZ8eifmkCYf07KobkMFbN5Frz8gKdnabN?=
 =?us-ascii?Q?g2fQWJ/AxCcP9+4QNGYXMG3U5Hs6MhjjCQsYRmY+ISTJLS+5EzXHbPdCaL7W?=
 =?us-ascii?Q?dubv0aXNtBnKU21bw1hGXTK0sQejvZlZEzfGIQM4ZdFTB0KZ5CAMqQcQkaea?=
 =?us-ascii?Q?Gn17bzHlt61g0hRO7v5ZY/YluzpBcsWgWnJFFaIHVi1oKC19NBHwr4DPsTqN?=
 =?us-ascii?Q?Bd0pf4OzTL1osB1Zr84/5J9IG1UaCiIzvEvg4gR4QVJNfzosGntHtmjGhtNk?=
 =?us-ascii?Q?+vSSCKe8nWHJJeR4ZAqfqe2lGsl8dFXLhcUC+QU+Qm4R+ZWPClz1xd7Va3kA?=
 =?us-ascii?Q?6lo8J7Cp2jmLsS5dzyKCECqppocuKuQzn/1KwngzYrLCXdSEw1JBb9CGKKr1?=
 =?us-ascii?Q?W3iwO4iqbDlRuNMwb27an7ykE1rMMGhVwfY16SjckZytoVuOwY90i74aM+A7?=
 =?us-ascii?Q?MtN8hj8U49m1A3fltck+M/p0RP0/XKvSoIlC+ucA88VCKj/j6iFekbOq5mBf?=
 =?us-ascii?Q?4cUnPlt17ai4jPa8TD6oIYsag8vXi9l8NLgdN/gb2kHeOWw9XeCCRQT1q2qV?=
 =?us-ascii?Q?f9kI+1bRh6GjmJsDUsHhbFwV7oyKEHV4PPvY0Eoi4gTsnpxDMmHaVzCj5yGx?=
 =?us-ascii?Q?+Me2nUPpxI/XHp2tE9ZR8aoLZMOCG3TYG92z1kOnq1+Kx9rUwXAWDHB1y2Wd?=
 =?us-ascii?Q?XRlfrRfGLxmrgZf0g/U1+cGuLjAE5YBR58qmg6OjLEdybup90k33OJNqhUdb?=
 =?us-ascii?Q?JtJ7OPVi6MfZWawopU1abC3Sdc2pSTHPNTeXbylDICkUWeisCibE4g7O3WtZ?=
 =?us-ascii?Q?S85P1lUd4Nr5yLrGTsqyAqt4eNFPT57zCnuBG3y7FdMwjU5P8jrpvDtLkSKK?=
 =?us-ascii?Q?0RsP5vU4xVHyV5W/+qd3YttIZFk5Z/l2b0vVmSvbFkXQWpKD2YUkskJXLn/4?=
 =?us-ascii?Q?cCwYvetdUKTE4OVHaVeL4foTB1Ry4+nTHzAAD5F8xSm61m3IaIcXT8RvfN/g?=
 =?us-ascii?Q?xw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 557a29f1-863e-46e0-d663-08dddaaf12ab
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2025 21:19:22.5596 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vlbs2+bFO+FfC34HhOr5Picmjg7965BgFhorjGe6HSGr28iAsEy/iFbI2i+kApskXiRQDNrwqi56i2fbdd8bXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7167
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

On Wed, Aug 13, 2025 at 07:47:59PM +0000, stuartsummers wrote:
> There is a small window of time during the driver teardown where
> the TLB invalidation fence->gt is set to NULL but an invalidation
> worker is still alive. This won't cause an issue currently because
> the tlb_invalidation structure itself is still present. However as
> part of a future refactor, we are looking to split that structure
> out. To be safe, go ahead and cancel any outstanding TLB invalidation
> fence worker thread on _fini() since at that time we are already
> tearing down the driverworker thread on _fini() since at that time we
> are already tearing down the driver and don't need to continue
> monitoring this.
> 
> Signed-off-by: stuartsummers <stuart.summers@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> index 75854b963d66..08e882433b13 100644
> --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> @@ -44,6 +44,8 @@ static void xe_gt_tlb_invalidation_fence_fini(struct xe_gt_tlb_invalidation_fenc
>  	if (WARN_ON_ONCE(!fence->gt))
>  		return;
>  
> +	cancel_delayed_work(&fence->gt->tlb_invalidation.fence_tdr);

I think cancel_delayed_work_sync is what we want here.

Matt

> +
>  	xe_pm_runtime_put(gt_to_xe(fence->gt));
>  	fence->gt = NULL; /* fini() should be called once */
>  }
> -- 
> 2.34.1
> 
