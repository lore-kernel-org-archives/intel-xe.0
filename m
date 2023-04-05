Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C55FC7619A
	for <intel-xe@archiver.kernel.org>; Wed,  5 Apr 2023 17:29:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12B9C10E15D;
	Wed,  5 Apr 2023 17:29:05 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BC7C10E15D
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Apr 2023 17:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680715742; x=1712251742;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=EBPTPAlbs/ECrxEI2yHnmkGRrmMeokXq8uPUh37+5wg=;
 b=ffBrp/QfXkqiAK4Y0r8M05cz9DuR+eeLuM6JLIk+hX6jsmuXQydEXH7r
 nFeT/ahmYiD33pIT0ngADa/XA8X7cLlYQ9wVcVJDK+YwGpzlTvoMvIyI9
 FgO4jKW8HuqkEQ6S28Lm76uFhoqi5gtaMA5dEmNU7eAQFDXYI3n1PUKRd
 VypFsPmdyT5EQFXlAk1KqH9T4NhwUZamoM6fIhB2C54nRRplznpDjxOdS
 r7wDA9PBaH7FBQ32VXZGPH3Xu/SwYhWyNpiezB2LXgxpQ0K8d3VCQGvoU
 niu4+r8rRepHjyw1hlol+RDBUdx6bg/Si0HLQBI3+kjIqDl8qGG6lkDiD g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="322170697"
X-IronPort-AV: E=Sophos;i="5.98,321,1673942400"; d="scan'208";a="322170697"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2023 10:29:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="717122657"
X-IronPort-AV: E=Sophos;i="5.98,321,1673942400"; d="scan'208";a="717122657"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga008.jf.intel.com with ESMTP; 05 Apr 2023 10:29:01 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 5 Apr 2023 10:29:01 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 5 Apr 2023 10:29:01 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Wed, 5 Apr 2023 10:29:01 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.107)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Wed, 5 Apr 2023 10:29:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YREz8vfZ4rhHsQSKyZWKsKija09iO+oMgIiZmSHValhMjxKnyy41moT/25Ipi1EhZ5HN90z4UN3KxEXt3/tYIEnmpaNGxN7JefDhtXcra2VdtnSvUyqBkcFbFL0OjIfGIobOxZstiJAGDXeovVvlxDlWr6ZSHjEOTKRTPMw6TqCzWuzz4/SIh95uRmoikmveDIdtJm41UX7IBthDM+H2IpKuKxSCwAKwkhRi+QhB6a8z8v/IuKQMkT9KcFu82GOXEj0r053ie4Ml9ZW9SdP6jT2EzgJMsLUtopvllaggz2YwbGriAnRYK9Pwv5UYng8rJ4AyY6vaf7uHTi39+S9JPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jI/tXKGj8k/xCpldNPO/DzSo8peelxCIx+2Kwhr6QwM=;
 b=F9LvF987HNoGbGMWn5PDiFip1MLspfg+z+tJ50h9C/Ogq+F+KbDmu59+akSmZbTC31AgnvHk3zALAC4fCzzmhVdF93amkG7m+syu5ETHRMfqEYSpJRnPRxCzRwbMmh6DzpzZj5iiHMdXTZaiSiPfADXZTkjl3J5Po2JFNjL58k5dboXfc/13vqZFcQp7whHpvF9ow65PJ5wo9xtNm9KP0w8a0cNJdRGUnIbJRagG/dUW+Hd/zWLhqB9P0pexPLvqr3bbQBshfVczDSuvDLtIEVX6ekcmGldJLAYcDJViE5lwVGoJGbmrmD0pwpXGyFaCqRaxOivzr3G08hMVkwr/kA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA1PR11MB7088.namprd11.prod.outlook.com (2603:10b6:806:2b7::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.26; Wed, 5 Apr
 2023 17:28:59 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745%6]) with mapi id 15.20.6277.030; Wed, 5 Apr 2023
 17:28:59 +0000
Date: Wed, 5 Apr 2023 10:28:57 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Chang, Bruce" <yu.bruce.chang@intel.com>
Message-ID: <20230405172857.gf6ubjtrhyjkxztg@ldmartin-desk2.lan>
X-Patchwork-Hint: comment
References: <20230405170815.524853-1-yu.bruce.chang@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230405170815.524853-1-yu.bruce.chang@intel.com>
X-ClientProxiedBy: MW4PR04CA0237.namprd04.prod.outlook.com
 (2603:10b6:303:87::32) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA1PR11MB7088:EE_
X-MS-Office365-Filtering-Correlation-Id: 83eb6522-48d5-4ed9-2518-08db35fb3da7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: miFSh7791rvuI0PLn6gjLZTbEYh+JLnTg9uBiN27P7m4opd+AqUpxePlC3qWhY91Kj8eEy8iep5HFsYydTjJqu32QWEWGsbU65eLion/0VXG2gZlq3wh4H6KXOW1peEdT6RYuqdnhu9tof/g8i5NBRH5LDgdu1IRNMhAEEes9fxmxW0cDYi6ifE3dceOJtCEFr0besQw+i3lhvci3VFS4loZusFG3BT/NRBCBLWBe5napD6SSNIibLUzx5LkmfxJzXRYsmfxyrbjzRKIzXEVoDqgQtuipz/30fSId5RgnEEf7399S/+GwnDDL0rfqjI5iqJUZGVKNh1zR/4AkKIfXgJaR93Cqtvzczcz3fOs4M+DQjfanf9TQHEfrx75TtfIfsTn7mQ/HD0TkySN1X/jRAw5Mwaf702U/lVaZ1m3GX65Vq58cS1t4ukEexL1QE+yrXultgcIpBJpX4IxlBwQTGc73p7X4CpeyT3wB8Kmrok99L8VkaFyCkcYCPzNduUtzROLsNFTb6s96xGckuQ6+ZnGPuRM3pvOzXBvPDdeG+NhPJej8XCOIpkyco0l+LFQ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(396003)(136003)(346002)(366004)(376002)(451199021)(6486002)(6636002)(8676002)(6862004)(8936002)(41300700001)(66476007)(5660300002)(316002)(478600001)(66946007)(66556008)(86362001)(4326008)(2906002)(9686003)(6506007)(1076003)(6512007)(38100700002)(107886003)(26005)(82960400001)(186003)(36756003)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?mTyv+cvTY/fAh1O7WCK8J2bnSwT1K7WgeWSLQjsdS/s3GZeAdj3RXFwPmD?=
 =?iso-8859-1?Q?9iHLdd3we9j4QuBK/YwVRfMpfjNVQMrBwaj/U8imuF3F3XPqcuONRn1O+s?=
 =?iso-8859-1?Q?VEvAIUYRa2NRJe9XG40VhV66nmuST8p7rWuOyvijiRl7PiGx8K260aJdY2?=
 =?iso-8859-1?Q?pjTF4lKP9PG1krr58sEPg53GqxH0emSAC5QSPD0GEPvv0wWnsag96rbXxT?=
 =?iso-8859-1?Q?cXE6YBSeLQwywLc07A6gqTCLwsM97vbLE2XsPMWERTGUeHvQpgE8Rqpkux?=
 =?iso-8859-1?Q?tBnl2L7Mj7vDVnvr9fNNgLkjJfjgrahtBRBMiXfaq1FAn3uxdhPzznK/OF?=
 =?iso-8859-1?Q?k/pnzec116/RkqKQf4ZbNxJGjzur7ZMoSWuvjufAn4gs+f8ZiAxfiqjKwi?=
 =?iso-8859-1?Q?LDQoGpxj5XRIW4AnrtPkG/pT7mf66Ll19oat6TUAt+OGRkWknDJ1WxIRIM?=
 =?iso-8859-1?Q?IfxJxO0SbTb955qfvEPgcK636j3aZ0oy3FoCHfeAqhf+WrEcEt+xzTgj/a?=
 =?iso-8859-1?Q?UV6RsahX7YQeWD8inv2UrnWRZUXI+5bMyCXdw7o10dDuoPOm5b5DpxIJ6E?=
 =?iso-8859-1?Q?+atOfnsElGyW/RAz9lsAosN7DZbWgooQwHibIHgKDwVxncVoSmEsrenjv4?=
 =?iso-8859-1?Q?3CdnCoE5CMSktT+V5TJa/feRaJupOFJADXPrlkK3m59AShs0GI8om3CvJG?=
 =?iso-8859-1?Q?Qdvdxe72mPKtkL9pEjFfLViusee18COpl7Me1nG5PKl7hty/EhzIxSdn7G?=
 =?iso-8859-1?Q?hG45u7ZCvK47MV8Bnx1J6dgA/0WPqTMbv3j+K2IIQiNWFf4BOqOtCXaCsg?=
 =?iso-8859-1?Q?AfMOolRsvuy1mLsTUowhP8aGny23m0AZf31MPgi1lZxQ2iVvB1RZP1oWIz?=
 =?iso-8859-1?Q?z6tHnGBbemWsfO13N22yMjAAtNcKi2sk4UwRTzb56Fex/ONVDbp8nUfOtw?=
 =?iso-8859-1?Q?zziuy3tFMGn96PfKCDEB2tAahq1VB27NE5jYBFqaLL/13LAsmORZtBHv48?=
 =?iso-8859-1?Q?7WHgj8Y8aZupCmmveDRLenvB6cMc4d5e6uDjf1rVVnSp/QnhWIRdVo8e5L?=
 =?iso-8859-1?Q?impeptkU74b09p9Ox1XcoopuIl4h45vxvAW/2QfylHZQQ8nKITREGWZvjB?=
 =?iso-8859-1?Q?j/hQQmA6UMkicPq3CfyhuzcqN186PANPq2i+8jbIYCC9sodspUZPixi4ZK?=
 =?iso-8859-1?Q?RYtEzHojqLI2o2TLf74T1cMwxtGk/pQKBqkLDxRthhWnJhAX2Qrjo6h4dI?=
 =?iso-8859-1?Q?wy7iI+80zCQTEADHZ9CCF9lSqEL+qcqLW8G+rc+J7MhDd07IfJxapn8IsH?=
 =?iso-8859-1?Q?P0tq8Y3n01kFXVUQ6cyjghld+5XnBQoFLH+gc0RSPbVdkbV1RUOiSrC8XL?=
 =?iso-8859-1?Q?wScDx60oK8j12rdaLoyjOamzuhLRxu8x0hEzZGR5l6docR3/5Vt/5rZRxd?=
 =?iso-8859-1?Q?iNgHj8s9pIOIsLjEmGkbdFVWqJPWNyLi9uVi67yurG1UAi2EY4l8xWwJPk?=
 =?iso-8859-1?Q?W5ogjomExwtl8yxqi8zrqrW0hKi5QwWBZIA79Ey8dTrMFzOPSWR6C9nU6r?=
 =?iso-8859-1?Q?jdqDauWpxj2NlTCCRw/fZ4/25WpS6zvCEJPi5CGjLF/b2/howAjuJfRTz3?=
 =?iso-8859-1?Q?vdfHW9Jcul8hHwTzDyj6KGQdiDFBih8CIcVW1Gvi/ciR70WkUPiZarkQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 83eb6522-48d5-4ed9-2518-08db35fb3da7
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2023 17:28:59.2949 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +GZeYX6zngiPmN+4EDpf3IbICxtOFqMTDB9TMItIGa2wWl3XEzQDKWy4DQB0vllqhI8xn7rXG24SqOFFoTrSlV5I95FUI3LPS7QZvRTXlpk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7088
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: follow up on the patch to fix pvc
 unload issue
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
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Apr 05, 2023 at 05:08:15PM +0000, Chang, Bruce wrote:
>created xe_ttm_sys_mgr.h as suggested by Lucas
>also fixed a compile warning found by Lucas

Let's rather make this a fixup so we don't keep breaking and fixing the
build. We are still rebasing the tree, so let's keep this as part of the
original commit. Please commit with --fixup=01362fbe5e53

>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>Signed-off-by: Bruce Chang <yu.bruce.chang@intel.com>
>---
> drivers/gpu/drm/xe/xe_device.c      |  1 +
> drivers/gpu/drm/xe/xe_device.h      |  1 -
> drivers/gpu/drm/xe/xe_ttm_sys_mgr.c |  1 +
> drivers/gpu/drm/xe/xe_ttm_sys_mgr.h | 13 +++++++++++++
> 4 files changed, 15 insertions(+), 1 deletion(-)
> create mode 100644 drivers/gpu/drm/xe/xe_ttm_sys_mgr.h
>
>diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>index 4fb9aff27686..85caf81ae686 100644
>--- a/drivers/gpu/drm/xe/xe_device.c
>+++ b/drivers/gpu/drm/xe/xe_device.c
>@@ -27,6 +27,7 @@
> #include "xe_pcode.h"
> #include "xe_pm.h"
> #include "xe_query.h"
>+#include "xe_ttm_sys_mgr.h"
> #include "xe_ttm_stolen_mgr.h"

needs to be sorted alphabetically. See
f4b0bb728995 ("drm/xe: Sort includes")

> #include "xe_vm.h"
> #include "xe_vm_madvise.h"
>diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
>index d9d1b09a8e38..d277f8985f7b 100644
>--- a/drivers/gpu/drm/xe/xe_device.h
>+++ b/drivers/gpu/drm/xe/xe_device.h
>@@ -116,5 +116,4 @@ static inline bool xe_device_has_flat_ccs(struct xe_device *xe)
> }
>
> u32 xe_device_ccs_bytes(struct xe_device *xe, u64 size);
>-int xe_ttm_sys_mgr_init(struct xe_device *xe);

there was a blank line here that needs to remain

> #endif
>diff --git a/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c b/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c
>index cf5f4f73d4dc..9c2f7d4936d8 100644
>--- a/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c
>+++ b/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c
>@@ -12,6 +12,7 @@
>
> #include "xe_bo.h"
> #include "xe_gt.h"
>+#include "xe_ttm_sys_mgr.h"

some thing here, this is the header for this specific file. It should
follow what we do everywhere else and be the first include.
See f4b0bb728995 ("drm/xe: Sort includes")

>
> struct xe_ttm_sys_node {
> 	struct ttm_buffer_object *tbo;
>diff --git a/drivers/gpu/drm/xe/xe_ttm_sys_mgr.h b/drivers/gpu/drm/xe/xe_ttm_sys_mgr.h
>new file mode 100644
>index 000000000000..3d70c452a660
>--- /dev/null
>+++ b/drivers/gpu/drm/xe/xe_ttm_sys_mgr.h
>@@ -0,0 +1,13 @@
>+/* SPDX-License-Identifier: MIT */
>+/*
>+ *  * Copyright © 2022 Intel Corporation

we are in 2023

Lucas De Marchi

>+ *   */
>+
>+#ifndef _XE_TTM_SYS_MGR_H_
>+#define _XE_TTM_SYS_MGR_H_
>+
>+struct xe_device;
>+
>+int xe_ttm_sys_mgr_init(struct xe_device *xe);
>+
>+#endif
>-- 
>2.25.1
>
