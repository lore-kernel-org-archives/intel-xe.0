Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39071C36014
	for <intel-xe@archiver.kernel.org>; Mon, 31 Mar 2025 20:47:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 520FE10E18D;
	Mon, 31 Mar 2025 20:47:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f3cDAG3a";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2ED8510E18D
 for <intel-xe@lists.freedesktop.org>; Mon, 31 Mar 2025 20:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743454053; x=1774990053;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=vVWRvAyRCKPwUkUzbP9KFsD7U5iMhHHlmfDb9yY45GU=;
 b=f3cDAG3amtxeyyJWgVexxLRmerku9ZbJNPggryO8gebUxu3uvNEvqLup
 scs0a2BV2VXf43TSkkpitgR61YYUgn4NVbDD1nDT0cc1Eow1KYag7nc2J
 HmZ0LgQ+955QCuvOexIMtbW4Z0twkxtSwCaccte5Z23GqdpcwLwmgqhH6
 JMj1aK6ajLfllN/Dr9UwSoAXvSUeP5f6LN3shFAgZ8RMq4RB5LcLt9yXk
 lNyXYkVv0q1rNgFMzHK/NrGxRfeKQY1tqiM8ApMe4VJzxJt/xQ8uHz5jS
 dVnRQEhBw+qpbhv0EDiufrVjD1X2nkO9c2wK9hu/DCbYDI5lE4WGQRrRr w==;
X-CSE-ConnectionGUID: H98BDYNmSpO8Id3yIJSuew==
X-CSE-MsgGUID: AGUAutiLSg2H72hZzbOmvg==
X-IronPort-AV: E=McAfee;i="6700,10204,11390"; a="48627455"
X-IronPort-AV: E=Sophos;i="6.14,291,1736841600"; d="scan'208";a="48627455"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2025 13:47:33 -0700
X-CSE-ConnectionGUID: Qpska1ndQnGcpwCZTPGKMQ==
X-CSE-MsgGUID: D+eidz4YSPSxmJds1kSX9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,291,1736841600"; d="scan'208";a="157193318"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Mar 2025 13:47:33 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 31 Mar 2025 13:47:32 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 31 Mar 2025 13:47:32 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.177)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 31 Mar 2025 13:47:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OLxDQRx6RGxWCnt0YcsDXd3exZjmeW/KWyP5x7idgmuwLmEJdRMiUsdycJsbPD4knEJvsu681jR1TQjMlBKVBDXi0fo8atu08y18chJ67AEq0qKvLD6VW9RYwiaoYmIg9Vyf3olq2rxvDiVDE2fG4w8t2qsO+ydmSGbpDDAj0JBDLa463IX0/rK9Y81orVJ19l6u1AvdZNBsOarWfo1/unYL5e9RJCiCQqmck7WqFMvBD3YMRzfyxrCAzE4WaU8QVYrcRD+xOBnjdlOKX22DggYMUF0o8Nv5R+MD7xfuH6QZuS16LxV7dezzn/ROxN06ngm6W+NrqLJ1lgv6znf1Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XKdU2iwXYIg9jXEhVgFLNcrQcxZ6CZjuVQv6ysr5QTo=;
 b=dwSbnlDi264tJkF6MHaewfPF3B95VlNRUPtL58rWqWczbRs9gaCq4KWBTCOHJI1v7x6V/IzWcnrGEQtmdggamEqk0al5mnfJp0PV69/t8fdnhE8UWf/d45U8vcHnBw7fsx3M8hqGetzsy6gPPPsym5LMhWiD4a+R54sbAz9WYnF4jY5QO21y+Q1My2iBiQJJTdPmOJnocbTg577rRXAbRCDwF6jAYMEr/s2xgIfcpXfIStFzX6JBns2DFnWImtsaEw2+JJ+ZL/o316f5TdlEOk25hskWJthdnirw+qbYA/jfm+Eh94V0H5Y5D2+p+lZEc5U+0HXfpSb5iJW09f80CQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22)
 by CY5PR11MB6116.namprd11.prod.outlook.com (2603:10b6:930:2b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Mon, 31 Mar
 2025 20:47:29 +0000
Received: from DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1]) by DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1%2]) with mapi id 15.20.8534.043; Mon, 31 Mar 2025
 20:47:29 +0000
Message-ID: <502fd505-bd55-4b39-9236-71dbf5bbd89c@intel.com>
Date: Mon, 31 Mar 2025 13:47:27 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] drm/xe/pmu: Add GT frequency events
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Riana Tauro <riana.tauro@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20250328225330.1990303-1-vinay.belgaumkar@intel.com>
 <5tpl4h3jdhyevkzpp7e2xnb66wgmce7zvfrzfkrajql6kax2bf@clrwl2d2e6bb>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <5tpl4h3jdhyevkzpp7e2xnb66wgmce7zvfrzfkrajql6kax2bf@clrwl2d2e6bb>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR11CA0060.namprd11.prod.outlook.com
 (2603:10b6:a03:80::37) To DM4PR11MB7757.namprd11.prod.outlook.com
 (2603:10b6:8:103::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7757:EE_|CY5PR11MB6116:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a6363b6-0617-4c9e-356e-08dd70954053
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aWFVKzRVUE9SOUZvUVRQK0JWQTdRYzdxVGlQTHorUjlDVEgwamJtM1VpcUp4?=
 =?utf-8?B?L011cHNidThnckRQMDNkWFY3Mlpta1ViZXYrK2I0bm1ObFM1YnFQUGRtYkph?=
 =?utf-8?B?SUR4aWd4MlZFandhVjl1czRtenoybzZxRmM1NVhCdkxaZUNtQ3hXelZnakpQ?=
 =?utf-8?B?cEVDR2poMnpZM2l6V0xOV1pubU9TWWNhekFia0xHeVJpT3pTcllPYm90SGxN?=
 =?utf-8?B?WktXaFRsUGYyWUEvNHpHNjBucUNUYTJheGZScmdhMGtFZERmclVsclhxeTRI?=
 =?utf-8?B?dWlaaUJNR0pvNkRuak9HSG4vcUdVc1FaajRFUWYvcEg2ak52SURNWXI1K0Er?=
 =?utf-8?B?V1JROFh3emxPbFdwWmFNd1BqMWdnbUdkeThqa2dYbVNDMXYwaVZVRWpXcHFG?=
 =?utf-8?B?RFhoWmkwSTYvUDI3QnR3QWd0QnhRTnhhSndCSmNyWkRNRTFmbnJzL0dUeXR6?=
 =?utf-8?B?dnFwWER0Z04xbVhzTmw5QWplMkdXeUt2bXVURnF2NFNSUUZTSGQ5WEdVdVg0?=
 =?utf-8?B?MmNGb0M0UHhsRURZcjNockhFeDJDN3hhN3psOUxwdGJUQVBBZm1Lc212c3N0?=
 =?utf-8?B?d2QwRUVKVXpieFFYd3lQMjFiOEpkei9EbUltMXpObzM4MW5MbmptRkpLUFZk?=
 =?utf-8?B?QUl6eS83UW14eG93UURvQzlUVGNLWGNwSVBUQVZmVDhEdzZJbllJTEZGU1Q3?=
 =?utf-8?B?SjJOUTAzTXhCamFDeGF3cU0zSFNaUzRqcDczM09uQWVqcFRlTkZJUkE4aWkx?=
 =?utf-8?B?R2VtbXlISVRaZzBoM2JneHd4N1Nuem5UZEJ6eTNYZHRFaWNqeDJlMWZJU2FX?=
 =?utf-8?B?dmY0SVdncjcxYmJPR1YzbFhhSzJNUU5EdkVEaTFjN2lRRUk1Z3JiaTU2cWxZ?=
 =?utf-8?B?NWNOVFlqL3VLUnFyQlNldE9ySzFOYkNVRnd0SmxiT29zRGIxNytOR3d6cys5?=
 =?utf-8?B?aU5JT2g2UjE3Mm5oSjV5clNCV0o2S2xSZkQwY3gwTFpRd1Q2cHo1Q1hTcVZZ?=
 =?utf-8?B?Z2Ftcm9nWEtKRnhVeDJHblZYQWRSbHMrUGNzWFFMbWdZZFRlTjBLQisrY1VJ?=
 =?utf-8?B?RTRBOXo2R0VXMDN5OXB4QlhydWViZXVTa1ErdDVDN3hVaXZsWU5nbStJRjRa?=
 =?utf-8?B?dnR5dUNNQ09tK0xjT0prV0tRaWw4QzVidHp2WGRUTVFVSlZTUnhHS0FjWEI5?=
 =?utf-8?B?RXIycVJESzd4Nmk2VXpGOFdSM0hBN0VISDV5R1lXOXptd1pMcVBHbGQweno1?=
 =?utf-8?B?a2dkVEtMMkJocGVKUW90Ty8zWmJIZEhNaFB5MFgwOUZHQTZOTEpIaVptcS96?=
 =?utf-8?B?VEQ5bGxibjExMXBOSzFMNjBhNHB5MFJTM2dRSHF1MitCUWFXVWRzY29TZVhE?=
 =?utf-8?B?ZGpsQ29LUklhY0ZtYU5zdEpoc2NMa0ZrMW9PemJCbFVuK3dlRzBHbDZZSTln?=
 =?utf-8?B?M0dQbGNBSklYdUMyL0lucG1YOXBvU1lIM1VkL0lhNVR2QTRrSDBHV3ZuVU52?=
 =?utf-8?B?WElWMTZOR3JUb2xNT24wbDcyWi91dFRqV2tVTzF0T21aLy9LWDJLK1hsUTVL?=
 =?utf-8?B?eEFjZFlheFp6cjlYL3czT2hsc0xiUjc5bFBIeWNNTFBZc25sWmVpZ25aUHl0?=
 =?utf-8?B?eEdVejZ4c2ZWanBqWXcxdWFuSHZGUWxEcEw3MThiRUpYbGdmWVBwYklQT3c3?=
 =?utf-8?B?TWo1TVgrUGpjNVFDQ3pwNGNDNFRPWGQvN1RXKy9vcUJwK1l5K2Y1S2orTGdn?=
 =?utf-8?B?MHJ1K3BTcXJoUVRVenVEK0l1aWQ3M3JQZW1JVU1nOWl6SnpTUVNqck44ZlhH?=
 =?utf-8?B?SUxuVllMclkxZGUwbnNNVjdYOG1ZK1VNcUZSNGJZa3VJcExmL2M0OHdDc2x2?=
 =?utf-8?Q?EhFuVzVQLbQUZ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aXJqcnRIM2kzZTBVQ1VOcXJEQXNIZk9BRGtFd0ZrcXBNSCtPbURLN1YwdkZ6?=
 =?utf-8?B?bTJvN0lXMWlIdyszcEhXdEc5L3lxcEMwSjllNERzL1h6TjJkcElwTlhBcnI0?=
 =?utf-8?B?cWJHNjRCcGx6d25JNzhXT2FoUm10eVh0dVU5bWZHbVIraGp6TTlFbVhJM1FK?=
 =?utf-8?B?ekZtamRkVHljek9wL28xUkp4VC9hUEsyL1JET3FTcDdsMU9WUCtDQ0o5ZnFs?=
 =?utf-8?B?dExmVHo1U2pBYzM2U2VhaGtDRXV2SkxSL2NJVUg1NHRXQ04va2NCY0hTM0Nl?=
 =?utf-8?B?V2ticmRneXpwRVpFODZGaGZ6Tnd1YkViQmVLeEtZTVVTemwwemRrdTlKMCt4?=
 =?utf-8?B?dW05d2tEK2wvQ2ZwWjYxVnc4YnoxZkkwdVh0cEJ1Mm1rcGJ5V1JQc3o1b2k3?=
 =?utf-8?B?UExwWDVBeU5FcFNScXJTRmIrczdpQksxcWFrQW5uNm5rTWMwcUFUMERKbUZV?=
 =?utf-8?B?NC85QlB4eWNRUnF5SUlrbDlnV3hDeXhNaDNXQzM4Rytmd1BqQmJVWFhqSExw?=
 =?utf-8?B?b0hqTDhTbUZ4ODVKTWxzMVh2ZDR5NlpUaEE1VE1ySTMrSnJscnVSdU9CaTla?=
 =?utf-8?B?Q3VCVWZseHpxeE5SMTJETzdPWVdka0dLR2JLSXRaMDRMVGMzU09ScCtsV2Vt?=
 =?utf-8?B?ZmdYeEVyTWkzWjNFR1hKY2VVTExwUGJ5T0RXNWNrYWFYV1VpWi92R0hjamZJ?=
 =?utf-8?B?THRaQkFMNmFuY3UvZ3FFZTZWZEdta041ZUtnWWh1TGJZTkJVcXg5bjdDVjA2?=
 =?utf-8?B?SU5YTGdEVHR4VjNIbjN3Z3A0Z1ZLOThVdmRRMGgrTFllZzBNSHZPd3MyakZq?=
 =?utf-8?B?SnYxNERwNEpiQzh2cW0yb3FmUEExa3d1SS80N2Q0SFhCdXJpS0l2UUVhdU9k?=
 =?utf-8?B?Y2dTZFducFltMlp4YUxXcUhoM2x3bXJxblU1clFOb3I5V0ZIdHFRUEpFTnRo?=
 =?utf-8?B?S0hjNDNiRWpxN0dLQWJlanFSNlpST3lKSURUY1QrZFhEUU0ySTd5ekdaQ3Yx?=
 =?utf-8?B?NjAvU1pxSzNaaWVST0k3S0lJWUNYRU0wcDlaMERRTFhKUWc5OEVNclFFVzJX?=
 =?utf-8?B?dmRSelNlc0RuMERpbkxkZkUwS3g0bjlJTXdiMEFWR1BFemFRNDRUU2ViZUhO?=
 =?utf-8?B?RzhhcnhqTFp2V3NJbVFpeGlxUUowa3ZXNmxEcFk0ZTZxRytiNFRiT004RDZ1?=
 =?utf-8?B?TzVPdUtobDlKSnR2NysyVC9JWWVRSmVtMDhKY1doU2lkdnoyY3ptVHBCU3hj?=
 =?utf-8?B?amxveDZLL2MrVHB1RVdzU2lveUYySERURzZnKzBuRGgrVVpoR1lMbmJ0QkRw?=
 =?utf-8?B?UzJUazlGdWswNXZ3cTZIN3NNT1kvK2x6UGxkYWU5K0JOS2hULzViWlQ2bFBS?=
 =?utf-8?B?ZEtCcE1kSWk2SFlVRGxEZ0drY00vL0dBNlRrdFh1VHg5eStSWVlCaWU4UHVU?=
 =?utf-8?B?MDhaQzZGZGl3dzFxOHY5NGZCenFXbUlOczhyZjREMi9aNHRSb1F6aWFSQ09Z?=
 =?utf-8?B?QmlYSk1LWGFUTWtyNWlJbWxHOHEvYjJwR1dDNTlaUnRXNmpldUtHNWVUeTJq?=
 =?utf-8?B?WTVPNDVodnRoL20zb1BOYnE5M1lKZWR2bmNmNGkzMU1rRzBTeVlMclJmZE9k?=
 =?utf-8?B?SGxaKzVqNGZ5aVZjbDRjZ0J6YWRkZmd2aVZhNWhOUk1Tc01OSGQrVHNrdnEw?=
 =?utf-8?B?QXVYbHhGTlBwTldvditheFZaMzJnSkRRU1BEU1JYZlRXWS9Pd09sMU5rTjVH?=
 =?utf-8?B?eW5SeHJ4NkVkN1lVd3gyeERub0E0dmxSTnJHbGtucWZZVlh0eElnbW1KSysx?=
 =?utf-8?B?YzdIM2FjNlI4NEVLbyswTWQ2VENDcHNCNzU1RDgrVktSckpkOHBGaXY4UUNX?=
 =?utf-8?B?U1ZEU2pva2RYekpscTdpZWhYTURtNG9YL3RCaC9lejYrUmRZNHc1UHpWU1pq?=
 =?utf-8?B?TGxseCs2M282QXN5YVIwMlBJdnpmYUhybkwxTTVWSWRYWlpPa0Q3b0ZUQzBU?=
 =?utf-8?B?bW1mQ2NtdUZMN1NaYlRKUFdQZ3ZLR2RWUVFIWXMxcTdYenZaNGlWL1FxaEh3?=
 =?utf-8?B?SUZjNGZXOGRTdjhnOTNXZjMxbFpIUW9ubis4LzRBKzdyeXhjVlBEdXJSMUNK?=
 =?utf-8?B?NVBJSWNTRHlMcTNhMmZDQzJWSnRYL2VnM2tPaFQwanBHYld2VlBJazErLzNs?=
 =?utf-8?B?aWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a6363b6-0617-4c9e-356e-08dd70954053
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2025 20:47:29.0569 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D9kY8MeeCLxI/xrcDz38HrftozYQT4HSAzQWr0jq7to2KnJQreG4W5j5irlqwo0BEcvqDerYqFux4jTy+LoGKF4SkNUD9qx3CUC4nM14LS8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6116
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


On 3/31/2025 11:11 AM, Lucas De Marchi wrote:
> On Fri, Mar 28, 2025 at 03:53:30PM -0700, Vinay Belgaumkar wrote:
>> Define PMU events for GT frequency (actual and requested). The
>> instantaneous values for these frequencies will be displayed.
>>
>> Following PMU events are being added:
>>  xe_0000_00_02.0/gt-actual-frequency/              [Kernel PMU event]
>>  xe_0000_00_02.0/gt-requested-frequency/           [Kernel PMU event]
>>
>> Standard perf commands can be used to monitor GT frequency:
>>  $ perf stat -e xe_0000_00_02.0/gt-requested-frequency,gt=0/ -I1000
>>
>>  1.001229762       1483 Mhz xe_0000_00_02.0/gt-requested-frequency,gt=0/
>>  2.006175406       1483 Mhz xe_0000_00_02.0/gt-requested-frequency,gt=0/
>>
>> v2: Use locks while storing/reading samples, keep track of multiple
>> clients (Lucas) and other general cleanup.
>> v3: Review comments (Lucas) and use event counts instead of mask for
>> active events.
>> v4: Add freq events to event_param_valid method (Riana)
>> v5: Use instantaneous values instead of aggregating (Lucas)
>> v6: Obtain fwake at init for freq events as well and use non fwake
>> variant method for reading requested freq to avoid lockdep issues 
>> (Lucas)
>>
>> Cc: Riana Tauro <riana.tauro@intel.com>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>> ---
>> drivers/gpu/drm/xe/xe_guc_pc.c | 15 +++++++++++++
>> drivers/gpu/drm/xe/xe_guc_pc.h |  1 +
>> drivers/gpu/drm/xe/xe_pmu.c    | 40 +++++++++++++++++++++++++++++++---
>> 3 files changed, 53 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c 
>> b/drivers/gpu/drm/xe/xe_guc_pc.c
>> index 85215313976c..f70762917aed 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
>> @@ -461,6 +461,21 @@ static u32 get_cur_freq(struct xe_gt *gt)
>>     return decode_freq(freq);
>> }
>>
>> +/**
>> + * xe_guc_pc_get_cur_freq_fw - With fw held, get requested frequency
>> + * @pc: The GuC PC
>> + *
>> + * Returns: the requested frequency for that GT instance
>> + */
>> +u32 xe_guc_pc_get_cur_freq_fw(struct xe_guc_pc *pc)
>> +{
>> +    struct xe_gt *gt = pc_to_gt(pc);
>> +
>> +    xe_force_wake_assert_held(gt_to_fw(gt), XE_FW_GT);
>> +
>> +    return get_cur_freq(gt);
>> +}
>> +
>> /**
>>  * xe_guc_pc_get_cur_freq - Get Current requested frequency
>>  * @pc: The GuC PC
>> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.h 
>> b/drivers/gpu/drm/xe/xe_guc_pc.h
>> index 39102b79602f..0a2664d5c811 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_pc.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_pc.h
>> @@ -22,6 +22,7 @@ void xe_guc_pc_print(struct xe_guc_pc *pc, struct 
>> drm_printer *p);
>>
>> u32 xe_guc_pc_get_act_freq(struct xe_guc_pc *pc);
>> int xe_guc_pc_get_cur_freq(struct xe_guc_pc *pc, u32 *freq);
>> +u32 xe_guc_pc_get_cur_freq_fw(struct xe_guc_pc *pc);
>> u32 xe_guc_pc_get_rp0_freq(struct xe_guc_pc *pc);
>> u32 xe_guc_pc_get_rpa_freq(struct xe_guc_pc *pc);
>> u32 xe_guc_pc_get_rpe_freq(struct xe_guc_pc *pc);
>> diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
>> index fde4222675fd..835d21429b58 100644
>> --- a/drivers/gpu/drm/xe/xe_pmu.c
>> +++ b/drivers/gpu/drm/xe/xe_pmu.c
>> @@ -10,6 +10,7 @@
>> #include "xe_force_wake.h"
>> #include "xe_gt_idle.h"
>> #include "xe_guc_engine_activity.h"
>> +#include "xe_guc_pc.h"
>> #include "xe_hw_engine.h"
>> #include "xe_pm.h"
>> #include "xe_pmu.h"
>> @@ -84,6 +85,8 @@ static unsigned int config_to_gt_id(u64 config)
>> #define XE_PMU_EVENT_GT_C6_RESIDENCY        0x01
>> #define XE_PMU_EVENT_ENGINE_ACTIVE_TICKS    0x02
>> #define XE_PMU_EVENT_ENGINE_TOTAL_TICKS        0x03
>> +#define XE_PMU_EVENT_GT_ACTUAL_FREQUENCY    0x04
>> +#define XE_PMU_EVENT_GT_REQUESTED_FREQUENCY    0x05
>>
>> static struct xe_gt *event_to_gt(struct perf_event *event)
>> {
>> @@ -119,6 +122,14 @@ static bool is_engine_event(u64 config)
>>         event_id == XE_PMU_EVENT_ENGINE_ACTIVE_TICKS);
>> }
>>
>> +static bool is_gt_frequency_event(struct perf_event *event)
>> +{
>> +    uint32_t id = config_to_event_id(event->attr.config);
>> +
>> +    return (id == XE_PMU_EVENT_GT_ACTUAL_FREQUENCY) ||
>> +           (id == XE_PMU_EVENT_GT_REQUESTED_FREQUENCY);
>
> nit: the parenthesis doesn't make it easier to read.
ok.
>
>> +}
>> +
>> static bool event_gt_forcewake(struct perf_event *event)
>> {
>>     struct xe_device *xe = container_of(event->pmu, typeof(*xe), 
>> pmu.base);
>> @@ -126,7 +137,7 @@ static bool event_gt_forcewake(struct perf_event 
>> *event)
>>     struct xe_gt *gt;
>>     unsigned int *fw_ref;
>>
>> -    if (!is_engine_event(config))
>> +    if (!is_engine_event(config) && !is_gt_frequency_event(event))
>>         return true;
>>
>>     gt = xe_device_get_gt(xe, config_to_gt_id(config));
>> @@ -173,6 +184,8 @@ static bool event_param_valid(struct perf_event 
>> *event)
>>
>>     switch (config_to_event_id(config)) {
>>     case XE_PMU_EVENT_GT_C6_RESIDENCY:
>> +    case XE_PMU_EVENT_GT_ACTUAL_FREQUENCY:
>> +    case XE_PMU_EVENT_GT_REQUESTED_FREQUENCY:
>>         if (engine_class || engine_instance || function_id)
>>             return false;
>>         break;
>> @@ -190,6 +203,8 @@ static bool event_param_valid(struct perf_event 
>> *event)
>>         }
>>
>>         break;
>> +    default:
>> +        return false;
>>     }
>>
>>     return true;
>> @@ -288,6 +303,10 @@ static u64 __xe_pmu_event_read(struct perf_event 
>> *event)
>>     case XE_PMU_EVENT_ENGINE_ACTIVE_TICKS:
>>     case XE_PMU_EVENT_ENGINE_TOTAL_TICKS:
>>         return read_engine_events(gt, event);
>> +    case XE_PMU_EVENT_GT_ACTUAL_FREQUENCY:
>> +        return xe_guc_pc_get_act_freq(&gt->uc.guc.pc);
>> +    case XE_PMU_EVENT_GT_REQUESTED_FREQUENCY:
>> +        return xe_guc_pc_get_cur_freq_fw(&gt->uc.guc.pc);
>>     }
>>
>>     return 0;
>> @@ -303,7 +322,13 @@ static void xe_pmu_event_update(struct 
>> perf_event *event)
>>         new = __xe_pmu_event_read(event);
>>     } while (!local64_try_cmpxchg(&hwc->prev_count, &prev, new));
>>
>> -    local64_add(new - prev, &event->count);
>> +    /* GT frequency is not a monotonically increasing counter, so 
>> record the
>
> /*
>  * GT frequency is not a monotonically increasing counter, so add the
>
> is the preferred coding style and s/record/add/ would be more accurate
ok.
>
>> +     * instantaneous value instead.
>> +     */
>> +    if (is_gt_frequency_event(event))
>> +        local64_add(new, &event->count);
>> +    else
>> +        local64_add(new - prev, &event->count);
>> }
>>
>> static void xe_pmu_event_read(struct perf_event *event)
>> @@ -443,6 +468,10 @@ static ssize_t event_attr_show(struct device *dev,
>> XE_EVENT_ATTR_SIMPLE(gt-c6-residency, gt_c6_residency, 
>> XE_PMU_EVENT_GT_C6_RESIDENCY, "ms");
>> XE_EVENT_ATTR_NOUNIT(engine-active-ticks, engine_active_ticks, 
>> XE_PMU_EVENT_ENGINE_ACTIVE_TICKS);
>> XE_EVENT_ATTR_NOUNIT(engine-total-ticks, engine_total_ticks, 
>> XE_PMU_EVENT_ENGINE_TOTAL_TICKS);
>> +XE_EVENT_ATTR_SIMPLE(gt-actual-frequency, gt_actual_frequency,
>> +             XE_PMU_EVENT_GT_ACTUAL_FREQUENCY, "Mhz");
>
> I was in doubt if the unit was still correct after we stopped the
> msec/usec conversions from previous versions. bspec 62718 confirms it's
> in MHz indeed. Nit: Please fix the capitalization.

ok. Thanks for the review,

Vinay.

>
> other than that,  Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
>
> thanks
> Lucas De Marchi
>
>> +XE_EVENT_ATTR_SIMPLE(gt-requested-frequency, gt_requested_frequency,
>> +             XE_PMU_EVENT_GT_REQUESTED_FREQUENCY, "Mhz");
>>
>> static struct attribute *pmu_empty_event_attrs[] = {
>>     /* Empty - all events are added as groups with .attr_update() */
>> @@ -458,6 +487,8 @@ static const struct attribute_group 
>> *pmu_events_attr_update[] = {
>>     &pmu_group_gt_c6_residency,
>>     &pmu_group_engine_active_ticks,
>>     &pmu_group_engine_total_ticks,
>> +    &pmu_group_gt_actual_frequency,
>> +    &pmu_group_gt_requested_frequency,
>>     NULL,
>> };
>>
>> @@ -466,8 +497,11 @@ static void set_supported_events(struct xe_pmu 
>> *pmu)
>>     struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
>>     struct xe_gt *gt = xe_device_get_gt(xe, 0);
>>
>> -    if (!xe->info.skip_guc_pc)
>> +    if (!xe->info.skip_guc_pc) {
>>         pmu->supported_events |= BIT_ULL(XE_PMU_EVENT_GT_C6_RESIDENCY);
>> +        pmu->supported_events |= 
>> BIT_ULL(XE_PMU_EVENT_GT_ACTUAL_FREQUENCY);
>> +        pmu->supported_events |= 
>> BIT_ULL(XE_PMU_EVENT_GT_REQUESTED_FREQUENCY);
>> +    }
>>
>>     if (xe_guc_engine_activity_supported(&gt->uc.guc)) {
>>         pmu->supported_events |= 
>> BIT_ULL(XE_PMU_EVENT_ENGINE_ACTIVE_TICKS);
>> -- 
>> 2.38.1
>>
