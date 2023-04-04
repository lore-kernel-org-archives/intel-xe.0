Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58BC3C76196
	for <intel-xe@archiver.kernel.org>; Tue,  4 Apr 2023 03:44:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C0FF10E0AB;
	Tue,  4 Apr 2023 03:44:30 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CDCF10E0AB
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Apr 2023 03:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680579867; x=1712115867;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=brBjHPUNZaz04BxAoVGpq8vi/d8WGd5ScdheY1Om9+I=;
 b=FzOnPUV246FtIdhCbD3ycjqEs0FW+bLkiZD75s5MMAokH9yErNk2nK/D
 7G/vuLYH9ceMXTz7Rdqo8jvxx+4CW1MN7Qt6+j69T1SRGfHTG2JsoB/x8
 9/sZwxg/hhBwNoja1jgrPj8zMi5/ohOIv2+VdOXMyDUIs34oXzpqzri6N
 JwXAZl3cy1fAIb9vreQ1j1GCfgz8OAZBTDa+z7yWdcZ9qcqiCBPgMbzTZ
 qsZbkhpXf2M7yqLls/+3hlHfocN3fFDGMo65o6T9FzMWZ5B76QBmGemsl
 UXcBAc3dg1eg12QvfEq7vqJAUz4ZImNWniwRpLsBRWa9k8HLf+7wJui35 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="369891995"
X-IronPort-AV: E=Sophos;i="5.98,316,1673942400"; d="scan'208";a="369891995"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2023 20:44:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="829821846"
X-IronPort-AV: E=Sophos;i="5.98,316,1673942400"; d="scan'208";a="829821846"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga001.fm.intel.com with ESMTP; 03 Apr 2023 20:44:26 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 3 Apr 2023 20:44:26 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 3 Apr 2023 20:44:26 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Mon, 3 Apr 2023 20:44:26 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.103)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Mon, 3 Apr 2023 20:44:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PVjv9CwiUHrrTV+9let5jXSUxYQW4vjC7GXH8iWmFreZYf6/V/NLgjsRCp05wHl6LfCk6limqh96sAwy2084cJSXcf2p6YMScsXMSI90Li7SVaHnmQQckwGn/fHmZnCCDW90AzC4cI1QLRnTpYqemFG141C7izGSJf38XTeoGgJG9WMI4MkKxJfqPkW3dYFgCvLBq/Gq3fBDExj76KWK6GynLxXMSYuON2YXSk4Q3iY6AQocrAaqQx5K6tVFh2IQ6/Pn7pLIO9LGmfFQxavji/+OjC8wAjRiiS3DRfY6afY1hwksh1LEb1dT/wphcyBUfc+KWDdD+kbbYTcuvWVh5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0PUcrfkDb3pUR/hFaYhXJeHLIv2f4IGwMhXoTc/tN3s=;
 b=L22a8ErNwJLRsu2iZviAeobIkX8D7FWbN+dBa565WVtAcPKtmRHs6vKnbua549sKcaA1JwwGkMNibtZD4/iHi4M/EzZ7i2sd19xhFYbJIcmVCm1+2SwtrdKt5LTqNxtkMPQyQyMhIZKzUkGSs7A0fnCGOk9J4Sn9tIuQ7ar6Ltrekr6QXlKuH5UaHf8/P/dxijq10u57Qbqc1Q4qqpXT+14zUN0zHKcZK5Lb03UA7FEOF/BihEayxV6U+Xi218mxo9KXqDw6MXRLV17gCOYsSlEGUzukJlrKDiHwnksao3yUt08DBaIivkDTh98eGcyxnMOj79Ll1okq+aLQiToVpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by BN9PR11MB5529.namprd11.prod.outlook.com (2603:10b6:408:102::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.33; Tue, 4 Apr
 2023 03:44:23 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e%9]) with mapi id 15.20.6254.033; Tue, 4 Apr 2023
 03:44:23 +0000
Date: Tue, 4 Apr 2023 03:44:18 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: "Chang, Bruce" <yu.bruce.chang@intel.com>
Message-ID: <ZCudEneYy6bOCqCa@DUT025-TGLU.fm.intel.com>
References: <20230403222031.4255-1-yu.bruce.chang@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230403222031.4255-1-yu.bruce.chang@intel.com>
X-ClientProxiedBy: BY5PR03CA0028.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::38) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|BN9PR11MB5529:EE_
X-MS-Office365-Filtering-Correlation-Id: f56d3f64-b534-4cbe-b136-08db34bee159
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fHBkgIb0dnXcIQta4uDSa7e9vqfbenURxh2yOBg8I1NdITlWj+zyr7cMInymxZ2j4GA+3KA6pjNDkjvG5njz05qJY3LdBxII470xhRdWvYLIymkjU8iBLkIG5hOyPOrwNRQVR/gVnLazfx6Q9rFo8piZ5VXMrD8TgWK+YYmcFu7IvuDx9CdNHWB9OKMeviNWOnZ5XPJtJaig1RI72bLXxQ09tldKqwEiFDHRS4rU+2fdtzssJaK3zmayI17QdedHopQcCgC/r9vvxh7fyFZcEu5aZRW1bE3YBBnYByqUSwzbARNUIFrI5Zwpy6/crgajZ/NANrOCCvU/EbN7fGmuUA+C84W1T+lVTFzU+HhTE1pJUAtkiv6zPuziAZyy+AGkQnUEzskaQqb9iotjxD4Ndd/Efx2ZHtcL5GxJKrdGEXqHjZcaDeq5tn55RVnOgFWx1lTZF5re+k1tGOouoWZwlkF+qGX0fZDUrAtVc/5fCT9YQL8Q+zjPQaiu2a752pLETrn72o962c4iEC/THi9gLJ7iAQdbu6pv5m8+ZAW2UPxlb8CtZusq5wOsuWjpsK1M
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(136003)(39860400002)(346002)(396003)(376002)(451199021)(2906002)(44832011)(38100700002)(30864003)(5660300002)(6862004)(82960400001)(66946007)(8936002)(66476007)(66556008)(41300700001)(4326008)(8676002)(6636002)(86362001)(316002)(54906003)(83380400001)(6506007)(186003)(478600001)(26005)(6666004)(6512007)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?XmNidHBDpnC00tlDETjIP4XQMHCwLfdG+H1UBEbAcPGSRm9PTOQvqrp9d/?=
 =?iso-8859-1?Q?IMgBgqQ7lwGXf4tCRk/InvFUPIon5mi8i+mrCuO+gH/gFd0Tt/a1jf6PEG?=
 =?iso-8859-1?Q?w1cnnJ2R5dpn18Leyc/N6VyqCkgUzautk2U+7gvuYEko6u+9gdEuky58pU?=
 =?iso-8859-1?Q?Yy4oBAVo+8FQhNhLZrTrQUct7bzRXXmqRBMl6M0iOhdAJxOaG3kuhqw756?=
 =?iso-8859-1?Q?2hxJq2/FFAtPyGRi51zg4XqD6bDHDYwgWBouo4nrcJXhec07CYtfZbsHXj?=
 =?iso-8859-1?Q?nRnlDfAA7PBYQ245DjDliIHShVaQRYE9zm2PxGOH29nxA0ZVL49Vi9BNgh?=
 =?iso-8859-1?Q?lutRPo6DEWc4FOA6yR+iRnxxZFC1AA7HitEoRFaIvvOw/XjY+xbzeEsPzI?=
 =?iso-8859-1?Q?Zd4b1v/PSRobsFjuVpGAeqR5SCZN2PlR/4UdT7/xTrJTTDU5l+OGzy6veT?=
 =?iso-8859-1?Q?maYxYzlKLXVLqpHRdUT3yKX8zoqxCDfOE4QYe5iRFVkYckrD4oNgY19Ak4?=
 =?iso-8859-1?Q?9Wp2NCZVOz0tMYsNhcV/Keax61x3hCc8aUbqX4bnk1kgIfjSH9IHdVWlsq?=
 =?iso-8859-1?Q?2tS//64/JHu+hOFd1DI8hhXRclobYAJkhRO5qRSYqbsGWoFQEhv3nBeVfo?=
 =?iso-8859-1?Q?OXwx4yIC3avWejSo56gJ2Xk9ISGar6FK+f+Vd2Qho8ZRP+N5PihQ2u29u4?=
 =?iso-8859-1?Q?NuXwlbAOPdKDCODTZRDWQIaVdR+CZUzlf50IV9dg04fhxG3AovEhhkWcyz?=
 =?iso-8859-1?Q?3QEPREI7uypD980oqnI9Xngu4aIRYMjQF3UTJPSC8VR4CAAo81UviwJ/PD?=
 =?iso-8859-1?Q?inA94qx7hRXcn5jCj5ybglDILSSVye8/s2QxKbzS7nCpbFBmvtHTIUzsJX?=
 =?iso-8859-1?Q?YzQSIRgSEVhTx0Yf10382AKU/RIEPbRSjseLqCX/qOqW55bTGQf48Dr9jG?=
 =?iso-8859-1?Q?Q37Nvb9JwrpgOzaWjCQFEtNo0hM9aolhE3RtMKp70HruynWavR4VfnnV0B?=
 =?iso-8859-1?Q?WbXT+PziqmaE5UgfJynAGD835MEnXVVoBq/HRAAgvfv+X6Fh2dLcDqE2Kd?=
 =?iso-8859-1?Q?DWr0dnOgpaDFPgSR0v9jR2x+Og8D4EmKQBivtooBDBbF8FZvxAkl9VK3gd?=
 =?iso-8859-1?Q?5bfs8Av7/HAPyVg+GY2lAUy48r3T8M63j4l9+bBDzIIA+HEPdqPEiQlc9K?=
 =?iso-8859-1?Q?ar0zw75xeMZGCWp/k9tS6efeBqkRBsnf70gkNwXloF8k4amTiwTTRMPtoX?=
 =?iso-8859-1?Q?/noSylv2ZqmCvNopT2l0HDt7F4Tid7IHiWSN9zMbD2M12NjftbMTm1gNaG?=
 =?iso-8859-1?Q?i3QjV1hGjJE+XkTthK1UeGd5SX3Hln5Js9n8LTET/UXMganKhZt/GJ39Yz?=
 =?iso-8859-1?Q?mF+FCtEvvyWGJHuWikiMHWwEwv6e6TT943VKsyKQ0dTdPmIasVJvgoQVnt?=
 =?iso-8859-1?Q?WUOq3qsQIsk458MsaCM/ro1A4D1mDIZxao650TB2nPQCR79mlOiq9mgVSH?=
 =?iso-8859-1?Q?w8xRMV+fMz9C8kmLmxZ+gq6wi0PUQu+w0MmLvYMp0NENzV5A0ZBf6uqDPG?=
 =?iso-8859-1?Q?fvHzd3xgV0IfPyZyvq+JAZhQAp8SSJukKN5TpzuRa9eUB6FfPX1IaLUakB?=
 =?iso-8859-1?Q?sCWvjMPusZTf7peRlSVGDBYQ3+2Mj/9h0CMGHBfXkC/GNKVKuLX3T+LQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f56d3f64-b534-4cbe-b136-08db34bee159
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2023 03:44:23.4400 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UMtvPhJYqUTk1MG6mpp9pxaOxo6OulyJQj9ZQBndsjVnZiHplizDVyTimjV0QcvYUg4AZTj3d65+8iQUe4MI1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5529
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: fix pvc unload issue
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
Cc: Stuart Summers <stuart.summers@intel.com>, Vivi@dut025-tglu.fm.intel.com,
 intel-xe@lists.freedesktop.org, Rodrigo <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, Apr 03, 2023 at 10:20:31PM +0000, Chang, Bruce wrote:
> Currently, unload pvc driver will generate a null dereference
> and the call stack is as below.
> 
> [ 4850.618000] Call Trace:
> [ 4850.620740]  <TASK>
> [ 4850.623134]  ttm_bo_cleanup_memtype_use+0x3f/0x50 [ttm]
> [ 4850.628661]  ttm_bo_release+0x154/0x2c0 [ttm]
> [ 4850.633317]  ? drm_buddy_fini+0x62/0x80 [drm_buddy]
> [ 4850.638487]  ? __kmem_cache_free+0x27d/0x2c0
> [ 4850.643054]  ttm_bo_put+0x38/0x60 [ttm]
> [ 4850.647190]  xe_gem_object_free+0x1f/0x30 [xe]
> [ 4850.651945]  drm_gem_object_free+0x1e/0x30 [drm]
> [ 4850.656904]  ggtt_fini_noalloc+0x9d/0xe0 [xe]
> [ 4850.661574]  drm_managed_release+0xb5/0x150 [drm]
> [ 4850.666617]  drm_dev_release+0x30/0x50 [drm]
> [ 4850.671209]  devm_drm_dev_init_release+0x3c/0x60 [drm]
> 
> There are a couple issues, but the main one is due to TTM has only
> one TTM_PL_TT region, but since pvc has 2 tiles and tries to setup
> 1 TTM_PL_TT each tile. The second will overwrite the first one.
> 
> During unload time, the first tile will reset the TTM_PL_TT manger
> and when the second tile is trying to free Bo and it will generate
> the null reference since the TTM manage is already got reset to 0.
> 
> The fix is to use one global TTM_PL_TT manager.
> 
> v2: make gtt mgr global and change the name to sys_mgr
> 
> Cc: Stuart Summers <stuart.summers@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Vivi, Rodrigo <rodrigo.vivi@intel.com>
> Signed-off-by: Bruce Chang <yu.bruce.chang@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/Makefile                   |  2 +-
>  drivers/gpu/drm/xe/xe_device.c                |  2 +
>  drivers/gpu/drm/xe/xe_device.h                |  1 +
>  drivers/gpu/drm/xe/xe_device_types.h          |  2 +
>  drivers/gpu/drm/xe/xe_gt.c                    | 18 -----
>  drivers/gpu/drm/xe/xe_gt_types.h              |  2 -
>  drivers/gpu/drm/xe/xe_ttm_gtt_mgr.h           | 16 -----
>  drivers/gpu/drm/xe/xe_ttm_gtt_mgr_types.h     | 18 -----
>  .../xe/{xe_ttm_gtt_mgr.c => xe_ttm_sys_mgr.c} | 67 +++++++------------
>  9 files changed, 31 insertions(+), 97 deletions(-)
>  delete mode 100644 drivers/gpu/drm/xe/xe_ttm_gtt_mgr.h
>  delete mode 100644 drivers/gpu/drm/xe/xe_ttm_gtt_mgr_types.h
>  rename drivers/gpu/drm/xe/{xe_ttm_gtt_mgr.c => xe_ttm_sys_mgr.c} (52%)
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 669c7b6f552c..7e19a15af3dc 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -83,7 +83,7 @@ xe-y += xe_bb.o \
>  	xe_step.o \
>  	xe_sync.o \
>  	xe_trace.o \
> -	xe_ttm_gtt_mgr.o \
> +	xe_ttm_sys_mgr.o \
>  	xe_ttm_stolen_mgr.o \
>  	xe_ttm_vram_mgr.o \
>  	xe_tuning.o \
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index a79f934e3d2d..4fb9aff27686 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -279,6 +279,8 @@ int xe_device_probe(struct xe_device *xe)
>  	if (err)
>  		goto err_irq_shutdown;
>  
> +	xe_ttm_sys_mgr_init(xe);
> +
>  	for_each_gt(gt, xe, id) {
>  		err = xe_gt_init_noalloc(gt);
>  		if (err)
> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> index d277f8985f7b..d9d1b09a8e38 100644
> --- a/drivers/gpu/drm/xe/xe_device.h
> +++ b/drivers/gpu/drm/xe/xe_device.h
> @@ -116,4 +116,5 @@ static inline bool xe_device_has_flat_ccs(struct xe_device *xe)
>  }
>  
>  u32 xe_device_ccs_bytes(struct xe_device *xe, u64 size);
> +int xe_ttm_sys_mgr_init(struct xe_device *xe);
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 88f863edc41c..6fb53a54913f 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -195,6 +195,8 @@ struct xe_device {
>  			/** @mapping: pointer to VRAM mappable space */
>  			void *__iomem mapping;
>  		} vram;
> +		/** @sys_mgr: system TTM manager */
> +		struct ttm_resource_manager sys_mgr;
>  	} mem;
>  
>  	/** @usm: unified memory state */
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index fd7a5b43ba3e..a6ea138a7877 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -36,7 +36,6 @@
>  #include "xe_ring_ops.h"
>  #include "xe_sa.h"
>  #include "xe_sched_job.h"
> -#include "xe_ttm_gtt_mgr.h"
>  #include "xe_ttm_vram_mgr.h"
>  #include "xe_tuning.h"
>  #include "xe_uc.h"
> @@ -77,16 +76,11 @@ int xe_gt_alloc(struct xe_device *xe, struct xe_gt *gt)
>  		if (!gt->mem.vram_mgr)
>  			return -ENOMEM;
>  
> -		gt->mem.gtt_mgr = drmm_kzalloc(drm, sizeof(*gt->mem.gtt_mgr),
> -					       GFP_KERNEL);
> -		if (!gt->mem.gtt_mgr)
> -			return -ENOMEM;
>  	} else {
>  		struct xe_gt *full_gt = xe_find_full_gt(gt);
>  
>  		gt->mem.ggtt = full_gt->mem.ggtt;
>  		gt->mem.vram_mgr = full_gt->mem.vram_mgr;
> -		gt->mem.gtt_mgr = full_gt->mem.gtt_mgr;
>  	}
>  
>  	gt->ordered_wq = alloc_ordered_workqueue("gt-ordered-wq", 0);
> @@ -98,26 +92,14 @@ static int gt_ttm_mgr_init(struct xe_gt *gt)
>  {
>  	struct xe_device *xe = gt_to_xe(gt);
>  	int err;
> -	struct sysinfo si;
> -	u64 gtt_size;
> -
> -	si_meminfo(&si);
> -	gtt_size = (u64)si.totalram * si.mem_unit * 3/4;
>  
>  	if (gt->mem.vram.size) {
>  		err = xe_ttm_vram_mgr_init(gt, gt->mem.vram_mgr);
>  		if (err)
>  			return err;
> -		gtt_size = min(max((XE_DEFAULT_GTT_SIZE_MB << 20),
> -				   (u64)gt->mem.vram.size),
> -			       gtt_size);
>  		xe->info.mem_region_mask |= BIT(gt->info.vram_id) << 1;
>  	}
>  
> -	err = xe_ttm_gtt_mgr_init(gt, gt->mem.gtt_mgr, gtt_size);
> -	if (err)
> -		return err;
> -
>  	return 0;
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> index 8f29aba455e0..9d3117fad2e4 100644
> --- a/drivers/gpu/drm/xe/xe_gt_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> @@ -162,8 +162,6 @@ struct xe_gt {
>  		} vram;
>  		/** @vram_mgr: VRAM TTM manager */
>  		struct xe_ttm_vram_mgr *vram_mgr;
> -		/** @gtt_mr: GTT TTM manager */
> -		struct xe_ttm_gtt_mgr *gtt_mgr;
>  		/** @ggtt: Global graphics translation table */
>  		struct xe_ggtt *ggtt;
>  	} mem;
> diff --git a/drivers/gpu/drm/xe/xe_ttm_gtt_mgr.h b/drivers/gpu/drm/xe/xe_ttm_gtt_mgr.h
> deleted file mode 100644
> index d1d57cb9c2b8..000000000000
> --- a/drivers/gpu/drm/xe/xe_ttm_gtt_mgr.h
> +++ /dev/null
> @@ -1,16 +0,0 @@
> -/* SPDX-License-Identifier: MIT */
> -/*
> - * Copyright © 2022 Intel Corporation
> - */
> -
> -#ifndef _XE_TTGM_GTT_MGR_H_
> -#define _XE_TTGM_GTT_MGR_H_
> -
> -#include "xe_ttm_gtt_mgr_types.h"
> -
> -struct xe_gt;
> -
> -int xe_ttm_gtt_mgr_init(struct xe_gt *gt, struct xe_ttm_gtt_mgr *mgr,
> -			u64 gtt_size);
> -
> -#endif
> diff --git a/drivers/gpu/drm/xe/xe_ttm_gtt_mgr_types.h b/drivers/gpu/drm/xe/xe_ttm_gtt_mgr_types.h
> deleted file mode 100644
> index c66737488326..000000000000
> --- a/drivers/gpu/drm/xe/xe_ttm_gtt_mgr_types.h
> +++ /dev/null
> @@ -1,18 +0,0 @@
> -/* SPDX-License-Identifier: MIT */
> -/*
> - * Copyright © 2022 Intel Corporation
> - */
> -
> -#ifndef _XE_TTM_GTT_MGR_TYPES_H_
> -#define _XE_TTM_GTT_MGR_TYPES_H_
> -
> -#include <drm/ttm/ttm_device.h>
> -
> -struct xe_gt;
> -
> -struct xe_ttm_gtt_mgr {
> -	struct xe_gt *gt;
> -	struct ttm_resource_manager manager;
> -};
> -
> -#endif
> diff --git a/drivers/gpu/drm/xe/xe_ttm_gtt_mgr.c b/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c
> similarity index 52%
> rename from drivers/gpu/drm/xe/xe_ttm_gtt_mgr.c
> rename to drivers/gpu/drm/xe/xe_ttm_sys_mgr.c
> index 8075781070f2..cf5f4f73d4dc 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_gtt_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c
> @@ -12,31 +12,24 @@
>  
>  #include "xe_bo.h"
>  #include "xe_gt.h"
> -#include "xe_ttm_gtt_mgr.h"
>  
> -struct xe_ttm_gtt_node {
> +struct xe_ttm_sys_node {
>  	struct ttm_buffer_object *tbo;
>  	struct ttm_range_mgr_node base;
>  };
>  
> -static inline struct xe_ttm_gtt_mgr *
> -to_gtt_mgr(struct ttm_resource_manager *man)
> +static inline struct xe_ttm_sys_node *
> +to_xe_ttm_sys_node(struct ttm_resource *res)
>  {
> -	return container_of(man, struct xe_ttm_gtt_mgr, manager);
> +	return container_of(res, struct xe_ttm_sys_node, base.base);
>  }
>  
> -static inline struct xe_ttm_gtt_node *
> -to_xe_ttm_gtt_node(struct ttm_resource *res)
> -{
> -	return container_of(res, struct xe_ttm_gtt_node, base.base);
> -}
> -
> -static int xe_ttm_gtt_mgr_new(struct ttm_resource_manager *man,
> +static int xe_ttm_sys_mgr_new(struct ttm_resource_manager *man,
>  			      struct ttm_buffer_object *tbo,
>  			      const struct ttm_place *place,
>  			      struct ttm_resource **res)
>  {
> -	struct xe_ttm_gtt_node *node;
> +	struct xe_ttm_sys_node *node;
>  	int r;
>  
>  	node = kzalloc(struct_size(node, base.mm_nodes, 1), GFP_KERNEL);
> @@ -66,32 +59,31 @@ static int xe_ttm_gtt_mgr_new(struct ttm_resource_manager *man,
>  	return r;
>  }
>  
> -static void xe_ttm_gtt_mgr_del(struct ttm_resource_manager *man,
> +static void xe_ttm_sys_mgr_del(struct ttm_resource_manager *man,
>  			       struct ttm_resource *res)
>  {
> -	struct xe_ttm_gtt_node *node = to_xe_ttm_gtt_node(res);
> +	struct xe_ttm_sys_node *node = to_xe_ttm_sys_node(res);
>  
>  	ttm_resource_fini(man, res);
>  	kfree(node);
>  }
>  
> -static void xe_ttm_gtt_mgr_debug(struct ttm_resource_manager *man,
> +static void xe_ttm_sys_mgr_debug(struct ttm_resource_manager *man,
>  				 struct drm_printer *printer)
>  {
>  
>  }
>  
> -static const struct ttm_resource_manager_func xe_ttm_gtt_mgr_func = {
> -	.alloc = xe_ttm_gtt_mgr_new,
> -	.free = xe_ttm_gtt_mgr_del,
> -	.debug = xe_ttm_gtt_mgr_debug
> +static const struct ttm_resource_manager_func xe_ttm_sys_mgr_func = {
> +	.alloc = xe_ttm_sys_mgr_new,
> +	.free = xe_ttm_sys_mgr_del,
> +	.debug = xe_ttm_sys_mgr_debug
>  };
>  
> -static void ttm_gtt_mgr_fini(struct drm_device *drm, void *arg)
> +static void ttm_sys_mgr_fini(struct drm_device *drm, void *arg)
>  {
> -	struct xe_ttm_gtt_mgr *mgr = arg;
> -	struct xe_device *xe = gt_to_xe(mgr->gt);
> -	struct ttm_resource_manager *man = &mgr->manager;
> +	struct xe_device *xe = (struct xe_device *)arg;
> +	struct ttm_resource_manager *man = &xe->mem.sys_mgr;
>  	int err;
>  
>  	ttm_resource_manager_set_used(man, false);
> @@ -104,27 +96,18 @@ static void ttm_gtt_mgr_fini(struct drm_device *drm, void *arg)
>  	ttm_set_driver_manager(&xe->ttm, XE_PL_TT, NULL);
>  }
>  
> -int xe_ttm_gtt_mgr_init(struct xe_gt *gt, struct xe_ttm_gtt_mgr *mgr,
> -			u64 gtt_size)
> +int xe_ttm_sys_mgr_init(struct xe_device *xe)
>  {
> -	struct xe_device *xe = gt_to_xe(gt);
> -	struct ttm_resource_manager *man = &mgr->manager;
> -	int err;
> -
> -	XE_BUG_ON(xe_gt_is_media_type(gt));
> +	struct ttm_resource_manager *man = &xe->mem.sys_mgr;
> +	struct sysinfo si;
> +	u64 gtt_size;
>  
> -	mgr->gt = gt;
> +	si_meminfo(&si);
> +	gtt_size = (u64)si.totalram * si.mem_unit * 3/4;
>  	man->use_tt = true;
> -	man->func = &xe_ttm_gtt_mgr_func;
> -
> +	man->func = &xe_ttm_sys_mgr_func;
>  	ttm_resource_manager_init(man, &xe->ttm, gtt_size >> PAGE_SHIFT);
> -
> -	ttm_set_driver_manager(&xe->ttm, XE_PL_TT, &mgr->manager);
> +	ttm_set_driver_manager(&xe->ttm, XE_PL_TT, man);
>  	ttm_resource_manager_set_used(man, true);
> -
> -	err = drmm_add_action_or_reset(&xe->drm, ttm_gtt_mgr_fini, mgr);
> -	if (err)
> -		return err;
> -
> -	return 0;
> +	return drmm_add_action_or_reset(&xe->drm, ttm_sys_mgr_fini, xe);
>  }
> -- 
> 2.25.1
> 
