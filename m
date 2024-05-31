Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FB77C25B75
	for <intel-xe@archiver.kernel.org>; Fri, 31 May 2024 05:51:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B74F10E9A2;
	Fri, 31 May 2024 05:51:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Mccr7+2V";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EF3810E9A2
 for <intel-xe@lists.freedesktop.org>; Fri, 31 May 2024 05:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717134677; x=1748670677;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=oOmbgBJf8ulLJHD0ET8trvE2jkFpiO5hciBt1Rm7nEo=;
 b=Mccr7+2V4jzDJY0duAmbF6Km6dmzGeKFfVh9MCcqdscWfGQc9zdwVw8P
 bXEcL5EtuMDK88vd0egV1rkcYLmAgNHw0FoH4Atea+BO6x4OjIuWqGQ8h
 n/V4fws9pyV0IxAn532FO7n3KUfBeol4DpEA16oHDnwLRVA9VYI6H5m6H
 xhUeDqB1G/Gofkp+W1ZWXuA1CVn8jB/Eb1dCjVKHURESo7yfF33fXMV4W
 dDz6Ds2Y45mo2FWjYMOyo4P1wRjI6JHaIBzO8EgS1xPO8XugTgfHPIMyy
 nMVKMqVxkjlE6wkfPHlLfbpY75TitoY1YbWnPAX/VGeJFfYUEU61gpIfA w==;
X-CSE-ConnectionGUID: GrvqF/j5R+Ch3hqw/LRLxg==
X-CSE-MsgGUID: wvIZ8+5tQjSxZaREb7lSvQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="17509091"
X-IronPort-AV: E=Sophos;i="6.08,203,1712646000"; d="scan'208";a="17509091"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2024 22:51:16 -0700
X-CSE-ConnectionGUID: mUdq0Y+lTOOt+TZO9fpCBQ==
X-CSE-MsgGUID: CXM8b7olReKgVBUrgRFwKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,203,1712646000"; d="scan'208";a="40979912"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 May 2024 22:51:18 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 30 May 2024 22:51:16 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 30 May 2024 22:51:15 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 30 May 2024 22:51:15 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.176)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 30 May 2024 22:51:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Efrz6VK2WSDybQbikSSj2geqgo+iJwJKEge2hfja9a1OiLhwr5AgOT9wfb35oRzX0Jqk4WeysnpFtkw9Tm/qwZt6666OtqP7uls0P9gUwiyrG6TTgx+ALcH0sf/ZQbu9bnq37ItJxjkwv+xIPaVxMSYl1PTEIrq/iKg62sVsJe+rg0wVEYQUdIsvOL46QDzMdvFernjKqDR7lUer5ayhv99Q/DYK47vh4WclxtuKE1ajU4uQ4p2d2bqZ+HwnBX3esdJetMJb3MIavQiw2X3XkK18qZDhoa26aGdh0huK5u/p5YpHk2Ou15usvtbiz5RDQraoY7zxwIuPWVlmFa3BGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mczzC+ZN61jA2LbV8AnrNIUGMGlDq07R+NBQQ6lOIgk=;
 b=GMYxBvV80megnofDL8tm2ExJ5m7IZUYY8IWGeBnLhkDHzQqvG6zsRcrTLCs+FL6jKBtNyCQGn905PhwMbOm07a0Pw+KVr7EHRZesOq3w8+J/pHrcegBrtWanfTgHFuizDxBy+6MhLREgSd2Nw0qQV8j1cQTON9CkM4rKvL36nQxjvUkrWTciZ42AVQtfkPrtvjGRwK1hCLqYtBsZTIQlnEO5ksG/AtCCo2ORnTX2QQymaK9zqDuyAqEWk7N9SSKCQTWaGrZd8Pu6e0Oq45uf2PRYL++/ZuU6rJjjyZqLLYhMPNcEpJPYFZUeKLZ4vEgbMysDGd9wLZy//HgsElJiBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7SPRMB0092.namprd11.prod.outlook.com (2603:10b6:510:2b1::6)
 by PH7PR11MB6908.namprd11.prod.outlook.com (2603:10b6:510:204::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.27; Fri, 31 May
 2024 05:51:08 +0000
Received: from PH7SPRMB0092.namprd11.prod.outlook.com
 ([fe80::2ad4:4a5:b333:6ff7]) by PH7SPRMB0092.namprd11.prod.outlook.com
 ([fe80::2ad4:4a5:b333:6ff7%2]) with mapi id 15.20.7633.018; Fri, 31 May 2024
 05:51:08 +0000
Date: Fri, 31 May 2024 05:50:41 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Add kernel-doc to some xe_lrc interfaces
Message-ID: <ZlllMXXx6s6ADWBi@DUT025-TGLU.fm.intel.com>
References: <20240530181100.18188-1-niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240530181100.18188-1-niranjana.vishwanathapura@intel.com>
X-ClientProxiedBy: SJ0PR03CA0239.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::34) To PH7SPRMB0092.namprd11.prod.outlook.com
 (2603:10b6:510:2b1::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7SPRMB0092:EE_|PH7PR11MB6908:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e7652e4-c7b6-49b6-c6b8-08dc8135ab2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5iKgkQNZVC7nvvKQy4utuv/aaS9herT4dVf1Bfpvg28extAjbJpX0nKCR9hM?=
 =?us-ascii?Q?MCFLzjQunmvnxSOCj/9FiSQiRQsfL4AhUAjh4I04cyZ3+YsS24zcGYzmVGAi?=
 =?us-ascii?Q?PetJykBKXZ28DO98sxDUpsW6ppoaOy3yAAIXinMkfs+eu1Ix8mAZp3c3pJuE?=
 =?us-ascii?Q?8vPGMjdpDdl/fkIVRVOUxLar/3PfdTgMSUUYHS0tcumS5Bwc3t5AwtaehzXQ?=
 =?us-ascii?Q?Tt83MA3/qHqvlzDMc4MX0z54mCrGm+UjAnNqrTBzLnZP9tStjiXWHJW/TynE?=
 =?us-ascii?Q?VrpyZGFuhOiGTmwVjMSBtDlWr6srhmvo/5VrvNT6qCyiA4YdvCtBjyHFdYOZ?=
 =?us-ascii?Q?g4fCEznCvR2z7wwIfw+PyTfkeFGpBjP8kxvqt2f/c4urh+/CrzW+sCkIb18l?=
 =?us-ascii?Q?GPmg5+rSAWnNZ3L7VguM4+44P3qRJdaTdGcVkay2LfmnvI0w7zRAfoT8WkNv?=
 =?us-ascii?Q?UWf9M8q/CajMBaew+YbpK50t7bsB+4FAW0M9gbslLQMi1ZktGQgyN6VH4b0Z?=
 =?us-ascii?Q?b8vLo17LY0fH0nxHfukAE8EIWeLNXs+NfqIcrUho+JlP8dYXt1rlN1l3oWAA?=
 =?us-ascii?Q?ENNSYE56YamiNXG2qKBzcpeKZ7+vxrGq2Loyr7hYmA4wR7rl3BVxbDr3eO1Q?=
 =?us-ascii?Q?uvlzVfgyWAD+amkVcQCnzr8TFlyo9kZ/f95R0dcrYxbxJnONGgx7PYkv1MCs?=
 =?us-ascii?Q?5U2VUlcw8yarDDpe4bCuDeTDm29cO7pHcXl2CnroZvk9GMh9TzmF42LZeKJU?=
 =?us-ascii?Q?QeFE2TVcdaKkD66gMQmtzY5GN5XPb4FivTF/S2tBKUrCCq2D8M4lq5oBT0ox?=
 =?us-ascii?Q?+yS78QpgPaMWnOozx+G+4sZwpypJOALLHR0MOFovZd4vWFKOohdz7SNB1Qzc?=
 =?us-ascii?Q?xAVAhRUiciW3OpqsNgg16ifiJo+kc8flTKutSExoKjxZVVkKG9ij7Cmhm4p8?=
 =?us-ascii?Q?7bj0VorLTtPT4G8jfBteoert54uqznjOkcC4+08AjCPn8hxb3W6Mn6LFvO3W?=
 =?us-ascii?Q?C9Tp/jnJjy2J+jxEHlozDi77Pa58OOdZTBclJI4Wb6CwI1ukQIsE970FcFdn?=
 =?us-ascii?Q?o7rbjPfwyDMRRhkDkv9CZWroY/o+V3xk5Ggh0e9ZrEz7Bsx56ok0NEGdPzQj?=
 =?us-ascii?Q?/y/krHvkY0Tj+lZjdgcs2xIZtHAU0XT6yM/88cL4hEaWCuv7cjCjHcnT4fVI?=
 =?us-ascii?Q?/JSBe74ki6AECHkfddebQHGfXxbzAukS3XbyCeFFsp44jwHR5zv5WPTUmIo2?=
 =?us-ascii?Q?3U/TBsnHc9W4e7Q85+FDLozvX37PpO4KXONNbya0EQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7SPRMB0092.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wfmzo2vSIPOaRiZrTpEDLz8hvdDGMV11CCJDu77bmyOjZRrgMMSyCp2MI1z3?=
 =?us-ascii?Q?l5C4JSPDgVmkdcB0tAfgafwkJfRbY8mTTyA5p5O2BswP2YcOxhYbTHevCMT6?=
 =?us-ascii?Q?6dQV/GCJgEi6Bj86LbRlDFD7X7Wb5ljL4a5UOjNuMnPfrcboWNNqJhWLCpZ7?=
 =?us-ascii?Q?oJw7dOKFhTNjOgs16RyJm1snpt4uS5ogxeIYvYtSUNRzLgIOdu9khTQ2rRw4?=
 =?us-ascii?Q?FSgQzJH/Fg0S4xj9jtQ93nbdohNrLbKkEnuPtqeU937hi9mW3uaT1aZcfIiG?=
 =?us-ascii?Q?bsrp3201+xwdoivtyo1FxOFtNhWrgk0Ptd/lcgtgOFsPYiEgrAh2KLHhZn4e?=
 =?us-ascii?Q?yUW6+wOWHJBd9gKlOtZ/SVt0HZ3SWFjpya4eI0PYW3UUVkJrfqhl3UKzyp4j?=
 =?us-ascii?Q?/dxKuP2JLo6ycPTR/jikaFb9sT7P14WPlPtibiTcH4EEUxXz8GeAwK8eT4kg?=
 =?us-ascii?Q?cWfG0kYJOY8o0Krw7As06BQWLbT5zlKmxMFMM5RT4wQispJvS16E8gGp1Heg?=
 =?us-ascii?Q?vm/5b3YLgUPDOQfnqL1BwuL+hx5Wzz/v4aHBNxMOuBOYvzMtOrK7ZyR1gtbz?=
 =?us-ascii?Q?0yPBldzX4tPyBVec3chK8vm+GCf+ypRPw52Kf1q2vZj77nDxbl0ET8GmZPcn?=
 =?us-ascii?Q?SSC3Hvyx8wZrG4+zmv1f55j5k1eikDnW3AvUmxdWkyalcZzKHEmhFAEioF79?=
 =?us-ascii?Q?K/xJcA3IUzR4BDlbT+80DqBk7oBJfVBgtHZaVy+afVaAITHtmhzs0CID53Ci?=
 =?us-ascii?Q?Nm5xfKRLqlnsjt9IEWN6a3Uv0dabhxst4HTx00SAk9/VR9DtJNq4zjKn6OAY?=
 =?us-ascii?Q?UPCnTwC/l2WlgVgt6CZ/4eqTqv/ktN3cZhWUW0N5d1hr0YIwsbQU8mqMvA+U?=
 =?us-ascii?Q?Ok1HjCyaeiUXUoaEaWzlGvmfbOTNpXz2wFYqP9LFp0zshdF9FPcApczakEWt?=
 =?us-ascii?Q?Gsc6S9HJjGuUYNmBY3XoVUecLybIdaft/NRMPSDGHafeSNaZClnqOEVsr+Tf?=
 =?us-ascii?Q?tbZrVGQYYEE3AqI56LHc/qX6SBarAOWt4meVbaAAgewJxpk3Lw+5sJhLNJCs?=
 =?us-ascii?Q?mq1//BknnF+WazYl8QUEPxwcaVrszMNF9D11ZaPDAsKiZF1sGoS09CZjc01P?=
 =?us-ascii?Q?kxmGpAq/Hd93Gu74VwWNkDLObdn072sPKN93CPixxm53FZDAty4ozDuUO/UE?=
 =?us-ascii?Q?54AzFXw+O3i6y4ERYdH2mWWJxCKzMc2IIQowNJ1Je1HAiwabRBX+6xsb9Pbk?=
 =?us-ascii?Q?u6Iw0DY56nXxZ+88Rj66G/MQuVieuFgY85p5knZwMFYoYrsVSpUhRRPnaESA?=
 =?us-ascii?Q?aqNhZ8qAK4pFyXIbyVwagVPzA9to0ubJjCawBtxTuTQwOvn52mF1AMxPJ+ne?=
 =?us-ascii?Q?qvSPjQWH+qlFpKjwrTn49YHSN4+iOir71umZ5RUFgxn/mKjMxbRGJBzrzcIy?=
 =?us-ascii?Q?06fnkS7hO3b15kPzcmUd/+q9HO6lhU+PrP8ZTaLIvwv5RofMA8eyLe3m7Xy1?=
 =?us-ascii?Q?w25VhU4sGx6unjakFKqn1cC1Hv0B1cDkZnjQ8hOhMrr+seuk6QcA9nNZKlPb?=
 =?us-ascii?Q?QTyTxbVwH1xzOo+5z1l1H2OdfYL0RZmQ7YMs3jzTpvl5Mjbpchdsvp19S2tX?=
 =?us-ascii?Q?7w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e7652e4-c7b6-49b6-c6b8-08dc8135ab2e
X-MS-Exchange-CrossTenant-AuthSource: PH7SPRMB0092.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2024 05:51:08.6189 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TOisNDffgBl9MrhO95NRLMHVM97tjEbRGhMCfLdFDFxFYmIcde4lofrF/ibypDiYKv64Xw+gqVaNcQDTdu+mUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6908
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

On Thu, May 30, 2024 at 11:11:00AM -0700, Niranjana Vishwanathapura wrote:
> Add kernel-doc to xe_lrc_create/destroy and xe_lrc_get/put
> interfaces.
> 
> Fixes: 264eecdba211 ("drm/xe: Decouple xe_exec_queue and xe_lrc")

I missed kernel doc in initial review too.

I don't think you need a fixes tag though.

> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_lrc.c | 18 ++++++++++++++++++
>  drivers/gpu/drm/xe/xe_lrc.h | 13 +++++++++++++
>  2 files changed, 31 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index 26922e1bac82..215a1c27665d 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -945,6 +945,17 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>  	return err;
>  }
>  
> +/**
> + * xe_lrc_create - Create a LRC
> + * @hwe: Hardware Engine
> + * @vm: The VM (address space)
> + * @ring_size: LRC ring size
> + *
> + * Allocate and initialize the Logical Ring Context (LRC).
> + *
> + * Return pointer to created LRC upon success. Return -ve error code

-ve? Typo?

With typo fixed and dropping fixes tag:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> + * upon failure.
> + */
>  struct xe_lrc *xe_lrc_create(struct xe_hw_engine *hwe, struct xe_vm *vm,
>  			     u32 ring_size)
>  {
> @@ -964,6 +975,13 @@ struct xe_lrc *xe_lrc_create(struct xe_hw_engine *hwe, struct xe_vm *vm,
>  	return lrc;
>  }
>  
> +/**
> + * xe_lrc_destroy - Destroy the LRC
> + * @ref: reference to LRC
> + *
> + * Called when ref == 0, release resources held by the Logical Ring Context
> + * (LRC) and free the LRC memory.
> + */
>  void xe_lrc_destroy(struct kref *ref)
>  {
>  	struct xe_lrc *lrc = container_of(ref, struct xe_lrc, refcount);
> diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
> index ebe0e362e434..882c3437ba5c 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.h
> +++ b/drivers/gpu/drm/xe/xe_lrc.h
> @@ -26,12 +26,25 @@ struct xe_lrc *xe_lrc_create(struct xe_hw_engine *hwe, struct xe_vm *vm,
>  			     u32 ring_size);
>  void xe_lrc_destroy(struct kref *ref);
>  
> +/**
> + * xe_lrc_get - Get reference to the LRC
> + * @lrc: Logical Ring Context
> + *
> + * Increment reference count of @lrc
> + */
>  static inline struct xe_lrc *xe_lrc_get(struct xe_lrc *lrc)
>  {
>  	kref_get(&lrc->refcount);
>  	return lrc;
>  }
>  
> +/**
> + * xe_lrc_put - Put reference of the LRC
> + * @lrc: Logical Ring Context
> + *
> + * Decrement reference count of @lrc, call xe_lrc_destroy when
> + * reference count reaches 0.
> + */
>  static inline void xe_lrc_put(struct xe_lrc *lrc)
>  {
>  	kref_put(&lrc->refcount, xe_lrc_destroy);
> -- 
> 2.43.0
> 
