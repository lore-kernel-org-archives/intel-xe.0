Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B37FFE65D11
	for <intel-xe@archiver.kernel.org>; Fri, 22 Nov 2024 01:28:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C14110E15D;
	Fri, 22 Nov 2024 01:28:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JyStqZyL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5CDD10E15D
 for <Intel-Xe@lists.freedesktop.org>; Fri, 22 Nov 2024 01:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732238913; x=1763774913;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=uISnsZJ+1jbVowBuD8kGgH8tga82xILr4h+5HFrBsGo=;
 b=JyStqZyLb6oFKj46zMjbKtZ4ppyp9CAwG/p/LRdemofksrwgOrWJJkjD
 Om9bW2N3iPpl5Qpi4mxhPMz5GOFQ4P/zkl7erBIdsjdbPQX2Itv8NQS54
 77mQQQrk/T18tHvLe0GYMSxlblqC78WGH4KKPF/3XpbeKsFJzppzQBLQo
 esmZnGqbfb4T/qHOtBUjMISLukwKmc70i56GQQAOXlNbYGjioRWGgrktU
 G0TwAAP+VUzFMD4iy9YdncL/o6AcvEOe9U2DH0Q+SOyUllcMsblPTsTla
 iaqZt74aTr720SSQKvIDxX8bJQdiZps7/epfsThytOJntxR0FFXc4fmEh A==;
X-CSE-ConnectionGUID: CnyaBIO8S0+BX33jgtlyMg==
X-CSE-MsgGUID: I56KqIYdR8m3xcNy6O4bTg==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="31767897"
X-IronPort-AV: E=Sophos;i="6.12,174,1728975600"; d="scan'208";a="31767897"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 17:28:26 -0800
X-CSE-ConnectionGUID: SDNYmVgjTPuIsJjxF2CPmA==
X-CSE-MsgGUID: DjRfgpotTwawPAG94UNnuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,174,1728975600"; d="scan'208";a="94517761"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Nov 2024 17:25:16 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 21 Nov 2024 17:25:15 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 21 Nov 2024 17:25:15 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 21 Nov 2024 17:25:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ogHvvFPa8pufaEJd6cpDiLMvFOOAFKiahPRcaPtjAc7vSU+aC166TqauhKcTL2NJdwB+Y0d0ksyEixyyUgE6xy+kf1ClazbeWHUReWKwZRGaH6oY02qWWYriwBG3V8yn8d6ENwvVsN9jmZ+Fs03xlcO8oS4yBhw2dvWIyvxFGcYR5LW5UlUYoggB3ej+f4Ylwu2QkNzS2qiguNGTqAXznAYjvvjqQaIH8eud0Or+BXOchJ/GTEqtHp2kBLVg52lc2KXgJklvTSfE1fD/eykUS8YLVomsa/ktgQEiOO00TeS+GIOz1N93xwsfNSsVf7tYLKZez9y9bGAR9spIq06NOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BVRM/pMYGvwqkAcgkmjnNmSvHmtPAeCMG2s2jtgf7F4=;
 b=KlmfZYKtTQds9E0HQLrQhh0xndelMwTTX5rI3rNZ4fPa+QTsvqwJuPxWgXE0XdkxGfI3qs2/UZAgxZC4QMwY5HKBjnjizbX5SQ0Z7jWwfrLSTLeLt+eTTX45/8+gKELipeaoEcUJezxgAyVIonq6o55xEngJYVyWeqT7o8iP3NjXCfjk2F8hCtR2Ub0MMBhd/AeYIZ9G2SprF2Y+mzboYIlGbBWqlM2uu5q4OcwmO0y6m9Am0rLPPRRdbHwhTWsok3+Ygq7ftxFeRhHPwRW3mKFxSv8uyflz4StqQZooH8em5dX5O/GwwBp0gaLKJSBJFjzs3gYjmqBAmNqJksKTRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by IA1PR11MB6268.namprd11.prod.outlook.com (2603:10b6:208:3e4::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.27; Fri, 22 Nov
 2024 01:25:12 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%3]) with mapi id 15.20.8158.023; Fri, 22 Nov 2024
 01:25:12 +0000
Message-ID: <132d8232-e8a2-4c68-b426-ef5363e90eb1@intel.com>
Date: Thu, 21 Nov 2024 17:25:10 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] drm/xe: Add mutex locking to devcoredump
To: Matthew Brost <matthew.brost@intel.com>
CC: <Intel-Xe@lists.freedesktop.org>
References: <20241121225542.1336796-1-John.C.Harrison@Intel.com>
 <20241121225542.1336796-3-John.C.Harrison@Intel.com>
 <Zz/F29WgIzFmAH3V@lstrano-desk.jf.intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <Zz/F29WgIzFmAH3V@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0242.namprd04.prod.outlook.com
 (2603:10b6:303:88::7) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|IA1PR11MB6268:EE_
X-MS-Office365-Filtering-Correlation-Id: 2bd158f5-0511-401a-c634-08dd0a9482c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cUpzb1RkMUtJYjBXQmRlSTNZR2hGSEZQVFdkVHQ3b05FWTV1QmhuaTdrdUQv?=
 =?utf-8?B?MWU3OFd5NWVNZTFMSmoxUTd5RndQNS9PdXR1eDVZNTM5WDA4Rk9VVzhCTDV3?=
 =?utf-8?B?aWdISUQ2bUtoVFdpWjE1K3FMR085dGVZRnRaUzRXM3JIVUhRZmxneTI3Y3Bi?=
 =?utf-8?B?bmpLalRsNUk3ajRab29mNnExNFUxM1c2elQrbmtQelViZG5jUFN1ZExJWmtN?=
 =?utf-8?B?QmxIeTA3clVWMERYc3hZL1JYUVlSYklXNWppRDNTckk0a1BVTVdDc3grQ0p6?=
 =?utf-8?B?U2JReW54YUJFd1RWMjdDNUdHZnAvNWoyQjFIWDdiaUdySU9aZHhVdCsyZHg3?=
 =?utf-8?B?V25yR1FFSHVWTTY4R1FTb1JQeU81NUxRY3dYdlFuZmZaY2crSVdMOUt6RTRw?=
 =?utf-8?B?TENqRjVUd3lCdzZoTW1MbjdMdHVYZVBDN3ZXSEpxWnJmTm8wNkJLVVVDUytD?=
 =?utf-8?B?NGpWMm9oMnlrcXpKK1ZuYVpkaVpEWFEraHZ6citXV3pTUFpXMVNXRFUyclI4?=
 =?utf-8?B?Wk93bFJadDFacHlzMEtQM2Z1VEd5QXFsTTNyWjVQbVlHWFFuLzMwZ1VGVTd0?=
 =?utf-8?B?WmdnMndJMDdaVnVVUEFpYk1NQVBhOVhLWkMwRk4wQTlxdHlwQ1JPaE1hWUFJ?=
 =?utf-8?B?UStEdDhxZ3FJZkpMcElKVytCTFFEQk9RQ1Q0cS9ZMysxeE0zUGtqNi9Mb1Q5?=
 =?utf-8?B?TDA2VW53ZGdqcFgyajIycGI4aHpmRGdMRTBKUGdtVGpJeDZPVC9vMlFibloz?=
 =?utf-8?B?Z1ltbVFDUS9TZmRoZGNHalYxRy9kMzd6YS8vMFRjeFU5cWJKYVYvU2dGTGhZ?=
 =?utf-8?B?MjkwbG9rT0gyY296aFd1T0cwTU9NNkJudXAxb0ZMTVdtVktWaHVsQkZUandK?=
 =?utf-8?B?Q3dzdFBHQ2NOYWMvRHUyaWxtZUYrTy82YnNiaUtjT2xsVHNOb2FObDBFMjZ0?=
 =?utf-8?B?WDZrcGZscnl5QlFjbzlRakh2MjU2TFp0N1g0eFVPc2pCTFpyYzQ5NkpGaUpW?=
 =?utf-8?B?WHduaEtzcktWQUxoMUtQM3JDZnYwY2ZGalBnVmhudzBuejdEcHNTK3ZrdGM5?=
 =?utf-8?B?MDFUUTZjU1h2SWdIMktkSURGU2RTWnFuRU0zSGNJeVN6eVk1WE12NFNlUlY5?=
 =?utf-8?B?NUUzbHZUT1ZDNE5vMkN4bHUxNVAwNWJqdXY1cEI5dmp1NGxNTjM5eUlDUjdW?=
 =?utf-8?B?ZXdlNk9UTExLM0oxdmdhT2ZZTnlIbjJlZnE1Y0ZORU1tRm1qWmVtN25kNjNl?=
 =?utf-8?B?eWhMcnIzdHBMUDltNzhocFZ6azBQa3pISFNRemtWOFZ1bWc5TTczdTRhc3B6?=
 =?utf-8?B?OEtmT0JXTFhzZzFOaDdNRFFCb3FRR2NPclRNOUpKdDZYM1RBVDNMRlJ1VS9w?=
 =?utf-8?B?QnZhQmRMeXQzZnlKQ2kwcHNGRWp5UVJNZkVYc3kzTnJiUjVCa2czTngzV1Js?=
 =?utf-8?B?WFBJdUlZYitRbm1Zbm8vcUYxM05zQnBaVGg3a3JsSm5ERm5hb0JDTnoybTR6?=
 =?utf-8?B?d2k0MEdpZEI0aWRnR2IrQ3lzSFpLWWxlT0VnT3gwUXJlR0NWSWxQcFo4MWlX?=
 =?utf-8?B?c1BNT1o2ZEpNNFFxUnpsQmlIdjRDSlNIYndLVkRhaUxYL0hocm9lR0FPYmpS?=
 =?utf-8?B?bFkrb0orWjRzRWNLKzg5d3BraWhWTHY3aCsxUngreWJ0Z1U3VHRxK28xaFNF?=
 =?utf-8?B?MXRGRTkwWVpKT1VzZFU1aDZPM3RjYnJlYk5wUjd4UFg2UGNZMUxJeStzdWhF?=
 =?utf-8?Q?kzAjm/JpRGoUEE7nC9XplcC9rBiKl6GrXj5BXjY?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S3A4ZHNVM1BWZ1NaQzljNk1STW5uQ01COEMxYXU5d2locG55MEZTTzJmN2sw?=
 =?utf-8?B?eEhBMDFYQ0hTMXdyT0VSNmovZ2ZXQ1pkcGxXdVdEN0RNRGpwS1JTSFRVT2oy?=
 =?utf-8?B?U09iNmtaOVk4dERDVU5lZ0tLUFIxMFhvSzkybk5lZFEwRFQ3WkhBcGNTOFo5?=
 =?utf-8?B?TUxDeTRoWW8xcHZyTG01S0VjUjVPb2FYajRRd0plSkEzRXl4SGRuOW9DSER3?=
 =?utf-8?B?eG5KcER2SktaK3BkK1pBR0dzcDZWZ0RMMjRHYlJseHRyTUhTNkFENDA2L1dB?=
 =?utf-8?B?SnJwR2ZrNllFK1F4cEpyTU5hVVIzWTl1MUpSVVRRT1RBSzgwVkQvaDd1ZE9h?=
 =?utf-8?B?OTZsZlJoK3lzTjh6ZHcrVVdPSVR1a0E2VFRxM0ZiWTVIQWpub2wxR1VWMy9Z?=
 =?utf-8?B?NDljOWYvUGNIWDJ3ellhdmJURjEzbEdIOUNKQ0RxQmI5ZXdweHVpcGhHWTdV?=
 =?utf-8?B?c1hBRlVMT0NkeEt2SWJqeDFiaDNmY09uTTlKVUM2dUJmempSVlJpTWtQdEU2?=
 =?utf-8?B?c0lGcnVkRjJtdmd1VW0vWVlvMWtYdTdPYkJUZVBuQkFwajlORHBWcTVDT0Y4?=
 =?utf-8?B?RHloRDZRa3A5dExFbzA2V0xTaklHTitQYUhLZXZEYU5XWXRpd1B1UjBaTU9z?=
 =?utf-8?B?Q0NTSGRjeHdZTFVJQTE3UDlSbGtDbjQ4ZTVkREJHL1IxUElueTYydDlnMXpm?=
 =?utf-8?B?ZjU2SFA0OHI0eUdrbytiOEtqNFdWTG1rSUx6NWRpTnlvMVlMY3RVTWNPU0hC?=
 =?utf-8?B?K0FwYkdZWktRMmM5VkNjVFRoSkFyZzJHdFVEWEtwaWVYcHpOVWtIcXpnampE?=
 =?utf-8?B?UWMwOThsdytyQU1LQnkwR2xPRDkyaGJ6aHM1NktSTzdzVHFjSEk0WExqQVBO?=
 =?utf-8?B?SWZrM0ZBNU1NZ1FWa3Qya0FGRUVmRDRnTWdrbjVJRzVNa0xCNWprMjVUNEh3?=
 =?utf-8?B?dllaVy94cWhNeW1RV05ZMzBKN0g1NjRoWW9jUjc3cUV2cGVzNFlVaDhFQ3Jm?=
 =?utf-8?B?R1FOaVlYenVhcFRsdlZwald2QlZoZWRBS1hhQXdRTGFYRWlpcFg5VThGRk10?=
 =?utf-8?B?SWpIQk11aFpqNmxjMTA5Sy8vTGlpR2NSRXpwZDRDRDBCL0gzZU5oNFY1NTVw?=
 =?utf-8?B?dHY5S0N3QnhSZDVWWnZwSXc2V2JTR1pZKzhZU2Ryci9WT1FveEkvOHpGTkhR?=
 =?utf-8?B?SmNsc0NBOVhUSDUvR2NVZThhOUxkTDdnbnE0YTBQUXFCN1ZhWTNueStNUElh?=
 =?utf-8?B?TVFoQWJZcmRGQU1MUWR5Y3c0REJTdmp4NkVyeEY3VlJSR0pFckNoNXZzeC83?=
 =?utf-8?B?Z0pCL2dzWmx1QkZ0aUZsdE9LVExhM3VUSzArajlZMGc3aG41WGpmK0cvRG5v?=
 =?utf-8?B?aEtPNDFhdlVFNFhoUXEzSDVZWDB1Q280cFpmazk4YTR0QnZteStSTlJ5bHJZ?=
 =?utf-8?B?R2xYTjBSbUY4UVJFV3NwTWM2ei9LMnlUcHNPTTR5ZEN6MkV1VmE0bHZCVUYr?=
 =?utf-8?B?VTg2eFlldDFMTmlESHlUOGN0eGI0VWUyVTVaSm1icUsvRC85ajlTb3YzSVlM?=
 =?utf-8?B?aFlKVDFLUmJYMkNQSEVRdm9qd211b1ZBYURjRUxiQ2Z5UjJzZEtsNmFMS1k5?=
 =?utf-8?B?Nnd1RVdRL0M5aElQTmVYK1Yvd05GeTRrcW1uL2Z1eVpaaFBjU05ndkhJZS9j?=
 =?utf-8?B?VEY5MDRpOHh1Uk5OWlg5N3N5U0xNbGlWWFN3NE1oQ2RtSFVSTCtWNUNaMXg1?=
 =?utf-8?B?SDZneXF1aHdGUDd5SXF1VzdVa0JhWGxoT1g2Ym9wcGpmdFU1MG1KK3NkSWhv?=
 =?utf-8?B?Wnlib0R4amdxT1NUVTJESzl5RExRR3VPYWxjMzJQa2NsUTI0YUNldERQSi9M?=
 =?utf-8?B?YUpFMlpWUmJrZjVFZlRadTZhUlJ4TU9waDBTcG5ITFVpQ29kVnBVSk9BT0ti?=
 =?utf-8?B?ZEdHbWw5WVN5UEtnSlVKc2dnK3NuS3pXZU9Xc3Q2R1gzRDhrbVg5SW9JbGRk?=
 =?utf-8?B?bGo1ZUlPQ1A3WGhmWlc1bFN3RXg3ZFJ6OW5WTjZPak9oeVZUR3RZbjBteEU2?=
 =?utf-8?B?SjVqQ0FiKzNHOHYyQWVBVFQ4aEllU2hYN2JjcVVDb2RCdTJCMEh3ZU9yRCti?=
 =?utf-8?B?TGU2NXBCMk5Ua0VlZzFtdFRNNzlOZ1k4UVhkTmZZdnNsdGZ2TSsrS2NBT3Bm?=
 =?utf-8?B?dlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bd158f5-0511-401a-c634-08dd0a9482c6
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2024 01:25:12.3747 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2BB/IPjy5eQaK0RK0typdUE0x0iC7Zq1a8cXO00lbhkKSf3Fqr0HKjr7vMoDyddt6LJdoqnnm3bukjhaBNdTugtK/y9lB9YJSEg5v/JohmE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6268
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

On 11/21/2024 15:44, Matthew Brost wrote:
> On Thu, Nov 21, 2024 at 02:55:42PM -0800, John.C.Harrison@Intel.com wrote:
>> From: John Harrison <John.C.Harrison@Intel.com>
>>
>> There are now multiple places that can trigger a coredump. Some of
>> which can happen in parallel. There is already a check against
>> capturing multiple dumps sequentially, but without locking it doesn't
>> guarantee to work against concurrent dumps. And if two dumps do happen
>> in parallel, they can end up doing Bad Things such as one call stack
>> freeing the data the other call stack is still processing. Which leads
>> to a crashed kernel.
>>
>> Further, it is possible for the DRM timeout to expire and trigger a
>> free of the capture while a user is still reading that capture out
>> through sysfs. Again leading to dodgy pointer problems.
>>
>> So, add a mutext lock around the capture, read and free functions to
>> prevent inteference.
>>
>> v2: Swap tiny scope spin_lock for larger scope mutex and fix
>> kernel-doc comment (review feedback from Matthe Brost)
>>
>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_devcoredump.c       | 26 +++++++++++++++++++++--
>>   drivers/gpu/drm/xe/xe_devcoredump_types.h |  4 +++-
>>   2 files changed, 27 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
>> index dd48745a8a46..0621754ddfd2 100644
>> --- a/drivers/gpu/drm/xe/xe_devcoredump.c
>> +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
>> @@ -202,21 +202,29 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
>>   	if (!coredump)
>>   		return -ENODEV;
>>   
>> +	mutex_lock(&coredump->lock);
>> +
> I'll just explain my reclaim comment in the prior rev here.
>
> 'coredump->lock' is the path of reclaim as it can be called from the TDR
> which signals dma-fences. This is why most of the devcoredump core uses
> GFP_ATOMIC to capture smaller state which could lost quickly. We also
So the reason string allocation in patch #1 should also use GFP_ATOMIC 
rather than GFP_KERNEL?

> have worker, ss->work, which opportunisticly captures larger VM state /w
> GFP_KERNEL. The worker is not in the path reclaim. Thus you cannot flush
> the worker under 'coredump->lock' without getting potentail deadlocks.
> With proper annotations lockdep complain.
Okay, that makes sense now. Was forgetting the captures are from the TDR 
/ dma-fence paths which are reclaim requirements. Doh!

>
> e.g.
>
> We should do this on driver load:
>
> fs_reclaim_acquire();
> might_lock();
> fs_reclaim_recalim();
I assume this should be fs_reclaim_release()?

I see three separate instances of a local primelockdep() helper function 
to do this, two which do a might_lock() and one which does an actual 
lock/unlock (plus another which does a lock_map_acquire/release, but I 
assume that is very different). Plus another instance of the construct 
that is just inline with the rest of the init function. The helper 
versions all have a check against CONFIG_LOCKDEP but the unrolled 
version does not. Seems like we should have a generically accessible 
helper function for this? Maybe even as a wrapper around drmm_mutex_init 
itself? Although the xe_ggtt.c and xe_migrate.c copies are not using the 
drmm version of mutex init. Should they be?

John.

>
> Our upper layers should also but may have gaps. Reguardless, priming
> lockdep is a good practice and self-documenting.
>
>>   	ss = &coredump->snapshot;
>>   
>>   	/* Ensure delayed work is captured before continuing */
>>   	flush_work(&ss->work);
>>   
> So this is where the mutex should be locked.
>
>> -	if (!ss->read.buffer)
>> +	if (!ss->read.buffer) {
>> +		mutex_unlock(&coredump->lock);
>>   		return -ENODEV;
>> +	}
>>   
>> -	if (offset >= ss->read.size)
>> +	if (offset >= ss->read.size) {
>> +		mutex_unlock(&coredump->lock);
>>   		return 0;
>> +	}
>>   
>>   	byte_copied = count < ss->read.size - offset ? count :
>>   		ss->read.size - offset;
>>   	memcpy(buffer, ss->read.buffer + offset, byte_copied);
>>   
>> +	mutex_unlock(&coredump->lock);
>> +
>>   	return byte_copied;
>>   }
>>   
>> @@ -228,6 +236,8 @@ static void xe_devcoredump_free(void *data)
>>   	if (!data || !coredump_to_xe(coredump))
>>   		return;
>>   
>> +	mutex_lock(&coredump->lock);
>> +
>>   	cancel_work_sync(&coredump->snapshot.work);
>>   
> Likewise, lock the mutex here.
>
> Matt
>
>>   	xe_devcoredump_snapshot_free(&coredump->snapshot);
>> @@ -238,6 +248,8 @@ static void xe_devcoredump_free(void *data)
>>   	coredump->captured = false;
>>   	drm_info(&coredump_to_xe(coredump)->drm,
>>   		 "Xe device coredump has been deleted.\n");
>> +
>> +	mutex_unlock(&coredump->lock);
>>   }
>>   
>>   static void devcoredump_snapshot(struct xe_devcoredump *coredump,
>> @@ -312,8 +324,11 @@ void xe_devcoredump(struct xe_exec_queue *q, struct xe_sched_job *job, const cha
>>   	struct xe_devcoredump *coredump = &xe->devcoredump;
>>   	va_list varg;
>>   
>> +	mutex_lock(&coredump->lock);
>> +
>>   	if (coredump->captured) {
>>   		drm_dbg(&xe->drm, "Multiple hangs are occurring, but only the first snapshot was taken\n");
>> +		mutex_unlock(&coredump->lock);
>>   		return;
>>   	}
>>   
>> @@ -332,6 +347,7 @@ void xe_devcoredump(struct xe_exec_queue *q, struct xe_sched_job *job, const cha
>>   	dev_coredumpm_timeout(xe->drm.dev, THIS_MODULE, coredump, 0, GFP_KERNEL,
>>   			      xe_devcoredump_read, xe_devcoredump_free,
>>   			      XE_COREDUMP_TIMEOUT_JIFFIES);
>> +	mutex_unlock(&coredump->lock);
>>   }
>>   
>>   static void xe_driver_devcoredump_fini(void *arg)
>> @@ -343,6 +359,12 @@ static void xe_driver_devcoredump_fini(void *arg)
>>   
>>   int xe_devcoredump_init(struct xe_device *xe)
>>   {
>> +	int err;
>> +
>> +	err = drmm_mutex_init(&xe->drm, &xe->devcoredump.lock);
>> +	if (err)
>> +		return err;
>> +
>>   	return devm_add_action_or_reset(xe->drm.dev, xe_driver_devcoredump_fini, &xe->drm);
>>   }
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_devcoredump_types.h b/drivers/gpu/drm/xe/xe_devcoredump_types.h
>> index e6234e887102..1a1d16a96b2d 100644
>> --- a/drivers/gpu/drm/xe/xe_devcoredump_types.h
>> +++ b/drivers/gpu/drm/xe/xe_devcoredump_types.h
>> @@ -80,7 +80,9 @@ struct xe_devcoredump_snapshot {
>>    * for reading the information.
>>    */
>>   struct xe_devcoredump {
>> -	/** @captured: The snapshot of the first hang has already been taken. */
>> +	/** @lock: protects access to entire structure */
>> +	struct mutex lock;
>> +	/** @captured: The snapshot of the first hang has already been taken */
>>   	bool captured;
>>   	/** @snapshot: Snapshot is captured at time of the first crash */
>>   	struct xe_devcoredump_snapshot snapshot;
>> -- 
>> 2.47.0
>>

