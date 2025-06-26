Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55882C7115B
	for <intel-xe@archiver.kernel.org>; Thu, 26 Jun 2025 07:15:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14B1710E839;
	Thu, 26 Jun 2025 07:15:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GFxpIwoU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CF9010E839
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Jun 2025 07:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750922128; x=1782458128;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=pgJGcXgfmap7ma2m4BMaF5Zyobx7gIT2HWpOuG5uAVw=;
 b=GFxpIwoUCHE8KLtFUY9RfGgEumt+mWm6u5i5i3TrWPcSJLn6bX9QaEil
 8dQ3A60GuEPbBlOAe/UouJzMxfpd/Fym1jjDY5Ey/plfU38pNjzex8eiF
 fRP5/C7is9VxMa5hZcO8emlP3oX6yKOvAtcip2nac7rYl+/AUAwMoZsNd
 JAoMJKb9wgOoqfnTgRkaKSmFy180ObkYz7fbaHgQxHyhHt9vRdLy+QFzj
 ENnLjASf1XqztV5dkrkdCn8ltfFpBTf5swqFYx0bPlNbRFg/wEW6i4Jh/
 Vt3nGZ9fZB5hSRWux423ywTzdNL6REKJKeE5mohouQcSQ9FqdnPnt+zfZ g==;
X-CSE-ConnectionGUID: FtsTdeYMQleD/ZL0QR/6fQ==
X-CSE-MsgGUID: ckkK0vWUTcqvbFrO0pKuAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="56991550"
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; d="scan'208";a="56991550"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 00:15:26 -0700
X-CSE-ConnectionGUID: Y/dlDWY5Q5iDgfpYRgBwKQ==
X-CSE-MsgGUID: UY7RfqeTQuKoqpenmklbQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; d="scan'208";a="176097440"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 00:15:22 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 26 Jun 2025 00:15:21 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 26 Jun 2025 00:15:21 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.68) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 26 Jun 2025 00:15:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R0j4CJ0bOfwsbmbV7DnsQvQfzFYyPgch58/+YAbGHYI4el6oQRpvKwPq4RtS0QBAdeu3aq/lIwT682l4TDUoKbU5OiGq666g1l1ckAslpn9R93YcjLn/ZGpkEOqQLILBvdqk6foAZs8HXk7KO5Voj0YJFKXzOrXTVefjKZku5TbkElozeJ7zFffklWeHI6+fFMwF5YbSOKgnIJEoIOYYxP8B8ybEkPp9Jfch6OeCVPhp6vRJJu/vWCJe519UdLiIYGZGEeC6QA10MR73kNzsQk0/yrjhNkJ5Vh+FEFbSOf/S92aF2LjFEDvHx+1d4vN93nE+gmxXNtG6pHAYs8iaJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5vxSlz1XBPspC3p5Rnokr9CysArl3XSnSbI/+uPxCBs=;
 b=jse3pEGAEyPHkUAHg46dQrk5YeV4KDggpz3p2FoZaYYWifnEwIH1EOUePnWHPBBqCLN0spPr/afxmjn5kl0jf9Yc+qKdUhbxq4Q/j8Sm4suGLn+R/9WqUkg9IzYFuVWcBu3Rv2Tm+9MhX7I/sWS7ptdZx8ZMOhA2e3vt8Mm4qs4PJQ1P88PIRZrCc9IAM09nZe9pFWMm9V4Y586GvIhCb9sNDUBeFv5dfoB7f8mhMNEkFHoIGqmQ3NP2s9l9AqIQL7c/F6+nLMdUJ+Zv6xvzStuJuW8fvzfVgJjGm5AdsWWwfGN137lsgCjTDJcMD25+aVNuj+76eLLAynZHQROulA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by DS7PR11MB8827.namprd11.prod.outlook.com (2603:10b6:8:254::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.27; Thu, 26 Jun
 2025 07:14:54 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%4]) with mapi id 15.20.8857.020; Thu, 26 Jun 2025
 07:14:54 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, "Stuart
 Summers" <stuart.summers@intel.com>, Matthew Auld <matthew.auld@intel.com>,
 Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH v6 4/4] drm/xe: Unify the initialization of VRAM regions
Date: Thu, 26 Jun 2025 09:14:37 +0200
Message-ID: <20250626071437.3223888-5-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250626071437.3223888-1-piotr.piorkowski@intel.com>
References: <20250626071437.3223888-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DUZPR01CA0149.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bd::25) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|DS7PR11MB8827:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a241032-4c6c-4e2f-5e2e-08ddb4812680
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K2svYTZwcFhOY0k5T1VhNjBHVHFodDY5ZTF6OVpYYUM2bkZLWCtRQXdKY2Fr?=
 =?utf-8?B?Qmx0ZzgvSjlkY1hidGJYVmI0SDhkQjkySUxFTUJEdTBJbkJYWXc0Z0M3SWZV?=
 =?utf-8?B?U3h2aGwyRWN6MEVaNUE0ME8vR2xUSGFTcFFmUjQ0RFBya25kWDNBZjR5MVhk?=
 =?utf-8?B?MEtrV1dMTGQwakN5VGh2R3piSkw4R0oxRnN4SFlIZDRWNVRGaFRuQ1lRa253?=
 =?utf-8?B?OGhsVEEzS2F3UXBNMTJtQ3BwTGxCT2tMM2tydWx2cTkzdEYxbFAvZm9RS1ZC?=
 =?utf-8?B?NFJKVGs3UW8xcXMyWXBsc2IzbS9icG1heW91bm85bjd3d3ptczQ4SEMxQkZI?=
 =?utf-8?B?SVBGYlhYeVhtS2lZVlpQd3lXRVptVGp0TmtyVVJyaElvMHFKc2tPTmorVlZT?=
 =?utf-8?B?Y3VrZlZZOWNEejlwWUQ0QTZkcys0dVY3WVliVHdPeVA0bm1oVU5kY1dNbG9H?=
 =?utf-8?B?b2FBRGVuM1Fac1lqNml2aXNZRDAxalBQc1JvN08rVlpxdGlEUWM2R1ViREs3?=
 =?utf-8?B?U2FPVmdYK2h6NlhneS8yQTJuSExadnJBcEc2clREbHFtTi9IQ1phaFo1Z0Yw?=
 =?utf-8?B?emhtVWs3aWFidmJCbnQ5eEhPLzVYMDZCUk80SWRqK0h3WHRSZ0hraW1STU1m?=
 =?utf-8?B?R2pSNysyU1NlNnRwVXJ4aUg3RTVPL2M5Yzdqangya1lNa3gxMTI0V2pwL3FG?=
 =?utf-8?B?U0hBcGdhUFdXYStIVFYyMTBSZmtqd1NobHFhNEVVZ1Fad3V4T1VBRHg3bUxj?=
 =?utf-8?B?a3J3SWowcWNFSUswb3VXcTBsbGxoOHd2ZlFEbFNOTU1Lck1EOGRaMWZwVUtv?=
 =?utf-8?B?TVM3ZUJCN1lqVk1zQldhZm8rUzlQbzRxOFQzbWNGOHlnRTZRSFlZa3dFc3Zq?=
 =?utf-8?B?K2t3dGpkck0xbGpJK1k4S25tUk56bUtHUzRNZmpFa0hqQkxwVDM4WXpBYnZS?=
 =?utf-8?B?QzZwWjVBSWRuaFZ1MlNjYnpSY1V4NTR5OEs4bUJZVjR1RkZHaUJjaXk4ZCtO?=
 =?utf-8?B?bWZnczFhQVh6TWxTalU5NjRsQyt4eVo1YU9yaDVhdU1UeWlmcy9ndjZvbmM1?=
 =?utf-8?B?R0duQzBZdWJyMjR6d05pQmhJNGhRSjNZaDVtUGxmZHY5K21WY0hHS2xXdHJ6?=
 =?utf-8?B?Z0Vid3Raem9teFFkcHhjNXkxV2NuN3NnM2NRM0p0WW9acWdvVzZhM1o4Rndl?=
 =?utf-8?B?aGdOMTZWTE9qdDlJM1lpNE9QSTlySEVibkxEeWc4UGZmU2d1OUo2aW5RYU10?=
 =?utf-8?B?L0N0L1BLNENIMVVhcU1PQVVSdXpCbFl0ajdjdHhVd0NYTmhxdEtia1NPS0V0?=
 =?utf-8?B?Y3ZsK1p6Y2c5SU1ZcHQyWUVxQXNEbkZRRVpaWEdqbnNIVkRISWg3YXJMQnBW?=
 =?utf-8?B?VnpYV0M5SHFBSlEwcmc1SjRESExHcVVLR3lHSVJuaDlPdG56UkllVDRzQ3Nr?=
 =?utf-8?B?dFF4cFc5TGU3M1VhVzFDNHVRanhQK0FkS2xRcGRXSXFoOWpIRndBUXNBejNS?=
 =?utf-8?B?YTZvanNCQ0xQNnBGTm1odmFZTllzQUhKZXFRWmx0ZFV5QzM1SHRKaklscjM5?=
 =?utf-8?B?WDRraURuR05JMTNzL0kxbUtGbDJOSGs5QWlGcHh4R3g5bmhWTEtBRUN0QkRZ?=
 =?utf-8?B?OTZHL1VEZ1docEliQXRsTGhueHkvZ3BjRzhlanJRUTd6aUhIQnFSTDZ5K1M5?=
 =?utf-8?B?WkNOR1U0L1NlNzMvUEsvNnY0VGVjdVlqcTQwRThHUmd2RXRkSmJTMDVGUDBk?=
 =?utf-8?B?R2Q2Wktid2p5TVpabWtDL0FJZ0ZhcE5kT0VIbnFlYnR5Mk9seUpPVklLTUVS?=
 =?utf-8?B?R0wvYlpmdkgwcDVpZi9LMEZaUnFxNXFKQmhyQ0lNLzlJMDVlS1o4Q0NBTUV4?=
 =?utf-8?B?TXRWcU56c1Y3YnVVelY3YW9WbGFBRFpibzRoSVZ0a2lDN2lQWVcvTnEwOElX?=
 =?utf-8?Q?6yb1sv2OWv8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S2dqRno4OVljc2NRQmtQTkxLWENqVDIzZkVGWVk1ZE91SjZkNXI2dXp2Y2w3?=
 =?utf-8?B?TmVFbFFid0ZNbHJmckJNd1ozOE9ocEV4d2M2cEorTk9aay9yTG81K0Z1aVdF?=
 =?utf-8?B?RVNhZmFMaUNTVURwZUJ2cHBQNWJ5OUVrTnA1VFJjSmRsUjNzbkpNYXZqeGZP?=
 =?utf-8?B?UUxnMkttTm9WUkZzeUh1SVpORzZSWTRNU0tJb0h6SEVDOHo0MlZEbWNVT1BJ?=
 =?utf-8?B?Rm5naDZqYkpUS0JNK1k3dW1ScXc4VURsYmNPZEpwSUNEZnR0SmNxbk9CM3BR?=
 =?utf-8?B?SlU1YnJ4Zi9SdzFoVHFRQm5BMVZYSkJKaGJSZXRkeE5KMWVETFdWMkxrbnRl?=
 =?utf-8?B?dWlmTUZqRVhIay94V2JVTGUzUHpSN3J0YnUwNjdGeTdlaWNRRFVQVGNHVEVx?=
 =?utf-8?B?elFqM0p2akxWRkRaajBoOUZZdzMxOEFCQ21ieFRJTy90MjVnODhuZmY0Wllm?=
 =?utf-8?B?TEFvWTJKM0RxYmptWDdRUjI4YlVSM2xxVEJTSFpSWHdOM1RjMmN0azAxNldM?=
 =?utf-8?B?SFFhaEY3OXpIbGI5Y2ZkdE8vYW1zUnU4N3B5OVZEZlFqRGhvWS9jbEdja2dm?=
 =?utf-8?B?NG1obkhXZk1FY0h4eEVWY29iOE1sNzFkbkhMZlpXMGxvV1p4cWxvOHBHV2dk?=
 =?utf-8?B?SE9hQjlKc2ljUjJmSGMyVzUwZkRoeGZqcnQ3UU1JNG1SYkVJY0ZCYVJqV095?=
 =?utf-8?B?U1k5cTgwQ3pEeVoyM2ppZm5VdFEvNEIzVVdUK1hVcUIzclB3UXN3T21ST05B?=
 =?utf-8?B?eCtoQmxabEFzS3E1aXUwTWRzS3p1YzVIaDJmdlRCZzZhRUdiSkYyMEhiKy9o?=
 =?utf-8?B?MzV6RWdjZmJEMWVRVzJ6L3BzOS90OXBoVG1TT0ZpWEhJdXZJK0IvMENWOWZm?=
 =?utf-8?B?NldtOVZqWFFiMU5mQStDUnBTNnpFaDNTL0RjVi9kZlVKZEZhRWpPYW1XZTk3?=
 =?utf-8?B?a2Y2LzVyR2pzWjNGTGpLRENmRFlkaWYvS3Jja2FnNG1YcTF6VWVSODdIU2w5?=
 =?utf-8?B?YURiUkdXSk11MGlvNVkraDdzUzFhamJkUWVacXVFR21sNmNla0JEV2NVTThK?=
 =?utf-8?B?UG11aGZxdTFWTHB4WVNhUkxVQkRzYWtnaisxaVVnbENEd24rNEVOeXg4V2Yy?=
 =?utf-8?B?SVAySWdiR05LbC9hOGdZUXArSitGNkx1Zk4xSkhsZ2tOUUdJTVgzcmsvQzlS?=
 =?utf-8?B?bk1uT1M1L01nKzR3UGEvZy81SnNBN1c0SDBSRGE4QStDQlNFYlFlQklja0ZS?=
 =?utf-8?B?WEJudDdNdGtnT2xWRVB0T1JwUThpTHZpa3FUV2pDQ01mWjhkelQzNnJYTmxh?=
 =?utf-8?B?cjgxMkVKQUxuR1krN2ZoOGZZZVlkcE52L1J4cCtidmxkTXlYT1Q5Sk9FeEdV?=
 =?utf-8?B?RDhoT1czZWxsSkRwcDZLQmdPS0w4YzJqazNjWTJZTURza3NiZlhVL2hTRnk2?=
 =?utf-8?B?c3MrQUtUTVBqR29aR09PQkgxY0JBTHFIdmZia1JsYjVTcmZTck8rSURFbFZT?=
 =?utf-8?B?Qytsc3ovSFU5UjFDVCtIRWdBWGdjNGE1ZzRLM21NbmRkT3ZFNlNSYVVNckRp?=
 =?utf-8?B?cWg5anhhUjJuam5odC93SGhKL21QTXZkd04rQVVlNnowQXFuOUhOZ2txamhr?=
 =?utf-8?B?WFQ5c2hXQVRvN09WS1hkcW43YVZxTk0zakgwZ2txZnA1MGlUb0J3YnphTVJa?=
 =?utf-8?B?dlpxNGZsSXJJczFwc2MzV2xDajNtRWhSNWdlKzZrcGtjMThpbzBQMmZVK1lu?=
 =?utf-8?B?ZDlkWERyUXF3djJrVHNieDRMSkZmakQxcFZRaWRKVzlUakUyQXVybGt4blo5?=
 =?utf-8?B?dk81SXdGdHJJQ3N6akloRWVPUGJnSG9uQStQRDV0YTBxalhRL2hJUks2VmRO?=
 =?utf-8?B?SDJRekdtSXc4SnV3aWgwZmZIbEtDNFFlNi9WMjFLcUZNY0xFZkxRN0NkVGtl?=
 =?utf-8?B?T1pSQi9QT244Ukc3S1hQY09rcW1jZklGUGRHYi9LQm5lS3VCczlJNjE2WE8x?=
 =?utf-8?B?dkovZ215OENCLzJWdFduR3RtVllheGswUHZNc0o2OW5VSmlBSkd5V1lGNjVM?=
 =?utf-8?B?eVdrSGZqOXpQeERsN1d6eUNJZUJPZDN4OUYwMVU5UUR3enJzbG9zT3F6azlH?=
 =?utf-8?B?S05nSUljTGUvWDY4bk0vOTl5dTFDYXU0ZFlhZmEzNmpiZzIxYmE3TVFQU0Zo?=
 =?utf-8?B?clE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a241032-4c6c-4e2f-5e2e-08ddb4812680
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 07:14:54.7913 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FPlqkKuP/SNs6gSU/ehto9zxSeRKcSs6UbdY6U/vNxHCphfk+tWuLeV1GoLrika7uu+7jsxRITTVhHk/utTmB6zKnIpzQ9yrgmmptaoO9Qo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB8827
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

From: Piotr Piórkowski <piotr.piorkowski@intel.com>

Currently in the drivers we have defined VRAM regions per device and per
tile. Initialization of these regions is done in two completely different
ways. To simplify the logic of the code and make it easier to add new
regions in the future, let's unify the way we initialize VRAM regions.

v2:
- fix doc comments in struct xe_vram_region
- remove unnecessary includes (Jani)
v3:
- move code from xe_vram_init_regions_managers to xe_tile_init_noalloc
  (Matthew)
- replace ioremap_wc to devm_ioremap_wc for mapping VRAM BAR
  (Matthew)
- Replace the tile id parameter with vram region in the xe_pf_begin
  function.

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Stuart Summers <stuart.summers@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_pagefault.c |  13 ++-
 drivers/gpu/drm/xe/xe_query.c        |   3 +-
 drivers/gpu/drm/xe/xe_tile.c         |  38 +++----
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c |  16 ++-
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.h |   3 +-
 drivers/gpu/drm/xe/xe_vram.c         | 149 ++++++++++++++++-----------
 drivers/gpu/drm/xe/xe_vram.h         |   1 +
 drivers/gpu/drm/xe/xe_vram_types.h   |   8 ++
 8 files changed, 134 insertions(+), 97 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
index 3522865c67c9..9cb50e0ed9f5 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -23,6 +23,7 @@
 #include "xe_svm.h"
 #include "xe_trace_bo.h"
 #include "xe_vm.h"
+#include "xe_vram_types.h"
 
 struct pagefault {
 	u64 page_addr;
@@ -74,7 +75,7 @@ static bool vma_is_valid(struct xe_tile *tile, struct xe_vma *vma)
 }
 
 static int xe_pf_begin(struct drm_exec *exec, struct xe_vma *vma,
-		       bool atomic, unsigned int id)
+		       bool atomic, struct xe_vram_region *vram)
 {
 	struct xe_bo *bo = xe_vma_bo(vma);
 	struct xe_vm *vm = xe_vma_vm(vma);
@@ -84,14 +85,16 @@ static int xe_pf_begin(struct drm_exec *exec, struct xe_vma *vma,
 	if (err)
 		return err;
 
-	if (atomic && IS_DGFX(vm->xe)) {
+	if (atomic && vram) {
+		xe_assert(vm->xe, IS_DGFX(vm->xe));
+
 		if (xe_vma_is_userptr(vma)) {
 			err = -EACCES;
 			return err;
 		}
 
 		/* Migrate to VRAM, move should invalidate the VMA first */
-		err = xe_bo_migrate(bo, XE_PL_VRAM0 + id);
+		err = xe_bo_migrate(bo, vram->placement);
 		if (err)
 			return err;
 	} else if (bo) {
@@ -138,7 +141,7 @@ static int handle_vma_pagefault(struct xe_gt *gt, struct xe_vma *vma,
 	/* Lock VM and BOs dma-resv */
 	drm_exec_init(&exec, 0, 0);
 	drm_exec_until_all_locked(&exec) {
-		err = xe_pf_begin(&exec, vma, atomic, tile->id);
+		err = xe_pf_begin(&exec, vma, atomic, tile->mem.vram);
 		drm_exec_retry_on_contention(&exec);
 		if (xe_vm_validate_should_retry(&exec, err, &end))
 			err = -EAGAIN;
@@ -572,7 +575,7 @@ static int handle_acc(struct xe_gt *gt, struct acc *acc)
 	/* Lock VM and BOs dma-resv */
 	drm_exec_init(&exec, 0, 0);
 	drm_exec_until_all_locked(&exec) {
-		ret = xe_pf_begin(&exec, vma, true, tile->id);
+		ret = xe_pf_begin(&exec, vma, true, tile->mem.vram);
 		drm_exec_retry_on_contention(&exec);
 		if (ret)
 			break;
diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index ba9b7482605c..f02987753779 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -27,6 +27,7 @@
 #include "xe_oa.h"
 #include "xe_pxp.h"
 #include "xe_ttm_vram_mgr.h"
+#include "xe_vram_types.h"
 #include "xe_wa.h"
 
 static const u16 xe_to_user_engine_class[] = {
@@ -409,7 +410,7 @@ static int query_gt_list(struct xe_device *xe, struct drm_xe_device_query *query
 			gt_list->gt_list[id].near_mem_regions = 0x1;
 		else
 			gt_list->gt_list[id].near_mem_regions =
-				BIT(gt_to_tile(gt)->id) << 1;
+				BIT(gt_to_tile(gt)->mem.vram->id) << 1;
 		gt_list->gt_list[id].far_mem_regions = xe->info.mem_region_mask ^
 			gt_list->gt_list[id].near_mem_regions;
 
diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
index 6f50c15d0cfc..1c3112233b7a 100644
--- a/drivers/gpu/drm/xe/xe_tile.c
+++ b/drivers/gpu/drm/xe/xe_tile.c
@@ -7,6 +7,7 @@
 
 #include <drm/drm_managed.h>
 
+#include "xe_bo.h"
 #include "xe_device.h"
 #include "xe_ggtt.h"
 #include "xe_gt.h"
@@ -19,6 +20,7 @@
 #include "xe_ttm_vram_mgr.h"
 #include "xe_vram_types.h"
 #include "xe_wa.h"
+#include "xe_vram.h"
 
 /**
  * DOC: Multi-tile Design
@@ -112,11 +114,9 @@ int xe_tile_alloc_vram(struct xe_tile *tile)
 	if (!IS_DGFX(xe))
 		return 0;
 
-	vram = drmm_kzalloc(&xe->drm, sizeof(*vram), GFP_KERNEL);
-	if (!vram)
-		return -ENOMEM;
-
-	vram->tile = tile;
+	vram = xe_vram_region_alloc(xe, tile->id, XE_PL_VRAM0 + tile->id);
+	if (IS_ERR(vram))
+		return PTR_ERR(vram);
 	tile->mem.vram = vram;
 
 	return 0;
@@ -154,21 +154,6 @@ int xe_tile_init_early(struct xe_tile *tile, struct xe_device *xe, u8 id)
 }
 ALLOW_ERROR_INJECTION(xe_tile_init_early, ERRNO); /* See xe_pci_probe() */
 
-static int tile_ttm_mgr_init(struct xe_tile *tile)
-{
-	struct xe_device *xe = tile_to_xe(tile);
-	int err;
-
-	if (tile->mem.vram->usable_size) {
-		err = xe_ttm_vram_mgr_init(tile, &tile->mem.vram->ttm);
-		if (err)
-			return err;
-		xe->info.mem_region_mask |= BIT(tile->id) << 1;
-	}
-
-	return 0;
-}
-
 /**
  * xe_tile_init_noalloc - Init tile up to the point where allocations can happen.
  * @tile: The tile to initialize.
@@ -186,17 +171,20 @@ static int tile_ttm_mgr_init(struct xe_tile *tile)
 int xe_tile_init_noalloc(struct xe_tile *tile)
 {
 	struct xe_device *xe = tile_to_xe(tile);
-	int err;
-
-	err = tile_ttm_mgr_init(tile);
-	if (err)
-		return err;
 
 	xe_wa_apply_tile_workarounds(tile);
 
 	if (xe->info.has_usm && IS_DGFX(xe))
 		xe_devm_add(tile, tile->mem.vram);
 
+	if (IS_DGFX(xe) && !ttm_resource_manager_used(&tile->mem.vram->ttm.manager)) {
+		int err = xe_ttm_vram_mgr_init(xe, tile->mem.vram);
+
+		if (err)
+			return err;
+		xe->info.mem_region_mask |= BIT(tile->mem.vram->id) << 1;
+	}
+
 	return xe_tile_sysfs_init(tile);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
index 585bc1232658..c00f5782cb63 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
@@ -338,12 +338,18 @@ int __xe_ttm_vram_mgr_init(struct xe_device *xe, struct xe_ttm_vram_mgr *mgr,
 	return drmm_add_action_or_reset(&xe->drm, ttm_vram_mgr_fini, mgr);
 }
 
-int xe_ttm_vram_mgr_init(struct xe_tile *tile, struct xe_ttm_vram_mgr *mgr)
+/**
+ * xe_ttm_vram_mgr_init - initialize TTM VRAM region
+ * @xe: pointer to Xe device
+ * @vram: pointer to xe_vram_region that contains the memory region attributes
+ *
+ * Initialize the Xe TTM for given @vram region using the given parameters.
+ *
+ * Returns 0 for success, negative error code otherwise.
+ */
+int xe_ttm_vram_mgr_init(struct xe_device *xe, struct xe_vram_region *vram)
 {
-	struct xe_device *xe = tile_to_xe(tile);
-	struct xe_vram_region *vram = tile->mem.vram;
-
-	return __xe_ttm_vram_mgr_init(xe, mgr, XE_PL_VRAM0 + tile->id,
+	return __xe_ttm_vram_mgr_init(xe, &vram->ttm, vram->placement,
 				      vram->usable_size, vram->io_size,
 				      PAGE_SIZE);
 }
diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
index cc76050e376d..87b7fae5edba 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
@@ -11,11 +11,12 @@
 enum dma_data_direction;
 struct xe_device;
 struct xe_tile;
+struct xe_vram_region;
 
 int __xe_ttm_vram_mgr_init(struct xe_device *xe, struct xe_ttm_vram_mgr *mgr,
 			   u32 mem_type, u64 size, u64 io_size,
 			   u64 default_page_size);
-int xe_ttm_vram_mgr_init(struct xe_tile *tile, struct xe_ttm_vram_mgr *mgr);
+int xe_ttm_vram_mgr_init(struct xe_device *xe, struct xe_vram_region *vram);
 int xe_ttm_vram_mgr_alloc_sgt(struct xe_device *xe,
 			      struct ttm_resource *res,
 			      u64 offset, u64 length,
diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
index cf92a9aa2435..6cf85077d196 100644
--- a/drivers/gpu/drm/xe/xe_vram.c
+++ b/drivers/gpu/drm/xe/xe_vram.c
@@ -19,6 +19,7 @@
 #include "xe_mmio.h"
 #include "xe_module.h"
 #include "xe_sriov.h"
+#include "xe_ttm_vram_mgr.h"
 #include "xe_vram.h"
 #include "xe_vram_types.h"
 
@@ -137,7 +138,7 @@ static bool resource_is_valid(struct pci_dev *pdev, int bar)
 	return true;
 }
 
-static int determine_lmem_bar_size(struct xe_device *xe)
+static int determine_lmem_bar_size(struct xe_device *xe, struct xe_vram_region *lmem_bar)
 {
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
 
@@ -148,17 +149,16 @@ static int determine_lmem_bar_size(struct xe_device *xe)
 
 	resize_vram_bar(xe);
 
-	xe->mem.vram->io_start = pci_resource_start(pdev, LMEM_BAR);
-	xe->mem.vram->io_size = pci_resource_len(pdev, LMEM_BAR);
-	if (!xe->mem.vram->io_size)
+	lmem_bar->io_start = pci_resource_start(pdev, LMEM_BAR);
+	lmem_bar->io_size = pci_resource_len(pdev, LMEM_BAR);
+	if (!lmem_bar->io_size)
 		return -EIO;
 
 	/* XXX: Need to change when xe link code is ready */
-	xe->mem.vram->dpa_base = 0;
+	lmem_bar->dpa_base = 0;
 
 	/* set up a map to the total memory area. */
-	xe->mem.vram->mapping = devm_ioremap_wc(&pdev->dev, xe->mem.vram->io_start,
-						xe->mem.vram->io_size);
+	lmem_bar->mapping = devm_ioremap_wc(&pdev->dev, lmem_bar->io_start, lmem_bar->io_size);
 
 	return 0;
 }
@@ -286,6 +286,65 @@ static void vram_fini(void *arg)
 		tile->mem.vram->mapping = NULL;
 }
 
+struct xe_vram_region *xe_vram_region_alloc(struct xe_device *xe, u8 id, u32 placement)
+{
+	struct xe_vram_region *vram;
+	struct drm_device *drm = &xe->drm;
+
+	xe_assert(xe, id < xe->info.tile_count);
+
+	vram = drmm_kzalloc(drm, sizeof(*vram), GFP_KERNEL);
+	if (!vram)
+		return NULL;
+
+	vram->id = id;
+	vram->placement = placement;
+	vram->tile = &xe->tiles[id];
+
+	return vram;
+}
+
+static void print_vram_region_info(struct xe_device *xe, struct xe_vram_region *vram)
+{
+	struct drm_device *drm = &xe->drm;
+
+	if (vram->io_size < vram->usable_size)
+		drm_info(drm, "Small BAR device\n");
+
+	drm_info(drm,
+		 "VRAM[%u]: Actual physical size %pa, usable size exclude stolen %pa, CPU accessible size %pa\n",
+		 vram->id, &vram->actual_physical_size, &vram->usable_size, &vram->io_size);
+	drm_info(drm, "VRAM[%u]: DPA range: [%pa-%llx], io range: [%pa-%llx]\n",
+		 vram->id, &vram->dpa_base, vram->dpa_base + (u64)vram->actual_physical_size,
+		 &vram->io_start, vram->io_start + (u64)vram->io_size);
+}
+
+static int vram_region_init(struct xe_device *xe, struct xe_vram_region *vram,
+			    struct xe_vram_region *lmem_bar, u64 offset, u64 usable_size,
+			    u64 region_size, resource_size_t remain_io_size)
+{
+	/* Check if VRAM region is already initialized */
+	if (vram->mapping)
+		return 0;
+
+	vram->actual_physical_size = region_size;
+	vram->io_start = lmem_bar->io_start + offset;
+	vram->io_size = min_t(u64, usable_size, remain_io_size);
+
+	if (!vram->io_size) {
+		drm_err(&xe->drm, "Tile without any CPU visible VRAM. Aborting.\n");
+		return -ENODEV;
+	}
+
+	vram->dpa_base = lmem_bar->dpa_base + offset;
+	vram->mapping = lmem_bar->mapping + offset;
+	vram->usable_size = usable_size;
+
+	print_vram_region_info(xe, vram);
+
+	return 0;
+}
+
 /**
  * xe_vram_probe() - Probe VRAM configuration
  * @xe: the &xe_device
@@ -297,82 +356,52 @@ static void vram_fini(void *arg)
 int xe_vram_probe(struct xe_device *xe)
 {
 	struct xe_tile *tile;
-	resource_size_t io_size;
+	struct xe_vram_region lmem_bar;
+	resource_size_t remain_io_size;
 	u64 available_size = 0;
 	u64 total_size = 0;
-	u64 tile_offset;
-	u64 tile_size;
-	u64 vram_size;
 	int err;
 	u8 id;
 
 	if (!IS_DGFX(xe))
 		return 0;
 
-	/* Get the size of the root tile's vram for later accessibility comparison */
-	tile = xe_device_get_root_tile(xe);
-	err = tile_vram_size(tile, &vram_size, &tile_size, &tile_offset);
-	if (err)
-		return err;
-
-	err = determine_lmem_bar_size(xe);
+	err = determine_lmem_bar_size(xe, &lmem_bar);
 	if (err)
 		return err;
+	drm_info(&xe->drm, "VISIBLE VRAM: %pa, %pa\n", &lmem_bar.io_start, &lmem_bar.io_size);
 
-	drm_info(&xe->drm, "VISIBLE VRAM: %pa, %pa\n", &xe->mem.vram->io_start,
-		 &xe->mem.vram->io_size);
+	remain_io_size = lmem_bar.io_size;
 
-	io_size = xe->mem.vram->io_size;
-
-	/* tile specific ranges */
 	for_each_tile(tile, xe, id) {
-		err = tile_vram_size(tile, &vram_size, &tile_size, &tile_offset);
+		u64 region_size;
+		u64 usable_size;
+		u64 tile_offset;
+
+		err = tile_vram_size(tile, &usable_size, &region_size, &tile_offset);
 		if (err)
 			return err;
 
-		tile->mem.vram->actual_physical_size = tile_size;
-		tile->mem.vram->io_start = xe->mem.vram->io_start + tile_offset;
-		tile->mem.vram->io_size = min_t(u64, vram_size, io_size);
+		total_size += region_size;
+		available_size += usable_size;
 
-		if (!tile->mem.vram->io_size) {
-			drm_err(&xe->drm, "Tile without any CPU visible VRAM. Aborting.\n");
-			return -ENODEV;
-		}
+		err = vram_region_init(xe, tile->mem.vram, &lmem_bar, tile_offset, usable_size,
+				       region_size, remain_io_size);
+		if (err)
+			return err;
 
-		tile->mem.vram->dpa_base = xe->mem.vram->dpa_base + tile_offset;
-		tile->mem.vram->usable_size = vram_size;
-		tile->mem.vram->mapping = xe->mem.vram->mapping + tile_offset;
-
-		if (tile->mem.vram->io_size < tile->mem.vram->usable_size)
-			drm_info(&xe->drm, "Small BAR device\n");
-		drm_info(&xe->drm,
-			 "VRAM[%u, %u]: Actual physical size %pa, usable size exclude stolen %pa, CPU accessible size %pa\n",
-			 id, tile->id, &tile->mem.vram->actual_physical_size,
-			 &tile->mem.vram->usable_size, &tile->mem.vram->io_size);
-		drm_info(&xe->drm, "VRAM[%u, %u]: DPA range: [%pa-%llx], io range: [%pa-%llx]\n",
-			 id, tile->id, &tile->mem.vram->dpa_base,
-			 tile->mem.vram->dpa_base + (u64)tile->mem.vram->actual_physical_size,
-			 &tile->mem.vram->io_start,
-			 tile->mem.vram->io_start + (u64)tile->mem.vram->io_size);
-
-		/* calculate total size using tile size to get the correct HW sizing */
-		total_size += tile_size;
-		available_size += vram_size;
-
-		if (total_size > xe->mem.vram->io_size) {
+		if (total_size > lmem_bar.io_size) {
 			drm_info(&xe->drm, "VRAM: %pa is larger than resource %pa\n",
-				 &total_size, &xe->mem.vram->io_size);
+				 &total_size, &lmem_bar.io_size);
 		}
 
-		io_size -= min_t(u64, tile_size, io_size);
+		remain_io_size -= min_t(u64, tile->mem.vram->actual_physical_size, remain_io_size);
 	}
 
-	xe->mem.vram->actual_physical_size = total_size;
-
-	drm_info(&xe->drm, "Total VRAM: %pa, %pa\n", &xe->mem.vram->io_start,
-		 &xe->mem.vram->actual_physical_size);
-	drm_info(&xe->drm, "Available VRAM: %pa, %pa\n", &xe->mem.vram->io_start,
-		 &available_size);
+	err = vram_region_init(xe, xe->mem.vram, &lmem_bar, 0, available_size, total_size,
+			       lmem_bar.io_size);
+	if (err)
+		return err;
 
 	return devm_add_action_or_reset(xe->drm.dev, vram_fini, xe);
 }
diff --git a/drivers/gpu/drm/xe/xe_vram.h b/drivers/gpu/drm/xe/xe_vram.h
index 9092ae86df22..802bd57e7c96 100644
--- a/drivers/gpu/drm/xe/xe_vram.h
+++ b/drivers/gpu/drm/xe/xe_vram.h
@@ -13,5 +13,6 @@ struct xe_vram_region;
 
 int xe_vram_probe(struct xe_device *xe);
 resource_size_t xe_vram_region_actual_physical_size(struct xe_vram_region *vram);
+struct xe_vram_region *xe_vram_region_alloc(struct xe_device *xe, u8 id, u32 placement);
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_vram_types.h b/drivers/gpu/drm/xe/xe_vram_types.h
index dee104beb2fd..3dcd737242ea 100644
--- a/drivers/gpu/drm/xe/xe_vram_types.h
+++ b/drivers/gpu/drm/xe/xe_vram_types.h
@@ -22,6 +22,12 @@ struct xe_tile;
 struct xe_vram_region {
 	/** @tile: Backpointer to tile */
 	struct xe_tile *tile;
+	/**
+	 * @id: VRAM region instance id
+	 *
+	 * The value should be unique for VRAM region.
+	 */
+	u8 id;
 	/** @io_start: IO start address of this VRAM instance */
 	resource_size_t io_start;
 	/**
@@ -54,6 +60,8 @@ struct xe_vram_region {
 	void __iomem *mapping;
 	/** @ttm: VRAM TTM manager */
 	struct xe_ttm_vram_mgr ttm;
+	/** @placement: TTM placement dedicated for this region */
+	u32 placement;
 #if IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR)
 	/** @pagemap: Used to remap device memory as ZONE_DEVICE */
 	struct dev_pagemap pagemap;
-- 
2.34.1

