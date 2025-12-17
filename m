Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E29CD65549
	for <intel-xe@archiver.kernel.org>; Wed, 17 Dec 2025 11:06:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D1D610E1B9;
	Wed, 17 Dec 2025 11:06:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IKdyb/sh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F41F10E1B9
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Dec 2025 11:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765969610; x=1797505610;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=jYkh9BJJXvM6A/0n0iZas5pGBnwNnanG3kI9l2hnP0Y=;
 b=IKdyb/shWhfE8PIB8qkYYE9tjwK6PT/RSk69wz27Hhwwk+lQooOUf+Ux
 83pyNEsu54w8OQDby2NFYtEbroa5iXcAR8Y/3Iyjc0jIX+KMgvTjyiz5/
 d0R2ky6YJnrrteGOOWn6/BDBaWZnCmpxgIBiLM5ng+u+mdoXYnU0woUwU
 y/FJbGZd0LAE5D5KT/GVXJTDYKRIFG1SqJUmhSW8fQSlAaroPVYZeXn4A
 wkYMKr2FN0KTmA/uy2hJBcKYK8E/vO+E2CRp46LyikzvsleKCCQEQNVHA
 yVxwjqILLdaO1BOIIGbKBgr7xTE9Iiv2FKd5hm/vPoVr4k5vCipYVAGyA Q==;
X-CSE-ConnectionGUID: a6GHkLUrRY27hkJmEG/qrw==
X-CSE-MsgGUID: /Odn+3TPQDWN3vZrvTBt8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="71762022"
X-IronPort-AV: E=Sophos;i="6.21,155,1763452800"; d="scan'208";a="71762022"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2025 03:06:50 -0800
X-CSE-ConnectionGUID: 25hhR4oHTSSqQLd3nAszsg==
X-CSE-MsgGUID: wVJMszEuSEmPACJXV0iKTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,155,1763452800"; d="scan'208";a="202785126"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2025 03:06:49 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 17 Dec 2025 03:06:49 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 17 Dec 2025 03:06:49 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.14) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 17 Dec 2025 03:06:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lq1gb3D4gm9/M53hTtFjfg6C2RyQ+84q/LksNaxS0u4CVBTf6DKmTcCm4OViYN95nZu7fruOHoFareizWN/kccf4uD7RGQrS8aYBajeV27C+pf9v3zm4wJ2J5djlj2qr3dyc/5ObMLxeRgWAvWf8Q0SGcJvB3WcMCrDgPnE38GMkrvdo5KyVuMR4g1ZyadSdrcUrDtSGLqRORb3nEfPIfCa5/bIg+PbYdr5z/UB5s9so/neithXIfv6hrlGZ9a7YpCet0INAnusgZmpVVnACc2/JSdD8eRK0WqJ1WD+SPep8L6ZY2ZdiNKh6fTCUCwKuRh8NVkUY5y0/r787M5M0dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9LliSjmzVjhqwDNkCXzSR0M2WEFlivYW5Z7Fn2mYuq4=;
 b=gBnQqF4x282VaMvANoYort8TK0gHGz69GHYlDGadF9Mt+kTzQSNjOT01lmZNeyXNYihNlIFHFhCHfRHyIk3i0HRMP4HujhBTAVXZlvX7TMgUvbiitcsMgtyQPRLtHHjQyMI735PILr4s+Fkv0MsR2qSBe7iYBCLoRXWcBxkJXft0C/RlKYwerXIozywOW2J9JjpR8pOISa4XqV529TUk1Haehg6oUNCX5jHk4bgpB5GS07hTYjFv6e3RtNshZeKb9HTIAPYU1VwF+JqYCiIqnl5XxBGB+8KypxZIpFNYA/uJzUAye3cOv5ZayjD3l6dk3LngQrKZL8EBiDdh9JlnHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by MW4PR11MB6740.namprd11.prod.outlook.com (2603:10b6:303:209::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Wed, 17 Dec
 2025 11:06:39 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%4]) with mapi id 15.20.9412.011; Wed, 17 Dec 2025
 11:06:39 +0000
Message-ID: <fc3365ee-6956-4ddb-853f-9766b702fab7@intel.com>
Date: Wed, 17 Dec 2025 12:06:35 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] drm/xe: Add a wrapper for set/unset params
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20251217013702.3597539-1-vinay.belgaumkar@intel.com>
 <20251217013702.3597539-3-vinay.belgaumkar@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251217013702.3597539-3-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VE1PR08CA0001.eurprd08.prod.outlook.com
 (2603:10a6:803:104::14) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|MW4PR11MB6740:EE_
X-MS-Office365-Filtering-Correlation-Id: 1dce58b5-80fa-493d-f5aa-08de3d5c59cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RzFhLzlXZFVYTjBqL25rWmg4OW5GRW5ZMVNvMGR3R1Q4WnNKY012UHV2aHdY?=
 =?utf-8?B?c3o2TXN2R3dRdFkzVHhXeFZYczJKUzBPdTlpVVRMNGhoNHVQNkp2cy8wendX?=
 =?utf-8?B?N0JiREc3a3FaK21oSm1KVHJwSzIxRjJ1d3ZOYTI5dlRRRjhPQzZNTTc4Y1Vv?=
 =?utf-8?B?OUYzamk4Y3MySG5hWDltMVRzOW0rUlZNeFB2b3VvV1JFMGVCSk8xREsvNUpT?=
 =?utf-8?B?ZFV2UzFSU0VtM0NJajUwVXByQ29FWUh0TG9NSFRCM1Vjd0todnBlUDVkdmNX?=
 =?utf-8?B?ZE9HRk5jRnFFZzB0cTZkdzhpeTZ1bkRzajdxV1NBbXdvcVZKRGxpUXdZOGhO?=
 =?utf-8?B?MHc1REhJa1lMNU5hNkhhTlNLYjdaVGM2MEloMW1rSjcwUWhyZUw3MWp4R29o?=
 =?utf-8?B?Nk1NUE10VytuZ3RzUFBEN3dSVExzeWptYjk4RDY2WEh3cU9YNzR3ck1hL2ky?=
 =?utf-8?B?WlNkWjRydjRReUZjcDNaUHZUR093M2xoTnh6SzdCWFd6YlZ3N1FQSW43NHFH?=
 =?utf-8?B?eWZHaHdFNlMwT2R4dVJVdEx5amt6NTh1N0psUEhXdGFoN1NTUTFTODQ4UzB6?=
 =?utf-8?B?TTNqVjlkcjVseUUwZ21IRjNCUkpJWmsrbVZDYnA1d0NJVXZRSkJtZW5FVGJZ?=
 =?utf-8?B?MnI5MS9LSC9kOEJTa2t2K1BBT2t2Qlc3VXhYYU1jMTc2THFvZE0rYzVseU9T?=
 =?utf-8?B?cXJxUHNOSm5mdFE4UEtyMkFVZnNGN1B4WGg0Z1dJaUhMaG1iYTNBbXJ5TkRK?=
 =?utf-8?B?bGtndit5bHpWemZqYW9RVStIN1ZMeXhqNFBmaTBMWGhES0hOS3hBWFBpU1h2?=
 =?utf-8?B?N0RhSFZDV0pkd0ZyUmx1WnIrM2xka2oyVWZUcDdOeEw1WnlEeFA2YWhuNFNQ?=
 =?utf-8?B?dkZwUXM1QlBRODNzc0dYWk5jRENSdVd4Y0cybENhQndaWStQOG1kZWZFRlo3?=
 =?utf-8?B?N3FWOWV2d3pjeVJ3MUxQeFFWODdHMTA5L05PZ0RKZUJBQ2haQUF0MDZNVEdl?=
 =?utf-8?B?NHdzbGNzMUxveEJkeDc5c3Z2a3MrdndnYkdHaitWby9hb0N0WDZUR1hqcmhs?=
 =?utf-8?B?V2VFa3RKM3RNZTM2SElTZExzZ0Nzd3YvLy9INE85TVltbFRGbC9YRjJidmg1?=
 =?utf-8?B?ZktTTkJ5VnhKTkRRelhNV1JseHdueXV6MXc5cEd0RTUwR1BiWE5vSXpKUCtK?=
 =?utf-8?B?VzRvNXR0VVdHb3JhVGMrL2N3YXZ1TU9hZVREK1QrR0xxdW9FVGFpQWdSM2Ju?=
 =?utf-8?B?QjJKUmRkSTZEbURYV1N4UjM4M0xsZEt6cGROazMvbEpkNDlPa0dHZVRiNTdT?=
 =?utf-8?B?QlVoZDhmSUhnc0pxdG5zZ1RxNjM1bEVCZ0JWWURCUFJ3ZjRLbW5XejlPMmQ5?=
 =?utf-8?B?WFZQSEdKVzdxcW04YXdnQkRqL1M1U2dGUTZIVTBONzhEbEovd3N0MVppd1Ry?=
 =?utf-8?B?Sjh0TStQZWsyYkxZWHhLWDBZSmdmVTVIb0tsMzVwMHIyODQyQVd1Mm4yai9q?=
 =?utf-8?B?ZkRqTjhFUlVOd0k2S1lFWlF1bXV4SENVeEdEalNtWUtleXpkVlhqOVhPS2hp?=
 =?utf-8?B?b1lXR0hrSnh3ZXhoQ3h1RWk3aW9FeFB4RHhJeE45eWFub0RYWlpUdW5ZY0Z6?=
 =?utf-8?B?VVA3dHBlMlRLRVZrNzkvTi9sb0cxWnBwRkxndGgrb3VqZTA1dXNxc2pSdmcx?=
 =?utf-8?B?Z2pLLzhiV2l3ZHh0Q1I2N3NvdkxISlU0VjBwWEFuMzVjVTZsaXhremdWeTE0?=
 =?utf-8?B?d1h1M0trRWp4dTJ4NTFFeVFKWEpLL2FUZ0xxWWtpK3BCTDdmRmVIZUlYQTM1?=
 =?utf-8?B?K0NwUDJPVFlOdW44SzVjSzBIa2dDWC9LaEg1eUNQa2tLdGRVU2tycTFGM0Nl?=
 =?utf-8?B?eVJtOVRlNEoyZlRPb05hYkcranJzdWRHY3BUZHRNNWh1cFY5Z1ZuZFRQZzRq?=
 =?utf-8?Q?km4GIYRqMZLnuhlNa6XUS8hQ8q8HrOTa?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VVlYQ2ZzaDVOK2V4eVBYKzh1Y2RjT1ErOEZJOVl6TXBmWnlVODFLUkhXcTVi?=
 =?utf-8?B?RktZcXo1QzRnR2M1SFlyS0ZqRk55T3VBWnVudk1DQmYyYWJ2eWNGUXJPZkov?=
 =?utf-8?B?TSswQk5Vc3ZMKzY5TjB6Y3pvUE96UkE2VkhLbjZEeG1PYVZrcUNpdGVJSGd0?=
 =?utf-8?B?bFY2M0FXd3FPZm83ZmlIN2lEeGFqdmNYV3BpNEVSeXM1b1NWaHhQQzZ3MUk4?=
 =?utf-8?B?cWJQSmN3MTlXdHg4cGdrYm0wRkhMb2dZM3FaN0Q2VmVsTGlCT1JuZ1lLRThE?=
 =?utf-8?B?OC9nQXExMld3dGRQcSt3bWd1MkVDVVlibHcrdGVhMEx5NXo4a3BJTUp4N3pJ?=
 =?utf-8?B?SitQV3o2M0xjSnorRlNTWjhYUjNQa2lOeVVCOElTUkhOd2lqV2tPTElPbFlr?=
 =?utf-8?B?WEplZWx1MWlSZHU2M3Nic2RZRFF0R0lvTVljN1JYR1AzRHJMZVNnYVZlRlR4?=
 =?utf-8?B?VmNYYjljOEJJbytTVkVMaEE3b01WWGEvWFZhVGR1eURBUXIxVjRpb2lkOXc2?=
 =?utf-8?B?N01DMHpEenRna3F3NGE2REp4SWkxaW1rRjQxY1ZTL25iNDVGZWFkN2VON3hW?=
 =?utf-8?B?ZUdLRUIveE5rZktLREQ5TDdXK29XbXJvajVTajFZTWc0MWNEU3lQZXhNS3dV?=
 =?utf-8?B?ZEFORDRQUk0vSS9CalpCeEhraGFiMHpoZWZJL2lhc0VHUE5aS0RyRThudktM?=
 =?utf-8?B?VUQ0ekVGU3J1d3I0WlQzcjU3ZHVTaExXdHFiUTlQNUJnbFhuMklQUzBLL00z?=
 =?utf-8?B?UDB3eW9YMy95Z2hyS1pKekd6VlQ3K1FPWkxhdDlaUGZaYVp4aHp4UDNQNWFn?=
 =?utf-8?B?NWFqWmJGdmMyZ1BIc1lQcVBRM0t3L3pCZlJ6OU92M2lNUWpDSnVJY0JmYThx?=
 =?utf-8?B?RWU5VGQydlIxTnFDVEg2SUl6TE0xbzVXTXNoVmJraUVmTGU5aGVaVXFVQ0V3?=
 =?utf-8?B?WnRpNjAwRU94V2VUYllvSk9qRXZUZWJlc3N6aVN2N1kzMVNEbTNjQ3M1eG5M?=
 =?utf-8?B?YmNyamJuUEgrOHNLeElZbXhuYWNueEdjVXRvN0I0c292cVpMZ1R1MURSeEx3?=
 =?utf-8?B?MkR0V2xvVmdvUjFldFhJWDlMdDFtS2M5TCtRVyt3blVpcFh6OEdnczJRQ1Z6?=
 =?utf-8?B?d29Ya1gxUEFTUjlJaUVqNmd3WHNORk5IUU1hT1gzQVBCYTU5MDN4L0xEOWg5?=
 =?utf-8?B?WEtHY2NleW04T0dVK0NiYmpmZDBGVEVRZEM0Yy93T2ZwR2N3WklkUWZlaUNj?=
 =?utf-8?B?UkpDb3oydkdHbGk2OHgwekZHMnZnNjNVbWZHOEhzUk5oYzlDU0o0VUtQZE1L?=
 =?utf-8?B?K0RGbGFEZTBIWTltNFQ1SWdUZGNqVXVZQ1hEam4xOVZ0OStvK0RNREtYR1pL?=
 =?utf-8?B?b3RzNjkxelMwUWhMVEhZNS9YNFUvWHVNaVJMN0RjM3AvZ1pqQnBoOVV0WXRQ?=
 =?utf-8?B?em5iY1FOSEtvdFN0M0lvTnVKck15eVYyK3l1OWZWbnVYV0Z0Rk5BWjU2Tkti?=
 =?utf-8?B?UEViSG9GT2dxVG1BLzFWRW80QkJ5V3pQZXBjUEk5eXE4UnlUaUVpVFJQdUJP?=
 =?utf-8?B?Z3Q1cDhxeFRCVzMySXRicU1JSjNoSXg4aTRtNE5WcmRaTmZUL01VditRaFln?=
 =?utf-8?B?UkRIOFFiMktTRkFITWg5cnJvRDhmVURRWVpLZm1wUHRPSFRtYVE5MTdrczRL?=
 =?utf-8?B?SkZkdG83bGxVejVleTFDZnRSQlFLZUpaNTVyZ0l1Q3gwOUkvVjNTdkZqazdF?=
 =?utf-8?B?WFBqQ0k5dG0yZk9ubmNxZ3d1SFZ5UjRVMHFXR0xHZnJNbWIyZDM1ZnF3VHFo?=
 =?utf-8?B?Wk9nWHVGRW95Umc2enIxa0FiZm53VW5UOGw1b0M0cSt3ZU5LV1c0YWV5YlpI?=
 =?utf-8?B?djdKem1WbnlFTEUvUXNaVFFpYVJ1cXkrcDJkZWlVclBmRTU4REx4L3JWMUEz?=
 =?utf-8?B?YmhMWTRZb2g4WVRJS3Voczl1emNtTWpackp4ZyswZW5TQmlOZjlqU0dlZ1Fm?=
 =?utf-8?B?MFhmQUdrVk5scUxQSnFXL3B3Y29JNFFOM09tOGFkMXdlWjg3anVJeGVxNEhJ?=
 =?utf-8?B?MHc4ckVYODdEZ29lK0t4QXlGaFpLOU1mSnFhWEw1NWZOa05EN1VQL0FLR2xa?=
 =?utf-8?B?bjFlTXJYOVJkNms1Tkt1RkltS1I2VXBmczRqZUZDUTdVVEdLVUdpUEh0ZFky?=
 =?utf-8?B?aGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1dce58b5-80fa-493d-f5aa-08de3d5c59cf
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2025 11:06:38.8701 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9g9wdNM6lYyejWVO4lVcXSBcEudMRWNvY990vlRrOu0+TiisS0m/JaEFTAUbSvPlg0Z0mav5KTLV7oRZGPmDhMpR0iGi0QrzO2jen6eRha4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6740
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



On 12/17/2025 2:37 AM, Vinay Belgaumkar wrote:
> Also, extract out the GuC RC related set/unset param functions
> into xe_guc_rc file. GuC still allows us to override GuC RC mode
> using an SLPC H2G interface. Continue to use that interface, but
> move the related code to the newly created xe_guc_rc file.
> 
> v2: xe_guc_rc functions to use guc pointer instead of gt (Michal W)
> 
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_pc.c | 46 ++++++++++++++++------------------
>  drivers/gpu/drm/xe/xe_guc_pc.h |  2 ++
>  drivers/gpu/drm/xe/xe_guc_rc.c | 26 +++++++++++++++++++
>  drivers/gpu/drm/xe/xe_guc_rc.h |  3 +++
>  drivers/gpu/drm/xe/xe_oa.c     |  9 +++----
>  5 files changed, 56 insertions(+), 30 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> index f8b683189f6c..03d7d3d2346e 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -253,6 +253,27 @@ static int pc_action_unset_param(struct xe_guc_pc *pc, u8 id)
>  	return ret;
>  }
>  
> +/**
> + * xe_guc_pc_action_set_param - Set value of SLPC param

nit:

    * xe_guc_pc_action_set_param() - Set ...

> + * @pc: Xe_GuC_PC instance
> + * @id: Param id
> + * @value: Value to set
> + */
> +int xe_guc_pc_action_set_param(struct xe_guc_pc *pc, u8 id, u32 value)
> +{

maybe to make these helpers more useful,
take a rpm ref here instead of forcing callers to do that:

	guard(xe_pm_runtime)(guc_to_xe(guc));
or
	guard(xe_pm_runtime_noresume)(guc_to_xe(guc));

or at least assert that rpm is already taken?

> +	return pc_action_set_param(pc, id, value);
> +}
> +
> +/**
> + * xe_guc_pc_action_unset_param - Revert to default value
> + * @pc: Xe_GuC_PC instance
> + * @id: Param id
> + */
> +int xe_guc_pc_action_unset_param(struct xe_guc_pc *pc, u8 id)
> +{
> +	return pc_action_unset_param(pc, id);
> +}
> +
>  static u32 decode_freq(u32 raw)
>  {
>  	return DIV_ROUND_CLOSEST(raw * GT_FREQUENCY_MULTIPLIER,
> @@ -1034,31 +1055,6 @@ int xe_guc_pc_restore_stashed_freq(struct xe_guc_pc *pc)
>  	return ret;
>  }
>  
> -/**
> - * xe_guc_pc_override_gucrc_mode - override GUCRC mode
> - * @pc: Xe_GuC_PC instance
> - * @mode: new value of the mode.
> - *
> - * Return: 0 on success, negative error code on error
> - */
> -int xe_guc_pc_override_gucrc_mode(struct xe_guc_pc *pc, enum slpc_gucrc_mode mode)
> -{
> -	guard(xe_pm_runtime)(pc_to_xe(pc));
> -	return pc_action_set_param(pc, SLPC_PARAM_PWRGATE_RC_MODE, mode);
> -}
> -
> -/**
> - * xe_guc_pc_unset_gucrc_mode - unset GUCRC mode override
> - * @pc: Xe_GuC_PC instance
> - *
> - * Return: 0 on success, negative error code on error
> - */
> -int xe_guc_pc_unset_gucrc_mode(struct xe_guc_pc *pc)
> -{
> -	guard(xe_pm_runtime)(pc_to_xe(pc));
> -	return pc_action_unset_param(pc, SLPC_PARAM_PWRGATE_RC_MODE);
> -}
> -
>  static void pc_init_pcode_freq(struct xe_guc_pc *pc)
>  {
>  	u32 min = DIV_ROUND_CLOSEST(pc->rpn_freq, GT_FREQUENCY_MULTIPLIER);
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.h b/drivers/gpu/drm/xe/xe_guc_pc.h
> index 1b95873b262e..00182a02a49e 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.h
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.h
> @@ -18,6 +18,8 @@ int xe_guc_pc_stop(struct xe_guc_pc *pc);
>  int xe_guc_pc_override_gucrc_mode(struct xe_guc_pc *pc, enum slpc_gucrc_mode mode);
>  int xe_guc_pc_unset_gucrc_mode(struct xe_guc_pc *pc);
>  void xe_guc_pc_print(struct xe_guc_pc *pc, struct drm_printer *p);
> +int xe_guc_pc_action_set_param(struct xe_guc_pc *pc, u8 id, u32 value);
> +int xe_guc_pc_action_unset_param(struct xe_guc_pc *pc, u8 id);
>  
>  u32 xe_guc_pc_get_act_freq(struct xe_guc_pc *pc);
>  int xe_guc_pc_get_cur_freq(struct xe_guc_pc *pc, u32 *freq);
> diff --git a/drivers/gpu/drm/xe/xe_guc_rc.c b/drivers/gpu/drm/xe/xe_guc_rc.c
> index a526405b686b..ba98e5db996f 100644
> --- a/drivers/gpu/drm/xe/xe_guc_rc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_rc.c
> @@ -16,6 +16,7 @@
>  #include "xe_gt_idle.h"
>  #include "xe_gt_printk.h"
>  #include "xe_guc_ct.h"
> +#include "xe_guc_pc.h"
>  #include "xe_pm.h"
>  
>  /**
> @@ -131,3 +132,28 @@ int xe_guc_rc_start(struct xe_guc *guc)
>  
>  	return xe_guc_rc_enable(guc);
>  }
> +
> +/**
> + * xe_guc_rc_override_mode() - override GUCRC mode
> + * @guc: Xe GuC instance
> + * @mode: new value of the mode.
> + *
> + * Return: 0 on success, negative error code on error
> + */
> +int xe_guc_rc_override_mode(struct xe_guc *guc, enum slpc_gucrc_mode mode)
> +{
> +	guard(xe_pm_runtime)(guc_to_xe(guc));
> +	return xe_guc_pc_action_set_param(&guc->pc, SLPC_PARAM_PWRGATE_RC_MODE, mode);
> +}
> +
> +/**
> + * xe_guc_rc_unset_mode() - revert to default mode
> + * @guc: Xe GuC instance
> + *
> + * Return: 0 on success, negative error code on error
> + */
> +int xe_guc_rc_unset_mode(struct xe_guc *guc)
> +{
> +	guard(xe_pm_runtime)(guc_to_xe(guc));
> +	return xe_guc_pc_action_unset_param(&guc->pc, SLPC_PARAM_PWRGATE_RC_MODE);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_guc_rc.h b/drivers/gpu/drm/xe/xe_guc_rc.h
> index 2500b0d1c151..c77fad9278f0 100644
> --- a/drivers/gpu/drm/xe/xe_guc_rc.h
> +++ b/drivers/gpu/drm/xe/xe_guc_rc.h
> @@ -12,9 +12,12 @@
>  
>  struct xe_gt;
>  struct xe_guc;
> +enum slpc_gucrc_mode;
>  
>  int xe_guc_rc_disable(struct xe_guc *guc);
>  int xe_guc_rc_start(struct xe_guc *guc);
>  int xe_guc_rc_init(struct xe_guc *guc);
> +int xe_guc_rc_override_mode(struct xe_guc *guc, enum slpc_gucrc_mode mode);
> +int xe_guc_rc_unset_mode(struct xe_guc *guc);
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
> index cc48663c2b48..a474f086162e 100644
> --- a/drivers/gpu/drm/xe/xe_oa.c
> +++ b/drivers/gpu/drm/xe/xe_oa.c
> @@ -29,7 +29,7 @@
>  #include "xe_gt.h"
>  #include "xe_gt_mcr.h"
>  #include "xe_gt_printk.h"
> -#include "xe_guc_pc.h"
> +#include "xe_guc_rc.h"
>  #include "xe_macros.h"
>  #include "xe_mmio.h"
>  #include "xe_oa.h"
> @@ -875,7 +875,7 @@ static void xe_oa_stream_destroy(struct xe_oa_stream *stream)
>  
>  	/* Wa_1509372804:pvc: Unset the override of GUCRC mode to enable rc6 */
>  	if (stream->override_gucrc)
> -		xe_gt_WARN_ON(gt, xe_guc_pc_unset_gucrc_mode(&gt->uc.guc.pc));
> +		xe_gt_WARN_ON(gt, xe_guc_rc_unset_mode(&gt->uc.guc));
>  
>  	xe_oa_free_configs(stream);
>  	xe_file_put(stream->xef);
> @@ -1761,8 +1761,7 @@ static int xe_oa_stream_init(struct xe_oa_stream *stream,
>  	 * state. Prevent this by overriding GUCRC mode.
>  	 */
>  	if (XE_GT_WA(stream->gt, 1509372804)) {
> -		ret = xe_guc_pc_override_gucrc_mode(&gt->uc.guc.pc,
> -						    SLPC_GUCRC_MODE_GUCRC_NO_RC6);
> +		ret = xe_guc_rc_override_mode(&gt->uc.guc, SLPC_GUCRC_MODE_GUCRC_NO_RC6);
>  		if (ret)
>  			goto err_free_configs;
>  
> @@ -1820,7 +1819,7 @@ static int xe_oa_stream_init(struct xe_oa_stream *stream,
>  	xe_force_wake_put(gt_to_fw(gt), stream->fw_ref);
>  	xe_pm_runtime_put(stream->oa->xe);
>  	if (stream->override_gucrc)
> -		xe_gt_WARN_ON(gt, xe_guc_pc_unset_gucrc_mode(&gt->uc.guc.pc));
> +		xe_gt_WARN_ON(gt, xe_guc_rc_unset_mode(&gt->uc.guc));
>  err_free_configs:
>  	xe_oa_free_configs(stream);
>  exit:

