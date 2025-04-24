Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4958AC369AB
	for <intel-xe@archiver.kernel.org>; Thu, 24 Apr 2025 23:47:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAB2D10E055;
	Thu, 24 Apr 2025 23:47:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n93MXM0Z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43DC810E055
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Apr 2025 23:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745538443; x=1777074443;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=u58wnTQrY+hkceDvaxrUSZ7uEM/2s1VJwByuNUH+6W8=;
 b=n93MXM0ZiWuBNanNdhZ673JtbfjCGZX5yOQqKpq2LCrkUW9ur195CssS
 V/KjU3C8rEy0VNc9z0VyS1RQr6fD8i4FYEe67FpMRJ86zNASImGNXJCnq
 D6tvm1ftjT7XUmTjTnPX+iwATgLpjK2tmGzZycIwnlI27DVsPgDqYMWYu
 0+7oq1UwvwtdfHKSMa51V/3UVeGZTtWEfVfW8X3xRhm+MgYry4RX8dXH1
 5cm9u5fpqcYmiUQtWBDa0ntTyeXx0XQQvxTnaT6GeuB3meKLBUEM29w4y
 YknAh2k1EOcwNvzk6DxtmxbY7q89n9mBlH+eD0XSpzLR7jAtiaGfPd5sC g==;
X-CSE-ConnectionGUID: 9jBMwsYoT462OA6AEIbU+w==
X-CSE-MsgGUID: 6p67aaFjTBeJmgHkwPG6AQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="57392622"
X-IronPort-AV: E=Sophos;i="6.15,237,1739865600"; d="scan'208";a="57392622"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2025 16:47:22 -0700
X-CSE-ConnectionGUID: 7MIyI471RtOOrVF4JwFIfg==
X-CSE-MsgGUID: ay4iD7XaS0q/NrHPGmGZtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,237,1739865600"; d="scan'208";a="137598432"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2025 16:47:23 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 24 Apr 2025 16:47:22 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 24 Apr 2025 16:47:22 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.173)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 24 Apr 2025 16:47:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c+cFgH7YiKYjGb4W2WGRRv7ZCBPaJlP5DF6YDWg6FVUjmFTmykI6PgRQZHOqpgYRUy3cdG14f31E3R7NvJOAfUCy84YVZ7eEj7st1+9RyJAJUtK6YOWEAYDqeXwlihSHX88dkJUOqashXEwi2HHEu0lUwWbfDVQZTrWJ4dgWtwOl3LGjOZPvJInGagyHmMyzWC1DB5nD1EG4a+72jOUawEZNqOc+RrAnCUxRsPsLvzoP1XvocaTAyJEaGlu9GaCApRXnTQ9HTqqwu8KNBtvWhhogNFngSqUh23pBZBF7mRuiXPk5KFGxgpkE51+GvkiaZ8hFxvf4iFVPISymnmYD9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DceFp7PQG/mMrmZ+PYCkNIbN/kGD+2fHspPEUK1vMOc=;
 b=LkMx/KsFZMYQDdrIx8tJKvd0LdLoKbCk04TkvQWVPuXkOf94bwej9L35CmF4JZ0DT+TZYHFFEhAkdhNKvxk8KxqCSqyqcZ8fldjQXjbq6X7JT5j/cYoDd7RH84sn6mvqG2XN7athxbvwG3Htj5MEFrbHTlGbM1aO1x7r/q6l265EvDuCr78NGs4OFOHNuZM6Mm/PlFBahnfc+F8YHjMfjNmHCN2cr2XgcSx8VxWiY1uM983aREypoDB0sEerIv2hqVt9MbuaGMFDbUEfvmNTkOJboBPpYIaeJBM3qMyS46u8jxFLJoXs3p2/psZ0vZNDwrE+YLKd08sbnGLuDlMhKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by LV8PR11MB8486.namprd11.prod.outlook.com (2603:10b6:408:1e8::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Thu, 24 Apr
 2025 23:47:14 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8655.037; Thu, 24 Apr 2025
 23:47:14 +0000
Date: Thu, 24 Apr 2025 16:48:35 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v2 14/32] drm/xe/svm: Implement prefetch support for SVM
 ranges
Message-ID: <aArN085FxU4PAW8w@lstrano-desk.jf.intel.com>
References: <20250407101719.3350996-1-himal.prasad.ghimiray@intel.com>
 <20250407101719.3350996-15-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250407101719.3350996-15-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: MW4PR04CA0035.namprd04.prod.outlook.com
 (2603:10b6:303:6a::10) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|LV8PR11MB8486:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f603dfd-3fa5-4db8-c731-08dd838a56a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?dmI12AtkWA6cmpiByofAwtUaYB+8TsVvlIzFjJIASk6mg4InP9r/2eQDGAQX?=
 =?us-ascii?Q?u0SmyPz49it1RsI7i7QAmJJ+rql/tK9HUT97vwfjBZ/0lqsA4Nc8DxJHoYjP?=
 =?us-ascii?Q?5ij9shOphWB8z8wf+KvVxH6ON63BrwIIgpzdl+Iz0wLhDvoRbT7j+4lrtJXc?=
 =?us-ascii?Q?un8U1LCXblW3wutKvW7buHAwE803sLSUezMp2H35AClrlXzqq4hW0eMBrzwQ?=
 =?us-ascii?Q?AhJk3rEzKg0rFbyyRLPSEa80BGcaHpoQJFEgrN0xBSRVOwchlzCxHvpWWC2d?=
 =?us-ascii?Q?S2Uptqz09LUNd/R6uDXGpIFTvmB/O5Mpor+kek2M0GYtTSC8dgUkRJKGVOyX?=
 =?us-ascii?Q?Pz0cKXv0DP3Ho/barF+hGfImC/6h4JxrKLKtSbkWcXc5EjvmJPYxbIvrVHbW?=
 =?us-ascii?Q?Ejh8TCL7HOtBCaSPdqhFbSQwgq+l2jvTtQz0LyRX5zEtfTkYf/mvbXPxliBc?=
 =?us-ascii?Q?o6uaNCLbydAUib26oZUY9U64N2XjZVMNO6yJu6IVa+JDm4s+zXtHdnX8cIL6?=
 =?us-ascii?Q?BhHFC/KnUZRpoV4gpgXr4nMg12ad2VZwE8omVg/hq8z3t5/y9VVm0xe95WiO?=
 =?us-ascii?Q?Zefwx0/+7MGVRivln01a7RFNlccrRySDQfs81Lvwp/MHOM/b5pYxX3B8YG7e?=
 =?us-ascii?Q?7gI6m+bCtWDMjqjPWO2Kl9gQfj3B3o8MQDldjcwSNbEjF/p/HkNVnyaLtlK7?=
 =?us-ascii?Q?n95DZ4KjQXMULukM2Kv6yP1S/SxpcPVu9ZWz9nL9DU2UZZSVdjp3Uxl7zvik?=
 =?us-ascii?Q?a8wUVNcXSWIcPfy671TIsvWBQfUn02RTNj7GQ5MuTC6DBHIVNZ8wyySvuulE?=
 =?us-ascii?Q?wncOrF9eKdciqoRuXGD5gZbHn/goeLaVcNxuWLokkA+iDj36sXuKCZnocwHL?=
 =?us-ascii?Q?FmnpVQ96HAvoFIeXGFhAgdk4p2u7v93PuhDa5beyTw2hSe4ggMGD0mcAOO4n?=
 =?us-ascii?Q?TJ9p3HSwUM8jt7ckYJxzX21tpugZY6l9LlV6u6UlkK3NGA8Dne6YpXIpBtK7?=
 =?us-ascii?Q?8g2Rv1QZ/9gDeDdmFBVWpqfnTVO2PXsjYng/Xoy+YOrYwH5rrFuTOY0Y7dgQ?=
 =?us-ascii?Q?pNmbVe7p1/VcFpCIaj/e0YgnkKqfV1wvlS86axN0FuWMlUPJEwrqk1JX9UaU?=
 =?us-ascii?Q?vUFZFr2gu3gnsD/D21PrDbzoopqf6NkbZaDIVYMo7r8NDQhofvUbuAsdIQdI?=
 =?us-ascii?Q?8Tsn5Q7uagcpHIOC3/RD1uMItNBfgjOrBHy1wIpNYru3EQ07LbTnO31YJMfp?=
 =?us-ascii?Q?51BOGSkNCA5BR99QC1K3mzn+f3uxinQWNkNkGRKKBLSg6JM3Ga8NAbsAPgng?=
 =?us-ascii?Q?oUawR0gOfkg2CVozYtBc7cf+dRKyUC2QElFAMTcvdSYC+jEBh84kPc1YWlup?=
 =?us-ascii?Q?Ii1YF5iU7RwQNMBf83jkDiemlPS/P5zeiSJ/qsp5+OdH0ZSfvUepNyOT/kY/?=
 =?us-ascii?Q?B+Mv0OJQfMg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yZBOui6NmP7UzHZXQkX+2MDdufdRDbW8iwPaOkU1WTRHYUyYMedQITGR9sLu?=
 =?us-ascii?Q?xbnqekoFqgv+4EBIC3MIL4RDYQusULEFEDIwzwL8vuejlEQ2Bl2zCU3+OdZ1?=
 =?us-ascii?Q?Hirit15fvNHLyFcCoNmo7wIZvdzERnIe/4j7VVMU5f8EXnzYy2i1Nt80FjW3?=
 =?us-ascii?Q?mSDAw1gGfLo+3V0NGfJRiat8ooyrtX9NWeCXnsvkVXnDaDBRr2Z0gzXaAC4g?=
 =?us-ascii?Q?3rgmcHW8FD66GaKSxI3rihIR2ORW70V49r2j1TeKG4xJpm5mdmE8rBkWSTyq?=
 =?us-ascii?Q?t9XBmK4VNXD9FPF0zw2lk9kfxp3KWGq/qpJwnvJftMFU8T6xBDYUSIu4K4nO?=
 =?us-ascii?Q?hzxGq9rvSndrSa8H0tDSErTcVUfuEc6+vVbalLlYGx9SccGjcooLSPk1sTdY?=
 =?us-ascii?Q?jJTOp992HlHol58xkht4iWSKepG3IqaAFTQTpu6laHTuSQvu0uybe4runsmw?=
 =?us-ascii?Q?TM5VWTnR1u15xlrIMP7NdtpDiqAyJPwIlvxri2QyruD3pmBUaCPr0goo2XLK?=
 =?us-ascii?Q?r45EGYG+cvCKDtiXPH4fPmTzgKOYgXN9ofCGBKWA/7IIa+k9JQAvLTh3ueaj?=
 =?us-ascii?Q?o+/BwQpLXa7RFimOER6wwfrd/wEedea0cTYn+Lk1D06oKL8cbXpnpKnNcR3D?=
 =?us-ascii?Q?Y6JdB9gwQWRdCck8t/1nVG6czzQunhRMG5IJ8JlVv3lS/K8S+Hxz1OnOqU4U?=
 =?us-ascii?Q?jXurSPwW6EdbO9h3tpx+czd6i86iwd/E0vG+mL7az1xOF0I6C1YwNJEeoGIQ?=
 =?us-ascii?Q?VvIJUHU8i9zS4WEThHXliZh2MLHadEsBtgZ04jXnCzwSKH0Xl5+888JSE5Hk?=
 =?us-ascii?Q?8FH+IsUHM6gS4HCutEsPCqdMWky+kRQHV6d3l/ATsF07wbyM9WtltmCIndwJ?=
 =?us-ascii?Q?vqQPP03jQ8GBO2vV4RTQgzq7Hw4xmJLE20nxvTavI1e1GDL7cnQx5gpcTz9o?=
 =?us-ascii?Q?RPKiYYeMbhsCpfySRAW6TvS9Xdiq1xZGIX53GRqpAugey3sXBVU7mMMc7+9w?=
 =?us-ascii?Q?aNKq6JvjcYVZCWk7sWGflbokppQHcvBTSsCR2f75CgbP9aCbgyZ9JLK1yclo?=
 =?us-ascii?Q?gv5Vsrr1uKfW3+Q8wndejs/WlDt0Uk6Hb7jPCUEat9kKwa8V3EfcPIxmlNSj?=
 =?us-ascii?Q?wAqfARMeWnXD0XZKaedvZITvWr24rzqvVz5vn7Te5n2t+JiTsnHxM35VYuzJ?=
 =?us-ascii?Q?qpsPmG5d+xq/f+SduyyZtHYDsJLLTknPTTmLVWiTguTMXhYW+7vIMZhE3Ea7?=
 =?us-ascii?Q?A0WqPbuWQVAOWLPFxj5OPEJlZ03acVJ75BJHefEE8ZXaFALcWsrEboNt6+EG?=
 =?us-ascii?Q?6UUFAgvm7J5rzZGNhUfSDSIhQ9ap8iZ6cWBEP/vnAon762rngHSWocOro+Hs?=
 =?us-ascii?Q?PIRdhyvs+WXR+I50WP0aK5HxQ6hnELjziHX2JvBh6jTyYhgHKAMlhviBMfd1?=
 =?us-ascii?Q?h358ACwNnqbnXiWR/uN50QVMT7rYTByzubgE8gSYkXFAd5iJZTL5PGhrmIH4?=
 =?us-ascii?Q?0w6ccY50Oe70e31DvvxK0QwZdU2mteh60NnpiaRRalCuruGeXv4ETqZ5JNtl?=
 =?us-ascii?Q?rVE99iVqrlg9751hAXlYqY5f5AUrCuinvrza9br5zV4QrSM4xx62IGLwsa1e?=
 =?us-ascii?Q?/A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f603dfd-3fa5-4db8-c731-08dd838a56a3
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2025 23:47:14.0451 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GlDcpZTTv0PBo+RX9d2x5/eOm4EEhHz32hEWSxFwaUgNf2j+9P6U26hubDXTEMsXXcziABpuVVD7dZqAiaw2/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8486
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

On Mon, Apr 07, 2025 at 03:47:01PM +0530, Himal Prasad Ghimiray wrote:
> This commit adds prefetch support for SVM ranges, utilizing the
> existing ioctl vm_bind functionality to achieve this.
> 
> v2: rebase
> 
> Cc: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pt.c |  61 +++++++++---
>  drivers/gpu/drm/xe/xe_vm.c | 185 +++++++++++++++++++++++++++++++++++--
>  2 files changed, 222 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index de4e3edda758..59dc065fae93 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -1458,7 +1458,8 @@ static int xe_pt_svm_pre_commit(struct xe_migrate_pt_update *pt_update)
>  	struct xe_vm *vm = pt_update->vops->vm;
>  	struct xe_vma_ops *vops = pt_update->vops;
>  	struct xe_vma_op *op;
> -	int err;
> +	int ranges_count;
> +	int err, i;
>  
>  	err = xe_pt_pre_commit(pt_update);
>  	if (err)
> @@ -1467,20 +1468,33 @@ static int xe_pt_svm_pre_commit(struct xe_migrate_pt_update *pt_update)
>  	xe_svm_notifier_lock(vm);
>  
>  	list_for_each_entry(op, &vops->list, link) {
> -		struct xe_svm_range *range = op->map_range.range;
> +		struct xe_svm_range *range = NULL;
>  
>  		if (op->subop == XE_VMA_SUBOP_UNMAP_RANGE)
>  			continue;
>  
> -		xe_svm_range_debug(range, "PRE-COMMIT");
> -
> -		xe_assert(vm->xe, xe_vma_is_cpu_addr_mirror(op->map_range.vma));
> -		xe_assert(vm->xe, op->subop == XE_VMA_SUBOP_MAP_RANGE);
> +		if (op->base.op == DRM_GPUVA_OP_PREFETCH) {
> +			xe_assert(vm->xe,
> +				  xe_vma_is_cpu_addr_mirror(gpuva_to_vma(op->base.prefetch.va)));
> +			ranges_count = op->prefetch_range.ranges_count;
> +		} else {
> +			xe_assert(vm->xe, xe_vma_is_cpu_addr_mirror(op->map_range.vma));
> +			xe_assert(vm->xe, op->subop == XE_VMA_SUBOP_MAP_RANGE);
> +			ranges_count  = 1;
> +		}
>  
> -		if (!xe_svm_range_pages_valid(range)) {
> -			xe_svm_range_debug(range, "PRE-COMMIT - RETRY");
> -			xe_svm_notifier_unlock(vm);
> -			return -EAGAIN;
> +		for (i = 0; i < ranges_count; i++) {
> +			if (op->base.op == DRM_GPUVA_OP_PREFETCH)
> +				range = xa_load(&op->prefetch_range.range, i);
> +			else
> +				range = op->map_range.range;
> +			xe_svm_range_debug(range, "PRE-COMMIT");
> +
> +			if (!xe_svm_range_pages_valid(range)) {
> +				xe_svm_range_debug(range, "PRE-COMMIT - RETRY");
> +				xe_svm_notifier_unlock(vm);
> +				return -EAGAIN;
> +			}
>  		}
>  	}
>  
> @@ -2065,11 +2079,21 @@ static int op_prepare(struct xe_vm *vm,
>  	{
>  		struct xe_vma *vma = gpuva_to_vma(op->base.prefetch.va);
>  
> -		if (xe_vma_is_cpu_addr_mirror(vma))
> -			break;
> +		if (xe_vma_is_cpu_addr_mirror(vma)) {
> +			struct xe_svm_range *range;
> +			int i;
>  
> -		err = bind_op_prepare(vm, tile, pt_update_ops, vma, false);
> -		pt_update_ops->wait_vm_kernel = true;
> +			for (i = 0; i < op->prefetch_range.ranges_count; i++) {
> +				range = xa_load(&op->prefetch_range.range, i);
> +				err = bind_range_prepare(vm, tile, pt_update_ops,
> +							 vma, range);
> +				if (err)
> +					return err;
> +			}
> +		} else {
> +			err = bind_op_prepare(vm, tile, pt_update_ops, vma, false);
> +			pt_update_ops->wait_vm_kernel = true;
> +		}
>  		break;
>  	}
>  	case DRM_GPUVA_OP_DRIVER:
> @@ -2273,9 +2297,16 @@ static void op_commit(struct xe_vm *vm,
>  	{
>  		struct xe_vma *vma = gpuva_to_vma(op->base.prefetch.va);
>  
> -		if (!xe_vma_is_cpu_addr_mirror(vma))
> +		if (xe_vma_is_cpu_addr_mirror(vma)) {
> +			for (int i = 0 ; i < op->prefetch_range.ranges_count; i++) {
> +				struct xe_svm_range *range = xa_load(&op->prefetch_range.range, i);
> +
> +				range_present_and_invalidated_tile(vm, range, tile->id);
> +			}
> +		} else {
>  			bind_op_commit(vm, tile, pt_update_ops, vma, fence,
>  				       fence2, false);
> +		}
>  		break;
>  	}
>  	case DRM_GPUVA_OP_DRIVER:
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 57af2c37f927..ffd7ad664921 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -798,10 +798,36 @@ static int xe_vma_ops_alloc(struct xe_vma_ops *vops, bool array_of_binds)
>  }
>  ALLOW_ERROR_INJECTION(xe_vma_ops_alloc, ERRNO);
>  
> +static void clean_svm_prefetch_op(struct xe_vma_op *op)
> +{
> +	struct xe_vma *vma;
> +
> +	vma = gpuva_to_vma(op->base.prefetch.va);
> +
> +	if (op->base.op == DRM_GPUVA_OP_PREFETCH && xe_vma_is_cpu_addr_mirror(vma)) {
> +		xa_destroy(&op->prefetch_range.range);
> +		op->prefetch_range.ranges_count = 0;
> +	}
> +}
> +
> +static void clean_svm_prefetch_in_vma_ops(struct xe_vma_ops *vops)
> +{
> +	struct xe_vma_op *op;
> +
> +	if (!(vops->flags & XE_VMA_OPS_HAS_SVM_PREFETCH))
> +		return;
> +
> +	list_for_each_entry(op, &vops->list, link) {
> +		clean_svm_prefetch_op(op);
> +	}
> +}
> +
>  static void xe_vma_ops_fini(struct xe_vma_ops *vops)
>  {
>  	int i;
>  
> +	clean_svm_prefetch_in_vma_ops(vops);
> +
>  	for (i = 0; i < XE_MAX_TILES_PER_DEVICE; ++i)
>  		kfree(vops->pt_update_ops[i].ops);
>  }
> @@ -2248,13 +2274,25 @@ static bool __xe_vm_needs_clear_scratch_pages(struct xe_vm *vm, u32 bind_flags)
>  	return true;
>  }
>  
> +static void clean_svm_prefetch_in_gpuva_ops(struct drm_gpuva_ops *ops)
> +{
> +	struct drm_gpuva_op *__op;
> +
> +	drm_gpuva_for_each_op(__op, ops) {
> +		struct xe_vma_op *op = gpuva_op_to_vma_op(__op);
> +
> +		clean_svm_prefetch_op(op);
> +	}
> +}
> +
>  /*
>   * Create operations list from IOCTL arguments, setup operations fields so parse
>   * and commit steps are decoupled from IOCTL arguments. This step can fail.
>   */
>  static struct drm_gpuva_ops *
> -vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
> -			 u64 bo_offset_or_userptr, u64 addr, u64 range,
> +vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
> +			 struct xe_bo *bo, u64 bo_offset_or_userptr,
> +			 u64 addr, u64 range,
>  			 u32 operation, u32 flags,
>  			 u32 prefetch_region, u16 pat_index)
>  {
> @@ -2262,6 +2300,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
>  	struct drm_gpuva_ops *ops;
>  	struct drm_gpuva_op *__op;
>  	struct drm_gpuvm_bo *vm_bo;
> +	u64 range_end = addr + range;
>  	int err;
>  
>  	lockdep_assert_held_write(&vm->lock);
> @@ -2323,14 +2362,61 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
>  			op->map.invalidate_on_bind =
>  				__xe_vm_needs_clear_scratch_pages(vm, flags);
>  		} else if (__op->op == DRM_GPUVA_OP_PREFETCH) {
> -			op->prefetch.region = prefetch_region;
> -		}
> +			struct xe_vma *vma = gpuva_to_vma(op->base.prefetch.va);
> +
> +			if (!xe_vma_is_cpu_addr_mirror(vma)) {
> +				op->prefetch.region = prefetch_region;
> +				break;
> +			}
>  
> +			struct drm_gpusvm_ctx ctx = {
> +			.read_only = xe_vma_read_only(vma),
> +			.devmem_possible = IS_DGFX(vm->xe) &&
> +					   IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR),
> +			.check_pages_threshold = IS_DGFX(vm->xe) &&
> +						 IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR) ?
> +						 SZ_64K : 0,
> +			};
> +
> +			op->prefetch_range.region = prefetch_region;
> +			struct xe_svm_range *svm_range;
> +			int i = 0;
> +
> +			xa_init(&op->prefetch_range.range);
> +			op->prefetch_range.ranges_count = 0;
> +alloc_next_range:
> +			svm_range = xe_svm_range_find_or_insert(vm, addr, vma, &ctx);
> +
> +			if (PTR_ERR(svm_range) == -ENOENT)
> +				break;

I missed this in previous review. -ENOENT means a CPU VMA does not
exist. I think it fairly reasonable use to case for a UMD to issue a
prefetch to sparsely populated CPU VMA range so I don't think breaking
here is correct, rather a goto alloc_next_range after adjusting to the
next address. This gets tricky as we likely don't want to iterate 4k at
a time... Maybe we add GPU SVM support function which wraps a CPU VMA
lookup function (find_vma I think) to find the next CPU VMA and returns
the starting address, if the starting address is within the prefetch
range we continue the walk.

Matt

> +
> +			if (IS_ERR(svm_range)) {
> +				err = PTR_ERR(svm_range);
> +				goto unwind_prefetch_ops;
> +			}
> +
> +			xa_store(&op->prefetch_range.range, i, svm_range, GFP_KERNEL);
> +			op->prefetch_range.ranges_count++;
> +			vops->flags |= XE_VMA_OPS_HAS_SVM_PREFETCH;
> +
> +			if (range_end > xe_svm_range_end(svm_range) &&
> +			    xe_svm_range_end(svm_range) < xe_vma_end(vma)) {
> +				i++;
> +				addr = xe_svm_range_end(svm_range);
> +				goto alloc_next_range;
> +			}
> +		}
>  		print_op(vm->xe, __op);
>  	}
>  
>  	return ops;
> +
> +unwind_prefetch_ops:
> +	clean_svm_prefetch_in_gpuva_ops(ops);
> +	drm_gpuva_ops_free(&vm->gpuvm, ops);
> +	return ERR_PTR(err);
>  }
> +
>  ALLOW_ERROR_INJECTION(vm_bind_ioctl_ops_create, ERRNO);
>  
>  static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
> @@ -2645,8 +2731,12 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
>  					return err;
>  			}
>  
> -			if (!xe_vma_is_cpu_addr_mirror(vma))
> +			if (xe_vma_is_cpu_addr_mirror(vma))
> +				xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask,
> +							      op->prefetch_range.ranges_count);
> +			else
>  				xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask, 1);
> +
>  			break;
>  		default:
>  			drm_warn(&vm->xe->drm, "NOT POSSIBLE");
> @@ -2772,6 +2862,58 @@ static int check_ufence(struct xe_vma *vma)
>  	return 0;
>  }
>  
> +static int prefetch_ranges_lock_and_prep(struct xe_vm *vm,
> +					 struct xe_vma_op *op)
> +{
> +	int err = 0;
> +
> +	if (op->base.op  == DRM_GPUVA_OP_PREFETCH) {
> +		struct xe_vma *vma = gpuva_to_vma(op->base.prefetch.va);
> +		struct drm_gpusvm_ctx ctx = {
> +			.read_only = xe_vma_read_only(vma),
> +			.devmem_possible = IS_DGFX(vm->xe) &&
> +					   IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR),
> +			.check_pages_threshold = IS_DGFX(vm->xe) &&
> +						 IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR) ?
> +						 SZ_64K : 0,
> +		};
> +		struct xe_svm_range *svm_range;
> +		struct xe_tile *tile;
> +		u32 region;
> +		int i;
> +
> +		if (!xe_vma_is_cpu_addr_mirror(vma))
> +			return 0;
> +
> +		region = op->prefetch_range.region;
> +
> +		/* TODO: Threading the migration */
> +		for (i = 0; i < op->prefetch_range.ranges_count; i++) {
> +			svm_range = xa_load(&op->prefetch_range.range, i);
> +			if (xe_svm_range_needs_migrate_to_vram(svm_range, vma, region)) {
> +				tile = &vm->xe->tiles[region_to_mem_type[region] - XE_PL_VRAM0];
> +				err = xe_svm_alloc_vram(vm, tile, svm_range, &ctx);
> +				if (err) {
> +					drm_err(&vm->xe->drm, "VRAM allocation failed, can be retried from userspace, asid=%u, gpusvm=%p, errno=%pe\n",
> +						vm->usm.asid, &vm->svm.gpusvm, ERR_PTR(err));
> +					return -ENODATA;
> +				}
> +			}
> +
> +			err = xe_svm_range_get_pages(vm, svm_range, &ctx);
> +			if (err) {
> +				if (err == -EOPNOTSUPP || err == -EFAULT || err == -EPERM)
> +					err = -ENODATA;
> +
> +				drm_err(&vm->xe->drm, "Get pages failed, asid=%u, gpusvm=%p, errno=%pe\n",
> +					vm->usm.asid, &vm->svm.gpusvm, ERR_PTR(err));
> +				return err;
> +			}
> +		}
> +	}
> +	return err;
> +}
> +
>  static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
>  			    struct xe_vma_op *op)
>  {
> @@ -2809,7 +2951,12 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
>  	case DRM_GPUVA_OP_PREFETCH:
>  	{
>  		struct xe_vma *vma = gpuva_to_vma(op->base.prefetch.va);
> -		u32 region = op->prefetch.region;
> +		u32 region;
> +
> +		if (xe_vma_is_cpu_addr_mirror(vma))
> +			region = op->prefetch_range.region;
> +		else
> +			region = op->prefetch.region;
>  
>  		xe_assert(vm->xe, region <= ARRAY_SIZE(region_to_mem_type));
>  
> @@ -2828,6 +2975,23 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
>  	return err;
>  }
>  
> +static int xe_vma_ops_execute_ready(struct xe_vm *vm, struct xe_vma_ops *vops)
> +{
> +	struct xe_vma_op *op;
> +	int err;
> +
> +	if (!(vops->flags & XE_VMA_OPS_HAS_SVM_PREFETCH))
> +		return 0;
> +
> +	list_for_each_entry(op, &vops->list, link) {
> +		err = prefetch_ranges_lock_and_prep(vm, op);
> +		if (err)
> +			return err;
> +	}
> +
> +	return 0;
> +}
> +
>  static int vm_bind_ioctl_ops_lock_and_prep(struct drm_exec *exec,
>  					   struct xe_vm *vm,
>  					   struct xe_vma_ops *vops)
> @@ -2850,7 +3014,6 @@ static int vm_bind_ioctl_ops_lock_and_prep(struct drm_exec *exec,
>  	    vm->xe->vm_inject_error_position == FORCE_OP_ERROR_LOCK)
>  		return -ENOSPC;
>  #endif
> -
>  	return 0;
>  }
>  
> @@ -3492,7 +3655,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  		u32 prefetch_region = bind_ops[i].prefetch_mem_region_instance;
>  		u16 pat_index = bind_ops[i].pat_index;
>  
> -		ops[i] = vm_bind_ioctl_ops_create(vm, bos[i], obj_offset,
> +		ops[i] = vm_bind_ioctl_ops_create(vm, &vops, bos[i], obj_offset,
>  						  addr, range, op, flags,
>  						  prefetch_region, pat_index);
>  		if (IS_ERR(ops[i])) {
> @@ -3525,6 +3688,10 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  	if (err)
>  		goto unwind_ops;
>  
> +	err = xe_vma_ops_execute_ready(vm, &vops);
> +	if (err)
> +		goto unwind_ops;
> +
>  	fence = vm_bind_ioctl_ops_execute(vm, &vops);
>  	if (IS_ERR(fence))
>  		err = PTR_ERR(fence);
> @@ -3594,7 +3761,7 @@ struct dma_fence *xe_vm_bind_kernel_bo(struct xe_vm *vm, struct xe_bo *bo,
>  
>  	xe_vma_ops_init(&vops, vm, q, NULL, 0);
>  
> -	ops = vm_bind_ioctl_ops_create(vm, bo, 0, addr, bo->size,
> +	ops = vm_bind_ioctl_ops_create(vm, &vops, bo, 0, addr, bo->size,
>  				       DRM_XE_VM_BIND_OP_MAP, 0, 0,
>  				       vm->xe->pat.idx[cache_lvl]);
>  	if (IS_ERR(ops)) {
> -- 
> 2.34.1
> 
