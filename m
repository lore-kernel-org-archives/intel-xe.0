Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 514FFCD343B
	for <intel-xe@archiver.kernel.org>; Wed,  6 May 2026 03:31:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11EE510E144;
	Wed,  6 May 2026 03:31:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QKHeLnRL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48A4410E144
 for <intel-xe@lists.freedesktop.org>; Wed,  6 May 2026 03:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778038297; x=1809574297;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=QId3+nZEPmrlGKIBZ9pFteYkvbHmK0AAfyvbU5eseQ0=;
 b=QKHeLnRL2oErZs9HuToLozW6qWXUFrCmdNaLzJcUEbLON3fURLM/yi3k
 QfdYiPe40pcdddwXBLWgKdDHr6rsjTwP+WYutEMV9JJdrh2KoZm03mlNt
 xq1Bi1MA1w7AFxnKb7Aivkkq45SowD5B46ZchIYYEA9fneJNPrHafEm2H
 RLwW2oJcb5AnpHNGdMrCGs7L1j8KpU8NpGJvT+nmk6Ke90vE/yreEwLZm
 UT+AUt26TAzQJqyyOZbb7m/FqfP2hf2CYItv4THSlgi/EUHEsp6TJMizA
 KBi006fN1UoPbC5hWEB94SZwEvao4k75fJdfcn26EjwrQf+wv6piBNbvj g==;
X-CSE-ConnectionGUID: x1mhVWMUTQu87vGAnfwcIw==
X-CSE-MsgGUID: nDCg1QdsRm6eL4HmeYnFYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="96354706"
X-IronPort-AV: E=Sophos;i="6.23,218,1770624000"; d="scan'208";a="96354706"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2026 20:31:37 -0700
X-CSE-ConnectionGUID: o8s4TiksTUmhEChOIUxwfA==
X-CSE-MsgGUID: RS3ZZj6ZR4GMeOTUIOMakg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,218,1770624000"; d="scan'208";a="235004745"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2026 20:31:37 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 5 May 2026 20:31:36 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 5 May 2026 20:31:36 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.35) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 5 May 2026 20:31:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D6tYjQXojY0yhhnnPTCgOG7gn9hzNyd9Dm0elVV4qfmzF25uFhyi/eRERiCt3fMe+zQ8f+K1asANcsi7nJPF5tfCAtW9qq9v7z52PzSOwYlPGckfuI2DsUmdWYCRq9VwS/yFWddp7dd2YqRdnn+R9wkiez8q2AeK8fQ6w2NP2yk4Nt2JNOHRIveitjRrDrsmxj07n0A8JlR4eTRdTckJP0QB59cWDN2Yqg/NBgJTXIpzpuKMuzWrABMd/BgcnOElnKOBD6mQc4pzfTJEK6sQNIFryZ1qVlDWrS8/CGGfIxKg70xdMPptW3aGYByTPrwTI8izK9j7M55nsFEvW6nATA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Gn3HlKLxr1cVOEFyCqraS3D3KBfrA7YqmMMHbwEW1U=;
 b=VqlRCE4xvT6pKJu6QlSZXkQOXYRwt628O/U2vnwzQtvLp3G/InEwQXEbtCXVT+uNnVMH9gRauEmMOoqqRPHtd5pBTu8KcgclDfXePDGdjCg9hz2ZIojJqutBwp6zUUf1Pix3ONvwCope3pa1NSuoSSEFMOGbgd47JpfarHAK4blAgWkNcw+Du8zHi/D5+Yb17CS3E3a9uKD8qoM7vsCgdeX+5T56Ad22oj0+xruQ4Mr9nArnT4Utqo+0p9Lf1YShF+ISQ8dCeQgov1QwNjKLUmcZB4SiFh74bz4GvL+dgp1dH2gHDj6T9CRYDTx1PLc3dkxICSJL4HQFQxQ0WSCerg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by DS0PR11MB8162.namprd11.prod.outlook.com (2603:10b6:8:166::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Wed, 6 May
 2026 03:31:28 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%4]) with mapi id 15.20.9891.008; Wed, 6 May 2026
 03:31:27 +0000
Date: Tue, 5 May 2026 20:31:25 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.brost@intel.com>,
 <stuart.summers@intel.com>
Subject: Re: [PATCH v3 11/11] drm/xe/multi_queue: Whitelist QUEUE_TIMESTAMP
 register
Message-ID: <afq2DW2AFRfGs5Dr@nvishwa1-desk>
References: <20260505234408.3552147-13-umesh.nerlige.ramappa@intel.com>
 <20260505234408.3552147-24-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20260505234408.3552147-24-umesh.nerlige.ramappa@intel.com>
X-ClientProxiedBy: SJ0PR03CA0388.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::33) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|DS0PR11MB8162:EE_
X-MS-Office365-Filtering-Correlation-Id: b9232cd6-570b-4a20-464d-08deab1ff520
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|18002099003|22082099003|56012099003; 
X-Microsoft-Antispam-Message-Info: hYf5sd3xohUMkFlIiBbNabMmpy7oK0F2tNRjAlYT4+fuTZBj4WAvNM91Jc/BqkIOh43WIsc1xOHJbWxQjdVR6in2QdJUqZ1q2GwjtpShRsS46eRhuHHVIA9ACyfGoB7/arAZXmZR68gCvazP0TMUaaEpyWBCTaT3zD1YZr14Jrzg8qq93jNFW2cerpowq8AQeIeWqy2Fj4fExHJIwe2WNj2G2gaxxmn6EWXWM97LIJm92PfhgSuF0T6fYwHxKm+FLGofJEHHDZhvUi8YPGnvpAb1g8r5R5Ay3SK6BUaLqRa7JkKPI/WuvrW2HO3fSqUJhO/IsbihHq2zVckyPwiiRQxgBz1aOsyVKNFQHqlTkIdbb+xcM56yZo0IHYhU8LH2byn3WSaR7j9UMWNQBhDZFEtk3s0zerIfbiYLwIQPPxlEbY+WPggIHsJhf/i2FNAG2aLMLQGb/iiax47CRjk6p3aoNsSVljg6N5loiW1P2u2YOOVckrr7FOSMCJBOqTVpBeWV9zGC3GPN3kgmcUrlMBe6tKHQBkB2QXClEgQhzLUvTDYZhP7yXXSM1VCI1tj1YV2Ob05+4ItYSMeyI1s7AMOqPQV91UpkPNZka70eS8INlYi1ltqpYMJmVSNN04JGF8ZSwLkgkA/5Ea0tG/5SEg/BMFrbTrongqIELMtfCUtmefltWiXgRPi80CMYG80+PQ3hN8trGidxCKmTNwPePg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yNfu9kattBso1ShDnAQqdUuajUGndpUN4f2C0Dr68v7I8G6tflJXTuFr9dwI?=
 =?us-ascii?Q?DmbjS7iSJmnoG9mMxIyab5QbTpiEa7QGUKZkroqql80CwI5dEtDPsVCyhh5u?=
 =?us-ascii?Q?zAs2pQz2pVTTBp9yKfmWFPct0ymJ6AGwjfSZe7bdaaVnK3njLT4c4xGLAcIR?=
 =?us-ascii?Q?tQDOhPsFtONhDBEXdiwts4VKi8lDXfZXUdA5rOpnl4n1FjlSRPnyJWnh8Akw?=
 =?us-ascii?Q?QRb6JGqqqJYOgA8Wh2xSB1Ke+oxyKoEZnSjWfPBHIuI73YAe512ttE/FryVs?=
 =?us-ascii?Q?GzLjoOHe0WYNTH5zKLlDgFNMeZIwq9P9B9j8HUR61QIMDcroUX+j6d7dXMPY?=
 =?us-ascii?Q?F4CnD9XeinFvPKeOh9CVG7EBLor3xSopFv3lqgpHWilM7o/AHR5b7iWWWJ5J?=
 =?us-ascii?Q?ZzjBXEGKh3Uw66YI2LDDykaJOXPH001QZdX+mSaR16PAC6hnlfgVIPP4c3R5?=
 =?us-ascii?Q?1Vq2fMOezORxauB5HSOyXO7Ofenfh3UL07fFFLTOAqpbUlgHacOoMGCAF8xA?=
 =?us-ascii?Q?NKlHT4TIVskjIFt3yGGpQBvX+sVJ1XE8jZiBuoBTZevxfg6ZvyUXbhTsmKqK?=
 =?us-ascii?Q?YLb3BgMgWIDvt5jnobqHJNDCztceL19y4PuJPdXpfgZikTYGooNKTmlpNzvf?=
 =?us-ascii?Q?0LHSrGKqmYv4QP3ppazKKKWybPFcNVIEVQeySi5lrviiqvZj84kCc/vf4SZv?=
 =?us-ascii?Q?ToiZfzeaV2jbCJYIMpcg3ybeKm6Mhuharu8JKk5Zjyi4GP62LiRm+kMBFWFR?=
 =?us-ascii?Q?Jy2ExhPDC+Jo81wf0WqCUtwhjW82XKUiZ6FFDWgKN8L2rMJ+3vsRFza95RC/?=
 =?us-ascii?Q?x/X66cGuUFSyW6lUCrLeKhYLCUGKp4AQPZ2A/q6w0pqzdSVQGud8PARN2uvS?=
 =?us-ascii?Q?wiSFqd9n6ooLTkW9+nhS58Oab05HugnZl3BhKGfxR3O88JYciiSW8Vr+iu9I?=
 =?us-ascii?Q?D4NI1YKqBSczfVoA4OgVJnlS3nyehCjBQNSD5ehb8QOg4t+fkqM5k0E1rTzP?=
 =?us-ascii?Q?cfSYPIHgt8pzHvYTzMSvl6TWAXO4OXmelgCnBmh9AHxI/Kdd3/GHdfky5UyJ?=
 =?us-ascii?Q?GsZstpBNZ83S2qF6KHeGDpIQYDbItqMKZWQSXSrtr3jFOAlx5NJM9kw70EH/?=
 =?us-ascii?Q?CZCDxcqRKi/6rIl/V0lSMn/m68eBS3IFVWXU2vM0VoqPHb4gJSBDSBCh9yaz?=
 =?us-ascii?Q?jcHiY/smYKDMQyGVGmSCH4KzBRstOJ7iB5tLPldAMBM80voAGfEQnxFx3uE+?=
 =?us-ascii?Q?TrESAgitmwgZFtSiXvxtWj/oW3CNufqgcNh6yBzgTM4uaRQxtTaZ6Rd+rEKh?=
 =?us-ascii?Q?H7hoqq53thjxVMl+9dSTcKgLRn+tQHfk97D29WT3RB1E4pbsPcvgnMgCuJk7?=
 =?us-ascii?Q?EjYTdequduefGbE7Fy+sqpXOaT3V/qQU+lQXOSZxgAYYb5x/ikBYsryYW743?=
 =?us-ascii?Q?4G3k7gvXgiZ9DNqB6zLQX2CDwrF1O1c76xz2IcJlVGBtmXlZF1LHn3LqgSRc?=
 =?us-ascii?Q?80Qh47nV10/q7dfzt5qXStvmPWRYwowgrQRXAqB3sk8qs1stmOb0WT3RRheX?=
 =?us-ascii?Q?es3yzzrBmgIYK76ziNFL7SAjmQ8PSGyn5gCsQOHmFrLQZJBfu0cfUTVfHszf?=
 =?us-ascii?Q?QtCBCLQv7zyOVW6DdmzcUD0xkA4Grph3FF4o5rr6r081tA7KPDSoNJtkOSKX?=
 =?us-ascii?Q?VxcbfH3LHx+YLEsz+xCka+wo44z6hKevxC3ti4J8+z70VuYwvq8niFJ7fJjS?=
 =?us-ascii?Q?/64V7LRGSHWcqJf4rLflR+DWPBHMD4aIKlvFcpt45FqSUHV9XCua?=
X-Exchange-RoutingPolicyChecked: GG0Oo1X7C4pI81Abut2qizTd89bFMVWlRogkiw1agWixexpkd7YU6d8Yn8aBWkHBYrgGarDHlirCuHRmvQy2IXXcKMt+BDLD2GEthOB/mgC2yA2xB24XHB19uAvHCTD7bLa5d7k1eZihJwN954MaV2JBWwRYMjSuGgtiY2hsMfBr4LLM4k/4y7ni7I0twW4Yp0QPtftJrp0RnzW0Bl05e4newQ5QXhmZLcjLT56HuDlVgKQuADOUucGkReAuj2gEs6b+Z5ipBIxNTTc2UEoPRppKwb1T7OXGi6EB0dszt0WKB42PL5ryeoG5cNTZW8dknNM1mGcP2w8Mx8GlALMXdg==
X-MS-Exchange-CrossTenant-Network-Message-Id: b9232cd6-570b-4a20-464d-08deab1ff520
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 03:31:27.9411 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bgqKQox3DkekBh4iQwlVkuD69H2qKnXG3ABFBa+1m/I6U63aJypbvx6wA2MObcgoNJ3m/Chrew0YL9rr3P6fmYI4xWsrEwbxvFmOJ2TN0wknZFFbQ4kZzXutTCuH83In
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8162
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

On Tue, May 05, 2026 at 04:44:20PM -0700, Umesh Nerlige Ramappa wrote:
>In a multi-queue use case, when a job is running on the secondary queue,
>the CTX_TIMESTAMP does not reflect the queues run ticks. Instead, we use
>the QUEUE TIMESTAMP to check how long the job ran. For user space to see
>the run ticks for a secondary queue, whitelist the QUEUE_TIMESTAMP
>register.
>
>Compute PR: https://github.com/intel/compute-runtime/pull/923
>
>Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

LGTM.
Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

>---
>v2: Whitelist QUEUE_TIMESTAMP only for copy and compute engines (Niranjana)
>v3: (Niranjana)
>- s/multiq/multi_queue/
>- Base the condition on multi_queue_engine_class_mask
>---
> drivers/gpu/drm/xe/xe_reg_whitelist.c | 14 ++++++++++++++
> 1 file changed, 14 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.c b/drivers/gpu/drm/xe/xe_reg_whitelist.c
>index 8cc313182968..6f96bf84df66 100644
>--- a/drivers/gpu/drm/xe/xe_reg_whitelist.c
>+++ b/drivers/gpu/drm/xe/xe_reg_whitelist.c
>@@ -9,6 +9,7 @@
> #include "regs/xe_gt_regs.h"
> #include "regs/xe_oa_regs.h"
> #include "xe_device.h"
>+#include "xe_gt.h"
> #include "xe_gt_types.h"
> #include "xe_gt_printk.h"
> #include "xe_platform_types.h"
>@@ -33,6 +34,13 @@ static bool match_has_mert(const struct xe_device *xe,
> 	return xe_device_has_mert((struct xe_device *)xe);
> }
>
>+static bool match_multi_queue_class(const struct xe_device *xe,
>+				    const struct xe_gt *gt,
>+				    const struct xe_hw_engine *hwe)
>+{
>+	return xe_gt_hwe_class_supports_multi_queue(gt, hwe->class);
>+}
>+
> static const struct xe_rtp_entry_sr register_whitelist[] = {
> 	{ XE_RTP_NAME("WaAllowPMDepthAndInvocationCountAccessFromUMD, 1408556865"),
> 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1210), ENGINE_CLASS(RENDER)),
>@@ -54,6 +62,12 @@ static const struct xe_rtp_entry_sr register_whitelist[] = {
> 				RING_FORCE_TO_NONPRIV_ACCESS_RD,
> 				XE_RTP_ACTION_FLAG(ENGINE_BASE)))
> 	},
>+	{ XE_RTP_NAME("allow_read_queue_timestamp"),
>+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3500, 3511), FUNC(match_multi_queue_class)),
>+	  XE_RTP_ACTIONS(WHITELIST(RING_QUEUE_TIMESTAMP(0),
>+				   RING_FORCE_TO_NONPRIV_ACCESS_RD,
>+				   XE_RTP_ACTION_FLAG(ENGINE_BASE)))
>+	},
> 	{ XE_RTP_NAME("16014440446"),
> 	  XE_RTP_RULES(PLATFORM(PVC)),
> 	  XE_RTP_ACTIONS(WHITELIST(XE_REG(0x4400),
>-- 
>2.51.0
>
