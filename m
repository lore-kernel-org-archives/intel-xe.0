Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B76BCC46CD2
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jan 2024 14:54:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6661410E43F;
	Tue,  9 Jan 2024 14:54:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BB6410E43F
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Jan 2024 14:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704812045; x=1736348045;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=6MoTCjMFP2OAX6Dxj753Ok16MF76S45sCdsnw4qLycw=;
 b=VZpsv8FWjlsVavJBWPZ6J8Ng7YC1Zn8pqVq5gL2lqUZH3JZhzgoK3jgk
 YI22GmVACzRR3Ai1450xS3yGjKAPnPZYD8XdThC2+soK9Mhcd7A1JTMaZ
 KZNAMEikeSl86xQuhTpVulzLj9yUYj0KwmKFdUriXA1YSjs6gdHFLISNQ
 AU9AIajzc4bD7Q6zWtLn6FCuafPhgHguztTlWOMomsr1GgfaBbAdDdIPc
 VANosT7PvZBMH9e4WTqH4GxIITujCdKA3JJDHZFsKWSnJGqvdS2iTgSV+
 ClQkh2WIGKo121VtuJ2pwBfHbg72mDEfuOhqlGI5LxNwSV9Zm4OShA1E6 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="484393257"
X-IronPort-AV: E=Sophos;i="6.04,183,1695711600"; d="scan'208";a="484393257"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2024 06:54:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="852209360"
X-IronPort-AV: E=Sophos;i="6.04,183,1695711600"; d="scan'208";a="852209360"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Jan 2024 06:54:04 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 9 Jan 2024 06:54:04 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 9 Jan 2024 06:54:03 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 9 Jan 2024 06:54:03 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 9 Jan 2024 06:54:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nLGpkQhZllNjhY4nuyw1rAV0p0wSyzwOZN9el+YesFnf2VtimmDqQdmdM1Yw7rMymi+8lr1mIqunw5f1k/O+aoR1wCTn9Q6op0nvzFpKLXx38es1JcLv+rTXgTWWgVPAb2zAEwYzRQVhHMtiCIaF+drgvIHUotguNVc4kLKThQOMU/f/RrX06q2ZIioFfrqBuRGFgoaSe6ZLvUAvNJMBWeOhDvmRrAyJTwhU1Z8ijLZ83TRlNMdEgb+2RvYWQfGEArfG+nbjea5UaJw23oK7JgWBQ2GRglNUC93APiMvT8RNDSdylflejmOGrpT6VCDQfXAA4d3pcFDRKXbdDGJ2mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yt+o71317W/9iAOr16hiYTu4212WeqHtc1cIFye2g6w=;
 b=eZOH3QWKK5R05Ng6h7YlXG8IeX3am2/K/mUT0ZcGQh4Q8I9WrcUyuLuryeeeh3gsTh8GAJfJLNqCFKFQOOT8HNznWrZ14votYsSm9UytvUgB137EGxK0vTsCEqjyMNW7qjgrboO7zO8JJnnoKi3xm3aeLtnR8/OoocRE2WjLy0d/4bSdtPS8mH+8BasoTYpTQG229r6OdlzSILP43BGFLxGDw6EBcy4hYTrAH9hZ69Xd6PS/tSuD8/gqF+UPLx2mPN28bCBsY8gYKhch3CRp83A7eWSC0aSqNmDEde4mtSSVggx3D4/OTmvvvzRnQ/myyEdLS4RiEXLoGHSrYot0wQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH8PR11MB6705.namprd11.prod.outlook.com (2603:10b6:510:1c4::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.23; Tue, 9 Jan
 2024 14:54:01 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b%4]) with mapi id 15.20.7159.020; Tue, 9 Jan 2024
 14:54:01 +0000
Date: Tue, 9 Jan 2024 08:53:58 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH 3/4] drm/xe: Annotate multiple mmio pointers with __iomem
Message-ID: <4ud4c67gqg473yrx2do6macpld4x3abggqtg7wzo4i62r3bs5q@d4e2yzw2ptio>
References: <20240109112405.108136-1-thomas.hellstrom@linux.intel.com>
 <20240109112405.108136-4-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240109112405.108136-4-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: SJ0P220CA0025.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::16) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH8PR11MB6705:EE_
X-MS-Office365-Filtering-Correlation-Id: 28cef0ff-d478-40e8-5008-08dc1122d0e9
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: S84QB0HO+6WklaAqfk23qE51+nbJ81cbMTZtLpcsXGqMLGt+PRWSb9AvqWgP4qbeLgJJRrBgsKGsSzKeN1yFO6lFsg0lToaZnyyvq2qZeh3KUTqsk2lzpFAl9LBeAoSocjCjIeSc5hXxXUn3vasT9T1cb3ekWbrIWxAlXRreG+Ajqbw0V7IojxHNkZWZ4QTU7vqJd8avHx0V2phGrJDFNYYQyzdpII+09Sz2WF2Ref370jJ4CziULjpz4h+wpCrCpuv8cTgO+mRfP9vNhxlFcWwkz8H6mqYF1eME5pppDwGXuv6TZdDTyNWaIefotdDCuW1XuETriK6oRWBQxKCZz7ceRLHTqHBkjlNjXGyelkvi1RSSQDNap5R1Pq3neb8QMyCEuw7wlLXsyGMaSxj8PJYoNKRElnKe/sADowsMcBXVEXA+ReObQnXdJ9nUoHOJs/Ef5EDs3y1zX0RRCg7w8wEG6WeoBywTvXDuWl3FVsRXw04u3JrOqezsJRusrZD9aqsm0+B2PIsus4sxFnVZLO2TPF46xmHoozHik2DjumGStkG0mMzZjn7BPwCq6L4HQ5Ae4jtlbLL6hZOWPqZoc4vrQm28T5yCPiyJzAdNLEnZE5P/+yJ/ZCTLybJbJmZc
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(366004)(396003)(376002)(136003)(346002)(39860400002)(230922051799003)(230173577357003)(230273577357003)(186009)(64100799003)(1800799012)(451199024)(478600001)(6486002)(8676002)(8936002)(4326008)(66946007)(66476007)(66556008)(6916009)(316002)(54906003)(26005)(83380400001)(6512007)(9686003)(6666004)(6506007)(5660300002)(2906002)(33716001)(41300700001)(38100700002)(82960400001)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?1nsowCytsQaegYenJ+PTJGNh116j5QGTyclcjGqF1Qir/scpS+49pd4IGr?=
 =?iso-8859-1?Q?4EoU0ofW5isVwOzwajUFoDoiSJCUtKdSBr2sqZ432Cr/+tZ9z10K6Ra/VZ?=
 =?iso-8859-1?Q?e5dl6bLzApD+VBN8DSzWIZwjj1SqLgFyTKfyaL5BbqaiiuLSdi/fQYyPZh?=
 =?iso-8859-1?Q?Yp3uno5QMQeAzqb0QhX2cYTtyvZCz4atUEYvd/UwJz1dGWTRgi1kkFqFmx?=
 =?iso-8859-1?Q?BSIpMbg4qwVsmZFOGXg5I880I4nPsnMMQT4wLebh1BW91ejAD0Zt3fC7pg?=
 =?iso-8859-1?Q?fBl5Wwem9IfxFXnw8mDCmWLuN0NXJTyU9frSwC2PvwBqh1g/nGAJ8r/uTn?=
 =?iso-8859-1?Q?9t1eKxJUEUaGZb/BPEfSZR0xmCM0Ll2Nx8YVV+bP5DMKLUjwCH2HanopVt?=
 =?iso-8859-1?Q?A6q3/oTd+YSPRO96pSHvFAUFN0u+ckovi7DE5+qN7cfeVoAkTU4eAv1QDb?=
 =?iso-8859-1?Q?YScy6Dosdga14Bwnbp6XWMTcnxkkzt6Asanw7iIj6pyadAD0GziKEaCbPV?=
 =?iso-8859-1?Q?dANFMd3YNhHeAZxPiz9lWqBbwxh93HaKrGzunarAIrWH1/11QXNoAgEme0?=
 =?iso-8859-1?Q?inILYbA7sNlfODMOsXdV0UMSivo3XYF+lxDRoKTdCZ1p8BGGcdt49ilzLv?=
 =?iso-8859-1?Q?auZnwYJ7ZZ7VfDMDrca83QWayl+wVZFzkZIhZvmnD9oOVGJPxcKhXRMicd?=
 =?iso-8859-1?Q?PKakr45ZxMBfKL8/KzegIljkd9MTOM6iexUV1/lX5wnxl/m5shsG8sfXdp?=
 =?iso-8859-1?Q?cOj8mYkfTtaZ/on+bJLnr9gqhlqrbmGMNGhHAkRMj0q9kv88LKlYr1mSsI?=
 =?iso-8859-1?Q?Dqjg2kssAaMSx13TPLJI/zdNY5pDQzh54tjZ26SCByFo+SqSMRfTa1mHV1?=
 =?iso-8859-1?Q?1pQkhm5DmYyjU9tyvpVWnfLBCBLYyR6YuD4AAt7fZcDTku3/BXDAcYf8/J?=
 =?iso-8859-1?Q?DRsoTITw9FFoSlJpbtEIZCoxeV6j/Ec6hW50F2akfhB3TB/j1Vkqq2p5jg?=
 =?iso-8859-1?Q?7utiliW+2Sp+6U0YJQxW2WD6yv30alRgJZ8C2jgM6Xhl2ZKP0iyfdvX9TW?=
 =?iso-8859-1?Q?n1pPWAiUpDyX3h/LK9ZcqpxzzPtX64D2PbiOaHIKRHlkmrYuCWF4vFyXbV?=
 =?iso-8859-1?Q?r/648AidLxnwvsgx5RzpNLdZwnaI2X4+pZEkpSkMNUYaWMCrXyE7pD0pz0?=
 =?iso-8859-1?Q?J1E2T4ZzLGqfJONj4YYv7Kg2gyibt3VY3zRgXQ4GzELSMybV/bxBiiqObX?=
 =?iso-8859-1?Q?tRyjEQW4cgKuxk7T/GyF8Gve+8qq2rY6v+B1V1O4yfBIB9sqE5Dj9rq/CH?=
 =?iso-8859-1?Q?669vR/cTvRLMcUAb4/6LE13hQrugeIdaQUa2f4CstpDMRWc4TVbM649H/A?=
 =?iso-8859-1?Q?Po0fog6WK2QgCQC1JKcJRbZQYpa+DeCRkXPNxUhKDjd8QVuqZOI2ih3/w4?=
 =?iso-8859-1?Q?4gdjILTAhxjIMnSTVCYJqxghInYY9kWrGzswZRxIMclFV09xivdc/dhDaJ?=
 =?iso-8859-1?Q?4GBf3lTi0F9/79NbVp7uewaZNFtY6v7k9OCGlWsBP0uVztnZ5BaYdA65YO?=
 =?iso-8859-1?Q?y4mx4asm0/O0diNmJ3mNrwm25EOejTGLuct6xdjWOTwjNWmj0oxL9GLlgh?=
 =?iso-8859-1?Q?ELdbpkahq49se/5LK7QeiBafjjMqpUb7igbn8rbpnZYAEKBH2+LUMLSw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 28cef0ff-d478-40e8-5008-08dc1122d0e9
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2024 14:54:01.3939 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KMAFap3FyV3EzHrp8tH+fEYUjNj59JrJi8KlXTXFMo39EW4V4wQHnYPqK4AvM5QLb3sfCcDqmzAxyCiKc4WoQI58Jz5B7rV5MHGiY4kVbPw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6705
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
Cc: Moti Haimovski <mhaimovski@habana.ai>,
 Matt Roper <matthew.d.roper@intel.com>, intel-xe@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Jan 09, 2024 at 12:24:04PM +0100, Thomas Hellström wrote:
>There are a couple of pointers pointing to MMIO space. Annotate them
>with __iomem and fix the corresponding sparse warnings.
>
>Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
>Fixes: 3b0d4a557996 ("drm/xe: Move register MMIO into xe_tile")
>Fixes: 399a13323f0d ("drm/xe: add 28-bit address support in struct xe_reg")
>Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>Cc: Matthew Brost <matthew.brost@intel.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Cc: Matt Roper <matthew.d.roper@intel.com>
>Cc: Koby Elbaz <kelbaz@habana.ai>
>Cc: Ofir Bitton <obitton@habana.ai>
>Cc: Moti Haimovski <mhaimovski@habana.ai>
>Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>---
> drivers/gpu/drm/xe/xe_device_types.h | 6 +++---
> 1 file changed, 3 insertions(+), 3 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>index 171e8615d184..e0da2e3ca426 100644
>--- a/drivers/gpu/drm/xe/xe_device_types.h
>+++ b/drivers/gpu/drm/xe/xe_device_types.h
>@@ -147,7 +147,7 @@ struct xe_tile {
> 		size_t size;
>
> 		/** @regs: pointer to tile's MMIO space (starting with registers) */
>-		void *regs;
>+		void __iomem *regs;
> 	} mmio;
>
> 	/**
>@@ -160,7 +160,7 @@ struct xe_tile {
> 		size_t size;
>
> 		/** @regs: pointer to tile's additional MMIO-extension space */
>-		void *regs;
>+		void __iomem *regs;
> 	} mmio_ext;
>
> 	/** @mem: memory management info for tile */
>@@ -306,7 +306,7 @@ struct xe_device {
> 		/** @size: size of MMIO space for device */
> 		size_t size;
> 		/** @regs: pointer to MMIO space for device */
>-		void *regs;
>+		void __iomem *regs;
> 	} mmio;
>
> 	/** @mem: memory info for device */
>-- 
>2.43.0
>
