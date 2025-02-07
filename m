Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6368C02194
	for <intel-xe@archiver.kernel.org>; Fri,  7 Feb 2025 03:11:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C3E510EA0C;
	Fri,  7 Feb 2025 03:11:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NoxK3pN+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF77D10EA0C
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Feb 2025 03:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738897828; x=1770433828;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=XK0E1j0m7bBf996f8MXLHNm5rWpqZX7GGW53EdEVaOk=;
 b=NoxK3pN+eVFt6UiDX5v7FwcQaY7lTsOXoDTdSnhDZqRQjyNYmnOoJjLa
 2dd/4q0S//UnT+Bq5Tu+WL+BsDVFjrjfgRGsZScPmOAcz5IMRQp1kY89D
 SBaXuQwLqjDnXJIJsXTEigSPbHYevrj+z7sXCpiP0Hc2Qg0LqcUAU9lDx
 7PgTnPhJ9haghMNbngiqh8Bdd4fHeUAT+TfPl+aFBnxs10cZiLvcezTrK
 uZTfGpswc2zp+PYc7cSrKHRAKecRg0KpLkGyD9HUc0oXY/MJruGQf3hDA
 zcOiZOFhGdd2WasoRLnJ3DNaZerOO8LC/vRXJ4NJT++5otF3X3AElTzxj Q==;
X-CSE-ConnectionGUID: zFhE95N7TAKVVbYEffiVHw==
X-CSE-MsgGUID: /zZ6En1AR/WiIIrFzq6hWw==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="39438755"
X-IronPort-AV: E=Sophos;i="6.13,266,1732608000"; d="scan'208";a="39438755"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2025 19:10:27 -0800
X-CSE-ConnectionGUID: DD+ZFjZhT2KU2YK87KMfLA==
X-CSE-MsgGUID: MA1p4bqQRzCqvqNeqTrtTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,266,1732608000"; d="scan'208";a="142288205"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Feb 2025 19:10:25 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 6 Feb 2025 19:10:24 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 6 Feb 2025 19:10:24 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 6 Feb 2025 19:10:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x24wEOa/eBCMGE51yhP7LcT9794NcVcXTUkhHLigc0iaekTKm2liAC29+bka3VK6TBa81eJrBpZdyYDnCg/beRyXY2EXhTqb02vntGAiQqz46bRBJLN78AJVehp/PPkTtqzy7X26qk/vbBC+CazUb9SIiId564uafSlAyZKGTtyF/C5Q6oJYp0heq39pWUPrO/65HqugI8rbfgXPdNr8cd9NeHp99Of9niaWgSUJdsi58kdbmv2194UdKKkcur8C1e4ujjh+3n/lbVG9hp/Pc3PvzOJ/RiD64IOTVEc8pdPZOCzt4qiGoN7h5Ta39cwngI3h5aqrXdd44pfL2kVSIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2TocALKZrggftXWpwk6wqa1KEJhvNm4BlnwnCk0JCaM=;
 b=sXHFxQoAiV7K9FwQEji+PP8BkW3/AaQf5Tt2C33QtlDoj+fMCcG3/7Zr2fcaRL5ryGc3ix+9vcG266Db57XqaBYwfRDfniYBiJr2WUD2EpVBl+bj0hJNSkdA/nBrC1OBYjV88oIB2gQbwuUzgbsOnSOKPWHX8ZEChSoB/zEvh+ACfX1tgt1FyVo6fnM4JEjpoqZOLb46zwOt7ipJmwmN6ehza/7GXgk2ZjL5YJObWvotExRI+bV68Pbk7fRFfeh8jg5eoBbAQvPI6K5dPKqhrHx7wDmn17gmBnxOyp7djQ5dQE32PBr5cXt/m4KJLH+MFLQPNrMngZRLMYv7wMQa5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB7038.namprd11.prod.outlook.com (2603:10b6:806:2b3::22)
 by MW3PR11MB4602.namprd11.prod.outlook.com (2603:10b6:303:52::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.10; Fri, 7 Feb
 2025 03:09:49 +0000
Received: from SA1PR11MB7038.namprd11.prod.outlook.com
 ([fe80::d13f:aaf4:415e:4674]) by SA1PR11MB7038.namprd11.prod.outlook.com
 ([fe80::d13f:aaf4:415e:4674%5]) with mapi id 15.20.8398.021; Fri, 7 Feb 2025
 03:09:49 +0000
Message-ID: <ad580886-537b-4026-bc64-781efb182148@intel.com>
Date: Fri, 7 Feb 2025 08:39:40 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/8] drm/xe/xe_pmu: Acquire forcewake on event init for
 engine events
To: Riana Tauro <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <umesh.nerlige.ramappa@intel.com>,
 <lucas.demarchi@intel.com>, <vinay.belgaumkar@intel.com>,
 <soham.purkait@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20250206104358.3436519-1-riana.tauro@intel.com>
 <20250206104358.3436519-6-riana.tauro@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20250206104358.3436519-6-riana.tauro@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0033.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::15) To SA1PR11MB7038.namprd11.prod.outlook.com
 (2603:10b6:806:2b3::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB7038:EE_|MW3PR11MB4602:EE_
X-MS-Office365-Filtering-Correlation-Id: 10209be0-7d8f-4cf3-9b56-08dd4724e1ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S3lBOGhmLy9zV2s2Q2JYOWVWTTQraGVlbXhNeDdaaTlVYlBpMWdGYU9qVmky?=
 =?utf-8?B?VnVwT01xY0pFT0hkSHBNZ1phQkVYMUVNaE5sbUNaRW15b0dvd1czOFhsMkd5?=
 =?utf-8?B?YUFEZDFpYWNZb2NwSWZ2Wk1CMmZiVnU2Znc3MFEwZXRnOWFBcXo0UHBRTGd0?=
 =?utf-8?B?aVBad3VMSVJ5TWdITHN3RXkxK0lmYWZXL1QxaUdPbVNmVHN6VC9VQTVPRWdB?=
 =?utf-8?B?Uno5OXYrSkJURkVwQlEyaDFpTFVLRGtqMkp0WkVGRGthZ0d1NExjeGtTYm1H?=
 =?utf-8?B?VHowNXNpQ0k4L0VIbkp1VTUvelB4N0FuYjI5c1N3d0dmSlgyVTJjUUxJUVpL?=
 =?utf-8?B?OXhoL1gvck1Ba1NRNmFxVHFOaFBma21iZDFlbEp6ZnJWMTl5R0RISmV3bnJY?=
 =?utf-8?B?MXQyY0lDenNmdG1nNDV5RkVXMzJPTVc4ajUwT1N0UjVzVmNBRnZEVlJUbWNN?=
 =?utf-8?B?VFk5Y3NBVHoxSDY0ZnJiZGxWY3h5KzlsdE0zVmRKRWdsbVNRMXZhV0dyVVVy?=
 =?utf-8?B?RHFsZStlczdNNVYzZUluRDJFeGxrRE9KVm5zbUMwRm56VDdXMzBxVHpwOTVX?=
 =?utf-8?B?cXVLVXgzV3JsTENVekdreDVkTnJNQTVaaGd3eWl3OUNpTEdQUTVZZU1vaDdq?=
 =?utf-8?B?ZklYdjhsZjhJNEUwR1ZzZ3BVTjlBbG5zNGdyeFpHOFMyZEg2czkyMzBGbFo4?=
 =?utf-8?B?a2lxQndTQXpSb2pXcndkZ3JKOGY5SW1yMDJRYjFzdUE2aFVjMCtZNkFHYjND?=
 =?utf-8?B?ZkFsSkplUjM0Y1I3WnV5S1A3NXRTK3M2ZHphN2FJSkNQUWZpNWVpN2VHRlRR?=
 =?utf-8?B?VGNsallrNWp0WWpDUHBWSXgyQU0xc2ZuTkx3U2ptSVVkM09NL1EzYm5McGo1?=
 =?utf-8?B?NlA4Njd1MXdNeWdKU3BBK0F0VU9LelE0Uyt1ZHhmSGI4d1BNa3lpSWVIUHh2?=
 =?utf-8?B?aWlqS21zdVpOcUZPOFZVSDd0UXZ4NThmSTVqV3VvTCtlTURIWHRza016bHBB?=
 =?utf-8?B?WVRYa0tEZ2JNbEFqc0xKcDJUdDU0SldBRDErWStmQzBTbit3QVNKSHRSZXhU?=
 =?utf-8?B?NGlQeSswd0VMWnMwNG5BN3Y4SmdoVFFDbHhhNGNvcVd0cDJwOU9aSEdqSDNO?=
 =?utf-8?B?bUhRMFJKUjIvVXFrRXQzMUd5UTZKUkVBTnEvTEpJTjVWd1M3c0l1YXYvZUVN?=
 =?utf-8?B?UTQ4ZS82d29oMjhmMk5ick9QSndIcFJuTDlVZkZWbWZWTDM1bmpvRkhZZmMz?=
 =?utf-8?B?OEJ3cytwN1FqVjAzZTZjYWYwUlpoSnVwbm05d2FUT29RT2x5VWxvRXFPRTk4?=
 =?utf-8?B?dmVIR2xzL1picld6SXBBODBwNVl1ODlpMDkzdGZDTmJHSXpRUUhBU2VoTlFz?=
 =?utf-8?B?T0xvVmo4RVRhdjB0ZC9zRXNwRTVVUDZhLzhJcklBYU5NRFMzMHRQQWEya2ZF?=
 =?utf-8?B?ZE5iRFFyd3dRbk5MRTd5S3czL2N1OTZQeldNN2VoQzhRZnU3RVpUNlgrMWE5?=
 =?utf-8?B?K011TDcza2VkYllDN1c2N3daNmhpWHJnS01tb09TZzZCWEgzMVNYV0Mvd0RB?=
 =?utf-8?B?ZytnSk8rakpKMmYxdkppZnI3Z3VEaUJ6aHV5OU5mTWthcktJZHNEYmlFc25B?=
 =?utf-8?B?M2NTVFNVTFg1TW9obENVZ2hVNkZ3N3h6cnVVcXhaN2Q5ZXZoMEs5OWdXMkpY?=
 =?utf-8?B?VUh2T3ljZHo1OUFzc0lXcEVGeDVmRGRZV0dVVmF4anNaVGVFTHRDS3lmYU1r?=
 =?utf-8?B?bkhSOEdQUVlBcnBMUXliRXV6ZzE1emFYS0w1WCs5bTY3cXNJNlhLRk9GZlhO?=
 =?utf-8?B?SWFsa3pYVmV1QVc4OXhwOGcybldOdTU1MU1vTmdqU1g2MUIwWUljajJvVzgz?=
 =?utf-8?Q?ga9PWguVTSJkb?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB7038.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WmppdE9tcFZha1J4QTlPYk9pYzgxR205TVBROXNSZmtYU0hTVjlYb0YraEFu?=
 =?utf-8?B?Z3dZanZtRFpQbXB3QTFWWFJJaTEzYnZ4V0dubWY4WHphZDg1b2M3VE5BcHll?=
 =?utf-8?B?N2Y0djNVRFV0eEYzM3VVeU50QU1JaVZSVHVCeWJSZGtvVDJCZjdZRVRxL25U?=
 =?utf-8?B?WFNGWnYrWXc4V3VlSGQrQ3BkSkk5LzM5S2lYUnNqQWxiVnNWYzFjaXpOWmRP?=
 =?utf-8?B?WEhTS20vTW1PYitmVGpuaXI1ekZGNkRteHhuZldzc0tzQkRXN1p2VUtUdW1q?=
 =?utf-8?B?RVNlYmNpUytWSUpEZUFiUU0rZTVpQzdmOEptNkRUNmhBMnlTRENXTjVMckJR?=
 =?utf-8?B?dEdBZmRzNklDT2VVek9lVHJjd0VkL0t5OVc0R05xK0crRU95NFBHb1Rwc3NO?=
 =?utf-8?B?RUxMdnBsMTdaUnN5Tlhia09LZXY5NUs2R3Y4NnFrN01hZWRhQVllNzk5ellm?=
 =?utf-8?B?TDBJSm5YNVpMSVk2US9oblBwZWtTVDFXMmp4WUhhaU1tVitJVUY2WkExaUFU?=
 =?utf-8?B?VUUreFR0S1d5VU8zV0VQRkFTOFZmS0Z3VDdCcUI4Z3dWd3lMRzA3ZDdFa3Az?=
 =?utf-8?B?aGNRYWt3Tlp3ME9OS0IydlZHMUExU2pVNVZ2aGt3aS9aU1NzNEpKS3V3ZjhR?=
 =?utf-8?B?TWpsd0F2TXBFZDBrS01vdHc0R2pMSlM1SkZmVGF2RGFBdldBVTJWMWtEMmtH?=
 =?utf-8?B?alVpMWkxajBVTVVEZkpRbk54b0MxTEhSWDgrY3RDOTVBZjJQZlFRRnRhSjhu?=
 =?utf-8?B?RmljZ1JISm9WcnVMR1Boc00zWmpML3RLK2NIdWxjcjVJc1Yvdkw3ZStoZVM0?=
 =?utf-8?B?bVZtbzRWVXJDRUt6ZVJNT0R3VUQ3L2I1QVU3Qk94Tk5rcUk0eC90NGtGTUhN?=
 =?utf-8?B?amRiUWE4R09rNmc4SUVCajI0U1doRFhOanRKREsyVTVMdWdpcGZNdUFrOHBn?=
 =?utf-8?B?RWVmcXBVYkZGcHdXMGp0TUVTMmhWdDN6QzIrNnZuWGRDYjJHQmhmMnR6Q2xp?=
 =?utf-8?B?bWpXU0FwSzcrVTJFVDQ4YXoyWGpPOFhyZFB0M1lpaEplRWczL25HYTZyMWF0?=
 =?utf-8?B?WGFJYkw5V2dUcy9RUm1qeTQ4K0k4UUN6SUY1L2h2MjBrMHM5azhYbGZJeWVa?=
 =?utf-8?B?VEhRc1RJSEJtUGJxRnM0anp2Y2ExbEwyVGtadVFEdWdSU21CRzFwR1h3MWla?=
 =?utf-8?B?MTlSUHRER0xBVG1XWmNUUC9CV1dlVHRnVkt0VzVCdEhkS0QydHRSa3FNVWVM?=
 =?utf-8?B?QVU5QjZyQ2xtVkFzRm80bTQrZGtJWTRZbjk0L3ZBc1NNbnNXTWpMSGRoeDBP?=
 =?utf-8?B?WjRHS0ZpRVpFczNNQ0pkUGhnc2pvV3B0WGdJUUxzZnFNQk12WFJLQ2diMWF4?=
 =?utf-8?B?b3RHMEo4aDQzMzc5ZWVmbmsrajlpeDVZa0lKckdpQjRvbUtVZmc5MkZmWWI1?=
 =?utf-8?B?T0JVMmlTWVFZbmpJOElDeU5WY3I4T29nK1pUTHNNSG50QlA0RytrZ0NtcEU2?=
 =?utf-8?B?K2tMRUwyNVkyaHBtS0lrMExkRENxQkRLY29STTRXM0RvbnJTSlh3MC9pdkMr?=
 =?utf-8?B?cXFsazFXNzRvZmdrV2FOK1VQVVR4ODl6dWpZQ3BaTXdFSjBoTkVkMjFHWklQ?=
 =?utf-8?B?d1pBaW9Fb0QxZGcxMWNaQ1JPOXJkNHZud1ltNlBVSmJPcEJ3SG1OUlYyVEg4?=
 =?utf-8?B?czd4N0JiRHRQeTY2R3FwYkk2eDJZN0R6V1M3MnkyRE44eDNkNHBZcVJMNVdw?=
 =?utf-8?B?Q2hYblhrYjJEMWFlRFdIbC9RNWJXQWlsbGlTKzJVUWsxMkh4MHZpWWhtVmx1?=
 =?utf-8?B?SjZPU256ZHVXU1RFT0gxTGd1MUJRbldkU3l6NHROVVFUcnAwN1ZCb3J0QVYx?=
 =?utf-8?B?VzF5QlRQdEFOMUREYjhLU1VGOHlpWTJ6NlQwMDN2OEFBN3hDZlRiTkFZRUZm?=
 =?utf-8?B?bEkyVjkrb1JOVDBIY1NwcnFYa0V2WG9UTjhUTW0rVDNBN1duZDJGMWE0MklK?=
 =?utf-8?B?ZjV3cDNBU0VLdDR2cGVUZ0RFNmF0bFVMYjlUa1lobG1kb2JkbktzNER6cXhD?=
 =?utf-8?B?K0hFc1d6dE14K2prM3FxdWVSQ0cyZERNTktkUnNCZ3BBRXRmSEhycDJVbmE1?=
 =?utf-8?B?VW1PK0MvSFZuTXZpanJRclRjaEFnNWpEVjE5M1JPQ3JyTVAyUTJzV2hlSnNR?=
 =?utf-8?Q?1RFq2Xh5puMUY4jOFpy5Ufc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 10209be0-7d8f-4cf3-9b56-08dd4724e1ab
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB7038.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 03:09:49.1094 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4QeV8zmXzRvCCueRaBnIqKHn44doXYudT7NZFEPB9DeLyPk8Fkti+aDFjYYjFSguhsp9vgzxvyL/YMVD4YtcAnqmnOQKK9aBor3SfKgPoNs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4602
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



On 06-02-2025 16:13, Riana Tauro wrote:
> When the engine events are created, acquire GT forcewake to read gpm
> timestamp required for the events and release on event destroy. This
> cannot be done during read due to the raw spinlock held my pmu.
> 
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_pmu.c       | 47 +++++++++++++++++++++++++++++--
>   drivers/gpu/drm/xe/xe_pmu_types.h |  8 ++++++
>   2 files changed, 53 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
> index 06a1c72a3838..5b5fe4424aba 100644
> --- a/drivers/gpu/drm/xe/xe_pmu.c
> +++ b/drivers/gpu/drm/xe/xe_pmu.c
> @@ -7,6 +7,7 @@
>   #include <linux/device.h>
>   
>   #include "xe_device.h"
> +#include "xe_force_wake.h"
>   #include "xe_gt_idle.h"
>   #include "xe_guc_engine_activity.h"
>   #include "xe_hw_engine.h"
> @@ -102,6 +103,36 @@ static struct xe_hw_engine *event_to_hwe(struct perf_event *event)
>   	return hwe;
>   }
>   
> +static bool is_engine_event(u64 config)
> +{
> +	unsigned int event_id = config_to_event_id(config);
> +
> +	return (event_id == XE_PMU_EVENT_ENGINE_TOTAL_TICKS ||
> +		event_id == XE_PMU_EVENT_ENGINE_ACTIVE_TICKS);
> +}
> +
> +static void event_gt_forcewake(struct perf_event *event)
> +{
> +	struct xe_device *xe = container_of(event->pmu, typeof(*xe), pmu.base);
> +	u64 config = event->attr.config;
> +	struct xe_pmu *pmu = &xe->pmu;
> +	struct xe_gt *gt;
> +	unsigned int fw_ref;
> +
> +	gt = xe_device_get_gt(xe, config_to_gt_id(config));
> +	if (!gt || !is_engine_event(config))
> +		return;
> +
> +	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> +	if (!fw_ref)
> +		return;
> +
> +	if (!pmu->fw_ref)
> +		pmu->fw_ref = fw_ref;
> +
> +	pmu->fw_count++;
> +}
> +
>   static bool event_supported(struct xe_pmu *pmu, unsigned int gt,
>   			    unsigned int id)
>   {
> @@ -144,6 +175,13 @@ static bool event_param_valid(struct perf_event *event)
>   static void xe_pmu_event_destroy(struct perf_event *event)
>   {
>   	struct xe_device *xe = container_of(event->pmu, typeof(*xe), pmu.base);
> +	struct xe_pmu *pmu = &xe->pmu;
> +	struct xe_gt *gt;
> +
> +	if (pmu->fw_count--) {
> +		gt = xe_device_get_gt(xe, config_to_gt_id(event->attr.config));
> +		xe_force_wake_put(gt_to_fw(gt), pmu->fw_ref);
> +	}


Considering that fw->lock will be acquired and released multiple times 
during the put operation, this might create an overhead.

How about implementing a _put function that can take the number of 
refcounts to decrement as an input parameter, similar to 
xe_force_wake_put_many?

If the overhead has already been considered and found to be acceptable, 
I am fine with avoiding unnecessary modifications to this patch.


>   
>   	drm_WARN_ON(&xe->drm, event->parent);
>   	xe_pm_runtime_put(xe);
> @@ -183,18 +221,23 @@ static int xe_pmu_event_init(struct perf_event *event)
>   	if (!event->parent) {
>   		drm_dev_get(&xe->drm);
>   		xe_pm_runtime_get(xe);
> +		event_gt_forcewake(event);
>   		event->destroy = xe_pmu_event_destroy;
>   	}
>   
>   	return 0;
>   }
>   
> -static u64 read_engine_events(struct perf_event *event)
> +static u64 read_engine_events(struct perf_event *event, u64 prev)
>   {
>   	struct xe_device *xe = container_of(event->pmu, typeof(*xe), pmu.base);
> +	struct xe_pmu *pmu = &xe->pmu;
>   	struct xe_hw_engine *hwe;
>   	u64 val = 0;
>   
> +	if (!pmu->fw_count)
> +		return prev;
> +
>   	hwe = event_to_hwe(event);
>   	if (!hwe)
>   		drm_warn(&xe->drm, "unknown pmu engine\n");
> @@ -218,7 +261,7 @@ static u64 __xe_pmu_event_read(struct perf_event *event, u64 prev)
>   		return xe_gt_idle_residency_msec(&gt->gtidle);
>   	case XE_PMU_EVENT_ENGINE_ACTIVE_TICKS:
>   	case XE_PMU_EVENT_ENGINE_TOTAL_TICKS:
> -		return read_engine_events(event);
> +		return read_engine_events(event, prev);
>   	}
>   
>   	return 0;
> diff --git a/drivers/gpu/drm/xe/xe_pmu_types.h b/drivers/gpu/drm/xe/xe_pmu_types.h
> index f5ba4d56622c..134b3400b19c 100644
> --- a/drivers/gpu/drm/xe/xe_pmu_types.h
> +++ b/drivers/gpu/drm/xe/xe_pmu_types.h
> @@ -30,6 +30,14 @@ struct xe_pmu {
>   	 * @name: Name as registered with perf core.
>   	 */
>   	const char *name;
> +	/**
> +	 * @fw_ref: force_wake ref
> +	 */
> +	unsigned int fw_ref;
> +	/**
> +	 * @fw_count: force_wake count
> +	 */
> +	unsigned int fw_count;
>   	/**
>   	 * @supported_events: Bitmap of supported events, indexed by event id
>   	 */

