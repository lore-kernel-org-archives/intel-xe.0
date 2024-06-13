Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0AD1C27C53
	for <intel-xe@archiver.kernel.org>; Thu, 13 Jun 2024 00:57:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E81810E1FF;
	Thu, 13 Jun 2024 00:57:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VTHhXzX4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 539BC10E043
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Jun 2024 00:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718240257; x=1749776257;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=tGf6a9n77DnVbwjM8aGOKULTKfuK0lA58Afox2iSm18=;
 b=VTHhXzX4B43+FXgWDN8AQkuwSO502FNyFqLwwb7q1OLeoz8HKHBq2GLZ
 H/91LkCG4i8WCECkGo8zZR8wTnKfBjvUlAAPSxK6VLx0J0Vv1T3S9QBfi
 NEoo7t5MaSf6poKkkcSizGqKq1lPLkdG3I4aDPFzoP1IC8EUUjR1WieSO
 yLm6qqgKMk4WaWHyL/akX3WoDtkjasqfXWFHYjPGkdIcO2nWk9jMwvjkk
 5JwACM6sUTiFuF6Ik/3xzlwH3/3URlM5Yp+l1ayjOo6cW+uIIiFPfc1PQ
 5TKokIsD5uCnb64/Efzeh1NfkkECHtTrUSoKcr695fDW9LF+Yk9fZ6ete w==;
X-CSE-ConnectionGUID: lCMve3E+R96tOOcCx5+QsQ==
X-CSE-MsgGUID: pgYGPHMnQnmikxF01wUCmA==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="18890732"
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; d="scan'208";a="18890732"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 17:57:36 -0700
X-CSE-ConnectionGUID: 9H82DnxRRZu+LXyCckTbjQ==
X-CSE-MsgGUID: 9eOElBwAT6WPrUMo8wMc2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; d="scan'208";a="40068524"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Jun 2024 17:57:37 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 12 Jun 2024 17:57:36 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 12 Jun 2024 17:57:36 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 12 Jun 2024 17:57:36 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 12 Jun 2024 17:57:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZNN/OL9LpyFko1y1FJ/MHH+eeEy9aW+xY98HAUiJnM58TylBrYq23o/ZFSLoRgPMCYQ6DEUD90YbkqmL8kqr6iiSNN6+WFXSkGnNtsKkLICOB3YzlPf7HJc3Ygq/JW47HqzUeEvmpuKUjE/29BdO0ghT8XnrXwx0nBdgBRXiVTtKCJm8p//6jtPc1MNa1pDcmMApDcPlZpoJ9jNP3L+WUGmKBHQKeC4yiZjKFH1b+OCvkTd2EQRfkf6QuHqlpMFpX5cGkRMVr6bpfn+I+8LK0NHeejsXa4iJ2nnNsLCEWwj5wiZ/Nx3l9MvAM+gTpX3EU05zPsf6hYVRolc7GUVgPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4t7M4Wkd2cYkL4LQwWFiTdfoFF2URyUXl3xKXR3tdso=;
 b=AO9D6JzVi5MzitPhctNjyv7R1ToV7dOdOwox5mrhJ/yUFnQed/UOSKUa/EpjsLTuwuG8wZy7WHlkx82EwAfR8rZR4jkmbH9F3/SmWDthVC9is3454KH2ivPFg9Ot6n3Z5VL7e+1Bi6gbo3ObAUIr0qk+gUPHjfXPLCRgC7J1VoqaA51pNIseH6K1lXhp6JS9goupXdSUSv58TxpL/0xhfBcD9XP/CtPf2+ESSqvLDThDsAxUSVHnY4IXIQnQxwOPJhVVk+hTRxID+Y1kg9FBCHU7JQXVnaeAFtN6PqRnYUpmBSopBNZJTwDeQJLEFAdU5Rideh+P1Oomx2FguvK/hA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by DM4PR11MB6549.namprd11.prod.outlook.com (2603:10b6:8:8e::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7677.21; Thu, 13 Jun 2024 00:57:28 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%4]) with mapi id 15.20.7633.037; Thu, 13 Jun 2024
 00:57:28 +0000
Message-ID: <f346b43e-475d-4c52-966d-cf38c8376bed@intel.com>
Date: Wed, 12 Jun 2024 17:57:26 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 11/11] drm/xe: Sample ctx timestamp to determine if
 jobs have timed out
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>
References: <20240611144053.2805091-1-matthew.brost@intel.com>
 <20240611144053.2805091-12-matthew.brost@intel.com>
 <96d30c2b-76b6-4086-aaad-77190c4af586@intel.com>
 <ZmohaZ02aV7tnKbL@DUT025-TGLU.fm.intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <ZmohaZ02aV7tnKbL@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0311.namprd04.prod.outlook.com
 (2603:10b6:303:82::16) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|DM4PR11MB6549:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d5deadd-9009-49a3-8d9b-08dc8b43cc36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230034|376008|1800799018|366010;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RHJDQmZlaW8raUlBUmo1TTl6eTd3M0FDQWt0WWZQYlRXWnpZMEpXam5hN081?=
 =?utf-8?B?K045WXl1bUtjdklVRFZnVU16VDl4eUY4WkcySG8rMnE2SWdXNHpxaW1sMTBF?=
 =?utf-8?B?Tk13cHhSQzkzYVRsNExWTFBCbEpIZVN3c2traExqNzhUR1hxVFFPcEsySFdL?=
 =?utf-8?B?TWZOalFZQXN1L0lQYUwzejJXMW1kVmVDcE5tTFAxR3pyTjcvMUZVc1Y1U01Y?=
 =?utf-8?B?TForRVJLS1lrMDU1RURxYXJkYmovTHl4cDhId3d2d0VxaW1Fckl6ekhXMExx?=
 =?utf-8?B?T05uMkN0ZUJYWWpEbVAxRFI4SUNERmFVK3lZdHdIN2J3YjNGMERUaGtFUDIx?=
 =?utf-8?B?cUZwNnBVNFBuMjZET00zRXJDVU0wTDFOUlh2WFh5QXFZblgxTTVqazNtZWxI?=
 =?utf-8?B?Q21IMjI1K3lxUEN4OWU1dEhuMTB6QWliTFVvbFlDeE5nMXhQWmZGcDdhaUZF?=
 =?utf-8?B?RzVuOThvSWF6RlA0SEMwbzVmcXEzeU85NmtLbS9zUm9PVjVwNFZsN3VvRllq?=
 =?utf-8?B?Q1VhUVVJUGlqalY5dkNablJKSWxqRFp0amZmRFU0UFVremVtY25TekwyajU4?=
 =?utf-8?B?aEdzV291dVBIVmE4c080VjNTTEFJZ20wbmp1SUVKMUtUS3h0SzNxZVlFajlL?=
 =?utf-8?B?NW55c1Zuc25VSU00NnNPRVdoK3FGVTlCRHprK00xay9meGR6bXVORnZ6Ymxt?=
 =?utf-8?B?b2NwQllSNjEwc3ROZnZ1cTNNSml5SzJtZWo4b3o1aStvWHpYU0p3R1loY2pq?=
 =?utf-8?B?eXo0Rk9kTEZwb2R1SWxlN3EwMDFpWVVCOURqeXpJRThNeVVyMytXNDViWGdP?=
 =?utf-8?B?TVkwcDQ5R1p3cEZodEh4bGYveEtTd0xLMnRlUzc5Y3RYSklMZ1VFTS9xWHkz?=
 =?utf-8?B?WDFVaE1ZL2Z2MzhlRG8wZFpyVS9VeXJrVllja2wyTUFUS3dRekRrYWV1Z0hp?=
 =?utf-8?B?RmpDT0g0Uk1IZy95dTNyNEdmMzc0Sm55TWpHaHFJTEord0xzT0VBRHBxd1NG?=
 =?utf-8?B?NUpoU3hod2VnQS9HSVBuTzJCYWRVU2EzSHdrTW0xTEpnOUwxb2FEdGlFRFlv?=
 =?utf-8?B?Qy9pQ2llckxrSmtIUkdObEFnczBSdW1FQTJoMEQvbG93bkI1UGtsYjkyMTQv?=
 =?utf-8?B?cWhhYzVBSEN3Yi9OcUpOcEVxNDRFTXJtSEFVNXZTZDErUjdpYXN0YkIxTzNk?=
 =?utf-8?B?OW0xdFZTVUE5K3RNQmFPWUljcm9ZaXcyWnNscWh6ZytyalZPSVI2SmU5b2hr?=
 =?utf-8?B?RENpQkdIUHJ6YisyeCtRK2oxRVJFZWF2Z2NqdmYybWM2T211N0hUT0wwdnFO?=
 =?utf-8?B?WHNJWVJGc1IxMGk0V2pHV3BzaHV2dFpUMFpMcXZKdllhVm5YTGVxM1M1U2xi?=
 =?utf-8?B?ckxRY1Y1R0E4VnpFK3dOM3dxNzJXbDdScXVkNWU4MnNNU3Eva3doeTVuM05M?=
 =?utf-8?B?UmR0dG85dEw0RmVJbVoxRmFGaHpNcHdRVW9MaU1GUC8weEkrendlbks4ODdh?=
 =?utf-8?B?bXNsRStpdG40bVhZVWxhWElrWHlYNklNNDJjRUY0RHZWZ2UrQWJzNEVsa25a?=
 =?utf-8?B?b2VjSHVsSVdPNkpUdlNxNGlrQzlwRUM4TFpDUnRPZkZTdFRPUVM1M2k5V01w?=
 =?utf-8?B?Z0dMdFFvSVg1SXc1blJnaWx3bFlPTlUvZm01ek10dG4zK2FRcTU4WHU3NXoy?=
 =?utf-8?B?VlF2T2x4REl4dlRGaGMrQVh4MURzMFNaOE5aaHFnaDh0eDRXZUMyTnFkQ1Jz?=
 =?utf-8?Q?w26sVLB0iK7WeJ3zpNzk/pVi0Vl6m36jytWHFQJ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230034)(376008)(1800799018)(366010); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TXA4cVBRQTJGSXhYV2hFbjdqQ0tSOGdmUXdWWUR6dnZQU04vaFpaM0xlZjVm?=
 =?utf-8?B?aU9MUTNmNUNzY1g4ZExTL053U0pJckxNRkYwcGxtbFNyQ1M4bUtEWHJKQ1dK?=
 =?utf-8?B?ajlpTWZQbnR3bUV1WmxiWHJoU2Z2TXphUnVLdDZvL1loeHBQcUtlaFBpWGhG?=
 =?utf-8?B?SnhaRlNITUIvU3dyaFVHTnpvN2gvVjVlZVEyVy9oK2k1LzdlcUtESTUyWjU5?=
 =?utf-8?B?U0ZkK0xyaTFJTzhXQS9hVEdGcmRHQUNlODlrNjdkSlQrZGE2a3JlMW1vTlJp?=
 =?utf-8?B?eUhEWXJJeDdVZGFDcTQwU0VzSTJkSE5zZFU0UDJoU3U1NXBuRXFHWmNLb2tH?=
 =?utf-8?B?TUJWUTFaZ0FVV01SUFBRYnRlVUVreU1lODEyOVJNUlMvcStQeUxMQnVPQ016?=
 =?utf-8?B?MlVCKzBVZHptRVh3VUtNV1RUNFpxRVJxNVhLbmdrN29udUhjWml1U2JIS25J?=
 =?utf-8?B?OUpoaFhydU5CZk0rYjB3SDJMUWxkNnFsUVRSckYveVRaTGJqVnZSY21XRzgw?=
 =?utf-8?B?c1hZQkpwamxHWEFhVktXckU1S1NMVVdUd25Dc1pySFYwWjNyR1NUbWF4UEVm?=
 =?utf-8?B?Unp1SUphMC9WWXdnWXBYVEdaL1JTTzB5N3dkRUVDMUY3b2QxK21WYTZ6eFZn?=
 =?utf-8?B?R2tmamU1dEwvU1NoZzBaVkhEbk5FVmFmNzQvV2tJVEVYM1NEdVkyWWpDbVg0?=
 =?utf-8?B?dWRuaDJlaTloVWp3aGdhMXU0bXNPcjM3eVNlb2UzRjdFOTI1Z3YrS0lvZHVV?=
 =?utf-8?B?cUVvN29DYTVkRFQzclhFc3ZkUnhSM3pFM0hJVVpDSGlsSDJseG9xNjlzL1Z6?=
 =?utf-8?B?bzJqazJ3MzFsSnZuVWxITDdGTlZwck9lQVlIVkVlWmRpdmZDckZUYU0yY2lw?=
 =?utf-8?B?eTdacTFjc0orUXpKenRpMVNUL0R5NEY5TDE1aGxOZ2pCZE9kZ0JSVFhTb3Uv?=
 =?utf-8?B?anMvN2o3cjM1MGUvRnVtaUlKRGtCSkVtRGJYaHBpL1JaRzAxUG5wUk1MM3Jl?=
 =?utf-8?B?aVRBSFJKQW81T1RRcDdSQ0Jwd1VxNWxGSEdjRFg3SEVuRGErRUNCMHZPM1NP?=
 =?utf-8?B?M1hZUXVnaUVTUU8yam11eWRyZHlhYlBiUXVYRk04Q3VhMWZSZWhXTmw5Njhq?=
 =?utf-8?B?OXZLMHZLYTR1NkZuM0pFaWIxb2FYaFN2di80RUs0aXp2RFpvd2ptZnNNdnNN?=
 =?utf-8?B?Z09CcGNib1ZhbGp1NmE0TU9IdG5aU2w2UkpmN1EzVUE2WVpCTEJPU2crYkdP?=
 =?utf-8?B?ODVXRWVQeWFjRnZCUTRYVEFjc3J5MkkrOEFYMVBwZGJMMVZlcDdNOUhwSC9P?=
 =?utf-8?B?UkZTdHNwVm1kaklrVVFZUHBJMjRMSWk1bWZPaGNqS0ZURzE3Z2pjUUFJUWx3?=
 =?utf-8?B?ak1kMkpQMEEzc0t1THpaRzQ2UVBqUzQ3ZGNOUmVyRmR1TmViWFg3WUhFSTFV?=
 =?utf-8?B?cUpJRU40aTJ5OXFtR2ZhMks2SFFPZUs5TXV6OHFrT25HZmNzN1oyRlBYUmtQ?=
 =?utf-8?B?cFJyVW5uNUFUT0tmSGVuVEJIa1VaZHU3MG1tTGtyWFZ0ODdZZkFMQi9BZHl5?=
 =?utf-8?B?aUVCSDlBKzlseVVuRFpYcUdyazE5WFlSQ2FuVytsczVwUThPQmlCdzc0cVRT?=
 =?utf-8?B?M1BBaDRRbnU5L0lVNXFya1dTZjRVa05YNVpTV3B0VVJCS2E5Ym8vcEpWTk53?=
 =?utf-8?B?SFNwSXZOZnVpa2ZaclpvbVh1VlFWSmJDcVdaeUg5SXI1djZsRnFUN2hBUXYv?=
 =?utf-8?B?M2JLMGh6VHN5Y25WREEzWHEydmltOVVGaWpSbjd2d3NyM3BLK29MbXU2OUNM?=
 =?utf-8?B?eGdZRlF2VnZ5MXNqNzlOYWJiVFlERW5IbEN3ZnBzVDNyMU5HZUhNSFZBU2Rh?=
 =?utf-8?B?UTBZSFEvU0JHRXNDamJPemNYRG85cGgvVVF5T1lhWE1UZmMzTVo1blpTUkVp?=
 =?utf-8?B?cU02dGJnYmFRNG85L1F0SVRsT0xpZHZjN1dpU0ZkRFZ6M0V0ZUJZd3AxKzdw?=
 =?utf-8?B?SmxMb0M5NWZrS3ZmUEdqdXF5VTZNWnlWQmlKV2hZVHpDdm83aEpleU5vU3JY?=
 =?utf-8?B?N3ZFZENkRzUxa3Fmak1HNWorUjZ1T1hRSjJGVjBrTmJub1RuNjNWeENSTFFZ?=
 =?utf-8?B?ZHAranNpUkdvNEJrR2dEVjJrVjZhTi9YM3lkRytoRWltdlpMRTZCSytWVGJQ?=
 =?utf-8?B?b2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d5deadd-9009-49a3-8d9b-08dc8b43cc36
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2024 00:57:28.6282 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m58dk/4Wg4bNL4ReyoMHH8ibsEdm9XruYF6fO+ak2pDpW450f0ccex6HGC4BIrPbyi8f08fse74Js8uMEXW7/hQUYp2b/XIuioRFTprOQng=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6549
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

On 6/12/2024 15:30, Matthew Brost wrote:
> On Wed, Jun 12, 2024 at 02:56:42PM -0700, John Harrison wrote:
>> On 6/11/2024 07:40, Matthew Brost wrote:
>>> In GuC TDR sample ctx timestamp to determine if jobs have timed out. The
>>> scheduling enable needs to be toggled to properly sample the timestamp.
>>> If a job has not been running for longer than the timeout period,
>>> re-enable scheduling and restart the TDR.
>>>
>>> v2:
>>>    - Use GT clock to msec helper (Umesh, off list)
>>>    - s/ctx_timestamp_job/ctx_job_timestamp
>>> v3:
>>>    - Fix state machine for TDR, mainly decouple sched disable and
>>>      deregister (testing)
>>>    - Rebase (CI)
>>> v4:
>>>    - Fix checkpatch && newline issue (CI)
>>>    - Do not deregister on wedged or unregistered (CI)
>>>    - Fix refcounting bugs (CI)
>>>    - Move devcoredump above VM / kernel job check (John H)
>>>    - Add comment for check_timeout state usage (John H)
>>>    - Assert pending disable not inflight when enabling scheduling (John H)
>>>    - Use enable_scheduling in other scheduling enable code (John H)
>>>    - Add comments on a few steps in TDR (John H)
>>>    - Add assert for timestamp overflow protection (John H)
>>> v6:
>>>    - Use mul_u64_u32_div (CI, checkpath)
>>>    - Change check time to dbg level (Paulo)
>>>    - Add immediate mode to sched disable (inspection)
>>>    - Use xe_gt_* messages (John H)
>>>    - Fix typo in comment (John H)
>>>    - Check timeout before clearing pending disable (Paulo)
>>>
>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>> Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
>>> ---
>>>    drivers/gpu/drm/xe/xe_guc_submit.c | 303 +++++++++++++++++++++++------
>>>    1 file changed, 242 insertions(+), 61 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>>> index 671c72caf0ff..cddb391888b6 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
>>> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>>> @@ -10,6 +10,7 @@
>>>    #include <linux/circ_buf.h>
>>>    #include <linux/delay.h>
>>>    #include <linux/dma-fence-array.h>
>>> +#include <linux/math64.h>
>>>    #include <drm/drm_managed.h>
>>> @@ -23,6 +24,7 @@
>>>    #include "xe_force_wake.h"
>>>    #include "xe_gpu_scheduler.h"
>>>    #include "xe_gt.h"
>>> +#include "xe_gt_clock.h"
>>>    #include "xe_gt_printk.h"
>>>    #include "xe_guc.h"
>>>    #include "xe_guc_ct.h"
>>> @@ -62,6 +64,8 @@ exec_queue_to_guc(struct xe_exec_queue *q)
>>>    #define EXEC_QUEUE_STATE_KILLED			(1 << 7)
>>>    #define EXEC_QUEUE_STATE_WEDGED			(1 << 8)
>>>    #define EXEC_QUEUE_STATE_BANNED			(1 << 9)
>>> +#define EXEC_QUEUE_STATE_CHECK_TIMEOUT		(1 << 10)
>>> +#define EXEC_QUEUE_STATE_EXTRA_REF		(1 << 11)
>>>    static bool exec_queue_registered(struct xe_exec_queue *q)
>>>    {
>>> @@ -188,6 +192,31 @@ static void set_exec_queue_wedged(struct xe_exec_queue *q)
>>>    	atomic_or(EXEC_QUEUE_STATE_WEDGED, &q->guc->state);
>>>    }
>>> +static bool exec_queue_check_timeout(struct xe_exec_queue *q)
>>> +{
>>> +	return atomic_read(&q->guc->state) & EXEC_QUEUE_STATE_CHECK_TIMEOUT;
>>> +}
>>> +
>>> +static void set_exec_queue_check_timeout(struct xe_exec_queue *q)
>>> +{
>>> +	atomic_or(EXEC_QUEUE_STATE_CHECK_TIMEOUT, &q->guc->state);
>>> +}
>>> +
>>> +static void clear_exec_queue_check_timeout(struct xe_exec_queue *q)
>>> +{
>>> +	atomic_and(~EXEC_QUEUE_STATE_CHECK_TIMEOUT, &q->guc->state);
>>> +}
>>> +
>>> +static bool exec_queue_extra_ref(struct xe_exec_queue *q)
>>> +{
>>> +	return atomic_read(&q->guc->state) & EXEC_QUEUE_STATE_EXTRA_REF;
>>> +}
>>> +
>>> +static void set_exec_queue_extra_ref(struct xe_exec_queue *q)
>>> +{
>>> +	atomic_or(EXEC_QUEUE_STATE_EXTRA_REF, &q->guc->state);
>>> +}
>>> +
>>>    static bool exec_queue_killed_or_banned_or_wedged(struct xe_exec_queue *q)
>>>    {
>>>    	return (atomic_read(&q->guc->state) &
>>> @@ -920,6 +949,109 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
>>>    	xe_sched_submission_start(sched);
>>>    }
>>> +#define ADJUST_FIVE_PERCENT(__t)	mul_u64_u32_div((__t), 105, 100)
>>> +
>>> +static bool check_timeout(struct xe_exec_queue *q, struct xe_sched_job *job)
>>> +{
>>> +	struct xe_gt *gt = guc_to_gt(exec_queue_to_guc(q));
>>> +	u32 ctx_timestamp = xe_lrc_ctx_timestamp(q->lrc[0]);
>>> +	u32 ctx_job_timestamp = xe_lrc_ctx_job_timestamp(q->lrc[0]);
>>> +	u32 timeout_ms = q->sched_props.job_timeout_ms;
>>> +	u32 diff;
>>> +	u64 running_time_ms;
>>> +
>>> +	/*
>>> +	 * Counter wraps at ~223s at the usual 19.2MHz, be paranoid catch
>>> +	 * possible overflows with a high timeout.
>>> +	 */
>>> +	xe_gt_assert(gt, timeout_ms < 100 * MSEC_PER_SEC);
>>> +
>>> +	if (ctx_timestamp < ctx_job_timestamp)
>>> +		diff = ctx_timestamp + U32_MAX - ctx_job_timestamp;
>>> +	else
>>> +		diff = ctx_timestamp - ctx_job_timestamp;
>>> +
>>> +	/*
>>> +	 * Ensure timeout is within 5% to account for an GuC scheduling latency
>>> +	 */
>>> +	running_time_ms =
>>> +		ADJUST_FIVE_PERCENT(xe_gt_clock_interval_to_ms(gt, diff));
>>> +
>>> +	xe_gt_dbg(gt,
>>> +		  "Check job timeout: seqno=%u, lrc_seqno=%u, guc_id=%d, running_time_ms=%llu, timeout_ms=%u, diff=0x%08x",
>>> +		  xe_sched_job_seqno(job), xe_sched_job_lrc_seqno(job),
>>> +		  q->guc->id, running_time_ms, timeout_ms, diff);
>>> +
>>> +	return running_time_ms >= timeout_ms;
>>> +}
>>> +
>>> +static void enable_scheduling(struct xe_exec_queue *q)
>>> +{
>>> +	MAKE_SCHED_CONTEXT_ACTION(q, ENABLE);
>>> +	struct xe_guc *guc = exec_queue_to_guc(q);
>>> +	int ret;
>>> +
>>> +	xe_gt_assert(guc_to_gt(guc), !exec_queue_destroyed(q));
>>> +	xe_gt_assert(guc_to_gt(guc), exec_queue_registered(q));
>>> +	xe_gt_assert(guc_to_gt(guc), !exec_queue_pending_disable(q));
>>> +	xe_gt_assert(guc_to_gt(guc), !exec_queue_pending_enable(q));
>>> +
>>> +	set_exec_queue_pending_enable(q);
>>> +	set_exec_queue_enabled(q);
>>> +	trace_xe_exec_queue_scheduling_enable(q);
>>> +
>>> +	xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
>>> +		       G2H_LEN_DW_SCHED_CONTEXT_MODE_SET, 1);
>>> +
>>> +	ret = wait_event_timeout(guc->ct.wq,
>>> +				 !exec_queue_pending_enable(q) ||
>>> +				 guc_read_stopped(guc), HZ * 5);
>>> +	if (!ret || guc_read_stopped(guc)) {
>>> +		xe_gt_warn(guc_to_gt(guc), "Schedule enable failed to respond");
>>> +		set_exec_queue_banned(q);
>>> +		xe_gt_reset_async(q->gt);
>>> +		xe_sched_tdr_queue_imm(&q->guc->sched);
>>> +	}
>>> +}
>>> +
>>> +static void disable_scheduling(struct xe_exec_queue *q, bool immediate)
>>> +{
>>> +	MAKE_SCHED_CONTEXT_ACTION(q, DISABLE);
>>> +	struct xe_guc *guc = exec_queue_to_guc(q);
>>> +
>>> +	xe_gt_assert(guc_to_gt(guc), !exec_queue_destroyed(q));
>>> +	xe_gt_assert(guc_to_gt(guc), exec_queue_registered(q));
>>> +	xe_gt_assert(guc_to_gt(guc), !exec_queue_pending_disable(q));
>>> +
>>> +	if (immediate)
>>> +		set_min_preemption_timeout(guc, q);
>>> +	clear_exec_queue_enabled(q);
>>> +	set_exec_queue_pending_disable(q);
>>> +	trace_xe_exec_queue_scheduling_disable(q);
>>> +
>>> +	xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
>>> +		       G2H_LEN_DW_SCHED_CONTEXT_MODE_SET, 1);
>>> +}
>>> +
>>> +static void __deregister_exec_queue(struct xe_guc *guc, struct xe_exec_queue *q)
>>> +{
>>> +	u32 action[] = {
>>> +		XE_GUC_ACTION_DEREGISTER_CONTEXT,
>>> +		q->guc->id,
>>> +	};
>>> +
>>> +	xe_gt_assert(guc_to_gt(guc), !exec_queue_destroyed(q));
>>> +	xe_gt_assert(guc_to_gt(guc), exec_queue_registered(q));
>>> +	xe_gt_assert(guc_to_gt(guc), !exec_queue_pending_enable(q));
>>> +	xe_gt_assert(guc_to_gt(guc), !exec_queue_pending_disable(q));
>>> +
>>> +	set_exec_queue_destroyed(q);
>>> +	trace_xe_exec_queue_deregister(q);
>>> +
>>> +	xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
>>> +		       G2H_LEN_DW_DEREGISTER_CONTEXT, 1);
>>> +}
>>> +
>>>    static enum drm_gpu_sched_stat
>>>    guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>>>    {
>>> @@ -927,10 +1059,10 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>>>    	struct xe_sched_job *tmp_job;
>>>    	struct xe_exec_queue *q = job->q;
>>>    	struct xe_gpu_scheduler *sched = &q->guc->sched;
>>> -	struct xe_device *xe = guc_to_xe(exec_queue_to_guc(q));
>>> +	struct xe_guc *guc = exec_queue_to_guc(q);
>>>    	int err = -ETIME;
>>>    	int i = 0;
>>> -	bool wedged;
>>> +	bool wedged, skip_timeout_check;
>>>    	/*
>>>    	 * TDR has fired before free job worker. Common if exec queue
>>> @@ -942,49 +1074,53 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>>>    		return DRM_GPU_SCHED_STAT_NOMINAL;
>>>    	}
>>> -	drm_notice(&xe->drm, "Timedout job: seqno=%u, lrc_seqno=%u, guc_id=%d, flags=0x%lx",
>>> -		   xe_sched_job_seqno(job), xe_sched_job_lrc_seqno(job),
>>> -		   q->guc->id, q->flags);
>>> -	xe_gt_WARN(q->gt, q->flags & EXEC_QUEUE_FLAG_KERNEL,
>>> -		   "Kernel-submitted job timed out\n");
>>> -	xe_gt_WARN(q->gt, q->flags & EXEC_QUEUE_FLAG_VM && !exec_queue_killed(q),
>>> -		   "VM job timed out on non-killed execqueue\n");
>>> -
>>> -	if (!exec_queue_killed(q))
>>> -		xe_devcoredump(job);
>>> -
>>> -	trace_xe_sched_job_timedout(job);
>>> -
>>> -	wedged = guc_submit_hint_wedged(exec_queue_to_guc(q));
>>> -
>>>    	/* Kill the run_job entry point */
>>>    	xe_sched_submission_stop(sched);
>>> +	/* Must check all state after stopping scheduler */
>>> +	skip_timeout_check = exec_queue_reset(q) ||
>>> +		exec_queue_killed_or_banned_or_wedged(q) ||
>>> +		exec_queue_destroyed(q);
>>> +
>>> +	/* Job hasn't started, can't be timed out */
>>> +	if (!skip_timeout_check && !xe_sched_job_started(job))
>>> +		goto rearm;
>>> +
>>>    	/*
>>> -	 * Kernel jobs should never fail, nor should VM jobs if they do
>>> -	 * somethings has gone wrong and the GT needs a reset
>>> +	 * XXX: Sampling timeout doesn't work in wedged mode as we have to
>>> +	 * modify scheduling state to read timestamp. We could read the
>>> +	 * timestamp from a register to accumulate current running time but this
>>> +	 * doesn't work for SRIOV. For now assuming timeouts in wedged mode are
>>> +	 * genuine timeouts.
>>>    	 */
>>> -	if (!wedged && (q->flags & EXEC_QUEUE_FLAG_KERNEL ||
>>> -			(q->flags & EXEC_QUEUE_FLAG_VM && !exec_queue_killed(q)))) {
>>> -		if (!xe_sched_invalidate_job(job, 2)) {
>>> -			xe_sched_add_pending_job(sched, job);
>>> -			xe_sched_submission_start(sched);
>>> -			xe_gt_reset_async(q->gt);
>>> -			goto out;
>>> -		}
>>> -	}
>>> +	wedged = guc_submit_hint_wedged(exec_queue_to_guc(q));
>>> -	/* Engine state now stable, disable scheduling if needed */
>>> +	/* Engine state now stable, disable scheduling to check timestamp */
>>>    	if (!wedged && exec_queue_registered(q)) {
>>> -		struct xe_guc *guc = exec_queue_to_guc(q);
>>>    		int ret;
>>>    		if (exec_queue_reset(q))
>>>    			err = -EIO;
>>> -		set_exec_queue_banned(q);
>>> +
>>>    		if (!exec_queue_destroyed(q)) {
>>> -			xe_exec_queue_get(q);
>>> -			disable_scheduling_deregister(guc, q);
>>> +			/*
>>> +			 * Wait for any pending G2H to flush out before
>>> +			 * modifying state
>>> +			 */
>>> +			ret = wait_event_timeout(guc->ct.wq,
>>> +						 !exec_queue_pending_enable(q) ||
>>> +						 guc_read_stopped(guc), HZ * 5);
>>> +			if (!ret || guc_read_stopped(guc))
>>> +				goto trigger_reset;
>>> +
>>> +			/*
>>> +			 * Flag communicates to G2H handler that schedule
>>> +			 * disable originated from a timeout check. The G2H then
>>> +			 * avoid triggering cleanup or deregistering the exec
>>> +			 * queue.
>>> +			 */
>>> +			set_exec_queue_check_timeout(q);
>>> +			disable_scheduling(q, skip_timeout_check);
>>>    		}
>>>    		/*
>>> @@ -1000,15 +1136,60 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>>>    					 !exec_queue_pending_disable(q) ||
>>>    					 guc_read_stopped(guc), HZ * 5);
>>>    		if (!ret || guc_read_stopped(guc)) {
>>> -			drm_warn(&xe->drm, "Schedule disable failed to respond");
>>> -			xe_sched_add_pending_job(sched, job);
>>> -			xe_sched_submission_start(sched);
>>> +trigger_reset:
>>> +			xe_gt_warn(guc_to_gt(guc), "Schedule disable failed to respond");
>> Not a problem introduced in this patch set so maybe not necessary to fix
>> here either. But we have seen what look like false hits on this warning in
>> some of the reset tests. The code gets here if the schedule disable
>> genuinely times out which is what the warning is saying. But it also gets
>> here if guc_read_stopped() is true and that happens if a reset occurs
>> asynchronously to this timeout check. In that situation, there is no need to
>> fire a warning - the abort is intentional and expected. It is also not
>> necessary to queue up another reset just below. It seems like the warning
>> and the reset should be inside a further 'if(!ret)' check.
>>
> Agree. It should be:
>
> if (!ret)
> 	xe_gt_warn(guc_to_gt(guc), "Schedule disable failed to respond");
>
>
> Will fix in next rev or before merging.
What about the xe_gt_reset_async call? Should that be only in the case 
of genuine timeout or is there a reason to keep it in the case of an 
abort as well?

>
>>> +			set_exec_queue_extra_ref(q);
>>> +			xe_exec_queue_get(q);	/* GT reset owns this */
>>> +			set_exec_queue_banned(q);
>>>    			xe_gt_reset_async(q->gt);
>>>    			xe_sched_tdr_queue_imm(sched);
>>> -			goto out;
>>> +			goto rearm;
>>> +		}
>>> +	}
>>> +
>>> +	/*
>>> +	 * Check if job is actually timed out, if so restart job execution and TDR
>>> +	 */
>>> +	if (!wedged && !skip_timeout_check && !check_timeout(q, job) &&
>>> +	    !exec_queue_reset(q) && exec_queue_registered(q)) {
>>> +		clear_exec_queue_check_timeout(q);
>>> +		goto sched_enable;
>>> +	}
>>> +
>>> +	xe_gt_notice(guc_to_gt(guc), "Timedout job: seqno=%u, lrc_seqno=%u, guc_id=%d, flags=0x%lx",
>>> +		     xe_sched_job_seqno(job), xe_sched_job_lrc_seqno(job),
>>> +		     q->guc->id, q->flags);
>>> +	xe_gt_WARN(q->gt, q->flags & EXEC_QUEUE_FLAG_KERNEL,
>>> +		   "Kernel-submitted job timed out\n");
>>> +	xe_gt_WARN(q->gt, q->flags & EXEC_QUEUE_FLAG_VM && !exec_queue_killed(q),
>>> +		   "VM job timed out on non-killed execqueue\n");
>> I still think it makes more sense to have these two warnings next to the
>> comment that says why these are unexpected errors...
>>
>>> +
>>> +	trace_xe_sched_job_timedout(job);
>>> +
>>> +	if (!exec_queue_killed(q))
>>> +		xe_devcoredump(job);
>>> +
>>> +	/*
>>> +	 * Kernel jobs should never fail, nor should VM jobs if they do
>>> +	 * somethings has gone wrong and the GT needs a reset
>>> +	 */
>> ... i.e. the warning about kernel jobs and VM jobs not failing should be
>> here.
>>
> Sure, can move these warn below this comment. Do you mind if I just fix
> this at merge time?
Sure.

John.

>
> Matt
>
>> John.
>>
>>> +	if (!wedged && (q->flags & EXEC_QUEUE_FLAG_KERNEL ||
>>> +			(q->flags & EXEC_QUEUE_FLAG_VM && !exec_queue_killed(q)))) {
>>> +		if (!xe_sched_invalidate_job(job, 2)) {
>>> +			clear_exec_queue_check_timeout(q);
>>> +			xe_gt_reset_async(q->gt);
>>> +			goto rearm;
>>>    		}
>>>    	}
>>> +	/* Finish cleaning up exec queue via deregister */
>>> +	set_exec_queue_banned(q);
>>> +	if (!wedged && exec_queue_registered(q) && !exec_queue_destroyed(q)) {
>>> +		set_exec_queue_extra_ref(q);
>>> +		xe_exec_queue_get(q);
>>> +		__deregister_exec_queue(guc, q);
>>> +	}
>>> +
>>>    	/* Stop fence signaling */
>>>    	xe_hw_fence_irq_stop(q->fence_irq);
>>> @@ -1030,7 +1211,19 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>>>    	/* Start fence signaling */
>>>    	xe_hw_fence_irq_start(q->fence_irq);
>>> -out:
>>> +	return DRM_GPU_SCHED_STAT_NOMINAL;
>>> +
>>> +sched_enable:
>>> +	enable_scheduling(q);
>>> +rearm:
>>> +	/*
>>> +	 * XXX: Ideally want to adjust timeout based on current exection time
>>> +	 * but there is not currently an easy way to do in DRM scheduler. With
>>> +	 * some thought, do this in a follow up.
>>> +	 */
>>> +	xe_sched_add_pending_job(sched, job);
>>> +	xe_sched_submission_start(sched);
>>> +
>>>    	return DRM_GPU_SCHED_STAT_NOMINAL;
>>>    }
>>> @@ -1133,7 +1326,6 @@ static void __guc_exec_queue_process_msg_suspend(struct xe_sched_msg *msg)
>>>    			   guc_read_stopped(guc));
>>>    		if (!guc_read_stopped(guc)) {
>>> -			MAKE_SCHED_CONTEXT_ACTION(q, DISABLE);
>>>    			s64 since_resume_ms =
>>>    				ktime_ms_delta(ktime_get(),
>>>    					       q->guc->resume_time);
>>> @@ -1144,12 +1336,7 @@ static void __guc_exec_queue_process_msg_suspend(struct xe_sched_msg *msg)
>>>    				msleep(wait_ms);
>>>    			set_exec_queue_suspended(q);
>>> -			clear_exec_queue_enabled(q);
>>> -			set_exec_queue_pending_disable(q);
>>> -			trace_xe_exec_queue_scheduling_disable(q);
>>> -
>>> -			xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
>>> -				       G2H_LEN_DW_SCHED_CONTEXT_MODE_SET, 1);
>>> +			disable_scheduling(q, false);
>>>    		}
>>>    	} else if (q->guc->suspend_pending) {
>>>    		set_exec_queue_suspended(q);
>>> @@ -1160,19 +1347,11 @@ static void __guc_exec_queue_process_msg_suspend(struct xe_sched_msg *msg)
>>>    static void __guc_exec_queue_process_msg_resume(struct xe_sched_msg *msg)
>>>    {
>>>    	struct xe_exec_queue *q = msg->private_data;
>>> -	struct xe_guc *guc = exec_queue_to_guc(q);
>>>    	if (guc_exec_queue_allowed_to_change_state(q)) {
>>> -		MAKE_SCHED_CONTEXT_ACTION(q, ENABLE);
>>> -
>>>    		q->guc->resume_time = RESUME_PENDING;
>>>    		clear_exec_queue_suspended(q);
>>> -		set_exec_queue_pending_enable(q);
>>> -		set_exec_queue_enabled(q);
>>> -		trace_xe_exec_queue_scheduling_enable(q);
>>> -
>>> -		xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
>>> -			       G2H_LEN_DW_SCHED_CONTEXT_MODE_SET, 1);
>>> +		enable_scheduling(q);
>>>    	} else {
>>>    		clear_exec_queue_suspended(q);
>>>    	}
>>> @@ -1434,8 +1613,7 @@ static void guc_exec_queue_stop(struct xe_guc *guc, struct xe_exec_queue *q)
>>>    	/* Clean up lost G2H + reset engine state */
>>>    	if (exec_queue_registered(q)) {
>>> -		if ((exec_queue_banned(q) && exec_queue_destroyed(q)) ||
>>> -		    xe_exec_queue_is_lr(q))
>>> +		if (exec_queue_extra_ref(q) || xe_exec_queue_is_lr(q))
>>>    			xe_exec_queue_put(q);
>>>    		else if (exec_queue_destroyed(q))
>>>    			__guc_exec_queue_fini(guc, q);
>>> @@ -1612,6 +1790,8 @@ static void handle_sched_done(struct xe_guc *guc, struct xe_exec_queue *q,
>>>    		smp_wmb();
>>>    		wake_up_all(&guc->ct.wq);
>>>    	} else {
>>> +		bool check_timeout = exec_queue_check_timeout(q);
>>> +
>>>    		xe_gt_assert(guc_to_gt(guc), runnable_state == 0);
>>>    		xe_gt_assert(guc_to_gt(guc), exec_queue_pending_disable(q));
>>> @@ -1619,11 +1799,12 @@ static void handle_sched_done(struct xe_guc *guc, struct xe_exec_queue *q,
>>>    		if (q->guc->suspend_pending) {
>>>    			suspend_fence_signal(q);
>>>    		} else {
>>> -			if (exec_queue_banned(q)) {
>>> +			if (exec_queue_banned(q) || check_timeout) {
>>>    				smp_wmb();
>>>    				wake_up_all(&guc->ct.wq);
>>>    			}
>>> -			deregister_exec_queue(guc, q);
>>> +			if (!check_timeout)
>>> +				deregister_exec_queue(guc, q);
>>>    		}
>>>    	}
>>>    }
>>> @@ -1664,7 +1845,7 @@ static void handle_deregister_done(struct xe_guc *guc, struct xe_exec_queue *q)
>>>    	clear_exec_queue_registered(q);
>>> -	if (exec_queue_banned(q) || xe_exec_queue_is_lr(q))
>>> +	if (exec_queue_extra_ref(q) || xe_exec_queue_is_lr(q))
>>>    		xe_exec_queue_put(q);
>>>    	else
>>>    		__guc_exec_queue_fini(guc, q);
>>> @@ -1728,7 +1909,7 @@ int xe_guc_exec_queue_reset_handler(struct xe_guc *guc, u32 *msg, u32 len)
>>>    	 * guc_exec_queue_timedout_job.
>>>    	 */
>>>    	set_exec_queue_reset(q);
>>> -	if (!exec_queue_banned(q))
>>> +	if (!exec_queue_banned(q) && !exec_queue_check_timeout(q))
>>>    		xe_guc_exec_queue_trigger_cleanup(q);
>>>    	return 0;
>>> @@ -1758,7 +1939,7 @@ int xe_guc_exec_queue_memory_cat_error_handler(struct xe_guc *guc, u32 *msg,
>>>    	/* Treat the same as engine reset */
>>>    	set_exec_queue_reset(q);
>>> -	if (!exec_queue_banned(q))
>>> +	if (!exec_queue_banned(q) && !exec_queue_check_timeout(q))
>>>    		xe_guc_exec_queue_trigger_cleanup(q);
>>>    	return 0;

