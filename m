Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 738EECA5FA2
	for <intel-xe@archiver.kernel.org>; Tue, 20 Jan 2026 16:11:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 325AC10E62C;
	Tue, 20 Jan 2026 16:11:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TczxhQmj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D36E10E62C
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Jan 2026 16:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768925503; x=1800461503;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=blM+rPmoOZo5xTs+zSeJypueq6womFoXoSqYAuKo0RY=;
 b=TczxhQmj6Ml1of4QxsZFSzMqKixOdYlCOQpqhFE49zL3S72lJSIPbKut
 GUJtOvgQm48JhVjfNpRX1LQvCffNbE6ueAxxp4Y8eWSSWmQpXB52dwImj
 SfwNj5J//JgxSur8oFDynOH0J+d3vPK3zpUSrquqxb3aS8Ilx8eWcm/MN
 OHQA7b2vx3tVVGOhNvZDlLEqbKRv0PtoFeUBelJC8vlIlTnljdwVxiaXq
 EdwAeuCFkOLrY+AFBoquCPB9ASv24GrC761lUt6Ai2QelEo6tBYoTIkoN
 nybyJsHWtAuTlHn9UDdcV/WxhlKfQMqskS/aifzzeBbMCz6dG9AQnZF8P Q==;
X-CSE-ConnectionGUID: 4UwWiQwNSrugeQW7xympWA==
X-CSE-MsgGUID: 8PyyidmXS/i8emI/c3Ft7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="70039415"
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; d="scan'208";a="70039415"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 08:11:42 -0800
X-CSE-ConnectionGUID: LRSdeDO9QXGAIP5ri/BpyQ==
X-CSE-MsgGUID: CUnRA8+NTY+dwMUep5Ojyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; d="scan'208";a="205775307"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 08:11:29 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 08:11:28 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 20 Jan 2026 08:11:28 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.22) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 08:11:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ClrEU3gOU/fpcpYkTKfzX5qKr1p0dPVyKrWpmorqLcHiSbwqdCA2JRLZcbrDDXkyKJDGdxBayyLGVCjooCw68tozg4Sv8FRSbCUSXWGhTXA0ELLl9MkN2cM7KnDU4wBv57C56Lb2JjtzH4W8PErdruElW75t3faL5M63XcqGSicOXJwKVMTkp0qNUCTpPsjT6QHrERyXhAqZKVEaAvj4m+M/ovs+ViEsDRBZ0ljDMkut+vG28y6G12VcHD5jRf9buBe28X8b3h2LBt9HkubeEeelR//eG6Prbp7SYtbxhUcsorsVTwa9QnuenInQLwUU4yYia8gbcVHp7jYLQ/3MSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UPEiBGOhqtmJ3oxWT+72tFrtdvNkoO4GiCNKCtEgNXo=;
 b=LTdYjiTlQFX9eGWj4GDdpYrM6tUNfQwgtakM1eVvzCRc1zr2CB3YpZvvb0e0Mn0ONew5cqeYe0EtLr+3hhtSAc4AUh+xU26jIon021uKcApaSqzSpLf6986dkIRclyOjF58uHONlVY0kWTYywj5XZ/Lae/+XbTG5xgpZyoVyQIIshjLS07OIMbMdkGWjzkAiUJuSW1Vbw6aTUf2JU2YWoV4KO8DEfH0CbUS6OQkCIItz0orA0Up+uwb0ksqE5UuPDlHmpIoY7pmNaF+h89vsuDnm26Ud5p6DaESNq0JxKskdzvGeTvKcGmK47SaYbKISheuyJaep6RqyjdUjNEzFrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by DS4PPF31CEE2CEC.namprd11.prod.outlook.com (2603:10b6:f:fc02::1c)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 16:11:25 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%3]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 16:11:25 +0000
Message-ID: <9e8a94a2-927c-486e-9b60-c1d3e82f830d@intel.com>
Date: Tue, 20 Jan 2026 17:11:21 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/5] drm/xe: Rewrite GGTT VF initialization
To: Maarten Lankhorst <dev@lankhorst.se>, <intel-xe@lists.freedesktop.org>
CC: Matthew Brost <matthew.brost@intel.com>
References: <20260119125101.277182-1-dev@lankhorst.se>
 <20260119125101.277182-3-dev@lankhorst.se>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260119125101.277182-3-dev@lankhorst.se>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VE1PR03CA0057.eurprd03.prod.outlook.com
 (2603:10a6:803:118::46) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|DS4PPF31CEE2CEC:EE_
X-MS-Office365-Filtering-Correlation-Id: c5dde4bf-a909-44b9-d136-08de583e8f42
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NTBuRjMrMkdUQUE4dklJUFF4c2tUMUk5MjZjSU1WaTZsL1ZTcWNadk00alBB?=
 =?utf-8?B?emluQVRxMDJDc3ltZVpKWVRsK1N2dWwwZ3Y1cWlnQXhqMXZseFk2ei9Eekdv?=
 =?utf-8?B?M0lpWHVUb1dCVVZNbVpLWkJzaFZWdDhCMHpPMzF5UFpGUElxdFgySXFzU3ZE?=
 =?utf-8?B?U0xUalg1ejlrQW51cVRMamJsalhBdGRnWXIyMjliSmZSZjJ3cDY5QkhqV2tj?=
 =?utf-8?B?clFTZ1FJUUp2bWJ3ZWlXU21sT1Y1UHlHZkRnbFAwRzNDcU8vY0FNTFViWFFh?=
 =?utf-8?B?N0ZGRHFQckxlMkhwL3R4V1Z2OGk3WjZoZ3FVR3hvVjUwc2M0NFEwajIyU0VT?=
 =?utf-8?B?T28vZ0U0dUNRWk9UclZMMU9hVG9WZ0o0WGlBOWJsREZVL09BQUx4dFhhK0wx?=
 =?utf-8?B?RXU2WENLZFFwclRhR1kwQ1hqUnhMbnQybEZ2ZkNOMEVST09rT2tsenF6RXM2?=
 =?utf-8?B?UkkySDhabFVneG9vUGhrMnBxUFowRTluU0NNTWhOOU9FcVFtK3l2V1FUL0RV?=
 =?utf-8?B?QTZZTHJlMXdldDdxTkdSaE1KSk9Fd2F2VWwvUStBcTRRU3g4SW9rdWZaYVZ3?=
 =?utf-8?B?ZFpZaERVTHBiTzNtY1RQdU5yZVM2ZHZaczJSMVBwOWNZUlZGWC93Y01LeC9n?=
 =?utf-8?B?akExMTlyRmlSMWM0TVhvSVVjNFJCUWlvdTd0bm9ZNExDY0NiK0c0TCtDZ3BL?=
 =?utf-8?B?SG5JaHdJVmZQKzZ0RE9jNm51V0ZPL0JOaTl1cTk0eE9OYk45T0RwR2Fyb1hk?=
 =?utf-8?B?aW0yZDg3dC9MVHhzckpHZTl3MHN4UUkyZ1RBWmdmUEpmeDNWYnB4aUswM0FR?=
 =?utf-8?B?OEQwZlRRWENlL1F2TG16OERMMCt3WFRqOXMzc1c1aUlDNVRMbDdweEJSVzI4?=
 =?utf-8?B?Q0NZNFhaZGx0WXFFMlQwN1ZVWDJKSUNaUUJCNUpWODdIZDRmVzFMZ2VZTENY?=
 =?utf-8?B?bnNrZUl6b0FzTDNkWS9DbklyZkpuVmNreDIrWENud0lwY0tOVlNoMWVyR3JU?=
 =?utf-8?B?dFhMOXZJUm1sYWowQTZOUi84VGkxNk8vV1dWODZLYXBaOEczSVhZNS90ekJV?=
 =?utf-8?B?ZUdvSWQ3eWJLY3ROazVUWEdObzlDa2Y4MzRRdWw1SG83ZEMybzQzYU9ETVBW?=
 =?utf-8?B?U0dSTzIzZnVkRG41T2dUdnlWOWd5b3J4MU9iejgwNmsrNkJGU1RCZk44V3Ry?=
 =?utf-8?B?THBhbjRxUTJVYUgrZFV5V0dFb3UvYXJiY1ZmTlB6dlVtYVRjR1NUT1VVUzdz?=
 =?utf-8?B?czJUVmxKVVdMWm9kQ0gyTm5ZMzRsbm5Dbm4vSDMyMno3UFdOb2N2c3lQanl5?=
 =?utf-8?B?eUZqRmVSdlljUzI4ZkdyVnlvSzFrTThEa1VwSnVnNWNaeDFId3laYzEyVHN2?=
 =?utf-8?B?SjNyazhIS1F0M25RK0NqZUx0M3U3VDVHaG9Qc1lzMFNqVFBHdy9lU3Bpbnl4?=
 =?utf-8?B?d3E0ZVpwM0Y2RDZxTUdTUDZ2NXREZGN2dlRZS080QlU0bG1VbFJQcVhRSjRL?=
 =?utf-8?B?OTR3dGhKZDdvOHBkMGVwYnFtM2R2aVFNRTVyNzVxUjJZdlF1Uld0L2Q2S2VT?=
 =?utf-8?B?cnEyRys1SWRPSFZ3VkFKSm9ZQzg2S3BjQkFQV0c3T0RuQ0IxOGdxU2hMUkZY?=
 =?utf-8?B?RFAvamRaYzFpRTBGTlNSbXlKQ2ZxUUsrRmlSOFl3djREVUcrU1g0VUZjcnAr?=
 =?utf-8?B?d1JDVDZ5TDZWZUNZV0g1ZmpiRmhrNitPcUltTVB4RUZKMWRZRUNmazFiT0R5?=
 =?utf-8?B?L0xRdDJhcmV6cjR3QXdQL2syd01paHlNNTJ4NzFhVE1WeXB0dG11cHNhS3Mw?=
 =?utf-8?B?VWdmRXhMUFg0bWo2VVJnMVpBd1VtL3lQazlJK1VyQlIxaWQ4MG5yZ3NZVDAx?=
 =?utf-8?B?Y1lyMVQxcU1xMmt4bFptUWl2Sk9QMUZXUVU0UUJRQXhwQ2p2Wkh5bEtITTFB?=
 =?utf-8?B?ZmxuSGlYdWcvSEtodjhqU1VyYXRrSHZFVnI0QzdaY3lrRnMxM09PMnE1NmZT?=
 =?utf-8?B?K0lZQm5EK0U3OW1ORHk3SDE4MnRQWm1LaHRrdlF1eGtCT0IrS1VFWkJ0V2dE?=
 =?utf-8?B?cGlkbVFZZHlMYTRVQTBqTXVJalVKbmplUDJqeDBSNkVtUk1vMkNjeHJVZUlx?=
 =?utf-8?Q?dm+8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bDBVQTFORlVCdGtLWkJhRHNNaGxqZEp2Ni90dWlKb3YrR21ERzdCQ2cybVlw?=
 =?utf-8?B?N0RBTGs1YnN1VjBBayt3KzlaS0hpdUdMR1FVZEVPekpWamZzbUlPUHZJV1I5?=
 =?utf-8?B?bXZaZDVSRVJEMERheWpIeFZYSTdrT3dVVVJQbUJOUklLN3JOKy84aHg4QmlO?=
 =?utf-8?B?czA2RS9vZVVuWWRqMko4MG92ZC9nYjBtZjQ5dWdjNVBaVTM5Zjlrb09EZmdI?=
 =?utf-8?B?ZU01RmFHalF6a1lDakRoVmljK0NmR1NDYmd5OVlPS0syUzFYWURzYkFycUlJ?=
 =?utf-8?B?RnVHQ2JvRGJ6T0RrMFUyK3E5blJLMmlvazRkcUZVaTNOVmNBa0JvWDgyb3Vj?=
 =?utf-8?B?Ym45dklBa3ROV0l0NGV6NWgwOHNIS29saXVFUXhSdGQwYS94aEFONWh5eTZJ?=
 =?utf-8?B?UUNvQm1yYm40dk9iQ0NNT28zekJqWDVpdzBsb0Qxb0xrRm5vQkI3V3psT2Yr?=
 =?utf-8?B?L3FEZkg5VXpTT0FOT1dhVUtLNDFnb1hpUmx0TEl1bGVEYVNRWTM4dmhQWXNv?=
 =?utf-8?B?QjdtZzIzaDM1Y1pGS1VGU0N4SmYxb3V3SjdrRm5KN2N6a3I3OEMzeUVvVVBy?=
 =?utf-8?B?OGxJNWxGSTkxcVI5WTlJcTFETmpPUkU1MitoeUplZjNRZVE3V3JMc3oxSnRT?=
 =?utf-8?B?SGY1a3huMDFNU081VTVSbjNDbTBYWld6RkIvUkxFenBXcmNpcUlXVnRCa0FL?=
 =?utf-8?B?cElpMHFraDkvaXNJT0dheXdyc1VhWnArRWxLb0ZwVWNrN3pWa2ZCSS9odTFN?=
 =?utf-8?B?dXdqWHVqKzdJUXlMeTZ1NW1Sc1NNQTVucXNVaHo3Y2hMVUliQ1BqeVk4VWlS?=
 =?utf-8?B?YklpeHVaRFlkV2NXNlRpekNCM1hHNjVqek1YVGVqNDkycUM1SUFYYWRTSjBp?=
 =?utf-8?B?SkkrWTY3dmZTRjhKUTFSNlB1UnhBdUh5WE5JSTNCZHl6MzBEUjRzanh3ZHcw?=
 =?utf-8?B?VUNxSThYTDd1ejhTbXpneFMwallUWXRNVlJKdGphQUc0LytvNzFOZVBlOHFJ?=
 =?utf-8?B?QjBFM1czMDlPeVoxOWs4VTlOSVFzbklwMm9EOCs0WmQ1dzZqTUhiOGVObmxK?=
 =?utf-8?B?WWVmclAvUXJkbzJaQU05SUxlNG9DUE9sNVlvSWNQdzJ0bEVnR3pzWXVZcEo2?=
 =?utf-8?B?aXAyN0xlSGZhWU12Rko0eXdDOWFZK2tiKzJLbWV0dldZMS9RTWtEV1NiVm5J?=
 =?utf-8?B?bStJMFpONFFicEdodWt3d1FWZ0ZQdU9FVitYQ09HeG81dE9zQzBqQno4dHJS?=
 =?utf-8?B?R2xJYi82YzVqWVNFeVViZzhwalhJWWR2bmRiclRjQi8rME1xSmREQlpFbFhn?=
 =?utf-8?B?MnhxRnZ4OU00Q2pKV0lvVEZwT1BSWEtOL3AvOHZTb0VmMnlKTnBzZ0p4bVBJ?=
 =?utf-8?B?MFdtdjQyVUx6bGhZWmQ3YWV4R3ZyRldOY3FyQjR5L0RkbXpjRi9KMmY1N1Rh?=
 =?utf-8?B?MFFQOXVhd3p4OHc2S0J0dmFNOFVUSVlXVUxpSDdNU0MzSkF5NHhlZ2xBYTNF?=
 =?utf-8?B?WG92UEVYbTIwWjIwdUtMQkNiTC9nUFNTQmRCcGdCakc2Z2w0U0ZORExsNTFV?=
 =?utf-8?B?VWd3aVUwS2lIQUh6U21MY0c0RnltVDFUQUVhM3JabFlYcU0ydS9QZlZnYmxq?=
 =?utf-8?B?ckpYL1lRSnZNNXcxbE1BR0pHOW9hcTNHeE85ay9IditFTlZSUE9yb2V4bks5?=
 =?utf-8?B?UHB4bjRkODZpSTE4OVVHZDhjeHNBQVE0OGp5dU5NSDB4R1ZFTEU1dHRSWTRs?=
 =?utf-8?B?UUlWUmxvN0pNUnM4dE1UUVowOVNzMm9TbFdwNHViMjFCTk5pK1FTZnp0bUpV?=
 =?utf-8?B?WE85aitGZ1V6ZmppUXZGQVpIbHlham1reDJoVm0zOHFnQmRDeVQwYnhXSVQz?=
 =?utf-8?B?VjZDdzdUbUdzNzN2NTJlUGtENFBTMkJWOHNMSmhNUi9QVGNSTzlzRC96a2Mw?=
 =?utf-8?B?dGY1K1pDcXZTUEx0V0RXd1FURzZHb0VncGNNYjhDRTFleXJkV0wrSWNtK2o5?=
 =?utf-8?B?T3BBcndwczR6ckYxK0xzNGQ1NnpYM3ZZWDJ5MkI4WVE1N25CclE4b0NaNnA1?=
 =?utf-8?B?MlBvZlZqNWd3SVhUMFdkUjZMNkhIemRrbGFDbTFGbWx5dXZGQWkzcnpIZWRq?=
 =?utf-8?B?ZXhjK0Q4MUhQelZOK05hcDl3RElMa3crNE9jVGM3RFBES1d2V09YNXNpN0R1?=
 =?utf-8?B?NDVhOS9hNzMyWGZ0cDBhYXJFVElVYkRTNWlob0hjeFJCOEptalkrM09sY1pP?=
 =?utf-8?B?TUtiRWNzMTRNQmdZSDBtY1pmSzh0VWw5T0J6L3lxTVVVMjFKaFNYb05lVlVX?=
 =?utf-8?B?TDZ6cDFIT05Zc2wwTGN2N0NWRHhWYy9sb1YrMThzMFBhUXY0NVljNGk4RWlP?=
 =?utf-8?Q?Jm52wCJItzQOCdbo=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c5dde4bf-a909-44b9-d136-08de583e8f42
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 16:11:25.0610 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m8ZCcyB3ubZ6VPfCmWC4xgpcrEawZ4Ur5/K2Mf4/EdEae9EUzEwfxU4+/5Jnp0pZeGkXB/3dUmJ9Uk1iQ6ng6wrcHZPcw2hGlvO4+zeCIgI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF31CEE2CEC
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



On 1/19/2026 1:50 PM, Maarten Lankhorst wrote:
> The previous code was using a complicated system with 2 balloons to
> set GGTT size and adjust GGTT offset. While it works, it's overly
> complicated.
> 
> A better approach is to set the offset and size when initializing GGTT,
> this removes the need for adding balloons. The resize function only
> needs readjust ggtt->start to have GGTT at the new offset.
> 
> This removes the need to manipulate the internals of xe_ggtt outside
> of xe_ggtt, and cleans up a lot of now unneeded code.
> 
> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
> Co-developed-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device_types.h  |   2 -
>  drivers/gpu/drm/xe/xe_ggtt.c          | 164 ++++-----------------
>  drivers/gpu/drm/xe/xe_ggtt.h          |   5 +-
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.c   |  27 +++-
>  drivers/gpu/drm/xe/xe_tile_sriov_vf.c | 198 +-------------------------
>  drivers/gpu/drm/xe/xe_tile_sriov_vf.h |   3 -
>  6 files changed, 54 insertions(+), 345 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 34feef79fa4e7..0409fa98835e8 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -228,8 +228,6 @@ struct xe_tile {
>  			struct xe_lmtt lmtt;
>  		} pf;
>  		struct {
> -			/** @sriov.vf.ggtt_balloon: GGTT regions excluded from use. */
> -			struct xe_ggtt_node *ggtt_balloon[2];
>  			/** @sriov.vf.self_config: VF configuration data */
>  			struct xe_tile_sriov_vf_selfconfig self_config;
>  		} vf;
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index 7e9ff8057703f..35f5c05680e1c 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -70,8 +70,8 @@
>   * struct xe_ggtt_node - A node in GGTT.
>   *
>   * This struct needs to be initialized (only-once) with xe_ggtt_node_init() before any node
> - * insertion, reservation, or 'ballooning'.
> - * It will, then, be finalized by either xe_ggtt_node_remove() or xe_ggtt_node_deballoon().
> + * insertion or reservation.
> + * It will, then, be finalized by xe_ggtt_node_remove().
>   */
>  struct xe_ggtt_node {
>  	/** @ggtt: Back pointer to xe_ggtt where this region will be inserted at */
> @@ -347,9 +347,15 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
>  		ggtt_start = wopcm;
>  		ggtt_size = (gsm_size / 8) * (u64)XE_PAGE_SIZE - ggtt_start;
>  	} else {
> -		/* GGTT is expected to be 4GiB */
> -		ggtt_start = wopcm;
> -		ggtt_size = SZ_4G - ggtt_start;
> +		ggtt_start = xe_tile_sriov_vf_ggtt_base(ggtt->tile);
> +		ggtt_size = xe_tile_sriov_vf_ggtt(ggtt->tile);
> +
> +		if (ggtt_start < wopcm || ggtt_start > GUC_GGTT_TOP ||
> +		    ggtt_size > GUC_GGTT_TOP - ggtt_start) {
> +			xe_tile_err(ggtt->tile, "Invalid GGTT configuration: %#llx-%#llx\n",
> +				    ggtt_start, ggtt_start + ggtt_size - 1);

nit: probably it would be better to catch such invalid config sooner, right after we get that from the GuC
but then we would have to expose some function from xe_ggtt to make that validation that xe_gt_vf code could use

> +			return -ERANGE;
> +		}
>  	}
>  
>  	ggtt->gsm = ggtt->tile->mmio.regs + SZ_8M;
> @@ -377,17 +383,7 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
>  	if (err)
>  		return err;
>  
> -	err = devm_add_action_or_reset(xe->drm.dev, dev_fini_ggtt, ggtt);
> -	if (err)
> -		return err;
> -
> -	if (IS_SRIOV_VF(xe)) {
> -		err = xe_tile_sriov_vf_prepare_ggtt(ggtt->tile);
> -		if (err)
> -			return err;
> -	}
> -
> -	return 0;
> +	return devm_add_action_or_reset(xe->drm.dev, dev_fini_ggtt, ggtt);
>  }
>  ALLOW_ERROR_INJECTION(xe_ggtt_init_early, ERRNO); /* See xe_pci_probe() */
>  
> @@ -538,120 +534,21 @@ static void xe_ggtt_invalidate(struct xe_ggtt *ggtt)
>  	ggtt_invalidate_gt_tlb(ggtt->tile->media_gt);
>  }
>  
> -static void xe_ggtt_dump_node(struct xe_ggtt *ggtt,
> -			      const struct drm_mm_node *node, const char *description)
> -{
> -	char buf[10];
> -
> -	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG)) {
> -		string_get_size(node->size, 1, STRING_UNITS_2, buf, sizeof(buf));
> -		xe_tile_dbg(ggtt->tile, "GGTT %#llx-%#llx (%s) %s\n",
> -			    node->start, node->start + node->size, buf, description);
> -	}
> -}
> -
> -/**
> - * xe_ggtt_node_insert_balloon_locked - prevent allocation of specified GGTT addresses
> - * @node: the &xe_ggtt_node to hold reserved GGTT node
> - * @start: the starting GGTT address of the reserved region
> - * @end: then end GGTT address of the reserved region
> - *
> - * To be used in cases where ggtt->lock is already taken.
> - * Use xe_ggtt_node_remove_balloon_locked() to release a reserved GGTT node.
> - *
> - * Return: 0 on success or a negative error code on failure.
> - */
> -int xe_ggtt_node_insert_balloon_locked(struct xe_ggtt_node *node, u64 start, u64 end)
> -{
> -	struct xe_ggtt *ggtt = node->ggtt;
> -	int err;
> -
> -	xe_tile_assert(ggtt->tile, start < end);
> -	xe_tile_assert(ggtt->tile, IS_ALIGNED(start, XE_PAGE_SIZE));
> -	xe_tile_assert(ggtt->tile, IS_ALIGNED(end, XE_PAGE_SIZE));
> -	xe_tile_assert(ggtt->tile, !drm_mm_node_allocated(&node->base));
> -	xe_assert(xe, start >= ggtt->start);
> -	lockdep_assert_held(&ggtt->lock);
> -
> -	node->base.color = 0;
> -	node->base.start = start - ggtt->start;
> -	node->base.size = end - start;
> -
> -	err = drm_mm_reserve_node(&ggtt->mm, &node->base);
> -
> -	if (xe_tile_WARN(ggtt->tile, err, "Failed to balloon GGTT %#llx-%#llx (%pe)\n",
> -			 xe_ggtt_node_addr(node), xe_ggtt_node_addr(node) + node->base.size, ERR_PTR(err)))
> -		return err;
> -
> -	xe_ggtt_dump_node(ggtt, &node->base, "balloon");
> -	return 0;
> -}
> -
>  /**
> - * xe_ggtt_node_remove_balloon_locked - release a reserved GGTT region
> - * @node: the &xe_ggtt_node with reserved GGTT region
> - *
> - * To be used in cases where ggtt->lock is already taken.
> - * See xe_ggtt_node_insert_balloon_locked() for details.
> - */
> -void xe_ggtt_node_remove_balloon_locked(struct xe_ggtt_node *node)
> -{
> -	if (!xe_ggtt_node_allocated(node))
> -		return;
> -
> -	lockdep_assert_held(&node->ggtt->lock);
> -
> -	xe_ggtt_dump_node(node->ggtt, &node->base, "remove-balloon");
> -
> -	drm_mm_remove_node(&node->base);
> -}
> -
> -static void xe_ggtt_assert_fit(struct xe_ggtt *ggtt, u64 start, u64 size)
> -{
> -	struct xe_tile *tile = ggtt->tile;
> -
> -	xe_tile_assert(tile, start >= ggtt->start);
> -	xe_tile_assert(tile, start + size <= ggtt->start + ggtt->size);
> -}
> -
> -/**
> - * xe_ggtt_shift_nodes_locked - Shift GGTT nodes to adjust for a change in usable address range.
> + * xe_ggtt_shift_nodes - Shift GGTT nodes to adjust for a change in usable address range.

nit: while use of () is not so popular, it's still the correct notation that IMO we should follow

	xe_ggtt_shift_nodes() - ...

>   * @ggtt: the &xe_ggtt struct instance
> - * @shift: change to the location of area provisioned for current VF
> - *
> - * This function moves all nodes from the GGTT VM, to a temp list. These nodes are expected
> - * to represent allocations in range formerly assigned to current VF, before the range changed.
> - * When the GGTT VM is completely clear of any nodes, they are re-added with shifted offsets.
> + * @new_start: new location of area provisioned for current VF

nit: since this function is void and all validation of new_start param is done with asserts,
maybe it's worth to mention/list below what are our expectations for this 'new_start' ?

>   *
> - * The function has no ability of failing - because it shifts existing nodes, without
> - * any additional processing. If the nodes were successfully existing at the old address,
> - * they will do the same at the new one. A fail inside this function would indicate that
> - * the list of nodes was either already damaged, or that the shift brings the address range
> - * outside of valid bounds. Both cases justify an assert rather than error code.
> + * Adjust the base offset of the GGTT.

nit: this sounds more like an implementation detail
since function name is about "nodes" we should explain the connection here

	"To adjust location of all allocated GGTT nodes, this function
	"changes the base offset of the GGTT, since all nodes refer to it.

>   */
> -void xe_ggtt_shift_nodes_locked(struct xe_ggtt *ggtt, s64 shift)
> +void xe_ggtt_shift_nodes(struct xe_ggtt *ggtt, u64 new_start)
>  {
> -	struct xe_tile *tile __maybe_unused = ggtt->tile;
> -	struct drm_mm_node *node, *tmpn;
> -	LIST_HEAD(temp_list_head);
> -
> -	lockdep_assert_held(&ggtt->lock);
> +	guard(mutex)(&ggtt->lock);
>  
> -	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG))
> -		drm_mm_for_each_node_safe(node, tmpn, &ggtt->mm)
> -			xe_ggtt_assert_fit(ggtt, node->start + shift, node->size);
> +	xe_tile_assert(ggtt->tile, new_start >= xe_wopcm_size(tile_to_xe(ggtt->tile)));
> +	xe_tile_assert(ggtt->tile, new_start + ggtt->size <= GUC_GGTT_TOP);
>  
> -	drm_mm_for_each_node_safe(node, tmpn, &ggtt->mm) {
> -		drm_mm_remove_node(node);
> -		list_add(&node->node_list, &temp_list_head);
> -	}
> -
> -	list_for_each_entry_safe(node, tmpn, &temp_list_head, node_list) {
> -		list_del(&node->node_list);
> -		node->start += shift;
> -		drm_mm_reserve_node(&ggtt->mm, node);
> -		xe_tile_assert(tile, drm_mm_node_allocated(node));
> -	}
> +	WRITE_ONCE(ggtt->start, new_start);
>  }
>  
>  static int xe_ggtt_node_insert_locked(struct xe_ggtt_node *node,
> @@ -692,12 +589,8 @@ int xe_ggtt_node_insert(struct xe_ggtt_node *node, u32 size, u32 align)
>   *
>   * This function will allocate the struct %xe_ggtt_node and return its pointer.
>   * This struct will then be freed after the node removal upon xe_ggtt_node_remove()
> - * or xe_ggtt_node_remove_balloon_locked().
> - *
> - * Having %xe_ggtt_node struct allocated doesn't mean that the node is already
> - * allocated in GGTT. Only xe_ggtt_node_insert(), allocation through
> - * xe_ggtt_node_insert_transform(), or xe_ggtt_node_insert_balloon_locked() will ensure the node is inserted or reserved
> - * in GGTT.
> + * Having %xe_ggtt_node struct allocated doesn't mean that the node is already allocated
> + * in GGTT. Only xe_ggtt_node_insert() will ensure the node is inserted or reserved in GGTT.
>   *
>   * Return: A pointer to %xe_ggtt_node struct on success. An ERR_PTR otherwise.
>   **/
> @@ -718,9 +611,9 @@ struct xe_ggtt_node *xe_ggtt_node_init(struct xe_ggtt *ggtt)
>   * xe_ggtt_node_fini - Forcebly finalize %xe_ggtt_node struct
>   * @node: the &xe_ggtt_node to be freed
>   *
> - * If anything went wrong with either xe_ggtt_node_insert(), xe_ggtt_node_insert_locked(),
> - * or xe_ggtt_node_insert_balloon_locked(); and this @node is not going to be reused, then,
> - * this function needs to be called to free the %xe_ggtt_node struct
> + * If anything went wrong with either xe_ggtt_node_insert() and this @node is
> + * not going to be reused, then this function needs to be called to free the
> + * %xe_ggtt_node struct
>   **/
>  void xe_ggtt_node_fini(struct xe_ggtt_node *node)
>  {
> @@ -892,8 +785,8 @@ static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
>  	}
>  
>  	mutex_lock(&ggtt->lock);
> -	xe_assert(xe, start >= ggtt->start || !start);
> -	xe_assert(xe, end >= ggtt->start);
> +	xe_tile_assert(ggtt->tile, start >= ggtt->start || !start);
> +	xe_tile_assert(ggtt->tile, end >= ggtt->start);
>  
>  	if (start)
>  		start -= ggtt->start;
> @@ -1223,7 +1116,8 @@ u64 xe_ggtt_read_pte(struct xe_ggtt *ggtt, u64 offset)
>   */
>  u64 xe_ggtt_node_addr(const struct xe_ggtt_node *node)
>  {
> -	return node->base.start + node->ggtt->start;
> +	/* pairs with WRITE_ONCE in xe_ggtt_shift_nodes() */
> +	return node->base.start + READ_ONCE(node->ggtt->start);
>  }
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
> index 70d5e07ac4b66..49ea8e7ecc105 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.h
> +++ b/drivers/gpu/drm/xe/xe_ggtt.h
> @@ -19,10 +19,7 @@ int xe_ggtt_init(struct xe_ggtt *ggtt);
>  
>  struct xe_ggtt_node *xe_ggtt_node_init(struct xe_ggtt *ggtt);
>  void xe_ggtt_node_fini(struct xe_ggtt_node *node);
> -int xe_ggtt_node_insert_balloon_locked(struct xe_ggtt_node *node,
> -				       u64 start, u64 size);
> -void xe_ggtt_node_remove_balloon_locked(struct xe_ggtt_node *node);
> -void xe_ggtt_shift_nodes_locked(struct xe_ggtt *ggtt, s64 shift);
> +void xe_ggtt_shift_nodes(struct xe_ggtt *ggtt, u64 new_base);
>  u64 xe_ggtt_start(struct xe_ggtt *ggtt);
>  u64 xe_ggtt_size(struct xe_ggtt *ggtt);
>  
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> index 30e8c2cf5f09a..ba8a87730940d 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -488,7 +488,6 @@ u32 xe_gt_sriov_vf_gmdid(struct xe_gt *gt)
>  static int vf_get_ggtt_info(struct xe_gt *gt)
>  {
>  	struct xe_tile *tile = gt_to_tile(gt);
> -	struct xe_ggtt *ggtt = tile->mem.ggtt;
>  	struct xe_guc *guc = &gt->uc.guc;
>  	u64 start, size, ggtt_size;
>  	s64 shift;
> @@ -496,8 +495,6 @@ static int vf_get_ggtt_info(struct xe_gt *gt)
>  
>  	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>  
> -	guard(mutex)(&ggtt->lock);

nit: as we now drop this mutex and run all below code lockless,
maybe it's worth to separate pure "get" code from "apply" code?

> -
>  	err = guc_action_query_single_klv64(guc, GUC_KLV_VF_CFG_GGTT_START_KEY, &start);
>  	if (unlikely(err))
>  		return err;
> @@ -509,8 +506,20 @@ static int vf_get_ggtt_info(struct xe_gt *gt)
>  	if (!size)
>  		return -ENODATA;
>  
> +	/*
> +	 * This function is called once during xe_guc_init_noalloc(),
> +	 * at which point ggtt_size = 0 and we have to initialize everything,
> +	 * and ggtt is not yet initialized.

s/and ggtt/and GGTT

> +	 *
> +	 * After init this can be called repeatedly from post migration fixups,
> +	 * at which point we inform the GGTT of the new base address.
> +	 * xe_ggtt_shift_nodes() may be called multiple times for each migration,
> +	 * but will be a noop if the base is unchanged.
> +	 */
>  	ggtt_size = xe_tile_sriov_vf_ggtt(tile);
> -	if (ggtt_size && ggtt_size != size) {
> +	if (!ggtt_size) {
> +		xe_tile_sriov_vf_ggtt_store(tile, size);

since we know this case is for the first time query, maybe we should do all that's needed and exit?

		xe_tile_sriov_vf_ggtt_base_store(tile, start);
or:
		xe_tile_sriov_vf_ggtt_init(tile, start, size);

		return 0;
	}

> +	} else if (ggtt_size != size) {
>  		xe_gt_sriov_err(gt, "Unexpected GGTT reassignment: %lluK != %lluK\n",
>  				size / SZ_1K, ggtt_size / SZ_1K);
>  		return -EREMCHG;
> @@ -521,12 +530,16 @@ static int vf_get_ggtt_info(struct xe_gt *gt)
>  
>  	shift = start - (s64)xe_tile_sriov_vf_ggtt_base(tile);
>  	xe_tile_sriov_vf_ggtt_base_store(tile, start);
> -	xe_tile_sriov_vf_ggtt_store(tile, size);
>  
> -	if (shift && shift != start) {
> +	if (ggtt_size) {

then this 'if' would be redundant

> +		/*
> +		 * Since we're not holding a lock, the shift value may be
> +		 * calculated incorrectly.
> +		 * This is only used for a debug print so it's harmless.
> +		 */
>  		xe_gt_sriov_info(gt, "Shifting GGTT base by %lld to 0x%016llx\n",
>  				 shift, start);
> -		xe_tile_sriov_vf_fixup_ggtt_nodes_locked(gt_to_tile(gt), shift);
> +		xe_ggtt_shift_nodes(tile->mem.ggtt, start);

hmm, it's a shame that even if we have and call tile level function
we still have to touch directly ggtt from the gt level function

maybe this could be a part of xe_tile_sriov_vf_ggtt_base_store() or

		xe_tile_sriov_vf_ggtt_reinit(tile, start);

>  	}
>  
>  	if (xe_sriov_vf_migration_supported(gt_to_xe(gt))) {
> diff --git a/drivers/gpu/drm/xe/xe_tile_sriov_vf.c b/drivers/gpu/drm/xe/xe_tile_sriov_vf.c
> index c9bac2cfdd044..24293521e0904 100644
> --- a/drivers/gpu/drm/xe/xe_tile_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_tile_sriov_vf.c
> @@ -14,173 +14,12 @@
>  #include "xe_tile_sriov_vf.h"
>  #include "xe_wopcm.h"
>  
> -static int vf_init_ggtt_balloons(struct xe_tile *tile)
> -{
> -	struct xe_ggtt *ggtt = tile->mem.ggtt;
> -
> -	xe_tile_assert(tile, IS_SRIOV_VF(tile_to_xe(tile)));
> -
> -	tile->sriov.vf.ggtt_balloon[0] = xe_ggtt_node_init(ggtt);
> -	if (IS_ERR(tile->sriov.vf.ggtt_balloon[0]))
> -		return PTR_ERR(tile->sriov.vf.ggtt_balloon[0]);
> -
> -	tile->sriov.vf.ggtt_balloon[1] = xe_ggtt_node_init(ggtt);
> -	if (IS_ERR(tile->sriov.vf.ggtt_balloon[1])) {
> -		xe_ggtt_node_fini(tile->sriov.vf.ggtt_balloon[0]);
> -		return PTR_ERR(tile->sriov.vf.ggtt_balloon[1]);
> -	}
> -
> -	return 0;
> -}
> -
> -/**
> - * xe_tile_sriov_vf_balloon_ggtt_locked - Insert balloon nodes to limit used GGTT address range.
> - * @tile: the &xe_tile struct instance
> - *
> - * Return: 0 on success or a negative error code on failure.
> - */
> -static int xe_tile_sriov_vf_balloon_ggtt_locked(struct xe_tile *tile)
> -{
> -	u64 ggtt_base = tile->sriov.vf.self_config.ggtt_base;
> -	u64 ggtt_size = tile->sriov.vf.self_config.ggtt_size;
> -	struct xe_device *xe = tile_to_xe(tile);
> -	u64 wopcm = xe_wopcm_size(xe);
> -	u64 start, end;
> -	int err;
> -
> -	xe_tile_assert(tile, IS_SRIOV_VF(xe));
> -	xe_tile_assert(tile, ggtt_size);
> -	lockdep_assert_held(&tile->mem.ggtt->lock);
> -
> -	/*
> -	 * VF can only use part of the GGTT as allocated by the PF:
> -	 *
> -	 *      WOPCM                                  GUC_GGTT_TOP
> -	 *      |<------------ Total GGTT size ------------------>|
> -	 *
> -	 *           VF GGTT base -->|<- size ->|
> -	 *
> -	 *      +--------------------+----------+-----------------+
> -	 *      |////////////////////|   block  |\\\\\\\\\\\\\\\\\|
> -	 *      +--------------------+----------+-----------------+
> -	 *
> -	 *      |<--- balloon[0] --->|<-- VF -->|<-- balloon[1] ->|
> -	 */
> -
> -	if (ggtt_base < wopcm || ggtt_base > GUC_GGTT_TOP ||
> -	    ggtt_size > GUC_GGTT_TOP - ggtt_base) {
> -		xe_sriov_err(xe, "tile%u: Invalid GGTT configuration: %#llx-%#llx\n",
> -			     tile->id, ggtt_base, ggtt_base + ggtt_size - 1);
> -		return -ERANGE;
> -	}
> -
> -	start = wopcm;
> -	end = ggtt_base;
> -	if (end != start) {
> -		err = xe_ggtt_node_insert_balloon_locked(tile->sriov.vf.ggtt_balloon[0],
> -							 start, end);
> -		if (err)
> -			return err;
> -	}
> -
> -	start = ggtt_base + ggtt_size;
> -	end = GUC_GGTT_TOP;
> -	if (end != start) {
> -		err = xe_ggtt_node_insert_balloon_locked(tile->sriov.vf.ggtt_balloon[1],
> -							 start, end);
> -		if (err) {
> -			xe_ggtt_node_remove_balloon_locked(tile->sriov.vf.ggtt_balloon[0]);
> -			return err;
> -		}
> -	}
> -
> -	return 0;
> -}
> -
> -static int vf_balloon_ggtt(struct xe_tile *tile)
> -{
> -	struct xe_ggtt *ggtt = tile->mem.ggtt;
> -	int err;
> -
> -	mutex_lock(&ggtt->lock);
> -	err = xe_tile_sriov_vf_balloon_ggtt_locked(tile);
> -	mutex_unlock(&ggtt->lock);
> -
> -	return err;
> -}
> -
> -/**
> - * xe_tile_sriov_vf_deballoon_ggtt_locked - Remove balloon nodes.
> - * @tile: the &xe_tile struct instance
> - */
> -void xe_tile_sriov_vf_deballoon_ggtt_locked(struct xe_tile *tile)
> -{
> -	xe_tile_assert(tile, IS_SRIOV_VF(tile_to_xe(tile)));
> -
> -	xe_ggtt_node_remove_balloon_locked(tile->sriov.vf.ggtt_balloon[1]);
> -	xe_ggtt_node_remove_balloon_locked(tile->sriov.vf.ggtt_balloon[0]);
> -}
> -
> -static void vf_deballoon_ggtt(struct xe_tile *tile)
> -{
> -	mutex_lock(&tile->mem.ggtt->lock);
> -	xe_tile_sriov_vf_deballoon_ggtt_locked(tile);
> -	mutex_unlock(&tile->mem.ggtt->lock);
> -}
> -
> -static void vf_fini_ggtt_balloons(struct xe_tile *tile)
> -{
> -	xe_tile_assert(tile, IS_SRIOV_VF(tile_to_xe(tile)));
> -
> -	xe_ggtt_node_fini(tile->sriov.vf.ggtt_balloon[1]);
> -	xe_ggtt_node_fini(tile->sriov.vf.ggtt_balloon[0]);
> -}
> -
> -static void cleanup_ggtt(struct drm_device *drm, void *arg)
> -{
> -	struct xe_tile *tile = arg;
> -
> -	vf_deballoon_ggtt(tile);
> -	vf_fini_ggtt_balloons(tile);
> -}
> -
> -/**
> - * xe_tile_sriov_vf_prepare_ggtt - Prepare a VF's GGTT configuration.
> - * @tile: the &xe_tile
> - *
> - * This function is for VF use only.
> - *
> - * Return: 0 on success or a negative error code on failure.
> - */
> -int xe_tile_sriov_vf_prepare_ggtt(struct xe_tile *tile)
> -{
> -	struct xe_device *xe = tile_to_xe(tile);
> -	int err;
> -
> -	err = vf_init_ggtt_balloons(tile);
> -	if (err)
> -		return err;
> -
> -	err = vf_balloon_ggtt(tile);
> -	if (err) {
> -		vf_fini_ggtt_balloons(tile);
> -		return err;
> -	}
> -
> -	return drmm_add_action_or_reset(&xe->drm, cleanup_ggtt, tile);
> -}
> -
>  /**
>   * DOC: GGTT nodes shifting during VF post-migration recovery
>   *
>   * The first fixup applied to the VF KMD structures as part of post-migration
>   * recovery is shifting nodes within &xe_ggtt instance. The nodes are moved
>   * from range previously assigned to this VF, into newly provisioned area.
> - * The changes include balloons, which are resized accordingly.
> - *
> - * The balloon nodes are there to eliminate unavailable ranges from use: one
> - * reserves the GGTT area below the range for current VF, and another one
> - * reserves area above.
>   *
>   * Below is a GGTT layout of example VF, with a certain address range assigned to
>   * said VF, and inaccessible areas above and below:
> @@ -198,10 +37,6 @@ int xe_tile_sriov_vf_prepare_ggtt(struct xe_tile *tile)
>   *
>   *  |<------- inaccessible for VF ------->|<VF owned>|<-- inaccessible for VF ->|
>   *
> - * GGTT nodes used for tracking allocations:
> - *
> - *      |<---------- balloon ------------>|<- nodes->|<----- balloon ------>|
> - *
>   * After the migration, GGTT area assigned to the VF might have shifted, either
>   * to lower or to higher address. But we expect the total size and extra areas to
>   * be identical, as migration can only happen between matching platforms.
> @@ -219,37 +54,12 @@ int xe_tile_sriov_vf_prepare_ggtt(struct xe_tile *tile)
>   * So the VF has a new slice of GGTT assigned, and during migration process, the
>   * memory content was copied to that new area. But the &xe_ggtt nodes are still
>   * tracking allocations using the old addresses. The nodes within VF owned area
> - * have to be shifted, and balloon nodes need to be resized to properly mask out
> - * areas not owned by the VF.
> - *
> - * Fixed &xe_ggtt nodes used for tracking allocations:
> - *
> - *     |<------ balloon ------>|<- nodes->|<----------- balloon ----------->|
> + * have to be shifted, and the start offset for GGTT adjusted.
>   *
> - * Due to use of GPU profiles, we do not expect the old and new GGTT ares to
> + * Due to use of GPU profiles, we do not expect the old and new GGTT areas to
>   * overlap; but our node shifting will fix addresses properly regardless.
>   */
>  
> -/**
> - * xe_tile_sriov_vf_fixup_ggtt_nodes_locked - Shift GGTT allocations to match assigned range.
> - * @tile: the &xe_tile struct instance
> - * @shift: the shift value
> - *
> - * Since Global GTT is not virtualized, each VF has an assigned range
> - * within the global space. This range might have changed during migration,
> - * which requires all memory addresses pointing to GGTT to be shifted.
> - */
> -void xe_tile_sriov_vf_fixup_ggtt_nodes_locked(struct xe_tile *tile, s64 shift)
> -{
> -	struct xe_ggtt *ggtt = tile->mem.ggtt;
> -
> -	lockdep_assert_held(&ggtt->lock);
> -
> -	xe_tile_sriov_vf_deballoon_ggtt_locked(tile);
> -	xe_ggtt_shift_nodes_locked(ggtt, shift);
> -	xe_tile_sriov_vf_balloon_ggtt_locked(tile);
> -}
> -
>  /**
>   * xe_tile_sriov_vf_lmem - VF LMEM configuration.
>   * @tile: the &xe_tile
> @@ -330,7 +140,7 @@ u64 xe_tile_sriov_vf_ggtt_base(struct xe_tile *tile)
>  
>  	xe_tile_assert(tile, IS_SRIOV_VF(tile_to_xe(tile)));
>  
> -	return config->ggtt_base;
> +	return READ_ONCE(config->ggtt_base);
>  }
>  
>  /**
> @@ -346,5 +156,5 @@ void xe_tile_sriov_vf_ggtt_base_store(struct xe_tile *tile, u64 ggtt_base)
>  
>  	xe_tile_assert(tile, IS_SRIOV_VF(tile_to_xe(tile)));
>  
> -	config->ggtt_base = ggtt_base;
> +	WRITE_ONCE(config->ggtt_base, ggtt_base);
>  }
> diff --git a/drivers/gpu/drm/xe/xe_tile_sriov_vf.h b/drivers/gpu/drm/xe/xe_tile_sriov_vf.h
> index 749f41504883c..f2bbc4fc57347 100644
> --- a/drivers/gpu/drm/xe/xe_tile_sriov_vf.h
> +++ b/drivers/gpu/drm/xe/xe_tile_sriov_vf.h
> @@ -10,9 +10,6 @@
>  
>  struct xe_tile;
>  
> -int xe_tile_sriov_vf_prepare_ggtt(struct xe_tile *tile);
> -void xe_tile_sriov_vf_deballoon_ggtt_locked(struct xe_tile *tile);
> -void xe_tile_sriov_vf_fixup_ggtt_nodes_locked(struct xe_tile *tile, s64 shift);
>  u64 xe_tile_sriov_vf_ggtt(struct xe_tile *tile);
>  void xe_tile_sriov_vf_ggtt_store(struct xe_tile *tile, u64 ggtt_size);
>  u64 xe_tile_sriov_vf_ggtt_base(struct xe_tile *tile);

