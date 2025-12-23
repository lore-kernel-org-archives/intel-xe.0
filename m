Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A5D3E6F09F
	for <intel-xe@archiver.kernel.org>; Tue, 23 Dec 2025 15:49:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E089210E14C;
	Tue, 23 Dec 2025 15:49:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O/DSu3BK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BDEB10E14C
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Dec 2025 15:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766504997; x=1798040997;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=uN15/nQmOYLqjM2OADE7d01SWY7yoVZEaddrhZUn4gw=;
 b=O/DSu3BKZoZrDUDb38K0NTNWelkOKp4sQik7sj6nT04RtbjBWexv0uan
 wSTwfdih7evQG0lxzME//jrHlJHeWycSs1UXUzbbwNKr4ftagYO3NOvb5
 9s0+gJ/HJvnNKBhLTHaVZbOmgUU10X7ExZ0laxhY6dhA7Glq+DrWu40/Z
 QqfMWWlmkPbt3X+o4k8uSNDHEmEX3nikr8pfKR4tw+5qQfgeCwkIqpaRj
 jwVghLWv3ERlCr8oxzoG0O9+8ndCw/e606eorq3Nr4tIvc6jrIXU00bXj
 yWcCRXx5EN1QsXpVnC9ngRVzyPzpUh3ejDmyDOew6LY5cfAkKz5E6ZgsB Q==;
X-CSE-ConnectionGUID: SYJ7uILnRLqyZkJlBv0Yhg==
X-CSE-MsgGUID: F5Nv3n4jRxqZOlzbxEsujg==
X-IronPort-AV: E=McAfee;i="6800,10657,11651"; a="79716427"
X-IronPort-AV: E=Sophos;i="6.21,171,1763452800"; d="scan'208";a="79716427"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2025 07:49:57 -0800
X-CSE-ConnectionGUID: qK4LTSMdQZGpckHz/+7flw==
X-CSE-MsgGUID: U7Wvk6d8SDiJWvAjsUXIbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,171,1763452800"; d="scan'208";a="204327200"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2025 07:49:57 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 23 Dec 2025 07:49:55 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 23 Dec 2025 07:49:55 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.60) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 23 Dec 2025 07:49:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CYNUheuDUvXhdtfPP0BZnDDeai4yyZV987a1KH6MsraDhaK74uph4xx1/xCDkQTRso7KCC6REZ8ybIukA6yIIlG2yJqL3Tvo8KP4ofWsx/QXnNzBZ40dRVppwfrBb/jDLGH5ZSLsA4msDykYTq8ivjmF5aC5TnCzYVVKbA3E+eZR1mscIA2O9bLSd6afkAssjQNzN55o2tCjz592rpLw5w5T4Pyq6Rq9mcp5xPFFJLN4hN/+HrOZG5pwzuZsKkCBSw7XIG2HKl+FtgiHyAApJhoeDxfwcfFp2gcZnJwUX8tJsxIFVVUE2eIVd3Bt/bcVjEzLVwbJFWTKKohvwN7IDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/LnIW5gl3C5+4dI6FQcmdYzSVAQtVeO3HdmNP09X8CA=;
 b=LFcSEV1lWLWoPJHM8+QKncfW21QZo5B463jQ+LR7TSoYuT+FEQ+4qb9+b3DQ9CU38PTcxK1DT6NY9YBS/1DJBkFzORB2yQmV38vzBXoXqkBdR+82GGEkfh7DLSJG28okBbZnIv2oRK67sZPy3f7FJrTj4gHI4PP27gEZFYvQ7lZckSngII3RIj+JLgVBsAEiZFoPrU8uXyH4KewdwFJfi0t2tVftK209bZF63FHo/04KBDRN37o0ngH+TeqYe6MSTZut+SqEbNM+0lIlco3/G2po3fRyz40wj4S3Sclqv9oDT5GWwzolhAdKOy1frV96WT77lu3XJ5fOVo+RnglXsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5249.namprd11.prod.outlook.com (2603:10b6:610:e0::17)
 by MW4PR11MB6667.namprd11.prod.outlook.com (2603:10b6:303:1ea::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.11; Tue, 23 Dec
 2025 15:49:52 +0000
Received: from CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3]) by CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3%4]) with mapi id 15.20.9434.009; Tue, 23 Dec 2025
 15:49:51 +0000
Message-ID: <770f94bc-e38d-468d-bf4c-067ad00a8ad3@intel.com>
Date: Tue, 23 Dec 2025 21:19:44 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] drm/xe/hwmon: Expose memory controller temperature
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <rodrigo.vivi@intel.com>, <riana.tauro@intel.com>
References: <20251216114030.226399-1-karthik.poosa@intel.com>
 <20251216114030.226399-3-karthik.poosa@intel.com>
 <aUUE7IXfU2zxyRLz@black.igk.intel.com>
Content-Language: en-US
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <aUUE7IXfU2zxyRLz@black.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0256.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1f1::19) To CH0PR11MB5249.namprd11.prod.outlook.com
 (2603:10b6:610:e0::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5249:EE_|MW4PR11MB6667:EE_
X-MS-Office365-Filtering-Correlation-Id: 2268a162-bdfc-45ad-0ca1-08de423ae8c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a0xxeUFlU3RST01MMEdCWlg3eE4xeUgvb053VlR2OVVWZXNYWFNYdmlwSmJi?=
 =?utf-8?B?VDI0Z1Q3M1g4clMxMnNTMGdsWVJCM1ZvcmpGQUVVeG0vanZ2c3FwQnJVMHFO?=
 =?utf-8?B?d3RhaE1rLzZuQ3RYMXZucU13azAxSFFZZXlFRWx6blp3L3I5YzNXVklyM2Rh?=
 =?utf-8?B?Q3dkc2xoaTRYeS9WWEVWRFNnbDhYaW5WMnBTRU9WYWRCNGlpWTBkczE3MFFu?=
 =?utf-8?B?VXhQd21JdC9YSENsRUR2SmE5Kzl4Z1NnN0w4aEpDUnVhaHpQWGFqaXV2WGJE?=
 =?utf-8?B?RHFrcGVSdGJuekpGN1Rxc1gzZGN2bjByZVhRaW5PWU5zSlpzc1FodGFRWHJz?=
 =?utf-8?B?bU9uakI5ODJSMCtBdTBSSXVHLzRsNDhrYlh6ZWpiejA3ZUFpS3hjMW1Xbm9G?=
 =?utf-8?B?bHNkaXRsaTBRcmlheFJ6UUtkUFlMZTVFandVRWZQY0xCT2thNGF1akNOZ2Na?=
 =?utf-8?B?azhNQTVQT0lycHZ6WDBLT3NqSlZ1SEo5NWJIcld3WmRiT1lMd2RVMDFUbUZT?=
 =?utf-8?B?MHZ5cUZkUmpwMkFpR2tDREJJOS9IU3p0QWxndUhWbCtva2F1aE00Si9adG9j?=
 =?utf-8?B?Qk1oVDRFK3RERzk5NncxZHhzZDFLNHRldHAxMy9sK1cwalE4Vmc4cHlLTmVv?=
 =?utf-8?B?RjluVERFUDQyMDh0YTdJcExFZC9DRTA4WTQra1d0YjBKQkRRdi8rYVdqdk1V?=
 =?utf-8?B?MUN0M01KeS9uemxlVkdZRzVqVVlEUm9GaHk4QmRSOFpUb2M1VjZ0WVhiOG9n?=
 =?utf-8?B?aFJjeVZtOGs0aEpGTUI3dFRCbFp1WGNHKzlNdlNCay9UY0VYZzBRQ1N5NjJB?=
 =?utf-8?B?bGJhb1k2WFRjQ3VVbFh5REY1RWh2Rk85c3Q1cGxidTFVVnQxQno3bU9uaEFM?=
 =?utf-8?B?SWwySDRRUWJQUGkyTkpoOEtVWG1qaUlVVDRYN0JuZzNUQTFsVmthTEI3b3Na?=
 =?utf-8?B?bGxFcWpub3JrbmN0VTRiNGVuVlROdnJrOHdtclUvbXZJZ2EyM3NvOE1UalpE?=
 =?utf-8?B?b29hNlpzUllGY2hHTVBKM2hnL2U5RFQwY2lNNkJKRkRmSFR6Z2NkOHZyYkMw?=
 =?utf-8?B?UGE1U2lVT3NVRWZsd3hWYXpkTVFWUmFJblZ2cTFXSzZDSkNBZy80Y09YcW9n?=
 =?utf-8?B?aHlKUGw4dlczS2pOSGVlNmVTMkhZS0VPbks5KzF2WC9lUTJUREFpN3ZqN0Ez?=
 =?utf-8?B?cFJqYnRsTU50UDBSVjRkVVBlYjhzQ25PQnlaQ1dsSjErMy9DdkkyTXo4NzVH?=
 =?utf-8?B?MkJNWXQwVW83NEx2RG1WSG9CaG1peXF3blE5YXNXRUdGTG9KMk1WOUZlUDk2?=
 =?utf-8?B?TDZrR3BPTEtwMWNkRWpMVW9mQ0NMTWRsWi9yMW9IWTZBZWU3dDhZVmU0dHdB?=
 =?utf-8?B?RzNld3dWUUN1dWJWMHhOb2NRWE54NkZNbEdHV05NeEFVbXRTcjhFOWVacjF2?=
 =?utf-8?B?eEVKdGt1ZkU4TGpMNWhWODB6dHpWV2dMNDFpNDNSeW9hN1NISmNIZEwxRFJ0?=
 =?utf-8?B?RzAwY0l6cEJaY2hONmlSK1VlZ2JtWWtiY2Nyc1VFbG5CYm9veVA5Vks5QklX?=
 =?utf-8?B?SFEyUVdQcWthVDJKWXhIKzNXR1owNm40SGFDN05XRmlWVi9CM3RaRVRodmJy?=
 =?utf-8?B?Q2cvSVpobEViaW1GQSs1ZHpKM0NoaGJQVEpYSUpKL2tUSTVEWGdvbVZsRU5t?=
 =?utf-8?B?NHovVmxKN3pJYmlBWDBwak9WMUl6Z3ZWVXBQdG1odk5yQm1KRFZZUG9ZTnpj?=
 =?utf-8?B?NjJGN3dhc1diODluWEZIQzZLYVNYaGhKc3RnWllqdW9zeUkxOVpWSDk3YlhZ?=
 =?utf-8?B?c25TV3hSZ3phcGt2UDhqNU5RM3pIdjZ3emxkNG53b1pCTWh1QWc3ZVhIQmNp?=
 =?utf-8?B?bGo5c3lEWDNzNEJTcy80Rlo4cEp4UmdxV3JzcXhqK29xQVkrcVdTVDF5SkN2?=
 =?utf-8?Q?IYacIM8I8Rv4USbMb3OojIf+JK9hIPPy?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5249.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MDhkUUJXaHJwVUlTS1RDN2h3R1hoUU54S1p6bHNVTE5ZbmVBdjhjR2ZVTTJI?=
 =?utf-8?B?OURSR2N1TFhIL21iTk1yRHFoaG9xdjJQZSs0bGVsY0VZcDNFWjd1ck02NFI3?=
 =?utf-8?B?d3F0QUxyek5PdjBnN3E5VW13MnowY0d4RlpEWURNeVJPZzEyWElDamNnQWNB?=
 =?utf-8?B?eC8wR0tMeGtadGordVo1Q3R3V2EwT3ZTUEdtc295M1JJYmhlb3RCdlh2WG9h?=
 =?utf-8?B?dW1WSGROamdHUXN1QlgwZUNWMVVkSkRFZnFaWjQyTVVOVXhidG9iUWo3ZVJD?=
 =?utf-8?B?T1B1TTZjeUVsTzE0MGwyTEhaT3ljV0NkdUhxQ3ZRa216OTZEZHVSbUc5aENS?=
 =?utf-8?B?ZFpRTGxKZnRrM3p1UG9hWW0rRzh4RW5NT3V2UStWRVZJUFB3TmFlZmpzUENn?=
 =?utf-8?B?b1RxSDlHMXhlbEdDSThSNndraFVnd2dzYzRXK3g0c2FZRmMreWZrSEZGVDA2?=
 =?utf-8?B?ejJ0VERib3g3MHBWUXA4SGZ1VXhDbU54Q1lRbWdBNmE3WXl6RTNlaEV3UUdI?=
 =?utf-8?B?RHlqV25WZjIrUXpYWnJDZHFWNUkxTFNONER2T2QrV3N5UjFVVmY4MWRzS1V1?=
 =?utf-8?B?bEdyczY2K2NXR3ltL1hpWHZmZkpMM3VuV0R0akxXMGZQSktFU2p0ODArWFBm?=
 =?utf-8?B?Y1U3ajFzaHRBdC9CME9GTVhueEF5VTVBL25TcSt3OWhCdTlsMXdYSEM3ZytM?=
 =?utf-8?B?WUFML1lRT0lVc2syc1VzYTZsalFkSDVsK2dhSzQvbi9mZVJiSTMwa1owb0xx?=
 =?utf-8?B?N0pmTG5RbHBTODhMaFpFTVdmbDVyejZRY0JJUlp0SG1UNFg4OUhCdjdCc0R4?=
 =?utf-8?B?blJId0pmU01BQXBPOGNoR2IyZkMxZWRUQzNpS0FEMmZNZnlmSi91YWpnWnox?=
 =?utf-8?B?TlkzQS9hbVEzVGo3NmpwbnhoZGMvcHRnQTErbnhBNmVMZTV6USt1Mzl0TmY2?=
 =?utf-8?B?MEhkWS9qc3B1WUlERHRuQnBJdjY4dVE3NDNzVVhMeWk1TTQ5Y0U3N3ZkOVR5?=
 =?utf-8?B?RzNUZHZzYm1RY25IMHJDeTNVMndodVY2ZXJXOWlCd1kxZlRINUdRY3BQMVZw?=
 =?utf-8?B?QU5aOVBLYjRkZEE3bkJicFRFM0dCOS93R0NIeHVCaGpSNUJlUGNYaVd2QU9t?=
 =?utf-8?B?MUxyVm9Nckt6eFRkU2J6K00wd09Za3RGQzZwMFVZQTk0WEFCa2FoUnVRdDRm?=
 =?utf-8?B?U3RhUHMyMktpN3d0TUUxRGR0M1lEVndmZktNTVI0and3QXQxNncvakhJenlq?=
 =?utf-8?B?MFpuOTRRVUdvbldUTU5tbUtMWTN5Y2ZyaCt1UGZUcWs1cW5sSnJlN0pidTBR?=
 =?utf-8?B?azU2aW5kOEkydlY1VmhuTWlqZXNOQ0dCNmtNUExyTERaeFJ5d0ZlbERqU1RX?=
 =?utf-8?B?QUtlcVk0UmJjandvVlR5azBVayszT0ZJQSt5b3lXY0NSaVZNVGMwdnZFbU9n?=
 =?utf-8?B?UmFKdy9nM2hWZFNMZDg2RHp0MGo5bU5QUDlRdW9xTnNRdWxYdW5ZVUFqRVVr?=
 =?utf-8?B?TDYxaTZVKy9PUVlKTHpWdWNxcjRSMEdrRE1yUDRacG5lZG9RNHJnQzFWSjYw?=
 =?utf-8?B?ZVI2NUtKNUs4VC9mUEFWMFhiS0VhYzhLbDhYN2lnNlRpMUVuWEdmeDN4SEV6?=
 =?utf-8?B?SnVLRGZrYXV4dFA2MkNEMzlQZXVMVEduemxwVTU4ZXpvMUZvU1lXQVVLaEo4?=
 =?utf-8?B?dEppUTFJUSt4M2c0ZGcveUF5MTBXQVNqMHB5dFNlbVM1R29ZSDg3L2xyNHZ5?=
 =?utf-8?B?OFN0b1ZEWTNhZUhvT1o1NGhEaWt2Qm1pNFIrdnRLOXA1SHA2bEpkYy9pbTF2?=
 =?utf-8?B?dlc5L0JOV3VJY0JmdlFvbTZNQmFrRTkxQWlMWFVicGdXSUxmdVVHSzBCVFFJ?=
 =?utf-8?B?Z3BadFZ0T2FEVVUrVVk3TzRrWGtoT29UMkVDR25Ja3hha2UrNy9LenJhQnhV?=
 =?utf-8?B?d2x5OVM3bGRUcVBkc1ljUnRCRXoyZU9iWkFFdEVKMXF5WXVWWHBLUktYZXpw?=
 =?utf-8?B?cjI3VG9SNDhWZFI4bFJyUlMrZHduUHVEWDNhZUNCbEhLazBoQklkYTdNV0pW?=
 =?utf-8?B?RGVTM0g5cHN1T0k2ZkYxMjBUSnJiTGRNWmw2dVpubTFBc045N0tSejJlYXdI?=
 =?utf-8?B?R0M3TEpKbTk3QSs2Q0RiWXBaTFhSZnZTODRhZ0JmM2dTT3BYNHlwUXBJaEhz?=
 =?utf-8?B?bkVEYTkyMHFEUDViZ2VLa0pEcnFXOFlzelVJVVhnUjlaWlA4eFIwM0lvNXph?=
 =?utf-8?B?R1lkaS8wUzZ1T1hBMlVNdnM5M3ovVkZOMVhGUDJsZnRSdHRMV29DT0tFbnhs?=
 =?utf-8?B?KzZKRlEvYTZhVyttUE1iM3IxVUd1S1pmUkxxdTcwMllMYXd1ZXVUZz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2268a162-bdfc-45ad-0ca1-08de423ae8c4
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5249.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2025 15:49:51.5828 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M50ri+e/nEdSE6qrsYRu5XFyQZNU1KuDrhl9xVKWvKuQO35lCCwfo20jhKphx2BZbY8ssfbnyD5/2m/GVHwi2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6667
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


On 19-12-2025 13:25, Raag Jadav wrote:
> On Tue, Dec 16, 2025 at 05:10:28PM +0530, Karthik Poosa wrote:
>> Expose GPU memory controller average temperature and its limits
>> under temp4_xxx.
>> Update Xe hwmon documentation for this.
>>
>> v2:
>>   - Rephrase commit message. (Badal)
>>   - Update kernel version in Xe hwmon documentation. (Raag)
>>
>> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
>> ---
>>   .../ABI/testing/sysfs-driver-intel-xe-hwmon   | 24 +++++
>>   drivers/gpu/drm/xe/xe_hwmon.c                 | 94 ++++++++++++++++++-
>>   drivers/gpu/drm/xe/xe_pcode_api.h             |  4 +
>>   3 files changed, 118 insertions(+), 4 deletions(-)
>>
>> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
>> index c8f211c336be..81f9b5d58850 100644
>> --- a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
>> +++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
>> @@ -236,3 +236,27 @@ Contact:	intel-xe@lists.freedesktop.org
>>   Description:	RO. VRAM critical temperature in millidegree Celsius.
>>   
>>   		Only supported for particular Intel Xe graphics platforms.
>> +
>> +What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/temp4_input
>> +Date:		December 2025
>> +KernelVersion:	6.19
>> +Contact:	intel-xe@lists.freedesktop.org
>> +Description:	RO. Memory controller average temperature in millidegree Celsius.
>> +
>> +		Only supported for particular Intel Xe graphics platforms.
>> +
>> +What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/temp4_emergency
>> +Date:		December 2025
>> +KernelVersion:	6.19
>> +Contact:	intel-xe@lists.freedesktop.org
>> +Description:	RO. Memory controller shutdown temperature in millidegree Celsius.
>> +
>> +		Only supported for particular Intel Xe graphics platforms.
>> +
>> +What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/temp4_crit
>> +Date:		December 2025
>> +KernelVersion:	6.19
>> +Contact:	intel-xe@lists.freedesktop.org
>> +Description:	RO. Memory controller critical temperature in millidegree Celsius.
>> +
>> +		Only supported for particular Intel Xe graphics platforms.
> Same as patch 1. These attributes defer from ABI definition so not my call.
>
>> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
>> index 66a8c3e40027..6d31ad74cd0e 100644
>> --- a/drivers/gpu/drm/xe/xe_hwmon.c
>> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
>> @@ -43,6 +43,7 @@ enum xe_hwmon_channel {
>>   	CHANNEL_CARD,
>>   	CHANNEL_PKG,
>>   	CHANNEL_VRAM,
>> +	CHANNEL_MCTRL,
>>   	CHANNEL_MAX,
>>   };
>>   
>> @@ -99,6 +100,11 @@ enum sensor_attr_power {
>>    */
>>   #define PL_WRITE_MBX_TIMEOUT_MS	(1)
>>   
>> +/*
>> + * Number of thermal sensors.
>> + */
>> +#define MAX_THERMAL_SENSORS    (255)
>> +
>>   /**
>>    * struct xe_hwmon_energy_info - to accumulate energy
>>    */
>> @@ -129,6 +135,10 @@ struct xe_hwmon_thermal_info {
>>   		/** @data: temperature limits in dwords */
>>   		u32 data[2];
>>   	};
>> +	/** @count: no of temperature sensors */
>> +	u8 count;
>> +	/** @value: value from each sensors S1.7 format. */
>> +	u8 value[MAX_THERMAL_SENSORS];
>>   };
>>   
>>   /**
>> @@ -702,6 +712,7 @@ static const struct hwmon_channel_info * const hwmon_info[] = {
>>   			   HWMON_T_LABEL,
>>   			   HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_EMERGENCY | HWMON_T_CRIT |
>>   			   HWMON_T_MAX,
>> +			   HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_EMERGENCY | HWMON_T_CRIT,
>>   			   HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_EMERGENCY | HWMON_T_CRIT),
>>   	HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_LABEL | HWMON_P_CRIT |
>>   			   HWMON_P_CAP,
>> @@ -717,6 +728,7 @@ static int xe_hwmon_pcode_read_thermal_info(struct xe_hwmon *hwmon)
>>   {
>>   	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
>>   	int ret = 0;
>> +	u32 val = 0;
>>   
>>   	if (!hwmon->xe->info.has_mbx_power_limits)
>>   		return -EOPNOTSUPP;
>> @@ -727,9 +739,54 @@ static int xe_hwmon_pcode_read_thermal_info(struct xe_hwmon *hwmon)
>>   	drm_dbg(&hwmon->xe->drm, "thermal info read ret %d, val 0x%x val1 0x%x\n", ret,
>>   		hwmon->temp.data[0], hwmon->temp.data[1]);
>>   
>> +	/* Read thermal config */
> Comments are usually helpful for something that's not obvious from the code,
> so no need for tautology (and also in all other places where applicable).
will remove this
>
>> +	ret = xe_pcode_read(root_tile, PCODE_MBOX(PCODE_THERMAL_INFO, READ_THERMAL_CONFIG, 0),
>> +			    &val, NULL);
>> +	drm_dbg(&hwmon->xe->drm, "thermal config read ret %d, count %d\n", ret, val);
> This is redundant in error cases because the pcode helper already prints the
> error code and count won't be present.
it will be helpful to know the count during debug
>
>> +	if (ret)
>> +		return ret;
>> +
>> +	hwmon->temp.count = val & TEMP_MASK;
>> +	if (hwmon->temp.count > MAX_THERMAL_SENSORS) {
> How does a u8 variable exceed the value of 255? ...
it is not needed, this can be removed
>
>> +		drm_warn(&hwmon->xe->drm, "thermal config count %d exceeds supported limit %d\n",
>> +			 hwmon->temp.count, MAX_THERMAL_SENSORS);
>> +		ret = -ENOMEM;
> ... and how does it translate to 'out of memory'?

Earlier patch we have allocated memory only for 11 sensors, so we had 
this check,

it is not needed now as we are storing memory for MAX_THERMAL_SENSORS

>
>> +	}
>>   	return ret;
>>   }
>>   
>> +static int get_mc_temp(struct xe_hwmon *hwmon, long *val)
>> +{
>> +	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
>> +	int ret = 0, i = 0;
>> +
>> +	for (i = 0; i < (hwmon->temp.count / 4); i++) {
> Magic 4.
sizeof(u32), will change this
>
>> +		/* Read thermal data */
>> +		ret = xe_pcode_read(root_tile, PCODE_MBOX(PCODE_THERMAL_INFO, READ_THERMAL_DATA, i),
>> +				    (uint32_t *)&hwmon->temp.value[i * 4], NULL);
> Let's not solve a problem that doesn't exist and try to work without
> a cast.
>
>> +		drm_dbg(&hwmon->xe->drm, "thermal data for group %d ret %d, val 0x%x\n", i, ret,
>> +			(u32)hwmon->temp.value[i * 4]);
> Ditto. And you're using both uint32_t and u32, make it consistent.
ok
>
>> +		if (ret)
>> +			return ret;
>> +	}
>> +	if (hwmon->temp.count % 4) {
>> +		ret = xe_pcode_read(root_tile, PCODE_MBOX(PCODE_THERMAL_INFO, READ_THERMAL_DATA, i),
>> +				    (uint32_t *)&hwmon->temp.value[i * 4], NULL);
> Ditto.
>
>> +		drm_dbg(&hwmon->xe->drm, "thermal data for group %d ret %d, val 0x%x\n", i, ret,
>> +			(u32)hwmon->temp.value[i * 4]);
> Ditto.
>
>> +		if (ret)
>> +			return ret;
>> +	}
>> +
>> +	*val = 0;
>> +	for (i = TEMP_INDEX_MCTRL; i < hwmon->temp.count; i++) {
>> +		*val += (hwmon->temp.value[i] & TEMP_MASK_MAILBOX) *
>> +			((hwmon->temp.value[i] & 0x80) ? -1 : 1);
> Now, this is something that needs an explanation but doesn't have it ...
Signed for S1.7, bit 7 for sign, 6:0 for value, adding comment in next 
revision
>
>> +	}
>> +	*val = (*val / hwmon->temp.count) * MILLIDEGREE_PER_DEGREE;
> ... and the math is independent of the assignment so let's do them
> separately.
okay
>
>> +	return 0;
>> +}
>> +
>>   /* I1 is exposed as power_crit or as curr_crit depending on bit 31 */
>>   static int xe_hwmon_pcode_read_i1(const struct xe_hwmon *hwmon, u32 *uval)
>>   {
>> @@ -827,6 +884,8 @@ static void xe_hwmon_get_voltage(struct xe_hwmon *hwmon, int channel, long *valu
>>   static umode_t
>>   xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
>>   {
>> +	long val = 0;
>> +
>>   	switch (attr) {
>>   	case hwmon_temp_emergency:
>>   		switch (channel) {
>> @@ -834,6 +893,8 @@ xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
>>   			return hwmon->temp.limit[TEMP_LIMIT_PKG_SHUTDOWN] ? 0444 : 0;
>>   		case CHANNEL_VRAM:
>>   			return hwmon->temp.limit[TEMP_LIMIT_MEM_SHUTDOWN] ? 0444 : 0;
>> +		case CHANNEL_MCTRL:
>> +			return (!get_mc_temp(hwmon, &val)) ? 0444 : 0;
> Do we really need to read it all here?
we can make visible based on hwmon->temp.count > 0
>
>>   		default:
>>   			return 0;
>>   		}
>> @@ -844,6 +905,8 @@ xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
>>   			return hwmon->temp.limit[TEMP_LIMIT_PKG_TJMAX] ? 0444 : 0;
>>   		case CHANNEL_VRAM:
>>   			return hwmon->temp.limit[TEMP_LIMIT_MEM_TJMAX] ? 0444 : 0;
>> +		case CHANNEL_MCTRL:
>> +			return (!get_mc_temp(hwmon, &val)) ? 0444 : 0;
> Ditto.
>
>>   		default:
>>   			return 0;
>>   		}
>> @@ -858,7 +921,16 @@ xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
>>   		break;
>>   	case hwmon_temp_input:
>>   	case hwmon_temp_label:
>> -		return xe_reg_is_valid(xe_hwmon_get_reg(hwmon, REG_TEMP, channel)) ? 0444 : 0;
>> +		switch (channel) {
>> +		case CHANNEL_PKG:
>> +		case CHANNEL_VRAM:
>> +			return xe_reg_is_valid(xe_hwmon_get_reg(hwmon, REG_TEMP,
>> +					       channel)) ? 0444 : 0;
>> +		case CHANNEL_MCTRL:
>> +			return (!get_mc_temp(hwmon, &val)) ? 0444 : 0;
> Ditto.
>
>> +		default:
>> +			return 0;
>> +		}
>>   	default:
>>   		return 0;
>>   	}
>> @@ -872,10 +944,20 @@ xe_hwmon_temp_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
>>   
>>   	switch (attr) {
>>   	case hwmon_temp_input:
>> -		reg_val = xe_mmio_read32(mmio, xe_hwmon_get_reg(hwmon, REG_TEMP, channel));
>> +		switch (channel) {
>> +		case CHANNEL_PKG:
>> +		case CHANNEL_VRAM:
>> +			reg_val = xe_mmio_read32(mmio, xe_hwmon_get_reg(hwmon, REG_TEMP, channel));
>>   
>> -		/* HW register value is in degrees Celsius, convert to millidegrees. */
>> -		*val = REG_FIELD_GET(TEMP_MASK, reg_val) * MILLIDEGREE_PER_DEGREE;
>> +			/* HW register value is in degrees Celsius, convert to millidegrees. */
>> +			*val = REG_FIELD_GET(TEMP_MASK, reg_val) * MILLIDEGREE_PER_DEGREE;
>> +			break;
>> +		case CHANNEL_MCTRL:
>> +			return get_mc_temp(hwmon, val);
>> +		default:
>> +			*val = 0;
> Do you need this?
incase *val is garbage this shall make this 0
>
>> +			return -EOPNOTSUPP;
>> +		}
>>   		break;
>>   	case hwmon_temp_emergency:
>>   		switch (channel) {
>> @@ -883,6 +965,7 @@ xe_hwmon_temp_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
>>   			*val = hwmon->temp.limit[TEMP_LIMIT_PKG_SHUTDOWN] * MILLIDEGREE_PER_DEGREE;
>>   			break;
>>   		case CHANNEL_VRAM:
>> +		case CHANNEL_MCTRL:
>>   			*val = hwmon->temp.limit[TEMP_LIMIT_MEM_SHUTDOWN] * MILLIDEGREE_PER_DEGREE;
>>   			break;
>>   		default:
>> @@ -896,6 +979,7 @@ xe_hwmon_temp_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
>>   			*val = hwmon->temp.limit[TEMP_LIMIT_PKG_TJMAX] * MILLIDEGREE_PER_DEGREE;
>>   			break;
>>   		case CHANNEL_VRAM:
>> +		case CHANNEL_MCTRL:
>>   			*val = hwmon->temp.limit[TEMP_LIMIT_MEM_TJMAX] * MILLIDEGREE_PER_DEGREE;
>>   			break;
>>   		default:
>> @@ -1274,6 +1358,8 @@ static int xe_hwmon_read_label(struct device *dev,
>>   			*str = "pkg";
>>   		else if (channel == CHANNEL_VRAM)
>>   			*str = "vram";
>> +		else if (channel == CHANNEL_MCTRL)
>> +			*str = "mctrl_avg";
> The rest of the channels also signify the average so no need to spell
> it out.
>
> Raag
ok
>
>>   		return 0;
>>   	case hwmon_power:
>>   	case hwmon_energy:
>> diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
>> index a3bff76a074d..91e232834482 100644
>> --- a/drivers/gpu/drm/xe/xe_pcode_api.h
>> +++ b/drivers/gpu/drm/xe/xe_pcode_api.h
>> @@ -67,6 +67,10 @@
>>   
>>   #define	PCODE_THERMAL_INFO			0x25
>>   #define	READ_THERMAL_LIMITS			0x0
>> +#define	READ_THERMAL_CONFIG			0x1
>> +#define	READ_THERMAL_DATA			0x2
>> +#define TEMP_MASK_MAILBOX			REG_GENMASK8(6, 0)
>> +#define TEMP_INDEX_MCTRL			0x2
>>   
>>   #define   PCODE_FREQUENCY_CONFIG		0x6e
>>   /* Frequency Config Sub Commands (param1) */
>> -- 
>> 2.25.1
>>
