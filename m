Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4684FC77B73
	for <intel-xe@archiver.kernel.org>; Wed, 19 Apr 2023 20:31:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2D3310EAE6;
	Wed, 19 Apr 2023 20:30:59 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CD3810EAE6
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Apr 2023 20:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681936257; x=1713472257;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=gPNz0dK1C8eJqEYFaN36AeaGQX4JCj9Ofo3Dk6aR8Bc=;
 b=Pu1LytWw3n9BBq23pDsNmXQSvJIWg9pDlr/K8q769hVec5PeoOuSZtLC
 aUtmxA5LrbyFkKqk6pA5WWUSSbf3b9OnGZzOxjmk/mfrcsTPtVds6OcrD
 UdjnhvHbOELqHsUD9pNZs79MVEi3wYwptUqw6k0jxsr+aMeBVbIjLPKe5
 THdiuKsGeatNcZQ6X8dXKqamrvaZZWxu32kqtWtIs90OsNw7daMVrp8Ae
 IOY9cpvUgB5QJYSZrKPogxja28mr1ng5ZJCHi09TlIj1MRbfzF/biRXA8
 pE2OwlC9yj45gASEVWfrN3ruLOI2Cl2lFFP53w8Zj0Te1He7hZ/+vxN5G Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="347410141"
X-IronPort-AV: E=Sophos;i="5.99,210,1677571200"; d="scan'208";a="347410141"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 13:30:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="669114696"
X-IronPort-AV: E=Sophos;i="5.99,210,1677571200"; d="scan'208";a="669114696"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga006.jf.intel.com with ESMTP; 19 Apr 2023 13:30:56 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 19 Apr 2023 13:30:56 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 19 Apr 2023 13:30:56 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 19 Apr 2023 13:30:56 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.43) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 19 Apr 2023 13:30:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iQ42a8K1dastlE68jW7oFlJ7Z83Xnd4DVw8wqWCCy4C92R3d6QNS47vzon699yC6mL0j2DVrxQ0Qbpy9zuRNuTe9Eq+YPKcxIbgw4+ab93goqGbm26TBF8PLg1Tq184bWGz+0RENxEXzvGb58XG9N0WdeSGbBl4l+TRwcH8F+wvaJg0w5Bphf230Sw1nllZyriI1+vQCBOlA85FMeLj9bIcx2l50jdR3Fnaoy4tb4++o0H+cJdR8NI7QmtZhkfWsPuerQ222apXSJnuMt7JJ4oQ4NMHcRtBNKIsJmG8g/DI5MVhaPv/0XRLpw2dEJOqhSu93qhFcg/EmD9ru53JZyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I1tO7IAlkhqwuP1oQnh8bc7U6kTVCaNJ6SWUNwa930k=;
 b=T8U/avXjbmWbtOUSI6AwUNxwruUySBdIButLGgEV4OGWtV2H1mt8JNumIHOlO4Kz3RMygOiAZIi2OneUiqaluPIAW5siMTbona85QSZxdgZ0F/GdA0C64WPEpOk2wdkslI3pM30ZQ5q1LvPk8pEAH8/V2nOA1ZbCEAx0/jbOeQafK6wyYXrO5NcwbzTgLIIiUvKJw9YsduJBoP0Qhqx6C7BTprp3oF7JUPQ3tMubsel5qdn+7lDMRTEqm9SJZi/tCak2RdbIeDWmtoJDAuLuuF/pUReE9culMgehqJ2G8pa5KjdF0rduJbaHpJEtoSgD8A1nB/517kFJ6CAEY3pUnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA3PR11MB7553.namprd11.prod.outlook.com (2603:10b6:806:316::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Wed, 19 Apr
 2023 20:30:54 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%3]) with mapi id 15.20.6319.022; Wed, 19 Apr 2023
 20:30:54 +0000
Date: Wed, 19 Apr 2023 13:30:51 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Message-ID: <7izh6xjerh6fd4c2wbsms7hrygulgm2dz3thoxzdpe34zaeykt@67ywc2cxhln3>
References: <20230419074440.4006398-1-lucas.demarchi@intel.com>
 <20230419074440.4006398-12-lucas.demarchi@intel.com>
 <87bkjjyhyc.fsf@intel.com>
 <mm6nc5ppga2akxpc4k2czr3awwn2qnytnblq4jpiocskaxmtap@hyvm3eerh7vd>
 <871qkfy838.fsf@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <871qkfy838.fsf@intel.com>
X-ClientProxiedBy: MW3PR06CA0009.namprd06.prod.outlook.com
 (2603:10b6:303:2a::14) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA3PR11MB7553:EE_
X-MS-Office365-Filtering-Correlation-Id: 2cfb5966-a29d-4e49-9c4e-08db4114f8ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: E4VcMTBZz9zIXmQ8iDviXJShterIrhw5it0lz07GxzbD/zmk3V0WKoceARTzWSW4moQlMX6fwVAm2TnXlfYKzl4qtAz/loIZRr8eaRFmSdxLmWB9yijWOM/qKBo1/RAu/5qWakbsE2qnUeGibBy2HTApMK1czy574ZJKaV6lHD3E3epdZWGcAt7Pj1vvXm9f8qdDuNZeJgL+U9bX0LzdkumcdpBPzRiY0a+I5LYczXspMnrq8oedApsuv5ifn0mWm+VHQkz5zFtguq7UOppo/xN8D+s68IVWjR7UJqvqWKKiXRpQavQvMnMDCIQGdNOHoBcNxLGm4CI5J79m+28Gn2xW3HbqfMTOQQqQOHx5Z448yHL4Tmqt+nh4dukf92fIF9PPhN/KymgU2WhNM/M5uIygvz8ahqayxj8t6nG7G5/Q8QCoMgXAwVjdANrYA3c5A8NVN66MtxgP61hT180ThGT6Hqp+yxLDa9iEP4s7tPzULvJE0o3Wz6nmS7EUmObOvl3QNcfaSfNnJ6zsoSGbItefu9ApK36CabPKVhtK6LQcOmGhqW+wpKazKgFx262t
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(396003)(136003)(376002)(39860400002)(366004)(346002)(451199021)(38100700002)(2906002)(82960400001)(33716001)(478600001)(6486002)(6666004)(83380400001)(26005)(9686003)(6512007)(6506007)(86362001)(186003)(41300700001)(316002)(5660300002)(8936002)(8676002)(54906003)(66556008)(6916009)(66946007)(4326008)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Y7ZhBDoBoV/miFj+pgFrbdgtBRoB3aCGP8rcBAxrideieI/b7iXZKdHRa8PL?=
 =?us-ascii?Q?mczJuCm+4VJ5O6sD3+Uk0TS9LtJst76XOkt7eSUL8muzatFlm0YZg3oDob1Z?=
 =?us-ascii?Q?sSbd42be+l+eBVFxnK7B+YsXMYoLaasBRvpuC9be+hciTEWFTmPu0hlJEVyx?=
 =?us-ascii?Q?PA7KfILlhIpSkZXgvviuJJx6iwLFFw3U+0KCnKIGqUzK+YioNrDfiCVVT3vC?=
 =?us-ascii?Q?l2eCcLhbOjc5lhKGlCntgXNwSR2AsNtAdaNzLR2gi3MrBENT/S8LfcXaBihb?=
 =?us-ascii?Q?FQZshIXO1pzN6zpyJoYP+MR+OyUEwX9UfpRGYYKjukS6+0m27ks7wxcJid1I?=
 =?us-ascii?Q?BVupHD21wAEOKZFOvNk4SPGW+gqBvE27uvGtPrpzJxNI/qe4WdS6spramegx?=
 =?us-ascii?Q?/1pcPCQfWISLGgcHMMk0xc+QfSJqzxattDwwUA+7sR5qPY9FfKC8+q9nEfgX?=
 =?us-ascii?Q?I3aHIaU2NBz3sBqqZ/ErvmDh1IIBB67fdqOazCGz7mMH4kQHKCZ+tUz7hLjl?=
 =?us-ascii?Q?B/vHYskucwIyc8PJkVyDjYwWCUK7lWAgo3DoOK0701Kx946GJN2wfuplZjI+?=
 =?us-ascii?Q?GFzUU5SLJU80Z7J7R5Zj3wg4s7w9D3ViWAlmzbl4fokQ/XCEQvp4QPj4I/Vh?=
 =?us-ascii?Q?/RbKwOJKokzCg7MH1kQG0jCFWS55enkHLUIoU68/0YKFr7Jminxy4jcIQZ18?=
 =?us-ascii?Q?p12pcyGQaBM11WIiBlxTfP0bS0U0n9jhC+JPhPi4VIL45qJCgqyUtPGhwId5?=
 =?us-ascii?Q?wilR7brPeaLxUSkdg7utpXadYiU6xRntVUKoj4az7NfnQyKuSLEvaxK5qYzw?=
 =?us-ascii?Q?OlaHcHEoux7YniaM1qGDLyWxCwpHM/cf4CC9qn0LB4cpKaW12AugfWdtbrDj?=
 =?us-ascii?Q?HrDvoOCV+X3aIYSHvJlbMqyII6NxXRlw+5tVv13v2hStUCQjjGnA5RaDSlFm?=
 =?us-ascii?Q?6kcqCgVigEiTLBMESnirIhR6z8g5omC4V0PuBaiKCtIvFjbSSAwYQguZPmGM?=
 =?us-ascii?Q?BzQ6UoJUvZ0xk+/12d1XWsOBvaC/JY8pOorG49upBhVTXkbSLqKRBIpwe3iu?=
 =?us-ascii?Q?DQyjIDnwiRkLG2blbkldgTuV0GCLAaWLuM0zEo2wrapJFW2Mh/2vaLyPRQ9P?=
 =?us-ascii?Q?qvVUQlhv5+VxVT8rdk6S45oV343Z+TxK6Gy2UGZ1744d8Uo2yKqAYjOBk8ON?=
 =?us-ascii?Q?Y1nsQGq2unQdXd+y+xP/QbKKWgRnLAuHyexG/732ycY16S+4gf6ooqwzJDMj?=
 =?us-ascii?Q?I78eKeyiEh+matj3/g2moLSoYHX4WOH1BzjuYzfYRhFCnzi16AY0jSTLnwKq?=
 =?us-ascii?Q?sTeMuyQCX615iny4tmuWLue3YDkFv5VVp5tyJMhZ0wKJKYvAOvRfCkxVrEDv?=
 =?us-ascii?Q?sc9sugn60CcoVMUDwOVYzwXNA05pIX3cJW/ENimasSs1lF527v2OaSa7PzJR?=
 =?us-ascii?Q?DIIKz9tRTG3PXxYhe3fqR5j2dxN7AKrui+m4ife0fw0KxAXwTEgOCE1hqUF2?=
 =?us-ascii?Q?JdyZ/MEEMhvFV2cvmriDmdAbMIEvUS2EquPmFUDJMheDLSTyggGHggBheXuK?=
 =?us-ascii?Q?BGecvYusLjSbZZbNljewTQtIP6ImyHY55IpYBuU0srjJBOcB1uTncO30Zh0L?=
 =?us-ascii?Q?YQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cfb5966-a29d-4e49-9c4e-08db4114f8ec
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2023 20:30:53.7861 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rGZvygiSUg9DOeDPydQpAqSKcFLZJS71jT7uuOnY+34xcZczkqNAqZ3ODaZwsEhkHXaJfmAsM3tqb5nEWU8sD1ERnSM6EqNrohcwgt98Hso=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7553
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 11/17] drm/xe: Introduce xe_reg_t
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
Cc: Matt Roper <matthew.d.roper@intel.com>, intel-xe@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Apr 19, 2023 at 10:39:55PM +0300, Jani Nikula wrote:
>On Wed, 19 Apr 2023, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
>> On Wed, Apr 19, 2023 at 07:06:51PM +0300, Jani Nikula wrote:
>>>On Wed, 19 Apr 2023, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
>>>> Stop using i915 types for register our own xe_reg_t. Differently from
>>>> i915, this will keep under this will keep under the register definition
>>>> the knowledge for the different types of registers. For now, the "flags"
>>>> are mcr and masked, although only the former is being used.
>>>>
>>>> Most of the driver is agnostic to the register differences. Convert the
>>>> few places that care about that, namely xe_gt_mcr.c, to take the generic
>>>> type and warn if the wrong register is used.
>>>>
>>>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>>> ---
>>>>  drivers/gpu/drm/xe/regs/xe_reg_defs.h | 15 +++++++++++++++
>>>>  drivers/gpu/drm/xe/xe_gt_mcr.c        | 22 ++++++++++++++++------
>>>>  drivers/gpu/drm/xe/xe_gt_mcr.h        |  8 ++++----
>>>>  drivers/gpu/drm/xe/xe_irq.c           |  2 +-
>>>>  drivers/gpu/drm/xe/xe_mmio.c          |  2 +-
>>>>  5 files changed, 37 insertions(+), 12 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/regs/xe_reg_defs.h b/drivers/gpu/drm/xe/regs/xe_reg_defs.h
>>>> index b5c25e31b889..1e78508c737b 100644
>>>> --- a/drivers/gpu/drm/xe/regs/xe_reg_defs.h
>>>> +++ b/drivers/gpu/drm/xe/regs/xe_reg_defs.h
>>>> @@ -8,4 +8,19 @@
>>>>
>>>>  #include "compat-i915-headers/i915_reg_defs.h"
>>>>
>>>> +typedef union {
>>>> +	struct {
>>>> +		u32 reg:30;
>>>> +		u32 mcr:1;
>>>> +		u32 masked:1;
>>>> +	};
>>>> +	u32 raw;
>>>> +} xe_reg_t;
>>>> +
>>>> +/* TODO: remove these once the register declarations are not using them anymore */
>>>> +#undef _MMIO
>>>> +#undef MCR_REG
>>>> +#define _MMIO(r)	((const xe_reg_t){ .reg = (r) })
>>>> +#define MCR_REG(r)	((const xe_reg_t){ .reg = (r), .mcr = 1 })
>>>> +
>>>>  #endif
>>>> diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
>>>> index aa04ba5a6dbe..b9631cfd5b81 100644
>>>> --- a/drivers/gpu/drm/xe/xe_gt_mcr.c
>>>> +++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
>>>> @@ -360,11 +360,13 @@ void xe_gt_mcr_set_implicit_defaults(struct xe_gt *gt)
>>>>   * returned.  Returns false if the caller need not perform any steering
>>>>   */
>>>>  static bool xe_gt_mcr_get_nonterminated_steering(struct xe_gt *gt,
>>>> -						 i915_mcr_reg_t reg,
>>>> +						 xe_reg_t reg,
>>>>  						 u8 *group, u8 *instance)
>>>>  {
>>>>  	const struct xe_mmio_range *implicit_ranges;
>>>>
>>>> +	drm_WARN_ON(&gt_to_xe(gt)->drm, !reg.mcr);
>>>
>>>I'd add some is_mcr_reg() style macro and use it throughout instead of
>>>poking directly at xe_reg_t guts. The idea should be that xe_reg_t is
>>>opaque.
>>
>> humn... in xe the tendency is not to hide too much as it creates a
>> unneeded level of indirection. I don't see us needing to change
>> xe_reg_t much in future or make it depend on platform, etc.  I think a
>> helper like that could be added if we end up with such need.
>
>If you hide the underlying type with a typedef, don't look inside. If
>you need to look inside, don't hide the type. See coding-style.rst.

I only typedef'ed to follow what was already there. To be honest, I
think we can lose the typedef.

>
>> *changing*  the values underneath the struct is probably something that
>> we should avoid doing (there are a few places we do though to account
>> for base offset), but I don't see a problem *reading* it. We should
>> probably sprinkle some const around.
>>
>> The extra verbosity imposed by the wrapper function call doesn't bring
>> much benefit IMO.
>
>To me, the main benefit is readability and self-documenting code:
>
>	if (reg.mcr)
>
>vs.
>
>	if (is_mcr_reg(reg))

which is also against our coding style, so it should be
xe_reg_is_mcr(reg).  My personal taste here: I don't think it
reads better than `if (reg.mcr)`.  If anything, one would have to
consult the meaning of "mcr" rather than what one vs the other is
doing.

Lucas De Marchi

>
>
>BR,
>Jani.
>
>-- 
>Jani Nikula, Intel Open Source Graphics Center
