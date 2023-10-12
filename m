Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8400CDB474
	for <intel-xe@archiver.kernel.org>; Thu, 12 Oct 2023 21:17:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B02310E05A;
	Thu, 12 Oct 2023 21:17:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F06810E05A
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Oct 2023 21:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697145468; x=1728681468;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=PkcsU9275jBibezuherAEmZ+U547u2YFOO4K8GGNEXI=;
 b=LroPgevjZrt2cmDCG0YyWZcu3MzQHovpQl19wUQY2i9pb7VgN74AeF01
 3fPdvV0qnFA2qPXPw5sJvPmTxZb/1GBohuD7mOQ2TkYdl1+YvsjPDA0Gt
 /H85s1jt+wIj3dgOQLkede8afKo2+fwiPPbD5EvK7xTt7oLty7pk772BV
 Y8Q1C0N1fpCaMw15u8XYPmxYP/+/r9HsvQO554qnJ6hGfDXvzqRM/og9C
 xed5AGL5dkDDMr2JH7Fpy1+OdDTGiISi0nt/2ZZ4JROO9zP8T++X9csMs
 20MphHoQag6R35AKDCKdj69qbQZh+OKGCTK1OXOvi3/euiGhTkI5aL0BU w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="3633938"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; 
   d="scan'208";a="3633938"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2023 14:17:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="928150420"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; d="scan'208";a="928150420"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Oct 2023 14:17:45 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 12 Oct 2023 14:17:45 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 12 Oct 2023 14:17:45 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 12 Oct 2023 14:17:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O8C10iIXknZqs9us5HFLkqyMp47+dkBK01pR5YQClmhcfzg6I88KGxDKxujvSpoWkzA0cuQLIl8SXvyEO1/sQdMCEYobJTEsZMb/gmoUz2D7jfRfKp9xU9r4Fh1woJx62IBWy6bEEnefIultUVOGqdDHn6txi40zQBztcd414jBR+e7CVBjJI7pHDa3oWTz7LdkqyDMbfFeoqH7+ewu25rFzpQziGV15RVnzg8c1voTs9nrKnB1VW/68AtHe+XZV6eCjlQ+7nma/yP8cuCY1UTyj1jsNBkeyBBdaKaavboTfRaBRkZOdkquVi2QwZe5gjnAqzrF3ox/Bc0W7TwRs1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=biSTmmD96BMceLsV3axfmZFc2PCThcgDQ9USG40vBYk=;
 b=mlFbJ8tS2g+K9FKOmEtoEWS4cctlna0ActQAlhDIGaktVSZdp0IJqv4rFUHTUMOut9K12RCLX+QEZ4UbPAGmdFhf7sio+JqzV/BfKWAR91t4pDCJEW+QB/YX3ypYshnl2+eA6+E9j6SQWhJTnfsMyYuOa3o6Fn1gwt7e2godXwBxOd1WyBk1vIogLIPVJnw+OXg9pErfe8Tq1RfiAcY3ZpbZwaBHB03nwi9uj54GsHh/ZweNw+GWOfDRCBl3blaH8d3vA+ZEqbYziW1Qrznpx1W89EBi9isIMXagMifrH3QfI+/H2kzwuH7UCqFZ6KBjqX38msRX374T4zhE9ZO44Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by DS0PR11MB7216.namprd11.prod.outlook.com (2603:10b6:8:11c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.45; Thu, 12 Oct
 2023 21:17:42 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::cf65:94e6:cdd3:cfe]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::cf65:94e6:cdd3:cfe%7]) with mapi id 15.20.6863.032; Thu, 12 Oct 2023
 21:17:42 +0000
Date: Thu, 12 Oct 2023 16:17:38 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <6kx4fkwoj6r4dltz4bwykyuzqvv2sa6s4rafj6vcbjxlulxrwf@huw6hymnx5kr>
References: <20231011230957.463381-8-matthew.d.roper@intel.com>
 <20231011230957.463381-12-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231011230957.463381-12-matthew.d.roper@intel.com>
X-ClientProxiedBy: BY3PR10CA0003.namprd10.prod.outlook.com
 (2603:10b6:a03:255::8) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|DS0PR11MB7216:EE_
X-MS-Office365-Filtering-Correlation-Id: 554a2253-442b-4254-8e01-08dbcb68ab00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YYU5J9FaG8jOxhE3YZld/XmhRdO/MC8fTwV/nEOd0LOe2Zor+GQFllxe7y5CScpa+nGtOb8PXMUkj2TpQ3jYRe5iAfjJ2WwMumVA+mHY8Lxgdmvg0UI7NncPVf9+qZvrSx1YrphkMJLc/BuNBC+1IFZNzQs2CW9xo0Rqqh0+Uyg+RpKmdU6VuMzpmfBuh0H64Hz0Z3etef8fZhvJYexPVpfL4oarrNKuy6eA6GRAAXmlwQNvF4UyYPd0bXO2klnNvWIlbRbECIeydkp4PQ4YfdlxfdD+5A2dnaGxt4YeXLrgpZqsNfLG6a1I0oD6XRSDk+JipQgR3Ze7gwdfNdOUXlDvdUri+RnwSyrdIZu9WsHiep2iGSFSrNwk+JdcTT10E7WfVJNleOE6sHoZExMsqVGWwL6cBxrgUj3qPMiccQVqq4ry3MjUJk4TirO5GMjwyZNf36e2Dh54lIzdS2MNn0ABG9ErN3DWzg+pxYc+F0rkZL+8ftyp0+BpniW6IDE2I45FqpCepR90SaA0FWME1SIjSjRuadTwWg/1TdtE6ySlA+9JHgmTfTFl1LsxaE1e
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(39860400002)(136003)(396003)(346002)(366004)(376002)(230922051799003)(1800799009)(451199024)(64100799003)(186009)(6666004)(33716001)(2906002)(6486002)(478600001)(6862004)(41300700001)(4326008)(8676002)(8936002)(5660300002)(66556008)(66476007)(66946007)(316002)(6636002)(83380400001)(26005)(82960400001)(6506007)(6512007)(9686003)(38100700002)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?yPJ3lWngGx/JtQlXcGqcdbhD+FQ1DQqfNQhk/ZNUU8XSsA3jx93K+NLDWl?=
 =?iso-8859-1?Q?Swv37ggzufmMNvPCt8Qef9Uz0wR15ZcvZHIMUhSTD1ikio4G0HLgmuiC4m?=
 =?iso-8859-1?Q?9jtB5dPeU3Gc0yPd0i/aifHXFi5E/3QR1AlBKttCYy5YUsXXxVfKb8Db3K?=
 =?iso-8859-1?Q?lUSnZEf4BoKmtQ1vPELj1UyvmJh9kbqD5v3UgOipyyHoGZ8cvReB3LV9ps?=
 =?iso-8859-1?Q?56Xbe6JUfFXecyuiPhrbuIcE+O7HoZ06Xb0zO+78kRKB8rUrL2W1uGmBdp?=
 =?iso-8859-1?Q?hSfvNoiTJ2mwUNM0VEtJLUCd/fKEXB49U31L4hxuZ4I8qtnNHmRO8qstwn?=
 =?iso-8859-1?Q?k9zutHUYtpES/Y17Tt3yPTgOjogY7Agqf5qlaZDJw+M7x/oqKKa29nCuJh?=
 =?iso-8859-1?Q?BO2ZSq2Ctyjxc0ErNNin42jyhgY2DwJzOLomnChHOC7r/4qylqvz+J0ZmT?=
 =?iso-8859-1?Q?qPbPO5+2i5rLtZaODEPuXrG5DpkENPbomn/Tfc74usoAcxCzYDWCMgmou6?=
 =?iso-8859-1?Q?RSpRuo1tdIG6TYLNGUGGRaGe8BdnLX+XktdEy7SxIOiuwGvbx32drNO54+?=
 =?iso-8859-1?Q?41czq5CX37QaWcbNpej1a2WPuiah85WlaCCN9MJ5EyYI2oRiDh6yCmARMQ?=
 =?iso-8859-1?Q?Ckh+eeGKs2/FvLjxXgVZHOpiGgQtoLbxaWdj5kxYuzLtCVrTr8fYeLOXcH?=
 =?iso-8859-1?Q?ObD6HjI3iVRcgOahjDhp5pGFcdnt5KF8/AbdlTkMZS+6oVsHjX/NgtPn1Y?=
 =?iso-8859-1?Q?gDAgraySO4F6dNihqomEKbGvJ8vMlkD7TRCjXD/3Ao17onUUbXpbwkOASo?=
 =?iso-8859-1?Q?13utQjjP9pq2zR38uOjFzKC42js4wxTCVFfKvSDEJuazf8Os0EjjT3Jm9X?=
 =?iso-8859-1?Q?fJGIiwFG1kbU9x7lYLExlqjvqVqRij+rEIxqSfSiJ7+GC+0ThdD42znKUu?=
 =?iso-8859-1?Q?0wAQ4t2jE3/ZyqBJ0Wihqk7oRqiN/YoWdBbFCvJHCeMLax0HxmPFX7ihCs?=
 =?iso-8859-1?Q?k4EbFjhJ27YPJ4DORVd2ENXlscHje9ecrYQRwq20Q81rORNxhhFfUWkfDQ?=
 =?iso-8859-1?Q?jNb2L85SJbi+tDdnhMbhwulOzyhp2wgPq6BeVzE5fG+gVqaO5P9yHROvo7?=
 =?iso-8859-1?Q?W1mBKhLTM3xFPEAFUt4yy+ZDWnNaP61mmIHb2OQKry0yV+BWPuHEQ+dP8J?=
 =?iso-8859-1?Q?PSG2wf4ucJf4dgyX5urmDonrN261/tO6oHRGX36YuqP7IyBTW1EKkdtZtA?=
 =?iso-8859-1?Q?+Q5seyPwdsxAJNzxQBBBVB0W6G58MqWJHgf0A1WsRg98uVECJQ2k9jhmxF?=
 =?iso-8859-1?Q?lf3inlUZJJi21MEKjml687UyoXzDyYjQllktGw/IwJKcPpo70MsZV+1bGq?=
 =?iso-8859-1?Q?WXL4agZQSLDg1pBxOj7+F0Xa36gPWuFjaMRu5bc1m/U3XlCjSKhvvF59oJ?=
 =?iso-8859-1?Q?yCRWToyiEyk2C3lQ4YP84hPPqMm/LqlBNz3WSuxMeBndfc6NVVQrMSaFYL?=
 =?iso-8859-1?Q?2XXozLM03eHyFiMnY6UdPu5D4S1uE0Ueie7r8R4gwgK3n4uEc3ZqZbnIph?=
 =?iso-8859-1?Q?A+P9ybhoKdQN4QBswo4qc/C2EmtfmY1wg1vCyh+Rnz0h08J7mTfC4OMG3F?=
 =?iso-8859-1?Q?zCGwUnYWpydDdepkwVQh2lUBdj7WeBVgPlRtTZEKh0E4GVfcfGiNK2oQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 554a2253-442b-4254-8e01-08dbcb68ab00
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2023 21:17:41.3938 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y3ogi5xGBF6c609ZIw6ldX6TVM1/7rlqX4AAkpDZY6U/qm+wLXZ0B98U8Cgmval6LemaxeYHOIwri+DynvxsnrJPb9nJjrasSaHYlM50VHA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7216
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 4/6] drm/xe: Extract MI_* instructions to
 their own header
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

On Wed, Oct 11, 2023 at 04:10:02PM -0700, Matt Roper wrote:
>Extracting the common MI_* instructions that can be used with any engine
>to their own header will make it easier as we add additional engine
>instructions in upcoming patches.
>
>Also, since the majority of GPU instructions (both MI and non-MI) have
>a "length" field in bits 7:0 of the instruction header, a common define
>is added for that.  Instruction-specific length fields are still defined
>for special case instructions that have larger/smaller length fields.
>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>---
> .../gpu/drm/xe/instructions/xe_inst_defs.h    | 31 ++++++++++
> .../gpu/drm/xe/instructions/xe_mi_commands.h  | 58 +++++++++++++++++++
> drivers/gpu/drm/xe/regs/xe_gpu_commands.h     | 41 -------------
> drivers/gpu/drm/xe/xe_bb.c                    |  1 +
> drivers/gpu/drm/xe/xe_execlist.c              |  1 +
> drivers/gpu/drm/xe/xe_gt.c                    |  1 +
> drivers/gpu/drm/xe/xe_lrc.c                   |  1 +
> drivers/gpu/drm/xe/xe_migrate.c               |  1 +
> drivers/gpu/drm/xe/xe_ring_ops.c              |  3 +-
> 9 files changed, 96 insertions(+), 42 deletions(-)
> create mode 100644 drivers/gpu/drm/xe/instructions/xe_inst_defs.h
> create mode 100644 drivers/gpu/drm/xe/instructions/xe_mi_commands.h
>
>diff --git a/drivers/gpu/drm/xe/instructions/xe_inst_defs.h b/drivers/gpu/drm/xe/instructions/xe_inst_defs.h
>new file mode 100644
>index 000000000000..c992ad767f08
>--- /dev/null
>+++ b/drivers/gpu/drm/xe/instructions/xe_inst_defs.h
>@@ -0,0 +1,31 @@
>+/* SPDX-License-Identifier: MIT */
>+/*
>+ * Copyright © 2023 Intel Corporation
>+ */
>+
>+#ifndef _XE_INST_DEFS_H_
>+#define _XE_INST_DEFS_H_
>+
>+#include "compat-i915-headers/i915_reg_defs.h"

I think we want this to be xe/xe_reg_defs.h. Eventually I want to get
rid of the i915 dependency... I have a patch series for that from a few
months ago that I need to follow up on.

>+
>+/*
>+ * The first dword of any GPU instruction is the "instruction header."  Bits
>+ * 31:29 identify the general type of the command and determine how exact
>+ * opcodes and sub-opcodes will be encoded in the remaining bits.
>+ */
>+#define XE_INST_CMD_TYPE		GENMASK(31, 29)
>+#define   XE_INST_MI			REG_FIELD_PREP(XE_INST_CMD_TYPE, 0x0)

maybe because I got used to MI_INSTR(), but I think instr is a better
short name for "instruction"

>+
>+/*
>+ * Most (but not all) instructions have a "length" field in the instruction
>+ * header.  The value expected is the total number of dwords for the
>+ * instruction, minus two.
>+ *
>+ * Some instructions have length fields longer or shorter than 8 bits, but
>+ * those are rare.  This definition can be used for the common case where
>+ * the length field is from 7:0.
>+ */
>+#define XE_INST_LEN_MASK		GENMASK(7, 0)
>+#define XE_INST_NUM_DW(x)		REG_FIELD_PREP(XE_INST_LEN_MASK, (x) - 2)
>+
>+#endif
>diff --git a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
>new file mode 100644
>index 000000000000..4a37b2b86b40
>--- /dev/null
>+++ b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
>@@ -0,0 +1,58 @@
>+/* SPDX-License-Identifier: MIT */
>+/*
>+ * Copyright © 2023 Intel Corporation
>+ */
>+
>+#ifndef _XE_MI_COMMANDS_H_
>+#define _XE_MI_COMMANDS_H_
>+
>+#include "instructions/xe_inst_defs.h"
>+
>+/*
>+ * MI (Memory Interface) commands are supported by all GT engines.  They
>+ * provide general memory operations and command streamer control.  MI commands
>+ * have a command type of 0x0 (MI_COMMAND) in bits 31:29 of the instruction
>+ * header dword and a specific MI opcode in bits 28:23.
>+ */
>+
>+#define MI_OPCODE			REG_GENMASK(28, 23)
>+#define MI_SUBOPCODE			REG_GENMASK(22, 17)  /* used with MI_EXPANSION */
>+
>+#define __MI_INST(opcode) \
>+	(XE_INST_MI | REG_FIELD_PREP(MI_OPCODE, opcode))
>+
>+#define MI_NOOP				__MI_INST(0x0)
>+#define MI_USER_INTERRUPT		__MI_INST(0x2)
>+#define MI_ARB_CHECK			__MI_INST(0x5)
>+
>+#define MI_ARB_ON_OFF			__MI_INST(0x8)
>+#define   MI_ARB_ENABLE			REG_BIT(0)
>+#define   MI_ARB_DISABLE		0x0
>+
>+#define MI_BATCH_BUFFER_END		__MI_INST(0xA)
>+#define MI_STORE_DATA_IMM		__MI_INST(0x20)
>+#define   MI_SDI_GGTT			REG_BIT(22)
>+#define   MI_SDI_LEN_DW			GENMASK(9, 0)
>+#define   MI_SDI_NUM_DW(x)		REG_FIELD_PREP(MI_SDI_LEN_DW, (x) + 3 - 2)
>+#define   MI_SDI_NUM_QW(x)		(REG_FIELD_PREP(MI_SDI_LEN_DW, 2 * (x) + 3 - 2) | \
>+					 REG_BIT(21))
>+
>+#define MI_LOAD_REGISTER_IMM		__MI_INST(0x22)
>+#define   MI_LRI_LRM_CS_MMIO		REG_BIT(19)
>+#define   MI_LRI_MMIO_REMAP_EN		REG_BIT(17)
>+#define   MI_LRI_NUM_REGS(x)		XE_INST_NUM_DW(2 * (x) + 1)
>+#define   MI_LRI_FORCE_POSTED		REG_BIT(12)
>+
>+#define MI_FLUSH_DW			__MI_INST(0x26)
>+#define   MI_FLUSH_DW_STORE_INDEX	REG_BIT(21)
>+#define   MI_INVALIDATE_TLB		REG_BIT(18)
>+#define   MI_FLUSH_DW_CCS		REG_BIT(16)
>+#define   MI_FLUSH_DW_OP_STOREDW	REG_BIT(14)
>+#define   MI_FLUSH_DW_LEN_DW		REG_GENMASK(5, 0)
>+#define   MI_FLUSH_IMM_DW		REG_FIELD_PREP(MI_FLUSH_DW_LEN_DW, 4 - 2)
>+#define   MI_FLUSH_IMM_QW		REG_FIELD_PREP(MI_FLUSH_DW_LEN_DW, 5 - 2)
>+#define   MI_FLUSH_DW_USE_GTT		REG_BIT(2)
>+
>+#define MI_BATCH_BUFFER_START		__MI_INST(0x31)
>+
>+#endif
>diff --git a/drivers/gpu/drm/xe/regs/xe_gpu_commands.h b/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
>index 8c2e0da694d8..4402f72481dc 100644
>--- a/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
>+++ b/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
>@@ -8,45 +8,6 @@
>
> #include "regs/xe_reg_defs.h"
>
>-#define INSTR_CLIENT_SHIFT      29
>-#define   INSTR_MI_CLIENT       0x0
>-#define __INSTR(client) ((client) << INSTR_CLIENT_SHIFT)
>-
>-#define MI_INSTR(opcode, flags) \
>-	(__INSTR(INSTR_MI_CLIENT) | (opcode) << 23 | (flags))
>-
>-#define MI_NOOP			MI_INSTR(0, 0)
>-#define MI_USER_INTERRUPT	MI_INSTR(0x02, 0)
>-
>-#define MI_ARB_ON_OFF		MI_INSTR(0x08, 0)
>-#define   MI_ARB_ENABLE			(1<<0)
>-#define   MI_ARB_DISABLE		(0<<0)
>-
>-#define MI_BATCH_BUFFER_END	MI_INSTR(0x0a, 0)
>-#define MI_STORE_DATA_IMM	MI_INSTR(0x20, 0)
>-#define   MI_SDI_GGTT		REG_BIT(22)
>-#define   MI_SDI_NUM_DW(x)	((x) + 1)
>-#define   MI_SDI_NUM_QW(x)	(REG_BIT(21) | (2 * (x) + 1))
>-
>-#define MI_LOAD_REGISTER_IMM	MI_INSTR(0x22, 0)
>-#define   MI_LRI_LRM_CS_MMIO		REG_BIT(19)
>-#define   MI_LRI_MMIO_REMAP_EN		REG_BIT(17)
>-#define   MI_LRI_LENGTH			GENMASK(5, 0)
>-#define   MI_LRI_NUM_REGS(x)		REG_FIELD_PREP(MI_LRI_LENGTH, 2 * (x) - 1)
>-#define   MI_LRI_FORCE_POSTED		(1<<12)
>-
>-#define MI_FLUSH_DW		MI_INSTR(0x26, 0)
>-#define   MI_FLUSH_DW_STORE_INDEX	(1<<21)
>-#define   MI_INVALIDATE_TLB		(1<<18)
>-#define   MI_FLUSH_DW_CCS		(1<<16)
>-#define   MI_FLUSH_DW_OP_STOREDW	(1<<14)
>-#define   MI_FLUSH_DW_USE_GTT		(1<<2)
>-#define   MI_FLUSH_LENGTH		GENMASK(5, 0)
>-#define   MI_FLUSH_IMM_DW		REG_FIELD_PREP(MI_FLUSH_LENGTH, 2)
>-#define   MI_FLUSH_IMM_QW		REG_FIELD_PREP(MI_FLUSH_LENGTH, 3)
>-
>-#define MI_BATCH_BUFFER_START		MI_INSTR(0x31, 1)
>-
> #define XY_CTRL_SURF_COPY_BLT		((2 << 29) | (0x48 << 22) | 3)

are you planning to finish the move of other instructions out of
xe/regs? It doesn't need to be in this patch, but it'd be better to have
a follow up patch with the move.

Lucas De Marchi

> #define   SRC_ACCESS_TYPE_SHIFT		21
> #define   DST_ACCESS_TYPE_SHIFT		20
>@@ -106,6 +67,4 @@
> #define   PIPE_CONTROL_STALL_AT_SCOREBOARD		(1<<1)
> #define   PIPE_CONTROL_DEPTH_CACHE_FLUSH		(1<<0)
>
>-#define MI_ARB_CHECK            MI_INSTR(0x05, 0)
>-
> #endif
>diff --git a/drivers/gpu/drm/xe/xe_bb.c b/drivers/gpu/drm/xe/xe_bb.c
>index f871ba82bc9b..7c124475c428 100644
>--- a/drivers/gpu/drm/xe/xe_bb.c
>+++ b/drivers/gpu/drm/xe/xe_bb.c
>@@ -5,6 +5,7 @@
>
> #include "xe_bb.h"
>
>+#include "instructions/xe_mi_commands.h"
> #include "regs/xe_gpu_commands.h"
> #include "xe_device.h"
> #include "xe_exec_queue_types.h"
>diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
>index 5be7f53f023a..811b81c39002 100644
>--- a/drivers/gpu/drm/xe/xe_execlist.c
>+++ b/drivers/gpu/drm/xe/xe_execlist.c
>@@ -7,6 +7,7 @@
>
> #include <drm/drm_managed.h>
>
>+#include "instructions/xe_mi_commands.h"
> #include "regs/xe_engine_regs.h"
> #include "regs/xe_gpu_commands.h"
> #include "regs/xe_gt_regs.h"
>diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>index a42ee3b9b8c7..74e1f47bd401 100644
>--- a/drivers/gpu/drm/xe/xe_gt.c
>+++ b/drivers/gpu/drm/xe/xe_gt.c
>@@ -10,6 +10,7 @@
> #include <drm/drm_managed.h>
> #include <drm/xe_drm.h>
>
>+#include "instructions/xe_mi_commands.h"
> #include "regs/xe_gt_regs.h"
> #include "xe_assert.h"
> #include "xe_bb.h"
>diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
>index 81463bd5e490..a04867131839 100644
>--- a/drivers/gpu/drm/xe/xe_lrc.c
>+++ b/drivers/gpu/drm/xe/xe_lrc.c
>@@ -5,6 +5,7 @@
>
> #include "xe_lrc.h"
>
>+#include "instructions/xe_mi_commands.h"
> #include "regs/xe_engine_regs.h"
> #include "regs/xe_gpu_commands.h"
> #include "regs/xe_gt_regs.h"
>diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
>index 716f72ba8cd6..b4baecde60e6 100644
>--- a/drivers/gpu/drm/xe/xe_migrate.c
>+++ b/drivers/gpu/drm/xe/xe_migrate.c
>@@ -13,6 +13,7 @@
> #include <drm/xe_drm.h>
>
> #include "generated/xe_wa_oob.h"
>+#include "instructions/xe_mi_commands.h"
> #include "regs/xe_gpu_commands.h"
> #include "tests/xe_test.h"
> #include "xe_assert.h"
>diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
>index da13cc7ba6af..26936c76a479 100644
>--- a/drivers/gpu/drm/xe/xe_ring_ops.c
>+++ b/drivers/gpu/drm/xe/xe_ring_ops.c
>@@ -6,6 +6,7 @@
> #include "xe_ring_ops.h"
>
> #include "generated/xe_wa_oob.h"
>+#include "instructions/xe_mi_commands.h"
> #include "regs/xe_gpu_commands.h"
> #include "regs/xe_gt_regs.h"
> #include "regs/xe_lrc_layout.h"
>@@ -91,7 +92,7 @@ static int emit_flush_imm_ggtt(u32 addr, u32 value, bool invalidate_tlb,
>
> static int emit_bb_start(u64 batch_addr, u32 ppgtt_flag, u32 *dw, int i)
> {
>-	dw[i++] = MI_BATCH_BUFFER_START | ppgtt_flag;
>+	dw[i++] = MI_BATCH_BUFFER_START | ppgtt_flag | XE_INST_NUM_DW(3);
> 	dw[i++] = lower_32_bits(batch_addr);
> 	dw[i++] = upper_32_bits(batch_addr);
>
>-- 
>2.41.0
>
