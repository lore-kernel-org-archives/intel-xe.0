Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DBA8606A31A
	for <intel-xe@archiver.kernel.org>; Thu, 29 Oct 2026 18:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KJlyQ+3d
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39F641124D5;
	Thu, 29 Oct 2026 18:33:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A497510E6CD
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Oct 2026 18:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793298808; x=1824834808;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=laN+bGsReZ/70kQ9dNxd1WEjy/INGCEirwo5H9ZPB6Y=;
 b=KJlyQ+3d1n63Gx57kKab0+prJaC6hfJ0igot2w32Qncep0abkMiHiK2s
 AqCsgc00BsNjxv6wg7tW9wgehCVx+FeziGbZFmcMnKX7v/YEBW/yVLj44
 6fHfvwP7CAmce7Lw54qHA8RYz06cx+L3BsQeAoDwjMTrwKazWbfHpZ/Bb
 MLD3hX4PIuU/dG7cUHuVWEgsxhRiYLTVhpPfCnizauC2yaJip1w2nOHiW
 pYBnTalud5kbbfTsNTVpsxOUTupZVuKflb3IGUXcyziT2QQzksC1f0Lxv
 Ik3+4j3+oRXidwdFlD7VnLCllvDC99aHTy2cXqNsnwZ7WMuD5cHMJHKd+ w==;
X-CSE-ConnectionGUID: Nh2HjNYkR/KPBkGEquLzjw==
X-CSE-MsgGUID: H0MysweKSjmXCpnhby2XsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11950"; a="1937234"
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="1937234"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2026 11:33:28 -0700
X-CSE-ConnectionGUID: Qu0QKLViSvaXWA37FpoAaw==
X-CSE-MsgGUID: 5Jdoyb5lQGKlT5Otiak8bQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="7051115"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa011.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2026 11:33:28 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 29 Oct 2026 11:33:27 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 29 Oct 2026 11:33:27 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.52) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 29 Oct 2026 11:33:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PVbVqmOQCs8elUeFXzB0n4cBTLHFTJB2wW13beakfQ/2VHqmuoqE5zTAjGb6wj/Jo0hxZVV0WqwPo8d/PpGQQkqH6uJCQ7gOBy6Lp5kfJyV9KPmkql+MkugqHrdkXbLtPM5f9h7ox1blW/8VNiyf0KlClEn+IezAJavvK8gtpMLLmN+qT+Aqp4IP7xqb7smvEnaE2rCWaQDLnF56sUXjaNhBm8KdPXia0FjS0u+WjYMSjur+Okb74Uf97wh5P0lp84BqssjO5NWhV9f9dNKALtLP23t566R9ZlWYiWWRFMuf8ygKpYoABSMqVUQnoT2HqHlq4qKPbmUg31yf+Jv9rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dP/eSyLMIF2wY2/7ophodZgzEcDb6BAqoMa75LLvpXg=;
 b=xGupy/2WRLP1N6kR71G2qMcILGDa88avx+rRHNi9BHqfTeH/w6u5kw6BlMJQ6XzPRXCmdfYkxTiLsPdPeLUUsfC3miNAqBtLZSmIEZouX4ZCiDOcUkFL898qLudNjoTWXx7qRvjtADgM+rBfuE4bQq6kCvEsFQg5icdF/goQyLj0D+PypWyltw6kAKAgsLowKrTHNwT2diuMdKgRxM7uSFuDMofjpWGE3zCimmLtMYthN4JAsv24wyQ/c5MhVMf2kfZ1iPb3Gi9UZlE1MrFK6gn4dAvTC1OmbqICbnZoOvNBy0eOQGejOcvGNbS5DzP3mdk56uimWQhAaUsEF5EI0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS6PR11MB087165.namprd11.prod.outlook.com (2603:10b6:8:4c4::7)
 by PH8PR11MB6801.namprd11.prod.outlook.com (2603:10b6:510:1c9::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Thu, 29 Oct
 2026 18:33:23 +0000
Received: from DS6PR11MB087165.namprd11.prod.outlook.com
 ([fe80::4223:7b03:1329:265f]) by DS6PR11MB087165.namprd11.prod.outlook.com
 ([fe80::4223:7b03:1329:265f%5]) with mapi id 15.21.0569.008; Thu, 29 Oct 2026
 18:33:23 +0000
Message-ID: <c425f5cd-7df2-4ce7-b2b3-f12c32cc7308@intel.com>
Date: Fri, 30 Oct 2026 00:03:14 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/9] drm/xe/hwmon: expose pwm[1-3]_enable
To: Karthik Poosa <karthik.poosa@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <rodrigo.vivi@intel.com>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <raag.jadav@intel.com>, <riana.tauro@intel.com>,
 <sk.anirban@intel.com>, <mallesh.koujalagi@intel.com>,
 <ravi.kishore.koppuravuri@intel.com>
References: <20261015190751.1268916-1-karthik.poosa@intel.com>
 <20261015190751.1268916-6-karthik.poosa@intel.com>
Content-Language: en-US
From: "Purkait, Soham" <soham.purkait@intel.com>
In-Reply-To: <20261015190751.1268916-6-karthik.poosa@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0018.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:179::17) To DS6PR11MB087165.namprd11.prod.outlook.com
 (2603:10b6:8:4c4::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS6PR11MB087165:EE_|PH8PR11MB6801:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d8c4900-0795-4e44-03d9-08df35eb1d4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|23010399003|6133799003|18002099003|18092099006|22082099003|5023799004|56012099006|11063799006|261026140227099003|4143699003|261021123027099003|261021121427099003|10067099003|261026121527099003|261022105027099003|261009223027099003|261022075727099003|261022113327099003|261028144727099003;
X-Microsoft-Antispam-Message-Info: CivgxrAGaDFQWusbSel7U7M4+7uN0kAhzU+vChzGYPj3T79HnYMM798jyfKaOqKjeS7F+tPgPuI4iBqikSUkiNMOQJiMCLHV2VNSLacSQQR5bcaICbB53cXKI+g9DKzFY5YfqqU8Ge3rzIeLAwuJ0Rh3v+iRhDOCyHB0FXQFYOS6cLcVy9gWagNBKsUJDjEfsaZaJ3e5YXEJT+tuQVOYu7bV1JlT+0io9hZOEwrLdAKqbVycqCe8BkM7/UsVuYtOm58YfX758urmoUzVY8flyqZNjus0qPTx1oaX4bP1H/4W2HXDogvdfdqauLrgYcopuibHKID76WJ2LGjr5CCUYrEIRPS/759QDlPUbOOACnIxCwBpIR2DPxgqyLLfIl99G0aaFq9h1bvhgJdkKvlmn6FxS2HFubd8O3XfOvWQXmFqmCHyAOYw+wq8jgsGe6gVamQsGGiF0+vMro+S2Mi7bitxudQ7uURYQ0/OdBw9rccaLKGrpK8OXfvCVlxFINpvuFydncT3vmeDbxXz9mO4ag9sXqHqqTg4ZOz5Z8tr6VNTgMPucvK7RDZ84CnCulvYRRtyOwf7/UYPWE86AVT8oBRJ8hNQO+NBv0djHFpcymI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS6PR11MB087165.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(6133799003)(18002099003)(18092099006)(22082099003)(5023799004)(56012099006)(11063799006)(261026140227099003)(4143699003)(261021123027099003)(261021121427099003)(10067099003)(261026121527099003)(261022105027099003)(261009223027099003)(261022075727099003)(261022113327099003)(261028144727099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cm9PQ25RWmxMRTZWS25sNzlaVHdIM0xXd2MxaWI5UEVVNG9rbHliVjlqRjdH?=
 =?utf-8?B?dGlpTGc0d2xoL2tTSXZIR3NPUFFkZXJlR05pajY1UHpsb3FKblE2NEVqNitz?=
 =?utf-8?B?RHVsbDFjWlo3M2Z0b2JHc1BXZ2IreFNNbzZta1JJOEdPNURqcS95T0JSTEtD?=
 =?utf-8?B?cFU1U21VZURmakpweU9rT3M5MWk2SGJnQ0hqK2V2UllXUXRFSXdOdHpIcC9N?=
 =?utf-8?B?cHJWZ2NidE9XQStCRG5tVmdCVEVZUnJMR2MwbkhEZmJsT1RSOTNRUFZKY1JD?=
 =?utf-8?B?QU4zS1ZmZENLUWxaN0hIL1hlVHpqOEUrVFQreFBCM1RuOWhMWlFKK0QyM3Nj?=
 =?utf-8?B?R1BhLzJCakhLQU14V1BWL25sS3ZUZ3FHcWpMY2Z4a3hSSjdUdUhWc0NjeGdh?=
 =?utf-8?B?VGV0d2dPMDh5M2dGZ2xaanVqT1M4d3ZGUStvWmIxbHcrUWlmS3czeHFDWUJB?=
 =?utf-8?B?M2ZBTEVMbnlJc3ZGUkgyNkdiRVY0RTVRdTNNbDltRTFLV0dBWkwveUpsRXo4?=
 =?utf-8?B?NFFuajV3NDYycWxrVFNSYVFPQXNaT21ZTERQMytuRXl1dy9WTE1KOFBMekZL?=
 =?utf-8?B?ZFJHY2I3Vlo0ZmpHOW5tWDNIYUZPYVpKQmExQ1hOSEIzcWRwQ1ljNDJUZFlE?=
 =?utf-8?B?dGxSNVVUMk05aEMzZDl5S29CWFlOelplMnZTRmJXVlZkY0RhcHR5V1k4NEZy?=
 =?utf-8?B?TFYyRlBRZEVSVCt4cnJNY25xWXZSNVR1T2lCTlRDWXpiVXRHcktMMzhmdGNx?=
 =?utf-8?B?cFc5WU1XOUZPTEFuWjN1VW1OQzV0QzNOdnlTMHFtYmNuQTJkL0xUVkpWbG04?=
 =?utf-8?B?Z1dsSzFpc0k3YVF4QmJWWnJSTTU3UFVwcnU5aTJxTmgyTjY5d3dtenR6Z09P?=
 =?utf-8?B?SitkRlV6WE00eXoxcUFSa1lyVWJNUFhiSDJFRVNRZFpvbDEwdHY2MXFTYnFv?=
 =?utf-8?B?N1hHTEhDa0FDZjZKTlZrU0VpZDZqTjlwNXRUb2dkcHM1eEdicmhsZGhZYjVY?=
 =?utf-8?B?ZEY5U1dFdElCb2ZhMEtZZE53QTJnWXg5ODRDbEVmR1JCWDM5Sm04aHpmanM4?=
 =?utf-8?B?L3U1eVlGS216WDJmTnJEbXMvY0xOR0ZVanJ0alc5dlNlT3FhOGJybXI3Vytu?=
 =?utf-8?B?VnpTTU9GS1IvTDE5dEpEb2pscXVOakZtbG9TZWUwQTNITHlRdFBWZlR6Vlpm?=
 =?utf-8?B?cXFuUk54bEZReVF5U2RXQmZuSHErVmtNa1BVTUNxRWFSckZ4WkFMYlFxeHEz?=
 =?utf-8?B?M0hpZjFOdXpoWVlIOS9uZjlMVXdFVnlHNWlNWjdKaG8xU2dJWkIwOE0zVXl1?=
 =?utf-8?B?VWZWL25aUjJiUUw5anVtWVJ4WVdrSFVBTHIrZWxtalhtOGoyWjFycC9qSU9H?=
 =?utf-8?B?d1VxTTNwR2ZxVVREY0VyekgvS3M3Q2xrOEw5VGxKWnFiWEhHdEVWRW02UUNI?=
 =?utf-8?B?RUN0dWJOVXFJbkFuU09mMjB5YVpoZkY0cm1OQkRJQWR2VDJnNFVRMUY3Rjlt?=
 =?utf-8?B?aXp4eThmZUJySFJkQWtub2dCeEs4RWxzSGc0WVdEL0FEWnZOa2Q3YlAvUjBz?=
 =?utf-8?B?MjdBcG16N0hTN2F0am52RmJkcG1zSTlreEZNZExDVDlxL0t3cmVrRDZDZG9n?=
 =?utf-8?B?YjRNWnpESVlhR2xVdm9qRkVKRkUrdmtCVEhnZ3lwQ1QvMFhOZElqUWtDajlw?=
 =?utf-8?B?R2Frd1JhSlhhcEtvdzNPY09FVnFvdlpVUG0rUmhMVEJ2eWd1L3VrOTc3TjJx?=
 =?utf-8?B?TGRCR05wTVBZaThibDZLWlY3aGo3UjFMb3diOE1XVkF5YUh6K09pR2dZbW94?=
 =?utf-8?B?VXVLcDRaeDRDVVVkcGIyY0dEbzFSOWZUVnZIQVNrRjBtRnpCT20zSEVMOEF3?=
 =?utf-8?B?cC9ZeHl5UXRlQ0g0WUg0eHB3SlhQaTl1S2hsYVRFeXNQTk9McWlCR09sYzR5?=
 =?utf-8?B?VmYrR2lqbE5mWnpTSWVnaEZsWkEzbGhBSFBXSnpVS2tQTjRZdlIyRVI4ejBC?=
 =?utf-8?B?Rjh0T1RBYWJySXVZYVFxYS9oSnpnNnlVaUVoYkVYdTFmbU8wQVZ1RGRVMjc5?=
 =?utf-8?B?a1RFZ044ajF4NkZzNGw1ZjB2ZWxWYnhrM2RNWWZTQnhLYStiMEVnTVJ3Tkdj?=
 =?utf-8?B?TTlaMUIwcnJjUloxclJ4aDVITGo5d25hQVlxV2xZdDhVLzFtaFdsSmdPeWU2?=
 =?utf-8?B?Tmh6L2RMUXA5Nm00Slg1UFUxZFEwdVJXUXhCWjVweGZIZ0tWcVNCdnJxV0JO?=
 =?utf-8?B?UEJLK2cybUE4OVdZWGNka0haWU5rNkxKdVFoVitKZ1dlUUJQR2Jsa3EyL3FO?=
 =?utf-8?B?QW13azFKd1BQekpHa0JCa2c5bGdXQWtUS0VyeDNTSWpMeGhEanBLTXhlU0Ux?=
 =?utf-8?Q?ORWB+aYT3fhtfs7g=3D?=
X-Exchange-RoutingPolicyChecked: nHDX7rA9mB/ew52NkSEL5Qj0VOM43g42Tuoc5CYM6riOpHmNMNynNDiwFB38rQ9L7OcaohYPenezMSpGoXICYqVAubcGtrq+wVGB0ZERUR4jx/8SP09q+WCjV4kIVuIi+Uo6lPhlA6bREkpu/RNFFzkwN13uh2vEU1jTKJtjRSDdM3zqfNZ4pTpiwTQ2d4GnbnwGuuCDs6rAqallordmRQszDZ4cKA9pDIKhfFKm0dIhWWXIg/m08AGwYPS/hWQILfLU0SPgbHPX0obHKcQaPsl7taDf2nBd7l7nxwSHt6M6Q7G65c++rYRxAHhKOdMtnS5E/l1rlYXjTN8rZfq7Rw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d8c4900-0795-4e44-03d9-08df35eb1d4f
X-MS-Exchange-CrossTenant-AuthSource: DS6PR11MB087165.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 18:33:23.6681 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MDdZwHjSNF/f84XNX/a63eJULbYar3AkoBnpI/YURVrzjfiFWnTtVCEfkVA9zT7LhTyCeRrkLq+L9MDrw3WDug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6801
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Karthik,

On 16-10-2026 00:37, Karthik Poosa wrote:
> Expose pwm[1-3]_enable to control the fan operating mode through
> the hwmon interface.
>   
> Mode 0 forces the fan to run at full speed.
> Mode 1 enables user fan-table control.
> Mode 2 restores firmware-controlled fan management.
>   
> Document pwm[1-3]_enable in the Xe hwmon ABI.
>
> v2:
>   - Use xe helpers for dmesg logs.
>   - Update kernel version in Xe hwmon documentation.
>   - Correct level of some dmesg logs.
>
> v3:
>   - Each pwm_enable mode now sets its own state; drop the redundant
>     post-switch pwm_enable_mode/is_full_speed update. (Badal)
>   - Fix misindented dead assignment in the stock-table branch.
>   - Make error handling consistent across pwm_enable modes. (Badal)
>   - Document the pwm[1-3] manual-mode write precondition in the ABI. (Badal)
>   - Use xe_pcode_write() instead of the timeout variant api as it is not
>     needed.
>
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> Assisted-by: LLM
> ---
>   .../ABI/testing/sysfs-driver-intel-xe-hwmon   |  15 ++
>   drivers/gpu/drm/xe/xe_hwmon.c                 | 156 +++++++++++++++++-
>   2 files changed, 168 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> index ce17e9ca3ed8..92c91c57b3f2 100644
> --- a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> +++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> @@ -329,4 +329,19 @@ Contact:        intel-xe@lists.freedesktop.org
>   Description:    RW. Target fan PWM duty value in the range 0..255. 0 is zero
>                   fan speed and 255 is 100% fan speed.
>   
> +                Writing requires the corresponding pwm[1-3]_enable to be set to
> +                1 (manual user-table mode) first; otherwise the write is
> +                rejected with -EINVAL.
> +
>                   Only supported for particular Intel Xe graphics platforms.
> +
> +What:          /sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/pwm[1-3]_enable
> +Date:          September 2026
> +KernelVersion: 7.3
Please use the correct version as per the prediction.
https://jnikula.github.io/linux-kernel-tea-leaves/
> +Contact:       intel-xe@lists.freedesktop.org
> +Description:   RW. Fan control mode selector.
> +
> +               Use value 0 to run fans at full speed. Use value 1 to enable
> +               user table control and value 2 to use firmware default behavior.
> +
> +               Only supported for particular Intel Xe graphics platforms.
Use tab indentation.
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index a86ed741feb3..c3d5c682768d 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -139,6 +139,15 @@ struct xe_hwmon_energy_info {
>   	long accum_energy;
>   };
>   
> +enum xe_fan_pwm_enable_mode {
> +	/** @XE_FAN_PWM_FULL_SPEED: force all user table points to full speed */
> +	XE_FAN_PWM_FULL_SPEED = 0,
> +	/** @XE_FAN_PWM_MANUAL_USER_TABLE: use the driver-managed user table */
> +	XE_FAN_PWM_MANUAL_USER_TABLE = 1,
> +	/** @XE_FAN_PWM_AUTO_STOCK_TABLE: use the firmware stock table */
Keep the wordings consistent with the ABI doc.
> +	XE_FAN_PWM_AUTO_STOCK_TABLE = 2,
> +};
> +
>   enum fan_table_type {
>   	/** @STOCK_FAN_TABLE: firmware-provided fan table */
>   	STOCK_FAN_TABLE,
> @@ -189,6 +198,10 @@ struct xe_hwmon_fan_info {
>   	u32 max_rps;
>   	/** @min_pwm: minimum fan PWM */
>   	u32 min_pwm;
> +	/** @pwm_enable_mode: current xe_fan_pwm_enable_mode */
> +	u8 pwm_enable_mode;
> +	/** @is_full_speed: flag indicating if fan is in full speed */
> +	bool is_full_speed;
>   };
>   
>   /**
> @@ -917,7 +930,9 @@ static const struct hwmon_channel_info * const hwmon_info[] = {
>   	HWMON_CHANNEL_INFO(energy, HWMON_E_INPUT | HWMON_E_LABEL, HWMON_E_INPUT | HWMON_E_LABEL),
>   	HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT | HWMON_F_MAX, HWMON_F_INPUT | HWMON_F_MAX,
>   			   HWMON_F_INPUT | HWMON_F_MAX),
> -	HWMON_CHANNEL_INFO(pwm, HWMON_PWM_INPUT, HWMON_PWM_INPUT, HWMON_PWM_INPUT),
> +	HWMON_CHANNEL_INFO(pwm, HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
> +			   HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
> +			   HWMON_PWM_INPUT | HWMON_PWM_ENABLE),
>   	NULL
>   };
>   
> @@ -1185,10 +1200,80 @@ static int xe_hwmon_get_fan_point_count(struct xe_hwmon *hwmon, u8 fan, u32 *poi
>   	return 0;
>   }
>   
> +static int xe_hwmon_activate_user_fan_table(struct xe_hwmon *hwmon, u8 fan,
> +					    bool is_full_speed, enum fan_table_type table_source)
xe_hwmon_activate_user_fan_table(), xe_hwmon_set_user_fan_pwm(), and 
xe_hwmon_commit_user_fan_table() share the same write/batch/verify 
logic. Can these be consolidated into a single helper ?
> +{
> +	struct xe_hwmon_fan_info *fi = &hwmon->fi[fan];
> +	struct xe_pcode_write writes[MAX_FAN_CONTROL_POINTS + 1];
> +	u32 point_count;
> +	int ret;
> +	int point;
> +	struct fan_table *source_table = &fi->fan_table[table_source];
Inverted xmas tree.
> +
> +	xe_dbg(hwmon->xe, "activating fan %d user table from %s table\n", fan,
> +	       (table_source == USER_FAN_TABLE) ? "user" : "stock");
> +
> +	point_count = source_table->point_count;
> +	if (!point_count || point_count > MAX_FAN_CONTROL_POINTS) {
> +		xe_err(hwmon->xe,
> +		       "fan %d %s table point count %d is invalid, cannot activate user table\n",
> +		       fan, (table_source == USER_FAN_TABLE) ? "user" : "stock", point_count);
> +		return -EINVAL;
> +	}
> +
> +	for (point = 0; point < point_count; point++) {
> +		u8 temp = source_table->fcp[point].temp;
> +		u8 speed = is_full_speed ? 100 : max_t(u8, source_table->fcp[point].speed,
> +					    min_t(u32, fi->min_pwm, U8_MAX));
Nit: same per-point speed is recomputed below. Could these values be 
reused?
> +
> +		writes[point].mbox = PCODE_MBOX(FAN_SPEED_CONTROL, FSC_WRITE_FAN_TABLE, fan);
> +		writes[point].data = FIELD_PREP(FAN_CONTROL_POINT_TEMP_MASK, temp) |
> +					FIELD_PREP(FAN_CONTROL_POINT_SPEED_MASK, speed);
> +	}
> +
> +	writes[point_count].mbox = PCODE_MBOX(FAN_SPEED_CONTROL, FSC_WRITE_NUM_FAN_CONTROL_POINTS,
> +					      fan);
> +	writes[point_count].data = point_count;
> +	ret = xe_pcode_write_batch(xe_device_get_root_tile(hwmon->xe), writes, point_count + 1);
> +	if (ret) {
> +		xe_dbg(hwmon->xe, "failed to write fan %d user table, ret=%d\n", fan, ret);
> +		return ret;
> +	}
> +
> +	/* Verify if all the user points are set */
> +	ret = xe_hwmon_get_fan_point_count(hwmon, fan, &point_count, USER_FAN_TABLE);
> +	if (ret) {
> +		xe_err(hwmon->xe,
> +		       "failed to read fan %d user table point count, ret=%d\n", fan, ret);
> +		return ret;
> +	}
> +	if (point_count != source_table->point_count) {
> +		xe_err(hwmon->xe, "fan %d user table point count mismatch, expected %u, got %u\n",
> +		       fan, source_table->point_count, point_count);
> +		return -EIO;
> +	}
> +
> +	if (table_source == STOCK_FAN_TABLE) {
> +		for (point = 0; point < point_count; point++) {
> +			fi->fan_table[USER_FAN_TABLE].fcp[point].temp =
> +				source_table->fcp[point].temp;
> +			fi->fan_table[USER_FAN_TABLE].fcp[point].speed =
> +				is_full_speed ? 100 : max_t(u8, source_table->fcp[point].speed,
> +							    min_t(u32, fi->min_pwm, U8_MAX));
Nit: ditto
> +		}
> +	}
> +
> +	fi->fan_table[USER_FAN_TABLE].point_count = point_count;
> +	fi->pwm_enable_mode = XE_FAN_PWM_MANUAL_USER_TABLE;
> +	fi->is_full_speed = is_full_speed;
> +
> +	return 0;
> +}
> +
>   /* Temperature to set when setting the fan PWM with pwmN. */
>   #define FIXED_PWM_TEMP	(1)
>   
> -static int xe_hwmon_set_user_fan_pwm(struct xe_hwmon *hwmon, u8 fan, u8 pwm)
> +static int xe_hwmon_set_user_fan_pwm(struct xe_hwmon *hwmon, u8 fan, u8 pwm, bool full_speed)
Either use full_speed or is_full_speed but keep it consistent throughout.
>   {
>   	struct xe_hwmon_fan_info *fi = &hwmon->fi[fan];
>   	struct xe_pcode_write writes[MIN_FAN_CONTROL_POINTS + 1];
> @@ -1196,6 +1281,11 @@ static int xe_hwmon_set_user_fan_pwm(struct xe_hwmon *hwmon, u8 fan, u8 pwm)
>   	u8 clamped_pwm;
>   	int ret, i;
>   
> +	if (!full_speed && fi->pwm_enable_mode != XE_FAN_PWM_MANUAL_USER_TABLE) {
> +		xe_dbg(hwmon->xe, "fan %d manual mode is not active, cannot set pwm\n", fan);
> +		return -EINVAL;
> +	}
> +
>   	pwm = DIV_ROUND_CLOSEST(pwm * 100, U8_MAX);
>   	clamped_pwm = max_t(u8, pwm, min_t(u32, fi->min_pwm, U8_MAX));
>   
> @@ -1239,6 +1329,8 @@ static int xe_hwmon_set_user_fan_pwm(struct xe_hwmon *hwmon, u8 fan, u8 pwm)
>   	}
>   	fi->fan_table[USER_FAN_TABLE].point_count = MIN_FAN_CONTROL_POINTS;
>   
> +	fi->pwm_enable_mode = XE_FAN_PWM_MANUAL_USER_TABLE;
> +	fi->is_full_speed = full_speed;
>   	return 0;
>   }
>   
> @@ -1303,6 +1395,9 @@ static int xe_hwmon_read_fan_control_info(struct xe_hwmon *hwmon)
>   			       fi->fan_table[STOCK_FAN_TABLE].fcp[point].speed);
>   		}
>   
> +		/* Set PWM enable mode to automatic i.e stock table in use. */
> +		fi->pwm_enable_mode = XE_FAN_PWM_AUTO_STOCK_TABLE;
> +
>   		/* Read minimum fan PWM */
>   		ret = xe_hwmon_pcode_read_fan_control(hwmon, FSC_READ_FAN_MIN_PWM, fan,
>   						      &fi->min_pwm);
> @@ -1870,6 +1965,7 @@ xe_hwmon_pwm_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
>   
>   	switch (attr) {
>   	case hwmon_pwm_input:
> +	case hwmon_pwm_enable:
>   		return 0644;
>   	default:
>   		return 0;
> @@ -1954,6 +2050,9 @@ xe_hwmon_pwm_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
>   		*val = DIV_ROUND_CLOSEST(fi->fan_table[USER_FAN_TABLE].fcp[0].speed * U8_MAX, 100);
>   		xe_dbg(hwmon->xe, "pwm read for fan %d: %ld\n", channel, *val);
>   		break;
> +	case hwmon_pwm_enable:
> +		*val = fi->pwm_enable_mode;
> +		break;
>   	default:
>   		ret = -EOPNOTSUPP;
>   		break;
> @@ -1967,11 +2066,15 @@ xe_hwmon_pwm_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
>   static int
>   xe_hwmon_pwm_write(struct xe_hwmon *hwmon, u32 attr, int channel, long val)
>   {
> +	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
> +	struct xe_hwmon_fan_info *fi;
>   	int ret = 0;
>   
>   	if (channel < 0 || channel >= FAN_MAX)
>   		return -EINVAL;
>   
> +	fi = &hwmon->fi[channel];
> +
>   	mutex_lock(&hwmon->hwmon_lock);
>   
>   	switch (attr) {
> @@ -1980,12 +2083,59 @@ xe_hwmon_pwm_write(struct xe_hwmon *hwmon, u32 attr, int channel, long val)
>   			ret = -EINVAL;
>   			break;
>   		}
> -		ret = xe_hwmon_set_user_fan_pwm(hwmon, channel, (u8)val);
> +		ret = xe_hwmon_set_user_fan_pwm(hwmon, channel, (u8)val, false);
> +		break;
> +	case hwmon_pwm_enable:
> +		if (val == XE_FAN_PWM_FULL_SPEED) {
> +			ret = xe_hwmon_set_user_fan_pwm(hwmon, channel, U8_MAX, true);
> +			if (ret) {
> +				xe_warn(hwmon->xe,
> +					"full speed enable for fan %d failed, ret=%d\n",
> +					channel, ret);
> +				break;
> +			}
> +		} else if (val == XE_FAN_PWM_MANUAL_USER_TABLE) {
> +			enum fan_table_type source = fi->fan_table[USER_FAN_TABLE].point_count ?
> +				USER_FAN_TABLE : STOCK_FAN_TABLE;
> +
> +			/*
> +			 * Manual fan speed control using user fan table.
> +			 * If user fan table is not programmed, it would be initialized with
> +			 * clamped stock points which allows manual control with some
> +			 * default points.
> +			 */
> +			ret = xe_hwmon_activate_user_fan_table(hwmon, channel, false, source);
> +			if (ret) {
> +				xe_warn(hwmon->xe,
> +					"failed to activate user fan table for fan %d, ret=%d\n",
> +					channel, ret);
> +				break;
> +			}
> +		} else if (val == XE_FAN_PWM_AUTO_STOCK_TABLE) {
> +			/* Switch to stock table specifying the user points to 0. */
> +			ret = xe_pcode_write(root_tile, PCODE_MBOX(FAN_SPEED_CONTROL,
> +								   FSC_WRITE_NUM_FAN_CONTROL_POINTS,
> +								   channel), 0);
Is it required to verify the write as other modes ?
> +			if (ret) {
> +				xe_warn(hwmon->xe,
> +					"failed to disable user fan table for fan %d, ret=%d\n",
> +					channel, ret);
> +				break;
> +			}
> +			xe_dbg(hwmon->xe,
> +			       "automatic control enabled for fan %d using stock table\n",
> +			       channel);
> +			fi->pwm_enable_mode = XE_FAN_PWM_AUTO_STOCK_TABLE;
> +			fi->is_full_speed = false;
> +		} else {
Rejected silently. Add a xe_dbg/xe_warn before these -EINVAL returns for 
clarity.

Regards,
Soham
> +			ret = -EINVAL;
> +		}
>   		break;
>   	default:
>   		ret = -EOPNOTSUPP;
>   		break;
>   	}
> +
>   	mutex_unlock(&hwmon->hwmon_lock);
>   
>   	return ret;
