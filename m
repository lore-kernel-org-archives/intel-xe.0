Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A817C83F17
	for <intel-xe@archiver.kernel.org>; Wed, 16 Jul 2025 01:06:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9BA710E652;
	Wed, 16 Jul 2025 01:06:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bHmGcIQP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD95410E652
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Jul 2025 01:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752628005; x=1784164005;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=oXdvTs9v5IPsz7vEl9gmlLxM5g7Y2tHkLbHSmSTUm7Q=;
 b=bHmGcIQPXpLUmGaa5kPxCt8cRDvte46UqTGgy7ZqA5IWHoJf8QiKSD8W
 93y/ovw4GopJiYrNnchdksTNRmFnzcpO1dEmKSJfPUWc22oama7hrW+cO
 O3LgjiGK7AAmB7Y4gBhZMPsC3dBFI03vN3E54Vc41f6YnQbmohFidnbDJ
 NpkHfYewlZCmgkBvbk9qL0WZpdoEMy3YxoU1KmkaRGAVZfL2dk0gRms1c
 iqVVvTZxJTULtZojLYeBnYoEzS9CGSEMXyx5qXd7XSm1Ty8j5p4wEyccT
 /wIG3L+BEBFJ8pYIAZb3V5g+VwhNYgKllmvT/twVWDV1vaFzthKSz299Q Q==;
X-CSE-ConnectionGUID: aZsAFAatQOaPw/N+TQFXYw==
X-CSE-MsgGUID: fiUZitCcSzeGR1aFzdGWsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="77396346"
X-IronPort-AV: E=Sophos;i="6.16,314,1744095600"; d="scan'208";a="77396346"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 18:06:44 -0700
X-CSE-ConnectionGUID: i08y0lb1QzWPNYXryr7n8g==
X-CSE-MsgGUID: +9imDvk3SyGcjLewN5MKeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,314,1744095600"; d="scan'208";a="156769553"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 18:06:44 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 15 Jul 2025 18:06:43 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Tue, 15 Jul 2025 18:06:43 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.42)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 15 Jul 2025 18:06:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w3jpkAYKKdLx+yOg8cfREdT9HHLFHo8cnoHSchDJy4HQSiCqWbqS0d26qghKH3thK5xFuaXepx6ZvLmjG1cQYpbrZHCCsTRj4/Q8vrbduUM3Ywdo9SNSM4RdGN5sT6jE2FKj0xGopUbu0ZJZhEGq4CMPiKlfvFTWc7EENTS1cjpMtCn3kQBP/W1f+/sqit1uCmpQMK/XyggDwx14DlC4KO1VALGxGCDr7uZbqxMt9b22Q0XBc/MBBV2+ENLJ1SYCO39sMa2TtXnFzFa69HVGXtERrUnjRTzIWxUNmJFeavwXbas1jbOxp5z1+tIGfLjvFI4iVeUXJGhSEmZPMd2IFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JaLlhUyKBJIkfjPiY8Q8/xmoXF1df2jgfRxSLS7LFcI=;
 b=oakxaEiqF/afPXApstf/PeT1LBsP1pLLdOV9pp9p66TvljB42I1PemvJqNzld2NnWCWV59doDhMBygnDzJeJqZ9DJu0RRbqqpyG4o+56/g5eraZIAT7DDTXjFT3gvGanu0ziUGp64ctyEa+Rrc0LEvUn26wfRA7+KSQiU0CWSPZvOWiSbRdito+odLhNVXNLMUNrdaOZo6B7KAA4pxqnqnyN2Jkitm9Xcs2vU5alnRqEYEzkC1bIyEqYBy+efRWy5yTx1Q7yrJ9enZsmoInVXf7al1XjEQZuhiEqUyTqRoq4s98LvEz2kam9hMq+iV9SoDpzIK6r/pXcLu1TF0adpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by IA1PR11MB7775.namprd11.prod.outlook.com (2603:10b6:208:3f3::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.35; Wed, 16 Jul
 2025 01:06:40 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%7]) with mapi id 15.20.8880.021; Wed, 16 Jul 2025
 01:06:40 +0000
Date: Tue, 15 Jul 2025 18:08:24 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "Auld, Matthew" <matthew.auld@intel.com>
Subject: Re: [PATCH v2 7/9] drm/xe: Add GT TLB invalidation jobs
Message-ID: <aHb7iD/CfhfXekdz@lstrano-desk.jf.intel.com>
References: <20250702234222.3278264-1-matthew.brost@intel.com>
 <20250702234222.3278264-8-matthew.brost@intel.com>
 <1866b95b03246fdab356a0813928620215cb4a70.camel@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1866b95b03246fdab356a0813928620215cb4a70.camel@intel.com>
X-ClientProxiedBy: SJ0PR03CA0059.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::34) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|IA1PR11MB7775:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f64ea23-bd43-4fae-4713-08ddc4050562
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WVBIcStKVldxWXhCRXJXZlJBeVhiNUJ4MFBYWlM1Q2duNU5oVEdaRWY0Skpq?=
 =?utf-8?B?ZW9RcTBwMGMvY2NENVEvcERmaVFOWTkvVFpiMUxXcnpEUjNtTExXWWVVUHlu?=
 =?utf-8?B?SU9YNEMrSEJmOWdEWDZ5bUNwRHk4VlRYNng2V3BGdnd5VDJRaGNSVmxjREpP?=
 =?utf-8?B?SUFPNGsxRU5PVEcvMk00MTZmM0VMOXJtVmRMQVJaeHFldEdNMk03c0l5WDZz?=
 =?utf-8?B?ak5hWUdRakd2NVdEOFhWclJvRTFHZ1VZVWIrVFB6M0MxL1BOcnNPQlhQRjc4?=
 =?utf-8?B?SnkrK05sald6QTRvMDMwdlJGYWhORVM5RHZrV1NvK21JN25lcVpNa0U5Lytl?=
 =?utf-8?B?RXpDTUVVRmVvUTBkU2pGVEgzTXJ2dUNpS1oyS25mclIyVUs3eUY4UDZLdFND?=
 =?utf-8?B?a0txVktDelVudnQ0R1RWbktxeE9uQXpKQWNEU3Nkd0ZhT0FKNkRyL2JjK1lU?=
 =?utf-8?B?YWxkaUlUamYreXVPUFFFVHZMRUtKbjdkOGFaMmZBaExNMXJTSFVZRjdGQ2FN?=
 =?utf-8?B?eXZEaWZXR3F3UXgrWW5WNmloMVcramQzQWVxSzRZQkRYM3dLM1JlSWI5aFpm?=
 =?utf-8?B?Uk9TUks1V2xJRGk5RisrR3BjZjdBVzFwU0hFYnByeHhGQ0xlK1M1eFNRZ3RF?=
 =?utf-8?B?WXI2REpqM0pPVGRDNVZOMFIyQmNLdk02aVppaXlTcVNDbGl0UHBJNHNxanhw?=
 =?utf-8?B?YVE0OFB2ZEs5U0ZicDVlWjhsbVpkVGFSaktJY0NiV2o0VUdYbktQbW1JUUR2?=
 =?utf-8?B?ZEYrNE9URGZUTEU4SmllejdKbFVlNExjeld2ZEtXSFJ4c09icVRid1NNUmd6?=
 =?utf-8?B?b21EdHlHWEJzQ2JzdW8wb2NaS21PT2swb2JZM2dIYzJvLzh2VE5HeERQUmxD?=
 =?utf-8?B?ZFZZSmhRRjU4QjliSGlPTXdTZ2Z3UVNDT1cwWGswbHh0SlI2U3JiK2wxNk9w?=
 =?utf-8?B?Y09GN0xLeWlCTmhQQVNsUUNnOXRudjVHc3JkNkUvNDRkU0UrQmd2dVMweFor?=
 =?utf-8?B?TkpQVVUyZkNDWkpOZ2lQYWoxelFXNjJXRkRKTEhoTEg0d1hQajdwOG05T3VK?=
 =?utf-8?B?V1VUWGpiWm5CdUNTMVIxcm5uYWlPMnU2TWdFREdUUlo5enRZWjJzSXBXVmRu?=
 =?utf-8?B?dkhUWkkzY0szWHlDcll6M0RkR0hKbHFlUXY2VG05V0Q1R2E3Q2tndWEyMFNt?=
 =?utf-8?B?U2RjNWpJS1NSeGxWbnlqVXRqOUNsZVBTTG5jcDFmZzMwcHIybXpYbGFtalJV?=
 =?utf-8?B?MEpGaVlYTlVkT1IwcmJRYTNDdTNIeFVpL3lXZlFjQUtVcFhCS1BvMmVkVlVj?=
 =?utf-8?B?TFhaMzZlV0RKMjFUcHlZOVYrSEFNbUd0VnpwWFVMdHVVKzk4VEZlb3plNUox?=
 =?utf-8?B?ZVMwYVZHWVpPZkdvaE5KaVdlQ1dydWlmeGFrSzNhbmsxSmxEWXVLUnpDU2RZ?=
 =?utf-8?B?eXA5RVYrdHcrYTFtNnViSEdJK2pqZ0R2MzYzVm9tdWdzZm9RK0RVNm9VTVBn?=
 =?utf-8?B?NGc1cXVGWjVPaVNkME1PSUJCWHovd0tWZmNlcE5IVVZqWUwrRnJrY3pYcFMr?=
 =?utf-8?B?cUY2UGIzbURXaStER3hIa1FybmpnRDdKY1daei9GazRQTG1rbnVlQjRSeVBZ?=
 =?utf-8?B?TVNRaURjVXREUW9VUmxvNmlzS1hrZndNMVJ1MFNNMXVnNXlzRU9HQWJmbzRL?=
 =?utf-8?B?cVJBd2NFb1Y4OC9mbzdnNERQbDc5VTFkcjVieTZaRVg2WFhoTzlhbnpudWFH?=
 =?utf-8?B?NEN3dEd3OEphL01XalRlU0VacTIrdDV3WHhmTzg4NDNDZ0huZ1B3bFVQUit2?=
 =?utf-8?B?dmRIZTFuQ29hTWNFT3JoMkdVNCttWW0vWFNvZG5qVjVjSTA2dlE0dDdtK2ta?=
 =?utf-8?B?dmJaVXNvYld1SU41MWZVTFl0OGMySWVnRmZoS2ppZDA3RXVYSC9JZFFQNVhN?=
 =?utf-8?Q?6tO106abmhY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eG5ZTEh1OWhxQWdRVVhSTGs3NVREeDc4QmxjeDZkcWdXMEt5bllqRVhCVjZJ?=
 =?utf-8?B?aGNFOVIrV0VkdzdhakZFV3RNSXZJY2QxWTRoNEZaMFoza0FCMXhNSXpjTHFH?=
 =?utf-8?B?eWdETG41em00VGZKQUgxcGk0aFAzc3lGdWVBdnM2Wmc2U0dUaXNKcGZGS1pG?=
 =?utf-8?B?bi8xalU2MG16MHN5WnZ6c0x5ZkVRWCtiRlZKTHM2TlRkZlJyMHprSHRvYmZ4?=
 =?utf-8?B?M3R5aWJFcXVBOU9yQkRnWDFDd2s3NVhzbHJETm9DdHF4dWdDTVduUzBmbCtX?=
 =?utf-8?B?Ym1LRVpFNjVZNnVpNTJVcTV3VVZERFVJTjRyNkJPeHRoeFpKeUhtdEJNNzdh?=
 =?utf-8?B?a1hvVXc1c0Z0aEVnUkIwbDV5RzFZNHBoc0F4VmlTc2Q0c1RMS0J0VHRjZHVR?=
 =?utf-8?B?bzc3NzFNNk16eGxaUVg5c3FheGdCaUJiZUZnb0pxakFreG4ydHJKZDVTV1NB?=
 =?utf-8?B?U0Ivd3BzUXkrUGxTd1RhMDY0MzBZdHBlTnZzcERWYjFseEkwK2NKNEp4Y3Q1?=
 =?utf-8?B?NjVSd3ZMdmovRS9DSGVDWk55Z0hMUnl3MXN6SzZUcmo1YytJZEVXVjdYMnlx?=
 =?utf-8?B?bXBtTEtRcGNybjNsaVhPS3p1ODdnOVN2SjlvRWNsN1Q4dWpPaXdEd2J2UUhn?=
 =?utf-8?B?eUY3bnFMeU9iM292aXhGREYzZmpkNzBSR00rbStZVGJjd1pMdEU0YU9yY1ll?=
 =?utf-8?B?cDhsNFpYWmI5NWh5WjhtTnRIZXlldnJHSXVzd0tiZFUvZy9JRWFCckJRUkFo?=
 =?utf-8?B?VS9LVFI3MSt3VmR5STM0QnNxeXZScThNSS9BNFFZaFo2V29pK1RiTmtuZkNM?=
 =?utf-8?B?dit4ZVJwK0pDL2xoVGczdzMxNUdOUHZob3JteWZib2FVYmpDUUhYWnkyMnJI?=
 =?utf-8?B?RXlGMkdXWmFDaElMWDEvTFljdmpheEhnTUlqeC9Ga3pyb3NrN2pJS21IeWRO?=
 =?utf-8?B?TnNMdjVQdTMxSFovQzZjaGdsZURkRFgwclpWSkhobFlmeWMrbURmSzJEUkxD?=
 =?utf-8?B?clZzYzFFbGJ2MldKcXdEQ0hVWVZEQUFPZitVQVhWTHpaOTVGcmRyeHFSMUFI?=
 =?utf-8?B?bm9WS1R3RCs1MUI1UHhMbFBwU0xwbG5sTUtJUUNvTkVnekZMeUpaQTV4aElo?=
 =?utf-8?B?WDZrRUYyNlB6aUM2NFRBRndmMUw5L1l3VzlYNGttaFZSMklmS2FHcDJMaW40?=
 =?utf-8?B?TjU4WFpINm9TK2k5NGZBd0hrZWtVeGhjYmk2dFlGcFB3MVpMb0ZkRkF4MHNX?=
 =?utf-8?B?S1pIM1RzT0luaE5yUTF5TXlpc3BvaEdzbXNFb3JSNWFjV2ZmdDBRU0Ewb3R4?=
 =?utf-8?B?TjV0Z0M4UGtiRzNJWTZFN2x6cmhKcjFnVEJsVVhwUFR6TStkZWhPVEliNUpt?=
 =?utf-8?B?SHYxTXMzcjR5dkVHcTBJNUhXS01GTWV4UVBxQk5UQ1pTY2Z0WTNob0JlRzZK?=
 =?utf-8?B?b290Zm5KKzFueVcydFI4SG40enpzYjY0dGthVUdKZS9JNXBBNExLcFdpdE95?=
 =?utf-8?B?MVN3OGJuVEZ0QWszL0hzc0NUWGN3WFgxVldiYTgwWUtqV1Z6elRrakVibEJu?=
 =?utf-8?B?M1I4V2Ftcnlnd1BZUzZCUUFlbTRrcUU2eWZVdWZBRFNtampQaHJTNVFNNFdM?=
 =?utf-8?B?TnVEZTVYZ2trNnQ2bkhjdUFxSFZnZ2xXWDkwc1ZVbkVlYVN4WUpYUXU4TU16?=
 =?utf-8?B?L3F0VXJPOWFleWtac1Q3VG5STXJKZnNPbktHakoxVHY5SXE0eTJ0dkZ6Vnhq?=
 =?utf-8?B?NVYyVlJxemhXT0QwYS8vRC9YWDJacytPMGFrRGtNVXg2UmVFNXg1YkUra1RH?=
 =?utf-8?B?WXV5cDVCZm9NdFZIZnJ3WGlsRmNDa1ZpNWZKYUdtVUFUdUpYVFZpNFhIeSsz?=
 =?utf-8?B?VWVLOXhJazlMMEwxYm1UMVIrdWhKQjZYUG9nbWRERjNTbVM4K2taT3ljbUkv?=
 =?utf-8?B?VWxWaTgxbktEMVNLSHIyS0xCMUVkRTVpSk5BemZmUHNGdmhJUzVJKzg4S05v?=
 =?utf-8?B?a21XSnhya1lLOW9UbE01VWtSRXhPT3FkdCsvdkZqMzNXT1FCYUcvZm45Rm14?=
 =?utf-8?B?Y3BYMGp0bVR4QktodG1jSUUxK21Qa0p6YUFpYlphY0pVOUNXWmFWam5wNHdi?=
 =?utf-8?B?U3d0NGRaVFFqTnRveDRGSklRTFcvNDNkemg4WDBpNnJqT21FN0UzaWFPNUJl?=
 =?utf-8?B?SEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f64ea23-bd43-4fae-4713-08ddc4050562
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2025 01:06:40.3703 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BzTTS8zMBs/QC+vRGtzcR7nifr9o/SXamZ5YERfwqB8UcFmW5VePAzBW9LRk9+Na7o8ghjoRgCkQHguxpiunyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7775
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

On Tue, Jul 15, 2025 at 05:09:01PM -0600, Summers, Stuart wrote:
> On Wed, 2025-07-02 at 16:42 -0700, Matthew Brost wrote:
> > Add GT TLB invalidation jobs which issue GT TLB invalidations. Built
> > on
> > top of Xe generic dependency scheduler.
> > 
> > v2:
> >  - Fix checkpatch
> > 
> > Suggested-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/Makefile              |   1 +
> >  drivers/gpu/drm/xe/xe_gt_tlb_inval_job.c | 271
> > +++++++++++++++++++++++
> >  drivers/gpu/drm/xe/xe_gt_tlb_inval_job.h |  34 +++
> >  3 files changed, 306 insertions(+)
> >  create mode 100644 drivers/gpu/drm/xe/xe_gt_tlb_inval_job.c
> >  create mode 100644 drivers/gpu/drm/xe/xe_gt_tlb_inval_job.h
> > 
> > diff --git a/drivers/gpu/drm/xe/Makefile
> > b/drivers/gpu/drm/xe/Makefile
> > index 0edcfc770c0d..5aad44a3b5fd 100644
> > --- a/drivers/gpu/drm/xe/Makefile
> > +++ b/drivers/gpu/drm/xe/Makefile
> > @@ -55,6 +55,7 @@ xe-y += xe_bb.o \
> >         xe_gt_sysfs.o \
> >         xe_gt_throttle.o \
> >         xe_gt_tlb_invalidation.o \
> > +       xe_gt_tlb_inval_job.o \
> >         xe_gt_topology.o \
> >         xe_guc.o \
> >         xe_guc_ads.o \
> > diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_inval_job.c
> > b/drivers/gpu/drm/xe/xe_gt_tlb_inval_job.c
> > new file mode 100644
> > index 000000000000..428d20f16ec2
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/xe_gt_tlb_inval_job.c
> > @@ -0,0 +1,271 @@
> > +// SPDX-License-Identifier: MIT
> > +/*
> > + * Copyright © 2025 Intel Corporation
> > + */
> > +
> > +#include "xe_dep_job_types.h"
> > +#include "xe_dep_scheduler.h"
> > +#include "xe_exec_queue.h"
> > +#include "xe_gt.h"
> > +#include "xe_gt_tlb_invalidation.h"
> > +#include "xe_gt_tlb_inval_job.h"
> > +#include "xe_migrate.h"
> > +#include "xe_pm.h"
> > +
> > +/** struct xe_gt_tlb_inval_job - GT TLB invalidation job */
> > +struct xe_gt_tlb_inval_job {
> > +       /** @dep: base generic dependency Xe job */
> > +       struct xe_dep_job dep;
> > +       /** @gt: GT to invalidate */
> > +       struct xe_gt *gt;
> > +       /** @q: exec queue issuing the invalidate */
> > +       struct xe_exec_queue *q;
> > +       /** @refcount: ref count of this job */
> > +       struct kref refcount;
> > +       /**
> > +        * @fence: dma fence to indicate completion. 1 way
> > relationship - job
> > +        * can safely reference fence, fence cannot safely reference
> > job.
> > +        */
> > +       struct dma_fence *fence;
> > +       /** @start: Start address to invalidate */
> > +       u64 start;
> > +       /** @end: End address to invalidate */
> > +       u64 end;
> > +       /** @asid: Address space ID to invalidate */
> > +       u32 asid;
> > +       /** @fence_armed: Fence has been armed */
> > +       bool fence_armed;
> > +};
> > +
> > +static struct dma_fence *xe_gt_tlb_inval_job_run(struct xe_dep_job
> > *dep_job)
> > +{
> > +       struct xe_gt_tlb_inval_job *job =
> > +               container_of(dep_job, typeof(*job), dep);
> > +       struct xe_gt_tlb_invalidation_fence *ifence =
> > +               container_of(job->fence, typeof(*ifence), base);
> > +
> > +       xe_gt_tlb_invalidation_range(job->gt, ifence, job->start,
> > +                                    job->end, job->asid);
> > +
> > +       return job->fence;
> > +}
> > +
> > +static void xe_gt_tlb_inval_job_free(struct xe_dep_job *dep_job)
> > +{
> > +       struct xe_gt_tlb_inval_job *job =
> > +               container_of(dep_job, typeof(*job), dep);
> > +
> > +       /* Pairs with get in xe_gt_tlb_inval_job_push */
> > +       xe_gt_tlb_inval_job_put(job);
> > +}
> > +
> > +static const struct xe_dep_job_ops dep_job_ops = {
> > +       .run_job = xe_gt_tlb_inval_job_run,
> > +       .free_job = xe_gt_tlb_inval_job_free,
> > +};
> > +
> > +static int xe_gt_tlb_inval_context(struct xe_gt *gt)
> > +{
> > +       return xe_gt_is_media_type(gt) ?
> > XE_EXEC_QUEUE_TLB_INVAL_MEDIA_GT :
> > +               XE_EXEC_QUEUE_TLB_INVAL_PRIMARY_GT;
> > +}
> > +
> > +/**
> > + * xe_gt_tlb_inval_job_create() - GT TLB invalidation job create
> > + * @gt: GT to invalidate
> > + * @q: exec queue issuing the invalidate
> > + * @start: Start address to invalidate
> > + * @end: End address to invalidate
> > + * @asid: Address space ID to invalidate
> > + *
> > + * Create a GT TLB invalidation job and initialize internal fields.
> > The caller is
> > + * responsible for releasing the creation reference.
> > + *
> > + * Return: GT TLB invalidation job object or ERR_PTR
> > + */
> > +struct xe_gt_tlb_inval_job *xe_gt_tlb_inval_job_create(struct
> > xe_exec_queue *q,
> > +                                                      struct xe_gt
> > *gt,
> > +                                                      u64 start, u64
> > end,
> > +                                                      u32 asid)
> > +{
> > +       struct xe_gt_tlb_inval_job *job;
> > +       struct xe_dep_scheduler *dep_scheduler =
> > +               q-
> > >tlb_inval[xe_gt_tlb_inval_context(gt)].dep_scheduler;
> > +       struct drm_sched_entity *entity =
> > +               xe_dep_scheduler_entity(dep_scheduler);
> > +       struct xe_gt_tlb_invalidation_fence *ifence;
> > +       int err;
> > +
> > +       job = kmalloc(sizeof(*job), GFP_KERNEL);
> > +       if (!job)
> > +               return ERR_PTR(-ENOMEM);
> > +
> > +       job->q = q;
> > +       job->gt = gt;
> > +       job->start = start;
> > +       job->end = end;
> > +       job->asid = asid;
> > +       job->fence_armed = false;
> > +       job->dep.ops = &dep_job_ops;
> > +       kref_init(&job->refcount);
> > +       xe_exec_queue_get(q);
> > +
> > +       ifence = kmalloc(sizeof(*ifence), GFP_KERNEL);
> > +       if (!ifence) {
> > +               err = -ENOMEM;
> > +               goto err_job;
> > +       }
> > +       job->fence = &ifence->base;
> > +
> > +       err = drm_sched_job_init(&job->dep.drm, entity, 1, NULL,
> > +                                q->xef ? q->xef->drm->client_id :
> > 0);
> > +       if (err)
> > +               goto err_fence;
> > +
> > +       xe_pm_runtime_get_noresume(gt_to_xe(job->gt));
> > +       return job;
> > +
> > +err_fence:
> > +       kfree(ifence);
> > +err_job:
> > +       xe_exec_queue_put(q);
> > +       kfree(job);
> > +
> > +       return ERR_PTR(err);
> > +}
> > +
> > +static void xe_gt_tlb_inval_job_destroy(struct kref *ref)
> > +{
> > +       struct xe_gt_tlb_inval_job *job = container_of(ref,
> > typeof(*job),
> > +                                                      refcount);
> > +       struct xe_gt_tlb_invalidation_fence *ifence =
> > +               container_of(job->fence, typeof(*ifence), base);
> > +       struct xe_device *xe = gt_to_xe(job->gt);
> > +       struct xe_exec_queue *q = job->q;
> > +
> > +       if (!job->fence_armed)
> > +               kfree(ifence);
> > +       else
> > +               /* Ref from xe_gt_tlb_invalidation_fence_init */
> > +               dma_fence_put(job->fence);
> > +
> > +       drm_sched_job_cleanup(&job->dep.drm);
> > +       kfree(job);
> > +       xe_exec_queue_put(q);   /* Pairs with get from
> > xe_gt_tlb_inval_job_create */
> > +       xe_pm_runtime_put(xe);  /* Pairs with get from
> > xe_gt_tlb_inval_job_create */
> 
> This patch also looks great to me. My only concern here is it feels
> weird reordering these puts and kfrees from how we allocated them in
> xe_gt_tlb_inval_job_create. It does look functional though because the
> kfree of the job and exec queue/runtime put are really independent, but
> if for some reason that changed in the future (however unlikely) and we
> wanted to link those, it seems safer to do the cleanup in the reverse
> of the order you did the allocation. Let me know what you think here.

They are independent. The ordering is just mirroring what
xe_sched_job_destroy does but in bith cases could be reordered if
desired. I'd rather leave it as is for now, so the functions that create
/ destroy jobs look more or less the same in Xe.

Matt

> 
> Thanks,
> Stuart
> 
> > +}
> > +
> > +/**
> > + * xe_gt_tlb_inval_alloc_dep() - GT TLB invalidation job alloc
> > dependency
> > + * @job: GT TLB invalidation job to alloc dependency for
> > + *
> > + * Allocate storage for a dependency in the GT TLB invalidation
> > fence. This
> > + * function should be called at most once per job and must be paired
> > with
> > + * xe_gt_tlb_inval_job_push being called with a real (non-signaled)
> > fence.
> > + *
> > + * Return: 0 on success, -errno on failure
> > + */
> > +int xe_gt_tlb_inval_job_alloc_dep(struct xe_gt_tlb_inval_job *job)
> > +{
> > +       xe_assert(gt_to_xe(job->gt), !xa_load(&job-
> > >dep.drm.dependencies, 0));
> > +
> > +       return drm_sched_job_add_dependency(&job->dep.drm,
> > +                                           dma_fence_get_stub());
> > +}
> > +
> > +/**
> > + * xe_gt_tlb_inval_job_push() - GT TLB invalidation job push
> > + * @job: GT TLB invalidation job to push
> > + * @m: The migration object being used
> > + * @fence: Dependency for GT TLB invalidation job
> > + *
> > + * Pushes a GT TLB invalidation job for execution, using @fence as a
> > dependency.
> > + * Storage for @fence must be preallocated with
> > xe_gt_tlb_inval_job_alloc_dep
> > + * prior to this call if @fence is not signaled. Takes a reference
> > to the job’s
> > + * finished fence, which the caller is responsible for releasing,
> > and retutn it
> > + * to the caller. This function is safe to be called in the path of
> > reclaim.
> > + *
> > + * Return: Job's finished fence
> > + */
> > +struct dma_fence *xe_gt_tlb_inval_job_push(struct
> > xe_gt_tlb_inval_job *job,
> > +                                          struct xe_migrate *m,
> > +                                          struct dma_fence *fence)
> > +{
> > +       struct xe_gt_tlb_invalidation_fence *ifence =
> > +               container_of(job->fence, typeof(*ifence), base);
> > +
> > +       if (!dma_fence_is_signaled(fence)) {
> > +               void *ptr;
> > +
> > +               /*
> > +                * Can be in path of reclaim, hence the preallocation
> > of fence
> > +                * storage in xe_gt_tlb_inval_job_alloc_dep. Verify
> > caller did
> > +                * this correctly.
> > +                */
> > +               xe_assert(gt_to_xe(job->gt),
> > +                         xa_load(&job->dep.drm.dependencies, 0) ==
> > +                         dma_fence_get_stub());
> > +
> > +               dma_fence_get(fence);   /* ref released once
> > dependency processed by scheduler */
> > +               ptr = xa_store(&job->dep.drm.dependencies, 0, fence,
> > +                              GFP_ATOMIC);
> > +               xe_assert(gt_to_xe(job->gt), !xa_is_err(ptr));
> > +       }
> > +
> > +       xe_gt_tlb_inval_job_get(job);   /* Pairs with put in free_job
> > */
> > +       job->fence_armed = true;
> > +
> > +       /*
> > +        * We need the migration lock to protect the seqnos (job and
> > +        * invalidation fence) and the spsc queue, only taken on
> > migration
> > +        * queue, user queues protected dma-resv VM lock.
> > +        */
> > +       xe_migrate_job_lock(m, job->q);
> > +
> > +       /* Creation ref pairs with put in xe_gt_tlb_inval_job_destroy
> > */
> > +       xe_gt_tlb_invalidation_fence_init(job->gt, ifence, false);
> > +       dma_fence_get(job->fence);      /* Pairs with put in DRM
> > scheduler */
> > +
> > +       drm_sched_job_arm(&job->dep.drm);
> > +       /*
> > +        * caller ref, get must be done before job push as it could
> > immediately
> > +        * signal and free.
> > +        */
> > +       dma_fence_get(&job->dep.drm.s_fence->finished);
> > +       drm_sched_entity_push_job(&job->dep.drm);
> > +
> > +       xe_migrate_job_unlock(m, job->q);
> > +
> > +       /*
> > +        * Not using job->fence, as it has its own dma-fence context,
> > which does
> > +        * not allow GT TLB invalidation fences on the same queue, GT
> > tuple to
> > +        * be squashed in dma-resv/DRM scheduler. Instead, we use the
> > DRM scheduler
> > +        * context and job's finished fence, which enables squashing.
> > +        */
> > +       return &job->dep.drm.s_fence->finished;
> > +}
> > +
> > +/**
> > + * xe_gt_tlb_inval_job_get() - Get a reference to GT TLB
> > invalidation job
> > + * @job: GT TLB invalidation job object
> > + *
> > + * Increment the GT TLB invalidation job's reference count
> > + */
> > +void xe_gt_tlb_inval_job_get(struct xe_gt_tlb_inval_job *job)
> > +{
> > +       kref_get(&job->refcount);
> > +}
> > +
> > +/**
> > + * xe_gt_tlb_inval_job_put() - Put a reference to GT TLB
> > invalidation job
> > + * @job: GT TLB invalidation job object
> > + *
> > + * Decrement the GT TLB invalidation job's reference count, call
> > + * xe_gt_tlb_inval_job_destroy when reference count == 0. Skips
> > decrement if
> > + * input @job is NULL or IS_ERR.
> > + */
> > +void xe_gt_tlb_inval_job_put(struct xe_gt_tlb_inval_job *job)
> > +{
> > +       if (job && !IS_ERR(job))
> > +               kref_put(&job->refcount,
> > xe_gt_tlb_inval_job_destroy);
> > +}
> > diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_inval_job.h
> > b/drivers/gpu/drm/xe/xe_gt_tlb_inval_job.h
> > new file mode 100644
> > index 000000000000..883896194a34
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/xe_gt_tlb_inval_job.h
> > @@ -0,0 +1,34 @@
> > +/* SPDX-License-Identifier: MIT */
> > +/*
> > + * Copyright © 2025 Intel Corporation
> > + */
> > +
> > +#ifndef _XE_GT_TLB_INVAL_JOB_H_
> > +#define _XE_GT_TLB_INVAL_JOB_H_
> > +
> > +#include <linux/types.h>
> > +
> > +struct dma_fence;
> > +struct drm_sched_job;
> > +struct kref;
> > +struct xe_exec_queue;
> > +struct xe_gt;
> > +struct xe_gt_tlb_inval_job;
> > +struct xe_migrate;
> > +
> > +struct xe_gt_tlb_inval_job *xe_gt_tlb_inval_job_create(struct
> > xe_exec_queue *q,
> > +                                                      struct xe_gt
> > *gt,
> > +                                                      u64 start, u64
> > end,
> > +                                                      u32 asid);
> > +
> > +int xe_gt_tlb_inval_job_alloc_dep(struct xe_gt_tlb_inval_job *job);
> > +
> > +struct dma_fence *xe_gt_tlb_inval_job_push(struct
> > xe_gt_tlb_inval_job *job,
> > +                                          struct xe_migrate *m,
> > +                                          struct dma_fence *fence);
> > +
> > +void xe_gt_tlb_inval_job_get(struct xe_gt_tlb_inval_job *job);
> > +
> > +void xe_gt_tlb_inval_job_put(struct xe_gt_tlb_inval_job *job);
> > +
> > +#endif
> 
