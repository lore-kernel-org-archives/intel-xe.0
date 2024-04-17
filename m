Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB7B1C4345F
	for <intel-xe@archiver.kernel.org>; Wed, 17 Apr 2024 03:11:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88C411130B5;
	Wed, 17 Apr 2024 03:11:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nQczDFjz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5699A1130B5
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Apr 2024 03:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713323498; x=1744859498;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=2Qf1Y6Xpc2K5S3jbxG8tST4OY5aQ8q+YLoW7ByQ9oCs=;
 b=nQczDFjzY40ZQulZnkvbsaDy/XtC+e+VkajgSSDl/Gx9ogpFNi5PuMO+
 zdi2C5WlwNtkQ6vByS8WabkK6r6y6oObe3Hs1C/Rji3YyEpWAQos4okZu
 26w/OFjA0e72CsuU2znVc0lxVWcsgKCDYJdVt6wVPCG+mdjDPrN6jM3p6
 ct5AzY/L15NEXfsIoTVcMM23+Syjyka1aQh0NhCauek6xq9MxtYSrgDQc
 GW9NNJVg6ezKfMNWwGt0f96y2+AnH/tn/4Wb2BrQWgLq1/lHipLNHbk82
 Bw0uihipMMJVWOYlNc5YdfM+XFqkMAiLQTwH/ZxE/h1PiKLgV3duqlNlD g==;
X-CSE-ConnectionGUID: 2Zwe1HGaSxacCO4awBvYkw==
X-CSE-MsgGUID: sQdVeZrhQLucwEtVyuaaJQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="8721875"
X-IronPort-AV: E=Sophos;i="6.07,208,1708416000"; 
   d="scan'208";a="8721875"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2024 20:11:37 -0700
X-CSE-ConnectionGUID: IgbWvgjIT5qdTGCl1y4Wmg==
X-CSE-MsgGUID: EXgQMphXRsy93Sqoyj5o9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,208,1708416000"; d="scan'208";a="22550839"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Apr 2024 20:11:36 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 16 Apr 2024 20:11:35 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 16 Apr 2024 20:11:35 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 16 Apr 2024 20:11:35 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 16 Apr 2024 20:11:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CiVAti16F0XwKWO/4bHH0Sk4WMiUKSH0qfMmzrfUQKYSGnM4LCGpZFVdS0B8zO7f1S4GP/NyZ0uwWNKhASw8JGBa75ohhRNDStqz0vWYkmcQegsMG9oKzpwnwrc8BIiZgZfD7wdxROT/h80WvC8/ybhTKLtwwIjBZQ6K4HZZlhct2+/EuFWEUjjT1L6FDuihwMlCrD7rOkydtkzvOmLGoqfWweggpcwq/lCRjriEVmTBef1uOMZbQowG5wP0hwht56RiCaCVBtBl1J4LJHtV/sf93Sq4j7tQt55uCCDi1w8/UQEMdz6q1qC24p6MpZdZ2lr8XCyV925zzeMsVb57pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OspfM9Zk5z5bRSiZy9VEZhRoMG7JY++Bg7QpAFLLERg=;
 b=Kj17YGzOZbysnptcIL8s+YUHAuxom8uJP/mr5d5WDgIKJmwk4wBGuXfISz5800Y16lrR9V2q0su2twK4+kP/HnsuTCx1HXfnozwH1zCUgzB0pxX3fcFVLRvpW+7o1QyPsdhVF0g+W6K0kg9VgOSReaR6jag+k5yusO2ZGDNHnV7lv4GrA4LUhI2wTSe6ole8ndtnB5H2RM1NjXh6jWmaIwbh3ntaoSraxDKULBYkPGt3Bbfhrbksqf/5D0U6ZN/7bmHEjeVEoxwmQ50AcmwHmVVRaZ34Lf7dokhKRqnfVh9pm1TYULP9aWobuDyO18a9hOBgN4p/9do99Nf733hfRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by LV8PR11MB8509.namprd11.prod.outlook.com (2603:10b6:408:1e6::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.26; Wed, 17 Apr
 2024 03:11:33 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7472.025; Wed, 17 Apr 2024
 03:11:32 +0000
Date: Tue, 16 Apr 2024 22:11:30 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Tvrtko Ursulin <tursulin@ursulin.net>
Subject: Re: [PATCH 6/7] drm/xe/client: Print runtime to fdinfo
Message-ID: <i6hvr534dzqnj2ihee6jnsyahtsfnek34kumvxhvw3jtvifzsz@lh7p3rq3662c>
References: <20240416030454.3739862-1-lucas.demarchi@intel.com>
 <20240416030454.3739862-7-lucas.demarchi@intel.com>
 <Zh8H1t7gwFUFkQtn@orsosgc001>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Zh8H1t7gwFUFkQtn@orsosgc001>
X-ClientProxiedBy: SJ0PR03CA0213.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::8) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|LV8PR11MB8509:EE_
X-MS-Office365-Filtering-Correlation-Id: ca9822a2-1625-4d7a-cf3d-08dc5e8c14d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Vq+vLLxl36LmUeduER8290vjK7UKUlAH+uJ6zC73CD755Kl9PgTIXNL3o5N+gHFeUd4AOCeKcvu8V/uqmQDWJlMG4rqt9V2fXtUVjZVtm48xh6eNumZFH2k+4NJy2szZo6pV4Ln2D/Rt5NokBZSyt8uRR8pHBFobtkTKRvbv5+GYrCs46DjfYFEbeLUIxGqhB6dJCo+YvV5yRBynJdjxMad2Phy2fe/5rFM0YITQzKSUkzJS4Scs6s1Q3XWJKRuJejOya2y8L1LPBnVuq7fg0P5YtvcFDZM0iY/PtdPxwNPifUhTZ1xpreVSlRl8zgl6bWXuSEEjz76bMCY5m24VTyYxDLTgc0J3yJmzDFP5QVLcRYZhbDvw1ysKpEyrtx5ctZGdXSNkBxveYyDElnTjsh8o7KJawywU0tepm/F79PLUrYbMYCNu8AdOs76bjxQ0FMhk7uAb8hTaANPVQb2XlXn0hPD3sW2Ycz74A+yzIjxoGNwQ1AaOX1WEl/QCzPfcVUn43aaiMI3pKmnJV0jla3BriTwtH66ogLfDYGup+iRkM6+UpPfSN2Tim7wg/XxY/d8quh/5M6cXhLedmHGZU4YxndqUKp34Ew91y+Tp3bhHt2MBg1DOoHWthzfnMhAD5TOqEl8ePHdgIX/5LdNfi3bX9llrcUKoOr2xzYTp1Dg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?jJfYrfIUtSW0MrJVQf41SFszWdkg48p+6EZKOrzneW4UnQdllG48rRY1YD?=
 =?iso-8859-1?Q?a0GCMX7RzQoPmeLjZRMp66OQcspKucGUvCc6oLWdhW8vcLMSks0iPb1hc7?=
 =?iso-8859-1?Q?nuFLao2ugkyPwVrfN5DYQDg4x9x4APsl2Ddz+/9OHDJek0RsiId+2wPA7l?=
 =?iso-8859-1?Q?3FKV+W/Tz13QoSm/iZShCYSQDEql+IFTmQNS9cnlKSNhXo6inFVX8E9xbB?=
 =?iso-8859-1?Q?xO7Hp+l7yKO97X/M+N0qXTabTCbwFJTDQPZmOwAx3AFGgh2WTEWXt80R0J?=
 =?iso-8859-1?Q?Okw5mspSaQM22ThXqOC1hIhqx9YQgnw6Dafi3O267t9H6Vu9USB5/s05QE?=
 =?iso-8859-1?Q?neZDzgekAha94So9UNgjCCiKATtSmKlbuM1US+c5sSOJo49F/lZlhsO8qr?=
 =?iso-8859-1?Q?NBAanLW0PMtqsj2vQyxovwucayrBn62vY49yBRe9nMx4rIZf5BcunUEyni?=
 =?iso-8859-1?Q?c5ha4mYF/+rDNQdYz3sFtBu/OovbdqjRYF3F5BzBhr6s2dePQLt1kU3aKt?=
 =?iso-8859-1?Q?bKLGc5w1bBCbplWvAyHX6HBxbo5CpaMViwkBmpzZrcRoKtyHBtd50wkDEY?=
 =?iso-8859-1?Q?scrZShMoobc1j79hB7zF5fPApgl1rUYDY1xdyM+FMCS9HxWaTRG/UzN73W?=
 =?iso-8859-1?Q?7VBWR6xOhDCRqCTXid4d1eqSg66IGHOSkE2u+AV9h+dUR7tWPum8cAWg0A?=
 =?iso-8859-1?Q?h5Bz6pQNVhQHLf2+emhLlzu1zblyL7cFk0aSQNnd8a0v/G5VBwbcMtYQaJ?=
 =?iso-8859-1?Q?r6FsMISRkdLGDZODAn9gI+dZNTq3EAUP28B1IRoap60OVhYMlBGchn2m9K?=
 =?iso-8859-1?Q?zARca1AYW4p+EygTq/Jw7fWhlyZHUe30dFQLACD7e1j4krRSUfKihD+Ios?=
 =?iso-8859-1?Q?dC58qI7DUo8Cr+DPXXneTobRaTWmGuDnLYjfYp1HKG0g4ONs18Aarf0iYg?=
 =?iso-8859-1?Q?1VLcUCWYMk62jiApH6w4578hk5w2ySQjFFmu8fOCP0Va3fFa/daBlkT0HM?=
 =?iso-8859-1?Q?+Yg+sEfj/G5TAEPuFCRC5jhCnyLoe0zIJx8n6GPxb6HYhulSOYsrg9r3DU?=
 =?iso-8859-1?Q?H465myJQrM4g31pGYJqGwT8kSjLJSueOumpDqQIjhQRa/LJQ6+u1YDEBEe?=
 =?iso-8859-1?Q?HNAPtDxx193SRm/qYpn9x1sUXim8752Wv5hdxiOmi7kQhGtEplGuglgGUw?=
 =?iso-8859-1?Q?jzp42yk0nNwOYjv4bM5caIN1IhFTXmgLdPJzMPlQd4pn2SDqd4RqhuDyHb?=
 =?iso-8859-1?Q?CMGnJUmOdoefEpdqTQVd5g1Qp8xmnt5zsglK00SNSgROPnSSY5lxr6e7yX?=
 =?iso-8859-1?Q?9grz2OOFClaQJn1+4+Y7l7ZUPobPMkT54rdRgKUjyp55Ac7FzScKVQoW2X?=
 =?iso-8859-1?Q?MZ1gm5e18BJe+AhWzD815vEsL96FXeCt5VtpmTK+gZZdXjSBalhR4lyOO0?=
 =?iso-8859-1?Q?I2eSk+1CNbbZJ9QlEJ+FOvzxfvl3euXUJfTNcj1CYXr5/sb3y5+HWuEho6?=
 =?iso-8859-1?Q?k71tYPNNBBSNfaeP9xe7Ll+5aRT48OLrXCgWF4MyA5ViXhDoWRnQ3NjWYt?=
 =?iso-8859-1?Q?3D36BdncwXfkeHc7batXpwhlwHsKw9o9Pu1Ht6H6uyFgVHyOO/179SB+dk?=
 =?iso-8859-1?Q?EVkpcC4xlpaorhU3lz4vf7m9Slr8EQW90HrBQjqQoT6IOMgclccCtN8w?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ca9822a2-1625-4d7a-cf3d-08dc5e8c14d7
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2024 03:11:31.9946 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y4Nsr/SbyV0IXiqag1515yTvTAo7FmNhod0ABESoOP7IKdXrqowclqsnJcHFKFbfxiXDbf1mmX0bGrepS5QvGNz3NgVZNaC2ooT7cubeTxQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8509
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

On Tue, Apr 16, 2024 at 04:20:54PM GMT, Umesh Nerlige Ramappa wrote:
>On Mon, Apr 15, 2024 at 08:04:53PM -0700, Lucas De Marchi wrote:
>>Print the accumulated runtime, per client, when printing fdinfo.
>>Each time a query is done it first does 2 things:
>>
>>1) loop through all the exec queues for the current client and
>>  accumulates the runtime, per engine class. CTX_TIMESTAMP is used for
>>  that, being read from the context image.
>>
>>2) Read a "GPU timestamp" that can be used for considering "how much GPU
>>  time has passed" and that has the same unit/ref-clock as the one
>>  recording the runtime. RING_TIMESTAMP is used for that via MMIO.
>>
>>This second part is done once per engine class, since it's a register
>>that is replicated on all engines. It is however the same stamp. At
>>least for the current GPUs this was tested one. It may be simplified,
>>but in order to play safe and avoid the cases the clock is different in
>>future for primary/media GTs, or across engine classes, just read it per
>>class.
>>
>>This is exported to userspace as 2 numbers in fdinfo:
>>
>>	drm-engine-<class>: <GPU_TIMESTAMP> <RUNTIME> ticks
>>
>>Userspace is expected to collect at least 2 samples, which allows to
>>know the engine busyness as per:
>>
>>		    RUNTIME1 - RUNTIME0
>>	busyness = ---------------------
>>			  T1 - T0
>>
>>When calculating the overall system busyness, userspace can loop through
>>all the clients and add up all the numbers.  Since the GPU timestamp
>>will be a little bit different, it's expected some fluctuation on
>>accuracy, but that may be improved with a better hardware/GuC interface
>>in future, maintaining the UAPI.
>>
>>Another thing to point out is that it's expected that userspace reads
>>any 2 samples every few seconds.  Given the update frequency of the
>>counters involved and that CTX_TIMESTAMP is 32b, it is expect to wrap
>>every 25 ~ 30 seconds.
>
>I think the worker I had implemented in my original patches (as well 
>as i915 implementation) may have been confusing.
>
>32 bit counter ticking at 19.2 MHz should wrap around in 223.696 
>seconds. The worker on the other hand was overcompensating for it and 
>running at 1/8th of this wrap around time.

now I'm not sure if I did the math wrong or if I replicated something
you told me :)... What's the reason to overcompensate like that?

My main issue with the worker is not to have the worker while we have a
gputop-like app running. That should be totally fine. My main issue is
doing it regardless of having a process querying it, which would account
for ~99.9% of the time.

>
>>This could be mitigated by adding a workqueue to
>>accumulate the counters every so often, but it's additional complexity
>>for something that is done already by userspace every few seconds in
>>tools like gputop (from igt), htop, nvtop, etc.
>>
>>Test-with: https://lore.kernel.org/igt-dev/20240405060056.59379-1-lucas.demarchi@intel.com/
>>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>---
>>drivers/gpu/drm/xe/xe_drm_client.c | 81 +++++++++++++++++++++++++++++-
>>1 file changed, 80 insertions(+), 1 deletion(-)
>>
>>diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
>>index 08f0b7c95901..79eb453bfb14 100644
>>--- a/drivers/gpu/drm/xe/xe_drm_client.c
>>+++ b/drivers/gpu/drm/xe/xe_drm_client.c
>>@@ -2,6 +2,7 @@
>>/*
>> * Copyright © 2023 Intel Corporation
>> */
>>+#include "xe_drm_client.h"
>>
>>#include <drm/drm_print.h>
>>#include <drm/xe_drm.h>
>>@@ -12,7 +13,10 @@
>>#include "xe_bo.h"
>>#include "xe_bo_types.h"
>>#include "xe_device_types.h"
>>-#include "xe_drm_client.h"
>>+#include "xe_exec_queue.h"
>>+#include "xe_gt.h"
>>+#include "xe_hw_engine.h"
>>+#include "xe_pm.h"
>>#include "xe_trace.h"
>>
>>/**
>>@@ -179,6 +183,80 @@ static void show_meminfo(struct drm_printer *p, struct drm_file *file)
>>	}
>>}
>>
>>+static const u64 class_to_mask[] = {
>>+        [XE_ENGINE_CLASS_RENDER] = XE_HW_ENGINE_RCS_MASK,
>>+        [XE_ENGINE_CLASS_VIDEO_DECODE] = XE_HW_ENGINE_VCS_MASK,
>>+        [XE_ENGINE_CLASS_VIDEO_ENHANCE] = XE_HW_ENGINE_VECS_MASK,
>>+        [XE_ENGINE_CLASS_COPY] = XE_HW_ENGINE_BCS_MASK,
>>+        [XE_ENGINE_CLASS_OTHER] = XE_HW_ENGINE_GSCCS_MASK,
>>+        [XE_ENGINE_CLASS_COMPUTE] = XE_HW_ENGINE_CCS_MASK,
>>+};
>>+
>>+static void show_runtime(struct drm_printer *p, struct drm_file *file)
>>+{
>>+	struct xe_file *xef = file->driver_priv;
>>+	struct xe_device *xe = xef->xe;
>>+	struct xe_gt *gt;
>>+	struct xe_hw_engine *hwe;
>>+	struct xe_exec_queue *q;
>>+	unsigned long i, id_hwe, id_gt, capacity[XE_ENGINE_CLASS_MAX] = { };
>>+	u64 gpu_timestamp, engine_mask = 0;
>>+	bool gpu_stamp = false;
>>+
>>+	xe_pm_runtime_get(xe);
>>+
>>+	mutex_lock(&xef->exec_queue.lock);
>>+	xa_for_each(&xef->exec_queue.xa, i, q)
>>+		xe_exec_queue_update_runtime(q);
>>+	mutex_unlock(&xef->exec_queue.lock);
>>+
>>+	for_each_gt(gt, xe, id_gt)
>>+		engine_mask |= gt->info.engine_mask;
>>+
>>+	BUILD_BUG_ON(ARRAY_SIZE(class_to_mask) != XE_ENGINE_CLASS_MAX);
>>+	for (i = 0; i < XE_ENGINE_CLASS_MAX; i++)
>>+		capacity[i] = hweight64(engine_mask & class_to_mask[i]);
>>+
>>+	/*
>>+	 * Iterate over all engines, printing the accumulated
>>+	 * runtime for this xef per engine class
>>+	 */
>>+	for_each_gt(gt, xe, id_gt) {
>>+		xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>>+		for_each_hw_engine(hwe, gt, id_hwe) {
>>+			const char *class_name;
>>+
>>+			if (!capacity[hwe->class])
>>+				continue;
>>+
>>+			/*
>>+			 * Use any (first) engine to have a timestamp to be used every
>>+			 * time
>>+			 */
>>+			if (!gpu_stamp) {
>
>gpu_stamp is not required if the intention is to read the timestamp 
>once per class (as per commit message) because you are already setting 
>capacity to 0 below.

yeah... I think I changed my mind and forgot to update the commit
message.

thanks
Lucas De Marchi

>
>Umesh
>
>>+				gpu_timestamp = xe_hw_engine_read_timestamp(hwe);
>>+				gpu_stamp = true;
>>+			}
>>+
>>+			class_name = xe_hw_engine_class_to_str(hwe->class);
>>+
>>+			drm_printf(p, "drm-engine-%s:\t%llu %llu ticks\n",
>>+				   class_name, gpu_timestamp,
>>+				   xef->runtime[hwe->class]);
>>+
>>+			if (capacity[hwe->class] > 1)
>>+				drm_printf(p, "drm-engine-capacity-%s:\t%lu\n",
>>+					   class_name, capacity[hwe->class]);
>>+
>>+			/* engine class already handled, skip next iterations */
>>+			capacity[hwe->class] = 0;
>>+		}
>>+		xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
>>+	}
>>+
>>+	xe_pm_runtime_get(xe);
>>+}
>>+
>>/**
>> * xe_drm_client_fdinfo() - Callback for fdinfo interface
>> * @p: The drm_printer ptr
>>@@ -192,5 +270,6 @@ static void show_meminfo(struct drm_printer *p, struct drm_file *file)
>>void xe_drm_client_fdinfo(struct drm_printer *p, struct drm_file *file)
>>{
>>	show_meminfo(p, file);
>>+	show_runtime(p, file);
>>}
>>#endif
>>-- 
>>2.43.0
>>
