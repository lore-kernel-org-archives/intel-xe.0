Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F1A6C4828D
	for <intel-xe@archiver.kernel.org>; Thu,  1 Feb 2024 14:13:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 200F510EE3B;
	Thu,  1 Feb 2024 14:13:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VaA5TWSY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2E4E10EE39;
 Thu,  1 Feb 2024 14:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706796818; x=1738332818;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=u8UZmcKC9HeF1VNZFnJWebPlHsOsoQVyOXEuxoXK3mY=;
 b=VaA5TWSYEolkc6THLBZiGm75JjQHfd0Z/KNWEtqCuBsU99kwcPtc0KZW
 tLQWZRWYoydq7C+F4aUDmgesyD+xMrZoVW72xKqJEkTMfgDi45q+6T43t
 UYut+8rs6ysPheeJfkyKDnZJkwjwnmI+q84owKGqlVo6EdQ6Ez7dvyqKq
 KTsXLxtrT/gdqM97UaHch3BWpyKqclgn9ZSffJmYuKyO9sx1yDFCz7+Ne
 Gs8S1557gLwbHXW8GEZtCatGaCYAfAULEDwXdWS8jRSuBK8Mq7+C8MAN5
 3iwBETC3pr85qYVlAem1GX3luKDA7uJGYKzEFIsQVgV+LjQq82ROCl1vd A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="3769327"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; 
   d="scan'208";a="3769327"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 06:13:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; 
   d="scan'208";a="4392720"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Feb 2024 06:13:37 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 1 Feb 2024 06:13:36 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 1 Feb 2024 06:13:36 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 1 Feb 2024 06:13:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mV4TsxLSeVQefTtCQEY08NJPVtleE2CHFoYUEoIW7IWJt+SYMTspQYtfu69WjjGm+f3q7wu0cLc0Jb+WYWcZq9OUwCXISroIH4gT79rYntPMJfxxpSPlo1kPM54hA0Ivgt9fWrmRbLpLYYE7fkDlVnPhWNvdhcvUCZ6iwIuKAv7GwIxsl0R93gKPAAynA6Vy5wjTqGEa9lR+M22pErCgG1AFu+1903+0p6bh1ZEpuIE4w9iDPQhoaAtx0I5Une15fhKYbSUWq+tVetcvXtZayFg/Y6p8sNOFWmZUCb8fimOflS2/WRal5SIFlt9l3Os+ChZIA/pNDHYB0Pd0qne6NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lJPZojKj1W0gt5af71ty6oFwRG29ECR33mNUftP1n6Y=;
 b=Yy4I/Qli8fbQkDoY3cxvygMlKY5d1SOZ9Vk7w6oTYMiNljq6m+/6EhvcvNMkipqBRMVeJAo1s94qJj1JuWHXQXObbd4J79MAoQodJIPKRRmyfIB5ovnT2e2duYGCyZwZ1HVgdp8kpQ5JfXRT4gMT08B9tTluSl8479Irc3DCVOV3XrcSt1Tew3LwjwtOVL7l+PHWKN/7G7Lvb82PyfgF7jG+FWeA9jJxtGZjkKDwwnv5VDeIdwzZ4hk5odVQDBp3DSf5XyUO6cu3T4P6eLMM0xRISRAvWazTL1u+0GkIDGjoVsAlCIJgs/cwX4VlmoJVwGgcXFBxRN9AiEp3xwiGmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB6931.namprd11.prod.outlook.com (2603:10b6:510:206::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.22; Thu, 1 Feb
 2024 14:13:33 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954%7]) with mapi id 15.20.7249.025; Thu, 1 Feb 2024
 14:13:33 +0000
Date: Thu, 1 Feb 2024 08:13:31 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
CC: <igt-dev@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>
Subject: Re: Re: =?utf-8?Q?=E2=9C=97_CI=2ExeBAT=3A_failure_for_lib=2Fkunit?=
 =?utf-8?Q?=3A?= Support writable filter* parameters of kunit module (rev2)
Message-ID: <dmwvmczxregptoifkjgyje2cramo5ztnzkkrcasz4mpnjhel6p@qwcz6rlu6gwi>
References: <20240131181156.80571-8-janusz.krzysztofik@linux.intel.com>
 <13441462.dW097sEU6C@jkrzyszt-mobl2.ger.corp.intel.com>
 <nxhntylt3u3lngtbcesailraw4xz2xosm54gu26fteycahj7tx@k67e2ylvjqwa>
 <2945385.o0KrE1Onz3@jkrzyszt-mobl2.ger.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <2945385.o0KrE1Onz3@jkrzyszt-mobl2.ger.corp.intel.com>
X-ClientProxiedBy: BYAPR05CA0024.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::37) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB6931:EE_
X-MS-Office365-Filtering-Correlation-Id: 978b4be0-dc7b-43e1-c2ca-08dc232ff956
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: X+hfB59JrtjDHYC6f/vgWFmRV4eSCMA9v7jZEwLw9hlZWpi5p5oIDQgYUog+zHUGpU5RqnzY1AVKqFaxhanTAunC8xzuEC8rD56hvt8QZAl5QcPPnHc469+05UKxkW54ahH48cwNCoHXi2qo70L0YNHgwmhuNbdFdO8LIbKfAZaFeo2a/ZgMdzNBlbPuBXvPtXdnzPFjSk8YIFq24IeT05l3UyReTa2DSvG5K1Qq5lF42f4VqMCQLZ6DtLwsOfuo3HVrJhZ4ur0DmBn9g03k1nX335yq0y7pa/n5sZCGCid8SLAX+UTtYr697evYm90ysJmV1KbTnjDyQKTllpaymmC7l3rx8zSaXahJ89KEVbccgfGqFTFOyOI3rI+US7V35BuBB9RYsV+wHbEkclbEkiOP2QE9BMn1VhpLlMVv2aJ+y2OPAV/Hk2VlrVC9+UsbkXYow6MQnjpJOIxzuQA8yGRMhmz6NVOo+812k+y96Yg7tXFghDWKgw7izAqjQUtM5pKPCFJLdClkadlXK2lPNnVvlgQgTHKOKuuTaqCJc/2BlSF9Dr1FKmhv0K2aq2p1pe8HtgatSZQtGr1SH88o7Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(396003)(39860400002)(376002)(136003)(366004)(346002)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(8936002)(6506007)(4326008)(26005)(9686003)(6512007)(33716001)(38100700002)(6486002)(316002)(6916009)(66476007)(66556008)(66946007)(83380400001)(5660300002)(82960400001)(2906002)(966005)(478600001)(86362001)(41300700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?v8kn4PR3d7JvKC9XnQkzmzJfqlus1gP/WykbTIoO0qUBGqvTvXD/A9JPLm4M?=
 =?us-ascii?Q?mGSBArXHR2CnjNL3kT7UqzjeXFxGUVTD5vBuI03OflwDEuz0dsp4frq+mj4H?=
 =?us-ascii?Q?x+khecpZvSbY4cYaVtN1WM6r2T6Zhwc7/4ev+8jSQgNv16FpDmsSCr2NpncC?=
 =?us-ascii?Q?5p6R7hxxAm9gsrRuSZIP3EfLVHMsd15sSkC3qkdLBA6uu0smBJ9t6nfJ3Puu?=
 =?us-ascii?Q?B7KaClgDiIoLl3X+iC6BODU0aIrLpBJ4ZJCUJrfQlbHz1rdOv65+Yf9E/x1b?=
 =?us-ascii?Q?WEuMlci2Xii0ZjU7PjTSuAH69sdqoPzvLLLSf8XMbiVsSONgm54mCVTyEfs2?=
 =?us-ascii?Q?Zwo41XgcEt2UuU9kPlrkLBj4yAVx0fDLYZveZpAgDI2Qp/T44ZxhkPlfUECL?=
 =?us-ascii?Q?BdOXWYW0G8VY1mUdpg9AOKxRnvYDR1HFW0rzewEaMvpqgk1SxYeG3dUvOdqR?=
 =?us-ascii?Q?utAmCavRKw1RpgA4KVPD5x1aWA7KZNBGW1LFfo8QnhLOfQv1ZSQZNUDXCM96?=
 =?us-ascii?Q?iRsrGCs2KUeLaigM/ZX8KzwPjeaW4ihqpoGH5hTBNuj1HbjFmLhUJy9WfgCe?=
 =?us-ascii?Q?aoV+pMrcm6CJi6vXZBXVkYxnObac7XgEn8aDCfEke40aJy0WnHYgUlGqMQe2?=
 =?us-ascii?Q?V3fm8w3jLgKQ41dPTy1Mn3VajvOu7vxVpZ1wM/78X7hh7FoPtjJOjiKBVrpx?=
 =?us-ascii?Q?9h4MifHN9N2aBMU49ltCZI4sueGaM7+Y3fFXNGZBgY0KBvvBwJzFsj/U8JkZ?=
 =?us-ascii?Q?MGlrtrX8S6PVvehwbw63Wao3WRHQVQHCrWMRZzMolrcZcMuUwpBPxCnc0rfj?=
 =?us-ascii?Q?fPP2wtVYAQQUVNnby6MKTQ0LzOIfHpjE2CL1D7U/0lIjvL8Vzy+04id2hI5V?=
 =?us-ascii?Q?S1eypm3qL50W1hkM7OJhGu5UpR+Sa3G2mJs6q5wCUrCmkvFCRVJ+vuq/Fvyh?=
 =?us-ascii?Q?evvKJBPAOW/EbC65OkoS4gOnkXILMQnuCkNdxVrDEPMdsxlRPgFCBysqyHhQ?=
 =?us-ascii?Q?J/zN6FM0EHRFfKsMdYJOFi2vJhdu+OyS7Ub8I1scW1hDmDaETOJ2iUOLifO/?=
 =?us-ascii?Q?PUilxaNhT/a++kc8pgLMfG97PibTHLYIsridGrK7mLnVEQfpELPO46eMoxVj?=
 =?us-ascii?Q?sl32PzkCnh93CYI2t2Wu+9qqpwstYn70mZ3b6F3iTyCeH7gXvOOOrZao7TDN?=
 =?us-ascii?Q?9ihmjQydlcPoB43ZvHL3xZV0iWsR6weLGtCP/7jb1IVi2QUtUxy9pwChi4kF?=
 =?us-ascii?Q?ckETRGSB1shxC66L7J3aRDbvQRrgW3QxW2ACdinq+i9jM0nAq3dDNeFVuBH/?=
 =?us-ascii?Q?cLEK3tIoqS3IqzQdLQ4iZxtY/lLr9Pe8/bq2iOu118Bu72RxCnZGT+9gDF/S?=
 =?us-ascii?Q?uBgiqZQD/LAXUPo0kcQ52q+TAoj1R3Skqm+k4bT+sskQBumAST574TkldMO2?=
 =?us-ascii?Q?TeMGER4dV376N9VKOe5hygl0Qj5nAgqdKy7bpc5AR3QzjQz4jGPrVkriyQjI?=
 =?us-ascii?Q?Ser0d4zf1DZvsTNzUKwlgS5PWBtZ60OhOUT16cboGZnBdqbqnKeHis5y8DQg?=
 =?us-ascii?Q?mOeEMmuYOsH9hIg3R/Tqq5ii8nxNoz938vZJOcD/10kRm3lTaw3vluuyb1ge?=
 =?us-ascii?Q?nA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 978b4be0-dc7b-43e1-c2ca-08dc232ff956
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2024 14:13:33.5262 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: svfBzDnVPKzrOBv3GwqWJ0jcI4BrNWjcGvNjHAlVdJ5XTxPQakArmYcNXKeqae0QAyGwF07JrvePvYrtGY+umj8GQz+PIb4+PtNksP0zAi0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6931
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

On Thu, Feb 01, 2024 at 12:06:35PM +0100, Janusz Krzysztofik wrote:
>On Wednesday, 31 January 2024 21:51:15 CET Lucas De Marchi wrote:
>> On Wed, Jan 31, 2024 at 08:22:35PM +0100, Janusz Krzysztofik wrote:
>> >On Wednesday, 31 January 2024 19:36:57 CET Patchwork wrote:
>> >> == Series Details ==
>> >>
>> >> Series: lib/kunit: Support writable filter* parameters of kunit module
>> >(rev2)
>> >> URL   : https://patchwork.freedesktop.org/series/129174/
>> >> State : failure
>> >>
>> >> == Summary ==
>> >>
>> >> CI Bug Log - changes from XEIGT_7699_BAT -> XEIGTPW_10613_BAT
>> >> ====================================================
>> >>
>> >> Summary
>> >> -------
>> >>
>> >>   **FAILURE**
>> >>
>> >>   Serious unknown changes coming with XEIGTPW_10613_BAT absolutely need to
>> >be
>> >>   verified manually.
>> >>
>> >>   If you think the reported changes have nothing to do with the changes
>> >>   introduced in XEIGTPW_10613_BAT, please notify your bug team (I915-ci-
>> >infra@lists.freedesktop.org) to allow them
>> >>   to document this new failure mode, which will reduce false positives in
>> >CI.
>> >>
>> >>
>> >>
>> >> Participating hosts (4 -> 4)
>> >> ------------------------------
>> >>
>> >>   No changes in participating hosts
>> >>
>> >> Possible new issues
>> >> -------------------
>> >>
>> >>   Here are the unknown changes that may have been introduced in
>> >XEIGTPW_10613_BAT:
>> >>
>> >> ### IGT changes ###
>> >>
>> >> #### Possible regressions ####
>> >>
>> >>   * igt@xe_live_ktest@bo:
>> >>     - bat-adlp-7:         [PASS][1] -> [SKIP][2] +2 other tests skip
>> >>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7699/bat-adlp-7/
>> >igt@xe_live_ktest@bo.html
>> >>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10613/bat-adlp-7/
>> >igt@xe_live_ktest@bo.html
>> >
>> >Hi Lucas,
>> >
>> >We've got an empty list of test cases because the current algorithm of IGT
>> >KUnit implementation expects subtest name provided via struct kunit_tests
>> >to be the same as name of a test suite provided by the KUnit test module.  As
>> >a special case, if the module provides only one test suite (most do) and the
>> >name of it is the same as the module name with the _test or _kunit suffix
>> >truncated (also the most common case) then subtest name may be omitted (i.e.,
>> >.name field may be NULL).
>> >
>> >I have to document the above, but we also have to use the same names on both
>> >sides (KUnit test module and its corresponding IGT test).  Now we don't, e.g.
>> >test suite named "xe_bo" is provided by xe_bo_test module while subtest name
>> >"bo" is specified for that module in IGT xe_live_ktest.
>>
>> in the end we want to have only one module: xe_live_test.ko and then
>> filter out by the testunit. From what I've seen previously in igt, it
>> would be a matter of always reloading the same module, but passing a
>> different name.
>
>As long as the module will provide several test suites, each of those test
>suites can be mapped to a separate subtest with the same name as the test
>suite, and with its test cases discovered and executed automatically by IGT as
>dynamic sub-subtests, still selectable individually via IGT --dynamic command
>line option.  For that to work this way, populating .name fields of the struct
>kunit_tests table with subtest names that are the same as test suite names is
>mandatory, otherwise IGT will expose one subtest, named after the module name,
>with dynamic sub-subtests named <suite_name>-<case_name>.

that's what I did when I submitted the module rename:
https://lore.kernel.org/igt-dev/20231205224926.2188996-1-lucas.demarchi@intel.com/

This one is to be applied on top of these fixes to kunit handling.

Lucas De Marchi
