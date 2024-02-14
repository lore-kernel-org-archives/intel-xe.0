Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E088CC48BC1
	for <intel-xe@archiver.kernel.org>; Wed, 14 Feb 2024 19:43:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B7C710E2C3;
	Wed, 14 Feb 2024 19:43:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EDVOGAle";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD48410E2C3
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Feb 2024 19:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707939837; x=1739475837;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=1Q6asbbfNhAIlmG05v5ultkbNFI5B6CtJTKHSk5mHZ0=;
 b=EDVOGAle9AP/Bew35DnLFZBez3lIwiVJkllw20zZ91KfOu+acvVhi/7X
 arZL6jsKZowwZAxzaU/XYisGjYm41UDU53X2oj3QNXYFAx8RatrWefPAo
 Zje+0sF6Zbxa1KhYBVwAl7KBu0DCROF8GfNO9MsJYcIw6Wm0WsmRT/Usk
 /V/lAptLLXsRQ9EEFtDG7kD57naLHyLgysoILXnWbXalFyVaGUWwu895j
 9rN3jbjtoU2XmYi3lzvf7jDuK5d3UP2+zUbqj+a6NmEUiQFkC3n8Q87aP
 7cKcJ7rbjwbcRagTuVxE7Gv673S/jTzzyQSScHcxxnv6kBPkZ06D2bxt8 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10984"; a="13100147"
X-IronPort-AV: E=Sophos;i="6.06,160,1705392000"; d="scan'208";a="13100147"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2024 11:43:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,160,1705392000"; 
   d="scan'208";a="3654772"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Feb 2024 11:43:57 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 14 Feb 2024 11:43:56 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 14 Feb 2024 11:43:56 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 14 Feb 2024 11:43:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lhBg+FePuYJoqJvujjBOgOwmQJuEjINPyiSiHpODP6jFYnxx+ILuJjtD55RMU2/Ifuh3odMO7OIBT9JUDQQrJGh3oYCPGCwHieUSYbfsp4sOSMNXXRl9JW6LoheFkMep6jrss64bePjulOA1WJY1WU8+9gPt5+6NIAcrfmw4K3wORjjfHnMPSa+XGQxhsHMAm8xGOfdNTmOhknaNWn7pQzSw66mqx2dJ+d/rA7WKqGlkodD+gy8/eKJpD7NzvWsgntoMLvA4PAfWtTsbhlcggUQMCJA+o0CCtPWEIn36MB/z4laz1BOHcpsQQeIbZx/Isr/y77Bss9NiUkZR3o9rCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kYd55BCdGL6WS8nD0OHzN/K5MvfxF0vLrc00MdOhDec=;
 b=Nl62AtLRnBuiBw6yJolK9m4az19dgf3K7XO1kzUIDuyCYG6q52bmJW4CCCsJ8l0snuJTCvubLcMbON0iPsWk3g0NYcuwv2yRd+COPuj5hniohab/61FRE8k5zRx5tRAhGw1WGZqNWaHr79wNuMUTRbaPo4e7HPxKdKaVobL/OfilvSWxzohArOYsL+NPq7M9/b8qwZbGlR2su566GYP4CourrtC6HRJ+A6/6APWN60esrzQNK1A8/4ckjJHKLytib8UujsEwfQlapgduCW7tE+r75hlrKvSjAAANNqfO9d4kKCZo5fxaa6P6VC/pAwbg/h5URvDvtx6M4MoWEAwETA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by MW5PR11MB5786.namprd11.prod.outlook.com (2603:10b6:303:191::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.27; Wed, 14 Feb
 2024 19:43:53 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7270.036; Wed, 14 Feb 2024
 19:43:51 +0000
Date: Wed, 14 Feb 2024 14:43:46 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [CI 4/4] drm/xe: Initialize GuC earlier during probe
Message-ID: <Zc0X8sZ-10yYJpzn@intel.com>
References: <20240202120834.1187656-1-michal.winiarski@intel.com>
 <20240202120834.1187656-4-michal.winiarski@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240202120834.1187656-4-michal.winiarski@intel.com>
X-ClientProxiedBy: SJ0PR05CA0177.namprd05.prod.outlook.com
 (2603:10b6:a03:339::32) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|MW5PR11MB5786:EE_
X-MS-Office365-Filtering-Correlation-Id: cd4a04ce-3a3f-453d-41a6-08dc2d9544d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oe/zLuIAJVg3UrBGJiXltZRh/gyowfrutcZuiwnaZLZPff3nJGzcK8AKCWjKGAcg+DRbfYn5MU7qmfY6IJncmuHs05DrpiD4fqSxV+9AE5aFru732k/AfdtVtWbaa4XZi6Yj7JnbTbNInEtcPnvTH/Jd7VGBStX50efJ969Gph0GhOhtihH/Zgy4gUymmQlkJg4ME5psGetDML97UU6Z8Kk7wKNK1zguJLPkNIRVJnYrmNr34DP7ByLoDDDBCWu+pre1V1AlMw8ZwZjM+IEzgBDYH/fA2huypm+Lr7lrRjPmiaq8e4HlQ9HHfKf0vMp/+Up4hNihr9Wz4XPb1mfWlxeudab7uavqxhlk7t7q5JM5LYmkjBiAXT4YpStIW0EZPJ+viZUCLoPR0e/y7FMpm5LyFz/n54mAPEHkDhk8pbrBxpn73Yk94h1cgHgSNvtdUKimaOIZXMDE2+oqpKcJs2qYoCN+W2v/2sRgMD7eWRyIuzIGIdTu7Z3dH0D3bw4GAkgggQToalHUP1Fkft5hy7/yEyuT3fVHo5kMIUvkH4qJFL6Jmt9w8OamBSmsgmds
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(396003)(39860400002)(376002)(346002)(136003)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(44832011)(5660300002)(6862004)(66946007)(8936002)(4326008)(2906002)(8676002)(66556008)(66476007)(83380400001)(26005)(86362001)(82960400001)(36756003)(316002)(38100700002)(37006003)(6666004)(6636002)(41300700001)(2616005)(478600001)(6512007)(6506007)(6486002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TDVYTklaT056S3VGcEhRRDlYcXFNNUFtUnE3Zk5wTmJnbTZyV2dld2FQcDVO?=
 =?utf-8?B?WWYzNlVjbnY3RDZjeHpkL24yZGpuZTE3L3RQRll3MVB2TGFGcFlPc2g0cDNu?=
 =?utf-8?B?d2QrWnZRZTZ6RmlRa3VIbmpwQlhoQ2VUaERHbnJaQkY2Sk02UEJVbVpkL0pa?=
 =?utf-8?B?ZWx2VDFpUVB5MGUxS1FZLzZ5U0laYXJ3ZFRTdk5ISHFVMW8zbFJsUUYvTUla?=
 =?utf-8?B?Z2swWDRhUFRPWXIyMXFIdVhTN0lRT3R0Nkc1blMwQ2Z5WGxIVGo2U2xJZ0Ey?=
 =?utf-8?B?QVZ0cUFvdVB2TG1iTWREUXBCU1FIZ0x2RnBSd1VCWTd0WjdsSGc3MWZkaFQw?=
 =?utf-8?B?cU1FQ2ViSFgydFMxeC9lYkhraENUbkZ4dkNiQlMyK1N2ajdkUEF3OVdpRUNV?=
 =?utf-8?B?aTJFYXJUdS9OZ3k0aGZod1BFbXVjWncxenVXMURYR2wyT2NIVnVvMDVZWlVs?=
 =?utf-8?B?RFpsWXhVNEJxYmpkKzRBOXQ2dFRmWWkrVFBIY21GRkZ1YU1iN3Y3ZCtkclpQ?=
 =?utf-8?B?bkkxMGkwUEJYZ1UvSDMxTmRFQ01xSHBYUzNQUGVMbzU3UEJtb2RrSHpZejM5?=
 =?utf-8?B?WWE2Y2RpeFA3OWVoSW5xWmY4SXZpYXluR2RPbm84aVVkcGZQNDFtbDVySWY1?=
 =?utf-8?B?VmhlcHB4Uno0SHAxVEJ5ZTNRTmFuNGxFQm1SY1RreGwxdmRBVmoxdnhjQTBH?=
 =?utf-8?B?aW9uN3Z2RUd3Y3g1R2o0NmlZZVNrcmJDQmk1K0V3c1pLTCtpVTBjSDVyOURn?=
 =?utf-8?B?d2F0VDFXQndGdE5NZXNnZjN1dkt2ajdGN3lwQUh4Z0FMeXR0bXF6N25vcURp?=
 =?utf-8?B?cEptcEZubnNiWWI3MkVYaHZMdHNqdWdPUlB1SWJ0c3FQSUtLN280Sk9qZ2I1?=
 =?utf-8?B?cXBFMXZIdk16ZURSMnJFdkljbU5MNzVNTkloWHlVVm0xVDRIUHdPT0lGaW5D?=
 =?utf-8?B?OWdKbGV6MU9ESUp1SmZMRHJCYlFtNWx1cTE0Y1I5SExqeTNKbDBwenhmS0h5?=
 =?utf-8?B?STJFNlNOeEFHSlljTE5kTXUyNThra3U2Uk5CMHZrTjJsK2Y1OXNtSEpqUXNj?=
 =?utf-8?B?dnIrakRtblJQdSt2Mll3dGk4b2JlT1k2S0RlajJzR1M3SHNPQlNwY2xnbnJG?=
 =?utf-8?B?aWp2b3hFV0E3aTB6ZlVQVVVkc2x2TURBOVFkMTNpQkkyVDBmQ1o4V1lJWEdz?=
 =?utf-8?B?UC9vV012eGNzY2cyM2NjU2dYc1dUTVlSbVRYakZtRldCcWFCYm4wSGFJY1Vx?=
 =?utf-8?B?R0VaNnZJaXcyVFlFN21waXJVSUJQOEtIYzNURWFjWVI3WitnMFRPRDFkcXdn?=
 =?utf-8?B?YWZjOHh1M1ZlQWlrQ0ovK2NXZG1ubEVCSVcwYjEwRlZNeXdjMk1sdW5ZRnox?=
 =?utf-8?B?UWJZK0xxWitsaHVsbTNyZ0tJcU9yUHpPWGRVNCtoSyttVVpFZzNSL1hqSFA0?=
 =?utf-8?B?TWJWd1phL0ttUDZMNVhUTzM0UitKWlplQW1XRVFTQ3VMR2hKYml4bFFnVFNk?=
 =?utf-8?B?UHV6Ukp0bUlzbmNtbHJrTkVqWVZraGwyTFNSTEUvREN0eEZSRWl2SjdqL1dG?=
 =?utf-8?B?RWpuSzlJS2J0Rm1SL0R6UEJVcVlXUlJtZ29HYnZheHhDWEhoMUlMZGh1a2pD?=
 =?utf-8?B?MEs2cWdvTXNRdHR1YTR6cG9HdkxsMWJOcXorcm83Z3c3c1p1ODhMdlR3Qmls?=
 =?utf-8?B?SytsemJvRkxvVXZ3aWlVYm4vemYxMm04Rjhlb2IvVEI4K0lzUSthbjRxeUJk?=
 =?utf-8?B?cTVkQ1FGaWlUeEEzS3J5MDZrNEVZbUFKeE8xMUxzNHFQRHRjbWlDSy9FZ2du?=
 =?utf-8?B?QzVTRytPUUJ1RXFTdUxqZXVmWjZkdmM4ZWtzUHlXWVhyY3MxK3FsWFc3WnZP?=
 =?utf-8?B?VHBYUjNnQ0MwbmcyUW50ZUExM2EvUXdhek50OS8vWVRNSFNNelovM05hbVMy?=
 =?utf-8?B?ZGFGNzJXTytvMXpNWEIvWjVLNWk2b29udWpLeGkyUkFhMnFRQXZlMlRQejlP?=
 =?utf-8?B?NDlJSnlzbXRYeEE2QW9DRjU5VVBnYnI3QzUyTFg3SVFjMzlnWGMrblZZVjNJ?=
 =?utf-8?B?R0d0Y1FZbE5DaktuVE9XVDNaaCsyV0IxLzl5emNYdllSeWJybGNhclJ0YjRq?=
 =?utf-8?B?K0hrQkxQeVgxWU9FYVB5elExNnp0eUZzRjdJNFlwVzN0K1lsODlRM0xJRFl5?=
 =?utf-8?B?L2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cd4a04ce-3a3f-453d-41a6-08dc2d9544d2
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2024 19:43:51.2313 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qr0dScPAFd11tOeKPvZNJVeN5pS1QkqNV2wzeb71BHRO5Ale9WYsCZW+Ua0ndObP3JRsLagWL91ZjnN8CrQL4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5786
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

On Fri, Feb 02, 2024 at 01:08:34PM +0100, Michał Winiarski wrote:
> SR-IOV VF has limited access to MMIO registers. Fortunately, it is able
> to access a curated subset that is needed to initialize the driver by
> communicating with SR-IOV PF using GuC CT.
> Initialize GuC earlier in order to keep the unified probe ordering
> between VF and PF modes.
> 
> Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c |  6 ++++
>  drivers/gpu/drm/xe/xe_gt.c     | 57 +++++++++++++++++++++++-----------
>  drivers/gpu/drm/xe/xe_gt.h     |  1 +
>  drivers/gpu/drm/xe/xe_uc.c     |  8 +++--
>  4 files changed, 52 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 5b84d73055202..3d10018957c46 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -471,6 +471,12 @@ int xe_device_probe(struct xe_device *xe)
>  		}
>  	}
>  
> +	for_each_gt(gt, xe, id) {
> +		err = xe_gt_init_hwconfig(gt);
> +		if (err)
> +			return err;
> +	}
> +
>  	err = drmm_add_action_or_reset(&xe->drm, xe_driver_flr_fini, xe);
>  	if (err)
>  		return err;
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 0bc59a4dbb496..312469b5dcc9b 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -315,7 +315,6 @@ int xe_gt_init_early(struct xe_gt *gt)
>  		return err;
>  
>  	xe_gt_topology_init(gt);
> -	xe_gt_mcr_init(gt);
>  
>  	err = xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
>  	if (err)
> @@ -354,8 +353,6 @@ static int gt_fw_domain_init(struct xe_gt *gt)
>  	if (err)
>  		goto err_hw_fence_irq;
>  
> -	xe_pat_init(gt);
> -
>  	if (!xe_gt_is_media_type(gt)) {
>  		err = xe_ggtt_init(gt_to_tile(gt)->mem.ggtt);
>  		if (err)
> @@ -364,19 +361,8 @@ static int gt_fw_domain_init(struct xe_gt *gt)
>  			xe_lmtt_init(&gt_to_tile(gt)->sriov.pf.lmtt);
>  	}
>  
> -	err = xe_uc_init(&gt->uc);
> -	if (err)
> -		goto err_force_wake;
> -
> -	err = xe_uc_init_hwconfig(&gt->uc);
> -	if (err)
> -		goto err_force_wake;
> -
>  	xe_gt_idle_sysfs_init(&gt->gtidle);
>  
> -	/* XXX: Fake that we pull the engine mask from hwconfig blob */
> -	gt->info.engine_mask = gt->info.__engine_mask;
> -
>  	/* Enable per hw engine IRQs */
>  	xe_irq_enable_hwe(gt);
>  
> @@ -444,10 +430,6 @@ static int all_fw_domain_init(struct xe_gt *gt)
>  	if (err)
>  		goto err_force_wake;
>  
> -	err = xe_uc_init_post_hwconfig(&gt->uc);
> -	if (err)
> -		goto err_force_wake;
> -
>  	if (!xe_gt_is_media_type(gt)) {
>  		/*
>  		 * USM has its only SA pool to non-block behind user operations
> @@ -471,6 +453,10 @@ static int all_fw_domain_init(struct xe_gt *gt)
>  		}
>  	}
>  
> +	err = xe_uc_init_post_hwconfig(&gt->uc);
> +	if (err)
> +		goto err_force_wake;
> +
>  	err = xe_uc_init_hw(&gt->uc);
>  	if (err)
>  		goto err_force_wake;
> @@ -500,6 +486,41 @@ static int all_fw_domain_init(struct xe_gt *gt)
>  	return err;
>  }
>  
> +/*
> + * Initialize enough GT to be able to load GuC in order to obtain hwconfig and
> + * enable CTB communication.
> + */
> +int xe_gt_init_hwconfig(struct xe_gt *gt)
> +{
> +	int err;
> +
> +	xe_device_mem_access_get(gt_to_xe(gt));
> +	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> +	if (err)
> +		goto out;
> +
> +	xe_gt_mcr_init(gt);
> +	xe_pat_init(gt);
> +
> +	err = xe_uc_init(&gt->uc);
> +	if (err)
> +		goto out_fw;
> +
> +	err = xe_uc_init_hwconfig(&gt->uc);
> +	if (err)
> +		goto out_fw;
> +
> +	/* XXX: Fake that we pull the engine mask from hwconfig blob */
> +	gt->info.engine_mask = gt->info.__engine_mask;
> +
> +out_fw:
> +	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
> +out:
> +	xe_device_mem_access_put(gt_to_xe(gt));
> +
> +	return err;
> +}
> +
>  int xe_gt_init(struct xe_gt *gt)
>  {
>  	int err;
> diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
> index c1675bd44cf6d..ed6ea8057e35f 100644
> --- a/drivers/gpu/drm/xe/xe_gt.h
> +++ b/drivers/gpu/drm/xe/xe_gt.h
> @@ -33,6 +33,7 @@ static inline bool xe_fault_inject_gt_reset(void)
>  #endif
>  
>  struct xe_gt *xe_gt_alloc(struct xe_tile *tile);
> +int xe_gt_init_hwconfig(struct xe_gt *gt);
>  int xe_gt_init_early(struct xe_gt *gt);
>  int xe_gt_init(struct xe_gt *gt);
>  int xe_gt_record_default_lrcs(struct xe_gt *gt);
> diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
> index d62137306d280..9e51aa6a29604 100644
> --- a/drivers/gpu/drm/xe/xe_uc.c
> +++ b/drivers/gpu/drm/xe/xe_uc.c
> @@ -32,13 +32,15 @@ uc_to_xe(struct xe_uc *uc)
>  /* Should be called once at driver load only */
>  int xe_uc_init(struct xe_uc *uc)
>  {
> +	struct xe_device *xe = uc_to_xe(uc);
>  	int ret;
>  
> +	xe_device_mem_access_get(xe);
> +
>  	/*
>  	 * We call the GuC/HuC/GSC init functions even if GuC submission is off
>  	 * to correctly move our tracking of the FW state to "disabled".
>  	 */
> -
>  	ret = xe_guc_init(&uc->guc);
>  	if (ret)
>  		goto err;
> @@ -52,7 +54,7 @@ int xe_uc_init(struct xe_uc *uc)
>  		goto err;
>  
>  	if (!xe_device_uc_enabled(uc_to_xe(uc)))
> -		return 0;
> +		goto err;
>  
>  	ret = xe_wopcm_init(&uc->wopcm);
>  	if (ret)
> @@ -69,6 +71,8 @@ int xe_uc_init(struct xe_uc *uc)
>  	return 0;
>  
>  err:
> +	xe_device_mem_access_put(xe);

I was going to push this series, but then I noticed this is making
mem_access unbalanced here. This reference is never put back on success
above.

> +
>  	return ret;
>  }
>  
> -- 
> 2.43.0
> 
