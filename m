Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60AF9CCFA1A
	for <intel-xe@archiver.kernel.org>; Thu, 26 Sep 2024 11:43:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E8DD10EAEA;
	Thu, 26 Sep 2024 11:43:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aDfkJu+S";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5210210EAEA
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Sep 2024 11:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727351028; x=1758887028;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=XKc2bhr5rneGCd+IDccqyBiQEn/CHNrTy2MOI6Lx+hc=;
 b=aDfkJu+SRPRNMXn7BL4yuIeGzgSIOxg7X7k0QfFB55A/tUb/pPwJDCkP
 6m4n8LAwgHsBr40V58CRPAfujclVzMScSo5pu+6SWdxrVmcxiXgeMdptc
 ZAIHqcHj09tvpt+2TnSPy5rBYG4Ocyua74dWfhoI0a5Dk/wnF4lQNwG2J
 ayX3GDryJkCA6LnqRouuQLr0qbJpEmiF9yB6Pyxunci4gAkbut60q/xeQ
 2eRNbbNo+RzryUuexDczxywow5LkVH1uYqEAKFEOTz+TSzq/G3skkBrnl
 TFu9lcNFS5d9XwW/vSEf6A7z4z7JqumAg2URh2kA9B21u8qbYxrLILZ/i g==;
X-CSE-ConnectionGUID: UddoScEPR9S1lPVZ1yqAEQ==
X-CSE-MsgGUID: 1cL1Pha5T3+ZatlrEihBOA==
X-IronPort-AV: E=McAfee;i="6700,10204,11206"; a="25910183"
X-IronPort-AV: E=Sophos;i="6.11,155,1725346800"; d="scan'208";a="25910183"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2024 04:43:48 -0700
X-CSE-ConnectionGUID: zFp1eM+QSgK/sfqxwTRTow==
X-CSE-MsgGUID: 5uv/xHc+Q9Oh0fL1fZRRZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,155,1725346800"; d="scan'208";a="72566932"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Sep 2024 04:43:47 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 26 Sep 2024 04:43:47 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 26 Sep 2024 04:43:47 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 26 Sep 2024 04:43:46 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 26 Sep 2024 04:43:46 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 26 Sep 2024 04:43:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wZUF2IHstj2dExv/+T4emdXRbqjFKUIVVLPjYL2GvoH/l+mnYLat3xSMwbBLSMBlLVatTAFy1SqKeNE7/K5Uunnf4Pf9DHRsab2Vm40yYikdwFdWjVf5hvtRdD27nksW4FAfHy5JIR1vy+I9Yt3EZp+8R9CPEuSqwmhXIyfQRBoLQnOkEncKMnIG/OE4UAeaFTE5ZR+IbSCtTZKwCi2jfbWH7saUCGyTrFEkO2qJnprxPKTa4c5IdyHKgyFdxKVn2hF1wfF/zuqCS7MHIctGQECiwZNv9B0+yn3jgA7mg3HO0iLPrWt12jKpH0W5VNqvmYMM6GCpXz9f1QAwY1YqBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=49mMOJmqKYyTwGRpw3xrVUN3ccj0S9FajV85MF1eF90=;
 b=fE91Odm4O/bVPsBVdGkI/HJ+yoDqdI29es6mqNiznub7LSqIPfxkgg9kcNiqMkOm8idGrX4k6rcCk2SpgcSH1pbBGZGJGeX9JuW37EuY8GJf3lcHrTHbgZmBobW5DFMpYAhd8GlE3LShC70DUze8hCeg0pMj9ZLCbcgojGJwChEzFNT4zmw6pL0OthKzQFW9/fYJ0a8eolMgs/VZDrg0q5y/OQrs5zvrzE7Ga9cnmd0+TRgWbCrD/+SaRu1raJo0aShzMeKwREfGf7ILeoQlYBLv6mYlvd+DnOCITTbj71qMqRbMB1+X0Qt++OSHkiVkMQJv9DFOQZHCf8sMxnfedA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by DM4PR11MB5970.namprd11.prod.outlook.com (2603:10b6:8:5d::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7982.25; Thu, 26 Sep 2024 11:43:42 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%4]) with mapi id 15.20.7982.022; Thu, 26 Sep 2024
 11:43:42 +0000
Message-ID: <22a894ad-60f8-4ece-8874-7ac695dd4793@intel.com>
Date: Thu, 26 Sep 2024 17:13:36 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 01/23] drm/xe: Error handling in xe_force_wake_get()
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Badal Nilawar <badal.nilawar@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>, "Nirmoy
 Das" <nirmoy.das@intel.com>
References: <20240924121641.1045763-1-himal.prasad.ghimiray@intel.com>
 <20240924121641.1045763-2-himal.prasad.ghimiray@intel.com>
 <f10c3f76-aac8-441f-80c1-c7e2632136f6@intel.com>
 <337515e5-83f8-4969-bc79-f1d380a31330@intel.com>
 <8b045c35-95bc-4977-840e-067c2abbcd10@intel.com>
 <b7102aa2-4a5a-4928-acf9-0384ad983fb4@intel.com>
 <fe52746a-9395-4392-a96a-6caeb4a49597@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <fe52746a-9395-4392-a96a-6caeb4a49597@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MAXPR01CA0116.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::34) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|DM4PR11MB5970:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d951a9e-0585-4ef4-2cfa-08dcde20787a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SDBrb3lUNGMyRThNYTBPazR5bWliRzdpOGRORWlaTkhPci9yRnN5clFnSmxi?=
 =?utf-8?B?MklWNG5UZkdLekRVV1A5eXdSbVNsaW5SbXd0ZmRBZm9pS3Irbzk5NnQ4Sm9q?=
 =?utf-8?B?NUhNZjJVMTZEaXNwWUYyQnFMRUE3UmVwTlowTmtOYy9kVjF4WFBJL3o1VE5t?=
 =?utf-8?B?Y3d5R0tyeGlhU3VJVy9XQmdLMXdqTjhMZUxyNE9lNHQrN2lGTFlkUE0vU0U5?=
 =?utf-8?B?YUR3SVIwcUEvTVVOcnd6NENCaUl3bzgrQngraEd0RkFCZDU4Y0RiOG5ZZnpl?=
 =?utf-8?B?cXdZSEU5bHNiS1k3N1MrSjFHOTJ5Wm5IcUdiMmdsVmFoZmdkUHRGdkpFUVFa?=
 =?utf-8?B?OGVQMGZ6OEw2eGUrdm5uWVBtL3FXb09STGJWamcySStIV3N2R3pTL2ovOWdP?=
 =?utf-8?B?NGJocUltQWVndjJ6SzcvV0ZJcUhWRlVHck0xWEdJQWdya2s1Z0tDOGNsSFA5?=
 =?utf-8?B?TWVYM3p2RDRhcC9TSXN0UDdDN25jS0ZleVRWbUVjOFkvU2lmOEwrczNhYUdE?=
 =?utf-8?B?b2pYYWE5eHhXdmNLbnZkMUh1U25YVm8wMzNNRTNjT1BvWU1VK1g2SzhQbUVq?=
 =?utf-8?B?cFI0OVVvMkdadmZKdURNb3JoRFNUUGpPa1BXYkozRmRDL1hBc3crS3pEWU92?=
 =?utf-8?B?Z0tEOU5aN1BTdEJjdjUrQWd5dWJTdkx1WmFFbzNwNXFlUkhhOCt3M3VwWUJI?=
 =?utf-8?B?QzdYRlhYWWxXRnByWVVhbWpJQmVCWTl2ZnFBLzhoWEFGclpYWUl5REFJYWZy?=
 =?utf-8?B?N0JiQlVjMUpzOVhHd0ZpZWF5TWRJMnRlRk5VKy9oTW1HNWxNM0RTSk5ZN2s4?=
 =?utf-8?B?RDlJTXN6WVppL3lYVjJXWW5BMkU4VkxQaHN6eElPekl4R1QxTmtPblgrWU5Z?=
 =?utf-8?B?Z0xMd2RDOU1Rcm5acHJXekcvRDl5YllEMkwxeWFWamFoVVZsbE1Zc3pLdWpE?=
 =?utf-8?B?TWwrdGhmbjEvanRmR256WnFJeGtLSW5UYTFTQzhGMHlUQzJIOUp6QllUK29K?=
 =?utf-8?B?UWZWZ1g3QmMvTFdITFAwSjJSTmFIM21uM1hVcGkrR0V0UGhOdW5rWWpVQW1Q?=
 =?utf-8?B?VE9XV0R0WDBaSkx1S1dBeHJoWUhDb1F4Rnl4bmN6NzdyTlM2VDhBeFhMQWFU?=
 =?utf-8?B?WFEvMkxkZWdhV2srcXA1MzhOaURHZDc4WTZWc1cwbE5VMnRTY3M4TlA4WDJL?=
 =?utf-8?B?YnluaXBYVFIvcjlqbUQyc0RIdnRua3JpQWxBTjN2ZFZXY1ZRajl3NHNrOEZq?=
 =?utf-8?B?RUo2RVZwRkoyVVVBNkNwcXpacGJDUnlHemdmL29KdFZlRFU5WlpVRnFhY1k2?=
 =?utf-8?B?cWtkbUtxbXoxTkdIbmZEcHQ3TVg3OVo1WGE1cklDNGRRNW5tR0xURC8xcEpp?=
 =?utf-8?B?c0o4Q1hVQVBMV0M1NWdRN3l6OTVrZ1ZyWFFtU1pEV2tqK09iMDRhVS9PUzNv?=
 =?utf-8?B?YjBoS3JRVmJ0Si9wQkIvUXhMSGs5L0NUUi9hSXdFRE9VS01XUTZDZjdIc3NG?=
 =?utf-8?B?ajd5NFp6MkN4QlUxSmdaT2xWMmJ5WFpDSXo0c3RMQTA4QjRhRmtBTHFXQlJM?=
 =?utf-8?B?aEJ3SUNHa0dzRHdDWTRuaDl3MEdEdXIycFE0Q1ZlZDlaN1Z1c0kxREIwTDFp?=
 =?utf-8?B?WDRaR2RyL1BRa3JiWUlId215K3QzK1B3UHRTNlNRS05Rb3Z1ZTZ0aHlxc0sz?=
 =?utf-8?B?cElvaWRnemd1eDFIdEs0V2ZoNXhRMzB2WVlabmVHL3k2aVhLdE1ycHFpTWw5?=
 =?utf-8?B?UU1KUE5FR0NIT3lRUjhJcTJQTnVKU3pONkZhbXladEU0cm9LL0h6Zm83c2lx?=
 =?utf-8?B?Y3lEeUZtM2VVNVkyUC9Pdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SW1UcStWRTFYREEyaUZmZVpWbDVueEQxK2V2MHY0OWNLUjB2OVhZdmFIT05a?=
 =?utf-8?B?Y0lmOWNmR2p6NldwWG5KUUltM3FRZTRZNzlaMEpPdForU0J4RUY4Y1kyMGhX?=
 =?utf-8?B?SU9IMi8zd0NoS1dTOEd1cXV2YzhVd05tRDZ3WXZKbkIweXNwVGdFLytGUVVN?=
 =?utf-8?B?OGFBSm55UC95OVFCUi91UnJuVmJrNTYyVVM0c1k4NnVWekV5VmkzdXp1SFNk?=
 =?utf-8?B?cFo4dGdNMUdVdU0vRlU1eGt5dE9scHVvSmpUVG15YittTENjM2o4aTNzNFlp?=
 =?utf-8?B?TDBIYlBKWU5VN05nVmExc3Q5dGQwRlNRdmg5UndGclBMRi9FdEIvT0EwajJr?=
 =?utf-8?B?WFNEc25VUmRRN24zZzFaSktVdGxDU2t4djdtdzN3SGVCOXJ3c2p1SFozN0FF?=
 =?utf-8?B?ZlFsZEtUeFdWN0oyRXZ0RVlZdGs2SE1LMUY0QkQyNXdRZy9VRm9PaFFMSVZP?=
 =?utf-8?B?QmppODk4TDYzTlptNEJ5VjZQYmJoTWxVOWVrN1ZJTTFOZ0UvQXk0WFRXUW5x?=
 =?utf-8?B?Qk9kdVEyQmZMTE4rc1R0M3F0ZkFYUGhHZ2JHdFhHcEhDTDVUdm91YWo2cnBk?=
 =?utf-8?B?VnFzVHpLODFTcmlPYk9lWk1SZjR5MUZnQlFrVjJYS0p6OWJPWGJ6VnJWMWRB?=
 =?utf-8?B?MjRYN20xWEc1OFJQL2kyMlZQajN2SlorMzNiMXowQm9yTko0Z1RwZ1E3K3Uv?=
 =?utf-8?B?Y3ZtTHVYNkpaRTNHVDl5NCtEWWhTN3RZbkNCR0xQZVlUY2hNL0hqaU0rUFhl?=
 =?utf-8?B?TzNJMU9mTjVzRnlIbGZ3ZEZOV3FHRjJJY1VIVWM4NkJMR0xSb2NPRUJ6SDcz?=
 =?utf-8?B?Sm9naE0rMm5CSEQ2K3NmaHpjYnJhc2MrRFpDK2xqZUpSL2lZWDVmT0RINTMr?=
 =?utf-8?B?N2ZXNmE0S3ZSdEdyelYvcVlPUnh0ck5ZYklncHROM3d3L2F2WWl4dGkzRzRZ?=
 =?utf-8?B?d3JiSWpJTzl3MVk4cUI2MndSRHVaR3V0eXZlcG4xMXJJc2ZXZk1FKzJ0YTR1?=
 =?utf-8?B?bEZackJNcWoxa09EUGdKV3JxKzNDbmwrWHhVZmlJbEV2TEt1TkNuVzk2R1Jo?=
 =?utf-8?B?cFBtaG5oaFdPaE1JdmhtQXpjU1Y1K1NsaVo1N1VrWkd0VmUweHBUWlg3UDlq?=
 =?utf-8?B?L0VicUovalhqcVBEOWRBdzErU3A4NWxXdFprdEpFSFBKUDZEQ3lzRVpLR3VH?=
 =?utf-8?B?SmhKdVJDZEhzWE8yNXRjUUF0M012ZFFUWmtkZDg3b2NXL0ZmZ2M1YVcvRDN3?=
 =?utf-8?B?Ym5BaWpiLzZIUTNoUGo0ZVZ1UWRFMUFRQU5hbnBNL2t6dWRKZ1dORjJsK2ti?=
 =?utf-8?B?SFpmQ0YyMEdBSHU1V2FZV2tXczdQUjd4aHNTaDU1NmJhVXBFV3d1NGdYblJW?=
 =?utf-8?B?NWJuN1VDSGNIYlFXcFFyK3FXckVoaHhQNVhsN3lxemd0RGd1MXQyWWRXMTRB?=
 =?utf-8?B?OCtPbGM4TmcrWkJNT0tnM3BXMHVONTlyaU9LWWdUMGVDSlRjWE4zajRRVFRI?=
 =?utf-8?B?a1FGMFhzQU1YREV6UE4rQ0dDMWxZczArd25iM1FVTndNS3RtbytlcHljdmdi?=
 =?utf-8?B?MkE1SFVsTko2MlJmaFhIUW5SZVBobHAvME11VFhpMGlpWWw2bFIweFdsVlY4?=
 =?utf-8?B?aGg1aGo0bFFFcEpzcW81VkdmSzl3MnFFVFM5cVFCc3lsTGJYejZhUjFBY212?=
 =?utf-8?B?K3ZCN1d0eGw2TVMvaWFpR0xRVGxBeXZXWHgwL1ZqcEFvRGxEcnRIZUc5cTJy?=
 =?utf-8?B?NFhkcVNUZG5IOEp0K2ovZ3M2QjJEWXpRZ2xZVG5sS01ZcFV1TmFjaVhjbTZr?=
 =?utf-8?B?RXp4Q2VVTTZlOGo1REdjWVpMaEhRRE5zRzdSZXgrYVBScUI3NEZERStuQS9Z?=
 =?utf-8?B?Q0IxQmxoQVpEUGowQXpKTGxXTktkWTRDT1krQklVN28zQlcxRnBvR1E1T3dL?=
 =?utf-8?B?TFhibzRxZmFZcjlLcjdpSmwrZ0RnSmxUQ2hGMC9PbUNBN2o2MjJDSFpTa3Bx?=
 =?utf-8?B?N3hYZGo3cE9lWFl3OU56bWFyVVBidkhnNUwrbkVHQ1haWVZ4TFoxVmFJMGU2?=
 =?utf-8?B?TWowVkZlQnVscDdwdWU0Qy83WnI0cFFMTHpBbjhWWUZkTWcvNHRMb1Axd1ho?=
 =?utf-8?B?ajBvU2NoMFVQZWVWWjRuc2I3V0loTDIrK2dITkRQbjZkM1F1ZG5LcHF6NDg0?=
 =?utf-8?Q?Uo/OHFZBaeS60/1lH2n8tZ8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d951a9e-0585-4ef4-2cfa-08dcde20787a
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2024 11:43:42.3907 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mwuRvdzaQbPrq7YlGnQMhe1Ik3BkxMJCFCa1KMIlImmNThi4tJ5cyax/zxMc6bklr5AXYGqlrFuPbCNLulC9G/wnkh4exiSwdpBbtrC1Hhg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5970
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



On 26-09-2024 16:33, Michal Wajdeczko wrote:
> 
> 
> On 25.09.2024 20:14, Ghimiray, Himal Prasad wrote:
>>
>>
>> On 25-09-2024 22:50, Michal Wajdeczko wrote:
>>>
>>>
>>> On 25.09.2024 18:36, Ghimiray, Himal Prasad wrote:
>>>>
>>>>
>>>> On 25-09-2024 17:31, Michal Wajdeczko wrote:
>>>>>
>>>>>
>>>>> On 24.09.2024 14:16, Himal Prasad Ghimiray wrote:
>>>>>> If an acknowledgment timeout occurs for a domain awake request, do not
>>>>>> increment the reference count for the domain. This ensures that
>>>>>> subsequent _get calls do not incorrectly assume the domain is
>>>>>> awake. The
>>>>>> return value is a mask of domains whose reference counts were
>>>>>> incremented, and these domains need to be released using
>>>>>> xe_force_wake_put.
>>>>>>
>>>>>> The caller needs to compare the return value with the input domains to
>>>>>> determine the success or failure of the operation and decide
>>>>>> whether to
>>>>>> continue or return accordingly.
>>>>>>
>>>>>> While at it, add simple kernel-doc for xe_force_wake_get()
>>>>>>
>>>>>> v3
>>>>>> - Use explicit type for mask (Michal/Badal)
>>>>>> - Improve kernel-doc (Michal)
>>>>>> - Use unsigned int instead of abusing enum (Michal)
>>>>>>
>>>>>> v5
>>>>>> - Use unsigned int for return (MattB/Badal/Rodrigo)
>>>>>> - use xe_gt_WARN for domain awake ack failure (Badal/Rodrigo)
>>>>>>
>>>>>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>>>>> Cc: Badal Nilawar <badal.nilawar@intel.com>
>>>>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>>>>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>>>>> Cc: Nirmoy Das <nirmoy.das@intel.com>
>>>>>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>>>>>> ---
>>>>>>     drivers/gpu/drm/xe/xe_force_wake.c | 37 ++++++++++++++++++++++
>>>>>> +-------
>>>>>>     drivers/gpu/drm/xe/xe_force_wake.h |  4 ++--
>>>>>>     2 files changed, 31 insertions(+), 10 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/
>>>>>> xe_force_wake.c
>>>>>> index a64c14757c84..d190aa93be90 100644
>>>>>> --- a/drivers/gpu/drm/xe/xe_force_wake.c
>>>>>> +++ b/drivers/gpu/drm/xe/xe_force_wake.c
>>>>>> @@ -150,28 +150,49 @@ static int domain_sleep_wait(struct xe_gt *gt,
>>>>>>                          (ffs(tmp__) - 1))) && \
>>>>>>                          domain__->reg_ctl.addr)
>>>>>>     -int xe_force_wake_get(struct xe_force_wake *fw,
>>>>>> -              enum xe_force_wake_domains domains)
>>>>>> +/**
>>>>>> + * xe_force_wake_get() : Increase the domain refcount
>>>>>> + * @fw: struct xe_force_wake
>>>>>> + * @domains: forcewake domains to get refcount on
>>>>>> + *
>>>>>> + * This function takes references for the input @domains and wakes
>>>>>> them if
>>>>>> + * they are asleep.
>>>>>
>>>>> nit: likely we should also add the note that one shall call the
>>>>> xe_force_wake_put() function to decrease refcounts
>>>>
>>>> Sure.
>>>>
>>>>>
>>>>>> + *
>>>>>> + * Return: mask of refcount increased domains.
>>>>>
>>>>> do we really need to expose implementation detail to the caller?
>>>>>
>>>>> can't we just treat the returned value as opaque data that just
>>>>> needs to
>>>>> be passed to the matching xe_force_wake_put(fw, ref) call ?
>>>>>
>>>>>> If the return value is
>>>>>> + * equal to the input parameter @domains, the operation is considered
>>>>>> + * successful.
>>>>>
>>>>> sorry, but I'm still little uncomfortable with such approach, due to a
>>>>> mismatch between input parameter type that is enum
>>>>> xe_force_wake_domains
>>>>> and return type which is unsigned int, as IMO forcing the user to
>>>>> compare two different types seems wrong
>>>>
>>>> Sure, I understand the thought process behind it. Will a helper to do it
>>>> is OK. Justifying below for the helper.
>>>>
>>>>>
>>>>> can't we just say that if returned value is zero then no domains were
>>>>> waken (which would provide definite answer if single domain was
>>>>> requested) ?
>>>>
>>>> I am concerned  about the scenario, where user ends up considering non
>>>> zero return of FORCEWAKE_ALL as success.
>>>
>>> while user can always do something wrong, note that in above statement
>>> we didn't say that _all_ requested domains were awake if ref != 0
>>>
>>>>
>>>> Having multiple success or failure condition for same API, based on
>>>> input parameter looks bad design to me.
>>>
>>> it's not multiple, in fact it is unified:
>>>
>>> 1) ALL_DOMAINS
>>>
>>>      ref = xe_force_wake_get(fw, ALL_DOMAINS)
>>>      if (!ref)
>>>          return -EIO
>>>
>>>      // explicit check
>>>      if (xe_force_wake_is_awake(fw, SINGLE_DOMAIN))
>>>          ...
>>>
>>>      xe_force_wake_put(fw, ref)
>>>
>>>
>>> 2a) SINGLE_DOMAIN
>>>
>>>      ref = xe_force_wake_get(fw, SINGLE_DOMAIN)
>>>      if (!ref)
>>>          return -EIO
>>>
>>>      // explicit check
>>>      if (xe_force_wake_is_awake(fw, SINGLE_DOMAIN))
>>>          ...
>>>
>>>      xe_force_wake_put(fw, ref)
>>>
>>>
>>> and what we did is just optimization for SINGLE_DOMAIN
>>>
>>> 2b) SINGLE_DOMAIN
>>>
>>>      ref = xe_force_wake_get(fw, SINGLE_DOMAIN)
>>>      if (!ref)
>>>          return -EIO
>>>
>>>      BUG_ON(!xe_force_wake_is_awake(fw, SINGLE_DOMAIN))
>>>
>>>      xe_force_wake_put(fw, ref)
>>>
>>>>
>>>> ref = xe_force_wake_get(fw, GT)
>>>> if (ref) -> means success condn
>>>>
>>>> whereas
>>>>
>>>> ref = xe_force_wake_put(fw, ALL)
>>>> if (ref) -> doesn't necessarily means successfully awakened all domain.
>>>>
>>>> User can very easily interpret it wrongly:
>>>> ref = xe_force_wake_get(fw, ALL)
>>>> if(!ref)
>>>>       error_handling;
>>>>
>>>> /* Irrespective of failure or success of xe_force_wake_get code reaches
>>>> here */
>>>> do_multiple_operations(); /* Needed all fw domains supported on GT to be
>>>> awake */
>>>>
>>>> xe_force_wake_put(fw, ref);
>>>>
>>>> We have use-cases throughout the driver where user relies on success/
>>>> failure for FORCEWAKE_ALL domains.
>>>
>>> maybe for more consistent API we should have two functions:
>>>
>>> a) pass only if _all_ domains are awake
>>>
>>>      ref = xe_force_wake_get(fw, ALL_DOMAINS)
>>>      if (!ref)
>>>          return -EIO
>>>
>>>      // no need for explicit checks
>>>      BUG_ON(!xe_force_wake_is_awake(fw, FOO_DOMAIN))
>>>      BUG_ON(!xe_force_wake_is_awake(fw, BAR_DOMAIN))
>>>      ...
>>>
>>>      xe_force_wake_put(fw, ref)
>>>
>>> b) fails only if _all_ domains are not awake
>>>
>>>      ref = xe_force_wake_get(fw, ALL_DOMAINS)
>>>      if (!ref)
>>>          return -EIO
>>>
>>>      // must do explicit checks
>>>      if (xe_force_wake_is_awake(fw, SINGLE_DOMAIN))
>>>          ...
>>>
>>>      xe_force_wake_put(fw, ref)
>>>>
>>>>>
>>>>> and for the xe_force_wake_get(fw, ALL_DOMAINS) case, we can provide
>>>>> helper function that will check if specified domain is really awake:
>>>>>
>>>>>       ref = xe_force_wake_put(fw, ALL_DOMAIN)
>>>>>
>>>>>       if (ref) {
>>>>>           xe_force_wake_is_awake(fw, SINGLE_DOMAIN)
>>>>
>>>>
>>>> I assume this API is to check whether ref has domain in it or not. Will
>>>> be good helper to have for such scenarios, Which are currently not there
>>>> in driver.
>>>
>>> there could be two variants, one that checks fw
>>>
>>>      xe_force_wake_is_awake(fw, SINGLE_DOMAIN)
>>>
>>> other that checks ref
>>>
>>>      xe_force_wake_ref_has_domain(ref, SINGLE_DOMAIN)
>>>
>>> but the only benefit from the latter is that it could be lightweight as
>>> otherwise
>>>
>>>      BUG_ON(xe_force_wake_is_awake(fw, SINGLE_DOMAIN) ^
>>>             xe_force_wake_ref_has_domain(ref, SINGLE_DOMAIN))
>>>
>>>>
>>>>
>>>>>
>>>>>           xe_force_wake_put(fw, ref)
>>>>>       }
>>>>>
>>>>
>>>> I believe a helper to determine success or failure of force_wake_get,
>>>> instead of caller doing it will streamline all the domains and usecases.
>>>>
>>>> int xe_force_wake_get_status(enum domain, unsigned int fw_ref)
>>>> {
>>>>     return  (fw_ref == domain) ? 0 : -ETIMEDOUT;
>>>> }
>>>
>>> I'm not sure we should provide error code, IMO simple bool function will
>>> better and caller can decide what to do next
>>
>>
>> -ETIMEDOUT is the actual error code for domain awake acknowledgment
>> failure that is why I added it. I am fine with bool and letting caller
>> decide.
>>
>> Thinking more about it, better not to have xe_force_wake_is_awake and
>> rely on xe_force_wake_ref_has_domain.
> 
> but nested functions like do_operations() may not have access to the
> fw_ref, so we should still allow to check domain status without the ref
> 

That is true, In that case isn't it always safe to call another 
xe_force_wake_get/put instead of creating helper like 
xe_force_wake_is_awake(which is guaranteed to be unsafe in nested 
functions) ?

>> fw->awake_domain is global state and could be awaken from anywhere
>> doesn't guarantee it is awaken by current force_wake_get(). Can be a
>> misused.
> 
> true, so lets just define two helpers to cover all use cases:
> 
> bool xe_force_wake_ref_has_domain(unsigned int fw_ref, enum domain)
> bool xe_force_wake_is_awake(struct xe_fw *fw, enum domain)

I find this helper risky, but if you insist will go ahead with it.

> 
>>
>> Since you recommended using bool. How about ?
>>
>> bool xe_force_wake_ref_has_domain(enum domain, unsigned int fw_ref)
>> { return (fw_ref & domain == domain) ?  true : false ;
>> }
> 
> you don't need ternary operator and fw_ref should be first:

Sure. Makes sense.

> 
> bool xe_force_wake_ref_has_domain(unsigned int fw_ref, enum domain)
> 
>>
>> works for all scenario:
>>
>> ref = xe_force_wake_get(fw, SINGLE)
>> if(!xe_force_wake_ref_has_domain(SINGLE, ref)) -> failure
>>
>>
>> ref = xe_force_wake_get(fw, ALL)
>> !xe_force_wake_ref_has_domain(ALL, ref) -> failure
>>
>> ref = xe_force_wake_get(fw, ALL)
>> if(!xe_force_wake_ref_has_domain(SINGLE, ref)) -> failure
>>
>>
>> If you find this to be ok. Will define this helper and use it to check
>> status of force_wake_get.
> 
> with fixed/added helpers it's fine with me


Thanks for confirming this.

> 
>>
>> BR
>> Himal
>>
>>>
>>>>
>>>> Usecases:
>>>>
>>>> A) No error check, just continue in case of failure too.
>>>>
>>>> ref =  xe_force_wake_get(fw, domain /* can be ALL_DOMAIN */);
>>>> do_operations();
>>>> xe_force_wake_put(fw, ref);
>>>
>>> yep
>>>
>>> and inside do_operations() we can always use xe_force_wake_is_awake to
>>> check every domain
>>>
>>>>
>>>> B) error check, abort in case of failure.
>>>>
>>>> ref =  xe_force_wake_get(fw, domain /* can be ALL_DOMAIN */);
>>>> int err = xe_force_wake_get_status(domain, ref);
>>>> if(err) {
>>>>        xe_force_wake_put(fw, ref);
>>>>            return err;
>>>>           }
>>>> do_operations();
>>>> xe_force_wake_put(fw, ref);
>>>
>>> nay, too complicated, better:
>>>
>>> ref = xe_force_wake_get(fw, ALL);
>>>
>>> err = xe_force_wake_is_awake(fw, ALL) ? do_operations() : -EFATAL;
>>>
>>> xe_force_wake_put(fw, ref);
>>>
>>>>
>>>> c) get all domain, but check specific domain:
>>>>
>>>> ref =  xe_force_wake_get(fw, ALL_domain);
>>>>      if (xe_force_wake_get_status(domain, ref))
>>>>           dmesg_warn( "unable to awake all requested domain \n");
>>>
>>> IIRC in xe_force_wake_get() there is one WARN already
>>>
>>>>
>>>>       if (xe_fwref_has_domain(fw, SINGLE_DOMAIN))
>>>>           do_operations()
>>>>
>>>>      xe_force_wake_put(fw, ref);
>>>>
>>>
>>> so maybe simpler:
>>>
>>> ref = xe_force_wake_get(fw, ALL);
>>>
>>> err = xe_force_wake_is_awake(fw, FOO) ? do_operations() : -EMINOR;
>>>
>>> xe_force_wake_put(fw, ref);
>>>
>>>
>>>>>> Otherwise, the operation is considered a failure, and
>>>>>> + * the caller should handle the failure case, potentially returning
>>>>>> + * -ETIMEDOUT.
>>>>>> + */
>>>>>> +unsigned int xe_force_wake_get(struct xe_force_wake *fw,
>>>>>> +                   enum xe_force_wake_domains domains)
>>>>>>     {
>>>>>>         struct xe_gt *gt = fw->gt;
>>>>>>         struct xe_force_wake_domain *domain;
>>>>>> -    enum xe_force_wake_domains tmp, woken = 0;
>>>>>> +    unsigned int tmp, ret, awake_rqst = 0, awake_failed = 0;
>>>>>>         unsigned long flags;
>>>>>> -    int ret = 0;
>>>>>>           spin_lock_irqsave(&fw->lock, flags);
>>>>>>         for_each_fw_domain_masked(domain, domains, fw, tmp) {
>>>>>>             if (!domain->ref++) {
>>>>>> -            woken |= BIT(domain->id);
>>>>>> +            awake_rqst |= BIT(domain->id);
>>>>>>                 domain_wake(gt, domain);
>>>>>>             }
>>>>>>         }
>>>>>> -    for_each_fw_domain_masked(domain, woken, fw, tmp) {
>>>>>> -        ret |= domain_wake_wait(gt, domain);
>>>>>> +    for_each_fw_domain_masked(domain, awake_rqst, fw, tmp) {
>>>>>> +        if (domain_wake_wait(gt, domain) == 0) {
>>>>>> +            fw->awake_domains |= BIT(domain->id);
>>>>>> +        } else {
>>>>>> +            awake_failed |= BIT(domain->id);
>>>>>> +            --domain->ref;
>>>>>> +        }
>>>>>>         }
>>>>>> -    fw->awake_domains |= woken;
>>>>>> +    ret = (domains & ~awake_failed);
>>>>>>         spin_unlock_irqrestore(&fw->lock, flags);
>>>>>>     +    xe_gt_WARN(gt, awake_failed, "domain%s %#x failed to
>>>>>> acknowledgment awake\n",
>>>>>> +           str_plural(hweight_long(awake_failed)), awake_failed);
>>>>>> +
>>>>>>         return ret;
>>>>>>     }
>>>>>>     diff --git a/drivers/gpu/drm/xe/xe_force_wake.h b/drivers/gpu/drm/
>>>>>> xe/xe_force_wake.h
>>>>>> index a2577672f4e3..6c1ade39139b 100644
>>>>>> --- a/drivers/gpu/drm/xe/xe_force_wake.h
>>>>>> +++ b/drivers/gpu/drm/xe/xe_force_wake.h
>>>>>> @@ -15,8 +15,8 @@ void xe_force_wake_init_gt(struct xe_gt *gt,
>>>>>>                    struct xe_force_wake *fw);
>>>>>>     void xe_force_wake_init_engines(struct xe_gt *gt,
>>>>>>                     struct xe_force_wake *fw);
>>>>>> -int xe_force_wake_get(struct xe_force_wake *fw,
>>>>>> -              enum xe_force_wake_domains domains);
>>>>>> +unsigned int xe_force_wake_get(struct xe_force_wake *fw,
>>>>>> +                   enum xe_force_wake_domains domains);
>>>>>>     int xe_force_wake_put(struct xe_force_wake *fw,
>>>>>>                   enum xe_force_wake_domains domains);
>>>>>>     
>>>>>
>>>>
>>>
>>
> 

