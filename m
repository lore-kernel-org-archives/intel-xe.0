Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2187D116F3
	for <intel-xe@archiver.kernel.org>; Mon,  1 Dec 2025 22:37:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78FF710E4A8;
	Mon,  1 Dec 2025 22:37:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DzMJjZto";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6687910E4A8
 for <intel-xe@lists.freedesktop.org>; Mon,  1 Dec 2025 22:37:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764628640; x=1796164640;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=sYET+Xvjy/Mq3kahQzQ7Fi7z3YmTOYya1LIGlkckLbM=;
 b=DzMJjZtospjW7eOHxg2sy/bdG8oWokwXZZ6JoYppJ8roHHM1vdDGmjDr
 MoLWtBC+fnXyUvCGHOMNOS8AXcEpGMbCaqTP5jCU3Y9yQ55e9D9V9EbeW
 mqpGAN7vZN3ujLQiD7dcOMCtjV1onVGY+wJFqZL4PvWKg2yCWXyPGJM3E
 Cc800nHuFAOZFJeuT3Ngbc7h0yc0btQInTxHRVYatwC55nOo0IhC0UaFQ
 R9G/ee5+M+y0Uy1Y/yMFzhIVM7Abe8wRH38W6m91wgfaW1Sf6ArCjmn27
 5Y2HxnFVmGx1KrNi1oJxtDE+eA3atmge/y9hut+JiDGb8mBlbU63UiiXp Q==;
X-CSE-ConnectionGUID: 7JLKj3JpSPCNb+8ej6aKZQ==
X-CSE-MsgGUID: sNPkgoC5QyOnD3q1YvVjtQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="77683734"
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; d="scan'208";a="77683734"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 14:37:20 -0800
X-CSE-ConnectionGUID: TKtqsDcwSOa6CjsFgjJzYQ==
X-CSE-MsgGUID: aHfNO6a1TbWBIOrTW01JnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; d="scan'208";a="193470310"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 14:37:19 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 14:37:18 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 1 Dec 2025 14:37:18 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.39) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 14:37:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x3RkjXl8xyk78PDayiY0vVisN7X+74YKhkMhgeAnddAtVpXppI1ODyp1Psh8dsr9qDJuegEYJEWpehr0wRgseKnrrNsdSyMBzIW0UjwGFDIaSrjebOH+1gERmaYnyyJrX0PHTehBtCSfeOi9ddmfTgD9m3qUvEP9IGMwnTtYgUWcvHftbNIl6OdOQSci7RD0wVUxDAUH3I2cIFXaWEOEoA4tMc1x2EUZBYbKSBL0nRJ7ht2bfYohFaU5fCfQ85rC2NmSVkM76j8MijFovWhHXvd3RcK7kAyJeEoe3EZyb7va0Ep2shaJS/XZqgitHec3/d+MzhHgHn2dmcNTao80PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lH/wuzyFYMmKjJrgPFOzjxjPKPFEgXSbGQl3bz28SpM=;
 b=U+VDtwAuDy10RPqwEXaLFvV1ntrh32VUXvfdkPtZG7NpiQHY0GvVr+FUkt4RyYLH2vTnp6KJ9WkhTKk1h8Da7Giuew+uEGdSC97P/KSEmyHtXrsaRK/vXkLVW+EpsZw++p+WVqK5gCuaGKdfbFbOyUmDN5IgT+voeWIPcRqAqh5Kp1T5glt00djgrmVbDXrDSu4hH+wfKqw4iUo49O1lz9htM5iK1k/jZnecCOfpDJRSL3v1C2+P+E4HbOxEjtpgmGXFwAakArPde1dqb24j2OMQoP/BWcvxK38sXasOLp6PykCX/ZZwph/RC1v8BXkz5ob8m9fTMd5Rc8c26bOTUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by PH8PR11MB6854.namprd11.prod.outlook.com (2603:10b6:510:22d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 22:37:15 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%5]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 22:37:15 +0000
Message-ID: <0254302e-35cf-4721-84d8-d0c95c2e6d62@intel.com>
Date: Mon, 1 Dec 2025 23:37:12 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/10] drm/xe/sriov: Initialize scheduler groups
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20251127014507.2323746-12-daniele.ceraolospurio@intel.com>
 <20251127014507.2323746-14-daniele.ceraolospurio@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251127014507.2323746-14-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P189CA0025.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:802:2a::38) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|PH8PR11MB6854:EE_
X-MS-Office365-Filtering-Correlation-Id: bba9c3bc-a7a9-4b69-259f-08de312a2d22
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cXkzekc4RmZhME0rVFd1V01rWWg0VWpoK0laOTBTczNJQUJGQVlXSEN6M1hL?=
 =?utf-8?B?RXpuZ3VpQ2EwamtjbGpZaUFCRS9JMVc4ajZrN1hZb2w3ekU2Qm9IbmZ2UERF?=
 =?utf-8?B?YzVDYmZsTlNQMFNHRjBPNGVla2sxNGxYZGdRaFBRTDREV1lOeDd2V3JnR1Jk?=
 =?utf-8?B?TUx2UmVuQmQxQUFKVHJIUmtrNGNlUHZNTm9rRjFublRGbHkyNWtIcHBOQ2sx?=
 =?utf-8?B?SG9wdUFWaUU2QWprYm9Hd1FLNVBmVGVXNzBiSEM2Q2paK2JsUzUzc252UGtM?=
 =?utf-8?B?ZGFXRTVZRVB2UGxUYkd3V2RxRFVqKzJiNnVSb0tDTjVQb2dhbEFlaWh3cEpV?=
 =?utf-8?B?MXoyUURmZjNKbGpOcUFpNWRGS3ZwbGh0emxNZnRUbUg1TGJDZC90NzlwMXdC?=
 =?utf-8?B?OGRqbS8zbEdrRjJERnR6cDQ0TU1yVHBpUmlwNkY5K0J5dmRnZ3NPRXpZVHNq?=
 =?utf-8?B?NWNFdXc2RnkwRERRaTlseHZDYXVxZFM0ekNPQ3dJOFhaZlJZa2ZhZkxmSGUr?=
 =?utf-8?B?NGE3bXAyc0wvdjhFUFJQS1ZyeHNlTmZ3K2hKci9oYmtmYUFidURiY1F3VTRD?=
 =?utf-8?B?RkYxK2tLcWtjVzdVTDB2YXZVbVh5ZUROMzNEcnRiQW5iYkt3Y1ZISG0veVhZ?=
 =?utf-8?B?RnpyNGtaa3EyKzJGSTIwWjBmaTN5aW1mWUxsZHdXNkR5dGtEK3ZFWTBWaHF3?=
 =?utf-8?B?c0NDaHBwVnk0RUF5Ymp4L2lrZEFhbzlUa0l6Tm00dWJvdmJDaGs2OFhsRUdh?=
 =?utf-8?B?a2tiZ09WVWNoZmVhRWV1UUdsWTNEZ2toeE5Qb0IzYWp0K1NyZFFENXdLYUpV?=
 =?utf-8?B?bzcwSVUyR0t1cjdmOStpNC9VRTNDUW9Yd1lzYXZpTXlENTdUUVR0c2NqWmxt?=
 =?utf-8?B?T2M5MXFHZjhISWRvMllSNXdnTjltUG5VMEdRM1phVktLSzhDQ2xsdnFYSzJ6?=
 =?utf-8?B?QlJzRFF0K1hJeVQrM1k0QkplbEZjOGtZcmczN0xTUHM4MzliemhWYUxzUzJ5?=
 =?utf-8?B?SGxuTW43VGhqaDRwb3JSMXM0cG52RFVwK3dnZE4wWWQ1T3llMWRqSU1HU3BO?=
 =?utf-8?B?T0g2STZVeXl4Y1BTalhoVENjZ1l6WTVHMFo2MkhuRzZRQjlMcDU1YXZxMjJQ?=
 =?utf-8?B?NlBUYXh4R2RsU21XSXlkWXRYaXV4MXdrWVArdjRrVkVyMDlocytjMHBULy8v?=
 =?utf-8?B?SGd4ejFadWxkZ2F0SE1xK09PQXNJTEZPY0dBalJiUzlaR2hOZS9wRm5sUTNS?=
 =?utf-8?B?L3JaSG9jSW5JTTRyYktwQkxybWhDNit4N0ttQ0VFeGZ5RXhyN1IyTk5JcGg5?=
 =?utf-8?B?WHU2c20yTTlsMzZnQkdjVys2QkJiaDM3Q0owYmlDTkhrLzVGZXVIQU00UHJV?=
 =?utf-8?B?LzlscEg1UTZIL1RNbFFPTFhhVStQaTlxTmNSdGtFQ24yK0RaM2dMVUp0Ym04?=
 =?utf-8?B?SzBuWFhqZGhZZ0tSNU1IcUNIaXFSbnFPeVdRYVYvYjBTWEhTMzZYaW85MHlN?=
 =?utf-8?B?RFJOZTdMUGFGUnNzNHdhYk9HZHVCN09jTHZySjNKMEhTWnVKVGxrcVVsdDlV?=
 =?utf-8?B?RUxnZzYwcDltT2FIZFhrRHp5ZkNXWTZVRThNZHYxQm43MTNBK3FzVkcrZ2d2?=
 =?utf-8?B?MldJMWNrUEtmK2x1eW1iaUZTbFVXeU9LZW9JS0VqWGJraGh6NHFpQzVkMGRF?=
 =?utf-8?B?SUJER3puQTF0VkpYMkdDVlNhUzNKMkhEc1pUVGdwcll4Yll2STBNbldlSFh4?=
 =?utf-8?B?RjZicTFYVW9ZeHlyK2RPOTJJNVY0VitiZ2FuRkZiZytBNS9NQ05VblNqZVF5?=
 =?utf-8?B?Tm4rYjB4elYzME1uWmVXS1VTSkMzMElPb0pzdVdKMEJ2WDlJWjRXMFlkVDU3?=
 =?utf-8?B?WEo0RmpRVS9wVjlZRVZLMzVFKzYvTVZiMnV0dGM3a3o3YWFRZFh4WFJMZFpv?=
 =?utf-8?Q?Q/xicfWPDhClS9VHfQn1AkaD8sWU70ra?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RjlwYnB6b09ZSDVOQzd0allKNTNLMW1sLzQ5emZSSkNwVVJoRkNyMmlldGts?=
 =?utf-8?B?Q0txWnJOVHVpR3N3TXFRZkd3TTFMOHFhQXVFMVJOVVVUcEdmVTBDV1hCd05m?=
 =?utf-8?B?OS9NUFR0WnJDRmlzMjNBdXVIblRKU3NqZUtjSm5rMU1mZVJsdXRFcjAzUUpP?=
 =?utf-8?B?cmROakRuRlBUWmRORjhIckZjMXpMTmU5dDdWTFlHelJuV05IN3BQTkhBTEVx?=
 =?utf-8?B?a3Z1M3NsMW9mSVBnOWVBdUswVk5wazhnamNUWGFDa3EvcGlEVXRLY1pGKytF?=
 =?utf-8?B?dUx6TTcyNHB5allYVyszV1pOWG05SjNzaGhTQ3J5bnhrUUUzcjUxbUJWU2ZV?=
 =?utf-8?B?UkUrL2xBR2k1dEh6dTNTa3AxNzlESkY5bkozZ2dFc0YzckRmSzBBNEZYSmJZ?=
 =?utf-8?B?NUFMd1FiM0NWcWJUNXdkVHBkb1drNVJDaGdPclcxRjlqaXB3dE5RYzgxRFJo?=
 =?utf-8?B?ZVJlempvSUxMb2gvbERsNGNzYWZNMDV0MWI0b3p2aHFoaFlIcTNqQ2pNRnJM?=
 =?utf-8?B?WU80UDNlSE8vT2tEanhsS3ZsUHNVZVpFOUtzVk9MSU1BZ1QvSUtxYnlCTEsy?=
 =?utf-8?B?emIyOTc0SEpzNkZFWmpCb3NHeDlOVnZocE1KTjJvTnAwZHVoRm10UmdYZGo0?=
 =?utf-8?B?LzU0bzhrOHFYM3VjRGVOcjBGOHVMZkVPcEJyZ2cwWDhBWkY0QlB5TFdJcWdm?=
 =?utf-8?B?VDFCbnNickhGNWVLaWtOeTh1YU1vUUhZaSsvbzRqQWFZcy95cERZZ0JOejBX?=
 =?utf-8?B?RmRjTSsxczhwTXFZVXgzV0ozZlNvUjBUUVpVU2xJWWoxSlRKZU14UWVYbE93?=
 =?utf-8?B?ZlE1YjVLV2ZRRjRjQkY3YTMzY1lOVzl0MWN2MU5xeW0wUnJ3UzY2MGZiWUpK?=
 =?utf-8?B?OXVnYXUwbjVjTGcyRCtOM2Q2UEVETk96bThIdFRPZkt6K0p2ak82YXZ5Wnov?=
 =?utf-8?B?K1VndEZwUGhuVi9WWXZFQi9hMkVzZGpoWkxqdVQzSG5oNVBlczlxaDdXaVg5?=
 =?utf-8?B?cGlVZHE2ckJUNGRnOFN1c3RvTWF1aTJhbGJYdG5SRi9mRndYTk9DaVpyakll?=
 =?utf-8?B?WGd0OUs2TDFyVXgvTHRXUjA1dm5WNllyMStRaHZNaVY5M1kvbE5BZzlXcmtZ?=
 =?utf-8?B?eVl3K01TbGRpVTlDbjl4RTlFMzczMXlLQWlENi8wNmRnSnk0ZERhamxpd0kv?=
 =?utf-8?B?VG8wZnhCMGMrRmQ3VXV6RnV5ZUVnYUptSlhTaTdCZ0RmNzVkVVh1NGJaMGtB?=
 =?utf-8?B?d3JWUlpucEQzNHFud29TZmxwRHF5dVNCNllVTDUyRFllV3BXUW1MOGJkL1Na?=
 =?utf-8?B?SVRkVjMwN0VscGw4WGtpcE82TWRvNnBBSS9mbDR4R0VPeXBVQkpabGVQS3VE?=
 =?utf-8?B?OVlvT0lxU05PNys4eG56bVN5eVBwK0lHUFB0S1dvV3VWejM4eE9kSVdJWnMv?=
 =?utf-8?B?K1NxR2pEaHZrNlNlQTlDSWE5bjJETkhsZFhweXdJb2JJMEgvSDI2VXArWm9Y?=
 =?utf-8?B?ek1VeTdodEhTN0YvdDNUeDRLWUdpOUZHTjBNV0RYaE1EeTY3YmZtR29Salpo?=
 =?utf-8?B?bXF3WmVKdjhVRlFzcTk0Q2JleElkZmtOVndXaWQrYldqeFh3K2dTZ0IyZnFs?=
 =?utf-8?B?cVdBRURBdXR6UXpwTFp1UVh2OCt4OGp6Vmp3RzNkamdGM0FmajBrSllUQlU3?=
 =?utf-8?B?ZnNuT0FMK2RNL1Npb0t2bC93L3FpNEhTaW8zME5ZbXJlODZWeDdOUnF2aGNF?=
 =?utf-8?B?VTM4RzgwQkVXUTBkbGhzTXJaeFRqTDBHZmhsNnJTTUpPNGlONDZnWnQvSkJN?=
 =?utf-8?B?TDRXQVlleHN6YVJTeVhZYkpPWEZQaE96dVVVdVpDdjA2UWwxRG94QnlWWUx3?=
 =?utf-8?B?aGJzdzFyZVRSWkdJdWFvMEVJZDQwdEYrNnlNRG5WRlpXdGNSY2JWaXhRd2FL?=
 =?utf-8?B?NXgrcDcxV0hhU09rU3lNYzBsK0hPOGg0cWZsNHY0Qm1FODl5T2xuN1RIY1FH?=
 =?utf-8?B?NjNITGdCUVkvOUpwT1pNTGVjQ2w3RjRJd2pmcFBseVF2Vlg2Wkh6bjRQOHdL?=
 =?utf-8?B?UmtJKzg1YmN2UjFFMVFyK2N2dVFBN2prb3pROXBNSC9HYm9SQ2gzdTRQallK?=
 =?utf-8?B?U2hRakZsbzQyYzZlTlVUVFRXQkdkbm5sR0Z6M2NBdUo0YjlDdUk5UkRSeW8x?=
 =?utf-8?B?ZVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bba9c3bc-a7a9-4b69-259f-08de312a2d22
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 22:37:15.5228 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DKFFE3582b8Ds82bpxNQROl/MWNTpzZHdxH0Avic6ayn4JR1fbEfBHeklZSKKCILTrAjrdHfDrGzqJjWHeOx5XCMJhEfHnksYnzOJEvGDkY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6854
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

Hi Daniele,

some initial comments to keep you busy ;)

On 11/27/2025 2:45 AM, Daniele Ceraolo Spurio wrote:
> Scheduler groups (a.k.a. Engine Groups Scheduling, or EGS) is a GuC
> feature that allows the driver to define groups of engines that are
> independently scheduled across VFs, which allows different VFs to be
> active on the HW at the same time on different groups.
> 
> This is intended for specific scenarios where the admin knows that the
> VFs are not going to fully utilize the HW and therefore assigning all of
> it to a single VF would lead to part of it being permanently idle.
> We do not allow the admin to decide how to divide the engines across
> groups, but we instead support specific configurations that are designed
> for specific use-cases. During PF initialization we detect which
> configurations are possible on a given GT and create the relevant
> groups. Since the GuC expect a mask for each class for each group, that
> is what we save when we init the configs.
> 
> Right now we only have one use-case on the media GT. If the VFs are
> running a frame render + encoding at a not-too-high resolution (e.g.
> 1080@30fps) the render can produce frames faster than the video engine
> can encode them, which means that the maximum number of parallel VFs is
> limited by the VCS bandwidth. Since our products can have multiple VCS
> engines, allowing multiple VFs to be active on the different VCS engines
> at the same time allows us to run more parallel VFs on the same HW.
> Given that engines in the same media slice share some resources (e.g.
> SFC), we assign each media slice to a different scheduling group. We
> refer to this configuration as "media_slices", given that each slice
> gets its own group.
> 
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_pf.c           |   5 +
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c    | 135 ++++++++++++++++++
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h    |   1 +
>  .../gpu/drm/xe/xe_gt_sriov_pf_policy_types.h  |  14 ++
>  4 files changed, 155 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
> index 0714c758b9c1..62dda1c24e77 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
> @@ -14,6 +14,7 @@
>  #include "xe_gt_sriov_pf_control.h"
>  #include "xe_gt_sriov_pf_helpers.h"
>  #include "xe_gt_sriov_pf_migration.h"
> +#include "xe_gt_sriov_pf_policy.h"
>  #include "xe_gt_sriov_pf_service.h"
>  #include "xe_gt_sriov_printk.h"
>  #include "xe_guc_submit.h"
> @@ -123,6 +124,10 @@ int xe_gt_sriov_pf_init(struct xe_gt *gt)
>  	if (err)
>  		return err;
>  
> +	err = xe_gt_sriov_pf_policy_init(gt);
> +	if (err)
> +		return err;
> +
>  	err = xe_gt_sriov_pf_migration_init(gt);
>  	if (err)
>  		return err;
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
> index 4445f660e6d1..9b878578ea90 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
> @@ -5,11 +5,14 @@
>  
>  #include "abi/guc_actions_sriov_abi.h"
>  
> +#include <drm/drm_managed.h>

system headers shall be included before our local headers

> +
>  #include "xe_bo.h"
>  #include "xe_gt.h"
>  #include "xe_gt_sriov_pf_helpers.h"
>  #include "xe_gt_sriov_pf_policy.h"
>  #include "xe_gt_sriov_printk.h"
> +#include "xe_guc.h"
>  #include "xe_guc_buf.h"
>  #include "xe_guc_ct.h"
>  #include "xe_guc_klv_helpers.h"
> @@ -351,6 +354,125 @@ u32 xe_gt_sriov_pf_policy_get_sample_period(struct xe_gt *gt)
>  	return value;
>  }
>  
> +#define MAX_MEDIA_SLICES (hweight32(XE_HW_ENGINE_VECS_MASK))

redundant ( )

and maybe such macro should be placed in xe_hw_engine_types.h
with proper comment why it works:

	/*
	 * Each media slice has 1x VECS
	 * Max number of VECS instances gives us a max number of slices
	 */

> +static int pf_sched_group_media_slices(struct xe_gt *gt, u32 **masks, u32 *num_masks)
> +{
> +	u8 slice_to_group[MAX_MEDIA_SLICES];
> +	struct xe_hw_engine *hwe = NULL;

do we need to initialize this here?
it will be initialized by for_each_hw_engine, no?

> +	enum xe_hw_engine_id id;
> +	u32 vcs_mask = VCS_MASK(gt);
> +	u32 vecs_mask = VECS_MASK(gt);
> +	u32 gsc_mask = GSCCS_MASK(gt);

we try to define vars in rev-xmas-tree order

> +	u32 *values;
> +	u8 slice;
> +	u8 groups;

I guess for those two generic counters we don't need to use explicitly sized int

> +
> +	xe_gt_assert(gt, xe_gt_is_media_type(gt));
> +
> +	/* A media slice has 2 VCS and a VECS. We bundle the GSC with the first slice */
> +	for (slice = 0, groups = 0;
> +	     gsc_mask || vcs_mask || vecs_mask;
> +	     slice++, gsc_mask = 0, vcs_mask >>= 2, vecs_mask >>= 1) {
> +		if (unlikely(slice >= MAX_MEDIA_SLICES)) {

maybe this 'for' loop should be just for 'slice = [0, MAX)'  

> +			xe_gt_sriov_err(gt, "Too many media slices (%u) during EGS setup\n",
> +					slice);

then after this loop we can have asserts that no engine instances are left behind

> +			return -EINVAL;
> +		}
> +
> +		if ((vcs_mask & 0x3) || (vecs_mask & 0x1) || (gsc_mask & 0x1))
> +			slice_to_group[slice] = groups++;
> +	}

like this:

	for (slice = 0; slice < MAX_MEDIA_SLICES; slice++ ) {

		if ((vcs_mask & 0x3) || (vecs_mask & 0x1) || (gsc_mask & 0x1))
			slice_to_group[slice] = groups++;

		vcs_mask >>= 2;
		vecs_mask >>= 1;
		gsc_mask >>= 1;
	}

	xe_gt_assert(gt, !vcs_mask)
	xe_gt_assert(gt, !vecs_mask)
	xe_gt_assert(gt, !gsc_mask)

> +
> +	/* We need at least 2 slices to split them up */

shouldn't we also check that each group has both VCS and VECS?

> +	if (groups < 2) {
> +		*masks = NULL;
> +		*num_masks = 0;
> +		return 0;
> +	}
> +
> +	/*
> +	 * The GuC expects and array with GUC_MAX_ENGINE_CLASSES entries for

typo: an array ?

> +	 * each group.
> +	 */
> +	values = drmm_kzalloc(&gt_to_xe(gt)->drm,
> +			      GUC_MAX_ENGINE_CLASSES * groups * sizeof(u32),
> +			      GFP_KERNEL);
> +	if (!values)
> +		return -ENOMEM;
> +
> +	for_each_hw_engine(hwe, gt, id) {
> +		u8 guc_class = xe_engine_class_to_guc_class(hwe->class);
> +		u8 entry;
> +
> +		switch (hwe->class) {
> +		case XE_ENGINE_CLASS_VIDEO_DECODE:
> +			slice = hwe->instance / 2;

hmm, this seems to duplicate previous loop where we had:

			vcs_mask >>= 2;

maybe these two loops can be combined?

> +			break;
> +		case XE_ENGINE_CLASS_VIDEO_ENHANCE:
> +			slice = hwe->instance;
> +			break;
> +		case XE_ENGINE_CLASS_OTHER:
> +			slice = 0;
> +			break;
> +		default:
> +			xe_gt_sriov_err(gt, "unknown media gt class %u (%s) during EGS setup\n",
> +					hwe->class, hwe->name);

this also seems like an attempt to catch our coding error,
so plain assert should be sufficient

> +			drmm_kfree(&gt_to_xe(gt)->drm, values);

do we need to bother with this kfree ?
it's managed allocation and any error from here will lead to abort the probe anyway

> +			return -EINVAL;
> +		}
> +
> +		entry = (slice_to_group[slice] * GUC_MAX_ENGINE_CLASSES) + guc_class;

redundant ( )

> +		values[entry] |= BIT(hwe->logical_instance);
> +	}
> +
> +	*masks = values;
> +	*num_masks = GUC_MAX_ENGINE_CLASSES * groups;
> +
> +	return 0;
> +}
> +
> +static int pf_init_sched_groups(struct xe_gt *gt)
> +{
> +	int err;
> +	int m;
> +
> +	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
> +
> +	if (GUC_SUBMIT_VER(&gt->uc.guc) < MAKE_GUC_VER(1, 26, 0))
> +		return 0;
> +
> +	for (m = 0; m < XE_SRIOV_SCHED_GROUPS_MODES_COUNT; m++) {
> +		u32 *masks = NULL;
> +		u32 num_masks = 0;
> +
> +		switch (m) {
> +		case XE_SRIOV_SCHED_GROUPS_NONE:
> +			break;
> +		case XE_SRIOV_SCHED_GROUPS_MEDIA_SLICES:
> +			/* this mode only has groups on the media GT */

then having array of all modes on every GT seems non-optimal

> +			if (xe_gt_is_media_type(gt)) {
> +				err = pf_sched_group_media_slices(gt, &masks, &num_masks);
> +				if (err)
> +					return err;
> +			}
> +			break;
> +		default:
> +			xe_gt_sriov_err(gt, "unknown sched group mode %u\n", m);

this looks more like a coding error, so maybe use just assert?

> +			return -EINVAL;
> +		}
> +
> +		xe_gt_assert(gt, (num_masks % GUC_MAX_ENGINE_CLASSES) == 0);
> +
> +		if ((m == XE_SRIOV_SCHED_GROUPS_NONE) || num_masks)
> +			gt->sriov.pf.policy.guc.sched_groups.supported_modes |= BIT(m);
> +
> +		gt->sriov.pf.policy.guc.sched_groups.modes[m].masks = masks;
> +		gt->sriov.pf.policy.guc.sched_groups.modes[m].num_masks = num_masks;
> +	}
> +
> +	return 0;
> +}
> +
>  static void pf_sanitize_guc_policies(struct xe_gt *gt)
>  {
>  	pf_sanitize_sched_if_idle(gt);
> @@ -401,6 +523,19 @@ int xe_gt_sriov_pf_policy_reprovision(struct xe_gt *gt, bool reset)
>  	return err ? -ENXIO : 0;
>  }
>  
> +/**
> + * xe_gt_sriov_pf_policy_init - Initializes the SW state of the PF policies.
> + * @gt: the &xe_gt
> + *
> + * This function can only be called on PF. This function does not touch the HW.

but must be called after checking HW engine fuses, right?

> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_gt_sriov_pf_policy_init(struct xe_gt *gt)
> +{
> +	return pf_init_sched_groups(gt);
> +}
> +
>  static void print_guc_policies(struct drm_printer *p, struct xe_gt_sriov_guc_policies *policy)
>  {
>  	drm_printf(p, "%s:\t%s\n",
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h
> index 2a5dc33dc6d7..c9c04d1b7f50 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h
> @@ -18,6 +18,7 @@ bool xe_gt_sriov_pf_policy_get_reset_engine(struct xe_gt *gt);
>  int xe_gt_sriov_pf_policy_set_sample_period(struct xe_gt *gt, u32 value);
>  u32 xe_gt_sriov_pf_policy_get_sample_period(struct xe_gt *gt);
>  
> +int xe_gt_sriov_pf_policy_init(struct xe_gt *gt);
>  void xe_gt_sriov_pf_policy_sanitize(struct xe_gt *gt);
>  int xe_gt_sriov_pf_policy_reprovision(struct xe_gt *gt, bool reset);
>  int xe_gt_sriov_pf_policy_print(struct xe_gt *gt, struct drm_printer *p);
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy_types.h
> index 4de532af135e..3b915801c01b 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy_types.h
> @@ -8,16 +8,30 @@
>  
>  #include <linux/types.h>
>  

we expect all enums (and enumerators) to have proper kernel-doc

> +enum xe_sriov_sched_group_modes {
> +	XE_SRIOV_SCHED_GROUPS_NONE = 0, /* disabled */

do we really need this?

> +	XE_SRIOV_SCHED_GROUPS_MEDIA_SLICES, /* separate groups for each media slice */
> +	XE_SRIOV_SCHED_GROUPS_MODES_COUNT

while it looks handy solution to count enumerators,
now COUNT pretends to be a valid mode enumerator while it is not

maybe just provide separate #define for it?

> +};
> +
>  /**
>   * struct xe_gt_sriov_guc_policies - GuC SR-IOV policies.
>   * @sched_if_idle: controls strict scheduling policy.
>   * @reset_engine: controls engines reset on VF switch policy.
>   * @sample_period: adverse events sampling period (in milliseconds).
> + * @sched_groups: available scheduling group configurations and current mode.

don't forget to describe inner members

and there is no 'current' now

>   */
>  struct xe_gt_sriov_guc_policies {
>  	bool sched_if_idle;
>  	bool reset_engine;
>  	u32 sample_period;
> +	struct {
> +		u32 supported_modes;
> +		struct {
> +			u32 *masks;
> +			u32 num_masks;
> +		} modes[XE_SRIOV_SCHED_GROUPS_MODES_COUNT];

hmm, for the NONE mode, all groups must be 0, so why bother with .masks/.num fields for it?

maybe all we need is:

	struct {
		const char *name;
		u32 *config;
	} modes[];

then:

	supported_modes := iterate over modes array and look for non-null config/name

	none := supported_modes is empty

	current := pointer to modes[] or NULL

> +	} sched_groups;
>  };
>  
>  /**

