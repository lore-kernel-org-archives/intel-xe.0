Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE838606A319
	for <intel-xe@archiver.kernel.org>; Thu, 22 Oct 2026 06:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BV9w8VDP
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 829EA10E0C2;
	Thu, 22 Oct 2026 06:30:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6743710E0C2
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Oct 2026 06:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792650625; x=1824186625;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=J1/WDQI475YUZf+qW1s7TJmk6xsFaFDwo3W9sZfOYME=;
 b=BV9w8VDP+H00w7Ld1u4TQr089VemtkO+YDiszT+4cs2Sa9MaW6JYfAmS
 0wbZ2MTYF/UI+A7smIz6+7uRqMu9SpuT0O18z2sAlVnllLYW6w9fBNXDF
 spglJ/i4j19eW+QWGtegJQkQ8R3JX3Pbhr4E/pENOn+6NBnX7coBpVHXt
 w5chvILn3VC351+O199jqgjnY6z7C20J1Vz1iiBPa1RMIsVPGqWr90vD0
 NksQkhLiuxAxhiTQc3UJ++/SDQGppIpJmQNAIgEnhJkH788bzZ5DXeEOK
 0ekuPwtK2URboOgK+fh/a5rAbUhL0kY1CEHaTse3eO471n7nbCUFOYq+a A==;
X-CSE-ConnectionGUID: GFKMB9bBS/ujzUOrh1C+Mg==
X-CSE-MsgGUID: ZXhO2XR6Sm2xaDJJw8i76A==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1422978"
X-IronPort-AV: E=Sophos;i="6.27,171,1787036400"; d="scan'208,217";a="1422978"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2026 23:30:24 -0700
X-CSE-ConnectionGUID: WBQOp6kPTfu0l9FhX8VgmA==
X-CSE-MsgGUID: XEsny6Y9T5CK/AEDAIvO0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,171,1787036400"; d="scan'208,217";a="3633533"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2026 23:30:24 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 21 Oct 2026 23:30:23 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 21 Oct 2026 23:30:23 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.47) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 21 Oct 2026 23:30:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pa+mXVoL2zvu1q/Lf+vaI00PW5NTuIizAk8Y5+53YniI1S4FrsyG3Sf/6cK5DGqfCyegwdRZAt287pElZ7CJIqsYgfszgoSwgJ800ldnKcVb2xL4oGq7y9LCS2/la7xSBMUs77ZK2X5oZQ/h9kRblc8lJDfVLZybLjfd8YsmYJrcrtE7sKCRHr+rV0L5Nbw2+yW0Y6u2Z74Y7tAHfO/dTAU5drS1vVvJapfU8gi3+/DK3hAyWQ4XCIMIlsDhEUXzVEnj1lLocSQRtoARLEE/y/u6DUGDqWab+2oPllKDpo+453Ra/RzuwY5y9IK/9sZ3ef6T2wQW+4WSTfBIFDvRHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D/Mkv9UQy9O9Hh6yzlKtlBkgrrqYJoeSziTxLndx+Tw=;
 b=dVfF3OsXThOsxHn4qTHSN8aX3ZzYsXDJjEzquzUIe+fQUdcb5jSSskQzK2G2A3yiAIl/UeKI+co5kdB3tBxCtG9c2faQQqKIjxUNGLmswnvlcz9HMk8Z/3wFXFFxF3edRock6XxelOR1iX3F0cKcLvN4cL3m/Eoa9baS/VMNnN/8T1bjnaA/Q/+F69bSiPjCEBBTva31b0BNk9nyC799isHZmk8aXy3kP8N8I49jFyZALUC/+e3wKAaczmfoe7ojscL1pkno2MtxwXW7FFukUZguIgoV/IK/OpAkjLBrTXOEixeZfFDz4rt4tXg5HHfCuwbEgglms6mqBfjeR9SMdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7145.namprd11.prod.outlook.com (2603:10b6:510:1ec::17)
 by LV8PR11MB8463.namprd11.prod.outlook.com (2603:10b6:408:1ed::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Thu, 22 Oct
 2026 06:30:15 +0000
Received: from PH7PR11MB7145.namprd11.prod.outlook.com
 ([fe80::341e:838e:e911:f62b]) by PH7PR11MB7145.namprd11.prod.outlook.com
 ([fe80::341e:838e:e911:f62b%6]) with mapi id 15.21.0546.012; Thu, 22 Oct 2026
 06:30:15 +0000
Content-Type: multipart/alternative;
 boundary="------------9ELdF8ABL0cL10iF1gOR0oIW"
Message-ID: <7c0b318c-3074-4c6c-aacd-5a8d6aa4a3b9@intel.com>
Date: Thu, 22 Oct 2026 12:00:07 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] ATS/PASID SVA support and PRI-less fault servicing
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <himal.prasad.ghimiray@intel.com>
References: <20261021041117.1774877-1-naresh.kumar.g@intel.com>
 <d5cc6853e434ccc4d6fbb65c9ea30a000e03fa5e.camel@linux.intel.com>
Content-Language: en-US
From: "Kumar G, Naresh" <naresh.kumar.g@intel.com>
In-Reply-To: <d5cc6853e434ccc4d6fbb65c9ea30a000e03fa5e.camel@linux.intel.com>
X-ClientProxiedBy: MA5P287CA0202.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1aa::8) To PH7PR11MB7145.namprd11.prod.outlook.com
 (2603:10b6:510:1ec::17)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7145:EE_|LV8PR11MB8463:EE_
X-MS-Office365-Filtering-Correlation-Id: 10da9f56-0681-45fd-1aba-08df3005eeb4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|261021123027099003|56012099006|261009223027099003|11063799006|4143699003|10067099003|18002099003|22082099003|261021121427099003|8096899003;
X-Microsoft-Antispam-Message-Info: lXpvHm/vPd6LT4d4WZVwmV053vVhiQQRqjQh35xILqYjy2J1A4XLydmc1jkcov8npWVRzuusiC8UHKqDvGJpaK+jRr4yeTVsHRCx/5/OeNKQVKKVD2XC8T6n7VJWPGNjTJAMjSHFcAtwQdgnsBiLbKmqsZX5m03eHbIKnPn+2XCexlAYDeStADB/got+XdYYkokuOphn8hg1o3QABJAzS2OSktGYP3jMhv2Nn9etrRY+t97LL6WWGQWW2IP+i0R6grjeSUvgmNIFtkyQcY6pc3QOPs5tk95U7nTE5yhyWFxnqL3X7o8kc7Dx0bHK9oSvHLn3I0JbGyEQqBRwQlGtHefO9hFKidU40ftS88f04Sb18h8bMSW17gWXrbzt0IZFQ+nB1uIv7XIPxK9e3wDjeD4TWE+W99Sl5Tpcq12GElhR2rDxrIkiHR/RLgDkyUNHSZQdnGtp6JfkB+CK+x9oChjB8COANPTzv0RDisXSiarb/LGEOSOhMGkKgH8ioGzn1FY3uEWlN+78dRuVWvY6rT4lhZIAQeGxueMiD0TkDNlz6LNeo1dcdkv0kmeDSEbz+60eeR6Glxno2kqUsd5fjVWaH9AXQM+Y/4HN9ESqhHQOVLkK2YzBPYToh1Qn/Zfd3pEQC/12mDwsTCGcEqjbRaFkBxaps2zp2mZ6n0fiQJc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7145.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(261021123027099003)(56012099006)(261009223027099003)(11063799006)(4143699003)(10067099003)(18002099003)(22082099003)(261021121427099003)(8096899003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VkZDZzZHbHNqbFFIV2RRdVlhMkZrWmxROTBST2lwR2MveHMxTDIxRzFtVXZk?=
 =?utf-8?B?VnVKcWdOQlV5d0xHWFMrUlRYSllmTDZPZkUvRHJJTDNhZGV3Z0lvQnJxVXRm?=
 =?utf-8?B?UW5scTB1V1NJNXpEbmlpV0tDOVdNMHhHcHkxWlY2WWdVS0k3OXF4bWc0K2d0?=
 =?utf-8?B?dUlKN1Y3a2dSWHE5RmYxdHJ1S2lYMkJSYWpHVzlSWkxtazZoRFJCMFdaQmQ2?=
 =?utf-8?B?Wk8wU2RUQ0tBbjVUdXF1ZkExRG56TzlOR0NWUnl0bUZ3QkZOTUQvTTlsbDFO?=
 =?utf-8?B?RmNNbFljVko3OHdlQ2hhSmtWT3lRMnE2S3VaR2tXWUMzOG1LeCsxT2tzNS9Y?=
 =?utf-8?B?YUp2L0FmVGhlaXgwamxxeWRGRXk2SS9DVUhxZmYwVHZGQ1dCRldxMFN2eDd5?=
 =?utf-8?B?TTlaOVhOSUVaK1pLRjFsUDRHaHRYb2x5S3RRaENVQ1FKYU0raWo3M0xZTE1N?=
 =?utf-8?B?YlpMclMyRDE0b0tmTi8vQW5qdzRUKytzZWlvY0p6QjdGS0xhNUZrWElqZk5P?=
 =?utf-8?B?aDNYQ0Ixb1hnR09zcVowRFpsUk1TODlmRlRRRjRkSFFMbFZiQ0VSVVpyNldJ?=
 =?utf-8?B?M2hHeWFvWEpuSUJ6QitaSkpoUlZMVVAwUndjN25zc3VGRXZ6MmRIKzJKSjhI?=
 =?utf-8?B?azVDNFJKZ2tBYVhyelJsQ3NaeHJ5Rkc5SEJWTVZLSHgybWd6bVgvWWtCeHJP?=
 =?utf-8?B?MzQzVnVaM2RtLzdnVTVNcGQvL0Fha1ZTejg4L1JWQkJwWXdlTzRBUTdpRGhU?=
 =?utf-8?B?VUoxZFh5V1d6T3BNbSsrdU52azZyMWZiYXJxVHpzRFpFaCtzc2tiWUQyTUh2?=
 =?utf-8?B?bHRZdHlzWHhBVVNJb0NJQmVRQ0RxR0lDQlUrRUszZ1I0UTJ1aEFRbjlQOUs3?=
 =?utf-8?B?a2Q5MHE4WjNaRDhmTUFNa29FeEhIak1lOVB5QmJlRG8wNUJab2k4eVdyd3B4?=
 =?utf-8?B?cldQaHJEajBQMjE1WjJqczFFSXlXN2RSRlo0a01hamFFVTVYRkYrTS85UEEv?=
 =?utf-8?B?eFd5Y2NhME1lTlhLOS9CTzlkek02STJVL3IvWjc5VFM1V004RVNvWTdqMHd1?=
 =?utf-8?B?ZW4yd0ZpdXpmMXJad210NkRaQ1hGSEI2MG1TTTdhNlBVNEpQSDdSYWVkeHMr?=
 =?utf-8?B?VnJZZ3RVOHhHTm5OWE1yMXM0WkNyb05aMEpsRHp5d0RxYWl0N1FhN3lXQjBx?=
 =?utf-8?B?SStCOEU3UisyY3pjVG5rZTRpNDV1eCtPSC9idEdQemdtYnR2NE9leU5WeGJj?=
 =?utf-8?B?N0NYb2l6Y01pV3dCUHVSU2xTc2Y4aG13WG1Ic2YzL2FEcWswZmVSQnlNM1ZC?=
 =?utf-8?B?elJ1MVRlNTBQRXA2NG1XeXdydXRVblZnZ0YxY1JJMHBVTkUrcktMY21Ib2o3?=
 =?utf-8?B?amhwbEZnc2JPYTJHd2lyS29sNlQ3UUhuRlZCYXNsendQSUxZQWdCTHY2dzdk?=
 =?utf-8?B?N0xtRXpRMnRLVXBnbHUwNS83eFloMTZSakhwUVN0Z0syOTNEYnBOY0NvaGhz?=
 =?utf-8?B?dVlqbTFkREJNZ3pJOXI5R1BVNHFmWGJKaWQ2QVFpS0lMMFROT053UWUzMlpv?=
 =?utf-8?B?dmkyUmxXS3cxMTBJam8rUmcvVlVIeitXUGJ4R3ZENkhlbkpMSGsxSGk1V3Aw?=
 =?utf-8?B?QVRLNis1alpkU0VOdDl3U3lMM2tsRmJudFBuUlBkZFdBQkxqcnp6OVE4ckNJ?=
 =?utf-8?B?WFlnMjg2eWdDVy9KVk9ETnRHWjd6eGFKSkphV0J5WXM2RjNsQ3cycmNZSFdK?=
 =?utf-8?B?YUxnVGtEcWhwL2pQMEJ4RUF4Z1BJZ3BwSW9Zd3pESWhKTzluNVMzTEJZQnZq?=
 =?utf-8?B?MjlqUEJBKzJia3lQZ00vVW1tSkVWT3V3TlA0aHYzOC9VRnZScVdVRktIN2tz?=
 =?utf-8?B?VHVNV251UXRKa29hTzNZVEEwbml1OUlhOWJlRkhQeGF5bXR0MDNSVi92Qjl4?=
 =?utf-8?B?dEQzZGkwd3J3aHFXaEFiOGVjTjYxcHdXYUthUkdOUWwvN3JIQTBZMlNxUXhW?=
 =?utf-8?B?ZUpvcHEvdHMzTTc3bXBZejJxZm1NNHpoZVhqVDBTWDdVb2EwaTBFL2dOUjcv?=
 =?utf-8?B?aXdPYnpWR1ByZ29QY1BCeUlocW5kR2p2T3N3RWpmM0R3MER6RFlNQk4wdTAw?=
 =?utf-8?B?V1RLalNhbHNPYUhValRDWVRkRWx6TVpzVXo3d1VHRkFZalRYRUZXWE4rRTdV?=
 =?utf-8?B?VEpqM1pUeEVWbGhTU0VKVDBVd2E5WENiMTE0T01TalNGeHIrUUJxNTZjWjJr?=
 =?utf-8?B?OURoTjV1eUoyUVBzRENzZCszaGdZQWpqUUxVbGphQnN1SExVS0YvMVlKaGZS?=
 =?utf-8?B?aFAxc3B5VHQwV0pOQVlyVGlNMEYzR2lhVEZnakpBd1lLRncyZm5Zdz09?=
X-Exchange-RoutingPolicyChecked: RqvcOZ8DiWruleixc72WFn//Hp8N2Sv2UJbhCLCPoNg3SDCzHku0spTi10qRWOq7S7mG41jmygG7okFoEkH4Icth0d5vrN8dk/2TFriJ8LiNeE9SfTCflG+4Tvliy2Xea7G9OeHhHtYS/FxKej/QQ3jcl9SqsmPjhfX2YN8K7e7UAGnDcAWkTmgZufCC7P9qo5ErJvsa6pQTtB7FAIRLGhShLsBtBC9SJmwjx69nk3HxKpdbvfOiF5e/IFvopzT32laNpNA9BaCie0f881FmS4map7IRxDhTPesXSxL5AVfP+yZmjQo+ZLZX6r9blMldUic/hKre3P/LsExnfyeRVA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 10da9f56-0681-45fd-1aba-08df3005eeb4
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7145.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 06:30:15.1140 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: beArZ1OaVCWe/QsMcp8i+uWVWy3rTvZamoJkaTTjj/WRGjjQk77CgySCFrcYoR/BFHYiayzOV/lQ13krFcSpy0yLwrqRdXDasSPlJQeEOSI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8463
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
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	HTML_MESSAGE,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--------------9ELdF8ABL0cL10iF1gOR0oIW
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

Hi Thomas,

On 10/21/2026 8:55 PM, Thomas Hellström wrote:
> Hi!
>
> On Wed, 2026-10-21 at 09:41 +0530, Nareshkumar Gollakoti wrote:
>> This series adds initial Shared Virtual Addressing (SVA) support for
>> xe
>> on platforms where ATS and PASID are available but PRI is not enabled
>> or
>> not supported.
>>
>> For SVA, the device must be able to issue memory transactions tagged
>> with a PASID so that address translation is performed in the process
>> address space rather than in a driver owned address space. This
>> series
>> adds the xe side infrastructure needed for that flow: VM support for
>> SVA
>> PASID state, PASID retriveal helpers, and programming of
>> CTX_SYS_PASID
>> for ATS and PASID enabled contexts.
>>
>> On systems with PRI, device page faults can be surfaced and resolved
>> through the hardware page request interface, so the driver does not
>> need
>> to implement a separate fault servicing path for SVA.
>> On non PRI systems, that hardware assisted fault path is
>> unavailable.In
>> that case, the driver still needs a way to resolve faults against the
>> backing process address space so execution can proceed.
>>
>> To support that case, this series introduces a CPU mirror VMA and
>> uses
>> it as part of a driver managed SVM path for SVA faults without
>> PRI.The
>> purpose of the CPU mirror VMA is to provide a CPU side VMA
>> representation for the address range being accesses through SVA,so
>> the
>> driver can rely on the kernel MM/VMA machinery to validate mappings
>> and
>> resolve backing pages for fault handling in the absence of PRI.In
>> other words, since the device cannot issue PRI requests, the driver
>> needs a CPU visible VMA context that mirrors the GPU SVA range
>> closely
>> enough to let faults be service through normal MM paths.
>>
>> At a high level, this series does the following:
>>
>>   1. log ATS/PASID enablement state during probe,
>>   2. add VM infrastructure needed for SVA PASID support,
>>   3. add a helper to retrieve the VM SVA PASID,
>>   4. program CTX_SYS_PASID for ATS/PASID-enabled contexts,
>>   5. add a PCI helper for ATS/PASID operation without PRI,
>>   6. add a CPU mirror VMA for handling SVA faults on non PRI platforms
>>
>> Patches 1-5 provide the ATS/PASID and VM/context plumbing needed for
>> this flow and have been validated internally.Patch 6 adds the non PRI
>> fault servicing path, and feedback on that overall approach would be
>> especially appreciated.
> I was under the impression that we'd integrate this with current SVM so
> that we can still migrate to VRAM and use page-table mirroring or keep
> data in system memory and use SVA page-table sharing *OR* page-table-
> mirroring depending on user-space's wish?
>
> Thanks,
> Thomas

IMO, Yes, that is the intended model. Userspace picks between the two 
approaches with the bind.

Bind with CPU_ADDR_MIRROR → existing SVM. GPU page fault, optional VRAM 
migrate, PPGTT mirroring and this path is unchanged.

Do not bind → SVA page-table sharing. IOMMU walks the CPU page tables 
with ATS+PASID. Backing has to stay in system memory. This is the 
end-to-end share flow, and it needs ATS+PASID+PRI.

If PRI is missing, an ATS miss cannot be healed by the IOMMU. The device 
then reports a GPU page fault. Instead of NACKing that unbound fault, we 
create a CPU-mirror VMA and service it with the same SVM path so the GPU 
gets a PPGTT mapping.


So, ATS+PASID+PRI → share works as user space asked (no bind). Bind 
with CPU_ADDR_MIRROR → SVM, independent of PRI. *PRI-less is only the 
recovery path when share cannot complete at the IOMMU*.(This is one of 
the proposal)


Let me know if anything am missing.


Thanks,

Naresh

>
>> Himal Prasad Ghimiray (1):
>>    drm/xe/vm: Setup SVA infrastructure for PASID support
>>
>> Nareshkumar Gollakoti (5):
>>    drm/xe/pci: log ATS/PASID enablement state at probe
>>    drm/xe/vm: add helper to retrieve VM SVA PASID
>>    drm/xe/lrc: program CTX_SYS_PASID for ATS/PASID-enabled contexts
>>    drm/xe/pci: add helper for ATS/PASID without PRI
>>    drm/xe/pagefault: add CPU mirror VMA for SVA faults without PRI
>>
>>   drivers/gpu/drm/xe/regs/xe_lrc_layout.h |  6 +++
>>   drivers/gpu/drm/xe/xe_lrc.c             | 37 ++++++++++++++++
>>   drivers/gpu/drm/xe/xe_pagefault.c       | 49 ++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_pagefault_types.h |  6 +++
>>   drivers/gpu/drm/xe/xe_pci.c             |  7 ++++
>>   drivers/gpu/drm/xe/xe_pci.h             | 15 +++++++
>>   drivers/gpu/drm/xe/xe_vm.c              | 56
>> +++++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_vm.h              |  2 +
>>   drivers/gpu/drm/xe/xe_vm_types.h        |  6 +++
>>   9 files changed, 184 insertions(+)
--------------9ELdF8ABL0cL10iF1gOR0oIW
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi Thomas,</p>
    <div class="moz-cite-prefix">On 10/21/2026 8:55 PM, Thomas Hellström
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:d5cc6853e434ccc4d6fbb65c9ea30a000e03fa5e.camel@linux.intel.com">
      <pre wrap="" class="moz-quote-pre">Hi!

On Wed, 2026-10-21 at 09:41 +0530, Nareshkumar Gollakoti wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">This series adds initial Shared Virtual Addressing (SVA) support for
xe
on platforms where ATS and PASID are available but PRI is not enabled
or
not supported.

For SVA, the device must be able to issue memory transactions tagged
with a PASID so that address translation is performed in the process
address space rather than in a driver owned address space. This
series
adds the xe side infrastructure needed for that flow: VM support for
SVA
PASID state, PASID retriveal helpers, and programming of
CTX_SYS_PASID
for ATS and PASID enabled contexts.

On systems with PRI, device page faults can be surfaced and resolved
through the hardware page request interface, so the driver does not
need
to implement a separate fault servicing path for SVA.
On non PRI systems, that hardware assisted fault path is
unavailable.In
that case, the driver still needs a way to resolve faults against the
backing process address space so execution can proceed.

To support that case, this series introduces a CPU mirror VMA and
uses
it as part of a driver managed SVM path for SVA faults without
PRI.The
purpose of the CPU mirror VMA is to provide a CPU side VMA
representation for the address range being accesses through SVA,so
the
driver can rely on the kernel MM/VMA machinery to validate mappings
and
resolve backing pages for fault handling in the absence of PRI.In
other words, since the device cannot issue PRI requests, the driver
needs a CPU visible VMA context that mirrors the GPU SVA range
closely
enough to let faults be service through normal MM paths.

At a high level, this series does the following:

&nbsp;1. log ATS/PASID enablement state during probe,
&nbsp;2. add VM infrastructure needed for SVA PASID support,
&nbsp;3. add a helper to retrieve the VM SVA PASID,
&nbsp;4. program CTX_SYS_PASID for ATS/PASID-enabled contexts,
&nbsp;5. add a PCI helper for ATS/PASID operation without PRI,
&nbsp;6. add a CPU mirror VMA for handling SVA faults on non PRI platforms

Patches 1-5 provide the ATS/PASID and VM/context plumbing needed for
this flow and have been validated internally.Patch 6 adds the non PRI
fault servicing path, and feedback on that overall approach would be
especially appreciated.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
I was under the impression that we'd integrate this with current SVM so
that we can still migrate to VRAM and use page-table mirroring or keep
data in system memory and use SVA page-table sharing *OR* page-table-
mirroring depending on user-space's wish?

Thanks,
Thomas
</pre>
    </blockquote>
    <p>
    </p>
    <p style="margin:0in;font-family:Calibri;font-size:11.0pt">IMO, Yes,
      that is the
      intended model. Userspace picks between the two approaches with
      the bind.</p>
    <p style="margin:0in;margin-left:.375in;font-family:Calibri;font-size:11.0pt">Bind
      with&nbsp;CPU_ADDR_MIRROR&nbsp;→ existing SVM. GPU page fault, optional VRAM
      migrate, PPGTT mirroring and this path is unchanged.</p>
    <p style="margin:0in;margin-left:.375in;font-family:Calibri;font-size:11.0pt">Do
      not bind → SVA page-table sharing. IOMMU walks the CPU page tables
      with
      ATS+PASID. Backing has to stay in system memory. This is the
      end-to-end share
      flow, and it needs ATS+PASID+PRI.</p>
    <p style="margin:0in;font-family:Calibri;font-size:11.0pt">If PRI is
      missing,
      an ATS miss cannot be healed by the IOMMU. The device then reports
      a GPU page
      fault. Instead of NACKing that unbound fault, we create a
      CPU-mirror VMA and
      service it with the same SVM path so the GPU gets a PPGTT mapping.</p>
    <p style="margin:0in;font-family:Calibri;font-size:11.0pt"><br>
    </p>
    <p style="margin:0in;font-family:Calibri;font-size:11.0pt">So,
      ATS+PASID+PRI →
      share works as user space asked (no bind). Bind
      with&nbsp;CPU_ADDR_MIRROR&nbsp;→ SVM, independent of PRI. <b>PRI-less is
        only the
        recovery path when share cannot complete at the IOMMU</b>.(This
      is one of the proposal)</p>
    <p style="margin:0in;font-family:Calibri;font-size:11.0pt"><br>
    </p>
    <p style="margin:0in;font-family:Calibri;font-size:11.0pt">Let me
      know if anything am missing.</p>
    <p style="margin:0in;font-family:Calibri;font-size:11.0pt"><br>
    </p>
    <p style="margin:0in;font-family:Calibri;font-size:11.0pt">Thanks,</p>
    <p style="margin:0in;font-family:Calibri;font-size:11.0pt">Naresh</p>
    <blockquote type="cite" cite="mid:d5cc6853e434ccc4d6fbb65c9ea30a000e03fa5e.camel@linux.intel.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">
Himal Prasad Ghimiray (1):
&nbsp; drm/xe/vm: Setup SVA infrastructure for PASID support

Nareshkumar Gollakoti (5):
&nbsp; drm/xe/pci: log ATS/PASID enablement state at probe
&nbsp; drm/xe/vm: add helper to retrieve VM SVA PASID
&nbsp; drm/xe/lrc: program CTX_SYS_PASID for ATS/PASID-enabled contexts
&nbsp; drm/xe/pci: add helper for ATS/PASID without PRI
&nbsp; drm/xe/pagefault: add CPU mirror VMA for SVA faults without PRI

&nbsp;drivers/gpu/drm/xe/regs/xe_lrc_layout.h |&nbsp; 6 +++
&nbsp;drivers/gpu/drm/xe/xe_lrc.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 37 ++++++++++++++++
&nbsp;drivers/gpu/drm/xe/xe_pagefault.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 49 ++++++++++++++++++++++
&nbsp;drivers/gpu/drm/xe/xe_pagefault_types.h |&nbsp; 6 +++
&nbsp;drivers/gpu/drm/xe/xe_pci.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 7 ++++
&nbsp;drivers/gpu/drm/xe/xe_pci.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 15 +++++++
&nbsp;drivers/gpu/drm/xe/xe_vm.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 56
+++++++++++++++++++++++++
&nbsp;drivers/gpu/drm/xe/xe_vm.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 2 +
&nbsp;drivers/gpu/drm/xe/xe_vm_types.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 6 +++
&nbsp;9 files changed, 184 insertions(+)
</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------9ELdF8ABL0cL10iF1gOR0oIW--
