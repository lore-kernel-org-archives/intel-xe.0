Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58DA2C0218F
	for <intel-xe@archiver.kernel.org>; Sat,  1 Feb 2025 01:21:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E995E10E168;
	Sat,  1 Feb 2025 01:21:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SH8b3mmc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A58110E168
 for <intel-xe@lists.freedesktop.org>; Sat,  1 Feb 2025 01:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738372917; x=1769908917;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ZnQ3h6ZJN+3WOwA5a8ZuxZsEvz6oocESufXKMt6MSE4=;
 b=SH8b3mmcGJdv1kzEibPFp9ycwadGbLIgp2T6iQpwrprz2qAHSBUHX5iS
 TdNAP52Q8nIS1gCKtproqmfyJuKlUftRXSdtz67gMJSQ9kJWG7p1qiyZH
 AnVCzGsha5imuuzAN0MlezrFYwpAJwpL4L61cdpGW/QwXxF77n/juq3tg
 DMkc0Pz93vroOK8zqt1BNOb0/3eArX6ApM5ryzk1g71EKBJO7zRGaQnOY
 ioI7VFADc2/+oGyrz99EHi8pcwxKnv25T7l3Q8UTV/RRv/YWsCXRhBBte
 FUu9czIVPOz0khyft/q6TN2NfcjI1hxK3yMlo8QGzl5YTci1Vcy5djLzd w==;
X-CSE-ConnectionGUID: HsAzzwcYRDafWlurhunQRA==
X-CSE-MsgGUID: LMPkhZ7mQxqzX0me6xv/0A==
X-IronPort-AV: E=McAfee;i="6700,10204,11332"; a="42698845"
X-IronPort-AV: E=Sophos;i="6.13,250,1732608000"; d="scan'208";a="42698845"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2025 17:21:54 -0800
X-CSE-ConnectionGUID: YpBY5TmBSXakA6Nt8zU9oA==
X-CSE-MsgGUID: eNMBSYz0T3OL/37ckRPGWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,250,1732608000"; d="scan'208";a="109667534"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Jan 2025 17:21:53 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 31 Jan 2025 17:21:53 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 31 Jan 2025 17:21:53 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 31 Jan 2025 17:21:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DAa/4nuxwWMMyMgQPHeqphFOaIYpcRHGY4x1Lsluuu36ycn55p440iMiiLhfhNvY44nByHgMmrf5BTrBdQQnpJMvA9LPFTRCSnyDUMMBIeLfGpyOM1KKP8MDNOcVMhm+m4Nd4F+gJEczEnB5eaFvOmG72ge4+d26c7lgVdiy0BUbMGD7lCfW9ujtX/H/sQ2k2YI8qonaLD2E5nLqznhDjI/Y0sPDkQDa/e3UigV4THk8Xggy/eq6jxjoVs32QJWpvEKWrQMRxH5aZVbj26hnvjma1hbBO2shEIgdccnnPFKbxT6ejcVqj/5Q/BO6SxWb06O1o3rHbwS48oNWouipXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZKE9K9KEeoyAGQ81PQ0sFIoGghOOG/OKEFB76U19Dr8=;
 b=uC6gPxV6pVQLHon03/VG7ycqRGG4pkyV+luYWAx0U5au3aE/kfnlsf1kmBuy33xylXeOpj+cz7lIc530zZcYlnsvCAiOqFHP0cdp2u/YlW7gQ3dxMGwuFA8Q6/DTFQbD3D+gY6mvsbiJ5csrPIpsR54Xlh9aV9p8pAL+XMYqpRoFpZ4FoiVyCk0tpWfqxarJgzQgbDjm5yYxLsYcoavYChhM4F6u57I8njKJOpqbNu54thpkVg2oT6JERWibPlAyWm5imKIX8vp6L8/aqb94u0RAlywVEbi/ZcUdbCIUIZTw/yuOD1rrKJeDwqx1THNH8BtfT65C/1J5XZDdUElSkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by DS0PR11MB7381.namprd11.prod.outlook.com (2603:10b6:8:134::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.22; Sat, 1 Feb
 2025 01:21:50 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%3]) with mapi id 15.20.8398.018; Sat, 1 Feb 2025
 01:21:49 +0000
Date: Fri, 31 Jan 2025 17:21:47 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: Riana Tauro <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>,
 <anshuman.gupta@intel.com>, <vinay.belgaumkar@intel.com>,
 <soham.purkait@intel.com>
Subject: Re: [PATCH v4 7/8] drm/xe/xe_pmu: Add pmu support for per-function
 engine activity stats
Message-ID: <Z513K1oUUOcpFwy8@orsosgc001>
References: <20250129101653.1976699-1-riana.tauro@intel.com>
 <20250129101653.1976699-8-riana.tauro@intel.com>
 <fvycaneavttc4bj2ue22oa4tguepz7dtyr3stmibs3pd7yeofe@s7dzrdswg6kv>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <fvycaneavttc4bj2ue22oa4tguepz7dtyr3stmibs3pd7yeofe@s7dzrdswg6kv>
X-ClientProxiedBy: MW4PR04CA0249.namprd04.prod.outlook.com
 (2603:10b6:303:88::14) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|DS0PR11MB7381:EE_
X-MS-Office365-Filtering-Correlation-Id: a1355160-c716-42da-cc8a-08dd425ecd56
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dGFFYWVoTy9SUjB1d2lNWTN2VWJaUEpnK25RWmxISEs2a3ZLRmVZVnJGWVp1?=
 =?utf-8?B?MzUxcW80SjVlWW9mY3NXM05DeVBzWVBFa2MzSTFmSWIxWTc4cGgxR0lGaldw?=
 =?utf-8?B?UHJDOGpzYkJJUWhBSHE1RDcrK1F2S3loSHUzK1FWTG52aThSRFEyWjFBUC9J?=
 =?utf-8?B?M3dMQVhDWFJ3dDB4OFgzcG8zMDlBQmNNVjBZVlhKaUkyVUcxMk9BZ3IxcUMv?=
 =?utf-8?B?cGhWbG5oUWQxZEVlZzlMcUE5eW9xSGJrSkhOeGJja1hyeCtuTmNjaGNnSTVn?=
 =?utf-8?B?eWloVFZxNWtkKzlCT3Z4amkvdUxRa1JZU0dpeWppZDR3MGFNUGhjdlB6TVRz?=
 =?utf-8?B?bmZFdlR6K05MSEtzV1JHNCthTEhlSXhaM254Nk1OeTVXVFNLMlpRWlp2WWhy?=
 =?utf-8?B?UTdUK1NLZzUwL0V1U3VPTzhjLzJNQUdsblc3ckM1cFNlZ0V4MGtqbWxIZWc5?=
 =?utf-8?B?OVBNV00yR0FIVHF3aVNhWkhldXVWd0dnb1lWelFtRzViT1dIR1V4dTM5cks5?=
 =?utf-8?B?QlhkK2dWWFdmcEE4Uzc4L0hSbzFmWDg0em9sNyt5MXowbFZITmZTNjFLb0ly?=
 =?utf-8?B?SXQrU2kxcExJVDVrUE9Na3FVUUtUazFOc0FWcXllOWZpUzVUTGExZndKMWQw?=
 =?utf-8?B?cFVaOGpEcVZHWVhsWUNUTU84NmttR3lPWjFrN3hrdFV4eml3UzVWMld6cGty?=
 =?utf-8?B?aENrZklGdllYczBHM0xBUk5MYVdodll3UmpLQVlQTFlVZTNIY3I5S3Byenlp?=
 =?utf-8?B?TG52UGxDUkYyL2lvalNTSXdxVWE1UTkrVlQwUEVUUUZYNTZ6V3lON0MwMlp3?=
 =?utf-8?B?SjRNMkdjSkMzMEtOZjMyQWpvdjd1ZDE5eGlJdCt1VmZiaEJrdjBpcDJLdm92?=
 =?utf-8?B?SkYvcGpJK1k3bWdtT2RBbTQrcHdvL05hdVlBZWtDK3VGRzMvaUJPWk1QaU9u?=
 =?utf-8?B?UG50Zk1iSmFRcGluakZVYm82Y2d6R2w0RW9IbjFwQWNPeEVFckcxc08rYTBD?=
 =?utf-8?B?bis0ZkwwZFc2K2tXMWJOVG5tYXpJb3FISFhvdUhOSDhOUndRNTZBWml2QmFh?=
 =?utf-8?B?Q3pqRXlaMWhHWXBYM1Nhcmx1NHFGK1BINE9TZTdzb3pwRk9BMXBQcG1PQ1h3?=
 =?utf-8?B?THZKQUdER05XNUw2cU81a1lVcEp1WndUSUF5SGxXbGt4dUFkUTNYS0tPM2dI?=
 =?utf-8?B?ZnVUL0ZVQjRhbFdUbmNRUFBPV3dFdGRacHBNc3dZVjArMXFjR0MzZGRsUnFQ?=
 =?utf-8?B?dHJHUWt4S3V1S0FnZ0FDVlJCYnVrZk9ybEhkaHBvS1orMDRBcDN0UEF6SEMz?=
 =?utf-8?B?SGhUeVd1ZVJmT3NTNE9yUTNINUpsMDJuTXNzc0lHazcyMm9aMHh6a2N6bmZG?=
 =?utf-8?B?WEVlcXQyRG5VT0Y1MTRjWmZrT1VBMTNacytQQkV6NlQ5MlBzQlJHcUZPaHht?=
 =?utf-8?B?TmhMVW9kWlNGVHVvRXgxSEkyUmpYVXNhdFVET1lnN0FGU2dmaXBuYkd0MWcw?=
 =?utf-8?B?QnJ3WkhySEFkMWhVbjJZU0EzS09SNUU2UjZyaitpMTZPOVN6cGhrSmpFZDNa?=
 =?utf-8?B?aTNBU3pSVGg0TTRKS0FwYXFCRG1tYnFrRmhwaENWcUhhNUpNMFlnR0lkYnZO?=
 =?utf-8?B?MXVjNTJQQSt2WmRDbmsyblVKL0NpWk0yNGtadkFJQTJJR3RCS3NCazdycnov?=
 =?utf-8?B?SGVGbjBTSXBSSldRUTh1L2h2Q0xKREtiMEFLbUhIdURMVkZDbHZCYXFOaGQw?=
 =?utf-8?B?MThPbllUNHcxU1NFemhOdk53dWFkMWhhNldabko2aWNramtWcEJ5aExsQkZn?=
 =?utf-8?B?S253Mi9ONWZ3Q3ZranFpbG1jZytuVGdhMzczeXROS3JiYVAwYVBqWVRXRE14?=
 =?utf-8?Q?0Y2xtZI2YN1V9?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aVNLTTFXZGpRMENqU0wrc2VZcUptWTJmb1pZaytPT1RqeXdUeXVzdnk2bE9G?=
 =?utf-8?B?M1RudGhzeGFJaHUvMFlJeGFKWEJ2U3JYdDczUUJpdWYvVkJhV1ZycmlUYSsr?=
 =?utf-8?B?dktFdG5wNlFLc29IT0lmNUtLVnJvR0VhN2xGamJMdFhWK0Vka2pxVDFockF4?=
 =?utf-8?B?cFNZSTNIVXh2TEQ4aWE4UzRXNjZJOTNzQnE2QVlBeU80bmN5MmdKTXcwZ1Y4?=
 =?utf-8?B?U1RmejR4emlCYUFvWW1ETXJEUmYvQzVPeHBVckRpdDhIS0xBNC9OL2w0T2Vk?=
 =?utf-8?B?TUVxZktQbE51ZlIwNmk0ZkJxQUhWc0ZnRWovb2pFUm1Tb1BaTFBPZGxQZWtx?=
 =?utf-8?B?RmpNbjFrVTJCaksxK1JZQVRwMGczWDVkMmNGNjgraktqTzhvVXUydlJmVGJJ?=
 =?utf-8?B?aTBjdXBNelJYK0NxSHpGSXZpZmFac3EvNW1hWUQwYXJYbCt5SCtOclNRRFFF?=
 =?utf-8?B?SW5mc3FzUGh0ekRmU09mVXBJMDUwV3ZQZ0FPNGc0cmg4MHBhM0pmbjMzTEhr?=
 =?utf-8?B?L1ZpaURlbG00ZysxeUFEYllvejhaU1VpcFBVeVc2cytpTkI0M3M0M3ErRS9r?=
 =?utf-8?B?KzByTnZxZFpVWFkyWnZQejQvZjdNNGcrejN0emtYN01LQ1A4OERyUXd1bjVL?=
 =?utf-8?B?K2xTOFpYM1NHNldLNEowVzNOYWhxZHhieUZrNFJSWFBENE56MmpOUHA5aGQ4?=
 =?utf-8?B?M0NYbE1pM1I2YS96WFdjV0oyekszZjRNZXRwS04rdURkeHVsYzBRM1ZLYjlo?=
 =?utf-8?B?UUtCY0tiSkMrYm1PODVETDNqYXBuWElERk1ReWpmK3VQZ0kzdE1kUEc3eVM5?=
 =?utf-8?B?VnFJaVBLNDhMSEZhaDhqSUlKYzV6STVqaVRGelJyRnBDdXVLU0Q5RklNWUd1?=
 =?utf-8?B?WEd0UkFySU9aWTFvbFlTWElYb2FLaXJnRVl3YysvN1FjMiswUU1XalRYRHZq?=
 =?utf-8?B?U2NHeFloYThsSm1oM1hYSXRWbThqYkJhSDB6RHB4TThqTGkzbkNVRGRPUGY3?=
 =?utf-8?B?eEEvVFEreWNEcFk1enh5RzZ5Z1hiaGlDWHh2T3ZjeENGd3RMQVJmdmY4NzRi?=
 =?utf-8?B?bWRTMldDZXVDOUZIS1hVQVU1ZmJxY2FibExBOTFvVG1UUWlUOU5ibTNlL3NY?=
 =?utf-8?B?RGhtRTNzbEhIcGtHUTdyNnB1Vnl3MzM4VU1sSFZGc2NWUzVEQWM5YzNuWUhN?=
 =?utf-8?B?UG1sUHhSR1Y1WWRURTZMYjZmQU5UbFJJS3pOVTY3Vi9MZlFqU291OHZESDdS?=
 =?utf-8?B?Wks4REFqd1FKbVI3VytEekRORXBwUnRFTmdsUlRBWGdzMGFpcUJBRnJnZi9v?=
 =?utf-8?B?UnBPR3hrd2dyZTJoODg4alpQMk1LR2dJaFpnMUJUSDhmTHo3ZmI1QnFKVW01?=
 =?utf-8?B?RWJiN214MkIwZWg1aHZJMy9SYlp1U1lZMzliN3YzL2xLdmdEb01uNUh4T0VY?=
 =?utf-8?B?OHdaaU1IME9ic1hwRjZ4OUlPYmV0OG1qY25QSGRwUm14WVlPUmZYcmgzZEVG?=
 =?utf-8?B?QldWNFMvem81dC9BQ0NwS0xLWWh5VWgrT1ZEUEtYc0hyeVlaOVpLdmNjWjFm?=
 =?utf-8?B?UlFUSG9rQ3R4ZWRLUGFWZUNYZUhCRS9YUWpsZXlOUno2aG5nc0ZmRU5Ocndn?=
 =?utf-8?B?VU8zaUVPeXVyeFdPNTBObXlzL3RNTmpLZktvVlkxSU9wY0gySCtCVW5zTjh5?=
 =?utf-8?B?OWU3dkJrdm9lTmNKVlJIZHE3dGJEM0F5MUNvVVZ2U1htaW9SYWZzRzQzbHZL?=
 =?utf-8?B?OCtYekwxK1JMRUtGajlYcE9pT0FhQXBzYmpDL04vYW1PS0pQT3pIWlJhY2xD?=
 =?utf-8?B?aFNldmtqQzlIeUN5cnFNUjdpSEo3UWFlc3NqaVl6OHFzUGFEZTdRQ2I2UXVU?=
 =?utf-8?B?blVUVWtTVUZnK2V6VkdlS2h4TldhVzMvSzBmc0FVa0lncGtXRUl1QkoyOWdu?=
 =?utf-8?B?bk93UFI3R2dsSXVQWGZlL0w4aDBnT2ZGUlA0VjMwcFREN0ZKRmxnVjJaWnkv?=
 =?utf-8?B?bW5SNTBOVnhiMFlyZUpwVVRpNVJ1ODFxRlE5clAwQWNMTGNCakc1VTVaSTJD?=
 =?utf-8?B?V09ndjhGd244dndCS1RLZVhSQTZkVDc0Tk41MHZwWENQeHByTm9HeVBzcXpV?=
 =?utf-8?B?QkJwODFNS1lZaVJValhCb0FNbVRWWC9BaFV2ZmQyTktMRTNhMzBlYTJBUHpV?=
 =?utf-8?Q?g8oMqt6zTd5ZLz1xHx3rKfE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a1355160-c716-42da-cc8a-08dd425ecd56
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2025 01:21:49.7480 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OuGHoZe3j0fKEzhFDelNHCih6LTdozfNvTPa2jtirWXJQC6/3bHMpk+KO99ccjHk8ksoFVNAgSD8gBnES0F/2dUklUzdkHZfYhkXEkIuxac=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7381
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

On Fri, Jan 31, 2025 at 06:23:05PM -0600, Lucas De Marchi wrote:
>On Wed, Jan 29, 2025 at 03:46:50PM +0530, Riana Tauro wrote:
>>Add pmu support for per-function per-engine-class engine activity
>>stats.
>>
>>per-function per-engine-class activity is enabled when num_vfs
>>are set. If num_vfs is set to 2, then the applicable function ids
>>are
>>
>>0 - Global per-engine-class activity
>>1 - PF per-engine-class activity
>>2,3 - per-VF per-engine-class activity from PF
>
>IMO that's super confusing. The pci function is already part of the
>pmu name and hence event source:
>
>	/sys/bus/event_source/devices/xe_0000_00_02.0
>					 function --^
>
>in a pf/vf scenario, what's the point of the global one?

 From a use case perspective, it should be possible to add up the 
utilizations across the pf/vf to get the global one. We are exposing the 
global one because

1) We get that info from GuC anyways
2) Backwards compatible with tools that implement Native only support

I am open to dropping it though since I am not sure how tools will 
consume this from Xe KMD.

>Also is it monitoring per-vf, all vfs or what? The interface looks
>confusing.

 From a PF, KMD has the capability to monitor (1) Global = PF and all 
VFs, (2) PF only and (3) specific VF.

w.r.t the interface:

I forget what was decided (if at all) on how to expose the individual PF 
and VF values. Did we plan on going ahead and creating a separate PMU 
event source (and PMU device) for each. In that case, this should be:

/sys/bus/event_source/devices/xe_0000_00_02.0 (Global) (should return 
the same counts on Native as well as SRIOV)

/sys/bus/event_source/devices/xe_pf_0000_00_02.0 (PF monitoring PF)
/sys/bus/event_source/devices/xe_pf_0000_00_02.1 (PF monitoring VF1)
/sys/bus/event_source/devices/xe_pf_0000_00_02.2 (PF monitoring VF2)

If in future a VF will be able to monitor it's own activity, it should 
be 

/sys/bus/event_source/devices/xe_0000_00_02.1 (VF1 monitoring it's own 
activity)

If we do that, then vf index parameter can be dropped. TBH, I like the 
current interface where vf index is being passed in config, but open to 
other ideas.

Thanks,
Umesh


>
>
>>
>>This can be read from perf tool as shown below
>>
>>./perf stat -e xe_<bdf>/engine-active-ticks,gt=0,engine_class=0,
>>			 engine_instance=0,function=1/ -I 1000
>>
>>Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>>---
>>drivers/gpu/drm/xe/xe_pmu.c | 45 ++++++++++++++++++++++++++++++-------
>>1 file changed, 37 insertions(+), 8 deletions(-)
>>
>>diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
>>index 15e9a57aa429..2968fc9a358c 100644
>>--- a/drivers/gpu/drm/xe/xe_pmu.c
>>+++ b/drivers/gpu/drm/xe/xe_pmu.c
>>@@ -12,6 +12,7 @@
>>#include "xe_hw_engine.h"
>>#include "xe_pm.h"
>>#include "xe_pmu.h"
>>+#include "xe_sriov_pf_helpers.h"
>>
>>/**
>> * DOC: Xe PMU (Performance Monitoring Unit)
>>@@ -29,15 +30,21 @@
>> *
>> *        60        56        52        48        44        40        36        32
>> * | - - - - | - - - - | - - - - | - - - - | - - - - | - - - - | - - - - | - - - - |
>>- *   [ gt ]
>>+ *   [ gt ]    [             function              ]
>> *
>> *        28        24        20        16        12         8         4         0
>> * | - - - - | - - - - | - - - - | - - - - | - - - - | - - - - | - - - - | - - - - |
>> *            [   engine_class  ] [ engine_instance ] [         event             ]
>
>I usually like ascii art, but I'm not sure this buys us anything
>compared to the GENMASKs below, particularly because they don't apply to
>all events and they are **not** set in stone. Userspace is supposed to
>read from sysfs what are the bits correspond to each parameter.
>
>Lucas De Marchi
>
>> *
>>- * engine_class and engine_instance bits will be applicable for
>>+ * function, engine_class and engine_instance bits will be applicable for
>> * per-engine-class activity events (engine-active-ticks, engine-total-ticks)
>> *
>>+ * Function id applicable for per-engine-class activity
>>+ *
>>+ * 0 - global per-engine-class activity
>>+ * 1 - PF per-engine-class activity
>>+ * 2 .. (num_vfs + 1) - per-VF per-engine-class activity from PF
>>+ *
>> * The standard perf tool can be used to grep for a certain event as well.
>> * Example:
>> *
>>@@ -49,6 +56,7 @@
>> */
>>
>>#define XE_PMU_EVENT_GT_MASK			GENMASK_ULL(63, 60)
>>+#define XE_PMU_EVENT_FUNCTION_MASK		GENMASK_ULL(59, 44)
>>#define XE_PMU_EVENT_ENGINE_CLASS_MASK		GENMASK_ULL(27, 20)
>>#define XE_PMU_EVENT_ENGINE_INSTANCE_MASK	GENMASK_ULL(19, 12)
>>#define XE_PMU_EVENT_ID_MASK			GENMASK_ULL(11, 0)
>>@@ -58,6 +66,11 @@ static unsigned int config_to_event_id(u64 config)
>>	return FIELD_GET(XE_PMU_EVENT_ID_MASK, config);
>>}
>>
>>+static unsigned int config_to_function_id(u64 config)
>>+{
>>+	return FIELD_GET(XE_PMU_EVENT_FUNCTION_MASK, config);
>>+}
>>+
>>static unsigned int config_to_engine_class(u64 config)
>>{
>>	return FIELD_GET(XE_PMU_EVENT_ENGINE_CLASS_MASK, config);
>>@@ -116,7 +129,7 @@ static bool event_supported(struct xe_pmu *pmu, unsigned int gt,
>>static bool event_param_valid(struct perf_event *event)
>>{
>>	struct xe_device *xe = container_of(event->pmu, typeof(*xe), pmu.base);
>>-	unsigned int engine_class, engine_instance;
>>+	unsigned int engine_class, engine_instance, function_id;
>>	u64 config = event->attr.config;
>>	struct xe_gt *gt;
>>
>>@@ -124,18 +137,28 @@ static bool event_param_valid(struct perf_event *event)
>>	if (!gt)
>>		return false;
>>
>>+	function_id = config_to_function_id(config);
>>+	if (function_id && !IS_SRIOV_PF(xe))
>>+		return false;
>>+
>>	engine_class = config_to_engine_class(config);
>>	engine_instance = config_to_engine_instance(config);
>>
>>	switch (config_to_event_id(config)) {
>>	case XE_PMU_EVENT_GT_C6_RESIDENCY:
>>-		if (engine_class || engine_instance)
>>+		if (engine_class || engine_instance || function_id)
>>			return false;
>>		break;
>>	case XE_PMU_EVENT_ENGINE_ACTIVE_TICKS:
>>	case XE_PMU_EVENT_ENGINE_TOTAL_TICKS:
>>		if (!event_to_hwe(event))
>>			return false;
>>+		/*
>>+		 * Two additional functions are required for global(0)
>>+		 * and PF(1) when SRIOV is enabled
>>+		 */
>>+		if (function_id > xe_sriov_pf_get_totalvfs(xe) + 1)
>>+			return false;
>>		break;
>>	}
>>
>>@@ -194,15 +217,19 @@ static u64 read_engine_events(struct perf_event *event)
>>{
>>	struct xe_device *xe = container_of(event->pmu, typeof(*xe), pmu.base);
>>	struct xe_hw_engine *hwe;
>>-	u64 val = 0;
>>+	unsigned int function_id;
>>+	u64 val = 0, config;
>>+
>>+	config = event->attr.config;
>>+	function_id = config_to_function_id(config);
>>
>>	hwe = event_to_hwe(event);
>>	if (!hwe)
>>		drm_warn(&xe->drm, "unknown pmu engine\n");
>>-	else if (config_to_event_id(event->attr.config) == XE_PMU_EVENT_ENGINE_ACTIVE_TICKS)
>>-		val = xe_guc_engine_activity_active_ticks(hwe, 0);
>>+	else if (config_to_event_id(config) == XE_PMU_EVENT_ENGINE_ACTIVE_TICKS)
>>+		val = xe_guc_engine_activity_active_ticks(hwe, function_id);
>>	else
>>-		val = xe_guc_engine_activity_total_ticks(hwe, 0);
>>+		val = xe_guc_engine_activity_total_ticks(hwe, function_id);
>>
>>	return val;
>>}
>>@@ -305,6 +332,7 @@ static void xe_pmu_event_del(struct perf_event *event, int flags)
>>}
>>
>>PMU_FORMAT_ATTR(gt,			"config:60-63");
>>+PMU_FORMAT_ATTR(function,		"config:44-59");
>>PMU_FORMAT_ATTR(engine_class,		"config:20-27");
>>PMU_FORMAT_ATTR(engine_instance,	"config:12-19");
>>PMU_FORMAT_ATTR(event,			"config:0-11");
>>@@ -313,6 +341,7 @@ static struct attribute *pmu_format_attrs[] = {
>>	&format_attr_event.attr,
>>	&format_attr_engine_class.attr,
>>	&format_attr_engine_instance.attr,
>>+	&format_attr_function.attr,
>>	&format_attr_gt.attr,
>>	NULL,
>>};
>>-- 
>>2.47.1
>>
