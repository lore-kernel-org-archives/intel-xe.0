Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08799FF8855
	for <intel-xe@archiver.kernel.org>; Tue,  5 May 2026 18:32:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCF7B10E46E;
	Tue,  5 May 2026 18:32:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZrR6Tpvs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C37E110E46E
 for <intel-xe@lists.freedesktop.org>; Tue,  5 May 2026 18:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778005932; x=1809541932;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=W1ptKM6hQoL1j83C2/nO+8GUwkzty4ybka+E/BWCk1o=;
 b=ZrR6TpvsVSGZ8yqJArP9N6RqAYZ1SMQQ6WrHD3bsJWBv9UlCnQ3ghZGg
 BSOT4x1p34z2xihT/5nDwXtkXkokY0dkMkIwEb+9WRq4ODFgB/TDz0Vko
 595dhs4EfCXnebie30Gf9wEX6emyNHJUe9UXrglCQLBcGGnOi0jDvl7dU
 Dg2PYSgmgz1boB/bgSXXfppn+89Rae8z/WnCMYH3tFJJAKyKQ7unSokHq
 HERsv95Bu+4K4tLu7j6fmEHYWutsWD3iYXSnoXpkRBMEHM83u7xGa3t3l
 NmYIuc2Bewiy8Gp1UQ10UfyG/44346kW743km0SjSwWQaMM3cVLh30jUp Q==;
X-CSE-ConnectionGUID: bQYENgP6RjyRZyxm3/i03Q==
X-CSE-MsgGUID: qHnDuDYkRcy5go0WsgeMZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="90346705"
X-IronPort-AV: E=Sophos;i="6.23,218,1770624000"; d="scan'208";a="90346705"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2026 11:32:11 -0700
X-CSE-ConnectionGUID: TMuQYCHvTpqepJNm6w4phQ==
X-CSE-MsgGUID: LcTkWvAZQCWgqLyNxuuX4w==
X-ExtLoop1: 1
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2026 11:32:11 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 5 May 2026 11:32:10 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 5 May 2026 11:32:10 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.56) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 5 May 2026 11:32:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=buzrjJetS85dBS0SVboDVi/OZkX/2CmjVrPBk2sMe5JocDtO1C+8x+ILMceVyyfOCm6K9TyxXOQqrA+xBa2E7MW6R4lN2VGTtqXOBuvc8qi9+AH6Ek4+a/tcZSb7Kwro6R5ciWj3RlBj16FXa3NjlNatx2ireR9ZhYDtr5GY5xVhSI+bKdiwq18tuV20RzKufG/MYjtGxnIRzHfg7+63CksoWi9haX9C2sNOBpKi7+ElxE1ErnAQkPtAl/s5Munm3tmvsIorIyvWGjMhvh+SswSoqkHO6xjKEnQJdjJwGz4UylGfoMLr5TNNRWOn7wrhIiQw3tKakSD3FSQ344AYfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cc7X6Kexrb7lugPd0dHlA+O96QcXOzFNopWXCWErPAc=;
 b=HoKGURhDBeCKIYVv77+G+pcbNdYgIK2OrJjRGJeZGynVyRdNDgVM9DRqaCgEN4rn/u0jc/lOfrjtDlGsjmjGsIXSXxQVotBpNlxF1ZX6ESwNIpLdJxNxACK9X8Qvfu2TJKylyWw7sV7+iotN2PqKISD1bAJ8FPR17Jl6YA4d+kN6qX3LX4Z9WJGAagDLVL8b4cQoGEd20LS0+Yr+7grGD3cm0bSpWCM0dUoUlJilgI1NEDIx/4co/q4oHPGCo9c3LQssq3ZJcn5dcGgpwGPac1ZsTa3vENHnUBLHbibiW1ME+4ufqErmaJDDmCEk77LPngfZlyZ+mz/EcdXadwDAmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by PH8PR11MB6803.namprd11.prod.outlook.com (2603:10b6:510:1cb::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.27; Tue, 5 May
 2026 18:32:06 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a%5]) with mapi id 15.20.9870.023; Tue, 5 May 2026
 18:32:06 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 04/12] drm/xe/kunit: Add xe_kunit_is_live_test()
In-Reply-To: <2f919dd4-e219-4230-a734-d67a280eec13@intel.com>
References: <20260116-rtp-mcr-check-v1-0-d420b9c1a327@intel.com>
 <20260116-rtp-mcr-check-v1-4-d420b9c1a327@intel.com>
 <2f919dd4-e219-4230-a734-d67a280eec13@intel.com>
Date: Tue, 5 May 2026 15:32:03 -0300
Message-ID: <87o6ityafw.fsf@intel.com>
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0001.namprd05.prod.outlook.com
 (2603:10b6:a03:254::6) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|PH8PR11MB6803:EE_
X-MS-Office365-Filtering-Correlation-Id: 34755f41-f55c-4c19-a3b7-08deaad49c58
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|22082099003|56012099003|18002099003; 
X-Microsoft-Antispam-Message-Info: CdyFIWIzX7+CrEvani8QIlc5o4ZypHNz2esRdQDaBBfW1zBLraYl/SrS2nNd/1ZqpR/LUP14uI+iLhk/DB38wjekc8xeKe1AoYGOOSDj1MRLc0v5RI46ibG3JYfJoXzm690iU0ej/YcV6VdubOBdkJsiJTfoF3hjfh7tzGUsuoWgnc4MaHKVA0tkz3Gvje5VGT9itu2421hXNANiFEqvJGhsZxrQGA9Va6iIFGMOdmGC+bp/PcdtC+SRQ59NOnkqDl3WlMMLsYP53yMdOG+hg8gY60UISbgjtiuR5HZC9zAF459NniOkYHeGIi/zpz4jBVdat424v22a0qzqRdVriSNLR6cy5rwEdSqNE3/fD7E8fAxCohZIp5td1EaDUH0abyGB/97eupdDyrrPfLDbuXnvpykOW+oTxZUOa+qWKlJbi/T59uEaicMmfYc2attBz9FguC9ID10me0Eex4K8LagD/YEUEggakhdKDOYVaECsxFfHf3uROHuKFaQN5hZDvHRTselMHv9ZWKnQZBC01ui53OtuZqCucmOR7K/BOVWm/TuqC/bLhtuX8BqiCpuOeyPvcpDeb561wGSxRPEb0ToIj+5Pw7wO6CxaXBhEPtyIawFu/GmQL4FTR0x/WN669zQiYsSnlYzUOxgKqKt6V8KnM+nx1sEeLzAaYNY50/qIUyTyU8kmHMarx/My8MFV
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?d+pOppXMiOVN85YwFQvyZpdPD5JPvn0dadDKiJJfAUjHWtwDmZiEwUBfTjBk?=
 =?us-ascii?Q?J/ut45KSBrl7fwHj8PRczJWyF6Js9/JuwbJTRjAzN0kyMqfPliVWUlMTZ/+L?=
 =?us-ascii?Q?b4FG3SzKU9IM/N2ShsijFwTE+R514QcleUMfzrodfqaVH/pBpJz6s9ngAlVl?=
 =?us-ascii?Q?tKKFuPkMtk5eQySj1w7NzlIwe3xa38qD8bSONukwmrttNjRsKkg4IXFromSN?=
 =?us-ascii?Q?is1IGNjL18yHg9HsNEfwUrIQXdfo0uO4+vz9fIxOb1A90sK4cUaS7QfIBS6R?=
 =?us-ascii?Q?mkM/iYjVsXxIId+Hps391GyYW3DSyYqDXeaSnKWoKrqxxM2souOT8n8WxqAD?=
 =?us-ascii?Q?M3Ep3XiiLbVlSqfRhXEdCZcFtrZumpsdOtxmd83ObTms+WxXxPwJsppIWabA?=
 =?us-ascii?Q?NW0A+y/jMY88xEadoMbjiOES+YalGMV5CJSeBl0SivNBionS6NxDkbBtptn1?=
 =?us-ascii?Q?TLyepXRtkiuIQpu5LxaW2+IpRjFyJAyQYAlKoVcTWTBE5wnMF0f+2NIsUUgR?=
 =?us-ascii?Q?3tDlx92KVLZUyToVzzyJaYX6EgbGPZzHwZG3bHc4enCeyqZQgrD6SpNhQGD6?=
 =?us-ascii?Q?EXsfrnar1hahofCDU7ce5rTQ7NqKnDPj81R5VAcOSDde741rmGVHCX9/ZU+K?=
 =?us-ascii?Q?Q0KKj978pMRgmvlb80ThMaRRYI/f99aTRK647k0ETFvXmhi7xEIH3Z+nw10d?=
 =?us-ascii?Q?JRWweC7QEWUTwrqmhkI77I2vnxRadOg00DhnJbEwH7TGrQUa/crKKqwLRS99?=
 =?us-ascii?Q?FrgavgJrIo319a0dUTdNfGwN8m4uisM4jeIj/ymj5RUsn4nkpnzTcix/B7Iq?=
 =?us-ascii?Q?V9LOe5vCPw5i5dVl2dYA6cm770Bo45N1Vx1B4mgZGo7JhDnjayKj2R0R/U2C?=
 =?us-ascii?Q?fzZElYzeer93tafnPa6WZWPqWqXn77LkDkzQLFfS+sEio2cnmG+mX8bIlStf?=
 =?us-ascii?Q?r8QpzxLSjDxS3CNIoRNYgtoB7wmzqzlYjWEpKD8Xy38w1tarLVd6zpx2AtP/?=
 =?us-ascii?Q?xSubnFyk8jEYXiphOIsLHm++MMXy4Z5O1qB1XhGiVUXjJ2bMD0XNV58Mh4gA?=
 =?us-ascii?Q?tGoZTnCGSWTm49xbToOb0P5mpXuYz2HeKLTAQYNwFVVWZchh9VryfdaRJo6m?=
 =?us-ascii?Q?vYWBP2nupSXn4YzQMa1/winetY6SU0YBczk8rVzUx2rdfHyDJq17vpdWtwWb?=
 =?us-ascii?Q?TZ/zB9QV7w6yW3aFMiZm6SHAz+A4AsW57t8XOb/oSncduvwrtH6b5QlRAPw+?=
 =?us-ascii?Q?0YaxEoLah6/0u6py97872wDq2m39i8mQGEkknNt0fgWiVlI/xr/NTG0guSly?=
 =?us-ascii?Q?+N2UelNkHBx/d4GfwkeGawzVKIRjB8SjClpuBzAiaPT2ruL5OdepUl3syZel?=
 =?us-ascii?Q?2DAlPb9KON9xoN2Uhvym7LLKrYR7QBQCnf2lS0qgSxd5FzHD3/p6gbzAjax0?=
 =?us-ascii?Q?QK+Zfh45lHp17y8TfYimyyt5qOZ59ITMueGMUzCS2j25OZb14mzcvr6YZdhK?=
 =?us-ascii?Q?WOmztP1xP1x3G2wWVT7VFGW5UkNRwDyNZL5h8m+TF6kYfxVaF1vhqUxhIONX?=
 =?us-ascii?Q?Usf8ekOJI00FXwfTBQcvWXI4Tqx3gg2JgONjRukRifYZCvZ5cQuitPcuN0hF?=
 =?us-ascii?Q?dpw1MOjRcrua/OrvyiC30lUd91yBI/jl9cVr+w+WMdS3qOZYMEKYS+Rb+R3e?=
 =?us-ascii?Q?kt91quexEREYmy4+K9rTPSad9A87Nc0NuaH1YNyzuxR4Kq8u/UUvMOz5rFHe?=
 =?us-ascii?Q?MYM1kh/5fg=3D=3D?=
X-Exchange-RoutingPolicyChecked: jCGXn46SQFwPKGIWzNJKWoprAxnQc3XTYdu3hcc73Ry33wjpxwGE64DQFhLQeVdLmYVd47MEAw/cBtNhkGuqIeSggth8NUkWKRQBd/bE8AN6GBc15mlibuqobCtKEa7igj0xEfjWKT0GL8iM6T6Y/c8XQ47zxJQ2C0HThBGYf0QarxfoTtlhwqZRMIqlyBjDwtAv10Yx0uhpa/EDuknUzl8PbmFmFwETA6e1aN/8xIZeAS4+OyQeYBw5llcH5TXWEDRjIEkU+T1RTKPsjv5ciAu7F70yAwSElzpVtH7cKrB0++SWzQAUCOaD5DrgYg78NQYeaPrSOKkbs9XRuV4URA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 34755f41-f55c-4c19-a3b7-08deaad49c58
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 18:32:06.8027 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QDp9LpFVkAf5vBy3L8DAY1k9tstg/C09Z0NR6OUJUytcRbgRkpxg7YM3KiHy9Saz1Li1gYfdjpySvfhyzyQjGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6803
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

Michal Wajdeczko <michal.wajdeczko@intel.com> writes:

> On 1/16/2026 11:12 PM, Gustavo Sousa wrote:
>> In upcoming changes we will need to differentiate between regular and
>> live KUnit tests.  Add the function xe_kunit_is_live_test() for that
>> purpose.
>
> since you are adding this function to xe_kunit_helper.h maybe it should be named as
>
> 	xe_kunit_helper_is_live_test(test)
>
> to follow other function names in this file?

Yep, makes sense.  Let's do that.

I think in the future we could just rename the files to xe_kunit.[ch].

>
>> 
>> Note that this is implemented in a rather hackish way, by leveraging
>> KUnit's static stubbing functionality.  A better approach would be to
>> store a boolean somewhere in test->priv that would tell if a test is a
>> live one, however that's not quite feasible today given the inconsistent
>> usage of test->priv (there is not a single uniform type of data assigned
>> to it across existing test).
>
> all live tests code should finally have access to the xe_device so alternate option would be to add some flag(s) there
>
> 	struct xe_device {
> 	...
> 	#if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
> 		struct {
> 			bool live_testing_in_progress;
> 		} kunit;
> 	#endif

I think I would prefer that we would have a common struct that is
attached to test->priv.

>
> but IMO solution with static stub is fine
>
>> 
>> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
>> ---
>>  drivers/gpu/drm/xe/tests/xe_kunit_helpers.c | 25 +++++++++++++++++++++++++
>>  drivers/gpu/drm/xe/tests/xe_kunit_helpers.h |  4 ++++
>>  2 files changed, 29 insertions(+)
>> 
>> diff --git a/drivers/gpu/drm/xe/tests/xe_kunit_helpers.c b/drivers/gpu/drm/xe/tests/xe_kunit_helpers.c
>> index bc5156966ce9..369b26b3a32c 100644
>> --- a/drivers/gpu/drm/xe/tests/xe_kunit_helpers.c
>> +++ b/drivers/gpu/drm/xe/tests/xe_kunit_helpers.c
>> @@ -16,6 +16,18 @@
>>  #include "xe_device_types.h"
>>  #include "xe_pm.h"
>>  
>> +/**
>> + * xe_kunit_is_live_test - Return true if @test is a live test.
>> + * @test: the &kunit test
>> + *
>> + * Return: True for a live test and false otherwise.
>> + */
>> +bool xe_kunit_is_live_test(struct kunit *test)
>> +{
>> +	KUNIT_STATIC_STUB_REDIRECT(xe_kunit_is_live_test, test);
>> +	return false;
>> +}
>> +
>>  /**
>>   * xe_kunit_helper_alloc_xe_device - Allocate a &xe_device for a KUnit test.
>>   * @test: the &kunit where this &xe_device will be used
>> @@ -93,6 +105,11 @@ EXPORT_SYMBOL_IF_KUNIT(xe_kunit_helper_xe_device_test_init);
>>  
>>  KUNIT_DEFINE_ACTION_WRAPPER(put_xe_pm_runtime, xe_pm_runtime_put, struct xe_device *);
>>  
>> +static bool xe_kunit_is_live_test_indeed(struct kunit *test)
>> +{
>> +	return true;
>> +}
>> +
>>  /**
>>   * xe_kunit_helper_xe_device_live_test_init - Prepare a &xe_device for
>>   *                                            use in a live KUnit test.
>> @@ -116,6 +133,14 @@ int xe_kunit_helper_xe_device_live_test_init(struct kunit *test)
>>  {
>>  	struct xe_device *xe = xe_device_const_cast(test->param_value);
>>  
>> +	/*
>> +	 * FIXME: This is a hack and a better solution is to have the "priv"
>> +	 * member of tests have a boolean to tell if a test is a live one.
>> +	 * Unfortunately that can't be done today because "priv" does not point
>> +	 * to a single unified type across existing tests.
>
> note that we use priv to pass xe, and likely if any other live init hook will replace it,
> priv will still point to either tile or gt or similar object, from which we should be able to reach xe again
>

Yep, but I would much rather have a common struct to contain common test
information and then a "data" member to point to test-specific data.
Today there is no easy way to predict what test->priv will contain and
it makes it harder to add common helpers (like the one I'm adding here)
that would work across different tests.

--
Gustavo Sousa

>> +	 */
>> +	kunit_activate_static_stub(test, xe_kunit_is_live_test, xe_kunit_is_live_test_indeed);
>> +
>>  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, xe);
>>  	kunit_info(test, "running on %s device\n", xe->info.platform_name);
>>  
>> diff --git a/drivers/gpu/drm/xe/tests/xe_kunit_helpers.h b/drivers/gpu/drm/xe/tests/xe_kunit_helpers.h
>> index 83665f7b1254..4b846cfb1f40 100644
>> --- a/drivers/gpu/drm/xe/tests/xe_kunit_helpers.h
>> +++ b/drivers/gpu/drm/xe/tests/xe_kunit_helpers.h
>> @@ -6,10 +6,14 @@
>>  #ifndef _XE_KUNIT_HELPERS_H_
>>  #define _XE_KUNIT_HELPERS_H_
>>  
>> +#include <linux/types.h>
>> +
>>  struct device;
>>  struct kunit;
>>  struct xe_device;
>>  
>> +bool xe_kunit_is_live_test(struct kunit *test);
>> +
>>  struct xe_device *xe_kunit_helper_alloc_xe_device(struct kunit *test,
>>  						  struct device *dev);
>>  int xe_kunit_helper_xe_device_test_init(struct kunit *test);
>> 
