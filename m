Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CE5FC3271E
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jul 2024 23:26:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A39010E1E8;
	Mon,  8 Jul 2024 23:26:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IEiOIo0J";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55D1A10E1E8
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Jul 2024 23:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720481166; x=1752017166;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=FMswRprw3w6xSmV6SYpUsyGUyTYdKs+B5jV41GeGiWI=;
 b=IEiOIo0J43ow2Hzh4p4M0fZcoFSe9iY1GiM5loSL5TAvAfye6h9jGzNW
 oxHmgdsWlLmEUusZMsaZtVirZB0J4wPKkI590XI7gM85OvsD07azt4K3v
 AbzEQyMjQdhBwGDq9gmA9fEBsUp1H23pgkZtZ7QYCuiCYOqIzh7FRpsoT
 ZM8DR5UlrRgeFM5SOtBRGRF1EVJ3XvgP6rPpJnm3cF7n3/jXBINWXF0Nd
 b81YVpdD30c1qU7Nuj5mCVvH5lmTRBU1DeZQCTnIzVSYEjWCCP3/VGSAb
 HemkFv/Pulprt6HJI3+SdDY8SaLCIkNiT4j1/iFsLJLIokEJEQsBZuLDE A==;
X-CSE-ConnectionGUID: i4PrTXr4SHOQwoAeFlzeqA==
X-CSE-MsgGUID: wWB6O6uhRaOGdRJOD5RzUA==
X-IronPort-AV: E=McAfee;i="6700,10204,11127"; a="29106950"
X-IronPort-AV: E=Sophos;i="6.09,193,1716274800"; d="scan'208";a="29106950"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2024 16:26:05 -0700
X-CSE-ConnectionGUID: SbimqxwtQTOVP8RVrhfQIA==
X-CSE-MsgGUID: 4RA7Gu0fRgOd2sF5f3oK0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,193,1716274800"; d="scan'208";a="51987054"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Jul 2024 16:26:03 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 8 Jul 2024 16:26:04 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 8 Jul 2024 16:26:04 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 8 Jul 2024 16:26:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R2l+6V413xph6Dd963qHjXhHtNgm9AG60XBP+XJEbBHGU6FOdGQWawy7kz6LbkJ+p3T984sL/DuUXVAk8BIFsU+14nzP9hJhpPSyYCmc3B70f0lkd3h/4CGJZJMeMaQ3UIRLdlJU1kkOmYeenEQTKLH1J47/WaIumjtHkEhT0JT0i3OiNwEVhcmoAkNAguZutg8DnIBGJm66bryl/3VGAbIANAmjSImP19A1dFzYuGXnbiUS2qNMGbGQjSubWB7ivN9GfdOj9HSbh4rQ5MXqQvlPVpcwXYcpPTKFZVOK2xjgYok1+kK9G7pIBbThf9SXiEWust8O6HHqy/7goiXagw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p2TiznlK5bpC4ucESj4lD5HU8XGgSqu+cSl4yarfqvU=;
 b=U6f5t/wR5wMTfSA5DC5jhjAWyLAlSAQwc8aPRcB78RTDzxeuSj0EE4hMEGLj3yjRSvbjO8Hsssy4ezp4ZIdwpWwznOLtf9xHhd3gnhEw1oX18A4gSD6nei/8EMQVTthBm7KqbGRnhwtY1UxYzq+XZiy/a/jTrmN1nRtE9W7ZF34cYPkamzzjR9H2PUbI7jMaWRpmrwIBFROwYOnCzOUm31ozSGE/GsHnIaacVJrcyd7gHI4ENwvrvDxhIuFvX+tQcum/GzoHX0W7/dt8sk4kDYJzILsKPhq0xXpHGP55kavq4f+/1ouW6Nhg2B4leOHEHi6l5G564NEQ95WAOC9oKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by DM4PR11MB5310.namprd11.prod.outlook.com (2603:10b6:5:391::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Mon, 8 Jul
 2024 23:26:02 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%5]) with mapi id 15.20.7741.033; Mon, 8 Jul 2024
 23:26:02 +0000
Date: Mon, 8 Jul 2024 16:26:00 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.brost@intel.com>
Subject: Re: [PATCH 2/5] drm/xe: Add ref counting for xe_file
Message-ID: <Zox1iBxWvN7GtG2Z@orsosgc001>
References: <20240708202103.3347869-1-umesh.nerlige.ramappa@intel.com>
 <20240708202103.3347869-3-umesh.nerlige.ramappa@intel.com>
 <5vo72c55ibxeyhyokdmr7ogilf25fo6jk7hht3vkc7ekkixgpl@tmdzibnr3mjz>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <5vo72c55ibxeyhyokdmr7ogilf25fo6jk7hht3vkc7ekkixgpl@tmdzibnr3mjz>
X-ClientProxiedBy: MW4PR04CA0176.namprd04.prod.outlook.com
 (2603:10b6:303:85::31) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|DM4PR11MB5310:EE_
X-MS-Office365-Filtering-Correlation-Id: a1f4b8e6-7214-4818-abfd-08dc9fa554a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dy9Uc0Y5bHpXSG5Ta0JTUHkxNVh4Lyt6ZENkNmN4cnhVUmJsT2hETVRkZ2VI?=
 =?utf-8?B?WE10N1dVZWZDL0VLMjhWdVdSalRqY2lGUXYvTTM5T3RZMCtxQW81bkNIa3lN?=
 =?utf-8?B?aEd1MVRSMk5reEFaOVROa2VqSjlXR0paVUlrbGtpV3FaYUNpc0daSWRONVF6?=
 =?utf-8?B?QlFTRmlJUFM5RWNRS3J1Y2U3Tm5SQ2dpVVZQTXdHcmxWYStmbTgrdTY3ZDll?=
 =?utf-8?B?MnlJNWhDM1BjZTRvUHJnNnRTcWVteXN3am5CVFNJNlREWVdQdjFNcUF1RmdT?=
 =?utf-8?B?Z1I0cjh6b0ZvWFdpU2VsOGU3Wml2dkliWE54T2JRY1JpdGt1ajFMOERFbUdr?=
 =?utf-8?B?dWZ1YlFONnMyR25Fa3lpdGpFZVhLYzZvcHZ1a3YwNkptbUNzWmNsaFRUY09a?=
 =?utf-8?B?UTFUMmQyRTdJZWF1NGl6OFZmNno3MzZoeWIrcFFtWWhvSVIyUXBFQ0o5VW9T?=
 =?utf-8?B?NkZhR1dNeWR1cUpKK0pzaVZSS1VsWk5NbzVNUWdqTTZ4T2xKd1kxZnlTVzBE?=
 =?utf-8?B?c0pGaFNvUUpFc0xYNE4rMXdZU2pNbGVuWi9MaE02VU4zVklnSjdlemcxOTB2?=
 =?utf-8?B?Wk1oZkI4em9MWjNqbXRXTmhNdkNQajFncjlkdUdzKzhPZlJJUjFXdStqYVQ5?=
 =?utf-8?B?dWp0OFRlQmcrMzdBMzZEWHNuaGRYTDRyQW9DdmU3STY1Rkp2ci9hckNRWjZV?=
 =?utf-8?B?eDFXTmloSlBXSG9TVHlCQjFVeUJYL3hScDROejRuVkk2M0drbWd2S3RuQ2lT?=
 =?utf-8?B?dVYrQy9penhmcmdSWFdUTWxDMGFwTVZKc0h5KzN6SVpaczh0MDloUHI5U1hN?=
 =?utf-8?B?U0tYQlJ0bjFhTVRXamttQkNOWERBOFlWVVB0QVhoTWtlVnk3SENnRlJOQ00v?=
 =?utf-8?B?SjQxYTVRa3c3VTZraEVTYkVobXY2NGMzeTR1ZjN3ejRDSHJ6MUFzRXJGVFdC?=
 =?utf-8?B?L3NCUkRkcnVlL0tBVXZoYjhYNWxROFB0bXV2UmpaWXBYMGNNazNOclJBSytW?=
 =?utf-8?B?R1RUR3ltV09GQ2w2VE5LbWZyYUt3K3ZRK0JtYzR2MEMrN2ZZMjF0R2VhZVhT?=
 =?utf-8?B?ZElwREJIWWhTTFE1N09Nem9zZEMrRE1La2VmRDFOa1FxR25rQkVINkNac1cr?=
 =?utf-8?B?ZlFJdXlNek50OHZFWEp2b2lyVkc5czlkZ3UwcXRtZWkzTWtLWGxVRmJKYVFs?=
 =?utf-8?B?ZFpyMHp5V3l4SUhEZnQ5SjRZbzlmRzRKNy80MUJjcVpJeHMwOWVvVXVXQ0pu?=
 =?utf-8?B?NmYxWXgvSTFPRmhlTk1RWTdHc0RWM29ZdjlWVWpqOThrenFNczRCM3BYaUMz?=
 =?utf-8?B?MlVoM0MySnJEMDZ3Z3ZEUytNSE16SHMrWlA3eUkreUxsSUVVL0JLTlVvM0lH?=
 =?utf-8?B?N3E0T1ZaMlZ6akFTZk55eGp6d3o5SGdoaWoyR3Q1cHBCc0I2YkFIYzRJZGJE?=
 =?utf-8?B?TkJydXcwbmlDYWpOcXZTR0pmRTBoa1lRRkNDR1Mvci9BNk8yY3IxajNvYWFD?=
 =?utf-8?B?VUVWN0NEd0UvdkZnMXhDeG1nMjFYZVpkdkY2QjNXbUN6TkxHY1ZXNjdlV2tw?=
 =?utf-8?B?TFdqTGFINlNEa0RJVWhEdXdjQ01QT3A4RGlQSElIS1c3VEs0WllWY0ZyVUtL?=
 =?utf-8?B?czFDZmZveHVDcHNXMUgzWkJnSlQ5T1ZOTDdzTlYwQ256SWNvMHFKa29NNWs1?=
 =?utf-8?B?MHV4S3FKelhibTJJaXYvRzU4MVordzUvSnEyaXFDcmFaMEFZbnAzdEMvYnBW?=
 =?utf-8?B?TzZ6NnRuR2c0VVMwWE4wZFFKaG5ETlBWVy91YmdxMExITkRrdFJJZ2ROY0Zo?=
 =?utf-8?B?aGVoVHFQSldIelFuSDN2Zz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ek9TWHJ6cU1tdlVRVTVPN3hDSGxndmNIL0UvcDAvcmZsMUVCOGdLNjZiUFFR?=
 =?utf-8?B?QnUxVUI3ZHdXZm51dDhUS1dUbGlaMnkrTHhtNy8zcVQwN211U0dib1NNSXpV?=
 =?utf-8?B?K3UvUnk3bDgxWForb2JpYllGK0JaYmZteEpuSGZHZGg4MThEcml1M2dUWHFo?=
 =?utf-8?B?R3RzRWNEcUlSaUhmL2FtNUtvclVGU2Vwc2NYT1hqeDFkL01HMFJKRjUydjJq?=
 =?utf-8?B?QkpWZjFRZzZtTVUrYjVYeDJqVW10cUxBRnhka09uSHR2OVNvdDVQcTcxamlK?=
 =?utf-8?B?czJ1ZGJBeUl1OFQ4ckx0UlgxOWh5cU5pOTNtcjlYTzREeXNwd3NLVFU1b2Rm?=
 =?utf-8?B?UWlOc3U1ZFRoSXIrVkpSdzdPMjZaQ3owY3AzOCtwSmxFUExiOGNraElVVW01?=
 =?utf-8?B?SHpaMTVHMlY4UWNVYWlRTjlRek1qRDNIOHBYWVJXR1hMeklUNFczSXk5VlV1?=
 =?utf-8?B?eUJLQWdzQ3hoeHU2b3ZKb3FNTEZ1VGVJU0d5T1lDMlVJazNFTVJuNW9SNU5N?=
 =?utf-8?B?TEdTczVWakNSZFRFdzFiSUdEQTQvNDM2TlNlUUxHdWExZ1JEdW11TkNMTEpL?=
 =?utf-8?B?Y09LT1NZUzVVTWVsMlRZY0VkRUFFTEEzNDJyMWxtVjdwTktRa1R6RnZJcmt1?=
 =?utf-8?B?RzJ5bWUwTmh6VGhpMnducDRMUmVlc28wN2lkZHB2cVNXRTk5ejVuZDVQK21h?=
 =?utf-8?B?OTkvR1N3TnBLN1gwMDNOd2tJa1ltaUdCUkpsVDBjcis4d1QxdkJocTNiNnk1?=
 =?utf-8?B?NG1icWVUV3dCcXZDNmpSeUNnMWh5Z2pMamRLdVhoSVpybjVKSHhwL1FNc3ZM?=
 =?utf-8?B?d2o1RGRLZDZicC9VczUzVkRlVXZlNGNEZzJtd3lLZWZzQ0JzeGpPeXpxWU9B?=
 =?utf-8?B?NE45eGNtMDJUTStDa3RMeTZySjVuUG5aR1Nyb3pQNThlbWFtM3YvNzh1Y1Qz?=
 =?utf-8?B?K2MzTm5uZnJBMUFFaDFyaFo5UzF2Yjc0azAzditINmRzR2EzRERqdDQ0TTQ0?=
 =?utf-8?B?bE9IYzdGL0d4dEZLaVlmVEJQNklpaUxibnRKOTJVWjIyd1AzY3MxNXhRWVI0?=
 =?utf-8?B?c1Q1RHA2andJMHh4QTd5YW1uRk5halFPdXY0R0I4ZmpmdEtZMCtwUWpucFRv?=
 =?utf-8?B?enNrY2pveTlncFBMRU5IUmd4TUkvbFhNUkd0ZTArS2JKa2FQZnJhbFNheC8z?=
 =?utf-8?B?dTlYVzAvZDk5aVh3OWVkZ2dCNEZZOGhBTCswVElXUENtMVVRNG4xdTA2WmpT?=
 =?utf-8?B?amgrMm00a0xqNDIwcnlxNmc4MkxUNTAxamtGd0djUnMvR1lnTlJHRmVYWDdH?=
 =?utf-8?B?NDJUTVlscitQRGM1b0lUVzlrQXdPcmlYSHlWd2RoeGp0VXMxbVRWekd1bzZx?=
 =?utf-8?B?VWxkRHJYcGErUE9YWEU0U0tkK0VBNjB3a1hQOGhnaUlHMVhkSnVJOXB5VEhS?=
 =?utf-8?B?eXZWcDVOZFpiVmE5enVMWGYwK1hJOWFPRmQzQkQvVWE2bHZiSWl1ZloxelVZ?=
 =?utf-8?B?M0FITzJMS2pYQUVyM20rcElIak8zaktieGRacUVtQmZab09NVHhjaURjZjRu?=
 =?utf-8?B?c0MxUml0NlljUXNZbDdTa3pTRy83dmV4UGlWckg5WkFld0d3M1ZwMlVpQmtC?=
 =?utf-8?B?OFozY1R1ZjhtVE5IQnJSV1Y2M2ZRSFVRS0ZqTkxSSEV1NlpvR2NkYy9GWTNI?=
 =?utf-8?B?UE5UNytMWHYvQ2ExOVl0TkRIRlZFWjhkWkdBN2dYWWM4RE9Rb2E2M0ZuY3FY?=
 =?utf-8?B?cm5qN204eHJoeEtpSzNrbUM0NUNNNk5DWURWRm5obnRTOU1EUzlUMDZ5R1lr?=
 =?utf-8?B?K0U3Tk1nZWx0UkpvVHR6eDgyQ2t2czZxSytIaFNUUGxZR29xanVsWTI0MDBv?=
 =?utf-8?B?TW12ZThZTkVlTVExS1creDhJUkJOZW05eVY4WDhDbjlYck16a3hpSFlacFpr?=
 =?utf-8?B?aXQzRDAyWFpCeXdkYUw5MVNEZTFBMW01OXYzSFprVkcxbStJZDdVT0RsTWJ3?=
 =?utf-8?B?bm5SaWpXN2xKZC9uWVNEdTluUTdvTHhlY1NFSDVqTlpRTWUvb2VZZUdhL3cx?=
 =?utf-8?B?ZXJSV1R2dXN0eWZWZy9kQWRFT01HQmc4UkwrMEpQMEFVdnMrWUhvSkMrbnF1?=
 =?utf-8?B?YldoeCtiRkhIZmR2MFhiWFpPR1h1UGh5QTdVaFREUFUzUitZNlJEdE9DNGhR?=
 =?utf-8?Q?4PqFPRWKvwSTijD1LVIKNVQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a1f4b8e6-7214-4818-abfd-08dc9fa554a5
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2024 23:26:01.9675 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YH7k1w3rg9XpUeL7uB4RMzHPFMlzSdUV/gN3fiQ2ceGFacxpPJ9QKTnsKc+GjpYa63Il+QKNfEozZOJft8jqME3CwkHkkr9/Fwjieppe8nk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5310
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

On Mon, Jul 08, 2024 at 05:52:00PM -0500, Lucas De Marchi wrote:
>On Mon, Jul 08, 2024 at 01:21:00PM GMT, Umesh Nerlige Ramappa wrote:
>>Add ref counting for xe_file.
>>
>>Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>>---
>>drivers/gpu/drm/xe/xe_device.c       |  7 +++++--
>>drivers/gpu/drm/xe/xe_device.h       | 12 ++++++++++++
>>drivers/gpu/drm/xe/xe_device_types.h |  3 +++
>>3 files changed, 20 insertions(+), 2 deletions(-)
>>
>>diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>>index babb697652d5..e6eacf1bcce0 100644
>>--- a/drivers/gpu/drm/xe/xe_device.c
>>+++ b/drivers/gpu/drm/xe/xe_device.c
>>@@ -87,11 +87,14 @@ static int xe_file_open(struct drm_device *dev, struct drm_file *file)
>>	spin_unlock(&xe->clients.lock);
>>
>>	file->driver_priv = xef;
>>+	kref_init(&xef->refcount);
>>+
>>	return 0;
>>}
>>
>>-static void xe_file_destroy(struct xe_file *xef)
>>+void xe_file_destroy(struct kref *ref)
>
>why do you export this?  I don't think anybody should be calling
>xe_file_destroy() directly and this function being executed should only
>be the outcome of kref being 0. Also, if it's exported, it shouldn't
>really have struct kref as argument, but rather a struct xe_file
>
>
>>{
>>+	struct xe_file *xef = container_of(ref, struct xe_file, refcount);
>>	struct xe_device *xe = xef->xe;
>>	struct xe_vm *vm;
>>	unsigned long idx;
>>@@ -130,7 +133,7 @@ static void xe_file_close(struct drm_device *dev, struct drm_file *file)
>>		xe_exec_queue_put(q);
>>	}
>>
>>-	xe_file_destroy(xef);
>>+	xe_file_put(xef);
>>}
>>
>>static const struct drm_ioctl_desc xe_ioctls[] = {
>>diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
>>index bb07f5669dbb..2a8b370b1fda 100644
>>--- a/drivers/gpu/drm/xe/xe_device.h
>>+++ b/drivers/gpu/drm/xe/xe_device.h
>>@@ -169,5 +169,17 @@ static inline bool xe_device_wedged(struct xe_device *xe)
>>}
>>
>>void xe_device_declare_wedged(struct xe_device *xe);
>>+void xe_file_destroy(struct kref *ref);
>>+
>>+static inline struct xe_file *xe_file_get(struct xe_file *xef)
>>+{
>>+	kref_get(&xef->refcount);
>>+	return xef;
>>+}
>>+
>>+static inline void xe_file_put(struct xe_file *xef)
>
>I think if you just make this non-inline, passing file_destroy and
>leave it in the same place, it should work.

the put is called from xe_exec_queue.c and xe_vm.c also, so passing the 
destroy may not work.

Based on the patterns below, xe_file_put/xe_file_get will need to be 
moved to xe_device.c and then exported. It looks cleaner, hoping that'w 
what you mean.

In xe_device.h:

void xe_file_put(struct xe_file *xef);
struct xe_file *xe_file_get(struct xe_file *xef);

Thanks,
Umesh

>
>Looking for patterns in the kernel for example, see pinctrl_get(),
>pinctrl_put() and pinctrl_release().... or clk_get(), clk_put(),
>__clk_release()
>
>Lucas De Marchi
>
>>+{
>>+	kref_put(&xef->refcount, xe_file_destroy);
>>+}
>>
>>#endif
>>diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>>index c37be471d11c..ec2b0fb6afe1 100644
>>--- a/drivers/gpu/drm/xe/xe_device_types.h
>>+++ b/drivers/gpu/drm/xe/xe_device_types.h
>>@@ -566,6 +566,9 @@ struct xe_file {
>>
>>	/** @client: drm client */
>>	struct xe_drm_client *client;
>>+
>>+	/** @refcount: ref count of this xe file */
>>+	struct kref refcount;
>>};
>>
>>#endif
>>-- 
>>2.38.1
>>
