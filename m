Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 772E7C19F4F
	for <intel-xe@archiver.kernel.org>; Wed,  8 May 2024 00:45:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 315CA1123E9;
	Wed,  8 May 2024 00:45:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KkY4w3g1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BFB61123E9
 for <intel-xe@lists.freedesktop.org>; Wed,  8 May 2024 00:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715129155; x=1746665155;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=b0eqJVGxaf0dDHRFT/yWZLGhy2asghu+ykYyHM/oKVA=;
 b=KkY4w3g11m2ZaG/JR4s0Qgzd6umKxNvpsuwubPNXzkLNucvF92nNq1CY
 uRY29IUASdY2IERHqPlzTMcNOpjyEjkQ4m+V4sSJPYNpO8HJYl3gAq0bW
 JVvsDWNLoFtdZno4+0JGuliHSv5ssv1D6dBUh5fgzk8yDX1V47Ahlh2T4
 1YoGAuTRXGAhbQf0GXGx5oMCjFFJvmFDR4cMMDzut9edN/4ZeVRAkJGLd
 mE6/WbdmdphrHXpDhX4FNRa8gCySVpa/bD48yOlDKot147G7nAKmcoMUc
 zk/Z/EFPenWCqLuljz2GDJmC5zD99tweyYlrTGm34ZEF0PHNfwMb8z1Mr A==;
X-CSE-ConnectionGUID: UDvNEEscTvu8XLlMN8uONw==
X-CSE-MsgGUID: znb2BjC8SkGlv63XwSupzQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11066"; a="22354971"
X-IronPort-AV: E=Sophos;i="6.08,143,1712646000"; d="scan'208";a="22354971"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2024 17:45:54 -0700
X-CSE-ConnectionGUID: jB2jc0GQSLuJDXEHBZnEgA==
X-CSE-MsgGUID: ixDV49xlQO2fm0GLmtcq3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,143,1712646000"; d="scan'208";a="66132159"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 May 2024 17:45:54 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 7 May 2024 17:45:53 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 7 May 2024 17:45:53 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 7 May 2024 17:45:53 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 7 May 2024 17:45:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HKe1Atmw6YViGGpTlGQbVtaumme5cu5Pjg/0AG8qAZftnYgyvdGJdDWeb2LRrYnIjvRS+iJ1fAkClDSiTpWuOMxedx0pbCIHbFaVSLUWQHZK30Qx/HZjKssr1L3imndfkqWU+wVz2wBM9O2R+9PMrDEQB1rGBpwl4H05ysbGbivlQP0QJr5NndFIm1iqpl68MU8OY72d1KtCbB7YD/Kp5ZVumtjX9g4O11nKKLXq006wmDEa/2p8wKcS2Sq8hk5DisSmO18w81yTLo4ko+SFwEhod86sjh2CzMsPEnVCkjz7yRZXSezGZYkSM99oAm7XoDzN13CxtZ5fNM0Jlwa+JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yugJkNLBUeTOdeD/JQqbfg/4yDNmCWJeE1zKHDMo8nI=;
 b=OsGENx8ICeD4qaqGnJ1cMwXKVbODII52nPMLJkJiApxbRwHhDDPirsxXjCco/joM44tlmiJQMajIBTqbFugUpGdTQrl53EVnFC3Mq6Yej9x9C5fwUeoqchqBMKMxUtL+kK8SKLULpXgAG+B4PDTBD0WYdopqvLAhj8kG+xax8WpzdT4vRJwmZQUjOmXllnKYxVSm4lOe7qZn7eBNFY8Bxw8RC40F3HAa9KMOXiHDxLrK8yUFkQJpS3EQTV4yIfSadk8TYvtiK1KnwLhj+1TjeLItt2TDtbHuCKrISLiA1pO8f1A4x/0THqfBzywx5om4V9DJw3wF/7C91TJHmb4Yuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB7705.namprd11.prod.outlook.com (2603:10b6:806:32f::16)
 by CYYPR11MB8408.namprd11.prod.outlook.com (2603:10b6:930:b9::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.42; Wed, 8 May
 2024 00:45:51 +0000
Received: from SN7PR11MB7705.namprd11.prod.outlook.com
 ([fe80::25b5:e7:8133:d2c6]) by SN7PR11MB7705.namprd11.prod.outlook.com
 ([fe80::25b5:e7:8133:d2c6%2]) with mapi id 15.20.7544.041; Wed, 8 May 2024
 00:45:51 +0000
Message-ID: <62b732cf-9a83-4d7a-bc98-ffb6e3fdbfc8@intel.com>
Date: Tue, 7 May 2024 17:45:49 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/vm: Wait for availability if fault mode is
 mismatched
To: Jonathan Cavitt <jonathan.cavitt@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <saurabhg.gupta@intel.com>, <tomasz.mistat@intel.com>,
 <himanshu.girotra@intel.com>, "Brost, Matthew" <matthew.brost@intel.com>
References: <20240503190138.1958302-1-jonathan.cavitt@intel.com>
Content-Language: en-US
From: "Welty, Brian" <brian.welty@intel.com>
In-Reply-To: <20240503190138.1958302-1-jonathan.cavitt@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR11CA0103.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::44) To SN7PR11MB7705.namprd11.prod.outlook.com
 (2603:10b6:806:32f::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB7705:EE_|CYYPR11MB8408:EE_
X-MS-Office365-Filtering-Correlation-Id: 0de25b57-6e7a-4ff1-b3e4-08dc6ef835db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZUczcU9qcHR6ZkMyVTdudWpzRlFYbmhha3IrM0J6eThGTzR2WGdvdy8wUkJD?=
 =?utf-8?B?OTl6NHpJMHR6WEgyeEt5M3cvWDhIR1pxa0hGMUNpb2ZNV1hiOHJ4cXh4NVVI?=
 =?utf-8?B?aURydzRjWndRYS8wWnQzV0lIV0NERzdpQjFNbkVUbUdlYkM1TGc0UHhjaHBC?=
 =?utf-8?B?cHlyY2s5OVFWZDFjZ2F4elJrUGZnNmMxMEZzOHU0OEpWK2hRNjYrUllrYTVB?=
 =?utf-8?B?MFFDR25tQTQxajl0cUVPZDhXQWFlOXVQZk1pQkhpUDlhenRaWk81NEpkVmVN?=
 =?utf-8?B?RGFua3lOQ0xEdHI4WVg1Wm9Xb2lkZWljemZYUGNybHFCODRYTVM5ZzFKcHQ5?=
 =?utf-8?B?Zk5VSExuR3BldU15ZUV2WkxzZDB6c01jV0lnanFpNDFFaEhHeFlrNWJ6Qnp3?=
 =?utf-8?B?dTFXVGlCcWtsbHoxRTM2bDhvQ292d0lHYUVPeGc5aXhMcG5kTXdaUDlLZSs5?=
 =?utf-8?B?UE9CZmJEZ2NVSjNzOVFWMERKQ2NHOHFuYnU1VTc3clQ5Rk4zQnhESHlBNkgw?=
 =?utf-8?B?VUpxampMNHIrL1dxd1J1Q2NSdWl3dnRkZ056V3ltM0l3MDA5VlNWaTJtalJO?=
 =?utf-8?B?dUlNSlhRaEpUV3VDaTRQNFRUb2FoYzhTM1FxQ0pCQmVsKytIM2VEY1Vad0FG?=
 =?utf-8?B?MVlKNTNtOEFRK1BoV09Lc2NXUEFWRS82UTVnbnQrTElKWGJwQ2hjM0l2VWJt?=
 =?utf-8?B?cEhjY1Jsb3JLekt5cVhlNW0zWll3aFBpdFFZR1hkQUIxbzJ2ckttalVJakdN?=
 =?utf-8?B?RGlZTk9mSkNBN1M5K2VtK05mdmhWOUdPbjB0aG02YXcwMVJmNGJZRnBXQkxw?=
 =?utf-8?B?QUFLUzFiZFQ1WU5qeHhFZlBzUEhvcWhBbnVMMHZGWmRoaXVyeFErZ0x0UERk?=
 =?utf-8?B?VUNTN1lVR0pnOWpXSTF2YTNRckpFajVpUkdCSktQZmxzeWd2ZkxNV2g4Q1Vh?=
 =?utf-8?B?MnZva28rdnkvMmpsK29rcjVRblh2ZURjTEZZNlNlSG1YNng1ell2UUVFWW9n?=
 =?utf-8?B?bFRGREV4enpsVHNqSE5iZ1U1bXU5NUVyUytoU1Mxd0VsZStiUzN6ZHVjL2pn?=
 =?utf-8?B?dzg2Q0o0SzJyOUNiWFZMYW0yeFJyOEI4SGJXSXNvRHpRRWozMWhkeEdqYzJX?=
 =?utf-8?B?Q0NMa0RkbDFhRGJ4VURTTzJNZSs3aGt3TG1vbGtCRlNpOWxPZCtYdVBxWDAz?=
 =?utf-8?B?ZUE4TWJqcUxEUlNrYi9nR0RmN1kvNGx0SkxPUWZBeHRNQ3hxUXFueFQzYzFz?=
 =?utf-8?B?eEplemZFQWFkcmQwdmxOWDhQSUM3YllqaHVGdlZEdnl2NitwckdheXllbU11?=
 =?utf-8?B?eFRPSlpRcDJKOFllbGk0dzExMUsyYUx6SFhObUlPMGRaeGJhaVkvZ3RIaVdu?=
 =?utf-8?B?b3h2NUZTeE9pTWpNOXZRQlQ5Mi8waWI1ZXBqTzViNk1Tb0FJalFzRWw0ZzBn?=
 =?utf-8?B?NE5laTZCQ1JRWEgybENWUzBKZUJldzkxc2RDblp4NlhiRjFobFJKVE5iRm9s?=
 =?utf-8?B?OVBsaG5kMG1HR2Y3aUNJTzY4WHpBaFlZK2p1M3pCV3JEWnRNaXZpTllTN0hL?=
 =?utf-8?B?SzBTbWpZMS9nUCttNWJmL0lWLzhRSlNFelpzY1YwT1V0TktqYUNSZ0U1K0t1?=
 =?utf-8?Q?OqADJ7mu2qGaKzuIAF+uV6md/SpV/cAW1n5rt4m14ia8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB7705.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WUJwblpkWTNFNUZPeURYeTFHdUM1aUh1dm80NVlNZTFNbGFPTzhKQjM0dUh5?=
 =?utf-8?B?M0ZCT2RYelZPemVuTXgwSVBndFNKZ1JuUHZNbkhkZ3oyeVFYUmlMZklEWVZo?=
 =?utf-8?B?ZTZEaktOTXpVRFhrMml6SGVSUkJZd1BySnc1dlRTeThhNndVNWp3SVhORUln?=
 =?utf-8?B?NVY0OUhZZ3l5R3BNaGM0azRrZUVQQ1ZScW5qd0diemdzL3pERVJYSnZZOWQw?=
 =?utf-8?B?dUswRDR3OEltZlE2b1ZXZ1BaMmdualpnTThKeGNlT0pQYm1PQXJTTndmS1By?=
 =?utf-8?B?cUNhWFhRdFgwZzlJL3RFaEVFOFIxaGk2QnVzeWJhRFc4TmliS3k3SFpPTGJP?=
 =?utf-8?B?OUkvUXNseTJIenFxVkd4SURRNkdJR3dyQ0FvR0pSVGFNYjZtejNlUDYvdGMw?=
 =?utf-8?B?bnFWc3pSZmlFTXdHRGt1WWVzMVZZUjRHU2N4SlpqVjFlbmxEanpCcnhmbHZy?=
 =?utf-8?B?dkRuZ3F3RUVIU08yME9GaHRjK2pDWWFRNVM3K3ZTY3RDVHptQ1hZRUxsVDFP?=
 =?utf-8?B?Wlo5VW1BY200NkRlVllNb0J3NStZWDF4eUVMOS9xTGFEZW11UkRmTjJ0Y01w?=
 =?utf-8?B?YU03aVVhTXpSWERDZTRTT0l3VDQ4T2ppaTg1SU5QcGdWbWY3QUVZUzc1K21F?=
 =?utf-8?B?OXRFUnppdlF4SWdDNTdBSWFaeHk4bTZTclo2VWl1a3dDSlJ2eUpEd3NWNkI4?=
 =?utf-8?B?YUxiMGltclY1SmxXeHJTVkFFRm82WThTUWE0YnZjMDdySjVIYVM5ck1NNmdB?=
 =?utf-8?B?OGNpMFJ2Rzl2SEtzc2QzMWcrQ0RwSS9LbGlQaUMzTG1raUtoSlNobjZValFX?=
 =?utf-8?B?dDRkUEtUQS9XZ0RnWHIzcUdhS3RvSVkrcjQ0R3RCcCs5bUVuMWw2b2Z1UFJ6?=
 =?utf-8?B?cVI1a1lQbmFsb0N5b2kwVnpIdHM5czFhYnp4NE0wVEdFQTdBdDRSVkwvcWF5?=
 =?utf-8?B?bnBUekJxQVpjS1gveUlsc1VSeGhVcFY1S1N1di9Nd2lzK0g3VmNTNUVqaWZl?=
 =?utf-8?B?aEMvSFB3Sk5yS0VLWFR6WndXVUdlQ1ZBa250eXMxOWhCMGJhZVMwcGt0RVpo?=
 =?utf-8?B?d1ZuV01KSVdCeURKdUZPNkxGdytPUkg2RjU4Ty9sMldYZjRSNStuK3UreHky?=
 =?utf-8?B?bFNselg1SUdsYS9wVVhwc1ZpZFBRT3I0a0tHNHNKSHk2QnR3S04yOGpYZlFq?=
 =?utf-8?B?Z1J4UzUrS2p3OEhNT2Q5SllMdEIxZzMzbTJUSVJaZVJ4NFJFQXlnTDJtM1kr?=
 =?utf-8?B?L2JReS95U0lzaFA5SGYyWUhhaldnTWlkNmNSVGljdmFwTnVqNU1QdHVpQjU1?=
 =?utf-8?B?Z1Fuc2FuL1NIM2RDRFJIMFRxbTJnbElNN0JiTXN4STE1TGFrLzNGanJGT3RZ?=
 =?utf-8?B?RFR6b1pEaGxTVWFIZlp0T2V4MWVyQWxac2x6MjhaWWdhY2hvRU9JRzZkbE9Z?=
 =?utf-8?B?Rk5RUWR3Qk1uOEhzWUMzSFBLc0V4OVhQNkJUSDhIOGRSRE5zZ05KZVZCL0lp?=
 =?utf-8?B?dnRiOXZqYXlOSngrdi9wcGQyOU5FYVVvamhBblhram4xNEt4TVRESlp0aVQz?=
 =?utf-8?B?dTVpNlRBVXVhakNtVnlFYldsSmM5dkJNSGZGU3dSZWdaemxERkVaS3JGYkZI?=
 =?utf-8?B?bldyTnEycnVFMHpPYjJlbFBaQzZRbGs3cWRXV2U1YWRnUEZlazF5ajZQbWJ6?=
 =?utf-8?B?M1FJVm9ldmRHdlRNRWpaVk1NNnpxTFozY2ozV2ptdE5lMk95K0FYbzNWY0ov?=
 =?utf-8?B?OVRGYlR4c1RRcjJoZ1JHTWpPM0FXTHExbUhrSDdFQ2JhcmwvNnFHMm9VdmJY?=
 =?utf-8?B?WnZ4QTJUS0hxZnZEdCs0QmZDQ1l6RUMyeEgrQTNEN3BRVVpTa3h6VWw2UzYr?=
 =?utf-8?B?aElHZ1d2eGNIQmswUmQzTEllcytZZVAwQjlIVisvWWJHQ3NlS3k3a0FkQ2o2?=
 =?utf-8?B?U1FWeWZ0WHljMVppZnFTMGl1TFByQlhtZklwNFdiOGhETWg4enJ2dUcwa3Fy?=
 =?utf-8?B?V2w5T2lFYkRSYjFZZGszTzMrRGxpWGREalBFWjJVL0N1OGFJMTd6VkxWdEhl?=
 =?utf-8?B?Y2VvckJISWZLQWxMbGtuSy9rY1diWmk0Yk1vNEdqakNuOVpEVDB4bWt3RlY2?=
 =?utf-8?Q?4ny9GIDcqZo9hehVrI+ojPg0i?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0de25b57-6e7a-4ff1-b3e4-08dc6ef835db
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7705.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2024 00:45:51.5995 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LFGsm9duhz87PgnjZp2VbCfFyheU7iJuN+1Dy5tUlkF4u7KSJxAWEBOQDwdbqGZIgSyeX1chRuA/3U4oNF9APQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8408
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



On 5/3/2024 12:01 PM, Jonathan Cavitt wrote:
> Just because xe_device_in_non_fault_mode (or, equivalently,
> xe_device_in_fault_mode) do not match the requested VM type does not
> mean that running the VM in that mode is invalid.  It only means that
> there presently exists a VM active on the system that does not match the
> requested type.  The VM could be left over from an old test that wasn't
> cleaned up properly, but the more likely cause is that multiple tests
> running concurrently is resulting in the system falsely report that the
> VM fault mode is not supported.
> 
> Instead of saying the VM cannot be created, ask the user to try again later.
> 
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1562
> Suggested-by: Brian Welty: <brian.welty@intel.com>

Hi Jonathan,

When I suggested this I also mentioned I sent the KMD piece out for review:
https://patchwork.freedesktop.org/patch/590930/?series=132803&rev=1

Feedback per Matt B was to discuss with maintainers as apart of larger 
cleanup/review of CREATE ioctl flags.

-Brian


> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_vm.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index c0cf531a115d2..8541cfd50730e 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -2057,11 +2057,11 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
>   
>   	if (XE_IOCTL_DBG(xe, args->flags & DRM_XE_VM_CREATE_FLAG_FAULT_MODE &&
>   			 xe_device_in_non_fault_mode(xe)))
> -		return -EINVAL;
> +		return -EBUSY;
>   
>   	if (XE_IOCTL_DBG(xe, !(args->flags & DRM_XE_VM_CREATE_FLAG_FAULT_MODE) &&
>   			 xe_device_in_fault_mode(xe)))
> -		return -EINVAL;
> +		return -EBUSY;
>   
>   	if (XE_IOCTL_DBG(xe, args->extensions))
>   		return -EINVAL;
