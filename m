Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08684C5B543
	for <intel-xe@archiver.kernel.org>; Thu, 29 May 2025 03:21:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B28A310E1C6;
	Thu, 29 May 2025 03:21:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T3WY81Z9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD0B710E1C6
 for <intel-xe@lists.freedesktop.org>; Thu, 29 May 2025 03:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748488902; x=1780024902;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=JWTvFuKaJs1kTmSFsK8v3oNO6C3VogG7MjLNavNmgLs=;
 b=T3WY81Z9A/pnm9g31n4Sw6FFxrxLlrBKkT1cbPtVZXerUKsG/Le8Bsxy
 6R+opmbteJf1a3vDPEBX3mpQHZy9aS00qw70/knBhe7R674iap1DGKh6U
 qdVJMZoZUJBY4j4jnXSfz8PU2HLrVi02kwH0TB+ZbV4jfIclrzadot3vJ
 WDtMVTg8NfhCbOywsEQO7slQHTazPdE0CuvMW81aZzGSVF4wtRs238XXC
 rFlnsJhMUN7HxGBCMgLhN7EWQr/h3UIisRX/Ki8I0eLqQbv6jC5wvou66
 M2/EU6UDzTnCBRPOtm6ifmy/vYJPnKEJ6opHwLkRo2YHiw1S1TLg2w27Q Q==;
X-CSE-ConnectionGUID: O5uoAwxJQ7qHJsptHaDEqg==
X-CSE-MsgGUID: pgKoJEKQSeOlAd2coMWvRw==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="49783422"
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; d="scan'208";a="49783422"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 20:21:35 -0700
X-CSE-ConnectionGUID: mf7y7DPHRY2vIxyXwv4b2g==
X-CSE-MsgGUID: nfOKrYGwTdGsnYLlAZdDng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; d="scan'208";a="144067731"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 20:21:33 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 28 May 2025 20:21:32 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 28 May 2025 20:21:32 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (40.107.95.75) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Wed, 28 May 2025 20:21:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XcYTe+WUkYta8KHBMRUfghTL96tq92AZOWO2phEvUpcEwKKnHlc6h7M28Q9V7Se54Z47FdTZi7GOIfmC8nPqBE11/jGaQn1vlSKkC/S9sAOqPD+L9tnycPWbtSOZd1Y4ntGrp+GCK9nPmdNauaASC4HGCRgWjyGVgSmjzEeSSwfNbhAIVGfFMEecvRdk9stoKwRh3um/B0oqC2z4BSB2fw+jmZhteKGHBlmES/Zt92aecKpN7+JLBXtIsoaJQeRKwp5xUXVy5DTAJAE9+d1JbXEXTSpso9wiS1eMQFVpwCnSKavSCZZN/5lEclYr7R4ZpRpzsKV+1iOWNUpUHKdD5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y3JpIxSzrhGJwOuDJEeBU+REAhgSyMaJg9FeCaqIiCg=;
 b=OdLcbhSbAmSUIFK7+tVlAO6+XL2FD5n5I9LNhAnSzlPSL/3t43NdtXlIzHInMH4z2R7BngF+XschB2ZQbmr5vRJScfBmzyr7zlaD0nMCI2j6huZd5gBbIxTfIDKBb97jHlb1eumc75WB5YMZjlhaQ7wpM8HQ7sQsuaNqOLDDM2h6zlYgjJDaWZ6rWsXSS8diiPF6H8r8j030jf4O7NM0xBZqnEulD63ERaUrRX9aV7RNKei1BxFl3j0YhSN3QoS6U8tB0TUmjLcNY//l+529CMc4NtrHs5ajYcPb9pUjeO/+F5HKyvoAcWzeXMXSdUDLN8EMzMJt+U8Ai0u9dOmk5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB7038.namprd11.prod.outlook.com (2603:10b6:806:2b3::22)
 by MN0PR11MB6232.namprd11.prod.outlook.com (2603:10b6:208:3c3::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.27; Thu, 29 May
 2025 03:21:22 +0000
Received: from SA1PR11MB7038.namprd11.prod.outlook.com
 ([fe80::d13f:aaf4:415e:4674]) by SA1PR11MB7038.namprd11.prod.outlook.com
 ([fe80::d13f:aaf4:415e:4674%7]) with mapi id 15.20.8722.024; Thu, 29 May 2025
 03:21:22 +0000
Message-ID: <de32e92c-59a1-47ab-8ae9-99676367e1a2@intel.com>
Date: Thu, 29 May 2025 08:51:15 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/19] drm/xe/vm: Add a helper
 xe_vm_range_tilemask_tlb_invalidation()
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>
References: <20250527164003.1068118-1-himal.prasad.ghimiray@intel.com>
 <20250527164003.1068118-8-himal.prasad.ghimiray@intel.com>
 <aDeYYU+vwvc1fzB1@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <aDeYYU+vwvc1fzB1@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0077.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::18) To SA1PR11MB7038.namprd11.prod.outlook.com
 (2603:10b6:806:2b3::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB7038:EE_|MN0PR11MB6232:EE_
X-MS-Office365-Filtering-Correlation-Id: 82e76af1-b7cf-4788-e268-08dd9e5fe2c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N1VEZkp2TzNnbHoyQUlUU3VyTDB5OXVkZ2JYV2RVUXh4bkc2NVZ0TjFoekxY?=
 =?utf-8?B?c3lDOVZTQ0t3TVVabFZyOVNCejl3bTFVR3kweXVTM3dZZVBtWmd1VDJQTGlO?=
 =?utf-8?B?eUVUNmNMTkpBOXIrR3prNmE2YU91TmxJMEtLWXNlTkFEY0xSaHZwYVhWcVIx?=
 =?utf-8?B?MmIxVVc3WldjaStRQ0N3MTFZYmZnQUJiNmR6NkUyQnJ6YStPM2J0TGN0ZGZu?=
 =?utf-8?B?QTdSdUsrWloyWmp3R09FSmx5cXkzNjF1clMzclBkbU1BUHl2MTVYNmd6aHBi?=
 =?utf-8?B?Z0RKdHY2MXpGejJaOG1hL1h2MHVIbCtJRTFENEIxcnhqRUc4ZThXcjFkZy9w?=
 =?utf-8?B?SlE4bXlZSnZvYzJ1bkpEdVdGNDRDZW5uYXRGQ0ZnY2ZHN0hSektndVc1UzNn?=
 =?utf-8?B?S1VadUQ1TkhEeVA1RzdSc0dBb1I1OWpuY3hyT0g3d0ltSGRnQXdjbHQ2Zjcw?=
 =?utf-8?B?d0l1aWplcWpsTFJtdHczTTlnLzJIZUZzUDB0NUJHY01Pai9yWWJDNmoxMlNC?=
 =?utf-8?B?ekNadFh3SlpjNFptY0hZRzAvaDJvSXlVUklOK0h2bVRja1pYY2JTb0MrUUIx?=
 =?utf-8?B?a2VIdWNKVmNuRkQzQUg2SkoxZU5sM1pWSkI0YnQ0OUNOQ0xKYk5za0VnRFAr?=
 =?utf-8?B?YUp6MU9oTGwyVWpiZFdJT1FPQWo2U3QxeWRzOGxYM040cXgwNzZHMGppcWJO?=
 =?utf-8?B?UzA4OVlnM0ZnSWJqNXNqS05FdTNGa0Q0VmRNTTVQK01oV3krUERsbnJ5Tmpz?=
 =?utf-8?B?R205MWpHS2JJK1RqZ3JIaUcxR3ZqQitFbFVMeWxqcnljc1pjVlhjMVJXRGx4?=
 =?utf-8?B?V2FtUGZqNVIrbUtaMHRLR0g3THVPdkdCb0s2VlZtRTE0Sk9pTDRhTlNjaUo5?=
 =?utf-8?B?VlRINGxxV3dJSnRLcGQzdFM0T3pvM3o3Qkl0Z3JxbkhIakgwNlN4RzVqRE9B?=
 =?utf-8?B?c1gvNURrd3RlenlFSlNHdEZmTVpJaWV3c1JySXJ5Y210MVVBUEtma3VKNG11?=
 =?utf-8?B?aWo2MFpLbkNrUTN2YzlUM09qaXZHQ1E2aVpEMkxxU2toS2l4VkVYRVdzQTBk?=
 =?utf-8?B?SHFBK2tkQTErOEVqaURZL3ZkYkxENlEweGZsUldPY1htbHV2UnhHWkRBL0lv?=
 =?utf-8?B?RWNvUlZWU09yUXFvSW5NU2tucE5oUHVRbVV6bXZMekphRi9lb2N4WVpCUno3?=
 =?utf-8?B?RzZxWnE0NzdVNzJ3RXhGT1hpMGtEb3RFVVdOR1ZZaHFsd01KQWQyY2RiMFM3?=
 =?utf-8?B?dk5wUUpmSXNkRXFWZmE3bXJJbk15Ry9LcDNqWEVxOVpCVm1Bbjh3M1F0Y2FN?=
 =?utf-8?B?U3BDS3RsdUtUdk45UlgvRU1tK3dhV0k2VXZDMHpjSDdaNExXU2ZQb2ZUamJL?=
 =?utf-8?B?M1FtbGoveEpIS3MzV1k3YzZrdkUxUG85RVZXdnhiSmhsV20yWlZFeTZ3ME80?=
 =?utf-8?B?d0piWTlkL3U0d0ZSVEZBU2hEU2Y0TE15UW9qU2JXcG12WFZxL3k2cEc2ZHgz?=
 =?utf-8?B?OVF0Z0E3WnJ3L05BVCtxWjJxUmZWOElXTDZGQUpuNHJ0enQyQ1pmNmw5bENa?=
 =?utf-8?B?clBzOEtmbXRjTEIwQy80WmF2QnFSY3VJTFhBTU5iWWo4WWJBenRnZDY0eHNL?=
 =?utf-8?B?SkVwSlZkbzlCYlhsWUljNUhOTFd3SDVaMEt0QSsxSGN0ZjcxYkE1SkFCMXFB?=
 =?utf-8?B?enBCc2lQVjE0T05YVzdCTGFyK1JHeC8yTU5JNDUzSmN0bEVtclk1d3pDaDVu?=
 =?utf-8?B?K29hVjU0c2F4Y3lCK0VJR0o2bENLUUw2aHVqdVBkMHhqWUJZM3BQNWNLVU1D?=
 =?utf-8?B?dkJrUi9TWTZyL2VuL0tTSDRHdVNoWFNkdm5RUXFKQXlpRnJWL3dKYjBhc2FY?=
 =?utf-8?B?d1ErMkxQbFVPMlNqbmVpeDVvdDB1V2dudEorNVJRYXBjNW42SmFlUENCSGpq?=
 =?utf-8?Q?vOXzlO80QoE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB7038.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eVJPNFA5TWFGTThhSWYzQUxxR3dRYlN1eEZnWHZTOTBjeFh2dW5CWmYzU0p5?=
 =?utf-8?B?TzVicTNGT0pGUVZ6RnFRNGMvdEs4ekUzNFZLSVBlUGhESW50UEc0aGNXcHlW?=
 =?utf-8?B?TzNtZG9CNVlLR1ZpUUUwOFRxREQwVHVjOFUzM2QycUNDVFNRN0FqeS9jWWdt?=
 =?utf-8?B?Y214NEpOaGNqeDZXMGpybXNDbWcxSnMvTkdCNnh4Zmg3TGRmbXV4dXQyTWF5?=
 =?utf-8?B?d1N6RWdNZ3FsY1Y5UjYwSjM3YmhGZ0ZQNGVBVmJwc0tyUFhKTzlXTWZLUWg5?=
 =?utf-8?B?cXNXUXgyUTJ2eG8zYkRLUjVaNHhUQjJGYkl3dnliaTgwVGZXcld4eC9zK1Bu?=
 =?utf-8?B?UUx4amRRSjNWcUI4K3d5Ni9Fb0VXeUE0NExNVEhFaTk2UFNvL1g4M01lVHYw?=
 =?utf-8?B?WnBTRHByd3U5NTdaYVh2akRpNDF6R1FQM0t0REpyVG1BUVYycFg0QXIyM2Qr?=
 =?utf-8?B?a0xSZ3ZnQ0p4VTduWWdVV3ltTnFXb2orYjlsMXk1dVJ4OTdrVXRBODZYanhx?=
 =?utf-8?B?eXA1ZU9xNWY4MlN4Sk1QYlhEdTU0UDlzd2FkclNQd3VBRHJlMWtSc3owcjNG?=
 =?utf-8?B?NEtiY0NYTzRJZUR2QjBoZDRGVWRUa1paNmxpVjI2Rlp0eHdMWU1xMFY3Wm9o?=
 =?utf-8?B?eDdKQXNGRFVwREkwajFGMTBRbldTcERzUkNkZW9XQ2Q3cHh5T1M0NEFQWGFS?=
 =?utf-8?B?K0lnRGlwL3F4UkhIQkIxOEFOUDU0SVdtc1phSmQ1TU1reXNmU3lCMCtlTnA5?=
 =?utf-8?B?eDFoYWE3YXorQWVvYnJqa1ZBNEtMTE1hajF0cE1RazAyT3g0VEVNUzJMdFRi?=
 =?utf-8?B?dzlpYW5JbXVNdy85eDdPUW5ET2RvdEZyUWZYNks0VlJkWmk0ZUJ2RFFxcXVR?=
 =?utf-8?B?cXdhb2ZZNGtMVlRYc3lBVUt5dW0xajNzSGJ0clhkN1praTNqakZoaENuUUFz?=
 =?utf-8?B?NUhFOHk2eXRUZk0zZ21jSkRrT2xla1FKQVM5cjlJLzJsbUl4VVF1QklUWCt3?=
 =?utf-8?B?d0Z3UnZlRlNDWGplclUxMHJpTmk0b2RBK1ZIcFMwRUZSK1ZZeTd3VExLenR2?=
 =?utf-8?B?b2QvV1lzSDRLNExFNFBHNzlIMEVTVE9LZTlmM0cxcktUT3pmdjcyNU1FbCs0?=
 =?utf-8?B?aFFKSlNVblRpdUIwbHdISkh4VVhqbGdBTGNMTjM3WWhwa0QvSG9hYmZtZGQ0?=
 =?utf-8?B?UTBSa2hYSk5Yb294eDV4UDFOWTVhNzdDQVhyTmQyMHQxOVp1YWxoL1k1TnZC?=
 =?utf-8?B?R2ptMlZaSTA3Z05TTEJyekcrZUUrczhaZW9VWHBhSkppUjIvcGl6YWVVakNa?=
 =?utf-8?B?MGp5K0ZTUmRjalJmazN3aE1BOWdvL2NqRlpiRHlhaEJnNkhUUWtjaExaMUdW?=
 =?utf-8?B?dUZVSnlDU1c0QlQ4QjdxRlNlbGhLdXBUYk1KT2c3WDFUSGtMUC9kT1l1TFdq?=
 =?utf-8?B?eTdJQVdWRzlVQ0F2N1AwdVE2MXBHcEZpME1Bc28zaWUyTkxBdm9QMmZQUnpt?=
 =?utf-8?B?STlQK2hCTHpEd2Fzd1FtYnV6ZVNjQU44QzkvWmpYNWllOEpFUnljU1NXOFpL?=
 =?utf-8?B?Z3JqZWprQzRzcjhmRXdNejA2QzN3WjlGL1JyMExhejQ5OXRGUWdjMTZKY3ow?=
 =?utf-8?B?WlV6eGl4SlhnQTkyYytkSFVjeXRlcFovYS95T3JrVk1kamNOSGRvSHB6Q0tk?=
 =?utf-8?B?cHRqSmZib3pPLzJERmxEeWlPMTNNQi9jM0RxWFN3c1hKVFhqeXhNT1l2eXc0?=
 =?utf-8?B?THE2elFRc084ZUxsOFdtaHlSK3lyQzV5dEN2citGYUNrQ1U5ajEyTWpYSS8x?=
 =?utf-8?B?Nm50NjZ3VXUrK2J1Y09lQkUxVCtmNkhJOVAxNHMxQjQ2cVpTUGdKVlVWZ294?=
 =?utf-8?B?Y2J0bW1oK3lJT1NqaEZsakhUbWo0TXVRNWxERHVRVjRpMkxZMzZUVy9iZG5X?=
 =?utf-8?B?NVZFWEh4Z2dTc2JGK0FkZmRvVnhsZWp4WVBIM3NwUUJWQ0Y5d0VVSEcwSm80?=
 =?utf-8?B?UU5LUnlZZlgybUxydnZPeGEvaFM5NEdYOEJENzZRSnM4UlVJMkgyT3NBRk9L?=
 =?utf-8?B?b1A1aVNLSHh3YXZJdVpMbitrcFA3RWEyY0U3RTRiRFlEc0owNGFqMDhVSUIv?=
 =?utf-8?B?YWtuZlo1QVgreE9TVWsrdTRwTlJxdGc5TDJRdDRCL3RBeEEyYzNxdlBPekdI?=
 =?utf-8?Q?bKlAcJyp5DwUco4OfGAw7CA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 82e76af1-b7cf-4788-e268-08dd9e5fe2c7
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB7038.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2025 03:21:22.3896 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2XL9VVUmcclBIDDVgbIhXvMfVwQ57eUmgSwTSEBQXntXnvM3Fh0464faa1URkm3Kb4b7r7tNKkqYq+nwiqcmbQU/SJ1vuLXHxTYuLaAwkrM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6232
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



On 29-05-2025 04:42, Matthew Brost wrote:
> On Tue, May 27, 2025 at 10:09:51PM +0530, Himal Prasad Ghimiray wrote:
>> Introduce xe_vm_range_tilemask_tlb_invalidation(), which issues a TLB
>> invalidation for a specified address range across GTs indicated by a
>> tilemask.
>>
>> Suggested-by: Matthew Brost <matthew.brost@intel.com>
>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> 
> A couple nits, but feel free to post a follow up as independent patch to
> merge ahead of madvise.

Sure

> 
>> ---
>>   drivers/gpu/drm/xe/xe_svm.c |  43 +--------------
>>   drivers/gpu/drm/xe/xe_vm.c  | 103 ++++++++++++++++++++++++------------
>>   drivers/gpu/drm/xe/xe_vm.h  |   3 ++
>>   3 files changed, 75 insertions(+), 74 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
>> index 871ac81bb04a..59e73187114d 100644
>> --- a/drivers/gpu/drm/xe/xe_svm.c
>> +++ b/drivers/gpu/drm/xe/xe_svm.c
>> @@ -167,14 +167,9 @@ static void xe_svm_invalidate(struct drm_gpusvm *gpusvm,
>>   {
>>   	struct xe_vm *vm = gpusvm_to_vm(gpusvm);
>>   	struct xe_device *xe = vm->xe;
>> -	struct xe_tile *tile;
>>   	struct drm_gpusvm_range *r, *first;
>> -	struct xe_gt_tlb_invalidation_fence
>> -		fence[XE_MAX_TILES_PER_DEVICE * XE_MAX_GT_PER_TILE];
>>   	u64 adj_start = mmu_range->start, adj_end = mmu_range->end;
>>   	u8 tile_mask = 0;
>> -	u8 id;
>> -	u32 fence_id = 0;
>>   	long err;
>>   
>>   	xe_svm_assert_in_notifier(vm);
>> @@ -220,42 +215,8 @@ static void xe_svm_invalidate(struct drm_gpusvm *gpusvm,
>>   
>>   	xe_device_wmb(xe);
>>   
>> -	for_each_tile(tile, xe, id) {
>> -		if (tile_mask & BIT(id)) {
>> -			int err;
>> -
>> -			xe_gt_tlb_invalidation_fence_init(tile->primary_gt,
>> -							  &fence[fence_id], true);
>> -
>> -			err = xe_gt_tlb_invalidation_range(tile->primary_gt,
>> -							   &fence[fence_id],
>> -							   adj_start,
>> -							   adj_end,
>> -							   vm->usm.asid);
>> -			if (WARN_ON_ONCE(err < 0))
>> -				goto wait;
>> -			++fence_id;
>> -
>> -			if (!tile->media_gt)
>> -				continue;
>> -
>> -			xe_gt_tlb_invalidation_fence_init(tile->media_gt,
>> -							  &fence[fence_id], true);
>> -
>> -			err = xe_gt_tlb_invalidation_range(tile->media_gt,
>> -							   &fence[fence_id],
>> -							   adj_start,
>> -							   adj_end,
>> -							   vm->usm.asid);
>> -			if (WARN_ON_ONCE(err < 0))
>> -				goto wait;
>> -			++fence_id;
>> -		}
>> -	}
>> -
>> -wait:
>> -	for (id = 0; id < fence_id; ++id)
>> -		xe_gt_tlb_invalidation_fence_wait(&fence[id]);
>> +	err = xe_vm_range_tilemask_tlb_invalidation(vm, adj_start, adj_end, tile_mask);
>> +	XE_WARN_ON(err);
> 
> WARN_ON_ONCE

ok.

> 
>>   
>>   range_notifier_event_end:
>>   	r = first;
>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>> index de6ecff237a6..d60b711e97e9 100644
>> --- a/drivers/gpu/drm/xe/xe_vm.c
>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>> @@ -3851,6 +3851,68 @@ void xe_vm_unlock(struct xe_vm *vm)
>>   	dma_resv_unlock(xe_vm_resv(vm));
>>   }
>>   
>> +/**
>> + * xe_vm_range_tilemask_tlb_invalidation - Issue a TLB invalidation on this tilemask for an
>> + * address range
>> + * @vm: The VM
>> + * @start: start address
>> + * @end: end address
>> + * @tile_mask: mask for which gt's issue tlb invalidation
>> + *
>> + * Issue a range based TLB invalidation for gt's in tilemask
>> + *
>> + * Returns 0 for success, negative error code otherwise.
>> + */
>> +int xe_vm_range_tilemask_tlb_invalidation(struct xe_vm *vm, u64 start,
>> +					  u64 end, u8 tile_mask)
>> +{
>> +	struct xe_gt_tlb_invalidation_fence fence[XE_MAX_TILES_PER_DEVICE * XE_MAX_GT_PER_TILE];
>> +	struct xe_tile *tile;
>> +	u32 fence_id = 0;
>> +	u8 id;
>> +	int err;
>> +
>> +	if (!tile_mask)
>> +		return 0;
>> +
>> +	for_each_tile(tile, vm->xe, id) {
>> +		if (tile_mask & BIT(id)) {
>> +			xe_gt_tlb_invalidation_fence_init(tile->primary_gt,
>> +							  &fence[fence_id], true);
>> +
>> +			err = xe_gt_tlb_invalidation_range(tile->primary_gt,
>> +							   &fence[fence_id],
>> +							   start,
>> +							   end,
>> +							   vm->usm.asid);
>> +			if (WARN_ON_ONCE(err < 0))
>> +				goto wait;
> 
> Let's just have the WARN_ON_ONCE in the SVM code at the caller - that is
> the place where we can't really fail and warrents the warn.

ok

> 
>> +			++fence_id;
>> +
>> +			if (!tile->media_gt)
>> +				continue;
>> +
>> +			xe_gt_tlb_invalidation_fence_init(tile->media_gt,
>> +							  &fence[fence_id], true);
>> +
>> +			err = xe_gt_tlb_invalidation_range(tile->media_gt,
>> +							   &fence[fence_id],
>> +							   start,
>> +							   end,
>> +							   vm->usm.asid);
>> +			if (WARN_ON_ONCE(err < 0))
>> +				goto wait;
>> +			++fence_id;
>> +		}
>> +	}
>> +
>> +wait:
>> +	for (id = 0; id < fence_id; ++id)
>> +		xe_gt_tlb_invalidation_fence_wait(&fence[id]);
>> +
>> +	return err;
>> +}
>> +
>>   /**
>>    * xe_vm_invalidate_vma - invalidate GPU mappings for VMA without a lock
>>    * @vma: VMA to invalidate
>> @@ -3865,11 +3927,9 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
>>   {
>>   	struct xe_device *xe = xe_vma_vm(vma)->xe;
>>   	struct xe_tile *tile;
>> -	struct xe_gt_tlb_invalidation_fence
>> -		fence[XE_MAX_TILES_PER_DEVICE * XE_MAX_GT_PER_TILE];
>> -	u8 id;
>> -	u32 fence_id = 0;
>> +	u8 tile_mask = 0;
>>   	int ret = 0;
>> +	u8 id;
>>   
>>   	xe_assert(xe, !xe_vma_is_null(vma));
>>   	xe_assert(xe, !xe_vma_is_cpu_addr_mirror(vma));
>> @@ -3893,37 +3953,14 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
>>   		}
>>   	}
>>   
>> -	for_each_tile(tile, xe, id) {
>> -		if (xe_pt_zap_ptes(tile, vma)) {
>> -			xe_device_wmb(xe);
>> -			xe_gt_tlb_invalidation_fence_init(tile->primary_gt,
>> -							  &fence[fence_id],
>> -							  true);
>> -
>> -			ret = xe_gt_tlb_invalidation_vma(tile->primary_gt,
>> -							 &fence[fence_id], vma);
> 
> You can delete xe_gt_tlb_invalidation_vma now as this was the only
> caller.

Makes sense.

> 
> Matt
> 
>> -			if (ret)
>> -				goto wait;
>> -			++fence_id;
>> +	for_each_tile(tile, xe, id)
>> +		if (xe_pt_zap_ptes(tile, vma))
>> +			tile_mask |= BIT(id);
>>   
>> -			if (!tile->media_gt)
>> -				continue;
>> +	xe_device_wmb(xe);
>>   
>> -			xe_gt_tlb_invalidation_fence_init(tile->media_gt,
>> -							  &fence[fence_id],
>> -							  true);
>> -
>> -			ret = xe_gt_tlb_invalidation_vma(tile->media_gt,
>> -							 &fence[fence_id], vma);
>> -			if (ret)
>> -				goto wait;
>> -			++fence_id;
>> -		}
>> -	}
>> -
>> -wait:
>> -	for (id = 0; id < fence_id; ++id)
>> -		xe_gt_tlb_invalidation_fence_wait(&fence[id]);
>> +	ret = xe_vm_range_tilemask_tlb_invalidation(xe_vma_vm(vma), xe_vma_start(vma),
>> +						    xe_vma_end(vma), tile_mask);
>>   
>>   	vma->tile_invalidated = vma->tile_mask;
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
>> index 99e164852f63..1ef98113fa5b 100644
>> --- a/drivers/gpu/drm/xe/xe_vm.h
>> +++ b/drivers/gpu/drm/xe/xe_vm.h
>> @@ -228,6 +228,9 @@ struct dma_fence *xe_vm_range_rebind(struct xe_vm *vm,
>>   struct dma_fence *xe_vm_range_unbind(struct xe_vm *vm,
>>   				     struct xe_svm_range *range);
>>   
>> +int xe_vm_range_tilemask_tlb_invalidation(struct xe_vm *vm, u64 start,
>> +					  u64 end, u8 tile_mask);
>> +
>>   int xe_vm_invalidate_vma(struct xe_vma *vma);
>>   
>>   int xe_vm_validate_protected(struct xe_vm *vm);
>> -- 
>> 2.34.1
>>

