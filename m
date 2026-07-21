Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A200BC4451C
	for <intel-xe@archiver.kernel.org>; Tue, 21 Jul 2026 18:45:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D59710E1DD;
	Tue, 21 Jul 2026 18:45:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BtSOdAYg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1098910E1DD
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Jul 2026 18:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784659535; x=1816195535;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=YNc5fDAJOwRsM2hafsN6r/jB807ZXOWjjj/RFPqOxA4=;
 b=BtSOdAYg2U9f97wbOEoBKA2dfvHEfe7XUAbmsoUXA0aXV6eV2Bnz7zfF
 Q563QILtflr5EpL/C1wq+JMMJmmiNEscPbQMWCDzekF58VW0l7zD03ROD
 4yrRvYjPfAc5PFuJTSPab6xd7lvHOo3j7JwKniDSZ3BX5zv3McFsv4BCB
 GzGSh8xfiaFMHFh7hDTyXINkzBb91jicpVPepY9tjltHuJYjgM/gEQSrq
 g5MLE7uKh0s7K9UQ/DtHa5OshXUSdZwzbo4tz/oVFFwVyXTcCXNjuUFAy
 9tn/RtnIh7Mu3ZoESEn5Y0C1Mnc2ZCPSRVW3yQfjOnOfRoq/xrMlmFzcJ g==;
X-CSE-ConnectionGUID: WI6rgXtVTRu/M2fMkSHmpQ==
X-CSE-MsgGUID: u9OPsI83SMK+lfcyKlfgqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="85310734"
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; d="scan'208";a="85310734"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 11:45:35 -0700
X-CSE-ConnectionGUID: q/xPcOZRSFerGUtuT9ZoZQ==
X-CSE-MsgGUID: 4P2u0ncTRruHVh3GrZoBOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; d="scan'208";a="253487049"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 11:45:34 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 21 Jul 2026 11:45:34 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Tue, 21 Jul 2026 11:45:34 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.70)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 21 Jul 2026 11:45:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=reoxl6DSV3o95DUyZp6537ym2ChxwWoBwfIkRxIUqiuPFNc/73vu3esx2aVOFx0A6VeQzmybZZWer/8K9Dy0EvjZf+sq2Tboy1DHiZ/1ou1buYzpWmohBHyqUyPMQOnsPq70mkl+muXgBQ6MtI82Wkbms66IWKHlQ/enN+rgzQMtVAsO+y0GjQrb+BWO+zyRlq+wmn4vXaKeIhHvD/mbNLcASvz5ZOf8S7mYs5tMeMNpRH1/fcpjEuWicsiqXL6/0skTaaw5lkTaUR4dTbRrapt6UxKpL46+y3WiGUBXrfk7A6IJAFKOIRYETu7kgYjApfhald2vq7IBR0l236+wmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wk8m+W6eDdeBJ/97GR3I4CyGHoGwOR96caZFr2picTk=;
 b=JnTCvGGeY2d4V3WYlzEJ6uqKRrOdKV8zj7gVgtVK6ARh8R8Lo9k4INAeaL9PRJYvi1BJNnlZTiezCIdxEfjIkdKQi+1X0GbiYOrBsV6ES3IZ6sn+5ou/8Zh7/qcLzNEot327xvaPiTnFzyMKuCVk09K9pI2IZw85i8YSfmIbqpJ14s2E4baecOzJeIk1yeXTbKquGRdB15CxiOA+YQqhx3ycQ88KxL09UZD0TPneyFLb2HKB1aC2onucWEdNb8BPL83lQS6TJIVtO3M5iiArnbhtvrcXZj0IraBOJtCElDubBx+3V7QcMXtkMwnpTbXf0D5zjwudrq/Xt8rjgzWRTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB8575.namprd11.prod.outlook.com (2603:10b6:806:3a9::5)
 by PH7PR11MB5864.namprd11.prod.outlook.com (2603:10b6:510:136::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.16; Tue, 21 Jul
 2026 18:45:29 +0000
Received: from SA1PR11MB8575.namprd11.prod.outlook.com
 ([fe80::4d5f:58ec:402e:9e57]) by SA1PR11MB8575.namprd11.prod.outlook.com
 ([fe80::4d5f:58ec:402e:9e57%6]) with mapi id 15.21.0223.017; Tue, 21 Jul 2026
 18:45:28 +0000
Message-ID: <28b04c2b-7df0-4eb9-9c5c-8aa4ccb83e10@intel.com>
Date: Tue, 21 Jul 2026 21:45:24 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] drm/xe/mmio_gem: fix fault handling for split VMA
To: Matthew Brost <matthew.brost@intel.com>, Matthew Auld
 <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <koby.elbaz@intel.com>,
 <shuicheng.lin@intel.com>, <thomas.hellstrom@intel.com>
References: <20260526125106.2806522-7-ilia.levi@intel.com>
 <20260526125106.2806522-9-ilia.levi@intel.com>
 <7baa79b5-a2e4-4064-8a19-c0f263a883e2@intel.com>
 <al7lbcjU8JsqasVE@gsse-cloud1.jf.intel.com>
 <78425c51-b432-45af-bab8-7c74230880cc@intel.com>
 <d3802216-6404-4d4d-b166-a3407bfd4c14@intel.com>
 <ef91436b-2ba6-404a-aa47-45937175663a@intel.com>
 <al+txKTZPIbm8XPx@gsse-cloud1.jf.intel.com>
Content-Language: en-US
From: "Levi, Ilia" <ilia.levi@intel.com>
In-Reply-To: <al+txKTZPIbm8XPx@gsse-cloud1.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TLZP290CA0014.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:9::13) To SA1PR11MB8575.namprd11.prod.outlook.com
 (2603:10b6:806:3a9::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB8575:EE_|PH7PR11MB5864:EE_
X-MS-Office365-Filtering-Correlation-Id: 43abfcc8-3b71-4204-8bf9-08dee7583c26
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|1800799024|6133799003|11063799006|56012099006|10067099003|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: K+rrfaTU79ggPfj9eLPfMoKI9Bd7SSXnlboXgKfCGGAwo+kshIQGY+5N3PjdBDPmqApNYSWElNvS36l5iDahv+ARjHcgLgehb6mJPv7WYAeDAWMDYuZ6ab42kK/QeBZcWHiTPQ+3R6NEvBe88MOd3UCdKQWr/7iJZ3+L4A/nxAEIgqtjxf9JUkQvcxg/Ta6mvhPutTjBeDEca9qvn4wNlttxfPg0xBxJG12LiOvrFwDsXLAuaQ8mGa93zsnXlMVAeSONkWruyjxedKq0ulU7VcsNCsVWKmrdHwOqvrvncPpf1vkjwLXj9VU5E63afsUN7RBVMoxI+ZinumsRWP108tf9io4OOQCR8isvRPdtBca7YdTURrKdFMlpQ1Ds9IaiejREtAxegYNVVsjSyawDV0/hmw+qXtiFTmKKizc8GtQ1TTYh9IWcF3nlzJWSM1WG5B2a4OWlh4wOoNDmca6iBE8ClLEeIQVABwNr0hrcMWrZ7JVMZ1F4SlqFUpffOPSmghxizONUhPV05Nx18uAGs9CSsm1ZG5wutakB/xMl0f1Hh4XqmfEEPJKEAXk35n34ez+3KzeHxg/fJ8EMhk6ZHnt9RagfB7H/8wCgpxs+I0KIXt3u62QwWcF4QMp8Eulm6I8bkf0INUI8I76h1iRpJwRF7lEnHObFzYOdzqayFhw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB8575.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(6133799003)(11063799006)(56012099006)(10067099003)(4143699003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SkZzckNzZkR5QXZ5NWFyQVJiUEJDaGJKZGE3SWVKOHB3NnFqZW5LY1UyUW44?=
 =?utf-8?B?RDI1VllIYVpiV1pEczA2SjhkUVpZNUhUdUlVZE1PckhiVFNJRDhmd1d4NGY0?=
 =?utf-8?B?c01sZnFadFJVQkhwelhmckZXQ3JHQVNJajJmWDhuVzErWmhseS9sUUd1cTk2?=
 =?utf-8?B?dDAvL0xIekdhL0QxdUZIWFlNWm5MakkyOHJSbElUdytvNm5KMFlHV3BiMnNm?=
 =?utf-8?B?OUl3MWhwcHUvaHVYdWp6NUQzaEhQdmhzV1NmeHZwWmJNZ2dBUndSaFpnQU1k?=
 =?utf-8?B?NVB1OW11S0NaV2JKR25MR0hFMHpLcTBKakwrUzRBS1E4a1Naa0Z1cXl3bUtZ?=
 =?utf-8?B?MVQ1RkNaTXBlWWZGZkcyMWkwSnZ1OTJHNEh0VlpWOEptdEcvZVBHQW11ZzJ6?=
 =?utf-8?B?OTVXRjFnUGMzQjFSTFhEVTk3bXJZMmY5bys2MFd3L08zRVRnTzhtbkFjLzU4?=
 =?utf-8?B?RGZXc2p4dVMzZUptdE1LL1J2NDFtSlJCaEd1d3FBTHViQVltOEtvQlo5VVgy?=
 =?utf-8?B?K1VwL3RJSUFHRkZzVXIzV1ZnaituTTJySlB4SXhxenMzZWhWUHlFN2t4K09J?=
 =?utf-8?B?Z2ozZnZhYXdzL0UxUkJITEl4TWJLd1U4Nnd4QTF6QlJPQ2NFNzhyOWNrL2V2?=
 =?utf-8?B?VGwxYm9SL2dLNWdPODBPSHdDNEtvZzcyMnc0alNLbTcrT1R3K0xURTI0dXd1?=
 =?utf-8?B?NW53dUtsZGR6UG5qYVVDVVo4NFl1eTlxeGFKalc2Ni9mUXdzZmxTQUtzUmtZ?=
 =?utf-8?B?YnNJaVZ3Wms5dGFhVjVXM3haWCtXaFBXdjNmZTEwcjQxZ0hOazEzMTJvb1dj?=
 =?utf-8?B?bnFjV0tQSkQxcXdhZ1M2bXVMRTRJNmthTDFhM1ZpcWZyeldaOURqVS9nZzRK?=
 =?utf-8?B?Q2E2Q0ZSS20vUGJWOTlGTUx3cnRWemZwek9XbHZQNjBwTmZkZEYzODA0ZVpO?=
 =?utf-8?B?clVtMUR1TTVaUkZ6ZHpRRjlqTVN0NTJiUmdjMFNCNS9sU3lKVVdUT2s1ajNZ?=
 =?utf-8?B?MkNtV216THJuRVJkZnYrK0xYbHpmN0twMmUvYVI5b1UrZHlia1RPZ0V2UVor?=
 =?utf-8?B?enJhT3NueVc5aW1JYUJybW5NWmQ0T2thb3B5ZEgvTzVlWldrNUdpWWZqL3Bu?=
 =?utf-8?B?RDB6R3RPQW4zQXNScDV1bmJUNnpIMjNGWGo4QjFJajhTeGhhMnlUY0pPVGQx?=
 =?utf-8?B?Nzcyb2VLZnlwNFowYUZjaEZGa0o1S2d0QXR0TzZOam5ac0w1TG1Va1ZLVGx5?=
 =?utf-8?B?NTJHUVE3N2hwMU40VFlSMEJLTzA5SlJDcDFONHI0aVZBbjcxYTlvMTJZWVRM?=
 =?utf-8?B?ZUVlUVMzNGZWendrMFM1WjdkWk9HTUZQaEw4bXB3TlMyUXZlMWFnaElTd00y?=
 =?utf-8?B?TVBzdVJGa3dpMzArWXBsMEJ5bzVZSXQzTTNBRk5Dc0pwL041MWVXVUVmUlZy?=
 =?utf-8?B?a0wzQkQxZlhSKzU2UFlBMmNTWXJyeFMxVTBpWnJCU0JncEFYcExkUTBkRnFa?=
 =?utf-8?B?TDN4ZXFsL0RiSStsZkNmTFgwL3NNdWJzT3RveWViUm5Ldy9DbjlybjNaUEFL?=
 =?utf-8?B?bmsxUGJhNjZTek0wL2lSM2VCcU1tcURidkM4MDR4aTlFdDZWVExuU2p1UUg0?=
 =?utf-8?B?dXYzZnZZRG0zM1pUZXNXMjhUYWZFNzhxL0QrT1pIVW1VaUVjTTBIUm83RUpI?=
 =?utf-8?B?OVhuOEFSaUxaNG1TeEFxaVRlZXdudm5tNnRlWUQ0aGVhL3BERjMvelV0OHRC?=
 =?utf-8?B?Wk84QllsZHhiZTFJaTZlbG40Y29scDRhQWIxeXppQVB3RDg2dkZjWDFYMnNn?=
 =?utf-8?B?RjBMMnNMWk9kMmN3YjRSYktpY3piRmx2UmR2Z05XZ3ViMG8zaE80NGpNYmxD?=
 =?utf-8?B?TEZqQ0hXeUNHM0hsaGtCNHp2STdBR3FKUmtCTFFtTklJTDVYMmMxVCt2VCt1?=
 =?utf-8?B?Wk1hUUtCNjRqQ3BwQ1NHdThiSXJsY21KUDdMM0hXR0xOVkJtTzBvN1dsVFVO?=
 =?utf-8?B?QnE1YXAvdzRNQlpzK05DTC9LRXFSOTlwUDdiVDArQ0ZBSHhtY0xPQmo1Rmxs?=
 =?utf-8?B?SlRvSnV6a05UVElZMGxhZUwyRWhqeFQ0b25JV0pxOE85UzVFcjVHbE1vK0to?=
 =?utf-8?B?b3RMb0s5anltL0VTZ0RTd2RWWW5xcndOdnY3Nld3SE5Db2NNVXNYWjZQRWlH?=
 =?utf-8?B?WHBOeFV1aEZVT25pV3VoMHp5UVJQRG9iQ09WbmJJdmpjdXlUT2RrbDRBNmZT?=
 =?utf-8?B?MktEaEZKb1dQelVwaWcvZDVTT3pvbHZId2N3akVubkN0Zmg1eFhWUVNSZmpS?=
 =?utf-8?B?elJEYm4rd1ViYnVxSWpySjBOUDMzc3hpVE5YT3VhMy9QOXB6VWtnQT09?=
X-Exchange-RoutingPolicyChecked: R+EHi0kNnSQBSgpYXfROqwI5S/4m+6uLmjSy02aF04Pc4Of6aQRfpY/jHYghtWs6vTpQ6FlRGsuZOaUdnwSk5YYelh0WRHnrUB/wzPq3BJDHHRHdEInkMWXC77LNjCWKU2OITQEezhh9EGB+f4VWyFtWQCqLOK40RZT6j/bkvrAIrAP9ZCXw5CrP972CDaR1i79rt8Si+9yATK2p0FcXZvu6jtGOSiZJ4w/eOXoMCCr3sz6i83XI3OcfW0reWphZ3/INCEyU2cp8tjquJLL49/1hX8XwZfwYDwCrum98U1WKsM4+9eziqrnfpghA0/sxa4WtyVXtPvFoBVLcKnLQMg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 43abfcc8-3b71-4204-8bf9-08dee7583c26
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB8575.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 18:45:28.7547 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QzOU5DUfDIoBBjXgG2YKIyYWDkWUyOAX72SMO6Sq3qLXA2trU/E06O8SfwJljf4q2cBfy461iQBhrptSyp0tKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5864
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


On 21-Jul-26 20:35, Matthew Brost wrote:
> On Tue, Jul 21, 2026 at 02:19:37PM +0100, Matthew Auld wrote:
>> On 21/07/2026 12:49, Levi, Ilia wrote:
>>> On 21-Jul-26 11:44, Matthew Auld wrote:
>>>> On 21/07/2026 04:20, Matthew Brost wrote:
>>>>> On Wed, Jul 15, 2026 at 02:05:35PM +0100, Matthew Auld wrote:
>>>>>> Hi,
>>>>>>
>>>>>> On 26/05/2026 13:51, Ilia Levi wrote:
>>>>>>> The fault handler currently assumes it always operates on a VMA spanning
>>>>>>> the entire GEM object. This does not hold when the VMA has been split,
>>>>>>> e.g. by a partial munmap or mprotect. In that case the handler may map
>>>>>>> wrong physical pages or cause SIGBUS.
>>>>>>>
>>>>>>> Change the fault handler to map only the GEM subrange corresponding to
>>>>>>> the VMA, and do not set vm_pgoff to zero. Many DRM drivers do this
>>>>>>> because helpers like dma_mmap_pages() interpret vm_pgoff as an
>>>>>>> intra-buffer page offset; leaving the DRM fake offset there would break
>>>>>>> these helpers. Those drivers can get away with zeroing it because they
>>>>>>> map eagerly -- all PTEs are established before mmap returns, so vm_pgoff
>>>>>>> is never consulted again. This driver does not use such helpers and
>>>>>>> defers mapping to the fault handler, where vm_pgoff must be preserved:
>>>>>>> when the kernel splits a VMA it adjusts vm_pgoff, and the fault handler
>>>>>>> subtracts the GEM object's fake mmap offset to recover the page offset
>>>>>>> within the object.
>>>>>>>
>>>>>>> Fixes: 1ffcf8b8ae8a ("drm/xe: Support for mmap-ing mmio regions")
>>>>>>> Assisted-by: GitHub-Copilot:claude-opus-4.6
>>>>>>> Signed-off-by: Ilia Levi <ilia.levi@intel.com>
>>>>>> Would it work if we did something like:
>>>>>>
>>>>>> +static int xe_mmio_gem_vm_may_split(struct vm_area_struct *vma, unsigned
>>>>>> long addr)
>>>>>> +{
>>>>>> +       return -EINVAL;
>>>>>> +}
>>>>>> +
>>>>>>    static const struct vm_operations_struct vm_ops = {
>>>>>>           .open = drm_gem_vm_open,
>>>>>>           .close = drm_gem_vm_close,
>>>>>>           .fault = xe_mmio_gem_vm_fault,
>>>>>> +       .may_split = xe_mmio_gem_vm_may_split,
>>>>>>    };
>>>>>>
>>>>>> ?
>>>>>>
>>>>>> I don't think partial unmap or similar is really a real use case for this
>>>>>> type of special mapping. IMO if we can just reject that would be simplest?
>>>>>> What do you think here?
>>>>>>
>>>>> +1 - I don't think split would really be a use case and most xe_mmio_gem
>>>>> usages are likely exactly one page, right?
>>>> Yeah, at least in the case of barrier and the other upcoming case I'm interested in, it should be one 4K page. There could be usecases where it's more than one page, but even so I doubt doing partial unmap or whatever is really a needed thing from userspace, for a mapping like this. But if that turns out wrong, loosening the restriction should be fine in the future. IMO keep it dumb & simple, especially given all the bugs we have here.
>>>
>>> We could definitely do that, but I'm not sure what we would gain by being more
>>> restrictive.
>>>> In terms of implementation, we won't need to store and use pgoff, but I
>> would
>>> still keep the loop change (as it reads more naturally) and remove
>>> vma->vm_pgoff = 0 (since drm_vma_node_unmap() zapping relies on it).
>>> So it comes out to roughly the same amount of code either way — the .may_split
>>> hook is about the same size as the pgoff handling it replaces.
>>>
>>> And while partial unmap indeed doesn't sound useful, I could imagine a use-case
>>> for mprotect, e.g. a hw producer ring whose body is mapped read-only to
>>> userspace while a control/doorbell page stays writable.
>>>
> Almost certainly hw producer ring and control/doorbell page are
> different xe_mmio_gem though.

Design choice, but yeah, that is a possibility.

>
>>> If you think a narrower API is preferable though - I'm ok with making the change.
>> Since this is uapi, it's usually better to go as narrow as possible, since
>> it will be harder to revoke later, if we did decide to do that. On the other
>> hand loosening the restriction later is fine.
>>
> +1.
>
> Matt


Fair enough, will do that, thanks.

- Ilia


>
>> In addition it looks like adding features with no current user or a way to
>> currently validate it in IGT, even if the code itself looks simple in the
>> KMD.
>>
>>> - Ilia
>>>
>>>>> Matt
>>>>>
>>>>>>> ---
>>>>>>>     drivers/gpu/drm/xe/xe_mmio_gem.c | 18 +++++++++++-------
>>>>>>>     1 file changed, 11 insertions(+), 7 deletions(-)
>>>>>>>
>>>>>>> diff --git a/drivers/gpu/drm/xe/xe_mmio_gem.c b/drivers/gpu/drm/xe/xe_mmio_gem.c
>>>>>>> index c22a38e5616b..15e884ad3f1c 100644
>>>>>>> --- a/drivers/gpu/drm/xe/xe_mmio_gem.c
>>>>>>> +++ b/drivers/gpu/drm/xe/xe_mmio_gem.c
>>>>>>> @@ -37,6 +37,7 @@ static vm_fault_t xe_mmio_gem_vm_fault(struct vm_fault *);
>>>>>>>     struct xe_mmio_gem {
>>>>>>>         struct drm_gem_object base;
>>>>>>>         phys_addr_t phys_addr;
>>>>>>> +    unsigned long pgoff;
>>>>>>>     };
>>>>>>>     static const struct vm_operations_struct vm_ops = {
>>>>>>> @@ -92,6 +93,8 @@ struct xe_mmio_gem *xe_mmio_gem_create(struct xe_device *xe, struct drm_file *fi
>>>>>>>         if (err)
>>>>>>>             goto free_gem;
>>>>>>> +    obj->pgoff = drm_vma_node_start(&base->vma_node);
>>>>>>> +
>>>>>>>         err = drm_vma_node_allow(&base->vma_node, file);
>>>>>>>         if (err)
>>>>>>>             goto free_gem;
>>>>>>> @@ -147,8 +150,6 @@ static int xe_mmio_gem_mmap(struct drm_gem_object *base, struct vm_area_struct *
>>>>>>>         if ((vma->vm_flags & VM_SHARED) == 0)
>>>>>>>             return -EINVAL;
>>>>>>> -    /* Set vm_pgoff (used as a fake buffer offset by DRM) to 0 */
>>>>>>> -    vma->vm_pgoff = 0;
>>>>>>>         vma->vm_page_prot = pgprot_noncached(vm_get_page_prot(vma->vm_flags));
>>>>>>>         vm_flags_set(vma, VM_IO | VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP |
>>>>>>>                  VM_DONTCOPY | VM_NORESERVE);
>>>>>>> @@ -190,7 +191,8 @@ static vm_fault_t xe_mmio_gem_vm_fault(struct vm_fault *vmf)
>>>>>>>         struct xe_mmio_gem *obj = to_xe_mmio_gem(base);
>>>>>>>         struct drm_device *dev = base->dev;
>>>>>>>         vm_fault_t ret = VM_FAULT_NOPAGE;
>>>>>>> -    unsigned long i;
>>>>>>> +    unsigned long addr, pfn;
>>>>>>> +    unsigned long pgoff;
>>>>>>>         int idx;
>>>>>>>         if (!drm_dev_enter(dev, &idx)) {
>>>>>>> @@ -203,13 +205,15 @@ static vm_fault_t xe_mmio_gem_vm_fault(struct vm_fault *vmf)
>>>>>>>             return xe_mmio_gem_vm_fault_dummy_page(vmf);
>>>>>>>         }
>>>>>>> -    for (i = 0; i < base->size; i += PAGE_SIZE) {
>>>>>>> -        unsigned long addr = vma->vm_start + i;
>>>>>>> -        unsigned long phys_addr = obj->phys_addr + i;
>>>>>>> +    pgoff = vma->vm_pgoff - obj->pgoff;
>>>>>>> +    pfn = PHYS_PFN(obj->phys_addr) + pgoff;
>>>>>>> -        ret = vmf_insert_pfn(vma, addr, PHYS_PFN(phys_addr));
>>>>>>> +    for (addr = vma->vm_start; addr < vma->vm_end; addr += PAGE_SIZE) {
>>>>>>> +        ret = vmf_insert_pfn(vma, addr, pfn);
>>>>>>>             if (ret & VM_FAULT_ERROR)
>>>>>>>                 break;
>>>>>>> +
>>>>>>> +        pfn++;
>>>>>>>         }
>>>>>>>         drm_dev_exit(idx);
