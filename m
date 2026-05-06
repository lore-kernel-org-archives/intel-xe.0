Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9776CD3424
	for <intel-xe@archiver.kernel.org>; Wed,  6 May 2026 05:07:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 995AD10E127;
	Wed,  6 May 2026 05:07:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jtH6rT30";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 724F410E127
 for <intel-xe@lists.freedesktop.org>; Wed,  6 May 2026 05:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778044059; x=1809580059;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Eo+bcBf+qvGPNUbQ2zd5GSddPfN/8P1fetFWcIgigO0=;
 b=jtH6rT30jlsGslIzQ92ZZycYrVraK2MtuL8w2kB4gbjxHZquI6vs2/Ne
 zS/0kcdXoC4P30UWM0+v+rZsxyb7WfiCqrAL110H4AnPg+wHKdCvHg9bj
 kjefIbbR0m/kiSuwi8wWKDSjHQfgkhOIYDjvqecw96Gg7xXntvGfzvndH
 vSVD7UeOPsYazy3IqckfiL9Jhe2ecaW75W3nZBcd9EXBIGCWGFuPGIF+k
 9VPO8WTmxex0B8bbqSUQrqA0lRdL/8lEPLD13V5fcOM5WPkCZzI8HWZJa
 HziHd8HMZBz78o5U+cjQ2fahZhz5zgCW7fe+Le+/7EzOZQCUGhdvJlGCe Q==;
X-CSE-ConnectionGUID: 6kU2kRZqQyO0n1LDWbPs9A==
X-CSE-MsgGUID: 93hg+EaTT2ituKY2a7w0UA==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="78788684"
X-IronPort-AV: E=Sophos;i="6.23,218,1770624000"; d="scan'208";a="78788684"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2026 22:07:38 -0700
X-CSE-ConnectionGUID: 8IT+Y8h+TNO73sH7/6AowA==
X-CSE-MsgGUID: 4+bbemQOTseD7fvb/V8UaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,218,1770624000"; d="scan'208";a="231437150"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2026 22:07:38 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 5 May 2026 22:07:37 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 5 May 2026 22:07:37 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.61) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 5 May 2026 22:07:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kFI+7yMS4K199r434Oj+leOFny4tXax4spU5YAJ+bytzT0TUYxTiTXQRpK/HG+KPQEcLq3rpL6LBKhsfhxZKbbfhkNt3C85gWCPZ8wN/SB9MMSYqep3+jKcw6DD+BLvoRhATmOrbIrxXCuZQmzKnm3edq9SFvfM3neerT4yZIyeSA+rVmPMytk0ZxuUexBVxAm/xGliQ1+mESySXPbfjpyrV/idEEZ2omjHy/cvGLuyKqKcpg4Tei5oDRAzHTJ2cbUz4DFYkAmYEb1kYaMOUOCSEVavtCsdsweUi0JB//2MWYQSbvWSFysPWHgdGktG2LVnlwJMVXSVcH4FF7FIn6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=buvCuhEF9S44ECU6weK0oC/vXIFHGkkBumetdNcdH2s=;
 b=Dvdi5K1Q32T6g6ATF01TFVxK5AkWMnWEdNJW/7X2Zt/KuOvdLyZIVqV5mBPapIDF4futeW5QObBtZsPH0yF6nvg/jCAkbvNyPQbnOC2XjWuigtgS15Ldg1JJ4aCf/DCs3DJ34zZntFWBOZ4lyaP4gfG0I8Fk1y/4CpBaJKSp0t6LTGm8Mo+3mkmli4dgMNKp/2wLV02KNzJ8S2HOmE7etimHAPZtfdkit7flWadG+0+6+bKVQHZYHG+4fbWu70I47Mc1C0JyX6gO0UWOFPbkDM5EsQi1qutoTSLNGD3qpAWLhHEOm5QXJCl2dWmRmsJrsjPeTHbv/fNh9dvEgi+KcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by DS3PR11MB9866.namprd11.prod.outlook.com (2603:10b6:8:366::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Wed, 6 May
 2026 05:07:35 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%4]) with mapi id 15.20.9891.008; Wed, 6 May 2026
 05:07:35 +0000
Date: Tue, 5 May 2026 22:07:32 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.brost@intel.com>,
 <stuart.summers@intel.com>
Subject: Re: [PATCH v3 06/11] drm/xe/multi_queue: Add helpers to access CS
 QUEUE TIMESTAMP from lrc
Message-ID: <afrMlFOeIoJ1z2Ch@nvishwa1-desk>
References: <20260505234408.3552147-13-umesh.nerlige.ramappa@intel.com>
 <20260505234408.3552147-19-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20260505234408.3552147-19-umesh.nerlige.ramappa@intel.com>
X-ClientProxiedBy: SJ0PR05CA0190.namprd05.prod.outlook.com
 (2603:10b6:a03:330::15) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|DS3PR11MB9866:EE_
X-MS-Office365-Filtering-Correlation-Id: 8abecbc6-7cd7-414a-fb21-08deab2d62f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|56012099003|18002099003|22082099003; 
X-Microsoft-Antispam-Message-Info: jiU4dlqJ+4S9vrGA+JUNVao7eZAdWwXA3dVs5oZAvEafZ+kUeazErKi7PGyMCbvaghZb673VtIK36wVwsUdqwV6JVoT97pC1JoTu8fThoTHJ2NuZ3ed27N5xdSOIuCbHBY+YjMtmgOrUjJeYj8oVMCEm7sPDfl5MtgwInnxOPTzeDZb8rr4HGIPwOqYIX4lzC+2ZhTKUKUY4cyu6ULHw9mAnbrDjM0ka95i2Ju6+PK9juIATpE42ot1G48oCJ3l47sEbYP4xLgp0/VvHLxLtLX63ojjeDhoTLo+vOMKL4Wj4p/t2+qr6sdyijvRVffr3A/JjPg8w3djacU5tAmFMV97X76tOII8QtpnZVk6c4NhfC7Wl7lDA85I0WpYb6HJ7P29cwlKzhzUkU08uFSFLrhkOJcOMLmrGvaBhusbGKIFcMiJ8VgnPWQXSr4P8pT5IdJco3VFJeW8HbC/OJdCYPUsiag5PBqp7Mt4YpLtYwhjz5OlDm+ahNYGM8CJJy738I5vFWac5DFqHFJ5ZbjIn6akpyGmaZrzYYf4ww8qGo5T2Zx3c7KwoufpHsL1jiFHfkgg+gEHzALYv6cA6KXwEH35JFUFWsqRLvmh2k9UfZjyfjqFb7WIUWgCRraydMl1MWduT7zSqcTh1B5td+CZ9Up1YG1uATpTpuRBc1LcNPEZIL0KudAOeMLom6ixFiWx8
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mO8KlOqAWCMLMPqgDRKZJjlFZFP95pwMH5FJn8u14A3SqDjYFC4KJ6/N9CkB?=
 =?us-ascii?Q?WuR697+HqOXOhri8kqfPpBPiEyz2kBiTSv85eQHvQVbsGCrBJC2XEPqHz7Vd?=
 =?us-ascii?Q?L0HIAHjV42Puok+k2yDbzXycyBvFENioNayit3PPIv+Xf+k87iIycfhlJdAX?=
 =?us-ascii?Q?LyUri3Ydl7K2+tp6JCrcafaQkB0tuCaHDNpTlGnRHSNj2iv1TCYqxDWrDQig?=
 =?us-ascii?Q?omaH4x99RKQ2PfN83UDozM6Ndkm8HN0r5iLlHdKbwWq/49t6Oj5iPbwjD4Yq?=
 =?us-ascii?Q?SttXPg/NrsgITezldZs6AI7qk+HbyPq055KqRT/Zko8tgWUmmjThd2y5HpB8?=
 =?us-ascii?Q?wd+0w/l14evh1zV+N+H63XGh56CAEFW6EfCmmmgxoKVB3P3P2aCD7c1Zx22q?=
 =?us-ascii?Q?P9lkuaJXR4br7jAwCBgcF1YzkTMqrPdCF6Lnb/gtWTNar7TMwqdl/437Rrot?=
 =?us-ascii?Q?g5Ttpbw0HPCeisaMDURdHN+NjOfsTQkEh//haessu7THTAnSQmM7nv5BkFMz?=
 =?us-ascii?Q?JHl+Gphl/Yb2EHF+muF9IXy+/Pcbd4/AX3WrAy71PGzUorclLZPAe3cB5bi8?=
 =?us-ascii?Q?UjEsADStqwqCXwS9xhhvPnc4IDXUctj5tViMQdgy33MjvunZSQSSXkWwkHaM?=
 =?us-ascii?Q?1KfJcpedBZmsyJqjZwtZZAWUyHaFG0+kgS47Zda4lcg6VMW7TlAgqB79pEnU?=
 =?us-ascii?Q?ThaNojQB/aO8f5XK6QYnMKY/qkvJmFfi0Ml+VtCMqA+xCthTl32gFroKlhlR?=
 =?us-ascii?Q?fFHPKXqjTcQZDylsCsN7KrE6y6O6dUFNerq/7Utsgfj626aov4RxRlGErklG?=
 =?us-ascii?Q?YNPZV08s2mXBl+WfiBDpfQehE/qm3+mnuvxdmyv6vEiaZU6TcRBrswq9F8gs?=
 =?us-ascii?Q?m0nyNWt9mD/2tz/LUWgSEDwYyGtaw7YvRGj0J/VhApo7sp/GCf3N/tJ2NUcU?=
 =?us-ascii?Q?EHwaPJ1VDfezz/onYrFK5zqEp6OiJ3sTSB+QXZOdPEIMdRskvHJ02AaUKdkw?=
 =?us-ascii?Q?TEkJR2kA+nFpfXuQFIye+KltK/RNr4AwolCIg904NRwTOQhrX+qAs4VkqbNl?=
 =?us-ascii?Q?TNaGRXZhuNtag1UNPpNa53fwIN/lIP0sPfpbZKUGgzeN7tEijdamlUfzIy4X?=
 =?us-ascii?Q?dnuZMDPkxiMUYYVigbFqIW1YjpNJWv+aSjCI/lUYehRpfrwLrKjidl926cWq?=
 =?us-ascii?Q?1rV/ZzZw2Pn2ixF2DiM5NCcrpa5+46QPTpiSmJvWh3J4yUWKnVv6UQC9n5ti?=
 =?us-ascii?Q?ph5lLgRywbYUkqFGSoVmbrlIo2yKQ6Hae3pFEi9c/AikMZG5DmeWvYr24CKX?=
 =?us-ascii?Q?17aiLT7qGCzhikzo1IhKbQY/uNh5x6S6WNgK3fw+h3NQ3mDf2Q6zqwX0Nsb6?=
 =?us-ascii?Q?wveEltJXZ3AaeLoi8Hd2xV6QkqeGnaweiTt7GkU9b7aMU4yxmBkwBvLaAnLt?=
 =?us-ascii?Q?XkzvVUx/OZkzjePcoEtlUVwgGrRcBc+UOvSGzOnJg9PBpuxxPPAWGaJl5lPa?=
 =?us-ascii?Q?gmklCEVaSJyk8nkVHWjjrMRTMfQDQ+q91v3Hn8V3zMr5j5aBp5xxZU+neKON?=
 =?us-ascii?Q?fB0vy9G/jXFOaFLrlPzG1Z201gXaAgXV/av6pZnmMFJi5U46gZSKKbpGg6zB?=
 =?us-ascii?Q?2kK4oi2NfiHykTB33anMOQ+xV333Ca427vI0deyLTnDQ7bZfUeCKfZNoBoTB?=
 =?us-ascii?Q?5rD9xlHegivVVP12jBzv/m6/nYsQlwGfS9ZQwyWlFbl/ogbBAM5qQchSfhfw?=
 =?us-ascii?Q?7m1HV07KXT4vs4bjGDRPtL9MajQyaO1GFTKCl/knb2wj2963M/bL?=
X-Exchange-RoutingPolicyChecked: E/DcB/dipCgSofZ6qN8uu4nRTXTmEmIAOVJ7rsuJzXGFNjo9PcwpaNdZJzAre5Q/rI2yO4yvGpxk+Mow0Y9u/7xU+jMj/kQwNBOCFJXdqr8VJepFum0KPvdUR+XVpwbqq2QbAqhLzIYbzMbtPWR6CXTjPRBf6NRufrQPq9dOtdaF2ho/FPWD3g8DRukr1SUwyCTl4KECbvrp9+Pk+N0BhYF3Ph5DASeD9uGwxzYBIQN0l3hchrX1eNyEH7sHY8CGGg32IWtbPSvKtSEQQ0/+EFyMQCqy2Fizy/55klfdK0eTfvcEn6TrGhlG4WZIRZUspah+xXT39Hlzd4Br2BCvpg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8abecbc6-7cd7-414a-fb21-08deab2d62f7
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 05:07:35.7086 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jAMpvTRl9tmhFjufIv1jN4e0PAL64qt+SgxO4gcttw/IjsAIXqnYnmq21At3eGtUPHb81T7bz/7PJCyQf91SfJ9XuvQd9K7bzvTib3zY5VKWpddXYWC4zXl4gii9RtTR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS3PR11MB9866
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

On Tue, May 05, 2026 at 04:44:15PM -0700, Umesh Nerlige Ramappa wrote:
>In secondary queue LRCs, the QUEUE TIMESTAMP register is saved and
>restored allowing us to view the individual queue run times. Add helpers
>to read this value from the LRC.
>
>BSpec: 73988
>
>Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>---
>v2: (Matt)
>- Add BSpec reference
>- Make queue_timestamp snapshot 64 bit
>- Add a snapshot of queue timestamp in ms
>
>v3:
>- Replace xe_lrc_is_multi_queue check in lrc init (Niranajana)
>- Use assert instead of check in xe_lrc_queue_timestamp
>---
> drivers/gpu/drm/xe/regs/xe_lrc_layout.h |  3 ++
> drivers/gpu/drm/xe/xe_lrc.c             | 46 +++++++++++++++++++++++++
> drivers/gpu/drm/xe/xe_lrc.h             |  2 ++
> drivers/gpu/drm/xe/xe_lrc_types.h       |  3 ++
> 4 files changed, 54 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/regs/xe_lrc_layout.h b/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
>index b5eff383902c..4ab86fc369fd 100644
>--- a/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
>+++ b/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
>@@ -34,6 +34,9 @@
> #define CTX_CS_INT_VEC_REG		0x5a
> #define CTX_CS_INT_VEC_DATA		(CTX_CS_INT_VEC_REG + 1)
>
>+#define CTX_QUEUE_TIMESTAMP		(0xd0 + 1)
>+#define CTX_QUEUE_TIMESTAMP_UDW		(0xd2 + 1)
>+
> #define INDIRECT_CTX_RING_HEAD		(0x02 + 1)
> #define INDIRECT_CTX_RING_TAIL		(0x04 + 1)
> #define INDIRECT_CTX_RING_START		(0x06 + 1)
>diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
>index 3b6990d68a5a..127a2ebc3679 100644
>--- a/drivers/gpu/drm/xe/xe_lrc.c
>+++ b/drivers/gpu/drm/xe/xe_lrc.c
>@@ -777,6 +777,16 @@ static u32 __xe_lrc_ctx_timestamp_udw_offset(struct xe_lrc *lrc)
> 	return __xe_lrc_regs_offset(lrc) + CTX_TIMESTAMP_UDW * sizeof(u32);
> }
>
>+static u32 __xe_lrc_queue_timestamp_offset(struct xe_lrc *lrc)
>+{
>+	return __xe_lrc_regs_offset(lrc) + CTX_QUEUE_TIMESTAMP * sizeof(u32);
>+}
>+
>+static u32 __xe_lrc_queue_timestamp_udw_offset(struct xe_lrc *lrc)
>+{
>+	return __xe_lrc_regs_offset(lrc) + CTX_QUEUE_TIMESTAMP_UDW * sizeof(u32);
>+}
>+
> static inline u32 __xe_lrc_indirect_ring_offset(struct xe_lrc *lrc)
> {
> 	u32 offset = xe_bo_size(lrc->bo) - LRC_WA_BB_SIZE -
>@@ -826,6 +836,8 @@ DECL_MAP_ADDR_HELPERS(ctx_timestamp_udw, lrc->bo)
> DECL_MAP_ADDR_HELPERS(parallel, lrc->bo)
> DECL_MAP_ADDR_HELPERS(indirect_ring, lrc->bo)
> DECL_MAP_ADDR_HELPERS(engine_id, lrc->bo)
>+DECL_MAP_ADDR_HELPERS(queue_timestamp, lrc->bo)
>+DECL_MAP_ADDR_HELPERS(queue_timestamp_udw, lrc->bo)
>
> #undef DECL_MAP_ADDR_HELPERS
>
>@@ -874,6 +886,29 @@ static u64 xe_lrc_ctx_timestamp(struct xe_lrc *lrc)
> 	return (u64)udw << 32 | ldw;
> }
>
>+/**
>+ * xe_lrc_queue_timestamp() - Read queue timestamp value
>+ * @lrc: Pointer to the lrc.
>+ *
>+ * Returns: queue timestamp value
>+ */
>+static u64 xe_lrc_queue_timestamp(struct xe_lrc *lrc)
>+{
>+	struct xe_device *xe = lrc_to_xe(lrc);
>+	struct iosys_map map;
>+	u32 ldw, udw = 0;
>+
>+	xe_assert(xe, xe_lrc_is_multi_queue(lrc));
>+
>+	map = __xe_lrc_queue_timestamp_map(lrc);
>+	ldw = xe_map_read32(xe, &map);
>+
>+	map = __xe_lrc_queue_timestamp_udw_map(lrc);
>+	udw = xe_map_read32(xe, &map);
>+
>+	return (u64)udw << 32 | ldw;
>+}
>+
> /**
>  * xe_lrc_ctx_job_timestamp_ggtt_addr() - Get ctx job timestamp GGTT address
>  * @lrc: Pointer to the lrc.
>@@ -1538,6 +1573,12 @@ static int xe_lrc_ctx_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe, struct
> 	if (lrc_to_xe(lrc)->info.has_64bit_timestamp)
> 		xe_lrc_write_ctx_reg(lrc, CTX_TIMESTAMP_UDW, 0);
>
>+	if (xe_gt_hwe_class_supports_multi_queue(gt, hwe->class)) {
>+		lrc->queue_timestamp = 0;
>+		xe_lrc_write_ctx_reg(lrc, CTX_QUEUE_TIMESTAMP, 0);
>+		xe_lrc_write_ctx_reg(lrc, CTX_QUEUE_TIMESTAMP_UDW, 0);
>+	}
>+
> 	if (xe->info.has_asid && vm)
> 		xe_lrc_write_ctx_reg(lrc, CTX_ASID, vm->usm.asid);
>
>@@ -2466,6 +2507,9 @@ struct xe_lrc_snapshot *xe_lrc_snapshot_capture(struct xe_lrc *lrc)
> 	snapshot->ctx_timestamp = xe_lrc_ctx_timestamp(lrc);
> 	snapshot->ctx_timestamp_ms =
> 		xe_gt_clock_interval_to_ms(lrc->gt, xe_lrc_ctx_timestamp(lrc));
>+	snapshot->queue_timestamp = xe_lrc_queue_timestamp(lrc);
>+	snapshot->queue_timestamp_ms =
>+		xe_gt_clock_interval_to_ms(lrc->gt, xe_lrc_queue_timestamp(lrc));

Maybe in patch 5, we also dump primary_lrc and pos in snapshot capture.
We do that in exec_queue snapshot capture.

Niranjana

> 	snapshot->ctx_job_timestamp = xe_lrc_ctx_job_timestamp(lrc);
> 	return snapshot;
> }
>@@ -2520,6 +2564,8 @@ void xe_lrc_snapshot_print(struct xe_lrc_snapshot *snapshot, struct drm_printer
> 	drm_printf(p, "\tSeqno: (memory) %d\n", snapshot->seqno);
> 	drm_printf(p, "\tTimestamp: 0x%016llx\n", snapshot->ctx_timestamp);
> 	drm_printf(p, "\tTimestamp ms: %llu\n", snapshot->ctx_timestamp_ms);
>+	drm_printf(p, "\tQueue Timestamp: 0x%016llx\n", snapshot->queue_timestamp);
>+	drm_printf(p, "\tQueue Timestamp ms: %llu\n", snapshot->queue_timestamp_ms);
> 	drm_printf(p, "\tJob Timestamp: 0x%08x\n", snapshot->ctx_job_timestamp);
>
> 	if (!snapshot->lrc_snapshot)
>diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
>index 557dce004d48..0a3a611391ee 100644
>--- a/drivers/gpu/drm/xe/xe_lrc.h
>+++ b/drivers/gpu/drm/xe/xe_lrc.h
>@@ -39,6 +39,8 @@ struct xe_lrc_snapshot {
> 	u32 seqno;
> 	u64 ctx_timestamp;
> 	u64 ctx_timestamp_ms;
>+	u64 queue_timestamp;
>+	u64 queue_timestamp_ms;
> 	u32 ctx_job_timestamp;
> };
>
>diff --git a/drivers/gpu/drm/xe/xe_lrc_types.h b/drivers/gpu/drm/xe/xe_lrc_types.h
>index 0a5c13ec2ad7..53ef48feebfc 100644
>--- a/drivers/gpu/drm/xe/xe_lrc_types.h
>+++ b/drivers/gpu/drm/xe/xe_lrc_types.h
>@@ -64,6 +64,9 @@ struct xe_lrc {
> 	/** @ctx_timestamp: readout value of CTX_TIMESTAMP on last update */
> 	u64 ctx_timestamp;
>
>+	/** @queue_timestamp: value of QUEUE_TIMESTAMP on last update */
>+	u64 queue_timestamp;
>+
> 	/** @multi_queue: Multi queue LRC related information */
> 	struct {
> 		/** @multi_queue.primary_lrc: Primary lrc of this multi-queue group*/
>-- 
>2.51.0
>
