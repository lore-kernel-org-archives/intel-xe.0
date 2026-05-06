Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6871CCD3427
	for <intel-xe@archiver.kernel.org>; Wed,  6 May 2026 03:11:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 146AF10E4D1;
	Wed,  6 May 2026 03:11:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nYSI+FOf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E845D10E4D1
 for <intel-xe@lists.freedesktop.org>; Wed,  6 May 2026 03:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778037076; x=1809573076;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Yw/5fZQO76Pe0kYQK56MhXXfFnn5FzPtQYzt924MzXM=;
 b=nYSI+FOfMniwMbxjA5OVuaeH1vYMic9TuRfaAgl+/kmUTaM+4QLLA/w1
 nfaVFwnS9d8TfpCSBe0wWaZ/Bt8WksbGNPCqRbBQFqrHlnTbzvRL9PgGP
 DRTsvxMYfJPKefrPFJ8QUdxn+ks+8GbNdV8UElm8nzxNPANwepimumVC6
 aeDPnPix6UeFAmeMU7RN/aFsuJvU1JfAaV7AHBjKCHKJxlv74bxp1iBg9
 Tc97PIKWO3xWr4zeju6RL+nAvGXK9xP9YDFDQpOH8nlQJGbGY63TyMsU1
 8Y64kidpAbdBSt+pzqDpbT+frCE2kOO0kPSh4pajBw6PUfZSq984CG7M/ A==;
X-CSE-ConnectionGUID: WRBzs4j3SYGQdU6WuRpoJg==
X-CSE-MsgGUID: RwDttjh7Tvmu6sqYXoKfkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="82532987"
X-IronPort-AV: E=Sophos;i="6.23,218,1770624000"; d="scan'208";a="82532987"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2026 20:11:01 -0700
X-CSE-ConnectionGUID: P7uNbnhlTu+E4dbZV94pdg==
X-CSE-MsgGUID: Ii4pmdAcQ3am67jOdN3KnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,218,1770624000"; d="scan'208";a="240304579"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2026 20:11:02 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 5 May 2026 20:11:01 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 5 May 2026 20:11:01 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.47) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 5 May 2026 20:11:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mH9QSfQPYI7cq6tpej2PY0sRcW+ITSD6s/WxDoVwGKwkngoz85qvzHjGs3L1fyIsLw3ny8LmXcPACLj3BTg5snxxkmd+fV0xO7Lq3Uj2CNWld7j+SDKJVfSGucMLl6d0/6IZWLR627QqLimZZ1uiVLmnKOLeWoFJfTgzmVZtDrbG0B02tT6r7+lnM4zXnZfVPxhETFB1x25dOkZ4gkCY/7rRVPfW1ifabdRFy0XKmyY6EdW17OLDBJelxmqLWyB5IWj1F6ULszG7z/iABEjU5ZGJjH+ROGi8CM0Kz7DQRY4MNJpezuYe62C3OMHUOiLyySGGa2xas5/lipm7Lk7Keg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=45wXtPQ25pUuEPYJijFa9M7YGrsqBJV3tCKoF9NvRZs=;
 b=Nx9Y0gx8n8ZqQyHX3oFUbgrfR7iQJ/9mYYanp87TUTG9vsx/vZev12T/vzYDrpb81r03lUhNIikD6Gcu3rymeHm3OhfIeIlvaxO7LFalhi9oMWeDG/9JYTmn4EuxMkGwtn99H6jwGrsUoPqj2jF9vdVS12oHc9FxXuRSfS9qzRyCJoBXgkP80zq6QrXy84q+ZmKDOwM5IODjxuLRB/ZabtXTFYoNH/F0vo95hM4T0Ryg0LJ/CZ/RA2OgFjZ0FJWyhYuPKcXafmMGemKMqArdpU5Vr/EcKDCihg3J/14B1XARnHejOAPzKWgsWz714MqbDZqzYmzVwucFatsQlZ2/9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by PH8PR11MB6729.namprd11.prod.outlook.com (2603:10b6:510:1c5::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Wed, 6 May
 2026 03:10:57 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%4]) with mapi id 15.20.9891.008; Wed, 6 May 2026
 03:10:56 +0000
Date: Tue, 5 May 2026 20:10:53 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.brost@intel.com>,
 <stuart.summers@intel.com>
Subject: Re: [PATCH v3 02/11] drm/xe: Add timestamp_ms to LRC snapshot
Message-ID: <afqxPah_W59TjBNu@nvishwa1-desk>
References: <20260505234408.3552147-13-umesh.nerlige.ramappa@intel.com>
 <20260505234408.3552147-15-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20260505234408.3552147-15-umesh.nerlige.ramappa@intel.com>
X-ClientProxiedBy: BYAPR03CA0010.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::23) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|PH8PR11MB6729:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c84c9c6-819d-4c3f-0126-08deab1d1718
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|56012099003|22082099003|18002099003; 
X-Microsoft-Antispam-Message-Info: Yq3Tc+OtY+0VuPfW8DpkHU2+ZdRumRcdZ8JpjWuWGQQHZazU/5hj5tF165/P08lgnn5BwIdH1Adannw5zs4+gYbWPWjUlyQKHd8pOkTGyAcHhncYPq0mKWBwutvMcxwVvpJcLEBJh3HqiYjFD5pBUGkoJYt4liFaBerwXcHvAY+MtcQRnrPL/029JFsJDz3nkYnkFgLcpMXzwXQPcBlWH2Ovksebe+6Kbd5l3zVYzOsATuTWzzF7sUgfcTriqvd1uXkotgcFrKEn19AVdO3fyszOUC5TVTVQst80xCAZ8XKsO0l8BXjRAoBcidC9+MFJsDRFMLKdczUadX4Ll0eRsxfMavwJ/LPx0yHH62qsTWvbLmS/Zcsa0NRWv/33uW+gOZo2IsYR5qXeC1TPLwvqlDOJtAvbYZMeKO9TDVsNEo3Zyh+DH3Lfry42bRe5KoiykST8UOUp3cqn+Si+QoQr96+NEVOW3PsZUU62L+MM7UMd5Do+DVXo9Drkqhg3XMd/pfNe87laRdvbVC9FRdJIk1mgOWDOrpaW7WncqtZVEsUauJ8SB79tjr0CFhyN+q7lLZ3V7+aFW83kff1NLAUefkfeuJjiVob7Z6n+wsgM+CO33aga6O7W4tjXGPSscGghmC7FnHnSA6JO17rD/e89G0Ocwi+wMOmOCJ0TyBA2S7yZRYRte12PPUTpXZbu+f3G
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aRD5AR3dWBPDGCH9bDBS2Ju/brKN/g1HhAkAYBbtdEJmMvR9n52eW234NGZZ?=
 =?us-ascii?Q?KzCus7hQxO+IRVXDuz2Ov7+VUcEFSdZttFaWnO+95uasLsEqPiAhhnZ7YCbQ?=
 =?us-ascii?Q?JIaMV3s5nsxvaUum0Mu7m1BeyQ4p3k7oXaUIhgoaCCcxGcCs58r36IzS+4mT?=
 =?us-ascii?Q?9dQ8j2itvaYFnxHql5k/4LKKNHSkCI816z1dlBoTmCOiw+BMt4UXTvg42iX9?=
 =?us-ascii?Q?crF59pAp3ZFLQYmSqE1EaGxL8asvDUdqaXI1CSy/MSy3b3nxLLbuYh8YvCVP?=
 =?us-ascii?Q?wvMiV3YL/7xPulXMAkWcY3xP18OU7VIVL1izuGWNP4WeXvXMDensi1S5jBBM?=
 =?us-ascii?Q?GhENmgTXYQgnOz8prfTVJ6DTae5kz2IkxeeGWitJwZ28MbwRI6xzDOtiHjzF?=
 =?us-ascii?Q?azhWuQiM46Nv9zOTwFXrtoRezDf+m/OGZ6ERekZo/7TUMqxAnC5K5KwTzz+Y?=
 =?us-ascii?Q?KUIF2ihV6Af6oZQx2HfB9rc0HmzsTJKtH8KBGag3or8p9p9O0vyX7uTRXfzS?=
 =?us-ascii?Q?R7mp5Wbt/vE1UgB1xLdKDRgiaU8QMkFBs/hk4o3iFKEAOVF0M3nygVs/3XIM?=
 =?us-ascii?Q?p20PKOg8Xqn0bSNNV3GHtMRLHvg2aF7bu10GrlQl6KmTSrNnUe9csKVWkHwp?=
 =?us-ascii?Q?01jFGYZicKymloEwUZ22xiA6B63YNIue6D7UZ/B2to2Lwl24F69R+jjdtMm2?=
 =?us-ascii?Q?qfrzvjhdOmyJJ0eVrvwFzyS1t6b/QGbkacFEwpxTIOduS8GETGBniHX+gd+3?=
 =?us-ascii?Q?t3KBmJrvmeSwW7tzC1aGMcCFIiPsJMpq/9Vp9KIAoIgT9YLWHfpBpJv+YmwL?=
 =?us-ascii?Q?Etg3fsil7uhIzTQAdbFR0lzv8UVtTJeS2MQk7UYC8yN40+I+dJe1B65P17zM?=
 =?us-ascii?Q?EsGT/1EqRiYadlyQ1Aam9YnCtyzV+IN/AMuGpM92BiAphfbJDnepYrIGAQB+?=
 =?us-ascii?Q?L4hdczUyIEGU4rzFJb0TwkdnFYBVGbZlN+9qoFNo/eQG2iFTRzwz4ieQoAAt?=
 =?us-ascii?Q?mCgwL0aG9hV9igfAcWXqeifLcMPpBxC+WVtiwiB6rRKnrs+N4j1m38SLFMhz?=
 =?us-ascii?Q?g374eo+Z9Ds+JaRV8WO6a7z+6eMr5YCaBrr9o0WjUw5n5FdEDVYCaJl/M+v6?=
 =?us-ascii?Q?Wjp/39Z5x4Gt3re6JRO+AxBWxDTl9Fd22bPb4B6BbU6RJ0arboRf4svQZz3K?=
 =?us-ascii?Q?M1MRmKV86vZbtAbRAQoinCpCRZob4OeYKaQzg04s0oj26tjZFNqyN2vSyVJq?=
 =?us-ascii?Q?nM/Swu7J8sXEBtB7usacFgi7KldXsiOkfcVT7s4TvccB3CZG/zgyWd4cVzIz?=
 =?us-ascii?Q?F0AZxPC5wBKGgJr0kWTAUKLIAULEtkGhD25dIR2L1UwxkuixBZ4zLIIN7db6?=
 =?us-ascii?Q?+BH5rzWExkqSP2c1fdtlxacZ6gV0nmUiFbGFvnYUGwpUhIkW79j62vDrXx+X?=
 =?us-ascii?Q?6jHa3dK7Qyz+PVcvTPmRyltyI+/WmrRgbnSz0IgJsaoTi/0Fe5wOSoWwgP6l?=
 =?us-ascii?Q?6h1IgJZmaBA4+0KYLtFjVooW0AptvJ2rSIXZIWstjPS9O89sXeijXADLjNtP?=
 =?us-ascii?Q?Xwtdoc4EglWiBa2lpLNVV6VNNv5DLJV0pXIVZbZf+qjbsWjtrL7NXgclPhnD?=
 =?us-ascii?Q?ryTMzyHKRnAu1xaI3HcaJFZ26TjKNAC3BQUAl/VTedwNGKaJODA8yK9x1siR?=
 =?us-ascii?Q?s1kW6nVMl/saRMDHHL7cbYksU4mhIL/2dpY8LhfxuH0lRcnVvg1DHXC6Y9PC?=
 =?us-ascii?Q?gUUAjAwTOZu1NOfsn92N3FTtCAhSBa/sMB20ZCZE+yJ7DNCrVOUv?=
X-Exchange-RoutingPolicyChecked: WjQblzizbNfNuG280vYlXKWZryRTaMerqLX1AXptD69PFlHOkCWePqU1pVUPdUJD4TNWBSEVKk/zAzqTn3kRmt6WEyy9QDiYvcBnJ6rea3Zg/3Ujp51CBst4+Xl29UFI1G+05lTzswWMqmoNYLG1kCbThp4ay4U2LlHdOBlfSDi2jEyzOSZWGfENHkCs0k6X+0d0OrSsVDYi49DrWpHZyt/sd9LeasgPRG/14VFBA4TIrfvlYyYcT2T3rDbF9RJxUScDwzZ7CJfbTDY/i/lVcB6JRnKwhbtZ/v5ddtxtP/Ln5dlNuBm/YjRCWw5jKvuFVlyW938D7gM5mRd/i/EDTQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c84c9c6-819d-4c3f-0126-08deab1d1718
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 03:10:56.4822 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iff6nDe1GbCRU1ssPZmM8+K6/SdPxG/Tyf8Fp505QPUwpnsDFJEnMKEzPFUwdWE8bbsLDHgQPr9TJc0ylNWjaFgf4+gCEozC5P0ecG5BwE5cTqQrdMaakla5UP0+e8a9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6729
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

On Tue, May 05, 2026 at 04:44:11PM -0700, Umesh Nerlige Ramappa wrote:
>From: Matthew Brost <matthew.brost@intel.com>
>
>Add a timestamp in milliseconds to the LRC snapshot to make it easier to
>reason about how long the LRC has been running and the average duration
>of each job.
>
>Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

LGTM.
Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

>---
>v2: Group u32s to avoid padding (Niranjana)
>---
> drivers/gpu/drm/xe/xe_lrc.c | 4 ++++
> drivers/gpu/drm/xe/xe_lrc.h | 1 +
> 2 files changed, 5 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
>index 570ff9f55849..66682a678cc2 100644
>--- a/drivers/gpu/drm/xe/xe_lrc.c
>+++ b/drivers/gpu/drm/xe/xe_lrc.c
>@@ -23,6 +23,7 @@
> #include "xe_drm_client.h"
> #include "xe_exec_queue_types.h"
> #include "xe_gt.h"
>+#include "xe_gt_clock.h"
> #include "xe_gt_printk.h"
> #include "xe_hw_fence.h"
> #include "xe_map.h"
>@@ -2463,6 +2464,8 @@ struct xe_lrc_snapshot *xe_lrc_snapshot_capture(struct xe_lrc *lrc)
> 	snapshot->replay_size = lrc->replay_size;
> 	snapshot->lrc_snapshot = NULL;
> 	snapshot->ctx_timestamp = xe_lrc_ctx_timestamp(lrc);
>+	snapshot->ctx_timestamp_ms =
>+		xe_gt_clock_interval_to_ms(lrc->gt, xe_lrc_ctx_timestamp(lrc));
> 	snapshot->ctx_job_timestamp = xe_lrc_ctx_job_timestamp(lrc);
> 	return snapshot;
> }
>@@ -2516,6 +2519,7 @@ void xe_lrc_snapshot_print(struct xe_lrc_snapshot *snapshot, struct drm_printer
> 	drm_printf(p, "\tStart seqno: (memory) %d\n", snapshot->start_seqno);
> 	drm_printf(p, "\tSeqno: (memory) %d\n", snapshot->seqno);
> 	drm_printf(p, "\tTimestamp: 0x%016llx\n", snapshot->ctx_timestamp);
>+	drm_printf(p, "\tTimestamp ms: %llu\n", snapshot->ctx_timestamp_ms);
> 	drm_printf(p, "\tJob Timestamp: 0x%08x\n", snapshot->ctx_job_timestamp);
>
> 	if (!snapshot->lrc_snapshot)
>diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
>index bef7af9a578b..d280e6572398 100644
>--- a/drivers/gpu/drm/xe/xe_lrc.h
>+++ b/drivers/gpu/drm/xe/xe_lrc.h
>@@ -38,6 +38,7 @@ struct xe_lrc_snapshot {
> 	u32 start_seqno;
> 	u32 seqno;
> 	u64 ctx_timestamp;
>+	u64 ctx_timestamp_ms;
> 	u32 ctx_job_timestamp;
> };
>
>-- 
>2.51.0
>
