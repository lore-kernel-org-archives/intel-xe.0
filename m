Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EE93C3271E
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jul 2024 23:00:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6E6210E108;
	Mon,  8 Jul 2024 23:00:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DW23PNK3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8EF510E108
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Jul 2024 23:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720479633; x=1752015633;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=JiyV6w8cxmqIieQEPMYq/HSMR0CxOF/HmUXjU1KyrXI=;
 b=DW23PNK3WTNtTpSkTytdy3QKG2JwwUjKcmthEDnkOKU83ba+gjtQfdAx
 XIgOEbZ3VM5YVmIv6TkdMqPLtgYURKXY+tXjuX+w4nRHOH9+IWo+zLGMn
 OqVftnHPKY/jh2u30loxRygYO0MW6ZL31kbZqbBHC/r83aWsB3U/PFwhL
 4Z+EwOCMIhFW08/FQmznc0d+QRGwLhzYyZscYstMyA7kHxu5JxrguDTaj
 rzCg8CN1By0bFDm5SbUgBsowb0pDVmXib+TfaV2fUvOr97QlBuA63bZsT
 NDzmc6Kc8mDAO7GAyxwXtWtF2dFymW/BwWIbCVbh3HwCZnYJvogSR506R A==;
X-CSE-ConnectionGUID: kE17EhI1TKy/CcRoFWv1Hg==
X-CSE-MsgGUID: UdJwwUuIRQKgWLSavbd3Dw==
X-IronPort-AV: E=McAfee;i="6700,10204,11127"; a="17343011"
X-IronPort-AV: E=Sophos;i="6.09,193,1716274800"; d="scan'208";a="17343011"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2024 16:00:33 -0700
X-CSE-ConnectionGUID: rpQgjkdmTzqhiRbmYYLH0A==
X-CSE-MsgGUID: tDOfqlJUQACGEq3BcmL8fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,193,1716274800"; d="scan'208";a="52454446"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Jul 2024 16:00:32 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 8 Jul 2024 16:00:31 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 8 Jul 2024 16:00:31 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 8 Jul 2024 16:00:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bTfkx9m9Ar3coa7HaGUvEXXjdBN64FLc/R2EMYDGRYZRbwqSXCxL7tXu69VM6wfZX92Rz2f2n0zn0flxgV/20ZjHRdXYc59AJscdfWlgGVe7JODkmFrnnuV69/zHZ4iP33QfiENiukq+Slr2JCZRZlzvzIZTRQ/lhmnZ8EkR8RHa2+FqFN3pulz4Hp8iGCdMhD5pXjOnNE/zhL2xo5a3jhFKxWWWmsqUO4gJJLX9wWV1zw++G4LewPOBBitT2miKiVjAX+quXbA/TIbUtPUOx7SoPe3D66q45nL9nURXbbpdhjKQ54dFzPC+1chfG4HJmn896VpT71y2RSc0gJWOPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4vakEVkhskI+FStRMTApCUiz/BIW0o7eWdWN9eA55Z0=;
 b=TWpwDOzcfWuvXQa5QEvmb+Mp8LIHzhr3aeMAxScclsWZhfo1GKw8f0Y82cAh22bVyosrGzhjpHF9Vp+bQQoQADthr5b2JjPgp53XhELJUf7vLUZ9M8HZxXyIF2hTvMWz9uOE0snxCtQ1SRx8PRCF3C8Vyp7dodGAOsBQyH35dvkJd9CwMBP7JNL4w16oafYQNJgbvDVePRCB1axrHvzC1I8A0pb6iBR2KMuF3VpIv8RqHaQUvyFXU2mhKVvkLYs8naekA5ArX9QjHAsL27G8Zt3SVUO8lI2UC4WnpzRieRZOCts4scWSHaeX3benbsHLWzu4m5gtQ4AZ95P+9yLghg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by LV8PR11MB8747.namprd11.prod.outlook.com (2603:10b6:408:206::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.34; Mon, 8 Jul
 2024 23:00:23 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%5]) with mapi id 15.20.7741.033; Mon, 8 Jul 2024
 23:00:23 +0000
Date: Mon, 8 Jul 2024 16:00:20 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <lucas.demarchi@intel.com>
Subject: Re: [PATCH 2/5] drm/xe: Add ref counting for xe_file
Message-ID: <ZoxvhI4xKUC25pR1@orsosgc001>
References: <20240708202103.3347869-1-umesh.nerlige.ramappa@intel.com>
 <20240708202103.3347869-3-umesh.nerlige.ramappa@intel.com>
 <ZoxYw1dsosvRTtkp@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <ZoxYw1dsosvRTtkp@DUT025-TGLU.fm.intel.com>
X-ClientProxiedBy: MW4PR04CA0337.namprd04.prod.outlook.com
 (2603:10b6:303:8a::12) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|LV8PR11MB8747:EE_
X-MS-Office365-Filtering-Correlation-Id: 46e08254-3b4c-45b3-96bf-08dc9fa1bf81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K2hVTktOQSt3WkI3Q083ZEttUlB4VzlIYWlwSkpVM2hxS0ZFQzNhVE90WnE5?=
 =?utf-8?B?dEdFV1p0OEJmdmVpZytRVkFWQnE3amJUK2owanNuUld3c252d25SWXRjMEln?=
 =?utf-8?B?aC9VV3pPajFNMXkycGczRmxrVzhWL1dkQldhWWMxQXZRSHVaOTZuTmR0UlVV?=
 =?utf-8?B?MVdNcG5yUG5GUnkxYXhYTmQ2K2dWc2tsUnFsbVk4VU1QREFUb0plbHR0Z1dn?=
 =?utf-8?B?djJEaGQ5NytQY1AxYWRmanRDd2h3dEdad0M3eWtBUEtYeTJFR3pYZWJpUGRH?=
 =?utf-8?B?QmNCOFdjS044N2R0NWx0TGhVdjJFRUJaNDAxSjBRYUxGUFVZYk5JU2xLNU5N?=
 =?utf-8?B?MjQrVXVIUkNaUjJHcnJsZGwycXJ4eC9pL1JpUUoweW9lNm9BS2ZVWTB5T29t?=
 =?utf-8?B?YXVGTEtqMkg5c1BDYVdNUEhXamdqRFRLMDBWaGc2ZXpDVnQ1Ry9zOXdlY2lF?=
 =?utf-8?B?blpaWmZvMGZaS2Mza2VOQnBQR0YyVXRLekZFeHFyamIxTS9PaHo1ek95NXNF?=
 =?utf-8?B?QnV2MjhHb1I4dzFUN012bXBwVk1hMlIwWXRjQTdLU2hTN3VGQnVsSm1obWpI?=
 =?utf-8?B?RkhOZlZqTmpOdXRhYVU1RUNQbDBSVTVEaStMYXFpZW8xbDJqM21pR2RodnBi?=
 =?utf-8?B?ZWpIZ3lCcmwzdVJmVk5LcHlxQ1pIWGR3MmErSDl2MHRpTWQzL0hCWkorQ0F3?=
 =?utf-8?B?U0NqUnpZZktGSmVnajRlcUNuYTZHYWczRmR6NDhTSUM1M2V3Y1Vad3B0cTNQ?=
 =?utf-8?B?K1VRUHpucmMvMXNJWVo4WkdPRXZ4cEJaN0l2TFRyS3M1ZTNBaWxzKzYxVmlV?=
 =?utf-8?B?T25FOUw1Nk95a3MzTWl2UHJqNWFEcDZuSE0wTlJMUzhaa1dFMXpiVGMrdWlS?=
 =?utf-8?B?V2lwY3BXMUU5Z2JmeUdqeWRTYTNPWnRsWmJyemRUTlZoaU5SV2l2T1k4Y3FL?=
 =?utf-8?B?UytUcklhN3dVdGRHZGNMQkNzTi8yMmZUM2l3S1FZaTJyRFROUy8vNFdLUVVi?=
 =?utf-8?B?RVA5SjRpVjY1cUJINS9OUTlWNmpobzlFQ2JMeFhuTytISEpFYUhmbGZuOEJh?=
 =?utf-8?B?dkQ5YkRYbXczMElpa3BKa2RKelVvOE1vTyswUk84Y1d4K0NBZlVEY1FsWjhE?=
 =?utf-8?B?Szl5cmpzSlFNKzRRNlI2c2V3bklURE1DN0IzNmx6RnNDaTZVZkdkT3Q5R0Yv?=
 =?utf-8?B?dzVvRFRWQkovWUVFMjQ1NW9OOU43anUzTmVlek9JdnVOWEIrWk4yeUsrRzND?=
 =?utf-8?B?cVhtTkk4djhWODZLclhKL3B5Rm5TVXhHanczdGk0WS9MMXBpVklyTlhDcUIx?=
 =?utf-8?B?RmtJcFJpYkxmS1ArV0JzZ3hBdWVGTDhrd2w5UGhjb3lxRFVYOXY0T2dLT0Jn?=
 =?utf-8?B?d1JBWVFVdnBEc3FQMXJwMTg1Vjd3OEo2SWovdlFBSkt1TkMyOUJzVTRwN3o2?=
 =?utf-8?B?SkU3dzBGN082ZHdjYU5HcWtieHY2c3F3Q1hoZmdrZzNpOERtNStPdXlWUU80?=
 =?utf-8?B?QmE1elIwMTNjSW1ZcDA2aVNsQVBrM1VwOFhmVWFVdExwZ0ZjdDFpTVM5QjR2?=
 =?utf-8?B?LzhPTVJGN200dXZhUTdueExqZjZTUGVmVWdEV0RIMGcrZTFYOUhtMng0SXBU?=
 =?utf-8?B?SzZod2F3cHI5cFBPd3ZxV042YnZmSHppUlVPNjNnNDhNdzVRZkxBT2lVdmhL?=
 =?utf-8?B?ZU93bEkvM2hrQWUzZncrTkpyRjJYOU1CbHBLcEIrbGZ3ZU1XU0ZwSXBDd0dh?=
 =?utf-8?Q?1rSh1zDEi1q+awmgfs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bTk3Vm83azBvMlZMRjRiUWQramo5eVpKb3N1bU5lRlY0cUZOZGdWeFJhdTVR?=
 =?utf-8?B?TmNyYkJ3RlByaE9kQXN1YlJabTR3b2RUaUFtQzliSjhPSUF0OGpOMjNHL1lP?=
 =?utf-8?B?Q3F1ZGJSZmJrVkRZZm5UUGJzalVhWU4vM2N0dnpHU1Z0R1ArOUJYbjN0Y3ZZ?=
 =?utf-8?B?cWJlZ0NwcGZhK2lFdVhJekF5MytCWE56eVkzbm9TeUhjMmhmTmdYSlUwUVNS?=
 =?utf-8?B?N1cxbHdkK0dNK3NaR25qZzZVNWk4UFkzeVJ1L01lNEpMaXdKMk9NblhoNUdY?=
 =?utf-8?B?RWlqZmtuVXhINi9MUllod0d1UmVpTG85U0FUSWVTSVFtajQvWVNFS1VWQzNn?=
 =?utf-8?B?eWNCNW0xLzZMWW5FU1ZnZk9VS2RoRFJJeWpVS3RKaWtQQ3lmSUxFZ05WSFdN?=
 =?utf-8?B?WWJCWnVBajB4MjJwVGtlT1JBU1QrUE9QTW5HdmxEaUlqNE5FcUZvR2J0TEhJ?=
 =?utf-8?B?T0d1U2EvT3ZoU2VscU5OVENremVsTmJqUE9iK0RjYStxSncxMEt2YXlUam9r?=
 =?utf-8?B?MFd6ZWNrbU9CODhSYzdLYlVDTlc1ODVoL0VuNFFvQlRkWjdLM2V4WkRoblht?=
 =?utf-8?B?enFDUFBLK0dYOS9XQ0NoN1BkWnIrbUIvMHQyUk1YS1BnN25UM2htWTBKMXJE?=
 =?utf-8?B?STlhRkhWdzVMaTFXeDJvMk5TVnFFTDFQL2FNcmJSVlpKMVd6eVVRZWRxak5m?=
 =?utf-8?B?ZEN0d2ROYTFTRzBSSGZlOFpvNlBUZE0zS25Uek0xVEtYQVJsSlc1TnN6bnIv?=
 =?utf-8?B?NG0zR290bDdaNWV4RzgxMkVaaUxXWE5iM1dLWk1MdzlOQkdtS3RBMnduZUpS?=
 =?utf-8?B?N1VRQXU1UUxGTUxrcGlieGo4SVpxNUxmcFgvREtWMkdzUkkvZHVLT2FlZ1NP?=
 =?utf-8?B?N0RBZFZGRm5hWFFsYjZ2UXJKaWFQeE5renVQYW8xSlFWSXNmZ2JUMEtiM01z?=
 =?utf-8?B?R2U3bTB5bTROTm1rSGpVeEQwNWJUSHl4dm83OHFyVlQ3N1hsbUZaOFFiMjd2?=
 =?utf-8?B?ZnVrUHg1T1EvMVZLUEc5TFk4ajR3SU9tVjVyc3F2c3loY0haYUx3U0x2bHcz?=
 =?utf-8?B?eUI5QldTalY3OCtveXVIK1BVUUhsNmZZVTljWHpMTTRJOHlldVZEeVk3MUFD?=
 =?utf-8?B?aXNwNmt2OFEvcTRQN1JIZk1pUjNFbDl1b2UvOWxyaytQOUlCM3ZmbzhPQUhM?=
 =?utf-8?B?cjYrYkdGd1dMKzVFbTFxV0FYNlk3bnhSZlJtelhlM1pST0JxWjRnUmlPdDhM?=
 =?utf-8?B?RmxQT1dFc1puWlQwRzNlL3dYTzF1aEIrb1JSMEx6N2EvOFBCMC9hLzZicmM0?=
 =?utf-8?B?QzlQMXBpNStaR2RkL3dzSjVyQVk5UThSZS83Q3dBMG5BMDhTS2pIcUJjRHBa?=
 =?utf-8?B?ZXc3b2pUQ3ZVS3BHVFBrT3NNUUMxdmN0NnBNVWgyaHQrbkY4cmMrYm81cVda?=
 =?utf-8?B?dFFiVjY5Q25LQWhLSGJPYmlQbFZXVjdjeHpJSE10ZkJZTlQ0Umg2b0lqOElW?=
 =?utf-8?B?YjFVSGNPYTlKVU40WVk3Z01sUHdWRkxmOHk4TTJ4c2NTZ3VLUXBMUGYyQzVC?=
 =?utf-8?B?TUlQVnRNZUk0NDh5YkluZnBnNjhmMU5HU0xjVmFjbFhlQUYvRXFoLytNTUV2?=
 =?utf-8?B?KzNDM3hqWm5xMVhPdTArb2dtN1hYR3A3dmVDR0Evc0hUU1dHK1NSZzdRRlJE?=
 =?utf-8?B?R2JwZVdSajVLTU96RDJERmZXS0hTMUZ1VVdkWWZ5cFpOTlhKdmNWdXhXaEt4?=
 =?utf-8?B?Q2ZOVXJSTktMdWtGZytzUXVvbm1VblhlQ0ljakJELy90T211K3JhYTZ4a3BC?=
 =?utf-8?B?THI2bDhaK29xQVcrYUpUd3pXMTcvTUx2NnRjeFVUSHY3T3k1bHZkZWdPTVdJ?=
 =?utf-8?B?V2hnWGRCMG45Ykk2QjlKdTFXMjF5T3FzSFI2dmMwVlY0TnA1WUM5T2VoWFBI?=
 =?utf-8?B?N09rZjZ5OXA0bTdRYW91UVNWN0phS2pvU0U4bkVKQzd1SHh1KzBRUmIvZmJs?=
 =?utf-8?B?VlVQbkNua0w0Z2lUV0Qyd0FUUW9oa29jODlZRGJyNGVMMnFZVStlOXJQdzE5?=
 =?utf-8?B?RDFIUUpQZ2Z3SDAxVEM4YXVQblAwdVRrTXJFczlhc05XdUVCd1JISU5neFRK?=
 =?utf-8?B?bXQ5L0M1a2xNN1dUQ01GTTVUUmxZaXF0S09RRk5VTGRSazIyU015RkM4RGVF?=
 =?utf-8?Q?eUj5qoHiASlOA6I55QUQIH8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 46e08254-3b4c-45b3-96bf-08dc9fa1bf81
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2024 23:00:23.2492 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kum0JL1mOv3uI2BGmOnX8UAOOPhuDLaQD8uVjAU6tpnVA/7hcQPoZkI62q+zS3h5L4iNJG188t4ZceVxiTrq81ow7OKbJZpsrrFtoX1KPYk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8747
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

On Mon, Jul 08, 2024 at 09:23:15PM +0000, Matthew Brost wrote:
>On Mon, Jul 08, 2024 at 01:21:00PM -0700, Umesh Nerlige Ramappa wrote:
>> Add ref counting for xe_file.
>>
>
>Patch LGTM, but a nit I'd make this first patch in the series.
>
>> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_device.c       |  7 +++++--
>>  drivers/gpu/drm/xe/xe_device.h       | 12 ++++++++++++
>>  drivers/gpu/drm/xe/xe_device_types.h |  3 +++
>>  3 files changed, 20 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>> index babb697652d5..e6eacf1bcce0 100644
>> --- a/drivers/gpu/drm/xe/xe_device.c
>> +++ b/drivers/gpu/drm/xe/xe_device.c
>> @@ -87,11 +87,14 @@ static int xe_file_open(struct drm_device *dev, struct drm_file *file)
>>  	spin_unlock(&xe->clients.lock);
>>
>>  	file->driver_priv = xef;
>> +	kref_init(&xef->refcount);
>> +
>>  	return 0;
>>  }
>>
>> -static void xe_file_destroy(struct xe_file *xef)
>
>Kernel doc as this is exported.

will add

>
>> +void xe_file_destroy(struct kref *ref)
>>  {
>> +	struct xe_file *xef = container_of(ref, struct xe_file, refcount);
>>  	struct xe_device *xe = xef->xe;
>>  	struct xe_vm *vm;
>>  	unsigned long idx;
>> @@ -130,7 +133,7 @@ static void xe_file_close(struct drm_device *dev, struct drm_file *file)
>>  		xe_exec_queue_put(q);
>>  	}
>>
>> -	xe_file_destroy(xef);
>> +	xe_file_put(xef);
>>  }
>>
>>  static const struct drm_ioctl_desc xe_ioctls[] = {
>> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
>> index bb07f5669dbb..2a8b370b1fda 100644
>> --- a/drivers/gpu/drm/xe/xe_device.h
>> +++ b/drivers/gpu/drm/xe/xe_device.h
>> @@ -169,5 +169,17 @@ static inline bool xe_device_wedged(struct xe_device *xe)
>>  }
>>
>>  void xe_device_declare_wedged(struct xe_device *xe);
>> +void xe_file_destroy(struct kref *ref);
>> +
>
>I forget if this is a hard rule, but public static inlines likely should
>have kernl doc too.

Not seeing kernel doc in other places in xe where similar inlines 
(get/put) are defined, so did a quick check here - 
https://docs.kernel.org/doc-guide/kernel-doc.html. Looks like kernel-doc 
is a low priority for static functions (no specific mention of inline 
though).  The get/put are self documenting, so IMO, I would avoid 
documenting them, unless there are any other concerns.

Thanks,
Umesh
  
>
>Matt
>
>> +static inline struct xe_file *xe_file_get(struct xe_file *xef)
>> +{
>> +	kref_get(&xef->refcount);
>> +	return xef;
>> +}
>> +
>> +static inline void xe_file_put(struct xe_file *xef)
>> +{
>> +	kref_put(&xef->refcount, xe_file_destroy);
>> +}
>>
>>  #endif
>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>> index c37be471d11c..ec2b0fb6afe1 100644
>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>> @@ -566,6 +566,9 @@ struct xe_file {
>>
>>  	/** @client: drm client */
>>  	struct xe_drm_client *client;
>> +
>> +	/** @refcount: ref count of this xe file */
>> +	struct kref refcount;
>>  };
>>
>>  #endif
>> --
>> 2.38.1
>>
