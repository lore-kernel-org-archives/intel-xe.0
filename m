Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F40FC36008
	for <intel-xe@archiver.kernel.org>; Wed, 26 Mar 2025 18:33:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F18010E78A;
	Wed, 26 Mar 2025 18:33:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="moRZOBSq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EEEF10E78C
 for <Intel-Xe@lists.freedesktop.org>; Wed, 26 Mar 2025 18:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743014003; x=1774550003;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=vaAPFc4rxJe22yNBWsssd7kl01qrmtZ767GxwgjKnxM=;
 b=moRZOBSqXxJGWJOP0mI8kfWQZGe4qmAneFUJU/apfDbBR2tSU4E05RUt
 4j9CzrRfOKWfss7KkfpMF/Z9qHC0rEvl2yibdR87kHY8oLRAk8ppWR8A8
 ehZ6PLD5XwLbxES7ybtcQQcSSMHLFyGnZivrkhFO1YfMftuLKeQ1qK15H
 sNl219WS6nTccC0lKlVrf4UDHKJIRZgFhAYC5ZfjJ0sQqgvp2ZoIC54bF
 bGGP5U+jxxGApC5FSawODpUvmc9YgMsSlHfqBvR149wO3sQAwjHyFSTTE
 uVUJ2K50EnRgm4mbVOdoO63dEX0cUnK40UmGRhySaSpH1iwXyZ0fV0uz+ g==;
X-CSE-ConnectionGUID: wPM6IWQsTqm2wtwaVy7Ayw==
X-CSE-MsgGUID: MG9ij4IiRnmUB/MIfOp6mQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="43477547"
X-IronPort-AV: E=Sophos;i="6.14,278,1736841600"; d="scan'208";a="43477547"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2025 11:33:17 -0700
X-CSE-ConnectionGUID: 2kkySXdvQkaFVhM7irvxuw==
X-CSE-MsgGUID: SY+7FnEDTHCjBAGsXOH1cA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,278,1736841600"; d="scan'208";a="129567736"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Mar 2025 11:33:17 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 26 Mar 2025 11:33:17 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 26 Mar 2025 11:33:17 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 26 Mar 2025 11:33:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ovn6RC8K83lcAqSaP7rzzZBn7o5hKbY+3NzZMjGvH31ugUVmsK2Uf6VOD93D2s+Kk3XN9B05HzUy5J4EosJxj1b9SKfBkP4TtkR3mJJemZI1LdAdYkDMmaYvUyxiuRQEAO12qnI+J/ULSUDB8se+8lWws6sMU7xHMdhIh7BVGRcnsjQkVJlKCRzbOT0KTjhTWjSIIguZC90Vf8yzQkTrdhpXmitqDYI3zPmwCG5AvkM94psJz/dBf1a7yF9098RQhQogjaSsxAg1A+S+gdUhLg7cuTRhaCpzkZebXrmuFyOLrGJiDcuPHoSrwS+/FjgJowybmS+y8py6M+GovX5Isg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3M5kDlQg0zaCx5778xFYFHa/97lARfeI9HNg+B+oweU=;
 b=F4Vn0uj2StI92a/46BWsKeCsTC4hJGReq+jh4eoO36H3sEP/qQ13IdZbQQQ6BS51ARJIcqP4diQgOARI8asi/Fz5CGIAQh+ZzCU+1cxeURwoctVcLxyqkxDsnv19MvG28+daG1vobw2AdaTKI07avOOKzjSNpKdu3j4EPKtDw/qQlq2hVomH0lVXLNFyuQzukUAv+C7ytY/uKPGoWJE3UdphKQsAEumiDdHXD2KqlUn7YoOlt18zljove/uupKMDtoLGqo11mUmcjeFw/8BwlA9s95btOvGIe+jBBKOeL1B/41zd8RVLFADpraavXSOExyJFZip+k2mjLQqgcxyrCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by SN7PR11MB7510.namprd11.prod.outlook.com (2603:10b6:806:349::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Wed, 26 Mar
 2025 18:32:47 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%5]) with mapi id 15.20.8534.042; Wed, 26 Mar 2025
 18:32:46 +0000
Message-ID: <1b254e07-70ab-4dc3-822d-ca98472a43bd@intel.com>
Date: Wed, 26 Mar 2025 11:32:43 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/guc: Reformat dead CT reason string to be
 devcoredump compatible
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <Intel-Xe@lists.freedesktop.org>
References: <20250325203111.3907426-1-John.C.Harrison@Intel.com>
 <hjjianx4m5vd5tqwfzzmmub3lyu57kvhhihx5wzsmunvbhfc3l@quofrbeoyxmj>
Content-Language: en-US
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <hjjianx4m5vd5tqwfzzmmub3lyu57kvhhihx5wzsmunvbhfc3l@quofrbeoyxmj>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0364.namprd04.prod.outlook.com
 (2603:10b6:303:81::9) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|SN7PR11MB7510:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e0c5c48-bed8-4634-d9e2-08dd6c949ada
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eVViVzhod1RyN09McWFBcHpWOXArdDhKQWVtWVVVdXAxelR3SC9NYXh1dk5O?=
 =?utf-8?B?d1Z1c0tDZm1JVk50b0FmN1pWYzVjLzBJaVRGRGVBUmZQTXVyM09sazhEdXRl?=
 =?utf-8?B?cUhwV3loU1UySkp6enhBKzVIZjlkL3BUZmMzckxqMUIrNmgvdVJ3OWVPbER0?=
 =?utf-8?B?SDJBbmw0c25ZdE5mYjlOejZXSHUrWGZpTVVRLzFjeW1PbEM3dElxeks0M3dC?=
 =?utf-8?B?VkhWNGpac2V3YjBqRTBPQzJsYmZ6VzA3MGRLeENyU1R2T1EvMEpsV0FscTE1?=
 =?utf-8?B?SGJaSEZ2V0g5REtMN2lNRVhmMHZSTDQybjdqbDlKZVhIdzFsMk9oeGNBOWVP?=
 =?utf-8?B?cGVqajNhQXF2cmJleWhRVnFYUkhPSjJwczFlWU81MUFUYzdJMDRCZ2F4Uy81?=
 =?utf-8?B?SnhSVTdLUnJ5TTIrV3VERSsveEZGd2krS0dFZEUzR2wzWEliUkZWUExVaVRU?=
 =?utf-8?B?K2xnRk5XQmRZYktDR3hUcUR6TUdKZzU0cWIxOEtoNmhrUEpmZXMxTEFFSkM1?=
 =?utf-8?B?NWxndiszbjR4VEpmMCs3bjIwaENia29DMnB6YlFnTU9pc2pEdWJxc1A0cU5y?=
 =?utf-8?B?bjN1OElwMTIvbFBqaFNqSXpLM0E4WVRUZ2VjMWVSYnhieU90dW9kMVJoUXVK?=
 =?utf-8?B?MUJ5QVVvT3dvT1dSVnhBSmRpZmgxYTA4aGN3TjVXOEtSczk4WWFkeXc2c2o1?=
 =?utf-8?B?UUc3bTlQNm1WemNubGlXRHRadnhGbEo5MkZDRU9uMEc4NHBTOXd4emZvY2Vq?=
 =?utf-8?B?Y1FXV2ZVMnhGZmtlK01vZksrWHZiZ3B6bHhNcHBqYi9EcjhwcHRPR2xSbkp3?=
 =?utf-8?B?dW5NVk1xSUJ5ZTRJdnZOWkNlWndLb0RpaUN5ZXBBTy9UZE5maUc4SlZBN3BI?=
 =?utf-8?B?dWpnRGphS2dLZWVvcDdFcXk3NzljcDlDV0xNU05vQm4rMzBZMmU2SXc0ZmxT?=
 =?utf-8?B?eVRFR0cwN00rU0IreUdtR2pNRWIvSFVVL0UzMk9kRmVrdVBtdEkrdXo2NUVi?=
 =?utf-8?B?eU03am5uWC8yVENScm9ZNUp0WWxoWlEvamtEeU1NNFYybDQ4b1U0WnJ2Z25F?=
 =?utf-8?B?eGZDenBpVEpDTXNXUUhld2ZaYWhHV2s3SFN1TWZMeDJFcmJpcXNnUDFubzBU?=
 =?utf-8?B?clZ0YjBZdGx5QlJtNStuQ2FzNm54aHFQaDdxc3Vtd2lsVDNNSDNYakU4UnBZ?=
 =?utf-8?B?L2owWHU1OFYvMWxPZUlZVDU1WndJQkRMSEk5d3FGQmdUaWorazhtZ0toc2pp?=
 =?utf-8?B?ZUlXdDg1OVFBY0FWT0pvWHBjV1dUNlo0QU9tY1orT1IveHdSbU9kOE1DazVK?=
 =?utf-8?B?ZzhNdE5UME5TZGo2TUE5ZjJuT04zOHZTaTYwRFZkSTI0eXJwQkV1T2FaWVdY?=
 =?utf-8?B?MG8xeFYzMVpwTHgxSDI0QVgxSnJ1MW9wUklhZUNTM3Y1VzZiWTFWSnhBNjNz?=
 =?utf-8?B?VjFqZVArQ0xTMlVVQWNuU0JWOWxNTzROTHJKRmxjM2pVNXJQamROb2pxSDBK?=
 =?utf-8?B?M05HZGllQXlYQzFVS0paWXlnbytjbjRXc3NDODhhTVN6bmZkOVl6ZWM1SDJL?=
 =?utf-8?B?MWRJT0NPY04zRldwR2tmeWY0ajFmbGMvaGZVeXBTRHh4dE1iTWE3cW1IWTFn?=
 =?utf-8?B?UkQ1dGt3Wm9aVUZVNjdhaENaWVlQdkQyZ3RSVEg3U3A3c2V0UUl5enpSeTF0?=
 =?utf-8?B?eFlTOGtLUHdKcDRRSnc0cjVCT0xsb1c5ejcyS3BLRlVxMkxhRDhybm9iOWVN?=
 =?utf-8?B?eGlxT2FLci95bjNKWGlrN05CK0tMUEQrcnNpMzFrYkNkQXk4Z3pHMzZaRzV3?=
 =?utf-8?B?eHpjLzRZeVloNEc3Z3dMSzBuQmsvQVhZcCt3MEl0YWRyWnBIOG9qOGJsZ2Fz?=
 =?utf-8?Q?QlL9d4KzbsXp5?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MS9QT2JNbWRvcmhuQ1ZrZlpUbjhyUkFsZEtKNTMyNzgvVVFiNHhnT3pNRUY4?=
 =?utf-8?B?bFRVK0ZCa2o0eUhpamoyeCtoTkFQbDZBQmFGVm80REdQVkY1NjArOUpJaFdi?=
 =?utf-8?B?by9ZU3hpczNSb0pxODNoYnM5blZ5VDEyU3NqNVJYWWRMZndMVlg2TXNKUDlC?=
 =?utf-8?B?NVExOGs4bnRNZk1vOW5nMUlmUVBiSm00c2hSLzRkNHlKR3FvZ0dUbGJhQUNv?=
 =?utf-8?B?Z0VZVUVZMzBEM3cwVFR6Q2I2MHpkVmFJZ1hNK1BMS3lYa3VHeis0RUV0Ulht?=
 =?utf-8?B?WFRreVdKeloxK1VwMXlxUkFkRmY0RE50ZUFsVHBBMTdrNGs0L3NERnliMHhN?=
 =?utf-8?B?T2QwYnIwcTZMa1FBTzA2TGNFZWZ1ZW5VaEhZVmVmdGRWT2JPdi9XcXBwSmFV?=
 =?utf-8?B?eTc3UTZLQlJjNjRneStmVHl3ZVdCNXBxMDFHYVNXVDY2NWJXWGVaZDFuclh1?=
 =?utf-8?B?ZnBBaXV0WkpBdFpiQ2NWWkljaFlERUJ0RVF3Vm0rcmRCbndZRVF0VXZ6eVpp?=
 =?utf-8?B?ZXhGRlhheEpVNTZtVzdGR1k0bGY1V0VEN2dWME1ldFFiUUt6VnplT2o2WjBD?=
 =?utf-8?B?azMydENseUJvak9VNWhQS0lVTkdqdDV2YjRyZHlHNGpXOXg2S1EyUVRvVzQx?=
 =?utf-8?B?T1N4K1hyV29DT1I5ZWcwZ2d0dk1sd2tkWFd0Qlp6TFNEWFlQOFpEQndwOHdS?=
 =?utf-8?B?bDBYcUJDV2hhbldQRnVZWS8zUTVWY2ZqajRXcDJVYXVtMjJIbzNBVHNkZGtj?=
 =?utf-8?B?ZjgxTW1wUGZiWHRNMTRHUXJpWkEwVjh5eTQrM3pyVDE5T2hibnYwazArUFF6?=
 =?utf-8?B?NmlIVWx3Qk9YSGZYalRueFp6MjZGMmpSaEozTW1rbHU3dEU3TkpuT29WaHo5?=
 =?utf-8?B?b1FnRnJjV0ZFc3lENjF1UEJheExyTmsrK1EvTzJBQW4wWVhCeGRubEkrSkpN?=
 =?utf-8?B?VTN3alIrKy9TMUdMNzFYcVRhRUFNa3M5TUZxdi9pR2NBY2N6ZVA5bE00SGdD?=
 =?utf-8?B?QzNXOTE5UnR3aUw1NGNRR04yNk5BdHlKWWdSV2ZFUWJ1ZFMrQlh1UEJpQzVT?=
 =?utf-8?B?bG1OaUR2V1pjRGRBTnA2NW5ieUY0SVhJN1lZMGN4OXI5VVplankyNTZqajVM?=
 =?utf-8?B?TlF3eE9NL01vNG82SmtyZ1RsMnExeGNZMUFMOCtweGdLQUFuQVd4SU1jRVdI?=
 =?utf-8?B?ZDFPRm5rRFg0YS9SZU9hREFyMGxUQVhJc1dXMWMrK3FqYS96dXRBc0lMVUIz?=
 =?utf-8?B?QXp3ZjdXVmpZOExaNnBNTnFjMjUzWVVSd2hlakNiaUxOd2ovZ1JrdVNielBt?=
 =?utf-8?B?S0RCOXNtWUxmWXlZdi9NUGczbWhpNFJ6MFJxQjc0d3ZDWjhvR0s0RGV0c0dD?=
 =?utf-8?B?WUxKM2d2QnFKUFZLSWpid2ZLNmR4YUNpck83WUYyVnMwUzlCUEloNUo5Rzly?=
 =?utf-8?B?aXh5UVE2QUdLTWp2OGo1UzJnNE5kR1ovYVBhaVp4WjY3alJhckxOY254d2t5?=
 =?utf-8?B?Z1g0UU1CbE5uQnZvcm9aZGdNOElOR1F3dFBURFNiZm96cmVqdUVwakE1clMv?=
 =?utf-8?B?L0JjOENkdEIyaEdxYzZOZ2plRDFmS2VhckN6SjlPOTNnOTNHTDRKaGRMMS9q?=
 =?utf-8?B?RTFRTkcxZ3p1d3ZudE12d21Qcm5DOVk1WFY3UUZ6UnVLTC9ZRG1qandHWTBs?=
 =?utf-8?B?Nmo2WS9UMjI3bENDZTkveWNkcUdhbUhNWWo3dzlBTzhSb0F0TkY1UDllN0tG?=
 =?utf-8?B?aHRTcWcyYVk2Y3ZvcHZWUUV5L2FRQVhRL0ZyTk1YV3VrTlFOOWp0emNrS1Vh?=
 =?utf-8?B?SlpSaXFMVVY5UDZGbm5TMGVFRy93cVVTdTZhQ3ErY2c0Y0hFY3FEWkNaNzQr?=
 =?utf-8?B?Z0pVYTZ0YStXaDhvKzU5cWFxR1ZjVmI1cUNQWFo0RzhIYjB6ektoUzBaaElI?=
 =?utf-8?B?ZENsbW1waXJPRXhGS2daRmpwL3RIdm9YWEllM0xaWEk4RERpMlZ2TGcxa2g5?=
 =?utf-8?B?MmpuWkt2eTJsRE50WEEvcElJbkRaamhGMm1VTjZNN3l0akFBdmZ4M2l0VWdv?=
 =?utf-8?B?aWZ0VjlEQjZUYVdQeVEydFFhWkpOK1lYMEF3dE1zcjN1cUVnSjMzTHRFcjVo?=
 =?utf-8?B?eEdudG1uMkw1aFA4U2lScXluVm9PbkVSU2taYmhsbEx2bFcyZ0ZMa0dTY2NZ?=
 =?utf-8?B?RFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e0c5c48-bed8-4634-d9e2-08dd6c949ada
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2025 18:32:46.8601 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xfn1VoW7NaoQUzNifBJ6t2JSpCjedIsULUvds/C8mVgirg8/lNiPWbW9ur7wqXENsOp8zDeV70jcGd/5TmN8RVvG6q/dogmmsE0JZu88CH0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7510
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

On 3/25/2025 9:23 PM, Lucas De Marchi wrote:
> On Tue, Mar 25, 2025 at 01:31:11PM -0700, John.C.Harrison@Intel.com 
> wrote:
>> From: John Harrison <John.C.Harrison@Intel.com>
>>
>> The dump on a dead CT tries to emulate the devcoredump formatting (it
>> would use devcoredump code directly but that requires more re-work to
>> happen - work in progress). So update the print of the dead CT reason
>> code to match the format of the 'reason' string that was added to the
>> actual devcoredump a little while ago.
>>
>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>
>
> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
Thanks.

>
> I stumbled upon this a couple of times and wondered why ct_dead_print()
> is "emulating" a "**** Xe Device Coredump ****". Maybe that should be
> delegated to xe_devcoredump only and allow xe_guc_ct to select what to
> include?
It's not about filtering out stuff that is unnecessary, but about being 
able to call the core dump code from random places.

As per the commit message comment, I have local patches to get rid of 
the fake coredump completely and just call into the official 
xe_devcoredump code but it still needs some work before it is ready to 
upstream. I think I did post an RFC version of it some while back but I 
haven't had chance to work on it since. Largely, the issue is that the 
coredump code currently requires a DRM q/job object. So there is a lot 
of splitting up required to allow a dump starting from just a gt or an 
xe object.

I'll try to get back to this sooner rather than later...

John.

>
> Lucas De Marchi
>
>> ---
>> drivers/gpu/drm/xe/xe_guc_ct.c | 2 +-
>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c 
>> b/drivers/gpu/drm/xe/xe_guc_ct.c
>> index 72ad576fc18e..686fe664c20d 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
>> @@ -1828,10 +1828,10 @@ static void ct_dead_print(struct xe_dead_ct 
>> *dead)
>>         return;
>>     }
>>
>> -    drm_printf(&lp, "CTB is dead - reason=0x%X\n", dead->reason);
>>
>>     /* Can't generate a genuine core dump at this point, so just do 
>> the good bits */
>>     drm_puts(&lp, "**** Xe Device Coredump ****\n");
>> +    drm_printf(&lp, "Reason: CTB is dead - 0x%X\n", dead->reason);
>>     xe_device_snapshot_print(xe, &lp);
>>
>>     drm_printf(&lp, "**** GT #%d ****\n", gt->info.id);
>> -- 
>> 2.49.0
>>

