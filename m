Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6ED6C61DD3
	for <intel-xe@archiver.kernel.org>; Thu,  3 Sep 2026 23:56:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8287F10E26C;
	Thu,  3 Sep 2026 23:56:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WXq7Rell";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACC4810E26C
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Sep 2026 23:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788479795; x=1820015795;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=SVZpoUkU87szHeigNA/zd8+7v8RrntNBUBawsvTlxlg=;
 b=WXq7RellkqYHXU4avd2+M5GnskVxAzY0LFmyh4GP74fVDjXA6dTq0ExD
 jX5Gh34DQIxQhIPceztVHkggR93ucX+Uu5zkWcgffq4EbeREq9tq95BXO
 ZnRr5sIz7YT6ORSqCfBwUvKwyXfvcFx3+mSIXUKwzexG5Ui/Dvh9zhMWY
 CayLtOmU9Q2AoUs//Yr8FoUVckGK73vPdD5S3OIP/4rKlt0ySTJ+LsTlJ
 OexGkzyIukyby4dchVAa32CyanMvVV2dLBqM4CiPnpNxj8yPn4S3Yxy1x
 aqa0uKIUmfl/5tcRVkHqzL8jL7e0b6G/tr3YvZ3hp9w1ASA0/aaxt2d9g Q==;
X-CSE-ConnectionGUID: 3WFapbe1TwSpFKvNnkHRjQ==
X-CSE-MsgGUID: 9SalCreyRO6qlSUzLtOhqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="99637655"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="99637655"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 16:56:33 -0700
X-CSE-ConnectionGUID: eV6CsyMNROCsQ1pmJjIQjg==
X-CSE-MsgGUID: ozkVAdgxQcapTNQXNAtJxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="274028741"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 16:56:33 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 3 Sep 2026 16:56:32 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 3 Sep 2026 16:56:32 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.71) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 3 Sep 2026 16:56:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UsQM8rm/C0/MGl5RQCexpSV5oJq+K1ZOZypDkrZOb1AOF+L8KaSw1hswfTgiy3eMwK9gLCy2KGSiM920KfkqfvxN1+lg60X3ZZlI+uRhu63KatsgVLruLVuJqIihPnodzbtQy0eJDMqAbcoEUiGETRitJmRh32toxVqLNVCIAP9F1BFNY1YulANMNUbI8wa95P5/HCpNc+0gQbaamldoKT37nYEQsHM8fyDYmUryqETbEPEeDg33LsgnT7drwpfh196dbPNpIPTfkwyAypYNe+aHOO482ZMuvCrGN2xp7cL9UZef7xkqYN2V6F86t5yEb9tst0mlQ7pNz/StpQUxzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n7qTjdEp22y35qL/udAYUz1UL/hh5dsONXnPdYIoh5g=;
 b=LQ6NNOVrZnYyt/iRfWS5ulCf4c62T8KaaDKa1Wmga8FmJrSdyG0H/5ChvJ1184NiFDVQkjhFWDK4H9rgou1DMmD9ZEjTCqe2TgisZg0B6QPqEVjVKbrmpBlnfmUGyg8VcZOtl5pWKY1eXGfKpOmiuhijLCS9pYVnKZKdJKwCimXq5cRIzxDs16yeo07/y7yKjNoaE+oeFze4sDhBMQalN98551GxwuW2Tbj1VeKYT1FPxOUtuOHPDdwl3pEgH9XjJJLo0pBBJg4xgjcleGjBXNxFdyo+SC4WrjcOLQfOJLZff2n7hwDZb9RhwP0RgY7dnM1ObRh6xKkAiimaS0GyYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by DS7PR11MB6078.namprd11.prod.outlook.com (2603:10b6:8:86::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.13; Thu, 3 Sep 2026 23:56:28 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057%3]) with mapi id 15.21.0382.007; Thu, 3 Sep 2026
 23:56:28 +0000
Date: Thu, 3 Sep 2026 16:56:26 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: "Bai, Zongyao" <zongyao.bai@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <jia.yao@intel.com>,
 <matthew.brost@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v5 0/4] drm/xe/forcewake: add delayed-release optimization
Message-ID: <apoJKi0SKWk2MzBY@soc-5CG1426VCC.clients.intel.com>
References: <20260601213804.707256-1-zongyao.bai@intel.com>
 <20260813000654.2712317-1-zongyao.bai@intel.com>
 <apnDogYw4G6bXNlh@soc-5CG1426VCC.clients.intel.com>
 <14d20a60-29f1-40f3-83f5-e8b6eaec81db@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <14d20a60-29f1-40f3-83f5-e8b6eaec81db@intel.com>
X-ClientProxiedBy: MW4PR03CA0200.namprd03.prod.outlook.com
 (2603:10b6:303:b8::25) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|DS7PR11MB6078:EE_
X-MS-Office365-Filtering-Correlation-Id: 7010395e-9e7a-4b13-943f-08df0a16f893
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|1800799024|6133799003|56012099006|10067099003|5023799004|4143699003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: J7JYOde9/HKww4tdHblSoT0wjUjHiw6oWnb5/A0h1o/m4M7i9l1YK+djRxjw9Y/sEkiHoLOd2F0FBUk8L/gJImPnR9wSglHUR03nB4r8gsHkXAa00ev01zLMuLY3zIw4V7LpVMjx+WcD056hlTiWh0OaSycxANlQnYnjMsKnMRE3lPFjkvlY0fQ/sIjI8qesTDX2JqMSIaJtitBL23dCcQLJklMvFKlNnA0XQOWSwGOp+EJOYn9R1Bo9t8KeWWq2tnE9D+/0manyzdMGt/T5ZuPNVvBC+rLYOyHxjDwfGAfS3nNO/pdz8rsYWmwOxzfNYXB15rb0w9K1earNS3iBJ0+P1XcLBZL7krPmrSVMnNAvb0E+a/xOJEwvMZ103vTdYw1sRks4gRa8E187p/r4qWhU+V/mDGluXI+WC6HcrW4EzoY7Z3HYJJBqPC6al0Z3H7OyBzdLpwcEz93jOfBk+FMQtIn5fPRDKj8qObBWlyUpDhq2o8sh73heVop0OFeBIM6lT/Pl4oeASuUXzQFcSNK/wkFepnkjj2FKNtlZcpYgY0gUVodPGUpfuWcgtCVggY8BjYjxOMsHPW8YaxnV2y2BddmtOcjlN/nYXEoOQPVhN0uj0cMv6+jeuEM38knz9wwmKEPfq/EFx2197v5Gxr0s7Y1vVrkSXjBsmCvStbg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(6133799003)(56012099006)(10067099003)(5023799004)(4143699003)(11063799006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NzQvbWxETzJtdDgzbEEvNG1RMjg2Ynl4Yzh3Z2ppa0RXUjBCSkdIeFh6Q3Nz?=
 =?utf-8?B?emVDa3NBOHd5cUpDL0Z6dWdzbWc0ZUF5cG9vWUxLMndXeHRCOGtUTlhkdk93?=
 =?utf-8?B?SnMvOG9oL1ZodThsR1dNUzE2QlplT25Sc2JJeHVDUDdCK2xBRjJVYWJOdHNa?=
 =?utf-8?B?OHQrNWoyTlJDa3pJMTByc243TlBzSi83V0R4SUdrTUllZTdSRzdUWUhWbjNV?=
 =?utf-8?B?RUxxQUxKYmVRdFpObjFXS1NPSnZnRGR6YnJjSEFFZU9STllnV1dMOFJiMzVM?=
 =?utf-8?B?d3hPR0pwQzhrTWUreWZLNW5WVmo5LzEweWhXcU5RNERSdWRkQWxkTlZCUEhI?=
 =?utf-8?B?cGNBT21jTWxoakt4eXUrZXJzWmhwcm5JZS9tVGhwY0thQjNyOWlzNjl1Mm4y?=
 =?utf-8?B?a3B4OUpsZGtRZnNYbGJRejBSajNBZkJwcWh1UWRZZXNicHo3N24zaCtTa2Y4?=
 =?utf-8?B?bVVvT2k3WFc2a09iTkozSllhYUpwQUVFalZEa205MVpRNUlrZ1BWVWQzQzlt?=
 =?utf-8?B?Zyt5dzNGeG1zKzExek5GWm50ZXJTZXRYZHczc2pjQlo4SHNybTV6UUVyVG9p?=
 =?utf-8?B?c0NwdUpCQ1llZzhYeHd0dURiWGo3UytKR05GU2ZnbUhNSURBZm5CdmlEK0ZI?=
 =?utf-8?B?ZS9NOVlYNFVNNDcyaFZNK3BpL2ROMEVwajd6V0NqN0xGYVhVcHNoRUlqK3Ft?=
 =?utf-8?B?NkVVVi9ENThRN2ZCVHZlTzhmZ3lmWlRaNlVhRUZSQVhIaDloemkvZ1ZKd2tx?=
 =?utf-8?B?ZTRSRmdQdmxyN3FvNGtWSC8vRDBtNXQ3Rm9OTGZMK2hMQmM3WDBXa2xiZ2xD?=
 =?utf-8?B?VlhzbnAzU0FWMVBtbENpWHB1b09waDdab0FTUFZMclR1QmYxTjhaS3hUbWZ3?=
 =?utf-8?B?dVhUV1dya3ZQcjYyOFh5eVVmV2lBeFZVWnFQd1JQWFlnOWtXcXAzdmpxT1c4?=
 =?utf-8?B?TUE1cEtuRnQzaGM1R1JmSHlFUWRQOWoyNWIxdUJzTDZtQ1FYWFBHSjZYL3A0?=
 =?utf-8?B?b0hwSnpYU1F0SHRod01Pa2U2Tlh5YzR4aGdxME8veWJFU2VSaGxqeGE1d2NL?=
 =?utf-8?B?WDhFN3M2ZWYwWmhibFpzWk1kN1V6Yzl2N0toTzEyUTJhUXZ6dmdVRCtaSnRi?=
 =?utf-8?B?c2FaWHJJNmlNOGZ1RXo2RmZzK1gveGpGaXIxU2JUbkJJM25uNUJBd1IxMTdX?=
 =?utf-8?B?cisvOHg2ek5DREROZ3Z1Y293c3FVZ2x5N3FLcS96Um8rTFNaNFBDVXpBeVZp?=
 =?utf-8?B?QTRHV3hVeHZRbDZmTTFjbDZaUUI5TkZIT0VJZ3g1bHIzejM3QmJmeFNSZzBl?=
 =?utf-8?B?RG1RK1hRZkxlSkZ1OXNDMGxwTC9QOEw4NWpKSGkzVVJOYmlET1B3TUFxcjhv?=
 =?utf-8?B?YkRrYzE2ME1NcExiaHp5OWh2d0xuaTBlcUU2bWFsb3pCNmkyOVdLQ1g3ODVZ?=
 =?utf-8?B?cmhkeGFaQUt4c0IzTyttV1dKaGlRWjlsZkxNTXg1LzhHRm5lTC9TTDlIaHhv?=
 =?utf-8?B?MmNJcytCdHkrY1JWREZDUS8vQmJvVS9jMGs1UW14a3BmMFNkKzh1aTB1OVRx?=
 =?utf-8?B?czZMOXVRMjg3NzFwR2dCbm90eG1BaURObEQ1bkJ0WXljUlNOQTZCZ0k3TzNP?=
 =?utf-8?B?Y1VhV29tczFyMGVjY1BtZFVmVDVhTTRGSjExZCtLYjlNT0tLRlhRK005NUhr?=
 =?utf-8?B?Qk81TU5XbzEwNEovNlpXSnNRRHhBZktnVzdUTy9LYThtTUx3Rjl0dWlNMmR2?=
 =?utf-8?B?cVFLZVJ6QVBmTnZ2YjBhRzU1Y0s5a3FvUDVYaWdHYloxRUhMdmJXYkpHYmMx?=
 =?utf-8?B?WTg4VXhtMjV5MjVWUTJGa1d0UWxBRXlITzVjb2c3OGFXczR1V2VOSEVxdldj?=
 =?utf-8?B?REQ1R3cvSUt4cmZVK1hxMUh2ZzJpYUNWTC9zTGJ6UTFiOThjeGEvSVk1WVJn?=
 =?utf-8?B?NDA0eE5jcXB0TmJQV1pDbWF6Z2ZZUUdZWS9EUTZ0N3Irc3lZekFxc1RZTlNm?=
 =?utf-8?B?bFJ0UjVxR3ZKeGJNOU85L1RaWWhYSVhrVHRnc1NZVVgzdVZMU0xlRERCZjAr?=
 =?utf-8?B?NHk5dVJWKzBuVjExcUdVY0lLNnhmZ21tWW95cEhGUGFWaTR6cG5uWnA4VU9E?=
 =?utf-8?B?emV2S3dDaTBacDBBdGg3T0JGRDlsTnh6RW9TV2ZmRmZRUHNmMnliSzRoUTJO?=
 =?utf-8?B?Mi9Pc1RwMFFnWVIvbjhGRCtybzJvRkNJNjJaQWt5Sm9TSTlLRWIzTXRpRmZW?=
 =?utf-8?B?U2xua1ZIbGN4Qno5Z292Y05hSGVGcG1jeDhXZ2hwb3MxZDVPZm84dmlsVGtm?=
 =?utf-8?B?eEtJdGJ6eVlxSUJRY21ESG5DZG1sVUdlZXZoajB4R0tvWUdocGhMc29nbEox?=
 =?utf-8?Q?ZdCqinCakfP6d89YvQ5UnH0gM+ohKtS8h+aTL?=
X-Exchange-RoutingPolicyChecked: yslu2+Ay6Sc68Qxj9ukOQGjftrO9c3cSXmd1yhULxv3hfIvfez2ZMwsM/8tFkOekN7iblrUHktf05O70/FE+pPKOeb2xXCPwg5lQp9aq4/OTUDAneN6cZH6Uxa0hLxHKQDMcJzk8G9KjLtw3gMQNTpHg6SSOnDCT/YQKOAUk1OYC3GO+848SVjYZp1CqochtTJFMp6ClTFWPxis9QFA8rb6pofoHJvEedp4wyAz7iOOuww8t6Wz3a2ey0YxY3WmymKv+aR7j/CGhJxakq5S3q7C20Kr/wQUzp5myCo1S1G5NMuH7hllpGB24aq975s9PF1zw9UvkPPWDsH4iJyBfEg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7010395e-9e7a-4b13-943f-08df0a16f893
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 23:56:28.7550 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uDyk/2X6KqqXuSVYMP4trmGZy7FTeRJa0cnhANOPrrMgF+ktxA2ByLwG0IS0sHpwP16oNw+XdComJqPFSF1+mTXku1fAI1YB81r0udULJAk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6078
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

On Thu, Sep 03, 2026 at 04:19:01PM -0700, Bai, Zongyao wrote:
>
>On 9/3/2026 11:59 AM, Umesh Nerlige Ramappa wrote:
>>Hi Zongyao,
>>
>>On Thu, Aug 13, 2026 at 12:06:50AM +0000, Zongyao Bai wrote:
>>>Engine-cycle queries used by tools such as VTune and PTI can arrive in
>>>bursts. Releasing forcewake immediately after every query makes the next
>>>query issue another wake request and wait for its ACK.
>>>
>>>Add an opt-in delayed-release path that keeps an idle forcewake domain
>>>awake for a configurable interval, allowing a subsequent engine-cycle
>>>query to reuse it. Other forcewake users retain the existing immediate
>>>release behavior. The default hold interval is 100 us and can be changed
>>>through configfs before binding the device.
>>>
>>>The series also synchronizes engine-cycle queries with unplug and 
>>>flushes
>>>pending delayed releases before suspend, shutdown, remove, and probe
>>>unwind, ensuring timer callbacks cannot access MMIO after power-off or
>>>teardown.
>>>
>>>On BMG, this reduced the Level Zero timestamp median from approximately
>>>48.5 us to 9.4 us.
>>
>>Can you please add some more info here on what this measurement is 
>>and how this is affecting the VTune/PTI use cases? In other words, 
>>what breaks if we don't have these changes?
>>
>>The purpose of engine_cycles query is just to capture CPU and GPU 
>>timestamps as close to each other as possible and then the user 
>>would use that to map the two timelines in whatever they are trying 
>>to correlate, so I am interested in understanding the use case that 
>>this is improving.
>>
>>Thanks,
>>Umesh
>Hi Umesh,
>
>The main issue without this patch is the latency introduced when the 
>XE forcewake domain goes to sleep immediately after a query completes.
>
>In VTune/PTI workloads, APIs such as zeDeviceGetGlobalTimestamps() may 
>be called at a very high frequency to correlate CPU and GPU timelines. 
>It's not a one time query.
>Since the forcewake domain is released right after the MMIO read, the 
>next query often arrives after only a very short interval and must go 
>through the full forcewake acquisition and MMIO read sequence again.
>On bmg, we measured that this additional forcewake overhead can be 
>around 48.5 µs, even with RC6 disabled.
>

If you could just somehow mention that the numbers are overheads in the 
line below, that would be great.

"On BMG, this reduced the Level Zero timestamp median from approximately
48.5 us to 9.4 us"

Thanks for the details.
Umesh

...
