Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33E0CC982E6
	for <intel-xe@archiver.kernel.org>; Mon, 21 Sep 2026 16:47:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF90D10E2B6;
	Mon, 21 Sep 2026 16:47:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aNIKw3mC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F06D10E2B6
 for <intel-xe@lists.freedesktop.org>; Mon, 21 Sep 2026 16:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790009266; x=1821545266;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=ojHDPLrASJJ0V7uXRYWg39C9om4/ZCw7y/hC7d25dro=;
 b=aNIKw3mCI5PQEkzLxLXJeh/a3ZbNCVGqmmAscbcCFKuf2uraNk8gsDPH
 je2T3oNcmqKm+QUIPGsRdATFm8VDkW9+QajtU1/vlaoMoHKS47TO2P14V
 CGGmqDwcOQX0jRXh69FU3iJx0KBCIl1DqAsZxk88+RmJCjl0CBn9p+NuE
 AiUOfTkAh0tOiyXMPqnQzRQI9+zP98MsNNEr4G38iUGjvELPjjl/3W9EW
 af5N38jMt6vv0yJpfwGNFZt+nGsO8CQz3UGXGuGlUx+QsusIPE4d+Hua6
 HWAIO4VZcJ8lgwfKUJ8n8F7/Ia2naKugN7Xu8QmXpJovpY3NiOAsGuKAZ g==;
X-CSE-ConnectionGUID: iOsyUCV3QxuM36rICM0CqQ==
X-CSE-MsgGUID: tQyHrzK/TiG/iC3/Vfy73Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11912"; a="94366877"
X-IronPort-AV: E=Sophos;i="6.27,115,1787036400"; d="scan'208";a="94366877"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2026 09:47:41 -0700
X-CSE-ConnectionGUID: famqBSPnRHOWplKAD/ZCOg==
X-CSE-MsgGUID: zgFq2TTDS1y/39jmEukmDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,115,1787036400"; 
   d="scan'208";a="3808209"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa011.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2026 09:47:41 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 21 Sep 2026 09:47:40 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 21 Sep 2026 09:47:40 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.37) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 21 Sep 2026 09:47:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u4ov2siLfQSRJe0FAbWcGEhVj3C4bx5Em+T6ZwPQjBmO99T/bdlmpUApB450ta6vfu7rvSp8GLChZXDsaSee+RcCBl4/IAOxUMC0x7ZHam4xcZNNPGyUL9vgFsvLJzNP5LM8PnJQOxpmDlP+OW4NRZ3fa/dvaHOBOPgT8IGP5EUXHRli6f00Q3nzTKqDYB/+i7FkSdocuZlowPwZMNBHr9PRmtMApRQznsme2rIQc9VhYzNDuV15502acfF8Ooa4bCgHQWKbLsUlN7WhFVvqkzOM99UMn39ntcR8W9YvwXgjn/+TwtqwqnGsUBcBwzpIkXdn9ltFXPrjzf7iCxZjGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HOdGkP46mMM84tuueAhmyQb+zTG+fiQ/xV7evkBeeEs=;
 b=izQAnRvi2QrHBxJ9koIspR8YuFHtYzHUYms6ZAJBuWYzIzNqbQ1zOr2Oh10euW4o/95x+GcrJgRADCtigAgNxs1jLTu72WmPGIUho1xvkKAFDF7vEMp6YsrW9IxE5kQgY25DE2OPz5mBBiyHjl7jl49tQwnnwo+wrvRaUvWK2zT/WjJdUj1zEKojlI7hx/JZUvvDUX9SezGtJTv1WKIEtGxMklEnUXtUVmW5U5X6QztSONo/JrpLbj6hHbMCiy6Jk+U1O2BhT7LcAw5wt7sSWMqao4KXU7G8IU4wntrXg69eoOkf/93aVdf0zJRgAKE6A53kR8FHn/X3MMeGjNwtvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7551.namprd11.prod.outlook.com (2603:10b6:510:27c::12)
 by SA3PR11MB610523.namprd11.prod.outlook.com (2603:10b6:806:589::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Mon, 21 Sep
 2026 16:47:32 +0000
Received: from PH7PR11MB7551.namprd11.prod.outlook.com
 ([fe80::5cbf:6b33:5f0c:88a0]) by PH7PR11MB7551.namprd11.prod.outlook.com
 ([fe80::5cbf:6b33:5f0c:88a0%4]) with mapi id 15.21.0428.009; Mon, 21 Sep 2026
 16:47:32 +0000
Message-ID: <574bef27-77be-4a77-8bf2-4389cac8615b@intel.com>
Date: Mon, 21 Sep 2026 18:47:28 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 10/10] drm/xe/tests: Add KUnit tests for VF
 provisioning error handling
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20260921092101.1243989-12-satyanarayana.k.v.p@intel.com>
 <20260921092101.1243989-22-satyanarayana.k.v.p@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260921092101.1243989-22-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA1PEPF00005B80.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d8::608) To PH7PR11MB7551.namprd11.prod.outlook.com
 (2603:10b6:510:27c::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7551:EE_|SA3PR11MB610523:EE_
X-MS-Office365-Filtering-Correlation-Id: b4733032-3cf2-4f10-82ec-08df18000808
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|1800799024|4143699003|10067099003|22082099003|56012099006|11063799006|6133799003|18002099003;
X-Microsoft-Antispam-Message-Info: pbqBQ3gt735wfs8Hnv+49vfbT5L8yR1SeqzaJ8A7cohA24aDq4J1JaNRGCLsb8rMJJaa4qLYpK4IvZ7zO5VHQrg7huiMsvzKPRDYA70XNSeOYU5oL/X1uNZxXOSzawk5T50MnW502CKhh7kz4L3Xy6VRf4aqkealEzdg50sJePmOEKnty3Ga5fP857ekn6O1SpN/vPXf1d7YVawNyCnLEFIz6rn+dZx9yCPehcQVjuJtfghSyVxzO7qb2LacSEfofB7Xijc65QLvLNsG5mKMguSy2aWgQGPGFFd6QSz7yRh23/hQ12FN74/vRwr7RPpvOdMnBUNTebCi0x0hFauvdEwIaYgwhaebBhMVmDRqq4GrhpdPiiKA0IJsaFbVYEqL6jBPc99EkF/gc/LbPqRI63mjdLzjN5+y+2t4fZQPE9nr729ALnQwYetNt1b+C84qVnS2r4wOUXLiP8pDF58jJlHN8sF+jKEpDv2GpRqJvdoYVeujQLsDhfqFMWK+ZDbmg56JO9UaFGXKAqSSoqSvgst9UpcBRpwc0O/Ru0XhZiCAHpLKEbEKWTfUiZzjKdOIOyLE0RYWKBEyxwI+EfpO081dxSwAxSctyD/Cbd+om6UTld826RrOsZQxCb7Vg23V+51ZgxRb1/WFR+FVyR47tfR7JZAhR5sF1Ki3CKz250E=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7551.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(4143699003)(10067099003)(22082099003)(56012099006)(11063799006)(6133799003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dUVqZ2xuQ2xscUM3RXhUYkhMTE1KL2tqR1FLSjRwQnB4LysvT3hkcWVlUGlX?=
 =?utf-8?B?NXJ2ajUwZVBYMlNIMERPdEFlMEFsbEFJS2V1R3ZOVGxGSWV3bnZSYTc4NkUr?=
 =?utf-8?B?akowbXphQSsyTG8ralFlaUpjUmpUZFhqZE13WFRkVWxjdW1kZTE5UWEwKzJJ?=
 =?utf-8?B?cld1d2lvWG8zQm9Kd3JyY2N5VjFBVE5UeVFDNjREUUlERHk5RGttV1NEcVlG?=
 =?utf-8?B?Y3lLc29nSkxYTmg5TWFoRHIzS09jdWViN0o5NUIxVmRpb0ZRbzg0bDNxdnhM?=
 =?utf-8?B?djRaZXRvMFZlSkw2bDJoOHNJVDFGTHRLU2hQMFdzV0pobEJ6YzF4UVZCMkFs?=
 =?utf-8?B?aDdOUTNEbXJLT0FGVTF0bi9vTjVxYzdNSThEQW1CeStadHIwWU45SDdnNE5k?=
 =?utf-8?B?VXl2RGovQnRLTnlMOXVONkJQbHVlSEN0dmZDYmFVdTFRSzk4bGlrZmU1NW9k?=
 =?utf-8?B?dG5wNWNCNmVMZHIzUmIzczZSQXJJNi9FN1dNV253amVZMWFqNlpycklRemhI?=
 =?utf-8?B?cnREQWNLdFVFbGlwSytGTlJVdVhwRmVPbElpTGFHVE5wZUZpTGJHLytJSnVB?=
 =?utf-8?B?TVBFUldrU1FRQlV1NGk0QTN2V29QUEd2bTFaQzZxWG50REVBVVhJVy9sdkty?=
 =?utf-8?B?SnMwSWc1cUIvckhKbkJyNG42QVhNcy9adjNVSElpZmtRTGNHME1ia2JFMWJI?=
 =?utf-8?B?cmVLV2x6V2taUUlnVXk4UzA3cTNRSUFDS1IxOWMzRUdvSkkrK3ZJa1V0T1k5?=
 =?utf-8?B?WFFNQ05WNU1jSnJ6Y2JOVzBGQXUrMVNmK3gxOURHVi84SW5ad09jUmhaczl0?=
 =?utf-8?B?VGV1RTJWeGF2MGVMaURyaEowUEk0RWRpUTVBY1hwVTUveWcyNTYrdHM1ODJV?=
 =?utf-8?B?T1RhbXlzQ1pVSTlMSzRZbG8xeHVKNHhHVUd2R3d4aGtPUDJzdlFUMWhCM3du?=
 =?utf-8?B?VDlFekJRTG1HZlpaQTQ5UzlxaGxrT0o0THJZQVNiRWpFYjBoL00xeGNwODBU?=
 =?utf-8?B?ZVBpR1c0OU5uWENmRXExVHpYakRFWDRSbmNKZlplaWdoenUvVm9PVGlPY1dS?=
 =?utf-8?B?SmxwMzdhbzNjdW9SdlhmZkVvbGNCb2JDY3Q1MWkzWVlsRWJrb1Vwb2loaklo?=
 =?utf-8?B?YTh2bW50SGVEbmF5ZndPSG1iaXY4cHJnQWpsTTVVNUdtV1pEajhvdCtsa2ZS?=
 =?utf-8?B?b0hDSHRoeTc4Z2l4WWdRVzhHUEI0alFPVU5FU3Y0YWpIU0FjNVdOUDNnb01o?=
 =?utf-8?B?SFdWMGVmVVIzb0JTeXh0b25vTXJCTXRQdGVFdUlpOElvNTgrenAzNHE2NDNK?=
 =?utf-8?B?SmI2MFUwNmttZE1UK05vWGhONmlCWHprc1A4Zk45emZSaUlWdEkyNzlscVAv?=
 =?utf-8?B?Q0JhOWdMWDJFNXRXMTBrRVUvOCt0YWIyMDRqQXMyWUJrT0IyWmMyVXdFWlZs?=
 =?utf-8?B?Unk1TEtiN3o4WW80RUJVOUgxNkVoR0NiSEJlNmZ5aVhXajRVeE5sbEwvZVhJ?=
 =?utf-8?B?NnZiaU5pVTNzWUE0U3VmSEY0NVpEWnlNWE1MWWp1OUo3SVhpTVZiTzg3eWxz?=
 =?utf-8?B?OGVxQ1liazFlSHk5N3dhYkVXQnpqWGp2cTRKKzVrQzA5WVptV0dmdWVnTVFG?=
 =?utf-8?B?dHQ3UDBNVFdmTERnd3EvdG93WXNvWEVrZS9QbFRuQTlDOG56NVRaNmJGaFpN?=
 =?utf-8?B?d3g0VG1JSWJhdEh4UVdvdVYzZU5nSzkycnNBUm1EL0QxSzB5NW9uVHRtUEtm?=
 =?utf-8?B?OWZwVjBiNWMvM1UyN0JzbUYwbDQxWUJabmdYZHlSUjdBODNoYWN3ekNSVnRT?=
 =?utf-8?B?aFg5TktndmtvSm91SENoUkFvNEtGd3MwM1F0a0F4UnJqR1lvZlk0cVNKb2RY?=
 =?utf-8?B?citwckZOS2o0ZitCeTZFWFlGN2hlOCt4bHlsUksrLzhFOXZ6b2FFQnlzcEZs?=
 =?utf-8?B?blBpdkw1WWYvVjdVVlh3K1dOLzFHRkJnUnRXS0VFbkhuSzBsTWEvL0Q1MUpl?=
 =?utf-8?B?ZjcxQlg4Vi9MNFJHb0JXaitnRVNuQnlnVitsZE16WlZiL2dxc0VpSm1CODBp?=
 =?utf-8?B?cVlpbDM5NWZoaTB1UHAwbUM1U3pEWi9mT2VQLzBkZXBhWjhVWC9zWTEyUVJs?=
 =?utf-8?B?RHE4ell3RWtCSDg3TnZhQVFjMllYR2paMk9IUFVYT09ZZEZieUhwZHhDc1hC?=
 =?utf-8?B?d0UvZ1lhWHhIeC9YTjJ4SnRQY3N2d0k4ZzJKekZ1eStNMUNBVDBwdnJmTjQw?=
 =?utf-8?B?OHRBZ21Gb2dIRE80M2J0RCtkbGxjUGdIZ2dwdDU2SWMzK04vN0N2aG5haTEx?=
 =?utf-8?B?MHdvcVhTSW8xdXk3UXh6MWtzelArcERTakxGbVpEUU9Xa3RyeklXK0JDQ0l6?=
 =?utf-8?Q?ckRLGr9H9NB1EbQI=3D?=
X-Exchange-RoutingPolicyChecked: hTmGoO1UElEQyDFjUVNhwM8NKdaWyUJZIOplB4fs+0r7RlWh5rmaK+XgmXZHSSVGr87wCGVSijTXGSYXvwHzdK9u+CPvFLSJxdwC7lMVfuG4lfe18nd2iA0rZBO7xbcVnFTQiY2XwbyW34JPocj59bh2jAYOlmI088QEGA3YdQcT/B2blZzHTW+SfvGrMTywhc+80b6L5bzdy9ZuZ82Q7ucSSro7O++eJlX+J+G23z+aKuHTN9fzZDc89ctaOJ6os9eOY9ARrM5B36nTzWovv6IzfQk3I+3A7QHrKJQjFMDRpJE2DpqjMNJ5ZYO94k7W2xpBoqjlv6Gn3DEq7C38Hw==
X-MS-Exchange-CrossTenant-Network-Message-Id: b4733032-3cf2-4f10-82ec-08df18000808
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7551.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 16:47:32.6109 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4Vjr70d3Aei9cLsJOlr+zq8ESmL2z6ULjDgonekv7vUysUt41RbxS73g+OErEN22OpoHejJ6xGjuXAtFYeAGn7KQK3CAVmLvOmbkaS2Mik0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB610523
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



On 9/21/2026 11:21 AM, Satyanarayana K V P wrote:
> VF relies on the PF to provide a valid hardware configuration via GuC
> KLV responses. In the unlikely event of PF malfunction or
> misconfiguration, a VF may receive incomplete, zero, or out-of-range
> values for its submission contexts, doorbells, VRAM or GGTT assignment.
> 
> Add KUnit test cases that use the xe_guc_mmio_send_recv() stub to inject
> bad KLV responses and verify that VF can survive without crashing for
> the invalid configuration data received.
> 
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
> V9 -> V10:
> - Fixed review comments (Sashiko).
> - Use (hxg_sizeof(u64)) + 1 to keep checkpatch.pl happy.
> 
> V8 -> V9:
> - Fixed review comments (Michal W).
> - Updated test_guc_mmio (Michal W).
> 
> V7 -> V8:
> - Updated kunit test as per changed from other patches.
> 
> V6 -> V7:
> - Fixed review comments (Sashiko, Michal W).
> 
> V5 -> V6:
> - Fixed review comments (Michal W).
> 
> V4 -> V5:
> - Added alignment tests for vram, GGTT base and size (Michal W).
> - Separated stubs for ctx, db, vram and GGTT (Michal W).
> - Added new test cases for xe_guc_mmio_send_recv() (Michal W).
> 
> V3 -> V4:
> - Changed stub function from guc_action_query_single_klv32() and
> guc_action_query_single_klv64() to xe_guc_mmio_send_recv() (Michal W).
> - Fixed review comments (Michal W).
> 
> V2 -> V3:
> - Renamed the test names. (Michal W).
> - Fixed review comments (Michal W).
> 
> V1 -> V2:
> - Renamed the test file (Michal W).
> - Fixed review comments (Michal W).
> ---
>  .../gpu/drm/xe/tests/xe_gt_sriov_vf_kunit.c   | 676 ++++++++++++++++++
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.c           |   4 +
>  2 files changed, 680 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/tests/xe_gt_sriov_vf_kunit.c
> 
> diff --git a/drivers/gpu/drm/xe/tests/xe_gt_sriov_vf_kunit.c b/drivers/gpu/drm/xe/tests/xe_gt_sriov_vf_kunit.c
> new file mode 100644
> index 000000000000..4830369dd47e
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/tests/xe_gt_sriov_vf_kunit.c
> @@ -0,0 +1,676 @@
> +// SPDX-License-Identifier: GPL-2.0 AND MIT
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#include <kunit/static_stub.h>
> +#include <kunit/test.h>
> +
> +#include "regs/xe_guc_regs.h"
> +#include "xe_device.h"
> +#include "xe_ggtt.h"
> +#include "xe_guc.h"
> +#include "xe_kunit_helpers.h"
> +#include "xe_pci_test.h"
> +
> +#define TEST_VRAM			SZ_8G
> +#define TEST_GGTT_SIZE			SZ_2G
> +#define TEST_GGTT_SIZE_OUT_OF_BOUNDS	0xfffffffffffff000ull
> +#define TEST_CTXS			1024
> +#define TEST_DBS			128
> +#define TEST_GGTT_START			0xa0a000ull
> +
> +static inline void assert_valid_query_klv_msg(struct kunit *test, u32 len,

drop "inline"

> +					      const u32 *request, u32 key)
> +{
> +	KUNIT_ASSERT_EQ(test, len, VF2GUC_QUERY_SINGLE_KLV_REQUEST_MSG_LEN);
> +	KUNIT_ASSERT_EQ(test,
> +			FIELD_GET(GUC_HXG_REQUEST_MSG_0_ACTION, request[0]),
> +			GUC_ACTION_VF2GUC_QUERY_SINGLE_KLV);
> +	KUNIT_ASSERT_EQ(test,
> +			FIELD_GET(VF2GUC_QUERY_SINGLE_KLV_REQUEST_MSG_1_KEY, request[1]),
> +			key);
> +}
> +
> +static inline void fill_resp_buff(u32 *response, u64 query, size_t type)

drop "inline"

split into:

	static void prep_query_response_32(u32 *msg, u32 value) { }
	static void prep_query_response_64(u32 *msg, u64 value) { }

> +{
> +	if (type == sizeof(u32)) {
> +		response[0] = FIELD_PREP(VF2GUC_QUERY_SINGLE_KLV_RESPONSE_MSG_0_LENGTH,
> +					 sizeof(u32) / sizeof(u32));
> +		response[1] = FIELD_PREP(VF2GUC_QUERY_SINGLE_KLV_RESPONSE_MSG_1_VALUE32,
> +					 query);
> +	} else if (type == sizeof(u64)) {
> +		response[0] = FIELD_PREP(VF2GUC_QUERY_SINGLE_KLV_RESPONSE_MSG_0_LENGTH,
> +					 sizeof(u64) / sizeof(u32));
> +		response[1] = FIELD_PREP(VF2GUC_QUERY_SINGLE_KLV_RESPONSE_MSG_1_VALUE32,
> +					 lower_32_bits(query));
> +		response[2] = FIELD_PREP(VF2GUC_QUERY_SINGLE_KLV_RESPONSE_MSG_2_VALUE64,
> +					 upper_32_bits(query));
> +	}
> +}
> +
> +struct config {

nit: little too generic name, maybe "struct params_sched" 

> +	u32 orig;
> +	u32 query;
> +	int expected_ret;
> +	int ret;

nit: forced_ret;

> +	const char *name;
> +};
> +
> +static const struct config vf_ctx_testcase[] = {

nit: redundant "vf" prefix
nit: those are "params" not a "testcases" that could be confused with kunit

> +	{
> +		.orig = TEST_CTXS,
> +		.query = TEST_CTXS,
> +		.expected_ret = 0,

nit: we can drop fields with 0

> +		.name = "same",

nit: maybe better to make it first field instead of last?

> +	},
> +	{
> +		.orig = 0,
> +		.query = 0,
> +		.expected_ret = -ENODATA,
> +		.name = "none",
> +	},
> +	{
> +		.orig = 0,
> +		.query = GUC_ID_MAX + 1,
> +		.expected_ret = -ERANGE,
> +		.name = "overflow",
> +	},
> +	{
> +		.orig = TEST_CTXS,
> +		.query = 0,
> +		.expected_ret = -EREMCHG,
> +		.name =	"lost",
> +	},
> +	{
> +		.orig = TEST_CTXS,
> +		.query = TEST_CTXS / 2,
> +		.expected_ret = -EREMCHG,
> +		.name = "reduced",
> +	},
> +	{
> +		.orig = TEST_CTXS,
> +		.query = TEST_CTXS * 2,
> +		.expected_ret = -EREMCHG,
> +		.name = "increased",
> +	},
> +	{
> +		.orig = 0,
> +		.query = 0,
> +		.expected_ret = -EPROTO,
> +		.ret = -EPROTO,
> +		.name = "proto_error",

nit: just "eproto" ?

> +	},
> +	{
> +		.orig = 0,
> +		.query = 0,
> +		.expected_ret = -EIO,
> +		.ret = -EIO,
> +		.name =	"IO_error",

nit: just "eio" ?

btw, is there any coverage difference compared to "proto_error" ?

> +	},
> +};
> +
> +KUNIT_ARRAY_PARAM_DESC(ctx_testcase, vf_ctx_testcase, name);
> +
> +static const struct config vf_db_testcase[] = {
> +	{
> +		.orig = TEST_DBS,
> +		.query = TEST_DBS,
> +		.expected_ret = 0,
> +		.name = "same",
> +	},
> +	{
> +		.orig = 0,
> +		.query = 0,
> +		.expected_ret = 0,
> +		.name = "none",
> +	},
> +	{
> +		.orig = TEST_DBS,
> +		.query = GUC_NUM_DOORBELLS + 1,
> +		.expected_ret = -ERANGE,
> +		.name = "overflow",
> +	},
> +	{
> +		.orig = TEST_DBS,
> +		.query = 0,
> +		.expected_ret = -EREMCHG,
> +		.name = "lost",
> +	},
> +	{
> +		.orig = TEST_DBS,
> +		.query = TEST_DBS / 2,
> +		.expected_ret = -EREMCHG,
> +		.name = "reduced",
> +	},
> +	{
> +		.orig = TEST_DBS,
> +		.query = GUC_NUM_DOORBELLS - 1,

nit: maybe
		.query = TEST_DBS + 1,

to follow the pattern?

> +		.expected_ret = -EREMCHG,
> +		.name = "increased",
> +	},
> +	{
> +		.orig = 0,
> +		.query = 0,
> +		.expected_ret = -EPROTO,
> +		.ret = -EPROTO,
> +		.name = "proto_error",
> +	},
> +	{
> +		.orig = 0,
> +		.query = 0,
> +		.expected_ret = -EIO,
> +		.ret = -EIO,
> +		.name =	"IO_error",
> +	},
> +};
> +
> +KUNIT_ARRAY_PARAM_DESC(db_testcase, vf_db_testcase, name);
> +
> +static int xe_guc_mmio_send_recv_stub_ctx(struct xe_guc *guc, const u32 *request,
> +					  u32 len, u32 *response_buf)
> +{
> +	struct kunit *test = kunit_get_current_test();
> +	const struct config *c = test->param_value;
> +
> +	if (c->ret)
> +		return c->ret;
> +
> +	assert_valid_query_klv_msg(test, len, request,
> +				   GUC_KLV_VF_CFG_NUM_CONTEXTS_KEY);
> +	fill_resp_buff(response_buf, c->query, sizeof(u32));
> +
> +	return 0;
> +}
> +
> +static void test_ctxs(struct kunit *test)
> +{
> +	struct xe_gt *gt = test->priv;
> +	const struct config *c = test->param_value;
> +
> +	gt->sriov.vf.self_config.num_ctxs = c->orig;
> +	kunit_activate_static_stub(test, xe_guc_mmio_send_recv,
> +				   xe_guc_mmio_send_recv_stub_ctx);
> +	KUNIT_EXPECT_EQ(test, vf_get_ctxs_cfg(gt), c->expected_ret);
> +}
> +
> +static int xe_guc_mmio_send_recv_stub_db(struct xe_guc *guc, const u32 *request,
> +					 u32 len, u32 *response_buf)
> +{
> +	struct kunit *test = kunit_get_current_test();
> +	const struct config *c = test->param_value;
> +
> +	if (c->ret)
> +		return c->ret;
> +
> +	assert_valid_query_klv_msg(test, len, request,
> +				   GUC_KLV_VF_CFG_NUM_DOORBELLS_KEY);
> +	fill_resp_buff(response_buf, c->query, sizeof(u32));
> +
> +	return 0;
> +}
> +
> +static void test_dbs(struct kunit *test)
> +{
> +	struct xe_gt *gt = test->priv;
> +	const struct config *c = test->param_value;
> +
> +	gt->sriov.vf.self_config.num_dbs = c->orig;
> +	kunit_activate_static_stub(test, xe_guc_mmio_send_recv,
> +				   xe_guc_mmio_send_recv_stub_db);
> +	KUNIT_EXPECT_EQ(test, vf_get_dbs_cfg(gt), c->expected_ret);
> +}
> +
> +struct config_vram {
> +	u64 orig;
> +	u64 query;
> +	int expected_ret;
> +	int ret;
> +	const char *name;
> +};
> +
> +static const struct config_vram vf_vram_testcase[] = {
> +	{
> +		.orig = TEST_VRAM,
> +		.query = TEST_VRAM,
> +		.expected_ret = 0,
> +		.name = "same",
> +	},
> +	{
> +		.orig = 0,
> +		.query = 0,
> +		.expected_ret = -ENODATA,
> +		.name = "none",
> +	},
> +	{
> +		.orig = TEST_VRAM / 2,
> +		.query = TEST_VRAM + SZ_1G,
> +		.expected_ret = -EREMCHG,
> +		.name = "increased",
> +	},
> +	{
> +		.orig = TEST_VRAM / 2,
> +		.query = 0,
> +		.expected_ret = -EREMCHG,
> +		.name = "lost",
> +	},
> +	{
> +		.orig = TEST_VRAM / 2,
> +		.query = TEST_VRAM / 4,
> +		.expected_ret = -EREMCHG,
> +		.name = "reduced",
> +	},
> +	{
> +		.orig = 0,
> +		.query = 0,
> +		.expected_ret = -EPROTO,
> +		.ret = -EPROTO,
> +		.name = "proto_error",
> +	},
> +	{
> +		.orig = 0,
> +		.query = 0,
> +		.expected_ret = -EIO,
> +		.ret = -EIO,
> +		.name =	"IO_error",
> +	},

what about params for the "unaligned" case?

> +};
> +
> +KUNIT_ARRAY_PARAM_DESC(vram_testcase, vf_vram_testcase, name);
> +
> +static int xe_guc_mmio_send_recv_stub_vram(struct xe_guc *guc, const u32 *request,
> +					   u32 len, u32 *response_buf)
> +{
> +	struct kunit *test = kunit_get_current_test();
> +	const struct config_vram *c = test->param_value;
> +
> +	if (c->ret)
> +		return c->ret;
> +
> +	assert_valid_query_klv_msg(test, len, request,
> +				   GUC_KLV_VF_CFG_LMEM_SIZE_KEY);
> +	fill_resp_buff(response_buf, c->query, sizeof(u64));
> +
> +	return 0;
> +}
> +
> +static void test_vram(struct kunit *test)
> +{
> +	struct xe_gt *gt = test->priv;
> +	const struct config_vram *c = test->param_value;
> +
> +	gt->tile->sriov.vf.self_config.lmem_size = c->orig;
> +	kunit_activate_static_stub(test, xe_guc_mmio_send_recv,
> +				   xe_guc_mmio_send_recv_stub_vram);
> +	KUNIT_EXPECT_EQ(test, vf_get_lmem_info(gt), c->expected_ret);
> +}
> +
> +struct config_ggtt {
> +	struct {
> +		u64 start;
> +		u64 size;
> +	} orig, query;
> +	int expected_ret;
> +	int ret;
> +	const char *name;
> +};
> +
> +static const struct config_ggtt vf_ggtt_testcase[] = {
> +	{
> +		.orig =  { .start = TEST_GGTT_START, .size = TEST_GGTT_SIZE },
> +		.query = { .start = TEST_GGTT_START, .size = TEST_GGTT_SIZE },
> +		.name = "same",
> +		.expected_ret = 0,
> +	},
> +	{
> +		.orig =  { .start = 0, .size = 0 },
> +		.query = { .start = TEST_GGTT_START, .size = TEST_GGTT_SIZE },
> +		.expected_ret = 0,
> +		.name = "query_on_init",
> +	},
> +	{
> +		.orig =  { .start = 0, .size = 0 },
> +		.query = { .start = 0, .size = 0 },
> +		.expected_ret = -ENODATA,
> +		.name = "none",
> +	},
> +	{
> +		.orig =  { .start = TEST_GGTT_START, .size = TEST_GGTT_SIZE },
> +		.query = { .start = TEST_GGTT_START, .size = TEST_GGTT_SIZE + SZ_4G },
> +		.expected_ret = -ERANGE,
> +		.name = "overflow",
> +	},
> +	{
> +		.orig =  { .start = 0, .size = 0 },
> +		.query = { .start = TEST_GGTT_START, .size = TEST_GGTT_SIZE + SZ_4G },
> +		.expected_ret = -ERANGE,
> +		.name =	"overflow_query_on_init",
> +	},
> +	{
> +		.orig =  { .start = TEST_GGTT_START, .size = TEST_GGTT_SIZE },
> +		.query = { .start = TEST_GGTT_START, .size = 0 },
> +		.expected_ret = -ENODATA,
> +		.name = "lost",
> +	},
> +	{
> +		.orig =  { .start = 0, .size = 0 },
> +		.query = { .start = TEST_GGTT_START, .size = 0 },
> +		.expected_ret = -ENODATA,
> +		.name = "lost_on_init",
> +	},
> +	{
> +		.orig =  { .start = TEST_GGTT_START, .size = TEST_GGTT_SIZE },
> +		.query = { .start = TEST_GGTT_START, .size = TEST_GGTT_SIZE - SZ_1M },
> +		.expected_ret = -EREMCHG,
> +		.name = "reduced",
> +	},
> +	{
> +		.orig =  { .start = TEST_GGTT_START, .size = TEST_GGTT_SIZE },
> +		.query = { .start = TEST_GGTT_START, .size = TEST_GGTT_SIZE + SZ_1M },
> +		.expected_ret = -EREMCHG,
> +		.name = "increased",
> +	},
> +	{
> +		.orig =  { .start = TEST_GGTT_START, .size = TEST_GGTT_SIZE - SZ_4K },

why -4K ? just use valid size

> +		.query = { .start = TEST_GGTT_START, .size = TEST_GGTT_SIZE - SZ_2K },
> +		.expected_ret = 0,

hmm, shouldn't we fail with unaligned size?

> +		.name = "unaligned_size_4K",

as it looks we don't need to deal with 64K, maybe drop the 4K suffix?

> +	},
> +	{
> +		.orig =  { .start = 0, .size = 0 },
> +		.query = { .start = TEST_GGTT_START, .size = TEST_GGTT_SIZE - SZ_2K },
> +		.expected_ret = 0,
> +		.name =	"unaligned_size_4K_on_init",
> +	},
> +	{
> +		.orig =  { .start = TEST_GGTT_START, .size = TEST_GGTT_SIZE },
> +		.query = { .start = TEST_GGTT_START - SZ_2K, .size = TEST_GGTT_SIZE },
> +		.expected_ret = -EREMCHG,
> +		.name = "unaligned_base_4K",
> +	},
> +	{
> +		.orig =  { .start = 0, .size = 0 },
> +		.query = { .start = TEST_GGTT_START - SZ_2K, .size = TEST_GGTT_SIZE },
> +		.expected_ret = 0,
> +		.name = "unaligned_base_4K_on_init",
> +	},
> +	{
> +		.orig =  { .start = 0, .size = 0 },
> +		.query = { .start = 0, .size = 0 },
> +		.expected_ret = -EPROTO,
> +		.ret = -EPROTO,
> +		.name = "proto_error",
> +	},
> +	{
> +		.orig =  { .start = 0, .size = 0 },
> +		.query = { .start = 0, .size = 0 },
> +		.expected_ret = -EIO,
> +		.ret = -EIO,
> +		.name = "IO_error",
> +	},
> +	{
> +		.orig =  { .start = 0, .size = 0 },
> +		.query = { .start = TEST_GGTT_START, .size = TEST_GGTT_SIZE_OUT_OF_BOUNDS },
> +		.expected_ret = -ERANGE,
> +		.name = "out_of_bounds_size_on_init",
> +	},
> +};
> +
> +KUNIT_ARRAY_PARAM_DESC(ggtt_testcase, vf_ggtt_testcase, name);
> +
> +static int xe_guc_mmio_send_recv_stub_ggtt(struct xe_guc *guc, const u32 *request,
> +					   u32 len, u32 *response_buf)
> +{
> +	struct kunit *test = kunit_get_current_test();
> +	const struct config_ggtt *c = test->param_value;
> +	u32 key;
> +
> +	if (c->ret)
> +		return c->ret;
> +
> +	KUNIT_ASSERT_EQ(test, FIELD_GET(GUC_HXG_REQUEST_MSG_0_ACTION, request[0]),
> +			GUC_ACTION_VF2GUC_QUERY_SINGLE_KLV);
> +	KUNIT_ASSERT_EQ(test, len, VF2GUC_QUERY_SINGLE_KLV_REQUEST_MSG_LEN);
> +	key = FIELD_GET(VF2GUC_QUERY_SINGLE_KLV_REQUEST_MSG_1_KEY, request[1]);
> +	KUNIT_ASSERT_TRUE(test,
> +			  key == GUC_KLV_VF_CFG_GGTT_START_KEY ||
> +			  key == GUC_KLV_VF_CFG_GGTT_SIZE_KEY);

instead above see [2]

> +
> +	response_buf[0] = FIELD_PREP(VF2GUC_QUERY_SINGLE_KLV_RESPONSE_MSG_0_LENGTH,
> +				     sizeof(u64) / sizeof(u32));
> +	if (key == GUC_KLV_VF_CFG_GGTT_START_KEY) {
> +		response_buf[1] = FIELD_PREP(VF2GUC_QUERY_SINGLE_KLV_RESPONSE_MSG_1_VALUE32,
> +					     lower_32_bits(c->query.start));
> +		response_buf[2] = FIELD_PREP(VF2GUC_QUERY_SINGLE_KLV_RESPONSE_MSG_2_VALUE64,
> +					     upper_32_bits(c->query.start));

didn't you introduce a helper for this?

> +	} else if (key == GUC_KLV_VF_CFG_GGTT_SIZE_KEY) {
> +		response_buf[1] = FIELD_PREP(VF2GUC_QUERY_SINGLE_KLV_RESPONSE_MSG_1_VALUE32,
> +					     lower_32_bits(c->query.size));
> +		response_buf[2] = FIELD_PREP(VF2GUC_QUERY_SINGLE_KLV_RESPONSE_MSG_2_VALUE64,
> +					     upper_32_bits(c->query.size));
> +	}

[2] use this:

	else {
		KUNIT_FAIL(test, "bad key %#x\n", key);
	}> +
> +	return 0;
> +}
> +
> +static void xe_ggtt_shift_nodes_stub(struct xe_ggtt *ggtt, u64 new_start)
> +{
> +	struct kunit *test = kunit_get_current_test();
> +	const struct config_ggtt *c = test->param_value;
> +	struct xe_gt *gt = test->priv;
> +	u64 expected_start = ALIGN(c->query.start, vf_get_ggtt_alignment(gt));
> +
> +	KUNIT_EXPECT_EQ(test, new_start, expected_start);
> +}
> +
> +static void test_ggtt(struct kunit *test)
> +{
> +	const struct config_ggtt *c = test->param_value;
> +	struct xe_gt *gt = test->priv;
> +

	xe_ggtt_init_kunit() ?

here or in init()

> +	gt->tile->sriov.vf.self_config.ggtt_base = c->orig.start;
> +	gt->tile->sriov.vf.self_config.ggtt_size = c->orig.size;
> +
> +	kunit_activate_static_stub(test, xe_guc_mmio_send_recv,
> +				   xe_guc_mmio_send_recv_stub_ggtt);
> +	kunit_activate_static_stub(test, xe_ggtt_shift_nodes,
> +				   xe_ggtt_shift_nodes_stub);
> +	KUNIT_EXPECT_EQ(test, vf_get_ggtt_info(gt), c->expected_ret);
> +}
> +
> +struct config_mmio {
> +	struct {
> +		u32 length;
> +		u32 mbz;

LEN and MBZ are in msg_data0

> +		u32 data0;
> +		u32 data1;

so these should be either:

		u32 data1;
		u32 data2;
or
		u32 value32;
		u32 value64;

> +	} response;
> +	u64 value;
> +	u64 value_len;
> +	u32 key;
> +	int expected_ret;
> +	int ret;
> +	const char *name;
> +};
> +
> +static const struct config_mmio guc_mmio_resp_testcase[] = {
> +	{
> +		.key = GUC_KLV_VF_CFG_NUM_CONTEXTS_KEY,
> +		.value = TEST_CTXS,
> +		.value_len = hxg_sizeof(u32),
> +		.response = {
> +			.length = hxg_sizeof(u32),
> +			.mbz = 0,
> +			.data0 = TEST_CTXS,
> +			.data1 = 0,
> +		},
> +		.expected_ret = 0,
> +		.name = "klv32_successful"
> +	},
> +	{
> +		.key = GUC_KLV_VF_CFG_NUM_CONTEXTS_KEY,
> +		.value = TEST_CTXS,
> +		.value_len = hxg_sizeof(u32),
> +		.response = {
> +			.length = hxg_sizeof(u32),
> +			.mbz = hxg_sizeof(u32),
> +			.data0 = TEST_CTXS,
> +			.data1 = 0,
> +		},
> +		.expected_ret = -EPROTO,
> +		.name = "klv32_proto_error"
> +	},
> +	{
> +		.key = GUC_KLV_VF_CFG_NUM_CONTEXTS_KEY,
> +		.value = TEST_CTXS,
> +		.value_len = hxg_sizeof(u32),
> +		.response = {
> +			.length = hxg_sizeof(u64),
> +			.mbz = 0,
> +			.data0 = TEST_CTXS,
> +			.data1 = 0,
> +		},
> +		.expected_ret = -EOVERFLOW,
> +		.name = "klv32_overflow"
> +	},
> +	{
> +		.key = GUC_KLV_VF_CFG_NUM_CONTEXTS_KEY,
> +		.value = TEST_CTXS,
> +		.value_len = hxg_sizeof(u32),
> +		.response = {
> +			.length = 0,
> +			.mbz = 0,
> +			.data0 = TEST_CTXS,
> +			.data1 = 0,
> +		},
> +		.expected_ret = -ENODATA,
> +		.name = "klv32_underflow"
> +	},
> +	{
> +		.key = GUC_KLV_VF_CFG_LMEM_SIZE_KEY,
> +		.value = TEST_VRAM,
> +		.value_len = hxg_sizeof(u64),
> +		.response = {
> +			.length = hxg_sizeof(u64),
> +			.mbz = 0,
> +			.data0 = lower_32_bits(TEST_VRAM),
> +			.data1 = upper_32_bits(TEST_VRAM),
> +		},
> +		.expected_ret = 0,
> +		.name = "klv64_successful"
> +	},
> +	{
> +		.key = GUC_KLV_VF_CFG_LMEM_SIZE_KEY,
> +		.value = TEST_VRAM,
> +		.value_len = hxg_sizeof(u64),
> +		.response = {
> +			.length = hxg_sizeof(u64),
> +			.mbz = hxg_sizeof(u32),
> +			.data0 = lower_32_bits(TEST_VRAM),
> +			.data1 = upper_32_bits(TEST_VRAM),
> +		},
> +		.expected_ret = -EPROTO,
> +		.name = "klv64_proto_error"
> +	},
> +	{
> +		.key = GUC_KLV_VF_CFG_LMEM_SIZE_KEY,
> +		.value = TEST_VRAM,
> +		.value_len = hxg_sizeof(u64),
> +		.response = {
> +			.length = (hxg_sizeof(u64)) + 1,
> +			.mbz = 0,
> +			.data0 = lower_32_bits(TEST_VRAM),
> +			.data1 = upper_32_bits(TEST_VRAM),
> +		},
> +		.expected_ret = -EOVERFLOW,
> +		.name = "klv64_overflow"
> +	},
> +	{
> +		.key = GUC_KLV_VF_CFG_LMEM_SIZE_KEY,
> +		.value = TEST_VRAM,
> +		.value_len = hxg_sizeof(u64),
> +		.response = {
> +			.length = 1,
> +			.mbz = 0,
> +			.data0 = lower_32_bits(TEST_VRAM),
> +			.data1 = upper_32_bits(TEST_VRAM),
> +		},
> +		.expected_ret = -ENODATA,
> +		.name = "klv64_underflow"
> +	},
> +};
> +
> +KUNIT_ARRAY_PARAM_DESC(guc_mmio_resp, guc_mmio_resp_testcase, name);
> +
> +static int xe_guc_mmio_send_recv_stub(struct xe_guc *guc, const u32 *request,
> +				      u32 len, u32 *response_buf)
> +{
> +	struct kunit *test = kunit_get_current_test();
> +	const struct config_mmio *c = test->param_value;
> +
> +	response_buf[0] =
> +		FIELD_PREP(VF2GUC_QUERY_SINGLE_KLV_RESPONSE_MSG_0_LENGTH, c->response.length) |
> +		FIELD_PREP(VF2GUC_QUERY_SINGLE_KLV_RESPONSE_MSG_0_MBZ, c->response.mbz);
> +	response_buf[1] =
> +		FIELD_PREP(VF2GUC_QUERY_SINGLE_KLV_RESPONSE_MSG_1_VALUE32, c->response.data0);
> +	response_buf[2] =
> +		FIELD_PREP(VF2GUC_QUERY_SINGLE_KLV_RESPONSE_MSG_2_VALUE64, c->response.data1);
> +
> +	return 0;
> +}
> +
> +static void test_guc_mmio(struct kunit *test)
> +{
> +	const struct config_mmio *c = test->param_value;
> +	struct xe_gt *gt = test->priv;
> +	struct xe_guc *guc = &gt->uc.guc;
> +	u32 value[2];
> +
> +	kunit_activate_static_stub(test, xe_guc_mmio_send_recv,
> +				   xe_guc_mmio_send_recv_stub);
> +	KUNIT_EXPECT_EQ(test,
> +			guc_action_query_single_klv(guc, c->key, value, c->value_len),
> +			c->expected_ret);
> +}
> +
> +static int vf_gt_config_test_init(struct kunit *test)
> +{
> +	struct xe_pci_fake_data fake = {
> +		.sriov_mode = XE_SRIOV_MODE_VF,
> +		.platform = XE_BATTLEMAGE, /* any random DGFX platform with SR-IOV */
> +		.subplatform = XE_SUBPLATFORM_NONE,
> +		.graphics_verx100 = 2001,
> +	};
> +	struct xe_device *xe;
> +	struct xe_gt *gt;
> +
> +	test->priv = &fake;
> +	xe_kunit_helper_xe_device_test_init(test);
> +
> +	xe = test->priv;
> +	KUNIT_ASSERT_TRUE(test, IS_SRIOV_VF(xe));
> +	KUNIT_ASSERT_TRUE(test, IS_DGFX(xe));
> +
> +	gt = xe_root_mmio_gt(xe);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, gt);
> +	test->priv = gt;
> +
> +	return 0;
> +}
> +
> +static struct kunit_case vf_gt_config_test_cases[] = {
> +	KUNIT_CASE_PARAM(test_ctxs, ctx_testcase_gen_params),
> +	KUNIT_CASE_PARAM(test_dbs, db_testcase_gen_params),
> +	KUNIT_CASE_PARAM(test_vram, vram_testcase_gen_params),
> +	KUNIT_CASE_PARAM(test_ggtt, ggtt_testcase_gen_params),
> +	KUNIT_CASE_PARAM(test_guc_mmio, guc_mmio_resp_gen_params),
> +	{}
> +};
> +
> +static struct kunit_suite vf_gt_config_suite = {
> +	.name = "vf_gt_config",
> +	.test_cases = vf_gt_config_test_cases,
> +	.init = vf_gt_config_test_init,
> +};
> +
> +kunit_test_suite(vf_gt_config_suite);
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> index 37baeb1058b2..e80e3cdb5afe 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -1708,3 +1708,7 @@ int xe_gt_sriov_vf_wait_valid_ggtt(struct xe_gt *gt)
>  
>  	return atomic_read(&gt->sriov.vf.migration.fixups_complete_count);
>  }
> +
> +#if IS_BUILTIN(CONFIG_DRM_XE_KUNIT_TEST)
> +#include "tests/xe_gt_sriov_vf_kunit.c"
> +#endif

