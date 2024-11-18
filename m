Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 022BAD591A3
	for <intel-xe@archiver.kernel.org>; Mon, 18 Nov 2024 16:34:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AACAB10E453;
	Mon, 18 Nov 2024 16:34:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H0aevK5u";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E5C610E453
 for <Intel-Xe@lists.freedesktop.org>; Mon, 18 Nov 2024 16:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731947673; x=1763483673;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=lcw0AU3K5YoetlUkLWMj9GwsCNcBchxo10nJ0OdUqks=;
 b=H0aevK5up6TjaLqy5gSZMPPwZLVIZHvgFKT6f7dcywD0NEVjIVtw5fwz
 iMQKv1875587UYbz9CZpZI3Kz6FKLj8DQXbmBYtdU7FI0L4WxIfuKUav8
 F/nv25vjmxxQfL5GpjJUIKinLFIwSLCqUt+9EuYZm4unjqbXBs1QHWh22
 lz27hSJhvGlv1o0g6JVvuEZOt/ejpM5c4F6u65dU2bNP2aY+F1tnG7eST
 ilvpdxjnqHYB6OHXUiNRh1J28zyCBoNRfKkIlOP04gRa31K/dXHeSH96a
 +NzQjF3kQviBACKeCJyrorr4Y3yaiC2JdztpJs1soCqZ5MirSEIVRerOZ g==;
X-CSE-ConnectionGUID: hRSdnEq0SGCagi65TcoQjA==
X-CSE-MsgGUID: EhpbfZH/RWipu9/tmwmnzQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="35584802"
X-IronPort-AV: E=Sophos;i="6.12,164,1728975600"; d="scan'208";a="35584802"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 08:34:22 -0800
X-CSE-ConnectionGUID: hEQ6UCrkRya+GXNBMGb0Ow==
X-CSE-MsgGUID: bvrq8/7NSlS5l3tJjdcZHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,164,1728975600"; d="scan'208";a="94088117"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Nov 2024 08:34:22 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 18 Nov 2024 08:34:21 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 18 Nov 2024 08:34:21 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.44) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 18 Nov 2024 08:34:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c3XFs8RSxyts9phmhSPFKqXsc/BlQwHeU4YL979KQuWzC5Zm0HVuxAMSOvB8p2Edh3+uGhm9+FFjke3a3AqGuSnTT1mpSU+wdbwFLZlXHdttIi24KM+kVuOQGtOIC2Bb0JvPRQQN8XFtP2BV90Win3JaLj6ngpVA50hUTOKgQNuSPLqhY2dzPHrvePqHxGWj7a2yz3W7jw4j7e5cH2ENByIRlTrY3NYQO7dxXoF12kH5Er8MmwfjHC23yjBG7t9OAO2uoiwYevMt4sjMYawAs6vG4BcABM02J+RDayfoPvh9vojlQ4FaOVzqe+O5MZSJB/hXiX6T0iVzsmeu0zKeAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NepCG1QGpagGvtWshRQNXCvf40WQJ/DYkPrtfjcz84k=;
 b=o6bYG1PNTsV7QmDhgnOcHx+K45U3/uu5Ajxs/9qCzD4JbCym6KwwzZC98S2TmOI3gRbQshmyDniQX9c0+QyZ+SRiXoYnkz25xtlyuTvzgZV/f2puzh68Wv+kXLxJoLA5GTip4Et8r41MoXEwyih5+BeljzU555WfdQ42X4v2Mgllr5Z4AsrIBLJ1rFx6lP6zX2vYbrV8Sz3zDc6DpZ0FwZDBlc0rOFPH2YdsnmRlJLQmEpJCh2Y3U4I+QzuAL6CUrlTKt5Tdaws2Z9PG1KFy5X+D1ZCZRpSCq8hqppXkz7FSlxmFldlqPEbbOT8RFE2W8liu3zY0HFt7dm0reiD9Ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by PH7PR11MB6556.namprd11.prod.outlook.com (2603:10b6:510:1aa::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.22; Mon, 18 Nov
 2024 16:34:18 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50%6]) with mapi id 15.20.8158.023; Mon, 18 Nov 2024
 16:34:17 +0000
Message-ID: <b579cd76-42b7-4737-9a29-89913693889a@intel.com>
Date: Mon, 18 Nov 2024 08:34:15 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/xe/guc: Add support for G2G communications
To: John Harrison <john.c.harrison@intel.com>, <Intel-Xe@Lists.FreeDesktop.Org>
References: <20241108202216.2020164-1-John.C.Harrison@Intel.com>
 <20241108202216.2020164-3-John.C.Harrison@Intel.com>
 <df4db3df-2a2e-49de-905f-a1c51793b8b9@intel.com>
 <be422e54-dac9-4890-bee5-fed54f090b76@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <be422e54-dac9-4890-bee5-fed54f090b76@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR11CA0096.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::37) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|PH7PR11MB6556:EE_
X-MS-Office365-Filtering-Correlation-Id: 11ec5426-a7fe-44ac-b02d-08dd07eed86c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZXQzQXQ5T2JvUm4xemtLdFgvTmJ2RFQwS2ZIcENpY1I1UFRDV21vTEtOQnRs?=
 =?utf-8?B?Tk45MTJnVDFZdHh1ekI2U2toWnpkUnRpS0F2Umx6YTMvQnkrTWh0ZTdadEdi?=
 =?utf-8?B?dG1vMFpkeHY3b2V5QUZ0bXh4cnJtcTRjaC9tT2RSZkVLbUN2WEZySmhIRnIy?=
 =?utf-8?B?MzZJd2U1R0hpNG5GS0FqRlB5UjV4SmlGOWJUSURKeTNYV3V1UDk3SENuQ2t1?=
 =?utf-8?B?V0pSMkpnL3VGeEZieWhLMnRyc0M0bTJIMHVLM3Z5VlI4MnlhTUZGWHAxazlD?=
 =?utf-8?B?Q2U1ZjN5eGpBSFg1RGg4MHVTR280cmgycWMwMHdGcVg0SmY3SEFic0VXaUJs?=
 =?utf-8?B?TDdwRE5Ya1ZLUGgvV29qZktIZDJiT0ZKM1E2dUJsQkhUUjJuMk5La1lsMXVH?=
 =?utf-8?B?YnlOVHFnclNac1lIdzEyWm9YVUorWnVINmZ5TXU1MmFvRVAvNVlBU3VEcW1n?=
 =?utf-8?B?WHIvY3JmYUZ5dFFURFVPdFlORFNOSnpRemNhK1pVUjB3aEt4UE5UY2p2dzF5?=
 =?utf-8?B?SFExUXJCWG1ZRHpkaEswSkxQaXZYbVBYTS93UXY1UWh5ZENyaDJZVXZLVzlj?=
 =?utf-8?B?VlExbEVVLzE5T0tnVjVDSFZXOXFiRWRjc1VUZFp1TElMV1VyUXB4cDV4S0pL?=
 =?utf-8?B?Zjl0L1JZWnp5UzhzTXR2bUw5SHZyb2xUajJPb0N6RnozUVJUQXIxQUhUeGt0?=
 =?utf-8?B?M0M4MUpTTjJBVnlEd3d0bmR4YmhLYTRHRDZlRHhUQ05tUEhnaENJQjIyTlBZ?=
 =?utf-8?B?MGRka0dsakRtOExQMTZUd0ZSVGM1bVVWNjE3RGJQVjN5NnpmOHZWUzhYeVRo?=
 =?utf-8?B?QitvQVdnMkhya1ZhaC93L0VmSjRFb0wzT21XWXc3T2xoQWw1OU10NnlnVy84?=
 =?utf-8?B?eXVQNWZrRUNPYTR5QmJyOUc1aHBmU0pBV043ZFZlSUpSNlEvMzI3VXltbVpL?=
 =?utf-8?B?RXVVd212V0drRWNKSjJ4MW8wY2twQ2ZmMFl3N0ZJdHAyRURiRTA3MGMrRENp?=
 =?utf-8?B?bXJvbitQZDFZSFlYOUg0RzFqRHM4RDRoNVNmN1ZxYklEdjVXUTh1dU42VXZr?=
 =?utf-8?B?dlZDekcyM3JpOTNFd3JKZE0rQ01WOEJKQlpjZjBmUUJLZ2FpSncrQXlkaTFE?=
 =?utf-8?B?VjZKUTJCbmF3K3crb09qYW15VVJSZWc4QndpbTNyakVlb0lwZ3pxMHBHNFF0?=
 =?utf-8?B?OXcwWk9GSDh2NXhITHcyUU5Id3VxSHFQTmFDREp6MXNlZDFzbTRWeW1hQTZp?=
 =?utf-8?B?UmNKeHZqYlhNazRNTHdIdVdMWUg4SEZ2cml6UnJUbGdCcmFyVTdPUnJFZnYz?=
 =?utf-8?B?OUFpMGdDU2hrSHBNT1l5bE5LZjNrU2FHc2txWk42VXZaTzh2ajBtUlAxUzRX?=
 =?utf-8?B?K0xhcmZkMlpFVnVHZjRQM1JYbGsra1RiS05nZ2w5RHpPOElaaTJINFJmZzd1?=
 =?utf-8?B?bzQrTkUyYTc2aENMVWdnY2NRZU1GY2NTNnFBS1VGOTNFQ0l6L2RyOVF5U0Fv?=
 =?utf-8?B?bjFRcDBIR3BRb2lJZ2lSMFZ2Lzd4aWIzUWJqREFlNCtyREZidkdSZzcyVUtP?=
 =?utf-8?B?QXVhQjJLbXJIYXQ5a1ZzWWt3ei85dWtWeEFmcitRTDJ4RUNBUEdqeEVXUTVm?=
 =?utf-8?B?eDNVWVRwZCtwOFJvbFFXNmVlaUpzcVNaUk8vWDkrNzg4b1dOZW9qdVFnbU84?=
 =?utf-8?B?TVRJRXFJMmoySjRzdUMxSDNESk9PaWlqeVBTbWF0SnFGWUNHb2o3T0x4SUd0?=
 =?utf-8?Q?3EIz4Tm8W/mNXfKxZK6DexyKSPvDL4Puz8kYVDC?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cWtta1hSSHZYd1dBSVAxaTFZMU12aTJ2eGxnUlJiSDFleThiL0NlQ0x5Qnl4?=
 =?utf-8?B?WjB0VENQWGVYY0FFUjNvNGdoYzM0emRWdlFwZUxLajEyNDlJSVFDTmRKNlJ1?=
 =?utf-8?B?U3dGVnBMNURWRzZCcWRvVWRjMFhWNWdjSnNZKy9VRkh2cHlrQVR4YTJILzlr?=
 =?utf-8?B?QW5KbUdIK2xIY0MvS1hRcnQyVHVEY09YaXlpVnVNNXEvVjlTZlYwaXcrdG5h?=
 =?utf-8?B?WUxreGZRekROYkEzaWtMZHZyL3BBTDIvSUh4N2lsSWpwamVnTUhvY0xyanV1?=
 =?utf-8?B?bngzelNtMmUyZnJZM0VIUlpGdk8vVFVtR04vK1ZZWXhUT1A4SC9LZ0FZTzV6?=
 =?utf-8?B?WVhMUVgxcFoxNHRBL3BsdEJmRHRucUJMSFpVREZoOGlLcUp5TmdjSzVlWjNm?=
 =?utf-8?B?c09MN1VMNzZybnRNdHhab1RDenNSNGJOUGRGOSs3STFWblUyTWpRVXBHaklh?=
 =?utf-8?B?d1h1TEw5cUpPR2dVQm5qZFl2ZUhjU1NzeDFwbURkSVJnQzA4UGh4dFFCckpD?=
 =?utf-8?B?REw1R244R1BrcEVENHVjNHVVVUtBVDNrNlZJY1Fob2dtdzdwU2huQUhuOHJU?=
 =?utf-8?B?NlFqZ0xCSUtncXhLS0Z1ZDNEOHdRRVJKWTJlYk9UeFl6bTlIVXNxK2FjV2xX?=
 =?utf-8?B?akM0VE5lY3NVMmhZVnEzdDgvOFNQQlFNdE5YM0hWckdnaUlwMjVLTmJIQkZX?=
 =?utf-8?B?Tmo5SlBUWUJiNmp1WnRIdWs5UjM5eTZucjBpVHZ1U3NjQXR6OU1ONlNKMUhC?=
 =?utf-8?B?M0Q3eDMvRCt6c1Z3Z29KQjFWcFdFUlYvbWFzdWxyWnNRd2pXblltdkYxa3Vu?=
 =?utf-8?B?WGVJQVBNV3RodGhlVzNVVWRyUGFlYllnZm9kWFduN1ByYURPYytheWkyNFY3?=
 =?utf-8?B?QTFPVjFhbkV4cXdDTFk2QUQ5UUM5Y0ZiQUhXNzRnNVJOWWZZZHEyRStBQXBM?=
 =?utf-8?B?dlV0dEZ2ckpBQUdLM0lQaDAwQlVTbS9RbXBuWjRMV21vYW5Va0tlM1pzdkZP?=
 =?utf-8?B?TEl6L1Vwdk9TYndUWkFhNlBBUW9YM2xMSzBPV1puVmlaSUtPQVRXRmJ6MDJ6?=
 =?utf-8?B?T0U1LzhGVDkvNTRob3EyRUNRQkIxMStncEFPWWF4RWJYL0dNcGNUTnA1N09a?=
 =?utf-8?B?OWtmbVorMmJORWVpd1pyYnZwbm0rMUV1OWpGTDJwQit4WkFXU2JQWHVzSnhz?=
 =?utf-8?B?UHY1UHJ4c0VaZlVoTDNCZ0xQZ1dTR0dIR1cxc1pSY1YxNHhWODRhMEQzMzZy?=
 =?utf-8?B?TXRQSVpJOE5DRXJyeHFwS1RmeTNCWmJSdllZOTAvamhCTmswbmdxRHgvcnhk?=
 =?utf-8?B?bTlzOUhzSHVzb001SkxFQ2FLSEp6MVRXNUJIY3RMeWI5b1RRSHpxTmJidUtQ?=
 =?utf-8?B?TUpKZm4wTHdsdmZvZG9CMmNaSjRncEg0bjFaRWtaRm44OHpCbmRzbzBVbG5y?=
 =?utf-8?B?OWVRWFIwRGI0MThadDFhNVRTeEdMcmZ5SzZ1dGNXRGRQRVdVQTQ5RFBOallJ?=
 =?utf-8?B?akQ5K2gwRjdkZW9mbnJnMS8yTDJUOFp3Y29vYlJaWjY2SUUwenJXN2lwN000?=
 =?utf-8?B?ODNsU1E0SmR4MzNveTJyZ0RoVmpvcG1TVTJ0aUVweW5jemwwZkdZR3N5dTZD?=
 =?utf-8?B?U2dqZXFSd2NhWnBIZzRZc3NkSXU1cHcydVZoMHpoWDlpYzVWSDlFMStQTThz?=
 =?utf-8?B?WVpBMTBWZTh3Ung1VUU4NFh1M1JGUExOZmNPaG9CQlJaMlNLVlMrYTNWeW12?=
 =?utf-8?B?TFVzbDNBSWdkTENYZmhTTXhVcU5ra29vejlhOTRpU0NHSlkzVVRJSXJQeFhS?=
 =?utf-8?B?V3Nhb05ZRmsvSG01b2VCbG9Qa2tZWk5KenFISzF6TkY0UkVyamcvOStPUitX?=
 =?utf-8?B?UERPcWdMR3Z5YTg2RFVkYlo4TDBTMlN4NUlMdXBVakQxTFRxblNRRFNCVWM1?=
 =?utf-8?B?VnlnSG1VVXJpRFo2SjBzdU9PbzBGUkR2d0ZjWkdlaFZQZHI3NFJJZnZRcUVh?=
 =?utf-8?B?ZGZ0elVlTUJhZ3I0bWxkdGdZQis5S3JjWENiWW9zUjZEcy9Bbm45SmVCVHJq?=
 =?utf-8?B?Rndqb3M1MnkvOFBqbUdpSkhmeUJncGFzUkxDSEpGckZaRWkxTHE1N2pVM3RF?=
 =?utf-8?B?eERMVEhHRHR1dFN5N3dNYXZGaXdRdUQrcmpVcDd1ckdFRVZ5ZU84bzZFY0hU?=
 =?utf-8?B?dHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 11ec5426-a7fe-44ac-b02d-08dd07eed86c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2024 16:34:17.2341 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wuDAc4sN7HybxuZvaztQJboOfwUn+99btH2uu85qGDgD/G7N6xUabX1UdzwI+mPup8kjG//aXpufbK+W0asIwW1mWZjN3am/K7dbYdvKm+4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6556
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

<snip>

>>
>>> +}
>>> +
>>> +static bool xe_guc_g2g_wanted(struct xe_device *xe)
>>> +{
>>> +    /* Can't do GuC to GuC communication if there is only one GuC */
>>> +    if (xe->info.gt_count <= 1)
>>> +        return false;
>>> +
>>> +    /* No current user */
>>> +    return false;
>>> +}
>>> +
>>> +static int guc_g2g_alloc(struct xe_guc *guc)
>>> +{
>>> +    struct xe_gt *gt = guc_to_gt(guc);
>>> +    struct xe_device *xe = gt_to_xe(gt);
>>> +    struct xe_tile *tile = gt_to_tile(gt);
>>> +    struct xe_bo *bo;
>>> +    u32 g2g_size;
>>> +
>>> +    if (guc->g2g.bo)
>>> +        return 0;
>>> +
>>> +    if (gt->info.id != 0) {
>>> +        struct xe_gt *root_gt = xe_device_get_gt(xe, 0);
>>> +        struct xe_guc *root_guc = &root_gt->uc.guc;
>>> +        struct xe_bo *bo;
>>> +
>>> +        bo = xe_bo_get(root_guc->g2g.bo);
>>> +        if (IS_ERR(bo))
>>> +            return PTR_ERR(bo);
>>> +
>>> +        guc->g2g.bo = bo;
>>> +        guc->g2g.owned = false;
>>
>> It doesn't look like you're actually using the "owned" variable 
>> (which makes sense, because the BO is refcounted so it doesn't matter 
>> which GuC it was originally allocated for)
> Yeah, owned is only there for the selftest that comes later. But not 
> including it now means the g2g structure only has a single entry, so 
> really should not be a structure. Which suddenly makes the deltas for 
> adding in owned later significantly larger!

Can you explain why the selftest would need to know that? Can't review 
it now if we can't see how it is supposed to be used.

>
> Having said that, as Matthew pointed out, the code is currently 
> leaking reference counts as they are not auto-cleaned. So it does 
> actually need a fini function which will use the owned field to decide 
> whether to call put or not.

Why? If you do a get() from every GuC then you need to do a put() from 
every GuC, no need to check.

Daniele

>
> John.
>
>
>>
>> Daniele
>>
>>> +        return 0;
>>> +    }
>>> +
>>> +    g2g_size = guc_g2g_size(guc);
>>> +    bo = xe_managed_bo_create_pin_map(xe, tile, g2g_size,
>>> +                      XE_BO_FLAG_VRAM_IF_DGFX(tile) |
>>> +                      XE_BO_FLAG_GGTT |
>>> +                      XE_BO_FLAG_GGTT_ALL |
>>> +                      XE_BO_FLAG_GGTT_INVALIDATE);
>>> +    if (IS_ERR(bo))
>>> +        return PTR_ERR(bo);
>>> +
>>> +    xe_map_memset(xe, &bo->vmap, 0, 0, g2g_size);
>>> +    guc->g2g.bo = bo;
>>> +    guc->g2g.owned = true;
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +static int guc_g2g_start(struct xe_guc *guc)
>>> +{
>>> +    struct xe_gt *far_gt, *gt = guc_to_gt(guc);
>>> +    struct xe_device *xe = gt_to_xe(gt);
>>> +    unsigned int i, j;
>>> +    int t, err;
>>> +    bool have_dev;
>>> +
>>> +    if (!guc->g2g.bo) {
>>> +        int ret;
>>> +
>>> +        ret = guc_g2g_alloc(guc);
>>> +        if (ret)
>>> +            return ret;
>>> +    }
>>> +
>>> +    /* GuC interface will need extending if more GT device types 
>>> are ever created. */
>>> +    xe_gt_assert(gt, (gt->info.type == XE_GT_TYPE_MAIN) || 
>>> (gt->info.type == XE_GT_TYPE_MEDIA));
>>> +
>>> +    /* Channel numbering depends on whether there are multiple GTs 
>>> per tile */
>>> +    have_dev = xe->info.gt_count > xe->info.tile_count;
>>> +
>>> +    for_each_gt(far_gt, xe, i) {
>>> +        u32 far_tile, far_dev;
>>> +
>>> +        if (far_gt->info.id == gt->info.id)
>>> +            continue;
>>> +
>>> +        far_tile = gt_to_tile(far_gt)->id;
>>> +        far_dev = G2G_DEV(far_gt);
>>> +
>>> +        for (t = 0; t < XE_G2G_TYPE_LIMIT; t++) {
>>> +            err = guc_g2g_register(guc, far_gt, t, have_dev);
>>> +            if (err) {
>>> +                while (--t >= 0)
>>> +                    guc_g2g_deregister(guc, far_tile, far_dev, t);
>>> +                goto err_deregister;
>>> +            }
>>> +        }
>>> +    }
>>> +
>>> +    return 0;
>>> +
>>> +err_deregister:
>>> +    for_each_gt(far_gt, xe, j) {
>>> +        u32 tile, dev;
>>> +
>>> +        if (far_gt->info.id == gt->info.id)
>>> +            continue;
>>> +
>>> +        if (j >= i)
>>> +            break;
>>> +
>>> +        tile = gt_to_tile(far_gt)->id;
>>> +        dev = G2G_DEV(far_gt);
>>> +
>>> +        for (t = 0; t < XE_G2G_TYPE_LIMIT; t++)
>>> +            guc_g2g_deregister(guc, tile, dev, t);
>>> +    }
>>> +
>>> +    return err;
>>> +}
>>> +
>>>   static void guc_fini_hw(void *arg)
>>>   {
>>>       struct xe_guc *guc = arg;
>>> @@ -423,7 +688,16 @@ int xe_guc_init_post_hwconfig(struct xe_guc *guc)
>>>     int xe_guc_post_load_init(struct xe_guc *guc)
>>>   {
>>> +    int ret;
>>> +
>>>       xe_guc_ads_populate_post_load(&guc->ads);
>>> +
>>> +    if (xe_guc_g2g_wanted(guc_to_xe(guc))) {
>>> +        ret = guc_g2g_start(guc);
>>> +        if (ret)
>>> +            return ret;
>>> +    }
>>> +
>>>       guc->submission_state.enabled = true;
>>>         return 0;
>>> diff --git a/drivers/gpu/drm/xe/xe_guc_types.h 
>>> b/drivers/gpu/drm/xe/xe_guc_types.h
>>> index fa75f57bf5da..83a41ebcdc91 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc_types.h
>>> +++ b/drivers/gpu/drm/xe/xe_guc_types.h
>>> @@ -64,6 +64,15 @@ struct xe_guc {
>>>       struct xe_guc_pc pc;
>>>       /** @dbm: GuC Doorbell Manager */
>>>       struct xe_guc_db_mgr dbm;
>>> +
>>> +    /** @g2g: GuC to GuC communication state */
>>> +    struct {
>>> +        /** @g2g.bo: Storage for GuC to GuC communication channels */
>>> +        struct xe_bo *bo;
>>> +        /** @g2g.owned: Is the BO owned by this GT or just mapped 
>>> in */
>>> +        bool owned;
>>> +    } g2g;
>>> +
>>>       /** @submission_state: GuC submission state */
>>>       struct {
>>>           /** @submission_state.idm: GuC context ID Manager */
>>> @@ -79,6 +88,7 @@ struct xe_guc {
>>>           /** @submission_state.fini_wq: submit fini wait queue */
>>>           wait_queue_head_t fini_wq;
>>>       } submission_state;
>>> +
>>>       /** @hwconfig: Hardware config state */
>>>       struct {
>>>           /** @hwconfig.bo: buffer object of the hardware config */
>>
>

