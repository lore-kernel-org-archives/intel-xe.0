Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D454CD6E68
	for <intel-xe@archiver.kernel.org>; Thu,  4 Jun 2026 06:44:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C5B91126D8;
	Thu,  4 Jun 2026 06:44:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G8DGH1ww";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCD2B1126D8
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Jun 2026 06:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780555440; x=1812091440;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=uXlqtPRPGJqLSjKdOY6FSfO5Tm5iyLoXUopN7nfmoec=;
 b=G8DGH1ww+D4tlwapjZR3WuF91+EHGNHmU5qgj+JGGBin/tSq8Y52cMQu
 7yreitt9hXvXqKUDljF2Wskfxub/4vaGcjbDwh3QM6+5pKHXhvgz3TAxN
 JcYuv0Ul0hp8SvknhOMmvtXlt25Vqg9BGCuPFbd4JfImf1ZO2WEikewSd
 Z5cnoKcT1t0RxUeCP152v7xfFmbunzMESrs94k3M4RnebKvK+ZwTIZzLA
 WoRVTfZpU2vv3PkB+Fccw9MASIbaW82eGi/0gsahrA+we362cniXBg+Kb
 VkiaszlgMkmps9V/vEeXXbSVRR3agIp08pbCpNOrodeWmorhz/T2/V6Nd g==;
X-CSE-ConnectionGUID: 5x6C0woIRAaojkOuqKgRIQ==
X-CSE-MsgGUID: 8As+rsJISjeseqV6SxuqmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11806"; a="80517073"
X-IronPort-AV: E=Sophos;i="6.24,186,1774335600"; d="scan'208";a="80517073"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2026 23:43:59 -0700
X-CSE-ConnectionGUID: SwOn3Mu1TryWJTnfA5IMRw==
X-CSE-MsgGUID: WUEglCenQPaXJw76G8lZ4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,186,1774335600"; d="scan'208";a="274697038"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2026 23:43:59 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 3 Jun 2026 23:43:59 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 3 Jun 2026 23:43:59 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.21) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 3 Jun 2026 23:43:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nf4rA4vAWE8epuljK2OlpDRCVSfDsXCnHUZ6NGf8iRzxzjfEKVU/hIlszzUVeLLXuc2Fj7NrQB82uGslLyydvlTcJQbKbyeGAL13MpQxO9Zw8iBek4UJXhiJsl8bq+2eVq9+Jt31i5VBIOrhD6foNonyEymKKEsUXcKN+8ssULAQ/vjj3eWgyu+2wcQSNEw2mpsSMX9vXSwbN+I07aXWwE0DSvQxqJfzU+TXlfBnq93tmvQg5kJRRlmYrrq+wbsovNIo7N3XR07UJBp+ApcEp+LXuImCzOdbytT0hmH0SlcWx916BfXMeIJoBNPk/MMBAkbG82liPVB3x4oRbM+T0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y8xA8os3akcBr7Bln2F0saQ2qpk2cJvTNDhZUcZi5Ds=;
 b=vnvy5+CoBG5m4qn2Q+e0tzg5YMDQL7p9A3ztkUe8WrRjmnQDT9IIM1JQyCuD4eHN2MuhK4bzcM9Uez/9qY4ORkzPOxvjwBVAnl4gL8v6j1VPcGqfIggCj5mApcJHaO0TQONTZk1knplWTPaUoIOReXjCkdVPALizarDvQfvnB0sMRPUIobYhGBRwYjsL3rgGzrUb86CDZa4WFaNh79k7IsdYO0v7Z/mSUH8f7Ck/d5WGb0dbt1GGHNAPb869r0uIUDzN0XrqwwzAEPqsa84m5yaYFAJALymttzCLz6WVtW9wSrxT3CpzaGHb1G/XLCM1qiiMVl3TXf4XHEwwwM8M5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by SN7PR11MB6558.namprd11.prod.outlook.com
 (2603:10b6:806:26e::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Thu, 4 Jun 2026
 06:43:55 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::a3b:efa:42d5:e983]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::a3b:efa:42d5:e983%8]) with mapi id 15.21.0092.006; Thu, 4 Jun 2026
 06:43:55 +0000
Message-ID: <c25ad84a-0ce9-4a21-8d22-e06a8bc7138d@intel.com>
Date: Thu, 4 Jun 2026 12:13:47 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/xe: fix job timeout recovery for unstarted jobs
 and kernel queues
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matthew Auld <matthew.auld@intel.com>,
 Sanjay Yadav <sanjay.kumar.yadav@intel.com>
References: <20260603150059.157355-4-rodrigo.vivi@intel.com>
 <5f49eefd-a984-4d96-875a-87173a99a775@intel.com> <aiB5vKto1zWv9S8B@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <aiB5vKto1zWv9S8B@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0115.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a7::9) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|SN7PR11MB6558:EE_
X-MS-Office365-Filtering-Correlation-Id: 64f01a70-f86b-423e-0fb9-08dec204a634
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|18002099003|22082099003|6133799003|56012099006|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: BYwTUXIGsBjIDndriWbxy1ApAOe+wO0zVKjq6Sa1YbkNDGGrBAenPG5pLRi3gPWAhHQzt6HgNVPbnZyYK/hk2JmOqy0hQ0BmFZawGbrQqGr/5vZXz13QqSEa7FscZ7LimH7SUdyT/tXgSc5s+KbaXvKhq4+ZbLHEbQwd2z7s0WvmQz6QPf+YU4w4bcuDco9zRL+tt/qO5/3fP075Vf/H9sa5TSrLTI1XE4lHebvtzt1v4vY/zeXr/qxWAfCVoeV82jb5trDDBI3ctuZ8M6QnhwP+9WVYmSAATsuEJ8V8bMM5bbEK9NW4XJWxA+7OAdfURwlKqfbq+DqmVr1VDNlXFTHHgm7QwQ9C0NA0VKImTK5a9Mbn9u40U6bdlUYaKdJ+6T7XOvTz8cl8PZ03lHuyiANuCP+8kKmrMQSWxRIEvKmnXxX6riWPOgRBndzS9HamFi6IWR8EBRPcrqqfEFWnfwW5otIEL+TK2uOc7HMK9rutzwF2gGFt9lQsgeylQvva8dL0vrGY8+cBkscyByf6eynWtob8sk0p8/q1xcbdKPLnSXlmqEtD+P4zAEjepRyvSILRxJ+VAH5JR+jWwNwl/Dut7gaDvrII9VvPThwGBvMUzq/zWKuw9jyDHMP9n++uTIKLl2TM/775//3ziv+mTkSr2Y4UDKIlOBsT7W37ejYXoesJTyRY1zOcMLJYfVPq
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(18002099003)(22082099003)(6133799003)(56012099006)(4143699003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RkJUSndjV0kxWGIrbUJOdk1IdDJhZEN1Zll6Unh5b3RCd1JzMlZPNWZyY2w1?=
 =?utf-8?B?NTBRK282eElUVHhVMGUvaCs0Y1RqaU0rOTdQVEFtS3dIODhuS0tKbEc3dS9m?=
 =?utf-8?B?ZTNoK1dQYzdxMzhmYzZXckJBOHIreGtjN3paZnhBeUlGaU9idHJNeTBJSFZO?=
 =?utf-8?B?RjQ3RXUwTHNxdEJVQllDNkJMUEtGMU1pUEpsVlF1T3gxaEZOZGdlNWpQUXoy?=
 =?utf-8?B?Vm1xS25PbFd3NDhmYVJsRk00RXJ3SCt0L0t3Z1FCb2V5UWlOWisvaFZWcE1V?=
 =?utf-8?B?M1B3RUcyMlFLL0JacUdpYVgzOUhZdm13Zkg4Y3UvQmdzWXc2dERVUEswa2NX?=
 =?utf-8?B?SC9uZC96TXFRVGQ3L1pQK3hUZGRuMEtnekZoRzhQS3U4b3A2K09KQjdRcVBn?=
 =?utf-8?B?RG5XVGVTVGNhMTFTeDcwaE9LUktMN2ZTQU4vYS8wWk1DRHMreUxOQVU3K0gy?=
 =?utf-8?B?Y0FFSmN0N21MaVhucDhzS2EwL1JiRmhzZHp5K0ZXVllGL0lRZzQvQ2lnZ0hj?=
 =?utf-8?B?cHRSUWpjY1g4Ry9JTG5DTlFiMkE1MjBhbDhoTFoxOFZaZWZ3NzRZMFhBcmdz?=
 =?utf-8?B?U1ZuNkc3dzlaQkRyaWlwdnFZNEFkem1kVzRGbkxESGs4ZWg0eE9kSDRoaUdj?=
 =?utf-8?B?TXkxTkNBSzJFaGovdmJ1YzJJVk5WVTk2eGRqQU93UjJDdEJLQ0J4VEt4S3NS?=
 =?utf-8?B?czNpenhYQnRQVVE2VU8vbXBtNS9YOFp6T0V0SmJDY2dmK1JKQk52MkhBYVFW?=
 =?utf-8?B?dDhRTVR4SVhZK2tZNWFBK24zb05WVDlIOGNyTDFFa0N1UEx2a2F0RFVmVDBp?=
 =?utf-8?B?b1haQmZod2FzUVo5MkhXQ1ljbEp1UFVHV1VVd3VtS2VTWVVXOFZYMlNzYlR3?=
 =?utf-8?B?MUpvaVJ3eFBBUk9GRFNZdGt6dzZrNDBqQnZqNmVvY3ZEV0planlIZEdEZDlK?=
 =?utf-8?B?VDlTdXJielNWaEZZMzZIdlhYYWRlMW1ZN1hNSkZmTStZNTJZTVl6ditaUGJ2?=
 =?utf-8?B?a252eEpXQ1A5eit5dEZhbzZSaW1HVHhyOUZDeXNLbHZ3Q3dzQlQxM2VhN2F1?=
 =?utf-8?B?UG1Lb0ZKSVdYRHdzc2dUSWEydk1nYWtlK2xyQUl2NW0vMXkrSWk1Tks3YjFp?=
 =?utf-8?B?Zlk3aWtrR3dEY3BqZXJWZGsvN2dRN2dwSkNadU9kZHNORHducWY0YmpZU3RJ?=
 =?utf-8?B?WTd4SEhDQjJzY0Y5WXhnRi9BVkE1KzMySU9jM3BUSTBzd2k5NVRRaUhYVDdT?=
 =?utf-8?B?QWdITlJkdlVIMkZEZnVqVklkU3pvc3BKVmFIaDNzT0dSTzgzdEt1R1R5eXU5?=
 =?utf-8?B?bjhGeXBnd1NCY29wMTcvaDdxZ0hMeHoxZUx1VXk0dS96cmNHeHJMV2ZRL2dN?=
 =?utf-8?B?R3ZINmFsdW9CZWRtOWh6WlJBbGlsdSt4czBFM0RiUGtXRjlobmJkTlNtMVI0?=
 =?utf-8?B?Vi9ZODZwNnJNR2xhcStkQnZNSEt1RHBoT25qWGI0MHNTYkZ4U2pzaEExMDBF?=
 =?utf-8?B?T3JOZzNiNENmSGtpalRaVzRuYVBnc05CS2dadzVnSjFqc0ljYWYwa3p0N3Az?=
 =?utf-8?B?M1VrMjBMSG5uWUZUWHhUVmM3RGI5b1M5Nm5Gdm5IcWpFajdWREl3RnQrb2ts?=
 =?utf-8?B?d3VzM0JMeTJzNFRzbEgwdjhtZmJ4WHVYOVdlYWFScVF2QnF0cnZhYVVKZjhQ?=
 =?utf-8?B?NE0vK2pqT2VGWmJrSFV2VzVkOENZVFE2b0hpS3lvb05iOXlDUk5tbG9tVlRD?=
 =?utf-8?B?SGRSVEVDN3JhT05QSVBwOU5MS0JiVVhIOXFnbHozT1dIZU1jYlhoTGR6dkhE?=
 =?utf-8?B?NFkzTDk3cFE1L2Fsb051dzFLSlp2UWcvWU9aMkRzZHlNUFVzOGsyUTE4bUw0?=
 =?utf-8?B?aUpqWW0zS0ZMaG5YdXJtdkVBZ2RRRWVsci9QNjh4blAxbkZUMDI5cWtzWGdW?=
 =?utf-8?B?OEJtZklkWUVTRVptWnFyZFNZM1k3b2xsOFdEL0NZaXk2eG1vaEQ4SDFpU25a?=
 =?utf-8?B?MnA4aENqVHRRd3N6VzF4aHZJUjZFRFNmYmxCWElubnFCQm8wTDhMamU5a3Nk?=
 =?utf-8?B?dWN0VFdSeUZ5YTVBM21XcjRFaXZHL1AzR3JBMHlaUjk1WkVVdE43NDVzc1dB?=
 =?utf-8?B?QUZjVVRrRHNRcmhkNTQzKzlQUXB1RXlaZHhxNjRFRzA0OEVORWlYemJPajd2?=
 =?utf-8?B?VytQamw0MzBZa2ZncGpjYzRiVkc2Q1FEVm1ub3FDYVJ2a1hGcVVaQU56azdR?=
 =?utf-8?B?SFBxVEduWFZZUTZ6OCswS0psRUxuYmlrQXUzWm9YTEw0d3pDNlFsaXNUKzln?=
 =?utf-8?B?S1VrOWZoQjZvUmF4MzFhZmgwa0s1enZkN1dhRHN3Z0dMMEF1ODJadjVwcGZL?=
 =?utf-8?Q?SwnzBPgOoqDlocnU=3D?=
X-Exchange-RoutingPolicyChecked: HpC4Uhxu5t6OHF6+jHsvf0OtIWKEZxq2b8S1TJvhBPzPmIcAsrMAm9vnoTc6vXx4VsuFX2UC6ifSBRFYBCJy75c8PrOPUFqGhjO6XRNf357KTcfLc+QCmnZllZMyZohQpmOvHpEV6hL+4jgyqdngE0zSWGwd3YYth51XAi/2WsGqOGbqpB18FojOP/u/IZeQZmKQT1sqWfXwc5JG26YI5Q5+4OcfEWRhR267arzpjfJhBTzNH1GEblhkS4C0XKX5wQhCtrSF8PG9rVFv3godGXQxSuYrOAO3AJfOgaFXWN8xQ6VscnM5+TTMO3rWPP0lOo9Wrg8iAIi6pQNcHcVYnA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 64f01a70-f86b-423e-0fb9-08dec204a634
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2026 06:43:55.8621 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AeVcwc7UCVjm4k8ffI8f4Vk1485zjqX9sLmj9aCPqzWcTwk68xlf9sK/qVs/k594tfunr6gk8HmyJW6cvberEWMkk6jKT3Vv3/MsEbZK7io=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6558
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



On 04-06-2026 00:30, Rodrigo Vivi wrote:
> On Wed, Jun 03, 2026 at 10:01:39PM +0530, Ghimiray, Himal Prasad wrote:
>>
>>
>> On 03-06-2026 20:31, Rodrigo Vivi wrote:
>>> Jobs that GuC never scheduled were silently errored out instead of
>>> triggering a GT reset. Kernel jobs that exhaust all recovery attempts
>>> should wedge the device rather than silently fail, and userspace VM bind
>>> queues should stay permanently banned rather than being reset and retried.
>>>
>>> The queue is banned early in the timeout handler to signal the G2H
>>> scheduling-done handler so it wakes the disable-scheduling waiter; without
>>> it the waiter sleeps the full 5s timeout. For kernel queues the ban is
>>> cleared before rearming so that guc_exec_queue_start() can resubmit jobs
>>> after the GT reset — a banned queue would block resubmission and cause an
>>> infinite TDR loop.
>>>
>>> Cc: Matthew Auld <matthew.auld@intel.com>
>>> Cc: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
>>> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>>> Assisted-by: GitHub-Copilot:claude-sonnet-4.6
>>> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>> ---
>>>    drivers/gpu/drm/xe/xe_guc_submit.c | 31 +++++++++++++++++++++---------
>>>    1 file changed, 22 insertions(+), 9 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>>> index ab501513d806..bbccba367626 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
>>> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>>> @@ -158,6 +158,11 @@ static void set_exec_queue_banned(struct xe_exec_queue *q)
>>>    	atomic_or(EXEC_QUEUE_STATE_BANNED, &q->guc->state);
>>>    }
>>> +static void clear_exec_queue_banned(struct xe_exec_queue *q)
>>> +{
>>> +	atomic_andnot(EXEC_QUEUE_STATE_BANNED, &q->guc->state);
>>> +}
>>> +
>>>    static bool exec_queue_suspended(struct xe_exec_queue *q)
>>>    {
>>>    	return atomic_read(&q->guc->state) & EXEC_QUEUE_STATE_SUSPENDED;
>>> @@ -1376,7 +1381,8 @@ static bool check_timeout(struct xe_exec_queue *q, struct xe_sched_job *job)
>>>    			   xe_sched_job_seqno(job), xe_sched_job_lrc_seqno(job),
>>>    			   q->guc->id);
>>> -		return xe_sched_invalidate_job(job, 2);
>>> +		/* GuC never scheduled this job - let the caller trigger a GT reset. */
>>> +		return true;
>>
>>
>> Sounds sane. But Will also need clear_exec_queue_banned and GT Reset for
>> user execqueue, if job wasn't started. Below changes mark it only for
>> migration queues.
> 
> do you mean to have something like this below:
> 
>   if (!xe_sched_job_started(job)) {
>          clear_exec_queue_banned(q);
> 
> regardless of the type of the exec queue?


The logic looks reasonable — seems it also need GT reset and rearm
along with clear ban, if we intend to retry the never-started job?
Without GT reset the same condition that prevented GuC from scheduling
would likely persist.

> 
> 
>>
>> /Himal
>>
>>>    	}
>>>    	ctx_timestamp = lower_32_bits(xe_lrc_timestamp(q->lrc[0]));
>>> @@ -1622,19 +1628,26 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>>>    			       q->guc->id, q->flags);
>>>    	/*
>>> -	 * Kernel jobs should never fail, nor should VM jobs if they do
>>> -	 * somethings has gone wrong and the GT needs a reset
>>> +	 * Kernel jobs should never fail permanently. Attempt GT reset and
>>> +	 * resubmit; if karma is exhausted the hardware is unrecoverable so
>>> +	 * wedge the device.
>>> +	 *
>>> +	 * Userspace VM bind queues are banned permanently on timeout
>>> +.	 * No reset is attempted, the ban already
>>> +	 * signals the G2H handler, and the queue stays banned so the job
>>> +	 * errors out cleanly.
>>>    	 */
>>> -	xe_gt_WARN(q->gt, q->flags & EXEC_QUEUE_FLAG_KERNEL,
>>> -		   "Kernel-submitted job timed out\n");
>>> -	xe_gt_WARN(q->gt, q->flags & EXEC_QUEUE_FLAG_VM && !exec_queue_killed(q),
>>> -		   "VM job timed out on non-killed execqueue\n");
>>> -	if (!wedged && (q->flags & EXEC_QUEUE_FLAG_KERNEL ||
>>> -			(q->flags & EXEC_QUEUE_FLAG_VM && !exec_queue_killed(q)))) {
>>> +	if (!wedged && q->flags & EXEC_QUEUE_FLAG_KERNEL) {
>>>    		if (!xe_sched_invalidate_job(job, 2)) {
>>> +			clear_exec_queue_banned(q);
>>>    			xe_gt_reset_async(q->gt);
>>>    			goto rearm;
>>>    		}
>>> +		xe_gt_WARN(q->gt, true, "Kernel-submitted job timed out\n");
>>> +		xe_device_declare_wedged(gt_to_xe(q->gt));
>>> +	} else if (!wedged && q->flags & EXEC_QUEUE_FLAG_VM &&
>>> +		   !exec_queue_killed(q)) {
>>> +		xe_gt_WARN(q->gt, true, "VM job timed out on non-killed execqueue\n");
>>>    	}
>>>    	/* Mark all outstanding jobs as bad, thus completing them */
>>

