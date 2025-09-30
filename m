Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A049BCCA470
	for <intel-xe@archiver.kernel.org>; Tue, 30 Sep 2025 13:23:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B94910E0ED;
	Tue, 30 Sep 2025 13:23:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZYhj76gl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D71510E0ED
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Sep 2025 13:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759238585; x=1790774585;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=9UeBv69qZpu3K/6hLPM7hQkAvmD3AQLS489AWNpL130=;
 b=ZYhj76gl68AckbaAK7CBp04HlcLEQHEOB/5QVAI7s9NiUg3PSPAZYD4X
 kzj9r8UfpYdnHz6wkHtTbo0AikePz+GDEl6IZr9Pb0O8rLWovuLEfiN+G
 Kh1lCguz1D3+qqTvBCznVxl6X4lkukgzI5aqKxw3ihMmiSmu3riizyml3
 b1F9p9lXubr/K4/zE8DNHFU2UhDGd+Ag94o/0Xo1c4Onm1LN1hkQVzfgK
 F5DGexnXtgcF20+3Oewstd2UXxPTFpUI/GDGNXvy1uboqVhtFg7aFYTwT
 DTpKRUz80hgnirJvTPq8yUU8nEKx1eydgwkYs/F48t11/XszvDKQq/+xs Q==;
X-CSE-ConnectionGUID: uqIV7Yv7TQG5mfQl7uuqHA==
X-CSE-MsgGUID: bTl8fZgWSQOY+5Y1sMfxVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11568"; a="72172519"
X-IronPort-AV: E=Sophos;i="6.18,304,1751266800"; d="scan'208";a="72172519"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 06:23:05 -0700
X-CSE-ConnectionGUID: IFVicKeeT521eS0Qj4ciyg==
X-CSE-MsgGUID: +ujFSBzmT8uAaCTaWtIzTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,304,1751266800"; d="scan'208";a="202201732"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 06:22:59 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 30 Sep 2025 06:22:54 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 30 Sep 2025 06:22:54 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.14) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 30 Sep 2025 06:22:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=edu9XCxeVSHQKq75TgjYo7uzFQza1e0ZmeesZ6u7czxo9JgC1zgF52KihBiZ7Ws+FJ3PF9D4a0EhsUF/s38nOtYjyPE1X1vciRKhtTcUabWHG2m3LdCr3t+wvppBtHHQjFa3ZHHlJoSVKARUKW9um7ditpT0kOaTrOjCT24X7iorTGUPHplVVJ6dri57hsK4Trt6tDuo5SoiD3LHwp3AtjmtJPJkD4ZzQJpyWMLacvVbQCZ6DndQgUykEATAjngz7Eq2YUixkodsWMKKuDrBxPYFDlnBm5dFH0I2ClunT2eVaXZ6VfZzcnU0wdxreBL+JCgypiUTG9NQqetep3Raug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eoUrYxuGAnDg50CGKXlHmX64HNFntKgE/B/QscNHZhg=;
 b=D1S7/vl13cHi+EfghCkaXKY26LHxMrtPYyyp8qW7aYQxkyPAnL/4w6jjNaIKq0Wn9bX3SxSRgBMAGYjSkhUWdL7Pcz2jQcmLG3V7UdWAqUmPJ289tk9nWXdp5ZiVFAdIRoNsKNXA67q6CFUAqiSErwb6uRXUOpZPWNChZtusrr4EI0emm5fhLSq0xUuK/jbBTQXLUZegT8hKIWaYQt56v6IKWh+rjUf/87vFkQ0NTF0ymNEd0bozM58vdEeQbK/YbGdPTsBqsJdK6nQtFtFlg3jzIJdT6TUcpyfWlt5LJyseSmZuB0vRg9ZNuYDiNaDFp8r0p+kEa20sLxt8aO5/2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9226.namprd11.prod.outlook.com (2603:10b6:208:574::13)
 by DM4PR11MB5971.namprd11.prod.outlook.com (2603:10b6:8:5e::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9160.17; Tue, 30 Sep 2025 13:22:51 +0000
Received: from IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09]) by IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09%6]) with mapi id 15.20.9137.018; Tue, 30 Sep 2025
 13:22:51 +0000
Message-ID: <c5dd9e33-e2d7-4e03-a1d3-67fd1ff7de90@intel.com>
Date: Tue, 30 Sep 2025 15:22:49 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/36] drm/xe/vf: Lock querying GGTT config during
 driver init
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, "Matthew
 Brost" <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>
References: <20250929025542.1486303-1-matthew.brost@intel.com>
 <20250929025542.1486303-3-matthew.brost@intel.com>
 <aNo_jwo80N-3WEDv@intel.com>
Content-Language: en-US
From: "Lis, Tomasz" <tomasz.lis@intel.com>
In-Reply-To: <aNo_jwo80N-3WEDv@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR0902CA0045.eurprd09.prod.outlook.com
 (2603:10a6:802:1::34) To IA3PR11MB9226.namprd11.prod.outlook.com
 (2603:10b6:208:574::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9226:EE_|DM4PR11MB5971:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b4dfae7-86eb-41cb-99be-08de002474e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b1pWS1ZaSVAzOFNhdjR0UVVmc1ZoMEJnQ2RWa2lCTStHMTk0Ym9ibXROc2ds?=
 =?utf-8?B?QkFxMVkyVEpSMVAyelhhUkhxbllFTSsxaSt1M0JlZjhPVnhQVitML3oydzdi?=
 =?utf-8?B?eHpqSjlaTzlZMW0vUU5kVzcycEx3N0pML2RvNndGbkFlSldxMi9rZk9MWXNN?=
 =?utf-8?B?V2xJTzdMNXZMT2ExRUcwZ2J5VFNsSmlBZDVKNEZkQlNEVTdYbkNUdDFneXFO?=
 =?utf-8?B?MkNEL1dOTlFPOXJJNStDbjdZNHRBaXR6RjF2aDZYenI0UENvN0tBWlBVN0gw?=
 =?utf-8?B?SnI5RjU2MmhsdnczR1h1d212NFRUa1ROZUxWR2tnTFltNFQzN1dHMHdjRW5W?=
 =?utf-8?B?cFhHQ2F2RUl0ZUtKTnVwM2o5NWF5MzhGR0pYbW9QUERBekRzQ2FqU0FCTXk3?=
 =?utf-8?B?MUFtSEtXQ2FMZldUTk5kU09ySXpud2YvY2hOVGhFY2E1VTdNZkJ5KzY5Tk5l?=
 =?utf-8?B?NjhyQ3pBbzdEeU5nblorVC9uMjNLWmg0ekduMnE2Y3hxeThMTzM2a1ZORFB2?=
 =?utf-8?B?WSsyd0NkNWM5NDhxN3pnblBnbytqY1J1bFVGNVhGUllvQzFyem9Xd1BPTW9m?=
 =?utf-8?B?VG5oYnFlbTduVkpRWlVGMllhZ0I5dTQ4NlQ3aHFJM0pONVZFRU0yUGFLV3lO?=
 =?utf-8?B?cDNhdFFkS3pqQnF3M0RackUxckl5cFJwK1JXcHM4eitYc3VuMGlabGptMnJR?=
 =?utf-8?B?cytSaWVneUQ5RllhOVd5Y2hUV0JEcVpsVC9wWXdRRnJzQ2s3ZmxYSml5Z1Bo?=
 =?utf-8?B?b29uN01odW8xcXFqUm5lUW5MOTU5YW4yclJ1VlN2VHBEakYwOExXNzA3MTFm?=
 =?utf-8?B?SlVSbnFxa0dzY0tFajZaczRuZFFIbVQ2Qk90ZFp0MXZEK2lRMFhkcjh2eWVS?=
 =?utf-8?B?enErMWRSRndFVmF1enhNekJKcGY0RmsxYzBjNEQ2eFViL1hMalJ5OWJ6cEFJ?=
 =?utf-8?B?OW84aGo3NkhqblRNLzBmK0FIdkF4OUJWditrV3pmMjd1L0RXL001QTZWdXhq?=
 =?utf-8?B?OGRkS1dLazI0Q3BRUVA1Mi9ta1VNTUFkU0ZsSGZhRWFMMkpuaEFvV0hqRTVD?=
 =?utf-8?B?eldCTmtuYlM4QjVscnJHalVySnBwUk0yM3NLYW9wNExCTnBXMjVKQzdla2ta?=
 =?utf-8?B?Y0VaU1Uza3Zma0Y5S1BrKy9BTzJyVUV3UktpVGc2cDd3QTZpdXpHOTVKOUxF?=
 =?utf-8?B?N0RtTngwSmp3MkF0a25SdEZwMExhc3VNRDJGUy9JRGYwOUs3TW9xaUVvY2xr?=
 =?utf-8?B?dEVWVmFQK2RrWjE5T010WERuZ1FaZzZpaWlxak0xV0QyOFJMZERPVUkxNFYy?=
 =?utf-8?B?cEtRRnhTVjVoTmI1T3pzOUYyTzZGWG9wVzNOVHVFRmRCTUZlSnBxdzVxRHVE?=
 =?utf-8?B?Z0U2Q202RzQxRXlNVTBUZTZSbjZqbExuVUFsTDNUQ1Z6QUMyMFY3K1haWlBS?=
 =?utf-8?B?R3owK1F1SDdVU3l2bTdHNzNtUDJ0MkN1NDVFWUtJNXcvd1M5bmFmOG94NWZp?=
 =?utf-8?B?cTN1WDFpRDFwMURaTXBBRjdib1Z0RkZFUEkrbDdNUnpjbWNXQXhTYUhrMHFI?=
 =?utf-8?B?NGIvTnZMNWxUV01SblNLMVhnNko5cy80TWZqaDZHVmw1K05qeFpjUUs4OVc3?=
 =?utf-8?B?ajd3c2FoYStzN1J6Q2k2NGYxNWhBWXl4ZnpaWWZwb002ZXRkSU1CVzQxUkN6?=
 =?utf-8?B?bDlTYmNPWVNNcWdKZmtMcjE2QXRlMFNnWG1MWWozWkFUUzBESGFhT0dZTURw?=
 =?utf-8?B?QnhBczM2RlZVaVo4Q21BUmtScGwxOEhIVVg1S0RjMEM5WnV5TDN0MGwvNWRT?=
 =?utf-8?B?dDRWOGF6eUtDTjBUNEkyYmt4S045RDhqcEtqVE1uMTI5eXhLc0NyblVnSTNi?=
 =?utf-8?B?ekZsbkVuOVI5SWFZb01oaE1ielBnbzV1eGErY3h0Z3U3ZGNtcy9IeDk2Vi9F?=
 =?utf-8?Q?alZZxW+fd5TkQOfDVmU5CBJ2k0dVONef?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9226.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dFo2RHNqcjd1eERIcWFHMDNjeUVtZkxEWWk4dzJHcldPUUxJajBLbG85OE1W?=
 =?utf-8?B?TStCNVU3OHdwY0pDOHI4Vk9xU2NJejlheWhYeDFxUTFNY0cyYUQrSDNJcE5Z?=
 =?utf-8?B?YmxWOXcrb1ZON1RQU1Nra2l0RjJBYkVLbnB2R1M3bHNkVysxcHJaY2hlTmk1?=
 =?utf-8?B?NVdYOFdhQTEyWWNrWkx4NFhkSjVyUFBtL3pTYlk1RUczQlhMZGE5OS8rQnd0?=
 =?utf-8?B?QzFkVWJ4bWlmNnZHS2dYWEQ1dER6Y1lOZkY2R25FTjF3cUtuRncrdDlLQUVy?=
 =?utf-8?B?Y2pjUTNXaVl0SHdSWTdaUkNoOEw3THduSjVsZEp2WktPU3FKQnQrME5KOUll?=
 =?utf-8?B?L1hwamRJMTA4VGtmcXZ4cVlxWUh3azBnQ1hlWjcwTEVrbjlLdU1jVDExZzdn?=
 =?utf-8?B?c0ZrN1hJZjVVTkcwZW4rbmwvSGVweGtMR2QrRUp6Q2Fqdkg3VXlhQ1lWaUUr?=
 =?utf-8?B?eVViVTZKM1lFSVE3RVlaRERxc0JwOTBkSjlKS2t2d2lUS3JGSGQvNGRpR1M1?=
 =?utf-8?B?ZlFuT2JwNFZkbGEzRWFIV0JScGVFaUlkcGtkRUQxVnAxanA2ajk0T1dNbEhM?=
 =?utf-8?B?dEZXajNpQjVXc05ZYmZoVlc2YWlreWxCeDBGZDNNRWdyTkJVM2pxYTJqWGh6?=
 =?utf-8?B?L2ZvbmhLUnFmZlNkQm5jR09kbGZZYWdCbEZqZ1FaVHNqc3loWmVGS3RBZDFJ?=
 =?utf-8?B?bkJzeU4zalpYQlpqYVB3V0M1d0RRWGI3YnVzYnpCbnl4a1AraGxzWDZ1UTFE?=
 =?utf-8?B?czJlclhEdkk2YWd3ZUJIRkdBcDJUb3djT2JQa0pZallyeXA2dU1TUUJGUXg3?=
 =?utf-8?B?N3VKMHFPV2lXQWN0ZmxUVXhsOTlkUHhkTUdsbU9mTVAwYWdWSnRaWXhxMXZw?=
 =?utf-8?B?bHQzUlhSOW5RNGlRaVdjZVY3OUFxaE91bVI0akFWNHJRZUZuakNkMUVrUEZ4?=
 =?utf-8?B?OExBYTcxcFBZTm1WTysvWVhISDhxTUlnMG9STjBHampld1k4NGp2QmplWk5Q?=
 =?utf-8?B?K2tYNU1jNDdQK0NuZFNleTVnUHA1T1dGUGJJbjVRTUdWK0o5TTJpbFFCb2Ex?=
 =?utf-8?B?YWxrNStkOHk5dlJsSXovNG0yblJ3b0ltS0V0T2ZMNTBlRnNNKzJDV1BCaitn?=
 =?utf-8?B?NHYyY1l6V0gvL1RDUU95cWJvKzVDL2lUQ0FPcFExdHJmVndiTCtteVFPTFRk?=
 =?utf-8?B?OHlWOUZmOW50SjF2dmd3SGVqeUxjaXEwVmVaSnc2bmo5UHJhd2Q0MHhXMXp3?=
 =?utf-8?B?aUlyclBpRnZ0MWp3cUFNZjFDWk1pb2EzSjM3b2xLMFM2UWN2dmdNckdycVFp?=
 =?utf-8?B?em0ya0kzL3lmdmtYVU5sU3hnKzdGQ2h0UXRiZ2JDTVJEdlFQRTdmQ09VZVNL?=
 =?utf-8?B?emFIaW9nT3J3TWdCMks3RVNZM1h4YkpCcldERXlLVU8rNWJTUnhvQ2xNZGt1?=
 =?utf-8?B?L0JiZzNLb21LYTZDaTNVejNQK29zU1psWmhBWm1WNzBWZmNyKzRMV21uUXhn?=
 =?utf-8?B?WHFGY3FnV0VsSENzMzV1aWs4UHlRZVRRa0xnVDFkbFFOSC8vSW8vL0loQ0s5?=
 =?utf-8?B?bG4xTlpIN0RxMmxoMTZrNThmQTdaYjBJUHgwYzBDU1B1ZTRPTklYWkdoRks4?=
 =?utf-8?B?bDhObFBwdGIwMTczOWV4Y1FLSjZ2cGRZTHIvTFN4WVVKOHNXTHp0SkRJOHJ3?=
 =?utf-8?B?eFVPRkhmYmVLT2xoVTh1UHZGZzMwUWFtdkkwY2liRytrRHdBUWgrT01SNUZk?=
 =?utf-8?B?SXdTNHJxNjR6d2JFcDV5anU3YnFCU1JkZXZTaUNWU3ZQcVl5WGViYXNyR04y?=
 =?utf-8?B?OGVMSnFTblNvM1FqenJWTDN4dGhkSGUyUXVtSW9ZQVJXb3dmL3I0ZjRRQ05D?=
 =?utf-8?B?Skd0dEgrTUhtT3Evc3pZNWxhMTNHbnVYSXVXRklJajFtMUx0QXF1N082VWZP?=
 =?utf-8?B?eXF4MkNrN1NUdWtRYUs2VG5VeDROTStSMnR6Z2gxZTFCS09rQlhGZUtjMG1B?=
 =?utf-8?B?aFU4MHlkeGNvUGNITnpZNnZSVnhmVGRsZy9yRWV6anZzV0tHRXpzNVVtbEpo?=
 =?utf-8?B?ZU5XQ1V4RE8xMnd4OGtoZUhWUjd4WWg2R21mY3VtbGdOSTd6aG5xYy9xd1N6?=
 =?utf-8?Q?aLlzy/AFjOip6yMVD4/v+bRFJ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b4dfae7-86eb-41cb-99be-08de002474e6
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9226.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2025 13:22:51.5763 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EMh69DLRnPgZqKnxPQIjrzZOPQxxsUlld5ehYMkvg4IVLTL5XBlF5i6d3CtfBPqW8e3AGCfE+b+TtLtAAmrcnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5971
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


On 9/29/2025 10:13 AM, Ville Syrjälä wrote:
> On Sun, Sep 28, 2025 at 07:55:08PM -0700, Matthew Brost wrote:
>> From: Tomasz Lis <tomasz.lis@intel.com>
>>
>> Protect access to GGTT config as this is non-static information.
>>
>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>> Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_gt_sriov_vf.c       | 96 ++++++++++++++++++-----
>>   drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h |  3 +
>>   drivers/gpu/drm/xe/xe_sriov_vf.c          |  6 ++
>>   3 files changed, 84 insertions(+), 21 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>> index 0461d5513487..016c867e5e2b 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>> @@ -440,18 +440,21 @@ static int vf_get_ggtt_info(struct xe_gt *gt)
>>   
>>   	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>>   
>> +	down_write(&config->lock);
>> +
>>   	err = guc_action_query_single_klv64(guc, GUC_KLV_VF_CFG_GGTT_START_KEY, &start);
>>   	if (unlikely(err))
>> -		return err;
>> +		goto out;
>>   
>>   	err = guc_action_query_single_klv64(guc, GUC_KLV_VF_CFG_GGTT_SIZE_KEY, &size);
>>   	if (unlikely(err))
>> -		return err;
>> +		goto out;
>>   
>>   	if (config->ggtt_size && config->ggtt_size != size) {
>>   		xe_gt_sriov_err(gt, "Unexpected GGTT reassignment: %lluK != %lluK\n",
>>   				size / SZ_1K, config->ggtt_size / SZ_1K);
>> -		return -EREMCHG;
>> +		err = -EREMCHG;
>> +		goto out;
>>   	}
>>   
>>   	xe_gt_sriov_dbg_verbose(gt, "GGTT %#llx-%#llx = %lluK\n",
>> @@ -460,8 +463,11 @@ static int vf_get_ggtt_info(struct xe_gt *gt)
>>   	config->ggtt_shift = start - (s64)config->ggtt_base;
>>   	config->ggtt_base = start;
>>   	config->ggtt_size = size;
>> +	err = config->ggtt_size ? 0 : -ENODATA;
>>   
>> -	return config->ggtt_size ? 0 : -ENODATA;
>> +out:
>> +	up_write(&config->lock);
>> +	return err;
>>   }
>>   
>>   static int vf_get_lmem_info(struct xe_gt *gt)
>> @@ -474,22 +480,28 @@ static int vf_get_lmem_info(struct xe_gt *gt)
>>   
>>   	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>>   
>> +	down_write(&config->lock);
>> +
>>   	err = guc_action_query_single_klv64(guc, GUC_KLV_VF_CFG_LMEM_SIZE_KEY, &size);
>>   	if (unlikely(err))
>> -		return err;
>> +		goto out;
>>   
>>   	if (config->lmem_size && config->lmem_size != size) {
>>   		xe_gt_sriov_err(gt, "Unexpected LMEM reassignment: %lluM != %lluM\n",
>>   				size / SZ_1M, config->lmem_size / SZ_1M);
>> -		return -EREMCHG;
>> +		err = -EREMCHG;
>> +		goto out;
>>   	}
>>   
>>   	string_get_size(size, 1, STRING_UNITS_2, size_str, sizeof(size_str));
>>   	xe_gt_sriov_dbg_verbose(gt, "LMEM %lluM %s\n", size / SZ_1M, size_str);
>>   
>>   	config->lmem_size = size;
>> +	err = config->lmem_size ? 0 : -ENODATA;
>>   
>> -	return config->lmem_size ? 0 : -ENODATA;
>> +out:
>> +	up_write(&config->lock);
>> +	return err;
>>   }
>>   
>>   static int vf_get_submission_cfg(struct xe_gt *gt)
>> @@ -501,23 +513,27 @@ static int vf_get_submission_cfg(struct xe_gt *gt)
>>   
>>   	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>>   
>> +	down_write(&config->lock);
>> +
>>   	err = guc_action_query_single_klv32(guc, GUC_KLV_VF_CFG_NUM_CONTEXTS_KEY, &num_ctxs);
>>   	if (unlikely(err))
>> -		return err;
>> +		goto out;
>>   
>>   	err = guc_action_query_single_klv32(guc, GUC_KLV_VF_CFG_NUM_DOORBELLS_KEY, &num_dbs);
>>   	if (unlikely(err))
>> -		return err;
>> +		goto out;
>>   
>>   	if (config->num_ctxs && config->num_ctxs != num_ctxs) {
>>   		xe_gt_sriov_err(gt, "Unexpected CTXs reassignment: %u != %u\n",
>>   				num_ctxs, config->num_ctxs);
>> -		return -EREMCHG;
>> +		err = -EREMCHG;
>> +		goto out;
>>   	}
>>   	if (config->num_dbs && config->num_dbs != num_dbs) {
>>   		xe_gt_sriov_err(gt, "Unexpected DBs reassignment: %u != %u\n",
>>   				num_dbs, config->num_dbs);
>> -		return -EREMCHG;
>> +		err = -EREMCHG;
>> +		goto out;
>>   	}
>>   
>>   	xe_gt_sriov_dbg_verbose(gt, "CTXs %u DBs %u\n", num_ctxs, num_dbs);
>> @@ -525,7 +541,11 @@ static int vf_get_submission_cfg(struct xe_gt *gt)
>>   	config->num_ctxs = num_ctxs;
>>   	config->num_dbs = num_dbs;
>>   
>> -	return config->num_ctxs ? 0 : -ENODATA;
>> +	err = config->num_ctxs ? 0 : -ENODATA;
>> +
>> +out:
>> +	up_write(&config->lock);
>> +	return err;
>>   }
>>   
>>   static void vf_cache_gmdid(struct xe_gt *gt)
>> @@ -579,11 +599,18 @@ int xe_gt_sriov_vf_query_config(struct xe_gt *gt)
>>    */
>>   u16 xe_gt_sriov_vf_guc_ids(struct xe_gt *gt)
>>   {
>> +	struct xe_gt_sriov_vf_selfconfig *config = &gt->sriov.vf.self_config;
>> +	u16 val;
>> +
>>   	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>>   	xe_gt_assert(gt, gt->sriov.vf.guc_version.major);
>> -	xe_gt_assert(gt, gt->sriov.vf.self_config.num_ctxs);
>>   
>> -	return gt->sriov.vf.self_config.num_ctxs;
>> +	down_read(&config->lock);
>> +	xe_gt_assert(gt, config->num_ctxs);
>> +	val = config->num_ctxs;
>> +	up_read(&config->lock);
>> +
>> +	return val;
>>   }
>>   
>>   /**
>> @@ -596,11 +623,18 @@ u16 xe_gt_sriov_vf_guc_ids(struct xe_gt *gt)
>>    */
>>   u64 xe_gt_sriov_vf_lmem(struct xe_gt *gt)
>>   {
>> +	struct xe_gt_sriov_vf_selfconfig *config = &gt->sriov.vf.self_config;
>> +	u64 val;
>> +
>>   	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>>   	xe_gt_assert(gt, gt->sriov.vf.guc_version.major);
>> -	xe_gt_assert(gt, gt->sriov.vf.self_config.lmem_size);
>>   
>> -	return gt->sriov.vf.self_config.lmem_size;
>> +	down_read(&config->lock);
>> +	xe_gt_assert(gt, config->lmem_size);
>> +	val = config->lmem_size;
>> +	up_read(&config->lock);
> Why is someone mutating this sort of information at runtime?
> Sounds pretty crazy to me.

Only GGTT address can be altered, and only when very specific features 
are used - VF restore and VF going out of sleep.

Memory sizes and amount of contexts can't be currently changed (though 
for admins of farms of VMs, I'm pretty sure it would sound useful rather 
than crazy).

-Tomasz


