Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA10FCD342F
	for <intel-xe@archiver.kernel.org>; Wed,  6 May 2026 03:13:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69D5C10E4D1;
	Wed,  6 May 2026 03:13:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R8wcDbEA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48B7710E4D1
 for <intel-xe@lists.freedesktop.org>; Wed,  6 May 2026 03:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778037234; x=1809573234;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ciuWfWPCj5rbwlx6VDYEIW2lrR8DwUf/IJcZyYr4GiE=;
 b=R8wcDbEAn7LF6SmxPDqHzBp70WaYuZ3SSTZYFDZaK3UeJDn3AddD/i8n
 2DTivmZmo5dz5qQtjXDilfcS2Ra/B+eWjWZ5qW8ZrpKGx58YhCRRrlCyd
 Bq0aRTY+/qE90bS6XabbvbSRRnFeIOpz7wsTCKtOlxYtuvnqNrYyPXSnO
 epmqwxKZSqpgQyZV0q1E/asMTnooIeMZb5HGuiq7wD0/4qHka9yPgREsL
 JimVbdf5shHrUA5gfLDp3019X52t5miiZ6vgRlpxqRvDWqWJX11BQq9RV
 cbK2DldTSXunp0fZQZe44gct6fmWIpHaXi1Tipub6wfzdCn2iEZUjSoq3 g==;
X-CSE-ConnectionGUID: 9bgARyCDRYyMKG2KFD0TYA==
X-CSE-MsgGUID: x94oKdZiRv2Ol8Pfz4HAew==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="82533190"
X-IronPort-AV: E=Sophos;i="6.23,218,1770624000"; d="scan'208";a="82533190"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2026 20:13:54 -0700
X-CSE-ConnectionGUID: JPkJvccaRTO8gX0Ol706SA==
X-CSE-MsgGUID: y70tZjJjSDGjqjGFXMt0nQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,218,1770624000"; d="scan'208";a="240304954"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2026 20:13:54 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 5 May 2026 20:13:53 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 5 May 2026 20:13:53 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.6) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 5 May 2026 20:13:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fIT6RisuxTB9AoGDKbF3xPSyug6VMnuCiHktgVRahS1yxrdHLOVi/iUxLcrfiYBCdUZYv/AUh5z/6AY6M4zGj5hQciS/SglkRtwbJy0cwKjJ6tIdczHcNqT/1KXg9IFcuWCUInnI8+jlVTP2LjQiWXaqP00xq+GJrq2AD4K7ymRAzFtfVwFxchs80xuvOEhCp8LlaClklYMfiwCTgjRObs4DOmbuDa53m1npcsFJBaWL38AK7tomm5aGdbmJQJoQ7TUD3iPaowZJhW5ShnNULOvqgMK8VuWk6KlM42UcBL48fWLJYs75sr2L2mgib4FmwYjB18R63+ILPtAmpOBKmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xd/OKRrbrdOD57dv5gdOydR6j6ycHHlvczt+/VKRc2I=;
 b=OR0JcuQ9VTNTW3iyWGnXJlJx4/MyfvT3MOHFjvfCYCY7SxVOD44Kin6pH8kgukxXZ99wqJt1XJJ1z6gElw0YFP0pP8YQUTUSGSgnaWkASPhDk0F9Y/xhvEPZaOibJx2uP8uri3RLOZVE5CuV2MBekuXfJ7SSz5wmKGqjVoK1uiZnpxGcp1e/iLEpG7aaMqP6kDONeEAgYYIjVB1WHf9qQXDsSOtdX646dQ3i5aL0GanrKmTjTCFsXnvPT9YKa8I2bu0df90hxxPm3IGfYJ9o8gp1+KStveyecVssNgZ+JfRqDsJYm4xEQIXxaN9xVNFuqJ1+w2ZtKJMPX60uZIhxrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by PH8PR11MB6729.namprd11.prod.outlook.com (2603:10b6:510:1c5::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Wed, 6 May
 2026 03:13:44 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%4]) with mapi id 15.20.9891.008; Wed, 6 May 2026
 03:13:44 +0000
Date: Tue, 5 May 2026 20:13:41 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.brost@intel.com>,
 <stuart.summers@intel.com>
Subject: Re: [PATCH v3 03/11] drm/xe/lrc: Refactor xe_lrc_timestamp to
 simplify logic
Message-ID: <afqx5UtkmPbR0HPU@nvishwa1-desk>
References: <20260505234408.3552147-13-umesh.nerlige.ramappa@intel.com>
 <20260505234408.3552147-16-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20260505234408.3552147-16-umesh.nerlige.ramappa@intel.com>
X-ClientProxiedBy: SJ0PR03CA0186.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::11) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|PH8PR11MB6729:EE_
X-MS-Office365-Filtering-Correlation-Id: 54860827-1360-44ce-f19f-08deab1d7b48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|56012099003|22082099003|18002099003; 
X-Microsoft-Antispam-Message-Info: vnraqV8LjILzicftNpGRj/4YzOVtfF3RdsaBjGR/kRfEC1nmy0cc0eQC5dE37Xkjpvq/7eoY47l+OL8/vNSeeBNyPMInIrA5ooyFabvfhZ3c/+vw80IWxc/mTGljEg94dSzQecnqg5ycLBP3KkqeQ6aSbW0hKrHjW89Bt1ys9sXsKWtFiM4sU8Qw+gVWgSf4C+UrtyeAj9NxQLHXGd2hw80Gz1CgOkdJKKnMup2iAoMEvVKh2sfj2IzB1uAYNdLiTus1aa8OgIW+MNb4zHVyVzwfjXPNZCzoCtClYcU0qO2iJZQL3YTl9jfhVNQ2JTYdxASBe5jTOfGdp58teDQM4/PFu1V1Sl0K2tQqe1yGm9UpvTkGWorBO8biNeyE0C0zVc2KpDap2ihauWS7Q14EJ1V6a1WNkxngDGQTjeTsT/BPgWubaQubU/9wbx1C0oVFHaMJ9khm5M36SSi+kgXK/0gMnC4yJOmE8b+v96AnE5w4XeAXqK8IMoTmpiVUqq4if+5iXv81hCXM/McPTIURkVqx6LurHKDW4N0RnTVE4nYFq3DRnBskhWUGIYGWPWfvBrKSwCxT++Lh/i71HXdC+Q2lsp0Rssox77kRhsZYWkLhstdcbQfv80rfqr9J2Uj410VS1t4tlv4FgYB2MAPlT5PmKFywEZZUJV4mzB5LCTVdJZ8uU/nK+tzA+4YFB9mi
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?o+GkG3PRPDDmmXjnnfQ0J7NXIrSuEfamUVnckWwk4mrogw4YBs5WjE9EgD2A?=
 =?us-ascii?Q?39NF3UMApHKhgoXAY7HqCVzUTLjxE45WlLiLUtyYeYCet/c7IYdhPvU+yMyb?=
 =?us-ascii?Q?G83lPtc7lz6ILmg9z2eZqVdDe/w16Er/lYVPOQuzq8eKY0OTmvrAROLrZdlx?=
 =?us-ascii?Q?my7rgMpYiMZ/Z1oBvCJ2I79pNvKQEoLuLRqKyLzetuVNf5GtQ7FaSs8fqeLs?=
 =?us-ascii?Q?RuMcqQZEQAjxCzMCeZp4t1MQHGnApRq+sQdk3SZC33SvW30B8fPMMWVP8Wto?=
 =?us-ascii?Q?OvID1AFXezcjSGrqD6i5YBPypcbYWbNpXLSDf9NGjLZyw6wgL8VslS3hlaLL?=
 =?us-ascii?Q?PWKF8sNzQFy34q7pEafkulTxtbNpmEcques0Q24LFeJI/uyv1YIj8rDeOx/W?=
 =?us-ascii?Q?4y/TtwllU/iB1MWINh60qbMIbYACvrhIzIYvkQinCV3qOtaiPRI0MMi16fV8?=
 =?us-ascii?Q?9Ib/ivrpHppB4dzYH6wmRdgppNxXbUWeZMCgFRrsAEhS4bU/xvKVrgpzxdlP?=
 =?us-ascii?Q?xOJv+JvKOwjIrRg8aBKHtLEbcNvD85F85OLeaC2pjAD8UKwih96DwpOQ5Sql?=
 =?us-ascii?Q?a1FyiIbv3W4RWmRThZlp0PEuLbk8CMBhPfW7SQ+pH59tyai1Fxs1LcZUwLmD?=
 =?us-ascii?Q?WKj0qRqlWlGygTbbGUWokNRqa/nkBa0HEgIHYPzDe/eNZFN8JYqikTbrFcKV?=
 =?us-ascii?Q?Vq7sHYD1d48KXBT/RCiCQu6aPZmHn6M5VtZeU9cI5liZCAValp4TaWYxGTlE?=
 =?us-ascii?Q?xXmPLG9G7Fi6VlfeClzG6bu3dgZHtJA5uM1DPBO3TwbB/9ZP1AXvQeTmHtYp?=
 =?us-ascii?Q?hjnr67pUlCrdzRkl/ter+qltrJzZIBWydGSz3ql08a/9tzQ424Cjk69I+haa?=
 =?us-ascii?Q?3fftRnjIc78ZVqJBTAvuWqnaS0J/2EBfZG8tLUD25+N8rtKNtSKWG9z39y8z?=
 =?us-ascii?Q?k1ADT87RBSiW1SFTwUwg+hI1UNdax/Af1KpOMydIPjeTQWGF1p4AXYyr67WV?=
 =?us-ascii?Q?lDQ1TWctHaT0J/6ECv59bXYWdFBGC8bSoJEJvHPCBzFri7F5qdmGe9B8PyhU?=
 =?us-ascii?Q?hFU9CzAxcPZiWK5RK885R8izo81rip+U967d5dRgOSq2InBWeYrdhnWFSxZ4?=
 =?us-ascii?Q?KQ7wZ5PXNCqje+4h4vkvIoCBT1RpHiQSeE8UgJsOsmKBIlmKiSNWY2AXa6bi?=
 =?us-ascii?Q?dSbKVeHScFGoihxYU/3tsJlSdwtHF7FxtGCXx9oNCzuNYWk/PeDpCRT1+zGE?=
 =?us-ascii?Q?ndeI7JTxQ7ifJRtyCyNMgHJT2N81Ezar3h+g696apmQML04RfmMOEiYDIbEU?=
 =?us-ascii?Q?sIvh75FNMiiJxclmZaFXdJl7WtV09r6zco067YopRJFAy+lOWLWgoh+SsAE8?=
 =?us-ascii?Q?ljAi2cbkzR5CsLaZJY4PTQdVR/PTFgX4atHJk76wVp0UCW6Wm6GxBuBLN1D+?=
 =?us-ascii?Q?F6HnoqwizdvQR1aZFNPhSfryW997xK+1xsHu18eRd30tsLjkiLHvwDIqYql7?=
 =?us-ascii?Q?PyE9v6bVScqwvtXx11EBXNkZRhim0XzLmrP5wJLeJUHIXlbJ9UXSOW06hvl7?=
 =?us-ascii?Q?EyzmxZUq5itGpUHI4ZKSF2ld07d1U/NeFK4RsFWLlac1WzNcT/k+TmOwXIA2?=
 =?us-ascii?Q?0Nhnw39x4TyXbioAzRNUgz+2KI4eOU6DGF9yQIm5S9FKegN3Pr3YHuDh9VL3?=
 =?us-ascii?Q?J4Xu+qJdtaBmvZTABo3ExdZ3ZzNLolFCCjtdE4KNSRZI9vHH+cTmlZCMHs4+?=
 =?us-ascii?Q?2I0LHbPXuUI2o9ZH9kXtBhVoui/WU22jHJOlmdFeQlvp4+x7nK90?=
X-Exchange-RoutingPolicyChecked: i4inaaIs2hIPjcQhldXcKo1eIxVywAm0Wf6xqZqVEeMBEtx9a2BNyLl0KcSJb5cqnEGYuI3IPgivin0m5M39h2HeUFRRSGMlJmK3ce4PPd1/9BmPIJoWjC4emZq77nIw3/pEGRDmsC8+boJpiqC+Mv+30mW50YAZm400YCuhXpxuouegEiwKs9zdiNrmFztsPzwY2VJNcOq+VTXi/psnKkgB0eNn2S4BUphAryE1129BOQCDvdGXphaxGih067faAizaQRNpjOqHCIY3O4zGCZ9cIXDYcbreVWLpSv/z29p5e1Pz8oCVmuczHpE0JpzAb5kYlnARTVC6nCu6pqQMDg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 54860827-1360-44ce-f19f-08deab1d7b48
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 03:13:44.5141 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lg37GxRBs8Jl2QYpt2az/fCDv3Q4KGzHUr+cuORUSFtaF4Ciy7KsGZaEvIuAbhPIO1MPCnvuBT4L2sk+ld4wUto42m1eUNuXJHBgf6CDTspgv7amCz2Y6PvR6jG7Ra2v
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

On Tue, May 05, 2026 at 04:44:12PM -0700, Umesh Nerlige Ramappa wrote:
>Use a context_active() helper and simplify the timestamp logic.
>
>Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>---
> drivers/gpu/drm/xe/xe_lrc.c | 35 +++++++++++++----------------------
> 1 file changed, 13 insertions(+), 22 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
>index 66682a678cc2..3b6990d68a5a 100644
>--- a/drivers/gpu/drm/xe/xe_lrc.c
>+++ b/drivers/gpu/drm/xe/xe_lrc.c
>@@ -2585,6 +2585,11 @@ static int get_ctx_timestamp(struct xe_lrc *lrc, u32 engine_id, u64 *reg_ctx_ts)
> 	return 0;
> }
>
>+static bool context_active(struct xe_lrc *lrc)
>+{
>+	return xe_lrc_ctx_timestamp(lrc) == CONTEXT_ACTIVE;
>+}
>+
> /**
>  * xe_lrc_timestamp() - Current ctx timestamp
>  * @lrc: Pointer to the lrc.
>@@ -2597,33 +2602,19 @@ static int get_ctx_timestamp(struct xe_lrc *lrc, u32 engine_id, u64 *reg_ctx_ts)
>  */
> u64 xe_lrc_timestamp(struct xe_lrc *lrc)
> {
>-	u64 lrc_ts, reg_ts, new_ts = lrc->ctx_timestamp;
>-	u32 engine_id;
>+	u64 reg_ts, new_ts = lrc->ctx_timestamp;
>
>-	lrc_ts = xe_lrc_ctx_timestamp(lrc);
> 	/* CTX_TIMESTAMP mmio read is invalid on VF, so return the LRC value */
>-	if (IS_SRIOV_VF(lrc_to_xe(lrc))) {
>-		new_ts = lrc_ts;
>-		goto done;
>-	}
>+	if (IS_SRIOV_VF(lrc_to_xe(lrc)))
>+		return xe_lrc_ctx_timestamp(lrc);
>
>-	if (lrc_ts == CONTEXT_ACTIVE) {
>-		engine_id = xe_lrc_engine_id(lrc);
>-		if (!get_ctx_timestamp(lrc, engine_id, &reg_ts))
>-			new_ts = reg_ts;
>+	if (context_active(lrc) &&
>+	    !get_ctx_timestamp(lrc, xe_lrc_engine_id(lrc), &reg_ts))
>+		new_ts = reg_ts;
>
>-		/* read lrc again to ensure context is still active */
>-		lrc_ts = xe_lrc_ctx_timestamp(lrc);
>-	}
>-
>-	/*
>-	 * If context switched out, just use the lrc_ts. Note that this needs to
>-	 * be a separate if condition.
>-	 */
>-	if (lrc_ts != CONTEXT_ACTIVE)
>-		new_ts = lrc_ts;
>+	if (!context_active(lrc))
>+		return xe_lrc_ctx_timestamp(lrc);

NIT....may be it is good to keep a comment here like the one removed above?
Either way, lgtm.
Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

>
>-done:
> 	return new_ts;
> }
>
>-- 
>2.51.0
>
