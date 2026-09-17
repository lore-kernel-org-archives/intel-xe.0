Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5841C982CF
	for <intel-xe@archiver.kernel.org>; Thu, 17 Sep 2026 11:10:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4948F10E6C6;
	Thu, 17 Sep 2026 11:10:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dLfzCEUH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA16110E6C6
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Sep 2026 11:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789643422; x=1821179422;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=R4RPsugD0GxMkHPKMfv98Gu/jJros/ZHO0hT043naxQ=;
 b=dLfzCEUH8XdYU6600yijMPFfpOkXKoeENBV2+dlM7szsS3jzWsIy0bdN
 D1JEysoq2vCTcdZi5DefCdqnmbi8VrniwzRtp1iPMmH3INmRbJ5QyGMxR
 mNqVzXNIIO0aeDhPhoFvG14zgjz8527bPbc7MVeq/dKs6FPyIoowgvTrX
 pyScp/sgizAoRs8mU1ZwoVV+xppaF8pn4R9OgX4p0Fuqpe/v/DKHTWgxq
 EHNxafEXaqCLO3rcutebnRW2LzI+J7v6D1PDPvMFMR9kMqOH+1/2MMWKR
 AeFWqRJnEYcIapPfWrcFhSIj0YwQv6V5DamfmiOQMf3HKdlybWytTpSib w==;
X-CSE-ConnectionGUID: +2wwy/02Q9C0NeRrtnotCw==
X-CSE-MsgGUID: Jm1vA39fSiuvNn5yCc/ZlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="90070043"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="90070043"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2026 04:10:21 -0700
X-CSE-ConnectionGUID: +419hxc4TWqxQdTxP2o+WQ==
X-CSE-MsgGUID: VT3q1EWSSdih6BlLxAm8qQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="275672639"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2026 04:10:20 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 17 Sep 2026 04:10:20 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 17 Sep 2026 04:10:20 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.60) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 17 Sep 2026 04:10:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l8vveSs5c00lumHQ4vnNZ3Nw2UD2m48BF3ddUTwTA+B7uGcjXiB4B3FYKhNGjNgcbuR0SVMvq8o0/V2d/6pvPz6ebLYuRe9pmZsXXRQ5VTZi+DPARXZ6oM9rlTbx63+aIOZMJk3ql3nPWgmcH+m8tFLqH0xO5uzEtIdOH7n+8B4GfV5jr85+Mt3wrILltxVIOl1GTisxOxfvptP8jwSXvIQI1l47Yo+wPIzDtIED9UHozgxV+umz59ecksIzRGMFORomAfJaXj0gwOFHVl3TVlbniecVNQiREXOWH8GfLtGR026N4si+H07sGLB3OMlVwbIvQt/4oKF2khSSOY4RYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1HTKYCL58VfIrBXR2+xIJmEQOeda30UQ3dqHX9t6w74=;
 b=yEM+xjblkE3koGg6VbydYbgUH/ZnGNB+0NvHFr1ql1jh3YXm4Br6+oAikCYsHVpkQA+9RaXsVLcEs4qu6LHq7hed6GX+xbifKRjLGoOsdMmCcaVz0OeiN+AyEncB7h2nJuNLLP9AiofcvHvux6neLRpXdg+qCpAydnpnIgcMz0ejvyyDXZBTTEZlX60//Dj+Ie/v/21VWn+W3jQNtdZnJfoNJwjXnIaVSYfGOXNzbU5oBrh12X9gxWg2folFYSfsC5fKlPGgxBxKPconDq+8JAiMIc4e2hCk74wNDoWT8vCI0i8EfqACXbIXL4H1AvVhL3xAQlMO8YnLhMhHpbZFTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by DM3PPFEF920636F.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f5d) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.12; Thu, 17 Sep
 2026 11:10:18 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::5a5c:9c7a:cd1d:d687]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::5a5c:9c7a:cd1d:d687%6]) with mapi id 15.21.0428.011; Thu, 17 Sep 2026
 11:10:18 +0000
Message-ID: <e0c13150-696d-43ed-aecd-3fb09c4a0a0d@intel.com>
Date: Thu, 17 Sep 2026 16:40:04 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/guc: Demote uncorrectable local error log to info
To: Varun Gupta <varun.gupta@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <zhanjun.dong@intel.com>, <daniele.ceraolospurio@intel.com>,
 <michal.wajdeczko@intel.com>
References: <20260910045919.2280655-2-varun.gupta@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20260910045919.2280655-2-varun.gupta@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0100.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d1::8) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|DM3PPFEF920636F:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b69e033-0840-47c9-2ea2-08df14ac4193
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|6133799003|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: qdx40mGBY0WhSZa5jcsSKvLhrRzzQYCX4WHpfWO6VLHU7CuLs/fllq8euAfLWzfDybFBSte+TLOq1bQge5vZn9ea71frwty9mr0368+D1B2i7bYQSg4G/6/aJnFfqGBIJfNE5a0/jBq/snsTdrfz0bFSwpHJOfWozOJMa3w0BYZBJh5MERuJ/6VMrRQ2HhY3EQ5nM7TUueDk1tVKGsl48egOvZAq0VRF2D3ixb+sOU52muM3MZqb0P/TvPyAmCfjCIBFJ8zHn/8+hMaZIUIZUrGuC8gxMK/UFhJRsjQY+6+yzITKtb6iYwol7G9fPHLbLFTfSQIQQAUgENbFfOT+7sLzLG9hqucsdTTqAEhXmRIs2O16bTlVJRP/Po+lPo1SgouDBDAoxM12zCgDEMtDQPLPvucxflrhzFsQrk26+L3Q8ugIBHRF+qDpMlWgoO3BmZm7lZBAd349bVCTsTCQiZ3C0/IxyZs0D1UK/TH8dHrpqnw1Flk1x/jXjoWQ4sCalOMu2RCtnL/kryPd+hJ9JROD1QhVj3zRK/mMvI7+cp5jb3cQNMWELcK/qGxfrGwIdjNiuM8UNGDe8K7VbiMNqOm91/pV2FYu0RHkwUgagbJn+nT5C6zMO6DXv5xZihgyX3Q5BbiE6V5UgI+oP5wX2ZYg0S3smmZEzSsB4Thca7Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(6133799003)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R0Y4YXF0Z0ZIZkNpRHE3ZVpPN1AzWkxKT1pCbXJ3dkpNRlhaMDJOVzJsUVpH?=
 =?utf-8?B?WWhzMTdtTnJGM1RqeDk4dXUzTHJ6c2FrQXhjZFZLMVJseDljS3BNNEF2ODJW?=
 =?utf-8?B?MndSemV6WG5NT1JzWkJ4UUJCaFhCSngwME90bXlEZGlyVytrdENuNlk1YTk2?=
 =?utf-8?B?VDdPRzN3U1FRT3BROXRWaWxGUHNLWmMybFY0aUdDeU9DQ1cwakJ4V29PU3lw?=
 =?utf-8?B?UGZlMC9ueXY2N25xZ1JaejN6ejVweC9CUDZaN3YwR2R5LzgxOU9rdHVJWUkv?=
 =?utf-8?B?Y2RqU1lYVTZzeTZycDVZRUN1Nmx1akRVcW9IVlBKZmxZUzFQbjBVenVSMjh4?=
 =?utf-8?B?WENUTTEzNHRQZnAvdTQycm9pUWtOY3dsS3dFTHBHdlZ6a2V6TFRnck5CWjVo?=
 =?utf-8?B?aDNHdDQ5UXkzbHJZQ2tNNEdQMXpBdXV1U1lIOWpSOUZnbFI5Qmhad05OK1dJ?=
 =?utf-8?B?SXZUOEh6ak5zQjlPL2licEhjdlRZekZDdHljRUFUSnJNV3U4ZmxuOUlsSUFX?=
 =?utf-8?B?MXM1WG9jRnQ3cGhhRnA5dTh2UEJUekZiSTg4YmZySExnbTJDU2dhSTZremZz?=
 =?utf-8?B?S21mcDQzTGx0ZGRzaUR4YS9tMGwyTm8xKy9obUdZZzFIQzV2UXNkdlVLRGQ5?=
 =?utf-8?B?a3d0Y3B5TlZTb2ppMVlzVFBHN1VLSWRNTTdFQjNVRWp6ZElzbExhSWVUTmdP?=
 =?utf-8?B?UnhwMnZNNVZ6QVJUVUZXb1ZsVWxrQzA1QlZIWDZMNnlzajBsaVNJdkoyV0xN?=
 =?utf-8?B?ZW5wRGlHY1YxVzJnQ2J1SmdqZVBNanZqZHF5c281bjZRdlphMTdTS2RRRXJH?=
 =?utf-8?B?N3dic2VKclZFbFU1dnBXNGUwZW9Kc3BIaW5oMVNrNDZXUnJJZFNoQ2d6Yy9P?=
 =?utf-8?B?eEdRcll1WGZtMlRQbUpKejllY2ozZlUwRlUvR0N2Z2Q5dkt6RGtYVndXZ1hH?=
 =?utf-8?B?RENwRHgwVW1Nanp5czhvQncwekZ1SjRDcFdhYzRwWmhvN3Y3Ri85WGZ4cHpq?=
 =?utf-8?B?S1drZVVMbm1pSkNZMkJtWU1ib3cwc2FIRmRLbkFPdlRTTW1hRjBWcEdZNUxC?=
 =?utf-8?B?RmJyS2tOaWc3TTAxV0VPSnpwMFRtS21BbVBQTDhMYzRuT292SU53TlVSZ0NL?=
 =?utf-8?B?WGZxRUMvdnZ1SHhvQm1KVFhwTE1JY0J2bjdjclRDbEV2d0ZqOVE5eTcxWitQ?=
 =?utf-8?B?MmRWTG5OSm9oVStWWDIzVGtocjZld1FnS3ZTeHc1QmJNd1l0RTJiL3ZlaXcy?=
 =?utf-8?B?UHZlOVI1NDBYVlFxZ2F4Zm9nZkZIVGV3RTZJTnI4aVJXdWNDcTNOTkdSKzRp?=
 =?utf-8?B?N1hvTzg1WnQ2dzVGbkF6b3ViVUZLMHBXRE5pMUdzL01ZRDFzR1BBRWVjdGtL?=
 =?utf-8?B?Y05Hd296UDRHTWxjOVhuVmVydy9tLzFVTUMrMFlQeEYyNmtMR3lFdGZkR1dM?=
 =?utf-8?B?NG9WZzRieFptL2NxR21KQTBObVNLTmhNMlNXaWZ3MWl5b0xwRFRzQkVEM2dy?=
 =?utf-8?B?bEV6aFIwOHZaZjE0ZEdaNkJ1R2JBUi85eTY3Z0VsUXppY25EaUoxYlp5SXhZ?=
 =?utf-8?B?UWZoVjUvUGFFWGtqTlZudHNsMDVzYXF3T3FjaFcxb0tneVZTYkFOa3E0V0Zw?=
 =?utf-8?B?WGVOMVRUMXZ3ZHh0UG95eWxESEtRalRNSU9hWmhMWXhXb252amRHRHRRSW5E?=
 =?utf-8?B?eXZwUmpNeVdwM1ZwdnNZejVLUWVnZ2ZrTEZneGZweWNiLzZlV29TYUdiWHVY?=
 =?utf-8?B?MWF4b3hiWEpMRytEYmJBdm96T09YZTdvaEwxMTV4SEEvalg4UEYyZisrRzA1?=
 =?utf-8?B?R2FCMVU4cm1hVTkzT2w5SE1sbUVDUENweFg0VEV2ckx5MDd3bFZkRlI5aE1p?=
 =?utf-8?B?djNvQkRTZ1Y2ck9vZy9SS1pIZ2ViV2FjNDNnQ1dEcDJWcGt6N1ZOZWlpamdK?=
 =?utf-8?B?Mmx6N21tUlo0cGwxTndDcytBUytrbnpXQ0NjTHI4UXRDNElhMEpTNisyeXJ0?=
 =?utf-8?B?dTM0K3QycHIrMHk5U1A3b1k5czdFYm1QcmcxSWxqYkRibjNaN1IyVGR5WkZY?=
 =?utf-8?B?aHdoMGlCOE1tMWZweTdjemFUMngrT3VZcnZ5bHV6T2MvaDRMM2VYS0NSQlRC?=
 =?utf-8?B?d3RGc0ZRMkpOditGamIxMjFFeXgyU09DbmJHYU10R21iS2FtMG9GUTFkSUgr?=
 =?utf-8?B?VExYWUt1akNuUVcvdW15OFk5dVdGYys3ODV2SnYwNDM4bW9aUjk3UHJZNVNO?=
 =?utf-8?B?WVowWFl2SnhEUkV4YlpGaXZMTkRPaU4yN0I5RzVORVZManJRUW5LQVNrUnRk?=
 =?utf-8?B?NThIMXFJTFNXMUc1Tlp1K1hkUHhTYjYxL3JDeFFmUTNKOWhBQmpTKzVjMnI4?=
 =?utf-8?Q?IBpT0IV6MOmFgXoE=3D?=
X-Exchange-RoutingPolicyChecked: hzaMXB0i1m4gXIJkO5Y0wJK/UH64JKLJ8ZwXhMS/decNtVMZKawIv9iwmuAq+zSQyh19z9vmxOceT5onKpU1oAYwCj/ZgaEl7xSkOf7RPIouaxMBz8p1yqPX5e9BQOTouZqPnJH3ir0usut0NtonYa3NyHw4AKvF/hoEqipo4wewpspNCcmogoRYNuXZRInLFI3327YYUiCKqiaUnPXdICIAd5t0PQJqfVtHezgxpdfQ++7UhHLzXGY5lY8xYnVcSmlnH2CO7q9suEFVyazHYJ/Rb1fRnUfRu+kmEmCbLuVUN6Nnq/m1ihkVoWYVgAZmN3Xiqsv6ZooDvTqyP4OQ+A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b69e033-0840-47c9-2ea2-08df14ac4193
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2026 11:10:17.8963 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QqL6Y3J6i5PIVP1ecBFyNxLeWqqa+IV+6blxikXm2qIMJ7k9vhbEq3/40mVy1KEpFMf74viu/N17UMf2HhIflCe6btCCcKAq3C64HR0sBBU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFEF920636F
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



On 10-09-2026 10:29, Varun Gupta wrote:
> The UNCORRECTABLE_LOCAL_ERROR notification sent by the GuC indicates a
> local, queue-level context termination rather than a global device or
> driver failure. This can be triggered as part of expected recovery flows,
> including intentional fault-injection tests.
> 
> Printing this at ERROR level is too noisy and causes false-positive
> dmesg-warn failures in CI. Switch the log level to INFO, matching the
> adjacent CAT error handler.
> 
> Fixes: 4e57574fa3a3 ("drm/xe/guc: Handle GuC local uncorrectable error notifications")
> Signed-off-by: Varun Gupta <varun.gupta@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_guc_submit.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index f3ba8abfc228..e0662bd9154b 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -3495,9 +3495,9 @@ int xe_guc_uncorrectable_error_handler(struct xe_guc *guc, u32 *msg, u32 len)
>   	if (unlikely(!q))
>   		return -EPROTO;
>   
> -	xe_gt_err(gt,
> -		  "GuC: Uncorrectable local error! guc_id=%d class=%s, logical_mask=0x%x",
> -		  guc_id, xe_hw_engine_class_to_str(q->class), q->logical_mask);
> +	xe_gt_info(gt,
> +		   "GuC: Uncorrectable local error! guc_id=%d class=%s, logical_mask=0x%x",
> +		   guc_id, xe_hw_engine_class_to_str(q->class), q->logical_mask);

Sounds sane and matches the CAT error handler.

Could we ratelimit the GUC_ID_UNKNOWN branch too? keeping both paths 
consistent with the CAT handler.



>   
>   	trace_xe_guc_uncorrectable_error(q);
>   

