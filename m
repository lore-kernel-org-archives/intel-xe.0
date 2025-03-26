Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2554DC28B30
	for <intel-xe@archiver.kernel.org>; Wed, 26 Mar 2025 04:23:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE00A10E102;
	Wed, 26 Mar 2025 04:23:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DaO8O+kM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5FB410E2AD
 for <Intel-Xe@lists.freedesktop.org>; Wed, 26 Mar 2025 04:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742963028; x=1774499028;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=C0lBrSDquMWGI7rIN+YwoHXhX1Q8LzeE7Nide8iYISU=;
 b=DaO8O+kMpqw1PLNL2vLq2WNJd1Xtcg+aOY9JCZn+FIp6MpE7DaC2u7D9
 fxblFHuVBYmn2QhuG9V+I1I2M7LfvDy5ucO4IbyKDuHmHTCPn7cP72/Nd
 AiB61c+QJbghzVzTtwwcYzO9YsTnkWemRCA/Y0MnMkIIFYpmprqEkMpeP
 DOB+yEQmdjLrE7G+0MwWchJDeBgWNxw4NipAG7swiuOh0yswLIKp2n/S1
 ZzFhCXLteGAYWrwQuUMhROKcclh7TQ5LT49+th6/5XoowA+DDmipHg/ML
 KdfE1M7xTeZsoewFSeYV00I8Zj45QljfQtxzfzJ4Mpuz6qafH0ZrWZGZi Q==;
X-CSE-ConnectionGUID: V9PVwrP0SGKHYkbfAblDVg==
X-CSE-MsgGUID: hIulymv6S46QDodJrbAehw==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="44249870"
X-IronPort-AV: E=Sophos;i="6.14,276,1736841600"; d="scan'208";a="44249870"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 21:23:47 -0700
X-CSE-ConnectionGUID: hEM9xoAQQvqAeFJ/F/m0BA==
X-CSE-MsgGUID: 4j3HvLegTPKO7A6VCNxQHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,276,1736841600"; d="scan'208";a="125160907"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Mar 2025 21:23:47 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 25 Mar 2025 21:23:46 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 25 Mar 2025 21:23:46 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 25 Mar 2025 21:23:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bCnEP1LQPCXM6vdHG8t/xWNMKh+UQVt564oRdGqm4OtgqdpVztt0SZSDpUUvovCWJNHvCpedTkx3ZQOAEvNlUm98mbMCaHx/FiXuYQqAD0T5WBe6rU7m/k/YJWyKfcChE3CkNYbtkAUuCtIUwmPNBliivrKTYJ6MC7gmQ1Xa3Te3VQeOHMqHLCDHGwFVtAtrukmFcXOTSLlGJL1scMasqrMhWLPyBypVv8oDvYmHI3ToxySqRfWLqbvC2wZgWVbwzUgaGfwFN6bFmZCnmoCGOElubhp2Q/tTxOKkouSkPw8UVAg/bGlevtZ3s+WCMqgBV4kJZLKQtVnlPSCE3ZuPLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lI7tuKIxzRo4UryQUy8Tj7zX2i/HmRM99XF8066clu4=;
 b=iYndPn7qPe+3w4oFRDZEqybtkARMLrk41zAW4lL5mU80bdM3G2MfZ/DlDiFU1goNMPNTc0KqG1X20+be6j+DBKrUcNjlFd0xJD2jtq3P8hUIizmp1CKwV/BUlHdEorpvYRK4K2mlZY18cdUIvxNB8ETy4GGASfj7X/J+tw9j6FL5zv5mmbqAxwXSBWGR73P8r9XNxIi1vBwUdjMpfpdkRYe2ZvS0M+4fJabFq9YpfnNKi/hnu6bORvLQscH110inCyx1jDO/5sm30XDRYlHGk8aWKcQRQJxF5sstE/iPKR05peUR5K7JTFPXVltUFhu85N30mqcgjlZeY/ROGdXlww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA1PR11MB7342.namprd11.prod.outlook.com (2603:10b6:208:425::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Wed, 26 Mar
 2025 04:23:04 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%3]) with mapi id 15.20.8534.042; Wed, 26 Mar 2025
 04:23:03 +0000
Date: Tue, 25 Mar 2025 23:23:00 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <John.C.Harrison@intel.com>
CC: <Intel-Xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/guc: Reformat dead CT reason string to be
 devcoredump compatible
Message-ID: <hjjianx4m5vd5tqwfzzmmub3lyu57kvhhihx5wzsmunvbhfc3l@quofrbeoyxmj>
References: <20250325203111.3907426-1-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250325203111.3907426-1-John.C.Harrison@Intel.com>
X-ClientProxiedBy: MW4PR03CA0063.namprd03.prod.outlook.com
 (2603:10b6:303:b6::8) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA1PR11MB7342:EE_
X-MS-Office365-Filtering-Correlation-Id: 3463b917-5d21-463e-3c8b-08dd6c1de6ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|27256017;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?lhxpQExw6O9dXXkQ+SbYrV0ndnVugC8XiozGZZTjjemgaqPOTXQNjgaTws59?=
 =?us-ascii?Q?aSRokbgAVar5MwijXYcrmD+kW8jPFPHMZt8B9t4vifMWVK4je/rM9+ZAHqbY?=
 =?us-ascii?Q?KJ+FqiDkwIZYMFY4vbOp6lTGxvlMDBWogBaqSBaJdUo4sCtGVxw3PoiTS085?=
 =?us-ascii?Q?mvTgiSogBTdCRGIa4rJALHyZ/i/CDAXOq4wDtX8VGGPyiqlURPHoVcp54e/M?=
 =?us-ascii?Q?N8T/dqX1bUScS9zMTV6erTPqO0UHodVmH+925ykd0QMAqmy++e4xc07LkCU7?=
 =?us-ascii?Q?4ylBGfWw+ESnfc2PuerUJwt62a9AXfBMsDzZuWmPEwYIL9PtNEFWrrqwpAfa?=
 =?us-ascii?Q?fIdj/eMJc9kPJ3IINc+ZFuBCO/alaKwxs1GjOikvOiRVmJEThpc7+xa36Js7?=
 =?us-ascii?Q?xdNbKSCJRM0UvvHRo6hrDMpjj5YauuwkKKtqV6Dg2hTQWpiue6V8ImCysXhw?=
 =?us-ascii?Q?gADNGp98fDgVW7hZS9TV8q2SAN+m+uN3Y/xi5loTuEoPowEVTs6cTedIwJ+Z?=
 =?us-ascii?Q?B72tzpzXkkwL2dMncTw8g1HZw487uSLeB0qBQAkjTrxE3JJZcGY8+eKcAoIc?=
 =?us-ascii?Q?gYk2rP+xjh8IAaKE3qGFnTZiV5Nujt4q2muw73dBVCFcfTcBGcyd2OwIDVhf?=
 =?us-ascii?Q?9EZ7zi2FIE3PZrb1XK4LmqhVuI35AMPzuJPP3soRC7GQWbubntDJK48evQYB?=
 =?us-ascii?Q?9VGzp2PguCpc+djARYm1s+BIipNq2Od4nqPUy+i/mk3RJNE+7QzryKFz2nv5?=
 =?us-ascii?Q?w7/E7YLkdGHcl9IU/NNoBww+AQ16wv7edocnE6fBx4hjsK26AaZdyReKrYzT?=
 =?us-ascii?Q?wx684ipgJfRQjvc2StO5WIo9O51G0OkhNEa8k9/Gndg3j+XRo1FShcyBXHxS?=
 =?us-ascii?Q?4XsFiILre4TVdQyXx+kOd2BriPDwZFxQ8R/+MTxorgOh9BccII/o8yUnL8Fq?=
 =?us-ascii?Q?zZxvCeMXS+cFZnUHzgZJRWaGC44oOLmCp/9ksGUKUbFHVRNpxgo1r3a1LLcO?=
 =?us-ascii?Q?RR0AgvWG8DsOHTYdzFNRp2x7FwlgDOxI5c/oj53YFegJwy+INH4TkwUfuBBb?=
 =?us-ascii?Q?3lO3/6Psy7TDPfigSt5//WYwr6FulJw2OFSOltDG8zMe9wcTL8poTZstfx+f?=
 =?us-ascii?Q?tnRREVijkJ3jttjS1JQwFMepHNDfob1jkOear5X+Ti1TqVoM00bre829+pdr?=
 =?us-ascii?Q?pYLQ8vgpTa1xAE2n9QGcoUx//evN9P12RjGA5Lr/rn36Evq/1ar6Ryc3LWWj?=
 =?us-ascii?Q?DxmyK5aiadezKpwV2wYWBo40AcZNIH4+zLD+AWKVYQV/+6sdl2BgnAEnuuiY?=
 =?us-ascii?Q?8NdPJBvGl5jczTXiTbsA0mhFgq6sfxCIOq7L4Cpz2pgtuatxqJLtApZCAN2a?=
 =?us-ascii?Q?HcrOKnK3qRlVF8Smt9wauBwdA4Y+3QKbW/QMXYcZOnwz0JOtczMksrX6ADDE?=
 =?us-ascii?Q?ppaMwkssLOG0EjW3VUIE4AeVIss3fW6O?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(27256017); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?R2K3QHtrPGkiWmy1HbCDXqcOB9iPz5ARBBWiNWVe5bI4fCQVBUqCu+ma9mJA?=
 =?us-ascii?Q?afZ6dANLwX9nv5BxNohAZiM65/v3GZT+2+Ngk0yBETn5qcEtbUyhja6WEar2?=
 =?us-ascii?Q?jivH5SzQIWvhup1yy4G0VuI0kOdtCqy4TOzjSCNIQYs0HDDspWHZK+wNIugo?=
 =?us-ascii?Q?fryGxRzGEwnyqYORaGmIPpPu0z0QKRKKnLBIixaVSTOoYGlNsN7YCZL4aHCl?=
 =?us-ascii?Q?rJ8hmJ3GqoCQ0o+mkpO988Ntkg18cy0DD16sDkWVSv0psz4fkWuFY1YycTdQ?=
 =?us-ascii?Q?KXUZPPYc7mF0adH8OW0p6mPJGe7HnR1LVNuJQAc16/yVg+7NL3Nio4le6QZe?=
 =?us-ascii?Q?PaefXlCawaBYWxFFnLxU5JKHfMZt1L9bJJMwhqGO6sFtUxkkf/VHAhQEzl2K?=
 =?us-ascii?Q?e2d6mVmeCG8PFQSu63T8lH4z9ZrbqsZOn7rikQrXbdMynBf4bUy+w8XNYMeK?=
 =?us-ascii?Q?td3MDUfdyVQnmcmbrvvIkNkxunlW8kaHcYlCOJZWAt86l1lDXeVqBzPdKiDy?=
 =?us-ascii?Q?/GJXK8suFeI2Hh1h6yGzqud8PeQar4Snp6di267m0HFu8TxIlan6AR/6m6oq?=
 =?us-ascii?Q?p5ES3w/dovgZP5Bf8z/SB5KsYxL3RN6Kb3CzTVqotcLXXBONYFao5jcSY4hw?=
 =?us-ascii?Q?nJ0yLOMbI86VGx/D76iRKhp1ka4RfzjMwTznmUb8IIQvqqCGvI7VyI7Wk+uC?=
 =?us-ascii?Q?dyV+HLOCa4qVHgGjDRdslS38/8mqCAiqn0lB7yjhs6MYZ/torIb2R3sCr9WT?=
 =?us-ascii?Q?Icv1C+LjypL+opf9+3lCc6zLk0zY4xwksbttm7O28S797/I/u7QsEn89W+cU?=
 =?us-ascii?Q?MX4CV5vPfQBil2ckNwpttfA5rxT7d5lxK/NXb9aOWb78JMaOuH+FkdUi7sXu?=
 =?us-ascii?Q?RKwkdMG6VgJpLsgh1AXU+VWdRm9aBGWUoRIunkfgmwaXRZxEUsl6uLqGdh44?=
 =?us-ascii?Q?HZVhaE3qnP/o5CwqdB89paCV5Jen5jVEbfIRwiTLajLbxLAhbiuzymajuNOE?=
 =?us-ascii?Q?HW3WDrlRm3qYOiPNZyL4F2/k9BGSx2/mqxI5GiZyw6m/T1v/S7AAlyhnNE96?=
 =?us-ascii?Q?IEUkdZYWFOmuB47jxuDtj8Wi4yVOkjzvO2Ar38wqACfXb6m7SMFWpTXOQ/pi?=
 =?us-ascii?Q?ArZpOdzSL0Bu8RU4rrmfjMM5p5QzvnJP1NcjC57/sdOvP0IwqJZmoJOd9ZQl?=
 =?us-ascii?Q?S2PzQR2j45iBY/HDgbPINMi72HhGoWfdmRWu2ynMS01tjXSkTrm8LtDpihxa?=
 =?us-ascii?Q?d0rUgWUSDJ5viD4SVOycGnC2J1n/tO4mAvZXwiuT9CU0RjsmlyhxU3O5R7gq?=
 =?us-ascii?Q?RpgmxgxGKMfox/KbQcvlneX9rzYiv24Utw991tg3EtJj+WqNNeKuQ3QqRmX/?=
 =?us-ascii?Q?VKaAHKEk08yQ8fRei6NA0rk7q4RPYQnzvipeS++AgxNELoQVQxV+bC4qxtKG?=
 =?us-ascii?Q?yQvbDgOS9sAr+CmFEYjJX/LT+DquHMIA8jaujl0Gagtx7TBnomDPGtCHQRVB?=
 =?us-ascii?Q?6g3H+jUGujaR6emun/tiRdjmzjakfff/kV/qprLSPL2vBzkKrqPFaOT62l1I?=
 =?us-ascii?Q?DDku3LDcbWFbsOORoimeeOZl7AFULgv51UqfEqqsfwFvTzI8/be+9CeNLkdD?=
 =?us-ascii?Q?cg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3463b917-5d21-463e-3c8b-08dd6c1de6ae
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2025 04:23:03.9178 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mzkFmkDUOKPFJltAk4T4WzvtvpnKAfFIx3U4nxeuMdU6RidvvBQ7O0ixmTMGLp+TlNsKO9u+o/VeMim2+42rcI/OMcv/WT9WYbu1Z5k/+8Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7342
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

On Tue, Mar 25, 2025 at 01:31:11PM -0700, John.C.Harrison@Intel.com wrote:
>From: John Harrison <John.C.Harrison@Intel.com>
>
>The dump on a dead CT tries to emulate the devcoredump formatting (it
>would use devcoredump code directly but that requires more re-work to
>happen - work in progress). So update the print of the dead CT reason
>code to match the format of the 'reason' string that was added to the
>actual devcoredump a little while ago.
>
>Signed-off-by: John Harrison <John.C.Harrison@Intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

I stumbled upon this a couple of times and wondered why ct_dead_print()
is "emulating" a "**** Xe Device Coredump ****". Maybe that should be
delegated to xe_devcoredump only and allow xe_guc_ct to select what to
include?

Lucas De Marchi

>---
> drivers/gpu/drm/xe/xe_guc_ct.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
>index 72ad576fc18e..686fe664c20d 100644
>--- a/drivers/gpu/drm/xe/xe_guc_ct.c
>+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
>@@ -1828,10 +1828,10 @@ static void ct_dead_print(struct xe_dead_ct *dead)
> 		return;
> 	}
>
>-	drm_printf(&lp, "CTB is dead - reason=0x%X\n", dead->reason);
>
> 	/* Can't generate a genuine core dump at this point, so just do the good bits */
> 	drm_puts(&lp, "**** Xe Device Coredump ****\n");
>+	drm_printf(&lp, "Reason: CTB is dead - 0x%X\n", dead->reason);
> 	xe_device_snapshot_print(xe, &lp);
>
> 	drm_printf(&lp, "**** GT #%d ****\n", gt->info.id);
>-- 
>2.49.0
>
