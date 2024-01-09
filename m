Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ADEBC46CD2
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jan 2024 15:27:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0ECED10E46A;
	Tue,  9 Jan 2024 15:27:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B09710E46A
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Jan 2024 15:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704814053; x=1736350053;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=tlU74mZZGnJGJ0sbN1hJR1atXUXkoDa7wxiXwTLoGTQ=;
 b=m82cduIU4UV/To8/KlOHnwB4HUid0iSpxgrVs4Cv5+c/YKOzRb7GR2o0
 3EGmUyVrVI99i9QpR7JUYS8nfhs54avh4IUpiJXSxWSGNRsNCJJ2jCMdY
 U16ZJ42yFGw4E0xYQgoW+TSBgQproqvku0W+3c6IO+aFVreGHmmqTzMkt
 cP+UQcrBiqWhsS2Mcj6Okv97iqZSkytSd81WL47ys5tRCtIY+K6sP8+O2
 Oc+DGfelZsnch4S5Ga9sQBZQy/ma+LyBTgTmUaPMNFvjrBY8RPMqiC4Uu
 kce0jCUuSGaoJm5i1Z8GlxCXTIcgzt86JEZhf1R5XEnoFUH64eI9APDSM w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="464630040"
X-IronPort-AV: E=Sophos;i="6.04,183,1695711600"; d="scan'208";a="464630040"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2024 07:27:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="925301983"
X-IronPort-AV: E=Sophos;i="6.04,183,1695711600"; d="scan'208";a="925301983"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Jan 2024 07:27:32 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 9 Jan 2024 07:27:32 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 9 Jan 2024 07:27:32 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 9 Jan 2024 07:27:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EBEPAUBakfi9aIbS34spJ1lOAlODfa7zpj2W3lJmfwORrf5EZVZRnFqI73719ta/17KtRp7fgYqXVPgRe8cCVOqMRfwNLAitRC77fWygIMjruzpSA3aa+4h1Gu80EEVLbiht7fjjDSpyxJOr8lDnuA4D0G17h6K5vXzNE3syFandKJ7u8oGld1ESlrL0h2if4bwjHmVix8NYllBHd8+eezfPS/tFWXpPnhHn8LeUfRhLKggDGu/cZjzZKFvbaAJ/2tj8q5VZvX+LGXH2AMbqMGeCtg2/5qMHpirG8SDi4yZqU9IlIyvvcs5DFjprLhgiP3R8Sq5xviirQPWgc/1YsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=54TulCW00tDe8K1gymP3RcKefjMKzsFIo6QLF9TwZ4o=;
 b=bfLV7JLQUGMeJh6PVdeawgeOOAw+gloU3DuBljUP5MjzM0SUoZCnU5SpgxzF04NePrfBsS4FDhl0N4QHtG4epZ5AcwTc742pssiobbdbGxlworYPDLJMSL1g7j7A0h2+lcmryhYZwQz7quQAgBl+po1389t5jXulKF0fyh08ZXTO8omNagAGBIuT/XZj6V8SF+KF6plKp9Mmvch8T4UVjYhG6NmObv3QMIT1TiHtvD9ZqIJtb1aYQVdedUI+8dIgZpJDL2o6JaWxJV+wZ/BLh3eHsrc7WhZNbh7FsFOWQrc9U9dsFhIJubnp+qkxpNJOzVko4ZM/dtK+J57R8oD8FQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH8PR11MB8259.namprd11.prod.outlook.com (2603:10b6:510:1c2::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.23; Tue, 9 Jan
 2024 15:27:29 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::2157:7433:d32c:a8e3]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::2157:7433:d32c:a8e3%4]) with mapi id 15.20.7159.020; Tue, 9 Jan 2024
 15:27:29 +0000
Date: Tue, 9 Jan 2024 07:27:27 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH 3/4] drm/xe: Annotate multiple mmio pointers with __iomem
Message-ID: <20240109152727.GJ3529480@mdroper-desk1.amr.corp.intel.com>
References: <20240109112405.108136-1-thomas.hellstrom@linux.intel.com>
 <20240109112405.108136-4-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240109112405.108136-4-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: BYAPR06CA0038.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::15) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH8PR11MB8259:EE_
X-MS-Office365-Filtering-Correlation-Id: 00a7e595-e875-4437-a324-08dc11277df8
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KZm7dF/vIYDcFJ6jUhQAJku6arDbpNqww/MdajrG+t2evN6s1cb/6Ad8TeShWw8p+UvlF1U37VVMchhn8fFpiBv7BsqZKWEnGablNZAe+seKAMjx6tZWELFHzsMi9U8NAw3jcs/b5UgEWaB1MnxgZhi+ISc0zJSPX/mPrBfhmrcfptALy9K0k4tw/Z5rEl5WZBEyDQmV9AcQpoqPPWSmevxHRAdB3UOBjm8fb3/ye8m9ze7STFP8bMZZtCqeZs7L8t2gfVThUYlpVOpPrfNV66Vpmi9ENFc2fTH4+Wj1lpOB2z2Gk1UC3vULtN4rlDiVDjJ1elXiaL/+8ycUKfbun0zdgKQjMdcQeDMPWPNdzv7mh15sZIsAPqS0ghfobSVhtXmCon5O/nIOIIOEHbLYAl5bBsQLyBSGYLNsr8lhlgS9qflOVhyzecENFn6LN9OI/EHS0qH+JhuJjD/K3O0SkQQ11t87EEa309eIbkVX/zY3bIkbZZhlflCeDTfvofDhVkn6DVKB1tqbqyGCRC5Cwh5NIYoiOzwa6Q7vUNblC6ZNUIzCeNxSeAmop7+Oe7/9qec5gk/rETiUh22dn+G4jsLCEScy+GkihS8+tFg7zyTRLSHxpo98XsrBGY7dPwRm
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(39860400002)(376002)(366004)(346002)(396003)(230922051799003)(230173577357003)(230273577357003)(186009)(451199024)(64100799003)(1800799012)(83380400001)(316002)(6512007)(1076003)(26005)(38100700002)(8676002)(8936002)(5660300002)(2906002)(478600001)(6486002)(6506007)(4326008)(54906003)(66476007)(66556008)(6916009)(66946007)(41300700001)(82960400001)(33656002)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?FeMT4S7pjKGEBDJCvrWuEGghJaSbbX1EcxofON71Rt3o5pJlcxZzereDPH?=
 =?iso-8859-1?Q?uuEDEOmMmoaXGr142TYqUgP82lGg9UZ4HfFSR/ffoQzFAMl5lcgGhYZcAw?=
 =?iso-8859-1?Q?/Vfr+SuqQ3U7jyy3cMy/nEM2TXAVO+BDaaM0TtpZLYidGSG4V/SZ9tF/da?=
 =?iso-8859-1?Q?16lvJ5P+R7l7N/KhKVnhSC7xKR/v8CL6StHYdZGo9kjaUf2I0+04GoHxdb?=
 =?iso-8859-1?Q?brW34hr3LiF6UlR7fCSLzhIciMqsYJ3VwvdHvsmVmXzn3/fWLp3diU8F2p?=
 =?iso-8859-1?Q?CPh4oQGb4RiyHn2zRBo8nOJtcqIYeNjHHkJGrqXvee8NMIJb+Xh2jt3OTd?=
 =?iso-8859-1?Q?4q19pT4GTQe9Rrbc9Y4XCa4L6Vrzvj2T+vXPuELZuo8/LgYR8RpmODelk3?=
 =?iso-8859-1?Q?thNS9gnSuZt1+QxblWiehLhAqR6rpqNChspcSrpKeZ4wTsg+RS8+e9j/gz?=
 =?iso-8859-1?Q?b56UHATkS2yS0WXf3Sk+U3AdR9GO0W0AMqGW7dJIeSmdfDMswxbj/ZdLfq?=
 =?iso-8859-1?Q?IanIOkGxzgbNzwsPXlLcBE+Vp3knenHMYCYnshUQVF8mkUWZR8ETGMmLWy?=
 =?iso-8859-1?Q?Wov2ZjNBg9t03X0XpnWdaKL5Ae6UZAMtRXYHRgTEdcsD8iZAhIg8aWSEdC?=
 =?iso-8859-1?Q?rWc2KUdOaf93147clB4nJYOmCojmUoO2aP6LZahSpAekw+QA8tzY1hN4TU?=
 =?iso-8859-1?Q?cRfjCe6LrmjyNM1IPyGzL4YY8wkIW+miAYrv7XCQXwfBNBdBvjSAo438or?=
 =?iso-8859-1?Q?XjACFu0RYSMoFpXKwfaukGOzHyu4R0jl1TpHbUKavtCoUaJU9UTncQMblL?=
 =?iso-8859-1?Q?IMYwWud7bU15M29KAGH5E6F9e3ZkuHTSsnJhsSuVbGKB6MYpLNq+cnUch7?=
 =?iso-8859-1?Q?vX9pUnlk8Iuf6nNF+aB1WMeAFz6GXTCng1YUOC6poxk7GrFxSldMXh3FXP?=
 =?iso-8859-1?Q?RnGu+4UmdJlFotCNyLVX3iYiN/EVLR2WQi7N1Dh3EdjHpM6paL93H22Rm2?=
 =?iso-8859-1?Q?qFcyEMrF3Jb04vt02ZnWzjhaNhhczcOI9YxAj966NN5zIw0VtHBrG8FRP1?=
 =?iso-8859-1?Q?TZ6757M1HqlcOQtsG+//UhqZM1KYAnanN9QSLAdd7KMjiD852V+/X6M7DN?=
 =?iso-8859-1?Q?oI7oy3ckGDp9UpVjbbtGuA6CVoGjCZiOH80YMHMdnJrI96V+F2A+ykFF8C?=
 =?iso-8859-1?Q?ahD3vQTInNH1OMziEmWquGubzONgLq8xfOArF4SaPuTBJt63gaOES1xhia?=
 =?iso-8859-1?Q?KR56ffWBtCuLDlgy40FlpC46qEkzE9VTS6tV3eQHW/e3OceOo4Yqc9azFG?=
 =?iso-8859-1?Q?vi/D6CQnns6YWEun3MFWuWxGdFmBZzKMZnm1HL2vszu429N8Zhl0inS6mJ?=
 =?iso-8859-1?Q?poVw/cDeJRVLNNb9YXE6reYj/vQ/jicp6ys2BoJVEgk+zKj9oYTwV1SqSu?=
 =?iso-8859-1?Q?NrEkjt6djwlDoe+j+SF+q5ZhQMRFP8L9kUHbx7LRJabusK5lzx+DlaRgfC?=
 =?iso-8859-1?Q?g8HMHubve596/YQR4uMDJbah+3AB6ASpINpq/KOB+1BSSpokWVmZ2RU4mS?=
 =?iso-8859-1?Q?VmUBP1PLC9D6l5PzvyQ4DZQd3eI6qViudKelk/k3+gBwyDftAkUz6eDkz4?=
 =?iso-8859-1?Q?eoKNkU6JYJfL5k/KV5viYvl0bJ748z5K9TPRelQN9XdKPT2GopQ17shA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 00a7e595-e875-4437-a324-08dc11277df8
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2024 15:27:29.6572 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: phN+Y2l5Fj1Z9fxXj5c4WFM4RrkcVjDGyTNS4lIzQFmDgDxSN55n5DzHZU8f+O1MFL5ZZ67bClh9wG4bKK5pyksgTwoGJ/u0niOlL61VOJo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8259
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Moti Haimovski <mhaimovski@habana.ai>,
 intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Jan 09, 2024 at 12:24:04PM +0100, Thomas Hellström wrote:
> There are a couple of pointers pointing to MMIO space. Annotate them
> with __iomem and fix the corresponding sparse warnings.
> 
> Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
> Fixes: 3b0d4a557996 ("drm/xe: Move register MMIO into xe_tile")
> Fixes: 399a13323f0d ("drm/xe: add 28-bit address support in struct xe_reg")
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Koby Elbaz <kelbaz@habana.ai>
> Cc: Ofir Bitton <obitton@habana.ai>
> Cc: Moti Haimovski <mhaimovski@habana.ai>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_device_types.h | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 171e8615d184..e0da2e3ca426 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -147,7 +147,7 @@ struct xe_tile {
>  		size_t size;
>  
>  		/** @regs: pointer to tile's MMIO space (starting with registers) */
> -		void *regs;
> +		void __iomem *regs;
>  	} mmio;
>  
>  	/**
> @@ -160,7 +160,7 @@ struct xe_tile {
>  		size_t size;
>  
>  		/** @regs: pointer to tile's additional MMIO-extension space */
> -		void *regs;
> +		void __iomem *regs;
>  	} mmio_ext;
>  
>  	/** @mem: memory management info for tile */
> @@ -306,7 +306,7 @@ struct xe_device {
>  		/** @size: size of MMIO space for device */
>  		size_t size;
>  		/** @regs: pointer to MMIO space for device */
> -		void *regs;
> +		void __iomem *regs;
>  	} mmio;
>  
>  	/** @mem: memory info for device */
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
