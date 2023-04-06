Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE4E5C7618D
	for <intel-xe@archiver.kernel.org>; Thu,  6 Apr 2023 21:28:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADFC610E354;
	Thu,  6 Apr 2023 21:28:07 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D842210E354
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Apr 2023 21:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680816486; x=1712352486;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ETIjnqmFj+N80f7nurAh6Tuv5k5Dpm/86aK2p/MosDQ=;
 b=AbM/lwJu9P1nH60Kle/XsK4sylPXvzunrlVo/wYZw6YYI+TJOppEAWgP
 yruei7Dc5GEoCdcS1a9aord5d262/9OYnctVaQ8YhS9TlZP5WklRhMcFA
 AJGsWpHwiHYV3RXGemzP6kV9rk6OtX1A+rQgwspWuGYZu6CGMW/ipn/VR
 triVx8g7vdjOCRQNND9Ii1juKuwjDwKBj83pD1qaTiK0XV1dPGp6YMsOs
 kzc4XqIOA7j4uobg6Ofs7oxgQw9h0pyz6GVLfzNEvuWW9S35pJJ5zrowC
 gGvQOQR7QqRxGBhJv3e3BJuyIj/kfvGm8cAakVZ3tlvFOlgZvYxzBaMwi A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="341593438"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; d="scan'208";a="341593438"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2023 14:28:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="933344590"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; d="scan'208";a="933344590"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga006.fm.intel.com with ESMTP; 06 Apr 2023 14:28:06 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 6 Apr 2023 14:28:05 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 6 Apr 2023 14:28:05 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Thu, 6 Apr 2023 14:28:05 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.170)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Thu, 6 Apr 2023 14:28:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aHBlrz0/0Q5FzStvpRbl/HXHkJAAfZXfLwhu4ILIeShlZrmMCKfnuwYMr+NcKDlp4v7SwBufvEf8Dn+nrKS9uizdtv/d+Xc4p6b+zjY5kY+7j1JNFNY+Y3bHAc7evh6IGDb8uiyLPQlmV0uaFMzLIquEAUh077peyyHI7YR/ilwGOe2IoYHC95r0m4Hll1CVaDbN7OOrLwKMk+ltKRsAqRvxpbrVHp876hVL+tcrfw5ePQWw3lhrEbbYu2RQmpHO1ALIB1yKcyAoq7okvCYfRf4R1dUE/t5QdKXjFeUoxcHMJwRogOH0jh/aX2wBS03aaSIAi3xm6GTT2aCmgj56Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WUhnYEKUOarL465089AtvBiY5uxzX1VlNV11/my9PUI=;
 b=luk96FWoaBfce56Vvtc3dqcmgOlPKeSC9Bth9E9yjYc47fRMS+P8SzPM1U3iUWAUMYj22wKDOUKQsq8Ij1XUAWbfU6m8LlfyM4t7a9plWTIN6zmet8O15/n1WZmweofyCbQumA8Ghb1fKKyWNIxGs1oXtTjOza6BPyFwsPg+idNPUbub6wksRU5Q/qikGAlTz6RAFgOilwhBRYqeE+VuL6W0YbITEQkSlWg6z+FuwendS5YtHr3gJGvlmyJIN9dCYlYNDRcUQ3vJOrdMa8ecGYG7TO6qa7nffyQrRkiUPnICcxh731UrC2yPDpDRtum0g6YQVjpSTQTrP33ySdyIEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA1PR11MB6941.namprd11.prod.outlook.com (2603:10b6:806:2bd::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.33; Thu, 6 Apr
 2023 21:28:03 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745%6]) with mapi id 15.20.6277.030; Thu, 6 Apr 2023
 21:28:03 +0000
Date: Thu, 6 Apr 2023 14:28:01 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Message-ID: <20230406212801.hwbvrycttj6eqgmb@ldmartin-desk2.lan>
X-Patchwork-Hint: comment
References: <20230406204841.18774-1-niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230406204841.18774-1-niranjana.vishwanathapura@intel.com>
X-ClientProxiedBy: SJ0P220CA0008.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::17) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA1PR11MB6941:EE_
X-MS-Office365-Filtering-Correlation-Id: 3609fa6e-be2c-45c6-38fb-08db36e5cde9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: y9XGUjdLi8ybn3v/4tmtuAHKHp5LzqD8JBNMiv2OajAJX9KpeZKLvMUlmLDt3UsD7a7ogp8KQJBUdrpv33UJ4CrbrRTbsB4i3XfmSVaEtYkDlB+g9ZZrjPHzleG5XfDhpH4TYkDMtFfMD1F3L/vdOhPQnvWqiG221qnYqPJAh7DFt6gW8Q2HIziN3PAWYo+SzewjOA0eGwzn8HmNVsuZAT69mzVNG1TTxso2bVhuu1XYmAONxJ/8awX+3FN5deuMG5wmUkZPHqKyzXeuGcMMJcH/JSiwMTv4qSg7Cy/J08KEd8nlPLy9BTgZGoWbvUPjN7Ucyh58jrQZ2UZ9XwD6XOPjfWvPlImL9FzFyL7QfjqCykB8WhWIk/smCtNB5eJDx96Bhsr8yNbh3xQu2fUcgaW/zq5iO6/Cd91W0shVfTQJtKW+o2npNyt9cHM5DUmPKGGw6jYhMT37+Ca6s2ZDI81w2finxkHwxcRfgHgwil8MmiSXzk5Oyq+mPLad/Ot6dB97ESnRP9cI1obcEmXV5A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(366004)(346002)(376002)(396003)(39860400002)(451199021)(2906002)(8676002)(8936002)(6862004)(41300700001)(82960400001)(38100700002)(5660300002)(36756003)(86362001)(1076003)(6486002)(6506007)(26005)(478600001)(83380400001)(6636002)(186003)(9686003)(4326008)(6512007)(66946007)(66476007)(66556008)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mOKUt5dO13MD+MT+6kI34r/FscTFD9J+n6D/IdSnPKnJIpYaQQn7szaFhKew?=
 =?us-ascii?Q?WS97v09GlfOy9dnDrmYiAB3ZwGyX4pTVJc30vSr0CFKaHaF+wWR/KjTRwtjs?=
 =?us-ascii?Q?ZTLyEdYDRDgAIyovOd4WRYGLS/xxUhIEsi9BUn7F7XGHPWPWLfbQhM1SZCuo?=
 =?us-ascii?Q?uBRq5ciY00SSLvcbNNLpEy7d7a0YfhtxxnZ6Kyok8lv2O/JpuUa1lZhxkqoH?=
 =?us-ascii?Q?OsBMl0qiM+bRd9UJgiDJWaWGoRE5cOejYVU+HudhOgWEhIuT1Cxa+QzCWvDk?=
 =?us-ascii?Q?8KzSthVJfW2dPzmVuzevyiYh7gttx+C4xxXi+gvpKpDHJV7qOQBjUHnnQAX5?=
 =?us-ascii?Q?Id4Ty+McPtoYcmIf6BZ+yFTYfyPpqYkP/jQpdnJ1j/Q0xhgmO5TwZpAMFJXR?=
 =?us-ascii?Q?WZ4e7uuct734aGVUkVUwLshL0TlhTr9m8gDjeOuaMQDB4IjatWmTHb14Zh5o?=
 =?us-ascii?Q?T03fXl/lwdcKUSnOxTc4GJDXDSalAPNaVssghop4oLz2YzKBmdG9IH8BcxnS?=
 =?us-ascii?Q?R3zB2Ki+eKL8uWT4G0c3b7VPTPT2nxg+0hx+mNGHrL1hN3gxTOPmdYusYFtk?=
 =?us-ascii?Q?8jmhiBXSpyB8EWx65bLQJ9QcbzCRI4Ko/ssUOkzks20Wv5X3hjT5wJ03OF8a?=
 =?us-ascii?Q?v1B6IyiR8HILzTBnflwadskt/79ncGNBNgim70j3eHtiDT5SrOzfS3jatiYF?=
 =?us-ascii?Q?elYi+SrJIMcYcvN+a9nT+hkRuwvjHFmsSOI4fH+yoT2P7FFm1SYgsCHwD9Pj?=
 =?us-ascii?Q?I0LM2OuuUNgSdy0r/C05MqYgBrtNNxzHVh+VW6QE5OnV6HUer4dDjbwHC/tg?=
 =?us-ascii?Q?BVCk7QqpO3udt+fi7JorMOA8tyabqM9QyflUcI794Z1OomqHxCu9Uw7wvRkk?=
 =?us-ascii?Q?zkAlziyzrzVMaT2kL+KrFnB2NOb1MdqNINuM56Bxq7FuINZyb8BpVakQTCGd?=
 =?us-ascii?Q?ZnQjvdR+sydquLhAFaDeyERGgoGAcACMQ51LMn51elkU8JzAxvxRtr9pVcMS?=
 =?us-ascii?Q?NTf/TClJjArHz7mLMOiu7Z2tpeTkGwewu66W9k6ZICiPR9XE6tf9NSlAiShw?=
 =?us-ascii?Q?bCwArpTHkgozVSkE8AzSpUhP1/wbeNwanyfwnetDuNWwxVfMWbtVnNSOOXJb?=
 =?us-ascii?Q?4mG8zEFGICGEi3C3wFiQpu/jd0akFhM1Z4UbOnvwuWuAWwbllmwL/DzCPB5y?=
 =?us-ascii?Q?09y7sV0KUv+2uhl5Hyf6a7yqCYREbKqtwA+FuiWS69cCIWK6f9F80l/B5fob?=
 =?us-ascii?Q?IoWHPkFY+7iEBW3NalL0GvUF8nZ9u3oGMvgWldW4d6dPtOAOTFEK+qafHm5p?=
 =?us-ascii?Q?299sfpa0YvUntSo2W8nGpYbX0zYGQCY0zOKZ7ZMZmStzQuhxyvko9WOa5x4R?=
 =?us-ascii?Q?JrX3XDFC/yjtF2vn8ksB4Fr+jSdpp+SPVp+X/yjtq3Fcs0owYehGzlqx9El0?=
 =?us-ascii?Q?lobAzf1Yo+/33JtZyrau0PLplybpCaPDkIS5yOjlqi5iERQ4cFbUgopxatZr?=
 =?us-ascii?Q?D8dNQAMGRtLRWOnswfzVuWLGEVhL6RekurGQobKHkr2/jzsIDzy5iiHLvSEf?=
 =?us-ascii?Q?BlrjerL4tWMfGj3S/7uAawVTYcoq7ueIKl+YCSPzfiaIQTwj9gm0QmtRlWpq?=
 =?us-ascii?Q?RA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3609fa6e-be2c-45c6-38fb-08db36e5cde9
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2023 21:28:03.5704 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qfCGw9b1q4fK5k4JZnARind1Jv5K9sy9jpJoy2l1TzMIaJIH1YO3hVNx1KTHqx1DVk8L2gfqQl0qS4jUyYxYgGWWLCfznL5wxfCS6kb+LYI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6941
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 0/2] drm/xe: Revert coalescing of GGTT
 invalidations
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

On Thu, Apr 06, 2023 at 01:48:39PM -0700, Niranjana Vishwanathapura wrote:
>Causing a bunch of hangs driver load and in user space.
>https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/232
>
>Benefit is rather small too, so revert it to stablize the stack.

For both patches:

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

I'm actually expecting these to be "squashed" in the original patch,
i.e. that we will have a rebase removing them from the branch. If that
is not the case, then you need a much better explanation in the commit
itself rather than on the cover letter.

Lucas De Marchi

>
>Reverts below changes
>drm/xe: Pad GGTT mapping with an extra page pointing to scratch
>drm/xe: Coalesce GGTT invalidations
>
>Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>
>Niranjana Vishwanathapura (2):
>  Revert "drm/xe: Pad GGTT mapping with an extra page pointing to
>    scratch"
>  Revert "drm/xe: Coalesce GGTT invalidations"
>
> drivers/gpu/drm/xe/xe_bo.c         |  1 -
> drivers/gpu/drm/xe/xe_bo.h         |  1 +
> drivers/gpu/drm/xe/xe_bo_types.h   |  4 +---
> drivers/gpu/drm/xe/xe_ggtt.c       | 35 +++++++-----------------------
> drivers/gpu/drm/xe/xe_ggtt_types.h |  2 --
> 5 files changed, 10 insertions(+), 33 deletions(-)
>
>-- 
>2.21.0.rc0.32.g243a4c7e27
>
