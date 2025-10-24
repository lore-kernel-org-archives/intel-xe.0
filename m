Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39EA1CCD1BF
	for <intel-xe@archiver.kernel.org>; Fri, 24 Oct 2025 22:09:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED4D310EB42;
	Fri, 24 Oct 2025 22:09:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cVYUllfV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 654F810EB42
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Oct 2025 22:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761343765; x=1792879765;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/U9IzojwFD2qLa2ze8Dkl+n9fxOhNee7IWmeiufBHoo=;
 b=cVYUllfV5mN6PeQ+zVc2BAXjebW7aHqfjnga+ZFNkvDFlI+V/OVFe5Yq
 cU8kVopVCyWSAQ/u5YNkA8U4OZdU1iLGdmDjjvHmro2lHqswnZnaCxOxR
 SP9a/x64LMW20c6wsuezpVRHJf1mZsMdp48Lw70UA58Dg8Zh9Cwmr6h/D
 t+WOSu72tLTyMi167tXQLjVqpEafN5mJFKIKPy8UGqJPzypUvn1wTn6Kn
 +9hZj1N2YwdwOwF2wSPRyHgo+32y+mx5gbz0Lt1Ib4afuRw2pr4xprJa2
 q6ZL0qToq24OUyY0PEgAzZkqY36U9ZNmL6dQSJMeaGTqm5RZpBO/qigR3 g==;
X-CSE-ConnectionGUID: pRYZbsChRyO/8RnUBu2XQQ==
X-CSE-MsgGUID: Jy5qB5JhQyC20ZHetqphqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63563584"
X-IronPort-AV: E=Sophos;i="6.19,253,1754982000"; d="scan'208";a="63563584"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2025 15:09:25 -0700
X-CSE-ConnectionGUID: W/v3AnizSFW35/zk2xtfuw==
X-CSE-MsgGUID: L8vfexL6TaSLpCDWxxgsdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,253,1754982000"; d="scan'208";a="184900595"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2025 15:09:25 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 24 Oct 2025 15:09:24 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 24 Oct 2025 15:09:24 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.6) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 24 Oct 2025 15:09:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=btnn6TEL3mb1ZQlkg0AtFh5tpzmys85NHAl2UkWP1TpucKB49YqmPgyUvEvNoUhHX78Oh4pe/wawutkvyGTnW5XPYVvt/MFw6aQhYuBDF19jvwaEKcCGZnZdUD1ryuqJARTXjeQBIr9zzx2nQ8e9vn8mQH7Qyyxq0c9N8stvYQKaZqSBKCmNHPPQrSIMWygNYkrDYknHUm/u6Ca9j4OF+TQAykU4+zRTgGvQTZD1QqJVVoYmzgZDgZpPbs+xRDq/xptaoT99vW9rQGcUQEwnFCaaD4sFiU8zCuhV3hGv0iNJ2jbHcrkLMX3S1B1trvwwtau7wfdSNdgcZQl/D9H1PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uwm03wg0xCj6S16YJ+FAl6YsT3PGCdaaeHxeliyNc4o=;
 b=l/dmdUm6Y4w1xvCzlopBCFV4sJy4zD79qjEvkUGGHtNVDziHRC7sEPEeU5KedV/1gkWcOxwLkeQ/jjP2b1ylDkweQnffaNcfPVY4aFigL86iujR/1vlXk/h23+TYOJps4lHNm/SdbBfK4oSHaTovzVgsKuZqivrCXMjj2aNVtqixacp8QqwwmX+D3tn9Bc2KZGX1P8r2mYPyhqWKxCoALc5QB673cVUdIEta1P1RlqnAXX20OQtpT+i2hr9sXBfSj8CpLk4SrwF9LKvxOJUi+icaAOTYZZXty0tlbKcEs8Uzgft5IPkoaTzH93LswWfUqtaTdkGEJJ3gqqMjVJZ6Gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by CH3PR11MB7916.namprd11.prod.outlook.com (2603:10b6:610:131::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 22:09:22 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%4]) with mapi id 15.20.9253.011; Fri, 24 Oct 2025
 22:09:22 +0000
Message-ID: <ed703637-6f92-4bbf-aa48-4ac6ff1b0036@intel.com>
Date: Fri, 24 Oct 2025 18:09:19 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe/uc: Change assertion to error on huc
 authentication failure
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <daniele.ceraolospurio@intel.com>, <ashutosh.dixit@intel.com>
References: <20251024191959.2555145-1-zhanjun.dong@intel.com>
 <bf68bb5b-7722-47f1-a67c-756a78658a33@intel.com>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <bf68bb5b-7722-47f1-a67c-756a78658a33@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0218.namprd03.prod.outlook.com
 (2603:10b6:303:b9::13) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|CH3PR11MB7916:EE_
X-MS-Office365-Filtering-Correlation-Id: 3953e9b4-b015-4f05-1ab2-08de1349fc61
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bVZ5OXd2dWdzNUVod0hwb2t2R2h4TVVpTjNDWmNOcDYwRG95QTFPbjQ0dEpw?=
 =?utf-8?B?YWNmdnJNMUZwN0VsUHdTYjRDcmNDNE0zT2hwM2pmendtV1E0T21IOXcxTmgz?=
 =?utf-8?B?VVBlUzAwb2hlclRtOVFCL1BQVkI5eHMzQmpoM3Vic0c0MUdDZEZoQSt5UGtv?=
 =?utf-8?B?N1Y2a1dVaGdZZlpGckJmc01XM1JuNDN1SVZTSTRIanRrTzIxK3dWWDJhVXlB?=
 =?utf-8?B?NXFGUWtWYTFTZFJrcHNTRlIyTkJpb2hkaDgrbnE2QUVtdEw5WEFnZmlySlZn?=
 =?utf-8?B?ZlcxbjBhVHU4bUpuSTZOdHlyNHIzQTRSZ21tZjllMWxVS1czTnJId2JFeTUz?=
 =?utf-8?B?SlFIUTRNUVRrOWpvRUJWTU1UNDZkQVg3MElWNEdjekhVNE9hY21xQnEzOG80?=
 =?utf-8?B?aFZHTm1zVVUrYlNKRGtIQ2VDZE5Ya2U2aG9oUGh2WmEvRFczQjZNemgvKy9T?=
 =?utf-8?B?T1pTckVta2Q1MS9ZQzdLUGprODJ2T3VmaUlnczFqT2xxN2F1MHpxa0xhK0tY?=
 =?utf-8?B?UnBhQzFzb25rL1N0L0IrTnZ4RUQ4TzVxTzNDb2VCbmpiMkY1NlpqWFRqYjEv?=
 =?utf-8?B?MitETzFPUnNDWUg5VEticWtwMHFObkY4alZ0bjh2ZGo2UmpHZVJEMy9mYm10?=
 =?utf-8?B?OFdrZWM5Vm1RbWJUSmU3ckZsNXZ4bUpiSVNkbENjalAwU1htczYxdHR5bjJR?=
 =?utf-8?B?TVpFQVF6QXA3NTEza2dteHE4MjVhNkRpY3pIOFdlM3BVMmpwZGQydFRxUm9l?=
 =?utf-8?B?dDNqTXYyNVB0YUFaVGI2cXMzcllCajZ4OGJXby9MaHQxbkFhNFRaRUM0U1JU?=
 =?utf-8?B?QnRGU0lvMEFuUVRLRkpaNGZTS2RWL3hPaUtnNnZoUzFEa1hjbEI2Q2JobEg4?=
 =?utf-8?B?N2xzRTNnenVvYjVGSFdBdWwvRThON3RkWVJoK3BDeDhOeWZ2WDJ4ZlZucW8r?=
 =?utf-8?B?QWoxNTZJWWRIaGpLck1ZNStvL3NRc21acW9kS2I4ek1BZ0duclJJSnA4N3JT?=
 =?utf-8?B?ZTNqSG9vTlNCT1llbmx6ZnlNQnNkRXJTMkhiKzR0VEd2UE9qZmFoQmgwYm9u?=
 =?utf-8?B?YUdVT0hiQ09MTEtjbUwvRVZyRnJxNHJQZ2dJN243ZUpEYmJLRzhNektkUjBw?=
 =?utf-8?B?V0MrK1dTVklIeU1kVDIwZkdyVFk2Zmx6bkRUdTFhMXF3SEpxc1packo4K1RM?=
 =?utf-8?B?S3Zxalp6Q1BmUVg1MGNwZ2JqUWp6bTdMZkFxd2dlbWlNME9vYmpwWWhuMm1m?=
 =?utf-8?B?eTk5U3lwKzBic0tHUnhZYnZwM3o1STh6RWhSQU9ORTNNMWRSQ3NhUDN2NERN?=
 =?utf-8?B?OHBEM2NlTHpBdS9ndWNmTzRjQ2Q5dFllaXRqVXVIVHA0WlREbFgzc1E2UGkx?=
 =?utf-8?B?S3dyczJqLzhjMEtaU25pS2ZrVkN3ZkhlRCsyRXc1UTBLbG5hVEI2M254Ymh3?=
 =?utf-8?B?YmgvM2sySXpnWFNNbXYwVnF1VUZhVytEbUttZDFTTzZEaUNKTXFMMmtjOU8x?=
 =?utf-8?B?UDZ1anljZkwxZVFteVJjbnVCM3dUZ3IxU3BKNm1GUjc2YW5ZM1EwS1d2RFAr?=
 =?utf-8?B?VUsyZnVwL2FHK2ZUSDJ1ZEtCajJWQThFbEpPVnJKUVVhVmpQMm9yZW5iVXNy?=
 =?utf-8?B?T2RBS0hpZk1WSWpLRmhFaGVLYWc4Y1JhU2FuTE5QTDdLaEZrMmJFV1lOeXVl?=
 =?utf-8?B?ZUIzWUh5REtmbm9Qa2owUmZVWUlNakNSL0JPQlBwSWR1YmlpdkFBUm1xK2Zp?=
 =?utf-8?B?a3VpRGQxSWNUM2F4eTZUUHIvV2xLTitWY3hkUi92RUFUYXhNZ0k3emN4VlJE?=
 =?utf-8?B?ZmJ4M01tQ2dmRk1OWERMTUp0anRJY0ROSmQ3eXZRdUJNQ3dkTFRoaFZiNWx0?=
 =?utf-8?B?SmlZZm14cllSYVkvaXNKSyszbE5peVJ0dkF4VXdOM0ZKT25oVlEwUFd4T3Vi?=
 =?utf-8?Q?LN19D/V6Jlxd3wDnMnpeDKMwdl3jbfOn?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aThPUUVaSXptdFQ2Q3Y4VEFUVTRJMmwwckNaSHlocWk1VzZHbTh2RDBzNGJi?=
 =?utf-8?B?RE5UVXo5R3YzanE0UGJydkk0cGxnd0l5QURUNllhQXpHRWRuZzZyZG1neHN5?=
 =?utf-8?B?eW5qQnAwS2tmdnhvWWp1bDNqQmRRcGtpV2Q5RjlMMVNLV2VnVndxM0FpSWFv?=
 =?utf-8?B?eTRhcUJKbUlsV09Nek5Uc0F5Y3B3QlVOa0xiRDBMYloyNFlqeUVlelRKNGZv?=
 =?utf-8?B?SDBpQk4vQ1FNWUdvMWtnUXRYa2h2cERWTUxLV0NZYWtCcGJIZ2RnemNXdTR5?=
 =?utf-8?B?N21jRm9LZ2Z1NjFXY0d0VnpNTC9EZytFaDdDK3pSeWFqN0NwNVo5ZnczVlFU?=
 =?utf-8?B?L2ViaVkzTFNjckhsS09BcktUNG9XM1RhKzE5RTR2ZE5NYWVBbjZMWHJkQWRF?=
 =?utf-8?B?WlhXWW5lWDg0eUZRVUgrVHBKYXZCaTIxSysxQnFzQ0JhNzNIM0ZvODBsc281?=
 =?utf-8?B?ZEN3SE9iOEY3WGNLQzJaZWUwZG9KdDU3ZkRDZndhRzd1NXg4blFGYUk0UTNB?=
 =?utf-8?B?M0FUSWtEcytkRnQzYWNWRUtaVnRqZVB3Rm9NUEhpNXFMUkVwQXlibFF4UXla?=
 =?utf-8?B?Tm5sRE1WTWtPUlJPSENheUJxbGxpZmJOUDVIWklxNjJEaWl0NEFpK1V6Tytj?=
 =?utf-8?B?dmRKc216VXNBNnp5dnZJek1RZEtBL25SYWNVZVNPQ1IzQnFmNENEamNKaDlM?=
 =?utf-8?B?bnUwdXJtOXJNYy9qV2RjQmlCTklNODMwMzhySWlsd2hWTU1hQktZUGFUdUgw?=
 =?utf-8?B?a1JERnFBaVBkeTQxSW5QYXFlQnpFTFZVZW9BYkhjVnJBQUExWFVCbmlxUEU5?=
 =?utf-8?B?TFV2SUd5c3B0cW5UZXJubVB0VDNWQjVwbVhleTdiK0RBWWVVaHpkZ3ZaVkpI?=
 =?utf-8?B?TllHWVVsWUUydVFKZ2x3N0p6QUh1QU9qaHhnR0JNNWk3NjhvZWlsYTZmdmc2?=
 =?utf-8?B?ZndURE5zcjRlcTNaNEpRd3FtU2tzdTZ1Y1ltWHFxSTM1RkFzbnZ4L0Nxa2JW?=
 =?utf-8?B?OHVzRk43Qk5hSnlNV1RBVkVhN0MvUG9UWUdEMTcwdWZpKzVQQU80VU50T05K?=
 =?utf-8?B?REZBNTc4dlhGRS9mQldaRGxmOEVpODJacUR2MXRkMHdmQnQ3RzRTUXZkZVZI?=
 =?utf-8?B?VUxJL2RqcjdQdERSOGpsKy9QajBlMEl6TzBKS2kwRTQvb3lrWWtBTDkrNWdo?=
 =?utf-8?B?T3JwbXAyckltKzZndi9lOFJzY1d5VTk4QW5Ick84bmxpQkI5a21mQ21VVFZZ?=
 =?utf-8?B?eEtTa2hvUkJvRTlkaVVmc283S1dBQVpXSHZrOVNOUUdadjY1eXFXSHZ5czhq?=
 =?utf-8?B?bkhGSTFUTEhEdkc5RWFvd3plblpIWnJWanJFalhhN21iOXdtd29FSk1nTmpK?=
 =?utf-8?B?K0tNTUFTbXRMSVRJWlRJalMzQ3l2S3E1dVdwWTRXcW0zN01SbXZobldlZXEr?=
 =?utf-8?B?WHlScmgrOFFoMTVicWFoeUU3Rm5FWXpyN3RScSszLzBZcWUyeFNtQjYya09D?=
 =?utf-8?B?MU5mUlZVT1Nob3lXNlluV3BWV2EwZlJtdDB1TnNjeFk1Y1crNmNHME4xK3pa?=
 =?utf-8?B?dzU4MEVRWDF1c0dRaXQ0QW16RU5yZmd2ejVUUnk5NHRqOVpvUGRKWHc2dE5j?=
 =?utf-8?B?SHN2U2VOU0FmSkk5TS9SSzQ4a2lUZ2RMRHhhRUhLMEV3QWhFUDRZbnZQUVNz?=
 =?utf-8?B?U2pWajd0REREbEM2U3hHd0kzdmM0M2RxSmE5Rit0R3NQVTNBUTFWb2d5NlNi?=
 =?utf-8?B?bUdPcDV4aFl0VTQ1MmhhaDlrRGdCT1Nzc05wV1JSK0F2d2FqRWxGOHNtU3BN?=
 =?utf-8?B?Mmw2YjRkMkpDazkxSG51akp1WVlYOU13a1lvZHc4TWpsVTlCZmVoMVNqS01H?=
 =?utf-8?B?b3l6MVhybnNjUkZGa25BSEpqQ1NkVkZDS0l3cFdNQ1ptQ0ZYUGdKT3pmTE8v?=
 =?utf-8?B?U1dBM0JzU2FVUWZEclJaZFBRTXRHSFkwcEUyUVpKeE9SamtWTnVjeHd2V1Zh?=
 =?utf-8?B?dWxnNUloczh6cGwzSncxYkpHdGoyekhGeVBrTlRxb1hJekRuWHZ2NDR3T3BM?=
 =?utf-8?B?UElwWFFiQ2dHVDY0M2xJelJ4U2dHcWNuakJSa3Zqei9NckxzMXR3cXNPL1RZ?=
 =?utf-8?B?R0d1bS9GYWl2ZFFzaTlpV0NHT3Rlcit2YUQ4SXBEVUJ4eUxSR1lLMDZOaGF6?=
 =?utf-8?B?d2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3953e9b4-b015-4f05-1ab2-08de1349fc61
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2025 22:09:22.2644 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E9qx6DeWrASJu+At0hHK6wRQhFZOA+XuVDENA6rSzjBUzjzJUIL27KHC/bkesCh2lQErsOByj5xA96qI0ayDUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7916
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



On 2025-10-24 5:49 p.m., Michal Wajdeczko wrote:
> 
> 
> On 10/24/2025 9:19 PM, Zhanjun Dong wrote:
>> The fault injection test can cause the xe_huc_auth function to fail.
>> This is an intentional failure, so in this scenario we don't want to
>> throw an assert and taint the kernel, because that will impact CI
>> execution.
>>
>> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
>> ---
>> History:
>> v2: Update commit comments (Daniele Ceraolo Spurio)
>>      Remove warning comment (Dixit, Ashutosh)
>> ---
>>   drivers/gpu/drm/xe/xe_uc.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
>> index 465bda355443..c94b828cc24f 100644
>> --- a/drivers/gpu/drm/xe/xe_uc.c
>> +++ b/drivers/gpu/drm/xe/xe_uc.c
>> @@ -218,9 +218,9 @@ int xe_uc_load_hw(struct xe_uc *uc)
>>   
>>   	xe_guc_engine_activity_enable_stats(&uc->guc);
>>   
>> -	/* We don't fail the driver load if HuC fails to auth, but let's warn */
>> +	/* We don't fail the driver load if HuC fails to auth */
>>   	ret = xe_huc_auth(&uc->huc, XE_HUC_AUTH_VIA_GUC);
>> -	xe_gt_assert(uc_to_gt(uc), !ret);
>> +	xe_gt_err(uc_to_gt(uc), "Huc authentication failed:%d\n", ret);
> 
> s/Huc/HuC
Sure>
> this will always print an error message, also for success:
> 
> 	*ERROR* HuC authentication failed:0
> 
> and in case of real error it will be redundant since in xe_huc.c we already print similar messages
> 
> maybe just say that we acknowledge that HuC error (printed in a friendly way)
> and that we decided to move on:
> 
> 	if (ret)
> 		xe_gt_notice(gt, "Continuing with no HuC (%pe)\n", ERR_PTR(ret)
> 
Thanks, xe_gt_err looks redundant. Will be fixed in next rev.

Regards,
Zhanjun Dong>
>>   
>>   	/* GSC load is async */
>>   	xe_gsc_load_start(&uc->gsc);
> 

