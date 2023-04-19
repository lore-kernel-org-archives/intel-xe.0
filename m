Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86061C77B73
	for <intel-xe@archiver.kernel.org>; Wed, 19 Apr 2023 20:14:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 574BF10EAD5;
	Wed, 19 Apr 2023 20:14:01 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD31310EAD5
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Apr 2023 20:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681935239; x=1713471239;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=nyfhp3/kh4EmOzN7IgCeWZpaTYjG1z3Wq9xLgQ4ZIdY=;
 b=jRYI29uVEN3tnOwFv8bEFDcnTjK32zdifGoE3XoJD1xJffMPCDHg1e0H
 InA3Zx/oAr7PBhPprbu3WD7tBCvtCXwH1ulHsGimL9McVbAKkSRsWjWEF
 HmkIhdihCqDqEtP/VD96k/8MoqOS4wO3OJmvgJnKYDYWY98bNoU0w90/M
 zOn6+Oney6UxPmwuUOXywQAvUJWQNV3nPsjpokmbhpqbqaWF3fKqoNqDJ
 PR1EhBS2DlvWJnwrPiHfCh6B17HiyjoGXcJEpqGpJbf63d4661YwTQh7c
 8BBO/1MFU+1Kjg9yK8RTu0M7dWMKCcA3S13FCgnJJ4o3X+Ml9smT8DOeW w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="325161235"
X-IronPort-AV: E=Sophos;i="5.99,210,1677571200"; d="scan'208";a="325161235"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 13:13:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="724167464"
X-IronPort-AV: E=Sophos;i="5.99,210,1677571200"; d="scan'208";a="724167464"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga001.jf.intel.com with ESMTP; 19 Apr 2023 13:13:58 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 19 Apr 2023 13:13:57 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 19 Apr 2023 13:13:57 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 19 Apr 2023 13:13:57 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.44) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 19 Apr 2023 13:13:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JmEcgocGO62DgTZAlTOad0D8QrXZLMr4fCSf5+3DyC6CJuT9Y+d5+9EZCTK64GB0+atLPvPSBEBtCPQuEKo7JYXabldGNFCwgow5PcZM0qAhPDyMKFqrVASRcBr3CplKgL08wNu0emqoVgu9hOJ8/EA8ZyPvfQB3b8IvQzU1PgjLxbcd+YSTidv4fkY3dBL7lZsTpD1LvG9pe2hp7Na6v4I30TrBFmHqd7np3amDwQMPY/aIT4IsEAZqQyRU+We6gZruz+tuCiMOI5m/6biy2OkA/iOGdu714plf/fvTEiqmQ0OS/WTpEgPFhlXluJolxyhVpucbJVQvlt0mWKCBOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2YnaBETyonKnBoTsOw7E/St7eLQLhA3ckg9MwkUp/rc=;
 b=NZ3/Y6BnCQakx3RAxOvw/raerGUXrcA7nnpZFiEw+/m/q9osGMnwu2FxWu1lP51N4CmhYZ9u146cJq1Dw/IzEpwtLqjcc7V87Sx3KZUt4lSHIUDIqj717ZLubgyGpCyIeqwSy5s4amf+rSe8om2LYNj0QN0TJHD1+9voYDoK0etaqx0hymQcEDD/htUy3qKNPFIBd5LPYmyx+lUs7KH5wzpFo951E7fe8IxtmnCnbF6l+++eQj97pbRL4oAObpiDxlZrR1/lCQANhStxhd40pfskM+c8g3pignAknu5vPhlneqompYQNN2w9Vm1uQpYiemtW/f21r8vTObUq1WGp5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CH3PR11MB7723.namprd11.prod.outlook.com (2603:10b6:610:127::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Wed, 19 Apr
 2023 20:13:55 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%3]) with mapi id 15.20.6319.022; Wed, 19 Apr 2023
 20:13:55 +0000
Date: Wed, 19 Apr 2023 13:13:52 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Message-ID: <o4qzgkpnqx3i4vr7ntbdzkjnwnvraa2s3xmcn3s2m6wklf65ym@zcjz3dk2iyuq>
References: <20230419074440.4006398-1-lucas.demarchi@intel.com>
 <20230419074440.4006398-12-lucas.demarchi@intel.com>
 <20230419173345.GJ2825255@mdroper-desk1.amr.corp.intel.com>
 <87y1mnwt2i.fsf@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <87y1mnwt2i.fsf@intel.com>
X-ClientProxiedBy: SJ0PR03CA0347.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::22) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CH3PR11MB7723:EE_
X-MS-Office365-Filtering-Correlation-Id: a1e86659-5f2b-4dbf-3d12-08db411299dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7gwNsok4zOs1N4oLl7QZarDrvb75IKQlPul6L8vlnSidhcMaKJgoZj/Qs9u7LUz0j1Ot/6X2THZhhoNNbjkPZu9UVMMQYjbXQDDj3XfsMW8JbQOAO0u1xOm3NMQaIaJVzLvQ8rgTUatAr6EM68ZYltGpz89HdLqtaICyIm9mMkMc7OymF4gznxjHJ/GsH3d6I3npPgd0XzhRQNg5iUT/ROw2wgZJ+yC8p3/BDMRay7SjgLNUxHNwe/Ei6vfVBdYFB3UFY81lyM5nqhoAxMOhB/xZCGQaglQYVziM05UQJK5xccr/klH5vZAhdy3ZyGp4bMfxi7gjqSkeZ/MtdgUvEbC2o+LD0RVKY5NBe5dRAqN6IiGHxzc+tWTM4NwqOphywErVGMTZFRL8RGMbW47i2x8JRK9JrtsqOOynto5g6lLUqlYxG/F6EnBfdukafeMMyqHMXJvs644fJT6IUy8Y10/sQ1iHOV00v/3KYoLFv8eEVvqiYZVfeCSQX5y47UQIyW/kS3BtWcyybl956D5Dw/9QjVwNEY7UHWxXG/t/gCE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(346002)(39860400002)(396003)(366004)(136003)(376002)(451199021)(186003)(478600001)(2906002)(6486002)(6666004)(82960400001)(6916009)(4326008)(66946007)(66556008)(66476007)(8676002)(8936002)(38100700002)(316002)(5660300002)(83380400001)(54906003)(41300700001)(33716001)(6512007)(6506007)(9686003)(26005)(966005)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4Kba+u6ljKspB1PHhl1x7wvW5HqQH5G4/i4vFpw7YUzdIrJZm4ybk5zhKW7P?=
 =?us-ascii?Q?pZCKhyK9i+ozjk2s4v0086X6AXSZ3GiQJRWlRZlHlPUY4lQbZsAwmX3KyiLu?=
 =?us-ascii?Q?Q9QnS25k78SQu2MtQ78Jio01dx3B9Ph1cHPoQbxBf44Wa+lOCTD1R2//8OEV?=
 =?us-ascii?Q?8Lj6dr4B0m+r1wNpAUF2QpjL6yGN4aCywR5C0nDuPUzvz0JL07AZlJu/YHM5?=
 =?us-ascii?Q?18m6eWNboi0ZQQ+GTx44W5uJSmwt70fcbnJ5C6OevyBsaYyoDHtza5Agckhp?=
 =?us-ascii?Q?E16tA3dbVHqjuoQLTIDfqAcNmoCy9CXRyXBhfI79QDKLmj2eAAii3jEO2LKk?=
 =?us-ascii?Q?fV3ZHyi+qGR7IwtYP/eIZGstphW3htI0aWDK1/Xsg0gjKIZX22ZKtLkldJmw?=
 =?us-ascii?Q?QHHsoqPTyHHrw5rstQ9F9Dsz+Z+dN0+5IIC5iptu77tC0iFZMudA45jZWYu1?=
 =?us-ascii?Q?j+wcZx7P0P7+7vGv59fOpjhvyfd1M0VJxYN/hhYUBupcMvwr9VcWQbRqQ7X2?=
 =?us-ascii?Q?gsFL0hxDzXMuHJJZjp7llmfFFscwb3eW05fwxLGGeNIAZhFaVxHRlummgufk?=
 =?us-ascii?Q?q79lHTzDyblIFymAsemi5YHdo8ODD4FyRyw7pyTFXxX3HHoUhUuogxBbfrDa?=
 =?us-ascii?Q?AbWWLmO1J+KHZTew6U5ghtghpCzhqcvnTEVDIv+aie+seim8Sy9mJYMj7e1A?=
 =?us-ascii?Q?kDjme4ELnRzkZP61rBBkeW52aFYj+c0Z7825h9wf8yXQrcyNufeT7asxhI4z?=
 =?us-ascii?Q?4BmDx4/YbSu0zJb4oFCyW1PlwPv4ZKaO4Y6Plyawtc+ZUuLkZSC1RvgnS7F8?=
 =?us-ascii?Q?ZSyV5/7wukRT6Yv68BXzNXIIBLt86KkOWr6FZ8j+vr2NNJdoAI2Y851ykGZy?=
 =?us-ascii?Q?GLcx5/ern+7PdjG8u/J8gz5d0dZ6OGQaeBtMskICyWIN0rUlfG0OX7P4RRmZ?=
 =?us-ascii?Q?VDkGsxqt3aORIb12Bwj1V/skdxz6W4tSEiQDP4bhzcYM8WYsOT8rXQfBjjoS?=
 =?us-ascii?Q?QRhatEE3YGuJZ/UA/EHjlHMD/P2YWv0lXCkftL8uXs+NccyxFpkm7L3LrHYn?=
 =?us-ascii?Q?6IAE79yuQir8GYl8gCTGFtjBuMvn5KoMai0oWB9NkBo4a6pfmfHYj63N9gTj?=
 =?us-ascii?Q?k/rOobLO+4Dkm0iepuJIvgR2H5+EiAl5SCBjEM0kxqXIoKC262V5foAYiejY?=
 =?us-ascii?Q?mZQMfG6oLF9B2Zk/PGO4lje/93HseMv8rrCAi4ILOLFqUcMd15i53NO4cJXT?=
 =?us-ascii?Q?rTgfum64E1QxcRomhzWKnLVDaxhQE6EIz6fPLgIaPF88Hhh7V8TjKZoIzTLb?=
 =?us-ascii?Q?vsnW4/P83Yt1iEZAH89VKOQXimmOuh+7fRpLdl0AsG2WOM30TaweKDQG8Sk2?=
 =?us-ascii?Q?zZuzvLHOtyf412HontFjxVQfPuiT+hoLtSzj46TYBrZN9WkJl7COWSYE7pAX?=
 =?us-ascii?Q?T3d7lRNeO1uSlPgDiMvfmrJLhM8d4u29/9SUzIzocLuG/WjwRrNbQ7bjEf/3?=
 =?us-ascii?Q?tuV7HcR2fHhIjg+uTHi8HjdzMiHmcaO8I5iAxFRbqhwVOADxc/JnmCsnisiJ?=
 =?us-ascii?Q?VWb8yQaV7QqqzquwbMssCkXyafcsc1bLdMmFXiDTVQiZtQvjuKs1c7XemU0b?=
 =?us-ascii?Q?Fg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a1e86659-5f2b-4dbf-3d12-08db411299dd
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2023 20:13:55.1654 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8cyp1sCO0YPUBoM2FV+9qDuY+ck6nWYb+mETyUnTisqY4V9qrj8HyMG8SnkuQdhJ1z0abyV/asZUe0aoHIC89CxETB35txNacSHIPu283XE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7723
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

On Wed, Apr 19, 2023 at 10:49:41PM +0300, Jani Nikula wrote:
>On Wed, 19 Apr 2023, Matt Roper <matthew.d.roper@intel.com> wrote:
>> On Wed, Apr 19, 2023 at 12:44:34AM -0700, Lucas De Marchi wrote:
>>> Stop using i915 types for register our own xe_reg_t. Differently from
>>> i915, this will keep under this will keep under the register definition
>>> the knowledge for the different types of registers. For now, the "flags"
>>> are mcr and masked, although only the former is being used.
>>>
>>> Most of the driver is agnostic to the register differences. Convert the
>>> few places that care about that, namely xe_gt_mcr.c, to take the generic
>>> type and warn if the wrong register is used.
>>
>> The disadvantage of this approach is that we don't get the nice
>> type-checking that we have in i915 to catch register misuse at build
>> time.  Instead we wind up with a bunch of run-time checks that only tell
>> you that you used the wrong register semantics after the fact.  Wouldn't
>> it be better to keep the strict types and let the compiler find mistakes
>> for us at build time?
>>
>> The only real problem with using strict types is that there are a few
>> places where the driver is just trying to refer to registers/offsets
>> without actually accessing them (e.g., whitelists, OA register groups,
>> etc.) and the strict typing makes it harder to provide a heterogeneous
>> list of those registers.  But I still feel the benefits of compile-time
>> checking outweighs the extra complexity we wind up with in a handful of
>> places.
>
>The history of i915_reg_t is that there were subtle bugs where the
>arguments to the register write call were accidentally swapped, they
>went unnoticed, and needed lengthy debugging to finally figure out.
>
>This can happen with xe_mmio_write32().

but this is another topic that would be a follow up. Somewhere in the
commit messages I mentioned that the next step would be to make
xe_mmio_* strong typed

>
>Strong typing for i915_reg_t has positive score 9 on Rusty's API Design
>Manifesto [1].

here the discussion is having or not N types for the different types of
registers we have, instead of one type, xe_reg_t, and proper runtime
checks where needed.

Btw, note that we already rely on runtime checks for misuse of
i915_mcr_reg_t:  when that type is used and there isn't a range for it
in xe_gt_mcr.c

Lucas De Marchi

>
>
>BR,
>Jani.
>
>
>[1] https://ozlabs.org/~rusty/index.cgi/tech/2008-03-30.html
>
>
>
>>
>>
>> Matt
>>
>>>
>>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>> ---
>>>  drivers/gpu/drm/xe/regs/xe_reg_defs.h | 15 +++++++++++++++
>>>  drivers/gpu/drm/xe/xe_gt_mcr.c        | 22 ++++++++++++++++------
>>>  drivers/gpu/drm/xe/xe_gt_mcr.h        |  8 ++++----
>>>  drivers/gpu/drm/xe/xe_irq.c           |  2 +-
>>>  drivers/gpu/drm/xe/xe_mmio.c          |  2 +-
>>>  5 files changed, 37 insertions(+), 12 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/regs/xe_reg_defs.h b/drivers/gpu/drm/xe/regs/xe_reg_defs.h
>>> index b5c25e31b889..1e78508c737b 100644
>>> --- a/drivers/gpu/drm/xe/regs/xe_reg_defs.h
>>> +++ b/drivers/gpu/drm/xe/regs/xe_reg_defs.h
>>> @@ -8,4 +8,19 @@
>>>
>>>  #include "compat-i915-headers/i915_reg_defs.h"
>>>
>>> +typedef union {
>>> +	struct {
>>> +		u32 reg:30;
>>> +		u32 mcr:1;
>>> +		u32 masked:1;
>>> +	};
>>> +	u32 raw;
>>> +} xe_reg_t;
>>> +
>>> +/* TODO: remove these once the register declarations are not using them anymore */
>>> +#undef _MMIO
>>> +#undef MCR_REG
>>> +#define _MMIO(r)	((const xe_reg_t){ .reg = (r) })
>>> +#define MCR_REG(r)	((const xe_reg_t){ .reg = (r), .mcr = 1 })
>>> +
>>>  #endif
>>> diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
>>> index aa04ba5a6dbe..b9631cfd5b81 100644
>>> --- a/drivers/gpu/drm/xe/xe_gt_mcr.c
>>> +++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
>>> @@ -360,11 +360,13 @@ void xe_gt_mcr_set_implicit_defaults(struct xe_gt *gt)
>>>   * returned.  Returns false if the caller need not perform any steering
>>>   */
>>>  static bool xe_gt_mcr_get_nonterminated_steering(struct xe_gt *gt,
>>> -						 i915_mcr_reg_t reg,
>>> +						 xe_reg_t reg,
>>>  						 u8 *group, u8 *instance)
>>>  {
>>>  	const struct xe_mmio_range *implicit_ranges;
>>>
>>> +	drm_WARN_ON(&gt_to_xe(gt)->drm, !reg.mcr);
>>> +
>>>  	for (int type = 0; type < IMPLICIT_STEERING; type++) {
>>>  		if (!gt->steering[type].ranges)
>>>  			continue;
>>> @@ -436,11 +438,13 @@ static void mcr_unlock(struct xe_gt *gt) {
>>>   *
>>>   * Caller needs to make sure the relevant forcewake wells are up.
>>>   */
>>> -static u32 rw_with_mcr_steering(struct xe_gt *gt, i915_mcr_reg_t reg, u8 rw_flag,
>>> +static u32 rw_with_mcr_steering(struct xe_gt *gt, xe_reg_t reg, u8 rw_flag,
>>>  				int group, int instance, u32 value)
>>>  {
>>>  	u32 steer_reg, steer_val, val = 0;
>>>
>>> +	drm_WARN_ON(&gt_to_xe(gt)->drm, !reg.mcr);
>>> +
>>>  	lockdep_assert_held(&gt->mcr_lock);
>>>
>>>  	if (GRAPHICS_VERx100(gt_to_xe(gt)) >= 1270) {
>>> @@ -494,12 +498,14 @@ static u32 rw_with_mcr_steering(struct xe_gt *gt, i915_mcr_reg_t reg, u8 rw_flag
>>>   *
>>>   * Returns the value from a non-terminated instance of @reg.
>>>   */
>>> -u32 xe_gt_mcr_unicast_read_any(struct xe_gt *gt, i915_mcr_reg_t reg)
>>> +u32 xe_gt_mcr_unicast_read_any(struct xe_gt *gt, xe_reg_t reg)
>>>  {
>>>  	u8 group, instance;
>>>  	u32 val;
>>>  	bool steer;
>>>
>>> +	drm_WARN_ON(&gt_to_xe(gt)->drm, !reg.mcr);
>>> +
>>>  	steer = xe_gt_mcr_get_nonterminated_steering(gt, reg, &group, &instance);
>>>
>>>  	if (steer) {
>>> @@ -525,11 +531,13 @@ u32 xe_gt_mcr_unicast_read_any(struct xe_gt *gt, i915_mcr_reg_t reg)
>>>   * group/instance.
>>>   */
>>>  u32 xe_gt_mcr_unicast_read(struct xe_gt *gt,
>>> -			   i915_mcr_reg_t reg,
>>> +			   xe_reg_t reg,
>>>  			   int group, int instance)
>>>  {
>>>  	u32 val;
>>>
>>> +	drm_WARN_ON(&gt_to_xe(gt)->drm, !reg.mcr);
>>> +
>>>  	mcr_lock(gt);
>>>  	val = rw_with_mcr_steering(gt, reg, MCR_OP_READ, group, instance, 0);
>>>  	mcr_unlock(gt);
>>> @@ -548,9 +556,11 @@ u32 xe_gt_mcr_unicast_read(struct xe_gt *gt,
>>>   * Write an MCR register in unicast mode after steering toward a specific
>>>   * group/instance.
>>>   */
>>> -void xe_gt_mcr_unicast_write(struct xe_gt *gt, i915_mcr_reg_t reg, u32 value,
>>> +void xe_gt_mcr_unicast_write(struct xe_gt *gt, xe_reg_t reg, u32 value,
>>>  			     int group, int instance)
>>>  {
>>> +	drm_WARN_ON(&gt_to_xe(gt)->drm, !reg.mcr);
>>> +
>>>  	mcr_lock(gt);
>>>  	rw_with_mcr_steering(gt, reg, MCR_OP_WRITE, group, instance, value);
>>>  	mcr_unlock(gt);
>>> @@ -564,7 +574,7 @@ void xe_gt_mcr_unicast_write(struct xe_gt *gt, i915_mcr_reg_t reg, u32 value,
>>>   *
>>>   * Write an MCR register in multicast mode to update all instances.
>>>   */
>>> -void xe_gt_mcr_multicast_write(struct xe_gt *gt, i915_mcr_reg_t reg, u32 value)
>>> +void xe_gt_mcr_multicast_write(struct xe_gt *gt, xe_reg_t reg, u32 value)
>>>  {
>>>  	/*
>>>  	 * Synchronize with any unicast operations.  Once we have exclusive
>>> diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.h b/drivers/gpu/drm/xe/xe_gt_mcr.h
>>> index 2a6cd38c8cb7..492d9519784a 100644
>>> --- a/drivers/gpu/drm/xe/xe_gt_mcr.h
>>> +++ b/drivers/gpu/drm/xe/xe_gt_mcr.h
>>> @@ -15,13 +15,13 @@ void xe_gt_mcr_init(struct xe_gt *gt);
>>>
>>>  void xe_gt_mcr_set_implicit_defaults(struct xe_gt *gt);
>>>
>>> -u32 xe_gt_mcr_unicast_read(struct xe_gt *gt, i915_mcr_reg_t reg,
>>> +u32 xe_gt_mcr_unicast_read(struct xe_gt *gt, xe_reg_t reg,
>>>  			   int group, int instance);
>>> -u32 xe_gt_mcr_unicast_read_any(struct xe_gt *gt, i915_mcr_reg_t reg);
>>> +u32 xe_gt_mcr_unicast_read_any(struct xe_gt *gt, xe_reg_t reg);
>>>
>>> -void xe_gt_mcr_unicast_write(struct xe_gt *gt, i915_mcr_reg_t reg, u32 value,
>>> +void xe_gt_mcr_unicast_write(struct xe_gt *gt, xe_reg_t reg, u32 value,
>>>  			     int group, int instance);
>>> -void xe_gt_mcr_multicast_write(struct xe_gt *gt, i915_mcr_reg_t reg, u32 value);
>>> +void xe_gt_mcr_multicast_write(struct xe_gt *gt, xe_reg_t reg, u32 value);
>>>
>>>  void xe_gt_mcr_steering_dump(struct xe_gt *gt, struct drm_printer *p);
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
>>> index 13f9f220bca0..8e5f8e7c16c8 100644
>>> --- a/drivers/gpu/drm/xe/xe_irq.c
>>> +++ b/drivers/gpu/drm/xe/xe_irq.c
>>> @@ -27,7 +27,7 @@
>>>  #define IIR(offset)				_MMIO(offset + 0x8)
>>>  #define IER(offset)				_MMIO(offset + 0xc)
>>>
>>> -static void assert_iir_is_zero(struct xe_gt *gt, i915_reg_t reg)
>>> +static void assert_iir_is_zero(struct xe_gt *gt, xe_reg_t reg)
>>>  {
>>>  	u32 val = xe_mmio_read32(gt, reg.reg);
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
>>> index a93838e23b7b..1029b9f27988 100644
>>> --- a/drivers/gpu/drm/xe/xe_mmio.c
>>> +++ b/drivers/gpu/drm/xe/xe_mmio.c
>>> @@ -397,7 +397,7 @@ int xe_mmio_init(struct xe_device *xe)
>>>  	DRM_XE_MMIO_READ |\
>>>  	DRM_XE_MMIO_WRITE)
>>>
>>> -static const i915_reg_t mmio_read_whitelist[] = {
>>> +static const xe_reg_t mmio_read_whitelist[] = {
>>>  	RING_TIMESTAMP(RENDER_RING_BASE),
>>>  };
>>>
>>> --
>>> 2.39.0
>>>
>
>-- 
>Jani Nikula, Intel Open Source Graphics Center
