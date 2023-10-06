Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F014EE94139
	for <intel-xe@archiver.kernel.org>; Fri,  6 Oct 2023 22:54:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAEA110E578;
	Fri,  6 Oct 2023 22:54:36 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EAFF10E578
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Oct 2023 22:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696632875; x=1728168875;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=gQhhJFBpjI9QCx2m5v3ZBymvJxMFt7SY/EA+hAssWbs=;
 b=ijAIU3FzXmGVQIztHCGGj6ZufuUEBLu90cSNfa/w4oEtE/gj50vOTKnP
 TjOYzSg5FD6IEtmH2mHF5tGg6sK9o9afLvZL81FUFJ5QOj9Oy4c6tmnsu
 9RLR45bX935YhOx/F6U0b5lGh3FH4PZcBq4Bq54v3d9+3OLAED9xucSIg
 Hesrs91BKXnPY9H7nJeL2rvs8ZFvkRthaSQQ+7d/ZkbSGLDG77PvhFdAw
 vdBfEbzI3bli5vfrI0GcgIIEYzlJt/5AwsLxbH64CCpuITcGXuY4Ot7U+
 FLM8zyzNeKAdqB1nG/+PmoG61qyDjcapHQNW1ckHGX/G6+0iiTIGAXQG6 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10855"; a="450344892"
X-IronPort-AV: E=Sophos;i="6.03,204,1694761200"; d="scan'208";a="450344892"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2023 15:54:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10855"; a="702194467"
X-IronPort-AV: E=Sophos;i="6.03,204,1694761200"; d="scan'208";a="702194467"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Oct 2023 15:54:34 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 6 Oct 2023 15:54:34 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 6 Oct 2023 15:54:33 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 6 Oct 2023 15:54:33 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.45) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 6 Oct 2023 15:54:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VhMPGFr7Zb0yr6BuYhIBoirOGYh8wKWdNVWqTmvpGJ5br+RbDOqNrcr82tGNmlIAxvmvPtmepwRAMHUJnciZxMw2/bHym7LANNNRwW4BlC0865pFjlUiMbXlTf97ov+b/nwV/IqZSp4qvFaIAOLlocFBSHZoWIAyVTbFrxVTnzf1KzcDwMgQNBmjD9rpBMCGlKQrSjEBdEJQJj1hbx5MYql/xV/LzU9C1F8N52okp4pEuEaKdVX+Gxax2xRBymK5lzlCEcQytU2BY09zn8kwhwIHjPw5VyxpplySFlpdf8+Ue6/fCLu8x807RtEIAx4H8c8d+sSmI0jl0jWe7/eOrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dimv7+YMsKkmyxO6P+XrG4m7Ah3UxL2ZA88PFEJy7HI=;
 b=ltKvavLO/8lTQW1O7b7MhzxCarwEBhFXpaD3MNotvjIHS1LH7ESXO7IbLQ3u4RDJjz6EQGKqSOezSabuqLVTtV24TZVqoPE+O8KM4CRxp4GLYnLaV/cvB3D1JYRdOHWF59NHdVzBDF6YvC3qQbsyImwRfeT2FJxyRkKc3dYnWNWbFnBuYfg01UoBxjuc1dBrj50TAOM/Mf/S5T1y+lyh/C4LofAVbCf4D1+pFz3YOD9zgz685EWH3RD5GP5OUUn9jiN7+oMDKmtYXUVjk5/nN7cTUsuzOKkRgXT6yi1jEuhlZHdVlC7ahlIMuFWRU7A15WZ3yeXCfoEQoJlRYwZJZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ0PR11MB5865.namprd11.prod.outlook.com (2603:10b6:a03:428::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.24; Fri, 6 Oct
 2023 22:54:29 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::f345:2318:9a82:51b5]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::f345:2318:9a82:51b5%7]) with mapi id 15.20.6838.033; Fri, 6 Oct 2023
 22:54:29 +0000
Date: Fri, 6 Oct 2023 17:54:26 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Anusha Srivatsa <anusha.srivatsa@intel.com>
Message-ID: <nadpbdigukpq3rfupavfqtd5xoyjj7lfhdfsy2nr4xtbaar7r7@wtlfuf2cfkej>
References: <20231005205450.3177354-1-anusha.srivatsa@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20231005205450.3177354-1-anusha.srivatsa@intel.com>
X-ClientProxiedBy: MW3PR06CA0015.namprd06.prod.outlook.com
 (2603:10b6:303:2a::20) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ0PR11MB5865:EE_
X-MS-Office365-Filtering-Correlation-Id: ca6fe9de-17a3-4743-b946-08dbc6bf324b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GOucqAX/pHm/uwwIXMVAI/JhpENoAGw+H1UbWHfgcUw83Tr59vvNz9coO9ip1F08RXsYOR6Sb9ml0t+KKU94v6UJmQqXsA6eSwzgFyMKmFSLufjXy9iTnMgenamIAKvjPmsAbNVmL1kxOATyTCzbVHSU/PtiAvwJutWq7H5GgpLt7UCFOyRh+a8c2y8V/fGfD6OLO99ixs+fjU8nAiBPQDBmlpIbajhqtvFg+bcKcg/YkDYIxmtbzm3Wv6ONa6qTp6Hw7F5Vt9hQoYldF7KaS1YJZ+F0rFOCoqP6L7LJvaXggtvgky8ZWEMihGIqbyKxxVfU3n/jKxRytNf8mCP65idwocrmRcis241KswZI1N+JL+uFtffIHQquYFDI6HizY6jg54kVxBBtRjtU7wQypd3vEOEBpfUtyiLQ3aFAIS3Cllq8t3W0ilzj0XWV4YPNv+LlLqN8fKm5rdN9oSGoWPLWPgMK3G8NNnvsirpfKfJoZV/rVKEdiKlK1ElybLKTOpe7WWJw4mJkPhneJl/aDm0BP9PxYmFMqkRA/St1NnbmgV9YyPJZwUw9daSzZb3R
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(136003)(39860400002)(376002)(346002)(396003)(366004)(230922051799003)(451199024)(186009)(1800799009)(64100799003)(2906002)(8676002)(8936002)(5660300002)(4326008)(6862004)(41300700001)(66946007)(66556008)(316002)(66476007)(38100700002)(6636002)(33716001)(6512007)(83380400001)(6506007)(26005)(6666004)(82960400001)(9686003)(6486002)(86362001)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZubKW4B/BbH201Rvt0+fFAg8L0Gk3frmbggGh2qmHr/pCJu8xUbHEvsCR54l?=
 =?us-ascii?Q?n0m4lIBJu9h3Kpk4QTTZgmJi7xvYJLv8w0Kc7AXPETS3S+lzNlfQ+itupMT9?=
 =?us-ascii?Q?1/+ARltO5N7dhfrnb0HDidhG98LNcwh+Dvg90+bUVMggRdeMLQpFcKMsLSiW?=
 =?us-ascii?Q?I95g44FF8Li1SCW5FzJWwg/K1Kz8Z8h39Kfzep7qKeJOxUAVX6j3V0BfMkgi?=
 =?us-ascii?Q?mDDhmkawxuKoYaOYj7sMcs0JIMH6j1YF1AKR8ezU7j9MFl+hvYyIUc1wplbH?=
 =?us-ascii?Q?KvGOryGmJjTbAFWIN5QB76bZnDuyEZH6nZVjg+fmD4aXn8nhouGMm/4pLJMr?=
 =?us-ascii?Q?oejyKRBJzbR41+1+1JbqUCaWx8D1SOcsG3SV1HL2YdLHrdUVwW8LhUNkZvsi?=
 =?us-ascii?Q?clpXg7/2+bSOjOFenwZl4aUlzzhFrz50f+Kfb2HQRlwfcy33aFn5aBnzFWal?=
 =?us-ascii?Q?FZPCWTjuyZuat3eq7rtkCmDQlMPJyjH5j46/NykQ2zUywHuxDFUO4nL1OUcu?=
 =?us-ascii?Q?eMx6E47/TKbqD9QmVl0rEeTu8mUvUPl6oAZmAfY+JPovuJ6AmwX0vU8OwaXM?=
 =?us-ascii?Q?JGD1EvDfuj2FyhBC/rUoGjqt/wjjtavFgdckJICXXtJwsv7YnuRPyuJyhTbh?=
 =?us-ascii?Q?pjryBbvrglES/TSK0ozkgrtsFCoUMwZOYnz7Us85pSg2dMO5sse+nw0QUOK+?=
 =?us-ascii?Q?0Eqlhll/kc2ndHiX+i39piL3HbO0x/YtpeNBu52QLBE0US7PptfSx+yj9aRE?=
 =?us-ascii?Q?WJAtsXciI3697ORhvAEkM+qcGMp9ZI9ofLzVf7v62EwdlcOxxGVFUbW3QrdA?=
 =?us-ascii?Q?AVQAzPvi4Ix2Ml1u7loIkj/SSUXQt+qKRdG6RudLR0BQO2jU9nzXfhfgWm5+?=
 =?us-ascii?Q?6M6XMJ1+9C9rKBSoVc2xDc7hYU23EBHmrp6YQatNwUSyLFI5RLTiKVutJyfz?=
 =?us-ascii?Q?gNjbCDK7Ouw09YVI22CazBnQeCygfxkhExjrrWmshHYs+hCButPWcwaeuxYI?=
 =?us-ascii?Q?i4m3jzaF61EQoRT3EUEVvAmR5QGKLxF7vC6RXqlnKfQQfOwgte4U+DCcX6P9?=
 =?us-ascii?Q?Q5L7JwgbFDwTPsOn4cQ6NmxNhebN0wr5XTT76+WHvIrGyJIJ6n+3YNx3gcMx?=
 =?us-ascii?Q?BbgFrLUpMjhXlyKlWM0dNTndQlQxaWTH7X8alKHrRKrstXff5Tzyu9JYH4NF?=
 =?us-ascii?Q?8EaZhfpI29Y67vltrD22Ei70BhOeeRUwhx9P18FLuCSCnV8H2RoojenY5+ao?=
 =?us-ascii?Q?WtFsnuQZPsUrSIZJ6zcDJyhgJFAs6oVOGXEWDLe9CqWQvyeitGYHgPyQgfNl?=
 =?us-ascii?Q?f1wPIIDMeWLyfqueZ7qu/Cl0PwEgQFHSwkPUzHhrHOxAyg7AlL1HXwn7RpyR?=
 =?us-ascii?Q?zzm8BvgN+c9x8D+BF+uKr6nmP2NpWRjYVorQjaC+6/BKL6U7+4QamS21ftp2?=
 =?us-ascii?Q?Ka6ybBMZ877x5F1ifslKq7yGBV2fQer1EzAMhQI6tSw4G3ZYuMvD7AGppm04?=
 =?us-ascii?Q?57ON3+EYEDDowtjGiZWQfGu6BBNCAQtoV+eCwMxGwyTQDEBJax+hIi2VobKw?=
 =?us-ascii?Q?d+E7m6UqLZRk2q6nYXpu95vzTOxHTBQOxgh7DzgqRrbMEHS9ekcs4cfIwwyH?=
 =?us-ascii?Q?RA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ca6fe9de-17a3-4743-b946-08dbc6bf324b
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2023 22:54:28.9955 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DIfkhsrNDInn+OrhTPhCSNOf6jBVSShWTINrs1bfzlKx0RvWKpfm3XgXf0xwnrQBV6wRNii9setCg1unhREdG9BW3kMkcE9FuTQLXFtEnsc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5865
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 0/5] Add Raptorlake Support
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Oct 05, 2023 at 01:54:45PM -0700, Anusha Srivatsa wrote:
>Keep the naming convention consistent with i915.
>As part of it making some consistent naming changes
>so we can continue to use some macro magic moving forward.
>It does make the name bigger - ALDERLAKE instead of
>just ADL. But this way the platform name is ALDERLAKE_P
>everywhere which is easier to remember and use.(previosuly
>the driver had ADLP_ usages for some defines - like ADLP_RPLU_* etc)
>
>While at it also adding some missing support in kunit for the
>some subplatforms.
>
>v2: Split any changes to xe/compat-i915-headers/i915_drv.h file
>as a separate patch, regardless of build failures at that point.
>
>v3: No functional change. Reorder patches.

Applied, thanks.

Lucas De Marchi

>
>Anusha Srivatsa (5):
>  drm/xe/rplu: s/ADLP/ALDERLAKE_P
>  drm/xe: s/ADL_P/ALDERLAKE_P
>  drm/xe/rpls: Add RPLS Support
>  drm/xe/rpls: Add Stepping info for RPLS
>  drm/xe: Add missing ADL entries to xe_test_wa
>
> drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h |  2 +-
> drivers/gpu/drm/xe/tests/xe_wa_test.c             |  2 ++
> drivers/gpu/drm/xe/xe_pci.c                       |  9 ++++++++-
> drivers/gpu/drm/xe/xe_platform_types.h            |  3 ++-
> drivers/gpu/drm/xe/xe_step.c                      | 10 +++++++++-
> 5 files changed, 22 insertions(+), 4 deletions(-)
>
>-- 
>2.25.1
>
