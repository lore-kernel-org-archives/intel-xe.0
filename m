Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2837DC021B8
	for <intel-xe@archiver.kernel.org>; Wed, 26 Feb 2025 17:20:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5CAE10E970;
	Wed, 26 Feb 2025 17:20:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IvCqYIAO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6753E10E970
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Feb 2025 17:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740590425; x=1772126425;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=WFujw2PBx3/kOMYbqfwYO3//MBVv+/VrZ3sMYX4lnQs=;
 b=IvCqYIAOL1q35dYIQfKkdDENn8K8Lej3iCDBuA7HahTdSCwSIstrHJHV
 xApSNMxSqMCphRH9AlNtCnxt8TqM0eqVeR08/E6EF8ItHWC0WD1e4oHLi
 iLHg+Kq91cs7oXeYujXa3hxnJJS4ITd2oQPZInETUKM6mSn+5PSSIW/aw
 vOW4rPV0YvPuX7Z1A6X5trDuP1liuIrXolVIhIpaoJZcEuupPH2pj9Jny
 EZoP8t+QP3ib3iLK4caUYNZLEKF/7i3oWa2ME4fKJwHNoAfC33m0wG417
 QmFZtVXbzhT7qUd0jRWtJiFiUWswt4dF+rc9BuofDsul6K8PFbqx2vv3S A==;
X-CSE-ConnectionGUID: ZGmyow4XQDOUejtCNyzGHg==
X-CSE-MsgGUID: OYqpnmveSuOGhRb2voU3fw==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="41330571"
X-IronPort-AV: E=Sophos;i="6.13,317,1732608000"; d="scan'208";a="41330571"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2025 09:20:24 -0800
X-CSE-ConnectionGUID: 75RdJGr3Q0uAgrWtMWXKBg==
X-CSE-MsgGUID: WEl5O7XlR8W4W2fQ+a9sZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,317,1732608000"; d="scan'208";a="116582741"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2025 09:20:24 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Wed, 26 Feb 2025 09:20:23 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 26 Feb 2025 09:20:23 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 26 Feb 2025 09:20:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bqJWPx7pAZ1QevfGzn0sTIsjCxY9lChpmpjUege0CDKRqSgMIyGnnO0IFtA6i9WkCnXgM7KoAWN34+zjpBGR9UCrplVq4ydCms1u0vtFgMGehmlEmsFgcDGTcnYWhIc3MdDFrzdPjXcNxNSWRD5pw8MYhvF8PElrszfkINo/BFqutTiAI8gQzGGA/Bywq+tLiHQ3dbNYrd/zh4dFgPx1L9R2v03+Z5a4qQd0MMxDuZfx2QysD6RbRKitaLmQ/P7I5nEbWF2O/J0JFBKk8EWeRb4oZo4zMANDTLh8cb8x3b1Vd5FnuBVMI2VPJwzx9epu583gdliBLKJNf2OLA6lYCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y+mjLCWO3iN/0ePNWr7yPcqcnUouMW9+AyhmEMx6aYU=;
 b=aen6SSLFWwh41G+h97J2DcVy3id0nQPZZAYHAiTZQbtppwZHht0AtTlgQAEySrEq3Dhwu0vEpHEEjX3SzfPTG4UuBcAFparhcarc2T+ekoKlUpu7Sxa0IYmUwDr7p22hVFPdWvN8DH9x4cqkWlrtQjpel0VmgXVPWrJC9tx2Fal7ThCIRaAH//rZQYplohD7ZSt+DVZr/8uru81IT+ggdxw4Z9e+DTVHoJ0PYoQ3SlOpgH+YY1DXADW3XV11+o6KbElEkSad/fG5XjNqOYkSCBHe0mbSGztxP+2JX/wqm6zo4/ukA7gOvEBJ4MyQAWnp4peR+O+DqXQubpA/H61q0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA0PR11MB4702.namprd11.prod.outlook.com (2603:10b6:806:92::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.21; Wed, 26 Feb
 2025 17:20:19 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%3]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 17:20:19 +0000
Date: Wed, 26 Feb 2025 11:20:16 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
CC: <intel-xe@lists.freedesktop.org>, <kernel-dev@igalia.com>, Matt Roper
 <matthew.d.roper@intel.com>
Subject: Re: [PATCH 1/4] drm/xe: Fix GT "for each engine" workarounds
Message-ID: <sok4xz6pvdkm2ru63xy2lqv2vj2ogcemvpaygqz364nqqlxxgw@6gqxlzjilaij>
References: <20250226112106.28173-1-tvrtko.ursulin@igalia.com>
 <20250226112106.28173-2-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250226112106.28173-2-tvrtko.ursulin@igalia.com>
X-ClientProxiedBy: MW4PR04CA0033.namprd04.prod.outlook.com
 (2603:10b6:303:6a::8) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA0PR11MB4702:EE_
X-MS-Office365-Filtering-Correlation-Id: d41ed8ae-5063-40dd-51af-08dd5689d822
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?oxj+6RlvV/55DuZziYH2sIhoBr2WiWjOGQcR9o5tmHs4LcVi6rnoGtI/Tocm?=
 =?us-ascii?Q?6YhW9SYN+r9lM8FNcy+WH+3XR9tUk4XlSRtUFnxrC1NS7buqGfhYRCIV9hLL?=
 =?us-ascii?Q?i3FUESboceBWPFm8SpIwft1wlndVpD4COra/toUi46WBguJwFSbWEA6g0w+D?=
 =?us-ascii?Q?gfvqGqCKY3pGPhwzS5IIoM27vtKBiRXDo1HS/GPkml38Dtc8e8iDbgrT7JPQ?=
 =?us-ascii?Q?ok/o/pziMffDtARHovM2Xmo/+1vulNJc1ak07/Pw6s74erimag7jdbdsAy43?=
 =?us-ascii?Q?S3MkaZJvqzO+Op9ErYHwAxKKwvTsKO5eKkKhdHjDEbwm8N/fVvh2Mq8e9rLv?=
 =?us-ascii?Q?iI327NiCcDxoDAMmEQFNea5mafGDeGGiZK28iRFiPteJDxN4AnTLVAgL97uS?=
 =?us-ascii?Q?FiK2Ylpa/8zvUx56CpvcEQNIMEkxmu5Qf83j1XApa9ax/gDbrPW3Rj9Lw3u+?=
 =?us-ascii?Q?gjaB+14x/gbR5sJRw0yTGp3WHZgpN/LvhVmn4Bi4p7XiBH36Bb4QNAvGgTqn?=
 =?us-ascii?Q?nKoG7YtopfVua5xxnXlCVg1QUUPhzpPHguKU4SuyTMMr40zhQTLowV99rDml?=
 =?us-ascii?Q?VanZetK6tMi/bd8lDzzHvhiC7yWYZgZ+80Y0aP2uzh4ivHa9taP2s0S72sbh?=
 =?us-ascii?Q?LL+XQIDMoaJ1kvgTPoB87dQfSVAiIIiSNmTlOkoom29iYdbkRP44qnKrOQWa?=
 =?us-ascii?Q?UqLN5jeXXsM+ya9iVwSkKOY6k4AJAbN6QD2LYoczGjwDG45qCX+cCmQ3D3pT?=
 =?us-ascii?Q?45+d0M4ujD9nBhLDUKo7R98fcikYuWQ1tbcMTTFutMslyzvBFRbLnrCmowwF?=
 =?us-ascii?Q?ARVqi3WhIxOSd6/ZHqX5Q3EAei+w1Ou4/WBcA6EJeG0f0ymXxHpgPpxpTH2B?=
 =?us-ascii?Q?uKU/hFIJl3IBP+LcEKQM6r8/1hyT4OqxpFVkY5ysfzqYYTUdz16J4GE5ksnV?=
 =?us-ascii?Q?kNkIdZwUyzDF0SamocNGA9FFeqS2noFiui5F24yv6yPKwVaEPCfWUQneRYi5?=
 =?us-ascii?Q?Yj2RFhJAwHslDGPeTnJifdXSy9jBIxaUr1vhO7Op/Ou+pgSXi7VlfVnnbsnu?=
 =?us-ascii?Q?5G/tpbPJYu4+ainI+5w9wf2Qz+KzqWT/2Kwty1YN0MzlgLdXvMUWEEejN9rq?=
 =?us-ascii?Q?ffWUZVaQVwujp62YzBTHiS6e3UteizzcHiA1s8dDZgbL5NPF9CP72SODuLjA?=
 =?us-ascii?Q?lYOP5j1KTGD8XQMUJ4oNMsNDDPRxSg3AFEhHiVZY2qqkSOdVjBN/JoGU8vis?=
 =?us-ascii?Q?O6ILNG9OUV8I17liEs4Ow+gUx9/OHoeDQQg2ctTPOAYstdUddHr/HvyWtxTh?=
 =?us-ascii?Q?cZ5lIA0NdBMZ5aOZZmoLpPsP0NcTm7tJkauFLkKRwUv4Q8MaqJSTaxveXsj3?=
 =?us-ascii?Q?H5M6AHZ85xTAnfvwp/oGUrHLQaSZ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?x+thV2CpNw6bIe61M6lZJTlKu8lOkmBPBrG+4qlDRfDGbhI87HNt2oAix1xn?=
 =?us-ascii?Q?821kKyisKapTdLV1xVjGdX40uqOpsngZqOS1lij60Sr5LipzPHYuto+9lYQv?=
 =?us-ascii?Q?LpMsfuNoFMJmoOAbbPNt9P2dqxtumR1gRX63VUIXukOoRagIND8S8VoseZwr?=
 =?us-ascii?Q?1kzMmqOX0ect4cTZApPbeD6AJ0y8zsWV1JzxGnqFxfSeFk2nlaIMNTjCgJZu?=
 =?us-ascii?Q?+6PyLhpg7pfW2qHZdXcYAEbIp5iZiN953h10PZmy/ZHstkvnIT0Cwa/TGT+h?=
 =?us-ascii?Q?LdFMI+zxhWBrCPCbkfwDLrYOjUdj3Yzz8CSMwbIyVD//BhvfNsQ1c3vDyznY?=
 =?us-ascii?Q?8fZtNm9SoUf7/H/+Pj08cvm74J2C2p7AA4npcVFxfMSVdfuk6fydVKDzmdTZ?=
 =?us-ascii?Q?slqh66CU/PlFZsMz4WL6BOjXd3sNRHSig+T/qqPUF194tqT9pxzm/PPvwDdr?=
 =?us-ascii?Q?ynC0675l2VIrXuJ8/SzZZgluKTPfOccxYnM5L8KXbieo2Ysf49MQHrDYzsNu?=
 =?us-ascii?Q?mP8YHjTGf6WxDGxpaMKKP84DCk+MknDq+PUR1qp8etE5ys0r4FP2IKbNYs1t?=
 =?us-ascii?Q?IE8yhumf7I83zKC949K3Bu0+ebiw91wcQ/XHh7njHRAJhN3jYFi1k4K+C0aq?=
 =?us-ascii?Q?AmMLqULC6bWlyoJ+1uLm5QmCdE+oQwTYqnGYLpN+Y3lSXVj/Gm90dmNQ3Roj?=
 =?us-ascii?Q?N8G66zU37l1EJ6D1RCCLpM8LupAP15jVuAl4Q3a/Z//1SiLeu7PgjYLwnB97?=
 =?us-ascii?Q?V/deJvka7F7EvvXeZPKqyZuDgtneuiXyw4JnTkZAHYxLIWCfQGJHmh11cMgr?=
 =?us-ascii?Q?l8kCObIOcrhST9KNk+vBYeeACObsPhACHQA4KE1PcKrdEiOfzxzxgw3D0PaV?=
 =?us-ascii?Q?lNp8dMGRNBNQrR1Hic2VUO5YCjPDDtNZ7QUfiMdD3LxhrTghuljik4TIROy4?=
 =?us-ascii?Q?HKSneOu4YOioEXZwSytlw0NjuxjGpCd2YxgLwbZhPYeSKXjUaF3imR5upFI2?=
 =?us-ascii?Q?SGsRwP5xuEJzQw4nGoubIUGpz6n/Pk02aAdXLctzS7mYwfXyTngabrNG05ix?=
 =?us-ascii?Q?EFRMi6EPVZgEoA4fX4Qgou49PH16ew6n8WVhfU9POKqOTz7xQ5+J+uFjJpE8?=
 =?us-ascii?Q?PTt2It5x2SEMOvgdVBh4R3zOJaZU++MjOrC5NDSiMHoGpaVt+1QR0V4WRKV0?=
 =?us-ascii?Q?XroGdcsqAYN3dMvFtyCRxVG8G+r2RqEynqSshn8LXM+5NMhu7GSJxQRemlH/?=
 =?us-ascii?Q?iW9yhkhMJ0ciRa3nODbM21MuVkZj5A9y/9Miss3VZlT3ONqSwcjv5aog72Qs?=
 =?us-ascii?Q?Y5Ku//tbvLjVeVFIvg6B+kXT9gV0mdH3LXfK85cspPdSv5z/T/6OhWzZ8fxt?=
 =?us-ascii?Q?L5JDBrusiHd1bzLJW10aEBKaf8MVN9cR8YCtQgc3A5rLm4M8kl2kEFz/Btbo?=
 =?us-ascii?Q?+p4KeGLnZnCpucvFuh2/R9kbxpLdeaUcKGU5ocy8kUWUgZLPPstk1+nUTh4b?=
 =?us-ascii?Q?JIjB3Eq6rhrs09Hw5l4u3TO3G6TfFzNijAwCPn31vbSFHdJgZWBPxB9fN0sS?=
 =?us-ascii?Q?yY9MawrDOW+wdsx8QTpCTaHTMNvLiUivwhvCxBCVG2I05QLEle28o8MbaioC?=
 =?us-ascii?Q?Hg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d41ed8ae-5063-40dd-51af-08dd5689d822
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 17:20:19.5099 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dIzbyOLNQm4pIncVZ/FA+FpUkRKyi1eDChPeuU8rk94bKkz14FIpGeUWTfb+TMLsbszwJONzZNJkyUfjkTKYQFXxOljQp4r8dz+PEeBZhKk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4702
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

On Wed, Feb 26, 2025 at 11:21:03AM +0000, Tvrtko Ursulin wrote:
>Any rules using engine matching are currently broken due RTP processing
>happening too in early init, before the list of hardware engines has been
>initialised.
>
>Fix this by moving workaround processing to later in the driver probe
>sequence, to just before the processed list is used for the first time.
>
>Looking at the debugfs gt0/workarounds on ADL-P we notice 14011060649
>should be present while we see, before:
>
> GT Workarounds
>     14011059788
>     14015795083
>
>And with the patch:
>
> GT Workarounds
>     14011060649
>     14011059788
>     14015795083
>
>Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Cc: Matt Roper <matthew.d.roper@intel.com>

Cc: <stable@vger.kernel.org> # v6.11+
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

The version in Cc stable is because it's what matters for officially
supported HW by xe.

We've been using the reset domain to decide if a WA is an engine vs gt
workaround. Although I'm thinking if it wouldn't be better to simply
drop the FOREACH_ENGINE processing and move those workarounds to be
engine workarounds. Matt, any thoughts?

thanks
Lucas De Marchi

>---
> drivers/gpu/drm/xe/xe_gt.c | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>index 650a0ee56e97..d59c03bc05b7 100644
>--- a/drivers/gpu/drm/xe/xe_gt.c
>+++ b/drivers/gpu/drm/xe/xe_gt.c
>@@ -361,9 +361,7 @@ int xe_gt_init_early(struct xe_gt *gt)
> 	if (err)
> 		return err;
>
>-	xe_wa_process_gt(gt);
> 	xe_wa_process_oob(gt);
>-	xe_tuning_process_gt(gt);
>
> 	xe_force_wake_init_gt(gt, gt_to_fw(gt));
> 	spin_lock_init(&gt->global_invl_lock);
>@@ -450,6 +448,8 @@ static int all_fw_domain_init(struct xe_gt *gt)
> 	}
>
> 	xe_gt_mcr_set_implicit_defaults(gt);
>+	xe_wa_process_gt(gt);
>+	xe_tuning_process_gt(gt);
> 	xe_reg_sr_apply_mmio(&gt->reg_sr, gt);
>
> 	err = xe_gt_clock_init(gt);
>-- 
>2.48.0
>
