Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36A68D75BA3
	for <intel-xe@archiver.kernel.org>; Thu, 21 Nov 2024 03:29:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3F6E10E09F;
	Thu, 21 Nov 2024 03:29:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FbKK+Wy7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A00DE10E09F
 for <Intel-Xe@lists.freedesktop.org>; Thu, 21 Nov 2024 03:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732159773; x=1763695773;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=C0lnZZUwxPnpbHGNwQ/U6NNGydxQzSRDe+lUIYHtTqE=;
 b=FbKK+Wy7xfEZQ1mH56Pa9OpVajzGDEZC4zh73tNFsusA3VN/QvpRAADY
 QFLKXz0HmZXqzUOsLuMELfKOmMvOvi8VJACcRrAs5AaBhXMUCwYQZsQmL
 ojpGgbyRZ4FgTQuhAzSeDKNmWl9eFf6Cf3f1g4T4S78DqMgPByptgnKRP
 k7ejpQnmyqi79DY4a2r4FKJbN5z0TmwNpgebRTOVRTqJzJ7nk6ruUN+nW
 RGrVN7/HkaI6g0fItgfMa7F8YiYFRHPCjH5NTt3PH6+Kl5dAqF+giZXZC
 4TdEsnZu9P7cCSBqrQ6/tvZetCXATlQhg9m+oN5mJFhxyow19iRBM7lX+ A==;
X-CSE-ConnectionGUID: SR1/cKtsSQyWBfqgHX0mGA==
X-CSE-MsgGUID: wCNfdB52QvyV0R5czZD3jA==
X-IronPort-AV: E=McAfee;i="6700,10204,11262"; a="36031381"
X-IronPort-AV: E=Sophos;i="6.12,171,1728975600"; d="scan'208";a="36031381"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2024 19:29:33 -0800
X-CSE-ConnectionGUID: ZpKOerKMSFGnCxy38rdj/g==
X-CSE-MsgGUID: ymCbBPZKQa2Hl9VyXVOvAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,171,1728975600"; d="scan'208";a="90072872"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Nov 2024 19:29:33 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 20 Nov 2024 19:29:32 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 20 Nov 2024 19:29:32 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 20 Nov 2024 19:29:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BIXDp/1ZMljbQG/LT6H1e2WsYfKAB1XX3h3UJ0h1KSa1EM1nKWCSqIKCvhwrC9pk7/smdkn5t74JC+8eVTw6c314FXoqimHz0PGyEV+QzoIXuna+Dt1T8hjg1mCRqbyxZS+Mx+8A8VzVxxYHgfnItKVZbEvTcS6sNl0YuHkaYqeaCHaZidhdNn/J+3XT8ZJKBW+rWoLf+ACd9RCQ4k4bI91VWR+qTg8JIUg7YEIgaTRNQ98m5Mgmi1So4haTJIcVIM+jV54WfppWQh2RYl21RFEiO8ajMm5ZunmhcnOIUVUCl6lPTfmilc2EtsGXYx/OVAjBW4CxdibDRneKTWREMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iDGX28H8igqtuv1AgtFHZqKifwBIGr8crIdQHUlpLhY=;
 b=LxglAN/Yt4OU8QkJ9/+/kkM+6paZJJpV3BsRiZCu2Ekw8/naCOCfuJU1lups48BZYtUpScULdw9wqE0BfsxUuj7EnALsH/B+7V2Z8Xa9EVtWufcx+DByxuDWZ0Agaw/IP6npybYcLh925jIZD8tGaO91zaOxJ30POoxOoAK0g9Uu/0gBmEoF1B7Htk+1zLAvGga6LkQhacffE+TcgLhdTAjsJ8n0pu4KG5z9iR9A3yjPQyxFu5fKSDu2kPJ9vNZMF1G4oET09gJ9mcWvLYpVgIoq78de03OBZay7yHN73/afetUxNGwiDY9Y0WvA77EcLq7oETqkPxW28X2CnHIHaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ0PR11MB7155.namprd11.prod.outlook.com (2603:10b6:a03:48d::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.15; Thu, 21 Nov
 2024 03:29:28 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8158.023; Thu, 21 Nov 2024
 03:29:28 +0000
Date: Wed, 20 Nov 2024 19:30:04 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <John.C.Harrison@intel.com>
CC: <Intel-Xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/2] drm/xe: Add lock around devcoredump capture status
Message-ID: <Zz6pPI/q0hfTfZ3/@lstrano-desk.jf.intel.com>
References: <20241120232257.1025282-1-John.C.Harrison@Intel.com>
 <20241120232257.1025282-3-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241120232257.1025282-3-John.C.Harrison@Intel.com>
X-ClientProxiedBy: MW4PR03CA0227.namprd03.prod.outlook.com
 (2603:10b6:303:b9::22) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ0PR11MB7155:EE_
X-MS-Office365-Filtering-Correlation-Id: c11994a9-6da5-4366-d2b4-08dd09dcb494
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?qZh0iFYxhoaOF1DZYJ9rsJypJB/KTTLghMdECm4JoDMRLDSKLMdVsS9LjcSg?=
 =?us-ascii?Q?PlqMvL7oZPx9NaD39EkamZVMHOhEF3sLlYzDEnPYmebVqkI3nzxG01lhLrtj?=
 =?us-ascii?Q?bmMOnKZUhc+qHMrKonTcQUzFPTiWoLdORpet8xmmdxqZAOsykfM1mEnHJSxR?=
 =?us-ascii?Q?RuZkrEj2rZpEsMfZOrPWVS5xLH98HzzFoaUzCVNgK96EcKUAkhqt2gyqNa+E?=
 =?us-ascii?Q?M80N54m56iAYa3/lpOkRGvfX3yrs4GJeZWl5KBJDoE/buqurkFU0L2NeCYIO?=
 =?us-ascii?Q?NsRIUTx/gM1j9KE0OXfLk8AKKp8l97PH1dZy83HXizG6mwNqtMgMmoB4bTU+?=
 =?us-ascii?Q?hLkd/zOHf0FIIPL5Ibnr9MOZ5h6DHhPL52BH//J5yRFL2W5/z0JwYcBpLke9?=
 =?us-ascii?Q?G+o39LqLGcGy+TIhgaKzBbbD9QSVAthf0bpWgLPD+qJh/e+xKLI4YZF8aTLb?=
 =?us-ascii?Q?Iv9QtO1kCV2ZVPZ/RLegWYKSajo+BXcsaOW35PaPYXrqIEF61fQXZBN2k3I+?=
 =?us-ascii?Q?rmcGRhUz/ilfnnVyFdeIBYqSDN0XrfHHN87nvbNPe1/fPjxN/X1ZqyUidhYr?=
 =?us-ascii?Q?klCFNu9zJL4Ld0mgDP8ir0RGI1dAbqzidgwbuBvWZVqLoCCmdK0GyaNgwdQL?=
 =?us-ascii?Q?vqW2qH33amtmwN/Z2Otjrxs136asDkVd+sjJIOkSy0W9LNis1ZdInnz9T4MA?=
 =?us-ascii?Q?OU+h6p7IBUJM3E1cnByVniWxTODjPvpyXLet5lOZjUl8MODBN3qLzj0xcBGK?=
 =?us-ascii?Q?tDnqj1sJVRebytk00HQgDoq10mZoFUZn1sZ82L0R+8GwzwdGUFudWqY1YZMB?=
 =?us-ascii?Q?yVTsENnIi9Uk1clDsRDO+MHDDdPQZXHt/NkSCqoZUyP++rhT/6TPk1bI42gp?=
 =?us-ascii?Q?TjVPKTxfDQ6/w4gUaxfCvFtUTbLmOW3+OuuoXV04El3tSmyvdjg/ozo1MQI/?=
 =?us-ascii?Q?6VOIoARMbxUmWIzpq88BGxWjDH+Mq4Q5h96Gqx+FqObP8J2ZuVAKJoOB2IFL?=
 =?us-ascii?Q?GM2dEYUrNthSBb5RYuCyvkjDyPOpPSp8OCioZZEf7cJ7v42FS1ghBvQCKxID?=
 =?us-ascii?Q?HIrGC3ntDMGCEShLAcYFH0w9ujuqoe29y00skxiB8AEEJridNC/vfa7hcwNH?=
 =?us-ascii?Q?o8yFqbolBQmnPxzwinqRY0xKxMZsO5ChpWUROrEjvOFo0T+mpU7F6sDGj9J4?=
 =?us-ascii?Q?o/QeoAAZO45KoIkwBYM1NJ70zY1em/njySZRnEyO3AeeF/nB5w3o/cJzPBpp?=
 =?us-ascii?Q?7prI+eYy5zNTCdl4mkDfxqrTo3ocz49ZkSm4aaQIVCmKQ7PQiFtkDEOPe/sf?=
 =?us-ascii?Q?Zu2BQYX4e6b3SGyLdA0icREw?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RqD4tXTE1OK6tZ++vISZCDIVhcBXLsIwII83ekmdeT4upUGppw5dGg11sRvN?=
 =?us-ascii?Q?Mzt933j49mrNkznme4QhwslWQ2QjQ+ya0OWYmq4AZNXUmlRJ/7FsKJE3XBqw?=
 =?us-ascii?Q?l+iNeGd/AhpgisdNy7FFOOcpe//JUw0yWeH76J9uRV9KRw7sAMIwSVrt1kN0?=
 =?us-ascii?Q?wIj/ssXck8ZeXFEW7F3dj1dh2V3grRHNlsrWpvzZV8qknC+Ck6Q6hriqTyPS?=
 =?us-ascii?Q?gcxIepliXprpq6HoOpIBYFZU4DD7NHGFixiUp6s+Ktm9dA03VfyDjcpkK7vF?=
 =?us-ascii?Q?beplRORl9tyZV2AQSBWhgbM9R6/Ai39klFihPdgAWpTy1L+FsLKRXDRcPQoy?=
 =?us-ascii?Q?2jofHoimrmTY4mHE8zHa8WlHsnaKefTN8Dt4309GbA3OaFh2HIpuD5fImXH4?=
 =?us-ascii?Q?HKD2ZxMd2sx8mDQ3/m3FWdLQTTC3vPBtxHWLimGeqCZya6t1WwjW8h4+Rja6?=
 =?us-ascii?Q?c3nRRhXYS+u2F1hJzP8t7igCkgdMWhcAizlBWhU8xcfDyDgQrxB5M+HSxIEo?=
 =?us-ascii?Q?4jCMwBAyRXS5az8LS9/zW5/vG1yUegRpj7LZjSNZD/mtR3JGZGLHTLQcaRxa?=
 =?us-ascii?Q?lfqT226F5BjGsBld3pu58pRT3/ovUmVaj2lEKNOxXMBVA58t4SvL28gG9nb5?=
 =?us-ascii?Q?gGSuov4HSGl1aipqJ4ch+e8yQUBRqMJanGd3VcRinOn43BK4RAmhow+AJrAF?=
 =?us-ascii?Q?B9QXlOHg8dO0vXXWIqYebmGPRkAXGHuE2o2w4FsikxFXtlcOdCjCIVWw7onv?=
 =?us-ascii?Q?5/f3gRuUdeZPZ6ADO5bjWHUIOGvIqk0+tQx4AMvLRibcmpmZVHMzccH/phEP?=
 =?us-ascii?Q?+EMTiBoC6cG7GXRDllCnGqvbGz3GRD+ylGFvhn7FPAiRyz5W6xiOzWapJYMh?=
 =?us-ascii?Q?Var3wukn5LBD5q66jAdGMOKUC25+2MvyfBOAMxrDSjlK11ZRXzDfPINAvaup?=
 =?us-ascii?Q?m3XHtUIO8IiAdXYG0WGnyQr0tCAD47d2x3ZOyma/SP77LCHVUKx6kJ2Ia8n1?=
 =?us-ascii?Q?gqY/5FtlQIJlLLUyk/H9MU39mSSCeh9/+KgWgqwqPvjTak9Qd87U+T/aeGSs?=
 =?us-ascii?Q?GN2CxtnMh+/lVKV6slec+sjNy7kgPiz8NRq5GZpYC3M6SVvtxRngpdec24Vn?=
 =?us-ascii?Q?e/TKhlGwENYyc7uT/+ZB5uFD9zP+mbIsJM7teEet14bFmGCeZg4WiFFw2efa?=
 =?us-ascii?Q?OoCckuLI5qBYnkOmw4XsYf4Ucf6XYMR5AGIL/teCo7kQ8QKlLdnMTwuDtkYg?=
 =?us-ascii?Q?EGmFqaCZYs0I9IfqT4tSJJ4IsQRdqGXp0m7wKW88+BW8exgG2ScAAyDETrds?=
 =?us-ascii?Q?5BUco07OOCMq03v9SRki3FbZxpFhLqQd0GD2JbvpGaHWyEhv00QXzTn6Bhsg?=
 =?us-ascii?Q?xbtMnknnF6wbq5no5iWyifSkJ4jzodq8cc7Ln3gqSVh1FUr/RUeRpD7P/5rP?=
 =?us-ascii?Q?7seVO/f8TNiRof6fY/XinPKpSloIVTTGdyfNlFSKagNysCcJaIqXYU9+21j7?=
 =?us-ascii?Q?6yKgKPhHlxQ/GaNYTvcr12KK4AIs0WzlO+dA6r4BNDhDsuQqbM5EjUu70OzB?=
 =?us-ascii?Q?jiRochX9ofEez6Wx3uOPoScoP2/HIjN+QVOIAbA8uNw3WJChW94r6anIKKqt?=
 =?us-ascii?Q?rQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c11994a9-6da5-4366-d2b4-08dd09dcb494
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2024 03:29:28.5005 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w7UnvnMniGPYnAVuNl8wO1b+fsxKo0qum1UPUTXBAw3AdBevS5avvWhwxTh3yO9tv6Z+XjwbhMQVvviTCnmkKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB7155
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

On Wed, Nov 20, 2024 at 03:22:57PM -0800, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
> 
> There are now multiple places that can trigger a coredump. Some of
> which can happen in parallel. There is already a check against
> capturing multiple dumps sequentially, but without locking it doesn't
> guarantee to work against concurrent dumps. And if two dumps do happen
> in parallel, they can end up doing Bad Things such as one call stack
> freeing the data the other call stack is still processing. Which leads
> to a crashed kernel. So add the lock.
> 
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> ---
>  drivers/gpu/drm/xe/xe_devcoredump.c       | 18 ++++++++++++++----
>  drivers/gpu/drm/xe/xe_devcoredump_types.h |  2 ++
>  2 files changed, 16 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
> index b5aebe8fb06d..05f3c9185ef3 100644
> --- a/drivers/gpu/drm/xe/xe_devcoredump.c
> +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
> @@ -235,9 +235,13 @@ static void xe_devcoredump_free(void *data)
>  
>  	/* To prevent stale data on next snapshot, clear everything */
>  	memset(&coredump->snapshot, 0, sizeof(coredump->snapshot));
> -	coredump->captured = false;
> +
>  	drm_info(&coredump_to_xe(coredump)->drm,
>  		 "Xe device coredump has been deleted.\n");
> +
> +	spin_lock_irq(&coredump->lock);
> +	coredump->captured = false;
> +	spin_unlock_irq(&coredump->lock);

I don't think you need the IRQ version here, or in the other usage. I
don't believe in either case here we are in IRQ contexts, or if we were
one of the cases would use spin_lock (already in an IRQ context) and
the other would use spin_lock_irq (not in an IRQ context but another
case can be). Certainly taking spin_lock_irq in all use cases of a lock
seems unnecessary.

Is there some follow on patches where this changes?

Adding the lock seems right though and should enable coredumps on
multi-GT or from which are not the GT ordered WQ.

Maybe also add helpers like...

void xe_devcoredump_release()
{
	spin_lock(&coredump->lock);
	coredump->captured = false;
	spin_unlock(&coredump->lock);
}

bool xe_devcoredump_acquire();
{
	bool acquired;

	spin_lock(&coredump->lock);
	acquired = !coredump->captured;
	coredump->captured = true;
	spin_unlock(&coredump->lock);

	return acquired;
}

IMO - this makes this locking semantic a bit more clear.

>  }
>  
>  static void devcoredump_snapshot(struct xe_devcoredump *coredump,
> @@ -310,14 +314,18 @@ void xe_devcoredump(struct xe_exec_queue *q, struct xe_sched_job *job, const cha
>  	struct xe_device *xe = gt_to_xe(q->gt);
>  	struct xe_devcoredump *coredump = &xe->devcoredump;
>  	va_list varg;
> +	bool captured;
>  
> -	if (coredump->captured) {
> +	spin_lock_irq(&coredump->lock);
> +	captured = coredump->captured;
> +	coredump->captured = true;
> +	spin_unlock_irq(&coredump->lock);
> +
> +	if (captured) {

Then here...

if (!xe_devcoredump_acquire())
	msg...
	return;

>  		drm_dbg(&xe->drm, "Multiple hangs are occurring, but only the first snapshot was taken\n");
>  		return;
>  	}
>  
> -	coredump->captured = true;
> -
>  	va_start(varg, fmt);
>  	coredump->snapshot.reason = kvasprintf(GFP_KERNEL, fmt, varg);
>  	va_end(varg);
> @@ -342,6 +350,8 @@ static void xe_driver_devcoredump_fini(void *arg)
>  
>  int xe_devcoredump_init(struct xe_device *xe)
>  {
> +	spin_lock_init(&xe->devcoredump.lock);
> +
>  	return devm_add_action_or_reset(xe->drm.dev, xe_driver_devcoredump_fini, &xe->drm);
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_devcoredump_types.h b/drivers/gpu/drm/xe/xe_devcoredump_types.h
> index e6234e887102..6b776abd8bf4 100644
> --- a/drivers/gpu/drm/xe/xe_devcoredump_types.h
> +++ b/drivers/gpu/drm/xe/xe_devcoredump_types.h
> @@ -80,6 +80,8 @@ struct xe_devcoredump_snapshot {
>   * for reading the information.
>   */
>  struct xe_devcoredump {
> +	/** @lock: protects access to 'captured' to prevent concurrent captures */
> +	spinlock_t lock;
>  	/** @captured: The snapshot of the first hang has already been taken. */

Protected by @lock.

Matt

>  	bool captured;
>  	/** @snapshot: Snapshot is captured at time of the first crash */
> -- 
> 2.47.0
> 
