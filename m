Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F2D7C5321E
	for <intel-xe@archiver.kernel.org>; Sat, 24 Aug 2024 00:32:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E622C10E186;
	Sat, 24 Aug 2024 00:32:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FCt3A6rm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DBEC10E182
 for <intel-xe@lists.freedesktop.org>; Sat, 24 Aug 2024 00:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724459554; x=1755995554;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=yFbQRx1mhNS9OavKv8MxiKbuhaCvgyg7o35CdfcUaKY=;
 b=FCt3A6rmH6HifU5UUET9prkuv3QbrLMbw9WGTi/J+2ULYVHdd7+tG/j+
 cs4g+N+3+Xyt5+1ePxZUNWa/rP36Cu5l7PxEZej73Yvllg1XXTWn0JGW1
 zMiicCQLhWsfoOr6NfNCQ9HO2jVc8L/yWvDVnVSYDUHs//LJAZUM2G1l/
 FDWyhRNQHZ/Oitt8N4ZZl1F1Yx7L3KBmxwG3K0MpXuMK9TBLyamZAO7w4
 0hgxbr5rnCxb5VV0y+NeQZOohKxC3Zz6z917/QN+AClB82vPadbbgbY2m
 vOQ6q2tJ90XocyMZRpR1+7u+3sFx9huqfFqZea2meT3i/9WqaMtvcsJh2 A==;
X-CSE-ConnectionGUID: pgWSJW4kTAG9nXC27c4mTQ==
X-CSE-MsgGUID: m0bH4l/WSvikUrFeZc5YMw==
X-IronPort-AV: E=McAfee;i="6700,10204,11173"; a="34370800"
X-IronPort-AV: E=Sophos;i="6.10,171,1719903600"; d="scan'208";a="34370800"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2024 17:32:33 -0700
X-CSE-ConnectionGUID: O4efieU3Tryjdv7CKjtYag==
X-CSE-MsgGUID: 9ifjUJFOTBazC4M+x4U04A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,171,1719903600"; d="scan'208";a="66892331"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Aug 2024 17:32:34 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 23 Aug 2024 17:32:32 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 23 Aug 2024 17:32:32 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 23 Aug 2024 17:32:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GhYnXu9BB0OMzIQXgpmuZDZVuFAsxtHEB0fk9/x2MKjxbszK9y2kFEUUeu9i8mROU6N7zuzxK6rOK8ybiFK6J7nHBpVVolhnGIuBc0YHaEz3IOIYwX9B7dmeG5JtKzL1Ld+Nwscuky0kvDR5pHDIC0MdiVPpMV1jy9AHeKQABq5TOO3copMa4z643kKRduThypeIaZjMAoZH9CzhsXj/C2WC9+S4pXY8INNQ1qQpclBAoc7ZCdgiR3KlIr6x0n1JarJ5MXV3O6Vf090qpvLbjZjtp2MwsNeGHMw946g+5/Hr4iwU/BWaACIzRmP7g4Qh6p9/n0WpINMGwv6Hp9UVMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vEH4H1pkRtkCohFuutJgFt2RJEz8o3SpmC4E2xO/guE=;
 b=lRHPbE2uRIwspgnFRUmKXAtWR0BOJauRmpQ1WS0cJdrHyUPbDlHDhWhhJCCUFhiq6ZeqAfa6SKB5Wf8r/NmIRVqYDHuydjTOeh8fnuiKJekLxpHvWlbW1DQvl5/XGa2pgl2XW9aMqn2ZVWAAR8Tri94LAPFw4+LebKLwLSQTX9s+s7QAy4d+V/uqIXPTPrw78XwOBDbYFGM+vW/aV9zcX/FiwuQCjKolnQkWCzsu2/x2ckP8OOvXaEHpQN48X6dNrF+iohpUMKnGrhWb0s/FkiqYL4SZOMbhIlfP+h8mKcSq3ns0/RgizEeG1ljIYw318W7CYl3OFU+ZXOJYWExAjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7821.namprd11.prod.outlook.com (2603:10b6:208:3f0::22)
 by PH0PR11MB7524.namprd11.prod.outlook.com (2603:10b6:510:281::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.18; Sat, 24 Aug
 2024 00:32:25 +0000
Received: from IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::2ca4:29ad:f305:6fc0]) by IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::2ca4:29ad:f305:6fc0%5]) with mapi id 15.20.7875.023; Sat, 24 Aug 2024
 00:32:25 +0000
Message-ID: <0a0f4ca8-224d-4c68-911c-6f2d85953819@intel.com>
Date: Fri, 23 Aug 2024 17:32:21 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] drm/xe/gsc: Track the platform in the compatibility
 version
To: <intel-xe@lists.freedesktop.org>
References: <20240813231148.1663731-1-daniele.ceraolospurio@intel.com>
 <20240813231148.1663731-4-daniele.ceraolospurio@intel.com>
Content-Language: en-US
From: Julia Filipchuk <julia.filipchuk@intel.com>
Organization: Intel
In-Reply-To: <20240813231148.1663731-4-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY1P220CA0024.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5c3::9) To IA1PR11MB7821.namprd11.prod.outlook.com
 (2603:10b6:208:3f0::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7821:EE_|PH0PR11MB7524:EE_
X-MS-Office365-Filtering-Correlation-Id: 64fbb000-4b2a-48cf-6a29-08dcc3d43a32
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SW1GbFdRd25TRVZIYmpWNEZ1QzhFa2hOR3J4cWNvQ01rbU5iZHdkZkRCREkz?=
 =?utf-8?B?OGZadzZHMlhsM3FHdWJaQnpMdGgxalhDc1BMKzRTUVFGdFVIY0NTd3lMYUtE?=
 =?utf-8?B?TGd6ZXA1K1pMdUY0Z0pZTTREZlNqU2lPTDd4a2hVR05lVzd4MlBOL3BSUStB?=
 =?utf-8?B?WG92RE5LTHF4YzNyZTBUOGFzNGRlRHZmenY1SENWbytsaHRIbWVPd1hpemoz?=
 =?utf-8?B?WFlzcG9xcVNucTJtWUFwNytzWUlONFZ5WVljWXBvbzJPQVRJbkhNSGkyQWMv?=
 =?utf-8?B?YVM2dzhoN0FXaG0yZm1FbVMvbG5NUjFmVjZLQThyM2xkQVhaVkkvSGpYQ2RO?=
 =?utf-8?B?cHIwbEY3NVpub1V0VkNQZkhZSVA0dUc0SnZHWGwyR3NlS2JXRlZRMTFwYnpB?=
 =?utf-8?B?TXlXSk44c1h2Y29HSUZOb1ozNk9zWjU2OHAwTzU0eFhTd05TREs2Yzd3WFVI?=
 =?utf-8?B?d1hsb0I5aGlQRTNKMnZYdzE3cWxnam05WnZrQ2R5QnJ3QWUvdUQwZ2JockZx?=
 =?utf-8?B?MkFFUXh6UGNGZlBUbkNrckhZNWlrM3JGNHh1Q01TR1VzZXIvRERXVzNuYXYz?=
 =?utf-8?B?a0JwYkM3MnJzOVlqQUZTbFBuV1pJaVBJdGFYdENLWFpZYnN3OU53eTZkbkYz?=
 =?utf-8?B?c21xeXRMK29aR2dNcVBHOExCWGZuL2xIL0JWcmZiV20yZTU0dVh3RFUra29x?=
 =?utf-8?B?OU04WkJMSU5LVHkwZjNhMkNkTzM4MVpmYTJjOEszT2t2YXd1QlRWVWlHYnRa?=
 =?utf-8?B?M3lqSFZ3bllFeE4zZDdweGNHNXN1SGdsUkhUQzF4VGh4aWh2dEc0dzd4MDBE?=
 =?utf-8?B?a0crMm92c3k1OTh3cjdsN3pvM1BtQlgzUkd3SzlMWC9KakhKU3A1eisxKzYr?=
 =?utf-8?B?aTAwdSsxZDRGK3k5MkhoOUJOSHF1cVdJcU5OZG1OazdYM2ZLRkZOSUZvdkJ3?=
 =?utf-8?B?RFIwY2ZTeUNSNG10Z3BmZFJaK3ZaTkU0VXdTMjIvZzBSa3UyZk5ROW1tZ2tT?=
 =?utf-8?B?ZmFZT0pCdnF3bmxWUFJ0Y2Y0UUNoeUJyalZ2ckJyVGtnSXVJVmhBZG95ZGlK?=
 =?utf-8?B?aWl1SHQ1R1kyR2pnZFVVL29IcmtuMFE3TVhKWE5FTGl2aElmRWpycU1CbGtp?=
 =?utf-8?B?SldUd2U2UHhFR0JiN254dW5Bc3RFUDVDSnprN3FML1BOQkhBSVhNeWZxZkVl?=
 =?utf-8?B?bWU5MlVzOGdzMkoyZkxFbUNOZW9aVGxzUmRpTzgwSGlzRU96SWZjcXBVK3g0?=
 =?utf-8?B?M3A1UU9WbnNnbFNGWnpvT2x4SURyN0JkeXJzOEE3VVZjV0d5SStNZjNmOHp0?=
 =?utf-8?B?MSthUDJwTG5pK2hySUh2VFBLTFEyTHlXQTJobFJmV2o3b3lCL2dTcjU0M3lz?=
 =?utf-8?B?NnZVWmkzcGZxZlZURUFmQmw0NGk5WDRjY3VYamorcVRoV0hZRDFINzQ1UmUx?=
 =?utf-8?B?c0Y3ZXQ3ZGZFbmRic3ZzQ1Bsd3ZRbU1rTlFuYmt4cW1kWnVJWmpreTlFbjkw?=
 =?utf-8?B?L056TGxkQ2I4V3dWTWxEODNJMWdHdlowQXJXWE16S0VMY01jcUJoNitRSXJx?=
 =?utf-8?B?dU5hU0t1eHpvZEdUZXlOOWUyNFFGMGRXOG9IdnZkWk1qemtuaU9weDdtWUNQ?=
 =?utf-8?B?MHhkZDVKQlVTMlpWbEJWdHlKTFZJakdRUy92MjVoajVoQ253Z1NLdjBhdngw?=
 =?utf-8?B?bTdpblExMWJjL2UvcDdydWxJNUQyanUxV0d3b09WNkFtWWNyWHM0bE03b0JQ?=
 =?utf-8?B?YXdKSzBBdWtsM1d3U2c1Y005ZTVqODc2bi9XRE9ldkRUUVBWT1VjMlFDNUdU?=
 =?utf-8?B?a2R1UWQvaU9nZ1MrUTRWZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7821.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VmdiRmhuSnJCZk1Pby9GQlZDWFJrUUJ4Z0R1OFFDeThQb2ZaR1hSSEFwdlNX?=
 =?utf-8?B?dnNRd0ZoOVB3eENTaGFtQWNtYXpvcmNuUWVOdTJMMmtlcmsyUEVac1hSaDk1?=
 =?utf-8?B?WGtBYko1aUZJOVQxb0szYTg4MDhWVDZIZXYxMVlhdTB1bTdFdVNYY2huZFB5?=
 =?utf-8?B?SDk5QWRoRS8xSjRaNkltakd0RnVmV2lVNTlpVW5LT3htWVVwbVM3MGVhaTk5?=
 =?utf-8?B?ZGljQ1Ewem1BQ3NHTWd4ZjVZcjVZblMvcllGK3ZXbldiajlXR21nU0N6VVlm?=
 =?utf-8?B?VGx1NndvdUh6RkpYbkZVamUraGFLcUZRakhBTTdvYjVmcDVIYTVuck15TUUw?=
 =?utf-8?B?OXRVWExkYW9SR3ZveTRjenp0QlRoVFNyWTE2YzlzSnAxdFJGLzZpb0V3VzJs?=
 =?utf-8?B?RnlHVWxsc1dyYThMRXRrcWdXQ2NCS0t3RkxkSkpNUURjUm5XTEluZXQ3MDlX?=
 =?utf-8?B?cmJQOTNUTW4zQ0dWN0RVT2t6c1ZmcFhRZWZxQU1PSXdmaVZ6OER3S2dKQVVo?=
 =?utf-8?B?MlVBcGsyb3NpYmlQcHBCcnFHUTR6dC9tNUVUT25Ib09VLzg3b3JNRVBFTUlp?=
 =?utf-8?B?N0ZTcy85Zi8yQzkzTW1jWU5HNldOZzRMUHEyU0V2ajM3QkZKY1FQdVNodFVt?=
 =?utf-8?B?WXN1eHFGQmpmVHRrQnJ2ODd2YWRlL25kVkJuaDlpa1BBREp4S2xqQnN5d0Ur?=
 =?utf-8?B?S3dCd0hZdnFLbld1U3Y0MEhKVEFhZVN4TU9oRDRqMEF2WldjbEdBNnZsYWRT?=
 =?utf-8?B?MEZjdStpVTFOODdpamQraHl5YlZHOEhURDEvZys3dUV2VFpIMWtxTEJVVjNj?=
 =?utf-8?B?Vm9GWGNWeVdRbXFBTm1PTkFHV0hhVldFWVBQS1NPY3RLRmVBaFBwbmZkQ2tE?=
 =?utf-8?B?aksrY2pJV0lBczdEY1E0QTFoVEd4TDcxbHBYWENEaWYyY1lmUWxGcFJaNkJ3?=
 =?utf-8?B?UGdVZWZJeWlMQkRRaE8ydVhjQ0VodENrVkZaRTA4dzMwN2xZSkRzb3ZvRlNo?=
 =?utf-8?B?dWY0T2k0ZHg0cHZla09CcWkyOUxiL3lLOUp4THNYdXZ6dmRJdFQ3UzVHZ294?=
 =?utf-8?B?TVQvZ2dNTFpZRVh0ZUJkRnRhbDUrZStuZFh3UzlNT09XaTViTFpkZ3dzVE54?=
 =?utf-8?B?U3pvZzNURWl6czBLY2xHR0NYeTBQangvcnZsSEVrYWF0TVhEZUJYdXRubzRM?=
 =?utf-8?B?WVR4TG9mYzc0b3JsN3AvNGtlM1Fpamw3aUZzS0k1ckZWVnhIZE1TZFVlcDZJ?=
 =?utf-8?B?c1RyK3VvY2g0Mm1EbklSekF0aURiWEp6aGtPUXJuNytSZElXKzhpdW1JTkVF?=
 =?utf-8?B?TXhBV2V3VitZV3B5OW05K2ZUZ1ZEUGVScWdnNXZpYk1HeXpKUkRUQTZaTEdP?=
 =?utf-8?B?a1F1Rjg1TEp4alZFdlhOUG5ZbEUrUjlZcjY3dmZUaWxDMzBUd2s4U3NwMTQ4?=
 =?utf-8?B?NHRpek9xY3R5V3NsdyswZVJYSG1LclcxWGlHNjFlaEVHTjRBVG5aS3lzbUxv?=
 =?utf-8?B?UVdocDRzNE5ZUWR1QUZHSG9DenZ1QlQvell5MlF1SXg3RHFUUTV2RUZCbXV1?=
 =?utf-8?B?dlZxZVVWek5MTk5GMVhYM3ZNS29ENjdoWnVDbVJhNjBjS0xqbTlVZ3hHWnR3?=
 =?utf-8?B?SHcrY2Q4WmZYQ0lTN2pyQVJuT24wUkk5NURFQVFMdHFSK2NNZXQ5cWNsUlRF?=
 =?utf-8?B?c3hDajJONExQT2tQNlUwV0hwcTFTL0cvdGVEL2QvWS9GQXc0bWFyUkxqZnVG?=
 =?utf-8?B?SzhKUERZaWNMY1hIRklYanJHMkRiSzEvMDlsdk1HeE5jUzA0SEM5a3IybHU5?=
 =?utf-8?B?bHVIazZ4SGhTWFR0bk1UV2FlTWp0dmZHT0xzSGwyd3FqM085K0RwVDRUSlhr?=
 =?utf-8?B?Z1FxYzR0R3NOWkp2YW1idVc2dnJ2bGVqTzFHTDlSem55NHhIaUl1dGRyaC9X?=
 =?utf-8?B?UGpwRSszZFc5eVFUWkxYcFB1UVV4VElXbWw2SHFnRVQ0R0s2QzdwaHBTRUlD?=
 =?utf-8?B?UlZEalBMOVZ6dEZiZElGQkZrRllWYkRUc0dNVHJFY2drM3lnaS9ndzhOcEtm?=
 =?utf-8?B?bzloQmw4cnlIUkFKNEx6dmxoRkZHOWU2cjRWYWRhZVFqL1JKMGlPaFNOUVlZ?=
 =?utf-8?B?dHEzd0V3Ykx5SmVCK3NOQ2V4VnVUa1l4K0JVRlZSc3BVcm1XSHI1dkliMlV4?=
 =?utf-8?B?U0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 64fbb000-4b2a-48cf-6a29-08dcc3d43a32
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7821.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2024 00:32:25.7339 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9NJAIGWezRMRFRNbp/5ser3aEQj9ABSF/iuTE3I+SApIL/se4QVc/de1ue1zPDnPq+y8YkAehKEe+ajTAqOV0gnEGalZAp7Mv7e8rmayyXo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7524
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

Reviewed-by: Julia Filipchuk <julia.filipchuk@intel.com>

On 8/13/2024 4:11 PM, Daniele Ceraolo Spurio wrote:
> The GSC compatibility version number is reset for each new platform. To
> indicate this, the version includes a number that identifies the
> platform (102 = MTL, 104 = LNL); this matches what happens for the
> release version, where the major number also identifies a platform.
> 
> To make it clearer in our logs that the compatibility version is
> specific to the platform, it is useful to include this platform number.
> However, given that our binary names already include the platform, it is
> not necessary to add this extra number there.
> 
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gsc.c   |  7 ++++---
>  drivers/gpu/drm/xe/xe_uc_fw.c | 13 +++++++++----
>  2 files changed, 13 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c
> index 85a6a65063c4..0217e05feb70 100644
> --- a/drivers/gpu/drm/xe/xe_gsc.c
> +++ b/drivers/gpu/drm/xe/xe_gsc.c
> @@ -165,10 +165,11 @@ static int query_compatibility_version(struct xe_gsc *gsc)
>  		return err;
>  	}
>  
> -	compat->major = version_query_rd(xe, &bo->vmap, rd_offset, compat_major);
> -	compat->minor = version_query_rd(xe, &bo->vmap, rd_offset, compat_minor);
> +	compat->major = version_query_rd(xe, &bo->vmap, rd_offset, proj_major);
> +	compat->minor = version_query_rd(xe, &bo->vmap, rd_offset, compat_major);
> +	compat->patch = version_query_rd(xe, &bo->vmap, rd_offset, compat_minor);
>  
> -	xe_gt_info(gt, "found GSC cv%u.%u\n", compat->major, compat->minor);
> +	xe_gt_info(gt, "found GSC cv%u.%u.%u\n", compat->major, compat->minor, compat->patch);
>  
>  out_bo:
>  	xe_bo_unpin_map_no_vm(bo);
> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
> index 41c4ac6ba42a..84956bdf635e 100644
> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
> @@ -130,8 +130,8 @@ struct fw_blobs_by_type {
>  
>  /* for the GSC FW we match the compatibility version and not the release one */
>  #define XE_GSC_FIRMWARE_DEFS(fw_def, major_ver)		\
> -	fw_def(LUNARLAKE,	major_ver(xe,	gsc,	lnl,	1, 0, 0)) \
> -	fw_def(METEORLAKE,	major_ver(i915,	gsc,	mtl,	1, 0, 0))
> +	fw_def(LUNARLAKE,	major_ver(xe,	gsc,	lnl,	104, 1, 0)) \
> +	fw_def(METEORLAKE,	major_ver(i915,	gsc,	mtl,	102, 1, 0))
>  
>  #define MAKE_FW_PATH(dir__, uc__, shortname__, version__)			\
>  	__stringify(dir__) "/" __stringify(shortname__) "_" __stringify(uc__) version__ ".bin"
> @@ -142,6 +142,8 @@ struct fw_blobs_by_type {
>  	MAKE_FW_PATH(dir_, uc_, shortname_, "_" __stringify(a))
>  #define fw_filename_no_ver(dir_, uc_, shortname_)				\
>  	MAKE_FW_PATH(dir_, uc_, shortname_, "")
> +#define fw_filename_gsc(dir_, uc_, shortname_, a, b, c)				\
> +	MAKE_FW_PATH(dir_, uc_, shortname_, "_" __stringify(b))
>  
>  #define uc_fw_entry_mmp_ver(dir_, uc_, shortname_, a, b, c)			\
>  	{ fw_filename_mmp_ver(dir_, uc_, shortname_, a, b, c),			\
> @@ -152,6 +154,9 @@ struct fw_blobs_by_type {
>  #define uc_fw_entry_no_ver(dir_, uc_, shortname_)				\
>  	{ fw_filename_no_ver(dir_, uc_, shortname_),				\
>  	  0, 0 }
> +#define uc_fw_entry_gsc(dir_, uc_, shortname_, a, b, c)				\
> +	{ fw_filename_gsc(dir_, uc_, shortname_, a, b, c),			\
> +	  a, b, c }
>  
>  /* All blobs need to be declared via MODULE_FIRMWARE() */
>  #define XE_UC_MODULE_FIRMWARE(platform__, fw_filename)				\
> @@ -167,7 +172,7 @@ XE_GUC_FIRMWARE_DEFS(XE_UC_MODULE_FIRMWARE,
>  		     fw_filename_mmp_ver, fw_filename_major_ver)
>  XE_HUC_FIRMWARE_DEFS(XE_UC_MODULE_FIRMWARE,
>  		     fw_filename_mmp_ver, fw_filename_no_ver)
> -XE_GSC_FIRMWARE_DEFS(XE_UC_MODULE_FIRMWARE, fw_filename_major_ver)
> +XE_GSC_FIRMWARE_DEFS(XE_UC_MODULE_FIRMWARE, fw_filename_gsc)
>  
>  static struct xe_gt *
>  __uc_fw_to_gt(struct xe_uc_fw *uc_fw, enum xe_uc_fw_type type)
> @@ -210,7 +215,7 @@ uc_fw_auto_select(struct xe_device *xe, struct xe_uc_fw *uc_fw)
>  				     uc_fw_entry_no_ver)
>  	};
>  	static const struct uc_fw_entry entries_gsc[] = {
> -		XE_GSC_FIRMWARE_DEFS(XE_UC_FW_ENTRY, uc_fw_entry_major_ver)
> +		XE_GSC_FIRMWARE_DEFS(XE_UC_FW_ENTRY, uc_fw_entry_gsc)
>  	};
>  	static const struct fw_blobs_by_type blobs_all[XE_UC_FW_NUM_TYPES] = {
>  		[XE_UC_FW_TYPE_GUC] = { entries_guc, ARRAY_SIZE(entries_guc) },

