Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47099C54ED0
	for <intel-xe@archiver.kernel.org>; Fri, 23 May 2025 17:41:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38DDC10E058;
	Fri, 23 May 2025 17:41:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ivsbMMIP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 320A610E058
 for <intel-xe@lists.freedesktop.org>; Fri, 23 May 2025 17:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748022109; x=1779558109;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=l2E+sRDjEARnVHzVFH6vjtCwQIvs+hXo1nl9MoCd+Qw=;
 b=ivsbMMIPQ4tiFFcwsw3AbSgUJxkkg9e/QyCwQSnzb4uQpCVJR0Bc6oP8
 9WVD+bK6dy1D9PJpQE9mspwLeVfxjEzkd9QvyVd/yJBOguF6t92bkzT0D
 YNR9SbuzOQH3mlqxfNAStZR5ipKfuAz5H8CXYLjZ0MBfzdh4uIytEnRA1
 6lNTQP+qJ5f7Rbi/x4MF+WeXabLariKCqFq3+BgeuBciBjoINQDvs4i53
 TnQKwYoDAVximqoBZZ9RfbTYfF2xqo/TOX4aGqe3ADUtfLNVLiyOjS56M
 ROGOJHuhcUxcphEWhb9DgZFqxBKJBviBkABTVPFj9wdVw1FFWBb/1m5To Q==;
X-CSE-ConnectionGUID: zPJPwrdoToqp6AR6f+48Ow==
X-CSE-MsgGUID: 7Fqga7h+R6WLzCUPQ8br/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="50234231"
X-IronPort-AV: E=Sophos;i="6.15,309,1739865600"; d="scan'208";a="50234231"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2025 10:41:42 -0700
X-CSE-ConnectionGUID: mQa5UXeSQ9+enfdQ5c3b6A==
X-CSE-MsgGUID: v32pjWifT4WekVSAiUAcdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,309,1739865600"; d="scan'208";a="172194402"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2025 10:41:42 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 23 May 2025 10:41:41 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 23 May 2025 10:41:41 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (40.107.102.55)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Fri, 23 May 2025 10:41:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wG+XoqnHiISJN6Yd36UutuCk0/tfJB4XAcCU9SNXF2xNku6tNd+TLDY/4dQVS+xi49KUKo+RsR2a1VRrn2ZprJ3UHe6p6E5Y7loKbUFZDlNdcJSDNd0MIOHr0+NT5Nga4s785khg/Ik+nTYt2yWjhiwFPjKfNyKl5aHsPIhHoyfkYXmyM0ww/+WpytelNR7JirTzhy51Axj1IVUwJzinmMfOTJeW2o43SRfJabvSTD9KZ+b7lblZwuWdt8fxE+vkACQ8l7sJGp9DwcV3/VRLEZ+8AiZQ1Ubto+/LcDu6XSZwXTcL8SIjXM6zn8tjMjcd5ndrKz7RvtTBpYn0lDbRUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WzdsNoxUPrwz/BTPAHM3fL5GFdzEqHOVsOr4FEusUy0=;
 b=X1hsDAdW2md6L7pxD4/Pgxrce8DB2BwAAVVBergkCG3QvYC6011CIHMmMsjAMzEN6e9t51WWfC6phh3+tVfuZ1IIWrYQI2YuEb8KZ1NWWBGyf3cKAs29zifmHiGjgRP4t69W/URKF/B+o1N++HA8CNf+ToOeW917LRO4E/H5dIKkks/neDDjKSyQk6N0wBFcLE4K5jVilV+W1qjONCqDi8tHIZEB4NuhQBtDA5FrlKkdyHKcPFQajPUAxxp8vCjLT9bhiQkQ8SN5GhXeEdl+F7mJZQzlOIMA2qupXrjA+MQ6t2Xe4TePzsQCKe0ncAFWfcc8N7KeJZdMDo2/6Z9CaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by MW6PR11MB8412.namprd11.prod.outlook.com (2603:10b6:303:23a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Fri, 23 May
 2025 17:41:38 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%3]) with mapi id 15.20.8769.019; Fri, 23 May 2025
 17:41:38 +0000
Date: Fri, 23 May 2025 10:41:35 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
CC: <intel-xe@lists.freedesktop.org>, <kernel-dev@igalia.com>
Subject: Re: [PATCH 2/3] drm/xe/xelp: Implement HSDES#16010904313 workarounds
Message-ID: <20250523174135.GS5080@mdroper-desk1.amr.corp.intel.com>
References: <20250516074412.46863-1-tvrtko.ursulin@igalia.com>
 <20250516074412.46863-3-tvrtko.ursulin@igalia.com>
 <20250516190000.GL5080@mdroper-desk1.amr.corp.intel.com>
 <4582d65a-e465-47b0-af2d-a4017f01d787@igalia.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4582d65a-e465-47b0-af2d-a4017f01d787@igalia.com>
X-ClientProxiedBy: BY3PR05CA0016.namprd05.prod.outlook.com
 (2603:10b6:a03:254::21) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|MW6PR11MB8412:EE_
X-MS-Office365-Filtering-Correlation-Id: ff53a772-f8dd-4e99-8418-08dd9a2111d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RWUzUC9iUlNtN0ZXUlFqVjhSM3VNbzQ3eDlvVFIzdldFT3pCbEtTWU5VVXNE?=
 =?utf-8?B?bFpydHRwN0ZXeGk0VytWYTNhd2plVnVmTE1UMHZ3aUxtYytaWlU2cTZ6d3JM?=
 =?utf-8?B?aHZQV2lvRFI2VU95T291a2ZXa0VsNEIvL01nMlZVWTUxcXQ1SmNTT29xVlRt?=
 =?utf-8?B?bDVtZ2VyYmxBT3lBVzV6Y3lZZDRMeC9GNnBwanB6YUVlbWVjcGFaMFZZdGll?=
 =?utf-8?B?T05scEhGcTFTVitSVVgyb082K0xKYWtUUSt4MkI4WFE5UHNaTmxDejZZdzFK?=
 =?utf-8?B?MkFxRE8xdHZ5R0VKMkZsV2o2RWZCUHFJYUtvY2NpMVVQN3hUT0IxUFN0dnVj?=
 =?utf-8?B?T3grV3BBaG5aRG9RYndHSjlXakgrYVpHVjdWd0Z4VXFhT0pnNEpBdmxOdGxj?=
 =?utf-8?B?SnpuZGdYOEprNlRMSjF6N1lEMFpEOEY3ZmtpaS9LT2lTK3Zaa09wU2FRQ0t2?=
 =?utf-8?B?d25kQllOZGQzQnZkdy83QWs0Y3BRZzZ5dUtKdVI3N2Y1SU1zTUpDZXR6ZS9r?=
 =?utf-8?B?QXRsZlhGeXZpeUZuS2pxRldDMDlHbGZadVhlQldCQzlGallyQmx4Y3BUUEpG?=
 =?utf-8?B?SmxPeWJ5NEthbzZlQVFSV0UvdTd1aGpiU2hZOXlTVFltcDBWOCt5dWp5S3hh?=
 =?utf-8?B?YlFWd3Y4TnM1bGZ4WEdLZHFMay9zWDdMcEZwNWQrc3RxZ1QvWWFjQXFFRDVT?=
 =?utf-8?B?T3dRVWEzOXUzbURaZFF6NUZ1Und0a09NYlV0WXNvMllyeE1tKzJCRDI3eU1M?=
 =?utf-8?B?bStFYlJ3dEtGRWFDVGR6RlBwZVd1QVBJTHA0TmdrT0x2SVNIS1hDTUZPdU1q?=
 =?utf-8?B?TjhQRUNrZmprNmE1ck1GQ1U2UEdhNWRJVXEzUVJ5aTRLbFpDQ01ib0hsdnVQ?=
 =?utf-8?B?cUg2U3d0WXJzVzJ6YmV3Vlg1UVRtc3pLeTNkVzBWenhrSkJsS1Y2cmxVeWF3?=
 =?utf-8?B?bVJ2eE9zTGNxR1FTV29SZkdTM0tRZ2tlMlJCdjEyMnlmaE9Qb0lrMUE2NHNq?=
 =?utf-8?B?RUZyeEVJR2hrWW9jL0lGU2ZYZXNQN0hZUmh1Wm9lNHlxNXc2c3oxUDU1T1hn?=
 =?utf-8?B?dk5EVktScmhsdC93ekJjN1UrQ2JNazRXZ1JoNVpJdjVyWHlsa2FzUUJ1dnEx?=
 =?utf-8?B?amdYZTRJSldGUkMyVWdNaDlWWDUvTG5hZzFwOUpzRVF6bGFWcVRBc3lFN0VL?=
 =?utf-8?B?ZUxueWgra25nZ05WVlVpNnNPUHRMbDJMKzJPK0FQN0tiOFpEUU9YdnVzM3E4?=
 =?utf-8?B?b2JXMXVHcEUwZS9OZ1NxbXU4RTRpS01QTGFZcHplakp3Tk9QL3YvOUhkekxK?=
 =?utf-8?B?UEkxN3ovTGh6cU90bk1HUzdWdEZQL1RjOUErR0R4MENUcHRlZnFCcjRBa2hY?=
 =?utf-8?B?T2tIaUtqaFpCYkZVR3pBSjl2WnRDa0hubHhaK0k2Mlh0bkdHbXk4MVlsMTVT?=
 =?utf-8?B?dHhhVXRrZDFWVDlRZDVlUStQRWtadGtNZE1OakU1Wk1ZMGd4bS9FWmxwV1hG?=
 =?utf-8?B?MC9YYVFtbGdudklPNkUzZTJIMVpaM2JxU1N4d2V3Nm5sNHUvcnp2UDFwYXlK?=
 =?utf-8?B?UDkrNGtBQUVmc21vakxKeUVsanpqM1VkWjV4bVFaODc0MWZJNFpGMTVJaFE2?=
 =?utf-8?B?KzU3aGNESng4djduRGpTZGJCbnZvelBtTGsvWFhDODBxSkNoMDd0OCtkOEdj?=
 =?utf-8?B?cXFZTzV6Y1NEbHRrYUhQV09UbHVQTFBZVHhVclZNUnI3SWRLQTBGYkJFdk5t?=
 =?utf-8?B?bWdlVlEzSnN1NzFoUGl3cmE1dHhldkR0cjhOZk1NUFl4OXpLci93SERJbWlT?=
 =?utf-8?Q?KABEeqGSUVtjsdJl58L4bVI1NaB2CLBCo3wRw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b0xlRXBtZmVQNVExYTJPczNqNk01eE9YZWVDN0FuVVBGYTBwczRWclVoaVhz?=
 =?utf-8?B?ZmZiOHRrZDBrR2VadnhxcG1PTjk1SkJsb2hmMTh6NVdSRVF4bzUyMGQ4bUlN?=
 =?utf-8?B?ZWFNMUpuUDBRTURlZURuOE5kMDUxVUJZb3U5akhUSWd6d1k0RkdSZUhoREZh?=
 =?utf-8?B?c1pVNW51cVZvYkhFd1RGNkZpZ0pmN0hwZml3YUd3YjVJRFljMU9nT0pIMjJD?=
 =?utf-8?B?VXVXa2tnUDl3aGNNbjkrMG51c0hqaEVCc1FLTkhWSnY0eWtTeHNXUisyWENu?=
 =?utf-8?B?V1JEOUlhMkVWbE9zYlRZQytRZnZMamViMjhVN01YOC9La0djZTJhdkNhNTdW?=
 =?utf-8?B?TnlKZXlFeGE3dlR4RUF1SFhxUmdlNnEzekN1L3E1dmI1blN3RWV3ZXRkUjlD?=
 =?utf-8?B?YWgvODdiODdXTysraGRLd0tMYTFSMXBLajljbUkzY3dtMlQ1UGowNkI1eVp0?=
 =?utf-8?B?VVNxZWVvRmQyTjljcHpRdmE1TlhKcEhLdHdxZ3dxZzExVU0yK1ltY2tYQlp2?=
 =?utf-8?B?dVdNWmQwK0dXK3ZUd3RxTi9mM2lqSEhleXhQU2o0Skt0RUtIbVNIMEt1WVVM?=
 =?utf-8?B?amJaSU5jMDhNSEFlTi94T2tST0JEV0kyRWVFSGhiSUpXejBTR3ZEWm90YkVF?=
 =?utf-8?B?VkZQQmduUmJQU0pMdXJuK1FGek5KOG9ZVm92TVdSY09hVmUrUTRmYXBXbzlC?=
 =?utf-8?B?UHJsdkRKVUVKZVUzMkVpL29qREk2QWUvSUl2Ym42VnVHUmdQNEtXNjJvVnBU?=
 =?utf-8?B?N2lUTFBqRDdDd21xVGtMcmRNUDhVNGF5RmRndjJ3a1p6Tm9RdUNUbHFjVEdY?=
 =?utf-8?B?bUhDSEpyMWNZcGdyeUZiN1MzajFmLzRGcTh5RGtyc3FHblRIUkhjN2JTQkZE?=
 =?utf-8?B?VzJqRGIvbklNWHV5S3B2WXNsZTlhMEdlTGhmVDRsNEN2VHM4RG9tSEREb1RM?=
 =?utf-8?B?RTJXNHgxTm1lbnhOZUh0UVJsMW5DNXp5OWpIb1M1ZmM1VlppblZBYnU3N1dJ?=
 =?utf-8?B?blA3RXNuMVJzMEQxVCtySC9pOW9ndzJxaTFFWVdYRHdiblZTL0pyMHErZUht?=
 =?utf-8?B?cDFER2tTQTNqTkVSQkdOT2RqMkEwTVIwU0t1M1ZnWm0xeTJmOE5mL0pEU0Fv?=
 =?utf-8?B?c1I2a1VCUGs2RVZ2Q3JEVlphQWNOWXpZNXphanhvdEJSNWs4MWpNcVhoRlhl?=
 =?utf-8?B?SkdZSWtvMDdPZEpVSnluYlFETm45VEZpZ1BFTTRIL3FYeGRQN2kyaCt1WGVU?=
 =?utf-8?B?SWF4Vk92RjRqNFJJNXZhOU1vdEJEeGZEMzgrYmIzZlAwUElOZ0lZV01yeEt2?=
 =?utf-8?B?Zm9LUnpoQWZ1OFBiZjZsOGJ5Z2paYlNnM2EyTXh0T0JwZWUxVDlRQllpMkZw?=
 =?utf-8?B?anlhbjZjWm9tUW5HS2pXOFRleUVXN1hBYXFhK1hMSmNlSDBaYXdJRHdRTGJP?=
 =?utf-8?B?ZkVtM0Q5Ry9ya0lxM0c3S3g2WVJqNkdLa2FFKzVGckVFQjBvU1QyQ29LL0JG?=
 =?utf-8?B?bDlRc1dFb2VYV1pHSXhabFgrMDYweWRWMk93N2ZWNElyclhvZ09uRnB6VUxU?=
 =?utf-8?B?RDJYRkk1dzVQcWJMdVhHazNkV0J0amRYVjcxekxMTXdOdjlXYzJLZ0E5ZjNJ?=
 =?utf-8?B?TUYyZUNtK3gvdFBFaVdHUnMzKytLcTVibm1sWUg1VzVldmdUL1dyZUdwV3Vx?=
 =?utf-8?B?WXZ6ODVjNXlvSFUxSE50K2Jjb0YxY2lOZXYwRVR4cFlrYXM3RmhMK3o5S0kx?=
 =?utf-8?B?RmRZdHowWS9jU2o1T3c2SGVwZWFKdVZPSTNLQmVVelZ6aHlaUnRoTWI2S2pp?=
 =?utf-8?B?eDJ3Qk8vSmljVTRlUlFlNFdsZ1ZpSllEeDVQNXdob3MrVkZxay9pRm5vSDF0?=
 =?utf-8?B?L1lHemFYZzdmZTZDenQreUxJcytGaUdLMS9QUHFLeTNpTDVibHZreUY0WHNX?=
 =?utf-8?B?Zm5vMXVRZy8xRXJ0SnVBUnJmTlV6eGhDUkR5RkMydEZ1NjhVV1pBVkhEdXZo?=
 =?utf-8?B?S1grWjd5MFZiQlhTQzhJc0g2WVNtTzlGWGpudmJGbTliVDdDWTFwY1N5SVBZ?=
 =?utf-8?B?NjB0UTJ4aWw4UWlUZXZkMGdRTGs4NmVralo3bWtHbVVQZlNJUVpucGRqb0pm?=
 =?utf-8?B?cnR4MmExQ3RQazFVVmxkOWlJbzN3SE9JT1JyMU04SktxTGxWY3ptWC85YjlU?=
 =?utf-8?B?Z3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ff53a772-f8dd-4e99-8418-08dd9a2111d3
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2025 17:41:38.1921 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DHUHdoKRQRuMLFSK5FEDUOh05tlMwED9Jac8TTp6taoyboDWnj5fmJEvpM44vS7kj6QDeqtJE7yHPElt0HEkqHIcMwEgRA6VxiAIdSll5T8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8412
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

On Fri, May 23, 2025 at 11:33:16AM +0100, Tvrtko Ursulin wrote:
> 
> Hi Matt,
> 
> One clarification below:
> 
> On 16/05/2025 20:00, Matt Roper wrote:
> > On Fri, May 16, 2025 at 08:44:11AM +0100, Tvrtko Ursulin wrote:
> > > +static u32 *
> > > +xelp_emit_timestamp_wa(struct xe_lrc *lrc, u32 *cmd)
> > > +{
> > > +	*cmd++ = MI_LOAD_REGISTER_MEM | MI_LRM_USE_GGTT | MI_LRI_LRM_CS_MMIO;
> > > +	*cmd++ = CS_GPR_REG(0, 0).addr;
> > > +	*cmd++ = __xe_lrc_regs_ggtt_addr(lrc) + CTX_TIMESTAMP * sizeof(u32);
> > > +	*cmd++ = 0;
> > > +
> > > +	*cmd++ = MI_LOAD_REGISTER_REG | MI_LRR_SRC_CS_MMIO | MI_LRI_LRM_CS_MMIO;
> > > +	*cmd++ = CS_GPR_REG(0, 0).addr;
> > > +	*cmd++ = RING_CTX_TIMESTAMP(0).addr;
> > > +
> > > +	*cmd++ = MI_LOAD_REGISTER_REG | MI_LRR_SRC_CS_MMIO | MI_LRI_LRM_CS_MMIO;
> > > +	*cmd++ = CS_GPR_REG(0, 0).addr;
> > > +	*cmd++ = RING_CTX_TIMESTAMP(0).addr;
> > 
> > This doesn't seem to actually match the documented workaround details.
> > The workaround says we need to do three back-to-back MI_LRM instructions
> > to read CTX_TIMESTAMP into $lrc+0x108C.  The first two are supposed to

I misspoke here; this should have said "*from*" rather than "into."
Although "CTX_TIMESTAMP" is the formal name for the register, our driver
actually calls it RING_CTX_TIMESTAMP for historical reasons.

You can see the workaround description on page 20 of the public TGL PRM
document here:  https://cdrdv2.intel.com/v1/dl/getcontent/705836 (although the
formatting there is a bit painful).  Here's the text from the WA database,
which restores some of the linebreaks and formatting that was lost in the PRM:

  """
  The below workaround must be used to overcome the ctx timestamp issue  
  1\. For BCS/VCS/VECS:  
  \-- In the Per-Context WABB (workaround batch buffer) Software must program 3
  back to back LRM (MI_LOAD_REGISTER_MEM) commands with  
  \- For RCS/CCS  
  \-- In the Indirect Context Pointer, Software must program 3 back to back LRM
  (MI_LOAD_REGISTER_MEM) commands with  
  Dw0[19] = 1, Register Address = CTX_TIMESTAMP and Memory Address = LRCA +
  108Ch.  
  2\. The first two MI_LOAD_REGISTER_MEM commands must have Dw0 bit 21 = 1  
  3\. The third MI_LOAD_REGISTER_MEM command must have Dw0 bit 21 = 0  
  4\. All three commands must have “Add CS MMIO Start Offset” Dw0[19] = 1 to
  enable auto addition of CS MMIO Start Offset.  
 
  For Example in case of RCS, if LRCA for a given context is DEADh the below
  commands must be programmed in the per-context workaround batch buffer.  
 
  1\. MI_LOAD_REGISTER_MEM ( dw0[19] = 1, dw0[21]= 1, REGISTER ADDR = 3a8h,
  Memory Address = DEADh + 108Ch  
  2\. MI_LOAD_REGISTER_MEM ( dw0[19] = 1, dw0[21]= 1, REGISTER ADDR = 3a8h,
  Memory Address = DEADh + 108Ch  
  3\. MI_LOAD_REGISTER_MEM ( dw0[19] = 1, dw0[21]= 0, REGISTER ADDR = 3a8h,
  Memory Address = DEADh + 108Ch
  """

As I look at this closer, I see two strange things with this description.
First the beginning of the workaround specifically states that BCS/VCS/VECS use
per-context WABB and RCS/CCS use indirect context pointer...but then the
example at the bottom is supposedly for the RCS engine, but says "per-context
workaround batch buffer."  Second, as you pointed out below, 0x108C into the
LRC isn't the location where CTX_TIMESTAMP is stored.  The first page of the
LRC is the pphwsp, so once we jump past that we're left with an offset of 0x8C
into the state area, which (if I did the napkin math right) would be the
location of CS_GPR7 (and not the context's value of CS_GPR7, which would be at
0x108C+1, but rather the offset of CS_GPR7).  So it seems like we'd end up
loading a value of ($enginebase+0x618) into the timestamp register which
doesn't really seem to make sense.

So I'm not sure if this workaround is missing steps (e.g., are we supposed to
do stash the timestamp into a GPR at some point?), whether it's making
assumptions about driver behavior that only hold true for the Windows driver,
or whether the memory address as incorrect and it was supposed to be the the
location of the CTX_TIMESTAMP value in the LRC (i.e., 0x22+1).

It sounds like the underlying problem here is basically that the LRI in the
context restore races with the regular operation to periodically increment the
timestamp value, causing the LRI's value to occasionally get lost.  It makes
sense to me that that doing the pipelined sequence of or LRM's of the
CTX_TIMESTAMP location within the LRC to forcibly load the state would take
different hardware paths from the simple LRI and might not be succeptible to
the race.  But doing those same LRMs from an unrelated GPR register seems
counterproductive, unless there's some other step that wasn't mentioned.


> > have dw0[21] (i.e., async mode) enabled, and the third should have it
> > disabled.  I'm guessing this got implemented in i915 before the formal
> > workaround description was finalized, or the hardware people updated the
> > description after we'd already implemented the workaround.
> > 
> > That will also prevent us from clobbering the GPR register, which will
> > let us drop the restore_scratch function.
> 
> I only realized this was unclear when I went to work on a respin to address
> it.
> 
> Are you saying the workaround specifies to read from LRC CTX_TIMESTAMP into
> LRC+0x108c? This wouldn't be MI_LRM though.
> 
> Or read from RING_CTX_TIMESTAMP into LRC+0x108c? And this wouldn't be MI_LRM
> either.
> 
> So I don't know what three back-to-back MI_LRM the workaround actually asks
> for.
> 
> Especially when it says first two should have async mode enabled. So maybe
> not to, but _from_ LRC+0x108c? Into RING_CTX_TIMESTAMP three times?
> 
> In which case the question would by why LRC+0x108c. That is where GPR
> registers are saved, right? But it is not GPR0, which one I am not sure
> because I am confused by the fact TGL PRM says that in LRCA there are 64
> dwords for 16 64-bit registers, which should be 32 dwords really, no?

The GPRs are 64-bit registers.  But inside an LRC, restoration of a 64-bit
register is always done as LRI's of the upper and lower dwords separately.  So

   LRI instruction header
   ...
   CS_GPR0 ldw offset
   CS_GPR0 ldw value
   CS_GPR0 udw offset
   CS_GPR0 udw value
   ...

So four dwords in the LRC to restore each GPR register, which results in 64
dwords total.


Note that the CTX_TIMESTAMP register is just 32-bits on these older Xe1
platforms; it was extended to 64-bits in Xe2 and beyond.


Matt

> 
> Even in this case I don't see how writting a random GPR into a
> RING_CTX_TIMESTAMP makes sense.
> 
> Regards,
> 
> Tvrtko
> 
> > 
> > > +
> > > +	return cmd;
> > > +}
> > > +
> > > +static u32 *
> > > +xelp_emit_restore_scratch(struct xe_lrc *lrc, u32 *cmd)
> > > +{
> > > +	*cmd++ = MI_LOAD_REGISTER_MEM | MI_LRM_USE_GGTT | MI_LRI_LRM_CS_MMIO;
> > > +	*cmd++ = CS_GPR_REG(0, 0).addr;
> > > +	*cmd++ = __xe_lrc_regs_ggtt_addr(lrc) + CTX_GPR0 * sizeof(u32);
> > > +	*cmd++ = 0;
> > > +
> > > +	return cmd;
> > > +}
> > > +
> > > +static u32 *
> > > +xelp_emit_cmd_buf_wa(struct xe_lrc *lrc, u32 *cmd)
> > > +{
> > > +	*cmd++ = MI_LOAD_REGISTER_MEM | MI_LRM_USE_GGTT | MI_LRI_LRM_CS_MMIO;
> > > +	*cmd++ = CS_GPR_REG(0, 0).addr;
> > > +	*cmd++ = __xe_lrc_regs_ggtt_addr(lrc)+ CTX_CMD_BUF_CCTL * sizeof(u32);
> > > +	*cmd++ = 0;
> > > +
> > > +	*cmd++ = MI_LOAD_REGISTER_REG | MI_LRR_SRC_CS_MMIO | MI_LRR_DST_CS_MMIO;
> > > +	*cmd++ = CS_GPR_REG(0, 0).addr;
> > > +	*cmd++ = RING_CMD_BUF_CCTL(0).addr;
> > 
> > I don't see any documented workaround asking us to do this restoration
> > of the CMD_BUF_CCTL register.  I suspect the i915 implementation was
> > either something for pre-production hardware that never should have
> > stuck around in the driver, or it was hacking around some other driver
> > bug.  Are you finding this to actually be necessary for something today?
> > 
> > > +
> > > +	return cmd;
> > > +}
> > > +
> > > +static u32 *
> > > +xelp_setup_indirect_ctx_rcs(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
> > > +			    u32 *cmd)
> > > +{
> > > +	/* HSDES#16010904313 */
> > > +	cmd = xelp_emit_timestamp_wa(lrc, cmd);
> > > +	cmd = xelp_emit_cmd_buf_wa(lrc, cmd);
> > > +	cmd = xelp_emit_restore_scratch(lrc, cmd);
> > > +
> > > +	return cmd;
> > > +}
> > > +
> > > +static u32 *
> > > +xelp_setup_indirect_ctx_xcs(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
> > > +			    u32 *cmd)
> > > +{
> > > +	/* HSDES#16010904313 */
> > > +	cmd = xelp_emit_timestamp_wa(lrc, cmd);
> > > +	cmd = xelp_emit_restore_scratch(lrc, cmd);
> > > +
> > > +	return cmd;
> > > +}
> > > +
> > > +static void
> > > +xelp_setup_indirect_ctx(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
> > > +{
> > > +	u32 *start, *cmd, *regs;
> > > +	struct iosys_map map;
> > > +	u32 ggtt, offset;
> > > +
> > > +	if (!(lrc->flags & XE_LRC_FLAG_INDIRECT_CTX))
> > > +		return;
> > > +
> > > +	offset = lrc->size - LRC_INDIRECT_CTX_SIZE;
> > > +	ggtt = xe_bo_ggtt_addr(lrc->bo) + offset;
> > > +
> > > +	map = lrc->bo->vmap;
> > > +	iosys_map_incr(&map, offset);
> > > +	start = cmd = map.vaddr;
> > 
> > Isn't this going to be a problem if the iosys_map is holding iomem?  If
> > we're going to build the indirect context batch directly with CPU
> > pointer accesses as the functions above do, don't we need to do that in
> > a separate buffer and then copy it into the iosys_map?
> > 
> > 
> > > +
> > > +	if (hwe->class == XE_ENGINE_CLASS_RENDER)
> > > +		cmd = xelp_setup_indirect_ctx_rcs(lrc, hwe, cmd);
> > 
> > This also deviates from the documented workaround.  According to the
> > workaround database, INDIRECT_CTX should be used for RCS/CCS, but we're
> > supposed to use BB_PER_CTX_PTR instead for RCS/CCS (both are similar
> > mechanisms, but INDIRECT_CTX happens somewhere in the middle of a
> > context restore, whereas BB_PER_CTX_PTR happens at the very end of the
> > context restore).
> > 
> > 
> > Matt
> > 
> > > +	else
> > > +		cmd = xelp_setup_indirect_ctx_xcs(lrc, hwe, cmd);
> > > +
> > > +	while ((unsigned long)cmd & 0x3f) /* Align to 64B cacheline. */
> > > +		*cmd++ = MI_NOOP;
> > > +
> > > +	map = __xe_lrc_regs_map(lrc);
> > > +	regs = map.vaddr;
> > > +
> > > +	regs[CTX_CS_INDIRECT_CTX] = ggtt | ((cmd - start) * sizeof(u32) / 64); /* Size in CLs. */
> > > +	regs[CTX_CS_INDIRECT_CTX_OFFSET] = XELP_CTX_RCS_INDIRECT_CTX_OFFSET_DEFAULT << 6;
> > > +}
> > > +
> > >   #define PVC_CTX_ASID		(0x2e + 1)
> > >   #define PVC_CTX_ACC_CTR_THOLD	(0x2a + 1)
> > > @@ -997,6 +1106,10 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
> > >   	lrc->size = ring_size + lrc_size;
> > >   	lrc->ring.size = ring_size;
> > >   	lrc->ring.tail = 0;
> > > +
> > > +	if (xe_needs_indirect_ctx(xe))
> > > +		lrc->flags |= XE_LRC_FLAG_INDIRECT_CTX;
> > > +
> > >   	if (xe_gt_has_indirect_ring_state(gt))
> > >   		lrc->flags |= XE_LRC_FLAG_INDIRECT_RING_STATE;
> > > @@ -1127,6 +1240,8 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
> > >   	xe_lrc_setup_utilization(lrc);
> > > +	xelp_setup_indirect_ctx(lrc, hwe);
> > > +
> > >   	return 0;
> > >   err_lrc_finish:
> > > diff --git a/drivers/gpu/drm/xe/xe_lrc_types.h b/drivers/gpu/drm/xe/xe_lrc_types.h
> > > index 559c7c831212..9ce7d02ef210 100644
> > > --- a/drivers/gpu/drm/xe/xe_lrc_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_lrc_types.h
> > > @@ -29,7 +29,8 @@ struct xe_lrc {
> > >   	struct xe_gt *gt;
> > >   	/** @flags: LRC flags */
> > > -#define XE_LRC_FLAG_INDIRECT_RING_STATE		0x1
> > > +#define XE_LRC_FLAG_INDIRECT_CTX		0x1
> > > +#define XE_LRC_FLAG_INDIRECT_RING_STATE		0x2
> > >   	u32 flags;
> > >   	/** @refcount: ref count of this lrc */
> > > -- 
> > > 2.48.0
> > > 
> > 
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
