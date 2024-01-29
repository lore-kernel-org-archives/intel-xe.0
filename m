Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B9FFC47DDB
	for <intel-xe@archiver.kernel.org>; Mon, 29 Jan 2024 16:04:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4548F10F6C7;
	Mon, 29 Jan 2024 16:04:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D532610E3B3;
 Mon, 29 Jan 2024 16:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706544298; x=1738080298;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=lW1kb3eaHt3Tq/rJPZSFwr3pNtYdihRX8yPQOunyF9w=;
 b=GgIqoJ4NAbBsPeHfi227Re2sfYSZXmgCcugatJYwJgt25fLsxvg0ivXM
 V//4KalvxemCCvGr2jHv++LLto0GRAvm+Cet97E4x6oSTWXNzCSy8vmmv
 ybNj4WN9df4vL9JwiaK0hUdGS8FmMp1WAabAKEFB/euljP1FLiP0jfhvr
 yWB3gnXZRFdwU3d4duGjhOeoQSJDT5EUIeqeFWiLG1eDEN1x8ec52F+6I
 pA3rukImf+MDRCdPhsEPt/3rG/yA+Q4odcCse1e/P+O2uYFI+8vB21YDz
 7/rwI7RhBQHV/QD/V/zO4LfBgL3g/YtdktVBEpivbsDKVJ/LsGirxj2s3 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="10103770"
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; d="scan'208";a="10103770"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2024 08:04:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="787880350"
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; d="scan'208";a="787880350"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Jan 2024 08:04:54 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 29 Jan 2024 08:04:54 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 29 Jan 2024 08:04:54 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 29 Jan 2024 08:04:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WryEfwRVDVK7xZac/NW1gc2zPxdm9wORy05YxBTMhwzxwYCCeBltW3sD0yJMRejJ3fgxgHipKbmWpwWCh5AF/I2uPz+5PrmwChDqzsnpNPl4u3Z6+1G+2yDz9dqCAClPKJtYqWmex8wlwjFeeRXguGm4hO5MdugIe43oSHIRb7Zlu6zJsedOvFXguFYJd4hfy/QU/BtBdhREJNokZwi44882cTkWPnb+ZRpYOZr0VfXN/Mw/fJkbGH7uYQb2+nwxcvnJh4w2mCMIkDTbZSnJMDLwpIjlGOXvZiaq2WBOTtrCgKTHJxWSF3nWn1OL6ChhC8kIBNWhQno03A+YqnU2lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S6cmyBduKOPkGuLke1INP5XBzdO5vTeZmJkJcv/WBzo=;
 b=SxiWVWTvEUG4UAci4RmnMclebD1LYSpcwhPIxyaybupQKEOJ+HZMd7t2BMar5ovQ+XTSoiQ4ETlQPqupgojYu2nl4LObPdhQkxTih/wUnLfJ/POk+pVRHxbYTR9v0wpkC45O6Zmvce83K9fJMs3kEcg1FvCbaQz+/ZUo+m3qyXP99NShGE5IxOoQ9Ueebe7swo0Ok1AsW6gMU/Ly7tcvdUgRfBvOWDh2NBKEZNZ4fOjbZYx6XMmCGZhnzLyxZ5P0bm+f+69O/s3roHzys9DkuTXHa7Vv+klvfk/dfyyOu1o5Jqv5Y5gYBF/3u806cuo3242wD/fcClNoKA60cAHU4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SN7PR11MB7706.namprd11.prod.outlook.com (2603:10b6:806:32c::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.22; Mon, 29 Jan
 2024 16:04:51 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954%7]) with mapi id 15.20.7228.029; Mon, 29 Jan 2024
 16:04:51 +0000
Date: Mon, 29 Jan 2024 10:04:49 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Subject: Re: Re: [PATCH i-g-t 0/3] lib/kunit: Support writable filter*
 parameters of kunit module
Message-ID: <6soh6mu675w6elxn445ydl5pg5fo6ei3xa3rjbsj7ypzn3mfb3@s6gvenk6dciv>
References: <20240125165749.15599-5-janusz.krzysztofik@linux.intel.com>
 <kiflqa7ksoazk52b7ffmzktapvtx3yayqqmqm6gulylvdu7mx3@dzp5fpbsblty>
 <2221731.72vocr9iq0@jkrzyszt-mobl2.ger.corp.intel.com>
 <7620076.EvYhyI6sBW@jkrzyszt-mobl2.ger.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <7620076.EvYhyI6sBW@jkrzyszt-mobl2.ger.corp.intel.com>
X-ClientProxiedBy: SJ0PR05CA0149.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::34) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SN7PR11MB7706:EE_
X-MS-Office365-Filtering-Correlation-Id: 54c998e8-c60c-4309-076c-08dc20e40687
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CZ5ZNyaAkQ/5CYiahHDBjjgEjlxxnza+oHeYqqOrFSeFd1YyqaNswTX9l6aWZEgLAaa2fp4guC3a4LARTv4ciC1jHz6FRF9oVjGQOyJFhCXwS8Co8Jh4+mtuOHOpy0cVMwNcvoZxiPiJrC1D6QL82sjePThhJR07x/UiutaGqBr/QqBCQAeYWy0u6v1HRuxh7iCa/0/i+Wbf6+htumJia7DUrCsok2t9O0/5SXk+q5byKTN4mHS1FYvWSjPBQ8OzL22fOa71YMsqQy1okx6iY1MnbZise97UihWQ5tBFcdZZDWF/dv8WMsI+4c1F8GjSJ0kK1BZimixk3aCdwBgcZ2YFUZONYUd5UvsySPKJIzidKV50U12K/uaFKgtqHfj7ixXrl/pY7ZvfTEPGrDx11LdKLU1qu4I5soduuoxma7L4NbV/26S6UMUYoV5Rzr00mpsTOGlBluCF88H6Yv2KQHfDG0kXLURnDRayv4gXQJ3RBij24Ihjtvn6a7em5tuUo/XYBQ6nY+GhdTVY7vqYXehBQ6+QhzLyCbttwvaR7KXpFCQlBO/GCQxveZl/dw3c
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(366004)(346002)(396003)(136003)(376002)(39860400002)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(6916009)(316002)(83380400001)(66476007)(66946007)(86362001)(66556008)(6486002)(478600001)(6512007)(38100700002)(9686003)(26005)(8676002)(8936002)(6506007)(82960400001)(4326008)(5660300002)(2906002)(41300700001)(33716001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?67IL5ezxhD/2b1RjMsXnFgne6NZtTHJpsYi5ge26q9JibybhkqoURcRhAhIK?=
 =?us-ascii?Q?t316M2U+ggQCejaDyQVQbLOBiUVr1SZG7dVgi9+WtwzlH/D+hDpk1COlKcrS?=
 =?us-ascii?Q?avAzd8Fq2qDXp/4z+lqH2gLms+gIWQVugwnDHZuVvdhpG8Y6zW2r/3JyThUl?=
 =?us-ascii?Q?VFT6Sne0aQGNgZXU1yArVjlGoHPqB4+2mdi7cnyFPyARR0w71WmzSczNIR6h?=
 =?us-ascii?Q?zwEu1RG9DrYFvzNrQpxsgoqmQmt/TWepohuQvzGS0Y4UAiB+RbMpT8wn5Hbx?=
 =?us-ascii?Q?myCgnInlI4tkgml194a2I8DCBV3iHuQC0mAcQvVsq6zk9LnpEN3621IBY+Ax?=
 =?us-ascii?Q?JjmRmFLTJ7qOBPMlSo800ViWxw9qPCKfrKXXx1oFitdvjbQrJG1l43Qsu6Gk?=
 =?us-ascii?Q?auz7Mn3VCLlfIB5Mf+J2DaHvENEd2DuwpGsjJZ/G5vxxwAFwMe+A0xAmA/25?=
 =?us-ascii?Q?VKepJ1N15YZNoalhkdWxY+7heQBz/LcfrDA8X+EbxEV3YHtylDQbpBl+2AZg?=
 =?us-ascii?Q?Yxd1+UOy5Ptlv3AbgWeU/oPB7kEoI/Y8oB/2d2pbHPPSJzJNr+5sF1PXQU2r?=
 =?us-ascii?Q?hB73AW+zNOEIEIRkDv6jGOOeql+7rrYPhO9oZcNjMhkaDr9moDqhnGudOTFK?=
 =?us-ascii?Q?Ds5wqbAfL8YGL4K3SXXUMa0K7O9zE/hXY1Fzr0B54VKFnGuS5yWaYmXCFqym?=
 =?us-ascii?Q?8a9nRVrb6sR8+lwoenyd4NoyKZlyunRt1e+nZhH9obVwhKfFrN1IvCQTvUNT?=
 =?us-ascii?Q?8vAGpt4BrGdfQ2RorvsEVk7RvDbVOxhp9uqYK1ailJHy+CdEB4qZcO375hRz?=
 =?us-ascii?Q?iz1ccv0B8k8cRVanmkVRhiabm0z/Mq8PMyFZTDaykLa9qA9KkKenf76oCDH4?=
 =?us-ascii?Q?XoUPm9x/YZLZiM+vG1I6SSSBxqPcq+vC7x0QhPl6mkW5oupVw7GZ+YiNx9tM?=
 =?us-ascii?Q?HwmaugnI2sPtAvJrmccHTG7MTFnBV0IcYigeh4chEogKqLH6gpu04gm2yiIB?=
 =?us-ascii?Q?EjzpSIYIlFwcmiSHRPiOE55zfWbxQyqjLzx6lSR2v1PPMlFnvTIB1HQez+hZ?=
 =?us-ascii?Q?uO44aC7QfbcLeUYNQfm/1siTtE7A8GfjoCM1yHCyN9cfz5crwtkktRd8QkYo?=
 =?us-ascii?Q?FIfLeEPVMQyzkpQI+y11xH8XtveAYRQxlV14dhCspPGd1mAPHt9N7BZUHNDv?=
 =?us-ascii?Q?bfoih5MLPT0B6IllRWIfb4Kn1ykVlWP5RgeTNk3fRdrKrr/iM3L+H+vy/n69?=
 =?us-ascii?Q?axq+b8SZAMGO2btRZndkXz6+PTTKSpUEjqKGFbLlLD5EWpc6sidxqAkdiQAe?=
 =?us-ascii?Q?/n2LdYRe8pCb4syZZqxivzrF6kZBAbCzX2qOR9YDmJqbPzcHsJZhWYZp6g59?=
 =?us-ascii?Q?rkBimmXNoEDCCOeVRmwX+B/xRew/Y6Pp4LWgKn0Xh37HPGQMzybEPMsYiaky?=
 =?us-ascii?Q?EwSNhhv3ibULW6BaSUJ91ePTDynTR7HBK2XPu1PCwB+RNDPozNCXRL1PwoVw?=
 =?us-ascii?Q?umw5sNfb6iAllzqZPB+Ki6QQLy9bN122YuiLYsYhcZNUcka9STIjjR0Occ5Z?=
 =?us-ascii?Q?gQpCG2rNZrV+D0DIuS2RJqub7MZqJCizJ0o30NhtLx5F+4MPFkltA/YYjuLw?=
 =?us-ascii?Q?Iw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 54c998e8-c60c-4309-076c-08dc20e40687
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2024 16:04:51.5578 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vPgcy4CKOkbdwvbJozp2WB55bcCokZK1c7Xv5C1oIPPmoysu4tTnAetWTcBJPZdRQIviN7Up5gZ2ZASasZcy6/GU5ZGpE91dhDwTN4rYWkI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7706
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

On Fri, Jan 26, 2024 at 10:05:25PM +0100, Janusz Krzysztofik wrote:
>On Friday, 26 January 2024 17:31:53 CET Janusz Krzysztofik wrote:
>> On Friday, 26 January 2024 15:46:54 CET Lucas De Marchi wrote:
>> > On Thu, Jan 25, 2024 at 11:25:55AM -0600, Lucas De Marchi wrote:
>> > >On Thu, Jan 25, 2024 at 05:52:09PM +0100, Janusz Krzysztofik wrote:
>> > >>Instead of wasting resources on reloading the base Kunit module each time
>> > >>a different set of filter parameters is needed, try to write the required
>> > >>values to sysfs representation of those parameters.  If that fails (e.g.
>> > >>on older LTS kernels with read-only filter parameters), fall back to
>> > >
>> > >we can't really execute anything on LTS kernel. I don't think think it's
>> > >worth keeping the multiple fallbacks we have now.
>> > >q
>> > >I think trying to maintain compat is good, but I'm not sure it makes
>> > >sense for these tightly coupled tests with the kernel.
>> >
>> > I gave it a try and it doesn't really work for me. It seems that after
>> > you list the tests, the filter_action remains on skip, so the tests just
>> > skips.
>> >
>> > $ sudo ./build/tests/xe_live_ktest --r dmabuf
>> > ...
>> > Subtest dmabuf: SKIP (0.078s)
>> > $ sudo grep . /sys/module/kunit/parameters/*
>> > /sys/module/kunit/parameters/action:(null)
>> > /sys/module/kunit/parameters/filter:module=none
>> > /sys/module/kunit/parameters/filter_action:skip
>> > /sys/module/kunit/parameters/filter_glob:*
>> > /sys/module/kunit/parameters/stats_enabled:1
>> >
>> > This works for me (with my additional patch to rename the module):
>> >
>> > # # list tests
>> > # modprobe xe_live_test
>> > # echo -n 'skip' > /sys/module/kunit/parameters/filter_action
>> > # echo -n '*' > /sys/module/kunit/parameters/filter_glob
>> > # modprobe xe_live_test
>> >
>> > # # run just xe_dma_buf
>> > # modprobe -r xe_live_test
>> > # echo -ne '0x00' > /sys/module/kunit/parameters/filter_action
>> > # echo -n 'xe_dma_buf' > /sys/module/kunit/parameters/filter_glob
>> > # modprobe xe_live_test
>> >
>> > I  think the main issue is that kunit have some different code paths for
>> > not param == NULL and also that writting an empty string is not really
>> > working as it doesn't issue a write() syscall. If you force a \0 and use
>> > len + 1, then I think it might work, but I didn't test it completely.
>> > I may have to enhance the patch on the kernel side to handle that more
>> > effectively.
>>
>> OK, if you are going to enhance the kernel side then I'll hold on for now and
>> get back to it when we can call the ABI stable.
>
>Or I can propose a workaround that sets some non-default values of filter
>parameters that effectively work the same way as if default NULLs were
>restored, which now seems impossible to be done via sysfs.  Example:
>
>List mode:
>- filter: "module=none" (no module matches the filter),
>- filter_action: "skip" (always, since all modules are filtered out),
>- filter_glob: "*" (equivalent of default NULL).
>
>Execute mode:
>- filter: "module!=none" (any module matches, equivalent of default NULL),
>- filter_action: not used (no modules are filtered out),
>- filter_glob: application decides.

yeah, that should be ok. I was worried that setting the values too late
was not taking effect, but upon double checking it seems the main
problem is when trying to write "" in igt:  it will just open/close the
file to truncate it and that doesn't work for setting sysfs files.
In bash, `echo -ne '\0' > filter` works for me where needed.

You will probably need something like that for filter_action to be able
to remove the previous value set and stop  skipping the tests.

Lucas De Marchi


>
>Thanks,
>Janusz
>
>
>>
>> Thanks,
>> Janusz
>>
>> >
>> > Lucas De Marchi
>> >
>>
>>
>>
>>
>>
>
>
>
>
