Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AC39CD6E57
	for <intel-xe@archiver.kernel.org>; Wed,  3 Jun 2026 15:01:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0887B113A47;
	Wed,  3 Jun 2026 15:01:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nOdX1MPO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CD2C113528
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Jun 2026 15:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780498878; x=1812034878;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=rE/yBvSDbLIRsMwtked0B3lbFhFxWUme8UGZbsccdsM=;
 b=nOdX1MPO+vG5eQuqwHocyv4HQv+a4ZqY7U4AMpFVvOq/YvSbEO7cK7DN
 YB3iLohk3sVXxMUVmTfi6M5uCgDa1VqK2HyhzQ5BNhwkn0x+ZSuucfQYv
 R9y+K3f2rEyzS1kHuTqIgrsgKTMMOAYem5qjv3FOZhhZdpyFaHtEuDF3l
 HsXM/m/CDC3drJkdSThWUzVN1p8Ju2a0tHB9n3xnT83q1lTVDSNOhg3aW
 1zJ5amyDot5wm1po0vIBpOvlTzq1DSjOYPT6YgAEhMCvb37Uj8REFRsup
 lfG3Xz4KKYW81GLZQMwuXHnPGFbetg7IsUS6rbiHmG1g39PFYLNB9F8rN w==;
X-CSE-ConnectionGUID: vIToa1UeSGyRO6nSwIRMuA==
X-CSE-MsgGUID: or6momwEQJez64/0b5CxjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11806"; a="83889305"
X-IronPort-AV: E=Sophos;i="6.24,185,1774335600"; d="scan'208";a="83889305"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2026 08:01:17 -0700
X-CSE-ConnectionGUID: sjMlN7buRzGP2EGsAd91QQ==
X-CSE-MsgGUID: wJ1XyfplT32NjEyHslkWOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,185,1774335600"; d="scan'208";a="243200244"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2026 08:01:18 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 3 Jun 2026 08:01:16 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 3 Jun 2026 08:01:16 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.19) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 3 Jun 2026 08:01:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YB49wPw7JYGD0VrHjLZWgCumZTUuVuBh5jtVA46GAYxpCTwPJUnW70/gcyC7HrvaHLCeFph8yQgynsmMbfRo2X601pY15SnNg/Bqr7FZ43N4L0dpAPPi3dPZXq5qXMuguRkxQBfDuoPRhrIswxfRDNxt7ygKEY0G2r6+ye7WdIqnFowSKhAbjihSTHP0fxpy6tdHkIrqhxJwml53cG9nfUijccsQG3Zkd05l8AkVMlgn6ZeGeo549R71HXPT691ndZoTY4hSR2fszBg7Z2Yx6gyF05Hfgg3ObAYFkFiAZin6WP4BxrS0TFqwt3zwkisIButUyf5O+ZPimwl2gEVGHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mO5nsFmN5qJ2H3xqd+7jlSPmpAdtwZExX4fh+8xMSPU=;
 b=js0VHOeQhYimuYeezofRERLEmijxHoWq42vkWhkAbh/xumUX2hOL1hmWEUFyloz/+J6UNzQGQJk7vCJIWkQgDweuCAHP0BKCFl9d+JvuAM6sVKospb+ruDeeC6Am4XW3m7M4iQsXGOYDs9KjJiXO1DQXxOdzRLE6cOxFsLlUNAv/XiEG3qyzOXpkPcMv6WBNasUgwNhnYSFwwQsdewMYx/ffgsk4fRkH4azqMQu7TPeXHuzR4S3x75xefdNKLNzX4k5hSuOWC0rmbpBskGqJZRpW++kseQPY5G82FEQd2OOGVK/o5z/CeIN4kKgjARokqF06WyS6DGYPMntxPcempg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5073.namprd11.prod.outlook.com (2603:10b6:303:92::23)
 by IA0PR11MB7955.namprd11.prod.outlook.com (2603:10b6:208:3dd::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 15:01:11 +0000
Received: from CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe]) by CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe%4]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 15:01:10 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 2/3] drm/xe/lrc: fix spurious warning when reading context
 timestamp
Date: Wed, 3 Jun 2026 11:01:01 -0400
Message-ID: <20260603150059.157355-5-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260603150059.157355-4-rodrigo.vivi@intel.com>
References: <20260603150059.157355-4-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0204.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::29) To CO1PR11MB5073.namprd11.prod.outlook.com
 (2603:10b6:303:92::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5073:EE_|IA0PR11MB7955:EE_
X-MS-Office365-Filtering-Correlation-Id: f973d3d6-962b-4e49-13a8-08dec180f2b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: j0CneFKohkKjHE79OsPdLdFT/kaCeecgAZs7jYfmdkD4BbZE0mYF7GWxSL3bLjl5m7nGk1mKYhIQMqtKxehHkvv8TFAIzSJ6/8+8F7UO0njk0GlChCsVDaseHh4O6U3DgP5e3koQ2SXKwOrKVKwVmJRxBnDTvQ5Dvh9SeF12U7xDQf7hXyhsSrvGk9yj1l1WifNl3oOYzkb122DuAxJr1tOK4LpYUOMbQtH11tqFDhAZLHwAzynqLJO8WnfwA4PN1hLvzp3z0yRNuoZWJ5BDejSkFBZAXFh8GiA1+fxFxj2zeBrdoY+PKuYOdltlK8WeQNJJslzQshBROH/K7/gky5p8eZdhnQVsx+VnhsRaTpIWa48ddGLDlm58lvZSBSwKrErjkhj5hAnD+/bHP82Uh8Bwfop/yJjilqvQ30Eoh81y6XCaZalOI4M1g+g2uhRZdKTjBYqIC5s3V7cdMB76uQhUOqHpegRUD0AS17DDfR9ZijSVfV9plAav+fzEWE4azmPyolG92amzqkUlKPfpWXSLqbi/2QT2Sq+wmk0ehvM6ffzlTXQSmv3AL5dyNnEY5kCu5YxKHZtsQ+RNrlbIOpIre5NKbDo8722vvqftuwpmVf5mi8q7kFQPIvwYm1pRTtAjfsQzv2HgsmriQp17PqA3YZp++JymCGcrvafVwgcT4ijbXQwUfMGQDpsJH17K
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5073.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(18002099003)(22082099003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mOZIcdZS690tMFeK7+0PoTheHSxAS19gfCxKmQIrDYnt9LcxqUZJM22MpShC?=
 =?us-ascii?Q?FWKVOzJM/WHIbUVT+KKCQOZSMTV0lttWoFNydHh4ud3tnXaEA7j3evLb/zjG?=
 =?us-ascii?Q?tZRYYM+y1AMAXkwQfUzdqXPGcGC/PLxNwDkDOA7Ba3bZITWsTdf1nA9xgXtg?=
 =?us-ascii?Q?Lo/4V3DblaWyI89sEaZ8NPNPataOzZg058y2A9b6qyJvx5HzJofRiAHqS3D8?=
 =?us-ascii?Q?EtUYcHzlXFEHv74tCYq+cyHJA3te8fgNFO3tWSM8ucrQHaiUiTyCubbDmoRi?=
 =?us-ascii?Q?xpTSDAyQSxgUVfCOHjI8CEhP8Pl0u58sV7CBrdeslyWkTUDZeXdU3a2suBBs?=
 =?us-ascii?Q?QrIulJ6PIXvXVEHipAhOqZv0ejPRGHZeQ8GRfIvW753o0R+2L5YwAvzf1O8y?=
 =?us-ascii?Q?nxcKL9u00Bl25+QGVFRdKYtgqn4cdu5QjE13Nt19U4daUXvqi8SaCd8Oz2P8?=
 =?us-ascii?Q?9oA/+b5ED6AccVh9wW07rz5RMoul4DUz8DmugtU1MU0Taac0E/5zfyjou0x/?=
 =?us-ascii?Q?TCG87/rke3Nw25fiVMQqRNYTEWMYXt5pNKqOKAh4nrzqpJAzEsaJAtcIu/Cq?=
 =?us-ascii?Q?HEC/EYkgI5uwpq8F8Ylw9Wo7rAaLwdaNOCaWgcbxrLCKctuJgpsV8JVfeATE?=
 =?us-ascii?Q?BDdrjPtvO1ZpnY86X5OGTQhM6hKwrlFkipygo+A6T1Iok+z2oj8keJRuPYTW?=
 =?us-ascii?Q?yIMTnY6GTTREsWi6yb7/y7uuA3/+OWJu7g3R9tIoYfAOkzm6wFaOzD/eWYM2?=
 =?us-ascii?Q?jP+XFGjug0nYvRfe2+u0MPft/Gmy/Fzt4qvVMw18w6csRBspvFnIM0a0pjm7?=
 =?us-ascii?Q?kLAQZx7ASOgv3hU+hGf5SSqJpVyk+iaZdY5Z2xE4vylV2T/ZvMcfROeSVDoa?=
 =?us-ascii?Q?FOd1K3lkuR1mk95wxMGku9h/ts79VpPsj6qiViuAGmB6pKA9jgzv5nInSGhH?=
 =?us-ascii?Q?oMpOJo/sw1TPaaTP/TMAapX2EPTWN7YlUgdZ9W4N6hqLp7uT5A9uY1BFIcuc?=
 =?us-ascii?Q?47BXsr900qlIIRQj+Oiu9E9zKeMWJGKJWENqS4fLhszUTkoAD82Je15F3pko?=
 =?us-ascii?Q?ShMom7TAYiga6T+OcmeYDRR628lEwuiJwNF9fmfImTsFm/aHej3A6myDukJ8?=
 =?us-ascii?Q?7a87+Hw3tQpH4jfQpuXREkKeItVAqP2TacwgNI2vI9kyEd4koWaLIhRvIUw/?=
 =?us-ascii?Q?Lhf0+0CojtrosUb+8IxvE12qaR4WR2wiMgxqVJ4srukqfR8Ho02EW/8DfcGA?=
 =?us-ascii?Q?m9uY8UdRwSYCbLYUPzAi99dWcn9rDrnCU8agoS8wV3pwBjdVNEBVkcXjs7iD?=
 =?us-ascii?Q?ytnPvZYVKLK9Kh5pogqRrJQXWJDUYmQE4VoZ7y5pm8TtCTKkFYjRT0P/5Yk1?=
 =?us-ascii?Q?jWPiyX8SCtT4PUH0a/WiM+f+kfCqBWSY+P45VeEODzzgJL9xsgvUm4M6dh7E?=
 =?us-ascii?Q?8MjyhE7KGD66k117AWMGJKRcT5j8EHJk2sL1A5a0sazuh6rshbkbAlvjF6qE?=
 =?us-ascii?Q?ifeLWP2XNC7Mbw+OTaeXUhfYTLshq2u8GpkCioqOUNlK0TzO0dXMlYJZaEE4?=
 =?us-ascii?Q?g4qTKb7LqAqxHdS9kNmc/yT6TLHZtrKLM4xZYKhS9mw1aPWc4tbaC3unX4Ez?=
 =?us-ascii?Q?iIwyaWFPPnSUR4SALip3G1QO7LFxei7HV1/35KZ5bsZIHc4GT/O/9IDHHvr5?=
 =?us-ascii?Q?egBsFReGyUavCJ6hlCUOusC8Js+U5VkFeTDJpDCGgRQjTSl8tIqlrqkUvKFn?=
 =?us-ascii?Q?nxjvqCGzFA=3D=3D?=
X-Exchange-RoutingPolicyChecked: dhOWxGbZlFgEH9M+iZTnvGnMta0kax3I4hrmZKPjlAPiH8Cpisjiy8CngocKiJHgwzDqRQ0LaKpcz4uUlkcuMNkxgkX8LTA6ffFJvFWHUNkAFnrIac6qF32MUmmYm/INxsxpTV0DLyqQME3mSMZuTMmyf9BdyG9+T/3oKIaux9n1D5vmHWpBkJWqvEuRyuQdABFUb5FTZeDKD102QnSZVWROaP3oMuRWuFMCStoUY9YGLdSwq6IOLdZGUjuhnPHbZJLtT4mskFZkCaNk0RYcTsKzyquHEJO2Ip2itbdWiK/J4WkhZ7jHGn27UXqTM5WNgou3kAVR2RERxmwxjlXAQw==
X-MS-Exchange-CrossTenant-Network-Message-Id: f973d3d6-962b-4e49-13a8-08dec180f2b9
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5073.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 15:01:10.7910 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7gQPQ0ElEOuHHhKzvOdCt7V+C71eHKTvI41cuRKZ8qUcR7foYMW5R6qk841JPjuVS3qx6TOHFuJJAEjjsMA3Kg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7955
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

Fixes the following warning that fires during timeout handling for
contexts running on reserved engine instances:

  xe 0000:03:00.0: [drm] Tile0: GT0: Unexpected engine class:instance 3:8 for utilization
  WARNING: at engine_id_to_hwe+0x88/0xc0 [xe]
    xe_lrc_context_timestamp+0x61/0xb0 [xe]
    guc_exec_queue_timedout_job+0x713/0x1020 [xe]

The engine lookup rejected reserved instances and returned NULL, causing
context timestamp reads to silently fall back to stale data.

Fix this by storing the hw engine pointer directly in the lrc at creation
time and using it for timestamp reads, bypassing the lookup entirely.

Assisted-by: GitHub-Copilot:claude-sonnet-4.6
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_lrc.c       | 11 +++++------
 drivers/gpu/drm/xe/xe_lrc_types.h |  3 +++
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index a4292a11391d..9b58ba19d511 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -1643,6 +1643,7 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe, struct xe_v
 
 	kref_init(&lrc->refcount);
 	lrc->gt = gt;
+	lrc->hwe = hwe;
 	lrc->replay_size = xe_gt_lrc_hang_replay_size(gt, hwe->class);
 	lrc->size = lrc_size;
 	lrc->flags = 0;
@@ -2632,12 +2633,11 @@ static struct xe_hw_engine *engine_id_to_hwe(struct xe_gt *gt, u32 engine_id)
 	return hwe;
 }
 
-static int get_ctx_timestamp(struct xe_lrc *lrc, u32 engine_id, u64 *reg_ctx_ts)
+static int get_ctx_timestamp(struct xe_lrc *lrc, u64 *reg_ctx_ts)
 {
-	struct xe_hw_engine *hwe;
+	struct xe_hw_engine *hwe = lrc->hwe;
 	u64 val;
 
-	hwe = engine_id_to_hwe(lrc->gt, engine_id);
 	if (!hwe)
 		return -1;
 
@@ -2688,8 +2688,7 @@ static u64 xe_lrc_multi_queue_timestamp(struct xe_lrc *lrc)
 	if (!context_active(primary_lrc))
 		return xe_lrc_queue_timestamp(lrc);
 
-	/* WA BB populates engine id in PPHWSP of primary context only */
-	hwe = engine_id_to_hwe(primary_lrc->gt, xe_lrc_engine_id(primary_lrc));
+	hwe = primary_lrc->hwe;
 	if (!hwe)
 		return xe_lrc_queue_timestamp(lrc);
 
@@ -2726,7 +2725,7 @@ static u64 xe_lrc_context_timestamp(struct xe_lrc *lrc)
 		return xe_lrc_ctx_timestamp(lrc);
 
 	if (context_active(lrc) &&
-	    !get_ctx_timestamp(lrc, xe_lrc_engine_id(lrc), &reg_ts))
+	    !get_ctx_timestamp(lrc, &reg_ts))
 		new_ts = reg_ts;
 
 	/*
diff --git a/drivers/gpu/drm/xe/xe_lrc_types.h b/drivers/gpu/drm/xe/xe_lrc_types.h
index 53ef48feebfc..6ce57b06ef1f 100644
--- a/drivers/gpu/drm/xe/xe_lrc_types.h
+++ b/drivers/gpu/drm/xe/xe_lrc_types.h
@@ -37,6 +37,9 @@ struct xe_lrc {
 	/** @gt: gt which this LRC belongs to */
 	struct xe_gt *gt;
 
+	/** @hwe: hw engine this LRC is bound to */
+	struct xe_hw_engine *hwe;
+
 	/** @flags: LRC flags */
 #define XE_LRC_FLAG_INDIRECT_CTX		0x1
 #define XE_LRC_FLAG_INDIRECT_RING_STATE		0x2
-- 
2.54.0

