Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B0ABC61DBD
	for <intel-xe@archiver.kernel.org>; Wed, 26 Aug 2026 11:51:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3954C10E1EE;
	Wed, 26 Aug 2026 11:51:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LPGscMVt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3F7610E1EE
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Aug 2026 11:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787745071; x=1819281071;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=RwVzB1T5zDb+Mc++s8N1GioRs2aNAluDWaYjti3L1e0=;
 b=LPGscMVtXla8xQqK3i4B7yOBG3A26nuI0gFuBrYERtNbIBiy3POmC/9O
 rCN4sUdvaIrp1jmnPsPRsgprH8EuD9iox4Vb2q/kdoX0k7Ug/WjrjCxv7
 SBDTWgdUpU8VUlJGc4ju5J/B4JNz5oOkOYMqv3zhacLOJXdqEVceZfuWB
 CN7JD1p8hYjqBy9npp0HGHtQ8A7FRXUxoMOnGlSohHydTbMdfm8POBBfp
 MfINfTK/KOfUIcaJNmH0Xl3gqHDEwuDJWuo1yM8zII53gIwLo0gzqR4kE
 pM5gfaDBjIYNQgVBT1Rs6bkVk35SP5qSPGs7YNG28lJNVC9rhnDYvlTk6 Q==;
X-CSE-ConnectionGUID: VPIPukXkSJKm49dXpfge+w==
X-CSE-MsgGUID: s9znroaXRU+p7Un73Djyvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="98558491"
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; d="scan'208";a="98558491"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 04:51:11 -0700
X-CSE-ConnectionGUID: V0ZB6ainToqjIjnYHLlBlQ==
X-CSE-MsgGUID: WuwUaby7TKGBBvRg5OGH6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; d="scan'208";a="261422657"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 04:51:10 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 26 Aug 2026 04:51:09 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 26 Aug 2026 04:51:09 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.69) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 26 Aug 2026 04:51:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lr9IRQsEp8FeJcLy56NywuA6f/XvrgkShDE0AxOzoCxU88+TaTvrVRYiM5EG1ICLqMUsDKO/ibkv6R31SzMXCK2bv2R2y1D42cHU6ybAfU3P6P7ZwdNMmY71MT0anRho5VwmPbqR50SBn4MUFkcozzGunWw96FnyodAxt4yEPwuakHE0Zg4PGfyrlYtl9nWAsHlPk9nyzNyulmPwZi3xbpPuUoGJBkvf33OIJS2U4boBx2elF9ObLCEvDAbOf1UtRfu9YvGMwn6EvQDYq6Eazt55coLHKARIdNi9+ufxr5VALQclsMdn6AU4G4VssZlUh/7YxCqHRCKwOWvw9ijVGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ABUq03Pf4YWR2wM8+NxE/eYvgEyUfqJpNmtJB9TrS/U=;
 b=akMJqyZQYP8YRA8JCZDUaGrn1Bi9oZPMmWRTnhkAUr2zTi7p43dSnuHVfsgqOeH6/o99nUKrHRr0HAQ/YBOKfP/sD9Z1r0E9Se8jVgvVsOhcWsWx4PjL5m8OJGkqvc8JkYFAeOISDnaYRarY924ksd9pjtz+h/y87FJ/mnTRQ1bins0q7BK0ryIwErdR5tYvOVz7+1ts8bHMvNqVGqZ6Vp9JeRsrh4TrYdN3mPQhVWeSdjf+tG2A83fNDRWql2ap0IaqyX/DpcjGSxmshy93brzlm1AE+nrFwRd5uMYQs0NndAUf8njFRihjaLczF1eCAigTt7AoW9Ieo8aYJxM0RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV0PR11MB9792.namprd11.prod.outlook.com (2603:10b6:408:385::5)
 by CY8PR11MB6843.namprd11.prod.outlook.com (2603:10b6:930:60::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.11; Wed, 26 Aug
 2026 11:51:04 +0000
Received: from LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8]) by LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8%5]) with mapi id 15.21.0360.008; Wed, 26 Aug 2026
 11:51:04 +0000
Message-ID: <16092cf0-2d78-49a8-a7a2-a333ed9c7e73@intel.com>
Date: Wed, 26 Aug 2026 17:20:57 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/xe/hwmon: Detect unavailable temperature sensors
To: Karthik Poosa <karthik.poosa@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <rodrigo.vivi@intel.com>, <anshuman.gupta@intel.com>,
 <raag.jadav@intel.com>, <riana.tauro@intel.com>, <sk.anirban@intel.com>,
 <mallesh.koujalagi@intel.com>, <soham.purkait@intel.com>
References: <20260824184137.2164727-1-karthik.poosa@intel.com>
 <20260824184137.2164727-2-karthik.poosa@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20260824184137.2164727-2-karthik.poosa@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0316.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:21a::13) To LV0PR11MB9792.namprd11.prod.outlook.com
 (2603:10b6:408:385::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV0PR11MB9792:EE_|CY8PR11MB6843:EE_
X-MS-Office365-Filtering-Correlation-Id: d8a29ddc-b968-4990-0b8b-08df03684ec3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|6133799003|56012099006|10067099003|4143699003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: miwpNfxgufPxgMwUS14E5/6F0yePVF1WYXJQsgFbMsHQKCbySdZnEfZ5FH4f4c7gmh3rF5g8VnbQ0VMo8dgtAUbQ5V2H2GF5lQF+Cv3QAWc1W5Z9BllcycQ+V2KXzZ67oqkp5LG30B/dwuUZs246gFYOaX7vaj7C/JN61t6QBC8h0HCMo2D8qRhLWi9exh/npFRFq5+7e6AgrSWF1l8/Ppcb2bnYJoBECFKM65ZH2pRPEnJoksjPFfEP2aOaKZ3S2QZLC+N7VVZc1NySXkO6mIdrPO+5oqWNnKjHh8eEswyuqkVKxBotlD07DgRe/ZPG8FENSDHmjCS/ZS+AC7RvcD2KraxVSIFxH3G2vDcHjbsLDMvz4SM4c31GW5sBaTXoocCE2b3XFFt4uqmlQqJCSUiTKiqMpa+xEQU5koDAAN7zi0XlgFBnaIhVw43mM5IYIv9eFOodFSXTCFxLcGABqFY7miBQ+pb8CZObVmFKYSWlWG/y6fGl7wIYdCfcJouJIka4a/N+x5C25lcmVU1eDdz5nPPLGppkQ/4eECaJ335CodS4lfLKMTLvdDUQTnrrX7sfaI9G3HxM0v59ThTd4d+hp8NzEl42CDunlPz4T3OI7drcne9bhWz03Q80cinTJXn2JBA4QywD/YmrJbvO8tEGOiz1/TGfwcAMa/jZuXI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV0PR11MB9792.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(6133799003)(56012099006)(10067099003)(4143699003)(11063799006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Zkg4WjVGeC9jUVQwY2ZGQVEzUnY5NGozMzB2UVg2UHcvamFJWmhHVXpwbk1G?=
 =?utf-8?B?aUhRelg3MkI0UDJLSFRXMzJDaTZGcHFkTzA0NDNUc0RLRkllSWMzdUxkVVY5?=
 =?utf-8?B?QUhnT3NTeXphMEx5ODhCeW9DeFJhYm8zTzdkdStseEhIWUx1NVpEbTVMWjN4?=
 =?utf-8?B?TFdWNS9MZFhlb1JNaE1EemhKNjlNQXBuQW5HZVJyRGMvemVuUXEwVGhMM3lz?=
 =?utf-8?B?ZmFLVzdTdW9QVUpDVy9vRHZJR2tDb0dmSCtNNlVaNTZCWFBJU1M5NUxRYXBR?=
 =?utf-8?B?VFp3eHBLTVJxZFV5N3d5TGhNT0k1RXU0Tlo4eTl0aXo0TzJaTWU4a3RGdmxV?=
 =?utf-8?B?K3h4T1ZLRVAxZDU2bW8wcUQ2Tk5mMGl5Ky84UkNQaEMvREVzcmQ4aC91akZN?=
 =?utf-8?B?U1ZnOG1PdWhMMUJNWDYzbVJsQlhGaGgrWE5sMzUwSHgxeTlVWjJFN1dxaCt6?=
 =?utf-8?B?RHB5dXUrVUtrc25OVnNML013b0NzME8zWk1DZUdvQUdBQlpQUTNYcHc1U1lL?=
 =?utf-8?B?RExKbjl6MFpkdXIzNGJpVUZRdWo5MWpMUGFpdHoza3lJYkQxdHF4ZzRNQThw?=
 =?utf-8?B?R2QvYVJZSmpjcHpzczgzZVRBZTRpVjFKWUllbTAxd2VCazFNeDdWRlVaRGh2?=
 =?utf-8?B?UysyOWdaYk5XTUFHU2RyZU95eExCNjNmRGpabFZZeUJMTnhqeG5zSVNGZnZt?=
 =?utf-8?B?bDFNcXFORWN1b1ovOTZrak1QS05kMXJPM2xqZ0Y5RldzOTFxQnE1bzRzeWlu?=
 =?utf-8?B?VksrZ2g0cTRYS2hwNGd1VStwUkZGRVJUQk9YWW9MKzdLZ3FhRVluWU9zcWo4?=
 =?utf-8?B?cXNTeks5Tmh3TGJjQ3k3ZURaRXlVcFRoam9yWmk2cS9kMkw0NzZjaG05OHNL?=
 =?utf-8?B?cTB1QzBrWmpmb2RObmxTc1MxcUxpQkExcUdsdEpqdzdFQXFOaTVUc3dIckNw?=
 =?utf-8?B?VHlhNzNIQWxrN3JHcCtsckp3VkVHamc5eWF5V3p5VzF6VkJzWm41TXhhMFpY?=
 =?utf-8?B?QW9kVUprT2x3WVVBRk1FYWc0NjB2Q01nQnprS2pRYkxHL2d2L21Zcjh3bEJl?=
 =?utf-8?B?RDNMcU9yTnBRa2dScHpqb3JBbyt6eXFWTkE5aUcxNkdSZk1iOW9ZTjNnS1d0?=
 =?utf-8?B?TGZzVlB1d0JHOGpOeGFHeStJc3hzQk4zMzJLSWw5SHowUkVkdkVtV1Y3SXZY?=
 =?utf-8?B?UjFvL3JxTGIxamhUNVliRERGTEhsNVVVV2dxeWVLZTRyaldRcXlmMzZoa1cz?=
 =?utf-8?B?THcvV1daMUUvUjlPaHBMNlNzcm55Sis4WmlCVmVkOGo4bmwwYklTSjVTZ3pr?=
 =?utf-8?B?cDNpQmU0ekdZU1RMSnpZTjc0MHpGZGhtNWdic1hCK2RIKzFzVzNpbVk4YVJ3?=
 =?utf-8?B?Y0lHYzNGWnZ2WmN1N2x6Ymc5Zkppb1I4dTZ2TDBDTWxDRkZJc3ZKbmlaM002?=
 =?utf-8?B?U1BVSWovM0RmMDM0T0IvajJQSDZPcVNkelAwTTB0WjhobUhNL0ZxY0p1MWJI?=
 =?utf-8?B?bS9saDFJYTUraUZXL1laRURuNXNqNCtCMnN0eXYrRGJjdExkY1N0SXl5N2hH?=
 =?utf-8?B?N0FySmxqUjVta2QvZzNCWDMwTlc0M0t6QXUwSHpGNWhjK3N3YmU0SDFWV3BL?=
 =?utf-8?B?V0R4NVc5MEtlMTRIMXA2NWMxWmZEMW1tSVlXdGUyMjgwS0FwT3pTUHNTMEN2?=
 =?utf-8?B?dkxOd0EwSzY3RG8yL0RHSDhiNlhDOTl1TWpCdG1pVFBsd0tCSUhGM2pQcGJo?=
 =?utf-8?B?R2grRjZhdFh2cFEwVjdpT1paOEN0SjNNbWNTN2RnVVVFK3NadW5ZUWxCQXV0?=
 =?utf-8?B?RzRjLytvbHJNOUMwQVhLaFAxZkhsNUN3RVFEWjM1RTVrUTN0YnlRc2x1R1BB?=
 =?utf-8?B?T1JjWUJ0Q3ZpQTd6VTc3OGpUQmNDM3J5Slk1dXRSTm9DTERtZDlmVGZuMzRk?=
 =?utf-8?B?NVU2eDRnQkRFT3diOXJZZHhuQkNOdnBDNlJCRGdEaFV5QTNxdHNDbGFEb1lC?=
 =?utf-8?B?RE1yUnhDTU84RFhCUGVMSzlPOXhIMWhucm9lS0dZVUtnZGY0bzY5NHo2YW9O?=
 =?utf-8?B?ZXllV01tQ2c1eGRwTkQ4OVBHbkNKUlNOOVYwK05oV2J4QzM5MjVRSGNseTdK?=
 =?utf-8?B?Q085VWEySU1nVXI1andLWU14dlpyT0lpbGtGVk5RVkZUYU1ycUVWcUIzMG5Y?=
 =?utf-8?B?Wk1GV3FYbjZRcWFwT0YzaUlyTjZDVkVLakN3TG1mMlIzU3FrVXp5YzZCclhw?=
 =?utf-8?B?bnE2VmZnWnFjS3ZNb0o0cnNIYXNiYXBQWTRQZW1VdFo2amd3K1BGRkVndUdK?=
 =?utf-8?B?WVljdElIalJER2tkeEdOM0lTZmJueEFzU1Q4UDJkVlZXMjJZV2NRZz09?=
X-Exchange-RoutingPolicyChecked: mHl2LSYZJtEfLxL4acFSQoZiI2YiI0OxnBquJXhe+4ShFETriCtVCvGkLGUJr8Z/jCEBkiczopnR3JYeHDjCNsvg1YFMfxptVUDVYUWII6LguCgwqnfCHc4e22d/9vZunCx/vwyzip0FxWWEdialDiVMo/0/XRdp6uoo4H+e/uAgoKQ9+KjL+bnOAdsbVrjwCSPilZUjaAIAsJKDgEsTHX9wPewmpuHK11M8vEl1nBsZ4JBgjNCeJ6YvNzH2uzlqVrEmmffAc1y0lWcv8fxVcFRN+Lc6NU5YlTfHbad+zTQxnfnOT9ZJL5DNNxdno/axJEbI2JdOsDB0BtsK/niAQg==
X-MS-Exchange-CrossTenant-Network-Message-Id: d8a29ddc-b968-4990-0b8b-08df03684ec3
X-MS-Exchange-CrossTenant-AuthSource: LV0PR11MB9792.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 11:51:04.3856 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g2NJWjGYwZz7HVW3U+o06C1x+TjKAOj/yVTnr2zSVpUTRrbZg8w42wJkctOb2MhNVT7GJz6E2kdJrL3Qeyaktw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6843
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


On 25-08-2026 00:11, Karthik Poosa wrote:
> Add is_temp_valid() to validate sensor presence.
> A temperature reading of 0xFF on CRI platforms indicates that the
> corresponding sensor is not present and should be treated as unavailable.
>
> Use this check from xe_hwmon_temp_is_visible() callback so that attributes
> for unavailable sensors are not exposed during hwmon device registration.
>
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_hwmon.c | 79 +++++++++++++++++++++++++++++------
>   1 file changed, 66 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index 5284cab6703d..2c4eba4b8f8f 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -813,12 +813,21 @@ static int xe_hwmon_pcode_read_thermal_info(struct xe_hwmon *hwmon)
>   	return ret;
>   }
>   
> +static inline bool is_temp_valid(const struct xe_hwmon *hwmon, u8 value)
> +{
> +	/* Value of 0xFF indicates unavailable sensor for platforms from CRI. */
> +	if (hwmon->xe->info.platform >= XE_CRESCENTISLAND)
> +		return value != U8_MAX;
> +	else
> +		return value != 0;

How about returning true here?

> +}
> +
>   static int get_mc_temp(struct xe_hwmon *hwmon, long *val)
>   {
>   	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
>   	u32 *dword = (u32 *)hwmon->temp.value;
> +	int ret, i, count = 0;
>   	s32 average = 0;
> -	int ret, i;
>   
>   	for (i = 0; i < DIV_ROUND_UP(TEMP_LIMIT_MAX, sizeof(u32)); i++) {
>   		ret = xe_pcode_read(root_tile, PCODE_MBOX(PCODE_THERMAL_INFO, READ_THERMAL_DATA, i),
> @@ -828,11 +837,25 @@ static int get_mc_temp(struct xe_hwmon *hwmon, long *val)
>   		drm_dbg(&hwmon->xe->drm, "thermal data for group %d val 0x%x\n", i, dword[i]);
>   	}
>   
> -	for (i = TEMP_INDEX_MCTRL; i < hwmon->temp.count - 1; i++)
> -		average += hwmon->temp.value[i];
> +	for (i = TEMP_INDEX_MCTRL; i < hwmon->temp.count - 1; i++) {
> +		if (is_temp_valid(hwmon, hwmon->temp.value[i])) {
> +			average += hwmon->temp.value[i];
> +			count++;
> +		} else {
> +			drm_dbg(&hwmon->xe->drm, "mc temp sensor %d not available, val 0x%x\n",
> +				i, hwmon->temp.value[i]);
Is this required?
> +		}
> +	}
> +
> +	if (!count) {
> +		drm_warn(&hwmon->xe->drm, "no memory temp sensors available!\n");
> +		return -ENXIO;
Why warning? If sensors are not available then its fine. This will any 
way avoid exposing attribute.
> +	}
> +
> +	average /= count;
> +	if (val)
> +		*val = average * MILLIDEGREE_PER_DEGREE;
>   
> -	average /= (hwmon->temp.count - TEMP_INDEX_MCTRL - 1);
> -	*val = average * MILLIDEGREE_PER_DEGREE;
>   	return 0;
>   }
>   
> @@ -852,7 +875,13 @@ static int get_pcie_temp(struct xe_hwmon *hwmon, long *val)
>   		data = REG_FIELD_GET(PCIE_SENSOR_MASK, data);
>   
>   	data = REG_FIELD_GET(TEMP_MASK, data);
> -	*val = (s8)data * MILLIDEGREE_PER_DEGREE;
> +	if (!is_temp_valid(hwmon, data)) {
> +		drm_warn(&hwmon->xe->drm, "pcie temp sensor not available, val 0x%x\n", data);
> +		return -ENXIO;
Ditto.
> +	}
> +
> +	if (val)
> +		*val = (s8)data * MILLIDEGREE_PER_DEGREE;
>   
>   	return 0;
>   }
> @@ -956,11 +985,21 @@ static inline bool is_vram_ch_available(struct xe_hwmon *hwmon, int channel)
>   	struct xe_mmio *mmio = xe_root_tile_mmio(hwmon->xe);
>   	int vram_id = channel - CHANNEL_VRAM_N;
>   	struct xe_reg vram_reg;
> +	u32 reg_val;
> +	u8 temp;
>   
>   	vram_reg = xe_hwmon_get_reg(hwmon, REG_TEMP, channel);
> -	if (!xe_reg_is_valid(vram_reg) || !xe_mmio_read32(mmio, vram_reg))
> +	if (!xe_reg_is_valid(vram_reg))
>   		return false;
>   
> +	reg_val = xe_mmio_read32(mmio, vram_reg);
> +	temp = REG_FIELD_GET(TEMP_MASK, reg_val);

There is sashiko-bot warning on this. Need to fix.

Thanks,
Badal

> +	if (!is_temp_valid(hwmon, temp)) {
> +		drm_dbg(&hwmon->xe->drm, "vram channel %d unavailable, val 0x%x\n", vram_id,
> +			reg_val);
> +		return false;
> +	}
> +
>   	/* Create label only for available vram channel */
>   	sprintf(hwmon->temp.vram_label[vram_id], "vram_ch_%d", vram_id);
>   	return true;
> @@ -977,8 +1016,9 @@ xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
>   		case CHANNEL_VRAM:
>   			return hwmon->temp.limit[TEMP_LIMIT_MEM_SHUTDOWN] ? 0444 : 0;
>   		case CHANNEL_MCTRL:
> +			return !get_mc_temp(hwmon, NULL) && hwmon->temp.count ? 0444 : 0;
>   		case CHANNEL_PCIE:
> -			return hwmon->temp.count ? 0444 : 0;
> +			return !get_pcie_temp(hwmon, NULL) && hwmon->temp.count ? 0444 : 0;
>   		case CHANNEL_VRAM_N...CHANNEL_VRAM_N_MAX:
>   			return (is_vram_ch_available(hwmon, channel) &&
>   				hwmon->temp.limit[TEMP_LIMIT_MEM_SHUTDOWN]) ? 0444 : 0;
> @@ -992,8 +1032,9 @@ xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
>   		case CHANNEL_VRAM:
>   			return hwmon->temp.limit[TEMP_LIMIT_MEM_CRIT] ? 0444 : 0;
>   		case CHANNEL_MCTRL:
> +			return !get_mc_temp(hwmon, NULL) && hwmon->temp.count ? 0444 : 0;
>   		case CHANNEL_PCIE:
> -			return hwmon->temp.count ? 0444 : 0;
> +			return !get_pcie_temp(hwmon, NULL) && hwmon->temp.count ? 0444 : 0;
>   		case CHANNEL_VRAM_N...CHANNEL_VRAM_N_MAX:
>   			return (is_vram_ch_available(hwmon, channel) &&
>   				hwmon->temp.limit[TEMP_LIMIT_MEM_CRIT]) ? 0444 : 0;
> @@ -1011,12 +1052,24 @@ xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
>   	case hwmon_temp_label:
>   		switch (channel) {
>   		case CHANNEL_PKG:
> -		case CHANNEL_VRAM:
> -			return xe_reg_is_valid(xe_hwmon_get_reg(hwmon, REG_TEMP,
> -								channel)) ? 0444 : 0;
> +		case CHANNEL_VRAM: {
> +			struct xe_mmio *mmio = xe_root_tile_mmio(hwmon->xe);
> +			struct xe_reg reg = xe_hwmon_get_reg(hwmon, REG_TEMP, channel);
> +			u32 reg_val;
> +			u8 temp;
> +
> +			if (!xe_reg_is_valid(reg))
> +				return 0;
> +
> +			reg_val = xe_mmio_read32(mmio, reg);
> +			temp = REG_FIELD_GET(TEMP_MASK, reg_val);
> +
> +			return is_temp_valid(hwmon, temp) ? 0444 : 0;
> +		}
>   		case CHANNEL_MCTRL:
> +			return !get_mc_temp(hwmon, NULL) && hwmon->temp.count ? 0444 : 0;
>   		case CHANNEL_PCIE:
> -			return hwmon->temp.count ? 0444 : 0;
> +			return !get_pcie_temp(hwmon, NULL) && hwmon->temp.count ? 0444 : 0;
>   		case CHANNEL_VRAM_N...CHANNEL_VRAM_N_MAX:
>   			return is_vram_ch_available(hwmon, channel) ? 0444 : 0;
>   		default:
