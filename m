Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4713C2BD09
	for <intel-xe@archiver.kernel.org>; Fri, 28 Jun 2024 19:28:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6005010ED1D;
	Fri, 28 Jun 2024 19:28:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lDRoPOg4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62DA910ED1D
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Jun 2024 19:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719602887; x=1751138887;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=f+qg8RB+QaXAcqGUv7uB3oThY6BFlNDcC8Mfd1tnrsc=;
 b=lDRoPOg45DP2fWjAD5W6vzR0UbqQXRI5XK7+Mw2O46fEvx7BEzJgohf3
 cdfxAM51ZRyGRa87IXjvINOozc6Fc0Wv9gp/qtgyrmtI0v6H5CdUm+Uvc
 MXdhOSIGAuwO7usmcTT33evhh6RJ2fLiOZLTQaXM6h5ixFpm7VDgF6361
 MynSPY0sO4ihJDGvaNznUqXT/XrRAObmcYFkY+tEIRVc1NIxocA+6FG7h
 miR+zSEcJtybO35CrZgjcykaFLaL0+6s2O+bolu6q+VEzzUzhKJXHPyPE
 jTAwsFWIo/GkuRVwvnJXi0dx9A1sH9srtLVlp7QZzWheiKWRLSxkMg2T5 w==;
X-CSE-ConnectionGUID: pvkhrA+qTyC9/hW6MrAAhg==
X-CSE-MsgGUID: lLIlcpCKSUa9CbLR3rkBEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11117"; a="27930916"
X-IronPort-AV: E=Sophos;i="6.09,170,1716274800"; d="scan'208";a="27930916"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2024 12:28:07 -0700
X-CSE-ConnectionGUID: TZoB3BRqTLitDjf5vcK7ew==
X-CSE-MsgGUID: EauJhj8lSVePtBgXZnf/eA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,170,1716274800"; d="scan'208";a="45253677"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Jun 2024 12:28:07 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 28 Jun 2024 12:28:06 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 28 Jun 2024 12:28:06 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 28 Jun 2024 12:28:06 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.172)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 28 Jun 2024 12:28:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=njH0cRqB6LOIC1eruE1C7aHt/p92//ux3yUyywrYJm0vVZjxIjU9JkW+RCzqfI2DO/Qi8FuEQgKiCwTwskCnRYKGAkU9MwGTaqw8KFh+NhB9xmruL1ksFRQbeqZL9vZaoPbX/PvAbweV1f2gNsXxT4N22qzEpu+zhNUwkhDze4quBUL3JJHmOBM0kjLIUR+Ko78FIHsXqjCtruU1o9AqZtFAmcFdDpJaXQW1SW75XabVGp2BT6IXQuy/R0mU7c/zE2s7et/E9vYiuCv9e4hJ0LS9GyArcfroy+tJlgu+k2IloEgje4uWZsPjVrgin65CUS1VTJCwMPyL/D91W0AGYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CJakbuPMQe2J6pSLzqv+LYp3cDOa1xWQeCSCaMYcOss=;
 b=Y0pXVhT0E3zUD8dRHXBrmvIFAX8UIrncvGSbZre+RxGKrbZRzbFQG6eTFZe0qmBUkBJzRxzOtrO6nFqsUxgBmXwSHu3Ton6vJjLkMC2AQ4rr+NUMvTIswJ5EZY5NXUEWBEGhVh02s2y29eqoCnX2Do14XzIgd32R6PumDWpcDopkZuiuUI8RL09roPofVKNFvTvFS2UsmgX2W72FuyRSHGZP72ABjIIytCKLwdFuD7RU7GJbYrOMHxB6mhSfcOS8eJkD0m6AUGRi84kSro4twxgnFBmCJYIa4zDWVXSSEhIoH92gtb9mQVsGjNljPeV0XssKzfpebPwM/+EepLRCXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by DS0PR11MB7483.namprd11.prod.outlook.com (2603:10b6:8:147::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.26; Fri, 28 Jun
 2024 19:28:03 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7698.033; Fri, 28 Jun 2024
 19:28:02 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [RFC 00/12] xe_ggtt node refactor for safer node removal
Date: Fri, 28 Jun 2024 15:27:41 -0400
Message-ID: <20240628192753.386137-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.45.1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0015.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::20) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|DS0PR11MB7483:EE_
X-MS-Office365-Filtering-Correlation-Id: f464c49c-0fac-4f44-8178-08dc97a86d71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z2trNHY1MjhuY0FQVTRheVZVNTdPWDNlVFk5Uzh0aXg4Q28vZkg0alhCcUdN?=
 =?utf-8?B?d1pSSkpVZmxtbXB4dFBVVHAvdFZyYkRIbkthOTA3TndqYmp4Z3JLMVNwaDhK?=
 =?utf-8?B?MVV4aUpJcjNBbkRrSEpUN3BwM3RTTlVFOVl1L1NuSmd3Y2dlM2ZLZWpBUG5P?=
 =?utf-8?B?alNDb0p4MmVYYk9DakNlS3oxZko4MmZ3ejdmbVNVTWduKzRSZW5qcG40RmJJ?=
 =?utf-8?B?bEExSm9pUGpjUVk3SUpjRElaeVZaMnc2ZzJPR1BVdFdTc04wZGMrL2hna3ZR?=
 =?utf-8?B?UjVmdWJsUGdaYVdFNzVoKzlTU0dITldMbE14M0JOSlJlbHVGY2xhbFRXTGZv?=
 =?utf-8?B?cUJHYzJjaWRpQWlCZ2xxREVORDF4UDVqYlZWQ3VWckJ1RDY1R2pxL0FKQTBa?=
 =?utf-8?B?YkNPMTlrOGEwSm11L1I5MTJhSm1sc2lXcExsVWVYZTRPZzN4OXY4emtrUkdR?=
 =?utf-8?B?cTdKQTVkL0lFMWs5a1dpWG9GckJuNTNuYWxsMytiUFVpcms1SlUvK0ZEN3lX?=
 =?utf-8?B?V0QrWGF4bW5hUUFmK1ZucS9XQTZwK3ArL1lCNGlZckUrbngxSUJ2WkZPeks4?=
 =?utf-8?B?ZjBDL0xoaHo3a3RMZ2EzbnV0MCttc0JjTWE3WVpad29wMGhMM3JkemZpMldF?=
 =?utf-8?B?dmJiaFFzM0RtK2NvR3BBVHltejhvM0Zwdi9WT3IxZ2hQRC9QYUptS3ZGeDZQ?=
 =?utf-8?B?RjBtTXpBZGRWTmN5ZVRSeXk1MEt6YWpERThqRlFWcWdFUTVjWnRXOE53dDhl?=
 =?utf-8?B?NDR3a0hYRVNKcjRCNWh3SjNER2ZzK09zc1Zvc0pnNmIvMEVSY3VSdGk0amJW?=
 =?utf-8?B?NEZZSmg3OElMeGVZUG5VMzVQbmdZZlBlSnVwcy9CL0U2WUM3aDVRdFlFR3h3?=
 =?utf-8?B?YTRqckI1alZEZWVLbk4xTjNhcGVXMWN5NExuTTlNb2h1ZFhBTzhnWnQrMWJI?=
 =?utf-8?B?UlBFdXVKRmtQOURaTWJDSmJmTC9xQkFSVkZHajBkWlNScGRDWnlLTk1OZG1i?=
 =?utf-8?B?OWtrN3VlMkwzV1EvR3I3dlV0cW9tNEI2d0FZWjVCZHFlaGZYek5IZUJVLzZ3?=
 =?utf-8?B?bmcySkdKUVlnZTNrV2Q3UGYvUnozU2dNaDczVXVramFpYjBtVVB6bFpQaW5J?=
 =?utf-8?B?VnpxazYvK0dXczkvdm5ZMko0bHZid0ZNTFNPWDVBQ1lvZnNQeTF3V2hGVkxY?=
 =?utf-8?B?dXo3N3ZLTTdEeWNlYWxIWVY0UFB0Q2l6WTV3UGE0Q1diWGROaVNvWnFzdE01?=
 =?utf-8?B?ekRDZ1BxeWZkdDFDcmlSbTErUmQydzZtL1pVQlM2RENrWmhocjNRdk9hV3pt?=
 =?utf-8?B?ZDdvckd4MHFpM05sSlJUOHFUNTRjSVhsR1l4b0NmTUs1TDZKb3QwL1JSS0NQ?=
 =?utf-8?B?WDl1RFFFQzNSYVpzV2hsL1kwOTFlVFFTOGp4M3VLSTBEOWNiZzM5VSt4dk9J?=
 =?utf-8?B?UTA1VHJsM3FENmhoV3JpNUcwYmtFSG5RRzI1L0xuaGVXUHVzc0FWL3o2bzd4?=
 =?utf-8?B?SFZkZGtROG10WGRGUHdDcmFUVk9iMEpPa3V1SFNYZWlxMUQ0eHZBT2pScWVZ?=
 =?utf-8?B?dGVneVlkNURaQlB4akROV3M5NUZqbCtIWVpQWDJjNjdZL3hTUmtHV1dKdklo?=
 =?utf-8?B?d2J4RzJVckVCcnR4Q1hNUUhIcnlyd3IxVC9ubzhMaEZzUlZlRVFNSDhiYS81?=
 =?utf-8?B?MW9HVFBUZktzaWh5N2cram42aTM0NDN4Wkk0NFl1SXU1VmpOQVFWc1NEcHF0?=
 =?utf-8?B?WXhieHkzcmw5MFRJVDdKazhrQkhrcTc3ZFFhb1YvanFhMGdRSzd1SGJRb21Z?=
 =?utf-8?B?TFNnUXJ5alozcDBpclFzUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R0Q2WUJzdmdXb3BTT2tVMlYvM1pRSXlCdS92V3RmMW1INm91N0U0OThuZ2RE?=
 =?utf-8?B?a0dnN1lGS053VHF6Smt6dFZnTklhMURLdkRLY1NiR2FMZmhUK0NzYlFoWTNT?=
 =?utf-8?B?Qk92UDRiaE91U1FBYnhrZlVFdVNlbnhFemRNRTlGQ1ExM3dmZjh1MFN5WVFW?=
 =?utf-8?B?cFFLeVlyYXZGeDRGSWpOWnJEb0lJb2xUbDBMVjR1bStqaUZUY3RYQlBOTm9U?=
 =?utf-8?B?Ry9lK3BiR1ZZWXdQS1dPM2RaNjFnS0xob2JGMThLYjB4OVF1aGMvMk1TdGNN?=
 =?utf-8?B?S1ltSFRsaGdvVlI2UWJXbEd4UC9KdXpNUDlDOFZUemNPaFBldmZuVllOUE9V?=
 =?utf-8?B?Mlp6K0JCQlIrS28rU1RUbFBVTXBzR3dDanBBM20vZWtaaDR1Mkg1MkRvZmFI?=
 =?utf-8?B?QkFwbWUzTklzd1ljWGs4ZUNlU3FEelJPYTJ2M1dYTit6Uk4zbG5oRWUzVGVq?=
 =?utf-8?B?cFV6Qjl2SUxQQjcxandKQmJVMnRzSFEwTktyZXZGek9hS1dBTWovRmRzaWo2?=
 =?utf-8?B?S1ovR2hmdkZjMUhpMks0S1FxZVdwSk9GZGlZSktMbmpidEtMSzRrY0pEMG91?=
 =?utf-8?B?K3hNUURMU1JHaUtieEVBZTVvWG5WVWVoeHIyamF1RjVJZkp5ampXU2dHMm4r?=
 =?utf-8?B?VTVTTTZGM2tiNE1XM2hkemdkSjA2akRPKzNwaXI4VWhtMVViR3oySm5XajEz?=
 =?utf-8?B?cjBsSjdtcGcwREZJWU1obFFmRVBDR0N0NDgyc0lSTERCTFR0K1lNMmVobVdu?=
 =?utf-8?B?QzNtb3h4eHFQRXk2MVpHa2Q0R3BFRlQvTStCUWh5dVpVSDhlenF0T1JWVjZS?=
 =?utf-8?B?Yjd2MjI1QzRkZHdrdmMyb1F6bGxUUmlKSDJTbm93enNiUlBQc0pZNmJwZW85?=
 =?utf-8?B?Ui8vZ2tIakEwSnpaZitlNklZd0RRd2NKZkF1b0JVLzhlN3lmM3R3RVd0RkFq?=
 =?utf-8?B?WlFSRTU1SjhCempJOGRnZTdIakF1M1VHZVhCQWFRMVJiZFNycnRhYnR1R2gr?=
 =?utf-8?B?ZXovZW91RzRjeWwwMkdBMU9RVUxiMUtJdlBCeDF6MUYyenVYOXVYRUI0RTBk?=
 =?utf-8?B?ciswem11SWN2Ry9QVVVrb0ptVWpkbjhrdGhMWG5LY0QzQ3hYVE9INGNyT1pr?=
 =?utf-8?B?Mk5YRlVFMlZnNWYyUUMvbVlqWDI2YkJRdVJHSHk4b2VhanliSFRRQURUR2Rs?=
 =?utf-8?B?d3VjWVVMUlFjanJnMlgvWEEydWNhQ3YrQ3dseGtUaE5ObzJQSjdocHB3NEFW?=
 =?utf-8?B?dlhScTdMOGgwSUd3anNZejRkR0pUdTZqam55ek4rQ0ZYZ0hxMGl4ZjE1ZXFK?=
 =?utf-8?B?bkpDTDF4RHFWdDdaTHdYUU8rOGJoZzNlOFlWYnY1c2RRR0NsMlBhNjlmMDVz?=
 =?utf-8?B?UzNCa3QwZURwZGZIdDRZYWFOd2xFbytZd3FrMjgra1NHdnFMOHNxZUY0cmM5?=
 =?utf-8?B?WmxRQzZSSE5sQXB4RDNBTTVGb0RwRUdHTlkzQXFNbmhXWElZaFlxKzBnNE1B?=
 =?utf-8?B?a0ZzSnByeUp6WUdhWkY5cVpFTm1VSGFSOC9hRjc3OTNZd3Q3MG9ZUjRDRHJk?=
 =?utf-8?B?cklNVkJBZnkwalpSV2kxUmlEVTdPQUQ3dmdLdS80TXBvTk9mWUhiNUFLcXE2?=
 =?utf-8?B?cWRjWkkyeVd6VThVYk9LU05rcEhRZ2c5K2ZtT2ZySWd0Rkw2aGJENVh4cDBK?=
 =?utf-8?B?bzdQcWFxK2s0M2ErRWRQNmZhaDVaWlJGYlhkcFdvdGJGSFczMkU4WWU3dFBj?=
 =?utf-8?B?MGh5aG55dzV4Q2c5SVdXbXFUWnp2VXkzN085dFFZR1loN25Jd0UxdGZGYjBo?=
 =?utf-8?B?M2NHMUxHRXFtbW9CSFVZMEZGdDlKa1czN0hvTFo0VERoeG4yUTRkQ3JxYmNF?=
 =?utf-8?B?VjdZeHR0dVB6L1dBUjBOa0F3SFo4MTdiQ0RmdjJyRkYvaG04SFVTT2JEQ29p?=
 =?utf-8?B?NWNWRkppMWYrVDdNU2RaclkybkxMN3BLMjQrSkJTR0NVenJWanJaRUwxZ0p6?=
 =?utf-8?B?QVdsZWxDWjFaZ0g0U2FEYkpEWWJhcGpnUC8vOHRlRE93Tkl5RFJkNDJ6Q1Ey?=
 =?utf-8?B?Mk1pb21JYnFZbnFjTS82QTc5RFlWSUhrM21Tai9HL3llNlN3SkJYSmNyZUZY?=
 =?utf-8?Q?cswmLaFHmdcTFv3MbVmj9zI0R?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f464c49c-0fac-4f44-8178-08dc97a86d71
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2024 19:28:02.8919 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CTVXGUuuHOdGvhrEQuo1PR4TGx3KnIqEsx7ToZeVu5xZLPz7y/x+waf8qObNdsuE4X3ddGl0lH30YR4kr0LEOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7483
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

The ultimate goal is to be able to remove the GGTT memory node
from a workqueue where we can wake-up the device from runtime
suspend in a dead-lock free situation.

However, the previous attempts failed so badly because the
drm-mm-node itself is controlled from many places outside
of the ggtt (drm-mm component).

So, this refactor aims to encapsulate the drm-mm-node inside
xe_ggtt with new xe_ggtt_node functions. And documenting
xe_ggtt and doing other clean-ups while at ti.

I still have a issue with initial display fb creation with
this version.
 [drm] *ERROR* Failed to setup i915 fbdev emulation (ret=-2)

But bisect there is taking longer then I thought. So, I'm
sending this series right now as an RFC to get some feedback
before I continue on this path...

Thanks,
Rodrigo.

Rodrigo Vivi (12):
  drm/xe: Removed unused xe_ggtt_printk
  drm/xe: Introduce GGTT documentation
  drm/xe: Remove unnecessary drm_mm.h includes
  drm/{i915,xe}: Avoid direct inspection of dpt_vma from outside dpt
  drm/xe: Encapsulate drm_mm_node inside xe_ggtt_node
  drm/xe: Rename xe_ggtt_node related functions
  drm/xe: Limit drm_mm_node_allocated access to xe_ggtt_node
  drm/xe: Introduce xe_ggtt_largest_hole
  drm/xe: Introduce xe_ggtt_print_holes
  drm/xe: Rename xe_ggtt balloon functions to make the node clear
  drm/xe: Make xe_ggtt_node struct independent
  drm/xe: Fix missing runtime outer protection for ggtt_remove_node

 Documentation/gpu/xe/xe_mm.rst                |  15 +
 drivers/gpu/drm/i915/display/intel_dpt.c      |   4 +
 drivers/gpu/drm/i915/display/intel_dpt.h      |   1 +
 .../drm/i915/display/skl_universal_plane.c    |   3 +-
 .../gpu/drm/xe/compat-i915-headers/i915_vma.h |   7 +-
 drivers/gpu/drm/xe/display/xe_fb_pin.c        |  35 +-
 drivers/gpu/drm/xe/xe_bo.c                    |   2 +-
 drivers/gpu/drm/xe/xe_bo.h                    |   9 +-
 drivers/gpu/drm/xe/xe_bo_types.h              |   5 +-
 drivers/gpu/drm/xe/xe_device_types.h          |   2 +-
 drivers/gpu/drm/xe/xe_ggtt.c                  | 473 ++++++++++++++----
 drivers/gpu/drm/xe/xe_ggtt.h                  |  26 +-
 drivers/gpu/drm/xe/xe_ggtt_types.h            |  58 ++-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    |  97 ++--
 .../gpu/drm/xe/xe_gt_sriov_pf_config_types.h  |   4 +-
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c           |  26 +-
 drivers/gpu/drm/xe/xe_migrate.h               |   2 +-
 drivers/gpu/drm/xe/xe_res_cursor.h            |   1 -
 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c        |   1 -
 19 files changed, 544 insertions(+), 227 deletions(-)

-- 
2.45.1

