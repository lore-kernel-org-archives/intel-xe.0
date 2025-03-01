Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E311C282C5
	for <intel-xe@archiver.kernel.org>; Sat,  1 Mar 2025 01:00:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B85810ED6E;
	Sat,  1 Mar 2025 01:00:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="isEvgjLL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EC8E10E0C9
 for <intel-xe@lists.freedesktop.org>; Sat,  1 Mar 2025 01:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740790848; x=1772326848;
 h=message-id:date:from:subject:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/3BpsY4y+9Enmtvi+dp0sc3j6MWgVtq/UAN9lrz+eKk=;
 b=isEvgjLL/XLfPeWCvKSXiLnsv6LJNFIH865/HLR2EAZahRshSBv54SeQ
 gRX9KVChaEyj4/WGiz26J5Ys4R5jfn3HfdvWGCAIiGn7abtX/smT48v9F
 nccVshzzn7Fs5XJx2iZNN1JPvTJERq9hNaDee9v5ZpdjKxb/+ok04+JsV
 N1Y6pnl40wdSPvM9lOpzU71RfnwTkLycoVQDzaQ61tvukxqB54Cw9iJ8a
 8Njw6zO6PdkDsMLMNA0Z2OyE/QqwKeYLFCVGmeuGcPPtrlkW9RZ+lTkU2
 OiVW6DDMVqT1Itcv2iMpazibMMG/n6Ww0JRUTlYL7d9MxVHgWub5ggkSd Q==;
X-CSE-ConnectionGUID: 3WhTduvIR/q4JoM7jPTWjQ==
X-CSE-MsgGUID: /iMaa6teSUSKlVgOs62ViA==
X-IronPort-AV: E=McAfee;i="6700,10204,11359"; a="45651332"
X-IronPort-AV: E=Sophos;i="6.13,323,1732608000"; d="scan'208";a="45651332"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2025 17:00:43 -0800
X-CSE-ConnectionGUID: tzn3b7V/SdaWjijVEVcRCA==
X-CSE-MsgGUID: w8ClmaUSTRacrSzRS8si7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="117339207"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2025 17:00:42 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 28 Feb 2025 17:00:42 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 28 Feb 2025 17:00:42 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 28 Feb 2025 17:00:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sXXFb0rvLWA22clTifryNSBO4aZ2YT6uZMk3IA+KN8iH/p6JP4i0qgRnqolLXwYFet33CoUphnpG57HI/X/sUtMd0iwyGuISqsXZ7RAYCO53Wf3gOvgzCZFiyiUMVng+p5Wfv30anlI1q43vk84gX3w4u6Cqgbs95o0E/z4fU+DMCc+i1TU1nTrvP7S2WTtwRuezWBOQOGBGpgytANYUBqr3itg8KTsVjAYYbP0oXLrT1Kqrhi0sqdcw9b7ehloF/NRQZ5i3/splKWIVTNUcZEitfsUN+C7ttODPPwmrWirmnv7AM669P7xi3OkldtEXEX+eaBSkUdbOSo18VGTogw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0z4UdwSQA/CYNYsm9D2H/fsYDeZU9EWj2/F8hACu7/w=;
 b=vsNzD5oMqngCP8HDDraRNYhAJ1nP7fd8PFj/WCZ9SzSodX7MtEOL0VVYxmXolGfow/2cFggO+nZARlsGlN2mroUJeXf2zlR2FMJos+YSwEwblLPcyk8culqPXuYgxq90GjzbmSBcxalq9RcW+ApdWEiVpIdSLfPx5Q2ttr64zFEcWSbDOkjlUVWDgr/5bJM4CE0qbMe+7kfFgfV9MhSlU6o1BR5TILy3MIsCVxcxghL0rpqbw0xiMsxpk6lSXtP2Cn/7YhtKOftJU3QyEOUay2JW6zcW4hKKTcC1A7tc5FFVcsmLvSNBr8H0wkPF1+KufS70OruVwR480B86ix8U5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22)
 by PH8PR11MB6832.namprd11.prod.outlook.com (2603:10b6:510:22c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.20; Sat, 1 Mar
 2025 00:59:59 +0000
Received: from DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1]) by DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1%5]) with mapi id 15.20.8489.018; Sat, 1 Mar 2025
 00:59:59 +0000
Message-ID: <d1a12315-878d-4186-aed9-c84662a1a81c@intel.com>
Date: Fri, 28 Feb 2025 16:59:56 -0800
User-Agent: Mozilla Thunderbird
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
Subject: Re: [PATCH v3] drm/xe/pmu: Add GT frequency events
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Riana Tauro <riana.tauro@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20250213000220.3510885-1-vinay.belgaumkar@intel.com>
 <45qgg5bemip4eihjl6bpen5hbi7babw2itp66q3gjmej2lvs4z@gg5bp37gcweo>
Content-Language: en-US
In-Reply-To: <45qgg5bemip4eihjl6bpen5hbi7babw2itp66q3gjmej2lvs4z@gg5bp37gcweo>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY5PR03CA0003.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::13) To DM4PR11MB7757.namprd11.prod.outlook.com
 (2603:10b6:8:103::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7757:EE_|PH8PR11MB6832:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e36f763-c521-4750-8d1c-08dd585c63a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UWIzSGtmQ1YwdFdBZlJFUVM4enprS1I5UTY3TTZ6TkJKY2YzZUs1ZjFsTnh2?=
 =?utf-8?B?SU1ZZi9GMEVWeUtVY3lMMUVWaDRnMzRTNHJOVW1zTjdsZWN0bk0xR1BHcnBm?=
 =?utf-8?B?NzQ2Z1lud1pJMjhwaXhBT05LNG12bFkyMWNSSHY4MU5RN2J4RkFrajFlUW0r?=
 =?utf-8?B?L28wTFRnbzlzaXg1VDBUWVBSbFBLNktDazMxSDNpbUoxRVZtSHhCaEVIay9L?=
 =?utf-8?B?UVdOdEdsODIvMklMTlluTUZiYUF2dkMwOTEyV01FYnhPcGZPVnNHMXg3cEEx?=
 =?utf-8?B?R2IwNGw4NFVRYXNaZ0FKL2tvUzlicXk1Y25LVkZFODc3bkFqalVobG9ITlVU?=
 =?utf-8?B?dHlzYjBaRlNNSUg0elRHRng5KzlZY3VKWlhNcGZtU1YyZWJ0eVV4Vyt1R3ZY?=
 =?utf-8?B?ckFKRjZoZzN1NUVSUVJOQXdiNGkwczFyMW1RKzNockU2eGVzMTd2Y2NlSUNu?=
 =?utf-8?B?L2ZNN0VVUWdpTnUzZ2Via05hNkVQOE1lMkp6MUIvNDRaemlHdUJ2dDNjRENY?=
 =?utf-8?B?emxBSUtzZjNuSldzRldPWDE3ODErREd2NHRqQVJTRG1NN3F0OW5XWTN5S2lw?=
 =?utf-8?B?YUpNZC9oZVZzOTJyd3RpTUQ5ZUhwTEtVc2lTQVJqQllxdU9DT3M5Y0plUUZC?=
 =?utf-8?B?ZG9XNmhyclBpaGV2c0tKY0Y5Q285YUxidzQ4NzBmQlQ0RmNYWU5xb2tINWc2?=
 =?utf-8?B?V0JWZ2IxeTBBTm5qNkJzMm5hcVU3VVlUOWhQM1VWdXZ5VnlteWNJeitXbThK?=
 =?utf-8?B?eGlyZEZkaFFoOURQcEZyOUlsNlZHengzdDFCUTR2c0I4UDdKZ3YwcFE4WFFG?=
 =?utf-8?B?ZWtVN2t1K1FsczBvNTJFYWhyWEdReEk3TmNYTGtRV1B3WnhVSFFvRms4MjhJ?=
 =?utf-8?B?WG9oRzdnaGU1N09Oa3FTOVFzRGFnTDBESm9wb0Q1cGFFcHpqazl0bWtNYkFK?=
 =?utf-8?B?ZElhN1NzU290bUdFY0JpZjlkSGd5UnNkUVFVc3doTHo4YVlaWFF4RlBtMERW?=
 =?utf-8?B?WERKa3U4Ny9hZ3JhZnZBL1BYYnNydVZNZ1M5Vll0RnpRMCtGU2F4L2pRYXo3?=
 =?utf-8?B?QSsxalY3aDc4YmNobXoydVd1eXpkUE9PZk50MXR5MnIvTjN2RDM3THR2OU5n?=
 =?utf-8?B?czBuNVhoRUZNYXpoaldybVN3cHVVVUk0YmpNZ2xQUVFpaTJvbTF6YitoSHZR?=
 =?utf-8?B?NkhtMkR6dm9DaVdzTGMxNUtwMnRzZmRsRjkvT1Q2VGxQZGhQblZtaUkvNVov?=
 =?utf-8?B?dWlIS2x2aGlsUENvTlJYLzBYZG1DUmNCTGJtM1djNDRaYUhjRldTRzE0ZHJa?=
 =?utf-8?B?NlNRYzhlY2NKc0dqaUZRb1dUUHgzUXIzQXBwdzBxZFg3LzlUWlpZUXM4L3hI?=
 =?utf-8?B?UVVlaTZVeWlLcXFmaFBML3J1K2hXZ0luMTRvTWVkTnhUNCt5a2Nad3RhMmUw?=
 =?utf-8?B?WUU4N2ZSY1o4OXFOQlQ3QWprOXpnR09iRXpGVWFlOHAvRGp6SUd3ZDVGN2R4?=
 =?utf-8?B?T0x6RmtsUmR4ak45U2RKKzQ3eUE5ODdudmFSaVc3NlM1NVg5WWVudWpKUzdx?=
 =?utf-8?B?S0l2TWlEV01lVGM5RnFxbzlhVkhWRFdsT0l0SXBYK2loYWxjNmF2ZnQ0ZzBO?=
 =?utf-8?B?cWU3eGg5cUlPS0RpRmhyV3FXVENUZlg4QVBaQm5aS0ZjVEFPZSswdkRGMHY0?=
 =?utf-8?B?OVRlQXdTL3Vmd1JYbE4xc3lIaHdVQk1EdXdCYThIeGdJaUdiaEcyV1h4QXo0?=
 =?utf-8?B?STNUeS9lWEdsYWltb3JlRE9MazdtRW9RWnFiSVRYZDNXa1BnQkRvUTUwSWhs?=
 =?utf-8?B?MUw4cktscndSYXg5Z2krdXRVSkt0MC9IdUY5b2VaMk4yOFUzOFhJVG1SVkVZ?=
 =?utf-8?Q?NdCY315SjOhCz?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WDlIUkFHRU5yYmFMTkN3NE1aRmoydGNWVzFlNE5MVitMODNaZ0hMR2ttS0tJ?=
 =?utf-8?B?c09jNkhENWtVdWZUMTdNaWlrOW1DeEQ2dGlwRi9zWUMxcC9lZjdQWUFuMk50?=
 =?utf-8?B?VFdlQytSU29HakFJTk96aktqU1V1bHhZMGVxclRpeDFIMVJ0bE9DTFRJdEI0?=
 =?utf-8?B?NnVaU0xSMjJ0VmMyS1JXalVrbU4vVkJ5MWNwNDBoZk9ZYmxYWlBxUFh2dnlP?=
 =?utf-8?B?UDlZSUhsYnhOSXRSNnJaRVZlMTQzK1lWcGdWZmFiM01MQm9HMkVERVRUOTdu?=
 =?utf-8?B?aXpTd1Z0OUl3cXU5TjFSNHlYZFQ0eXF4UnR5N2dBeURuYzg5ZzJTNXpBRlVn?=
 =?utf-8?B?d3lhaUE5QW51WGVtSzZwbytMWHoxaXhPS3o0VmdvT0MrT2xsQzVFUzF2WTEr?=
 =?utf-8?B?VmlLSHZvNWYvb0ltVTB3SE94VUVMcCtoRWxnL2hnb1BoY2x6QWZ5QUtZQWky?=
 =?utf-8?B?dkt6czFKZkhWYUZMUnZWTlE4bXNUTlVlWEpDcFB3ejFrdW9HNEpRUkRTL01X?=
 =?utf-8?B?NEsxUFdMR3FhVVE0cXhrSTRmM0gvb29IaWZjblp4RjRNbUV6WW1GSFFuVnRn?=
 =?utf-8?B?dmNpRVVLYTI2WldPQStaWVZRMzc1WXdZRDhYdTV1cTNPRC9Wc3FQaDh4dHF1?=
 =?utf-8?B?QUMxV3pzdjBQSi8rcDEvWjVtT2kwTzdrZGdIUGVab1VWaWljenlnVWVvYmgy?=
 =?utf-8?B?QS9tbmJJVUVra0YwTm1EVlAxK3hILzhMYWZQdEpYbjlXem9rVWorV0tBVHMy?=
 =?utf-8?B?WVlqbFNWQ3MvRDlsTHVBaW1RME91YXAxVTl2eHpMOUczS0QzZTZjMlc5UWI2?=
 =?utf-8?B?ZDRESVN4U3lmSnJzdmcrUjNqcUltT0dPakkwVWhkM3U1WkFmUXlJbENxa3F2?=
 =?utf-8?B?eFhLaDZ1NUY4WFFSdGd6VGJYMkRnWmZsUXF5NXk2TmtoWXVOWWsybXE4RkNq?=
 =?utf-8?B?OW1LOExoMG4zUkNjS1JEbllaemIzcGlLR0FwaXRacEhicnRQMGpmWWJhTG1Z?=
 =?utf-8?B?MGJOd016eHFEKzFWNDZ5a2J5WEljRXREUWh2NWFSK0xwTmxXL2xSbGFGVS9S?=
 =?utf-8?B?TW16ZXRwRy9IWmZycDZrZ2JZY1J0b0dqb0ppTFNLNHNJUlZnY2xINHI1ZGp5?=
 =?utf-8?B?WWhSaVRFR2d2R2dlQUplb25tOFJuZnYyZTM0djV0T2tUZ0R2aUtkamN0TG5S?=
 =?utf-8?B?M2l3TWtUendSTXJQUDh6STd0aisrMWJoQ0VsVHhXV0FCelM4aHJoMTVoVC9x?=
 =?utf-8?B?TUhmaXJDY1dKK1JpcytsK0pxZmR1SVZFdWNZaklWMWVLVjE2T1puM2hwVlVY?=
 =?utf-8?B?M2xQZktoL05kbDhyTktpeHY2L2xIandONno4YUdrM3BDV2RPNUh0N05rdDRO?=
 =?utf-8?B?dnRjV3VvMTF2d1RGeENlYWhSRjN3aG9MNlk1L1hnV0kxNzRGMU5LY3ljUVFD?=
 =?utf-8?B?WWQ2aTh0WW9tTkFiVkQySFlRNXFtWE85M2VTbkl0cTA4cnl2TEJxd3VOdFVu?=
 =?utf-8?B?SU9KbnNwdjFMZFhKVG1GN0dnTDJVVFd4SGw3UXIwR3FCRzlTSFc2VjlaWU8y?=
 =?utf-8?B?VlNRNzF0UDBGYWs4MjFwYjFGNnZ1WmVvMnBRYnNWTlBGRzV0MmlKWUJrTThW?=
 =?utf-8?B?Y2xiemU0YXp5NGRmS2tMejVDZGYvdWNBRlc1aEwzTThFNlh3ZjA0WEN3NVVq?=
 =?utf-8?B?My9tYVMrVzJUOU5yZmIwM0VhSGk5MXNsWUo4S3A3VVVoYyswOGdNak1xZEUy?=
 =?utf-8?B?dmRVVHZTT0JpU0FGR3hpZWFXSk5YNXYvc2FVRGJXbU94QXRJdllrWVpCSDA1?=
 =?utf-8?B?cEVKYkcwdUlVdFJEbll2SWFhNEdJR0hSck9pQ3gxUEFOTmRNd0VJdHVZeCtY?=
 =?utf-8?B?STM0WEx1R0ZEdWZ2TmtEWXk1TWx3bkdSSVZLbVNWK2Fic3ZKenpmVzVJaWRI?=
 =?utf-8?B?V2doSmFsbU5xYVlVaDkzeXZKbHluRjdJSU5Lem0vdkRCNzZmdnNsaHAvSjBm?=
 =?utf-8?B?aktuV0t3YVZleEQzYUxpQk85K2c1azVzRkxjVEx2amlLZkNVVWZwQlZnRC90?=
 =?utf-8?B?ZU5yTEd1ZGlXTWNhaEduL0JkU0Zxd2NTVFZZb1JrbnZZeEp3VVMxME00Q3g2?=
 =?utf-8?B?MmNEbjdLNStDM3R2UHJ2REFxOFIwVVZFRjBLVnpJMlJqeDJZaktxYUdNK0hN?=
 =?utf-8?B?R2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e36f763-c521-4750-8d1c-08dd585c63a4
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2025 00:59:59.0760 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ImQmgPTiWyKQDkd3KdbAX6ZT3y9yXB0eyLE1arGMiYKdLQV6zEz0xGCvItcrDhXKUy4xcxUS0QZ3V8CqSqVk6E7cyJZqpna2IzEMdw6L914=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6832
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


On 2/25/2025 9:47 AM, Lucas De Marchi wrote:
> On Wed, Feb 12, 2025 at 04:02:20PM -0800, Vinay Belgaumkar wrote:
>> Define PMU events for GT frequency (actual and requested). This is
>> a port from the i915 driver implementation, where an internal timer
>> is used to aggregate GT frequencies over certain fixed interval.
>> Following PMU events are being added-
>>
>>  xe_0000_00_02.0/gt-actual-frequency/              [Kernel PMU event]
>>  xe_0000_00_02.0/gt-requested-frequency/           [Kernel PMU event]
>>
>> Standard perf commands can be used to monitor GT frequency-
>>  $ perf stat -e xe_0000_00_02.0/gt-requested-frequency,gt=0/ -I1000
>>
>>     1.001175175                700 M xe/gt-requested-frequency,gt=0/
>>     2.005891881                703 M xe/gt-requested-frequency,gt=0/
>>     3.007318169                700 M xe/gt-requested-frequency,gt=0/
>>
>> Actual frequencies will be reported as 0 when GT is in C6.
>>
>> v2: Use locks while storing/reading samples, keep track of multiple
>> clients (Lucas) and other general cleanup.
>>
>> Cc: Riana Tauro <riana.tauro@intel.com>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>> ---
>> drivers/gpu/drm/xe/xe_pmu.c       | 211 ++++++++++++++++++++++++++++--
>> drivers/gpu/drm/xe/xe_pmu_types.h |  29 ++++
>> 2 files changed, 230 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
>> index 3910a82328ee..ed76756403ea 100644
>> --- a/drivers/gpu/drm/xe/xe_pmu.c
>> +++ b/drivers/gpu/drm/xe/xe_pmu.c
>> @@ -8,6 +8,8 @@
>>
>> #include "xe_device.h"
>> #include "xe_gt_idle.h"
>> +#include "xe_guc_pc.h"
>> +#include "xe_macros.h"
>> #include "xe_pm.h"
>> #include "xe_pmu.h"
>>
>> @@ -37,6 +39,17 @@
>>
>> #define XE_PMU_EVENT_GT_MASK        GENMASK_ULL(63, 60)
>> #define XE_PMU_EVENT_ID_MASK        GENMASK_ULL(11, 0)
>> +#define XE_HRTIMER_INTERVAL_NS        5000000
>> +
>> +static struct xe_pmu *event_to_pmu(struct perf_event *event)
>> +{
>> +    return container_of(event->pmu, typeof(struct xe_pmu), base);
>> +}
>> +
>> +static struct xe_device *event_to_xe(struct perf_event *event)
>> +{
>> +    return container_of(event->pmu, typeof(struct xe_device), 
>> pmu.base);
>> +}
>
> we shouldn't add refactors like this in the same patch you are adding a
> new feature, it creates noise in the patch and makes it harder to see
> what's going on. Please drop both event_to_pmu() and event_to_xe().
ok, will add as a separate patch later.
>
>>
>> static unsigned int config_to_event_id(u64 config)
>> {
>> @@ -49,10 +62,12 @@ static unsigned int config_to_gt_id(u64 config)
>> }
>>
>> #define XE_PMU_EVENT_GT_C6_RESIDENCY    0x01
>> +#define XE_PMU_EVENT_GT_ACTUAL_FREQUENCY    0x02
>> +#define XE_PMU_EVENT_GT_REQUESTED_FREQUENCY    0x03
>
> this will need a rebase
yes.
>
>>
>> static struct xe_gt *event_to_gt(struct perf_event *event)
>> {
>> -    struct xe_device *xe = container_of(event->pmu, typeof(*xe), 
>> pmu.base);
>> +    struct xe_device *xe = event_to_xe(event);
>>     u64 gt = config_to_gt_id(event->attr.config);
>>
>>     return xe_device_get_gt(xe, gt);
>> @@ -70,7 +85,7 @@ static bool event_supported(struct xe_pmu *pmu, 
>> unsigned int gt,
>>
>> static void xe_pmu_event_destroy(struct perf_event *event)
>> {
>> -    struct xe_device *xe = container_of(event->pmu, typeof(*xe), 
>> pmu.base);
>> +    struct xe_device *xe = event_to_xe(event);
>>
>>     drm_WARN_ON(&xe->drm, event->parent);
>>     xe_pm_runtime_put(xe);
>> @@ -79,7 +94,7 @@ static void xe_pmu_event_destroy(struct perf_event 
>> *event)
>>
>> static int xe_pmu_event_init(struct perf_event *event)
>> {
>> -    struct xe_device *xe = container_of(event->pmu, typeof(*xe), 
>> pmu.base);
>> +    struct xe_device *xe = event_to_xe(event);
>>     struct xe_pmu *pmu = &xe->pmu;
>>     unsigned int id, gt;
>>
>> @@ -104,6 +119,8 @@ static int xe_pmu_event_init(struct perf_event 
>> *event)
>>     if (has_branch_stack(event))
>>         return -EOPNOTSUPP;
>>
>> +    XE_WARN_ON(id >= XE_PMU_MAX_EVENT_TYPES);
>
> I was going to say that we don't need the other ones. But then I noticed
> XE_PMU_MAX_EVENT_TYPES == 64, which is a lot more than we currently
> support.
>
> I suggested it before, but what's the issue of keeping a linked list of
> the events like rapl_pmu::active_list?
ok, will add the active_list. However, still need the 
XE_PMU_MAX_EVENT_TYPES, since I am storing the samples in an array based 
on event_id -  u64 event_sample[XE_PMU_MAX_GT][XE_PMU_MAX_EVENT_TYPES].
>
>> +
>>     if (!event->parent) {
>>         drm_dev_get(&xe->drm);
>>         xe_pm_runtime_get(xe);
>> @@ -113,16 +130,50 @@ static int xe_pmu_event_init(struct perf_event 
>> *event)
>>     return 0;
>> }
>>
>> +static u64
>> +xe_get_pmu_sample(struct xe_pmu *pmu, unsigned int gt_id, uint32_t id)
>> +{
>> +    unsigned long flags;
>> +    u64 val;
>> +
>> +    raw_spin_lock_irqsave(&pmu->lock, flags);
>> +    val = pmu->event_sample[gt_id][id];
>> +    raw_spin_unlock_irqrestore(&pmu->lock, flags);
>> +
>> +    return val;
>> +}
>> +
>> +static void
>> +xe_store_pmu_sample(struct xe_pmu *pmu, uint32_t gt_id, uint32_t id,
>> +            uint32_t val, uint32_t period)
>> +{
>> +    unsigned long flags;
>> +
>> +    raw_spin_lock_irqsave(&pmu->lock, flags);
>> +    pmu->event_sample[gt_id][id] += mul_u32_u32(val, period);
>> +    raw_spin_unlock_irqrestore(&pmu->lock, flags);
>> +}
>> +
>> static u64 __xe_pmu_event_read(struct perf_event *event)
>> {
>>     struct xe_gt *gt = event_to_gt(event);
>> +    struct xe_device *xe = event_to_xe(event);
>
> gt_to_xe() avoids the additional helper and you don't even need it.
> You are intested in the pmu, not xe... so you could just have used
>
>     pmu = container_of(event->pmu, typeof(struct xe_pmu), base);
>
> ... like is done in other places.
ok.
>
>> +    struct xe_pmu *pmu = &xe->pmu;
>> +    unsigned long id;
>>
>>     if (!gt)
>>         return 0;
>>
>> -    switch (config_to_event_id(event->attr.config)) {
>> +    id = config_to_event_id(event->attr.config);
>> +
>> +    switch (id) {
>>     case XE_PMU_EVENT_GT_C6_RESIDENCY:
>>         return xe_gt_idle_residency_msec(&gt->gtidle);
>> +    case XE_PMU_EVENT_GT_ACTUAL_FREQUENCY:
>> +    case XE_PMU_EVENT_GT_REQUESTED_FREQUENCY:
>> +        return div_u64(xe_get_pmu_sample(pmu, gt->info.id,
>> +                   id),
>
> keep in the line above, it doesn't help readability.
ok.
>
>> +                   USEC_PER_SEC /* to MHz */);
>
> why is the unit nsec -> usec when storing, couldn't we just use
> NSEC_PER_SEC here?
Yup.
>
>
>>     }
>>
>>     return 0;
>> @@ -143,7 +194,7 @@ static void xe_pmu_event_update(struct perf_event 
>> *event)
>>
>> static void xe_pmu_event_read(struct perf_event *event)
>> {
>> -    struct xe_device *xe = container_of(event->pmu, typeof(*xe), 
>> pmu.base);
>> +    struct xe_device *xe = event_to_xe(event);
>>     struct xe_pmu *pmu = &xe->pmu;
>>
>>     if (!pmu->registered) {
>> @@ -154,8 +205,105 @@ static void xe_pmu_event_read(struct perf_event 
>> *event)
>>     xe_pmu_event_update(event);
>> }
>>
>> +static bool gt_pmu_event_active(struct xe_pmu *pmu, uint32_t id, 
>> uint32_t gt_id)
>> +{
>> +    return pmu->active_mask[gt_id] & BIT_ULL(id);
>> +}
>> +
>> +static bool pmu_needs_timer(struct xe_pmu *pmu)
>> +{
>> +    struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
>> +    struct xe_gt *gt;
>> +    int i;
>> +
>> +    for_each_gt(gt, xe, i)
>> +        if (gt_pmu_event_active(pmu, 
>> XE_PMU_EVENT_GT_ACTUAL_FREQUENCY, i) ||
>> +            gt_pmu_event_active(pmu, 
>> XE_PMU_EVENT_GT_REQUESTED_FREQUENCY, i))
>> +            return true;
>> +
>> +    return false;
>> +}
>> +
>> +static void xe_pmu_start_timer(struct xe_pmu *pmu, uint32_t gt_id)
>> +{
>> +    /* Timer is per device */
>> +    if (!pmu->timer_enabled && pmu_needs_timer(pmu)) {
>> +        pmu->timer_enabled = true;
>> +        pmu->timer_last = ktime_get();
>> +        hrtimer_start_range_ns(&pmu->timer,
>> +                       ns_to_ktime(XE_HRTIMER_INTERVAL_NS), 0,
>> +                       HRTIMER_MODE_REL_PINNED);
>> +    }
>> +}
>> +
>> +static void
>> +xe_sample_gt_frequency(struct xe_gt *gt, uint32_t period_ns)
>> +{
>> +    struct xe_device *xe = gt_to_xe(gt);
>> +    struct xe_pmu *pmu = &xe->pmu;
>> +    uint32_t act_freq, cur_freq;
>> +    int ret;
>> +
>> +    if (gt_pmu_event_active(pmu, XE_PMU_EVENT_GT_ACTUAL_FREQUENCY, 
>> gt->info.id)) {
>> +
>
> drop this line
ok.
>
>> +        /* Actual freq will be 0 when GT is in C6 */
>> +        act_freq = xe_guc_pc_get_act_freq(&gt->uc.guc.pc);
>> +        xe_store_pmu_sample(pmu, gt->info.id, 
>> XE_PMU_EVENT_GT_ACTUAL_FREQUENCY,
>> +                 act_freq, period_ns / NSEC_PER_USEC);
>> +    }
>> +
>> +    if (gt_pmu_event_active(pmu, 
>> XE_PMU_EVENT_GT_REQUESTED_FREQUENCY, gt->info.id)) {
>> +        ret = xe_guc_pc_get_cur_freq(&gt->uc.guc.pc, &cur_freq);
>> +        if (!ret)
>> +            xe_store_pmu_sample(pmu, gt->info.id, 
>> XE_PMU_EVENT_GT_REQUESTED_FREQUENCY,
>> +                     cur_freq, period_ns / NSEC_PER_USEC);
>> +    }
>> +}
>> +
>> +static enum hrtimer_restart xe_sample(struct hrtimer *hrtimer)
>> +{
>> +    struct xe_pmu *pmu = container_of(hrtimer, struct xe_pmu, timer);
>> +    struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
>> +    u64 time_diff_ns;
>> +    struct xe_gt *gt;
>> +    ktime_t now;
>> +    int i;
>> +
>> +    if (!READ_ONCE(pmu->timer_enabled))
>> +        return HRTIMER_NORESTART;
>> +
>> +    now = ktime_get();
>> +    time_diff_ns = ktime_to_ns(ktime_sub(now, pmu->timer_last));
>> +    pmu->timer_last = now;
>> +
>> +    /*
>> +     * The passed in period includes the time needed for grabbing 
>> the forcewake.
>
> I don't think this is true anymore, is it?
>
> xe_sample()
>   1. calculate time_diff at the beginning of the function
>   2. for each gt, readout freq samples, using the time_diff, may include
>      delays on forcewake, but that is not included in the time_diff
>   3. htimer is adjusted to timer_last + period
yup, makes sense.
>
>> +     */
>> +    for_each_gt(gt, xe, i)
>> +        xe_sample_gt_frequency(gt, time_diff_ns);
>> +
>> +    hrtimer_forward(hrtimer, now, ns_to_ktime(XE_HRTIMER_INTERVAL_NS));
>> +
>> +    return HRTIMER_RESTART;
>> +}
>> +
>> static void xe_pmu_enable(struct perf_event *event)
>> {
>> +    struct xe_pmu *pmu = event_to_pmu(event);
>> +    struct xe_gt *gt = event_to_gt(event);
>> +    uint32_t id = config_to_event_id(event->attr.config);
>> +    unsigned long flags;
>> +
>> +    raw_spin_lock_irqsave(&pmu->lock, flags);
>> +
>> +    /* Update event mask */
>> +    pmu->active_mask[gt->info.id] |= BIT_ULL(id);
>> +    pmu->n_active[gt->info.id][id]++;
>> +
>> +    /* Start a timer, if needed, to collect samples */
>> +    xe_pmu_start_timer(pmu, gt->info.id);
>> +
>> +    raw_spin_unlock_irqrestore(&pmu->lock, flags);
>>     /*
>>      * Store the current counter value so we can report the correct 
>> delta
>>      * for all listeners. Even when the event was already enabled and 
>> has
>> @@ -166,7 +314,7 @@ static void xe_pmu_enable(struct perf_event *event)
>>
>> static void xe_pmu_event_start(struct perf_event *event, int flags)
>> {
>> -    struct xe_device *xe = container_of(event->pmu, typeof(*xe), 
>> pmu.base);
>> +    struct xe_device *xe = event_to_xe(event);
>>     struct xe_pmu *pmu = &xe->pmu;
>>
>>     if (!pmu->registered)
>> @@ -176,26 +324,53 @@ static void xe_pmu_event_start(struct 
>> perf_event *event, int flags)
>>     event->hw.state = 0;
>> }
>>
>> +static void xe_pmu_disable(struct perf_event *event)
>> +{
>> +    struct xe_device *xe = event_to_xe(event);
>> +    struct xe_pmu *pmu = &xe->pmu;
>> +    unsigned long flags;
>> +    uint32_t id = config_to_event_id(event->attr.config);
>> +    uint32_t gt_id = config_to_gt_id(event->attr.config);
>> +
>> +    raw_spin_lock_irqsave(&pmu->lock, flags);
>> +
>> +    if (--pmu->n_active[gt_id][id] == 0) {
>> +        pmu->active_mask[gt_id] &= ~BIT_ULL(id);
>> +        pmu->timer_enabled &= pmu_needs_timer(pmu);
>> +    }
>> +
>> +    raw_spin_unlock_irqrestore(&pmu->lock, flags);
>> +}
>> +
>> static void xe_pmu_event_stop(struct perf_event *event, int flags)
>> {
>> -    struct xe_device *xe = container_of(event->pmu, typeof(*xe), 
>> pmu.base);
>> +    struct xe_device *xe = event_to_xe(event);
>>     struct xe_pmu *pmu = &xe->pmu;
>> +    uint32_t id = config_to_event_id(event->attr.config);
>> +
>> +    XE_WARN_ON(id >= XE_PMU_MAX_EVENT_TYPES);
>
> if not using a linked list as suggested, please drop this. Instead block
> the event init from succeeding.

ok.

Thanks,

Vinay.

>
>>
>> -    if (pmu->registered)
>> +    if (pmu->registered) {
>>         if (flags & PERF_EF_UPDATE)
>>             xe_pmu_event_update(event);
>>
>> +        xe_pmu_disable(event);
>> +    }
>> +
>>     event->hw.state = PERF_HES_STOPPED;
>> }
>>
>> static int xe_pmu_event_add(struct perf_event *event, int flags)
>> {
>> -    struct xe_device *xe = container_of(event->pmu, typeof(*xe), 
>> pmu.base);
>> +    struct xe_device *xe = event_to_xe(event);
>>     struct xe_pmu *pmu = &xe->pmu;
>> +    uint32_t id = config_to_event_id(event->attr.config);
>>
>>     if (!pmu->registered)
>>         return -ENODEV;
>>
>> +    XE_WARN_ON(id >= XE_PMU_MAX_EVENT_TYPES);
>
> ditto.
>
> Lucas De Marchi
>
>> +
>>     if (flags & PERF_EF_START)
>>         xe_pmu_event_start(event, flags);
>>
>> @@ -270,6 +445,10 @@ static ssize_t event_attr_show(struct device *dev,
>>     XE_EVENT_ATTR_GROUP(v_, id_, &pmu_event_ ##v_.attr.attr)
>>
>> XE_EVENT_ATTR_SIMPLE(gt-c6-residency, gt_c6_residency, 
>> XE_PMU_EVENT_GT_C6_RESIDENCY, "ms");
>> +XE_EVENT_ATTR_SIMPLE(gt-actual-frequency, gt_actual_frequency,
>> +             XE_PMU_EVENT_GT_ACTUAL_FREQUENCY, "Mhz");
>> +XE_EVENT_ATTR_SIMPLE(gt-requested-frequency, gt_requested_frequency,
>> +             XE_PMU_EVENT_GT_REQUESTED_FREQUENCY, "Mhz");
>>
>> static struct attribute *pmu_empty_event_attrs[] = {
>>     /* Empty - all events are added as groups with .attr_update() */
>> @@ -283,6 +462,8 @@ static const struct attribute_group 
>> pmu_events_attr_group = {
>>
>> static const struct attribute_group *pmu_events_attr_update[] = {
>>     &pmu_group_gt_c6_residency,
>> +    &pmu_group_gt_actual_frequency,
>> +    &pmu_group_gt_requested_frequency,
>>     NULL,
>> };
>>
>> @@ -290,8 +471,11 @@ static void set_supported_events(struct xe_pmu 
>> *pmu)
>> {
>>     struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
>>
>> -    if (!xe->info.skip_guc_pc)
>> +    if (!xe->info.skip_guc_pc) {
>>         pmu->supported_events |= BIT_ULL(XE_PMU_EVENT_GT_C6_RESIDENCY);
>> +        pmu->supported_events |= 
>> BIT_ULL(XE_PMU_EVENT_GT_ACTUAL_FREQUENCY);
>> +        pmu->supported_events |= 
>> BIT_ULL(XE_PMU_EVENT_GT_REQUESTED_FREQUENCY);
>> +    }
>> }
>>
>> /**
>> @@ -306,6 +490,8 @@ static void xe_pmu_unregister(void *arg)
>>     if (!pmu->registered)
>>         return;
>>
>> +    hrtimer_cancel(&pmu->timer);
>> +
>>     pmu->registered = false;
>>
>>     perf_pmu_unregister(&pmu->base);
>> @@ -334,6 +520,11 @@ int xe_pmu_register(struct xe_pmu *pmu)
>>     if (IS_SRIOV_VF(xe))
>>         return 0;
>>
>> +    raw_spin_lock_init(&pmu->lock);
>> +
>> +    hrtimer_init(&pmu->timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
>> +    pmu->timer.function = xe_sample;
>> +
>>     name = kasprintf(GFP_KERNEL, "xe_%s",
>>              dev_name(xe->drm.dev));
>>     if (!name)
>> diff --git a/drivers/gpu/drm/xe/xe_pmu_types.h 
>> b/drivers/gpu/drm/xe/xe_pmu_types.h
>> index f5ba4d56622c..cd68cba58693 100644
>> --- a/drivers/gpu/drm/xe/xe_pmu_types.h
>> +++ b/drivers/gpu/drm/xe/xe_pmu_types.h
>> @@ -10,6 +10,7 @@
>> #include <linux/spinlock_types.h>
>>
>> #define XE_PMU_MAX_GT 2
>> +#define XE_PMU_MAX_EVENT_TYPES    64
>>
>> /**
>>  * struct xe_pmu - PMU related data per Xe device
>> @@ -34,6 +35,34 @@ struct xe_pmu {
>>      * @supported_events: Bitmap of supported events, indexed by 
>> event id
>>      */
>>     u64 supported_events;
>> +    /**
>> +     * @lock: Lock protecting enable mask and sampling
>> +     */
>> +    raw_spinlock_t lock;
>> +    /**
>> +     * @active_mask: Bit representation of active events
>> +     */
>> +    u64 active_mask[XE_PMU_MAX_GT];
>> +    /**
>> +     * @n_active: Counts for the enabled events
>> +     */
>> +    unsigned int n_active[XE_PMU_MAX_GT][XE_PMU_MAX_EVENT_TYPES];
>> +    /**
>> +     * @timer: Timer for sampling GT frequency.
>> +     */
>> +    struct hrtimer timer;
>> +    /**
>> +     * @timer_last: Timestmap of the previous timer invocation.
>> +     */
>> +    ktime_t timer_last;
>> +    /**
>> +     * @timer_enabled: Should the internal sampling timer be running.
>> +     */
>> +    bool timer_enabled;
>> +    /**
>> +     * @event_sample: Store freq related counters.
>> +     */
>> +    u64 event_sample[XE_PMU_MAX_GT][XE_PMU_MAX_EVENT_TYPES];
>> };
>>
>> #endif
>> -- 
>> 2.38.1
>>
