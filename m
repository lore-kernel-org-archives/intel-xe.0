Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BE2CD2FEDF
	for <intel-xe@archiver.kernel.org>; Tue, 27 Jan 2026 20:16:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D95110E5BE;
	Tue, 27 Jan 2026 20:16:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RW9oDbRZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6149010E5BE
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Jan 2026 20:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769544959; x=1801080959;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=L+Myy1/j7coGrkdG4InwcmFw62MOkVlJ6k0ff7bAKiw=;
 b=RW9oDbRZ0p5rvlVVmh/NBla6Vj6+TpE+y6UtWTuDMOoh9wX5yZ3tpQHv
 wfRiNTtEqsB25GRbb4W4/Ha3skwN1bw+yWriXGD62wqLjWaOxIPhDaxZn
 STKv/r7cXXZTy7fd2915Mr3Vkq+px0ilDT/c48g6PXOwE7lday5dxP8HW
 fBJllNUIlw1Q6EKb8g8fQim4NjendFC2k3knteQuCeo+OQjNHqb5BtBU4
 5rzjM2DIa6rJRywpIpAQiynPTgi9nJr54hZXaH0EYLB9pT1pB+TcBL/y3
 Ave48LTckA8ldl8wDsZU8hfELI9EaJsb3OuA4E2QsTlvVrB8kVG5qWJO+ g==;
X-CSE-ConnectionGUID: N5xYOzNTTGGuBUB+8stNfQ==
X-CSE-MsgGUID: T+f5g+wVR5OVnje5ICx8/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="74376312"
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="74376312"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 12:15:59 -0800
X-CSE-ConnectionGUID: cYab/D8iTmaoXrgb1ltPkA==
X-CSE-MsgGUID: oWhzskzkSRGOJw58DoujwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="208514476"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 12:15:59 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 27 Jan 2026 12:15:58 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 27 Jan 2026 12:15:58 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.38) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 27 Jan 2026 12:15:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P/kMA7cbI/R/EaEqikDlIOLiyauCWiJ1q30kxYfLiYLIGHNQo7lIo3UQSLoU7Knl/rAgJg8GwHnLmTDCRDfBwzh9SEROcFlzLo13bPABz2MadCDqTUhc4U2b/qd73Rxo5ljG8BYO26dqpoydgu6p8jGMVKhIYV3DiNtIX/h80WH5fddgvK2MsTE9M/Zy+9hgOFbibZni4MAcuYqXRfOrKTm/GJO05fEXa9bneVMCEAJ591BZoGIlKz3lTqqvsxuYGvMXLr8KU1yIImY8w3wDyHWNjCdRhdDoIo+6G1C0nTbRKGgynVPoJqh5kIGuRylTrkLxQgZXMe+pUovcYPRv1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=44UiUme+j61ymBfLLfJPzbjLlxGN2quNqL5hhVu5lYM=;
 b=CuI0F+AQwnXrr8yam7JDRJNGj5SAf7OPu45EwnHz3fI/sjwi2/Wjbdr1KwNw0dNSQCWMJVYOJ9dFtxg9KSpsa+vseAl86wCRfeGl5HMUyuKBU/Y0Tq7l0dmngEXkRnLVkwMTT4KB3Fn2NRNEMMdpEEh8EZvM8vAs8FmXNlKaymDOe+lerLZ1KW8dRTJksIjJMa9iY36LOigRp1uKTLwtr2o6QycMPxdF+rEiW5EsUzUJ7m87c961QwCCfLR1fbfir+/9e7M8FokX4iNdqkRfeytOyzxbotrWH/WggsJQXExbeNkekXvGEjmMwlnGEH6j4nAYWlePA/YG6SqJqaypmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA4PR11MB9394.namprd11.prod.outlook.com (2603:10b6:208:563::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Tue, 27 Jan
 2026 20:15:55 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%6]) with mapi id 15.20.9542.010; Tue, 27 Jan 2026
 20:15:55 +0000
Date: Tue, 27 Jan 2026 12:15:52 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Daniele Ceraolo Spurio
 <daniele.ceraolospurio@intel.com>, Carlos Santa <carlos.santa@intel.com>
Subject: Re: [PATCH] drm/xe: Do not preempt fence signaling CS instructions
Message-ID: <aXkc+DtEtRWSRAyk@lstrano-desk.jf.intel.com>
References: <20260115004546.58060-1-matthew.brost@intel.com>
 <q4f6zwko4q6337m3ap244j6q3lfqqrkmlxq2l5ojgcbensliaf@yj7ndeqnrvuz>
 <aWqn/eXaw2t9j4fY@lstrano-desk.jf.intel.com>
 <5nddlxy5z2naxxoz7jnyhpwpv3pofv57fuhflcjjwhxell5ozg@xmrhis4b7hhf>
 <aW/vdvCw/3DZwfpt@lstrano-desk.jf.intel.com>
 <ftzvlqcyj74d4bh25mreg64f647jintfteo7apctrnrsjgqbjs@k2ulohn2ycsg>
 <3ropzjiwoal64zajsgyba3nefzmntbvsk6oxp3pv2li4nfobiz@3gsjuhsuhkhn>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3ropzjiwoal64zajsgyba3nefzmntbvsk6oxp3pv2li4nfobiz@3gsjuhsuhkhn>
X-ClientProxiedBy: MW4PR02CA0026.namprd02.prod.outlook.com
 (2603:10b6:303:16d::25) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA4PR11MB9394:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b08f873-1fb8-438b-9202-08de5de0e057
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UnE2dHZHYmZlcm9yOUVaZGozc1dlVWMzTjA4bFJlRDkzSTlVRXU3ZzRHaHlH?=
 =?utf-8?B?dXRxalZrVjJLcWNMd3NSaGkvS1BwUDJndjJqUFJLeGNldnlMNGtBUDdYUlVW?=
 =?utf-8?B?bXkwK2dSWnBkc3g4R3ZzMVJ4ZExvaWZmNHByc1F4MXc3SWIvR3I4RlNhRllj?=
 =?utf-8?B?YmI1QW0yUVd2WWZVcTZPUzQxTkc1dDRIUzBPTXZnRW5OZVVsd2xYemRCOHlT?=
 =?utf-8?B?Um56SDRDOExxKzZ0OHIwZzFXcWVURkhveXhDTnlKZVFGOHBLbkZmdElUTE96?=
 =?utf-8?B?eEIzZEtKd3FpZ0pSdWxSSzJJdkMxWExFdkU3NTVOWXhoRUtpbnBPSjNvVm1W?=
 =?utf-8?B?OTRURmx6ME84eHVwQWNzRko3dEpVTVRSbmF6MkZ2NTR4bW56TUJHZzlyQlBU?=
 =?utf-8?B?NHRYU2ozZXhmb0U0bFRBbFJRa29tZjhZSDJhSjBBSTk1U29BRGVUQTd1cGdV?=
 =?utf-8?B?Y2tkYU9hUjl1TGE2Z09PV0pveWlYWWh1ZXhCWFBnc2JxU0JBOUFYc0U5VHhj?=
 =?utf-8?B?eUZteU40NklWUW5IRVZwa2hhU2pndTNOS2ZWbVhLVVJHSEptWGY4b0p1TGhZ?=
 =?utf-8?B?Sm9LdUxGTzNJd05pOEhsVlRoQzlscUpkbS8yMUx5b3RpM21nSERMUjlqbCtq?=
 =?utf-8?B?dVBvQnZwajF4Y0dnaFh2WHRKV3RFR3YyOWhNQXoxcFFvTkwveWxVMmFjajdh?=
 =?utf-8?B?UDUxc0RjSWp0ZkF4ekIvYkM0VWdvQ0FlSjZ6R0txci9mOTBCK3VOMmtUakZQ?=
 =?utf-8?B?YVdYdFBBakdLV0FkT1dydnFSSEJwelhIdG5JaHFZQVhZUU5iRzV0UTVmUVQ4?=
 =?utf-8?B?YVJJaEZ6bGtMenp3TGJycXZtRkNqRzFKTFpxQkdTblp3Q2ZjQkdGZktiTEc2?=
 =?utf-8?B?N1FmWjlWRlRDam1oVTVkY3FGMCtLUmVLNFgzNTFzM05YR1p6WUJQTmpHVDVV?=
 =?utf-8?B?MUN4MjRlemtTQ1hhMDI3MWZaOXR5R3BkVkNFaUFzdEprc0VObDVqckJQT3Rs?=
 =?utf-8?B?V1g3Z2VydG1wRlBwVlZMcU1nVlpRZUd2NEdqZEYzTmllR2paWU14dGhsbFNF?=
 =?utf-8?B?ZEFZMzBGeEZpV0VyRDRwbHVGYjdUV0RlR3diN0tUblhlRmhmWXlYRXc2Tldu?=
 =?utf-8?B?YmFERjRER0xwODdVRS91VGVrYWRrNlA5Zm1JVUdIOU43TW1iM0k0TGszYXJ1?=
 =?utf-8?B?aGc4MnRPclNDYTRBY1llS05SdFZXNlhrTzlaeUM5RjJrblNQRjFpZ1B6Z1Iw?=
 =?utf-8?B?Z3Z3TjVNTU5wQitsc2NrU3I2cysxUnFlc1FUeVJhS290elkvSmVYQVY1KzRv?=
 =?utf-8?B?U3A4a0RrTmo2QXZIclI5d01Pa01tNWd3SHRKbG5JTDVOYjVpOTlPYVJ4QnIw?=
 =?utf-8?B?cjBscDdjWndEOHNPKzk4a2FjdE5QUkM4S2x2R1Q1TkFyRFBXeEdHZVcxNWJK?=
 =?utf-8?B?akp2Um1GZmx0ZTdSVTMrbU9hOTQ2Y2EyVjdtOHdiOTZDK1NCOU4vMVFyWFBT?=
 =?utf-8?B?WjJnNWk4aGc1Skc3ZndCNE12SVNKYlpOcXZJZXRGcWQ5TmliZEZid2dDOE0z?=
 =?utf-8?B?TnlUZ2o2NWdMRHNFbUlKSGlacnBNU09kSloyWm4yWU9aUXAvSUZ6b2RGT3o3?=
 =?utf-8?B?RnpVU3c2eXhXWG94eVNmS1pXTWhyaTc4amNrdlBiOW5BSVIreTlwMjlpRUVC?=
 =?utf-8?B?akdHYzhVWUtkTTEwbERUaEJWTnRrMXNyZFF4c3ZOOU9XdkcwM0dialoxd1gz?=
 =?utf-8?B?S3hzVlQ2aWZ0K1BaOVpSUG5MWHYwYU1iZnM3dlBqeUZma0twcXk3NGdTWWpS?=
 =?utf-8?B?QjJqK0J6OU1WOEx5NXdsTURkTi9XUDdRdjcxODBzOU5sQnlnVEkzS1JHeHd1?=
 =?utf-8?B?NzlGNlA4aGRQZTRCRlNhdWpCUUUzN053czNJZjF3STBhdmplaFhjb2R4K01k?=
 =?utf-8?B?VGIyb1QzbURQMGFndEt6bFNLbjlOangwdE9BUWpQUmdIejZYS0pJSVBtT1U5?=
 =?utf-8?B?aitjdDFVUTBNb2g2V0FiNmR2UFBjd1V0WnJhNE54aWl6WStZZmJSZlBYdy82?=
 =?utf-8?Q?bv0bfx?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?emorL3hjVjhkRVpuanRtQ2FuSmFTNTFQdGhmWkFJanNvVDF1ajZ4UzA1T2dS?=
 =?utf-8?B?dGZ1RmFndDJzWlRPc2lIUDlmM0dRTDJGaFFBN3Q0VHNwbkZRemRPMlo0RXB6?=
 =?utf-8?B?bHV5ZktXS1ZVb3JzMXpQczE2T21yRThLanE4ZjdJWllnR0tqb2NsM1ZkMDVQ?=
 =?utf-8?B?VEhwMitvNjRGbXQ1aDhHbzV3VDh0VEdZYndhWU9XVVh6SGVOSFJHNXdvUFBK?=
 =?utf-8?B?WEhsc081SUZSL2l4QWdSQUdBSXEvdkVBNzZRdG5hZzBLWEE5MnNFRHk0cDY1?=
 =?utf-8?B?SU1tclZpN1NaZjNCTkhiRnpNYlRGQkxCSWsvZHV5c0czelEvL2xmUHErcndH?=
 =?utf-8?B?RFNIYWZZRlJwTFhESWY3OVZQVklXRFNRVjN5SHV6WUhOcHZlWVY0YURwRmdT?=
 =?utf-8?B?TGhCRHBUZTRZeTN0T0lvRzh3SnllR3FOSUQ2SnozaXRJWVNNWVArVVEyZkVl?=
 =?utf-8?B?MkQ5K1doMVo2U0lyaGQybEpkZHFhUmMxbURlVm9OR3UrRDRwSkZlWVZ3TFhL?=
 =?utf-8?B?VUoxK3ZGSGFKVkl4M1lRT3I1Y1VjRy9aWFo3N0I4YVJWbVhFUGgra0lDbFZJ?=
 =?utf-8?B?cDgrRXBZWllMcVpocWpmTlpLaFdleXlka0pubHQyUUFPTlRUNVpmeHZnRDRD?=
 =?utf-8?B?UHpLZjU1YnJTM2daTkVJdVdBY291dGZBQXlhdStWL0lrZE0vTTAxdVo3TXBh?=
 =?utf-8?B?cE5GYmJTSlpTVEkxNUQ2R3ZPUDV4dmlYQ0ZNZ2JDdGFrMzJiVDh5YjZnb2Ra?=
 =?utf-8?B?UlZVMGt4N2dST3VOanlGb2kxa05STWhUR3AvV2RUaytSZTBkNFg5Vm4yMDRY?=
 =?utf-8?B?YVMxMktDTkpGcGxtU2FhamJ3c3dqcHl0Y2FjZVhQNVFLcUN6a2czR09PSldx?=
 =?utf-8?B?TDhlYUIzYmNyNkt2YjJ2U2pETWpOYmRoajYrdGtRd1FMNFFhSG53Tm4xYkNk?=
 =?utf-8?B?MVhmRjAvZjByUDYyRkQxejIwcDJyS1RJUzUxcVh5VjhPaFE1OXBla2NKZmF4?=
 =?utf-8?B?L0tPWjR6Q3dBaW1XRUROSFpXZ0lmU2o2dE1ZNUpZOXhkTklwb0ROYjloYW9v?=
 =?utf-8?B?NEsxYlgwSjZ6aTNDVnlKa083ZFVpQU5HaTA5UmhReWlkNDlmQUZiMWRZMnF4?=
 =?utf-8?B?cDY1eGM4b0xNOFFsMmZjcWF4Qmo0NWVnWEpTcWlVbnZETmFJaFRia0pUUXAz?=
 =?utf-8?B?UW9XY0xueVJpRkxYK3VLaHZOR2xyTlFxbGZlSWNacHlsRm9aV1lDWVl5ejd3?=
 =?utf-8?B?NzcwVkZHU1grSkFIYlM4bkY3eEV0UkE2c0g5RVIyWWFrcldQdm9RU1lxSzEw?=
 =?utf-8?B?S3JZR0s5SU9rTHdzUVFBV0tINDYvd1kvbldNUGZDL1pGUHNCOHJGdHd2SzRL?=
 =?utf-8?B?V2ZlMHdZYjRNamFUdWRodE9jMVRueGF0aUN5cEZnRTRXbkVxMUg5MVVaRGxm?=
 =?utf-8?B?WFNSd3dVTlp6L0Y2VElVK3ZBQy8xZ09DVjFQeHRyQ283QXlHSjUrS2pYdldz?=
 =?utf-8?B?TUhvemJDSkRic2xsdGlLSC9teE9XUW9iNjlrLzF1YzArbWJXZG94SlFuanFR?=
 =?utf-8?B?YngzMHlxT1hPUXZCZi9ET2pNeGxQaEh1eFVZRyt6Y2Q2NDFlTm15b1ozU0xr?=
 =?utf-8?B?QjN0UmdHbGZQNFMzeWhXaEFzZXNBTCtNVUNFbFduZ2VmRDg1anllWmxaUFZZ?=
 =?utf-8?B?U0p0bG91VjZMbDZ0NmRkcGpDNzdHVGRzdHZHaEJ5ZFBRWjZ6RXJ0dXcrYS9R?=
 =?utf-8?B?UWZxSTY1VmlneGF6dlBidWNhbFpIcy84TzJwSUNVVHNzKzBGTkZ2M2ZtSHJk?=
 =?utf-8?B?V0Z6RzdhZlBweHZINThYUGJNNUUzanQ2ZHZSZUZ5ZHNhNWFBSFhIRjdLZU53?=
 =?utf-8?B?MDZMS1A1LzdhK3E2eE9WRjJvcFZPWEVsSVc5WjZMQ0VNaUl2WC9FNDFEOGRY?=
 =?utf-8?B?N25Edlk3SVU3WWIydThVb2dweC9Lcm1nQ3hIbmswYk1IbUxxVy9LYm1JdUpI?=
 =?utf-8?B?WFpXMFhhZTduY1JCQlJhUUowOGhRNUx4am1LZTZ4bWlrTW9lTWQ3VHpoaHVJ?=
 =?utf-8?B?QS9Jbm0zMmNJNjhpb0k2dG9zckF5Q3FHeVROZHYzeGRnL1hWQVpLd1lUL083?=
 =?utf-8?B?TnY3c3Q2WWpOQkVYTWVsQ0cvWE9ncm1JMnBSUEIwdmkwYnhZUTJRcEVYMm5v?=
 =?utf-8?B?MEtBNWRWNENQUHJIY0VFMTRTekdZT3V5cndxYzh2MkJRV1RQWnY4Z1crK3Y0?=
 =?utf-8?B?VklzdU9WREhuTTJZdDFHdkxTb3Z1MUR6UkhDeDlhZTlGU2VhcEtiTzd0RUZK?=
 =?utf-8?B?NkZ2bHZMUThxNWdLNDE1Vlk0aEkxTjQySHo5dG0wSmNlZzlyRlpPTmM5dGx0?=
 =?utf-8?Q?Ksca+rA+8t7dqJ98=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b08f873-1fb8-438b-9202-08de5de0e057
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 20:15:55.2500 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: viDvofWTuOh08jDw8oGFo6/PoXjaskJJNItwOmraWQ6g6XCTDpC1gAZmdEe2yX8xjjShTkrx6IJz5BWg8+iRhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9394
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

On Tue, Jan 27, 2026 at 08:20:36AM +0100, Zbigniew Kempczyński wrote:
> On Thu, Jan 22, 2026 at 09:44:14AM +0100, Zbigniew Kempczyński wrote:
> > On Tue, Jan 20, 2026 at 01:11:18PM -0800, Matthew Brost wrote:
> > > On Mon, Jan 19, 2026 at 01:01:34PM +0100, Zbigniew Kempczyński wrote:
> > > > On Fri, Jan 16, 2026 at 01:05:01PM -0800, Matthew Brost wrote:
> > > > > On Fri, Jan 16, 2026 at 10:45:39AM +0100, Zbigniew Kempczyński wrote:
> > > > > > On Wed, Jan 14, 2026 at 04:45:46PM -0800, Matthew Brost wrote:
> > > > > > > If a batch buffer is complete, it makes little sense to preempt the
> > > > > > > fence signaling instructions in the ring, as the largest portion of the
> > > > > > > work (the batch buffer) is already done and fence signaling consists of
> > > > > > > only a few instructions. If these instructions are preempted, the GuC
> > > > > > > would need to perform a context switch just to signal the fence, which
> > > > > > > is costly and delays fence signaling. Avoid this scenario by disabling
> > > > > > > preemption immediately after the BB start instruction and re-enabling it
> > > > > > > after executing the fence signaling instructions.
> > > > > > > 
> > > > > > > Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
> > > > > > > Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> > > > > > > Cc: Carlos Santa <carlos.santa@intel.com>
> > > > > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > > > > ---
> > > > > > >  drivers/gpu/drm/xe/xe_ring_ops.c | 9 +++++++++
> > > > > > >  1 file changed, 9 insertions(+)
> > > > > > > 
> > > > > > > diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
> > > > > > > index a1fd99f2d539..cd645ee400b9 100644
> > > > > > > --- a/drivers/gpu/drm/xe/xe_ring_ops.c
> > > > > > > +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
> > > > > > > @@ -282,6 +282,9 @@ static void __emit_job_gen12_simple(struct xe_sched_job *job, struct xe_lrc *lrc
> > > > > > >  
> > > > > > >  	i = emit_bb_start(batch_addr, ppgtt_flag, dw, i);
> > > > > > >  
> > > > > > > +	/* Don't preempt fence signaling */
> > > > > > > +	dw[i++] = MI_ARB_ON_OFF | MI_ARB_DISABLE;
> > > > > > > +
> > > > > > >  	if (job->user_fence.used) {
> > > > > > >  		i = emit_flush_dw(dw, i);
> > > > > > >  		i = emit_store_imm_ppgtt_posted(job->user_fence.addr,
> > > > > > > @@ -347,6 +350,9 @@ static void __emit_job_gen12_video(struct xe_sched_job *job, struct xe_lrc *lrc,
> > > > > > >  
> > > > > > >  	i = emit_bb_start(batch_addr, ppgtt_flag, dw, i);
> > > > > > >  
> > > > > > > +	/* Don't preempt fence signaling */
> > > > > > > +	dw[i++] = MI_ARB_ON_OFF | MI_ARB_DISABLE;
> > > > > > > +
> > > > > > >  	if (job->user_fence.used) {
> > > > > > >  		i = emit_flush_dw(dw, i);
> > > > > > >  		i = emit_store_imm_ppgtt_posted(job->user_fence.addr,
> > > > > > > @@ -399,6 +405,9 @@ static void __emit_job_gen12_render_compute(struct xe_sched_job *job,
> > > > > > >  
> > > > > > >  	i = emit_bb_start(batch_addr, ppgtt_flag, dw, i);
> > > > > > >  
> > > > > > > +	/* Don't preempt fence signaling */
> > > > > > > +	dw[i++] = MI_ARB_ON_OFF | MI_ARB_DISABLE;
> > > > > > > +
> > > > > > 
> > > > > > IGT tests which calls compute-walker, then bbe are asynchronous (don't
> > > > > > wait for completion, pipe-control is necessary to wait on
> > > > > > compute-walker).
> > > > > > 
> > > > > 
> > > > > This asynchronous behavior may explain things. Is this a common use
> > > > > case?
> > > > 
> > > > Compute runtime if I'm not wrong uses pipe-control explicitely. IGT are
> > > > not doing this relying on kmd.
> > > > 
> > > 
> > > It would be good confirm this.
> > > 
> > > > > 
> > > > > Also do you know if render engines have similar asynchronous behaviors
> > > > > or is this specific to compute engines?
> > > > 
> > > > I don't know, I think Mesa folks may know the answer.
> > > >
> > > 
> > > Let me ask around about this.
> > >  
> > > > > 
> > > > > Lastly, the i915 disables preemption on both render / compute engines
> > > > > immediately after the BB before emitting the pipe control. Is this async
> > > > > behavior a new few feature in Xe2 parts which only the Xe driver
> > > > > supports? This might explain why the i915 works and Xe does not.
> 
> We don't have platforms which supports WMTP in i915 driver. This imo explains why
> there're no issues observed there. I mean regardless preemption state
> disabled/enabled all instructions soon or later completes. 
> 
> > > > 
> > > > Test exercises WMTP and this is supported starting at Xe2+. Probably
> > > > what test is doing has a meaning in this case. First compute-walker
> > > > submits kernel which loops until it will observe some memory write.
> > > > Second job executes compute-walker with kernel which does some quick job.
> > > > But first occupies all EU's so second job can be preempted only when
> > > > preemption occurs and SIP will be executed. So if we disable preemption
> > > > immediately we submit compute-walker I think we have no change to enter
> > > > SIP and switch. Even if I add pipe-control to batch level according
> > > > to Daniele comment job it is still preemptable and we move pipe-control
> > > > location from kmd -> batch level..
> > > 
> > > Does the test work with a pipe control in the batch? That would be a
> > > good data point - if let me know how I can change the test I can test
> > > out too.
> > 
> > I'm going to add appropriate pipe-control to pipeline and send the
> > patch.
> 
> This change: https://patchwork.freedesktop.org/series/160484/
> 
> along with your patch passes the test.
> 

Thanks! Great data point. Now just need to test out Mesa / Compute. I
suspect they properly insert pipe controls in batches as preemption
points but need to confirm.

Matt 

> --
> Zbigniew
> 
> > 
> > --
> > Zbigniew
> > 
> > > 
> > > It is fine the batch preempts, we actually want that. Mid-batch
> > > preemption is not what we are trying to prevent - we are trying to
> > > prevent preemption of the fence signaling after the batch is done. As
> > > long as we don't regress any user applications we can safely make this
> > > change - it is fine to break IGTs which are not doing the right thing
> > > wrt to batch programming.
> > > 
> > > Matt
> > > 
> > > > 
> > > > --
> > > > Zbigniew
> > > > 
> > > > > 
> > > > > Matt
> > > > > 
> > > > > > May you try to put arb disable after emit_render_cache_flush?
> > > > > > 
> > > > > > --
> > > > > > Zbigniew
> > > > > > 
> > > > > > >  	i = emit_render_cache_flush(job, dw, i);
> > > > > > >  
> > > > > > >  	if (job->user_fence.used)
> > > > > > > -- 
> > > > > > > 2.34.1
> > > > > > > 
