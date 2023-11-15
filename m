Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 973E5C072A2
	for <intel-xe@archiver.kernel.org>; Wed, 15 Nov 2023 22:19:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B83810E283;
	Wed, 15 Nov 2023 22:19:44 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 068A610E283
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Nov 2023 22:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700086782; x=1731622782;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=3EcKXv6t9xuR7lFTpxFLRPZeqfrml7W2micm7073tjI=;
 b=JHO227dZgQFdJo8cRU1GLxvw3VTN799bNduwRbplQNgWUz0guIWKfTtk
 nB2uvhDIpn+G0U1wvHS+D7c2t9Dy0lZ1MXLC7kPH8M0g+Cscuvn1w7ePu
 Bb0xLLSqFzIHzHLea0WXauim5rn5t4BH4G++gjmGAdjo9GA8YudKOxS1e
 cAQcIg5FznfXeNcDJC/WB3sQqEYcLg0gLL8c5MZ69XYRnG7gkYjpDX1+X
 LW7YaD/cLe7iz5j5fj1OC5dJUeDdzlzLlCNZp1KBJ8VBCgZICAVnK6UDe
 qArZWqjQltNr13EhNJDRRs6nmc5jPIjLKxpAsU4Ser7yPEHDPIKDOcXCs A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="455259549"
X-IronPort-AV: E=Sophos;i="6.03,306,1694761200"; d="scan'208";a="455259549"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2023 14:19:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,306,1694761200"; d="scan'208";a="13340189"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Nov 2023 14:19:41 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 15 Nov 2023 14:19:23 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 15 Nov 2023 14:19:23 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 15 Nov 2023 14:19:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PWO5h/UpkMWhWJmoHtunTDGPhrehP56yDLoTCu8UUMyd2DjUZO+pwzsLAskIfhWDjyTMyEX9GbsQMZsNP4xYGAJZwlgPFFXfFKGnXq9fMEKHIWCF+xM357JpuWHqIchHiL2DT1uCpu46t56CWjSfA/uekJQ/0cmEgKskTQEISRKqBslPpAQtXS/GPopLp8LKZ59X6vPqjVEGCU8exIShgRGx/GxpLSINNV10/Z9UCZs//AZT02yKEGzrwGP6OOZBm11VXPXS6h/78G93kDkrb8RZclk4f+0j78CAB5K7VBrZqPeWdO6fmIw5EubGBKMvDO4Bly6WPLoKtWMXC/Rn8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QDXEccAzECGHa5y5LZcJi/rWcErReMImlcmePHEuaXI=;
 b=V/UXOloLO2YxqvCgesTBb6RRUsk5BJOvDmfSX09Icpd4EVoFVqTyFp3hI8Te7+vMKQ9QPUebm8Gi0QkuC/04vZwFuV56OCzY914EhM5dp7EBVZ2mILkm3cqd+2jI8uK3r+L7R27KlkyuKZpdj3NZbJaxZddba5OkrfODT8yfeMP9Q84T1izXkMRG25mn+bC1PCNct/OmbNwVoevEWgOqTp4G0/p2Lp1M/YZeXyUHdzyp24i45hYtpSMPUr0jtLZrFEuOi8gLsuLm62mxMnHq3H1XJsVsoRMKzUE/f0D6UEcAp1lZgKZVI6E1C0iiBEjjvtCHkviNRMwlr6Kyvb/5ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DS0PR11MB7507.namprd11.prod.outlook.com (2603:10b6:8:150::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.17; Wed, 15 Nov
 2023 22:19:19 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0%7]) with mapi id 15.20.7002.015; Wed, 15 Nov 2023
 22:19:19 +0000
Date: Wed, 15 Nov 2023 14:19:16 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
Message-ID: <20231115221916.GQ1327160@mdroper-desk1.amr.corp.intel.com>
References: <20231114130231.2299661-1-michal.winiarski@intel.com>
 <20231114130231.2299661-14-michal.winiarski@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231114130231.2299661-14-michal.winiarski@intel.com>
X-ClientProxiedBy: SJ0PR05CA0028.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::33) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DS0PR11MB7507:EE_
X-MS-Office365-Filtering-Correlation-Id: 7fffa96f-0f60-424f-512e-08dbe628e94a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BLGRgSe4t8ygHjRGVQhyRSyDLTNooyx2OcphhNiHPGprmA2ANfFNgx07OoOyIxdNpevo0VVdMYv8BT134a44rIDJXMBsRoEN7zrkI7Gn1m0DlFRDH+1jvWcKKcD3M3Hw5N9h47VixGNedCZxIaYHAmwMlEgKHl9W0K9Kx2Wd7WxIrSNP2iJN9aNVvX4NTf3lWJGSCylr/il0BsBjGuw1jJWK+/iZCdN38mCI5E4rpgv9ZWiL8DxgvVijyFEwglmn3BtK6l11Z3YpCGseYRpoZs42ZDX5SW58x005rs2UAxLOQjv+lJSKF5p3SA3wvYArG0yYy/TCRUNhTtmZzI0TQEMDAQ3cAkkdI/Q1Qp+svvBp04hq3DCIryHBgQpCFtxh+K+QH0IeA3DJVlRfmsqnfS/sxS81/0mVw8V5m+DS7fTdQPokNX5brTR0TDJGLbodee7DNchVLQBQdACgeoR734BDUx6D5sD7wrUCE0/B1ZjJq3e1mqoWHNrI/ceBaO+N55Mlv4Ju+07XmA8eSgPtzi+VG85SsJv9KveVb8/i2yzRPubXwEujHOC94YATtRIv
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(136003)(376002)(366004)(39860400002)(396003)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(86362001)(33656002)(316002)(66476007)(66556008)(66946007)(54906003)(6636002)(4326008)(8936002)(8676002)(6862004)(83380400001)(6666004)(2906002)(26005)(41300700001)(1076003)(6512007)(5660300002)(6506007)(82960400001)(6486002)(478600001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MjV1bHg4bkJSZXJ6elJDcjRlOWpBTEhCYkVReDZWcWpidU5VOGZjUzFmQWF6?=
 =?utf-8?B?MnNvUExoQk0wd01EN0Yya0txMUY1YzE3TkZvdjltT2xQK3l1QWtWcndwQTVv?=
 =?utf-8?B?ODQvYXZKcmxBanR5MUNISUovcG9ONE1LUEEzVmJ3RjVBa2FNVkpPSzhpTHli?=
 =?utf-8?B?UHhmeGwwc0JJc0tmMldnZTV4NnFxa1JwZkZydzRHZEFwcmpCK213bzlnWlJt?=
 =?utf-8?B?U3FwdUZMdVZ5VVk1dlB0cWRZYW9mdW9zbFV1eHRkNjA0TitZVVFKZ0FQbzdN?=
 =?utf-8?B?WnhwUWQ0emdXR0Myc1M0dGZkcFN0Z3lLT0x2MG1tZDRsWWVmeVRGaUZTWkhB?=
 =?utf-8?B?ZmZMS1NqQkJBSGRFaysrMHVRb3h1SzdybUhiR2tic1NJNHJhdmVFV1dZNlRh?=
 =?utf-8?B?Z0NsR2tBN28vaEdnWGRaVFhGNVhIdXNqSWdnRENhc0s0UWZZUTM1V2lDK1hR?=
 =?utf-8?B?VU9YbjlKWHNJeERQNkhieEVkT3IzOEo1TTNxUGhJQUk2Ny9HSDVtZEtQUGtM?=
 =?utf-8?B?algrWnYydHBwOVBKZCtTak9WNDJ6QkoyMTdnQ0VsZkE3SUtKbFNKSXNpS1p6?=
 =?utf-8?B?REVBeC9TdzJnLy9MRHZDb1d0UzhiQ1RiRVZoR3Y5WVN3aFVRWE1ZcmpqVVBo?=
 =?utf-8?B?VzNCUmd6VmxtTFFzYkl2S1VqVGVSWUl5Zlp1SmZHbUtFNnpnblcydlVicVNv?=
 =?utf-8?B?c3F0UHlWOXFibHdkbTZwaDF0VmhHamRIUFE5NEZqOWI4dVMwRW02a0ZsL1I3?=
 =?utf-8?B?Mk9YUXM3V29jZVd2WmJLTCtFQTIvT25IM2FDclVLZFBhYlZqMnAvSnYvOC84?=
 =?utf-8?B?ZjJrUjh0SHR1OGpaQ3BGVGZabGZYWTNPeGtkb1dIZFNnVWpLeE9HQVBzSjI3?=
 =?utf-8?B?MzdoUVVWdlE3dGtHR3hZbDZTci9Fclh0blZTN1NZZWJqWG55U0FTSmtEK25u?=
 =?utf-8?B?YWU5NUFzb2xCRFQvRVNLVkc2UzJBdzFyTU1pcHA0TDJOeDBCblZuNU9oK2cy?=
 =?utf-8?B?SU9nUlVtbDF4aThQTWF3QmVuY3lSZ25IYktaQkJJdzdNWkpqa3hXV1Q1eWl5?=
 =?utf-8?B?RkR2ZEFGN0Z6QndXNUNqQTJ4RkJQRHM2K0E5akZiaWtSZDc3MnB5WGVyZlRl?=
 =?utf-8?B?UnhFcHpWQ1hNQlAzVDVmTUVlWnRMdUNnMjgxcWZFelFQa1VSNzd1VnB3R0Jx?=
 =?utf-8?B?WllmMkZNTWNuTkg2bnkySmlaNEZPTkdFT1hIemt3Nnk3a0dwSC9VVFE5NFQ3?=
 =?utf-8?B?N21STUFqMjRYZXB0UmZxdWV3dmUyUWRiSWluQ0xZYW0zNTczUStsL2RSc2dl?=
 =?utf-8?B?SUs1cHFxSC9BRmZvY0Nqb1pDK2E5V2RZTU9JNlcveHIyZHhEWFJFTEdiNi9M?=
 =?utf-8?B?R2dxbFVjclNoOWpKdlkvb3RYc3Y2L2pWSDkwQi9lb2pTRjNYYk4wYkVOQ0xM?=
 =?utf-8?B?dk9qUUFjdTcvYkNsWmkrQ3ZKdzhoMXo4ZXFINmF0bG9rcEVPN0xNM0krWWZj?=
 =?utf-8?B?WUIzWi9hVWpvcXV5eUprdFlWWXVXS1ptd1EvSWJBblc2YUhBbGRGaTV5Rk1Q?=
 =?utf-8?B?dE9qZ0Y1NWNaSk9pWWcrcmc2OXExTjFqVU1lNHFzd2hSZkRkZjZrTXpndHRy?=
 =?utf-8?B?THE2WVMwT1BGazEzU0t6NUZlRzVEQkkycjJiRUM4NW9KNGUrR1Y4cHBpR1Rl?=
 =?utf-8?B?Nm1sbDduYmIzbXJPQ2hGUDNYYi9MQ25NejVORGR5UkphVEptVnpuMlF5ckNN?=
 =?utf-8?B?bmNRN2FYWC9CR3N2UElzOE9xTy9WYjlsRkpUT05MV3NWM1RDdGp5N3FtZTJK?=
 =?utf-8?B?a01QTlpqbUJRYkNkS0JtWEZlLzQ1V29sWW04aHYxaWwvVnZyT0J5dGlmUDdE?=
 =?utf-8?B?d01iaUxIVGkwMnE0cERPY3BXT1lIM2Q0QVk3RHFPdzliOEk0Q2F5YWpCTE5Y?=
 =?utf-8?B?anE3L24xQS85a2NLMUczN2thblhIUlNzRWVnaFI0eTZUcGtocDV3aW5RMkI3?=
 =?utf-8?B?a09TaG82M0tYRDM4SmRNRlRITGhveUlIREdiekJIVmd0YjNrM0VJSWFXRlUv?=
 =?utf-8?B?cHhzWkY5OVE5ODhMZWJvM3NJN09oOUlrWm1ucEphV3hCSzEvQzFlTFVsMitX?=
 =?utf-8?B?cklmdzVDM2ZwTnJNYS9ZajRJUzliWWFWWGpUcVhoM0lLdTljYlRzSnozRGl3?=
 =?utf-8?B?QlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fffa96f-0f60-424f-512e-08dbe628e94a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2023 22:19:19.5312 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3uBMO7TDwylr7zFYdareOea+9ZioeG36n9IUq4ilCdi6JRcf0XRyvi0bq9Ttbt/azinYcGWtKc8sFm8gE4Zd397HfczzqzdHBKaKrlbx4lE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7507
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 13/20] drm/xe: Reorder GGTT init to
 earlier point in probe
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Nov 14, 2023 at 02:02:24PM +0100, Michał Winiarski wrote:
> GuC will need to be loaded earlier during probe. Having functional GGTT
> is one of the prerequisites.
> Also rename xe_ggtt_init_noalloc to xe_ggtt_init_early to match the new
> call site.
> 
> Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_device.c |  7 +++++++
>  drivers/gpu/drm/xe/xe_ggtt.c   | 20 ++++++++++++++++----
>  drivers/gpu/drm/xe/xe_ggtt.h   |  2 +-
>  drivers/gpu/drm/xe/xe_tile.c   |  4 ----
>  4 files changed, 24 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index fde597fe0b513..531aca74e8eb4 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -24,6 +24,7 @@
>  #include "xe_drv.h"
>  #include "xe_exec_queue.h"
>  #include "xe_exec.h"
> +#include "xe_ggtt.h"
>  #include "xe_gt.h"
>  #include "xe_irq.h"
>  #include "xe_mmio.h"
> @@ -407,6 +408,12 @@ int xe_device_probe(struct xe_device *xe)
>  	for_each_gt(gt, xe, id)
>  		xe_force_wake_init_gt(gt, gt_to_fw(gt));
>  
> +	for_each_tile(tile, xe, id) {
> +		err = xe_ggtt_init_early(tile->mem.ggtt);
> +		if (err)
> +			return err;
> +	}
> +
>  	err = drmm_add_action_or_reset(&xe->drm, xe_driver_flr_fini, xe);
>  	if (err)
>  		return err;
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index 0e2a41837f169..fab3cc04882da 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -96,14 +96,20 @@ static void xe_ggtt_clear(struct xe_ggtt *ggtt, u64 start, u64 size)
>  	}
>  }
>  
> -static void ggtt_fini_noalloc(struct drm_device *drm, void *arg)
> +static void ggtt_fini_early(struct drm_device *drm, void *arg)
>  {
>  	struct xe_ggtt *ggtt = arg;
>  
>  	mutex_destroy(&ggtt->lock);
>  	drm_mm_takedown(&ggtt->mm);
> +}
> +
> +static void ggtt_fini(struct drm_device *drm, void *arg)
> +{
> +	struct xe_ggtt *ggtt = arg;
>  
>  	xe_bo_unpin_map_no_vm(ggtt->scratch);
> +	ggtt->scratch = NULL;
>  }
>  
>  static void primelockdep(struct xe_ggtt *ggtt)
> @@ -124,7 +130,12 @@ static const struct xe_ggtt_pt_ops xelpg_pt_ops = {
>  	.pte_encode_bo = xelpg_ggtt_pte_encode_bo,
>  };
>  
> -int xe_ggtt_init_noalloc(struct xe_ggtt *ggtt)
> +/*
> + * Early GGTT initialization, which allows to create new mappings usable by the GuC.
> + * Mappings are not usable by the HW engines, as it doesn't have scratch / initial clear done to it
> + * yet. That will happen in the regular, non-early GGTT init.
> + */
> +int xe_ggtt_init_early(struct xe_ggtt *ggtt)
>  {
>  	struct xe_device *xe = tile_to_xe(ggtt->tile);
>  	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> @@ -178,7 +189,7 @@ int xe_ggtt_init_noalloc(struct xe_ggtt *ggtt)
>  	mutex_init(&ggtt->lock);
>  	primelockdep(ggtt);
>  
> -	return drmm_add_action_or_reset(&xe->drm, ggtt_fini_noalloc, ggtt);
> +	return drmm_add_action_or_reset(&xe->drm, ggtt_fini_early, ggtt);
>  }
>  
>  static void xe_ggtt_initial_clear(struct xe_ggtt *ggtt)
> @@ -226,7 +237,8 @@ int xe_ggtt_init(struct xe_ggtt *ggtt)
>  	xe_map_memset(xe, &ggtt->scratch->vmap, 0, 0, ggtt->scratch->size);
>  
>  	xe_ggtt_initial_clear(ggtt);
> -	return 0;
> +
> +	return drmm_add_action_or_reset(&xe->drm, ggtt_fini, ggtt);
>  err:
>  	ggtt->scratch = NULL;
>  	return err;
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
> index 3faa3c6d0375f..a09c166dff701 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.h
> +++ b/drivers/gpu/drm/xe/xe_ggtt.h
> @@ -12,7 +12,7 @@ struct drm_printer;
>  
>  void xe_ggtt_set_pte(struct xe_ggtt *ggtt, u64 addr, u64 pte);
>  void xe_ggtt_invalidate(struct xe_ggtt *ggtt);
> -int xe_ggtt_init_noalloc(struct xe_ggtt *ggtt);
> +int xe_ggtt_init_early(struct xe_ggtt *ggtt);
>  int xe_ggtt_init(struct xe_ggtt *ggtt);
>  void xe_ggtt_printk(struct xe_ggtt *ggtt, const char *prefix);
>  
> diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
> index daf1ac39dcbb1..731869e49b016 100644
> --- a/drivers/gpu/drm/xe/xe_tile.c
> +++ b/drivers/gpu/drm/xe/xe_tile.c
> @@ -166,10 +166,6 @@ int xe_tile_init_noalloc(struct xe_tile *tile)
>  	if (err)
>  		goto err_mem_access;
>  
> -	err = xe_ggtt_init_noalloc(tile->mem.ggtt);
> -	if (err)
> -		goto err_mem_access;
> -
>  	tile->mem.kernel_bb_pool = xe_sa_bo_manager_init(tile, SZ_1M, 16);
>  	if (IS_ERR(tile->mem.kernel_bb_pool))
>  		err = PTR_ERR(tile->mem.kernel_bb_pool);
> -- 
> 2.42.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
