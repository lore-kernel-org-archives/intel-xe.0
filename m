Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97666C5AD55
	for <intel-xe@archiver.kernel.org>; Mon, 10 Aug 2026 21:17:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BBA910E25C;
	Mon, 10 Aug 2026 21:17:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bna7rVfi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F303410E25C
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Aug 2026 21:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786396643; x=1817932643;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ipf64IG5iECiNOyNb0phGjA5N0ii5c2ZSz30OK+p6b8=;
 b=bna7rVfiwqQT+4MxKToYOM6QdO6M8Q1vDymddO3h7hnuo0Vg58DeGPAq
 3tlUUWsYHfZ8IVKMCq5aYQKeBthMctcbEeEdydPCnNheWdq+kf6R37XjG
 193MUjjs7mUyojNuIAGCh5+LBx8OsS6ua0w2mw5rqujU7A0z0C3E6xAPA
 HlfPxbhNPW1cNR4EzNKUpRRH6qDVrQvznXl/r2LYTxNwEExEylt4eSwEb
 MKT/si6DM+7xwrM3tzC6uidtJIZsERQ8325FPHMfdTE8nJcRuak4lxtBi
 ftvLHs4EwIlgDiXjyp5A99BbvGgAuRLJQa+cIVpvpZB55wOYqKYGgF53o g==;
X-CSE-ConnectionGUID: 0WQaXCoqTJi3vvE2+/sUbQ==
X-CSE-MsgGUID: J5xrFhlYTEukQ8v25mZn9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11871"; a="86948095"
X-IronPort-AV: E=Sophos;i="6.25,216,1779174000"; d="scan'208";a="86948095"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2026 14:17:22 -0700
X-CSE-ConnectionGUID: FrWn7/cbQUWvz+Dx6Oj6zg==
X-CSE-MsgGUID: M4ZeCzPNQYWS5AXA115bXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,216,1779174000"; d="scan'208";a="265139054"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2026 14:17:22 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 10 Aug 2026 14:17:21 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Mon, 10 Aug 2026 14:17:21 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.63) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 10 Aug 2026 14:17:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VtoZxEXrXnhSXw7Xc5bobMFmYHfQZ+wt4/EboQWbVD0mM1YypETFQkmjxMx0goQSekbBP8wFu9kVPZ56v12u0fyJTE88kWP1ZISqje4TIbkqS+J2cgzOwzg4WvYkVMO7uu2Ajty67je9gdgCXVyirJKmfUQphKyxkOAmPETuzjGb6gbVuDnjaFT2HZz7uwq7SdgfC+CdapWagxLKU5kWsLij/1rFLpYPUjEI5yHQLNyjNe90NbgF5LYSFX5rWXK1VjnD/rTss8cPSWLVCVi+ZIkQA06gP4c6PjSCXJOij9ezbd8s6ytiCOaR0pJuzwQCy6W5N1kEmytnw3J/t8p5dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p1VcsRqF2Nca+vmNRy59DLTSS4ZaleQYJPYJqE9flv8=;
 b=RU0G0nxNkXi8CrqBZn5nJyFwCd549zq61lujzUDAeTkwuX5L4B7M2tEmhC94/Aji/5DvLVARaDHOSduvLcUuMlUyDIGCYBrcuuvmyjc6Bj2vCrWQDkzmMOraUaZ/YLlOuHYp4fXdA1L7KTaE76dWBWGcOYdUh8Q90RH+3f4TbwMvmlG8DSkqciQe1eZs3Y1sw4hCxfpLz1tTnw56A0UgpSFoaQwRIP6nFdrG8XDWbxiLkj0QMSrccq0s36aAXHQZDnomyR/rgSBcwR9lbLciDv4tJgz1bvNvbaYqhJooSj877S/GVdI0mf1USXIKPmZvQGhW3lVaX2GmtUigyuipxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by CYXPR11MB8729.namprd11.prod.outlook.com (2603:10b6:930:dc::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 21:17:11 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057%3]) with mapi id 15.21.0292.024; Mon, 10 Aug 2026
 21:17:11 +0000
Date: Mon, 10 Aug 2026 14:17:08 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Gajendra Uttamchand <gajendra.uttamchand@intel.com>
CC: <matthew.brost@intel.com>, <kamil.konieczny@intel.com>,
 <rodrigo.vivi@intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v10 1/1] drm/xe/lrc: document sentinel and make
 CTX_TIMESTAMP read TOCTOU-safe
Message-ID: <ano/1ENQB+CE017P@soc-5CG1426VCC.clients.intel.com>
References: <20260810071812.213358-3-gajendra.uttamchand@intel.com>
 <20260810071812.213358-4-gajendra.uttamchand@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20260810071812.213358-4-gajendra.uttamchand@intel.com>
X-ClientProxiedBy: MW4PR03CA0276.namprd03.prod.outlook.com
 (2603:10b6:303:b5::11) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|CYXPR11MB8729:EE_
X-MS-Office365-Filtering-Correlation-Id: 64812563-d2f2-469b-c5a2-08def724bda4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|376014|366016|18002099003|22082099003|11063799006|4143699003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: 8hw9Qfk+hWiogDsgAAwYZuGE6+RSN7LRw5bV1iUmyju4cjNQCJK6n6I9+VJYGhRAjTSM/Ucr1o+e56v3N52YcTtVH1SF556iCBSbivQ1hsMH9zLzgTUjeGmhV/C+FLkLQfmG2RDYdIKo9OWnMmdopuAo7pQqjpdxtVMxjU+QJfqgKqN7X5arzYEhuQZwBWmFUzPlYukSDqMkE2+i/R5vGlGbaRmyLaVBMzmq+FnanoO3GMiNJ38ffju8/8YPsAIP9PxFYvbSRGifRfLFboIoExIlLshIcFvW/R7wxH8aYSlxJRJOxvo7Rn+v68MBjp0oldDslVM57zcpQPj78riwbDI2mcstDv7s9U0458sOHWgpowIgTC2lQhPvyLPAKssKiyx3vqWdGsDlJOvU6ywoK98E/bf6BsS7sh2ccEQmv7nndSLDyGqzTLgOxi3EmXdUZQB4vk+SRygt9Fsv6zMVphrY6wNUEtFvjqZy3HrU2HwuCeCLW26+Lx2gtZF/I3Upi49LS6MteMxrZecLwbZpZomODE4ZEoreKohuHtMjAR4ggVynw2V+Kt9/WuJCtK57Ac/F4QalbNOcDGr8xaJrUSK+lQAXpOt+kuCJ1d72M5XYpQPCaWoRCgSj1RdWBx6YKG6OxYw64ZxcY5hyQ07iCfXahERSxxgVslc94Ng/TQs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(18002099003)(22082099003)(11063799006)(4143699003)(56012099006)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Wk9LU2Yxbit5Qzl3MHdKM2tYaEk0UEttRzdnWU9JL1JCRXBaeW5GaEEwbWl6?=
 =?utf-8?B?RzVpWk9VYks4ZG1OZklQaTRxdGRpV3dkbXlOOTQ3TldEbDMzQ29RZmdtT1lB?=
 =?utf-8?B?eFRZZmlSclZoQkd1cU15M2wzVHpMRFd5RmFLN2Q0bWQwbzVZWVc0OVVDRXJx?=
 =?utf-8?B?T1J1ZS95N25SQlRmMlRmWWVGV0w0NzE5VmlDQ2FhT2Q3U25iaFpTQ1RwanlF?=
 =?utf-8?B?SWVZSWMrZ3dpd3JNelM2YkRWbFllYjNpYk9qWldySXc1RWZnTDdGckI4SHBz?=
 =?utf-8?B?d3NNN2RSclowME8rLzljTS9SRFFIbEhGVE5WODhRYXBSWWRpMVl1SUpFYk9Z?=
 =?utf-8?B?UG8vK21LNnNlS1hmb1FNRFVDdDVUeVRVR0ZRYTQzc2lKTkExSGRDOW5oSUxM?=
 =?utf-8?B?ZjA5UWs1NjdKUXIvRzVFS2RqRXJkazZhdno2Nk9sMkt5cVRHaWNWT0wyMkxK?=
 =?utf-8?B?MlVJSTdsTVFnUTBxdGx6bmVqaUJ3RjFnMG8ySlVqVzY0YStUaFdkR3loNjMy?=
 =?utf-8?B?VVFaSHV5Y0djeFVKK1UyZnRmYlZlci9OeFhzZ2lvT2JsRWdZL3BJRTNDd1NT?=
 =?utf-8?B?TmgxQXRHSzFSUnRraEJ0Zk9EWE9DUktDRVJsL21KajhBbDVFOEJjek5mWGpp?=
 =?utf-8?B?ek1uK1VpNnYwUGIvL0JRZERaU24vYzY4a2xHdmQxUlNnNHhOU3piVDloQjIz?=
 =?utf-8?B?dlZTNlkrSTNWZWxXTkJxM1EydFVmdDVuSVRsT0ptc3ZQbjVCcDJFcDd3RUNq?=
 =?utf-8?B?VlU2clhzUmRYTlE5TDNlNlhmQ2JiWDNTaTFoMlpFTHk5UnpyajhWaW5ZWXUr?=
 =?utf-8?B?V0tkUjBJOC9pcnJLcXZIems4eGVxaVh6dUlhTm9OOHF6K1JCZE8weHY2Sytz?=
 =?utf-8?B?K3pLbUhkQjZDQzVVRWdFWkZuNEZUdEFlQmxxQUlGRVIvRGV6ZWo2SUpOak1z?=
 =?utf-8?B?bnpEY2kxUHN4K3FWNVROTVRGNEtETGNWQWhydjduMVZlNjRocmlCUDFsbXFo?=
 =?utf-8?B?VTZuNGpnbzBtUHZSQ0loNEgrL2llZW5pUDEvckpqRkxzbFZ0WVN1ZitJQmpT?=
 =?utf-8?B?WjRKSGpOcWJpclJqbHRVcTVJaWZ0c2JvU1M2a21FMkhZRU9MTS8zSEF4R1hx?=
 =?utf-8?B?bzk1TWJ0cW1reWxmbUdKait5U3BHOC9HdWxkbWhTOFRZZlp6SjExUzRGbHZs?=
 =?utf-8?B?SVBjUlNaTkNyNDF0S3Z2RFJjaHRJc1M4SFJDeXlteTRKeTlCUk9BOTkxd3NP?=
 =?utf-8?B?UFU4Ti9iclkyTjJHWEsrdStMdzIrR0l6eVpCTURKVXg0VzJCNXF0bWRIOHNN?=
 =?utf-8?B?K0J2ZXcxanIvbzJoMGordjNPc21GWW5raytMRVJiNGdNREIydzJsNmRxZCtU?=
 =?utf-8?B?d09EUjdaK2QrVWxpRzdrcDlpVGhJbnlSbitqMFNvbnBrMmtFcEdDYm9ZZmI3?=
 =?utf-8?B?Y3FXNjc4eTJhQkZTaDdhYU1rQlc3OW9Kdm9MOEZnbEFJOFNQYkROb2hBSldC?=
 =?utf-8?B?cUZMdUhMOFNNbzhqU0wzQWs3aXBzSXIxZkovc2NmK3NYZ3pjbmI5MXIzRmFk?=
 =?utf-8?B?U3FSelphQkpjMDV1VGFXZU9VMlVucHp3ZHhIem9ZRXhxWHpvV3pkdWM0U3Qy?=
 =?utf-8?B?VFhldmNnaTdGNnhrMDJhM04xL2c4MVRhQ1BYdE1XMVlmLzlYc3hZaUlqRU56?=
 =?utf-8?B?VVZmRmhDV0NWS3ZidDZoMkVLOGRkWHZmQ3ZEaXpqQ0tOVkdGSXpQYWl5L3Nh?=
 =?utf-8?B?ZGd5WmtmWCtMSXFQVTh1MzFPaUZVdktraDArdWJKWm1sSi9sd0lZVVI2ZnFX?=
 =?utf-8?B?SlZOMkM5alMxMFF5ckxDT2pUOVB4UDV4SFZMelNqZVlidm5pdnZnNjJNd2VU?=
 =?utf-8?B?V2YvN0poT2pwQjkzT1JTTnplSUp3d1hIcmhYNjlCVzRFaEw4WCtvQ1FBRTd6?=
 =?utf-8?B?eGdpZjd3eEZ5RkFYTitzSWsya2cwRW8vcW9oZEZiQnE3eFpWWE14T1liaWpi?=
 =?utf-8?B?QVgzLzVrNVBESjA4c2svaXFqbGhJQWtIZEFwZjZ5MlhnK2dmS0RHMU02VXVX?=
 =?utf-8?B?OSs3NGs5MnJ1T1ZuYkYyY3kxRkxLZllGbzdJMVB6WUFCQnVIMGE0VE9sSWxn?=
 =?utf-8?B?eDl5enZPV2x2d0JNMkxBNTJLSWNCN2FYVGdyeVBYRWI3dURpaUZidEdPRTht?=
 =?utf-8?B?ZlJMNkc3THJ0eWhwc1ZGWGcvdkh3d1d0QmtnaEgzcnZBN3VTTVlncTF4YUxE?=
 =?utf-8?B?dGJRQkJYNDYvN1RsKzYvNU1BVHVsWDBtTEg2ZE9ubThWTjNrdGVjbm9Gb1dn?=
 =?utf-8?B?V1ZJd3VNSytqZWp2aDhYRnRXWENFUkxGOURMbFljak8zTHVxT0drSHIvSFBm?=
 =?utf-8?Q?oba/qE/d3LC5zpV0obWWBVegIE4t74Xnhwakw?=
X-Exchange-RoutingPolicyChecked: S2seeNyw6/oLBn+euGp6kYNuhZtwl44ubk9GJljXxSk+HG0okhKzZQfe4cSCbSdTRSBYdptS3eKEayasAZTD9xNsNYGrWvxY82bJRjPrYZYScTbFIOg6zbaO0TRaBelR9/aA9Je2Z1gXT5bul2Y3mt5BULG4jni4oHv3q7oPwwkJDUkILOopdUng22cjGKyb3JHzeGaPB/NAFq+3KfASn9seYzIRKK4Nfv/zCTHJYISEW+lgr2Hg4GD7nBDqtSoOJZtkSgDtRQikt5QAs0DD/+h2CngqIB4PZ3pNjtry9ydCnBdJqS+/eYBDIezfe8kmVUkAyHFXSD4FUjQW2GyHrA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 64812563-d2f2-469b-c5a2-08def724bda4
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 21:17:10.9442 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Uh4i3TlgFPgvHAK5UkbXyYXK/0X2tVHWbHuN0hnXX82QlXBfMnFARhymzyjCjNMLIBtmzdgOFLIcQTI9BRD1iHzp6J7+KGO7zOcXop6RjE4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8729
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

On Mon, Aug 10, 2026 at 07:18:14AM +0000, Gajendra Uttamchand wrote:
>Problem: CTX_TIMESTAMP MMIO reads could be stale if a context
>switched out between check and read; LRC stores a sentinel while
>a context starts that must not be treated as a real timestamp.
>
>Fix: Check the LRC-stored sentinel before and after the MMIO read;
>return the LRC value if the context switched out to avoid TOCTOU.
>
>Fixes: d243ef6a39c6 ("drm/xe/lrc: Refactor xe_lrc_timestamp to simplify
>logic")

The fixes tag should be a single line otherwise it messes with the 
scripts (like checkpatch).

>Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/7956
>
>Note: Keep XE_LRC_CTX_TIMESTAMP_ACTIVE in xe_lrc.h as the
>canonical sentinel.
>

All tags should be grouped together, so fixes and closes tags should be 
below along with the others. Please refer to other commits in the tree.

No need to send another rev. I have modified the commit and pushed it.

Thanks for debugging and fixing this.

Umesh

>Assisted-by: GitHub-Copilot:claude-sonnet-5
>Signed-off-by: Gajendra Uttamchand <gajendra.uttamchand@intel.com>
>Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>Acked-by: Matthew Brost <matthew.brost@intel.com>
>---
> drivers/gpu/drm/xe/xe_lrc.c | 22 ++++++++++++++--------
> drivers/gpu/drm/xe/xe_lrc.h |  7 +++++++
> 2 files changed, 21 insertions(+), 8 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
>index a0855648d155..35b4e8289b5f 100644
>--- a/drivers/gpu/drm/xe/xe_lrc.c
>+++ b/drivers/gpu/drm/xe/xe_lrc.c
>@@ -1096,7 +1096,7 @@ static void xe_lrc_finish(struct xe_lrc *lrc)
>  * on until it is scheduled, we also read the ENGINE_ID MMIO in the WA BB and
>  * store it in the PPHSWP.
>  */
>-#define CONTEXT_ACTIVE 1ULL
>+#define CONTEXT_ACTIVE XE_LRC_CTX_TIMESTAMP_ACTIVE
> static ssize_t setup_utilization_wa(struct xe_lrc *lrc,
> 				    struct xe_hw_engine *hwe,
> 				    u32 *batch,
>@@ -2733,21 +2733,27 @@ static u64 xe_lrc_update_multi_queue_timestamp(struct xe_lrc *lrc, u64 *old_ts)
> static u64 xe_lrc_context_timestamp(struct xe_lrc *lrc)
> {
> 	u64 reg_ts, new_ts = lrc->ctx_timestamp;
>+	u64 stored;
>
> 	/* CTX_TIMESTAMP mmio read is invalid on VF, so return the LRC value */
> 	if (IS_SRIOV_VF(lrc_to_xe(lrc)))
> 		return xe_lrc_ctx_timestamp(lrc);
>
>-	if (context_active(lrc) &&
>-	    !get_ctx_timestamp(lrc, xe_lrc_engine_id(lrc), &reg_ts))
>+	/* Safely read CTX_TIMESTAMP: Avoid TOCTOU on LRC-stored CONTEXT_ACTIVE sentinel */
>+	stored = xe_lrc_ctx_timestamp(lrc);
>+	if (stored != CONTEXT_ACTIVE)
>+		return stored;
>+
>+	/* Context is active: read the live timestamp from the engine's MMIO register */
>+	if (!get_ctx_timestamp(lrc, xe_lrc_engine_id(lrc), &reg_ts))
> 		new_ts = reg_ts;
>
>-	/*
>-	 * If context swicthed out while we were here, just return the latest
>-	 * LRC CTX TIMESTAMP value.
>+	/* If the context switched out prefer using the value
>+	 * from context-save over the stale MMIO read.
> 	 */
>-	if (!context_active(lrc))
>-		return xe_lrc_ctx_timestamp(lrc);
>+	stored = xe_lrc_ctx_timestamp(lrc);
>+	if (stored != CONTEXT_ACTIVE)
>+		return stored;
>
> 	return new_ts;
> }
>diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
>index 0a3a611391ee..7be5e3da8bc8 100644
>--- a/drivers/gpu/drm/xe/xe_lrc.h
>+++ b/drivers/gpu/drm/xe/xe_lrc.h
>@@ -9,6 +9,13 @@
>
> #include "xe_lrc_types.h"
>
>+/*
>+ * Sentinel value stored in lrc->ctx_timestamp while a context is starting.
>+ * The hardware hasn't yet written the real CTX_TIMESTAMP, so this is not a
>+ * valid elapsed-time sample and must not be used as one.
>+ */
>+#define XE_LRC_CTX_TIMESTAMP_ACTIVE 1ULL
>+
> struct drm_printer;
> struct xe_bb;
> struct xe_device;
>--
>2.43.0
>
