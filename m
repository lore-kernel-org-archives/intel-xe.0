Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71827E6BF1D
	for <intel-xe@archiver.kernel.org>; Fri, 30 Jan 2026 15:20:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F96710E02F;
	Fri, 30 Jan 2026 15:20:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fxPAhVSy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C354810E4EB
 for <intel-xe@lists.freedesktop.org>; Fri, 30 Jan 2026 15:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769786453; x=1801322453;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=74I+erByk2VQJkVBLn24gKbCKDTBTPDFl3vXLsieiDU=;
 b=fxPAhVSy/B9MD0OEQ4gDklkLeaAMKohylKd8ZF1q4zHM8wcfhZLx+DWO
 fKbjvPRL4TjptZjnKxQxivnIKCFHeaWrVRuuouRvMSEMjlOefXEDbq7gu
 hkeWddoq78ALKsv274s7teIr8zhByzxtKn1znDCiU+rVJ1+0jOZO52RrA
 mAVbscod1I59E7RbAS7nGvOVz8M3sWKjuLmZGbRTnrucaUN12ArEFpUj4
 pl/Ely7ORreBYeY/FjkCr6QaudBuATx1TvO4SjCMofWUfG1S9477MQ5Ji
 jnx0K1O2H1yFLF6wjlnQkUJ43+NqmN480GJpdqprHX+f6RpxDh7RsUFDT A==;
X-CSE-ConnectionGUID: 269PnH4bQ3q9KxK8axivvA==
X-CSE-MsgGUID: HkrPqkdzRg+gXVs4YuSbDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="82408328"
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; d="scan'208";a="82408328"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 07:20:53 -0800
X-CSE-ConnectionGUID: 1iaXoA5yS4yr4oUFrVByNw==
X-CSE-MsgGUID: n02uqvxvQSarNXhnxvTDdA==
X-ExtLoop1: 1
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 07:20:52 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 30 Jan 2026 07:20:52 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Fri, 30 Jan 2026 07:20:52 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.13) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 30 Jan 2026 07:20:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EwSyB7WQ3lnxMQol/IIHLL6rqh73SgSm213ObT44C/emM831HUYUNInYm4x68AFH3Bhwoi/DULHF8fajhBxb38UhCGMdaRH7FOQV7NauswBerViWwq13o0tmFlEge+y7BJe6SwJxaobAfGasNZCCuZhR3SqC+DICdAP0isJnTxkPZ37cjbTU/pc7X6mV7PzfySDMzjAwlmy8Da4EafpRUTOqAEAn9gjL2ZctjC3hwak+BC+FVx1GFGIUa0JAkxPkM7vzalGgS92qfL9xT3//mKF511OD6pGeZMVRWhdQQeLBS7sadT1/9o+ypDf8FlkQdObdXCqPBIANeHwOyXCNgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3L2q7BUpCKVl+rvM5Qq6FdhWZy97lwHGlrI5XBxopvo=;
 b=LGQIgmhmO1dCxSkO6nQrsgltZNcGwt/K75+E5O+qwZl8kQWc5wz/iNQ6ZG7vpH29Bw/bd2CFL1CcpddfXFtpISRDXqR6P4UgVcYAu4637OdkoHacZBLJ3jNMlIU4Wzab9jpUtuuVlwWovs51aFVhdJb035hnZdLxcjJ0ldWQ2sGBWUF6tqlOyc1WugogBtCtQZcoTFDUNN3C6sD/3F2QOSHYYtLO0RvEhHGCOKT8Cqq6VG5fhhFXkFIfMyr01JxpMyI1FWl4I5kuVbkf+AU7cIyZP1/RG6u0TNSlJ4T2vLJ71PjIJSCyzw/wV8jHWg9uidY3+cE2xHWMugMYh61BqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by MW4PR11MB5797.namprd11.prod.outlook.com (2603:10b6:303:184::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.8; Fri, 30 Jan
 2026 15:20:49 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::1451:ad37:6612:37fb]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::1451:ad37:6612:37fb%4]) with mapi id 15.20.9564.010; Fri, 30 Jan 2026
 15:20:49 +0000
Message-ID: <a5187a5e-f74e-4d8c-a435-131a86d5f649@intel.com>
Date: Fri, 30 Jan 2026 20:50:42 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/xe: Add forcewake status to powergate_info
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20260115224040.2668209-1-vinay.belgaumkar@intel.com>
 <20260115224040.2668209-3-vinay.belgaumkar@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20260115224040.2668209-3-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA1PR01CA0143.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::13) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|MW4PR11MB5797:EE_
X-MS-Office365-Filtering-Correlation-Id: 9dbfb168-1c6f-4824-600c-08de601325d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K3Q4NGsrTWhPaDdmVFVrNkx1ZTQ4aDhlWkhmN3Fsd2Z6VEhua2dkY0FlSDBp?=
 =?utf-8?B?a05xTU0wL0FXMExFcm5ESWZwazlIU2FZVFVmcVZ1ajJDMUlvRWVMdm1KNW8r?=
 =?utf-8?B?R2JVczV3VkttaWo1V243a1lvZlA5dFVNVzRqT2lyUTArMU9aMFJLdFQ4TmhP?=
 =?utf-8?B?cVZidGVOQXFQQzdWNlBPeEZvNFlaUGVUdG5tMC9KM29WUHprbUVSMk5yMENy?=
 =?utf-8?B?Sjc3aHVXRVZHS2JkRDVsdkNmd0lHZllrVW5zMUY5SC9XRFU3NFMzOTFMTFpP?=
 =?utf-8?B?c0tFV2lVNWZkS0JMQnBsQXBwL29NN0JiRTUwWjdTOVlFaExYOEJ6eVdXKzNZ?=
 =?utf-8?B?STQyNmtjYUw4c0dYUzQvWXE2OEdVakYxK25vUXAyNWgzU3BLdk5LRFF4Nmpv?=
 =?utf-8?B?Qld5RS9PWkJHK0VOQXR0MVZVNkVTMVFpWUFQUGFqTUlFTVFHM0RlTGVxMFhI?=
 =?utf-8?B?US9ZYVArQ2VkQ3NWUzhhVFNTUVg0S0c4TDhqb1M3M1laVXJFODBjZkdJbjJi?=
 =?utf-8?B?TmFBd0NxWERpZHJWdDE5TndnMmIvSXN2bmo1NzV6eG4vQzdWbDhwNDVyT2p4?=
 =?utf-8?B?d0NRZWU3ZEZJRW9oZ29lR3NzSTVLL0locXEwY1JBS0JTVVZ0NVUvR3VnSDZk?=
 =?utf-8?B?NEVwcisyRVF2VGxhSTlsWXhBclhmUWxDakhSck1MbVQrclpCTnV6Uk9INE1n?=
 =?utf-8?B?cnhOTENqbVJrN2JZS2MxQ2dQNGt6MG9vb21pVTdQQkxBZ1lCTTJoZEc0QlVI?=
 =?utf-8?B?bDczRlp2bWlxZHNKL0M4TkFXcXBDWUUzT0IwVGpVZEJHVzBsaWNxcWt5Sko3?=
 =?utf-8?B?QnNxaVBKanNTMlROSzh1Y1NtcSs2Y3dzbCtvcDJvRXRTVTJDcGl5dmRxZnVr?=
 =?utf-8?B?MlJuUmJlNE1GN0ZkWGZtZ055Kyt3MGMvaks5TkFDUE1GUDVoUVVINVY5QUgy?=
 =?utf-8?B?THRSdm8yT3pIbC8vMmF4WVUwLytNaHJRTXBzVlk5Q1V1VmpxSlQ2UStURVJO?=
 =?utf-8?B?dUNsRnp4RUd0bm15c2szNkNwcjNvZURBSVpTc2xpaktENHhhZEVVaVlpU0Q4?=
 =?utf-8?B?ejdmVnduWm5rTFA1ZzNUMHhyQzRBQ3Z3THV0ZTdGcUtGTUhzaHdpUzA1WVNr?=
 =?utf-8?B?T2tja0xVQ2ttYVljTTkwVExWMVJPT092a2F1WXlIem1hb3FqUnVOUVh1MVRE?=
 =?utf-8?B?N1N4dVRsVTdZTXducUFacHlaZC9PcGNXeXBVZVFYRVJTNkpKdXNVT2J0R1Z5?=
 =?utf-8?B?S05RbEg4dFhwVi9JQ3RyVFVuem50UU1qWE9FYjhMZGtBYTlvelJLVVRDMkc0?=
 =?utf-8?B?bHhka0thQW8rUzdoVHdXUHphblRGT0duNStKTnBIT0lIL2IvcllZWWkzbFpQ?=
 =?utf-8?B?bjltNzN6cWE3QTJ4RFRtY044NkNTV2dSaFI5emFaSkxPcnpobFhBQTRSK201?=
 =?utf-8?B?MmlPRDdTTWZmZURqem1KOHA3L3RGbFZySTlqODhCL1hGQ0RGL3VUWWJ4M1VK?=
 =?utf-8?B?SGpqdFZIQ3FtRHpCRTRHR2Q1Zm5MN29nWEYyOVA4TkRjZ21WM0M4cERsdWRJ?=
 =?utf-8?B?OUc3WERndXRHSkxrRGNFbmpxZ1NYVldwRDlJbk9xRFNWdnU3TFVnd2lUbnk1?=
 =?utf-8?B?aGl3Umtxd0h4dlgxMk0vSXJLUERFN1pEUGZVVGpkY05kWkNCV3hHZTVxMnh1?=
 =?utf-8?B?THBFNmRQbUJITnE2SUJZaTVZbHdjMCtoSVQySHhHQWtJbW5CaDRWVnk5RlhD?=
 =?utf-8?B?bjBmaTk5QWJVcm44aDYrSXRNNnBiTWZ0bzRkdTk5bDZlTVBmKzJNYUdxY1Uy?=
 =?utf-8?B?NVUxL2pSYnpCeTN2ZkRiVWgvVVZQRlNFRlZaZlVDMlNoandjRVRjU1ZsVzRI?=
 =?utf-8?B?aFVTYm5sU3E5WXJqWEd3YnJ5RFRwYlVvSUt4M05oSUdzYXo3L2hwL0VPY2t2?=
 =?utf-8?B?K2lSRWJFWDlaMFVyRDVmUFExK3VGS1VHTUI4bytJTzk4Qm9ZaTNyTFhaT0RE?=
 =?utf-8?B?ZERJdHlvS25jb29adGNFZ2VHNWgwcnQvSTJINWxRT1NZK1ZrOFIvdVdrNEJR?=
 =?utf-8?B?N2x4WW95d0RKWEJzeTZWWmdYT2FvK0ZWSkFoZ2VXQlBSVjEvczhMZzgyVW4v?=
 =?utf-8?Q?K948=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T3lTNHI3YjZQQ2piZkw5VTIzT2drTis4WmdWUmJ6NFNxb3hic1lrL1FYbk5t?=
 =?utf-8?B?azVVUk9zbkZvT1QxL1R5cDUxaTNkRFRpbGdHcTJUdld4Sys0YjlGM3Bsa01W?=
 =?utf-8?B?MElZcVdmcmZBN2ZzOWNLRDBGdXA1L2MyTU8xNkRETnpWZG9BVnVBd1VTNE9w?=
 =?utf-8?B?bDBWV0xaR1EvWENhYlJuZUxmRTd6SWJkaU40OG5RRCtBY1JweU1MTU9Bdzkw?=
 =?utf-8?B?S3QzM3VNQjRIZDFjWXRXeDVmTGRzUlBHNElGMUNDTkZsRGtSeE1SNlE1OGNu?=
 =?utf-8?B?OVpBQ2xDcUM2eGxRekpTZDd2eWFnMlo3RU9ydUg5WHl3MXVQVFlQZGhjMkRr?=
 =?utf-8?B?WmZYYWNibkpkV2xXaHV5d1EwNzU5QS9Mbm1VNjg5Rlp3b1FpNEFLQk9jcjF1?=
 =?utf-8?B?S2ZlTktRVW5ZTE9TV1JjWitZdHVUVWY1NCttNmlJKytWMHZXTFN1WTBsQ0R2?=
 =?utf-8?B?d000VjgxeXJxQ2Y2N25ldUVhcGdDQXZhUXZ5ZzAxOGp1UFU1aHZvNVNkSEhh?=
 =?utf-8?B?K1N6Z1VNeVhJNS8rNHJydmtmRThmeWU2akMwU1hWWXIyQ0thTHRaUkJ5NWtP?=
 =?utf-8?B?ZW52dXQxbElXNjlpTFdwSzJHRHg4K21IdmZiSHJ0QTFGc0dqTEppdS9aMm1Y?=
 =?utf-8?B?T3llSXNLaW90OGJmUWlvQWsyOVF5KytxekRxdEhITlJPTW1XK0NQNkwrWVA5?=
 =?utf-8?B?R0hIeEFDTm1peEwvQTMvZElzL3czZ0lYcTlqTmI5L3M4YThOOE1XanlMMlAz?=
 =?utf-8?B?NUI4YVVNZFE0Sk9GcWdtZXBGMHc5N1VzMnVBNmc3bXZzMElOeGh3MXY3UjFn?=
 =?utf-8?B?NXU4Rk9SNVQwa0s1NU5MemhSK2NSMTZDeG56Tm1XSytORDN0elFhays3bDhU?=
 =?utf-8?B?Y3VRQlFYa0NlQlZZd3NXQkY5SmpBYk1WVlduV2Uyem5ieW4zaS9MaXlIdzRQ?=
 =?utf-8?B?d2QxOXk1QzVUVkUvbkxsZ3Q2R0Q5NEJsYnJkQzhSdDd6MmpZY21DZ050VFZY?=
 =?utf-8?B?K0FkdmN6dzY0MnJzWUd1bWlpa1R0NW9NV3ZCTnZZeFNXRjZhYTlCVHg4Nkdh?=
 =?utf-8?B?YWxSaVdDQmxmdnNKQWRtazI3ekpWZHZtSWlvWnhRWlRVY1d6UEJhUXZmbGdI?=
 =?utf-8?B?ckR0VnZjWlFFaGpHWml1SWQ5Q0FzMGttWHYxUXZNTnFtVzB2WW9XZnNLdlNs?=
 =?utf-8?B?VWZudWhZcC9xT0ZHUmRiNHE0Y2orM2pTVDNrTDVkdjY2ZHZFT0FXVmtvQ0VP?=
 =?utf-8?B?QjIyMHlkVXAwMncwenlvc2t1b25nUU11aWxmM1VRMmlpMkZ5UjNGUU9ieEZl?=
 =?utf-8?B?eURYVWpiVHJYSE5lN0djUHo1bmRMZWdISHFmUmdVU2wyLzFldDZBcitkZ3d6?=
 =?utf-8?B?dFFiWlY3MWY0MmpmRnhGSGhYQm9xL2sya0IvNGZtNW8rOEJUTUc2S1VYSG5m?=
 =?utf-8?B?TjhSSi9GK3VraEU5SGpOb3BmMnlSelZqNWM1dkNmOVV3Y1JsNnliSUF1VG5v?=
 =?utf-8?B?R3NST2Q2bW5IUDdpZGY2QnExbHZpNUxvTUlUbnpQcmd6NlJhaEkxL1NiSkRr?=
 =?utf-8?B?Z1V3WUlCUHROMXdkSnlGRE9NRkxJTXh0SXEyK2MzU0haMWhKWVc5WUpuUHk2?=
 =?utf-8?B?SHQ0OStBYnQ5Vks0dVFBSnRBV3BMWVVKM3BZMFc4eGNUQlh0dDNlVFJmRFZt?=
 =?utf-8?B?Nkp3ZFRNYlZwcHdPdjh6bzl1MVYzRS8zZnoyUW44Tjk2T2F3NE5DdXQvbzdm?=
 =?utf-8?B?blFHNTVkV3JzRmpRU2hLaHpwaG1XUi8xUm5WWjlIMnNLZVh5YzJzTk9Hb2ts?=
 =?utf-8?B?WE9WME82T01vRGNmbm52ZGRQbGFhU2xYZnMzUFV1UEVDMVgrNWdBNGVtdlk1?=
 =?utf-8?B?NDk4UnJIUlJRZ0F3NEFCMzBJNGpNNUJrMmpUbWxDajZId3VYUHgwN1J0OUE1?=
 =?utf-8?B?cmQyb2lUM3Y5ZVlQMFMxMTh2dnMrRmxkdnNwMlphZWlwd0VvaHpTM0tMY1VY?=
 =?utf-8?B?MklDMDFJWGQxUm5uMmgzYmZOVnpmdkYzMTdTeXlMUmZ2MTR2bThBTFJ3Uzhn?=
 =?utf-8?B?YlIxNVY1MlBPWmZNSzJWQmw0allhZDJ6VW5xY3BwZlI4THVFNFZDNVk2ZWg4?=
 =?utf-8?B?Qkp1c3lxVS9LdE1WdHpvelVEQitPaTFsMVpVdUdqUWhZOHdQZzNTN3lxb3Z4?=
 =?utf-8?B?S1IvRFUwcXNWQnArSTAybUtCN0V3VUFpNDRkTDFoQ2xQZFVDU2VoMzFIcW9h?=
 =?utf-8?B?K1o3N1dKZC9kTStyQ1owdmdnUzI3VDVLdWR4OVpMbnhCbGRNa2dGM3drK2tN?=
 =?utf-8?B?cjU1d1Nmc2w5V2ZqbGVqTTljcm5hRkFzNnFkRldpbVNpQ2d6QTFSZz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9dbfb168-1c6f-4824-600c-08de601325d9
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 15:20:49.2619 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3mH2XzZZ7wGUrb+t9BE8hvZWkXTHi4mULyf4Ff4I+ch2gGYHdnwzItBhQx2OMaeTqT2D6Cv+qEZfBIX+7HUEVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5797
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


On 16-01-2026 04:10, Vinay Belgaumkar wrote:
> Dump forcewake status and ref counts for all domains as part
> of this debugfs. This is the sample output from gt1-
>
> $ cat /sys/kernel/debug/dri//0/gt1/powergate_info
> Media Power Gating Enabled: yes
> Media Slice0 Power Gate Status: down
> GSC Power Gate Status: down
> GT.ref_count=0, GT.forcewake=0x10000
> VDBox0.ref_count=0, VDBox0.forcewake=0x10000
> VEBox0.ref_count=0, VEBox0.forcewake=0x10000
> GSC.ref_count=0, GSC.forcewake=0x10000
>
> Signed-off-by: Vinay Belgaumkar<vinay.belgaumkar@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_force_wake.c | 46 ++++++++++++++++++++++++++----
>   drivers/gpu/drm/xe/xe_force_wake.h | 11 +++++++
>   drivers/gpu/drm/xe/xe_gt_idle.c    | 20 +++++++++++++
>   3 files changed, 71 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
> index 76e054f314ee..197e2197bd0a 100644
> --- a/drivers/gpu/drm/xe/xe_force_wake.c
> +++ b/drivers/gpu/drm/xe/xe_force_wake.c
> @@ -148,12 +148,6 @@ static int domain_sleep_wait(struct xe_gt *gt,
>   	return __domain_wait(gt, domain, false);
>   }
>   
> -#define for_each_fw_domain_masked(domain__, mask__, fw__, tmp__) \
> -	for (tmp__ = (mask__); tmp__; tmp__ &= ~BIT(ffs(tmp__) - 1)) \
> -		for_each_if((domain__ = ((fw__)->domains + \
> -					 (ffs(tmp__) - 1))) && \
> -					 domain__->reg_ctl.addr)
> -
>   /**
>    * xe_force_wake_get() : Increase the domain refcount
>    * @fw: struct xe_force_wake
> @@ -266,3 +260,43 @@ void xe_force_wake_put(struct xe_force_wake *fw, unsigned int fw_ref)
>   	xe_gt_WARN(gt, ack_fail, "Forcewake domain%s %#x failed to acknowledge sleep request\n",
>   		   str_plural(hweight_long(ack_fail)), ack_fail);
>   }
> +
> +const char *xe_force_wake_domain_to_str(enum xe_force_wake_domain_id id)
> +{
> +	switch (id) {
> +	case XE_FW_DOMAIN_ID_GT:
> +		return "GT";
> +	case XE_FW_DOMAIN_ID_RENDER:
> +		return "Render";
> +	case XE_FW_DOMAIN_ID_MEDIA:
> +		return "Media";
> +	case XE_FW_DOMAIN_ID_MEDIA_VDBOX0:
> +		return "VDBox0";
> +	case XE_FW_DOMAIN_ID_MEDIA_VDBOX1:
> +		return "VDBox1";
> +	case XE_FW_DOMAIN_ID_MEDIA_VDBOX2:
> +		return "VDBox2";
> +	case XE_FW_DOMAIN_ID_MEDIA_VDBOX3:
> +		return "VDBox3";
> +	case XE_FW_DOMAIN_ID_MEDIA_VDBOX4:
> +		return "VDBox4";
> +	case XE_FW_DOMAIN_ID_MEDIA_VDBOX5:
> +		return "VDBox5";
> +	case XE_FW_DOMAIN_ID_MEDIA_VDBOX6:
> +		return "VDBox6";
> +	case XE_FW_DOMAIN_ID_MEDIA_VDBOX7:
> +		return "VDBox7";
> +	case XE_FW_DOMAIN_ID_MEDIA_VEBOX0:
> +		return "VEBox0";
> +	case XE_FW_DOMAIN_ID_MEDIA_VEBOX1:
> +		return "VEBox1";
> +	case XE_FW_DOMAIN_ID_MEDIA_VEBOX2:
> +		return "VEBox2";
> +	case XE_FW_DOMAIN_ID_MEDIA_VEBOX3:
> +		return "VEBox3";
> +	case XE_FW_DOMAIN_ID_GSC:
> +		return "GSC";

How about creating static look up table.

     static const char * const domain_names[] = {
         [XE_FW_DOMAIN_ID_GT] = "GT",
         [XE_FW_DOMAIN_ID_RENDER] = "Render",
         [XE_FW_DOMAIN_ID_MEDIA] = "Media",
         [XE_FW_DOMAIN_ID_MEDIA_VDBOX0] = "VDBox0",
         [XE_FW_DOMAIN_ID_MEDIA_VDBOX1] = "VDBox1",
         [XE_FW_DOMAIN_ID_MEDIA_VDBOX2] = "VDBox2",
         [XE_FW_DOMAIN_ID_MEDIA_VDBOX3] = "VDBox3",
         [XE_FW_DOMAIN_ID_MEDIA_VDBOX4] = "VDBox4",
         [XE_FW_DOMAIN_ID_MEDIA_VDBOX5] = "VDBox5",
         [XE_FW_DOMAIN_ID_MEDIA_VDBOX6] = "VDBox6",
         [XE_FW_DOMAIN_ID_MEDIA_VDBOX7] = "VDBox7",
         [XE_FW_DOMAIN_ID_MEDIA_VEBOX0] = "VEBox0",
         [XE_FW_DOMAIN_ID_MEDIA_VEBOX1] = "VEBox1",
         [XE_FW_DOMAIN_ID_MEDIA_VEBOX2] = "VEBox2",
         [XE_FW_DOMAIN_ID_MEDIA_VEBOX3] = "VEBox3",
         [XE_FW_DOMAIN_ID_GSC] = "GSC",
     };

     if (id < ARRAY_SIZE(domain_names) && domain_names[id])
         return domain_names[id];

Thanks,
Badal

> +	default:
> +		return "Unknown";
> +	}
> +}
> diff --git a/drivers/gpu/drm/xe/xe_force_wake.h b/drivers/gpu/drm/xe/xe_force_wake.h
> index 1e2198f6a007..f7690cb34ef7 100644
> --- a/drivers/gpu/drm/xe/xe_force_wake.h
> +++ b/drivers/gpu/drm/xe/xe_force_wake.h
> @@ -19,6 +19,17 @@ unsigned int __must_check xe_force_wake_get(struct xe_force_wake *fw,
>   					    enum xe_force_wake_domains domains);
>   void xe_force_wake_put(struct xe_force_wake *fw, unsigned int fw_ref);
>   
> +const char *xe_force_wake_domain_to_str(enum xe_force_wake_domain_id id);
> +
> +#define for_each_fw_domain_masked(domain__, mask__, fw__, tmp__) \
> +	for (tmp__ = (mask__); tmp__; tmp__ &= ~BIT(ffs(tmp__) - 1)) \
> +		for_each_if((domain__ = ((fw__)->domains + \
> +					 (ffs(tmp__) - 1))) && \
> +					 domain__->reg_ctl.addr)
> +
> +#define for_each_fw_domain(domain__, fw__, tmp__) \
> +	for_each_fw_domain_masked(domain__, fw__->initialized_domains, fw__, tmp__)
> +
>   static inline int
>   xe_force_wake_ref(struct xe_force_wake *fw,
>   		  enum xe_force_wake_domains domain)
> diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c b/drivers/gpu/drm/xe/xe_gt_idle.c
> index 52436dcb6381..8e36202f1a4f 100644
> --- a/drivers/gpu/drm/xe/xe_gt_idle.c
> +++ b/drivers/gpu/drm/xe/xe_gt_idle.c
> @@ -169,6 +169,24 @@ void xe_gt_idle_disable_pg(struct xe_gt *gt)
>   	xe_mmio_write32(&gt->mmio, POWERGATE_ENABLE, gtidle->powergate_enable);
>   }
>   
> +static void force_wake_domains_show(struct xe_gt *gt, struct drm_printer *p)
> +{
> +	struct xe_force_wake_domain *domain;
> +	struct xe_force_wake *fw = gt_to_fw(gt);
> +	unsigned int tmp;
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&fw->lock, flags);
> +	for_each_fw_domain(domain, fw, tmp) {
> +		drm_printf(p, "%s.ref_count=%u, %s.fwake=0x%x\n",
> +			       xe_force_wake_domain_to_str(domain->id),
> +			       READ_ONCE(domain->ref),
> +			       xe_force_wake_domain_to_str(domain->id),
> +			       xe_mmio_read32(&gt->mmio, domain->reg_ctl));
> +	}
> +	spin_unlock_irqrestore(&fw->lock, flags);
> +}
> +
>   /**
>    * xe_gt_idle_pg_print - Xe powergating info
>    * @gt: GT object
> @@ -260,6 +278,8 @@ int xe_gt_idle_pg_print(struct xe_gt *gt, struct drm_printer *p)
>   			   str_up_down(pg_status & GSC_AWAKE_STATUS));
>   	}
>   
> +	force_wake_domains_show(gt, p);
> +
>   	return 0;
>   }
>   
