Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BB81C6FD1F
	for <intel-xe@archiver.kernel.org>; Tue, 14 Mar 2023 17:22:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40EA810E1A8;
	Tue, 14 Mar 2023 17:22:45 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C8FD10E1A8
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Mar 2023 17:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678814563; x=1710350563;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=TOWvIMtK5eBv3DMoVd7WfE+ZgCgrMT8gJUnPkkPUaXQ=;
 b=bxcw2BHDxg8BCODn+RcDSzB6qEaBwZwbGtuww1RE+q4LHjhxlqEvq2/y
 ZKPUVQMuLJn42ClRuAYibfuy/7NFOdTYWmTgwrM/0o9QF4pS3MMXkz/eY
 JaHjk96OTtJI/HPEAAu8c8HDuqj/BldkqMecF72ET+xBaGzyIyz3dfIEg
 VLJofuuGdApr5CH97e+V8pgRI8zJasGXNAiOlBOkEPsXiLiVisIOJ4t7z
 LFruU/6UDs6VKMDxGqIT6kQlkxsoXP9aejTFgyKxgfHB5DfAihXtATy1d
 2H/3vl6sN+KFS3TcVFN3hM1wpIanI890U2551NRi4MG6XRkImXGEnm3CN g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="337519392"
X-IronPort-AV: E=Sophos;i="5.98,260,1673942400"; d="scan'208";a="337519392"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2023 10:22:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="711601882"
X-IronPort-AV: E=Sophos;i="5.98,260,1673942400"; d="scan'208";a="711601882"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga001.jf.intel.com with ESMTP; 14 Mar 2023 10:22:42 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 14 Mar 2023 10:22:42 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Tue, 14 Mar 2023 10:22:42 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.108)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Tue, 14 Mar 2023 10:22:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CnG6t1N6YPTdMm8v0OXT4q0/u5NaMWiWukMg7XufozwQXP0NHki1Qcdt9P3TNva+MUweMG+AwmBI05mNv3peysgFoA/GrMFwkCfH8+mMfsoCiQXRJ0bxzjuVtevYYwzZnfa1fpfOCuFccg/0nQKGSZOabv+iFZJAhrYLtkJZ0iKLbFyQBLJ+vzHThndfdOEzMVbzcIGsGxjE5Mctzsgvv6Vx+p/21Rx1d/YAeY7mljBSACXyJGDwI/2jrNaPclLWkjVyQrB3g2RDxq3I3vB/vfsM5fgSs/ABu5xowoHZpsObM6qyY42A6GSJ4RXL8BAywUUZIpUbjVamY380WAHJKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+/F4QIyZg7Zi2IVHfxPmtZ+/dhf9X77sVy1UgaAZsHk=;
 b=cQvWDA3y7wJVfsxLcIiLnmy+7jvmgo9T9N6jHTZRA4XpA4N3PGhoOsVlZoll3ZMYKxi4I5KkyY0jiBPrJeen09pbYtr4eukIP+TP/KmelWxKZ09ujpxnd10sol8OfGSWhqFpzVRTp3dWT7XQOzUFCm6LtVoScBKj1FR8g5S5Z7Go1LmCwWYTRu77MSFUdcysIbAH8xXK3yjIYNSm2GoGnCWD5dR6i7X6SWutbAuBcTWAYZ9jdeYoQ2Ynd48HApIL6b+hlsHXDwOPr3esPT6uWpYvF7zImv/4PhpyHQZ70d0blqwYpXUfsT1lgIXCO36uQGJtKO7bw6Lxgc3Aii9Nww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA1PR11MB6122.namprd11.prod.outlook.com (2603:10b6:208:3ee::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.19; Tue, 14 Mar
 2023 17:22:39 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745%4]) with mapi id 15.20.6178.017; Tue, 14 Mar 2023
 17:22:39 +0000
Date: Tue, 14 Mar 2023 10:22:37 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Message-ID: <20230314172237.424zwdox7mnod5s4@ldmartin-desk2.lan>
X-Patchwork-Hint: comment
References: <20230309191923.670451-1-jani.nikula@intel.com>
 <877cvj7e39.fsf@intel.com>
 <36d68f73-d344-92b1-171e-5e39ed1af651@linux.intel.com>
 <874jqn708f.fsf@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <874jqn708f.fsf@intel.com>
X-ClientProxiedBy: SJ0PR03CA0266.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::31) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA1PR11MB6122:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e85f554-bb5f-4330-26d2-08db24b0b5d8
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EbRxb1hMCxf1UUw1TwTskDlNwT85isc2ZgLzmOzZ6/QMIXxAyo9gPRPeGmRz+8VRFPW8aCPJE61f0xrAt6/v/F1jcXHhdE5KK76HU50yCrEiN28HINwkxPpD58/a+m3J0W7ORQNh07Ky9YNKuxoSwuHS1Z6aQewDUMrijEA+lNdC1CMtgOrbyHxggYnqbsHMn28GCb8Qpn2yyq7pSWx3SnPgsM9fBYv9305ccRSsufXwP35QiF9EhJaFyaogDQTeWYU59BTzSNn3lB9uoC9fSw8Pw+VgD5NBV4cc3dNlXKTlJKAO0BBYCLyMN5rLqUj7PLnHZrDIIAgiMrNIY6jNNDX99EYcfZ2HeiiWicLvkO04ut5foDoecXv4pkKoSoRzalecYu7Vbb6S1FjR07FXEfA8nFf+pf3bSmPbVUo2pZvBybGuUw3AuFhcm7AI/sBmRQvni/ON4QNL0aFud1ILKagHb7MqLEEIOODU3yYhMTi93Pop2D+InbwGB8ZAd5kko6OpduQKnQZv6b1/xLMcSjuaWwhK7KYbGjkWp7tujCyUzG3rIOIoYel8KyPHvUCefXdbp5k9QnfrzOhfx/FAr7EcQokkSASGYTxK6EKZQtKaqVygKsRC+G/ortmOlPLRU003Rpo9yIDkKo4CGFfg/Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(39860400002)(136003)(376002)(396003)(366004)(346002)(451199018)(66556008)(2906002)(82960400001)(316002)(83380400001)(66946007)(5660300002)(86362001)(36756003)(66476007)(38100700002)(8676002)(41300700001)(54906003)(26005)(4326008)(478600001)(6862004)(6636002)(186003)(8936002)(66574015)(6506007)(9686003)(53546011)(6512007)(1076003)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?brVCpxg75rJPgXnanvt9mKt2X+musCQ/naZpEe3MmvMXTWofR7eY2uT02A?=
 =?iso-8859-1?Q?0W+lt1Ko5X7/9OqFjsFalrSKd+qGAalMcEfT6MLQVf9ECp9rQMbyReQ3XX?=
 =?iso-8859-1?Q?Z8NsjwClcAFiRUSvUxUZznqihrmDqF3uNkzTVwGLbaNchTR163rBjPqtCk?=
 =?iso-8859-1?Q?akASqE7WC6khyGcRXTdEJwD79mD962URBdTH1lMG6eKN0STIlygJLwHr3/?=
 =?iso-8859-1?Q?j77zL7aoPf9yx1nS+/KqyopihIFvE50uU4WvV5PKpxks4myeLxoajUYHnf?=
 =?iso-8859-1?Q?Vqvx37Kyd2xCSNjl6QcXlruO7kn6DamrVmQpzZFx/FUrjGFnxMMTKKm4j3?=
 =?iso-8859-1?Q?ZMDJ7aPO86yIu4KCGaUdH4xOUq2xIaZFABMbJ3I8xqAp8CfoER3Pf8R3h3?=
 =?iso-8859-1?Q?W56X5IEOfW8WSazi696uX9zCirdFO2elcXdvaO/wiEMuDC6AslO8CZF9VC?=
 =?iso-8859-1?Q?zA8U4g2/RH5qTF+UAD0wYjZwep0VrxW3iJ+ZcthOG0QBMGjNUM8KkIFaTf?=
 =?iso-8859-1?Q?79GAh3RaFG4fUuJDnkwUM0bo+oRzVKPAaaXzEe1BU3VxILncqc4WHpkuLt?=
 =?iso-8859-1?Q?fqMyr+P7dmUl2moqxY4MlDXCT/jyvph5IA88/goItRgslM8t0P2IjZdf+r?=
 =?iso-8859-1?Q?cJMT2XLcF+QdFlqK230QPtNakrSNwmXI0PiImJB9/JeQ0k08IWAHIvA87a?=
 =?iso-8859-1?Q?6TAEtRj98X24+nYSdvIZEuhqi3uLsfk5UZVz0jFoK+E+nA2Hg7uumJeBNM?=
 =?iso-8859-1?Q?i+LzAwiD/LTfTPTeoNjLlpuaPfQUrU4sqTNEE+GdEYvT0I9Uzj6SPOdgEM?=
 =?iso-8859-1?Q?16bl8GRS1pSwJkMZyAtsHXIKvjAozhGIU2jH+8MhkiY1FWva2bJap6Rw0y?=
 =?iso-8859-1?Q?OC9e7HsKLZEkKWc+TaONjqVKZ4M6K65djHxn2/1orXX1oz3taBsQU6wTCg?=
 =?iso-8859-1?Q?l1hwakLBqbEjbj9+KktVFiSkUAY0o+9dqgzgX7dYjE9day2YV+IAxj0Q7+?=
 =?iso-8859-1?Q?dV/eLYsM0Sm/X8sIrMKFRpTqkdKpK8i9OaVJmGwY8khd1/HPFlca0dVCdb?=
 =?iso-8859-1?Q?PqMTupVxYlZ+IL6DmqmtWb6ehsMoGDxF4kx2X+B7jlWocD8uEb0i6lev2E?=
 =?iso-8859-1?Q?QT37E4ikkHTKHbJuEdqBkNnR5+bNynFjAoRBuZTpm1GpoVrSpAeI5bg7DX?=
 =?iso-8859-1?Q?kDZ3UpzYaO0pb/gVDCZGKOGMwfxJi/a06P5ia6l+VzRyD9ZhDD6w1lD5SO?=
 =?iso-8859-1?Q?WXsSAgZaHaCau7cbpLPs0kKzl4RvPEizR6E27YPHoFYZyB+Ybgi75LbtdZ?=
 =?iso-8859-1?Q?NtsZSekE4Kh3q/DHFkTcn66WMCNkCNqk8O5lpIDYbW9Z0ElKXnTePGPHqA?=
 =?iso-8859-1?Q?26q7MfwlfI+m64Bp40YmIMeSjxFGQfd7diIvURCWsy5DmFUXP//AKqz1mf?=
 =?iso-8859-1?Q?tH4LhFPChsSMGIquaYjdE8xnSoTPuWkwPacL5tZC0mMj9hiXDEzRvSjkHs?=
 =?iso-8859-1?Q?PbwmPoQQkWCKeiQLvyaoBnk3a16GCrGCbdHanfjJt13/fxYHweSPv0hSj5?=
 =?iso-8859-1?Q?yvFqu0Mh7bl8YzmFP0hpBS7Jx0GMhuhhyG9ei1ndho0vNNyj5vdgIhpoWZ?=
 =?iso-8859-1?Q?REjFgn3lHUsDBG62OOxZI1FmuW2AkpDRvL2W6HFwOjnjscKUC4I7hBTw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e85f554-bb5f-4330-26d2-08db24b0b5d8
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2023 17:22:38.8617 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SgfUjFVww6v0Xve8ZkxwguC9uigk4jHd2h+kYPqHemw2JyJ/j1qs00J4Vr4wF6zZAQpZXKx/McVW/J0M3zaLgu+r1L4hZp1QYhjlN6hClkU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6122
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [RFC] drm/i915: add kconfig option to enable/disable
 legacy platform support
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, "Shankar,
 Uma" <uma.shankar@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-xe@lists.freedesktop.org,
 Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Mar 14, 2023 at 06:42:56PM +0200, Jani Nikula wrote:
>On Tue, 14 Mar 2023, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com> wrote:
>> On 14/03/2023 11:43, Jani Nikula wrote:
>>> On Thu, 09 Mar 2023, Jani Nikula <jani.nikula@intel.com> wrote:
>>>> Add config option DRM_I915_LEGACY to enable/disable legacy platform
>>>> support. This is primarily for the benefit of the drm/xe driver, and
>>>> legacy is defined in terms of the platforms drm/xe does not support,
>>>> i.e. anything before Tigerlake.
>>>>
>>>> While the kconfig option will be CONFIG_DRM_I915_LEGACY, the intention
>>>> is that it's not used in code. Instead, we'll pass -DI915_LEGACY=1 in
>>>> the i915 Makefile for CONFIG_DRM_I915_LEGACY=y, while the xe Makefile
>>>> does no such thing, regardless of the kconfig value.
>>>>
>>>> Initially, the knob does the bare minimum: drops the legacy platforms
>>>> from module PCI ID table (and the compiler in turn automagically drops
>>>> all the unreferenced device infos).
>>>>
>>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>>> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
>>>> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
>>>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>>>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>>> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
>>>
>>> The discussion stalled a bit.
>>>
>>> Do we have consensus to start adding this to upstream i915?
>>
>> I always liked the idea of compiling out platform support so I could be
>> convinced. I view that as a "power user" use case - compiles their own
>> kernel for a targeted machine. It also translates to building smaller
>> images in production settings although that is kind of not interesting
>> with the storage amounts these days. So overall feels could be
>> justified. There is some benefit and could be done with minimal
>> maintenance cost.
>>
>> But to add a Kconfig calling something "legacy", by the definition of
>> what Xe will support feels maybe a bit premature. Sure it will become
>> super useful once Xe is in the tree, to allow exactly the same class
>> use-case as above, but until then it feels questionable under your own
>> criteria too.
>
>I don't disagree. Partially the idea with "legacy" was to be a bit
>vague, so we could tweak what it really means later.
>
>> If you could add a set of more generic options, which Xe could later tie
>> into that would work for me. For instance we have some more natural
>> cross-over points than Tigerlake. So if not per individual platform,
>> maybe for like ring buffer -> execlists -> GuC transitions. And naming
>> them without saying legacy for now, but use some descriptive names, and
>> listing platform code names in help text. "Select this to support
>> Broadwell, Skylake, etc..", "Select this to support Sandybridge..". Out
>> of the tree Xe build can then just not use the corresponding defines in
>> its own build and it would achieve what you need?
>
>I kind of wanted to avoid adding a lot of config options, because I
>think they'll be difficult to maintain and get all the combos right. I
>don't particularly want all the build bot reports about various kconfig
>combos failing.
>
>One other problem is that I can't think of a way to do this by using the
>kconfig CONFIG_FOO macros directly; you have to add separate variables
>because the same files are built for two drivers. You can't force the
>CONFIG_FOO macros to different settings for different drivers. So we'd
>get a lot of proxy macros too.
>
>I wonder if there's a name we could use instead of legacy to reasonably
>match what Xe needs to avoid adding tons of configs at once?

considering TGL itself is also "xe" arch (not to be confused with xe,
the kernel module), maybe CONFIG_DRM_I915_PRE_XE?


Lucas De Marchi
