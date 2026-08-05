Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EAE1C55ABF
	for <intel-xe@archiver.kernel.org>; Wed,  5 Aug 2026 21:43:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06EFD10E1AF;
	Wed,  5 Aug 2026 21:43:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SRX+zmid";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C74DE10E1AF
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Aug 2026 21:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785966181; x=1817502181;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=VMz48jSImYwB1yj6XpA6fKgntehJPDlpJv7v7Cj2B4U=;
 b=SRX+zmidXqlEpaULfZl1oHeMQyxdiEFiW+A/9+YpIIxKEDkI4ry+EBYC
 x71wJFMZHFHILkzxSwWRS7z9JqRhowRpHROHjkQOcLEd8a60Fh/+jR0ZL
 I8phRJsy3u9X8yFrt7aAhnXrTyg7KF322I3B1pXJGJZ8+aCuD5BBt6u1a
 b0FVNVTQePXUAq/AUk/Fszc7X9JOM0B0oCmcGzCZWWWqvLAHQTYXr/yqh
 bqfKzh9j0eN8LJSlsc0aaW2Z8RrZiPDKGUErfaT9HcWXcOt6V7eabg+3Z
 0Ha2a1rQVTmuriipuHhUVTBLFYgXX0A9HMOBoZDcUsUYKssXAYXiu2LT+ A==;
X-CSE-ConnectionGUID: wflngJQDSjSZk97WkSSjMQ==
X-CSE-MsgGUID: psmaW+SQTv+/4qCBvBeMbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11866"; a="96902883"
X-IronPort-AV: E=Sophos;i="6.25,207,1779174000"; d="scan'208";a="96902883"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2026 14:43:01 -0700
X-CSE-ConnectionGUID: 7P4a3q9dS06D9FhdlIUmJQ==
X-CSE-MsgGUID: 27TaFMZMTTK9yypGqCbAKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,207,1779174000"; d="scan'208";a="300142075"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2026 14:43:00 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 5 Aug 2026 14:43:00 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 5 Aug 2026 14:43:00 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.59) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 5 Aug 2026 14:42:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tk/UYbfJpoVeBDrlMCvpV0ExCaktt9S8WmRUHa5/WlpIdANQhx2ccCMnobBNyAk9jsq/spjjTeoffavv2zcx+KwqatuPIf16RWADRPgKxIu1gxK7s22TgKydd7kc9yfVw97MlgSZTEF9Ysx3yd8fC4sjO0TZDmgYdlNlOU3ZrM+F0FhLft4WgHYEax62t3EOvCSJKQIqf20art13ugyEPTN16KXWMgiMZ+TmXEJ6DDn6gHoCriBSwvro8J86Rkkcy81XYoBNhtqq9egvS9pCd2EypJCl/Ag3PGSPXeS5EhP9ld4evWxWAO8SPtB4fk6M9F497fLLpZlQCM1zjz7VTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CG9XKnGHYXwsf9bXQpjdsxNGEdyXGwLtDiNDOclLJGo=;
 b=ZoC3/DadvRwwzFtAY1jYOPEgOyifq6DET2OKYScMfPxAN3C9PgBmeDPM6ql5X8TicQvLfOpARrtrEKibSjx3N3sR5MXBk1RvycZpFXsYU7dL3JGchYlev/nuTzr5aZ23cnUab7ZNRTMoslTIDWV9WgR6rU0kTGnRowuetzH9xvw0G0P2TMz3IQX8o8KR0fX45+gTWQSwlFR1kibSrGqB+GWu2C0O1UrDZa500V35e10UmnE1dwIcfv1hEPXYouHTV8ByN1hekBtUC/YPHt8z294E6SPbtTkY4PapzRlH6uSUEb0tRuJfbF5S+0ZmeQN5EdtdUjovIH+Ofdx3j3zOAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22)
 by SA2PR11MB4987.namprd11.prod.outlook.com (2603:10b6:806:113::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.19; Wed, 5 Aug
 2026 21:42:57 +0000
Received: from DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::f3ff:11d0:7a52:db0c]) by DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::f3ff:11d0:7a52:db0c%4]) with mapi id 15.21.0292.018; Wed, 5 Aug 2026
 21:42:55 +0000
Message-ID: <3a5aef41-7793-4a41-965d-a96a0ff45dbc@intel.com>
Date: Wed, 5 Aug 2026 14:42:53 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe: Fix a bug in pc_adjust_freq_bounds()
To: "Summers, Stuart" <stuart.summers@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>
References: <20260804232218.1736159-1-vinay.belgaumkar@intel.com>
 <30078648509cf682c11e12aa3eb025f2e293aaab.camel@intel.com>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <30078648509cf682c11e12aa3eb025f2e293aaab.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0036.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::11) To DM4PR11MB7757.namprd11.prod.outlook.com
 (2603:10b6:8:103::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7757:EE_|SA2PR11MB4987:EE_
X-MS-Office365-Filtering-Correlation-Id: 3baa7a59-d68b-4e07-53d7-08def33a8261
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|18002099003|22082099003|11063799006|4143699003|3023799007|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info: ocyoNZ6WnWTOUgZaIQxMMZmkfrnbDsKxcT8/5ppVawex5n6auGDHlpUF/sBex02WzqGETNvK6x2ScyR/S5EYVW8/I/S2siofyVbgM0GYNAXB1g9RXtp7m2ETHBRcil8XOj6T8PW4cRKU5s8626+wir7XB2VMin6igSo18kfIGoMEpmzRem8K4ye+gfc98y6bPTxglgvbvZ2SVXLSNRmeApoxGivKmU69L9YkQ8i2LChJcWAtBL5c4w/iry2ravpTwT/H/p1lV0FAqwd9Nj+V9jPv/HGmMN0BimWzikbQQTPJ6QfDFuJzVZOHJO9lRbGL5so0zYo7pkAia+aS2ZGQWgw/m3cBTrF70jR5vDlW8ur63US3TCiHzBV6ByhdLKMrTZ+VYaI8YmHGj86YiYiDRubDHz4/LSjQhsv2D2qk1NqQ12Vy9MxW6K08Mm0ypK1kHJt75F/VdrlTOsRiC9WhRqan+yZg4zLlY9rpX3U6t2VjkYNJsa4qPfE2ParcXP24MjcQVronOr49xCl2JzYWQB0OY8+eOf7D6V6FgnpjcFIIqrLtNIELhvsI78u1RAojOlDmDfh9IfOhHkip1VnBrab5dG/Gn7Tut6RiMy4PpEn2NrXewSpR8/l8szg51qa4bSnGEe7Sb4IqdNMZF6dXPwY+BxUkC7O9T+yJ9GDi5HY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(18002099003)(22082099003)(11063799006)(4143699003)(3023799007)(10067099003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K3dvVThXTEtZOWRIRkpGd1pnWUhMSm10ZFJiekRlTEpmSlp3OG9EcFlCdzdM?=
 =?utf-8?B?MVRLdVk0QnYzTTcvaTBDcUpWYkh4VEFPYnpxYkNZdnhzSU1tNjJ4ZmJMeHJV?=
 =?utf-8?B?VzR3MkltOHlHTUJaVzk1UGZtbXBYS29LbiswcHlHR0paMDJJQThtVDlQdDh6?=
 =?utf-8?B?Z2pMa2kwdCs2Nm9MYmlKeFBXcnBMN01GRWxXc0ppQkVIVGszOTcwQnFNM0V5?=
 =?utf-8?B?dzBjUC95VHpaWGdzU3VqT05sWjRHNFB0bWd3bGxldTczRktOaElqL25mZ0ht?=
 =?utf-8?B?VDFFYjVibVlqZnJtVHlzTVh5VStWNEhWaFNTU3ozNFB4TjE4b1R0OTBBT1Ev?=
 =?utf-8?B?S054QUxLRDBHSHhGRnJ1alkxcGlES2l1ZFk0U2FCS1FPTlhiQURHZ2JpN3hX?=
 =?utf-8?B?SlNtTTI3Z1pBNFNGdHBtQUp3V3F4dUUwTDBSQ3BISlNjWnVGeVBnZThIbEJC?=
 =?utf-8?B?TnQwNXpZN0RXbFZCOUhWeXJORzQzLzRMb2RVNk1CR1ZIeUlQVlNudWU0cy9w?=
 =?utf-8?B?WXFpbXNNUUJUd0tSYTVwWExyQlZlRkJac2VkSWtVVERBSVdYQk40M3UxQ0Rw?=
 =?utf-8?B?TDBVcFZ4QURsSjlQaEJ5eE1PYit5YWwwK01kWUZRZk5WcU9iNEJJQ3NpR0JV?=
 =?utf-8?B?b3p5YjBHcnNwZWFBUkV5T3ZBSy9vRjJic1ltZzQyZEZSUTUrSFdkSU1GSndv?=
 =?utf-8?B?UStQc0xGRS9lMXFaSEE0OURoMDdMbDAvSGRDdXRiaUkzUTVMcUpSQzM3TXpY?=
 =?utf-8?B?TXJhZG1xdXVzcjZnWU5BcW9Xc2V4c2NGaWs5QlgveHA4Tzl6QUVCK3pwT2Nn?=
 =?utf-8?B?LzlZZTdLelNDaFlFdFpoSlFkdW4wQ2pmZnliS28ydHpFRVBTbG1MVHlpRmJH?=
 =?utf-8?B?QXE1RGUzMEhVZytPZUlDaEM2RmE4MTZsUC9UZVFyakowbVJ4SE1Bd3d1YlpO?=
 =?utf-8?B?anQ1blpHSUxhby82emNybHZkMTlQZi9BTHQzdmlyZXNFOEp2RW01a3lpVGd4?=
 =?utf-8?B?RlZaNVNmdHVBaFliRTVucGRxZElXanpMODBhY21WZEdCM1M3V3pyazF1YVdX?=
 =?utf-8?B?OHNDZVJRKzBoOW5YSFRzaVZoR0dKbnpIQmFOWDZlSVhkaVdQbFc5N08vZzRn?=
 =?utf-8?B?aEpKTW55aHl3QTVZVHJ0eDVLeU5heE9kcE9GZEVtUzNqekNPcHVHSkgyWWZD?=
 =?utf-8?B?WTJ1RTVneFNBVEY2MTM2cklYcXFrVW1nc2RDekJWRFRpaU4ybENrdWZRd1RB?=
 =?utf-8?B?MGNianF6ZFBwaDYrSHI0N0ExTHo1M0F2SytpeGpaOHNVT1pnbnNMWEJ5WmRh?=
 =?utf-8?B?SHpVaUpUWTlUUlU2QmQ3czl4bFQ0dmt5cUJ3c2lTeWlINU5tTHVwaVpQQTZY?=
 =?utf-8?B?b0lub25IL0FwTitIakVNMlRUS1ZHQ3JsSHN5eWl5SzdDNnl4amtUTGtBQ3pT?=
 =?utf-8?B?NTBQemJ2aVNwekVnVy96ZGRhWHFTY08xcnZmamZ4Vmc3VHg1ZDhNY1VyTjhn?=
 =?utf-8?B?QTJBM0FjS2g4VEZPdU5JSms4b2FnbTAybXM0cytLUHZRck5wSTRJcGdHd09Y?=
 =?utf-8?B?MHV1UWh2QU4vZVgzaXd6TUtOYXNSUHlsTEtoTE04YUg2VUFIbVJLdU14NWJj?=
 =?utf-8?B?UkdxSkhxdUFkaDhiTVZCVXpualF1OFQrZnE0SUVYQmxORGZSY003ZHdHaHdv?=
 =?utf-8?B?UlphLzRyMStGcjJaZFkyUnRvZllGTWZ1YkkzM1IxWjZUN21WdjVUODZxQzIx?=
 =?utf-8?B?UFZWS284YUVXSGtEZUxxRjlLcnRjci9YWm1lb3dUM1AvWEZic3Q3dHpaNzRN?=
 =?utf-8?B?YTR2Q05kV0lodGZLQVFPZ1djRjR6UU12Q1pxay9hZ0NaSlNZSW4vU3FqNmYy?=
 =?utf-8?B?SHphNkduckVad3hZU3BIKzNKdjE4cUJkQWVrWkkzSHc0TEgzbnU0SEJOQTZz?=
 =?utf-8?B?aXEwUkQ0ZzJGak5DR2dJY1ljaWdLeUZBaHk1RmlCbU1VVDMvU0pJK2F3NGJt?=
 =?utf-8?B?cW1UWGpGTXpwSmY3eXhYNjA4WCtDdkdjK2NDb0JlbHVSVmpUK1FqQUV6Wlkw?=
 =?utf-8?B?TTRIVEdoRVlBN2M3VS9lWm44T3JwZlViMHBmalI1dFl0T2l1YlQ3QTZDWFV4?=
 =?utf-8?B?K1N2akZDZ0oxZUtvSTVzZmg0a2I3TlpHV0FqOGVlTEdLRktEU1dsdnFIaW94?=
 =?utf-8?B?NmNsMEV3aEtVb2d3R1I2MUVNZWhLOGdsRGtBb1J6U1BBRnRXQlNyd2NhQTBW?=
 =?utf-8?B?ZC9Zd2NiNWpmeFhaZEM1R0hNNlpHYURnK1NvbFZuV1dXZWxra1I0RDh0cXdu?=
 =?utf-8?B?dTZWQklUK2JQUHNNM0pGQ0xYOUtaVklrQ1V3NVBFSUJhT0g2dGlDaUFJNC9O?=
 =?utf-8?Q?pA94/TXBA+2c9g10=3D?=
X-Exchange-RoutingPolicyChecked: ABvUhPJQg5ceZOvsxoIU6bMwjb+Nz7ahQcz7xPA6KJeA5MFbmTFbdDssNrY8vkjmSgoKeg1uVUawpFnVPAAVs1cypjoXUVXss0++uZae84lN8rZ1XI+hLHMPrByUFi2Jl+rHzINxxIIyTsqmIzRxA8rt3PClX4RlAfYmffYyKp2yAbyFKq6ck+wS6VkzUMQR7Xm/MzIXF5dlEw1XCKm00WBJgCebwPi4InjFmfkk3fiOGjjNhi+eAv0b3dnDlcnLawN1EuVWwfpKJ95uYF0P6381CY/9PhPxZvGe/WTLQyFb7WNFRboUBlK942NoK9ZjhjMxoH8YVDHF45L9TgaO2Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3baa7a59-d68b-4e07-53d7-08def33a8261
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 21:42:55.6053 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5XJENVUFcGi1R2yE/cYJJPoHI2/RIbcnIpqzz/gsfVyqJ5VQoT+VQ5v49ZAvkj2kilAwNp/pjoYHNBtOm6Q/0/wFoKRayaI0qLvjGWDKw2k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4987
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


On 8/5/2026 1:37 PM, Summers, Stuart wrote:
> On Tue, 2026-08-04 at 16:22 -0700, Vinay Belgaumkar wrote:
>> In cases where min frequency was actually greater than BMG_MIN_FREQ,
>> we were not using the updated min frequency as there was a missing
>> call to pc_action_query_task_state() between the two settings of
>> min frequency. Use the xe_guc_pc_get_min_freq_locked() variant to
> But we aren't doing that any more right?
yes, need to remove this.
>
>> obtain the frequency as a good practice, and cache the changed value
>> to fix this issue.
>>
>> v2: pc->freq_ready is not set until after pc_adjust_freq_bounds().
>> Stay
>> with pc_action_query_task_state() instead.
>>
>> Fixes: bdde16c9ac5c ("drm/xe/bmg: Update Wa_14022085890")
>> Signed-off-by: Balasubramani Vivekanandan
>> <balasubramani.vivekanandan@intel.com>
>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_guc_pc.c | 12 +++++++++---
>>   1 file changed, 9 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c
>> b/drivers/gpu/drm/xe/xe_guc_pc.c
>> index 59f2fa79ad42..3106ac50827c 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
>> @@ -911,6 +911,7 @@ static bool pc_needs_min_freq_change(struct
>> xe_guc_pc *pc)
>>   static int pc_adjust_freq_bounds(struct xe_guc_pc *pc)
>>   {
>>          int ret;
>> +       u32 min_freq;
>>   
>>          lockdep_assert_held(&pc->freq_lock);
>>   
>> @@ -933,8 +934,13 @@ static int pc_adjust_freq_bounds(struct
>> xe_guc_pc *pc)
>>           * Same thing happens for Server platforms where min is
>> listed as
>>           * RPMax
>>           */
>> -       if (pc_get_min_freq(pc) > pc->rp0_freq)
>> +       min_freq = pc_get_min_freq(pc);
>> +       if (min_freq > pc->rp0_freq) {
>>                  ret = pc_set_min_freq(pc, pc->rp0_freq);
>> +               if (ret)
>> +                       goto out;
> nit: line break for readability
>
>> +               min_freq = pc->rp0_freq;
>> +       }
>>   
>>          /*
>>           * Setting GT RP min frequency to 1.2GHz by default for
>> @@ -947,8 +953,8 @@ static int pc_adjust_freq_bounds(struct xe_guc_pc
>> *pc)
>>           * we aren't expecting high power output across board
>>           *
>>           */
>> -       if (pc_needs_min_freq_change(pc))
>> -               ret = pc_set_min_freq(pc, max(BMG_MIN_FREQ,
>> pc_get_min_freq(pc)));
>> +       if (pc_needs_min_freq_change(pc) && min_freq < BMG_MIN_FREQ)
> Should this be <=?
no need if it is =.
>
>> +               ret = pc_set_min_freq(pc, BMG_MIN_FREQ);
> Ok I didn't quite get this. Why do we want to ignore the min_freq if
> it's above BMG_MIN_FREQ? If we calculated as such earlier, wouldn't we
> want the higher value? so this should just be:
> pc_set_min_freq(pc, max(BMG_MIN_FREQ, min_freq);

We already set min_freq. if min > BMG_MIN, no need to set it again. We 
only do it if BMG_MIN is greater, saves one h2g.

Thanks,

Vinay.

>
> Thanks,
> Stuart
>
>>   
>>   out:
>>          return ret;
