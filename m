Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81410C87FD2
	for <intel-xe@archiver.kernel.org>; Thu,  7 Aug 2025 18:10:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4508310E3D9;
	Thu,  7 Aug 2025 18:10:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Yotl8+I8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 254FF10E3D9
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Aug 2025 18:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754590237; x=1786126237;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Iq8VuH7hRSYB1JOx7QRdSBoRX56jO28AtxvhybK2Buo=;
 b=Yotl8+I8oEOus9s+H8T1PxFvxevPsGrYydJJ56kGJBeDrgZ398Znrfxp
 0WJZ/IYRyFspeg8kIpTfmJnWlgehHl2RYrLnb4CY+aQCoYmx2mPlo0Q0Y
 VIgnMnUmccDkVorvL3RZh1KYHoMwH1XnsMaWA82hsrAtqwTv4LLgdSvVQ
 opzRzW5a2G9yYCWyiWpKqJTT+1WsVg4TG00trmX10JVZsm8xRiiE5+2Oj
 xE4lVCPEVBK9mSGatujAdf/XtXgtO+xWW37VSSnKXSCGWNHRQ1+63HFcQ
 hCi7F0/EF9O/KivqJywJ35+Yg2Mft8Cs0sd6BeTEzXc9qdGaGbxvVWVwN w==;
X-CSE-ConnectionGUID: QVOYxkLiSrG7dZqOTUn7Mw==
X-CSE-MsgGUID: 5WQn+bkNQpqflEz8S8T8gg==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="57069138"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; d="scan'208";a="57069138"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2025 11:10:36 -0700
X-CSE-ConnectionGUID: NXAWqTepSR6rc5mB+p3J+g==
X-CSE-MsgGUID: e7l6IH7kSI2q0cBPwa/NBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; d="scan'208";a="195960165"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2025 11:10:36 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 7 Aug 2025 11:10:35 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Thu, 7 Aug 2025 11:10:35 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (40.107.212.52)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 7 Aug 2025 11:10:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UO0uXXr8r8R3shHEJ6UVIhlPYP84d14MtXjw03wFV01LSri8CrckeKpcJGfka6AeTYATfOTv5HdhVMXYZ0H39Uiw+zwEFUtEKA5AY0WV33HvOxlamL9VjyMNvh+HmzzhGtZaegPTNbKiLiJ+rtPv8k+kaQhix/czygDsQTrURkW5vZj4t0Xlc32LnWuLS0MuQQW9OmBNim1UfKqnXn8wBetNyA1+aFzMbXiD6W5waL6sobOiqyUOVw5rOBBygXwncTyRE0t4kAJX193Fm1fLEAbNOW1Def6SlXkOzLU4+kefCYEQIhgxZmwrxY7aU3fvGqkEhDy7u+wycmPt0J/2GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8erFtfW7wptAK59s7h4jPcaWonk1upooH4L0w3PAZsc=;
 b=boNKr1HoHJmyYNNnkt1UsYZYpXHjUnQNCXjmm+w9T3c0889zRY6Vlr0RV521e9MBbA6sFvr0aNBNOaRhnOZQP4Zb/d3PMITMbNCBHpGJLrRf6CuX68+9sRpr60agZ3VL37Wig4ta+LTzHFvtnD31evnh2tAMw+be4iNUQjYUq20ZQN5bDC0urAlHI7XYLnOEqR+1RaQ4tdd6DgUTqvQYZUzB0mpnMf5vsd0GrzRwvXnGQZJpSgo6GKqeDKIVptrqvxmss0nQhqzrcFmj3b/C3bLdR2UjQ326FMBVg1MsE+G0WCxhddy7lxDpQ2W9xGCEsQCWiLs4NQCbemI/UEDpQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA1PR11MB6760.namprd11.prod.outlook.com (2603:10b6:806:25f::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.17; Thu, 7 Aug
 2025 18:10:33 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9009.013; Thu, 7 Aug 2025
 18:10:33 +0000
Date: Thu, 7 Aug 2025 11:10:30 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Dugast, Francois" <francois.dugast@intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>, "Mrozek, Michal"
 <michal.mrozek@intel.com>, "thomas.hellstrom@linux.intel.com"
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH 01/11] drm/xe: Stub out new pagefault layer
Message-ID: <aJTsFpVkoH77b6A0@lstrano-desk.jf.intel.com>
References: <20250806062242.1090416-1-matthew.brost@intel.com>
 <20250806062242.1090416-2-matthew.brost@intel.com>
 <afdc621f35edb08a9c161e4e08bfa5c74eecad1f.camel@intel.com>
 <aJPq9KNMFVegkdkN@lstrano-desk.jf.intel.com>
 <34a741ad4bf9765e3ca98eba65b1ebc4ee8730e4.camel@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <34a741ad4bf9765e3ca98eba65b1ebc4ee8730e4.camel@intel.com>
X-ClientProxiedBy: MW4PR03CA0217.namprd03.prod.outlook.com
 (2603:10b6:303:b9::12) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA1PR11MB6760:EE_
X-MS-Office365-Filtering-Correlation-Id: ae2e3c0a-aef3-4a5b-ff51-08ddd5ddb36c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MHZ4TGdVSVRKZUQ3L2ZwNjFYUXBrZUxoeHN6S1EvdEcweitIRzNJa0Y1aDJz?=
 =?utf-8?B?TmhxTkNyak5RTG1DbVY1YzB2bXVEZnYzVG4yOGRBSWRac01IVkdJV2JWMlgz?=
 =?utf-8?B?R2VCRU82M3d3MUJmWkJDci9DckZudjZBTStjUEpMem5ZYzZBNVdnMm1HdzRh?=
 =?utf-8?B?MmQxemV2c1RxNjFqcWxjSUZRZ0Yzc3pCMTFEcXAzNkpLVi9makhJNnhkTmpk?=
 =?utf-8?B?aG51T0hOQlZWMkhTYzRPZzFIaUtVdlErK25pckgzOTRQOUZRVFpDa1FvUWJF?=
 =?utf-8?B?YTBtRENrVTVaZFVybERsN2xTV09ZZ0pXMml1ejdSSElvcGRRVGFOckRZSjBM?=
 =?utf-8?B?NmxpdXN0bXN1WEpnVFltZGhORHRoNXJwaGRDdThrdnlkU2V3NHRJakUxQVNv?=
 =?utf-8?B?Y0ViRm5SeC9sV3ovd2c1aW9LNyszaGNVZ2Jsbzdud0RiUVpUVHhEMWpHZmtK?=
 =?utf-8?B?ZlpGZ21BYzMwWWdyT0VNWDBKTWh1WWU4Rm9Sd295RVBUZHRGOHdmdSt1Wm9j?=
 =?utf-8?B?UFBBMmlvaHQ3QjRrdHFPOGc2YmhMU003Y1l5V3p0Vkpzbi9TbkxyNTVuZGJy?=
 =?utf-8?B?SVkzQmtMcTFPcGlzcmFXTzVVdE9jSWY0Y0YyV3hUYmFuRzNJM2Q0NzNhUnVh?=
 =?utf-8?B?UER2S1dtRDdGdXo0cmI2OVNOOCtieU1kamFCdmdjbEJnZUJld21YZ0pSRVMz?=
 =?utf-8?B?VHZqRVhLajRJYVdld0lLNEdncmJrWVRJeTdneWFuWVJiS3hVUkl5SkVTbnB4?=
 =?utf-8?B?M25rV3dnRVJybTQwSHdTNitlSXdTVGJ4SHN1TEdGbE9hOUdiakU3SkJJS1Fq?=
 =?utf-8?B?ZGJFbE84V1puRWtOUjJiT011Um45Ykt6Y3RCRkhrOVJrT2dPTVJOOEQ5QTFB?=
 =?utf-8?B?L2Y1Y2YzTWs5cWRPaGdIWStDbWU5NjNERGdrQjNpM2dvU0VFMlYvblRsZEw0?=
 =?utf-8?B?WEozaklHeHdsOUZGM2dCenpiWUhUK2V3VHc1TGUzNTVFWDFCS2Z3SExteEVP?=
 =?utf-8?B?QTNtY200M25SNG0xOXRUVzNCWnZvSnJTcXlRREhUUXNDUis2QlVTTkJ6T0t1?=
 =?utf-8?B?Q3lRbXdqYlpOYUg0Znd3ZCtNck14WEt0aHZFMWJtYTJrNElBcGdKamtZQlMv?=
 =?utf-8?B?YTZicFpuUXFuNHFZVzg3T0liR0FZWnZSeGRtZEhVbkZSVk1ZZjY0ZnFFNGw3?=
 =?utf-8?B?cVh4L0dWUUpHTGVRQkRxdGErVEF2ZGpaMzgzR2VCeWhHQnBraGVreCtUbG9x?=
 =?utf-8?B?MFBHdHNkelZYSm53QUprUURVa2lmTUx2b3BrcHlsNm9XSERnRlNRZHdyUHJl?=
 =?utf-8?B?MGtiL0FpcWwxMmtwbEJ4UGVzdk9sb2RacTUrV01jSDVtTTA0WWRLYURGSXVC?=
 =?utf-8?B?VzFjUlRHK3c1ZnJtRDdYMUFic0hWc2Z3Ymt2VkV2UFlsUm1qRmM1bTlMbXFQ?=
 =?utf-8?B?ZFU0T3AvNThBU0c3a3E3YkdodE9hMWQ1VTlOLzhnQzBTdUQrbTFjTDFzNFJX?=
 =?utf-8?B?ZGhZWVJIRmVUNm9XR21YQU85V3JyNE1MNjZWY09LK0J0U2NsR1dZSkQ0L0FR?=
 =?utf-8?B?UkV3NHZIeTNhcmxFaW94ZTdpVzVqbWxlWkZGTW5zdnhZZGpWaHE4eHhZTE5n?=
 =?utf-8?B?cER5T2tla0R6cFV5SVgyMXEzS1R3Sm9PWWk4Ylh3a2lWZy9KTXYrOUIzUmxy?=
 =?utf-8?B?cytmcXlDVHdrUEFpV2RqRU13QnFpUFYwTmdpS2JDUjQrS1o0REJaT0VRZHp6?=
 =?utf-8?B?WGNTMUpWaHZCZ2R3K0xsWmpQUjdFMGJjZVpRTlVTYzdFSS9WQTZLRUdZeGtE?=
 =?utf-8?Q?DQtbhkxx6ex9CO+gMaEkpmOOKm4gPD5kUU0W0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UkpybVlLbkV4azFkYlh2SFc1UE0yRFd1YnpwUWlMZjhOK3czSVBOTFoxZzYz?=
 =?utf-8?B?d1h0OHlpakRQL3Z4bHRiMjU3ZFAvbHBtaGhGOXhETlBEOWdtSkplM0x3Qzkx?=
 =?utf-8?B?dW5lWXh2SXBTMmRQZjJEbXh5YU1jcE9ieXVTNmxmWWFwV1FrTUJIanYwU2po?=
 =?utf-8?B?Z3g1dVJzM1k0M295RW91L2RuM2h4T2pab0pqVUVVNm80K1gyTjFNb1FpSnRu?=
 =?utf-8?B?Nm93VVJqU28yOWhod1VBY29DQWdFQnQxTlk0TEFnRVdRdEw5OGZEZ3JPT095?=
 =?utf-8?B?SmJxV3Z3WmVXc1g4S1NiekZ2UVB2VERsRVNJaUN6RUVybEhJakx1dThnL3ln?=
 =?utf-8?B?WjRrZzQ4TmJhQzZrZVVIRkgyTUNlcE5KOGVacW05MktucGdSOWpaZCtPczNN?=
 =?utf-8?B?ZVM5dFpQT0U4Sm1pRC9VSHgwdjdjalR6bTJkNjhRUVhHSExSV05GdnJGU0NF?=
 =?utf-8?B?bjRKVlZnWUVqbVJkclhFbVJpZm1uZmhIN3B2T1ErS1BUYTFhbXpITFNhQ21O?=
 =?utf-8?B?cU9VWkI0NEpZazJ1d01JWFE4MXNpbE85dktaSGJrdzV3RExOM0wyREIxSFNz?=
 =?utf-8?B?MU5EbXovL2dIRDcrT0lDWk81TkNGVmN6Z2d4V0hha0NtVkp2bi81TUZWUXA0?=
 =?utf-8?B?WktSdEFDOXRhWnZ4blZvNy9qdnF1b3FobE1RU2tpckhaYnp1dGNwS090cU16?=
 =?utf-8?B?L0dGSzREeE1GYkg2eEF1NUhNek5vMHlkd0JCRlJ3bkgycjBndzJkQWdwTjA2?=
 =?utf-8?B?ZDB4a3RLYmJGdnRsaVc4akhNeHVaSldMSUFZckhZUGIzZmE3SmVoalp4bmJO?=
 =?utf-8?B?WGdaQW0xTEJrQVJHMjUxWHdVcEZVQXdqWmd2aXFvTEtkNVhFbktnWTIxcFR5?=
 =?utf-8?B?K0M0NGk0U3JGSEZwc3VRcHRRZWVKczhxN1FXN0VMVEZFMThkWGkvMHh0TFVj?=
 =?utf-8?B?S1dGaDFmVmRmck9uNTRrSnRaZVh6KzZrL29Gb0FhY01vakF0ZnUvZkpkd2lr?=
 =?utf-8?B?N1poMHc4Um42Yk1ZVHhYWnA5Y0JYZ2hpR3ZuT2s0YzlvSmd0QVpUb20vV21N?=
 =?utf-8?B?UkE2ZzBySXJDZnloMXl5c3JwekFBQVI4RFZidG5aVjBzRGxRZEZ0bVEwcFE1?=
 =?utf-8?B?OUlxZ2FqQy83bUg5R0IwRm53T3VpUTZvVmJ3bHZmUm95U2IvYWZPcEhDTmJ0?=
 =?utf-8?B?eHBEbE5SVFpyNmk4RFh3T29STHNpTUJhaDBvNHFzU0JNS0tmZE0xOXJtVkZJ?=
 =?utf-8?B?MzhHbjdybUVJaVJpajdYZ1BRVFYzbWVtbThkZk4yME91cm1DUkoydUNwK0lG?=
 =?utf-8?B?c3VoWTJ3YjRIYlpldGhDWVZJZERtQ0h1d0svc3hFeG5sOFVUSUw3SVRwK213?=
 =?utf-8?B?K3ZyRWFGM3JLbVBNZ0p2NnJGYS9VK1FuU0ZZeFhxYk83ZEFGVUlYWnZvR3Jh?=
 =?utf-8?B?djFhZlplc05JOGkwRlhoWHdqYllTbGtkTnRoVm01WXlzeVNnTDUyRE1CWnFh?=
 =?utf-8?B?TS9PWkg2YkNuT1hUVkh3NHAyY3dOazAvUWdpTW9EQWswS2FFdVlqSThJNFBL?=
 =?utf-8?B?VDRhUXJPaWZWUkliZGhNUkFmbTIyZGh3bDMvbGRUVlNIam4rajRYb2N3WUdR?=
 =?utf-8?B?dWtJaFFCNzQyWHgrL3R3c2I1NVFBMlBjVHBjbXdmV0lzc0JvbkVFUEZXSEZ1?=
 =?utf-8?B?RzYwWEZHYngxZ1h3Ynk4N2ZLTUY5UDRRU1RSTko3cXhtY1hmNVUxRGhoZGJs?=
 =?utf-8?B?SGVZVTlzN1NJcUM1d2dKTk1tMWNDcWlKSlFkYkt4OHk0R1lzMnBhejM3Y29s?=
 =?utf-8?B?bWlVZEZ3VGtIZlZVTitLTnArRXFkOXBjd2MzUTd5Y3VYVSsvOU9nbHJuYUh3?=
 =?utf-8?B?YTZLSkttVThLYVJ5SzZOdXZnVHBxTjN1THg3SjZJTWhYQStxTHJaZXFwT3Q2?=
 =?utf-8?B?WXhLdUhPR3hyby9vWjk1ZGw3SXB4cll6bkhqTmpDL0tuOHlHN3NkTGFpeUxm?=
 =?utf-8?B?Rno4VmkrSFRjZzlSMkVXbUJ6b0hNaUpHUkcreTBDMlJlWERhL2xUNEhIOVI0?=
 =?utf-8?B?VWJIeHcwa0NYdjVMT1grVEJORHdtOGtSN1lIOXF6MmNMTzA4bFRtdjJhV1BM?=
 =?utf-8?B?VkNkck00c1BwT01KTUZkSXhVUXpiNGNOVzRuemNzZm9yVjZ4TGF2U3YrUG16?=
 =?utf-8?B?UXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ae2e3c0a-aef3-4a5b-ff51-08ddd5ddb36c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2025 18:10:33.3226 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BDqvDgjsdbjQEP4efEMEfQGaQPnMtGpUzcNnajo3J6V6N+XvDtQdzQUPtv+dX7Xe+gEBPgTRwexhM6gBunjaKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6760
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

On Thu, Aug 07, 2025 at 11:20:06AM -0600, Summers, Stuart wrote:
> On Wed, 2025-08-06 at 16:53 -0700, Matthew Brost wrote:
> > On Wed, Aug 06, 2025 at 05:01:12PM -0600, Summers, Stuart wrote:
> > > Few basic comments below to start. I personally would rather this
> > > be
> > > brought over from the existing fault handler rather than creating
> > > something entirely new and then clobbering the older stuff - just
> > > so
> > > the review of message format requests/replies is easier to review
> > > and
> > > where we're deviating from the existing external interfaces
> > > (HW/FW/GuC/etc). You already have this here though so not a huge
> > > deal.
> > > I think most of this was in the giant blob of patches that got
> > > merged
> > > with the initial driver, so I guess the counter argument is we can
> > > have
> > > easy to reference historical reviews now.
> > > 
> > 
> > Yes, page fault code is largely just a big blob from the original Xe
> > patch that wasn't the most well thought out code. We still have that
> > history in the tree, just git blame won't work, so you'd need to know
> > where to look if want that.
> > 
> > I don't think there is a great way to pull this over, unless patches
> > 2-7
> > are squashed into a single patch + a couple of 'git mv' are used.
> 
> No definitely don't think that's worth it. Let's just review as-is.
> 
> > 
> > > On Tue, 2025-08-05 at 23:22 -0700, Matthew Brost wrote:
> > > > Stub out the new page fault layer and add kernel documentation.
> > > > This
> > > > is
> > > > intended as a replacement for the GT page fault layer, enabling
> > > > multiple
> > > > producers to hook into a shared page fault consumer interface.
> > > > 
> > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > ---
> > > >  drivers/gpu/drm/xe/Makefile             |   1 +
> > > >  drivers/gpu/drm/xe/xe_pagefault.c       |  63 ++++++++++++
> > > >  drivers/gpu/drm/xe/xe_pagefault.h       |  19 ++++
> > > >  drivers/gpu/drm/xe/xe_pagefault_types.h | 125
> > > > ++++++++++++++++++++++++
> > > >  4 files changed, 208 insertions(+)
> > > >  create mode 100644 drivers/gpu/drm/xe/xe_pagefault.c
> > > >  create mode 100644 drivers/gpu/drm/xe/xe_pagefault.h
> > > >  create mode 100644 drivers/gpu/drm/xe/xe_pagefault_types.h
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/Makefile
> > > > b/drivers/gpu/drm/xe/Makefile
> > > > index 8e0c3412a757..6fbebafe79c9 100644
> > > > --- a/drivers/gpu/drm/xe/Makefile
> > > > +++ b/drivers/gpu/drm/xe/Makefile
> > > > @@ -93,6 +93,7 @@ xe-y += xe_bb.o \
> > > >         xe_nvm.o \
> > > >         xe_oa.o \
> > > >         xe_observation.o \
> > > > +       xe_pagefault.o \
> > > >         xe_pat.o \
> > > >         xe_pci.o \
> > > >         xe_pcode.o \
> > > > diff --git a/drivers/gpu/drm/xe/xe_pagefault.c
> > > > b/drivers/gpu/drm/xe/xe_pagefault.c
> > > > new file mode 100644
> > > > index 000000000000..3ce0e8d74b9d
> > > > --- /dev/null
> > > > +++ b/drivers/gpu/drm/xe/xe_pagefault.c
> > > > @@ -0,0 +1,63 @@
> > > > +// SPDX-License-Identifier: MIT
> > > > +/*
> > > > + * Copyright © 2025 Intel Corporation
> > > > + */
> > > > +
> > > > +#include "xe_pagefault.h"
> > > > +#include "xe_pagefault_types.h"
> > > > +
> > > > +/**
> > > > + * DOC: Xe page faults
> > > > + *
> > > > + * Xe page faults are handled in two layers. The producer layer
> > > > interacts with
> > > > + * hardware or firmware to receive and parse faults into struct
> > > > xe_pagefault,
> > > > + * then forwards them to the consumer. The consumer layer
> > > > services
> > > > the faults
> > > > + * (e.g., memory migration, page table updates) and acknowledges
> > > > the
> > > > result back
> > > > + * to the producer, which then forwards the results to the
> > > > hardware
> > > > or firmware.
> > > > + * The consumer uses a page fault queue sized to absorb all
> > > > potential faults and
> > > > + * a multi-threaded worker to process them. Multiple producers
> > > > are
> > > > supported,
> > > > + * with a single shared consumer.
> > > > + */
> > > > +
> > > > +/**
> > > > + * xe_pagefault_init() - Page fault init
> > > > + * @xe: xe device instance
> > > > + *
> > > > + * Initialize Xe page fault state. Must be done after reading
> > > > fuses.
> > > > + *
> > > > + * Return: 0 on Success, errno on failure
> > > > + */
> > > > +int xe_pagefault_init(struct xe_device *xe)
> > > > +{
> > > > +       /* TODO - implement */
> > > > +       return 0;
> > > > +}
> > > > +
> > > > +/**
> > > > + * xe_pagefault_reset() - Page fault reset for a GT
> > > > + * @xe: xe device instance
> > > > + * @gt: GT being reset
> > > > + *
> > > > + * Reset the Xe page fault state for a GT; that is, squash any
> > > > pending faults on
> > > > + * the GT.
> > > > + */
> > > > +void xe_pagefault_reset(struct xe_device *xe, struct xe_gt *gt)
> > > > +{
> > > > +       /* TODO - implement */
> > > > +}
> > > > +
> > > > +/**
> > > > + * xe_pagefault_handler() - Page fault handler
> > > > + * @xe: xe device instance
> > > > + * @pf: Page fault
> > > > + *
> > > > + * Sink the page fault to a queue (i.e., a memory buffer) and
> > > > queue
> > > > a worker to
> > > > + * service it. Safe to be called from IRQ or process context.
> > > > Reclaim safe.
> > > > + *
> > > > + * Return: 0 on success, errno on failure
> > > > + */
> > > > +int xe_pagefault_handler(struct xe_device *xe, struct
> > > > xe_pagefault
> > > > *pf)
> > > > +{
> > > > +       /* TODO - implement */
> > > > +       return 0;
> > > > +}
> > > > diff --git a/drivers/gpu/drm/xe/xe_pagefault.h
> > > > b/drivers/gpu/drm/xe/xe_pagefault.h
> > > > new file mode 100644
> > > > index 000000000000..bd0cdf9ed37f
> > > > --- /dev/null
> > > > +++ b/drivers/gpu/drm/xe/xe_pagefault.h
> > > > @@ -0,0 +1,19 @@
> > > > +/* SPDX-License-Identifier: MIT */
> > > > +/*
> > > > + * Copyright © 2025 Intel Corporation
> > > > + */
> > > > +
> > > > +#ifndef _XE_PAGEFAULT_H_
> > > > +#define _XE_PAGEFAULT_H_
> > > > +
> > > > +struct xe_device;
> > > > +struct xe_gt;
> > > > +struct xe_pagefault;
> > > > +
> > > > +int xe_pagefault_init(struct xe_device *xe);
> > > > +
> > > > +void xe_pagefault_reset(struct xe_device *xe, struct xe_gt *gt);
> > > > +
> > > > +int xe_pagefault_handler(struct xe_device *xe, struct
> > > > xe_pagefault
> > > > *pf);
> > > > +
> > > > +#endif
> > > > diff --git a/drivers/gpu/drm/xe/xe_pagefault_types.h
> > > > b/drivers/gpu/drm/xe/xe_pagefault_types.h
> > > > new file mode 100644
> > > > index 000000000000..fcff84f93dd8
> > > > --- /dev/null
> > > > +++ b/drivers/gpu/drm/xe/xe_pagefault_types.h
> > > > @@ -0,0 +1,125 @@
> > > > +/* SPDX-License-Identifier: MIT */
> > > > +/*
> > > > + * Copyright © 2025 Intel Corporation
> > > > + */
> > > > +
> > > > +#ifndef _XE_PAGEFAULT_TYPES_H_
> > > > +#define _XE_PAGEFAULT_TYPES_H_
> > > > +
> > > > +#include <linux/workqueue.h>
> > > > +
> > > > +struct xe_pagefault;
> > > > +struct xe_gt;
> > > 
> > > Nit: Maybe reverse these structs to be in alphabetical order
> > > 
> > 
> > Yes, that is the preferred style. Will fix.
> > 
> > > > +
> > > > +/** enum xe_pagefault_access_type - Xe page fault access type */
> > > > +enum xe_pagefault_access_type {
> > > > +       /** @XE_PAGEFAULT_ACCESS_TYPE_READ: Read access type */
> > > > +       XE_PAGEFAULT_ACCESS_TYPE_READ   = 0,
> > > > +       /** @XE_PAGEFAULT_ACCESS_TYPE_WRITE: Write access type */
> > > > +       XE_PAGEFAULT_ACCESS_TYPE_WRITE  = 1,
> > > > +       /** @XE_PAGEFAULT_ACCESS_TYPE_ATOMIC: Atomic access type
> > > > */
> > > > +       XE_PAGEFAULT_ACCESS_TYPE_ATOMIC = 2,
> > > > +};
> > > > +
> > > > +/** enum xe_pagefault_type - Xe page fault type */
> > > > +enum xe_pagefault_type {
> > > > +       /** @XE_PAGEFAULT_TYPE_NOT_PRESENT: Not present */
> > > > +       XE_PAGEFAULT_TYPE_NOT_PRESENT           = 0,
> > > > +       /** @XE_PAGEFAULT_TYPE_WRITE_ACCESS_VIOLATION: Write
> > > > access
> > > > violation */
> > > > +       XE_PAGEFAULT_WRITE_ACCESS_VIOLATION     = 1,
> > > > +       /** @XE_PAGEFAULT_TYPE_WRITE_ACCESS_VIOLATION: Atomic
> > > > access
> > > > violation */
> > > 
> > > XE_PAGEFAULT_TYPE_WRITE_ACCESS_VIOLATION ->
> > > XE_PAGEFAULT_ACCESS_TYPE_ATOMIC
> > > 
> > 
> > The intended prefix here is 'XE_PAGEFAULT_TYPE_' to normalize the
> > naming
> > with 'enum xe_pagefault_type'.
> 
> Ah sorry you're right. I also should have been more specific that I
> meant this should be ATOMIC access vs WRITE access, so:
> XE_PAGEFAULT_TYPE_ATOMIC_ACCESS_VIOLATION
> 
> > 
> > > > +       XE_PAGEFAULT_ATOMIC_ACCESS_VIOLATION    = 2,
> > > > +};
> > > > +
> > > > +/** struct xe_pagefault_ops - Xe pagefault ops (producer) */
> > > > +struct xe_pagefault_ops {
> > > > +       /**
> > > > +        * @ack_fault: Ack fault
> > > > +        * @pf: Page fault
> > > > +        * @err: Error state of fault
> > > > +        *
> > > > +        * Page fault producer receives acknowledgment from the
> > > > consumer and
> > > > +        * sends the result to the HW/FW interface.
> > > > +        */
> > > > +       void (*ack_fault)(struct xe_pagefault *pf, int err);
> > > > +};
> > > > +
> > > > +/**
> > > > + * struct xe_pagefault - Xe page fault
> > > > + *
> > > > + * Generic page fault structure for communication between
> > > > producer
> > > > and consumer.
> > > > + * Carefully sized to be 64 bytes.
> > > > + */
> > > > +struct xe_pagefault {
> > > > +       /**
> > > > +        * @gt: GT of fault
> > > > +        *
> > > > +        * XXX: We may want to decouple the GT from individual
> > > > faults, as it's
> > > > +        * unclear whether future platforms will always have a GT
> > > > for
> > > > all page
> > > > +        * fault producers. Internally, the GT is used for stats,
> > > > identifying
> > > > +        * the appropriate VRAM region, and locating the
> > > > migration
> > > > queue.
> > > > +        * Leaving this as-is for now, but we can revisit later
> > > > to
> > > > see if we
> > > > +        * can convert it to use the Xe device pointer instead.
> > > > +        */
> > > 
> > > What if instead of assuming the GT stays static and we eventually
> > > remove if we have some new HW abstraction layer that isn't a GT but
> > > still uses the page fault, we instead push to have said theoretical
> > > abstraction layer overload the GT here like we're doing with
> > > primary
> > > and media today. Then we can keep the interface here simple and
> > > just
> > > leave this in there, or change in the future if that doesn't make
> > > sense
> > > without the suggestive comment?
> > > 
> > 
> > I can remove this comment, as it adds some confusion. Hopefully, we
> > always have a GT. I was just speculating about future cases where we
> > might not have one. From a purely interface perspective, it would be
> > ideal to completely decouple the GT here.
> >  
> > > > +       struct xe_gt *gt;
> > > > +       /**
> > > > +        * @consumer: State for the software handling the fault.
> > > > Populated by
> > > > +        * the producer and may be modified by the consumer to
> > > > communicate
> > > > +        * information back to the producer upon fault
> > > > acknowledgment.
> > > > +        */
> > > > +       struct {
> > > > +               /** @consumer.page_addr: address of page fault */
> > > > +               u64 page_addr;
> > > > +               /** @consumer.asid: address space ID */
> > > > +               u32 asid;
> > > 
> > > Can we just call this an ID instead of a pasid or asid? I.e. the ID
> > > could be anything, not strictly process-bound.
> > > 
> > 
> > I think the idea here is that this serves as the ID for our reverse
> > VM
> > lookup mechanism in the KMD. We call it ASID throughout the codebase
> > today, so we’re stuck with the name—though it may or may not have any
> > actual meaning in hardware, depending on the producer. For example,
> > if
> > the producer receives a fault based on a queue ID, we’d look up the
> > queue and then pass in q->vm.asid.
> > 
> > We could even have the producer look up the VM directly, if
> > preferred,
> > and just pass that over. However, that would require a few more bits
> > here and might introduce lifetime issues—for example, we’d have to
> > refcount the VM.
> 
> Yeah I mean some of those problems we can solve if they come up later.
> Just thinking having something more generic here would be nice. But I
> agree on the cross-KMD usage. We can keep this and change it more
> broadly if that makes sense later.
> 

I think the point here is we are always going to have a VM which is
required by the consumer to service the fault, the producer side needs
parse the fault and figure out a known value in the KMD which
corresponds to a VM and pass it over. We call this value asid today
(also the name of hardware interface + what we program into the LRC) but
could rename this everywhere in KMD if that makes sense. e.g.,
kmd_vm_id (vm_id is a user space name / value which means something
different).

> > 
> > > > +               /** @consumer.access_type: access type */
> > > > +               u8 access_type;
> > > > +               /** @consumer.fault_type: fault type */
> > > > +               u8 fault_type;
> > > > +#define XE_PAGEFAULT_LEVEL_NACK                0xff    /*
> > > > Producer
> > > > indicates nack fault */
> > > > +               /** @consumer.fault_level: fault level */
> > > > +               u8 fault_level;
> > > > +               /** @consumer.engine_class: engine class */
> > > > +               u8 engine_class;
> > > > +               /** consumer.reserved: reserved bits for future
> > > > expansion */
> > > > +               u64 reserved;
> > > 
> > > What about engine instance? Or is that going to overload reserved
> > > here?
> > > 
> > 
> > reserved could be used to include 'engine instance' if required, is
> > there for future expansion and also to have structure sized to 64
> > bytes.
> > 
> > I include fault_level, engine_class as I though both were used by [1]
> > but now that I looked again only fault level is used so I guess
> > engine_class can be pulled out too unless we want to keep for the
> > only
> > place in which it is used (debug messages).
> 
> I think today hardware/GuC provides both engine class and engine
> instance which is why I mentioned. We can ignore those fields if we
> don't feel they are valuable/relevant, but at least today we are
> reading those and printing them out.
> 

Yes, the debug message drops engine instance due to not passing this
value over. I think that is ok, engine class typically all we care about
anyways.

Matt

> Thanks,
> Stuart
> 
> > 
> > Matt
> > 
> > [1] https://patchwork.freedesktop.org/series/148727/
> > 
> > > Thanks,
> > > Stuart
> > > 
> > > > +       } consumer;
> > > > +       /**
> > > > +        * @producer: State for the producer (i.e., HW/FW
> > > > interface).
> > > > Populated
> > > > +        * by the producer and should not be modified—or even
> > > > inspected—by the
> > > > +        * consumer, except for calling operations.
> > > > +        */
> > > > +       struct {
> > > > +               /** @producer.private: private pointer */
> > > > +               void *private;
> > > > +               /** @producer.ops: operations */
> > > > +               const struct xe_pagefault_ops *ops;
> > > > +#define XE_PAGEFAULT_PRODUCER_MSG_LEN_DW       4
> > > > +               /**
> > > > +                * producer.msg: page fault message, used by
> > > > producer
> > > > in fault
> > > > +                * acknowledgement to formulate response to HW/FW
> > > > interface.
> > > > +                */
> > > > +               u32 msg[XE_PAGEFAULT_PRODUCER_MSG_LEN_DW];
> > > > +       } producer;
> > > > +};
> > > > +
> > > > +/** struct xe_pagefault_queue: Xe pagefault queue (consumer) */
> > > > +struct xe_pagefault_queue {
> > > > +       /**
> > > > +        * @data: Data in queue containing struct xe_pagefault,
> > > > protected by
> > > > +        * @lock
> > > > +        */
> > > > +       void *data;
> > > > +       /** @size: Size of queue in bytes */
> > > > +       u32 size;
> > > > +       /** @head: Head pointer in bytes, moved by producer,
> > > > protected by @lock */
> > > > +       u32 head;
> > > > +       /** @tail: Tail pointer in bytes, moved by consumer,
> > > > protected by @lock */
> > > > +       u32 tail;
> > > > +       /** @lock: protects page fault queue */
> > > > +       spinlock_t lock;
> > > > +       /** @worker: to process page faults */
> > > > +       struct work_struct worker;
> > > > +};
> > > > +
> > > > +#endif
> > > 
> 
