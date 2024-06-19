Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F9F7C27C53
	for <intel-xe@archiver.kernel.org>; Wed, 19 Jun 2024 19:44:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E950410E077;
	Wed, 19 Jun 2024 19:44:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Pevxgr/2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0828710E077
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Jun 2024 19:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718826257; x=1750362257;
 h=message-id:date:from:subject:to:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=SgdoplMoGCJXycS5PuSSs+07eNbqrFDcBTSdyWebaJA=;
 b=Pevxgr/20AqE3USRbAtuc58HbEKEkfmpb5OBS2pHPZzawF35YpJLHWff
 bSV6Pre7uK0uz4HldT9lR69+Jxw5Vt/gEIqYe5kv2TXb5EkCRGefNu4+s
 dehN4mFPswwj4ln/oQC9L5crLGvvUYDAgJ4pz6yJhyRmFG4z9YBzgPP7w
 loLMiHVS825kdDTJU/0gxXglUb1xvMvwiBn+EBfujkbgfwZVuNJ/HzIeS
 2W/4tShgSOlHMMFZ6cjxHziqPA5NDsoKfqspWUi2j88Z0dLnYYzUj/Ixm
 ctBOUBYQf2iVjsE9HWkGhSfcnb5GyPY4cb2SKqiLuCw7etD7I3YAFrbmy g==;
X-CSE-ConnectionGUID: TQrt7ZRoSEKjoxXSmwhMaA==
X-CSE-MsgGUID: ZP6Wya4cTqSILBPTEyKlrA==
X-IronPort-AV: E=McAfee;i="6700,10204,11108"; a="18692430"
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; d="scan'208";a="18692430"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2024 12:44:17 -0700
X-CSE-ConnectionGUID: iFHvVnIxS92J4n6f9sAHbA==
X-CSE-MsgGUID: zphVCdz2RgG1Htn6SngQCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; d="scan'208";a="41835508"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Jun 2024 12:44:16 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 19 Jun 2024 12:44:15 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 19 Jun 2024 12:44:15 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.176)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 19 Jun 2024 12:44:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cCTAWMYqqZrBdalXzLKmW5NJfJPUUOH7kekn5qBkKCj8n9SHhFIHIkuU6OhoVZ/LJL2bws+L9gZqlfCuxtAlxw+GRiPgivsl7LryQfiB37YX2oCmeMShY7iFKdaALmRMfteMnoSaHOqUFhK2iEmB6D1VgUe6nh+8NtKGG/s5ZLnm1QjZywaKe9W9WFEnSf7CAtz3dbeZ1eJLVSgl77Y2GseE4YVzTA4t+RXnhTAp/bphQfabS85j584IcijsK7FlW5JrersDOmvJQZFuxdc2Z/KJKqxSf73Mx55J28i/ZLvP1ynH3cTy1+l1IJ3jPUUtDkSYqwWYO5tEnCSvbIrn/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s90eFZmAsCsTCK4NC5Hj8dW3vVAZUDtTtt7ifXtlxMM=;
 b=giEICeX6pti96pn6GieceYcZlJjyx06/dv7O1rjgKKI/RRAScY6M/eOQYFtyVTEaIpQ9TJbrS7R3gaXWnIQylwbbecN66UCVCigOOh5fyCsWYtAgRF6mnG6ABtVBGFXLy0m1TCadxslxhCSBdg/JqD4EYYB9KWeASmctjJT4ASzB3ZxKjhJ0HhCbYPtoTdSkaE6SmRf/tndicPxRwnRLEvFLvms4PAMcJ6grkyAd3EZuRI+fw/7OtYlJAwjRsT2PrxMb+l+L9BC3Or4/otCJHa/DjFgBXBI59xr37sZQ58DSiMa0Wgswpl0gmUJMbFxFmqxFjxGiToLhynlPLVZG7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by SA2PR11MB5083.namprd11.prod.outlook.com (2603:10b6:806:11b::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.32; Wed, 19 Jun
 2024 19:44:08 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%6]) with mapi id 15.20.7677.030; Wed, 19 Jun 2024
 19:44:08 +0000
Message-ID: <39bf8731-fc40-4edc-a014-89841d5d5375@intel.com>
Date: Wed, 19 Jun 2024 15:44:04 -0400
User-Agent: Mozilla Thunderbird
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
Subject: Re: [PATCH v9 3/4] drm/xe/guc: Add capture size check in GuC log
 buffer
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>, John Harrison <john.c.harrison@intel.com>
References: <20240607000719.1012422-1-zhanjun.dong@intel.com>
 <20240607000719.1012422-4-zhanjun.dong@intel.com>
 <8c58b7df-6d4d-45ce-9b55-0d352e132148@intel.com>
Content-Language: en-US
In-Reply-To: <8c58b7df-6d4d-45ce-9b55-0d352e132148@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR03CA0011.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::21) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|SA2PR11MB5083:EE_
X-MS-Office365-Filtering-Correlation-Id: c228e579-b2a5-4640-1d21-08dc90982f05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|366013|376011|1800799021;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d1EvT2psaWhxelJVeFhxSlk2TndrT054V1poWE9rd0thRGVUVzJhWDhzUWlT?=
 =?utf-8?B?V0Y1V090QkZpdmg4dXVEeTI0UWtoUFNGTDFpOVNoV2R4S3k1WWVjbjFoMExL?=
 =?utf-8?B?aFBjcDhpUDJTN29LUjVJQnZYVC9qellmaElEb2xrQTVrT1ExOUNIbit5RGRq?=
 =?utf-8?B?TXFJbDB4SGdxVVIwOGpnalREbXZaVkhvbjEvU001alZhYVc3Yktsc1ppNjRs?=
 =?utf-8?B?Tms1eitoL0lQZGRMbXR1eW1tdGEySk9wck1wbzlzNHN1a2JaL014SHpFTlQ4?=
 =?utf-8?B?UFlnb3IwN0hjWTNKR0R4VzR3T05DaW5lVzVLczNZZFpjeEdlNGJLUVBQUnFq?=
 =?utf-8?B?UVdwNi90bDlNbkxPeHc3aVdibWE0RDh5WWpJZ0NnTXE2YWtmM2ZodE02TFln?=
 =?utf-8?B?UFZLSm4vS0tERGFwbUNsTDZqdmlxa2w5UkNEaUdiQUtYS1c1allNdmNkK2FZ?=
 =?utf-8?B?SUZ6TGRkaEtDcHRQOGczRFpoTUZ4amF3MnpOaW1vM1cxN0c0RG9QWHFMbDhk?=
 =?utf-8?B?UkQ2a0t2Nzd0SFpTR2oyVVNmR3V5NEs0Y2Z2QWNoRmw4QXZhYThjZmczQmZz?=
 =?utf-8?B?SjBUK2VrNklodUVJVkVNbTkzVXlncHNEaG5lanpZM0grT2ZzbGQvdHZQUlpK?=
 =?utf-8?B?Z21pUW1BTE95K2NrbzRQQkh5TERncEYzNXc0bWNHMXNrenRMWW41Zkpzb2ta?=
 =?utf-8?B?QUdpUUt3UktaajJIK2JBU1pYdzZuYzFlL2hOUWRhcmE0eW5zTG1LOTVBK20v?=
 =?utf-8?B?Q1RCbnp6MVZSU0hrcEM5VHpLeThKRGUwVjVoNUZiSzNSQWEvRzhLYWZjdW9z?=
 =?utf-8?B?Rno3ZmUyOVAyYis0djBLM25nT3dVU0k4eWNKajBPVmw0ZkNtdmp6L0Z4cDdp?=
 =?utf-8?B?YTRlaXc0QzAwWTZTMCs5RWQvR3pxcms4OXFPRThOdzlNWGNEQ0tqOXhDSEZM?=
 =?utf-8?B?SzZSZ2dVVnlVUTZob3NBTHlUa3NBd0x4MEw5UDBUR1pZSmZPS01qWmNWSDlh?=
 =?utf-8?B?UDg2ektHdjJWTThWK3Z1c2FGbUsvT2dQeGVwbkowMzhOREk5aVFJdktpN1Jv?=
 =?utf-8?B?WlNNb3BwbFk2TGdMMHp6MEQ2WURGTUVaSm9sYmJCS2N0L1ZlekVrVVJIUkdD?=
 =?utf-8?B?VTBNNGdxRDAvNFc4MUdpRERUUU5NUTNMRUdFSG9IWGZQZ2hSb05pZ3BlTXhF?=
 =?utf-8?B?TEJaKzB1Ty9uejRDUFI4SlBLNWhPc3lTYzF4YnNTZVRWNEhpZnU4elpLNi80?=
 =?utf-8?B?Rk1zVDd5Y3hYN045Sno3UG4zYjlHNFlzamh3OXZ6VUQ3bExqaE1uZ2RiVlJI?=
 =?utf-8?B?enhSa1M4ZklUVURIODduSVY5WC96L1BjckNNVFh1L1FzNDB1WmtnOVFETFJC?=
 =?utf-8?B?RkVKOVN2a2ZPQVRPVGtLcm1BVW13OXVxb0RFZVl1Tkl4SVFyQURXeXV2TXdt?=
 =?utf-8?B?ZDF0Yk9HMXB3UWpGSk9uNlR0YTZVVlVkc2VzbG5JU2hFNG1Cb1VpTDd4MTho?=
 =?utf-8?B?VDZRSUlBZ0pPdmtaOHptdGs3N0t1SXU4MVlkYVZacHlVNVAvUEZCem9JNTdJ?=
 =?utf-8?B?cFhmU25SdWt2NXpxcllTblVRcWFjTGNNdnNhYnF6cC9NZHJaUStiWjFhcE1W?=
 =?utf-8?B?L3A3M2FheDlkSjFLUGE3YTVoY2lUMlF3WEJtdU1yQmlJa3A1dU1aUnhBSS9w?=
 =?utf-8?B?VTZkTzl5dVdBQWdrOWdoSW9wN01Ea2V5TlBCd1o5eUk0SWFBdk9Ed2xRY2Z1?=
 =?utf-8?Q?42jTRp8C88YZ+6nkRFAEKYt1LWKBhbvwXiy+Bef?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(366013)(376011)(1800799021); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UnlIR0VIUytXMXoxU2FjdHNzSDcvbkV3WnFicFNzR05YUnZjdGlEZUhob082?=
 =?utf-8?B?L3RqTnBvRDIvU0ZhZHBGY0N3czVETndrT01NN3ExK0l2eFhTa0xqVXNORWhn?=
 =?utf-8?B?NGNFbWJ5aWk5VHl6WE11cndLK3JYMVEycEdNb0cyOTd4RU1FaHBwa1YvL09M?=
 =?utf-8?B?M1BXNFVMZVhqSjh2U2ZPMlFPbWc1cFo2YVozQTlDQVdxYmV6VFFoSng3aU5q?=
 =?utf-8?B?ZVNueVBvT2psM0JkSUdoak5uU1dRcmRHTFR5aFdOc1pDTVBBWWo4akhFdThm?=
 =?utf-8?B?RnJoS2lnbUhJY2hCaUY4Y0xZamI2OW0wNE9rQmVuSHEvWmI4Y1QwMktleEJX?=
 =?utf-8?B?M01QY0RnMEVCWDF2VkhiVHJCckxidGdEVVdXSm9ZbVNlUUJwcGgwbjM2WjA5?=
 =?utf-8?B?WktXR2ZSejV6MGdjSjNsdGdiY25zcXFrVHVRTnBQRHRpOWkzL013bjdsSndx?=
 =?utf-8?B?SFZ5R2VPVThIYzJlajM1dkVueEhYZ1MxWG9XWGpiVytmS0hoZDlZdVlMRnQ5?=
 =?utf-8?B?MmR2Uk9sbGdZZm0wbHIwdUtySVc3ZzlBVXR1VVh6QW9oOStVeWhMOSs3amgy?=
 =?utf-8?B?RGRCVnM5UFA1V3BDbFcvM3R3RE5qUlRKcjUxeDdwVUVMNmlBUTVmd2pqa3FO?=
 =?utf-8?B?RGp5MUpLZXdhaG1xU3diR3VkYzZ6bVk5dW5DWG9WcVkxb2JFUWhOR094RlY0?=
 =?utf-8?B?cVkwdlFaaHhhRWhCL2R1TkQ5Z1hKbGJPNmJlMnZxRWFUTlAyWFBMZDJEUmti?=
 =?utf-8?B?eDRqOGRtb04rTDZZOTg1RUJnTzUrQUQ2amRvbWhMZ2lCUzk3THdvZTlsNVVS?=
 =?utf-8?B?ODIvNkd6MUhnWXZOaC8vUGg3UXBMMmNxZ1FRa1FOSWpzcVY1dEZWN2FVUnFU?=
 =?utf-8?B?WUFKK3ZmU2dOYXVNcmZ0NEl3OW9hVlc3N1diRVNmMVkxNjlwbDhFWURtRlZ0?=
 =?utf-8?B?L0d1WHNxdU5QOHFaUTlydTFYbmdSVzRxSWVtNjBDeGNxOXlPVHVwNXZlcEtU?=
 =?utf-8?B?Rm54cVFmS1ZzNGFGS0pPUTlUVk1XaFpDYkx5L3JEck8xYThrS2p0NFdTR0hO?=
 =?utf-8?B?OENaYUt6Z1RqTUhIOGI2SGdNekxHMWl4bTdwZzkvbDRUR2VGTnpZM2pqNlNk?=
 =?utf-8?B?blhzOHdySTJNNjVHdHFMQUtPTVg5Q0lkdTR5NWZwS3FQK3JCZTRmUFJpNDdR?=
 =?utf-8?B?c0svRFFuV2hKNkJUVy84RHZaeCswNTlTaWE5cmwwTVlKUjhRV0IyakllVlV1?=
 =?utf-8?B?NHFsZGdYL3VoOUNLOVZxSW1EZkRZc3lza0c3Z09GY2h4NWVwanBGY0FqVkcx?=
 =?utf-8?B?QzdrRlhoNE9UZGxUd1FqdGJFMnFJY2ZQa1hlbnhpOFdiQjI0R2pwTlo5dlNa?=
 =?utf-8?B?eHRyN21vZ0c5OVI1NW54R1plOXQyb1hPSnpUMGJYK2FSR3RMd0tLbk1Xa2Rm?=
 =?utf-8?B?cXZCaThCenVYamw0aHVHaDJ6WnM5c3lxV2F6YlU5dHpLRFJ1bnJ6bExLYWJE?=
 =?utf-8?B?U3huZ2VaN3ZEc3d2SWdnbzBNSnZXN05TaDhLSlM2ZUJmUktVUmhCUEE0WndZ?=
 =?utf-8?B?SmVxWTVPSEE3QlcxelZWSmNxZ0JuQk9lNFYwM1RuUys3N245V1NuU3A0UXdi?=
 =?utf-8?B?aHN2K1lld3l4cklJMGc2eUtMRWxKaFU1YmtjeUFTMUdrTTVIUEhoZmdrVkxD?=
 =?utf-8?B?ZWxYYWtUbE51TVMrSm8zMERzRnYvOWQzM3RudkZHRVZRb1poN2Z5RVhkRGZV?=
 =?utf-8?B?RERTTk1HVE9kN1ZtUy9WUUtqclNRdEEyUVVtSUpRRFRpL2h0MVhDRkFNU3hr?=
 =?utf-8?B?THh4MG9RMEdyem1MdjZtVVdzSzZEY1BQRStEbGs1bStLWTA4bHVSdnRMUFJD?=
 =?utf-8?B?b0lvSVhROUJlbVRBRWtXSm50WndER1NBLzVpT1REdFgrQlRVNHhaUUtUSWhy?=
 =?utf-8?B?VG84TjZjZG9VZ3g4cTJSUm9VT0NtcEl2SnZ0ZkZBY3liU2dNT1lZMUdPSTZL?=
 =?utf-8?B?d0plN3VkRGdqRk9SZ21VcWZST29aU1pmVDZYRG5KZ3ZhNW1Ic1hzcFkvNlV0?=
 =?utf-8?B?RVp0QTFpN0dPa05RR01KWFpHMFZiN2RsY2RxRmlIVkF0dkxXZEV2VE1kL3pU?=
 =?utf-8?B?eElqZnh6ekp2MmwwVFlNb3lWOHlxaXFYUmFUWFgySm1sRkovYVR0a0ViRWQy?=
 =?utf-8?B?Nnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c228e579-b2a5-4640-1d21-08dc90982f05
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2024 19:44:07.9515 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h3LkEfvVGiIWkFrhTMwkFCyx5H/+Fc/wT8mjYPCOTpKP79ZiHVQ3wYD3sbwdq+h9jzB+t9ADEgBE2vT0TvwU7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5083
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

Please see my comments inline below.

Zhanjun

On 2024-06-14 8:13 a.m., Michal Wajdeczko wrote:
> 
> 
> On 07.06.2024 02:07, Zhanjun Dong wrote:
>> The capture-nodes is included in GuC log buffer, add the size check
>> for capture region in the whole GuC log buffer.
>> Add capture output size check before allocating the shared buffer.
>>
>> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_gt_printk.h     |   3 +
>>   drivers/gpu/drm/xe/xe_guc_capture.c   |  77 +++++++++++
>>   drivers/gpu/drm/xe/xe_guc_fwif.h      |  48 +++++++
>>   drivers/gpu/drm/xe/xe_guc_log.c       | 179 ++++++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_guc_log.h       |  17 ++-
>>   drivers/gpu/drm/xe/xe_guc_log_types.h |  24 ++++
>>   6 files changed, 347 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt_printk.h b/drivers/gpu/drm/xe/xe_gt_printk.h
>> index c2b004d3f48e..107360edfcd6 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_printk.h
>> +++ b/drivers/gpu/drm/xe/xe_gt_printk.h
>> @@ -22,6 +22,9 @@
>>   #define xe_gt_notice(_gt, _fmt, ...) \
>>   	xe_gt_printk((_gt), notice, _fmt, ##__VA_ARGS__)
>>   
>> +#define xe_gt_notice_ratelimited(_gt, _fmt, ...) \
>> +	xe_gt_printk((_gt), err_ratelimited, _fmt, ##__VA_ARGS__)
> 
> you are mixing here 'notice' with 'err'
Thanks for point out

> 
>> +
>>   #define xe_gt_info(_gt, _fmt, ...) \
>>   	xe_gt_printk((_gt), info, _fmt, ##__VA_ARGS__)
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
>> index 951408846c97..0c90def290de 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_capture.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_capture.c
>> @@ -21,6 +21,7 @@
>>   #include "xe_gt_mcr.h"
>>   #include "xe_gt_printk.h"
>>   #include "xe_guc.h"
>> +#include "xe_guc_ads.h"
>>   #include "xe_guc_capture.h"
>>   #include "xe_guc_capture_fwif.h"
>>   #include "xe_guc_ct.h"
>> @@ -491,6 +492,81 @@ xe_guc_capture_getnullheader(struct xe_guc *guc, void **outptr, size_t *size)
>>   	return 0;
>>   }
>>   
>> +static int
>> +guc_capture_output_size_est(struct xe_guc *guc)
>> +{
>> +	struct xe_gt *gt = guc_to_gt(guc);
>> +	struct xe_hw_engine *hwe;
>> +	enum xe_hw_engine_id id;
>> +
>> +	int capture_size = 0;
>> +	size_t tmp = 0;
>> +
>> +	if (!guc->capture)
>> +		return -ENODEV;
>> +
>> +	/*
>> +	 * If every single engine-instance suffered a failure in quick succession but
>> +	 * were all unrelated, then a burst of multiple error-capture events would dump
>> +	 * registers for every one engine instance, one at a time. In this case, GuC
>> +	 * would even dump the global-registers repeatedly.
>> +	 *
>> +	 * For each engine instance, there would be 1 x guc_state_capture_group_t output
>> +	 * followed by 3 x guc_state_capture_t lists. The latter is how the register
>> +	 * dumps are split across different register types (where the '3' are global vs class
>> +	 * vs instance).
>> +	 */
>> +	for_each_hw_engine(hwe, gt, id) {
>> +		capture_size += sizeof(struct guc_state_capture_group_header_t) +
>> +					 (3 * sizeof(struct guc_state_capture_header_t));
>> +
>> +		if (!guc_capture_getlistsize(guc, 0, GUC_CAPTURE_LIST_TYPE_GLOBAL, 0, &tmp, true))
>> +			capture_size += tmp;
>> +
>> +		if (!guc_capture_getlistsize(guc, 0, GUC_CAPTURE_LIST_TYPE_ENGINE_CLASS,
>> +					     hwe->class, &tmp, true)) {
>> +			capture_size += tmp;
>> +		}
>> +		if (!guc_capture_getlistsize(guc, 0, GUC_CAPTURE_LIST_TYPE_ENGINE_INSTANCE,
>> +					     hwe->class, &tmp, true)) {
>> +			capture_size += tmp;
>> +		}
>> +	}
>> +
>> +	return capture_size;
>> +}
>> +
>> +/*
>> + * Add on a 3x multiplier to allow for multiple back-to-back captures occurring
>> + * before the Xe can read the data out and process it
>> + */
>> +#define GUC_CAPTURE_OVERBUFFER_MULTIPLIER 3
>> +
>> +static void check_guc_capture_size(struct xe_guc *guc)
>> +{
>> +	int capture_size = guc_capture_output_size_est(guc);
>> +	int spare_size = capture_size * GUC_CAPTURE_OVERBUFFER_MULTIPLIER;
>> +	u32 buffer_size = xe_guc_log_section_size_capture(&guc->log);
>> +
>> +	/*
>> +	 * NOTE: capture_size is much smaller than the capture region allocation (DG2: <80K vs 1MB)
>> +	 * Additionally, its based on space needed to fit all engines getting reset at once
>> +	 * within the same G2H handler task slot. This is very unlikely. However, if GuC really
>> +	 * does run out of space for whatever reason, we will see an separate warning message
>> +	 * when processing the G2H event capture-notification, search for:
>> +	 * xe_guc_STATE_CAPTURE_EVENT_STATUS_NOSPACE.
>> +	 */
> 
> please try to wrap comments at 80 (it's already multi line)
> 
>> +	if (capture_size < 0)
>> +		xe_gt_warn(guc_to_gt(guc), "Failed to calculate error state capture buffer minimum size: %d!\n",
>> +			   capture_size);> +	if (capture_size > buffer_size)
>> +		xe_gt_warn(guc_to_gt(guc), "Error state capture buffer maybe small: %d < %d\n",
>> +			   buffer_size, capture_size);
> 
> do we really need those both messages at warn level ?
Will be changed to dbg level

> 
>> +	else if (spare_size > buffer_size)
>> +		xe_gt_dbg(guc_to_gt(guc), "Error state capture buffer lacks spare size: %d < %d (min = %d)\n",
>> +			  buffer_size, spare_size, capture_size);
>> +}
>> +
>>   int xe_guc_capture_init(struct xe_guc *guc)
>>   {
>>   	guc->capture = drmm_kzalloc(guc_to_drm(guc), sizeof(*guc->capture), GFP_KERNEL);
>> @@ -499,5 +575,6 @@ int xe_guc_capture_init(struct xe_guc *guc)
>>   
>>   	guc->capture->reglists = guc_capture_get_device_reglist(guc);
>>   
>> +	check_guc_capture_size(guc);
>>   	return 0;
>>   }
>> diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h b/drivers/gpu/drm/xe/xe_guc_fwif.h
>> index 04b03c398191..908298791c93 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_fwif.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
>> @@ -250,6 +250,54 @@ struct guc_engine_usage {
>>   	struct guc_engine_usage_record engines[GUC_MAX_ENGINE_CLASSES][GUC_MAX_INSTANCES_PER_CLASS];
>>   } __packed;
>>   
>> +/* GuC logging structures */
>> +
>> +enum guc_log_buffer_type {
>> +	GUC_DEBUG_LOG_BUFFER,
>> +	GUC_CRASH_DUMP_LOG_BUFFER,
>> +	GUC_CAPTURE_LOG_BUFFER,
>> +	GUC_MAX_LOG_BUFFER
> 
> this last enumerator is not real buffer type, so better at least name it
> in a different way (at least add __ prefix?
> 
> or best, since it looks like ABI definitions, just move it out of the
> enum to benefit from compiler checks that John prefers:
> 
> enum guc_log_buffer_type {
> 	GUC_LOG_BUFFER_DEBUG		= 0,
> 	GUC_LOG_BUFFER_CRASH_DUMP	= 1,
> 	GUC_LOG_BUFFER_CAPTURE_LOG	= 2,
> };
> #define NUM_GUC_LOG_BUFFER_TYPES	3
> 
Will changed to:
/* GuC logging structures */
enum guc_log_buffer_type {
	GUC_DEBUG_LOG_BUFFER,
	GUC_CRASH_DUMP_LOG_BUFFER,
	GUC_CAPTURE_LOG_BUFFER,

	GUC_LOG_BUFFER_TYPE_MAX
};
The empty line speprate real type vs MAX
I would prefer to stay within the enum, which make add new type easier, 
the MAX will be updated by compiler automatically, no need to manually 
add 1 to NUM_xxx macro.

>> +};
>> +
>> +/*
>> + * struct guc_log_buffer_state - GuC log buffer state
> 
> this is not a kernel-doc format, intentional or typo ?
> 
>> + *
>> + * Below state structure is used for coordination of retrieval of GuC firmware
>> + * logs. Separate state is maintained for each log buffer type.
>> + * read_ptr points to the location where Xe read last in log buffer and
>> + * is read only for GuC firmware. write_ptr is incremented by GuC with number
>> + * of bytes written for each log entry and is read only for Xe.
>> + * When any type of log buffer becomes half full, GuC sends a flush interrupt.
>> + * GuC firmware expects that while it is writing to 2nd half of the buffer,
>> + * first half would get consumed by Host and then get a flush completed
>> + * acknowledgment from Host, so that it does not end up doing any overwrite
>> + * causing loss of logs. So when buffer gets half filled & Xe has requested
>> + * for interrupt, GuC will set flush_to_file field, set the sampled_write_ptr
>> + * to the value of write_ptr and raise the interrupt.
>> + * On receiving the interrupt Xe should read the buffer, clear flush_to_file
>> + * field and also update read_ptr with the value of sample_write_ptr, before
>> + * sending an acknowledgment to GuC. marker & version fields are for internal
>> + * usage of GuC and opaque to Xe. buffer_full_cnt field is incremented every
>> + * time GuC detects the log buffer overflow.
>> + */
>> +struct guc_log_buffer_state {
>> +	u32 marker[2];
>> +	u32 read_ptr;
>> +	u32 write_ptr;
>> +	u32 size;
>> +	u32 sampled_write_ptr;
>> +	u32 wrap_offset;
>> +	union {
>> +		struct {
>> +			u32 flush_to_file:1;
>> +			u32 buffer_full_cnt:4;
>> +			u32 reserved:27;
>> +		};
>> +		u32 flags;
>> +	};
>> +	u32 version;
>> +} __packed;
> 
> this looks like a pure GuC ABI definition, maybe it deserves to be
> placed in separate xe/abi/guc_log_abi.h file ?
ok, to be moved to _abi

> 
>> +
>>   /* This action will be programmed in C1BC - SOFT_SCRATCH_15_REG */
>>   enum xe_guc_recv_message {
>>   	XE_GUC_RECV_MSG_CRASH_DUMP_POSTED = BIT(1),
>> diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
>> index a37ee3419428..c97fc4d57168 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_log.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_log.c
>> @@ -9,9 +9,30 @@
>>   
>>   #include "xe_bo.h"
>>   #include "xe_gt.h"
>> +#include "xe_gt_printk.h"
>>   #include "xe_map.h"
>>   #include "xe_module.h"
>>   
>> +#define MISSING_CASE(x) WARN(1, "Missing case (%s == %ld)\n", \
>> +			     __stringify(x), (long)(x))
> 
> i915'ish is forbidden in Xe
> 
> you should be able to use xe_[gt_]assert() instead
will do

> 
>> +
>> +#define GUC_LOG_DEFAULT_CRASH_BUFFER_SIZE	CRASH_BUFFER_SIZE
>> +#define GUC_LOG_DEFAULT_DEBUG_BUFFER_SIZE	DEBUG_BUFFER_SIZE
>> +#define GUC_LOG_DEFAULT_CAPTURE_BUFFER_SIZE	CAPTURE_BUFFER_SIZE
>> +
>> +struct guc_log_section {
>> +	u32 max;
>> +	u32 flag;
>> +	u32 default_val;
>> +	const char *name;
>> +};
>> +
>> +static struct xe_gt *
>> +guc_to_gt(struct xe_guc *guc)
> 
> don't duplicate the code, this is already defined in xe_guc.h
> 
>> +{
>> +	return container_of(guc, struct xe_gt, uc.guc);
>> +}
>> +
>>   static struct xe_gt *
>>   log_to_gt(struct xe_guc_log *log)
>>   {
>> @@ -96,3 +117,161 @@ int xe_guc_log_init(struct xe_guc_log *log)
>>   
>>   	return 0;
>>   }
>> +
>> +static void _guc_log_init_sizes(struct xe_guc_log *log)
>> +{
>> +	struct xe_guc *guc = log_to_guc(log);
>> +	static const struct guc_log_section sections[GUC_LOG_SECTIONS_LIMIT] = {
>> +		{
>> +			GUC_LOG_CRASH_MASK >> GUC_LOG_CRASH_SHIFT,
>> +			GUC_LOG_LOG_ALLOC_UNITS,
>> +			GUC_LOG_DEFAULT_CRASH_BUFFER_SIZE,
>> +			"crash dump"
>> +		},
>> +		{
>> +			GUC_LOG_DEBUG_MASK >> GUC_LOG_DEBUG_SHIFT,
>> +			GUC_LOG_LOG_ALLOC_UNITS,
>> +			GUC_LOG_DEFAULT_DEBUG_BUFFER_SIZE,
>> +			"debug",
>> +		},
>> +		{
>> +			GUC_LOG_CAPTURE_MASK >> GUC_LOG_CAPTURE_SHIFT,
>> +			GUC_LOG_CAPTURE_ALLOC_UNITS,
>> +			GUC_LOG_DEFAULT_CAPTURE_BUFFER_SIZE,
>> +			"capture",
>> +		}
>> +	};
>> +	int i;
>> +
>> +	for (i = 0; i < GUC_LOG_SECTIONS_LIMIT; i++)
>> +		log->sizes[i].bytes = sections[i].default_val;
>> +
>> +	/* If debug size > 1MB then bump default crash size to keep the same units */
>> +	if (log->sizes[GUC_LOG_SECTIONS_DEBUG].bytes >= SZ_1M &&
>> +	    GUC_LOG_DEFAULT_CRASH_BUFFER_SIZE < SZ_1M)
>> +		log->sizes[GUC_LOG_SECTIONS_CRASH].bytes = SZ_1M;
>> +
>> +	/* Prepare the GuC API structure fields: */
>> +	for (i = 0; i < GUC_LOG_SECTIONS_LIMIT; i++) {
>> +		/* Convert to correct units */
>> +		if ((log->sizes[i].bytes % SZ_1M) == 0) {
>> +			log->sizes[i].units = SZ_1M;
>> +			log->sizes[i].flag = sections[i].flag;
>> +		} else {
>> +			log->sizes[i].units = SZ_4K;
>> +			log->sizes[i].flag = 0;
>> +		}
>> +
>> +		if (!IS_ALIGNED(log->sizes[i].bytes, log->sizes[i].units))
>> +			xe_gt_err(guc_to_gt(guc), "Mis-aligned log %s size: 0x%X vs 0x%X!\n",
>> +				  sections[i].name, log->sizes[i].bytes, log->sizes[i].units);
> 
> this 'mis-alignment' issue seems to be due to our coding fault so we
> should use xe_gt_assert() to catch that
good idea, will do xe_gt_assert_msg to have more info

> 
>> +		log->sizes[i].count = log->sizes[i].bytes / log->sizes[i].units;
>> +
>> +		if (!log->sizes[i].count) {
>> +			xe_gt_err(guc_to_gt(guc), "Zero log %s size!\n", sections[i].name);
>> +		} else {
>> +			/* Size is +1 unit */
>> +			log->sizes[i].count--;
>> +		}
>> +
>> +		/* Clip to field size */
>> +		if (log->sizes[i].count > sections[i].max) {
>> +			xe_gt_err(guc_to_gt(guc), "log %s size too large: %d vs %d!\n",
>> +				  sections[i].name, log->sizes[i].count + 1, sections[i].max + 1);
>> +			log->sizes[i].count = sections[i].max;
>> +		}
>> +	}
>> +
>> +	if (log->sizes[GUC_LOG_SECTIONS_CRASH].units != log->sizes[GUC_LOG_SECTIONS_DEBUG].units) {
>> +		xe_gt_err(guc_to_gt(guc), "Unit mismatch for crash and debug sections: %d vs %d!\n",
>> +			  log->sizes[GUC_LOG_SECTIONS_CRASH].units,
>> +			  log->sizes[GUC_LOG_SECTIONS_DEBUG].units);
>> +		log->sizes[GUC_LOG_SECTIONS_CRASH].units = log->sizes[GUC_LOG_SECTIONS_DEBUG].units;
>> +		log->sizes[GUC_LOG_SECTIONS_CRASH].count = 0;
>> +	}
>> +
>> +	log->sizes_initialised = true;
>> +}
>> +
>> +static void guc_log_init_sizes(struct xe_guc_log *log)
>> +{
>> +	if (log->sizes_initialised)
>> +		return;
>> +
>> +	_guc_log_init_sizes(log);
>> +}
>> +
>> +static u32 xe_guc_log_section_size_crash(struct xe_guc_log *log)
>> +{
>> +	guc_log_init_sizes(log);
>> +
>> +	return log->sizes[GUC_LOG_SECTIONS_CRASH].bytes;
>> +}
>> +
>> +static u32 xe_guc_log_section_size_debug(struct xe_guc_log *log)
>> +{
>> +	guc_log_init_sizes(log);
>> +
>> +	return log->sizes[GUC_LOG_SECTIONS_DEBUG].bytes;
>> +}
>> +
> 
> add kernel-doc for public functions
> 
>> +u32 xe_guc_log_section_size_capture(struct xe_guc_log *log)
>> +{
>> +	guc_log_init_sizes(log);
>> +
>> +	return log->sizes[GUC_LOG_SECTIONS_CAPTURE].bytes;
>> +}
>> +
>> +bool xe_guc_check_log_buf_overflow(struct xe_guc_log *log, enum guc_log_buffer_type type,
>> +				   unsigned int full_cnt)
>> +{
>> +	unsigned int prev_full_cnt = log->stats[type].sampled_overflow;
>> +	bool overflow = false;
>> +
>> +	if (full_cnt != prev_full_cnt) {
>> +		overflow = true;
>> +
>> +		log->stats[type].overflow = full_cnt;
>> +		log->stats[type].sampled_overflow += full_cnt - prev_full_cnt;
>> +
>> +		if (full_cnt < prev_full_cnt) {
>> +			/* buffer_full_cnt is a 4 bit counter */
>> +			log->stats[type].sampled_overflow += 16;
>> +		}
>> +		xe_gt_notice_ratelimited(log_to_gt(log), "log buffer overflow\n");
>> +	}
>> +
>> +	return overflow;
>> +}
>> +
>> +unsigned int xe_guc_get_log_buffer_size(struct xe_guc_log *log,
>> +					enum guc_log_buffer_type type)
>> +{
>> +	switch (type) {
>> +	case GUC_DEBUG_LOG_BUFFER:
>> +		return xe_guc_log_section_size_debug(log);
>> +	case GUC_CRASH_DUMP_LOG_BUFFER:
>> +		return xe_guc_log_section_size_crash(log);
>> +	case GUC_CAPTURE_LOG_BUFFER:
>> +		return xe_guc_log_section_size_capture(log);
>> +	default:
>> +		MISSING_CASE(type);
> 
> there should be no need for 'default' case if you properly define your
> enum type
Compiler could check static error, while 'default' here can cover 
run-time errors. I would prefer to have it for public funcitons.
> 
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +size_t xe_guc_get_log_buffer_offset(struct xe_guc_log *log,
>> +				    enum guc_log_buffer_type type)
>> +{
>> +	enum guc_log_buffer_type i;
>> +	size_t offset = PAGE_SIZE;/* for the log_buffer_states */
>> +
>> +	for (i = GUC_DEBUG_LOG_BUFFER; i < GUC_MAX_LOG_BUFFER; ++i) {
>> +		if (i == type)
>> +			break;
>> +		offset += xe_guc_get_log_buffer_size(log, i);
>> +	}
>> +
>> +	return offset;
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_guc_log.h b/drivers/gpu/drm/xe/xe_guc_log.h
>> index 2d25ab28b4b3..de55de4052ca 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_log.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_log.h
>> @@ -7,6 +7,7 @@
>>   #define _XE_GUC_LOG_H_
>>   
>>   #include "xe_guc_log_types.h"
>> +#include "xe_guc_types.h"
>>   
>>   struct drm_printer;
>>   
>> @@ -17,7 +18,7 @@ struct drm_printer;
>>   #else
>>   #define CRASH_BUFFER_SIZE	SZ_8K
>>   #define DEBUG_BUFFER_SIZE	SZ_64K
>> -#define CAPTURE_BUFFER_SIZE	SZ_16K
>> +#define CAPTURE_BUFFER_SIZE	SZ_1M
>>   #endif
>>   /*
>>    * While we're using plain log level in i915, GuC controls are much more...
>> @@ -36,6 +37,11 @@ struct drm_printer;
>>   #define GUC_VERBOSITY_TO_LOG_LEVEL(x)	((x) + 2)
>>   #define GUC_LOG_LEVEL_MAX GUC_VERBOSITY_TO_LOG_LEVEL(GUC_LOG_VERBOSITY_MAX)
>>   
>> +static inline struct xe_guc *log_to_guc(struct xe_guc_log *log)
>> +{
>> +	return container_of(log, struct xe_guc, log);
>> +}
>> +
>>   int xe_guc_log_init(struct xe_guc_log *log);
>>   void xe_guc_log_print(struct xe_guc_log *log, struct drm_printer *p);
>>   
>> @@ -45,4 +51,13 @@ xe_guc_log_get_level(struct xe_guc_log *log)
>>   	return log->level;
>>   }
>>   
>> +u32 xe_guc_log_section_size_capture(struct xe_guc_log *log);
>> +
>> +bool xe_guc_check_log_buf_overflow(struct xe_guc_log *log,
>> +				   enum guc_log_buffer_type type,
>> +				   unsigned int full_cnt);
>> +unsigned int xe_guc_get_log_buffer_size(struct xe_guc_log *log,
>> +					enum guc_log_buffer_type type);
>> +size_t xe_guc_get_log_buffer_offset(struct xe_guc_log *log,
>> +				    enum guc_log_buffer_type type);
> 
> missing space ?
> 
>>   #endif
>> diff --git a/drivers/gpu/drm/xe/xe_guc_log_types.h b/drivers/gpu/drm/xe/xe_guc_log_types.h
>> index 125080d138a7..3d4bf2a73102 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_log_types.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_log_types.h
>> @@ -7,6 +7,14 @@
>>   #define _XE_GUC_LOG_TYPES_H_
>>   
>>   #include <linux/types.h>
>> +#include "xe_guc_fwif.h"
>> +
>> +enum {
>> +	GUC_LOG_SECTIONS_CRASH,
>> +	GUC_LOG_SECTIONS_DEBUG,
>> +	GUC_LOG_SECTIONS_CAPTURE,
>> +	GUC_LOG_SECTIONS_LIMIT
>> +};
> 
> what's the relation with enum guc_log_buffer_type  ?
> seems to be identical
Right, also crash/debug is reversed to enum guc_log_buffer_type, but it 
is identical, will be removed.

> 
>>   
>>   struct xe_bo;
>>   
>> @@ -18,6 +26,22 @@ struct xe_guc_log {
>>   	u32 level;
>>   	/** @bo: XE BO for GuC log */
>>   	struct xe_bo *bo;
>> +
>> +	/* Allocation settings */
>> +	struct {
>> +		s32 bytes;	/* Size in bytes */
>> +		s32 units;	/* GuC API units - 1MB or 4KB */
>> +		s32 count;	/* Number of API units */
> 
> why signed ?
Oh, all s32 here could be u32

> 
>> +		u32 flag;	/* GuC API units flag */
>> +	} sizes[GUC_LOG_SECTIONS_LIMIT];
>> +	bool sizes_initialised;
>> +
>> +	/* logging related stats */
>> +	struct {
>> +		u32 sampled_overflow;
>> +		u32 overflow;
>> +		u32 flush;
>> +	} stats[GUC_MAX_LOG_BUFFER];
>>   };
>>   
>>   #endif
