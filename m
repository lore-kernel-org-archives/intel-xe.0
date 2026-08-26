Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31F3CC61DC2
	for <intel-xe@archiver.kernel.org>; Wed, 26 Aug 2026 10:10:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC42E10EC91;
	Wed, 26 Aug 2026 10:10:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CmIPS8Ru";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6A0A10EC91
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Aug 2026 10:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787739003; x=1819275003;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=v/lPxKGknavjsoQaCT0k/x1dkVXku3a3bxJ42Dk4jmg=;
 b=CmIPS8RuPO/jtp8BR/Z5Om2w7jdv1V9Q73vzaUHgDpi/RE9dWXQxwk9k
 evTR+tXhyapO+nJXyNjOQx+We1W5p6Nc7CDQoCv0aSBxHyHOJXeC6fy6R
 x/OXwmcTXSSWkf1Ppk/v2nRUSU2qD1Yo/GqypvG6IBJdoSTqbdCnl/Xzg
 kD+VfnPLhbXDsgNHK/ZfDPjRzMMYiYvvWYDfCSDgGJhaQGrxbA5DV4/Oo
 TQhZYAF9S/PQhbHVqXx60CPPW0OGPniyNp9i4/MkwzfoFcYY/FByl5ROi
 d14xinc8qimj9T0euLWefDE+Ay/csplg4/V930aqaSsmn1K3oV1oP7TQJ A==;
X-CSE-ConnectionGUID: BZ4nUfcMTFqK/A1JnjY1BA==
X-CSE-MsgGUID: aYbYm0UTQKeDaYTIGPbxIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="88245424"
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; d="scan'208,217";a="88245424"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 03:10:03 -0700
X-CSE-ConnectionGUID: IwsrB05FRHO/jUQ7ructTw==
X-CSE-MsgGUID: f2YernSXRvCd0kTiymC9oQ==
X-ExtLoop1: 1
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 03:10:02 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 26 Aug 2026 03:10:01 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 26 Aug 2026 03:10:01 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.7) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 26 Aug 2026 03:09:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KKqPhUbdNl7ALSDF0CezD/smhP0CyLrzTgxBtnbV31N81QthgmHZlvklSdeFFBvhJKJmiykCJk9wV3gLLGEoshnkq50YlRyXnSSlqoDX4GWqaXTHXxrKuTLdL8H8JQuDGlcUC9z/p4VG1SCIsWj/QoDAq4eHXZ/2EPSyCCEfn3OqBZ+R6w12Kq7DrzQmv60G5WftjJXW9CLsYUPkxZ6cZ094JOXgLaoVxkc8qGSOViiI/GkRwOMsJLrdqIh/un4oFji/g+L3/3CRXwbT/6PEmeQKvLcnQ374ZmAKDMC5JLfxZ3GJrDXHj4J4r3m5AggqRm3o5TqBzVywb5D+HkzTDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a4PR8GHceiQ+a4kJDfXr8W9m7GW6uagxUE0lQMoDQSs=;
 b=p5pRPqZqQGpuwFz0GCtGuuGfmpdxNQZ9CJDj8CWOssSO/zdU1Ph4bu6FxHeO1UznVm8ZBLpcjjkxp3OAequ9qQXwOFaQ/KilFNpKJNS7VmTjDA8Elqq42SXcQZwaBNt/k0kMivtRnDY2KNkQ6BBD03LBDH/190Tucr2/NugeWogwzXP/1j1qsoye8Dxi5dyWWh97qfNeiDKjDHvqmsfCayL3M6q+qI6fYGfIeHzMGGiuJFCStEAi0lq82UF74ukdZUzWtrH9QjB8X3yjbAX+jb5Xm9Nvqfsh2ppMpM66h0nTMorl3TkHHyK4LzzBVsCrchrQ0aF3ZvEYEFexbMQlWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by DM4PR11MB6263.namprd11.prod.outlook.com (2603:10b6:8:a6::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.6; Wed, 26 Aug
 2026 10:09:57 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%4]) with mapi id 15.21.0360.006; Wed, 26 Aug 2026
 10:09:55 +0000
Content-Type: multipart/alternative;
 boundary="------------2ZNHrKIG1xkt0zf4AdOD2eKa"
Message-ID: <a478cbbe-abaa-4a3d-861a-8531b360300d@intel.com>
Date: Wed, 26 Aug 2026 15:39:47 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/12] drm/xe/memirq: Report errors using structured
 xe_log API
To: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <michal.wajdeczko@intel.com>
References: <20260819191442.1957986-1-dnyaneshwar.bhadane@intel.com>
 <20260819191442.1957986-6-dnyaneshwar.bhadane@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <20260819191442.1957986-6-dnyaneshwar.bhadane@intel.com>
X-ClientProxiedBy: MA5PR01CA0297.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:21b::10) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|DM4PR11MB6263:EE_
X-MS-Office365-Filtering-Correlation-Id: f0937f95-2048-4a86-3452-08df035a2cdd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|18002099003|22082099003|11063799006|56012099006|8096899003|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info: DiR5/YIDTuvdGJuIFGc7M2pPX2AhvF16QYG5DjBdgkALj7JmcGzms4fky/Yaw4jiAS7uoKJJ3HBuHRS/WabnfUIKmRPlu1K1oWREU/jThpGFP8BYvA2wvT9vDobb5qjIrB28x/Q8m442l1QxyqbM0Uzsm8k3pkbY7UIw021s22z3vMsysjOIGzirCp44DJnl7N657UKb8Vi5B6LxjRbmzSdYM5qYC1wHmSW9M51msDlAXAHdecL+b792fCy9GQnCxTOEOMFNcXO5E0yVPte8K97lR+Jeu1PgEGUZm2iKfdcNzdzQgo0UUhtcNY3q0lnSf9ASnq7kt1o86MbNeb4ZhVHOFPgMHtMgogFcO3ANdbJSlTGZC7O+gDWhVZd92YUg0kItnmRV5ed8ZRKpsAwJzd6V4UkJ/AvTn1Tfa0rNIfeW0NU49L65iZqQ2LfAYXA0Bxo5paAnXsPEsASv78c6VvntRSBa4js797UAIcALTPR0QA0gxycCBAxwVgqFqZVypc+TYLSqsDoV8tyeDt7axVHHeoMdQsrtmNh9AGJYSlc7f1VtJyQ0+LRY0l2Ce2JJdkZ/tZT4xp/ys+bZkpZDxa7xr8xTBzmo27sJ0OklRMtX8/omb89i6AlYWHtw254vPDPVFalt97uLC2Hd/byIA0iGmDZ19jYlEaEs4d81MA0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(18002099003)(22082099003)(11063799006)(56012099006)(8096899003)(4143699003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MGcvR1VjaDVGQVR5YUY0R1c2aXRZZStSSHBMSE1uQjNUQ2hSc3lwQk4vWkVp?=
 =?utf-8?B?QUxqK2hVRm40anVHWW9QOVk5QUJRZitjVzg1ZlMwRkhJanFQc3U3Vk5oVEhQ?=
 =?utf-8?B?d0xqU0F3U1FiZ2pnSFQvTjlvcVltbTU2dEI3M0tmR2czVU5MYlA3UUlIRkJn?=
 =?utf-8?B?a09Zc0ZFbFpQMXk0RU5saTJwdTBCUU1pMGlUQkpvM0pFRmpnTk14K0ZDVHpl?=
 =?utf-8?B?N1VvQ3F6MGl2MjB5SmJPVUhGc3V3dFlWQndxbVg0SitJTkpkQXZ2MHUwVHdh?=
 =?utf-8?B?UnBTZVRjQ0JPVnYydGgwdkI1am4wL0JjdWFQTUtKYnJ0SUcvbFhIWFlNc3Ro?=
 =?utf-8?B?T25Wak9nVy9UazNRdVFOcitSWjJKTGVvaFQ3cjBPa3Zxc0krRG0zTFR1dkxp?=
 =?utf-8?B?VlBUT1JhU3d5aVIxNUYyMzBTb0FaUm9LdXhXM2tpUGk5TDl3bEEvR2tXN3pX?=
 =?utf-8?B?RzhEZTVKMkZXYmdKc0lRZGVUdXlIUTVEWTc2QTgxdXAzWFBocmxEcU1VaDJu?=
 =?utf-8?B?UkNGdmlQa1ZMczc1aGpXV1NSdWVhL2lhSFEvMWFuR2ZHWTB5b2piTjc4OFht?=
 =?utf-8?B?U1A5WURsbjd3cGZTV0Vab2t5K2dpWjlVTURoeDgzQnpoRUlPc0lMWmVualJR?=
 =?utf-8?B?RTQrLzg2bXlGcCtZVVkxNlJPd2RmU1lYZlpuamVMOHZVT1ljNUNDNjZ4bjlp?=
 =?utf-8?B?N241aHcxVXJ1K0VPRnR4MzN4cjZid0N1bVQyZU5SUUhYVnB2OFlWSnpIU3l1?=
 =?utf-8?B?TnEzUUMrRXExWVNpVGZPSDd1Q05qWTVYWkhCQjA2bEpibVVvL3hUTUswUUFs?=
 =?utf-8?B?d2lqV1hIcHVqNVlXL2FqNm5CSEZQajBoQ3NxRVJ3ckd1Q0tSaVJtRStBQjBD?=
 =?utf-8?B?SklBelB3K2FFSGt5YWVKZHI5UE5FVDlnZnBQUjFma1VOUGdVNElVSkR4Vk9U?=
 =?utf-8?B?eVBvZ29YU3NqS0ZGZVZwN0dHY2QyZUpnMjFIdSt6eDlLQTJWdk1raVpqM3F1?=
 =?utf-8?B?cHJHRHJBQ1FQQ3dnRldmaXBHdDdCYW0wdmdodDNoSXEzTDlDaFQ3b0VtdGZv?=
 =?utf-8?B?MzYyVk9udU9abjFjNmJsaUNqQlRpc21iWTU4VmRSRDJCSm1VZXEweGZEdWU5?=
 =?utf-8?B?aEtSQ1JWNHlFSnh2azR2SEw3R0ZWbTZWQzlPbHVoTGV4emRnelFrK0JSNUJa?=
 =?utf-8?B?RGQ0MDltUWhCK1pkQnV4eG5JajE3T1lFb0VJSkh1QVcxSHZPWWs1MDhPZk1Z?=
 =?utf-8?B?S2xVLzJBckNkUExKVm14WkhwbGFIOXh3TmdLaTNPM0VTMmQvK2cwT3BuRnBH?=
 =?utf-8?B?U2VseGtkRUtWSm9hVDNOZGRBaGZac1Ntdnk3T3hBekp6YWhIYXZ3UGR3a3p0?=
 =?utf-8?B?QXQyN0pZeVhIbTR6ajltc0tlY2RHRkV6ZmNleXNobGU2Vi9GcHdBNE9Ob0NR?=
 =?utf-8?B?eUFBeDUxZXQ0WCtqUVJOK2kyd0RGRldRZjZ6MHZhVWVHYTlKODRDdmJ2T2Qr?=
 =?utf-8?B?aHh3L3ZKcFRuYTFVMkpud1FlWEVIU09iWlJrUzJkQXJyS2VUUW9vSUs4M09B?=
 =?utf-8?B?VHVHZ0Mra1B5MDRpMkhzZFZBWDdZNnpGZitKVUxmZ0EvN2gvUEszRmszQ1Ew?=
 =?utf-8?B?bVZSVnh1SExwOW5idklWUjhvckNQTnNuODE1MU0rd2Z6enFZUUkvR3c0YWNU?=
 =?utf-8?B?MVh6eXJIQzducTRNVSsxaHpETG8vNW96UHlqd2wzcE1iVWZDajZuZUlROG9L?=
 =?utf-8?B?c2lLMW5ZMUg1M0pwQ3hiMFlnNVJ5SkJhRlBEN0pIZDVOZG9vKzRXY1dyQWkx?=
 =?utf-8?B?OG1ZQjEyWXBFZWtsRW1QRVdUbHFBd3pmYkhkUFdlQnkwR2p6R0liblBPYWhx?=
 =?utf-8?B?NlFSUDdSZ2pvTmN3UU9LV1o0c1lNYytvL2ZIeStLcmF5a08waVdjNXMxWjIr?=
 =?utf-8?B?U1ZLU2lFNzlpZE5wR3Z0WWpOdk5wbkQ5T0QrMi9JdHl0RFA2UVRiODJFVmgw?=
 =?utf-8?B?d2hFY1JoVzZqb3hlell3R3JzeWp4NkFlcjlRUFlYVnhlSnlaaGpkV1AwM2Nj?=
 =?utf-8?B?U1lKSzlWQUxXQjZmaXFqaDk0UWlrYzEzM0xLTVp6YWFjS3Z3ODBMWXgrT2pB?=
 =?utf-8?B?ZGo2SUpzTVA0ODBxUVcwVk9SZlVHUnFIdzRGcU1rclc1WFI1ZmlEbE5QR25h?=
 =?utf-8?B?Vm9yUm81aTNyblB0RnVVUHNSL29nNzZiM3NMTEhFYnE5am0xZ0hzclByOTNE?=
 =?utf-8?B?QW9SSnE4NkJKT1c1SlhLMllOUWZ6Zm5YUkV6eVVaTzhuVVZrT3ZleVk1dUlm?=
 =?utf-8?B?bmRMV2J3YVlBS0h1YUhiT2djZ0JTeFhQSUllcWNJcHV4UlUzMG41NVc2M3JP?=
 =?utf-8?Q?uy2F/ie+OuWjx2WQ=3D?=
X-Exchange-RoutingPolicyChecked: j95BRuT+09aB1URV01bJ7AecSdbZO+JoT1Wf6Q5+RkMuNv7Wf7d683p/zi3tLJFYIUA2PfTTIz6R6HFGvwHDQi099+QXZmB+px2G535J4s4xuiYUQ7oKoiNnxG5t9tDMmeoYrm+BzNOdO0wYX2LC32zWzlrISJSqbf8qpAGlCVGe4qeriLGXJlphWcf6M5N2pxOGl6+57txC0IuPPeodg9jCtvBkHEd4h4RzR/gcGxdUS3Eo3qegr4VycxauF065AfN6WTPPzN58O0z9Yn06g2keQr3PJkFPjGdP7//syUWyyKCHR0TsbsD2toGYmeGcgEkyyoiJ1PrL7CNLHLo4jQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: f0937f95-2048-4a86-3452-08df035a2cdd
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 10:09:54.8149 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PGNWpNmnLvwZybe9fYExGSIMA0yAhWUeXE2k8UylL8yCKdbAcmkAqf4NsscgAiFMYZcRxJXfGSiameJsE9zFIEmsTH6vGjIfBeMgeGXFJVA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6263
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

--------------2ZNHrKIG1xkt0zf4AdOD2eKa
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 20-08-2026 12:44 am, Dnyaneshwar Bhadane wrote:
> Replace memirq_err() calls with xe_log_err() using the MEMIRQ
> component tag for memory-based IRQ failures
>
> Signed-off-by: Dnyaneshwar Bhadane<dnyaneshwar.bhadane@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_memirq.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_memirq.c b/drivers/gpu/drm/xe/xe_memirq.c
> index 9dfe965cb46e..45eae58d418f 100644
> --- a/drivers/gpu/drm/xe/xe_memirq.c
> +++ b/drivers/gpu/drm/xe/xe_memirq.c
> @@ -15,6 +15,7 @@
>   #include "xe_gt.h"
>   #include "xe_guc.h"
>   #include "xe_hw_engine.h"
> +#include "xe_log.h"
>   #include "xe_memirq.h"
>   #include "xe_tile_printk.h"
>   
> @@ -232,7 +233,7 @@ static int memirq_alloc_pages(struct xe_memirq *memirq)
>   	return 0;
>   
>   out:
> -	memirq_err(memirq, "Failed to allocate memirq page (%pe)\n", ERR_PTR(err));
> +	xe_log_err(xe, MEMIRQ, err, "Failed to allocate memirq page (%pe)\n", ERR_PTR(err));
Already logging errno, no need log again, drop ERR_PTR(err)
>   	return err;
>   }
>   
> @@ -370,7 +371,7 @@ int xe_memirq_init_guc(struct xe_memirq *memirq, struct xe_guc *guc)
>   	return 0;
>   
>   failed:
> -	memirq_err(memirq, "Failed to setup report pages in %s (%pe)\n",
> +	xe_log_err(memirq_to_xe(memirq), MEMIRQ, err, "Failed to setup report pages in %s (%pe)\n",
>   		   guc_name(guc), ERR_PTR(err));
ditto
>   	return err;
>   }
--------------2ZNHrKIG1xkt0zf4AdOD2eKa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 20-08-2026 12:44 am, Dnyaneshwar
      Bhadane wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20260819191442.1957986-6-dnyaneshwar.bhadane@intel.com">
      <pre wrap="" class="moz-quote-pre">Replace memirq_err() calls with xe_log_err() using the MEMIRQ
component tag for memory-based IRQ failures

Signed-off-by: Dnyaneshwar Bhadane <a class="moz-txt-link-rfc2396E" href="mailto:dnyaneshwar.bhadane@intel.com">&lt;dnyaneshwar.bhadane@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/xe_memirq.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_memirq.c b/drivers/gpu/drm/xe/xe_memirq.c
index 9dfe965cb46e..45eae58d418f 100644
--- a/drivers/gpu/drm/xe/xe_memirq.c
+++ b/drivers/gpu/drm/xe/xe_memirq.c
@@ -15,6 +15,7 @@
 #include &quot;xe_gt.h&quot;
 #include &quot;xe_guc.h&quot;
 #include &quot;xe_hw_engine.h&quot;
+#include &quot;xe_log.h&quot;
 #include &quot;xe_memirq.h&quot;
 #include &quot;xe_tile_printk.h&quot;
 
@@ -232,7 +233,7 @@ static int memirq_alloc_pages(struct xe_memirq *memirq)
 	return 0;
 
 out:
-	memirq_err(memirq, &quot;Failed to allocate memirq page (%pe)\n&quot;, ERR_PTR(err));
+	xe_log_err(xe, MEMIRQ, err, &quot;Failed to allocate memirq page (%pe)\n&quot;, ERR_PTR(err));</pre>
    </blockquote>
    Already logging errno, no need log again, drop&nbsp;<span style="white-space: pre-wrap">ERR_PTR(err)</span>
    <blockquote type="cite" cite="mid:20260819191442.1957986-6-dnyaneshwar.bhadane@intel.com">
      <pre wrap="" class="moz-quote-pre">
 	return err;
 }
 
@@ -370,7 +371,7 @@ int xe_memirq_init_guc(struct xe_memirq *memirq, struct xe_guc *guc)
 	return 0;
 
 failed:
-	memirq_err(memirq, &quot;Failed to setup report pages in %s (%pe)\n&quot;,
+	xe_log_err(memirq_to_xe(memirq), MEMIRQ, err, &quot;Failed to setup report pages in %s (%pe)\n&quot;,
 		   guc_name(guc), ERR_PTR(err));</pre>
    </blockquote>
    ditto
    <blockquote type="cite" cite="mid:20260819191442.1957986-6-dnyaneshwar.bhadane@intel.com">
      <pre wrap="" class="moz-quote-pre">
 	return err;
 }
</pre>
    </blockquote>
  </body>
</html>

--------------2ZNHrKIG1xkt0zf4AdOD2eKa--
