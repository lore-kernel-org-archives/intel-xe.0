Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 108A9CCD183
	for <intel-xe@archiver.kernel.org>; Mon, 13 Oct 2025 16:56:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3FE889289;
	Mon, 13 Oct 2025 16:56:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ffkpsCz0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5C4010E495
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Oct 2025 16:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760374609; x=1791910609;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ylXT+eLMsiGCpxeAQt2fNqwH5gaA0F++hZR6xjYtHzE=;
 b=ffkpsCz07/Arn9PZKMV2K9XN5FY2xKdoOOZcy56inlDvKLYNbSxkPex/
 06OzoaiVHxoHxiEKaFT7eVa1iw7epcigNhV4/937ZEuB9oyD4orG9DS2S
 Wjs77vP5NRPwtrnhXA/6qTGKkNIBwCAyytI+nzWdTSd2K5afxivd97dfx
 OxR7HUDt8O7nAalnkLlcmo5E5YRHYqwvpZcBUU4MEWphJWee4SYhvgrVp
 M67+MGA6HLujSRxnzOe6mHL2MXGhdpp7OIX+/4aQFhfaR1tTJOdMGi0t4
 j9dEfbSNAHHkXfkXMrNVFcSy1sRwpVmyfC2YBSgupDlQo0lYU4RAx5D7+ A==;
X-CSE-ConnectionGUID: 34bfIUltS2a6uSXo0NNfZA==
X-CSE-MsgGUID: 9qshh9pyTSOB8MVsDgAPIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="73624418"
X-IronPort-AV: E=Sophos;i="6.19,226,1754982000"; d="scan'208";a="73624418"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 09:56:49 -0700
X-CSE-ConnectionGUID: Ok8IgMa4Qs6LozGEsbBUYw==
X-CSE-MsgGUID: l7dF1mT0RQGSVeDa7ThiAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,226,1754982000"; d="scan'208";a="186743896"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 09:56:50 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 13 Oct 2025 09:56:48 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 13 Oct 2025 09:56:48 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.14)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 13 Oct 2025 09:56:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ur6jyFyhk1H8T+hBxKbBKyz8Rj/XVB+TT7zgLL1Fe++kvUavY5EfytrOu723sQVAJnkGMsZdQ9BZJAuhI7FwUe2If+HoLMqoT2f7/g3mxPYdiBnZ4tTT68Uwom4AayE8i4Wd9Brly5RcPuwznvjWPSmRbGY67i8bXB63vFMVabxeyo5aMNm2KV+pIYEfsXKGm4Cbhfuahcq49Mgq5+1XjFbeRp9vmD+8iBFqXDoxtpEPI3IlMzj6vKvwXk9U2cNSlexb+fX4gNvd1Zs2GosCK3ogDihhhgDvBDv2rxyhrs0zo8qAm1r9Qu+uMTu9HUpbUWpEvU/ev0gEwIRVg/aN7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wAGWu8JzPb7g7JLXplXAG0n73onI53hFULc9ywFZre8=;
 b=u+/Fm0sgJpis7r9EDLtMvMOeCSrSnaBNyz32Kzg7YZ/3HpgccLHQgVkj7VkchoM+wlEZdF464s3olS/jUn4R19+LcTDv9gyLUVDrP+wEXwdJjYfABZuJy9tDrVAyXU/clTbwZovPT/vRmyKMVxVfG932TyJ7rEdGg8SJjxsIptLvD8BTemzC9z6dxnbMgELAZoywtqM8bqa5uik+8JSqn+b5Mjqw5jNBLp18kpA+gsRRe5q49DyndZAb5d8LgSd88y9fFnyUqERfcrlAgcUxBqqgnj/MAegBtB6SzbYpYH8jcXdiMOnnYc+do/GMeczWlOrdjqwWB6h4sY+dKmF4YQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by CH0PR11MB5300.namprd11.prod.outlook.com (2603:10b6:610:bf::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.9; Mon, 13 Oct
 2025 16:56:41 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5%5]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 16:56:41 +0000
Date: Mon, 13 Oct 2025 09:56:37 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Stuart Summers <stuart.summers@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 6/7] drm/xe: Don't block messages to the GPU scheduler
Message-ID: <aO0vRcrh+vYm8JbN@lstrano-desk.jf.intel.com>
References: <20251013162504.7768-1-stuart.summers@intel.com>
 <20251013162504.7768-7-stuart.summers@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251013162504.7768-7-stuart.summers@intel.com>
X-ClientProxiedBy: MW4PR03CA0265.namprd03.prod.outlook.com
 (2603:10b6:303:b4::30) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|CH0PR11MB5300:EE_
X-MS-Office365-Filtering-Correlation-Id: 13c97832-bd7e-400e-beef-08de0a797b6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Xp87z8I+O1+Obat3oyvDH8wgh1NVmjCk9CUd6P1ykrbZxtGJKDqOzyWciCJd?=
 =?us-ascii?Q?hRyk/GKrvDFqKqJN5D2ja0oOmBaPw+XvUvqPSTMmnspnvXHbK2eHL5cJg6nQ?=
 =?us-ascii?Q?5RsveJUBm0XSKyPMsxF8x3LdGJg1wmpJQKcOHv+76R1Iy/OH0tlFm6zkEPpE?=
 =?us-ascii?Q?EBQbGQajs2EfXxQonpAxb8d34Dt16kPNjBM8166Kve77f19P8kgnpCTxUUjy?=
 =?us-ascii?Q?/GhxecPv2VPchlibz5VU0oNsnua2DBd85mVlGqcyPCa2Bf9UClqqa44Bf97E?=
 =?us-ascii?Q?ypURgfr3HuaExdwxPMscSIVZKB2MA6cYAbLb9xs9/vvH6DEQDYUIDw1tqrgl?=
 =?us-ascii?Q?BhYwYFHcof3nPaB7dxaxjxmc6YnK/WW1NbyXu4WyyA7TozzcedXDAFBvYY2O?=
 =?us-ascii?Q?KKTP6DQoUHQ1YW3xZ0+kXLw4fGpx7H3k43gJtdU0SDcVmoZQ+TuiER1p4ieS?=
 =?us-ascii?Q?EFttLPpMtirDv1bzj+OcAlf7fvtH5rJkLLYEjCIutG2CSTluVv/653JtPIdc?=
 =?us-ascii?Q?+/KvyfGc7eqO7oTaFOWUBNWAHAvDkApBXQXmUVExXsC+lYqEYG04GGQzVEJQ?=
 =?us-ascii?Q?U1W/PtCL1Tfr7kWHV+zNJRiFlX3Vslwn7qBBA+x5kD/QvPLUH882nLGRA/mr?=
 =?us-ascii?Q?RxFT70ChOSQEUcgi+4s4C++yJMRqaWqRbjQWMuqqVJ9Hg1h724lvWFAfQM7V?=
 =?us-ascii?Q?RVoIYK+keiBVbtYCb3IB6MHBjODMC8MAn82q1nlfga1VpvMCDmGIwE2f2p6q?=
 =?us-ascii?Q?diOW8ufyVXtUIvC5jV+yuSvEGhw7xPuIDAZRTC/jby6iMPwYyt5IEvVMv4gK?=
 =?us-ascii?Q?e0TbNiqA2g1qdnj68nucStRWPxv4TSiJg4iG37zApLW06hQRQ4kbxZqsFQ7J?=
 =?us-ascii?Q?FulPP9eOV+hZp8exSYVbhcf+RHS148M202FOUKMkgkYtoYH37K0g0JmgEMGK?=
 =?us-ascii?Q?AA1lvp8ufuV2iYLDNi09Weuqlk8falhg55x83cgUGWIkCD0EQPI3Qs9pQhx/?=
 =?us-ascii?Q?vKs79W+v8yX1PcCqezkni7kWO8L2ltZRxO6Edu4SBv6e5pB0XLHrZU0FVx7T?=
 =?us-ascii?Q?Vkfb8j9N1fcafWRGNh+Ogrp227e8EtU2ZcWkkVzKSsf/J+/fSB5ArhXHNP9P?=
 =?us-ascii?Q?e9rtum4VZ6h44XO7FfXdreFqgIJxTOf6qL1X+os6sTKGATcVdm8xe2IAje11?=
 =?us-ascii?Q?9XS0pY+eqmx3Qzk34O9w2eoi8TyyB969IyQbZp9yoZrTDDQ3qA7CQGq2lA2O?=
 =?us-ascii?Q?wDqWHghsuxHzhxrInJIjgjmPm7mRdMtYdu7c7gSptex5LKVX+gUEVGBCai3Y?=
 =?us-ascii?Q?gONbYqlPNAEfK00TudspyH41+CUxBDvAKXf8fs75qf9DEwXNIz90LOJodp/t?=
 =?us-ascii?Q?4/tptvAjf1OOevTQM5Pj4C3F5A2Rt6BsuSFNqp2CwdPSohFz7A=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8eeDA59PaNEA5kqOTEcnmsF7SHchU+Kr+vz9pkianNlh6n50FBIuV/wQ3Pa0?=
 =?us-ascii?Q?iAyVCCHg1ZrQVlOCyLI4uRsXJcIr4HxkIMbpz0wGozComr7OlBSHhDgLlVCW?=
 =?us-ascii?Q?q7OFLpCSUOHu/J06x2SZuLoPODpWrJpNs9+6zrySFG61J44OCW6DhEuXbhv/?=
 =?us-ascii?Q?XHY5NT2kRivj1AcU715wdgnhs6/T4+JWtP3Vlza98AqCTSP/N/j4jELGn2Fy?=
 =?us-ascii?Q?oCeLt/PqCACACniH84ttTtx/MULugSJ0z2pamB5YmNHMWQNhMFLbnUwdnIOC?=
 =?us-ascii?Q?TBNouHLtvNZgTz7t1LRqX4AQTMAyoUbBNVBV+BdtHcIZMOLZep/9nYJrkXnr?=
 =?us-ascii?Q?oxrbihnpUABRlZtmtUaCTeFff5Ec3c+F22uzXC2IgFqsMmImhTvaU7sMal7h?=
 =?us-ascii?Q?jgJj/ZGWs+tC9gPb/3NybZBHQZdE2H6jHwVrRNgrCd4w6lnC08VBL+Xbiq06?=
 =?us-ascii?Q?PP3lETWZrrVYuV/i1YISJ23Hc3l+eU+ZGyhLQnilSHEtfFSg6q76F7PciXsy?=
 =?us-ascii?Q?oPR6nPytmNNSXlDZpZ4gWQRgQy8nGTG3p7o1SV+U80pPX92hpR3oFrrYuhy6?=
 =?us-ascii?Q?/sKgebNGAAZIbwnD6aTnzQeU5vqpsIqelBAcnpYUCy/AVehyqmDcxSyO5twV?=
 =?us-ascii?Q?NQHQgZT/FyQPQURUF2snOW6Ro3kB7H6s4GQ5ShKTuTpFl3ClsDPwwO1l/vxJ?=
 =?us-ascii?Q?u/ViYPLeMg8VDc8tQ0LPavMK64gEVKyjRE3jGLyu8YU3/quCvAC+6oOpXYOl?=
 =?us-ascii?Q?oUKcFE4oGwlR10wnvEKQqXIF+FkNt3J/63BeleEsr2c/SOyO49w+oXOdLY0G?=
 =?us-ascii?Q?PBM2Q6y2y+Pl/Det5ijgg7Y92g3xjoIbE9enCj4iz4AcnIoGyuHreCNMHKn0?=
 =?us-ascii?Q?BWYPJZdyb9Wh5KKOCSI+JDgzMHdHMSnl3mpIKlbe2gcZhkaHbiwkZG/u7CRg?=
 =?us-ascii?Q?SPmEhoSkzBX5ilEA49WEDL4nBPUClqUE0OEjLEVDL79HvrkAGf9Ps7onHaJl?=
 =?us-ascii?Q?UV4vEzcewX3S7UBL2JWWPrUECABfGERHIqJr1fNxwQ49G5bBHr0CjiTg5sL1?=
 =?us-ascii?Q?SxM0PtsMtk4jTn4OrmnsoYMaZy9PxZlwMY6djdaaFF9bpE3DqjnpSZtq5jfW?=
 =?us-ascii?Q?+5TelCb/tsv6QMT+jAhHzBQxR8YKcfVQ0jVBh4TPS9ATsolyucDO5hHEP3f0?=
 =?us-ascii?Q?3nlbmqzulN2sEZ0CRvRRYilXAbfw9/huzjueTMtewrGk4TX4n5/40fIoguEy?=
 =?us-ascii?Q?8B85KikjynwduQYFcMy+J8SfKhAuvrDbIc5q/JLsWLnTFuClk76L31hrz/gp?=
 =?us-ascii?Q?3OL4rFbHk/NB/pJHY2U5ByammCSmT2xEw/v7vzgTLBVZ+XQg6tcb/a8X7rHL?=
 =?us-ascii?Q?bZBRsiMEmWfjzr5fuDZ1URS2HIIiGRnnQRV2/ys93kdFiUjj7BnMxA2QqHss?=
 =?us-ascii?Q?XHJ+ryQ371at5r/Ys/1T3zfoePVmh7Qponhkd7IlxG4Z7MRZ447vVdJEkUJp?=
 =?us-ascii?Q?a0bM1EEY+5XIo6Zxz+gkBCIfvbUN8GVUSk/ZF6n4TlhwmvlfoeZYjqwgenNC?=
 =?us-ascii?Q?ze0F98sWCgzz5a3lpNYGUunCORsjflnC8ydoe8HYGbAHY0nE8s9gX8aENbO7?=
 =?us-ascii?Q?rg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 13c97832-bd7e-400e-beef-08de0a797b6d
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 16:56:41.3850 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8Nt5aAvpnAiuoXe1mSI/BKHmbL1n/RsQmiiGxDh9g/g2XRcO4C19lQj2ExYlPOqKrvP+pKuff2V+HT7dfqrSAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5300
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

On Mon, Oct 13, 2025 at 04:25:03PM +0000, Stuart Summers wrote:
> Right now we are using the state of the GPU scheduler
> to determine whether we send and receive messages. There
> are some states, however, where we might intentionally
> pause the scheduler, like a device wedge, and expect that
> messages are resumed later once the user has taken the
> hardware state and is attempting to reset, like an unbind.
> 
> Remove these checks in the XeKMD and let the GPU scheduler
> handle state checks internally.
> 

We can't do this. The entire queue stop / starting mechanism relies on
getting exclusive access to the queue by ensuring the scheduler is fully
stopped - this includes messages. This will break job timeouts, GT reset
flows, and VF migration.

What exactly is the problem you are trying to solve? The device is
wedged and queues are stopped, then an unbind occurs? That is probably a
bug. IIRC even wedging a device / tearing down a queue we should always
start the queue again. We could assert in guc_submit_wedged_fini that
all queues are not paused.

Also if you having issues on unbind - there is this patch [1] which
fixes an issue too. I'm going to merge [1] now.

Matt

[1] https://patchwork.freedesktop.org/series/155417/

> Signed-off-by: Stuart Summers <stuart.summers@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gpu_scheduler.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.c b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
> index f91e06d03511..d9d6fb641188 100644
> --- a/drivers/gpu/drm/xe/xe_gpu_scheduler.c
> +++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
> @@ -7,8 +7,7 @@
>  
>  static void xe_sched_process_msg_queue(struct xe_gpu_scheduler *sched)
>  {
> -	if (!READ_ONCE(sched->base.pause_submit))
> -		queue_work(sched->base.submit_wq, &sched->work_process_msg);
> +	queue_work(sched->base.submit_wq, &sched->work_process_msg);
>  }
>  
>  static void xe_sched_process_msg_queue_if_ready(struct xe_gpu_scheduler *sched)
> @@ -43,9 +42,6 @@ static void xe_sched_process_msg_work(struct work_struct *w)
>  		container_of(w, struct xe_gpu_scheduler, work_process_msg);
>  	struct xe_sched_msg *msg;
>  
> -	if (READ_ONCE(sched->base.pause_submit))
> -		return;
> -
>  	msg = xe_sched_get_msg(sched);
>  	if (msg) {
>  		sched->ops->process_msg(msg);
> -- 
> 2.34.1
> 
