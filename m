Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B426606A31B
	for <intel-xe@archiver.kernel.org>; Mon, 26 Oct 2026 10:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MXpA5DW4
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49E8C10EDA7;
	Mon, 26 Oct 2026 10:19:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6A5A10EDA2;
 Mon, 26 Oct 2026 10:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793009940; x=1824545940;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=9tMpmj4eAx16Jn6+SLCzKuvfVeOweMElzjjZ+NMwjB0=;
 b=MXpA5DW4QC2ZxKt2dJ6CFxCIf+fBdZk0BEr+RnbukcjP+CeC4XYXbhVs
 fVGX/+FuNMx8OhDfBmms9Opv+BSm2xjgoh/QqFbGs7rjQZ3uuQ5/eQeDl
 1fvUfqn3sONP0u9Bq9Nwau2k06HNXaednpIfSiVxNgd8Sb8yomnleqWaW
 V1gLSG9Ws+mM9VyGFpM9RM4jClafhReEhi/24nMslbxZ1bRHLLNNLf6Jl
 AWO3y4as28cnxBx4mLmBZ6iu1ZyrzMDGFxtQZZ/Ct9ko2JvjwsOtxqr89
 ey9HWNmkT7DygZYJmSJ2GVMA3a6TkxfmAsTwH23WjIItv+b4s8bMo8i73 Q==;
X-CSE-ConnectionGUID: fLVEHeZbQBmvZRROcpHCmg==
X-CSE-MsgGUID: Dznh0LoVTv2UH1YRfLkioA==
X-IronPort-AV: E=McAfee;i="6800,10657,11946"; a="1573233"
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="1573233"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2026 03:18:59 -0700
X-CSE-ConnectionGUID: P7jBGFHjTrSRJM10kB1XUg==
X-CSE-MsgGUID: /Erp2yk4RgWQu8iqvI+n6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="4621233"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2026 03:18:59 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 26 Oct 2026 03:18:59 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Mon, 26 Oct 2026 03:18:59 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.11) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 26 Oct 2026 03:18:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hW1ALmyBH94qeGEr7hXORiC9OtTO+LBFUh7u3BRMKxld4O09xrV6T4DNXFmDJQymQjlXgCY8ZjxKuJt4e8Lgm5QhL0wAwTplanPQXsAUQ4b9X90SKrEFMDKdZD+YvUEWp+M+rdmV+fOTyAQ8uFSQlTniEncum5kiZCSTa+bCSyfRT3K2qxZGs/cIocZzLDHgmVKWldkrq/G5QEmmNUtfYJz78BrzYaBB3UZk0i0izHEr25MqaxIJ1mvRAdYLtgEKYS4Y3hbz9HdnALu92LIYAz4B6w4czYRLUs5QnnTMy9M7Ag/UaFz9dPder9xDqh3QV94bgG/JHPnnIgdC2pB+bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E4UPBT9wS0pJuuopFB3UncRdrdao84OkceJQUY6Wu3A=;
 b=RmaSY/MEQnfcvz/jeob2lBopkgBnCGckqiTf8QDhrgIPwSVz7qno8n+YReHSCSxCiVzke8oZaUZ6BtowWjngtV5yTgbf4qs0Z+1f9eNZ8c3pu//tqQhsBYHIIMgdRr6mi8xVf65YiZjKCq/ipQ24eE5vounI6mXfjNIBypCPxhdr33UbYwka2IuAQMYIwW09nLeslcTVsQvoe1qmlYjT7QyvMu9isFRQhsY4zEXzTLwX6p8mhd0ZRZZQgdbTyoiGCBBWkOidr5QyKFU4rOkmdTjKogo/12y8o9eUxH0mIKmGPlz0FUYk5zKayCmMk8OYXfvZwJ4HNn68n6FUYzQwsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6440.namprd11.prod.outlook.com (2603:10b6:930:33::9)
 by PH8PR11MB7022.namprd11.prod.outlook.com (2603:10b6:510:222::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Mon, 26 Oct
 2026 10:18:57 +0000
Received: from CY5PR11MB6440.namprd11.prod.outlook.com
 ([fe80::90ea:c216:8cc7:3757]) by CY5PR11MB6440.namprd11.prod.outlook.com
 ([fe80::90ea:c216:8cc7:3757%6]) with mapi id 15.21.0546.021; Mon, 26 Oct 2026
 10:18:56 +0000
Message-ID: <3445c79e-105b-4092-b897-deb0d2e7f85d@intel.com>
Date: Mon, 26 Oct 2026 15:48:45 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/1] drm/i915/cmtg: Disable CMTG after encoder disable
 in hsw_crtc_disable()
To: Animesh Manna <animesh.manna@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>
CC: <jani.nikula@intel.com>, <uma.shankar@intel.com>
References: <20261026082906.802048-1-animesh.manna@intel.com>
 <20261026082906.802048-2-animesh.manna@intel.com>
Content-Language: en-US
From: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
In-Reply-To: <20261026082906.802048-2-animesh.manna@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0228.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b4::7) To CY5PR11MB6440.namprd11.prod.outlook.com
 (2603:10b6:930:33::9)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6440:EE_|PH8PR11MB7022:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e42f2fb-d93f-49b9-c044-08df334a8af5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|23010399003|366016|18002099003|6133799003|22082099003|56012099006|4143699003|11063799006|261022075727099003|261021123027099003|10067099003|261009223027099003|261021121427099003|261022105027099003;
X-Microsoft-Antispam-Message-Info: v9hn2ROwu5G8PQtFvT8nWnNbhmMatBVyRYiJDoIY0jZBj4vtCH+cZa/sl8eXvQUyxUl92gbd3hCFCXbzwQzPF8z3yfhq7f2gn0BvZr/X2MOgrhthx7TAd2K0ZmzCnVa4OWMR4bVO2dQ3EzV+HYhOLgL42IzV+zlyzaTqmNdTnaqozM7WFkS3hAIb7WSYMQMFt6zpoejQGaMgzlPje2lScRs07r6BFA9SJLkerbX+kMvulYgNW674BFYhrvz8IYnJ2YRvVb+Zijq07+We/q4DjY63iVlfafsYk9bybTNUoKxfhqjoLNNM7xM/+Fyc79TKV5E0+ofaJsybgAbP6as9ZU1YtCAC+R03eQXxnINRH/ZR3WZp7nggEaJlgIaFFDgB3QliS4MylkdGGPqI+2LPrHJ2gcNqy3tQBhPvXaMFqG+fXBUTyXOOOs1XP3ub1gRy1Sl9LMrL8GHBeLEagZCwy9g3wKm0QLq9LRDzxfyG4nR9VlH6926RIMrmmEl3ZurZBuOkKZfsTy9lE/7oSTlPLKp9uide6JatP5Bix7R8OFttTK0ETCKzYOgdw4U9FQfDCJbhUv1jZ5bOHv5QmJLmCTXq5+6SBlh7S9LV5qJBTTSfW++4GdIwQazQboeXqFEYd9ag+U7St2dBRQ/NcCLodUIxlIQxHIuW/QtAgMQKQRY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6440.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(18002099003)(6133799003)(22082099003)(56012099006)(4143699003)(11063799006)(261022075727099003)(261021123027099003)(10067099003)(261009223027099003)(261021121427099003)(261022105027099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V3IreWpSdUd3T2RiRjdTS09BRVh4ZENOenBwZVZrejdsNmZWaTdVV1VseU1M?=
 =?utf-8?B?Q25maUNmeVV0OFFTWE9tUlFsZlBycEVqcnkremd2Tm9qSHB5ZzZGMmNGY0ZR?=
 =?utf-8?B?eVBaaGw5Ynp5Q3VsQ0E0dXJSamJBQ0dTYXlBWTlVUWJxdzVaeC9yR2UvZDdu?=
 =?utf-8?B?cDZ3N0pKbGd1SnBEdmJOWTVmOFpRZjNJYlBqR3o5S3k2dXY0Z3dhWHQrb2VC?=
 =?utf-8?B?b3Fyd1h2b3J5a1hRQ3VCUE9qUStESUdHdERJTkRmeVNsSFNSRWdhVms5RTZS?=
 =?utf-8?B?U05UWFVDR3Vxekt5SG5uVjE3ZUJaUEQyRWdZVXhlNys4UDJEeGQ2TU1mZVdP?=
 =?utf-8?B?VW9YOEF4OGw3b0EzaEUvR3J2SUxPdUlLTk5zTWtMNzN1b3NvbUcwM080NEZW?=
 =?utf-8?B?ZXVMbitBem4xVHNkZWFNMm1jb2I4ZldPMlhoeWh2d3djVStKd2YxUGRoS1NE?=
 =?utf-8?B?b01wLzMzVEt3ckpNSlB2VG9DSFZZeUljS1d0b3EwdmtzenFFU0d5UThCazdN?=
 =?utf-8?B?NTVhVndPeERLd1QvVFQ0ZjdMN0VEdm5RUXpvSk85Y1IrMnA2disrQ2FnU3Ur?=
 =?utf-8?B?ZFlQaVlqUU1QZzVQRFNvazJYK05iUUQxd0xZLzl2UjRLWVhMTmJKRHVqbWNF?=
 =?utf-8?B?d1M1YTd5Mi9vL0hYVjNkZitvMDBHTGRWUS9KMzViOHVpRUtpOFNxVmVaQ3F6?=
 =?utf-8?B?TFE0azcwRFJ1MGtnUG9iaTNJaXoyZGVVODZkLzZ5MzRsNzdKV00xbTl5VWdN?=
 =?utf-8?B?OE1OS1p5RHl3M20vc243eVoyZVhUYkVQcDRHbW9ORFozQmxqVDlJUkJBKzBk?=
 =?utf-8?B?VER0dEUrS214S3FEbEx5ZjVGZEZjU0lRYm9UcVNQKzdEenF5NWYwMUhjbTJH?=
 =?utf-8?B?WDlFdXVzN0JjRG9IMDdFckFKRmtENW5NRVU1NitCc2c3dnNIUjBrVWNlM2Jr?=
 =?utf-8?B?Z1FUd2MyK2xVbDRqL05PWnM0RHhWZ2ZuT2QxNzY3UEZnakxQbklKakVtRFJX?=
 =?utf-8?B?cDJWVW5KU3o1MnNOUnBDQ2d3YUNaUEE0Z0I3dXpHOWx3RXJ4Mm9JYUFmaWFq?=
 =?utf-8?B?U1RCa0hrdmk0TExtSFJScXVJbHRDdElpVC9MMlFoQWlYalNkZmZaN1RGR3Vv?=
 =?utf-8?B?Q2t4NkFqOWxmbTdxNGd0T1V1WkFqWmUwVTAzSUxDbkZHTlEzMTFzbUZJUzF5?=
 =?utf-8?B?UTAxNGFTQVFnZnd0STlTUm5qaDBNU0ZhNy9sZlp6KzZpOGFVSXBpYWxKZU52?=
 =?utf-8?B?V01pWlJpNXNqMGRocFUwcDE1RGRMYjlqcUJtWkcvZkVaZVJ1aHk5Yi9ZTk1B?=
 =?utf-8?B?b2JHZnY3dW0yaHNVMGNkeG1MRmIvWXBYR1dxSlExZGZtRlphbVlHVEJDckRm?=
 =?utf-8?B?cnpsTFhrSnUyRk44UnB6Q0Q1RzJ1T0dBVnNZWjdqeG9sOUxrUWg5WlNhZmpT?=
 =?utf-8?B?SHgyWFZXOHFWcDVrV24rSnBaY0NMK2F1MkFUbEZZZzRsdmNmYVB0UG8wVmor?=
 =?utf-8?B?WUZhQnpXMWRZMnZaazEzK2pzNFlZVm5CQkdzWk1ZbmQyVjBVV1M0cnNzU2tO?=
 =?utf-8?B?S2d5M2NTWi9WS1d6MDBGZTU5VGdjdjNKMVhJS0tTRGRSQVV4WUJGSFhSL0VI?=
 =?utf-8?B?UHp5TFZVSGxVcVBVcFU1Y0ZVR2NNNjZ5YTkyQVM3aTQyQkx5MEhtOFdEMklU?=
 =?utf-8?B?dHhrVFloNDlTbVluMkVrcjdpVXl1Q1JOU0l6MThTNWdOQzAwS2F1SThuQ3Bz?=
 =?utf-8?B?M1JCREYzK1VHL2xRUlV6VEhmTnpZckk4UzhvV2Y5b3JXYVl3czYrOFl3aS8w?=
 =?utf-8?B?TTcxbGFUelRvWUIrMVdHZzJITHFUY1ZHRjNZYSs0MUQ5dU5rUHJKM1Z2U2pn?=
 =?utf-8?B?Q0dmY3BoUGJiNzBoS29QWlRuKzZxMlhXeGZLampBZHJRckI3MTFtVjMySU9y?=
 =?utf-8?B?YUdvZmp3Nk9hSkxCUkswajZWVmFIakVtRkdoemtaU2dlZmFrUHdSdnpVdWpC?=
 =?utf-8?B?Zk5BQWxDUEpJTEJYY2pWNVA0dFNvVmlPaDZKU3M1ZXdQLzJZRmhFUDlNeHJz?=
 =?utf-8?B?SzZJcHRDck9NOTFUekV0eU9lazlHUTVXTEhaeHNzamtrZkJKUkdyVjUwNTZC?=
 =?utf-8?B?VFhDOHEzSENhbEoyWEtQakl4RFhvVG9FOWovS3gxNDdQQjR0WkdKM3hZTEJr?=
 =?utf-8?B?MC9XbnJJOHM0ZnZ5Ym85YUFZTXpMREhTQTV1QzB0UlQ5RE4rSmJFMnU2cThP?=
 =?utf-8?B?RjFYQ3FZOU1kWVdOZlZPTVhFRkEvNCtRK2w2UHpMVS9HUHJGaWRGb0hrYWpV?=
 =?utf-8?B?R1pMaDB6NlU3YS9sZlZuVmxCN21DTEwvNGovdjFBSERRY1N0Ym4xcHM5Yy9j?=
 =?utf-8?Q?mqe4fbhMOFnTIRh6kr+AA45ESvlvsPDNGWRqwShKNFO/B?=
X-MS-Exchange-AntiSpam-MessageData-1: ux1ywqsw5ZyXcw==
X-Exchange-RoutingPolicyChecked: Xnx8rV6gB/cTMDurFEdOopI0ZifH+adkLhPEu59IV+EDpdrYyon4I72vmrKF2YzOUbf5B6Vk+7DHLzqpXhx2wiJBjxbAiXa+021tsxTDg8UJMaSBbcNzBZck9xCPa81X19a3JdHag0ef79bqZeKwHvfnEU/0Qm/KSvnxuSs4bUMe+z39WSaJRo1Rljst8bQY85ZvXA9tKPVDm6tTZ7dXiZ7nqakAV65eTyrC2BhjyxcdOZ+ZofL5fGCYtuiost73Tog5uiGYfN4zr875B7LDjnJqV6btvnG+aJH5+Yclm1q0qogfjE7oUe+jnoaijFq0M1+yNbU45c1i71UewhG8Hw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e42f2fb-d93f-49b9-c044-08df334a8af5
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6440.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2026 10:18:56.5126 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2iuf1vnzRr1v2I1OxD1CoPGsRU8VsA+yLewNEBQXK88tKlCItWy9D+UwZm5TncCgC9aL9vqKClnXtipLmv0DgjwmcURiX7YxE1icXGdkikE4ELYASghviWK8YxKwzuem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7022
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/26/2026 1:58 PM, Animesh Manna wrote:
> hsw_crtc_disable() disables CMTG at the very start of the CRTC disable
> sequence, before intel_encoders_disable(). With this ordering, the wait
> for CMTG_STATE to clear after CMTG_ENABLE is cleared intermittently
> times out:
>
>    xe 0000:00:02.0: [drm] CMTG: A disable timeout
>    WARNING: drivers/gpu/drm/i915/display/intel_cmtg.c:205 intel_cmtg_disable+0x331/0x3d0 [xe]
>
> This is seen with igt@kms_hdr@bpc-switch-suspend, which repeatedly
> disables and re-enables the eDP across modesets and suspend/resume.
>
> Move the CMTG disable after intel_encoders_disable(), so the eDP-side
> teardown (panel unprepare, ALPM disable, backlight off) has completed,
> but keep it before intel_encoders_post_disable() and
> intel_dpll_disable(). The transcoder timing generator, DDI buffer and
> port PLL are therefore still running while CMTG_STATE is polled, and
> the requirement to disable CMTG before the transcoder and the port PLL
> feeding it are turned off is preserved.
>
> v2:
> - Modify commit description regarding PSR exit. [Dibin]
> - Add fixes tag. [Jani, Dibin]
> v3:
> - Add a cover letter with links to v1 and v2 for the review
>    history. [Dibin]
>
> Fixes: c588a324183b ("drm/i915/cmtg: Add trigger to enable/disable cmtg")
> Signed-off-by: Animesh Manna <animesh.manna@intel.com>
> ---
>   drivers/gpu/drm/i915/display/intel_display.c | 15 +++++++++++----
>   1 file changed, 11 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
> index afe70e9ce347..5e40487e9ab0 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -1854,15 +1854,22 @@ static void hsw_crtc_disable(struct intel_atomic_state *state,
>   		intel_atomic_get_old_crtc_state(state, crtc);
>   	struct intel_crtc *pipe_crtc;
>   
> -	if (crtc->cmtg.enabled && intel_cmtg_is_allowed(old_crtc_state)) {
> -		intel_cmtg_set_clk_select(old_crtc_state);
> -		intel_cmtg_disable(old_crtc_state);
> -	}
>   	/*
>   	 * FIXME collapse everything to one hook.
>   	 * Need care with mst->ddi interactions.
>   	 */
>   	intel_encoders_disable(state, crtc);
> +
> +	/*
> +	 * Disable CMTG after the encoders are disabled, but before the
> +	 * transcoder and port PLL are torn down in
> +	 * intel_encoders_post_disable()/intel_dpll_disable().
> +	 */
> +	if (crtc->cmtg.enabled && intel_cmtg_is_allowed(old_crtc_state)) {
> +		intel_cmtg_set_clk_select(old_crtc_state);
> +		intel_cmtg_disable(old_crtc_state);
> +	}
> +
>   	intel_encoders_post_disable(state, crtc);
>   
>   	intel_dpll_disable(old_crtc_state);

Changes look good to me.
Reviewed-by: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>

