Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52BA2CCA471
	for <intel-xe@archiver.kernel.org>; Fri,  3 Oct 2025 16:09:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04B2610E949;
	Fri,  3 Oct 2025 16:09:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EIHzLshB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FFDD10E944
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Oct 2025 16:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759507762; x=1791043762;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=Yorlj9iq+AonIAr1jLaSCsTLm4YyDXzAl4NRcxmEsaI=;
 b=EIHzLshBW+vGRQeY5XcXSQ+bBOQXlVDnL5zejhtPIyQH6UXtuqmevKbQ
 avybVSs2oAfeW7uBi0DhCh6rO7dMaOA0hg/HrxYmCBmSQM0mMts72i6Jq
 YrcYT7hJJ75ZO7yqA7IvSWHBwO/zJF9Fn5rGaeRtblqhLJwroBJoV568u
 Q7DwqbfmYiEWGi1AFpbovPmaU7UtO/jEORS4A9KUVVDcNIoAPhg7DFW3Q
 ZFqQRYuUnlH1Ba9wwemHPsbxWEZl/g5w0yavoFks1ztzzaWqWfHNqLA6K
 FheSrbG0nYmqBlpFYlxTDmDPYhDZHx0WhmRAzu/H3TFPWLkNGzIsdRfKJ w==;
X-CSE-ConnectionGUID: 7xnJ+LpkSCijJuADEZu8Dg==
X-CSE-MsgGUID: 56RHEbJMQO+NHcTnQF+Kmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11571"; a="72039489"
X-IronPort-AV: E=Sophos;i="6.18,313,1751266800"; d="scan'208";a="72039489"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2025 09:09:21 -0700
X-CSE-ConnectionGUID: qKs8YpeaRrKUBRryYAJShQ==
X-CSE-MsgGUID: ckVmOCKDS7aNaTzVSxkupA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,313,1751266800"; d="scan'208";a="179129183"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2025 09:09:21 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 3 Oct 2025 09:09:20 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 3 Oct 2025 09:09:20 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.26) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 3 Oct 2025 09:09:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P3tSj8cO5ESdNUERuS2d3hWVd128QuJvz2izlp+ioTK7+y960IkjabYW3crxE392PaST1H0O/22UokgCb5/6/vmtR1kwjpH46YGNUm6qy0XAgNbtrElZhHhGseAwgSBvKhZtgIU7KIMVDxFd4C8zhlsmzRh6oINSi+pfn11vYYoO3jti+Xoek6EZPX9ncO8FFuUuSpybYY94rGJI8p7j57NJL4MNw7DbgFp0cPhGTKfqtliKd7qSNJoUAGQTXC4jd+XUsqfvmpQFjE6Ny6e95kKFRqxsAJqqMWEOaLKvKMYQ9sGHFKVQpOPd0v/FqHrHfLjr0Ly6nrwJ248oMD00aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BrUM8mQ2nZsGQoy9rdiNZEg+9X/FIY2PlSW8KwZBjEk=;
 b=OI8M9+svMOiOeAaIcXVV1pxqUBkbU/BqwTE6jy77BclMIv5/mFO98uFQ025wmE24jHj9fVmejLKnJOigNmJtjtWeI/ufWsqLDHb/GEJQlxVYg2ShEh4q84eVF81HJc8XYv4/UPlltMQfX3lYT1mmfNlt+jo5gNKblsmKS9brj8tly2EsCYAlQghYs3CmHWp6+6KFcWqbyspOeev0HVNenwQvwO2znAH9QDSXcelQpsQkCGeFQREZGGmQ7B0PKlqw+j7wPVYKo4Lm11wDEgVG51r+evBRXWAPnnrj5lQ9+xjWshzYXq5PMxeBULDCfr/cTL9HeGaBq8H0X5MPqXWsCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9226.namprd11.prod.outlook.com (2603:10b6:208:574::13)
 by DM3PPF5EA507B64.namprd11.prod.outlook.com (2603:10b6:f:fc00::f25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.14; Fri, 3 Oct
 2025 16:09:14 +0000
Received: from IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09]) by IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09%6]) with mapi id 15.20.9137.018; Fri, 3 Oct 2025
 16:09:14 +0000
Message-ID: <056ae3c4-20ee-4ade-8888-0458d49e416c@intel.com>
Date: Fri, 3 Oct 2025 18:09:10 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 17/34] drm/xe/vf: Don't allow GT reset to be queued
 during VF post migration recovery
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20251002055402.1865880-1-matthew.brost@intel.com>
 <20251002055402.1865880-18-matthew.brost@intel.com>
Content-Language: en-US
From: "Lis, Tomasz" <tomasz.lis@intel.com>
In-Reply-To: <20251002055402.1865880-18-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA0P291CA0006.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::18) To IA3PR11MB9226.namprd11.prod.outlook.com
 (2603:10b6:208:574::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9226:EE_|DM3PPF5EA507B64:EE_
X-MS-Office365-Filtering-Correlation-Id: 95359a55-8a8e-46f7-8eec-08de0297320c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MHZHTFhXT29zdDhXOFJKekVPZmRwZHR3eU5YUVo1WVp2YTlGMlRHTkVWV1Y1?=
 =?utf-8?B?Z21LM0drR1dVdEhMVFNVTGVJQnpYbUQzWTl6RXNieFd3NFRXRUZMK2llcmRv?=
 =?utf-8?B?MExMVlRpdGlKVXlQVGNSVEtkb3c1eU56eGp5cVhHTlFwQXN5QXdmYjhFY1Yz?=
 =?utf-8?B?V1k5V2VacUc0MWdaMUpLclRIZnJrcFphKzZnK2JmWkpDUjVXb05uYTB4UjRO?=
 =?utf-8?B?REowT1lXU3JaQmJsZWdWc2wyd2FqN1hKT3R4UFczMTFKeVNvS3JxNHJreE5a?=
 =?utf-8?B?SWxobTl4VG1BYzNLYjJoV0Q0ejVXdnBsb21aUWhuQU9OcUZCalVwZ3I0TDNj?=
 =?utf-8?B?ODgxK2R4b3VnVk1NWmxzR2pteVlTZGduNHBLMVlneWtjcmJFNktLYkVlTnRM?=
 =?utf-8?B?TDBuZy9IcE5WVlNSWGpwa3RCcWJsK2lwTUFkc2IyN1FaQ1pBY01UYXpWQTlw?=
 =?utf-8?B?MVZCSE9DNmE0U0NtOXAvc3dKQk40ekwxNVJZVlYramoxZGJNUHN5eTU3SkFj?=
 =?utf-8?B?ajJ2TkRSS0hOanNQMTVXYUJQdHByYkVES2FtQjJOcmJFUGdpdTZEMFp5SzVv?=
 =?utf-8?B?eGIxeFg2Q2p6dEo1NWdvZ2x4R0ZmQnBSUHhTNFRjVFVOam5pYncxZm5IRGov?=
 =?utf-8?B?M0JhRUFmeGZuMDlUYUFjeXAzYlNPN2Fqb2U1d2UrT2dGc2xpOWVoM1RyVlh6?=
 =?utf-8?B?NC8weGJ4cmlmQ0pyaGRDbzF2S2lxQ0p0ZC9GUWxhZmRKenBFd2dsS1pIUGlZ?=
 =?utf-8?B?dE5pNDRvUktSU3FnbmE0U1RrOVovTFM3WldPY2xlZWtGOUpFUmlOaFJRMXZ4?=
 =?utf-8?B?aWtzdzUvSGsvRU94MHFXR1I1YzgyWmhVbmFJS01STlZTRTM1cjd3Rjcvcjk2?=
 =?utf-8?B?cURiNTBtcEo1TzUxWGRpMk42NFp5VFc0L0Z1UHNLTjFuWGFDSFJqeUtUSTZn?=
 =?utf-8?B?bjQ1QlJqTG9OdC9DUkE2UmdRcUtuZDAxbTlDdUJPR0MxYzZtQ1lFVUQ3MmJC?=
 =?utf-8?B?LzdsWkIzeFpnaXJtOXJQR2pGK2xQVDRoYVZpa00vY2tYdUt1anppVGQxVjRs?=
 =?utf-8?B?RG9ML0dMdnBSUWhwNkRIL2JRVEliYXRpK2pMZGhoUFBKT0ViOUIxZndadkxy?=
 =?utf-8?B?WHZwUWNGTHhaOUJtUk9uaHJuSHhyUHZjekZNQ3hGWE10K1VyeVQ0Yzljb0xR?=
 =?utf-8?B?bjVRTGFCWkVJcTlWL21OTkdXSkxvZTM5QTlEQWRtT01Oc2gvN1lzNW1IN2sz?=
 =?utf-8?B?YTJpR0ZLRnptWnlxY3I3MjlDc3pselVlUHFITzJBZ29qODRyVlQ0SHpXcTd6?=
 =?utf-8?B?dWNaSjN3dy9aYVZVTWxGVjh2ZlRIUEVSWnFwMjZlLzFQUURlbjlIQU9HMzMv?=
 =?utf-8?B?TnJYY0RFWWpTb2Y4dXh3WTN1UzQ2WGtxOVI3d0xtY3FGck1DU0RUa2lOcWZv?=
 =?utf-8?B?Y1M1M0JncDJEdVdFR3VVSWRQK1NraGphSzFYUjFsTkdCamQxN2xGWEIvRWVU?=
 =?utf-8?B?QWVrb2M0ZHJ1YVpTOVI2aFVtVjVQejN2Q3VKb0owRklHWVlnQTlFM2RTWUlK?=
 =?utf-8?B?Q0pjZTZXckJoRUlPL3EvR1BXUjF4VWJCdjd6dHFROFlnbWlHbmJmR2J5QlNh?=
 =?utf-8?B?U1BGRnpQZlczanBzcmdjc3NBRmRRM0JMSHFia25KNXU5VzYxam1ZNUxrQWYy?=
 =?utf-8?B?SWg0NjZrMml4QVlUQ09wbVNsK3FpK0RsazNXTXh6TDFFOGtYREtSZXR1YXJW?=
 =?utf-8?B?TkJvSXh0Z29nNlE0dkVSajdTRHoyelFoQ3hpR0x0SnJ5VHZpY2Foak1rTGIv?=
 =?utf-8?B?UXRzbitSTTBINEFDSXlkSU1IV2k3NUhUODZ2bFRMQWM3VUhWM1ZCRGdWZDVi?=
 =?utf-8?B?N1NWRUJwbXJzZGdMTjc2bUZoa1NQSDdZUFdRZ1p1OXcxbWxtVFBUL3RFS0ly?=
 =?utf-8?Q?wxUZh/QLgYTQtqe5pPQaWhWae1lxol3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9226.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Qkl6STJKR3A3c0dHbE9rNzNIbWwyemhjaEFvTldRT2hHN0dKVmRER0ljK24w?=
 =?utf-8?B?YkFlclFSWUF2UE1pbXFHVVhDV05EYVh3WFBUV3ptajZFNEVHTndldkpuVGxY?=
 =?utf-8?B?ZnFITURFb3pRS2hEbXZUT0w4b0ZDcHg2T1AvTlJaUEdIM2ttRGR4aFhJUENR?=
 =?utf-8?B?MVVLWTJGdHNRVFd5N3BLUUw4UUZFL3o2TG1oTTA5ZE1OZUltWFl5ZVBrQ1ly?=
 =?utf-8?B?YWdQT2VLRlRvRXZsSU04ZHpiT1hYNHFQLzhZOTNJMC9RL055dldGVTVCa1E4?=
 =?utf-8?B?blAva0tGZWgzS1doU2lKR1JQcVFxWjMxdGRicmdYM3RFdWdpYWx0Wk9ycnAy?=
 =?utf-8?B?bE4xL0JmOWo2czRmYWJ0OEowMEIyUXZPd1BJVlZxTlorNmtJSDBFRzRSY1hT?=
 =?utf-8?B?V1JOaWlKWCtjQUpQNEZKcnBlTjh4MisreEx5V2V1cHlRcVpWR0lNeEpJZFQy?=
 =?utf-8?B?dkhXS2c2YmZleW1udnZWZVE5NEdPWXlXVytieEJMb0pkcWQ2YVJYWVFpTGdI?=
 =?utf-8?B?aFJHSVFBNTRNUnd0eWp5RHo0MW85ZFJ2Z0hDbS9jc1ZQaU1GWUJGWmZQdGh0?=
 =?utf-8?B?ZGthM2hvditLMjJKc0dBWDVnMjUyZlg1ZVp1KzFlUmFLZk5oZm5TVGpNZFFP?=
 =?utf-8?B?cE85cTdOSWVFTXhHcG1HaERmRHltejV5KzhoOU44UlVEL1dFb0lUQVhJbnZw?=
 =?utf-8?B?UUxwWUh6NkdLVlVJMmdHNGxyYTN4bFdXbVhycnZXdWI5b3lTbDlGait4c29a?=
 =?utf-8?B?ZVVmQUxGRnRxY0V1YjZtNy9ITTdzK2ZCT01PYXVJNGp5Rnl6ZUZQdFVlL1Na?=
 =?utf-8?B?SWMrazhKdWNGMzlzcVVVbk52TmRmS2poSkVNSjlaS1RqZ3Fyak9BNjM0ZGox?=
 =?utf-8?B?QUZOZXk3YTdJVGY0YXFJdlhtM01NZ1NFbWZhOHo2c2xGYjlPeGY3WGNnTXhG?=
 =?utf-8?B?VU1Na0N4VzkwUmlJMlc4OGRCM2QwalJOSlJPWnpCWE8rTnpyL2RFWVdNMU1h?=
 =?utf-8?B?d2xJSFB4bVB6OGVmV0Z4aDZ0aXR5V0F6b1JLZmtTRTJrTVpGYTBSN1A5YmZn?=
 =?utf-8?B?cytGMHhFbFlwd0tRMThEM1N0L2JKaWpLOGdmOGNoWlZFV3ExSUhWTzRPUFJk?=
 =?utf-8?B?M3ZqV3ZISzNaTmg1alNzZk9rRW5iZVJiT25zOVFlb3VXMGNQcmNJcW9aaXFh?=
 =?utf-8?B?dGRKYnZnTksyaFQyOS9PSmpRTHVzZmVFK2ljQzE3OUY4S3VMa0FZUHBvM0hx?=
 =?utf-8?B?U0NaWUZnVXY1Yy9ydUVwMXpUTldkQVNTN3ZZSTBaZVAwTE8xRWk5T3J6SmRs?=
 =?utf-8?B?bko3b0x2WEwzQXhFcGVHY0lPcjZmbThCa0lyUnlqU2VUUkhpVncrY01lOWlD?=
 =?utf-8?B?ckpYZlg4UUdRcS9mZDEzSzUwbnlSVGRyQjdsM2tELzF0Z3poNnN2cGpCMkxN?=
 =?utf-8?B?WGo4a3MrdkMwZlZzaTUwVWQ5SThzMkY5WnN5SVJ5bVJCdThkRGh4Zjk3d1Rj?=
 =?utf-8?B?RU9qYi9ER2NpQ1lCOHdzSUxxWEllbGNYY3A5bW5wK2VTWUdlY0tzUE0zeFcx?=
 =?utf-8?B?bktFNWhlZ3hVaHNGVTFyTTNKQTk4cXNURmViQW04d1Z2NG1qR2ZPaGMxNm40?=
 =?utf-8?B?dEx3dE41TFFFNzMrK3dFSHl2K2VoYkhENHdzdkgxN2ZYYkhsR3dPOVRleC82?=
 =?utf-8?B?elhvV0JDQTdlZ2dWMXJpNDJjWGZ4d2N6NytkcDZZcllHeUtQUjNCWVFMVjBX?=
 =?utf-8?B?MndGWUFXVGM3dW5TcEplemZlSFAxSitxZEs2QjdZMHBmUGEvRXpCUWpIcCtn?=
 =?utf-8?B?SWJ3NTQ2MWxFZmE0Z2x6NnpvTEcyMEJwazN2TTZhcHNhMzY5MzJYbnpOaWVa?=
 =?utf-8?B?Q1BvOHRWK0E2NkdNYWliVmRXcmN5MTdrYzN5Z0thdTVQbE1mTDVxc3NkV29Y?=
 =?utf-8?B?TXdjTDFlYWlqdTdGUUJLKzd0VzBkSzNqUjY3bnpGemVpQjc3WGZzQUxSRWg1?=
 =?utf-8?B?cCtUdFVETHBMUGorNTlYaGpzamd3WkZoeUlRd3hwYUR3WEJ5b1JrNVB5eVc0?=
 =?utf-8?B?WXo5bHNtRXFIaUR3NEJNNG1YUVVWOHAvUmVqbm83OU8xekN6UEtMbmNkRzlr?=
 =?utf-8?Q?k4+8PMuk407RBLts9AW93Y+ub?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 95359a55-8a8e-46f7-8eec-08de0297320c
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9226.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2025 16:09:13.9766 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 15GcGKq5683Hhw+UB1pT21K7MRsNRysEelQMqqHJh42MmINgF98kv5PBc8WVZg5QMqIKKZTSx3epeu8XdmX/yw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF5EA507B64
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


On 10/2/2025 7:53 AM, Matthew Brost wrote:
> With well-behaved software, a GT reset should never occur, nor should it
> happen during VF post-migration recovery. If it does, trigger a warning
> but suppress the GT reset, as VF post-migration recovery is expected to
> bring the VF back to a working state.
>
> v3:
>   - Better commit message (Tomasz)

Reviewed-by: Tomasz Lis <tomasz.lis@intel.com>

-Tomasz

>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_gt.c          |  9 -------
>   drivers/gpu/drm/xe/xe_gt_sriov_vf.c |  7 -----
>   drivers/gpu/drm/xe/xe_guc_submit.c  | 41 +++--------------------------
>   drivers/gpu/drm/xe/xe_guc_submit.h  |  3 ---
>   4 files changed, 4 insertions(+), 56 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 82be38c99205..5f04d562604b 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -815,11 +815,6 @@ static int do_gt_restart(struct xe_gt *gt)
>   	return 0;
>   }
>   
> -static int gt_wait_reset_unblock(struct xe_gt *gt)
> -{
> -	return xe_guc_wait_reset_unblock(&gt->uc.guc);
> -}
> -
>   static int gt_reset(struct xe_gt *gt)
>   {
>   	unsigned int fw_ref;
> @@ -834,10 +829,6 @@ static int gt_reset(struct xe_gt *gt)
>   
>   	xe_gt_info(gt, "reset started\n");
>   
> -	err = gt_wait_reset_unblock(gt);
> -	if (!err)
> -		xe_gt_warn(gt, "reset block failed to get lifted");
> -
>   	xe_pm_runtime_get(gt_to_xe(gt));
>   
>   	if (xe_fault_inject_gt_reset()) {
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> index 85a5678463fa..6ba8b5703ff2 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -1101,17 +1101,11 @@ void xe_gt_sriov_vf_print_version(struct xe_gt *gt, struct drm_printer *p)
>   
>   static void vf_post_migration_shutdown(struct xe_gt *gt)
>   {
> -	int ret = 0;
> -
>   	spin_lock_irq(&gt->sriov.vf.migration.lock);
>   	gt->sriov.vf.migration.recovery_queued = false;
>   	spin_unlock_irq(&gt->sriov.vf.migration.lock);
>   
>   	xe_guc_submit_pause(&gt->uc.guc);
> -	ret |= xe_guc_submit_reset_block(&gt->uc.guc);
> -
> -	if (ret)
> -		xe_gt_sriov_info(gt, "migration recovery encountered ongoing reset\n");
>   }
>   
>   static size_t post_migration_scratch_size(struct xe_device *xe)
> @@ -1145,7 +1139,6 @@ static void vf_post_migration_kickstart(struct xe_gt *gt)
>   	 */
>   	xe_irq_resume(gt_to_xe(gt));
>   
> -	xe_guc_submit_reset_unblock(&gt->uc.guc);
>   	xe_guc_submit_unpause(&gt->uc.guc);
>   }
>   
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index cd5e506527fe..b82976f031e5 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -27,6 +27,7 @@
>   #include "xe_gt.h"
>   #include "xe_gt_clock.h"
>   #include "xe_gt_printk.h"
> +#include "xe_gt_sriov_vf.h"
>   #include "xe_guc.h"
>   #include "xe_guc_capture.h"
>   #include "xe_guc_ct.h"
> @@ -2182,47 +2183,13 @@ static void guc_exec_queue_stop(struct xe_guc *guc, struct xe_exec_queue *q)
>   	}
>   }
>   
> -/**
> - * xe_guc_submit_reset_block - Disallow reset calls on given GuC.
> - * @guc: the &xe_guc struct instance
> - */
> -int xe_guc_submit_reset_block(struct xe_guc *guc)
> -{
> -	return atomic_fetch_or(1, &guc->submission_state.reset_blocked);
> -}
> -
> -/**
> - * xe_guc_submit_reset_unblock - Allow back reset calls on given GuC.
> - * @guc: the &xe_guc struct instance
> - */
> -void xe_guc_submit_reset_unblock(struct xe_guc *guc)
> -{
> -	atomic_set_release(&guc->submission_state.reset_blocked, 0);
> -	wake_up_all(&guc->ct.wq);
> -}
> -
> -static int guc_submit_reset_is_blocked(struct xe_guc *guc)
> -{
> -	return atomic_read_acquire(&guc->submission_state.reset_blocked);
> -}
> -
> -/* Maximum time of blocking reset */
> -#define RESET_BLOCK_PERIOD_MAX (HZ * 5)
> -
> -/**
> - * xe_guc_wait_reset_unblock - Wait until reset blocking flag is lifted, or timeout.
> - * @guc: the &xe_guc struct instance
> - */
> -int xe_guc_wait_reset_unblock(struct xe_guc *guc)
> -{
> -	return wait_event_timeout(guc->ct.wq,
> -				  !guc_submit_reset_is_blocked(guc), RESET_BLOCK_PERIOD_MAX);
> -}
> -
>   int xe_guc_submit_reset_prepare(struct xe_guc *guc)
>   {
>   	int ret;
>   
> +	if (WARN_ON_ONCE(xe_gt_sriov_vf_recovery_inprogress(guc_to_gt(guc))))
> +		return 0;
> +
>   	if (!guc->submission_state.initialized)
>   		return 0;
>   
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h b/drivers/gpu/drm/xe/xe_guc_submit.h
> index 5b4a0a6fd818..f535fe3895e5 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.h
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.h
> @@ -22,9 +22,6 @@ void xe_guc_submit_stop(struct xe_guc *guc);
>   int xe_guc_submit_start(struct xe_guc *guc);
>   void xe_guc_submit_pause(struct xe_guc *guc);
>   void xe_guc_submit_unpause(struct xe_guc *guc);
> -int xe_guc_submit_reset_block(struct xe_guc *guc);
> -void xe_guc_submit_reset_unblock(struct xe_guc *guc);
> -int xe_guc_wait_reset_unblock(struct xe_guc *guc);
>   void xe_guc_submit_wedge(struct xe_guc *guc);
>   
>   int xe_guc_read_stopped(struct xe_guc *guc);
