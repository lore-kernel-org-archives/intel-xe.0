Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 381B4C52D7B
	for <intel-xe@archiver.kernel.org>; Wed, 14 Aug 2024 15:24:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3C9E10E4D7;
	Wed, 14 Aug 2024 15:24:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hqzxSEG6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8157E10E4D2
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Aug 2024 15:24:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723649096; x=1755185096;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=lhHLHzAsKmg8h+5wSrLCmiooWfH6u16NjupCKMWf/gg=;
 b=hqzxSEG6gDETF0AEgkyhiQn/L9Uw4mYU2OKv8lvuIOMnB6NxryaRH5ZY
 YrbisXTp4DwLg6G4CC5nZ8QdIPi1F1lkgfW//l+94lEaA5TirlLgY8Iua
 ioyLL20Obxyj+L7QgmKT/CyWYEetdR3KivUX4qX+Iq/so/BYVMUPMtA1/
 tztcbNZIJrLsfYTJCAZX0q4Oug8v7hy04jHrJUev4ORZ4DGYkRmW/K30c
 uX59nZE5MboyFNDdSCUIsLqYPDib+EGvBmdezbj0dxTjtRk4mijpCoFUC
 dGR9ZgaIMdb2it8WXLAPENQ2xie826UKNeqCtg4G3K0SI6WY/ZNMMQtFZ w==;
X-CSE-ConnectionGUID: mljhccIySsGhtMUfzsEG6A==
X-CSE-MsgGUID: rKcHCZuhRSGrJDG0ZgQY8A==
X-IronPort-AV: E=McAfee;i="6700,10204,11164"; a="21518372"
X-IronPort-AV: E=Sophos;i="6.10,146,1719903600"; d="scan'208";a="21518372"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2024 08:24:56 -0700
X-CSE-ConnectionGUID: aLU8RfwmTe6n7v9JjCDaCA==
X-CSE-MsgGUID: 06hr5NPAS/+JH+L4PHSKsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,146,1719903600"; d="scan'208";a="58927039"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Aug 2024 08:24:56 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 14 Aug 2024 08:24:55 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 14 Aug 2024 08:24:55 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 14 Aug 2024 08:24:55 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.42) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 14 Aug 2024 08:24:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jrzVw99xtpXgSaLa8BxRtY7BnmxGdPVt3RsfpQRLznasJEPCw+FUX0hfkRniJpceIDeM3R+HI8hIt0L/IsbBm3+GQBiLXMGo+lEAq9GexfKIGCI9Ms00n8QeJzQHDv1JajRSeFPANkn+M8XIZ9gHPFSE+SCuJuxhDXKqZzdnUAmVLQdy1ixkebt8/S4rIO51b/rgTKS+MJg9MKwu/Gt3hpJc020jsCDzS7PVhlo1ZE/smsWp3bnKy6Fbsn3mUFIGyCkyGsNowavAjAwC2hmIM8Vtvx3P+L50ROhgPHqvutpZbYeT4YAKlkIuksVi0P+YV/V7NGQycUjvg9xMfI6ZAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CgRWV1fH828p0n8baHPQSsZuXj+Klvfk1jvPycU/fw8=;
 b=fiL6Vqa7J6bH0/YWfE983sn0jg2D2b9x0VkFQGUkwGO5wdFWjYnUWmuyNNUivCJPOKCubvTdnJXlxCAtUjzDya9jhZlYQkIHVtvY4JJTHO6juNZ4OzdtWInRDhAwjHowtwulldokCgFCy7oqqBJSh1wiZcgPqhpzHEfWw2tS8BsKcZrzhsQwFRoBXquRZCHJFL7TCIgFR0HoVcmTwpqgUQhevdf5vg5CgkpO2tUCqgpdRBEDs2fu9Tq9ZZ4WqL672ojAnuVNAbLfhxcBgrX1K/qp3E6neejSf8w5NCe4dZrsuixm08Mt1ePb9HPF24Gu50/GemUiepznhYrBmelJcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV8PR11MB8607.namprd11.prod.outlook.com (2603:10b6:408:1ec::18)
 by SJ2PR11MB8471.namprd11.prod.outlook.com (2603:10b6:a03:578::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.17; Wed, 14 Aug
 2024 15:24:51 +0000
Received: from LV8PR11MB8607.namprd11.prod.outlook.com
 ([fe80::55b1:592:df13:a9f3]) by LV8PR11MB8607.namprd11.prod.outlook.com
 ([fe80::55b1:592:df13:a9f3%5]) with mapi id 15.20.7875.016; Wed, 14 Aug 2024
 15:24:51 +0000
Message-ID: <d72b05ba-1525-40d2-8e35-cafd396f5012@intel.com>
Date: Wed, 14 Aug 2024 20:54:44 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 3/3] drm/xe: Define STATELESS_COMPRESSION_CTRL as mcr
 register
To: Tejas Upadhyay <tejas.upadhyay@intel.com>, <intel-xe@lists.freedesktop.org>
CC: Matt Roper <matthew.d.roper@intel.com>, Matthew Auld
 <matthew.auld@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>
References: <20240814095614.909774-1-tejas.upadhyay@intel.com>
 <20240814095614.909774-4-tejas.upadhyay@intel.com>
Content-Language: en-US
From: "Chauhan, Shekhar" <shekhar.chauhan@intel.com>
In-Reply-To: <20240814095614.909774-4-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0082.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::12) To LV8PR11MB8607.namprd11.prod.outlook.com
 (2603:10b6:408:1ec::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR11MB8607:EE_|SJ2PR11MB8471:EE_
X-MS-Office365-Filtering-Correlation-Id: 8557b84e-64d3-4b8a-9f10-08dcbc753dae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aEVqWVhudlVBWWxBUVVlNEIwbVVJRnZyenpSc0pMMXFVcFI5Y3dlOCtMbkF6?=
 =?utf-8?B?T3B3NkNWRUZ6cEVGR0s2VEJRamlrSElmeS9GVStrV3gzT3NSRFc2WkN3K2h2?=
 =?utf-8?B?MStNajQyTWZlMnV1TmJCdWdqaFhKKzdkNTdqZjgwaUVSdHBPWVVyZWpSWjQy?=
 =?utf-8?B?L2ZXTlhwVG1EejFJd0hicUhXNDNuOTV4ZndQQTVrNXFtOW9vZjJpQTZmaVI3?=
 =?utf-8?B?RXM4U2ZlbnRQMTZ5Zk8xTDVlOXdkeDNtN0EzdUhNWnBqTEVsb0lpek9mVFZV?=
 =?utf-8?B?QjFaN25sNjdMV2w1NWRQVUwxeU9FU0orayt6OVZ1cjBGU2xyOVlXT0NGd3hB?=
 =?utf-8?B?ajBTZlhqam1FcUhMQ3dDdUFZY3AzRThIbDBOb21hQ1lTcVRNZ0cxem5oUit4?=
 =?utf-8?B?dzcvMU1WbFl1bU52MGJYYWdZVXh2c3o4M2xmcHg4YkZWSWtiOVBXQ0VyQm9u?=
 =?utf-8?B?TWV2dm83am4vcGlVTVAvTXh5SXhIR1UxVnh1WEgrUElFU0JiejVGbmx2MWFt?=
 =?utf-8?B?ZmNBRTkrbXhkRjZPelB4Q3BXT3FGYUlidVkrTnRNeXJpcWE5VjBpZ0Evcm80?=
 =?utf-8?B?RGpvMWFjMFpMaW0ydUJ0VC9LQ3hvQURlbXh6T2JRM3NuQkQveG5LeU5JbmEw?=
 =?utf-8?B?aHJVUGhhcU5PalNtZXJUYlJkSERGZ3JCeTVsYlZaU3BDY21MbWE4bzhxYm9O?=
 =?utf-8?B?T1A3MDJFdWJHZkFjVlVoOHRWdVVxcXJnRlM4SW9MQnk3c1pRU3hpZlpOcEJv?=
 =?utf-8?B?MjhtN3pBQWdtNHE2ZVVsMXh0MGN3QTAwS28wMmluOGlESytsUFNheWRpU0Z6?=
 =?utf-8?B?eGlZY2RKc1RQclFGQ0ZYTEE5RGpKOHFRUFgxWDBhcjBNOHladmNWQVMxaFM4?=
 =?utf-8?B?aHJJVG5BWmhMWm1LbGFkWlIyRHFEOU9QS3FlRVBvV01vYlJCbjJHWU5ETHlx?=
 =?utf-8?B?QlUxUTNCcXJFTlcva2tMUytTQ25XMlB6NUUvRzB5NjJQd3ZxeG13SXJaR1pr?=
 =?utf-8?B?ZDNkK1FoUUE0YmNGQVlUQkgyUDhIYnA2a2hQWGNWSXRaTmlPR0dDYy9hZmg3?=
 =?utf-8?B?ZmwyOXprTlBlOE9iUUo0enliNmk3dmFqTmdJRHg5eG1UbFhmSlB0V1kxUmg5?=
 =?utf-8?B?V3g3dVFreVhObHozT1pKNkJKM0JMV0xlcFJXN0hXMGI1TXRtYVQram5EakNr?=
 =?utf-8?B?MFcrT1RlSzlFVjFQSGJuOUhueFVnL2tOOER3cms3T3lZbmZGZGFDbzU3cEow?=
 =?utf-8?B?SzJVbmRCaG9HdjNRbHdSaWtTMWFLUzR1SlFpUWZKT0JCUUpHOWF6Wkh0QXdi?=
 =?utf-8?B?V1JoYStoMGk1elFmQkl3U0VoN3dQNjlIdVhTV1pCazY2SWc3N2I0cGQwWHJN?=
 =?utf-8?B?dWpRajhzTk10ekxTdXhLcjQ4L1Q2NXhjd2xFTTFIUnU3cGhrcGtTU3BMa3pl?=
 =?utf-8?B?aitWa0VmeVRXVHpGbnhiVDZraHFrUWNPclowbDdjTHVncnpDTDM3Zm5pa1gz?=
 =?utf-8?B?RmZpWEV2V0NneXM4cW5Ea29YbTZ6TDc2WXBYMnUwY2hXaTdLMFZBMktUaVB2?=
 =?utf-8?B?cnBNTlNEWFdNeEN4VUxUcVhRaGpDaDR0ODk2YzBib2ZpaXc2OXhWWmRzU09E?=
 =?utf-8?B?bkpmdW5MZXZGUFVsOVlNZmhRb3YwVzhnSFdJRVV5Nml1WWJIM2VtZTNQSlFx?=
 =?utf-8?B?TC9sTmprZmd2RXpUM0l0VkdUdGNxRzZxeEd5aTZ1SlNXME9hL1B1aitBaU9T?=
 =?utf-8?B?OEFnN1Z6ZHk3Q2xHdXNhWFExZWNsSjg3QlNjakMxUythVGtpR2tZTFZNcHZF?=
 =?utf-8?B?QnQ5NG9kWk8wd3RscUhWQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV8PR11MB8607.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Vkgzemc2Z1NkbUtxZ2ZvYnZrSnY2cVFVRm45NVpJMFNIUFFnU1ZXWWtBS1o0?=
 =?utf-8?B?RG5MVEJScHRNT2o0cml0amtiaTNWSU9JaFdjODZDd1BqVktJMmU4ckwyK1pp?=
 =?utf-8?B?SUpaT2NlalZOWXBSNUdZN1pidzBDeDV2Q1NCb1FJQjZwSDR1U01MdXlxTEg1?=
 =?utf-8?B?bnh4bDJxQ0NKbUNGT2FsSDI2UXZFQU82NFJIQm5LNVV1V3Nab3dka3dHM2Ey?=
 =?utf-8?B?cEV0aE9nd2FrQjk1MUlDcDk0eVVtT1ZWQlZ3RXRwQzNLbnJxOC9DN1R4djdi?=
 =?utf-8?B?UDlGZHRoQmJCdkFaS3diOXJRNnowRmhzbUJETjhmdTgyTi91N0pGUlFNR3lL?=
 =?utf-8?B?Nzl3VnVweWdWamQ1ektqdzBHb053ejRHUFVIS2U2QkhGM0d6Y29XZlBvQlZE?=
 =?utf-8?B?N2JURlBFdFJHSDVHN2pUMWpEcWVFa291QWxyY0V2S1Y5OGtSZXZZMklSdFdP?=
 =?utf-8?B?SnJ2dkJ3eVBwZm9BTCs3ZnBBRDM0NVBhMDZ1WlBUOFVRVTZSK2FLSVpiNytP?=
 =?utf-8?B?M1BnTDVnR2pIM2VqU01ZVlhBYktMcGVtZEUzdlEzOStWMVNPT3JGUW9LaTdr?=
 =?utf-8?B?eitiZ05EQjF3ZG5JTENIOE1uUDVReEd6TkU1d0tZaUFkNlZKKzZEQXVVTkcv?=
 =?utf-8?B?UlZSUTNQeGZQQVZuVUlHeUtYeHVBQllCYWdIbjhWNUdwL3dJMWRwSkFtdy83?=
 =?utf-8?B?ODNZVkc1c3ZvQXdqaDB5RjJJWkNGT0pQNEVzcU10V0NGS251Sk1iUnp1Umg1?=
 =?utf-8?B?cWFtZWhMaGNlYnp6dThoNkVyOFJodSs5eHcyMGh6Z0pFdUhydVFRaTB2dEp6?=
 =?utf-8?B?cUFSMnAyZDlqRWo2RHkrOW1JTFRLTW5WWHJnL1gxNEVBZGxNTEorbytWQVg3?=
 =?utf-8?B?NFp1T3hnTzV2aURLb2JrbDRidTBSN0ZMc2c2U3E0M2lIRHFtQjBkTGRoUmdu?=
 =?utf-8?B?TzdEcy9sSG9HbU9nRDM3WGZyS2NtQU1ZTEpvNHNDN0dsWllRVXdCcnRsRlBX?=
 =?utf-8?B?ZGNSaVNoQU1BSU5NMGlNZVR0RWJkTU5tcTY2bXArYWhnUGlnUVdKRE1ITGR3?=
 =?utf-8?B?M2NYa2RUZ2RpaVkyYVdoUW5wNUZhWjdYem04WW1PWUZOTUlDajQvVXg1bzBD?=
 =?utf-8?B?M21NaWkxOVhCUUVsWDNRYjhQbDhQeUJPYTBUa2E2OGRTWEx1R0M2ZlNtVXZS?=
 =?utf-8?B?WGRqeTVjL3pmbkk4SHRWZjB6SEtUYnQ0R2RiNWk0UCtEM1J0MXJTV1VENVJO?=
 =?utf-8?B?UWxWdUdId0dpSEpBa244QS9haUdWS0VMcGF4dXRzcy9tdHZLOWVDUXFreUl2?=
 =?utf-8?B?UGhrQ3RKa3RYUStpLzNzSnlSa3ZRT3FmSjNBaVdBV2luSzNhWWlvQy9zcmtO?=
 =?utf-8?B?dnVNTnFsd250d214a3phZWhHTzNuck4rcWUzT0NkMVFLd1Q5eFIvbjlpVWlL?=
 =?utf-8?B?dXg4d21zVWhTSmF1OXoxMFhQQ3NFMFpGVnVhZUVxc1QrVk4yNUJTK2FhZTZF?=
 =?utf-8?B?V0M2bXdkK0FGUWdPMVlzbDczK0NNQVJiRE8zZG4rSDhJQ3B4TFNIa3JNdTZy?=
 =?utf-8?B?bmczeGJ2WmNjdG03QmFUTHUrTENhYS9KUUw2L1Zsd1l6bVRPWVliQzdsNGhn?=
 =?utf-8?B?MTdlQ0lxVnltdDlkMnBrZkN1N2JvZUo0aGQra3FCcENEN2Y4R3dIbi9aVVUz?=
 =?utf-8?B?d0JZblVyWmo3M2xTSk9vTkU2Vit5R1dEbTBZWThaZXBWaTkxZG1UeVJySEJP?=
 =?utf-8?B?NkxSckltMFBTMjRCQ0ZnMy9zWnZVZGl6U2JWcUh0Y01TWW9taWgzNGJEbXpR?=
 =?utf-8?B?STBjV0RTTzdaV0J0dHNQa1ZGcmdrWk5TWjZ1VkxYaGpSQys3WE41Y3BLY2wx?=
 =?utf-8?B?RUxMYVlYbHBUaDJKc3ZHbEZtZGNIY1pDQkMyWW1DaENCcjM3Q1dqSGZUdk5C?=
 =?utf-8?B?UmFBRGVFTlp0eTFFYWhNQldUaDhnUDhGcTBCMnFqeHdUdHdHWHhnaFNuVjZT?=
 =?utf-8?B?MUJCYnpCaXFMTFRYTUtqckI5Nlh5SktsaHVQemxybmpicjhZZFNPVG1sdmNr?=
 =?utf-8?B?czVjVjAvckRvOURvTHgwbGV5Y3QyeUlEelpXTnJjWEpZckNUZGJRUE9kaVVZ?=
 =?utf-8?B?NGIvOXFtait6OEpocitmTlVsOUJlSGJDcURVM3l6OHRXM0dFUlgvd1FDRGpK?=
 =?utf-8?B?S3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8557b84e-64d3-4b8a-9f10-08dcbc753dae
X-MS-Exchange-CrossTenant-AuthSource: LV8PR11MB8607.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2024 15:24:51.4829 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d910kiemsAPIWbctrBSc9/zJAEKImCNsFdyaNhY3z5hzdASYI/VFAWGLmt5PYdPhTHi3ONFzesVqZQW/b8vcSg/7uWWGkQiColE51Yjc70k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8471
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

Will get to your other patches soon.

On 8/14/2024 3:26 PM, Tejas Upadhyay wrote:
> Register STATELESS_COMPRESSION_CTRL should be considered
> mcr register which should write to all slices as per
> documentation.
>
> Bspec: 71185
> Fixes: ecabb5e6ce54 ("drm/xe/xe2: Add performance turning changes")
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

LGTM,

Reviewed-by: Shekhar Chauhan <shekhar.chauhan@intel.com>

> ---
>   drivers/gpu/drm/xe/regs/xe_gt_regs.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index aeb17fcb27ac..0d1a4a9f4e11 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -80,7 +80,7 @@
>   #define   LE_CACHEABILITY_MASK			REG_GENMASK(1, 0)
>   #define   LE_CACHEABILITY(value)		REG_FIELD_PREP(LE_CACHEABILITY_MASK, value)
>   
> -#define STATELESS_COMPRESSION_CTRL		XE_REG(0x4148)
> +#define STATELESS_COMPRESSION_CTRL		XE_REG_MCR(0x4148)
>   #define   UNIFIED_COMPRESSION_FORMAT		REG_GENMASK(3, 0)
>   
>   #define XE2_GAMREQSTRM_CTRL			XE_REG_MCR(0x4194)

-- 
-shekhar

