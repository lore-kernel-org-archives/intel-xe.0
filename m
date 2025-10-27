Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EB26CCF9E0
	for <intel-xe@archiver.kernel.org>; Mon, 27 Oct 2025 18:32:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 597C110E547;
	Mon, 27 Oct 2025 18:32:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z1t8gaT5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE5A310E547
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Oct 2025 18:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761589947; x=1793125947;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=GCYcKBo7RPg6fFpyNb4VmEQjxIkgo/2gG8ygN5+O1Lo=;
 b=Z1t8gaT5MINrDoLkNXM6s0Im/tOUSnyVdnkWZ4cu1kFwSHKYtaqYkh5F
 GkQoXC+82ZJMDr+l4APdvEQllsc+BhCIcKeVCYBm/9UOUP8z5FhWxLogL
 59pAz3YODJcGZEKHDmmxtqe0Zmo35VawZxwjGQJc7nKA4tLWGFkoG/+Uc
 z1Q2Iut3CcK3cO6UHWxv6cTALPan+kndXgjvEfM/uwyDqKBTULyXixfZ3
 bsUtz6g3+XoOv5jRQK1jbqC4qIo/DhZ7OE0N/ABVhNp0OcFsSaym2Y3wt
 ZRZAb5v3DjGTmWM6ATQtmpi17jo54WCW9uOl1+1KTPLTZMDV+pxub11dr A==;
X-CSE-ConnectionGUID: H+VFZsSXRdO2WVYpPtqRvQ==
X-CSE-MsgGUID: 4N9ud1l9S/eoDOeMyPu8KQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74355801"
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; d="scan'208";a="74355801"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 11:32:27 -0700
X-CSE-ConnectionGUID: GWVYvhumTz6JEAJBl8RjuA==
X-CSE-MsgGUID: 66PnU0t1QCa+9nxD8CrBgQ==
X-ExtLoop1: 1
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 11:32:26 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 11:32:26 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 27 Oct 2025 11:32:26 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.35) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 11:32:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UOzJisvCMSAlyK4g4d0EH8UX+JfAf5ZqljHeAfqRYOQnoTQqS8gewQchKeSTNVXs+hDe5DUgJWY/hZePHbOnDOpmkfFgTHV5qygR6yBwTQvAxfuEyBaM0yxjbDs7u5ceR3PLKPUn690p6IXJpy4icEMw0nz9pysqVQh++0oX7CxpPUuk+36H0mkTGJSmWAohBFlUHSyb+rDVkLr3u5SS6fCZexQ6s701hRrrkxXjUCckCUYVeKy0Xb21j3W61Px2GfEkPTUsbnzWHH35Apcefjvdmvz5GohaPNupV72/ridrtJMHQkfAHtaNRY0gVo85WLm87dduuRbFQG8WLRKExQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GCYcKBo7RPg6fFpyNb4VmEQjxIkgo/2gG8ygN5+O1Lo=;
 b=jgn7SOZxZ0+huJ54j4xfzJpOeUcQMmOFVmDr8ZMEuij5IQUgbIa5OSEu6ADBPZBo3pqUBOLlcLzpN14cbMqcBcMqoiprEw4tNl2pqWkZvLNYxM7pH3osPvel0eu/T97N2WNinrPzBWL13JA82ieUrNxcl+DyHnzENpjZ0KWilZFVkwXhITs6sepMSdEgN5M2ZM8JFA96dEivWspcQNWnSEEFnqGH1w8fPRwnmgqqJYA8PzGzYhfv3qfB5F8i3Uyct1hN/JtMW2BlFOKmD7e81bhFzFSFQNDZgTMuhXvRYXr6mQrGYvj52cJ6QMJQN4Ak28YC8aq+RCYyvqsrqPk71Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH0PR11MB4791.namprd11.prod.outlook.com (2603:10b6:510:43::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.15; Mon, 27 Oct
 2025 18:32:23 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 18:32:23 +0000
Date: Mon, 27 Oct 2025 13:32:21 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH 03/14] drm/xe/pf: Allow change PF and VFs EQ/PT using sysfs
Message-ID: <cod5hozbebmulv3gkzv7niuviuym4ij6vsxgdxo7fortfj3kha@2dgot6wkopj6>
References: <20251020182414.576-1-michal.wajdeczko@intel.com>
 <20251020182414.576-4-michal.wajdeczko@intel.com>
 <ztlryvb6mschuesh5k77i2ldehaa3ed7asriokgnqkajrxzcij@j6lezpryhquk>
 <fceef34b-0124-431d-98f1-fcf3149ae333@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fceef34b-0124-431d-98f1-fcf3149ae333@intel.com>
X-ClientProxiedBy: BYAPR03CA0007.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::20) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH0PR11MB4791:EE_
X-MS-Office365-Filtering-Correlation-Id: 71a12b4d-29e7-4a91-e5e6-08de15872be7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cGdvd1ZEaHZzVkw0Rm1jK0Z2VW1yZnFwWmU1WW1TK3BCakxXZ1pJWlRxcXpT?=
 =?utf-8?B?cHpOUU5nanFLNmdwSjdnL0xiMk00NTBpQXZxS1VMWTFWQVFaQys2cGxrbjQv?=
 =?utf-8?B?bDF2elc1VG9ncWYweU1FY095OUh4K1Voc1oycXh2enE1dzdoWVoyU09oRThO?=
 =?utf-8?B?dkJkWmdxbHZFRjBEOWdidGdNeDk0cDMybW1RRjlOMXZVbnRrMTFQR3p5OFpE?=
 =?utf-8?B?SUk2SU1VMy9JL1lDajhVU1A4MHRkRUo1U282WUVwakN3T1J6SXlzTkRhejBl?=
 =?utf-8?B?Y0tSQmZ1MVNrMDBNVUp1UjFHdE0zMFROejQ4eWd5dncxT2hUSmo0clNCT1o3?=
 =?utf-8?B?L1lqZWhzdzY2bitxYmJLSllXSlhwV3FoTGFQVzdzNXVraUdxMEtMQmMxZ1pK?=
 =?utf-8?B?Z1ZtWkx5UVBTM3dSNUVZOERJL0pZQyszY2gvMkF6WHZrc0lRRGNPNENETGx3?=
 =?utf-8?B?UTZQZW5wc2U2UVpLRkNPVzllbHhYNmFlZTVPZUl6ZkVtS2xQallYbUFwOHVF?=
 =?utf-8?B?Tld3U2lsWSsxUUVic1cxeW10Qm5LZkxoTm1IT1VKaU5PbW1TcHJ6N3hoYUxE?=
 =?utf-8?B?aTRxMjZKNmducnpjbnhaQWRQRFB0VURXdFdSWFUxc1J5TndoZmdPVnY5RHkz?=
 =?utf-8?B?OUFpWUtJRE5mOWl0OWthSjhDLy9wdnROUnQ4V0FTSTdPSlI3MUE5OTdsaVFq?=
 =?utf-8?B?bzdCZHVvSVVNTDdRK3dVK3NKYXhHL3NGUndFZThXbVVjRFYxREI4dERGb3J0?=
 =?utf-8?B?aXFaRlhENUx3VUlIS2tjVXJySmx6enpNZTRmS2FSM2I1ZmxnU1FVejJwNzJE?=
 =?utf-8?B?MFdUTTF6aEhEYVhWWk4rOFBTQklhWHloZDErRFV5dDVGT0ZlbGtlS2Z4citk?=
 =?utf-8?B?TUJCTjhJQ1U5TWFBMWxMK01wYzBmSWVuZGFRUUZ6MmhBWHJSY0pYSnJqa09y?=
 =?utf-8?B?cjZZbzVBYTRqMXpndzl5UjlqYVQvcWFXaGpZT0hEUW40TWROaWhFR0tCSDFm?=
 =?utf-8?B?K2s2eDZQUDVkOXJMdGVRb01CTG5uQ1YrZWplOVh4aTM0QzBPRlhWdmFKTFJy?=
 =?utf-8?B?c3IzUWFuRmdKR1RkbVJubllTVUhJMFBlMFM1QndiNHlMKzVUd2JsV1d4d0NH?=
 =?utf-8?B?ZFI2SktvTjZGZHlHemExSi9BWXJRWlJVbmpjeW91c0JUOWc5ZzFhWVczckRy?=
 =?utf-8?B?QVpDbzNLMS9RRmIxNWdOWkFNaVFRZUYyK0dIQ1NhZEtxeXdtVnNHZFp3K0FO?=
 =?utf-8?B?dHpuSjVFbzJlbGlEQW4xcU1yeDRYRjdVVnZGNzRvUDE0VzBzc3cza1dpSDNn?=
 =?utf-8?B?R0NiTVBnQi80OVhBMG0yZU80TzFmYlRMblhsUCtQOTBCSmp3ZnVFbDlKVFZD?=
 =?utf-8?B?N1FMbklTV2tiM1R4Yi9QTkRFbUQ3d1FtSVhmdk03V3ZuQlVPR0RBVUlUUmpS?=
 =?utf-8?B?YjRkdkJjdXdsUzZzQ1Q2NCtBM0xyZjVGV1RzbEZkU2IwZGRheTcxVlBnSkRO?=
 =?utf-8?B?bVBFbkNBZThIUDJzR2R5UzRTQTBtNDF4TU1UWUs2dlR5MG1hZEgvNGM5a25C?=
 =?utf-8?B?bGlsT0dyN3ZlMWppZkROQnBQVEJINFM2OS9Db2U5dEV4L1ZXelp2NzJFdEJM?=
 =?utf-8?B?bFNzdkNJMEkvc3I2RWFreko2d2Y0U2RVS3c1QWFEcmFnTTI0Y0dkVjRVM1RM?=
 =?utf-8?B?N1JWNjRYRGZoYlM0cWpac01BcDlFaWsvUGNjZkUvcUF1azZMMC9WakJwcUkx?=
 =?utf-8?B?Q1JlZm1obUZaM3NYakhzY2MyeXQyaVgxcVpqQUdST3UvL3VOWTlJL1NKV0pk?=
 =?utf-8?B?OVJWU0dKaEVqU0xqNjBhRlRSZUpHb0F3YXM3Qm9VY3d6M1EzaW5lbTRMamgv?=
 =?utf-8?B?MlltOC9TZG9GQWp6WWpyRC85aDZpTngvdGR3d0J5QmdzWStZKzFIb3ZSN0VK?=
 =?utf-8?Q?8jde3jHjfkE0HKZ4qFOHli8aC+gB5WKV?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K0NzektZRk1JRGhyemhnZ3I3c3BNK0NYYkt3QTZqb2FTUTNPYzlYck8wTlpG?=
 =?utf-8?B?YXVRWi9mSXM0T3FiT2NDZDdtWlAxM1pwQlFPVEJBZS9OTmU0Y2drYjZoeUI0?=
 =?utf-8?B?S1ZZQXBuSFp4N2pwd3o1ZWZGd1JKcGFxUVMzVWtudThkdk9JbWdzUUhpWGcr?=
 =?utf-8?B?UkhzRjNrWTNhNlhMNE1hVjVGM2JFZ1BUVkdVMjNZYm55eFBQUlh6bzFhRFlj?=
 =?utf-8?B?VUZIMm1FdUp4U1g4R2NhWFYraVpHLzJpbHh4RlEzbzNOSENub1ErS3VDTmJ3?=
 =?utf-8?B?c0NQcEdqYVlYTUFXNUUzS2RlNk5UbzVzZzdWbHFzY1FVM1A2bk5GRHhodFFv?=
 =?utf-8?B?TVh3eEpiL1ovd1VWYW1ucXJCSkVWenUvZVBvL3JKa09JamoxK2tKamxRZXlv?=
 =?utf-8?B?STE0NXUvVHhpMHlveTZpbzQvaERhb2JrRk04YmR0dlhkVHN3ZUIyQ1AvNEhO?=
 =?utf-8?B?eGUycjh0TW1mUVVPUXNOS2FoK0g4RldsRGdvNmNiRUFJSEdFZTZlYlYvS1U3?=
 =?utf-8?B?UGJiaXJzdittMHFNaXpiK29EUkUwekJhQjRPVWZHT1JGRlVBTnVGSkt0WXVx?=
 =?utf-8?B?ZzBEUjdJMlBkU0c5OXdBN0w4SUhqZTZiTHZaVUEyWnlqK1hYOThNbyttZk9o?=
 =?utf-8?B?TlpGVGRTVGtyM2tmaC9WMDZuQ0JHam8wUFc2STlPc042VUxVeTBOWUxpT0Z4?=
 =?utf-8?B?amhDcTNRK0NSS3VWNGx0ZlNyeDgydm0rclZ3UitYWE1CM3k1U0JIYVNSUXNn?=
 =?utf-8?B?a1RMNzNWVWhwQWVqYnpLd3E2OXB6cGQzTENYUWVpWlpMNWlmZVpDWk5OdHcy?=
 =?utf-8?B?ZzZrcm5xOTJ1anc2MHNGTkhWWjRiRW9jMENVaVAreWpjRStwTmNZQytnenVZ?=
 =?utf-8?B?K2tnQUdEUjhDd2NPWm8xSWRNalNxcEhGRDc4SG81ek5qZEgwVDdlVWRTQVpv?=
 =?utf-8?B?Wm55TmRQZjRzUWtLRk1kWVZZeXNrdG41KzZXelhLejg4dW1KOHdlUGtTd01s?=
 =?utf-8?B?WE9xWHpybGhWNThWUkhtSlFyUXl6ZVJCeDEvRVJzSENmREdLVFh4NDl5TWRm?=
 =?utf-8?B?Z2dqQ2xmWUc3QVd3cDE3cmEzdjJmcnY3MXQwcmJFUUpDTitTS2RWaHVMREp3?=
 =?utf-8?B?Mnk3K1dadW1KNnJ5YzhxR3g1Sk1XVHVEcUdkS3M5ZHlzYndBalpUVWMrcFYw?=
 =?utf-8?B?bE50MExIUm43UEdRWVdBWUlSUTh2dko4TlNuREtPYUtUSXUvdzhlazVGQysw?=
 =?utf-8?B?eVpKZkxabWNpeU5iWUJkTy9RVWN1K2d4dER3bkJYYjlCU2srOEY1bFcxVkNa?=
 =?utf-8?B?blp1NW9BUC9hYUNtM3E5SXRFUVYzMkZJNjV6NVZoT2x6Sk9XMTlrK3RCeHpq?=
 =?utf-8?B?Szc2WUFuODRZVWhCdzFhY2R3REl5eG5CQ2ZkQ2FzTXVwVVNiTHFTci9pZlZE?=
 =?utf-8?B?eXVFZFRCZ1ZZL2JQL2NDWGNLUE15dkIyTXVIbFh6OWdEOTMxNGpHaXFyUEh0?=
 =?utf-8?B?REN6ZUNCTlNSOHlVaGYrVVhHZUNtcmNSMHpsUjVMeGFZeXJkREg1MHlxOFBG?=
 =?utf-8?B?NXFPVlFoQk9RTy9lTFU5U21kVjJsM2plNDhLc3pDbkVtbEhUcHNLeVVraU9Y?=
 =?utf-8?B?dnhRS3c2MjZuZnZJOGwzSE5ZZ0M4V1ZZV2RoM0cvT3ozMHpWcTM0dzhmdnRr?=
 =?utf-8?B?WXFOSmhKMDlrTVZsTXdtSFI1ZzNCbUxUVW45L3EvSVFPMkZ4NWVTY0JiV1dO?=
 =?utf-8?B?ZTB1ajFlbEIvQ2w3UkZHSzVRdG5iVUhTdUFTdjJ5d2FYdGZyRVk1WTZEOFk4?=
 =?utf-8?B?ZFhpSncrbG0ydklYd2hWbWxncHZRU0hFOUtSRHV2bnZFck1iVTBRT2lMNmNk?=
 =?utf-8?B?NWpjeTlhM096dGN3Zk5rbFJVOUJhNlNEajR1TXU5MXNqMm5laUFDNnRyNjZL?=
 =?utf-8?B?LzRsVHRXSEF1R21wQ3pwcGVQMkxIRGxsUWJoWWZiSXI5NCtFS1hOeC9ZVGlv?=
 =?utf-8?B?aWdKbzJSOWhjaE01VEoydkhNQzdKMGI3azNRUXlrQXZESnhzd0s1UjlTOXJv?=
 =?utf-8?B?ZHdYUG9uNnBOeGNUK1M2VVY2cXRLcENodmZnSFlMOCtEUlBaSGJFQXhHR0o4?=
 =?utf-8?B?cXlYdzNvK0NrdW9BZ3QvWGFJSy9UN1E3R1A5WTYwQWhyaTZYV08rWWRySVdx?=
 =?utf-8?B?REE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 71a12b4d-29e7-4a91-e5e6-08de15872be7
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 18:32:23.6191 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yaGpV13N+4417OhplFtBJ8phYH9sZmMH2M0ClPyAIVYLOEKupaw0VqBEKZWQl5VPrdsxiVzJ4If54UDY4S/o8g3whkIYEOXzTlR+e0PCnhU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4791
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

On Mon, Oct 27, 2025 at 07:09:07PM +0100, Michal Wajdeczko wrote:
>
>
>On 10/27/2025 6:27 PM, Lucas De Marchi wrote:
>> On Mon, Oct 20, 2025 at 08:24:03PM +0200, Michal Wajdeczko wrote:
>>> On current platforms, in SR-IOV virtualization, the GPU is shared
>>> between VFs on the time-slice basis. The 'execution quantum' (EQ)
>>> and 'preemption timeout' (PT) are two main scheduling parameters
>>> that could be set individually per each VF.
>>>
>>> Add EQ/PT read-write attributes for the PF and all VFs.
>>>
>>> By exposing those two parameters over sysfs, the admin can change
>>> their default values (infinity) and let the GuC scheduler enforce
>>> that settings.
>>>
>>> /sys/bus/pci/drivers/xe/BDF/
>>> ├── sriov_admin/
>>>     ├── pf/
>>>     │   └── profile
>>>     │       ├── exec_quantum_ms    [RW] unsigned integer
>>>     │       └── preempt_timeout_us    [RW] unsigned integer
>>>     ├── vf1/
>>>     │   └── profile
>>>     │       ├── exec_quantum_ms    [RW] unsigned integer
>>>     │       └── preempt_timeout_us    [RW] unsigned integer
>>>
>>> Writing 0 to these files will set infinity EQ/PT for the VF on all
>>> tiles/GTs. This is a default value. Writing non-zero integers to
>>> these files will change EQ/PT to new value (in their respective
>>> units: msec or usec).
>>>
>>> Reading from these files will return EQ/PT as previously set on
>>> all tiles/GTs. In case of inconsistent values detected, due to
>>> errors or low-level configuration done using debugfs, -EUCLEAN
>>> error will be returned.
>>>
>>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>> ---
>>> drivers/gpu/drm/xe/xe_sriov_pf_provision.c | 116 +++++++++++++++++++++
>>> drivers/gpu/drm/xe/xe_sriov_pf_provision.h |   8 ++
>>> drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c     |  54 +++++++++-
>>> 3 files changed, 176 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_provision.c b/drivers/gpu/drm/xe/xe_sriov_pf_provision.c
>>> index 663fb0c045e9..f2e14103c9aa 100644
>>> --- a/drivers/gpu/drm/xe/xe_sriov_pf_provision.c
>>> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_provision.c
>>> @@ -152,3 +152,119 @@ int xe_sriov_pf_provision_set_mode(struct xe_device *xe, enum xe_sriov_provision
>>>     xe->sriov.pf.provision.mode = mode;
>>>     return 0;
>>> }
>>> +
>>> +/**
>>> + * xe_sriov_pf_provision_apply_vf_eq() - Change VF's execution quantum.
>>> + * @xe: the PF &xe_device
>>> + * @vfid: the VF identifier
>>> + * @eq: execution quantum in [ms] to set
>>> + *
>>> + * Change VF's execution quantum (EQ) provisioning on all tiles/GTs.
>>> + *
>>> + * This function can only be called on PF.
>>> + *
>>> + * Return: 0 on success or a negative error code on failure.
>>> + */
>>> +int xe_sriov_pf_provision_apply_vf_eq(struct xe_device *xe, unsigned int vfid, u32 eq)
>>> +{
>>> +    struct xe_gt *gt;
>>> +    unsigned int id;
>>> +    int result = 0;
>>> +    int err;
>>> +
>>> +    for_each_gt(gt, xe, id) {
>>> +        err = xe_gt_sriov_pf_config_set_exec_quantum(gt, vfid, eq);
>>
>>
>> I find it weird that a race on multiple writes would basically give
>> undeterministic results for the device. We are locking/releaseing
>> xe_gt_sriov_pf_master_mutex on the gt, but shouldn't we syncronize
>> multiple writes at the device level?
>
>but we still expose more granular attributes over debugfs, so even if
>we would be successful in this protected round here, the actual
>configuration could became "unclean" soon anyway, so I'm not sure there
>is any benefit trying to add this extra protection
>
>>
>>> +        result = result ?: err;
>>> +    }
>>> +
>>> +    return result;
>>> +}
>>> +
>>> +/**
>>> + * xe_sriov_pf_provision_query_vf_eq() - Query VF's execution quantum.
>>> + * @xe: the PF &xe_device
>>> + * @vfid: the VF identifier
>>> + * @eq: placeholder for the returned execution quantum in [ms]
>>> + *
>>> + * Query VF's execution quantum (EQ) provisioning from all tiles/GTs.
>>> + * If values across tiles/GTs are inconsistent then -EUCLEAN error will be returned.
>>
>> or if you had multiple userspace components trying to set the value
>> creating the race above.
>
>yes, this "inconsistency" can be mostly introduced by the userspace and
>concurrency / race is not only sysfs vs sysfs but also sysfs vs debugfs

right, but the point is that a normal (non-developer, production) user
shouldn't be messing with our debugfs. At that point, the only
concurrency is sysfs vs sysfs.

Lucas De Marchi

>
>>
>> Lucas De Marchi
>
