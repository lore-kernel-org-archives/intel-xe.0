Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 562D0C02192
	for <intel-xe@archiver.kernel.org>; Fri,  7 Feb 2025 06:18:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2153610EA20;
	Fri,  7 Feb 2025 06:18:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FgNmAVIR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E583C10EA20
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Feb 2025 06:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738909115; x=1770445115;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=AEsM5aPCc4xw6CIWROrNo5SZg0auMtF4jhommkUU/X4=;
 b=FgNmAVIRiwnz+byYfHKU70HUZBpePhFoyl15f7xW/b7wpYFTTvcrRhiZ
 9Ja6jevYoTQ+djvs1kpTG9tF/8aHBeOIkU5nbfSMiKsuk74t4f5Xrp+n5
 w4GJXTcBTQwHoT6qeZDg6DzSVp5BGorrlXxMWYOvKIbbizWQOInueYxW4
 6w7D2aT8FMAXhajhpbsgSis4fa/SDaJblVyZ8yOQDldqmKnKGknaMX//D
 ieO79XPsWjNOMbKdDjUPaz/LIxKc3YoVz76AJcLKAzpn+2rxzADyEJnpq
 iUvaJLVmktEU3Op9YQ4+/65X7dsjXLnTaaV4UQ3MCZOZcAyjirm2FqvLF A==;
X-CSE-ConnectionGUID: tbPLrDyURHmKYg9bqkS3rA==
X-CSE-MsgGUID: k+/j//QYSKu7qjN5qbI8Ag==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="43465101"
X-IronPort-AV: E=Sophos;i="6.13,266,1732608000"; d="scan'208";a="43465101"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2025 22:18:35 -0800
X-CSE-ConnectionGUID: LFxwa5qjT16XzqwcbbKZQA==
X-CSE-MsgGUID: 3Otvb0SUS+iXEhCtbEs08Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,266,1732608000"; d="scan'208";a="112054914"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Feb 2025 22:18:34 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 6 Feb 2025 22:18:33 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 6 Feb 2025 22:18:33 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 6 Feb 2025 22:18:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A1lz8MMjJO5FUfij/hKDRBcUMqcMdOhOlbUbgqtRel1B1BUBUdOLIGQOzOXJy1IIgAjuu4xto5M53aYLVdY7jrPq5LiQI7p2al0uiHRCZCM9yaTQHI1QlTXkqFXHkQx3sft2KpdNbaKpzsjzfWUzIrwoqg40mGf6sooerLhYYlM7uDKW3ZaNb5bguUcY4LSYvOL5yyEi4vQgdYKV3fJSeRETSpAHT4BTXOzTOuCPOoNezQmk6Rj9Wo6IFnygGXeYXIy8XV9JSynJtvDc7NOx7fCEFOwi7r3E6EBdCHDpreGEkWNr+ZD1q+OZbFOB+3TqBcXsbDLrnbI5XafuM5V4eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DxNiUuvQDBz7C107i4dIvAtfvYxESADmMlq2ROrN98c=;
 b=XzwvcOGawuY8CtkyBFxdic09wQapf4MSwkegJe5/1fBcqdZmQ02im1B16661AAM46ZJ+ndKVEKMt+o4/3k/ngMbFu+zvjxQ5CubQleMnQXkY+VS/3x2n+uajEa95kiRMEUbt8mWoC4w6zWqs1TZ5CxSdxTgn26sTgTCkjSjWflltNNHj9ofqn125ZzeYuuI0dqvLk3RmXatxIF/ilNPTRzOhsrsqF+EFl6Ac/9e9EnVAFzEQ3vEcomGY/7i2CpjByU8irliGEUksIpH5ltJF1AgVBVE9y+WeHwk4Xj2KDZJvBQKXrShBhbU8Vf8wezyPCdQ5Drg7OzD5KLlnG2OUlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 DS0PR11MB7880.namprd11.prod.outlook.com (2603:10b6:8:f3::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8422.10; Fri, 7 Feb 2025 06:18:30 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%4]) with mapi id 15.20.8422.010; Fri, 7 Feb 2025
 06:18:30 +0000
Message-ID: <8ae02a6c-4459-43f6-8db9-95bb9a7cf898@intel.com>
Date: Fri, 7 Feb 2025 11:48:21 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/8] drm/xe/xe_pmu: Acquire forcewake on event init for
 engine events
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <umesh.nerlige.ramappa@intel.com>,
 <lucas.demarchi@intel.com>, <vinay.belgaumkar@intel.com>,
 <soham.purkait@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20250206104358.3436519-1-riana.tauro@intel.com>
 <20250206104358.3436519-6-riana.tauro@intel.com>
 <ad580886-537b-4026-bc64-781efb182148@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <ad580886-537b-4026-bc64-781efb182148@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0032.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::19) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|DS0PR11MB7880:EE_
X-MS-Office365-Filtering-Correlation-Id: bc603de4-e28a-4e7f-ee27-08dd473f3d64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZlppajBqNmIvajJrK1kyWUpXSTZ6cVRDZjV0WnhXL0NlNUpxcjcvRzNGd3lS?=
 =?utf-8?B?RjUzK0RVbmRUanJGUWFnbDYrUHg1eEpEeVptamNHWTZNZmpHajBpZHphWVpx?=
 =?utf-8?B?bW14UFZ6UmttOUsxNk00SmY2MzhlTEFiWmpCUXQ5ejRmM2JJWSs4bmN6aExX?=
 =?utf-8?B?MnZ5N3VNSWpkRFhYTVE5Rkd2aitrUjRDeCtIRUxEUm5xRDlMemhOQXBlY0hP?=
 =?utf-8?B?b01YYTdHVlJjRmhsM0FuU2VHNHFQU0Q0NDFDSmNBdVE2Qk55T1JZQ2xjK04r?=
 =?utf-8?B?TEpHVGRST3VsN1ZBRkE1RmpXY0h1VzcwbEMwQUVUdlNMQ1NWdTVrVDBNcS8y?=
 =?utf-8?B?dXBlZnMxYjRReXhTYUdmZVJXdkVWSFFEOHVoV2pMVmM5SmpIU1FkQjVkRDZJ?=
 =?utf-8?B?TGlNQmVjSCtSK29uMnNCUjBKZ1cvMDNmWUhVeXBOdHpPUzNlMjRwNWRnZXk3?=
 =?utf-8?B?TjJGZXVBajhVZGRISTVCRXllWHdFTERjVUZNeWlydXNZckM5Umplc0VqWTFs?=
 =?utf-8?B?cUVGOUgxT1dsUGpxVXBEdEJITzE3ZlNIaElxY2lqVWxTc2J2QzJOY0xiNEpj?=
 =?utf-8?B?S2QwRm41eHdxamJLM0hzaVNWUjdHbmZVZTZkM1lNYWlNTVlJbEZsSi9yN1Nm?=
 =?utf-8?B?WnJKYXdiR0tuWWVXdnhZa0tHbHl4dTI1REVJZDlIeVVVWXllZHlTbGUyaGkr?=
 =?utf-8?B?bWtCckxBUlBqY05Hc2I0U1lZTUY0V2ZNakdXNDJRWk9PREJob21sYWt3bzhr?=
 =?utf-8?B?NVJrL3IxLy9XM3VOcGVzNmR6RzZKdElveG9sbHd3aEdSelAzbmpTbHVqOG45?=
 =?utf-8?B?OTNRUnpUa2RDN0t5ckhnQWlzQmFBcHRxVWFCQS9FOUVRVTVGQ1FLaFREZldS?=
 =?utf-8?B?L3BmTkVOL251OXNqNmgzMGFFdk5SbXFmSWNMVmNYZDR3enl3WUNCc3Z5L214?=
 =?utf-8?B?azh3WGIvK1J0dkhjcnpUNWp0VXQ1SjE4UGsrMXFDYTU4NkxVSFU5bWhlNzV4?=
 =?utf-8?B?dzE4eUIrbTdKUlAxYUhnT1lpTFpHRGkwVFlIcU8rZXBBbEJiMGFkbjYyOEEv?=
 =?utf-8?B?WjlsTTdDZmFsZUwreCs0ZFJ2YWdYdVJuYkZCdjVycXlLQW10NUJ1TjhONFI0?=
 =?utf-8?B?TFE3dEpYOXFlbWZtZUJzSnFadzl6MTRwNUtUeWVmcXZzTklybk1zdFhnbklO?=
 =?utf-8?B?MGpFT2dYM3FSWUVjRSs0L2c5ajhOTlFIN3NSdWoybm9VUlRVZzRTS29KSWU2?=
 =?utf-8?B?NkZsVWVSNUl3bWRyQUM5TjRqM2JySFZ1ZGZmZ0VYUEVhK0VyZDlKU25hN28z?=
 =?utf-8?B?T0J4VGxybmFiTEsrNXdWSDdTMFc0UGFoVDVEUnV3Z0QrdEttV3pENGhKdGNC?=
 =?utf-8?B?N21lVHppWjE5UEMrZFpYTXVrVC9NQ0hoNXJqRkRJeW9KQnJOTElUb1EwS0Jr?=
 =?utf-8?B?QmswaERBVk1Na0ZvVjlZaG1YbXBmcVhtQ2hFQ2lQUmxORXQwRHJ2VHZVUWhy?=
 =?utf-8?B?WjB3d3grdnlpT2hWWDNEYUdWZFZUNmdHdVNlamZyZFdnVWpPMExqRGxYUEo1?=
 =?utf-8?B?dkxXSS9pNDhFYW1oRDFLQWtqVHF6cHBUdjl5K3g3UFRDV2Z3V2tyTWFpQ2tY?=
 =?utf-8?B?OGlYMms5dXlCYW1mYWVaQ0VITG5NNUZNSlFYVEhlTngvNFNCQzczbW9zWXVn?=
 =?utf-8?B?QmUzMVBqOWt1QXpTckptYVBzcmt4YW5sWnphYmVPRDlrQnJsOHdVMFF6QzV5?=
 =?utf-8?B?emhPYytlRDRDd3RTUTZiYXpRbS9YZWZwQVBKQWk3WTJ0bkxFLzZGUFh1QXE0?=
 =?utf-8?B?MHBJYTVuOTVxbnFyZjBmbE9RTm9tV1d2dDhoZzdtSzVWQzhQdjhhSHpZWTAr?=
 =?utf-8?Q?/EoWKyUtJfdIa?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a1BDeXUrVG81ZFd5MVU1RDJxb01wR3dJSEdLb3d2MDNkakFlMVdqZTJFeXdJ?=
 =?utf-8?B?TTRCbWdJYTQrWU00YURPZGc4Y1IzK0ltMm5VQVhQNU5zM094aWwvVXducjVy?=
 =?utf-8?B?MW9oQy84eCs5b3FYcFhxdjNXYit2bjRkM3RiTERWM2pmd2UwejFKU3FXazR3?=
 =?utf-8?B?cGFabVFPL21XdDRhTVJpZitkWE8rejU5SjlwN3RJeHg5dldrdFgvREdvelR0?=
 =?utf-8?B?LzZzcTFVdU13TTBTa1VGKzZsandjWU1jaElrZVhxYzUwdU5mTnNtSFVjNU8v?=
 =?utf-8?B?Qk1NR3ZTWnU1WndrYWR4YmtmVGMzL1h5b2VkTVo4ek1vUmRLbG9BaW5SRlFI?=
 =?utf-8?B?ZFhubGczK1c1YUE1U1Q4elBlbjUrSGlSUGtrYVNsVGVBNE56RVU0MDh3dys3?=
 =?utf-8?B?TEVGbDZvdEpDTURGaGlyV1g0OHF2aWYrc01DWXM0VUZxSThxb3VYQjZka3Ur?=
 =?utf-8?B?WlZmcjFKZmk0czFaeGZhY3Yxc0ZhazErYno2NW00M242TTRBRVVUSFNpOFZZ?=
 =?utf-8?B?QUhtODdXNzU0UnB1RmxqMHNQSXFJVGVaOHUzazUwVGFPN0R3cUdIRGt2NnBB?=
 =?utf-8?B?bTQ1MHk0OXFrYWxHSy9LdzNZNm5lZ20rRU1rTmxqZUNFa0o4NS9uVkxCeHZP?=
 =?utf-8?B?TlRTY2RUNWhaV2NUUUdTc0RHeW9IL2RVc01pN2pkajlYeXFkR0kxR0paRWJj?=
 =?utf-8?B?NzBZUkJoS0IzNDhHT0FRdnpaVXFVeGY2NTVYaks0NHRQenFlcS9jeHEzT0FP?=
 =?utf-8?B?Ykc2aHpsNm94NTRuOVNCajZwcEIveC8xTGJqVDlKQkdBUWs3YTZ1SHgxVGk4?=
 =?utf-8?B?Q0NGdUVFWXJObzRxenkxRm0rYjVwejFENmJtM3B2SzRIcUNWaGdFa3VGOVJ5?=
 =?utf-8?B?Z1FwMlc1andTWHQxY2pDclRIc3VqM0swS0JTbEdodFdid3pLT3c2dENFR0lq?=
 =?utf-8?B?c2pMemZBdTlveFdwZUJySXdBRFhmNFdLZitWSDhHM24yeURLeXhqcVk5Ulhr?=
 =?utf-8?B?N0ZIQ2g1TjlDZ0pGUkxNOE9FYVJLV1pzYzV0UnlTc0k0Q3ZQT3dLK3pDS1hq?=
 =?utf-8?B?MTJvNGZiM2JtZUZneXhHUEtVd3IxcVFHeVEyT2pRVU5aZk5oOU8rZnJIZ2dm?=
 =?utf-8?B?SEdRSWQwR0xZcFNwZVVLNmF3V3BENERpRjZ2aFVhNmNrZnVQRURZbi9BRjdX?=
 =?utf-8?B?OXQ4c2FGMW5lRDF4YXozY3JGNlRDQWxUS2o1NytwdUM3dGp1TjBxWFRIZmNn?=
 =?utf-8?B?dHpRL2VScFZvUUhLaU5mQzJSZnd5Zm9KT3VSUi95NkNncW8reFBTRWU2UUdO?=
 =?utf-8?B?SHZhV3RsMlo4UDkvVW9tZ3Q5WkpzaElsVDhaQ0ppOTQvZEFXYzAxalVNZDNa?=
 =?utf-8?B?Myt2RDJTTTE1eXFkdVJVZ05EeFZuUDZWQ1FYYmU3YnkwcGFGVVkyaWJJODJO?=
 =?utf-8?B?NWFScE9McGRwa3RzeFJJVVFUd0hsb2x1Y2p6WUN0T25jOVhqVXNnQXkvZGZX?=
 =?utf-8?B?aHUyYm5yekhOaXJaa2pQeFhWMFd1aFhqMmRwUGdmdXlPa1dHcGZlbEd1T2s0?=
 =?utf-8?B?TWREdVg2SUdZdi9LUlpEeHVPYml1eXVjbmRSNGNibCtheE9oZEx0QWRXc05M?=
 =?utf-8?B?Vk5RVTNzbEtWTU5qNU9GYURRN2xzcHNhaStHQVBqQm1TT1pPWFBUVmFNWWJo?=
 =?utf-8?B?cXdubGxOL3l1N2crN1VuYkhsbkpxbHdPUDJ0QXhtYlA5SU5GSG1PTGQwWkp4?=
 =?utf-8?B?OGhzL1BMdmdGT2V2aDVZTHdNQ1FYb21lbU1KWkhRdUJJRjUwTHFqdmpDUmNP?=
 =?utf-8?B?WU9IQ0lxOHZJK3d5bDRTNk5VWUtUTVBGZlRXeXBPZkc5blJlYTRpRDFhdHBQ?=
 =?utf-8?B?VXlLVVNON3ErOFRoZEFEeWg0dnEzaEhlbG9QSEZTMHFkb0x6NXdDOEZwb0tu?=
 =?utf-8?B?bUpwS3Z2RVdMUllsY25CelVBaUhxSktxNDQrbUhoQU5iNG1PVE1QeVJFc0Jt?=
 =?utf-8?B?NWVISkRXSjZ2Qks2bHA0VnhDOUI4SDY2UWJFZUJBdlJFMFIyTk9aTFRnQ0w3?=
 =?utf-8?B?MWltQnFzMzFpUndzcHpQT2lVR0YrenFlTTR1cU9aQy9MSFhYVFJ6T1ZaN3NW?=
 =?utf-8?Q?ZLSAp/Fkd+DI4MPS9h+sgCvmz?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bc603de4-e28a-4e7f-ee27-08dd473f3d64
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 06:18:29.8948 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SMlr8jNKkMsDGUIjduQLbkK7c4Oj7ia/1y0vT0KM7Z++hldIaukxo/aHQ4M9sWv8ZamW4d/1CsQO941nnqJB9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7880
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


Hi Himal

On 2/7/2025 8:39 AM, Ghimiray, Himal Prasad wrote:
> 
> 
> On 06-02-2025 16:13, Riana Tauro wrote:
>> When the engine events are created, acquire GT forcewake to read gpm
>> timestamp required for the events and release on event destroy. This
>> cannot be done during read due to the raw spinlock held my pmu.
>>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_pmu.c       | 47 +++++++++++++++++++++++++++++--
>>   drivers/gpu/drm/xe/xe_pmu_types.h |  8 ++++++
>>   2 files changed, 53 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
>> index 06a1c72a3838..5b5fe4424aba 100644
>> --- a/drivers/gpu/drm/xe/xe_pmu.c
>> +++ b/drivers/gpu/drm/xe/xe_pmu.c
>> @@ -7,6 +7,7 @@
>>   #include <linux/device.h>
>>   #include "xe_device.h"
>> +#include "xe_force_wake.h"
>>   #include "xe_gt_idle.h"
>>   #include "xe_guc_engine_activity.h"
>>   #include "xe_hw_engine.h"
>> @@ -102,6 +103,36 @@ static struct xe_hw_engine *event_to_hwe(struct 
>> perf_event *event)
>>       return hwe;
>>   }
>> +static bool is_engine_event(u64 config)
>> +{
>> +    unsigned int event_id = config_to_event_id(config);
>> +
>> +    return (event_id == XE_PMU_EVENT_ENGINE_TOTAL_TICKS ||
>> +        event_id == XE_PMU_EVENT_ENGINE_ACTIVE_TICKS);
>> +}
>> +
>> +static void event_gt_forcewake(struct perf_event *event)
>> +{
>> +    struct xe_device *xe = container_of(event->pmu, typeof(*xe), 
>> pmu.base);
>> +    u64 config = event->attr.config;
>> +    struct xe_pmu *pmu = &xe->pmu;
>> +    struct xe_gt *gt;
>> +    unsigned int fw_ref;
>> +
>> +    gt = xe_device_get_gt(xe, config_to_gt_id(config));
>> +    if (!gt || !is_engine_event(config))
>> +        return;
>> +
>> +    fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>> +    if (!fw_ref)
>> +        return;
>> +
>> +    if (!pmu->fw_ref)
>> +        pmu->fw_ref = fw_ref;
>> +
>> +    pmu->fw_count++;
>> +}
>> +
>>   static bool event_supported(struct xe_pmu *pmu, unsigned int gt,
>>                   unsigned int id)
>>   {
>> @@ -144,6 +175,13 @@ static bool event_param_valid(struct perf_event 
>> *event)
>>   static void xe_pmu_event_destroy(struct perf_event *event)
>>   {
>>       struct xe_device *xe = container_of(event->pmu, typeof(*xe), 
>> pmu.base);
>> +    struct xe_pmu *pmu = &xe->pmu;
>> +    struct xe_gt *gt;
>> +
>> +    if (pmu->fw_count--) {
>> +        gt = xe_device_get_gt(xe, config_to_gt_id(event->attr.config));
>> +        xe_force_wake_put(gt_to_fw(gt), pmu->fw_ref);
>> +    }
> 
> 
> Considering that fw->lock will be acquired and released multiple times 
> during the put operation, this might create an overhead.
> 
> How about implementing a _put function that can take the number of 
> refcounts to decrement as an input parameter, similar to 
> xe_force_wake_put_many?
Could you give more details on your suggestion? Would put_many just 
decrement the count? But wouldn't that still require a lock? Multiple 
event_destroys can call the function at the same time right?


One thing that can be done is to take forcewake on first count and 
release it when the last event is destroyed in cases of multiple
pmu being used
> 
> If the overhead has already been considered and found to be acceptable, 
> I am fine with avoiding unnecessary modifications to this patch.
This is the first rev for this patch. Open to suggestions

Background for this patch: force_wake is needed to read the timestamp
register required for engine events.Cannot take it while reading the 
register from pmu_read due to a lockdep splat (PROVE_RAW_LOCK_NESTING).

The suggestion was to take forcewake throughout the duration of event 
being read

Thanks
Riana
> 
> 
>>       drm_WARN_ON(&xe->drm, event->parent);
>>       xe_pm_runtime_put(xe);
>> @@ -183,18 +221,23 @@ static int xe_pmu_event_init(struct perf_event 
>> *event)
>>       if (!event->parent) {
>>           drm_dev_get(&xe->drm);
>>           xe_pm_runtime_get(xe);
>> +        event_gt_forcewake(event);
>>           event->destroy = xe_pmu_event_destroy;
>>       }
>>       return 0;
>>   }
>> -static u64 read_engine_events(struct perf_event *event)
>> +static u64 read_engine_events(struct perf_event *event, u64 prev)
>>   {
>>       struct xe_device *xe = container_of(event->pmu, typeof(*xe), 
>> pmu.base);
>> +    struct xe_pmu *pmu = &xe->pmu;
>>       struct xe_hw_engine *hwe;
>>       u64 val = 0;
>> +    if (!pmu->fw_count)
>> +        return prev;
>> +
>>       hwe = event_to_hwe(event);
>>       if (!hwe)
>>           drm_warn(&xe->drm, "unknown pmu engine\n");
>> @@ -218,7 +261,7 @@ static u64 __xe_pmu_event_read(struct perf_event 
>> *event, u64 prev)
>>           return xe_gt_idle_residency_msec(&gt->gtidle);
>>       case XE_PMU_EVENT_ENGINE_ACTIVE_TICKS:
>>       case XE_PMU_EVENT_ENGINE_TOTAL_TICKS:
>> -        return read_engine_events(event);
>> +        return read_engine_events(event, prev);
>>       }
>>       return 0;
>> diff --git a/drivers/gpu/drm/xe/xe_pmu_types.h b/drivers/gpu/drm/xe/ 
>> xe_pmu_types.h
>> index f5ba4d56622c..134b3400b19c 100644
>> --- a/drivers/gpu/drm/xe/xe_pmu_types.h
>> +++ b/drivers/gpu/drm/xe/xe_pmu_types.h
>> @@ -30,6 +30,14 @@ struct xe_pmu {
>>        * @name: Name as registered with perf core.
>>        */
>>       const char *name;
>> +    /**
>> +     * @fw_ref: force_wake ref
>> +     */
>> +    unsigned int fw_ref;
>> +    /**
>> +     * @fw_count: force_wake count
>> +     */
>> +    unsigned int fw_count;
>>       /**
>>        * @supported_events: Bitmap of supported events, indexed by 
>> event id
>>        */
> 

