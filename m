Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40244C87FC5
	for <intel-xe@archiver.kernel.org>; Thu, 24 Jul 2025 15:51:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D78B110E03A;
	Thu, 24 Jul 2025 15:51:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hp2tRfZR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C27310E03A
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Jul 2025 15:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753372313; x=1784908313;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=eFvK4eNETK2EfTRL4fuL2WJu2jF3b0tin29LmyzGh5s=;
 b=hp2tRfZRQ1+HEExXafeDCvux0iyXGXJfE4la+d3O9FbhjBFcAFXgGR2X
 /AUPczinwV3eOWuIvIfxptIhfvxHJBIyM7W6uAAvIoyxlEwRY/9c20znT
 +QmtztT5nYsirDb93ypSBV+x/cbUvTGmwX4g64vwTuBCETZW7fL4T/pue
 /KY1OG/HdjklbrJqiAGXUUanJ8gW/imey9zyKxr7tEP/WHzzchIq/C5EF
 ROxzlhmS7TEnqCR9DoDpbn20vmM4IKkS074DoSFLUNGdkoAAKAwsRUx5W
 XgoCsdBphHGg3mptRu34iSrKVQdgMeqDbpwcVHESb/Qob+N4IxY5Zk5q4 w==;
X-CSE-ConnectionGUID: De9dmGnMRPyMd9M5W+PWSg==
X-CSE-MsgGUID: Egz1ogZ0Rl2ZkQTbG+DyfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="66394978"
X-IronPort-AV: E=Sophos;i="6.16,337,1744095600"; d="scan'208";a="66394978"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2025 08:51:53 -0700
X-CSE-ConnectionGUID: b0UQb04GRdGBoLvZth/xmg==
X-CSE-MsgGUID: bB6L7A7JTYy7cqRXOu9K3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,337,1744095600"; d="scan'208";a="160290372"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2025 08:51:52 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 24 Jul 2025 08:51:52 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Thu, 24 Jul 2025 08:51:52 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.86) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 24 Jul 2025 08:51:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x67Th8/UPkIrDPeQXpNAHXvLwJAW45knUB1VzJ6oQwnIvTshEddkQaBqhvyyDQ28CU+K1NnbdOv0kTwak/bBeBYVcydtOlTShgEMdqIquR5y8s1Pd47HWm9kDdWUbsxkzYakf97czXQ/QrP9kBcBTEpFuaBahk0kDCFF7TS3rQkKDk3/yzq+RVAefvmYQeOoX+2kpTWBWn6DKJaKWkVbBBzjrMhS52oaxWRhByokvgQrvcVnI545aEPRMkOE6ESqqyNn/Atlr0H5R0IduRD0IRphn+0aA63Cp6/zKi2WeAvHYmM+nKr3Q87okqDXEngy1raRxYohWIwgUyby9SXTfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5ETijC0DqPex/Tluy21gmBId5fbOR51HZPpxVGiVzTQ=;
 b=g0g/Yg+lt1Me2VtZThxNa6YkYQVU5s1iHRK561I2k00/XJ1/r4gXzHOnIMlTFJpe6U7MLnavkP7w2W1iIx+yaFMrBJlZVGqgjMdCTCnW5dbW6u2yPVVVOI56TtjMCdJ/JPAFXX9C9rTYwk16iehG+JPFr1uJvpmosTtIzfDD1gUtwvK17Ou95j9CSteMTXZDrF61z1/LYWAQaddkI5TIScPFuhiYgyItF7XVfutkyRisety1GNjfvhi0mUj1f0WyqL4M0Yw4ozhgpJ0X4etVC0GRXU6R6m/1ZJpgRHWOM3rJtKcnW6B/f4fVghndHm9mqu2kNb6oodi1t9fhiwCwBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by SJ0PR11MB4848.namprd11.prod.outlook.com (2603:10b6:a03:2af::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Thu, 24 Jul
 2025 15:51:46 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.8943.029; Thu, 24 Jul 2025
 15:51:46 +0000
Message-ID: <c77f0c14-e4f3-49bd-9516-6fb4a15e92e3@intel.com>
Date: Thu, 24 Jul 2025 17:51:43 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/6] drm/xe/configfs: Check if device was preconfigured
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>
References: <20250722141059.30707-1-michal.wajdeczko@intel.com>
 <20250722141059.30707-5-michal.wajdeczko@intel.com>
 <sihlqt7y2k33ay4pi23ziltr7lfprbujyxyhloozeoqvpvkewx@jikbnw2so6ac>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <sihlqt7y2k33ay4pi23ziltr7lfprbujyxyhloozeoqvpvkewx@jikbnw2so6ac>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR0202CA0034.eurprd02.prod.outlook.com
 (2603:10a6:803:14::47) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|SJ0PR11MB4848:EE_
X-MS-Office365-Filtering-Correlation-Id: b781b1ec-5060-46ef-7da2-08ddcac9fe90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L3NVRzVtZXBoTWxPeFo2RkRPa2c2RldVUHBPWUJzaWpZbkg4RlFKTnNXcXhs?=
 =?utf-8?B?K3k5Y0xqY0FyeHBCeGpxZUFMemQxUHZRaHRURHBITUhpakt3MVR3V0RYa1Jk?=
 =?utf-8?B?d3hkMDZhMVI3dXhXbzdSeWJQZHVGRnZmTWRHcmlmMXVNdlVuRkx3L3VzVlY5?=
 =?utf-8?B?MFk0aXhXakhlUGxzcDdNSUlZUXNOZEF4ZS9NcXdDZGM4UGl3dmI2RzMvNkF6?=
 =?utf-8?B?OUZEVlR5bm53WlYvKzNteFhBQmQ2MTNaL01qbitRcGdjY0FCSmR1cjdlWTlw?=
 =?utf-8?B?QVhIdUJQdlpDeTFWZ3VRTUFadTF6bG9sMk5aa291cmRzUzM4dE5CdkN3L0dP?=
 =?utf-8?B?OFMraEZrTE5LOTVrc2xQOEFNSndUQlYzSmdDdVBFaEVlalI0VThickdGbUU3?=
 =?utf-8?B?S0J1WlZkUSsxVTg5UzRaWGIvZDdIR0RzWVNaWVI5cVN6bFA1c1pYaU9lNG01?=
 =?utf-8?B?VjBOQ0xRc2tBVzh0RDRTeU5EVytnYi9TSWU2dmJXQW5WSnJXek8zTEdSN1N6?=
 =?utf-8?B?MG96RCtHTzFxTlZGTmtadXd3cEdkSi9GRFA0ZkxSUlY3Z2lsWDNtUnMzbENW?=
 =?utf-8?B?d016bHB3NkROdEJ4ampYN1hjT2FJTEpxTDJHZUx3bGlBUUJnc1ByaTRjYUsv?=
 =?utf-8?B?QnVmTlRLVnJrMEtaa3Z4SG1DMStmYXVTL3UrVUNLZXdlSHRGRUdmcUpaYi9B?=
 =?utf-8?B?MEREMUpXMm1zTWlrZHhWeEdpVkk5VTQxUEEwQ3pKaDAxV1gvUnN3Qlo1bkFz?=
 =?utf-8?B?SVZNK3crMmNPTnltVXB0ajY1SUlzSEVOOXpHdEw5cUhsNmV5QXZ6THhSL2NN?=
 =?utf-8?B?UlppekZhQVNVanRRT1FNL3B0d1E1UHFNUGRYNEFyRXFMZFB6RW53TEVnSmNl?=
 =?utf-8?B?TzFtUDN1RXdXTVh5UElEaTAyT3pyWUptaVhUcGNVc2NkY3Q4d2VWOGRqdXRO?=
 =?utf-8?B?a1A5bU15ZmdZRzBPa2s2cDJ3czFQVDArdU5CeFFzM0Zmcm9xVGdUSHZjanU3?=
 =?utf-8?B?ekpsRkk5RGtqbmpWTTRZQVY4VDBTRHlDVmpGWkt0SGIwQ0dtL3F0Z2RaQSsv?=
 =?utf-8?B?emdKZ1p3NG5CVlBRLzNBVGQ5ZVFMWS8wcnpwWmJCVGczMWs2M2VCUDJYdWZs?=
 =?utf-8?B?WmNFMm9XTndkQjNBODNRK0hDN2lReXpob1JUMUJSS0Y1OWovcmxheXVPKzk3?=
 =?utf-8?B?cjZTWVdIZnZVeHpaeFBtTlJEY1N0d2pVUjJ0OUI2bjZOWlg4ZEx5ZnZvR29q?=
 =?utf-8?B?UDJ5czRJeVQzaitZaUV0VDFraGpuelN3TG1LZVRqNU81bHpZVGZMQXdUWDc4?=
 =?utf-8?B?enRqOGR5N2luWXZ6YUJZRDQyVGE4NTJpSGtJY0xYQjlYQlZReUFJRUpFaWRI?=
 =?utf-8?B?MjU5bDR3QzBXejhPNGVmNFhlemlRTE4yUEQxR2Vha1o4ZVNkVmYxWW5HR3VU?=
 =?utf-8?B?bWFlVFE4OEZaOTk5YXFYRFIrVTN4ckxjbHpuYUtNZy9xZmdybHZWRXQ2UG1o?=
 =?utf-8?B?ano3YkU4eEpybUIxM3Y4bHE1WFAzNjZjQm00WGxMelExdzN0SE9pRDlwWkZ1?=
 =?utf-8?B?aHJ2TU05RE5pSjVZdll0ZnQvMUJ2SGI5OS9jN0h1SVhTTEhnZnloMjZnTmJy?=
 =?utf-8?B?aVhOcTZ3eFdJR1FNQ2w5MFhwU1ZaaU5aRzZUcTYrVzRLcWpPN0Fod2VZNDlR?=
 =?utf-8?B?N21GdzFvdTRhTm45aE0yMnNBMTgySk1wbmZJY3VFUUhucFNkejBJdGlPMnd2?=
 =?utf-8?B?ZHRacGdhb1JDa1BCTXJaZXo2S2hNZGlQNGs0YTUxYVU4RUltbGQ1dFhGMjJa?=
 =?utf-8?B?a3FmeUJkd1o5cytFK0lMbkIyZmVkdVVhTTR5NjRxM1VyNXRXYWNkTUxQUzNO?=
 =?utf-8?B?Y2FwY0FESTRKOHBWcXFmbGVCM0tYK3YwdDBieG53TS9Id2R1UlBFSFJxaHVL?=
 =?utf-8?Q?GOdqskS2p94=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UlNPNy9tVkx2Z216LzJZQ2xHYXljbGhDUlZYL0xxOUtnZG0zMHdXU3V6d3gx?=
 =?utf-8?B?K1lDcy9EVnZINERDU1ByU3o3RGs0UGVINVlWZTZjL2VkcFpIRjVxSmlic1o3?=
 =?utf-8?B?cVNNOUNlcUluNFJ2UFBHcXJVais3NjlGYmkyOGoxZGc4Y0x2M052TUNwbVQ4?=
 =?utf-8?B?azRHR3V1Zm1FYUhrQTRVdHlKOHZMS2xqNWJkQ3FaN1crREdOQXU2YWVqN2VV?=
 =?utf-8?B?cG5lbkF2RlJaMFk1SHU0d3hKS0NKcnc1WkpOQWlQelk5Q0VpeFB1WE4wT0RL?=
 =?utf-8?B?ek9UTVJvK3QrU3RCVEQwWUtPNUVjTndCSXZjY2JIL2ZNY29IbEh6OFV0UWJV?=
 =?utf-8?B?Y3l4NjZsTi8yTXFpeVB1NzlQMGdlZlg4RXFhckVROVFxYjJFNTlBTlJtK3Z2?=
 =?utf-8?B?QzJEaG02M2pra3ByYThsd0swRzV1ZnVxNytUZU4xeE56UG5GNEs3Q0dQc3Bw?=
 =?utf-8?B?ZHo3U0dhbEQ5eUlxVCtxY0JMQ0U2RGlEdnJtbTVZcHQzYUM2U3I0V0x5R2h2?=
 =?utf-8?B?UlFwRkRQTHhMR0NjSWNMZzhxQWpxc1ArbHB6R3BXOTdhaFArRGVwRmhWQ0pH?=
 =?utf-8?B?UHFIVUc5NnNVOFlOYUFIekpwUVRyVVFsMUg1MUZBNVVZZ3IzK1N5Q0luNmdE?=
 =?utf-8?B?VXNWU1RQdWJ0blpFRENESm15U1VNbDRtWFBsUXAxTHZWR2tVc0pNZ2tyWUVy?=
 =?utf-8?B?Z3FHMnAxcUczS0lDdDNZWGpSck9ZcXN6cE5nUmVka2c5SGI5LzBibUJQZnUv?=
 =?utf-8?B?TzVBYVAycjdEaTcwZEtpeUVkMmtPS1RneHd3VExRZzVhODIycDdhMjAyc1Nj?=
 =?utf-8?B?TjV0VkYzNEJGbVZzTWRtdVc1Zm50S2UzSHZmbS9oTmdaVlZkN1ZwNGV3a0t2?=
 =?utf-8?B?KytVdmJPWklsbXZSZm53RElkZ0w4TmpZdHJLd0ZjblFTSGtUU3o0akVXcnZo?=
 =?utf-8?B?dEEvYjhWaGlTb0JUWCtCU3dITVVQL1dWQy9JTm9pSTFmeEt5QVNxTEM2bFBS?=
 =?utf-8?B?UVZ0anlmL1hBaXV5cnpGdmM2MEZ4c2NNd2RUR3gxWGo2YjNmVDBaVlpaZ3VT?=
 =?utf-8?B?bDRWaVc1MEdYa0JvQmkweW1RR1VuYmxuR2cwMk5zdTdJdklaenllSE9JaTF3?=
 =?utf-8?B?bnA3amtGcUFBZ3lHRk1DUkpQMk8wcFJ4SmdWbXlmR3RLajN2ZnlEVmNmVGww?=
 =?utf-8?B?MWloYXRzbnhIa2haRWFFQS94K1g1ZFlwNVVRYVViaXlYck01THllQU5kaEdk?=
 =?utf-8?B?bmxZWjJFVGoxd0wxYkJRT0xmcmRCcFNxSWl6WktvTndqTVNuWThGcWJIR2Nq?=
 =?utf-8?B?VXRlM0RMMHU5enN5UWgvRGMzR1Eva2JvU3E5elNiMjlhOHNxTEtTSVlhOWV6?=
 =?utf-8?B?SjEzZGtpM2syVE5CZlU4MjU4SCszRHF1L0hmTGVqRXhCTElrcXFNRHIzeGFJ?=
 =?utf-8?B?RStKTlpUajN4aDZ3cCtSL2ZoMTBoajNSbVNJWkdUL0YySjAreW9WUzFMNFlC?=
 =?utf-8?B?MmUyUW5QbWU2SVdScGZxTVFUUy9KNklEZlArRkRHR2p2VlBQQWRNYjI0VFdS?=
 =?utf-8?B?VVlFdzlsMFRHdjhveE9WM1VmV1VQT3Q0M0IxVXkydStnRUxFWHVyOGRXOUwr?=
 =?utf-8?B?ekM0bG1jZzU0ckFQamRVN01UdDJzcitFWXhEVnNYc2tYZTJoTEl1Si90Njdx?=
 =?utf-8?B?OVdRUG5Da2dIVVEwZnJvd1oyQjFXVmVVaEgwM0w0RGZvYkFEcktKUnU4Qkhy?=
 =?utf-8?B?dlltMEpBd1RIQlZ6Ylc0ZnVhNjJKQ3pXZHdxakpndHhudThBYVVPWms4b0hu?=
 =?utf-8?B?NklMWitHL1d3d0pOQU9PaG9URnAxSnlwTWJISlRBZ0dSck9ub1VpWGZrdHVj?=
 =?utf-8?B?azM0TVhxcFkwZjFuK3RMeEkreXltS21BSjBNWll1b3ZLZmpHQkZSYWtHZ3RG?=
 =?utf-8?B?Ulo1d3RmOHh5MWJkZ1I0YWpxNGJEdVQyMkNiT2UwcFh0M3hMZzIrSTJjR3RP?=
 =?utf-8?B?N2E3T2xJZDNBb0FsL05JZW9IMzE2aWZWMTVJVDYrUUdLKzgvTkU3UzhIMkF2?=
 =?utf-8?B?NUVLc3Y1Wk5QOU1IRlJ3bUJ3dlNEanNvLzNFRWRZY2IvMUJQbGJkdlZUQkhN?=
 =?utf-8?B?M2ZxbmtxMEtmM0xRT0hOcmMzNHgvWmFqandoK3dzemc5WkhYRGd5YStHSkYz?=
 =?utf-8?B?ZUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b781b1ec-5060-46ef-7da2-08ddcac9fe90
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2025 15:51:46.7322 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AmSu7A6mlFAcJIsSzFg/YCP79GvGqPDQHd/6C+TdQcjtDyKzBp8LZ4thUKzuvCP2a145Pj+oyGVLbE7RP05oUlp1c2xUfkDDJdul5kLoruQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4848
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



On 7/24/2025 5:17 PM, Lucas De Marchi wrote:
> On Tue, Jul 22, 2025 at 04:10:57PM +0200, Michal Wajdeczko wrote:
>> Since device configuration using configfs could be prepared long
>> time prior the driver load, add a debug log whether the current
>> device driver probe is using custom or default settings.
>>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>> drivers/gpu/drm/xe/xe_configfs.c | 35 ++++++++++++++++++++++++++++++--
>> drivers/gpu/drm/xe/xe_configfs.h |  2 ++
>> drivers/gpu/drm/xe/xe_pci.c      |  3 +++
>> 3 files changed, 38 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
>> index 36e2b45b305f..f83e8e9f070f 100644
>> --- a/drivers/gpu/drm/xe/xe_configfs.c
>> +++ b/drivers/gpu/drm/xe/xe_configfs.c
>> @@ -118,6 +118,17 @@ static struct xe_config_device *to_xe_config_device(struct config_item *item)
>>     return container_of(to_config_group(item), struct xe_config_device, group);
>> }
>>
>> +static void xe_config_set_defaults(struct xe_config_device *dev)
>> +{
>> +    dev->engines_allowed = U64_MAX;
>> +    dev->survivability_mode = false;
>> +}
> 
> other places here follow the file prefix, xe_configfs. I think mixing
> both is confusing.

but those are different classes:

xe_configfs() functions take struct pci_dev *pdev

while

xe_config() functions take struct xe_config_device *dev
 
so maybe this one should be just in full name:

xe_config_device_set_defaults()

or short name:

device_set_defaults()
set_device_defaults()

> 
>> +
>> +static bool xe_config_is_default(const struct xe_config_device *dev)
>> +{
>> +    return dev->engines_allowed == U64_MAX && !dev->survivability_mode;
> 
> maybe have something like below would be more maintainable? We may need
> to move the attribute values to an inner struct or just set the
> defaults very early.
> 
> At least aligning the variables would be good. On a first read I missed
> you were checking the 2 vars.
> 
> static const struct xe_config_device defaults = {
>     .engines_allowed = U64_MAX,
> };

could work, but this will likely prevent us from building defaults in the
runtime based on the data from xe_device_desc (if we ever want that way)

> 
> static void set_defaults(struct xe_config_device *dev)
> {
>     *dev = defaults;
> }
> 
> static bool is_default(const struct xe_config_device *dev)
> {
>     /*
>      * If a new attribute is added, there should be also a check for
>      * default. Assert it's not forgotten
>      */
>     static_assert(ARRAY_SIZE(xe_config_device_attrs) == 3);

maybe inner struct with attributes would be a better solution as then
we can just memcmp() actual item with fresh default, or at least keep
all non-attributes members first, followed by real attribute members:

struct xe_device_config {
	struct config_group group;
	struct mutex lock; /* protects attributes */

	/* attributes must be placed here: */
	bool survivability_mode;
	u64 engines_allowed;
	...
};

return !compare_after_member(def, dev, lock);

btw, do we really need mutex per each group?
can't we use our singleton xe_configfs.su_mutex?

> 
>     return dev->engines_allowed != defaults.engines_allowed &&
>            dev->survivability_mode != defaults.survivability_mode;

you likely mean ==

> }
> 
> 
>> +}
>> +
>> static ssize_t survivability_mode_show(struct config_item *item, char *page)
>> {
>>     struct xe_config_device *dev = to_xe_config_device(item);
>> @@ -281,8 +292,7 @@ static struct config_group *xe_config_make_device_group(struct config_group *gro
>>     if (!dev)
>>         return ERR_PTR(-ENOMEM);
>>
>> -    /* Default values */
>> -    dev->engines_allowed = U64_MAX;
>> +    xe_config_set_defaults(dev);
> 
> yeah, if we keep it here I think we don't need to an inner struct.
> 
>>
>>     config_group_init_type_name(&dev->group, name, &xe_config_device_type);
>>
>> @@ -323,6 +333,27 @@ static struct xe_config_device *configfs_find_group(struct pci_dev *pdev)
>>     return to_xe_config_device(item);
>> }
>>
>> +/**
>> + * xe_configfs_check_device() - Test if device was configured by configfs
>> + * @pdev: the &pci_dev device to test
>> + *
>> + * Try to find the configfs group that belongs to the specified pci device
>> + * and print a diagnostic message if found.
>> + *
>> + * Return: true if config group is found, false otherwise
>> + */
>> +bool xe_configfs_check_device(struct pci_dev *pdev)
>> +{
>> +    struct xe_config_device *cfg = configfs_find_group(pdev);
>> +
>> +    if (!cfg)
>> +        return false;
>> +
>> +    pci_dbg(pdev, "found %s settings in configfs\n",
>> +        xe_config_is_default(cfg) ? "default" : "custom");
>> +    return true;
> 
> return could be void.

my secret idea was that we could use this as a hint that there is
no need to check for modparams if there is config

but agree, currently unused

> 
> Lucas De Marchi
> 
>> +}
>> +
>> /**
>>  * xe_configfs_get_survivability_mode - get configfs survivability mode attribute
>>  * @pdev: pci device
>> diff --git a/drivers/gpu/drm/xe/xe_configfs.h b/drivers/gpu/drm/xe/xe_configfs.h
>> index fb8764008089..cdccf1f9b716 100644
>> --- a/drivers/gpu/drm/xe/xe_configfs.h
>> +++ b/drivers/gpu/drm/xe/xe_configfs.h
>> @@ -13,12 +13,14 @@ struct pci_dev;
>> #if IS_ENABLED(CONFIG_CONFIGFS_FS)
>> int xe_configfs_init(void);
>> void xe_configfs_exit(void);
>> +bool xe_configfs_check_device(struct pci_dev *pdev);
>> bool xe_configfs_get_survivability_mode(struct pci_dev *pdev);
>> void xe_configfs_clear_survivability_mode(struct pci_dev *pdev);
>> u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev);
>> #else
>> static inline int xe_configfs_init(void) { return 0; }
>> static inline void xe_configfs_exit(void) { }
>> +static inline bool xe_configfs_check_device(struct pci_dev *pdev) { return false; }
>> static inline bool xe_configfs_get_survivability_mode(struct pci_dev *pdev) { return false; }
>> static inline void xe_configfs_clear_survivability_mode(struct pci_dev *pdev) { }
>> static inline u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev) { return U64_MAX; }
>> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>> index f4ea13527945..322dc52c4a0b 100644
>> --- a/drivers/gpu/drm/xe/xe_pci.c
>> +++ b/drivers/gpu/drm/xe/xe_pci.c
>> @@ -17,6 +17,7 @@
>>
>> #include "display/xe_display.h"
>> #include "regs/xe_gt_regs.h"
>> +#include "xe_configfs.h"
>> #include "xe_device.h"
>> #include "xe_drv.h"
>> #include "xe_gt.h"
>> @@ -770,6 +771,8 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>>     struct xe_device *xe;
>>     int err;
>>
>> +    xe_configfs_check_device(pdev);
>> +
>>     if (desc->require_force_probe && !id_forced(pdev->device)) {
>>         dev_info(&pdev->dev,
>>              "Your graphics device %04x is not officially supported\n"
>> -- 
>> 2.47.1
>>

