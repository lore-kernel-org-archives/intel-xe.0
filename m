Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7337BC27C79
	for <intel-xe@archiver.kernel.org>; Mon, 17 Jun 2024 14:37:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A6EF89C0A;
	Mon, 17 Jun 2024 14:37:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vbx0+bzX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 009F710E406
 for <intel-xe@lists.freedesktop.org>; Mon, 17 Jun 2024 14:37:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718635040; x=1750171040;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=CAT/7EQO/oqVTlrKA53hxLOTlYimuvwolVm6F649Dt0=;
 b=Vbx0+bzX/oq4E0V3wma6WURnfU+FllQ608XtJ0aKzQkeHZqHLyxQBbGS
 0hltY9gEVTIGVMxIOgxLVO6kSxlHLqXCUiRnsW5odlPVtdpKYBnUKVXHf
 zThYaI9NDVpx+zxWPxzJ8pPEtQ/2bpmjTLQCqf3qjKPfGMHTno15sa881
 zHCiBbKQPkCx1N9CTWgnJ24Fn8zJl5sGPRw2KIdQ0Lczc9S2nPCUCiA5L
 HDpScaHjn64DqZCBqcOXIE3COFZy4gl3BuMBRWijAcQ92nozhBAj5h2h1
 kgSVBJoy3ik9dhFV4qjS9C49LJTlQMYEByrqdKc8NBI0EAyVC9D54lj1T Q==;
X-CSE-ConnectionGUID: Si7z0gPER7OoznSo9d+5Gg==
X-CSE-MsgGUID: q9QS5RD5SDeU2g6Wsw0lvA==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="15304230"
X-IronPort-AV: E=Sophos;i="6.08,244,1712646000"; d="scan'208";a="15304230"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 07:37:20 -0700
X-CSE-ConnectionGUID: Z5IpPQEoQvCz1rTyZKL/FQ==
X-CSE-MsgGUID: QTPrFInERZmYRkZAKQB6NA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,244,1712646000"; d="scan'208";a="41680609"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Jun 2024 07:37:20 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 17 Jun 2024 07:37:19 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 17 Jun 2024 07:37:18 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 17 Jun 2024 07:37:18 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 17 Jun 2024 07:37:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jZyC8DkDpyzenbh53aoV9oAKgM2Ds2vSJAfTH2ZOjtmIzMg2FXLhGxtGrScHbDX1kIS6PdSArhuePmtZzf8Y0XvAwC9cRJEMqLZElasAS1F61kxCa1rFRDvN9qE1X+B7XzVuS/YRpQLcK+r6AYoQDCBgqp+aGacdOzB5f+xjYk2mRwp1dkz7wn2rSPGH0osj1DOmb8rx2elrs3LA3C448AjpixSHJQAMIm4/IapLJz9Ra41vULGP0NyiV27+AjZUe7ecByu7n/4ijRxYmxpHL1FRDDQAwzbfr+TLJ4ljuF0Pjwm050iLmL15trx1fFUCfBZZqTjKEmyv/3rQvSimIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KhI7peElHuPf90Mx6Wd/mWxNH5JllMRHe3Lw5BNByio=;
 b=Ey4lfoDjHzapIaQSM16O2tLsl3F6g0A5Ef4PBgFtaRhcdJBEF6c0m6/pqeqBee56h0Db+3WxNWwPqGIgCaIibiF62EHM/vW1G4+Cttwilo7a9xie+RBQegGGRyMqixTZPk0DJxCrITZ/x/Plr7R9RiK6YkAZPUtgqUGqcZ/3EXueeIuHag4QVOOLvxO1erZwyFYiyA9frviQselvCYClv6eMA9MwyxW7BditPGIqdhyz3d3NCQ8LjhTDxDc8o7WuKrSzvqm2VUqv4Bt+UI/h61JmHkrOTmNMKVjfXnOet1ZSuSeb3SrdAd+J0L9vZFlegur++6K+rTqSeq3lza3W7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MN2PR11MB4663.namprd11.prod.outlook.com (2603:10b6:208:26f::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.31; Mon, 17 Jun
 2024 14:37:16 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7677.030; Mon, 17 Jun 2024
 14:37:16 +0000
Date: Mon, 17 Jun 2024 09:37:13 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [RFC 1/2] drm/xe: Introduce PM guard classes
Message-ID: <kczbmwizw3vd5sw4yj34sftjfgif5yyoomo4tmlbd7lq2xwy77@punlz6twxwvl>
References: <20240617140120.597-1-michal.wajdeczko@intel.com>
 <20240617140120.597-2-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240617140120.597-2-michal.wajdeczko@intel.com>
X-ClientProxiedBy: MW4PR04CA0360.namprd04.prod.outlook.com
 (2603:10b6:303:8a::35) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MN2PR11MB4663:EE_
X-MS-Office365-Filtering-Correlation-Id: 8548e4d5-eaa4-4acc-2f05-08dc8edafc3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|376011|1800799021|366013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?LdVSqEqN2ZcwBPc65ZzH9O5egIfzFIZWiQL5HAVFA8saZF8Z7GwZozsFkMtA?=
 =?us-ascii?Q?ZfOmEtH+DUObz8JVeQs6bSn0GIZAccfGS/pt0L7I+Mew46JcO0tbURFUtWJ7?=
 =?us-ascii?Q?jVQCLsZCdhb1roNwaRKt1B75VU5XTpoNlNf6bLQfqzXwvDW4EbBIUnPleI0P?=
 =?us-ascii?Q?kALP0C1TkFnWDXlkOH5AWV8TVPBrRgF2HdZrgSfVQI21aaQdIqJ7CNdYIN4v?=
 =?us-ascii?Q?oRp/Ior6rjddoSdcuSlpMuxTyP+hi+gzuVoHGFzfKFGITxvGzUc+9bwkPKec?=
 =?us-ascii?Q?bd6PPGr5SPwy7UAd4QvJqDNsguRyhYB4sslS5GmPAY84Itj8Pa3tDscUTp7i?=
 =?us-ascii?Q?hHm5KZyEAHHyI6IC/e00dDB6ffB8SYyzv3e4QTwTx1NbXp/iA7qnLANN/VAa?=
 =?us-ascii?Q?YTw5H4DeHI+vvmHBlpsoUvRtp0Rx/1v9OpjjJS2GBd1u3/CmQn+Xvsongnyd?=
 =?us-ascii?Q?1aqSOX+ibvGc/XsvJh8asl5Srd7rCUu4rM/K+ZLF6Ap0EkX7GH0G+jfXX5kO?=
 =?us-ascii?Q?EFC+GFnquYF2KcIiWza7DRAZont72OTiIaos2I6L/VD9Loe7QclxUVVnmBPS?=
 =?us-ascii?Q?fQxfomZCfCWrFo4zc7pVmNV8MDEPs6z+UntWdECPTskgdNPZG2DpsXOQjY3j?=
 =?us-ascii?Q?Ou04nUrsuRl4BBZiNNK+73GRwPW58TnGsWAp3px8llSojhBO9fznHa0wrQBJ?=
 =?us-ascii?Q?lXd+2+ydOupBg0c7JiL00jfdju15NRVGGNqqGvwMx0N5PqzN2E2mcO+43ODY?=
 =?us-ascii?Q?3bmfH92gkV+4I7l5/GTtDCUDFOkFNlJo3Xkgk2onqN4fn0QvTZfE6iQlTC5F?=
 =?us-ascii?Q?UV142YBKU0VIvlmyBkMh1GpKcktxSjPspawsKar083MMLYjwAFfJ8MonVohk?=
 =?us-ascii?Q?tT9knbiPLnwwYbfEvevOOdDom184zVgna/NyPuf0rshVrWb5A46rEOdYqsYz?=
 =?us-ascii?Q?WK0XWNKCfvsY/1MnI5KM9OJdOAYtErUR2TWw9c/eAkYni2q4TCmBkh2CfGad?=
 =?us-ascii?Q?Cnp1MoKQLssioaISNeauP0k6ScpYRCL9z08uJ8yTZkzZ2EKEUBGqkqjBmdIq?=
 =?us-ascii?Q?hbdeXHwDXnmLXPTHoiYAmiIu+mON8n1Hgdw4C/dZkSfqlxq3ReQyNkm67meD?=
 =?us-ascii?Q?IstFOgXORlbs84wUK9e19bgeVOBYHgk8PHjyWUqMXEVYz/rEqr3flBFPPfHj?=
 =?us-ascii?Q?18CPynk4WsKtWF1+ANIsL1pq3EcOh3t10apxyicqpQVn4GmqwP8W7LbE2rB8?=
 =?us-ascii?Q?RlrKt4Bppnz+aUnHEXUw75SqxHIsyD0IY9QkqijZmCrs4zcVSJtsgoatqvHZ?=
 =?us-ascii?Q?FwTBsKIdD8QV9mMZ/OMIU7kr?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(376011)(1800799021)(366013); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6xKLrt1AMrmhpCqVgUh3lHfljL9SIkHyYjz1d90sZWnTJq+82XQaZlwoJJQA?=
 =?us-ascii?Q?OgNL8NlBAd7/jLco3wCHEJO4Wgw7wPAgIM6jsgB1Ibzobx3oOz1yj/hqdaiE?=
 =?us-ascii?Q?C3NL54U3NoXX8mjJMlRbjKfz/a24HlV8jWWRbMplJ5INOTSDl08FfTqtF2oL?=
 =?us-ascii?Q?TyL8nS6jqPfjuu5ZcSW2KleUW9C5FON+YCsX+mv/4HSnf6W7l9Za6sNSNJej?=
 =?us-ascii?Q?M/jx/cL27LeXl7aznhIdlPKe3w6bUprhH/SvKCPvow7OqbnBzLm9qbMzB0fy?=
 =?us-ascii?Q?BCkC+u8cw9ZO0MXfgPyw4u6u8W4bP1v8AvGyTEDgZa23wR8MKWCDGJ7bn/0h?=
 =?us-ascii?Q?tPvJTNa7OMhizuxwb2Bc7HjFWhEvNPwh7aTif2U+GHfcvnDiei4/AqXWRDW9?=
 =?us-ascii?Q?wd9+H2PNBkKv608rEeGUdtCOgjzm+WA2SjHLM/cdhzqmKyUUP5JjE6cMEEAY?=
 =?us-ascii?Q?kwLn0b06K702PlZVhRiFzKWJbWqVi7C9VZqoP/sYxclgG+TQKvAhWxB9hL/x?=
 =?us-ascii?Q?uAlFSb7XXXRJR47tUyXbWPB/RhB19/pYFDPaoO/NgS4PfZGnI/LxpYj4v7ru?=
 =?us-ascii?Q?EsKOWEFZsHa3nu67FYta1wnXRv42ARluXW8K20BeQqc22XIqO9Ye1zNV7RrG?=
 =?us-ascii?Q?hBRi0B6C2IpEPWZKiel8oOUZ5Eg2j1O7Z4htuwrw/jj93UWPTfUITsjmvVVK?=
 =?us-ascii?Q?Ki2ZV212usYUSy4PH0q+DUSM1gpWv5yjwLnzZvo+UwXlgGMy+FCkjjndeRDg?=
 =?us-ascii?Q?hNalMaSJPZhJx/sRY3WVUPzY4etmA34S8X1G2ERS6GhSxTQlc3JrzQpQa6q9?=
 =?us-ascii?Q?pCfpt4Q9KiLeA/HJJoE1Wor3hvIXqepTL9AmaRMw7l3B6XYsCHZmDv6hiTJr?=
 =?us-ascii?Q?pfkLWOxTQvlxXNWXIPqRg8VY0b/3r9vhNTglWbhiAg5SuDV3Zd9tma/OArKA?=
 =?us-ascii?Q?15QHTwWH9mMTlfTz4rGxJg+uBro68xLWFEw2v5Tqoh4w/Th5dhxuCVhO6+li?=
 =?us-ascii?Q?XfdnEI4GeSSNU8vsICnCyKlM8mcc+PbQEvc4BQihrALlnE0JaaOaKm8/PBGd?=
 =?us-ascii?Q?zaDJx/CHD7xvK+p3pD64vhuydqgF0ZxbFsnUi5h+5y9DX9gTwMHheO/lG6R2?=
 =?us-ascii?Q?t3esrJYFqRjhIDUWBzgDdsUlyY2mo7s0LLLSlx/OJoQEQHi9W6Txof6gJPXY?=
 =?us-ascii?Q?3Zm4xeXiiH6Pl3Z1xn5LI7Ufq1plPBfWzOAbmMcpipZISxEO+I6WxZ6m160X?=
 =?us-ascii?Q?WqCxBPJgm4Dibd1VIpJonlU3wa3qhOxp9X09Df8YCkDepZpp+fsfP77LBUtb?=
 =?us-ascii?Q?yLl903FB638QjzHuSUHr2La1sS7QYWK6UCZ91DDODSHUV7HpXQAN4b9eemSh?=
 =?us-ascii?Q?R1RA4Lqy8BLkiEB1FrmG7i/suWoobq1lveWpT0j0exJIPho7XlFj1A7jP+U0?=
 =?us-ascii?Q?KCpo59auVIeH6CjydqZihQ/lK9chfg/4bD4ZY9mY8pUszmX+ieIc900Ub1pL?=
 =?us-ascii?Q?z2a84aR1gYETe4q2PtOFIcDFCxsPzod3LaC7YCheBDVQ9kxWJd6t5RHus+4/?=
 =?us-ascii?Q?RpvM1adZa2JFvHY8R2Ju9Kwn0DrdhbR+ODcT1e+GliukOxAudBRWR5TNw5tm?=
 =?us-ascii?Q?6A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8548e4d5-eaa4-4acc-2f05-08dc8edafc3a
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2024 14:37:16.7001 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jlI7p6D5c/eYIxYGkP6cteZ3j96FTpPv+7tPVIoDPdvmyKGsM2lpr35oLjHvxUHdJPaSQyuuhgHRrHgXjBhBIjuWHVSYhpVd9mJ9YKJBsm4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4663
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

On Mon, Jun 17, 2024 at 04:01:19PM GMT, Michal Wajdeczko wrote:
>There is support for 'classes' with constructor and destructor
>semantics that can be used for scope-based resource management,
>like our device power management.
>
>Use provided macros from linux/cleanup.h to generate required
>code definitions.
>
>This should allow us to use:
>
>	scoped_guard(xe_pm, xe)
>		foo();
>or
>	CLASS(xe_pm, var)(xe);
>
>without any concern of leaking the pm reference.
>
>Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>---
> drivers/gpu/drm/xe/xe_pm.h | 5 +++++
> 1 file changed, 5 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_pm.h b/drivers/gpu/drm/xe/xe_pm.h
>index 104a21ae6dfd..26293a3b18af 100644
>--- a/drivers/gpu/drm/xe/xe_pm.h
>+++ b/drivers/gpu/drm/xe/xe_pm.h
>@@ -6,6 +6,7 @@
> #ifndef _XE_PM_H_
> #define _XE_PM_H_
>
>+#include <linux/cleanup.h>

Cool, I didn't know we had  helpers in the kernel for attribute cleanup
and friends.

> #include <linux/pm_runtime.h>
>
> #define DEFAULT_VRAM_THRESHOLD 300 /* in MB */
>@@ -33,4 +34,8 @@ int xe_pm_set_vram_threshold(struct xe_device *xe, u32 threshold);
> void xe_pm_d3cold_allowed_toggle(struct xe_device *xe);
> struct task_struct *xe_pm_read_callback_task(struct xe_device *xe);
>
>+DEFINE_GUARD(xe_pm, struct xe_device *, xe_pm_runtime_get(_T), xe_pm_runtime_put(_T))

per linux/cleanup.h doc it seems DEFINE_GUARD() was intended
specifically for locks though:

  * DEFINE_GUARD(name, type, lock, unlock):
  *      trivial wrapper around DEFINE_CLASS() above specifically
  *      for locks.

we probably shouldn't abuse it or get the doc changed

Lucas De Marchi

>+DEFINE_GUARD_COND(xe_pm, _if_active, xe_pm_runtime_get_if_active(_T))
>+DEFINE_GUARD_COND(xe_pm, _if_in_use, xe_pm_runtime_get_if_in_use(_T))
>+
> #endif
>-- 
>2.43.0
>
