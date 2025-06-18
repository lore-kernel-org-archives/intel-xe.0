Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5848EC71157
	for <intel-xe@archiver.kernel.org>; Wed, 18 Jun 2025 09:49:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD53C10E7E4;
	Wed, 18 Jun 2025 09:49:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KYh9y3Oo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 391B510E7CF
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Jun 2025 09:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750240165; x=1781776165;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=xOURxMdY0QWH41TRS4dLcemaFrcWOrvuifpkCQfpR7g=;
 b=KYh9y3OotH8dqjAds5mfRgAFn1rtZgUzd3caupeEbTNGGXChQjPhqP1k
 0fR9tSw7XlGpVkuKRX5Yz1n2ZRU3r+tnIuvOAw5nHKSME2MSiePKam04h
 WSpQdrLrhUTQMrCFD+ZtbV64Se1eilB+c+SOrggKAy4QLjBb2R9Iev/CH
 oqyIEp+u5FKcmiHmler1DfXqeyzT6w2Dz6vkTLb8IIF6dz93ENBNCVLBd
 LvGiO6+L3QsJ8yPGRrRGAMz3E/1lrK6Nva2KKjG4p3apeyp7IIrnAMiYu
 C+QlFxh1mWiu3SW+kA2kWr6SJ8OJ4fzJCQUOoM5NL4KsGV79QxmSSF0aQ Q==;
X-CSE-ConnectionGUID: +ckQzQvmSYaLlPra7I4coA==
X-CSE-MsgGUID: bYJv5S8aRw2o9XNx20UT9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="51559025"
X-IronPort-AV: E=Sophos;i="6.16,245,1744095600"; d="scan'208";a="51559025"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2025 02:49:25 -0700
X-CSE-ConnectionGUID: nQ38K7XxQ/undgZ/o2KYnQ==
X-CSE-MsgGUID: RADPtOaXSymL8ygkiAeh+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,245,1744095600"; d="scan'208";a="149239730"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2025 02:49:25 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 18 Jun 2025 02:49:24 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 18 Jun 2025 02:49:24 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.51) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 18 Jun 2025 02:49:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bIhWh7H5ySe+nZfJHOA59o/WqBL5yqachlhuqt9oS8oKlUPWSVz50B1igqZF0jwOOOelKVnSH2+IORJy3gTswB3yPyuSEETNdzDvT+DaF0eo9QsmuMQJkbCDML/wNHrO16+q1y8UpF0ApSfzb7gAeb6s2A9HEAr//UbRgnGy0K1AgAIeRAXXqWkOcPA2t3dBz5HGPYdfO5ldhzYGrM/+e1T4fhbMSy1IPYB2FRzHEsxXjZrCV3LUakoNu/TTDa0QuKbdTNzOPO029aI8M4rMfFN+emCQev1Q1z2tdkC5kMHTrI3kllxxM4EQ3RpTiCUpOcpp0tmHsmVekpjDrp739A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8cyhXdSa7bAGw4aYajwAn2vIkLDzVDMATgaafwqAMjs=;
 b=lMVfzWOUi8iK5S1gS9RXUOzKhtF4kpY99MvlLmFhqnoZBebsJ+ajdwppSgnycDrImAuG1AVLetr1+czAk8mcrfnOU+CZq4cQ3lvgpGEu+hz3CdhqaUMYopDrKMe85zeNZBKugin9ShjvdOXJ+9JFNn9f2CUacc1VR1bw5bzxg7+8KZYBPQ1e9fv3WFDgV0SAt7tbMIqt2lYwt8+/yEyme0qzuIck/uq5bu5Gsux8RD2Y72poNEm9WPapJkMk8bsSHFKUIJlFg1muwV8W3wmGn2wooVsqrIJmUqJrQG6t6/BCml1ycItvX47UwhNkr/8GW5a76QOJLaQi1uMJKHgi1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5703.namprd11.prod.outlook.com (2603:10b6:8:22::5) by
 CH3PR11MB8209.namprd11.prod.outlook.com (2603:10b6:610:15d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.25; Wed, 18 Jun
 2025 09:49:22 +0000
Received: from DM8PR11MB5703.namprd11.prod.outlook.com
 ([fe80::f734:e507:3083:e454]) by DM8PR11MB5703.namprd11.prod.outlook.com
 ([fe80::f734:e507:3083:e454%5]) with mapi id 15.20.8857.016; Wed, 18 Jun 2025
 09:49:22 +0000
Message-ID: <b5452359-3a29-4975-b5b9-4b30c07d326f@intel.com>
Date: Wed, 18 Jun 2025 15:19:15 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm/xe/hwmon: Fix xe_hwmon_power_max_write
To: Riana Tauro <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>
References: <20250616071133.458363-1-karthik.poosa@intel.com>
 <2298dfdc-f17d-43e5-9fe0-bffda4f50690@intel.com>
 <787db959-383c-4e9d-abbb-58d56a7d57d3@intel.com>
 <386f4aea-e7a1-4d4d-bbac-461fb7546626@intel.com>
Content-Language: en-GB
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <386f4aea-e7a1-4d4d-bbac-461fb7546626@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0108.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::13) To DM8PR11MB5703.namprd11.prod.outlook.com
 (2603:10b6:8:22::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5703:EE_|CH3PR11MB8209:EE_
X-MS-Office365-Filtering-Correlation-Id: 763cd0f8-e14d-459f-69c4-08ddae4d66ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?LzE1MnBsQ0g4UElER002N0dhRklSVk9ydFFqK0hhbzg5bURCMzVFVFRPUHpS?=
 =?utf-8?B?dThNRHRnV2Y5NE9GRm9tR1NQV05vUk9vUEJNTVM0UGNzZ2c4RlQyMWkvTUtp?=
 =?utf-8?B?S1NyRjFKTjg2dXREZ1U0dVlVSzU2bXMrVHAzTVVIcUMyZElNV2hhbGl5QldO?=
 =?utf-8?B?RVc0V1hmWHhiblR5WWRub3BBdGVZYWsyckNFNGxJNjRBQ3JCOHF6aVBIRlRX?=
 =?utf-8?B?VHJ1RnhMVXZ3VHlPY1dhM2VmQ1psaCtZNnJYVWRER0VCeU91WTAzbldHanB1?=
 =?utf-8?B?aTFPQUFlOUtMMlZYSTBlQVdIdmtGRzg5eVgzS0gweVp0RnFuWXJPVlVhaWVE?=
 =?utf-8?B?MFZyTHJmbnp5ZEFsd09rSGZFaWhRZW5XdHNFelFNekh2U2V1WHBaUXVLZDNY?=
 =?utf-8?B?R2hSemJmVmlvR0N4eElUeDlRakpHb3Bqb3VzUXJhdlk0eU1MV1FMeDZ0SkNY?=
 =?utf-8?B?dDIzdzZCMHdtbytCMjFFdEYvdTlVRnRWWDFRYWV6QnBoQjB6NVZldWNWZHJw?=
 =?utf-8?B?TjdJZ1hLOWNKTzRJUEU5RjIwR09Dek8rMDRUbmNQNEdkQXl4VHhkVHBtb20w?=
 =?utf-8?B?TVJ2OWw4MnY3UG5GY0xvUzdwRSs3UzU0UzdFcm1ldU5wd1JPeGtwZWJ5eVRx?=
 =?utf-8?B?Y0JoRkZtZ0FnYVV3Sm5VYThYNE9hZE16L3Z2MHowNFRSeWovdzRWQmF6N1hT?=
 =?utf-8?B?alF2QW5VOWJLNlhxazdJZThNTHk3OHFpenZUTVF3NXI0Y09HekxKNXc1KzBN?=
 =?utf-8?B?dlVwemlyblJYM05yWVYwS1RYa1gzYkg4Z2ZzY0thd2MybGV5TXZIelFxWFIy?=
 =?utf-8?B?ZXdQamhHaEpCMlRzb2pZb1p5REgyRTBGSTRKbnJ0dUxkOXlwMXo0RVI5eDFy?=
 =?utf-8?B?djlvYjYwWVJvUk44Ly8yRDkyUWVKdmxiWmZTZ2gvdGhQY0MrZUpvTks4bHpm?=
 =?utf-8?B?YkdRQnhuMmw1TXFoMHYxNERMa1grQmJjdDA2eXlnem9CcFBQM2wrNDZuT3pt?=
 =?utf-8?B?d25BWVROd2pyY1BNbzgvaVljREZxeHZyN2VOMVNGaVF3eWtkUkM5MUxINGcw?=
 =?utf-8?B?RXoveWhjRGJLS0NrQjVrR240cGZZdGFsUml5U0ZzMExlNFRBZVI2TUZsRCtX?=
 =?utf-8?B?aFYxUXorWGJsaVVOTHgrZitrcmhnTkhLeStIK1M4cndUU1VYTm4yS1dBdCtT?=
 =?utf-8?B?bDV5a2hxS2h0ZWxGZDc4VndobFM2elhEYjdId3ZJb01pbnpXTGNURXR6MjlD?=
 =?utf-8?B?YWdzQzNUbUR4MTVudDRHN1QvNytBNU1hQzBXb0VzMG52TnlnMzlIbmxvV3Zo?=
 =?utf-8?B?TGxBamplc1Z6NWFtOHBZbUpFTnNkd3BybUdNQ3NBeUc1RFZraWFuNXZXSmZl?=
 =?utf-8?B?VkVKV3Yxa2lpYUI4WTRnRmNsRnZvcFI5T1dYZFZ5MStFZmVVdG1XMzNuSHl2?=
 =?utf-8?B?REdzUnMwK2owRHlwMUZ1R2Y2aFpQRHFnd2ZXYjVsR0lPcGE2OXRnNFU2WWV2?=
 =?utf-8?B?RzNIQVZXRWlZWVU5TDF2bXROYWg0UGk4WDBDMFF6c3ZKNEVXV1czcjIza0tv?=
 =?utf-8?B?WE5yaFRmdzN4TW9ZOFl1ekZXUnhzUDNaQkl3ZjIwMFVLU1lXc1BUd2Z6UE8x?=
 =?utf-8?B?MzRFV0RlU1BiK0hYd09vK0lTb21MeEJsL3g5c2xpRzVjdE5JNkpibDYxaGla?=
 =?utf-8?B?ZXg2SnRqWk9KQmhMOGZsME5CSklES0RQM2VEZ0hRMXI0Tnl2Y25veTF0YnNL?=
 =?utf-8?B?a3phUllUcUdlTFZERm1xTHJvSkhzSForVDN4NjFLVjFOYVAwa2pkZG1meXBk?=
 =?utf-8?B?WjgxTGFzQWw3UytxeVRkYTBpaTVET0xKNlpISlJJU2RtZCtYNXgraTMrbUxZ?=
 =?utf-8?B?WE94ckl6VytZcFlXRzUwbHVybCtaYnl6Y1VYbER6RGZ5dUlRMmNiZ3FPaktp?=
 =?utf-8?Q?K3hWDiGPQo4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5703.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dEc5dS85aTF2K2YvaUt4aUJOZDhmVE5JTjBmLytEMHI2K3dUYmMxWXZPYUFr?=
 =?utf-8?B?YXN2MzRmT0NML0JReGhCZFNaTjBPWDFTd0xqNzYwZU5XNlk5a3pnRkl5WXpp?=
 =?utf-8?B?WlJIQ2UxZHM2VWloanFNNHExbEI5S0ZTRFVYdktIbW5ua3hnMjdMcnp6Q0E3?=
 =?utf-8?B?aEE2UFN1Mmc4dFlwWWN6UnBRSVh3QVBEV2xmby9CUjQzc0FTbkU4dXV1Skhz?=
 =?utf-8?B?aFhpRjRSQUQvZlNoN0h1RVZuazYrR2tJTFFqdkdlb0tVQzEyazZDZ2NwUjFC?=
 =?utf-8?B?QWg4aTU3emFDUFFEa2J6bGRwQnFwcG5xb25yY3NFdmpCMndmQkZ6bW5maVdX?=
 =?utf-8?B?ck12a0dUMzdXWmRHYTB5ZmhzYVFQVVRtWitCN2xxV3B4T3VyWmgwOWRlcjF4?=
 =?utf-8?B?WGJtY3F2bXg1UXFRbHc1amJmNCtLWWF3NDFVVmtUTjRqNVc0QzlZRWUza2cv?=
 =?utf-8?B?QkNiZ0tkTjdwcEw5MDc2dWc0ZVJRd1BsbDVaMDFjTTExRkJwRHI5eEg2L2pi?=
 =?utf-8?B?SXNsUzJySEI3aW5xbnBKaXJ4T1Jxa2lBakNNVE91SnRkemhTRkpqcEZBT0Ny?=
 =?utf-8?B?bVRSRm5hQXRjNzRScHpiZXIwbU9VQThkTjcycndoZlZkVkMrYXRKbFp0ZUhQ?=
 =?utf-8?B?Yi9JUXZxMEFZNGlCUXNhTlhPajdqcWttYy9uOG84Zyt0MTFIQlV5WThLODVo?=
 =?utf-8?B?bS9KemJJZHB4M2h5SjJuZ255UmlPVkI2NG9MQ3hZVm5pOE45SmtpUlAvN3hw?=
 =?utf-8?B?Q0xaa1NEazQ4a2dnU2RNSkY2a1UwOTFpMnlra3d0a0lZUWdKcWVFQ01Kdjdz?=
 =?utf-8?B?NXhNbk16M1ExWFNwWDh5VHRlWGpkM2k5SWlpU1FwREhrN3RtWThjZTNmYnp2?=
 =?utf-8?B?SEE2WmYyNUc4SEVaZWdLdzZZU3FzTHBRNmo2czZ5WGpQSXVnUFZCcE5MU3hV?=
 =?utf-8?B?WUJieXo0cTh6RkpvZHNJR3FKN0RiUHd5eGFNRVlSTFFKNU5OZkZYVmVONVpi?=
 =?utf-8?B?MGVibzlhekJEelJZd3ZLQmlmaFNWTm1sSnFNemlqODBMVmFVbEhaeEtySHZQ?=
 =?utf-8?B?eEwwckcycFl5Y2c0WVVudU8wd1FlMHhsWFh1NDNyakh5S20xM0xZK0c1TUZF?=
 =?utf-8?B?eDBiUmxPeTNKSE5wKzlkUnJTZGJFM2I0aDE3NGNLK1oxQ1RUQTE5Vjc0OGo5?=
 =?utf-8?B?M01GTEZHbGZ5VkVQZEpBZnUyMXRtTWlDNVdxZDlLczB6QjhSSVVZbFA5clJU?=
 =?utf-8?B?ay9hajVRQWQ1bEY3OTB5bnZLOFB5OVd4VnhNSXhkVHRMR0FXeXZnYWs0VE5n?=
 =?utf-8?B?dWhlTUJWOE84Tnc3N000V2htMUwxdlN4Tk1aRm9TOG1lbnJqVUlFb1NncHZX?=
 =?utf-8?B?bW54MkV5ZFVPZnhXK291UFRHVzdKVVJRK2YwYW5KMHFYazBXbHlkWVJZZDZv?=
 =?utf-8?B?T0FvbEk0dVJxQlFXMWxuMzRRZzYvcTNUVVRkcVQrY1lwSU5acHUrNUhQeVVO?=
 =?utf-8?B?SFpLeEMzdnVzNUVtOUh3TjJyR2E3WXRqY1g1UDRXOTNhbDUzR2hpQnFpYVly?=
 =?utf-8?B?SGtpcnZsZkRIYU9YL1ZTU2lFU3IyaTJTVjY0QXRGbStvYWM2bzZTaGF6OUNK?=
 =?utf-8?B?VTB1azNXbGZXK0FZbDJpZXNNaFZCMVlmeDM0bHljeGRBYUVmUmwrNkRqZUdH?=
 =?utf-8?B?TUdJK1NYZ1lCTHhJTnFqbTBOdWdKM2R3OEpVSEJiMk1NT0luUFZiUWlGQlRN?=
 =?utf-8?B?RjdvMXhoSWduRFVFQS8zRmlOQ3FWaFlqc2JhYVhjb1NPRnBUbW5tVnR1Nml1?=
 =?utf-8?B?eUtOTWk2VjgxdUNVZlhjdHJBeDJvL05aYjFrYkNWTmpIZWx5bnBpUmFCUHJs?=
 =?utf-8?B?dFpmM2R5bmRMK2g5N0ZXeUMzd1pvTk9MWUs5dElhYTJGeWRSNVNjbzFKZTF2?=
 =?utf-8?B?WGFtckkyaXJxcGYxYXQvTWVMSldDR2hHd2ZJMG1CbDVOVW50aVprbXVVUjVs?=
 =?utf-8?B?RFpqY3hrMHQwdDkvUzBXNVZoZUxRVXJqUlNrVlFDZkhCZFBxaVpMbnBoV3Bq?=
 =?utf-8?B?aytEUkllbFhNOG1IQ3pnNWR3ODVzaVFyRDB0Nlk5dUlNSlBiNXdGNC9ielFL?=
 =?utf-8?B?YXFSTENVTDQ2MHZXSjBoTGMvY2N0aHV2SnJhcWFvRmxiWXhtTGJ1RlVpOHZT?=
 =?utf-8?B?WGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 763cd0f8-e14d-459f-69c4-08ddae4d66ef
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5703.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2025 09:49:22.2736 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7sZUuKLZeqIxfEP6ReFc4I+hV6i7dJvIa3DzHHKoUlHSoOyD7z+PxExrTUn0U4pF47uJy3BPK5P9yZBZWAW6nA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8209
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


On 17-06-2025 17:03, Riana Tauro wrote:
>
>
> On 6/17/2025 3:43 PM, Poosa, Karthik wrote:
>>
>> On 16-06-2025 13:10, Riana Tauro wrote:
>>> Hi Karthik
>>>
>>> On 6/16/2025 12:41 PM, Karthik Poosa wrote:
>>>> Prevent other bits of mailbox power limit from being overwritten 
>>>> with 0.
>>>> This issue was due to a missing read and modify of current power 
>>>> limit,
>>>> before setting a requested mailbox power limit, which is added in this
>>>> patch.
>>>>
>>>
>>> Since you are making changes to power interval also .Split the 
>>> patches into two. One to add rmw and make changes to existing code. 
>>> The other as the new fix. 
>>
>> We can't split xe_hwmon_power_max_interval_store changes in separate 
>> patch, as it would cause compilation issue.
>
> Okay.
>
> Use either one across file PWR_LIM or PWR_LIM_EN | PWR_LIM_VAL as its 
> same bits
Changed this to PMR_LIM in next revision.
>
> You can retain my RB.
>
> Thanks
> Riana
>
>>
>>>
>>> Thanks
>>> Riana
>>>
>>>> v2:
>>>>   - Improve commit message. (Anshuman)
>>>>
>>>> v3:
>>>>   - Rebase.
>>>>   - Rephrase commit message. (Riana)
>>>>   - Add read-modify-write variant of 
>>>> xe_hwmon_pcode_write_power_limit()
>>>>     i.e. xe_hwmon_pcode_rmw_power_limit(). (Badal)
>>>>   - Use xe_hwmon_pcode_rmw_power_limit() to set mailbox power limits.
>>>>   - Remove xe_hwmon_pcode_write_power_limit() as all mailbox power 
>>>> limits
>>>>     writes use xe_hwmon_pcode_rmw_power_limit() only.
>>>>
>>>> Fixes: 7596d839f6228 ("drm/xe/hwmon: Add support to manage power 
>>>> limits though mailbox")
>>>> Reviewed-by: Riana Tauro <riana.tauro@intel.com>
>>>> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
>>>> ---
>>>>   drivers/gpu/drm/xe/regs/xe_mchbar_regs.h |  1 +
>>>>   drivers/gpu/drm/xe/xe_hwmon.c            | 48 
>>>> ++++++++++++------------
>>>>   2 files changed, 24 insertions(+), 25 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h 
>>>> b/drivers/gpu/ drm/xe/regs/xe_mchbar_regs.h
>>>> index 5394a1373a6b..ef2bf984723f 100644
>>>> --- a/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
>>>> +++ b/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
>>>> @@ -40,6 +40,7 @@
>>>>   #define PCU_CR_PACKAGE_RAPL_LIMIT XE_REG(MCHBAR_MIRROR_BASE_SNB + 
>>>> 0x59a0)
>>>>   #define   PWR_LIM_VAL                REG_GENMASK(14, 0)
>>>>   #define   PWR_LIM_EN                REG_BIT(15)
>>>> +#define   PWR_LIM                REG_GENMASK(15, 0)
>>>>   #define   PWR_LIM_TIME                REG_GENMASK(23, 17)
>>>>   #define   PWR_LIM_TIME_X            REG_GENMASK(23, 22)
>>>>   #define   PWR_LIM_TIME_Y            REG_GENMASK(21, 17)
>>>> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/ 
>>>> xe_hwmon.c
>>>> index 0d32e977537c..fa841311bdcf 100644
>>>> --- a/drivers/gpu/drm/xe/xe_hwmon.c
>>>> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
>>>> @@ -175,8 +175,8 @@ static int 
>>>> xe_hwmon_pcode_read_power_limit(const struct xe_hwmon *hwmon, u32 att
>>>>       return ret;
>>>>   }
>>>>   -static int xe_hwmon_pcode_write_power_limit(const struct 
>>>> xe_hwmon *hwmon, u32 attr, u8 channel,
>>>> -                        u32 uval)
>>>> +static int xe_hwmon_pcode_rmw_power_limit(const struct xe_hwmon 
>>>> *hwmon, u32 attr, u8 channel,
>>>> +                      u32 clr, u32 set)
>>>>   {
>>>>       struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
>>>>       u32 val0, val1;
>>>> @@ -195,9 +195,9 @@ static int 
>>>> xe_hwmon_pcode_write_power_limit(const struct xe_hwmon *hwmon, u32 at
>>>>               channel, val0, val1, ret);
>>>>         if (attr == PL1_HWMON_ATTR)
>>>> -        val0 = uval;
>>>> +        val0 = (val0 & ~clr) | set;
>>>>       else if (attr == PL2_HWMON_ATTR)
>>>> -        val1 = uval;
>>>> +        val1 = (val1 & ~clr) | set;
>>>>       else
>>>>           return -EIO;
>>>>   @@ -342,7 +342,7 @@ static int xe_hwmon_power_max_write(struct 
>>>> xe_hwmon *hwmon, u32 attr, int channe
>>>>           if (hwmon->xe->info.has_mbx_power_limits) {
>>>>               drm_dbg(&hwmon->xe->drm, "disabling %s on channel %d\n",
>>>>                   PWR_ATTR_TO_STR(attr), channel);
>>>> -            xe_hwmon_pcode_write_power_limit(hwmon, attr, channel, 
>>>> 0);
>>>> +            xe_hwmon_pcode_rmw_power_limit(hwmon, attr, channel, 
>>>> PWR_LIM_EN, 0);
>>>>               xe_hwmon_pcode_read_power_limit(hwmon, attr, channel, 
>>>> &reg_val);
>>>>           } else {
>>>>               reg_val = xe_mmio_rmw32(mmio, rapl_limit, PWR_LIM_EN, 
>>>> 0);
>>>> @@ -378,7 +378,8 @@ static int xe_hwmon_power_max_write(struct 
>>>> xe_hwmon *hwmon, u32 attr, int channe
>>>>       reg_val = PWR_LIM_EN | REG_FIELD_PREP(PWR_LIM_VAL, reg_val);
>>>>         if (hwmon->xe->info.has_mbx_power_limits)
>>>> -        ret = xe_hwmon_pcode_write_power_limit(hwmon, attr, 
>>>> channel, reg_val);
>>>> +        ret = xe_hwmon_pcode_rmw_power_limit(hwmon, attr, channel, 
>>>> PWR_LIM_EN | PWR_LIM_VAL,
>>>> +                             reg_val);
>>>>       else
>>>>           reg_val = xe_mmio_rmw32(mmio, rapl_limit, PWR_LIM_EN | 
>>>> PWR_LIM_VAL,
>>>>                       reg_val);
>>>> @@ -591,14 +592,11 @@ xe_hwmon_power_max_interval_store(struct 
>>>> device *dev, struct device_attribute *a
>>>>         mutex_lock(&hwmon->hwmon_lock);
>>>>   -    if (hwmon->xe->info.has_mbx_power_limits) {
>>>> -        ret = xe_hwmon_pcode_read_power_limit(hwmon, power_attr, 
>>>> channel, (u32 *)&r);
>>>> -        r = (r & ~PWR_LIM_TIME) | rxy;
>>>> -        xe_hwmon_pcode_write_power_limit(hwmon, power_attr, 
>>>> channel, r);
>>>> -    } else {
>>>> +    if (hwmon->xe->info.has_mbx_power_limits)
>>>> +        xe_hwmon_pcode_rmw_power_limit(hwmon, power_attr, channel, 
>>>> PWR_LIM_TIME, rxy);
>>>> +    else
>>>>           r = xe_mmio_rmw32(mmio, xe_hwmon_get_reg(hwmon, 
>>>> REG_PKG_RAPL_LIMIT, channel),
>>>>                     PWR_LIM_TIME, rxy);
>>>> -    }
>>>>         mutex_unlock(&hwmon->hwmon_lock);
>>>>   @@ -1217,25 +1215,25 @@ xe_hwmon_get_preregistration_info(struct 
>>>> xe_hwmon *hwmon)
>>>> &hwmon->pl1_on_boot[CHANNEL_PKG]) |
>>>>               xe_hwmon_pcode_read_power_limit(hwmon, 
>>>> PL2_HWMON_ATTR, CHANNEL_CARD,
>>>> &hwmon->pl2_on_boot[CHANNEL_CARD]) |
>>>> -            xe_hwmon_pcode_read_power_limit(hwmon, PL1_HWMON_ATTR, 
>>>> CHANNEL_PKG,
>>>> +            xe_hwmon_pcode_read_power_limit(hwmon, PL2_HWMON_ATTR, 
>>>> CHANNEL_PKG,
>>>> &hwmon->pl2_on_boot[CHANNEL_PKG])) {
>>>>               drm_warn(&hwmon->xe->drm,
>>>>                    "Failed to read power limits, check GPU firmware 
>>>> ! \n");
>>>>           } else {
>>>>               drm_info(&hwmon->xe->drm, "Using mailbox commands for 
>>>> power limits\n");
>>>>               /* Write default limits to read from pcode from now 
>>>> on. */
>>>> -            xe_hwmon_pcode_write_power_limit(hwmon, PL1_HWMON_ATTR,
>>>> -                             CHANNEL_CARD,
>>>> - hwmon->pl1_on_boot[CHANNEL_CARD]);
>>>> -            xe_hwmon_pcode_write_power_limit(hwmon, PL1_HWMON_ATTR,
>>>> -                             CHANNEL_PKG,
>>>> - hwmon->pl1_on_boot[CHANNEL_PKG]);
>>>> -            xe_hwmon_pcode_write_power_limit(hwmon, PL2_HWMON_ATTR,
>>>> -                             CHANNEL_CARD,
>>>> - hwmon->pl2_on_boot[CHANNEL_CARD]);
>>>> -            xe_hwmon_pcode_write_power_limit(hwmon, PL2_HWMON_ATTR,
>>>> -                             CHANNEL_PKG,
>>>> - hwmon->pl2_on_boot[CHANNEL_PKG]);
>>>> +            xe_hwmon_pcode_rmw_power_limit(hwmon, PL1_HWMON_ATTR,
>>>> +                               CHANNEL_CARD, PWR_LIM | PWR_LIM_TIME,
>>>> + hwmon->pl1_on_boot[CHANNEL_CARD]);
>>>> +            xe_hwmon_pcode_rmw_power_limit(hwmon, PL1_HWMON_ATTR,
>>>> +                               CHANNEL_PKG, PWR_LIM | PWR_LIM_TIME,
>>>> + hwmon->pl1_on_boot[CHANNEL_PKG]);
>>>> +            xe_hwmon_pcode_rmw_power_limit(hwmon, PL2_HWMON_ATTR,
>>>> +                               CHANNEL_CARD, PWR_LIM | PWR_LIM_TIME,
>>>> + hwmon->pl2_on_boot[CHANNEL_CARD]);
>>>> +            xe_hwmon_pcode_rmw_power_limit(hwmon, PL2_HWMON_ATTR,
>>>> +                               CHANNEL_PKG, PWR_LIM | PWR_LIM_TIME,
>>>> + hwmon->pl2_on_boot[CHANNEL_PKG]);
>>>>               hwmon->scl_shift_power = PWR_UNIT;
>>>>               hwmon->scl_shift_energy = ENERGY_UNIT;
>>>>               hwmon->scl_shift_time = TIME_UNIT;
>>>
>
