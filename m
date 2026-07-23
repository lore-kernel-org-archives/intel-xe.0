Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDD1DC531F8
	for <intel-xe@archiver.kernel.org>; Thu, 23 Jul 2026 16:22:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D93410F166;
	Thu, 23 Jul 2026 16:22:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a7CdoylH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B98D10E5C6;
 Thu, 23 Jul 2026 16:21:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784823718; x=1816359718;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=4M1CIfQ+PZvs06R2WF1nbXhc9B5sU47K3r5kyzWzdu0=;
 b=a7CdoylHLY4zJaCKhE+zNdcrgMqFgWYajBsO4rkyVIsE2sH8BxhxgMIk
 Co+/2DkSKTCNzKP4SqKQp+Y+QKfT3bKQwxMShLk7H8P51RmV7K7YaB7Cr
 aTCIFeKCOvhvodQoQJgK0zISwEKB6kUqBxH0tgzfGXjixo4FeVPN1U5+4
 am7m5jmmbCHrXB+Rz7SW76M4LvWraa90VEGH0l+WvXWSF8bK8VDUwI74C
 yb2oRynAmYDmG+XGRSGJg2vt2RUHi5EX61v8Yk+U4JFHAV/49WRlIQ8o8
 sa2umOL9u/0IWvTcczPmaasncIGpLQIIN0XgmgXNkxTg/w41a3H8OMmen g==;
X-CSE-ConnectionGUID: Xojx++9SRb2kfoVZmOQNxA==
X-CSE-MsgGUID: nAFtu7HZTT2RXdH4rkl50A==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="96631526"
X-IronPort-AV: E=Sophos;i="6.25,180,1779174000"; d="scan'208";a="96631526"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2026 09:21:58 -0700
X-CSE-ConnectionGUID: 454t0AjpRHCScxNoQSXW7w==
X-CSE-MsgGUID: uGYKtvp6QWKe4uPE9r9i5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,180,1779174000"; d="scan'208";a="254517153"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2026 09:21:57 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 23 Jul 2026 09:21:57 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Thu, 23 Jul 2026 09:21:57 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.35) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 23 Jul 2026 09:21:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uh/4in8PmBI1pVAq0KV68X98jAvqfe42uQPnlu7JiaRCWvyFSI2BHemof51g/myTAVMqAt01wQ5lBlX0MZbBGipcsOhkpnVZ1UXw22u5/ytus7GeKAEsFdK6RWwgGBOGKY1wMPX770sXBCVrHyDyUiTIG2RabNmsQRg61FaoUwXqmeqF1vI+OVH0HTZGU1OpU4MBq2LilvKpQ0fxvQCfRs6sclRaynszGo6aFSqri623T29FBwmZBedzXcL6VhvrkOARhJgeIuS5O+XYwsOqipJiAHiCuAHrd/+ek2DD6HZu+NrcbiyyrhlN6rNJw5rGmiiujGL3Nr8DhT7I5sf1cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/d9NDZ+xXEdeIwiUvnyAeeIZdz6YFm2XDHsyAumrxyQ=;
 b=PnsLaQx8+sr1ktcCOYJJoa1ZCsWT0BL3nkPHMNvh40+5tgXQ/Rhg818Ows7PxR36/KGFBz9TCk2kZ/lxffqcgu4Aip/kh6+zbZ201BE7fejsXNQNSdxL4Yjl3dCIp8uYLsmiqBCymocwctkvGFXmEqxj1loPReOFY6Ou9cuSdMK17VUNcX5zhZ0w57Cd/IXpv5ZCBqCmXE3dEnygc2EiCfs7/NZ2Z1WjBfTJbWlSxSkURGXypsq6ADWxDQq7Gur91hsQ6thxofMLL4MzGBQ95SOmI5y16yckhI3gfIrystaTtdXq+sGe0kH8DybPmZiYqvWi+1MUsP6teTzwGaGeOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7636.namprd11.prod.outlook.com (2603:10b6:510:26f::13)
 by MW3PR11MB4538.namprd11.prod.outlook.com (2603:10b6:303:57::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 23 Jul
 2026 16:21:53 +0000
Received: from PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b]) by PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b%5]) with mapi id 15.21.0245.010; Thu, 23 Jul 2026
 16:21:53 +0000
Message-ID: <3adf77cc-f716-447f-898f-fd129533ff44@intel.com>
Date: Thu, 23 Jul 2026 21:51:46 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 9/9] drm/i915/vrr: Enable cmrr
To: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>,
 <intel-gfx@lists.freedesktop.org>
CC: <intel-xe@lists.freedesktop.org>, <uma.shankar@intel.com>,
 <ankit.k.nautiyal@intel.com>
References: <20260722043923.3241977-1-mitulkumar.ajitkumar.golani@intel.com>
 <20260722043923.3241977-10-mitulkumar.ajitkumar.golani@intel.com>
Content-Language: en-GB
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <20260722043923.3241977-10-mitulkumar.ajitkumar.golani@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0P287CA0011.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::7) To PH0PR11MB7636.namprd11.prod.outlook.com
 (2603:10b6:510:26f::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7636:EE_|MW3PR11MB4538:EE_
X-MS-Office365-Filtering-Correlation-Id: b3901b89-5563-449e-7124-08dee8d6819b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|23010399003|1800799024|22082099003|18002099003|10067099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info: v43w/rAuEX3XY8fiXVZJ1eOXN4cSZlhd2iSqgodf4kKuCydd9wMwZyeANpyBPsYGxngZ8DHmNUqWGRKob+BLtxLssMKR/DTZkI9sgP2142VbDHs7ira91liWDWUrNV8gE3yhOzGbKnzEf+i689ieQoVphu9OOouxhNYalcSkhIK18ovPGGO9iJv0eNDgtEo15uNq14JV1DkTlFFgrpnadDWCoAJwaLS+taPvQtvXQi22Vns1H6BhJ1hG3UsqbO4FuHuYKq6MOf24jHX9uuY4Mq+sbEUt4ub4/oXAv47CxT9GTjtskRcoazR1xMlD8V/JyEAJne+mrhg6ZoTEx7KFRIYGq2Sr96Q9sVPJdeujW2gW6TBCPA/7QU8vpQMcBcEqdKMWnyqMpslIsWcHumxII3HW73Xj62e+gM5tgjoQHlhlILcVJjTtxj/2NWE8M7I3as7nQEq1TNFSypUhuQ5rfhjxrHtEdR7i+dhlIPqBgyshqWyzb3cYYc50AXxEU4Hcij2XVHKAtUutYJJeitNrgxIIa34DtVgaNnXp3lUHxIwLTzk/sDBFSa0uG7xd1lKiIKd7VGSuMCdyKjFWiqgPuwnXiFOBmG6c6f2MQjSVS09yzfFc4wkRMfkJZqj4gaREvVH9X7DCl+Uend2feLeKBY7vIvk0KxWYoHpzY8ARtUs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7636.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(22082099003)(18002099003)(10067099003)(11063799006)(4143699003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dGczeUlBdkxtdzE3UEhBdyszNjZPS1p5UlhOTExreC96bTY1TXNXelJ4WUd2?=
 =?utf-8?B?aTdLbTZoM3luQnNDZVJJazg0R1c5ZGJNOGJiY2FTd1d1dThQblFobzZZdDdI?=
 =?utf-8?B?alhHZlVURW5EWk85NnNTL0N6U1FBMHZSaW9XbGY4aW1NTHJHeDJadXBBOERG?=
 =?utf-8?B?cU5sRFQ3L09yNjlmTnlacWlNSWlXR2YvTlRqcUlDM3V5S2tRbXZVcGJZTTND?=
 =?utf-8?B?WnBMVTA5enc5S2Rqd1BNN1RZODJFeEQ0VERscDVNenpiR2F3NTZ5ZXJ2S2Jn?=
 =?utf-8?B?emVvd1VveFhVeVZScDBqZE5ncGUrNCt5RGlwVkdFSFVWTVFZVzUzZ3FnVzlM?=
 =?utf-8?B?dzZFdVdmSkpTb0xlTHRBSkViekdqMHpOSjJKenpveXRzSGw5OFRBaTZFS1Nq?=
 =?utf-8?B?T2lRSUZiSSsyWi9FMUZPZ2hzTFlNQjZBTEpxWlI3V1FxTm5ScTZoMVZXeDFs?=
 =?utf-8?B?anY1YytoWUxMbnA5SjVYZnBYNTFlWlFpV1VQK01ZYktUMWFFby9NVVJsaUk3?=
 =?utf-8?B?S3VqSU1QdTZjT1VNK1hoeEVEY3ZjVW12OGpRZjVmdGYxOGM3TTFkNG1VSCtE?=
 =?utf-8?B?cy96anFncE54cVF2UFc2QlJnajM0RTd0UDJaZm8yMlU1ZTY0UHA5QWRSRnA5?=
 =?utf-8?B?VFNyVzMwWFFDWGFacVY1QThnUHRHQmFKVmZQUlYwbTNYVUVzY1gxT0o4b05o?=
 =?utf-8?B?NDdpOW9qV2l6SEFPRXpjY3IrQXFQWmozRUVlOUp2ZlVyWVZYcFJhOWNmUTR1?=
 =?utf-8?B?Kzc0aXo4SW9VQlRzcTVQb2JBdnBvNW41ZUFqWnc3Mkp6QWJsV045bmFEaFl2?=
 =?utf-8?B?MjB6ZXMvQS9LVTJwQzZ5bW16OTFVRXNLd0dhWWUrMVd1K2w0RFBBZURZTXRX?=
 =?utf-8?B?azA5QnpRbkdwT04vR3c3UDlybkV2V0lMV25iZXg3SmNncjJIeDdpaG95eDY1?=
 =?utf-8?B?K2h0aTh0STBNeGpuZU9GSk1kWk5QYWdJZlFOMUVlc1dIb1pVakV1TTRjSldy?=
 =?utf-8?B?elQwd3NOYXR0dVNlZDhxYnFjUTVDdU5xcmVGL1hDOWwwZ2RZVXJUSmp0Z3B2?=
 =?utf-8?B?VHZpZzRRVXUyeHZpQUFqcnJacUowYUR0YUdqR3hySWZBTGNNTmdRRFNlYVZZ?=
 =?utf-8?B?UGVQMS80QVYvQUJaeTJSeG4vVFYxMTNsbEJYTENsTU50bjBRdFdiY0ZjaWRs?=
 =?utf-8?B?RWdISDRnT2RGbm5nVXVaSWpsWEd5aTlKcnAvN1libXJjWVNwUFR6RFYzRGZW?=
 =?utf-8?B?endnM0xJWVNuM0xQeUdmeWFzaFovYWMrV2ZEa3Qvc3lGd3B5cGNMMUZSaG04?=
 =?utf-8?B?YytvSkVHNjF0STdKSTlvTktObk1Selg4elVyT1dVZEJCTGFyOXp2QVhjRjhY?=
 =?utf-8?B?cGt3czhyY2liNzJnN0lXYWp1TC9hL0RLbkhEME9BR3h4bzBPOSt4QTI5NUxy?=
 =?utf-8?B?UXdHc2dGS0dTbXZKRGoxQUdQV3hOWjVwNXYxcUIreW5ISjg2cGI1S09HR28v?=
 =?utf-8?B?RW4zV0FwOFI5WXdUeHo2STNvWEVIdUJOQ0tXMTRIVkdueVF6ZnN1YWtlMUs2?=
 =?utf-8?B?eGNxVmlnN0R3KzV1c0JnVmljS0hQTnB0dTFKVjVYaEZzbktUcGV0Y2djWjJQ?=
 =?utf-8?B?MFBBblNjYlRQS3dkNm5sYk1id0Z5QW40Y3NiY3hkd3hXa0hsY2U0SldoTGZt?=
 =?utf-8?B?ejAyOVpReEkwSEN3d05kYlpMQlprS0kzT003dGdCVGppY2Rta2VlK2hNeXRD?=
 =?utf-8?B?Q3AyM0R1VXcxRWVSMXBRbTZaU1kyemJaOWE4aEJSQnFTdVBOdnltbm56eHpG?=
 =?utf-8?B?VnlWTlZ5RlQ1Vm5vbHpxbEd1Ym8xbFg4YXJnbTRYYXR1MFZBZzFYbEE5Ryt6?=
 =?utf-8?B?U3ZEY3d6aDgvT0xUYkdvUGFsY3YyYzhBcGEwQ2dKVFpiNGR3VEdHMGpGMDBI?=
 =?utf-8?B?Q2RFcFQ1TEpvN1pMNXUzYW9RY0VDNm9RMDdZNm96VFp4dXBJaVhhYmxxbTdG?=
 =?utf-8?B?ak9yejVEdkhXajJ0cTZQTTBVeHZFVzZiZTd1bDIvZVIxQUdPTWMvVmVWbE1C?=
 =?utf-8?B?NXNTdHlramxVMlJlZWVwM0lLckJsS044NjZIRnRVeVY4bGJCbEtQYXZrN2tt?=
 =?utf-8?B?NVZwWWJubFdmakNzUW9EeWFJQXdLNHFVRDBSU056dFBmUk1qNHI5WklIcVRI?=
 =?utf-8?B?MXM1a2xreTM4QWVzWFA5RFIwS0lxeUJ1WFVyZEF6bTVRWXQ4bFB4dVlVTmRw?=
 =?utf-8?B?M1psaHJieTlzS3pDZHAwMDllb2JGVDB5aFEwT0phaEJHa1NKamo5cG5LYW9G?=
 =?utf-8?B?SXJTUTVKbUNRZVpKZnhVSjZsMHFuYWhFN2w2TUIwYWpXckwxK2JwV3pLNnhM?=
 =?utf-8?Q?Sx4rQEEXuu4UW+eM=3D?=
X-Exchange-RoutingPolicyChecked: jNOSSfsJ1zxIiiYutROthfE/YyTV/e0CBN4qFDNDbE0GHbG8P6TmSyDZoZI6ciedNX4Pp14MzvAge3GyjrqibUen6nwN6J1WIuLba24a+kjqH4LUSsDlHw5XmSm9wH1rC1Vc1L9VBwk2vBx9gOJUWuXmgyeXuN8RQVl8FE/xxmBkAjDMrF7cyJ1EkciTGxScxWEaAbK0j5zwwW5N+r54nyZ4Vkq5VzJgm5SNZWGlo+1C/Q3qAlKq0w+MVtTNvks2NsGSKAtc6en9CfwTGQUfWCKS3FNTVKY4GIZnIBmLXVA7bAG8KT7NW3yhUZD6pM/I+Mep5fdnsMduvDy1n0285w==
X-MS-Exchange-CrossTenant-Network-Message-Id: b3901b89-5563-449e-7124-08dee8d6819b
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7636.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 16:21:52.9715 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YZOV/PiPdJtt0wV120d9OPdyaCkC8cW7Xt6+72qv3uaCjPhaczbegp0ymFCykjG5MYTQFX1aDdZBVFCFhFj9ceYOyW6YmMlhazZLSCp9So8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4538
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



On 7/22/2026 10:09 AM, Mitul Golani wrote:
> Enable CMRR during compute config and add related state
> checker for the same.
> 
> --v2:
> - Everything else except enable compute to handle before this patch
> (Chaitanya)
> 
> --v3:
> - Remove redundant return from compute config
> 
> Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
> ---
>   drivers/gpu/drm/i915/display/intel_vrr.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i915/display/intel_vrr.c
> index 6bc3ccd62513..ed23a03b0d3d 100644
> --- a/drivers/gpu/drm/i915/display/intel_vrr.c
> +++ b/drivers/gpu/drm/i915/display/intel_vrr.c
> @@ -302,6 +302,8 @@ intel_vrr_cmrr_compute_config(struct intel_crtc_state *crtc_state)
>   	adjusted_mode->crtc_vtotal = div64_u64_rem(dividend,
>   						   crtc_state->vrr.cmrr.cmrr_n,
>   						   &crtc_state->vrr.cmrr.cmrr_m);
> +
> +	crtc_state->vrr.cmrr.enable = true;

We will also need to clear it (and cmrr_n, cmrr_m ) at the beginning of 
the compute config. If we only have this statement cmrr.enable will 
always remain true once set as it propagates through duplicated crtc states.

>   }
>   
>   static

