Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63EE9E77188
	for <intel-xe@archiver.kernel.org>; Fri, 20 Dec 2024 21:03:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2ABE010F052;
	Fri, 20 Dec 2024 21:03:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h0E3PF2X";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12F5010F052
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Dec 2024 21:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734728625; x=1766264625;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Ce+ieqZO4wLy2eQjZnWgVQeqOC1xNKXct8Frji3sNrg=;
 b=h0E3PF2X+OipT/aqwrUQuX1UUf0MievoT4ghQYGY/3gWhNAxRoEXnk04
 /9YTYaasIWu8t4COC3vC+rOl0OZLETDh+UWzmyWqtcGw8zfdHOLhPUZ8e
 Un3e875vYzz+vaemMuTtKfhrmn/2SYZst/JF0ckp17CkHDiIaORswAfRK
 OncTgD5nfFhql2SoPW0hn+8vcH6H6ES664fXlbU+BjVWRWVef7/twXBvk
 S9+j0TJCLGWvL5QE+K+GJe2RmKbVAqAqsHZVSTb9PuXjBJejjHBiT11aO
 tPkKF++dYFeLnIjLTvos+ntny8cHYzOTQ++GWEm2uR3KGmui+Y9ErFUQy Q==;
X-CSE-ConnectionGUID: dvpoty0XR7eUz27WNGLqqg==
X-CSE-MsgGUID: C+UsfFS/SAKx9XczWxNuVg==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="35451712"
X-IronPort-AV: E=Sophos;i="6.12,251,1728975600"; d="scan'208";a="35451712"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2024 13:03:45 -0800
X-CSE-ConnectionGUID: +g8p/bDOSD+u05lWlDeLpQ==
X-CSE-MsgGUID: v6Wt0B4FS624/GU5SbMQWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="129571505"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Dec 2024 13:03:44 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 20 Dec 2024 13:03:44 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 20 Dec 2024 13:03:44 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.176)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 20 Dec 2024 13:03:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n5uB8jjQpLGapBcX40hsKM7Vs7GVuaScd1/sa8QOJvgqkDshkVMgeUxuB37XxWbkYtOoEcluRVfFzRf22CQD2d0/XpD2y9kO2LyqIrYaUHjrPxAIjuh2hW4MniKyrTwxMOJGv2aaZaziUi8mpJUexCcTi2ja1mef9B09nOcJgPJsJiaGqNRqiErUp0c2acvILrKVK9v0QXq5TfYwnEwRddWb9t0+EBCA0hAwYdvv/BSvZJG3UaGAdsa/d4wsf4/+p5FSXefJNT9to7LUcBCQfiPqBUpIW9vZUbwjm6QSqfmbifHBPXy/wujUxMjC7rSvvoa3NugWnZk4eGsxSdj7hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2GNa9jpvoqxBNTHv75+JSvhSkRTZrIK9yn5Hp8GD4tc=;
 b=Oq4QerIFB02WV/yPmXovcVGoVzvaOmn4NxwD3rDW7UgDnK/B0W002MiR1jcEn8JeZxJduo4wQCbtjhzcjT8Gt2cjYwrPEUbeoT/FIgAMT6CZ5LGHbu/NQVGDoZdQE5hQv7E2Sgjp/as0HhALyF+Ci3DwHplTwiiede5xY1YO/At5uMRBaRrDXZj+DU9zJwkMIMNvKNqkEOf16M8/KKW/ijGJsdkqlXq9I/gVP+7a+Mqh/L1imMEXTftUuJgOMmvyQejcoMDasUwhqqUSFkqEuOE8q8QCcuPhE3s5RA9B515un3Z6V2Vug6wnKOomlxkYv2zZ9bd3/tWXXjgWErqQiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8282.namprd11.prod.outlook.com (2603:10b6:806:269::11)
 by PH8PR11MB6706.namprd11.prod.outlook.com (2603:10b6:510:1c5::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.14; Fri, 20 Dec
 2024 21:03:41 +0000
Received: from SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72]) by SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72%5]) with mapi id 15.20.8272.013; Fri, 20 Dec 2024
 21:03:41 +0000
Date: Fri, 20 Dec 2024 16:03:36 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Aravind Iddamsetty
 <aravind.iddamsetty@linux.intel.com>, Bommu Krishnaiah
 <krishnaiah.bommu@intel.com>, Riana Tauro <riana.tauro@intel.com>, "Lucas De
 Marchi" <lucas.demarchi@intel.com>
Subject: Re: [PATCH v10 1/4] drm/xe/pmu: Enable PMU interface
Message-ID: <Z2XbqLncDdx7_45Z@intel.com>
References: <20241220011910.103280-1-vinay.belgaumkar@intel.com>
 <20241220011910.103280-2-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241220011910.103280-2-vinay.belgaumkar@intel.com>
X-ClientProxiedBy: MW4PR04CA0326.namprd04.prod.outlook.com
 (2603:10b6:303:82::31) To SN7PR11MB8282.namprd11.prod.outlook.com
 (2603:10b6:806:269::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8282:EE_|PH8PR11MB6706:EE_
X-MS-Office365-Filtering-Correlation-Id: 014bc937-e879-4f80-7a32-08dd2139c80a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?uJpPjrVNLQejOoZUcN9IqLGG6QKavYJkHXj4dT/qzL+OhS/O407YlSVk9g?=
 =?iso-8859-1?Q?UKbP20w3B+TgbrYTWJznw9AMSl/COUk+6AjbmmNhWntW8OtUp1wnTZuc4G?=
 =?iso-8859-1?Q?cW1APqjJA12gFJTcU72J6W/+E09ViIvkFN18gH799rK0wjqvy7bvQtxxP8?=
 =?iso-8859-1?Q?hzah+op/TSJjQhlCfhyrlfosMJY+DntyTJ3WOhBGEEnl71qLqJET/P/mxr?=
 =?iso-8859-1?Q?5RzKAQeUiB5oMr4Cz+YE0E7wmb94sQaHaiiDWR7a5wvOz5G69pD9xf1Yzu?=
 =?iso-8859-1?Q?EbI/KhkZLtfhW1Z5YB9ahoGv+k7HX50FbQ/WOzTwykTgcfHSkA7BE22Z8h?=
 =?iso-8859-1?Q?PFL2v4fb7eEpkWoR5ZAR1aiUyuH9VMX5lO6bleIgJBl5JM/KeVKkxpzLk7?=
 =?iso-8859-1?Q?aq3RlVMyOn+bSDIItJVATSfe6/Qu8JYwCBMt+CbqGgrvJ6ew8QjkvSNuKS?=
 =?iso-8859-1?Q?sew18yYJc9x2v9MSyAD7d2cQULIh25L0FxAWNLWjc/D+VwNAc1G7vtaves?=
 =?iso-8859-1?Q?cg5exD1rhvIgcraBAc7wfceyd621l07MBP5idP7KqAnYzmLZ578LEPHrA1?=
 =?iso-8859-1?Q?F+mC4hJLmTSSvqQMcaFCXVoLeyR3i5mtDBqXqJ6R8M+PR3221EXlb7tMfp?=
 =?iso-8859-1?Q?7t8CY2orXMYkavulmIQ6QDcRE8OW/pMRKeRgUcc4pht6ED/jnbwQyeFKQi?=
 =?iso-8859-1?Q?NNjhnO9pGKoiGraSq/e+OU5HtIJ2sDKgS38qN1uEZnzqROLkNKxZhPmfSf?=
 =?iso-8859-1?Q?EuogLQXNb+fMjKOCYN/KZOjwqjJ2rdQrtUzxxBW6OwxdlLj24FKlQyOq/7?=
 =?iso-8859-1?Q?PAnXLLjwmWzQPgZYnyNF2c35TmrQVF2YC819rjMavBahMkWVaTNU5Hixtf?=
 =?iso-8859-1?Q?+MUg+lzGgjHZQ9aBrR5hVMEfiNK+hjB9jJYF9AzAonIonLvhNhhGoFn7v5?=
 =?iso-8859-1?Q?aLwE1bvTS1kMPQSVKuym74yuuzYMRgDu0gJ1y6wS/RImA8E18Gl4tSNCas?=
 =?iso-8859-1?Q?YtnZbtdNwbvxEBaIM7bX5zqglIEP+Yw9Q/AyngvQxShhyKf3kqLpqkolhZ?=
 =?iso-8859-1?Q?nqAwpI6i5lOlRcxuA6N5SXT93ZzwnUqpKlY5za1XW1f7wGx6NS4Oiqg8Bp?=
 =?iso-8859-1?Q?U1njdui2hYDm3rrRX+euKOwLBcAVxYUzzviO8ePIObFYLU+1oj5qX0ibd8?=
 =?iso-8859-1?Q?umzsLd6jtnQd97N82PGY8UwwiaICwo/Me62Q7Zni7SMcpsJVuImh4ebJmk?=
 =?iso-8859-1?Q?A60xSy5bRH/ReoA2NG+/obVIFy0l1XtV77I7E56faHqacstkAC5brMr8Ic?=
 =?iso-8859-1?Q?MCILhGk805/A6e80eCx14j95oo2wSVdVs+AF1Hmm9y1TrsQPdwnyvK5XzR?=
 =?iso-8859-1?Q?vZ7ay8NGABeX3bPMZWuah5iBGNwiMbKg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB8282.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?QILf6Vr+guFKfZcBddw5S+ZLZygJVPOxR8iRX3GOvip87v/VDWtRqBGTgw?=
 =?iso-8859-1?Q?SYLScgIE7zdr22YVzFc7c4xYTfAdBb4HHWfyouqq8GzEh8uVh/Es+E/Uq7?=
 =?iso-8859-1?Q?mByogiDBL7unDCSu9FcMaDQk5DFuIJadOHipEkiy9DKp6PAXbXI0Iaizfa?=
 =?iso-8859-1?Q?fXrLCEbDWHrTgJhdsT8abVQR/uDNS0xEGEIPdBPO/CAmwAGXyrcdgeLBux?=
 =?iso-8859-1?Q?nJ4pauC++wjK/UYP39B7IEjK0KtzNz4DFLMvz8HZS6HNwW3rZ+JVpne8tx?=
 =?iso-8859-1?Q?qb4GjvfM5l8QXE9oXzF+Q6KJPcLHVP4UD0SKDRPS1zeqeNnndjKgOwlVwI?=
 =?iso-8859-1?Q?1YE8h7XRUxpg/Xq2mZL+KQ8fIy9ZEd2S9AxiktkN+X8lfnc1sM+glKgM0S?=
 =?iso-8859-1?Q?VFZ0VZ9kkFyozX6ieTRg75v9XsPEYzJBU28Pgm9As+fPzigu4qMubc0Ip4?=
 =?iso-8859-1?Q?4PSA1tJASpd9JOlUHuRs/gC1Xae6dxh0YoxH52+vMKJdXJAStSovndib9i?=
 =?iso-8859-1?Q?znmUH+BO75cRp9Ao4nwvPkHuoBjOCdvOgoqeL9lIWasV9vDIYeDRP0HOoa?=
 =?iso-8859-1?Q?dzTL9SSmD1ERmcGEZMo5ETJ8FVv6WHN9sa4ogyMX+YbNiE92vgRbwmQ5zn?=
 =?iso-8859-1?Q?vnXg1xfEIuxQz8eVwOMylNdjbLEkjv9aXZXoxQQQTsoUNf934Fan57Vn41?=
 =?iso-8859-1?Q?JFJFbOKHMrGrS76VYe6SR67xF7pjyKxYGi8Iy1cOaapO1jr1qK9t1EFAAK?=
 =?iso-8859-1?Q?eHXz9FXr03B4vMSzxoBw3/TlTiEPdBPYPfVxlXXwbVjxn/kaa0i91Q8CMk?=
 =?iso-8859-1?Q?52alEmekFJKudqv13y7fDr8zGpK9762XzNIycuZBwUMVDXpYlrkp79NehL?=
 =?iso-8859-1?Q?0Oz7onAl2S4wq94n55D+hbL7tXhUchYUKiM8aD6O4OQW3JtflNJirXxgfx?=
 =?iso-8859-1?Q?benQBzmnrMiIazZLbSWQJfXEkChT1+nLerdFom25pvvtwA9BElFupzuh9L?=
 =?iso-8859-1?Q?huIModBJxSP21+r0nftzVXq9y6CXHhsvmc5DRsyPP0Ezn1nqsE4M3rRfX/?=
 =?iso-8859-1?Q?GDm8Yyeckwh0fECoV1cETG+i51UJGBYwSsm9QmVQ6ZQBwO59qttYfwq2QH?=
 =?iso-8859-1?Q?mWczZVwPf0aeIT9peMNqmTFpeFvJQ1XeZho3bh/rHljy60lHdMDciUsV4O?=
 =?iso-8859-1?Q?1pfE7RuABqTLfU76Ay3Rh+7HV0VFglRXuw/D35BMZMSiU4f1pQfv+4kx/i?=
 =?iso-8859-1?Q?CYUSXAMMAZh7S5lnYWNQcuI9cb2sp2z/CwAJSjO9nOcijGAFLy3UzYTDLc?=
 =?iso-8859-1?Q?V5JMhzc1ntNGDUjGHEiOpWnGcuHLrYTSbVATjUXpJ/ENq8mlbC6SW36GBc?=
 =?iso-8859-1?Q?NbNCaa3bU4z3xNilyViUaj6IGBs3La560QtRwysM3UJAW6MX8NESJdrn4f?=
 =?iso-8859-1?Q?72a93k2e9QwtCHxnCTkia2YUpAEP5h4AwoacpgEMfb03mvL0iLygYDEnRx?=
 =?iso-8859-1?Q?S/ZRIIivGEWnGM93cnq7L28O7E2Bg0twsiRzbaG5xpxfwF/fMPf6Sm5njD?=
 =?iso-8859-1?Q?MHiZzT+eUQfsc3W3+AO4H7sqDs3WJdBvZj/vQ9AKVGshaAAc1gbNtX5P9/?=
 =?iso-8859-1?Q?hvNfApIIpk0IqEzGFQqk3blx0Etr8VdrTM8qEYeK2uNeImmWxoZW5r1g?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 014bc937-e879-4f80-7a32-08dd2139c80a
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8282.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 21:03:41.2901 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YOn2KSZm2/fOO3hi3oF8HilGgAHTXQ5rK05u1KDiwJhZfi09J3sPI82I+houD3PF7GSWzB+0Z5G8Nje8PIZBtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6706
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

On Thu, Dec 19, 2024 at 05:19:07PM -0800, Vinay Belgaumkar wrote:
> From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
> 
> Basic PMU enabling patch. Setup the basic framework
> for adding events/timers. This patch was previously
> reviewed here -
> https://patchwork.freedesktop.org/series/119504/
> 
> The pmu base implementation is still from the
> i915 driver.
> 
> v2: Review comments(Rodrigo) and do not init pmu for VFs
> as they don't have access to freq and c6 residency anyways.
> v3: Fix kunit issue, move xe_pmu entry in Makefile (Jani) and
> move drm uapi definitions (Lucas)
> v4: Adapt Lucas's recent PMU fixes for i915
> v5: Fix some kernel doc issues
> v6: Address comments from Lucas.
> v7: Define events per device and use xe_gt_id to choose GT (Lucas)
> v8: Use config field bits for gt_id as well. Use raw_spinlock_t
> to avoid deadlocks with perf subsystem (Lucas)
> 
> Co-developed-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
> Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
> Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com> #v4
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Co-developed-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> ---
>  drivers/gpu/drm/xe/Makefile          |   2 +
>  drivers/gpu/drm/xe/xe_device.c       |   3 +
>  drivers/gpu/drm/xe/xe_device_types.h |   4 +
>  drivers/gpu/drm/xe/xe_module.c       |   5 +
>  drivers/gpu/drm/xe/xe_pmu.c          | 621 +++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_pmu.h          |  26 ++
>  drivers/gpu/drm/xe/xe_pmu_types.h    |  72 ++++
>  7 files changed, 733 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/xe_pmu.c
>  create mode 100644 drivers/gpu/drm/xe/xe_pmu.h
>  create mode 100644 drivers/gpu/drm/xe/xe_pmu_types.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 7730e0596299..ab4a1af795fc 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -300,6 +300,8 @@ ifeq ($(CONFIG_DEBUG_FS),y)
>  		i915-display/intel_pipe_crc.o
>  endif
>  
> +xe-$(CONFIG_PERF_EVENTS) += xe_pmu.o
> +
>  obj-$(CONFIG_DRM_XE) += xe.o
>  obj-$(CONFIG_DRM_XE_KUNIT_TEST) += tests/
>  
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index bf36e4fb4679..ca557c22c979 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -49,6 +49,7 @@
>  #include "xe_pat.h"
>  #include "xe_pcode.h"
>  #include "xe_pm.h"
> +#include "xe_pmu.h"
>  #include "xe_query.h"
>  #include "xe_sriov.h"
>  #include "xe_tile.h"
> @@ -760,6 +761,8 @@ int xe_device_probe(struct xe_device *xe)
>  
>  	xe_oa_register(xe);
>  
> +	xe_pmu_register(&xe->pmu);
> +
>  	xe_debugfs_register(xe);
>  
>  	xe_hwmon_register(xe);
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 8a7b15972413..bd1e72d318f7 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -18,6 +18,7 @@
>  #include "xe_memirq_types.h"
>  #include "xe_oa_types.h"
>  #include "xe_platform_types.h"
> +#include "xe_pmu_types.h"
>  #include "xe_pt_types.h"
>  #include "xe_sriov_types.h"
>  #include "xe_step_types.h"
> @@ -525,6 +526,9 @@ struct xe_device {
>  		int mode;
>  	} wedged;
>  
> +	/** @pmu: performance monitoring unit */
> +	struct xe_pmu pmu;
> +
>  #ifdef TEST_VM_OPS_ERROR
>  	/**
>  	 * @vm_inject_error_position: inject errors at different places in VM
> diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
> index 0f2c20e9204a..d3a9d4bc9bee 100644
> --- a/drivers/gpu/drm/xe/xe_module.c
> +++ b/drivers/gpu/drm/xe/xe_module.c
> @@ -14,6 +14,7 @@
>  #include "xe_hw_fence.h"
>  #include "xe_pci.h"
>  #include "xe_pm.h"
> +#include "xe_pmu.h"
>  #include "xe_observation.h"
>  #include "xe_sched_job.h"
>  
> @@ -96,6 +97,10 @@ static const struct init_funcs init_funcs[] = {
>  		.init = xe_sched_job_module_init,
>  		.exit = xe_sched_job_module_exit,
>  	},
> +	{
> +		.init = xe_pmu_init,
> +		.exit = xe_pmu_exit,
> +	},
>  	{
>  		.init = xe_register_pci_driver,
>  		.exit = xe_unregister_pci_driver,
> diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
> new file mode 100644
> index 000000000000..e6d25e8b7b7c
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_pmu.c
> @@ -0,0 +1,621 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +#include <drm/drm_drv.h>
> +#include <drm/drm_managed.h>
> +#include <drm/xe_drm.h>
> +
> +#include "regs/xe_gt_regs.h"
> +#include "xe_device.h"
> +#include "xe_force_wake.h"
> +#include "xe_gt_clock.h"
> +#include "xe_mmio.h"
> +#include "xe_macros.h"
> +#include "xe_pm.h"
> +#include "xe_pmu.h"
> +
> +/*
> + * CPU mask is defined/initialized at a module level. All devices
> + * inside this module share this mask.
> + */
> +static cpumask_t xe_pmu_cpumask;
> +static unsigned int xe_pmu_target_cpu = -1;
> +
> +/**
> + * DOC: Xe PMU (Performance Monitoring Unit)
> + *
> + * Expose events/counters like C6 residency and GT frequency to user land.
> + * Events will be per device, the GT can be selected with an extra config
> + * sub-field (bits 60-63).
> + *
> + * Perf tool can be used to list these counters from the command line.
> + *
> + * Example commands to list/record supported perf events-
> + *
> + * $ ls -ld /sys/bus/event_source/devices/xe_*
> + * $ ls /sys/bus/event_source/devices/xe_0000_00_02.0/events/
> + * $ ls /sys/bus/event_source/devices/xe_0000_00_02.0/format/
> + *
> + * The format directory has info regarding the configs that can be used.
> + *
> + * The standard perf tool can be used to grep for a certain event as well-
> + * $ perf list | grep c6
> + *
> + * To list a specific event for a GT at regular intervals-
> + * $ perf stat -e <event_name,xe_gt_id=> -I <interval>
> + *
> + */
> +
> +static unsigned int config_gt_id(const u64 config)
> +{
> +	return config >> __XE_PMU_GT_SHIFT;
> +}
> +
> +static u64 config_counter(const u64 config)
> +{
> +	return config & ~(~0ULL << __XE_PMU_GT_SHIFT);
> +}
> +
> +static void xe_pmu_event_destroy(struct perf_event *event)
> +{
> +	struct xe_device *xe =
> +		container_of(event->pmu, typeof(*xe), pmu.base);
> +
> +	drm_WARN_ON(&xe->drm, event->parent);
> +
> +	drm_dev_put(&xe->drm);
> +}
> +
> +static int
> +config_status(struct xe_device *xe, u64 config)
> +{
> +	unsigned int gt_id = config_gt_id(config);
> +
> +	if (gt_id >= XE_MAX_GT_PER_TILE)
> +		return -ENOENT;
> +
> +	switch (config_counter(config)) {
> +	default:
> +		return -ENOENT;
> +	}
> +
> +	return 0;
> +}
> +
> +static int xe_pmu_event_init(struct perf_event *event)
> +{
> +	struct xe_device *xe =
> +		container_of(event->pmu, typeof(*xe), pmu.base);
> +	struct xe_pmu *pmu = &xe->pmu;
> +	int ret;
> +	u64 event_config;
> +
> +	if (!pmu->registered)
> +		return -ENODEV;
> +
> +	if (event->attr.type != event->pmu->type)
> +		return -ENOENT;
> +
> +	/* unsupported modes and filters */
> +	if (event->attr.sample_period) /* no sampling */
> +		return -EINVAL;
> +
> +	if (has_branch_stack(event))
> +		return -EOPNOTSUPP;

can we do all the EINVAL checks first and this one right after the
einval code?

> +
> +	if (event->cpu < 0)
> +		return -EINVAL;
> +
> +	/* only allow running on one cpu at a time */
> +	if (!cpumask_test_cpu(event->cpu, &xe_pmu_cpumask))
> +		return -EINVAL;
> +
> +	event_config = event->attr.config;
> +	ret = config_status(xe, event_config);
> +	if (ret)
> +		return ret;
> +
> +	if (!event->parent) {
> +		drm_dev_get(&xe->drm);
> +		event->destroy = xe_pmu_event_destroy;
> +	}
> +
> +	return 0;
> +}
> +
> +static u64 __xe_pmu_event_read(struct perf_event *event)
> +{
> +	struct xe_device *xe =
> +		container_of(event->pmu, typeof(*xe), pmu.base);
> +	const u64 config = event->attr.config;
> +	const u64 gt_id = config >> __XE_PMU_GT_SHIFT;
> +	struct xe_gt *gt = xe_device_get_gt(xe, gt_id);
> +	u64 val = 0;
> +
> +	switch (config_counter(config)) {
> +	default:
> +		drm_warn(&gt->tile->xe->drm, "unknown pmu event\n");
> +	}
> +
> +	return val;
> +}
> +
> +static void xe_pmu_event_read(struct perf_event *event)
> +{
> +	struct xe_device *xe =
> +		container_of(event->pmu, typeof(*xe), pmu.base);
> +	struct hw_perf_event *hwc = &event->hw;
> +	struct xe_pmu *pmu = &xe->pmu;
> +	u64 prev, new;
> +
> +	if (!pmu->registered) {
> +		event->hw.state = PERF_HES_STOPPED;
> +		return;
> +	}
> +
> +	prev = local64_read(&hwc->prev_count);
> +	do {
> +		new = __xe_pmu_event_read(event);
> +	} while (!local64_try_cmpxchg(&hwc->prev_count, &prev, new));
> +
> +	local64_add(new - prev, &event->count);
> +}
> +
> +static void xe_pmu_enable(struct perf_event *event)
> +{
> +	/*
> +	 * Store the current counter value so we can report the correct delta
> +	 * for all listeners. Even when the event was already enabled and has
> +	 * an existing non-zero value.
> +	 */
> +	local64_set(&event->hw.prev_count, __xe_pmu_event_read(event));
> +}
> +
> +static void xe_pmu_event_start(struct perf_event *event, int flags)
> +{
> +	struct xe_device *xe =
> +		container_of(event->pmu, typeof(*xe), pmu.base);
> +	struct xe_pmu *pmu = &xe->pmu;
> +
> +	if (!pmu->registered)
> +		return;
> +
> +	xe_pmu_enable(event);
> +	event->hw.state = 0;
> +}
> +
> +static void xe_pmu_event_stop(struct perf_event *event, int flags)
> +{
> +	struct xe_device *xe =
> +		container_of(event->pmu, typeof(*xe), pmu.base);
> +	struct xe_pmu *pmu = &xe->pmu;
> +
> +	if (!pmu->registered)
> +		goto out;
> +
> +	if (flags & PERF_EF_UPDATE)
> +		xe_pmu_event_read(event);
> +
> +out:
> +	event->hw.state = PERF_HES_STOPPED;

please avoid this goto here by using if/else on the if (!pmu->registered) { if (flags...} else { event->hw.state...};

> +}
> +
> +static int xe_pmu_event_add(struct perf_event *event, int flags)
> +{
> +	struct xe_device *xe =
> +		container_of(event->pmu, typeof(*xe), pmu.base);
> +	struct xe_pmu *pmu = &xe->pmu;
> +
> +	if (!pmu->registered)
> +		return -ENODEV;
> +
> +	if (flags & PERF_EF_START)
> +		xe_pmu_event_start(event, flags);
> +
> +	return 0;
> +}
> +
> +static void xe_pmu_event_del(struct perf_event *event, int flags)
> +{
> +	xe_pmu_event_stop(event, PERF_EF_UPDATE);
> +}
> +
> +static int xe_pmu_event_event_idx(struct perf_event *event)
> +{
> +	return 0;
> +}
> +
> +struct xe_str_attribute {
> +	struct device_attribute attr;
> +	const char *str;
> +};
> +
> +static ssize_t xe_pmu_format_show(struct device *dev,
> +				  struct device_attribute *attr, char *buf)
> +{
> +	struct xe_str_attribute *eattr;
> +
> +	eattr = container_of(attr, struct xe_str_attribute, attr);
> +	return sprintf(buf, "%s\n", eattr->str);
> +}
> +
> +#define XE_PMU_FORMAT_ATTR(_name, _config) \
> +	(&((struct xe_str_attribute[]) { \
> +		{ .attr = __ATTR(_name, 0444, xe_pmu_format_show, NULL), \
> +		.str = _config, } \
> +	})[0].attr.attr)
> +
> +static struct attribute *xe_pmu_format_attrs[] = {
> +	XE_PMU_FORMAT_ATTR(event_id, "config:0-20"),
> +	XE_PMU_FORMAT_ATTR(gt_id, "config:60-63"),
> +	NULL,
> +};
> +
> +static const struct attribute_group xe_pmu_format_attr_group = {
> +	.name = "format",
> +	.attrs = xe_pmu_format_attrs,
> +};
> +
> +struct xe_ext_attribute {
> +	struct device_attribute attr;
> +	unsigned long val;
> +};
> +
> +static ssize_t xe_pmu_event_show(struct device *dev,
> +				 struct device_attribute *attr, char *buf)
> +{
> +	struct xe_ext_attribute *eattr;
> +
> +	eattr = container_of(attr, struct xe_ext_attribute, attr);
> +	return sprintf(buf, "config=0x%lx\n", eattr->val);
> +}
> +
> +static ssize_t cpumask_show(struct device *dev,
> +			    struct device_attribute *attr, char *buf)
> +{
> +	return cpumap_print_to_pagebuf(true, buf, &xe_pmu_cpumask);
> +}
> +
> +static DEVICE_ATTR_RO(cpumask);
> +
> +static struct attribute *xe_cpumask_attrs[] = {
> +	&dev_attr_cpumask.attr,
> +	NULL,
> +};
> +
> +static const struct attribute_group xe_pmu_cpumask_attr_group = {
> +	.attrs = xe_cpumask_attrs,
> +};
> +
> +#define __event(__counter, __name, __unit) \
> +{ \
> +	.counter = (__counter), \
> +	.name = (__name), \
> +	.unit = (__unit), \
> +}
> +
> +static struct xe_ext_attribute *
> +add_xe_attr(struct xe_ext_attribute *attr, const char *name, u64 config)
> +{
> +	sysfs_attr_init(&attr->attr.attr);
> +	attr->attr.attr.name = name;
> +	attr->attr.attr.mode = 0444;
> +	attr->attr.show = xe_pmu_event_show;
> +	attr->val = config;
> +
> +	return ++attr;
> +}
> +
> +static struct perf_pmu_events_attr *
> +add_pmu_attr(struct perf_pmu_events_attr *attr, const char *name,
> +	     const char *str)
> +{
> +	sysfs_attr_init(&attr->attr.attr);
> +	attr->attr.attr.name = name;
> +	attr->attr.attr.mode = 0444;
> +	attr->attr.show = perf_event_sysfs_show;
> +	attr->event_str = str;
> +
> +	return ++attr;
> +}
> +
> +static struct attribute **
> +create_event_attributes(struct xe_pmu *pmu)
> +{
> +	struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
> +	static const struct {
> +		unsigned int counter;
> +		const char *name;
> +		const char *unit;
> +	} events[] = {
> +	};
> +
> +	struct perf_pmu_events_attr *pmu_attr = NULL, *pmu_iter;
> +	struct xe_ext_attribute *xe_attr = NULL, *xe_iter;
> +	struct attribute **attr = NULL, **attr_iter;
> +	unsigned int count = 0;
> +	unsigned int i;
> +
> +	/* Count how many counters we will be exposing. */
> +	for (i = 0; i < ARRAY_SIZE(events); i++) {
> +		u64 config = __XE_PMU_PM(events[i].counter);
> +
> +		if (!config_status(xe, config))
> +			count++;
> +	}
> +
> +	/* Allocate attribute objects and table. */
> +	xe_attr = kcalloc(count, sizeof(*xe_attr), GFP_KERNEL);
> +	if (!xe_attr)
> +		goto err_alloc;

this looks wrong to me, you don't need to kfree anyone in this case...

> +
> +	pmu_attr = kcalloc(count, sizeof(*pmu_attr), GFP_KERNEL);
> +	if (!pmu_attr)
> +		goto err_alloc;

same here, you only need to kfree xe_attr in this case...

> +
> +	/* Max one pointer of each attribute type plus a termination entry. */
> +	attr = kcalloc(count * 2 + 1, sizeof(*attr), GFP_KERNEL);
> +	if (!attr)
> +		goto err_alloc;

and here, you only need to kfree xe_attr and pmu_attr in this case...

I know, copied from i915 and 'it works there'... I believe it works
because kfree itself skips if NULL, not because the code is in the
best shape...

but perhaps I'm just paranoid?

> +
> +	xe_iter = xe_attr;
> +	pmu_iter = pmu_attr;
> +	attr_iter = attr;
> +
> +	for (i = 0; i < ARRAY_SIZE(events); i++) {
> +		u64 config = __XE_PMU_PM(events[i].counter);
> +		char *str;
> +
> +		if (config_status(xe, config))
> +			continue;
> +
> +		str = kasprintf(GFP_KERNEL, "%s",
> +				events[i].name);
> +		if (!str)
> +			goto err;

hmmm, here you don't need to free everyone, but only all the above before
the loop and the ones that you have run in the loop already, but not the
entire loop again below...

or perhaps the for loop below takes care of this and I'm just paranoid...

> +
> +		*attr_iter++ = &xe_iter->attr.attr;
> +		xe_iter = add_xe_attr(xe_iter, str, config);
> +
> +		if (events[i].unit) {
> +			str = kasprintf(GFP_KERNEL, "%s.unit",
> +					events[i].name);
> +			if (!str)
> +				goto err;
> +
> +			*attr_iter++ = &pmu_iter->attr.attr;
> +			pmu_iter = add_pmu_attr(pmu_iter, str,
> +							events[i].unit);
> +		}
> +	}
> +
> +	pmu->xe_attr = xe_attr;
> +	pmu->pmu_attr = pmu_attr;
> +
> +	return attr;
> +
> +err:
> +	for (attr_iter = attr; *attr_iter; attr_iter++)
> +		kfree((*attr_iter)->name);
> +
> +err_alloc:
> +	kfree(attr);
> +	kfree(xe_attr);
> +	kfree(pmu_attr);
> +
> +	return NULL;
> +}
> +
> +static void free_event_attributes(struct xe_pmu *pmu)
> +{
> +	struct attribute **attr_iter = pmu->events_attr_group.attrs;
> +
> +	for (; *attr_iter; attr_iter++)
> +		kfree((*attr_iter)->name);
> +
> +	kfree(pmu->events_attr_group.attrs);
> +	kfree(pmu->xe_attr);
> +	kfree(pmu->pmu_attr);
> +
> +	pmu->events_attr_group.attrs = NULL;
> +	pmu->xe_attr = NULL;
> +	pmu->pmu_attr = NULL;
> +}
> +
> +static int xe_pmu_cpu_online(unsigned int cpu, struct hlist_node *node)
> +{
> +	struct xe_pmu *pmu = hlist_entry_safe(node, typeof(*pmu), cpuhp.node);
> +
> +	/* Select the first online CPU as a designated reader. */
> +	if (cpumask_empty(&xe_pmu_cpumask))
> +		cpumask_set_cpu(cpu, &xe_pmu_cpumask);
> +
> +	return 0;
> +}
> +
> +static int xe_pmu_cpu_offline(unsigned int cpu, struct hlist_node *node)
> +{
> +	struct xe_pmu *pmu = hlist_entry_safe(node, typeof(*pmu), cpuhp.node);
> +	unsigned int target = xe_pmu_target_cpu;
> +
> +	/*
> +	 * Unregistering an instance generates a CPU offline event which we must
> +	 * ignore to avoid incorrectly modifying the shared xe_pmu_cpumask.
> +	 */
> +	if (!pmu->registered)
> +		return 0;
> +
> +	if (cpumask_test_and_clear_cpu(cpu, &xe_pmu_cpumask)) {
> +		target = cpumask_any_but(topology_sibling_cpumask(cpu), cpu);
> +
> +		/* Migrate events if there is a valid target */
> +		if (target < nr_cpu_ids) {
> +			cpumask_set_cpu(target, &xe_pmu_cpumask);
> +			xe_pmu_target_cpu = target;
> +		}
> +	}
> +
> +	if (target < nr_cpu_ids && target != pmu->cpuhp.cpu) {
> +		perf_pmu_migrate_context(&pmu->base, cpu, target);
> +		pmu->cpuhp.cpu = target;
> +	}
> +
> +	return 0;
> +}
> +
> +static enum cpuhp_state cpuhp_state = CPUHP_INVALID;
> +
> +/**
> + * xe_pmu_init() - Setup CPU hotplug state/callbacks for Xe PMU
> + *
> + * Returns: 0 if successful, else error code
> + */
> +int xe_pmu_init(void)
> +{
> +	int ret;
> +
> +	ret = cpuhp_setup_state_multi(CPUHP_AP_ONLINE_DYN,
> +				      "perf/x86/intel/xe:online",
> +				      xe_pmu_cpu_online,
> +				      xe_pmu_cpu_offline);
> +	if (ret < 0)
> +		pr_notice("Failed to setup cpuhp state for xe PMU! (%d)\n",
> +			  ret);
> +	else
> +		cpuhp_state = ret;
> +
> +	return 0;
> +}
> +
> +/**
> + * xe_pmu_exit() - Remove CPU hotplug state/callbacks for Xe PMU
> + */
> +void xe_pmu_exit(void)
> +{
> +	if (cpuhp_state != CPUHP_INVALID)
> +		cpuhp_remove_multi_state(cpuhp_state);
> +}
> +
> +static int xe_pmu_register_cpuhp_state(struct xe_pmu *pmu)
> +{
> +	if (cpuhp_state == CPUHP_INVALID)
> +		return -EINVAL;
> +
> +	return cpuhp_state_add_instance(cpuhp_state, &pmu->cpuhp.node);
> +}
> +
> +static void xe_pmu_unregister_cpuhp_state(struct xe_pmu *pmu)
> +{
> +	cpuhp_state_remove_instance(cpuhp_state, &pmu->cpuhp.node);
> +}
> +
> +/**
> + * xe_pmu_unregister() - Remove/cleanup PMU registration
> + * @arg: Ptr to pmu
> + */
> +void xe_pmu_unregister(void *arg)
> +{
> +	struct xe_pmu *pmu = arg;
> +	struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
> +
> +	if (IS_SRIOV_VF(xe))
> +		return;
> +
> +	if (!pmu->registered)
> +		return;
> +
> +	pmu->registered = false;
> +
> +	xe_pmu_unregister_cpuhp_state(pmu);
> +
> +	perf_pmu_unregister(&pmu->base);
> +	kfree(pmu->base.attr_groups);
> +	kfree(pmu->name);
> +	free_event_attributes(pmu);
> +}
> +
> +/**
> + * xe_pmu_register() - Define basic PMU properties for Xe and add event callbacks.
> + * @pmu: the PMU object
> + *
> + */
> +void xe_pmu_register(struct xe_pmu *pmu)
> +{
> +	struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
> +	const struct attribute_group *attr_groups[] = {
> +		&xe_pmu_format_attr_group,
> +		&pmu->events_attr_group,
> +		&xe_pmu_cpumask_attr_group,
> +		NULL
> +	};
> +
> +	int ret = -ENOMEM;

unused ret variable in a void function...

> +
> +	if (IS_SRIOV_VF(xe))
> +		return;
> +
> +	raw_spin_lock_init(&pmu->lock);
> +	pmu->cpuhp.cpu = -1;
> +
> +	pmu->name = kasprintf(GFP_KERNEL,
> +			      "xe_%s",
> +			      dev_name(xe->drm.dev));
> +	if (pmu->name) {
> +		/* tools/perf reserves colons as special. */
> +		strreplace((char *)pmu->name, ':', '_');
> +	}
> +
> +	if (!pmu->name)
> +		goto err;

move this above, then you can avoid the if (pmu->name) condition in the
other block...

> +
> +	pmu->events_attr_group.name = "events";
> +	pmu->events_attr_group.attrs = create_event_attributes(pmu);
> +	if (!pmu->events_attr_group.attrs)
> +		goto err_name;

this function is indeed handling the goto error conditions much better
than the other one above...

> +
> +	pmu->base.attr_groups = kmemdup(attr_groups, sizeof(attr_groups),
> +					GFP_KERNEL);
> +	if (!pmu->base.attr_groups)
> +		goto err_attr;
> +
> +	pmu->base.module	= THIS_MODULE;
> +	pmu->base.task_ctx_nr	= perf_invalid_context;
> +	pmu->base.event_init	= xe_pmu_event_init;
> +	pmu->base.add		= xe_pmu_event_add;
> +	pmu->base.del		= xe_pmu_event_del;
> +	pmu->base.start		= xe_pmu_event_start;
> +	pmu->base.stop		= xe_pmu_event_stop;
> +	pmu->base.read		= xe_pmu_event_read;
> +	pmu->base.event_idx	= xe_pmu_event_event_idx;
> +
> +	ret = perf_pmu_register(&pmu->base, pmu->name, -1);
> +	if (ret)
> +		goto err_groups;
> +
> +	ret = xe_pmu_register_cpuhp_state(pmu);
> +	if (ret)
> +		goto err_unreg;
> +
> +	ret = devm_add_action_or_reset(xe->drm.dev, xe_pmu_unregister, pmu);
> +	if (ret)
> +		goto err_cpuhp;
> +
> +	pmu->registered = true;
> +
> +	return;
> +
> +err_cpuhp:
> +	xe_pmu_unregister_cpuhp_state(pmu);
> +err_unreg:
> +	perf_pmu_unregister(&pmu->base);
> +err_groups:
> +	kfree(pmu->base.attr_groups);
> +err_attr:
> +	free_event_attributes(pmu);
> +err_name:
> +	kfree(pmu->name);
> +err:
> +	drm_notice(&xe->drm, "Failed to register PMU!\n");
> +}
> diff --git a/drivers/gpu/drm/xe/xe_pmu.h b/drivers/gpu/drm/xe/xe_pmu.h
> new file mode 100644
> index 000000000000..d07e5dfdfec0
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_pmu.h
> @@ -0,0 +1,26 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2024 Intel Corporation

probably good to remind to change this and every other header in this series to
2025 already?

> + */
> +
> +#ifndef _XE_PMU_H_
> +#define _XE_PMU_H_
> +
> +#include "xe_pmu_types.h"
> +
> +struct xe_gt;
> +
> +#if IS_ENABLED(CONFIG_PERF_EVENTS)
> +int xe_pmu_init(void);
> +void xe_pmu_exit(void);
> +void xe_pmu_register(struct xe_pmu *pmu);
> +void xe_pmu_unregister(void *arg);
> +#else
> +static inline int xe_pmu_init(void) { return 0; }
> +static inline void xe_pmu_exit(void) {}
> +static inline void xe_pmu_register(struct xe_pmu *pmu) {}
> +static inline void xe_pmu_unregister(void *arg) {}
> +#endif
> +
> +#endif
> +
> diff --git a/drivers/gpu/drm/xe/xe_pmu_types.h b/drivers/gpu/drm/xe/xe_pmu_types.h
> new file mode 100644
> index 000000000000..2b3f8982023f
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_pmu_types.h
> @@ -0,0 +1,72 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +#ifndef _XE_PMU_TYPES_H_
> +#define _XE_PMU_TYPES_H_
> +
> +#include <linux/perf_event.h>
> +#include <linux/spinlock_types.h>
> +
> +enum {
> +	__XE_NUM_PMU_SAMPLERS
> +};
> +
> +#define XE_PMU_MAX_GT 2

is there a way to make this more generic?
otherwise whenever we have a platform with
different max we will forget to adjust here...

> +
> +/*
> + * Top bits of every counter are GT id.
> + */
> +#define __XE_PMU_GT_SHIFT (60)
> +
> +#define ___XE_PMU_PM(gt, x) \
> +	(((__u64)(x)) | ((__u64)(gt) << __XE_PMU_GT_SHIFT))
> +
> +#define __XE_PMU_PM(x) ___XE_PMU_PM(0, x)
> +

please add also a doc comment for the xe_pmu struct itself, not only for its
components...

> +struct xe_pmu {
> +	/**
> +	 * @cpuhp: Struct used for CPU hotplug handling.
> +	 */
> +	struct {
> +		struct hlist_node node;
> +		unsigned int cpu;
> +	} cpuhp;
> +	/**
> +	 * @base: PMU base.
> +	 */
> +	struct pmu base;
> +	/**
> +	 * @registered: PMU is registered and not in the unregistering process.
> +	 */
> +	bool registered;
> +	/**
> +	 * @name: Name as registered with perf core.
> +	 */
> +	const char *name;
> +	/**
> +	 * @lock: Lock protecting enable mask and ref count handling.
> +	 */
> +	raw_spinlock_t lock;
> +	/**
> +	 * @sample: Current and previous (raw) counters.
> +	 *
> +	 * These counters are updated when the device is awake.
> +	 */
> +	u64 sample[XE_PMU_MAX_GT][__XE_NUM_PMU_SAMPLERS];
> +	/**
> +	 * @events_attr_group: Device events attribute group.
> +	 */
> +	struct attribute_group events_attr_group;
> +	/**
> +	 * @xe_attr: Memory block holding device attributes.
> +	 */
> +	void *xe_attr;
> +	/**
> +	 * @pmu_attr: Memory block holding device attributes.
> +	 */
> +	void *pmu_attr;
> +};
> +
> +#endif
> -- 
> 2.38.1
> 
