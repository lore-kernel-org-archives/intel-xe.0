Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8067CCDB465
	for <intel-xe@archiver.kernel.org>; Mon, 16 Oct 2023 16:11:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F5F510E1FF;
	Mon, 16 Oct 2023 16:11:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9969710E1FF
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Oct 2023 16:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697472712; x=1729008712;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=MOQTdtwQWIdcm7+Ads5EdXAComYXMm8Z3RAtbGKba14=;
 b=XkvuPP99+vDQfIj8WA4Ep+8Ms/RxTUhH5d+4My64VriwC7qUeIDNck0+
 JsUMVCh45zTEhbw7cs3IQZ4TUDcZA7G0nERR7TnSHAcgmKCL3OS9BGb1D
 UXN0o5tOpok8PhYNzVJWd69caON4FiI/ijPY9bT9qGK2iQ0HmywYv3mXc
 heEoSylc6QWsbkpkaRbwSJQNUk/DtbjGIHFKOv93AJAJNlzYWZGwz+qcH
 Cy8GxN51LRx4xOLJD3c1tUK5lYdModHhTltFQzaiCcrrcAThShhmxM/m6
 1YJsUMnhywSq3Y77J5GRMTHiMKBwlYuPmeSZU3lpZCiDgErYwDpIaaVwH w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="384441381"
X-IronPort-AV: E=Sophos;i="6.03,229,1694761200"; d="scan'208";a="384441381"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2023 09:11:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="790857604"
X-IronPort-AV: E=Sophos;i="6.03,229,1694761200"; d="scan'208";a="790857604"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Oct 2023 09:11:38 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 16 Oct 2023 09:11:37 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 16 Oct 2023 09:11:37 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 16 Oct 2023 09:11:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mAoYMo8jwdHW8NGpdiBJ8v74fGFe3Hg15wez/QcFmn34TowlO4aXQDFiF22qHoEGzpVdpqgUoR/Nt2MS8SPhmFWEkpzvsvO2CUGs0NJyXan1FUI4cxTmN9kkDYaui8K7AVsk7xIOiV+2cb03TbNED2XRFhEXB8mxsLDJlrFJ1u0ss5aCS/qN6/0P6dEEeibfROQTSYq8fE5XsdtfB6T4rSlmDjhyPEV/V8nH6Ecb0XOKaBcPDGbxFE6JcCanBBKkJLjKGoh4crWoOueqFDDBZ/7EcEiFIZqMnKKNmu25vzaFqSwcHH75UXy++uLdKKEPaEXLH9VNotsJr6XGP6dd+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ir/sfMInlbfNyRS7vj5qE/LoOWSuqXIRk4O7Jko4Hag=;
 b=k1soH7dA8i23f2uAvxwWYvyrkXXRtoaycPPDtcwIpJDhDqazutwCzkaECSoqJjpVveM0yhSVq25q2UL1mna6Mm56FSDk5Fy7Q114NiiQVvJMIH6JMmaO600isFk0KG/ddki9AGpAROY3lqqOfc4r59KzfbjlwiKP4f+f9OYzzqUFuYZ/QdVIV8eXBPSyyAcv6PrJYR9Fhc+r3zYstf8QNYYgV1wMjCe1/9eg1z7Fwk1ub1jsPXpfqbi/gIqLKyKUKfrH6i+HFjjtE865XH8eOmMaA3DsyY0TC9/NwZqBzg8Ow1DRnZj3uHBcgqV4ZrnoRnp4TpV5g+s934sG4Th4ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by BL1PR11MB5511.namprd11.prod.outlook.com (2603:10b6:208:317::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.36; Mon, 16 Oct
 2023 16:11:34 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::f345:2318:9a82:51b5]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::f345:2318:9a82:51b5%7]) with mapi id 15.20.6886.034; Mon, 16 Oct 2023
 16:11:34 +0000
Date: Mon, 16 Oct 2023 11:11:33 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <dfj6pppfltonqcd4kztyweqxtdeos6oau7mlbhpga5u5fnifsa@cp42tapsiwos>
References: <20231013220250.927876-8-matthew.d.roper@intel.com>
 <20231013220250.927876-14-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231013220250.927876-14-matthew.d.roper@intel.com>
X-ClientProxiedBy: BY5PR04CA0015.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::25) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|BL1PR11MB5511:EE_
X-MS-Office365-Filtering-Correlation-Id: 81ba96ca-15a2-451f-5df4-08dbce629142
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JsmqoAXO3VC/a9nRVpFGdQ5nZTChe8HLaYD6tZ+A6k0p7ycWR8nO6XzOy8gYcWMGJVNqjsuf1nhSYFhmimyGShFzxl1+KQP01u2S56UReVUitHvCVPohGLwsuLoi84HF1nDXtPRhvZf3WM+PNEAAbDxoFhB8mlFVspVQyymmOnrtd/sJdfwjwbY3TA1S9PRCx3SFNpxvnmwk8WX3Ry6mWiJqO8Jja0wRS0toPk+PRBEJKcy7XVRdYv4jHmT/N+rvZiO33qzXniUwj8AGyoCriSVIUO1GFXGs6xgvVUz273DYLxMWPrAOwFtabDHbhzL1hFZDA3KSt5l18MahEKCXN5Ev4Ub7quFMPQj5M38C/hF3fJdubS81vwOqZ6u6xz8MArFRCgoFSnPOI1ZgJMvNFVlRJY5eM42K1OrQa5EuIr3/5KsLMEom9ShodVaCiVDieA4Uv1jABqXz8MiYEaGlRDYoP5u8hOKqf/4F4GL3G+CZtjY1UESTjNA/hJTIYTJUVYZ2q8DtorIs+IGC21KxcOay8gBL3F01MIbvS/xZeB0I+Ue1T6eHhTF47CAXR8PP
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(376002)(39860400002)(136003)(346002)(396003)(366004)(230922051799003)(186009)(64100799003)(1800799009)(451199024)(6486002)(478600001)(66556008)(6862004)(4326008)(8936002)(41300700001)(66476007)(6636002)(8676002)(316002)(66946007)(5660300002)(6506007)(33716001)(38100700002)(82960400001)(86362001)(6512007)(9686003)(26005)(2906002)(30864003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?iCJHdNWl2Ddg60iSMzy5e6EzSlG6w98Ut12IqQ033ul1sbXX0Y4rpamXnO?=
 =?iso-8859-1?Q?oINBbDCsbQcAsVZpzPLZztbkTf+jGnLNtB0eba3pq2+tcACvw0o8jCs9n8?=
 =?iso-8859-1?Q?dDVQszTTuW2Q+xLyrr8PUJ1njbQYNBToFPHQ3K+2IhMhRMNO4+wyREjsiY?=
 =?iso-8859-1?Q?0aijaA8MSAAPvdTzd/3PHAy02Bu35V643TweI1l6hyI6u0y/2B0BG7ab4b?=
 =?iso-8859-1?Q?ewEf4wLEIgDsZgSy+gvlP0Si1SDI8NGkRlat1YjvngNrMprrWlUHVzSbMz?=
 =?iso-8859-1?Q?M5JbTuKSgZHqkpY/zXiJdlpHEqBaWZIzrhndH5/B7ZRlUSg5Xct0yb0k4H?=
 =?iso-8859-1?Q?zrLOcgrXt59xC5l7jMTUR4IMIvMDXggkJ58U2EDbHc+s3bMsstDA1EFHpi?=
 =?iso-8859-1?Q?CLHHG8sw66jPBKKJxzQO+1lUYpAH38PXu3+LfqXD8+RXN5wmT2y/dZY8ts?=
 =?iso-8859-1?Q?WUjQc5/pCXM7Zf+juRwiplVnJ8FL06Ka/eKaWiOXmUpkDrbuhlSzPXEXaR?=
 =?iso-8859-1?Q?iDEgjEpIgmA81YBxZFULk5DQFbm4D7kZw8WZL67/i1179eY0zkESoGvpEN?=
 =?iso-8859-1?Q?Vx4bPfrzoUnB7Bh4PXK47/zMl7Y6VtXkLSY+W91V16T+zjKI2NlXr/KjDY?=
 =?iso-8859-1?Q?EkUmFPGtDIOdnK0BLtkTbfmvnFcdIxqv3VLUoah4daNpf/5NoG+abmvqhS?=
 =?iso-8859-1?Q?iGlT+zPFFhtncAPA1Ww1EQw3Kg3fUons80yDO7GDxvY5ycRTpQArpMNuA/?=
 =?iso-8859-1?Q?4ISw0dBx2ar0k9hsYULg9DXTVoKwaq5BlPGEeuj0unJa/CFOV0aLEOkzkC?=
 =?iso-8859-1?Q?qdcBPhTWL+MN/CsVIqDJj8xoZyT7NLE/4OHpTVoQaVpLSRqQcnLdtcE8q4?=
 =?iso-8859-1?Q?3FALRxzikMdk1y7aZBs6udhqfMiN32KCwDdZfVUWAnBSF7DNWLGu7iS/jm?=
 =?iso-8859-1?Q?CQWS6aXSSTr4qxg10kztSdu5jxw6yQ6lGpjWU0U/fXkJ/g9tqgJSEP49Sa?=
 =?iso-8859-1?Q?ZbdqKQdjn6ba8KukTj8gmP855SaxgW55Vjkuft7NoAYWR0YlHu9rJZ9v86?=
 =?iso-8859-1?Q?Rk3e5ET0BK+ZsjkJfsm/Yo2+r8I5tp1IO7+MLq3gly63ebtqFwpf5QwM4K?=
 =?iso-8859-1?Q?SPpEWL0zuacsWdqCi809N3ChzSCqjbIdmnF7DzR1QoH1b5nBpKm2bAhoV5?=
 =?iso-8859-1?Q?hvScQnOKe7h6x0I4V4PuzHBnHM7SfqW2ejsRWWZLO4MgX5QZXQSwkMbrFo?=
 =?iso-8859-1?Q?fGdwX9LaxkgZMH1CQU26SSHe//EQOo088cJ3WhaL15ZOtlEKcegzzQbqyn?=
 =?iso-8859-1?Q?Zd7D4LP7NiEvf831wfIoDWiBxeMaYTRRPjmfK2go8ydsqBoa8gG+7JaEL7?=
 =?iso-8859-1?Q?IAYyvEdMOe6KCluh01NEd5fJ8K2vX4KMj6eJhxDJn0GGVCfpMTa1OFMfsU?=
 =?iso-8859-1?Q?nNuglYLEq53dgFo0bc7VhAWBzvVyTcuXBsaaE4hnLDLdrCt5lobHuaeBVV?=
 =?iso-8859-1?Q?2S7m4fSUBIRdnqADE8354A66z51Pb/Vk6YoguSsyRzgsbHyt8kXqrO9xzM?=
 =?iso-8859-1?Q?5LqIT4cQm577kYLXaXLc1imANXWd2rvMpx7Pral6e1IZJvKNFHfw6NgMO5?=
 =?iso-8859-1?Q?+imS/YkGj1G0jHdzjE1ZJEb6hojQcLHPkptbV14Zr/nZwTTdZoEiZ8vg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 81ba96ca-15a2-451f-5df4-08dbce629142
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2023 16:11:34.4244 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 40otDjvNe9HTcAtr6AZxIqdWp9DO/4pLq1KC/ZXMntOIkIHHBYdPVPOMLTChypYTjmgZKeWKt3lTndQfgy2WWe18v93yHcK815i69WoSWfY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5511
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 6/6] drm/xe/debugfs: Include GFXPIPE
 commands in LRC dump
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

On Fri, Oct 13, 2023 at 03:02:57PM -0700, Matt Roper wrote:
>RCS and CCS engines include several non-register gfxpipe commands in
>their LRC images.  Include these in the dump output so that we can see
>exactly what's inside the context snapshot.
>
>v2:
> - Include raw instruction header in output
> - Add 3DSTATE_AMFS_TEXTURE_POINTERS and 3DSTATE_MONOFILTER_SIZE.  The
>   first was supposed to be removed in Xe_HPG, and the second by
>   gen12, but both still show up in the RCS LRC.
>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>---
> .../drm/xe/instructions/xe_gfxpipe_commands.h | 108 ++++++++++++++++++
> drivers/gpu/drm/xe/xe_lrc.c                   | 101 ++++++++++++++++
> 2 files changed, 209 insertions(+)
> create mode 100644 drivers/gpu/drm/xe/instructions/xe_gfxpipe_commands.h
>
>diff --git a/drivers/gpu/drm/xe/instructions/xe_gfxpipe_commands.h b/drivers/gpu/drm/xe/instructions/xe_gfxpipe_commands.h
>new file mode 100644
>index 000000000000..b5fbc761265c
>--- /dev/null
>+++ b/drivers/gpu/drm/xe/instructions/xe_gfxpipe_commands.h
>@@ -0,0 +1,108 @@
>+/* SPDX-License-Identifier: MIT */
>+/*
>+ * Copyright © 2023 Intel Corporation
>+ */
>+
>+#ifndef _XE_GFXPIPE_COMMANDS_H_
>+#define _XE_GFXPIPE_COMMANDS_H_
>+
>+#include "instructions/xe_instr_defs.h"
>+
>+#define GFXPIPE_PIPELINE		REG_GENMASK(28, 27)
>+#define   PIPELINE_COMMON		REG_FIELD_PREP(GFXPIPE_PIPELINE, 0x0)
>+#define   PIPELINE_SINGLE_DW		REG_FIELD_PREP(GFXPIPE_PIPELINE, 0x1)
>+#define   PIPELINE_COMPUTE		REG_FIELD_PREP(GFXPIPE_PIPELINE, 0x2)
>+#define   PIPELINE_3D			REG_FIELD_PREP(GFXPIPE_PIPELINE, 0x3)
>+
>+#define GFXPIPE_OPCODE			REG_GENMASK(26, 24)
>+#define GFXPIPE_SUBOPCODE		REG_GENMASK(23, 16)
>+
>+#define GFXPIPE_MATCH_MASK		(XE_INSTR_CMD_TYPE | \
>+					 GFXPIPE_PIPELINE | \
>+					 GFXPIPE_OPCODE | \
>+					 GFXPIPE_SUBOPCODE)
>+
>+#define GFXPIPE_COMMON_CMD(opcode, subopcode) \
>+	(XE_INSTR_GFXPIPE | PIPELINE_COMMON | \
>+	 REG_FIELD_PREP(GFXPIPE_OPCODE, opcode) | \
>+	 REG_FIELD_PREP(GFXPIPE_SUBOPCODE, subopcode))
>+
>+#define GFXPIPE_SINGLE_DW_CMD(opcode, subopcode) \
>+	(XE_INSTR_GFXPIPE | PIPELINE_SINGLE_DW | \
>+	 REG_FIELD_PREP(GFXPIPE_OPCODE, opcode) | \
>+	 REG_FIELD_PREP(GFXPIPE_SUBOPCODE, subopcode))
>+
>+#define GFXPIPE_3D_CMD(opcode, subopcode) \
>+	(XE_INSTR_GFXPIPE | PIPELINE_3D | \
>+	 REG_FIELD_PREP(GFXPIPE_OPCODE, opcode) | \
>+	 REG_FIELD_PREP(GFXPIPE_SUBOPCODE, subopcode))
>+
>+#define GFXPIPE_COMPUTE_CMD(opcode, subopcode) \
>+	(XE_INSTR_GFXPIPE | PIPELINE_COMPUTE | \
>+	 REG_FIELD_PREP(GFXPIPE_OPCODE, opcode) | \
>+	 REG_FIELD_PREP(GFXPIPE_SUBOPCODE, subopcode))
>+
>+#define STATE_BASE_ADDRESS			GFXPIPE_COMMON_CMD(0x1, 0x1)
>+#define STATE_SIP				GFXPIPE_COMMON_CMD(0x1, 0x2)
>+#define GPGPU_CSR_BASE_ADDRESS			GFXPIPE_COMMON_CMD(0x1, 0x4)
>+#define STATE_COMPUTE_MODE			GFXPIPE_COMMON_CMD(0x1, 0x5)
>+#define CMD_3DSTATE_BTD				GFXPIPE_COMMON_CMD(0x1, 0x6)
>+
>+#define CMD_3DSTATE_VF_STATISTICS		GFXPIPE_SINGLE_DW_CMD(0x0, 0xB)
>+
>+#define PIPELINE_SELECT				GFXPIPE_SINGLE_DW_CMD(0x1, 0x4)
>+
>+#define CMD_3DSTATE_CLEAR_PARAMS		GFXPIPE_3D_CMD(0x0, 0x4)
>+#define CMD_3DSTATE_DEPTH_BUFFER		GFXPIPE_3D_CMD(0x0, 0x5)
>+#define CMD_3DSTATE_STENCIL_BUFFER		GFXPIPE_3D_CMD(0x0, 0x6)
>+#define CMD_3DSTATE_HIER_DEPTH_BUFFER		GFXPIPE_3D_CMD(0x0, 0x7)
>+#define CMD_3DSTATE_VERTEX_BUFFERS		GFXPIPE_3D_CMD(0x0, 0x8)
>+#define CMD_3DSTATE_INDEX_BUFFER		GFXPIPE_3D_CMD(0x0, 0xA)
>+#define CMD_3DSTATE_VF				GFXPIPE_3D_CMD(0x0, 0xC)
>+#define CMD_3DSTATE_CC_STATE_POINTERS		GFXPIPE_3D_CMD(0x0, 0xE)
>+#define CMD_3DSTATE_WM				GFXPIPE_3D_CMD(0x0, 0x14)
>+#define CMD_3DSTATE_SAMPLE_MASK			GFXPIPE_3D_CMD(0x0, 0x18)
>+#define CMD_3DSTATE_SBE				GFXPIPE_3D_CMD(0x0, 0x1F)
>+#define CMD_3DSTATE_PS				GFXPIPE_3D_CMD(0x0, 0x20)
>+#define CMD_3DSTATE_CPS_POINTERS		GFXPIPE_3D_CMD(0x0, 0x22)
>+#define CMD_3DSTATE_VIEWPORT_STATE_POINTERS_CC	GFXPIPE_3D_CMD(0x0, 0x23)
>+#define CMD_3DSTATE_BLEND_STATE_POINTERS	GFXPIPE_3D_CMD(0x0, 0x24)
>+#define CMD_3DSTATE_BINDING_TABLE_POINTERS_PS	GFXPIPE_3D_CMD(0x0, 0x2A)
>+#define CMD_3DSTATE_SAMPLER_STATE_POINTERS_PS	GFXPIPE_3D_CMD(0x0, 0x2F)
>+#define CMD_3DSTATE_VF_INSTANCING		GFXPIPE_3D_CMD(0x0, 0x49)
>+#define CMD_3DSTATE_VF_TOPOLOGY			GFXPIPE_3D_CMD(0x0, 0x4B)
>+#define CMD_3DSTATE_WM_CHROMAKEY		GFXPIPE_3D_CMD(0x0, 0x4C)
>+#define CMD_3DSTATE_PS_BLEND			GFXPIPE_3D_CMD(0x0, 0x4D)
>+#define CMD_3DSTATE_WM_DEPTH_STENCIL		GFXPIPE_3D_CMD(0x0, 0x4E)
>+#define CMD_3DSTATE_PS_EXTRA			GFXPIPE_3D_CMD(0x0, 0x4F)
>+#define CMD_3DSTATE_SBE_SWIZ			GFXPIPE_3D_CMD(0x0, 0x51)
>+#define CMD_3DSTATE_VFG				GFXPIPE_3D_CMD(0x0, 0x57)
>+#define CMD_3DSTATE_AMFS			GFXPIPE_3D_CMD(0x0, 0x6F)
>+#define CMD_3DSTATE_DEPTH_BOUNDS		GFXPIPE_3D_CMD(0x0, 0x71)
>+#define CMD_3DSTATE_AMFS_TEXTURE_POINTERS	GFXPIPE_3D_CMD(0x0, 0x72)
>+#define CMD_3DSTATE_CONSTANT_TS_POINTER		GFXPIPE_3D_CMD(0x0, 0x73)
>+#define CMD_3DSTATE_MESH_DISTRIB		GFXPIPE_3D_CMD(0x0, 0x78)
>+#define CMD_3DSTATE_SBE_MESH			GFXPIPE_3D_CMD(0x0, 0x82)
>+#define CMD_3DSTATE_CPSIZE_CONTROL_BUFFER	GFXPIPE_3D_CMD(0x0, 0x83)
>+
>+#define CMD_3DSTATE_CHROMA_KEY			GFXPIPE_3D_CMD(0x1, 0x4)
>+#define CMD_3DSTATE_POLY_STIPPLE_OFFSET		GFXPIPE_3D_CMD(0x1, 0x6)
>+#define CMD_3DSTATE_POLY_STIPPLE_PATTERN	GFXPIPE_3D_CMD(0x1, 0x7)
>+#define CMD_3DSTATE_LINE_STIPPLE		GFXPIPE_3D_CMD(0x1, 0x8)
>+#define CMD_3DSTATE_AA_LINE_PARAMETERS		GFXPIPE_3D_CMD(0x1, 0xA)
>+#define CMD_3DSTATE_MONOFILTER_SIZE		GFXPIPE_3D_CMD(0x1, 0x11)
>+#define CMD_3DSTATE_PUSH_CONSTANT_ALLOC_VS	GFXPIPE_3D_CMD(0x1, 0x12)
>+#define CMD_3DSTATE_PUSH_CONSTANT_ALLOC_HS	GFXPIPE_3D_CMD(0x1, 0x13)
>+#define CMD_3DSTATE_PUSH_CONSTANT_ALLOC_DS	GFXPIPE_3D_CMD(0x1, 0x14)
>+#define CMD_3DSTATE_PUSH_CONSTANT_ALLOC_GS	GFXPIPE_3D_CMD(0x1, 0x15)
>+#define CMD_3DSTATE_PUSH_CONSTANT_ALLOC_PS	GFXPIPE_3D_CMD(0x1, 0x16)
>+#define CMD_3DSTATE_SO_DECL_LIST		GFXPIPE_3D_CMD(0x1, 0x17)
>+#define   CMD_3DSTATE_SO_DECL_LIST_DW_LEN	REG_GENMASK(8, 0)
>+#define CMD_3DSTATE_BINDING_TABLE_POOL_ALLOC	GFXPIPE_3D_CMD(0x1, 0x19)
>+#define CMD_3DSTATE_SAMPLE_PATTERN		GFXPIPE_3D_CMD(0x1, 0x1C)
>+#define CMD_3DSTATE_3D_MODE			GFXPIPE_3D_CMD(0x1, 0x1E)
>+#define CMD_3DSTATE_SUBSLICE_HASH_TABLE		GFXPIPE_3D_CMD(0x1, 0x1F)
>+#define CMD_3DSTATE_SLICE_TABLE_STATE_POINTERS	GFXPIPE_3D_CMD(0x1, 0x20)
>+#define CMD_3DSTATE_PTBR_TILE_PASS_INFO		GFXPIPE_3D_CMD(0x1, 0x22)
>+
>+#endif
>diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
>index 38e98c54464b..58e5844ba4e3 100644
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
>@@ -907,6 +908,15 @@ struct iosys_map xe_lrc_parallel_map(struct xe_lrc *lrc)
>
> static int instr_dw(u32 cmd_header)
> {
>+	/* GFXPIPE "SINGLE_DW" opcodes are a single dword */
>+	if ((cmd_header & (XE_INSTR_CMD_TYPE | GFXPIPE_PIPELINE)) ==
>+	    GFXPIPE_SINGLE_DW_CMD(0, 0))
>+		return 1;
>+
>+	/* 3DSTATE_SO_DECL_LIST has a 9-bit dword length rather than 8 */
>+	if ((cmd_header & GFXPIPE_MATCH_MASK) == CMD_3DSTATE_SO_DECL_LIST)
>+		return REG_FIELD_GET(CMD_3DSTATE_SO_DECL_LIST_DW_LEN, cmd_header) + 2;
>+
> 	/* Most instructions have the # of dwords (minus 2) in 7:0 */
> 	return REG_FIELD_GET(XE_INSTR_LEN_MASK, cmd_header) + 2;
> }
>@@ -967,6 +977,95 @@ static int dump_mi_command(struct drm_printer *p,
> 	}
> }
>
>+static int dump_gfxpipe_command(struct drm_printer *p,
>+				struct xe_gt *gt,
>+				u32 *dw,
>+				int remaining_dw)
>+{
>+	u32 numdw = instr_dw(*dw);
>+	u32 pipeline = REG_FIELD_GET(GFXPIPE_PIPELINE, *dw);
>+	u32 opcode = REG_FIELD_GET(GFXPIPE_OPCODE, *dw);
>+	u32 subopcode = REG_FIELD_GET(GFXPIPE_SUBOPCODE, *dw);
>+
>+	switch (*dw & GFXPIPE_MATCH_MASK) {
>+#define MATCH(cmd) \
>+	case cmd: \
>+		drm_printf(p, "[%#010x] " #cmd " (%d dwords)\n", *dw, numdw); \
>+		return numdw
>+#define MATCH3D(cmd) \
>+	case CMD_##cmd: \
>+		drm_printf(p, "[%#010x] " #cmd " (%d dwords)\n", *dw, numdw); \
>+		return numdw
>+
>+	MATCH(STATE_BASE_ADDRESS);
>+	MATCH(STATE_SIP);
>+	MATCH(GPGPU_CSR_BASE_ADDRESS);
>+	MATCH(STATE_COMPUTE_MODE);
>+	MATCH3D(3DSTATE_BTD);
>+
>+	MATCH3D(3DSTATE_VF_STATISTICS);
>+
>+	MATCH(PIPELINE_SELECT);
>+
>+	MATCH3D(3DSTATE_CLEAR_PARAMS);
>+	MATCH3D(3DSTATE_DEPTH_BUFFER);
>+	MATCH3D(3DSTATE_STENCIL_BUFFER);
>+	MATCH3D(3DSTATE_HIER_DEPTH_BUFFER);
>+	MATCH3D(3DSTATE_VERTEX_BUFFERS);
>+	MATCH3D(3DSTATE_INDEX_BUFFER);
>+	MATCH3D(3DSTATE_VF);
>+	MATCH3D(3DSTATE_CC_STATE_POINTERS);
>+	MATCH3D(3DSTATE_WM);
>+	MATCH3D(3DSTATE_SAMPLE_MASK);
>+	MATCH3D(3DSTATE_SBE);
>+	MATCH3D(3DSTATE_PS);
>+	MATCH3D(3DSTATE_CPS_POINTERS);
>+	MATCH3D(3DSTATE_VIEWPORT_STATE_POINTERS_CC);
>+	MATCH3D(3DSTATE_BLEND_STATE_POINTERS);
>+	MATCH3D(3DSTATE_BINDING_TABLE_POINTERS_PS);
>+	MATCH3D(3DSTATE_SAMPLER_STATE_POINTERS_PS);
>+	MATCH3D(3DSTATE_VF_INSTANCING);
>+	MATCH3D(3DSTATE_VF_TOPOLOGY);
>+	MATCH3D(3DSTATE_WM_CHROMAKEY);
>+	MATCH3D(3DSTATE_PS_BLEND);
>+	MATCH3D(3DSTATE_WM_DEPTH_STENCIL);
>+	MATCH3D(3DSTATE_PS_EXTRA);
>+	MATCH3D(3DSTATE_SBE_SWIZ);
>+	MATCH3D(3DSTATE_VFG);
>+	MATCH3D(3DSTATE_AMFS);
>+	MATCH3D(3DSTATE_DEPTH_BOUNDS);
>+	MATCH3D(3DSTATE_AMFS_TEXTURE_POINTERS);
>+	MATCH3D(3DSTATE_CONSTANT_TS_POINTER);
>+	MATCH3D(3DSTATE_MESH_DISTRIB);
>+	MATCH3D(3DSTATE_SBE_MESH);
>+	MATCH3D(3DSTATE_CPSIZE_CONTROL_BUFFER);
>+
>+	MATCH3D(3DSTATE_CHROMA_KEY);
>+	MATCH3D(3DSTATE_POLY_STIPPLE_OFFSET);
>+	MATCH3D(3DSTATE_POLY_STIPPLE_PATTERN);
>+	MATCH3D(3DSTATE_LINE_STIPPLE);
>+	MATCH3D(3DSTATE_AA_LINE_PARAMETERS);
>+	MATCH3D(3DSTATE_MONOFILTER_SIZE);
>+	MATCH3D(3DSTATE_PUSH_CONSTANT_ALLOC_VS);
>+	MATCH3D(3DSTATE_PUSH_CONSTANT_ALLOC_HS);
>+	MATCH3D(3DSTATE_PUSH_CONSTANT_ALLOC_DS);
>+	MATCH3D(3DSTATE_PUSH_CONSTANT_ALLOC_GS);
>+	MATCH3D(3DSTATE_PUSH_CONSTANT_ALLOC_PS);
>+	MATCH3D(3DSTATE_SO_DECL_LIST);
>+	MATCH3D(3DSTATE_BINDING_TABLE_POOL_ALLOC);
>+	MATCH3D(3DSTATE_SAMPLE_PATTERN);
>+	MATCH3D(3DSTATE_3D_MODE);
>+	MATCH3D(3DSTATE_SUBSLICE_HASH_TABLE);
>+	MATCH3D(3DSTATE_SLICE_TABLE_STATE_POINTERS);
>+	MATCH3D(3DSTATE_PTBR_TILE_PASS_INFO);
>+
>+	default:
>+		drm_printf(p, "[%#010x] unknown GFXPIPE command (pipeline=%#x, opcode=%#x, subopcode=%#x), likely %d dwords\n",
>+			   *dw, pipeline, opcode, subopcode, numdw);
>+		return numdw;

like you did in the other patch, we should also protect this from having
numdw > remaining_dw. Particulrly because instr_dw will guess the number
of dw... it could be something different like in 3DSTATE_SO_DECL_LIST.

other than that,
	
	Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>+	}
>+}
>+
> void xe_lrc_dump_default(struct drm_printer *p,
> 			 struct xe_gt *gt,
> 			 enum xe_engine_class hwe_class)
>@@ -989,6 +1088,8 @@ void xe_lrc_dump_default(struct drm_printer *p,
> 	while (remaining_dw > 0) {
> 		if ((*dw & XE_INSTR_CMD_TYPE) == XE_INSTR_MI) {
> 			num_dw = dump_mi_command(p, gt, dw, remaining_dw);
>+		} else if ((*dw & XE_INSTR_CMD_TYPE) == XE_INSTR_GFXPIPE) {
>+			num_dw = dump_gfxpipe_command(p, gt, dw, remaining_dw);
> 		} else {
> 			num_dw = min(instr_dw(*dw), remaining_dw);
> 			drm_printf(p, "[%#10x] Unknown instruction of type %#x, likely %d dwords\n",
>-- 
>2.41.0
>
