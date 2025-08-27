Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0DE2CA0FED
	for <intel-xe@archiver.kernel.org>; Wed, 27 Aug 2025 14:47:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A77C410E83E;
	Wed, 27 Aug 2025 14:47:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ifaKDKPS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD61A10E83E
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Aug 2025 14:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756306027; x=1787842027;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=v92EzATpkfU+E0PywT3C0BDCod0cT67kpbNeYhl18tw=;
 b=ifaKDKPSAYcwNZobrBSooXVeGeHJGDsMn/eiYEc9Twx86pfK1S0V/TuV
 XuGGBok/b5tyGjVDvb5XYoEYRSJGxVKp4EUH66Gqgf75amTwD0oiKbzZ5
 SBqtYnobjrp0qUqTAwyDOMZbXYpZy4Xlb7shJR7ANQTJFISlib5sfPVXA
 6ucdZJX+GbvFprMzIcvZ6W/+Z9fjACQ9FH6eQn4J8kAUvDqrqyyP8LSYS
 3EX4K4r4dzL+vzUvQEv/4vzhSaVC1Mb75wkpSOjUNny3fKVzl2eu6hNs6
 1PXfmcyMZt0TfgjpXAr9/9JYZdQEfMBuV0XxKoMLzvToUurHE484Px+2F w==;
X-CSE-ConnectionGUID: N+HAxYqpSQusURLqjugWZw==
X-CSE-MsgGUID: TNZQ3CeGRZWGSn7iOHbKUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11535"; a="70001045"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="70001045"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2025 07:47:07 -0700
X-CSE-ConnectionGUID: MOsnyibZTsmETR7XPFoNTw==
X-CSE-MsgGUID: /lYKZsHiTnGP6rhkK8qiPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="169456222"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2025 07:47:07 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 27 Aug 2025 07:47:05 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 27 Aug 2025 07:47:05 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.75)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 27 Aug 2025 07:47:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I7OuVpoqrDI3PTQ5dQr0/O8J9r4Mt8AU+0TBipIrY0QX60o1LljT7JO9DonmKeN/4bGsDShmI5gWZahXMxgi094jwDCF5UD8z0pKONAaPtVOTaV7+99+ld+b5oM/XzjaRS1YIdZSZ6Mu3KNA1reyWUHNpRtNIkxDq7GNNPT1skRU9lEb+1PD+/kT9Xc212TF8QOanTevDfr1zAsiWJvtUw5HMgJqaInBUWfrsAMzpGeMdteplcDVKk6MY1pEdfadEDl+jfdXrxp0qYVMMRYRn2qpiUF+rAF5IEopfKcoq0xCvppwMZNQxuSBOHk0vfXgD/1mlGdESEs8YZ+TNH/2TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t4ZZsfmSoiW7or7oQ6E8Gap3LOb+mGpokff9Hz3+MIQ=;
 b=hYdfkzp/wFe1UGjU6JLuPVA4Uh+PH4nNsqxRQONeX2U8qEclX8N7Q5dElqm5413VwOCkl5Djx1sSLOXnLD/YU3Ahq2QIlTsyvH2b64W7RI19tw1qqnMwu6J6jmhi2x5ll4BCLl5QILOfdzosx9ocaIfbZE0bUwhHmgH7Jmzapz74tZan1bBH9yRiAgv0A3NBstFLOzgnrrrltEPCTLxVFvde1qIMrkWUf8qmyd+DPd8eKUrK/Xz2aYvN+l6UWoUGg5LlH7+mkIG91mytjTXJ1fCCxW0/hijevetdlmp1+mtLeVhA1RqC/6fcwcbR3/eonXC13sm3cTqtuo9lRsg/6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9226.namprd11.prod.outlook.com (2603:10b6:208:574::13)
 by PH0PR11MB4839.namprd11.prod.outlook.com (2603:10b6:510:42::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Wed, 27 Aug
 2025 14:47:02 +0000
Received: from IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09]) by IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09%6]) with mapi id 15.20.9052.019; Wed, 27 Aug 2025
 14:47:02 +0000
Message-ID: <862c6172-3308-4a69-baa2-fe984a082269@intel.com>
Date: Wed, 27 Aug 2025 16:46:58 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] drm/xe: Track LR jobs in DRM scheduler pending list
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20250818172243.2649863-1-matthew.brost@intel.com>
 <20250818172243.2649863-4-matthew.brost@intel.com>
Content-Language: en-US
From: "Lis, Tomasz" <tomasz.lis@intel.com>
In-Reply-To: <20250818172243.2649863-4-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VE1PR03CA0010.eurprd03.prod.outlook.com
 (2603:10a6:802:a0::22) To IA3PR11MB9226.namprd11.prod.outlook.com
 (2603:10b6:208:574::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9226:EE_|PH0PR11MB4839:EE_
X-MS-Office365-Filtering-Correlation-Id: efbb8e93-9694-41f5-5687-08dde5789549
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NHM1b1F4bTNxTFBSNW9EWW8zL1doYjF0cmFTYkZWTDhhMmI5RXlTYzF0eWpH?=
 =?utf-8?B?a0Y2aWpIaCtLOGNmb1pEZ1pDSHRRNml0czBqblpaaUxxOFZDT0JscU9tcy9M?=
 =?utf-8?B?d3hDMXhYSmoxUDd5SmVjZXA3L2E5Rm9nc2xscHNvdUpaU2hFRnBydXZPWUxO?=
 =?utf-8?B?SU9lWEJNVWljZ1NhUWtiMWxUak5GT2JKMlpvYUpvbVhnVEZERUY2NTNaTENR?=
 =?utf-8?B?ZTZSYVB2SVVUSVl2bHFNUzE0Q3JwNlo5cmplNllaWW5zaTMxbTJrTkc1SVdV?=
 =?utf-8?B?SEZhbU5QVG9xOUFUQ1M0bTh6M09Mbmc3eTFHSlNKbG9HK1I3Z1czS2d4ekli?=
 =?utf-8?B?N3d0VGtGd3lZUmN6MWZiblh6elRJMHZwT0JmUDZNN1J2RWEvZFZGUCtjQUdJ?=
 =?utf-8?B?a3N3MmxiTHp0anZ4VU1sb2tSeVdMcGNqMEdmbmFTd1llRnlnRnBTQngzU1F4?=
 =?utf-8?B?OU5vZ0pROVRIVWxnTTArQTZsekZ0VVNObkllVitNNWxBUmk3dXl1Y2VNL3ZP?=
 =?utf-8?B?RTFoaFdvYktrOUp1RXlESElmVlV3WldJY2o1NkhlaHlRZFZnMVIzTDRvckJ3?=
 =?utf-8?B?bEc0QVV0d2tzc2lYWk9oTGgzVUwxSEx0NkVINTIvOFdoUXBrRDJwREpnNGp1?=
 =?utf-8?B?UFFSakhMTktBNytaQjlHaVh2bzFydTl4Tlg1VXUyN3pmRkJuNkJuSDJFUldt?=
 =?utf-8?B?Ly9hZTlEMk9QZEdpOEN5dWVONG5hSWk3WmJCTGg0RFBCNTBGbHV0citkWGx3?=
 =?utf-8?B?YVJVYnUzQ3J5d0xZcUhpT29qR0FDTGovNjlUd0M3RDgyZGRDb3EydjZsNFFH?=
 =?utf-8?B?c2xvM1RyYnpManRuWXJTbTVuV0Z0dTlQN29LdXN4alBGenZiaHRwcnhHYlg0?=
 =?utf-8?B?NHYwTnJpMG5aN0l2UTNLWVZxbGJjTmViWWFOcDNCZXdLRjV0TTVJb0JnYUdD?=
 =?utf-8?B?ZUdNb1dZR2czMVhKTDB0UFp5OUViUFNVNlVwK05UZiswS0NXYkNUeUl0eXB0?=
 =?utf-8?B?TnREY24zVmk0enJ4aG1sSjlLMzRKc3o2bEp5dzFtSHhmY1VIeG1tY2VhVjRK?=
 =?utf-8?B?MHNJRmR0L2F3SW1QQTdjcXRqM1FUWnJiUUZYV0tRR2RBR2dqbXRmTmg5NlpZ?=
 =?utf-8?B?M3BNcEhPZVF2aVVPNUd4QlM3ZkQ3ZmM4ajcrM1Z0K2dMNHlQOVZwcFYxdklt?=
 =?utf-8?B?cXh5QVJoWmplb0xkVGRDeW1CckZkKzZvUVhBam9YNXBsTW9RTjlXazc4S1Fu?=
 =?utf-8?B?MkdkaTB4OGRZcUh4d3FwOENnQ0VwbURYcFhVZ3M5N21uYWd1cUd2ZEc2SUJ4?=
 =?utf-8?B?cDdraERsSDdrcFdydWRPN1YwbEpzMXVtVHdFbXlLM0FuamtzYWRkK21OU1dF?=
 =?utf-8?B?R1NOdjJWMXRDVzlVY0UyaER1MWdxYnp3ZFVVTDJnenZWeXQzTUpxOFZHUFR4?=
 =?utf-8?B?YU92WTVnN1hQaDRIL3pQWHhVdkFoT0MvUGlkVktqRVpDZlZHWHU5bjVndTBp?=
 =?utf-8?B?N1BHMlZLeHBoRGx2R01MbXJmTlFoSU1xalliSzdCK09zb3dOOXgzK2QzWk8r?=
 =?utf-8?B?dGVUcktrMHBQczJKMmEraDBTOUxyVjcwaUpSQlVtdFg5YWE0RENNVjFDS2Fp?=
 =?utf-8?B?RWc1Z2N5aDZXSWt1VHVVK214a2R1bFJReXZYdTE4VS9jL29oQ1ZUeDA3aW9S?=
 =?utf-8?B?aDRpL2hIUWNkVnZMU0NheGQ5RXRRRnRJTUdkd2orR2tYMm9URTBnNm9WU2Zn?=
 =?utf-8?B?Yy82RkZZRkN2VWhTa1J0NWhwZ0dmWTZNOHVaeG80RUw5ZnUxbC90dVpwQ1dp?=
 =?utf-8?B?dGtFcWFuM1hnZ3JFSGNseFowRjV6WUJpNFpYbStCQ2hhcTFBdEE2VTVTdjYz?=
 =?utf-8?B?MEtSUkhUOUN4WmxpWDZFcE1idURoQ2FEMUgvVEZhWDk4c21VVmxoVmdWQ05S?=
 =?utf-8?Q?kh3rrt0cB6g=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9226.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TmI0Tzc4NTJaajZSNldXWW5nN3R0TVlLajR3M1ZSUzh1RUdIaHNpUGQzL2FU?=
 =?utf-8?B?Z0Q5MXJMbncwSVFhRFozRWZOMnZ3c1A3RFAybSs0WlNkOWdDemZWWTJ1d1ox?=
 =?utf-8?B?L1lwVTJRdnFhbnpEMGxEdFlycEhJekZ0cmp1bkY2aUZPOWdiUmp5ZnFPZERv?=
 =?utf-8?B?M3hqTGVlL05kSGczaTVpMU5NbnZnUGJGM1YvOVlFbzFxM3QrZlJLUklqdDRi?=
 =?utf-8?B?NkRaSHZIWWxuVCtuRlJmTlBsMG5SWG8yWmdJNUFTZzVMeC9qSVkwVENvWmFJ?=
 =?utf-8?B?ZXZZSUd3ZFpWMW9XRW04L3l6NXZGL0xPMk1qbkdIMzdFc090OWR5TFB2MnZY?=
 =?utf-8?B?LzBqTStIQUQ4MUZ0SkMwZFRVY2N6cDRrcVNIUHJEQU05M1I1MnRzeGdVNzNN?=
 =?utf-8?B?NVlSZjMvdmYxSm1vdE1heWpRak1ZK2RPVXBnYld3Yzc3Uzdrby9RamhCQVVS?=
 =?utf-8?B?cDZmV0c1STJPUTFtRFNJbWNQSERoa3MwSkw3enpRT0txT3lKRGJkOFFWaU5Q?=
 =?utf-8?B?Q2loT0ZJNTQ2TkZlNVpEa3F1TkNUTGZaTHJKc2ZUUGh2aFpDYkgwcHpFL3Z0?=
 =?utf-8?B?U1NRQ0owVFg4Ymw3ZTAzL0JVSFpoQVlwMjJjZ2F6Y2NYa2Nld3lrbnJQa1FM?=
 =?utf-8?B?dE05KzZYdmEzME1KOEpXM1N6NjNIbVlXMG45VHVPSGFwZk9qVU1wSG5hR2FG?=
 =?utf-8?B?MVc1cUx3U0ROb1B5eFdnSlArTWFNZ3F5aFA1bStZNTVrdTlJaEFiZUR3SzhQ?=
 =?utf-8?B?Y2ZKc2IyUHc2bkZEWitTdHhDbmdnak1RcENGMXYwYmxJYnRUMGp3Q3Rwc2o3?=
 =?utf-8?B?cGJaRXJZend4S0dQaEtIeFdhN2RXSDR2eEFTL2JMaXlyVGlsVHBQOG82RUhh?=
 =?utf-8?B?eVpGcEp5UXlxODNwaHZtTUFzby9JcW1TZXR0NzVidzU1Q2hmRWlGVC9wT2lF?=
 =?utf-8?B?ckdWVEdyUzFJVHFrdkRGNFpwVWdYVFgvYktDV05wM2c0SVo2eG0yUVM4OXdJ?=
 =?utf-8?B?WGVIR01jbVk1dDllQUoxUE95a05JY29rMEZmU2t6YUFYRy9UUGpld0FxQWRi?=
 =?utf-8?B?TnhuS1c2R1d4ckdpZ1FzQklXMFpxV3dzMkdSZXZ5L0FEc29yRENtOTFNZnRD?=
 =?utf-8?B?RkFJbi9oK3F6L3ZzWGVsZFZpZ3dVRWhoaEtHdFhjeFZ3TytydDE2TzdiRHI2?=
 =?utf-8?B?OXpndzc0MnBWd3BiZHBSS1gyY04wbXhEdzNQVk9RNkRqK05HeVhxMVQ2VE9r?=
 =?utf-8?B?MnB2b3hwVVFwMnhvVFhiTmVHU2lNelVWWUR6UVN1YW0xSnYweG9oRVRUM0Z3?=
 =?utf-8?B?Q1NtUzJXc2hjSmN0QmVkajdFdHRwdDJnRzlWVituZ0NzVkorclE2aXEvd0M4?=
 =?utf-8?B?aFdhWkZEZzhmbFUveU56elJWZC9IZEdCQ0RuWkRuWkdTZTJnR0NlblRCNElj?=
 =?utf-8?B?ZGtQOTFhYUNUMXpmbjRUZWhaV1pweXZNdTVYZzcvVjVrN01EdXQyRHZUUGE5?=
 =?utf-8?B?dDh5TmxSOG1heFhzOFl6V2cydWxrK256LzNqcFJEdUhlbGxCN1NFTFRXcnNl?=
 =?utf-8?B?aURyaWYzTlZMbzA0TTVDRmVwNExta0x1bHBEbm1hbGo2bmYraC9PRVN2MmRB?=
 =?utf-8?B?L2pJUTAwaFZFYmdkZUpRZWozU21oYjdxWnRMUmxaSVVKZlJ3R29tNnZ2RkJI?=
 =?utf-8?B?bHJ6S0loNFV4L2FrN2xCbTl0RTRvU1NRRGl5cFdRZThacVdqLzg1eDhEd211?=
 =?utf-8?B?MURDQWR6azh4Z2Mwa0RWN0U5RDNjU0ZsTG9kQURZMldzb2I1RHNSSHNDRGVt?=
 =?utf-8?B?NGd4SjBodSt0ZHVWOXU3UDRiK2cyS3MrY1R2RjQ3KzlBNWc4S2JLWFl0TFN5?=
 =?utf-8?B?Qysxcm05OHpWZWtoYkdFSnJjR2VCWFJOZngvSEh2Tk0vcEo4czFRcmZkTkhh?=
 =?utf-8?B?NkVKQUpFK2o3SFJWTkF3Mm5SNXBkU0NzY0ZJUlI5bU5NdlNjcTQyNE5RV0tQ?=
 =?utf-8?B?dUhmUDNRakJYeWYrNEY4Z0tLUTNndWFHWDNsdXAvWkpDU0h5YTBZQmMyR3Uw?=
 =?utf-8?B?R250UnFEbU1uNUp4NjFlRHRFTTJvcmhCaiszeUJmK3owZjkyMzJVaHlxQmxE?=
 =?utf-8?Q?G8xSSKcfq5IFxGmGz3VsD4vQu?=
X-MS-Exchange-CrossTenant-Network-Message-Id: efbb8e93-9694-41f5-5687-08dde5789549
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9226.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 14:47:02.2110 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F2bTRg2nt9DOxKbt7pA1JMAC8910Z3UGDEt+PmFhhHD80VDcVKXahsI4CjiegjRW6K1ksaRIlwvKSv+0Ky2OJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4839
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


On 8/18/2025 7:22 PM, Matthew Brost wrote:
> VF resume

VF migration

>   requires jobs to remain pending so they can be replayed after
> the VF comes back. Previously, LR job fences were intentionally signaled
> immediately after submission to avoid the risk of exporting them, as
> these fences do not naturally signal in a timely manner and could break
> dma-fence contracts. A side effect of this approach was that LR jobs
> were never added to the DRM scheduler’s pending list, preventing them
> from being tracked for later resubmission.
>
> We now avoid signaling LR job fences and ensure they are never exported;
> Xe already guards against exporting these internal fences. With that
> guarantee in place, we can safely track LR jobs in the scheduler’s
> pending list so they are eligible for resubmission during VF resume
VF restore / VF post-migration recovery
>   (and
> similar recovery paths).
>
> An added benefit is that LR queues now gain the DRM scheduler’s built-in
> flow control over ring usage rather than rejecting new jobs in the exec
> IOCTL if the ring is full.
>
> v2:
>   - Ensure DRM scheduler TDR doesn't run for LR jobs
>   - Stack variable for killed_or_banned_or_wedged
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_exec.c       | 12 ++-------
>   drivers/gpu/drm/xe/xe_exec_queue.c | 19 -------------
>   drivers/gpu/drm/xe/xe_exec_queue.h |  2 --
>   drivers/gpu/drm/xe/xe_guc_submit.c | 43 ++++++++++++++++++++----------
>   4 files changed, 31 insertions(+), 45 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
> index 44364c042ad7..b29b6edd59e0 100644
> --- a/drivers/gpu/drm/xe/xe_exec.c
> +++ b/drivers/gpu/drm/xe/xe_exec.c
> @@ -117,7 +117,7 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>   	u32 i, num_syncs, num_ufence = 0;
>   	struct xe_sched_job *job;
>   	struct xe_vm *vm;
> -	bool write_locked, skip_retry = false;
> +	bool write_locked;
>   	ktime_t end = 0;
>   	int err = 0;
>   	struct xe_hw_engine_group *group;
> @@ -256,12 +256,6 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>   		goto err_exec;
>   	}
>   
> -	if (xe_exec_queue_is_lr(q) && xe_exec_queue_ring_full(q)) {
> -		err = -EWOULDBLOCK;	/* Aliased to -EAGAIN */
> -		skip_retry = true;
> -		goto err_exec;
> -	}
> -
>   	if (xe_exec_queue_uses_pxp(q)) {
>   		err = xe_vm_validate_protected(q->vm);
>   		if (err)
> @@ -318,8 +312,6 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>   		xe_sched_job_init_user_fence(job, &syncs[i]);
>   	}
>   
> -	if (xe_exec_queue_is_lr(q))
> -		q->ring_ops->emit_job(job);
>   	if (!xe_vm_in_lr_mode(vm))
>   		xe_exec_queue_last_fence_set(q, vm, &job->drm.s_fence->finished);
>   	xe_sched_job_push(job);
> @@ -344,7 +336,7 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>   	drm_exec_fini(exec);
>   err_unlock_list:
>   	up_read(&vm->lock);
> -	if (err == -EAGAIN && !skip_retry)
> +	if (err == -EAGAIN)
>   		goto retry;
>   err_hw_exec_mode:
>   	if (mode == EXEC_MODE_DMA_FENCE)
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 2d10a53f701d..6f901139e06e 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -816,25 +816,6 @@ bool xe_exec_queue_is_lr(struct xe_exec_queue *q)
>   		!(q->flags & EXEC_QUEUE_FLAG_VM);
>   }
>   
> -static s32 xe_exec_queue_num_job_inflight(struct xe_exec_queue *q)
> -{
> -	return q->lrc[0]->fence_ctx.next_seqno - xe_lrc_seqno(q->lrc[0]) - 1;
> -}
> -
> -/**
> - * xe_exec_queue_ring_full() - Whether an exec_queue's ring is full
> - * @q: The exec_queue
> - *
> - * Return: True if the exec_queue's ring is full, false otherwise.
> - */
> -bool xe_exec_queue_ring_full(struct xe_exec_queue *q)
> -{
> -	struct xe_lrc *lrc = q->lrc[0];
> -	s32 max_job = lrc->ring.size / MAX_JOB_SIZE_BYTES;
> -
> -	return xe_exec_queue_num_job_inflight(q) >= max_job;
> -}
> -
>   /**
>    * xe_exec_queue_is_idle() - Whether an exec_queue is idle.
>    * @q: The exec_queue
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h b/drivers/gpu/drm/xe/xe_exec_queue.h
> index 15ec852e7f7e..6ae11a1c7404 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.h
> @@ -64,8 +64,6 @@ static inline bool xe_exec_queue_uses_pxp(struct xe_exec_queue *q)
>   
>   bool xe_exec_queue_is_lr(struct xe_exec_queue *q);
>   
> -bool xe_exec_queue_ring_full(struct xe_exec_queue *q);
> -
>   bool xe_exec_queue_is_idle(struct xe_exec_queue *q);
>   
>   void xe_exec_queue_kill(struct xe_exec_queue *q);
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 9e4118126ef9..69ed3c159d10 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -837,30 +837,31 @@ guc_exec_queue_run_job(struct drm_sched_job *drm_job)
>   	struct xe_sched_job *job = to_xe_sched_job(drm_job);
>   	struct xe_exec_queue *q = job->q;
>   	struct xe_guc *guc = exec_queue_to_guc(q);
> -	struct dma_fence *fence = NULL;
> -	bool lr = xe_exec_queue_is_lr(q);
> +	bool lr = xe_exec_queue_is_lr(q), killed_or_banned_or_wedged =
> +		exec_queue_killed_or_banned_or_wedged(q);
>   
>   	xe_gt_assert(guc_to_gt(guc), !(exec_queue_destroyed(q) || exec_queue_pending_disable(q)) ||
>   		     exec_queue_banned(q) || exec_queue_suspended(q));
>   
>   	trace_xe_sched_job_run(job);
>   
> -	if (!exec_queue_killed_or_banned_or_wedged(q) && !xe_sched_job_is_error(job)) {
> +	if (!killed_or_banned_or_wedged && !xe_sched_job_is_error(job)) {
>   		if (!exec_queue_registered(q))
>   			register_exec_queue(q, GUC_CONTEXT_NORMAL);
> -		if (!lr)	/* LR jobs are emitted in the exec IOCTL */
> -			q->ring_ops->emit_job(job);
> +		q->ring_ops->emit_job(job);
>   		submit_exec_queue(q);
>   	}
>   
> -	if (lr) {
> -		xe_sched_job_set_error(job, -EOPNOTSUPP);
> -		dma_fence_put(job->fence);	/* Drop ref from xe_sched_job_arm */
> -	} else {
> -		fence = job->fence;
> -	}
> +	/*
> +	 * We don't care about job-fence ordering in LR VMs because these fences
> +	 * are never exported; they are used solely to keep jobs on the pending
> +	 * list. Once a queue enters an error state, there's no need to track
> +	 * them.
> +	 */
> +	if (killed_or_banned_or_wedged && lr)
> +		xe_sched_job_set_error(job, -ECANCELED);
>   
> -	return fence;
> +	return job->fence;
>   }
>   
>   /**
> @@ -926,7 +927,8 @@ static void disable_scheduling_deregister(struct xe_guc *guc,
>   		xe_gt_warn(q->gt, "Pending enable/disable failed to respond\n");
>   		xe_sched_submission_start(sched);
>   		xe_gt_reset_async(q->gt);
> -		xe_sched_tdr_queue_imm(sched);
> +		if (!xe_exec_queue_is_lr(q))
> +			xe_sched_tdr_queue_imm(sched);
>   		return;
>   	}
>   
> @@ -1018,6 +1020,7 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
>   	struct xe_exec_queue *q = ge->q;
>   	struct xe_guc *guc = exec_queue_to_guc(q);
>   	struct xe_gpu_scheduler *sched = &ge->sched;
> +	struct xe_sched_job *job;
>   	bool wedged = false;
>   
>   	xe_gt_assert(guc_to_gt(guc), xe_exec_queue_is_lr(q));
> @@ -1068,7 +1071,16 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
>   	if (!exec_queue_killed(q) && !xe_lrc_ring_is_idle(q->lrc[0]))
>   		xe_devcoredump(q, NULL, "LR job cleanup, guc_id=%d", q->guc->id);
>   
> +	xe_hw_fence_irq_stop(q->fence_irq);
> +
>   	xe_sched_submission_start(sched);
> +
> +	spin_lock(&sched->base.job_list_lock);
> +	list_for_each_entry(job, &sched->base.pending_list, drm.list)
> +		xe_sched_job_set_error(job, -ECANCELED);
> +	spin_unlock(&sched->base.job_list_lock);
> +
> +	xe_hw_fence_irq_start(q->fence_irq);
>   }
>   
>   #define ADJUST_FIVE_PERCENT(__t)	mul_u64_u32_div(__t, 105, 100)
> @@ -1139,7 +1151,8 @@ static void enable_scheduling(struct xe_exec_queue *q)
>   		xe_gt_warn(guc_to_gt(guc), "Schedule enable failed to respond");
>   		set_exec_queue_banned(q);
>   		xe_gt_reset_async(q->gt);
> -		xe_sched_tdr_queue_imm(&q->guc->sched);
> +		if (!xe_exec_queue_is_lr(q))
> +			xe_sched_tdr_queue_imm(&q->guc->sched);
>   	}
>   }
>   
> @@ -1197,6 +1210,8 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>   	int i = 0;
>   	bool wedged = false, skip_timeout_check;
>   

Maybe a comment here would make sense? ie:

/* Timeouting a LR job could signal its dma_fence after contracted max 
wait time */

The code itself, LGTM.

-Tomasz

> +	xe_gt_assert(guc_to_gt(guc), !xe_exec_queue_is_lr(q));
> +
>   	/*
>   	 * TDR has fired before free job worker. Common if exec queue
>   	 * immediately closed after last fence signaled. Add back to pending
