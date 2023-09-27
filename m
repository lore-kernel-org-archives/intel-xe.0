Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF99EE80A8A
	for <intel-xe@archiver.kernel.org>; Wed, 27 Sep 2023 22:42:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 758FE10E5C2;
	Wed, 27 Sep 2023 22:42:20 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62A1A10E5C2
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Sep 2023 22:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695854538; x=1727390538;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=K5VRB0ex8YMFwEXZin7NPeMceXuMWRgjs9i2ZVIEeYo=;
 b=LCZHzis6aCNwoeRsvjRxOxq9eTMixyfF3w2wFLe79+7bEgwz9RoCgujd
 wkc2/31gTLrblyaTMNSSM8EGYKPqhcFrkVW35r1lqXYNMd/kdx0J9LFnE
 mz5tpCeyUnTHteQjyj9hOzcg3uXTY/0+CXc95gf2OlyydrO3IEnJga3j2
 yXGSWVnkXoAtXrCWVahEHtnMxEHSoZXnvZd7HfBYdCQQTu0OUy6HJPn51
 ZBxjHvOyruoq6BShQYSe6syhYif/8AXG0apZRIjPlgzEGM2G9PdGyab9i
 qxSaUMFQdxHOGM4Gd8idWaGGyyTEE5WkF9Jz0ad+zaiE4PArJbW91ww1W w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="361319761"
X-IronPort-AV: E=Sophos;i="6.03,182,1694761200"; d="scan'208";a="361319761"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2023 15:42:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="778697671"
X-IronPort-AV: E=Sophos;i="6.03,182,1694761200"; d="scan'208";a="778697671"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Sep 2023 15:42:14 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 27 Sep 2023 15:42:14 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 27 Sep 2023 15:42:13 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 27 Sep 2023 15:42:13 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.49) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 27 Sep 2023 15:42:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I6mJhZXay0GUhpoqRZQR14wGBM7CrQvaGlaVEenQEv8eBuq5Stmhpz0hVTF9Fltb7h/QtIUA8ocWAtihYbt+R3QvJb/uDxWRoQns5UtbuaZXEGuMwIhAaT7YLxoRmlpUIHKxqCho+RIJBHl6dFfx12LFfAuzPlY+ihvpNQ4y+EBjrLt9eb8rtBn09RW0ZuEFyHVk7ycQJmL7lYpFg35XG9YJ+uTjFiK1PDnENhJ6BOYGTing47JhvRsBeuDtvQpQkuYtPiBIEuI2sh0vVpfp1QMMxRVMT9DEQ4KYSW7I//1UA/RxYUhx8fN9atyu4QvsgVhN0iBYNgCvokTeD9ZR3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KdyjhkQblJYPv4x6rSndc15EIbtJ58cEIwjbjcP1tLw=;
 b=SU3Dsvp7NsONAuD3oJ8S+5tBuFdFl+lg0VfznGvuLTcemeihyDoiQE9cGR+G+CH/HdxWFRPD/LbUQAHf0FvY4VkKnqr0e9+ww2l2nLN0Qpoqxm971nNVkh8UwZKfyZMuOnEHqdHbdpo7KAkfJzVyB//rupmA0LAiwCmwB2fxGcKGiPacL69MkpCTWcAF6Bl/pWF/FOxHSsApQa+TowKMs0939h8LtHp4ZXuz50YFiZYupbb3fbGWjI/bsuli/4EaNuRj5TSUeVpWN3PpOCFO3kr/KdRSY94ZNrVxpPb/t/wd9OCXMziGk8gLNWfs2P2yCNCuxzpzdI7SgBwxdZZN+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 PH8PR11MB6802.namprd11.prod.outlook.com (2603:10b6:510:1ca::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.30; Wed, 27 Sep
 2023 22:42:10 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::48d9:4c34:35b:f66]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::48d9:4c34:35b:f66%4]) with mapi id 15.20.6768.029; Wed, 27 Sep 2023
 22:42:10 +0000
Date: Wed, 27 Sep 2023 15:42:07 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
Message-ID: <20230927224207.GE2706891@mdroper-desk1.amr.corp.intel.com>
References: <20230927205143.2695089-2-matthew.d.roper@intel.com>
 <169585200594.20756.2894106191677694506@emeril.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <169585200594.20756.2894106191677694506@emeril.freedesktop.org>
X-ClientProxiedBy: BYAPR07CA0011.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::24) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|PH8PR11MB6802:EE_
X-MS-Office365-Filtering-Correlation-Id: a7980e54-0ff6-4ade-36bb-08dbbfaafc3d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: koOtCMpzZSqHaMYxFFL8ehH0shmN/nx332sMUz5PCnEaZrCHlfxVQtQpdGBQ0WJXpAacpEYB39HUt6KchEAZ2RihfK11NWZQIcl6miEfiMez3ge0hZoZZDaIjrCkK8BUj4Zuinfsi5H1MulJFw2Mcc3vBOG2NnP8QNE7yf048Ecy1W8cqOy514pA4DJAaU/DtDRpywwIVIsDn8tHm9QiisTNq9163Z37w/4FaGrjD33pPmYOyDCUFftqSFZywWCafwjMkzD9wy8BOh5BxftikG4kYtx1a+GnvqYr41w/UkjnGJy/NWCJOSOzC0XlDhmZMDBQwnGnDjt4PxJDgCjZ+c703KbHpsSiubRemfsqp+Cbdc5yVn8W8ihI9+w5+av9BQEC8rRM4eZ1OtFhdXEdOzmWPAO26B7lO5ajE0JRkWgKVBvHWG1flFmGnkCRD0uz2JWmgJhmBh9rtC5OAChPkP9te5PeCH4HoupkRipEERylozw+8Sq8tCKQ0dBRddwzcQLW9zYxFkesoVwBAV7Cxth0yNqzXqsAcnpt2EVXLxRAoIzktzMADUe020nC9vwn0YO0c8z7UCgx5iuHZVTrvA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(136003)(396003)(346002)(366004)(376002)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(83380400001)(5660300002)(8936002)(41300700001)(6916009)(66556008)(82960400001)(66476007)(66946007)(316002)(2906002)(38100700002)(478600001)(26005)(966005)(1076003)(6486002)(33656002)(6506007)(6512007)(86362001)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?m02QNOoTMzCKGAgAVSeGy41ln7x+MHziQ+Kvj+CsU8Ewevtil/wFWvRhC6DG?=
 =?us-ascii?Q?QkRx+4HiIrO/ocYAdVCtW7A4RwmFGK+VBhqVhJPye6kUZ50f/PbBRC4F/ZeH?=
 =?us-ascii?Q?ljAYNu00tsl0M0VY8yRcbdsYT2Gb8aNBulqF/4LiMAacOeEihKemxPWmucMV?=
 =?us-ascii?Q?ID3HhmtAfaPGnVAzJ4i/k8+3/NKHE0vKwoNuHulAAiNs9H0s+DcamFnA/n6Q?=
 =?us-ascii?Q?j06w3jh07uGzWPAjlOW45jzozX4kid3kSqMNteQOgVGmKWZaCJXV5rsf+xpX?=
 =?us-ascii?Q?weT6FiLvHVIxLqDCW2K8HoOwYygH3H5iqUaZx2lV0goH/FXIEV2us2vbvelM?=
 =?us-ascii?Q?76mMcfHJ7HPFnofdJGrSAMoWRkbqLCE/0H7QXPXfThNMDFnUNEHW9c4HK9OL?=
 =?us-ascii?Q?IzZro5avUsmWF3+kKdVAxY/jJJ7n+DIidWPeq+Of/RuvXbPXt4uxJkrbfRuU?=
 =?us-ascii?Q?Cr48WxJyBZ3Ms6IuRVLJ+CoLVcv6361ruwEkRO2kn3Rw6HWf6a+3Vz3pw3ht?=
 =?us-ascii?Q?oXTr8ZX99BHrMGc3ygy7eeiO0njrfjlDyIZZsD6QKlclH5xCE4qF5dGy0Tt2?=
 =?us-ascii?Q?DdvRm8cweW4Wxc3/bVJlYx9TqzPZ4rooA0PrqzPIjz+qRthAI2gkVRk8Dltl?=
 =?us-ascii?Q?UPmVm9fkDB0OCKP5Mdw7uQIfx5F4SgZaWJyb3HInota9ZcZ9y0A+3ncOvgrk?=
 =?us-ascii?Q?LZR0eVZaaaUhwDHyi3r1h1N9k1uBsjA0wCdfE+87Jy63Gr7q83DquZfdYrgy?=
 =?us-ascii?Q?EPixmyRG91ZPc/Y321vSPP2ukQbf3FTdh0xFl0i13tXiKzMOxqGc8bezEYyl?=
 =?us-ascii?Q?LnrskDXvsMyYbUgnxU2rxXHmkEBZarMgPg4hAyqfnv8YEMbhHcXZUYnC0g+z?=
 =?us-ascii?Q?Ov8WO12F5eGJhK4gQhfUc4NkxXhNkgD9OhASM2BAuc5Mcfj2HBfy8mFXWTIa?=
 =?us-ascii?Q?iA8RGZfl97h6PhQx4tSkehaLk6lPM5NCjJHgnqEZZAXjecesa0M2rWtHkKPz?=
 =?us-ascii?Q?btPt64Sv2nAlhOnxKMwQcZ5sOUBOHYHDIUYmWdbPw+ElKd9TADncXqdAPsiX?=
 =?us-ascii?Q?OaYzriWlaSock1e7BRNRMsWUsZ/yPG/Wn3ekrT3XyeBircJvl0ePZXRCUTsJ?=
 =?us-ascii?Q?eiLyH4Nv8oR6lRMmrFPKdXKb84/Jupv4JsSbvYkVDd/sGJqIoqRUWLV1uyYH?=
 =?us-ascii?Q?5k1tAlQKrgeILSyRx9njQW3MUKeHv+Vu8uN54beQq3cv0fkNXLlWhzZ1a74F?=
 =?us-ascii?Q?OVKBFXR1qByZX3ZxM2XO3wzJpf9USVADpY9JY1i4wQX+QPYfHLi032NncGqi?=
 =?us-ascii?Q?QACKN8ZLc3AtYIZkSJyifvU8BuQlCcxP8T/7FMCqO9/CnN517YW5TMYt5/iv?=
 =?us-ascii?Q?quHfHy8HYnXsOcXiM3lZBh10A7eVnlnqlnX/wafTTW+FJGAWFoNXUgqBrcDS?=
 =?us-ascii?Q?win4jrlxS5Bc0aaaOuSJBVfUORb3rAneyOzB7fpQuSXu8BIZikQw3bi0zQsh?=
 =?us-ascii?Q?8iOJE5uy+52MS5FH8qBXw1R40dQQad7gAnFcW+kdmiijglz6yz+IDHqq2i0P?=
 =?us-ascii?Q?pBPWw6LDzGnhruOqhK1kkbxeVhq3j9JLRH7lAWimqmMB6mdKLKl+2H4PqaKD?=
 =?us-ascii?Q?Vw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a7980e54-0ff6-4ade-36bb-08dbbfaafc3d
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2023 22:42:10.6870 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rq1CcP/UuBlzC0HyK+9GajgXAO9XVJKN9bmFJALnmf0CXe59kAiBhoFLoYJZER4u2q4nbGCdwxhQ8FoU8Cnyh8Nxg62fWtC37g9N7Igx4E4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6802
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] 
 =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe=3A?=
 =?utf-8?q?_Infer_service_copy_functionality_from_engine_list_=28rev3=29?=
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

On Wed, Sep 27, 2023 at 10:00:05PM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe: Infer service copy functionality from engine list (rev3)
> URL   : https://patchwork.freedesktop.org/series/124143/
> State : success
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-397-bce60b0ff2937cb2ea51841a479bc1a2da65052b_BAT -> xe-pw-124143v3_BAT
> ====================================================
> 
> Summary
> -------
> 
>   **SUCCESS**
> 
>   No regressions found.

Applied to drm-xe-next.  Thanks Bala and Haridhar for the reviews.


Matt

> 
>   
> 
> Participating hosts (3 -> 4)
> ------------------------------
> 
>   Additional (1): bat-pvc-2 
> 
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-124143v3_BAT that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@xe_evict@evict-beng-small:
>     - bat-pvc-2:          NOTRUN -> [FAIL][1] ([Intel XE#389])
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124143v3/bat-pvc-2/igt@xe_evict@evict-beng-small.html
> 
>   * igt@xe_evict@evict-beng-small-cm:
>     - bat-pvc-2:          NOTRUN -> [DMESG-FAIL][2] ([Intel XE#482])
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124143v3/bat-pvc-2/igt@xe_evict@evict-beng-small-cm.html
> 
>   * igt@xe_module_load@load:
>     - bat-pvc-2:          NOTRUN -> [SKIP][3] ([Intel XE#378])
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124143v3/bat-pvc-2/igt@xe_module_load@load.html
> 
>   
> #### Possible fixes ####
> 
>   * {igt@xe_create@create-execqueues-noleak}:
>     - bat-atsm-2:         [FAIL][4] ([Intel XE#524]) -> [PASS][5]
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-397-bce60b0ff2937cb2ea51841a479bc1a2da65052b/bat-atsm-2/igt@xe_create@create-execqueues-noleak.html
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124143v3/bat-atsm-2/igt@xe_create@create-execqueues-noleak.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
>   [Intel XE#389]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/389
>   [Intel XE#482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/482
>   [Intel XE#524]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/524
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-397-bce60b0ff2937cb2ea51841a479bc1a2da65052b -> xe-pw-124143v3
> 
>   IGT_7506: 4fdf544bd0a38c5a100ef43c30171827e1c8c442 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-397-bce60b0ff2937cb2ea51841a479bc1a2da65052b: bce60b0ff2937cb2ea51841a479bc1a2da65052b
>   xe-pw-124143v3: 124143v3
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124143v3/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
