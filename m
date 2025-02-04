Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 371C6C02198
	for <intel-xe@archiver.kernel.org>; Tue,  4 Feb 2025 12:27:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E961810E5FD;
	Tue,  4 Feb 2025 12:27:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PU7mFlp1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D74210E5FD
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Feb 2025 12:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738672036; x=1770208036;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=LdFOyI9Xb1HVfyct8XguIvoOAr5jjZXfjbKTRYTX9Ps=;
 b=PU7mFlp1XuYEZzPh85dMH0i9XW58ypuCx06s4bIZmcuBZ7HpILGoAZvE
 zik87pQ/Payiqo014oXBGls9tlU/nAenttv5KI++zpqGZdGG/8CsoA6xE
 nusxqtrqZKRVzotH6iUf9jVpnHPasFebY6KU0rt2kvG/dQm//cp+wagB9
 JgNtHxUBe7nGEyoKsyLBRh6AQKFY60Sw6sk9OEfXIT6xOzvkmqiWkW4tC
 izTfB6WS0En+xVChaHvJlHAG14e732nKfuTL/W4PhNnePONiB/kmNcqOP
 5RN8hLttQUm64XE0cg2mPCNOxwfnVREDSGoLO6EfScYZaJo3ytAxyJB5L g==;
X-CSE-ConnectionGUID: FekYyLVuSd6rIMvggRaeqg==
X-CSE-MsgGUID: U4dYP2t4QjOXj0Rq4L1QhA==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="39332498"
X-IronPort-AV: E=Sophos;i="6.13,258,1732608000"; d="scan'208";a="39332498"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2025 04:27:16 -0800
X-CSE-ConnectionGUID: BITXJmd/Q6+u46i2mEOS7A==
X-CSE-MsgGUID: aXvWbTn3RqyI/yBMMtMd0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,258,1732608000"; d="scan'208";a="115578901"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Feb 2025 04:27:17 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 4 Feb 2025 04:27:15 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 4 Feb 2025 04:27:15 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 4 Feb 2025 04:27:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KI3B9HjXUKkhsOhUn8U34nvfc51eLejiALeob19ZHcbwBmcqzqN5yMJ07jElEo6ttFwiGskIQtptAAtf2pbqglVfp0cLMHDfBIOJcjatVnIslbO9S1/auO3e7Yoi5XinYLBIog4Ual6KFAxQ5hlfatkZsw4fOzNsRn1McE8G0jsg41bPVbpqspaUrd0Wec+91Mjk/ahaxC2rLH8nMqGeCAuody3jx0mDfly1clHB8AwuCOrO7Wf4vfeYX9nPhB8BagVVi/muMxjEpjtksdXeeuuMX6YJ6Xn8hS9UpwFath+TNrg2vj0cCW9G/eY0a5/uPI3SoDcfSeztPJPseEolHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y9a5b81KChemtdKjdAznTS3KOOgxfGZ+DwktPo3AiPM=;
 b=zA2/SYyQ6CUpTEDaHZiKTa6skdVeAmmwp2WhNXTw5LelPZ66DK2uW1yS4v0slW3DAXwxAOq59VzLoTEn3pkTugA6MO9QmJQwoBqsY7Wg4uG7G9AIOQF/5czRVKh4z/SoIZjsTGWnKmX3AOOuX+PDhfbZSr9ltek7aGKFviucNP8LmxKkluQsdnBg01ZmtASelPqHYqK2qYAcY2v9X4rEWnLcU4DR3ko3yeSZaGY9qZKKy10hQHCEkm2WuN4vk67WJ4bwPRmgNMCXY95HXCIcFkeakSkM9o2Mgq5TlgblP3UmeeVm8UKLkjJFFlDeIVVIwJBeWp8vDQ219nLgISHDtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by IA1PR11MB6417.namprd11.prod.outlook.com (2603:10b6:208:3ab::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.18; Tue, 4 Feb
 2025 12:27:13 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%6]) with mapi id 15.20.8398.021; Tue, 4 Feb 2025
 12:27:13 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, "Michal
 Wajdeczko" <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?=
 <michal.winiarski@intel.com>, Satyanarayana K V P
 <satyanarayana.k.v.p@intel.com>
Subject: [PATCH v3 1/1] drm/xe/pf: Use an explicit check to see if the device
 has LMTT
Date: Tue, 4 Feb 2025 13:26:58 +0100
Message-ID: <20250204122658.813847-2-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250204122658.813847-1-piotr.piorkowski@intel.com>
References: <20250204122658.813847-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MI1P293CA0023.ITAP293.PROD.OUTLOOK.COM (2603:10a6:290:3::9)
 To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|IA1PR11MB6417:EE_
X-MS-Office365-Filtering-Correlation-Id: ba3210a2-57cf-44a6-4ae9-08dd4517410c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bjdQQmV6UlpZUnp2SXlmM1V6Y20vWVVaOWY1RUhZNnNuZm5VKzVydVNMTUY4?=
 =?utf-8?B?aGhSMG1YRUFzb1hpMXJ6UHczb0dWWlNhYUpSUmczTnB2WThzZ3dQTGZBaDlI?=
 =?utf-8?B?eG5iT1oreHYrV0F3RGVUWFVKZnk3VEtmdGpnVEt4VVRLWWEvbDdVZUZBSHJr?=
 =?utf-8?B?RC96ZHhiTUFpYTZ1WnorV253R1pQb2Z0STlVbllBVUFneDBlSTc2Ni83QkRR?=
 =?utf-8?B?TXF3dS9uV0VYRkVwOXFBZ2d5Rm5vbGtLbWhqbDVoZnlGWDVqb3dUaUJld1pi?=
 =?utf-8?B?QmhuMEhra0RsNSthNVBoSUZxK2pmcktRWHQ4eGpwMzN4K3dhTUc5MWVMUzgv?=
 =?utf-8?B?eXRQRUx1RzRVS09henFFOHJVU0Urd3VoR1JGRGxadlhHRVd6WE9nVE96RmhD?=
 =?utf-8?B?bUE3a0d2bXZ3cSsvRzRMNVpoRXRZVnZCNUtQbkw1SHlOQTNmL2dhYlhFQUw0?=
 =?utf-8?B?VDRSdVhYMUxaUGJROU92dVhnc0RWY0RvR0M3ajJRR2JxLzRKZ212SWtMcllC?=
 =?utf-8?B?Q1ViSUpMa0VDaDBUREpwa0Y0d1ptUlNTTzgvUkh3WnNvMGs5OXVZYk9wOXEw?=
 =?utf-8?B?YTkzTitLV1VGUllvSjhuUXQ3SEE1T3ZhTTlhcStlVHdnZ2czUnVlK3lqQ2Nm?=
 =?utf-8?B?b3pIMHJaY1RBdEZrd2JCZEg0d1BIWngwaUJUTVptS0lRdkpLNUNFbS9RQU8v?=
 =?utf-8?B?cnMrYUN3OHNJUFNheHlSeHpiZnV4blNPVlk1ekJxOVFFTnlxVEZyempiam5o?=
 =?utf-8?B?NElYbVROYWt1UVFZRm42U291ZnRsdkRQaHlmQXZrUXI4SzFwNzc1Y1A0bmQr?=
 =?utf-8?B?MEFhR0s5U3ZqemlXTStEcVhnd2h1ZCtFUXozMW5sbHNxRWdJeStmeTduOEZm?=
 =?utf-8?B?MkdrT3N5aHN5cWhZWkhjdGR2Z1VOeE9DUDE0eFIyUzhJb1FzN2VIU3lFRC91?=
 =?utf-8?B?L3ZBMlFjRC9GMHhYMTdWKzJKQWErK1JCQTF5dm9QSnhmTGdoeXM1alJUUmlo?=
 =?utf-8?B?MlZ2czJwcUNGVVdLdCtTOFQ2VTBnc0xBc3JBY2VmZStNbjhseWhibjFiT1NQ?=
 =?utf-8?B?VG5yTFEyemRJVC92OHFGZVJuU3hHOU8zWU5pY0wyUEJXN3Z5K3cwV2RoNkZF?=
 =?utf-8?B?THR0SGhGeHFRWGZZZHUvdUpNdW13aGhaN0p5WllGTlpVMlhhMENWaWVVRHo5?=
 =?utf-8?B?UTZKTkFrb0VrdDU3QUtDUk54cmd6MEl4Vko1MTJjTUNQaWxkSERlV203WmxE?=
 =?utf-8?B?UzhINUJNdnNnazg3RHJYVE1RU09GWEhsb1NLbkh0Wi93NDFyNk9rVmpRL21l?=
 =?utf-8?B?QWRIanpuZDhvUGYrTVBpY3RpNmZHeDdQdFNIeUdnLzBlZVFPaWZBcFBSR2pn?=
 =?utf-8?B?OUdnSHpId3pFNGxlbmpBemxJOVRLWWtTZUZGQnBXR25ZWERocU0xdUZ5eFpz?=
 =?utf-8?B?eCtqQ0FEMTBCM3YxRk9MSnJXVnY1S3FNR2o4ajZ5R1Q3RS95eSsvMm5IN0RU?=
 =?utf-8?B?OXRBU254VlNycXRFbFhVZVZ2VDRYdFhiYzZHRWZQYTNQdkYvZGxTSysreHhy?=
 =?utf-8?B?Tkl3c2wxR3ozRGNUSXRyZVVLNEFqTmFwbkpmRklrYTFNZ2paUEc5S0NGbUxq?=
 =?utf-8?B?aDFuTncyYTBRblY5Uk9naWhKQS96R1JhNTdnOHZrV002ZTZTbERFZDQ1a0Rl?=
 =?utf-8?B?ZDRycXNyb2xFcGRsZlJJL1A1QUwzeEVUVzBhYXJnOUtsbGlzZDhtem83N1Mx?=
 =?utf-8?B?Y1QvVTgva3pSSnIxZzJFM3pxQUMwc29ydjFEMk5tdFlScXowdmpWaEdjUzJK?=
 =?utf-8?B?UzNOcHE3dmpGNDhWMWtmSThKNGtCa1djR2haOXVTbytmV1IyRDB1QXRPTkhw?=
 =?utf-8?Q?B7x+QtaASZ6uv?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L1hCOWZIZHBTWmVOUFBtT25BMzlKcWNUMHowRWFsT3dDWXljT1Roc3JoQVR5?=
 =?utf-8?B?Q1NCUThqbG1sdjA0YnNQdHhHTitwZCt6eDVHMS9tSFdkSzNOazFEQXRRRU1P?=
 =?utf-8?B?RVl2ajIvSFB0cUtvWUhQL0tGOEYyTkhUOEhLWVRZVmMxMkN5TG5mdTg2Mmw1?=
 =?utf-8?B?N0h3R05JNWFWbWpDQkUwZUtIRzJFSEtJQ0Q0cTBQbEVxbXNaRVF1N0x2WWVW?=
 =?utf-8?B?NExhMmI1TGU2TVZqL0JKWGhDdGRXWi9MRklsWUJvUmlqRVVBTVJ6anlqWDRY?=
 =?utf-8?B?UnF2bzFpQkw2QWdHUExMU3ZjRFU5VmdCVU5UOFJWYmVpWWhHM29RWVJvV2dt?=
 =?utf-8?B?SVdDQ0JLcXJ1SG5VQTZwT2U3ejQ1cUZ3M1dBSGhNMlFibVpybEhmZ0x2L0xi?=
 =?utf-8?B?WkI4ZGNjbVE5MzRmY2FFeFA3WnlEOFZkYlBhU2xuejBJdmp2S3ZEU1Ftdys4?=
 =?utf-8?B?cWRkNTB0TkhyMDFGTjhETmVZeTEzQWhZaExsN1NKKzFoTHpzR2Vmejc4aWJW?=
 =?utf-8?B?em5HWkl4MHh3d3hKc3o4R0NyTnhFODZ6VThBUGpNQ2RnN2EweExqKzMweEhP?=
 =?utf-8?B?MHNqbFFSeW43Q05KS0N3UEI5cnpoaXhGQ0Rwdm5mekc3ZWNaT0ticUJwbGxD?=
 =?utf-8?B?R3NpTlJYUWpOM0trbkxDTll4NEZCcnRoYkZnMG9LUEVIRUs5Z21mdFRKOHRV?=
 =?utf-8?B?aVFiSVBRWVpjRjg4L29ldDJhcnFVTkdUdjJ0dS90SUwycTFybGlWS0hWMmla?=
 =?utf-8?B?bk16bHF4WHBnQ3BiQisvTGpFRXpzdTJhenRUTitNRHE1L1BESWR6YkJMUWpE?=
 =?utf-8?B?WmhhdlJ0ZUYzWE5tZWozOFRpdjk5REc5bkh4V3BFT0R0TGh4Rjl2cWJUL3Q0?=
 =?utf-8?B?elVYd3d2WDVEVW9aRFJjZUZJMDRWOGc4eDBlZy9EaTFrWGV2ZUJXd01hK3U4?=
 =?utf-8?B?M3VNNGV0eXZ3V0NtU0xxb2dyOUhuZ3RjUG14dkZhcTlhQ3EwVkR0RjZ2bmNJ?=
 =?utf-8?B?SE9mYkRGL205MEs1aHp2WmZsV04wbjZzWHNmVEZRTjlDczlRZ2x5YTExZEFN?=
 =?utf-8?B?TmRxVGVXVURpbFZzZG14cWp1dXgyOUhIY3BYK1JpYTNiSkM5YzY2bEtXdmJz?=
 =?utf-8?B?Ni8wU3E1cmZZaDBPelF5RkNxV0szd1dmRitDTFV6WmkySEQ0MzM2TlRnS0Zq?=
 =?utf-8?B?MXg4YmNWSmJCc2YzMHVUd0xVMVcweXlxZXcvbmp2TEJOZXlKQjNvUDBlOVoz?=
 =?utf-8?B?RG4zM2JZZUFyMzR0UThXOUhmQlVHejgrK2pCbTdkb29EU1NjNEFtQkZhRkI2?=
 =?utf-8?B?VXVheUFTQ29ZbUFmblk0TFdmbmRGNHA4aks2NndvN3gyKytzUHhGNGN4dDhR?=
 =?utf-8?B?SDU5RDludGJaaHdhbzZ4akJGbWhFYy9HODhwSnpBR2N0a3o0VWlrSUdaemRu?=
 =?utf-8?B?YmNibTlta1picnhRaVJadGEzazJCQzNOTU4zWGZuaWFJT3FIdVVTLzhVZkRw?=
 =?utf-8?B?QUU0YkpleGIxUGFIb01FR2lmeDR2VDVhR29uQjVMZ0E2b3hWWncrWldFQmQ3?=
 =?utf-8?B?enpnT0tCRHZYQm9mdHFRdUtNUFlwRC94NkJlZERJdmc2TW5BaWxmNlVubjJJ?=
 =?utf-8?B?MFdNRGpzbjRTQnY0eGQrWHFrenF1emtwU2VKMnM1bVhvZC9HUmE1NDFpK1BT?=
 =?utf-8?B?OHI5V09JSWRDdktyQzB2SmhUMkwwcUora0hrL2xYdzFMVXpCK3VTY2NpODNR?=
 =?utf-8?B?UUs0b09YbURzQkcrRlhXNGl2MEk1S2ExYTNmSHZkRXE3VmNDK0I2K3ZVOTB4?=
 =?utf-8?B?TERoa2F4UUVIT0xSVXYwR3FYV3g4U1EvUnBKZlpCTHdhNUZxTWhPVnIrSkdq?=
 =?utf-8?B?ZmkxU2g1QU1CUXhKOW5VOG9GZUtkVmlnRUFScHQ5enEyakJCSEQ4dTA3aG0w?=
 =?utf-8?B?byszWVFvMC9PSGR2MG1lZTdjK2d3Ymh2TTh1TXhXeHE5TmI3ZEFjYzdqdXFK?=
 =?utf-8?B?TXBGOGt4STdoZVFkaFpob3gwMUhNQ1pnS21UOXF1b0hSbThJemtZVFZGd1lG?=
 =?utf-8?B?em9OcWdscG1XSVVEbE9XN3h2ZlBmSFRXRHFCZzRwSVptSzBtWHg1ck9TenlB?=
 =?utf-8?B?ZUZWODJVSWRaSnArVXlDb0x1Z1hsMEdaOGN2SXJGcWFvNDRrNDJPZzdVbUVK?=
 =?utf-8?B?ZlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ba3210a2-57cf-44a6-4ae9-08dd4517410c
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2025 12:27:13.5223 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tSiow8v+kJE72YTvGchzgsRcBnjA22NgeWxlQ6VS5j3UnqMasDOg1lFkdBFjjJaSq4pGmucJiN4CyKrCgIMf7ftUlV0Dy6gm+AYCfLeOkg0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6417
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

From: Piotr Piórkowski <piotr.piorkowski@intel.com>

So far, the main condition for using LMTT has been to check that
the device is a discrete gfx. In addition, we have checked, using
assertions, that the device is PF.
Instead, let's add a dedicated function to check if the device
supports LMTT.

v2:
 - use xe_has_device_lmtt only when necessary - leave IS_DGFX for other
   things related to LMEM provisioning
v3:
 - remove IS_SRIOV_PF condition from xe_device_has_lmtt (Michal
   Wajdeczko)
 - keep IS_SRIOV_PF asserts in LMTT-related code (Michal Wajdeczko)

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Michał Winiarski <michal.winiarski@intel.com>
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>

---
 drivers/gpu/drm/xe/xe_device.h             |  5 +++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 21 +++++++++++++--------
 drivers/gpu/drm/xe/xe_lmtt.c               |  4 ++--
 3 files changed, 20 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index fc3c2af3fb7f..0bc3bc8e6803 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -170,6 +170,11 @@ static inline bool xe_device_uses_memirq(struct xe_device *xe)
 	return xe_device_has_memirq(xe) && (IS_SRIOV_VF(xe) || xe_device_has_msix(xe));
 }
 
+static inline bool xe_device_has_lmtt(struct xe_device *xe)
+{
+	return IS_DGFX(xe);
+}
+
 u32 xe_device_ccs_bytes(struct xe_device *xe, u64 size);
 
 void xe_device_snapshot_print(struct xe_device *xe, struct drm_printer *p);
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index b1d994d65589..5c3e9e5bd051 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -1336,7 +1336,7 @@ static void pf_reset_vf_lmtt(struct xe_device *xe, unsigned int vfid)
 	struct xe_tile *tile;
 	unsigned int tid;
 
-	xe_assert(xe, IS_DGFX(xe));
+	xe_assert(xe, xe_device_has_lmtt(xe));
 	xe_assert(xe, IS_SRIOV_PF(xe));
 
 	for_each_tile(tile, xe, tid) {
@@ -1357,7 +1357,7 @@ static int pf_update_vf_lmtt(struct xe_device *xe, unsigned int vfid)
 	unsigned int tid;
 	int err;
 
-	xe_assert(xe, IS_DGFX(xe));
+	xe_assert(xe, xe_device_has_lmtt(xe));
 	xe_assert(xe, IS_SRIOV_PF(xe));
 
 	total = 0;
@@ -1434,7 +1434,8 @@ static int pf_provision_vf_lmem(struct xe_gt *gt, unsigned int vfid, u64 size)
 		if (unlikely(err))
 			return err;
 
-		pf_reset_vf_lmtt(xe, vfid);
+		if (xe_device_has_lmtt(xe))
+			pf_reset_vf_lmtt(xe, vfid);
 		pf_release_vf_config_lmem(gt, config);
 	}
 	xe_gt_assert(gt, !config->lmem_obj);
@@ -1454,9 +1455,11 @@ static int pf_provision_vf_lmem(struct xe_gt *gt, unsigned int vfid, u64 size)
 
 	config->lmem_obj = bo;
 
-	err = pf_update_vf_lmtt(xe, vfid);
-	if (unlikely(err))
-		goto release;
+	if (xe_device_has_lmtt(xe)) {
+		err = pf_update_vf_lmtt(xe, vfid);
+		if (unlikely(err))
+			goto release;
+	}
 
 	err = pf_push_vf_cfg_lmem(gt, vfid, bo->size);
 	if (unlikely(err))
@@ -1467,7 +1470,8 @@ static int pf_provision_vf_lmem(struct xe_gt *gt, unsigned int vfid, u64 size)
 	return 0;
 
 reset_lmtt:
-	pf_reset_vf_lmtt(xe, vfid);
+	if (xe_device_has_lmtt(xe))
+		pf_reset_vf_lmtt(xe, vfid);
 release:
 	pf_release_vf_config_lmem(gt, config);
 	return err;
@@ -1981,7 +1985,8 @@ static void pf_release_vf_config(struct xe_gt *gt, unsigned int vfid)
 		pf_release_vf_config_ggtt(gt, config);
 		if (IS_DGFX(xe)) {
 			pf_release_vf_config_lmem(gt, config);
-			pf_update_vf_lmtt(xe, vfid);
+			if (xe_device_has_lmtt(xe))
+				pf_update_vf_lmtt(xe, vfid);
 		}
 	}
 	pf_release_config_ctxs(gt, config);
diff --git a/drivers/gpu/drm/xe/xe_lmtt.c b/drivers/gpu/drm/xe/xe_lmtt.c
index a60ceae4c6dd..89393dcb53d9 100644
--- a/drivers/gpu/drm/xe/xe_lmtt.c
+++ b/drivers/gpu/drm/xe/xe_lmtt.c
@@ -164,7 +164,7 @@ int xe_lmtt_init(struct xe_lmtt *lmtt)
 	lmtt_assert(lmtt, IS_SRIOV_PF(xe));
 	lmtt_assert(lmtt, !lmtt->ops);
 
-	if (!IS_DGFX(xe))
+	if (!xe_device_has_lmtt(xe))
 		return 0;
 
 	if (xe_has_multi_level_lmtt(xe))
@@ -486,7 +486,7 @@ u64 xe_lmtt_estimate_pt_size(struct xe_lmtt *lmtt, u64 size)
 	u64 pt_size;
 
 	lmtt_assert(lmtt, IS_SRIOV_PF(lmtt_to_xe(lmtt)));
-	lmtt_assert(lmtt, IS_DGFX(lmtt_to_xe(lmtt)));
+	lmtt_assert(lmtt, xe_device_has_lmtt(lmtt_to_xe(lmtt)));
 	lmtt_assert(lmtt, lmtt->ops);
 
 	pt_size = PAGE_ALIGN(lmtt->ops->lmtt_pte_size(level) *
-- 
2.34.1

