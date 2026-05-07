Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 871FACD3439
	for <intel-xe@archiver.kernel.org>; Thu,  7 May 2026 00:28:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3762A10EF0D;
	Thu,  7 May 2026 00:28:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KlPvBWRJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7909710E21A
 for <intel-xe@lists.freedesktop.org>; Thu,  7 May 2026 00:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778113695; x=1809649695;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ZVFXtPGzXKn/5EhkGdSrJuFgDq3FLf3ubhkzwk64z0A=;
 b=KlPvBWRJjpFd3/9+lQTUQKm+hnGoNjDXZat8ueEIEUzW8y+nOUMUV05c
 61H7pQDR0tmWPT80ETi81h32abIuuTpLIGjIk/1FZHVppi2e1XNYy/FZY
 5GsnHsHCiPMsHmUl5sRh3LwUveNN1m2ragdA3xF1IvKDFanor2nIrq7Fo
 bJeetgZ8/DX8Yw0oYvlEYyec2Ot+0+uNs7vqr29GpNk9pcu7c4jkXUGJ2
 RKX7se8RV5QXaAZt+xP5zUE5QYWN6Fyt0GWYstedKBktXMnu145r+G1/8
 orbG17QCcXXEodcEmEBfLknH2O9lUOg3DhHDLD/wnwLHf7rQuc576xx5l A==;
X-CSE-ConnectionGUID: I1g01sGgSFCbt7KgaNoTTw==
X-CSE-MsgGUID: 2gQy6aK/QuCOTvHnuipmsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11778"; a="78208317"
X-IronPort-AV: E=Sophos;i="6.23,220,1770624000"; d="scan'208";a="78208317"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 17:28:15 -0700
X-CSE-ConnectionGUID: EvSePoA8Tx6SeKLVzPFjlA==
X-CSE-MsgGUID: A8In0nkuTci4za1ek/JDyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,220,1770624000"; d="scan'208";a="236227060"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 17:28:15 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 6 May 2026 17:28:14 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 6 May 2026 17:28:14 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.16)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 6 May 2026 17:28:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A9FvvbNbxBKcG0oF+TCLgjrt5rPFhka3uK+jE2VQNuThx/cIIhnieEasNnK8fVEz2Akd1N78DbLfkwqPcdyPnfQPzegD339f+r8T2c7cgHllw7+a9jf7RE23LAShUaNfKqi8DVcPrSJt8a1ZsaGvrLdrVe8jWpU4m5ow8KtKctzciBX/TGQkQJXd/oE+XEa/9l7vumiBnxN0n1o8eSBCStpPU1Npy1gvcP3kffSAaGthS9JGoi4oVtSMMDfcY2+CgxbfKfU/q7n9KLt39JDBQyLw/8TEhO7zNsW7aSQx381pGv3oIoB4upyU0LWfa5QFvIqcIauBSWf1tgK9UwrHtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fzp/Gh7271sbsvYdN4Ah7xvlm3SxbOZY7GB4fu/jMWU=;
 b=ETI+sPANt+IxHihzYcfcwrMtnaQ2qKihXvdNCizBupdkOWO7c2+PmKJbLG0lfVJEJ1uxgP74uDW0xmUGYUSX+eDlFF9lDfd9mRaEts368i0kalxuKlw+a/0AUD57RuvfV2XCfLDJZmzf9KN86Un6l+20LJXrj6ms8kZrLFPq65EHtvGVfVmMg6GwiJO+Oox93r/sigoRQsVhvvUa0EL4PEgp0CTx3TJRSBRfKEHmlXtdBpM6BaO6mMAUc8Qpe6CcBpUTV7jB37tK6XsZasfCucTJ/FGe2+2sYHUOuN58/0SPEE1zLY9K1w+0lCTIk4ME03XI1H5AlbjyGBJ7rUTwag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by PH3PPFF8B8D6872.namprd11.prod.outlook.com (2603:10b6:518:1::d61)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.16; Thu, 7 May
 2026 00:28:10 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%4]) with mapi id 15.20.9891.008; Thu, 7 May 2026
 00:28:10 +0000
Date: Wed, 6 May 2026 17:28:07 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.brost@intel.com>,
 <stuart.summers@intel.com>
Subject: Re: [PATCH v4 09/11] drm/xe/multi_queue: Add trace event for the
 multi queue timestamp
Message-ID: <afvcl-3Yk-PR2P_p@nvishwa1-desk>
References: <20260506223500.3769614-13-umesh.nerlige.ramappa@intel.com>
 <20260506223500.3769614-22-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20260506223500.3769614-22-umesh.nerlige.ramappa@intel.com>
X-ClientProxiedBy: SJ0PR03CA0152.namprd03.prod.outlook.com
 (2603:10b6:a03:338::7) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|PH3PPFF8B8D6872:EE_
X-MS-Office365-Filtering-Correlation-Id: edcd2b97-b1d2-4ca0-ea92-08deabcf8481
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|22082099003|18002099003|56012099003; 
X-Microsoft-Antispam-Message-Info: hAbAUSJsjhWCm3DXf2QWPFvsj6TcS0qEZaY3OK42ZgJ/NMmqsyxQ5FkE0yWY4D6yaybAVCXfQvPyOg/waFyd3ECrtpObeJy4+lrx4X7LVr3B8S7UOapEYATCNrtNIkUhtEJwXp/X5oENxAZDkJtzj9TMuZ/F008sjARB51b2xOQT/6PAXFrB5Nb8ihFzHwa+/8es0WtUm7aaIaw42QRxV65cSJRTs90bbdmnQ7Cc+5u9Fmg13bM1iQLO2qGZ1zj6RcPR+Sx7oBV1lLQUED3isPetZTFAnmOfcActyYlghZUrctJ0/v8l5Nvgonf0E1zPZPr3zMprhKZHISxuKfU2OlPMoqDbpI8QOwjsYB1iOfjs+FlKh31GSqQSuuI7BToVvDM9cqDKB7RUKS2YygLj/vZqHLhanljmyrg1LLnyg5ExCCeQlI/XdOyEUKamHsA/InCky0oRV1CCmJW+9W9zE6KUgiq4S9WOYW++H/rrfydvvPVzlNeqHxFHdjHoryilTyV9aHUKvHJmMuH7/v6IM9GmOPeko3X+W50BiCFjc6OLSE07pWvEKU/04wASQ16pHIp84WydsF5BcvEwJfVkxi20yPXMi/G5vlBLzgEzfweDzYNM5mNJCRzvTpnY9RjUvXvfk6gjGYVneW0XJgbFutOCr8AQyNd24kXJq/dk5GOTiWj1812aCY7Nv6ZaNgtT
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vGUW8ha9qqbBY+2WXEWL0X66rBYEW4wxI48ISTb6NfCWxg5vG8AxfooMfkFD?=
 =?us-ascii?Q?oRi2eZWI2oO4Q6seQ4NC501dWwJooVEuQcLWDks0o/PwnpbmxvpFvisvXZxk?=
 =?us-ascii?Q?awK+bFow0a4h0Vu5dNXAS3PXsbdPWOCWEZKrhqYMnVc6eKa85tNhn3RxjihP?=
 =?us-ascii?Q?96Ztmd+9lqco58zOTbu+NCwcj2WO0T3gSMX6xdl/tAMityxHyhisIyGq9rXq?=
 =?us-ascii?Q?LY38Ou6MQBmuuB100U0W/SHcZFUAPTUV9giWIr3vtIEXH+Pi5lFOYF08K5Ff?=
 =?us-ascii?Q?YMg4B3Cnz6gPyRCzJv7ki4SHJ331t++CINQaVmcaxhLPcZLTUV3B4qppCARa?=
 =?us-ascii?Q?LGxNOpxymSUvV8CvPrNqXiAmOy3xdRv/+ubkqwuCB+5JBA+jh4rL9sLkW/IQ?=
 =?us-ascii?Q?3pz2I5RSqcBlcrPmSiF8R1rc0fhEtqOtHGYHbS0cqh+Fuq39a9tvxaUxRIJt?=
 =?us-ascii?Q?HCUMvv2wMEcnwO5Wo69aNBRxwoYcAdGrTuQKYAgxrOf2kVyZmpsw5aI2kc8z?=
 =?us-ascii?Q?NTA4kYwRCKh23yO91WKPCDJJZtQm6zAcu9EYfVWAkDSuOnaDslZ4rYJimShA?=
 =?us-ascii?Q?esbcFKzoXu8mkUvdNfteL3bzhW8zXI8/fl5snTmSwcxGOuoxfn+JrbLfhF3H?=
 =?us-ascii?Q?vS0mjrn44gqa1hws7e4qssLFr3ytQ4LGmlr+vXiHqzAZ9fip4vJ3Sgd8LrSo?=
 =?us-ascii?Q?fUkXJUgzQ0vjEQv3SxFO1pf894E1r3qmHeYPR9pJvToVJeuN0ZUBGHatHNJ2?=
 =?us-ascii?Q?/3C12aEaXQX7Gh+ilLIg9Plv+PuhU8Bv/C+lCM87zsjcfuBMRk6DKX+4Cvm4?=
 =?us-ascii?Q?Lbjyzuu8gdx0n91rXVvGLIYTEuhdPTucEBy88AF2dSYZ4o6bsf1ThhH3tDLr?=
 =?us-ascii?Q?QV5Dd03v24v/w3t+dNqof0WfaPI5Iwp/5VsEBnqPySZuSyVF4j5WwXJWQ7k2?=
 =?us-ascii?Q?CQ+sQSFK+inNpjFvpiyVQ5d40OHwsfNb3dmt7b1hA2tqxuvYH1H+2X/fy8JH?=
 =?us-ascii?Q?atJeTMqvQBFJFLgd8WEaRhXtB8WGb1EG7jfzuGf9TY3fNzykFnKWslaumivN?=
 =?us-ascii?Q?XhaDtEq6r1gAC/2W09CmPzYaIo3BqlIjmpfv8Rm+5yQFLLniDLjkwyns/NAG?=
 =?us-ascii?Q?4B5+RsxxzvvYo7KGcPj2xdtj9UmB9RVzbM9e2Cm3a9kvbm6TWjbr9ZM1YlA4?=
 =?us-ascii?Q?vgeAmh+/7alblzqyNtErPEDN35stQtDDe/mg/T5R2bVY5/LY8WVK8ttxlwXc?=
 =?us-ascii?Q?4ImCfqTA4XvMNaq9jznKSt2YoLrLcQQJmQaFUv6nmoDgPwNX9yQxb1GWn942?=
 =?us-ascii?Q?FfaFvRaN/e0ByL1Ky3Kew0WLsex292hSUztXz1azmKYd3Iubq35yoh5R2CJ2?=
 =?us-ascii?Q?EY0qtnL/BcGNKadUQQWKwAP+YHlzI04eTNdSAQ7S/+LYh00P+0rv8GItkOt2?=
 =?us-ascii?Q?bauKc+35idvXkpKAJwCRie8C3rPmCxZGcoXDxgDduQ38avZRpcQ79o9hvQ9j?=
 =?us-ascii?Q?s436M9csDXv0dy9aBoSS8pz7EybQ6I9Fr/qgjsyDKXNAazBf4XnKbv2p9K/n?=
 =?us-ascii?Q?yjO6E3ImIU1JRxJhXnx6XK1tyH/vDqKGQdevAAzuBxJTeUsEhVvdCzq7mVud?=
 =?us-ascii?Q?OAqqL90vyqCNSkaOEbbBB0TeAEzWISXJB8qpuvMgGpkC3go5WcPhQPrMa2uX?=
 =?us-ascii?Q?bUezTSRcsCI+vY7PWp4+PZJLbWZrg74y6YB9mq0ukrDo+Ds8auoshyfL2BMV?=
 =?us-ascii?Q?3krZpCMU2zsCYK5SD/KNdZVnsvcIzzy6PmWib3cUXHReCJhFkS04?=
X-Exchange-RoutingPolicyChecked: dtcVzDPZsqZzuLDX4Cpj5UoNGrvTk5nHJWPdyQmGf0T/JHqWnkvFXvQLeXjmnNKFyrBMgEOVBaEj20O/VEaAHSLYJHkOVEh6QYhicciwt+Md9704o5s39YOwfgo58wuYhx7ZzwdSIuxrfp217ZfCq2nrVci6O8Er7OEEglIo29r3ehalSCUaFb04qqr5IC/4KQLFs9UESsMkMwMjde6l3O3BfLZ4qnI+EvEd7PSzHU8+nmxpR4BR4sU+Sr36BJ1tIgLjqsAWTo8BSTKqiU6zUW+v/6V6BXkF7dsshCX13iRb1IFK7iF0ujFucaKmuBl14wiCTPWypKJYOpHG4Pem3A==
X-MS-Exchange-CrossTenant-Network-Message-Id: edcd2b97-b1d2-4ca0-ea92-08deabcf8481
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 00:28:10.5202 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4by4QEjdwzes+GRDdLzLFp9r6kSon/wu+/5FqaRPsvkeP1Gl1v+j6OP9bsxXOZL2xkIghQK4Nw6GAWL/PjteLvAUb6XXcumYIqBMaIVGvJVWyMPv9BGgyscps5YItVEZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFF8B8D6872
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

On Wed, May 06, 2026 at 03:35:10PM -0700, Umesh Nerlige Ramappa wrote:
>Add a trace event for multi queue timestamp capture.
>
>Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>---
>v2:
>- Split traces from original patch (Stuart)
>- Print primary lrc in the trace (Niranjana)
>
>v3:
>- Include primary_lrc as well as lrc in the trace (Niranjana)
>
>v4: (Niranjana)
>- Drop pos from trace
>- Drop ':' before the pointer value

LGTM.
Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

>---
> drivers/gpu/drm/xe/xe_lrc.c       |  2 ++
> drivers/gpu/drm/xe/xe_trace_lrc.h | 27 +++++++++++++++++++++++++++
> 2 files changed, 29 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
>index 869ce0c09939..cd5daf628a89 100644
>--- a/drivers/gpu/drm/xe/xe_lrc.c
>+++ b/drivers/gpu/drm/xe/xe_lrc.c
>@@ -2723,6 +2723,8 @@ static u64 xe_lrc_update_multi_queue_timestamp(struct xe_lrc *lrc, u64 *old_ts)
> 	*old_ts = lrc->queue_timestamp;
> 	lrc->queue_timestamp = xe_lrc_multi_queue_timestamp(lrc);
>
>+	trace_xe_lrc_update_queue_timestamp(lrc, *old_ts);
>+
> 	return lrc->queue_timestamp;
> }
>
>diff --git a/drivers/gpu/drm/xe/xe_trace_lrc.h b/drivers/gpu/drm/xe/xe_trace_lrc.h
>index d525cbee1e34..5c4cfa0c1fe9 100644
>--- a/drivers/gpu/drm/xe/xe_trace_lrc.h
>+++ b/drivers/gpu/drm/xe/xe_trace_lrc.h
>@@ -12,6 +12,7 @@
> #include <linux/tracepoint.h>
> #include <linux/types.h>
>
>+#include "xe_exec_queue_types.h"
> #include "xe_gt_types.h"
> #include "xe_lrc.h"
> #include "xe_lrc_types.h"
>@@ -42,6 +43,32 @@ TRACE_EVENT(xe_lrc_update_timestamp,
> 		      __get_str(device_id))
> );
>
>+TRACE_EVENT(xe_lrc_update_queue_timestamp,
>+	    TP_PROTO(struct xe_lrc *lrc, uint64_t old),
>+	    TP_ARGS(lrc, old),
>+	    TP_STRUCT__entry(
>+		     __field(struct xe_lrc *, lrc)
>+		     __field(struct xe_lrc *, primary_lrc)
>+		     __field(u64, old)
>+		     __field(u64, new)
>+		     __string(name, lrc->fence_ctx.name)
>+		     __string(device_id, __dev_name_lrc(lrc))
>+		     ),
>+
>+	    TP_fast_assign(
>+		   __entry->lrc = lrc;
>+		   __entry->primary_lrc = lrc->multi_queue.primary_lrc;
>+		   __entry->old = old;
>+		   __entry->new = lrc->queue_timestamp;
>+		   __assign_str(name);
>+		   __assign_str(device_id);
>+		   ),
>+	    TP_printk("lrc=%p primary_lrc=%p lrc->name=%s old=%llu new=%llu device_id:%s",
>+		      __entry->lrc, __entry->primary_lrc, __get_str(name),
>+		      __entry->old, __entry->new,
>+		      __get_str(device_id))
>+);
>+
> #endif
>
> /* This part must be outside protection */
>-- 
>2.51.0
>
