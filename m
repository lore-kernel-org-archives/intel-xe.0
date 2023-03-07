Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8EA4C678D4
	for <intel-xe@archiver.kernel.org>; Tue,  7 Mar 2023 09:06:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8364B10E387;
	Tue,  7 Mar 2023 09:06:55 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 981AD10E387
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Mar 2023 09:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678180014; x=1709716014;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=FceTaWCRM7ywBTQIz2gLM0ueW6De/vNLwWFqR0SwjFk=;
 b=Unm6kp6myCUxPHxMXElnyH+NjZGxcnlelitpDSL28KY0dhdUJm6a5tGf
 H7XOXdn2h5wzdW461aOI0HNNeRTV1efQ+5vf8xxM4PW/PBxRugI1FPIDQ
 wJIlpH8cqMLVFHN51xRAWcsybOdRUBbolE3wkGBNE79+L22CSw4TsfX7O
 T/pxfOBWB0jsemCbe0oktDekxVPhH0XgODKnixkJYiK+dXkRydDD/Mn6u
 PjVwOLInSTTmNlHPiVgUWVE6ssCxJu4PJYCG9I5ovZz5CYm/MTL+3kffU
 NU51CZIAdOFuF9aQYgJ7/qf86Rk5WdsmrHxqFjrI7jDus6ATrfSLM5/Zk w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="400625997"
X-IronPort-AV: E=Sophos;i="5.98,240,1673942400"; d="scan'208";a="400625997"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 01:06:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="708975476"
X-IronPort-AV: E=Sophos;i="5.98,240,1673942400"; d="scan'208";a="708975476"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga001.jf.intel.com with ESMTP; 07 Mar 2023 01:06:53 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 7 Mar 2023 01:06:53 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 7 Mar 2023 01:06:53 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Tue, 7 Mar 2023 01:06:53 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.106)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Tue, 7 Mar 2023 01:06:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BlXvoLCcexE/fEs7TUL+md0eLloGFYO3MPataG/Z9F5v1dqFumGWa+Nlgu6KVyz4kNXn7LBjRUIVHowe0SA20R+vi5t6M8mlW3OMSiqhhstnvM0S67zYT5QzXXd9p1isvnwj5cokzwKPVNuGNtxqMBmYYT12QV+HJd3XkBXcg3hPGU308M/TlFCB+H/Jbix8CkAEi9Qwu1lYdOGSNqkUO6BHf2F8iq4yNHa+deZzqzGlEPGP1VkX/6Davj4DNM5RrELiyGLNQc5aLpz+oCaUrXDu66eQcTEleZ0A2MpBYb5gZGbApHjbzQcTD7XcXNiO+2WszRZ1yTdaZBvUPV0/mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xF5mAmW2xJGZXz+oEUBRT2+5Y0V3Ko9vXnjtpuW9Nkc=;
 b=A+dB+wmbBk4kJmXTcyk9Dr/jIncSHKPKKp3IcXgw26YwmcZ7IKCar8xfJwu+6g/n9l+3besdaFl5wo9N4jSoC0PWKlYrB/CZfVFfXO3Pj7Q8WYJchG2HHyyqQPMqCvC4z3jAYZmWwR3z6hDfI6jKA5JQgHjD0zHKxarBx/pJk1I6SSUOgs6cHqoMV7wnfx/tMcURlOBkszTJkqQKxMx71LdthmuLgrp6vDL6gTeRN1PST8GTHB5TO9rLeib7qHlJAlpCGdQ1AfJUOvWtcYSFWOsWYvtC37P3iKVvT/2EolK63hZmJe7eMu/YDnu79tXc0zpOUSQ3xVtBJRW2upGy/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CY5PR11MB6306.namprd11.prod.outlook.com (2603:10b6:930:22::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.22; Tue, 7 Mar
 2023 09:06:45 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7bcc:b9b8:78df:1bd8]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7bcc:b9b8:78df:1bd8%9]) with mapi id 15.20.6156.029; Tue, 7 Mar 2023
 09:06:45 +0000
Date: Tue, 7 Mar 2023 01:06:43 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Message-ID: <20230307090643.z5ncdvt6vmyimosf@ldmartin-desk2.lan>
X-Patchwork-Hint: comment
References: <20230307080916.275289-1-balasubramani.vivekanandan@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230307080916.275289-1-balasubramani.vivekanandan@intel.com>
X-ClientProxiedBy: MW4P221CA0027.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::32) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CY5PR11MB6306:EE_
X-MS-Office365-Filtering-Correlation-Id: 82ae9085-a24d-4c36-0acb-08db1eeb4689
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 65/U73TkI/1zztrJv+XA3zfq7VkZSvBp+Oq+SQJ9LiVC6gjhuYm5WOanRO063EeCancKT9c0BHDBLUMVZbZJbRBPFkZnjSGILIvFcGBviF8S3Mr/H/Bb15hHxkzUqVz+7sviFJlUcNsKVTjW2UTlNFF9dhcHprEyGIJkV1+v34IVfYSPhYo8cuvSqmWAUH+UEYCKZISw5rIO4do/EFA948iPjbRh0u69yeFW0aNpU1avjsfeyrxTxrWzRAZnaFMezO2RcsBSriQ3KGp3iS1hVAMx0z22DwOj2HgndAAF49B9AdhGOqw6hsMkxfxCpsoR4VypXrbyh8kvF5zcKht0fDC6KU5ay7X9P4G9WZotDfhHlwQOggtPUl+tgELx/ACpfVSSccMtJCmMkg3nNQBchwZCl88HCJmKArIs6hPrYIs5vRUhThfZnASVxixGUZrZ5EF0vQSGJXUbXUf2gxnCCHfUwd/e3cFyzk6SJ9qaccRpON5Xe1j713XBoV5FuRHCoEOsB3Dve2Xv6bWuhcpmLff1UmT3OITguo9Hx0+v88xr/pGA1Gdif6t8HrwT7nMqx2HHMJn/SWlVZoL+LyvaRFA7f7AnLSp+/hpp1ntHInG8gqd4dzGy2jgjNU6YB4QH49rdOIFbVDWdoGN+DXZx5g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(39860400002)(366004)(396003)(346002)(376002)(136003)(451199018)(6486002)(26005)(6512007)(1076003)(107886003)(6506007)(36756003)(82960400001)(86362001)(38100700002)(9686003)(186003)(83380400001)(66556008)(66476007)(41300700001)(4326008)(8676002)(2906002)(66946007)(8936002)(6862004)(5660300002)(478600001)(316002)(6636002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gwsyzo0vt02xKIEb1yPbMspJBFXJOG/yxWeNyZXrTYc4Ps3gkeWHveCyEOdZ?=
 =?us-ascii?Q?4MsbWQGe9Dco6E5bl3S8tCj/y+X9dBl6mNZknIt+u7/CWsohBkQ+59fwVzZ1?=
 =?us-ascii?Q?NId7myOXGPIL7Uv8gXfR1eVUp9SwFjtjI9ySl6ywI/RdXY+/XQaFn0hNzj93?=
 =?us-ascii?Q?GJru7Ficw7pLCXzYQ6rBaaQ5AJOxr5cw+JwBVhjUa1ObqiqidRzlS8nx1VYQ?=
 =?us-ascii?Q?Okk6mp6kORty0CWOWTIkTZYcZDYLj8MCXci1V8bXgD7FgqABrQpkuo7yIBeI?=
 =?us-ascii?Q?GPzLZx31C7c6slVxfHFA43h4DJUWdUvU1n1vSAJ43tWGPtTIkorvECsr6bwX?=
 =?us-ascii?Q?t2fHm08/rVUE6u0A8asun7IJNzZ2/aYdvMbBzcJb2Zhc46pVF8RYNfg5WM2y?=
 =?us-ascii?Q?EhCtALzi6sbVogJoZ1NTOiR5LsmgPZjUonOLQOrXXCwhDk9FeiibFAF1vG6g?=
 =?us-ascii?Q?L0iQzFETggiVHkSfYe0FxhAfaFMqgtAQRSzJloJWo+UvpCj64nvweDpJkjs/?=
 =?us-ascii?Q?QXOAMh/SJQ17iYpsU+wbSkmCb0v3tqjnVAg4WXVVPKU3TdiXFfD2Z1iUlr4/?=
 =?us-ascii?Q?ZlB3fK0z7Wj7Y+lVoMO37a35+EMdIJx0C8vivotE8+iU1fptoW9oTC6nTKSw?=
 =?us-ascii?Q?yKx2fWMlzugKRpOrnJGXRV3xkPVlutQo0obibJ6gJgtm8jkokxy/WH7jAZwV?=
 =?us-ascii?Q?6Cp56N2MnoDxE2NvUSYUmgXSyQfJGCFxuxSD9hAXg+LrmrfpfnT9DYtdMfv+?=
 =?us-ascii?Q?neFWIl3gcr1jn6JENHt9LksCK0AsKtsIf52+pZtrk63C2UULFh/jjQyvMq7e?=
 =?us-ascii?Q?Oq/lGJfZCeMqRIQYXdU+0EelBRO/wU6x4q4QxweoIPFoDG//VWZi7iERgU5m?=
 =?us-ascii?Q?OUonG2pERgNjTxyZBooPVRei/n4X9D2kdlvxyo/yLOsyyW63E2QT5RaXOSQH?=
 =?us-ascii?Q?jhlc3F76YN+3KDI2IjGozUVW0b+JomGtgKZcnrFJUNOLyutWhrOOqanvjl6s?=
 =?us-ascii?Q?uA1zqcaPera7s6hvjRcZRwdntJW7M8tY4oaG6GkKfkmVzCueZQy8QCQLYb7f?=
 =?us-ascii?Q?AaMOyxHmJd+NM5yydDqFoatCc685ZG99qw1Mm2XDlG0N/si40f+URoDLyeCc?=
 =?us-ascii?Q?6/TJBAMcudmRscIfs3N/N1FWMWOBz8cL786CkAVW5vdynippgdrHdlhzYFu+?=
 =?us-ascii?Q?iSROtosOrAkEH6HVzBdiE5MDjuouZSpQypj4pJ9wQmSi6UNJo3xrp0MTiIMR?=
 =?us-ascii?Q?PN5KwqjGOAeXDKST5JfwlMuZXUHlGrU1+AgHQgb450vetTDj2gs+vaD/6Ksb?=
 =?us-ascii?Q?9xmvZXgiGmMFDMD/mE+W3ftHbdm5WmnnWKMSyCpgd31h0jYFQGGz0uIFF08+?=
 =?us-ascii?Q?5bXQEbJAFCv+AlF93X232q1WLksW+J8z53q6sXI+9yoWg+aXBcz/k3gnzZKZ?=
 =?us-ascii?Q?ukppKDwZAKED3ExizZgNxgDmTwEgNtGw7WPRRy5D7vtpQHSJ3Yy/PXbYJcHf?=
 =?us-ascii?Q?etePqAWT2QVotWQlp4BKtzfMu2Zxjal4C73TBAovWHKJr0kJocm2qzI4qlbK?=
 =?us-ascii?Q?dCh5KfgAVCLbWzRt+5KPVtShYapFQ488DGUJZ5+NJWQbUfp5YBBn8df9EyZ0?=
 =?us-ascii?Q?ng=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 82ae9085-a24d-4c36-0acb-08db1eeb4689
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2023 09:06:45.4465 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BL8afc5FZL0YXlT4d2lM4Skfk9qMJhBLVXzjDiTd28oBtvHYSi3yzlt2lu2nSS1TrmWZbiCxcxZspF4os8cEc0zBbVFhw/emcmO2hFkxoQ8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6306
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2] drm/xe: Skip XY_FAST_COLOR instruction on
 link copy engines
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
Cc: Matt Roper <matthew.d.roper@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Mar 07, 2023 at 01:39:16PM +0530, Balasubramani Vivekanandan wrote:
>Link copy engines doesn't support the XY_FAST_COLOR instruction.
>Currently this instruction is used only at one place to clear a ttm
>resource while migrating a BO.
>A new device_info member is created to know if a platform has link copy
>engine. If it supports, then instead of using XY_FAST_COLOR instruction,
>MEM_SET is used which is available both in main and link copy engines.
>
>BSpec: 68433
>
>Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
>---
> drivers/gpu/drm/xe/regs/xe_gpu_commands.h |  9 ++++
> drivers/gpu/drm/xe/xe_device_types.h      |  2 +
> drivers/gpu/drm/xe/xe_migrate.c           | 65 ++++++++++++++++-------
> drivers/gpu/drm/xe/xe_pci.c               |  4 ++
> 4 files changed, 60 insertions(+), 20 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/regs/xe_gpu_commands.h b/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
>index 288576035ce3..df9ed4fbf2bf 100644
>--- a/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
>+++ b/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
>@@ -6,6 +6,8 @@
> #ifndef _XE_GPU_COMMANDS_H_
> #define _XE_GPU_COMMANDS_H_
>
>+#include "regs/xe_reg_defs.h"

for the uses we are making here, it should suffice to
include linux/bitmap.h

>+
> #define INSTR_CLIENT_SHIFT      29
> #define   INSTR_MI_CLIENT       0x0
> #define __INSTR(client) ((client) << INSTR_CLIENT_SHIFT)
>@@ -56,6 +58,13 @@
> #define GEN9_XY_FAST_COPY_BLT_CMD	(2 << 29 | 0x42 << 22)
> #define   BLT_DEPTH_32			(3<<24)
>
>+#define	PVC_MEM_SET_CMD		(2 << 29 | 0x5b << 22)
>+#define   PVC_MEM_SET_CMD_LEN_DW	7
>+#define   PVC_MS_MATRIX			REG_BIT(17)
>+/* Bspec lists field as [6:0], but index alone is from [6:1] */
>+#define   PVC_MS_MOCS_INDEX_MASK	GENMASK(6, 1)
>+#define   PVC_MS_DATA_FIELD		GENMASK(31, 24)

wrong order. Should be defining the most significative bits first,
like they appear in bspec.

>+
> #define GFX_OP_PIPE_CONTROL(len)	((0x3<<29)|(0x3<<27)|(0x2<<24)|((len)-2))
> #define   PIPE_CONTROL_TILE_CACHE_FLUSH			(1<<28)
> #define   PIPE_CONTROL_AMFS_FLUSH			(1<<25)
>diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>index 199bd37fce9a..a73c5e1d7503 100644
>--- a/drivers/gpu/drm/xe/xe_device_types.h
>+++ b/drivers/gpu/drm/xe/xe_device_types.h
>@@ -95,6 +95,8 @@ struct xe_device {
> 		bool has_4tile;
> 		/** @has_range_tlb_invalidation: Has range based TLB invalidations */
> 		bool has_range_tlb_invalidation;
>+		/** @has_link_copy_engines: Whether the platform has link copy engines */
>+		bool has_link_copy_engine;
> 		/** @enable_display: display enabled */
> 		bool enable_display;
>
>diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
>index bc69ec17d5ad..59fd588a1faf 100644
>--- a/drivers/gpu/drm/xe/xe_migrate.c
>+++ b/drivers/gpu/drm/xe/xe_migrate.c
>@@ -750,32 +750,57 @@ static int emit_clear(struct xe_gt *gt, struct xe_bb *bb, u64 src_ofs,
> 		      u32 size, u32 pitch, u32 value, bool is_vram)
> {
> 	u32 *cs = bb->cs + bb->len;
>-	u32 len = XY_FAST_COLOR_BLT_DW;
>+	u32 len;
> 	u32 mocs = xe_mocs_index_to_value(gt->mocs.uc_index);
>+	struct xe_device *xe = gt_to_xe(gt);
>
>-	if (GRAPHICS_VERx100(gt->xe) < 1250)
>-		len = 11;
>-
>-	*cs++ = XY_FAST_COLOR_BLT_CMD | XY_FAST_COLOR_BLT_DEPTH_32 |
>-		(len - 2);
>-	*cs++ = FIELD_PREP(XY_FAST_COLOR_BLT_MOCS_MASK, mocs) |
>-		(pitch - 1);
>-	*cs++ = 0;
>-	*cs++ = (size / pitch) << 16 | pitch / 4;
>-	*cs++ = lower_32_bits(src_ofs);
>-	*cs++ = upper_32_bits(src_ofs);
>-	*cs++ = (is_vram ? 0x0 : 0x1) <<  XY_FAST_COLOR_BLT_MEM_TYPE_SHIFT;
>-	*cs++ = value;
>-	*cs++ = 0;
>-	*cs++ = 0;
>-	*cs++ = 0;
>-
>-	if (len > 11) {
>-		*cs++ = 0;
>+	if (xe->info.has_link_copy_engine) {

I wonder if instead of doing this we have here one example of function
hook that could provide some value. +Francois.

And take a look at the discussion in 20230303145015.1018870-1-francois.dugast@intel.com

I wouldn't block this series on that though.


>+		/* MEM_SET command supports setting only 8-bit value.

leave a blank line:

		/*
		 * MEM_SET ...

is the more usual style.
	
>+		 * This function is currently used only to clear the address
>+		 * range.  So the value agrument is not really used. Need to
>+		 * have a better handling when there is a need to actually set
>+		 * a value. Print a warning if a value bigger than 8-bit is
>+		 * passed
>+		 */
>+		XE_WARN_ON(value > U8_MAX);
>+
>+		len = PVC_MEM_SET_CMD_LEN_DW;
>+
>+		*cs++ = PVC_MEM_SET_CMD | PVC_MS_MATRIX |
>+				(PVC_MEM_SET_CMD_LEN_DW - 2);
>+		*cs++ = pitch - 1;
>+		*cs++ = (size / pitch) - 1;
>+		*cs++ = pitch - 1;
>+		*cs++ = lower_32_bits(src_ofs);
>+		*cs++ = upper_32_bits(src_ofs);
>+		*cs++ = FIELD_PREP(PVC_MS_DATA_FIELD, value) |
>+				FIELD_PREP(PVC_MS_MOCS_INDEX_MASK, mocs);
>+	} else {
>+		len = XY_FAST_COLOR_BLT_DW;
>+		if (GRAPHICS_VERx100(gt->xe) < 1250)
>+			len = 11;
>+
>+		*cs++ = XY_FAST_COLOR_BLT_CMD | XY_FAST_COLOR_BLT_DEPTH_32 |
>+			(len - 2);
>+		*cs++ = FIELD_PREP(XY_FAST_COLOR_BLT_MOCS_MASK, mocs) |
>+			(pitch - 1);
> 		*cs++ = 0;
>+		*cs++ = (size / pitch) << 16 | pitch / 4;
>+		*cs++ = lower_32_bits(src_ofs);
>+		*cs++ = upper_32_bits(src_ofs);
>+		*cs++ = (is_vram ? 0x0 : 0x1) <<  XY_FAST_COLOR_BLT_MEM_TYPE_SHIFT;
>+		*cs++ = value;
> 		*cs++ = 0;
> 		*cs++ = 0;
> 		*cs++ = 0;
>+
>+		if (len > 11) {
>+			*cs++ = 0;
>+			*cs++ = 0;
>+			*cs++ = 0;
>+			*cs++ = 0;
>+			*cs++ = 0;
>+		}
> 	}
>
> 	XE_BUG_ON(cs - bb->cs != len + bb->len);
>diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>index c4d9fd2e7b2b..e555f13395ab 100644
>--- a/drivers/gpu/drm/xe/xe_pci.c
>+++ b/drivers/gpu/drm/xe/xe_pci.c
>@@ -72,6 +72,8 @@ struct xe_device_desc {
> 	bool has_4tile;
> 	bool has_range_tlb_invalidation;
> 	bool has_asid;
>+
>+	bool has_link_copy_engine;

I'm not sure if we should tie the availability of
MEM_SET instruction to the fact that the platform has link copy engines.
It seems to be an instruction to carry forward regardless of the type of
the copy engine.

+Matt Roper for opinion here

Lucas De Marchi

> };
>
> __diag_push();
>@@ -224,6 +226,7 @@ static const struct xe_device_desc pvc_desc = {
> 	.vm_max_level = 4,
> 	.supports_usm = true,
> 	.has_asid = true,
>+	.has_link_copy_engine = true,
> };
>
> #define MTL_MEDIA_ENGINES \
>@@ -413,6 +416,7 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
> 	xe->info.has_flat_ccs = desc->has_flat_ccs;
> 	xe->info.has_4tile = desc->has_4tile;
> 	xe->info.has_range_tlb_invalidation = desc->has_range_tlb_invalidation;
>+	xe->info.has_link_copy_engine = desc->has_link_copy_engine;
>
> 	spd = subplatform_get(xe, desc);
> 	xe->info.subplatform = spd ? spd->subplatform : XE_SUBPLATFORM_NONE;
>-- 
>2.34.1
>
