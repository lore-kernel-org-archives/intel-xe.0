Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0720FC5DF87
	for <intel-xe@archiver.kernel.org>; Fri, 21 Aug 2026 10:27:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E83010E27A;
	Fri, 21 Aug 2026 10:27:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qodk+0eP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66B1E10E27A
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Aug 2026 10:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787308034; x=1818844034;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=8HEGriBqQhszZWj13xT0hS02PS6EJEj71UO+c1vQAWg=;
 b=Qodk+0eP6u3KKmcdM66NQr+rSJ5uOcIWJQXr6OHRNjSXfp+jxN+/7jSh
 en1JOiUS/UKHJnqA2D7tQbe13n3ndPwV54IJjquhUHvx6FiR0qVyyrdh9
 rCKeLABj5jvbBIP5oLgyHeLOspXCdL4A5XUS3mSOsmNPhT0t97y0/bz1x
 tcElmmeaea0w+pIyfRz+pbQWZTkJ20gZa3yQbvwNzo860ft0dYPOAAsUa
 KUPCWK7in5K0Y6YOEYdsWYTdPyOQ5IXqdsm79QoxceY6J/9P/2C3vy7xL
 xTZxPWUn28bu4BhJnjtIs/4F6r9/Fi6A4gwWyNOZH8zAYKo6ngUonuYbJ A==;
X-CSE-ConnectionGUID: eR7Zr/VBTxmRmOfeGnch2A==
X-CSE-MsgGUID: QxWq3TjoQEaJ5RKsyYQHYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11881"; a="88058412"
X-IronPort-AV: E=Sophos;i="6.25,234,1779174000"; d="scan'208";a="88058412"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2026 03:27:14 -0700
X-CSE-ConnectionGUID: F4+8hoyZTjSmxqa/2qgzNg==
X-CSE-MsgGUID: TSQcyXKERZqekcJrdvz75Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,234,1779174000"; d="scan'208";a="260129711"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2026 03:27:14 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 21 Aug 2026 03:27:12 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Fri, 21 Aug 2026 03:27:12 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.42)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 21 Aug 2026 03:27:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Js02dA0Uk1ss4bpUGjjIRBY5IjyacGND1YWIy0htHLDLy9DA/IWMCaE/7hbbWhEcDELHHuklu7ATrPC4LPAajPwcY+1S7AMqeAh/va2rZd/V86suG/2TkRVAmArA0V8xw9SGv/6LfE7/y30XOb4MYkzwdMIaXXAezV/YjFBbWudG9FF+8BzU/HINPrbG1jaH7n+XAuMuRRmgj5JiG8fIdLgjgtKpk28d2GjflvxVyypQz2YrUVNcdqAPkpfX4MXLrW5pejQ486NUDq+y7nD4/+IpkAb7TLuZsd8aLLHzHo1QWrjBg6wgpQ9kFtvgccfLfqmXzq1HXZQ5HNhDxQw84g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9gZrfbZEisFZB70quMsRr8BINrsOCpfBHgkkBCyEXbk=;
 b=N6+YYshXXcHHiGxLoXWTvDQYla5vYLna1bY3gaBXfzMnYhE7DF7Jjnh3sgaAibDVFF8m11LnKdCxRES4wh/9pR0ZCLJ3WSwXsI8nWBX/bewu3Pxozqd5DFrVHBKXCMOpU6LzS5pc3l9MJ5BWmlL19gdE4UcmAecBNk69wg6rmV1/eyQtKf2EyG0NTFylPfSsl3XJeGxdSrhdE56GusjkWj5tHp3BkLtnQrDgctEuHMnJenrHxT+A4nFokLLMBqepjfGsB62r0dEv2SQIKykONGsMeJivnxOfNeHsBA6UkNxR/vpYZUiyKetofY/BTudAvF9Gv9D6Xjlm93Xundtwrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by SA1PR11MB9875.namprd11.prod.outlook.com (2603:10b6:806:4da::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.11; Fri, 21 Aug
 2026 10:27:10 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%6]) with mapi id 15.21.0339.008; Fri, 21 Aug 2026
 10:27:10 +0000
Message-ID: <5b6312c9-7bd6-4a36-bb64-cd5d63298499@intel.com>
Date: Fri, 21 Aug 2026 12:27:07 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/7] drm/xe/vf: Add bounds checking for queried GGTT
 base and size
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20260812124313.1377582-9-satyanarayana.k.v.p@intel.com>
 <20260812124313.1377582-14-satyanarayana.k.v.p@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260812124313.1377582-14-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P189CA0012.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d7::15) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|SA1PR11MB9875:EE_
X-MS-Office365-Filtering-Correlation-Id: a13d9e0e-fb0c-44ac-4ccd-08deff6ec226
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|10067099003|4143699003|11063799006|56012099006|3023799007|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: yxEQAC+S4T/wYJ4HRhUtz6sPgJDgxzkP2maRxMCRj3IY8f9b7e+FVkLL/nIwIkWszApkURfhrxLZyx3zOkE8f5loWWM+09pB1d7QAfZlkR52Kk440doeUvqW3lFq1IGJSp7kYnRVZKhnLUizf8VPusI0E7QOiCwal2yeOAO9P+i4VDGjyQmvj2dzSG7iyhHzwlFID4T/pgokkaoDZkIRZ9bzkygV8kdQmvUaHi9F/HAcXe0IuXQ+S6fr25Hyyf3Q0HKel73vN99PV+NO9OTm/oIXbtI5Kl2pYkWLAZV8kS9UMAIo4Qt1ybJSHB4wa1E+BMQQX34gPTao2f6bR74oK3ekBiM/f5TpT/q4xd+YDpumlniKY6wTgb74nfytIPXMRTWr8pSGk1vC8KUt6lCYkz0lpqJIx69KtdcraOuGfdlQcoKdupQFTIS1WH5ONrWwqyShHs6nt4mAVfi7DVsyepjF9bcP2SDTBsyqAhYcjAOHnkea+GDl+46xOeoMJReMpO58uQ+XqWjwDiZS6kt1IX6kEwBpLqWKM+Qevi/KqjD8LET81UUBHqg1YFymgXJHVndCZ2ENcO7LQ7lnyI6TSBiw6qypL6h1CKXDHvUMOuBOxUg83Fl+NDof/xDamWU46wr9Zg+aSMJS3i7zT2p6Mw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(10067099003)(4143699003)(11063799006)(56012099006)(3023799007)(6133799003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VXZtblNMdW5hMGkxa3FLUHVtdFRwV05qTFFITTdnZkZCTXBFd3pvM3JPWUFU?=
 =?utf-8?B?QldwOGhLb09XNjh4VHh4SkNmemRhd0wvejhuNGxCVFVxdGRCb295MDZ3OXVa?=
 =?utf-8?B?R2lXNFRyTTM4bEtWY1lJNVc1c3VKUXROUHpNK2dyVWRCMndZKytlVkExcDEv?=
 =?utf-8?B?YUZPTlEvOE13UXpzNjlZNlpRUFZNY0NNZlMyMDdkRjZCdHN3cGVCTjhSS2U4?=
 =?utf-8?B?bTFMaGZMUlFSSzRCWXBjUStQZXBCaFEzWnhib1JVQnB0UkZ1VnVoclZQL3l4?=
 =?utf-8?B?MFp6V29LQ2lONDd2cXlXTTVyUTFLcDVFcU4ySHJCdG9XWHJrQUxjU3lCUncr?=
 =?utf-8?B?ekhWcjVUUzlodFBZTkVCUytxRGNRVmZBUStxc3BaOExoa1VCQmtVdTVBMzNJ?=
 =?utf-8?B?dEt2Tm9lVW1VUEwxbkYrL2YwK3d4b09hN2ZYNjhla1E0MFBQNEdHMlpSZ2FZ?=
 =?utf-8?B?VFF1NkRUSzZDWVQ4NVJobzdIaEMyYzBNd1hQZTJFWG5NQ0RKVkFUbUZJWHlM?=
 =?utf-8?B?R3BZS09FUzFrUjF5dXBZZjR6bkFRbFJWVktSaTdLdVFmWU13YlYyVGVNQll6?=
 =?utf-8?B?Z3ptdno0a2VSVnFtSGQwV2xuRjY5TkxST2FPcHhwTjZWMFltaWNzYmgxd1pX?=
 =?utf-8?B?TUFBL2xlWTJjemxhWXRMUDBRRmZ0eUdzazZNM0Z1K3pmNm5lNmZudmRXaHJa?=
 =?utf-8?B?dUZmQVVNVWlZR3RTUEgxWGcwTndaZ08xalZkTzFaMk5CZEtaSzVFUDFTb1Az?=
 =?utf-8?B?elkrQ3dwL0R6aitLbDh3eHN0Z1BjZWVXSGx4MFpYdDlha2E1bDRiaHlrcVI4?=
 =?utf-8?B?b1gvR2MyS3U1NStkUFVvRXJVdG1JSGVaa1N0dnMvdnhnbVBBeEdPWjZJU2g1?=
 =?utf-8?B?RkZ3QWZrSzlkZVNUc0MrYTcvNExEa1kyUFR6VlhQMXlLNFIxMkJpbjg4OGhH?=
 =?utf-8?B?bDI5MTlwTGFWcUZacVB3VzVBOWVEbFlwL2Fvb2thbHNaQmtsOU12a0dEMmJo?=
 =?utf-8?B?NmkyclZUTytUdFlBQ1RtSUx0ZTd2REZLT0ZsWWc4LzhhQ042cTRsTjhsYVJ3?=
 =?utf-8?B?UFk0Vjl4YjJ3Y2l4R2tkQ2ZKMkpmZEFRYkszbzQvckM0bFp1dDVvWTU3Vmgx?=
 =?utf-8?B?ZlNyWHR3dzQ0VXNsa1pSaUNjbTd0ejBRM0ZPSFVGTzRpR1ZBZTJzYkl3eHQ1?=
 =?utf-8?B?RFhESHBYcUp0OWdUNHN1S29FWXZLbTUyNjNWR3ZyNXdXTzI2UVNNQzVnWjdL?=
 =?utf-8?B?ZndDVkpLZEwvczdwekorZEFtSVorK09Bazd1dmpLcy9tNGp2Q0I2a2xvQXBI?=
 =?utf-8?B?MC9COHhXSStnTisxeXh2U24wcEhsekJ1eVJDNzNpTVhYVGpIMU5QMTBUNHRr?=
 =?utf-8?B?d04rSnh4ZDlDODZFRVczU0oySG5JaG1rQTdRZ0JDeDd6bGd3RytpUDdocGZr?=
 =?utf-8?B?cE9hNkM4Tks1QTNBMzRPUk9rSU5KdVN4dEFZVkJIQzZ0cEwvYkZFTUR1WTRJ?=
 =?utf-8?B?L3cvYlEzYitYbzdLcHhoVTVva0crMUpDbUd3NURaVnJnTmpDdnQzTVcxZXhl?=
 =?utf-8?B?STJFNHovYVlVdUM2Z2g4MC9qUkJYMDhnT0VjbDdVN1hQYkQ0VkQzckZZWjU5?=
 =?utf-8?B?VUxjRHR1WXpuaFRYVmdwNURIZlJBN1o1TUE5d3luRkZtSzdyendsTlJOUDJS?=
 =?utf-8?B?cjNjOGtjTmQxT3BoNktTUTNJVHpiZmVqUnpiSUF0OG92akpydGUrSE40TkpU?=
 =?utf-8?B?M1hIV1EyZEhpSUVaQndXWmdsaFJzSkdhQzhHUWRJV1FwTXVxWTBlMjljTktI?=
 =?utf-8?B?T21ud3VTbHlla0JRakFERTFJbWp6NDNLTnhiTFI0MjZtMXlYU2E4N1d5dDIr?=
 =?utf-8?B?d0I4VFNIbjhSOG16aHVEZEtMSDRENk8rVnJUdjJlOEREdzE0eUdick13UG80?=
 =?utf-8?B?QVhvSklKdFR5TmtOVlZyOTlHYmcwbEpsNlZ0em1MQlcwdlBoWWxSeG9HSlhk?=
 =?utf-8?B?NDVaQmpEWXlLWkt3ekdKOXg0N0xMcVc4SjNVZFhIazdqKzJhbWpWcGZIN29w?=
 =?utf-8?B?Y1JHU1VnaXdXdnNOOGxTeGdjd25lTldPQ0RXYUJVZ25zWm1LdCtLMDlpVHB0?=
 =?utf-8?B?OGNIS0ZIZ2VZc0xmZGxEdFBpQjNZUGNPbzBnTmhrcHVEV2ZhektVR28ramlp?=
 =?utf-8?B?UlpaRUdNdVlZZlVXN05QNFJ4a01YUW9JajQvQzhNMlo5MzF5OFhVd3ZPcjIw?=
 =?utf-8?B?NVhoenlJa0lseWpVR2ptVnV1QW82ZkpiWmg2MU1VdDNLSWhrUVZ5NmlSTCtW?=
 =?utf-8?B?b29QK2NOeHk2OEJ4TmhGZk1kVGlwb0tSWkx3Ry92dHAzWDc5QjFTMzJJL3JC?=
 =?utf-8?Q?4ilXHiq+X5eEK1sg=3D?=
X-Exchange-RoutingPolicyChecked: gVHMV4t/ajmrN7Gb3gEjokMmm7jiTm8kq5HkI/sRioWu3v6o16cbRJo8YVsfrBDBr+xNdOC4P0TyeGEnfu/1TvXwT40S5hcJYi8nkp+15yOV95Dgkao4so97s3/j2kkDngLakf1or8HBEX+9XU2RbHA3BvU58Gd8NtlRnnlWoPQKxVovSI9Kp/qO/FTkvzlAjp7QVEgEkFTHHRB09yDejSnKR/llwvCndRBmq5GsFMZrOBC8GrhUodNamC4xgW/ysPCXCLIG/daWsaUC+MlcqVQTL2Idza6+B30SAqCwBsYILE1W8UdT9X61mTNNTAfbMqkmD6qHD9udKOwT3oEK/A==
X-MS-Exchange-CrossTenant-Network-Message-Id: a13d9e0e-fb0c-44ac-4ccd-08deff6ec226
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 10:27:10.3361 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: desBZN8JFWQDj3K7zphqyH8eTKu1r3pR4AYwnbUDCaPCFsmdq0mhVgI0YKhvbeHIIo4OeQXec8JS4+LApSFGtJBrx18gIoET5XIYAzNpjfE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB9875
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



On 8/12/2026 2:43 PM, Satyanarayana K V P wrote:
> Add explicit bounds checks for GGTT base and size which can detect
> and reject invalid configuration data from a misconfigured or
> malfunctioning PF, preventing protocol violations and protecting VF
> initialization.
> 
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
> V5 -> V6:
> - Updated error codes for unaligned GGTT base and size (Michal W).
> - Fixed review comments (Michal W).
> 
> V4 -> V5:
> - New commit.
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> index 81d68fe5ad7c..d805c064377c 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -488,6 +488,7 @@ u32 xe_gt_sriov_vf_gmdid(struct xe_gt *gt)
>  
>  static int vf_get_ggtt_info(struct xe_gt *gt)
>  {
> +	u64 alignment = xe_vram_alignment(gt_to_xe(gt));
>  	struct xe_tile *tile = gt_to_tile(gt);
>  	struct xe_guc *guc = &gt->uc.guc;
>  	u64 start, size, ggtt_size;
> @@ -526,6 +527,18 @@ static int vf_get_ggtt_info(struct xe_gt *gt)
>  		return -EREMCHG;
>  	}
>  
> +	if (!IS_ALIGNED(start, alignment)) {
> +		xe_gt_sriov_err(gt, "Unaligned GGTT base: %llu, expected %llu\n",
> +				start, ALIGN(start, alignment));
> +		return -EINVAL;
> +	}
> +
> +	if (!IS_ALIGNED(size, alignment)) {
> +		xe_gt_sriov_err(gt, "Unaligned GGTT size %llu, expected %llu\n",
> +				size, ALIGN(size, alignment));
> +		return -EINVAL;
> +	}
> +

as Sashiko pointed out, likely from

commit e904c56ba6e0d4eff5f48a70356fd5d764c2a966
    drm/xe: Rewrite GGTT VF initialization

we are doing some checks too late, including these new one

can you fix the existing check first, then add new ones?

>  	xe_gt_sriov_dbg_verbose(gt, "GGTT %#llx-%#llx = %lluK\n",
>  				start, start + size - 1, size / SZ_1K);
>  

