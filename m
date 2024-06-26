Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9535AC27C4F
	for <intel-xe@archiver.kernel.org>; Wed, 26 Jun 2024 14:25:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C4FE10E8D8;
	Wed, 26 Jun 2024 14:25:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HU8Foyd0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84C0910E8D8
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Jun 2024 14:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719411925; x=1750947925;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=VgkAjU4kRoWeHDxZwH5KpCAS3hL5SK28N6yHRgF60Ys=;
 b=HU8Foyd0BGR6ea6oJ20OmB1ROz1hVBA2ZhbADrGntPdSF4dIX4J9NmSK
 ABwWSDBB1d5fcR3+a3Ok2rAHwHk8XiY0hbiUvmLKileMU2an1k+MJt1gV
 7wSxNzzUaIuisalklBtCoLLgoisUrz7yVIC+qJMT+2w5+PwSDwtVQI3oZ
 lGW5/i9JqJ8jeoLlDWQempFm76hdo3q+LzCgiNMEONKjp99ulyDiMk5aj
 Mra0XtvRSiUx0YOTUBWrdeBPBZaBfryn+3gpU3d36IZFwRY+86lSPaMsU
 SvwMZbYnZchoJzY54aUwbh2UfZ3F7+aPMmXKatbN2KV4nJ+/br0A8AU0S g==;
X-CSE-ConnectionGUID: Pl+5QBjUTxSKpXQbE4YrPw==
X-CSE-MsgGUID: D6BlhJP7T7Gu1fktD6lnvQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="34018036"
X-IronPort-AV: E=Sophos;i="6.08,267,1712646000"; d="scan'208";a="34018036"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2024 07:25:18 -0700
X-CSE-ConnectionGUID: ddDSDOlMQDiTyoodp6ZHbQ==
X-CSE-MsgGUID: xQr4+VCCT0+C9YTaUIJGDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,267,1712646000"; d="scan'208";a="48625603"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Jun 2024 07:25:17 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 26 Jun 2024 07:25:17 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 26 Jun 2024 07:25:17 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 26 Jun 2024 07:25:17 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 26 Jun 2024 07:25:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nqtcQEBlIWVrpJ0YxDufdghbg4b9y06a0JEdUhq0PozdZz5MIAOVVcxu2K1sjORAzaTfHO7sgva5XGSpy0YMZ/Ro5wi0SV2A48ccDcQkqBqWZyLEtcuPMNr1wHlgVzJxgrfRc21YhxBbdV4r8cDbaoNGvhC5sXJvEEWz+/RCexLo+ZSMQSmM8O/prSnFDHYjimAenGV/PUJbihIr+s5EJR6rDzf5YUaNWjTws4GKP18blqstU8oaVkXdvmRL1xjNPIq/z1pztReyLmEuLa25pJAwmSBghU7ZotF+nihTD/s5VAziMDLMzx3cfYJUq5qGIc6ZEvBHWjyJLYnkbJZWAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lHVaZko3dz0VddFslAfP51BG+F7lRBIIhPDxhmV3o54=;
 b=L/pXKeo4qNoaSh+CaNs6IXZj/hUw+V5kRU3ZNrxAj9Vt1+L0KuNzcktic6omaM4vsksmA1uZhsApahUeG27e24veOrq5tuMok2o4aFke1RyuibPUIgT0awmfk/dUPf5vpXfXMbdxnpHfYLhziAOZRE3MzhPnlmG/IGMXCbU5M7Bcvg8ZDDRzQGnFawapapN9GGnMFylVQzcDotzDJDCDlXE17g4iv4LyFWrKQnJKQsbGlDgyLZ71HLpc5Jd6afU0FrjaAopagJJKoR+ssSovMWf9/uTDwYaS7VRkqoLx/muKlRYZpMreBV5Po5L91XrYXClSIX5E6h6MpoU+fRaB2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6541.namprd11.prod.outlook.com (2603:10b6:8:d3::14) by
 IA1PR11MB6267.namprd11.prod.outlook.com (2603:10b6:208:3e5::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7698.30; Wed, 26 Jun 2024 14:25:09 +0000
Received: from DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::e268:87f2:3bd1:1347]) by DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::e268:87f2:3bd1:1347%5]) with mapi id 15.20.7698.033; Wed, 26 Jun 2024
 14:25:09 +0000
Message-ID: <0baa978b-c869-4e82-b6d8-44ec8b6e6178@intel.com>
Date: Wed, 26 Jun 2024 16:25:04 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe/guc: Configure TLB timeout based on CT buffer
 size
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Matthew Brost <matthew.brost@intel.com>, Daniele Ceraolo Spurio
 <daniele.ceraolospurio@intel.com>
References: <20240626134239.5190-1-nirmoy.das@intel.com>
 <f16c1102-08a4-4f95-bd6a-6a5b05204038@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@intel.com>
In-Reply-To: <f16c1102-08a4-4f95-bd6a-6a5b05204038@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MI1P293CA0029.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:3::15) To IA1PR11MB6539.namprd11.prod.outlook.com
 (2603:10b6:208:3a1::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6541:EE_|IA1PR11MB6267:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c28cd68-2c29-47dd-88a1-08dc95ebc79f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230038|366014|376012|1800799022;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NWI1UVdRTzF3Y3RDNmR2elJCWWFmUklRWWtUS3BuUGI4U1hPNS9ORnF0Um1U?=
 =?utf-8?B?b2tNM2w1THE1V29MTmIxQ3hZYURUYXFYZ0VEVDV2QlVSTlBPc05acVhIazJn?=
 =?utf-8?B?UmVwR1VWWkdIcTRBd3pMNklVL1JyTEowRTFZeEgrZ1NXZnJjNTRoSGlsSm80?=
 =?utf-8?B?K3pURXQ2REl6L1VmTityRXNkNThjeWhxNWVFMTBRenpndGF6T0lzZmtNVVB2?=
 =?utf-8?B?a1E0WVJ2aEdBck9XUnlkQnVEMDhxSU03eTFucU1UeEZNTEdYN2x6dXl3Vm5r?=
 =?utf-8?B?VXM5Qml3T252Y2IrVlhJZFg2TVNsamJQMXAxRThEcGlhM2J4Ym1VakxGVDky?=
 =?utf-8?B?Wm94cU1uVDhFQk9mdHBxRWdBcVlUZDduVlFhNk5Ib1RBQjAxejFHWjdLMHhl?=
 =?utf-8?B?U1V4QkZDOVQ0NG4rR1lWblhBTzBURGQ2ZzNvQXFTL2VQYzRoQSszaXpabWF3?=
 =?utf-8?B?YVNScFlYSU5mOWlKYkJXRlBWb3ZaRXRrYW1xTVFwMXpLdXlCNGlLVHBOWFJw?=
 =?utf-8?B?bS9qM0dDWmpVZ2x1d2N1QzE1cUF5ekpXUnU1Y29ERm51Y1J4MGVwZFdoSitj?=
 =?utf-8?B?OUZieVd2TWhvdW8vd2VIeEVQblNUbnd2SVZlMGVEZmNyYWhGSnkyN1kwc01V?=
 =?utf-8?B?M3V4VUtGemRWektQR0hlVTVxQ21ETFI5NWYrZkFXV0R5ckttaWp5UjhxQVlB?=
 =?utf-8?B?RFV1V1dSVExTazBGVUpCOVdCQUZrSitUMHlRZ05vRFBUYm5Wb0pZVlA1Sytr?=
 =?utf-8?B?RWdBS0FSSGJ3TklDU2c5Z0FoZnlTNVh4eERVLzhKM1VERXlDY3U2MVh2RTBY?=
 =?utf-8?B?Z1V5dm1aaFlzS3F6RHhhYmtWbkJYWnBZQXAxSDBaZ1UwWmVoeDg3TFVxNzZE?=
 =?utf-8?B?bFVpU05qaVlmVkUzdkE5VkdMSEJ2UFR4b3V2WW13Mjd0MWRXcTBFR2tudW1p?=
 =?utf-8?B?eUttaGcyUEozVTRuQkhRZlR0SEw1TURyR3JuMWNtRXVtcWJIOEgzU0Y2T2la?=
 =?utf-8?B?MVlGNEVVVDJsQVV6akxNR2UwUHdKZGtKR3pCWHlQZEsvd05jNXZOYUpGNEZu?=
 =?utf-8?B?K2xJM05vT01ucHlkTWdXZnViSkF2dENtcEoyMGlLeEVVVkk3MWEyZ0dtSC9z?=
 =?utf-8?B?amMwdS9MZFV3Rjc3SGhaZmtVeThRZ2dXck96QVFvL1ovQ3hXUnYvQTFLV2FT?=
 =?utf-8?B?bUE0emYzcEJ5UHNnQ1BCRFlFN3E1N01zcU13bnB0TXYvUytlUWExVEJMK204?=
 =?utf-8?B?dzVTMlJmSHBlVVh2bENONXhjcGlZVjNJY1VJbVFTWXNpZ1VkdjRNc2VicXBW?=
 =?utf-8?B?SnhXdXpray9BZVhlNWh4aUFuL3hxamZRemd1NVhES2JwbjNUSGpENVN6ZnhP?=
 =?utf-8?B?ZmtLUWppa3FNYUNvakhrZml4eVdGV2poSHhoSy9XS3ROT29MMmord2lpalFr?=
 =?utf-8?B?R09PcWhQcG5ubzRJa2ozM2VySnk0MFFsdUNCc2VkUE04d2gyaTl4TTFoZllY?=
 =?utf-8?B?VnlPd3czWU9pMDFpNVdOdGhUeHhMSnNjQ2Q1RXhPdldPaXpQcHBFQzAyTlJG?=
 =?utf-8?B?L28wYnZyUGtTQkZMT2VJTm5ERHF1MUppY0t0ZGY0K1dIa3VDMjVEQnQ1UmZT?=
 =?utf-8?B?SmJoSk13emtiOG9FeTh1bFJFMjZNU28yR0dtS3hUcDQ1cWtMZnBKS2Mydnlk?=
 =?utf-8?Q?NfJl+UyL0ZwkjolgESpH?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6541.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230038)(366014)(376012)(1800799022); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b3NUWWdqTFBOQXJkTzB4M0V6N3RvZysydktFdzFGVkdOOW01Qjc5NUF2SjB2?=
 =?utf-8?B?U3dmQ3MyNHF0RDZzc21qS0FYNW12RmI1bE5Kd3JJTU9GYitucC9ScHRIUW1O?=
 =?utf-8?B?YjlrTUdyc04zN3JqNVR6M0x0V0UrRjdRS3ZPVjdCVVUwTkxxRGhCNllKWkx5?=
 =?utf-8?B?MWxDM0RtaDU2NzRiZ05qZlErNHJEVUltT2czTDF3OTR1blBKaElCUm5URjRQ?=
 =?utf-8?B?VUdpNkdzcDByWVljSjNnWkg4T0c5bWE1RHVocHZPR0ZZRTdSUmdsWkQzay9J?=
 =?utf-8?B?S1pSLzRLZ1MzM1h1ZDRjY0t3emo1T0ppVit6UDkzWVk3V0NDSjNKUVpzME5G?=
 =?utf-8?B?SmxuUWE1V281NWJ3WWVpcXRITU1ybFVUT21rcmxEUEF3TEJXQ2Z1NWxRdXNu?=
 =?utf-8?B?MGVoNFkrL2lFbFNnWWM2bTNmOHdvTU5HWEVIRnp1MnRUTXpvL2QwUEZaS2tK?=
 =?utf-8?B?TmJxbFhwQnpVOFVrT1BXenRaRXpnMVVJQ3ZZVmsrc2hOQjI3dEcyYWZ1QW9C?=
 =?utf-8?B?Rm1wSk9ZeXNMcUVHVzNsKzVsc3pLS2lGMTMraG42bWVpdlBjQ0ZUb0c1RFcy?=
 =?utf-8?B?aWdGQUJWR1R4MDVNZVIzczJMZFNFcTAvQUFCeUJDa1NBMzZuczloWHNtWDVp?=
 =?utf-8?B?OFRnSEhaL29pYjQydVZJSFowVFcrbmd5MXZHUlJnWVNtOXg5WW15UlliU2FW?=
 =?utf-8?B?MWNMUW1YbGdnMGVNdkZ1NTZGRTFmc0s0bUwvQUJMbGo3Wnl6Q0VML3FZR3Qy?=
 =?utf-8?B?VmlobzArbkJjVzR2NzJQQ1N3S0owRmN1NDQreDVhT0NTUjBOUWRwQThZeUor?=
 =?utf-8?B?VG1zT0ZGcFhXeTEyOFhTRmVzSXM5N3NRdXZxMnNmTHZ0Z0NELzg1YXBZYnZF?=
 =?utf-8?B?Z3F4VHdlMllXQnpWc0tiLzUwR3Bwc053TTZFNGcvUEFxSTZvbyt4bHN2QTZi?=
 =?utf-8?B?cTJjK2tTVFhodjJlV0JZMUxISzZnRjlHOHZ4K21ZN29SdmFwcklUMHE1R0Qx?=
 =?utf-8?B?VE90R3FzaUN5TUpHNE1UUUc5OTlMczdUbWR5MEI1ZUgrNkFsTHQ3RWpsYzFC?=
 =?utf-8?B?ZkwzSnFOYkMzY1RBVGhiVm5GRnVIY0FvRWdta3BSV1ZEY2xBVXZtUytvQVMr?=
 =?utf-8?B?RjJTT2lkV1JGeUE4UEs1SzBxM0pnRzRkS2ZIS3pTS09BRDJZN1ZZNEpmd1RX?=
 =?utf-8?B?dEEwZ0lEWk9xL1hHeGs4c0xyMys1RTVNVEozd3A5QkQ0cko0RVBPRjFYOXRs?=
 =?utf-8?B?UnlveS9GSFZRRithM0ZLWmszOVd4OUpsQ0k0L0d0MUZkRmhnd3VwVWJjN25C?=
 =?utf-8?B?ZEQ2T2d2SzFiUThZbXN4Um5rQ090MG9oK3ZESzNxeUZzK3RkS3pYc2RqcTha?=
 =?utf-8?B?eEl6clhpSE9neS9YbUZGVkhWVmtXQ0RNWmRHbytSZTlMbXF0K3NZUVRybUUw?=
 =?utf-8?B?ZDkwNVVCcEMzMjJBYlp2ZWNlTDRoZXBiK0R4VFI3cXZoZUhHN1lGS2xjREo3?=
 =?utf-8?B?MTkwUmY0d04wQWFla05KbC92TElVZGdMSXNtSHZHbWRjNTY0eHg0Yll2eTRK?=
 =?utf-8?B?YnRvRTc1NmdMbVNjUTdHTE0zM2xjb1VtRitqMDlsYTNyYk1JQ3lCazF4R0dh?=
 =?utf-8?B?aGZPNURQeW9na3FIT1FyanlYTE04eWE4WUxiV2VlQWJ2cWFKUEhLUXRrSWZN?=
 =?utf-8?B?b2txSGtXZEJrdXEvRlZJRjRzSmw3VTVVdlltQ2N2eGRsVDRqbFc5Znk2bGx0?=
 =?utf-8?B?RWJsdkRrVXc1eTNCeS96ano4RVRSMGNOc2RmaVdCRmdTNGFHRVkyS2pMVFBS?=
 =?utf-8?B?akZxSjQwYXljRlVjaFhFMU1yZG9CVkRYbFRYM1hYTWlFTDJDbnJuOUZJWFFX?=
 =?utf-8?B?eFJpeW5FY3VrRkUvNzdPNi9GajdOU3pjMVhKTnp2VmZCKytlckM4V3BEZE1p?=
 =?utf-8?B?enZESlhVRlFBbCtReElHOHRZQnBabEttOTMzalkzUUd2SUt5OTdmSE9tZGxC?=
 =?utf-8?B?UWxBMmJlNW9MSEVIbCtWdGV4c0Q1MzBTb0J5N1RBVXZjUS9GNE42MXNZUkhR?=
 =?utf-8?B?cnRwdEFVMHlNcXZiclUweWozektGcmpVSjZVbVNsQS9nZ0ZkM2p1SVEybEJ0?=
 =?utf-8?Q?oBYfn1tJnfvYsxz4Ore22HJxb?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c28cd68-2c29-47dd-88a1-08dc95ebc79f
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6539.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2024 14:25:08.9626 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T/KozglCMs8duZ5vj0RoTU/YozhHLKNqGLrb6lGhhlO9ReRxFOl7gpTO0KMYs4gUmxRMlhfysTp3sC4TGtGNRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6267
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

Hi Michal,

On 6/26/2024 4:17 PM, Michal Wajdeczko wrote:
>
> On 26.06.2024 15:42, Nirmoy Das wrote:
>> GuC TLB invalidation depends on GuC to process the request from the CT
>> queue and then the real time to invalidate TLB. Add a function to return
>> overestimated possible time a TLB inval H2G might take which can be used
>> as timeout value for TLB invalidation wait time.
>>
>> v2: Address reviews from Michal.
>>
>> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1622
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Suggested-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c |  7 ++++++-
>>   drivers/gpu/drm/xe/xe_guc_ct.c              | 13 +++++++++++++
>>   drivers/gpu/drm/xe/xe_guc_ct.h              |  2 ++
>>   3 files changed, 21 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
>> index e1f1ccb01143..6fc85f711074 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
>> @@ -17,7 +17,12 @@
>>   #include "xe_trace.h"
>>   #include "regs/xe_guc_regs.h"
>>   
>> -#define TLB_TIMEOUT	(HZ / 4)
>> +/**
>> + * TLB inval depends on pending commands in the CT queue and then the real
>> + * invalidation time. Double up the time to process full CT queue
>> + * just to be on the safe side.
>> + */
>> +#define TLB_TIMEOUT	(xe_ct_full_queue_proc_time_jiffies() * 2)
> I'm still not sold on keeping this as a macro, even at the one time cost
> of slightly bigger diff.
>
> static long tlb_timeout_jiffies(struct xe_gt *gt)
> {
> 	/* this reflects what HW/GuC needs to process TLB inv request */
> 	const long HW_TLB_TIMEOUT = HZ / 4;
>
> 	/* this estimates actual delay caused by the CTB transport */
> 	long delay = xe_guc_ct_queue_proc_time_jiffies(ct);
>
> 	return HW_TLB_TIMEOUT + 2 * delay;
> }
Looks better, I will incorporate it.
>
>>   
>>   static void xe_gt_tlb_fence_timeout(struct work_struct *work)
>>   {
>> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
>> index 873d1bcbedd7..0cdf0d4d20e5 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
>> @@ -112,6 +112,19 @@ ct_to_xe(struct xe_guc_ct *ct)
>>   #define CTB_G2H_BUFFER_SIZE	(4 * CTB_H2G_BUFFER_SIZE)
>>   #define G2H_ROOM_BUFFER_SIZE	(CTB_G2H_BUFFER_SIZE / 4)
>>   
>> +/**
>> + * xe_ct_full_queue_proc_time_jiffies - Return maximum time to process a full CT command queue
>> + *
>> + * Observation is that A 4KB buffer full of commands takes a little over a second to process.
> s/A 4KB/a 4 KiB
>
>> + * Use that to calculate maximum time to process a full CT command queue.
>> + *
>> + * Return: Maximum time to process the full CT queue in jiffies.
>> + */
> while code can be long as 100, we usually wrap comments at 80 column
>
>> +long xe_ct_full_queue_proc_time_jiffies(void)
> this should have xe_guc_ct_ prefix to match component
>
> and likely take a ct pointer as then we could return better estimate of
> the delay in CTB transport based on actual number of requests in flight,
> or to provide any tweaks based on platform and/or SR-IOV mode (as
> requests from the VFs might be processed at lower rate that your initial
> observations, and in PF mode some operations could be quite heavy)

Makes sense, I will resend with the function taking ct as argument for 
future optimizations.


Thanks a lot for reviewing it,

Nirmoy

>
>> +{
>> +	return (CTB_H2G_BUFFER_SIZE * HZ) / SZ_4K;
>> +}
>> +
>>   static size_t guc_ct_size(void)
>>   {
>>   	return 2 * CTB_DESC_SIZE + CTB_H2G_BUFFER_SIZE +
>> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
>> index 105bb8e99a8d..57280f82dc35 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_ct.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_ct.h
>> @@ -64,4 +64,6 @@ xe_guc_ct_send_block_no_fail(struct xe_guc_ct *ct, const u32 *action, u32 len)
>>   	return xe_guc_ct_send_recv_no_fail(ct, action, len, NULL);
>>   }
>>   
>> +long xe_ct_full_queue_proc_time_jiffies(void);
>> +
>>   #endif
