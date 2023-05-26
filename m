Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5AC2C77B7C
	for <intel-xe@archiver.kernel.org>; Fri, 26 May 2023 21:33:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F1AE10E0C3;
	Fri, 26 May 2023 21:33:37 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1FCD10E0C3
 for <intel-xe@lists.freedesktop.org>; Fri, 26 May 2023 21:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685136814; x=1716672814;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=2AGHOi83on6M4Jdk6yeC9xFlkT1dey1apvOqDyylNSc=;
 b=HLXqLIFvUhwCWZ/AzPsFnRqhWv+pmrFA5d0tdiU5dd+18dmt9J5bkTIR
 /fJKSPpv5sgda9QtVHhh5ardebd9t88IGuVusB0x6e+WgVRigJhyzKroW
 Qh/2v0G6FIsvlF8gEc0ZNaujWY2Lpk2XeI3AYzYOLsFhDqs7KL0e9W+mb
 IN9oYHoX8Gg7HJ2m5VHZQs0ag5e+rFjI0n/9/eeXXGOSexHYDnA4g1sJ/
 3WPE6fj83yU5TgHBD+Da7KVWGlzEWD6VkwcVCZYYAemYw22ide/AHXa20
 jzVbfxyINOczufJ3YhIe8JNbmpXhoA5G7TgVupQ8cI76SUHlvbpAq+iyT Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="357558517"
X-IronPort-AV: E=Sophos;i="6.00,195,1681196400"; d="scan'208";a="357558517"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2023 14:33:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="1035498023"
X-IronPort-AV: E=Sophos;i="6.00,195,1681196400"; d="scan'208";a="1035498023"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga005.fm.intel.com with ESMTP; 26 May 2023 14:33:33 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 26 May 2023 14:33:32 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 26 May 2023 14:33:32 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 26 May 2023 14:33:32 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 26 May 2023 14:33:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VaHvdGQYJrfHp1GMsXNiVX7vnor4HLwxhwQIZG6x9lMrNFafWC3VbWzRJESp9CaGZbOurI2gHrmqpS5SdGlXphfPA1JpkrjjvfQ4siZrlwiApvr+1BM4cnpzSPkBi9MEE0jsQUP/ZX6U1OYec7CBjSJc6oSAKE+mJmz1sWkQU0oWmWmYqvjvUBMUUk/B6OVttKm345BWl2Q6t1nuzFFMb7Cr+BxMq3TYrsvfszlzf6kNn2L6Ezgxs8h8mgQmTvxxCc+U30D+bl1mDzEDZ/Le0A9SlLTcxKSStlIsum2U0FHREJ+H6zeMQV+yiOlUj0QGkEdwVuLDu28KaOAb0jp/HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kaelQK5Wjic6L3Iujk6OvNuWxD9HMoH2dhj+uyC6p1o=;
 b=jmKtCI7qGi0WsdwiGzCQCpmgK0jFTrd+9cl29MRxj3NkEKlkcpOJkRKnRBewnFdRudvQ+O+XoE0yw728ONrPtV7AMurUfaguAuINjmX4apJ0K31RqQKAmtX9wSiLr3AOmrLPTvODxR6gaNkSOLVEoI5yF8aC+YG5/kvSYV9YvqhmtwlZRTEONCxcTHUNVuiHSRGLe8ulij2gS31ptWyuMek4mNGmH5oavqARqLdwgMTnKgIj4RB6z/6AjQ/Uw4l0H9eC44HgKSPS+XIdyIn9VpHm8kD8vX4/ZvxziiUqZvQ9I98mUbg5nMl/yimR5L9TtAJXsyOzAb18SL6XKS9eeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB5861.namprd11.prod.outlook.com (2603:10b6:510:133::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Fri, 26 May
 2023 21:33:29 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%3]) with mapi id 15.20.6433.017; Fri, 26 May 2023
 21:33:29 +0000
Date: Fri, 26 May 2023 14:33:26 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <cotwqveag6akgicniyydhnez3qys3pexr4c5z6r43b2dcab4bm@uc5sz6o2gcr3>
References: <20230519231827.3572452-1-matthew.d.roper@intel.com>
 <20230519231827.3572452-15-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230519231827.3572452-15-matthew.d.roper@intel.com>
X-ClientProxiedBy: SJ0PR13CA0159.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::14) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB5861:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d3f251c-bab4-4192-67ce-08db5e30d87b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6XMKqJdERl96+gXcGiXIC+h5fjrahhvGaG0s/vhKnTqIa2f2DULVV6UeZsxJcPNxp4Hs6b6s3bRglT2bzRrXKgschk6TmyfHUlFpgEfM/VeFliUSWRBl56yFvojK45BD0DTw88OmQltpqkDK8lq9fcz1NyzifLEmEEs4oIaXlu5J8rH1oJQgI8YFra6flQYcybp0yKmWGflVZA5o2dXJlsTNEqZrFmmzTJIZld71BWafbwylWK4aqVLzeV6dKrKSTvYuPiovFDA+R3ZobOZWKnBp//ygwuK01/UTiNQ4bWvmR8ZvsHQQuP0+NfXVSBF/OC2kkvvtrszR+o1depEzyclkQTdOgMdTfnOx3evGxHq2gzRGEuj7wl32tYfMEsIygEKXAx/WUm11IsCnBN0gJOnGwzIJsQ60+G2J9XcHlfK2x9w/Psv4ddltvlwvrY6gYBB2MvzI7GhDioLQ92mynVCw2FEy/hRCubXipZWc9H/qM9l4yL8TbL9ssOz82q8vXuyaOnbmY/qqSoyDn1QAhGECDygngU0po4kuh0f8NA6CCK2qiYoLiNZmm5Aqy2U5
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(366004)(346002)(136003)(376002)(396003)(39860400002)(451199021)(38100700002)(6506007)(26005)(6512007)(9686003)(82960400001)(83380400001)(2906002)(186003)(66556008)(316002)(4326008)(66476007)(6666004)(66946007)(6636002)(41300700001)(478600001)(6486002)(33716001)(8676002)(86362001)(8936002)(5660300002)(6862004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pp8xWZlExO8y9GYuiQcpfny/6G1J+KxI24RHzjJ7S9U8FMR92SVsAK/r9Sv5?=
 =?us-ascii?Q?EwdpLq7rHztMHLM3MTOxH7V1RukreQfV8aacPHRVam6b83u9rD3Jp8Gphr7x?=
 =?us-ascii?Q?0RRyP7nDu8l+OCYDFEmtizmbKF4y764lY2Av1ivkymnlzLHVRsLERnthKH1m?=
 =?us-ascii?Q?kk3xAyJFhBfS0hlHgrUNDo8V7K6iAhO2GTqaMDoWieRuMctsbCnrIP/Oq3Xm?=
 =?us-ascii?Q?08eD/w5FB0HSiyOlh5FKXsgRXydb9bt8LAxgvT5MWKIgE320ZNGe3oXVx3p3?=
 =?us-ascii?Q?zlilQyIH52ffZoazj76CPWBcMVGDPilxCKft9HS2NGTyQ0Tsf/hsrtAqq1oF?=
 =?us-ascii?Q?Qvwbi8et3BU+/OYnVYHDQmc/GkPKHU77r5OLZ/SoCdeL6vfMh4vAB8XdiVnN?=
 =?us-ascii?Q?F16UT6bq9C0hKXZunr5h7kAI9AMiOEoxhdioo8fKzLgJ6BQyRWU49790jyvJ?=
 =?us-ascii?Q?O/Rg69FKl36VTeOvKeoo242ORe0EDEupLzwIouRwzskZDs3sHdGvziTDii6a?=
 =?us-ascii?Q?IPc178bXa8XSryi8S0QDdSrMUWMQC2WPXdMRSFd/6mmXAR3HxdnGHR9Gy+6G?=
 =?us-ascii?Q?JIsFeFfgEhcuhlilx7JLI6399eOEcZBzGgISo2ZVzMYLV5KIP8mHrUi6AfsW?=
 =?us-ascii?Q?QR8ouVRffwuI1N2GK1vElb8Cl4UrIkXMNeUJfcvxrjYRqXWdGkIpkFp5ZHa0?=
 =?us-ascii?Q?jB/5dnHggptIpiti8q/e6ncWQpdPiMvi6Ga/Y1dKaynvpQT2GOl7Pa9XAT0W?=
 =?us-ascii?Q?lfR1iNA+RQFZUdFNalIQHFfFwKRK37ia+GbQaPOU4a5zJEiJ/uDJPl+smytN?=
 =?us-ascii?Q?XSc3Ui8OuMtmu72vmqg32h/yDEv/8I47yLQmL8eOmHhFCwISfQjUDw4caPjP?=
 =?us-ascii?Q?zWw/jZ2IpeHbtfJSJXPhSnYSqtCOyLB8uXLidpjPh/sHVQmY3GGbqpb49QdY?=
 =?us-ascii?Q?SqsAgMFE73nYi94NMOIusdLskgZcBUt1IY9wEMqUmt95RcTbGQP6dHzkmqoz?=
 =?us-ascii?Q?g8j/uiB1Q6TsLJ55E0+zyzYyyQ0M3EsW3jidtkyb6i1fkIc/qH0JiMdYXFDX?=
 =?us-ascii?Q?kKXrygnrbqfAFqLLMg0u6meshZlbFjPPLrMpCTqu3VUifm+90CW48X+z5lVx?=
 =?us-ascii?Q?DkF5AZ61of34SiK4GJaVR+RBI+/bS/N17uCJUSzOKWtI+ONn9MQg26UVnecj?=
 =?us-ascii?Q?n41uvZfSF31UUv43rq4KFcGqAW1+1DRBgE8g4Hq+jZiTpqw2fYGEoK/IKSNW?=
 =?us-ascii?Q?+s9xKra7vpVkdQJ3BUCwhDDHM2zC7GW6UCBrlPXKs7VQOsMhVoePtjruxMXM?=
 =?us-ascii?Q?AE5qFKkmfxLl6b/f07OsIP9ARVipwIRUppc+NWrMHONcEr01bVE8laia1xIV?=
 =?us-ascii?Q?tffMu6dQfE1tnaD/8qcC4yyCCVBQsBtDbWfFC27RP0WfALAxLNQxzqTMjlEX?=
 =?us-ascii?Q?0Gun5B+wACzXvAKx7RHH+iwF3bob1pT2r3DHN9akeqTJANVbwqzmSYfdZf3k?=
 =?us-ascii?Q?vHZt5+HJEhBCB+lW3OvHb6pQWhfM0OVZPzjlJnueKbenluaiJQhFkTAai/YC?=
 =?us-ascii?Q?OiIHU8NtbQv0bofCXTHmYea4kUFcc1ekO++VuQ3mRQV50bPmvplJK5YLpxS4?=
 =?us-ascii?Q?/Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d3f251c-bab4-4192-67ce-08db5e30d87b
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2023 21:33:28.8851 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RuUeISF7Kytq9OuW0lmKy0Dgun404kzyWniYb9kumVQesp/jjp4nc0SICEtNVVXKVE+mNV5+wC4HqMjpH8ujVCI1tTz/o6ujG4+Av5EH9AU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5861
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 14/30] drm/xe: Clarify 'gt' retrieval for
 primary tile
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, May 19, 2023 at 04:18:11PM -0700, Matt Roper wrote:
>There are a bunch of places in the driver where we need to perform
>non-GT MMIO against the platform's primary tile (display code, top-level
>interrupt enable/disable, driver initialization, etc.).  Rename
>'to_gt()' to 'xe_primary_mmio_gt()' to clarify that we're trying to get
>a primary MMIO handle for these top-level operations.
>
>In the future we need to move away from xe_gt as the target for MMIO
>operations (most of which are completely unrelated to GT).
>
>v2:
> - s/xe_primary_mmio_gt/xe_root_mmio_gt/ for more consistency with how
>   we refer to tile 0.  (Lucas)
>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>---
> drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h |  2 +-
> drivers/gpu/drm/xe/xe_device.c                        |  2 +-
> drivers/gpu/drm/xe/xe_device.h                        | 11 +++++++++--
> drivers/gpu/drm/xe/xe_irq.c                           |  6 +++---
> drivers/gpu/drm/xe/xe_mmio.c                          |  8 ++++----
> drivers/gpu/drm/xe/xe_query.c                         |  2 +-
> drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c                |  4 ++--
> 7 files changed, 21 insertions(+), 14 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h b/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h
>index 14f195fe275d..fae6213d26f1 100644
>--- a/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h
>+++ b/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h

the history of this file is odd. Apparently it was a cherry-pick with
the compat-i915-headers squashed (cherry picked from commit da38ba98645d789ddda2a584d40e2de00139e98b)

the cherry-pick really match that though. I think we will need to split
this change out from the rest, but since the current state is already
wrong we can leave it as is and later just take the final diff of
drivers/gpu/drm/xe/compat-i915-headers to squash somewhere when we
rebase again.

>@@ -14,7 +14,7 @@ static inline struct xe_gt *__fake_uncore_to_gt(struct fake_uncore *uncore)
> {
> 	struct xe_device *xe = container_of(uncore, struct xe_device, uncore);
>
>-	return to_gt(xe);
>+	return xe_root_mmio_gt(xe);
> }
>
> static inline u32 intel_uncore_read(struct fake_uncore *uncore,
>diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>index af165ad6f197..43a585b67581 100644
>--- a/drivers/gpu/drm/xe/xe_device.c
>+++ b/drivers/gpu/drm/xe/xe_device.c
>@@ -394,7 +394,7 @@ static void device_kill_persistent_engines(struct xe_device *xe,
>
> void xe_device_wmb(struct xe_device *xe)
> {
>-	struct xe_gt *gt = xe_device_get_gt(xe, 0);
>+	struct xe_gt *gt = xe_root_mmio_gt(xe);
>
> 	wmb();
> 	if (IS_DGFX(xe))
>diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
>index 745dbb16d417..42bc566c53d8 100644
>--- a/drivers/gpu/drm/xe/xe_device.h
>+++ b/drivers/gpu/drm/xe/xe_device.h
>@@ -66,9 +66,16 @@ static inline struct xe_gt *xe_device_get_gt(struct xe_device *xe, u8 gt_id)
> }
>
> /*
>- * FIXME: Placeholder until multi-gt lands. Once that lands, kill this function.
>+ * Provide a GT structure suitable for performing non-GT MMIO operations against
>+ * the primary tile.  Primarily intended for early tile initialization, display
>+ * handling, top-most interrupt enable/disable, etc.  Since anything using the
>+ * MMIO handle returned by this function doesn't need GSI offset translation,
>+ * we'll return the primary GT from the root tile.
>+ *
>+ * FIXME: Fix the driver design so that 'gt' isn't the target of all MMIO
>+ * operations.

could add a short line here:

Returns the primary gt of the root tile

Anyway,


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>  */
>-static inline struct xe_gt *to_gt(struct xe_device *xe)
>+static inline struct xe_gt *xe_root_mmio_gt(struct xe_device *xe)
> {
> 	return &xe_device_get_root_tile(xe)->primary_gt;
> }
>diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
>index 5be31855d789..628057497cd5 100644
>--- a/drivers/gpu/drm/xe/xe_irq.c
>+++ b/drivers/gpu/drm/xe/xe_irq.c
>@@ -285,7 +285,7 @@ static void gt_irq_handler(struct xe_device *xe, struct xe_gt *gt,
> static irqreturn_t xelp_irq_handler(int irq, void *arg)
> {
> 	struct xe_device *xe = arg;
>-	struct xe_gt *gt = xe_device_get_gt(xe, 0);	/* Only 1 GT here */
>+	struct xe_gt *gt = xe_root_mmio_gt(xe);
> 	u32 master_ctl, gu_misc_iir;
> 	long unsigned int intr_dw[2];
> 	u32 identity[32];
>@@ -311,7 +311,7 @@ static irqreturn_t xelp_irq_handler(int irq, void *arg)
>
> static u32 dg1_intr_disable(struct xe_device *xe)
> {
>-	struct xe_gt *gt = xe_device_get_gt(xe, 0);
>+	struct xe_gt *gt = xe_root_mmio_gt(xe);
> 	u32 val;
>
> 	/* First disable interrupts */
>@@ -329,7 +329,7 @@ static u32 dg1_intr_disable(struct xe_device *xe)
>
> static void dg1_intr_enable(struct xe_device *xe, bool stall)
> {
>-	struct xe_gt *gt = xe_device_get_gt(xe, 0);
>+	struct xe_gt *gt = xe_root_mmio_gt(xe);
>
> 	xe_mmio_write32(gt, DG1_MSTR_TILE_INTR, DG1_MSTR_IRQ);
> 	if (stall)
>diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
>index 17b3a9880409..32427c10ba8a 100644
>--- a/drivers/gpu/drm/xe/xe_mmio.c
>+++ b/drivers/gpu/drm/xe/xe_mmio.c
>@@ -150,7 +150,7 @@ static bool xe_pci_resource_valid(struct pci_dev *pdev, int bar)
>
> int xe_mmio_total_vram_size(struct xe_device *xe, u64 *vram_size, u64 *usable_size)
> {
>-	struct xe_gt *gt = xe_device_get_gt(xe, 0);
>+	struct xe_gt *gt = xe_root_mmio_gt(xe);
> 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> 	int err;
> 	u32 reg_val;
>@@ -287,7 +287,7 @@ int xe_mmio_probe_vram(struct xe_device *xe)
>
> static void xe_mmio_probe_tiles(struct xe_device *xe)
> {
>-	struct xe_gt *gt = xe_device_get_gt(xe, 0);
>+	struct xe_gt *gt = xe_root_mmio_gt(xe);
> 	u32 mtcfg;
> 	u8 adj_tile_count;
> 	u8 id;
>@@ -339,7 +339,7 @@ static void mmio_fini(struct drm_device *drm, void *arg)
> int xe_mmio_init(struct xe_device *xe)
> {
> 	struct xe_tile *root_tile = xe_device_get_root_tile(xe);
>-	struct xe_gt *gt = xe_device_get_gt(xe, 0);
>+	struct xe_gt *gt = xe_root_mmio_gt(xe);
> 	const int mmio_bar = 0;
> 	int err;
>
>@@ -398,7 +398,7 @@ int xe_mmio_ioctl(struct drm_device *dev, void *data,
> 		  struct drm_file *file)
> {
> 	struct xe_device *xe = to_xe_device(dev);
>-	struct xe_gt *gt = xe_device_get_gt(xe, 0);
>+	struct xe_gt *gt = xe_root_mmio_gt(xe);
> 	struct drm_xe_mmio *args = data;
> 	unsigned int bits_flag, bytes;
> 	struct xe_reg reg;
>diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
>index c81652d7f4ec..49fff425adcd 100644
>--- a/drivers/gpu/drm/xe/xe_query.c
>+++ b/drivers/gpu/drm/xe/xe_query.c
>@@ -259,7 +259,7 @@ static int query_gts(struct xe_device *xe, struct drm_xe_device_query *query)
> static int query_hwconfig(struct xe_device *xe,
> 			  struct drm_xe_device_query *query)
> {
>-	struct xe_gt *gt = xe_device_get_gt(xe, 0);
>+	struct xe_gt *gt = xe_root_mmio_gt(xe);
> 	size_t size = xe_guc_hwconfig_size(&gt->uc.guc);
> 	void __user *query_ptr = u64_to_user_ptr(query->data);
> 	void *hwconfig;
>diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
>index a3855870321f..012474a6c387 100644
>--- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
>+++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
>@@ -54,7 +54,7 @@ bool xe_ttm_stolen_cpu_access_needs_ggtt(struct xe_device *xe)
> static s64 detect_bar2_dgfx(struct xe_device *xe, struct xe_ttm_stolen_mgr *mgr)
> {
> 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>-	struct xe_gt *gt = to_gt(xe);
>+	struct xe_gt *gt = xe_root_mmio_gt(xe);
> 	u64 vram_size, stolen_size;
> 	int err;
>
>@@ -88,7 +88,7 @@ static u32 detect_bar2_integrated(struct xe_device *xe, struct xe_ttm_stolen_mgr
> 	u32 stolen_size;
> 	u32 ggc, gms;
>
>-	ggc = xe_mmio_read32(to_gt(xe), GGC);
>+	ggc = xe_mmio_read32(xe_root_mmio_gt(xe), GGC);
>
> 	/* check GGMS, should be fixed 0x3 (8MB) */
> 	if (drm_WARN_ON(&xe->drm, (ggc & GGMS_MASK) != GGMS_MASK))
>-- 
>2.40.0
>
