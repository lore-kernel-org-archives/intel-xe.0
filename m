Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95088C531F9
	for <intel-xe@archiver.kernel.org>; Fri, 24 Jul 2026 14:45:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F361C10F3E6;
	Fri, 24 Jul 2026 14:45:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vlcj/3iM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 292B410F3E6
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Jul 2026 14:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784904333; x=1816440333;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=pRIQpA1r1Wfwz0Kx5dzrRLJIXwMOhvB94pkyCm4Qp0o=;
 b=Vlcj/3iMqqHCecp2mAwQPyobiQR/OB8JduTAx1B0U1ctOe/gqremMr1q
 E0d4upiuPut5xBB30DVwZA9pDSP9ofswfbzfuEBfee9NpZJLaJ1MBej96
 ejRgcPZIHZOOewCJAGGyFpY0nvqAfc9mfncJth4V1ywz3SJQish7+OaqN
 eyTNnhE/W3GElu6wUd5vr6m2NuTOT1wo16ZtheenNp1Ol1SVOuNgThZaH
 7FglcLcvkp6ChzMWoNVQfUDOq7ERKg7px6XNI3Rth1HWJvqZ5eVwO34X0
 r1quI4rXcxIcZJYDy4a0no41aRyKByhfEAmMCF4PaX2xJZHaUkGvQfm7S g==;
X-CSE-ConnectionGUID: jNdRHu1LT6eqqax6YbEs6A==
X-CSE-MsgGUID: ieXu9z5EQRuEpLHOmefZLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="73114767"
X-IronPort-AV: E=Sophos;i="6.25,182,1779174000"; d="scan'208";a="73114767"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2026 07:45:32 -0700
X-CSE-ConnectionGUID: zVlhXJrxRFWU733/c4jgMQ==
X-CSE-MsgGUID: x3XE/TfXSkScVwggF3JYYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,182,1779174000"; d="scan'208";a="256074402"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2026 07:45:32 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 24 Jul 2026 07:45:31 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Fri, 24 Jul 2026 07:45:31 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.34) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 24 Jul 2026 07:45:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x1Y+o0dQIZK6+bqMOjYy/blGfLFlO88KJD6hFxFDgnAqmzYe08F24wCBjrIk4K6A3+xuxrZLRC7vfkXdkF6BLlzRKTMLLDHMH7hbV1zVZi7lKD7aU2etoJmD4O625zr9IUBOJqVuuz2UCEtQuhxREXkpOqWYtI0iojrqtvz0vc+2RoRaB1l6CPwqXuUUiv8Mxh3DiiEkRjp6ejgwEGtDgpaxZ8AclTCS8NRW+nXnR1/f9dm4q4t2A6/K7gG7sbVXa9H+Gyy0geA4NZE4npG6AbaQfRtDvRnBnGVBufT+JUIpEGWGTAifuArDkqHozRG3Xtl4Iqif17Fij38Eyv4rfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T0QxfpqUQeRxqSdyrQIxL//hQjgfCIncRNCs6N9H4+0=;
 b=yKgRa5TlUo5PQHnY2aBM0CjtnSBseG8/Cf0uuhTjww3RQAtU3kv+vaK3q7rRXZgFa/ezeol7MvjMzOB8ZLY+Ae3+wXkmZdmrIohuzLB8/KonpAVaxlqkCOaXwLS85FRKEgiNBXtOK1q4R0SZSBKgz7Ik00crdFHO1vUQokmKmhRrFwvUnQETsfFThaxmaBvZ1IzE3dgYRebeuXciMbFkupJSHtKkxYqpemRNgbDO0EDmFNRMQj01KPoVr72bVrRlDTF8d5dFngTQNHndv/7X6TlsLAFcnx1xebqxxMvkHMWmbWMuwoOktjWQDfy+tNohwkG2gediIhhABJNclxA3Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by SJ2PR11MB8324.namprd11.prod.outlook.com (2603:10b6:a03:538::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Fri, 24 Jul
 2026 14:45:27 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%6]) with mapi id 15.21.0245.012; Fri, 24 Jul 2026
 14:45:27 +0000
Message-ID: <9a25f981-8fef-4df8-acc6-bf64adcf4af2@intel.com>
Date: Fri, 24 Jul 2026 16:45:22 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/19] drm/xe/log: Introduce structured log components
To: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Aravind Iddamsetty
 <aravind.iddamsetty@intel.com>, Mallesh Koujalagi
 <mallesh.koujalagi@intel.com>, Raag Jadav <raag.jadav@intel.com>, Riana Tauro
 <riana.tauro@intel.com>, Yoni Levitt <yoni.levitt@intel.com>
References: <20260723203754.3782-1-michal.wajdeczko@intel.com>
 <20260723203754.3782-7-michal.wajdeczko@intel.com>
 <18c6d6e0-f018-48e8-86aa-af11492dddb8@linux.intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <18c6d6e0-f018-48e8-86aa-af11492dddb8@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VIUP296CA0017.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:34e::10) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|SJ2PR11MB8324:EE_
X-MS-Office365-Filtering-Correlation-Id: 11f63855-941c-4305-720e-08dee9923345
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|366016|376014|6133799003|10067099003|56012099006|11063799006|4143699003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: q0wDgQKPkC74y3c5oilUALRg1zF3/X0KK39+kb/SOvsNZbZxz8jsvGCioHwpBStzOT+KMy4ITFZ9R6SVXqVHhxzeoRF1P8Wo4rnEiW70HoFLOflj7Dc5wYzDdDlqB/+2dQD5cFHnEZiOfrERHX58iNTfZf2o77uo70UCDH0eF51uV1OKQRM8hjqeSzHVUU129hPWX39GiQA3bj62ADlPHJF+Z/UC7Lm0CCuateMcS7fvDCSjIZ0dS8mHQ1eH3MmLeSiKDszZJpPHjY/tS8720/remOjwqKXf5g9T5oB9El9QNDg6RCNOvw3GAfD4WJMaqUWJguWeq3x0JW8klxcy15MJ6dRRGndwwl+RNRpHCHcpoa91diqffSl+BVe4s7hKRK53XzaSioeE3dQamHq8ko4rhVqbVQSWImoERnVQ5FwOf/dC7ZtkbxbXPHgbChxsa5G4pm/dezjfe4g+Gd+2jyQn4BdD3k+HWtosMaJpyDJbdhOvaA6kN+FVxoT4/dz9j4G5ZiAiDJ6oDkISndNzvjkIPz2us++qg9hxgN7boe3HsHFIIOAqF6peKd6af8oGNpDs0uQ5jblFsRHytvvezp4B+JvsyMT6ZlLDTiwAqdNOvxWGm0zYO42UK8NGjsHIJKyBf7iAlP7FGw6nFj4oAlWM5mT15kFEJ3xLgyexWbQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(6133799003)(10067099003)(56012099006)(11063799006)(4143699003)(22082099003)(18002099003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cnFkbnBNZThXdkJvRmF5bHNkOUp3cUQvTWxRTlkzS2ZicnVHaklmcDNvUGdF?=
 =?utf-8?B?S2l6dDBJTGRDZnhnNm9uZ0U1QmY4TFd1V1BtZC9wN0hXSWZpS0tqN3NVNFBM?=
 =?utf-8?B?b1V4aXBUNCtoamFJR0hxallyNnRMejZLazBSdkhkMDQwR0tsY2Foc09DMFlW?=
 =?utf-8?B?dTBiVkR5SmVmMEd5a0NhSEZybGdHTjBkRDdYVEF6d2tIblJBcXU3bTZUY0Zh?=
 =?utf-8?B?TDFNL3BEQ084Q0s5UW8zZytxeS94T1BpUFdwZ1NyclZ3WG1ENHQ3ZndudVpT?=
 =?utf-8?B?ZGYxTnE1c1F1ekFBdUxsVGZrZEpUTzUzdmw3MHl0enVzb2ZZUS9DVFJYMVk2?=
 =?utf-8?B?ZzZLZzhIUFhjeitRak5pZ05DdXdCeUN6N2Fzd1lMT2x0aTBRellydUVkcjBw?=
 =?utf-8?B?b2JOTEZuMVBHcWhyOE1HbGl5Q0RSUzAvMHMvTUlpSzNrdkY4UjBIZDFWdXRw?=
 =?utf-8?B?S3FkSHFHSkl1TjNEZEVMQ0NxL082UEZEYjB2cEhrVnBwalRUdVFubllHTktl?=
 =?utf-8?B?MUdqMm0zeUxTQ0VETnd4ME9wMVhTYWlsRHQrdU1RM3lkeENJRk1FeDdZeHFr?=
 =?utf-8?B?cmk0NjYyb2Z3d21xbmpBRURUTC9vZVk3SzgxY3J2L1N1WE4zOXQyaXR3ZzdP?=
 =?utf-8?B?RCtDenhINzZrTDNpVmk2d0FNU2Z4aFV3NVdvZFh5eXAxckNiWWlMR2RFQTFI?=
 =?utf-8?B?ek9jbWdZdU41UkVqL0ViSk5oeUdOenlIYkhjNDlrajZRbkV5dVhHWmJ6SHV4?=
 =?utf-8?B?dHVNc2hvN3lHZGdjN1NzdjNndWZoWk1QZ2EzdU9obmszd01namtNTTN0M2xB?=
 =?utf-8?B?VkQ1dFlDcEVDcGlJclkycE90U1Y1MytZNkR0WFJGQnc3bnVITnNRbWdBSFk2?=
 =?utf-8?B?dG03eGxZZXFxOTBETkJiK0dyK1RjSTlpRzFsdVgweTEzSFJFODFlTklUbnkz?=
 =?utf-8?B?WTZweDR0UTQ4OEFuU052T1JqYlFEWnNpMzQ5c05GM0FGRXBocUxRN3dFOUFZ?=
 =?utf-8?B?Z2l0c3p2dExFbTNtbnQ1a0FDNnZteGN4Sy96SFR4bzdOTmkxOXBaTHFPWWJH?=
 =?utf-8?B?YUxIY2ovK1JlNDFqaHVYa0tCZUpiaTdNTWRvZ3VlSFl4WXFLWXdWSDdvUEFw?=
 =?utf-8?B?d2ZGeDNTUWk5TzZqOExJRGhQUXZ2NU9uWDN3ZlJ2U1NYYkIyYlViQlhRSzJ1?=
 =?utf-8?B?OXZpdXZITVdyOXJGM050YWlJYW53M1Bhclh4eStiaGdQR1ZhK0ZadXB1eTJG?=
 =?utf-8?B?eUpHSXRlVjdsL3FQYTZTbnRLakhhYklGOEJVSDlSVnBhSXJmallNUVpqNFhs?=
 =?utf-8?B?NzFvdGJGUjBya240cWRiU1ZnVmNjMmpzMDF1TUFXSWlmdWJkd1FEeHVYVnNU?=
 =?utf-8?B?dnlJdjRyamNRakFBZFNBSWZCUE5oVmdoMmhpWUFuZFRXNnMzWW1mbUgrdUZt?=
 =?utf-8?B?UlFkWGxnaThZd3RFZGRCUHMraDM1U21zaVdUTnN3N3NkM2pUdGY3NWltVGlv?=
 =?utf-8?B?WkFpZEVWSWpKTWVJZjVoZW9DaUJXWkJDQ0ZSVXZIaHVSSG9XaFhuNEZJb3FS?=
 =?utf-8?B?M3JaR3FiSXRkc0p4aGVhNndYOTV1RWdJcVhHbGF0bFFmT1dFVDhHVk5tRXVs?=
 =?utf-8?B?eXNGUHFzTXgrcE8xSU9JL1dYWTI3cS9BTTdkbjJjYXh1V25mdndSSzZ6ZlBv?=
 =?utf-8?B?NS9MRUxiQ3dTbDVmd2JUMHVidDlQMzYyMU9CMVRJTnViNlRRRUkzR3N2eVB0?=
 =?utf-8?B?cTZDVmRGVUZWZDlaWUFQV1FZQTlYUDFXcThkcGZrc2JHUC9CVDFOZ0JaSFpw?=
 =?utf-8?B?bU5Uckd4UmNBTDdJck1qK0gwMGpva0x4RkpkV21EbFNnRDRNZ0NOeEhSR1ZZ?=
 =?utf-8?B?WWlTMTVPMnhvOXJ3c0tnb0lOZXkrcXZCNVhHQVgvVDczU1MvN2xGUDBERUFS?=
 =?utf-8?B?YUR3TEdwTlFld3EvbWpQdHZNZ1JsbC9PUmMxQWdUeXpHRFJubUNsVEZXWk01?=
 =?utf-8?B?TXFaRlE2dVFtbEdZV0psSERIL2IyV29ORkgwSHJKbkxQY3RqTmk2bE9pS2U5?=
 =?utf-8?B?SXpPZndSQXFDbThWdFlid3NDUG9XL2JUeWN1cXpYYURXZ1R6K1NKUGR4dFVa?=
 =?utf-8?B?bmlLQnA1RkhUOFFvWnJaRXpsYUhBS3QyRFhGeFlOUXRFTWJWbHQ4eXhIODcy?=
 =?utf-8?B?MGl1QVE3cTZ3NEdUamRiMW10VllES1I2NU1VK051MU9wdkE0NnV4V0JGT2hM?=
 =?utf-8?B?MGVTMldvQmRQVUZsWXZpNUY2a2ZpSTJTWmtBRlptRXpsNnh6dkN2K1g5OTda?=
 =?utf-8?B?clo3eXQvbWpwMUplRXdPWXYzZm9JWUJtZllGbmt3ZmRIaHhaMFgydCs5dE5p?=
 =?utf-8?Q?DdvaYagn0+D6TJII=3D?=
X-Exchange-RoutingPolicyChecked: Xzuk9MlXeY1iP7RAXbDOQmV5nc93IRZaz3JufrcP/hyddwjPRWBeb/BfHGdPzhNu7trKSR7z+nq6EP3OfVHhM0AI90Z6YL79Ru1FtQb0XZm97A6o1VanxYEDCVeGnn+vIiIyO8Qw3VV3RWZsMfSkYn2dpzYDZmhHhjiFHXuPokW6KwSWGIaQSh3wMP85UFMhWvjvy76H5wt47C53Wg9N263ZGVI2qgjOuWUv3H4HA/O54g1gVy15p0N4VHgUJfY/p1DPaqwSyLNdIzP1wUqlQWdUA54cDhFzZ03RH+Uta47Fc+O0fOdrIF+2EAf2RhoVaMogjxa8Xz4I6kdHXFrwKQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 11f63855-941c-4305-720e-08dee9923345
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2026 14:45:26.9566 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CAr+FTcag4d5fnaZ34RDWHL2TRGRJWp2gzYYVGtAPDJ2VB9q68PSlHIglXhQSiz5jK1MoqvcNjyEEZQtXOfe/wvDrzowsjlZ8igM55uBNKg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8324
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



On 7/24/2026 3:28 PM, Aravind Iddamsetty wrote:
> 
> On 24-07-2026 02:07, Michal Wajdeczko wrote:
>> Introduce structured identifiers for each component type that
>> could emit a SIGID log entry and for their locations. We plan
>> to store those IDs in the CPER records for better filtering.
>>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> ---
>> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
>> Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>> Cc: Raag Jadav <raag.jadav@intel.com>
>> Cc: Riana Tauro <riana.tauro@intel.com>
>> ---
>>  drivers/gpu/drm/xe/abi/xe_log_abi.h | 181 ++++++++++++++++++++++++++++
>>  1 file changed, 181 insertions(+)
>>  create mode 100644 drivers/gpu/drm/xe/abi/xe_log_abi.h
>>
>> diff --git a/drivers/gpu/drm/xe/abi/xe_log_abi.h b/drivers/gpu/drm/xe/abi/xe_log_abi.h
>> new file mode 100644
>> index 000000000000..cde86c6c08f2
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/abi/xe_log_abi.h
>> @@ -0,0 +1,181 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2026 Intel Corporation
>> + */
>> +
>> +#ifndef _ABI_XE_LOG_ABI_H_
>> +#define _ABI_XE_LOG_ABI_H_
>> +
>> +#include <linux/bits.h>
>> +#include <linux/bitfield.h>
>> +
>> +#include "abi/xe_sigid_abi.h"
>> +
>> +/**
>> + * enum xe_log_component_bits - bits for components structure definitions
>> + *
>> + * Component identifiers are structured based on::
>> + *
>> + *     COMPONENT = TYPE(8b).ID(8b)
>> + *
>> + * and the structure looks like this::
>> + *
>> + *     ├── SYSTEM(0)
>> + *     │   └── ...
>> + *     ├── DRIVER(1)
>> + *     │   └── ...
>> + *     ├── FEATURE(2)
>> + *     │   └── ...
>> + *     ├── FIRMWARE(4)
>> + *     │   └── ...
>> + *     └── HARDWARE(8)
>> + *         └── ...
>> + *
>> + * Examples::
>> + *
>> + *     COMPONENT(0.type) = SYSTEM.type = system component
>> + *     COMPONENT(1.type) = DRIVER.type = driver core component
>> + *     COMPONENT(3.type) = DRIVER_FEATURE.type = driver feature
>> + *     COMPONENT(5.type) = DRIVER_FIRMWARE.type = firmware driver component
>> + *     COMPONENT(9.type) = DRIVER_HARDWARE.type = hardware drivr component
>> + *
>> + */
>> +enum xe_log_component_bits {
>> +	/* private: */
>> +	XE_LOG_COMPONENT_CLASS_MASK = GENMASK_U16(7, 0),
>> +	XE_LOG_COMPONENT_TYPE_MASK = GENMASK_U16(15, 8),
>> +	/* private: */
>> +	XE_LOG_COMPONENT_CLASS_SYSTEM = 0u,
>> +	XE_LOG_COMPONENT_CLASS_DRIVER = 1u,
>> +	XE_LOG_COMPONENT_CLASS_FEATURE = 2u,
>> +	XE_LOG_COMPONENT_CLASS_FIRMWARE = 4u,
>> +	XE_LOG_COMPONENT_CLASS_HARDWARE = 8u,
>> +	XE_LOG_COMPONENT_CLASS_DRIVER_FEATURE = XE_LOG_COMPONENT_CLASS_DRIVER |
>> +						XE_LOG_COMPONENT_CLASS_FEATURE,
>> +	XE_LOG_COMPONENT_CLASS_DRIVER_FIRMWARE = XE_LOG_COMPONENT_CLASS_DRIVER |
>> +						 XE_LOG_COMPONENT_CLASS_FIRMWARE,
>> +	XE_LOG_COMPONENT_CLASS_DRIVER_HARDWARE = XE_LOG_COMPONENT_CLASS_DRIVER |
>> +						 XE_LOG_COMPONENT_CLASS_HARDWARE,
>> +};
>> +
>> +#define MAKE_XE_LOG_COMPONENT(_CLASS, type) \
>> +	(FIELD_PREP_CONST(XE_LOG_COMPONENT_CLASS_MASK, \
>> +			  XE_LOG_COMPONENT_CLASS_##_CLASS) | \
>> +	 FIELD_PREP_CONST(XE_LOG_COMPONENT_TYPE_MASK, (type)))
>> +
>> +/**
>> + * enum xe_log_location_bits - bits for location structure definitions
>> + *
>> + * Location identifiers are structured based on::
>> + *
>> + *     LOCATION = TYPE(8b).ID(8b)
>> + *
>> + * and the structure looks like this::
>> + *
>> + *     ├── DEVICE(0)
>> + *     │   └── MBZ(0)
>> + *     ├── TILE(1)
>> + *     │   ├── Tile0(0)
>> + *     │   ├── ...
>> + *     │   └── TileN(n)
>> + *     ├── GT(1)
>> + *     │   ├── GT0(0)
>> + *     │   ├── ...
>> + *     │   └── GTn(n)
>> + *     └── ...
>> + *
>> + * Examples::
>> + *
>> + *     LOCATION(0.0) = DEVICE.0 = "Device"
>> + *     LOCATION(1.2) = TILE.2 = "Tile2"
>> + *     LOCATION(2.3) = GT.3 = "GT3"
>> + *
>> + */
>> +enum xe_log_location_bits {
>> +	/* private: */
>> +	XE_LOG_LOCATION_TYPE_MASK = GENMASK_U16(7, 0),
>> +	XE_LOG_LOCATION_ID_MASK = GENMASK_U16(15, 8),
>> +	/* */
>> +	XE_LOG_LOCATION_TYPE_DEVICE = 0u,
>> +	XE_LOG_LOCATION_TYPE_TILE = 1u,
>> +	XE_LOG_LOCATION_TYPE_GT = 2u,
>> +};
>> +
>> +#define PREP_XE_LOG_LOCATION(type, id) \
>> +	(FIELD_PREP(XE_LOG_LOCATION_TYPE_MASK, (type)) | \
>> +	 FIELD_PREP(XE_LOG_LOCATION_ID_MASK, (id)))
>> +
>> +#define MAKE_XE_LOG_LOCATION(_TYPE, id) \
>> +	PREP_XE_LOG_LOCATION(XE_LOG_LOCATION_TYPE_##_TYPE, (id))
>> +
>> +/**
>> + * DEFINE_XE_LOG_COMPONENTS() - Define log components.
>> + * @define: name of the inner macro to expand.
>> + *
>> + * Use this super macro to define custom code for the log components.
>> + * The following parameters are available for each component::
>> + *
>> + *     define(CLASS, ID, TAG, SIGID, NAME)
>> + *
>> + * where:
>> + *
>> + *     @ID is the unique component identifier within CLASS.SUBCLASS.CATEGORY
>> + *     @TAG is unique component tag (across all components)
>> + *     @SIGID is the default xe_sigid for the component (without the XE_SIGID_ prefix)
>> + */
>> +#define DEFINE_XE_LOG_COMPONENTS(define) \
>> +	/* */									\
>> +	define(SYSTEM, 1, PCI, SW, "Linux PCI Subsystem")			\
>> +	define(SYSTEM, 2, DRM, SW, "DRM")					\
>> +	/* */									\
>> +	define(DRIVER, 1, XE, SW, "Xe Driver")					\

[here]

>> +	define(DRIVER, 2, PROBE, PROBE, "Driver Initialization")		\
>> +	define(DRIVER, 3, WEDGED, WEDGED, "Device Malfunction")			\
>> +	define(DRIVER, 4, RTP, SW, "Register Table Processing")			\
>> +	define(DRIVER, 5, WA, SW, "Workarounds")				\
> 
> what is SIGID_SW supposed to indicate?

this is a general signature of errors in the driver software components for which we don't have a better/unique SIGID yet

(and I assume this question refers to enum definition included in patch 1/19)

> 
> In what cases XE component shall be used?

in case we don't have a better/unique component definition yet,
or it is too small component to deserve an unique component id

> 
> Thanks,
> Aravind.
>> +	define(DRIVER, 6, PAGEFAULT, MEM_FAULT, "Page Fault")			\
>> +	/* */									\
>> +	define(DRIVER_HARDWARE, 1, REGS, IO_BUS, "Registers")			\
>> +	define(DRIVER_HARDWARE, 2, GGTT, IO_BUS, "Global GTT")			\
>> +	define(DRIVER_HARDWARE, 3, GT, GT_TDR, "Graphics Technology")		\
>> +	define(DRIVER_HARDWARE, 4, LMTT, IO_BUS, "LMEM Translation Table")	\
>> +	define(DRIVER_HARDWARE, 5, MEMIRQ, IO_BUS, "Memory Based IRQ")		\
>> +	/* */									\
>> +	define(DRIVER_FEATURE, 1, PF, SW, "SR-IOV Physical Function")		\
>> +	define(DRIVER_FEATURE, 2, VF, SW, "SR-IOV Virtual Function")		\
>> +	define(DRIVER_FEATURE, 3, SURVIVABILITY, SURVIVABILITY, "Survivability") \
>> +	define(DRIVER_FEATURE, 4, RAS, SW, "Reliability, Accessibility, Serviceability") \
>> +	/* */									\
>> +	define(DRIVER_FIRMWARE, 1, GUC, RUNTIME_FW, "GuC")			\
>> +	define(DRIVER_FIRMWARE, 2, HUC, RUNTIME_FW, "HuC")			\
>> +	define(DRIVER_FIRMWARE, 3, GSC, RUNTIME_FW, "GSC")			\
>> +	define(DRIVER_FIRMWARE, 16, PCODE, DEVICE_FW, "PCode")			\
>> +	define(DRIVER_FIRMWARE, 17, SYSCTRL, DEVICE_FW, "System Controller")	\
>> +	/* eod */
>> +
>> +/**
>> + * enum xe_log_component_tags - TAGs of all supported components
>> + */
>> +enum xe_log_component_tags {
>> +	/* private: */
>> +#define MAKE_XE_LOG_COMPONENT_ENUM(_CLASS, _ID, _TAG, _SIG, _NAME) \
>> +	XE_LOG_COMPONENT_##_TAG = MAKE_XE_LOG_COMPONENT(_CLASS, (_ID)), \
>> +	XE_LOG_COMPONENT_##_CLASS##_##_ID = XE_LOG_COMPONENT_##_TAG, \
>> +	/* eod */
>> +	DEFINE_XE_LOG_COMPONENTS(MAKE_XE_LOG_COMPONENT_ENUM)
>> +#undef MAKE_XE_LOG_COMPONENT_ENUM
>> +};
>> +
>> +/**
>> + * enum xe_log_component_sigids - SIGIDs of all supported components
>> + */
>> +enum xe_log_component_sigids {
>> +	/* private: */
>> +#define MAKE_XE_LOG_COMPONENT_SIGID(_CLASS, _ID, _TAG, _SIG, _NAME) \
>> +	XE_LOG_COMPONENT_##_TAG##_SIGID = XE_SIGID_##_SIG, \
>> +	/* eod */
>> +	DEFINE_XE_LOG_COMPONENTS(MAKE_XE_LOG_COMPONENT_SIGID)
>> +#undef MAKE_XE_LOG_COMPONENT_SIGID
>> +};
>> +
>> +#endif

