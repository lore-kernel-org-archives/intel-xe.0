Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D62DFF8875
	for <intel-xe@archiver.kernel.org>; Wed, 29 Apr 2026 19:45:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AA7710E3AD;
	Wed, 29 Apr 2026 19:45:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="idAUX65V";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31C9C10E12B
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Apr 2026 19:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777491936; x=1809027936;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=KWIWrBj8bngUHStXnvcBQ/uiuInZ/QZzjqeLDJujWVg=;
 b=idAUX65VJsoTWX10Pt721IKmxK0mjAKD1QOvkKhFi2yohvOSOY6/gF6c
 hWURe5rQBG7s5a1t4YjP1ltacjo6YTCXMR7NF79D3jo1KPyK1GurBjAIV
 3hGqWlJO/YNT7K9jlZxyfroTC63Be57es6bBCM7Xk0j23ssvSHrWfBJ+l
 i2VFd235K4FR2sZtgiHApI8quCADwGbE9Q+XNgM+Pbd/wVSVcnq3DF0Zo
 DfbEiz7zgChnOZq1TZ0I2bGuHwT5I60aNzmV2JXyjz4ZNNgvZMXCVHFkG
 z1iWiD1oDAwGTvjLGIEI4HJ2U9r4rW6oj2rij4dczD2uz06Xzp8KECdTN Q==;
X-CSE-ConnectionGUID: KBGGkFciQeaTP1iOrfL8ng==
X-CSE-MsgGUID: RfrV62/TROK8JOWR1oYkhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="78620997"
X-IronPort-AV: E=Sophos;i="6.23,206,1770624000"; d="scan'208";a="78620997"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2026 12:45:36 -0700
X-CSE-ConnectionGUID: rc68rTWJQCCIb6ZVnybXsQ==
X-CSE-MsgGUID: a35E4tnWSPWBywHe/+6/oA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,206,1770624000"; d="scan'208";a="234388659"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2026 12:45:35 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 29 Apr 2026 12:45:35 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 29 Apr 2026 12:45:35 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.47) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 29 Apr 2026 12:45:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d7exwnqW5ndWQTW4DdmJlyvltLp3VhmEUhNHy8WD0joFdBLlF8XFY/UP1m0M8KzVKUxmF2bvDJdhjWEN6oEG3SViypDCU51j87lzHtZL229Le6KAzp5i+MK1X3opKQ6vDNynVzUA6/esWwfdp+ssoCBhhswuW5SlfuXO8srBleGYV8N46Av1N9woVx6p9ayqEls7deAkUwIhW6+y5WvDE8LFLt3CYHUH7UeJ02sOsNHF1OkrMnxEEAXhnjLmbtbBFsAi4hFNEwVZ+Ddx2dgLtvdCkN06QpiGTNSzRMpZ/1NE0ctmMaWq7vA37ZDHDs8LP6V2mTnaGpouRHr2HoQanQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ymsp9B7Il/Gl9tuzdCvGrRZRJ3R65+cZDbqm+nyvIj0=;
 b=BlYCjZa7AaJfYCuv++UnmkY42F/A+TaaGgXitFB2lZ2+BJpQ3brPPdoIKoRt6199aty7H36Ca6ARZQYoKZvWk8olUNjK6sOMGWom2wBYaYoAfqWdVm7yTdskGtQlbFIxNcXJgbLkV67tS2L9J3RaHQXciGs3Z24oLYsHQg1W8WZvgfBgrZUHOD1D0+D3qA9T2kF8fnS61WIKK+D3gsxffwjemsG3iDron9lNh5jKq++JWjiXoXNRAsyuJ1vvLTdpcQxTct9y4DZ1g61+QNTKPIXfcgvNiXt4fp1FJKs0neVe7usPkJlecHTNWis5rL4I0NwAT6sZqQwLmHsH8XnQHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by SJ0PR11MB4847.namprd11.prod.outlook.com (2603:10b6:a03:2d9::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.20; Wed, 29 Apr
 2026 19:45:30 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a%5]) with mapi id 15.20.9870.016; Wed, 29 Apr 2026
 19:45:30 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 3/6] drm/xe/rtp: Do not break parsing when missing context
In-Reply-To: <20260210222013.GG4694@mdroper-desk1.amr.corp.intel.com>
References: <20260114-rtp-rule-parser-v1-0-fa9029586bff@intel.com>
 <20260114-rtp-rule-parser-v1-3-fa9029586bff@intel.com>
 <20260210222013.GG4694@mdroper-desk1.amr.corp.intel.com>
Date: Wed, 29 Apr 2026 16:45:23 -0300
Message-ID: <87h5ota6uk.fsf@intel.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0056.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::31) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|SJ0PR11MB4847:EE_
X-MS-Office365-Filtering-Correlation-Id: 3cdc6414-8c69-4d00-0c80-08dea627de7e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|56012099003|22082099003|18002099003; 
X-Microsoft-Antispam-Message-Info: e618712DQuyIbFI5A5LXvpEzQmcREkosXBYXml7uqDBeyDRRjV2Zixm7Sg6uHyF9ftagRbp4foG1+D3vMlTSk7mv2xfeRuV95HANxQsA7XIjjdO2jCi52g+h464D2/nVOB3uxezg7iF6xwhH0Cpfv8lcOSW8JTPvpT7znd65SLpD4sLX0KpUJWui4/cFjzPbhxvf65OCNQ93wLZCfuYIFArp9o/cbLWAyKZ3zJrLChANUl29o7bZcEtxbbxB9bMJP/GrhDfOoTTiHatj0YmQJBK2XjDMLrc78Gru56OYtiFp4s92xvO9NbfErxwhgbpPryQfx/7G0a0qt4tMht88AetLMdEq7fezz7Q0YRlqEXej7nkEML3uBwH0kBOJv09wHNDotgNsnfZRrST6lMQwLxl4jOp4W5NCPNbyXfk/7o983hMBfdnBRm3LFTeGnCF0ejxFnHb1YuMdU+aCj5YK1XDg2axW/j1u2MT47AtJ5t2ESEQFA+idK7cJ1jL9AmD2HRnsH+5tDzs6VfT4SU5e+XDyTgH1BZYBkBXtbNUuNnpOFS5WZ1BjaoR2XKrgqh++fQ3icfwMNJwj42RCbJdLVgJZvqgsBrjXeUby7LrFiDx8/Yv/N/NKsoCy2vQnY1yvo+pntURy/oouOSNUHD5koPBKAcv2Sw1VnAMSyE/wkah/rqm1ivdMcOgmmqSEn0vZrxRaf08d4gQXGR5eBDwEUne6oOgwQLGbxQ0QVns9mx8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?R0kU76q9YjJSqAyMV0ALppBRoiNUuPz1iJtkzH4dgQDqDjPcLUIvQZSTBIRQ?=
 =?us-ascii?Q?EBs41Fqz7VNCd83Gel17V06ZBrWSNojm4OYM1W9Ee7kJhp0gsHIqtbfQuOsD?=
 =?us-ascii?Q?Ba8PMpLC5HoHtufkfL/GbQVqdpaZ83pAxbDx+htRMhzv4CtENWjGhHHlEqaK?=
 =?us-ascii?Q?paWcfYofTdJ4OVKqQq8+cQvGkIH3/O40a3lxcWnPfoD6s+3m4f8cU+6iCFMv?=
 =?us-ascii?Q?xJPJjZyHkEjVIo25nj7DPjzxtY6yLOUiqMcgfv3S8ep1pGbXyJnfo5duPA9K?=
 =?us-ascii?Q?8+lfUoqauZk36UIrVTWg6yGH12+Jy7wkP9sPRfU70js8pA+tSLdPpPODom5j?=
 =?us-ascii?Q?CT/T1IIQQ77kdewdZbIRm/gm2/9nYGuDjFKBocqFW0Ag5yYpyv5QeHsObK/P?=
 =?us-ascii?Q?vGLEW+9GI5XcFP9FfalV19iHnK4vnoIfEREEaeKp6bcp8UUn9D3tGLTuuIG8?=
 =?us-ascii?Q?j1Nv5DGkuWpAWdtp+UUmAuXmviLLGZUm/1Vif6JkzhrmbEJv0oaBPUeq4+qD?=
 =?us-ascii?Q?gxvtNKHHyVwac58gGoyIIOGFxX0yoyp+cTqCaMhsJqqByR0iI/7NFSvtYETY?=
 =?us-ascii?Q?a/KDyoJ2NvhQbVHvXb8S5Das5JH5a7RKOxSyVw4dwxxDu1ZjXrkRuAVqkoCb?=
 =?us-ascii?Q?NgU/rte0MFgsjhkZ+fe6X5yCtUtvnT2BQ7FE7qy4OGN2BCXzm9LWFjjTOZEk?=
 =?us-ascii?Q?nBZf1cm3f7fKKYWZFYT3iZdSj/oZ/5RMYatokf4r2z2HvJWTj2cfqmWUQ/Al?=
 =?us-ascii?Q?7aKHbV3UVU9GhcNf0otdfZIghcVnuZRnEKkiKwTWJOumkCPrM3SMVoqpMZ1e?=
 =?us-ascii?Q?+K9GeYDufsAQjOs4sfY3UOFe3DSnLhHcKNtHkW1w5HxVEhq2HYnxRs82J34R?=
 =?us-ascii?Q?NnXyL9SPoEhxGIRxe35sDzIemHaU6VUzGuWlJmhCgoYO2QgePvSBywIilqHq?=
 =?us-ascii?Q?j291JEp2rA9YKprgag4wzfPbrG3Zdn2x+9h60PNPysdP2YlXaQGnr+u6eHGI?=
 =?us-ascii?Q?gXlfKi4KjtK4kpxzMlNrYctl94fzbr/S/GKantyvTNqEiO28yXWelF7ct600?=
 =?us-ascii?Q?0nvh7LrUIyg1vFIFVeyb0CUCKGLXeFXat/ZuXwabDHaxWuUO7XsqCSl+qBxh?=
 =?us-ascii?Q?q8A560PYQg2T/2OClmGorMCKHPGmkck5LPzuOd9q0QY4AVRlxEfAgU0j12Cl?=
 =?us-ascii?Q?fBxKNIcNV0YldH/C9G6yaq5mm8Gr7Wbfl7Z2swKOv8ocCndv7KjQAtYCCD8Y?=
 =?us-ascii?Q?AgQzYEHtIsvYEjQuDWXnaighLYp+Rd8mZHtyo10N+P+VFslIBKfTkIezJb1p?=
 =?us-ascii?Q?LXLaZvqp4yvEkgcfat9i35VOzMJMJe9M4etjNvLfe+HqUTujqJacGN7sCS/S?=
 =?us-ascii?Q?3RrPWQ13I5VQdryf7c1sGUIy2/xsGYNcSaefjqE1IU2XAIXFgpLXzHRCm1iP?=
 =?us-ascii?Q?W6kI/gji/rNT0yBKldQIpVMRWIcxQK70THCtLwhB8SWWb2veIxc8Pd9XYbJN?=
 =?us-ascii?Q?QCG3t2L0xmQuSgS8hlIQ3mkUBmILi52ctIuA4BMHAja+O2ueFX5VddA25kXX?=
 =?us-ascii?Q?0oaehz5knT/RMjvJdEkm+9mvQQwdghkJ01vcFwAMjCGnBUKfzHhudhc/G78k?=
 =?us-ascii?Q?axL08MgrIZlVdI+bY5P0KPYUIQpT4FD2VwWfySwp7ZZ1aAnhKzFq86Lr7ilx?=
 =?us-ascii?Q?3XavyL/7G3VvtoLtnL8Bld5wlsAwOqBx6T4vEkE96TY0qQ9bZXzTbDHA/x0y?=
 =?us-ascii?Q?Mquj6XNzpw=3D=3D?=
X-Exchange-RoutingPolicyChecked: PRWOhgV4f2pD9IFAOpjujSyF2ZYK7MFZroqap7Bjjo+lXQs6nDpxZ6G7p9J+jK0RRH1g3XpKvzW/kVJvKiefvLle6e/KrGsVwMiQCgqT6q2shtFRA67aThYkn77WGEn5qlwKdSQDfg22Kxs1mcw/oF45N+UPM8anQsBJLcCBe+xTLNa2203sEypWeaYy4/HV+WpNhyopq0IpNkebBPjXrABPAxyTIvFXBQ6XnrK2yC68JkYTbjgOWv3RD2vIKH4aG7I70jEL/3XGmZZQvnHV1a4H7akevfpUf5avTku/DsQJJg0MnZ5z0GJmEyrjdZsNGZnu497XBEvNAV7OHV2FHw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cdc6414-8c69-4d00-0c80-08dea627de7e
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 19:45:30.2727 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T/YXIXGsJIZZPYxkGjuQ0NPl/VdihUZjX23EyM0Y0ikoHmFef+7fQLN2wk6/dZVP2PFb+RV2zDXKRygagYtJUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4847
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

Matt Roper <matthew.d.roper@intel.com> writes:

> On Wed, Jan 14, 2026 at 07:49:53PM -0300, Gustavo Sousa wrote:
>> With the current implementation, the RTP framework will cause parsing of
>> the rule set to be interrupted if one rule requires a context item (gt
>> or hwe) that is missing (i.e. when the value is NULL).
>> 
>> This is arguably a semantic error instead of a syntactic one, meaning
>> that RTP should not interrupt parsing the rules.  With the current
>> behavior, we would miss detecting other errors that could appear in the
>> remaining rules and could also prevent valid rules joined by "OR" from
>> being evaluated.
>> 
>> Make sure that we do not stop parsing the rule set when detecting
>> missing context and let's add rtp_rules_test_cases to reflect that.
>> 
>> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
>> ---
>>  drivers/gpu/drm/xe/tests/xe_rtp_test.c | 28 ++++++++++++++++
>>  drivers/gpu/drm/xe/xe_rtp.c            | 60 ++++++++++++++++++++++------------
>>  2 files changed, 68 insertions(+), 20 deletions(-)
>> 
>> diff --git a/drivers/gpu/drm/xe/tests/xe_rtp_test.c b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
>> index b2286dd9d92a..19c7142b2fe4 100644
>> --- a/drivers/gpu/drm/xe/tests/xe_rtp_test.c
>> +++ b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
>> @@ -177,6 +177,34 @@ static const struct rtp_rules_test_case rtp_rules_cases[] = {
>>  		.expected_err = -EINVAL,
>>  		XE_RTP_RULES(OR, FUNC(match_yes)),
>>  	},
>> +
>> +	/* No match because hwe is NULL. */
>> +	{
>> +		.name = "engine-class",
>
> Nitpick:  The names for these tests doesn't really make it clear what's
> being tested.  Something like "missing-context-engine-class" might be
> better?
>
> I'm wondering if an even more useful test would be one that scans our
> actual RTP tables and just looks for anything on gt_was[] or oob_was[]
> that has an engine class rule, or anything on device_oob_was[] that has
> either an IP version rule or an engine class rule.  If we catch those
> mistakes during early kunit testing, then we shouldn't really need to
> worry about what the behavior would be if one of them survived to be
> parsed on a live device.

That seems like a good idea.

>
> Anyway, the rest of the patch looks fine, so aside from improving the
> names,
>
> Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

Thanks!

--
Gustavo Sousa

>
>
> Matt
>
>> +		.expected_match = false,
>> +		XE_RTP_RULES(ENGINE_CLASS(RENDER)),
>> +	},
>> +
>> +	/*
>> +	 * Missing context (hwe==NULL) does not cause parsing to stop, hence we
>> +	 * expect a match.
>> +	 */
>> +	{
>> +		.name = "engine-class-or-yes",
>> +		.expected_match = true,
>> +		XE_RTP_RULES(ENGINE_CLASS(RENDER), OR, FUNC(match_yes)),
>> +	},
>> +
>> +	/*
>> +	 * Missing context (hwe==NULL) does not cause parsing to stop, hence we
>> +	 * expect a syntax error.
>> +	 */
>> +	{
>> +		.name = "engine-class-or-or-yes",
>> +		.expected_match = false,
>> +		.expected_err = -EINVAL,
>> +		XE_RTP_RULES(ENGINE_CLASS(RENDER), OR, OR, FUNC(match_yes)),
>> +	},
>>  };
>>  
>>  static void xe_rtp_rules_tests(struct kunit *test)
>> diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
>> index e955df6c22ca..e0bed5ac1369 100644
>> --- a/drivers/gpu/drm/xe/xe_rtp.c
>> +++ b/drivers/gpu/drm/xe/xe_rtp.c
>> @@ -61,60 +61,76 @@ static bool rule_matches_with_err(const struct xe_device *xe,
>>  				xe->info.subplatform == r->subplatform;
>>  			break;
>>  		case XE_RTP_MATCH_GRAPHICS_VERSION:
>> -			if (drm_WARN_ON(&xe->drm, !gt))
>> -				goto error;
>> +			if (drm_WARN_ON(&xe->drm, !gt)) {
>> +				match = false;
>> +				break;
>> +			}
>>  
>>  			match = xe->info.graphics_verx100 == r->ver_start &&
>>  				(!has_samedia(xe) || !xe_gt_is_media_type(gt));
>>  			break;
>>  		case XE_RTP_MATCH_GRAPHICS_VERSION_RANGE:
>> -			if (drm_WARN_ON(&xe->drm, !gt))
>> -				goto error;
>> +			if (drm_WARN_ON(&xe->drm, !gt)) {
>> +				match = false;
>> +				break;
>> +			}
>>  
>>  			match = xe->info.graphics_verx100 >= r->ver_start &&
>>  				xe->info.graphics_verx100 <= r->ver_end &&
>>  				(!has_samedia(xe) || !xe_gt_is_media_type(gt));
>>  			break;
>>  		case XE_RTP_MATCH_GRAPHICS_VERSION_ANY_GT:
>> -			if (drm_WARN_ON(&xe->drm, !gt))
>> -				goto error;
>> +			if (drm_WARN_ON(&xe->drm, !gt)) {
>> +				match = false;
>> +				break;
>> +			}
>>  
>>  			match = xe->info.graphics_verx100 == r->ver_start;
>>  			break;
>>  		case XE_RTP_MATCH_GRAPHICS_STEP:
>> -			if (drm_WARN_ON(&xe->drm, !gt))
>> -				goto error;
>> +			if (drm_WARN_ON(&xe->drm, !gt)) {
>> +				match = false;
>> +				break;
>> +			}
>>  
>>  			match = xe->info.step.graphics >= r->step_start &&
>>  				xe->info.step.graphics < r->step_end &&
>>  				(!has_samedia(xe) || !xe_gt_is_media_type(gt));
>>  			break;
>>  		case XE_RTP_MATCH_MEDIA_VERSION:
>> -			if (drm_WARN_ON(&xe->drm, !gt))
>> -				goto error;
>> +			if (drm_WARN_ON(&xe->drm, !gt)) {
>> +				match = false;
>> +				break;
>> +			}
>>  
>>  			match = xe->info.media_verx100 == r->ver_start &&
>>  				(!has_samedia(xe) || xe_gt_is_media_type(gt));
>>  			break;
>>  		case XE_RTP_MATCH_MEDIA_VERSION_RANGE:
>> -			if (drm_WARN_ON(&xe->drm, !gt))
>> -				goto error;
>> +			if (drm_WARN_ON(&xe->drm, !gt)) {
>> +				match = false;
>> +				break;
>> +			}
>>  
>>  			match = xe->info.media_verx100 >= r->ver_start &&
>>  				xe->info.media_verx100 <= r->ver_end &&
>>  				(!has_samedia(xe) || xe_gt_is_media_type(gt));
>>  			break;
>>  		case XE_RTP_MATCH_MEDIA_STEP:
>> -			if (drm_WARN_ON(&xe->drm, !gt))
>> -				goto error;
>> +			if (drm_WARN_ON(&xe->drm, !gt)) {
>> +				match = false;
>> +				break;
>> +			}
>>  
>>  			match = xe->info.step.media >= r->step_start &&
>>  				xe->info.step.media < r->step_end &&
>>  				(!has_samedia(xe) || xe_gt_is_media_type(gt));
>>  			break;
>>  		case XE_RTP_MATCH_MEDIA_VERSION_ANY_GT:
>> -			if (drm_WARN_ON(&xe->drm, !gt))
>> -				goto error;
>> +			if (drm_WARN_ON(&xe->drm, !gt)) {
>> +				match = false;
>> +				break;
>> +			}
>>  
>>  			match = xe->info.media_verx100 == r->ver_start;
>>  			break;
>> @@ -125,14 +141,18 @@ static bool rule_matches_with_err(const struct xe_device *xe,
>>  			match = xe->info.is_dgfx;
>>  			break;
>>  		case XE_RTP_MATCH_ENGINE_CLASS:
>> -			if (drm_WARN_ON(&xe->drm, !hwe))
>> -				goto error;
>> +			if (drm_WARN_ON(&xe->drm, !hwe)) {
>> +				match = false;
>> +				break;
>> +			}
>>  
>>  			match = hwe->class == r->engine_class;
>>  			break;
>>  		case XE_RTP_MATCH_NOT_ENGINE_CLASS:
>> -			if (drm_WARN_ON(&xe->drm, !hwe))
>> -				goto error;
>> +			if (drm_WARN_ON(&xe->drm, !hwe)) {
>> +				match = false;
>> +				break;
>> +			}
>>  
>>  			match = hwe->class != r->engine_class;
>>  			break;
>> 
>> -- 
>> 2.52.0
>> 
>
> -- 
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
