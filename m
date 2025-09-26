Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1C5DCAC5B9
	for <intel-xe@archiver.kernel.org>; Fri, 26 Sep 2025 10:30:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D60610E349;
	Fri, 26 Sep 2025 10:30:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CXdOKYV1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A73610E34C
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Sep 2025 10:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758882599; x=1790418599;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=AErrqvRWIdoLPDOSr1VzYQmJYNjyd+olJ9sltuEpXiY=;
 b=CXdOKYV1tX1WbgY2pVaaVaRzcRHmTKTxXvhx5FvebGMYl72TtS0XRKG6
 7/gLYQj03wU9h2QJrc8jT/yxjtAUvv3dfMc/O+W2Macv5pyxEbCcgbzXX
 7XTYEnBYA+bPr5sluk8zMusveE3I7PYt3Vu9o3rMxlQzvR7ARLUZvPc/9
 Fvds2RzwxZrwBdzLoQfjaVBK6TR8S2a8zpwDhMZZPAQG9MFVkg5A+7sx/
 Td2koPwl5doYHNYLJusu0Qlw80HuPLYDZUB26FkUndqt9f6FvitfMdIrj
 ziWlrdT/aBRe597bDg6fDC+Psp3LyyIetiZCEknU5tpzGZZtEL/gAXbLB w==;
X-CSE-ConnectionGUID: VjRfmP4wTamPIM2dNEwITg==
X-CSE-MsgGUID: ERcsMon2RAeAFnEo+4SRFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11564"; a="72576389"
X-IronPort-AV: E=Sophos;i="6.18,294,1751266800"; d="scan'208";a="72576389"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 03:29:56 -0700
X-CSE-ConnectionGUID: aQMBxA/MQiK14edGJXypyg==
X-CSE-MsgGUID: 52Tg1aENRwyliWXheCvm1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,294,1751266800"; d="scan'208";a="181582232"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 03:29:56 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 26 Sep 2025 03:29:54 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 26 Sep 2025 03:29:54 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.67) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 26 Sep 2025 03:29:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TPYaywM+sQ+e7vKilU/8F2adPsJCpr4Lgcy24vkxn83qR14HAdvnUpzqYvWFmLsnvjLcAuCx0im3OSW9yN62XisxzGT3UKBJ4D8ZXUE6MlK3TgLU16ucYM+w2uDCoEQDSJ6L4er4+/2n7AW2y27B6aH0V82c7tfbtNuEvf0CVa6yPEGCK93MmlOha7dOtjrWRuz8062hrZyAXbsuAFK+LVC4UJ7wGu+IEsKvSK4BZb5t7ErckbODyUvs0JECm3914Lin2uM+lKiKHJkih8f2v0JXCtTPtHJmbIhO1wKYnXua+rDdQIzPVhYkuzEJTEOwV6KTmF+hbrKkhJrlZY1gJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KRHpJaKHDSsAODpUhUTKQqiuJnpYF7F6aGxkR3WE+d8=;
 b=AW7hX2retQHORZ0HXZ+h/0PLlK29lvnZkjaBg1djGIV4zGMEZwxynHG3CHsd/250Ro5aS7uvxC9P1M479/rEYSObSwnDSHt3QCjPyvz7gSaqBeK3XRI2/eNTY3LE7VLT+0QsU4eX1k2TeRBaalOrb0lSV0IItxQ17qiG8jM96ERpx9rQDkJquyq6VYcjqHj6KCKQtq9NWarfVn7jannOotNUiRUHHpm2WMI6yPMUlICBe3GFL0QxNDXBr16xgw/RKsSFZ4eavxW8pU5j3h9gxQuK6XAcSKUx9HChWx1kBFEPrEB8R32XFXZb7RqAzxl8Xfl/cod9AVOI4hk930rLow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by CY5PR11MB6137.namprd11.prod.outlook.com (2603:10b6:930:2b::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Fri, 26 Sep
 2025 10:29:53 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9160.010; Fri, 26 Sep 2025
 10:29:53 +0000
Message-ID: <d55e24cd-9565-4e9a-94e2-1c144ccaecd5@intel.com>
Date: Fri, 26 Sep 2025 12:29:48 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/22] drm/xe: Move 'va_bits' flag back to platform
 descriptor
To: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20250925234628.2112163-24-matthew.d.roper@intel.com>
 <20250925234628.2112163-27-matthew.d.roper@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250925234628.2112163-27-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA1P291CA0011.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::8) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|CY5PR11MB6137:EE_
X-MS-Office365-Filtering-Correlation-Id: ba65cc20-5a70-4ec8-69b3-08ddfce7a127
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NzR4bWpiTTFCKzQzak9NWEl3QnBUVmlURitsTjBTUjJMYjVDRW9ZdWNmRE9p?=
 =?utf-8?B?L1F6MDIvOS9VbU9vcmFFNGFteFkxbkJTS2N2UWQ1U1FUa0huZUE3bFpJRklL?=
 =?utf-8?B?ZnpiNWRveVdlYWd1NFNud2E2VkZSenJzNUpjWUlmRUZzUHpVRTIwWW8xUk91?=
 =?utf-8?B?WEltMVVlMk8yTTgzaHR0SlVaUk5NMnVsa0QzdFRxRUQvVFJYdWpoTDJ3MXlG?=
 =?utf-8?B?RkhaUFB3SEYzcUlzZmc2NGRzVlpkUnFROWdlWEF0NEJhUFhsbFdpVGtrUDJR?=
 =?utf-8?B?QTQ5bi9yMUZXRDN0eW1EM1FBaVRwMjNobEFXcm9nV0VjQTZqblV0a2xHcVE0?=
 =?utf-8?B?ajVkVVZtVklnNDlVWnVmYWduTXlRdndiU2JKNkplL3hETnhWdisrT0ljSERV?=
 =?utf-8?B?TkhOWjBUWjhzcUdmZjBENktpSjRrNS9EdXpSL3phRzVFblFJTmdJdWtxejJO?=
 =?utf-8?B?TmhLZEowcEtheTFIRTZKSjVvclIvUHVCbEN3NHd2L2wvSm5LSnVkQVBndjg2?=
 =?utf-8?B?MitrUnk3bllTMjM2ZDRqWitjdm5aU3N6djFaRkhzc0hZOGR0ek5RK2JzNXVo?=
 =?utf-8?B?MXRITGE5MHd6bSsrMXFGQldnSnpNbVFGeGFQNWdTbHFQNUE4S1ZmM1pvT0Zx?=
 =?utf-8?B?SWtKYkZ0WGhPaVpYUFNwWkc0ejkwd2NkQk1Tc1I2VERUcVJOSUZpRWppT0ZC?=
 =?utf-8?B?UHhUM0JCWU1sb3dmbHE1V001QmxJbVB3MzlHRG0xcERkMEFwVVY5bmdtSDF0?=
 =?utf-8?B?Nkc2SWZud092Vlg3K0ZUTDM2QklJQTBvOSs2RjlWdmRBMzc1UVNwZkpKcW1G?=
 =?utf-8?B?bWplazNZT1J4T0QxaGphV1ZYUStvN1FjL3NBeTNQZ1oyV05WMDVKL09hWjhL?=
 =?utf-8?B?TFFOYlhGTENXNHZEQThFckNGZU94N1Q5bEpQZmtlRUx0U0pUQ0x2Y0dPcnBL?=
 =?utf-8?B?eU40VmFCeHZnMTBleUkyT3BLME5DOGNleDB4WmNCdENPOUFtZlprU203UFMv?=
 =?utf-8?B?Z2N2Mnp6OTM4RTVRUkxzZlRwNzE0dHh0aWt3dFBkbGVhSUxLb2NBZU5ONDQ0?=
 =?utf-8?B?bUdUMVM4dG1LVXdja0tuNk8rZEZOYTZMSkhJb05tQkZ6MVFTRGR2b002TWlR?=
 =?utf-8?B?dDg4QzgxRUpOWXlOSWt6OU5vb3NEV1NTS2k3Y1pLMlJpSmhOUVBWY0x1ZUZI?=
 =?utf-8?B?bkQ4Vm1tQ0RVbEV2RWhacnR6Y0JxYlp4ZDJGMko1bHhlTEdGK3lkS2V0WnVG?=
 =?utf-8?B?YXoyWm83OUw4SEM1NWt0SUpDUWo4TkZvQW0wOU9BbWg3ZXJhN3hHUytoOEdz?=
 =?utf-8?B?VlVndXRzd3VvOU04L2Q5Y3dDUVVnV213UEs5UDFWWk9LNUNSR0pXdW16ZnVi?=
 =?utf-8?B?d0ZBMkU3aWhWRkMrbDJ5aXBXeEczelR3bENENWJIWk5XTGx3aXIvZUlHK0Ra?=
 =?utf-8?B?KzIvZ2RRdGloUnZlaWErZFFaZjNZaUtLczRvd0FuZVRIS0loRDJUcWJ3UDAx?=
 =?utf-8?B?SnF4eER2YUo5UW9kNEFkb2k1UmpPR2oxeWI4Qis4Z2NVNUJ4dWlqdzNXVC81?=
 =?utf-8?B?M2dlWWlmbXFMY0hNZVUvTk1BTVJrUllmZGkrbllqd25QN2JjUnpDRnlXZ3pB?=
 =?utf-8?B?WTJBSzYyZjZ4U3BpNnVuOXZodlBsb1ZlMjkrczJmN3RMMGkvc09ZdnY1QmdR?=
 =?utf-8?B?aExmSUFSVGhMZCtvc3R2L09KKzM0L2hZejE1UEtMb3diU3lyMFNQb0VJM3Vy?=
 =?utf-8?B?RU9OVEJ1Y1pNSzZlK1hKSWJJaUEwR0VUUHRkVndiYW9va1lOSEUwMFhvdzhT?=
 =?utf-8?B?QUI4Z0wzOGs5VlVvVFVVZ2F5eXJtNU9VRU9WU2pVb2dTVm1EY29BUEE1dG5t?=
 =?utf-8?B?WUlHUElqRDV2RGlzZ2pFU3AzVjBCTkxMcXQ5bFQ0cU54alhxcGJMWmhBdjgw?=
 =?utf-8?Q?QrCGqoUzvoSv9sMrY047t4kWs6XHJ98T?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MUhvZ05nNUNoT1FVT2ZjZTBGckk4cXFUVEhnY0E1QW9seFM2cDJsRU1ZVEVw?=
 =?utf-8?B?WVpYYTVsMVd0ZG0yd3IrNVZwUU45NzJIaCtiSVhYeTR3WXN2blRCWWhkRU5k?=
 =?utf-8?B?YUYwM3RUeEFRTGZ5blhocnBzWVIwUmxUb0g1MWN4emhVeThJRFhBTmlBQzIx?=
 =?utf-8?B?STFGMC95ZVZKSGg2UmpSL2lkaFhXdmtoMlZKQ0NSMVZqWExWOVdDemgza1No?=
 =?utf-8?B?OHlXMWkrblc3aXFqM3grejNPbnZ2MVJnM1RyeTJHY08xdk8yQnBqMmZ3aDEr?=
 =?utf-8?B?Zzlvcmh4NjR6MG42cHNKS3lQaElzQk5YRmJQU0tJZHRaUEVHVHB4Y3BlWXk0?=
 =?utf-8?B?dVVwU2JDa0JoMmRSWW1OeFVDdHhVVFh5MlU3RUJGeCtpK2RLaXVjY2pGR0Jj?=
 =?utf-8?B?QlZleUEyYXo3cnBYSnBnNkVsSWNDQk5GR2FmaFhGU0N3TDZPWHNqWDdsOXBC?=
 =?utf-8?B?WjhVcG9RdGQ1amZ4Q2cyNFBIdy9Ways0eE5iTElSSWlGSXJ4YThHZ2M2ZFpk?=
 =?utf-8?B?YVk2SUJCSExKdUNjSE1wbFlYdEk1ZWsyOU5JRlpFTkR1TDVzZzV3aE43YmpM?=
 =?utf-8?B?a2V0U1VxalhVNXVBSjFXUUdRM1RhbUovME9tbkxIdVVGdFoxR3RKeXRGYWtS?=
 =?utf-8?B?a0hqZmpjMWlxK0J4NExiWEZpNHF4ZGdTbXE2MXJUa0tmYyt4WDBuVTBadUUy?=
 =?utf-8?B?bEcyV2tDT21Ock5lNFlIek55bWZmL3JwR3RqYVpBS1RyZDk4M21HdGhBK1pn?=
 =?utf-8?B?WU5QQUNBYUljRXRSMlZzYmZTeU1JaXFSakh6WWF1K2pVVzlTY0IwcFAyanJD?=
 =?utf-8?B?MVFFd2o2aVhNM0lEK1lUL1h4ZGNsQWpoVHRhY2hsVUpod1cyZWh6eFV6TFdB?=
 =?utf-8?B?azNmdThBczcyRzY0RldyZWNCZ3RNS3hhSFpBYlRJMVpxMHJ2V1lTK3BNVi85?=
 =?utf-8?B?UFRZdVFERFdpbjg5OXpnWmdOWXJmcG13Q1FPekJxV2xNektqektULzBDRWhS?=
 =?utf-8?B?RnJCNWo4aGtCZjdHMUNoV2xDNUFMdXBwSzQwYkU4a0l4MWFQSGl3T0puTis3?=
 =?utf-8?B?cTBzZjVmUkNlckw2UVhRYUV0RnZ1b2MveXVXZmVIRVFNVmtBbW1FNEcxMWJJ?=
 =?utf-8?B?RHFINkx4TWJDaWx3aFR4Yy9ZOHRWVWdXZWliM1lMWWpQbi83UEtLS3R3TG83?=
 =?utf-8?B?OUQ3L0lCbjlQYUN3Q0pWQUErMVBMdlN1K20xekZDaE1BSGlwSU5OQ2tzQzdh?=
 =?utf-8?B?bmt1TDM1cjJBWXlqL0NDWUNXeTJZSDBDT0RoM1BaVUdLcUROT2JiTmNFNkg0?=
 =?utf-8?B?RXRRdmxScURaSEh6Q2pjZUpXSWlLbXpnbWpKVGE3ekJUTWZPNFhISHlCUVBB?=
 =?utf-8?B?empmcnRvdWpBYWYzZ1lLN3Q3c0x5YUtoMkZ2RkN4bTRFTW9wYjd4NVNBRnho?=
 =?utf-8?B?UVJwaGtLamZwRmlZSmFYYzJwZ1RZVGZQUVJYUEloalZCN0pPTmMzTkRYZG9o?=
 =?utf-8?B?V1pwVkVwRExMcGVIZ3NJazFKS1BJZ2E5SnZwOG9nc1djUkdQNEZDMERicThw?=
 =?utf-8?B?OXB0elRHOTlkSmkxbU1uRnBlK2lCSXJHa3FXQ2dTTnlwWWpBOXRKb1J2d3Nr?=
 =?utf-8?B?WEptc0NBZ0d5OHpYcGIwbFFhNndROWZBUkdUN0Z0UG5PWm5FYlpJaUJ6NU9L?=
 =?utf-8?B?ekt3MkRQaDEvS1p2VDk4UUJ2OU9yUDFOUEc1b0xSWDBabExud2F3Y29tYkNj?=
 =?utf-8?B?anYwZmhOcDcyakhLcmxBTFpYL0ZwTU9UeisvVXViOUhJcVlnblNqVjd0TlpM?=
 =?utf-8?B?d1kwUjc3RGNvcnp1ZG9Td1EyVVdKMUpDQmVzcTEvbVFhajNia1BoVlZqUlov?=
 =?utf-8?B?a1VyblJRa2o3ekxPeWIramFVK2JGWFNRNDlYaStHQ0xwVitGU0QyeSt2UGI0?=
 =?utf-8?B?RUtOK3B0TGpVSFlmOGtXeGlTYUVHSktwUG9nMlZVYlVkWSt0b0J4QlBwQjhx?=
 =?utf-8?B?YTVQbElQREJ0Ni9ubXVmdWtUOHBTN0tDa1RxdnpQalpTUHhrTHBwSmNyajR5?=
 =?utf-8?B?R2dmdXBCOEhpNG55L3VGUTY1eGJ2Zk9sLzB0UVEwa0dHMk1GcUF0ZzJqOERK?=
 =?utf-8?B?TVdZWVVGdmVzd2RLR0RUdHlHd3psMURpeVoydHV3ME85TzlPU1hnamc2UWdt?=
 =?utf-8?B?b2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ba65cc20-5a70-4ec8-69b3-08ddfce7a127
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2025 10:29:53.0261 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MIhPz50RhF83KobBCIFAYH8dSREgFycwJjcSkGY677BqHCziS3h4iZrI1tDim55YS1Y/XLJbbBZ3A6O6PiMArELqd1oo1oELu4SEkp3cWW0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6137
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



On 9/26/2025 1:46 AM, Matt Roper wrote:
> The number of virtual address bits is something that should be tracked
> at the platform level rather than the IP level.  Even when mixing and
> matching various graphics, media, and display IP blocks, the platform as
> a whole has to have consistent page table handling.  This is also a
> trait that should be tied to the platform even if the graphics IP itself
> is not present (e.g., if we disable the primary GT via configfs).
> 
> Since all platforms except PVC use the same value (48 bits), let's make
> this the default if a platform descriptor doesn't specify the value.  If
> more platforms show up in the future with virtual addresses of 57-bits
> (or other sizes), we can go back to requiring this to be explicitly
> specified for every platform at that time.

but does it make sense to introduce exception in device_desc by relying
that some unset values will have extra runtime code that sets defaults?

all device_desc'riptors are static const so there should be no extra cost
(beyond LOC) to store there 48 instead of 0

> 
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pci.c       | 8 +++-----
>  drivers/gpu/drm/xe/xe_pci_types.h | 2 +-
>  2 files changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 3f42b91efa28..90dae6fa7fc8 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -52,13 +52,11 @@ __diag_ignore_all("-Woverride-init", "Allow field overrides in table");
>  static const struct xe_graphics_desc graphics_xelp = {
>  	.hw_engine_mask = BIT(XE_HW_ENGINE_RCS0) | BIT(XE_HW_ENGINE_BCS0),
>  
> -	.va_bits = 48,
>  	.vm_max_level = 3,
>  };
>  
>  #define XE_HP_FEATURES \
>  	.has_range_tlb_inval = true, \
> -	.va_bits = 48, \
>  	.vm_max_level = 3
>  
>  static const struct xe_graphics_desc graphics_xehpg = {
> @@ -84,7 +82,6 @@ static const struct xe_graphics_desc graphics_xehpc = {
>  		BIT(XE_HW_ENGINE_CCS2) | BIT(XE_HW_ENGINE_CCS3),
>  
>  	XE_HP_FEATURES,
> -	.va_bits = 57,
>  	.vm_max_level = 4,
>  	.vram_flags = XE_VRAM_FLAGS_NEED64K,
>  
> @@ -108,7 +105,6 @@ static const struct xe_graphics_desc graphics_xelpg = {
>  	.has_range_tlb_inval = 1, \
>  	.has_usm = 1, \
>  	.has_64bit_timestamp = 1, \
> -	.va_bits = 48, \
>  	.vm_max_level = 4, \
>  	.hw_engine_mask = \
>  		BIT(XE_HW_ENGINE_RCS0) | \
> @@ -303,6 +299,7 @@ static const __maybe_unused struct xe_device_desc pvc_desc = {
>  	.max_gt_per_tile = 1,
>  	.max_remote_tiles = 1,
>  	.require_force_probe = true,
> +	.va_bits = 57,
>  	.has_mbx_power_limits = false,
>  };
>  
> @@ -584,6 +581,8 @@ static int xe_info_init_early(struct xe_device *xe,
>  		subplatform_desc->subplatform : XE_SUBPLATFORM_NONE;
>  
>  	xe->info.dma_mask_size = desc->dma_mask_size;
> +	xe->info.va_bits = desc->va_bits ?: 48;

all other fields are just simple copy
this one requires (hard to spot) logic 

> +
>  	xe->info.is_dgfx = desc->is_dgfx;
>  	xe->info.has_fan_control = desc->has_fan_control;
>  	xe->info.has_mbx_power_limits = desc->has_mbx_power_limits;
> @@ -713,7 +712,6 @@ static int xe_info_init(struct xe_device *xe,
>  	}
>  
>  	xe->info.vram_flags = graphics_desc->vram_flags;
> -	xe->info.va_bits = graphics_desc->va_bits;
>  	xe->info.vm_max_level = graphics_desc->vm_max_level;
>  	xe->info.has_asid = graphics_desc->has_asid;
>  	xe->info.has_atomic_enable_pte_bit = graphics_desc->has_atomic_enable_pte_bit;
> diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
> index 9b9766a3baa3..095133a1aa44 100644
> --- a/drivers/gpu/drm/xe/xe_pci_types.h
> +++ b/drivers/gpu/drm/xe/xe_pci_types.h
> @@ -30,6 +30,7 @@ struct xe_device_desc {
>  	u8 dma_mask_size;
>  	u8 max_remote_tiles:2;
>  	u8 max_gt_per_tile:2;
> +	u8 va_bits;		/* default is 48 bits if not specified */
>  
>  	u8 require_force_probe:1;
>  	u8 is_dgfx:1;
> @@ -51,7 +52,6 @@ struct xe_device_desc {
>  };
>  
>  struct xe_graphics_desc {
> -	u8 va_bits;
>  	u8 vm_max_level;
>  	u8 vram_flags;
>  

