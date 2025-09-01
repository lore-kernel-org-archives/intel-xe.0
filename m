Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59627CA0FFD
	for <intel-xe@archiver.kernel.org>; Mon,  1 Sep 2025 10:39:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F94F10E420;
	Mon,  1 Sep 2025 10:39:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VJ+sftHI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3499E10E420
 for <intel-xe@lists.freedesktop.org>; Mon,  1 Sep 2025 10:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756723163; x=1788259163;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ADv3jnBP4Mle7+JnQMt4QeDhzf20qsVAl8j/vjLMDCg=;
 b=VJ+sftHIeFtbXb5U+vQM+qhSTyaK36vQi5mfJ5yqe1acV3T3JQQnJrMD
 RRlfVpu9fIkQcU1HVZjbHiHXJmC4ebxFSpvVc5uvh7KJx/BVDCf8p9Cu+
 PZJ/0SN7dXpIlgR1tLwJ2GgUO1UgL2lsKeW0PalELobZJprojQ3jc9Ohe
 cRJFRE7Doi0PRpK69kKXuvaoxa4tTuX9oBSBsSkk6WMQZLXLvRxgZgO8D
 SMRAIFAkDQ5/075xqyh9+qKnmm7u82cg/pag2I3wARnN86pSNbG4hiFk+
 SA2qEH4iede6iKOEHcxE/i7T2W3ZvvNADJa8gVgCwIndqDXRh/jqDvS8H g==;
X-CSE-ConnectionGUID: XvHFC4PjSFSz9gq1CffGkw==
X-CSE-MsgGUID: X6i93w3GQzCMq88TPArXeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11539"; a="62795977"
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; d="scan'208";a="62795977"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2025 03:39:23 -0700
X-CSE-ConnectionGUID: LJYi7MoBRqGHL+Vdf6fnog==
X-CSE-MsgGUID: 2NXrcwYCRyKxPxWHQL0J1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; d="scan'208";a="176301896"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2025 03:39:23 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 1 Sep 2025 03:39:22 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 1 Sep 2025 03:39:22 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.61)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 1 Sep 2025 03:39:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aSjVhaiFiI2MQRHPhOtmlzphEavGNsylSKBrhC8lRW+Nme3aVC9+vqVQxQbYZi0bN/AhWEuXVXjoXckqE6xgZPa05iluWlkWdXjIpbmRa3XfpIzlfrsofhh5Di9YaS8lnPnBgg+w93aYHXN7Tv3G7/GbGKhe+NdYODiTM/9bPMPN2R+E3SorD1iU3b9TunY4jl//2Tvx1YOYCowWhhVd6sd7DjyDX9gAwzo/lIRUC+7fu4oBD9hHF1PRXVyKiREl1sDG5rlTApsSG/sktNL+VVm4/N1Z87zLucyQeKCFRcoJid0l5AUsYIE1y4FkuxlPZwg41J6CoDNbul9D4IXuzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N5SG13T+DBET7Vg2QTR+sM4gtEEwNKHIGrQg5ZfAEl8=;
 b=AlYMKLpmt87SW9cwZyVru4vjGf10RftOvm8sjQfYVV4IOsKoF6s9hZPCsS1z7sXPsTmmaibAXnoJUwqUgE1DJm+NsT/68qKOJOLVHNg4Fmey6uvKutA2Chxg0YLBooTWx0G7JwiXNQ0qYIvlJrFJKmaBTcBv97SRDJpB/61NwvunQpTVG6JPm+M4jUAybetQ3KUNr1+IF1dP15/hO68kxLF4vqWJSGDcMbBx+IlJ5AzerpPQu111xddkSXPP1ecRQUBJKjh78mBfUJQB6VOLiTaY4aU5AQZyOsrXoGbTIJdfV3p7K9B7ibvWAJQszPphPl07hkSCx9itW1Ek2sm8Ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by PH7PR11MB8552.namprd11.prod.outlook.com (2603:10b6:510:2fe::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.25; Mon, 1 Sep
 2025 10:39:19 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%5]) with mapi id 15.20.9073.021; Mon, 1 Sep 2025
 10:39:19 +0000
Message-ID: <22a99d81-7530-402e-9eef-28f658cee8e7@intel.com>
Date: Mon, 1 Sep 2025 12:39:16 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] drm/xe/guc: Add devm release action to safely tear
 down CT
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Matthew Brost <matthew.brost@intel.com>, Matthew Auld
 <matthew.auld@intel.com>, Summers Stuart <stuart.summers@intel.com>
References: <20250901072541.31461-1-satyanarayana.k.v.p@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250901072541.31461-1-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0022.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::24) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|PH7PR11MB8552:EE_
X-MS-Office365-Filtering-Correlation-Id: e338725c-c423-454b-3364-08dde943ce5a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WTJjN0VKRUhZREpyWjJrRXF0dzdxRCs4QUxWRnJWZ0JHK2xERFJhWi91VmE4?=
 =?utf-8?B?QmF6NThDemEvMjlWSkhLeTZQYk5OWXN4TTk5R0MxdDdQQWpCRnR2Q2tmRy9C?=
 =?utf-8?B?YVc0cGY2djl1WGRhYWlKTnZTcnFzbTBlc2xFM2FVdGtTUXUwSmRvRG5ZZjBB?=
 =?utf-8?B?MXpybFpIYUo5bGFLSjRNZUV6MDhsMGM0S1pZS0hCRXA5SlhmR2NkZzFFQ2Nt?=
 =?utf-8?B?bk9rcG5PNlNaVWs1enNvaUNlOEUxUTVnM2lZRFZ5M01iQnozMHhjYTBFcnUr?=
 =?utf-8?B?UUhaY2EvbmFGUEV5b0VEVlUvQnJ6WjNDWmkxNkxkRkk3NnVKVUNKSXpwcmdZ?=
 =?utf-8?B?N0FmRFcyQ0srVThURnlRMy9xM0k3QkhRMXVHd2Ntc3R3a01yOXM0ZUdQc1BP?=
 =?utf-8?B?Y2VTc04wbmg0QjNCeUZRbkhzVW5lc282K2lUeFc5SCtPNTZuem9RZ082RXNW?=
 =?utf-8?B?WHNsSjFMRGlWeDRWZGsrNGppTFl3NW95T1RObjRKZjhUS2xCU0tiTFczcFlI?=
 =?utf-8?B?bkRFeFhUOUZucE1OZE1sNDN3eko1c0hRc3NjNlNWOE5PYjlXYS9HNjQ1Z3Fo?=
 =?utf-8?B?MStTbFdaRlJ0Sm1YRy9GV1kweEtGNUxrWERNWlUrRU43WnYwT3BoMXFMY2gw?=
 =?utf-8?B?aFNibEU3eE5FaEZSYnpuRm1BUmFmOWJBZ3pxbVVJRXNSeEVnbzA5M0NiN3Vk?=
 =?utf-8?B?SjE2SVhESnRrdmpKRElGeW1FeHA4ZmVpTGpmWk5UWTJJVHpNa0ZsbXRwZ2hD?=
 =?utf-8?B?WTZHU2V3N3ZBRnZFMEl1TTV4QTBIOGVlbW9nTlRxbGFjUDM3WlhqbFpmZWNQ?=
 =?utf-8?B?QnM5QkhZOStvZjNqWnNjb3FyVzBUMjN4RExreE5tTkpqNHh1dzI1bDc5NjI5?=
 =?utf-8?B?ay9DcVVUZXprZjRpL2c5WXV0VHBRdEI2K2ZOY1MxRm9PZHNnQjgyZGtMQXB5?=
 =?utf-8?B?VFhkUzVlZ2FYbHlib2Y0UnZJNDlZcUlSb0RBRE9PSFhlSW1sblVsekZGNVZY?=
 =?utf-8?B?VTdKUnhsZjZERTZMdThKblZCYTlFN21WTHhWODhzczBuRTFwcmxGbVRwNmw3?=
 =?utf-8?B?UHRWYlgxb3ltY2xQZXVUdVBsNHpxUFhOY0JhNnk5QXh4OXVpS3lvZ3l1eVhI?=
 =?utf-8?B?dzVMSVdHRTN3M3JkczdtOHh1YmR1dnl4c3ZqeFFGWklUbEs4bVdXSEFqaTJV?=
 =?utf-8?B?MURUOS8xUDBqTkJIQ0RHVHdJb0czTy9SZEpkc1RsWndVSG1zcG9ENTExaGls?=
 =?utf-8?B?RTJJc2F4L1NKWTBkTEhUbytaR1laZkpHY2lzcFBYTGJkU2JXVE0rekZiM3hR?=
 =?utf-8?B?TXNzRnRTc0p5R0J4UjRkRDRnNi9GUVpSWVpYYm5PSlVLUW8xZVQ4cEV4ekxr?=
 =?utf-8?B?d1V2VnJUM0s0c3Q3YjY4aThCREZ3RUNJMmpyREhjaU5rZnlLUzhIWXUxWEdy?=
 =?utf-8?B?Wmo1QjRWZE5ndGtrUk5RMDY5THU2cEYzaXhrWGoxa0hmYldHSVd5WlMwbXA4?=
 =?utf-8?B?U1BMQW92dGkrR2FjUVVFZEt0b1E2angwZkVJZ1R2YWZORmErU0daUzYxU25U?=
 =?utf-8?B?SXIwV21MQ3VRNGU4REVaL3FmTnJYbWlQTEpXVU9tTkQ5ZVRnNUM4Nno5Z3NK?=
 =?utf-8?B?cjBvbGsxYXpnMTRISzFOWkFVVGIveG1ReVhCVHFsMUNEWTZoWWRtSGgzdS9a?=
 =?utf-8?B?ckpKODRFRGI0NzRpZlM5aFpEYmdESGRZQWxmSGlxdzJBQnk1T1c5VTAweE1L?=
 =?utf-8?B?YWlwbmhuTHVySGxkUklRZ2FJSGNMY3prMm1XaHVWK3hHbVVrTmtQdTdtUWov?=
 =?utf-8?B?VXJxanRtcDB4bUZ3SXZHNjNwSmIwd0hxT3F3bUU0cnRFdk0wc1VhcVJhMnJE?=
 =?utf-8?B?RkFZNTNpY0NLYW9XVE9DT0ZEckpQaEcvM0NGaDBSYVYvNVkrSGw1MTJiZ2VF?=
 =?utf-8?Q?EQgYTXIC4mY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cFpvbm5odzJTeWllSk9LMjNqT0tPRXdJZyt3VGNhcjFlU2VHSnM3RXcyUU9m?=
 =?utf-8?B?NFpISkhHZWtsdkxsU1EraGdnUkFxczZzR0hsWUkzV2M0TERHOHV2MzhXbnhQ?=
 =?utf-8?B?empOUThtQytObXdUWXJmVE5laXEvb0xNdm9rcWhHLzd6Z3FSQXZJZStEaUMy?=
 =?utf-8?B?MVVySmkxR1lqL3Q1LzE4aVlvSWtwbmVoeXRYdnhhRE5OblNKb3k0VTF1ZW0w?=
 =?utf-8?B?VGdkWC93Vi9uUTM3WTVxQVZ3ZG1yTmRMWVorQmhNSlQzNEUxMjhyaExXTVpq?=
 =?utf-8?B?QUdhSkxuVmY4TWFrVlFMbGtnMFNGa2JmZVVObVRhRGVOQjZWc0dxR2RleHB0?=
 =?utf-8?B?ay9EME01blBxWkEwcTZic2VTM3k2RE9WZ0ZIQWUzZC9ibVQ5eEVGeFRCZk95?=
 =?utf-8?B?dThkSFZ5UTlkd09mSnNVcHRHM2ZUV3JrRXJGT0Qza243aU5hUmlkOEhtNldj?=
 =?utf-8?B?VkpLbk5WUE5OTnhuLzVxLzQydmlvZ3RiOVBWRmlvVFd5NjZOWTZhSnNOazRr?=
 =?utf-8?B?aFN6cTN3YTZQNWJqYjZUelNhcVhtaDFPeDNrakhIa2ZVV01KaUxOSmFENG1D?=
 =?utf-8?B?alprUnNKajdiWTFhQW9YOEg1ZCtqd25PWDdkWExnZStVOXhlVGVPcEY0UWJr?=
 =?utf-8?B?dStNZTZRcTl4UXVUNXQ2MXgyRmRQaGNnWXRFTlpRTi9IUUh6Yk1RMStiQ1ZH?=
 =?utf-8?B?c3VnWDRBVkIyUHliRXFVQTBjWDRsR1BzYUhPZ1I5VVgxOGV4MXpMU2FSaEk5?=
 =?utf-8?B?SGFkSHhZbEdpYURWK2Zsc2lGeTltM3ovM2dQUXkyVzBCa0Z6dVM2UnlNQm8y?=
 =?utf-8?B?MFdaaUU5QXBHZk9SR0gvenZGQnVrOTYxZTduM04xc1ZpTUlFdmhFdmlVQjg4?=
 =?utf-8?B?UWUyRU1udC8wZ2lHeHcyZlNFbWUrYVNDQ294em1TZk5XMEpQQ0R3cnh2Z2RH?=
 =?utf-8?B?VFFUMXBmWGhRY3VnSXFQTDVHTWc5V2F5dkVjK2sybEE3ZUQrWjFzcHd1WXFB?=
 =?utf-8?B?T21hVTFDbFBDa3dxY3psUlMvanREVlZDRi9LM3M5aUJISEp6MnA2M3lZVFlJ?=
 =?utf-8?B?L3VuZXRwMnFEVUpCcktwKytKUXprZ3FRMFpKbEJLd3FLN09OMmM4dHhVZFZW?=
 =?utf-8?B?Q0xCcXhZWHpYcVpvSXBlZWd3WFRBdjVLZXpWdVhhV0RlMjBhZW15cnBKdDZE?=
 =?utf-8?B?OW94K29ENG92eXVtNEtsZ0wyZEl1TytYdWx1Vng2Q2J2amJIUy85dklVTzZN?=
 =?utf-8?B?U1Y1NkdzVXNDTzdPMklUeHNhQ3g5c3FEMTBWNkpyUDVHeDFBZmZqSXVrNEoz?=
 =?utf-8?B?NksvbndzRkJiQjNVSkoydzJCT21EVkFucU5BQWJYd1JDYzl4WWl2aHpxS21u?=
 =?utf-8?B?Y2U5OHBUR0F0QWNwRFdObS9heksrQUZoZDYzeDR3dnhGUHY4dzg4aWUwNFNM?=
 =?utf-8?B?RVhTbmFkYWlmVHlrSW1mell0b0YxWUdTRHNiY2hoVE1LQ0w0M3F1NDZua1ho?=
 =?utf-8?B?ME83U1dFK1Q4SUdmRGxsY1A2a2pnZ0tBQkVSV2wxSm51MnYyeFlYWDk5clVl?=
 =?utf-8?B?STBJNDNUb0txOUpLOW1GQnlza1pPYlV6bDFxWFZDbXF1LzF3NHlXYzRzb0Yr?=
 =?utf-8?B?aGNsd2hsbGFabnBYSklwQTRTeE9xOEpqQlpVLyt4UDJNNHBWTVI2WER0Mkl3?=
 =?utf-8?B?c2NPQWU1M1lCeEJ3cUdpVzducUhTbEpBQTJaUW1LV1ljSmNueXJlbWFoMGps?=
 =?utf-8?B?N2hSdkEyK2xpdXNtc1ZCSG5DOUNXNkpjYm1RdysrQmZMYm1pUWVnemhiTzg2?=
 =?utf-8?B?bEJtVXRrNGo2bWkxaXZXcTFHUFhPaGhZajFSbHNUSktOcTRaVFRtWU5WemVC?=
 =?utf-8?B?WXA4QjFoNEwzczdFSHh0OGhsb1dQN0thVTJ2UDA2b2lqK3V0SytHVmFBeExo?=
 =?utf-8?B?L2V6Y0JPbEQyamV3RHJsYlZZaDJoaWNWRytXZDZXZldNRzNWemlBOUFERExO?=
 =?utf-8?B?aGdsQ2dWVGxRc09PVGtyQWlDUnZlcGZ5b1lia1VGU3NZNEVDUmZnV3IrN1Vo?=
 =?utf-8?B?Zm02eTEyRDZQTGU2ZHVZbWs2TzE5bGp2UURnUTRTQzU2bllyb2NTMWc3VndY?=
 =?utf-8?B?ZjB6L3BDUjlpb1JZaGorSmhYd0pxOHZENVl3QVF2d0pIVEM4TngrUVZpeUdk?=
 =?utf-8?B?bkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e338725c-c423-454b-3364-08dde943ce5a
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2025 10:39:19.3108 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ivAERFqFUgoIwf5ORiPZNylZeGDPJcyZynpkmrIxATAk9MEiKNijZGGVy76bEV0w2YNnXoTzxbbxs/ScCTFiHySZYvvYY+wwdzq0gG0xasE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8552
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



On 9/1/2025 9:25 AM, Satyanarayana K V P wrote:
> When a buffer object (BO) is allocated with the XE_BO_FLAG_GGTT_INVALIDATE
> flag, the driver initiates TLB invalidation requests via the CTB mechanism
> while releasing the BO. However a premature release of the CTB BO can lead
> to system crashes, as observed in:
> 
> Oops: Oops: 0000 [#1] SMP NOPTI
> RIP: 0010:h2g_write+0x2f3/0x7c0 [xe]
> Call Trace:
>  guc_ct_send_locked+0x8b/0x670 [xe]
>  xe_guc_ct_send_locked+0x19/0x60 [xe]
>  send_tlb_invalidation+0xb4/0x460 [xe]
>  xe_gt_tlb_invalidation_ggtt+0x15e/0x2e0 [xe]
>  ggtt_invalidate_gt_tlb.part.0+0x16/0x90 [xe]
>  ggtt_node_remove+0x110/0x140 [xe]
>  xe_ggtt_node_remove+0x40/0xa0 [xe]
>  xe_ggtt_remove_bo+0x87/0x250 [xe]
> 
> Introduce a devm-managed release action during xe_guc_ct_init() and
> xe_guc_ct_init_post_hwconfig() to ensure proper CTB disablement before
> resource deallocation, preventing the use-after-free scenario.
> 
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Summers Stuart <stuart.summers@intel.com>

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

> 
> ---
> V3 -> V4:
> - Fixed review comments (Michal).
> 
> V2 -> V3:
> - Fixed review comments (Michal).
> 
> V1 -> V2:
> - Fixed review comments (Michal & Matt B).
