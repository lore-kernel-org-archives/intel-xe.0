Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEA77C83F1A
	for <intel-xe@archiver.kernel.org>; Mon, 14 Jul 2025 23:26:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9097310E0C2;
	Mon, 14 Jul 2025 23:26:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SImk48pr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0658110E0C2
 for <intel-xe@lists.freedesktop.org>; Mon, 14 Jul 2025 23:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752535612; x=1784071612;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=hA+5hwRPp1SWj7/Afs3qQKhP1DOueKyfIvD3ttt/T3o=;
 b=SImk48prrcDCRceCuapBqUuFAOeLchAA/Jr6a1VPhdZaweuihRaopGCc
 vgnEozf1shmsGuna5zVgEzxN4OYfaVbjzNzJ5nNdp0SNK0q1D1Veqd7Nt
 0ar+TUMh2wHbXKXMkys+vPtHfhDshL1EtbCdDv88f9poK/cNYVZHTVead
 dfFRf2olcFGzF3OlL53Ccd2wRNi1cv/AjNnO4fmEkhdLaRBH1KdyPntYH
 3uhpz8Sg7IEnNVo+TVU9cMgOiHUvWvFkkpzinS6e7y84SEV154Qo2cCU5
 VWXA1lRn3Dyv3QCQ8gU9n6edUK6GY9rtUmuAVToMSoyanwdDZlEZatH38 A==;
X-CSE-ConnectionGUID: sbfyo8nPR8CzfW6VB5hTmg==
X-CSE-MsgGUID: JFMbQfP3TUuDS0SBJXinBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="54713758"
X-IronPort-AV: E=Sophos;i="6.16,312,1744095600"; d="scan'208";a="54713758"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2025 16:26:49 -0700
X-CSE-ConnectionGUID: 9CXat09oQwGoepD9Rg4UlQ==
X-CSE-MsgGUID: q4DeJwxsTXObSgkBX25Zow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,312,1744095600"; d="scan'208";a="188060651"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2025 16:26:48 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 14 Jul 2025 16:26:47 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 14 Jul 2025 16:26:47 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.79) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 14 Jul 2025 16:26:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=utMBrQ300Zzx3f+tAs8NXXGhep6Ga2XqlmPKPDemggXaoSU9kwYsSePc03qSIqsnSIQ63mt3UtJYqvNCcfI5uvdMgm4htnQ0XBx+LpJ1KFAl4QQxhrJpZUOhwc/cFpOVfFgsec4fetwrRS4td6rKkwLkbTcEZa0Aq5DwgitekdAgB7goVcUnft9vDxv/6sr9t94V26XadqQDHQSd+ORuiITTYiHZ/po18BzkC4rUV7XJP4RDom6JbYK3pnhrFYt6Rx/c4QN2dhkrgJWYv+GLeaSZG6n7h9TP2cbX76DNG9bBUFTKX9DblCpTxwfZ2/nqHyER9GeLg3kkbPGMM3gtxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DmDr8kIwpQ4pmdJiKD7IAIMZpj0odJO512DZe3sq0XU=;
 b=YGhMoYtabrzLdcJgwcuOuxF1mcMnh+a2OrVhmQKKQZohRnFA0wmr6/+iwCXO3TF128Znveccwsfd3HjZse+p2mYkXBZpQkfhYsTbr8GAS7VzjW1vzhjGZMLriRVc3YsnLFALHqdBU7pJiW//70f1CnWFO+xTnZE2xfh+zc8mmrxlBUuW5vBDAueaUTXt94fPkImDiGUxBw0TB4F6zkVAWQtgHh/I/3H6BJHJoWA86A7eG5g1CKRODP9SbK/ySNHfQjItMPjO3O6TNaImlJXV0ISJBvzYKr+kMThl3ZGzaHo/TJCa8YE6QrhqOFxR8PG01cgei90XRUVD9LdbbDsMOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by LV2PR11MB6072.namprd11.prod.outlook.com (2603:10b6:408:176::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.32; Mon, 14 Jul
 2025 23:26:03 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%5]) with mapi id 15.20.8922.025; Mon, 14 Jul 2025
 23:26:03 +0000
Message-ID: <a7cd8b36-20c4-413b-8c1e-a7d3ac9fa197@intel.com>
Date: Mon, 14 Jul 2025 19:26:00 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/6] drm/xe/guc: Add new debugfs entry for lfd format
 output
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20250423215821.3078428-1-zhanjun.dong@intel.com>
 <20250423215821.3078428-4-zhanjun.dong@intel.com>
 <64c95a41-a6e0-4a9a-b266-bbb44a632581@intel.com>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <64c95a41-a6e0-4a9a-b266-bbb44a632581@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4P223CA0027.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::32) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|LV2PR11MB6072:EE_
X-MS-Office365-Filtering-Correlation-Id: 7385fcaa-0c3c-493c-1c3f-08ddc32dcce2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eUV6bUVSVTBCdFBRWHRFUElVcEJOdjhmVVMvM0Ywd2lkUGowcS9DTDNsWmY2?=
 =?utf-8?B?TjZBbkU5a0FQY1J0SzVHTG5SSWJxQUZORnJ0bHlrekFBVUxXTHF0YnFNWXov?=
 =?utf-8?B?VnNhTlRDNEFsTERqYng2MUZnRUFWbmh3RkFFM0huNUdSTFlhbmZGeEcvV283?=
 =?utf-8?B?eDNRL0cySGtjaEhhZjJnaTlmeXloSXFPQlREdEpMUnlXWDRPSFpaVGh5dDBP?=
 =?utf-8?B?Y2YwYVIzanQrV2ZPcFFpbXNSd2NSdUlubGI1R044U2xzY3owVGpzUHF5UUgw?=
 =?utf-8?B?WXk0dGxqeloyaUVWOURrclhtc2V2Q1Y0NHJzTWlDZi9xWVZ2dEFnRFNSamdr?=
 =?utf-8?B?dmZheXdVNGxoRVZUUktVanNuMzFJK2w2NlRPWmwrQ0tIa3lmS1FFTDF5MmI5?=
 =?utf-8?B?NE9ZY2hwY1RqejI5ZTBOTEJkcHViZ1BFQllOVE5oeGJGMzlFUTY1M05FcnVR?=
 =?utf-8?B?R0VXM3ZGVllDTE5TWENKNEdZY1VrNDZpNmh1Umw0Qm0wNXdtRXRUNm53Q1Rr?=
 =?utf-8?B?YjAyV3ROTzFpcVZmNXE3L1ZnN0FrcXpyalpJbWpOVVdvdUk2Nm5zWUZSN3lK?=
 =?utf-8?B?Z1AwQkNpSWNlKzJpbEFHU2paYngzR1ZSUVpSMVpoa1Vja3VuOEZaQkNMSXlJ?=
 =?utf-8?B?VTdCNEVDS3BYMk04SGhKZ2xKRXJzOXlIekZ2RmZheHVJT2toQXBzL01TR1pl?=
 =?utf-8?B?K1pLN0V6U0dJdXV4UXExSStVRk9ocXNRcXdsUXhyN0JFeHdndlc1SGtydWY5?=
 =?utf-8?B?VWFaYTRFOVhJb3hEam45eVVhN2JKYy9oRndiYzFoZjl0NDU5Qm1uNkMxVitH?=
 =?utf-8?B?L0VESWhoUGowdVZtdysyYlpBSzFtNGxmUyt6TmRXZnY5TDBEMWwwdmtGd2p1?=
 =?utf-8?B?a1EzVDV1T0lEa2ZKVDRDcnR4V0d1QmlYeVBEbE9MVXlRNnpxeC9RSlorbFV6?=
 =?utf-8?B?bkpRbmc2R0ZFM2d6YzlXSUoxdW5HQXJkUmJTSlFWSGdLbm5EV0dlOUh5TTZW?=
 =?utf-8?B?cVRzUy96Z1NURVhrSWtUZnVFbGNER1grZTZOd0JDaHZsYWZoS3Y5RGZaVWtT?=
 =?utf-8?B?KzVzOFhwOVJPZTh4a1BhcktZOVNxaVR0RUtSTi95V1l6L1dpK3pvY3dEOGt4?=
 =?utf-8?B?NkpWVDNvYzcxaFhFUHJ3dy9UaEMrM1dra3ZSMFdxaXBKZ2kvNTd1NEtjWHFR?=
 =?utf-8?B?SzE0YU1JQ0dGTitweE45STJNOTRVdUI2NHFUNUEwZmYvL1RVMG1WU29QVWlu?=
 =?utf-8?B?ZjEwZVd1dSthMnhBdUgyckpPdytFWnIwckdxYmYvcTBqRHNGS2NkSWcrVzdq?=
 =?utf-8?B?NndjYXRqT05oTmVXdUZsRkZNK1RTYnRTdTZ2L3dSQ3cxdHIxMHBIdTB4S0Rr?=
 =?utf-8?B?cEZobGNDVWFWOVV5a1libldMUFhUMWdUY1ByejdpYSt1M1ZQU0lISmZtQytV?=
 =?utf-8?B?WFQ4NjI0ejVicy92VkZQVHZWbXdPeFlaNEpEbHBncE81ZGkyZkhnQjlJN1Br?=
 =?utf-8?B?Vy9oZFlqOTNVU1haMkdnL0tnMTU2SFp0MjBpQWpNQTk5bFNQOGo4aG8xVWpQ?=
 =?utf-8?B?eGhyTzRkRnhWMzYzUElFVFhyRzhjZDNNTmVHam53eVRGVDlmREY5U3lYWWtX?=
 =?utf-8?B?Uy9ob2d0TXliUW9BdHVVTFJob1hmKzVKT2lxNnd1QjE4cUJNYUU2ZmN5cUkv?=
 =?utf-8?B?T2c4dU1WWE9YY2RJbndlbVd3KzRGb3oreTBOYmxodk1meFlkUDdWcU9ONTFB?=
 =?utf-8?B?UTFDcUtOeVN5bVhpdDBIUnJOanV6SjlKNEhoR3JpcStmdGJsKzBnbVlxVXVy?=
 =?utf-8?B?cHllYndDNCtEMzl5ZWdscjg5bUhobUJqdFI1bmN1R0dXdUZsT1FaRmtJd1ZO?=
 =?utf-8?B?bFVRUEpxV0k4bGo5bzNzL2xTU3d2RVlrRnhyaExZQ1gyeHc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bTZlSXZ1SUtkK3Blam9SdVFTKzJDTEtTRkhocHl2aU1nL0JabVBMd3ZMem5r?=
 =?utf-8?B?K2NmKzgrcXQrRWtiTlYwckU2VzQ1L25oaHhZd1BhRTRXZmI5LzVncU0rdi9l?=
 =?utf-8?B?YWhTYWd4T1BrYzlzcWVLMVlzZUNSNDRGMENIVk51RkE1ZGNqT09hUHA5TDhq?=
 =?utf-8?B?Y1crZU1wcWRwOGFyTE9YYUJwQWJRK1pCeEpLWmRQeC9vMTJnL3hSY1NIc1I4?=
 =?utf-8?B?SlY0bE4vaDRaRWY0R3hIREcvSWFzWHJBeFNDNFdQNU1xOFdoNTl5U2lOSDJO?=
 =?utf-8?B?bDB0OHdseHlRMWx6VStCYkRzUlVTMGxUZlJ1ajk5eW9qZDduQ0hza1d6Mmp5?=
 =?utf-8?B?UVA0Lzk0Q3JjYzdueXEyQmYvbmlZNExQYTlzZVlmUEt5R3pPcWMyU0tnNjRj?=
 =?utf-8?B?ZzdwWm1RTzlHUXlSMTI1eVozb3IxTUJKL1VocTVodnFrYUhKSldEdjhPWlBN?=
 =?utf-8?B?Vlg0VWNWc0tPZDNUdmYxY2hpNVRDUUN6MllFQUNObTJtNG1QdGNtRDIrTm5F?=
 =?utf-8?B?b3FYV2F0RGJkMkZjK2tCUFJONnVFV2IySUVoSVk1N2M0Q3BaOFJDaStoUXpX?=
 =?utf-8?B?TG1keHdDblU3WnNjZkE4QW9adHNLWmFTa0RRTmd0L3pKdFMvbm9KMVR4eitE?=
 =?utf-8?B?YkM0bEhsQnNoTlBSU25VdGpFRmp5QkxFWVk5djBKQkR5dDBYbm5hSWdWdUxV?=
 =?utf-8?B?bk5Ub2FMSVNYeGRXQ3ExSTdyVGt5Y1ZzSjgvOTdtVWJaSEFxMXdKa3c2cVB4?=
 =?utf-8?B?eVcxNTBlWVZiekxrbEphK0FOUXpDUXREVDJjeXZYWTJxbStmWEdycEVNbHZF?=
 =?utf-8?B?Z2kxOWJWQzBnMWMwT2kxK2FEY2k5M0tvekEyZHhnb2xKY1hNRnBWWnNTWEhr?=
 =?utf-8?B?QXQ0eGlTWThPcm1qbHNLalNPeWkxVW9lenhVVU9sbU93WEdVbnNic3hQVDNm?=
 =?utf-8?B?V1RHRjBDeWdGaHlEYkRNallaQnVZUzVwYnlKZ3BjZVBBRGFBQ0U4NFhIa0pN?=
 =?utf-8?B?M0tiM3RtaTBQNS9CRU9FOExrZUw0ZjZJTHVuNlFmSnpRQVY5R2dvTGlIbnRX?=
 =?utf-8?B?a29TTkxuYzFMRnd1WlUzckpnRnlaTURLTUI5VndpelBvUFNUQWs2Y3doc2Zy?=
 =?utf-8?B?STlnemJCNWZ0TkJHZlI4RHQrODhMZXdoMTVmY3daMlNWbERvSGkxYVVPUEhz?=
 =?utf-8?B?YTltZkVLRDNDS1RrRktxQ2FBcnBJMFU5VHUyK1JrZStSWFdMUDFRelVVK1Fk?=
 =?utf-8?B?K2J4WTRIZ2hJazRJUnlVNlE3SHlPU3hhdjh3dEJ0ZFcxcHRxNGR2ekZHVG5m?=
 =?utf-8?B?NDZQSkpnREsvdnVmRkdpNkhMcno3NzBEbTRuZjQ3eXFUZXp5emxQSDZBMy9X?=
 =?utf-8?B?K2htVDEycGI2L3JDWlo0M2FXU2ZydUdKbzFRZW43Zk42dGdHdTFiQnplb1dO?=
 =?utf-8?B?VExuUUx2RGhTam5MejIrTGRVeVZWeW8yMjNCdUcrSm9PcVh0cVA2b0NDR1B0?=
 =?utf-8?B?QjQrR0dRYXZXTGYwQTBmSkRzNjhSMklYa2wzOGxGbmVnc3gzay9KUnZEUjdP?=
 =?utf-8?B?aFFGRmxVYXQ3ZWV4a3BTdGhvbDlWZDdIUFc1UC9paGwwOU4vRk9EeWprQVRP?=
 =?utf-8?B?bGhEcXBRa0JZOUlvUy9QSUx2eWYySFBBNDBMeC80QWtWaEx3TCsrcjlydzlv?=
 =?utf-8?B?S1Z2clRnN2tzdUo5a3haVnZtVjJ5VEpVb3MzWWw1NHJ0T2hiZVUxSG5kOVFR?=
 =?utf-8?B?NkVRRnkyd2JYYUNyQURxU2FPWmRKdDMxM2d6Wk1Pd2FnSDJudHJ0V1pHMk5L?=
 =?utf-8?B?NFZtN2M0OTNiNlR6Z1htbkx0OWR0TDJ4NldZMHVnR2x5cDJLMHl5MVc0Tzda?=
 =?utf-8?B?L1l5RjFKNWVUUnNmZW1qVSs0S2o1aVpjbEExZ3NKc2ttR0VxVHoycmNqbGND?=
 =?utf-8?B?UEdEbkZHaE42UHo5ZGVlMlh0Qm9uRkFVcGl2S1NIT21xQ01QUENlUERFVlVi?=
 =?utf-8?B?KzNscXNwWjIvbWxIN0tmc2szVXFWdVlLS1lqQ21oZHdiVjBmbEJia2hEQk5j?=
 =?utf-8?B?Sm5FaXp0U1dNZkErSlVvYUl1MURjVzlybDhwUFFZSGx5Rml2cWNBbWI2MXhI?=
 =?utf-8?B?dHZDU1B1NHFUU0JjdUJjMGhEQUJhNG0xWksxZExrRExtMWswKzEwVkl1MC8z?=
 =?utf-8?B?WVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7385fcaa-0c3c-493c-1c3f-08ddc32dcce2
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2025 23:26:03.5954 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3ZCmrEEOl6boEsYuC8vf+AbvinvDV9h4lyfiVD1kdRwq6FqQr659dVl5WbuIQV1l/RQ7TU+3hJ8dkQGJP2MHKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB6072
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

Please see my comments inline below.

Regards,
Zhanjun Dong

On 2025-06-28 9:06 a.m., Michal Wajdeczko wrote:
> 
> 
> On 23.04.2025 23:58, Zhanjun Dong wrote:
>> Add new debugfs entry "guc_log_lfd", prepared for output guc log
>> in LFD(Log Format Descriptors) format.
>>
>> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_guc_debugfs.c |  7 ++++
>>   drivers/gpu/drm/xe/xe_guc_log.c     | 52 +++++++++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_guc_log.h     |  1 +
>>   3 files changed, 60 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_debugfs.c b/drivers/gpu/drm/xe/xe_guc_debugfs.c
>> index f33013f8a0f3..a441c5775ca3 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_debugfs.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_debugfs.c
>> @@ -85,6 +85,12 @@ static int guc_log(struct xe_guc *guc, struct drm_printer *p)
>>   	return 0;
>>   }
>>   
>> +static int guc_log_lfd(struct xe_guc *guc, struct drm_printer *p)
>> +{
>> +	xe_guc_log_print_lfd(&guc->log, p);
>> +	return 0;
>> +}
>> +
>>   static int guc_log_dmesg(struct xe_guc *guc, struct drm_printer *p)
>>   {
>>   	xe_guc_log_print_dmesg(&guc->log);
>> @@ -116,6 +122,7 @@ static const struct drm_info_list vf_safe_debugfs_list[] = {
>>   /* everything else should be added here */
>>   static const struct drm_info_list pf_only_debugfs_list[] = {
>>   	{ "guc_log", .show = guc_debugfs_show, .data = guc_log },
>> +	{ "guc_log_lfd", .show = guc_debugfs_show, .data = guc_log_lfd },
>>   	{ "guc_log_dmesg", .show = guc_debugfs_show, .data = guc_log_dmesg },
>>   	{ "guc_pc", .show = guc_debugfs_show, .data = guc_pc },
>>   };
>> diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
>> index 38039c411387..e362e407f6d5 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_log.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_log.c
>> @@ -9,6 +9,7 @@
>>   
>>   #include <drm/drm_managed.h>
>>   
>> +#include "abi/guc_log_lfd_abi.h"
>>   #include "regs/xe_guc_regs.h"
>>   #include "xe_bo.h"
>>   #include "xe_devcoredump.h"
>> @@ -19,6 +20,14 @@
>>   #include "xe_mmio.h"
>>   #include "xe_module.h"
>>   
>> +static const struct guc_logfile_header default_guc_logfile_header = {
>> +	.magic = LFD_DRIVER_KEY_STREAMING,
>> +	.version.dw0 = FIELD_PREP_CONST(GUC_LOGFILE_FMT_VER_MINOR_VERSION,
>> +					GUC_LOG_FILE_FORMAT_VERSION_MINOR) |
>> +		       FIELD_PREP_CONST(GUC_LOGFILE_FMT_VER_MAJOR_VERSION,
>> +					GUC_LOG_FILE_FORMAT_VERSION_MAJOR)
>> +};
>> +
>>   static struct xe_guc *
>>   log_to_guc(struct xe_guc_log *log)
>>   {
>> @@ -216,6 +225,35 @@ void xe_guc_log_snapshot_print(struct xe_guc_log_snapshot *snapshot, struct drm_
>>   	}
>>   }
>>   
>> +static void
>> +xe_guc_log_snapshot_print_lfd(struct xe_guc_log_snapshot *snapshot, struct drm_printer *p,
>> +			      struct xe_guc_log *log)
> 
> 'log' - unused ?
to be removed>
>> +{
>> +	char *lfd_buf;
>> +	int index;
> 
> size_t or drop it completely
> 
>> +
>> +	if (!snapshot || !snapshot->size)
>> +		return;
>> +
>> +	/* Alloc lfd buffer in fixed size */
> 
> s/lfd/LFD to be consistent with your comment below
> 
>> +	lfd_buf = kzalloc(GUC_LOG_CHUNK_SIZE, GFP_KERNEL);
>> +	if (!lfd_buf) {
>> +		index = -ENOMEM;
>> +		goto lfd_out;
> 
> just exit here?
Although for ENOMEM there is no need for free memory, we still need to 
print \n>
>> +	}
>> +
>> +	/* Fill LFD file header */
>> +	memcpy(lfd_buf, &default_guc_logfile_header, sizeof(default_guc_logfile_header));
> 
> hmm, why exactly we need to copy this ?
> can't we just print directly from default_guc_logfile_header ?
Yes we can>
> and what's the goal of printing just empty lfd buffer?
> add some explanation in the commit message
This patch is to add the debugfs entry, detailed LFD segements to be 
filled in next patch. Will add more details.>
>> +	index = offsetof(struct guc_logfile_header, lfd_stream);
>> +	xe_print_blob_ascii85(p, "[LOG].data", 0, lfd_buf, 0, (size_t)index);
>> +
>> +lfd_out:
>> +	drm_printf(p, "\n");
>> +	if (index < 0)
>> +		drm_printf(p, "ERROR: Out of memory\n");
> 
> shouldn't this be in some common format, like:
> 
> 	"[LOG].error = %pe", ERR_PTR(-ENOMEM)
Good point, will do>
>> +	kfree(lfd_buf);
>> +}
>> +
>>   /**
>>    * xe_guc_log_print_dmesg - dump a copy of the GuC log to dmesg
>>    * @log: GuC log structure
>> @@ -251,6 +289,20 @@ void xe_guc_log_print(struct xe_guc_log *log, struct drm_printer *p)
>>   	xe_guc_log_snapshot_free(snapshot);
>>   }
>>   
>> +/**
>> + * xe_guc_log_print_lfd - dump a copy of the GuC log to some useful location
>> + * @log: GuC log structure
>> + * @p: the printer object to output to
>> + */
>> +void xe_guc_log_print_lfd(struct xe_guc_log *log, struct drm_printer *p)
>> +{
>> +	struct xe_guc_log_snapshot *snapshot;
>> +
>> +	snapshot = xe_guc_log_snapshot_capture(log, false);
>> +	xe_guc_log_snapshot_print_lfd(snapshot, p, log);
>> +	xe_guc_log_snapshot_free(snapshot);
>> +}
>> +
>>   int xe_guc_log_init(struct xe_guc_log *log)
>>   {
>>   	struct xe_device *xe = log_to_xe(log);
>> diff --git a/drivers/gpu/drm/xe/xe_guc_log.h b/drivers/gpu/drm/xe/xe_guc_log.h
>> index 5b896f5fafaf..37ff4d11e6cf 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_log.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_log.h
>> @@ -40,6 +40,7 @@ struct xe_device;
>>   
>>   int xe_guc_log_init(struct xe_guc_log *log);
>>   void xe_guc_log_print(struct xe_guc_log *log, struct drm_printer *p);
>> +void xe_guc_log_print_lfd(struct xe_guc_log *log, struct drm_printer *p);
>>   void xe_guc_log_print_dmesg(struct xe_guc_log *log);
>>   struct xe_guc_log_snapshot *xe_guc_log_snapshot_capture(struct xe_guc_log *log, bool atomic);
>>   void xe_guc_log_snapshot_print(struct xe_guc_log_snapshot *snapshot, struct drm_printer *p);
> 

