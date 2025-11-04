Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0FF5CCFA07
	for <intel-xe@archiver.kernel.org>; Tue,  4 Nov 2025 16:14:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB2D110E291;
	Tue,  4 Nov 2025 16:14:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Yl7p7q+h";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71FB810E291
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Nov 2025 16:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762272842; x=1793808842;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=3e4MClq3BBTMBA2QaqCI07WfWnGl8XLOojx6aomuRHc=;
 b=Yl7p7q+hqae2QqIfOJ6qMSdLpMIHd54Fv71k7ESr7UJKCFXFgDNw8vuU
 JlgmCObdYgUcKhUHQTD3MzSq2nfvA5YhgikPuoXDmeuDIVKHh0S4Cjfy9
 hQKkB5UojTTL5edFiMxvchLdrwzBVbM+gTLhD5NsJwltg9duun7XlQa8L
 EHeTnEa6l+0xIWj5PFBFjv4StcxlaZiEe66n8OJ8M0iA80UT8WXq5H93t
 sOitFgnJXmd5etrEQuXwYzcOWVzn8ShsJWLc9rmGW6pSxFYcX2G8gQtH3
 t3KtDoQImasrsbBAZYgvVf2Lkyrq3A5PSz10TswlmTj87LLuRdKRiWz5N Q==;
X-CSE-ConnectionGUID: WXI/cGvaSDyyCzq1OsTEiQ==
X-CSE-MsgGUID: MNtQ/rIqScmYWioH+JoWWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="66987997"
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; d="scan'208";a="66987997"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 08:14:01 -0800
X-CSE-ConnectionGUID: h+LCJgauQWWERjlLscs4nA==
X-CSE-MsgGUID: cl9XoqppQUeNody6zg3vRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; d="scan'208";a="191548341"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 08:14:01 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 4 Nov 2025 08:14:00 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 4 Nov 2025 08:14:00 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.70) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 4 Nov 2025 08:14:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ixtIM5eTaBm0eRYRgFWoBsvnobVEH0g5OzNe3N8rhCjb7YfsIAvuBKg8XKeIEXID+zXzyOFOVhzx5YDOr0rLd2KtioU5F4neJaSU2pOjgSIFdsF+RSUL5X61xCw8DVucTykqje94DJvq4Y4k5n3gTXptcOvwPMTNfMcB4hoYG0jHszT3jjzcU1JAga6v13lPiFdPSqwspUowN7rc8Adm0WHyOsiG3pltIIPB6IQW+d55XCNx1EpkEYJwZeCN7c7Vpbe24iJIPV4ghxy+IHfWgij345uMW///v0vbmn+yud41Szvr2jUxwGNUlcEOzZWMUIPve/iH8GOHdc+xIYVZeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3e4MClq3BBTMBA2QaqCI07WfWnGl8XLOojx6aomuRHc=;
 b=xZIS+TdcCHiCgUs6YGiYBv5vDyPKZpRPqHVRAi9ywyNNRW40l1kHEwD7m20FQBW+qWfxUx9FRkxoDw0C60AIN/pMh886J4JxnpYMaySNErkN6MDehQXSc50HrIp/Dh3cjKTSYYbluhshAl23RTiOwaOJxPkq97ESriTcSzWGfvm2c/d9e9Uqm0sfKhvzn+ckeKRsjzsKSiR3M5UTu6F8u2tafcyVkPSYnSjCkvNcdf8GARxIvXatoNNaAdleY9pLCMWOvIGVvq3/mOduwZlzWIhXtiti/dvM07PREnjUFWcD4SRDdwBD7+z9a8uTOCodcneMMSyW3nR8GEdiIrMWMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA3PR11MB8917.namprd11.prod.outlook.com (2603:10b6:208:57d::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Tue, 4 Nov
 2025 16:13:58 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9275.013; Tue, 4 Nov 2025
 16:13:58 +0000
Date: Tue, 4 Nov 2025 10:13:55 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <stuart.summers@intel.com>,
 <francois.dugast@intel.com>
Subject: Re: [PATCH v4 7/7] drm/xe: Remove unused GT page fault code
Message-ID: <i4tv5tdo7jbu4x4ecdhpossmbd7z4lizyia72oaqemriuol2rs@c2p264pspw25>
References: <20251031165416.2871503-1-matthew.brost@intel.com>
 <20251031165416.2871503-8-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20251031165416.2871503-8-matthew.brost@intel.com>
X-ClientProxiedBy: SJ0P220CA0028.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::11) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA3PR11MB8917:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e3f2335-558a-4bdb-d682-08de1bbd28ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?pxZH549pNnJ7VGbQrYgrD/g50COiCelARrqkb4XYKBnZld17E4iCMChQovLP?=
 =?us-ascii?Q?nUZ2/KbWLIBYBdqvlHdIYIsJ1yjud7URlbvPO9kaXo/oLoqTf+2r7CSRJLwq?=
 =?us-ascii?Q?Bj/+rlyDqEGGuYjgSJUiFISya48cf3am+kJoVl0YbKWc9UH0w2DT2nlTJV17?=
 =?us-ascii?Q?44ikAYaH7GD4XMXH+8ruWLsm9AicxAN0LoTG7UG0fSOacTBaC+zGiLpRQxUv?=
 =?us-ascii?Q?YssgZWPawT/p65F+FYaZdlFbohJdqk0WE15/WaAYAn4Gp5al3QjtFO7XuvD3?=
 =?us-ascii?Q?/N2Tct6fGko+UibDJclLZz55Cti7Sja0uW5NG7ri2/PjidqSIU1wGhNSwBqI?=
 =?us-ascii?Q?fdkVc5OHrPXPL67azdPAobOjFn/K6UKxk/9qAsmV3SIMimoGkLkNjfwcnR3K?=
 =?us-ascii?Q?YJjET4Obr4bxdOGOGFW7VhChpL6BxT9YfLsQUDQovWh0SLnCNv0vkNkLftX7?=
 =?us-ascii?Q?u+OJLWhDckr5Ngce9DOVnBPKwT4XnkFdJTIQsifMZvheK6vVe7BqSJCVwex8?=
 =?us-ascii?Q?FsKfjQkjN9GcCqHt3zvdOXmyHTHlg4zWgKCMmUR3IFsJlTPspYv4b9VYMP4K?=
 =?us-ascii?Q?UP0QIZaILQDgpI1qTJUsBgD8fN7EatdqiAQW0KphSb0Hd1kp9R9sV19XjnHU?=
 =?us-ascii?Q?FGqMoIPiYGbRVFbLDQFCuRpq76BampMoMLIi9Q6uRce+DPrn7K6HxtmdyJBY?=
 =?us-ascii?Q?z5/7CbNL8kGuSfmLQF010NEe5ypp83ZkQi9CKSRZuB2m/xkQEb7q7+onm9G5?=
 =?us-ascii?Q?qfMOJ2JhZAdz8iEIopJzRmXIGtnJ/NntHsbBCtbvhRpgGzGnyMmL0Pmd1Fpl?=
 =?us-ascii?Q?T7x7xSdW6kDd7uE6te8HQ841D1dBCq6WDEVVtpnSbVPE8I+tdJu3mphl8pT+?=
 =?us-ascii?Q?00YNEf6ks+dI+JPqVZWTh4nI9mSE0Rr0oeYk93K6AFET+39k/2mE6ABULVyX?=
 =?us-ascii?Q?qeWtFjRN0lP/+F0p0rva8mPVnEKTgHF9wMBb/XJjxMUa/zv661bam6/ZLWcW?=
 =?us-ascii?Q?ADBYWqd1+2kPVAzypb2eeSiXZEQxGQS85iVnHGg2NeuavvFf774ev11Hf/FU?=
 =?us-ascii?Q?1Ob5c/Fk6Z8+qra/2NnaKf48hPJlqp3XrHSb90eXqzIhAIwQN6LDJC9YCKFb?=
 =?us-ascii?Q?wywUt88bDGvnu0M8ZXMRoFPZhClkPoQvLRWLPTflMEhgCuZefqkW4wSYkjcX?=
 =?us-ascii?Q?r/uKu9G/Mnjp1fpOuOL2Q85qk7wxYbWuuJOicV3c2J3wJy06QyG3nLCVL0pS?=
 =?us-ascii?Q?IHhZDtI5+pcFsuvA1En3AyXpBMhgXsKYIWemaMCLnlG4SVVDhJjqr80zszV1?=
 =?us-ascii?Q?fICugtcfRbp0cLmec90iRYKZQu4/WLLF237XU3R/Rbt4oN1mosncT63AkQsI?=
 =?us-ascii?Q?etA8ZOl2ceP9zSAN3WphvHBI9a+YgryqqRuiAUkpSPgg5hizbE9OzUDDgJNI?=
 =?us-ascii?Q?dTM+NjWn/r0l77loNs7Sy0elNODD1ELm?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xBfD3siVlTr0q3H6ZEGWw4OBvhH05EQPs6vg/duqWqjlR7pHSqDN5PW76LYd?=
 =?us-ascii?Q?RIS+IRIoFGEwBJyk/yvpg32HXn2YazvDW2tM4+MixH60meXPM5bGVE4gduF5?=
 =?us-ascii?Q?2uv3C2tbwlTdiw8pxlZgsEAJakZmAXnGr3bqzHbcRaViK5gFn6nuAhYFnJjS?=
 =?us-ascii?Q?bwvbQy/4VO2VIps12YQstgGR/dW9VjVFCKAG6kIXElKV53oy50g0HqOm+vAl?=
 =?us-ascii?Q?oyJmab6Kr6ayi2X7qMxNWUafyPsTy4NVDTTKbIek5cV3ACbGNxQ5Wv8ICei7?=
 =?us-ascii?Q?xL/khiG1ef8jvj3IjCK9FsrDZQWrECbQhCivdCAdJF4I2dJeVmN5LRRBvcWN?=
 =?us-ascii?Q?MXO0Zok6ZNJkbvHh+oFbJVB0OIfS+XvnS8jmE42jNwDVKgJi3/A/mEnVEyHD?=
 =?us-ascii?Q?8zzn1DZZYnfcU3TDf12oB07D7e5GgAMtg+7VT5yD9PD4+5z+c9y8ANwdy0SS?=
 =?us-ascii?Q?I/D+12f7JOTcP+4h49Alcnde6hc1Irh3B2EiKGdArrlRGcvIo8uvNGiFPwsf?=
 =?us-ascii?Q?a1KwSk6u61PC3tVYD7E/9Y+DVuH3D6CbIg6HkumuybN0VBLEdwxuJD9DV9Be?=
 =?us-ascii?Q?lcOjNiDi9rzUPdMhDVVbKILiuMSO9TYwqpLofWp1PaHVwR/pSitE4Um4N12H?=
 =?us-ascii?Q?EYfEMzgAkx6dsAWh0wavHBAE0VNjNK9Mbqdr793weeuXTgE+qRZ+aXMDDUh6?=
 =?us-ascii?Q?e/pgnHGJpWMxf3eZtLE6DGtrgB9eejdEL/CfC62IHnhehJznaTz3nb27DvQ/?=
 =?us-ascii?Q?1/kp/Cjbv41dOBepprOhDm/3oqBLbi1P41C2SYJ3lrIZn5/UsucewLX3MYzr?=
 =?us-ascii?Q?SMgZ3tNWg4W/ZyEaKFq5XThHpXVo5fARHXl7KXjwvRXrJBAFk5qXbtH2UqOW?=
 =?us-ascii?Q?eJ0uiYUAezqA9YjV6m3LLttkA2Kdt/Xku5++IBCNIR/g0yV2y8hms+roNdk2?=
 =?us-ascii?Q?50IM4pQ+tUzd4HbFldL5fyQh/sB9LEsrqcHcDmTwgJ2ujLONBLt01qyEtnXE?=
 =?us-ascii?Q?MrMJ4oCC/1eiQCcUDQES9davXfhZ2bCCEjy/04MV7X/EvNi0HXxjjBNEnYAV?=
 =?us-ascii?Q?AaHceApRulMOg5dVR/dtjjGYAWUZB6Peii+Fc6ScC2zm9WgkV8rwfpyWEr12?=
 =?us-ascii?Q?b9FBKb5oB9KC8gJNKD8+Bg9GDJpZc2TDHrO/L6Q9eHH6HM7msL+1UB2Fy6O/?=
 =?us-ascii?Q?X5Q2tvwV8w7+8cZiqrdwh8vVZKNM8RC710U7hbJZ9mlQE2uJdDKngAWRVvks?=
 =?us-ascii?Q?bN7TwmuGAoWpfNh/ueT/BTPvHAS2UF9blbRqrTSy/8ktuH/tcO3j3VJuRLO7?=
 =?us-ascii?Q?xhH2vIDifUCuEvZSP1gcgnqHzLdAmGjrHJMN2A17Pf+7qE51kO2BMjmsYUR+?=
 =?us-ascii?Q?f4+ceB1CNdkLbaFrce+XqgSz2YLt113F15vnodG8nrD5tJ+ePD7ZMMvITzAp?=
 =?us-ascii?Q?2yD1p+ebpUKovQeE5FqSXcPCWeF6WpGXWX77/GstIdslBUX0Ek02oKNHT+ZD?=
 =?us-ascii?Q?ASfK+CXpHDdnAdaK5F14t2zCrR88X16hqYwgw/3ToppAV5uyZF9bKJvAqFwe?=
 =?us-ascii?Q?xcYzPoGnHlvIKm7aeTRFweWdx9JqgDJJFhXGhse2J3veNoUYwasHTtRKHNLP?=
 =?us-ascii?Q?5w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e3f2335-558a-4bdb-d682-08de1bbd28ad
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 16:13:58.1208 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ne/yT27SrTg2joXS5elB/8DQkXh0WpnAhPgaCJX6fdHYp5+kGAJ/iJD/QDpB9KeGW3rFILxVCHT/NakKRGAMWotvzmAJe4+HmHpS0fxiT0c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB8917
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

On Fri, Oct 31, 2025 at 09:54:16AM -0700, Matthew Brost wrote:
>With the Xe page fault layer and GuC page layer in place, this is now
>dead code and can be removed. ACC code is also removed, but this was
>dead code.
>
>Signed-off-by: Matthew Brost <matthew.brost@intel.com>

with the additional explanation about acc to be added here,

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks
Lucas De Marchi
