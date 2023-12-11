Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BC8FC4332F
	for <intel-xe@archiver.kernel.org>; Mon, 11 Dec 2023 19:13:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 696A810E4E9;
	Mon, 11 Dec 2023 19:13:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CC3F10E4F8
 for <intel-xe@lists.freedesktop.org>; Mon, 11 Dec 2023 19:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702322026; x=1733858026;
 h=from:to:subject:date:message-id:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=h7+6wGrj52rwHr2SqZbnmxWBYs7RaHZTJoDK016FwzY=;
 b=KoHok7XnArfbfSNgextRvhPTzPzsuKOAO7KlZEEq1Ycorq+anOhEeKOZ
 V8TsdtiG5+hIlNMCgg4EJuITB7o3BXBtCrupGLDstuwPIP3c9/DrTYwMs
 cjxiUARILaKURkEo+FQQ6g8zoMeGMXrIN4Ypkn6Dx8oldJLGp+ZRHtmVU
 Ruuu4Q6mFc2vUWDneS3i3Q1ypChAQjs8kMQYSUCXu0lgBnFrLcHbR+FJe
 Dhl6KccjA21r3RuQFWLBgkzbBTDIsn11+gKFCfS67TPp+ZRVa8oLP2Qv6
 sb9rCTT5zp9a3giUOpyzkWP+JZwMzmcnVSBczo3ymdOqancLoMy+8f+gb g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="391866943"
X-IronPort-AV: E=Sophos;i="6.04,268,1695711600"; d="scan'208";a="391866943"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2023 11:13:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="1104585776"
X-IronPort-AV: E=Sophos;i="6.04,268,1695711600"; d="scan'208";a="1104585776"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Dec 2023 11:13:45 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 11 Dec 2023 11:13:45 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 11 Dec 2023 11:13:45 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 11 Dec 2023 11:13:45 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 11 Dec 2023 11:13:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VJqg7bNEtJv6aTKdp/75hXSxdmjB8mAci6gyakSIGvVVTivtvQNvMbMhp4dTlZcYH9t1/+Ttuw/uaMTw6Qzo9ymIaGn9rOrfGbQ6LR6AfBtyeXmi9JB07V+dI5x+g51EjJjCEqzoU5JmnUQ3g6NeUlpuEGjYT71tEG7Nlxd5GaXVPngX/TWYfq6SV55E3reSEUWGfGnjqbCU4njzMYucLkS6tLK7y5gGcpDEYDp1seyx0fLKy/VVr6ELWBDXyrPlijxAlsykwJSpR38+YlOGmRa0nyKxlyFF02sKEsb/Epj6jgJr2bhDkdWq4Oq9Rx3ut9dDfQ/uyB3eBnMjYd+5Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RTNxxB1slgguJ49GMNHJBtUUVQuTod41hHBb00nMT8w=;
 b=X8nIOBqqSCGa8brF0ERlGUffjLT4TiPS56lQLEIMiKhu29YHLlEOyHpaOVxhMUOWbFWuz7v4fW+pCxGq0XwWaoxhUIDc5EeFtFIT4QkqMm2PYHhW9lRuZESgemde4sLt1hvC5rN/dm5Gj3YVXJ+Pssk7EDj94Aoz6g2df229rFhLRwaTtwntoiq4s0W5FgeiqyQoA2VnfaMwbupTimRIAS0Yyx26EATxvoI8XcgHQtRyuohyFKlpbl1Tb/1il4LGlrZ6ZwZQWyWU137GubH1YTp/ur4Lvkyoi8f466Wpnwtc7cHTSXI1jK49JWatoYR9Ta6Ex55ItjnzspHOwO/R0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CH3PR11MB7764.namprd11.prod.outlook.com (2603:10b6:610:145::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.33; Mon, 11 Dec
 2023 19:13:42 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7068.031; Mon, 11 Dec 2023
 19:13:42 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>, <matthew.brost@intel.com>
Subject: [PATCH 10/13] drm/sched: Rename priority MIN to LOW
Date: Mon, 11 Dec 2023 14:13:03 -0500
Message-ID: <20231211191306.1069362-10-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231211191306.1069362-1-rodrigo.vivi@intel.com>
References: <20231211191306.1069362-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0243.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::8) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CH3PR11MB7764:EE_
X-MS-Office365-Filtering-Correlation-Id: e4d2d237-992e-44ea-d6f9-08dbfa7d49ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +iPhOxDfVJDSezaB3WLgl0ZvgDHewGCafYPyICt6MUJM+jZO604Y9NSjBLBG0tTIpm8pYd1UwKW17GlWTSCVnnoOScX69mR7ZsgNzC+JmFUgCJPrC42bDnQqtaRPCQ67FrDYJCjY+eWTRe8M2uMoWehZVhBX5qJgCDWSX+sUseLqYYddh8AbSHAHNQBGIlW11qKpLdBUm0BMyoO/rGdS9UWVXGjPYiKdYw7rTWcObDj8LXrmNXw+nhafdMtp2UqAXFTYt542TE7AWahp7bF/MvLdMIjiq+Fk7h2Q9j0n9+dnwsnlIZ+l+z3aCgdSxB6Dj/L0wddwAot271ivC2LHS5lOLwzkQnzVDv8wXjVEAyeBnFjS9W3Xm0IjVpsdT6lQrXgpjJoBg2Rd9xkdepUSP0waXEj2s2epA9PeVJdUYY7Fp9CJG7zNmos16SbkVlIgB/ISTcQbb94TvwUzxRZDt266SBePvx6ZIjOv9YdD7aEiU3T/0wpEttiZ287tAP9rjmiGGI3lODAuWV0vtftxMyATP1YpQdEaI3QSbiisPIg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(136003)(396003)(346002)(39860400002)(366004)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(83380400001)(2906002)(41300700001)(478600001)(82960400001)(66574015)(6486002)(66556008)(66476007)(6636002)(66946007)(966005)(316002)(38100700002)(6666004)(86362001)(8676002)(8936002)(6506007)(6512007)(44832011)(36756003)(1076003)(5660300002)(26005)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bGFESGJCVXpnZklPWExqM1IrM0JxS3NvcDQyTWNjTmc3ZEt5SjNiZWRqMVNp?=
 =?utf-8?B?S0s2TXczWk9haTVSWmRHTmRWUG14SS9zUkU4RElTSG5ITzVXai9KNW5HTm5F?=
 =?utf-8?B?UllIeXlkSmkrdDI0bE5qYm44OFBhZEkydVpoZEN1Z21uT1k3ZEx1QjBIOXVU?=
 =?utf-8?B?a3pZM09YVnY1Y2hDUEJyYkFrRWdsTTZTNXQzZzNZYlhqSjB3M0llWWIyVVNy?=
 =?utf-8?B?dEtJcjc1V04xYk5kREwxOWZJbFNNL251YzlLMjdMK25wR1RpQ1N1Y3JrT2c4?=
 =?utf-8?B?cHBOYllrMzh4VWs0K1BHY2FWVCtDMzlWSEplTkZvV2llZzBnbUVLZjFpRGR0?=
 =?utf-8?B?K3Nod1FXemR5d09ReFNhSC9uVk5qMDVrTW1wbEs2eDEyWmFiVG9mNFN3ZlVk?=
 =?utf-8?B?ektOWjlsQzN2a3Y0M2VZSHJzR3RMOUhlZFpvR2xlTmVPcTR0bVVxZlY1aWdE?=
 =?utf-8?B?WmdIZGJWallvd2NBR2lYdlBRbmp4S2VJd2MrRTR1K29KUlhRZTNJZllvNmlq?=
 =?utf-8?B?cVp5Z21SV2FPd3g4V3o1cXJMY2FrODVXZG1uRE9UMzdIYUg0SUhraHJVeDB6?=
 =?utf-8?B?TXV5bURsZFNFRDZQNVA4YjgxOTcvQ1duRmZvV1VrRFozV0xVaHV2NHFaRU5t?=
 =?utf-8?B?SVFVKzhkaERBZFFOVEU5MFgzQi9hdU5EMUNGVEdweXVjK0NLQjlHNnlRSVls?=
 =?utf-8?B?ZGo2NmpMOGdoTldqaWpnUkxESHJWUGNFbHV2amJ4enltWUIrU0lUSEhZQnFR?=
 =?utf-8?B?RUl3OTN4YXM4THRVOWcreTRrL21TUkxMUnQ0ZVpvRGRjdXVTN1c1TnJid0Fu?=
 =?utf-8?B?bTk0diszZFVIc3YvOEdnRVpoNkJlWTlMZzRQdndvSTlWMjRyU1RKMFhZZVVW?=
 =?utf-8?B?TytPNWcxOCtjK2o4ZnQyWDY5RVIwTlVuUXdzNGNORTMyNG1jUWxTelpSMEox?=
 =?utf-8?B?b0ZCK2d2eUlDWGduMStabnBZYkdSV0FUc0c0b1RiOVByeURkU0FnaWJuNytX?=
 =?utf-8?B?L3FBMkJ6N2pmMVpWd3dHdVRLOExJZEs4cGpFbDR0ZTdibktPazlldStNY3lx?=
 =?utf-8?B?c0lDYVVGUWF2WG9COVl2R1dpYVFaUjdhS1FLQldyaWFlcTJka1M3T2dwekM4?=
 =?utf-8?B?NDA3dnJZVHc0YXJZeVllUko0ZGZJam03K1RtOWFZT2pSaE9BajI3dlZoR3BY?=
 =?utf-8?B?cFYrOHdwb0g1ampNKzdjQXR1cmw1b3N2TkkzMlhHU1BLREJOc3Vvai9TRzR1?=
 =?utf-8?B?SGEzTG1IZStrSTZjcUtWOG1WcHBMcjNPN0FhNXI4d3o4NGFTTkdyVll3Q0hm?=
 =?utf-8?B?WXpwdE5abkt4M1Jnend1NDNYcXNJbWovRXIrUkM2akZlY2o3V0JqT1ZZUVMy?=
 =?utf-8?B?Q05oT0IvS1JYZkNrRU12Q1JabThTVk5HeSttMUFGRjBkT1BqZldEUEZkVURa?=
 =?utf-8?B?SFdsQWIwM2hmMVJSa0E0b01xYmNCUVJUY29hRzRzbCs1RW9saW1aK0IySzla?=
 =?utf-8?B?U3NROHNsMTV4cHRLUEJDMUkzVEtaMmxMQWQ5ejl4SG9jeHJNNmRXaUhhTUs1?=
 =?utf-8?B?M0xaNCs2b29hWWF2ZVMybEMxUlp6bkhRUkQ1azdsbzhSampONzVUOTNnaG0x?=
 =?utf-8?B?QXgrZmxBMFNGbWZ4OXFtK002TzBzbSt0MUFCb0kzMS8rWEdMT3lWWUFwNU5p?=
 =?utf-8?B?ZlBvSmxlVGVtdmx5MmNSWFl4ck5Yc1RXQWxCcHE5QmUyQ2cyb1NiMVlWYkdV?=
 =?utf-8?B?TlZGQzlSaHZBNnVHZGdCUTNLZzdMTnI4dzM4R1UwS2tla3ZReGt1R0tjQmov?=
 =?utf-8?B?WkpsRzlQcWJuc1libGVkT1piL21LcVdwSGJyTTNLc1BDbEY0SjRuYzgwZTlE?=
 =?utf-8?B?eUROZVhLaEF6RUdvRzRVYlJKYlo0WkxrSmVYeTJndnBZdkhSS0Exb3pyQmE5?=
 =?utf-8?B?OFQ5MWV1N3pvOUc4NE8zYWxncFRiQ1FHQ0l4R1FNRDhyMmE5NjBQR0k1allz?=
 =?utf-8?B?MVlXTE91Zzg5SWN3REVKdFhCcWhsL09DaVJWQ1k0dHpDcnJMeDY2STZIR01P?=
 =?utf-8?B?dWM3SUt3cW01Qmw3ZWVQNlJBak4wSGlqM3doMjlHaGNEdThtbjV2cHUxMUx6?=
 =?utf-8?B?MWU1UGFrdHF1bFJUMFJiSHBQVTMzaHpFcnIycFl2clcyN3pWZVM2UUhMWUpj?=
 =?utf-8?B?UVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e4d2d237-992e-44ea-d6f9-08dbfa7d49ff
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2023 19:13:42.5728 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +EhSHwT+NorLcl6L/cR420l679ogjWyT7pd1TuzMC1sjTX7IUXqrwqaQmI+UR2TkRg8sOqOGHBQHR77l/2TfxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7764
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

From: Luben Tuikov <ltuikov89@gmail.com>

Rename DRM_SCHED_PRIORITY_MIN to DRM_SCHED_PRIORITY_LOW.

This mirrors DRM_SCHED_PRIORITY_HIGH, for a list of DRM scheduler priorities
in ascending order,
  DRM_SCHED_PRIORITY_LOW,
  DRM_SCHED_PRIORITY_NORMAL,
  DRM_SCHED_PRIORITY_HIGH,
  DRM_SCHED_PRIORITY_KERNEL.

(cherry picked from commit fe375c74806dbd30b00ec038a80a5b7bf4653ab7)

Cc: Rob Clark <robdclark@gmail.com>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Danilo Krummrich <dakr@redhat.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: freedreno@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Luben Tuikov <ltuikov89@gmail.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20231124052752.6915-5-ltuikov89@gmail.com
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c  |  4 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c  |  2 +-
 drivers/gpu/drm/msm/msm_gpu.h            |  2 +-
 drivers/gpu/drm/scheduler/sched_entity.c |  2 +-
 drivers/gpu/drm/scheduler/sched_main.c   | 10 +++++-----
 include/drm/gpu_scheduler.h              |  2 +-
 6 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
index fb050345b9f2..d46786618061 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
@@ -68,10 +68,10 @@ amdgpu_ctx_to_drm_sched_prio(int32_t ctx_prio)
 		return DRM_SCHED_PRIORITY_NORMAL;
 
 	case AMDGPU_CTX_PRIORITY_VERY_LOW:
-		return DRM_SCHED_PRIORITY_MIN;
+		return DRM_SCHED_PRIORITY_LOW;
 
 	case AMDGPU_CTX_PRIORITY_LOW:
-		return DRM_SCHED_PRIORITY_MIN;
+		return DRM_SCHED_PRIORITY_LOW;
 
 	case AMDGPU_CTX_PRIORITY_NORMAL:
 		return DRM_SCHED_PRIORITY_NORMAL;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
index 62bb7fc7448a..1a25931607c5 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
@@ -325,7 +325,7 @@ void amdgpu_job_stop_all_jobs_on_sched(struct drm_gpu_scheduler *sched)
 	int i;
 
 	/* Signal all jobs not yet scheduled */
-	for (i = sched->num_rqs - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
+	for (i = sched->num_rqs - 1; i >= DRM_SCHED_PRIORITY_LOW; i--) {
 		struct drm_sched_rq *rq = sched->sched_rq[i];
 		spin_lock(&rq->lock);
 		list_for_each_entry(s_entity, &rq->entities, list) {
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index 4252e3839fbc..eb0c97433e5f 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -347,7 +347,7 @@ struct msm_gpu_perfcntr {
  * DRM_SCHED_PRIORITY_KERNEL priority level is treated specially in some
  * cases, so we don't use it (no need for kernel generated jobs).
  */
-#define NR_SCHED_PRIORITIES (1 + DRM_SCHED_PRIORITY_HIGH - DRM_SCHED_PRIORITY_MIN)
+#define NR_SCHED_PRIORITIES (1 + DRM_SCHED_PRIORITY_HIGH - DRM_SCHED_PRIORITY_LOW)
 
 /**
  * struct msm_file_private - per-drm_file context
diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index ee645d38e98d..dd2b8f777f51 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -88,7 +88,7 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
 			drm_err(sched_list[0], "entity with out-of-bounds priority:%u num_rqs:%u\n",
 				entity->priority, sched_list[0]->num_rqs);
 			entity->priority = max_t(s32, (s32) sched_list[0]->num_rqs - 1,
-						 (s32) DRM_SCHED_PRIORITY_MIN);
+						 (s32) DRM_SCHED_PRIORITY_LOW);
 		}
 		entity->rq = sched_list[0]->sched_rq[entity->priority];
 	}
diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 044a8c4875ba..b6d7bc49ff6e 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -1052,7 +1052,7 @@ drm_sched_select_entity(struct drm_gpu_scheduler *sched)
 	int i;
 
 	/* Kernel run queue has higher priority than normal run queue*/
-	for (i = sched->num_rqs - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
+	for (i = sched->num_rqs - 1; i >= DRM_SCHED_PRIORITY_LOW; i--) {
 		entity = drm_sched_policy == DRM_SCHED_POLICY_FIFO ?
 			drm_sched_rq_select_entity_fifo(sched, sched->sched_rq[i]) :
 			drm_sched_rq_select_entity_rr(sched, sched->sched_rq[i]);
@@ -1291,7 +1291,7 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
 	if (!sched->sched_rq)
 		goto Out_free;
 	sched->num_rqs = num_rqs;
-	for (i = DRM_SCHED_PRIORITY_MIN; i < sched->num_rqs; i++) {
+	for (i = DRM_SCHED_PRIORITY_LOW; i < sched->num_rqs; i++) {
 		sched->sched_rq[i] = kzalloc(sizeof(*sched->sched_rq[i]), GFP_KERNEL);
 		if (!sched->sched_rq[i])
 			goto Out_unroll;
@@ -1312,7 +1312,7 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
 	sched->ready = true;
 	return 0;
 Out_unroll:
-	for (--i ; i >= DRM_SCHED_PRIORITY_MIN; i--)
+	for (--i ; i >= DRM_SCHED_PRIORITY_LOW; i--)
 		kfree(sched->sched_rq[i]);
 Out_free:
 	kfree(sched->sched_rq);
@@ -1338,7 +1338,7 @@ void drm_sched_fini(struct drm_gpu_scheduler *sched)
 
 	drm_sched_wqueue_stop(sched);
 
-	for (i = sched->num_rqs - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
+	for (i = sched->num_rqs - 1; i >= DRM_SCHED_PRIORITY_LOW; i--) {
 		struct drm_sched_rq *rq = sched->sched_rq[i];
 
 		spin_lock(&rq->lock);
@@ -1390,7 +1390,7 @@ void drm_sched_increase_karma(struct drm_sched_job *bad)
 	if (bad->s_priority != DRM_SCHED_PRIORITY_KERNEL) {
 		atomic_inc(&bad->karma);
 
-		for (i = DRM_SCHED_PRIORITY_MIN;
+		for (i = DRM_SCHED_PRIORITY_LOW;
 		     i < min_t(typeof(sched->num_rqs), sched->num_rqs, DRM_SCHED_PRIORITY_KERNEL);
 		     i++) {
 			struct drm_sched_rq *rq = sched->sched_rq[i];
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index 9a50348bd5c0..d8e2d84d9223 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -63,7 +63,7 @@ struct drm_file;
  * to an array, and as such should start at 0.
  */
 enum drm_sched_priority {
-	DRM_SCHED_PRIORITY_MIN,
+	DRM_SCHED_PRIORITY_LOW,
 	DRM_SCHED_PRIORITY_NORMAL,
 	DRM_SCHED_PRIORITY_HIGH,
 	DRM_SCHED_PRIORITY_KERNEL,
-- 
2.43.0

