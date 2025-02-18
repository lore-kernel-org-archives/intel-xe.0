Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85A0BC021AA
	for <intel-xe@archiver.kernel.org>; Tue, 18 Feb 2025 16:31:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FF8D10E3D4;
	Tue, 18 Feb 2025 16:31:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JInIwDo3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC20410E3D4
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Feb 2025 16:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739896311; x=1771432311;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=iLj0Etu+0bH3ADggEasn6bdnHHEmyiy1jwhM/RNPTy0=;
 b=JInIwDo3GyGtsiROkJrFzPPYIvSd6qEkotVpNCooaEJwTk7K3QC593cY
 U3UDPC2C2nzDQTtUP0jFb8vIzD32/wU1oWMjpCDTXF9iy750QRZbY4G24
 UW8d/OEONGJtF6SBK1TBaAZO9WZweykyKzp3dvmmQF5keSZLH9PhSVMRo
 ljzaIYXZnMWRVa2958wZf9LWB7x3AZ3Qi48rxe0pMMCqtHR56a6qdWeuJ
 V/CIGthXco84qLLjVVdkMVpSbMhXGUdVw4uQ+SzTRan/CC4WkjLIL/brW
 xq5uiB0lqJdNwO8h0FCTsm5oK7SBQXQ5fJbu3ocG0QYmewgQX2wfAALAa w==;
X-CSE-ConnectionGUID: PZelGj6cTH6k4YXYi/VkHw==
X-CSE-MsgGUID: crcmMh67T16sfNgQa00/XA==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="40622881"
X-IronPort-AV: E=Sophos;i="6.13,296,1732608000"; d="scan'208";a="40622881"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2025 08:31:50 -0800
X-CSE-ConnectionGUID: tyer3rAWT0WS56tTuuPG1A==
X-CSE-MsgGUID: DHu7sojBSWSfqVcBmDtWBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="119086061"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Feb 2025 08:31:50 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 18 Feb 2025 08:31:49 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 18 Feb 2025 08:31:49 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.177)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 18 Feb 2025 08:31:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tbiiUcp2V1RBwpD/+qvRIdyDoyVBQolU/FSo6b3LwL/bxEXnOgzyKGZEvWOF3bwgsDKX1fxsJA/6sw/CcFiB8pz9Osz6QECCEGh2/7d12n1eC/1swIuy1U7WW3tFm539zyQJicwUPQZ+mevLeCg+0SoqA7C5efPz1XBgZGqBbowMrxzpPwXjdRYX7EPwde+L0mruqdA5fnxvru4TRGZrUL53qWX4sltN69bUNZ+Wab2QmHKFu2bcBRQi6/rsF6GYJlPHk/4NT0UzJIqU6joxqa+WhKF+KcY4LVV3F19kvY1a+9jrusDy3insjvSTdN0GTPtL1evY0G5fL3qZbyzYfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YSQbFNpCNzq6ldWJ8RqVdq2bpdno84Ilo4gf2xMwVK4=;
 b=fmN0j543h2xMlNN8HRX3tai2nyl5jb4piXL3FFdcAtbLRtV8tiXWTNXyaP5riYa2H32MDuJQjbMwfAfgRraaFq3I+reeN2rhzU5EN8FX2TD7ZcyAwPIAQzhl5raRfNx8E54gdhBfKBdhdGLt3ZL+P1sgiWw4CylzuO65Iu/H9P8Z+bGLqXbDBL2BJ9UNBal9pCLjL56Lafw9hR9DhTHJJJIKLtOLZQYnOVv5qFVDZzU3q3czBD/Yz7EcfGvhkZue/huM8qzsq75WbUJLvyTSTDM6N/rgol1peXl2Dm94ncPnb5rYfHOOwciFvq9VA9/o2G4qXoI6TIEzihPSwDZicg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MW3PR11MB4732.namprd11.prod.outlook.com (2603:10b6:303:2c::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Tue, 18 Feb
 2025 16:31:47 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%3]) with mapi id 15.20.8445.017; Tue, 18 Feb 2025
 16:31:46 +0000
Date: Tue, 18 Feb 2025 10:31:43 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Ilia Levi <ilia.levi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.d.roper@intel.com>,
 <koby.elbaz@intel.com>, <yaron.avizrat@intel.com>,
 <michal.wajdeczko@intel.com>
Subject: Re: [PATCH 1/2] drm/xe: s/xe_mmio_init/xe_mmio_probe_early
Message-ID: <dkdg2oep4ne7inhtsfipaddwdtrfdvevhws3a4ytni7eov4u2p@lpmbwwemco7o>
References: <20250130105057.136586-1-ilia.levi@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250130105057.136586-1-ilia.levi@intel.com>
X-ClientProxiedBy: MW4PR04CA0387.namprd04.prod.outlook.com
 (2603:10b6:303:81::32) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MW3PR11MB4732:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b73d73d-6043-4b6b-55ea-08dd5039bca1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4IYsh+J0kxskqdVgDXLYXNc6J/pWLWkQW28VaX6SV+UmWrUstDMVdfp7S2E7?=
 =?us-ascii?Q?MTrunPWGilGLi4Z3gXDPzWNfOfSsnVCYWpimfJFJNop7MyJna5C8bypgJm/O?=
 =?us-ascii?Q?VgQ0TVty2FjrkgRt+ehmSIn5ydcxbPgu0ISJJTDfBg04RSt8vC/IY9MdHBlK?=
 =?us-ascii?Q?4Vbeuqn1pStUgJEaOm5PHw0iwg/Zn0OD1bZYwlm/eH/NqXJM0Z9yv/Tg1FUq?=
 =?us-ascii?Q?1XZr9EI8uLtZZzy2wmEO20Jhhlh4db4Gwan4Szb3QdC4Xov2ksc8pjoxhbPv?=
 =?us-ascii?Q?KyET9Gb4igFbjbcYUlDuQ9fUYBr1mG/nRjy8YPCc4Ep+xlEGK/P4ngd/44a9?=
 =?us-ascii?Q?WYxkm1lLcqK5wqPb9Ph97nsatWHiBfGNraUYx89/9d3hlDi85Isyh0f0nu+/?=
 =?us-ascii?Q?P/fSC9HXDBnOd/m8XFalHzyt8B35qhi2GjHS1YadHPuupNpVCHqOB6pS2EWP?=
 =?us-ascii?Q?3qMP8Rfdmwg7kEF/CnxxL1r1urUZbVo12T1qkhmi6zo0lofrLYyqrFV+RMQ7?=
 =?us-ascii?Q?9+8cy2CzUsqPPQDKa145V4ZBNXsOe2v/Eoe5xU0BGLFYzslPyRgGOrEWZud7?=
 =?us-ascii?Q?UhtDk7gLPOpUal56naWS+IqHIn6RvPSCsvTn5mB6yGKv5OQP7rEIIAozz+rr?=
 =?us-ascii?Q?7WwZjKIwLx0zLk8qlURO8XI5//Sw+cjj05uY/H4V7xfcWVqjG7kwkCIO9zXU?=
 =?us-ascii?Q?9xXj+Me7PF34e1wDK5GskSZ8UxQvJ5/ny1sobT/Ykpd+ubU8f1pNycIeruaA?=
 =?us-ascii?Q?KoAW6eXkN3HWb0Vsa3kKE56Mzu7q9Qv0zXDqKU9Q2ConTYpP/zKxIV9yT3Rx?=
 =?us-ascii?Q?z0amgHhwOYJt/8tOoBA9icN+4VAI02txDXPqZX0qcU1w/s1MPlo6bzyb2/vD?=
 =?us-ascii?Q?kkS7f9WQJF5VTDNFhkKVJtz0Yh1eG/Mm53Y8vpfW/qkfmiU2hDeXo3EhX093?=
 =?us-ascii?Q?U7Xths/cGF3VbCZ5lZA8pVSklfD2X3u7WlrE+IG7LT0JuKMnycuFfe8SnA/i?=
 =?us-ascii?Q?KoCz6aEfSzjXRiZ5/B+piGTDXzQS2TYnmPWQFZjghejuTiFuWNOu3x7J+nzs?=
 =?us-ascii?Q?4WpLqIEtEJ8fmf9PBMY/MTh3kJ/EY9kLJPGh9kUetSG7DXkPK/AQGrlYY24M?=
 =?us-ascii?Q?EHcMt/wO7RHh43jUZDirNcD5Dx/XNTY4ft6Kxed1anitT8srqWxDdSJe1XAl?=
 =?us-ascii?Q?LIthAa0NhcHSJ4+xNiYnYs45z72DASDwG+soOTBjrXtmA2yUcBhWegzk187t?=
 =?us-ascii?Q?is2RXKjiQjrzksvlJp2IFEmiMeStoJTgm5Bb5IWd5PrOi27YOTyL5TJpa5Bg?=
 =?us-ascii?Q?dmaaEEODuB12P+kNik33jwtgPUcS4pHq8R6VLCR/WVizVQb75CxFVMfkmaIT?=
 =?us-ascii?Q?3bpL4FnA+c2CvoweMpBhJvdp8dUP?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TsN1C90LKcDrC8fX4eNDRf+bf7i6vA07cccTqgBFf1RUDZo4jlXtELcf5K8z?=
 =?us-ascii?Q?hASoOWfBGTxNr33JewkpVfbiLLpqta90dI/fUiIWR732njJeubXrXfYxq7i4?=
 =?us-ascii?Q?aK1lrSac7n8iSvvcPBj0SYi1h8YxoPsLTWioZQMVMepcm67m0ojj5rYUmSiy?=
 =?us-ascii?Q?AU+ZqWFkCjvm60dqXrvIDuy+WCqoCbIa6lNRwmh1vkQtci1NiRpZEUlRKuBj?=
 =?us-ascii?Q?ve8OwvSFb/xV6MGA/BrU2soRRAYAyKdIqtyQ/4ul/FZSacMy95IY3ojKeJu1?=
 =?us-ascii?Q?S4hZXggzvYiPhVZMnuP406szjQU+KNzCDJMQGXpJLLKw2Hf16Xcw31CtrV2N?=
 =?us-ascii?Q?2Zd9WtsiGzR30MsRMAhb3ha+4Kc7NlQ3e01UzQVN36Tw2UX3i4MHwHDGTjUm?=
 =?us-ascii?Q?1gs7kNCnCAzyCX0hujuKvHuLfy6oI8eDe8IrzRJ1GnhaGHnZXsGHH80/nJVT?=
 =?us-ascii?Q?5Eg12+/RCdG2ad5+xfrXmH7zTvN3Kdofv6RSkXAWnXRgn5303akjBT16ml0Z?=
 =?us-ascii?Q?gjyqahiFALEcC3+AuSNe7B3JCnWsoXcU7aCv8bMv1yB3Pq7IZfUwyQT2MiTF?=
 =?us-ascii?Q?08oYW23f7pnWYUH/kQcQmar6tR/fHLqpfljtevhgg0KlQSgmsdZLlyh+MeoB?=
 =?us-ascii?Q?JozBX+afqfrV82MvBFByChcYYozDyzR2t67YciIRMsq4oQD++6IW1ZI/0487?=
 =?us-ascii?Q?OPQepDCmXLY6XcX5CYG/rADm8aCnL4fn3yINxB6QQ0G6dCOLLBMhhK/RNA+8?=
 =?us-ascii?Q?fP+AhAYyjXzpHqUGvWpp/ogrDVTYCDe/id0KY3NY+Dnd5PuDyR2PJeL6JJoW?=
 =?us-ascii?Q?HBg5zlBDBg3n7WidPcZO4bKqW3D08OlUDiaHjkmonl6AIVmLFCqPGk3gGIZ9?=
 =?us-ascii?Q?d791rMoXwoIhIMBPQBDHOAEecsF9vM8xuy20FWXUYnZNGa7Wow29X5oL5jvc?=
 =?us-ascii?Q?M/sT4YbTwHaj2ZRPgGRkUokHbTgQpHzlpoGfrtJ0KVifkUR6vAekpEWUtFjZ?=
 =?us-ascii?Q?J61AWHjTq7PdPVdfjwmAcJnFV1k931Pk0dfXQ4uguyPiXfuBIGArFp7JdZ40?=
 =?us-ascii?Q?jAbyZCLTMFu6Q1XScHHfMR94JM/1awvRZsmVLwB/vVHY5OPXW8NNzEhadAy1?=
 =?us-ascii?Q?ctsndEFOHJxu4rf0aSf6WcYsxAmYm3Xa5FEMcQ4xeYYevpgKyS/2u9n7320o?=
 =?us-ascii?Q?j6mF26Ji3veFUB3YakKNnOth2ysd8VYw2slQLmTEYZBrheP6TS+Z9YGrHdlv?=
 =?us-ascii?Q?7rXdlg1LF2yZ7xGH4o2bDqGBJOZ8aGTZ6dFicU0atSRR5C7nywLImDPpTIYW?=
 =?us-ascii?Q?tpmVU8IB9oyejsXRnyp26s9xgbqwIAixJvXW+Sn5uDc8OPZNmDjO1d6b1vV6?=
 =?us-ascii?Q?HaHnRwMT6/DCJPMWNetvALCjGEBazCuPk4Y56ruQbNtB2dX0O1tr8RlMBFTr?=
 =?us-ascii?Q?PxeYRHfutdLn7jaHxWajyYJM/WCwcnarT9fURHlosgK0anlBUSG64Sy0NKSy?=
 =?us-ascii?Q?f5ZQmUMhrVpqny2NwLznMCwryvTKnVV3q6EJyYeTRGqstxacYaj9U093frVo?=
 =?us-ascii?Q?0TI9PieRS2pWYZbzmx99PWsPn3KQiQcUUMWYGwMDyjhR2c9ZPhUW/kcZVSKk?=
 =?us-ascii?Q?Xg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b73d73d-6043-4b6b-55ea-08dd5039bca1
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2025 16:31:46.8076 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZEC9Kxl1sQyMEiosBMusEr30dB5L8OTwzD4WjLaZmNwvxeGDsH3Z4ee5VDGyWcX8X/VQpop8cBZ6lUrCsEydPtvRaGAIRrvY1l5gFi1Ov2I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4732
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

On Thu, Jan 30, 2025 at 12:50:56PM +0200, Ilia Levi wrote:
>Rename so that xe_mmio_init() can be used in subsequent patches to
>initialize an instance of struct xe_mmio.
>
>Signed-off-by: Ilia Levi <ilia.levi@intel.com>

Thanks for patches and reviews. Both patches applied to drm-xe-next.

[1/2] drm/xe: s/xe_mmio_init/xe_mmio_probe_early
       commit: 5bee1e2de39fe41be132ee389529407212894582
[2/2] drm/xe: Add xe_mmio_init() initialization function
       commit: eb79d71e506a1caeb0dedd1bab0e6899e8e74f5b

Lucas De Marchi

>---
> drivers/gpu/drm/xe/xe_device.c | 2 +-
> drivers/gpu/drm/xe/xe_mmio.c   | 6 +++---
> drivers/gpu/drm/xe/xe_mmio.h   | 2 +-
> 3 files changed, 5 insertions(+), 5 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>index 8fedc72e9db4..f6c01028c527 100644
>--- a/drivers/gpu/drm/xe/xe_device.c
>+++ b/drivers/gpu/drm/xe/xe_device.c
>@@ -685,7 +685,7 @@ int xe_device_probe_early(struct xe_device *xe)
> {
> 	int err;
>
>-	err = xe_mmio_init(xe);
>+	err = xe_mmio_probe_early(xe);
> 	if (err)
> 		return err;
>
>diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
>index d321a21aacf0..3aed849a128b 100644
>--- a/drivers/gpu/drm/xe/xe_mmio.c
>+++ b/drivers/gpu/drm/xe/xe_mmio.c
>@@ -60,7 +60,7 @@ static void mmio_multi_tile_setup(struct xe_device *xe, size_t tile_mmio_size)
>
> 	/*
> 	 * Nothing to be done as tile 0 has already been setup earlier with the
>-	 * entire BAR mapped - see xe_mmio_init()
>+	 * entire BAR mapped - see xe_mmio_probe_early()
> 	 */
> 	if (xe->info.tile_count == 1)
> 		return;
>@@ -74,7 +74,7 @@ static void mmio_multi_tile_setup(struct xe_device *xe, size_t tile_mmio_size)
> 		/*
> 		 * Although the per-tile mmio regs are not yet initialized, this
> 		 * is fine as it's going to the root tile's mmio, that's
>-		 * guaranteed to be initialized earlier in xe_mmio_init()
>+		 * guaranteed to be initialized earlier in xe_mmio_probe_early()
> 		 */
> 		mtcfg = xe_mmio_read64_2x32(mmio, XEHP_MTCFG_ADDR);
> 		tile_count = REG_FIELD_GET(TILE_COUNT, mtcfg) + 1;
>@@ -122,7 +122,7 @@ static void mmio_fini(void *arg)
> 	root_tile->mmio.regs = NULL;
> }
>
>-int xe_mmio_init(struct xe_device *xe)
>+int xe_mmio_probe_early(struct xe_device *xe)
> {
> 	struct xe_tile *root_tile = xe_device_get_root_tile(xe);
> 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
>index 8a46f4006a84..b32e7ee4b23e 100644
>--- a/drivers/gpu/drm/xe/xe_mmio.h
>+++ b/drivers/gpu/drm/xe/xe_mmio.h
>@@ -11,7 +11,7 @@
> struct xe_device;
> struct xe_reg;
>
>-int xe_mmio_init(struct xe_device *xe);
>+int xe_mmio_probe_early(struct xe_device *xe);
> int xe_mmio_probe_tiles(struct xe_device *xe);
>
> u8 xe_mmio_read8(struct xe_mmio *mmio, struct xe_reg reg);
>-- 
>2.43.2
>
