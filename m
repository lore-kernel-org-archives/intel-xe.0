Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D72F8CA0ED1
	for <intel-xe@archiver.kernel.org>; Mon, 18 Aug 2025 15:03:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C17810E468;
	Mon, 18 Aug 2025 15:03:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="btjOai2V";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01C6910E1EA
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Aug 2025 15:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755529421; x=1787065421;
 h=message-id:date:from:subject:to:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=E6/KGoEv2ODQOA+GRpuq/AvsPTY0taN+Wog9cU4IE1g=;
 b=btjOai2VBvTRqRxCMtp6IMCPnLmMHXCm7eZmA3Wroi8DWI6ZxNwyPQv2
 35FY6vAM9FZQA5Hc+Vg9Z24l7zzgWVe8Hts+a7/VuXcvF8kOllEtsrLR3
 Ojw97MPEUMzTqoURbDwdXsYNviLaxh4rs3ZHtt993DoZ6+VshFMv3VXny
 qqpCyqre8loVOkXy8lyWVpbmv/F/TMMCnITOGJ0pSQkZ7zLLViukFC9sr
 RScbvTnUkrzNr3Yf+sb/67TaB2c7UMadqTxwidzdor/Ww5g4tA0hUchf4
 ReVJkoWHc1wX5NHMEiXRETkxhY0lxs53nh+J5T2zge5b1Q4zHulpkCJ70 g==;
X-CSE-ConnectionGUID: bjQbzbhlSSmiPDZPDl7odQ==
X-CSE-MsgGUID: NIb0lsRfR6CExfEY+iZM4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="60378978"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; d="scan'208";a="60378978"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2025 08:03:41 -0700
X-CSE-ConnectionGUID: NlPyjORKRGSbJOylQuz2VA==
X-CSE-MsgGUID: 0mHTAbAUTPi1U6rVp4e30g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; d="scan'208";a="166827699"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2025 08:03:40 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 18 Aug 2025 08:03:39 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 18 Aug 2025 08:03:39 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.78)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 18 Aug 2025 08:03:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d+zsRjTTnw9EseZk0Fb6jej/0OSjV6uqpwIU0bHrkoEdm8w3cHM5eLCMPdkXuX/GU6USvGW9op6Trv6KTnJtyR5/2sFwq0oQEIZkCjxQzs1yLxoDNGiWZbuvelzT5qQ+oWpYHe4tIvZ+pWuBCu28sdjQz2AFsmZo8KUgqVY+r3HX2itlbAgnpjSQezQwHpgVoYvULk40O3PdFcZEErhbSsdOCrJOqKU3rrfBMW/3IyANkjijDFCoQGaombNaIBsNQpmBR0HOJ20mZRJMsQh40+Tye3Wt70dWsrLoJad9m3YK+SoxSNvHL1XJ0s51fgbE+PdfYaMW70II4znQ4s9T/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eyoHaaPynF22QtJOArDsui4qcYK6KeQt2iUBJskdiu4=;
 b=ZAgf2qrczVq9CpTWMYm5wikk3x9Qyg4Gl0flFrDnwBMAACbdGKy2RtGhgOJG+Pf2nbF8xU+O1vV54AsPHMw82JcG0SujX64eAVOuxENnVK00Fb/+AWK4SxKXDyVZ5k2ZpOty+7iy7X5hG3Tr4UJfBBqNyrG/zbM8bHWLQZ86ze4QGJLE1hTv8lICCOvm3rXHSAypdJLbK3VJtFgnQQYFd7pit0PWtHlHjM0uGd9uytePytj7B91m24n590cWeM4KYOl43+Jlb6n4MXpkwx6yydFbQe3tHxdXz6HFuxyRMEBo7ZKPsXr+KWio6oKnJas/1l4ibsUoiQi2a0MVi9Xawg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by SJ5PPF0DADD6EFE.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::80d) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.21; Mon, 18 Aug
 2025 15:03:38 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%4]) with mapi id 15.20.9031.023; Mon, 18 Aug 2025
 15:03:38 +0000
Message-ID: <0eedab5a-7365-4465-a2bd-d1f2d226993f@intel.com>
Date: Mon, 18 Aug 2025 11:03:35 -0400
User-Agent: Mozilla Thunderbird
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
Subject: Re: [PATCH v6 1/6] drm/xe/guc: Add log init config abi definitions
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20250722013553.1266218-1-zhanjun.dong@intel.com>
 <20250722013553.1266218-2-zhanjun.dong@intel.com>
 <5296f505-ae99-45bd-904b-e0c6296546d3@intel.com>
Content-Language: en-US
In-Reply-To: <5296f505-ae99-45bd-904b-e0c6296546d3@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR03CA0288.namprd03.prod.outlook.com
 (2603:10b6:303:b5::23) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|SJ5PPF0DADD6EFE:EE_
X-MS-Office365-Filtering-Correlation-Id: c8a6cf79-d377-4971-3927-08ddde68690c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SHdqZURNMU5OMG8yQkhoS3hTaHdobFlGeFN5U1Exa0hRc2tYbkZFUDZQSW8x?=
 =?utf-8?B?WXFuWmExcVhEc2NGWXQrNCtPMWtXaytBbnc3eGFTNVU1cjE1b3hnc2wvakVM?=
 =?utf-8?B?b1hWM2FYZTBYQ3Boa21hQW54K0hmUnQ3N1pUS2lsbWV5SGtTVy9qMHAxNmk1?=
 =?utf-8?B?UFdkQmd0NUR1cVRNVHVXZm5YSTdSei9YcHNPV2YwaUVZMHViSXBKVmpqbi9j?=
 =?utf-8?B?Q2J1a1hQY0dpUVZmRkgzTG5TQ2RFSXhZZlNHLzAwdWlTRFg4MnlEOHNBTWsx?=
 =?utf-8?B?dDh1SUJMK2ZWbEd1R0dtTHNPSVI3OTJvN1lvZTRnVnc0MHZNcGFNdGN6K1Zq?=
 =?utf-8?B?bFlLWFdoZno2elpnOXd3MHRIYmFJLzQvYVNKVFJkTjBkU3hxNGNoNGNhR0JR?=
 =?utf-8?B?WlRvbE9lazQ2V3lDNzcyeHVRYmpheUo2QTdKczFlbjdFNFpmYThVd0haaGlv?=
 =?utf-8?B?TFNqVE9IM3R2c3N6aXVZMTRXV2d4eDZzVmEwTDVOWVZXbURvY21xQnNrdVhs?=
 =?utf-8?B?UjJGRGM5L0lyQS9MUjFMUjc1ZnhNelpOMDdrUHlrd0c4Z21GQVZoazJFOGRC?=
 =?utf-8?B?UkdqVmlWKzJrMTRPOTRsMTY0ZGF1SThBeWptbVlZYXhJQmVYcTR5OGZwQnRx?=
 =?utf-8?B?Zk1GenVLblFjc0MzYUVaUnl2SEEvMzdhanJ0bnhSUzc5Qkk0N1RKR3dRQ3pB?=
 =?utf-8?B?Z3Zwekw0Ui80QkZjVzZmTDQyUjN0dkZTK29wU0V1NTM2TWZYcWpYOTF0U0Vk?=
 =?utf-8?B?bUo1eTBMOVZzL090TWY3NmVvTmJqcnVpTG96YURTeWFLZzE1VmlMMU4yTXQ1?=
 =?utf-8?B?eVhyV0YySHBrWEdTeFFZbVdNY2hENW9sb3phaXhmOE8wVE1WcEdGS3dtSW1H?=
 =?utf-8?B?MG5JUk56cktxVEJmcHRwTXI0aXlKZ05yUUhjZFBxMjIyUTd5ck1xRC93aWhi?=
 =?utf-8?B?RzJxcS9IOVpONWRDMzU5c2xMQStoVm5aWit2aTN1alpsSWxHV0Q1SFNTMFR0?=
 =?utf-8?B?UEsrTTlYenZPU25JNGJvdDMyenY1UGlzbUpTTDVyWk9SU0R4UTdEQ3hpdHRw?=
 =?utf-8?B?dks0djkyRStsNnhrWW56TC80WW1NWU1Ca2w4TEdaZWhBdmNFYzljS0ZVdW5K?=
 =?utf-8?B?RWJvS1lOb3hRaVFiL0ZXTHM4Y1FKYVo2cG1oNjNHZG9TOTk5b2VIeE1mR2M4?=
 =?utf-8?B?VUFwSkFrYk5jS2kzRysvQ2Y2UHpBUGhOby9lMUd1Rjd6RzVWM0JFZW1BcTlM?=
 =?utf-8?B?QVczN2pncmtmaUVSTVBjWGw4NG5NWnc0THpoVUs1bTExSFFzYndJNWVJMGJM?=
 =?utf-8?B?T245Wnp2R1l3ZFJnMllzK01XZ2laZTk2UWdLc1RCUitmUVczc2l2WnZPZzZW?=
 =?utf-8?B?S3FNMFo4YUpNUjlMNnl1YWh1K2l0cU5ZdlkxQ0dyajFDTUF4OXdTNmNVU09E?=
 =?utf-8?B?eGt3d2dyRjJxQWlSSXVYZnlJeEVGNVNvNmV3SVR5VXh6U3IxOTlTRDYzYzVD?=
 =?utf-8?B?Nm0zRGxDSi9QRU5nWlNhNE9JQmNnVmEyV0lJYzZRbUJHVEZYb2g1YlBJa2Z0?=
 =?utf-8?B?d1M0V3RLSWgveG8wWVgzNTFKNkRDVXZMa3poa2ZRVmhyUXh2cHhOTDRIQkJQ?=
 =?utf-8?B?N3ozWnlCQnAyN2lHTHhaaEtMUkNSbVBodWZOMXhncmx3WHdlYmliN0Raci9o?=
 =?utf-8?B?V2t4ZW1iZGYwS0dUcVFpbnU5eTR2OFF3Yk9UR3JHd1MyS2RUbUg4TVdqaXpU?=
 =?utf-8?B?WnlKTlVVa3dSR3FvY0xZRTRZNkVNdE0vQW8vTzJZZllSVUhUVStaVHhqZVZ3?=
 =?utf-8?B?WHZKVXFCVFA2OW5yd2drTTZPY0FTRTZ6MFlud1VDZlpVakVIcFFvWHdSb0FN?=
 =?utf-8?B?SjBwditobVJkVkRsa0FzSUErbFZsM3FlTUtIZUpTNklLeVZxczVyaFg4Vmp4?=
 =?utf-8?Q?tRwomYoiwhc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bVRQZyt4QU1ob1phZFBrcGtteUhCbDREaDBYS25mUy82Y1FwUjhGUWN3UnZX?=
 =?utf-8?B?MHQwUU9YQ3cwcWFZemZEQWVYeVd6aEFmUDRtKytCMGpkMzVOSThkc1RqVGRo?=
 =?utf-8?B?U0pFbnNySHJCejByR0t0TW5xcHBNNU5DNGRFMU1BN25hREt5djV6YktYWm5w?=
 =?utf-8?B?bUxwckdwRWtZOEtUVERQOGhXRGRWenBZcStkRUFqTGl2ejNYL0EvKzErWHpD?=
 =?utf-8?B?VFdZQkhQTHpxZWd1ZElDS1k1WXh2MitwYW5CS1FNQW9uK2c3RWhYVWRRajF4?=
 =?utf-8?B?ejN5M2R3MTVPSVJBb2twRmY2NmUzTnJOODZzSURFazYwajFrVG04UjRiVnBy?=
 =?utf-8?B?M0VzZlByTjJMSWRTdFpsYm53R0dicmx1alhDMjJRamxJTnhOWGJIQk9RZHFw?=
 =?utf-8?B?L1dnVDB0a0ppRFI3QitpTVZna1gzMWdBTko0b1pCVE9pd3ZYUEt0dlZWSDE5?=
 =?utf-8?B?Zjlpd3dMUjdIbWRtQ2w5enM3ZnFyRHZYRzVkUXdWaXc5Z2VpYnhBU3h2SHdL?=
 =?utf-8?B?U1ZRdDM2TTVSVldlUWVubUlGVEtROE9YanZiTEI0dm0rVzBCRHB4NU80QXJy?=
 =?utf-8?B?cEtxL0E3eGlBMDNpZVYvWWdab2RHZjRqc0Vhcmh3amFCWSt5Y1ptOHExQWlM?=
 =?utf-8?B?YjRIb1UrUy96RXduQXlxYy9sN2pRaVpoK0lJak5qTjRnbkdLemo4cmNwZlY3?=
 =?utf-8?B?WnllMWgzRU4wOE9yRUg3MmVieG8xSzB1UHJ4MHpxaHpMVlBCN29DN3p3RzVj?=
 =?utf-8?B?cEEwVXpuRkNlVC83OGt1YktpdDB3OE92bTZsdnp6YzcwWGNnK1dMQ0F6VEF4?=
 =?utf-8?B?OHhyUEpGb2dUSWczcGp3RHk4dXM2elUrMS9lU2RDRXgrR3UzMHN2RXVROGp2?=
 =?utf-8?B?TmVoazVaZytpOVJmTG1RVHhoZ3JmaTJPUG96cm9obHovTVR3WG55cmtxazhV?=
 =?utf-8?B?dTkzRzVwVTVWQ2M3cGJSMEdISTJpcElhK2RqcnhsSmNoTGVEeW5WV3JrSzNN?=
 =?utf-8?B?OHRLVW1LMHkwa201K2dBcXlaN0lzSFVJSm1ja3diM2tPaDJzSm5aZVZTUSt0?=
 =?utf-8?B?bUJhS1duTzgraGFEK2xvRVM0T2RyOTZUSG8rd1llZk5mWENNcFNGc0p1Z1hp?=
 =?utf-8?B?aitKcXNzbnRjY2o5bmFXQ3IzNFF4QUI2TlpvR1lUYkYzZkNMRkZwbmdHK1dG?=
 =?utf-8?B?MkczOGRKOFA5Z2w4NVVmSk1hNjg5RHBYT0NBVHY5OEcrSjBSYVVZc3BSY0VH?=
 =?utf-8?B?Yzl4a3dzNHNVSkFpM3R0MG53b2REWFg5cm1IczJWUmt2QXhBY2JMZkU3aVd0?=
 =?utf-8?B?Nk5MeFNCNnRBSGhjNzNJKzdxU3plQjZZbGZsSm9oU3llZHQvb0ZNcXJjSFRC?=
 =?utf-8?B?akFBcE5hK2UyTUdhUklZU2J5cThlbjJpaDhvUjhBL29vU0l3S29FcDVrU0hT?=
 =?utf-8?B?YVFSTFhudmcvVVZ1YnBIWkp4OEtNdFV0RVc4QXRBT0FiVWp0TENsc1NuNlpE?=
 =?utf-8?B?bStsMk9ob2FoYWlWQkowdDdxaWNlTDJGY3IvNkFiQm1ZQWkxbExkVFhVSGlq?=
 =?utf-8?B?OGJ3S1BiZDE3YmpzY0s0R21meDI3cFozNWRGT2VUUlZabjI3MGhHUkJ5b1Ux?=
 =?utf-8?B?YUtNT2NUNit6SnB3NFAzMkxMNkd0aFpHbkhITWFUTFNiLys3MmVpeFVSMGcx?=
 =?utf-8?B?RHEyeVdCUXVOVC9HVXlsZHJuRkEydlFhZEJNbUhxVHovWkRRT3o0SWl5TGht?=
 =?utf-8?B?WENFZWZ3T1VrdTBSd01BcXFRUWxwZlJLb3h6dTExNDZNYWxJQXNMYmlVenBy?=
 =?utf-8?B?VHV6Y3JndjFDWHpuN1hWQnpWQ2EyV0NHTi9LVk1rUVFQSUtUc2ZZREJUMnF5?=
 =?utf-8?B?bTM3ampRU3RoWnRNN0tpWFhIeWZXMXFxSWdFSisxUk45eklGc3VFWmk1bHVZ?=
 =?utf-8?B?Um1NSFZiMXlOQ1kvUkZsY2lkOGdhZGdQcnBrRlYxN3ZhTUdib09WVE5aVlU1?=
 =?utf-8?B?UVZ6VEk1NkdvdTBpb1JCNkIzcG5ld0FjMS9mQXhPcWJoc0d2cURjTy9LVXdW?=
 =?utf-8?B?NVhqRFg2ZDBjczl5NVd6WGZhT2xpRkRIcEZmNWwvWXR3TWdNNGgwZFBaVkdM?=
 =?utf-8?B?MkxuWk9OemxIU21LMG9UNDlmKzhGcm1GYUIzT045S0hDMUhISm9tT2hTTnVw?=
 =?utf-8?B?SWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c8a6cf79-d377-4971-3927-08ddde68690c
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2025 15:03:37.9524 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sbk5OiWRjKTWUnaeycBAzg74+BfrBP1OkGr5+brpHBI2+jtspz02pzEWtM7eO/tER3iLahePcJe2dFXozE9Jww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF0DADD6EFE
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



On 2025-07-29 1:40 p.m., Michal Wajdeczko wrote:
> 
> 
> On 7/22/2025 3:35 AM, Zhanjun Dong wrote:
>> Add GuC log init config (LIC) ABI definitions.
>>
>> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
>> ---
>>   drivers/gpu/drm/xe/abi/guc_lic_abi.h | 107 +++++++++++++++++++++++++++
>>   1 file changed, 107 insertions(+)
>>   create mode 100644 drivers/gpu/drm/xe/abi/guc_lic_abi.h
>>
>> diff --git a/drivers/gpu/drm/xe/abi/guc_lic_abi.h b/drivers/gpu/drm/xe/abi/guc_lic_abi.h
>> new file mode 100644
>> index 000000000000..a4e27da304cd
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/abi/guc_lic_abi.h
>> @@ -0,0 +1,107 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2025 Intel Corporation
>> + */
>> +
>> +#ifndef _ABI_GUC_LIC_ABI_H_
>> +#define _ABI_GUC_LIC_ABI_H_
>> +
>> +#include <linux/types.h>
>> +
>> +/** enum guc_lic_type - Log Init Config TLV IDs. */
>> +enum guc_lic_type {
>> +	/**
>> +	 * @GUC_LIC_TYPE_GUC_SW_VERSION: GuC firmware version. Value
>> +	 * is a 32 bit number represented by guc_sw_version.
>> +	 */
>> +	GUC_LIC_TYPE_GUC_SW_VERSION = 0x1,
>> +	/**
>> +	 * @GUC_LIC_TYPE_GUC_DEVICE_ID: GuC device id. Value is a 32
>> +	 * bit.
>> +	 */
>> +	GUC_LIC_TYPE_GUC_DEVICE_ID = 0x2,
>> +	/**
>> +	 * @GUC_LIC_TYPE_TSC_FREQUENCY: GuC timestamp counter
>> +	 * frequency. Value is a 32 bit number representing frequency in
>> +	 * kHz. This timestamp is utilized in log entries, timer and
>> +	 * for engine utilization tracking.
>> +	 */
>> +	GUC_LIC_TYPE_TSC_FREQUENCY = 0x3,
>> +	/**
>> +	 * @GUC_LIC_TYPE_GMD_ID: HW GMD ID. Value is a 32 bit number
>> +	 * representing graphics, media and display HW architecture IDs.
>> +	 */
>> +	GUC_LIC_TYPE_GMD_ID = 0x4,
>> +	/**
>> +	 * @GUC_LIC_TYPE_BUILD_PLATFORM_ID: GuC build platform ID.
>> +	 * Value is 32 bits.
>> +	 */
>> +	GUC_LIC_TYPE_BUILD_PLATFORM_ID = 0x5,
>> +};
>> +
>> +/**
>> + * struct guc_sw_version - This structure describes the full version of a
>> + * software component.
>> + */
>> +struct guc_sw_version {
>> +	/** @dw0: A 32 bits dword, contains multiple bit fields */
>> +	u32 dw0;
>> +#define GUC_SW_VERSION_PATCH_VERSION		GENMASK(7, 0)
>> +#define GUC_SW_VERSION_MINOR_VERSION		GENMASK(15, 8)
>> +#define GUC_SW_VERSION_MAJOR_VERSION		GENMASK(23, 16)
>> +#define GUC_SW_VERSION_BRANCH_ID		GENMASK(31, 24)
> 
> in other places we start with MSB definitions first
Sure, np

>> +} __packed;
>> +
>> +/**
>> + * struct guc_lic_format_version - Log Init Config Structure Version.
> 
>      *
> 
>> + * Major-Minor is not a fractional number (i.e. Ver 1.3 would be older
>> + * than 1.12)
>> + */
>> +struct guc_lic_format_version {
>> +	/** @dw0: A 32 bits dword, contains multiple bit fields */
>> +	u32 dw0;
>> +	/*
>> +	 *  Log-Init-Config structure minor version. Must be
>> +	 * GUC_LIC_FORMAT_VERSION_MASK_MINOR
> 
> you likely mean GUC_LIC_FORMAT_VERSION_MINOR here
> 
> and likely the guc_lic_format_version shall be defined first as all
> other definitions depends on this being 1.0, right?
Sure, will move the version define ahead

>> +	 */
>> +#define GUC_LIC_FORMAT_VERSION_MASK_MINOR		GENMASK(15, 0)
>> +	/*
>> +	 *  Log-Init-Config structure major version. Must be
>> +	 * GUC_LIC_FORMAT_VERSION_MASK_MAJOR
> 
> GUC_LIC_FORMAT_VERSION_MAJOR
> 
>> +	 */
>> +#define GUC_LIC_FORMAT_VERSION_MASK_MAJOR		GENMASK(31, 16)
> 
> again, start with MSB first
> 
>> +} __packed;
>> +
>> +/**
>> + * struct guc_lic - GuC lic (Log-Init-Config) structure.
> 
> s/GuC lic/GuC LIC
> 
>      *
>> + * This is populated by the GUC at log init time and is located in the log
>> + * buffer as per the Log Buffer Layout (In Memory). The array of guc log
>> + * buffer states plus this structure must not exceed 4KB
>> + */
>> +struct guc_lic {
>> +	/**
>> +	 * @magic: A magic number set by GuC to identify that this
>> +	 * structure contains valid information: magic = GUC_LIC_MAGIC.
>> +	 * Used to verify the information in this structure is valid.
> 
> hmm, last sentence is redundant, please rephrase
> 
>> +	 */
>> +	u32 magic;
>> +#define GUC_LIC_MAGIC			0x8086900D
>> +
>> +	/**
>> +	 * @version: The version of the this structure. Represented by
>> +	 * guc_lic_format_version
>> +	 */
>> +	struct guc_lic_format_version version;
>> +#define GUC_LIC_FORMAT_VERSION_MAJOR	1u
>> +#define GUC_LIC_FORMAT_VERSION_MINOR	0u
> 
> those defs should be closer to struct guc_lic_format_version
> where they are already referenced in description
> 
>> +
>> +	/** @dw_size: Number of Dws the `data` array contains. */
> 
> s/Dws/DWs or DWORDs or dwords but not Dws
>> +	u32 dw_size;
> 
> hmm, still dw_size name is suggesting something else...
> maybe "@data_size: Number of dwords in the @data array"
> 
> or data_count or data_len
Will be changed to data_count, as it not size, but the count of dwords

>> +	/**
>> +	 * @data: Array of dwords representing a list of LIC KLVs of
>> +	 * type guc_klv_generic with keys represented by guc_lic_type
>> +	 */
>> +	u32 data[] __counted_by(dw_size);
>> +} __packed;
>> +
>> +#endif
> 

