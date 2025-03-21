Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 175FFC36001
	for <intel-xe@archiver.kernel.org>; Fri, 21 Mar 2025 22:46:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9455F10E071;
	Fri, 21 Mar 2025 22:46:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RNYx3YXp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7FDB10E071
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Mar 2025 22:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742597174; x=1774133174;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=BPcxHMvPHBH9nDo2rKCvUmvv512B/lptcd9xpILozBw=;
 b=RNYx3YXp4BgHLcRaFVW7s6uwQ9Wvv0bSSS9JLIgNKmv10E8olxZ8+EP7
 wLW7oM4deVWFngyERPRq2w2qHeFrwzSaQGLMFbhI2DN+7ZJXtotfSAKKh
 yaxuEvLv3SF8zwp+TjFn4bNdAIisYAbMb7d6vXBHbwa9NX+mk3OI4GdRI
 w+B6MtCIIJYcr8pkiZK8cppNE47C6Co4aETYkgVB93NIkYQC4hB3IqWS3
 NZbJZX19BHf4cizjKcA+G66ksuwBHub8hU8VqOhTj5JKb9HytDEeLxS+5
 Go7W+x9bFYVz4RFxo/ifc+WmsAJ06ioFZB7dFz5wUbpIeDzh1338H+dfz A==;
X-CSE-ConnectionGUID: 14Jb3kjxTJaaWrIkuOXUOA==
X-CSE-MsgGUID: MlEVtPz0RNC5RB2E8V+RzQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11380"; a="54543743"
X-IronPort-AV: E=Sophos;i="6.14,266,1736841600"; d="scan'208";a="54543743"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2025 15:46:09 -0700
X-CSE-ConnectionGUID: tBiK/CCaQXytlHdN61fsOQ==
X-CSE-MsgGUID: YweEusknSb6OrSsPTibs/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,266,1736841600"; d="scan'208";a="124301163"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Mar 2025 15:46:09 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 21 Mar 2025 15:46:08 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 21 Mar 2025 15:46:08 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 21 Mar 2025 15:46:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D5ZcZiKn0zKCnwya0OjfM8RwbWP4z/hE3oFAq6Bms6BUjD90PWcUMrWOGVtZxAyPFlqzjDpAa2kMPCVSWe2Cxx+887BMzZSlrBeYT8KMTcH2Gw49iTBaQd1WTvidji0eJkny4FwJUI8rZBpFI12zT9F1czLTPhrHo3Xhwmu9EfY0JN93Uas0Z9ByTFqKhPUMKKnOD/POarxk/e6PertXV+GUm1mfYxh6QjMCBpOzDbhcKKzLyKutbDWa9+xtnl8Ilm89VYZr/WoXkgb17ULNWVR4Z2JgavSFMjmg5CSfuesUPSveSX4UU3cgqvIJJsqckii03A/H1McJznDvxq0Xtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SSl9b/wurEaOR4abTGyLrxDlJIjMVgpKKbH9aIyGNic=;
 b=m6G1qcncEzvD1+Z9CbSEOn2bRAH9RR9KEaXtcVMtKFzOj5ddHhHRSRgnF8FMVYG/bhsjTx9ELiUWxpCtTK/wZvdjDhVffdI28iUjRWPLRqk7pGnz8SMoVIVNJKhBvc4CQXWYvnKVelK8LQ17pEkSzvbevbxOQU/xSp40AIyVh76qGSEGBsLeQdGsDgDCjEpqzG5MC4fhKWmwDupISUsAL5U0M1TVod4PK66/fDpHctWGi8fweBFh++Gfuquot4/UDEu2tMydE2jMeSgAQ0aIjMB6hvfoUUO8V070bLpEN1KrQfvdLCYW3uvQckHSJk0ylsDUg6XsclnSEni6RA7v7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22)
 by PH0PR11MB4870.namprd11.prod.outlook.com (2603:10b6:510:34::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.34; Fri, 21 Mar
 2025 22:45:25 +0000
Received: from DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1]) by DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1%3]) with mapi id 15.20.8534.036; Fri, 21 Mar 2025
 22:45:25 +0000
Message-ID: <4283fcec-5ddd-4d06-9eae-8e622e9695ee@intel.com>
Date: Fri, 21 Mar 2025 15:45:21 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm/xe/pmu: Add GT frequency events
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Riana Tauro <riana.tauro@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20250312001408.804125-1-vinay.belgaumkar@intel.com>
 <vx26ng5q4asspsg6lktrj5ok73gbiy3bfg7icu4fybekyt4zad@5h4bsek2mukm>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <vx26ng5q4asspsg6lktrj5ok73gbiy3bfg7icu4fybekyt4zad@5h4bsek2mukm>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY5PR17CA0066.namprd17.prod.outlook.com
 (2603:10b6:a03:167::43) To DM4PR11MB7757.namprd11.prod.outlook.com
 (2603:10b6:8:103::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7757:EE_|PH0PR11MB4870:EE_
X-MS-Office365-Filtering-Correlation-Id: 1da0292a-0428-417c-7c6a-08dd68ca11e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SlV2ZFplVndad1h0b3JLZGxTTHlOdWpuaEFRc3NZMEVQSnQ0YjVvSGp0VkJV?=
 =?utf-8?B?OWtIdEhINzN1d0M5YzRKL3J3UnltMUZxSVlhNFpSWmZFUjJkTUVDZXZEQjFZ?=
 =?utf-8?B?L0hnMFVTOTJ2ZkJZTmI2TzhaenkxL0xVeEFjWmIwL2ltdjhQRHg0SGU4bDd0?=
 =?utf-8?B?TDYzVWw1S1F2V1NuVGdBcVlocVdrTGVvUE1rMnExRjhjSkZhVXY1Wm5NL1Zw?=
 =?utf-8?B?TnRiNWhnNDFWUFVDeGZoOHlFbjhhZ3QvZnhJUE1sV2V2Y3F0TVU3Q2dtQ0wr?=
 =?utf-8?B?RmVJM21WazF5bi9NdFlnOUU4Y2p4dzhacmt5NFJ1U3h4SVZJeU9sbFFVOS9B?=
 =?utf-8?B?RlNpYVI1cXRGaVB1M0JrNmZSZlErWW0xOVpQLzhRRithYldqaVAxYWdwdDhK?=
 =?utf-8?B?MUpxc25sY0djVnd2RlgxSk5IRitISTBJWmFhR2FiOUsySEJ6N1haRDVwRnIz?=
 =?utf-8?B?MUpFcHp5cTZ0Q05FZ20vMVhJVEtNV0lBRVdwS2NCOXRlWG5yTGNQNWhaTDF5?=
 =?utf-8?B?YmhlTlEvMjhSTk5sTEpZd01YM0tvbEFKUDNOWFFnYVRGZlJYQ08yTFhlc2F5?=
 =?utf-8?B?ZGxNT2pVbDdZaHJxQXp0eVNrZlJnb1NycTB4N0FIRjV0ZEVNSGVIZEV2eVJN?=
 =?utf-8?B?MmRtdnJEM05IcUcxOURNb3A0ZTFJWmtNTzQ4K1hzM2VSeFptTHdkcy9BLzdn?=
 =?utf-8?B?aTZKMG5nWStwRjN0R3diS2MzcFE0dkhBQkxXOEMrRmFzV21lZXloT0NNYk9L?=
 =?utf-8?B?YU5zZlZsZ0xXZ2M3NE45OGhMY0N1ZEJaZ3U5dHdYWnZ6aVdxcVBNOWQwTnBJ?=
 =?utf-8?B?Z0RlSHFtUyt3MEg5Y0tERjhJSGU4N0JuT1paUzJTci9aa1VJT0RsaFZlRzRz?=
 =?utf-8?B?VTIwVHMxcGNScWc4clN1Nmw3MkkzaklUUmZuYmp1S2VUWnByaE14b0N2NEpD?=
 =?utf-8?B?bytzaHdmTG5JeUhIUk5seHhjbGtGU2VPbm8wQ0hKWktaZkcwb1NJSzQ5TUxG?=
 =?utf-8?B?K3JJUTJUNXVRdEtGRFlaM2syYU1aWHhqK29WU3JGS2F6SzBpRWpNaU9xSm9z?=
 =?utf-8?B?UjRMMzJsa3hOcjRuRG5hZjlaR0FORWc3bWlCL3dKRjN5VE1TNVFiVWpUaUZ3?=
 =?utf-8?B?eU9lSnUxZkpHdDJVMHFoQ3greXQyTE1obWtPRHVTaWJBSWdjZVQ1VHdnQk5l?=
 =?utf-8?B?Z0xCYzc0dTBveDc1VHI3NkJsZlM2VzZEaHhxM1c5TVNjaGV5UDE0UW02eUpo?=
 =?utf-8?B?SjhYUEludFI1c3ZpWWg0S1NnTGFhS1c1M3A1TlF4SkpQeG5FTEs2c0JvaGJh?=
 =?utf-8?B?NG1wRCt6Uk16Vnd2cXBCVktiU1JpVnRkcENMaXVvMmc1QzRUNzYxcFFiZDN6?=
 =?utf-8?B?RXJTa1krTGk5TTRnaGRFODJkZ3laRXNlRisxdThKSW1PWS9OSkFaTzZsUUFR?=
 =?utf-8?B?ZlJlL1RvUkJFQm1oRkRReFU5RTdtbVBuTGxhMng4UEVhblROL2NORVdYV01l?=
 =?utf-8?B?MnFmazlCTTVzUHRNTzNWM3pnWVZIcllsd2k0RW54blY4WXBQWm53UHZqVFNT?=
 =?utf-8?B?NGJpcUl0LzA3clhnZllveG9KZWdVV01wQ2ZCamRkWUl4ODhDaUpySG5wNTNK?=
 =?utf-8?B?SkxjelZHcndESndmKzRSYXNXci91NWZxUVpWbXJUbzZJcHR6OEdjaWJSWFBM?=
 =?utf-8?B?SWx3bTFla3lsb2dVOXQ1eFpueVA2YUhXRG13MzE4cGpDOGFWZERhNzU4VmRY?=
 =?utf-8?B?M0VRUmM1bHE2RE1QdUtMbXIvaEs0LzcxL2g4SER6eXcrbDJMYVVBVVdXcC9Y?=
 =?utf-8?B?SmZxWWRYMDhhMW1MN0QyNDRqd2VLY0ZiSUhyRStDdDlFWnZUM2t4UHE0V05K?=
 =?utf-8?Q?9HOlUR3dr1Oz8?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V2pQU0FuTkR2bzRNV0EzUVltLzBKU2wyZ083V2VTQ2RwdjdkTHg3MFpvVWsw?=
 =?utf-8?B?NnJra2xGRmltQzNKaWhCVFBrQzMxeHcyUGtJZ3NHVnMrdHpGOTN1cTlTVms5?=
 =?utf-8?B?bENPQktCQUZRYWFmWEt4UDhSZ1pqS3FUNkNBcWoxTFJSSWJoanNYN1d2SGIv?=
 =?utf-8?B?bndKT0pqQWZMMDhpMUJmYVJpQXNvTFdxU09NL0U1TmY4c3FqWCtNSDhSZ1Yx?=
 =?utf-8?B?dmZ2VjBOSEticnpwai9vT2VFQmJJeHJ1N3dXWDczalpDamluRHI0WkVjK05M?=
 =?utf-8?B?RCtRbmRBbGlOSHk3eXErWG5tMHZvN1BYcWVzOWlkYVZyT1kzVW1PWGFGbXVu?=
 =?utf-8?B?WVpxdWV1NkFaZ3FIM2wvQTYxK2VpZHZFT3NzdVQwRWxFTXFPQ3pmdUlmU2F1?=
 =?utf-8?B?UXErcW81cjJXQ3pPU2xzWmpsZ1NWcHIxOVFjWFRkVDhiN3pGbzZnMWc4YjYw?=
 =?utf-8?B?MForNkZtclBpbTcvQ0pFcSttREdTZTYwSm5OQW5RV2hvSzdpWVN6NmJkZ0o3?=
 =?utf-8?B?MGYzU1FKTXJwZTFZNmFDWGxySURGaE1WK0Y3cXV0Q2lvK1lRcE91RlFRL2Zx?=
 =?utf-8?B?bmk2RUI4KzQxZEtva1pCNU9rVHRLajdyNUlvMFYrQU1rT3pHbS9CZ0hyMjM2?=
 =?utf-8?B?bnpGRGpVSURWekdoazFna3JyQWZTcVVsenV1Ky8vM3EzYk05d3FHYUYxRFZ0?=
 =?utf-8?B?Y1BsYm8yVTZrR2R5VnBMakJRdVk1OHFHOWU0UWR5N25hSGIrZ1V1L1hzVVgr?=
 =?utf-8?B?VzczMDd2UzdxcnRiOWRPNzlLMU8vYmI3Q09uSDJtVXBBaDhsU1lIblFnK2E1?=
 =?utf-8?B?WldHY0VBcGFLWlJ6UG9BMkZDMDRtZ2dzY21IalNJZ1VLaDBaTkhPejgySGxU?=
 =?utf-8?B?LzZzd042T2VZdjJINkkvMk93dFJpd2JnMmtuTFZJb2h5MWFOWk9Sa0ZxeXBO?=
 =?utf-8?B?SjZSeVJSL3hTcFE4TlNpMmdqZDlNVm1WSExpTDhNUE5RSW42V1JZdE9EYUMv?=
 =?utf-8?B?NzB1UDZaTG9IemxTWXlZQUYxaVJONnA5dXkwTmptUCtidlhvWTA2UWVobC9j?=
 =?utf-8?B?a0lWMDFrNlRxcnhiVGVBWTFNbTVsQUZVRVpVTkQ1WlpGV2Y4T2E4UnlyZWpl?=
 =?utf-8?B?YmNhVndoMnlPZHFCamlmRjlkUW80WXp4S0NwMUdmc3ZIVDNLOFVtbVlYUUho?=
 =?utf-8?B?YjdSdmVtRXFRMWw1cVh3LzBmbExNVWZIY1VpOW8rQVpoSzVQTDZrVzJqdU9I?=
 =?utf-8?B?ZmJVZnFkRW9jZWt3Y3cvbjZrOUladW0zT1BUR0ZjM0NBM1JkcHpjTENLdDh0?=
 =?utf-8?B?SXlOd2g2U1NYeHFpeG5ZY0tLbC9XMjRERTNoSXhnV1hwQmRHTEhrUGNzc0FB?=
 =?utf-8?B?emhGN1NVNXg3SERYUm4zYzdSbzFMRXY0Qm1vTW9JYU9ERlRHNXppSWdGWlBy?=
 =?utf-8?B?WnFJRjR1MDlkbUM4dXozbStDUThDeUd4aTZVaFFSVnJ5Q1cxUTRIak9tNk1M?=
 =?utf-8?B?RHZ4d3liUjNPc1lQc1RjbGhpMWRXeEx6TVROTEVkYUx3UGtrTTNGYzdZWjQr?=
 =?utf-8?B?dlFpYmlqcTZzSGZqUk1wNnJYcy9iZy9vUFZFRHFna01IQWRDTkdWSkc1LzFJ?=
 =?utf-8?B?Wk5ZMEsvbHJ6em81UzJ6Y1MzNWNLZ3VNTXpvK3lub2FmdU1hNDVxaFkxOW40?=
 =?utf-8?B?M25iWW0zR09NM1lOenpORDlLTWcvRkNuTmNjYzlQc3k1SGlhL1dYZEVSVUti?=
 =?utf-8?B?Qnd2N20zRDRIVU45M2NCdlZKV2tqN3hLUnBFQ0l1eWd6UGx5Y3d6bU1jc0JS?=
 =?utf-8?B?U28zQWErdmFzd2ZveU5Hd2U3akxWTitDWTdXTXVoc0d5aFdYVmhtVGY1Q28r?=
 =?utf-8?B?WXhzNFpQTkRJRXQ3dXdDQkI3VEVJNmFTajQ2SmY4QUtINzllaVNRRUpmQzVL?=
 =?utf-8?B?Wnhqb1JNcjE3aGJGWEJCRUR4SHNzVGltYTlVUTVwSVZiaG9hTUlPU3ozdGRE?=
 =?utf-8?B?blZ6VWtqMFpYQVB2MHNIQjF2Z0x0YVhvOXJTdkIzMm1WWVVlNVJTV01CUTRj?=
 =?utf-8?B?LzFhMGpUd3RtWnpjVlJhYWp2NnlvUkk4S3pham9DU2h2S293TzJLM3hxYVpj?=
 =?utf-8?B?UzE0a1hkbVpWZnhwTWYvRHlkMTJ3MHBqOUZXdlhpcXhtdTNSYlZKUzVMZ0Zq?=
 =?utf-8?B?Tnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1da0292a-0428-417c-7c6a-08dd68ca11e4
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2025 22:45:25.2305 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wGZzmsdchhhZiWji+dfJM9LjXSzT7TkFDo3DI/4iVXBiOVn7Sc7Q20kjuhuhaj43dsmC5XuuIqmNgM4BZhRf0ApzpwJcnxBjQO9g0G5Pk2Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4870
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


On 3/13/2025 2:45 PM, Lucas De Marchi wrote:
> On Tue, Mar 11, 2025 at 05:14:08PM -0700, Vinay Belgaumkar wrote:
>> Define PMU events for GT frequency (actual and requested). This is
>> a port from the i915 driver implementation, where an internal timer
>> is used to aggregate GT frequencies over certain fixed interval.
>> Following PMU events are being added-
>                      ^
> why do you use "-"  instead of ":"?
>
>>
>>  xe_0000_00_02.0/gt-actual-frequency/              [Kernel PMU event]
>>  xe_0000_00_02.0/gt-requested-frequency/           [Kernel PMU event]
>>
>> Standard perf commands can be used to monitor GT frequency-
>>  $ perf stat -e xe_0000_00_02.0/gt-requested-frequency,gt=0/ -I1000
>>
>>     1.001175175                700 M xe/gt-requested-frequency,gt=0/
>>     2.005891881                703 M xe/gt-requested-frequency,gt=0/
>>     3.007318169                700 M xe/gt-requested-frequency,gt=0/
>>
>> Actual frequencies will be reported as 0 when GT is in C6.
>
>
> I think we need to document somewhere, but at the very least in the
> commit message what the event count actually is. Let me see if I get
> this right:  if userspace is sampling every 1sec, and assuming the gpu
> is at 700MHz for the first 0.5sec and at 1.4 GHz, userspace should
> expect to see ~1050 as the value. Correct?  I find this frequency
> handling very different from anything else reported via perf. Other
> than i915, are there any other cases you know of?

Yes,  user will see a gradual ramp. One thing that could work is 
something along these lines:

@@ -324,7 +327,10 @@ static void xe_pmu_event_update(struct perf_event 
*event)
                 new = __xe_pmu_event_read(event);
         } while (!local64_try_cmpxchg(&hwc->prev_count, &prev, new));

-       local64_add(new - prev, &event->count);
+       if (is_gt_frequency_event(id))
+               local64_add(new, &event->count);
+       else
+               local64_add(new - prev, &event->count);

This will give us instantaneous values and will not need the use of an 
internal timer.  Should be ok to do it this way?

Thanks,

Vinay.

>
>>
>> v2: Use locks while storing/reading samples, keep track of multiple
>> clients (Lucas) and other general cleanup.
>> v3: Review comments (Lucas) and use event counts instead of mask for
>> active events.
>>
>> Cc: Riana Tauro <riana.tauro@intel.com>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>> ---
>> drivers/gpu/drm/xe/xe_pmu.c       | 178 ++++++++++++++++++++++++++++--
>> drivers/gpu/drm/xe/xe_pmu_types.h |  29 +++++
>> 2 files changed, 197 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
>> index 4f62a6e515d6..d4c639369709 100644
>> --- a/drivers/gpu/drm/xe/xe_pmu.c
>> +++ b/drivers/gpu/drm/xe/xe_pmu.c
>> @@ -10,7 +10,9 @@
>> #include "xe_force_wake.h"
>> #include "xe_gt_idle.h"
>> #include "xe_guc_engine_activity.h"
>> +#include "xe_guc_pc.h"
>> #include "xe_hw_engine.h"
>> +#include "xe_macros.h"
>> #include "xe_pm.h"
>> #include "xe_pmu.h"
>>
>> @@ -52,6 +54,7 @@
>> #define XE_PMU_EVENT_ENGINE_CLASS_MASK        GENMASK_ULL(27, 20)
>> #define XE_PMU_EVENT_ENGINE_INSTANCE_MASK    GENMASK_ULL(19, 12)
>> #define XE_PMU_EVENT_ID_MASK            GENMASK_ULL(11, 0)
>> +#define XE_HRTIMER_INTERVAL_NS        5000000
>>
>> static unsigned int config_to_event_id(u64 config)
>> {
>> @@ -76,10 +79,12 @@ static unsigned int config_to_gt_id(u64 config)
>> #define XE_PMU_EVENT_GT_C6_RESIDENCY        0x01
>> #define XE_PMU_EVENT_ENGINE_ACTIVE_TICKS    0x02
>> #define XE_PMU_EVENT_ENGINE_TOTAL_TICKS        0x03
>> +#define XE_PMU_EVENT_GT_ACTUAL_FREQUENCY    0x04
>> +#define XE_PMU_EVENT_GT_REQUESTED_FREQUENCY    0x05
>>
>> static struct xe_gt *event_to_gt(struct perf_event *event)
>> {
>> -    struct xe_device *xe = container_of(event->pmu, typeof(*xe), 
>> pmu.base);
>> +    struct xe_device *xe = container_of(event->pmu, typeof(struct 
>> xe_device), pmu.base);
>>     u64 gt = config_to_gt_id(event->attr.config);
>>
>>     return xe_device_get_gt(xe, gt);
>> @@ -179,7 +184,7 @@ static bool event_param_valid(struct perf_event 
>> *event)
>>
>> static void xe_pmu_event_destroy(struct perf_event *event)
>> {
>> -    struct xe_device *xe = container_of(event->pmu, typeof(*xe), 
>> pmu.base);
>> +    struct xe_device *xe = container_of(event->pmu, typeof(struct 
>> xe_device), pmu.base);
>>     struct xe_gt *gt;
>>     unsigned int *fw_ref = event->pmu_private;
>>
>> @@ -197,7 +202,7 @@ static void xe_pmu_event_destroy(struct 
>> perf_event *event)
>>
>> static int xe_pmu_event_init(struct perf_event *event)
>> {
>> -    struct xe_device *xe = container_of(event->pmu, typeof(*xe), 
>> pmu.base);
>> +    struct xe_device *xe = container_of(event->pmu, typeof(struct 
>> xe_device), pmu.base);
>
> 3 cases above: please stop changing unrelated lines. They were fine
> the way they were.
copy paste error.
>
>>     struct xe_pmu *pmu = &xe->pmu;
>>     unsigned int id, gt;
>>
>> @@ -219,6 +224,9 @@ static int xe_pmu_event_init(struct perf_event 
>> *event)
>>     if (!event_supported(pmu, gt, id))
>>         return -ENOENT;
>>
>> +    if (XE_WARN_ON(id >= XE_PMU_MAX_EVENT_TYPES))
>> +        return -EINVAL;
>> +
>>     if (has_branch_stack(event))
>>         return -EOPNOTSUPP;
>>
>> @@ -239,6 +247,30 @@ static int xe_pmu_event_init(struct perf_event 
>> *event)
>>     return 0;
>> }
>>
>> +static u64
>> +xe_get_pmu_sample(struct xe_pmu *pmu, unsigned int gt_id, uint32_t id)
>> +{
>> +    unsigned long flags;
>> +    u64 val;
>> +
>> +    raw_spin_lock_irqsave(&pmu->lock, flags);
>> +    val = pmu->event_sample[gt_id][id];
>> +    raw_spin_unlock_irqrestore(&pmu->lock, flags);
>> +
>> +    return val;
>> +}
>> +
>> +static void
>> +xe_store_pmu_sample(struct xe_pmu *pmu, uint32_t gt_id, uint32_t id,
>> +            uint32_t val, uint32_t period)
>> +{
>> +    unsigned long flags;
>> +
>> +    raw_spin_lock_irqsave(&pmu->lock, flags);
>> +    pmu->event_sample[gt_id][id] += mul_u32_u32(val, period);
>> +    raw_spin_unlock_irqrestore(&pmu->lock, flags);
>> +}
>> +
>> static u64 read_engine_events(struct xe_gt *gt, struct perf_event 
>> *event)
>> {
>>     struct xe_hw_engine *hwe;
>> @@ -256,16 +288,23 @@ static u64 read_engine_events(struct xe_gt *gt, 
>> struct perf_event *event)
>> static u64 __xe_pmu_event_read(struct perf_event *event)
>> {
>>     struct xe_gt *gt = event_to_gt(event);
>> +    struct xe_pmu *pmu = container_of(event->pmu, typeof(struct 
>> xe_pmu), base);
>
>     struct xe_pmu *pmu = container_of(event->pmu, typeof(*pmu), base);
>
> typeof(type) is odd.
ok.
>
>
>> +    unsigned long id;
>>
>>     if (!gt)
>>         return 0;
>>
>> -    switch (config_to_event_id(event->attr.config)) {
>> +    id = config_to_event_id(event->attr.config);
>> +
>> +    switch (id) {
>>     case XE_PMU_EVENT_GT_C6_RESIDENCY:
>>         return xe_gt_idle_residency_msec(&gt->gtidle);
>>     case XE_PMU_EVENT_ENGINE_ACTIVE_TICKS:
>>     case XE_PMU_EVENT_ENGINE_TOTAL_TICKS:
>>         return read_engine_events(gt, event);
>> +    case XE_PMU_EVENT_GT_ACTUAL_FREQUENCY:
>> +    case XE_PMU_EVENT_GT_REQUESTED_FREQUENCY:
>> +        return div_u64(xe_get_pmu_sample(pmu, gt->info.id, id), 
>> NSEC_PER_SEC);
>>     }
>>
>>     return 0;
>> @@ -286,7 +325,7 @@ static void xe_pmu_event_update(struct perf_event 
>> *event)
>>
>> static void xe_pmu_event_read(struct perf_event *event)
>> {
>> -    struct xe_device *xe = container_of(event->pmu, typeof(*xe), 
>> pmu.base);
>> +    struct xe_device *xe = container_of(event->pmu, typeof(struct 
>> xe_device), pmu.base);
>
> ditto.
ok.
>
>>     struct xe_pmu *pmu = &xe->pmu;
>>
>>     if (!pmu->registered) {
>> @@ -297,8 +336,89 @@ static void xe_pmu_event_read(struct perf_event 
>> *event)
>>     xe_pmu_event_update(event);
>> }
>>
>> +static void xe_pmu_start_timer(struct xe_pmu *pmu)
>> +{
>> +    /* Timer is per device */
>> +    if (!pmu->timer_enabled) {
>> +        pmu->timer_enabled = true;
>> +        pmu->timer_last = ktime_get();
>> +        hrtimer_start_range_ns(&pmu->timer,
>> +                       ns_to_ktime(XE_HRTIMER_INTERVAL_NS), 0,
>> +                       HRTIMER_MODE_REL_PINNED);
>> +    }
>> +}
>> +
>> +static void
>> +xe_sample_gt_frequency(struct xe_pmu *pmu, uint32_t period_ns)
>> +{
>> +    struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
>> +    struct xe_gt *gt;
>> +    uint32_t act_freq, cur_freq;
>> +    int ret;
>> +    int i;
>> +
>> +    /* Sample each event type once */
>> +    for_each_gt(gt, xe, i) {
>> +        if (pmu->active_count[i][XE_PMU_EVENT_GT_ACTUAL_FREQUENCY]) {
>> +            /* Actual freq will be 0 when GT is in C6 */
>> +            act_freq = xe_guc_pc_get_act_freq(&gt->uc.guc.pc);
>> +            xe_store_pmu_sample(pmu, i, 
>> XE_PMU_EVENT_GT_ACTUAL_FREQUENCY,
>> +                        act_freq, period_ns);
>> +        }
>> +
>> +        if 
>> (pmu->active_count[i][XE_PMU_EVENT_GT_REQUESTED_FREQUENCY]) {
>> +            ret = xe_guc_pc_get_cur_freq(&gt->uc.guc.pc, &cur_freq);
>> +            if (!ret)
>> +                xe_store_pmu_sample(pmu, i, 
>> XE_PMU_EVENT_GT_REQUESTED_FREQUENCY,
>> +                            cur_freq, period_ns);
>> +        }
>> +    }
>> +}
>> +
>> +static enum hrtimer_restart xe_sample(struct hrtimer *hrtimer)
>> +{
>> +    struct xe_pmu *pmu = container_of(hrtimer, struct xe_pmu, timer);
>> +    struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
>> +    u64 time_diff_ns;
>> +    ktime_t now;
>> +
>> +    if (!READ_ONCE(pmu->timer_enabled))
>> +        return HRTIMER_NORESTART;
>> +
>> +    now = ktime_get();
>> +    time_diff_ns = ktime_to_ns(ktime_sub(now, pmu->timer_last));
>> +    pmu->timer_last = now;
>> +
>> +    xe_sample_gt_frequency(pmu, time_diff_ns);
>> +
>> +    hrtimer_forward(hrtimer, now, ns_to_ktime(XE_HRTIMER_INTERVAL_NS));
>> +
>> +    return HRTIMER_RESTART;
>> +}
>> +
>> +static bool is_gt_frequency_event(uint32_t id)
>> +{
>> +    return (id == XE_PMU_EVENT_GT_ACTUAL_FREQUENCY) ||
>> +           (id == XE_PMU_EVENT_GT_REQUESTED_FREQUENCY);
>> +}
>> +
>> static void xe_pmu_enable(struct perf_event *event)
>> {
>> +    struct xe_gt *gt = event_to_gt(event);
>> +    struct xe_pmu *pmu = container_of(event->pmu, typeof(struct 
>> xe_pmu), base);
>> +    uint32_t id = config_to_event_id(event->attr.config);
>> +    unsigned long flags;
>> +
>> +    raw_spin_lock_irqsave(&pmu->lock, flags);
>> +
>> +    if (is_gt_frequency_event(id)) {
>> +        pmu->active_count[gt->info.id][id]++;
>> +        /* Start a timer, if needed, to collect samples */
>> +        if (pmu->n_active++ == 0)
>> +            xe_pmu_start_timer(pmu);
>
> with my suggestion to drop the timer_enabled
> this would be:
>
> xe_pmu_start_timer(pmu)
> {
>     if (pmu->n_active++ == 0) {
>         ...
>     }
> }
>
> if (is_gt_frequency_event(id)) {
>     pmu->active_count[gt->info.id][id]++;
>     xe_pmu_start_timer(pmu);
> }
>
>
>> +    }
>> +
>> +    raw_spin_unlock_irqrestore(&pmu->lock, flags);
>>     /*
>>      * Store the current counter value so we can report the correct 
>> delta
>>      * for all listeners. Even when the event was already enabled and 
>> has
>> @@ -309,7 +429,7 @@ static void xe_pmu_enable(struct perf_event *event)
>>
>> static void xe_pmu_event_start(struct perf_event *event, int flags)
>> {
>> -    struct xe_device *xe = container_of(event->pmu, typeof(*xe), 
>> pmu.base);
>> +    struct xe_device *xe = container_of(event->pmu, typeof(struct 
>> xe_device), pmu.base);
>
> ditto
ok.
>
>>     struct xe_pmu *pmu = &xe->pmu;
>>
>>     if (!pmu->registered)
>> @@ -319,21 +439,43 @@ static void xe_pmu_event_start(struct 
>> perf_event *event, int flags)
>>     event->hw.state = 0;
>> }
>>
>> +static void xe_pmu_disable(struct perf_event *event)
>> +{
>> +    struct xe_device *xe = container_of(event->pmu, typeof(struct 
>> xe_device), pmu.base);
>> +    struct xe_gt *gt = event_to_gt(event);
>> +    struct xe_pmu *pmu = &xe->pmu;
>> +    uint32_t id = config_to_event_id(event->attr.config);
>> +    unsigned long flags;
>> +
>> +    raw_spin_lock_irqsave(&pmu->lock, flags);
>> +
>> +    if (is_gt_frequency_event(id)) {
>> +        pmu->active_count[gt->info.id][id]--;
>> +        if (--pmu->n_active == 0)
>> +            pmu->timer_enabled = false;
>
> rather call hrtimer_cancel() here?
ok.
>
>
>> +    }
>> +
>> +    raw_spin_unlock_irqrestore(&pmu->lock, flags);
>> +}
>> +
>> static void xe_pmu_event_stop(struct perf_event *event, int flags)
>> {
>> -    struct xe_device *xe = container_of(event->pmu, typeof(*xe), 
>> pmu.base);
>> +    struct xe_device *xe = container_of(event->pmu, typeof(struct 
>> xe_device), pmu.base);
>>     struct xe_pmu *pmu = &xe->pmu;
>>
>> -    if (pmu->registered)
>> +    if (pmu->registered) {
>>         if (flags & PERF_EF_UPDATE)
>>             xe_pmu_event_update(event);
>>
>> +        xe_pmu_disable(event);
>> +    }
>> +
>>     event->hw.state = PERF_HES_STOPPED;
>> }
>>
>> static int xe_pmu_event_add(struct perf_event *event, int flags)
>> {
>> -    struct xe_device *xe = container_of(event->pmu, typeof(*xe), 
>> pmu.base);
>> +    struct xe_device *xe = container_of(event->pmu, typeof(struct 
>> xe_device), pmu.base);
>>     struct xe_pmu *pmu = &xe->pmu;
>>
>>     if (!pmu->registered)
>> @@ -419,6 +561,10 @@ static ssize_t event_attr_show(struct device *dev,
>> XE_EVENT_ATTR_SIMPLE(gt-c6-residency, gt_c6_residency, 
>> XE_PMU_EVENT_GT_C6_RESIDENCY, "ms");
>> XE_EVENT_ATTR_NOUNIT(engine-active-ticks, engine_active_ticks, 
>> XE_PMU_EVENT_ENGINE_ACTIVE_TICKS);
>> XE_EVENT_ATTR_NOUNIT(engine-total-ticks, engine_total_ticks, 
>> XE_PMU_EVENT_ENGINE_TOTAL_TICKS);
>> +XE_EVENT_ATTR_SIMPLE(gt-actual-frequency, gt_actual_frequency,
>> +             XE_PMU_EVENT_GT_ACTUAL_FREQUENCY, "Mhz");
>> +XE_EVENT_ATTR_SIMPLE(gt-requested-frequency, gt_requested_frequency,
>> +             XE_PMU_EVENT_GT_REQUESTED_FREQUENCY, "Mhz");
>>
>> static struct attribute *pmu_empty_event_attrs[] = {
>>     /* Empty - all events are added as groups with .attr_update() */
>> @@ -434,6 +580,8 @@ static const struct attribute_group 
>> *pmu_events_attr_update[] = {
>>     &pmu_group_gt_c6_residency,
>>     &pmu_group_engine_active_ticks,
>>     &pmu_group_engine_total_ticks,
>> +    &pmu_group_gt_actual_frequency,
>> +    &pmu_group_gt_requested_frequency,
>>     NULL,
>> };
>>
>> @@ -442,8 +590,11 @@ static void set_supported_events(struct xe_pmu 
>> *pmu)
>>     struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
>>     struct xe_gt *gt = xe_device_get_gt(xe, 0);
>>
>> -    if (!xe->info.skip_guc_pc)
>> +    if (!xe->info.skip_guc_pc) {
>>         pmu->supported_events |= BIT_ULL(XE_PMU_EVENT_GT_C6_RESIDENCY);
>> +        pmu->supported_events |= 
>> BIT_ULL(XE_PMU_EVENT_GT_ACTUAL_FREQUENCY);
>> +        pmu->supported_events |= 
>> BIT_ULL(XE_PMU_EVENT_GT_REQUESTED_FREQUENCY);
>> +    }
>>
>>     if (xe_guc_engine_activity_supported(&gt->uc.guc)) {
>>         pmu->supported_events |= 
>> BIT_ULL(XE_PMU_EVENT_ENGINE_ACTIVE_TICKS);
>> @@ -463,6 +614,8 @@ static void xe_pmu_unregister(void *arg)
>>     if (!pmu->registered)
>>         return;
>>
>> +    hrtimer_cancel(&pmu->timer);
>> +
>>     pmu->registered = false;
>>
>>     perf_pmu_unregister(&pmu->base);
>> @@ -491,6 +644,11 @@ int xe_pmu_register(struct xe_pmu *pmu)
>>     if (IS_SRIOV_VF(xe))
>>         return 0;
>>
>> +    raw_spin_lock_init(&pmu->lock);
>> +
>> +    hrtimer_init(&pmu->timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
>> +    pmu->timer.function = xe_sample;
>> +
>>     name = kasprintf(GFP_KERNEL, "xe_%s",
>>              dev_name(xe->drm.dev));
>>     if (!name)
>> diff --git a/drivers/gpu/drm/xe/xe_pmu_types.h 
>> b/drivers/gpu/drm/xe/xe_pmu_types.h
>> index f5ba4d56622c..59ed9d8b4ed8 100644
>> --- a/drivers/gpu/drm/xe/xe_pmu_types.h
>> +++ b/drivers/gpu/drm/xe/xe_pmu_types.h
>> @@ -10,6 +10,7 @@
>> #include <linux/spinlock_types.h>
>>
>> #define XE_PMU_MAX_GT 2
>> +#define XE_PMU_MAX_EVENT_TYPES 64
>>
>> /**
>>  * struct xe_pmu - PMU related data per Xe device
>> @@ -34,6 +35,34 @@ struct xe_pmu {
>>      * @supported_events: Bitmap of supported events, indexed by 
>> event id
>>      */
>>     u64 supported_events;
>> +    /**
>> +     * @lock: Lock protecting enable counts and sampling.
>> +     */
>> +    raw_spinlock_t lock;
>
> Lock protecting hw state
>
>
> struct {
>     struct hrtimer hrtimer;
>     ktime_t last_stamp;
>     unsigned int active;
>     unsigned long active_count[XE_PMU_MAX_GT][XE_PMU_MAX_EVENT_TYPES];
>     u64 event_sample[XE_PMU_MAX_GT][XE_PMU_MAX_EVENT_TYPES];
> } timer;
>
> From your code above it doesn't think you need both "timer_enabled" and
> "n_active". Calling it active would be better. == 0 means "no".
>
> Also group them in a substruct like above, because  "n_active" doesn't
> give any hint this is only about the very few events that use a timer.
>
> Lucas De Marchi
>
>> +    /**
>> +     * @n_active: Total number of active events that need timer.
>> +     */
>> +    unsigned int n_active;
>> +    /**
>> +     * @active_count: Counts per GT/type of event that need timer.
>> +     */
>> +    unsigned long active_count[XE_PMU_MAX_GT][XE_PMU_MAX_EVENT_TYPES];
>> +    /**
>> +     * @timer: Timer for sampling GT frequency.
>> +     */
>> +    struct hrtimer timer;
>> +    /**
>> +     * @timer_last: Timestmap of the previous timer invocation.
>> +     */
>> +    ktime_t timer_last;
>> +    /**
>> +     * @timer_enabled: Should the internal sampling timer be running.
>> +     */
>> +    bool timer_enabled;
>> +    /**
>> +     * @event_sample: Store freq related counters.
>> +     */
>> +    u64 event_sample[XE_PMU_MAX_GT][XE_PMU_MAX_EVENT_TYPES];
>> };
>>
>> #endif
>> -- 
>> 2.38.1
>>
