Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98897C04FFE
	for <intel-xe@archiver.kernel.org>; Wed,  8 May 2024 12:55:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 587C81128C7;
	Wed,  8 May 2024 12:55:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d2ZEWebo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71AAC1128CD
 for <intel-xe@lists.freedesktop.org>; Wed,  8 May 2024 12:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715172917; x=1746708917;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=xJ9N8KqYaAmBytSnNUPvTvEtXbU9iMD2L/CuLUfgwJ8=;
 b=d2ZEWebomqLzVPRUz7CGX6uPYOo/RxPzSTWE/+gewclpHEr/jSenbzo6
 41qIso2VUMVQaE1S6unvwRPR8YMnBFwqqH/od97BeNiGJQCUe3Fob5rLA
 qOobyazrMZCEO4moAFC+p7jNtS/15GYwWnNtYEJOWuoJZUJIpTR3sdx+g
 kdnG/WvSgtqTb5dCchhyiWUSjGi936pKI/4jyoehVHe18k1dKSyLU9fhO
 qHhsWzyaExkXmUE+0fqHZQAEFdO79GLZWpg1QesHOEog/OVxmID6H0VN5
 WbOI6xBIkJUPa75AMEhZr37mRa0mIIclybLouQAT285dS4E9jFYAl4ITw w==;
X-CSE-ConnectionGUID: HfOfv8ohQRObI49oNLerTQ==
X-CSE-MsgGUID: sBxNLzGGSUCpZ8xfhHYFQQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11066"; a="22435887"
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; d="scan'208";a="22435887"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 05:55:17 -0700
X-CSE-ConnectionGUID: 0l9wQaWKQee+r1bypOwA5g==
X-CSE-MsgGUID: U/UlOSeCQXmjl6Le88k8eA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; d="scan'208";a="52088434"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 May 2024 05:55:17 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 8 May 2024 05:55:16 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 8 May 2024 05:55:16 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 8 May 2024 05:55:16 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 8 May 2024 05:55:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ex2p+ItEdMmoD9awsYS3GFiyMtPyZGhopLQwlCbuk3zIM8He1ADPvu1CPLMQJRfFWQqS3LvGA0jlYBS5DU2hOcOkzIY6dzYEJAIuE5LXQX5Z27X9v98shWyBB8KbBlae5x0M+V93JRkuRa8tHZE+HFM1X2wvcBoAxiqKsOKvHWQ6saizXelyC4+ZAyKjTufmgRsV4vL5c4lUoPMCdphj1HtSjxiwxEDVg9qJ0/AjLDXOZ9KJDF62o3NRBdolW9PnsF3zGaQNSUCb4P2MbTFeblaY2V4V1ofe0xZqc2p3EvV/k/6RajSvyJO+KD6ssTst2Q8pLDeQTMUpzT63XSN/ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qKKLlwI8ryZyK4nIGQyFr+TBXzVAAS/YEI8Rfj8fFg8=;
 b=HgzIfsGav7NDt4spcT4/dIBUjqoBFxidMoO/ZGy1oVJMzEJzZ+CAs5RE1JifRyUGuyv6JVqYCpJ81f2VeT+kbjAq/ZfzR7FlIP1CptQy5D8uH7FbMFzNsbLhWNK/LuCIxO5H7stRn/p2GEqLHnV16deletG9H945FSMlFylX7u2vcvb24v9cgS87hezOrEE2ZzZXcdD4HxM+p1kTRd3r0VmF9jZglqI+y2myX4dp6DFyjqZrYsk76/4cDHGq50WCT38MwyBc7CAgve4j0aVaC0+TwKQPAUdDOifK0/yYjYw1GwnwEkCJoCHhyyalh+DLeJGR3CkqB54gygP0Bz6iwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CH3PR11MB8237.namprd11.prod.outlook.com (2603:10b6:610:154::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.46; Wed, 8 May
 2024 12:55:13 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.7544.041; Wed, 8 May 2024
 12:55:13 +0000
Date: Wed, 8 May 2024 07:55:10 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v2] drm/xe: Change pcode timeout to 50msec while polling
 again
Message-ID: <wqypeux2mnfci7vunszwywbjnvb6t7bmva4egb2u2kcbb4oe3g@244w2z3fnogz>
References: <20240508034328.3233072-1-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240508034328.3233072-1-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: MW4PR03CA0028.namprd03.prod.outlook.com
 (2603:10b6:303:8f::33) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CH3PR11MB8237:EE_
X-MS-Office365-Filtering-Correlation-Id: ed42aaf1-3384-44a3-debf-08dc6f5e1a12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Y/9ns9IJMEZYrD3iRqPtv+ux4Igp6JxhCWBXHBITQXByjKTrhMaUlmb8vjMK?=
 =?us-ascii?Q?m3TKcFovLHlegUCJWTaLlMJAtOqSD2RzZesRJiczbCDSqW2hGNZe81I3+Xzz?=
 =?us-ascii?Q?f1yGqkqt6r/lixMoy3nnb8DEb0S6Ypnm5YZv5q4N51LsgiWbmzxDAhkVZrsM?=
 =?us-ascii?Q?Y2Hjd09eSvM8QZa+jnhDfSGhAAV3iz8w3Xb0s00ZOsr2jWVGIxZ/DxsMQ45z?=
 =?us-ascii?Q?iII6doEkxQBpBUwKF0g3LXk0a4xHf105nG7sTvv9dsKkNDP9++EVoTiSM+4e?=
 =?us-ascii?Q?ldCy+HPq7vZ3eSEB8IZ+rxmk/BPQqcsCtSR50pZxBIxsBcHSpr+Jv3k1b2da?=
 =?us-ascii?Q?2/PpafCDCdr1/wPgqIqiyqkPqTY/EULgRUO5q5pJu5R/OFIY/pTYPH9ECATU?=
 =?us-ascii?Q?LKi29vYMFWtXq/wBzihSQk7n/XFBOeDJAvIE553UojCkqhdvNMElOeW11Me5?=
 =?us-ascii?Q?Lzbx9UDGiWRWRsJUgbXMt1VurPEFYNPBaESCI+wbTkH6l9ug83GUBBZdrHUA?=
 =?us-ascii?Q?piPAuqq4Ped75SOTCnb3FtCXeYs231lDZv8b+H1GczrKg0G0K5lk6Ak6b/nR?=
 =?us-ascii?Q?eukAQF1tqp2jTjvkEbIYu6OLoUEaKXEjP7VeskLO94v2zP3VX2yDW0CWCxmU?=
 =?us-ascii?Q?2HJAR0YnpKIYUc9CC5NDo8NSikMI13sWJdhRsKyM690i3NOeKoFPi3tZlWhh?=
 =?us-ascii?Q?VkEz96a8VDwy5mgU8EYatEEAEzvzdP+4rCRL+9heBPuPdocDi4FsyaQl/Q8Q?=
 =?us-ascii?Q?/ew+/bqr3ONKVBxKLd3fzugtROlVDeB4amdM5c1eYKUgkX+4uDKsSKt6ReM8?=
 =?us-ascii?Q?tACFy1hq9qsrJ9Iaq+f6xx/BjcTWU4r79YMINGW4rj2aEIef/HfGj2lOUYvK?=
 =?us-ascii?Q?+NLyPkwr57kHFgFaGao/1lomm3Bm4v+lxnG39Uz6/FcSlJdzzhJSLy2KuZOU?=
 =?us-ascii?Q?MglktY+rkpfKUMlJF2zN8FgcwkzRX5Q2naDVlkgkZPmEldryhq0vcVl4Xv2Q?=
 =?us-ascii?Q?+bndUu+0keHguuV4G1E4xPZJB836/2j/IHj7/5ZzoVyfy7orVhMjH2iEH2BU?=
 =?us-ascii?Q?iu4fDEZ+P30jK8aRoFVMQYAxeSSnuYtUSOx1pW11qOOQUPFFQWtbJO2UJtnH?=
 =?us-ascii?Q?EI15Wbe8WVKK2p2mOAma+0uociSPnFacLdFEiFUSp3ejrI3tvsLfOnWdj3vV?=
 =?us-ascii?Q?gQmNJp5BrScdJggAG1XanAavIwgHqQlY1cHqxgyM5qf/3zmfyGLKaHLmDqgt?=
 =?us-ascii?Q?rXngqz3oonRThldkYa2jAYgOw/Axe6z6kFF/40civw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?okV1tBhM69nY9Yh0EBx6VFR9jcjOusfNf3Id6pJu6mIuoI47LgOML+aCC7CS?=
 =?us-ascii?Q?D6qdWUEuGBDcKJoJiioF/0lFk948vp3/e7a+4JvprABkmA1oWCAhUcL4tH6B?=
 =?us-ascii?Q?H/n08hYGSwagcg6rwPLsePCHNKlfrkEODLNwETU1ydloM6XGulnauIXJxStd?=
 =?us-ascii?Q?gu7t0pHSSvrhU1rTGBEbwQr7wKUuH/mKbPS4yVvpQcAD+QckKnMXL8Cufq8l?=
 =?us-ascii?Q?z8GKL4h2Z9YgUXM9KjT6IzQ7tcPuFhkfa+a/W2AfN19ju0/6ClzTnjpvkAbv?=
 =?us-ascii?Q?23DBYRNh+HBosr52ig6zLy18kxUv9f64F4nNrZ6f+bsu3JUAIOe1wIJtJSB+?=
 =?us-ascii?Q?7pOabcnIGJhy/Y8nzYDrBcRFvy3LFb7MOrhAeItY2zBn+G+Tajtd2jm38QEw?=
 =?us-ascii?Q?bLMje7Z5i7hMUFCQHlm1f514MQZH5aK5LViKZd4SUzg3/OysZDI2/qzRNM/j?=
 =?us-ascii?Q?VrtvgfnQX8+cFZBIKX/7HpsxAeP8oLeLHYDi2/w0kkLTTTTrUfDzUrhvlAfs?=
 =?us-ascii?Q?hak/ZSU6C6ME3clHZN7H6YPH6DtBPPsbbg1o6BcGyegpKjE0/K/L4u9fWgj9?=
 =?us-ascii?Q?0fRsOJUp+wdDKEKK1wLsdR7JlASkkTi9ZCI/pqf6+Xs8DGKMyIlGMbplmFeu?=
 =?us-ascii?Q?3WBWIAf3sQXBNU9vxjh0B/y+Lyy92b56kWGp5IcL3YrMlNR3WXCPff/DZ/bK?=
 =?us-ascii?Q?g0X43Rl3wN2MVKgWs6eltLhB7m7iVGJkQrPxIHmWsTMK59A51/jqeXBFVlOe?=
 =?us-ascii?Q?bDpVn3XJ5MSitPgMo0v7i+IqDssRtfhy1mxc8CLnkelmuwdYkHpdXslU1RMk?=
 =?us-ascii?Q?GVq8IxS0RWkpFNpleoPp1QYuomF1DQpOv+N3WF0lV4dU87bC2sCh7l6eTDnD?=
 =?us-ascii?Q?UtysCSwCi3GhZSuLZOtl3MuJ46lW1Q75plkylvnfYUYVVwioSxRGOgyKYODN?=
 =?us-ascii?Q?0VBrRTpoYy+y6T8HP3YAkJqRacKv2knPUkBCC5oCZB8ii3F1RIeIIaIO7sFF?=
 =?us-ascii?Q?igHeACZjVkN08lh1zAw4OqXTZW4WVGYTwDN5cbMXXwt+25sNIsDZWK7eerOM?=
 =?us-ascii?Q?VESw4qLhrlobVioS9aCm7F8e59bi23q94Ty+WoL9ZAeprxuU5Bk8YA8X84lC?=
 =?us-ascii?Q?1RFAgxED628n4/Et9gEn99LKu7JaqTjkVUXPKzklPY1ACJMmnkoj1D/ogkoF?=
 =?us-ascii?Q?ycYFQ5TLM8VHITOKllAhDZD1OetyMdQS2MyXVahRIoczapJ3X6Tlsfb/CVeO?=
 =?us-ascii?Q?0K4Rq0TXJYdUSaGQkFWV8UToGt5SS1c8uZ9RQLRe/ONfcrO7mVnld5GnjhFu?=
 =?us-ascii?Q?mHZ6QHHvD7Nzc0AWaNCTXqTuKZX31veT2NFMiXuohHFaY7GmghXb8x8gWwBK?=
 =?us-ascii?Q?JA9E2mxlm7DcjkJkPAcflc0aLWfo/hSHnYIWHnLu780o4MABdjLtXVYdV0cK?=
 =?us-ascii?Q?26LJZXUZ6tv9fSgIP9hwZvlrjUi58ip0ZRnPJVVjC1Qr01aLI3osPFDdDoDY?=
 =?us-ascii?Q?ofzvR20hIyH+K3ywFJHWOGHUq/OvqhzZsEQOXRXXU982/tq+OjbQIVH4+MF5?=
 =?us-ascii?Q?U4ULUW6oRdl1v2N7Qg8qB9QVxKfOuGXU+wDVs2eP7KxFDpidCRCtClv1i4pI?=
 =?us-ascii?Q?AQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ed42aaf1-3384-44a3-debf-08dc6f5e1a12
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2024 12:55:13.6897 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wp1w+S1IosLZWe8VnWHmNtjNv1Vz2gouGqZvehH3yQCJtqSKAOa/b9ALEQbQFLzWPwTk4m4URJCxa2y1xLNQD5m5KyTrfqpVxQLka1NSgNM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8237
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

On Wed, May 08, 2024 at 09:13:28AM GMT, Himal Prasad Ghimiray wrote:
>Polling is initially attempted with timeout_base_ms enabled for
>preemption, and if it exceeds this timeframe, another attempt is made
>without preemption, allowing an additional 50 ms before timing out.
>
>Display driver can request for timeout of 3 msec, hence modify the
>warning condition.

this seems like a separate fix?

afaics below we have:

1) fix the warning to consider the display case ... and shouldn't the
    warning be before the first pcode_try_request()? Why do we want to
    warn before a fixed-duration rather than before the variable duration
    passed as argument?

2) change the second timeout to be a fixed 50 msec rather than 1msec so
    it follows what was actually documented in that comment.

or maybe I'm missing something here... could you clarify?

Lucas De Marchi

>
>v2
>- Rebase
>
>Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>---
> drivers/gpu/drm/xe/xe_pcode.c | 9 ++++++---
> 1 file changed, 6 insertions(+), 3 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
>index c010ef16fbf5..2771eed1e45f 100644
>--- a/drivers/gpu/drm/xe/xe_pcode.c
>+++ b/drivers/gpu/drm/xe/xe_pcode.c
>@@ -10,6 +10,7 @@
>
> #include <drm/drm_managed.h>
>
>+#include "xe_assert.h"
> #include "xe_device.h"
> #include "xe_gt.h"
> #include "xe_mmio.h"
>@@ -124,6 +125,8 @@ static int pcode_try_request(struct xe_gt *gt, u32 mbox,
> {
> 	int slept, wait = 10;
>
>+	xe_gt_assert(gt, timeout_us > 0);
>+
> 	for (slept = 0; slept < timeout_us; slept += wait) {
> 		if (locked)
> 			*status = pcode_mailbox_rw(gt, mbox, &request, NULL, 1, true,
>@@ -166,7 +169,7 @@ static int pcode_try_request(struct xe_gt *gt, u32 mbox,
> int xe_pcode_request(struct xe_gt *gt, u32 mbox, u32 request,
> 		      u32 reply_mask, u32 reply, int timeout_base_ms)
> {
>-	u32 status;
>+	u32 status = 0;
> 	int ret;
>
> 	mutex_lock(&gt->pcode.lock);
>@@ -188,10 +191,10 @@ int xe_pcode_request(struct xe_gt *gt, u32 mbox, u32 request,
> 	 */
> 	drm_err(&gt_to_xe(gt)->drm,
> 		"PCODE timeout, retrying with preemption disabled\n");
>-	drm_WARN_ON_ONCE(&gt_to_xe(gt)->drm, timeout_base_ms > 1);
>+	drm_WARN_ON_ONCE(&gt_to_xe(gt)->drm, timeout_base_ms > 3);
> 	preempt_disable();
> 	ret = pcode_try_request(gt, mbox, request, reply_mask, reply, &status,
>-				true, timeout_base_ms * 1000, true);
>+				true, 50 * 1000, true);
> 	preempt_enable();
>
> out:
>-- 
>2.25.1
>
