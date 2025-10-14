Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B62ACCD193
	for <intel-xe@archiver.kernel.org>; Tue, 14 Oct 2025 17:29:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23DB110E159;
	Tue, 14 Oct 2025 17:29:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IQp8wUIS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0732810E159
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Oct 2025 17:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760462946; x=1791998946;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=I1WZsgddRMt+vFMXmUgFMNob6VCv4gG7G6/4UtvCueU=;
 b=IQp8wUISuvp/dunj/rXzunPclyVjgZiieOAuz8cHxgqeaDLq0UJW7X7M
 nxteXVUJMKWKScAg3RvgAiFrnE2d7fenBb0SZb69V/uW7arH0YkSUv6wh
 mAKRvfRgIMZCNh56DfXIvwml6z0Qi9YF5PyZhrUjIK9Kju6B93yORRhOm
 u+hmsBnIEB5Wl3VLgvShIIbpm5SXpDHqzlpFU7ze9kHvAHEcn4NhpLOx6
 yjmaQHH88d3t++PVb3+HbGySQRlj/Cb4sDJIShRLfU2P10gkGcmLnpmK0
 Jax1Ed/X4oRBA0/BD3skAl864Q47yMtWsqi/JdhGmea8tXerivGE1XDu8 w==;
X-CSE-ConnectionGUID: OgtMEpmMSgqeNLZZYmkyyA==
X-CSE-MsgGUID: fOinpzqzRLm0OZ+TVIGK3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="73732032"
X-IronPort-AV: E=Sophos;i="6.19,228,1754982000"; d="scan'208";a="73732032"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 10:28:50 -0700
X-CSE-ConnectionGUID: nqm16UXHQBKX5A05i4tLmw==
X-CSE-MsgGUID: 0YgdTyDTQh+utxxlIg/3kQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,228,1754982000"; d="scan'208";a="181625062"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 10:28:50 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 14 Oct 2025 10:28:49 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 14 Oct 2025 10:28:49 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.5) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 14 Oct 2025 10:28:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XY/FsrXIbD4/L07nAXprZsgNtm5O85a6Mwbo76EZsBhEh8Ky3UzJKBCGGessbW7DSoyxGJ5l3KKaExHos91HXeQU8ztgtBtgkQViStNSAglbXa5hWxZDztM1tiSzGvLIdfosO2ufBHp3Np4dybwYuq9hIBOAyzxT5Sfnc8dNykdkzN3ofEaZVZSBLeGhdYaUdsz+kVdy9RPpabXsKJUv82B2njnEWkhMHOr0cJipcW3GO52WfxZsRROIouyXJnW84nbc8xjtwy9C4qYFgxgw0NKZxipEbCsP1kuGJb9W3o/3Kj/2W/hNMY8udL0doBp2woywn66gEhQiz8X8LR/Leg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=82/rR1I8cPzn8zU4w9tyhK5CrCUATl+mUN6AgIRNWHo=;
 b=ePQJNjgjDKu5BfkF2wkEwrSwj5UVrVgXCH18Wc1DF3yLlqP4BfWYm1vSFnQ1qpOWpLO7CvRwN+om+r6YhqRiNCRyNHRC+uPGtvXMLF5Cia4Foj8jcgfY3qWMU2bAjc+Ws0SgZmhl1rvBenAoFW6PtoQ2Ay7LWuB39HVaFx0+EHaYI0sVPFo6f89IH2Zw3UidBqp7a0piHKiAVeQ1o555ljDrmIFF45g5zN40bRosD7OZvDeRjEcW9gyid7/s2WHnEJpGLz5rwzAuY5gG8RZ1EDF8SHZXVvyY/FO6S0Fw4HevoNOWgeCxx4GCt0CfvpDADsEEEjsY66kLBOhpr1t6FQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by DS7PR11MB8781.namprd11.prod.outlook.com (2603:10b6:8:256::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Tue, 14 Oct
 2025 17:28:46 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9228.009; Tue, 14 Oct 2025
 17:28:46 +0000
Message-ID: <bb9ecccd-0d56-4da0-8130-4619b03a515a@intel.com>
Date: Tue, 14 Oct 2025 19:28:42 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/7] drm/xe/xe_device: Reintroduce xe_device_get_gt
To: Jonathan Cavitt <jonathan.cavitt@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <saurabhg.gupta@intel.com>, <alex.zuo@intel.com>,
 <matthew.d.roper@intel.com>, <rodrigo.vivi@intel.com>,
 <tejas.upadhyay@intel.com>
References: <20251014164758.125598-9-jonathan.cavitt@intel.com>
 <20251014164758.125598-12-jonathan.cavitt@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251014164758.125598-12-jonathan.cavitt@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE1P281CA0280.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:84::20) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|DS7PR11MB8781:EE_
X-MS-Office365-Filtering-Correlation-Id: 629c7b2c-9ba0-487f-43f0-08de0b472141
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c2xhSUQxc0ttZW5TN3RjM2R6MW1PNmtPdW9oTlIzc3ZtTUdQQzVDU2Jwa2tV?=
 =?utf-8?B?Q1dYTVIzUGZFOFVxK08zdGxIcUxJcitCb2czdHl0SndDblFsSEpNR29KbStj?=
 =?utf-8?B?emNleTUzNlBmcUhqakdFNG9MMEkwZ1pQOEFFYUlrR1o2YjV2MWV4SzZ3UE1D?=
 =?utf-8?B?UmJOZVgzNWZMMjA0WmVwck5IcENVUHczSVkxSWJuWmlxT1Foamh1dWFUTkJq?=
 =?utf-8?B?ZXpXZnlOM1JRVmNXdDU4NXBZTmE5RzlNYU5Lb3orQ0x3dmZKSzdkSWFra3ZC?=
 =?utf-8?B?bWYvU2hjOWhadC95VGUyd3lxQ0Z4TzRWWVF2VW1VczF3NTI0TC9iektsMUtz?=
 =?utf-8?B?eTNadGMwNTdVK2FjdzlwUmJJbGFtc3lQRnR0ZmlpeWZIRmtoWHFVQmRrWlAz?=
 =?utf-8?B?OHNlOUVJOGlscktDL1IwMnRUck44TlY5S0JDZzkreFhYZXhoOGVUcjRweWJl?=
 =?utf-8?B?cE91TzNvSzVEdmpzUndOWHZaR0FSaUFwR0dJbG5xeHJ2WVQ2SDd1Ym0yQTNx?=
 =?utf-8?B?c0RZYndKeENibU1jUUVCcGZ6dHpuYzJyTnhvbGl0SXRSbkJtbWZMeDRHbExl?=
 =?utf-8?B?RUJZak5CQnVic3NrbFEwRmQwR0poM1F1MDdTSUJUci9Ud1NBdERaQm5QZi8z?=
 =?utf-8?B?cHRTdnV6Q0hONVV4NjRrMkRESTBGVEhLVFhraEZjNmpqeUJZb0FGZll4blpY?=
 =?utf-8?B?UE5vMm8zVUF4QktmTGp6S1lTWDhaNjNtMmd3SHNod3hDeXd1QXd4M1JKa3hQ?=
 =?utf-8?B?aFdTN2FsSjJxNkVkVmFCek5XdjI1eHdtT0FQQlNYdXY2OWxIRWh1Vmh4OFVQ?=
 =?utf-8?B?TE5IVVRRS3I3TVo2eWNhcGRiNXNWRTYvRGlpRUh2N0U4Z3NJNmdyOGU5Q3ho?=
 =?utf-8?B?Q2ovUElWQ3FyR2xmazkxdmJVYnluSFdyU3B6S0hGMWJqUnc5TjVTVCs3Q3Q2?=
 =?utf-8?B?MzBUZEhyakRBUSt2a1VvTWVHZU5lNlFkZStwYlZSeVRZZkgzUWVycXlJZUJr?=
 =?utf-8?B?azRXSHBMYXFqbS9UZWJmclBKUWFmMGFYbHFucmlnMDF2N1FLTjdRSEFhSUZN?=
 =?utf-8?B?TkRLVkdscFh4YitsZ3VrWklCZWtDcndkUjNJNno4cjNqM2l4djhnYks0dDZ2?=
 =?utf-8?B?NkVSYkFnQzVibkF0RHhCZ3d5VTBFV2NVUkgzdldmTHdnK3Nia1pMaVlueEVk?=
 =?utf-8?B?a0IwdGJIZzdOcWwwR2NXK1A4ZVBXaEh5Nno5V0M3V2RZZHQ4a2ZEeW1Mbmta?=
 =?utf-8?B?M3pEbEErcWEycldIUG1hQXFvcDNsM0JxbGxza0tsRjdqVEJVWlZVZXppSFg2?=
 =?utf-8?B?S2k4dU05R3NKMm1DaDNLRkpnMXdQZUxKZlVYRE5tcHBXQ0Rjc25sRTc2NjRh?=
 =?utf-8?B?K3hJUHF4ZXZOWnpmdXdrMGlCYzJLbjZxSi8zWERKR1BTN2prVDFzcXVQOG5i?=
 =?utf-8?B?QjB4cjlpblY1V2I5aUR0MU4xZC9nMWFQQWpaTEJqM1lYbFpRQkxCYm5YcW5H?=
 =?utf-8?B?M3B4b2FqWVRDT1ZDdFZrWVU2QnprMlE0TEI5ck5qaFM3VkM1Q20xVytYNldm?=
 =?utf-8?B?RFVzL2R4VmhvclY3Mm1SQXdMdHIxS3pyYXFyZU5mQW9meTVSVXdBSW9KRUpw?=
 =?utf-8?B?cTlmOEdIOEZ0bERpUTlTdnBFTlZZTzRvY2VWK3NGampQWkZqWjlhRzArL2dl?=
 =?utf-8?B?c3dxZit6MkxkS2ZPRjAyS0RzMVN5aHBhNzkvMm9qT0FIdEVXa0hSWnJTeEpD?=
 =?utf-8?B?dG1tVHE5R09sMzc4S1lUTUpGQ09XaU9kZWJwYTJEcTBLY1ZWc0pWZ05BT215?=
 =?utf-8?B?RllKNW5HNGRmWkg0VitNQUlQVlBBYmtLVkhHekFzcU44SGw1ak1kN25sUDdE?=
 =?utf-8?B?RVJ6aGxMQVFsQ3FBS21DSWF0cW9OQ2lVZXh1Nyt1QXFMaTI1a3RCT3l5SnN1?=
 =?utf-8?Q?JfgDy222PKSfhuDgjLZj0CFmR1v6iBtH?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NHNudXpPSmswSk9lMTBSM055bGFjQ2FYUGZ4K0F6ZkhMTUY5dUlWYXZrTi9F?=
 =?utf-8?B?blVoMGQwa2tQMlJyN3BJdzFvTjR4bUNXVVk5elFKVGp6SDVaNWY1ajRnUFlh?=
 =?utf-8?B?SlczTG5DTW1aQjB0VUhGQmNZOGlqNVEvaWFkMmR2VHk3WVB4WEVOVEpUVVdC?=
 =?utf-8?B?bUdEQlRoWFA0YlNIbEZ1aWsxR2lDZnFOWjh5V1UxKzJqaTcxcTU1NUpDNWJh?=
 =?utf-8?B?N2M3MGV5Y0FiNmQzZG5DdU5OTzBOMkhHRGROUElteUtLRVFia3pzY3J1VUVy?=
 =?utf-8?B?QVU5cHpzQTZYNVduTHo0RFM2MkZZY1loYVQvemZia0ZVcUdJcExUc3UyS0Vv?=
 =?utf-8?B?blR6U3dLc25SNEJ0bGpaeTlnRFVHV3hBNWNCeWx0eDYwOFR0U3ZtRW9JTDcz?=
 =?utf-8?B?Ynp4b21XbWF1REZvK21xbjh4YTRiVDNnTVM5UFhuajdtMGV3eVp4SWl4QkVN?=
 =?utf-8?B?dWtEL2NTNmNJdWtlaHg1cGE1dlpuajVZMjFIaDJSWWRqMkVES3dxc1pNdm9S?=
 =?utf-8?B?b0RMYjB4NXpJT20rdWJVdDBObzBLZGhVVEM0cklydVhOWW1DSnlLdUxNZWZR?=
 =?utf-8?B?Z3h5Si8yNmxsUiszRmZ4SDh0cC9leXNWZ1JwZ3lncnVndUVLc2VvRWExSUQ5?=
 =?utf-8?B?SDl4NlN4L3BMWlhCbXB3ckF2ZG15N201em5CbUQ2dHZEUjVFeTB3QlY1R2xL?=
 =?utf-8?B?WG9HdllBVTY2TXpjZy9nV3hDMkp6eEVadlNsM0VBNWd3RmhJQTlLR1pnbzdW?=
 =?utf-8?B?Wmx3eWJUR3NlSWNmeW4wTGt6Sm82cGlDdjQ0MDE5cUkzcDF6WjhFR25lYy8w?=
 =?utf-8?B?amRqYTFHR045bzdEK3BhaEZxdGVaNVBVTHNVN1hwS0hsWGhFTm1EeXBzZjk3?=
 =?utf-8?B?UkVBQzRVNXdCNEFUOEVWaGhMSHdWdXQ0U3RWUU5rUDFkTkpKL2U5Zmx0cTRB?=
 =?utf-8?B?N00rWnZoRXY4Z04xTVR2L3VseUtCVTc5bGp6UFF1dUpBRlZKVFlTak9RZFVx?=
 =?utf-8?B?NUoyakt4dTFNdTJVZ1FlQlFnK1RKaHNDMHBTbk9OdWZ6K1NGVVB5VURrL0Ro?=
 =?utf-8?B?cjNkc3dRc1FyakY1eTkwcnVBQnVrUmQ0RzdUVnI4bTgwUmc2TERLMlB1Ulhp?=
 =?utf-8?B?ME91eDczQU5kbjdDZWs0TXB0NFAySEJPOUptZWlka0NaSnNTbmRlUUlVUk1T?=
 =?utf-8?B?NEdCbjQ0UXFDYnJlNkxTTFZoSmtsdnBBaEcxZGRzY3llY1FVdWFicitYWmhk?=
 =?utf-8?B?cHdQVGdncjdELzZCM0xtampYbG94Wm5UejJkeGhZWVl5SmhVVEdZWlRmNFBO?=
 =?utf-8?B?TzZSSmRSc2ZtT2dIWGh5SWh6ZFVJRXZKTDRrRUdiT3NNaHZtSEI1QlRNbUZC?=
 =?utf-8?B?MVFXMVU2Um5UNDAxdHB1aEVOZU9DdnNMdEQyWHRQMmVmNWNaVUNLR1lrUTJR?=
 =?utf-8?B?WjBkejR5OGZlYXN2bURBR1dkYUdYKzdNUHFCWklJMWFLcVJvZDlGV2hCWjY0?=
 =?utf-8?B?SnRLREdjUldTRFY0amlEK3NWZ2pWVWZxVGl5bmtXSTU5bDJXUGZERmxrNDdQ?=
 =?utf-8?B?UnlYZFhxckQwMmRiOTFrYlF3WXlhdUw0QnM2M1E5cSs0RVo1bXNqU01mRlQr?=
 =?utf-8?B?Yzh6Uml4Y0ZSQUFSTU02VWF5SzBWNEpER0JLTDd5WWpXeGFwVHhpanVJc3hZ?=
 =?utf-8?B?WWg3OEpncHZsM1lqQURRNmlKYzZELzkxSlVMUXZGbmFqSzVOdFpncXkzblFt?=
 =?utf-8?B?OXVhU2t6YkZHZjAweWp4R2orNTJYTG1UY1ZVbDFJWC9sQTNnODF5bzl4RTA1?=
 =?utf-8?B?R09uQ21qZWFoa1pyeS9kc1lsdk9OODRTdHJoUFdlb0IzanE2anI2VDBGYXdp?=
 =?utf-8?B?ZmJzSThFWWUrMTMxckw0a2pFd0Q2LzZwNlh5ekp0UjhCZDZuTDdFSlhPWmVR?=
 =?utf-8?B?MEFyblVWVlN1cjJEcmxyMHhrUTBSZTlUSkxLdm12OU1uT1RjOHFBYzBUUkph?=
 =?utf-8?B?UHN5aWgrUFZzNGdWSnVvZFZPY3cwcUpMaU0yNWNVRHFFY2RINHY3azdKSEtK?=
 =?utf-8?B?Rzc1aE05cldwcXg3bkdGTE5ZenpQRnJhMnVobklLV2MrL3JiNEdTUHp5NnFx?=
 =?utf-8?B?K3JWRDVYWHV3dkVIcnZZd1NadXhMZE5OMzVOUTg1Z3FsQ0wzQUtUQngycklw?=
 =?utf-8?B?YVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 629c7b2c-9ba0-487f-43f0-08de0b472141
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 17:28:46.4629 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fdyjE4xzwqIaJJaOGFc0/aJ8wEQPsRBwlB6wSY9bbAAqCUkbTIWi2FTqNZlau1W9dj/oSt2RgY2zHMOsL65cqPu9pyoPjUdCIMpY1lqGPoQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB8781
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



On 10/14/2025 6:48 PM, Jonathan Cavitt wrote:
> Reintroduce the function xe_device_get_gt, as it was earlier renamed to
> xe_device_lookup_gt.  It performs the same functionality as
> xe_device_lookup_gt, but it guarantees the xe_gt pointer returned is not
> NULL using an assertion.

assert() does not guarantee anything, it will just WARN if cond is false 

> 
> Suggested-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Suggested-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.h | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> index 807db49a5306..af9476879454 100644
> --- a/drivers/gpu/drm/xe/xe_device.h
> +++ b/drivers/gpu/drm/xe/xe_device.h
> @@ -97,6 +97,21 @@ static inline struct xe_gt *xe_device_lookup_gt(struct xe_device *xe, u8 gt_id)
>  	return gt;
>  }
>  
> +/**
> + * xe_device_get_gt() - Same as xe_device_lookup_gt, but return must not be NULL
> + * @xe: The XE device to search
> + * @gt_id: The ID of the GT to search for
> + *
> + * Returns a pointer to the xe_gt struct with the given gt_id.
> + */
> +static inline struct xe_gt *xe_device_get_gt(struct xe_device *xe, u8 gt_id)
> +{
> +	struct xe_gt *gt = xe_device_lookup_gt(xe, gt_id);
> +
> +	xe_assert(xe, gt);

and IMO this trick will not fool the tool as it may still say that gt returned
by the xe_device_lookup_gt() can be NULL, returned here as-is, and caller does
not check for NULL

unless you explicitly tell the tool that xe_assert() is something more than WARN
and it should stop processing at that point, but that is another abuse IMO 

> +	return gt;
> +}
> +
>  /*
>   * Provide a GT structure suitable for performing non-GT MMIO operations against
>   * the primary tile.  Primarily intended for early tile initialization, display

