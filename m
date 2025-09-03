Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E4CDCA1007
	for <intel-xe@archiver.kernel.org>; Wed,  3 Sep 2025 05:49:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1477D10E1D3;
	Wed,  3 Sep 2025 05:49:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BW82bofY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B077210E1D3
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Sep 2025 05:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756878586; x=1788414586;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=GVDVskX1/qLh1+YRkvrj/+kQNB60fo//Piu22JQBVDY=;
 b=BW82bofYxGbUgFA+MPojEH8kz7xtrM0EnpMehc1dC1JJphHUYXxYjfIr
 pYQ949h1PkFYd2y+yEvd4Nj/xSjXYM4Kx0X13CijyULJ0gd5zSNcgzF/o
 olhdu1l4ra16T9khOLRz++QEpPfVkGcDtoqdZX3u7a+4BmLPqlEcAccGi
 PZYvx3nCAagvcw9Aw1hLu18ufSM3VgCggi9hNjqQoYtzQOpLvyTCPM9DU
 4TmTyr10I5Yd45bJubSlfDziadqzYdCwmLqqS0MR8iJfeXLINb9q7PGEn
 duojY37pG9VQJrW+JlPC9R9N1LPqD+LqQO8sSFi+7Ck+GvRLTIuS0DO0l g==;
X-CSE-ConnectionGUID: YTNh4oJTTpe3nehibeMpow==
X-CSE-MsgGUID: L+cyfPvMQFuJeKpIKp6bsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="59294483"
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; d="scan'208";a="59294483"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 22:49:45 -0700
X-CSE-ConnectionGUID: R/gjJh3wT1yoyqr/1bKPFA==
X-CSE-MsgGUID: 3ixOL7B4SrWHo8q2fyyUfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; d="scan'208";a="195131594"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 22:49:45 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 2 Sep 2025 22:49:44 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 2 Sep 2025 22:49:44 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.83)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 2 Sep 2025 22:49:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o6h4n6OnI0/PvfslH7nFtCXy/IgvZKFe4c/IIgo3ideAUX4oGqnLoKod6sYrz1tH5xbnmpvEw36Q/qPFc3h2LNNz7x2f6yIQHaIsZvPEI+PjJblmWtehnCUfFp0cGeB56LHguMH0m2j5RmBvM26KwyKLZxaw21T35m70dPEttFh4OreCDT9CoRn0H/JzBg0eBpNKIkCPu0ZSDxSkjhKStoqlBQwDQHOKNPJTjrad1Fz3Odaacl5+CP7Ee7CHgvwu7OMMcutSt1ePkYJOQWAsGWZqcB6htBx7eBSQq0WWR/FStTOmrpSYlseWNKEh7ygFbuFkJ7tRBBSx5dPUGAxKNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2B3T2EMBusZNm0KykBlrZ+3dl1nNHqm0G2SKSJDxQgE=;
 b=GBOaBv5lhBWHHoTxPdaR1MFEBxYODvwVn3qcOfTJG1i/rK8eUik+QzKnJpFeNjybbbUpiBa3IT5ElLpu/hzvDLXMOpGpAxd4kda5HHi2Q3uJar/CbDQtyjNHvQW7lCAyAbOj2Hzr40igcN/bbc5P4iI1yjuZnuHtiEaX0O6q8q5YoUB0ABGaa0hzy30+ge/vz12O8cw/wwhS+MI7z6ilt9psLORXTp3OA7djakOv5nFiA+fxF9z3TzI+YrtwBKi4L7JlL3u4RKQ2inUNW0n5dtPJFCCREA7SO6atio2XuCduqG6Chx98XR1XqoMnR12LQqTMNiB2d7J4SlJA3v3K1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by BL1PR11MB5224.namprd11.prod.outlook.com (2603:10b6:208:30a::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.17; Wed, 3 Sep
 2025 05:49:42 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%5]) with mapi id 15.20.9073.026; Wed, 3 Sep 2025
 05:49:42 +0000
Message-ID: <2f87bc32-f43b-4880-aae4-bce73778d9a4@intel.com>
Date: Wed, 3 Sep 2025 07:49:39 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/xe/configfs: Don't touch survivability_mode on
 fini
To: Riana Tauro <riana.tauro@intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>
References: <20250902131744.5076-1-michal.wajdeczko@intel.com>
 <20250902131744.5076-2-michal.wajdeczko@intel.com>
 <qeq32k6xksjwzg7saglvxlodqxkr75mofjnmfv2bx2dzanciol@2c7ouidjtxly>
 <12059b2e-e91b-4db6-9602-ac2b09b460b9@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <12059b2e-e91b-4db6-9602-ac2b09b460b9@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1P189CA0024.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:802:2a::37) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|BL1PR11MB5224:EE_
X-MS-Office365-Filtering-Correlation-Id: d8a05934-6178-4e7f-2cab-08ddeaadadb6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TGIyUXRpOGJ1T24yYzU4eUorSjdZR0J0UFd3WEVIL3FRSzJCWEJlZnFqTTJ3?=
 =?utf-8?B?VjVmTFFQcVZ4S3RmVGtVWUNkMFU0YkxoeUhlcUFHMFVweW1UZHYrTDY3eGlY?=
 =?utf-8?B?U1BWYnNYL0x5a0NaZ0grVVlPUENoZDVjRHR4N2g5dUZUUitUMEVzV1VMaG9X?=
 =?utf-8?B?U0I2NUNPeVRTSmFTT0wybENYa29uK3NVbGYrNERLOTNpR1ljZ0pYaEpVNlAz?=
 =?utf-8?B?UlU4aklMQzU5ZWM0b1AwcXlHUHFUSUhyY0hNZERINC9FR1JseTBpMlFORVpa?=
 =?utf-8?B?d0VzUEQvemdqaHdNeDJKT0FVT0l1RHBqQTJ5SEE1VUdpa0NVeXYvSHBDU2Fl?=
 =?utf-8?B?ZHhzSkxQN0xCcVBCcmlzZG5PMm5vaUJleG8wK3locFNyYWlPWm1Ob2tvanlY?=
 =?utf-8?B?eDFDQVdhcWgvUVhKT3NaUWxWN09tdGJlRGRkdTA1d0hrTThWT0FUVFh1N1U5?=
 =?utf-8?B?UEg4SmlQejl3OXBtQWp4MlgvNnNkUlI5L21EMjBGbUFGM3hOKzVFaENrQXdL?=
 =?utf-8?B?VW1XT0RZNHlsa2JGMTJkUnU1UzNmbnFWMlNBaitLdGJHNitidUpEUENXMFUr?=
 =?utf-8?B?elQ0YzlQM2JpUm5HTE5vNjJmdURBZmxQK0owVWliY0dqb3JtNUoybDBuNmxV?=
 =?utf-8?B?ZVZBNGFyczFlc3pBWk43WFJpMVZFeHJvSVhRTnZpd2xHV054U25LTkREa3k5?=
 =?utf-8?B?UGxvRm95L0JzLzcyYm9mK0wwZU1KblZVbFpBQTZCZzFtSHJJbGtaTURIcUFy?=
 =?utf-8?B?M3BmVC82RGZPQllqY1o4eDRMcjZ3b1lzcGN1TDYrU2tkZ0pqL1IxUEFlZGx2?=
 =?utf-8?B?K2wzU2Mrb0V3L2VDNVdWTWZFb1JWejMySXRqRFhDNWNxZXpENWZKb2RKZU9i?=
 =?utf-8?B?bWR5UE9UUC9JTGR3K0MrZW1iaUdBSGo1Q0VxR2FnVVVhWURraDFjUmorTzlq?=
 =?utf-8?B?UENZblJadVEwdWN3dEEweGpiTEtKUDdhNmdGYUx3MHRsdHJteFVCT3NSZ0tm?=
 =?utf-8?B?ZmZHTWw5S0ZLMENHenhFVVFNRmo3NHJjTS9kNW90SVpJRmZOOEVDYkY2aDBW?=
 =?utf-8?B?SWprbTN3ajdRYWoxVm1HakVRU3QrTU1WYUhWUHMremVYZVZrWlVoTC8rcHY2?=
 =?utf-8?B?b0NIYVVXODFSbmZLdTlNL1JLSlBtR3ZpYUdSRFFWYXZuS3VmZVBpSkh6eS8r?=
 =?utf-8?B?M28rSVJ4SUVlTXRDc1BzdThHSFhsR2dxbnRjWTJTWXFYKzBZSDg2ajMvbnUr?=
 =?utf-8?B?T1ZOdmxRWlFvSzdINTJ3L0JGSXk4TmRLamovSnBEeFlHL0lYZWh0SXBQOElL?=
 =?utf-8?B?ZCtEdGhoZlF3TmhkZnZ1aHFXTFRtVzBLOUxOanFzczBuSlZadHVFRDNSbWVZ?=
 =?utf-8?B?aW5pVXpmdEJMa1BYS3ZCNzE5S1Y2SG9rMzRVbVN4eHBUUWg5by90R3R6TTRs?=
 =?utf-8?B?Q0MvN1ZnUktEeXZsN2c1ZWlTcWVBZGtEbWJGS2xqVkROL3d0WDZoU0RLUVZV?=
 =?utf-8?B?NWtjSkdacWFoQThRU0h3VVovR3JZbVRZbk9BY2dDcEovS25ZTmlNQ0lwbkcw?=
 =?utf-8?B?WG13RE8ydDd6SzBpR00xamZiQlQ3YjlsK3I4TE9vdWRiQnh6dXBzR2dpM0R0?=
 =?utf-8?B?M3o5M0x4cWJYNUNJekVUUjhscXM0T0pwV3VESnlBLzhUaWVXSUE4NnV4UGVV?=
 =?utf-8?B?VjV6b0R2ZWlHM2pyQzZKYXh5d094aUhaVktsNFp3NEpCbVI5dmFXSkVaQklp?=
 =?utf-8?B?SkRTSGhTSEhrK2R1ellWVy8xZVFOeXU4MHFNaVFRQW5qK3laSGdja1dRbHRM?=
 =?utf-8?B?b05TUlNDTmpqRndjYkxIdjVBVzc2cnRQQjZhMDZYaW4xMHVoQkN4Y0RMZ01a?=
 =?utf-8?B?TkxLSStTNS9yZ2VCTURmL0tyTDNUUURHVEFHcUs5QmJQdytCV2libWdFNC9Q?=
 =?utf-8?Q?gi2SNsyxVbQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MVg0Y2NDVTFUWE5HbVg3UWVDUHhzMkUwWWgwV21LTWRncm8yRjFtODcybmZS?=
 =?utf-8?B?NXgyVUo3bXJRUjhZamJiK2d3bUwrcm0zTWsvZ0I4TVNqTXJJbXNpUDdaYlcz?=
 =?utf-8?B?b09qZUUvbWk0ZHlnQTNDUEoveTE4Ukw4dTNpWmlkZkRVdGI1NzU5MUxNQjV1?=
 =?utf-8?B?L3BVK01jYmVIZTFQWlQzMEhBTko5TStEMzBTL1BBVWVBeC9rR1kvUXJxRDEw?=
 =?utf-8?B?Mm9aNWRGWkV6b2phNk0vTWhVQ25nak03Y08vaEtURE1WS0hqeGF6eWdMd203?=
 =?utf-8?B?RnlXOGo0LzRwM1FzTWdlZVhjMHREMG13djhaUjRmQXU5eU1OMTNQdFRGZ0I1?=
 =?utf-8?B?OGh2NnFTamYxaTF2RVZGRWQ2Q0JackZsSWRqTzBEeUVlNkJGQnBwUytqT1FP?=
 =?utf-8?B?UG45U1ZXbEtzbVR5L1BxeGhwU3VPZ2NwNXFiMFg5SExQbjZNcTNkbGpzYk12?=
 =?utf-8?B?YnNPRDdWTko3bnpFV3Jia3RwcjJJejFRRFZ5TVF0cUxXVUs4aG5uMHNneDBs?=
 =?utf-8?B?dXhBVVl6cHY5czhVV1VwNUszU1NsektCd0tac0JhcmVMdldHaXBnUjg5NlNY?=
 =?utf-8?B?eDRTVUJ2TkJnREhEQU91VXczdGNpaFhEaWcydW5OakRaazVHeDdVQ1FwMVdT?=
 =?utf-8?B?SWdyUlNEUS8wZVpqdlA2ODBGUG44eDh2K1BmUVJ1MjQ5dzV2WDZ1YzJ1NjBv?=
 =?utf-8?B?Znh4UHJOS0tyVWJDRnVUalVoNjNTNGgvY0c2NzFaUVF3aERjQTRqWVJMU2py?=
 =?utf-8?B?NkJEdldFM0RaNXVKcGFMZ1JJQzNQWHo2Z3NLVTJnMUIwQ3NON01WbkQrbG9T?=
 =?utf-8?B?T2ZYRHNDb0Z1RVpWVFdCVVRVSThwU0dDQ0ZzSHVWbTQxZWpPZWVHZ3ZVcFZB?=
 =?utf-8?B?UkhxR1M5MzV2UHZiRjFWZ2tqd0Exd0FpODJjcEpVN0pYSU55bXhxV1RHbXBj?=
 =?utf-8?B?OHN1UkZDSEZaVXRYcjhVOWlvZHpEVGdwOHovVkc5Q0xHVGJ2UWJqT0lKTFNP?=
 =?utf-8?B?SDQ3VlYvK2cycE4zeDlJak5FRHplck45YlVNeGxiL0VhZ0VZU3FMMEE5eTd5?=
 =?utf-8?B?NjRQU2JIWU9hVlVOaXh1VEs5dDlna0Y5L29WNG1IMUFrUndOOW1nM2w3cHR4?=
 =?utf-8?B?bkhCdVlJeXRrVHRIOU9wdDl0STZJOFVyTDU1UVYxSUpuK0hvYVEwMTRXdGZs?=
 =?utf-8?B?VmI2S0taalgyTDNVZTFZZmdVOG9rdGE2Wk5EQW9TNDExWm9CTE9WWUJyd0c3?=
 =?utf-8?B?bWdnNXgvQlNVQVJyNlhHTnZES09qK3cyK0M3b0JwdXN3VnU2bkJOcGE2ZnhN?=
 =?utf-8?B?RkRvejdrM3Y2dXM3Yjlid0dRK3kwcGZza3hvNjdCcU9KY2x3bTIrQWFpWkdw?=
 =?utf-8?B?YlMvK3NKc0JDd2wwWjdBZi92aENzNGN6WWVlcGg5YWo0d3FCak9MRnAxajhs?=
 =?utf-8?B?T3N0L2syMW5tamZJam43aGc0emg5ZXYyV09oSU1zOEx1WE5aNHROVkYyQjkr?=
 =?utf-8?B?RVg2QWRxTHk0b2Rob3JER3NRbmlaRjJhSmc4bDZiRnBaeWc0c3NUWitKQkY2?=
 =?utf-8?B?Wis4K1k1RjZucXp4MktZQllrbXpISEpUMHNHaXRuR1IzRy9iOWdzc2N2aHRo?=
 =?utf-8?B?MmQyTWh0MUpjbmpkRFh1YmxPbFM3ekdBRzlmRHQ3eXh2U1pWazE3QXhCM2tL?=
 =?utf-8?B?a0FzRC8wVzRrcXgwRHp4Rm5sSHJycFZqa01xbm1nMWNvNjBVRENJODdvTTRL?=
 =?utf-8?B?Yi9pU0Z3TjJHalZ1Qm9aaVVZb3RyK0ppNDc5SS92ayt2TE5hUFZzd1dDcjB5?=
 =?utf-8?B?L1pHUERUYUlINnMwaDRhMnYxNERqSkE5YTZOcTZ3MitJUkl1TlAraWU4Vmd4?=
 =?utf-8?B?V2dSckZjNjNiUSt5NDl6QnR0aDFsclZqNmgxT0FuVzBDT0UyVlJyZk9yVURF?=
 =?utf-8?B?dG9UYmNkUG1lZ2FNeDREMHliVnBoUDJIUU1ZR0FocWEyaDYxTWxVc1VLUlMx?=
 =?utf-8?B?VW9RRWlPTHZUdWFoaGpBdFo2eHBHZ3czM1kzQjZycHEzc3gwTzdNNXFMOFNS?=
 =?utf-8?B?K2RKNFJnUEdTYXZXWVU0STRVSFI4djJaTVZCb0huK3g1aThldGdXNVY0d1pZ?=
 =?utf-8?B?NVRJQUptbklHc0ppVUpQMUdFY0xTb2ZkUW4zTU5MV1RvdTNoSHI5ODIrL2Vj?=
 =?utf-8?B?dkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d8a05934-6178-4e7f-2cab-08ddeaadadb6
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2025 05:49:42.3392 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MFoVjbrqvgRsu6h2C9xX/lTsUMQVmoBLsgfVu0ITf9bwLahyvXQoO7TBWOLl6lElF29BSMdifale3sdIPfktuvrH6GSQ3BOpfvN4ZHOCMeE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5224
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



On 9/3/2025 7:39 AM, Riana Tauro wrote:
> 
> 
> On 9/2/2025 11:34 PM, Lucas De Marchi wrote:
>> On Tue, Sep 02, 2025 at 03:17:42PM +0200, Michal Wajdeczko wrote:
>>> This is a user controlled configfs attribute, we should not
>>> modify that outside the configfs attr.store() implementation.
>>
>> agreed... this was the first user of configfs and I don't think it was
>> the right to do it. However for such a change we should propagate it to
>> stable too. Riana, any possible issue in userspace? With this change
>> userspace should do a rmdir() before proceeding so it drops the
>> configuration.
> 
> Survivability mode is enabled in early probe and is used for firmware flashing by admin. If this is not cleared while exiting the mode the driver keeps entering survivability mode on every unbind/bind till admin clears the mode in configfs.

hmm, but shouldn't driver enter survivability_mode *only* when there were some issues?

> 
> rmdir is general and can affect other entries. For survivability mode,
> it's better to retain this clear.

but it doesn't have to be rmdir

mode could be cleared in similar way like it was enabled:

# echo 0 > /sys/kernel/config/xe/0000:03:00.0/survivability_mode

and since this user controlled config entry, I would let the user decide when to turn it off 

> 
> Thanks
> Riana
>>
>> Lucas De Marchi
>>
>>>
>>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>> Cc: Riana Tauro <riana.tauro@intel.com>
>>> ---
>>> drivers/gpu/drm/xe/xe_survivability_mode.c | 1 -
>>> 1 file changed, 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/ drm/xe/xe_survivability_mode.c
>>> index 53c5af4b810c..79426ea46861 100644
>>> --- a/drivers/gpu/drm/xe/xe_survivability_mode.c
>>> +++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
>>> @@ -180,7 +180,6 @@ static void xe_survivability_mode_fini(void *arg)
>>>     struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>>>     struct device *dev = &pdev->dev;
>>>
>>> -    xe_configfs_clear_survivability_mode(pdev);
>>>     sysfs_remove_file(&dev->kobj, &dev_attr_survivability_mode.attr);
>>> }
>>>
>>> -- 
>>> 2.47.1
>>>
> 

