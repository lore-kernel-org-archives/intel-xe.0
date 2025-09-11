Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 350E3CAC587
	for <intel-xe@archiver.kernel.org>; Thu, 11 Sep 2025 21:21:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3E1110EB95;
	Thu, 11 Sep 2025 21:21:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BnCFQG0h";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64EAB10E174
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Sep 2025 21:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757625696; x=1789161696;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=rziaB6CzvAzoCTTjefhsO5IvMkwbbDCp4oF6ki6hxMw=;
 b=BnCFQG0hUlByg6va6yLnA6UTcK48zu+f6Se+ET3bUocpTADriTlcqWFu
 ALVF09qbz3Ln2YPziIPc+81ok+/DADi/PbgAJB2dz3ju1HO+0mN3DhFo1
 QJpV8/eJSTo+xYe9hojqaUxZBvAnsR034Xv17wKt22rE/fBs9bPi+nivY
 qAr1KEvmW8QF/UjxOqlFLIS5q3AgKfkOrLJig6dwmRwvGFa3W8eDZSRJz
 M+Ok8XPETsNmkSUpjcc2MYRQRib/senQaewHDvRrlO6yNgAAzSRFy5Sg6
 dUCdL8mh1c4lDr3npWoReLlafi/qKbPhSbr4uNw0Do/0ZxIrH8PeYnuUk w==;
X-CSE-ConnectionGUID: l8IQKRLoS925iocs5HH3Iw==
X-CSE-MsgGUID: VnpWQSasS9+036vvh0bHVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11550"; a="77581241"
X-IronPort-AV: E=Sophos;i="6.18,258,1751266800"; d="scan'208";a="77581241"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2025 14:21:36 -0700
X-CSE-ConnectionGUID: 7LqxtZb1RtCw3AgK6cNr2g==
X-CSE-MsgGUID: 7ugkoOwnSQC5K25hXbduLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,258,1751266800"; d="scan'208";a="177834074"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2025 14:21:35 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 11 Sep 2025 14:21:35 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 11 Sep 2025 14:21:35 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.87)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 11 Sep 2025 14:21:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a/IRG4+N5SyBGHjxzeQAfAvHO5EjOAGIZF1ZbBAw70U8MCPMBggeKF1b30xS+NgKKaHuPyzuxcIUg0nwybred5Ovhlmtb9EJ7qs5TO8oX3JUCxT3vdmBrqJTpaWYfmXxFH7BO1zX2usbV+yTmuyrx5cF/5fhPaWseCzBitdeN2cyTH4DMIfrSWVIRoqRt80GVFGWAC6lh9K42qVawbZENMTsunOS/SrDFmJUaGPpSvOFE1xDEodQvm6mxa2ORFgzJkHfv+n5gryNIByImeWlXT2/LT6i+1A+0bdT2oHULMBJ7OeGC2gGHmhMikaPKA7wqLwyb2e8+CmdBbCTZo+qGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SddhI42taDnBsdrKS6dFGrGOgqFX+/PKLYPf+AHCoco=;
 b=fyO1MaajKEvSekoaqpABftU/+0okUyl/O+d1znOBahSH5n92SGh/YE+GkEiO1e6NImCtRYKTpHSaJfasKn0wCs29CQjign1YYXOxvpkcFr6aNxOoCT44sZ8VJrxqwWT72c+6nZPqh1/8UUf97qv5kay0/LZPHWW91VqzztE/CjogtxgsrB/XhTqPkrvRQbt5mWp+yKWvjSBVWixHVN5Ou1Y8BBxaq8TH6zBdqDJ4xguSd1Sv7+WPjNqSWpvTEcN4LhwKVeryb/vRI/OaxNVpn7ggvztWVk2GES/x/z6bzs8e7uKmRo70mNG7s0sCFfDNM+3bk33hDLp1hVI78W9vRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22)
 by SA2PR11MB4810.namprd11.prod.outlook.com (2603:10b6:806:116::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Thu, 11 Sep
 2025 21:21:30 +0000
Received: from DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1]) by DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1%2]) with mapi id 15.20.9094.021; Thu, 11 Sep 2025
 21:21:30 +0000
Message-ID: <6934c194-9d1b-44ba-aee5-3ce106143144@intel.com>
Date: Thu, 11 Sep 2025 14:21:28 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/5] drm/xe/guc_pc: Use poll_timeout_us() for waiting
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, "Jani
 Nikula" <jani.nikula@intel.com>, John Harrison <John.C.Harrison@Intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Maarten Lankhorst <dev@lankhorst.se>
References: <20250911-xe-iopoll-v3-0-6a95f1cc3b0b@intel.com>
 <20250911-xe-iopoll-v3-2-6a95f1cc3b0b@intel.com>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <20250911-xe-iopoll-v3-2-6a95f1cc3b0b@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR17CA0024.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::37) To DM4PR11MB7757.namprd11.prod.outlook.com
 (2603:10b6:8:103::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7757:EE_|SA2PR11MB4810:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d3c0d08-6bf1-4e9e-8eaa-08ddf1792d06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WGNqRUxFOXkyeUszalB1VXRwT09ZSERGbkNWQUNOYlVNZndHRFhMY2lQR3RU?=
 =?utf-8?B?RE53eVgrQ0M0WC9aMkVGM1dnT3hRcUpPQTZ5VFNsOTBjZnBaSkhpY2RWcGt2?=
 =?utf-8?B?WkJGYk9IQmxFQXo2eEt1YTN4dUR3SEZDV3NXUzR6cG91aXdhaE41cXNZSW5x?=
 =?utf-8?B?SWxIUENNd01reEJiZnVnVExDcXJobloyc3F3bE93cUhmdG13WGtMRzhVRGU2?=
 =?utf-8?B?dFF0clN3SjZiUVF2L2NFTFllMmZTeER6N25pdjNNcXhlVU5JQ3hqYXAxdkxJ?=
 =?utf-8?B?RHFsdjBXZGRaLzh0RVhUWDVPNjBkb2hERnRSc1NINVY4Z2FlelNCclZhRWhY?=
 =?utf-8?B?NlZnc2FDbVFCZVUxVVdQUmQ2M3RoOEhsblVSTytwcVhNUE4vQjBISmhucEpn?=
 =?utf-8?B?c0hadzZwVkEvckI1ZXN4RUxmRW9ZZnBXeFlTN2dDbmNmN3VaeWlNcEQwYkF0?=
 =?utf-8?B?ZkNXSVI0ZUZYNW9tdVJjd3NjN1NxMkdxdXVaWkord0J2TG4xTWVlSWx4Wits?=
 =?utf-8?B?RlBmakFvdkMwV3ZVOTl4Y3VHLzhLTzdsUmlKR1RNNVluWEozU01pOUJQQ3M1?=
 =?utf-8?B?U01oMlRib0NwWHdYcHlEV3J6dTJ1V0Y3QVFUVE4zK2V1YldSb3VyMmNpVzE3?=
 =?utf-8?B?YmRocytlYTFFK0ZEcTNUZFJwYm44N2l6c2pSRDJNRWhvNjJpK2NRN3U1bElH?=
 =?utf-8?B?ZUo5a3d2QUNiaFFtL2pQZWpEcWZMcDZMMjR6dGwwVTZhOUIxM3l3QjdlQld5?=
 =?utf-8?B?NWdLQlJUZmlsOVlURVVSV2hjbXRiZDM4Tk5tN2xQc081VkRwTnJtMmJhK0Rh?=
 =?utf-8?B?azNtNEFoZUFoN0N3ek5TSUNhallDWTd6UHJ5UzVXTFpJaVJCemZqVSs0SXMw?=
 =?utf-8?B?a0JZYms5VXNydjlhVjJ3b0NCR29PRHR2cmVzNzdYMjZvQ1ZvMTZ6eUsxVGZM?=
 =?utf-8?B?US9MR1ZFenovMjNxcUNFRVI2NjBYWlAwMnEvRUlSZkROd3FoQkRlZW1EbGNx?=
 =?utf-8?B?YjRjVVQ3YUp2UWVpVVRFSlkxNnJuVkppT2xsOS94RWtnWndGR24zRnZJWE13?=
 =?utf-8?B?YTlkVmloTjJTT0IwRkw5S1RheFYyeTZsdi9xcUpwdmV5R3VyczE4WlV6dmVR?=
 =?utf-8?B?NXI5NENwakJGbEVkNWM0UjNqQWk5cUxhZEJWUnJqOWFZUE5UaVdEM0YvYVds?=
 =?utf-8?B?K0FCYWtHR3VjRGp6Q0c2Qml4Z3lvNU1xekhDc3AxZ0x4Rlhnd3Vjc245d21I?=
 =?utf-8?B?TTJUM3Mxd1l5bzZiNXN2a3loSjU1bmJMYjJ4cFQrdzVWczdDOGNMQ0h6dEd5?=
 =?utf-8?B?UHk0WDN5aEJVSkxITkViUkZPWXVsSVhKYXRsYWJSZEo1WlpTZ3dMS1RpL1dT?=
 =?utf-8?B?VENlTU5sYXpwR2VWdGViWDAzek1lNi9WbUtkb01QZndreXVnWWc4djd4eEFh?=
 =?utf-8?B?T3pkYnZjckxFOERFSTNEL1RtdTNGdFQ4ekFlQ3czNElKU0JCTGJkV0g5Myty?=
 =?utf-8?B?QUxrbTIwOHNoWEVTYkNoR0syTHJoZHphZ2NpVW9uaUNWL0JWNGhoTWdYaEU1?=
 =?utf-8?B?WkRvMVB0M2dzYkU3V1RJbmNyZ21BYWF3c25wQThjamJ5RmlQSXhYVHFDUmhl?=
 =?utf-8?B?MnJZK2FEUUxBdXU4TFhHV2hKZ1dEVkk5RUhYV2FJQ0s2WVMwaGh3SS9CSFAx?=
 =?utf-8?B?R3hxa1d4QXhHdzhEOXNxdGlLZnpCc2JvUzRSa1NEc0ZVenFqNUdLUlMzeGlh?=
 =?utf-8?B?TlAxTzRpR0JZNXFHWFgxZEsrMzIxbjRYNmxNNE40SHFtc29aN0ZvSDNvVjNh?=
 =?utf-8?B?S282ZVI1azBrSEZ1U3JXelVsUWxEWDY3blF0OTlKLzREMk55a2F1a0RnSFBE?=
 =?utf-8?B?Ym1HaURJd29DOFJ3VEpnRXhKSHRzYlFKdkZvT2dpQ0VicHRvdVVLbUF6ZEVL?=
 =?utf-8?Q?iidAb77qZhs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dlNZUEVJVFZPa0lPYThJa1dubTM5SGdDcE5OV2l5cllHMmRNckFpbFFmeElt?=
 =?utf-8?B?VFFZeDRUREREZDU2NGNGL21SeSs5bzVLRUpodTFERGtDditoL2ZXaFlpT3hK?=
 =?utf-8?B?amlnbmU3Z0huTzkydFQ5MStIMFpOY3lPcTEwRzBoT1k5WEtVbGZLODR4SDdn?=
 =?utf-8?B?Ykgyc3EvRDh5RFp6S1g1YzN4Q29kUGpyczNXczdsUVBQa0gwemxnc3d3MXhG?=
 =?utf-8?B?WU84ME43aFpZTGtKZnZBK3ZtTG1qUjNXdkZkbWdQM2dPdG56RjBjRlhtN3VO?=
 =?utf-8?B?QXh4RTlkUFJtZXBvOSsxNm9uTUhTNnF3V1hLQ1luV1U1cURlaCtpbElwOU4z?=
 =?utf-8?B?eFJORVp1NmdDZUlYMUtTM0FubmhPemVBZSttai9pMitjUC9IUm9jU3ZZUkhs?=
 =?utf-8?B?ZUJQVGI0TTVydGFGOUJzYnJuK0xnajZvVGgwVnFXU1hsOTc5ZUJIeHp3dDlK?=
 =?utf-8?B?NEgvTERhV2p4TXFnQnRMKzdHVnJpbHQ2bEZQR254cEFnaTd6OEcwRnJLMEVJ?=
 =?utf-8?B?VDNBaFFSM0JRbityMXVyWTVxQjBRbFlsNmJyWmpvMHN2U0NJbXUzWmVnNjk2?=
 =?utf-8?B?OXM1OUZQRW9TalVkdkJZNFNzVzAwVHFEQVpNQ1FnczBISGhPaDBpZlN4QjFP?=
 =?utf-8?B?UWNaTDJiV2dhdXVraHRUT2QybE1XazRTM1hIWkNXaVhZYVZrOWxiN25sNDhZ?=
 =?utf-8?B?MXQ0Ylk0dHJwbXI3TjR6NStJUFlncHBwdW1zVVlKUG5MOHZOS05vS205cjcy?=
 =?utf-8?B?ZnQwS0tISHQ5OEd1QWZieUJ6QVdSRTBsNjJMbGRKOGs4YklYSlQyc1ZNY2tx?=
 =?utf-8?B?RngwZHdBa3lOWGZhVGNWWVdDZWtLRzlhSzJncWxTOGJBU0doNjNFMDIvUHEy?=
 =?utf-8?B?QVlCR0Myb1lpTjY3cTVMSHQyZ0IvMFluaWhLbWZYQVAwMG9ENDIzWnZoVEM2?=
 =?utf-8?B?WGRPQ2Z6MzBBNk5mSEplb3R5QUNmQlpCaCszV01UUjU3eWV3by9QT3lRejZD?=
 =?utf-8?B?RGtqQVNLY3pzNWxIeHFBTHlHZkpFR2NNUlNvUTUyQ1pQMUVUVWFUampYU0JU?=
 =?utf-8?B?ZXlJb2ZsdzhkU0RXUmlwUDlZSzhOYVp5RUh5K1hyTWlKT1IrS280anJnQWoy?=
 =?utf-8?B?bDJJZUxZMnFDd0RjVWxDM0h3OTY2VUZodFM5T21DcVpOYlF0YXpDcDExME84?=
 =?utf-8?B?bTRFYXg5bTZFOUt5ZHJDdmdZOWE4d3orY1NWalN4Rm9rZ2pxblNSMEJURzVP?=
 =?utf-8?B?ZWFsdVVlVDJOY2xPVVAyVTF6aUxRdkIzWVc3NnJTd0ZsMkttOFlzN2JvU1ZB?=
 =?utf-8?B?V2hnTmphVVloMWloWUw2VXYyTllpWE5hY1BFSXhZSHMzU25tOEdJcWdDQlVV?=
 =?utf-8?B?TVgxRnVYamZjZTFYTWFYNk5TaGNueXdrNE1DblloVFNyOFlsSHJsNk5LUy9D?=
 =?utf-8?B?VnBDSUZWeFExK2RaYXl0OXBFb0hlWjBDN3RxcEliSy9IYWN3NXpOdGJNTmk1?=
 =?utf-8?B?U3ZIOVp2cmJleTErT0tKRGZuWGdtM2U2M3AzRzVZTVNYbUpSTEpBeThYZXZX?=
 =?utf-8?B?THdKa2pBUjRSR0FjVnFiMkpnWDRSZnpaTXdvc1hyRWQvSVFVd3JxdzQwVm1W?=
 =?utf-8?B?YWJYMVBqL3dHVDloNGNFRE9OZmhwV0hBbkFtMW4xdWFuc1RDbTc3MTRJWFhR?=
 =?utf-8?B?K1ZmVUlWZkdVaVJ4QkJaNmpNNWZCSWdmUW9zaUxxNUt5K2NrcVJsd01oUys1?=
 =?utf-8?B?TWdlQmVKbGVlY1RCem9nSVEzQllZTlZYWEc1U3NUZU1NWFV0a0RRajBEZWNL?=
 =?utf-8?B?ZWNna3p1ekFtbFRncW53T29rUGNqSnJ1dlNRdE9QT3JuOW5hWlEvbWFGT2lm?=
 =?utf-8?B?dDZLR1lTOTYrTVJyYVJVNHEzRzdOaWV2cStQOTBzOGp0UzVQNEE0OWh4Rk5m?=
 =?utf-8?B?ZjF0cDExZ1BNYXJRR0pPUEhkdFZPTCs2aGZIMXdMNTNVYWd5Q3NJamc3SVB3?=
 =?utf-8?B?NTdraFlTZGxLeXNqOHo4bHQ3cXNlMW85VVB5TEU5YWpCMHd2QzJZZnFDMTZD?=
 =?utf-8?B?UEVERHRrRE1RUDE0VXNBTDJ2RWdTNFRValdFWkxvc3p5clJHdDJEUEU0NWNi?=
 =?utf-8?B?Smh5eENzdUxsQjlnUVM5WExKWUZ1bHQ4YnliaHI2ZjRQMDN0OXVhTzVjTy9M?=
 =?utf-8?B?MFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d3c0d08-6bf1-4e9e-8eaa-08ddf1792d06
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2025 21:21:30.7408 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P+HDyhiEtTMhbjNBiOE8j1RoUBvHpE9H59SGAz5X+doPgec4GMIBVnIJvph+ATLIUtRURDT6LrG52WNjevlDwMAL8MiAvcyDpfAcXEPVT6g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4810
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


On 9/11/2025 10:25 AM, Lucas De Marchi wrote:
> Convert wait_for_pc_state() and wait_for_act_freq_limit() to
> poll_timeout_us(). This brings 2 changes in behavior: Drop the
> exponential wait and fix a potential much longer sleep.
>
> usleep_range() will wait anywhere between `wait` and `wait << 1`, so
> it's not correct to assume `slept += wait`.  This code is not really
> accurate. Pairing this with the exponential wait increase, it could be
> waiting much longer than intended.
>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
> v2: Simplify functions by removing helper variables and changing break
>      condition on poll_timeout_us() call (Maarten)
> v3: dial a little bit back from v2: better to have some helper vars
>      and avoid the weird syntax (Jani)
> ---
>   drivers/gpu/drm/xe/xe_guc_pc.c | 42 ++++++++++++------------------------------
>   1 file changed, 12 insertions(+), 30 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> index 68a5bf8e39462..ecfe37836692f 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -7,6 +7,7 @@
>   
>   #include <linux/cleanup.h>
>   #include <linux/delay.h>
> +#include <linux/iopoll.h>
>   #include <linux/jiffies.h>
>   #include <linux/ktime.h>
>   #include <linux/wait_bit.h>
> @@ -130,26 +131,16 @@ static struct iosys_map *pc_to_maps(struct xe_guc_pc *pc)
>   	 FIELD_PREP(HOST2GUC_PC_SLPC_REQUEST_MSG_1_EVENT_ARGC, count))
>   
>   static int wait_for_pc_state(struct xe_guc_pc *pc,
> -			     enum slpc_global_state state,
> +			     enum slpc_global_state target_state,
>   			     int timeout_ms)
>   {
> -	int timeout_us = 1000 * timeout_ms;
> -	int slept, wait = 10;
> +	enum slpc_global_state state;
>   
>   	xe_device_assert_mem_access(pc_to_xe(pc));
>   
> -	for (slept = 0; slept < timeout_us;) {
> -		if (slpc_shared_data_read(pc, header.global_state) == state)
> -			return 0;
> -
> -		usleep_range(wait, wait << 1);
> -		slept += wait;
> -		wait <<= 1;
> -		if (slept + wait > timeout_us)
> -			wait = timeout_us - slept;
> -	}
> -
> -	return -ETIMEDOUT;
> +	return poll_timeout_us(state = slpc_shared_data_read(pc, header.global_state),
> +			       state == target_state,
> +			       20, timeout_ms * USEC_PER_MSEC, false);
>   }
>   
>   static int wait_for_flush_complete(struct xe_guc_pc *pc)
> @@ -164,24 +155,15 @@ static int wait_for_flush_complete(struct xe_guc_pc *pc)
>   	return 0;
>   }
>   
> -static int wait_for_act_freq_limit(struct xe_guc_pc *pc, u32 freq)
> +static int wait_for_act_freq_limit(struct xe_guc_pc *pc, u32 max_freq)

Nit: rename to limit_freq or something instead of max_freq in order to 
avoid linking this to gt max freq.

with that,

Reviewed-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

>   {
> -	int timeout_us = SLPC_ACT_FREQ_TIMEOUT_MS * USEC_PER_MSEC;
> -	int slept, wait = 10;
> -
> -	for (slept = 0; slept < timeout_us;) {
> -		if (xe_guc_pc_get_act_freq(pc) <= freq)
> -			return 0;
> -
> -		usleep_range(wait, wait << 1);
> -		slept += wait;
> -		wait <<= 1;
> -		if (slept + wait > timeout_us)
> -			wait = timeout_us - slept;
> -	}
> +	u32 freq;
>   
> -	return -ETIMEDOUT;
> +	return poll_timeout_us(freq = xe_guc_pc_get_act_freq(pc),
> +			       freq <= max_freq,
> +			       20, SLPC_ACT_FREQ_TIMEOUT_MS * USEC_PER_MSEC, false);
>   }
> +
>   static int pc_action_reset(struct xe_guc_pc *pc)
>   {
>   	struct xe_guc_ct *ct = pc_to_ct(pc);
>
