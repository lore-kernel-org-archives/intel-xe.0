Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C7F910ED675
	for <intel-xe@archiver.kernel.org>; Fri, 27 Mar 2026 13:15:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BB7F10EE47;
	Fri, 27 Mar 2026 13:15:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RE5honph";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5B7F10EE47
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Mar 2026 13:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774617332; x=1806153332;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=6x8e+2eEz75BrgPk8wy56xE6FZ5f97gxpiHz9aV2yxw=;
 b=RE5honphWQ7rCcqFlfqUAiPL8mmJ3L7zOAcOv1+saFNW2WuiAUOzd7gh
 qZ0FM73ponhWkFKi7FZ4GYbf9oqn3NH1rEGCj9bU9PVPQOIzwnqnSN2dT
 +mylHiwgYOjUUHDyTfslcsHdE1EGv9tIBJgX+waOQZBMKxbKTLlwUrxZ8
 HiQUKF9k735N3mOIzJiEH3Ln2OCLR9GntdNQxol0fJYle4mdGJSpZu+oD
 HBNCsn3tE47S+GXLS2IOVG/ggXdHuvcQTmDGA70rVf+fQzOuarQwamnPF
 /pURVCeXZCWA21lohroWdRPAJm79F7kBaiyFiKWA03Yg++zxFD9P6UkpS g==;
X-CSE-ConnectionGUID: G/SrQxEIR3yaHEFuWuTHNw==
X-CSE-MsgGUID: aRxKB9ggTS+reOZBzvatHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="79595384"
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; d="scan'208";a="79595384"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2026 06:15:32 -0700
X-CSE-ConnectionGUID: tKgtmPayRhunA+YsrLxUtA==
X-CSE-MsgGUID: 70NHwMoyTJuYzm8WgqA2Jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; d="scan'208";a="224519264"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2026 06:15:25 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 27 Mar 2026 06:15:24 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 27 Mar 2026 06:15:24 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.31) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 27 Mar 2026 06:15:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LOWd4J69xfbTFHWDYTdRWQCEBh+SX15z+CUi5L+4ZM6DgozGUMB/ijI0HAHPGpxhWH7DGSLc0AuIsw7gCrJqCDYgwuA8gdh0RPJ0rgsq0zGPg7LWR5imG2l1wcWsNCfCiRz8EUldKkFTvfizfJgyypgtNIwtZm+URAiYOgLZmP/FFXOX1JQBOe2TfUyXeZgdk7ZofN55lNpGL+OJDGrd5dmcCMODCvZXC0BPScRWYUye2VkA5Jo9U/lYse7nznA5mJOMVqQiRe2t3CerAflvuW56MwkieTd4dEmGGcpXXh/IXx4MHgqlpWLD2R1HC1ttlnpjl0Tc9z/e9WXwZf1S0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V0FUB3xZtBksQ1m/Yey795k/5EtIBKNJqGITdQ32bBc=;
 b=NugI/Shh4hyn2FhU2DGb0jAY+/CcDyoVVIMfLBzdH02EImiMzY+w2LLl9zbrdoPuWe1Ft5zereWh0PZQ3PomeYtcr9XNhPGWmkQCr4FtPFjw6xxuP3fSMJDbYGjHzVM1P+OWfBk6gIpThRilqEc+ybJXE7zha+jiXZ2Zaa6M4STU175XBYDs6Lt+Lax50+QTg9OMJ3Et6+DCcDVl1W8e4UJR7kDdNlWhPUjtDKxbTi9b2ef8fWEDTy16et3h+8iuxnW0H/xEET8IDtXQZXdK3VNWOmfWykE7aQabU33EZ+qj3ldygRhOwD2d4jqCsdtT6Dme9CJEI3Xrz1jNbmuHYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by CYYPR11MB8332.namprd11.prod.outlook.com (2603:10b6:930:be::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.22; Fri, 27 Mar
 2026 13:15:19 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d%5]) with mapi id 15.20.9769.011; Fri, 27 Mar 2026
 13:15:19 +0000
Date: Fri, 27 Mar 2026 09:15:16 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/2] drm/xe: Avoid memory allocations in
 xe_device_declare_wedged()
Message-ID: <acaC5GaA5QH7HEaW@intel.com>
References: <20260326210116.202585-1-matthew.brost@intel.com>
 <20260326210116.202585-2-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260326210116.202585-2-matthew.brost@intel.com>
X-ClientProxiedBy: BYAPR01CA0071.prod.exchangelabs.com (2603:10b6:a03:94::48)
 To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|CYYPR11MB8332:EE_
X-MS-Office365-Filtering-Correlation-Id: 0583af02-deda-4436-ec0f-08de8c02e4e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|56012099003|22082099003|18002099003; 
X-Microsoft-Antispam-Message-Info: 8jebJwAlj6xxDJYALm2/FSDiWK7r8t4ncjkxxg/TF3chPN1fiymPLxWX25KvNVJsRLLyaNbRzUGicf7XGa2vGKBtBveJTFrFKrsbZ7G3x9geEp8oT5Hhm7TZm31QVRmQflXSQsYoPIf038T1aeVpqwEgol5wUtfv6iiAXstCBtwNo4/JfUNJDVwh+Sq4CoF2GHWn+8fzQTa80Hp3PFuIlYKHf88jgqdiu3eZrOyNVhg7iUsL5dCMbxX3OnCCjaAtrdv7+UnL9t7gDZPM58O0n5oA+AtNaECsaKtMOP//RsMvBhHZEOQTbyoTPRU+yeQRYIIw44NyajqBSDQAHrcwVz57R1sAWXdJT4JgIk6qwLx6pMbe6gmHz9Hzftb1gefehPLX+yWc21DF739iuzTyR8Xw4Cl51ar805qyCTQFJwxFDrs68V3trSxCRnPPazqSJcWAP1ZEUwWkbymfD4md8b6MbHQTRuOHpFKXHiQlXml+WYSM06pS/0IPT24dQI1fs2jXbtdBo6jdPTkUSN7AAhE5mDG8xduylnx8QZmNiJUA0fmDAHz9M6C9nM7eIa+KLrny5kHy3V5bKK7lhgEL8GYg0lnLl+SlgJIFT97516woraXBwXSywvBp4nlCxQkfQ7wQR5PDUVkBg3ZrMFpvqm0y3cBQQGMvTFm+BZM5kD8EsibxBNTBf3Ey/pOYsQjNU6iPSmGgIO+Kt18E7NcPFvrEFnY4YBvufn4Kv7NgE3M=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?a4lT7KvfXpxeUulwiuvnOoJuraw8R5NCZ7XaubJadB02U/kXIW020F32poKx?=
 =?us-ascii?Q?YHckQ4GD7DTlqUCaImvXpfoijEZC2bZA98juWKTBciW4sxa7R8gTaVDF0iqo?=
 =?us-ascii?Q?MRkXO2cR/aXau3yp0TAxuA7YpFCsaXNbpzyoAybwrbFYb1DChIa9M210YYas?=
 =?us-ascii?Q?hn598Elfxxpv/NH3e9dCL31wW9WEbtzR1AFg7DvPO7uZP78rnb/VbJEJJRox?=
 =?us-ascii?Q?f/IloRXvRtsrldOA8zX7isRFxce0+gpZIG+0jfiwUfHCoMMYb1C7uvLlPEpO?=
 =?us-ascii?Q?LO5HxX/HgTwptH/E74qMU+anIfcWAxHkzWAzPdNd2BTMtRhxbFsYJu3zck6O?=
 =?us-ascii?Q?kdrNM+y3VdTnMHDw0MQlu4LDuIPVUgVENlQVQ3XsVVYbjvaFvO7efd6eT3Zb?=
 =?us-ascii?Q?tRKfWhfylzQvF4uZZ4gENoqabE36L6SX5Z2EtptVUYyApKFUObXZQOIybeU2?=
 =?us-ascii?Q?bkaMU2zFYDPkRnabqnOoVqpq+RZMo6tVFpnYSlNJHrNDcMGjFv1a/O3rk5sV?=
 =?us-ascii?Q?E6SWVr/oUGXx30HFByttsQzFbEL8FfIm/ysxumERBZifZ1UlCemCduF7RwAE?=
 =?us-ascii?Q?KcwGv84gWN/R/zFFp8xU9fPPjoGxD6ug+QAcZIxoNHAc10QoOBOcRBUch62t?=
 =?us-ascii?Q?77eggN0m0Dudo27Pq1x8sFeP/oPOLkpOEHCGSghsME3Ze6rkE6OoCT58dcMG?=
 =?us-ascii?Q?fLS3p+jrG64Y1C+vXiJM6O/Or8IZaDdA+6xHaYNR3DTZRKmepHOSu7ld0j7U?=
 =?us-ascii?Q?9zTtsM6YA6t0cWrds2DXiVTvi9gb3zfZm0KaWHX/5Fs2ZglGO4xHLR2h7vak?=
 =?us-ascii?Q?jXrtjT6rTSjQLK20HobD8np33PlZm/FBQBImgIg1NBJhaatUgMMWpXaotpCu?=
 =?us-ascii?Q?9Ox3T0jUG8oDMyn6jnuE5G+MIWNah1Ien7D4TiNNeMVf7ln7P41936B5D4H4?=
 =?us-ascii?Q?j6gUZizQAV5AW2DVBARb0MdPFemJJMG199lfl0IJ0WipQl9fdpmLcKN/M1s7?=
 =?us-ascii?Q?OQJD5ZDfvXYqGL7CaGxJbwvXxegyH+xVvi6K7Y3Z0x1nzU64oykU+HrdkXgs?=
 =?us-ascii?Q?cT23C+IsC1DrYsZDYA1gzASz0z/4R5hH9yrZWzwykPEpPbjaJYvnSwaAiuMJ?=
 =?us-ascii?Q?SJ4DALCQ8lJN5HZKM2BNEkYVHE8guJ1Dbks55n2pA1m7BmuB2Mp04TrQJdKj?=
 =?us-ascii?Q?StmiEvgt9OC+V8CU+HMePf/+pLFKSbSgtH2pApThAs6d0qnb0kY1UqfuFLAj?=
 =?us-ascii?Q?mZaEm752ZE9avu0lRbxNQNE+AR9hwZTVhjnT4a3759eVx1zXH/L5w7sqE+1V?=
 =?us-ascii?Q?7UhJ4sTlJXoUBiKZenpJ8jcDNR48dxu+gOKYY/iurIrtPeiaEHHDk6LTL5mO?=
 =?us-ascii?Q?DKkpsqyrB0dGs+olm9y7+o9WmULfa2T+h1crZ1BHJeaF1nvOlM5QtKBCZANR?=
 =?us-ascii?Q?Nfu99W63GC6drBbaxTgBy81L3lIfAt/kpf+9hNB3fSZ3p+w/ijj03r8LP28J?=
 =?us-ascii?Q?1tTXhQ2wK5EksrEsGPuxx6QpoRJrzBgwSheda01VAuzFCNPQCFS2W8V8Dz8t?=
 =?us-ascii?Q?hlPJS149rTBHS30SMLMswhm/gm8+Ns8yz93yiTJi12j5Q1VaSWQ1gWSySySK?=
 =?us-ascii?Q?BtpOs9txcWPV7+GBQMiONBGk6xJmgXgT0RFuz2XXD2zfk/9crqbzSfvzOifc?=
 =?us-ascii?Q?gFRiVSKH13td9pOCK3YNVQ5psUf5/nuThI5FNxVBYMLxlyDZawXBGqYfxpy7?=
 =?us-ascii?Q?6/FvyFhwZw=3D=3D?=
X-Exchange-RoutingPolicyChecked: mGywomJj2sMHDjy38D1yw7GHw4aMDdA+P6PtXN9ahhbaEcm4FA/PdImgsjkzM96kWUJDWJS13ttTAFiudS1QA/l+6bo3Nxf87HGNQ2zZdwbV/tvY3+5skM1HeC1AnR3l3Ya3ngtmKQCkIk1DQubd+YBCtKn8Drlz87OObEwfKqlfsTLqlKro9lHuM36gGj/fzCci8FeTudr293Ef4cuttD84fxh63lbqid426fHVNctinIw596F1vRnRusj3KrUD2wbjbD/Kfr9nRir2uDfudB6cqBsiaXE7UicyJ7Likwc91BlD472VzbwjK2D4iB7HU2bFQh9WqBAW1bl+M4CtKw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0583af02-deda-4436-ec0f-08de8c02e4e5
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2026 13:15:19.4749 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MiT3+w7+GvyLZj0+QcBVyRJerGAF3AlMQ7XIi8t9KS4admIMdozG05G5niAZi/1O7GNpD5uukRXQq/c4lMnt3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8332
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

On Thu, Mar 26, 2026 at 02:01:15PM -0700, Matthew Brost wrote:
> xe_device_declare_wedged() runs in the DMA-fence signaling path, where
> GFP_KERNEL memory allocations are not allowed. However, registering
> xe_device_wedged_fini via drmm_add_action_or_reset() triggers a
> GFP_KERNEL allocation.
> 
> Fix this by deferring the registration of xe_device_wedged_fini until
> late in the driver load sequence. Additionally, drop the wedged PM
> reference only if the device is actually wedged in
> xe_device_wedged_fini.
> 
> Fixes: ("452bca0edbd0 drm/xe: Don't suspend device upon wedge")
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_device.c | 27 +++++++++++++--------------
>  1 file changed, 13 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 9b0540e3e289..ffea4a453c01 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -833,6 +833,14 @@ static void detect_preproduction_hw(struct xe_device *xe)
>  	}
>  }
>  
> +static void xe_device_wedged_fini(struct drm_device *drm, void *arg)
> +{
> +	struct xe_device *xe = arg;
> +
> +	if (atomic_read(&xe->wedged.flag))
> +		xe_pm_runtime_put(xe);
> +}
> +
>  int xe_device_probe(struct xe_device *xe)
>  {
>  	struct xe_tile *tile;
> @@ -1009,6 +1017,10 @@ int xe_device_probe(struct xe_device *xe)
>  
>  	detect_preproduction_hw(xe);
>  
> +	err = drmm_add_action_or_reset(&xe->drm, xe_device_wedged_fini, xe);
> +	if (err)
> +		goto err_unregister_display;
> +
>  	return devm_add_action_or_reset(xe->drm.dev, xe_device_sanitize, xe);
>  
>  err_unregister_display:
> @@ -1240,13 +1252,6 @@ u64 xe_device_uncanonicalize_addr(struct xe_device *xe, u64 address)
>  	return address & GENMASK_ULL(xe->info.va_bits - 1, 0);
>  }
>  
> -static void xe_device_wedged_fini(struct drm_device *drm, void *arg)
> -{
> -	struct xe_device *xe = arg;
> -
> -	xe_pm_runtime_put(xe);
> -}
> -
>  /**
>   * DOC: Xe Device Wedging
>   *
> @@ -1324,15 +1329,9 @@ void xe_device_declare_wedged(struct xe_device *xe)
>  		return;
>  	}
>  
> -	xe_pm_runtime_get_noresume(xe);
> -
> -	if (drmm_add_action_or_reset(&xe->drm, xe_device_wedged_fini, xe)) {
> -		drm_err(&xe->drm, "Failed to register xe_device_wedged_fini clean-up. Although device is wedged.\n");
> -		return;
> -	}
> -
>  	if (!atomic_xchg(&xe->wedged.flag, 1)) {
>  		xe->needs_flr_on_fini = true;
> +		xe_pm_runtime_get_noresume(xe);
>  		drm_err(&xe->drm,
>  			"CRITICAL: Xe has declared device %s as wedged.\n"
>  			"IOCTLs and executions are blocked.\n"
> -- 
> 2.34.1
> 
