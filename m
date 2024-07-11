Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BCF8C3DA41
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jul 2024 12:34:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E6CC10E1F8;
	Thu, 11 Jul 2024 12:34:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jhf51ZOz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F3B310E1F8
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jul 2024 12:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720701278; x=1752237278;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=CmjDo3rOBBGZ8mPyO9cIC9MSlhTNfHhOcdvKwS+sK5Y=;
 b=jhf51ZOzoxZxgRjs5E3ed1AIRiHBEoNFpIt/P1r9xqUOBCpgSvb5JwgQ
 o8mWa0QUqWr0AsOibYv77Y3ayFnCqfYt8jvKSx+BU7VyRMp86uzBYCbh9
 fK5F6V1gb1R9YE5WF0ErVuF50zACl60jECHLmgFAmgwmamlOaV4jqExbv
 VhLjEN5XT7w2Itcgu1rMjFpyTbNMvDy33y2ztdkFy9FZy2pLXBSLVh1UQ
 o4kl8ndCnpech6aAjiHnCmQs79NcPrvyBeRaTx64csrvzFUP31fXeF6JX
 wflmZ6/FxYXDlPWVZSGNQ1ZdNt4nroUSYHbFkYCoNg51Ua1bo0KKZ5xSC g==;
X-CSE-ConnectionGUID: e5BKfelFRZ6WzB9jMxYT6g==
X-CSE-MsgGUID: +1Y9fV6ySiusIo1WTH+2Nw==
X-IronPort-AV: E=McAfee;i="6700,10204,11129"; a="20986584"
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; d="scan'208";a="20986584"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2024 05:34:38 -0700
X-CSE-ConnectionGUID: iE+KUN5xS2G6nE3lhLAptw==
X-CSE-MsgGUID: Xg5Eck2cRe2zCUm6QnV2FQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; d="scan'208";a="53140112"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Jul 2024 05:34:37 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 11 Jul 2024 05:34:37 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 11 Jul 2024 05:34:37 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.47) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 11 Jul 2024 05:34:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dD8HAiy7DOxc8J3/pEylZmzF8POGRoqQ28gu59iI3sxCWIunEsY7Kset2Ezrt3twi1MtM1Ulo8LD3htyhw84u9ACr4zINSPK5WXIrdWayTkRQy26v9XleIod99zG3NktawCStqqX9sH+vNMtb24Pv8Bd2kszp5+6atf6Zb5vcSd/an53MsY/eJNPK9IKr0/yBDB63WZJCZB9HI91TCQ4pXqXKB1YNiyMC/EaWYFFg5mO/3Doxby5yHpmKzuJCYFlGeNLyfYh6lYKwBVezNXBz6LJOwuVHRoDI79zz8cZFgzoYraBkXyxclwS/AlMwmRX7SWuF9MH+UXojMxQLpLUaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/65NtxijyDrquEMLUirL5fYgDJbr3D4JAyAYTO4fe7U=;
 b=g9enZPqTM6zA5TaAKerSbg4ypli+kkWc+MKlCt31lyno8Z2Hrp2aV7Z+2ehkEWrOBny3UdLrlf9brhWdjR58MGhkEFgbISgh3oFG67BR0XPSqsrXFQYpRdFXc3BP0kfroixAkTq8CFDKlVJEgm4+BhfMjUcnzNQo0VmtW6lNvBLBYZFUmejzARjauHIv39HWmCITFcxzyuQ6ZIuFLWZNaQX4HsOTyYNor8ZegThKXA8GiEqsN7LfAQY+pVseADW411u78Dgl0k00KL4cbPlDyGf0C3s2CQAe8VBzrnhJp3GSdd6pS7KPcO1dYmBwWCABsfzyyBaegj1cFNb00j+51g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by CH3PR11MB7724.namprd11.prod.outlook.com (2603:10b6:610:123::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.22; Thu, 11 Jul
 2024 12:34:29 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%5]) with mapi id 15.20.7762.020; Thu, 11 Jul 2024
 12:34:28 +0000
Message-ID: <1d59d288-b8f3-4125-b837-2ca3e479bf29@intel.com>
Date: Thu, 11 Jul 2024 18:04:21 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] Implement compression support on BMG
To: Akshata Jahagirdar <akshata.jahagirdar@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <akshatajahagirdar6@gmail.com>
References: <cover.1720515376.git.akshata.jahagirdar@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <cover.1720515376.git.akshata.jahagirdar@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0007.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::6) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|CH3PR11MB7724:EE_
X-MS-Office365-Filtering-Correlation-Id: 7233266b-79b5-4b6b-d9f4-08dca1a5ce80
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eHBtU2JCd0Q4aFNmMEFZdjIwYWtvc2hXbGpIRkVNblpUcE1LRW5pWm80RUF3?=
 =?utf-8?B?aXo0bkNvZ3laY3lqQ21uN05NSDJULzJiR0RzMjFMRnZRY2M1QjRzVmRnM28x?=
 =?utf-8?B?L2F5MDJjNXNCamt4TnhSMmhXWDFPcE9nMmhFaklmSTNGalFnd09Ud3BjSWhE?=
 =?utf-8?B?Y2R3MW5FTFdGT24xa2JiZ1NpMVdWSmQ5RGtSVkVJSFNrM3RxZkFDQTdGU2tV?=
 =?utf-8?B?alNDc2tOME9WVmtkaGtrZzlKZ2FITzdDRWxxT0IvdGVsS2dGbExRTndyZFdv?=
 =?utf-8?B?ZmYyTUpicU1uQzFrWFl1S0NGUm5MOFJQYSsyZUZkYUZOSFhkZHRNSkphMksy?=
 =?utf-8?B?NlpnbFpOdTZMYUNYd0RaZ0lyeVFKMWRRcFhFby93UHE0S013ZG01bis3QU1N?=
 =?utf-8?B?ZXc3VEhCZnJ2bWM1bkdSa1cvbjZiZnhubllmeThrZnhSb2UxZjYyM3p3aS9o?=
 =?utf-8?B?aFVLRTNZSUQrUWNuRmQ3NUhCYWUrNFlhRFhHam9HOTU5U0NRSU1YditzSkJx?=
 =?utf-8?B?eFNKbkl5ZE9yMGRJMzNrNlpuUStqOTFnbmZ0eTZVZ2k0NzRSL0pOYWZjQlhS?=
 =?utf-8?B?TStPZ0Z1Yi9JaUVLL3VFdXcwQ0JpUjZPdUVsYXBQalNzUTdjYkQ4Z29QcjF2?=
 =?utf-8?B?OEJhZW9VTGs5S2tnU24rQktzUHBxaW1RZk9GMFhKS3h0QUQ2MC9nNnpNd1lz?=
 =?utf-8?B?QUhwZ1RtZ0lEM0xraDdvR2FpdkdLMStXRjBTdHZXLzQ3T214VUdVZ1AxbkY2?=
 =?utf-8?B?ajk0OWdyYk15S1FUbW1ZY0tCMWdMVG9JVXRPSkg1d2wxOFFtcytGUThDT2tW?=
 =?utf-8?B?WDFBQ2ZZeFloM1lMNU04V1dmWlZ3Yzcya29RTy9sb2hMWW5xTWxpc1E4MU5T?=
 =?utf-8?B?WC8vTHRsOWRlOFkyQzNrT3hFaDlIaEthMGxFYUd5eE1OZTl2bGFXTmY2eHow?=
 =?utf-8?B?R2xwMjkvSGhMTklZdk5lS09xRmdyWlNsZVZnYWcyR0xZcHlXbkk4dm9XTXNm?=
 =?utf-8?B?NFQ0Sm9NUGpZZmZDQldTbldNUW9BdzZkem0vVGNoMVFNWDBmckswTDFVTmJs?=
 =?utf-8?B?KzI2UGJ3UGNlNEdkQVN3MVl0Q0FnanpSa0RBWi9GVlVVM0tMelhwc1NaVVJY?=
 =?utf-8?B?cHNXd2xCcjVUOENTVzQyY24vK244bkpIUTNyRHloanBhQTdEdVBhMzh6YUhh?=
 =?utf-8?B?THhRWEkxVHVQWnVtcmxxTWZVZlRaSmRLMmw1aW1aV2RQV2dkZmpEbDNIaWFQ?=
 =?utf-8?B?eGhJNUJDN2lEdmdrT0JyZ094Zi9MQmNHei9lSDhMYU1QQmc5Z3QyYmtOM3lU?=
 =?utf-8?B?aEwycGxWdnFJSktOdmlSMnQxSFQ3czdwb0ZvdGlGUjZWS1pFbFJQZ1MyazRH?=
 =?utf-8?B?RFcrN3BRVW1uRUY4S010ZDFYQVFQWGtTVVN5bk1EZTNjV25GTzVZeHdBL1M4?=
 =?utf-8?B?S2U0bE12NVNta2ZVbnlXYjZLc01RVVlwYzVHa1puaHg2RGZlQXNwNTZObHUx?=
 =?utf-8?B?NUNKKzdndnZwcEhGSVIzK2dtaDZEWTNKTm92eUdVbXlzQWF2T2Fteit6MUsy?=
 =?utf-8?B?NjQ2S0dQbzEzOEREdGRlbE1kR3lDdmRIMU5ZTjRvUktsS0htQkJpVFo5VXVx?=
 =?utf-8?B?QW85R3JCeTlwTzdwd1lqbFI2SWVvb0NFR3l3R1FTRFVxYnhFckxIblRoWExa?=
 =?utf-8?B?cTJZV1Irakl6VDFFb3pPNjh0aDArTVZJT0h6Z3FrVGtRS1NEOHJGWnRpMnFo?=
 =?utf-8?B?azdRQ0ZHM3gzVTNMQ2FTTmYzN2E2TFd0TVFMWnY5ZWcrQjA1U1IzUlJuSzJQ?=
 =?utf-8?B?OFRXVGpBcTBZS3E3aVpuQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NHozSHp6OG1Id3d0TVNjeDVGTllnbGZ4bTgvTkJGU2hleHhiVEwwYkpxSXNq?=
 =?utf-8?B?SEJybDhsWHRxa2xhNDlCMFdMWGZTM3ovM1JWM1JVSHdzUjJiRjZnYUpOR0RT?=
 =?utf-8?B?QVF3RDZPRWV1bEtYbXVVcnRlSmM0dWNQVDNWUHNpVVpqM2VJQ0I5TElrV3FM?=
 =?utf-8?B?R0NVajhVYVJ3Y09UaVM2dzdmUkR4RlE5bDJqMVZGRW1Rak91Zk9UUHpsNzdZ?=
 =?utf-8?B?VVN1TkhLakQvWm1FTmVwaytKWkV1UzlZOEtXV0pucXk1bUJ6STMwSkJwemtS?=
 =?utf-8?B?cTArMVV2UkV0VjNRaWZoc3ZaOVgxMld0YjNRWlFSQ2FVM0hSUFlydHA5WWlP?=
 =?utf-8?B?cVd3aWl5MmpaQmpKQi9PZ1NoR2tPdFdBUXowdm1YeUh2V1NRRXJqR0FDcWY5?=
 =?utf-8?B?WkxCZm5SWHoyOCtZL2c5eU5mWURQVGxpM0JJamYrMWVoWk5ic0t6SjJqMlpx?=
 =?utf-8?B?cHpEWm9md0lwQk1pNTNZRWEyVXBTWG5xQ3ZtYmFUdlR4QlBHT0JVSTlIRzA3?=
 =?utf-8?B?WERHeEFEVXROUENwQnhFSWxEMFJEc1FNaFRiamQ2UGhJUVVkamU1LzZVc3dv?=
 =?utf-8?B?TGQzQ1IvK1F6MW9Kb3plbkRiMFlBNVJWcEZhZERtZmw2eUNMakhjdjdpa3Na?=
 =?utf-8?B?NFI1eiswV2wxZWVIejE4TGhrR3JZOHRRVGRJb2FsSmNnY1UrMjlScWpoOFZT?=
 =?utf-8?B?bFNXbnZHS0ZXS1lPTzIwZ2JpRE9GbjgxSTFnZVIzWFRLL09adVRmM3R2Q0c0?=
 =?utf-8?B?RHE2V09TTnVMZ1Biak1uOW4wajlPZ210YTNpYzE3R0ZQSk9MY3dsMkswQzlv?=
 =?utf-8?B?aHVITFJnY3UwQ1VrQW5NbVpFcm0zRyt4Vko0MDZ2V3VBb2xHTWxVZlo3QnJK?=
 =?utf-8?B?ZWZmNm1zWk1qR2xad09tQ2gxZ05zMnNFeFJibkx0cmdkY3h3V0VRY2dLZ3Ny?=
 =?utf-8?B?WmtMNDFjWUlDQTNBTWIvM25Rc29yVk5IcXF1cXI2eS9jaUtSSXdFK0c3aGx6?=
 =?utf-8?B?TXNlTGZ0Qkl4dGtKU2VGWjdNQzZnZWE2UG1Vd0UrZlpVUmZaRGdRNTkwb2ZO?=
 =?utf-8?B?Wjlib0k3YkZ1dlhmZ1RWbVRBQmc2K2VvaGhXcjE2Tjg2N2ZOcGdTaDhHQ01Y?=
 =?utf-8?B?VnB2TFRWWU1HNEtsWE1Wazk1aVZac1Q1OE9RT0ZqOGhRRW1Od1RaMnZVU2l0?=
 =?utf-8?B?T1B4WEphanF5cTl6OVZNT1pLakNCWTYrUnhKL1YwV1Nwa1RXWFdZQTI0NXp3?=
 =?utf-8?B?YW9Vbm5NbGcvMnp6OVhvci9TQ0JtNkE3MSswSUdkcGErSGlxNVA4d2VtSnRN?=
 =?utf-8?B?TmxGeGJMc2pFbjJCL2RJL01WNVpkaXgxRUNVTWhRM3V6dmJVMlplSjhmN0Vy?=
 =?utf-8?B?emRwWW9hM3dtYzZqTmwxNVByaDVOYUFuMFNaL1QwVXI5SWZjSWJQZXRDaDBn?=
 =?utf-8?B?TnhUK2sxQWg0MDBQOVM3YStWdlJkTVk3blBmM2pIeGZVekh3RDFYZmhYV1Nx?=
 =?utf-8?B?Qk8xSEZRbjNYN05GekkyNFVRc3BtVDZ2dGdqY1FuWmo2eG5OVzRJYVhYU2Vj?=
 =?utf-8?B?c0IrTlQ1YlVVa2ZtY0pxcXFZYmVCTW84a29mSFc5SjBUUW5VaFB0TWJUa0c0?=
 =?utf-8?B?dHdJOStiaFJBN1grbjFIeThZYXBBV3lSRVI0RUFiTGtsa1B5bGdNMFQ2TWdL?=
 =?utf-8?B?enI5elUvYUhrdWpjbTlKcUtSWUhMbFlEc3psb3ZPaWdISGJZQlJWckwxNTV1?=
 =?utf-8?B?c1UwanBCWkgvUEJjSFJJK0VXSUxjSnpvNGM4ZE91SnNpbEF6TGlrM0xNZVRG?=
 =?utf-8?B?dlpaMVY1VjRXNEQ5WXU0LzRoMDhYZlhEck0wRnlQcTdOMTVEWVVVdzdVQVd0?=
 =?utf-8?B?N285Uk1Cd3NiT01QOGEvbGMxQXZSVDBDbGF2THpLdDRpMFdEZVlGazVwNmVP?=
 =?utf-8?B?VFNpVFNsRGJDVkJFREx6ZTViOEh2RnBObUJ5UUtuSDB2VlNWWXRRdlphQ1NG?=
 =?utf-8?B?YmZXVUxOMGxYaXVta3dqa0RiaVBpWjQ5cGFIQ2NGWDZhTTdSa3U3TVVCa1k5?=
 =?utf-8?B?dmxZWjluclIxL3IySE5VSkxicG1DMWd6WkpNSjNhUU5sdzRXVXQrT2xJOWll?=
 =?utf-8?B?RXphdmNGdEd1UFJIbTgvR05jc3hOOFJFRXpFYU40blFhSEU5RnRLRTBnZjgz?=
 =?utf-8?Q?Naz+uasJroQ4mlQQdtmwqHM=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7233266b-79b5-4b6b-d9f4-08dca1a5ce80
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2024 12:34:28.9384 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4d3v5UFDyPjv/gz5hOHhHVL4VbFLd6gSw6kF34Tb2JxpljzSOfmaG8wV7xAjeQEqAOwHsT8TPkX7hAw9mq6iERUMuPzdTQGmQS3Wbd4zIRM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7724
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



On 11-07-2024 11:24, Akshata Jahagirdar wrote:
> On Xe2 the compression has moved to a unified universal model
> (exactly one compression mode/format), where compression is now
> controlled via PAT on per-page basis. This now means KMD can
> decompress freely. This was problematic on DG2 since we had
> multiple compression formats, and the compression format used
> on a particular buffer was unknown to the KMD, so instead the
> raw CCS state needed to be copied around when evicting VRAM.
> In addition mixed VRAM and system memory buffers were not
> supported with compression enabled.
> 
> On Xe2 dGPU compression is still only supported with VRAM,
> however we can now support compression with VRAM and system
> memory buffers, with GPU access being seamless underneath.
> So long as when doing VRAM -> sysmem the KMD does the move
> using compressed -> uncompressed, to decompress it.
> CPU access to such buffers is also possible, under the premise
> that userspace first decompress the corresponding pages being
> accessed. If the pages are already in system memory then KMD would
> have already decompressed them. When restoring such buffers with
> sysmem -> VRAM the KMD can't easily know which pages were originally
> compressed, so we always use uncompressed -> uncompressed here.
> With this it also means we can drop all the raw CCS handling
> on such platforms (including needing to allocate extra CCS storage).
> 
> In order to support this we now need to have two different identity
> mappings for compressed and uncompressed VRAM.
> The additional identity map is the VRAM with compressed pat_index.
> We then select the appropriate mapping during migration/clear.
> 

Have gone through all the patches. Please address indentation and 
checkpatch errors.

With above addressed all patches lgtm.
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

> Akshata Jahagirdar (6):
>    drm/xe/xe2: Introduce identity map for compressed pat for vram
>    drm/xe/migrate: Handle clear ccs logic for xe2 dgfx
>    drm/xe/migrate: Add kunit to test clear functionality
>    drm/xe/xe_migrate: Handle migration logic for xe2+ dgfx
>    drm/xe/migrate: Add kunit to test migration functionality for BMG
>    drm/xe/xe2: Do not run xe_bo_test for xe2+ dgfx
> 
>   drivers/gpu/drm/xe/tests/xe_bo.c           |   6 +
>   drivers/gpu/drm/xe/tests/xe_migrate.c      | 388 +++++++++++++++++++++
>   drivers/gpu/drm/xe/tests/xe_migrate_test.c |   1 +
>   drivers/gpu/drm/xe/tests/xe_migrate_test.h |   1 +
>   drivers/gpu/drm/xe/xe_device.h             |   5 +
>   drivers/gpu/drm/xe/xe_migrate.c            |  66 +++-
>   6 files changed, 449 insertions(+), 18 deletions(-)
> 
