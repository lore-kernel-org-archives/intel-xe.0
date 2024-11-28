Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20EC7D69114
	for <intel-xe@archiver.kernel.org>; Thu, 28 Nov 2024 15:07:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE18610E081;
	Thu, 28 Nov 2024 15:07:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EB8obUt6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DF0010E081
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Nov 2024 15:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732806461; x=1764342461;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=vtk9rrrGNKLVWUN3UjT4jtHQQg4/BSHY92sRH6VzeYA=;
 b=EB8obUt6584o3EcAhsVcydxErgY3gbhJutX880wQWp2SZKIfh5jdLXtq
 /zsRa9Bw3JkKeLm1wgSWx/RRL+SKdyiTSoW6Sg8vtopohBe1CSSTDHURt
 xqLJdP1SlUp4bhz9J4PytHR3UGxJhGLyojlsEwmS4RwIzLUjbGZqXJiIV
 qE1cSBLGkH3qGOnRXZGAI60kN83mLHNVHGGIJ9OKDALY2/hgTkGQ2KSjN
 1u38I41wXXXZKpGDrVEFR8E8/8089aPzct4kgudYLULbDXlWMu/wQMU6k
 W3mYToM3fTc/SPuGDKEVu1k18Q9IoEvYyyYkNwdR6boHrGriA/e/JknWL w==;
X-CSE-ConnectionGUID: 8QcrZKtdRLOQX3esqGGztg==
X-CSE-MsgGUID: Om/m2kaKSeuxIEmthWZmvg==
X-IronPort-AV: E=McAfee;i="6700,10204,11270"; a="44419385"
X-IronPort-AV: E=Sophos;i="6.12,192,1728975600"; d="scan'208,217";a="44419385"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2024 07:07:41 -0800
X-CSE-ConnectionGUID: dR8B5EypRqCJp9QlCiHFkw==
X-CSE-MsgGUID: 7wpnPDatTkOvmtPap6u1tA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,192,1728975600"; d="scan'208,217";a="92128803"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Nov 2024 07:07:40 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 28 Nov 2024 07:07:40 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 28 Nov 2024 07:07:40 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 28 Nov 2024 07:07:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bl9Aak8KKEyEOVr9iAX3AI77IQ7RKRzjXVHWcwHdJgGvmRUOfYlLmO2ISfl9uQ4T8kPZDUGDgBpnFH9oH4Nf/H2+85CnxolW6JxtWPEgxaFy/xfy5PR+kIrCaQ2pq6DHB0D1kHBdTXeDKOurNM+hIlDkqEItF6gSnXMDtHe6qtZu7vQ1tKEwBPu0UMvSuOppd/A2jzGKTDAGAHTTaOPUJGds/yPzYoBIg1Kmhr1jRtsPQ6e132/ImvfwdqbRxvTfdi+Ntlh7gBSTw2m8pd051uedrkMpk9oMRHhTFPGvaCPECh/KH+tEga537d+06AEj/60aQvHfIuElmgfGXxQAkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jVobNpnmd1frrvtxYmWj9CIFqkMQKqqfOTD+dXtPEBY=;
 b=B6Eg2HeTkgFtgarbG0ZyiBpvf0VOxX+Yw6NMVuD8jS9h2F5CJ/LdECq0rMPP9v61zXVNOmVM52UkdbzxzmHw77EB9dneBC/JaX2xsrH51KjV7gy/XGkaH4Vgog1UKW6fxuiLbOSa1pnLAUHSVUSEauHDEZLsBcI+IwNpBGTBbiN7jgTHWJzaIEL8Yfn/F5oZ4DmJmPqb7gl9ox/CkwKIlofktPmRDXc6eIwJJuCKDoA8TW+MHS8bFozmv50IndATgxpSmevRfX6ZNPXxcbdoRRI8hM0+DK9rXPcK/QtcXMiy70HeVKMCWQlAE9wz0/ZUz8K3AvehncjjIj+50hj/eA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB7014.namprd11.prod.outlook.com (2603:10b6:806:2b9::15)
 by PH7PR11MB8552.namprd11.prod.outlook.com (2603:10b6:510:2fe::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.21; Thu, 28 Nov
 2024 15:07:34 +0000
Received: from SA1PR11MB7014.namprd11.prod.outlook.com
 ([fe80::e707:2d60:2891:a02]) by SA1PR11MB7014.namprd11.prod.outlook.com
 ([fe80::e707:2d60:2891:a02%7]) with mapi id 15.20.8182.019; Thu, 28 Nov 2024
 15:07:32 +0000
Content-Type: multipart/alternative;
 boundary="------------RqavkHVoc0Rni8jV1dkMWxPC"
Message-ID: <48022468-da85-4c5d-8f9e-e2d9662d321e@intel.com>
Date: Thu, 28 Nov 2024 17:07:27 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] drm/xe: Initial MSI-X support for HW engines
To: =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <niranjana.vishwanathapura@intel.com>,
 <koby.elbaz@intel.com>, <yaron.avizrat@intel.com>
References: <20241110203915.729-1-ilia.levi@intel.com>
 <20241110203915.729-2-ilia.levi@intel.com>
 <20241127082408.cf3lqksj4j6jusgp@intel.com>
Content-Language: en-US
From: "Levi, Ilia" <ilia.levi@intel.com>
In-Reply-To: <20241127082408.cf3lqksj4j6jusgp@intel.com>
X-ClientProxiedBy: TLZP290CA0002.ISRP290.PROD.OUTLOOK.COM (2603:1096:950:9::8)
 To SA1PR11MB7014.namprd11.prod.outlook.com
 (2603:10b6:806:2b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB7014:EE_|PH7PR11MB8552:EE_
X-MS-Office365-Filtering-Correlation-Id: c76e6bd4-6e8f-4dc5-b3f1-08dd0fbe61f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WXRLUytlRVRHaUx2TEc0MWxtNVIwYU9EYlF3UnEralpKczVHNk16MEhqNlRO?=
 =?utf-8?B?Z2gyNklHK1IzdUtKRjRKWHFEZXN4alFvaWZORDdZTS8xNEN3Wk1ySWJ4dzZQ?=
 =?utf-8?B?Q01JYTBEWC95WExSenBObklnWklmUVpmekYvQmh0KzdKN3d2bysxeXFBcmFL?=
 =?utf-8?B?YTJ2UjJSMlUrNytudmRDdlhTaW0vend1azNrR3U4djh2K2VBMFNzUWxKR3hK?=
 =?utf-8?B?WXRnNWM0UnN5dFhRcE5ITjZLV2lHcGdVVVNzQm1CTnVDbTNuM3QwYm5qNlhx?=
 =?utf-8?B?bG00M2YwekI0NUh2Q3VtUk1zMTgzNmV2U2ZESmV4dUlsS29LR1U3Yk5rdDZR?=
 =?utf-8?B?YVlQT0p6Tkc4Z3AwWmRiVVVKb0JiRFpVNXVMYmFKLzlSSVJHMXVlODVSNTFU?=
 =?utf-8?B?NUxGZ0swbHhTR0Flc21lVXdJWU01Zy9nd3QrRHdLVFkzbkRiUjNZcUxlcG1H?=
 =?utf-8?B?bjhYN1lRS1FSNUYyN1UvZlNOMW9HYU94dlRGaFRxVzBWZm5HUkJIZHVscnNx?=
 =?utf-8?B?N0tDdE5ZYzBQYWd4ZjRiVnJxRnlsWnZmc1JGblZGWXNvVVJ2R3grWUFOMWx0?=
 =?utf-8?B?TW4rb0F6aGRGTkZDV29tVHk0My9uYnVuK1p0RU8zaHRhQXZCL1VqdzhWaHZ4?=
 =?utf-8?B?cjZVQUx5cUpuZ0NRRGNLZTJZOGVZZTIxeC9xV1N3azVXcjNubzZYL0lNWm0y?=
 =?utf-8?B?VDEzUTF0M3NTMHBCa3U1R2hMZ1dwN2I2cGFIYnZuSGJkMkRiMXlzQUgvd2JM?=
 =?utf-8?B?My9jVit4N2djTFM5LzV5RXppRG1OeC9EYmtWM05GYTB6YjIvMlFOcGo0QVFI?=
 =?utf-8?B?OEVmamhoOFlXeDBHSTB1NXpoTGI3dUhjT2Y0eXBlNy9CNk5rZmNvTDhIRDQw?=
 =?utf-8?B?YStlblFNczNrRis4NmFvUyswbTNHZXVLWVBYRUhHODFMeDgyWElUTzBFbk5E?=
 =?utf-8?B?OUdpYWxyY0hoK1JWU0hTSXVoU25oQ1A2RExqZFZKNjdvWldFeEIreVJhWkVr?=
 =?utf-8?B?NEdMclE2OUlZN29QMzA5OFpXMlZLeE5OY3Awd1dqOVd3TXMvN29IYjhwNlZK?=
 =?utf-8?B?bTFJTXQ5dm80VnRzZmp2cG1CNEIyME0wSkVBSnRmQktyZEJYZlNCdUNZQXdl?=
 =?utf-8?B?OTVFaXE3ZzZVbFlxdEdmRHR3cHFuOXR2ZTRSSk9oV3owWlJ6Z2MxWDBMeURQ?=
 =?utf-8?B?MEJNalRuTWVRb2R6aGRPWno4V2tCQzRaWHRtREkxRFNIQUFxaURHZkx3N3Zr?=
 =?utf-8?B?YUc5Ym1pdEFrNWpEQ25KWDlZQmx1Vm95Zzk1MFJBZjZrR29GSjRyNlcwSzV3?=
 =?utf-8?B?dXVHSExCNCtQNDlodHcxRlRRRHEwcXBqaGRxVFBhSUs1UXBQMEtQTjJoUjB4?=
 =?utf-8?B?ZjdXWE1peGpwNkRkZ2VoQTl1dHhkL1JkZVBSb3d0ZGQ3TzVwdjYxTlJwNldB?=
 =?utf-8?B?eUVwdnkxSjljOXEwNzNjMGY2eTMreGZ0bXd1WFQrZ3lFd2ZCbjF2ck8yTDRy?=
 =?utf-8?B?VXdROEVkc3VBSEtSZWZ5NUtucS9rN3QyVWRkbnlOalVuWHYyTWtkNEErQU51?=
 =?utf-8?B?dEQ1Q3MxSHY1NU9sM09INW14TWJ2bmpUeURFajc1Q01lcnRLVDlZUE5mMS83?=
 =?utf-8?B?YVdqZGtSUy9WakdFNU1WVEtGV3lNeTNBd3NicUYvUGNUV1Z6aDY1S05WcnZH?=
 =?utf-8?B?SC84VklRQTlwdUNLbWVXbU1oMjhNQThXUXh4ZVU1dHpyRTk1YUEwSmV2dEtL?=
 =?utf-8?Q?RGJT0s09+kd4ag2b1o=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB7014.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b1o0QTluUER0MXU3dmNhVDBDUElLOEpTVjZCSGhjVmhHVnpTVDkwUzNZLy9F?=
 =?utf-8?B?Zk5PQWxLdE43SGw3UDJPZmhab1F6d1M5WEp2T3lxc21YY3FDT0FPU3V5dmxv?=
 =?utf-8?B?M0FaWC9LdWRtQVBPcVh3ZnBUOUdMMXR6SnNMd016ajFUSFlzSzQ5VkozT0ZN?=
 =?utf-8?B?WmNaa3lnR2o0cWREVzl1cFZyT25qZ2lSYVRWcmcyRDcydU1DbWRBZUZpZWpK?=
 =?utf-8?B?WWlIQ1BZdkVNeDJabHRnUFZHQjR6VW91T0N1K3p3NjZaVUtSUGFCbWlkOGNH?=
 =?utf-8?B?em9mVmlJUktIUW1yTkVUcll4L0dXcEQxSC9selhydmNxZGxCS2Y5WVdzeDRi?=
 =?utf-8?B?bzNpN1JBSWhYd3B2NW1LaW1QWU9qTzRoc1RvMGc2Ky9JSlBZQUJaMEMvQlhn?=
 =?utf-8?B?Y2V6K2g0ZUduVTJzdWg3cjdhc2x3bHBZcllKMVFxZEF5K2tMWGE1d3Y4TE1O?=
 =?utf-8?B?OFVJbERUNlBidm1YNjc4UklIYmJtUzlaUzFRSnB5d3d2SzdSckVRMzhLY25v?=
 =?utf-8?B?UTkxN0lHQTh0S2o3UTBKdnN3d0ZMeVZEWms4V0dQampSRGpUeEdPbWNVQTA1?=
 =?utf-8?B?cE1nQllOV2JMa3Fna3J5UVZuWElGMEpvbjJyckpvNk5aTEdKVFlpYXF5eVFJ?=
 =?utf-8?B?ZSt3ekNUSktCaW1DYkw5RTJZUDlOSkpLMThRTXh3b0pvWFQ4Zml1MXlySXdH?=
 =?utf-8?B?NTFBbVlDNWRrSFQ2YzVtay9ROUlia3oxRlE1V0Q1bko3THJjR2ZuZVdQSnNJ?=
 =?utf-8?B?QXcxcGNYTjIxYWlZR3J6WTAxenIvVlVWVFZrekoyQ2s4bSszVjFFOW5hN2Jw?=
 =?utf-8?B?dlVBS1Q2ZVBIaFJuMHlBZllqNHNob3BrQ1YxMmpxSWs1Z1JSMG1LUHlNSjVP?=
 =?utf-8?B?b1dpZnB2ZUNrTUt2elhydlF6SjRWRjRKK3dTeGJpNmxNS0lReGEyVmYzQkJB?=
 =?utf-8?B?MjB5TnZodVJadzVMc1FFVlpWRXJybFVFR0l5ZG9hME53YkpSaTR1RmhWRGpI?=
 =?utf-8?B?OHlKVEw2UEQ5RWJsT1dtYzJCdDlha0FjRS9DS3k4b2VEaEE1NzVMY3F5aXow?=
 =?utf-8?B?WEpkRlhVM2wrcWpVTHg4N1lCdHc5WHpLRytVZC83TlJwc3RMRGZDMlNRdDdi?=
 =?utf-8?B?WU1YNlA5K3p5RTR6K21NVlVWN2R5dzdPZVQrMVFWWDd6T1lMcXA3NGlDajJk?=
 =?utf-8?B?TzBOVVJSVmtjQ1dDZ0VPL0pDSDJhTzFuckx6YVprUWlQOTZwNmJWWkVvSTlk?=
 =?utf-8?B?QlRxRU4vY3d1OEZqLy9pdEd2UWJCUWRoaDMwdlFvR2JLc21ZMlRUNEswQ1RU?=
 =?utf-8?B?eXh6S2w0MzR6Vmh6ZExTV1dTL1VkMEJKVkxtSDl2OHFXWVRlaXl4QTQwUE9u?=
 =?utf-8?B?dktpSFVwdDFQWjg4N0dNZkhRTnRpcUdlVkFoZDhTMnJ1Y0FWaUZPVDhaajZv?=
 =?utf-8?B?L2Q4S2QrcDdTQmlBNkNGMk91MFdNMGdKVjA2cU4yVnpUc0lsT3ZncjJVSU16?=
 =?utf-8?B?THpXRjluT0hjcE5sNnplTmpXekxrZjJqQ21kc0tNRWhQejZSQU5Db1AxaExE?=
 =?utf-8?B?VE04ZmNCS3NKUmMrSTFlRFdiekFvTk9ORXNpWU45YVVQN0VJMlpqT2NQbjBr?=
 =?utf-8?B?WUdXNEIybFdHaUtpc2RUbFM1MGRzZ0s0M2VuYUtFbkJGUmtERkFuUGZXWklT?=
 =?utf-8?B?bFpmMExVaGR4TVNjZmdoMnFXd2xKU1psQmFoMisvSmthdVE0OHZueTFmZG9h?=
 =?utf-8?B?azQrM0NrdUdjQkxkZE5PY2RPdjcwRW5tYWlSMlpOdnlGM2Q5ek0zcGJVVTdm?=
 =?utf-8?B?R1RQZFZaZ2ROTlZaR2dTR3FrK0tLS0pFTFgvaENqYVl3M21CRmVyN0NFeU1r?=
 =?utf-8?B?VEdFajBIRk9XczVQT1poeUY2UDJMVkZ4Sk5CZWhieGNQdzFMRGdmSjFZeUh5?=
 =?utf-8?B?MnR5b3NmUnZxMHhFTnlQVmkxWGFYQlk1S3NVTnRZVHRjWlg4RXFLNnFjU0dI?=
 =?utf-8?B?UWNaYlN1UHh6Z1prUTZFaDc4dmY1RlRGc1I4enByU1NRZlFjRWJYYWhZanli?=
 =?utf-8?B?OWlUNkhKV000cUtpc0tJTEpncDNRQWx3MGFiRlRjYklZcnNMWXBSVTJ2bmF4?=
 =?utf-8?Q?usDNsHNWU9IcXUBayftzSvdOI?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c76e6bd4-6e8f-4dc5-b3f1-08dd0fbe61f7
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB7014.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2024 15:07:32.5415 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6Ih1WKDKfRFesRjXsmFyYPc+pL/1Cem+fQ1yTtNX9y58hB8ks6tjDBdY3GLgBOSRyK3pBPONJ/+1+kNpxfzM0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8552
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

--------------RqavkHVoc0Rni8jV1dkMWxPC
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On 27/11/2024 10:24, Piotr Piórkowski wrote:
> Ilia Levi <ilia.levi@intel.com> wrote on nie [2024-lis-10 22:39:13 +0200]:
>> A new flow is added for devices that support MSI-X:
>> - MSI-X vector 0 is used for GuC-to-host interrupt
>> - MSI-X vector 1 (aka default MSI-X) is used for HW engines
>> - Configure the HW engines to work with MSI-X
>> - Program the LRC to use memirq infra (similar to VF)
>> - CS_INT_VEC field added to the LRC
>>
> IMO you should split this patch into two separate patches:
> the general configuration (init) of MSI-X and the addition of MSI-X support for HW engines

Ack. For some reason patchwork created a new series:
https://patchwork.freedesktop.org/series/141880/

>> Bspec: 60342, 72547
>>
>> Signed-off-by: Ilia Levi <ilia.levi@intel.com>
>> ---
>>  drivers/gpu/drm/xe/Makefile              |   1 +
>>  drivers/gpu/drm/xe/regs/xe_engine_regs.h |   3 +
>>  drivers/gpu/drm/xe/regs/xe_lrc_layout.h  |   3 +
>>  drivers/gpu/drm/xe/xe_device.c           |   4 +
>>  drivers/gpu/drm/xe/xe_device.h           |   3 +-
>>  drivers/gpu/drm/xe/xe_device_types.h     |  10 ++
>>  drivers/gpu/drm/xe/xe_exec_queue.c       |   3 +-
>>  drivers/gpu/drm/xe/xe_exec_queue_types.h |   2 +
>>  drivers/gpu/drm/xe/xe_execlist.c         |   9 +-
>>  drivers/gpu/drm/xe/xe_hw_engine.c        |   7 +-
>>  drivers/gpu/drm/xe/xe_irq.c              | 116 ++++++++++++++------
>>  drivers/gpu/drm/xe/xe_irq.h              |   1 +
>>  drivers/gpu/drm/xe/xe_irq_msix.c         | 134 +++++++++++++++++++++++
>>  drivers/gpu/drm/xe/xe_irq_msix.h         |  16 +++
>>  drivers/gpu/drm/xe/xe_lrc.c              |  24 +++-
>>  drivers/gpu/drm/xe/xe_lrc.h              |   2 +-
>>  16 files changed, 293 insertions(+), 45 deletions(-)
>>  create mode 100644 drivers/gpu/drm/xe/xe_irq_msix.c
>>  create mode 100644 drivers/gpu/drm/xe/xe_irq_msix.h
>>
>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>> index a93e6fcc0ad9..2f1e1f17b677 100644
>> --- a/drivers/gpu/drm/xe/Makefile
>> +++ b/drivers/gpu/drm/xe/Makefile
>> @@ -72,6 +72,7 @@ xe-y += xe_bb.o \
>>  	xe_hw_fence.o \
>>  	xe_huc.o \
>>  	xe_irq.o \
>> +	xe_irq_msix.o \
> I have my doubts that we need a separate file for MSI-X.
> We already have xe_irq.c, and there is not much code for MSI-X.
>
> I think of it this way: if we need a separate file for MSI-X then why not have a separate one
> for MSI. And if xe_irq.c is for MSI then why don't we call it xe_irq_msi.c. But then what about
> the common functions which are used by MSI and MSI-X.
> And after such reasoning, I conclude that it would be just as well if the msi-x functions
> were in the xe_irq.c file.
Makes sense, we can always separate later if it grows too cumbersome.
>>  	xe_lrc.o \
>>  	xe_migrate.o \
>>  	xe_mmio.o \
>> diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
>> index 7c78496e6213..d86219dedde2 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
>> @@ -83,6 +83,8 @@
>>  #define RING_IMR(base)				XE_REG((base) + 0xa8)
>>  #define RING_INT_STATUS_RPT_PTR(base)		XE_REG((base) + 0xac)
>>  
>> +#define CS_INT_VEC(base)			XE_REG((base) + 0x1b8)
>> +
>>  #define RING_EIR(base)				XE_REG((base) + 0xb0)
>>  #define RING_EMR(base)				XE_REG((base) + 0xb4)
>>  #define RING_ESR(base)				XE_REG((base) + 0xb8)
>> @@ -138,6 +140,7 @@
>>  
>>  #define RING_MODE(base)				XE_REG((base) + 0x29c)
>>  #define   GFX_DISABLE_LEGACY_MODE		REG_BIT(3)
>> +#define   GFX_MSIX_INTERRUPT_ENABLE		REG_BIT(13)
>>  
>>  #define RING_TIMESTAMP(base)			XE_REG((base) + 0x358)
>>  
>> diff --git a/drivers/gpu/drm/xe/regs/xe_lrc_layout.h b/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
>> index 045dfd09db99..57944f90bbf6 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
>> @@ -25,6 +25,9 @@
>>  #define CTX_INT_SRC_REPORT_REG		(CTX_LRI_INT_REPORT_PTR + 3)
>>  #define CTX_INT_SRC_REPORT_PTR		(CTX_LRI_INT_REPORT_PTR + 4)
>>  
>> +#define CTX_CS_INT_VEC_REG		0x5a
>> +#define CTX_CS_INT_VEC_DATA		(CTX_CS_INT_VEC_REG + 1)
>> +
>>  #define INDIRECT_CTX_RING_HEAD		(0x02 + 1)
>>  #define INDIRECT_CTX_RING_TAIL		(0x04 + 1)
>>  #define INDIRECT_CTX_RING_START		(0x06 + 1)
>> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>> index 0e2dd691bdae..eff7e51198d9 100644
>> --- a/drivers/gpu/drm/xe/xe_device.c
>> +++ b/drivers/gpu/drm/xe/xe_device.c
>> @@ -660,6 +660,10 @@ int xe_device_probe(struct xe_device *xe)
>>  		xe_gt_mmio_init(gt);
>>  	}
>>  
>> +	err = xe_irq_init(xe);
>> +	if (err)
>> +		return err;
>> +
>>  	for_each_tile(tile, xe, id) {
>>  		if (IS_SRIOV_VF(xe)) {
>>  			xe_guc_comm_init_early(&tile->primary_gt->uc.guc);
>> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
>> index f1fbfe916867..812f24a34e6b 100644
>> --- a/drivers/gpu/drm/xe/xe_device.h
>> +++ b/drivers/gpu/drm/xe/xe_device.h
>> @@ -157,8 +157,7 @@ static inline bool xe_device_has_sriov(struct xe_device *xe)
>>  
> I have a problem with this name. In my opinion, the functions named xe_device_has_*
> let us know if the device has any specific capability.
> Mostly this is based on infromation of the gen number, or an attribute
> from intel_device_info.
> In the case of MSI-X, such information is provided to us from PCI subsystem.
> I think I understand why you used here a flag that you set yourself, but with a function named
> like this, the information about whether the device has msi-x or not should be available on early
> driver probe stage before we call xe_device_probe.
>
> If you were to call directly pci_msix_vec_count in this function, I
> would be ok with that.
> But if you want to call pci_msix_vec_count only once and cache this value where in xe_driver,
> then in my opinion you should name this function differently, for example xe_device_uses_msix.
>
I have moved xe_irq_init to an earlier point - so now it should be aligned with the expectation you mentioned.
Btw, I'm not sure it currently holds for other xe_device_has_* functions, for example xe_device_has_flat_ccs is set fairly late.

>>  static inline bool xe_device_has_msix(struct xe_device *xe)
>>  {
>> -	/* TODO: change this when MSI-X support is fully integrated */
>> -	return false;
>> +	return xe->irq.msix.enabled;
> I think this flag is unnecessary and certainly misnamed. This is because it implies that msi-x is
> enabled, which is not true when you set it to true.
>
> You already have the num_of_interrupts variable (BTW, the name nvec would be ok for them too)
> Just do:
>   static inline bool xe_device_uses_msix(struct xe_device *xe)
>   {
>         return xe->irq.msix.num_of_interrupts > 0;
>   }
Agreed, thanks!
>
>>  }
>>  
>>  static inline bool xe_device_has_memirq(struct xe_device *xe)
>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>> index bccca63c8a48..159b0e25e2bb 100644
>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>> @@ -346,6 +346,16 @@ struct xe_device {
>>  
>>  		/** @irq.enabled: interrupts enabled on this device */
>>  		bool enabled;
>> +
>> +		/** @irq.msix: irq info for platforms that support MSI-X */
>> +		struct {
>> +			/** @irq.msix.enabled: MSI-X interrupts enabled on this device */
>> +			bool enabled;
> You don't need it
Ack
>> +			/** @irq.msix.num_of_interrupts: number of MSI-X interrupts */
>> +			u16 num_of_interrupts;
> NIT: you can just name it nvec
Done
>> +			/** @irq.msix.default_msix: Default MSI-X vector */
>> +			u16 default_msix;
> do we need it ? will the default MSI-X vector change ? maybe some define is enough
Indeed, changed to a define.
>> +		} msix;
>>  	} irq;
>>  
>>  	/** @ttm: ttm device */
>> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
>> index fd0f3b3c9101..fe3a10825245 100644
>> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
>> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
>> @@ -68,6 +68,7 @@ static struct xe_exec_queue *__xe_exec_queue_alloc(struct xe_device *xe,
>>  	q->gt = gt;
>>  	q->class = hwe->class;
>>  	q->width = width;
>> +	q->msix = xe->irq.msix.default_msix;
>>  	q->logical_mask = logical_mask;
>>  	q->fence_irq = &gt->fence_irq[hwe->class];
>>  	q->ring_ops = gt->ring_ops[hwe->class];
>> @@ -117,7 +118,7 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q)
>>  	}
>>  
>>  	for (i = 0; i < q->width; ++i) {
>> -		q->lrc[i] = xe_lrc_create(q->hwe, q->vm, SZ_16K);
>> +		q->lrc[i] = xe_lrc_create(q->hwe, q->vm, SZ_16K, q->msix);
>>  		if (IS_ERR(q->lrc[i])) {
>>  			err = PTR_ERR(q->lrc[i]);
>>  			goto err_unlock;
>> diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
>> index 1158b6062a6c..19fd66d59dd7 100644
>> --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
>> +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
>> @@ -63,6 +63,8 @@ struct xe_exec_queue {
>>  	char name[MAX_FENCE_NAME_LEN];
>>  	/** @width: width (number BB submitted per exec) of this exec queue */
>>  	u16 width;
>> +	/** @msix: MSI-X vector (for platforms that support it) */
>> +	u16 msix;
> NIT: Maybe msix_vec, msix seems ambiguous to me
Ok
>>  	/** @fence_irq: fence IRQ used to signal job completion */
>>  	struct xe_hw_fence_irq *fence_irq;
>>  
>> diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
>> index a8c416a48812..dcbc87a31ba3 100644
>> --- a/drivers/gpu/drm/xe/xe_execlist.c
>> +++ b/drivers/gpu/drm/xe/xe_execlist.c
>> @@ -47,6 +47,7 @@ static void __start_lrc(struct xe_hw_engine *hwe, struct xe_lrc *lrc,
>>  	struct xe_mmio *mmio = &gt->mmio;
>>  	struct xe_device *xe = gt_to_xe(gt);
>>  	u64 lrc_desc;
>> +	u32 ring_mode = _MASKED_BIT_ENABLE(GFX_DISABLE_LEGACY_MODE);
>>  
>>  	lrc_desc = xe_lrc_descriptor(lrc);
>>  
>> @@ -80,8 +81,10 @@ static void __start_lrc(struct xe_hw_engine *hwe, struct xe_lrc *lrc,
>>  	xe_mmio_write32(mmio, RING_HWS_PGA(hwe->mmio_base),
>>  			xe_bo_ggtt_addr(hwe->hwsp));
>>  	xe_mmio_read32(mmio, RING_HWS_PGA(hwe->mmio_base));
>> -	xe_mmio_write32(mmio, RING_MODE(hwe->mmio_base),
>> -			_MASKED_BIT_ENABLE(GFX_DISABLE_LEGACY_MODE));
>> +
>> +	if (xe_device_has_msix(gt_to_xe(hwe->gt)))
>> +		ring_mode |= _MASKED_BIT_ENABLE(GFX_MSIX_INTERRUPT_ENABLE);
>> +	xe_mmio_write32(mmio, RING_MODE(hwe->mmio_base), ring_mode);
>>  
>>  	xe_mmio_write32(mmio, RING_EXECLIST_SQ_CONTENTS_LO(hwe->mmio_base),
>>  			lower_32_bits(lrc_desc));
>> @@ -265,7 +268,7 @@ struct xe_execlist_port *xe_execlist_port_create(struct xe_device *xe,
>>  
>>  	port->hwe = hwe;
>>  
>> -	port->lrc = xe_lrc_create(hwe, NULL, SZ_16K);
>> +	port->lrc = xe_lrc_create(hwe, NULL, SZ_16K, xe->irq.msix.default_msix);
>>  	if (IS_ERR(port->lrc)) {
>>  		err = PTR_ERR(port->lrc);
>>  		goto err;
>> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
>> index 1557acee3523..080506b2c4ad 100644
>> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
>> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
>> @@ -324,6 +324,7 @@ void xe_hw_engine_enable_ring(struct xe_hw_engine *hwe)
>>  {
>>  	u32 ccs_mask =
>>  		xe_hw_engine_mask_per_class(hwe->gt, XE_ENGINE_CLASS_COMPUTE);
>> +	u32 ring_mode = _MASKED_BIT_ENABLE(GFX_DISABLE_LEGACY_MODE);
>>  
>>  	if (hwe->class == XE_ENGINE_CLASS_COMPUTE && ccs_mask)
>>  		xe_mmio_write32(&hwe->gt->mmio, RCU_MODE,
>> @@ -332,8 +333,10 @@ void xe_hw_engine_enable_ring(struct xe_hw_engine *hwe)
>>  	xe_hw_engine_mmio_write32(hwe, RING_HWSTAM(0), ~0x0);
>>  	xe_hw_engine_mmio_write32(hwe, RING_HWS_PGA(0),
>>  				  xe_bo_ggtt_addr(hwe->hwsp));
>> -	xe_hw_engine_mmio_write32(hwe, RING_MODE(0),
>> -				  _MASKED_BIT_ENABLE(GFX_DISABLE_LEGACY_MODE));
>> +
>> +	if (xe_device_has_msix(gt_to_xe(hwe->gt)))
>> +		ring_mode |= _MASKED_BIT_ENABLE(GFX_MSIX_INTERRUPT_ENABLE);
>> +	xe_hw_engine_mmio_write32(hwe, RING_MODE(0), ring_mode);
>>  	xe_hw_engine_mmio_write32(hwe, RING_MI_MODE(0),
>>  				  _MASKED_BIT_DISABLE(STOP_RING));
>>  	xe_hw_engine_mmio_read32(hwe, RING_MI_MODE(0));
>> diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
>> index b7995ebd54ab..bad446739b96 100644
>> --- a/drivers/gpu/drm/xe/xe_irq.c
>> +++ b/drivers/gpu/drm/xe/xe_irq.c
>> @@ -4,6 +4,7 @@
>>   */
>>  
>>  #include "xe_irq.h"
>> +#include "xe_irq_msix.h"
>>  
>>  #include <linux/sched/clock.h>
>>  
>> @@ -577,8 +578,12 @@ static void xe_irq_reset(struct xe_device *xe)
>>  	struct xe_tile *tile;
>>  	u8 id;
>>  
>> -	if (IS_SRIOV_VF(xe))
>> +	if (IS_SRIOV_VF(xe)) {
>>  		return vf_irq_reset(xe);
>> +	} else if (xe_device_uses_memirq(xe)) {
> do we need an else if?
> In my opinion, it is enough: 
>
> if (IS_SRIOV_VF(xe)) 
>       return vf_irq_reset(xe);
>
> if (xe_device_uses_memirq(xe))
>     for_each_tile(tile, xe, id)
>         xe_memirq_reset(&tile->memirq);
Fixed, thanks!
>> +		for_each_tile(tile, xe, id)
>> +			xe_memirq_reset(&tile->memirq);
>> +	}
>>  
>>  	for_each_tile(tile, xe, id) {
>>  		if (GRAPHICS_VERx100(xe) >= 1210)
>> @@ -619,8 +624,15 @@ static void vf_irq_postinstall(struct xe_device *xe)
>>  
>>  static void xe_irq_postinstall(struct xe_device *xe)
>>  {
>> -	if (IS_SRIOV_VF(xe))
>> +	if (IS_SRIOV_VF(xe)) {
>>  		return vf_irq_postinstall(xe);
>> +	} else if (xe_device_uses_memirq(xe)) {
> similar to above: we have return for VF case, else if is not needed
Ack
>> +		struct xe_tile *tile;
>> +		unsigned int id;
>> +
>> +		for_each_tile(tile, xe, id)
>> +			xe_memirq_postinstall(&tile->memirq);
>> +	}
>>  
>>  	xe_display_irq_postinstall(xe, xe_root_mmio_gt(xe));
>>  
>> @@ -668,61 +680,94 @@ static irq_handler_t xe_irq_handler(struct xe_device *xe)
>>  		return xelp_irq_handler;
>>  }
>>  
>> -static void irq_uninstall(void *arg)
>> +static int xe_irq_msi_request(struct xe_device *xe)
>> +{
>> +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>> +	irq_handler_t irq_handler;
>> +	int irq, err;
>> +
>> +	irq_handler = xe_irq_handler(xe);
>> +	if (!irq_handler) {
>> +		drm_err(&xe->drm, "No supported interrupt handler");
>> +		return -EINVAL;
>> +	}
>> +
>> +	irq = pci_irq_vector(pdev, 0);
>> +	err = request_irq(irq, irq_handler, IRQF_SHARED, DRIVER_NAME, xe);
>> +	if (err < 0) {
>> +		drm_err(&xe->drm, "Failed to request MSI IRQ %d\n", err);
>> +		return err;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static void xe_irq_msi_free(struct xe_device *xe)
>>  {
>> -	struct xe_device *xe = arg;
>>  	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>>  	int irq;
>>  
>> +	irq = pci_irq_vector(pdev, 0);
>> +	free_irq(irq, xe);
>> +}
>> +
>> +static void irq_uninstall(void *arg)
>> +{
>> +	struct xe_device *xe = arg;
>> +
>>  	if (!xe->irq.enabled)
>>  		return;
>>  
>>  	xe->irq.enabled = false;
>>  	xe_irq_reset(xe);
>>  
>> -	irq = pci_irq_vector(pdev, 0);
>> -	free_irq(irq, xe);
>> +	if (xe_device_has_msix(xe))
>> +		xe_irq_msix_free(xe);
>> +	else
>> +		xe_irq_msi_free(xe);
>>  }
>>  
>> -int xe_irq_install(struct xe_device *xe)
>> +int xe_irq_init(struct xe_device *xe)
>>  {
> Another function I have a problem with. The xe_irq_init by name is a common function for MSI/MSI-X,
> but it looks like it is dedicated only for MSI-X, even though you have a separate xe_irq_msix_init.
>
>
> IMO, you should move pci_msix_vec_count to the inside of xe_irq_msix_init.
>
> int xe_irq_msix_init(struct xe_device *xe)
> {
> 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> 	int nvec = pci_msix_vec_count(pdev);
>
> 	if (nvec == -EINVAL) {
> 		return 0;
> 	} else if (nvec < 0) {
> 		drm_err(&xe->drm, "Failed getting MSI-X vectors count: %pe\n", ERR_PTR(nvec));
> 		return nvec;
> 	}
> 	xe->irq.msix.num_of_interrupts = nvec;
> 	xe->irq.msix.default_msix = DEFAULT_MSIX;
>
> 	return nvec;
> }
>
> int xe_irq_init(struct xe_device *xe)
> {
> 	return xe_irq_msix_init(xe);
> }
>
Hmmm, pci_msix_vec_count is an unfortunate way to distinguish between MSI and MSI-X, so I felt it would be better placed in "common" code. But I agree with your suggestion. Also xe_irq_init now has a spin_lock_init call.
>
>>  	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>> -	unsigned int irq_flags = PCI_IRQ_MSIX;
>> -	irq_handler_t irq_handler;
>> -	int err, irq, nvec;
>> +	int nvec = pci_msix_vec_count(pdev);
>>  
>> -	irq_handler = xe_irq_handler(xe);
>> -	if (!irq_handler) {
>> -		drm_err(&xe->drm, "No supported interrupt handler");
>> -		return -EINVAL;
>> +	if (nvec > 0) {
>> +		xe_irq_msix_init(xe, nvec);
>> +		return 0;
>>  	}
>>  
>> +	if (nvec == -EINVAL)
>> +		return 0;  /* MSI */
>> +
>> +	drm_err(&xe->drm, "Failed getting MSI-X vectors count: %d\n", nvec);
>> +	return nvec;
>> +}
>> +
>> +int xe_irq_install(struct xe_device *xe)
>> +{
>> +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>> +	unsigned int irq_flags = PCI_IRQ_MSI;
>> +	int nvec = 1;
>> +	int err;
>> +
>>  	xe_irq_reset(xe);
>>  
>> -	nvec = pci_msix_vec_count(pdev);
>> -	if (nvec <= 0) {
>> -		if (nvec == -EINVAL) {
>> -			/* MSIX capability is not supported in the device, using MSI */
>> -			irq_flags = PCI_IRQ_MSI;
>> -			nvec = 1;
>> -		} else {
>> -			drm_err(&xe->drm, "MSIX: Failed getting count\n");
>> -			return nvec;
>> -		}
>> +	if (xe_device_has_msix(xe)) {
>> +		nvec = xe->irq.msix.num_of_interrupts;
>> +		irq_flags = PCI_IRQ_MSIX;
>>  	}
>>  
>>  	err = pci_alloc_irq_vectors(pdev, nvec, nvec, irq_flags);
>>  	if (err < 0) {
>> -		drm_err(&xe->drm, "MSI/MSIX: Failed to enable support %d\n", err);
>> +		drm_err(&xe->drm, "Failed to allocate IRQ vectors: %d\n", err);
>>  		return err;
>>  	}
>>  
>> -	irq = pci_irq_vector(pdev, 0);
>> -	err = request_irq(irq, irq_handler, IRQF_SHARED, DRIVER_NAME, xe);
>> -	if (err < 0) {
>> -		drm_err(&xe->drm, "Failed to request MSI/MSIX IRQ %d\n", err);
>> +	err = xe_device_has_msix(xe) ? xe_irq_msix_request(xe) :
>> +				       xe_irq_msi_request(xe);
>> +	if (err)
>>  		return err;
>> -	}
>>  
>>  	xe->irq.enabled = true;
>>  
>> @@ -735,7 +780,10 @@ int xe_irq_install(struct xe_device *xe)
>>  	return 0;
>>  
>>  free_irq_handler:
>> -	free_irq(irq, xe);
>> +	if (xe_device_has_msix(xe))
>> +		xe_irq_msix_free(xe);
>> +	else
>> +		xe_irq_msi_free(xe);
>>  
>>  	return err;
>>  }
>> @@ -748,7 +796,11 @@ void xe_irq_suspend(struct xe_device *xe)
>>  	xe->irq.enabled = false; /* no new irqs */
>>  	spin_unlock_irq(&xe->irq.lock);
>>  
>> -	synchronize_irq(irq); /* flush irqs */
>> +	/* flush irqs */
>> +	if (xe_device_has_msix(xe))
>> +		xe_irq_msix_synchronize_irq(xe);
>> +	else
>> +		synchronize_irq(irq);
> If you created xe_irq_msix_synchronize_irq make the corresponding one for MSI:
> xe_irq_msi_synchronize_irq.
>
> Actully it looks bad, especially since for msi-x you also use synchronize_irq inside.
Done
>>  	xe_irq_reset(xe); /* turn irqs off */
>>  }
>>  
>> diff --git a/drivers/gpu/drm/xe/xe_irq.h b/drivers/gpu/drm/xe/xe_irq.h
>> index 067514e13675..abc13412260a 100644
>> --- a/drivers/gpu/drm/xe/xe_irq.h
>> +++ b/drivers/gpu/drm/xe/xe_irq.h
>> @@ -10,6 +10,7 @@ struct xe_device;
>>  struct xe_tile;
>>  struct xe_gt;
>>  
>> +int xe_irq_init(struct xe_device *xe);
>>  int xe_irq_install(struct xe_device *xe);
>>  void xe_irq_suspend(struct xe_device *xe);
>>  void xe_irq_resume(struct xe_device *xe);
>> diff --git a/drivers/gpu/drm/xe/xe_irq_msix.c b/drivers/gpu/drm/xe/xe_irq_msix.c
>> new file mode 100644
>> index 000000000000..dac339ba5ed2
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_irq_msix.c
>> @@ -0,0 +1,134 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2024 Intel Corporation
>> + */
>> +
>> +#include "xe_irq_msix.h"
>> +
>> +#include "regs/xe_guc_regs.h"
>> +
>> +#include "xe_device.h"
>> +#include "xe_drv.h"
>> +#include "xe_guc.h"
>> +#include "xe_memirq.h"
>> +
>> +enum xe_irq_msix_static {
>> +	GUC2HOST_MSIX = 0,
>> +	DEFAULT_MSIX,
>> +	/* Must be last */
>> +	NUM_OF_STATIC_MSIX,
>> +};
>> +
>> +void xe_irq_msix_init(struct xe_device *xe, int nvec)
>> +{
>> +	xe->irq.msix.enabled = true;
>> +	xe->irq.msix.num_of_interrupts = nvec;
>> +	xe->irq.msix.default_msix = DEFAULT_MSIX;
>> +}
>> +
>> +static irqreturn_t guc2host_irq_handler(int irq, void *arg)
>> +{
>> +	struct xe_device *xe = arg;
>> +	struct xe_tile *tile;
>> +	u8 id;
>> +
>> +	for_each_tile(tile, xe, id)
>> +		xe_guc_irq_handler(&tile->primary_gt->uc.guc,
>> +				   GUC_INTR_GUC2HOST);
>> +
>> +	return IRQ_HANDLED;
>> +}
>> +
>> +static irqreturn_t xe_irq_msix_default_hwe_handler(int irq, void *arg)
>> +{
>> +	unsigned int tile_id, gt_id;
>> +	struct xe_device *xe = arg;
>> +	struct xe_memirq *memirq;
>> +	struct xe_hw_engine *hwe;
>> +	enum xe_hw_engine_id id;
>> +	struct xe_tile *tile;
>> +	struct xe_gt *gt;
>> +
>> +	for_each_tile(tile, xe, tile_id) {
>> +		memirq = &tile->memirq;
>> +		if (!memirq->bo)
>> +			continue;
>> +
>> +		for_each_gt(gt, xe, gt_id) {
>> +			if (gt->tile != tile)
>> +				continue;
>> +
>> +			for_each_hw_engine(hwe, gt, id)
>> +				xe_memirq_hwe_handler(memirq, hwe);
>> +		}
>> +	}
>> +
>> +	return IRQ_HANDLED;
>> +}
>> +
>> +static int xe_irq_msix_request_irq(struct xe_device *xe, irq_handler_t handler,
>> +				   const char *name, u16 msix)
>> +{
>> +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>> +	int ret, irq;
>> +
>> +	irq = pci_irq_vector(pdev, msix);
>> +	if (irq < 0)
>> +		return irq;
>> +
>> +	ret = request_irq(irq, handler, IRQF_SHARED, name, xe);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	return 0;
>> +}
>> +
>> +static void xe_irq_msix_free_irq(struct xe_device *xe, u16 msix)
>> +{
>> +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>> +	int irq;
>> +
>> +	irq = pci_irq_vector(pdev, msix);
>> +	if (irq < 0) {
>> +		drm_err(&xe->drm, "MSI-X %u can't be released, there is no matching IRQ\n", msix);
>> +		return;
>> +	}
>> +
>> +	free_irq(irq, xe);
>> +}
>> +
>> +int xe_irq_msix_request(struct xe_device *xe)
> maybe xe_irq_msix_request_irqs ?
Done
>> +{
>> +	int err;
>> +
>> +	err = xe_irq_msix_request_irq(xe, guc2host_irq_handler,
>> +				      DRIVER_NAME "-guc2host", GUC2HOST_MSIX);
>> +	if (err) {
>> +		drm_err(&xe->drm, "Failed to request MSI-X IRQ %d: %d\n", GUC2HOST_MSIX, err);
>> +		return err;
>> +	}
>> +
>> +	err = xe_irq_msix_request_irq(xe, xe_irq_msix_default_hwe_handler,
>> +				      DRIVER_NAME "-default-msix", DEFAULT_MSIX);
>> +	if (err) {
>> +		drm_err(&xe->drm, "Failed to request MSI-X IRQ %d: %d\n", DEFAULT_MSIX, err);
>> +		xe_irq_msix_free_irq(xe, GUC2HOST_MSIX);
>> +		return err;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +void xe_irq_msix_free(struct xe_device *xe)
>> +{
>> +	xe_irq_msix_free_irq(xe, GUC2HOST_MSIX);
>> +	xe_irq_msix_free_irq(xe, DEFAULT_MSIX);
>> +}
>> +
>> +void xe_irq_msix_synchronize_irq(struct xe_device *xe)
>> +{
>> +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>> +
>> +	synchronize_irq(pci_irq_vector(pdev, GUC2HOST_MSIX));
>> +	synchronize_irq(pci_irq_vector(pdev, DEFAULT_MSIX));
>> +}
> For these two functions above, use for loop. You have defined
> NUM_OF_STATIC_MSIX. Use it az limit in for loop.

These statements are actually changed into a loop with a subsequent patch in these series introducing MSI-X allocator.
In this one I felt that explicit calls are better (e. g. when searching for references).

> Thanks,
> Piotr
>
>> diff --git a/drivers/gpu/drm/xe/xe_irq_msix.h b/drivers/gpu/drm/xe/xe_irq_msix.h
>> new file mode 100644
>> index 000000000000..9c36d11f05fc
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_irq_msix.h
>> @@ -0,0 +1,16 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2024 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_IRQ_MSIX_H_
>> +#define _XE_IRQ_MSIX_H_
>> +
>> +struct xe_device;
>> +
>> +void xe_irq_msix_init(struct xe_device *xe, int nvec);
>> +void xe_irq_msix_free(struct xe_device *xe);
>> +int xe_irq_msix_request(struct xe_device *xe);
>> +void xe_irq_msix_synchronize_irq(struct xe_device *xe);
>> +
>> +#endif
>> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
>> index 4b65da77c6e0..ca27c3be3b8a 100644
>> --- a/drivers/gpu/drm/xe/xe_lrc.c
>> +++ b/drivers/gpu/drm/xe/xe_lrc.c
>> @@ -584,6 +584,7 @@ static void set_memory_based_intr(u32 *regs, struct xe_hw_engine *hwe)
>>  {
>>  	struct xe_memirq *memirq = &gt_to_tile(hwe->gt)->memirq;
>>  	struct xe_device *xe = gt_to_xe(hwe->gt);
>> +	u8 num_regs;
>>  
>>  	if (!xe_device_uses_memirq(xe))
>>  		return;
>> @@ -593,12 +594,18 @@ static void set_memory_based_intr(u32 *regs, struct xe_hw_engine *hwe)
>>  	regs[CTX_INT_MASK_ENABLE_REG] = RING_IMR(0).addr;
>>  	regs[CTX_INT_MASK_ENABLE_PTR] = xe_memirq_enable_ptr(memirq);
>>  
>> -	regs[CTX_LRI_INT_REPORT_PTR] = MI_LOAD_REGISTER_IMM | MI_LRI_NUM_REGS(2) |
>> +	num_regs = xe_device_has_msix(xe) ? 3 : 2;
>> +	regs[CTX_LRI_INT_REPORT_PTR] = MI_LOAD_REGISTER_IMM | MI_LRI_NUM_REGS(num_regs) |
>>  				       MI_LRI_LRM_CS_MMIO | MI_LRI_FORCE_POSTED;
>>  	regs[CTX_INT_STATUS_REPORT_REG] = RING_INT_STATUS_RPT_PTR(0).addr;
>>  	regs[CTX_INT_STATUS_REPORT_PTR] = xe_memirq_status_ptr(memirq, hwe);
>>  	regs[CTX_INT_SRC_REPORT_REG] = RING_INT_SRC_RPT_PTR(0).addr;
>>  	regs[CTX_INT_SRC_REPORT_PTR] = xe_memirq_source_ptr(memirq, hwe);
>> +
>> +	if (xe_device_has_msix(xe)) {
>> +		regs[CTX_CS_INT_VEC_REG] = CS_INT_VEC(0).addr;
>> +		/* CTX_CS_INT_VEC_DATA will be set in xe_lrc_init */
>> +	}
>>  }
>>  
>>  static int lrc_ring_mi_mode(struct xe_hw_engine *hwe)
>> @@ -876,7 +883,7 @@ static void xe_lrc_finish(struct xe_lrc *lrc)
>>  #define PVC_CTX_ACC_CTR_THOLD	(0x2a + 1)
>>  
>>  static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>> -		       struct xe_vm *vm, u32 ring_size)
>> +		       struct xe_vm *vm, u32 ring_size, u16 msix)
>>  {
>>  	struct xe_gt *gt = hwe->gt;
>>  	struct xe_tile *tile = gt_to_tile(gt);
>> @@ -945,6 +952,14 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>>  			xe_drm_client_add_bo(vm->xef->client, lrc->bo);
>>  	}
>>  
>> +	if (xe_device_has_msix(xe)) {
>> +		xe_lrc_write_ctx_reg(lrc, CTX_INT_STATUS_REPORT_PTR,
>> +				     xe_memirq_status_ptr(&tile->memirq, hwe));
>> +		xe_lrc_write_ctx_reg(lrc, CTX_INT_SRC_REPORT_PTR,
>> +				     xe_memirq_source_ptr(&tile->memirq, hwe));
>> +		xe_lrc_write_ctx_reg(lrc, CTX_CS_INT_VEC_DATA, msix << 16 | msix);
>> +	}
>> +
>>  	if (xe_gt_has_indirect_ring_state(gt)) {
>>  		xe_lrc_write_ctx_reg(lrc, CTX_INDIRECT_RING_STATE,
>>  				     __xe_lrc_indirect_ring_ggtt_addr(lrc));
>> @@ -1005,6 +1020,7 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>>   * @hwe: Hardware Engine
>>   * @vm: The VM (address space)
>>   * @ring_size: LRC ring size
>> + * @msix: MSI-X interrupt vector (for platforms that support it)
>>   *
>>   * Allocate and initialize the Logical Ring Context (LRC).
>>   *
>> @@ -1012,7 +1028,7 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>>   * upon failure.
>>   */
>>  struct xe_lrc *xe_lrc_create(struct xe_hw_engine *hwe, struct xe_vm *vm,
>> -			     u32 ring_size)
>> +			     u32 ring_size, u16 msix)
>>  {
>>  	struct xe_lrc *lrc;
>>  	int err;
>> @@ -1021,7 +1037,7 @@ struct xe_lrc *xe_lrc_create(struct xe_hw_engine *hwe, struct xe_vm *vm,
>>  	if (!lrc)
>>  		return ERR_PTR(-ENOMEM);
>>  
>> -	err = xe_lrc_init(lrc, hwe, vm, ring_size);
>> +	err = xe_lrc_init(lrc, hwe, vm, ring_size, msix);
>>  	if (err) {
>>  		kfree(lrc);
>>  		return ERR_PTR(err);
>> diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
>> index 40d8f6906d3e..6d1c2f6c0559 100644
>> --- a/drivers/gpu/drm/xe/xe_lrc.h
>> +++ b/drivers/gpu/drm/xe/xe_lrc.h
>> @@ -40,7 +40,7 @@ struct xe_lrc_snapshot {
>>  #define LRC_PPHWSP_SCRATCH_ADDR (0x34 * 4)
>>  
>>  struct xe_lrc *xe_lrc_create(struct xe_hw_engine *hwe, struct xe_vm *vm,
>> -			     u32 ring_size);
>> +			     u32 ring_size, u16 msix);
>>  void xe_lrc_destroy(struct kref *ref);
>>  
>>  /**
>> -- 
>> 2.43.2
>>

--------------RqavkHVoc0Rni8jV1dkMWxPC
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 27/11/2024 10:24, Piotr Piórkowski
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20241127082408.cf3lqksj4j6jusgp@intel.com">
      <pre wrap="" class="moz-quote-pre">Ilia Levi <a class="moz-txt-link-rfc2396E" href="mailto:ilia.levi@intel.com">&lt;ilia.levi@intel.com&gt;</a> wrote on nie [2024-lis-10 22:39:13 +0200]:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">A new flow is added for devices that support MSI-X:
- MSI-X vector 0 is used for GuC-to-host interrupt
- MSI-X vector 1 (aka default MSI-X) is used for HW engines
- Configure the HW engines to work with MSI-X
- Program the LRC to use memirq infra (similar to VF)
- CS_INT_VEC field added to the LRC

</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
IMO you should split this patch into two separate patches:
the general configuration (init) of MSI-X and the addition of MSI-X support for HW engines</pre>
    </blockquote>
    <p>Ack. For some reason patchwork created a new series: <br>
      <a class="moz-txt-link-freetext" href="https://patchwork.freedesktop.org/series/141880/">https://patchwork.freedesktop.org/series/141880/</a><br>
    </p>
    <blockquote type="cite" cite="mid:20241127082408.cf3lqksj4j6jusgp@intel.com">
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Bspec: 60342, 72547

Signed-off-by: Ilia Levi <a class="moz-txt-link-rfc2396E" href="mailto:ilia.levi@intel.com">&lt;ilia.levi@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/Makefile              |   1 +
 drivers/gpu/drm/xe/regs/xe_engine_regs.h |   3 +
 drivers/gpu/drm/xe/regs/xe_lrc_layout.h  |   3 +
 drivers/gpu/drm/xe/xe_device.c           |   4 +
 drivers/gpu/drm/xe/xe_device.h           |   3 +-
 drivers/gpu/drm/xe/xe_device_types.h     |  10 ++
 drivers/gpu/drm/xe/xe_exec_queue.c       |   3 +-
 drivers/gpu/drm/xe/xe_exec_queue_types.h |   2 +
 drivers/gpu/drm/xe/xe_execlist.c         |   9 +-
 drivers/gpu/drm/xe/xe_hw_engine.c        |   7 +-
 drivers/gpu/drm/xe/xe_irq.c              | 116 ++++++++++++++------
 drivers/gpu/drm/xe/xe_irq.h              |   1 +
 drivers/gpu/drm/xe/xe_irq_msix.c         | 134 +++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_irq_msix.h         |  16 +++
 drivers/gpu/drm/xe/xe_lrc.c              |  24 +++-
 drivers/gpu/drm/xe/xe_lrc.h              |   2 +-
 16 files changed, 293 insertions(+), 45 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_irq_msix.c
 create mode 100644 drivers/gpu/drm/xe/xe_irq_msix.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index a93e6fcc0ad9..2f1e1f17b677 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -72,6 +72,7 @@ xe-y += xe_bb.o \
 	xe_hw_fence.o \
 	xe_huc.o \
 	xe_irq.o \
+	xe_irq_msix.o \
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
I have my doubts that we need a separate file for MSI-X.
We already have xe_irq.c, and there is not much code for MSI-X.

I think of it this way: if we need a separate file for MSI-X then why not have a separate one
for MSI. And if xe_irq.c is for MSI then why don't we call it xe_irq_msi.c. But then what about
the common functions which are used by MSI and MSI-X.
And after such reasoning, I conclude that it would be just as well if the msi-x functions
were in the xe_irq.c file.
</pre>
    </blockquote>
    Makes sense, we can always separate later if it grows too
    cumbersome.<br>
    <blockquote type="cite" cite="mid:20241127082408.cf3lqksj4j6jusgp@intel.com">
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre"> 	xe_lrc.o \
 	xe_migrate.o \
 	xe_mmio.o \
diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
index 7c78496e6213..d86219dedde2 100644
--- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
@@ -83,6 +83,8 @@
 #define RING_IMR(base)				XE_REG((base) + 0xa8)
 #define RING_INT_STATUS_RPT_PTR(base)		XE_REG((base) + 0xac)
 
+#define CS_INT_VEC(base)			XE_REG((base) + 0x1b8)
+
 #define RING_EIR(base)				XE_REG((base) + 0xb0)
 #define RING_EMR(base)				XE_REG((base) + 0xb4)
 #define RING_ESR(base)				XE_REG((base) + 0xb8)
@@ -138,6 +140,7 @@
 
 #define RING_MODE(base)				XE_REG((base) + 0x29c)
 #define   GFX_DISABLE_LEGACY_MODE		REG_BIT(3)
+#define   GFX_MSIX_INTERRUPT_ENABLE		REG_BIT(13)
 
 #define RING_TIMESTAMP(base)			XE_REG((base) + 0x358)
 
diff --git a/drivers/gpu/drm/xe/regs/xe_lrc_layout.h b/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
index 045dfd09db99..57944f90bbf6 100644
--- a/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
+++ b/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
@@ -25,6 +25,9 @@
 #define CTX_INT_SRC_REPORT_REG		(CTX_LRI_INT_REPORT_PTR + 3)
 #define CTX_INT_SRC_REPORT_PTR		(CTX_LRI_INT_REPORT_PTR + 4)
 
+#define CTX_CS_INT_VEC_REG		0x5a
+#define CTX_CS_INT_VEC_DATA		(CTX_CS_INT_VEC_REG + 1)
+
 #define INDIRECT_CTX_RING_HEAD		(0x02 + 1)
 #define INDIRECT_CTX_RING_TAIL		(0x04 + 1)
 #define INDIRECT_CTX_RING_START		(0x06 + 1)
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 0e2dd691bdae..eff7e51198d9 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -660,6 +660,10 @@ int xe_device_probe(struct xe_device *xe)
 		xe_gt_mmio_init(gt);
 	}
 
+	err = xe_irq_init(xe);
+	if (err)
+		return err;
+
 	for_each_tile(tile, xe, id) {
 		if (IS_SRIOV_VF(xe)) {
 			xe_guc_comm_init_early(&amp;tile-&gt;primary_gt-&gt;uc.guc);
diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index f1fbfe916867..812f24a34e6b 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -157,8 +157,7 @@ static inline bool xe_device_has_sriov(struct xe_device *xe)
 
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
I have a problem with this name. In my opinion, the functions named xe_device_has_*
let us know if the device has any specific capability.
Mostly this is based on infromation of the gen number, or an attribute
from intel_device_info.
In the case of MSI-X, such information is provided to us from PCI subsystem.
I think I understand why you used here a flag that you set yourself, but with a function named
like this, the information about whether the device has msi-x or not should be available on early
driver probe stage before we call xe_device_probe.

If you were to call directly pci_msix_vec_count in this function, I
would be ok with that.
But if you want to call pci_msix_vec_count only once and cache this value where in xe_driver,
then in my opinion you should name this function differently, for example xe_device_uses_msix.

</pre>
    </blockquote>
    <p>I have moved xe_irq_init to an earlier point - so now it should
      be aligned with the expectation you mentioned.<br>
      Btw, I'm not sure it currently holds for other xe_device_has_*
      functions, for example xe_device_has_flat_ccs is set fairly late.<br>
    </p>
    <blockquote type="cite" cite="mid:20241127082408.cf3lqksj4j6jusgp@intel.com">
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre"> static inline bool xe_device_has_msix(struct xe_device *xe)
 {
-	/* TODO: change this when MSI-X support is fully integrated */
-	return false;
+	return xe-&gt;irq.msix.enabled;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
I think this flag is unnecessary and certainly misnamed. This is because it implies that msi-x is
enabled, which is not true when you set it to true.

You already have the num_of_interrupts variable (BTW, the name nvec would be ok for them too)
Just do:
  static inline bool xe_device_uses_msix(struct xe_device *xe)
  {
        return xe-&gt;irq.msix.num_of_interrupts &gt; 0;
  }
</pre>
    </blockquote>
    Agreed, thanks!<br>
    <blockquote type="cite" cite="mid:20241127082408.cf3lqksj4j6jusgp@intel.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre"> }
 
 static inline bool xe_device_has_memirq(struct xe_device *xe)
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index bccca63c8a48..159b0e25e2bb 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -346,6 +346,16 @@ struct xe_device {
 
 		/** @irq.enabled: interrupts enabled on this device */
 		bool enabled;
+
+		/** @irq.msix: irq info for platforms that support MSI-X */
+		struct {
+			/** @irq.msix.enabled: MSI-X interrupts enabled on this device */
+			bool enabled;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">You don't need it
</pre>
    </blockquote>
    Ack<br>
    <blockquote type="cite" cite="mid:20241127082408.cf3lqksj4j6jusgp@intel.com">
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+			/** @irq.msix.num_of_interrupts: number of MSI-X interrupts */
+			u16 num_of_interrupts;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">NIT: you can just name it nvec</pre>
    </blockquote>
    Done<br>
    <blockquote type="cite" cite="mid:20241127082408.cf3lqksj4j6jusgp@intel.com">
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+			/** @irq.msix.default_msix: Default MSI-X vector */
+			u16 default_msix;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">do we need it ? will the default MSI-X vector change ? maybe some define is enough</pre>
    </blockquote>
    Indeed, changed to a define.<br>
    <blockquote type="cite" cite="mid:20241127082408.cf3lqksj4j6jusgp@intel.com">
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+		} msix;
 	} irq;
 
 	/** @ttm: ttm device */
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index fd0f3b3c9101..fe3a10825245 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -68,6 +68,7 @@ static struct xe_exec_queue *__xe_exec_queue_alloc(struct xe_device *xe,
 	q-&gt;gt = gt;
 	q-&gt;class = hwe-&gt;class;
 	q-&gt;width = width;
+	q-&gt;msix = xe-&gt;irq.msix.default_msix;
 	q-&gt;logical_mask = logical_mask;
 	q-&gt;fence_irq = &amp;gt-&gt;fence_irq[hwe-&gt;class];
 	q-&gt;ring_ops = gt-&gt;ring_ops[hwe-&gt;class];
@@ -117,7 +118,7 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q)
 	}
 
 	for (i = 0; i &lt; q-&gt;width; ++i) {
-		q-&gt;lrc[i] = xe_lrc_create(q-&gt;hwe, q-&gt;vm, SZ_16K);
+		q-&gt;lrc[i] = xe_lrc_create(q-&gt;hwe, q-&gt;vm, SZ_16K, q-&gt;msix);
 		if (IS_ERR(q-&gt;lrc[i])) {
 			err = PTR_ERR(q-&gt;lrc[i]);
 			goto err_unlock;
diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
index 1158b6062a6c..19fd66d59dd7 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -63,6 +63,8 @@ struct xe_exec_queue {
 	char name[MAX_FENCE_NAME_LEN];
 	/** @width: width (number BB submitted per exec) of this exec queue */
 	u16 width;
+	/** @msix: MSI-X vector (for platforms that support it) */
+	u16 msix;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
NIT: Maybe msix_vec, msix seems ambiguous to me
</pre>
    </blockquote>
    Ok<br>
    <blockquote type="cite" cite="mid:20241127082408.cf3lqksj4j6jusgp@intel.com">
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre"> 	/** @fence_irq: fence IRQ used to signal job completion */
 	struct xe_hw_fence_irq *fence_irq;
 
diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
index a8c416a48812..dcbc87a31ba3 100644
--- a/drivers/gpu/drm/xe/xe_execlist.c
+++ b/drivers/gpu/drm/xe/xe_execlist.c
@@ -47,6 +47,7 @@ static void __start_lrc(struct xe_hw_engine *hwe, struct xe_lrc *lrc,
 	struct xe_mmio *mmio = &amp;gt-&gt;mmio;
 	struct xe_device *xe = gt_to_xe(gt);
 	u64 lrc_desc;
+	u32 ring_mode = _MASKED_BIT_ENABLE(GFX_DISABLE_LEGACY_MODE);
 
 	lrc_desc = xe_lrc_descriptor(lrc);
 
@@ -80,8 +81,10 @@ static void __start_lrc(struct xe_hw_engine *hwe, struct xe_lrc *lrc,
 	xe_mmio_write32(mmio, RING_HWS_PGA(hwe-&gt;mmio_base),
 			xe_bo_ggtt_addr(hwe-&gt;hwsp));
 	xe_mmio_read32(mmio, RING_HWS_PGA(hwe-&gt;mmio_base));
-	xe_mmio_write32(mmio, RING_MODE(hwe-&gt;mmio_base),
-			_MASKED_BIT_ENABLE(GFX_DISABLE_LEGACY_MODE));
+
+	if (xe_device_has_msix(gt_to_xe(hwe-&gt;gt)))
+		ring_mode |= _MASKED_BIT_ENABLE(GFX_MSIX_INTERRUPT_ENABLE);
+	xe_mmio_write32(mmio, RING_MODE(hwe-&gt;mmio_base), ring_mode);
 
 	xe_mmio_write32(mmio, RING_EXECLIST_SQ_CONTENTS_LO(hwe-&gt;mmio_base),
 			lower_32_bits(lrc_desc));
@@ -265,7 +268,7 @@ struct xe_execlist_port *xe_execlist_port_create(struct xe_device *xe,
 
 	port-&gt;hwe = hwe;
 
-	port-&gt;lrc = xe_lrc_create(hwe, NULL, SZ_16K);
+	port-&gt;lrc = xe_lrc_create(hwe, NULL, SZ_16K, xe-&gt;irq.msix.default_msix);
 	if (IS_ERR(port-&gt;lrc)) {
 		err = PTR_ERR(port-&gt;lrc);
 		goto err;
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 1557acee3523..080506b2c4ad 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -324,6 +324,7 @@ void xe_hw_engine_enable_ring(struct xe_hw_engine *hwe)
 {
 	u32 ccs_mask =
 		xe_hw_engine_mask_per_class(hwe-&gt;gt, XE_ENGINE_CLASS_COMPUTE);
+	u32 ring_mode = _MASKED_BIT_ENABLE(GFX_DISABLE_LEGACY_MODE);
 
 	if (hwe-&gt;class == XE_ENGINE_CLASS_COMPUTE &amp;&amp; ccs_mask)
 		xe_mmio_write32(&amp;hwe-&gt;gt-&gt;mmio, RCU_MODE,
@@ -332,8 +333,10 @@ void xe_hw_engine_enable_ring(struct xe_hw_engine *hwe)
 	xe_hw_engine_mmio_write32(hwe, RING_HWSTAM(0), ~0x0);
 	xe_hw_engine_mmio_write32(hwe, RING_HWS_PGA(0),
 				  xe_bo_ggtt_addr(hwe-&gt;hwsp));
-	xe_hw_engine_mmio_write32(hwe, RING_MODE(0),
-				  _MASKED_BIT_ENABLE(GFX_DISABLE_LEGACY_MODE));
+
+	if (xe_device_has_msix(gt_to_xe(hwe-&gt;gt)))
+		ring_mode |= _MASKED_BIT_ENABLE(GFX_MSIX_INTERRUPT_ENABLE);
+	xe_hw_engine_mmio_write32(hwe, RING_MODE(0), ring_mode);
 	xe_hw_engine_mmio_write32(hwe, RING_MI_MODE(0),
 				  _MASKED_BIT_DISABLE(STOP_RING));
 	xe_hw_engine_mmio_read32(hwe, RING_MI_MODE(0));
diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index b7995ebd54ab..bad446739b96 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -4,6 +4,7 @@
  */
 
 #include &quot;xe_irq.h&quot;
+#include &quot;xe_irq_msix.h&quot;
 
 #include &lt;linux/sched/clock.h&gt;
 
@@ -577,8 +578,12 @@ static void xe_irq_reset(struct xe_device *xe)
 	struct xe_tile *tile;
 	u8 id;
 
-	if (IS_SRIOV_VF(xe))
+	if (IS_SRIOV_VF(xe)) {
 		return vf_irq_reset(xe);
+	} else if (xe_device_uses_memirq(xe)) {
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
do we need an else if?
In my opinion, it is enough: 

if (IS_SRIOV_VF(xe)) 
      return vf_irq_reset(xe);

if (xe_device_uses_memirq(xe))
    for_each_tile(tile, xe, id)
        xe_memirq_reset(&amp;tile-&gt;memirq);</pre>
    </blockquote>
    Fixed, thanks!<br>
    <blockquote type="cite" cite="mid:20241127082408.cf3lqksj4j6jusgp@intel.com">
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+		for_each_tile(tile, xe, id)
+			xe_memirq_reset(&amp;tile-&gt;memirq);
+	}
 
 	for_each_tile(tile, xe, id) {
 		if (GRAPHICS_VERx100(xe) &gt;= 1210)
@@ -619,8 +624,15 @@ static void vf_irq_postinstall(struct xe_device *xe)
 
 static void xe_irq_postinstall(struct xe_device *xe)
 {
-	if (IS_SRIOV_VF(xe))
+	if (IS_SRIOV_VF(xe)) {
 		return vf_irq_postinstall(xe);
+	} else if (xe_device_uses_memirq(xe)) {
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
similar to above: we have return for VF case, else if is not needed
</pre>
    </blockquote>
    Ack<br>
    <blockquote type="cite" cite="mid:20241127082408.cf3lqksj4j6jusgp@intel.com">
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+		struct xe_tile *tile;
+		unsigned int id;
+
+		for_each_tile(tile, xe, id)
+			xe_memirq_postinstall(&amp;tile-&gt;memirq);
+	}
 
 	xe_display_irq_postinstall(xe, xe_root_mmio_gt(xe));
 
@@ -668,61 +680,94 @@ static irq_handler_t xe_irq_handler(struct xe_device *xe)
 		return xelp_irq_handler;
 }
 
-static void irq_uninstall(void *arg)
+static int xe_irq_msi_request(struct xe_device *xe)
+{
+	struct pci_dev *pdev = to_pci_dev(xe-&gt;drm.dev);
+	irq_handler_t irq_handler;
+	int irq, err;
+
+	irq_handler = xe_irq_handler(xe);
+	if (!irq_handler) {
+		drm_err(&amp;xe-&gt;drm, &quot;No supported interrupt handler&quot;);
+		return -EINVAL;
+	}
+
+	irq = pci_irq_vector(pdev, 0);
+	err = request_irq(irq, irq_handler, IRQF_SHARED, DRIVER_NAME, xe);
+	if (err &lt; 0) {
+		drm_err(&amp;xe-&gt;drm, &quot;Failed to request MSI IRQ %d\n&quot;, err);
+		return err;
+	}
+
+	return 0;
+}
+
+static void xe_irq_msi_free(struct xe_device *xe)
 {
-	struct xe_device *xe = arg;
 	struct pci_dev *pdev = to_pci_dev(xe-&gt;drm.dev);
 	int irq;
 
+	irq = pci_irq_vector(pdev, 0);
+	free_irq(irq, xe);
+}
+
+static void irq_uninstall(void *arg)
+{
+	struct xe_device *xe = arg;
+
 	if (!xe-&gt;irq.enabled)
 		return;
 
 	xe-&gt;irq.enabled = false;
 	xe_irq_reset(xe);
 
-	irq = pci_irq_vector(pdev, 0);
-	free_irq(irq, xe);
+	if (xe_device_has_msix(xe))
+		xe_irq_msix_free(xe);
+	else
+		xe_irq_msi_free(xe);
 }
 
-int xe_irq_install(struct xe_device *xe)
+int xe_irq_init(struct xe_device *xe)
 {
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Another function I have a problem with. The xe_irq_init by name is a common function for MSI/MSI-X,
but it looks like it is dedicated only for MSI-X, even though you have a separate xe_irq_msix_init.


IMO, you should move pci_msix_vec_count to the inside of xe_irq_msix_init.

int xe_irq_msix_init(struct xe_device *xe)
{
	struct pci_dev *pdev = to_pci_dev(xe-&gt;drm.dev);
	int nvec = pci_msix_vec_count(pdev);

	if (nvec == -EINVAL) {
		return 0;
	} else if (nvec &lt; 0) {
		drm_err(&amp;xe-&gt;drm, &quot;Failed getting MSI-X vectors count: %pe\n&quot;, ERR_PTR(nvec));
		return nvec;
	}
	xe-&gt;irq.msix.num_of_interrupts = nvec;
	xe-&gt;irq.msix.default_msix = DEFAULT_MSIX;

	return nvec;
}

int xe_irq_init(struct xe_device *xe)
{
	return xe_irq_msix_init(xe);
}

</pre>
    </blockquote>
    Hmmm, <span style="white-space: pre-wrap">pci_msix_vec_count is an unfortunate way to distinguish between MSI and MSI-X, so I felt it would be better placed in &quot;common&quot; code. But I agree with your suggestion. Also xe_irq_init now has a spin_lock_init call. </span>
    <blockquote type="cite" cite="mid:20241127082408.cf3lqksj4j6jusgp@intel.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre"> 	struct pci_dev *pdev = to_pci_dev(xe-&gt;drm.dev);
-	unsigned int irq_flags = PCI_IRQ_MSIX;
-	irq_handler_t irq_handler;
-	int err, irq, nvec;
+	int nvec = pci_msix_vec_count(pdev);
 
-	irq_handler = xe_irq_handler(xe);
-	if (!irq_handler) {
-		drm_err(&amp;xe-&gt;drm, &quot;No supported interrupt handler&quot;);
-		return -EINVAL;
+	if (nvec &gt; 0) {
+		xe_irq_msix_init(xe, nvec);
+		return 0;
 	}
 
+	if (nvec == -EINVAL)
+		return 0;  /* MSI */
+
+	drm_err(&amp;xe-&gt;drm, &quot;Failed getting MSI-X vectors count: %d\n&quot;, nvec);
+	return nvec;
+}
+
+int xe_irq_install(struct xe_device *xe)
+{
+	struct pci_dev *pdev = to_pci_dev(xe-&gt;drm.dev);
+	unsigned int irq_flags = PCI_IRQ_MSI;
+	int nvec = 1;
+	int err;
+
 	xe_irq_reset(xe);
 
-	nvec = pci_msix_vec_count(pdev);
-	if (nvec &lt;= 0) {
-		if (nvec == -EINVAL) {
-			/* MSIX capability is not supported in the device, using MSI */
-			irq_flags = PCI_IRQ_MSI;
-			nvec = 1;
-		} else {
-			drm_err(&amp;xe-&gt;drm, &quot;MSIX: Failed getting count\n&quot;);
-			return nvec;
-		}
+	if (xe_device_has_msix(xe)) {
+		nvec = xe-&gt;irq.msix.num_of_interrupts;
+		irq_flags = PCI_IRQ_MSIX;
 	}
 
 	err = pci_alloc_irq_vectors(pdev, nvec, nvec, irq_flags);
 	if (err &lt; 0) {
-		drm_err(&amp;xe-&gt;drm, &quot;MSI/MSIX: Failed to enable support %d\n&quot;, err);
+		drm_err(&amp;xe-&gt;drm, &quot;Failed to allocate IRQ vectors: %d\n&quot;, err);
 		return err;
 	}
 
-	irq = pci_irq_vector(pdev, 0);
-	err = request_irq(irq, irq_handler, IRQF_SHARED, DRIVER_NAME, xe);
-	if (err &lt; 0) {
-		drm_err(&amp;xe-&gt;drm, &quot;Failed to request MSI/MSIX IRQ %d\n&quot;, err);
+	err = xe_device_has_msix(xe) ? xe_irq_msix_request(xe) :
+				       xe_irq_msi_request(xe);
+	if (err)
 		return err;
-	}
 
 	xe-&gt;irq.enabled = true;
 
@@ -735,7 +780,10 @@ int xe_irq_install(struct xe_device *xe)
 	return 0;
 
 free_irq_handler:
-	free_irq(irq, xe);
+	if (xe_device_has_msix(xe))
+		xe_irq_msix_free(xe);
+	else
+		xe_irq_msi_free(xe);
 
 	return err;
 }
@@ -748,7 +796,11 @@ void xe_irq_suspend(struct xe_device *xe)
 	xe-&gt;irq.enabled = false; /* no new irqs */
 	spin_unlock_irq(&amp;xe-&gt;irq.lock);
 
-	synchronize_irq(irq); /* flush irqs */
+	/* flush irqs */
+	if (xe_device_has_msix(xe))
+		xe_irq_msix_synchronize_irq(xe);
+	else
+		synchronize_irq(irq);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
If you created xe_irq_msix_synchronize_irq make the corresponding one for MSI:
xe_irq_msi_synchronize_irq.

Actully it looks bad, especially since for msi-x you also use synchronize_irq inside.
</pre>
    </blockquote>
    Done<br>
    <blockquote type="cite" cite="mid:20241127082408.cf3lqksj4j6jusgp@intel.com">
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre"> 	xe_irq_reset(xe); /* turn irqs off */
 }
 
diff --git a/drivers/gpu/drm/xe/xe_irq.h b/drivers/gpu/drm/xe/xe_irq.h
index 067514e13675..abc13412260a 100644
--- a/drivers/gpu/drm/xe/xe_irq.h
+++ b/drivers/gpu/drm/xe/xe_irq.h
@@ -10,6 +10,7 @@ struct xe_device;
 struct xe_tile;
 struct xe_gt;
 
+int xe_irq_init(struct xe_device *xe);
 int xe_irq_install(struct xe_device *xe);
 void xe_irq_suspend(struct xe_device *xe);
 void xe_irq_resume(struct xe_device *xe);
diff --git a/drivers/gpu/drm/xe/xe_irq_msix.c b/drivers/gpu/drm/xe/xe_irq_msix.c
new file mode 100644
index 000000000000..dac339ba5ed2
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_irq_msix.c
@@ -0,0 +1,134 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+#include &quot;xe_irq_msix.h&quot;
+
+#include &quot;regs/xe_guc_regs.h&quot;
+
+#include &quot;xe_device.h&quot;
+#include &quot;xe_drv.h&quot;
+#include &quot;xe_guc.h&quot;
+#include &quot;xe_memirq.h&quot;
+
+enum xe_irq_msix_static {
+	GUC2HOST_MSIX = 0,
+	DEFAULT_MSIX,
+	/* Must be last */
+	NUM_OF_STATIC_MSIX,
+};
+
+void xe_irq_msix_init(struct xe_device *xe, int nvec)
+{
+	xe-&gt;irq.msix.enabled = true;
+	xe-&gt;irq.msix.num_of_interrupts = nvec;
+	xe-&gt;irq.msix.default_msix = DEFAULT_MSIX;
+}
+
+static irqreturn_t guc2host_irq_handler(int irq, void *arg)
+{
+	struct xe_device *xe = arg;
+	struct xe_tile *tile;
+	u8 id;
+
+	for_each_tile(tile, xe, id)
+		xe_guc_irq_handler(&amp;tile-&gt;primary_gt-&gt;uc.guc,
+				   GUC_INTR_GUC2HOST);
+
+	return IRQ_HANDLED;
+}
+
+static irqreturn_t xe_irq_msix_default_hwe_handler(int irq, void *arg)
+{
+	unsigned int tile_id, gt_id;
+	struct xe_device *xe = arg;
+	struct xe_memirq *memirq;
+	struct xe_hw_engine *hwe;
+	enum xe_hw_engine_id id;
+	struct xe_tile *tile;
+	struct xe_gt *gt;
+
+	for_each_tile(tile, xe, tile_id) {
+		memirq = &amp;tile-&gt;memirq;
+		if (!memirq-&gt;bo)
+			continue;
+
+		for_each_gt(gt, xe, gt_id) {
+			if (gt-&gt;tile != tile)
+				continue;
+
+			for_each_hw_engine(hwe, gt, id)
+				xe_memirq_hwe_handler(memirq, hwe);
+		}
+	}
+
+	return IRQ_HANDLED;
+}
+
+static int xe_irq_msix_request_irq(struct xe_device *xe, irq_handler_t handler,
+				   const char *name, u16 msix)
+{
+	struct pci_dev *pdev = to_pci_dev(xe-&gt;drm.dev);
+	int ret, irq;
+
+	irq = pci_irq_vector(pdev, msix);
+	if (irq &lt; 0)
+		return irq;
+
+	ret = request_irq(irq, handler, IRQF_SHARED, name, xe);
+	if (ret &lt; 0)
+		return ret;
+
+	return 0;
+}
+
+static void xe_irq_msix_free_irq(struct xe_device *xe, u16 msix)
+{
+	struct pci_dev *pdev = to_pci_dev(xe-&gt;drm.dev);
+	int irq;
+
+	irq = pci_irq_vector(pdev, msix);
+	if (irq &lt; 0) {
+		drm_err(&amp;xe-&gt;drm, &quot;MSI-X %u can't be released, there is no matching IRQ\n&quot;, msix);
+		return;
+	}
+
+	free_irq(irq, xe);
+}
+
+int xe_irq_msix_request(struct xe_device *xe)
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
maybe xe_irq_msix_request_irqs ?
</pre>
    </blockquote>
    Done<br>
    <blockquote type="cite" cite="mid:20241127082408.cf3lqksj4j6jusgp@intel.com">
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+{
+	int err;
+
+	err = xe_irq_msix_request_irq(xe, guc2host_irq_handler,
+				      DRIVER_NAME &quot;-guc2host&quot;, GUC2HOST_MSIX);
+	if (err) {
+		drm_err(&amp;xe-&gt;drm, &quot;Failed to request MSI-X IRQ %d: %d\n&quot;, GUC2HOST_MSIX, err);
+		return err;
+	}
+
+	err = xe_irq_msix_request_irq(xe, xe_irq_msix_default_hwe_handler,
+				      DRIVER_NAME &quot;-default-msix&quot;, DEFAULT_MSIX);
+	if (err) {
+		drm_err(&amp;xe-&gt;drm, &quot;Failed to request MSI-X IRQ %d: %d\n&quot;, DEFAULT_MSIX, err);
+		xe_irq_msix_free_irq(xe, GUC2HOST_MSIX);
+		return err;
+	}
+
+	return 0;
+}
+
+void xe_irq_msix_free(struct xe_device *xe)
+{
+	xe_irq_msix_free_irq(xe, GUC2HOST_MSIX);
+	xe_irq_msix_free_irq(xe, DEFAULT_MSIX);
+}
+
+void xe_irq_msix_synchronize_irq(struct xe_device *xe)
+{
+	struct pci_dev *pdev = to_pci_dev(xe-&gt;drm.dev);
+
+	synchronize_irq(pci_irq_vector(pdev, GUC2HOST_MSIX));
+	synchronize_irq(pci_irq_vector(pdev, DEFAULT_MSIX));
+}
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
For these two functions above, use for loop. You have defined
NUM_OF_STATIC_MSIX. Use it az limit in for loop.
</pre>
    </blockquote>
    <p>These statements are actually changed into a loop with a
      subsequent patch in these series introducing MSI-X allocator.<br>
      In this one I felt that explicit calls are better (e. g. when
      searching for references).<br>
    </p>
    <blockquote type="cite" cite="mid:20241127082408.cf3lqksj4j6jusgp@intel.com">
      <pre wrap="" class="moz-quote-pre">
Thanks,
Piotr

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">diff --git a/drivers/gpu/drm/xe/xe_irq_msix.h b/drivers/gpu/drm/xe/xe_irq_msix.h
new file mode 100644
index 000000000000..9c36d11f05fc
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_irq_msix.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+#ifndef _XE_IRQ_MSIX_H_
+#define _XE_IRQ_MSIX_H_
+
+struct xe_device;
+
+void xe_irq_msix_init(struct xe_device *xe, int nvec);
+void xe_irq_msix_free(struct xe_device *xe);
+int xe_irq_msix_request(struct xe_device *xe);
+void xe_irq_msix_synchronize_irq(struct xe_device *xe);
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 4b65da77c6e0..ca27c3be3b8a 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -584,6 +584,7 @@ static void set_memory_based_intr(u32 *regs, struct xe_hw_engine *hwe)
 {
 	struct xe_memirq *memirq = &amp;gt_to_tile(hwe-&gt;gt)-&gt;memirq;
 	struct xe_device *xe = gt_to_xe(hwe-&gt;gt);
+	u8 num_regs;
 
 	if (!xe_device_uses_memirq(xe))
 		return;
@@ -593,12 +594,18 @@ static void set_memory_based_intr(u32 *regs, struct xe_hw_engine *hwe)
 	regs[CTX_INT_MASK_ENABLE_REG] = RING_IMR(0).addr;
 	regs[CTX_INT_MASK_ENABLE_PTR] = xe_memirq_enable_ptr(memirq);
 
-	regs[CTX_LRI_INT_REPORT_PTR] = MI_LOAD_REGISTER_IMM | MI_LRI_NUM_REGS(2) |
+	num_regs = xe_device_has_msix(xe) ? 3 : 2;
+	regs[CTX_LRI_INT_REPORT_PTR] = MI_LOAD_REGISTER_IMM | MI_LRI_NUM_REGS(num_regs) |
 				       MI_LRI_LRM_CS_MMIO | MI_LRI_FORCE_POSTED;
 	regs[CTX_INT_STATUS_REPORT_REG] = RING_INT_STATUS_RPT_PTR(0).addr;
 	regs[CTX_INT_STATUS_REPORT_PTR] = xe_memirq_status_ptr(memirq, hwe);
 	regs[CTX_INT_SRC_REPORT_REG] = RING_INT_SRC_RPT_PTR(0).addr;
 	regs[CTX_INT_SRC_REPORT_PTR] = xe_memirq_source_ptr(memirq, hwe);
+
+	if (xe_device_has_msix(xe)) {
+		regs[CTX_CS_INT_VEC_REG] = CS_INT_VEC(0).addr;
+		/* CTX_CS_INT_VEC_DATA will be set in xe_lrc_init */
+	}
 }
 
 static int lrc_ring_mi_mode(struct xe_hw_engine *hwe)
@@ -876,7 +883,7 @@ static void xe_lrc_finish(struct xe_lrc *lrc)
 #define PVC_CTX_ACC_CTR_THOLD	(0x2a + 1)
 
 static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
-		       struct xe_vm *vm, u32 ring_size)
+		       struct xe_vm *vm, u32 ring_size, u16 msix)
 {
 	struct xe_gt *gt = hwe-&gt;gt;
 	struct xe_tile *tile = gt_to_tile(gt);
@@ -945,6 +952,14 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
 			xe_drm_client_add_bo(vm-&gt;xef-&gt;client, lrc-&gt;bo);
 	}
 
+	if (xe_device_has_msix(xe)) {
+		xe_lrc_write_ctx_reg(lrc, CTX_INT_STATUS_REPORT_PTR,
+				     xe_memirq_status_ptr(&amp;tile-&gt;memirq, hwe));
+		xe_lrc_write_ctx_reg(lrc, CTX_INT_SRC_REPORT_PTR,
+				     xe_memirq_source_ptr(&amp;tile-&gt;memirq, hwe));
+		xe_lrc_write_ctx_reg(lrc, CTX_CS_INT_VEC_DATA, msix &lt;&lt; 16 | msix);
+	}
+
 	if (xe_gt_has_indirect_ring_state(gt)) {
 		xe_lrc_write_ctx_reg(lrc, CTX_INDIRECT_RING_STATE,
 				     __xe_lrc_indirect_ring_ggtt_addr(lrc));
@@ -1005,6 +1020,7 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
  * @hwe: Hardware Engine
  * @vm: The VM (address space)
  * @ring_size: LRC ring size
+ * @msix: MSI-X interrupt vector (for platforms that support it)
  *
  * Allocate and initialize the Logical Ring Context (LRC).
  *
@@ -1012,7 +1028,7 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
  * upon failure.
  */
 struct xe_lrc *xe_lrc_create(struct xe_hw_engine *hwe, struct xe_vm *vm,
-			     u32 ring_size)
+			     u32 ring_size, u16 msix)
 {
 	struct xe_lrc *lrc;
 	int err;
@@ -1021,7 +1037,7 @@ struct xe_lrc *xe_lrc_create(struct xe_hw_engine *hwe, struct xe_vm *vm,
 	if (!lrc)
 		return ERR_PTR(-ENOMEM);
 
-	err = xe_lrc_init(lrc, hwe, vm, ring_size);
+	err = xe_lrc_init(lrc, hwe, vm, ring_size, msix);
 	if (err) {
 		kfree(lrc);
 		return ERR_PTR(err);
diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
index 40d8f6906d3e..6d1c2f6c0559 100644
--- a/drivers/gpu/drm/xe/xe_lrc.h
+++ b/drivers/gpu/drm/xe/xe_lrc.h
@@ -40,7 +40,7 @@ struct xe_lrc_snapshot {
 #define LRC_PPHWSP_SCRATCH_ADDR (0x34 * 4)
 
 struct xe_lrc *xe_lrc_create(struct xe_hw_engine *hwe, struct xe_vm *vm,
-			     u32 ring_size);
+			     u32 ring_size, u16 msix);
 void xe_lrc_destroy(struct kref *ref);
 
 /**
-- 
2.43.2

</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
</pre>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------RqavkHVoc0Rni8jV1dkMWxPC--
