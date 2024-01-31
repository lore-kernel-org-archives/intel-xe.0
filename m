Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C070CC47258
	for <intel-xe@archiver.kernel.org>; Wed, 31 Jan 2024 20:51:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 856F610FD05;
	Wed, 31 Jan 2024 20:51:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 177DD10FCF8;
 Wed, 31 Jan 2024 20:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706734283; x=1738270283;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=X9sAiJvQBM/TpGyPVRbQPAzUQL9C+wkOkMQOfb2Xkyo=;
 b=RS8tKkhE352GCIKVYEjp0aOypPMSA8uT+3NoQyv0a8MRbuxDWjUUYv8N
 75vuVIhsxxF4CHk9KWLH8xvAORwIFxkuKSye3gZUg9okvTCMVlY330hXH
 MUVaWb4fJpJE4aXosgN0AEARQ3s+43CrrKUAcD5Yx8KI7HqvrSSw3DRS0
 1lOUULgUqCMpixxwm0h2xWJmxmJUcE5G9xEBRXRHefTzB9rX6AeFt3u9E
 EPwDF37O5pt/PssiY9dUHhC4OrJPE1VwowP6tOYbf5nmyPw0Dv9r3UeGc
 FwpH6/hegjPteDuPKWxNxghtSAMb0pPVGiNkXEAklsetzuFszPDGbPZXz Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="11094562"
X-IronPort-AV: E=Sophos;i="6.05,233,1701158400"; d="scan'208";a="11094562"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2024 12:51:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,233,1701158400"; d="scan'208";a="36995452"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Jan 2024 12:51:22 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 31 Jan 2024 12:51:21 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 31 Jan 2024 12:51:20 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 31 Jan 2024 12:51:20 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 31 Jan 2024 12:51:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VkVyK8RGFJQqt4OXTf6kFD9PVBl58H+yC+sLjNqjhFgbN7obQFFXyDnux8clGrAONaV4tXLitph+1fyTFbHeBWxH7MDtdVQbcb8DVAiGn5YtoXIo+pWShiMZ6Nc2mIGsxaIjIKb/KxjQsfr3lsEk8oGXKvuy6Y3qEGbtsP879X3X9/Cvn5JJ9dtf7lOX+eo+50pCYoCY7fCMQc+rxUyC5QIyhH9oHRQuXfp8DLwjHym0HRcllryIXWSiIeivJo4SirgO3psKhRVGJjiGHKnjp5HDgnfXRBb5WPJ1LpSm3S30ARsbIcRfPU8IoF+uTcs8H3VfObpFSpVE0fZcrhwQ5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=51F/8xS7tt9t9uhIkc8EAAiah5g+UO+BjgEflPzg2FY=;
 b=fLlAfMpNXaIxoUdTzzI4lAQspAL0FbihfQqjmM60963o022wpJ9GzgmVlayGZPaNVErtVFXB94ioxr7QlOUm/TvY3xilri/0eoc8EPICduDsrMbKmMi49JROSCVEPW19lBO31WmLw4w/H1PDxWFTDoDwaWXdnvYphCnVlHklp5MrdsACOCuid3GNUlHQQEeMVR8y4UcjnhYsh7Ed70ZhetjD/b0aPQs5efWPOw4fCWfQMHpf1dNdTbZUMEZwnNaYA2DvVVhfX++wlXJXlBKWP7hPN2/3RmGIl6uosaUVH4Ir64bKoVsXoI3Yfs4E0K7k9If2qotrtUYppm0jx7oXKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ0PR11MB5631.namprd11.prod.outlook.com (2603:10b6:a03:3ae::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.22; Wed, 31 Jan
 2024 20:51:17 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954%7]) with mapi id 15.20.7228.029; Wed, 31 Jan 2024
 20:51:17 +0000
Date: Wed, 31 Jan 2024 14:51:15 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Subject: Re: Re: =?utf-8?Q?=E2=9C=97_CI=2ExeBAT=3A_failure_for_lib=2Fkunit?=
 =?utf-8?Q?=3A?= Support writable filter* parameters of kunit module (rev2)
Message-ID: <nxhntylt3u3lngtbcesailraw4xz2xosm54gu26fteycahj7tx@k67e2ylvjqwa>
References: <20240131181156.80571-8-janusz.krzysztofik@linux.intel.com>
 <170672621780.878359.16320506199099182638@5338d5abeb45>
 <13441462.dW097sEU6C@jkrzyszt-mobl2.ger.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <13441462.dW097sEU6C@jkrzyszt-mobl2.ger.corp.intel.com>
X-ClientProxiedBy: BYAPR08CA0045.namprd08.prod.outlook.com
 (2603:10b6:a03:117::22) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ0PR11MB5631:EE_
X-MS-Office365-Filtering-Correlation-Id: abb61c5d-ef1a-49d7-054c-08dc229e5f14
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 822WX6WDV6wYa+wmem2d5uJH2lcSyS+e0Atk4sqI+E3WlJohuLW+eVhO4Qasw2pAcTgeUmmOoy8MVBE1eDkjsidLXffPBE4npOdtXRI/Yaajw0QgJJ58V2es3sy/YlW+mJTYEo18p8fFAvsbnQqStX1YpcujaKAc3l9EykAyNBMvwkpmiZHwC9WQd3tLze5r7OkqbJxhaPopzPTYMlQ4RtJEPnBtTfrmMyCZGHFaK/0XsrnEmX/1wI0N3AJv3UMV86X8dlOtK6NHEqjhw8TumAeCwpOYCOW6fR1qh70L2HTR3V0+Ue3T017hzeHk7zMsYiKI8UkLDoiu1lM0nOE8kX+LEbp6rasb5v3znp028z/qak02lv4t5oGudYdPZoM0gL90HIjAUnPKZsgbjDzAZwWAfo9pSLRle1X+ySos4pf3Lru3XwoNGhFMz2VLdUHME+xqnmqx5WE4QWJMLSpXW/MlqlrGqswogd8gZYFNsDsL/602wFQ+UWOCNpgdDcDl2zWH4cXXgSVBVBJgsbiQd4PxvI51AufjIKICl1vnCMjDHdfSaD2/hPdjUzeAAXQF3zodH1ucEBuZpAr8L5IYvw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(376002)(396003)(136003)(39860400002)(346002)(366004)(230922051799003)(451199024)(64100799003)(1800799012)(186009)(316002)(8936002)(4326008)(5660300002)(86362001)(66946007)(2906002)(66476007)(6916009)(66556008)(966005)(6486002)(82960400001)(38100700002)(6512007)(6506007)(9686003)(83380400001)(478600001)(26005)(41300700001)(33716001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/KMz17WxcLsLM7x9FerVIznNeh7tHKBCKyD+FooU4/M5A+mkuY+4NfTeOV/k?=
 =?us-ascii?Q?mBaAlkY4R+S4b1r6ASVkohh/4BURpmTSdsmgdZgJZCMmeHiqgDIEbzubAqtp?=
 =?us-ascii?Q?2TJ604Ui7vpJCNInS4tjs7AOBQMc3GpQakMQaWoGcw9K8YViR85Mo12mb26h?=
 =?us-ascii?Q?7e9I6XjHLXJeb9DQ2dG3dcblHlDBMGsqBLT3sFCQfVyP+gjVuZEd0aN9+JnD?=
 =?us-ascii?Q?+7Y2kbVY+9yStzGgCdaas6UHsj7mlwckAvxrRPlamA6VnqdQhuGUIEoeScK4?=
 =?us-ascii?Q?VmkGeLhaxqN5gAhNf7A3KrM+8NJOB3I9onmjpXKwhj//Yoer1URHF5Vlf74k?=
 =?us-ascii?Q?QWm2QCUgJUnnnLseallPsgsQ/cAF1VM5CyWgUIcQlewb6gBZ9axjkD3RY3ZO?=
 =?us-ascii?Q?Hpg3dITa0aK+Qntt7MRFvOCQqzQmo2sUK84LiUEQ2kug4MWno2nh1qp4J0J8?=
 =?us-ascii?Q?IVxUkgUsqHLnp/RCtp8JfA9eX4NbDiBo7B9rQY3411oDD+2pdL2uMJNDpezm?=
 =?us-ascii?Q?5mPgQm/E2mpcdxCmRkN+JAJf82j4bQ1fwb2P5bvMvsbuuR/JZdwtAZ9H+XHk?=
 =?us-ascii?Q?cOE6keZUfqSIKQLD+gx0S2r33DpcXBDnkJ9qiBogi8eBVEi6FiHwUVWgDDdW?=
 =?us-ascii?Q?cb950+ymFVkCegI2z378MElQL5CpXTYqQ0JfH04U8V5agvKkSonAscmmNOBE?=
 =?us-ascii?Q?lno1u2mXkf7bPULDYB3TuOU3HM9tZpBnQLFhbA8xpWBNmV67tWGa26dgGR00?=
 =?us-ascii?Q?J+gEAK0VKXBd9tcKGxrh4/M1CTf3kDN3fiwcarxlOzWpGP/o1YreFs0wVXuH?=
 =?us-ascii?Q?mD/jStQff8lWBZLc4jag1eJQ8XjGSLw1JN0iBMeh3h+8/A1Cssm0AaR7Qjs2?=
 =?us-ascii?Q?ijPvboqM743gMa2EOafXW9FDQZiZiRjdTpX/vBG8E46ONjM8kOtFJD8o7h/6?=
 =?us-ascii?Q?kMl1zhbNVhPw3xXE6OmNUQXFMLYBa1lPxwRX9LTQaZvIzPpBc6cDasrlSOlO?=
 =?us-ascii?Q?ebi9gGTiSQSNsz+G2YrlGKr74sLFI6or9YTgwuBZ7GhaFsWaWskAf6kWp0Ue?=
 =?us-ascii?Q?/R+asCBijWe6ZfNkI37fNaDyUAFafRyh+C5DzOZjgvYgGBmfVSYAuFIB+8UJ?=
 =?us-ascii?Q?vGDU4GWD47fU1oYXV6ZVelRuEAsMuCzKERxyGjhBG1B5kGqp0s7tTJ+vLHwr?=
 =?us-ascii?Q?D8W7z53jbWqxEE2OjEaR6j9sH+yzlX27o07wYmOBmk99NNW0cl3e7zTaRfKT?=
 =?us-ascii?Q?lRZjN269HQi2g4LNbbf7qss03zISxtYPMFJhGZ++MjQPUix7fVZ1VWQCPz+V?=
 =?us-ascii?Q?+b66FWdB5InHSIjvEUPppj7TP+/W7qgAINMLvuYouCBNdGwsGIBMgpvcyfRA?=
 =?us-ascii?Q?GB4jR9ilKBtdlSdp4msSHtn5J3Hu+zLrHgapxxuzYbNbj+wwC9FpaPoj5pO1?=
 =?us-ascii?Q?HUa5/7rgkbLxbJHWdO5AlfvhAHh0tuCohiSiNz6vVMgnrSalpi+cUwAWaO0q?=
 =?us-ascii?Q?nFgIs6nxqEAk3VKGUkV5XryxG7IIva6ySdE/JpUIICY3scIhHYSIOdG84fED?=
 =?us-ascii?Q?cgV2lNq6wzH0/qKWNhbvV2ISpZf15MIuGoIWz4ZBJRXRDgEuXGS2vjzJQQ0a?=
 =?us-ascii?Q?2Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: abb61c5d-ef1a-49d7-054c-08dc229e5f14
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2024 20:51:17.6472 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hi9555SNXrd5AxaduvpYfyDXtTZwCntQ80MFMyVuautFAzS00RQwrJO2u9gJ1czzWCM1/Fo8OxzoUsFDKCKo2zmNXD0pWwX3KcJUAA47hKA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5631
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
Cc: igt-dev@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Jan 31, 2024 at 08:22:35PM +0100, Janusz Krzysztofik wrote:
>On Wednesday, 31 January 2024 19:36:57 CET Patchwork wrote:
>> == Series Details ==
>>
>> Series: lib/kunit: Support writable filter* parameters of kunit module
>(rev2)
>> URL   : https://patchwork.freedesktop.org/series/129174/
>> State : failure
>>
>> == Summary ==
>>
>> CI Bug Log - changes from XEIGT_7699_BAT -> XEIGTPW_10613_BAT
>> ====================================================
>>
>> Summary
>> -------
>>
>>   **FAILURE**
>>
>>   Serious unknown changes coming with XEIGTPW_10613_BAT absolutely need to
>be
>>   verified manually.
>>
>>   If you think the reported changes have nothing to do with the changes
>>   introduced in XEIGTPW_10613_BAT, please notify your bug team (I915-ci-
>infra@lists.freedesktop.org) to allow them
>>   to document this new failure mode, which will reduce false positives in
>CI.
>>
>>
>>
>> Participating hosts (4 -> 4)
>> ------------------------------
>>
>>   No changes in participating hosts
>>
>> Possible new issues
>> -------------------
>>
>>   Here are the unknown changes that may have been introduced in
>XEIGTPW_10613_BAT:
>>
>> ### IGT changes ###
>>
>> #### Possible regressions ####
>>
>>   * igt@xe_live_ktest@bo:
>>     - bat-adlp-7:         [PASS][1] -> [SKIP][2] +2 other tests skip
>>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7699/bat-adlp-7/
>igt@xe_live_ktest@bo.html
>>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10613/bat-adlp-7/
>igt@xe_live_ktest@bo.html
>
>Hi Lucas,
>
>We've got an empty list of test cases because the current algorithm of IGT
>KUnit implementation expects subtest name provided via struct kunit_tests
>to be the same as name of a test suite provided by the KUnit test module.  As
>a special case, if the module provides only one test suite (most do) and the
>name of it is the same as the module name with the _test or _kunit suffix
>truncated (also the most common case) then subtest name may be omitted (i.e.,
>.name field may be NULL).
>
>I have to document the above, but we also have to use the same names on both
>sides (KUnit test module and its corresponding IGT test).  Now we don't, e.g.
>test suite named "xe_bo" is provided by xe_bo_test module while subtest name
>"bo" is specified for that module in IGT xe_live_ktest.

in the end we want to have only one module: xe_live_test.ko and then
filter out by the testunit. From what I've seen previously in igt, it
would be a matter of always reloading the same module, but passing a
different name.

Lucas De Marchi
