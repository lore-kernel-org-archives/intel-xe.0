Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95791CFC287
	for <intel-xe@archiver.kernel.org>; Tue, 15 Oct 2024 10:49:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FF4910E099;
	Tue, 15 Oct 2024 10:49:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MrCmKW04";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 553EC10E099
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Oct 2024 10:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728989348; x=1760525348;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=VBsdmtclShJJWrPAQCM6WlpuoAHe0Fl/c2cJmFTPbSE=;
 b=MrCmKW04Fcba8XoCZQNri6mIuJshHSEVIUiqQER1VTagD/y6IyBXqHAk
 nnst4zdPtvmFIMBkJD8OcDc+71MuNzfvnLqRVV8MqdBoT4Kw6zYVJ5uJH
 3L7vE24t4pgF86pjYs49OKOwzLZ30bPGtnAN5NbbNjO/i1zC7sYGNSw2S
 xoiThlDCmGcrsicos4ZcGxr0xlK2KtbiTHBu8MHbA34ajUxnh9cYy4S0+
 4Xpc/7fIxko0ouBOOEaKdII6YsFvY4fFBxkfAfm5skyQedag5/PKLe1YJ
 hyJ8kc/CLTWWftwQCGyckKyTTSI88GHgzfEQLSUklvpDqV4NoBeCvGTmp Q==;
X-CSE-ConnectionGUID: rEemRiWlRQOgt8IkH5vq7w==
X-CSE-MsgGUID: OUoW3YJkQw6UOsWU5LL+og==
X-IronPort-AV: E=McAfee;i="6700,10204,11225"; a="32292104"
X-IronPort-AV: E=Sophos;i="6.11,204,1725346800"; d="scan'208";a="32292104"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2024 03:49:07 -0700
X-CSE-ConnectionGUID: MYi7ARhWRd6Iwt4PfkWOyg==
X-CSE-MsgGUID: e1WTaKgvSHyVkEPjX1vCKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,204,1725346800"; d="scan'208";a="77867293"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Oct 2024 03:49:07 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 15 Oct 2024 03:49:06 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 15 Oct 2024 03:49:06 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.43) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 15 Oct 2024 03:49:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rjBK7TsorTEr+TraK3LzLHG76FsnDk3XHv/914w+CklHMkoFU/Ix4nj17LSdIvmypmYh2c9WsDs1pqWIaBI39kdEP7ZftMZIXS2Wipf54OyiPrpmwcacRrc4EUB7lT3NgForHSx+ZGaXaoKYYqaiuW2svP4+czoTem0n9u61nYl0eGAKTFWWawqwlGM/LsmvWmb8vQ40wkcP93I2UhECshUl59j0A2lhmn0Z4xyo0dRgfF7cSngvuZMGP/HwSJ5P7GbkfX9oPoDmfyWruHoust7CVFXmvns4v29o7FCBJc5Kp8rZ1ajnEBDCzvz2/Nidw6VGS0cFYuAdGxYmBVc/HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C7yOdNZCR0gr0NK/7ye7Wx81DT7T9s/m7uVHrx/fibg=;
 b=eV9dy8OQmqbjMasJQ0S8M2UcVkq58CiRDGXCWyKP5nacS54aYuxd/TV5YhELi0oEdNkpRaX6dcboOGdSFqf7VjnbpyH+kpCu6XXeCs/+l0VWVnhxVwE4wwM4U2IJ304nwMRNXhIUp4RF8OmXgab/HrN3dpzQqIqwcrGkZ7MEl4KJ8U29kZuZgbElZvqjtX+yN88LsArVnjisV2PxetlUjvxIPtsVmMYIX11ikOOkNFvnUksS50ywYa3KCgUb9BWw9J+FRKexzy+cjtKi3qiydWcV08qjhZUvLv1gcv/nx/ZKG/3Kz59E+dKfQKIdfqJBgB6WwO4JJPzP7UXTDb0V7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB6614.namprd11.prod.outlook.com (2603:10b6:806:255::11)
 by BL1PR11MB5237.namprd11.prod.outlook.com (2603:10b6:208:310::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.27; Tue, 15 Oct
 2024 10:49:03 +0000
Received: from SA1PR11MB6614.namprd11.prod.outlook.com
 ([fe80::aa2a:7e7a:494b:3746]) by SA1PR11MB6614.namprd11.prod.outlook.com
 ([fe80::aa2a:7e7a:494b:3746%2]) with mapi id 15.20.8048.020; Tue, 15 Oct 2024
 10:49:02 +0000
Message-ID: <4e42c97b-d9ee-4f36-880a-8daf0f6d524d@intel.com>
Date: Tue, 15 Oct 2024 12:48:58 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm/xe: add system memory page iterator support to
 xe_res_cursor
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Mika Kuoppala
 <mika.kuoppala@linux.intel.com>, Jonathan Cavitt <jonathan.cavitt@intel.com>
References: <20241011-xe_res_cursor_add_page_iterator-v3-1-0f8b8d3ab021@intel.com>
 <Zwndjh6knRv2Bs0P@DUT025-TGLU.fm.intel.com>
 <8bdfbeb3-5a02-404d-bd58-74e471f29905@intel.com>
 <Zw32fauoUmB6Iojk@DUT025-TGLU.fm.intel.com>
Content-Language: en-GB
From: "Hajda, Andrzej" <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <Zw32fauoUmB6Iojk@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MI1P293CA0022.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:3::19) To SA1PR11MB6614.namprd11.prod.outlook.com
 (2603:10b6:806:255::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB6614:EE_|BL1PR11MB5237:EE_
X-MS-Office365-Filtering-Correlation-Id: 53b2c7f6-cdb6-44a3-b54d-08dced06fb76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZllKN242VC9sZi9YQXJFNi90LzR0dHF1S1BwM2Urbm9SRUJIM0dEMll5cEhK?=
 =?utf-8?B?QWUxUkIrczdDZEExa3k0ajVLbFJteHV2U2lmNnFGYytKUy8vUitSMjBxbjZF?=
 =?utf-8?B?L0FHSFNiTTFzMUx5bFJWYm5VSEltc2x2bWJwWllMcnZtZVFhWE4zVXRNUlZa?=
 =?utf-8?B?YlRrN1F6Y244U3BvMGkvNUNJWU9oRFBaRXBJdStlc1lIM3J5ZktJZ0M5dXdY?=
 =?utf-8?B?NzE2ci9qM1J5UEo1NUsrWVFsY2FlWUlIVnhkR1BpbHBhcWF3TGcrZDRnbnNX?=
 =?utf-8?B?WGRPSmRjL2tYMmxzZjJlWVVtT2h4Q3JzcE8xUktDNUkyTXJtaDJDU0loMVNO?=
 =?utf-8?B?a0E0WVF5bHlWRDUyV3NxNUlNNzlXLzZsait0VnFyU0VkL05wVmROUUxEbEJI?=
 =?utf-8?B?SWdKbDBMeTRFd3kzQnFkVTNVc2dFM1JlZGpDSHByTDBUeENVdjNpOEt0NzFo?=
 =?utf-8?B?dVhIajEzeFE0cm8xQTd4WFRwSDArRk55YS9ZS1FQSGIxaGJId21IOWovengy?=
 =?utf-8?B?cU9CbG0wUkRKV0V5S3hUcm9NRnkrTldHVGIxVldlSE1xWTJvWWhKUkM0YkxH?=
 =?utf-8?B?cU5BdzJmV0daUWRpMHNZU3ovVVpSODZMYTRBUENhNGhjeGo1MlFLeFFIWVNZ?=
 =?utf-8?B?eDBBOTM1alVHbnN3ek4zTWdHQUQ3eTQzaDhSaVBiekp6a0dnbTVzNS9TR2lY?=
 =?utf-8?B?YjhQK2tOMEE3OVplVGh6aDlsbE5FYm1OMnh1WDBiOVB1MWJXRUFYZlU1ZC9p?=
 =?utf-8?B?cHdud3BBeElwenIxQ04yZ1pqT1c0WUE1eXgzb2RzRzNKUUhzMmRxd21xbHhL?=
 =?utf-8?B?Z3dldi9HTWpZNjNWRGgrREdLMTVVL3FuazNscWI0M05MM0NwL2EzSVVkeFdn?=
 =?utf-8?B?d0lXcTJPc3M2cmJ6ZGp1ZnVCMW9HbUg3MG00dnlYMFV6ejlJTE9qVEVWSG94?=
 =?utf-8?B?MXluTmllYWFCaDl4MVZFWUhpcGRZZFUwRXBnWTRNVjlzcldacm1mZ3dnejB0?=
 =?utf-8?B?UG4veTBqdU93TGFrNkMzcTRHY2Q2QnZpcE41WHBwa1MzYVE4c0laNzRpd0RD?=
 =?utf-8?B?amh4dWwyU291SE8veHN5OExkMkJpaGJyS2lXT0p1U24yQTFsY3Z2L1VWK0pT?=
 =?utf-8?B?WkFVRTZ6V2tWMjhrc0haSUhCMnl5aUdGWXlYTFZtSGlFbkZOcUdGdkR0OWtF?=
 =?utf-8?B?YUpJMmpiMW1QRlo4K3VVWlVSRTM3eHowMDJIVUNuZEtZYzliZXlzV1BINjNj?=
 =?utf-8?B?ckZ3M2FCN1FpWnJwYTNHZGNGa2U2cmlncXdmaGsxZDdudXppck14YUp6NEYv?=
 =?utf-8?B?ZlFiaTNITURpT2NkOFdweDhBbFIvVnpKOUhDcEMrSWRLbmFZSGpkdlRhRFQr?=
 =?utf-8?B?bVBTVTQ3M3dlOXk4YnFaVkdyY29mM0tRbFFMc09SOW5OMnZPYmtReDFaYzJM?=
 =?utf-8?B?blBwQ0Z0Zm5OV3dzQWwyZ2dNdlhyNjlGZFlpNmF4ZG9Sb3V6ckl6LzJ5WG02?=
 =?utf-8?B?NWQrQUJGd3NoQWd2TkdTeW44TnROYkNlY3JDU2RQdHNGcmk3RkRjb0pOTGdm?=
 =?utf-8?B?am0yMm0ydDVKYXhYZkxOMnpqYjU4WklJWnd6cGpLM05qUXhJUUJqV1AyNmx3?=
 =?utf-8?Q?SRQX14mVT5+0oQQYobIYSyeHM4AvyTIUKi0mh6SqlZKI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6614.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OXMwRnBUUCs1RHRoM2QrbVRqNmVLK0sxaDNGcHJKckhlRGNQNnAxUWlMM1lB?=
 =?utf-8?B?S0xWK3dHZkdZN1p2OHRVYmwwYUVFYnhaTHRvRy9sVnlrREpoeWdNSGZxWkJO?=
 =?utf-8?B?UnhJeEl5Z21pSkNGdk9NcWRKdU55d1NRNzZmcmdndHMrZ2N6dng5OW8zUjll?=
 =?utf-8?B?UXlQaWdyU3BJSDUxWEZmSXlNb1FEU2duUWJVRXlvdnlrOS9zZDVBdWhoN2pS?=
 =?utf-8?B?ZGZBd3hJQWdrOUEvQjkvZ0JwVlN5ZkxKQ2U2c3N4emRVSm4yWklFWnRUM0x2?=
 =?utf-8?B?dTVSZk8zSE5NRzY0aXJFTUhMRUoyQVFoWExobytjZUZzR0N6ZkVmRExsTTZ1?=
 =?utf-8?B?UW4vakNDdFhGdlAxQ0QvUmNFdlJRQkdxOHNvZ1ROWmViQThJeiszekF2dWtL?=
 =?utf-8?B?K2ZydU4yQ3VXVTVZbWR1eXp3aXBCaXVScEhNZTRRNE44b3d3cnBvZVdTRGhn?=
 =?utf-8?B?dzNNdUhHdlRXaGN5bC9Md0Q1TGpnTFNBS24weHBScTBiZU9HTDhNZnFmTk83?=
 =?utf-8?B?ajJldjZOVVQ4NE5DbXg1bkZPRGs3anBHbFpvdzAvNHJrK0Rtd3RJMEhCK2dE?=
 =?utf-8?B?VDZnak5LT3RldzVYMHlOWW1pUG1MUERYVUluaXI4REljN1IwSk9ZS2dCUHdi?=
 =?utf-8?B?bnl1bkNvZkQvbWkxeUZ6MEtTdFRHdUZaRURYSllXZmtrRHQ4L0Zlc1FZZGFt?=
 =?utf-8?B?TUZJbEppbWlmN3ZBK0JrdFFEUHB1d1VHa1VVUVhNV1ZuWUtYcTAzbTdpTGpN?=
 =?utf-8?B?NlMrVjVIdlU5ZFIxYjRMMnJxU2RzbmdHNHcrQ0NMOGVrMk5mQUpTMjFSdlN2?=
 =?utf-8?B?dXhsRGYxQ3QyaXNwRU1FbVNEOFZ3TGZjS0hBZlhhVE1PZ2NOL0lLRDF5Z0tj?=
 =?utf-8?B?K2hjTk96RzIyajc2QUZmeHpLYkxuVWVEamJZUXV0MHVPR2Y0dkhubHhJSkxN?=
 =?utf-8?B?dEljc3p2QTVuNXJnc0pKaUdRSXpGQTFrRUoxaDluVU9kT0tQSkRIVCt5WkpV?=
 =?utf-8?B?UExNanhHVWMyN3NGQjQ4dkNwUHZaTjJxaTdRc0RxNnQ5djZwWGZYdGdlM1kz?=
 =?utf-8?B?V2ZBWUJsNUlSV0c4RXRZTXNPeTNjSjE5SXAvZW1ZODhXd2cxTzhtL3Nzcmdx?=
 =?utf-8?B?eVYyUG9iTzV4VzVpeExIcy9SL2I2dWJ1SC9lT3h6RTM2TzBNNmp2QVp4Smsv?=
 =?utf-8?B?NVM1Z3VIYkZRVml0R1ZTVldMYis3Wmlyc0RVUStieFVyOHZ4bm0zOWFaQXMx?=
 =?utf-8?B?TVVRTGVNT3RndEFiRDBJbytUSWZURk1NQ2ExTWV2SDUvWUVWM1NGMUNXUWNy?=
 =?utf-8?B?VmpDSnFHczFucm1mVkdpRDhQUE9PVUFGZTIvcUJIV2FFaXNBdVRKbUYybmpQ?=
 =?utf-8?B?SFVvclo5TnpWTFNPaC9xYkZheEhSNCs4WHdzZWtRWXl0UXI1cW0rSUptN1NB?=
 =?utf-8?B?VDNBaFZvamo4T0MzSVRuck0yMldyN1JDaWFZMUJLdlRkL0RqYnRSbll2WUcz?=
 =?utf-8?B?L2JKcTF2ZFN5THdYU05WMWdYbkIySG9xMHJEQnJhM3JJUHNnQkY5KzZ3YnFE?=
 =?utf-8?B?V0V4bjFDektaN2tEZDUveFVqaW5FTnZRVGJCVlBNaW9vZUVoMXEzMTQ5Z2dZ?=
 =?utf-8?B?bkcxRlZEWkhiLzIyRVpQUFBMVWFkeVB3SUVnOGxkczB0R28zdnVzU3U1ZGFE?=
 =?utf-8?B?KzMva3EvcHUrL3I3eHY4MWhuQWt6TnVHTERWRWlmS3pTTXN6Z2pvRGV6NmQw?=
 =?utf-8?B?ZTV0R1dHVVc3WVJ2RDljeHBlMmx5TzRvU1psSmtQeTRaeG9ERHRCeEhpazdl?=
 =?utf-8?B?dnlIUGRWdDBQUGFkOWhBaVo0V3RrLzhacGsxRzJaaTBsV2hZcGpUWWcvTkFl?=
 =?utf-8?B?QURpWnlPMnRPaTdoNWNzLzRqOTYrZFIvaEFuMk82dWxwQ1E1c29KT0JTVUl0?=
 =?utf-8?B?QmhaQ0lCZ3g1UDFubDdkckFSU3BIeUhMTjJpeGZLYzc3Wm9Vc3d3ZFcvQUR0?=
 =?utf-8?B?UGpja1BmdUN4MUZ2dGtOVVdqcHlrZUVuUGFLald2TlRQOWQ0QzRlbWVodGdK?=
 =?utf-8?B?UVZmMG80MTVMU1RiUUNXNlJ0TTZ1c3ZaNm5VWi96NHpCNDlCQng5TXEzVFZD?=
 =?utf-8?B?MTg5SVNGRFpHNVlsVk5wK2dmS3V1Q1AwVG5NQWs0emtFaDFMWUFVRFZQbktS?=
 =?utf-8?B?Wmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 53b2c7f6-cdb6-44a3-b54d-08dced06fb76
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6614.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2024 10:49:02.7098 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sVu4OyFmAh9GK41q9jV8ENMwvHcTDbsmipBuz18Z/ZrSXAEcd5OC/ZawskwpGQI1Ohu21Dc0NKViJNARm74x0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5237
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


W dniu 15.10.2024 o 06:58, Matthew Brost pisze:
> On Mon, Oct 14, 2024 at 10:18:13AM +0200, Hajda, Andrzej wrote:
>> Hi Matt,
>>
>> W dniu 12.10.2024 o 04:23, Matthew Brost pisze:
>>> On Fri, Oct 11, 2024 at 09:26:30AM +0200, Andrzej Hajda wrote:
>>>> Currently xe_res_cursor allows iteration only over DMA side of sg tables.
>>>> Adding possibility to iterate over pages allows the use of cursor in more
>>>> contexts.
>>>>
>>>> v2: fixed wording in commit message (Jonathan)
>>>> v3: indentation and author fixes (checkpatch)
>>>>
>>>> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
>>>> Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
>>>> ---
>>>> - Link to v1: https://lore.kernel.org/r/20241009-xe_res_cursor_add_page_iterator-v1-1-c883446e5770@intel.com
>>>> - Link to v2: https://lore.kernel.org/r/20241011-xe_res_cursor_add_page_iterator-v2-1-367b74c1cc29@intel.com
>>>> ---
>>>> Hi all,
>>>>
>>>> This patch is required to proper implementation of userptr_vma access
>>>> in configurations with iommu turned on[1]. Required by upcoming eudebug
>>>> feature.
>>>>
>>>> [1]: https://lore.kernel.org/intel-xe/20241001144306.1991001-13-mika.kuoppala@linux.intel.com/
>>>>
>>> I'm failing to see why this patch is required for [1].
>>>
>>> I don't see this patch included in [2].
>>>
>>> Both justifications here are pretty vague - 'use of cursor in more
>>> contexts' or 'Required by upcoming eudebug feature'. Not understanding
>>> the why. Can you please elborate?
>> IIUC sg tables after mapping operation contains mappings between list of
>> pages (represented by pair of struct scatterlist fields: page_link and
>> length) and list of dma addresses (represented by: dma_address and
>> dma_length), both lists are 'hidden' in sg tables.
>>
>> Currently xe_res_cursor can iterate only over dma addresses, ie after every
>> call to xe_res_next xe_res_cursor.sgl points to scatterlist corresponding to
>> dma_address at requested position.
>>
>> But for eudebug we need xe_res_cursor.sgl pointing to scatterlist with
>> page_link corresponding to requested position, ie we need to iterate 'left
>> side' side of the mapping. The only change to achieve this is to track
>> .length field instead of .dma_length.
>>
>> I hope my understanding of this is correct, at least tests are positive :)
>>
>> Userptr implementation in v2 does not work with iommu, and does not use this
>> patch, and needs to be fixed. My intention was to get early feedback on this
>> approach and merge it separately, or alternatively post reviewed together
>> with eudebug v3 patchset and with userptr_vma patch [1] updated to use
>> introduced xe_res_first_sg_system:
> I'm getting a little lost reading this but I think I'd have to see the
> complete picture to know if this correct - it doesn't seem to be, so
> maybe hold off on merging for now.

Sorry if my explanation is not clear, the patches are on Miku eudebug 
public branch[1], it should make at least clear how to use improved 
iterator.

Ie this patch is located at [2] and the patch implementing userptr_vma 
is at [3].

Of course I can post these patches here if you prefer.

[1]: https://gitlab.freedesktop.org/miku/kernel/-/commits/eudebug-dev

[2]: 
https://gitlab.freedesktop.org/miku/kernel/-/commit/c0cd313ec50ba224d6a17149fbd13a85a9d3e906

[3]: 
https://gitlab.freedesktop.org/miku/kernel/-/commit/834eb9f9b4ab3fd6ff9e8f2eaa6beb507b578ff1

>
> Also if you see my comments here [2], in general I think the userptr
> implementation needs to be tweaked to operate on pages rather than a sg
> list.

I agree, we should operate on pages, but my point is that we do not need 
to tweak implementation, we have access to

these pages via scatterlist.page_link.

So this patch answers your concerns in [2]. With this patch we can 
operate on pages, this way:

int cur_len; for (xe_res_first_sg_system(up->sg, offset, len, &cur); 
cur.remaining;xe_res_next(&cur, cur_len)) {
	|void *ptr = kmap_local_page(sg_page(cur.sgl)) + cur.start; ||cur_len = min(cur.size, cur.remaining); // do whatever with page mapped 
via ptr |}

So the key question is if my assumption on scatterlist.page_link is 
correct? If yes then the patch looks correct.

I cannot find documentation proving it but for example presence and 
usage of  core helpers for_each_sg_page vs for_each_sg_dma_page suggests 
it could be true.


Regards

Andrzej


>
> Matt
>
> [2] https://patchwork.freedesktop.org/patch/617481/?series=136572&rev=2
>
>> @@ -3662,7 +3662,7 @@ int xe_uvma_access(struct xe_userptr_vma *uvma, u64
>> offset,
>>                  goto out_unlock_notifier;
>>          }
>>
>> -       for (xe_res_first_sg(up->sg, offset, len, &cur); cur.remaining;
>> +       for (xe_res_first_sg_system(up->sg, offset, len, &cur);
>> cur.remaining;
>>               xe_res_next(&cur, cur_len)) {
>>                  void *ptr = kmap_local_page(sg_page(cur.sgl)) + cur.start;
>>
>> OK, also s/xe_uvma_access/xe_vm_userptr_access/, but this is different
>> story.
>>
>>
>> Regards
>>
>> Andrzej
>>
>>
>>> [2] https://patchwork.freedesktop.org/series/136572/
>>>
>>>> Regards
>>>> Andrzej
>>>> ---
>>>>    drivers/gpu/drm/xe/xe_res_cursor.h | 51 +++++++++++++++++++++++++++++---------
>>>>    1 file changed, 39 insertions(+), 12 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_res_cursor.h b/drivers/gpu/drm/xe/xe_res_cursor.h
>>>> index dca374b6521c..610407f23dbd 100644
>>>> --- a/drivers/gpu/drm/xe/xe_res_cursor.h
>>>> +++ b/drivers/gpu/drm/xe/xe_res_cursor.h
>>>> @@ -129,18 +129,35 @@ static inline void __xe_res_sg_next(struct xe_res_cursor *cur)
>>>>    {
>>>>    	struct scatterlist *sgl = cur->sgl;
>>>>    	u64 start = cur->start;
>>>> +	unsigned int len;
>>>> -	while (start >= sg_dma_len(sgl)) {
>>>> -		start -= sg_dma_len(sgl);
>>>> +	while (true) {
>>>> +		len = (cur->mem_type == XE_PL_SYSTEM) ? sgl->length : sg_dma_len(sgl);
>>> This doesn't look right. sg_dma_len should always be sufficient unless
>>> I'm missing something. Can you explain why if 'cur->mem_type ==
>>> XE_PL_SYSTEM' you need to directly look at sgl->length rather than using
>>> sg_dma_len(sgl) helper?
>>>
>>>> +		if (start < len)
>>>> +			break;
>>>> +		start -= len;
>>>>    		sgl = sg_next(sgl);
>>>>    		XE_WARN_ON(!sgl);
>>>>    	}
>>>> -
>>>>    	cur->start = start;
>>>> -	cur->size = sg_dma_len(sgl) - start;
>>>> +	cur->size = len - start;
>>>>    	cur->sgl = sgl;
>>>>    }
>>>> +static inline void __xe_res_first_sg(const struct sg_table *sg,
>>>> +				     u64 start, u64 size,
>>>> +				     struct xe_res_cursor *cur, u32 mem_type)
>>>> +{
>>>> +	XE_WARN_ON(!sg);
>>>> +	cur->node = NULL;
>>>> +	cur->start = start;
>>>> +	cur->remaining = size;
>>>> +	cur->size = 0;
>>>> +	cur->sgl = sg->sgl;
>>>> +	cur->mem_type = mem_type;
>>>> +	__xe_res_sg_next(cur);
>>>> +}
>>>> +
>>>>    /**
>>>>     * xe_res_first_sg - initialize a xe_res_cursor with a scatter gather table
>>>>     *
>>>> @@ -155,14 +172,24 @@ static inline void xe_res_first_sg(const struct sg_table *sg,
>>>>    				   u64 start, u64 size,
>>>>    				   struct xe_res_cursor *cur)
>>>>    {
>>>> -	XE_WARN_ON(!sg);
>>>> -	cur->node = NULL;
>>>> -	cur->start = start;
>>>> -	cur->remaining = size;
>>>> -	cur->size = 0;
>>>> -	cur->sgl = sg->sgl;
>>>> -	cur->mem_type = XE_PL_TT;
>>>> -	__xe_res_sg_next(cur);
>>>> +	__xe_res_first_sg(sg, start, size, cur, XE_PL_TT);
>>>> +}
>>>> +
>>>> +/**
>>>> + * xe_res_first_sg_system - initialize a xe_res_cursor for iterate system memory pages
>>>> + *
>>>> + * @sg: scatter gather table to walk
>>>> + * @start: Start of the range
>>>> + * @size: Size of the range
>>>> + * @cur: cursor object to initialize
>>>> + *
>>>> + * Start walking over the range of allocations between @start and @size
>>>> + */
>>>> +static inline void xe_res_first_sg_system(const struct sg_table *sg,
>>>> +					  u64 start, u64 size,
>>>> +					  struct xe_res_cursor *cur)
>>>> +{
>>>> +	__xe_res_first_sg(sg, start, size, cur, XE_PL_SYSTEM);
>>> Not seeing where this function is used in [2].
>>>
>>> Matt
>>>
>>>>    }
>>>>    /**
>>>>
>>>> ---
>>>> base-commit: f1561e6c62b5b5c3fe0276f2fbe7325e0d7c262d
>>>> change-id: 20241009-xe_res_cursor_add_page_iterator-d29d73c3eb99
>>>>
>>>> Best regards,
>>>> -- 
>>>> Andrzej Hajda <andrzej.hajda@intel.com>
>>>>
