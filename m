Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03B07C4345F
	for <intel-xe@archiver.kernel.org>; Tue, 30 Apr 2024 11:25:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9808910E5F1;
	Tue, 30 Apr 2024 11:25:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dMh8imhY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C6A710E5F1
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Apr 2024 11:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714476345; x=1746012345;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=t6HL3hJlNwP+42+1m07M6mF1srO+lvfUTykD7ibySrw=;
 b=dMh8imhY4qjlOxzJdqVDnKCx/6o0isZqIPDGs/7DvYeuA4wnZO1m6ynD
 //NQ8kFt2shiX2I2OxvBR0JYtVWzBvs0noRIsnjCG9Rs6ZATOeYciFLja
 3p+QS08ZWxHKeWHtCmIp3KiQY1+W9qpg/+QNMULJFAD112y3GLBupaVuR
 UjH01Im1FFETzpr2IXbd5Wa5EcrVRxQfvqHhwDw/S+W5xgdyh53RiyZaS
 I8VeNFijgm9C+Vznspt+q8EW5JpOSl1Zv5psW4TLlutmGYJEcDzwTczG0
 Y10AmpGBNU8YJKo1uV+B+CadK8RZC2q35BtdrGaUrlMOj4jXsGrYA3+jp Q==;
X-CSE-ConnectionGUID: uVA/rAQCTOK1cC5Nrz2Tbg==
X-CSE-MsgGUID: N+w5tyoOR5ih/qLJdJFdEQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11059"; a="27628495"
X-IronPort-AV: E=Sophos;i="6.07,242,1708416000"; d="scan'208";a="27628495"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2024 04:25:45 -0700
X-CSE-ConnectionGUID: ZEwkzBK9THGtlDCdWxwTrw==
X-CSE-MsgGUID: mwsA2AhqSZeV+WRqpmkFog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,242,1708416000"; d="scan'208";a="49638325"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Apr 2024 04:25:43 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 30 Apr 2024 04:25:43 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 30 Apr 2024 04:25:43 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 30 Apr 2024 04:25:43 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 30 Apr 2024 04:25:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JgIGgRrS/FjmShq1zepT9tmnwFAoKMg1ivfEwE/pV6GQLR9BMBXo0PAOi3JT0XkN57ZBJEMwZRYcbenMLHFehrvvmTrSOxpV/UuYEydCPkprWV21tRzZz22T9eXkyeUp+AXJpdfPbmSX394MvUrpo2ps5RqufOG9cJP7oV9xZqZA46wtqyYflwblt1PUIFHtwxQ8N8fzii1wJgGiwFFch2ppVAxTzWxo3i3okbjcxczRHzpKFmPCavvkin93dmTdjY2n00Z6iNWl8w/OBEpx1m77+WfCdGhhcGswBykdCEwQHsffneKaCiNYIUzMw5PN/zm6BHONQJmRdGByH4OkxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/tnehKlNBOOWgGGN5JgQvZ0lDDptfujPuALoosCjqUc=;
 b=Tejr7K32jnpLcB8xGOJqYMbu1REK4NpngTWokhT8WfqpbSXPl0sFn27E8YCta/43hPa9SeVNIIm2F9TLBGCO1IsXq2aAtDSnXSAPyrxY9HIZuel8I3rOpRhD0n0uD79rkwXckXfDo4uV8W3FhZ+vyjHCq0ew3vNfNd11Y60qaRCg66KHBys2lSjD5Fk0lDJsJS+5FfoqmHGlQ/4A+aRvCt/NxNBsN0dJGnnIA1NFe3TgKCYj+aK+Fw9sjOpE9klwb45UeYXAleDaqxLHSxonzr/cQrUIJS+KLfFwxpWrCoQ47fJ9xiNbky21FEWFKK5lk7CtAEtSsvseccFQRw9YAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by CY5PR11MB6510.namprd11.prod.outlook.com (2603:10b6:930:42::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.34; Tue, 30 Apr
 2024 11:25:35 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::8e17:1f3b:64f:9c67]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::8e17:1f3b:64f:9c67%4]) with mapi id 15.20.7519.031; Tue, 30 Apr 2024
 11:25:35 +0000
Message-ID: <29b2e173-55f3-48dc-9343-b107812fffac@intel.com>
Date: Tue, 30 Apr 2024 16:55:28 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe/pf: Implement pci_driver.sriov_configure
 callback
To: =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, "Michal
 Wajdeczko" <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
References: <20240426132217.2351-1-michal.wajdeczko@intel.com>
 <20240426150713.ntnegd6r4s3qbpvk@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20240426150713.ntnegd6r4s3qbpvk@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0059.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:99::13) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|CY5PR11MB6510:EE_
X-MS-Office365-Filtering-Correlation-Id: 98fd076a-5668-4c67-9bb3-08dc690840d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bnoybkN4a0JkZ0FxaXk3cW9lcmpmdDJONzl4UDB4TWl2Ujg2QW1OR01QU0Nm?=
 =?utf-8?B?eXVrWGgvUGlWTG9NL3I2MjIzbW5YcmluZ0VVVTJHdG1iSWNJUjJiakFRd3Zh?=
 =?utf-8?B?aWdtdW4vc1I0bmxpbkx4R1YwTUxtcHNzYTRnTjVrU2xSbkRZNEtzR29jS0ll?=
 =?utf-8?B?MEp5NFdQTVhqdlJUaWlqdllFb2EzeHZYU01SUXplQzc4ZzY3elNKNEFSU2du?=
 =?utf-8?B?RlA4a0R0L2cxYjFXZ2dyb3pIRFBKNStaVWpzTXVESUhORmErZmJQVU1FV285?=
 =?utf-8?B?SWtaLzVQQ2xqaDgwbmN5ditSNzREcnpYQkZHTjArMGRTaWt5V0YxcVduaCty?=
 =?utf-8?B?K2ZvT1FqRHVNd3Jvc29Pa0JSMjRZS2ZueWtlcG0xeGt1NVBNVWJTdXRmMlpo?=
 =?utf-8?B?dzJTNzQ3SHdxeExEbUZ3ZWJocDBvKzZjaU9NZjl5Zi9leldSNFVUekp0d0Qy?=
 =?utf-8?B?dndkUHAvN0pEV0lTOUNWQmFwVUdUNXB3MzJhdk5HbDJxb3hiQm9NMzNhdTNF?=
 =?utf-8?B?VUtQYkdhWUU0a2J2eTRXeXZVRmxPT1ZodU1QMUFYc0I3clllOEttYzgrR0lj?=
 =?utf-8?B?aUxWbE5kdHRpUXJScU5PT3c4Z3BpNXNOcVd1ek1QQ3Zlb3RRdm52TnlLSzJF?=
 =?utf-8?B?dE02ZkM0WHAvQjQyTHY0TnlXS2Q5ZVFuU1lsK01JNHhOcElnQ281VDlEdU40?=
 =?utf-8?B?NTBrVU9uV1h6eGt0TXgyZWZZcmlrRS8zSlFVa2w3VTJyWHpPOTdKOG5raWxG?=
 =?utf-8?B?c3ZqQzFXMkd6Nm8razIzQXFoZjVkSHRjN1R1WGRRZG8wY1c5T0ZEOUVyZHlI?=
 =?utf-8?B?dzE4K2ZLSFpGQUIwaHBDYmVrQy9MMnBRZmk1UEpaZDNIdmQzNkZhVVhFUVd3?=
 =?utf-8?B?OWp2NkpxMTNVdFBnbk5vcXdIR1RzVGQva1NWbFZKYUV2ZDRqLyswVWFFakNm?=
 =?utf-8?B?VFRpZzNHZjkzODJ1aWMvWGVYeG9wblFNU3VhSXdkU2FPcUlxOHhseCtsN2Nr?=
 =?utf-8?B?am96ZjNta1VteWU4dktaaDNwU0NacGV3TzFTd3ZmODRTbFVxZzlRSXhqYmFO?=
 =?utf-8?B?aUxjS21INUViOXRzVm50N0VYZ28xSVAyajFxNTlPOUpIZVh2azZMdTBjWHpa?=
 =?utf-8?B?RHlGNHFXUlhUZUFxSXpBeElmdmVPTU5ieVZrdUhWbm9XODI3WTBKSFZ2cU8z?=
 =?utf-8?B?WFJFZnIyNTdhcnMvb0xScWdLNFZJUjZ4NFl5ODN3bHlrSS9sK1BYMzkyd0xZ?=
 =?utf-8?B?SmQyQWU4SmVxaGN3TFV5bjVyUlZpd1JTdGhDdU53M2dwZlhlOTlyTGN0dDhT?=
 =?utf-8?B?Vkl5MGxnT2JWRjV1RVdiMUZSSjZFYmJxNWo4MUhSTmRXU3U3cXhsTS9jUGN1?=
 =?utf-8?B?b04zQkJsdDQyWDhHeFdIMGQwaWFNR3lIZG1QYU1lNU1XQlQrVkc0NUJCM0pV?=
 =?utf-8?B?UlNObjhhdFo0enBjaHR4RXo1NGlLYmwzUVQ3S2wwQWRlT3pXRnp4c2lHNUIw?=
 =?utf-8?B?MHhjWFAyMUE5RUV4dEtrUmUzcGhjeGFNV1luNzJJc1lhb2MzM0NKS3pZck5p?=
 =?utf-8?B?USs1cFptTlpPcFJsc28ySDlFOFMwSkZ1ZTBIRkkyeDRVUTZGUTFmUldvK0pr?=
 =?utf-8?B?TElzc3psU3hncWVORWJtclB5dmYreW5UY1hKMkxha05XZTBvVWRTTFR4Szl2?=
 =?utf-8?B?eWNkVGV4NVJkZmt3VTBwRnBBNW1zeFRqSVZldFF3NWtpMnR1MmJHUnZRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SzJscTY2Qkw4WXVReDlKVXFIaWczOGN6N2VmVkZHeTN3WWdNYlVWQzhGaEFm?=
 =?utf-8?B?eHpVWWNaaENuQ21qS2VIWklacjkrL3dLSzFvT0dZMlNVRmo5anlGQW9TdlQ4?=
 =?utf-8?B?N2M5aFQ1RDNtZzU0a2dKZFY0NHVMWERNNzdrOFZEQ2pQd3JuZUhxVWpLU1or?=
 =?utf-8?B?TVgxZUthTnQxOHJKTDJ4bG9ZMFJqS0Y3Vzg1Z1E4SEFOVWszS282Uk9lS05V?=
 =?utf-8?B?Zlo2ZVFpUGVtdVVHUk1GTWdvMEdjU09IR2E4Rjd6cDQ1T2Y3cklPZ2pGQUZX?=
 =?utf-8?B?TERRNXNwMjlxRFVsN2g0dVJJZTVKSVEvOVRUT2dlWWdrNEVQOVBrdUdKUTgz?=
 =?utf-8?B?eVhMNlVFUFpWWnlCMHFxWFpZdk5ULzkwazdLdCtxNUdTYTlFSUlWL2I1dnlh?=
 =?utf-8?B?cit4TWdmamJkaExTZnJKUXpmZzRDYjFSQWZSVVdGNkp1Z1htUUxaNms3VmZj?=
 =?utf-8?B?RmhUUkttUCtndjM2SjZ2ZXdybzdCZ0JjK3lvWW1IQ2ZQbmdGUlNEWTBXekF6?=
 =?utf-8?B?MWU0Sm9nWlo2NE5BamJPdWtFZDlSdDdFS2NiYjB6N0ZWS0RBWXFQaUVuZWww?=
 =?utf-8?B?NEhuUkZOSkNvemNESXFkUWFud0J3eDE1MmsxVHRwRU4yVFRLRWc4dkZhdlRQ?=
 =?utf-8?B?NFk5eDV2OTVhUEl6ZnlGVFQ1c1dEV3BuQ1BtMUlkK1NRbnNqcGFqUThNaGpZ?=
 =?utf-8?B?aTNzVVdxR29leXVWN1BoVHl6a3NDYk9XU1NlYWJNdmV1ZU1UU0FlRjVmajFz?=
 =?utf-8?B?cURhVDh5a3Y4cHczOGpURktxRldKQzVseEtBQlJoQzhUcXNPelhSbTBwLzdP?=
 =?utf-8?B?SUIwNE0vMXZtU0MvZHdIT2Yxb0IyelJqcGJqWjhhNkljd296RmtuTlNaaGJI?=
 =?utf-8?B?d2k0RXlXNDJMZ3RsYVVaSHVJUkVOdzhLNjNjT2U1OE82b3lEd2FQSi93d2JZ?=
 =?utf-8?B?U05EczRnN0hKenUzbldNVzV0a1k3NytyNEY4eW16dnh4dzdNWE1HN1RFbEh3?=
 =?utf-8?B?SytlZHlmOGp3a1hnMDREaUNuQ3EzdjFEdkQ1RjV6c09YRE1IRUFmL1JwS1M0?=
 =?utf-8?B?MHdpR1ZRanpvYlN4R3ZBb0tZQVN3bjEvYVkyeXJJcFN4cXpaYmhXWVlxdTl4?=
 =?utf-8?B?U3gzSUNUSUhTTEtPTmdjemZ0SWIxeS92R3N2UFJqWmJxMm81c1lxQnhqNTVF?=
 =?utf-8?B?dzg2REp6UlpJd0gvbzh4WE0vL1Y0MzByZWNBdmxyRWRMZFZXMStKK01lOUFx?=
 =?utf-8?B?cFpEcnJhK3NBc1daeVpWUjN2Y0NFb0dkVnZobDFJRU9yL3Y5WTFQMzc2dXBq?=
 =?utf-8?B?TVBDckxxY1M1UG1EOUoraHloeDJ3MnNhcWdaSmlCYlhRd3ErNlhrdkUzSWht?=
 =?utf-8?B?d0Rrc2ZCc05SblN5dkkrdUZpdjN3aGhtQi9jSTJRMEo0ZlBMNlFyamRocmxp?=
 =?utf-8?B?Y0lRTzQyVWdIWEtPMWxWMGJHd2N6M3JtejRjQ2dzMnV4QUJ5bFRwUzQ1bkR0?=
 =?utf-8?B?Q1NQQWFpK093Yy96eVl3RmE2bHdKZTFqZndPbVl3RjJvaW51c0grQ2l2MTJt?=
 =?utf-8?B?R0ZlTmFuTWZkUmducG14djlkSjlUL1lDMGsvTEdGU1A2WlJ0VmViTDdoR3Vx?=
 =?utf-8?B?ZzBoc040cmJwRFlvSHhoMjAvUnRIRk4xN1UrZ3pTOElMdWFMZDJhdmRsVmFl?=
 =?utf-8?B?cGlOVUYxWnNNbFMxQXFGcjViZXpkMVlvWVRMa01KemxrQmdFTXFCQ3N2UVVN?=
 =?utf-8?B?TXY5bFh2d2xpbzlRUmZvWUdaSHJRaGVHREtseFBGcXExSitEaHQwSmxjM212?=
 =?utf-8?B?RGN4Mi9pN25aZXZNOXdOMElYbW5oeVM1UFpUaGtkWmF1Y0RIcW9hS2FFcCtL?=
 =?utf-8?B?czVITno2a3FkSkg1eE5RTFFEcVg0ZVFOcktoUzhtWVluaTA4YnhhK0F1SWtX?=
 =?utf-8?B?UlpOS2dNbnRKNXA0Y1FSUjI2ZWdRUVhEREdiWHpCQkVEUTdYdHN6R3c0YVNJ?=
 =?utf-8?B?YWpGa3lWWW5MVlYxL0NMRDNMVHJqbnNpMzdJWmtCL2J3eHZtdjJDV0JLeS9w?=
 =?utf-8?B?WVgzRFJBK3NHc212cGFFREtwSW1MMlJMT2kydnl1QUl4Qk15OGZjanlaQXhV?=
 =?utf-8?B?MjRPaEs3ZGFpNFR3dGRmaXpiMW5taDFiZEJqby9BTFJiQldCTGtLaXpFejBV?=
 =?utf-8?B?M0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 98fd076a-5668-4c67-9bb3-08dc690840d3
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2024 11:25:35.1135 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4KFGpwFV/6CFjyXPq83/zGmt0B7oHYDy/0FlAl0pbku5wdfLs+ktfvmXS2rat2SiUVAvrXEO1dRaODHZULHMkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6510
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



On 26-04-2024 20:37, Piotr Piórkowski wrote:
> Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on pią [2024-kwi-26 15:22:17 +0200]:
>> The PCI subsystem already exposes the "sriov_numvfs" attribute
>> that users can use to enable or disable SR-IOV VFs. Add custom
>> implementation of the .sriov_configure callback defined by the
>> pci_driver to perform additional steps, including fair VFs
>> provisioning with the resources, as required by our platforms.
>>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
>> ---
>> v2: check result of VFs provisioning (Piotr)
>>      use xe_sriov_pf_get_totalvfs consistently (Piotr)
>>      prefer VFID instead of plain a VF number (Piotr)
>> ---
>>   drivers/gpu/drm/xe/Makefile       |   1 +
>>   drivers/gpu/drm/xe/xe_pci.c       |   4 +
>>   drivers/gpu/drm/xe/xe_pci_sriov.c | 138 ++++++++++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_pci_sriov.h |  13 +++
>>   4 files changed, 156 insertions(+)
>>   create mode 100644 drivers/gpu/drm/xe/xe_pci_sriov.c
>>   create mode 100644 drivers/gpu/drm/xe/xe_pci_sriov.h
>>
>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>> index a67977edff5b..6acde66f0827 100644
>> --- a/drivers/gpu/drm/xe/Makefile
>> +++ b/drivers/gpu/drm/xe/Makefile
>> @@ -169,6 +169,7 @@ xe-$(CONFIG_PCI_IOV) += \
>>   	xe_lmtt.o \
>>   	xe_lmtt_2l.o \
>>   	xe_lmtt_ml.o \
>> +	xe_pci_sriov.o \
>>   	xe_sriov_pf.o
>>   
>>   # include helpers for tests even when XE is built-in
>> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>> index a0cf5dd803c2..f3efde939df4 100644
>> --- a/drivers/gpu/drm/xe/xe_pci.c
>> +++ b/drivers/gpu/drm/xe/xe_pci.c
>> @@ -23,6 +23,7 @@
>>   #include "xe_macros.h"
>>   #include "xe_mmio.h"
>>   #include "xe_module.h"
>> +#include "xe_pci_sriov.h"
>>   #include "xe_pci_types.h"
>>   #include "xe_pm.h"
>>   #include "xe_sriov.h"
>> @@ -952,6 +953,9 @@ static struct pci_driver xe_pci_driver = {
>>   	.probe = xe_pci_probe,
>>   	.remove = xe_pci_remove,
>>   	.shutdown = xe_pci_shutdown,
>> +#ifdef CONFIG_PCI_IOV
>> +	.sriov_configure = xe_pci_sriov_configure,
>> +#endif
>>   #ifdef CONFIG_PM_SLEEP
>>   	.driver.pm = &xe_pm_ops,
>>   #endif
>> diff --git a/drivers/gpu/drm/xe/xe_pci_sriov.c b/drivers/gpu/drm/xe/xe_pci_sriov.c
>> new file mode 100644
>> index 000000000000..75248fdd6cee
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_pci_sriov.c
>> @@ -0,0 +1,138 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2023-2024 Intel Corporation
>> + */
>> +
>> +#include "xe_assert.h"
>> +#include "xe_device.h"
>> +#include "xe_gt_sriov_pf_config.h"
>> +#include "xe_pci_sriov.h"
>> +#include "xe_pm.h"
>> +#include "xe_sriov.h"
>> +#include "xe_sriov_pf_helpers.h"
>> +#include "xe_sriov_printk.h"
>> +
>> +static int pf_provision_vfs(struct xe_device *xe, unsigned int num_vfs)
>> +{
>> +	struct xe_gt *gt;
>> +	unsigned int id;
>> +	int result = 0, err;
>> +
>> +	for_each_gt(gt, xe, id) {
>> +		err = xe_gt_sriov_pf_config_set_fair(gt, VFID(1), num_vfs);
>> +		result = result ?: err;
>> +	}
>> +
>> +	return result;
>> +}
>> +
>> +static void pf_unprovision_vfs(struct xe_device *xe, unsigned int num_vfs)
>> +{
>> +	struct xe_gt *gt;
>> +	unsigned int id;
>> +	unsigned int n;
>> +
>> +	for_each_gt(gt, xe, id)
>> +		for (n = 1; n <= num_vfs; n++)
>> +			xe_gt_sriov_pf_config_release(gt, n, true);
>> +}
>> +
>> +static int pf_enable_vfs(struct xe_device *xe, int num_vfs)
>> +{
>> +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>> +	int total_vfs = xe_sriov_pf_get_totalvfs(xe);
>> +	int err;
>> +
>> +	xe_assert(xe, IS_SRIOV_PF(xe));
>> +	xe_assert(xe, num_vfs > 0);
>> +	xe_assert(xe, num_vfs <= total_vfs);
>> +	xe_sriov_dbg(xe, "enabling %u VF%s\n", num_vfs, str_plural(num_vfs));
>> +
>> +	/*
>> +	 * hold additional reference to the runtime PM as long as VFs are
>> +	 * enabled to keep GuC alive - will be released in pf_disable_vfs()
>> +	 */
AFAIK PF shouldn't be placed in lower power state than VF. With that in 
above comment we should mention PF alive rather than GuC alive.
>> +	xe_pm_runtime_get(xe);
>> +
>> +	err = pf_provision_vfs(xe, num_vfs);
>> +	if (err < 0)
>> +		goto failed;
>> +
>> +	err = pci_enable_sriov(pdev, num_vfs);
>> +	if (err < 0)
>> +		goto failed;
>> +
>> +	xe_sriov_info(xe, "Enabled %u of %u VF%s\n",
>> +		      num_vfs, total_vfs, str_plural(total_vfs));
>> +	return num_vfs;
>> +
>> +failed:
>> +	pf_unprovision_vfs(xe, num_vfs);
>> +	xe_pm_runtime_put(xe);
>> +
>> +	xe_sriov_notice(xe, "Failed to enable %u VF%s (%pe)\n",
>> +			num_vfs, str_plural(num_vfs), ERR_PTR(err));
>> +	return err;
>> +}
>> +
>> +static int pf_disable_vfs(struct xe_device *xe)
>> +{
>> +	struct device *dev = xe->drm.dev;
>> +	struct pci_dev *pdev = to_pci_dev(dev);
>> +	u16 num_vfs = pci_num_vf(pdev);
>> +
>> +	xe_assert(xe, IS_SRIOV_PF(xe));
>> +	xe_sriov_dbg(xe, "disabling %u VF%s\n", num_vfs, str_plural(num_vfs));
>> +
>> +	if (!num_vfs)
>> +		return 0;
>> +
>> +	pci_disable_sriov(pdev);
>> +
>> +	pf_unprovision_vfs(xe, num_vfs);
>> +
>> +	/* not needed anymore - see pf_enable_vfs() */
>> +	xe_pm_runtime_put(xe);
>> +
>> +	xe_sriov_info(xe, "Disabled %u VF%s\n", num_vfs, str_plural(num_vfs));
>> +	return 0;
>> +}
>> +
>> +/**
>> + * xe_pci_sriov_configure - Configure SR-IOV (enable/disable VFs).
>> + * @pdev: the &pci_dev
>> + * @num_vfs: number of VFs to enable or zero to disable all VFs
>> + *
>> + * This is the Xe implementation of struct pci_driver.sriov_configure callback.
>> + *
>> + * This callback will be called by the PCI subsystem to enable or disable SR-IOV
>> + * Virtual Functions (VFs) as requested by the used via the PCI sysfs interface.
>> + *
>> + * Return: number of configured VFs or a negative error code on failure.
>> + */
>> +int xe_pci_sriov_configure(struct pci_dev *pdev, int num_vfs)
>> +{
>> +	struct xe_device *xe = pdev_to_xe_device(pdev);
>> +	int ret;
>> +
>> +	if (!IS_SRIOV_PF(xe))
>> +		return -ENODEV;
>> +
>> +	if (num_vfs < 0)
>> +		return -EINVAL;
>> +
>> +	if (num_vfs > xe_sriov_pf_get_totalvfs(xe))
>> +		return -ERANGE;
>> +
>> +	if (num_vfs && pci_num_vf(pdev))
>> +		return -EBUSY;
>> +
>> +	xe_pm_runtime_get(xe);
I think this is not needed as rpm ref is already being held and released 
in vfs enable and disble function.

Regards,
Badal
>> +	if (num_vfs > 0)
>> +		ret = pf_enable_vfs(xe, num_vfs);
>> +	else
>> +		ret = pf_disable_vfs(xe);
>> +	xe_pm_runtime_put(xe);
>> +
>> +	return ret;
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_pci_sriov.h b/drivers/gpu/drm/xe/xe_pci_sriov.h
>> new file mode 100644
>> index 000000000000..3b8bfbf7e1d9
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_pci_sriov.h
>> @@ -0,0 +1,13 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2023-2024 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_PCI_SRIOV_H_
>> +#define _XE_PCI_SRIOV_H_
>> +
>> +struct pci_dev;
>> +
>> +int xe_pci_sriov_configure(struct pci_dev *pdev, int num_vfs);
>> +
>> +#endif
> 
> 
> LGTM:
> Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
> 
>> -- 
>> 2.43.0
>>
> 
