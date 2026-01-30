Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4D82E6BF17
	for <intel-xe@archiver.kernel.org>; Fri, 30 Jan 2026 14:33:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 638AE10EA03;
	Fri, 30 Jan 2026 14:33:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c7us4hR+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81B3410EA03
 for <intel-xe@lists.freedesktop.org>; Fri, 30 Jan 2026 14:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769783593; x=1801319593;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=fI6kwFYpeBPZEd5ibWz/pEh/Z+IwVgVLOojX8GWXEi8=;
 b=c7us4hR+iIFi8N5/I1uTt8fx92jWBR5p/hwSy/5SJI0kjg5JyQM6KmpL
 9NcEfqjqAMnFeQAYzuHdRnj2+wbIbO3ZFygVxPfrAgVvIbbLwKeA9iPds
 2oXDm5fRz+kXStkKEMbEEqfGT+ZkX+0QuHqm7WVhGPV5n75yfcjVtjDog
 TZqyQ4r/x0h69pdIHdR7/47j8MAhEhu0hN4y13iLN6tifh22ywPlrmxl/
 QtZskU+/3ic0xaJnQAhsWSTTajy1G0/ciRLw1FO0CqXzKCc+C4QvJBGQx
 BPT7IUFedbt3e7vHyPE6IxwG2jZYUZ8DCZ7y4JEtgItS2UO4JR4aqTL0k g==;
X-CSE-ConnectionGUID: GOcl2HtVRD+/y54FJA2hng==
X-CSE-MsgGUID: 6wRJabNFR/Gi6VycNqWAaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="70052354"
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; d="scan'208";a="70052354"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 06:33:12 -0800
X-CSE-ConnectionGUID: +q+seDWyS5qxnm+NDbCMlA==
X-CSE-MsgGUID: TQ5Cg+sfQEm4IIx6h73GyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; d="scan'208";a="213811760"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 06:33:12 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 30 Jan 2026 06:33:07 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Fri, 30 Jan 2026 06:33:07 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.10) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 30 Jan 2026 06:33:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZldK4G8+Qy6XN8n7EFErXAIieJW6R0CVdrx7YKOyO3yxJTKl4KyIpjvyKG1Cw40JVTA32j7wbnwCevrcTc6xDKhVnFIJmVF4iCX9+9SZorJYMSIa6oMvt/Yg+nfPTIcNa7GFeATIuM0ovDq+VengZAmRrTf4V7NtNdPhbq5yXp7aWzYzpgkebHfl5XcwrqvM3IU0OKxudgW0UT5U2RemXufWvKwp94duhPYfzSPyd58IVlHOSkGlrzOSw7VLeOeVZG2s+GkCBokRwRTNnnTXcTsngxQgSl+A5Lx+pt5W4sUPYZtIydGeWJQRY1VKirYXFbJAS1HQjNEaFFXue1tEvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L1lqJxuJTmj0Qa8Q8xy+zw0RUVt1zm/+fjxf/KV6qpk=;
 b=cLLCSvRHYVuYciIbQMAOrmKgeEZw4j+XMVX1ZGx4XuKfSUNekvGuHef1WaCSzYb4g2gfI4LalzBTSwMPrHZyadWkfLDCLFTkx6f12OFOxcsnZskT0SYBNDdKhdI5F61AdBmFGK91DCADB/Y89empHkAaUIaBkt+ICCR7WzdOFBWxA4I6We/X2ioEXokcPkw5iuEp43LVUjTMYj3BwwEb5hTgN4zpZrAGxVOfqpcqDt9+oMcBg775uDp6EyVGfolufnaFHELlo68jW4bPYV3eli8TsYinhSrHsKxVcp7Kk8CSJEsn9Lt1cAQrIHkzB6QNOeQr3KY2ASk+bte1/OKuNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7164.namprd11.prod.outlook.com (2603:10b6:303:212::6)
 by PH8PR11MB7965.namprd11.prod.outlook.com (2603:10b6:510:25c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.8; Fri, 30 Jan
 2026 14:33:04 +0000
Received: from MW4PR11MB7164.namprd11.prod.outlook.com
 ([fe80::c9ac:7bd4:84c8:a7f1]) by MW4PR11MB7164.namprd11.prod.outlook.com
 ([fe80::c9ac:7bd4:84c8:a7f1%6]) with mapi id 15.20.9564.010; Fri, 30 Jan 2026
 14:33:04 +0000
Message-ID: <f40a35bc-1db8-4631-9929-87bff4372dda@intel.com>
Date: Fri, 30 Jan 2026 20:02:57 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] drm/xe: Fix Prevent VFs from exposing the CCS mode
 sysfs file
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>, Matthew Brost <matthew.brost@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20251128171759.2775650-4-naresh.kumar.g@intel.com>
 <20260129172246.1106097-4-naresh.kumar.g@intel.com>
 <20260129172246.1106097-5-naresh.kumar.g@intel.com>
 <fc0f819c-0712-4b27-8cb2-38462cfc7381@intel.com>
Content-Language: en-US
From: "Kumar G, Naresh" <naresh.kumar.g@intel.com>
In-Reply-To: <fc0f819c-0712-4b27-8cb2-38462cfc7381@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0153.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::23) To MW4PR11MB7164.namprd11.prod.outlook.com
 (2603:10b6:303:212::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7164:EE_|PH8PR11MB7965:EE_
X-MS-Office365-Filtering-Correlation-Id: fd384199-499d-4052-aa9a-08de600c7a67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ekpGT0xIbGRUaFJHVHprN2NqVnF1QW9FZFhQQk5CdzYzSmU1dEJ1eThibEFq?=
 =?utf-8?B?UkdMR1VLZnk5ZEhHWllsQVNvYlhKUkcrZ1BrVHJMS0JZRkVLdHVaSHNVcExo?=
 =?utf-8?B?Z040ZllYcVZaZ1BuT0UyS1lBaGxjbms4MVBVZUVyM1FEWStNYTJxTmUyMG9W?=
 =?utf-8?B?M0pRZHVNUTNkS1YzWDFRODhOV0xLYjAyTzZCQ0Jsajk3WlJuRnU1bFRDTmFh?=
 =?utf-8?B?OFVnckxHNWV1NVhJTHR1Sytha3NKNFVkU212RG1LeGZvVmpNUkE4aVp4N0di?=
 =?utf-8?B?bllKanQrdkJFcXV3WEpYVUVmYjUzRHFpK2pNUm5kdVUrY1ZRanVxb3MxZXcx?=
 =?utf-8?B?dU5yV2tMTnQ0U1liWmhWZ05hdmZMWG0vczRDN3pWMjczVlBYMStNaDdVbld1?=
 =?utf-8?B?dTJ0c1JZRGhBM3kvRmFGZTd2U3F5ajByaS9QcDk2MGsxaXhnK3psNTVyUnMx?=
 =?utf-8?B?VEdFQkJ4NGVzYzdhbTQ1L3M0SnpDS0R3REt2ZU5nTFk3MDhKTGtXcEFVNDRw?=
 =?utf-8?B?TktUeW5ZMTJ1b1A4QlYyWGZrbkdOcExEWUlpckcrSzYrMU1xSHBjYWZNYWgr?=
 =?utf-8?B?cUVHbEgyYXZ1WXpMRm9pOUVFMTA4MXB1R3VqQUhaanMrVkFMckxEZE1qM1NV?=
 =?utf-8?B?elVMcHYxdzZtbzNXTHYyRnlnM2JRKzhzL24vRWFBUmVXNk9SeEc5eXVIQnZJ?=
 =?utf-8?B?VTNWc1BlLzBvNVBSc2ZLUEV6c3BFd2tNL1IzZ3F5dHp5cklRaTRSRjJoQ1ZX?=
 =?utf-8?B?UFpMZDFyTFdFR1JOYkRnbE15dEtUOEtYdlAraEhqR21oLzIrT3FUSUJCZHNC?=
 =?utf-8?B?UkF3V0RpVjVLNDFDbmhEK2l0TExLY3hqTjJ5aTdWVEFCVDRRRW9YbjY0eTFk?=
 =?utf-8?B?Q1ErRVlJRWRYZ2xmL2xHYzFJMDRQdGpkNjZpU2NwWkpwYXFzR3UzRU5Pc1Rs?=
 =?utf-8?B?N3FJbVM2VGhMUDZVbHhrWEViR0V6TXhEMUVIcUdZVmwyNWo2djM4bmZiS2RV?=
 =?utf-8?B?STY1dU1sNXhDRnc1c1ZPMTZVVEgwVjdnaitiOVk2ckZLMENQTjFmM3BEY0lK?=
 =?utf-8?B?MDR2Y1A2dkg5ZnRtd2RvQTFnMHNYSFdTTGFnVnVGSVJCRmZJaFEwTE9FWlFR?=
 =?utf-8?B?RWthVXVTWDlNdDQxTWVqQWFCMU1QOUtpMGlXRXEyeHNrb0J4dEtKWUNDTSsy?=
 =?utf-8?B?clQyRWFsdzJ5NnAyYnYyaWZuYVV2Q0NqeEFLY1MrdWhrY1Y2Y0tLRXA5a2Va?=
 =?utf-8?B?SDg4bHl3dm50eVdFbkNKSnc3cGdFUXFCc2hSQUIxY3g3VHk1TnJrZkVmbDI1?=
 =?utf-8?B?bkRaUE5BVVJPeUNOUVMvWVpudFY5ZVArWkVDd2RYTzVZVTdGb3VLb3BQVnF6?=
 =?utf-8?B?Wmh1blNiaWtLY3NaTExqQWVTUzZzd3pUYVlQc3R4TjBsNnpsZUJhcE93RW1L?=
 =?utf-8?B?RnJlQ2pnYSsvT0x5dXRTQXJsUjdvQ3dySEJXanNLQlFWMHdINExpVjZ4Y0FX?=
 =?utf-8?B?bzh6ZkxyeWxrNkdENk9jdlVtQ2xjemREendFS3pBYWE3T1c1aitCdnh5Vkd2?=
 =?utf-8?B?NkRIUVprZFRNbEtrb3RMYXI4RjZkTElOVUhPOHBXT0dMdm1NQkVtOHhlZmNK?=
 =?utf-8?B?Sjd1TGhWTWdqQ3B0a0sxZ1BBKzRkMGtNRkRvdVRxVEF2cC9GcFVVY0w5Wnh5?=
 =?utf-8?B?ZnFBTjZtUExwMEJDSnl3RTk4TnU5VEhDNmFzcnltMkRaNUo0cXBUTWhveExm?=
 =?utf-8?B?djVZU0prVWJaNms5dmw5bG40MTRyYlN6VWJBaVNFQnpJWTVxR2xLZGFDVWFr?=
 =?utf-8?B?TjlYTHNjQzdnTy9aTjNPNjhyS0NYaWVsaFI0OHY2T0pvTm16VkxNZUJnaEtL?=
 =?utf-8?B?YmFyQWNVYlliU1pBN0g5UVFINGUwSVNLcWtlcHJidm5YTFhsZWhES0VsVFJo?=
 =?utf-8?B?V1o1VzB3RGtoMnhpWE5YS054WlB2MS9iNHpLUDkvckk4akFEK0xCQ01TZFE4?=
 =?utf-8?B?dlZiZ01tMmNwREhaSnFjaHhjcEl5dEt1b3NxdSs3VnFJandYdjI4elhEYnFi?=
 =?utf-8?B?VTdMcFRNVm11SmJEb2FBK2Q4RjZQS04wQmhkMmlSY2J0SG12Zlo1N0V3UFdN?=
 =?utf-8?Q?YylY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7164.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R0ZWRXNnOXNUMEYwNDZWbENJcmVGZXA5aFVneFFuQ3hHeHhKQm03b3BXd045?=
 =?utf-8?B?a2pwSWFGcVF6TW5ETXhnRHdiS0g1TGRBTG8waFNtSHk5MGljRnpqdDJJR3lP?=
 =?utf-8?B?YU8vMTJ3QVhJVitaTmZDQVdzMDZHekJBSE9UcFBId2owcVJXL3ZoZTVETFZX?=
 =?utf-8?B?Uk1OMHF0SEN1UGJ0dDJOcDk4bGdyUnhMa25ZMjFpSUVQMVZId1d4Mjd2em5z?=
 =?utf-8?B?dk1uZWlvVnNXZXBRMVRJei80b1ZiK0dIY3d1TGMvaUNtWUN4dEtiVHQ1NFox?=
 =?utf-8?B?Q2RlWlNTTlMwbEZtanEzVVFUd2d6MkUxalNsU1ExMVdCT25vNXFUQlhwenh0?=
 =?utf-8?B?Y2haTG5VTXhvWXp4c2NjMFlNeE8rT1VkaWVNd1RQNCtxRmMyRy9NMTlLYy9B?=
 =?utf-8?B?NTVzNGtsWXlWdUZPaFlYNnM5YlJhd2hZWG1RS0pId1JSZW5uMnlVd3JLVGZW?=
 =?utf-8?B?Smt3Qmo4M0JMRkplTi9GVjhKSzY1M09DUS91aHI1KzZjdmV4UEttTDNBYXJG?=
 =?utf-8?B?YVpMTHZnMmNlQUNxS2FPcHp3TlNtWUJncmpVVmhDS014REhQSEtBMDFBb1Jj?=
 =?utf-8?B?dFZPR0UvMmhaTEE0UllJWE1udkVyN0RGRkpzM1Nkc2Q1N3hVKzdlK3hFS1Fo?=
 =?utf-8?B?VzUvWU5jYXZmV0RVMlJYejdvMTg2VkdqU3BGcjR6UThuaG9GQXJkUVR6REVj?=
 =?utf-8?B?K3FpK2lmUDFyOHlZOFM3RjdHc3RBSkJCQ0RZQmsvcmJGYi81NWd4eTlZUUxP?=
 =?utf-8?B?T0kyOFFPUE5WWVJmQldZb01rSEFSY1BiMWxjaVBPT3UvWTF3SFI1SG14Y1BY?=
 =?utf-8?B?MU8rcXM5NkVaMmVORTFUR1VoTUgzOGx0R2Z6VWxTeXpzVWVIS2NaYlNRTDM3?=
 =?utf-8?B?RnFNZUh6c1YvS2pObzFKTW9NNmFTLy9rNzZFam5sQVRiY2JISS9PNkJldkF4?=
 =?utf-8?B?ZVVNSlVJUkZ2c2pwajJnbDNrQVFOTHFURi9xVnMrUzZ2Z0tENmxGbnRaRzVF?=
 =?utf-8?B?TDNoRmFTaWpVMDJPMUl5UmJQV0gwR1luOEhGWkxES2NiUjlCaDI5a1owMGww?=
 =?utf-8?B?a1gzVVB6NnVwSkk4bi91VndFMkpDZnZKTENSTVk5QXF2NWYzbnFNd0ZScVY0?=
 =?utf-8?B?dGRaaGdmd21sUmh5eUF1UVp1bmR5WS8zTzE4OGc1VGdRN2tvTFNXUHY3dW9X?=
 =?utf-8?B?QkM5OEJmOHI5emxGTXhBWVhIdVk2UzVibW56ODhCaWFkS3J2MFBtU3A3bEp1?=
 =?utf-8?B?VUhtQm9JM2l1c3pZNEdrRTVKeWtrT2JYOFk1c3VCdjVqWVM5TVRvU21jZFJN?=
 =?utf-8?B?TFVYN3FWNjFZTnlMNHZibmhPaVM0TmFhUk4wWU9pSmEwd21seFRSWmR2SzR5?=
 =?utf-8?B?WGpWZTQ4a1Z6c1hoRTZPZ1lDazZlbzBKSVVYcnBCM0VHTXU3MXlTVDNVc0p3?=
 =?utf-8?B?b2ZVZVZEMnhpRFovVitWaU5IR2cxcVl4T3ROZThwQXhoSW5ScGF4MElQYm83?=
 =?utf-8?B?OEJ0SlpJZVNZUVBRaWVwZFdhZnd3SVdoa2tabnFrR28xYnltb1BueHpvR004?=
 =?utf-8?B?NmJqQTdZWTczVTNlTWZLMmVzVVJtUlljeE5jZGh5RGJrK1BaT3lrZkFmQndP?=
 =?utf-8?B?MmpTZXpBTVpvWEdML2F4NEp1UWsvVU1ya01qNXpnWnQ3RnVxRDF4RHh3YXpx?=
 =?utf-8?B?RjhDS2Y3b1lKUHJDWER1YzNsTkY0QVpveXBKU3p4dy9pdkVZSTA5V0NlOVRy?=
 =?utf-8?B?ZDVQeWdkZUkvZE9TZnFlQ21TNU1aQVlXUm9wSEhXazdhTldhdlNubFpXaGVS?=
 =?utf-8?B?UWdqaVdPRC9Vd0h6Zmo4UW5UdGFOVnMwYktBdjZhZks3R0Rha3ZodVcvNmdv?=
 =?utf-8?B?UTRkTWZrbExVcVllVi8rVE1YVGVhMUduRnRQRHFMREhKdFdUc0M4UGpwT0c4?=
 =?utf-8?B?VzV3UVBEWDVWU1h4SHdxZmYwQmdqbllBZFVDa21VcUpxZjBzRmpHK3pUbVZl?=
 =?utf-8?B?MHJTc2ttd0FZdFhVL1NkYTdyV2Rad05YUVZuaEFBdXJwVVlzUUxWT2hmWEo1?=
 =?utf-8?B?dDlRU1doSG5DaGNJVlNqdkEzZm5vSFRkZmpGZ1F5V3RVaFFIVDlDMSs1R3Qx?=
 =?utf-8?B?NEtzOEpGekl0VW0waUdabFh0MWljdVVXZ21GdHZ4bXBUbkZUWmhWVE1MMGJs?=
 =?utf-8?B?K2VIOW9rTnNmSGxQdnp1RTZBcU1aMlNZRTk1UzFleXhKZEFLM3Y5KzgxRm16?=
 =?utf-8?B?UTdEc0lPQ2JNc1BPaHJDTmNZb2F4akNidkYxUm9rYzd2OEUxRzBFclJacTd2?=
 =?utf-8?B?cHg3NDMyRFpEa25hdEpmOWZkSW10MWpMZEw4Vy9DdXpxeFRseHprZz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fd384199-499d-4052-aa9a-08de600c7a67
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7164.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 14:33:04.6018 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WKd072VI9VSxgkRTcycJzvGskctAhNld/ge9TzH6KjXynGPIsKgLBSSOvyR4zC7U28TuzrqStP2oerTJfD+pOhovwZgdTPbM05eoNbfyui4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7965
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

Hi Michal,

please find inlined comments,

On 30-01-2026 02:43, Michal Wajdeczko wrote:
> 
> 
> On 1/29/2026 6:22 PM, Nareshkumar Gollakoti wrote:
>> Skipping creation of sysfs file in VF Mode to ensure VFs do not expose
>> CCS mode changes
>>
>> Fixes: f3bc5bb4d53d2 ("drm/xe: Allow userspace to configure CCS mode")
> 
> shouldn't this be
> 
> Fixes: 97fedf015cd9 ("drm/xe: Use fixed CCS mode when running in SR-IOV mode")
> 
> or since it wasn't really broken, maybe we need no Fixes tag at all?
> 
> adding maintainers to confirm
> 

As we discussed on call, will remove Fixes tag as logic not really broken.

Thanks,
Naresh

>> Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_gt_ccs_mode.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
>> index 50fffc9ebf62..e146e00b0ca2 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
>> @@ -191,7 +191,7 @@ int xe_gt_ccs_mode_sysfs_init(struct xe_gt *gt)
>>   	struct xe_device *xe = gt_to_xe(gt);
>>   	int err;
>>   
>> -	if (!xe_gt_ccs_mode_enabled(gt))
>> +	if (!xe_gt_ccs_mode_enabled(gt) || IS_SRIOV_VF(xe))
>>   		return 0;
> 
> I guess there should be no users on VFs that would like to read it back
> (as CCS mode was/is always fixed/const for VFs), so this fine,
> 
> Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> 
>>   
>>   	err = sysfs_create_files(gt->sysfs, gt_ccs_mode_attrs);
> 

