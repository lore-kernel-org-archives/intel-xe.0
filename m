Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0A7DC25B75
	for <intel-xe@archiver.kernel.org>; Mon,  3 Jun 2024 15:50:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D78C410E09D;
	Mon,  3 Jun 2024 15:50:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cLa+zfWN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C772610E09D
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Jun 2024 15:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717429833; x=1748965833;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=02bkB2Ein9bvE0ULTAm5mHq3V4eh8SZhZXQOH7pwGmo=;
 b=cLa+zfWNsSVFOvcrcGAUn6lWo4VIViZGfEqSPVXW1zo5gspmO1OWmMHG
 MI8hJy/ewzxHjUZMoH71yc2e5iRJDJvovFHBPE9jbrjjHRH/hImFAvpXg
 najjB/DUkMf9XgwRK0JV9dVL1b+s/IHPOjkz3LXgjln97DPSQWClK1O2t
 dI0K5+k2tWayAIC1PPSWCmsK/IlWmmtQcD/vXIjfBCgH9B0/PgGXb5qmE
 kEic9Dzk9gObsJTiKHILFvgw1T1xKWj2mqMTN6sIuZvcaj8nlvaMxNKky
 g7WMshQkKC/ZOAiHPYkBew0+VVsPnrkBQuM3PmwojKcCpIvN+/EcnW5ep A==;
X-CSE-ConnectionGUID: ivje8rh1SeCSn+Oov3pcfw==
X-CSE-MsgGUID: 6GCf8wcJQL6hLzAAEntCpA==
X-IronPort-AV: E=McAfee;i="6600,9927,11092"; a="13874155"
X-IronPort-AV: E=Sophos;i="6.08,212,1712646000"; d="scan'208";a="13874155"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2024 08:50:32 -0700
X-CSE-ConnectionGUID: oxv/wayLRd6aAuIugN3RJw==
X-CSE-MsgGUID: teoFXtTPSIuQOfDtstIboA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,212,1712646000"; d="scan'208";a="36892689"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Jun 2024 08:50:31 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 3 Jun 2024 08:50:31 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 3 Jun 2024 08:50:31 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 3 Jun 2024 08:50:31 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 3 Jun 2024 08:50:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q0awxVrIYCVRUVtSfdhAvG4Ty7SZlRIJNvZwJZxRQR+Jw3S+jsPWhjECfmVDFnz6sfbcsEd4FNqZ0NUjv4q375yLwrQsyZayQETiZgZZDbZElKUzhQrAH8B8wwxBzQFdKxui4MlhvB4U5HPPD7Ti+mF+PyN9ShIWBLqQ/46Ga41OBtIAtjwAUpkoFOWxvOmbQugD69hkugOvAoER0NI4ao1XKlq7L4rB9v/Hn7Vk9jygYJk7WJXm9XO6RnfdYcwIFbbUmCDBpsVKmvtbUGg+ohvuwt1gUYqn0MdYW1mj6qTJakzosZ5yC+RLe3mQnIyuwPO6kYX2XBQB5wlAh1ARWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C2AR82l53lV8RFoF7OpcPJhKrPCvW3KI77y+an/OO5Q=;
 b=jNyyqzgJNfDeB801RBLOHDSY5GQJf1H9pnNINmRTsQp5IviIjZcf3Ldsv0c2P+fjxxH9NsQ1EZb+KypJcCZO1Igm8idD47om3GQiYsFRFNwQa8cBswzmht/hogJTzpdNxy0HsPf3vxbaxQzYGPfwHtgLQro15RrLqbli3ib2mKFG6tu4jN8db81n2uQiuq7+MmF6OIDZ7g7sWoOo+XSNnCDYocxhB0anVPYALjlNga68pq52rsS6WzWVYItVem26EEgZno5SaY5bgd0dWHd84Mxi1T2oCQh6q4/6JENTM8OIaQrBDNDQILvV7kGHdRLUO/0T98Vn12nVxOxgCUaQhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by PH8PR11MB6974.namprd11.prod.outlook.com (2603:10b6:510:225::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.22; Mon, 3 Jun
 2024 15:50:28 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%4]) with mapi id 15.20.7611.016; Mon, 3 Jun 2024
 15:50:28 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240530151313.2284182-1-radhakrishna.sripada@intel.com>
References: <20240530151313.2284182-1-radhakrishna.sripada@intel.com>
Subject: Re: [PATCH v3 0/6] Tracing cleanup and add mmio tracing
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <lucas.demarchi@intel.com>, Radhakrishna Sripada
 <radhakrishna.sripada@intel.com>
To: Radhakrishna Sripada <radhakrishna.sripada@intel.com>,
 <intel-xe@lists.freedesktop.org>
Date: Mon, 3 Jun 2024 12:50:24 -0300
Message-ID: <171742982468.5170.17570395012205914887@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: BYAPR08CA0045.namprd08.prod.outlook.com
 (2603:10b6:a03:117::22) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|PH8PR11MB6974:EE_
X-MS-Office365-Filtering-Correlation-Id: 06957553-b5e3-48ae-9d2e-08dc83e4e417
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q2NWWUZKUG5URC9nMk52NHlJcm5WTlo5MXZLV1c4ZDVuRi9FY1Zkajc5WVhF?=
 =?utf-8?B?QlZUZytvaHAxR1dKaTZDREY2Z1BYUUdqNjdHbjJ2Mi92ck53WDVTWXhqelYx?=
 =?utf-8?B?SzNUUTdVSC9pR3dYK1VaMUh5dDAvSHNOYVV3T1JjeE5HVHdWSVdJNmh5dTNq?=
 =?utf-8?B?U1hSeHNIRHJTV1REWktMK1Z5aVpJbzduUXlld3F5MUhXdlVXY1RmVEJEYVlD?=
 =?utf-8?B?Z2JRbHF3aUdXMlBncW1FUnNLS1k2ZDFOYUFMdFovejRFamZsRkFBeUQ1L1Ri?=
 =?utf-8?B?V2JDUFNuZ2pJUTNRMkVmQXpkWlVtTE1XZVpqL0RrUVhHdDlBaWI5YTJiU1cw?=
 =?utf-8?B?Mnlja2hSZzhxT3g0RGpxc0FrM2tsYnRlN09wNlZuUk9GRVl3NTlmcE1KRk1w?=
 =?utf-8?B?Q2ErVE1teVFROVpKbU1OOFNUYUdZWlZqZmUyekgrK283YmFveGRqYnlYbnor?=
 =?utf-8?B?cis1eDd6Y1ZtcmhuNldHS0s3UURnZEVBVHc2S0ZkR1Qzc213WjBXWlQzUEJt?=
 =?utf-8?B?elhwS1VwdUF5aDhBdHBOSDBIMEdaNDlMdXBsN2pxQW9PMDNka3JJSTdnUVVP?=
 =?utf-8?B?ZUU1N0oyZVBraFdZek1YT2FUMURZYnpFUUlZMVhnS09XTkhSOXhyZHFvZWlK?=
 =?utf-8?B?VXdqNzJXZU9IWWwxTVhReDk0aWV4MmY1QWNGVE5mdW9WZDV4ZXRrZGRUeHVD?=
 =?utf-8?B?eVZOVzRXVFErR3RPdDZ6S20xM1VUMjlXNUMyUnF6anFHQVFXMGI2WEtJMEFv?=
 =?utf-8?B?V2xoSG11bU5YR20wZGRZenN3dW5DbVpHVUw2czY3K2xFZERUMmdhYUVZVTVr?=
 =?utf-8?B?Z1NiMklFL2h0WWRjZUw0ZXRtTmRGQ1lib0FGOEZHWG8xWEFpeU9aYXFibXpr?=
 =?utf-8?B?aGUwZXYrR3NJdEFGMnduK3lBYnlmd0VRNWNycE1lZTJhQnBWNXdUbXBFNmQ3?=
 =?utf-8?B?dk9FcGN5RktObTdJTkRqYWpPRlRiOThOemsveXZ4M0hvc3BmblNFT05sai8x?=
 =?utf-8?B?SExzZFRtbVZkNDJMZ3hXclF0TzJWaFJqekI5NUlSTDZPb0FJWDVCbU5RelFY?=
 =?utf-8?B?SDFMN3FmY09OZjZsWVErR3dDQXljSnNYZi95bTdXYlNZLy9aa0FGT2pvZkJv?=
 =?utf-8?B?Um50ejlFQWYydkNGVHF6YUU5R1lzWmNDdzVmcWtmODc2U1BrT2FpdTM0V2Zv?=
 =?utf-8?B?cVBoZHRabGJJUTZhTGlLd0RMZ3RSb3pYcmtSK0MwYjVMaVloT2FoSTYxRlU0?=
 =?utf-8?B?VndjUm8xV0NDOVp6SWlWS2pOU21LZi85dzA4NGhlSmNQSCtRV1lHMk1vT0I4?=
 =?utf-8?B?N1cxejdBMDRicjdkMFo0bFc0Y2NBUHY0VTRlOU1YU21hc2Z4VnRSZGxad1B2?=
 =?utf-8?B?aGxmcno5SU42MUNadXBRTTFTR2FlVDl1Y1hqbEd0Y2R3RXo0OW9FOGRuOVlY?=
 =?utf-8?B?amtPM2E2NTBMVG5kZ3dvYW00NEQ1eEUrdVZoOWkwMnQ3SXVTemJFL1pSY1cz?=
 =?utf-8?B?aEhROW55YzM2eU5MSWpOTXRwQUljd2VZU0lQcFJXMmp6cmk5V2hjRmRDRTRv?=
 =?utf-8?B?TnZsbVhqVTVrRno1ZnBIak9Ya0ZJM2hLNktlUzdtZEQ1TEZrNHMxUWZRM2tK?=
 =?utf-8?B?ZWZRTU1Oc1BlZUJJNWUzRDVqcFRGKzFqK2Jqay9xREQyM2pQM3NhaDdJZTBz?=
 =?utf-8?Q?F2xhyaAiSSWfpqNoJjNH?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OTljZHpPQnZGczdKYzBwaTVvTUlwSjRlS0k5Y3lsTXhvZERYWnhPUU5Qb0hK?=
 =?utf-8?B?ZUMrSDBNVm5xajI1ZFVSNzRrM2pTaDg4YW55Mm1vbytZOUNHN0M3cnVuQm92?=
 =?utf-8?B?UkN2S3pNMTlCL0UzTE1CMFRmaC9iVlhqMWVDaXhtQUMraWpXamI5aUNnVXJu?=
 =?utf-8?B?TnNEQXRPR293Y0Q4c2dteFh6R0VaVlcwSnZWWTZFcTN1R2NneU1TNDNCZHNh?=
 =?utf-8?B?OTYzVmtMbThISGp1SHBQUTBjVm8wV2dCQ2prV1NPMkhPUHdKMjFCeUVYSkdY?=
 =?utf-8?B?T1BMOTh0S01lM013K05JY0JkUDJsQ1ZlOXF5a1M4WUs5Y2RscllPZjZhUmJB?=
 =?utf-8?B?d0xxcHNyak94YXBPNWs4bUpZSG9xckFLdFhOa29wZjRqWHZxZGJBUEhEclZT?=
 =?utf-8?B?U2U5OUZYVDduMmN0ajN0UHA3dnJTUU9vQUc0a3ZYc2RIdXZHaEpsdStFMUs2?=
 =?utf-8?B?MnpFZHZ1Nk54V1I5OFdjdGpISWRwY2grTFg3YURxSEljL1AzY1ZoR2FIdFJQ?=
 =?utf-8?B?Q1BuQmtlOHBRaFpxaFZzLzFwVjdQL1YwcWZsMlBGTWxPYkJ0MWZMb1VXbFor?=
 =?utf-8?B?YVVDK0lpRjh5a2J2RlVmTnVIcEtremRGazZFTlNDaTNPYnB4ZE1NbEdsWkxN?=
 =?utf-8?B?Y2JsTmF1bnhxMldBUzVPMHhUelViS1IwVGhjVGZBaTAzTjc0RnVRZVNiektq?=
 =?utf-8?B?UEFhT2NZNm1kU0pXZkdyQ3crZ0FZU0NtTnlTdytkNDBzQlQ0dGxPd0xvMjlu?=
 =?utf-8?B?RUQyUm4zQVU4ai9teXE2Y0lMUzdrdnFPTmdMT1V1bTdsTmlJRVNJaUNjL1hm?=
 =?utf-8?B?NWsvNFdNOStUOTJFazBjWTNTK3A3d2dEUHZHUWg0ekUzMjNWRVZhY245WmVh?=
 =?utf-8?B?QlI0eXhNSGhwWWd0NzBWZFduOWFpaTRsN3pXcUFaSjhFNTlqcnhjTFNJbkVz?=
 =?utf-8?B?VTFoSEsvdGZrMnVuYVJ6QlJUK1pPSDZZbmdYQUlMR0JXMTgyeGdDcHA1c2hs?=
 =?utf-8?B?NmRlNjBMNDRYZTJ0TEtnNkp6dkdUa21Kc3EraGRTbC9xRnlsNENZNHN2M3p1?=
 =?utf-8?B?RUxJTC9SSnJFSnIzaFBFQStQVHBUV2o1SEllUkxRZ0VoQjlrT3ZLQU1hVU1l?=
 =?utf-8?B?bytzQ21LRURuREZ1dzh3SEhrMnZ2SFdwcjFUQTNzc1FrRUNrWDdyMmNLWVp5?=
 =?utf-8?B?NEVPMU1OS2p4a0VvRW80dzhzM3hRQU9WSnBFbFhFdTdITEptK1BLbWhWdTht?=
 =?utf-8?B?OE9udnBvR0RuSVp1amc4OUZSYllLNy9maDZZY2N5N0VreCtFUjR3Vm95MzVW?=
 =?utf-8?B?NTIrdVFOcjdyT3krSVI5amE0MExPdERYQmxUK2o1YjFPbXc0aGI2V3Vmb1NT?=
 =?utf-8?B?Q1hIdzdGV1ZzaUNNSWF6djJpbHlzMEVZR0hiRUN3Vmc5Slg2V2wvcTQyNkZP?=
 =?utf-8?B?Q1FUL0dqcWV4azBuK2dBakdUWWU0ajhLRUxMdjZhcmwrTzc0SkZDSm4zbG94?=
 =?utf-8?B?MHZuTmlLSlU0dTBvM2V4MlhLM0Y1cmgwV0tYTVVENWkzTklIQS83eThBNHdD?=
 =?utf-8?B?MzFZT3ViRUgydzhvQmlldzZZc2QvMlErL2JsSktqMlZHRDZqcmxIazdvYUxj?=
 =?utf-8?B?WXJYUjVSTmlnNGNFS3lVbURrTkExSlY1TE8wZzhYVS85M1pLRVh1NlNCcS9V?=
 =?utf-8?B?WmNGWGI1RTlZWlhmNlFCeGg2ZDhvSFVnOFlLNUYvMllLTzRDeTB0M3VuT3Bp?=
 =?utf-8?B?d2ZYdEswY0tEM0ZpUmN5VkNSaTR0WmRCUytQb0ZPcDg5MDYwbE9JUzBiMDdZ?=
 =?utf-8?B?eXlYVWg2UnZMNWp4MERVcmJTTmF0Mm5zVElkaVhPUCtNRm9rU1p4YTRVb3BR?=
 =?utf-8?B?SURBbDY0SUJ5SmVXd2d5S04zbE55WnM4NGhrcTEySDJxSGJPbm1rb0tDWStG?=
 =?utf-8?B?SUVHZVk1Tk05cGg4a2J2NG5JcFZjTm9MVmc5SGhUcXcwbmpCMjN4VlI3TVZ4?=
 =?utf-8?B?ZmZIN2VNdmd2bFhGMWxDV09JWGhHTUsxc3VZekZVUWZ2VXplQ2Uxd29pREVz?=
 =?utf-8?B?L250NTQ2a0NPV1V4bjNpOWk0czJjT2JxM3ZTajI5WXA1dktoSlI0M2M3TUZW?=
 =?utf-8?B?cjdRTVU1T2VwWnRuWDBzdWllWFFIRkpESTBDVnZaU3l2ekVNMHE2V2UwMndX?=
 =?utf-8?B?UkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 06957553-b5e3-48ae-9d2e-08dc83e4e417
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2024 15:50:28.4847 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lnetM1lnjgVEF4GOT5OZY+ulJePRikxEWUD0zLynyFXlmgQuu5JqyfTa3OV56UpBfb1pmrGdahQQMSGsXaBSfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6974
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

Quoting Radhakrishna Sripada (2024-05-30 12:13:07-03:00)
>xe_trace.h is getting bloated. Group related events to their own
>files. All bo, vm and vma related events have been moved to=20
>xe_trace_bo.h. GuC related trace events have been moved to
>xe_trace_guc.h. Patches 1 and 2 splits the trace events into
>seperate files.
>
>In multi gpu environments, it is important to know the device from
>which the event was triggered. Print the device id information along
>with the trace information being printed. Patches 3, 4 and 5 make
>changes to print the device id's if not already captured.
>
>Mmio reg read writes are important tracing information that needs to be
>captured and will be helpful in display debug. Patch 6 adds the reg
>read/write tracing support.

As a general comment, I see that we are using dev_name() in multiple
places, at the call sites of the trace_*() functions.

Wouldn't it be cleaner (and maybe a tiny bit more efficient) if we just
had the trace event prototypes to receive the pointer to struct
xe_device and get the dev name inside TP_fast_assign()?

Another benefit of that approach is that it get easier to print more
xe-specific device info in the future if we feel like it.

--
Gustavo Sousa

>
>Earlier versions of patch 6 can be found here:
>v1: https://patchwork.freedesktop.org/series/119312/
>v2: https://patchwork.freedesktop.org/series/132626/
>
>Radhakrishna Sripada (6):
>  drm/xe/trace: Extract bo, vm, vma traces
>  drm/xe/trace: Extract guc related traces
>  drm/xe/trace: Print device_id in xe_trace_bo events
>  drm/xe/trace: Print device_id in xe_trace_guc events
>  drm/xe/trace: Print device_id in xe_trace events
>  drm/xe: Add reg read/write trace
>
> drivers/gpu/drm/xe/Makefile                 |   2 +
> drivers/gpu/drm/xe/xe_bo.c                  |   2 +-
> drivers/gpu/drm/xe/xe_gt_pagefault.c        |   2 +-
> drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c |  27 +-
> drivers/gpu/drm/xe/xe_guc_ct.c              |  15 +-
> drivers/gpu/drm/xe/xe_migrate.c             |   2 +-
> drivers/gpu/drm/xe/xe_mmio.c                |  22 +-
> drivers/gpu/drm/xe/xe_pt.c                  |   8 +-
> drivers/gpu/drm/xe/xe_trace.h               | 368 +++-----------------
> drivers/gpu/drm/xe/xe_trace_bo.c            |   9 +
> drivers/gpu/drm/xe/xe_trace_bo.h            | 244 +++++++++++++
> drivers/gpu/drm/xe/xe_trace_guc.c           |   9 +
> drivers/gpu/drm/xe/xe_trace_guc.h           | 107 ++++++
> drivers/gpu/drm/xe/xe_vm.c                  |   2 +-
> 14 files changed, 480 insertions(+), 339 deletions(-)
> create mode 100644 drivers/gpu/drm/xe/xe_trace_bo.c
> create mode 100644 drivers/gpu/drm/xe/xe_trace_bo.h
> create mode 100644 drivers/gpu/drm/xe/xe_trace_guc.c
> create mode 100644 drivers/gpu/drm/xe/xe_trace_guc.h
>
>--=20
>2.34.1
>
