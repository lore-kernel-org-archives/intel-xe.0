Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2911CCD1BF
	for <intel-xe@archiver.kernel.org>; Tue, 28 Oct 2025 19:47:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7FA810E651;
	Tue, 28 Oct 2025 19:47:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ki+hmzp6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EC0310E651
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Oct 2025 19:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761680823; x=1793216823;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=hWKLKn8ebi/xgvUxnYnlmsCN9h5Ol5r990q429QaXaU=;
 b=Ki+hmzp66i8mE4jKRVJqPR+esPIZku61uUufDX3V0Alo7Hs7zyN3J9Q+
 nFgIYWmHlGpWyByPT7IHQ4ejpAHzTJ1Jx9kBSC4AG42sWESlDf0AdVSa/
 7sgm7kcPXIWOpT/i3xwOflpps2t2A8KpYKATVO5lKNLhy9Z8wdKl9kQjz
 S5BHsTbBJv+6W4e+4HOipA7DueazNbqytEjIeHx5ifqm/58PSJV4gU1KH
 BYJB5Cu83ino4UQkYTvxCEgN3s3nX7rNWffYh7OIoBvb4qpffjWeSh76A
 oiWwBeBxW2AtNf4dyGpqV3hHIJvDrm4BL9XOtJr9DLg94Evm5WrCJeYaL Q==;
X-CSE-ConnectionGUID: QQ9UfZGsTSy4L2HM3TmW4w==
X-CSE-MsgGUID: qNgqdoxFTxeO2PMIYeSEDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="67656461"
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="67656461"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 12:47:03 -0700
X-CSE-ConnectionGUID: oEpNQu48R8mjkOhrhblh9g==
X-CSE-MsgGUID: aOGi324LT0mKd9KZjbk7Pg==
X-ExtLoop1: 1
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 12:47:03 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 28 Oct 2025 12:47:02 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 28 Oct 2025 12:47:02 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.22)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 28 Oct 2025 12:47:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s2nmFOxCbMnJuh9t5h/vViG5GHiR0tLtD6TpbLwuU9FYywDI1WTYEwvbCqjzxnnEaACffVoqg3f1+KYjywGGhMg+0m2vuQRyO6tMufh10l6m9SI8Ss8UBB/Tdcija6itAvQsry59zs9r167dlN3yyyhZ6gSAZ0cFu1x1qozWiIEAthqKXaszq47ac3QDrWl6Zl6y3whr5HsMEUSWSyC6R7mOTeaFcPaZITlDhBBXlRicSTWzt1IUDv7eXJhfraqmZmdbPLThVd2E58mfhlwuaXa01AXndpx1ixR8YzJCfYG1he9Q+WPzOuvk2fGmgwuJvENzWBc/D3DH6SEFMZegsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=st35i74d0W+LsNJcQSV87OHBvftikhz8BPzqHoeTqXY=;
 b=qyY/vDhkqYinOn0cRy5ndBDEbrt7M2FKQqcj18D0qsCPeIBXTR1593JVgVhnNhZ+MMyYAao75Iwvb7cd0lEbEhQ5p+QxwuMzG1T9MDT9fsdRqROHlRX5oQP1ARBxiH22Iyc97L85cY39SiX0+MAe3y0dNBz1c9H//eozPWt2wl02Q7kqTpKvgSW7lkvdPBzGE1M0t5rBuxw20qhS38fcmNC+wuhfhZBTqhd8NjynFNxqXEaZ1NiR9AFt/oNKKlrQtAAFbbgSqGMKZyjbZMB3Hhzg1fYYf81G0dcCHH4DC/jKn3EpBy9BXc+9RNok4VAegsZwfvEXQPx7YNpgjosioA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ5PPF89507EDE4.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::83e) by IA1PR11MB6292.namprd11.prod.outlook.com
 (2603:10b6:208:3e4::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Tue, 28 Oct
 2025 19:46:59 +0000
Received: from SJ5PPF89507EDE4.namprd11.prod.outlook.com
 ([fe80::28e0:9ef7:24f0:c21b]) by SJ5PPF89507EDE4.namprd11.prod.outlook.com
 ([fe80::28e0:9ef7:24f0:c21b%7]) with mapi id 15.20.9275.013; Tue, 28 Oct 2025
 19:46:57 +0000
Date: Tue, 28 Oct 2025 12:46:50 -0700
From: Matt Atwood <matthew.s.atwood@intel.com>
To: Stuart Summers <stuart.summers@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.brost@intel.com>,
 <niranjana.vishwanathapura@intel.com>, <zhanjun.dong@intel.com>,
 <shuicheng.lin@intel.com>
Subject: Re: [PATCH 1/6] drm/xe: Add additional trace points for LRCs
Message-ID: <aQEdqpNYfI-TDnYZ@msatwood-mobl>
References: <20251027180412.63743-1-stuart.summers@intel.com>
 <20251027180412.63743-2-stuart.summers@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20251027180412.63743-2-stuart.summers@intel.com>
X-ClientProxiedBy: MW4PR04CA0276.namprd04.prod.outlook.com
 (2603:10b6:303:89::11) To SJ5PPF89507EDE4.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::83e)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PPF89507EDE4:EE_|IA1PR11MB6292:EE_
X-MS-Office365-Filtering-Correlation-Id: ce613a97-e5b3-4b68-ac1a-08de165ac0e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QThmcGduaVhsSFBDczk1aExNQVJndkYwZ0lCU0pzZy9TazFxTUFvVVROY2Zw?=
 =?utf-8?B?a096Um1seEdveFpuS2xHeUhqSHFvTEV4b2UwU01oRitSV0t0VURGMU16NGln?=
 =?utf-8?B?RTlnbEV3VGxsUWhHZm1IS01kRjh4ditpaDdhSExITUl4TWszaHprdS9mdkhw?=
 =?utf-8?B?Y2FUQURYQlB5eHllazdPZjQyYlJKZkpjK1hrYkhsYzZQM2xMS3VjTjlkbVlK?=
 =?utf-8?B?Ry9JakVIWkFqT0Vpek9SNGpJa2F1UWV6VHRTbVUzT3NFS1dCamtFQ2NZN0l2?=
 =?utf-8?B?dEFCWHV6d2QxRGdScVZBMjYra1Q4SEdRYTBnK2tpL1ZsR1pEZExUZkpCR0dO?=
 =?utf-8?B?RDVwcnFnMWg0OXRqVHlZcEVScGwyRzRaN1ppdmhEQmdicjVVeTc1YWd3SXN0?=
 =?utf-8?B?S3R5YkZvbm1kVk9BbldzMkhoMnV1UnVPcnFjMDBtQ1dTdWJrdTVzOXZQRndW?=
 =?utf-8?B?d21EY0RlWTRwZnovdE8reWNuSjcyZDZyZ2hxMkUraFAxSjZuRkMyeG42QTFO?=
 =?utf-8?B?TUZHU1VRb0tIdlY1am03RWw5VzRpZHdHS0VFTFYweDBMNVBCVGhkUEgzRUZQ?=
 =?utf-8?B?ZVYzWGxJUzBndDkydWVOYWtqQ092MGFJdWtVUmNocENUeWVRb2FwK0ZRUEZQ?=
 =?utf-8?B?SkN4UHh0dCtqU2VlVkdXZHJJdUNnbW1zdlVwcGdCV3N1TnZJeGlxRlo2VlRV?=
 =?utf-8?B?NTVPVDBNYXlsV1JscyswV2RqWmgrWXFoNnNDOGZaek5icDYxejVmYXdhblhF?=
 =?utf-8?B?aCs0NTFRMDk2MGk4ZlpuYk5PNUhZc2NTTHBOZ3p1UjgxbXRoOVkxRzhuTlJ2?=
 =?utf-8?B?alM1czdVWE9zYnFxUXhRSU5mVW5na01XbDg5UWpjc2xYSjFwTkswZVpSRFE1?=
 =?utf-8?B?OEUxOWNsZ0sySHFxb3ZualpwRUpaSzlucDRkbWhBdW1KQjNDWDVsRDB1aHhU?=
 =?utf-8?B?dit6STZyeGhmN3VkQ2FJYmFCTmZZMURFaENqd0dEanYzMGgyMVlLMHJuYzM4?=
 =?utf-8?B?Y2xMUzNLU3RkcEdELzBmUkg5L2MvU1hrbUdSbEtHSmczYzJBeUhCaDZQV3o4?=
 =?utf-8?B?U0VVVXo3Z203bGx6RVVPUUJydHJ1eWVmMU1UTjlRdGRaaHNQR1R3OVJEYmZi?=
 =?utf-8?B?dFhxdk5STlUvWTQyVmpuK2tidlN0REV0Sm9kWkE4bFp6SnZxT2ZhNlczR0ZP?=
 =?utf-8?B?MWljNUx3elo0YkU3WDF0Z0dQeEg1VDM0SlhJZzZFc3Z2azQ3S00ydUhXUnBn?=
 =?utf-8?B?TndRejZCbjczdEhaS3FzbGFzSURPYWI0U1E4c3VHVjZrUmpRMEU3ZjBoWTZm?=
 =?utf-8?B?Ty9nbWF0bklndUVwTjh5NkpPOU5JbXhNYVJtRDJmMHRKTkltZmNsdzk4aUdo?=
 =?utf-8?B?cGhRR1lqRTJjdE9RTmtxc3hUU2tGanRzSk11YUd4YkxtbzMrNEpVWnZoTm1a?=
 =?utf-8?B?OW1JZmQzN1h6N0ppOVlYOXBsV2NlRXpINzkyNTlCNEl6dVprU2tqRUhNUnR0?=
 =?utf-8?B?T2kweVFsNnFaSUZaQnlScW92a2R0U00xaHZzM1ZBRGZDbllTcUtqcS9LSHRC?=
 =?utf-8?B?VlU3a2xaVmJSMmtVMGh4MGpTUUUzakdXVEdRQWVNOXRacmFUUytlMjF6WHlI?=
 =?utf-8?B?bjJoS1RPZlBCLzVZV2VidkR5c3ZGNTRJOUlpRFV3MGZZalh1d0xPa2l1bDhP?=
 =?utf-8?B?RFdGWFVLaldwZ0ZhZVNySlZEVFpGQXQrMVhpTUlxSHBpSlJIRlNSbDNLYnBh?=
 =?utf-8?B?eGpjUUlYNDFjQ3FOSnVjN1duR09wMk1aNmhZMURRNG9mczEyMEZpQ0l1bGlI?=
 =?utf-8?B?MnoyYkllUWcxNExtdjFKYkJXbEQrRUxWcjlQWGdJRDBNSktPcnVJeTVWWTly?=
 =?utf-8?B?ZTd5OHJ2MEV2ZnR5RTR2dWpOMlVXRmcxTVVFL2EvcjJxdXYvSElMblJPLzg1?=
 =?utf-8?Q?D9ZzVZZEZk8267De+yeCrMjSNSZ+f43s?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ5PPF89507EDE4.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZEM3SmFubTdBSWdONG5UK2Z5eTZaN0VSS3J0SXgybTc3cCtOb3NGaFJmQ0Nw?=
 =?utf-8?B?Ujh1cVd0OStBTUR6Zk5vaFBqV3RSQWUzTURLZ2d6akpYa012Q0JDS0FJQnNr?=
 =?utf-8?B?cXQ2cmtLeWljMElxbm5YL1p2aHRFSEdndmpkcitoYlYvWXBXUnpmSXhScXBx?=
 =?utf-8?B?UGsvU0F0ZnpzRmJBaEczSVVSTXRqUDNNdFJpN0ZWYk9BOG9XenhZWWp5bUxs?=
 =?utf-8?B?T01JVnVoRVp0SkV1YlJrS29YWFh4Rzc4aE9hVFJlVDRZY2pOZG1xU0lrc3FQ?=
 =?utf-8?B?UGdXcmxLRkxBV01sWC9YV1orcW5ra3ZZR3dvbEZsd3RFT0QvMTZ5dE44aXRm?=
 =?utf-8?B?ZnlnS1BNZlZCSzd0aFJ4Vy92dDI1djlqbU9xOGRhaE1kSHhsc3BndWFTN0JF?=
 =?utf-8?B?RWFnYmE4UXA2VldjSDVrdGVlMU44MkVvbjRCRWZhTFdGUFhIcUQweE9neW5Y?=
 =?utf-8?B?eWs1RFpWZHhReDgzdGt3ZmVkZ1F6b3FNL2tYYUgyZk9wRnhQTGp2ZGV0OGZ1?=
 =?utf-8?B?SkVhODhxZU1zdk9LaXJuR1dDRVlZWFcrTWN3dzN5WVBNaFcrSVVxcU9FaXlN?=
 =?utf-8?B?VEp4amI3cjJQaXg0VDRaWTJETXZwbGNOV1lXU01TeEsvNTU5YVpWWXlxWEls?=
 =?utf-8?B?NHR6YURuWXlOelF4Sjd1d0FFMGlrcVlRVnJla2JmRkFRQVN2SmFjMDJoU3Zp?=
 =?utf-8?B?Z1o3alIzdEgxK3ptclc5bitPa3o3YWp2enFCckFjS2FXdHZUS0VqOWYvWEJM?=
 =?utf-8?B?R0Q2OEpmdG1TdzZpL2RtdGNua1hYOHUvbGM0TDM0S0laU0RsZFlPMmJJdWxP?=
 =?utf-8?B?UjQyUkY0c0kvS0xWL3FYZUJhZjgyWUVEWEZwbkFzbjBDOHUyWXEwaG85Tyti?=
 =?utf-8?B?Zk9obEVZcHRLKzlVVXVuL2dnd0RnVU42bjByMzNYQURuand5Z3VqN3RsSFY5?=
 =?utf-8?B?VWVVeGVnMGo5a3d6Vzl1VHdkSGltV0Z5aW0vakphN0JvYjdLa1hiZm9GNVAz?=
 =?utf-8?B?ZTgwK0VZRlFKckpGdnh3UTFNSlNIZHY1emtXMVNUS3ZWdlVGVzVGMmNLWmtV?=
 =?utf-8?B?OVFDWHhmdlRZNjJRRDFEa1Z6MVZ3Kzl0Y2R0c0VEQ3A4OVI5cmVFYW5NTjR1?=
 =?utf-8?B?YXUrY2lYbVRYVEphRStuVzF4QzdkekNqYndoZVBaNHgwQkRpdi9LQXI2NjY0?=
 =?utf-8?B?Zi9YVzVWYldTMWdEdkZkUkdTVHBhLzYxTlhSMU4rTzVvd1B1YjVuQ1kvL21l?=
 =?utf-8?B?Mm9mYXRkOTc2UlhwUjFiY0VMSnJtZm9GSXpKcFJIM1dxSlRudkg5YzhWMmRl?=
 =?utf-8?B?OGIwR1Vvem1waXJuSWx6M1lubzllTURzRCtCWVVpeHlKelFBOVRNZTRFQW9z?=
 =?utf-8?B?LytHUjhvQzBHejFYNVJNY2tocVE5TS9GbWsrWHNnZFUwaFF1dXhPYWZkNlR1?=
 =?utf-8?B?TStEMVFjRlNJSnVlQThFeXVzQ3l3S1dVek5GM0I2K2U5djdTeTRLUzFxL1E2?=
 =?utf-8?B?bms2a0dzY1dJYWlVTkdyWUpqU0NtOGgvcmljSTdidUZRTkltUERyM0pBelpM?=
 =?utf-8?B?MllmS2d6NW5PWmd1TG5MWVZkN0NtbzU2Z2tvSWsxSDRiaXhZc0x4MHVwTWsr?=
 =?utf-8?B?MXJBUmh1M2duTDBoVWI1ajJXUlBiWXZxd2NFV0orUmlCdEFsaEtmU1pKVExz?=
 =?utf-8?B?c25DNFU4VEI0RFdFZXRrN2JGL1h0WDZLQ0lkNjRraG1WUUpGNzNuSWx5M0dk?=
 =?utf-8?B?a2c1alZ6ZHQxcDJQeGlSRXNSYlloV1BRRkhpN2tOekJYOENkQVFYS3Z6NVg1?=
 =?utf-8?B?Tjc1RSt3M20zMjZGL090UG0raTQ3M3AvdElOWTNjdlpreEcvTWl6RnBnQ0gv?=
 =?utf-8?B?SnJLcTAxNS9pVGx1bXFRVlpRTm9FYnZsVFh0V2ZjT2hEMmVGVlFpWVVjaWpG?=
 =?utf-8?B?M2xjNW8zZ0s5RThWTTRXUCtkd0FjeUJiZDFubXc4MXlwQTZCSTRYN3hGZ29G?=
 =?utf-8?B?L3IwK2hiZnVWRUgrODhWQlRmT2pTYzh4aC9pZGswZDNrb3JNa3A3bnRJazBj?=
 =?utf-8?B?WlZEMFB1TFJsZW5FVzRrQWNTaWp0emhFRm5pcG0xeGNuRERBWCtJZ2Z0L0dH?=
 =?utf-8?B?MzgxTkpNc21aUnkzeVBTU2pIb3NvWXowRTU0SWVWd0dpejhYams0eGUzSHVY?=
 =?utf-8?B?ckE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ce613a97-e5b3-4b68-ac1a-08de165ac0e9
X-MS-Exchange-CrossTenant-AuthSource: SJ5PPF89507EDE4.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 19:46:57.3884 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5pvRx8kY7SVZA0Ox+tE+4ZwAyJTCYe/1cFYhoVgIKgwMravnB+IjVByqm9fDMLrAjmfQRh5+sYxlacS78qHpnSGPkDuQIkYXaLNoPKLGgBk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6292
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

On Mon, Oct 27, 2025 at 06:04:07PM +0000, Stuart Summers wrote:
> Add trace points to indicate when an LRC has been
> created and destroyed or get and put.
> 
> Signed-off-by: Stuart Summers <stuart.summers@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_lrc.c       |  4 +++
>  drivers/gpu/drm/xe/xe_lrc.h       |  3 +++
>  drivers/gpu/drm/xe/xe_trace_lrc.h | 42 ++++++++++++++++++++++++++++++-
>  3 files changed, 48 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index b5083c99dd50..42d1c861fe18 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -1575,6 +1575,8 @@ struct xe_lrc *xe_lrc_create(struct xe_hw_engine *hwe, struct xe_vm *vm,
>  		return ERR_PTR(err);
>  	}
>  
> +	trace_xe_lrc_create(lrc);
> +
>  	return lrc;
>  }
>  
> @@ -1589,6 +1591,8 @@ void xe_lrc_destroy(struct kref *ref)
>  {
>  	struct xe_lrc *lrc = container_of(ref, struct xe_lrc, refcount);
>  
> +	trace_xe_lrc_destroy(lrc);
> +
>  	xe_lrc_finish(lrc);
>  	kfree(lrc);
>  }
> diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
> index 2fb628da5c43..fd67810f9812 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.h
> +++ b/drivers/gpu/drm/xe/xe_lrc.h
> @@ -8,6 +8,7 @@
>  #include <linux/types.h>
>  
>  #include "xe_lrc_types.h"
> +#include "xe_trace_lrc.h"
>  
>  struct drm_printer;
>  struct xe_bb;
> @@ -61,6 +62,7 @@ void xe_lrc_destroy(struct kref *ref);
>  static inline struct xe_lrc *xe_lrc_get(struct xe_lrc *lrc)
>  {
>  	kref_get(&lrc->refcount);
> +	trace_xe_lrc_get(lrc);
>  	return lrc;
>  }
>  
> @@ -73,6 +75,7 @@ static inline struct xe_lrc *xe_lrc_get(struct xe_lrc *lrc)
>   */
>  static inline void xe_lrc_put(struct xe_lrc *lrc)
>  {
> +	trace_xe_lrc_put(lrc);
>  	kref_put(&lrc->refcount, xe_lrc_destroy);
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_trace_lrc.h b/drivers/gpu/drm/xe/xe_trace_lrc.h
> index d525cbee1e34..e8daa5d323e7 100644
> --- a/drivers/gpu/drm/xe/xe_trace_lrc.h
> +++ b/drivers/gpu/drm/xe/xe_trace_lrc.h
> @@ -13,7 +13,6 @@
>  #include <linux/types.h>
>  
>  #include "xe_gt_types.h"
> -#include "xe_lrc.h"
>  #include "xe_lrc_types.h"
>  
>  #define __dev_name_lrc(lrc)	dev_name(gt_to_xe((lrc)->fence_ctx.gt)->drm.dev)
> @@ -42,6 +41,47 @@ TRACE_EVENT(xe_lrc_update_timestamp,
>  		      __get_str(device_id))
>  );
>  
> +DECLARE_EVENT_CLASS(xe_lrc,
> +	    TP_PROTO(struct xe_lrc *lrc),
> +	    TP_ARGS(lrc),
> +
> +	    TP_STRUCT__entry(
This looks wrong style wise, but is done in every instance we do
anything like this. Maybe Matt Brost can chime in on why the style is
this way, and if a change is suggested it can be done in a follow up
patch.

Reviewed-by: Matt Atwood <matthew.s.atwood@intel.com>
> +		     __field(struct xe_lrc *, lrc)
> +		     __string(name, lrc->fence_ctx.name)
> +		     __string(device_id, __dev_name_lrc(lrc))
> +	    ),
> +
> +	    TP_fast_assign(
> +		   __entry->lrc	= lrc;
> +		   __assign_str(name);
> +		   __assign_str(device_id);
> +		   ),
> +
> +	    TP_printk("lrc=:%p lrc->name=%s device_id:%s",
> +		      __entry->lrc, __get_str(name),
> +		      __get_str(device_id))
> +);
> +
> +DEFINE_EVENT(xe_lrc, xe_lrc_create,
> +	     TP_PROTO(struct xe_lrc *lrc),
> +	     TP_ARGS(lrc)
> +);
> +
> +DEFINE_EVENT(xe_lrc, xe_lrc_destroy,
> +	     TP_PROTO(struct xe_lrc *lrc),
> +	     TP_ARGS(lrc)
> +);
> +
> +DEFINE_EVENT(xe_lrc, xe_lrc_get,
> +	     TP_PROTO(struct xe_lrc *lrc),
> +	     TP_ARGS(lrc)
> +);
> +
> +DEFINE_EVENT(xe_lrc, xe_lrc_put,
> +	     TP_PROTO(struct xe_lrc *lrc),
> +	     TP_ARGS(lrc)
> +);
> +
>  #endif
>  
>  /* This part must be outside protection */
> -- 
> 2.34.1
> 
