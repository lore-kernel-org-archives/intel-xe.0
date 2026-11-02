Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40822606A327
	for <intel-xe@archiver.kernel.org>; Mon,  2 Nov 2026 20:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DeOZmsoA
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4BE610E68A;
	Mon,  2 Nov 2026 20:17:22 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E525410E68A;
 Mon,  2 Nov 2026 20:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793650636; x=1825186636;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=0WgudZ3bxfHqkk8rXwEMtljDP3rpV//p4rJmsXt3cg4=;
 b=DeOZmsoAyoIJMbOUmVbynHY+C5Q8iRNiBBH2IV6foq9d29AVKsEfbko3
 KLSXdmAEcKXNgLP4aBrHmy7T80Xcbb4z3xaPzikK4PGDeLD851lYdmoyf
 ygDnHo3VVXB+mqc1LhOOTQLHRb1aq0lgtXjWuLqcl4q/oXfcJMbODcEv+
 rkN0H6JMQFWc+XHiq41LWa4D2Tynod/uzV+jE/WiOD0p8fldt9ckqCK/E
 mZzk264w5uCj3Y/od38ERWTQcon6HdUPHNKjwhL5XcOi80mIs2yVnW5hS
 bh1OV4ZL1K33k6bpKc0Ryd7Ed2I7GKFOnF1CSWCDrI+aq7H28lrmBBj4m Q==;
X-CSE-ConnectionGUID: hl9lhhuuQ4ipva4U3qm/MA==
X-CSE-MsgGUID: G0o2CgSkTNKRZeBPg8R1ew==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2263176"
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="2263176"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 12:17:15 -0800
X-CSE-ConnectionGUID: eyAP+G43RduF3LpCF8pMHA==
X-CSE-MsgGUID: XoM8nQ8YSVepK14NsHzRhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="6341383"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 12:17:15 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 2 Nov 2026 12:17:14 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Mon, 2 Nov 2026 12:17:14 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.26) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 2 Nov 2026 12:17:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pey/rNX8v28t6qplNgL74Apo+RjSBk+kb+BKHBjXCEhwsJAAq5mAPqSBnaZnkkZNmPA+n6Ig+mzuLMyVpoGwP4beVB+6AOEobnOAU3xkr1NC/oEBnjI+/GKBn7HFVTh1eUCg7ycfPipz7+/24yTOp3UJdBGec8dkV/vf6uU5smeqRRw9IL8VLOHxN+OqmlWYSDSrhw8+nKLAmTzwUlgoNQgRmkp9IGK+k7JUVgOjvnPK48/IpR03L372IogZMtz8sw5HqRR9v0RzJeFCu6k2LWsNfPSzlo9XDzYcTgs8kUObQAmKojeXGMfJrHlx8r+Kq33xvwSClnYcQ8Qh3Jjduw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rCVRBh2FzeNcB5f9bPWN4D5V7GSv9wHC+2i7ThZ+a8M=;
 b=FZDBBWRv6vvUPvwiFi7Mpdh1iryT10X4+0Va6Ji+cT8VzknN2LS0nbuM4GuEUu9sm1vsO12HBL1jr7v7FcFI3s+b6tUvY6NQmZLCYxh+ovqcwQ1k/DOlksD1ySimT5IZt+IISz8Jx0eSPRhei48ryTpMyJHxe/hS5EKAxN40S0wC/ZD9FzSqTvWGFY41coN8KwLqMCfgPw5ebcKq2iD2a5HJgDc8Ok0TTxjRCw1/g0hqUVodVlk/nnv9YLvn/sq3J+WK8XRA7c1NKiqmuJnMRjzEY/Sx/dF9DCul9T0+4xvfiJJCD8fVX9pzB25/ACORPu/xyREyr0WgVYwrXy040Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by LV2PR11MB638815.namprd11.prod.outlook.com (2603:10b6:408:415::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 20:17:08 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057%6]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 20:17:07 +0000
Date: Mon, 2 Nov 2026 12:17:05 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: <rodrigo.vivi@intel.com>, <intel-xe@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <matthew.d.roper@intel.com>
CC: <jani.saarinen@intel.com>
Subject: Re: [drm-intel/topic/core-for-CI] Revert "io_uring/sqpoll: don't
 attach to a thread that is canceling"
Message-ID: <aujvwWHLJnbJ7ddT@soc-5CG1426VCC.clients.intel.com>
References: <20261102200603.2605130-2-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20261102200603.2605130-2-umesh.nerlige.ramappa@intel.com>
X-ClientProxiedBy: MW3PR05CA0022.namprd05.prod.outlook.com
 (2603:10b6:303:2b::27) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|LV2PR11MB638815:EE_
X-MS-Office365-Filtering-Correlation-Id: d3c7e2c8-1020-4351-4c13-08df391e44d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|376014|261021121427099003|11063799006|56012099006|261009223027099003|261028144727099003|261021123027099003|261022105027099003|261026140227099003|261026121527099003|10067099003|18002099003|22082099003|261102123227099003;
X-Microsoft-Antispam-Message-Info: SP+14ZZdliVyRtsH8oQsdr2igw6V2qLiS/0gtwbF55dMYeqL0geAB8MDNo+Tz4V5FXjaSo1yFOjVMCzG6M1UnZ7dX8e8cSU+5wSogkdR3PyTWLS5/sqC9TEG3Bh4gcA+waAtF5b4U3V5/EVJaQziPtLYe16DvcWI8QWvXzgRTmO8FJ6FnrHaSCcWvL1M6q/uhVarh98hJaN4WwCg4FTvgysR5zIMmx1W9gK/JUjtGIIQJZrAtac6rflMDlRlQhc1Cu3vzOFi905HPQFbgAV+XxrKtjn9SD6g9H9YSiY9dBY2XPkSPdbMI0zftyYb3oDlwH60eQwc9Ig+jv3s31Ul+OtLpHJ52mpl0cQ5O35uu62pD5B3QvVSwsAP8L1Grt17a4gEwJPaiZ7qchmA5mfnrxZBna4Q6u9a/K+L7WDTVlHIgv1bES+C2EZM0XMoQsAvZLlOeZVZmvw16fBvGuUjYJTdIEHtmo5oZ0uvQt2rZWG0vwQUGzIVA13eEEkeyrN2R/bSfLzyIEwMaJgnFGNfOzJo81uY2041UsCoBuhFhMC1TNT+Tza7sWHklNyrxtcXM0fLOuc4N8SlqS1h5cuxGv1uuwEq6Th+gJjjT2wMZnSP/IhXuN6raARtq33srzmH
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(261021121427099003)(11063799006)(56012099006)(261009223027099003)(261028144727099003)(261021123027099003)(261022105027099003)(261026140227099003)(261026121527099003)(10067099003)(18002099003)(22082099003)(261102123227099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c2lIT2N6dFN0bnNTaVowSmFMTDlXZ2NZa2txK2U3TlBSbllyVkp5NnRPamVk?=
 =?utf-8?B?Z1dTTnhiOFViNVdpcEJpNitlTDNaL2JZSE1KVEtwVisyUmIzMllLT1F0YUw2?=
 =?utf-8?B?dU1uNGVlNXZJWWVySUdpRmtHMlNHRCt6SEk2ckpiZlZraFlId0pVcFNFeUxr?=
 =?utf-8?B?bHVJWTRzc0VpOUpRek5UOHgzZmQ4WWdNZXB1RnF3ck8vMFMzWHVEbjNlYUxw?=
 =?utf-8?B?MzMrV3JIeDQyMWwrQ1hyYTdpOU11OTJsMklEK0pHdlp5dXV5a2FnUEtGdU9B?=
 =?utf-8?B?N1hSdXNSdzRSOTh6anhTL1VSa0s1ZTVHeFlSR0hGdEJCUnJhcUVBNThuVmRw?=
 =?utf-8?B?bTYxc2x3WFY4Q0pFTE10RkF5MGhqL0htdzN1OGVXekUwa016dlVnN3ZiYm5B?=
 =?utf-8?B?UU5YUFVYcHp3OVVVeHhPaXNHUDFvSXhGc25ROEtjL1JKNVdCekJBWFAwL2Js?=
 =?utf-8?B?enB4Qkx3Z3YrOU1TVFo2RkZMVjdzZkxFUUtrbncyVEd4dUtOaE9xb0gxZjhi?=
 =?utf-8?B?bUE1eFplVUhmM1c4QmZlR216Q0laeEhpN3lTallDUEpQY1ZWdjlyUWF5MmR6?=
 =?utf-8?B?OUVNL2VJdGVmMGViSzR4UEFYd3JuT0lLcWZaUXBkREVmdzl3QjVSemh6MVdi?=
 =?utf-8?B?WU5VUTR4OUFhVUFtTElldVJvMFZTbE9ad0RoaGp5M1hYOStUTDRGd2JPd0Uw?=
 =?utf-8?B?NzVtSFdacGRLTFBMSGtINC82VjRxaU9UMUFqNEtQdjhsZk8wNFliZXVxbnRU?=
 =?utf-8?B?TkJSU2htY3p2Vmp4SExwditZdHZWcXNmT21JdmNDcTg5cmlqVEpUakwzdkEw?=
 =?utf-8?B?dFJBVkZzL21yMkVnQzR3TWl3Zk1RbjNoeW5JZE5PR3UrU040NGlUVHdsVUxF?=
 =?utf-8?B?Unk0REJFVHp3OHZ2S21GLzFQYjBNaDdvd21CNm1OR1o1VjNjZ2NpL2FjSHM0?=
 =?utf-8?B?dmYzSnErVWpMUElUeURFYmZCM1JjZDBCSTJkUkZLamVvZ1JSajBBT1o2OFNZ?=
 =?utf-8?B?Nm5SMDJoNmhhRC9wYi9uQXI4amNDajFrRE8yUzljbmJFTmw3czJaV0R0bXV5?=
 =?utf-8?B?bm8xUUg4dVRhdWdhaDk2WVdOVDVjbzc5RkJjdW5HMGZGcmR0aFJPVDRLOTRk?=
 =?utf-8?B?TU4rSE1hVjBEb3FUY2tGV0JYZmZ3Nk1RdFZwMEMxdm1zdExXKzA3Rkw1SmVJ?=
 =?utf-8?B?RGM3Y0RtVHY2SE0vaTFpN1gwSGlSckNQTm5TWmlmSVpsZFhvekpSUkJmL2tU?=
 =?utf-8?B?VGtQSHFtdXJyYjFxVWpJbXZRWVM3ejlkM2pEZ1JIc0g4Sk1wcjQ4cTMxWWYx?=
 =?utf-8?B?dHZGME1leWJRK2kxYnpDcER1UE1aRlFYQnozcXpYRzEyY0dKdDFnZjZSVml6?=
 =?utf-8?B?eUF5R0tmT3loOHVWNFVGV1JCK2ZvWXpwUFExLzdpQ0FtUGRjQ3pYT1g3MXQ2?=
 =?utf-8?B?dkg1akF4cEJWeGhjMnIzR3hObnF2WmFKbnBibm1WRFIyVUpGRmFkZElGTG5l?=
 =?utf-8?B?R3FNdVI5M0tFbmFTU0Z1OTU5MUh4dHlxemNtSElGVkZRenFiV2YwdGROU2NM?=
 =?utf-8?B?bC9tdzJsL3JSVmxzWXErRGFTTHI1SytzdllvU0E5Wisydy9rTU1VZ1prRHZO?=
 =?utf-8?B?R3ZKZURTbGVDaERxYXRVc21RUlRLbmVranZhdllPR2hVMzQwcm1QVmF3Sm5G?=
 =?utf-8?B?WTRUclNMa1pVM3pMdThoZm02a2N4QUw0YUtJZWdIKytPeFVSZnJrT3JOQXNa?=
 =?utf-8?B?WHZBM2Y2RjJKWUFwRGc1dklRNGJYb1Rzby9PWjJJRUVtMTZ5M1hkZVExN0hY?=
 =?utf-8?B?VmRROUdvRGM0bmVHOXAxN2k3OFExMlFMbW5PQjQrelF6SFRQZDVEN2dhMjRN?=
 =?utf-8?B?SjVWV3V5LzNnd3E3UEFCZ0hhSW9vU1ZYZTgzVmVLYWpPSHRQL2dQMGdPOE1K?=
 =?utf-8?B?cFJQaWR6SGlWemk5VVVodEVYcHFRSnM5K2tORDN2SHcyWC9kSHluMEJLYUpx?=
 =?utf-8?B?bjRKQXRHRG4rWXU4VWFhdWZVN25BQXF5YnphZEYrak0xdVJjakh4ZnlncitM?=
 =?utf-8?B?MkVmTXQybFc4QkNMRkg2K2dobld6QndlZy9HSTN5ODNRdzBnZW9iVExqSHJp?=
 =?utf-8?B?L29YSjdaR2ZYVHRFbWpCZnpvZ0hDYXlieFN1eFVXZXJiWHQwWVJPNjFpR3Vu?=
 =?utf-8?B?MEYrbWRJQjllbm9rWnRPbzJ5SWoyMFNFSVZub0pGTjRqVXlmM3BpWEx3Y0Ux?=
 =?utf-8?B?ZWdSWFBJUDByZWUzS21MYXF3VHVBRGRzTXFoanhNbXZnbTBHaVVETDZjTWl6?=
 =?utf-8?B?Y21YUVlzVmxQcDJCcWRCWGNoeWt0N1V6eEtNcUxZT3JSSmpsRVYzMjk5QlZz?=
 =?utf-8?Q?4Tb4tYWYbsD2ZXaHnsuYvzdUJuUXHFg5WYX59?=
X-Exchange-RoutingPolicyChecked: eUK+E1QXl1e0hzbbCzH9REg6uO8gm09DjeMV0L4jUfGpt9MnlDysXQcAA2x9rnzNGWNY+eSmRS2n849KuWZnZA+SL6/E8Y4NUQD7c830eWxTxghvOvEEcyNDvbn0U70U2QrRO7m0jQS7B5EfiMkQhJsnjhOPmXUPQihKyUGEj20sRq+vnQYv8wqkp8gF5w81IMV1BeELOQSNIuW2dtqU5nVs0oCAmHEr1rbogKgVD6uEwPO3gTYyypLp7aBkHcRlqzjySTjhJM1NfIQrwhn/XVIjPCRB1pIgg1vQbCJWXuLF07V9Z8Udb17PCQhMO92fpJLEX25qyLpNLHJueErmwg==
X-MS-Exchange-CrossTenant-Network-Message-Id: d3c7e2c8-1020-4351-4c13-08df391e44d8
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 20:17:07.8179 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y/3WqJbj5B2cQBhq2hPWHHJ7wHC/qrnKQ6qNM1ro2/xPclG0Dx7qRVSeTxxp9nFW4wvv2yNHZFCuaI5OWyx+wNOKg7wVecVKxCYNjgdv88I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB638815
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 02, 2026 at 12:06:04PM -0800, Umesh Nerlige Ramappa wrote:
>This reverts commit 22d9db9fd64a493525d692b32c556875b7254665.
>
>This is resulting in igt@runner@aborted on Xe and i915 runs, so
>reverting the patch. The actual fix is still in flight on the kernel ML:
>
>[PATCH] io_uring/sqpoll: don't set IO_SQ_THREAD_SHOULD_STOP on thread exit
>
>Until that lands, revert this one.
>
>Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>References: https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/17747

Not sure I got the references right here. I ended up adding the i915 
failure instance of the gitlab issue.

Instead should I create a gitlab item to track actual fix and then drop 
this commit?

Thanks,
Umesh

>---
> io_uring/sqpoll.c | 11 +----------
> 1 file changed, 1 insertion(+), 10 deletions(-)
>
>diff --git a/io_uring/sqpoll.c b/io_uring/sqpoll.c
>index c833e776320d..49c52284ecdd 100644
>--- a/io_uring/sqpoll.c
>+++ b/io_uring/sqpoll.c
>@@ -433,12 +433,6 @@ static int io_sq_thread(void *data)
> 	if (io_sq_tw_pending())
> 		io_sq_tw(UINT_MAX);
>
>-	/*
>-	 * Cancelation drops sqd->lock while it waits, and a ring could attach
>-	 * to a thread that is on its way out. A fatal signal doesn't set the
>-	 * bit, so set it here for io_sq_offload_create() to see.
>-	 */
>-	set_bit(IO_SQ_THREAD_SHOULD_STOP, &sqd->state);
> 	io_uring_cancel_generic(true, sqd);
> 	rcu_assign_pointer(sqd->thread, NULL);
> 	put_task_struct(current);
>@@ -508,10 +502,7 @@ __cold int io_sq_offload_create(struct io_ring_ctx *ctx,
> 		list_add(&ctx->sqd_list, &sqd->ctx_list);
> 		io_sqd_update_thread_idle(sqd);
> 		/* don't attach to a dying SQPOLL thread, would be racy */
>-		ret = 0;
>-		if (attached && (!sqd->thread ||
>-		    test_bit(IO_SQ_THREAD_SHOULD_STOP, &sqd->state)))
>-			ret = -ENXIO;
>+		ret = (attached && !sqd->thread) ? -ENXIO : 0;
> 		io_sq_thread_unpark(sqd);
>
> 		if (ret < 0)
>-- 
>2.55.0
>
