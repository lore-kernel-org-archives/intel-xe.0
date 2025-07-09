Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0BE6C83F0A
	for <intel-xe@archiver.kernel.org>; Wed,  9 Jul 2025 12:16:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A21B10E7C1;
	Wed,  9 Jul 2025 12:16:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NlPtuZpO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F05F10E7C6
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Jul 2025 12:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752063361; x=1783599361;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=V+SUNEhPNnNnZ5EVxtrAOoaUebhcgTib7Btmk1Pvv3I=;
 b=NlPtuZpOSVefWciTLh0OGa9+VM8F+JCOwkXgMbtdW5LoRgbBmUwlDGdC
 TGv9Ada3CxGTnSl0lgJSsIivIAN2pY42JEowZ0jbQnDZhqQ+0APXI1jB1
 7lhD1WoJ5ffcPohyqYZQ+URGRARb2jQ3YNfMVfMPgjXMYqbcHWN7/1dFd
 sFCShNWcEo1JAaO/BLHkefPnYnwSF7XUVrClzl7EaE5nJwxf9GN72xJnY
 NJAoem908h1ShfUzvO2dmB4s+TtYdggkO/hbn8PsrG4febw1jpSg1xKRI
 PfzC69Ql2mIzN1Y5qRrce89/uvz4ahuizekjviSxxCA8FU6Y13so+i8Wp A==;
X-CSE-ConnectionGUID: dbAIGYIzR+6L5zTicTvW6Q==
X-CSE-MsgGUID: 9hrcgm5vSua6pGrSZldIfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="58129312"
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; d="scan'208";a="58129312"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2025 05:16:00 -0700
X-CSE-ConnectionGUID: o7UoTV12RaOCxeEt38Zg6g==
X-CSE-MsgGUID: z7YS0+mqRw2xNxPWJZ4JJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; d="scan'208";a="186762107"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2025 05:16:00 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 9 Jul 2025 05:15:59 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 9 Jul 2025 05:15:59 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.59)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 9 Jul 2025 05:15:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mtlZp2/qv6so47RB4DRTzh4zrQ1nlYDt6Zy6IM5VpSECT2a4BtNf2VyRuAtCQr8+h9HIVX+95nxyqO/m+yJD3PtFCjOq4rSZUPQFQIeivgn8OjN5NjEGAc7fXtb3PweZ8KcHU9WcUhzaoYeTfbf4sVrpo1YJ23pwLNxyaUdAsU662lsJAgbJBR254EYfOI6jvugR4p7rSewlz81uy0IGA4Cy3feXgVG6cXUIj+e+5fC+s+GGeiQQIv26KLPX3mMgVjL8YqByvBKCd1xRaWRM4s3ZAkq3MW0CdGQ7l+vJfTmk14WXqEthWEgHhOb3S8iWmMA8WcenJYndX6IcQB0VKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PYNSGh8THKO5OfMcONWKgy3v5VaO+txjCEjfiAOtw4M=;
 b=fDSs1tjNusQ1M9C+VF1LWKOcsyhBhTEGn81/hcNqRCOTjchxsBf0bxGUxrOWTk5nS5ZPT9DdPMWQjjL8xYAhFUWkA/VR2BblVlaLJuyylkko72jxgOR0bTQDfigIvtqEJK3CMNec9rT3cCbtEMBRnFpXHoOWNAKbVTaj1uvAmbrfrvVnmokUiR11uYn8b1lZXCPzq8CwJq3TG57wJJZLakYK/o9zPNwHi2eX3sCGVZziHKsNpKW2K+y4zGnR9hW8OlkM7pSTj34/jdGG+D9f8JoQegKAN9zti22aK3A2GVJ4FNY4eXEgQzGJXwhaHDEGie7kY2eHC/KRwsfDSiDguw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by SJ0PR11MB5008.namprd11.prod.outlook.com (2603:10b6:a03:2d5::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Wed, 9 Jul
 2025 12:15:56 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%4]) with mapi id 15.20.8857.020; Wed, 9 Jul 2025
 12:15:56 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, "Stuart
 Summers" <stuart.summers@intel.com>, Matthew Auld <matthew.auld@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: [PATCH v10 2/5] drm/xe: Use dynamic allocation for tile and device
 VRAM region structures
Date: Wed, 9 Jul 2025 14:15:40 +0200
Message-ID: <20250709121543.4129807-3-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250709121543.4129807-1-piotr.piorkowski@intel.com>
References: <20250709121543.4129807-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DUZPR01CA0149.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bd::25) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|SJ0PR11MB5008:EE_
X-MS-Office365-Filtering-Correlation-Id: da4fae25-4052-4d64-5084-08ddbee25b2a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZVpqaDR0NitqZGNRcGV6Qk5tQ2pvNXhiTjJUMFA4NENkUjhmSDQvUkNlY3lx?=
 =?utf-8?B?UC9xNkVkUUlyNGR5OWtBc3E2THM4b2F5Y3B3VnBSdDc4QnZsSE1qaTQ1dWlI?=
 =?utf-8?B?Qk5qQlhpTUV3SGwxZmYxaEZoZExvSUkvU1o2dldWUGtwa3pxZlhleFNHeC9B?=
 =?utf-8?B?WXZhY0xFM29CZWgvcjlFV0lON0FCZzZxVmxaMlpqemEwUTZ4RjRBSXpJdGll?=
 =?utf-8?B?STAxOEI4SzNYazh5Y2ZmZS9kS1VWMnFtWDFrQzdOZm1LU01ONExiNlNlYU1v?=
 =?utf-8?B?cWZka3J1MkZqTjNOQU02OExkV3FwVHF6bjF5VzhnNS9oWnN4YmNyOWJXemJm?=
 =?utf-8?B?VU84L040RU4zTGIyaExXV29EbDhYZzFQRWtFTnV0NWRTV1I1blNBWGRMZlMv?=
 =?utf-8?B?SkE5ajJnWEpRY3RNRlI5NUNsTURZcERzcE9KdVpNa1lQRWwxYTNGR1FsWlUz?=
 =?utf-8?B?REUxL21TOFZQZnpCNmxtbkQ1TlM0eEZuSWRwSjRUTUx4UHU5MjRQb29vQ01S?=
 =?utf-8?B?ajByTkN0UXZsMmEwbkNzTkRxYzB2aEdIM1c5M0pMREUxMWZVMmk5LzNlcVB2?=
 =?utf-8?B?WHRybHBEZDVxMWtyMVZuZHpTNWJEaGdoRHQ0OGZRVkNEYnYxUU9nM2MrNURK?=
 =?utf-8?B?a3Rzb2x5UjE5bk9GamxsQnM5cXdPTGs5WmE4aE9CcWI3WUw5MEgwS0RUQmtK?=
 =?utf-8?B?eitKOFp1N3FUSnFQRXdBbno4UzV1bnpyZCt1SzF0QTdaRnUvblJsOTdpbENK?=
 =?utf-8?B?ZmpiZ0w2a3FnRTY2elI5MlFzRVJNU2txR0RBZnpDSGF5MVZIdHVQeUdQbGRq?=
 =?utf-8?B?VWFqNnlzMkVoTDB6NUVmUUxSSXR4R28zckUvRVVZazN4a2tJb1hlSHJGVzZF?=
 =?utf-8?B?UjVpVlVQUDdJTlo5Vm0xYkw5dnc3bmZlUm5DaEwwanFvajUwQld1TE11bEgr?=
 =?utf-8?B?MFlONGdvS0VmKzF3UnFjcVNIMWFDTWxyeWJFNlh5UjFNNEJhM3ZqaTJ5dko3?=
 =?utf-8?B?VUlJZ2JwVzhia0c4K3FoOFBCaFp5R0pPMXBjZWg5Zi9waUZhOGVHU1k5ZDhh?=
 =?utf-8?B?UTV2WDRwQ1gyQXhyRTZ1M21yWlRVcjE3QkJyZUFaNDJyelc3djNmNGR4citP?=
 =?utf-8?B?UXhKU3o4ZjZzVUVFbmxpbEdwQkFlRDFYbmhFZ3BSNzVtT1hYVERmY3JxNjI5?=
 =?utf-8?B?UDBZdWdSSjRNdmFHUXZLazZCa0J1THVJajljVno5SzFQSGhrbnBLRUFrR04y?=
 =?utf-8?B?ekZORDliSW1UR3crQk15b2RHQWt4Q1ZpTjJpOHBIT1IvOTVYZFJZQVRabms2?=
 =?utf-8?B?cG45TkFlVzhZYVRUeTNSaXhJOW40UlAvZ3dCb1J1b2Q4bmoxazVNU2I0ajN6?=
 =?utf-8?B?SFJnK2hIcS9QeWJxbFdGZ2tvSHkwWlFtell3TUVkUGZBTXRFMS95YzBqcDRh?=
 =?utf-8?B?YUJuTkIzbjRYMXFTcjYwMlUxeVhuWndJZm5NcnFvRWVleC9rS0dmc29kYk1O?=
 =?utf-8?B?Q1ZEc0dsclBkVWtqSE5kNW5zSGFVRFNFVzd0elVxc2VjaUtlbEx4N0c4QVQx?=
 =?utf-8?B?Qk93V0tXVEVQdUNzbk0xT2hJZnl4eTBmd0VRNmZvOURzWUVXUDB1eVVJc0t2?=
 =?utf-8?B?YTN2OTZocCs2S0RWZnZLOWR0MGdGc2pnUlRXVXRsSGJGWEF4UGY2OGFVYng1?=
 =?utf-8?B?aEJWb2lnaFgxZWFEeHVFd0lBWnZwYVBZelR5enBKNE1ROXk5Wlk4UDdlaHV1?=
 =?utf-8?B?Q3R2VmZmNnY2ZUhSSUE2c3VkRlhvWHg2eGpTSWppSHpkN0dhNjBwamNISUsr?=
 =?utf-8?B?WTdhbzRaWDJxeGtxOEpVZEpqT21WN0RIOEN5Umowai9XRTdYVHhiVHFpQmR3?=
 =?utf-8?B?NmZiaHBBNW5VNVcwbmlNS1dLbDcyV1g4ZU9BMVh6d0JPL0JKRXZwNFQxUjNU?=
 =?utf-8?Q?BX577fZuwZw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V3kzWDZ2dFdmNllsSE0vS0kyWG1IM25NUCt0cmNCejRVb1YyU3Iwelp4SVBu?=
 =?utf-8?B?SXVhdk1qR3gvbHBRWVdNZll1UXE5eXhCQmFMaFExc3ZHczY4V08xL1FaTnNP?=
 =?utf-8?B?eWNDUStqV0tZaVdCazJnRzYrMDFYOGRmN0pvanJzcnY4T3JNVmR4aXV6UGky?=
 =?utf-8?B?STJWU2E1dkRhSVpaUzFWTU1rcDkwRTJhRXY4MUgvZlVOdklGd2ZtRWlFMWVw?=
 =?utf-8?B?YWFjWEpqR0VWeWlFbkZnVXRaVXpUNHFncUhoNTQ2bzNuSS9wNVJldldmS3c3?=
 =?utf-8?B?cUY3L1Y2anByb0NUOU9tN0FCQzR0VVNuQ1hscW0yaHBuMXYvR2MxU0ZlTkg2?=
 =?utf-8?B?QnpmNm1hOWJ2RmMzaWUwa3RWYWNmOVFZVEs4MVBmL0lFN3c4VVFydzRiTUgz?=
 =?utf-8?B?RGcrYkVHYUF6K2UycmhnWDZFaURXZEQ2cHZ6Wk43YVdCcGdJY2Zoc0luM1dL?=
 =?utf-8?B?TDNvUVdxK1gyQ3B3Y1VCaHIya3B2SGtrUXg4SFNoc3E5NXFMMjE4V3lvN3h3?=
 =?utf-8?B?MGFqdDJ5Mjh4eWd1eTNaOTV4TGwrY2Vvc0JyeGI3aFVGNUVKd1hSR3BqWlc4?=
 =?utf-8?B?dzZOdUxHdWFvWWhiUEhkZzkrb204NXRsRUdicW4xR1dkcStBRkxhRXBmZUZS?=
 =?utf-8?B?Ri9lYkpac0t2cGNZZnpuYnp5Q0dwVWhwUEIzOWcyRHVpTkliN1pDbzQ4RFIr?=
 =?utf-8?B?Vit3d0t0R0RxTnExczhTME9KT3ZSNXFZS3NJOTNtN2g2Z1BvZW1rbUFEWWl3?=
 =?utf-8?B?YU81LzZRbGVSSEhMMUlDTm9WODI0ZjFLZXUyQUcxOVQ1MGV1YmVMWkJaN3Rv?=
 =?utf-8?B?RjA2VDR4eXVrb0FwWWdjNGMxMHNyNk8wdlgrNUp1U3BYNjRhSHJpd0VSdEJB?=
 =?utf-8?B?TDhVMEVIVjJXKzVPUTg2dmlpV2g1eVRnemkyUVF2bVg1K2p5TVdqZTBvK2c3?=
 =?utf-8?B?VXdDQWlWUmVtNnZDRHJYNGNWQkhuQzRGdDlpaW84QXZQVW14RGZIUnpoS3lX?=
 =?utf-8?B?WXZKdzlyVDFDbU5PRlVrdFJpb0pncTkyYmRBV2h3TU1xNHUxUUlOZ3dVYmk2?=
 =?utf-8?B?YVBNV2dTQ2d5cS9zYktvNTRNeDVkYVZ5UkpSR1VFeTl6NU9oaVZKcjc2VmJK?=
 =?utf-8?B?dXJnL2Myc2ltWHNiUVJUT25jMTNVdFpUV2g4OG5sVUlsdW93aVlQcUUzbkNm?=
 =?utf-8?B?NWQ2a0YwZjFTVWZpbXQrWi9XOHo2OG01RGszZlJwSEhCVE9RTEpIRG5kMXU1?=
 =?utf-8?B?OUtldmxySFgyY0l5WDlBN3l2cWQ3eE9Zd2NMZUlHMTd6WXV6S0I5R0lqNXFE?=
 =?utf-8?B?em9LRkcrR0U3Ry9lMmMxU3ZaU2ViZGN4VmNLaTRocnc2Z1JQcFo3cDU5V2Z6?=
 =?utf-8?B?WS9Db3Z4eWhmMXE4bUM4dnozRmVwSXFLWTFtcGR1a0RhZXhjbE5IRTF5azFo?=
 =?utf-8?B?Z09WSmdRZjZUQm9LQkFiTldRTDRZY2I2bFl3eU5XRjRXMWtNK3lBQ3g3c3ND?=
 =?utf-8?B?VjJQREp1ZXVHSXh0WGUvbWNFdDNrR1o5cXBaRFVTSTJnN3RZR2U2WnBaVEJQ?=
 =?utf-8?B?R1hwZmtFakJsUnpvKzRadTVTeURJOTIrUForWnp4Q3hXaUJDaHdSc1cydmVE?=
 =?utf-8?B?ZzRmZjNvUHNncmJBQjRDdlRYaExjbVZybjc2alZsOVo4SFlEUFBPREM4UnQ3?=
 =?utf-8?B?RkYzK2JORGFNaVJHdlZYUFFCVWRkeTY5Wm9PazYvVlVZOC9MZzJsNkh5bjhM?=
 =?utf-8?B?eGtLbVhEOC9iUHl6d1EwbmwvYlBFaFhWa1ZzVGZjK3loSmVkTkJDekN5aXRV?=
 =?utf-8?B?UkxPVnYzT3N1Z3hPcFB5NDJUUGJpaERhaEdIR08rUElSZWVvQ2FKelBrNVBj?=
 =?utf-8?B?UGpoc0dXVEgzZWptbmhzQ0FZK2pDeTRHaXgwaGRhY0JCT2IxM0FhOWFLc1lE?=
 =?utf-8?B?bHIzU2M3R3B3ckI5VWI3aEZ0ekp6WUp4UkNHZzNoVjlEcGF0M1g5RWw2QzdL?=
 =?utf-8?B?c2dFU0kwdnkyaGdEanlQQjJObFpteVZWZEFtNkVlcitHQnVtZ01RYXlkZ0Nq?=
 =?utf-8?B?dWdBM29vaFNsdVYzZGRBMHBEQjJWNjhEaG1YMTNpSUpvT1dRaDNoamNJYUJj?=
 =?utf-8?B?dFJTaG5veWVLZUJURXVPdjFoUmpVRFV2NHRrd2xzZURtMTNlblBiVjFmc21w?=
 =?utf-8?B?RVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: da4fae25-4052-4d64-5084-08ddbee25b2a
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2025 12:15:55.9665 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NryjqQ613sum7QXXvYw/r5DxkMEoUUEQqcNajFI32iDvfzz1TX9xexDNwEK9xVoCeAN8tCoGE5VOGiEP9gSqaU5Ye2Hpii6rHP4grSyDoH8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5008
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

In future platforms, we will need to represent the device and tile
VRAM regions in a more dynamic way, so let's abandon the static
allocation of these structures and start use a dynamic allocation.

v2:
 - Add a helpers for accessing fields of the xe_vram_region structure
v3:
- Add missing EXPORT_SYMBOL_IF_KUNIT for
  xe_vram_region_actual_physical_size

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Stuart Summers <stuart.summers@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Reviewed-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
---
 drivers/gpu/drm/xe/display/xe_fb_pin.c        |   4 +-
 drivers/gpu/drm/xe/display/xe_plane_initial.c |   2 +-
 drivers/gpu/drm/xe/xe_assert.h                |   4 +-
 drivers/gpu/drm/xe/xe_device.c                |  19 +++
 drivers/gpu/drm/xe/xe_device_types.h          |   6 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    |   2 +-
 drivers/gpu/drm/xe/xe_migrate.c               |  25 ++--
 drivers/gpu/drm/xe/xe_pci.c                   |   6 +
 drivers/gpu/drm/xe/xe_query.c                 |   2 +-
 drivers/gpu/drm/xe/xe_svm.c                   |  24 +---
 drivers/gpu/drm/xe/xe_tile.c                  |  34 ++++-
 drivers/gpu/drm/xe/xe_tile.h                  |   4 +-
 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c        |  10 +-
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c          |   7 +-
 drivers/gpu/drm/xe/xe_vram.c                  | 121 +++++++++++++-----
 drivers/gpu/drm/xe/xe_vram.h                  |   9 ++
 16 files changed, 202 insertions(+), 77 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index c38fba18effe..2187b2de64e1 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -289,7 +289,7 @@ static struct i915_vma *__xe_pin_fb_vma(const struct intel_framebuffer *fb,
 	if (IS_DGFX(to_xe_device(bo->ttm.base.dev)) &&
 	    intel_fb_rc_ccs_cc_plane(&fb->base) >= 0 &&
 	    !(bo->flags & XE_BO_FLAG_NEEDS_CPU_ACCESS)) {
-		struct xe_tile *tile = xe_device_get_root_tile(xe);
+		struct xe_vram_region *vram = xe_device_get_root_tile(xe)->mem.vram;
 
 		/*
 		 * If we need to able to access the clear-color value stored in
@@ -297,7 +297,7 @@ static struct i915_vma *__xe_pin_fb_vma(const struct intel_framebuffer *fb,
 		 * accessible.  This is important on small-bar systems where
 		 * only some subset of VRAM is CPU accessible.
 		 */
-		if (tile->mem.vram.io_size < tile->mem.vram.usable_size) {
+		if (xe_vram_region_io_size(vram) < xe_vram_region_usable_size(vram)) {
 			ret = -EINVAL;
 			goto err;
 		}
diff --git a/drivers/gpu/drm/xe/display/xe_plane_initial.c b/drivers/gpu/drm/xe/display/xe_plane_initial.c
index b2ede3af9345..873f4e18cb2a 100644
--- a/drivers/gpu/drm/xe/display/xe_plane_initial.c
+++ b/drivers/gpu/drm/xe/display/xe_plane_initial.c
@@ -103,7 +103,7 @@ initial_plane_bo(struct xe_device *xe,
 		 * We don't currently expect this to ever be placed in the
 		 * stolen portion.
 		 */
-		if (phys_base >= tile0->mem.vram.usable_size) {
+		if (phys_base >= xe_vram_region_usable_size(tile0->mem.vram)) {
 			drm_err(&xe->drm,
 				"Initial plane programming using invalid range, phys_base=%pa\n",
 				&phys_base);
diff --git a/drivers/gpu/drm/xe/xe_assert.h b/drivers/gpu/drm/xe/xe_assert.h
index 68fe70ce2be3..a818eaa05b7d 100644
--- a/drivers/gpu/drm/xe/xe_assert.h
+++ b/drivers/gpu/drm/xe/xe_assert.h
@@ -12,6 +12,7 @@
 
 #include "xe_gt_types.h"
 #include "xe_step.h"
+#include "xe_vram.h"
 
 /**
  * DOC: Xe Asserts
@@ -145,7 +146,8 @@
 	const struct xe_tile *__tile = (tile);							\
 	char __buf[10] __maybe_unused;								\
 	xe_assert_msg(tile_to_xe(__tile), condition, "tile: %u VRAM %s\n" msg,			\
-		      __tile->id, ({ string_get_size(__tile->mem.vram.actual_physical_size, 1,	\
+		      __tile->id, ({ string_get_size(						\
+				     xe_vram_region_actual_physical_size(__tile->mem.vram), 1,	\
 				     STRING_UNITS_2, __buf, sizeof(__buf)); __buf; }), ## arg);	\
 })
 
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 0b73cb72bad1..19019b032c78 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -685,6 +685,21 @@ static void sriov_update_device_info(struct xe_device *xe)
 	}
 }
 
+static int xe_device_vram_alloc(struct xe_device *xe)
+{
+	struct xe_vram_region *vram;
+
+	if (!IS_DGFX(xe))
+		return 0;
+
+	vram = drmm_kzalloc(&xe->drm, sizeof(*vram), GFP_KERNEL);
+	if (!vram)
+		return -ENOMEM;
+
+	xe->mem.vram = vram;
+	return 0;
+}
+
 /**
  * xe_device_probe_early: Device early probe
  * @xe: xe device instance
@@ -729,6 +744,10 @@ int xe_device_probe_early(struct xe_device *xe)
 
 	xe->wedged.mode = xe_modparam.wedged_mode;
 
+	err = xe_device_vram_alloc(xe);
+	if (err)
+		return err;
+
 	return 0;
 }
 ALLOW_ERROR_INJECTION(xe_device_probe_early, ERRNO); /* See xe_pci_probe() */
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 78c4acafd268..ece4bfcde477 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -74,6 +74,8 @@ struct xe_pxp;
  * device, such as HBM memory or CXL extension memory.
  */
 struct xe_vram_region {
+	/** @tile: Back pointer to tile */
+	struct xe_tile *tile;
 	/** @io_start: IO start address of this VRAM instance */
 	resource_size_t io_start;
 	/**
@@ -213,7 +215,7 @@ struct xe_tile {
 		 * Although VRAM is associated with a specific tile, it can
 		 * still be accessed by all tiles' GTs.
 		 */
-		struct xe_vram_region vram;
+		struct xe_vram_region *vram;
 
 		/** @mem.ggtt: Global graphics translation table */
 		struct xe_ggtt *ggtt;
@@ -396,7 +398,7 @@ struct xe_device {
 	/** @mem: memory info for device */
 	struct {
 		/** @mem.vram: VRAM info for device */
-		struct xe_vram_region vram;
+		struct xe_vram_region *vram;
 		/** @mem.sys_mgr: system TTM manager */
 		struct ttm_resource_manager sys_mgr;
 		/** @mem.sys_mgr: system memory shrinker. */
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index d186f780885d..e69a05126dae 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -1574,7 +1574,7 @@ static u64 pf_query_free_lmem(struct xe_gt *gt)
 {
 	struct xe_tile *tile = gt->tile;
 
-	return xe_ttm_vram_get_avail(&tile->mem.vram.ttm.manager);
+	return xe_ttm_vram_get_avail(&tile->mem.vram->ttm.manager);
 }
 
 static u64 pf_query_max_lmem(struct xe_gt *gt)
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 4e2bdf70eb70..6272e2bb0482 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -34,6 +34,7 @@
 #include "xe_sync.h"
 #include "xe_trace_bo.h"
 #include "xe_vm.h"
+#include "xe_vram.h"
 
 /**
  * struct xe_migrate - migrate context.
@@ -130,34 +131,36 @@ static u64 xe_migrate_vram_ofs(struct xe_device *xe, u64 addr, bool is_comp_pte)
 	u64 identity_offset = IDENTITY_OFFSET;
 
 	if (GRAPHICS_VER(xe) >= 20 && is_comp_pte)
-		identity_offset += DIV_ROUND_UP_ULL(xe->mem.vram.actual_physical_size, SZ_1G);
+		identity_offset += DIV_ROUND_UP_ULL(xe_vram_region_actual_physical_size
+							(xe->mem.vram), SZ_1G);
 
-	addr -= xe->mem.vram.dpa_base;
+	addr -= xe_vram_region_dpa_base(xe->mem.vram);
 	return addr + (identity_offset << xe_pt_shift(2));
 }
 
 static void xe_migrate_program_identity(struct xe_device *xe, struct xe_vm *vm, struct xe_bo *bo,
 					u64 map_ofs, u64 vram_offset, u16 pat_index, u64 pt_2m_ofs)
 {
+	struct xe_vram_region *vram = xe->mem.vram;
+	resource_size_t dpa_base = xe_vram_region_dpa_base(vram);
 	u64 pos, ofs, flags;
 	u64 entry;
 	/* XXX: Unclear if this should be usable_size? */
-	u64 vram_limit =  xe->mem.vram.actual_physical_size +
-		xe->mem.vram.dpa_base;
+	u64 vram_limit = xe_vram_region_actual_physical_size(vram) + dpa_base;
 	u32 level = 2;
 
 	ofs = map_ofs + XE_PAGE_SIZE * level + vram_offset * 8;
 	flags = vm->pt_ops->pte_encode_addr(xe, 0, pat_index, level,
 					    true, 0);
 
-	xe_assert(xe, IS_ALIGNED(xe->mem.vram.usable_size, SZ_2M));
+	xe_assert(xe, IS_ALIGNED(xe_vram_region_usable_size(vram), SZ_2M));
 
 	/*
 	 * Use 1GB pages when possible, last chunk always use 2M
 	 * pages as mixing reserved memory (stolen, WOCPM) with a single
 	 * mapping is not allowed on certain platforms.
 	 */
-	for (pos = xe->mem.vram.dpa_base; pos < vram_limit;
+	for (pos = dpa_base; pos < vram_limit;
 	     pos += SZ_1G, ofs += 8) {
 		if (pos + SZ_1G >= vram_limit) {
 			entry = vm->pt_ops->pde_encode_bo(bo, pt_2m_ofs,
@@ -307,11 +310,11 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
 	/* Identity map the entire vram at 256GiB offset */
 	if (IS_DGFX(xe)) {
 		u64 pt30_ofs = xe_bo_size(bo) - 2 * XE_PAGE_SIZE;
+		resource_size_t actual_phy_size = xe_vram_region_actual_physical_size(xe->mem.vram);
 
 		xe_migrate_program_identity(xe, vm, bo, map_ofs, IDENTITY_OFFSET,
 					    pat_index, pt30_ofs);
-		xe_assert(xe, xe->mem.vram.actual_physical_size <=
-					(MAX_NUM_PTE - IDENTITY_OFFSET) * SZ_1G);
+		xe_assert(xe, actual_phy_size <= (MAX_NUM_PTE - IDENTITY_OFFSET) * SZ_1G);
 
 		/*
 		 * Identity map the entire vram for compressed pat_index for xe2+
@@ -320,11 +323,11 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
 		if (GRAPHICS_VER(xe) >= 20 && xe_device_has_flat_ccs(xe)) {
 			u16 comp_pat_index = xe->pat.idx[XE_CACHE_NONE_COMPRESSION];
 			u64 vram_offset = IDENTITY_OFFSET +
-				DIV_ROUND_UP_ULL(xe->mem.vram.actual_physical_size, SZ_1G);
+				DIV_ROUND_UP_ULL(actual_phy_size, SZ_1G);
 			u64 pt31_ofs = xe_bo_size(bo) - XE_PAGE_SIZE;
 
-			xe_assert(xe, xe->mem.vram.actual_physical_size <= (MAX_NUM_PTE -
-						IDENTITY_OFFSET - IDENTITY_OFFSET / 2) * SZ_1G);
+			xe_assert(xe, actual_phy_size <= (MAX_NUM_PTE - IDENTITY_OFFSET -
+							  IDENTITY_OFFSET / 2) * SZ_1G);
 			xe_migrate_program_identity(xe, vm, bo, map_ofs, vram_offset,
 						    comp_pat_index, pt31_ofs);
 		}
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index ffd6ad569b7c..c1226f56918b 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -691,6 +691,8 @@ static int xe_info_init(struct xe_device *xe,
 	 * All of these together determine the overall GT count.
 	 */
 	for_each_tile(tile, xe, id) {
+		int err;
+
 		gt = tile->primary_gt;
 		gt->info.type = XE_GT_TYPE_MAIN;
 		gt->info.id = tile->id * xe->info.max_gt_per_tile;
@@ -698,6 +700,10 @@ static int xe_info_init(struct xe_device *xe,
 		gt->info.engine_mask = graphics_desc->hw_engine_mask;
 		xe->info.gt_count++;
 
+		err = xe_tile_alloc_vram(tile);
+		if (err)
+			return err;
+
 		if (MEDIA_VER(xe) < 13 && media_desc)
 			gt->info.engine_mask |= media_desc->hw_engine_mask;
 
diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index d517ec9ddcbf..66ea3403afbe 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -337,7 +337,7 @@ static int query_config(struct xe_device *xe, struct drm_xe_device_query *query)
 	config->num_params = num_params;
 	config->info[DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID] =
 		xe->info.devid | (xe->info.revid << 16);
-	if (xe_device_get_root_tile(xe)->mem.vram.usable_size)
+	if (xe->mem.vram)
 		config->info[DRM_XE_QUERY_CONFIG_FLAGS] |=
 			DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM;
 	if (xe->info.has_usm && IS_ENABLED(CONFIG_DRM_XE_GPUSVM))
diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index a7ff5975873f..e6871734ffa9 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -306,16 +306,11 @@ static struct xe_vram_region *page_to_vr(struct page *page)
 	return container_of(page_pgmap(page), struct xe_vram_region, pagemap);
 }
 
-static struct xe_tile *vr_to_tile(struct xe_vram_region *vr)
-{
-	return container_of(vr, struct xe_tile, mem.vram);
-}
-
 static u64 xe_vram_region_page_to_dpa(struct xe_vram_region *vr,
 				      struct page *page)
 {
 	u64 dpa;
-	struct xe_tile *tile = vr_to_tile(vr);
+	struct xe_tile *tile = vr->tile;
 	u64 pfn = page_to_pfn(page);
 	u64 offset;
 
@@ -370,7 +365,7 @@ static int xe_svm_copy(struct page **pages, dma_addr_t *dma_addr,
 
 		if (!vr && spage) {
 			vr = page_to_vr(spage);
-			tile = vr_to_tile(vr);
+			tile = vr->tile;
 		}
 		XE_WARN_ON(spage && page_to_vr(spage) != vr);
 
@@ -508,7 +503,7 @@ static u64 block_offset_to_pfn(struct xe_vram_region *vr, u64 offset)
 
 static struct drm_buddy *tile_to_buddy(struct xe_tile *tile)
 {
-	return &tile->mem.vram.ttm.mm;
+	return &tile->mem.vram->ttm.mm;
 }
 
 static int xe_svm_populate_devmem_pfn(struct drm_pagemap_devmem *devmem_allocation,
@@ -522,7 +517,7 @@ static int xe_svm_populate_devmem_pfn(struct drm_pagemap_devmem *devmem_allocati
 
 	list_for_each_entry(block, blocks, link) {
 		struct xe_vram_region *vr = block->private;
-		struct xe_tile *tile = vr_to_tile(vr);
+		struct xe_tile *tile = vr->tile;
 		struct drm_buddy *buddy = tile_to_buddy(tile);
 		u64 block_pfn = block_offset_to_pfn(vr, drm_buddy_block_offset(block));
 		int i;
@@ -683,20 +678,15 @@ u64 xe_svm_find_vma_start(struct xe_vm *vm, u64 start, u64 end, struct xe_vma *v
 }
 
 #if IS_ENABLED(CONFIG_DRM_XE_PAGEMAP)
-static struct xe_vram_region *tile_to_vr(struct xe_tile *tile)
-{
-	return &tile->mem.vram;
-}
-
 static int xe_drm_pagemap_populate_mm(struct drm_pagemap *dpagemap,
 				      unsigned long start, unsigned long end,
 				      struct mm_struct *mm,
 				      unsigned long timeslice_ms)
 {
-	struct xe_tile *tile = container_of(dpagemap, typeof(*tile), mem.vram.dpagemap);
+	struct xe_vram_region *vr = container_of(dpagemap, typeof(*vr), dpagemap);
+	struct xe_tile *tile = vr->tile;
 	struct xe_device *xe = tile_to_xe(tile);
 	struct device *dev = xe->drm.dev;
-	struct xe_vram_region *vr = tile_to_vr(tile);
 	struct drm_buddy_block *block;
 	struct list_head *blocks;
 	struct xe_bo *bo;
@@ -722,7 +712,7 @@ static int xe_drm_pagemap_populate_mm(struct drm_pagemap *dpagemap,
 
 	drm_pagemap_devmem_init(&bo->devmem_allocation, dev, mm,
 				&dpagemap_devmem_ops,
-				&tile->mem.vram.dpagemap,
+				&tile->mem.vram->dpagemap,
 				end - start);
 
 	blocks = &to_xe_ttm_vram_mgr_resource(bo->ttm.resource)->blocks;
diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
index 86e9811e60ba..858ce0183aaa 100644
--- a/drivers/gpu/drm/xe/xe_tile.c
+++ b/drivers/gpu/drm/xe/xe_tile.c
@@ -19,6 +19,7 @@
 #include "xe_tile_sysfs.h"
 #include "xe_ttm_vram_mgr.h"
 #include "xe_wa.h"
+#include "xe_vram.h"
 
 /**
  * DOC: Multi-tile Design
@@ -95,6 +96,33 @@ static int xe_tile_alloc(struct xe_tile *tile)
 	return 0;
 }
 
+/**
+ * xe_tile_alloc_vram - Perform per-tile VRAM structs allocation
+ * @tile: Tile to perform allocations for
+ *
+ * Allocates VRAM per-tile data structures using DRM-managed allocations.
+ * Does not touch the hardware.
+ *
+ * Returns -ENOMEM if allocations fail, otherwise 0.
+ */
+int xe_tile_alloc_vram(struct xe_tile *tile)
+{
+	struct xe_device *xe = tile_to_xe(tile);
+	struct xe_vram_region *vram;
+
+	if (!IS_DGFX(xe))
+		return 0;
+
+	vram = drmm_kzalloc(&xe->drm, sizeof(*vram), GFP_KERNEL);
+	if (!vram)
+		return -ENOMEM;
+
+	vram->tile = tile;
+	tile->mem.vram = vram;
+
+	return 0;
+}
+
 /**
  * xe_tile_init_early - Initialize the tile and primary GT
  * @tile: Tile to initialize
@@ -132,8 +160,8 @@ static int tile_ttm_mgr_init(struct xe_tile *tile)
 	struct xe_device *xe = tile_to_xe(tile);
 	int err;
 
-	if (tile->mem.vram.usable_size) {
-		err = xe_ttm_vram_mgr_init(tile, &tile->mem.vram.ttm);
+	if (tile->mem.vram) {
+		err = xe_ttm_vram_mgr_init(tile, &tile->mem.vram->ttm);
 		if (err)
 			return err;
 		xe->info.mem_region_mask |= BIT(tile->id) << 1;
@@ -168,7 +196,7 @@ int xe_tile_init_noalloc(struct xe_tile *tile)
 	xe_wa_apply_tile_workarounds(tile);
 
 	if (xe->info.has_usm && IS_DGFX(xe))
-		xe_devm_add(tile, &tile->mem.vram);
+		xe_devm_add(tile, tile->mem.vram);
 
 	return xe_tile_sysfs_init(tile);
 }
diff --git a/drivers/gpu/drm/xe/xe_tile.h b/drivers/gpu/drm/xe/xe_tile.h
index 066a3d0cea79..fb0473fa9098 100644
--- a/drivers/gpu/drm/xe/xe_tile.h
+++ b/drivers/gpu/drm/xe/xe_tile.h
@@ -14,12 +14,14 @@ int xe_tile_init_early(struct xe_tile *tile, struct xe_device *xe, u8 id);
 int xe_tile_init_noalloc(struct xe_tile *tile);
 int xe_tile_init(struct xe_tile *tile);
 
+int xe_tile_alloc_vram(struct xe_tile *tile);
+
 void xe_tile_migrate_wait(struct xe_tile *tile);
 
 #if IS_ENABLED(CONFIG_DRM_XE_PAGEMAP)
 static inline struct drm_pagemap *xe_tile_local_pagemap(struct xe_tile *tile)
 {
-	return &tile->mem.vram.dpagemap;
+	return &tile->mem.vram->dpagemap;
 }
 #else
 static inline struct drm_pagemap *xe_tile_local_pagemap(struct xe_tile *tile)
diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
index d9c9d2547aad..9a9733447230 100644
--- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
@@ -25,6 +25,7 @@
 #include "xe_ttm_stolen_mgr.h"
 #include "xe_ttm_vram_mgr.h"
 #include "xe_wa.h"
+#include "xe_vram.h"
 
 struct xe_ttm_stolen_mgr {
 	struct xe_ttm_vram_mgr base;
@@ -82,15 +83,16 @@ static u32 get_wopcm_size(struct xe_device *xe)
 
 static s64 detect_bar2_dgfx(struct xe_device *xe, struct xe_ttm_stolen_mgr *mgr)
 {
-	struct xe_tile *tile = xe_device_get_root_tile(xe);
+	struct xe_vram_region *tile_vram = xe_device_get_root_tile(xe)->mem.vram;
+	resource_size_t tile_io_start = xe_vram_region_io_start(tile_vram);
 	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
 	u64 stolen_size, wopcm_size;
 	u64 tile_offset;
 	u64 tile_size;
 
-	tile_offset = tile->mem.vram.io_start - xe->mem.vram.io_start;
-	tile_size = tile->mem.vram.actual_physical_size;
+	tile_offset = tile_io_start - xe_vram_region_io_start(xe->mem.vram);
+	tile_size = xe_vram_region_actual_physical_size(tile_vram);
 
 	/* Use DSM base address instead for stolen memory */
 	mgr->stolen_base = (xe_mmio_read64_2x32(mmio, DSMBASE) & BDSM_MASK) - tile_offset;
@@ -107,7 +109,7 @@ static s64 detect_bar2_dgfx(struct xe_device *xe, struct xe_ttm_stolen_mgr *mgr)
 
 	/* Verify usage fits in the actual resource available */
 	if (mgr->stolen_base + stolen_size <= pci_resource_len(pdev, LMEM_BAR))
-		mgr->io_base = tile->mem.vram.io_start + mgr->stolen_base;
+		mgr->io_base = tile_io_start + mgr->stolen_base;
 
 	/*
 	 * There may be few KB of platform dependent reserved memory at the end
diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
index 9e375a40aee9..3de2df47959b 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
@@ -340,10 +340,11 @@ int __xe_ttm_vram_mgr_init(struct xe_device *xe, struct xe_ttm_vram_mgr *mgr,
 int xe_ttm_vram_mgr_init(struct xe_tile *tile, struct xe_ttm_vram_mgr *mgr)
 {
 	struct xe_device *xe = tile_to_xe(tile);
-	struct xe_vram_region *vram = &tile->mem.vram;
+	struct xe_vram_region *vram = tile->mem.vram;
 
 	return __xe_ttm_vram_mgr_init(xe, mgr, XE_PL_VRAM0 + tile->id,
-				      vram->usable_size, vram->io_size,
+				      xe_vram_region_usable_size(vram),
+				      xe_vram_region_io_size(vram),
 				      PAGE_SIZE);
 }
 
@@ -392,7 +393,7 @@ int xe_ttm_vram_mgr_alloc_sgt(struct xe_device *xe,
 	 */
 	xe_res_first(res, offset, length, &cursor);
 	for_each_sgtable_sg((*sgt), sg, i) {
-		phys_addr_t phys = cursor.start + tile->mem.vram.io_start;
+		phys_addr_t phys = cursor.start + xe_vram_region_io_start(tile->mem.vram);
 		size_t size = min_t(u64, cursor.size, SZ_2G);
 		dma_addr_t addr;
 
diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
index 3a4c84e9efc6..c93e9b96354b 100644
--- a/drivers/gpu/drm/xe/xe_vram.c
+++ b/drivers/gpu/drm/xe/xe_vram.c
@@ -3,6 +3,7 @@
  * Copyright © 2021-2024 Intel Corporation
  */
 
+#include <kunit/visibility.h>
 #include <linux/pci.h>
 
 #include <drm/drm_managed.h>
@@ -147,17 +148,17 @@ static int determine_lmem_bar_size(struct xe_device *xe)
 
 	resize_vram_bar(xe);
 
-	xe->mem.vram.io_start = pci_resource_start(pdev, LMEM_BAR);
-	xe->mem.vram.io_size = pci_resource_len(pdev, LMEM_BAR);
-	if (!xe->mem.vram.io_size)
+	xe->mem.vram->io_start = pci_resource_start(pdev, LMEM_BAR);
+	xe->mem.vram->io_size = pci_resource_len(pdev, LMEM_BAR);
+	if (!xe->mem.vram->io_size)
 		return -EIO;
 
 	/* XXX: Need to change when xe link code is ready */
-	xe->mem.vram.dpa_base = 0;
+	xe->mem.vram->dpa_base = 0;
 
 	/* set up a map to the total memory area. */
-	xe->mem.vram.mapping = devm_ioremap_wc(&pdev->dev, xe->mem.vram.io_start,
-					       xe->mem.vram.io_size);
+	xe->mem.vram->mapping = devm_ioremap_wc(&pdev->dev, xe->mem.vram->io_start,
+						xe->mem.vram->io_size);
 
 	return 0;
 }
@@ -279,10 +280,10 @@ static void vram_fini(void *arg)
 	struct xe_tile *tile;
 	int id;
 
-	xe->mem.vram.mapping = NULL;
+	xe->mem.vram->mapping = NULL;
 
 	for_each_tile(tile, xe, id)
-		tile->mem.vram.mapping = NULL;
+		tile->mem.vram->mapping = NULL;
 }
 
 /**
@@ -318,10 +319,10 @@ int xe_vram_probe(struct xe_device *xe)
 	if (err)
 		return err;
 
-	drm_info(&xe->drm, "VISIBLE VRAM: %pa, %pa\n", &xe->mem.vram.io_start,
-		 &xe->mem.vram.io_size);
+	drm_info(&xe->drm, "VISIBLE VRAM: %pa, %pa\n", &xe->mem.vram->io_start,
+		 &xe->mem.vram->io_size);
 
-	io_size = xe->mem.vram.io_size;
+	io_size = xe->mem.vram->io_size;
 
 	/* tile specific ranges */
 	for_each_tile(tile, xe, id) {
@@ -329,45 +330,105 @@ int xe_vram_probe(struct xe_device *xe)
 		if (err)
 			return err;
 
-		tile->mem.vram.actual_physical_size = tile_size;
-		tile->mem.vram.io_start = xe->mem.vram.io_start + tile_offset;
-		tile->mem.vram.io_size = min_t(u64, vram_size, io_size);
+		tile->mem.vram->actual_physical_size = tile_size;
+		tile->mem.vram->io_start = xe->mem.vram->io_start + tile_offset;
+		tile->mem.vram->io_size = min_t(u64, vram_size, io_size);
 
-		if (!tile->mem.vram.io_size) {
+		if (!tile->mem.vram->io_size) {
 			drm_err(&xe->drm, "Tile without any CPU visible VRAM. Aborting.\n");
 			return -ENODEV;
 		}
 
-		tile->mem.vram.dpa_base = xe->mem.vram.dpa_base + tile_offset;
-		tile->mem.vram.usable_size = vram_size;
-		tile->mem.vram.mapping = xe->mem.vram.mapping + tile_offset;
+		tile->mem.vram->dpa_base = xe->mem.vram->dpa_base + tile_offset;
+		tile->mem.vram->usable_size = vram_size;
+		tile->mem.vram->mapping = xe->mem.vram->mapping + tile_offset;
 
-		if (tile->mem.vram.io_size < tile->mem.vram.usable_size)
+		if (tile->mem.vram->io_size < tile->mem.vram->usable_size)
 			drm_info(&xe->drm, "Small BAR device\n");
-		drm_info(&xe->drm, "VRAM[%u, %u]: Actual physical size %pa, usable size exclude stolen %pa, CPU accessible size %pa\n", id,
-			 tile->id, &tile->mem.vram.actual_physical_size, &tile->mem.vram.usable_size, &tile->mem.vram.io_size);
-		drm_info(&xe->drm, "VRAM[%u, %u]: DPA range: [%pa-%llx], io range: [%pa-%llx]\n", id, tile->id,
-			 &tile->mem.vram.dpa_base, tile->mem.vram.dpa_base + (u64)tile->mem.vram.actual_physical_size,
-			 &tile->mem.vram.io_start, tile->mem.vram.io_start + (u64)tile->mem.vram.io_size);
+		drm_info(&xe->drm,
+			 "VRAM[%u, %u]: Actual physical size %pa, usable size exclude stolen %pa, CPU accessible size %pa\n",
+			 id, tile->id, &tile->mem.vram->actual_physical_size,
+			 &tile->mem.vram->usable_size, &tile->mem.vram->io_size);
+		drm_info(&xe->drm, "VRAM[%u, %u]: DPA range: [%pa-%llx], io range: [%pa-%llx]\n",
+			 id, tile->id, &tile->mem.vram->dpa_base,
+			 tile->mem.vram->dpa_base + (u64)tile->mem.vram->actual_physical_size,
+			 &tile->mem.vram->io_start,
+			 tile->mem.vram->io_start + (u64)tile->mem.vram->io_size);
 
 		/* calculate total size using tile size to get the correct HW sizing */
 		total_size += tile_size;
 		available_size += vram_size;
 
-		if (total_size > xe->mem.vram.io_size) {
+		if (total_size > xe->mem.vram->io_size) {
 			drm_info(&xe->drm, "VRAM: %pa is larger than resource %pa\n",
-				 &total_size, &xe->mem.vram.io_size);
+				 &total_size, &xe->mem.vram->io_size);
 		}
 
 		io_size -= min_t(u64, tile_size, io_size);
 	}
 
-	xe->mem.vram.actual_physical_size = total_size;
+	xe->mem.vram->actual_physical_size = total_size;
 
-	drm_info(&xe->drm, "Total VRAM: %pa, %pa\n", &xe->mem.vram.io_start,
-		 &xe->mem.vram.actual_physical_size);
-	drm_info(&xe->drm, "Available VRAM: %pa, %pa\n", &xe->mem.vram.io_start,
+	drm_info(&xe->drm, "Total VRAM: %pa, %pa\n", &xe->mem.vram->io_start,
+		 &xe->mem.vram->actual_physical_size);
+	drm_info(&xe->drm, "Available VRAM: %pa, %pa\n", &xe->mem.vram->io_start,
 		 &available_size);
 
 	return devm_add_action_or_reset(xe->drm.dev, vram_fini, xe);
 }
+
+/**
+ * xe_vram_region_io_start - Get the IO start of a VRAM region
+ * @vram: the VRAM region
+ *
+ * Return: the IO start of the VRAM region, or 0 if not valid
+ */
+resource_size_t xe_vram_region_io_start(const struct xe_vram_region *vram)
+{
+	return vram ? vram->io_start : 0;
+}
+
+/**
+ * xe_vram_region_io_size - Get the IO size of a VRAM region
+ * @vram: the VRAM region
+ *
+ * Return: the IO size of the VRAM region, or 0 if not valid
+ */
+resource_size_t xe_vram_region_io_size(const struct xe_vram_region *vram)
+{
+	return vram ? vram->io_size : 0;
+}
+
+/**
+ * xe_vram_region_dpa_base - Get the DPA base of a VRAM region
+ * @vram: the VRAM region
+ *
+ * Return: the DPA base of the VRAM region, or 0 if not valid
+ */
+resource_size_t xe_vram_region_dpa_base(const struct xe_vram_region *vram)
+{
+	return vram ? vram->dpa_base : 0;
+}
+
+/**
+ * xe_vram_region_usable_size - Get the usable size of a VRAM region
+ * @vram: the VRAM region
+ *
+ * Return: the usable size of the VRAM region, or 0 if not valid
+ */
+resource_size_t xe_vram_region_usable_size(const struct xe_vram_region *vram)
+{
+	return vram ? vram->usable_size : 0;
+}
+
+/**
+ * xe_vram_region_actual_physical_size - Get the actual physical size of a VRAM region
+ * @vram: the VRAM region
+ *
+ * Return: the actual physical size of the VRAM region, or 0 if not valid
+ */
+resource_size_t xe_vram_region_actual_physical_size(const struct xe_vram_region *vram)
+{
+	return vram ? vram->actual_physical_size : 0;
+}
+EXPORT_SYMBOL_IF_KUNIT(xe_vram_region_actual_physical_size);
diff --git a/drivers/gpu/drm/xe/xe_vram.h b/drivers/gpu/drm/xe/xe_vram.h
index e31cc04ec0db..d4bf1f9c2a72 100644
--- a/drivers/gpu/drm/xe/xe_vram.h
+++ b/drivers/gpu/drm/xe/xe_vram.h
@@ -6,8 +6,17 @@
 #ifndef _XE_VRAM_H_
 #define _XE_VRAM_H_
 
+#include <linux/types.h>
+
 struct xe_device;
+struct xe_vram_region;
 
 int xe_vram_probe(struct xe_device *xe);
 
+resource_size_t xe_vram_region_io_start(const struct xe_vram_region *vram);
+resource_size_t xe_vram_region_io_size(const struct xe_vram_region *vram);
+resource_size_t xe_vram_region_dpa_base(const struct xe_vram_region *vram);
+resource_size_t xe_vram_region_usable_size(const struct xe_vram_region *vram);
+resource_size_t xe_vram_region_actual_physical_size(const struct xe_vram_region *vram);
+
 #endif
-- 
2.34.1

