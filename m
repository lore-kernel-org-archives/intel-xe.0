Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 434F8CCF9E3
	for <intel-xe@archiver.kernel.org>; Tue,  4 Nov 2025 22:29:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 006E210E685;
	Tue,  4 Nov 2025 22:29:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jGgSTiyL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC5F110E685
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Nov 2025 22:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762295383; x=1793831383;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=cT20BclMjEThUCx2kDwgcXDVUi3EcQ5kNH1hzcSQXdg=;
 b=jGgSTiyLifWPW0b+W8jPHzMyrhPHuRY+CK3eaQzziRu5UwCFk3l5pT8Q
 3zMRphtYv/9Ueb+4Kphy6kJ/GKPRmuawU/wkvPFyZdSxOBvM/aPIjbX8v
 VW+xVpMlsDhL5eFe/83GB1O70qgV6MJ84wtY7fLPks4O6ciIcyf5/bnjj
 YG5mWXoLe/ONZgFRo4LBd40AXCCJQhf/hC2pAm0KqXKBDfLvNRYC/05c8
 rwjfn2gjSsBx0U8otS281Gn/MSZsdS7f+tWQEgN2jjbDWsTcAkLvHtqpl
 dQ89UGyJ2yWAsdAUtGmtHvtkvULBuT5dQ3INma0mw+aupfN4NOBmZhONh A==;
X-CSE-ConnectionGUID: uiOVvjncQUqLFdk1Wd3oKg==
X-CSE-MsgGUID: w9WaqNvnRfGkWW4ihu5ssg==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="67017999"
X-IronPort-AV: E=Sophos;i="6.19,280,1754982000"; d="scan'208";a="67017999"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 14:29:43 -0800
X-CSE-ConnectionGUID: AmX3fZWSQkaZVSkOR+Uyug==
X-CSE-MsgGUID: 5vk+3+T/QoWIQcgxo65pbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,280,1754982000"; d="scan'208";a="188006732"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 14:29:43 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 4 Nov 2025 14:29:43 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 4 Nov 2025 14:29:43 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.60) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 4 Nov 2025 14:29:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qDaGysGShQFN3K2S8qAjJFCRLe4YdVG4kYaj0z7KhGwJYtIr5Gmv2qCskbvDaoLVbanI06UTcfIIg4mYDWWX+3KK+5Ao9oL7kenunRr/KF5Rc7MgS0BxJ6w0bH/jG11V2pcZmo0O+XOYVQXs2M/8Vk4h+9Ja0IPJ1LmlxNr+mwnsFEsI3GtudR2mTEKww8CSbrqn+xvw47swnu9Zqa68rx5WLhDQmWm/l2Lul4F9Zs0+aIsxZwTxfcrcFZXY8np7qxMTyhkpNtDt/xrbsRaVBpR1L2hWh8RHDS5+k/kheRDed0OeeN7N607W0jXD+uIaxE3OMGpr0K9H8wR7i1aMKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bNSaxdJ2shgy32z6CW8S+Ed7yxVHaXcGn2mm3JcESB4=;
 b=XDBSghPmDAn8t6o132vEE1xQaLqOeF/51r9TNsgd+8gfShv4vx4kTgkPTf5MxGcDWe+t3IoW2tSi873Rv8LoBfRu84CsS3DDEtZRu9ZrL8rucvfoZkKHtRVKYwe2kzzqkAizOryaBIV7MYnvKQWM0mPUX64ff9AHd/rIDslbJ+0x0ngkg1aDXj5EJlTu/W0+puLpDg4wlpAqDc/IA7r0TK9pRYWjrYMO1p7qCDQgo4hHzDT6z+uqVEsi5ny55perVGU6iWig6zluyKsKcbIpfvpRxtZFtgktsdmCp2zJnjW0HtUr9X9l/r2SZ+7/Vklb0n2fxhj0X2fT+pZU/8EZdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SN7PR11MB6826.namprd11.prod.outlook.com (2603:10b6:806:2a1::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.12; Tue, 4 Nov
 2025 22:29:40 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9275.013; Tue, 4 Nov 2025
 22:29:40 +0000
Date: Tue, 4 Nov 2025 14:29:37 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Shuicheng Lin <shuicheng.lin@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <stuart.summers@intel.com>
Subject: Re: [PATCH] drm/xe/guc: Register CT fini action before mutex init
Message-ID: <aQp+UTmOHkP0OB4l@lstrano-desk.jf.intel.com>
References: <20251104221613.795865-2-shuicheng.lin@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251104221613.795865-2-shuicheng.lin@intel.com>
X-ClientProxiedBy: MW4PR03CA0314.namprd03.prod.outlook.com
 (2603:10b6:303:dd::19) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SN7PR11MB6826:EE_
X-MS-Office365-Filtering-Correlation-Id: 88d419b8-2a36-4630-9dec-08de1bf1a4bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TUZWcTY5dDNIWS9pUEtEZ2orVHBoTFFJUlBVRTEyZW1uSFlnWk5WbHpTeTBt?=
 =?utf-8?B?RzdDR0VRS2tzbkpDMFhiNC9OUXV3a3NacDUyaERGcC9LdFFhVnVMS0s2QmdQ?=
 =?utf-8?B?M3VYa2M2OWZEQkNGQVVjTGxiem5rR2tGL1l4c2F2cXFYeFdhM3N6TFlxYlZD?=
 =?utf-8?B?NFRtYVZxWWk5TWFJZjBacVJDencxLzlyMkI4UkNZdXFLbWRtMjZKVWYxTWkx?=
 =?utf-8?B?am1qTGdQUG5USkdvejhOR0xQYkFNRTVyVEk5T2M1dGlpM2F4UWx3aDNsVUdC?=
 =?utf-8?B?NkNSdWNoUk1Pd1QwWG1mWnVqWWlwaE0xSW1KajZSLzJNdW95a05JUjdqYlVq?=
 =?utf-8?B?VUFaMnE0Q2VHYUpodHFzQ0xnTEtyVlIxS24xNE1mdE9PU3RyUDJBNWJnYkNu?=
 =?utf-8?B?ZEE0NE5nSHBwckt0SHpZRlp2dm9SN0ZsUzJrdjdyWEJCL3FJQ1J6czVkMmto?=
 =?utf-8?B?NlUySUJyY3dIb3JJQmNYbitjL0Nkc1loaWREWk9rOXp5TVhMZDBQczUzMHVK?=
 =?utf-8?B?NVhZTGFtWit2Q2hTRVllZ3ZJZGhxb0FqVWpKb3orcjR4cDhDbFRidnNScENp?=
 =?utf-8?B?b1BwZyt2dlBHaDhTRVNKU1d5a0d1eGxOMlJBVHlWSFNXc0NadW1Jc291YXlX?=
 =?utf-8?B?TzIyNGlieUVOSjdQM09kMXpvUHUydVh2R2xxUUZ5bzh2aXl6eFN1OStGVnJz?=
 =?utf-8?B?dEgxOXBQcjVCUTVnVENGRmFYZldYaTR4ZmNMb0FRZ0o0TTg4N1R1M3VCOWc5?=
 =?utf-8?B?WGNiRDlYYkM0N005VkxVS0taWXZvc2JOTlhOM3hEeWsxYWQzODZXRmN0Q3pW?=
 =?utf-8?B?SmpCcjFBMHR6NktOc1VyTC9BanJjeDdrK080dW5YNWVvNlBxWmxTZm5OQlVG?=
 =?utf-8?B?WmZ5SmFER1VjeGRhQjhVMk44ejh0RktTbjRWSkdheFpVWXlHSXlTbHh6T2Js?=
 =?utf-8?B?VTA0ZnhxdG1PemN6bCtsMVNjeGtRRlpwRUlWNDVtUlQ5Z2RFTDV6aTA4b3Vj?=
 =?utf-8?B?T2lDMUx4bXVjNHFwSkNvamp6cnVCUEptVG5XTExKZ1dhUnFYQTZPdmM0aUpV?=
 =?utf-8?B?bjcycEtjVStPY0JSZm9acC81T0syYldPbkdkSUhUc2owMWFkS3RQOXBMaVVO?=
 =?utf-8?B?Uy9pMlRxQjkvRmQrdW1MZ2pSd2FOaElXcjNRdWR0WElxeUN0eHYvN1c0SDE4?=
 =?utf-8?B?UXZiMldxc3NhV1dxOHA2Um1rTDYzNVdNeThHTDAyanpUNlE2NWNmZEQveXBr?=
 =?utf-8?B?MFVkYVdnd0ViZ0NIT0dJSzV1ZGZ3REd2WWhjNFpVZFNBcjVVT253dFEyTWdF?=
 =?utf-8?B?L1lUc0lPUnFlTm0vbzV4RmhvN3JWVDdqYU95RWNhYmk3MTdMYkR3YlEyRnVR?=
 =?utf-8?B?dGx0OGZOK01nZENNNVBBTzVtNFY0aE53OG1IcVRqSFd1YWtqSFZkMmVOK2lD?=
 =?utf-8?B?bE9WZlp1QzBEWXhzQWdDYXBSUXliYjBCazlTWUJ4U2hQUVljTytVYzIraHlo?=
 =?utf-8?B?RFRTeVprUGRxMURLSGRsUFZwYWg1UFBVZ0FSR2FvZEQvUjVXMVBCYk1SN25i?=
 =?utf-8?B?cmlZTUgvU0xjOU54dTdXdEluVUk0QlRrL2Jna2tYRDJNSWJZRW9xaHF5S2tE?=
 =?utf-8?B?SXRaOStoVS81eHU3d25nWFY4L1RwNEk4d1pXVzNiTzZWcU81WHF0YUJmOTVO?=
 =?utf-8?B?UG02YUpMbmdpL2ZteVJpL1lwQ1ZKMmFvWC9tNDVHclN3WitiUjZuVHIvTEtW?=
 =?utf-8?B?UjNvVEhWWlFvL01FMS8vaTBIWDFTQnpyK0cvbUUwV1g4NmlLMFVJUU40K0Vl?=
 =?utf-8?B?VlJFOE4yTGRZVzhja3ZPc3FxektWMXBsQ2xKVEpWcFc5Y2Zid0JSM0NEbU1n?=
 =?utf-8?B?czhRc2RVRGZwY202Y05zaWwwRjRFbkJHeXhMbWJ2Nmd6WTlDcEJrSVgwUFJm?=
 =?utf-8?Q?2eNsxzEg32ejoky9IedXqr5AVa1fDZle?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QTVhRk1YVmZUWnJ6alVzY3JsbmJoeXBmclFBRkxSVTltTXp6M2lJUDc1a1Zw?=
 =?utf-8?B?dldhUlFYL1NFcndFZTV6RysvMWE5UlF0MWNEaDBqakJoMmRwd3EwTEFiTThW?=
 =?utf-8?B?QTNpMWdIWkFCQlhhT3V5UWNPVVZMWHpEOERCb2NPTzBTcThTY2hta1B0WHBY?=
 =?utf-8?B?WFF5dVBmUG16ZWNlTUFrVXRxZUtiWUZDUGRKNnYxZjUrWTgyNlVrTW9oZnVX?=
 =?utf-8?B?TXFPY25rQzBYRUVOMGFBZUVYMHJTQ0V3N1kzNThqZjhEVTR4RmNVZGlGQlds?=
 =?utf-8?B?QVVzRmQrYStQVDZmWDdMQjR2YVF5Y0RiajNuQ3ljY0l0NVhpK0tvRFN3TGN6?=
 =?utf-8?B?RERKYmlpMlEwRDQ5TEhlTFd5VVZOL0pmSGo3M3BvSm9naGc3aVlYYWF6OW1S?=
 =?utf-8?B?dno5aHM4K2VHTDlaUE5vREJwa2hHNWxkSVhqVE01MFJCL2NtaGVEaVg5WHFG?=
 =?utf-8?B?RkJvOWZ0WWh5TXZ5K3djTEF4aFpsMy9naHRNY0NOTkNVT3J3K1NYZkJBdGZv?=
 =?utf-8?B?RHlIdkgra2wwWng2MzU2elRlZ25ybGdETGloZUxPZ2tqWTA4WXBXYkNoaTdO?=
 =?utf-8?B?K0FwVFBtdEhRM29rUXJsYlpJcU83ZDE2WHYvSW9rMzhVVTVhUzZWcUY1YXgz?=
 =?utf-8?B?ajF3RE1ZRkVXRFJoMVNkSmx5aUxKNlRMdUJPdVJXdGZwOVhPUnBUWEFaZlhp?=
 =?utf-8?B?NHZqc0JsOXZhUU55c3hFSzgvbDFmSkJoMDBUckZlamtpbnVVV0FCQVJ0WFRY?=
 =?utf-8?B?SHdPMUs4cmJIMjFFWWdrcnVjN2VMUlZ3Z0ZXTEkvTWQ2VlNkYzRlNFJSci93?=
 =?utf-8?B?S2poNjhrdTJUM3Nvcm4xWmRLcGxmcmFNM1M1Sk91cWg3TnpEd0UvUCtnMCtR?=
 =?utf-8?B?cnlYOURoWmJaYUVmbFUveDQ4Y0dDa2l1cEI3NndWcmJYOTFDbGU1QTdGYnBj?=
 =?utf-8?B?dkdjaUlFcUQrbmlFbDhIVTBVeWVWMTJIeTk4UnVMSEQvNnNTcEdaWm5EcFNh?=
 =?utf-8?B?WXoyWjhFSyt1eGhadS83Z0lrNkpaL0pacjNudzRFM0Vsdi9NNXRMUE9Xd2Z0?=
 =?utf-8?B?T3UzLzB2QkNZSDUwTTBQci9tV3dmNlBsZnZVZGdjWCtHaXZFNW1zU20wRlFT?=
 =?utf-8?B?RmN3aGZOOWNPN1NaQ2poV25KK2Q1UWNsUWI5NzU1UnYrUm9ySGE2RDdsYU5D?=
 =?utf-8?B?K3ZOZG03ZDJrV0NUaG1mblNmQjJ1SEd6emRNVFcweko5ajJ0TXJmK3hKSk55?=
 =?utf-8?B?cE5jQmNSRmE0L29IKzdEbkdSMGljQjFtdytGQWthMW5WblBjOCtHbTNMaWRJ?=
 =?utf-8?B?clFUb1QzR2ZMOEQ1dERDeWpJZ2lWWEx4R042LzRxcUhkTXZCc0pxTzloeFNv?=
 =?utf-8?B?Q0lzcmhwNVM5ZS8xN2pxcC9DZHVRcVVINmdXdEJ1VW1QaXlsOEV5aEVEazNE?=
 =?utf-8?B?VU51RlB4NW9Fc1owK0VQYmc3VzNnUFBnbUVKWWphNXNPbm5zS0lycFZkSHRV?=
 =?utf-8?B?R3N6TTA1dzdiVE5YU0tTdG85OGF6MTJjOXRLRTNXNGwrelo1bzZRYXJ2QVFH?=
 =?utf-8?B?enhNaEhReitpaGNlSkFvdCswWXNHWWdKUjZlQVdyTHRmc2cvTXlkcFhLV3Bj?=
 =?utf-8?B?NW9ZS2ExWWUwSUZ5MDI2Zys1OVpycGVkRU5JZEFYMHA2TzZmc0NuU2FwTytC?=
 =?utf-8?B?VnFuSXhiWlBDUUd0MU1uQ2RwdUZLTHV5U2lKNDBhNXV3ajZVVU9EeE9hNk91?=
 =?utf-8?B?RDd2VGZLMkxyNmRDUHErRUdISDVROEVNUDhLcDFhajlDcExJYnpXQ285dnZZ?=
 =?utf-8?B?RXM4bzErY1dzajVWK3ZtY1VQY0l5SjBKdURvc0VPaXFPOEF6a0VPMEFLNm5s?=
 =?utf-8?B?cllkcDNYUnc2bm1mR1FGdUNXU2xsV0JqdDNBMW9jTjlFZld0MGYyaytTd2t4?=
 =?utf-8?B?VWZpeDBEQnNwZTdJbURRcFBwQnB3RnlrM1Rvd0N2a0NZdjZXZk9HcHRzOE9U?=
 =?utf-8?B?VnM5TmtuUTlUWkZBeXF1djdETUpWUmlYL3hoMlZsdFg1enB4bXZNaS8wVXU1?=
 =?utf-8?B?b21FdlZDdnpXTytpMmNGdWdrQW1xUUV1YlRoOStyQXkyMGNwZ0xKQUZOLzJJ?=
 =?utf-8?B?Z25GQzBXQ3NtQjJFdTBmZ3VNbG9jejBMM2RMdWZJUjRpVGg3dFRpaEFuRlVz?=
 =?utf-8?B?MkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 88d419b8-2a36-4630-9dec-08de1bf1a4bc
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 22:29:40.1219 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iTTIooNnVb3nKgRuFaa4fJyUNz1eSzfOABqSWuKpuaivq8FwuZQefkg9YH8xHxqzOEiYFK5Wy8BSbUIL81d3EQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6826
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

On Tue, Nov 04, 2025 at 10:16:14PM +0000, Shuicheng Lin wrote:
> xe_guc_ct_init_noalloc() allocates the CT workqueue and other helpers
> before it tries to initialize ct->lock. If drmm_mutex_init() fails
> we currently bail out without releasing those resources because the
> guc_ct_fini() hasn’t been registered yet. Move the drmm_add_action_or_reset()
> call ahead of the mutex setup so that the devres unwinder tears everything
> down on the error path. This is safe because guc_ct_fini() never
> touches ct->lock.

destroy_workqueue in guc_ct_fini can flush the workqueue which does take
ct lock. So I think the correct flow here is at the top of
xe_guc_ct_init_noalloc do the drmm_mutex_init, then initialize all CT
state, then register guc_ct_fini.

Matt 

> 
> Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_ct.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index 671d69958ce7..2680e9096c15 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -240,16 +240,16 @@ int xe_guc_ct_init_noalloc(struct xe_guc_ct *ct)
>  	init_waitqueue_head(&ct->wq);
>  	init_waitqueue_head(&ct->g2h_fence_wq);
>  
> -	err = drmm_mutex_init(&xe->drm, &ct->lock);
> +	err = drmm_add_action_or_reset(&xe->drm, guc_ct_fini, ct);
>  	if (err)
>  		return err;
>  
> -	primelockdep(ct);
> -
> -	err = drmm_add_action_or_reset(&xe->drm, guc_ct_fini, ct);
> +	err = drmm_mutex_init(&xe->drm, &ct->lock);
>  	if (err)
>  		return err;
>  
> +	primelockdep(ct);
> +
>  	xe_gt_assert(gt, ct->state == XE_GUC_CT_STATE_NOT_INITIALIZED);
>  	ct->state = XE_GUC_CT_STATE_DISABLED;
>  	return 0;
> -- 
> 2.49.0
> 
