Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD831C25B75
	for <intel-xe@archiver.kernel.org>; Sun, 26 May 2024 18:48:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 580D810E087;
	Sun, 26 May 2024 18:48:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E6knYRsB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C77310E087
 for <intel-xe@lists.freedesktop.org>; Sun, 26 May 2024 18:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716749294; x=1748285294;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ISgdh3QjT0J87oxH1RQvNf1kV+1C0COkj0ohh4UTb8M=;
 b=E6knYRsBdszfqSvyVBTgxvzhVDGslgSPMxvzL/XQr5FUtisGBLX9yRDm
 +UrW9xRW67yQWdfVOjTd4c8gakHus7tg0pOC/R38ojKW79jFNu24iPBSq
 4solUxmNCaN1xF9btnp4Nco0mciFkaY9VgSviSCjwVQcHt0U+tXIZck92
 J6P7UeN+j+UTAOdkOadmlZPOy57ZbvKZRgn6pGeHVJqt75ksK8etj6HIt
 deWQelx573GVXBtHKbC+ZgHMiwrbXmlzAUg7EYt3VbClkUj8+5DCHJETI
 63rjRZ+uF8u9YTnsmo62DO/3bPADto72tUXESFXg/WP6TNZKjKEUotgyj Q==;
X-CSE-ConnectionGUID: w6ZPrSPrThqQJmxSTTY0xg==
X-CSE-MsgGUID: SAOY4vceTeWBmqcSbjmcOA==
X-IronPort-AV: E=McAfee;i="6600,9927,11084"; a="23664059"
X-IronPort-AV: E=Sophos;i="6.08,190,1712646000"; d="scan'208";a="23664059"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2024 11:48:13 -0700
X-CSE-ConnectionGUID: p84cUKTUS0iMpIjtalneiQ==
X-CSE-MsgGUID: UGjpUvxHQXmtFq1uCrtF0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,190,1712646000"; d="scan'208";a="34627017"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 May 2024 11:48:13 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 26 May 2024 11:48:12 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 26 May 2024 11:48:12 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sun, 26 May 2024 11:48:12 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sun, 26 May 2024 11:48:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vj5CEHQWvnqefli5sy0WOD9sOp0iFBv7U9ZrN95GTuwZus7eJxEcsg2GIACmzNhXqoUOvLUJFx/fpFVV8Zv94NG4FFIk1Jni2Meif4v9HqtcpTPQX7lGLO+8gva4O9q2DXPrG7O3d7ojHGCxu31DZzvplPvlzxW8U4lMKatwdlK33lcx9KrZzNc9inMkLDDIBm5pLyvfVRJP3Vjpz0CK2tYy2aMCHhdgsqNO/twoDirCEFDnFR50k52WEBxw+Yq6rPy5MXjUKOqwdBRNJH61A5cZjvFcG7icbcmv+Rn0UeVg8Oo09T4w5ZWV0ay46jMGCY0l37anifsTxrmbxTmSxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=50zxwFxJBZQsb2GLxHa25vzysOClvCntf3//riFkKwU=;
 b=dn3eMP+lag8stRRCWcr4mM4eqVS9Z1bFIANO+UgEwSee/+ZvFv+7VJJVeFtyKXu4yyoba3qEQrWDRKL/TiLOiGKNwQ316VoUin1hPAvStsBpxozLBe/ELVKpJKwbfc4hmFYpY3Q0gLDeEPu+Q5XvYi/Kmjbd13ESUB7G/Fub6bPdSx2O2empZlofcg6+se0SAFdqz0TXEz9pSrtD/zExaZo+fLwTqyiyWV0UP1MNEZjSwd+I/sikzmaUMTsYzJoLmnLvrpvv/1etQrOjJCP4neWpRGii9+geGFOsv7JcpHUKoSlZdOxKhk2T1WjKr7guIHnbGRWggSCgWRv9cW2G+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22)
 by SA0PR11MB4687.namprd11.prod.outlook.com (2603:10b6:806:96::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.29; Sun, 26 May
 2024 18:48:05 +0000
Received: from DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1]) by DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1%6]) with mapi id 15.20.7611.025; Sun, 26 May 2024
 18:48:04 +0000
Message-ID: <0204b46a-35c3-49be-bfe9-5d83d8b69b96@intel.com>
Date: Sun, 26 May 2024 11:48:01 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] drm/xe: Enable Coarse Power Gating
To: Riana Tauro <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>
References: <20240524070916.143022-1-riana.tauro@intel.com>
 <20240524070916.143022-3-riana.tauro@intel.com>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <20240524070916.143022-3-riana.tauro@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0078.namprd05.prod.outlook.com
 (2603:10b6:a03:332::23) To DM4PR11MB7757.namprd11.prod.outlook.com
 (2603:10b6:8:103::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7757:EE_|SA0PR11MB4687:EE_
X-MS-Office365-Filtering-Correlation-Id: 947dcb8e-5da0-47c1-5057-08dc7db4600d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WU13VmM0bkpzUkliTWpaZ2IvUVM4eG5Db3FhckF0b0NZVFg1UlErMGtSTTBz?=
 =?utf-8?B?bUpqQnNqYWwxNmJjWHlHU21uYTR6MktRU3czdVd4bG95Z2huN0ZzaTZjR1RF?=
 =?utf-8?B?Rmsxa3ZBSGd5WldqNXB1YktWUlpPd08xemFuc1ZaeElpWklKRlNzR3RLcUln?=
 =?utf-8?B?SkhSZzlpeUZkWWJ3bkVSWktnRVlQelFxOHBUaTFHN1pPSHo4aTBaUHYxN3Vj?=
 =?utf-8?B?WDdvUHRGR2NqL0hIajZTR28xZVZZZXA0Z1M3SUZXRWlMbnp1NHVkVWFGaGZI?=
 =?utf-8?B?RnpxdGNwMWdsUG8rV0NKcU9FTktjdmFEN3VTTzJUNDRDaEQrWHFWY1dBeGQ2?=
 =?utf-8?B?cG13OXR0THJFTXZqeEpWUzIxYnNvWDQyeGNwTC82SXZqT1pvb1FJSWZ1RGV2?=
 =?utf-8?B?aTNiQUY4d2lXd1ArYndmQm5TR3pYclliSUxBQmJNV1gxcVEyMFMrWkg3aHNR?=
 =?utf-8?B?OHhmeVZHZEdLTHBiVTZCNkZJSnVXZXgzeDNkbkVwa09JSUY2bVkzcUdmWmlI?=
 =?utf-8?B?UGVWekt1SkFqSkdNbVJXOHQwSnoxYXVtRDhDdnB3Y1UvTmZKcGE4UzlKOVJn?=
 =?utf-8?B?S3J4ckIyK2s0T08yU2RudHpzZVNSTDVsQ2tHUDdtRVB1K1hFM3p4RmVSOEFu?=
 =?utf-8?B?NnkvWVlyWkV6WkErT0ZHRktwWSszam9aYmFYU2VDRWlRR2V2Q3IzODR1Si9v?=
 =?utf-8?B?TE9BUnJCWWJCQnJrRTRYeTZob3F2NnhzdWVhS2JsM29MMEUra043Slc2OVYx?=
 =?utf-8?B?c2syS2RBajJTSWx2RU0vOU4rQW16ZzhQdFRIempDTndyUEczNmJqRzcxQmFN?=
 =?utf-8?B?S1E0bVBmdGlIZHR2azBPQm9uVStQblE2OXRKdDV0VlJ6QWx6ZUFDKzh0Qkxi?=
 =?utf-8?B?UkdCZmNsVXcwakJUT3ErdzcxWlJnajYzRkttVC9CWGVDN0I5TnZ5ZXljTWEx?=
 =?utf-8?B?T3hEZnBGMHVya2xGNVhRNytPTWZ1RlY0ZTlURG82SUFsYWF6Y00vT1Z5YkVp?=
 =?utf-8?B?b09KUWhvcFMxV1BjL3lMSy9yNVl3SGtTRnp0Qmo2V2xvLzJCZTBwYUFYdUZQ?=
 =?utf-8?B?QlFGRnhUeDhiUkR6ZXptdGVuUEhxYkFOT2RPZERGTVBRSFFPM2VYN00xN2NR?=
 =?utf-8?B?djk4RVlTSElPSDNFTjNqa2w3UzdSVnJHTk1JVEJzZmhHNFRROU1YVDlCOFYr?=
 =?utf-8?B?TlpsN1haMEkwSEJKUjRNRXhham9iV1dTZjZJKzdTMngwVllPUnhIZERqSDVT?=
 =?utf-8?B?VUtXVWgwTUVPR25LZXQ5bk9FZ3JvSitrbXJLZno3elhGMlJqSXMyakN2Qmtl?=
 =?utf-8?B?aHpiR0w0ZG4yekg4bTJZeEFyYlg3a0lGa3k1eEwzOFFPZ2NFVWR0bkJ0NUNs?=
 =?utf-8?B?OUlCVDZpNzRqajZsaHVXRUNSZHNCUEZ3YTI0OE02dW1NSHdwQStKREs1anRM?=
 =?utf-8?B?TTd4eFY3NzJieW9WOHRoUnBtZ1Y1U1dOTXltUlRUYXRDTjR2ZmVaN3QxN2w3?=
 =?utf-8?B?dHBybVdjaU45Q0tNS1NFY1FLbHpqcHdUVFZvVXBnblFjcUNwWlBtK2wyRXIy?=
 =?utf-8?B?Z3V2RVdXWWREdTZUbVJtZFhIRDdiQkN5bEJ6Y2hxUkhmVkRqM2ZzOWRNcW1m?=
 =?utf-8?B?QWdscWdIMWhCVDlzZERVKzlLZHlOOHNiczl3YktGZU00YklDd1FtekRZeWc4?=
 =?utf-8?B?K2JpOXdwQ3RhUlgrQmU1aGQ5UXVEMzM3d0tQVkR5OUJVc1lUaW1BdzV3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NEpmZkxrT2hsdDZTVWtYUWV2bEM5Zm52R1FOZTZlYkhEaC9LbkxVT3BXUXFz?=
 =?utf-8?B?UVJzTFpTa0F4Ujc1cHVjQ0ZRdFF3NDV1dmQ0aFpJeklNUG5PWjVJU1VDYW1h?=
 =?utf-8?B?eEgrM1lSWS9GeVo3MURmQi9KSEN4eUtBejd2QTdhazVWdXkyYXdXNnNNalEx?=
 =?utf-8?B?Y2tNS1IzOTMyZkM4Wldnd2s2RFpjSCtYVzlNNXRaUk41dHRmaWttR2s2ZzNk?=
 =?utf-8?B?R1lpVGxLOStSYU1FS09IY2MydkUyNVFKaUVWbERvVExCcXU1c3pzcDhRaEYv?=
 =?utf-8?B?a1lNZzVYQUtzUUJGY1dieHZwSnExRGQrM0Q2Z1NvZCtNZHhOck5yMldYQkl3?=
 =?utf-8?B?aGh0L0hodVRvSTdFSFYyRmdjRGtRMjh0YmR5ODJWWVhYOGg4WE1ONjVPU2pO?=
 =?utf-8?B?VGdCQlk2TVlmdDNZSHV5SkdSYTRhTjRrcGVVblYwMkQxczJUSnRSNjFqY0VF?=
 =?utf-8?B?N3kzY1dSSWN4bDhZZDBwZnczSU9UWUw3eUxub1B6UDFLK08zM1dWYUFXWVZX?=
 =?utf-8?B?dTFSZXVUM3JoSGpKcXJpUzQwdm1aVzJ6c2FyL01VZ2NUNHhUYXdmRlZ3UFRS?=
 =?utf-8?B?ZEpRTUN2TjY2MVV4ZHYwZDNBMUoyaDRpQzZxR0JJeFNyTjgyZW1Xc2dzc2VZ?=
 =?utf-8?B?ZGt0bUNGekM2RU9ETFB2cGJRNklaM2NqaTlYWWpFTVEyclQwU094ZFdLR0pS?=
 =?utf-8?B?WmFVcCtpbnhRS2Z1czMxTVVMc2hYSDBuZy92aG9YZVByUHJhN090KzJocExq?=
 =?utf-8?B?MHRJYUpGV05nQXlWRWNrWW9JN2xzVkdXbXlPRTV4aktyOUY1QUFwUEJjcUR0?=
 =?utf-8?B?OUViMndxTkgzcFJvcURtWngwbVZTZVpSMEo1K3lGWGxuc1dFYks4QjVKenY0?=
 =?utf-8?B?RVBLQzlFeHgzTUJKUXRnUUN1VGF3YlU5ajkrN1c1aHVQendCYkM4Yzg5RE94?=
 =?utf-8?B?QTkrUVVUNHdJbDRlSm1rc2FkT2FReEVKRmQ0MTBNbE5qYTIwQ2JUeURUV3dR?=
 =?utf-8?B?S1o0TzY2UkFPTEVYbzU5L0FaQlVyakMxejBQMm5uS0dtTlE4WkQyVjBlaUJT?=
 =?utf-8?B?M0huREJEVUZhbUhUQXdrbWdkUzZJb1ZnakFxZnU2bFdLaGVzNWhmMFRtMlpU?=
 =?utf-8?B?NFI2MGtwclp3VEw4V3Rwclp3UmpmNG1BSWw5RDBWRCtWQlA2d3lGbU9TY0Iw?=
 =?utf-8?B?Tm5Wb2s4a1B1YXJkb0h4N3l1bGJJVDlNQWUzSS9KZjJrUXE4OG9WaUFaYmg1?=
 =?utf-8?B?NTd6Wi9KWlJpZE4zbjJJY1N4TUNYTlNXMXRKRnVuWCthelRIclNSNFFWcStr?=
 =?utf-8?B?cDBWVTlBRmhlcitHZURmU0VWTEJ5eGYyWHlVWTZOU3hKTWh1Y2hMTXk2bWxz?=
 =?utf-8?B?RHlWeGQxR3BJbXFXTFdOTmNHb3NrVTBHU2dCN3I1ZDZYalY4Q0QxY090em9s?=
 =?utf-8?B?Ti90RkJZMTg2UVV3cFQrb1lNRW42Sy9GdHdLMWpYR2t6Mzg0QnNNQUhYenN6?=
 =?utf-8?B?aU9jYjVweWpjYXZoVzNuWlkxK29PeTFydUc4R3RhSkh2YmFSTzRBYVpub2Zu?=
 =?utf-8?B?NUVhbzdHWDF6amp0Nm80aGZYT0dwVFlxRGhHSjZLTDJmb2V2VDUySjZiYkt3?=
 =?utf-8?B?eExXcXlIOWNxWnMrM1hFd2dBL1A1TFFrbHE3U3JDZXl4Vk54WlV5Y0V4V2dl?=
 =?utf-8?B?UGwwaW5mYzg4M0h6Tm91bkk2cjJpSldoWWIrWnFjbVpWUWxtdjRpTVBIcnp3?=
 =?utf-8?B?eDc0ZjdNZTMvZ01TblNxK21DOWkvbjRCalRMYXFGRkdyeEhRQXcySmloSTZi?=
 =?utf-8?B?RlVWM0cvQXJNS2hNay9HeGZ5T2dlNDZXNkVEVUVhQkNzYjlvck9Gdk1ZaEVn?=
 =?utf-8?B?UTdiUVJGQURaUjk5Vm1NbEJaQzFGNVdNNUpqVk9tYktNMExNWEEwZldKTitu?=
 =?utf-8?B?Znd2UjJDTzlGTWRoQWdhSFB0eU55UHRKUFNaUDlFeHl4YkxqcGdYbkhLcXR6?=
 =?utf-8?B?cHNDZXQyS2ZFQVN6d0tYeUxhYVUrZzJuWEhyZVRQL3A4cmoremRyQlpEajRk?=
 =?utf-8?B?MElWSmF2aFJtWUNvNzFqVzlZRWVqa2lKVWU4OWhTVEMveWZMQlZqd2UvTjJI?=
 =?utf-8?B?QS93Rjd6Q3hxbHhpQ0pOdUlEZVZQR2JramlWMjJhMnVTazFGeHFFNGViS0xj?=
 =?utf-8?B?K0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 947dcb8e-5da0-47c1-5057-08dc7db4600d
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2024 18:48:03.9921 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jzwb6n8VJYxjOpVY+5lWRVpHlzYPHN7/i+6Wsbp56jJJkkkUPbh4PG514YXxbf4wgA7uE3qvVGSMBrLrQJy0y09EfojefH6+BHzWLTNl3ns=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4687
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


On 5/24/2024 12:09 AM, Riana Tauro wrote:
> Enable power gating for all units and sub-pipes that
> are disabled by default.
>
> v2: change the init function name
>      use symmetric calls for enable/disable pg
>      re-pharase commit message (Rodrigo)
>      modify the sub-pipe power gating condition
>
> v3: set hysteresis value for render and media
>      when GuC PC is disabled
>      skip CPG for PVC (Vinay)

LGTM,

Reviewed-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

>
> v4: rebase
>
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com> #v2
> ---
>   drivers/gpu/drm/xe/regs/xe_gt_regs.h |  4 ++
>   drivers/gpu/drm/xe/xe_gt.c           | 12 ++++--
>   drivers/gpu/drm/xe/xe_gt_idle.c      | 57 ++++++++++++++++++++++++++--
>   drivers/gpu/drm/xe/xe_gt_idle.h      |  4 +-
>   4 files changed, 68 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 7c173db7d585..d09b2473259f 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -309,6 +309,8 @@
>   #define   RC_CTL_RC6_ENABLE			REG_BIT(18)
>   #define RC_STATE				XE_REG(0xa094)
>   #define RC_IDLE_HYSTERSIS			XE_REG(0xa0ac)
> +#define MEDIA_POWERGATE_IDLE_HYSTERESIS		XE_REG(0xa0c4)
> +#define RENDER_POWERGATE_IDLE_HYSTERESIS	XE_REG(0xa0c8)
>   
>   #define PMINTRMSK				XE_REG(0xa168)
>   #define   PMINTR_DISABLE_REDIRECT_TO_GUC	REG_BIT(31)
> @@ -317,6 +319,8 @@
>   #define FORCEWAKE_GT				XE_REG(0xa188)
>   
>   #define POWERGATE_ENABLE			XE_REG(0xa210)
> +#define   RENDER_POWERGATE_ENABLE		REG_BIT(0)
> +#define   MEDIA_POWERGATE_ENABLE		REG_BIT(1)
>   #define   VDN_HCP_POWERGATE_ENABLE(n)		REG_BIT(3 + 2 * (n))
>   #define   VDN_MFXVDENC_POWERGATE_ENABLE(n)	REG_BIT(4 + 2 * (n))
>   
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 6f4b59a6e710..34c1896807e9 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -366,10 +366,6 @@ static int gt_fw_domain_init(struct xe_gt *gt)
>   			xe_lmtt_init(&gt_to_tile(gt)->sriov.pf.lmtt);
>   	}
>   
> -	err = xe_gt_idle_sysfs_init(&gt->gtidle);
> -	if (err)
> -		goto err_force_wake;
> -
>   	/* Enable per hw engine IRQs */
>   	xe_irq_enable_hwe(gt);
>   
> @@ -554,6 +550,10 @@ int xe_gt_init(struct xe_gt *gt)
>   	if (err)
>   		return err;
>   
> +	err = xe_gt_idle_init(&gt->gtidle);
> +	if (err)
> +		return err;
> +
>   	err = xe_gt_freq_init(gt);
>   	if (err)
>   		return err;
> @@ -760,6 +760,8 @@ int xe_gt_suspend(struct xe_gt *gt)
>   	if (err)
>   		goto err_force_wake;
>   
> +	xe_gt_idle_disable_pg(gt);
> +
>   	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
>   	xe_gt_dbg(gt, "suspended\n");
>   
> @@ -786,6 +788,8 @@ int xe_gt_resume(struct xe_gt *gt)
>   	if (err)
>   		goto err_force_wake;
>   
> +	xe_gt_idle_enable_pg(gt);
> +
>   	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
>   	xe_gt_dbg(gt, "resumed\n");
>   
> diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c b/drivers/gpu/drm/xe/xe_gt_idle.c
> index 6790b5674965..0109d1d2e9c4 100644
> --- a/drivers/gpu/drm/xe/xe_gt_idle.c
> +++ b/drivers/gpu/drm/xe/xe_gt_idle.c
> @@ -12,6 +12,7 @@
>   #include "xe_gt_sysfs.h"
>   #include "xe_guc_pc.h"
>   #include "regs/xe_gt_regs.h"
> +#include "xe_macros.h"
>   #include "xe_mmio.h"
>   #include "xe_pm.h"
>   
> @@ -93,6 +94,50 @@ static u64 get_residency_ms(struct xe_gt_idle *gtidle, u64 cur_residency)
>   	return cur_residency;
>   }
>   
> +void xe_gt_idle_enable_pg(struct xe_gt *gt)
> +{
> +	struct xe_device *xe = gt_to_xe(gt);
> +	u32 pg_enable;
> +	int i, j;
> +
> +	/* Disable CPG for PVC */
> +	if (xe->info.platform == XE_PVC)
> +		return;
> +
> +	xe_device_assert_mem_access(gt_to_xe(gt));
> +
> +	pg_enable = RENDER_POWERGATE_ENABLE | MEDIA_POWERGATE_ENABLE;
> +
> +	for (i = XE_HW_ENGINE_VCS0, j = 0; i <= XE_HW_ENGINE_VCS7; ++i, ++j) {
> +		if ((gt->info.engine_mask & BIT(i)))
> +			pg_enable |= (VDN_HCP_POWERGATE_ENABLE(j) |
> +				      VDN_MFXVDENC_POWERGATE_ENABLE(j));
> +	}
> +
> +	XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FW_GT));
> +	if (xe->info.skip_guc_pc) {
> +		/*
> +		 * GuC sets the hysteresis value when GuC PC is enabled
> +		 * else set it to 25 (25 * 1.28us)
> +		 */
> +		xe_mmio_write32(gt, MEDIA_POWERGATE_IDLE_HYSTERESIS, 25);
> +		xe_mmio_write32(gt, RENDER_POWERGATE_IDLE_HYSTERESIS, 25);
> +	}
> +
> +	xe_mmio_write32(gt, POWERGATE_ENABLE, pg_enable);
> +	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
> +}
> +
> +void xe_gt_idle_disable_pg(struct xe_gt *gt)
> +{
> +	xe_device_assert_mem_access(gt_to_xe(gt));
> +	XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FW_GT));
> +
> +	xe_mmio_write32(gt, POWERGATE_ENABLE, 0);
> +
> +	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
> +}
> +
>   static ssize_t name_show(struct device *dev,
>   			 struct device_attribute *attr, char *buff)
>   {
> @@ -145,15 +190,18 @@ static const struct attribute *gt_idle_attrs[] = {
>   	NULL,
>   };
>   
> -static void gt_idle_sysfs_fini(void *arg)
> +static void gt_idle_fini(void *arg)
>   {
>   	struct kobject *kobj = arg;
> +	struct xe_gt *gt = kobj_to_gt(kobj->parent);
> +
> +	xe_gt_idle_disable_pg(gt);
>   
>   	sysfs_remove_files(kobj, gt_idle_attrs);
>   	kobject_put(kobj);
>   }
>   
> -int xe_gt_idle_sysfs_init(struct xe_gt_idle *gtidle)
> +int xe_gt_idle_init(struct xe_gt_idle *gtidle)
>   {
>   	struct xe_gt *gt = gtidle_to_gt(gtidle);
>   	struct xe_device *xe = gt_to_xe(gt);
> @@ -182,7 +230,9 @@ int xe_gt_idle_sysfs_init(struct xe_gt_idle *gtidle)
>   		return err;
>   	}
>   
> -	return devm_add_action_or_reset(xe->drm.dev, gt_idle_sysfs_fini, kobj);
> +	xe_gt_idle_enable_pg(gt);
> +
> +	return devm_add_action_or_reset(xe->drm.dev, gt_idle_fini, kobj);
>   }
>   
>   void xe_gt_idle_enable_c6(struct xe_gt *gt)
> @@ -202,7 +252,6 @@ void xe_gt_idle_disable_c6(struct xe_gt *gt)
>   	xe_device_assert_mem_access(gt_to_xe(gt));
>   	xe_force_wake_assert_held(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>   
> -	xe_mmio_write32(gt, POWERGATE_ENABLE, 0);
>   	xe_mmio_write32(gt, RC_CONTROL, 0);
>   	xe_mmio_write32(gt, RC_STATE, 0);
>   }
> diff --git a/drivers/gpu/drm/xe/xe_gt_idle.h b/drivers/gpu/drm/xe/xe_gt_idle.h
> index 75bd99659b1b..554447b5d46d 100644
> --- a/drivers/gpu/drm/xe/xe_gt_idle.h
> +++ b/drivers/gpu/drm/xe/xe_gt_idle.h
> @@ -10,8 +10,10 @@
>   
>   struct xe_gt;
>   
> -int xe_gt_idle_sysfs_init(struct xe_gt_idle *gtidle);
> +int xe_gt_idle_init(struct xe_gt_idle *gtidle);
>   void xe_gt_idle_enable_c6(struct xe_gt *gt);
>   void xe_gt_idle_disable_c6(struct xe_gt *gt);
> +void xe_gt_idle_enable_pg(struct xe_gt *gt);
> +void xe_gt_idle_disable_pg(struct xe_gt *gt);
>   
>   #endif /* _XE_GT_IDLE_H_ */
