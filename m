Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5F17CD98E4
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jun 2026 19:31:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95FB710E665;
	Tue, 16 Jun 2026 19:31:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QHuG5zcJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C73B210E665
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Jun 2026 19:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781638305; x=1813174305;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=6p5yETaDDh23/Je3Ts8pEWAiqbSwRYxCJgVNNMHuKhc=;
 b=QHuG5zcJAZ4jSlhXhS4jVD8YxE/F4Ohqnty0Vhd4E/nC/ghATgh44yv9
 yIVycacjl54QfURTIRQG/PMDxSmJctcXByeMcse14cG0YMht1gdMQ/d7B
 9dAKnEWcwQgEgeBQ8AdqSkLWp5JMSGDD0U+Fhs5kkzcj3dG81d6s3SokX
 pYrWdOKhk8datsuEIar25NexMrpS0OD2UPwTYtsBFNRIoNaZhZTppZhWp
 2/2F+6imrqne6ZGVFBHMVuXWxrCP/2+QjuGID3cffyiBmOFWSmndIj65B
 amEOlGSQHEJERvsCbq+l/9ENCeogojnaSvqCzkHwPFR540diZppHW2V5Q w==;
X-CSE-ConnectionGUID: 3a3Phxt5QIau4PeFxCFIpA==
X-CSE-MsgGUID: ZnZLE+K6Q6qTaF9XSUJB4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="105093526"
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="105093526"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 12:31:44 -0700
X-CSE-ConnectionGUID: YQW0FlMlRgKPDNvh3u7obw==
X-CSE-MsgGUID: tm9W0ay8Rumb61jzx7pIFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="247933156"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 12:31:44 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 16 Jun 2026 12:31:44 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 16 Jun 2026 12:31:44 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.48) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 16 Jun 2026 12:31:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bbQa51L7ss3RsoXbwO8cW/vwQofn5Rq8anOZrKSzLCH9noUEuTXNM92dnDZcPKvyqQrjJYDzpEGhmminEIWcuuGv2rc29hTbDVPYik7Mc2TzVQ818kXbxZS2BxWLMglepEBJ5ZHN7TSrHcwlnKg5f6FfRw7Nsqde8QbZkIOZVoxg0Pf/CsencvzVMTPKErALQdiM6CeRmc8LKHQ6XDiPbtzUwcnMRgACUmH6Cq7Hq+i5aHQGrrLvRUZYpE0u0HJI39ypu5+vnx06pgluv2HWoDSSasN13d9Oh3aoZ6z43L0DikTVHq1WJEpbnxJxJqRB2EoQNiXGT5w13VYaVodvgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZXEdYEx8PpR/waV4hEVyCoIINYTAOzH2Yc9uZJCb5qU=;
 b=Sl+g1P0OBNIxam2lTLRPnTs4BYAZ8oURP91kuCKX3LLTGJv4vcGcDpgsBGCNP9EchOESluMr/OhQJWI1uOXHpS3Q01vi353LKUJ5eHVupJxrNO92SRcPPf7PMJeW/ynU11U4XOcSxDIkaR/MfXw5B3M6OG45o5sZov9QkK83Zt1QgMGi/NgL2Z5mBheY/sJkBarAi7cMSjjD3AsTcONmFKMIRnKvPVYb+izzdQjMqogjBEo/I2SyRf7N/yc9gic1edkPJk/WhAiqc6OHGGbgvaWgZ7BS0G4uUgn0hyl3XNN0OlLT3Y4TAjLlo+M6N/VFx7/GiN2tqNhjPzfvzc50YA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8284.namprd11.prod.outlook.com (2603:10b6:806:268::21)
 by SA0PR11MB4621.namprd11.prod.outlook.com (2603:10b6:806:72::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 19:31:39 +0000
Received: from SN7PR11MB8284.namprd11.prod.outlook.com
 ([fe80::65e5:898b:2231:bf65]) by SN7PR11MB8284.namprd11.prod.outlook.com
 ([fe80::65e5:898b:2231:bf65%4]) with mapi id 15.21.0113.015; Tue, 16 Jun 2026
 19:31:39 +0000
Date: Tue, 16 Jun 2026 12:31:26 -0700
From: Violet Monti <violet.monti@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/9] drm/xe/step: Pass xe_step_info to xe_step_*_get()
 functions
Message-ID: <ajGkjkWNWCDlbfwP@vmonti-desk>
References: <20260609-xe-probe-info-v1-0-21e83e188e60@intel.com>
 <20260609-xe-probe-info-v1-2-21e83e188e60@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260609-xe-probe-info-v1-2-21e83e188e60@intel.com>
X-ClientProxiedBy: BY5PR04CA0028.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::38) To SN7PR11MB8284.namprd11.prod.outlook.com
 (2603:10b6:806:268::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8284:EE_|SA0PR11MB4621:EE_
X-MS-Office365-Filtering-Correlation-Id: d9ce6414-dcca-4a8d-11c5-08decbdde348
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|376014|1800799024|56012099006|11063799006|4143699003|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: hOwvTp4F49ByZ14xMM69nRpJZ25RkyH+jm1ItrfihZf1QSdTcDoJ980IWZ33S7LYsZCeGGY2SkufkbSlnmEiE1WQw0PGmD2C3RzkkQ2UUSnCNQYdl6Sh3KeNhoJDkXqsvupR9H8mYjRDxEnc59jA/2nerxRlR5y0KqqYpq55TKkWwL6mXlPckZxYqcSDKQiinbmNKaUqRnSP7NbJXO+w91W89rUBZXxzeEdGZIseQ2zrzKSgRKwsehOGoLSGE7I0OubwBccZeeqFwO1g4Y0M+T/ckqB+gh9P+pcZfZSRHWxUC5jq9vLnzDLhnYN3Qft5Kek8iOCBomtrxh6aVXovJ+u95RDJP9iDxIubrVHD1LqXMrgwkcCQlxF7aOMHySyesJTzGKPtbsz0NrIo2SwlC2cNRh4U6Fu3dPXdT7QXj8+vKsTFF73w1XoLz1PM0LAK4MtuaJCZpDlmZvXJ2w1y9rLaprjSde+3XAa/hpweVp3J1xcAogBVl/kT1LmO55pki/2DDae96/9At0ZCYM/YjrI/E8f63JWj1t87pDDSM9HMsugafzZrIY2VIeR3Zwxz1eioAt1+GGBjFZcYOiALqG/ucCpq6cCnDaOO1hbm3qExa+IieFJ3WOjuXXKLJskKm3EEH0Lawdk/w0h0YV58A13W0qW18TxJgDPTD7nssmq+22MOw9sNHdnj4iLEOrWO
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB8284.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(56012099006)(11063799006)(4143699003)(6133799003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oAe5SBhI5AdtGfyWBSrpd4K2dDG/ToQ16TxPlQoK97SYTZlJC+SL0lbDH08s?=
 =?us-ascii?Q?pRCoA+ipCwpaR9mCLJrnJRgmprdEx7EkahBXL8eJsXsLTim1e7evUAeoVOpE?=
 =?us-ascii?Q?78q1/UPrT/fnMcX2rhhpsVPM2VY8s3sM4Cxj8uzyAr3NGXLUBeXs8FlEz93T?=
 =?us-ascii?Q?tZqxEpEIsYgLEfWGW2HA9rCbGf4NT5XiYPSdy7jiLXL4NwLONkfoEGNIIYc/?=
 =?us-ascii?Q?angMPsSiTipfVZEhrBx5rVVWRe1A+AjIJYdb2m8bacsou4RrDWCTllOrFAMi?=
 =?us-ascii?Q?JmP+5ANQsSPDftW/kPW2NqclV8GSmmByKrbCsF9t72BbTNaMyjpu5KZ1Itm8?=
 =?us-ascii?Q?2ephDlI5iKpleKVrxJ5ADFdJNFn9QLtiNjJECq46jRakqJbh1qeJdOTFO+VV?=
 =?us-ascii?Q?wHBgLDEc9hvVFqt3fL4r8KKzAEyyzzwUCOKsyOKx96QIAcdCHz1Khs+oBEyJ?=
 =?us-ascii?Q?olRWw42Xe/t+0AQ+2skHAUjWMpggh4NIIIhAszlZqgLXpsQpgqUmBMxB1Lui?=
 =?us-ascii?Q?oEpRHToBTYY7e/cOVavZVwPFkL05pVE3Jyb6iW8M8glYZmZP3Ebgg4sNdkCc?=
 =?us-ascii?Q?Ngj+Sx+9jE9roY/pwBdpyV5YOodtR6+lItEAEGswTSirnqRJlRPdAlBtvHvI?=
 =?us-ascii?Q?3vmUf6Hx0bqj5+AIIhO6mSnJDmR/8BjgAWpT/JKLyM005vyauX2Dgv2UlZXe?=
 =?us-ascii?Q?kYdPnb5PaTs6h24opPIyD4ZAOrr4KCsGLTW51FZeW78yhnRBBMWBHh5h43jr?=
 =?us-ascii?Q?/MojPOfV6bRwEK/5w55qLBDiHRTFHxG5JDpbVpdv+4ZLLAKdQX5Zf16ac6TU?=
 =?us-ascii?Q?k65eZuhqsCqXtyTmvBNl/hrz16cdq0NHWZLkNO5za9l4ZyUsmLSp/g93xIRr?=
 =?us-ascii?Q?fnvZ9+RT3ySbp4cnRFhsdvHSfNPtRx4TF5r7ri5hNu6riCPQjVl98Mb90BNf?=
 =?us-ascii?Q?1GW3knwyjdrSSnwK+dH5ihCIGKKQscmzfhqIpaQZxNrdWF0Dgd6+G/WRAaLo?=
 =?us-ascii?Q?5rQdu8EB0xOU1MwIJAjs1atEllsDXlEnm2UCOrD607FBKbZplX59jyPr6ljb?=
 =?us-ascii?Q?gSO89gVq7amCkanyIkG/4R47zOJmp+1GghPW6vOrBsiSFJ8sWyo1OgtfWfF7?=
 =?us-ascii?Q?BDZS98VpL+WsaN72FO76VZFYWymep+B2MSG1FgPHGZmA48JjlxVu3h2GkwbU?=
 =?us-ascii?Q?ZKUyHagwyyRAN8/kt7n8+dyq1Qx2v1+ptSLBZ0DtXWTBDyH9dIVl6K+gxGJy?=
 =?us-ascii?Q?AzzdgRssfQnsvEyb603bfGds+0PL5DPhCUJGAwAXimPIJOUnNKRY84+81gXj?=
 =?us-ascii?Q?+S4MkqKPVn60+54M6FH/0ecMqMFwNAPbq4e+cHLlhhr3RQZ/SHSK+b6Qj2hG?=
 =?us-ascii?Q?aZQtTQqeZi3DjOn5X3iEhUPb3AC0ocVu2XdmOYWl/3ABRLKzJsnEgbvGr4UX?=
 =?us-ascii?Q?41uoYZ6D5jTiTeh7FGlcBYD3HegagkagEh7m6FyY4J5puu6ANSZJUWTiOrux?=
 =?us-ascii?Q?P12C0pasmfeGg6no2aUw2WRvZBKznUzYSPwenTVJchjFxYY5OSh30SNnO19D?=
 =?us-ascii?Q?B8d1of13KwUyRtm3ALuMmkLjIKtWqsW21N1kNnM7XQkAUL0zZQoGkC60ha2N?=
 =?us-ascii?Q?ECwiVIzTGOcc8pcSXONAHnPoIAkb4VVxAkGQfpI54NDNbC0mxxky6KIFuAEV?=
 =?us-ascii?Q?DYfHM0wegrsVpIDOKG+wy2uvaN53yyVpVHYsQQWxjKSlH1kyPIEDmsNH1ijQ?=
 =?us-ascii?Q?vHhq3EAe1w=3D=3D?=
X-Exchange-RoutingPolicyChecked: eBAKBzqYRTDiiAuVjR6FCuG2AbPml87edIld4BSgRK3fUecHIXeZBpll2CzT1lsjhpjaSa1KJhvr82pmxl/gu4ByjZZ0mC5sbFmwo2k0gC9wHSZkR1xc2Igb1pENVbwr4KSLoBn2hyekpi2gYdfg1kgwjas+vxL2MTXiW5hFjUYgE7fj2vJ+sb2NQ8vkhMlyxTwCycSP+4X4T6dP2MvIE9IKF+zecrxorJcbihto8gUd4/vRwjDiKgZDeoHtV7LTSpi5DLEFuTF3UTUjOO2IlAShpISZk1OtrsdOgBWWoBSxJwnf/NIbSeZ9uTxtwe8S1H13Hee8ruXATLlDRz5GMA==
X-MS-Exchange-CrossTenant-Network-Message-Id: d9ce6414-dcca-4a8d-11c5-08decbdde348
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8284.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 19:31:39.5654 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BWhTyt//rKMgTOn5+eKZsmMie3jwj7zawNek8vnmSXZvCvF+tBLRcKx6pRN8NoluBTiZ77blM86HdgMhdXtSbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4621
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

On Tue, Jun 09, 2026 at 05:17:34PM -0300, Gustavo Sousa wrote:
> The xe_step_*_get() functions update the step directly in
> xe->info.step and are called by functions xe_info_init_early() and
> xe_info_init().
> 
> As the stepping info is something probed from the hardware (via PCI
> revid and/or GMDID) and we want to move away from probing inside
> xe_info_init*() functions, let's make xe_step_*_get() functions modify
> a pointer to the step structure instead of modifying xe->info.step
> directly: this will allow an upcoming change that will move those
> function calls out of the info init functions and will pass a member
> of struct xe_probed_info instead of xe->info.step.
> 
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>

Reviewed-by: Violet Monti <violet.monti@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_pci.c  |  6 +++---
>  drivers/gpu/drm/xe/xe_step.c | 33 ++++++++++++++++++++-------------
>  drivers/gpu/drm/xe/xe_step.h |  7 ++++---
>  3 files changed, 27 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 7f1da6d25011..646e04c6254f 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -811,7 +811,7 @@ static int xe_info_init_early(struct xe_device *xe,
>  	xe->info.max_gt_per_tile = desc->max_gt_per_tile;
>  	xe->info.tile_count = 1 + desc->max_remote_tiles;
>  
> -	xe_step_platform_get(xe);
> +	xe_step_platform_get(xe, &xe->info.step);
>  
>  	err = xe_tile_init_early(xe_device_get_root_tile(xe), xe, 0);
>  	if (err)
> @@ -963,7 +963,7 @@ static int xe_info_init(struct xe_device *xe,
>  	if (desc->pre_gmdid_graphics_ip) {
>  		graphics_ip = desc->pre_gmdid_graphics_ip;
>  		media_ip = desc->pre_gmdid_media_ip;
> -		xe_step_pre_gmdid_get(xe);
> +		xe_step_pre_gmdid_get(xe, &xe->info.step);
>  	} else {
>  		xe_assert(xe, !desc->pre_gmdid_media_ip);
>  		ret = handle_gmdid(xe, &graphics_ip, &media_ip,
> @@ -971,7 +971,7 @@ static int xe_info_init(struct xe_device *xe,
>  		if (ret)
>  			return ret;
>  
> -		xe_step_gmdid_get(xe, graphics_gmdid_revid, media_gmdid_revid);
> +		xe_step_gmdid_get(xe, graphics_gmdid_revid, media_gmdid_revid, &xe->info.step);
>  	}
>  
>  	/*
> diff --git a/drivers/gpu/drm/xe/xe_step.c b/drivers/gpu/drm/xe/xe_step.c
> index fb9c31613ca7..49dc64f2b363 100644
> --- a/drivers/gpu/drm/xe/xe_step.c
> +++ b/drivers/gpu/drm/xe/xe_step.c
> @@ -111,11 +111,12 @@ __diag_pop();
>  /**
>   * xe_step_platform_get - Determine platform-level stepping from PCI revid
>   * @xe: Xe device
> + * @step: Pointer to the step struct to update
>   *
>   * Convert the PCI revid into a platform-level stepping value and store that
> - * in the device info.
> + * in @step->platform.
>   */
> -void xe_step_platform_get(struct xe_device *xe)
> +void xe_step_platform_get(struct xe_device *xe, struct xe_step_info *step)
>  {
>  	/*
>  	 * Not all platforms map PCI revid directly into our symbolic stepping
> @@ -127,17 +128,20 @@ void xe_step_platform_get(struct xe_device *xe)
>  	 */
>  
>  	if (xe->info.platform == XE_NOVALAKE_P)
> -		xe->info.step.platform = STEP_A0 + xe->info.revid;
> +		step->platform = STEP_A0 + xe->info.revid;
>  }
>  
>  /**
>   * xe_step_pre_gmdid_get - Determine IP steppings from PCI revid
>   * @xe: Xe device
> + * @step: Pointer to the step struct to update
>   *
> - * Convert the PCI revid into proper IP steppings.  This should only be
> - * used on platforms that do not have GMD_ID support.
> + * Convert the PCI revid into proper IP steppings and update @step->basedie,
> + * @step->graphics and @step->media accordingly.
> + *
> + * This should only be used on platforms that do not have GMD_ID support.
>   */
> -void xe_step_pre_gmdid_get(struct xe_device *xe)
> +void xe_step_pre_gmdid_get(struct xe_device *xe, struct xe_step_info *step)
>  {
>  	const struct xe_step_info *revids = NULL;
>  	u16 revid = xe->info.revid;
> @@ -234,9 +238,9 @@ void xe_step_pre_gmdid_get(struct xe_device *xe)
>  	}
>  
>  done:
> -	xe->info.step.graphics = graphics;
> -	xe->info.step.media = media;
> -	xe->info.step.basedie = basedie;
> +	step->graphics = graphics;
> +	step->media = media;
> +	step->basedie = basedie;
>  }
>  
>  /**
> @@ -244,8 +248,10 @@ void xe_step_pre_gmdid_get(struct xe_device *xe)
>   * @xe: Xe device
>   * @graphics_gmdid_revid: value of graphics GMD_ID register's revid field
>   * @media_gmdid_revid: value of media GMD_ID register's revid field
> + * @step: Poninter to the step struct to update.
>   *
> - * Convert the revid fields of the GMD_ID registers into proper IP steppings.
> + * Convert the revid fields of the GMD_ID registers into proper IP steppings
> + * and update @step->graphics and @step->media accordingly.
>   *
>   * GMD_ID revid values are currently expected to have consistent meanings on
>   * all platforms:  major steppings (A0, B0, etc.) are 4 apart, with minor
> @@ -253,7 +259,8 @@ void xe_step_pre_gmdid_get(struct xe_device *xe)
>   */
>  void xe_step_gmdid_get(struct xe_device *xe,
>  		       u32 graphics_gmdid_revid,
> -		       u32 media_gmdid_revid)
> +		       u32 media_gmdid_revid,
> +		       struct xe_step_info *step)
>  {
>  	u8 graphics = STEP_A0 + graphics_gmdid_revid;
>  	u8 media = STEP_A0 + media_gmdid_revid;
> @@ -270,8 +277,8 @@ void xe_step_gmdid_get(struct xe_device *xe,
>  			media_gmdid_revid);
>  	}
>  
> -	xe->info.step.graphics = graphics;
> -	xe->info.step.media = media;
> +	step->graphics = graphics;
> +	step->media = media;
>  }
>  
>  #define STEP_NAME_CASE(name)	\
> diff --git a/drivers/gpu/drm/xe/xe_step.h b/drivers/gpu/drm/xe/xe_step.h
> index ea36b22cc297..c6cea95a3727 100644
> --- a/drivers/gpu/drm/xe/xe_step.h
> +++ b/drivers/gpu/drm/xe/xe_step.h
> @@ -12,12 +12,13 @@
>  
>  struct xe_device;
>  
> -void xe_step_platform_get(struct xe_device *xe);
> +void xe_step_platform_get(struct xe_device *xe, struct xe_step_info *step);
>  
> -void xe_step_pre_gmdid_get(struct xe_device *xe);
> +void xe_step_pre_gmdid_get(struct xe_device *xe, struct xe_step_info *step);
>  void xe_step_gmdid_get(struct xe_device *xe,
>  		       u32 graphics_gmdid_revid,
> -		       u32 media_gmdid_revid);
> +		       u32 media_gmdid_revid,
> +		       struct xe_step_info *step);
>  static inline u32 xe_step_to_gmdid(enum intel_step step) { return step - STEP_A0; }
>  
>  const char *xe_step_name(enum intel_step step);
> 
> -- 
> 2.53.0
> 

-- 
--
Violet Monti
