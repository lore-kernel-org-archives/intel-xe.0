Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6E96CDB47E
	for <intel-xe@archiver.kernel.org>; Thu, 12 Oct 2023 21:50:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5914710E55F;
	Thu, 12 Oct 2023 21:50:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFCDA10E55F
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Oct 2023 21:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697147446; x=1728683446;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ennLWyBQU42UaNQTbpP/vGJhk0DeN154t2Y/MlVSVzA=;
 b=QC+x0Ge3INzjjdE9//VzUgpnw9FFPvMyuwqt4CZ57fYPY8t/n2Wbfluw
 afzxJE+BtQqh4TTHq2V+bx2AjHJjpZUJfVzPp3rGG34Vtv1KyNgvDOmoe
 kEHhr+GwOYDlfpDpFMhFORwbjK3+gQaoXqtxN6EWUDokAvTgdZasp0uhL
 k2hnW+X8+DiIuMAQzKHZe6HUIBiwJ6iBPEVvdbIyUeEET/6OtVQphSFbm
 XPILg+sCZt0Te0FiNpnJyoEI/mjJIHJTRHUNA/engkFJVEQZpQjm0ItRo
 r9LuSGAQdBXO1OzfVeTLYhkX3uWYgYu6z+eIYX296t+rlhyI+pTnT4n3F Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="370121075"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; d="scan'208";a="370121075"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2023 14:50:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="820312336"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; d="scan'208";a="820312336"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Oct 2023 14:50:43 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 12 Oct 2023 14:50:43 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 12 Oct 2023 14:50:43 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 12 Oct 2023 14:50:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UdyMeBrcNWyTkepk891eRULzRGIywuzRdJyAXgyz0vmfUe48Byse8B9XAU8pRmqPVCCB1sSDc8Nr6WTCrZateW9xLnTnjQBqoWQn/dWW7YoJ9RtJW88ycTOeBrv2OW2+REn0lG3pobCWsO8lvOlWeafjXUnEl/fq7cppNXuaQEj1dmhaBbdBUJEvPP5DxJYvAczGBebwFQrf5t3Z7wSYB9TYj/EOQfmE5I/RcrriJ44VerAfygsJngCubUGtwWK4QeaKkzhCLO0nGuVNyf2EHDgz56TvtsCB3SSVad4MjLO+t7XQ4Wqv5dTMT++fVLbCapzHhLEVoFh8cOQCAx55Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=amaahWHbCUlYpiKG+0De/kYAgipdDAjCNcxM3U20sqo=;
 b=jmvQyXyahYfREyMNYUgQ7vL5XLIMPMS4QdI9HaC1Vej+TeuCFW8Ky47GyvQTenYvEWxDmW6ROCJSh8nzQrFocpU0HDq93JL008EXuZ49WLrqyJZ/Ky9R+eMRrUND/Wj+FYKlcpVkjXn41asFF49W1St/Pd8PhoX5UaBcjeQPnX3NW7785w19WCsFnhCj86bNCaVFIiLMdhBGG5pvcWzX6jiqDuGAepDN583i7bLvUOlvYh+XGx8nV3kISpNoA4+VYaaIwAJb6XoiOv1qe0YaFyw1kMDf9EW2tRt4yMKeZp/Qhb3LleDqqjarmrp9gF0+KVE/3y7TgYW4XV3vceLGRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by PH7PR11MB8480.namprd11.prod.outlook.com (2603:10b6:510:2fe::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.45; Thu, 12 Oct
 2023 21:50:37 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::cf65:94e6:cdd3:cfe]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::cf65:94e6:cdd3:cfe%7]) with mapi id 15.20.6863.032; Thu, 12 Oct 2023
 21:50:37 +0000
Date: Thu, 12 Oct 2023 16:50:33 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <j32fbk7zelblibppk2acbc3eh7bxel3evti4prelvnwo5srbyr@noc7cyyz75ew>
References: <20231011230957.463381-8-matthew.d.roper@intel.com>
 <20231011230957.463381-13-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20231011230957.463381-13-matthew.d.roper@intel.com>
X-ClientProxiedBy: BYAPR05CA0107.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::48) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|PH7PR11MB8480:EE_
X-MS-Office365-Filtering-Correlation-Id: fb14585f-409d-4031-5fbd-08dbcb6d44ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pbDcxUoLM8TS7/WZR7/eqo3jogglTtZtjodLAZyxBY5ppg7ysmWGiKDxRyv0KV2jLHKKqct1qkM+V0+bd9XZij+d+QaIvvvYQ0tJR5xEFlwHa1SAC3so1SrH1DPzGXoGR6J3HyV8qLFuO/9HZ0uW27OvWdzMNAuxtIPtbPZXHbD56E20YrRDaSBPI639jTVwRezLGYUEtXbrm8iXCF2yhXdQLMogJHLBVBxauj3IZDwlglLbKJ0qItvsrHI5Sumc1Mk12kdfp/IiQSj8NIeGklclfGJm2fDlg9O345cDGrLHGeqP4bDldU7ff5+uXvMn1wBbwTm9ma1OtpUPr8abqC6lYwnD1qsAMIMFU2yZResfpaRlzlX++C40zxsiUxEbel0ZwGTrpnohcIKd+UOHMRU+pGzK2t1vw9XsOXROfqFZe3S8JBfoI6eOObGWDSyyHGAOOmh0Pnh6mxnodUsW91bpC6xLvHUprnss/ZjN2LL5bVDwajBsHG2e/jG9ukX1OE0g5VlLwrRmvsuGgl7Ms8ca7XsQNczIKJnnbkPSez7a8s0+NRuLO1fC7l/2u00f
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(376002)(39860400002)(396003)(346002)(366004)(136003)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(9686003)(6512007)(478600001)(6486002)(6666004)(6506007)(26005)(83380400001)(2906002)(66476007)(66556008)(41300700001)(33716001)(5660300002)(66946007)(6636002)(4326008)(6862004)(8936002)(8676002)(316002)(38100700002)(82960400001)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NZEOqIihR1J7AyaKK76GFvv+Ugh3uxB/7u8KXZxe0mVsOG9Hw0nEyDuj7eTe?=
 =?us-ascii?Q?Y2muAhCdY4XcvXMA13vNzfKCj3yT9RJ70suQkDSkHRQgHcOsgJNXHyH1C5c/?=
 =?us-ascii?Q?N+1UMFHvLEje6sCUYKhvx18cDvfLK5Keapz/cE74266JEmPjPU7KXbbcxPI8?=
 =?us-ascii?Q?iZPwKiQk1xwyU0mxpkw+TRo1o5Lm0pG/tZKEiY0yQ543/CxHcCDtsYu5ycL9?=
 =?us-ascii?Q?WLjSbKlDeSVxU3aEkZPogcnNW8Py+2CtJjTrxYfuI5bcFkw5L1TWMsqdx7v8?=
 =?us-ascii?Q?VK8dcs5LbRt+6p4g0OuW0zD0JWajqkOkBqiOvo8koNRzkAeqRywyMmweKrZt?=
 =?us-ascii?Q?WGpS056mH4A0OaLwxc+W7YQ9uM0/fMt5iL37QsVc7fwp7zzoBS3PZ9V2BxLI?=
 =?us-ascii?Q?qodrxBikFiIKaa0ra+1i1MKUe62p8bEQBDBEjf8WlMxTSYh9rjHV1WPUGOS2?=
 =?us-ascii?Q?0SkiwQ7y1u8iNi0GkqSRjgg4SgoqWhBJ4VMqWieDGae1q8bM25Ghuf7jle1o?=
 =?us-ascii?Q?XBSo+zRYX/XKhCX1aIub16LN4aLZlkI/t9rddRzNPIBQm1a26f7cbfB9jxVM?=
 =?us-ascii?Q?jcB0ZI8BjIysWVUK5KaubKaqPhmj/yOZUGWiBN8Fc3oP8LStRJRSVezvXyiV?=
 =?us-ascii?Q?4LgZO1xycCn3Fatr9A3kRoYK/tFffpZgYkHjTjAtyDsxhaQ8wgvJPIywzak1?=
 =?us-ascii?Q?1B6gRtIjTtnArnbcSI5h/E2Vh57t8AvceHnfhKE2+KsAeKRoNMI8VZK4cHAN?=
 =?us-ascii?Q?2u4O5EP92tU662XnHtuXN0ryu6Js+XKIs+GaJaGgUX+Rn35AG1Wsdc2B7Rxe?=
 =?us-ascii?Q?ANmu0TN+b3abHgcb4OXOUUJKM5JV4nqaB/l/aN1PaYE5OVjKda1fq8a3w1rs?=
 =?us-ascii?Q?wTN13WZsI7appJ0b25aBcfPI2a3nHsDdexaVtnHYTt5KZ39aL8Bt8llxXl3n?=
 =?us-ascii?Q?AzK89vO77LW5k6a+VkcvsOyvkU6BclzIev5SCI1UZpQykSvbhSvK0JNMVOqg?=
 =?us-ascii?Q?wok2JUDULNUDwB0MwSaRpKs5Lm3voIKtSUPDcXxtLnCzd/derdHGzlDLaSji?=
 =?us-ascii?Q?z9rOvpci5dtmJDrMHjsXTKwqV6sarfaXDvnxJsjsmfeC/4gbK+lpYPC8nSgU?=
 =?us-ascii?Q?J0O161fwysrK9JdfdBr9xhuf0nb5KfajTNvPf0nElU6cKpLpJPMPmu3ZTede?=
 =?us-ascii?Q?wiHWhV4m6FT+ohh/wMEehIeehzaUtHkaSckkkQvie6vRySLEv8GEFSScK/RU?=
 =?us-ascii?Q?5F1MqdebeQsOf6wb5/kIpbQMPkiqYR75iKAHow8sc/i43++O8hRBg+AhU+UB?=
 =?us-ascii?Q?JG5b1bnKBtYyJ+aJ2EZxjY45MNq0wnICZm2nzCdxnomJwt1v4QU0t3xk1hAp?=
 =?us-ascii?Q?30/qemcJRrks/2q+OOConB6g7LZHf/WpflWMKAHgCsKKas8FHAZN8QqGXjvZ?=
 =?us-ascii?Q?XOcv4yWQBP4YFW1B5SsBUgA4v4GyAGwEAi4Jpwkr/gnkMPebcKXj8GiddUbn?=
 =?us-ascii?Q?3mhdw1e7pDv/P+1/c4pkjknW7FC9n02D6ACZG/NKTLmylv9LssX1OPgSwzF8?=
 =?us-ascii?Q?FtOiVYMtx1EjVYj4U8Gt0LctK25koobQIBkNr+Ax0aYKYd+lXzgizfAbcWgL?=
 =?us-ascii?Q?sw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fb14585f-409d-4031-5fbd-08dbcb6d44ac
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2023 21:50:36.9233 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X6aouw2oT2qjvopXqnGGZF/XuuWx1YuAadzJLVDYa9f28+PeXUySksRLiToP+ksKMFc/N21nHnfyvnurqmuYm4LWaEh6byUrKQvKBJzadQk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8480
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 5/6] drm/xe/debugfs: Add dump of default
 LRCs' MI instructions
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

On Wed, Oct 11, 2023 at 04:10:03PM -0700, Matt Roper wrote:
>For non-RCS engines, nearly all of the LRC state is composed of MI
>instructions (specifically MI_LOAD_REGISTER_IMM).  Providing a dump
>interface allows us to verify that the context image layout matches
>what's documented in the bspec, and also allows us to check whether LRC
>workarounds are being properly captured by the default state we record
>at startup.
>
>For now, the non-MI instructions found in the RCS and CCS engines will
>dump as "unknown;" parsing of those will be added in a follow-up patch.
>
>Bspec: 64993
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>---
> .../gpu/drm/xe/instructions/xe_inst_defs.h    |  1 +
> .../gpu/drm/xe/instructions/xe_mi_commands.h  |  3 +
> drivers/gpu/drm/xe/xe_gt_debugfs.c            | 41 +++++++++
> drivers/gpu/drm/xe/xe_lrc.c                   | 84 +++++++++++++++++++
> drivers/gpu/drm/xe/xe_lrc.h                   |  5 ++
> 5 files changed, 134 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/instructions/xe_inst_defs.h b/drivers/gpu/drm/xe/instructions/xe_inst_defs.h
>index c992ad767f08..d665a7e21f3b 100644
>--- a/drivers/gpu/drm/xe/instructions/xe_inst_defs.h
>+++ b/drivers/gpu/drm/xe/instructions/xe_inst_defs.h
>@@ -15,6 +15,7 @@
>  */
> #define XE_INST_CMD_TYPE		GENMASK(31, 29)
> #define   XE_INST_MI			REG_FIELD_PREP(XE_INST_CMD_TYPE, 0x0)
>+#define   XE_INST_GFXPIPE		REG_FIELD_PREP(XE_INST_CMD_TYPE, 0x3)
>
> /*
>  * Most (but not all) instructions have a "length" field in the instruction
>diff --git a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
>index 4a37b2b86b40..8cd1fc0e4f17 100644
>--- a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
>+++ b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
>@@ -30,6 +30,9 @@
> #define   MI_ARB_DISABLE		0x0
>
> #define MI_BATCH_BUFFER_END		__MI_INST(0xA)
>+#define MI_TOPOLOGY_FILTER		__MI_INST(0xD)
>+#define MI_FORCE_WAKEUP			__MI_INST(0x1D)
>+
> #define MI_STORE_DATA_IMM		__MI_INST(0x20)
> #define   MI_SDI_GGTT			REG_BIT(22)
> #define   MI_SDI_LEN_DW			GENMASK(9, 0)
>diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
>index cd6d28c7b923..e2483cb7721a 100644
>--- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
>+++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
>@@ -15,6 +15,7 @@
> #include "xe_gt_mcr.h"
> #include "xe_gt_topology.h"
> #include "xe_hw_engine.h"
>+#include "xe_lrc.h"
> #include "xe_macros.h"
> #include "xe_pat.h"
> #include "xe_reg_sr.h"
>@@ -149,6 +150,41 @@ static int pat(struct seq_file *m, void *data)
> 	return 0;
> }
>
>+static int rcs_default_lrc(struct seq_file *m, void *data) {
>+	struct drm_printer p = drm_seq_file_printer(m);
>+
>+	xe_lrc_dump_default(&p, node_to_gt(m->private), XE_ENGINE_CLASS_RENDER);
>+	return 0;
>+}
>+
>+static int ccs_default_lrc(struct seq_file *m, void *data) {
>+	struct drm_printer p = drm_seq_file_printer(m);
>+
>+	xe_lrc_dump_default(&p, node_to_gt(m->private), XE_ENGINE_CLASS_COMPUTE);
>+	return 0;
>+}
>+
>+static int bcs_default_lrc(struct seq_file *m, void *data) {
>+	struct drm_printer p = drm_seq_file_printer(m);
>+
>+	xe_lrc_dump_default(&p, node_to_gt(m->private), XE_ENGINE_CLASS_COPY);
>+	return 0;
>+}
>+
>+static int vcs_default_lrc(struct seq_file *m, void *data) {
>+	struct drm_printer p = drm_seq_file_printer(m);
>+
>+	xe_lrc_dump_default(&p, node_to_gt(m->private), XE_ENGINE_CLASS_VIDEO_DECODE);
>+	return 0;
>+}
>+
>+static int vecs_default_lrc(struct seq_file *m, void *data) {
>+	struct drm_printer p = drm_seq_file_printer(m);
>+
>+	xe_lrc_dump_default(&p, node_to_gt(m->private), XE_ENGINE_CLASS_VIDEO_ENHANCE);
>+	return 0;
>+}
>+
> static const struct drm_info_list debugfs_list[] = {
> 	{"hw_engines", hw_engines, 0},
> 	{"force_reset", force_reset, 0},
>@@ -159,6 +195,11 @@ static const struct drm_info_list debugfs_list[] = {
> 	{"register-save-restore", register_save_restore, 0},
> 	{"workarounds", workarounds, 0},
> 	{"pat", pat, 0},
>+	{"default_lrc_rcs", rcs_default_lrc},
>+	{"default_lrc_ccs", ccs_default_lrc},
>+	{"default_lrc_bcs", bcs_default_lrc},
>+	{"default_lrc_vcs", vcs_default_lrc},
>+	{"default_lrc_vecs", vecs_default_lrc},
> };
>
> void xe_gt_debugfs_register(struct xe_gt *gt)
>diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
>index a04867131839..825b229212ae 100644
>--- a/drivers/gpu/drm/xe/xe_lrc.c
>+++ b/drivers/gpu/drm/xe/xe_lrc.c
>@@ -6,6 +6,7 @@
> #include "xe_lrc.h"
>
> #include "instructions/xe_mi_commands.h"
>+#include "instructions/xe_gfxpipe_commands.h"
> #include "regs/xe_engine_regs.h"
> #include "regs/xe_gpu_commands.h"
> #include "regs/xe_gt_regs.h"
>@@ -903,3 +904,86 @@ struct iosys_map xe_lrc_parallel_map(struct xe_lrc *lrc)
> {
> 	return __xe_lrc_parallel_map(lrc);
> }
>+
>+static int instr_dw(u32 cmd_header)
>+{
>+	/* Most instructions have the # of dwords (minus 2) in 7:0 */
>+	return REG_FIELD_GET(XE_INST_LEN_MASK, cmd_header) + 2;
>+}
>+
>+static int dump_mi_command(struct drm_printer *p,
>+			   struct xe_gt *gt,
>+			   u32 *dw,
>+			   int remaining_dw)
>+{
>+	u32 numdw = instr_dw(*dw);
>+	u32 opcode = REG_FIELD_GET(MI_OPCODE, *dw);

missing a warning and return if numdw > remaining_dw so we avoid reading
random memory.

>+
>+	switch (*dw & MI_OPCODE) {
>+	case MI_NOOP:
>+		int num_noop = 1;
>+		while (num_noop < remaining_dw &&
>+		       (*(++dw) & REG_GENMASK(31, 23)) == MI_NOOP)
>+			num_noop++;
>+		drm_printf(p, "MI_NOOP (%d dwords)\n", num_noop);
>+		return num_noop;
>+
>+	case MI_LOAD_REGISTER_IMM:
>+		drm_printf(p, "MI_LOAD_REGISTER_IMM: %d regs\n", (numdw - 1) / 2);
>+		for (int i = 1; i < numdw; i += 2)
>+			drm_printf(p, " - %#6x = %#010x\n", dw[i], dw[i + 1]);
>+		return numdw;
>+
>+	case MI_TOPOLOGY_FILTER:
>+		drm_printf(p, "MI_TOPOLOGY_FILTER\n");
>+		return 1;
>+
>+	case MI_FORCE_WAKEUP:
>+		drm_printf(p, "MI_FORCE_WAKEUP\n");
>+		return numdw;
>+
>+	case MI_BATCH_BUFFER_END:
>+		drm_printf(p, "MI_BATCH_BUFFER_END\n");
>+		return 0;
>+
>+	default:
>+		drm_printf(p, "unknown MI opcode %#x, likely %d dwords\n",
>+			   opcode, numdw);

thinking that if in addition to the decoding of the dw, we shouldn't
always print the dw itself and have the decoding as a # comment
Something like...

0x0000000 # MI_NOOP (1 dwords)
0x8800007 # MI_LOAD_REGISTER_IMM (15 regs)
  - 0x1a244 = 0xffff0048
  - 0x1a034 = 0x000000f8
...

That way we always have the raw data. Just a suggestion, up to you.


>+		return numdw;
>+	}
>+}
>+
>+void xe_lrc_dump_default(struct drm_printer *p,
>+			 struct xe_gt *gt,
>+			 enum xe_engine_class hwe_class)
>+{
>+	u32 *dw;
>+	int remaining_dw, num_dw;
>+
>+	if (!gt->default_lrc[hwe_class]) {
>+		drm_printf(p, "No default LRC for class %d\n", hwe_class);
>+		return;
>+	}
>+
>+	/* First page of LRC is a ppHWSP */

since LRC_PPHWSP_SIZE is abstract here and may not always be one page,
maybe make the comment as "Skip the beginning of LRC since it contains
the ppHWSP".

>+	dw = gt->default_lrc[hwe_class] + LRC_PPHWSP_SIZE;
>+	remaining_dw = (xe_lrc_size(gt_to_xe(gt), hwe_class) - LRC_PPHWSP_SIZE) / 4;
>+
>+	while (remaining_dw) {

maybe make this:

	while (remaining_dw > 0) {

>+		if ((*dw & XE_INST_CMD_TYPE) == XE_INST_MI) {
>+			num_dw = dump_mi_command(p, gt, dw, remaining_dw);
>+		} else {
>+			num_dw = min(instr_dw(*dw), remaining_dw);
>+			drm_printf(p, "Unknown instr <%#x> of type %#x, likely %d dwords\n",
>+				   *dw, REG_FIELD_GET(XE_INST_CMD_TYPE, *dw),
>+				   num_dw);
>+		}
>+
>+		/* 0 is returned on MI_BATCH_BUFFER_END */
>+		if (num_dw == 0)
>+			break;

maybe make MI_BATCH_BUFFER_END return remaining_dw so it "consumes the
remainder of the buffer"? Then you can remove this check

>+
>+		dw += num_dw;
>+		remaining_dw -= num_dw;

suggestion to make the while condition be > 0 so we avoid wraparounds.

Lucas De Marchi

>+	}
>+}
>diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
>index 3a6e8fc5a837..a7056eda5e0c 100644
>--- a/drivers/gpu/drm/xe/xe_lrc.h
>+++ b/drivers/gpu/drm/xe/xe_lrc.h
>@@ -7,6 +7,7 @@
>
> #include "xe_lrc_types.h"
>
>+struct drm_printer;
> struct xe_device;
> struct xe_exec_queue;
> enum xe_engine_class;
>@@ -47,4 +48,8 @@ struct iosys_map xe_lrc_parallel_map(struct xe_lrc *lrc);
>
> size_t xe_lrc_skip_size(struct xe_device *xe);
>
>+void xe_lrc_dump_default(struct drm_printer *p,
>+			 struct xe_gt *gt,
>+			 enum xe_engine_class);
>+
> #endif
>-- 
>2.41.0
>
