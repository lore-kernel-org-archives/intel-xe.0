Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22A70CCD1BF
	for <intel-xe@archiver.kernel.org>; Tue, 28 Oct 2025 16:19:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6B0010E601;
	Tue, 28 Oct 2025 16:19:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b9oDSKZ5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEE0610E601
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Oct 2025 16:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761668354; x=1793204354;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=yXizV8lDdXNciupoaSHnQ/bo3Lkb9RFFTgDWNPoJego=;
 b=b9oDSKZ5safaER7OtIM6iLFNZrvvzYFX6UOBzEtRL8kDCWeNOCOGvwfT
 rjbQYdrm/fogympiXY+WiosfS1+VKFpvdJHtpfmhgm2FJ1MmmxONJ+MGl
 H9JNvW+u0gFgjuGSLmfjTb2u6JM4FJRvnjSTatZ8mniUC0tCYHcJrf0m1
 dEikw4GxiJwVjLJ9K6Y9s6QkHSDU0ws9sFDjHCRWCtFXlLbzN/HB+QiOH
 HqEfV2IMDP9qjPIUk967THri4IeJnQJuPNgpnmFjMHlWQA4SznP+9saXB
 KY1PbKvv5dL+nMbccQSjIH42wWRQaqA4DoxrOJhrAPpqOhPddw1aeuf5w w==;
X-CSE-ConnectionGUID: AiNJ6VeJRIODVwaCIwYuLQ==
X-CSE-MsgGUID: H72Wkh1wSrKayo7eCtSE+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63923758"
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="63923758"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 09:19:13 -0700
X-CSE-ConnectionGUID: 9Ff9FRS2RyGAv4TkVgLQYQ==
X-CSE-MsgGUID: 4EwgusduROezqJF0H6cGiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="185089425"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 09:19:13 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 28 Oct 2025 09:19:12 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 28 Oct 2025 09:19:12 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.63) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 28 Oct 2025 09:19:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LNmd/BIWgJpRYNUuwkzDO296bMOJudSYoisMNDnRvEmB4Q4qZQW7fc0CxzPExua1r3P2mvfmAiQaD10TgsUBse0ux696+tGX9YJVcZ1tjRN00Io8hlAbSPEZ+bCDwh8wecQlV9K0j69o7lqcDocy4+YivjQoRaBrjTQUH+Bynlflma6FWIzDOwuhehjTGGWGyQyhiWzxHzfYGHBS96PyOpx9oiJj1xoNjN6CvudjZJ6EXTtSxdugKUgiYhVclbOrsuH83bOrDb7XGuWuTcmP7zkTtKmeCQl5gys5Xg+rxuCpN99mQxT6dedYcFvLNUIi473aPclX9CxnlWSng71ALg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y/eid6hR3Pcm63/ZyldPN5FLkeUmiTDUtGXR+OpP2vM=;
 b=s5+7P0RGC5yMTmDjVQkHZXveCYMnMtXnj/Q+spiFH64FZO7SQQ/6Z7H91bwOuO1psotaRZbg7RVhvY3HgQBhibe1WjWiMikII2gxoUKZsOLg4fmzcdObS8Py/ouXSJAiNGqchmdwHas221s7jbUynCagZnmxdam7OYmXFw2Zatp5LELSZC7m15CXOf9OKQhzbxZ+sfqrjxIfyJOxw7HJ6B1wjrpIaYmmH8uFYVdHgrSY23dmsy9ne+Yqr+aPo7KaNau4JMLsMDpIAASFsGuh/uXfd4yLLh3w9vRRxz0xL2HKvqRPntU/I6CrNis02BoupNyT5AWw6d90mq9bLRI0zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by DM4PR11MB6120.namprd11.prod.outlook.com (2603:10b6:8:af::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.19; Tue, 28 Oct
 2025 16:19:09 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9253.017; Tue, 28 Oct 2025
 16:19:09 +0000
Message-ID: <3f7be158-48e7-4b02-9094-24cf69563276@intel.com>
Date: Tue, 28 Oct 2025 17:19:03 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe/xe_guc: Dynamically decide g2g buffer owner
To: Jonathan Cavitt <jonathan.cavitt@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <saurabhg.gupta@intel.com>, <alex.zuo@intel.com>,
 <matthew.d.roper@intel.com>, <daniele.ceraolospurio@intel.com>
References: <20251028160028.69264-2-jonathan.cavitt@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251028160028.69264-2-jonathan.cavitt@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR08CA0257.eurprd08.prod.outlook.com
 (2603:10a6:803:dc::30) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|DM4PR11MB6120:EE_
X-MS-Office365-Filtering-Correlation-Id: 88b13c0a-27ab-4962-d13b-08de163db954
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WjVRZzcvcXZleEliemZQMDZ3Z2tOYTg1VUVsUWFsYlNvbW1zS1h2OHpjQyt1?=
 =?utf-8?B?YzQ5Y2cvUVAzY29ucElZQW8vY3ZsNlp1dHBjVk9DeHhUSUJ5eHIvbkNoNTI0?=
 =?utf-8?B?cWk5YU9aZTFqcC9iQkhaQ05GZ2Z4dHlWZnM5ek5yWVp5ek41cDE3aFg5NnRT?=
 =?utf-8?B?Qm1kREtnVGM0cGtjdDk5eWR2VzY4VlY3RjhjVlpFd0pBUWhLVmlhYjNRd2hJ?=
 =?utf-8?B?ZzJqS1F5U3FDY3d6MUZBZTQxeTl6VFdtQndxbXlRWjhKZ2oyK3E3NWtGUWEx?=
 =?utf-8?B?VWVFc1JQQXovbEhCbitOb3Q0Ty80RGd5aWlTbzJiOXMzVTM5bHJaQ1NteEc0?=
 =?utf-8?B?NVBPNDJaVHZKTWJMWVg2SWc2cEw2RDF5YU15b0xTUFlkYmdZVVFQT3NzY2ti?=
 =?utf-8?B?bWdjUHkzWnlOWmFpWXpzT3A2R0Nhb3dQTUxDa1plQkVET2NaVDJCZnZpMnlq?=
 =?utf-8?B?eUNNOGtRb3VKQmVQU2E3UTdiYjhIOWpXVWxnTlB4YjdjVVIzRTJVZTVtZHds?=
 =?utf-8?B?Nlk3Y1NOTmRub01SbEs5WERIS1Z5M2JsV0R6dW04RFd2aEdyR0JaWEZHNXh6?=
 =?utf-8?B?emYvZGRrdTVhSHloY1Z0RXYrbjdldklRbng3djJOVmZhbTl3cXlsOEl3V2lK?=
 =?utf-8?B?alNFSjlQQVhnV0w1OFVjMkRGa1Vlb2lKdVhuWHQ3eUgwNUF5NUlVYTEzSEk4?=
 =?utf-8?B?ZzRlTytta0xRUHJnWmwwbUpqcVJXbytmV2ZzdEFQWDRwbzZzbmhGdG94cWxJ?=
 =?utf-8?B?NEpzUlJXRUtIdnVBWEVYbWFBN3dSUTdRTnVJTnBQNmdldytydmVBR0VwT2JJ?=
 =?utf-8?B?TkE2NDBZQTI4RkliWnNhdEhaQUNqQnV2V2VLdS9neUlkZGhFMGNCemlMR0VH?=
 =?utf-8?B?b2NMVHc2eXZCNUdRQzVnbWRWRWVNcnBHR2FCL0pXNG1CejArTU1JaU96RENG?=
 =?utf-8?B?eUYzTmRvTGpNZjdvWEFqYS9uSU40TlREV0MvVEJHblQ3aE0xMTVaSTJHYm5M?=
 =?utf-8?B?L3JkMkM5SEdpejVtUlRzaVVvdy9RdlpDZVBBZXNoZ0p6Y3BMLzdOa2JZZEFV?=
 =?utf-8?B?OWRFNmRZZzZ3YkRVeGtabktyNTVYVWVCS2FQZ2VXUXZsRVZXdHlFRFNLblRT?=
 =?utf-8?B?TVRZaWNyME53eUxLN0pmUlVUQlpLYTk4QzNnaFhZV1gxRmorUTNRNkcvSlo1?=
 =?utf-8?B?bzNOZkhaY213Si9BaXZyazhyTlBuVVRYS3QzNlArU3lMVFdLcW9FZ243d0xo?=
 =?utf-8?B?aE1QdEg3eTkvemxXcVc3NzNVTVBZcUxmcGZBUG04TmNiN3dVczZkVDhRMlo2?=
 =?utf-8?B?Qm1NdVVuNHhJUUJQUDZXTUh1UXFYdzNEYm5vWVdweEhDNlJPaEVhUk5Ycys0?=
 =?utf-8?B?Z1dRbFhNUGhJZ0FObnljcjhwdkVjSTllbHN2NkMzZFRNVDFyZHhNSGJtdlA0?=
 =?utf-8?B?ZlFtcDdOU1p5YUxKMDdxTHFmaXJieWRTUVJSdVJLRzd5NjVYZitPcEtuVUlz?=
 =?utf-8?B?UndHWXVaNU9Ydy8xTFF5TjhnNDR4SUpqRm9UcmdwSmpsNC9yS0lrU0VnTkFY?=
 =?utf-8?B?akcxTlBmb2Fsd0xJaVdNN2dySWIrOXhvRk10VGJ6SzNBRnN0c2loWnIrVExx?=
 =?utf-8?B?RlMrSjlxd205c0JMb0o0RjZSdUNQT0FSNk9NV1ZsemJmanBwbjU2UUs4OVYv?=
 =?utf-8?B?S0R0eE42NnFIRkVMNkN0TWlqeG13ckVvelJuajduYjZPTVV6d3V2T1RRY2tN?=
 =?utf-8?B?TjhtLzlKaFMrNGNuK2pxZlNkRjZTV0FMNGpjajI5NHJabTkwUERkYXpXK0lU?=
 =?utf-8?B?eGVVVVRtY29idFpPR1dGVzhLM1d1OTV1eHM2L1dWa0pwbUh0eVRlVUpWUkMy?=
 =?utf-8?B?OEFFSWIyUElJSmN2ZUNQVkYwZDZLNWJqLzB0dklVOE8xdXBDU1luNWtqQW9v?=
 =?utf-8?Q?e+r4kHYHw4F44fOvcWIJ00RtYXlW+Sxk?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OU1NYk0yTG5yVWpJa3V0aFg4cE9JWmRlUWl3aXgveFBXUTFsVTNWdXp5Y1Qw?=
 =?utf-8?B?ZVJrOS92WXlrQ3NDUkoyVjFIaHJNTWxvV1d4eGh1VDZ4NU5PelVpUGtTamdB?=
 =?utf-8?B?azN2ZVIvNEh3emZvckVHbWhHakIrd1B6bTZTNmVaa0xxQ2hBV0ErUUhPMlJU?=
 =?utf-8?B?c3RJN3FCNGtxQk5rT1JKMmtwM01IZExzRUxDSnNXR3pYQVVObHc0NnptT0NE?=
 =?utf-8?B?Z2I4VTMrNm1FYkRTS0lWeldwaktTWmljN0NXNlFQeUZ2dmpINUlCbFBqczhS?=
 =?utf-8?B?MGZveE9vNitrSnIyVzJldm9QbG1LaUs5bERxKzgydVJqZ3JKZzE3dHI5YnhE?=
 =?utf-8?B?MUxHY29sR0d5OE1RUG1wOW9XSVVNRTI3OUtjY1d3MXY0NG9CTW5BaEltT1ZO?=
 =?utf-8?B?T09QamduTjQyVFM5NHFBOEpIUm41SlQwQmxjcWo1Ujd3bnNtcG5oZWhRQ0hj?=
 =?utf-8?B?Wmtuazc1VG8rZHpiSWdoSzNRdFVZcWJMbFk1NENzWldJUENnMXpnWjFJVS95?=
 =?utf-8?B?UmY5VGc1MDFlWk9ycXBTZkpXVUY3UGw4SWFkTzYvYTFPSm1PSEFYenpOVWp4?=
 =?utf-8?B?RTUzWjlycDVLM09BSFgzNlZNdkpnbENaM3piWWpTRlBYWUZBRk1NTUhwc216?=
 =?utf-8?B?TWFJSTZnZzRDQW9KWW16b1ZyM0lEVW13WVlnbDBYenJKbDludllsSEZ4aVpT?=
 =?utf-8?B?eHlENDZTZnJPV2xuNmtKd05ZelNiSUNmRkZSUkJyRitnU3RIU0c2cjkvem9s?=
 =?utf-8?B?WFZqSkViejZvWWx6UHhweGZtMTExWDIvZWZ2c1c2akFtbVNPZXJDUHNPbE9C?=
 =?utf-8?B?RWk0RG5nZnFTZmFxV2FGY1BkME1SNXNFN2VmSzg3VUlyRWFEdHZxT1VkK3lL?=
 =?utf-8?B?T2YrOXJVMjV3aGVTU0dDQlFoeTBVb3BRMkdLTllEQTNZd1RCTStZNEJNKzIv?=
 =?utf-8?B?L3VydGkyYkw0Tm82Mll0WEVwUTV0UXZyUGFHaWxZaVVMNis0VHdpcFVQQVB0?=
 =?utf-8?B?VkptUUFuTjRNenFkZGVWeGpLUW4yS1hVdW81SzRSd1RSb2t2TFNBQzIrS3Rz?=
 =?utf-8?B?SFpXVkJDQ0NEUnN0OG04b1NlSnBjeGNLVGhTNi9Hd01rMTh0cUJYZW1VWS9C?=
 =?utf-8?B?YXp4bmQ2eUFRWjdRcnNtNmUwSkJ3U01Sb09wbk8rOXgwY0xwZXlPWm9jV0Y2?=
 =?utf-8?B?YnlTaStxUmYzaG4vWHJtOThaRU9nSGowYW9DQzVzejJjMExsRXNGTldzSGhB?=
 =?utf-8?B?MnVLZDdsS21XN3lZNFpsR0FHeUV4eGNzN0lIZHJ6dHdEQjYvWGtzSEluQUJP?=
 =?utf-8?B?d0diQ0liK1hVTXdKbk1WQml3ZGlreGlIcGg0WjRvMVVnZlJkbUQ5Qk5veGo4?=
 =?utf-8?B?V01PU0VOOEd0c3F1SW44MlJ6UXNjS3VUeSt5K3M2dkplNE9UQTcvZHMrSjgr?=
 =?utf-8?B?MG9QR3pkR0w1NzVVa1hHNzV4VmxWQ1JtRFgwMVFPck9qZUN4S3JLZnpSSE9w?=
 =?utf-8?B?YU5uNXpodm5qQlV4cTJnU1hrcU5ORUhKUlc0d2dsSno1RnV5Nzh1Y0NPZldH?=
 =?utf-8?B?dlJYa0lZQkNFYjlGOEF4aXhPZmd1N0xrV1pOQno5ckMvZ2RVcG1MS1JNdXlR?=
 =?utf-8?B?RERtQXVMUTlhbERXT1lOS2VFajIzaUVkVTF6OEJIUm9peEFBRTJPUWhlMHlT?=
 =?utf-8?B?ZTllNWlSeDZWSnFPTjdvdFBaTDRYNXNGVnBUVWtJTW9YZ2FvTW1wRlBpbkNG?=
 =?utf-8?B?ajMrTWhSeU4xNEdDMmhpMmtUNGJsdEh2WGQ2UEplb3k1MWFLS1RUb1NESWRz?=
 =?utf-8?B?VEVoVldFczdnbTBFMkJ3MEYzTjRFTm1DekFVbUFidXJLbzhGZlJnYUVpYm5J?=
 =?utf-8?B?bmdxTDZabjludGNBRlFGLy8xcW15Q2JHVFBWT2hVWVVmT1dxSkovdFZxR0hD?=
 =?utf-8?B?R1JGS1pZMkViSnhTdFY1NnMyYUMvOWJHTmlTTlRFczd0MGZrSDVLVTk5NzBm?=
 =?utf-8?B?clBEK2xKOEFTUSt3aWxJMHBxRDNpb1ljaXQ3RWJ1dzliL0tqK29SYzdEaHdw?=
 =?utf-8?B?aVlHYzFEa0VyZXhXcVhrS1BUYjEvU0VCYTFKczgvaGR6UFdBVll0UVg4eWp6?=
 =?utf-8?B?Z2xzU3hkb2FmaU9nZDA1bVo1Vmc5T0VnTDVCMUt1Q1l2Q2lHcWRzU2JuQnFF?=
 =?utf-8?B?OUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 88b13c0a-27ab-4962-d13b-08de163db954
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 16:19:09.5755 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Woh2NuBZXnV1XYy1EKdTKXxzl961ZmLxW0Y9eqRyoty5qv5brd+dBIIZ3eBnlAhT37EuvwxRJUgPWgEVpaCYpeiBDnJFDSb8C9b62LPSHLc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6120
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



On 10/28/2025 5:00 PM, Jonathan Cavitt wrote:
> On today's driver, xe_device_get_gt(xe, 0); can never return NULL.
> Hardware-wise there's always at least one tile, and every tilie has a
> primary GT.  If something went wrong during init of tile or GT and we
> couldn't create/initialize the structures, then we already aborted the
> device probe immediately and we'll never get further on to places in the
> code that would be chasing a NULL pointer.
> 
> However, there's currently ongoing work to allow the primary GT to be
> disabled via configfs for debugging purposes.  Once that lands, it will
> be possible for this query to return a NULL pointer.  This can cause
> problems in guc_g2g_alloc, as this process currently relies on the
> primary GT always being present.

in such case, maybe we should just skip the G2G tests instead of trying
to fix something that probably will not work anyway, nor is a goal of
this test suite

below diff should be sufficient to survive broken (for other debug) xe:

@@ -683,6 +683,9 @@ static void g2g_check_skip(struct kunit *test)
        if (xe->info.gt_count <= 1)
                kunit_skip(test, "not enough GTs");

+       if (!xe_device_get_gt(xe, 0))
+               kunit_skip(test, "no GT0");
+
        for_each_gt(gt, xe, i) {
                struct xe_guc *guc = &gt->uc.guc;



> 
> Instead of making the primary GT the g2g buffer owner, make the first
> GuC passed to guc_g2g_alloc the g2g buffer owner.  This requires keeping
> track of the g2g buffer owner in the xe device so each GuC can know if
> it's the owner or not during initialization.
> 
> v2:
> - Update the kunit tests to clear and reset the g2g_owner variable as
>   needed (Daniele)
> 
> Suggested-by: Matt Roper <matthew.d.roper@intel.com>
> Suggested-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/tests/xe_guc_g2g_test.c | 2 ++
>  drivers/gpu/drm/xe/xe_device_types.h       | 4 ++++
>  drivers/gpu/drm/xe/xe_guc.c                | 9 ++++++---
>  3 files changed, 12 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/tests/xe_guc_g2g_test.c b/drivers/gpu/drm/xe/tests/xe_guc_g2g_test.c
> index 3b213fcae916..6446232422e2 100644
> --- a/drivers/gpu/drm/xe/tests/xe_guc_g2g_test.c
> +++ b/drivers/gpu/drm/xe/tests/xe_guc_g2g_test.c
> @@ -358,6 +358,7 @@ static void g2g_distribute(struct kunit *test, struct xe_device *xe, struct xe_b
>  	root_gt = xe_device_get_gt(xe, 0);
>  	root_gt->uc.guc.g2g.bo = bo;
>  	root_gt->uc.guc.g2g.owned = true;
> +	xe->g2g_owner = &root_gt->uc.guc;
>  	kunit_info(test, "[%d.%d] Assigned 0x%p\n", gt_to_tile(root_gt)->id, root_gt->info.id, bo);
>  
>  	for_each_gt(gt, xe, i) {
> @@ -447,6 +448,7 @@ static void g2g_free(struct kunit *test, struct xe_device *xe)
>  
>  		gt->uc.guc.g2g.bo = NULL;
>  	}
> +	xe->g2g_owner = NULL;
>  }
>  
>  static void g2g_stop(struct kunit *test, struct xe_device *xe)
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index af0ce275b032..91ec9a295226 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -38,6 +38,7 @@ struct dram_info;
>  struct intel_display;
>  struct intel_dg_nvm_dev;
>  struct xe_ggtt;
> +struct xe_guc;
>  struct xe_i2c;
>  struct xe_pat_ops;
>  struct xe_pxp;
> @@ -628,6 +629,9 @@ struct xe_device {
>  	atomic_t g2g_test_count;
>  #endif
>  
> +	/** @g2g_owner: Pointer to the GuC that is the owner of the g2g buffer */
> +	struct xe_guc *g2g_owner;
> +
>  	/* private: */
>  
>  #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index ecc3e091b89e..a3a0961456d0 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -468,9 +468,8 @@ static int guc_g2g_alloc(struct xe_guc *guc)
>  	if (guc->g2g.bo)
>  		return 0;
>  
> -	if (gt->info.id != 0) {
> -		struct xe_gt *root_gt = xe_device_get_gt(xe, 0);
> -		struct xe_guc *root_guc = &root_gt->uc.guc;
> +	if (xe->g2g_owner) {
> +		struct xe_guc *root_guc = xe->g2g_owner;
>  		struct xe_bo *bo;
>  
>  		bo = xe_bo_get(root_guc->g2g.bo);
> @@ -495,6 +494,7 @@ static int guc_g2g_alloc(struct xe_guc *guc)
>  	xe_map_memset(xe, &bo->vmap, 0, 0, g2g_size);
>  	guc->g2g.bo = bo;
>  	guc->g2g.owned = true;
> +	xe->g2g_owner = guc;
>  
>  	return 0;
>  }
> @@ -507,6 +507,9 @@ static void guc_g2g_fini(struct xe_guc *guc)
>  	/* Unpinning the owned object is handled by generic shutdown */
>  	if (!guc->g2g.owned)
>  		xe_bo_put(guc->g2g.bo);
> +	/* g2g owner is no longer valid.  Mark as NULL in xe device */
> +	else
> +		guc_to_xe(guc)->g2g_owner = NULL;
>  
>  	guc->g2g.bo = NULL;
>  }

