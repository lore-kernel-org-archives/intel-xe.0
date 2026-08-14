Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA622C5CFCF
	for <intel-xe@archiver.kernel.org>; Fri, 14 Aug 2026 03:51:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4904910E52B;
	Fri, 14 Aug 2026 03:51:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k1d1k380";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E71210E52B
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Aug 2026 03:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786679473; x=1818215473;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Qafq/uvgitlqpwY0joPF54KOH3k9x53elUt+x6elPPg=;
 b=k1d1k380ElUb5v6U/jigl/CCcB8ADiZV+aecWw0S3U/LviJBJYJni+Sb
 98bb24Q//uWAcgWUVPilIMN7x68g9HNxUpc01Gs32O4qQX1nMj6/GhU/l
 9e5UKRA0MsZyXHvz0+sltj/DqFIjWqc+uDdqA1bJwcB3tSetyV/hZNohl
 Y0YtzfwmOz/cMHphLy1SXob5IwJkuVpFfTl+u3wWE4d1X557uW9qFAylF
 z6a8snMtzKJRtWiz1UqYi5VMtQ5W3v+jtMRMiLZ3GFpjsnMSrRqvsVn1v
 9PJemUQIPNNJg4x2fZCzHI+aHalxH88RNY/phT97oTJcOYE3EnwZ5xmn7 A==;
X-CSE-ConnectionGUID: 5CukeVvKSs6ZPSim4NZEeQ==
X-CSE-MsgGUID: f1r67/MFTx6pdHRQ29G5kA==
X-IronPort-AV: E=McAfee;i="6800,10657,11874"; a="87022202"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="87022202"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2026 20:51:13 -0700
X-CSE-ConnectionGUID: L3z6197nTcq23wYMO6jXOQ==
X-CSE-MsgGUID: 0rWWgTHeQ1SSp24A7rBhxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="268392559"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2026 20:51:13 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 13 Aug 2026 20:51:12 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Thu, 13 Aug 2026 20:51:12 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.17) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 13 Aug 2026 20:51:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eukYq2yxMgITSf6M860dsbUwj7zB8ZcF8DmSGJsY8mZSJX/+ZfDuaJQUBcdoB7d6isZWIR3IywqttGA3w5PFUghL5GgWjh3QSui/+Q+oMu5SeDrIIQDzwXcmzw0CrQc5uJx3RTbe2vYit6G3IUa68e4KVNxXx7NkRo0VUyLkvyllYaJyOBoiGKKwG6pl0fAl7gD8dqfU53mNmph6OqUBsjS4d+tCCEvd3AwW4nV+/szMkTkde+VpvmomWa4XhJndxRChmlP0Mm1gzXuIGuTz7d+s7J0nnxNKZGQVWzj5tbPbnk32fQgboXeqjA+bqfUbMGlCsZEMWoVnWiLrN8K6ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7t3WkT/bCSEPm9TZQANqnE+1I9AOHLS7CSRCEB+L7+s=;
 b=EgWxyY6lQs1k6YpmI/Nk3fmJltPXoGHJ1GyixxEXVNbBbsvt5B7v18Kzmar64x/vAS/HWAgAQ9iwjAs2QwIeTj4AVmeJ8DnmMrs53XQr6K0mSA6TXDuI97FJD0G3jTlm+t1Tf4bANkEiJY9OOZC/bqrGGJ9qVtaePPknfMMp1KxHuXVlsukDZi+kxx14U4JIm1Oi7hZ6EPvgu4XrKCg1O/BTnEctXJy5Ao/i/Q+GLGLs6/yTq6Guqvd4hOh1Hen7GqOjhqfJxIJF9LDdt0jMecJGXl93wmuvjuUiSx0DqvGFGuC9UpY7Nmp5YJ0i5NaLgksFnuNnusqe88ZuzybDTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by DM3PPF341F90799.namprd11.prod.outlook.com (2603:10b6:f:fc00::f19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.15; Fri, 14 Aug
 2026 03:51:07 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%4]) with mapi id 15.21.0315.008; Fri, 14 Aug 2026
 03:51:07 +0000
Date: Thu, 13 Aug 2026 20:51:04 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/guc: Fix race around q->guc->suspend_pending access
Message-ID: <an6QqBsoQ1T43fsy@nvishwa1-desk>
References: <20260813201847.201867-2-jagmeet.randhawa@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20260813201847.201867-2-jagmeet.randhawa@intel.com>
X-ClientProxiedBy: BYAPR21CA0003.namprd21.prod.outlook.com
 (2603:10b6:a03:114::13) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|DM3PPF341F90799:EE_
X-MS-Office365-Filtering-Correlation-Id: 424ff933-6d68-424e-f3f8-08def9b74539
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|23010399003|6133799003|56012099006|10067099003|5023799004|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: ZdAyW+239Q6F8iTRJaT7OwIvMeSPgMbVT8svbaAL88qQmln3jsIqkf7gQDM8/fx9Aqaq7OZkQA/8F4aiq/7/VfAWCdWYatb9k/E2gxuaGdwgbBKPhhrTGEJlA8p7oFx6lPL16SxjfxOhgH7PmNfJhvJczNnIYvk04gGyQu9r0tdlAbAcK18nDop3eLuV2NgPo0AOHhuGtRYY+sxP4ckprMreh4jaGAbY/8GH/Ee5Nb+2MvVX1EmY3YZypR6tWwskbzlBElRhdCkmidJfviG04pH6ra3Ev6c+z1kzyphfNn8ypapVNNo+qdogvM9wy1oqNPUfmy6p7ZU4pld/C7/mjAX/v0Q4UJjQ84YIQsWwnhcvaV5/pywQ38TpHQe7fJDsmZgf/oq9bWQVQNB7LwGIQOE6DUH7DSnFGPxecglKhxgQZBchz4hKA6hh16MJOOcCfoSd2ggk1doOwjidcX2gr840eQnGxg+CdNAWqG3YV/Z1f6pWaAe/HasVsdzGZZoepydI/QHlhjtevbd1INZUmuRVa3MG+/fdZmaHvMnCSyUx7aX3KHLFTxXsHBc1+tIh5SHeqT1AzvRmOlZU7v2eelAHSuBOEdUUetm3nwTgEa9v9M3nELzIHKAq7VDuXMt/yO1+H/R14t8KxUf/PXXk4uVESywNOHH9SfwIUUJcoDE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(6133799003)(56012099006)(10067099003)(5023799004)(11063799006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?s4y7jartJ/IW4IaVX8Ko0fu+h0M2X7YsQFvk29iOG76n0Iq1DpHDj4M02U3d?=
 =?us-ascii?Q?OEQWf0G5QpzucjqUDiVqFzThvWRfgJgLXkm2f410tTErDpL5e3Oy3qn1E2pm?=
 =?us-ascii?Q?s33QSd0IkJNEXCMYM9Na/hJ2zKqmWKjuLQfpjua1LkZ/YaMA0fYMTMbXYaJ0?=
 =?us-ascii?Q?nTlgwB1e4bYbWq0SBQeISr8a9Y00yhKaRSedli57MuWiwg9+i7XI4i3wIrDq?=
 =?us-ascii?Q?1uEvDy3PaqHQdAs/E3GL0kNjDzRXEjSd8PC/xm595qddMvlpJ4QBKvxxUcxR?=
 =?us-ascii?Q?FbBEozx7L2oG2p2U6ofqZwW9npW9zd5U8Hxgjg6RyYLcrlzC+s9FPr+96uDX?=
 =?us-ascii?Q?aYPQ03pqxd0xdfsU+brUEOjq+40qwwefqBL6ksCcxbE9o1ACmimyMXfZSiQo?=
 =?us-ascii?Q?bh0oK/QQ7RAzGxCSHS+Lw5uHrDLK4UGaXKLbsf0UapSym5DM3J2OUg9LK9mw?=
 =?us-ascii?Q?2HgqPjV+hcEIK+yySLGzjUqAEEK+VStDaHqSj4gFaKnesSUg2kykNSXRLsiT?=
 =?us-ascii?Q?6jj3LA7AcImEY5uKCFzevBmt+w06WpoN+FcnUp8NiOwN9WVUVHJhUJnhbabe?=
 =?us-ascii?Q?mjHUoVhCpThKFsXN1Fl5Pc6VAeNKS9ejLclKr6TqaPLDvwpZ+dk7zOnqglRL?=
 =?us-ascii?Q?G2dVBpIvp+eiQaEi0BBP0IIWAP0gcvrBE/F1YENAwtNHrH1KhZPhxExqA4wt?=
 =?us-ascii?Q?VcgodIt5RRXpEc9MXcP+GQiVvfsR+3qmD4C5yEERPF/gdYDb75sEJFyt7B6N?=
 =?us-ascii?Q?HStkwjnYxDD6a+pnVkpyjNh6O78hUhVEYbqDlRwoBhT1FIni5QXOgxS31Llm?=
 =?us-ascii?Q?Hzc0A/Qu+AcGm13iTDSOcMwNjdP27zWCAlb3BpyCrqLUXfx6iRxijVb+CXOe?=
 =?us-ascii?Q?CWzT9CAhlqD82cLm50mEWT5PimtxdrSFwr/u70mTcXYcWRhsZmCTuJfoY6Y8?=
 =?us-ascii?Q?p9RemshLEjIlf6xfPOLcbugsExVywNJILKV40cVBsVF1vz1QQtBtTEs8/6p9?=
 =?us-ascii?Q?67Q9vnzCd1PoiqrUbEbe89omxZHo9nD/rEEk0zwe0JXAb/YcxoDZQkZiI2I2?=
 =?us-ascii?Q?3rPfJ9h0LLZcDXF524C886UloZks25VJSsY4sktot4oNaAoo1qquH5jwMCjF?=
 =?us-ascii?Q?+OEfUbpMXGxlBX8kSb8OQxlCf736LAUU3/j04WV7uh+YZBMf2IkqMzEmsAPU?=
 =?us-ascii?Q?zX3Wo0bYpb7NkYadVDyD0KNWf8OiDxOdXNWlbAX96rhVkoKBXT3GUiu1TSCR?=
 =?us-ascii?Q?fvbeWYJI/VLgtwucwaHD3sqiE3/a1nBmX4KikoJXCWogf4uIFdZDHAsrOYpm?=
 =?us-ascii?Q?iJhxx2jZmTAhocB/lXbEwq8ZW0mRBZcMibBcrkCAtCDmX9ALr0YZKWmnLsr1?=
 =?us-ascii?Q?4R3fUomiFcvI9LdsaHSeY2cKWL3xqaQU1dT9Ncwuj2Mu3PtfyKqQKLk8sRCP?=
 =?us-ascii?Q?ULyw3HXXBGZHVvuNIf1Pig7qrcSbvV0rlKD+vICk7ryLIZu2se32eWEyStd2?=
 =?us-ascii?Q?mTAywG/xGMqc/MKEC10yj0ao01w7Y3mI02fS6Ca4//xz2bMaBy2d9YUCFFdv?=
 =?us-ascii?Q?vRYL06ul4TN9rH6/JGNe+/JkQwcJ8CUMObUFaCxnb4Ixl0cu1N++vT7T0XHa?=
 =?us-ascii?Q?MpzqgaqGyR8vgodk+dwUhUldbZv3d6/ZxnvW06XD6mMmhOGdViQ41O0YbJJl?=
 =?us-ascii?Q?m4r8eqCf63GW7E5ys2ft8BKffEAbF9S9zH+jWFLOYJEh2cBCEKq17bRbDOJm?=
 =?us-ascii?Q?3tL6RyZCkcYMagWsxooko/V8eI+MoHUllIU2s69DuuMZod4jlSP2?=
X-Exchange-RoutingPolicyChecked: QRNQeRdcvZzAdzKktCm3ZTwQ6JCix+N2+26ssxLdztSCprYxkPhv1XwDZautruo9JsWU03j1q/7aNSMiwRnE5w6mUPDX+balonHYYiYMMLKhjpu5eRXOnbOSOw/BzqXOHTxXjdmKj0IxRGfHud+T4f9DIuLAv3r42MVnLehG+i+9wXknm5/IBMjY6W8dDVlJpTdWmFpZEb3XaO4GKnZ9A8v3mjgEUf9RlHE0afre89Q08Wuh5K8VjtOhA6tKDoz0XA/V1mZdvF2HC5wxOujOQX0IRHheYlbLW1HSelqnFPRrbgyHGuiadQHSY4bEAPp1LfgkVP+7QjAk441+lSeuEw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 424ff933-6d68-424e-f3f8-08def9b74539
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 03:51:07.0625 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TwWgSmT5iPz0v2huWo8UA244ytl0OUZD1jde4O4gccT1TnUJk+2H6m7c67gXfNeWDHPE+x1zxzc0ESUzuDD8SlirKGC3YkUXnpL1Fp0AnZM0yMOox1cxAyAPc2Yrz3vs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF341F90799
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

On Fri, Aug 14, 2026 at 04:18:48AM +0800, Jagmeet Randhawa wrote:
>q->guc->suspend_pending is accessed without any common lock.
>__suspend_fence_signal(), called from guc_exec_queue_kill() and the
>suspend-timeout ban path, clears the flag asynchronously. Meanwhile
>handle_sched_done(), guc_exec_queue_stop() and
>__guc_exec_queue_process_msg_suspend() check the flag and then call
>suspend_fence_signal(), which asserts that it is still set.
>
>As the check and suspend_fence_signal() are not atomic, the clear can
>land in between and trip the xe_gt_assert(q->guc->suspend_pending).
>
>The flag is already set and read under the per-queue msg_lock
>(xe_sched_msg_lock()) on the suspend and resume paths. Extend that same
>lock to the clear paths (kill and ban) and to the three check-then-act
>sites so the check and the signal are atomic with respect to the clear.
>In __guc_exec_queue_process_msg_suspend() only the non-sleeping branch is
>wrapped, since the other branch waits. In handle_sched_done() the flag is
>snapshotted under the lock and deregister_exec_queue() is kept outside it.
>

Looks good,
Though it looks like overloading of sched->msg_lock, it is not because
guc->suspend_pending is indeed indication of wating for message process
completion. Perhaps it would be good to update the documentation of
sched->msg_lock and mention what all it protects (sched->msgs list and
guc->suspend_pending which indicates suspend message is in fligt).

Niranjana

>Signed-off-by: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
>---
> drivers/gpu/drm/xe/xe_guc_submit.c | 29 ++++++++++++++++++++++++-----
> 1 file changed, 24 insertions(+), 5 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>index 9036f89dff7d..c565c1d32d3a 100644
>--- a/drivers/gpu/drm/xe/xe_guc_submit.c
>+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>@@ -1928,9 +1928,13 @@ static void __guc_exec_queue_process_msg_suspend(struct xe_sched_msg *msg)
> 			set_exec_queue_suspended(q);
> 			disable_scheduling(q, false);
> 		}
>-	} else if (q->guc->suspend_pending) {
>-		set_exec_queue_suspended(q);
>-		suspend_fence_signal(q);
>+	} else {
>+		xe_sched_msg_lock(&q->guc->sched);
>+		if (q->guc->suspend_pending) {
>+			set_exec_queue_suspended(q);
>+			suspend_fence_signal(q);
>+		}
>+		xe_sched_msg_unlock(&q->guc->sched);
> 	}
> }
>
>@@ -2130,7 +2134,9 @@ static void guc_exec_queue_kill(struct xe_exec_queue *q)
> {
> 	trace_xe_exec_queue_kill(q);
> 	set_exec_queue_killed(q);
>+	xe_sched_msg_lock(&q->guc->sched);
> 	__suspend_fence_signal(q);
>+	xe_sched_msg_unlock(&q->guc->sched);
> 	xe_guc_exec_queue_trigger_cleanup(q);
> }
>
>@@ -2392,11 +2398,15 @@ static void guc_exec_queue_suspend_timeout_ban(struct xe_exec_queue *q)
> 	 */
> 	if (xe_exec_queue_is_multi_queue(q)) {
> 		set_exec_queue_group_banned(q);
>+		xe_sched_msg_lock(&q->guc->sched);
> 		__suspend_fence_signal(q);
>+		xe_sched_msg_unlock(&q->guc->sched);
> 		xe_guc_exec_queue_group_trigger_cleanup(q);
> 	} else {
> 		set_exec_queue_banned(q);
>+		xe_sched_msg_lock(&q->guc->sched);
> 		__suspend_fence_signal(q);
>+		xe_sched_msg_unlock(&q->guc->sched);
> 		xe_guc_exec_queue_trigger_cleanup(q);
> 	}
> }
>@@ -2614,10 +2624,12 @@ static void guc_exec_queue_stop(struct xe_guc *guc, struct xe_exec_queue *q)
> 		if (exec_queue_destroyed(q))
> 			do_destroy = true;
> 	}
>+	xe_sched_msg_lock(sched);
> 	if (q->guc->suspend_pending) {
> 		set_exec_queue_suspended(q);
> 		suspend_fence_signal(q);
> 	}
>+	xe_sched_msg_unlock(sched);
> 	atomic_and(EXEC_QUEUE_STATE_WEDGED | EXEC_QUEUE_STATE_BANNED |
> 		   EXEC_QUEUE_STATE_KILLED | EXEC_QUEUE_STATE_DESTROYED |
> 		   EXEC_QUEUE_STATE_SUSPENDED,
>@@ -3222,13 +3234,20 @@ static void handle_sched_done(struct xe_guc *guc, struct xe_exec_queue *q,
> 		smp_wmb();
> 		wake_up_all(&guc->ct.wq);
> 	} else {
>+		bool was_pending;
>+
> 		xe_gt_assert(guc_to_gt(guc), runnable_state == 0);
> 		xe_gt_assert(guc_to_gt(guc), exec_queue_pending_disable(q));
>
>-		if (q->guc->suspend_pending) {
>+		xe_sched_msg_lock(&q->guc->sched);
>+		was_pending = q->guc->suspend_pending;
>+		if (was_pending) {
> 			clear_exec_queue_pending_disable(q);
> 			suspend_fence_signal(q);
>-		} else {
>+		}
>+		xe_sched_msg_unlock(&q->guc->sched);
>+
>+		if (!was_pending) {
> 			if (exec_queue_banned(q)) {
> 				smp_wmb();
> 				wake_up_all(&guc->ct.wq);
>-- 
>2.53.0
>
