Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EABDFC77B7C
	for <intel-xe@archiver.kernel.org>; Tue, 24 Jun 2025 02:17:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87C1A10E49C;
	Tue, 24 Jun 2025 02:17:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X3KAI5oG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4327D10E49C
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Jun 2025 02:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750731472; x=1782267472;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=G5dVp/xR6GTwRYDBTEp0HcFJGC9ut7JgjOdX0rqLRNM=;
 b=X3KAI5oGpQFvBh4T1WalOFpVVeVlEq9xywb5nQFBRBmgSCUf0X//Hi6D
 w4/3rloWqmXUIWsSR55Ify6V/mH1sswJbW74RUrUdIYRJ5MnYsi+5NKpH
 gKUjG6Md0vgKluW44Z2GIxK7gYzB4KLHjk8mBq5J+vVrjuwEZrcq+LKSs
 wmHzZaFqcd+kXK5hfMFhi9UYruxHO1ypq3kj7aJucV4AmH579Xw/p4STW
 nRbZ4d8ymv2x3RCuJFZ9SzQgrV2xx4ymRPBO+FxZS+GTZ/bLhppGFfuSy
 YZqBpc0Q3fkk8knYbB2BFqlVPe9VrCWyWVq/q6pCzAFJqmA+U9eJpC0nB Q==;
X-CSE-ConnectionGUID: xa9tg7NHTniLS/H2Xox3jA==
X-CSE-MsgGUID: VWrP3MmNQCeE8ekN8V/Ylg==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="63225216"
X-IronPort-AV: E=Sophos;i="6.16,260,1744095600"; d="scan'208";a="63225216"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 19:17:51 -0700
X-CSE-ConnectionGUID: veQimsNfRP+ECEcEB2oZuw==
X-CSE-MsgGUID: R2PRvWmvTYW9xO1Jl1wJ1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,260,1744095600"; d="scan'208";a="152294331"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 19:17:33 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 23 Jun 2025 19:17:16 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 23 Jun 2025 19:17:16 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (40.107.101.69)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 23 Jun 2025 19:17:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WMQbQgZ2GKCea5EV4WWtuKzBHqiNTyOKlpiMvSsuwz1NMfLaC9Ak0RecKLUThxrvn7orkBpB6mDOlxdRzuOT9UKAaKxCUATA0wUcPnYhX6ov4hjWQirFjJpncEk/eNs+Clet+4VZ55A+m/NSDxNTJv1ycfu5ATXE5EC9BO/dNk+W/NLzLgig0Rp+rgu0GV4HjREiyxe7uCOivRaGRcncR3Ehzvl4GCyYrig5DEbw0OFLyeGB8B/aXl1NhAJGS2EifW+oqB5S4RUlHflVsyhcn6n2wpR/fVlEjFKfU0kdd3wZVxxtQ1IgPdFk4jh0XD7iUZE4sVqxf2Msu/LHVlStoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rB0qx9YDpDdyPqAXluuVuAWhVgt8Hdhdxt3GTXVoorU=;
 b=blip7ALJLtgMCuYDBYd17l9yY3ejaxlJykTjkkXerPoMANUrKd1RxG4lQYuu9Tr/GMlTAG9t7hXTLSzsO2EkRD7fSWJMEGSUuuzTRw2PVL2Lqqg3MaImXpvRxiFDuvlhEn1mT8UcFvrgW6PbfzJGqKpED/e4iDsVMsAJ6Oq6s6MIHM4d2ygzpPE6tUFnkgj0FWCNzW0uzplX6K1t2z54zHKaWykB72NTqxE1/eI2zYovBkkLyjJanNQtxOnBJSb8nWt/goZNnz7K/lMN32LmtLAuR+zw5iOKB0cl5slNBguzu0j2SoC3FqQ8r4zt15cT/MOAK9/H0VFTDDD+kKeNdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA3PR11MB8073.namprd11.prod.outlook.com (2603:10b6:806:301::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Tue, 24 Jun
 2025 02:16:59 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8857.026; Tue, 24 Jun 2025
 02:16:59 +0000
Date: Mon, 23 Jun 2025 19:18:38 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v4 19/20] drm/xe/uapi: Add UAPI for querying VMA count
 and memory attributes
Message-ID: <aFoK/ldaqoZFBRw0@lstrano-desk.jf.intel.com>
References: <20250613125558.2607665-1-himal.prasad.ghimiray@intel.com>
 <20250613125558.2607665-20-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250613125558.2607665-20-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: MW4P222CA0018.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::23) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA3PR11MB8073:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c0c4623-cbd8-45f4-a3ae-08ddb2c53310
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QzNFLzNISGR0ODErbTFqelRkS3EvT2x0Z2d5Y0cydDIzZmFQZG1YKzRVRmE4?=
 =?utf-8?B?QU96c28xVEsrV01ST0d5THhxZ2pHK3p3ZThxK3lXVWRXVWhDSU5KbGdlQ203?=
 =?utf-8?B?SnNtYlk0cTh4ZzJJeXJEWXhzMi9UOWh0MXhveGpHYWtqZjdqWnJYeWxYMWox?=
 =?utf-8?B?MmNpbVlXQzdhdGRLRG0rZGdhejB3blQ1RVp4d2oxNERIQVhCaEtpMW1TRWpF?=
 =?utf-8?B?K1FubW9YelMrZ1NYUi90ZEFKMVI5eHFTYXBaMlc1TXlLdWlkREVEWnk5L3lj?=
 =?utf-8?B?M0VoNmpiZmwwbzk1Qi9tRGYxWG9RSGxnVGlJNXk1YVFpSW9lTW9OQWt2QWgw?=
 =?utf-8?B?RVgva3hOTXd3VmsyU1p1cElzYU03UmwxdWN3UlE5STIwWmErMDNSUkJsTXd3?=
 =?utf-8?B?cmVybzNZSDQyNDhDbFNHSDR2dTc2Y2tLR01lR0xaVFExNmwxOENqN0xFS0d6?=
 =?utf-8?B?UlVadUNYemsrRTRRMEVYcllXM0M1eWlTajViLy9iY3lxTWVTdG56Z21lMTgw?=
 =?utf-8?B?VWhjQVBHbTV3NldMaUFwOVRVYlJIY0pIcE9UbjloSEZ4TEZwUG9oWmdQcXZR?=
 =?utf-8?B?YWNvNlpZa0V1R0NSZkMzYTVGNHp0emlidGJwK1FBMXV3OVN1eHg3SWIwT2NV?=
 =?utf-8?B?bmQyRDk4VldqYnp4dzB0SmtsQU8vczkyTUlkUGVCeVVZdVY2OUFONWsxQ1pq?=
 =?utf-8?B?WVZzOU9XYmVPdG9ENXMvWXBkajE2R1lHVzVvdVMxTzdDUUZJbjJQM1grMVh1?=
 =?utf-8?B?bC9XRnN4TUN2SGNqRXR1NUE0SG5MaTkzOUFLcVhWY1JZNHJqdWtMQW5RUmM2?=
 =?utf-8?B?M0kxNkN1L0oxd085eS84TWpVVmhHMVJkYi9sVUNIanJ5cHdOTHg5ZGVDZUtJ?=
 =?utf-8?B?aGt4L0V5VHZSV01FVHFhQUQzNmNlOFo2RmFpQ1FDVUoveFdZNS9PVHZXQ2xX?=
 =?utf-8?B?N0JjMG9iYTVTbGdwUHpqQ0haUytJbzJCTmdEbmFybVVqdlY0NTlUZGs2c1Ny?=
 =?utf-8?B?NGFiT1RHY3VmRDZ4TU5ZbVJreDRRY3VHTk5yNzVFUUFxNlhmWlhOTXc0WHpj?=
 =?utf-8?B?NVhKUk9veUt0SnVtT0NaVzRKd3c5MVgrNndoSk1waVFxZWRZNEVKSmNSK29k?=
 =?utf-8?B?WjJJdW5XQmpoVXluNXZ1bjRMQ3Uyd3NLc1FlQUJ5c3MrVXhSODBlUDhsbzRX?=
 =?utf-8?B?SS9JWmNhVEZjaGdsOHNwc2wvK3A0WGg2eDV1enVCL0MyUFFZYWFGTHlLazlB?=
 =?utf-8?B?S2U1V0hjTkxRQ2NmTjBHWGhGYUVhTnRUL2NCM3V6YXExQ2VSTms1YWpkU1FS?=
 =?utf-8?B?NXU4RW1ENkxmWG04ZXJ5dGp5L3g1eHowalRKbGU2UTNxMDFCeGMwVVVIUEpW?=
 =?utf-8?B?amhrR2xqc0VjQ3pablRGRFJxRnorVFFsV3d0SER1RnNIWHhiaXM2bWVaQXZD?=
 =?utf-8?B?R0RITGtRQ0ZBY29PM3cxY3Jjck5KWjNBdkprTVEyR2ZpY1BxeWhpZzhoN2R2?=
 =?utf-8?B?bkxNTkhyUzVhNHF1MzZzRk53aU12b09oT3FlU0dEdFp6MGI0YjM4MmhoOXBt?=
 =?utf-8?B?QWxhRDdUWk9IWG5MeUN3VVI4aDFyQ04xN1AwbnNBSWJ0Vmo1RVhpRG1LTk5R?=
 =?utf-8?B?eWgrakNkRVV1MkdYeG1NektydFRIWk92cTYvMWxOeC9TYTlGVUtkZlI2U095?=
 =?utf-8?B?WGZtZmNvb3dmSDdFQXg0OE5tWmx5and3L2QwWG1uc3BvYm9zTnB4cjdSZlY1?=
 =?utf-8?B?NzRERWszeWxNcVdZS21OZVRXWExyTEFzUFRUSHYzaVlhUW9CNS96SmxPTkVv?=
 =?utf-8?B?anhUVFMyOGwwR3ppeXNBUVMyMTNvazBhc1VITUkwaXcraEVGc0dPRGFsdXhu?=
 =?utf-8?B?ZHRCQ3JSMlpGaUZMMkx5Zm9lSkorTUNtUlh2bmJVcUpLVEJQTzNjN2JJNWNt?=
 =?utf-8?Q?uw1gaEQ9HNo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RzU5MEVKeHlZd3ZxbzFrV0lNK3RUYTdkaS8vSUV5WFhmOU00TjB4TFRFU0V1?=
 =?utf-8?B?b0VLSXpNb21WZStaeUc4MGZhOC8xbXJQWDNTQkFPWE41MVZ3bG1qQU0rdVIy?=
 =?utf-8?B?QkF2b2s4TWxkMEU0bW1hWWxWaGN1UTVaZU5Pcy8yWTJVTkx4czRUaGlzUHIr?=
 =?utf-8?B?clRZMW5JUVpWdmw4aFY1bitRZHNOSW85bjhkUFRpTnB1Umd6am1XZ3BvSGpY?=
 =?utf-8?B?QUhpMzRTNnZCOWdiVEY3OTBVOVUxVCtTaWlRV2xhZVNyNFNDWjJ3NDk4YUxr?=
 =?utf-8?B?UkM3UTRGdnNMMXR3NG9QL3JoRHJuRHVXd0VUTEZzQzlQL3Z0UFBBMUxNUTVh?=
 =?utf-8?B?QnQ1WW94S2kyQXBBalNRYnMwUmdNOVgxMVNzblV5SFI5dTd6UmhjaDY1R1pD?=
 =?utf-8?B?YWc2ckpTWGJMWW1EcVBvdnpPWmMzQmNCOWRXak9FK0o4YW5CTXQxaU5kMEpl?=
 =?utf-8?B?YVlMejBXL3JESEc4TW54WktWTE96dC9ISEEwWjdlODVBd2lPVExPVDZzV01h?=
 =?utf-8?B?UVFVZTNLNDF1OU1aMUpYeVJ2NG9vR21hVEZyRjNFR1phMEJnUE0xOXpUY05l?=
 =?utf-8?B?TUVSUHhWbHZIRFNGVWVBblZtUXZqOEozS2hIWXVYU1lZS1JJVmkwSDBXckFV?=
 =?utf-8?B?d05kOXlmYlg3ZG1KMk9YcEF3S3l2LzljbXV5RVVpVUZJMDlaeEw2NTIzUS9Q?=
 =?utf-8?B?RjI5cnM2QVhjMzBqaWZ0ZFkzZzlNcHlTVk0xNVlkWURmYmNnRHl5emFjRmho?=
 =?utf-8?B?K1ZNOGlnY2ZZTUMvZllRSlViNFhndUVPVkROTFEyRnM2ei8zd2RWTUM0NXdo?=
 =?utf-8?B?eDd2dHlsSUxzQ3dHeTM0Q2FFVlRNK3llZzhWVXgvNTJ6bWEwRlJmWnlrU3Fj?=
 =?utf-8?B?SlJnQ2g0Q2FVSnJSUExuUUxUU25LUHNueWNvZzNxR1ByM2V5eXpMellqaUxK?=
 =?utf-8?B?cWRiNEtSbm84VzdkMUlpYnZEdUUzZTJORm84M0dycnliejlNeTZKeUIwMCtt?=
 =?utf-8?B?b2NnUlFmN3pHZStpMFdtMW9UMDUzNERGcENSbzhQS2FrZ29BYlB6cXBvQklq?=
 =?utf-8?B?UjNPaHU5b2I2cUZSVnBaN3NKTlFOUi84cFpTTFlqNDNxNm13U2kwck4wb05D?=
 =?utf-8?B?TnN6Um5GRkVLdDY4SGV1SU91WFVyM2VRemRuWHh1dTg0VWVxaXR6SmpaalJP?=
 =?utf-8?B?TUZFZHVnNjI4MjRROXZyM2lQV0dKQ1VsVXdZekthQTNuK0Qzb01YMjBpNWI4?=
 =?utf-8?B?a0E3eXdoT05zaU5DS2xmNmoyNlgxQWI4ck9Jb0pnWllpN25HR3FCaWFPZWxR?=
 =?utf-8?B?bmhKSnRaOW5WWHRMN3FXZTlDWGl0SmQrZ2pxQUlhY3AvOG9kS0hZRlIvRVZR?=
 =?utf-8?B?VndNanhKQmJmREN4OFhWN1cxYmdMUGI4bkNiVU5rY0hseHZ6eU9JRGZoQzA0?=
 =?utf-8?B?cjdlZnZud0pRTWlTV0RmUG9Lb1FDem9KajZIUGppbXBQMzFxekJVT3I2Yjhj?=
 =?utf-8?B?YjlUKzF0NVFNMnZVbjdXcktyMGtPanljNDJUd2U5RkowaEo2VGFUdmNhS0Rs?=
 =?utf-8?B?cWdUMHlBWkxQdTkyK1liNm9MVGpyeWxpejZTNnlqN2lvVk5JWWhiR1lxZXhw?=
 =?utf-8?B?Z1NncFg0QnRvelhyM2tHcmZwNFVJRFl5Q3lmYWRvY3JIZVBQTDNFMjg2dDgv?=
 =?utf-8?B?ckFzZkljMy9aaVYxc2t3bmlSNHJBUDdtUHNCb1ZjUlltWnBWUDJsUm1XNG9K?=
 =?utf-8?B?dUhlV2JZa1RmZVlwOGpoQ1d2SkEyakMxWW0yQ3F3Qnhvd0s3SG9reFVENkZr?=
 =?utf-8?B?d3N2cC8vU3JzSDZFZWVpdkhvN1VxOUg2aGN4ZnVVMWdhNU12Z3NlbVZwZE1v?=
 =?utf-8?B?Q0hiV0Y5L3pHZklhMWkwVk9WbTJkOWtaMVpxRy9UekFtZ1YrVFhtQmdhQ2I4?=
 =?utf-8?B?R1dKUEhEd2ZOUDQ5L1BoaFRjT1cxZWRnTGxkMXJPTnNTaEpMTFMzNXJZcFpF?=
 =?utf-8?B?b0diamQvQnJzOTM0RlJpZTVkVmswcmFKQW9PdnhDakZpTjFveXRpK3h6VlRv?=
 =?utf-8?B?bngrT0FMTmN5K1BPb0pJWVN1bTl2ZmJodDAvbWd4Q2FKSlJBL1drSzZkUlA3?=
 =?utf-8?B?NDNremFtMnJTYjA3N3FQWkQwVk9SUTFaYzJoWUVoLzNIaFoxNHFrWGZqenk4?=
 =?utf-8?B?a1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c0c4623-cbd8-45f4-a3ae-08ddb2c53310
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 02:16:59.3376 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mwB7GbWxwUw09A8vBKgcQazF5Q7qYvg9rQ8FHKfWX5xVAgiqNWRA1yHSvBv7UYvOvSaUGWfmWa1+61fPgxWr3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8073
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

On Fri, Jun 13, 2025 at 06:25:57PM +0530, Himal Prasad Ghimiray wrote:
> Introduce the DRM_IOCTL_XE_VM_QUERY_VMAS_ATTRS ioctl to allow userspace
> to query memory attributes of VMAs within a specified virtual address
> range.
> If num_vmas == 0 and vector_of_vma_mem_attr == NULL, the ioctl returns
> the number of VMAs in the specified range.
> If num_vmas > 0 and a valid user pointer is provided in
> vector_of_vma_mem_attr, the ioctl fills the buffer with memory
> attributes for each VMA.
> This two-step interface allows userspace to first query the required
> buffer size, then retrieve detailed attributes efficiently.
> 
> v2 (Matthew Brost)
> - Use same ioctl to overload functionality
> 
> v3
> - Add kernel-doc
> 
> Cc: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c |   1 +
>  drivers/gpu/drm/xe/xe_vm.c     |  89 ++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_vm.h     |   2 +-
>  include/uapi/drm/xe_drm.h      | 130 +++++++++++++++++++++++++++++++++
>  4 files changed, 221 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 632d3ab12392..1f9969acbcd9 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -199,6 +199,7 @@ static const struct drm_ioctl_desc xe_ioctls[] = {
>  			  DRM_RENDER_ALLOW),
>  	DRM_IOCTL_DEF_DRV(XE_OBSERVATION, xe_observation_ioctl, DRM_RENDER_ALLOW),
>  	DRM_IOCTL_DEF_DRV(XE_MADVISE, xe_vm_madvise_ioctl, DRM_RENDER_ALLOW),
> +	DRM_IOCTL_DEF_DRV(XE_VM_QUERY_VMAS_ATTRS, xe_vm_query_vmas_attrs_ioctl, DRM_RENDER_ALLOW),
>  };
>  
>  static long xe_drm_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 14e554f3f4d5..d9ce25f3abf4 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -2171,6 +2171,95 @@ int xe_vm_destroy_ioctl(struct drm_device *dev, void *data,
>  	return err;
>  }
>  
> +static void xe_vm_query_vmas(struct xe_vm *vm, u32 *num_vmas, u64 start, u64 end)
> +{
> +	struct drm_gpuva *gpuva;
> +
> +	lockdep_assert_held(&vm->lock);
> +	drm_gpuvm_for_each_va_range(gpuva, &vm->gpuvm, start, end)
> +		(*num_vmas)++;
> +}
> +
> +static int get_mem_attrs(struct xe_vm *vm, u32 *num_vmas, u64 start,
> +			 u64 end, struct drm_xe_vma_mem_attr *attrs)
> +{
> +	struct drm_gpuva *gpuva;
> +	int i = 0;
> +
> +	lockdep_assert_held(&vm->lock);
> +
> +	drm_gpuvm_for_each_va_range(gpuva, &vm->gpuvm, start, end) {
> +		struct xe_vma *vma = gpuva_to_vma(gpuva);
> +
> +		if (i == *num_vmas)
> +			return -EINVAL;
> +
> +		attrs[i].start = xe_vma_start(vma);
> +		attrs[i].end = xe_vma_end(vma);
> +		attrs[i].atomic.val = vma->attr.atomic_access;
> +		attrs[i].pat_index.val = vma->attr.pat_index;
> +		attrs[i].preferred_mem_loc.devmem_fd = vma->attr.preferred_loc.devmem_fd;
> +		attrs[i].preferred_mem_loc.migration_policy = vma->attr.preferred_loc.migration_policy;
> +
> +		i++;
> +	}
> +
> +	if (i <  (*num_vmas - 1))
> +		*num_vmas = i;
> +	return 0;
> +}
> +
> +int xe_vm_query_vmas_attrs_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> +{
> +	struct xe_device *xe = to_xe_device(dev);
> +	struct xe_file *xef = to_xe_file(file);
> +	struct drm_xe_vma_mem_attr *mem_attrs;
> +	struct drm_xe_vm_query_vmas_attr *args = data;
> +	u64 __user *attrs_user = u64_to_user_ptr(args->vector_of_vma_mem_attr);
> +	struct xe_vm *vm;
> +	int err = 0;
> +
> +	if (XE_IOCTL_DBG(xe,
> +			 (args->num_vmas == 0 && attrs_user) ||
> +			(args->num_vmas > 0 && !attrs_user)))
> +		return -EINVAL;
> +
> +	vm = xe_vm_lookup(xef, args->vm_id);
> +	if (XE_IOCTL_DBG(xe, !vm))
> +		return -EINVAL;
> +
> +	down_read(&vm->lock);
> +
> +	attrs_user = u64_to_user_ptr(args->vector_of_vma_mem_attr);
> +
> +	if (args->num_vmas == 0 && !attrs_user) {
> +		xe_vm_query_vmas(vm, &args->num_vmas, args->start, args->start + args->range);
> +		goto unlock_vm;
> +	}
> +
> +	mem_attrs = kvmalloc_array(args->num_vmas, sizeof(struct drm_xe_vma_mem_attr),
> +				   GFP_KERNEL | __GFP_ACCOUNT |
> +				   __GFP_RETRY_MAYFAIL | __GFP_NOWARN);
> +	if (!mem_attrs) {
> +		err = args->num_vmas > 1 ? -ENOBUFS : -ENOMEM;
> +		goto unlock_vm;
> +	}
> +
> +	err = get_mem_attrs(vm, &args->num_vmas, args->start,
> +			    args->start + args->range, mem_attrs);
> +	if (err)
> +		goto free_mem_attrs;
> +
> +	err = __copy_to_user(attrs_user, mem_attrs,
> +			     sizeof(struct drm_xe_vma_mem_attr) * args->num_vmas);
> +
> +free_mem_attrs:
> +	kvfree(mem_attrs);
> +unlock_vm:
> +	up_read(&vm->lock);
> +	return err;
> +}
> +
>  static bool vma_matches(struct xe_vma *vma, u64 page_addr)
>  {
>  	if (page_addr > xe_vma_end(vma) - 1 ||
> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> index 1fb639a33ffb..e4a601a3583f 100644
> --- a/drivers/gpu/drm/xe/xe_vm.h
> +++ b/drivers/gpu/drm/xe/xe_vm.h
> @@ -195,7 +195,7 @@ int xe_vm_destroy_ioctl(struct drm_device *dev, void *data,
>  			struct drm_file *file);
>  int xe_vm_bind_ioctl(struct drm_device *dev, void *data,
>  		     struct drm_file *file);
> -
> +int xe_vm_query_vmas_attrs_ioctl(struct drm_device *dev, void *data, struct drm_file *file);
>  void xe_vm_close_and_put(struct xe_vm *vm);
>  
>  static inline bool xe_vm_in_fault_mode(struct xe_vm *vm)
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 81e90270313d..c0aa7c19870e 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -82,6 +82,7 @@ extern "C" {
>   *  - &DRM_IOCTL_XE_WAIT_USER_FENCE
>   *  - &DRM_IOCTL_XE_OBSERVATION
>   *  - &DRM_IOCTL_XE_MADVISE
> + *  - &DRM_IOCTL_XE_VM_QUERY_VMAS_ATTRS
>   */
>  
>  /*
> @@ -104,6 +105,7 @@ extern "C" {
>  #define DRM_XE_WAIT_USER_FENCE		0x0a
>  #define DRM_XE_OBSERVATION		0x0b
>  #define DRM_XE_MADVISE			0x0c
> +#define DRM_XE_VM_QUERY_VMAS_ATTRS	0x0d
>  
>  /* Must be kept compact -- no holes */
>  
> @@ -120,6 +122,7 @@ extern "C" {
>  #define DRM_IOCTL_XE_WAIT_USER_FENCE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT_USER_FENCE, struct drm_xe_wait_user_fence)
>  #define DRM_IOCTL_XE_OBSERVATION		DRM_IOW(DRM_COMMAND_BASE + DRM_XE_OBSERVATION, struct drm_xe_observation_param)
>  #define DRM_IOCTL_XE_MADVISE			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_MADVISE, struct drm_xe_madvise)
> +#define DRM_IOCTL_XE_VM_QUERY_VMAS_ATTRS	DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_VM_QUERY_VMAS_ATTRS, struct drm_xe_vm_query_vmas_attr)
>  
>  /**
>   * DOC: Xe IOCTL Extensions
> @@ -2093,6 +2096,133 @@ struct drm_xe_madvise {
>  	__u64 reserved[2];
>  };
>  
> +/**
> + * struct drm_xe_vma_mem_attr - Output of &DRM_IOCTL_XE_VM_QUERY_VMAS_ATTRS
> + *
> + * This structure is provided by userspace and filled by KMD in response to the
> + * DRM_IOCTL_XE_VM_QUERY_VMAS_ATTRS ioctl. It describes memory attributes of
> + * a VMA within a specified address range in a VM.
> + *
> + * The structure includes information such as atomic access policy, purgeable
> + * state, page attribute table (PAT) index, and preferred memory location.
> + * Userspace allocates an array of these structures and passes a pointer to the
> + * ioctl to retrieve attributes for each VMA
> + *
> + * @extensions: Pointer to the first extension struct, if any
> + * @start: Start address of the virtual memory area
> + * @end: End address of the virtual memory area
> + *
> + * @atomic.val: Value of atomic operation policy
> + * @atomic.reserved: Reserved, must be zero
> + *
> + * @purge_state_val.val: Value for DRM_XE_VMA_ATTR_PURGEABLE_STATE
> + * @purge_state_val.reserved: Reserved, must be zero
> + *
> + * @pat_index.val: Page Attribute Table (PAT) index
> + * @pat_index.reserved: Reserved, must be zero
> + *
> + * @preferred_mem_loc.devmem_fd: File descriptor for preferred device memory
> + * @preferred_mem_loc.migration_policy: Migration policy for memory placement
> + *
> + */
> +struct drm_xe_vma_mem_attr {
> +	 /** @extensions: Pointer to the first extension struct, if any */
> +	__u64 extensions;
> +
> +	/** @start: start of the vma */
> +	__u64 start;
> +
> +	/** @end: end of the vma */
> +	__u64 end;
> +
> +	struct {
> +		struct {
> +		/** @atomic.val: atomic attribute for vma*/
> +			__u32 val;
> +
> +		/** @atomic.reserved: Reserved */
> +			__u32 reserved;
> +		} atomic;
> +
> +		struct {
> +			/** @pat_index.val: PAT index of vma */
> +			__u32 val;
> +
> +			/** @pat_index.reserved: Reserved */
> +			__u32 reserved;
> +		} pat_index;
> +
> +		/** @preferred_mem_loc: preferred memory location */
> +		struct {
> +			/** @preferred_mem_loc.devmem_fd: fd for preferred loc */
> +			__u32 devmem_fd;
> +
> +			/** @preferred_mem_loc.migration_policy: Page migration policy */
> +			__u32 migration_policy;
> +		} preferred_mem_loc;
> +	};

I just realized this interface isn’t very future-proof. Let me give an
easy example of how this could break. Let’s say we add three more
madvise attributes at some point in the future — we wouldn’t be able to
fit those three additional attributes here.

Hmm, maybe in drm_xe_vm_query_vmas_attr we could also return the sizeof
a single struct drm_xe_vma_mem_attr entry. That would allow us to grow
individual entries indefinitely without breaking userspace, as long as
it does something like the code below, and as long as we only grow
struct drm_xe_vm_query_vmas_attr by appending new fields (i.e. we never
reorder existing ones).

struct drm_xe_vm_query_vmas_attr query = {
    .vm_id = vm,
    .start = start,
    .range = range,
};

/* First ioctl to get number of VMAs and the size of each attribute */
ioctl(fd, DRM_IOCTL_XE_VM_QUERY_VMAS_ATTRS, &query);

/* Allocate buffer for the VMA attributes */
void *ptr = malloc(query.num_vmas * query.sizeof_vma_mem_attr);

query.vector_of_vma_mem_attr = (uintptr_t)ptr;

/* Second ioctl to actually fill the VMA attributes */
ioctl(fd, DRM_IOCTL_XE_VM_QUERY_VMAS_ATTRS, &query);

/* Iterate over the returned VMA attributes */
for (unsigned int i = 0; i < query.num_vmas; ++i) {
    struct drm_xe_vma_mem_attr *vma_attr = (struct drm_xe_vma_mem_attr *)ptr;

    /* Do something with vma_attr */

    /* Move pointer by one VMA entry */
    ptr += query.sizeof_vma_mem_attr;
}

I think we need to double-check with the maintainer to see if this type
of interface is allowed, but I don’t see any reason why it wouldn’t be.

Matt

> +
> +	 /** @reserved: Reserved */
> +	__u64 reserved[2];
> +};
> +
> +/**
> + * struct drm_xe_vm_query_vmas_attr - Input of &DRM_IOCTL_XE_VM_QUERY_MEM_ATTRIBUTES
> + *
> + * This structure is used to query memory attributes of virtual memory areas
> + * (VMAs) within a specified address range in a VM. It provides detailed
> + * information about each VMA, including atomic access policy, purgeable state,
> + * page attribute table (PAT) index, and preferred memory location.
> + *
> + * Userspace first calls the ioctl with @num_vmas = 0 and
> + * @vector_of_vma_mem_attr = NULL to retrieve the number of VMAs in the range.
> + * Then, it allocates a buffer of that size and calls the ioctl again to fill
> + * the buffer with VMA attributes.
> + *
> + * Example:
> + *
> + * .. code-block:: C
> + *
> + *     struct drm_xe_vma_mem_attr *attrs;
> + *     __u32 num_vmas;
> + *
> + *     // First call to get number of VMAs
> + *     ioctl(fd, DRM_IOCTL_XE_VM_QUERY_VMAS_ATTRS, &query);
> + *     num_vmas = query.num_vmas;
> + *
> + *     // Allocate and query attributes
> + *     attrs = malloc(num_vmas, sizeof(*attrs));
> + *     query.vector_of_vma_mem_attr = (__u64)(uintptr_t)attrs;
> + *     query.num_vmas = num_vmas;
> + *     ioctl(fd, DRM_IOCTL_XE_VM_QUERY_VMAS_ATTRS, &query);
> + */
> +struct drm_xe_vm_query_vmas_attr {
> +	/** @extensions: Pointer to the first extension struct, if any */
> +	__u64 extensions;
> +
> +	/** @vm_id: vm_id of the virtual range */
> +	__u32 vm_id;
> +
> +	/** @num_vmas: number of vmas in range */
> +	__u32 num_vmas;
> +
> +	/** @start: start of the virtual address range */
> +	__u64 start;
> +
> +	/** @size: size of the virtual address range */
> +	__u64 range;
> +
> +	/**
> +	 * @vector_of_ops: userptr to array of struct
> +	 * drm_xe_vma_mem_attr
> +	 */
> +	__u64 vector_of_vma_mem_attr;
> +
> +	/** @reserved: Reserved */
> +	__u64 reserved[2];
> +
> +};
> +
>  #if defined(__cplusplus)
>  }
>  #endif
> -- 
> 2.34.1
> 
