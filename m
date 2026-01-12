Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEF76CF45C1
	for <intel-xe@archiver.kernel.org>; Mon, 12 Jan 2026 18:32:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8287810E063;
	Mon, 12 Jan 2026 18:32:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S+tzfrk4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A81B610E063
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Jan 2026 18:32:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768242753; x=1799778753;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=RG7ltxbcYlYeIrLa2kYFb8UYhVWcJOPZHCfEWO2FFcE=;
 b=S+tzfrk4GGysfqfqhI4O89nFFDeuGuZzTwXmS9jozhmPAvl6z7xWZu9K
 k9neZKSGv0C7gJ1D7psmnZ6Pi3tZqpEW90UQ9ikgotqmTzT7dh5dUVFaM
 zarSGDPXiAOIZKkGJdI/DLfGeANUixUQEYMxWIuobP+MITUe2faJ5319N
 Fju28NNpKuncxSmr2mQ9jp6yz1AYcXAGnb8vXpE52+GACtQhwv24yfY1M
 i8ArV9ycYwpPTYuvBOjFdtzkHR4L3BmDtvu7KsBYchc//k8UM4akVIj/c
 5OCylK+exSdjXldawn4RJZ+jQIvCPkAUguOPozaQU0AHQ5Gv28eMuFJvj g==;
X-CSE-ConnectionGUID: p8Ano6JSSUm1sht67R75zw==
X-CSE-MsgGUID: mfmkMYgbR0G007QwYBy1iA==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="68527833"
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; d="scan'208";a="68527833"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 10:32:33 -0800
X-CSE-ConnectionGUID: eaEc9Hv3SRG+a+oH6pKW5g==
X-CSE-MsgGUID: XCEjv8DUTmGvNjD437Vhcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; d="scan'208";a="204441429"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 10:32:32 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 12 Jan 2026 10:32:32 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 12 Jan 2026 10:32:32 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.70)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 12 Jan 2026 10:32:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h6yoYUI0w91+Oi7AV/7dCiEMENA/6bVT7PFFP16o+W1ELfezRyJG01UwHGdFeNrCOTT23S6HC3HIOk9soq338UvwEmPKbtsP7r3cEuqRQymX2Ha9Z6D9qCiq9tBbCRuFq/IuT/IF1Duw4mUmBV0R+r8GbZYUImniUqanymAoITapSE/dls8pKmOTFQ4yxOGW0ZHI4y8tohXT2oudfQxg/svpJSrcmyRl5mhXGLxkX2aZhvrMJHtgbx3TmRFfQvOsGc9GFSyxHZjmc7IAf4+Blq8VqM0MOl5iaTez6wlsNXUm9OQu2Z2sR/BFq6qAJ/SRnz1timKEBHYYC69mJSaXiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xjTFB++gEQ4qjcX/qYBkX9lfEmP3h+DeCFWj9Qa9kRM=;
 b=mKDhnH9qUFw5/EypPc/a/o31NMv6p3/hfBSVxb4QESh8NvUIlA/CLRTuOI2Oz1bTv0hv9IYMEKrPihhjkp2cqHmVett4YrwD1+vmK4UNwbzgZBGAld9FesFOdmARH4emG37MyimO5k9uiz7BoScftZXWaGBvSv7vk9E9a6FwVHUJsew54xTeaSu2nTPLuRpGVU4t0M3tFHP2Z9k2mqHsVCWzoo85XCIxNHLfE0KJcSRubLblsCBIeGuORx4wd+K6VIs2GTNjEhuF7HfWL1VNlJGUYA5V9jCrEQzzrOAwQfgxoQC/yoKqArotA2Icq+EZvDampNrFe6Gm8YacN1y+XA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5249.namprd11.prod.outlook.com (2603:10b6:610:e0::17)
 by BY1PR11MB8005.namprd11.prod.outlook.com (2603:10b6:a03:523::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 18:32:28 +0000
Received: from CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3]) by CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3%4]) with mapi id 15.20.9499.005; Mon, 12 Jan 2026
 18:32:28 +0000
Message-ID: <34da973b-e1b6-48d2-b0d2-d341c767c4b3@intel.com>
Date: Tue, 13 Jan 2026 00:02:21 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/4] drm/xe/hwmon: Expose individual VRAM channel
 temperature
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <rodrigo.vivi@intel.com>
References: <20260112121724.951867-1-karthik.poosa@intel.com>
 <20260112121724.951867-5-karthik.poosa@intel.com>
 <aWU4mvctA-yb7bFN@black.igk.intel.com>
Content-Language: en-US
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <aWU4mvctA-yb7bFN@black.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0242.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ae::16) To CH0PR11MB5249.namprd11.prod.outlook.com
 (2603:10b6:610:e0::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5249:EE_|BY1PR11MB8005:EE_
X-MS-Office365-Filtering-Correlation-Id: 4167e258-1c2f-405b-516b-08de5208f03f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a21CZjU2dDZYM0ROWlFBcGlOS2lSUDluOTdYOFFieVVPS1Q2czVtYlJPQVpR?=
 =?utf-8?B?SDNteURZL3RaRnVNV3IvQVowNnAra2syWHREc25odm96UThZSmltdStjc2k5?=
 =?utf-8?B?cURTVDc2bG5xNTBHd0F1d24vNTUyZUVHald0NkRyRFpXYkVkbmpsR1h0OGsr?=
 =?utf-8?B?YS9vWjg0STIvd1hBL2oxVTVLU2NwdHdRQUJzSlVVWWVXK2pjNkF0Mk5VcEtm?=
 =?utf-8?B?OHlrQkhRc2ZJUXY5TmFZTVp3d1AvZjI1cGRPRkpKVzJ2a0NTMEpXeEFjNG9s?=
 =?utf-8?B?T252K3J3THliTlExZlRFQzlWZUE1NW1Vdzc5aGNEYnNFQVgrZlN0Q0ZyNDFR?=
 =?utf-8?B?OHFaTXZsUENhVnZnQUxpUXZldk55THk2dkU1RjFnSXREaXU4ZjJCdGdHT2Jm?=
 =?utf-8?B?bVNaZW45YWR0YXIwMDdDK1VjeTBCbEtxUXRRZWM1TFY5azVkc3BGTEQ3eDZQ?=
 =?utf-8?B?cFBWUzFyWktkTGorQTV4cFE0dUl0T0lFR0RSLys0M0xYWmNLK0VVTUxyb242?=
 =?utf-8?B?dlh0R3JvUTBNQ2d4ZVBBRkdzNTlFdFc4Ukp6Q2d1eEZ1R0VqamdUNW1aL2R4?=
 =?utf-8?B?ZU1WMEdJd0FlMWo1Tm9FbG1vWmEzK2hkZmQvZzh0eTVLUlJXNnhFQXJDamdJ?=
 =?utf-8?B?bllQSFZGTXFjSks2UDVFRWdDMVNKVWxxOFhScU0xcDNUZ01zRGJrRmM0dHhW?=
 =?utf-8?B?M05wd0VjRzdXYXBoR0t0WU1WL2ZoVXZacDlwYi9lSWZlc1Z3NHpLRnFGbFp5?=
 =?utf-8?B?ZnBhMGtOVjY1QkcyRmdUN2VaWFVSS2tWUnEzYXZNb2ZKL3hORTJUZDdlOHpG?=
 =?utf-8?B?NGMrUzJVSmN6bmV5ZVdFNkdEcXF4SHAvazgrcWRRK0RHTDkydEVsSnZya1Bz?=
 =?utf-8?B?d3A5a1BkWng3c0RGbjhYUTVYbndndkFMK2JEKzlHSWpKVVRKa3FSOW05TnQ1?=
 =?utf-8?B?Z3JNNTJXVmhoSTNocUJXOHpWR1ZqTEJEMzZIUjBMN1VIRzFDSm5rbm1IK2lC?=
 =?utf-8?B?L3hLTmdBVmxUT3BwNGRBUnFxSGU4Q3BGNlVwUWNQSTVXcGJmVWR3SDc4cWw3?=
 =?utf-8?B?RXRxcWJaSnNFSTB5QVVUbWdsOTBPaEEwcHBBcThjU2VERXJDaGhJbDZCTkh6?=
 =?utf-8?B?dWVYN1o2eGdzZTJIclRDN2NNQk4xa1k0NnlKdHNGNHhDS1hXbXJ3NTlUckQw?=
 =?utf-8?B?SWtUT2xpQUN0ZGt5Wk8yeFFJN3Jzblc5SFhUN0p4UjNJVG9XcHo1WEhNeEtJ?=
 =?utf-8?B?MGJ1Sk8yZTQ4bWljSGZ0anl4TEQ3TGNuc2pNV1BDa1pRN3VzUEtuNVlZdGRJ?=
 =?utf-8?B?SWQ5Z00zdWNvbzZNb2QxK3U4NDEyRU1wWFNocXk2UEI4L2tjVXA2anpUYmMr?=
 =?utf-8?B?QWdBdHRLTkJQS2hyQklrdlhoVFJZM2RtSzlINjgwc08wTGdxbkcwbjdJdjhh?=
 =?utf-8?B?VFRhVzBUcnlrdkJzRVErTHNBdVhSemRXWnVzbEFZY3Evc0JpbEs0TSs1Z20w?=
 =?utf-8?B?UGRwTFpTTnloWTU3YWFCenlCdnIzTURDYzJGR1ZOVGx2RGxlbGkyM2FKL281?=
 =?utf-8?B?bGw0dk9KbUxMMDQ1Z0NmSXIzdFZpd0RkMHZ0UCtoV01aNVQ2Nmo0QmVuWDlT?=
 =?utf-8?B?T0FjbFFLeTgwbHNmd29xSGpQRlMwNE5KRG8yVWhwckk5SkEyNmI4NjhGWnh1?=
 =?utf-8?B?QjVRYlBzL3BES0RydEZwK1FPczZOb3BwWjVzbEgwMU9UNmYvMXJKRFFoQ3U3?=
 =?utf-8?B?UktibWFNQU9PUVFseG1rbGZzOHN6N29tMit0cGJKSFY0Z005TlE4czBpSFp6?=
 =?utf-8?B?RzQ5d1NKSEFVQU8xQndEVVA1WjRPRzI5cWQ2UEFPK3ZuZURFVG5KNmpXd0dG?=
 =?utf-8?B?alJlYjNBSXBNdDhLeE44alVGeElFRVZneGxTeVFBMUQ3eW1JYXRPWW5vd1Ju?=
 =?utf-8?Q?RJhzcd81PdUSL71Anj0Aiae8vQsvjbZ+?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5249.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RmJpbEdmK3huRk11cG9aaVpTVittbCtqYllMa1lPQlZnS09LQjRGNjB0NFEw?=
 =?utf-8?B?U2lsRGl6TXFLMGt6bG5kdWl5WVMwVFM4SHlnbnFXZkNrK2YwZXVGNVNEdDlt?=
 =?utf-8?B?bHB0aktpV1NESHBGSnNubXJrNVlDd0EwMXRjZ2dPRjFMRUVKMURWMW1Ka1Rv?=
 =?utf-8?B?NHpnWWNQRHQyRU9UZnFQbDZGNXg0T0tVQzdBdHpuVDFUUEpYZGs0RmlKUnJj?=
 =?utf-8?B?NFZQcmtMcUwrdGpsNmpPZFJoTllpcnFQT0tPTFRibzFMR1c2WnRDNjJDamc5?=
 =?utf-8?B?ZCtrS3BQTklQNnFIMFpVeDRUajYxYU9LMUR2TkhlQXhTTHFnNDZBaDcyanFC?=
 =?utf-8?B?cGtKeFJmdHFmMkU4VmVpYlVYRmt4enpyc28yL0tYRXQ4TWNJQlhnNlFQVlhq?=
 =?utf-8?B?MW1GOTdZUC9mMVQzeW5tcW9velZ5dDc3dWJNNm1WcXMzc3BsT2ZLMEU3SWlL?=
 =?utf-8?B?TXc0dUw0V3JrZDNKNnJuSlhLbzFLa2Njc2k4L1hLR2RCV241Q3RpWkRiQUd1?=
 =?utf-8?B?bWptUVdYTFEzSmNzRlpDMUdzbWcvSWRrRk8rTVM0K1drYnA4KzUxVFFNV01o?=
 =?utf-8?B?eW5ZeEVQcy9kT2p3WWVwcThXTWhXNDVXeitMWHd5SmRoMFNpdHpGRnkzWEZP?=
 =?utf-8?B?bHpObnNzM2ttOG5ua28rdjFYZHlad2NEb1lZOTZtbURXMUdVUCtDOWc2OFF0?=
 =?utf-8?B?c1lKL0xOc1pGdERucXppcDZBQ2ZhY3BhS0hraE9TQTRjenRyTFVoNHFNeG1O?=
 =?utf-8?B?eFFIWHphVG1xV2luVVV2VW5wc3N6bEY5Vk9Jd3lkbG1vOGVHUXpLWFFRS3Nu?=
 =?utf-8?B?V0dKKzhSRXVERU56TXBLekl0TVB1b3VleDJMRisrOWIrTlhoa3M2SGZCUWYy?=
 =?utf-8?B?MXFtdjNFU3F5aWc1ZXVybCtEejVMdVAxL0Nya0t4ZUtxT29Bck96NmZSYnNu?=
 =?utf-8?B?ckg4b3VuM3FXWlJ2OVZUbXBpUDBlMXhmVjFvZjdaUWhsL1hrbHBaTjVGTkpi?=
 =?utf-8?B?MUxOR1p4RjFST1haaVgxV2tGTEszMXRTUWMwbVRjWEE1a29IRXVhTTZLaVpz?=
 =?utf-8?B?cm1Ba1NWaERYa2ZPQVo2T3NFVzJmV3hpU3BPWlFzbzhURTFIdVZyMWVTbUI1?=
 =?utf-8?B?dW1Ga05TSm1KaDdydUNWWWY5UTNtNkx0czJFMzdsc3dHVWxLSmNxNTg3US9q?=
 =?utf-8?B?RFJPZmtJdE1rVlh6NVQvRi85MWE5M1VXU25OS0MzSGdzdFJQYjFoSnBoVG9O?=
 =?utf-8?B?SDRRcFFmOThCTEN6S3VNWEZ0L2QxaVJ4SnNmbmhEQmpWUTAyc3dlVnQ0QTFw?=
 =?utf-8?B?UzBLdDRTV2JMc3lvODBFa3ZHb29jU2dEbExkRXJQY0QwaUNqZXRsRHpiZWxN?=
 =?utf-8?B?MlNqNmc1SWFFTjZvM1REeVNaZnlKblVldTVRUTFCZFUyZFJmWVk2WWJzb1dF?=
 =?utf-8?B?NmFPWldpM09kTmEzUFcvWkZxOSt4b1RhY01qdnp4Tlo2QWxMZlFRdHNjcFpT?=
 =?utf-8?B?Um1wZno2cHVoMzFEUjlvZU03aFdZQmFxL1F5enI5TXFsa3F5RjJhbGxqdjl3?=
 =?utf-8?B?WFlOSWxzUDB6VTg0YjhUM1p5SzVWeTFLa2xkWHpvdUZCM1R1dFBGaHdoNFdi?=
 =?utf-8?B?WnYxSEtxeHZ2d21hdS9vMVVGbE5HSzNPZkg4NklLQWthUEJGd1hzVkFOWjJk?=
 =?utf-8?B?aENwcTJ5OEpFZldMK1NyekVTQkxRSnZXMVBCQ2RHZWlZS3RBbFJrR200U3FZ?=
 =?utf-8?B?ZGh6N2JFbDVRTk52bU5Ma2toYkhoWGM1NVkzR0xWWVBqbDZhMXN6YUcvTFB1?=
 =?utf-8?B?bUZlWFlwaE0vWkNYdXY1R0ZIMkhxMHRrWlNQTG5ETVlmdFR2VlRGY2h1bHN5?=
 =?utf-8?B?N2IzUDVrQnREaW14V3VWY3JhTEhZTlo5NkdYZWRYRDNKVmVBNG9Za0RHbTlU?=
 =?utf-8?B?aU9CeGFFTzB4dWZsc0kzS01hUDNYZVVMbEtObG51VUlaeWtJc1VXUVp5bUtk?=
 =?utf-8?B?R3NQUm8vMGRNRFYvY0N1MHNweVNCSTB0YXZmbVUzTk5Mb2NCdUpwcTIzQ2l6?=
 =?utf-8?B?KzFhWUsxTWVML2huM1hVZlMrMjhEM3MwWVJaaDNhV3B2NjlwVWczdTd4QTN6?=
 =?utf-8?B?akFPZ24vOVRJYjdPUjFaUkRlTG1CeTVBQ216Tm5RMHVRdUh4Vkwza01WNmZh?=
 =?utf-8?B?VER2d2RTaStzNHVsWFBjSEdLaytidHNQaGp4RERicG5LWWRTVVgrQVplY3lz?=
 =?utf-8?B?b0x1aEZFVnBaV1pLb1ZrYklhQUkxdXRIRVNQeU9WRm5ERDVKeTJUNHJMRjlF?=
 =?utf-8?B?MlB0WnJ4THVONkdYL24xTU5rS0JGQk5yZWVncGdBaWluQit2U1l0Zz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4167e258-1c2f-405b-516b-08de5208f03f
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5249.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 18:32:28.0387 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 67puL1ldSHg2oI7gM2wfZIxzwDxsOgDFMrhynBy7in1OZsifnoCSY5kp7yVCQP9k8P8kwCg44yLuRVSvm5RBFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB8005
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


On 12-01-2026 23:38, Raag Jadav wrote:
> On Mon, Jan 12, 2026 at 05:47:24PM +0530, Karthik Poosa wrote:
>> Expose individual VRAM temperature attributes.
>> Update Xe hwmon documentation for this entry.
>>
>> v2:
>>   - Avoid using default switch case for VRAM individual temperatures.
>>   - Append labels with VRAM channel number.
>>   - Update kernel version in Xe hwmon documentation.
>>
>> v3:
>>   - Add missing brackets in Xe hwmon documentation from VRAM channel sysfs.
>>   - Reorder BMG_VRAM_TEMPERATURE_N macro in xe_pcode_regs.h.
>>   - Add api to check if VRAM is available on the channel.
>>
>> v4:
>>   - Improve VRAM label handling to eliminate temp variable by
>>     introducing a dedicated array vram_label in xe_hwmon_thermal_info.
>>   - Remove a magic number.
>>   - Change the label from vram_X to vram_ch_X.
>>
>> v5:
>>   - Address review comments from Raag.
>>   - Change vram to VRAM in commit title and subject.
>>   - Refactor BMG_VRAM_TEMPERATURE_N macro.
>>   - Refactor is_vram_ch_available().
>>   - Rephrase a comment.
>>   - Check individual VRAM temperature limits in addition to VRAM
>>     availability in xe_hwmon_temp_is_visible. (Raag)
>>   - Move VRAM label change out of this patch.
>>
>> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
>> ---
>>   .../ABI/testing/sysfs-driver-intel-xe-hwmon   | 22 +++++++
>>   drivers/gpu/drm/xe/regs/xe_pcode_regs.h       |  3 +
>>   drivers/gpu/drm/xe/xe_hwmon.c                 | 66 +++++++++++++++++++
>>   3 files changed, 91 insertions(+)
>>
>> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
>> index 6e21bebf0e0d..55ab45f669ac 100644
>> --- a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
>> +++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
>> @@ -211,6 +211,28 @@ KernelVersion:	7.0
>>   Contact:	intel-xe@lists.freedesktop.org
>>   Description:	RO. GPU PCIe temperature in millidegree Celsius.
>>   
>> +What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/temp[6-21]_crit
>> +Date:		January 2026
>> +KernelVersion:	7.0
>> +Contact:	intel-xe@lists.freedesktop.org
>> +Description:	RO. VRAM channel critical temperature in millidegree Celsius.
>> +
>> +		Only supported for particular Intel Xe graphics platforms.
>> +
>> +What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/temp[6-21]_emergency
>> +Date:		January 2026
>> +KernelVersion:	7.0
>> +Contact:	intel-xe@lists.freedesktop.org
>> +Description:	RO. VRAM channel shutdown temperature in millidegree Celsius.
>> +
>> +		Only supported for particular Intel Xe graphics platforms.
>> +
>> +What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/temp[6-21]_input
>> +Date:		January 2026
>> +KernelVersion:	7.0
>> +Contact:	intel-xe@lists.freedesktop.org
>> +Description:	RO. VRAM channel temperature in millidegree Celsius.
>> +
>>   		Only supported for particular Intel Xe graphics platforms.
>>   
>>   What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/fan1_input
>> diff --git a/drivers/gpu/drm/xe/regs/xe_pcode_regs.h b/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
>> index fb097607b86c..45f09f39df96 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
>> @@ -22,6 +22,9 @@
>>   #define BMG_FAN_2_SPEED				XE_REG(0x138170)
>>   #define BMG_FAN_3_SPEED				XE_REG(0x1381a0)
>>   #define BMG_VRAM_TEMPERATURE			XE_REG(0x1382c0)
>> +#define BMG_VRAM_TEMPERATURE_N(n)		XE_REG(0x138260 + ((n) * (sizeof(u32))))
> Ascending order please!
>
>> +#define   TEMP_MASK_VRAM_N			REG_GENMASK(30, 8)
>> +#define   TEMP_SIGN_MASK			BIT(31)
> Use REG_BIT() for consistency.
>
>>   #define BMG_PACKAGE_TEMPERATURE			XE_REG(0x138434)
>>   
>>   #endif /* _XE_PCODE_REGS_H_ */
>> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
>> index e8604e6300ac..b1737403a38b 100644
>> --- a/drivers/gpu/drm/xe/xe_hwmon.c
>> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
>> @@ -39,12 +39,16 @@ enum xe_hwmon_reg_operation {
>>   	REG_READ64,
>>   };
>>   
>> +#define MAX_VRAM_CHANNELS      (16)
>> +
>>   enum xe_hwmon_channel {
>>   	CHANNEL_CARD,
>>   	CHANNEL_PKG,
>>   	CHANNEL_VRAM,
>>   	CHANNEL_MCTRL,
>>   	CHANNEL_PCIE,
>> +	CHANNEL_VRAM_N,
>> +	CHANNEL_VRAM_N_MAX = CHANNEL_VRAM_N + MAX_VRAM_CHANNELS,
>>   	CHANNEL_MAX,
>>   };
>>   
>> @@ -105,6 +109,9 @@ enum sensor_attr_power {
>>   /* Index of memory controller in READ_THERMAL_DATA output */
>>   #define TEMP_INDEX_MCTRL	2
>>   
>> +/* Maximum characters in hwmon label name */
>> +#define MAX_LABEL_SIZE		16
>> +
>>   /**
>>    * struct xe_hwmon_energy_info - to accumulate energy
>>    */
>> @@ -139,6 +146,8 @@ struct xe_hwmon_thermal_info {
>>   	u8 count;
>>   	/** @value: signed value from each sensor */
>>   	s8 value[U8_MAX];
>> +	/** @vram_label: vram label names */
>> +	char vram_label[MAX_VRAM_CHANNELS][MAX_LABEL_SIZE];
>>   };
>>   
>>   /**
>> @@ -255,6 +264,8 @@ static struct xe_reg xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg
>>   				return BMG_PACKAGE_TEMPERATURE;
>>   			else if (channel == CHANNEL_VRAM)
>>   				return BMG_VRAM_TEMPERATURE;
>> +			else if (channel >= CHANNEL_VRAM_N && channel <= CHANNEL_VRAM_N_MAX)
> This looks like it can be in_range() but please double check.
Current check should be sufficient, in_range not required here.
>
>> +				return BMG_VRAM_TEMPERATURE_N(channel - CHANNEL_VRAM_N);
>>   		} else if (xe->info.platform == XE_DG2) {
>>   			if (channel == CHANNEL_PKG)
>>   				return PCU_CR_PACKAGE_TEMPERATURE;
>> @@ -714,6 +725,22 @@ static const struct hwmon_channel_info * const hwmon_info[] = {
>>   			   HWMON_T_MAX,
>>   			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
>>   			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
>> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
>>   			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL),
>>   	HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_LABEL | HWMON_P_CRIT |
>>   			   HWMON_P_CAP,
>> @@ -888,6 +915,21 @@ static void xe_hwmon_get_voltage(struct xe_hwmon *hwmon, int channel, long *valu
>>   	*value = DIV_ROUND_CLOSEST(REG_FIELD_GET(VOLTAGE_MASK, reg_val) * 2500, SF_VOLTAGE);
>>   }
>>   
>> +static inline bool is_vram_ch_available(struct xe_hwmon *hwmon, int channel)
>> +{
>> +	struct xe_mmio *mmio = xe_root_tile_mmio(hwmon->xe);
>> +	int vram_id = channel - CHANNEL_VRAM_N;
>> +	struct xe_reg vram_reg;
>> +
>> +	vram_reg = xe_hwmon_get_reg(hwmon, REG_TEMP, channel);
>> +	if (!xe_reg_is_valid(vram_reg) || !xe_mmio_read32(mmio, vram_reg))
>> +		return false;
>> +
>> +	/* Create label only for available vram channel */
>> +	sprintf(hwmon->temp.vram_label[vram_id], "vram_ch_%d", vram_id);
>> +	return true;
>> +}
>> +
>>   static umode_t
>>   xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
>>   {
>> @@ -901,6 +943,9 @@ xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
>>   		case CHANNEL_MCTRL:
>>   		case CHANNEL_PCIE:
>>   			return hwmon->temp.count ? 0444 : 0;
>> +		case CHANNEL_VRAM_N...CHANNEL_VRAM_N_MAX:
>> +			return (is_vram_ch_available(hwmon, channel) &&
>> +				hwmon->temp.limit[TEMP_LIMIT_MEM_SHUTDOWN]) ? 0444 : 0;
>>   		default:
>>   			return 0;
>>   		}
>> @@ -913,6 +958,9 @@ xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
>>   		case CHANNEL_MCTRL:
>>   		case CHANNEL_PCIE:
>>   			return hwmon->temp.count ? 0444 : 0;
>> +		case CHANNEL_VRAM_N...CHANNEL_VRAM_N_MAX:
>> +			return (is_vram_ch_available(hwmon, channel) &&
>> +				hwmon->temp.limit[TEMP_LIMIT_MEM_CRIT]) ? 0444 : 0;
>>   		default:
>>   			return 0;
>>   		}
>> @@ -933,6 +981,8 @@ xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
>>   		case CHANNEL_MCTRL:
>>   		case CHANNEL_PCIE:
>>   			return hwmon->temp.count ? 0444 : 0;
>> +		case CHANNEL_VRAM_N...CHANNEL_VRAM_N_MAX:
>> +			return is_vram_ch_available(hwmon, channel) ? 0444 : 0;
>>   		default:
>>   			return 0;
>>   		}
>> @@ -961,6 +1011,16 @@ xe_hwmon_temp_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
>>   			return get_mc_temp(hwmon, val);
>>   		case CHANNEL_PCIE:
>>   			return get_pcie_temp(hwmon, val);
>> +		case CHANNEL_VRAM_N...CHANNEL_VRAM_N_MAX:
>> +			reg_val = xe_mmio_read32(mmio, xe_hwmon_get_reg(hwmon, REG_TEMP, channel));
>> +			/*
>> +			 * This temperature format is 24 bit [31:8] signed integer and 8 bits
> Nit: Either use bits with 's' or don't, but let's be consistent.
>
>> +			 * [7:0] fraction.
>> +			 */
>> +			*val = (s32)(REG_FIELD_GET(TEMP_MASK_VRAM_N, reg_val)) *
>> +				(REG_FIELD_GET(TEMP_SIGN_MASK, reg_val) ? -1 : 1) *
>> +				 MILLIDEGREE_PER_DEGREE;
>> +			return 0;
>>   		default:
>>   			return -EOPNOTSUPP;
>>   		}
>> @@ -972,6 +1032,7 @@ xe_hwmon_temp_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
>>   			*val = hwmon->temp.limit[TEMP_LIMIT_PKG_SHUTDOWN] * MILLIDEGREE_PER_DEGREE;
>>   			return 0;
>>   		case CHANNEL_VRAM:
>> +		case CHANNEL_VRAM_N...CHANNEL_VRAM_N_MAX:
>>   			*val = hwmon->temp.limit[TEMP_LIMIT_MEM_SHUTDOWN] * MILLIDEGREE_PER_DEGREE;
>>   			return 0;
>>   		default:
>> @@ -985,6 +1046,7 @@ xe_hwmon_temp_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
>>   			*val = hwmon->temp.limit[TEMP_LIMIT_PKG_CRIT] * MILLIDEGREE_PER_DEGREE;
>>   			return 0;
>>   		case CHANNEL_VRAM:
>> +		case CHANNEL_VRAM_N...CHANNEL_VRAM_N_MAX:
>>   			*val = hwmon->temp.limit[TEMP_LIMIT_MEM_CRIT] * MILLIDEGREE_PER_DEGREE;
>>   			return 0;
>>   		default:
>> @@ -1353,6 +1415,8 @@ static int xe_hwmon_read_label(struct device *dev,
>>   			       enum hwmon_sensor_types type,
>>   			       u32 attr, int channel, const char **str)
>>   {
>> +	struct xe_hwmon *hwmon = dev_get_drvdata(dev);
>> +
>>   	switch (type) {
>>   	case hwmon_temp:
>>   		if (channel == CHANNEL_PKG)
>> @@ -1363,6 +1427,8 @@ static int xe_hwmon_read_label(struct device *dev,
>>   			*str = "mctrl";
>>   		else if (channel == CHANNEL_PCIE)
>>   			*str = "pcie";
>> +		else if (channel >= CHANNEL_VRAM_N && channel <= CHANNEL_VRAM_N_MAX)
> Ditto for in_range().
same as above
>
> Reviewed-by: Raag Jadav <raag.jadav@intel.com>
>
>> +			*str = hwmon->temp.vram_label[channel - CHANNEL_VRAM_N];
>>   		return 0;
>>   	case hwmon_power:
>>   	case hwmon_energy:
>> -- 
>> 2.25.1
>>
