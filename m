Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF736CD4853
	for <intel-xe@archiver.kernel.org>; Wed,  4 Sep 2024 17:07:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FA5110E817;
	Wed,  4 Sep 2024 17:07:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DdHQaHQz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4FAE10E812
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Sep 2024 17:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725469637; x=1757005637;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+lNuu+Frzoo00TdWOzAOp3StEHQrXwC9Hh0eDW6oLW0=;
 b=DdHQaHQzK6fPHm4KZeYlzdtbD+F0Fa2OMM3rDLogJml1WwgswfyEhSJQ
 kVjyWmfPkhXjp7GYKSwBd2VLPvJ+pf6OdncL1137zUOmNSBmauHLprH3m
 1gVQqrYErIgsZqz3x1dF8qltnOqMD8Y8grIBpfgkCSsYd9VssUau+spyi
 HdR3t++DpCqC7/uvmgsuSJNz+nLrYkA+KTZwyDfdyIgBmO4RCQExFyuqo
 9DK8eB6lnD3pNsU5v60DTEci7vZjD7+8g7IJ+zcR+ERcZx4zqu5vsJTyR
 cYz/Hkmsmro8v9lGjR7qa6FRHeAXFBzM4L5KOou9rj18gQyScelzOCBvN Q==;
X-CSE-ConnectionGUID: 633yN5HfSA6eg9F4ZdqumA==
X-CSE-MsgGUID: DuyuFWNPQouTaEkpIqyoeg==
X-IronPort-AV: E=McAfee;i="6700,10204,11185"; a="24306441"
X-IronPort-AV: E=Sophos;i="6.10,202,1719903600"; d="scan'208";a="24306441"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2024 10:07:17 -0700
X-CSE-ConnectionGUID: 5XepxU+UQueUrGJe7f0DOA==
X-CSE-MsgGUID: n0uS5h0YSpq27yWZU3R3XA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,202,1719903600"; d="scan'208";a="64985122"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Sep 2024 10:07:16 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 4 Sep 2024 10:07:15 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 4 Sep 2024 10:07:15 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 4 Sep 2024 10:07:15 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.172)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 4 Sep 2024 10:07:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=phLaQyOwp7qaPMu5FKlzfqPFY7sGWI1rHjTbavqm20m7p4ILeL0Y2+eTGdHB9J803JUBPJnF0m0RdboLdTEjnGNUHUx7PEmCbH7gCOlj+WpFDcE/FbHh5GSUCLgShXLiB4hXRCpHIcKNjH7XjeqZkO2mfXXEs5pZ9Q+561cflIf3M56p84cNL0AmE8UnTpIl+tJ1y/xCimpf5qQB72hyGHv+fHnCQG7kgA+aHyQhorljuKtO32nct4RXDgSwVbCH8m9sIpjntAn8y3Evdz+1v45nuiDFwx1yVSIiKaetThHAT5DVD8O/Du8HpfLTn/w3HUOf1EprUlyXGHC7Yep62w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Of8y8ha1B57Oan/QyeIOPUMIEsXaCQ2fUdCiYTAvEtU=;
 b=g25llDvP25Ryc5sM/UmMLZstdZppuZaeCxT2BzuO8MyyTDZDXQ1aPr2/+FMSJfQsbbDTAOlCZOgDhovgqJztmfLr8zqEavNlpLtigpV/N7oolx+EIZBpVFKeNEDuHUXk9LVDau/wPByRTRkf8zv12hZkHtTmlP6ySAM7USD+QeuKxc4o/J82eFXolczm6O9GQTClOU/B4L6bWzmYuXTMg2Jqk+lL/sW+b3kMkQaoeHUnX4OaxXlqLQsLkb9CbQucwy/MsidBDuB6ULmn/n7XsIUp5K4w9W2+poDOZ0kNk40qyuz3DnCiLiakHY1+qDYHaJnNPZ5px9dBXgRtmhuRNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by SA0PR11MB4638.namprd11.prod.outlook.com (2603:10b6:806:73::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.28; Wed, 4 Sep
 2024 17:07:12 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%3]) with mapi id 15.20.7918.024; Wed, 4 Sep 2024
 17:07:12 +0000
Message-ID: <17d60d9d-f14b-497a-b5b7-9a97b66af3aa@intel.com>
Date: Wed, 4 Sep 2024 22:37:06 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe: Cleanup has_flat_ccs handling
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Matt Roper <matthew.d.roper@intel.com>
References: <20240904162238.2831202-1-lucas.demarchi@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20240904162238.2831202-1-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXP287CA0006.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:49::17) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|SA0PR11MB4638:EE_
X-MS-Office365-Filtering-Correlation-Id: 215ce690-13af-4235-a024-08dccd040490
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bjBKV1hRYmRNc1Myb2k5UCtUbkQ5Z3FZSEtBZXdHamNhbGJZazIreVRreXpC?=
 =?utf-8?B?dmgwVE9VMGVnUVF4Um5jM1hNMWM4UGtsSGNDOUJIWUFqaG12SVNRVkR2NlZt?=
 =?utf-8?B?RmsvU3JqWWppZitPTnJBNGFCdWwvanRSMk53QVJYUXBoaVdBdGxMTUFWQU1U?=
 =?utf-8?B?bGQwVHBCSVFPSE9qZjhSMndZWjRxNkpHdWtCVHhtVXZGSS81cWVzTGFpanpR?=
 =?utf-8?B?enFRRkVEYmlOZENObzBkeFJ2emwra21ZQmtjM3ZCcHhpaXBrTzJ1WS9tOTRz?=
 =?utf-8?B?bW41UGZVY3d4N0YwNThreDdUQkF0VG0rYUJOZ0daTXh2U2RkVWpERmRrQnN2?=
 =?utf-8?B?L3ZTak9tYUtjZk92U00zWnRiWVRsTWNtc1E5NkhORmFLQnJISWRhK25KdS9O?=
 =?utf-8?B?Tm8xMVJMU3YxYWtwNWRWRk9UYVVrR3RjeXExWXJQUnU3U0RwL1FvNXhLSzZF?=
 =?utf-8?B?dGhVWVNLR3RDclk2NmRwQVZnRXNBYW03VTlZUEc5SUxMc2pXVUozdVN6RGY2?=
 =?utf-8?B?MXI3VXFVb0xFRmxhZE1lTGRsM1lhVkxMaUFGMks2bG9Ka1N6L2tZdExCUWdX?=
 =?utf-8?B?ZVZOSnphR0QveTR0aFdZaHo1NkZZMlFnUU1aNVNDQlQ2ZG5nUytnSzNYQ0Uz?=
 =?utf-8?B?cENkZHdTcGltZFR2VlJXNVU2b1A5Y3NJaHBERjRGS2V2Snh5WVduZEhpVU91?=
 =?utf-8?B?REVlOGdOM3BWMFg3NTh5OXFlZ3NMS09QSGRaK0lmOW5qRkxtTjNtVFQ4VXR1?=
 =?utf-8?B?VWpEdndMdjdQd2ppOG04OHVzbk1XbE40Tys3YU1TelFFZFZLVzFaRUo2Mjhq?=
 =?utf-8?B?eTNsakZFY0lSNmF0eDZDOUlzT294QnkvT2Y2QmdLTGpMcXdZUk1WREdRMDI4?=
 =?utf-8?B?MGZMUUNyNGtDdVhBVnYyU1JydU9rbGxhOSszSHVsRFRIYmRZT05wT2lSTnMz?=
 =?utf-8?B?Zi9HRXhJV0xqRkdsMnNuUGtUcVc4NnpodTZsL1d6cGpCMGFXTEhjTG04YzF4?=
 =?utf-8?B?MEc5Y0NGclZLUnp4VTREdWxGYUQ0NkxBcXovYUpEYllScTNBV2RtdFRDTk9Y?=
 =?utf-8?B?bWkzRHZzY2hObnJQYTg2SXJHWWRnYnpYNHRFV3ZWWlBPWFd2SnQ1dTZ2SjFH?=
 =?utf-8?B?V2xsdEZBYW00ZkNObjg0ZXE1WERyOEFhUmdkeWJZU1U5akhJTWtzTDAyMkpL?=
 =?utf-8?B?VG1aTlhjWlRwQitVTmxoV0EwcTRRUDhoYkY3RHhJdFNITEQ1Y0g4bURNeU9P?=
 =?utf-8?B?SFpSaVhldWxocFhPZTFHOU50d3pnVWptRGk4bmJrRzNIaUZEMHFPVW85Vm1q?=
 =?utf-8?B?d1orWFBpZjdOZm1yN2xBTXJlQWJVNmsrazhaQkdOMXE2Y2ZoSGs3ZWs2NFlB?=
 =?utf-8?B?NWJMNm44YStqamFxTzBoVG5BZXZ3dGFGWFRrSHZDYWR2VXllTTRVVTJLdnJN?=
 =?utf-8?B?dStCc2ZMelRWM3BFOWpMSE1USld2MVdVWFFNVG44cll0Rm0zVGpuZ041Tk12?=
 =?utf-8?B?azFxZTZTQzJyTTZQOStqeW9XZ3R6Nkc1ZFFKNWhaVzU4Y1dVYzhPdFFXZHlM?=
 =?utf-8?B?SlhyeXJuUjFraElnTkc1TkFkWnQ3YWF2RHl3amQ0Mmpvdkk5MHBTWkRqOXpn?=
 =?utf-8?B?YjZQTHdtNDh4Y0tSd1RtY0c4dlNmMjBXdWt5MlFyNWgrakRTSUNPeGpSaGx5?=
 =?utf-8?B?b0dpdE8zL1RBbXlHcEVyQkYrVW5qQVJSdDBQdkx6MTZqUDdhVHlqSG9weGF0?=
 =?utf-8?B?WkZTSHlNTVFlYkpYN09QQVh1SE0rZ2ZNb0haUFl2ZERTbWZWdklBNmloejZy?=
 =?utf-8?B?R1hJUkpVWEJZbFhyb0gwZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NFZYOG1aaDQ5UVRZRWl5aGJOdGs3UVorZEdhRE44UWo2MTBXamVZVTM1M0M2?=
 =?utf-8?B?SkNBandSNURscDQ4ODJSTU1xOEM0QnBPcUZXZ1gzd2t6TlF1RnFxV2VKbE5W?=
 =?utf-8?B?TlJJdU9uY1RvK25vRWFFdWx5dUVhUklnWGcwRHZBUFg3QU5FdjBoMGxGbG1x?=
 =?utf-8?B?YUw0SnZ4SWNDbEs1eStYM2VWVUt1cWpzTGNIY1lDTUk2MVJYUjY2OVBSQ3Ft?=
 =?utf-8?B?UE9zOHB2YW5Pb0o2b0licXR2T1JCUTlLRmVCWElMMzZHUjJVd284UFNmV1R5?=
 =?utf-8?B?NnlxSHlYOUl0a0pyUXFiaWJ5bHBodmVib2xNOEV0SXZ0am1ZTURzSy9EbmRE?=
 =?utf-8?B?TXNsdU9yQmhVSmd5eWhmc3BmVmE3RWF3b05jVitFNTE3UWNvcGdoRVdzRHpP?=
 =?utf-8?B?WDFGbUoyUFFTeWc1YlVHalB1bE1EWUIrbW92MTNXdzFkT0prTzE2bmMrdVpq?=
 =?utf-8?B?a3hBQ0N3U09SWG10SmxtSGFsaGtYekduUExEU0FublcyUGdNb3huS3ZlRFhU?=
 =?utf-8?B?bldxNDlYM2ZReUUwZTNiSUZtYnNxUmt6YTBscENjU0x1b1o3b3I5cHhEVEds?=
 =?utf-8?B?aHY4VHBkazhpaVJrRi94QWdwdHcvYUJBbnF4MVpyaCtQSkNKOXZVUFhzZUpW?=
 =?utf-8?B?eStvNTVHSTNNM2tzKzdva0h1VlRpSitPd3lsNUVreWxhMnhneGhVMzlkemU1?=
 =?utf-8?B?UGcwdjlRSGdrVUNXdHpyQ0tCVkxxK29IYzFnUVhCVlAybkJjNjIyUmR2ajN2?=
 =?utf-8?B?VDhkeVBxOUMzdjMrYkg3T2ozN2VycHY1OWZpREtJTTZzVlBoa1R0UlliTlVJ?=
 =?utf-8?B?NHZ6MWhjSVRaV0NISHdkcG9NNmhvdFRSZDk1SjZNNXcrL3ZCLzhuRWZhSkZh?=
 =?utf-8?B?eWMzcmNHVldNNktDbHNqL2MyZkN4QmxoampuY05NSnZGRG94aDRkL3A3L3lx?=
 =?utf-8?B?U2pNSUNBQXFBQ3lXd1JuL3hTV1F0eGpwc3gyNzY2M0doRTc1d1pTYjhtb1di?=
 =?utf-8?B?aEFIOGtqU1JVa3JqMEYwRlA1ZUxCYWVBeWJqYllJL3pBU0VGUEp2TUNjc0Vj?=
 =?utf-8?B?MEY0Q2hucHRML2RTWkxNcjJPRXJzMnppdzlNUWlGd2FVRjRmWEVzVzNoSER3?=
 =?utf-8?B?bkFoV04wTUV3M1dnL09GT3E4QWtqOG42OWF0SUVMUE9Ra1VpS1pkeit6MnJ2?=
 =?utf-8?B?UG50Q3hCa1lYT2FYQmFCYlEzVlc3YzRPN0gwWWNuc2duNTcvc2oydWZYeDVF?=
 =?utf-8?B?bXNseEZ2MXB6clFpV2tkVkxvWk56Q01Jc3dYb0FkMjVwRllqUkJNSWFKdkpq?=
 =?utf-8?B?SU55QVRqMDlYZlNieGRHckNyQXVGTnJnaFBvY1AvQVNhYlFFQWF3T3N4cXNS?=
 =?utf-8?B?U2VDazZicGZTNnk4cWNPLzFsSjVtaFlFUlNET3k3U3lqMk1SZ2RINk5Jc0tn?=
 =?utf-8?B?KzYwblpEK082Zmlwa0xLcUZMeWN1QzQvU3FnQlpTa2gzQytBRGx1Tlczem9U?=
 =?utf-8?B?QnYzcCtYR01INUFndEs4R0xnRGVMcElxZEFaZGNmd1pmTloxbHNNL1lPeUdF?=
 =?utf-8?B?bGdUZFJ1QWphdDRNMWZQQndNSTZ2TG10RWdMKytSYWZOSGRkNjI3OGhsSENB?=
 =?utf-8?B?czUzclBkOGpoKzY5bUo2UEdwV2MwY0Q3RHJuZ0k3Y3FRL0ZBcklLZ0JSMzIx?=
 =?utf-8?B?TEdaV2tyaDBxU2diRVZqUmZ5cTRUeW9oY0pFekxBSFREVVB4R2dvdWF6SDQr?=
 =?utf-8?B?Njh6MVowWldmY0dqdlgyd3VySm1OZFRLYXc0NE1LTHpGM2gyL3V0TG9ZWkFa?=
 =?utf-8?B?MExKUXFDZmRHdlJlNGpDdGxBZHk1RU5XRjcxWjR4QzlycGEzdkEwVmJxMDZ2?=
 =?utf-8?B?TE0rWHlpVEp0YkNobkVLdEtOcUZoajlPODdKRklWZXhPT0FvV3NqUjJab3lo?=
 =?utf-8?B?V29SYUN2QXFXVmlWR0hLWERYU3lYQUtGUTc1R2ltM1lZeHB4UlRqbUpDNjlP?=
 =?utf-8?B?OGc1ZGxBakJrMXpnTGh6em12dDREQkFaME9RYnRjcWpoS0RGakJrbmUvS2M0?=
 =?utf-8?B?MjN1OGMzSDZESlRkZTdJUUNkdkpXSS9LUFhnb3V0TzgxWWFUek5OMHJxYVVH?=
 =?utf-8?B?YUp2THJJWFJQWjhzZlRRWEJhV3ROL2xZMThNbUhxN29UbXVnZGZyaTIrdmlM?=
 =?utf-8?Q?7dh0qzPKTpUoF9kXAdk+OpQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 215ce690-13af-4235-a024-08dccd040490
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2024 17:07:12.2764 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jusf++VeRqJLmgyRwxpZPFbnZptXi4D9mOEtMR07UFEA2+dYaNPx1YBIIccrUqpV8VSmu6jW8aGuJoBR0nh0gFc904ESZqtW123jNXgCuN4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4638
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



On 04-09-2024 21:52, Lucas De Marchi wrote:
> The flag is set in XE_HP_FEATURES, but then overridden in all but one
> xe_graphics_desc. Make it set only where needed.
> 
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_pci.c | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 7eb00a87b786..8642c079bc65 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -103,7 +103,6 @@ static const struct xe_graphics_desc graphics_xelpp = {
>   
>   #define XE_HP_FEATURES \
>   	.has_range_tlb_invalidation = true, \
> -	.has_flat_ccs = true, \
>   	.dma_mask_size = 46, \
>   	.va_bits = 48, \
>   	.vm_max_level = 3
> @@ -120,6 +119,8 @@ static const struct xe_graphics_desc graphics_xehpg = {
>   
>   	XE_HP_FEATURES,
>   	.vram_flags = XE_VRAM_FLAGS_NEED64K,
> +
> +	.has_flat_ccs = 1,
>   };
>   
>   static const struct xe_graphics_desc graphics_xehpc = {
> @@ -145,7 +146,6 @@ static const struct xe_graphics_desc graphics_xehpc = {
>   
>   	.has_asid = 1,
>   	.has_atomic_enable_pte_bit = 1,
> -	.has_flat_ccs = 0,
>   	.has_usm = 1,
>   };
>   
> @@ -156,7 +156,6 @@ static const struct xe_graphics_desc graphics_xelpg = {
>   		BIT(XE_HW_ENGINE_CCS0),
>   
>   	XE_HP_FEATURES,
> -	.has_flat_ccs = 0,
>   };
>   
>   #define XE2_GFX_FEATURES \
