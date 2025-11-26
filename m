Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 401EAD111B6
	for <intel-xe@archiver.kernel.org>; Wed, 26 Nov 2025 23:06:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDFD210E72E;
	Wed, 26 Nov 2025 23:06:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GRT7Ya44";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AC5D10E72E
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Nov 2025 23:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764198367; x=1795734367;
 h=message-id:date:from:subject:to:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=t7Pd1ijNg4sTwKLxjdHhkDWPQ2zWZdfiYi6yDn+2byQ=;
 b=GRT7Ya44RCZQr62ACVr2m94Kb/JVt5xU2Le036tyaoZBPIF3XIdmmxDj
 useKMw5TPyB0T07dhPe7A+BeYzsBgmoLlY3X+6CNphIwrBiStSDuACbWn
 LbPPTFf2Du5i9tc7jkN8X/nfmd13cM9okxxf7ajdqeFfnCe4ZJZHnmQDU
 Vo2CdHu2gmict2Ehx5XyWbh//KUeTCckMUTS23SiKUN2UWjb+c4i2AU2p
 oxRRxInQHLaOmVKxgHk0p7c94OtrP04sXiQvnqacHqz8Qy9AekpkFL6+e
 rsewYq9MF44z+0VEEEylGOBKtxChCuVpEa25mEf840218iWNTwenYpAWF A==;
X-CSE-ConnectionGUID: 5qSabczzR426M55V/4MVVw==
X-CSE-MsgGUID: X+0fi1hjQgWu1bwyof3mEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="68838845"
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; d="scan'208";a="68838845"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 15:06:07 -0800
X-CSE-ConnectionGUID: QeBV+Dc4TIenvXACSkrO+g==
X-CSE-MsgGUID: /R4iM4ngRKydFIknuk5/Hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; d="scan'208";a="197225193"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 15:06:06 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 26 Nov 2025 15:06:06 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 26 Nov 2025 15:06:06 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.50) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 26 Nov 2025 15:06:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LMKhGR7z8DdZKmTOn0pGWW/6z91HhENDh/XVF/BomzzksgFMiB/PL/7aOEfUcZhXjPoIuVkpG0cGOvmu/5tNgDvPnENJYorqQa9duCIMurUcb2T1phQT3raAihEA3ocOT68tcBrSw6cFPPhf8YW8L7IqlPVZnwaCj/KjqCba+eRocmX2+gJ60cZwo3qC3QKLxHHE+HtQMj7BmLDzpRSWaMjvJUmI89Wd2m+aOWXbpVqMxGHRfRzx+ZL44pbphhysPSzI7KT+LaY1qvmWtKN2LqKU3bN1tdV7A51tdysdfs2pQnCZ18r5hGpsljNUl+VlgUn0I8UHPxWaxMDcV6g5fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rBomFZ9Pr5hbzBq7zWNikzogVRpyeP8mMZLN+wg8+U4=;
 b=ZTRw/RMKbBUWq1JjPodW2b6PlyeI8UbPfpqXZA+B4gV3Usq98NYI8Aej6QYkO+ibhI/rg4uL9r0jU9DLF5tikVXS6rnMIAi/S1grPHvC1WjK8exmN3HV4O64s3YI5KeY2QLAe2NQUpLDczMxkXdfALep8Jlyu7BdX18Mp5Qz40OrjWlfAhbwfuuXtf9qdcrcoc+ZitJqb4pf2vdao/8pu6tc8d29y3AwDumi1nwbGiQXy3IG5dQKdPg+Er3uhSXNIJJI9ZpuSMZN6r7joU7xcSWKYSq9zaG6KT7Oea7M7mRdyD6JJz5a5EwgATCzuxPgl9hwxxNNDgSWWT9omCXeoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by MW4PR11MB5869.namprd11.prod.outlook.com (2603:10b6:303:168::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Wed, 26 Nov
 2025 23:06:02 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%5]) with mapi id 15.20.9343.016; Wed, 26 Nov 2025
 23:06:01 +0000
Message-ID: <a2653c85-9445-419a-809e-724753575f1e@intel.com>
Date: Wed, 26 Nov 2025 18:05:59 -0500
User-Agent: Mozilla Thunderbird
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
Subject: Re: [PATCH v7 4/6] drm/xe/guc: Add GuC log event buffer output in LFD
 format
To: Julia Filipchuk <julia.filipchuk@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20250828174159.1232994-1-zhanjun.dong@intel.com>
 <20250828174159.1232994-5-zhanjun.dong@intel.com>
 <e8600255-18b2-4a5f-b5c8-b55539815345@intel.com>
Content-Language: en-US
In-Reply-To: <e8600255-18b2-4a5f-b5c8-b55539815345@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0290.namprd04.prod.outlook.com
 (2603:10b6:303:89::25) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|MW4PR11MB5869:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fa66114-6f34-44d7-db5e-08de2d405e23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZHJjTThzbHcvbHlpTzFEK3BpU3R6ZFlScUZQYURzbUhaMlFwTVFPdXUyV0Fx?=
 =?utf-8?B?ODByZ1lGVURIM0hjcHNWYmx2NzRkREY1dFo5aTljM2VOTkkydnZtVllZeGxY?=
 =?utf-8?B?ZS90aG9QR0dqeXJ3NHd1c0FNK3U4TWlKWkZ0ZDArT2lWSG5KVEg2VU94MXFa?=
 =?utf-8?B?empPUnRCRzBlYnVmR3orbmUxUk9QdkN0ODF5aks5OVo4TzgzTE01WHRLb1NT?=
 =?utf-8?B?aitUMHRieUl4QjYxOUtPRnRaSi9NR3JZNlZ3R2FiTjhidWFUbkFhVy9XODhw?=
 =?utf-8?B?ZlMzRENUMVR3ZU0rck8xc0ZjSHFydWJTSXphUVRRVkVLYnAwUFlEU3RXeHdt?=
 =?utf-8?B?YndRNjU4cWFkbStiTEMyL21JV2FZS2E1OUYyOHAxTzNuTm5LeU9OOHZYT3VD?=
 =?utf-8?B?Zkg1dy9TVEFZSVVLSDFUZTdVVWVNeUNRVFgrRFpiSmhWUVg4Si93TXp0WVQz?=
 =?utf-8?B?aWNrUDBubzQ3bWd6ZjV6dmhyL3d1V2hDK0RSaC9CY0cyOVA5cWhBZkVJS0l6?=
 =?utf-8?B?QkdZQUM3TzdMSUVSaWNGMWJEZktxMEVWWkFhRWV6WnYxbmRNcWY1dHZwUjhK?=
 =?utf-8?B?WkU0OXRyMEtVK3RFdXJ6eU5GMnNxcTFNd3cySjdFUVFDSUF3WUphWEV6ODhS?=
 =?utf-8?B?alZrNlY3MklQNmVMaUxEdE13Rlo3eVkySUxUNUVEdnlibzRYU3ErMW9IRmNC?=
 =?utf-8?B?Yy9FaGx1SGQxSnl5YmxrbWUwNHJVU3NyempZS1FwdGEvVWd0YTFGWkNVNjZa?=
 =?utf-8?B?aCtsdFJwTE5vMGFnc2NNRDd5QkFIS2daUU1ubkNuRXNHZW9nVDhkaU54TXpo?=
 =?utf-8?B?K1A1UVBKUVU0Z0ExZEtlRzZsbE5OWDdlT2MyYWwzQTJjdldLWUp2TEFkMGEz?=
 =?utf-8?B?ellUS0F1b091d2ZNMmxpVWEraUUrcVpSajI4MW1JeFFCTnVhVGJwOGsrRHRw?=
 =?utf-8?B?aW15OHpTTjQrVmFkV1FtYnhtWTJqZmF0OGt4dzFtQmtYempiMmNTY0dLWERF?=
 =?utf-8?B?SUFtWUtzbHlwN2J2eG1nS21oQnRoampmMDZUV09tOVhYTTZwNXNJY0NTTjkx?=
 =?utf-8?B?NkovajRicVZHNExKU25CREVrbnFIK0NVcmNjZDhtS3IyeWJxbVRsZlc3MVZW?=
 =?utf-8?B?VUdocTlJSWhBcWJzNGI3TkNkbmZaaENjdGY3cEtVaURVeWU5Sks2aVdUOFU4?=
 =?utf-8?B?TExJVEI2VW9FdnVDTU1nN2tFZVZvS1lmVGR1QTlDS1JFT2RpeTZWb240cEg0?=
 =?utf-8?B?QlFEZ2lHRVhaS2dyZG54eVcvMTJFZ3lodHdZVUk3NVZWd0t4Z1RhMmh5cXcw?=
 =?utf-8?B?UG1USlh3WDhPQ2I1a1FzeElPaEpiazV2S1RoZnNKOG9QL2E2LzdjeHFjMmNp?=
 =?utf-8?B?QVdZdkgvT1RValUxcGZrYW45R1psZ3M1VHFuY0xOTGFRbzlnenBNN3dyN2Jt?=
 =?utf-8?B?K0RLTkdlUWRBYlhXZTNwS2NnK0o1bzJaUGZDM3FDaWR3WW9VcHA0Y0Rmbkhw?=
 =?utf-8?B?SkJnNG9ySStESnFCdFlNaVB5bVhnSVUrdDlZTUlPbHlpVmFkQkdCM2NzTkFw?=
 =?utf-8?B?VXBORjhXTnk3TGhhcUhocHE3ZExXaHJxeisxODJFOXpSYXhHZjNMd1VGYmNq?=
 =?utf-8?B?R09PZ2U4eHdEK20rWHVNYks1V0ZMajlOUzNWTHdWeURoU0xoQ3M3RXdlKzk0?=
 =?utf-8?B?dGNsZm1SS1M0RndueFd0eXJZSXNSdW5EV1lKOUFqVmI2bmY5cUx5M2VXVVBZ?=
 =?utf-8?B?SldGM1I2emtwWmhqN1BFemFuR0pGaE9WTjRoSDJCWEVaK3BHVG1yaElrTUZy?=
 =?utf-8?B?T3psdmNVQVUrUGozYWl0Z1Q3TXpheTZ4MU5ibVJDM0k3VXFrRWg3N0cyM0ls?=
 =?utf-8?B?R2JWeGxmNkFJdTNhTHR5azRaN2NVcUIza1g4UmNCaGc4OStmTTFEaUpQeGJ1?=
 =?utf-8?Q?xfG17mihJnbgD6QaMw0AZfigyPT4W1Rl?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MVp5bEVBTWFqSUw5eUxtMWZuQ0RBYjc1Q3JLc3ZDYmh0OHE5MmYxWGk4YnV1?=
 =?utf-8?B?dDRYNCtXRlZqK3BxVmpNVitVeng5VXVIaDF5NmpYSE9YVm8wZ3BIR1dpbzE0?=
 =?utf-8?B?d1JOZFFtRGN1M3FFcUVYeGlzMkpXcDRZTGVXL2RQVy9yNGJqdkRJRTk1bDU4?=
 =?utf-8?B?N3MvNmhZaU1NR2d3R2VMOVBnT012UUFwbzUvbEg4dTFFUllNVlM2dmN4QzJ4?=
 =?utf-8?B?WmlxcU5PM2NESTRGcE9yUGZReU5NOEN6YjA2V01uVTRvZ1ZuQXVSVzZ1MEhP?=
 =?utf-8?B?L1pzMnN4ZlVZWTBxT1AvTC9vd1gzS1JUWlBpK2RvNlozUmJMVEhNUFM1UnBo?=
 =?utf-8?B?UWVSQTVwZm0vSlVSQUNWUUM0WVJ2aWoxdGRRcVd5Qk13L0NEaGVoSFJOYTNI?=
 =?utf-8?B?cUNzY2JqYi83NWxIRmNsc0FtY0NRemxCN1MyUkZoRk5GTGhXcjdyd3VxSEYz?=
 =?utf-8?B?dklFcCtlT0NwL3FNZmVqbXlXSUdpQnQ5MUdZdnVtYzJWSVVDbzFGZE5saC9t?=
 =?utf-8?B?WEthdTY3Tml4Q3BKYTk3dmFYQWxhM05iVWxwamRFbk1oR1RMc0Y2L1ErVzhC?=
 =?utf-8?B?Uk9vc1Z4QkRrU2NSYUZLTEV6TkoyWkl1WVN2SU5QT2M2MmJGNVZOb2xYT3Zi?=
 =?utf-8?B?aTJLR3NLbXZIT2RTYy9aSkhFVXE2V1FoRkx0bDc4eTBYemY0MXBhOHUvNnl3?=
 =?utf-8?B?d1FKWVVXSjYzYWdVenZkT1E3cjZwZkxaM1lQTFh5bldvb0JhODNTR01HK1lH?=
 =?utf-8?B?SjJwakdGZnFtdVZwbzVMRlRLSTFWWWdqS1h2MDNqOFZVOXJLdDZLcHdUVkFZ?=
 =?utf-8?B?YzN5Y1pCZ3lhTUR4MGovaGhlK1lFaUdCQ3pGM0loS0FlV1J5dlVkbXo3TVJH?=
 =?utf-8?B?QVcwcmdidmpmWTk4alFaWmxkbWdLT1Jjd00xUk5SemxyeFdSMHU4SmpwTWNF?=
 =?utf-8?B?dC9DU0xyQWJzbS8zVFNiWDJqUXZid3VJaW1YeFJNbGpvQWlIMGRWMmZEVGpD?=
 =?utf-8?B?dHZtRWQ0VFJ2dHNyTHlCcW9SN0JRS3gva0dQdGgyZUdvMVlXVWRxdVhsbWlq?=
 =?utf-8?B?WmY5b0VET2ZOQlpPTXdPaURFU05ISUkwUmhyMTdxWVd6RVpjMHFiY0RqaXBI?=
 =?utf-8?B?cTdlS3d2UlRQYy9jOEo2SG0xR0hvS0tWWmE0Q1VkSGl1Nnh5U2dSZFpSNXpU?=
 =?utf-8?B?TitOVUUyakJDckFrNS9ha0pVTTBTWWR2eXlTWUFMMjZiaWlzOVhLNTNsTHli?=
 =?utf-8?B?aGlhNnVoRjNwNWJVNjUxQ2lDdERiNC9XeXNYWFdVRjY4WTB3NHBxRExGNEh6?=
 =?utf-8?B?YnFQSWFSMXhtaHFYbVRheE9idU5jWi8vdWdlazI2ZXExbXdSc2R4V2FsSmhJ?=
 =?utf-8?B?NnpFSWFyVEhsdHhLc1ZtQVJnVEE4WHdab09RWDhwWjZFTmN4TDZkbmpNb0Z5?=
 =?utf-8?B?MmZRMG9zbkliQ0NNb29qYlRGUy9EUWY0azgwb0RqMkVSb0tqYW1NcE1LSmk4?=
 =?utf-8?B?K2RkbmpNMGUyQ1Yrbkt4d2J1U0VTdnB0d1J4ZVJyamlwN3EyQ2NXMzJEenZT?=
 =?utf-8?B?S0ZxY3N6a09hSTVTSXpDKy91OTRmVS9KS3A2dXhEQUF1cE1DSy9ySzNsTEE1?=
 =?utf-8?B?VUN5dmovdDBEdVA2eGxrZVBDdHAvSGgvQkF0MGw2TkhhbmhQem52NzZyeFUv?=
 =?utf-8?B?NDZBYXpPSnNmc2VzQ0NHdHJQZDJFcWJERzIyRmszWC9LdFY5TjVndVdJYWE5?=
 =?utf-8?B?c0FNQnVNbjdsTUlVelRyU2tjNm4xY0IrSGpaakNVb1IzMHEwNzFBV0I4d2JG?=
 =?utf-8?B?T1dOL3o5U0ZvZE9BNmNoa0pYL2dpZ3Aranhpc3ZKSHVBczI0ZnlRUTVKTUFI?=
 =?utf-8?B?dTQybVVnUFQ0UEEzNnlsTGdnVjFubGdac2xObVkwM1NCTHhIaGg5M1Q4VEUv?=
 =?utf-8?B?eXFDYTBFdW1reHNRUFRPcDUraldyOGkySG9GT25iOERrS2pocnN5dVhTalE5?=
 =?utf-8?B?eUo1S0pNcGx1dG9iTFgyMy9PNjVNbEwvZnZ5SFR4T3IrbHdlNEp0cXFqTGVm?=
 =?utf-8?B?a3FPSmUxc0ViMElVc29NeUdqZXdjVzVhQUVuY2FuM2VlSlZibVJicHg2NzB2?=
 =?utf-8?B?SW1CWCtXN0JST0ZUeExrbnhicXlCK1NUQjg1R1doc3h4bC8vTUNDTTZnNHUv?=
 =?utf-8?B?UWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fa66114-6f34-44d7-db5e-08de2d405e23
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 23:06:01.5225 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KKblPibp8cTfrUT0kRhmWsfmwbdd87MHlA/b0rej9c+5Ut2wydKotFHFl8zzviw0y7bX2fqDIaySX6REUzK9aA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5869
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



On 2025-10-20 7:36 p.m., Julia Filipchuk wrote:
> 
>> +static void
>> +xe_guc_log_print_chunks(struct drm_printer *p, struct xe_guc_log_snapshot *snapshot,
>> +			u32 from, u32 to)
>> +{
>> +	int chunk_from = from % GUC_LOG_CHUNK_SIZE;
>> +	int chunk_id = from / GUC_LOG_CHUNK_SIZE;
>> +	int to_chunk_id = to / GUC_LOG_CHUNK_SIZE;
>> +	int chunk_to = to % GUC_LOG_CHUNK_SIZE;
>> +	int pos = from;
>> +
>> +	do {
>> +		size_t size = (to_chunk_id > chunk_id ? GUC_LOG_CHUNK_SIZE : chunk_to) - chunk_from;
> This check looks incorrect. Should be >= in comparison for last case to use the
> chunk_to.
Yes, should be >=
> 
>>   	/* Output LFD stream */
>>   	xe_guc_log_load_lic(snapshot->copy[0], &config);
>> -	xe_guc_log_output_lfd_init(p, snapshot, &config);
>> +	size = xe_guc_log_output_lfd_init(p, snapshot, &config);
>> +	if (size < 0)
>> +		return;
> This should check for only equal to zero since the size is accumulated?
Yes, should check for zero as size_t never less than 0.

Will correct above 2 in next rev.

Regards,
Zhanjun Dong
> 
> 

