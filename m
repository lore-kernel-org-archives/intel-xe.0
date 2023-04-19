Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12093C77B73
	for <intel-xe@archiver.kernel.org>; Wed, 19 Apr 2023 17:17:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB07110E8E0;
	Wed, 19 Apr 2023 17:17:28 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E41FB10E8E0
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Apr 2023 17:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681924646; x=1713460646;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=DODjyWteJG45AA6Vt2slBzZ4BXYbC7Pbe5KKy9f4Npo=;
 b=fPKlMqvb9nSXVDKWsz7+BbzgV9CudzjVSW2BbqUNSt/xbKHcf6DddKjQ
 fagoXryNw3dtADzSuD7Y5SgQk46d7qO0kizvSs0FBB7vtmucAo77IBdCq
 Fub+L4jEFhJVApoQ8+ct+fdozCYS/F8996oe9DfsPR+hp4CxtS0boJ8SL
 EXa+DaEt1OYeWxSWOOgmTs7DILH8Bd3V5tGCpUQQDdlgcx4LX1YoQ/pgg
 oORLZM3H5ccV9MGNOWaYNo8oQRFMrU9MJOX6FDsEaTqVQgmesVy8izHcb
 AFf4ZqyeNbSdysZ6xIU5EaGDukO3X3jf+mXAZpW5N6aJP4G6xTpm7quef A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="410741062"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; d="scan'208";a="410741062"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 10:17:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="669052911"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; d="scan'208";a="669052911"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga006.jf.intel.com with ESMTP; 19 Apr 2023 10:17:21 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 19 Apr 2023 10:17:21 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 19 Apr 2023 10:17:21 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 19 Apr 2023 10:17:21 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 19 Apr 2023 10:17:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aFg6AQKN+2ASzslrBhVAYmWR4nSPvWm20g+0S137bKBSuw+WscT+2+HP82MXQQbNPZbFlvUYAKK/FQAaRtt6qCqxBXbRvoW/D7s28zTPLsIdXwSyL2MFplO3VPWbjqMqElUF2c/x3rnkk+xZ8DRBNeOYu7DVA5+d7K2nMHDuwCVqbuWtwl/JqEKchEhO1imJQnkcUYjh9uJO3YVnj8nP+yvTiwQhOLR0Uty/LhiGv4kov0yKvI7ptcp35JrylFQuEkQ8pF9UY5/YbxVCX9YKOe2wsAFkurrPouV/LSouTKEkRMQbnp3/3VRKEZafyW+VyU1xSTTbhaGWXJi1DnbvQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lle4k2ABEbfoNXF4SgenG9AHEEyP9vwiaIE7LSB+DOI=;
 b=SG6zs8T2exvGh0DvV829RbLA6qnV9NiQf9FrDxH7FLIEysBWv9Cuwg9RtgVUubxCL/H5zVdWeS8jpAQ2263XU68s8AF1iGY6YPweEaYfYxYkdN4ZYYb91s9CKZ7R1B+MDl7nZr8tuUc8R16yRTqvdq6DrPgDsNMW7KGrwWoafPsJt59dmCNUodXwpNdRoALy7pH1QzMfFAjuv+dAyiq3PwqpQW/LriGwuAciH6XbVgm7L82TWMyREmeEWl86iwY7uXTTHSE8zsht9mrXaZFD4U8tIPsHLBXRE1fmgNtLfzsZbBeOoF2j1NgYvigt/ai25W+HtOJCd8zhtSABl6H5tQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB7988.namprd11.prod.outlook.com (2603:10b6:510:243::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Wed, 19 Apr
 2023 17:17:19 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%3]) with mapi id 15.20.6319.022; Wed, 19 Apr 2023
 17:17:19 +0000
Date: Wed, 19 Apr 2023 10:17:17 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Message-ID: <mm6nc5ppga2akxpc4k2czr3awwn2qnytnblq4jpiocskaxmtap@hyvm3eerh7vd>
References: <20230419074440.4006398-1-lucas.demarchi@intel.com>
 <20230419074440.4006398-12-lucas.demarchi@intel.com>
 <87bkjjyhyc.fsf@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <87bkjjyhyc.fsf@intel.com>
X-ClientProxiedBy: BY5PR04CA0006.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::16) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB7988:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b21b188-221a-4fac-b7b5-08db40f9ee18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PCupBFa5XTxU9y8hbGOZ1m4ZLfAG53wI7uuly6a6Eva4+8r7MbmJ1T8oSTXmMvUUe0QGkPftMFg6roHoYlaxkxWVhUBxrwKu89QS+gQ45GzzeQDur20epozjTwoaPgcjHjhIN/x3kUBbIrF3SjKXX9oD4yUdWExh3/9cS54ou0lPUA5iSGVT67dTrukvx1rlW63Q/yJJLy4q/txzgL9r8BqevX4pQozQVvlZu05/euC0W0EiuP3zJf+yJU5Am7Z9vcRl0DpBGX9mDDX1lLz7hoNCaYXQfl5m7F78Av429dEeF6Qkb8GyzzBbmH0rQWcfAa4d1ObFuP7BewtUd3gBbLvMfouw2iZrLDT+DK7CWFnFSr5B1Lx40xNXjDyCCiKPFa1mDqJjVEYliflk9LSpaLR4rHrxAdjWtxUguPxjwfjd63PHUQCqi7OYbzC/vv28alIjaxZY05SfItyw3up4DwnOtaHWb7/+otMNysleOPxhEUmqVlykc08PE41FlrB7S4asTgKHKeb3ljb4irKavGpqSwDrxIRABBnAZDty2JVZu4NSJDRArjJjOv9sPO4w
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(346002)(396003)(376002)(366004)(39860400002)(136003)(451199021)(86362001)(38100700002)(33716001)(9686003)(83380400001)(6512007)(26005)(6506007)(186003)(2906002)(6486002)(5660300002)(8676002)(8936002)(478600001)(54906003)(82960400001)(41300700001)(316002)(66556008)(66946007)(66476007)(4326008)(6916009);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gnAPraMIWbDs6Wzrs2SpCwLfCMDD+o1rw5oaBVDe0d0VXm9yA8LgB3FxtpR0?=
 =?us-ascii?Q?Wlq1XV/+Vn/t+cQH3l9j87snj/NILSQLp2Ik98yS3vp1lCY3dUXoPqSIXr9B?=
 =?us-ascii?Q?h9GlzlTsIWvjq/WdcfWubhsg4sxYtLb+GJPizuB/27m6Itw4bghTKx2A2gUr?=
 =?us-ascii?Q?SPUBzRr/IQeOJrvg/q75q9dhbU1mRPNpg0ftlJNET24K50m+ejN560kNbZQy?=
 =?us-ascii?Q?TsEA1empJnaTgVdEUjQV2xAqDTb766oW0jyNqn5uwwT8zb6H9C6Wn8MHKzJg?=
 =?us-ascii?Q?2SIB5FvGBcrNqRHbR5z4uRdOMUzegYdIlLrNW3jEKv/x/r4KgpWzxbRhv7WF?=
 =?us-ascii?Q?S9qfuuS+E27+pdbym0g8vFrly0wXJnfNVNMl0STIgLQDDttQ2MQ7tFWDRcsy?=
 =?us-ascii?Q?taUW7XXiVNi22uq9D3B9MiPqpODQ5khlBlmsknTjD5DK+Wj8yoLfgoE7cqkI?=
 =?us-ascii?Q?rhJNeDqXRmYP0zyfOwNC9EEwZOtTh8jjEZiulxwEM4z8F0vMxGv90t+jaCV1?=
 =?us-ascii?Q?lDkBbdMwyjP3AZ+qjOkw6p9bwtdiXdE50KqzAucfQoWe4W1Z8ojmeLVh/VWh?=
 =?us-ascii?Q?MPImXqM606K4zm1Rw5S1unNcJKVkjl+1l4m2p+t+JglwXEE1rNbWDkhgJWha?=
 =?us-ascii?Q?EW8ixHPtOfeTkfTp5X3P9FIGlf9GH4Vn2jhzmi6mDC7GVb2oy48lPS2CTiZu?=
 =?us-ascii?Q?fARMA1vGcOyXpcchRcJAuhxipIKLk6zi3vhaUp70uWylh+E3kAxe2qe/jAnZ?=
 =?us-ascii?Q?Tdmt76FxOe1AHH1ld0g3syANNEdkOAt2dTxl364w7qIQc4dDlkZl0s5UlXTx?=
 =?us-ascii?Q?W3AkNDUXiZjv7CG79sZb2BF1r2WLHcJXg5VnSEkwwvfqZTHBaTSq7h14gtEn?=
 =?us-ascii?Q?FDUtHDLji3se7IjPjVoNs+AYbqQqUda7lkWBol1EvR/cBYGUsw2extfAADXm?=
 =?us-ascii?Q?1Js8zkdm5c8akm5xclbxtyIYAtmg2qCmOQ4iKZjBOIB6c59OSwy5vF2EiMdD?=
 =?us-ascii?Q?uUC3jAKfJt5ULM7TfwmiriI632jjT9OCoM21IdzUaeZmxPeTFcjNG3jJ3FwW?=
 =?us-ascii?Q?OqTey92upslxwZ3qKS0HL7r5ifmbwWiXQD+9aSxhAOd4JDqhmjwFHG0l3WAw?=
 =?us-ascii?Q?GAEkjrygo1wOn2ZZkfAPo623cAVlKL3aWoh4Q5y8yAhJUxnFnFfOvx7TtLJ5?=
 =?us-ascii?Q?Xs4UlR9HjG9OWcrwxo899IoclfZJQBcv1wZsmB2BFuY1rwHtTN6zN2rGPbtq?=
 =?us-ascii?Q?ojav7njmi5PYBWOge5UatAfQhn3ag9sjPQny3wTI9xrNxh3B2uOGeB9+weco?=
 =?us-ascii?Q?+U27e9mKua+PeEkWje/ZPxopzblxIDRE3eCcB8KogwiT5ERJFURql5i5DWLq?=
 =?us-ascii?Q?YxY53sLBLGZORr3nKHTGHGFnnSh5mF76OzQjURuJ07rz9O+b/X8aOgf5+Bh/?=
 =?us-ascii?Q?oIAGqN3HthsqdGPnS9kAvajuvlMxBUH5Urvxa7NYDDAju9JVKwVHDTxoH4M6?=
 =?us-ascii?Q?mTMlw58Uhp3eK51ywIDa+jRycqoPEXtD50d9k3WdY8sBqSWLT4o5/Q7i7jAA?=
 =?us-ascii?Q?aWhsaY01nPWMIe7d6RaFigMGRS0rQWMu9xjIRrsKwmHWdXdw865GpRooZ02q?=
 =?us-ascii?Q?vA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b21b188-221a-4fac-b7b5-08db40f9ee18
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2023 17:17:19.0489 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /kCJ/o6YWze3JZicV33iircIHFduO46lXuuIhCwyxEJkb58g+z+mWUWPJOCv0/66r86Yhkp/2QX8HJZEwhtMppvEj9wz5mUQfebx/kKS0ek=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7988
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

On Wed, Apr 19, 2023 at 07:06:51PM +0300, Jani Nikula wrote:
>On Wed, 19 Apr 2023, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
>> Stop using i915 types for register our own xe_reg_t. Differently from
>> i915, this will keep under this will keep under the register definition
>> the knowledge for the different types of registers. For now, the "flags"
>> are mcr and masked, although only the former is being used.
>>
>> Most of the driver is agnostic to the register differences. Convert the
>> few places that care about that, namely xe_gt_mcr.c, to take the generic
>> type and warn if the wrong register is used.
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  drivers/gpu/drm/xe/regs/xe_reg_defs.h | 15 +++++++++++++++
>>  drivers/gpu/drm/xe/xe_gt_mcr.c        | 22 ++++++++++++++++------
>>  drivers/gpu/drm/xe/xe_gt_mcr.h        |  8 ++++----
>>  drivers/gpu/drm/xe/xe_irq.c           |  2 +-
>>  drivers/gpu/drm/xe/xe_mmio.c          |  2 +-
>>  5 files changed, 37 insertions(+), 12 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/regs/xe_reg_defs.h b/drivers/gpu/drm/xe/regs/xe_reg_defs.h
>> index b5c25e31b889..1e78508c737b 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_reg_defs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_reg_defs.h
>> @@ -8,4 +8,19 @@
>>
>>  #include "compat-i915-headers/i915_reg_defs.h"
>>
>> +typedef union {
>> +	struct {
>> +		u32 reg:30;
>> +		u32 mcr:1;
>> +		u32 masked:1;
>> +	};
>> +	u32 raw;
>> +} xe_reg_t;
>> +
>> +/* TODO: remove these once the register declarations are not using them anymore */
>> +#undef _MMIO
>> +#undef MCR_REG
>> +#define _MMIO(r)	((const xe_reg_t){ .reg = (r) })
>> +#define MCR_REG(r)	((const xe_reg_t){ .reg = (r), .mcr = 1 })
>> +
>>  #endif
>> diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
>> index aa04ba5a6dbe..b9631cfd5b81 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_mcr.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
>> @@ -360,11 +360,13 @@ void xe_gt_mcr_set_implicit_defaults(struct xe_gt *gt)
>>   * returned.  Returns false if the caller need not perform any steering
>>   */
>>  static bool xe_gt_mcr_get_nonterminated_steering(struct xe_gt *gt,
>> -						 i915_mcr_reg_t reg,
>> +						 xe_reg_t reg,
>>  						 u8 *group, u8 *instance)
>>  {
>>  	const struct xe_mmio_range *implicit_ranges;
>>
>> +	drm_WARN_ON(&gt_to_xe(gt)->drm, !reg.mcr);
>
>I'd add some is_mcr_reg() style macro and use it throughout instead of
>poking directly at xe_reg_t guts. The idea should be that xe_reg_t is
>opaque.

humn... in xe the tendency is not to hide too much as it creates a
unneeded level of indirection. I don't see us needing to change
xe_reg_t much in future or make it depend on platform, etc.  I think a
helper like that could be added if we end up with such need.

*changing*  the values underneath the struct is probably something that
we should avoid doing (there are a few places we do though to account
for base offset), but I don't see a problem *reading* it. We should
probably sprinkle some const around.

The extra verbosity imposed by the wrapper function call doesn't bring
much benefit IMO.

Lucas De Marchi
