Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F5F6C2BD09
	for <intel-xe@archiver.kernel.org>; Fri, 28 Jun 2024 20:53:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0AFF10E0A8;
	Fri, 28 Jun 2024 20:53:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aXAFkLTW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AF8910E011
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Jun 2024 20:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719608011; x=1751144011;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=jvDErAOLrNW05ROsEoPRwi8U8NS3nHfARFn2yGrK4ho=;
 b=aXAFkLTWzaN3IYqJ2ph1kYidhzrzAO5NtinJrLPoIdA5xyTN8Qqbl1AB
 N8brqd4z8K59V6hhdRAGMNuR8QXbbvfipsWd2foihigJkMxx4E9C0LfFN
 CcAVHyIQKV7PwH6WYJeiwMMlxqU/+nHvCF/oTkgFSVZYVQNfP0wnAPG38
 UHDkpcwiv9fGYqGMVRA9WfADcQIt2dtJq9K4szJ1cgUs+RfBPc7sz8gkY
 OJxgLgfR1a3AUuOOmJFdkDI0uIH0jcfkmYmRNez585Xj31LQibpfjSuoX
 HQEFpCvGSv28F9899WVEXTSJ9tzI0NXcdkBYp2m+FW4iWk2Z3lo/+Sqkj w==;
X-CSE-ConnectionGUID: ObrPiXwlQpaQ3o7XnwMv1A==
X-CSE-MsgGUID: wqP4JW8+RIyvNwHKP5hfUA==
X-IronPort-AV: E=McAfee;i="6700,10204,11117"; a="12307749"
X-IronPort-AV: E=Sophos;i="6.09,170,1716274800"; d="scan'208";a="12307749"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2024 13:53:31 -0700
X-CSE-ConnectionGUID: inLRf6NjQuezduwIIJg/tw==
X-CSE-MsgGUID: xQg6jDV6Qa+UGcHe/YlC7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,170,1716274800"; d="scan'208";a="76035932"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Jun 2024 13:53:31 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 28 Jun 2024 13:53:30 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 28 Jun 2024 13:53:30 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 28 Jun 2024 13:53:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZGyPW6+vchQ5UkRNeGlKHKCQU3j3bL10DMZmqNusBOCIXgFkZ225AUK6forhVhq1xQTFe9NUIdxFKsd88jH46Y94HufpffUPOQ+pxe9ELaecXyghcLKjBVtiWFkDW2CkIUG9YfK68y5ns9XA5bUyAqzrFyyvcFA+7Cz4b/xyGqGNoUaqv9UJlW3X72KwpNrvhqmx+NFsm/KqpDMl9CnTqWzcBRqwMqGmCGm8KV2+0BjIGvBKRcsOBkMVv5Xeri+0hqGQyvayFTjT5N9wAYxpQd2dokvC71d7rQ8s+pM1ZklrsC2jWDyGXXE2XYqb/jLgh4DqZ0+fS3DnQlrlKapQeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8i5ZC0a7ZJyc2OJrRAhrwT9fY4xeqWaj03d7O3/jrBY=;
 b=Y2kNjpqMi8TmYYsTLdvsmGoWS2z5WV/JxMCoOnlCmhqHzVoWu3RFrN4X3fCMKq5vux8+0q/36lLbPU8K42UW61gFMUxQtugLljujA+kjW3amIpSvfj9F8GcbFMcqHuV859z7D+iLqvayj01qqLCqXYDiCSQwK/FDZSwZ43vtvNHrEKvPZPtOXVG/1Nj/w2PQ1ufNyhwB9rqRZsB5pt671A1Mp75yAknxzqWWAJ2EYruPyQKC8tcafVVBWHj4gu76czvDIdtwxgX0/i3M7k+OLS9BPbu+llP5P167HTSQuw0mQ3HAbXyYoWx/s6jIGy3gqZ9NOnU9+lXVP7vp/Pz4KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM6PR11MB4547.namprd11.prod.outlook.com (2603:10b6:5:2a1::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.26; Fri, 28 Jun
 2024 20:53:27 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7698.025; Fri, 28 Jun 2024
 20:53:27 +0000
Date: Fri, 28 Jun 2024 15:53:28 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/2] drm/xe/mocs: Clarify difference between hw and sw
 sizes
Message-ID: <ghnv6k5z6ud7m5cfjoob3b7egforthrrkdnccvpxsk53v77q7i@3g7dem7znpdd>
References: <20240627203741.2042752-3-matthew.d.roper@intel.com>
 <20240627203741.2042752-4-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240627203741.2042752-4-matthew.d.roper@intel.com>
X-ClientProxiedBy: MW4P220CA0023.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:303:115::28) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM6PR11MB4547:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c89da5a-b784-4d88-4fd5-08dc97b45bc9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?U5oxG8WD07JhblkPxgQrvE9tr9LwdhZUIdgYv+2+DWVySE9jAvXDzT+nDwJb?=
 =?us-ascii?Q?7meOJR+XHdsr2nt4/ocutcFw4Qip/vZUyCCOmGE0oZf1I3eScbf9XLP2Y4bv?=
 =?us-ascii?Q?ysQcseW1NV2B4HGpofjW2exo4E0VsrSpNleVMie9bSpR+6LcY3OugaecRkS1?=
 =?us-ascii?Q?jBJQQsDiuhLWDBZipCEVg5ft0MlqDaAnWlQlJRR9wnCM3MR7m89i09rKSFJ4?=
 =?us-ascii?Q?jeP3UcQyMpSgkRa4BGk/JRpXIU1oCCIqjivcqb2eYgHRcWulH7AQFg3oWT1k?=
 =?us-ascii?Q?bS+OzW9xxB5ScnnQRGLCbWCPwVZwI4UeHhgyHIcNqv34LS4J3WEjbcJTKSOm?=
 =?us-ascii?Q?tV+OO3iU5UfZ8c34Bz/FP7coxS/Ihha0d0bEEe9HvOFKHjFdqZ6edCFo7F5m?=
 =?us-ascii?Q?jimmwdodNqWwXFl6Axf13abeqW+uav8dVQ6Uli8jwfNNtuAGiayP6XFozhe7?=
 =?us-ascii?Q?77VYsJK9yIEJqbTmp1YstDBldezL0pYAq0FuV6Lepl0v+oKD/AbRMbLNKT2S?=
 =?us-ascii?Q?q6AszjPZBs1NwqUwMiEfxaDO32vyRFe/4BAWaLMLQtDppqHlLLnXa6mBeWx6?=
 =?us-ascii?Q?FAx0ndEEd6oD4oN8c7dPFTB4COWk1AsUruJCZ6Q4YU7BlSTeTH0I8hO92cTr?=
 =?us-ascii?Q?MdHDH9F/Lq1D2YYMXCiNjcoy8KCGA5zsMxgheFLsc8ExQPbjX5bu+1Z2Mv9e?=
 =?us-ascii?Q?aRRJJGe9qbBtFMdYXTuXAJli1cWrLCD/TS++ua8lL37tLhXpx5DCIHO8VGJM?=
 =?us-ascii?Q?luDgkrRNdV3mlrDjla0mIZvRTdZxdeak/g0q9a2UxguDM/h1r2oRskLgK5y5?=
 =?us-ascii?Q?mZo7p5OOnbeyreto239j2arBlCepirZq0YEfTaDqlaoIOkcyemrFY7z0fjmf?=
 =?us-ascii?Q?szTEtYdYpY46eRYi6wqmLHIMCpjzRtqyPjWKcvYMTKtvayQp5Altp1QZqQeO?=
 =?us-ascii?Q?CETNU6DG3ny0UNxE0KRBebWOmldHZY3mBZwzSy9eCbOcVndiYG84DhLYhBW3?=
 =?us-ascii?Q?noGxwr/1B9Em2BShxWZGmp6Diz62T4xP6YB9JxeUpvyu2FOHwmUMTlThSE/o?=
 =?us-ascii?Q?hHkAlwHppBhkldaq9DqSIKztkkan3FWKcdDs81hYvZJc0GbKkfGcT3vM7tWH?=
 =?us-ascii?Q?ybVjE49b+CaZxNmrUrNhjD0Lv5Q/XpKN9685mIwS0cmlpWOfCj0ZzCd91qxG?=
 =?us-ascii?Q?fdxQxWWRy20pRZpyWVX3ZJ2lHjQaH/0PmUA9P6Cl8PvpQZ+s/LFHUxHVFneE?=
 =?us-ascii?Q?A3+wmjQJn5t3hilH6BkuQi+aioin2OZ3/Mi3qdErKHU+rUjPj7P1UCpdICMt?=
 =?us-ascii?Q?8J7Uvut+9DHP6JweS9h8lCH4RGXrAco/ghQpePYx0LVn5g=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Dj0mh5PlWP3oOXuQM3OMVwYjl7c5R2JkNTwVvTkCWbKsFYACfv0TiSLK9Jhc?=
 =?us-ascii?Q?fVC2gXyad1ayDcvuMPLhQX2clwRdSr5xz2FMQ3aESEIVLqRl6jjCuCF2j2lP?=
 =?us-ascii?Q?mivYKFBbc+UMqT/kRhqxdoXf4Raz/EwwWP6LWtTxfu6YBC8+cuL1wqzr61bl?=
 =?us-ascii?Q?8pkP7WI5xsDEPXG84z5wy6O34tLroN5TRVkZj5J4E1dU1Qu6lCtIv8PAVyFJ?=
 =?us-ascii?Q?OQ3qdOFfnj6nlO5Jasleac7coDbzUsdbtheluoxJPKhUSdsDAf6OnWn0Juas?=
 =?us-ascii?Q?I0BCbKtV2iDG9WaAprDVypatRi8yFEN+gf+sVePoKt1WhpuORERKcez25Euz?=
 =?us-ascii?Q?4358MGWaI9otvo8/0aSLfJyCuIyPHF/rFruW29JUP53K9RIQlwMcKQcW7f1x?=
 =?us-ascii?Q?Kz/1ZzVRZqzmgOTZpG0cbK6KFMQ3YTFeEHYG9W8ZI1+Im++a7qa34GabeliY?=
 =?us-ascii?Q?CtidnDLulFMv2euZexr3PoIY6soKGr5IBBbfduyID/ljX6+ddgR9VP2bXn7i?=
 =?us-ascii?Q?fuj5lUfTI72XIvRdCSceFE11Kgy3HAJU+9Oxutd6aDE64r4jw2YAfJ6Lh+wH?=
 =?us-ascii?Q?JNzZZpEXQLp84yNQoFjYsthrZDArOiji/9CHwADzFmjoRYPZtLN/giIgK0M9?=
 =?us-ascii?Q?JRMU+4ah9/xCOkyNfHPQ6x5LjpHh1ATbRcZS+T1N9COW2CseBsRJ56ZgMC0D?=
 =?us-ascii?Q?WGGhh1XC+Hd8dgUHhz2OVH7p3SFyrpnM4kjGKm3ajPsN27KqT1stiEAI6WdZ?=
 =?us-ascii?Q?AH/Fn4KLtDB3waawAC3x0ftPBTxenacPRRbeJNbDsd0vmRpSSk8GOxH86T1e?=
 =?us-ascii?Q?izxSxOOFT0LR2Vd4XtFBHxroBP8sUUxrVUTUHTvOTnx7ChXBv3/UXkYWzSvm?=
 =?us-ascii?Q?Qz+wqPQ7kifdMuge2qRZTI3PTLvoSuHeWT4iSKCAoOa+DVgLhs4iHrs2TaS+?=
 =?us-ascii?Q?dSikxepqhKDXAWIggKjUhHi6ZSSGh4J4RTj9JO9PLhz913+/RTA+OP1XNxi4?=
 =?us-ascii?Q?/wjeaZaIyrAkCd6GFhFeF9P0eZSflU/R1XsKTHG5eDzLK1OUyRinj+s7x1yg?=
 =?us-ascii?Q?i/TTeUzpb01+zNCHKtxV64WqzNoG2/+inX9+HBEwwu0+fZgu5byliE1aGbpn?=
 =?us-ascii?Q?K89IQNHaqwc6Y1/+nXlc35gfiQ4F4j3/7SOYpYlMqhZNTAQ35HIIugLp8vZj?=
 =?us-ascii?Q?YV/4Y+a8hkfutjt3GNjMPf1e5GuVotJL25WZrXLE7qVQ659cFG3N+8CPdwvt?=
 =?us-ascii?Q?hCZ0eB6HkjJtTFSTfRI920aKXHKVL9OgtVrjFUQQ0l4KtaU/gxXx24eKDCmP?=
 =?us-ascii?Q?9Z/QozO8gfTR/tfT+OpqtHNVEANufQJu5RfP6ZOLd+xU3NLEHolI9ddXKntG?=
 =?us-ascii?Q?hYl48kpgsNX45tHGqQrq181BeVcN4I5lujBkAjhtGj6FmDdcuzP5PTbhcEZD?=
 =?us-ascii?Q?22gA9mepMCF4MVmwKdnUmr2dGoGudTh8itlWCOsjdHy4hMjAFy2BDkcMl3kl?=
 =?us-ascii?Q?FHjGqNlrCSEikv0stWiNdzgRC/sGKJrbgl1SSXBWKddRsTqOq4nS0+MHYeKc?=
 =?us-ascii?Q?S0xaelGuIVufvjX4PI07KIRjbRe6090FCUZj14nEt1f9YLyh2rn74uOTokg1?=
 =?us-ascii?Q?Xg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c89da5a-b784-4d88-4fd5-08dc97b45bc9
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2024 20:53:27.0358 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: crKoFE0D3+Ubu8qK8wA2oZAthKRe/5DxZ6w1zC9gTdMHea+N3o9C7Wpx49zpzYyxKOD8ySFBS2GLtN7hH6EamXlUVDcEptJHDYvDKFRjSw0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4547
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

On Thu, Jun 27, 2024 at 01:37:43PM GMT, Matt Roper wrote:
>It's not very obvious what the difference is between the 'size' and
>'n_entries' fields of the MOCS structure.  Rename both fields slightly
>and add some comments explaining that one is the documentation-defined
>table size, while the other is the number of entries that can be
>programmed into the hardware (and the documented table size can
>potentially be smaller than the number of hardware entries).
>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi
