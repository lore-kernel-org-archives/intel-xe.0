Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87359C001DB
	for <intel-xe@archiver.kernel.org>; Tue,  8 Aug 2023 14:41:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C15310E0A1;
	Tue,  8 Aug 2023 14:41:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CFE710E0A1
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Aug 2023 14:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691505707; x=1723041707;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=p9TJb+pImCPvZpDGiksfQj/HCntM3aQTI7fTlawPF44=;
 b=UHqQ3N0yzfqMKLH0sMaRR5P4HHYzDWXKf9/tpgd/H+1EPpEdNu65P+Ol
 q7x67luAA2elIDqTDevCvGdCkibdr4vIedyHbFdqfMRbgY5Y7GCU7O6kb
 QMG88+aVQP/4UDZ/VxrhgN4ofS1jbaO9AdX7G2j0DGPl0Gg/mzANxkAmG
 OgJ08uHdfzttTwPoCpOIjYcIX44ffZt+YuxjLEMYNWmsc7/B04Bjbi5QO
 JrNnqF065d+1TOXuoWvTMXE2N4Z0vcsuiLPLRfammNHEAz6kQMNfXBdgk
 LUxWA7DxEokQEZ+GyMfAJFDFhlQMzAiGyrGPTn5hA/tVM2fzsLU3zHqoh g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="351144936"
X-IronPort-AV: E=Sophos;i="6.01,156,1684825200"; d="scan'208";a="351144936"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2023 07:41:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="977894941"
X-IronPort-AV: E=Sophos;i="6.01,156,1684825200"; d="scan'208";a="977894941"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga006.fm.intel.com with ESMTP; 08 Aug 2023 07:41:29 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 8 Aug 2023 07:41:29 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 8 Aug 2023 07:41:29 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 8 Aug 2023 07:41:29 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.44) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 8 Aug 2023 07:41:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HHUi/4kQoAPXDlYo/ROR8TxTMYviX5SszkiC12P71W6l81vMIuqIBK/ghPeQBQ5kUrwT9nUptDbqKrGZD8tNBCx3yjTTCiCcSf3DBwuj5/1Kwr8smgQoy1sLEp82Rj/CAUFm4oSbvr/W5+cARJImT/7i2Pts3NTS6cV5IPql66nRRlX2j6qcGh9Vw8BplTwmcFnsQ60+miQVDzX1U/nr+Zvm7CHwDaRrxBGxWC1fIAps94g9tmje/HfJInLttPSHK0KDJ0teGGARLgxurFsHGpLDoiB2za901o384G6AkxfC3MKNuhw+s5kQwi8+zk1rAWZV9wHEo1988akzS+WPSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GkIxtpMVPTdWjcnoITC2uR2QHYgDypsfq9B+S394UqA=;
 b=a2luccXwuIuo2KWLI3nQIYx1Jpub2buoPfe1UAVIMFvX0SxO77gCKuLtJyK8RbWm0GYIXUac1Semc5BrwixUKJLCo7noI+wYhrm5i3IzGJrsbkUgP/246XpMNF+SGNL09JxNRAuRiKRUi3Y7n5tr8hv3ogNAry+3nsw8Rj8/YvTf1em4eFeeaDlf3e6fcmTy9Tjbl1fgMt7w4DYjg0MisBfmDxKgcAfxi8fKHnDjPGe9qehhNVA/NfXWOmh+JPk+R2L1JfkI2L6uCGRFNk5WodKZPxbItWozxe/GpR0anjJOAwT3r9CsMx/lK0F888iSuRYsDD5KUcCLm7Zw2rs75g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CY8PR11MB7242.namprd11.prod.outlook.com (2603:10b6:930:95::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.26; Tue, 8 Aug
 2023 14:41:22 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::cc12:ab15:1d0:af79]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::cc12:ab15:1d0:af79%4]) with mapi id 15.20.6652.026; Tue, 8 Aug 2023
 14:41:22 +0000
Date: Tue, 8 Aug 2023 08:41:19 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Message-ID: <vrhcmrdcsrd4pw4mgwcrbrmdinoh2ce3uu7ebrabpqcc7kjjll@2aor4ajoytf4>
References: <20230807173446.2039-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230807173446.2039-1-michal.wajdeczko@intel.com>
X-ClientProxiedBy: MW4P221CA0002.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::7) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CY8PR11MB7242:EE_
X-MS-Office365-Filtering-Correlation-Id: da7c0169-e52b-4f8a-ebee-08db981d88d6
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nRPYRCo4HvYMNKeZA72mfvfTNhYAK/O9NvqqtEg8NZc/TgPFH13aHxpODmmPJI46PWoyD6TCQ7ipVQdbhUIiBceb9qAWkI/LIvQ9t7QQmwhPtgT21DNmOJv61nxJzK1Lsgt/w9JfNAHHZ+mLuWSQZCbCYv4EyYKFtReaXojVdcTI1ZDZfHTJIDffNbzC4gWluXEd47cqxE00p9VhXYK3+XQTTubHqmbwTd5Oiv3ak+0k6dgPNBbRgFj3fgID5nLfuFhG6ExyoZvANNAR0W7ymcQmbboEOOdo4ICI8ycH5BNTmb2pszXpKHeZP4FQKtflxP7a3EREuEj/p0z5fpBVVvkognfLDfFfrpzio84SD7yJVMkNsR8doZsrVa+/Rz+/WGAI1G7S5mgDEE8RJwRjmQYWDjkxOfGrlRmu6TgjDvxpbPm3yZJK/yse5e/WrjlDIkXJc6XULlBJJPloVxs7qOVX3bCgrx1pmIgRvSbX/rBpEpkM8+5bgDWDg61Nly77rHJxh7ZnPx//h8GNlhUnn1bLXrTvuaCAMUu0zcS/n22s3I6FjsPNGE3kFCxUqOEK
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(396003)(376002)(39860400002)(366004)(346002)(136003)(451199021)(186006)(1800799003)(86362001)(107886003)(6862004)(41300700001)(478600001)(6506007)(8676002)(8936002)(26005)(38100700002)(6486002)(6666004)(5660300002)(2906002)(83380400001)(54906003)(33716001)(316002)(66556008)(66476007)(66946007)(82960400001)(6636002)(4326008)(9686003)(6512007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?mxcV2co2U5RMlB20ELCNQYvztje+xGbU0FwyKhBgOXWLLpi2HaGu8vrVGC?=
 =?iso-8859-1?Q?Ep3jucMxaHzGlgxs6MctsmMvdvuSwGBK+SAVY3ekvc0FRhVCionW+WCwuP?=
 =?iso-8859-1?Q?U0Gr7dXgqC3LYJ2VWrxOQWiz4B8wM0R/9l1WPAtPltaHfLttgyiYnCpz1i?=
 =?iso-8859-1?Q?FOgrI48yzke14f39jBOoNtdTEhK92+FtWQ1ewEwclzQXF7TgHK+YluGuUn?=
 =?iso-8859-1?Q?d9VKvN5ti8/iiq++e/8/7NR28H0aeF9v+a2NhuTNPdsMuZ/xm2t0j+ZHLu?=
 =?iso-8859-1?Q?F6bDGAwh7AIsnSQE8xgrS5XOfMUeR2kOBkFVEd5HkDfRR9+wKDC2hDdtN6?=
 =?iso-8859-1?Q?9FPtiCec1wT1qiXlWM4cVvBIPEJdoTV97z9qzyfeB/5RlSgEdPx61E+UUG?=
 =?iso-8859-1?Q?3XrS3fWleFDR+l+DHczgZf34LgfR3APBrN2fJe+mw7f9HvwYIxGlJ9rhY0?=
 =?iso-8859-1?Q?XXpoeC9J1QeGWkjK0tbyzrJ5aSaV3/jXpTFPqK9u05fBoIh/s9NSXXd5+X?=
 =?iso-8859-1?Q?EsTdwk/5JwmG2FnpJrgdMhl+3cvUDpxUWmB7X1b1h4zUeFZgF3t9Wklp/J?=
 =?iso-8859-1?Q?/6i1Ggf9+dFVVGCAAJgXqeB/Y+zQQaZ/91wx5OKNWkoAvdo6TokZAbM0C2?=
 =?iso-8859-1?Q?I+X/vO2C0Q4lFt0WRkqurfOp+86MKAwSU6GDzwujF3wtWuGf6NeeVu2US/?=
 =?iso-8859-1?Q?EVV9eNZPA2GOCW7Bn7Tz49SWyOyxBlCdT6Rm8tnBO+1KdOD6p93Zpat1BP?=
 =?iso-8859-1?Q?u2wlfzJ4JUbvzE2QNcCHlRtYksMxq3GMmFa1msYmcrn9hFyE7p7saaJUD/?=
 =?iso-8859-1?Q?e0mabzqBRkxNzTMH9GvGiKgTnya+vgskOcOQKZKK7kN2aPW2f0BpklgJ5n?=
 =?iso-8859-1?Q?+Hpdwn3KAuCSF2KrmzqjDExkGjOUx8zTnAQcv46OC52iHfOgrtYNRZYvLM?=
 =?iso-8859-1?Q?wbrdRZURI+9SK3p5oDmNKuIsqCZ9UM9PVreJKkNw/0TzTAHVZ8xpstFpVo?=
 =?iso-8859-1?Q?/4JsWHG5TxP7dhM24nHuOnGA3/4GhMmkeJBPXdk4gboG7VKcGVfgFbFDHP?=
 =?iso-8859-1?Q?n338IFvmfGUxK7auUKz6fkvg1CDg5Va6OKrp+HbBI5hBsHOnaNeOv+dv0e?=
 =?iso-8859-1?Q?r2aQiVRPtciTJvX9y+nHPc5QMlMaS6A8bWu9amTIiAMdlMlgS7iI3Nt9uJ?=
 =?iso-8859-1?Q?ZDsHS8YRUVp7cVk2mDNfp32P1gR2MC9Lnc5v38g4R+xHblMvOIgAt9U7/N?=
 =?iso-8859-1?Q?2Y7KKX3upZs5wmBB8Kvlt/R8auc0pEVGfDdglA8gmAuh59oSJxvffOBnyU?=
 =?iso-8859-1?Q?tt7uVTVpskKFyI270YNXv04HWb4Ch8YlTco/laLDYQTO5eRGo5Soyjsx4K?=
 =?iso-8859-1?Q?PWKfQm2ApoaCUFOq8zcYy2VJV8/6DTScwkthYkarVPxgvh+3jDz8Mb77kp?=
 =?iso-8859-1?Q?mCFNjZnTEYdq3IKs3Xf8QoTAmueogA898L4Sab2OsZD6A2sluiwBcFEa9s?=
 =?iso-8859-1?Q?cOmkw1iHi7T2PBNSqhfBt/fCul7+q39eXdESDlzLjEPxblb5DqjiB73bxx?=
 =?iso-8859-1?Q?imXdUUpqTN7yINt/6y/LJnTuDCkzQllBYkK8wBu0Pf1tcVQMHfJFMRKt+T?=
 =?iso-8859-1?Q?Cevjw60fr9E6F8wBQVxAqVvnFO+6CqNh0fOsZVMpTh2gO/lDULje24oA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: da7c0169-e52b-4f8a-ebee-08db981d88d6
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2023 14:41:22.2937 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HFWLAwUICiggoYxdSzGNqWabbgjWu1ktDYy2TSIHC3bczCpdGvOUcD8qLMqfXPYq3rJeOxwF1ekLsxvh9/0gltjt1uKq2rTsh7STb0SzFQ0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7242
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Introduce xe_ASSERT macros
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
Cc: Jani Nikula <jani.nikula@intel.com>, intel-xe@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, Aug 07, 2023 at 07:34:46PM +0200, Michal Wajdeczko wrote:
>As we are moving away from the controversial XE_BUG_ON macro,
>relying just on WARN_ON or drm_err does not cover the cases
>where we want to annotate functions with additional detailed
>debug checks to assert that all prerequisites are satisfied,
>without paying footprint or performance penalty on non-debug
>builds, where all misuses introduced during code integration
>were already fixed.
>
>Introduce family of xe_ASSERT macros that try to follow classic
>assert() utility and can be compiled out on non-debug builds.
>
>Macros are based on drm_WARN, but unlikely to origin, disallow
>use in expressions since we will compile that code out.
>
>As we are operating on the xe pointers, we can print additional
>information about the device, like tile or GT identifier, that
>is not available from generic WARN report:
>
>[ ] xe 0000:00:02.0: [drm] Assertion `true == false` failed!
>    platform: 1 subplatform: 1
>    graphics: Xe_LP 12.0 step B0
>    media: Xe_M 12.0 step B0
>    display: enabled step D0
>    tile: 0 VRAM 0 B
>    GT: 0 type 1
>
>[ ] xe 0000:b3:00.0: [drm] Assertion `true == false` failed!
>    platform: 7 subplatform: 3
>    graphics: Xe_HPG 12.55 step A1
>    media: Xe_HPM 12.55 step A1
>    display: disabled step **
>    tile: 0 VRAM 14.0 GiB
>    GT: 0 type 1
>
>[ ] WARNING: CPU: 0 PID: 2687 at drivers/gpu/drm/xe/xe_device.c:281 xe_device_probe+0x374/0x520 [xe]
>[ ] RIP: 0010:xe_device_probe+0x374/0x520 [xe]
>[ ] Call Trace:
>[ ]  ? __warn+0x7b/0x160
>[ ]  ? xe_device_probe+0x374/0x520 [xe]
>[ ]  ? report_bug+0x1c3/0x1d0
>[ ]  ? handle_bug+0x42/0x70
>[ ]  ? exc_invalid_op+0x14/0x70
>[ ]  ? asm_exc_invalid_op+0x16/0x20
>[ ]  ? xe_device_probe+0x374/0x520 [xe]
>[ ]  ? xe_device_probe+0x374/0x520 [xe]
>[ ]  xe_pci_probe+0x6e3/0x950 [xe]
>[ ]  ? lockdep_hardirqs_on+0xc7/0x140
>[ ]  pci_device_probe+0x9e/0x160
>[ ]  really_probe+0x19d/0x400
>
>Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>Cc: Oded Gabbay <ogabbay@kernel.org>
>Cc: Jani Nikula <jani.nikula@intel.com>
>Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>Cc: Matthew Brost <matthew.brost@intel.com>
>---
> drivers/gpu/drm/xe/xe_assert.h | 160 +++++++++++++++++++++++++++++++++
> 1 file changed, 160 insertions(+)
> create mode 100644 drivers/gpu/drm/xe/xe_assert.h
>
>diff --git a/drivers/gpu/drm/xe/xe_assert.h b/drivers/gpu/drm/xe/xe_assert.h
>new file mode 100644
>index 000000000000..7ea295b7091c
>--- /dev/null
>+++ b/drivers/gpu/drm/xe/xe_assert.h
>@@ -0,0 +1,160 @@
>+/* SPDX-License-Identifier: MIT */
>+/*
>+ * Copyright © 2023 Intel Corporation
>+ */
>+
>+#ifndef __XE_ASSERT_H__
>+#define __XE_ASSERT_H__
>+
>+#include <linux/string_helpers.h>
>+#include <drm/drm_print.h>
>+#include "xe_device_types.h"
>+#include "xe_step.h"
>+
>+/**
>+ * DOC: Xe ASSERTs
>+ *
>+ * While Xe driver aims to be simpler than legacy i915 driver it is still
>+ * complex enough that some changes introduced while adding new functionality
>+ * could break the existing code.
>+ *
>+ * Adding &drm_WARN or &drm_err to catch unwanted programming usage could lead
>+ * to undesired increased driver footprint and may impact production driver
>+ * performance as this additional code will be always present.
>+ *
>+ * To allow annotate functions with additional detailed debug checks to assert
>+ * that all prerequisites are satisfied, without worrying about footprint or
>+ * performance penalty on production builds where all potential misuses
>+ * introduced during code integration were already fixed, we introduce family
>+ * of ASSERT macros that try to follow classic assert() utility and can be
>+ * compiled out on non-debug builds:
>+ *
>+ *  * &xe_ASSERT

pass by comment, not really checking anything else here... Why are we
mixing upper/lower case? It's perfectly fine to use XE_ as the namespace
like is done for other macros.

Lucas De Marchi
