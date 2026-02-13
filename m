Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C78BEF48EB
	for <intel-xe@archiver.kernel.org>; Fri, 13 Feb 2026 08:26:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A27F10E7A7;
	Fri, 13 Feb 2026 08:26:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="deX9VbN7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CE2010E7B5
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Feb 2026 08:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770971183; x=1802507183;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=JxEijYDIWUuu8+nACnaykNFayxAEsgWotgdITdp1d/o=;
 b=deX9VbN7v9by5l+pco87gMwoCidv/T13kn2vXHZJu8U6sNi7RWEO1kjy
 4pD7e6OG1zaAX28aZPxdfieRfcRMzZxUoywDN08JpsQby7DnGpTapqg74
 u95PZZU7LZiIq3x3RVTNE/VAwsAUyviZA8M0f2VRJp3+L5MJukfl3KK+d
 0cBRdgeIDG3wkD4kpVceWzTuH8ia2enNBa7dGFI3WjAu9Ozg5jPxE/X05
 BrdgscCnHipuA+sjC4cADuH9wRnN09g21lKnZRDtWAyFz4HtZfMlDvvUH
 ippEiz6vbuiIPKaKiys750OMtzQ+YAjzotU0XcIZwSIib7QNZvG2YKPTk Q==;
X-CSE-ConnectionGUID: wga4rbicRqG60q8Y1ezBmw==
X-CSE-MsgGUID: JMExT+HERFGZHxy8WiEllA==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="83523162"
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; d="scan'208";a="83523162"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2026 00:26:23 -0800
X-CSE-ConnectionGUID: 467Ab+ZPRdG2TBeVzwkTvQ==
X-CSE-MsgGUID: +PPtR1DzQx2wq9bcLDNsUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; d="scan'208";a="212698686"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2026 00:26:23 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 13 Feb 2026 00:26:22 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Fri, 13 Feb 2026 00:26:22 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.6) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 13 Feb 2026 00:26:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MdZpaOzq7NIoXHeqojUHIwLIICKTndVaCWa6ERpsWFgJvd7jBPIFIbqzoJYvTj9NNbqsOWX8Kz7oqaOb3zFmAAD0oCm/CxY9cZJhwQGvXBRaVal02QDWrYTV+byYHe6j4PsLUCrkCsJWM8Ub3OJEsh4jsci0bZ1fhXx5rJm5TwXkCq3rdVJupd+zO//xwBT2fXD4MmnypGp60y4rMZvpwAch/xKuvgpvjDDSEOmFUjCaUIcrEhAljnNfWLeBBQjF5hKMra63GpYP58uLfDtX7jpdiRDVrrpABg/UlLRdy1WSN5jwTCIDcUQh9qXbU5Qg1Gcc8xVTG3iruqoviaA8gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YFH/IaM1LIjSWfXIYEM3nIIAZYqanAP/2djMa08myD0=;
 b=QEplgWDEaRLBojWVzeEFDSgLa4xd9U9xCFMZkYdn/uURffrcoyka6iYT0GyZ1LdPuNFOi01BkD+vkpkwtPh6XwwV94o0iNKKgV/lIjEx6JDi7PoYz4TOy8c7zUqT91RQd5JGncLKBytrHT9Pz1/GDisbAINXAyvNu3WSnEve6iBGNkoHndLE/QO1aFtsfhlJkhDJhASBg7Ot8ZIHrkMbTC6QQD6wstO9O06UAGc7UAhjeTWIhNhaqlMV4wLO7w5o7dEoglFDqQlELMQsBfjeWscuDdISnnS0FJwq7TzVpUeV4SdMHnm0MHDbLWCz99R0SYR4r59FkDF54bM1sVE4rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN6PR11MB8146.namprd11.prod.outlook.com (2603:10b6:208:470::9)
 by MW3PR11MB4522.namprd11.prod.outlook.com (2603:10b6:303:2d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.13; Fri, 13 Feb
 2026 08:26:19 +0000
Received: from MN6PR11MB8146.namprd11.prod.outlook.com
 ([fe80::a086:2649:bc88:db7d]) by MN6PR11MB8146.namprd11.prod.outlook.com
 ([fe80::a086:2649:bc88:db7d%6]) with mapi id 15.20.9611.012; Fri, 13 Feb 2026
 08:26:19 +0000
Message-ID: <94490d05-606d-4c20-bc7b-a14bc7e5480f@intel.com>
Date: Fri, 13 Feb 2026 10:28:06 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Allow per queue programming of
 COMMON_SLICE_CHICKEN3 bit13
To: Matt Roper <matthew.d.roper@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>
References: <20260205185248.994531-1-lionel.g.landwerlin@intel.com>
 <aY4nBdcGgCpUoS7W@intel.com>
 <20260212205013.GN4694@mdroper-desk1.amr.corp.intel.com>
Content-Language: en-US
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
In-Reply-To: <20260212205013.GN4694@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: GV2PEPF00003825.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:144:1:0:5:0:4) To DS0PR11MB8136.namprd11.prod.outlook.com
 (2603:10b6:8:159::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN6PR11MB8146:EE_|MW3PR11MB4522:EE_
X-MS-Office365-Filtering-Correlation-Id: d128a2f3-2588-4ffe-4cee-08de6ad98fed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Umd3WmEzVXJmdy9HSk9FM0s5ODdpbFY3dzVMdjFHclFMZ29aVjdMbXBGRjBq?=
 =?utf-8?B?Ly9PRCtHajgwR0JQK1VBenVQZk1VYSt4RFBRNVlVR3cxOUIrYzZveVBBZVA1?=
 =?utf-8?B?ODRpRnpoRFA1YTB2MHl6dFVvRzBjbHFEV1p5bm04aG03NHVCRkdVUms5Qy85?=
 =?utf-8?B?UElPWHZSQS8zMmRXVzVFbU85alF6MG1GSVlYZUZWNG11Q2JJaFFXVFFVdVNm?=
 =?utf-8?B?Zlp6OGV4RTUzdll5eXV1VW5tS1E5dWNzYVBJZkQwQk4yTXQxWHVBN2g2cFNt?=
 =?utf-8?B?ZmRoR2ZuTkRMc0dTRnQrNzdMdDV0Y053K1ZhYlBaUWYyaVRXeTFpZUpNZWR4?=
 =?utf-8?B?UnlkUk1VdUVSQUg3Q29BRzBReXBUenJQTmRNRXZJNXFGbjJPNTRlZzdNWWZL?=
 =?utf-8?B?VkRKN2VHeXlnUEZJOGV6SnVWbmcwNHM3ZXZtWXIxT2dEbk90eWM3N0dLcUdw?=
 =?utf-8?B?cDIxaGphR1Nwakh3M1JYMlh0Z05WWXJrbVg4RCtpT2h3S2t5UW1FZzNwZ2pa?=
 =?utf-8?B?ZktFM21yR253UEdybnk5eTJvVmowb01XV1dtZWJUR0JDSnZNd1JXUmhkRkEv?=
 =?utf-8?B?M0FVK1hYdlRkKy9FVXVTUGZtNmFoN3V6M1RyVEd5dVJuanVGTE53K0xJM3oy?=
 =?utf-8?B?OUdZckR1OE0zU3g1MHFObFlFbkp2dGIzTFhWeVFOdU9NQ2tpNFcwU0xNb2FX?=
 =?utf-8?B?WnV2U2JxeHpOWkZDbHJDTzZsSng3WW9uaHdieEJkRU9LNE9ycEpFR0RPOGgv?=
 =?utf-8?B?RTBwL0x0ZEN0bDFtaWxLNEdEN2ppNmp1Umlpa3dHZk5XZEFRZlVQV25nenIx?=
 =?utf-8?B?cTBqbVVjaWVHTHVaQlI3VFBhRk5HMml1czFkT0JYckJ1Uk45RWZYdzgxZGN6?=
 =?utf-8?B?d3NtV2pLUWUwclhsNlZONElFVWpramcyMU41ZkRvWXZPRGxoUGp2K2p2eHA4?=
 =?utf-8?B?UE5nSlNnTHJmK25ZQnNQNU1OL2FrYnZkTmN4azR3QUxiSWgrTmZXOGtDVTR0?=
 =?utf-8?B?eW9lL1N3bUd2M3pKRXhGQ3JLYVJudHdXYXc2QWd1TXZUZVhiTkpDWGkrbnNi?=
 =?utf-8?B?Z3FvN2Z3dk5mS2NTeXZ1RWtPMVZ6eHRDazlHVWVJQlo5czNZSDNNNUMwWW01?=
 =?utf-8?B?eWhEMklsR0FYc0UvOEQrbmdETlhDZ21XK0V2NmJVa1ZxYy94TXFrdEh5N2s3?=
 =?utf-8?B?TkJLYVROMm9ESnZGdzdZcEhWdlpIQjdjWi8rYlBEb0FQMERGVWZJM2FyUUs3?=
 =?utf-8?B?aVNES2xTMFVqeXNuKzNKSDVNTFZzZlN5OVhMNXMwKzlxQncvRk12UEdLK1o0?=
 =?utf-8?B?Y1E0dHRQTzk1Yy9hU2x6L0ZkMFlCdUtjdXJhZ2tONmk5V2pVZEhvaFVIM3Rk?=
 =?utf-8?B?TFBwc2ZreDJ2cE1KRGh4QWFCOUY3Y1hsMVJtTFZ3SHQ5QUszb3I5ZkRteVE2?=
 =?utf-8?B?aGo1aDFTaG5NMlRiWW9OZVV3Vm81anpGT1FIb21ZNWc3T3ZUN1l0Zmp4LzBE?=
 =?utf-8?B?SHYvOU8yZFMwbUlTeWpadnpMUlBDbUVxa3ZiK29tRzdpanhUNTJOQzV4Z2Ft?=
 =?utf-8?B?ZllUUWFqVFBjRm9hR0lKSHBpU3V4OWFBU0JFZkZKeWpKR1p3TUM0czNmbVZ6?=
 =?utf-8?B?aDVjeFM0T21mK1Fja3hoM3JuV01Fc2Q1NGo0NUIwc3JIRE1pM0VneksrbkFL?=
 =?utf-8?B?V0pUeTc5YWV3SHMzUVQwd3YrMHM1bXdLWXBvbTBzUVE3bnM3Y2FLNUk0MDRC?=
 =?utf-8?B?bmZoeENadUFFMEM4WldjZ21RKzc3aks5cVhrRzJ2ajFOQmR0dEFzOHNiQ2Zl?=
 =?utf-8?B?bHRkc1ZvcFFkbmM2QS83a1g1bEE1YkpjVTZHNTJ4a25uOFp0aWhsTWc1c1Np?=
 =?utf-8?B?bjg3OTVqb0dYcWlGLzVKejBYVG5HeDVFZXNQVytWNmI1amYwUUpCdUo5ZnNh?=
 =?utf-8?B?WnNkZm52Y205U2F4ZW1LVEQ2T2lCcGxoZ215Tm1RYldtR2M5VjlVOTZSUm5J?=
 =?utf-8?B?elFza1o4ZytsdXh3UWtYS00vbm1pVmtkNTJQTTBWQ2NTVVlENThzN1F2aytp?=
 =?utf-8?B?TU5ZVzNSbXZYL3VjZkNZb1o0MzJoOEtsL3h1Y0sxTFd5UkdmclduQnczMDFO?=
 =?utf-8?Q?LvYQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN6PR11MB8146.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?STlXcEZrQUVqSHZ5S3NhOXI5ck5QUldrQ1AzbFVBS203MHVsclo5c3dEb05V?=
 =?utf-8?B?VGYwVklsWkg4VFRzbUpsZ0UvQnEwOWZaaTZpMnc0bDV1TTVRczZHYlRQbEw0?=
 =?utf-8?B?TEFnWEkxRE1BaS9RVmZZVTMwZStSSXNvb1NrSzl4a084bXBBOWpyaWtONGtZ?=
 =?utf-8?B?YVlZZVNIWXdYVXFqUysvV0pxUjAyYW55NVkvQkhCRUlRSkZqcnVVaThnSUU4?=
 =?utf-8?B?NTN3WVZhTnN2Mk9GdnJTbEpKSG96cmhDbGNLbVl1RGErOXhCU3BLYTk2allM?=
 =?utf-8?B?OUgrMUZsSHMzQjhrT1I0OEgra1FuVUIwbG03dVJJYUxlZUg2b1Q1MTdjUFB4?=
 =?utf-8?B?Rm5hbGk1Ym5xMFU1WnVzbVFLVm83MHNiUmNwVm55eHg3RDdreU5jUGkrMjFz?=
 =?utf-8?B?T3Z5UFJ5V05OZTRlOHUzaWIvVndHVjJyOXpmRU9CaC9pdjd6blR2RzNQVG85?=
 =?utf-8?B?OGpOeVN6Y2RmZy9yQ2pRM2k4OUphTWdEUjdSRU9LRldJMFVKSTRYVWFCVTBQ?=
 =?utf-8?B?TWxaUnhYVDJuaUw3ZmJFeFowME5DMDVyaWhaMzlDcnk5L3ZvMFBUOFVWbE5Y?=
 =?utf-8?B?UERoZ0V4bDZkWU9sVUxkcmZaZUtzRkdXQlcrcXlyaTlQY2ZoRVFod0I1UGNI?=
 =?utf-8?B?RG5oUnZMbE1sdGRFSm5FeFBnTGxYTXJrTnNycCs5RzZtbkpkcXdjUDZjOUVI?=
 =?utf-8?B?ZFNzUVNSdTVZNXNORTM1VS9EN0dodkNQUkRld3htL0I1MzRWYmNTZGxqMzBa?=
 =?utf-8?B?TTg3TFYrS1dMc09XUmQycmVoRnBTRGJEdE5YZEtQR3MzUlkwbjU3ZEZ6MlZT?=
 =?utf-8?B?OXBiYTMvUnpnSUc1ejlORjFLWGIyTFEzL0tSUk5OWHluUURFRk9TMmxnRDlG?=
 =?utf-8?B?dHNYSUZacEx3ODZpbitxSlpDQS9sN0gyRnd0NVZWc2xRU3VWTUNSdnNmVHVK?=
 =?utf-8?B?KzhYZmxYcjhjSXppNUxPdnJXYzhwZFBtUkU5cGZwUkdLOCtJTkNSbE9JWVRK?=
 =?utf-8?B?WVhOV2RmTXNlR2tRMW5HakJJQzNSYUQ5c1liSEZMeE1MSThXTVYrUTlqaGht?=
 =?utf-8?B?SnB4K1JoRTRKZzV3WnAycThMOW5DdUZZcjI2SGl3Q21NalZ0Tkw3Q3E4V0Vq?=
 =?utf-8?B?YVdVOE9pcVNTTWw1QjRHR2JpZ095S3BYNUxuMHdNbEo4SHRLUEZzYlFUSXlt?=
 =?utf-8?B?bGVmdU9XMHhSOHlQVHVGV1VFWkFzT2c3T09aNTlkTWlNY1cxUFVXTm9EUDMy?=
 =?utf-8?B?eHMzYkd0RGRXWGE4STB3UzNybm16cDh0RUNveGN0cUZWMkNLSGNFZ3F5MU5J?=
 =?utf-8?B?Q1lpQ2t6TFNsVmlFdnpwWTFIRGlnRlUydUtVTXVZVlcwVXllb0hRWkNRMWp0?=
 =?utf-8?B?bjBWbzlzSjdnbDVmclQvSGJQT3F0Q2R0RnpRT21xa3ErTkJjNXZHUjUwQlBD?=
 =?utf-8?B?dXRNUEpXZzZyWEk5eGhpUnIyME5LRnFVbVE5SHQzNHovcDN6VVJsTUZBTEU0?=
 =?utf-8?B?ckFCNWhjTTlvSWUrVHBpS2RWVUVpYXV3VFljQTNkaGVlUEFKK05HS0Q1Y3JG?=
 =?utf-8?B?aUFZUnpOazJmd3R6by9HQnc1RmtNY3VxejRKb1FHYjJHc3pyZ2x2MUk5Wmwv?=
 =?utf-8?B?aDBWTk5LOENyOUlsTnBEbDBjRTZWeXNsRmRlRTE1WDFrOWxTZHpKSWhjL1Z5?=
 =?utf-8?B?VWh2TVc2R1B2SmhkTVBVZHpsRnBoei85UW5XekVhK0VVRU1idGx1TkVFZHND?=
 =?utf-8?B?QVZIZk5pVTVRbEFRY3dUK1lHWnE1QUVyZk1qemtBZ2JyN2RBaDRYYVdSUEla?=
 =?utf-8?B?d1ZxNU5uTVVhekFOMWgwRTJ5TzZoVzhDdGc3U1RrRncvSkNDRlBJV3UybUNM?=
 =?utf-8?B?R2VHMzhZYlQ5ODA0YThraWVFSitDQlNVWFRqNklRS01UZUt5M1I2c3ZiK0Iy?=
 =?utf-8?B?UzJpWGtGOHJSYkJLdTF4VDl1b01Cc0s0NzZ1N29zeGZacGNEdUdvL2prc0RI?=
 =?utf-8?B?SHFYV1ZFM3Z5dVk3VjB2ekdyWlBSRE5VWUJMUDlKTUwzK1I0bDl2YWF0QWNk?=
 =?utf-8?B?TXVMbVBET3JHMktaVDdpOWkxaTRuTklLYzhRY1RkbW1yUi8zRlFRM29oQ0t0?=
 =?utf-8?B?Mkd4U0pZRmtCOUM4bmNqYmJvYk1maWJZamMwSXFpRjJSMmRZekVSUmNORm1y?=
 =?utf-8?B?ZFNFeWMrTE45b1VCdWpxL1B6L3BBdVMvSjlkelRScEdxaU45V1M2N2UvTTR5?=
 =?utf-8?B?RzhhdHc2NzQrd3VXamZLYVo5UHFCaHE0aGYxaVVLSFU4aFJwckNodXg2ZW9C?=
 =?utf-8?B?LzM3UllLTWRwYTI5dUdIWUR6K3ZrK0RaT09XOFlIYkh3djJBWTNTMjZRV1A2?=
 =?utf-8?Q?BlSfNPW6sHuqlJjk=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d128a2f3-2588-4ffe-4cee-08de6ad98fed
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8136.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2026 08:26:19.6233 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Df6G5q/xSx4cGUsjGlS9GAuGPontxn44aaUzQFBBgaBBIWlSuREFnyJCJBS0707lW5EBh9xEqWDJRXx9CNcCC2uTkq6mfhKE41UP/iYgGdg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4522
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

On 12/02/2026 22:50, Matt Roper wrote:
> On Thu, Feb 12, 2026 at 02:16:21PM -0500, Rodrigo Vivi wrote:
>> On Thu, Feb 05, 2026 at 08:52:48PM +0200, Lionel Landwerlin wrote:
>>> Similar to i915's commit cebc13de7e704b1355bea208a9f9cdb042c74588
>>> ("drm/i915: Whitelist COMMON_SLICE_CHICKEN3 for UMD access"), except
>>> people have decided to not rely on putting the register on the
>>> allowlist for UMD to program and instead have context/queue creation
>>> flag.
>> Could you please be more specific here?
>>
>> I don't understand why we cannot simply add an RTP rule to xe_reg_whitelist.
>>
>> If we really need to go with the uapi, it is fine by me. Just attend to
>> all Jose's request, plus fix this commit message and then ack from my side.
>>
>> I mean, I'd like to understand this a bit better on why and change a bit
>> this message here, because 'people' just seems to blame someone
>> without being transparent about it. Not good in a commit message.
>> Not a good 'why' reason. The commit message should be about why, not blames...
> I think the reasoning is that COMMON_SLICE_CHICKEN3 isn't approved for
> whitelisting according to bspec 73995 (whereas it was approved on Xe1
> and older platforms on their corresponding pages).  We (the KMD team)
> are only ever allowed to whitelist registers that are explicitly listed
> on those 'approved whitelist' pages, or that are requested by a
> documented workaround that comes with its own formal approval for
> whitelisting from the security teams.  There have been some mistakes
> made here in the past (OA is a big area that we really screwed up on and
> it snuck by our code review), but it's good to be more vigilant about
> proper handling of whitelists going forward.
>
> It looks like the motivation for userspace wanting to adjust this
> register in the first place is the performance tuning setting that just
> showed up on bspec 72161.  That tuning guidance was just added one week
> ago, so it's not clear to me whether whitelisting was proposed and
> rejected (in favor of a KMD-driven solution like Lionel is adding
> below), or whether there might already be a security review in flight
> that will eventually lead to it getting added to page 73995.
>
>
> Matt


The motivation to want to adjust this register existed for a long time 
as described in the BSpec pages listed in the commit message.

Why has this moved to a context creation flag on windows and stopped 
being described a performance tuning knob... I don't know.

I poked people to get the documentation updated (hence the 72161 
change), but as far as I know there is no security review pending.


Windows drivers switched to using this rather than put the register on 
the UMD allowlist and all the currently shipping products use this on 
DX12/Vulkan.

We're currently missing the ability to program this on Xe (on i915 the 
allowlist is still in effect).


-Lionel


>
>>> This is a recommended tuning setting for both gen12 and Xe_HP
>>> platforms.
>>>
>>> Bspec: 73993, 73994, 31870, 68331
>>> Signed-off-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/regs/xe_gt_regs.h     |  1 +
>>>   drivers/gpu/drm/xe/xe_exec_queue.c       | 20 +++++++++++++++++++-
>>>   drivers/gpu/drm/xe/xe_exec_queue_types.h |  2 ++
>>>   drivers/gpu/drm/xe/xe_lrc.c              |  9 +++++++++
>>>   drivers/gpu/drm/xe/xe_lrc.h              |  1 +
>>>   include/uapi/drm/xe_drm.h                |  1 +
>>>   6 files changed, 33 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>>> index 24fc64fc832e9..a1b89f0a22e14 100644
>>> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>>> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>>> @@ -172,6 +172,7 @@
>>>   
>>>   #define COMMON_SLICE_CHICKEN3				XE_REG(0x7304, XE_REG_OPTION_MASKED)
>>>   #define XEHP_COMMON_SLICE_CHICKEN3			XE_REG_MCR(0x7304, XE_REG_OPTION_MASKED)
>>> +#define   STATE_CACHE_PERF_FIX_DISABLED			REG_BIT(13)
>>>   #define   DG1_FLOAT_POINT_BLEND_OPT_STRICT_MODE_EN	REG_BIT(12)
>>>   #define   XEHP_DUAL_SIMD8_SEQ_MERGE_DISABLE		REG_BIT(12)
>>>   #define   BLEND_EMB_FIX_DISABLE_IN_RCC			REG_BIT(11)
>>> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
>>> index 66d0e10ee2c4a..d20b4d84bbe06 100644
>>> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
>>> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
>>> @@ -292,6 +292,9 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q, u32 exec_queue_flags)
>>>   	if (!(exec_queue_flags & EXEC_QUEUE_FLAG_KERNEL))
>>>   		flags |= XE_LRC_CREATE_USER_CTX;
>>>   
>>> +	if (q->flags & EXEC_QUEUE_FLAG_STATE_CACHE_PERF_FIX)
>>> +		flags |= XE_LRC_STATE_CACHE_PERF_FIX;
>>> +
>>>   	err = q->ops->init(q);
>>>   	if (err)
>>>   		return err;
>>> @@ -850,6 +853,19 @@ static int exec_queue_set_multi_queue_priority(struct xe_device *xe, struct xe_e
>>>   	return q->ops->set_multi_queue_priority(q, value);
>>>   }
>>>   
>>> +static int exec_queue_set_state_cache_perf_fix(struct xe_device *xe, struct xe_exec_queue *q,
>>> +					       u64 value)
>>> +{
>>> +	if (XE_IOCTL_DBG(xe,
>>> +			 q->class != XE_ENGINE_CLASS_RENDER &&
>>> +                         q->class != XE_ENGINE_CLASS_COMPUTE))
>>> +		return -EOPNOTSUPP;
>>> +
>>> +	q->flags |= value != 0 ? EXEC_QUEUE_FLAG_STATE_CACHE_PERF_FIX : 0;
>>> +
>>> +	return 0;
>>> +}
>>> +
>>>   typedef int (*xe_exec_queue_set_property_fn)(struct xe_device *xe,
>>>   					     struct xe_exec_queue *q,
>>>   					     u64 value);
>>> @@ -862,6 +878,7 @@ static const xe_exec_queue_set_property_fn exec_queue_set_property_funcs[] = {
>>>   	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP] = exec_queue_set_multi_group,
>>>   	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY] =
>>>   							exec_queue_set_multi_queue_priority,
>>> +	[DRM_XE_EXEC_QUEUE_SET_STATE_CACHE_PERF_FIX] = exec_queue_set_state_cache_perf_fix,
>>>   };
>>>   
>>>   int xe_exec_queue_set_property_ioctl(struct drm_device *dev, void *data,
>>> @@ -946,7 +963,8 @@ static int exec_queue_user_ext_set_property(struct xe_device *xe,
>>>   			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_PXP_TYPE &&
>>>   			 ext.property != DRM_XE_EXEC_QUEUE_SET_HANG_REPLAY_STATE &&
>>>   			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP &&
>>> -			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY))
>>> +			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY &&
>>> +			 ext.property != DRM_XE_EXEC_QUEUE_SET_STATE_CACHE_PERF_FIX))
>>>   		return -EINVAL;
>>>   
>>>   	idx = array_index_nospec(ext.property, ARRAY_SIZE(exec_queue_set_property_funcs));
>>> diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
>>> index 3791fed34ffa5..f4f72d01eb8c8 100644
>>> --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
>>> +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
>>> @@ -134,6 +134,8 @@ struct xe_exec_queue {
>>>   #define EXEC_QUEUE_FLAG_LOW_LATENCY		BIT(5)
>>>   /* for migration (kernel copy, clear, bind) jobs */
>>>   #define EXEC_QUEUE_FLAG_MIGRATE			BIT(6)
>>> +/* for programming COMMON_SLICE_CHICKEN2 on first submission */
>>> +#define EXEC_QUEUE_FLAG_STATE_CACHE_PERF_FIX	BIT(7)
>>>   
>>>   	/**
>>>   	 * @flags: flags for this exec queue, should statically setup aside from ban
>>> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
>>> index 3db7968aa5e22..571d7ef303e1e 100644
>>> --- a/drivers/gpu/drm/xe/xe_lrc.c
>>> +++ b/drivers/gpu/drm/xe/xe_lrc.c
>>> @@ -14,6 +14,7 @@
>>>   #include "instructions/xe_gfxpipe_commands.h"
>>>   #include "instructions/xe_gfx_state_commands.h"
>>>   #include "regs/xe_engine_regs.h"
>>> +#include "regs/xe_gt_regs.h"
>>>   #include "regs/xe_lrc_layout.h"
>>>   #include "xe_bb.h"
>>>   #include "xe_bo.h"
>>> @@ -1443,6 +1444,7 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>>>   	struct xe_device *xe = gt_to_xe(gt);
>>>   	struct iosys_map map;
>>>   	u32 arb_enable;
>>> +	u32 state_cache_perf_fix[3];
>>>   	u32 bo_flags;
>>>   	int err;
>>>   
>>> @@ -1575,6 +1577,13 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>>>   	arb_enable = MI_ARB_ON_OFF | MI_ARB_ENABLE;
>>>   	xe_lrc_write_ring(lrc, &arb_enable, sizeof(arb_enable));
>>>   
>>> +	if (init_flags & XE_LRC_STATE_CACHE_PERF_FIX) {
>>> +		state_cache_perf_fix[0] = MI_LOAD_REGISTER_IMM | MI_LRI_NUM_REGS(1);
>>> +		state_cache_perf_fix[1] = COMMON_SLICE_CHICKEN3.addr;
>>> +		state_cache_perf_fix[2] = _MASKED_BIT_ENABLE(STATE_CACHE_PERF_FIX_DISABLED);
>>> +		xe_lrc_write_ring(lrc, state_cache_perf_fix, sizeof(state_cache_perf_fix));
>>> +	}
>>> +
>>>   	map = __xe_lrc_seqno_map(lrc);
>>>   	xe_map_write32(lrc_to_xe(lrc), &map, lrc->fence_ctx.next_seqno - 1);
>>>   
>>> diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
>>> index c307a3fd9ea28..083a2167aeef8 100644
>>> --- a/drivers/gpu/drm/xe/xe_lrc.h
>>> +++ b/drivers/gpu/drm/xe/xe_lrc.h
>>> @@ -49,6 +49,7 @@ struct xe_lrc_snapshot {
>>>   #define XE_LRC_CREATE_RUNALONE		BIT(0)
>>>   #define XE_LRC_CREATE_PXP		BIT(1)
>>>   #define XE_LRC_CREATE_USER_CTX		BIT(2)
>>> +#define XE_LRC_STATE_CACHE_PERF_FIX	BIT(3)
>>>   
>>>   struct xe_lrc *xe_lrc_create(struct xe_hw_engine *hwe, struct xe_vm *vm,
>>>   			     void *replay_state, u32 ring_size, u16 msix_vec, u32 flags);
>>> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>>> index 077e66a682e29..b69b95a56bd82 100644
>>> --- a/include/uapi/drm/xe_drm.h
>>> +++ b/include/uapi/drm/xe_drm.h
>>> @@ -1329,6 +1329,7 @@ struct drm_xe_exec_queue_create {
>>>   #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP		4
>>>   #define     DRM_XE_MULTI_GROUP_CREATE				(1ull << 63)
>>>   #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY	5
>>> +#define   DRM_XE_EXEC_QUEUE_SET_STATE_CACHE_PERF_FIX		6
>>>   	/** @extensions: Pointer to the first extension struct, if any */
>>>   	__u64 extensions;
>>>   
>>> -- 
>>> 2.43.0
>>>

