Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12162C2BD09
	for <intel-xe@archiver.kernel.org>; Mon,  1 Jul 2024 15:56:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6B5F10E24E;
	Mon,  1 Jul 2024 15:56:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WgpKUDYg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 542E610E474
 for <intel-xe@lists.freedesktop.org>; Mon,  1 Jul 2024 15:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719849412; x=1751385412;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=uTer6dxSElUKriAkayZYXr9yjre19klfoH5zdxKAZOE=;
 b=WgpKUDYgMeZv+Dkr5PD3iAANOYzBDp5g4MjJZmtEo8Bph6vu5euaR+13
 PkJ6k7xjQDtbC9BWcX3eNntAiSNPo5JnjuvGNIPbQhH5mvapyzat0CmJG
 qOIis6J1xeGyhpBICaK8ipLmd7T82xSr07t4VnJCOKdlT4U/t4Rt8ONU3
 0D2QU0Ev5TX0h8wJyxew+PHtOb1iVhBiKfhu55375GzraK8k7mRjbI9V6
 puA0sUNoRY69PmcOdr2ACospADZfZuxox2vzDDQsNiZWCmV+9rflJW4yX
 boGUnOU1VJcDOsfAzxssafWZKfYTspCXldMJG4MmCSj0R583S5+kGhQQy w==;
X-CSE-ConnectionGUID: eAJeEQdeSIGg8ktKfZIwMw==
X-CSE-MsgGUID: BjdsYc1XQCuaSnGu7LkUow==
X-IronPort-AV: E=McAfee;i="6700,10204,11120"; a="16858562"
X-IronPort-AV: E=Sophos;i="6.09,176,1716274800"; d="scan'208";a="16858562"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2024 08:56:52 -0700
X-CSE-ConnectionGUID: lRrPBwUISbC+Lb85s3Fynw==
X-CSE-MsgGUID: qCu07G/DQFGgacxGnqtwzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,176,1716274800"; d="scan'208";a="45469908"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Jul 2024 08:56:51 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 1 Jul 2024 08:56:50 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 1 Jul 2024 08:56:50 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 1 Jul 2024 08:56:50 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 1 Jul 2024 08:56:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cry2BWKBDwIhAKLRidOdY8KAvjT64PbcvShXix71jbw3oYZ7WcGoy4DaX1f3mVb5wS2dahpgHZcUwreMPCiY2T4PSXTs78cJ8pETEZztRe4grYDHzw1qK5iKUOyQHu8Tshu06jY/Nhvv121ax8eeFPNMLMK1RAWk36fwMGoXfni5kGz9YS3DYBSSxysJTWRBpSouCU6yOxixA2ADmxnubYV2IjVkKgADjJfLMMEE1OTmu4nhzXqDKWtriL9bY/D/EaFQzvqWT67vuKmMFgdRArLYB7Zn3JRnfN5M+TZ69Vu4ILqnUqU5RV8rBy6bL7v9GpncnH6e0nQp9Bp+AIeNbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dzNGK1b7ngSjog1r0d/YcLyYpgoR0YpALYsyGts638I=;
 b=AAvo9HGq/JaS+RO8kbUEYSi8WXNPFBKvrBdv7jQu1PRH4CFDyAuekpyO+gyD2Xr5K3ddR1uTgke1m9ySphZu7nwyd6p65eSfdnYYw2afVEumIzOmgmli57Oh0QDpUgS/hMAQ3TE8Uv7rCFRPn6mh1d5lgBM5yq7EPOslMfYqzQ6cyHA3ZdSDAxkoU0N1qIV2c1HQMHUO9O9hrdcIskpr22Lza36ZzvvbfxTdCrvBKOPhWXVjo7P5UWWHc5aOh18EjLgw6CM32KzynHlm0Ybw3aEy6DXbCAzcI1P/vw5qRDok7uVO5BzphNsltUbm9hIyDKNhh0bdtYyMV0Rkos2zLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA2PR11MB4908.namprd11.prod.outlook.com (2603:10b6:806:112::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.39; Mon, 1 Jul
 2024 15:56:47 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7719.028; Mon, 1 Jul 2024
 15:56:47 +0000
Date: Mon, 1 Jul 2024 10:56:45 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Fix global-out-of-bounds in rule_matches
Message-ID: <7maqy22uryv6u37d7wapf3pweigf7znwklw7kc4avajkg2rqin@yzur4wn2la6j>
References: <20240701153702.21824-1-nirmoy.das@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240701153702.21824-1-nirmoy.das@intel.com>
X-ClientProxiedBy: MW4PR04CA0246.namprd04.prod.outlook.com
 (2603:10b6:303:88::11) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA2PR11MB4908:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ff81e7a-06f1-49bd-3b06-08dc99e669d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?foPNYwWP4/+bvohWUP0QAfEZfEG0aQNiz3HLqKdwwC+fkMnxt/IQh0OYjNT6?=
 =?us-ascii?Q?ouJ4SnjRcPuohLf3dSm+4ikSzMup9bs7pwQlmYxetcW8nDs2k2Zr6Gpkvzin?=
 =?us-ascii?Q?xIEIAw3oPM6KC59FFAT16Aak7Kk/tiYYSRYl9rL2RTqxrbB7y5eYXv4IrtlE?=
 =?us-ascii?Q?vOogtURWLdzPjRWqRRZRZor3DifiP0jXNUEcwp8hL7C6/hjqeI4PQX8J7c/J?=
 =?us-ascii?Q?wNa9dbipyRr8t5giTmZEeZS1/xhXz4g4+IFdSpd0EZUXRP1ZTI1Lhaet8dO+?=
 =?us-ascii?Q?BFEQ0vfalw1G0EM0IcqBY+bvl7f80WPCX8E2ODvZu0Xqp3hxUxIIKQl0kxS8?=
 =?us-ascii?Q?1XHHfAFmyi1EuD/r53kNXinU/30OT9/G3vXMoAZK5O5Lqk0TGjM3k49rsbNM?=
 =?us-ascii?Q?LvrHGtBIW9mbCc4rsbzoO+evCWlpBXx71oN4NniuKxi+CBi701zst7gd1paM?=
 =?us-ascii?Q?uPpVDMNpdNYusJo1m6+DiOjV44ImlTRfph/U877F6uploExDwtFTLLOm2he+?=
 =?us-ascii?Q?gIFpR3CCHkEWCE8YujjDTtVcd+9KkkseGpiWxer1Y8Y+zeRfVx2UUsB4Xaoe?=
 =?us-ascii?Q?zbwD5f1PigsRZinyFBrscv+bFq8NpGWE/4gHiuG5tvJ7XFaXe1WCgXVcPlDc?=
 =?us-ascii?Q?MEuNboGCZcVHAr/4UIZdJdQElCKBGsoDQJHUwXYVxi1F1QyCH0ZVpz+oKa89?=
 =?us-ascii?Q?dd+JynMPSgQA6zL361hqD+pJJQ27Bf/bP3kwITdsmD1mIPJv3C8Spfsxt9im?=
 =?us-ascii?Q?FcFGqRpqw9j7EWz9nMFpp7h7J4Mc+vySAYaWgcMQpZ4Aym2oEPm5x1QWVP7Q?=
 =?us-ascii?Q?YUFJIQdGYEq8IyZ5QIw087kv913FvRq60xGnwReYaa5foNQtkRcO3QniQrXh?=
 =?us-ascii?Q?7XjcHJu9FbV9VTKv88yg9tZ4BtjTYpYP0/l+CflGUPydfXb24zURB5hrZ4vl?=
 =?us-ascii?Q?R0b0FVhDfDCcZsfShae6iDczbMfoFJId7lMPd7f6UP5CTXFFpPsxboTABj0x?=
 =?us-ascii?Q?tTyidJXltaje1CVVCACPJ5OnqAJm5lzogPvwue4gNBgth+VrIK7cUQM6xcK9?=
 =?us-ascii?Q?H3dihyTMlSBP2BUheD9ys4gPhwC2F6sKWzDMeTkGH35bmmE8EPi4DUrBFLYf?=
 =?us-ascii?Q?PZzQXXhOPVwubUP2zI+BLi/6HchEjZromoAo+FPFf8jZq4N9JGkAZO69gWD9?=
 =?us-ascii?Q?M3yn53FB0U4/P4kSX1j14Q8YtxQW86X3lBF9IFasBVj4q9CHHT2OisWtusx5?=
 =?us-ascii?Q?JE387uexF3pzjnWLo00RpvD5zAy9t9sx7h9djFlD6Ora93Pz9+6vQdrDgXpK?=
 =?us-ascii?Q?2O0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LIvs6HSAehtR1VJ3I5An5lBhe4M98kVqELd6MmUV2i9d/0B6ARFW9BFLGwam?=
 =?us-ascii?Q?gFnwk/usn01MLrMcVdwM+KvHeBhjynxbsgAM9u0vJiH1mqbsUyF8/RMnVuel?=
 =?us-ascii?Q?dalmUICQaRI26q4ydnUb5OgmGcjZwWUsD7BQd2soEx+bPeUXS+zyvHhDlFoB?=
 =?us-ascii?Q?hFbkDRp3MYFO2mVce5nHILE9ewMk5tvycMVhXLl2/wIzsjX0QbQLRQnytSnD?=
 =?us-ascii?Q?87P16LyaVH0wCPy1aw7dzhdt/fAqwVLnXKAlMPjYgglrTEcVN3Kv5pP9Ln+0?=
 =?us-ascii?Q?cjU6jNC3yxEprMod87De0UTqZt67FRFUj5PIKo1ygpeqxfrEuhNWSEsDhRrf?=
 =?us-ascii?Q?JR7XfajCv/zRiHfsWvgdTdzpSEczbeMvNCESj+vZ+BwbWFigKwfklKTwye8c?=
 =?us-ascii?Q?fdBAyeCM6JwDiUhxgVeETFZ51XdALm62PX1pXNqFpc4amhLqHnB3zM9c3qdi?=
 =?us-ascii?Q?MliXgN47Ip+M32Ygv6P70WXy+i3/cYaaJexiGC0PR9K5j0oUS+DwBJfjKtCp?=
 =?us-ascii?Q?f4aOmk6I6gypxMW9GsQWMOOPk5234mOR0RjH7ftpwtwu+nYLLFBXU5/0ZBEO?=
 =?us-ascii?Q?/NiFYBx3VqIC0KfZfZ76+LASgX8h3aw92cNjE7lZ+TafS2H8ae/m4R00l2yE?=
 =?us-ascii?Q?zqaILTfqW4lAP3YgwN+SGyjvmaTY+ShWD8odTyQ33AwPuu4Tw2rnTE/Tuzzq?=
 =?us-ascii?Q?G0QRDXhWFoeGeD+FEYtx0zoRRMbH+XSnhGcdjomvApEgXxlAdanWpFLzImZE?=
 =?us-ascii?Q?pCQ3OgztJB1QZpIIpmAx49uDjC/CO6XTm5mb7Hv9+din4OUK6e5J7/V/WO6g?=
 =?us-ascii?Q?wOIsQZsjllxDSmIZMGSlMP6sncJqYzjJN9m9cOIUZXlbcyPj+1zCmJAjpfuc?=
 =?us-ascii?Q?aylggvDrjK7gdoBrtI+V6owTRRYbAJl9coJ0IwpH3/Cs8txR/0i4o+8vYaeI?=
 =?us-ascii?Q?0CIGo9Hn4O0b79jfe9Z2ZmpV3DieNn0BRl8bs9iSbQXT7noW+w4VJdZl57Di?=
 =?us-ascii?Q?m4Kn9j46yEeOI+UZ88sPyhbhAOr7V+41FQarpwODDK+B8suDJ4LiljjaXlVg?=
 =?us-ascii?Q?ZyYC4HpFKbNN2iePsa2CpbWndxSfXQbnegYD0015aw1xcuMHogsphUyLJPgc?=
 =?us-ascii?Q?eS7L64S/RDj3jdCVDX9v/mnoAKs2pYkRXXVLXQ17FTkwNji/uWk1d//xnaAJ?=
 =?us-ascii?Q?4tOAw7tV2aTjLdQWIajpkYG/rd1Rn6/ZUet/BzvpzUz9bP3mCIYh5wXbDPuY?=
 =?us-ascii?Q?lutQQ1nL/ZbbXOGkCjJ/bI7L6FEJczzMDyykfVpauyzKDZMWKaBaxLnuzgUL?=
 =?us-ascii?Q?8pV5fRvKUtLxS61PP+r5wF7ee0hGJ0iSpvP5seYTx4UwrYfuuWwC/B6e97Z3?=
 =?us-ascii?Q?344sodKaVsIQ4SHs+pqmwwf/nEmN3CKK5b1Qfr17310Q47cUXtl1izOELCvF?=
 =?us-ascii?Q?2eYXFSEe0oXWX8FnwqqHqAjHvhs9+K3zeYFhS2FUBJzC0Z3/ZHaKyAUMSMnw?=
 =?us-ascii?Q?mZL+h3+rag6MkpM9c8G02n3tE5zYV8t3wSr0+3o0J+/83qf27U4YmhnXhDIT?=
 =?us-ascii?Q?8nXZYByzAgAAJL6WNLkXZaQQk24D/9JfT7oCmyNJkvb7f+JcsenmuGr9Gh34?=
 =?us-ascii?Q?YA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ff81e7a-06f1-49bd-3b06-08dc99e669d6
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2024 15:56:47.8781 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hpaG2uqFa5p2sDUH8CrcUppRXx4EpTjPQdcjJ0KL2gTUQkULfPi6A30nukdTYjV6+Wik55iG0BbPHJ8G9/bbCxjZHw8/k/hghxGmAt64Z4o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4908
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

On Mon, Jul 01, 2024 at 05:37:02PM GMT, Nirmoy Das wrote:
>Do post-increment instead of pre-increment to fix:
>[ 9344.404516] BUG: KASAN: global-out-of-bounds in rule_matches+0xb72/0x11c0 [xe]
>[ 9344.411887] Read of size 1 at addr ffffffffa330b210 by task xe_module_load/248463
>
>Fixes: dc72c52a42e0 ("drm/xe/rtp: Allow to OR rules")
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>---
> drivers/gpu/drm/xe/xe_rtp.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
>index 5b27f7c45ea3..f6ec8df5fc94 100644
>--- a/drivers/gpu/drm/xe/xe_rtp.c
>+++ b/drivers/gpu/drm/xe/xe_rtp.c
>@@ -121,7 +121,7 @@ static bool rule_matches(const struct xe_device *xe,
> 			 * Advance rules until we find XE_RTP_MATCH_OR to check
> 			 * if there's another set of conditions to check
> 			 */
>-			while (i < n_rules && rules[++i].match_type != XE_RTP_MATCH_OR)
>+			while (i < n_rules && rules[i++].match_type != XE_RTP_MATCH_OR)

this will double check the current iteration. A better fix was posted last
week and I will merge it soon:

https://patchwork.freedesktop.org/series/135527/

Lucas De Marchi

> 				;
>
> 			if (i >= n_rules)
>-- 
>2.42.0
>
