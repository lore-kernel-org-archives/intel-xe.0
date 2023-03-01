Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11BAAC64ED6
	for <intel-xe@archiver.kernel.org>; Wed,  1 Mar 2023 16:38:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEECB10E31E;
	Wed,  1 Mar 2023 16:38:03 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED80110E31E
 for <intel-xe@lists.freedesktop.org>; Wed,  1 Mar 2023 16:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677688681; x=1709224681;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=K0vEd2eoitHy2758X3nuPhvVx8I6UxtqMO8RyTxNXpk=;
 b=PSOCp4hXkdBI4nByhxRdLAZc55wC3IC1+sSskzKYVq0FvzfFmko6H1bC
 Kw4DZXH9KPwEHRbpkuVpy4/iJiuHA7AT26M9cq4kKvPc608XzGgfiADmk
 vGFWcQ2/4sL1perTQP6JkGy1+Ekls5nBndT0Hp0DlV+4b5Y+rAj0LP0BY
 HZFPrmlgYvbkbclRAcFAa1nmoFhdId8u+4k2+/JmXmzy4GyuoI1rP66+9
 i3/fW/ATt69Yh7I2Nsoi1K+oJcHLE4jqNKN1pBb+jhdP6HRG/m2/uJGxu
 m4kJj/hkov4KuQq1KEkBs8B3fcyK55+i2mfs37JfCAQaN43cSfj2x4SVF Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="420718293"
X-IronPort-AV: E=Sophos;i="5.98,225,1673942400"; d="scan'208";a="420718293"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2023 08:38:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="798464436"
X-IronPort-AV: E=Sophos;i="5.98,225,1673942400"; d="scan'208";a="798464436"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga004.jf.intel.com with ESMTP; 01 Mar 2023 08:38:01 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 1 Mar 2023 08:38:01 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Wed, 1 Mar 2023 08:38:01 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.174)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Wed, 1 Mar 2023 08:38:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hidk90kGtiQKlQqVSo6GuQthC3/UgrA9asKxTzzpzK2ktQfcC8ZEoSMcAG2/Lr7YqboQA7tQ6WCXVTUXofAS1hQ4HMVjdvBYJIt9JmGNFngYrKHmegfcav3qqUesecokrGRaxvOVPoeek05WJVgoe0FnBKRuNYlBM6AMML2c8Qnz1MA3PtYzzT+I82VINjUKIY45wOmOnVHS85JgTI4DmMJLTYLxduilgQygJmn2RNyQW7kPrj+kObMnjPWJSeCoFfh3ILK9eYwYCQNFOelKNPF0C4LcNN5ZHWYSLotuuzIf9DrIxEzt5+b89i7XhgBl7nCj2RWMJyipfQ3CixfX+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K9KEVvKfdxakolkN1cDQ13WYu9WE+B7W61x7UodNuRs=;
 b=UOpEOell7+6KA4BbMPWTlrQZR9Y2l5A0HObkiERHN3VNvxVjPG84WSZsJqQKkN5Nla9iNb2IY8jC5TDplm/BeNYWnKWhGaoHCnyE7+BlzJ47F3olYYTcTGFAbXvMWMRKlTrlvQCXHUFe9ioy3qg2332dCh/QkYj4UsLm+XE7cte6uHFAN0SU/TTJKqs5JYKHvXA5h/V4pxlDqHs9ZBghFXqX+MzLhQ6sXyyyLMZTQuj7o4vk+V+ZrYzwweqCGht9SFKQSySGcrRFZu46d6nWBg/0Sz0jHDsseAV41Krj2WZS0tDXutg0m0Zd6vi62q0u86yTqCf/BdKjz9SbvrGZ5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS0PR11MB8000.namprd11.prod.outlook.com (2603:10b6:8:128::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.25; Wed, 1 Mar
 2023 16:37:59 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7bcc:b9b8:78df:1bd8]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7bcc:b9b8:78df:1bd8%7]) with mapi id 15.20.6156.018; Wed, 1 Mar 2023
 16:37:59 +0000
Date: Wed, 1 Mar 2023 08:37:57 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <20230301163757.o6rcvk64t4ilevbb@ldmartin-desk2.lan>
References: <20230301102603.113614-1-maarten.lankhorst@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230301102603.113614-1-maarten.lankhorst@linux.intel.com>
X-ClientProxiedBy: SJ0PR03CA0334.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::9) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS0PR11MB8000:EE_
X-MS-Office365-Filtering-Correlation-Id: cc6f93ed-1fc1-4dfe-4df9-08db1a735161
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pGKO/rul+Pc91UO4T+0p8BYL74DM4JlTCLPXuBmgJfHCoaX0ILgcpLodtoPbDZxXXK4589CpkTrT09CIzjsazO64d2UHwxYktmkjEbxUpuDKsA2+qbd3LGFnlDioqQrC5BYEDrJG91AoP427QZYJdUN7oCg8chnKlqsN/j0fgvxY1L3MC3hYUR5Gemvrg5DlX3p3b1YzA5iQcSEO2y8da9ZMAq9uP7+rZnLvNZ3Y+dgmocp2SbGHKevJv9HrLFr1CUyBi84Q8EWKyalVp/6zAhiuaN2Nq61TwiSoaEi6/Qx6pA7ZglQwhSdyPB6cMrBqxYfXYfKqQC+x+o0VwKFis13/gJlgbLRixlQWTDG43IpgPEc0rzxwOrKz8AbAOD2gnPxsCjh+QRlg71H4vMAyV9JHcNH+FEGFcanSPEq/7g3OH4/uz33nQeKQgYi4DePCcH2WsnVV/hG3GNRKFmnfLV0C4Daiig0BT9iMZuf2b1s92waoPcwDQk5HA2JbZDXrkcaj3+dT04iHpRgneB8FW7NmlX0zv+cS/BdTLcLlqguguNl97yTkN/fXyZzeIbGxfrxBWd9HI2tBGjyrn8FWUoV52F4l03M10qH2cwbXFvob184XRj3WIw/DyyVr1zR8Im+/RwNeO2bD3jp1dWbSqw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(346002)(39860400002)(366004)(396003)(136003)(376002)(451199018)(86362001)(316002)(5660300002)(36756003)(6486002)(186003)(9686003)(2906002)(66476007)(66946007)(8936002)(41300700001)(478600001)(4326008)(66556008)(8676002)(6916009)(6506007)(26005)(6512007)(1076003)(82960400001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QtyG+mU95feQFQ2E8alHuh0dYUJJih6nolhw4Tlglj45vgGF6HOjyjBVYhTv?=
 =?us-ascii?Q?RAz+F/oGxt7xGFdqR9ooxunFjvD67FvefMb+aQ1peiuztC9/zVbm0oxzNnby?=
 =?us-ascii?Q?wyDmQ+9uBcdSZUMdgJm73ugJ6T7mTLsJC1liP6dNVt67QzQx1nnlmAJFm1Do?=
 =?us-ascii?Q?hKSUz2i0fyHuJWPLKBwCcgHJb0qYZFHlBYd8LYVvKzkUzdaZ+HUX3RWFyflr?=
 =?us-ascii?Q?lwgiabzRgTl5RkZoJqjInOqFnV85h+gsYSqUI5UXKwI9NQyAaUUMYcAC5Dmu?=
 =?us-ascii?Q?M5PblpkqrdxWhk/R+AURCFxxRMZAN7uKMvtkWCKfgQpWns8ulzLv1ND4PNDn?=
 =?us-ascii?Q?lSGfX1Fiy+El2jf5bupoH2DgtM9E4gv+Gqa/6BhipEX7xyTgGSKLKRF3DSuq?=
 =?us-ascii?Q?ocwOXbkQoqio4Mkt4S2WLn0t6jx7c26mZ00cqsVS3lRsduLMEECHA5jValKv?=
 =?us-ascii?Q?xiWiehVDtszNKj+hqJOks87LykmpdDqvGG2+6SYyo45V9zuglA9EEUTcW7k7?=
 =?us-ascii?Q?fneIjQ1JcGPEi7UmQbTofxGKuBFWT15CAfLSzFPLlYG3ERas+lYsU+dNWjBj?=
 =?us-ascii?Q?JbDNBOBGhc/WzLnLufHujGTaTP8GC4N6donTWzF3UqQQef2R2yHAVVdABsR4?=
 =?us-ascii?Q?soYQZtT9ArarH9NWvBcYfe1QCEwQvJHzanX9nEG3GQUUQkHtN+yIljVaUtoZ?=
 =?us-ascii?Q?qD4YXgZyFGTimrwRpDaqTg38Sb3L4WEwRwEVSZZR419lXFvGW/Ez7/kvAfbZ?=
 =?us-ascii?Q?4KzVy2WjA2Mh3xMQCGsnaCWPML+q3YBHlt8bC8YCPVJcQYI9ecMF0eMnugv8?=
 =?us-ascii?Q?AYcxToFjMwP6b7KDIwWNtaQtWt4+uXr6szfbmu2BTUyFgpJypRZDQIbejm26?=
 =?us-ascii?Q?HyCGTUGbVLWCGm/V3ws7PCaX/YFi2id2jHJDIX5yb+QBWIQdbQXHz2M8S/8y?=
 =?us-ascii?Q?TF7tg5cZnIf2qDOpKXotfHTcIUAQubESSusbPTszAHXDGpyxBFwjiG8BIkZq?=
 =?us-ascii?Q?uVdtgshrJIRSa1os2y9L/bEiF4wXqVRhkPfiSDd5e02Pwi7iaeNj5RzcBRC8?=
 =?us-ascii?Q?fq6pfyUvxS1bcihBerqVICuiIgDeQl22nTluaq/jKR+os1ohOVVo4WRQTVKb?=
 =?us-ascii?Q?0dbS6yHRKjcdU5KB68ciL2PDVavzGW5EjsyyWtAKlN81SbkWDoC1C9PcEefI?=
 =?us-ascii?Q?liHCzB5K5DD4LHrAiLpgNSITgFRrQhdP+HuaJR3xREwjEuHeCYOLfR4iu57c?=
 =?us-ascii?Q?Xz1sF4Qsnu+ODgX3g2QubRJNKUcHb63c8Rjafm9OCyLLNY46rYxuwMvjESj+?=
 =?us-ascii?Q?0lijdHmxbuTt8Vc3auyEg7kucTTAi1FaizItSH+Qm1e16NksMy+b3f/eOAOp?=
 =?us-ascii?Q?xw9Pyl4fG+/YuCQcwKJHVtzWz/sOX6f85ItYOv+VbPJofnhLjKwYapslnUVg?=
 =?us-ascii?Q?krVO1MVlk92IyKa1APlGw6w27CfJDdEw9DH6Q0rBtWu6R27FG9HTnDjzvY3Q?=
 =?us-ascii?Q?9+fNqnDT0CVC0YiXtnc3oT1lNdgJnfR51D6L8TaTI7Mp92gV+kxFfeqiZh0z?=
 =?us-ascii?Q?lpO6HhgLA/WGnhQgDIFvUUrwNGVmQVMnxWCc4hH5I0wAlpVKIbArroCJc//K?=
 =?us-ascii?Q?VA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cc6f93ed-1fc1-4dfe-4df9-08db1a735161
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2023 16:37:59.3823 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CpOk9lrL5VBeui/xb285sQgVVb8SArNu7UewcBoCpsyfdrNTVVkMl+RtUM0PMKU0tCrhUb6d30P7WM/KyhRUty9hq2vIrcWaD5+F3Kr2tJk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8000
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Add missing cursor offsets
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

On Wed, Mar 01, 2023 at 11:26:03AM +0100, Maarten Lankhorst wrote:
>Missed this when implementing display support. This allows the cursor
>to work properly on any pipe other than A.
>
>Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>---
> drivers/gpu/drm/xe/regs/xe_regs.h | 4 ++++
> drivers/gpu/drm/xe/xe_pci.c       | 6 ++++++
> 2 files changed, 10 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h b/drivers/gpu/drm/xe/regs/xe_regs.h
>index 2e7fbdedb5eb..c1c829c23df1 100644
>--- a/drivers/gpu/drm/xe/regs/xe_regs.h
>+++ b/drivers/gpu/drm/xe/regs/xe_regs.h
>@@ -69,6 +69,10 @@
> #define PIPE_D_OFFSET				0x73000
> #define PIPE_DSI0_OFFSET			0x7b000
> #define PIPE_DSI1_OFFSET			0x7b800
>+#define CURSOR_A_OFFSET				0x70080
>+#define CURSOR_B_OFFSET				0x71080
>+#define CURSOR_C_OFFSET				0x72080
>+#define CURSOR_D_OFFSET				0x73080
>
> #define SOFTWARE_FLAGS_SPR33			_MMIO(0x4f084)
>
>diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>index 11dc0de66101..a0802c288a94 100644
>--- a/drivers/gpu/drm/xe/xe_pci.c
>+++ b/drivers/gpu/drm/xe/xe_pci.c
>@@ -95,6 +95,12 @@ struct xe_device_desc {
> 			[TRANSCODER_DSI_0] = PIPE_DSI0_OFFSET, \
> 			[TRANSCODER_DSI_1] = PIPE_DSI1_OFFSET, \
> 		}, \
>+		.cursor_offsets = { \
>+			[PIPE_A] = CURSOR_A_OFFSET, \
>+			[PIPE_B] = CURSOR_B_OFFSET, \
>+			[PIPE_C] = CURSOR_C_OFFSET, \
>+			[PIPE_D] = CURSOR_D_OFFSET, \
>+		}, \


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

but I started moving all of the display's specific from this device desc
to another one in display/. Would that be ok?

Lucas De Marchi

> 		.trans_offsets = { \
> 			[TRANSCODER_A] = TRANSCODER_A_OFFSET, \
> 			[TRANSCODER_B] = TRANSCODER_B_OFFSET, \
>-- 
>2.34.1
>
