Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89526C3ABCB
	for <intel-xe@archiver.kernel.org>; Mon, 16 Sep 2024 19:39:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4971710E3CA;
	Mon, 16 Sep 2024 19:39:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cK90ErBw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3677210E3CA
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Sep 2024 19:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726515544; x=1758051544;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=13sHo7hiN6g45DjswDtQBoJKyiGkLG5QUv2F3/AQdJ4=;
 b=cK90ErBwypHrImSYfwRxAbHnJ/2W0LoEWT8YzGctIzzJA1xOdvUG2/Rs
 iu4jOdMGxp7PQGRzFzuNrKKBpwMSIa3SWoovQKHY4h4yE+frAl9m52ZIh
 Qj3m4S1meMYErVUKVGftz8wCOMZJf1pp8PkCV2LnV0BU3IFSSarzcUqKj
 Uu9GerRUMLWRDc5IwjQf/h07ZJ+gQLn3R6in/lkoh7JhfaqCQivC71kfB
 HzqnzoQW7TBqeLRrKnC2AL1te8MSSXmB6OYIKqkDpqPSFZhB2cIL7ljiB
 UgeXnIOd/5ziLzia3Ttj2TpGG51fB7fRLF22R88Oj+hpcKNj5PhLN79Zn A==;
X-CSE-ConnectionGUID: Vwy+vXNZTaqYEsIRv6Q8GA==
X-CSE-MsgGUID: A2547DH3Q3u9kg3PwO/VQQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11197"; a="24892177"
X-IronPort-AV: E=Sophos;i="6.10,233,1719903600"; d="scan'208";a="24892177"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2024 12:38:55 -0700
X-CSE-ConnectionGUID: JZghcT17QXqYiNaPbPESvA==
X-CSE-MsgGUID: jUZYoLWgRnGlEj8qy5da+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,233,1719903600"; d="scan'208";a="68591314"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Sep 2024 12:38:51 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 16 Sep 2024 12:38:47 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 16 Sep 2024 12:38:47 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 16 Sep 2024 12:38:47 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.175)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 16 Sep 2024 12:38:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xIGLbbotiEyL3isnhSlZ1t25ZcSeHVEjB0bK/VOwP2CaIt17Ioy4jQ45BlfxGyPvl5nemGH5chBqyJNxKq/vZBn6+fwpy1/+/yqs0PcI7DxtM7caknwDR2BU9/ZpqYmrt3Er133As5Zq4n7Ac3NPVjunSeDqVQ35jg5ch+7pcdmaf0TS4RtDVX1ZKEY+f3iQwSeerI0G3RFWDa0ZzfPe8PK24Lrc40PSijvanHLcUsMTEzl8czNsvITDbqFonqpUHjsaGpIBtUMJjyjb4MXpW/chwjj5TW47dv6iHe1szVzZcbZShtJKChhJn5tPEOalFtVjJydSJxLRxtExtnHfog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F95sIdUiEpcNeFUnurIiIS9kpcMLjjG3tN5VuO38qVI=;
 b=xyxR+s/55xekLT5EQVCY+j7zLpjZtNJMmMQa4w4Jq6tToTDFTaVw3V2LsbGGgtT0sSKjx15PtwAWoNCRgWItfjc0zRtxPLEMhV9FKavx7+RXleyMV1TqDbQIkm+xNWxBY228q/KPb2IzGANlbHHOB3ngpJl3tEKjn+/7xpsI9wOzy0fX5wMxjlfin/RzsTkmfkvzFOyIYZhgGBlwYEsRp84aAKF7cKitqhgzO+V4Sv82EBGiM39OXi2q935uMZ95MobEQ6+mSV5C8PCFzaQUmADrctPCd2DFdyIaIZa1+nV1wnUvoXmvxBsa0BzjbRVP5XJ1QyI51xeDol7I5oYeHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7717.namprd11.prod.outlook.com (2603:10b6:510:2b8::8)
 by SJ2PR11MB8402.namprd11.prod.outlook.com (2603:10b6:a03:545::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.23; Mon, 16 Sep
 2024 19:38:43 +0000
Received: from PH7PR11MB7717.namprd11.prod.outlook.com
 ([fe80::a546:1ad2:2379:b848]) by PH7PR11MB7717.namprd11.prod.outlook.com
 ([fe80::a546:1ad2:2379:b848%6]) with mapi id 15.20.7962.022; Mon, 16 Sep 2024
 19:38:42 +0000
Message-ID: <0fa6c0ec-fd7b-4874-86d1-81990060ca3b@intel.com>
Date: Mon, 16 Sep 2024 12:38:41 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/rtp: Remove unneeded semicolon
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: kernel test robot <lkp@intel.com>
References: <20240916192149.855996-1-lucas.demarchi@intel.com>
Content-Language: en-US
From: "Randhawa, Jagmeet" <jagmeet.randhawa@intel.com>
In-Reply-To: <20240916192149.855996-1-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR04CA0019.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::29) To PH7PR11MB7717.namprd11.prod.outlook.com
 (2603:10b6:510:2b8::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7717:EE_|SJ2PR11MB8402:EE_
X-MS-Office365-Filtering-Correlation-Id: 00e7472e-3de3-43cb-d48f-08dcd6872c07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MGtXVU8yR2xxWGxBdy92U0owS2RKSTdKTmhCZFJMa3RFL0hTNVUzQmhHYUNW?=
 =?utf-8?B?L2lyMCtXNmQ3Mmg1ZlViSTU1bHBLVzVueTlIcmQzdms4elcwc2xwRk5aS0Fl?=
 =?utf-8?B?eHlML1RpVnVmUkVnNzBjVWJvallrWVI1Uzd2bjZ1VGVDNjMzaGJlTThVa3NQ?=
 =?utf-8?B?Yllkd1hpR0l1ZkE0QVdCcVBIYnVFWDc1NTA1bXA3YlpxckZ4U09CYkJiNDNy?=
 =?utf-8?B?YjIyOU93ZEtoOUVKT2czcklCR1JncDNGaWFjb0xUeFVMNVAzanF4UG5RUW5B?=
 =?utf-8?B?VzhsZWtGcGVIS2VGbTBuV3hrV3JteXJtZ2h1SHRvN20rOVNiTllQSjJsaGhX?=
 =?utf-8?B?U2VEeng3Z0JSbmV3NEJtbzRHdzdUdS92VGZNV0F5d0tnWDlQYjRSY0Y1M2ZK?=
 =?utf-8?B?K1ByYTRoVS9ieGFDYU9zRUk0T0R1bkthUnZ2NTBLSTM4SGVmRnAzWnp4eFR6?=
 =?utf-8?B?aE9ZT0RqT0lHTlRCcWIrcnB0WlFLWmJCZW9TS1pqdWVGNjVncFUvRlR5R1V2?=
 =?utf-8?B?TmF0R3F4MFZBK0IzeU81Z2I2eHpBeFQwa2tMS2RBMW81WEZHSE1SUzA3VzRY?=
 =?utf-8?B?NzM4ZVh5TW0wVGZ1M3paNWRETldRUkpmaFJKR1BWdE9MNitvNDFaWmJTOFBO?=
 =?utf-8?B?SXNrVzlCL3EvdVVoVitVSDNMQnRoSVA5bW01RXQwdzJXbVl5aHlobkJ3a1Y1?=
 =?utf-8?B?aVdUZDZ0My9DOWVHYVBTM25GekVxdFdVVEQxMC9CbkRqc0dzZWZhOGlZTis3?=
 =?utf-8?B?Nm1WdG14Z0FES1NOZ0JQTzlKalhrV0k2UG5wRnhGQURTamZOV3A5UVlwU0w0?=
 =?utf-8?B?U1RuMllwU2QyWFFFbUNJb1lYa0FlemJNV3R2VnN5eHBnbjZIR25zeGpidzhx?=
 =?utf-8?B?cHFhU1VkenpRbXpoS3MvRHdKNFl2OVFBSTRIN0xpZDhaSXplRmFGaXNweEtC?=
 =?utf-8?B?aU1nU1RlMDdFbHJRQ1llWWpEODlLdThTSUlnTmU4bWdMSHB5bHByTjUzc2J5?=
 =?utf-8?B?ZGhzTzM0RHhZdWprMy9uWmV1NE5kWWErbTYrUlpxRlVud0JHdDY2dWNVTTVh?=
 =?utf-8?B?bTZRTDhJYldjN21HakNuY0pqOG9UQlBONjUreHlxaVBtYVRuTlp4OVROWjN4?=
 =?utf-8?B?T2JLNlRKZ29icVlXOFZHQUEyTzVpSmI5TnFNN0dZVllySnFMeURJR09TUEtm?=
 =?utf-8?B?MUdOczFIN0Y0Y0JnTU00dWxRUE14V1JSYUpDcEJhRWtLNWJFTForRFR4bGVD?=
 =?utf-8?B?WUpmaXY4VGFoRm5kaUY5c3ZETmRnT3ByYmhQV1BaeTBjZE5aK2lQd1p0WURw?=
 =?utf-8?B?dThUVXF4UUtNK1cyNlFPOWY3WDV1Smc5UW1NeVVCM09PRFpxTEdSeWtVZ3N1?=
 =?utf-8?B?SFVTdEp3TFRnR0NqMEJpN3JWcjRmazduRDRTanRTdVJmZWNoSC85OGgyb3Jr?=
 =?utf-8?B?cjc4ZXR1WVdZV0x4RzNDQ0VEbHY0d0ZYYWlrUVdBcUNGd1lUSmNpc0kxeWQ3?=
 =?utf-8?B?eXBER1lhTkVIRGltdEdDbVFrK05uaUFkdWZqOWh3MU4wVHdYN0FFUDV3WkVQ?=
 =?utf-8?B?Z1FXYlovdTI3Q2lwa0ZLTTFIcUEvaDJ6K2lNK1FaQmZwN3RqSGpNaWtWZ3RV?=
 =?utf-8?B?TUQ5QjZGZm5Sc2hZaHYybXVoVlA2T25xald0SWxOMTdKOFhNQjlpNEg1YkN3?=
 =?utf-8?B?OG5xeTg4UmVqNGNNOUp5dGpMM05KQW1Ubjk3eGYrRUxFcnVhTXlZNG1RVTdN?=
 =?utf-8?B?RXBBaGZkdk5vUUhZdi9WQUZvRWRpT0FwOXN4SzVqaTUrOGw3bTB4VWtLWGxW?=
 =?utf-8?B?QXV4NFBxa1hEMU10SHByUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7717.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K3JDZVZSN1hLTk5QRUJFckNVOUtZc0IyNTBlY2h0YitCeVk1R2pnbHRkY3Rp?=
 =?utf-8?B?SXc0TmtaY1NTaTFON2tBcVk4OVZCeTlYK005aStsU2l1bHZ3eE1acjNoQTE5?=
 =?utf-8?B?VkZpSHFHZitrb1gvVlNsdmRjQytESVl6N3lib2s2Wms3NkZ1enpiMHMvbFlu?=
 =?utf-8?B?UWI4M1l2Vi9uN041V29mK1hqVE1MdE1heHVoU1I5QjJqcWU4ekhVTXpBRU5w?=
 =?utf-8?B?dG0zb3d0NHExMDVmQnNNYXRkNk5vZFZVcGJCSTE5eWpRTFRpamxvSWxyL1BK?=
 =?utf-8?B?d0dLU3hNS2NNRTg0NndtR002SVBzWXV4VGJDOUZ5TUJyelJnQThDOGZyMldY?=
 =?utf-8?B?T0k1Yk9vZ21NbmRQaTQ3Z3ZMMmtoaEFtbXpsODhjVEY4bHA5ZnBEWTZRd0Y3?=
 =?utf-8?B?T0dmTVFNKzE0UldqTlNOTlliWXh5RW0rYjVtWWFxNGRQc3JYZ0dNOUk5QWNT?=
 =?utf-8?B?WlI4Qk1Yd1B3NmFGVStJMXRnbytpWEhHME5SWWFPZG9DWE51MjFYbGw4VkND?=
 =?utf-8?B?ZTJsRTlxOVdhbjF1V2M5RHpGOVdJY1U3MldQZnB0b1hwQUlBMmRaQStrUm9Q?=
 =?utf-8?B?Q0FhbDg0Yll5MEhwTldGUVFDV2VpYjFQRU4rU0I3WFpibGxkTHg2YTFmSElo?=
 =?utf-8?B?djFsS3NzUmFwWXFZcUIwZTVaeVROSmV0cmJ4cXZrUXJ3OVNSVzVoc1doV1p3?=
 =?utf-8?B?V3pLOXhjQ0xwTHhMNmduNmloTXBlL3FJUTF5WHFvbXRTN0g0RFJUTE5HeEVF?=
 =?utf-8?B?UG5MZ3h1YkxmU3IxbkdVMUlCQ2tidGdVN041V1lURHUyUTdjWmRIY3VVS2pk?=
 =?utf-8?B?YWt6dmtOSG40ZEszS3dBc2p5VUE0L2g2SXdhM1dCNHRpZ3o1WHdqQTNZQkZ6?=
 =?utf-8?B?Q0EwQ2JpdzI2SUtLT3hYTzVPRWxUc3lJRmxBaFVlQU9FeTV5UFIzQXFVK1BK?=
 =?utf-8?B?aDgyWngrY0k1OFRYaldMZ2Z3dDQzRWhEZkhQMGtKZFNnSSs0cTVkUnV3aWcv?=
 =?utf-8?B?M2ovOUFtNDlvVDVwNGRpNm5jRXNJMWtEMUdWRkk1K2FtL2UwemlETjdLMXBp?=
 =?utf-8?B?N3RlMFhYaTBFQ2NqWlV4dXdQbDVHeVNqQTBEMmhscVNGbjhkVGZvbXJUOUdC?=
 =?utf-8?B?UDFhMVBNZUM3ME9iTk1UdWNLeFZhei9LNCtmOUVpRVJpZERrSk1VeFkvTVRm?=
 =?utf-8?B?T3pDSVVkKytTWFhOMU9qakxBT2o3bExpQ3QzVE5UMFZ1R3dtd0x5c2x3d2ph?=
 =?utf-8?B?T01TdTYwZzBtdzhFMWQ4ZUFxZW5DMnd0UGthcndlQWZtNWo5cDBkK29rY1c3?=
 =?utf-8?B?dERGcjE1Q2xYUFJ5R2ZBZ0h0ZlFLU0hEOFpNa2hJL3dyVHZIeFdIMDA5WjBt?=
 =?utf-8?B?aWVDcjVyOUMzQzBKbktobTEvV1dhd2FnMUdwWVZHNUV4UTdYVGpSVHVlUXZi?=
 =?utf-8?B?K243VjhaeE5HaEdkNGZPODhZVGgvb2xVTTgrWnY1MGRXNm40R3N0MDlhMW5N?=
 =?utf-8?B?YXgwOW52UnovaHlVakc2OCtETmYvV1QxcnRpTXcyRVZlUTk5YS9DNWpqWTAr?=
 =?utf-8?B?VGJsQnRyc1ZVUklOOTdFWUpsY256UkNKNTNTelhDM1Avd0tNVk5vUWwxTU1K?=
 =?utf-8?B?Mzd4NzEyeHlEOGlEMEtiSXJtRGZqQ0gxUUVDdlRwODNCUFJMZ1gxRGxZUU0v?=
 =?utf-8?B?VXhEWWtHa0JXV3h6TXB5aUNjdnR4QzRXbStVZVQ3RVNmNytJblV1Z3VFY2RC?=
 =?utf-8?B?dk1iaUhwQmpxUG5xbEF6RkNWSm1tZGVxTzdLczUwdkozdjJFQThSaHlXditQ?=
 =?utf-8?B?WitvbitDRFp0cTBscm8wV3hzZTF3V3U0ZXRpSWxDQmFyQjBONytKalh4cVdO?=
 =?utf-8?B?aG1NY1JZY2hRa3lJdVdTdWNvQ0pEa1hHNlk3Tk5VTmEydURuVmQxbzg5bmEv?=
 =?utf-8?B?N0ZGZjA1Q2pHeWdORXBZOW1DQ1dxLzZXRjI1aCtsbkdxQzFxZ3JyUDVxNHZq?=
 =?utf-8?B?Z3VhNHdRbTZkdmFqRGE1MlhNSUtMR1RXU2ZSSnpOS0FpWTFSaTMwM01WS1ZZ?=
 =?utf-8?B?dWFzbHluR004Qy9LMmpZTVhJcWUrYStIZXdKVWc2ZGdocUpUWVh4QVhrTnhE?=
 =?utf-8?B?eW0zbnJYZDI1UEU1eGtEa1d2Mk5YT2srUjZGbEVOdWNoVmp3elljRU9rRDV3?=
 =?utf-8?B?K3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 00e7472e-3de3-43cb-d48f-08dcd6872c07
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7717.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2024 19:38:42.8659 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vuvNmYUd2BzQTrC8x8UD9dldofKptArVP+3c0WMDjB7QICWNGCQpyxvHdTJsEOgIATIaIasQD+ykk4sHVJBU7dPQP52NZ9yUnWjQ+jsNxzU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8402
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


On 9/16/2024 12:21 PM, Lucas De Marchi wrote:
> Fix coccicheck report with regard to unneeded semicolon. This is
> currently the only case according to
>
> 	make coccicheck \
> 		MODE=report \
> 		COCCI=scripts/coccinelle/misc/semicolon.cocci \
> 		M=drivers/gpu/drm/xe
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202409151152.pJ4ukp5k-lkp@intel.com/
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_rtp.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
> index 86c705d18c0d3..b13d4d62f0b1e 100644
> --- a/drivers/gpu/drm/xe/xe_rtp.c
> +++ b/drivers/gpu/drm/xe/xe_rtp.c
> @@ -196,7 +196,7 @@ static void rtp_get_context(struct xe_rtp_process_ctx *ctx,
>   		*gt = (*hwe)->gt;
>   		*xe = gt_to_xe(*gt);
>   		break;
> -	};
> +	}
>   }
>   
>   /**
