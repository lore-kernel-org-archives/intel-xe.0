Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C84EDC369CA
	for <intel-xe@archiver.kernel.org>; Thu, 17 Apr 2025 20:52:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2317410E3BF;
	Thu, 17 Apr 2025 20:52:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a3a6borM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D9CB10E3BF
 for <Intel-Xe@lists.freedesktop.org>; Thu, 17 Apr 2025 20:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744923135; x=1776459135;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=4K2JCjpiaMZfrifdCYUhNO2I5C8NzJ2aiD/N73IisEQ=;
 b=a3a6borMYJTl6EdspKyY+IoUxH6nVxV8/RT5OG1QO82AajvYRxcky6M+
 cRqFS8UEs09zHRrcX3Ew6usriebWKdniMf5O7Ym5MKz+iyTYGV7lZUw+I
 E/neuW+2DSI9DWn4VAohV5WXYvKnCDRUekudDqvqO9pw8/lISD99l8OKl
 pUayqA6nMMhlhOWKneUyW5AGXJGbzVQu+OU3DngoPZZk5EdVzKq7DiWR+
 7bWay/a4kMPRt/WVt5bOsLuVMMiFSUIEfvRuhiTT5Tj5RbWUGacKF5X8D
 41zZ7o27Tb9gXseptmg8zT3tVMk9yF6PxPGnsPlyJht1ebKxh9LHD/OKe w==;
X-CSE-ConnectionGUID: 0MEj20GxRZm3QA0BMe89Rw==
X-CSE-MsgGUID: u0P6qTWQRkSPnIhLez6Ssw==
X-IronPort-AV: E=McAfee;i="6700,10204,11406"; a="69041799"
X-IronPort-AV: E=Sophos;i="6.15,220,1739865600"; d="scan'208";a="69041799"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2025 13:52:14 -0700
X-CSE-ConnectionGUID: KzazQD96Rf+0bvg4X8+MbQ==
X-CSE-MsgGUID: ffNdYjL3SpmER2MHNMqlXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,220,1739865600"; d="scan'208";a="161967308"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2025 13:52:14 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 17 Apr 2025 13:52:13 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 17 Apr 2025 13:52:13 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 17 Apr 2025 13:52:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G7aar7o+eIgjULyCeP8U0yMLWADyzGm5z02UA0mnfzvJlyVW9ZKQFzy+cPWqAxrPSgeUKDZ8JmRyKyTQsTcEWzGLLAjwgEdRj5KduLq4XUaY2MK4jxJJ5kYAcRDzZN0tIs6Xdq7EA68Rep7qEqs1AMAHFNpI/XwCYRW+qeyGWD2tIhGVECpfI39Bv/hgYvGA6od1XUE7/T8yDDaTkutMsr+RBFNY1keDCuqIWgXeKAU6TbE/mBWZdhCWElsxcnCbanVq+lJK7qVc7K2A4lr45qGO/uz+3FOptxxozseFpR+hCCZ10ZK+o9VolBqB6h8jU98eNpvrsHKY18EpFQcKBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lCKVlNvveRs3pnWQ2KPGerINYubYpGjhafgCBCOi/mY=;
 b=CPjKGaZ724k1T0ofmF6Gxkd0tTKBtFThnTwnFDySeDvAyia3TD+Rm1YfTSTeYQj/Qh2fpUBx2+vhmN8L54wLPA0/LaoJI0Q2tvinVZ/Cv86AP2zbC0NAPEckDOoZvZQ00AYPWbvZ9ckp3zbS1+4+4kAhkhoOBX9rBA4sguo6bx8WvTKZz95VUW0KgyY4G05c8Amm8tfoOt6msylOtxyCjzZ7mcGw/gtsiVDH1XafS5QJetTyBV3BDTayoW7V/4nfhFz/UUn3J6CwzeFGFHv7wWwLjwSLFvOc0n7tFM2i+JKmGSoCXgweINOJynyRFrzjFXHYx5Bt+uTLXDkc78mpjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by PH7PR11MB6055.namprd11.prod.outlook.com (2603:10b6:510:1d3::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.29; Thu, 17 Apr
 2025 20:52:09 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%5]) with mapi id 15.20.8632.030; Thu, 17 Apr 2025
 20:52:09 +0000
Message-ID: <d5c79be7-288a-4f16-88fe-5de338035747@intel.com>
Date: Thu, 17 Apr 2025 13:52:06 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/xe/guc: Cache DSS info when creating capture
 register list
To: Matt Roper <matthew.d.roper@intel.com>
CC: <Intel-Xe@lists.freedesktop.org>
References: <20250417195215.3002210-1-John.C.Harrison@Intel.com>
 <20250417195215.3002210-4-John.C.Harrison@Intel.com>
 <20250417203149.GE6239@mdroper-desk1.amr.corp.intel.com>
Content-Language: en-US
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20250417203149.GE6239@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0301.namprd03.prod.outlook.com
 (2603:10b6:303:dd::6) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|PH7PR11MB6055:EE_
X-MS-Office365-Filtering-Correlation-Id: ff13435e-d9f6-4e67-eb2b-08dd7df1b89e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SDhML01QQWNYemliZDR5RVBNR2lHeG1UbjBNOXhOUGVPOSs2NkZYbGRzNTRm?=
 =?utf-8?B?ajMvSVRqU0x5ZCtXVlpVdm5BWnh4QS83bzYwOXUxaWVDRThNWXVJcXBjK3Ny?=
 =?utf-8?B?WjlETXladHhyUFBMS0VCQ3NJRkpQaU0wOFo2OGNuQkR2b1lwdS9UM3ZLMjl6?=
 =?utf-8?B?Mm1HV1FHaGdtNDlHODI3VFFDYnFXOERCa2ZRS2tNb2V1OFVTa2p5dEJzNTdm?=
 =?utf-8?B?bnEzOFdzOGZBUjZiMU5ORkJkRkVHTTA1aHFHQU5xeFBTdXBUUGZYb2YxVjg0?=
 =?utf-8?B?cThtWnQveUs1V0NDb0kweUNWYXZTR3cxdTRueCtxc2JjTmhDMmtjTXZGRWtz?=
 =?utf-8?B?RzlJQS9qbEZOVkpNTjRBbDljTFZPOTBHMkZGcThwTklYc3MxdGVITE15d1pw?=
 =?utf-8?B?L3ppQ01OMVVpYTcwNVc5UzYrZFlsV3hodEU3N3JtTXJNb1dzVTlzUjBsUXJq?=
 =?utf-8?B?dlIyaGk5ZFJkZGRYcUJuQmxHSll5TlYrODlrbmR6VWtFTDdMcXpzMVFxbnNr?=
 =?utf-8?B?MzRVU21mdjR2Qmp2dUk3YmZneSt3Z1pZMHFIcmNWWXhqd3h3YzVzTGU1ajNj?=
 =?utf-8?B?dis3UnBNaTZhaEVaNWNpdFhUeHdLVm9lcVZpN3VKTUI1cXQ1VWUycUlhZ0Qx?=
 =?utf-8?B?MStjZEJVSG93bnpUUGtMUURyUGc0TnBmcWNlazVTNnBHdTZiUFRKQzZScDMz?=
 =?utf-8?B?WTNWS1JQRzgyMWpLbzJPeWxTZDQ3Wm93UXV1WFNzUWlFSWRyUEJZWjBxc2pN?=
 =?utf-8?B?bmxnNjVDZGJMc1Z1emhoSmI1cEM2cDhtQ3BONUJ6MVhBa1FMMVZTc0tpQnRh?=
 =?utf-8?B?RFozZHh1UXloWmljVllQNUFOMXF4NmlFN0JKUUpQUlh6WHBFUnNQbHU0MTRI?=
 =?utf-8?B?VUpCVWxyTG53M3RESFFzSDdDaTk5dXd0bEJHbzAwVW91YnJDWVhzYVFTUXgx?=
 =?utf-8?B?V1hpbnpFOEY2elZlTndud29jN2VpdzN5RzRuaHc2UHFyd0xDS0hDV2lIR3pi?=
 =?utf-8?B?dytKTGN0YS9XN0pYZ25KRDI0Y3RSSTdHSUJjci9QUWdsOHJ4VzR0STN1M0pr?=
 =?utf-8?B?dHFjM3FvL3ZaSEtBelpJRVpNbDBhL0Ivbjhhdkc3R3phbjluRkxkclZvbnA3?=
 =?utf-8?B?c3RGd2tHQ2prUTBKd2dpbGhlNWRRNC9rTFdWYjNHT1BXREZyaW1QM1FFK3E5?=
 =?utf-8?B?LzBYczlHdVlSODZydHovRnBnY3lWRUwybk9oQWduZXVLOWM1M1ZQS0RVYXdZ?=
 =?utf-8?B?Q2lrdUFTRWxUNkYzeURnWU1kb0hzTGdFeWQrNHhQQWhjQVFiZ3h4VTJyWkJT?=
 =?utf-8?B?aWNIQWJPYlJGeXVSUjNNNklkWExDWFhaQWdCWW1DbHh6eGI4M1FXWWxFUFNC?=
 =?utf-8?B?NzNpa2tZa0JoMzh3eVExRFlvWFhsVjhXeC9ZbjlwbW1oNVdzdFJrVDloWk9P?=
 =?utf-8?B?WnoyMHlNTlZUc0lJYmNPQ1Z0ZXZGVUExc2gyMUd1a3FNcWtOQzJxUEhoN3dy?=
 =?utf-8?B?ckhVNXh5STIwWnYzS1dHRTRERGtDNnpFU2hyM0dHenpCKzc0SU84ZlgzS0E3?=
 =?utf-8?B?cVA4NXlZeUdHS1JIRW1rOWlnZWdKZkg4N25PaXl4UTh4elRTaXIyaStlRmtG?=
 =?utf-8?B?TW42b09QT0ZpdUNFcnA1R3hHV285c201M3hhdGdWUWl5WHpaYzRIUm9MT0gr?=
 =?utf-8?B?RUtJbEN5MzhjSk5BZCtIVVhsckt6RmdMWDJINzdsU2Y5cnhRU1N2dm9uVGxL?=
 =?utf-8?B?UWhzQVZCalV4QnRvVWg4NUtsNzdOSmcvTHdGMVc2VXdjenpydDd4eVF1WG1y?=
 =?utf-8?B?SWVLU3N0d2ZCUUp0M1dTWWpxdy84VHdBT2tWbG8wN3ZnRTdGLzhJVENwTDBJ?=
 =?utf-8?B?V1owMURWQnBPR2diV2Nrcjh2Y2c3WVh4SnN3VkJYZ3o2alh3Vk9WTVJ5NjdI?=
 =?utf-8?Q?OCu+kxU8bio=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SGoyMVpyK0tnSkxBUXplV1I5OVc2cUJJSlFtQWJ0aHhob2l3UWNMK0JDWE80?=
 =?utf-8?B?eCs2SytEZ3F0TlhBcXZuZlVpbHRRUGZuZGM3V1J6czZOOHgwZjM4QlRsUUlV?=
 =?utf-8?B?QThFYlZ1UzdDdDNLdXZOL09xWG82M3M2N2tSWWZNdUNER1k1M2dnTGFoemVq?=
 =?utf-8?B?WEJZYXg1SDRwOVJZaEx1YmJtUWJpcWw1OFI4UGFlOXFSeUJrdmtIQnpqM21l?=
 =?utf-8?B?M21oK1pSTFlPaURDcHNUTDJ1WHVka1RNTHlObDRtTVJ3ajFKTzc1aFZGRjBR?=
 =?utf-8?B?TnNSQytRUTI1YmgreWtwT1djMUlWZTQ1d01jTXdBZ04yYWRqVG9vZjRtMmNx?=
 =?utf-8?B?T3dmdjlaMnRaMnYwamJtMEZaOURBTU96T0hGUitzeG5mSklZOFk4WmlLTm13?=
 =?utf-8?B?UmJ5RkFwVmM2T2QxaTU2aFJvTm5WaytlV2ZLV1hSWXdEVkh4Y3UvUWJGd0JE?=
 =?utf-8?B?UzAxQ2ZocmwzM3BNOHptZnA5eGcrb2lTZmwvWHhFOE1zUU4rcE4yS1M1U21a?=
 =?utf-8?B?eHp1UXBZalB6UzIzSEJ0bEp6SHRFckZZUzVHZk1iblhSbUVtbUxvQXlMWEtD?=
 =?utf-8?B?UmRpTG1Ca2pRSEViTjRLeUEwMDREYnJ0cnVSUkxycEUvK1I2NXYzWTF2RHM4?=
 =?utf-8?B?NXVsL0laTXpjZkNLbjFVUTc5MldvVzkrdGVFaGt3ZEpEUGlncXdjMlRSSkl0?=
 =?utf-8?B?ZlpIdnhad1NSOHRaNTIrd21PdWtodjRUSjBGMjl0RlhQejdqV1NnamNZUlZQ?=
 =?utf-8?B?T1dLM1hvVXhIejBLc0k2QWtQanpXTU5KbmRnODJ5MGl1eU1YQllOVEEwMC80?=
 =?utf-8?B?TGo5U0NkM1FIZXdxWk1Xa0FkNWtOTkZNOCtyNVdxb2ZGaVhvWGNSN09DTDRu?=
 =?utf-8?B?MEd4OEwzbXJ3cUM4N3o0N2hmLzBmSWZXUlAzR3IvUzJNN25PM2RvK2FrSUpv?=
 =?utf-8?B?MW1QUDhvcVdhY29KTEVTWEtqc3N6K2pFRTVsZjRBRDRvcjB2d2V0cHBSd1Rl?=
 =?utf-8?B?SzQySFFpeDN2QzVQVWhOS2k2Q0hOMlYyYXRyVDZQTkNOSFhISXZBT3hoRDBq?=
 =?utf-8?B?Y09CeEw5MWlMbFlXYnkxNDRtRjgzTk55THZZdE5EVVdYdnFqUHhLcVZiUnJ1?=
 =?utf-8?B?SHUrRzFrUzNDMmhtS0d5cDFzVmFmQThIYTZidlpJUG1RTmV6aWlLYU96VzVr?=
 =?utf-8?B?bTBDSXdQbVZQajdSVE1hdFQ3S1Roa1ExYS9MaE9zKy9LeEhGTUM0QzBaK1JI?=
 =?utf-8?B?Z08wZkhYcUc4ZzIwU3ZxbUV5cW43WmlvY2tTcDZIYU9ZMXVPL0V6Vzh6R1RR?=
 =?utf-8?B?enZHZHZHM3A4L05QUExpcnJNbW9BVUdtc2ZxWVFmNDljNFU3Q3cvVWJyMG1t?=
 =?utf-8?B?TEMzY2pJWEVqcXRmWFl6YjdzZm5Wc2JNMERFOTg4RytuanFEVWd0MkJJdlh1?=
 =?utf-8?B?UCswM2JMeTJMaE15aGhnWVFzQVlyYWM4UDFpcE5mRFNSalVmZGw5ZExXdm9x?=
 =?utf-8?B?akg5N05DNHA3eUYrdmhoQSthK1JkVWUwWjdIQ1cwV2JlYVJCKzJrNnpPbDRC?=
 =?utf-8?B?RWl2MDQ5bDNOaEN6OTlQUjdxQ1VYSE9iTWNLVlpXYnRmYzBqODMwVjVZeStp?=
 =?utf-8?B?RVMzVk5acUpNYlNjN3pOdmZ5VTBoT1J5dE9KY1d4QlphaEg0WlN2Ui9ONGJ4?=
 =?utf-8?B?SzFPazF5UzZGZ2ZDQXFRZit2ZDJkM2JBRkpOZGxlOU16WFVsNTJLUFFhSmZL?=
 =?utf-8?B?RnRzczhDKzVUbDEzNGkwRnFhOFRUbFJYK3BFOHdmWWxRNE9hdlF3N1lYTUJ0?=
 =?utf-8?B?dktibzNYWG9UTlkxT3BMVWpSa3JCVVNQQ3ZSWk0wU0NHbmVsdjc5Y3phc0Q5?=
 =?utf-8?B?M2llR2owTzJ2bnRabTVodmdmRVZwQVlQVGMybHpDSGZQTkRrbVh3bmNQQjQ2?=
 =?utf-8?B?dEhVUlVla3IwT1FPcjBHMzNOajRlV0J1UnJ3S01JZy9BWmFmRFRxbXVZWmlY?=
 =?utf-8?B?cUg3Wm5LVHE3aCt3OHprcDliVUgwbEYxZWNuTURkU2tqSlljR3hWZTNpUXRN?=
 =?utf-8?B?VituKzczdGVYVDFJaUJFTFJtaVkwcWdHdE1sTGtJZkdYRzhyeEdrME5pd0Qz?=
 =?utf-8?B?STdEZUV3NVcwT1FLT2Y3RmRuVi9aVmVPY3g3cUpNUnA5cCsybkNMODZPYk9s?=
 =?utf-8?B?alE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ff13435e-d9f6-4e67-eb2b-08dd7df1b89e
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 20:52:09.7373 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8BUlyqYX+QOlQxlwR741XQZK9BiaGVNFYO++d+icux8lMkPEoatQjz/lELFvZZzhOTJDMu/XF8tg7hf203jd9tLf47diCNlktX6AiXpnyGE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6055
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

On 4/17/2025 1:31 PM, Matt Roper wrote:
> On Thu, Apr 17, 2025 at 12:52:14PM -0700, John.C.Harrison@Intel.com wrote:
>> From: John Harrison <John.C.Harrison@Intel.com>
>>
>> Calculating the DSS id (index of a steered register) currently
>> requires reading state from the hwconfig table and that currently
>> requires dynamically allocating memory. The GuC based register capture
>> (for dev core dumps) includes this index as part of the register name
>> in the dump. However, it was calculating said index at the time of the
>> dump for every dump. That is wasteful. It also breaks anyone trying to
>> do the dump at a time when memory allocations are not allowed.
>>
>> So rather than calculating on every print, just calculate at start of
>> day when creating the register list in the first place.
>>
>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_guc_capture.c       | 92 +++++++++++------------
>>   drivers/gpu/drm/xe/xe_guc_capture_types.h |  2 +
>>   2 files changed, 46 insertions(+), 48 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
>> index f4b08136e472..139e4e3bcc32 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_capture.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_capture.c
>> @@ -105,49 +105,49 @@ struct __guc_capture_parsed_output {
>>    *     3. Incorrect order will trigger XE_WARN.
>>    */
>>   #define COMMON_XELP_BASE_GLOBAL \
>> -	{ FORCEWAKE_GT,			REG_32BIT,	0,	0,	"FORCEWAKE_GT"}
>> +	{ FORCEWAKE_GT,			REG_32BIT,	0,	0,	0,	"FORCEWAKE_GT"}
>>   
>>   #define COMMON_BASE_ENGINE_INSTANCE \
>> -	{ RING_HWSTAM(0),		REG_32BIT,	0,	0,	"HWSTAM"}, \
>> -	{ RING_HWS_PGA(0),		REG_32BIT,	0,	0,	"RING_HWS_PGA"}, \
>> -	{ RING_HEAD(0),			REG_32BIT,	0,	0,	"RING_HEAD"}, \
>> -	{ RING_TAIL(0),			REG_32BIT,	0,	0,	"RING_TAIL"}, \
>> -	{ RING_CTL(0),			REG_32BIT,	0,	0,	"RING_CTL"}, \
>> -	{ RING_MI_MODE(0),		REG_32BIT,	0,	0,	"RING_MI_MODE"}, \
>> -	{ RING_MODE(0),			REG_32BIT,	0,	0,	"RING_MODE"}, \
>> -	{ RING_ESR(0),			REG_32BIT,	0,	0,	"RING_ESR"}, \
>> -	{ RING_EMR(0),			REG_32BIT,	0,	0,	"RING_EMR"}, \
>> -	{ RING_EIR(0),			REG_32BIT,	0,	0,	"RING_EIR"}, \
>> -	{ RING_IMR(0),			REG_32BIT,	0,	0,	"RING_IMR"}, \
>> -	{ RING_IPEHR(0),		REG_32BIT,	0,	0,	"IPEHR"}, \
>> -	{ RING_INSTDONE(0),		REG_32BIT,	0,	0,	"RING_INSTDONE"}, \
>> -	{ INDIRECT_RING_STATE(0),	REG_32BIT,	0,	0,	"INDIRECT_RING_STATE"}, \
>> -	{ RING_ACTHD(0),		REG_64BIT_LOW_DW, 0,	0,	NULL}, \
>> -	{ RING_ACTHD_UDW(0),		REG_64BIT_HI_DW, 0,	0,	"ACTHD"}, \
>> -	{ RING_BBADDR(0),		REG_64BIT_LOW_DW, 0,	0,	NULL}, \
>> -	{ RING_BBADDR_UDW(0),		REG_64BIT_HI_DW, 0,	0,	"RING_BBADDR"}, \
>> -	{ RING_START(0),		REG_64BIT_LOW_DW, 0,	0,	NULL}, \
>> -	{ RING_START_UDW(0),		REG_64BIT_HI_DW, 0,	0,	"RING_START"}, \
>> -	{ RING_DMA_FADD(0),		REG_64BIT_LOW_DW, 0,	0,	NULL}, \
>> -	{ RING_DMA_FADD_UDW(0),		REG_64BIT_HI_DW, 0,	0,	"RING_DMA_FADD"}, \
>> -	{ RING_EXECLIST_STATUS_LO(0),	REG_64BIT_LOW_DW, 0,	0,	NULL}, \
>> -	{ RING_EXECLIST_STATUS_HI(0),	REG_64BIT_HI_DW, 0,	0,	"RING_EXECLIST_STATUS"}, \
>> -	{ RING_EXECLIST_SQ_CONTENTS_LO(0), REG_64BIT_LOW_DW, 0,	0,	NULL}, \
>> -	{ RING_EXECLIST_SQ_CONTENTS_HI(0), REG_64BIT_HI_DW, 0,	0,	"RING_EXECLIST_SQ_CONTENTS"}
>> +	{ RING_HWSTAM(0),		REG_32BIT,	0,	0,	0,	"HWSTAM"}, \
>> +	{ RING_HWS_PGA(0),		REG_32BIT,	0,	0,	0,	"RING_HWS_PGA"}, \
>> +	{ RING_HEAD(0),			REG_32BIT,	0,	0,	0,	"RING_HEAD"}, \
>> +	{ RING_TAIL(0),			REG_32BIT,	0,	0,	0,	"RING_TAIL"}, \
>> +	{ RING_CTL(0),			REG_32BIT,	0,	0,	0,	"RING_CTL"}, \
>> +	{ RING_MI_MODE(0),		REG_32BIT,	0,	0,	0,	"RING_MI_MODE"}, \
>> +	{ RING_MODE(0),			REG_32BIT,	0,	0,	0,	"RING_MODE"}, \
>> +	{ RING_ESR(0),			REG_32BIT,	0,	0,	0,	"RING_ESR"}, \
>> +	{ RING_EMR(0),			REG_32BIT,	0,	0,	0,	"RING_EMR"}, \
>> +	{ RING_EIR(0),			REG_32BIT,	0,	0,	0,	"RING_EIR"}, \
>> +	{ RING_IMR(0),			REG_32BIT,	0,	0,	0,	"RING_IMR"}, \
>> +	{ RING_IPEHR(0),		REG_32BIT,	0,	0,	0,	"IPEHR"}, \
>> +	{ RING_INSTDONE(0),		REG_32BIT,	0,	0,	0,	"RING_INSTDONE"}, \
>> +	{ INDIRECT_RING_STATE(0),	REG_32BIT,	0,	0,	0,	"INDIRECT_RING_STATE"}, \
>> +	{ RING_ACTHD(0),		REG_64BIT_LOW_DW, 0,	0,	0,	NULL}, \
>> +	{ RING_ACTHD_UDW(0),		REG_64BIT_HI_DW, 0,	0,	0,	"ACTHD"}, \
>> +	{ RING_BBADDR(0),		REG_64BIT_LOW_DW, 0,	0,	0,	NULL}, \
>> +	{ RING_BBADDR_UDW(0),		REG_64BIT_HI_DW, 0,	0,	0,	"RING_BBADDR"}, \
>> +	{ RING_START(0),		REG_64BIT_LOW_DW, 0,	0,	0,	NULL}, \
>> +	{ RING_START_UDW(0),		REG_64BIT_HI_DW, 0,	0,	0,	"RING_START"}, \
>> +	{ RING_DMA_FADD(0),		REG_64BIT_LOW_DW, 0,	0,	0,	NULL}, \
>> +	{ RING_DMA_FADD_UDW(0),		REG_64BIT_HI_DW, 0,	0,	0,	"RING_DMA_FADD"}, \
>> +	{ RING_EXECLIST_STATUS_LO(0),	REG_64BIT_LOW_DW, 0,	0,	0,	NULL}, \
>> +	{ RING_EXECLIST_STATUS_HI(0),	REG_64BIT_HI_DW, 0,	0,	0,	"RING_EXECLIST_STATUS"}, \
>> +	{ RING_EXECLIST_SQ_CONTENTS_LO(0), REG_64BIT_LOW_DW, 0,	0,	0,	NULL}, \
>> +	{ RING_EXECLIST_SQ_CONTENTS_HI(0), REG_64BIT_HI_DW, 0,	0,	0,	"RING_EXECLIST_SQ_CONTENTS"}
>>   
>>   #define COMMON_XELP_RC_CLASS \
>> -	{ RCU_MODE,			REG_32BIT,	0,	0,	"RCU_MODE"}
>> +	{ RCU_MODE,			REG_32BIT,	0,	0,	0,	"RCU_MODE"}
>>   
>>   #define COMMON_XELP_RC_CLASS_INSTDONE \
>> -	{ SC_INSTDONE,			REG_32BIT,	0,	0,	"SC_INSTDONE"}, \
>> -	{ SC_INSTDONE_EXTRA,		REG_32BIT,	0,	0,	"SC_INSTDONE_EXTRA"}, \
>> -	{ SC_INSTDONE_EXTRA2,		REG_32BIT,	0,	0,	"SC_INSTDONE_EXTRA2"}
>> +	{ SC_INSTDONE,			REG_32BIT,	0,	0,	0,	"SC_INSTDONE"}, \
>> +	{ SC_INSTDONE_EXTRA,		REG_32BIT,	0,	0,	0,	"SC_INSTDONE_EXTRA"}, \
>> +	{ SC_INSTDONE_EXTRA2,		REG_32BIT,	0,	0,	0,	"SC_INSTDONE_EXTRA2"}
>>   
>>   #define XELP_VEC_CLASS_REGS \
>> -	{ SFC_DONE(0),			0,	0,	0,	"SFC_DONE[0]"}, \
>> -	{ SFC_DONE(1),			0,	0,	0,	"SFC_DONE[1]"}, \
>> -	{ SFC_DONE(2),			0,	0,	0,	"SFC_DONE[2]"}, \
>> -	{ SFC_DONE(3),			0,	0,	0,	"SFC_DONE[3]"}
>> +	{ SFC_DONE(0),			0,	0,	0,	0,	"SFC_DONE[0]"}, \
>> +	{ SFC_DONE(1),			0,	0,	0,	0,	"SFC_DONE[1]"}, \
>> +	{ SFC_DONE(2),			0,	0,	0,	0,	"SFC_DONE[2]"}, \
>> +	{ SFC_DONE(3),			0,	0,	0,	0,	"SFC_DONE[3]"}
>>   
>>   /* XE_LP Global */
>>   static const struct __guc_mmio_reg_descr xe_lp_global_regs[] = {
>> @@ -350,7 +350,7 @@ static const struct __ext_steer_reg xehpg_extregs[] = {
>>   	{"INSTDONE_GEOM_SVGUNIT",	XEHPG_INSTDONE_GEOM_SVGUNIT}
>>   };
>>   
>> -static void __fill_ext_reg(struct __guc_mmio_reg_descr *ext,
>> +static void __fill_ext_reg(struct xe_gt *gt, struct __guc_mmio_reg_descr *ext,
>>   			   const struct __ext_steer_reg *extlist,
>>   			   int slice_id, int subslice_id)
>>   {
>> @@ -361,6 +361,7 @@ static void __fill_ext_reg(struct __guc_mmio_reg_descr *ext,
>>   	ext->flags = FIELD_PREP(GUC_REGSET_STEERING_NEEDED, 1);
>>   	ext->flags |= FIELD_PREP(GUC_REGSET_STEERING_GROUP, slice_id);
>>   	ext->flags |= FIELD_PREP(GUC_REGSET_STEERING_INSTANCE, subslice_id);
>> +	ext->dss_id = xe_gt_mcr_steering_info_to_dss_id(gt, slice_id, subslice_id);
> This seems a bit roundabout... for_each_dss_steering() converts the DSS
> ID into group/instance values for steering.  And then we're converting
> those steering values back into the original ID (which we already know)
> here.  Can't we just pass 'iter' from the for_each_dss_steering() loop
> as a parameter and avoid the extra hwconfig lookups?

It's not exactly obvious what the for_each_dss_steering does, especially 
with the iteration just being called 'iter' not 'dss'! But yeah, I guess 
it is doing 'iter' -> 'group/instance' -> 'dss' == 'iter'. I'll re-spin 
with the iterator renamed to dss_id and pass that in directly.

Thanks.

>
>
> Matt
>
>>   	ext->regname = extlist->name;
>>   }
>>   
>> @@ -456,13 +457,13 @@ static void guc_capture_alloc_steered_lists(struct xe_guc *guc)
>>   	extarray = (struct __guc_mmio_reg_descr *)extlists[0].list;
>>   	for_each_dss_steering(iter, gt, slice, subslice) {
>>   		for (i = 0; i < ARRAY_SIZE(xe_extregs); ++i) {
>> -			__fill_ext_reg(extarray, &xe_extregs[i], slice, subslice);
>> +			__fill_ext_reg(gt, extarray, &xe_extregs[i], slice, subslice);
>>   			++extarray;
>>   		}
>>   
>>   		if (has_xehpg_extregs)
>>   			for (i = 0; i < ARRAY_SIZE(xehpg_extregs); ++i) {
>> -				__fill_ext_reg(extarray, &xehpg_extregs[i], slice, subslice);
>> +				__fill_ext_reg(gt, extarray, &xehpg_extregs[i], slice, subslice);
>>   				++extarray;
>>   			}
>>   	}
>> @@ -1747,17 +1748,12 @@ snapshot_print_by_list_order(struct xe_hw_engine_snapshot *snapshot, struct drm_
>>   			 */
>>   			XE_WARN_ON(low32_ready);
>>   
>> -			if (FIELD_GET(GUC_REGSET_STEERING_NEEDED, reg_desc->flags)) {
>> -				int dss, group, instance;
>> -
>> -				group = FIELD_GET(GUC_REGSET_STEERING_GROUP, reg_desc->flags);
>> -				instance = FIELD_GET(GUC_REGSET_STEERING_INSTANCE, reg_desc->flags);
>> -				dss = xe_gt_mcr_steering_info_to_dss_id(gt, group, instance);
>> -
>> -				drm_printf(p, "\t%s[%u]: 0x%08x\n", reg_desc->regname, dss, value);
>> -			} else {
>> +			if (FIELD_GET(GUC_REGSET_STEERING_NEEDED, reg_desc->flags))
>> +				drm_printf(p, "\t%s[%u]: 0x%08x\n", reg_desc->regname,
>> +					   reg_desc->dss_id, value);
>> +			else
>>   				drm_printf(p, "\t%s: 0x%08x\n", reg_desc->regname, value);
>> -			}
>> +
>>   			break;
>>   		}
>>   	}
>> diff --git a/drivers/gpu/drm/xe/xe_guc_capture_types.h b/drivers/gpu/drm/xe/xe_guc_capture_types.h
>> index ca2d390ccbee..6cb439115597 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_capture_types.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_capture_types.h
>> @@ -39,6 +39,8 @@ struct __guc_mmio_reg_descr {
>>   	u32 flags;
>>   	/** @mask: The mask to apply */
>>   	u32 mask;
>> +	/** @dss_id: Cached index for steered registers */
>> +	u32 dss_id;
>>   	/** @regname: Name of the register */
>>   	const char *regname;
>>   };
>> -- 
>> 2.49.0
>>
>>

