Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DF1CCA5FA1
	for <intel-xe@archiver.kernel.org>; Mon, 28 Sep 2026 16:08:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAB6D10E134;
	Mon, 28 Sep 2026 16:08:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TaP1u+ma";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AB1110E134
 for <intel-xe@lists.freedesktop.org>; Mon, 28 Sep 2026 16:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790611704; x=1822147704;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=KlNUq8N7WpxnDO6TkcaeEXMtuYfT/nZ3t35cLNnruqc=;
 b=TaP1u+ma4jc5LZN1IOBOsBwut14bd1lAJytBN0yoVtFvoo9yS5b6xVKm
 qsfK/E6b20jcQTgzhbFAMjeNVa5EseIRoH9W4u+lio3tdhT3ENgrB1ZOb
 3MzVSyDHnrFCNJgv4xYWRvCLDLmqgAY24fcZtHKx9giZV4D7V0t4PO6BD
 eJDq/2CHHCpskNsfp0RZyNvstsNzlUfMCdTonwjknsc1k0tZ9ABEipkve
 VCcm0ErM4E8W2JUlPBvBGTeBvBC1naGV9EqyqcW+Pi7c5k8Q/d5VyswoO
 VdkSdZiQJTmL+se+mjJ/uTt3tzAEnhMywp2rUghKtE5Mprn4v7KhQUzL1 g==;
X-CSE-ConnectionGUID: 0YuaMEysQ++EjUAL/BNBxw==
X-CSE-MsgGUID: KIV6L/C1SmSYDkmoIQAw5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="108805089"
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; d="scan'208";a="108805089"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2026 09:08:24 -0700
X-CSE-ConnectionGUID: d78mjNn+Sj2RoB0eM0PD8w==
X-CSE-MsgGUID: QZORSU0UTDyVTUIAItNnbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; d="scan'208";a="303036080"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2026 09:08:24 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 28 Sep 2026 09:08:23 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 28 Sep 2026 09:08:23 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.3) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 28 Sep 2026 09:08:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tUt9LUcpOqAtDETwJDQF+ksa8RlEe2ZQiT0uDDGxZI04LW8qU8E6/6YmF1vkdxa8GIaEITsX9nLIu9xaB5ClxOI6bnzJMQAraBWyEpplFn4bHXDVQLcfygOquHgBRMR+rK8rGAJso9rHLPeKriVt14/t+6ZepDuXnMAvSVLhajd4z1Fu6RfM7D0IXUvPbeRkXF5aKj7Fnd7po86RyIYzE1IqAhCBz93wRFH3FLK5o5+4DO5w5RXZ28PSBs5y52HVY6ZuxOWT5ZPBHZ+BR+2rgWiG41/SJBf1yMQ0UkNZ40hw6+x8QRWASuVooak9b7HLiJjFrDcl9mDgqC2tJw5D7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eTrcFZIS8vwG472ud00CjelUIO380+pMjPrVgDLLnf0=;
 b=mNrbUpF8eH/Tl71BUISuSBAolUNN7SusVYYa60bYxjQxZfIZn6Hq+4AVR35TI6WF429rW+PSiLA9R/sbeQtzpqQN2aWjfKoLVbGXXYUBLAUCCsMTswYAihYcxOS9ygi3WtftYXNbmd3c2FWQyXt4MZj8QHqSyMxMOqSH1PQcoQbp1tf8Huqt/LSliw0w/Iz7lX70vla1+Fgh5majIurt8Fb6MFeAck5mNkGuVjSUsHZWZIqPwSJnuvnEbiXzOlL5Rfg5PxGMesn/UcOAxKEiBx6BptR56TtI6YsSjroycYFGDt2lUYyuKtG1iGT2nORK0cS/mg+hU49hYQI5IPWZdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5249.namprd11.prod.outlook.com (2603:10b6:610:e0::17)
 by SJ5PPFC295640A5.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::852) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Mon, 28 Sep
 2026 16:08:16 +0000
Received: from CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3]) by CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3%6]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 16:08:16 +0000
Message-ID: <54b739c1-f86f-40fa-ab43-0edf72840b8e@intel.com>
Date: Mon, 28 Sep 2026 21:38:06 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 04/13] drm/xe/hwmon: Add helpers to validate thermal
 sensor readings
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <raag.jadav@intel.com>, <riana.tauro@intel.com>,
 <sk.anirban@intel.com>, <mallesh.koujalagi@intel.com>,
 <soham.purkait@intel.com>
References: <20260924205429.2846256-1-karthik.poosa@intel.com>
 <20260924205429.2846256-5-karthik.poosa@intel.com>
 <armyqeTPA83vcjMv@intel.com>
Content-Language: en-US
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <armyqeTPA83vcjMv@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0222.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b4::15) To CH0PR11MB5249.namprd11.prod.outlook.com
 (2603:10b6:610:e0::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5249:EE_|SJ5PPFC295640A5:EE_
X-MS-Office365-Filtering-Correlation-Id: 90c492ac-9863-4ac1-27c0-08df1d7ab439
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|10067099003|11063799006|3023799007|18002099003|22082099003|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info: AjwF7H6+6cS5DsI2VAZu0TOC2xA4QpxtXR6ieN8KzfqlPcRrV7yLv0jjvngd56NhLioZoyKNZX7ZW3Ya4IcIzrpp/MzAvXNoV1j0fw5MsrQCZxMLi0kS+dpi9SdPqeSdvUD08Zkq2XqhqS94okir52psQteoiZk98JoOxkXhWGFKatFSFzY37FCsvwltWDEIit4HvTvGK7M25kfe2n4+pF5zhzAOpS/6xF3r0chflcK6ce8ewUJMb1jtIpUVLjKA3jUG36daKltvx/MOKVBZZkHSRTPAcq+Rw8bHcPds/RtqyY9qQM8OXQvFnzppvWrEWf12I/AZRYXI4SZe66MQk68M/SSA8CLmnopigQV0kgWo03MROWY0o+MdxxtLYiT2Qfz2i5BV8Tinv0K9uHwI7u2nNng+LpUH0tgVUxFdgKLy2Y8JVPvC6RpIjheqP0Xm33S9s6gH3c0V+FpR6AMU3ygkE3B4BbmXfCPpLoUrv5li/ZYsD53N5rGJNkZ8ITzNDkOaxfa4iRNwwSR2I9FwdlaB9NNJofW/jZhp7BBhV/4RqvGvZqzG25DOedOovZcxfB/o48N3sfjZHFbnYrNG1KyDfu0ItXfAgpEEt55aXzo3dm09dUPgFXhu3Fq30L4+lTZWey6+tihZVqsNSM7WSviV4+lDP7TVcAdKkWKuZnw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5249.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(10067099003)(11063799006)(3023799007)(18002099003)(22082099003)(4143699003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cnZNa3lXeWRoNDRLd2dBMlRpSjNOMWNOdmFGeCtNTWp4ZmtIVkZLSkZiVFZ5?=
 =?utf-8?B?dVlmNEFKVlVkK1EwNnltcHk4RE5KeVd6ODRjdkprY1hZdVM1M0dMbU1CWmhD?=
 =?utf-8?B?Z1ByUFNJU3RyYkJDcHMvTFFKaWdKV2dmL09BMklmSFJQcEd3ZjZaaGpoUkxx?=
 =?utf-8?B?V2lackRGbFBEM0c0RUFSdy9XZUc4SDNscENIeHowd1FuZnd3OU16c1BiWU5D?=
 =?utf-8?B?NHpBK2JtajJNL3JOSTU0TnB2dGVzcEt4Q1YrSG0rVE1IZFM5b3RTWkZpTS8v?=
 =?utf-8?B?SWRjUVZGOHQ0NGFjK2hiQVF4VzdhSjhYU0ppdHZpd2tWVVlSZHBGRmFRUTNx?=
 =?utf-8?B?a3hxK2dxSDNmRzVhZTh1bTJMZVZjMURiVEhSTXVxNTZ2QUlPWE9SSnBMT1ZS?=
 =?utf-8?B?ZG1LbXJwZlhQaHVuMlRqK2lsSVprQkhFcDgxY1dkZ051Qzd0YnVIMWEyMnJ4?=
 =?utf-8?B?RlJzeWcveFl6TEJpeDV4SDJMMy9Idmw5WUMyNzNLZFlzRjRyYytsVnQ2UThL?=
 =?utf-8?B?VHJOV2xnR2FzLzlRYTZzUnloUkFZVmxWOWtBSWFyT3JsQUpDSU4zSVppbCt2?=
 =?utf-8?B?YWJTbUtpamk5YU9GUGlMUjg1M2FsZzhwTFpUZkpaVmFCbmh0bEVORTVjNVBm?=
 =?utf-8?B?cmJsUWluOTYxMktUcDVwdDk5bmhjYVZrVTBqVjl1UmYrSm9vMUtRSDNtVm9l?=
 =?utf-8?B?aFhvK3IzbmM5emZUYlU3RE92bVN0TmRTUDZ5b3VkYnFWNTZ1VnBNQW9lNWtB?=
 =?utf-8?B?dzRQWktGTHlXeWtKSHJhSkIwd1Nod2Y5WklQNDVpREZJbktoaGYrR1lNaEZD?=
 =?utf-8?B?UzNNMVdkMytmN0VGTEFqMGxMQ3AzOUFMbVMwcU4xVDkrWXVNckRyZDh0eW03?=
 =?utf-8?B?a2R2Q0VWOU1ZVWdOY3dMaFU4MDJIZnNRTEJ4WDhBb0J4Q1pFWkh4NkdPNGxE?=
 =?utf-8?B?UUJPQ01JUVpZMGZxZkdkL0FpcnVRT0pGY0lOcFVJVU10eW1BUXRuMGwyWG5B?=
 =?utf-8?B?WXdubmNhVWIvVjBnM3ZTT2xYNGFrbWgzTVpUekZ0OHlEMElXblVjcnRGZFow?=
 =?utf-8?B?SjFjbFc0QS83Z0I4STJieitzNmEyVlFoQXFtRXdLQVVrL1RBN0p5by9ielRy?=
 =?utf-8?B?VDlzbjR6SzRURmwyaFUrazBvNml3UFdsTzgzdVNHVGdqQ2x1bi9CQ1FLWWpL?=
 =?utf-8?B?Q2dKUUJVQmxuKzl2QnZ2aHVsMC9aaG5GYWRGS2N1Z05QUmdHUGlTdFRpRFEr?=
 =?utf-8?B?N3dERWRiR3lrdkpSU01mMk9FWXBMSlBjRzJlWS9kNWV6YzZDTGZ5OFZqZjc0?=
 =?utf-8?B?MzR4dm1LcTYvNW9SdzJKRmdXL1g4R0hxcDlnLzMxWklkRWMrNE1ueXdzOGZv?=
 =?utf-8?B?em1Oblc1RDgwMkpGay8yV3JJM1lVdWpFSmpldWxiTlBBMDVYNVR6WEFTMENx?=
 =?utf-8?B?ZFVVNTVTWEVqT2tiMmQ5YU1UZW1KTE5RVFN5V1MzdnRxWElnNGlWVlR4bi9H?=
 =?utf-8?B?cjQrbTU2QlBXZjl3a2FVYkZJeDNtTXcwcnN3bmZxYWV2R1o5RU1GUFcyUWNM?=
 =?utf-8?B?SzQyaDNQQlI0dnBpQW5wdnFtTWVCbXJRbXJIYnJneE00MGFtbzBVbjlLSHdC?=
 =?utf-8?B?d25UMHEzMDNGWUMyZU9qalpaQXN5RzFjVUxROUx1Unlld3ByZHNmRmRJdkpj?=
 =?utf-8?B?bzI1T2lhaXJjWjdEZUVNMVdINFNwME5La1g5TDZsOHJVQ0R5SEVVYkJ0cUFm?=
 =?utf-8?B?MnpvTWJmQXorMjNBNzlrdE5ETTBxY2hLQVpEa1dPTE0rREg0N1RqalA0RXpo?=
 =?utf-8?B?OVozOS94aTNvdWdqbG1Rd29tWkJmS1g3K2xmZDNpRHNsSVQzRVgvZHlTRzdV?=
 =?utf-8?B?cDRYZmwyVnRSQ1F0bkFUdlFNcTRGaG5nR1RKYWpnNzJUbGgvNlJTbW1nelMv?=
 =?utf-8?B?ckdoNUxBaUk3WHZGeFV2R1NwRy9FNVg2NThnR256RVRtVWhTdUt6ODlmM1BY?=
 =?utf-8?B?TnRFSWxQTnI3WWRodEplUmp1S1h6OEZsUlYrb0p6UHlIdXgwajF3eWR3WkZw?=
 =?utf-8?B?bDYxb055Y2paZGw3NFVOcVhPaVAxdDhsZDdzenlUTkV6OE1IWXVPRkI0dndt?=
 =?utf-8?B?S1ZJTUNtNU1TVFVuSzE5aXlnL21HdDN2N0k5Z1l6OWR3YTBvc3VxMFE0YStK?=
 =?utf-8?B?ek16ZmgrZ1dHRUx6RFVtNnkrUzJOSUJ4Z1B5Y0xmaitGdEI1NjBUYW9LZ2Jm?=
 =?utf-8?B?cTJUeUhkZmw4RW5icmIrMjIrMTJWY0x0MEFQTmJmVEU4MnNyU0hpOEdEdElx?=
 =?utf-8?B?YU1JZE4yMWxwMFVib3ZhbGpKUS9UNHIxam9Nd083KzRZVTlDSFFZZz09?=
X-Exchange-RoutingPolicyChecked: p5qq+TJH2+FU9ja4AsgUIOmQnBIzaaj97K9jp0IsJ/0MJDzUrfz6+/l4ODezF/FyCyNqFUnisx58wGga/xsXREwRdDohAEnJ+Eck1G1n/TfZ47PsQkCK0qO1jCN93xiiHcZSudzSTjX+xmSC9/I/pp4rXUobdDFOeb4qSZ25BsPuXpgouBwUPndkErk9EqS9o/ywZjIIBrGZvz+/A2ixKDAOrbq2Tds59Y7KtrVah7XaC3+MjazUtuzD3oe8+4lYygA5fxmdKi6hbO9NixIqVc1Gq5ZVK2Q9KEia4T52fvAWMncIuYqHBFGw+p/pvgVZltSmu0B6vjQPLcXF4JNGgw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 90c492ac-9863-4ac1-27c0-08df1d7ab439
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5249.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 16:08:15.9062 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f9EWHZ80hcP71k65zv9KggbiG475l/jNhQEb0JPFwTf8PmmuwLTvj2D+2e9WHNE2L3PtNO8fhlStGHUiK8jvdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFC295640A5
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


On 28-09-2026 05:49, Rodrigo Vivi wrote:
> On Fri, Sep 25, 2026 at 02:24:20AM +0530, Karthik Poosa wrote:
>> Add mmio_temp_valid() and mbx_temp_valid() to check whether a temperature
>> sensor reading is valid. An MMIO value of 0xFFFFFFFF or a mailbox value of
>> 0xFF indicates the sensor is unavailable.
>>
>> Gate these checks behind has_mbx_temp_sentinel, enabled on CRI currently.
>>
>> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_device_types.h |  2 ++
>>   drivers/gpu/drm/xe/xe_hwmon.c        | 16 ++++++++++++++++
>>   drivers/gpu/drm/xe/xe_pci.c          |  2 ++
>>   drivers/gpu/drm/xe/xe_pci_types.h    |  1 +
>>   4 files changed, 21 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>> index 4661bfce2f4e..87554605fa41 100644
>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>> @@ -202,6 +202,8 @@ struct xe_device {
>>   		 * pcode mailbox commands.
>>   		 */
>>   		u8 has_mbx_power_limits:1;
>> +		/** @info.has_mbx_temp_sentinel: Device has temperature-unavailable sentinels */
>> +		u8 has_mbx_temp_sentinel:1;
>>   		/** @info.has_mbx_thermal_info: Device supports thermal mailbox commands */
>>   		u8 has_mbx_thermal_info:1;
>>   		/** @info.has_mem_copy_instr: Device supports MEM_COPY instruction */
>> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
>> index c743867a2ebf..8a1dbe708828 100644
>> --- a/drivers/gpu/drm/xe/xe_hwmon.c
>> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
>> @@ -104,6 +104,9 @@ enum sensor_attr_power {
>>   /* Index of memory controller in READ_THERMAL_DATA output */
>>   #define TEMP_INDEX_MCTRL	2
>>   
>> +/* Mailbox sentinel reported for an unavailable temperature sensor */
>> +#define TEMP_MBX_INVALID	0xFF
>> +
>>   /* Mailbox temperature is sign-magnitude: bit 7 sign, bits 6:0 magnitude. */
>>   #define TEMP_MBX_SIGN		BIT(7)
>>   #define TEMP_MBX_MAG		GENMASK(6, 0)
>> @@ -822,6 +825,19 @@ static int xe_hwmon_pcode_read_thermal_info(struct xe_hwmon *hwmon)
>>   	return ret;
>>   }
>>   
>> +static inline bool mmio_temp_valid(const struct xe_hwmon *hwmon, u32 value)
>> +{
>> +	return hwmon->xe->info.has_mbx_temp_sentinel ? value != U32_MAX
>> +						     : value != 0;
> _mbx_ seems a wrong prefix now...
you are right, I can rename to .has_temp_sentinel
>
> And this patch is kind of hard to review alone without its usage...

shall merge this patch with the next 3 patches then ?

[PATCH v6 05/13] drm/xe/hwmon: Handle unavailable memory controller sensors

[PATCH v6 06/13] drm/xe/hwmon: Detect unavailable PCIe thermal sensors

[PATCH v6 07/13] drm/xe/hwmon: Consolidate temperature sensor 
availability checks

>
>> +}
>> +
>> +/* Mailbox temperature is sign-magnitude (bit 7 sign, bits 6:0 magnitude). */
>> +static inline bool mbx_temp_valid(const struct xe_hwmon *hwmon, u8 value)
>> +{
>> +	return hwmon->xe->info.has_mbx_temp_sentinel ? value != TEMP_MBX_INVALID
>> +						     : value != 0;
>> +}
>> +
>>   /* Decode an 8-bit sign-magnitude mailbox temperature to degrees Celsius. */
>>   static int mbx_temp_decode(u8 value)
>>   {
>> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>> index d66d5a0339ae..e656fc012902 100644
>> --- a/drivers/gpu/drm/xe/xe_pci.c
>> +++ b/drivers/gpu/drm/xe/xe_pci.c
>> @@ -476,6 +476,7 @@ static const struct xe_device_desc cri_desc = {
>>   	.has_gsc_nvm = 1,
>>   	.has_i2c = true,
>>   	.has_mbx_power_limits = true,
>> +	.has_mbx_temp_sentinel = true,
>>   	.has_mbx_thermal_info = true,
>>   	.has_mert = true,
>>   	.has_pre_prod_wa = 1,
>> @@ -796,6 +797,7 @@ static int xe_info_init_early(struct xe_device *xe,
>>   	/* runtime fusing may force flat_ccs to disabled later */
>>   	xe->info.has_flat_ccs = desc->has_flat_ccs;
>>   	xe->info.has_mbx_power_limits = desc->has_mbx_power_limits;
>> +	xe->info.has_mbx_temp_sentinel = desc->has_mbx_temp_sentinel;
>>   	xe->info.has_mbx_thermal_info = desc->has_mbx_thermal_info;
>>   	xe->info.has_gsc_nvm = desc->has_gsc_nvm;
>>   	xe->info.has_heci_gscfi = desc->has_heci_gscfi;
>> diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
>> index fed509ff601e..0041ec5676d3 100644
>> --- a/drivers/gpu/drm/xe/xe_pci_types.h
>> +++ b/drivers/gpu/drm/xe/xe_pci_types.h
>> @@ -50,6 +50,7 @@ struct xe_device_desc {
>>   	u8 has_late_bind:1;
>>   	u8 has_llc:1;
>>   	u8 has_mbx_power_limits:1;
>> +	u8 has_mbx_temp_sentinel:1;
>>   	u8 has_mbx_thermal_info:1;
>>   	u8 has_mert:1;
>>   	u8 has_pre_prod_wa:1;
>> -- 
>> 2.25.1
>>
