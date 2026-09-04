Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCAE0C624D3
	for <intel-xe@archiver.kernel.org>; Fri,  4 Sep 2026 11:57:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73B2A10FADC;
	Fri,  4 Sep 2026 11:57:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZoyNA18x";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CF0610FADC
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Sep 2026 11:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788523039; x=1820059039;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/Q5iCrk3hU2MFlL3jjyMQhcRQPpvcsE+g9unIqM6tc0=;
 b=ZoyNA18xSbxWS4X2qU63nLG9ab3fVI6zxdlW7hDGOHHJO+tYDbpUpWGh
 c3Og5OlaQjpIwTBae1I6EaLljYnlpQ6iAmebEiwfCK9kEsZDYENgaCtct
 hEOWgJA7z1669p4D4YIm0JxVonIcltLXW1XuQYkLQubI8snhBlPt26cRy
 s/pJN745o/j3Ea7fBvlrEe4CkbTvDcLeI+5gK6ZycDaXBjtuLBWbNiQrH
 6J3PfRpeXbBx0p50r+7qhs7q6OiiBRRfWEtjc6gX7NmQkFGFV7rM3wfOu
 lluK/wBGhitpjIUdcvuX4qaPIgDa42RQci+5mmdBUVWoWseJp1zNpfrsH w==;
X-CSE-ConnectionGUID: +XYS0Gf9SWqESzy14AGgNQ==
X-CSE-MsgGUID: P1kUBfeCS1qNIbSyoM0eWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="99620210"
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; d="scan'208";a="99620210"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2026 04:57:18 -0700
X-CSE-ConnectionGUID: G33fU+FjSfKVTgMe26N1lA==
X-CSE-MsgGUID: d0Yuh5fJT2yG//liOj4mzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; d="scan'208";a="267446145"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2026 04:57:18 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 4 Sep 2026 04:57:17 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 4 Sep 2026 04:57:17 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.52) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 4 Sep 2026 04:57:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nc+Xazux3TnGfcPnd1UGtX6JVA8ByaJ8FilUwa5GHaldS9VNilmRHrPPwOFDvL4eRO/MvzvNHo2h+VCkyZ6v405NKFGmBMEyXV7/TJEb1bnSTwgQD0Bo9eatcgTyMQlZZXgHOzMbUj5WJPcAKI7UvnYQscJg8FRyH7FWMq2GxOOHTNbTlZc1u/YKK1+iTQrlKMgimBQHC9B52fWFqDYNlBiUsa9WfaCD9a/imdcKChRd0S/XM0tbNToCJ0xLHhIbw6W5Jsgo5Bt7OpWOjaLcDjTB1aDxk1RxhWeeR5g0NFHe4L90MGug3OxoKdBqHReGuiH1VnGzI3J/6lux0RucoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iglhAl90rLtTn71pS7xHBccyfqzc1bKmnPaHwb12Bdc=;
 b=U8IOzuziSry2M166xZPHlI6tmBsfLMrgQbjlw1MWry7ACDGnuliebe6S/j3i4W6qK2hAuRsH9ChpRo0HjspU6eDD8jg5Is3X3ComF3WJliO6v22Ukz7BlALjRpIbcUgbeDVzWf8/7+LirR/bxfatFSIiH5eV3eLgdyI0Sgdq/4tyW7G6lWFjOMEA+iefo9frjOVwbzbXsgKIo4I722rxncJVrceOzZuWfdinK+fNFBg2shCikgrdbX3JgGolN6GiDy1x9GLDDqMymm0Iq3oeCad5s8M3S9DcPJhXP4iQowYY1oHxmgxd3YefEByGLAuwBmpNKvooap8HPlJ4a6i6/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7551.namprd11.prod.outlook.com (2603:10b6:510:27c::12)
 by DS4PR11MB9529.namprd11.prod.outlook.com (2603:10b6:8:34b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 11:57:15 +0000
Received: from PH7PR11MB7551.namprd11.prod.outlook.com
 ([fe80::5cbf:6b33:5f0c:88a0]) by PH7PR11MB7551.namprd11.prod.outlook.com
 ([fe80::5cbf:6b33:5f0c:88a0%4]) with mapi id 15.21.0360.008; Fri, 4 Sep 2026
 11:57:15 +0000
Message-ID: <9d6388b0-ed43-4210-abee-62c6ae3ed2a5@intel.com>
Date: Fri, 4 Sep 2026 13:57:08 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/7] drm/xe/sysctrl: Return error codes from
 sysctrl_wait_bit_clear()
To: "Tauro, Riana" <riana.tauro@intel.com>, "Mallesh, Koujalagi"
 <mallesh.koujalagi@intel.com>, <intel-xe@lists.freedesktop.org>,
 <rodrigo.vivi@intel.com>, <matthew.brost@intel.com>,
 <aravind.iddamsetty@linux.intel.com>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <vinay.belgaumkar@intel.com>, <karthik.poosa@intel.com>,
 <sk.anirban@intel.com>, <raag.jadav@intel.com>,
 <umesh.nerlige.ramappa@intel.com>, <dnyaneshwar.bhadane@intel.com>,
 <anoop.c.vijay@intel.com>
References: <20260820101632.527214-9-mallesh.koujalagi@intel.com>
 <20260820101632.527214-10-mallesh.koujalagi@intel.com>
 <9894fca5-809b-4952-9edf-01b3d448d9df@intel.com>
 <3ae4858b-0bbb-4052-9c73-726643cf7266@intel.com>
 <292aaec1-662d-466a-83a6-dc820dace637@intel.com>
 <87216310-a723-43ce-ae62-6b85d2525bbd@intel.com>
 <e37b716d-3fcf-44b0-993c-70b39fe59951@intel.com>
 <d76a1ee0-7317-4cf5-b521-46cb9998fa88@intel.com>
 <f3d29b84-0849-4513-9a55-f6861e92c076@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <f3d29b84-0849-4513-9a55-f6861e92c076@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VIUP296CA0102.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:351::14) To PH7PR11MB7551.namprd11.prod.outlook.com
 (2603:10b6:510:27c::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7551:EE_|DS4PR11MB9529:EE_
X-MS-Office365-Filtering-Correlation-Id: ae5ad440-f99c-410f-95b7-08df0a7ba955
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|18002099003|22082099003|6133799003|56012099006|3023799007|10067099003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: EUHyy0+6EcGRxVcY/0WAtqpXreB04WKnnEq0DoT9Xacsu3hPh7uuowkXeAcPjOi6uYrp0x3fiMixzbW+oPnI2MGvZSG7z6ljC/5xYqZYDT67TV6pG7AIDjzEFrw8cjlE6qB++9Tee8R8mfZ08iIAUOSoVwOwHT+iOJs0mDAParMgDhF3++1mEZ3ZBE9CKOwPMqWehUuWqKaUkMPuiv3kU3FLuAX6bx4bGOhUp/z23Nq4KUWovmlDJf3UAcOLFGjEEOC+1XJln0gjzIsmXH4zwY2eTcE8ORRDnMyUaWaVwd0NiQ/M1Wsmb3DXcYqGzAs8fellER+GLy93Ws0xTfF4VJFILY2h4cpdF1BEJegIC7wMPla65jOL1cJLwjNzgc1pF9ZZaiasbb0i1wsfAQZGwsaKP+eRb2eKFOQQi2Q2FzCij+sc9+hyYsAUa7wg26Jso08WzAnISWH4i66p9MXFoNB8q9JBlBpJ60C6aXlXbFgtkuJ4tgIZ8iP6EXeHwCdOhKwC/4FrCHUM4KGPGg/Pp6N46qP+SvSN00Yv4G9KzegZzoAUky2zF5NVMDHoUi1gxdvYNpCK0c7HBq6JeVqjKgyzLUqEDxFmhfFv6pS6N4id7BiZihFx3LZ/rqxnrIbIh02HN/2aORNAxdUUbPDwoSmYVeLdmQJXiq1mlCdsHTc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7551.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(18002099003)(22082099003)(6133799003)(56012099006)(3023799007)(10067099003)(11063799006)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WVpOc2JOc0hBTGdSK1o4RWdhZC9pOW5INEVQUHBUTTF6TzJlWllHK0RZbDht?=
 =?utf-8?B?Vzd4aEdGM2JKZlBmWDM1aUhtV0xVS2Nia2hNRlh5ZFE1M1FKa0VuZURVb1kx?=
 =?utf-8?B?NUZmYlE0RTF0RFpNVmg4OGc3UmU3dWNLaWZFbUVjQUNPUTUyVmo5WjFoTEVL?=
 =?utf-8?B?WFRHNG4zVGhucE9OalRPYk9Zc1BqcFUyalJVeklMa3EzNVA5OVA2RnBDQ3FL?=
 =?utf-8?B?Uks1cFNhbUk3cVBtNGhtQXMvVjA2ZEdJTmRVY2I2NDNJc3U3TGFtcGMycWJV?=
 =?utf-8?B?RlIvOUIyOUdNNUlFWGVrRzdHMEZjTytNaW44SmRpR2RtL3RpQnVYMXhvN3dl?=
 =?utf-8?B?S1JWdzYxK011TzFvQXI5MmpXMS91NmhDd0tpcWlZNDRkMUNHTThhZkNHQTlk?=
 =?utf-8?B?aDZFWGVSN2YwbWV6WHVKNmZuQ0o2U2tNYi9JSGtLMGlJRHo2UVFhVkozY0h6?=
 =?utf-8?B?YXQ5SzlDWFA5N2JraWVqWm1oaTFQZ2IrbXR0TXYyUnJObkdFTHNBbFZHT2xF?=
 =?utf-8?B?NllDVVdLZWNxSmduSnpBdGRtR3psS0RsL2FHQTUzejZmamxtUnd1Qmh2WGVj?=
 =?utf-8?B?VEhNR1kwcktGVTJZYTQ3d2RQcVcrb2k0bGMzNkVpMWlXUU5IdlNCRFR3NHhw?=
 =?utf-8?B?WFlxRnk0NlNyd1ArZnZsYVZwY1ZkN1NJeTVrMkdESTdzcGJzM3psZitYRDJx?=
 =?utf-8?B?QTBsL0MyVDVOOU5mZ0FIMi9MN3BYc0V3K3RvR01jRWFmTktIV3ZKclFadkdC?=
 =?utf-8?B?WHIwZTRFcDQ3VFlOWmZJOVZBK3Z3RGhTeHVubi92aDIxMGg5bHI0YUJvLzdX?=
 =?utf-8?B?dEdlamJFRWJhTEJiazFtNS90Y01WWlZnTUJjMjczUlp4SjE2ejV0b0ZuS1BE?=
 =?utf-8?B?MEhSd1dLb0lqTzhIOTM4UWNBRitoYVpBVy9Ka0pad2YvdVpIeG4rZ1B1eFh6?=
 =?utf-8?B?WExSNkZYd2JMQ2xldG8rSnAxTEtNODhyMW1PQjEwdnRqc1UzY0tqaEduNWNL?=
 =?utf-8?B?MDM3Uk9MWkhIU3hRaktXcWZnK0ZjMTNCWHJVNzJHOExLb01tWEpaekRqdmww?=
 =?utf-8?B?T1NCemdraThnRXlWeE43cm5LSC9lRVp2azBmQTJ1eEd3K2llNUJMNlVpMXZ2?=
 =?utf-8?B?a21rUFpPdElxeGFmZ28vUkhuRkVkN3ZRZVJSbXZGa0FJZVNCS3p6M3J5eFFy?=
 =?utf-8?B?SGVsZ2ZxeFIza1BZM25MSFpiZWhPYzEwNUNad2VpbkFQRHZpQ0ZwRmthb0dP?=
 =?utf-8?B?TjZpNFRaRlAvSk04SER3VEhJNDJsVHUzbHlBWWdVeDhVNUpKSm1UaWtIYWNo?=
 =?utf-8?B?eUlmT1FmZkl5NnlVTUloa1h2dU1ZekwxbjlqQitkemN0enFQRmlSUEVndDZn?=
 =?utf-8?B?S0toY0x5U1E0WXFNQVU2VnF2THhaMTVXVVMrMjZPTDVhQURVQVBXeklHRmQv?=
 =?utf-8?B?VXZSZTFINHR4QjkxRFptMTdqQ0MwZ1RZNFBhZlJpS0c3TkUrQ0xQbXdBcmJ5?=
 =?utf-8?B?elY5YTNFZUY4QzNKeFRmdkFGWUhoZ2F0K3ZOZTRhbUtiUVZpYUZwblpZZGw2?=
 =?utf-8?B?MUNjRThvckE1T1BBS0dPbGFWOExNMG5OWTlYM2RqRUlDd2phMktVTUdOMlRs?=
 =?utf-8?B?QXNDelF1YmloRWNhUmdCa0lEUnUvUkd5bUJEVERFMUZYOE1MYWR5THJ5TDNM?=
 =?utf-8?B?T2VQK204VkJEenFnL0tGaHFCRHUvbHE1N01jei91M3VqUGNWR0VudGViY0N4?=
 =?utf-8?B?QVZvdGJNSVR0Q0VoQkFDWWY1cW1kald5eU54V0NaQlBDZStoTGJaWkRESDJZ?=
 =?utf-8?B?RXNaUXRBTFdsMU53S2w0Ynh1QUdpTUlwU05MUldrT2lFRWFnckhzWmdyd0pw?=
 =?utf-8?B?WUJhdFYrc1EyTlJRRmRSUjcxOFNjSWthdTIwa1I2ZG9xZEZFNmEzTDZyR2Fl?=
 =?utf-8?B?OC9wUmlsVFNrR0YzRFFQYkhsMWE3VmhHenZQTmlJV25yaFpDNzNscHVMdEdZ?=
 =?utf-8?B?RkdGNWI5aDVOUVFlZWJmbGY3QW9mY09wVkovOWNhWEJCNlFKUFZkL0tCOEpl?=
 =?utf-8?B?L2pOUC9WbTdEVlBuUEVXaU1jazVXM0VOSGYvSElqV2dGRjYxQk9nZ0hEc1E0?=
 =?utf-8?B?NnlUN0tCWGppUVJMNDREdnFDeE9WQ0paQ2J3Z3ZwR20zMmdud0NkV05TMDZp?=
 =?utf-8?B?MEViVXhFWHdhY0ExTEpqSVZDL2tQN1dvZjNmVDhJOTN1Vm1rbTRubHZiQ2hs?=
 =?utf-8?B?dmVJWWtac2Zkb3FjRTNmZ0JrWTlzaWVmT2w1MmhTcmZWaGtNcWlLaVpIZnhV?=
 =?utf-8?B?R0ZEY2J0b3RiamYyNDdTcjByeWd0NGdjZkpONUdLcUpSL0xEQXdzUG90WG5S?=
 =?utf-8?Q?0TlV/5ZarDOv8fxc=3D?=
X-Exchange-RoutingPolicyChecked: PoZtx2aL+E5XK0Nity0qiirxe5xxtYHMux1ehiv5zPG9uBXgvOgaKIMSFuhTAEm1vdg3j78HjrInrBiu+ApmGxQvZ/05gWCChbpeZm0QZMcd6gZqUP4J/BU+6PeqTYV3tgq7fjAvAQ+Nv8/YKi0J2z9+i7ORuKN63rAuWCvqCOsIICYUvV07JFSsPCFHQr+6FnGK38YTL4N+fxPDirpFgkytCDy3Z+0CFyJsx/TEgTXEoQet53WtHjhCNtLjMV+7HdPIDxECU9ZtYxvYqXm/AvaEg8ymCxa5ZneUlvFEX5yFwXGzsz9Zyedg5l1RvYgb4WpvQZbpJ6e3FUtmHINz0Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: ae5ad440-f99c-410f-95b7-08df0a7ba955
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7551.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 11:57:14.9699 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YQAXztHQM7fFLtZbpx6tdf7SOwcOVXO3I1XwBQRETwlx53WfdhPzUFm6o7gLjVNZFRtQgpSWl24lyLSqnykKTIpg9A1FEnSnIV+TLgQwJIg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR11MB9529
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



On 9/4/2026 1:11 PM, Tauro, Riana wrote:
> 
> On 04-09-2026 15:48, Mallesh, Koujalagi wrote:
>>
>> On 04-09-2026 02:36 pm, Tauro, Riana wrote:
>>>
>>> On 04-09-2026 13:55, Mallesh, Koujalagi wrote:
>>>>
>>>> On 25-08-2026 01:05 pm, Tauro, Riana wrote:
>>>>>
>>>>> On 24-08-2026 16:34, Michal Wajdeczko wrote:
>>>>>>
>>>>>> On 8/24/2026 7:44 AM, Tauro, Riana wrote:
>>>>>>> Hi Mallesh/Michal
>>>>>>>
>>>>>>> On 20-08-2026 15:46, Mallesh Koujalagi wrote:
>>>>>>>> Make sysctrl_wait_bit_clear() return an error code rather than a bool.
>>>>>>>> and update callers to use xe_log_err() with the propagated error code.
>>>>>>> Bit confused here on the usage of SIGID. My assumption based on documentation and discussion was
>>>>>>> that SIG ID is only needed for error logs based on severity and requires a resolution which can be documented.
>>>>>>> Am i missing something?
>>>>>> from "How to pick a SIGID (the uniqueness rule)"
>>>>>>
>>>>>>   * A single underlying failure therefore legitimately produces a
>>>>>>   * *chain* of reports from different layers, each with its own SIGID -- e.g. a
>>>>>>   * GuC communication failure is reported as %XE_SIGID_RUNTIME_FW by the firmware
>>>>>>   * path, the failed recovery as %XE_SIGID_GT_TDR by the reset path, and an
>>>>>>   * aborted bind as %XE_SIGID_PROBE by the probe path. That chain lets triage
>>>>>>   * follow a fault from origin to final effect; it is not a duplicate.
>>>>>>
>>>>>> so in this case, some sysctrl timeout may eventually lead to a reset and/or
>>>>>> wedge and/or runtime-survivability-mode, and this intermediate FW SIGID may
>>>>>> help in any postmortem triage, and if we don't reach that final state then
>>>>>> we can still provide some generic resolution based on site and errno (COLLECT)
>>>>>
>>>>> What if the paths are also used in non-critical scenarios for ex: sysctrl commands are used for
>>>>> general counter telemetry, gpu health querying and firmware status.
>>>>> Wouldn't this be lead to a lot of sigids in dmesg in case of some unrelated failure ..
>>>>> Why not only add sigid for critical paths when we are sure it will cause a chain of failure
>>>>> instead of these prints on every trivial command failure.
>>>>
>>>> Ops I miss this.
>>>>
>>>> I agree that we should not add SIGID for every minor or noisy failure. The intent is not to log every non-critical cases,
>>>>
>>>> but to capture important intermediate failures that can help explain the real root cause. If we log only the final critical
>>>>
>>>> failure, we may miss the earlier cases that actually caused the issue. That makes triage and postmortem harder, since
>>>>
>>>> we lose visibility into how the failure occurred. The idea is to use SIGID only for meaningful failure in key execution paths.
>>>>
>>>> Even when these failure are not fatal, they can provide valuable context, make debugging easier and reduce
>>>>
>>>> mean-time-to triage (MTTT).
>>>
>>>
>>> Suppose a user uses invalid entries for gpu health or counter management, won't we be polluting the dmesg
>>> logs with sig id and cper logs unnecessarily since these are not fatal.
>>
>> No, we should not emit SIGID/CPER for bad user input  or invalid query parameters in gpu health/counter management path.
> 
> But the system controller interface is same for all where you have added sig id logs. A failure in sysctrl_send_cmd or receive/send frames will be
> displayed in general non fatal cases too. And it could be due to invalid request.
> 
> This is not a call chain that leads to a critical failure always. Need conclusion on this because one of my patch has a similar condition.

we can discuss what to do in case of explicit error (failure) codes returned by the FW on specific commands, as it looks that unlike the GuC, such errors/failures could be caused by the invalid data provided by the user.

but IMO if the FW sends corrupted frames, which I assume is a part of the low-level FW communication channel, or we can't send some random command to FW - isn't that a good indication that there is a problem with the FW communication that should be reported?

> 
> Riana
> 
>>
>> These are usage errors, not real device or firmware failures.
>>
>>
>> Thanks,
>>
>> -/Mallesh
>>
>>>
>>> Thanks
>>> Riana
>>>
>>>
>>>>
>>>>
>>>> Thanks,
>>>>
>>>> -/Mallesh
>>>>
>>>>>
>>>>> Thanks
>>>>> Riana
>>>>>
>>>>>>
>>>>>>> How do these errors indicate the need for a resolution.
>>>>>>> Do we need it for all kmd logs with components or for errors that need a recovery or can be recoverable?
>>>>>>>
>>>>>>> Thanks
>>>>>>> Riana
>>>>>>>
>>>>>>>> Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>>>>>>>> ---
>>>>>>>>    drivers/gpu/drm/xe/xe_sysctrl_mailbox.c | 26 ++++++++++++-------------
>>>>>>>>    1 file changed, 13 insertions(+), 13 deletions(-)
>>>>>>>>
>>>>>>>> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
>>>>>>>> index e13eebaac1d0..ef847f0a8f2c 100644
>>>>>>>> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
>>>>>>>> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
>>>>>>>> @@ -11,6 +11,7 @@
>>>>>>>>      #include "regs/xe_sysctrl_regs.h"
>>>>>>>>    #include "xe_device.h"
>>>>>>>> +#include "xe_log.h"
>>>>>>>>    #include "xe_mmio.h"
>>>>>>>>    #include "xe_pm.h"
>>>>>>>>    #include "xe_printk.h"
>>>>>>>> @@ -34,15 +35,11 @@ struct xe_sysctrl_mailbox_msg_hdr {
>>>>>>>>    #define XE_SYSCTRL_HDR_RESULT(hdr) \
>>>>>>>>        FIELD_GET(SYSCTRL_HDR_RESULT_MASK, le32_to_cpu((hdr)->data))
>>>>>>>>    -static bool sysctrl_wait_bit_clear(struct xe_sysctrl *sc, u32 bit_mask,
>>>>>>>> -                   unsigned int timeout_ms)
>>>>>>>> +static int sysctrl_wait_bit_clear(struct xe_sysctrl *sc, u32 bit_mask,
>>>>>>>> +                  unsigned int timeout_ms)
>>>>>>>>    {
>>>>>>>> -    int ret;
>>>>>>>> -
>>>>>>>> -    ret = xe_mmio_wait32_not(sc->mmio, SYSCTRL_MB_CTRL, bit_mask, bit_mask,
>>>>>>>> +    return xe_mmio_wait32_not(sc->mmio, SYSCTRL_MB_CTRL, bit_mask, bit_mask,
>>>>>>>>                     timeout_ms * 1000, NULL, false);
>>>>>>>> -
>>>>>>>> -    return ret == 0;
>>>>>>>>    }
>>>>>>>>      static bool sysctrl_wait_bit_set(struct xe_sysctrl *sc, u32 bit_mask,
>>>>>>>> @@ -145,12 +142,14 @@ static int sysctrl_send_frames(struct xe_sysctrl *sc,
>>>>>>>>        struct xe_device *xe = sc_to_xe(sc);
>>>>>>>>        u32 ctrl_reg, total_frames, frame;
>>>>>>>>        size_t bytes_sent, frame_size;
>>>>>>>> +    int ret;
>>>>>>>>          total_frames = DIV_ROUND_UP(cmd_size, XE_SYSCTRL_MB_FRAME_SIZE);
>>>>>>>>    -    if (!sysctrl_wait_bit_clear(sc, SYSCTRL_MB_CTRL_RUN_BUSY, timeout_ms)) {
>>>>>>>> -        xe_err(xe, "sysctrl: Mailbox busy\n");
>>>>>>>> -        return -EBUSY;
>>>>>>>> +    ret = sysctrl_wait_bit_clear(sc, SYSCTRL_MB_CTRL_RUN_BUSY, timeout_ms);
>>>>>>>> +    if (ret) {
>>>>>>>> +        xe_log_err(xe, SYSCTRL, ret, "Mailbox busy\n");
>>>>>>>> +        return ret;
>>>>>>>>        }
>>>>>>>>          sc->phase_bit ^= 1;
>>>>>>>> @@ -173,10 +172,11 @@ static int sysctrl_send_frames(struct xe_sysctrl *sc,
>>>>>>>>              xe_mmio_write32(sc->mmio, SYSCTRL_MB_CTRL, ctrl_reg);
>>>>>>>>    -        if (!sysctrl_wait_bit_clear(sc, SYSCTRL_MB_CTRL_RUN_BUSY, timeout_ms)) {
>>>>>>>> -            xe_err(xe, "sysctrl: Frame %u acknowledgment timeout\n", frame);
>>>>>>>> +        ret = sysctrl_wait_bit_clear(sc, SYSCTRL_MB_CTRL_RUN_BUSY, timeout_ms);
>>>>>>>> +        if (ret) {
>>>>>>>> +            xe_log_err(xe, SYSCTRL, ret, "Frame %u acknowledgment timeout\n", frame);
>>>>>>>>                sc->phase_bit = 0;
>>>>>>>> -            return -ETIMEDOUT;
>>>>>>>> +            return ret;
>>>>>>>>            }
>>>>>>>>              bytes_sent += frame_size;

