Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7329BC3065C
	for <intel-xe@archiver.kernel.org>; Tue,  2 Jul 2024 16:25:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29EAB10E00A;
	Tue,  2 Jul 2024 16:25:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q7eQwidL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 165F810E00A
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Jul 2024 16:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719937541; x=1751473541;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=eT87G12eoliqyobm3bQQYsPHUVZKJafKqB/QTwujklw=;
 b=Q7eQwidLHylmVaX/lioEV2IKeLxe2GratApYZ+X2FhPhHX05h1Bp22bW
 YHuzyEIDEVKDFzbWadXmAs5Izk62LSGvpma5i3TDq6Xrtw/FgqGlhzHsW
 Z+PugkN9ExH6cLbeExqdcnp2mBjjmffXgChpsaUvr8ZopINVLOZUCpyUr
 aNobHa+Re4jifTdUU8g+EDJdnBTv6qOr+Tr6T15MmY53Dfsgw0vjw+LO5
 z+o+P8VpRutq6GlNNwpz6ovBqvQivouPY4vW4U0Ek2uowdrZ53V9lAaQg
 f/4BSejoEMtodT1C+0oQ0E4C37xqF2iFIg/Nsgs363sVm/4NWO8so4xc4 g==;
X-CSE-ConnectionGUID: snSHMaRpTRKmiA2zDuOn5w==
X-CSE-MsgGUID: ScPJ0OvGTfeRJ17oCBwmMA==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="12360253"
X-IronPort-AV: E=Sophos;i="6.09,178,1716274800"; d="scan'208";a="12360253"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2024 09:25:40 -0700
X-CSE-ConnectionGUID: zYiEDCHnRraIEguIar4DJg==
X-CSE-MsgGUID: EHZe9u5uQpCtNz4ogF91cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,178,1716274800"; d="scan'208";a="50562146"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Jul 2024 09:25:40 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 2 Jul 2024 09:25:40 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 2 Jul 2024 09:25:40 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.47) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 2 Jul 2024 09:25:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GomKMYAnvnBSxvwnOVGBV/qlev1p7MlxOKbKSD9Wwe8r/8ZiVn8alZ6ooOgZwCOotKZAuhw62T/hapqjFVyVJUO/RJYTAY/wtneDhr5oA3c71+OrxOdgh7AwXA0n20ZhFgtCaKLuaN6iXiW6uKtV148R5PLeETwL10/Oct+Q8SDeOzGWOXz7Xwo6TehDths7x+NcyDWJkxA66Qq1tinW+YKG41B+noIl4DRnFN098yRxgbvhYfDysr8s48T4O625JNI6XYfRCGZPY9sU4W3992CUXaMh9MkCNv0kCLBaGUS1pfYooUEFTIE7diz7Zt3bgk6nNN2ZCWfGyam2K2U4Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zZ+TTn8Z7F6u3sJzzvGNXz7zOUe7DDA6TcyJ08p4SVY=;
 b=aFY1HERI3nJGcEGN1seAseVe9hpqv/tp9l5pVCTjj6yW0wgSN00jJKm4IVpBCv/fnrdZL3AGYmpKzIwo6uXHhkZr9FiGqLRRrtt7VgqCsF9fdf9/y44G7kVvMt1JCbhxUe7ItwhwWZUJuBm2uAZO2P4FqMvy/BsxEPFl+2RWJgJPCODiGmoDo4y4EyePQc/Zhw6glKx2neiG2mzeM8e/uRq4g/+/glITH3nBhTBqwViwNsNU1tf87invlL1lqSa3citgy9ARSAbx1ms9FG+PAQpF4iD/qFREJBL5DrmpWqEM1IccMgzvn1JRwxcQJKgZ4AnI+U4GXLhXJqIPknu60A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by CH0PR11MB8085.namprd11.prod.outlook.com (2603:10b6:610:183::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.32; Tue, 2 Jul
 2024 16:25:34 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50%7]) with mapi id 15.20.7719.028; Tue, 2 Jul 2024
 16:25:33 +0000
Message-ID: <790e4a09-a383-47fd-8c1d-2b8994c6c0b4@intel.com>
Date: Tue, 2 Jul 2024 09:25:31 -0700
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=93_CI=2EBAT=3A_success_for_Reapply_=22drm/xe?=
 =?UTF-8?Q?/gsc=3A_define_GSC_FW_for_LNL=22?=
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <ryszard.knop@intel.com>, <ewelina.musial@intel.com>
References: <20240702001155.2163743-1-daniele.ceraolospurio@intel.com>
 <171988208839.3729.11952250272154489901@2413ebb6fbb6>
 <mxtejwnl6xie7a7py2ntnrbq5s57o5ho4exy3gygwggau4hgt5@lg3ixotyab4j>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <mxtejwnl6xie7a7py2ntnrbq5s57o5ho4exy3gygwggau4hgt5@lg3ixotyab4j>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR11CA0077.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::18) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|CH0PR11MB8085:EE_
X-MS-Office365-Filtering-Correlation-Id: aae8dc1b-c135-42b0-a26c-08dc9ab39912
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R25xR2c3blpCMGhGMFVpWm1UVUh1eXNRVUlNemk1aHhTWEhnUUFZbnR4c1k5?=
 =?utf-8?B?K2syV2VvNlNaNjgya25LOHN0dHQ4VStSMCtKZnBUMFkvYmNVeEZURlkyWi9B?=
 =?utf-8?B?RkFRcW9ML1BIVEpWRUZJUWVUV1paQXpWRTRtRVhOeEl4djdYeWRSTFdIbGRJ?=
 =?utf-8?B?S0tzMDhmcS9iVkpQYjlJdTFQYVFmSGFmUk1GL2Z3azBaWXM1WFRxYnlFK2NB?=
 =?utf-8?B?c2VTcWt2bnFDbFhRUXF0WTQrYi9oY2FKWm9SNzRyYWZmS1R3Z0FiNzhMTVlZ?=
 =?utf-8?B?OG5xNktCT3BJajhDcW1ON0ZxZS9CN2VWSE9kLzgvTnNUQlpuWmd0TWEwUzZx?=
 =?utf-8?B?VEFveTh4cGxITmJ4UlROWXZkUm5QWVROTVZ5cHY3OEdBVnVMYUxzZzRoMGRI?=
 =?utf-8?B?TEV1UE1UcCs2S3ZSeTRvWW5vL0NNUTZkY2IrWVZkckF0RUtVTzVWZjRFek1F?=
 =?utf-8?B?OGI5SFpoNHllRTZkSjdNNHdwZXVCcWx4R2NzMkV6L042b0JEZjVFTmlNcUd5?=
 =?utf-8?B?RDBocUJIZ0l4MGpJRHhkaW5DYkozN3pNODZJa29rcXNOQ3VaZkx6ZDBLalFi?=
 =?utf-8?B?MjZTdmtaWUV0cHR5L3lacEhleDVtSUh0NGtZams1cjR0ZVRKeFVySjRkVVNO?=
 =?utf-8?B?UjU2cHNuVU1uaTRLbU5OZk9YbWNmNm1XY3p0a3lwZEtVMjA2emtqSjJ5bC9y?=
 =?utf-8?B?U0ZsZDIrcERIRTVRcmRydzdGL3o1YTNEalZMVngrQzFjaURJK1F6SnY2L0kv?=
 =?utf-8?B?QVFscE5qUHB1NFQ0SW1LN0hxTW1xQWEydEFkZEZRdVhLTlBqSE9YcTh5eGdD?=
 =?utf-8?B?V2NpSDdhM2JjTUJkYnJFSmJ3UmNKQWZNK1QvaExMeUtqVE91dmRac2hMblBT?=
 =?utf-8?B?VDJyWWJMOUpiUDZwOUJKRFdQd09PSjA4dkljNTNsc3hxaUppUHJHVDBZMTIy?=
 =?utf-8?B?dm11WlF0Ymgzc0NqeHRvSmNrbGYxNVNaSEJHOFlhYU9kOHF0SldkNFBSa2xv?=
 =?utf-8?B?ZkdIK1JUYUt1U0hpT212clVMNmROemRjMVNnYmVIc3VnTTNTcjdmZnNGbWk2?=
 =?utf-8?B?bXliSWVOZXFXZ0lwTUFqdjZGdDgvbE5RLzJXelhPbWNnTE92Q2duWDhRcy9s?=
 =?utf-8?B?dUR4ZTNIZDFyN0pBdjRabm5mOWo2dldSa1BaNmZyWkZ2NHhjUk1iREJVU3NQ?=
 =?utf-8?B?Y1ZUU3ZMQmtmdXMyMHlBSnVpUHdWZmNYeFlJN3Roajhwdy9YcHpqNTJueEl1?=
 =?utf-8?B?V09MUlVFYURlMEZGZHRMK0lVeXFMV3VEd29rMUVVRmhDNVAxaFU4Lyt5M0V5?=
 =?utf-8?B?YytRS3paaVlBWUhxa0pCTk9oOVBrbkxQMWxlRmJVWm9LU1FVV29WSmZZSTli?=
 =?utf-8?B?OEc1anN4QWNNVTY3clFGYUx6UktiVzdvSCtZSFN1bk1BLzl0R01ORnpJcXNn?=
 =?utf-8?B?djBUSm9LdVdDYlRmSlYwejZZLzRjMlB4N1A0eVprZUhRNkMzQUUrblVFZThI?=
 =?utf-8?B?dVJzQ2hiVW8vVWU0MUlwZDFMNFJKNXJyRDBqdmlPalVDcWVONDNYYW5jV3Ja?=
 =?utf-8?B?Q2h2ZVkwYS9zZWpaNHZPd0NiMUU3UEJvb0FBbUpTM2tadFUwUmduQSs1eFdF?=
 =?utf-8?B?b1h4OHgzQS9hcGdrbEl6TlNnV2x6Z2x3NVlKaXlLajRYNXZHOXlUc2pkU2NB?=
 =?utf-8?B?SlZFN0RHbFRDZ2NIS0dEWGU0bDQvM0tqTE9ReG5XNDlUNEQ0ZitZRWtyakNC?=
 =?utf-8?Q?I2KI64BJbejT5CswXE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SEtxb3B4cDZFVyswQjNMWkhEeUZ4MUtZcDRNMXhkNUN4b0Z3OXlMakdmaGZS?=
 =?utf-8?B?Q1JQdVhmSTFwQ1FPVmRUSjRKM1pxby9GaXFLdi9ySk9vdFB1d1dvc1lVbnRq?=
 =?utf-8?B?R3dseU1wdEliVWVocEZPMVUyZ0FFUUdIeWVuVXNrMWFpNzhhS0RtdUQ0Z2Jw?=
 =?utf-8?B?ektXWjY3ZEt3QlJ0c3h6YU1jVGc5bUpLQk96enZxMklYSVhPZElDL2ZjV1A2?=
 =?utf-8?B?VUF6WkR6Q0d1NFZ6YnJvbkQrWHgwYzN2M0J3Q0I0OWlVQVB5Wm1zWjVIeGtL?=
 =?utf-8?B?akZYeFlUaW9kSUlBNytUazJHK3k3enBjQllONjlPOW0yYnFKOW0vd2VqTWpa?=
 =?utf-8?B?a2JUM1lKMHVTa0ZDa0RRb2ZNYTVpakZWb3NxM2FzOTFNYTcrTDlWZGtKU0w1?=
 =?utf-8?B?b0hKRFdOSnRSczJkbVZBKy9RYTdVbXNZZ2Vmb2JvTUxaSUhwTmZxdWZMZ0FT?=
 =?utf-8?B?blY5Qk14UjVvZHdLb1lpK3N2a3lsa1ZFTUVNSGhYWXZYS0poZCtZSEJwNUwx?=
 =?utf-8?B?NEtBOXpoTy9penl3TVVOSzZCTFRxLzhybGRFQllQa2xMZWZiNFV2c0xIUy8w?=
 =?utf-8?B?WW0vNjJ4VGFwdUJJMllQQW5FaGl1NElzUmNQczBFOVhVL0dCWDlvSU5pT3hk?=
 =?utf-8?B?OXZEOTZ3TjllWHZYNXVrSEFSc0pFSFR3dldmNGwrS1hFWWVhNDhZejZkQnJh?=
 =?utf-8?B?R3ZhU3cxbnVnN1F3N3JRdjZqWVRFWitjZHFKUDE5cDBtRXFldkpWa2E0MVVw?=
 =?utf-8?B?YlUwZU5QU3BHblVDajF6UFJ1b0tCbDZSbk1CZE1WV213cEl3MTVjakRFazdT?=
 =?utf-8?B?WU1VNjI1ZGJUQjRMc0pJUVNWOWpSeERKNzBST2UwOTRLNDc4Z1Q5eDhWU205?=
 =?utf-8?B?WWtDQk1oWWZ2V29oYUNBRGkyZmdjSDFyNjlBRlIrTFBuSkFtaVhWZWhpMXBL?=
 =?utf-8?B?WCtXZS8zUnViY3hOWC9WZVJ3ZWdnMk1wZER6S0ZmcjVEV3pEWWtTdUJxVmJX?=
 =?utf-8?B?QkxzOTFiRlFDd0NDVDBTMVgvRU1JZkJ2MUZtQUxLSnBGUExHRGtGV0hRVjla?=
 =?utf-8?B?ajk4Ukl5TTM2V1JncWdYeUphQUM5Y2MzMVhlNXpHM0FPeGQ1QUR3U0VhZXpL?=
 =?utf-8?B?TFpPMFNJdDZXR0ZJRnJMUzgxL29CWmcycmNVS2tSbDlmdU16cTBQK0t1dTdD?=
 =?utf-8?B?b3FIU1lvRGVzQWJCSERZVG5DMER3RW9aN1o1elR5Z3lEcnZjS0NtbHJKSFJi?=
 =?utf-8?B?QlZzbXlTMWptdytsYnBVZzFEaWRpc09XZEdMRXpVR0EwR2l0RHBWZXU5RXox?=
 =?utf-8?B?L2pDQVR3S2NqTHpyRFFTUlQvaTdkUmIrODYwenNFTk5SZ1RaQkhUeUsrVGpn?=
 =?utf-8?B?eGJVNWxYenkyaGdKalZ5YkFuYzdwbWhKTHk3RGRzNGhwd1BoeVhzb0RzU0Nj?=
 =?utf-8?B?Z0Q4Q0lMc0FYQmI3Zm1xQlpkbzdNRUYwYnVjZ20vZnNYK0ZPSHVvM0U3OTVP?=
 =?utf-8?B?cmFkdlMvM2Ruc0NIRy8wWFF0cUFDNURaUDAwZXMyUHRLWUxzNUVSZi9jVWNQ?=
 =?utf-8?B?ZFN6ZHA0VWxlMVlCejNNM1VDR2VXRDVJRzFvUFZhMm92RFg1cmlTVEV2QzJz?=
 =?utf-8?B?MDBzdUlPNHNRYjBVUXc5WDI1NFk5ZnNvQmJNOUVSYXNHKzNHQ0Z1SmF0c25Y?=
 =?utf-8?B?T05sSk03eUJhNXFZQzEva2xxQ0lWSUlOQnNlVTRneEpBZnRJdThZakVrWlpR?=
 =?utf-8?B?M0hFMzBGMGY1aEZ0Wk1YVVBKT2F5dGl0YXl2aHQ4eE0vdVByTzBWSlR0WEx3?=
 =?utf-8?B?QkE5dFFOQlBranpjWlNGOWdTMENFNWJOQlpscWZ6d3l4ZU0vL3UvWEcyZGxU?=
 =?utf-8?B?VFVPZWg1eDEwOWdhMnZQYWQ2U3BYUTVqdHNaS1kvOTBqTE0wc05lSEJIaWJo?=
 =?utf-8?B?WVlHWGRNNDZHVlNiTGZVSkZIdG5FSlp3QU01NC9QbkdNZlRvdE5xTUNmVG0r?=
 =?utf-8?B?L0JhanNKcmVoUU5HNkV3MEFpS000NjlJRm42b0dQR1pIdGUyT3ZyRCtNNXhu?=
 =?utf-8?B?RlVKMnh2TDVRZm1jWVZvNXNqZkk5TkZjVTUxbXVBdjFvNERWeE43SXV2Zjdw?=
 =?utf-8?B?ZzQ2T2FyS2tSUUIzZWZrMHg2eTdwbXNQYkdkMVBURTNXeHBqRll1aXkwcjIz?=
 =?utf-8?B?UXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: aae8dc1b-c135-42b0-a26c-08dc9ab39912
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2024 16:25:33.8896 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8KEV6fdG95A/FYUh48Tkd3hmDtZd81UBLOddhqdJD698bSzLSGHN9WdnKMh9xBinoRKj2g294sBP6gg/e/NTHGYJC3+oWiS0zYnxxuHn97U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8085
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



On 7/2/2024 7:29 AM, Lucas De Marchi wrote:
> On Tue, Jul 02, 2024 at 01:01:28AM GMT, Patchwork wrote:
>> == Series Details ==
>>
>> Series: Reapply "drm/xe/gsc: define GSC FW for LNL"
>> URL   : https://patchwork.freedesktop.org/series/135623/
>> State : success
>>
>> == Summary ==
>>
>> CI Bug Log - changes from 
>> xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299_BAT -> 
>> xe-pw-135623v1_BAT
>> ====================================================
>>
>> Summary
>> -------
>>
>>  **SUCCESS**
>>
>>  No regressions found.
>>
>>
>>
>> Participating hosts (5 -> 4)
>> ------------------------------
>>
>>  Missing    (1): bat-lnl-1
>
> I guess it didn't really work. +Ryszard +Ewelina: Can we promote LNL to
> be considered "a reliable machine from the CI POV" so we don't have
> "CI.BAT: success" when LNL execution is missing?  Or is there any other
> reason why we report success in this case?

Damn. I can't repro the issue anymore with this WA applied and even in 
CI we weren't seeing it when I sent it for testing before: 
https://patchwork.freedesktop.org/series/134099/ . I did 3 runs in that 
case and none of them hit the problem.

I've triggered another run to see if we get any better logs.

Daniele

>
> thanks
> Lucas De Marchi

