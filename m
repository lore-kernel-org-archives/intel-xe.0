Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A543D33995
	for <intel-xe@archiver.kernel.org>; Fri,  5 Dec 2025 23:36:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2746B10EBDA;
	Fri,  5 Dec 2025 23:36:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fVNzIwpp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0A3E10EBDA
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Dec 2025 23:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764977771; x=1796513771;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=NHbgj2lco/7PIVSLW40mBxBXFP5tGXcgduQiwrRB2Vw=;
 b=fVNzIwppae53jlob+lbXBQ6mlDfCpb2G3yr1sfsP2mJ03E516PuWu8HX
 2WZkTmcOeKW0rP5GucWJhLO6cQfXgS9XoaRXiOezLIaIY0SxlLJaivolL
 45V0SOyy+yNv5qMX0qMjtkO+Qje+Vj5J0yRs9SrHN68OaTPBLiF19dPQK
 JRCqESNGFSUCcX8pFTA1bsr4TdLSnHhVTPnrM7iD8tC7g/rN9V/CLGbpG
 Zy2LTUydHyDLY6QTuJK9vKV4X0+T5+KwdlSDK8fVAubwvuY8QYIHjKe79
 81jBZVV7Q2awdgWrlyJdAQSHcpm1ClHUCK1SZBgHK1/3AQHor5cbRIM6O Q==;
X-CSE-ConnectionGUID: WuGnmw0oTQCdu3G0vZLQww==
X-CSE-MsgGUID: xP4yMv2gQjOffhKLToMWGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11633"; a="70634412"
X-IronPort-AV: E=Sophos;i="6.20,253,1758610800"; d="scan'208";a="70634412"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 15:36:11 -0800
X-CSE-ConnectionGUID: ADVtZuP2Rc2DdTmQtJWkzQ==
X-CSE-MsgGUID: 92C4URSpTMul3vMwGepiZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,253,1758610800"; d="scan'208";a="195858502"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 15:36:10 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 5 Dec 2025 15:36:09 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 5 Dec 2025 15:36:09 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.1) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 5 Dec 2025 15:36:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WVzTjqkkr9t0ha5FasW5ZIx7NUhfO9bT8oK1ZIvGpB1O9c6Q4GNFfKD9jsonnhqJVg5UkCmxPblbL5uyIxPewDJ4lR7JM5CrYjrVQz53yJaXVLCmllUYfnieuPk1AYNAgfoItF3GeqO9sEzNsMa254AkKHkg5jimgGtK4Y0QyiQlL/w+5DsG5Mql2kuK2JDuP6EkJKZJ9TNjbwrbk/qCk4RK1AZGNM5sffqD9BbEyBtqCF0k2Gtmd1e5MhJNxFs5KIYRb5onsaveBl5HVLpBR9x0MNMkgvuCUNZs/pUzWVZnJwXi+JcB4+NN9xamVZjngESrVIlvJyb7vekl0eoB6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ff4uipWeexwqvIFgFm/2VnX3GsKvoWZoHCRKCCylD4Q=;
 b=w2gTa9Zz/VD6+OrZydTFKLti7ykf2JerI8qD0cpuTnY+n5olDt6qoDLJYauF3amaL/sHDKP1kckcQC96+grHS9lspKJtuzrsEX20NtrToB2RLV930bVl5mmR0Q1HidXH+WYE1W/RCfig+VbIDfi8D+1D7rNQlnLbLjk4GlJhbm+EKlgvpqf8GGlcXbrrqsWBr7rHh8XjZjT2bzp4/PHMID41jVTb5Xn/eUsVtDqsKBpPdXV+2lbEq/8UjGXzv/IEn5cC7moKTvCjso72buzo6suitgshbH5kzxuRopXz95roeaJoA+RwhMPKDe5Rga7Xy4dhLgDq2hGf+U5Cc1tvPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by IA4PR11MB9232.namprd11.prod.outlook.com (2603:10b6:208:56e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Fri, 5 Dec
 2025 23:36:07 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%7]) with mapi id 15.20.9388.003; Fri, 5 Dec 2025
 23:36:07 +0000
Date: Fri, 5 Dec 2025 15:36:04 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 3/3] drm/xe/oa: Always set OAG_OAGLBCTXCTRL_COUNTER_RESUME
Message-ID: <aTNsZNrsQDWgrATy@soc-5CG1426VCC.clients.intel.com>
References: <20251205212613.826224-1-ashutosh.dixit@intel.com>
 <20251205212613.826224-4-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20251205212613.826224-4-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR04CA0374.namprd04.prod.outlook.com
 (2603:10b6:303:81::19) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|IA4PR11MB9232:EE_
X-MS-Office365-Filtering-Correlation-Id: fe55dc43-3220-4020-0b32-08de34571019
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?azV1NUl6TUtNdnZkaVVOcGRSWTdtOWVaOGdqL2dPOHVTZVhjSG96NERsTWI0?=
 =?utf-8?B?YWNpNlhYSGFHMnNqaWRzUENkSHV3ekJuNEtUblJrS2xSTUNyK2NXa250dUlP?=
 =?utf-8?B?QloreHIwTEZ0c1FQM3JQeDNSQW5PZ1F1M29Mb0gwTVhmbWxhbDJjMzk2Z0wz?=
 =?utf-8?B?SlRiUGlEU1JJcmdkUk5NdFEzUGNsS0IrQlB2Tk5vd3BYTkxlUUlKSndyQnZM?=
 =?utf-8?B?MVBLWW5QK0VQaGVHSzB1YUxWbzg1dXVoN1FIR3owNGFVcHcxMlUwUGVDVExR?=
 =?utf-8?B?ZnhsM2U2eTVtRlBZVTRHYmRLc2FSVmt5eWF6T1BJMGZHNzVjeHdtWHJPSWM4?=
 =?utf-8?B?N3VWM1g0NTNzUm5sdUdjWTd2bWRnanFBU0hrdi9KM3JwTC9NRnJhUWJpTWxl?=
 =?utf-8?B?NmpkbXJxRzgvNUVDRWRKSkxhakx1VUN1bi9acGJWUUN2Rm4wZnNBTjNzMGNt?=
 =?utf-8?B?aGtvMTNLdUlYZ2Z5R1hodURSVDFBaWVKMjdlMm5lalFoeWNLeTlzU2JlK0JT?=
 =?utf-8?B?YUVySmxrUUVHZDhpdVA4ZzEvd1Z6eTkzbmwrRkg1SktHZXNJNStlSytuTGs4?=
 =?utf-8?B?bkFqWUlBUUxINDdWWk1ubjJYQTJDRFAwQkJGWS9ZLzZ0ZFl5eUNqbThVU3E0?=
 =?utf-8?B?djUzNlNwajcwUzl6Z3AxdW80SkZhcjFXb1NRcDJHV09yR284bUdFTnM4OHpz?=
 =?utf-8?B?T1dJMU1DUnJIOXYzREtZeVFBYy9HS0hrNFJaS2ZnUE1uWXh5M2ZRT2NzY0tN?=
 =?utf-8?B?YUxXejdLajBVTkVCVjhBcFgvSlVuS2gyTEkybG1XK1lpREwzd2V3WEhlaGM0?=
 =?utf-8?B?NTZocmdiSXUrRWNTRlJGMWxpQXpSUmNxWjRsb3N6cUdmak9JLzFxNkRoWEtU?=
 =?utf-8?B?ZkhrRlNTWm5vSWVCdnlkOTd5SWtCbTRyWHdFQ2JSdTZ2MHBrTGdiS3piU3Iv?=
 =?utf-8?B?ZmxCTjdTUTMzUEM0TlJFYXBkbVE1RUd4VXhGU2k1bTRmMU1velNQakU1eUZw?=
 =?utf-8?B?TlVtMTVKcnNUdlZYK0t4eHpJUEdFUjJHVmZBeG5vbXA5djZMeWsvc1kySDRy?=
 =?utf-8?B?cVNpZHRqUTNvT0R5VUNWT2dGeTFZVTFrekZpcjFDdm1UNk9ya0lRZXBjRzhP?=
 =?utf-8?B?d1kwb1Q3N1NoOWN1bG0rcXZaMnlRYlY1OWlXbnhoNjlMVFJtcFpGbzdGemFy?=
 =?utf-8?B?ZmJwYXdrT2N1SFN3TVdYaHFjZUJrQ2F4WEl5U0t5OExMU0ZYSGo2TWY4V2hQ?=
 =?utf-8?B?cnVWSUQ4N2ZGUThKc1ZwS3RLankrVmJUMm1SMDhKM21hbjRIbEdVMjU1S1FG?=
 =?utf-8?B?TDZmVjd4OVFIMzM4QkRPa1FuaUNWZ2Z3bXhxbXdROVpVQkRSaitUQVYzUys0?=
 =?utf-8?B?SHd6aXZOWmhmYnIrY1ZVbVF2ZmI0MENGYmh6dUN2Vkh2bzNRUDQ2N1ZGL3Vl?=
 =?utf-8?B?TjEvUkdrR0x6K3pFbTM5NkFoczJjUnFLeW80emVMQnRyTFU4L3lWSUVoczBh?=
 =?utf-8?B?WXd4bkNKVHZBU1dTZVljVGFGdDgzRlE4anpJVUhYTUZWUDJSc0w5Z0Vqa2Rh?=
 =?utf-8?B?YW93eVprVlFvT3orR1kzb0ZNVWhNWGI5L1RQU2tCWHVYSlBQZ2sxaW94aXh1?=
 =?utf-8?B?WVpUendPdm9FTlJvV3J5WURibHVWM2MvRGo5MG9qaXlROTdEc0xMQUh0NTFN?=
 =?utf-8?B?REw5bWlpMnFNc3h0K2Njc0prOGE4Ulo1TmI4dDRhd3VpZ01BbDZrVm5icTJi?=
 =?utf-8?B?TkJmaWxNeGdNQjBvQ1FqMFJHWks5NURaNlhTOXg4WjA1QUpRUG5nUlhhREVI?=
 =?utf-8?B?N1lpSGZCQk04VWsvUUdpdUhXQ1lOMWVRSkRkb3YzdmEranpzVHovcWk1YmR6?=
 =?utf-8?B?T2Fhc3pBdkFqWDhnN0lpdXlqeGw5Y2RzQVo0R2U4dUdZemRoOEZCZXhTbDBz?=
 =?utf-8?Q?SI8rNmf2FShYF3/TCQhvsagLkbl6NMk4?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Wkl4N3UrZTlzeW5zYWt5alk2ZkZBYVNXR2xQeEJPSnJiaHk5RW5YTkZPdXh2?=
 =?utf-8?B?ZzZ0dHBnVjlIcm9wVXJsNjhZaE1WSzQrUG9yS1R1YzllNGNBSzNHTzdZSzMx?=
 =?utf-8?B?MUIveHBialgrSm5GSDhhZ3JGN29OMEU4N0c3ZTJjTnF2a1BtbDlWR2JSZysv?=
 =?utf-8?B?eXFEVVhQelFBRzA0UGIwdDBuTE1CU0s5bGNoTHRWbnF5OHF1UG5TWmtIUmt2?=
 =?utf-8?B?MGdiMTJnVzFtZGVNT2cxMjljVEl2RXdGUkNiZWFQZEtETlJLdmtmbU0yOVBS?=
 =?utf-8?B?VUMrLythN240MGsvYUZOM1h3K0w5N1YyZ01tclVPU0g5OGsyZjRzcXZBemVT?=
 =?utf-8?B?MjZaSWdWN2NSZ3BxNENhcE5tMnFPbWZ6dzFxdGdWR3dnaGkzeHJrcllpb2NY?=
 =?utf-8?B?RVJMKzdINTlJa3pRbWkyZmtnOSs2R3ovUkJQdnMyTGoxZ2Y4SDQ1OFY1S2RZ?=
 =?utf-8?B?SG9IczE0MWR1T3NYMk9CZW0xeGxwWDdEOFkzb3FVZzhkbCtKNWZCZzFyRzJh?=
 =?utf-8?B?WEVuRXZyL3pudG1rb2hzOVA3VjZFVSszK1NxTFp5YThZKzRScU5xei8vUmRk?=
 =?utf-8?B?dTRES0luWXFBbERYS0I1Q1JDK0dpUmJtMmpkS3lNQnc1ZDJ1QnpGeTdtTUly?=
 =?utf-8?B?bUdhWkU1Rkw2VWZBSkZHNlNnQk5UT0ZiUTY3ZDNxUDZqMmxhQ1VXYnloVDNR?=
 =?utf-8?B?VjJJR0dNdVBPdkswNHpBRG0wQzRkb2sxditQWTVQRFQyTlVXV1dJY1JRcFlJ?=
 =?utf-8?B?S3oyb2xJbEJhbXZGZzdBaTE2bXh5b1hCNkJTdzNESnR4Vi9uRUx0U3BOM3l3?=
 =?utf-8?B?TDZjejMzakJtaVQrSDNJZVkwUjhhaXR3Yk5Fa3drNTlHWUNUOEJyUk9yalZn?=
 =?utf-8?B?MVhWM2lSV3AwQ3NwblltWVpta3VlOFdTbVlEOFdKcWxNaUFYd25UdnVhdkNr?=
 =?utf-8?B?NEVDa3hPamd1eDROZmk1WkRTRkZnWFF6QVFXeldXT3JkOXFHY1VFdTgyV3RB?=
 =?utf-8?B?RmFrNjd2YzJTeGZ0MDNidm5WaU9Wc3F2MU5RcEVPZTZBaXNMemZkUW13S1hT?=
 =?utf-8?B?aGY3bzNCbDZSTTRtMktnMkh1djkyS2k4T2Y3TURUZmJlNitranp5Y1dDVm1j?=
 =?utf-8?B?WmFUUnBaZDZNeEVqTVdqQW5Bem4rN0tlQUtidmRJb25TNjh6bmw2MGplYWFs?=
 =?utf-8?B?cjJ6dk1ZTVJ5ZGlLVS9CbENtTWtZS0FsT2kzQk9rQWFuZmhESFJPRStiWUR3?=
 =?utf-8?B?ZE05V1N4TVZnbHd0amMydFBHUVpvekJ4VXdZemVzSjJoK0ZFdHQ3a096VWpQ?=
 =?utf-8?B?cUVvYUw3S2dqMGZLWnBGR0czNWltcFJiUWtLQjBnVFRRQjRBbFNNME5FaEVM?=
 =?utf-8?B?QjRzWThhR1J6aDg0ZHNBWWVlQ3FmKzhKeXhnajVaQjhHTElUU2RRVVRTMHlG?=
 =?utf-8?B?QmdNTjE3dnpIZU9YN2REQ1VValYrNm5NTkp4SFlQMm1uT1V0UzNCWTUzSzlO?=
 =?utf-8?B?L3FrTGZRSXJaS2dReTd4TG9vSW1RUTA4MXBQc0JuUmZJUXAxaDBRMWxYWHl1?=
 =?utf-8?B?RGhLT3JmNXVCQlZwV2k1bERpdWJLOTA1QzJhTWs0d1RYMjI3UGQ3d1hNTU9B?=
 =?utf-8?B?cy80R1dBTzAxSHhIaUx4UGVEcFhVQUJiZzNGcWFlVjRZaVlLdFZWTXlzTkZY?=
 =?utf-8?B?S3JrODBYaTI5cnI2Qm5wbUhKSGxRT3I4RXJOYjJRZTVOUEFUWWphZFZmVDdK?=
 =?utf-8?B?cXZwY01Qb1psL1loMHF2cHh6a0xJRGZVWWNyQ2ZGNG40V3I5dUZwbUphdWo3?=
 =?utf-8?B?WThHYkZhSjhnZVdlVnJvakRtcHVxMklDQlRQTDNvaVNIT2wzUThzLzZOUXVN?=
 =?utf-8?B?OWFMdEJJUzEyNlZIbDFxYWsyMi9MUC9QOHU5aEFNTlpuRklTNDRBdXVqeGhh?=
 =?utf-8?B?NTM0cjQvSi92LzZXYVBaays5MHlZemszZmo3azh4QnlqRDNNYm5BUldodVUv?=
 =?utf-8?B?S01DU1R5TEw3TjZ6dlhOcWErSDJRdkFCRlZzT1NBSVN6SE85NTlCTW51cGQr?=
 =?utf-8?B?TC9NdXhwSGxzMXJTMndXUSs2a0oyMm9xRlM1N3hJRnlyL3JqTUJ5aHJ3NVBW?=
 =?utf-8?B?cFAwMjFnVFVtL0pLWndkMTdiZWUzNGVITHYyRWJ6VnVOd2VKVjNwdVNNaDFH?=
 =?utf-8?Q?VkfW9ZcAq+goItVn9BHqwNc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fe55dc43-3220-4020-0b32-08de34571019
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2025 23:36:07.1249 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FiPz4FXVMuS2xOKjoFr4Wld4vjYbLwFg3iudY52s0BABHoUNNH+kMR2IWSBurtkfgHUVBvVEXoE1uGUEELnFxXBUcas2RFjPlNUPthUEo8c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9232
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

On Fri, Dec 05, 2025 at 01:26:13PM -0800, Ashutosh Dixit wrote:
>Reports can be written out to the OA buffer using ways other than periodic
>sampling. These include mmio trigger and context switches. To support these
>use cases, when periodic sampling is not enabled,
>OAG_OAGLBCTXCTRL_COUNTER_RESUME must be set.
>
>Fixes: 1db9a9dc90ae ("drm/xe/oa: OA stream initialization (OAG)")
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Thanks for fixing this.
Umesh
>---
> drivers/gpu/drm/xe/xe_oa.c | 7 ++++---
> 1 file changed, 4 insertions(+), 3 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
>index 7846dbc32542e..44140722febef 100644
>--- a/drivers/gpu/drm/xe/xe_oa.c
>+++ b/drivers/gpu/drm/xe/xe_oa.c
>@@ -1105,11 +1105,12 @@ static int xe_oa_enable_metric_set(struct xe_oa_stream *stream)
> 			oag_buf_size_select(stream) |
> 			oag_configure_mmio_trigger(stream, true));
>
>-	xe_mmio_write32(mmio, __oa_regs(stream)->oa_ctx_ctrl, stream->periodic ?
>-			(OAG_OAGLBCTXCTRL_COUNTER_RESUME |
>+	xe_mmio_write32(mmio, __oa_regs(stream)->oa_ctx_ctrl,
>+			OAG_OAGLBCTXCTRL_COUNTER_RESUME |
>+			(stream->periodic ?
> 			 OAG_OAGLBCTXCTRL_TIMER_ENABLE |
> 			 REG_FIELD_PREP(OAG_OAGLBCTXCTRL_TIMER_PERIOD_MASK,
>-					stream->period_exponent)) : 0);
>+					 stream->period_exponent) : 0));
>
> 	/*
> 	 * Initialize Super Queue Internal Cnt Register
>-- 
>2.48.1
>
