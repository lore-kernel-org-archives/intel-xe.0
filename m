Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61643CA600B
	for <intel-xe@archiver.kernel.org>; Thu,  8 Oct 2026 13:08:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F250110E840;
	Thu,  8 Oct 2026 13:08:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UyAARLg0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BE6C10E840
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Oct 2026 13:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791464894; x=1823000894;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=sqMYhjgMfwsKaxbhxu3gn45WSnijj+hiiIl1z8R2SD8=;
 b=UyAARLg0C2djYepS/N4h4N4R+XfkJmM60i2q+vxZgoVGEkXT0VQSyl0g
 il7f3o7uRyLWW5J2wXscFT5SvmJ591USpxQ0j20IG1UMSsjxb6BHIQHyK
 wFpt/m/fT9jK6uSVZYaOwKyLnmKO7aY6kANceU/zAu5NpPeX9SwJLe1lR
 wLO1JIvUwxzjLlXfGXy/c7r8+XsYZVgqdjKImGP8hoRzxzltH6QyHYU+R
 mlMt2AhQCHxce5vMM6ajb0GCimzfi5PMC2xDEMFs4UFeMcJ0LxdvuSvXc
 OVxK64LIw1nQmgEwhsrf0eAg/4Yhv6RzaumnFYj1m4rY/4QFTHdb29R01 g==;
X-CSE-ConnectionGUID: C9CqIwM/T9+GoNMBL+eLHQ==
X-CSE-MsgGUID: rE+37593QyaGusCRzx/IoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="249843"
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="249843"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2026 06:08:14 -0700
X-CSE-ConnectionGUID: HkbDo7jzQyCmfJgQoV9iCw==
X-CSE-MsgGUID: HNCMhbA3Szaps+bpUk3zpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="402115"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2026 06:08:13 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 8 Oct 2026 06:08:13 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 8 Oct 2026 06:08:13 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.13) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 8 Oct 2026 06:08:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nkd3SGnN81X4iK6NLEfPZGY5nbGqD/DbOV14T2pBUoMbcJ7LYzTpphrZfEQsNdKalDMTKH1XQsEZxDEzLB1UFIqfv5M2tNuzt+ZzDEiqV0ubrTw+i9YTHtexl/tjZvRuY0iAbweKfR6rHP6XFOdXepg0wogwmPnypljOHepj6Ib62is/9ZW3XW1+advYOTHed4lwtE4KV+qMReIeZmIHoCofzQPP0DR84Qi7iweJ81xCpgJSdRLfSxxuElwlCLXBTEZzwiGTIf4HdFUfZ3ZCjz7zsQV81cmzS8+L6zpgdGUz4CaNKrAnsbyWNG80XG+9vSHzILvn1WeHDlSq2D6+qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vdisGF8XHvbRhPlvYoBxm+okROP3m4oAgpQ9R/CsQQg=;
 b=ToJl6SHRHPoV67Z9zsgGcFMunJPjeKNb2h9Zoamv7daa+NNlns40cOYF25OrIcaVTgR0p6BZ7qn2Rteo8BL2ubdGbMVpZdsrLzAHv+xQ3a8ZJ16VjXL7U8yaB4D56pS9mDCHiC62uM7CLK5TYapgfnXZ3oCMti3XsqQCo3JKNogjgzfs+juy+8ELE/G6dgoiOzs1OAkWNfeUa/rDf+I6EKrxQjuRzIGpY4rlhiW2QknQ0cnllfO6NB67fszQZy8gP7XczPBEEb0vSUm2/7x0cJydm4OXomARwOQfxTVVBChl/Tp5xsL91A5dCjiNuLujSjuABDJJuvI7s5eludQI5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by PH0PR11MB5207.namprd11.prod.outlook.com (2603:10b6:510:32::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.16; Thu, 8 Oct
 2026 13:08:10 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%4]) with mapi id 15.21.0472.016; Thu, 8 Oct 2026
 13:08:02 +0000
Message-ID: <9e4d4d8f-722f-4847-b03a-4bb026309f48@intel.com>
Date: Thu, 8 Oct 2026 18:37:54 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 10/12] drm/xe/lmtt: Report invalidation errors using
 structured xe_log API
To: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20261007211417.2093611-1-dnyaneshwar.bhadane@intel.com>
 <20261007211417.2093611-11-dnyaneshwar.bhadane@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <20261007211417.2093611-11-dnyaneshwar.bhadane@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0081.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1ad::10) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|PH0PR11MB5207:EE_
X-MS-Office365-Filtering-Correlation-Id: e8f6e646-b553-4b3f-ca30-08df253d2ed7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|56012099006|10067099003|11063799006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: RxoE+fZaLWuF8B84pNCGPKefvU4/VTFb2MFnaEvq1qBHIu11o+hVS8U9GunBL56XhQ1nnRz2Q9O+T2qV4KOy7dzUJOeIParztpEnUi3awyfobSrXT2nyVgCAPweavd6ZKRW1Dlw21kJfV/4zbE2l400DwpCaZmT3vGbApx+NxaMowN+ubyjZ50AC1oG3DZ0O6XEN4M5HvorE39eeykY30MFJ0+3QMqXl+9ciT0vQ8YtqST6xdaFbQD5wGA+35s9BftoL9htr7YaruOdO00EskDsqgIKBJWReluuURB60CBaYT3AxpcG4usBbeMxjuv9XVL02o8V9CFYDPpc6pJusRukDsndxwkiAq6VWahCWVdk8fo8FgurOPIeT0VGn7EIyxcmEepaDC8NCbwo6EgJCjdYdLl+UZMSSh2nIxR0WBtWD2ZjigJnubHhb1FzEsFgG/NT78QZyB8OzUf4+NR4tONBacGMX3Ia6apmL2kCZV+Gzn6g4tQlp+lHT3IafpNj17MqPr8fud5hkC5QoyrWp+HgyH+jWl5u0FLOTDO9eTnNWfsO51w6JXgc9WnHlLxzurNNsCz7dIS840gKHqOQ9fB20GvjrFmVlCKDPNCxAwoMDNU51rnSBTMYfsQz2o4bsTMozpFPexHpqptow1arqtRxPfmHJNY6MwguHj1rWGyU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(56012099006)(10067099003)(11063799006)(4143699003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NytsOE10bVdqUUozQnJUbmhNZnczRjdZVEFlazhlNDE2eHE1QzB5TDJTdU1a?=
 =?utf-8?B?TUNxWUZscFdTdXMxWWk4Q29mcTR0eXRzWnJDQlFCeHlRb0lBdmdJd1FwU3VM?=
 =?utf-8?B?VUdCQ0NXQ2ZmTWlCN3ByOVJiNkRWZHRGTnl1eTRWcCtkNzZYMEl1NmwxMjVL?=
 =?utf-8?B?T0NkS294eFpZVkxNaTZtMG9yUTZBK3NyR2FxcStYU1FpZUNhazZTc2lCVmMv?=
 =?utf-8?B?YXpGamRmeXVVK1lKeFQ5SVdwWVlFellnenorVFhaY0hCTWI0TXBpcjI4Q1h3?=
 =?utf-8?B?YkRReElzaGNicDZ0ZWtaTFM3WnFGL1ljbG9wS0JjdWhyS1VpenZxTG5IbGFj?=
 =?utf-8?B?RmlwOEhGNFV3M01PM05kenBaaFRWTUEvOHFJbzNEUGp4TVBmSlc5YU9qTjEy?=
 =?utf-8?B?azFDL2JGMFVRbzRKUjlkakVGZlpTVU5heHo1bEdPQVpJYmIvenU0WXB1MVB0?=
 =?utf-8?B?SGszL0JENEdIOGNFOHAvcEhGZzA0dGIveWN5Mkw5a0d6NVRXMjducVJicmJW?=
 =?utf-8?B?cDBwT2RtZHV1eXpqNUN2WHV3L3RyQnRhK0sybHI5SDYvbVRkL3o0MXpXQVh5?=
 =?utf-8?B?cmR6SGg5RXlURWNmYVY3bUMwbVY3dExaeUF2N290ajJBSndyUDJNVFRzWHBj?=
 =?utf-8?B?U2FLNzVydHYxT3dzZTVPZ3FWZndsalZHZzMwVmJiaWZmUjFNVUp1MHFiRGtE?=
 =?utf-8?B?RDdlc2szclQrZnBVUVA5bGtxcnFmVnI2YzZXQzBsZ1RPOExKM3lWa2tKWUdL?=
 =?utf-8?B?c1hFQllSeW5KNVMweml6bjVNTzVPUGtSMlpXRXo2c1NsS1VyZm9YK1NTRC8r?=
 =?utf-8?B?YUZaSWlabnMvT2Rtd29yNU0zQ0RZZ2x4d3Fzam1FRGl3Mld2WGt0ckw3OXFy?=
 =?utf-8?B?UjBTNWFDaXJFN1gybTFBMWVqRGlLWTNSZjdDRDJvdTVrWXFpOVpLWGNFdGdh?=
 =?utf-8?B?UExhWkJjbXlUMFVXRkhKM3BOcWM3djlNdE1uL3Jlc1g3eVdJYlE2b2dET1Rt?=
 =?utf-8?B?ZEpDVW9aSGFiSkhmSHRHcFNmN21tZ0ZmMTNzeFVneGIzT25tZ2NORytLbElq?=
 =?utf-8?B?MDJiM3ZBR2w4bE8rQmRPV00rTjlYdHBraWhYNkwxMGlzWDR0YVRXbm9XbzRO?=
 =?utf-8?B?QkRPRDdUdnplNk9UZTVHQlh2YURKeU5QQ3dtTVJva2crOVBEQWJ6Tkg5K1Yy?=
 =?utf-8?B?dTM2V2tMR1g3YlJocTE2a3hOVUt0REdyYTMvSXNYMXJaajFHbE9rTytTb2Jt?=
 =?utf-8?B?Ri92UjdxQmxsaCtyQXhwZDBqYlR1VlBBTzlya3M4UDRSMmFMeE5rN1YwWEh5?=
 =?utf-8?B?ZnZ4UE00MnFIdi83cnVsTnhLTFg1S2dYcFF1SG5GMU5MU0Q1emk1NHZSc3pO?=
 =?utf-8?B?VlFJTkRISnZ0RFkwajRqeklPTU9XRkY3Zy82Y01yVDl5Zk9SK3o1di81Y1BY?=
 =?utf-8?B?Q1RoUk1jQXR3clVRYTV3MUhvZDRMWVNoUGl6ZzY2NTVsTGhqSDNCVzlGaDYv?=
 =?utf-8?B?amJNWXdpdkZFK1RVVFNrWkZ4TmhtRHdUd0VaZkxxY3RaU1Z1SmxDdWhheXoz?=
 =?utf-8?B?cmQxN255cFZ1RTlidyswcEcxMVRlS2xVQ2FpOEkzbnI1WXBaRFNCT1N0UjIw?=
 =?utf-8?B?TEpyWk1pY3NLUzRlOU9rZXhpVHRTOFZZdzFhbGZSZndaS0p3ZzhoelVLb3Er?=
 =?utf-8?B?OFhZWWtQTkJmSjNoZEtRRU1hajBOWndBT2MzN0RNUXNES0R5RG1Uc0ZXcGNW?=
 =?utf-8?B?YlV2eE9EVUNEYWlXT1VGUDZjemhyWXlnbWpJYmRrZ3Y5R1grS3dodVhkOXdo?=
 =?utf-8?B?QjZqVHV2M2FqNmJtQjR2a2hhTTBCYWY3VTBxSU9LZ3N5ckdUclc1MklsNWhI?=
 =?utf-8?B?MjZvdTY5dW5hMFJJdzMxL2dLK0xvMldNNnpIMi9vWkMwbWYrNlpGWnpveVVX?=
 =?utf-8?B?KzlmT1N3Sko3MVdrZHpqY0pFei9sWmhZWFFFbS9hb2pad1dWNkpFN0ZkRHdC?=
 =?utf-8?B?dzJjbS9oeHJuNW5DNllaR2FDU0hGc1RpK3F6ZGJoQ2hOMUxISlZVVzl1UVhH?=
 =?utf-8?B?RklBbnkzNlc3VjJCYnlTZ05kWm1MMFNBcktRdzhNdjg0aS94ZVU0LzhYYjV3?=
 =?utf-8?B?cTFoMloyRE5jNGNMb2JESktSNzIrZFplKzlqTmQzZGhxSEdFOTEvMXJYekFI?=
 =?utf-8?B?alJjRFpIRVZmbFd6TFFHQ25hZEFtS2NVYmcxTFcyQVpGTERJOEVMSmUzajM2?=
 =?utf-8?B?MGhpVUJwSEw1UnF5UXk1UjJEakNHeHpQVmUvVWZDUjdxdnIzUVdKN3BzTkFS?=
 =?utf-8?B?WU05QXZaWmIycDFCUjQvb3l3LzcvdUJheTFCRzRTQXNHd0VXSlhsMjVRVUFU?=
 =?utf-8?Q?JPLm7IPuqOsY/WVo=3D?=
X-Exchange-RoutingPolicyChecked: ACNJjJ6jUGs/N7f2iyuIS1YpWaBV3RZuFE7FoXo50sSp3njKlWterWJB76wWgXnq69RoJ7PxLpeZvrWNh+E2GTgiKPNazP9P7pjeGb0EnlPMGFfocFtXIIGmV311yyOFpSd4KoWj8RD244KOgCBvASl2oW+DSULBcjKmfEQSBTVvfdWEw9Xi5rOPouXx56N26BKveLmh144uZqpmVBFGmeUcd8Nk4kg6NVZVkKYgdZS/9LtDHEkS3p9OGUlKCIoT/9XFdHYT2kwsSmZdB4OL4zpSjEXDnBOeuQVzygNsw4wR8+KdUFH4DKvRmJEfT/8VSJlE0ZApa9WlDrQL1rsnaA==
X-MS-Exchange-CrossTenant-Network-Message-Id: e8f6e646-b553-4b3f-ca30-08df253d2ed7
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 13:08:02.2786 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZPBD1pz2CB5qfyqYslRocs6YyadlUtsZMCMajKgZ/ExMRIm5OtWI/+YTtwrgQMVs4VL0v9L+Q1jlxHbMmYiX+kgnU2StrifR4vB52F8bJBw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5207
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


On 08-10-2026 02:44 am, Dnyaneshwar Bhadane wrote:
> Replace xe_tile_sriov_err() with xe_log_err() using the LMTT component
> tag for LMTT and MERT invalidation failures, preserving the SR-IOV
> prefix in the log message.
>
> Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
LGTM,
Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> ---
> v2:
>   - Drop logging error type in log (Mallesh)
>
> v3:
>   - Add trailing newline(Mallesh).
> ---
> ---
>   drivers/gpu/drm/xe/xe_lmtt.c | 10 ++++++----
>   1 file changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_lmtt.c b/drivers/gpu/drm/xe/xe_lmtt.c
> index 0c726eda9390..b6b3d892a35e 100644
> --- a/drivers/gpu/drm/xe/xe_lmtt.c
> +++ b/drivers/gpu/drm/xe/xe_lmtt.c
> @@ -14,6 +14,7 @@
>   #include "xe_bo.h"
>   #include "xe_tlb_inval.h"
>   #include "xe_lmtt.h"
> +#include "xe_log.h"
>   #include "xe_map.h"
>   #include "xe_mert.h"
>   #include "xe_mmio.h"
> @@ -302,14 +303,15 @@ void xe_lmtt_invalidate_hw(struct xe_lmtt *lmtt)
>   
>   	err = lmtt_invalidate_hw(lmtt);
>   	if (err)
> -		xe_tile_sriov_err(tile, "LMTT invalidation failed (%pe)",
> -				  ERR_PTR(err));
> +		xe_log_err(tile, LMTT, err, "%s invalidation failed.\n",
> +			   xe_sriov_printk_prefix(xe));
>   
>   	if (xe_device_has_mert(xe) && xe_tile_is_root(tile)) {
>   		err = xe_mert_invalidate_lmtt(xe);
>   		if (err)
> -			xe_tile_sriov_err(tile, "MERT LMTT invalidation failed (%pe)",
> -					  ERR_PTR(err));
> +			xe_log_err(tile, LMTT, err,
> +				   "%s MERT invalidation failed.\n",
> +				   xe_sriov_printk_prefix(xe));
>   	}
>   }
>   
