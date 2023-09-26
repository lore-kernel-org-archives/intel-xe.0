Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C40F2E7E654
	for <intel-xe@archiver.kernel.org>; Tue, 26 Sep 2023 18:43:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89CF810E151;
	Tue, 26 Sep 2023 18:43:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FD2F10E151
 for <intel-xe@lists.freedesktop.org>; Tue, 26 Sep 2023 18:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695753831; x=1727289831;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=VNh4mW8La8SZ1mwAZw3ag4D5e6L7VAV2+JEYodP0SuI=;
 b=MeBAKC7t5z5blzAKhsVlME9kJy30TOVKXNeI6lNH65Dscjb2EXJi3vgs
 WK/jWbVQSQdIT2vzdM3eQtThbllfTB6yPDTEPk0SBBezITsFhfYx1Tzu5
 nnsW0Vsx8gVrjK6G71dMhzlU7X3mlRme/6IJ8GCDpF+GiaEkHZ6VQMYCK
 7xuuRH83C47FSaEBgx+JboQiefHiOcQpU7WWntN/AnBEr1lKzFLGQpyyb
 tHLC5dwMxuQAYx6hO7ysQNSvvhi2gU6MLMT9SETidE9I2m34UEnbYHUNe
 DCNKbujRb7bjeuKebygKmBbgSQuVuA3vMfczAqUVHXYOrGFlV3iT+MwAJ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="445772596"
X-IronPort-AV: E=Sophos;i="6.03,178,1694761200"; d="scan'208";a="445772596"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2023 11:43:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="1079815528"
X-IronPort-AV: E=Sophos;i="6.03,178,1694761200"; d="scan'208";a="1079815528"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Sep 2023 11:43:49 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 26 Sep 2023 11:43:49 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 26 Sep 2023 11:43:49 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.106)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 26 Sep 2023 11:43:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WsZ7AmPnM4+gB3vNXvz00NzIiR6RZpJK27fqFWOHFE6bpjG/htznYDvQ/mY0QxbfBFhpmI6TgxiGQTRgG8BsrDhYcxA1/uH5zoHg7KgiuqZYPQpNcZfEXn5gD3UR6v2f7J7++pFbMbIF3gP3Z1A16VJgiRarsoK+1Vu1bS/CkSldPrs5QbZITt2sHPY/r1f/BhX1Ldp87q0OjMRyHcEMqsGGQq2Z1NrAR5V2jmf90n+NS6Efjdaq0nzKMVL2n/wXPSy5pw4WP0/wLsmCpgdBrkDEetIdzHMDxk745HO3VKjW/cePIn2UEGMKaRKIDncme27O2+1b8S6PjOINah0Wgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HaWWuuELGTC+oIsNIczVS0ND1mpJ5hqgHf0PL0NSewA=;
 b=KHVSJYP/JMa2Df6nK0bsmHU/DJpg2hEsxdaiDOcXTtoMRiO/RUP2kDeGJQsCS423i7Pew2TJjA3YxWbmSwEXGPTuZt5CXor3FqAS6oQPkAhIrFejfiEq6OhVJ9jAYtELLY9qQI/D2gPCUmOYSkzeE9c08OdQqkT8NyEtqmqLewksDUJopeFk4zrPTtAh4SXn56OK7wCmkr0zKeo0Vj2MVrBBE9Bt+QjZZj82I4pkiiKH0nN+oM8J+liJoLz/TtM6YuobMPKFOzesjfcEiJs9Uj2pgKkcprdA0KCZ+WmnyE5COfyWbzBnPB5m0hlAE867WCIyGMyAyrgwEe0hTVzzHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB2987.namprd11.prod.outlook.com (2603:10b6:5:65::14) by
 LV3PR11MB8742.namprd11.prod.outlook.com (2603:10b6:408:212::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.20; Tue, 26 Sep
 2023 18:43:47 +0000
Received: from DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::a51e:7713:dd10:97da]) by DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::a51e:7713:dd10:97da%3]) with mapi id 15.20.6813.027; Tue, 26 Sep 2023
 18:43:47 +0000
Date: Tue, 26 Sep 2023 11:43:36 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Message-ID: <ZRMmWLusAMpwiGIr@unerlige-ril>
References: <20230926125540.7-1-francois.dugast@intel.com>
 <20230926125540.7-4-francois.dugast@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230926125540.7-4-francois.dugast@intel.com>
X-ClientProxiedBy: BY5PR03CA0028.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::38) To DM6PR11MB2987.namprd11.prod.outlook.com
 (2603:10b6:5:65::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2987:EE_|LV3PR11MB8742:EE_
X-MS-Office365-Filtering-Correlation-Id: 01f879db-ed61-4982-d91a-08dbbec08446
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3GloEa0Wtcirv0Nhb+27JlGnWegQ+Wk96xjUmBG0WP4HPmft/p7FmpF1VOiBfVTqw259tHz3MlXDgfh2+YvJeUwU/79YIU45EwKdGLmqCf1Tft+vm3MHb1EdwFaN2Po1TYuLYM8la3HqSWxnKCQijoheTHhk+B0xqMwDANev5IYw8pVQsKV2AJ060VQM5m5/a35SbaqYysYp0UH/RzRD5eg4zWf/Y3QF0/cVh1dTlNkdXl1HhA9tyxLJ2w4ke/xi7gH9gSpyh5B/o4Q73kLkWD2sTRXGFYr8D6sbXL+xaZtEvF7Dvk2n4/ym5SV/KoP0a29dELKbcyXzhc/QRARJO4iC7Fr3dnE+TyJ2yrAKxp4pu3wdqNbnu8g93SGj62BeVuJl+nYnBcaNoz9Xwrm4qRwLEitNfjmEPTTo9W7iYjRB6dC4bBDyzM5CGObeEHFdIig1QFQJcFTMFfFVz58E2YQNm+N6vxDpnZ4fxGH7tIDGDOq2yT5cceTWdvNWkq10WxZdbIPWixywfXru3yURElGj4yZFxN1zwJd5reqYKAA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2987.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(366004)(376002)(396003)(346002)(136003)(39860400002)(230922051799003)(451199024)(186009)(1800799009)(86362001)(9686003)(33716001)(6486002)(6512007)(6506007)(107886003)(6666004)(478600001)(6636002)(966005)(83380400001)(82960400001)(38100700002)(66476007)(316002)(66556008)(30864003)(66946007)(26005)(5660300002)(6862004)(8676002)(2906002)(8936002)(41300700001)(4326008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MDVNRWdzMU1GQTBMYlJTMHpadEhHc0lFdVgzQ1o2VmVDRmNoQkdJNUdmYzFr?=
 =?utf-8?B?ditCMEg0QW5TWFZ0R0hsKzJHWUEvbWR3WXF0UzlqR25iZVhXeGdaSk9aalZJ?=
 =?utf-8?B?WlFMWVRSZFBDTVBEMnZQdzlpNzN0SXFRRW5qa2ZrcnJXaDBGalZ1SmZJdjlR?=
 =?utf-8?B?dUxVcW4xQXRXNlpMZXhaNFRaZGxid0hhS2ZQa3owSGpsSmRLN3AzaUxtWU5B?=
 =?utf-8?B?cEJWRVlUWGpmSDBHMDZxS3BzZkllQmtKM2VoaXd3WU5hU2QyeHFWV2NSbEVB?=
 =?utf-8?B?NktVNTRaSWErU05zK1p4YUthUUdvdWc0aUNSRjJxT25OU0lNVUdwZWlJbDEx?=
 =?utf-8?B?aVpESVdIbjh0V3JkVWR1ZFNnMmkxdjVUaFdjb3F4ZmRmS3pCWFBtRXR4Rmxy?=
 =?utf-8?B?S0NXbWhUVlJ5MEJXK1BUd2RsemFrRnYxNmZmbGJwMmxnZXpLbkJvQzFNcFBr?=
 =?utf-8?B?S3ozT2lFY29UTkgvSVltWEMrVDhqSmRmUFpaalpYMFhqd2FDMXZCbjdwSDU5?=
 =?utf-8?B?aG1zaTZoT0tNSmt0alprb3lQYS9CL1gwNGY2TXZTT01ScFZ0SFNESzg4eitJ?=
 =?utf-8?B?ZXVBM1ltZGJzSDhoVEk3eTFHRlArNHI5OEp5U3Qwb01rTURaemlxNkdwTnZ2?=
 =?utf-8?B?azhITzI1VGdwblNjaDVBYWpaL01LM0ZMOWFoZi81d2FKb0dOVmlyMjVHVjlQ?=
 =?utf-8?B?Rzk5bk5YWUZMc3F0TDlYRCtSc3ZoK3U4U2lGbkQrN1g1ZlMzMEUwc3AwK1Qw?=
 =?utf-8?B?Ny9hbnB6VWZ3b3p6MHpNdEJLZEFTTjFUQVJhbVFsYnhEZG8zRStERHp3NGpT?=
 =?utf-8?B?TVRSbjNKU0lHQ2JwQWoyMXUzL05pelBtMlhGSUtDT0x6ZTc4b2duaFh4Qzg0?=
 =?utf-8?B?R2I5dm1qa2kvOVFJVXhZT1FvaVRTM0grMExWNGV3UXd6enhBaEs5L2o4SjdH?=
 =?utf-8?B?Q3BrTGY0OTJLMVMxdXk1UlpXTWdaTngwUXd6VnJUU3c3YmZHYWNrRjdlckVY?=
 =?utf-8?B?d3VTQ0tqenJRazVEUmhiTE0xcHFtT3VyVDkzUWZsbWZtMXZEVEJTZXlzTmR6?=
 =?utf-8?B?N1JvQjZYSWdqREltZ05ZRktLYTJJbkF4bDVoUVEwUXY4cGU5ZEVtTE1DQW9D?=
 =?utf-8?B?V0JBcnhSN1NqclcyOGhuZlBOellkODRxMDNIRFM2MUgzRy9aRnNHQVJZZFpx?=
 =?utf-8?B?Z2xXMEdjMWRIb1JjV1pHaG9wbEVJTldHcFZObDRvMWJYOWl5UXpEclZBeUo4?=
 =?utf-8?B?OG1Qdk1PeXB6SjdVMFJtTTNyVzcyMExJdkV0L3NVY3ljbzlaQTVxQWR4bXF5?=
 =?utf-8?B?bm5LemkzckJMVnA3MDc3bGoreXNhanhJWkc3eHNtV0Z1S2oyWVVYRTlMc1A4?=
 =?utf-8?B?eGMzRHdMTndCQ2hCZkJZYUFiazZxeVNoNWxnUFVjajVYSVZFUy9sWXByVEYy?=
 =?utf-8?B?a1Zmd3MwcmM4RWQxcUZQVTAvekdLeFlSakhJNmlNRm5yNTFrOEN3OUI2WVpv?=
 =?utf-8?B?SzNHbmwrUCtmWjg2YVJMVHlITzlndFNwbi9zUlFTazlUcTQyOUJwSDIwTnVY?=
 =?utf-8?B?bnMzSkVtL3NOMjhHajZ4S2xsVUp0Mi9GWkJaeVZLeEpsM0JxTUhhMXhXSDh1?=
 =?utf-8?B?RW5tS21qb0NyODVDQ0NDcWE0K21LOEtPeEVvV2k4WXVGVmFJdnAvNDlyZjAy?=
 =?utf-8?B?ZGxzWFhPNHMwcCs3SVJyczNUaUo1SUEzckFwUTZSRVIzTlNwZ1BDd0NVUWZF?=
 =?utf-8?B?bkxpa1M4RnV1MmwvRXBEM3VHbDJET2NHcktyYTg3azBJczNaSnF5dnM4Y2lE?=
 =?utf-8?B?cmYrbkVNS2pwNG9oUEJNaDNhMThrYlJQTXJMeVBWb2xOcGJlYTJ5ZUpEUTA4?=
 =?utf-8?B?WkVZMUNYVUdtTjlmMUxXUVpzTS8rT0U3b01ZWm1pM3lrTG1ocXQyS0JFMjJF?=
 =?utf-8?B?a0JPS3J6NzFGRkVBZktLdmlWcDZaOXY4UjNuZDYycFZOVFNENWlVMTdEa0Vl?=
 =?utf-8?B?Z3VWTUVCQXhyY2F0WXpHdi84ZkdXM1htaXlZdUUzZklUVUtUWjBLREZTd1dX?=
 =?utf-8?B?bW8zaGdUUlZkZ05OMmp5WXAyU1BCN0hGMC9zUUFIQm0yeVprRWRWM2hheE1x?=
 =?utf-8?B?Y0lsL3U3bkhzMTBaL2pGcytzeHNwaEVFMWVOZW54NllSZUlQSGRpVTNEMnQx?=
 =?utf-8?Q?zAdRuqJR/DxWYA0XFrtNDZg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 01f879db-ed61-4982-d91a-08dbbec08446
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2987.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2023 18:43:46.7659 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Uhrimy+yHwOR3U/CkuHnLd8mPGFLpYalvjaQ86iGjPISFZClltELr1XPXpSBOM4bV8eCA6jnqFJMkOqHBS4HDTvzuombEqvmoJQZLsaP3mM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8742
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 03/30] drm/xe: Correlate engine and cpu
 timestamps with better accuracy
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
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Sep 26, 2023 at 12:55:13PM +0000, Francois Dugast wrote:
>From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>
>Perf measurements rely on CPU and engine timestamps to correlate
>events of interest across these time domains. Current mechanisms get
>these timestamps separately and the calculated delta between these
>timestamps lack enough accuracy.
>
>To improve the accuracy of these time measurements to within a few us,
>add a query that returns the engine and cpu timestamps captured as
>close to each other as possible.
>
>Prior work: https://patchwork.freedesktop.org/series/87552/
>
>Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>Signed-off-by: Francois Dugast <francois.dugast@intel.com>
>Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>---
> drivers/gpu/drm/xe/xe_query.c | 141 ++++++++++++++++++++++++++++++++++
> include/uapi/drm/xe_drm.h     |  95 ++++++++++++++++++-----
> 2 files changed, 218 insertions(+), 18 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
>index cbccd5c3dbc8..be9affd4f181 100644
>--- a/drivers/gpu/drm/xe/xe_query.c
>+++ b/drivers/gpu/drm/xe/xe_query.c
>@@ -6,10 +6,12 @@
> #include "xe_query.h"
>
> #include <linux/nospec.h>
>+#include <linux/sched/clock.h>
>
> #include <drm/ttm/ttm_placement.h>
> #include <drm/xe_drm.h>
>
>+#include "regs/xe_engine_regs.h"
> #include "xe_bo.h"
> #include "xe_device.h"
> #include "xe_exec_queue.h"
>@@ -17,6 +19,7 @@
> #include "xe_gt.h"
> #include "xe_guc_hwconfig.h"
> #include "xe_macros.h"
>+#include "xe_mmio.h"
> #include "xe_ttm_vram_mgr.h"
>
> static const u16 xe_to_user_engine_class[] = {
>@@ -27,6 +30,14 @@ static const u16 xe_to_user_engine_class[] = {
> 	[XE_ENGINE_CLASS_COMPUTE] = DRM_XE_ENGINE_CLASS_COMPUTE,
> };
>
>+static const enum xe_engine_class user_to_xe_engine_class[] = {
>+	[DRM_XE_ENGINE_CLASS_RENDER] = XE_ENGINE_CLASS_RENDER,
>+	[DRM_XE_ENGINE_CLASS_COPY] = XE_ENGINE_CLASS_COPY,
>+	[DRM_XE_ENGINE_CLASS_VIDEO_DECODE] = XE_ENGINE_CLASS_VIDEO_DECODE,
>+	[DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE] = XE_ENGINE_CLASS_VIDEO_ENHANCE,
>+	[DRM_XE_ENGINE_CLASS_COMPUTE] = XE_ENGINE_CLASS_COMPUTE,
>+};
>+
> static size_t calc_hw_engine_info_size(struct xe_device *xe)
> {
> 	struct xe_hw_engine *hwe;
>@@ -45,6 +56,135 @@ static size_t calc_hw_engine_info_size(struct xe_device *xe)
> 	return i * sizeof(struct drm_xe_engine_class_instance);
> }
>
>+typedef u64 (*__ktime_func_t)(void);
>+static __ktime_func_t __clock_id_to_func(clockid_t clk_id)
>+{
>+	/*
>+	 * Use logic same as the perf subsystem to allow user to select the
>+	 * reference clock id to be used for timestamps.
>+	 */
>+	switch (clk_id) {
>+	case CLOCK_MONOTONIC:
>+		return &ktime_get_ns;
>+	case CLOCK_MONOTONIC_RAW:
>+		return &ktime_get_raw_ns;
>+	case CLOCK_REALTIME:
>+		return &ktime_get_real_ns;
>+	case CLOCK_BOOTTIME:
>+		return &ktime_get_boottime_ns;
>+	case CLOCK_TAI:
>+		return &ktime_get_clocktai_ns;
>+	default:
>+		return NULL;
>+	}
>+}
>+
>+static void
>+__read_timestamps(struct xe_gt *gt,
>+		  struct xe_reg lower_reg,
>+		  struct xe_reg upper_reg,
>+		  u64 *cs_ts,
>+		  u64 *cpu_ts,
>+		  u64 *cpu_delta,
>+		  __ktime_func_t cpu_clock)
>+{
>+	u32 upper, lower, old_upper, loop = 0;
>+
>+	upper = xe_mmio_read32(gt, upper_reg);
>+	do {
>+		*cpu_delta = local_clock();
>+		*cpu_ts = cpu_clock();
>+		lower = xe_mmio_read32(gt, lower_reg);
>+		*cpu_delta = local_clock() - *cpu_delta;
>+		old_upper = upper;
>+		upper = xe_mmio_read32(gt, upper_reg);
>+	} while (upper != old_upper && loop++ < 2);
>+
>+	*cs_ts = (u64)upper << 32 | lower;
>+}
>+
>+static int
>+query_cs_cycles(struct xe_device *xe,
>+		struct drm_xe_device_query *query)
>+{
>+	struct drm_xe_query_cs_cycles __user *query_ptr;
>+	struct drm_xe_engine_class_instance *eci;
>+	struct drm_xe_query_cs_cycles resp;
>+	size_t size = sizeof(resp);
>+	__ktime_func_t cpu_clock;
>+	struct xe_hw_engine *hwe;
>+	struct xe_gt *gt;
>+
>+	if (query->size == 0) {
>+		query->size = size;
>+		return 0;
>+	} else if (XE_IOCTL_DBG(xe, query->size != size)) {
>+		return -EINVAL;
>+	}
>+
>+	query_ptr = u64_to_user_ptr(query->data);
>+	if (copy_from_user(&resp, query_ptr, size))
>+		return -EFAULT;
>+
>+	if (resp.rsvd)
>+		return -EINVAL;
>+
>+	cpu_clock = __clock_id_to_func(resp.clockid);
>+	if (!cpu_clock)
>+		return -EINVAL;
>+
>+	eci = &resp.eci;
>+	if (eci->gt_id > XE_MAX_GT_PER_TILE)
>+		return -EINVAL;
>+
>+	gt = xe_device_get_gt(xe, eci->gt_id);
>+	if (!gt)
>+		return -EINVAL;
>+
>+	if (eci->engine_class >= ARRAY_SIZE(user_to_xe_engine_class))
>+		return -EINVAL;
>+
>+	hwe = xe_gt_hw_engine(gt, user_to_xe_engine_class[eci->engine_class],
>+			      eci->engine_instance, true);
>+	if (!hwe)
>+		return -EINVAL;
>+
>+	resp.cs_frequency = gt->info.clock_freq;
>+
>+	xe_device_mem_access_get(xe);
>+	xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>+
>+	__read_timestamps(gt,
>+			  RING_TIMESTAMP(hwe->mmio_base),
>+			  RING_TIMESTAMP_UDW(hwe->mmio_base),
>+			  &resp.cs_cycles,
>+			  &resp.cpu_timestamp,
>+			  &resp.cpu_delta,
>+			  cpu_clock);
>+
>+	xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>+	xe_device_mem_access_put(xe);
>+	resp.width = 36;
>+
>+	/* Only write to the output fields of user query */
>+	if (put_user(resp.cs_frequency, &query_ptr->cs_frequency))
>+		return -EFAULT;
>+
>+	if (put_user(resp.cpu_timestamp, &query_ptr->cpu_timestamp))
>+		return -EFAULT;
>+
>+	if (put_user(resp.cpu_delta, &query_ptr->cpu_delta))
>+		return -EFAULT;
>+
>+	if (put_user(resp.cs_cycles, &query_ptr->cs_cycles))
>+		return -EFAULT;
>+
>+	if (put_user(resp.width, &query_ptr->width))
>+		return -EFAULT;
>+
>+	return 0;
>+}
>+
> static int query_engines(struct xe_device *xe,
> 			 struct drm_xe_device_query *query)
> {
>@@ -369,6 +509,7 @@ static int (* const xe_query_funcs[])(struct xe_device *xe,
> 	query_gts,
> 	query_hwconfig,
> 	query_gt_topology,
>+	query_cs_cycles,
> };
>
> int xe_query_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>index d48d8e3c898c..fde1378a60b9 100644
>--- a/include/uapi/drm/xe_drm.h
>+++ b/include/uapi/drm/xe_drm.h
>@@ -128,6 +128,24 @@ struct xe_user_extension {
> #define DRM_IOCTL_XE_WAIT_USER_FENCE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT_USER_FENCE, struct drm_xe_wait_user_fence)
> #define DRM_IOCTL_XE_VM_MADVISE			 DRM_IOW(DRM_COMMAND_BASE + DRM_XE_VM_MADVISE, struct drm_xe_vm_madvise)
>
>+/** struct drm_xe_engine_class_instance - instance of an engine class */
>+struct drm_xe_engine_class_instance {
>+#define DRM_XE_ENGINE_CLASS_RENDER		0
>+#define DRM_XE_ENGINE_CLASS_COPY		1
>+#define DRM_XE_ENGINE_CLASS_VIDEO_DECODE	2
>+#define DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE	3
>+#define DRM_XE_ENGINE_CLASS_COMPUTE		4
>+	/*
>+	 * Kernel only class (not actual hardware engine class). Used for
>+	 * creating ordered queues of VM bind operations.
>+	 */
>+#define DRM_XE_ENGINE_CLASS_VM_BIND		5
>+	__u16 engine_class;
>+
>+	__u16 engine_instance;
>+	__u16 gt_id;
>+};
>+
> /**
>  * enum drm_xe_memory_class - Supported memory classes.
>  */
>@@ -219,6 +237,64 @@ struct drm_xe_query_mem_region {
> 	__u64 reserved[6];
> };
>
>+/**
>+ * struct drm_xe_query_cs_cycles - correlate CPU and GPU timestamps
>+ *
>+ * If a query is made with a struct drm_xe_device_query where .query
>+ * is equal to DRM_XE_QUERY_CS_CYCLES, then the reply uses
>+ * struct drm_xe_query_cs_cycles in .data.
>+ *
>+ * struct drm_xe_query_cs_cycles is allocated by the user and .data points to
>+ * this allocated structure. The user must pass .eci and .clockid as inputs to
>+ * this query. eci determines the engine and tile info required to fetch the
>+ * relevant GPU timestamp. clockid is used to return the specific CPU
>+ * timestamp.
>+ *
>+ * The query returns the command streamer cycles and the frequency that can
>+ * be used to calculate the command streamer timestamp. In addition the
>+ * query returns a set of cpu timestamps that indicate when the command
>+ * streamer cycle count was captured.
>+ */
>+struct drm_xe_query_cs_cycles {
>+	/** Engine for which command streamer cycles is queried. */
>+	struct drm_xe_engine_class_instance eci;
>+
>+	/** MBZ (pad eci to 64 bit) */
>+	__u16 rsvd;
>+
>+	/**
>+	 * Command streamer cycles as read from the command streamer
>+	 * register at 0x358 offset.
>+	 */
>+	__u64 cs_cycles;
>+
>+	/** Frequency of the cs cycles in Hz. */
>+	__u64 cs_frequency;
>+
>+	/**
>+	 * CPU timestamp in ns. The timestamp is captured before reading the
>+	 * cs_cycles register using the reference clockid set by the user.
>+	 */
>+	__u64 cpu_timestamp;
>+
>+	/**
>+	 * Time delta in ns captured around reading the lower dword of the
>+	 * cs_cycles register.
>+	 */
>+	__u64 cpu_delta;
>+
>+	/**
>+	 * Reference clock id for CPU timestamp. For definition, see
>+	 * clock_gettime(2) and perf_event_open(2). Supported clock ids are
>+	 * CLOCK_MONOTONIC, CLOCK_MONOTONIC_RAW, CLOCK_REALTIME, CLOCK_BOOTTIME,
>+	 * CLOCK_TAI.
>+	 */
>+	__s32 clockid;
>+
>+	/** Width of the cs cycle counter in bits. */
>+	__u32 width;
>+};
>+
> /**
>  * struct drm_xe_query_mem_usage - describe memory regions and usage
>  *
>@@ -391,6 +467,7 @@ struct drm_xe_device_query {
> #define DRM_XE_DEVICE_QUERY_GTS		3
> #define DRM_XE_DEVICE_QUERY_HWCONFIG	4
> #define DRM_XE_DEVICE_QUERY_GT_TOPOLOGY	5
>+#define DRM_XE_QUERY_CS_CYCLES		6
> 	/** @query: The type of data to query */
> 	__u32 query;
>
>@@ -732,24 +809,6 @@ struct drm_xe_exec_queue_set_property {
> 	__u64 reserved[2];
> };
>
>-/** struct drm_xe_engine_class_instance - instance of an engine class */
>-struct drm_xe_engine_class_instance {
>-#define DRM_XE_ENGINE_CLASS_RENDER		0
>-#define DRM_XE_ENGINE_CLASS_COPY		1
>-#define DRM_XE_ENGINE_CLASS_VIDEO_DECODE	2
>-#define DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE	3
>-#define DRM_XE_ENGINE_CLASS_COMPUTE		4
>-	/*
>-	 * Kernel only class (not actual hardware engine class). Used for
>-	 * creating ordered queues of VM bind operations.
>-	 */
>-#define DRM_XE_ENGINE_CLASS_VM_BIND		5
>-	__u16 engine_class;
>-
>-	__u16 engine_instance;
>-	__u16 gt_id;

Patch 26/30 where a pad is added here (drm/xe/uapi: Add pad to 
drm_xe_engine_class_instance) should appear before this patch in the 
series.

Thanks,
Umesh

>-};
>-
> struct drm_xe_exec_queue_create {
> #define XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY               0
> 	/** @extensions: Pointer to the first extension struct, if any */
>-- 
>2.34.1
>
