Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EAD3C7618A
	for <intel-xe@archiver.kernel.org>; Fri, 17 Mar 2023 16:30:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE3B910E3DF;
	Fri, 17 Mar 2023 16:30:31 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9C7410E3DF
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Mar 2023 16:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679070629; x=1710606629;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=gU+5mw9xBnoW9ofggmQjJInbLA2UvrSmj6Re4WjtIA4=;
 b=BJ2o+gYy8XZgdzJAWPr9Seb3HIuVWWpyeBRrO4AycFoydDBXnzibjkDb
 Z2rI0maa/ocMLdw3v3GSwRDLh9DT5YrgllFiXMN2dcmv7zLmvWjK1rAJR
 bpJKMytcvVOniGobX2hhwZQ/tgGEckWEGSbncb3JNWgZIUsEEAhE7vAwY
 zltg0jRnaFWXajQ6M6MjFz+H6RqYlu5EwcF9ovM9l5JDsEK65tPyGu65k
 /CcC+TvZdHb9wzy0/58mX/0RB9xyVk2Kamv415ent1ZYR4q/E8MUWAJmC
 UIta8D38uHI6cIO4QUfrYCI7YKcfohXGQYDhVy/OVlcrDEdI3GCJ8B73t A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="340661587"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; d="scan'208";a="340661587"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2023 09:26:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="680332214"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; d="scan'208";a="680332214"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga002.jf.intel.com with ESMTP; 17 Mar 2023 09:26:24 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 17 Mar 2023 09:26:23 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Fri, 17 Mar 2023 09:26:23 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.172)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Fri, 17 Mar 2023 09:26:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VTtVoJ78rumNCfVmmy6Oz8dO8zhyJ66Vw6FQJgQj88J1lv3ZFpdqWiUvRcd1Fh9bHhRYeYnFRr1P2arpeCqv1ginRZZj6HhYPC/dyWeiwwrbMkf+lwlY8D0jsa/wmjuVrxYrzgy9dL+dWKi5iaArHAP6Ae+FtwVyITJU1KE3b4FNYXkJdB/+bXZZxA+B1fZWlclWFh67fJ0thHvxQUS+wvoYWVHA9IZrrlYzLLVSEYJStQuq3LtGM40VNtOpMyA5C68UI6lgGOW8TtPu/yd0ZIkdGVncl5b0pnndS1O10jwJr9+4Uq1MAd5H4hJy392ULMYuLSNoxg0KjHTpthcqAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J/e8mqKJSQ5B3A72uLC4ZucQqBy4LpWmFyQNO8zjZAg=;
 b=XVGTZkfPfeX9cEBWa8yap3lOA7RjBwSpJEod3OcFeswz4a0tLjxBXUvki01zqFYN1szw4CtXGEvgXshsbnbJ5Xw9j/wesUh9T7E+bB4dk4r8mOrdBhrj6TXmTx/f79eKGj1F56fQpRyyR+402LsqTYnx0TcZq6LWXhXtBUd4L861RP+lSPgEsvzFdcKFn/OXf9IdpGRQE1VlGzR71U+DaipWgDLlvEtJ9nNTooSyK+R0/AbxxGGBkKFUadqECZ4ov1KbPpj2qt1dBtt9QuZXzZXMwARv7x+UB02YmSc64eTPt3X8ZBACDrV9UiJHM6AmQSfIpHiagxuGCxdIFR1/sA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA3PR11MB7461.namprd11.prod.outlook.com (2603:10b6:806:319::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.35; Fri, 17 Mar
 2023 16:26:21 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745%4]) with mapi id 15.20.6178.035; Fri, 17 Mar 2023
 16:26:21 +0000
Date: Fri, 17 Mar 2023 09:26:15 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Message-ID: <20230317162615.cpumy762comdrgzc@ldmartin-desk2.jf.intel.com>
X-Patchwork-Hint: comment
References: <20230313081316.2408-1-michal.wajdeczko@intel.com>
 <20230313081316.2408-2-michal.wajdeczko@intel.com>
 <20230313162348.s3cle2rpnvtgh6yk@ldmartin-desk2.lan>
 <f7483e45-d145-4e32-64b8-ea921b3ae393@intel.com>
 <20230316064643.fu5thzu4pf7htisq@ldmartin-desk2.lan>
 <b411541a-b357-14f7-e193-f8cbb2e31b4a@linux.intel.com>
 <20230317152936.2ca5ae1a@maurocar-mobl2>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230317152936.2ca5ae1a@maurocar-mobl2>
X-ClientProxiedBy: SJ0PR03CA0095.namprd03.prod.outlook.com
 (2603:10b6:a03:333::10) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA3PR11MB7461:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c6a9c3b-f974-43c7-9dce-08db27045795
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: m0MVSppFN9ZJOyIOfLJf9F0PTIkx997PFVyqoYizt5gxzGozrtBpQKPnMq/X22qtIYsrSekrHLj+wR8CcbkA2uc5z9roWrnGodRkRpIfjq6tKP+arPOYngTwoZj8w2yhVHD/YXU6jR47G8ay29DtGRSzFGKShQpcVN+XRecOQgkOGV6b2Dw5BMs9a1gDzHlBRGfXjCsRMNmu/TrivPQjMMnkT3KENHeEMwCNPTIAoEtXVQLo7ct+wD8Cjb6+xQaxGjabffphK2Qr0ipBPzBy1onQqfjDb92sdbU6NAbKX9+QpS3DUzqnuKdwAgJ2FK0Ur9Adwzuv2uQiEEjZz8EddKPTWkgWVdgyk2VWZftOsJtddBj9o9z1eGwQW7h0hDTqAerIYVue4Kc2cbWcYF5sC6fq5Dqou8rBBYDdTry3+CCFXvt+kHJtVJhrhPOXcCr60y58Cjo7zzhS0ND5ALLZAZJzLJ1sW260YYiBS+sCMokdiNBqku+R+12+GdP8f1ADGfVh1cV+neGjH+5DPTwYndxuWRbMSz2uQuZSlIE2TW/ax9qavhTlK87h+nSLvMFd3jrQdzvwBdQ70zLpYI7RHYVklyfHuToXpNsZi2vvIz3tV0eEQt/xBhjI2dUaUUKb
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(346002)(366004)(39860400002)(376002)(136003)(451199018)(2906002)(66574015)(5660300002)(38100700002)(86362001)(82960400001)(83380400001)(54906003)(66476007)(316002)(6486002)(6916009)(66556008)(4326008)(66946007)(8676002)(6666004)(478600001)(1076003)(26005)(6512007)(6506007)(8936002)(41300700001)(53546011)(186003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?zj2EGw+lRxelEQxpu/fzB0ICh6kzA4wtofGt1I4tz04NDk4CVFn7vYD+Hi?=
 =?iso-8859-1?Q?s8WEwnvFb8dUD6NIXx+DILoz/SoA6D9ZbDy0kIv9s8ipuysAlqP/zYR3f/?=
 =?iso-8859-1?Q?6NAjNK8JVFl0R7MwRSwfgY5TycBwE+Hqq6ESgHVQzeFmXDti+4/S7aNFIg?=
 =?iso-8859-1?Q?Su9b8cuBvQJ4eLKkpZiNiYWVDLZrFdzBMSq475UBxUx7Muq3dKi69iKlZ5?=
 =?iso-8859-1?Q?yQSmJoCWR+XSuSncK2QOgdqWZWIOmhUCBNOkA9lXbomVKh6W4YFLp8imee?=
 =?iso-8859-1?Q?k+e7gHmOCWja1nMMHqavo4qohSEA9EZTwPrVlMFlJTsZChWkEU4DOU6cKp?=
 =?iso-8859-1?Q?zpkVOv2h1zTnQmGeYeLOHGRwcnvTmUejPF2ZZaZFApRMBl5CxtZr7LYFhL?=
 =?iso-8859-1?Q?KZQ3Iu8nq1EcyBOReRSks08fgQ8MBfcE56NguLDfzQxMsIQa0jrgskspzQ?=
 =?iso-8859-1?Q?VNV3za84utCfFEUR9NWUsB9gcj1mEhtifDtUD/8FklA+edeAxR/ctxNPFJ?=
 =?iso-8859-1?Q?xmEc1uJOwsCeBgWNRgLEQYubmZOwSUbUmbFmK9kAG84hq/CeivZ5OwhsJI?=
 =?iso-8859-1?Q?RaGSQ8+JBUxCC219qzWQng3d7d5HPKGq0BZ7tGv4qJHp9XP4iYf71pDw1o?=
 =?iso-8859-1?Q?g29wTpmzGIoSZnTgC686Dp1oLlPurwyZ2hMNCMzsQ3QYzLRD7jUMdOg8DC?=
 =?iso-8859-1?Q?OUCR4Hz4tVdU/R+hczwjJQQXi4YrqlD5xaL0GFZiMTp9AXM+O93PxxtlJd?=
 =?iso-8859-1?Q?wZQeJE6qMYFRmuA2mbH35OG/Ss+hI1zfO08QxgsgYb/5ZxZ5pSPIAuBfBt?=
 =?iso-8859-1?Q?AXbg0lNh0gKv0DukehL5REDLRYxzd1HURmdCh6c4hovKAFy3Siq8BIEEHg?=
 =?iso-8859-1?Q?tCt1YC+zuOK5nc/Wh8yNp7mA8PG5cb74UWh0giu/u1dr5dxabbe3W77vYk?=
 =?iso-8859-1?Q?klL61k3u0RClV3jvvcpJAf5R9hdqHiSifjaULrLq/e730qomTSmAnuHl+a?=
 =?iso-8859-1?Q?K60+kfa02HAd3QvAd/5BP75Qff3HbCB1A/8UFjFUhE6V9JUtg/ZrNHpkhB?=
 =?iso-8859-1?Q?8ksZ/wtjuUNhv86Ppukd/nH1iFf4Hz/G4a3R7vE3sm+DCCIKka1XxL+Rte?=
 =?iso-8859-1?Q?PK1EPmr/mboVMmOxmiTGC8LiNGD6IhLDRYeWhAMAIeiVoX0+HT8VZxvgFH?=
 =?iso-8859-1?Q?jOwZThpI5RdxCS4tX8p0/OIUYHQ4pjhU4n18z67xdase7V3k9IQCI5Kih7?=
 =?iso-8859-1?Q?s7zV0a4SledeQzR9Hi+bvy0Q8bRAc4xbOoOIbvbN+BufaTpMLJmFyPeQ/7?=
 =?iso-8859-1?Q?dfOQYaAd5ebq9VNWHj/XCX+T5f4Wjwa5+MMWWS4VYsbZqnZ9jHcWNeMNDJ?=
 =?iso-8859-1?Q?sEQMnRdQOZtsj3oWAqWIcL1kMTxGKZ1sppODfBnob0fZ7J2taVel6j64bt?=
 =?iso-8859-1?Q?9mb4IObho4qfuVL+ptnG6RccX117u/CcsoIfhl0ufMPF1UDA/P9hNn3i9z?=
 =?iso-8859-1?Q?+d0jDloMxGkTe5RN7DqIWHR+UsMZr7IfpdOL3VVezP3qcy+aDV3gptjauc?=
 =?iso-8859-1?Q?XVME1Axcx/t0HdLyzKABA3fsZvjml9zVMOA2TWxYrX96HGpSPnmCfXUkeY?=
 =?iso-8859-1?Q?Lw6mqJ47Q1ZA1vczMMINin0p/DsmVx56Nwxk3+3Gzm6xGFZfyCiZ/EeA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c6a9c3b-f974-43c7-9dce-08db27045795
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2023 16:26:20.8656 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ajEcx8M6ud+7QD8aFfonjWP+2I54VSO9WUkhaWzKuzBfCDhveEa/Iv5r7Fx7+EHzZmyo9Kj5fHdmVLHFlyCCXQXAO4Oc8GDor+Aepf/ww+o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7461
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/5] drm/xe: Introduce new selftests framework
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
Cc: Luis Chamberlain <mcgrof@kernel.org>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Mar 17, 2023 at 03:29:36PM +0100, Mauro Carvalho Chehab wrote:
>On Fri, 17 Mar 2023 08:20:46 +0100
>Thomas Hellström <thomas.hellstrom@linux.intel.com> wrote:
>
>> Hi,
>>
>> On 3/16/23 07:46, Lucas De Marchi wrote:
>> > On Mon, Mar 13, 2023 at 07:18:34PM +0100, Michal Wajdeczko wrote:
>> >>
>> >>
>> >> On 13.03.2023 17:23, Lucas De Marchi wrote:
>> >>> On Mon, Mar 13, 2023 at 09:13:12AM +0100, Michal Wajdeczko wrote:
>> >>>> Our initial attempt to run Kunit based tests on live devices is hard
>> >>>> to use and will not work well with multiple devices attached.
>> >>>>
>> >>>> Instead of relying on separate test module and duplicating support
>> >>>> for multiple live devices in every test entry point, create new set
>> >>>> of helpers and use test->priv to pass reference of the device under
>> >>>> test (DUT) directly to every test function.
>> >>>>
>> >>>> The same use pattern is supported for both mock and live selftests.
>> >>>>
>> >>>> By using bus_notifier we can start testing each new bound device
>> >>>> separatelly, subject to filtering using dut_filter modparam.
>> >>>>
>> >>>> All test cases can be included directly from .c file, allowing test
>> >>>> code to access and use any private functions.
>> >>>>
>> >>>> As Kunit will attempt to run all suites on module load, including
>> >>>> our new live test suites, we may want to allow to execute them on
>> >>>> any available device. This is controlled by anonymous_dut modparam.
>> >>>>
>> >>>> Support for either mock or live selftests, only one at time, is
>> >>>> controlled by new Kconfig options.
>> >>>>
>> >>>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> >>>> ---
>> >>>> drivers/gpu/drm/xe/Kconfig.debug              |  22 ++++
>> >>>> drivers/gpu/drm/xe/Makefile                   |  11 ++
>> >>>> drivers/gpu/drm/xe/selftests/xe_selftests.h   |  35 ++++++
>> >>>> .../gpu/drm/xe/selftests/xe_selftests_auto.c  |  46 +++++++
>> >>>> .../drm/xe/selftests/xe_selftests_executor.c  | 118 ++++++++++++++++++
>> >>>> .../drm/xe/selftests/xe_selftests_helpers.c   | 101 +++++++++++++++
>> >>>> .../drm/xe/selftests/xe_selftests_internal.h  |  22 ++++
>> >>>> .../gpu/drm/xe/selftests/xe_selftests_mock.c  |  32 +++++
>> >>>> .../drm/xe/selftests/xe_selftests_params.c    |  23 ++++
>> >>>> drivers/gpu/drm/xe/xe_module.c                |   2 +
>> >>>> 10 files changed, 412 insertions(+)
>> >>>> create mode 100644 drivers/gpu/drm/xe/selftests/xe_selftests.h
>> >>>> create mode 100644 drivers/gpu/drm/xe/selftests/xe_selftests_auto.c
>> >>>> create mode 100644
>> >>>> drivers/gpu/drm/xe/selftests/xe_selftests_executor.c
>> >>>> create mode 100644 drivers/gpu/drm/xe/selftests/xe_selftests_helpers.c
>> >>>> create mode 100644
>> >>>> drivers/gpu/drm/xe/selftests/xe_selftests_internal.h
>> >>>> create mode 100644 drivers/gpu/drm/xe/selftests/xe_selftests_mock.c
>> >>>> create mode 100644 drivers/gpu/drm/xe/selftests/xe_selftests_params.c
>> >>>>
>> >>>> diff --git a/drivers/gpu/drm/xe/Kconfig.debug
>> >>>> b/drivers/gpu/drm/xe/Kconfig.debug
>> >>>> index 93b284cdd0a2..aeba43977dca 100644
>> >>>> --- a/drivers/gpu/drm/xe/Kconfig.debug
>> >>>> +++ b/drivers/gpu/drm/xe/Kconfig.debug
>> >>>> @@ -61,6 +61,28 @@ config DRM_XE_SIMPLE_ERROR_CAPTURE
>> >>>>
>> >>>>       If in doubt, say "N".
>> >>>>
>> >>>> +config DRM_XE_SELFTESTS_MOCK
>> >>>> +    bool "Mock selftests for Xe" if !KUNIT_ALL_TESTS
>> >>>> +    depends on DRM_XE && KUNIT
>> >>>> +    default KUNIT_ALL_TESTS
>> >>>> +    help
>> >>>> +        Choose this option to allow the driver to perform mock
>> >>>> +        selftests based on the Kunit framework.
>> >>>> +
>> >>>> +        Recommended for driver developers only.
>> >>>> +        If in doubt, say "N".
>> >>>> +
>> >>>> +config DRM_XE_SELFTESTS_LIVE
>> >>>> +    bool "Live selftests for Xe" if !DRM_XE_SELFTESTS_MOCK
>> >>>
>> >>> why?  I think we should aim to run live tests in *addition* to
>> >>> mock ones.  The mock tests are more testing our SW infra and can be
>> >>> used
>> >>> in a true "unit test" sense. While the live ones are testing the
>> >>> integration with the HW and making sure they work together.
>> >>
>> >> I've added that just to simplify the code logic as I assumed we will be
>> >> running mock tests only in "true kunit" fashion as part of the build.
>> >>
>> >> So then we could avoid mixing mock/live "kunit suites" in single driver
>> >> module, especially that as of today there is no nice support to filter
>> >> out undesired suites from the execution. Thus adding compile time flag
>> >> to only have one category of selftests at time was looking promising.
>> >
>> > I'm using this in the patches I'm sending to unit test rtp and wa parts:
>> >
>> >     ./tools/testing/kunit/kunit.py run --raw_output  \
>> >                 --kunitconfig drivers/gpu/drm/xe/.kunitconfig xe_rtp
>> >
>> >>
>> >> So I was using .kunitconfig with
>> >>     CONFIG_DRM_XE_SELFTESTS_MOCK=y
>> >> and normal .config with
>> >>     CONFIG_DRM_XE_SELFTESTS_LIVE=y
>> >>
>> >>>
>> >>> I have changes pending to test some WA and RTP infra we added,
>> >>> regardless of the HW. But I don't want to have to choose either one or
>> >>> the other.
>> >>
>> >> And I guess you still can do that, just it wont be automatically
>> >> compiled out, nor you be able to benefit from the helpers, but they will
>> >> be executed
>> >>
>> >>>
>> >>> Also Cc Thomas as original author of the kunit integration.
>> >>>
>> >>> We also have some overloaded terms that need better explanation:
>> >>> mock, selftest, live.
>> >>
>> >> I reused terms from i915, assumed everyone is familiar with that.
>> >>
>> >> "mock selftest" - a kunit test suite to be run on abstract xe device
>> >> "live selftest" - a kunit test suite to be executed on real xe device
>> >
>> > Things I like on the current kunit integration we have in xe:
>> >
>> >     1) The ability to move unit test code out to a separate module
>> >     2) Not having a big infra that is xe-only
>> >     3) Share terminology with the rest of drm subsystem
>> >
>> > This patch series is basically killing (1) and (3). And for (2) it seems
>> > to be heading another direction.  Looking at the current available
>> > drivers,  I think we should be more like the drm tests and the vc4 tests
>> > rather than the i915 ones.  If we need more helpers we may probably
>> > extend the ones in DRM_KUNIT_TEST_HELPERS
>> >
>> > I'd love to hear others' opinions though.
>>
>> I basically agree with Lucas here. Some points:
>>
>>   * For mock selftests IMO we don't need anything on top of what we
>>     already have, except perhaps consolidate initialization of a mock
>>     device as a helper each test can optionally use.  I think, though,
>>     that Mauro's suggestion of coalescing multiple mock tests together
>>     in a single separate kernel module with multiple test suites to
>>     avoid too many separate kernel module might be worth considering if
>>     needed.
>
>IMO there's one important feature here that it is missing upstream:
>support for filtering out KUnit tests.
>
>Yet, the patch is adding it inside Xe. The right solution is, IMO, to
>add support as much as possible inside the KUnit core and having
>additional variables inside the module(s) implementing KUnit to setup
>such filters.
>
>This is more important for live selftests, but having this also for
>mock won't hurt

I'm always filtering the tests I run with:

	./tools/testing/kunit/kunit.py run  \
		--kunitconfig drivers/gpu/drm/xe/.kunitconfig \
		xe_rtp

so it only runs the xe_rtp tests I added. What am I missing?
Missing the filter for the device, I'd agree we'd need to add, but I
don't understand what support for filtering kunit tests you 2 are
talking about. From the script's help:

	positional arguments:
	  filter_glob           Filter which KUnit test suites/tests run
	  			at boot-time, e.g. list* or list*.*del_test

there is also this that might be useful:

   --run_isolated {suite,test} If set, boot the kernel for each
			      individual suite/test. This is can be useful for debugging a
			      on-hermetic test, one that might pass/fail based on what ran before
			      it.

... particularly if we integrate running the kunit tests, even for
"live" tests under qemu.  That has a higher setup cost, but could save
us some headache with tests crashing the kernel.

linux-modules recently started using kdevops
(https://github.com/mcgrof/kdevops) for testing. I didn't have time yet
to give it a deeper look yet, but it's something we could think about.
Adding Luis here. Maybe he has more input on this. Or a demo recorded he
can point to.

thanks
Lucas De Marchi


>
>>   * For live selftests it seems like where the big disconnect is. I
>>     still believe that we should have separate modules, and depending on
>>     how the IGT runner end up working have enough information in that
>>     module for IGT to execute the tests with the --run-subtest and
>>     --dynamic-subtest options.
>
>KUnit patch series is currently in rev. 5. It sounds almost ready for
>being merged. In any case, to properly support dynamic subtests, we
>need filtering capabilities. Once the filters get added, having multiple
>test suites on the same module or on different modules won't make any
>difference for IGT.
>
>Regards,
>Mauro
