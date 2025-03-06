Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46F9FC282D1
	for <intel-xe@archiver.kernel.org>; Thu,  6 Mar 2025 14:52:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FD7010E9C8;
	Thu,  6 Mar 2025 14:52:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RLv8HGYo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 596C610E9C8
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Mar 2025 14:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741272733; x=1772808733;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=D/gGBq0RTlfc+399tG/Lb7gXHOB/9rJgT6vQlrsB93k=;
 b=RLv8HGYoBk0YCXjnW+MOYuWNolt1hY7UxV+EPdhEod3O0P3Zt1n+4fiG
 7sKKiMFMM5HU0KTZcHvQTm5u5at7DKz00Nf+/AJkcqiUOgwkGWN24Gu0S
 HbVblP7ZaZaNu171LfezDHupWbszcxlTdma2E47xrq0x4RFlvvkb/cGrS
 m032RulAbfYF79XcacjcUQV8v07nTtyEO3HtqpbQfBvx9JubsFd/vxNo2
 j3T2DaCC+3hMQfG3cmNCVYZnsRxMXHHngAfVs2lcNcroAxY/wW9mSqLCF
 eHjXjt2ZWaNyJ/LDRTJKZrQN/GsMa2oj8SXkewCfaBcJCFkrDKDijwvd2 A==;
X-CSE-ConnectionGUID: S6Ob3CyDRry27SZzNLkbrQ==
X-CSE-MsgGUID: StkCX3NiTD+BXYLm2Hpijw==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="53270452"
X-IronPort-AV: E=Sophos;i="6.14,226,1736841600"; d="scan'208";a="53270452"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 06:52:13 -0800
X-CSE-ConnectionGUID: EIgN8/ztQnmUw0GC+eM0hA==
X-CSE-MsgGUID: K3fH7BnATI2IcNqfSB3sKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,226,1736841600"; d="scan'208";a="119715344"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Mar 2025 06:52:12 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 6 Mar 2025 06:52:11 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 6 Mar 2025 06:52:11 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 6 Mar 2025 06:52:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z1vt5mhOr7k6yhLu8FqwIbCOjTe4O3zlrBLXfqXNgEiGeHnMb+sEDc1tWfWUyiLHoMpdkugxb01iZUshp3zb5yz8/mbgzFMWs1XJ4kwq58NFEXrztwd3r32xBEEDblVATO4dCEXq0NdtCg/DvzW2w+dR0hXQ/GdnsAJVTub+VObVc8bFXxs+R7q/Wkzuhe0G98fjG6Dbo3EziEOIBWjlU7THsK61LKUa+eYbwiJvHRjGYm5kciXx/DqcXh8+Sjtzqb+Xz8HZsoiuxo2d/1jWmlomnAFsyRBvF05Lk+Kvvy8qxGxRiV6Ab2Ih11nlPuHox8ko55zTmDwQ9mlxmIElmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h6eBEY7Ckq1nPPWJExiUQ8CEzwO98gclXboxH/MafTY=;
 b=DBYGFgaKXZsVdrsW8JhOuAHjpxlwx/IeUoUGbIdbDL0sY48KCDPsdexxEP2jFb7qyl2SLKSDWFpMtzp9qZo/eSzPXuz1pL6m8+aFmGRrQSNyPb0czI6jbPvVgyOQbztySAneb97G9qLnvAZx8ePzgWDGZ+Kf8x7MU9Vdr91ZaDZqi7936G6gBcmdhbMkBe2RDzBUW00EhHVCqAXtZiWdgxaf20YV60z7oODqD+PoSlYCpIptXp2mb/oPMLU/g0r+46yOh1zJ9JTdp8bb8dQOQLGb6NFO44Q31Kbv7h5lPy7DyKT1AQ3ptBl4yTY5uN6rbKsdwM9qjTqNjPmBq4VX1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5703.namprd11.prod.outlook.com (2603:10b6:8:22::5) by
 CH3PR11MB8466.namprd11.prod.outlook.com (2603:10b6:610:1ae::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8511.19; Thu, 6 Mar 2025 14:51:53 +0000
Received: from DM8PR11MB5703.namprd11.prod.outlook.com
 ([fe80::f734:e507:3083:e454]) by DM8PR11MB5703.namprd11.prod.outlook.com
 ([fe80::f734:e507:3083:e454%6]) with mapi id 15.20.8511.017; Thu, 6 Mar 2025
 14:51:53 +0000
Message-ID: <85fe6b58-dfec-4e95-bfb3-6bcc4084467d@intel.com>
Date: Thu, 6 Mar 2025 20:21:45 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] drm/xe/hwmon: expose fan speed
Content-Language: en-GB
To: Raag Jadav <raag.jadav@intel.com>
CC: <lucas.demarchi@intel.com>, <rodrigo.vivi@intel.com>,
 <matthew.d.roper@intel.com>, <andi.shyti@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <riana.tauro@intel.com>, <badal.nilawar@intel.com>
References: <20250210100515.2205584-1-raag.jadav@intel.com>
 <bbda9792-7126-4961-8767-b435780f0cff@intel.com>
 <Z7wjzKB1yF9AV5PA@black.fi.intel.com>
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <Z7wjzKB1yF9AV5PA@black.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0073.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::12) To DM8PR11MB5703.namprd11.prod.outlook.com
 (2603:10b6:8:22::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5703:EE_|CH3PR11MB8466:EE_
X-MS-Office365-Filtering-Correlation-Id: 89e61611-e7be-4b2c-cc90-08dd5cbe6ebe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZEFHelNFUG52RFprZllySEFEbUxTYk8ycE5PaE5KYlFwT1l6S1NpcFFob0Rz?=
 =?utf-8?B?WXJ1cU9aWTI1b1Z6UUQ4ZFEwUDk0MzlaNC9abFoyTGlITFZEZUwvZjAxc0FZ?=
 =?utf-8?B?aXdySm1nZmw4RDlqYUovMEp4OWZ6K0FiNDhLYm9ZZmNrNFlIdWtpS3JPUldG?=
 =?utf-8?B?b0VIK2dPNnZBcnplNG5nWktWeXE3N25uc1dzblM3aTdQMVJ4dmhFREhkUmtN?=
 =?utf-8?B?djJ6MWhWY2JIald1dmR2WGJ3SWdUMTJoMysvbHNvWFpRSUlqQnhDS1N4U2l0?=
 =?utf-8?B?TjFudVUxTW8vb0I5c09UM0QwcW1CaUpoOEVpVlBDRlFuWXN4Rjk5bXhkR1Nn?=
 =?utf-8?B?VXJyc2Rza3pDSmhIbGYvT2tpRHI2L2VERHlaZ0pPV00zYllRaFE4WjdCVjd0?=
 =?utf-8?B?b3R0RC91cTNvT1BJY3VhK2UwajNhenhRSVdzMUxCc1htZDV2ZXNUTXlzeEp4?=
 =?utf-8?B?bzBOZDNWVjNhTFZxNVlRUCtqMExJVU0wZFQ2Zy8vdkd4MndmUGFYRnBRUk5v?=
 =?utf-8?B?UTdzVUEzTlpYdndlQUlsS3lkQ3FSWXVzZ00wWEVVaG11cVdxRXU4eVdSWnRj?=
 =?utf-8?B?ZUlCWW9QdmFEU0hPeGpUblJZNEtSS0xObXh0QXc4S0F1azBZYlF0UTdUOUNp?=
 =?utf-8?B?STYySnlUL0o5VUNjUmtYWXUwZ0ZwY1ZDZ1orcmNVQmxVRlNCcEI4QXc4UFZ0?=
 =?utf-8?B?YmVRSlNIYnArN3hTdStWQlhqQ1JjVVhnVXZ6Tlkyb0NkR0pidzZLMENtd2M5?=
 =?utf-8?B?dzhQd1RwTlJDdDMwN3F3Q1NZNHdjZzY1RWxNd2FJL3RCSlVFdVhzS1FLWXRH?=
 =?utf-8?B?czV2NURLTnNtdGJEYjhzemZZRGFOdmRZcks2KzF5ZzlaYkl1SHBtV2VNcWp3?=
 =?utf-8?B?RWtqRHBrZU5pdnFRd2xTYTluNGt5R1FDOXBpZUZVRmtaSEt4a3RrREZTLyt5?=
 =?utf-8?B?c0tpakRLWGltbmJMYmhnSVBBenNLdUdlSDRPQTJUTmJwUDl1ZWpDTHdobzJ2?=
 =?utf-8?B?R2JTV2trU2tzNzZXbXgySFBwWXhmbXNXR2xzZXJaYjRnZ2Q3R21XZzJqQ3Bm?=
 =?utf-8?B?K1h2Y2Z2NngvUWVZUHFiaFJoS3JueXUzN1pjNWs5YzVjQklOUmVwSitpamo4?=
 =?utf-8?B?K3lablpGcG9vcDF1SGVKOUhpbnY3VVNRSXFlR0lhSWtnVnBoTDhEUFJkSVly?=
 =?utf-8?B?Z1dZOGRNUjBrdUgwY1Y4cS9WbnJwYitHdS9ON1gyeTQ2UjVVYnpvbmVLdi9x?=
 =?utf-8?B?VzF3Sm94YzZMY3JKV2c4YUJDbWI0R0wrRFVDOHZMcTJ0bzJ3dHVOK0QxTEdo?=
 =?utf-8?B?MTR0VmhlQVNyVlVyeXE3MHh4ZVNMZnlsb2ttRndScFpqM3VZVzRtT1VtOXBH?=
 =?utf-8?B?cGV2cXgyUFhLUkhYQ3luaEVXYTUyWmxkU3VhZ1pETGJZbTFGTm1WVHkxY2xl?=
 =?utf-8?B?aXZVbU9QdUdOQmlQZFdLSzNVdWJ5VWFBR25CL3pQY0FDOEs0SGZqU1dTaW0z?=
 =?utf-8?B?cU9VcDJXYlhpdHE4YkZoMFBJbWhuQ0pqWWt3bzVrbXBoc29Oa1Njc01TV1lj?=
 =?utf-8?B?SnJOa0RsbldScnlmQlVHVTJZMG5LVVpzTnM2UmJLMTZJOEk0Z1VhVjk3amZq?=
 =?utf-8?B?bTRvb2t6V1YxbkJYTm9JZ3M1VGYyZnVkTTh2WEE0ZjNuRWl5TnR1anFWc09w?=
 =?utf-8?B?ZDhDU1lZYjViS2pKMzZaMnliUWNKWjNvNjNIOFNYcjhSSXhmRHpFSHJ2NGJB?=
 =?utf-8?B?MCsrVlBmN2tvUnpQNmw3UkUvWjVKM203LzJHOWtMaWhnRVNsUmE3WjcrK0JX?=
 =?utf-8?B?STdvVklQQWI0S1V4cFEvWEZXQVdCbVF3UTZ6MFR1Qm1BM3NpcWZhMjhETkxO?=
 =?utf-8?Q?ss/ZrfTwvkfir?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5703.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SUVyOGtIZFg3eGpTb2xlblNnRVlPMU80WVpDQ0tmZU9Vakc3RUFDNE8zK3k3?=
 =?utf-8?B?V3lxSGpxdTlWZmJ4NUJYcThCTWtqZlJJWUJkN3dHR1lqeVNsLy9TdjYrN3Uz?=
 =?utf-8?B?WEpwUVRQRXpQZkpLRDByU3M0NmxhMXc4OEhydCtrU0RMS1pxaUV0eHpGbFpF?=
 =?utf-8?B?aHdaSVdMUnEzUjZVa2Z2cVRKdkdMMG0yN0FmNmpxUGVOOTFRVUdJYjBvMTRC?=
 =?utf-8?B?eVhnVHVDQlgveDBzeS9xcmlKaVBqbWtUQy91dHl1RzVZWW1wUUx2OTBidG1H?=
 =?utf-8?B?U2VxZmpBeXBncjZrRjk4U1c5ZVFzY2E5QzdPV1NEckRVK1hqMVEzY0pJWXRK?=
 =?utf-8?B?VUg3QWRVUWYzWVl6dGgxNGxFUy9zdk5DSlgrZWNVTy9HUnFsdFAzclgyd3Jw?=
 =?utf-8?B?TGRZemM2QnNkYTFwM0Jvakxtc3VvZE1rRmFtemdyMTFVck9qcGNoeUhZRkp5?=
 =?utf-8?B?T0Q1VDEyWHlabVNGMGNwWHJyUVdkL040OWY1bFJqY1M3bUI2ZnN6bUtoTU9H?=
 =?utf-8?B?aW5ETUlpczBrOGN6U3VRelNMYVI1QTY3UHZoeFVtbitHTndhd0RtbnZ6ODkw?=
 =?utf-8?B?UjNpTjN2RDhJcUJUT08yTTdVbTdnVnZKVCtkSE1KWVkvbG52Rk9veU5mRmQ2?=
 =?utf-8?B?WnAxQXJISmFCQkpBdVRWdzB1cTBvK2dEWTlpdms1VmRrM3JWbEN0ZEwzNEc1?=
 =?utf-8?B?ZHFBWWtwQm9DdElhbTluU3ZxY2JoV0ZkTFAyUTNyc2JzOXBacmpmL3h3ZHhE?=
 =?utf-8?B?Unh3VFRnOHhFck9YQ3ZZYlpFUUtjU3paS2xuU0R6NFY5M21tTXBLMk55TUlV?=
 =?utf-8?B?VjhWNjRJMldNM2NlNXR5UXptdkUvS3FFclgvdzBFWkt4Sk1oSGR1QllVT1Bq?=
 =?utf-8?B?djNBeHF5OWpPMm5rZFlna2ZpMnFYMnI4bSt4c0lCY0E4dzBlcmZTY2Q3cHB4?=
 =?utf-8?B?OHBYeGlvRGYzeCsra2M0MDZsNHo2NnVtYmE4RUtZbU1mL3BhbGkxTE13Znho?=
 =?utf-8?B?QkpWOCtjTjdjM3l3a2NsSy9rbVV2YUFwUHVBMkxrNVJ1d29YbTNxd045UDYx?=
 =?utf-8?B?SzRFdm5FNW5Obi92ZVA3SGV5Sy9XdzM3RytYcm5OUUxIMW5lM3Q2c0hrMHUx?=
 =?utf-8?B?U1RSRHJ6ODloWWdqMVIrcXcxQldkcEJrNDZBTDNGL2t2Q0ErNjNKMEhIckNZ?=
 =?utf-8?B?QjgvRjRKamVYdHVTZHUrSjZ3QnVOU01FUmtyZGhlNmxEaG5HZi9tTmJ2YnNt?=
 =?utf-8?B?dUhNVUtKK0JxVXJlTXBrWi9jTUg0M1FEWmw3UEtZc0trK0RHRlRvNVlTOXpK?=
 =?utf-8?B?UkgwQU84c2xXK090VDZGU1ROMnkxODRHTFhzMFBhemoxdFB4WEhqK0dRdHFn?=
 =?utf-8?B?RFRNMzhMVzVsdEVOc1lGVzdVRC9NTVdhb1FTREtQcEl3SEVpK0tjUExZMEpI?=
 =?utf-8?B?MGxkNU9GWjM0cFNCaUNHYkkyblRSRFFLQk5hOWswUkRDSTFOMC9ONFhFUWhW?=
 =?utf-8?B?WWIvaHlVOUVqRWxZL3BFU1hRc0EzM29vN2xFbkNvbGFVWGlkRHVjRjdUTWYr?=
 =?utf-8?B?NFlOZUdNcG02citHVDRnaHJtcXVPSDJuSE9JV0FWajBHNlVndTRjL1NTdUo3?=
 =?utf-8?B?TmRwNzNNOGRkVmFSNEUya2tnMkdkYUZTOWx2dm1VbTJoRkFtT1JycFpzeHRY?=
 =?utf-8?B?d2ZmNW5BTm1rbFNPcGJiVTNNYkhKU3dkUTJUN1o2LzNnc0JaMThub2ZwYitU?=
 =?utf-8?B?cHRzczNubDROaE5vYlN0RW5kVGJwY2NrTEtQS2d4MnR4M0s0eVp2M0JaS1FU?=
 =?utf-8?B?a1hwanVjZXhSMFZHS2d4YThPSjNHVHhjNzV2UGhCbzkzRDFhYm1SNkY4Zlhk?=
 =?utf-8?B?N3RueldKMS9ZVG9XNlBWTXFyM2VrdTBIbUY5UnFpbThPcWNJVFdCSXBFMUZp?=
 =?utf-8?B?TlhSZHh0Uk4xTUwweXU2SHE4ZStJM1M3ZlU5ZmdLUFFIUzRGd0V3N2J0dHhh?=
 =?utf-8?B?RU15YjlQTWVmRjU0d1J3anFoUWtMWlZEUFUyb1hVVExjTWUxNm80MG9pWWhK?=
 =?utf-8?B?Y3hpT3R4cTJxQW9yVmhJWGxRTXdodVRpdVUvZ1FRUkMzT1g5QTRqT0ZwTHZ5?=
 =?utf-8?B?ZnpMcEhJNlBaUnlBczJGcXdidVZybXByM3lJcWlFV0VyNTBEU3dRUmp0L2J6?=
 =?utf-8?B?YUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 89e61611-e7be-4b2c-cc90-08dd5cbe6ebe
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5703.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 14:51:53.1611 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 04FWWYbR8nfOdGDRCJix+6lOvnKoUf/fvMh2ycks1pLztl1GP3znT7dT4s4UHH2zFp4ndt534VsYYfQ5MZZzvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8466
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


On 24-02-2025 13:16, Raag Jadav wrote:
> On Fri, Feb 21, 2025 at 08:32:01PM +0530, Poosa, Karthik wrote:
>> On 10-02-2025 15:35, Raag Jadav wrote:
>>> Add hwmon support for fan1_input, fan2_input and fan3_input attributes,
>>> which will expose fan speed of respective channels in RPM when supported
>>> by hardware. With this in place we can monitor fan speed using lm-sensors
>>> tool.
>>>
>>> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
>>> ---
>>>    .../ABI/testing/sysfs-driver-intel-xe-hwmon   |  24 ++++
>>>    drivers/gpu/drm/xe/regs/xe_pcode_regs.h       |   3 +
>>>    drivers/gpu/drm/xe/xe_hwmon.c                 | 124 +++++++++++++++++-
>>>    drivers/gpu/drm/xe/xe_pcode_api.h             |   3 +
>>>    4 files changed, 153 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
>>> index 9bce281314df..adbb9bce15a5 100644
>>> --- a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
>>> +++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
>>> @@ -124,3 +124,27 @@ Contact:	intel-xe@lists.freedesktop.org
>>>    Description:	RO. VRAM temperature in millidegree Celsius.
>>>    		Only supported for particular Intel Xe graphics platforms.
>>> +
>>> +What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/fan1_input
>>> +Date:		March 2025
>>> +KernelVersion:	6.14
>>> +Contact:	intel-xe@lists.freedesktop.org
>>> +Description:	RO. Fan 1 speed in RPM.
>>> +
>>> +		Only supported for particular Intel Xe graphics platforms.
>>> +
>>> +What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/fan2_input
>>> +Date:		March 2025
>>> +KernelVersion:	6.14
>>> +Contact:	intel-xe@lists.freedesktop.org
>>> +Description:	RO. Fan 2 speed in RPM.
>>> +
>>> +		Only supported for particular Intel Xe graphics platforms.
>>> +
>>> +What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/fan3_input
>>> +Date:		March 2025
>>> +KernelVersion:	6.14
>>> +Contact:	intel-xe@lists.freedesktop.org
>>> +Description:	RO. Fan 3 speed in RPM.
>>> +
>>> +		Only supported for particular Intel Xe graphics platforms.
>>> diff --git a/drivers/gpu/drm/xe/regs/xe_pcode_regs.h b/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
>>> index 8846eb9ce2a4..c7d5d782e3f9 100644
>>> --- a/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
>>> +++ b/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
>>> @@ -21,6 +21,9 @@
>>>    #define BMG_PACKAGE_POWER_SKU			XE_REG(0x138098)
>>>    #define BMG_PACKAGE_POWER_SKU_UNIT		XE_REG(0x1380dc)
>>>    #define BMG_PACKAGE_ENERGY_STATUS		XE_REG(0x138120)
>>> +#define BMG_FAN_1_SPEED				XE_REG(0x138140)
>>> +#define BMG_FAN_2_SPEED				XE_REG(0x138170)
>>> +#define BMG_FAN_3_SPEED				XE_REG(0x1381a0)
>> Can you rename macros without having platform names, as this register is
>> available for both DG2 and BMG, like FAN_1_SPEED.
> Are you sure if we want to break the convention here?

I think we should, as the offset is not for a single platform.
You can also check if future platforms would continue to use the same 
offset.

>
>>>    #define BMG_VRAM_TEMPERATURE			XE_REG(0x1382c0)
>>>    #define BMG_PACKAGE_TEMPERATURE			XE_REG(0x138434)
>>>    #define BMG_PACKAGE_RAPL_LIMIT			XE_REG(0x138440)
>>> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
>>> index 7f327e334212..f1f95655d9fb 100644
>>> --- a/drivers/gpu/drm/xe/xe_hwmon.c
>>> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
>>> @@ -5,6 +5,7 @@
>>>    #include <linux/hwmon-sysfs.h>
>>>    #include <linux/hwmon.h>
>>> +#include <linux/jiffies.h>
>>>    #include <linux/types.h>
>>>    #include <linux/units.h>
>>> @@ -27,6 +28,7 @@ enum xe_hwmon_reg {
>>>    	REG_PKG_POWER_SKU_UNIT,
>>>    	REG_GT_PERF_STATUS,
>>>    	REG_PKG_ENERGY_STATUS,
>>> +	REG_FAN_SPEED,
>>>    };
>>>    enum xe_hwmon_reg_operation {
>>> @@ -42,6 +44,13 @@ enum xe_hwmon_channel {
>>>    	CHANNEL_MAX,
>>>    };
>>> +enum xe_fan_channel {
>>> +	FAN_1,
>>> +	FAN_2,
>>> +	FAN_3,
>>> +	FAN_MAX,
>>> +};
>>> +
>>>    /*
>>>     * SF_* - scale factors for particular quantities according to hwmon spec.
>>>     */
>>> @@ -61,6 +70,16 @@ struct xe_hwmon_energy_info {
>>>    	long accum_energy;
>>>    };
>>> +/**
>>> + * struct xe_hwmon_fan_info - to cache previous fan reading
>>> + */
>>> +struct xe_hwmon_fan_info {
>>> +	/** @reg_val_prev: previous fan reg val */
>>> +	u32 reg_val_prev;
>>> +	/** @time_prev: previous timestamp */
>>> +	u64 time_prev;
>>> +};
>>> +
>>>    /**
>>>     * struct xe_hwmon - xe hwmon data structure
>>>     */
>>> @@ -79,6 +98,8 @@ struct xe_hwmon {
>>>    	int scl_shift_time;
>>>    	/** @ei: Energy info for energyN_input */
>>>    	struct xe_hwmon_energy_info ei[CHANNEL_MAX];
>>> +	/** @fi: Fan info for fanN_input */
>>> +	struct xe_hwmon_fan_info fi[FAN_MAX];
>>>    };
>>>    static struct xe_reg xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg hwmon_reg,
>>> @@ -144,6 +165,16 @@ static struct xe_reg xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg
>>>    			return PCU_CR_PACKAGE_ENERGY_STATUS;
>>>    		}
>>>    		break;
>>> +	case REG_FAN_SPEED:
>>> +		if (xe->info.platform == XE_BATTLEMAGE || xe->info.platform == XE_DG2) {
>>> +			if (channel == FAN_1)
>>> +				return BMG_FAN_1_SPEED;
>>> +			else if (channel == FAN_2)
>>> +				return BMG_FAN_2_SPEED;
>>> +			else if (channel == FAN_3)
>>> +				return BMG_FAN_3_SPEED;
>>> +		}
>>> +		break;
>>>    	default:
>>>    		drm_warn(&xe->drm, "Unknown xe hwmon reg id: %d\n", hwmon_reg);
>>>    		break;
>>> @@ -454,6 +485,7 @@ static const struct hwmon_channel_info * const hwmon_info[] = {
>>>    	HWMON_CHANNEL_INFO(curr, HWMON_C_LABEL, HWMON_C_CRIT | HWMON_C_LABEL),
>>>    	HWMON_CHANNEL_INFO(in, HWMON_I_INPUT | HWMON_I_LABEL, HWMON_I_INPUT | HWMON_I_LABEL),
>>>    	HWMON_CHANNEL_INFO(energy, HWMON_E_INPUT | HWMON_E_LABEL, HWMON_E_INPUT | HWMON_E_LABEL),
>>> +	HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT, HWMON_F_INPUT, HWMON_F_INPUT),
>>>    	NULL
>>>    };
>>> @@ -480,6 +512,14 @@ static int xe_hwmon_pcode_write_i1(const struct xe_hwmon *hwmon, u32 uval)
>>>    			      (uval & POWER_SETUP_I1_DATA_MASK));
>>>    }
>>> +static int xe_hwmon_pcode_read_num_fans(const struct xe_hwmon *hwmon, u32 *uval)
>>> +{
>>> +	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
>>> +
>>> +	return xe_pcode_read(root_tile, PCODE_MBOX(FAN_SPEED_CONTROL,
>>> +			     FSC_READ_NUM_FANS, 0), uval, NULL);
>>> +}
>>> +
>>>    static int xe_hwmon_power_curr_crit_read(struct xe_hwmon *hwmon, int channel,
>>>    					 long *value, u32 scale_factor)
>>>    {
>>> @@ -705,6 +745,77 @@ xe_hwmon_energy_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
>>>    	}
>>>    }
>>> +static umode_t
>>> +xe_hwmon_fan_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
>>> +{
>>> +	struct xe_device *xe = hwmon->xe;
>>> +	u32 uval;
>>> +
>>> +	switch (attr) {
>>> +	case hwmon_fan_input:
>>> +		if (xe_hwmon_pcode_read_num_fans(hwmon, &uval))
>>> +			return 0;
>>> +
>>> +		/* Platforms that don't return correct value */
>> This can be rephrased to - "Platforms that don't support fan pcode mailbox
>> cmds"
> We wouldn't be at this point if it was not supported.

Does DG2 return incorrect value ?

AFAIK, FSC_READ_NUM_FANS is not supported on DG2.

>
>>> +		if (xe->info.platform == XE_DG2)
>>> +			uval = 2;
>>> +
>>> +		return channel < uval ? 0444 : 0;
>>> +	default:
>>> +		return 0;
>>> +	}
>>> +}
> Raag
