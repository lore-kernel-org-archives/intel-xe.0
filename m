Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED86BCD4F21
	for <intel-xe@archiver.kernel.org>; Wed, 13 May 2026 13:26:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3ABA10E5AE;
	Wed, 13 May 2026 13:26:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cAZSY/PV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AB9110E5AE
 for <intel-xe@lists.freedesktop.org>; Wed, 13 May 2026 13:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778678809; x=1810214809;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=JlmQd3oXyznQvUWe3IMKJlK9BvWkxx7Xr7ePm++xPbo=;
 b=cAZSY/PV+nP6snYNHUG47/XhAYCq3EDwTOQ3VKS8In4PVqjhQOcqDR08
 DFtHn02Gm/HJGfkjMmoGg6ykSN0/7A7KlLtKTD7PF2BkHkWPXMqJvc2w5
 vMq2NP5YDwL7LGqTjZl16xVq6CjtSO1yenjddZfWIpBfc/a4v/C5nhtaV
 iceNdzWGnGcm72YXPjaA6R/Q2NsAd5B+/PlokwgENzeE9+lgvAoU7oX7C
 kj7vMKDywgWUz/RTc4POQfPu0cTXGgT/fPG14POF2Xy/9zW/niZkFu3ls
 eX6ih7eoyIoRDlJ6eZaH2lkqXoRSK7B/JU0YUE49VCs6ULHrkvWex5+e4 g==;
X-CSE-ConnectionGUID: a7BSsvW5THmxQXBDtMyDuQ==
X-CSE-MsgGUID: QH+hh8Y1SzSM+nAacx9zxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="105066073"
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; d="scan'208";a="105066073"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2026 06:26:48 -0700
X-CSE-ConnectionGUID: IVvODvxYRNG99bjYuSEo0g==
X-CSE-MsgGUID: Gv48B+jgSomkCRNOUKn8Ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; d="scan'208";a="261591893"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2026 06:26:48 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 13 May 2026 06:26:47 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 13 May 2026 06:26:47 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.34) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 13 May 2026 06:26:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DwObF8i39s0FbIqHkzm4xrlU3LdwotxwYGudBicfJr0wzJsMn4njabgh2PLcqwkkrzfs2TegQmV9sLCnjaz4Gk+ACWNUEJQTn1jXneQimX3Rs0ycTxgRxoEWwqmM+RiBUWkPm6nAVBfisjRMQ+T+Dxu7Zr+fQLgmMl0rOKoI29nGDq//v2e70LnwiNoIm29RRPmQg3iP8sM9rEFeUrDV7lcllH/B9uNGYWemzf+oT8uzickaqU5JnNzE4KvGNu3IsyD4QWFg/s1JU/FTfYHiPbFGjUl/fzzHeG3q5m5nT4K8Q6l1AKOnj6gkR84jpNmbCrgeh7lstfDS1bfSmDbKnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WJFHPrPGMgDp7g49nwBnzCCIb8ATlr/tCAnUv97kb50=;
 b=IJK0vZuN2zBsTbo5INMhLiB4r0Efozl5bj3Hp3Ei24MM8Se37XDxi+41O4nI/ipcoDECWSir4Ylz/Cssq6RPqpC5j4NnsCz9MpZ3qD0TsK9dMplVrSpMVDfhe1kdDQ2TTAwUilavpWAPfK0fHoy2dsY0Dz87wk99VgdEoiMJVMIDAlBCtmyZXv7pRQ1BsTYnGJHweyjPePd5JoQ3eWhLn/d4tWsxEEfUBREx/hPpwIs6oYTMWquEgwwiN/EGTnnexf9XRUacSXWndPyRgvE7bKiPpkVoz7dOhFpkkADogT7u+R7fyDML7rqdG1U3Gl8sNcHMHs9Kc4QY5mxuC1WebQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB8132.namprd11.prod.outlook.com (2603:10b6:8:17e::13)
 by CY8PR11MB7923.namprd11.prod.outlook.com (2603:10b6:930:7e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.12; Wed, 13 May
 2026 13:26:45 +0000
Received: from DM4PR11MB8132.namprd11.prod.outlook.com
 ([fe80::22f3:a01e:fb45:57ac]) by DM4PR11MB8132.namprd11.prod.outlook.com
 ([fe80::22f3:a01e:fb45:57ac%3]) with mapi id 15.20.9913.009; Wed, 13 May 2026
 13:26:45 +0000
Date: Wed, 13 May 2026 15:26:41 +0200
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthew Brost <matthew.brost@intel.com>, Ilia Levi <ilia.levi@intel.com>
Subject: Re: [PATCH 1/2] drm/xe/memirq: Update interrupt handler logic
Message-ID: <agR7rvCSTcAaRAou@nostramo>
References: <20260511172838.2299-1-michal.wajdeczko@intel.com>
 <20260511172838.2299-2-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260511172838.2299-2-michal.wajdeczko@intel.com>
X-ClientProxiedBy: WA1PEPF00005B97.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d8::62c) To DM4PR11MB8132.namprd11.prod.outlook.com
 (2603:10b6:8:17e::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB8132:EE_|CY8PR11MB7923:EE_
X-MS-Office365-Filtering-Correlation-Id: 741ece91-80b4-46ce-5f84-08deb0f34715
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|11063799003|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: Wf3PZb1gAt287mfGut6tjQOfcaBlqSbbGE0ogRdkAh8Ucbzs0wKg4LZYlbOVbsSOld/d82tjkDkLLciw3WEjFIO6h2kJ3I+H0YnAeiYt5Neg7K9GfilwcS7gGl1q+hdUpxzqgFtWoRRHXOPqALCMgNWntBGbff9hVrJDx0sM+cLFhuVwi5+tTd2LepCtC4gmY2ums14terzgp3rFop+eAzCDxjX35iiE7f07q4kcngv9zz70nrRUtmp8fwRwbAU1U1/yQL/EaQYH/AX56uKBl3ZHIti49B0FN7l36yg/Ji1WRSbao/jEDyk2CDy7n3f5lz94iO7bqWKSjDMVhSgXjZIXLJQr0oQlecIhqFtW2GCS86FsNkRTQHljIFOS08RdCG1hSjHaK4VNISUkh99gXA6lgycr2mN7chU0LUGzxfew54Ew2rUkLnw46PnBVeynhCOmcAE1t4lpuDTDkTiagvR3aEhMunSxHqUru8o0BiUcKOhI3QD+gBMa91PygUKcFdySWUKGF7P3+rAo40Zpwprc/xGhLrz2BMwASOchalTCLd67sv6RLWdND3vToBnWy4owA3Cw+avCtk+azCOrRC5zGj+XE8BZuoft61r/tG/XCQHsbE11dmZVNM63T47N3CLa58RYBhm3XlEhwmPjcP2djlz+CVCCg21RGWmEQzJzcpUoUcKQFraCMtY8cMHG
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8132.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(11063799003)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ejE1dUVFSE1seDNRWVBjS0FXblNZeDJTSUYwWEFWZWVxWldvM2tWNGRTSGlw?=
 =?utf-8?B?U1hlNmRjUkV0cnJ1elNRMUJLSDN5MzF0WnJPR3dVS0QxTDhQejExekxjR09Q?=
 =?utf-8?B?dFFNVGZlT2QrZldxMzNLV0U5aVlHT3psWDgzMVFrVEhTMWJ5WmtjSDRuYmI5?=
 =?utf-8?B?WUJieVd0Tjk4aEc0VGcrK0xGanMrZzJSRUJ4aGhhV3ZVdXJJbEQwUW1DTExG?=
 =?utf-8?B?Q2pLbnVTcFBoanlkaGgvVk5HelVzUlFPRVFmajk4ald2QlJPUFdtWFJtdDcv?=
 =?utf-8?B?VUJNRk9JRzZrWTZ4T3NyQXFFdFZnVnhKNTEva2xjSlRoaFkwa3VDUCtrWUpY?=
 =?utf-8?B?VjhPdCtmNmFocDJkdGFWNjdrN2NjTGJhWitFNTVvREJ2Y092V1VWVXJISTYy?=
 =?utf-8?B?RXdMa3FjUUE5VVdpSG5VaWVpNTZpRUJVRUc0bEUzbytkenpuZGoxdkwxL2dU?=
 =?utf-8?B?Ujg3ZDB1RzhaMkU1M1NiUlhiMHNZelhxdDEzOWFwQWtiSUFnNFhkbzV0STRo?=
 =?utf-8?B?djFOQlZLMTBkQy9UWmlzd2pLd1RiZGo0dDQxRFBoSEpyU3VBZ2ZEUmtXRG5m?=
 =?utf-8?B?V29IdisyVnlsNjdEWDBIbzhqT0lTWjh0ZUJqYklYRFRNZEFSVnE0bzJhRXE2?=
 =?utf-8?B?eFFhSlBjRzdBTC9DNUtSVTdEQWlSRmRmbUJZZXY0ZEVxaEUrazNZQ0RXK1lk?=
 =?utf-8?B?bVkwLzMzOVVMTTMwVExSNmhpNFB4cTZPSzIreVprVlI3T0hFTS9OclRhbC9Y?=
 =?utf-8?B?QWxSZUVDWHEvMDMvTm1RTStvQkVBRnFJTmhoUlNLUG1CRlpHNTMvWlVrbDZV?=
 =?utf-8?B?SlEzbWRCZFhOY2dzYnBlTTNLMmVjL1diNDR5Mms4ZThFRTFvWWdhcGlMWlM0?=
 =?utf-8?B?S3Z3aERrMmZuTTNvOFIxWkcwTnNrdWp1a1p0a3V3TkdWbk9aeVZ4eC9IUG9v?=
 =?utf-8?B?OTdCczRXUjJCRDNoaUZGdnhlTTIyZGZ0Kzk3RnVERzZsRkMrRlptM2NtY2tS?=
 =?utf-8?B?NlQ4R2xmRGZDeU1HbS9GQ1NmU3Jac25CbmJ3VlFEN09QS0hJNnhEdXJGQzh2?=
 =?utf-8?B?RWhKeS8yT2NzNmt1UWlpZG5RSjlCVnAveXYvaHF4LzJMRHhFT2wrVEdSbzk5?=
 =?utf-8?B?QUF2QkZXbTVqemcyNzlCNDR1c05PZTRBTjR1QVArcTNZSkUxeWdBci80eXZS?=
 =?utf-8?B?bGcrekdRYkhzYnFoZmFxNTRwbWxLMHhOSHdBZEp4UzFNbEtzeTI1MjlKc3NY?=
 =?utf-8?B?azNhUW9QSVl6blpEQWxBY1M4Z0FZYTJzMytDa2pDVGpxQjdhRDBQWFJLb0lI?=
 =?utf-8?B?aEdmTWxmdmlLNHFEdjVHWU9zTmVjVXo3U0xGY0dZaUc5N0hLT2ZXQ0cwajBW?=
 =?utf-8?B?VGdqclRaVVdoMjRZMGhNL1J6ZG5vUENDUkw3V0JQeThVLzNtK3RMOW9vM0Zv?=
 =?utf-8?B?am9QNXNram0vS0VTSWZEdHhhNVRHN05nUmF4MG5KSk1wOU1nYUo2WFJvOWxl?=
 =?utf-8?B?WEFXN001N214cUY1cXJWTnA2ZDFnY2xHdGoyK2R5a3BxSDl3QTcvaWFDM1Nu?=
 =?utf-8?B?K0huVzdHbTk5bFp5MDBBc3F3bVhDRThxVUJBOGREMU8yVE1qSFdCT0ZObEcy?=
 =?utf-8?B?RTJzQnNtb3JOQ1k4ZzRZdk52alZPUWcvWll6TFkyTU5KS3BzZWV3SjBxcC8x?=
 =?utf-8?B?enozMTh0dnBLRHU2TXpkN1E2ZzlwRXZlTmttS0Y3ZjhldG1uVk1NSnJRWWkr?=
 =?utf-8?B?SG9QWndCSFpFaGJQZEg0TENvTGZqcWVZVlViU0ZwKytjTWkrODdoQmkrSGRT?=
 =?utf-8?B?S3FSOTBDQ0Naakk0cHZiY0xMMENBL1FxRnAzZCtXVm9EYjU4U2Fudkc4aURO?=
 =?utf-8?B?MUJWamk5djdXWDNuOTIwNUl4ZnYzYndTWURvV0UxMEtZNzMwSVJ3Q2E0alpW?=
 =?utf-8?B?UU5IcitDMkhrcUJlNGdubVBDU2J3S0J5bFpNTW1DUFNJV0FzU09SVGFNNmwx?=
 =?utf-8?B?VDhpbitGU3k0NS9ueUkrbStva3IydU9TZXZHV283eEw2aFZiQVd1ZUhQOU5J?=
 =?utf-8?B?YzQrc0syRUdwNGxBYjRtRHpZMEhFMHlmVE1od3ZOKzdSekV1RGJUazI1Smlv?=
 =?utf-8?B?eVpIc3RmMzdPaGpsOWZhMzJrNUpESGVHR3RCd1B1SGIrTzVnZFY0ckFzVVpu?=
 =?utf-8?B?RWNjdFl2MW9mcVFFSTBtS3JYUWt3NjNkQjR4SmZoYWx4enlQOXJqYnVwMDha?=
 =?utf-8?B?YnpNbEg3M3FpQldKMWhoMGtmQVN6NDhsSGRabkFmQmx3dUV3cUJrMlhRUEFj?=
 =?utf-8?B?UzNjc3V0dWlUK21FS3Nub05BTDNQRUlNT1pReXlCcUhjUGdaYmdaRGkrQlM4?=
 =?utf-8?Q?Yl/TMWD3TTaDP9Hw=3D?=
X-Exchange-RoutingPolicyChecked: gKzj+7KeGAAhHmqMmGiDgce2KVOiEKqONmHf7YCQf8DuWJ7kdhZ/YzKYNXDiLaTsI93JNmxSvf5Q6J8OBZ5wBC9+As65wYh4ohRfH3hsYr5gXorKejpl1HaQyyfc4xph5HwIPqFJVamgmgyTBA7/jQ2nals0HtcY9Dgu8SLYxugYtOKh5MFJH9oHm2qzCz2V3Cw5EUn5h13Ea+u1mmvpS9EAw9spj+pXbY14jM/TzNU9IcEaigb55o8Y4G0WNV8GozcRtK0MgEAtVkokIIz8YHDrCDxmxLxLuIXSvaYj92RJaLcuoXDUrr7TReEs7ZZGDReunaBG5sKjI6oTpFpcaQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 741ece91-80b4-46ce-5f84-08deb0f34715
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8132.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 13:26:45.3423 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xc3Bi19SYW1wnbUTlUsGwuBrjkPtSz/YZEQa3wLsqNjIagZK+WZEUDlVZRi9W7TEOOw9XyHU3J7ynY2vljHIuus1kDSwCsIsb5d9iX4Lp4M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7923
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

On Mon, May 11, 2026 at 07:28:37PM +0200, Michal Wajdeczko wrote:
> To workaround some corner case hardware limitations, new programming
> note for the memory based interrupt handler suggests to assume that
> some status bytes, like GT_MI_USER_INTERRUPT and GUC_INTR_GUC2HOST,
> are always set. Update our interrupt handler to follow the new rules.
> 
> Bspec: 53672
> Fixes: a6581ebe7685 ("drm/xe/vf: Introduce Memory Based Interrupts Handler")
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Michał Winiarski <michal.winiarski@intel.com>

Thanks,
-Michał
