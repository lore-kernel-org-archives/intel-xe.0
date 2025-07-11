Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48FC4C83F1A
	for <intel-xe@archiver.kernel.org>; Fri, 11 Jul 2025 03:29:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BF8A10E252;
	Fri, 11 Jul 2025 03:29:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c0NWF83k";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81D9810E252
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Jul 2025 03:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752204575; x=1783740575;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=3HexfhLPgWRzswae0D2cUH4LpJlBj/DagpjmGJNccLs=;
 b=c0NWF83kD3kME/SlaYPthkk3t/GyjdACec3WvpkJsDR4UiuK4GRVDPL0
 Qd1X+0lmtnGhW8VglbI/Z/I02GHkKDySLrSkfm1k84FhxZGg4JGf3ja0T
 neOJCvPCDcFmBpOqZFr8YlqRG8Y5jl0FW9PkCHoZ5HTGktuHVjBOOBYna
 /DZaKQKfYMp/wAykxin98YNKBKEmFqSwoVDGW4Mv16+wsyAHZcZoAbjg9
 N36vdIGlCKDaVF3lZSrYROQXG+MYTIotM8FKgYULVH0T0lZPpujWvC8XT
 YKmL7kRRHCSTO/XsCOvxiW1uMFy7HWtPJe8V3fgkdflpxoKsUcLiqptsp g==;
X-CSE-ConnectionGUID: YwHRKk2uShKBD1hARD2vCg==
X-CSE-MsgGUID: XimBAt/VTROwYIsTh4Gv0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11490"; a="54375155"
X-IronPort-AV: E=Sophos;i="6.16,302,1744095600"; d="scan'208";a="54375155"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 20:29:31 -0700
X-CSE-ConnectionGUID: Q6ljxS0FRE2Eg6WA78OSwQ==
X-CSE-MsgGUID: 8QuLfgb9QPK2Pf5Bm/npPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,302,1744095600"; d="scan'208";a="179959506"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 20:29:31 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 10 Jul 2025 20:29:30 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 10 Jul 2025 20:29:30 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.67)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 10 Jul 2025 20:29:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SzL30xwlTilVFgH0ur1KM1Kl4vdZVqoCdq/FI6voA2spJvhCdLW9pOUb1LtlvYKB/7nxESr1ZgBPvnPYRBJ/VrE84GVxPlNKkx+YY15BAPquFBE9oaTQtITru31YA9U4iJidRHOdu55jDr3yoyZsCSdFiBnpG2wOmE1xco+bAN2gyYZ8puRExR8mQm9GbyYIKTgb7LMm0h/F/p/IDCP9PkjWNDwnerNNH4u6kNX3AoRfsGBtUiJ0VpzhxXAH0AdjnbbfxUie7lOjzRAjGepAk+mJhVgE5p/mVtsJL7ecmpkLnpb43wT6AJBXwzsawWHfEarogJ3c4/yDo3bUu60QDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3HexfhLPgWRzswae0D2cUH4LpJlBj/DagpjmGJNccLs=;
 b=OoShPJ62QTP3znK5kgXogVhAdC+nSMBAPDxUE1ON6CYMfIv4YZraZlO8p/i7wLO+fnLuprKsbmPZbTAUezXNEMFePfXpN3AaKFrLUeBdDC+5u7KOAdsmXgA0lh8j4XSKsdMfloGr2NmgWnsXX9Bqbn4hVzxYWtkCTCUQ2SkuW5xQGT7o2oTkT9LGjr0FEVUjJeGtCKbsviMZFZPeZppNNe5G4EazV/WPet4V2w08oJIMl1Wpd0/MeGkd393SorNus3QFY9tMeItPEbf8OKgnxjerwzrNEzcp+3eWgyqvMy55WnsJ407nbw4h5UMi22/4jqyH9Ho2sQfWfoVYlLkikQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS7PR11MB7781.namprd11.prod.outlook.com (2603:10b6:8:e1::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8901.26; Fri, 11 Jul 2025 03:29:24 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8922.023; Fri, 11 Jul 2025
 03:29:24 +0000
Date: Thu, 10 Jul 2025 22:29:21 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
CC: <intel-xe@lists.freedesktop.org>, <kernel-dev@igalia.com>
Subject: Re: [PATCH v9 1/8] drm/xe: Generalize wa bb emission code
Message-ID: <6xxejm3p2ffuxs2y7r6alhaon5hft2ewmdikgrnki426w4gz2s@ynuj6z7i4bev>
References: <20250709105455.93902-1-tvrtko.ursulin@igalia.com>
 <20250709105455.93902-2-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250709105455.93902-2-tvrtko.ursulin@igalia.com>
X-ClientProxiedBy: BY5PR20CA0008.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::21) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS7PR11MB7781:EE_
X-MS-Office365-Filtering-Correlation-Id: 8fc725a0-95a5-4073-01ed-08ddc02b21bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?TDDS3D00gr4FvZmGQqxm+mlytDTpkiXpdqTkrHaGQqTO9J9ejMYz+SDTVelB?=
 =?us-ascii?Q?nUOBbqgqmTsiEFxaK7MmLxFkyQYhT5mv+8KK3wHmQODZ6Lfj1GVtfvbvt9Vr?=
 =?us-ascii?Q?E5prwzVfeBhIImHaJhO4/UTyqRin0q0P0jIOihBPbs2FOcW9qrVJ18SrEuEw?=
 =?us-ascii?Q?4X6Lh5vnuWOXBzVpjUQ0QLi+kHdgUcAAoKs2AFxGTGPkjJAPZsoFrqUYinxt?=
 =?us-ascii?Q?CUU2YgY+VthDHnm/gUSLzp1GQ/AKf2JfwBL6ATQqZ6R5DIA82kcQw97oZi79?=
 =?us-ascii?Q?cpBSj6VdyCUuEm630AXf0fRtTnRIvXQv7px1tRNyrv80uHEfhoXb9LGNFYdI?=
 =?us-ascii?Q?CvVPg3x+tLaI4j7F/FSzxbNpyKLbbY8gNwE9oMroOqgTe1HILag5UK5Cpf6S?=
 =?us-ascii?Q?NuPJoFQ1jjPseGP4McBImOrN5HSCJ0/591bKGZDFre/M2XbVYKzEiVl1ibmC?=
 =?us-ascii?Q?syR9iXPhqyZVkUh71BDEBcvPk4o1XHfUB/8hpI7j5JGurKKZBQImLGu/X1GR?=
 =?us-ascii?Q?U/mZ9mhavYGX73n1m8GxofmIBjuYzCLD7zQhYoqjQbVbiE/UXuKgAKhAHfX1?=
 =?us-ascii?Q?uoGwxXehUZKA6sxAVcuDX6gkCq5oWGKhwlmkfgQtUgcIS9U9qsaXV1cKMOqS?=
 =?us-ascii?Q?3K5cYbCRxSqHr7GdaUG+Vto9k4i7rt+EZuyJYeX/cXni2413CJQTeEDtBTq7?=
 =?us-ascii?Q?6aAGraNnQVGU2hU1+LZBLzYzicMcUL8PAAGP5MTs810C8trd8YDX26Ogmj+k?=
 =?us-ascii?Q?YKHm4WB032BK8xNYsGOSypY3ipH/Jp1kjEpY9v3Tj7rDProuK77EsH54bMp+?=
 =?us-ascii?Q?Ln190BliwX2PqgflfQTZas3nkwW4fUGHJHAhl+Sil1NrLySmjnauAH1bQl7L?=
 =?us-ascii?Q?IaUhMvGhwRPtePph0wesodZ9BLAOP32KC31DTCxouQzJp/sr1ROHouBBGKdq?=
 =?us-ascii?Q?ceYIGzgy/j7dT9H5uBaHM5RkEfHxEoEhHQtFwYfxkJH3CSAk5px5XgWgROIr?=
 =?us-ascii?Q?qnoPAzninCEU6w1lG6+rI42WHE6xryaHG/ES4hIKFz/5+WlBqa7wT5QB+S27?=
 =?us-ascii?Q?xqaN31qFIxO7HCI804kDWC/9Aes47KmYGU+vVlh+1sEplV1/p7u1WX0ftUBD?=
 =?us-ascii?Q?Py7raNYwtvW3rNVVCwVrNf33icUkT8U7zf2qhDFaiYNk/kgSos9WmfwylvPW?=
 =?us-ascii?Q?1Tn6PqJUbWA02SjYaN0W+r5FRePG+8JSN9NRLcjFFZ7BTb2yi2fCsowD5oSy?=
 =?us-ascii?Q?l4zQVqCcL6m3wVOEhFomaZ+hrhSJPI6Ha66AhRzYjWpkSrmu+yRL36tyTdE3?=
 =?us-ascii?Q?+r8JSCDzPKiGwVGTrRuMQEPObP6yB77ztCxTMKBNaWoY7LyPSLQAj1pIsV30?=
 =?us-ascii?Q?iAP9rRvZyljJ7vVDtiMd0x/fo+vfPKK1sVmXL6GF1POrdSWDvw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0rUqRR9x9eMtonxkkybRp8nLbnMgCoxOHNnmPtW7mwIs8qZUKT8OprT99oae?=
 =?us-ascii?Q?Ow+CJFSVJUwbgiGMTORTr/htGKjcanXqxKchYIxxUCZ9nmbozWtZPQ0YZvvo?=
 =?us-ascii?Q?zXI5pfJkUFlEG2RSTh2DHHGH77dem7Kcbx07gCq8fpKMge6vHkJl8uCOQ1MC?=
 =?us-ascii?Q?mSVxRDhezelVc4TX5dzJkpYoVqXUU7+eE9kKF1Y2b7iuXfBtu+3jYpOTsNuA?=
 =?us-ascii?Q?gGAL+XEz1iSuW5lXua9EMDmmQGdMOT+RvoiacuNbHvyBWa95dGsxYOk1QuVe?=
 =?us-ascii?Q?wfzq8QsAEzJcSkeVWqAyz5aCxt56DNk6yz2BojhJX1g7kh6sZJ+u//ct+1E4?=
 =?us-ascii?Q?kzoWtDt2g+k4VZI8lBqmQTjvsoMDEJVcTenXoYl650wAvIpdszVsOzlrviqF?=
 =?us-ascii?Q?L5xoUH/h4tpLszvFCsWvnSy5ii9ql5K122b3mf8QZm2PAYPjxDEI8W0mde0J?=
 =?us-ascii?Q?tWQVPxmLS/UrephZBmX69yiRO/95tq+iQphbWJNLXMHQAWQt1FF1I0/W7H2u?=
 =?us-ascii?Q?f82AHEAExzNVVCfKBHGqTgzM2OPhZY4O1VKOD+IYca/0rFU0obBWsGVqUC+L?=
 =?us-ascii?Q?DPg+8uV9iABTavYKEsBorHovzAqQajR78nMqUT5/z21o4VRIIQmgNgtNm9Gd?=
 =?us-ascii?Q?1lvAaQ7rvSCl7mzxE9GPYz6UuXsSo3cwGwr7j1qPnQYYDqkDYdZ8rhK4TjqR?=
 =?us-ascii?Q?WHgu2WHBH1LH9iVkQXs8cvOrI1tHChul4j6YGdtnaUErS/coXFcao0k/NeDR?=
 =?us-ascii?Q?E+VcnDASWvPbizpnnTQiao7T+kQGG586z78EVgehyR8PDUQgPNwbkFPfaC+C?=
 =?us-ascii?Q?UOeQONB9Hmx6cijwVMoF20S+ytIXaO+NL77V3KL5lR+3ZpVQxY+ikt1vsK32?=
 =?us-ascii?Q?3e7Ja7S3+JDv/xES5W3emWiJM5Wss7NfpUQpwNpNGuQNtf4IiQoE5182aTGH?=
 =?us-ascii?Q?uCrZ0xU43D2J+5vmj12WD/miiOoQl7zXAIrnOshCWY35XcTr2BW2g7xPRIqT?=
 =?us-ascii?Q?6XvsLwtPgHDR1whdmBLkaTbJ+2In2Yn1E9fixZzJ1BTvqWwd1UV0F/4Wa1AA?=
 =?us-ascii?Q?B0a5eF0bCH13bviXgRlKuL+29yXHK0+c8yos7Zm9V2saRTQQiU5+WcB9yo86?=
 =?us-ascii?Q?TGVXpBPCx6DdE26iwwpvP8mF5Uk48OkHwTrni+E/tIdPgjkOEa1g8/D59Euh?=
 =?us-ascii?Q?aeHFih6Im7KxRJvwIatrjbwaeD+/hYrADUwxgfe1pvDf8TCLterYkwIFh0rZ?=
 =?us-ascii?Q?zyNxhr/Rm0MSi1lJs2mTv2FyYdBPnw5ZLLGfoU6g6oxfzHlh/GyDKub5Ybox?=
 =?us-ascii?Q?l2zdjALlB4fpfs3iRu5m+y4G71sUIH9TR7SNzMqROqrFsLgNyajENIob7j9R?=
 =?us-ascii?Q?k3g4O1XcL9Vojmro4jCLDzGQCTBkOz9eBzB9kaq4aqw8BM8lW9lqpaV7KEVT?=
 =?us-ascii?Q?tj9Fd4SazAzHllbqdZj4brjhJI1S1Xb7wZDfqr6iFY1GppEO+lqfSuGEOsGC?=
 =?us-ascii?Q?FD9ruIPhe4m0iEyfAupNogoo2aA8GwLBQ2LwgYSQoXZZ8VG2AdI+MO0o+eKP?=
 =?us-ascii?Q?cLO86idawXqwfdFkUPvVfa2ZEycvVk0CTMrZY4DcObadLMepXNWOo6jXDs5I?=
 =?us-ascii?Q?9g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fc725a0-95a5-4073-01ed-08ddc02b21bf
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2025 03:29:23.9907 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RqW/RH3hQCJP6RpR6f/yQw4EcBURTbprUP4EZA3wWiFTY3cqfGSRchuHhb9J7l85XPH6+wU68xEsOcn/8ym6EKnjqQInSYx1/VNBspU1mL8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7781
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

On Wed, Jul 09, 2025 at 11:54:48AM +0100, Tvrtko Ursulin wrote:
>Generalize the wa bb emission by splitting it into three phases - setup,
>emit and finish, and extract setup and finish steps into helpers.
>
>This will enable using the same infrastructure for emitting the indirect
>context workarounds.
>
>Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks
Lucas De Marchi
