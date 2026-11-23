Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 885EC606A31E
	for <intel-xe@archiver.kernel.org>; Mon, 23 Nov 2026 06:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bbhrbN2v;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=AfKOAGY/
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4068910E548;
	Mon, 23 Nov 2026 06:56:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A0C110E548
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Nov 2026 06:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795416979; x=1826952979;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=AdyrTpN6atnG6CTX0PbWaokwMRHQyUiJ2v+4lckIz2Q=;
 b=bbhrbN2vj7yzW+byAYBEcXx76CAXe762GQDyJ81i821zOek6SEFVl4aB
 GNFsXafjLlMbdSENVtS0hbikaXFt6xup8mdEJHeZQlrN+phaBocrZxtOf
 Uffv2FIZa/Q29/dSSyomla2UzJ/vaiCgyd3VeACj/Ar+zKL7wiWiRlrpi
 +97Bb0qHO5rsCdlrbwPjPMYCaaNQvowbhrpAzbKQaStc2UCle9ZQJL4cG
 RZYuDh7pl+TngtwBLWx28SBwjqjljl+i4p5o8bk8B/GFTx+NCjtcvEcNy
 asragw422aR4jCfHI67ebaeoGZDtzncIKnPCSVtDVW5HUXDzN4WDHJ3lm A==;
X-CSE-ConnectionGUID: KeynqY9nStyziBqsHXiVpg==
X-CSE-MsgGUID: bcTZIxYqT1GRFWWyYpKLHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4248535"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; d="scan'208,217";a="4248535"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2026 22:56:18 -0800
X-CSE-ConnectionGUID: JRAuFwtkR/ubuHCm8kQcZg==
X-CSE-MsgGUID: /oqAogoNROeXoKpSmz5orQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; d="scan'208,217";a="11559128"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2026 22:56:19 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Sun, 22 Nov 2026 22:56:17 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Sun, 22 Nov 2026 22:56:17 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.52) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Sun, 22 Nov 2026 22:56:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WWppNGa4BJtOcAp6Tm3GGhPSb5ZJAzig7sFoMKdFZ9pykFXmYHfLCmvVUfIG/GFdVMUN2y03gZXfyGItfWMCSum00rJE5T5d0y/NNuZ0Pt5c2PAx5tPzAxCow9Ooj6sfnxHrQ0SbQt0aae8SQXvlNf/id4R+2L96chl8cdycM+oigZne7La3642I9k2W7t9qz0/RAJgV0/qIGxIQPJI+WvFmM6R6PYTykr2ynmQq4BYdu843KIWnEMbgk5ikWHHPFKPZrCY9VpJ3IFxONMgb6q1EwaMalZU8qQBneA4W2+l1ZhHRsnx151FuURp/XGLR7ljNiXb1UW4fAND4Mf8IKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U43mzybOGEM6AV+FFyBxHE7TjTCwX4mJ4lIRxQZfLXQ=;
 b=isdqx+Y0mJfG6LF2Y5Ms9olia5k5+3RoQBHNYoZthW4jY4grh777Cn5NKQtXez1yFyZiCElpDMp+S6vl7ZS5TPHl3UIQwLgJLerUp23Dia3mmgo5mI8PY807aoqoLYSqJ7yhB3+M5tW0jycfJNe/T3NqAjj5ZaNLmWZQaElsSsgxTqCpaqOA5DHYcH5UCQPPc2McwuV0ondKjkCoDK1DPJbPEzzdu4X1uXo2tulQuy6JdZ59Me2bnKh0jkJvCsf4Vioh735b/NXCR/MUnIJh045mpdBn76lUyb81q1t9+hyow+vj7mizK4gQjd7aJ0xZx82bVin0KI3uWY01Kk+/aQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U43mzybOGEM6AV+FFyBxHE7TjTCwX4mJ4lIRxQZfLXQ=;
 b=AfKOAGY/WUiG/hZuhqLOiwuzCVEN+aMVN6Io9VyY/DMCMwuBO+BLbVCN55bzySIQ6hLi1Ejj1ZP+tBn2Vy60hjVnKYU3vCfYP1vXJq2FiI2D/CWyS20B1UW7ejNIzqp1ZAC6Aw347K8XE6S3xPvG3EZk1j7DJuQ3zBP80YoNjGc=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from FT1PR11MB960200.namprd11.prod.outlook.com
 (2603:10b6:170:25::23) by IA1PR11MB6265.namprd11.prod.outlook.com
 (2603:10b6:208:3e7::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Mon, 23 Nov
 2026 06:56:10 +0000
Received: from FT1PR11MB960200.namprd11.prod.outlook.com
 ([fe80::cfb1:f811:62bb:fa65]) by FT1PR11MB960200.namprd11.prod.outlook.com
 ([fe80::cfb1:f811:62bb:fa65%5]) with mapi id 15.21.0639.012; Mon, 23 Nov 2026
 06:56:09 +0000
Content-Type: multipart/alternative;
 boundary="------------uvyizuXFUKezERj0BVijUew0"
Message-ID: <39bfef1a-8238-44e5-a0da-471b0a744745@intel.com>
Date: Mon, 23 Nov 2026 12:26:01 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/hwmon: Expose powerX_cap_max
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Anirban, Sk" <sk.anirban@intel.com>, "Jadav, Raag"
 <raag.jadav@intel.com>, "Koppuravuri, Ravi Kishore"
 <ravi.kishore.koppuravuri@intel.com>, "Koujalagi, Mallesh"
 <mallesh.koujalagi@intel.com>, "Purkait, Soham" <soham.purkait@intel.com>,
 "Tauro, Riana" <riana.tauro@intel.com>, "Nilawar, Badal"
 <badal.nilawar@intel.com>, "Gupta, Anshuman" <anshuman.gupta@intel.com>
References: <20261119104029.3066660-1-karthik.poosa@intel.com>
 <6af580630e7b618aee5d4a92b7163814488a4530.camel@intel.com>
Content-Language: en-US
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <6af580630e7b618aee5d4a92b7163814488a4530.camel@intel.com>
X-ClientProxiedBy: MA5P287CA0241.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ae::6) To FT1PR11MB960200.namprd11.prod.outlook.com
 (2603:10b6:170:25::23)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: FT1PR11MB960200:EE_|IA1PR11MB6265:EE_
X-MS-Office365-Filtering-Correlation-Id: f1b8633f-e920-4a9c-6755-08df492eda8f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|376014|22082099003|18002099003|261009223027099003|8096899003|4143699003|10067099003|11063799006|56012099006|261102123227099003|261028144727099003|261026121527099003|261026140227099003|261022105027099003|261021121427099003|261021123027099003;
X-Microsoft-Antispam-Message-Info: dAYQCivBXIVdLkYWQ/ZzIZ3n/SpBkgcorHo2iSQeSOJr93YJn71nGUBxGzOESQHEQpnpfX4JrdJtuj9yd0cjIIM7JBMw8avmseTyiBb1y63VEu+GK/lutO8oY0yBDzcdpScVbhVyYX8TzoNJYl0admukfQzwVkxv4mMbk7iKl1dbApbZN0Vc824dLcxWXl2fUdrrnFCgK0WJbOdgS3bLAWEQRDW7fhi+QFvju6cf6c05QtRMvFFOAELJsWzzf3ya3Ufdt76lcOxCLO7sdTttZ0dQU0eFEI9L5NlqVwwtisMCPPFsogcROUZfV7ZtPEMLZKnkbOmO4YUTnf4V88cYQHp+b0arpV7P1C7ES4WeSE7aZ9azGs+EyKMtLzYsfBBML180fjIRcKi7wjA3d1XoWfykpIGDaMOd2rlDbvjkobqpYZOWgRYjc42y+0HujsLvCmbquZ3luA7U0iqgFozkT8GoEq32KmaixPKPseZNXBxhPqtH/qW2hjquh+P8zX1S5w29sC2bmfInbujrfwxFPTIQTRn7ki1cXzadi0hl7rJXfpnl6wnN6k6WcD+QBAQwokljOok26WCcY7/zbEdRdrYkorTQOQQ3gghkEr9YR/lN++UzOkWh1cqIERrkloMXL03+jeMzzsc2W27q6M7xk5U62sTOXGe90pExZZarc0M=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:FT1PR11MB960200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(22082099003)(18002099003)(261009223027099003)(8096899003)(4143699003)(10067099003)(11063799006)(56012099006)(261102123227099003)(261028144727099003)(261026121527099003)(261026140227099003)(261022105027099003)(261021121427099003)(261021123027099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YkdXalYyajBNRkRaVWZNZDZJb24zTk1iQmdrZGRFN29mbEZhMHlDMUtFTnVm?=
 =?utf-8?B?SHVrNlBLbjlINWpuSklkYW16NU9Cek5UbGRVLzMzQVhtT2pKd3V1a2pmeWNw?=
 =?utf-8?B?ZzBWUjNKb01ZUWRrUHlkZEZnS01MZFVHdlRrb0V3dkNEblpnTWNDY3lLWFJa?=
 =?utf-8?B?NUlWRm9nZ2JGTW1EZ1dyb3RudjFIZkR2SzdsanZvT3c5WEVEZ0xJeFFic2tr?=
 =?utf-8?B?NXd2cHFOcHhxejhPZVZwMkZaQmNsak1DS00ya0VheDh3YzIyeExmK2toUTAv?=
 =?utf-8?B?ZHpDN2YrUUlNMkwxZmJVMUZkaUpCdTBoOGk4ZG1rUnhUWVlCMkJESWtPazE2?=
 =?utf-8?B?SllLekJnTElqdUk5VXM4eEJKMGE1bmEyQjZOZFJIZWYwWnp0NThJLzVUTHBt?=
 =?utf-8?B?YmtoS1VCeGorSFdZdHl1bTNxcCtjb0xvM1NiYUlSMitGUHRhNnhsdTdnQi9r?=
 =?utf-8?B?QUxERkZQUjRZYlJORUhFQTVZbFV2UXl3ZnJZUjJkcGkvcmFiOStRUTJRblVp?=
 =?utf-8?B?eDEvOVdwRlNkNVJWWWN1aVU5TE9Tb3kwLzdKTHd5UjF0dEJXMGhLMFRoWmZM?=
 =?utf-8?B?V0ltZ1k2cFQydldXcFpDaGhjd1dCMW8zenFjVjBleCtWeU4wK0VHOTFjbzZV?=
 =?utf-8?B?MzRvY1h0cXR6S1NlTG84bm1UcVptWExPUGFNN2tCMjFlVUlXZVVHTzhrSkM3?=
 =?utf-8?B?bjNaKzZnc29Ebm14VjZYYWNNQnVqcXdyNnUyQ2Y5ZHQ4eUptK1R2VVEwZ3Nn?=
 =?utf-8?B?bXBJVGJ1T0FYdkF1TkJUOWU2SEtqdHk1cDRGV01JNzliRFJrajFyc2xmdUlx?=
 =?utf-8?B?WVhGOFl2TFBMVGx6TGZQVlFsVUJydWtvaXBiQVF3Ly9DLzY1UUZ3cFRQWkM2?=
 =?utf-8?B?QzhZRml0NVJ4WEN0M3VxTlRoTUVtT3V3MXNLZmJRcGU2ZVJMSlFCU3oxekU1?=
 =?utf-8?B?TGVjNmJOK1ZMbFJ5M3pObjBHd2xMc3BNR011WGNRV21PZ0thTWpvOU83c1A1?=
 =?utf-8?B?SnM2dkhnZjljSTlJdVdUbkk3bjJ1K0ZoSjMyZWFLWGh4M3JmSHRxWG1XTFJu?=
 =?utf-8?B?UVM0blpjNjQ0eUwvWXpMVVdTM0xZNkQ3ZmpxV0NpQ2dhdVFoZFhXVE94K1NG?=
 =?utf-8?B?NGR2bmJKTGRCT29CUnFUaklmNXlEeVNiNnpMNGQxak1uT0NQUjlmTWs0SzBU?=
 =?utf-8?B?ajNTU2s0dllHWHNyOThCdjNuWW1VUWtudWNON3RSWE9VSjVFQzRYeGJJeWZ0?=
 =?utf-8?B?bEdwZWZoYzJoMHd4SWRFTFI1dHp5OUw1SFlQNFY3VTkvM0c2Wno0SERtUmJ2?=
 =?utf-8?B?VDl0RTdBKzFSNW5lNm5pbXBjeWswUERXRXdvMkczLzQ3bU5VbE1zZTE0bDZF?=
 =?utf-8?B?dGdHWXNVNUdiQ1JzTHRVbTRabW05S1FZdHlMV2x1L09CeXV3RXRMT2I2andK?=
 =?utf-8?B?cUdRZmt4eEFXL2lQLzlqYmE5eTd0ZDcweWtuenVzQVVRUlhHNWpRdmFiRGhv?=
 =?utf-8?B?UStQTkxvYlltQmJBNkNVdnZ0b1JTQU84UjF2RWpjblRCMG4wY2kvY2o4OFZt?=
 =?utf-8?B?V1BsZ2o4aytZYVV2bkJhcU5tc3lrdnYxNWlVTHMycnF5aFEwb3lEcm9HZDI0?=
 =?utf-8?B?eVhTNGdUTmo5ZFFWYVpIUG0yZlVudWJLY0pweG9HQjBKdzVRSnNXU09QME95?=
 =?utf-8?B?NDZQZEZoM3RMUmRZY0YwTlJPSE9QdVkyY3ZOc2RGTk5tazBPNEoyUnZaZnhQ?=
 =?utf-8?B?MnFGdFFOVVM0WGhpRzgrL0IxRExZYkNqcnhWQUVaZWtsT2IrcWpXbVFzcmlh?=
 =?utf-8?B?b3pDanQwT2RYZkx6akxYOGZyN1hWVStYNVhSTEJoeTRJcjJQTHVXM3I3TkZp?=
 =?utf-8?B?aDcxaDNuWmVydUxYeHh0cTd5aFNZRWZoc1NqTFkxWFcxTm9hbHQvMnZnQWFE?=
 =?utf-8?B?ZWNNWXB6eERKbmEwU3d0TDUwSFhkakhnbisxS21DOVVXWDRWS2xmRndIYW9m?=
 =?utf-8?B?OEVJODZyMnRhZ2lHenJNdFgvUkVUMmlZa0tXU285MSswNFRWVnFDQVJFL1p0?=
 =?utf-8?B?LzZNcGJrNFpheEIydnk0TU9GOGRyWFM4VEtxaEZQdEhRYUhVODh1clBPR3p2?=
 =?utf-8?B?QU1GdEoyQk0vTXAyZks3TnBGM0NCTG9wb0JPL05WL3VJOVU3VHRRbTBpM1Ur?=
 =?utf-8?B?RXlOeXRWQ3JEL1gya0Y0clAvQnh1N0NveTRMaW1hZlJWWVV5THNlMnpUUUNv?=
 =?utf-8?B?UFdmaXNLQjFnVzlhb2tnblF1UlFwWHBUUkFxc2V1TWF0TDhtdFZmREd4UnBW?=
 =?utf-8?B?VjhqdFdYaEVyUFBUb1ZVeEUyaG9Ra0VUVU5uS2ZuU1VucGdya1hWQT09?=
X-Exchange-RoutingPolicyChecked: K3eLVg/eOV7fNqkE8rwWR1URLxtqlj+suA8RvROajy2C84Ou8G3J+DT8JUBux0rHK2INGsN67MeKwayQsYl4yWhsMoU/wb6exEXJ554hJTQYOARb6OF0zE2yQcK5tGQ8BVJOiHIbeLyWq55eLxUtZcWRMohz9pf6NQ5Xl6MQRJKIHbhAkYXP5bFE5Uv2HdLJhz8tw8xdf3vIb9o53X6GqnxXU+QPKZfbNfIKZ/zffhvvneIxKNJzJJZ1vjCVhDH7Wr0uhHLLdTsuoii2V8HBZwcSNBQ4NlBx/yOo0lxzVlKzZISDI7KJX4q6CD2fSYpTuctwvvwkB+orqFPRWHxHjg==
X-MS-Exchange-CrossTenant-Network-Message-Id: f1b8633f-e920-4a9c-6755-08df492eda8f
X-MS-Exchange-CrossTenant-AuthSource: FT1PR11MB960200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 06:56:09.7557 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W1Rc2FIBR9i0mgGs/uJmtQ1xp2Ayy1S/YCXTHdehNh1fWD2GTyn+aizgCaF2zTtMhJCZ54M6q+dmraqwUd04Vw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6265
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	HTML_MESSAGE,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--------------uvyizuXFUKezERj0BVijUew0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 21-11-2026 04:02, Vivi, Rodrigo wrote:
> On Thu, 2026-11-19 at 16:10 +0530, Karthik Poosa wrote:
>> Add a read-only power<i>_cap_max attribute for the card and package
>> channels. It reports the PL2 (burst) power limit that firmware sets
>> at
>> boot, which is the highest value userspace can write to power<i>_cap.
>> The attribute is present only on platforms using mailbox power limits
>> where PL2 is enabled at boot.
>>
>> Signed-off-by: Karthik Poosa<karthik.poosa@intel.com>
>> ---
>>   .../ABI/testing/sysfs-driver-intel-xe-hwmon   | 24
>> +++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_hwmon.c                 | 11 +++++++--
>>   2 files changed, 33 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
>> b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
>> index 0da739d9a816..097902fd8346 100644
>> --- a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
>> +++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
>> @@ -296,6 +296,30 @@ Description:	RW. Package burst (PL2)
>> power limit in microwatts.
>>   
>>   		Only supported for particular Intel Xe graphics
>> platforms.
>>   
>> +What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/power1_ca
>> p_max
>> +Date:		November 2026
>> +KernelVersion:	7.4
> 7.5 if merged in the next 1.5 week.
okay, this will be 7.5 we are planning to merge this week
> 7.6 after Thomas send the last drm-xe-next PR of this cycle.
>
>> +Contact:	intel-xe@lists.freedesktop.org
>> +Description:	RO. Card default burst (PL2) power limit in
>> microwatts.
>> +
>> +		This is the firmware-provided default limit and the
>> maximum
>> +		value accepted for power1_cap.
>> +
>> +		Only supported for particular Intel Xe graphics
>> platforms where
>> +		PL2 is enabled.
>> +
>> +What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/power2_ca
>> p_max
>> +Date:		November 2026
>> +KernelVersion:	7.4
>> +Contact:	intel-xe@lists.freedesktop.org
>> +Description:	RO. Package default burst (PL2) power limit in
>> microwatts.
>> +
>> +		This is the firmware-provided default limit and the
>> maximum
>> +		value accepted for power2_cap.
>> +
>> +		Only supported for particular Intel Xe graphics
>> platforms where
>> +		PL2 is enabled.
>> +
>>   What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/power1_ca
>> p_interval
>>   Date:		May 2025
>>   KernelVersion:	6.15
>> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c
>> b/drivers/gpu/drm/xe/xe_hwmon.c
>> index 515b288f18e5..023a317a443e 100644
>> --- a/drivers/gpu/drm/xe/xe_hwmon.c
>> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
>> @@ -865,8 +865,9 @@ static const struct hwmon_channel_info
>> hwmon_temp_info = {
>>   static const struct hwmon_channel_info * const hwmon_info[] = {
>>   	&hwmon_temp_info,
>>   	HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX |
>> HWMON_P_LABEL | HWMON_P_CRIT |
>> -			   HWMON_P_CAP,
>> -			   HWMON_P_MAX | HWMON_P_RATED_MAX |
>> HWMON_P_LABEL | HWMON_P_CAP),
>> +			   HWMON_P_CAP | HWMON_P_CAP_MAX,
>> +			   HWMON_P_MAX | HWMON_P_RATED_MAX |
>> HWMON_P_LABEL | HWMON_P_CAP |
>> +			   HWMON_P_CAP_MAX),
>>   	HWMON_CHANNEL_INFO(curr, HWMON_C_LABEL, HWMON_C_CRIT |
>> HWMON_C_LABEL),
>>   	HWMON_CHANNEL_INFO(in, HWMON_I_INPUT | HWMON_I_LABEL,
>> HWMON_I_INPUT | HWMON_I_LABEL),
>>   	HWMON_CHANNEL_INFO(energy, HWMON_E_INPUT | HWMON_E_LABEL,
>> HWMON_E_INPUT | HWMON_E_LABEL),
>> @@ -1423,6 +1424,8 @@ xe_hwmon_power_is_visible(struct xe_hwmon
>> *hwmon, u32 attr, int channel)
>>   	struct xe_mmio *mmio = xe_root_tile_mmio(hwmon->xe);
>>   
>>   	switch (attr) {
>> +	case hwmon_power_cap_max:
>> +		return hwmon->pl2_on_boot[channel] ? 0444 : 0;
> I believe we also need to take PWR_LIM_EN in consideration here, no?!

not needed, because pl2_on_boot filled with 
xe_hwmon_pcode_read_power_limit(),

which is give power limit > 0 value, only if corresponding power limit 
is enabled.

  261 static int xe_hwmon_pcode_read_power_limit(const struct xe_hwmon 
*hwmon, u32 attr, int channel,

  282         /* return the value only if limit is enabled */
  283         if (attr == PL1_HWMON_ATTR)
  284                 *uval = (val0 & PWR_LIM_EN) ? val0 : 0;
  285         else if (attr == PL2_HWMON_ATTR)
  286                 *uval = (val1 & PWR_LIM_EN) ? val1 : 0;
  287         else if (attr == hwmon_power_label)
  288                 *uval = (val0 | val1) & PWR_LIM_EN;

> Perhaps checking has_mbx_power_limits && (pl2_on_boot[channel] &
> PWR_LIM_EN) ?!
we can add has_mbx_power_limits though.
>
>>   	case hwmon_power_max:
>>   	case hwmon_power_cap:
>>   		if (hwmon->xe->info.has_mbx_power_limits) {
>> @@ -1486,6 +1489,10 @@ static int
>>   xe_hwmon_power_read(struct xe_hwmon *hwmon, u32 attr, int channel,
>> long *val)
>>   {
>>   	switch (attr) {
>> +	case hwmon_power_cap_max:
>> +		*val = mul_u32_u32(REG_FIELD_GET(PWR_LIM_VAL, hwmon-
>>> pl2_on_boot[channel]),
>> +				   SF_POWER) >> hwmon-
>>> scl_shift_power;
>> +		return 0;
>>   	case hwmon_power_max:
>>   	case hwmon_power_cap:
>>   		return xe_hwmon_power_max_read(hwmon, attr, channel,
>> val);
--------------uvyizuXFUKezERj0BVijUew0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 21-11-2026 04:02, Vivi, Rodrigo
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:6af580630e7b618aee5d4a92b7163814488a4530.camel@intel.com">
      <pre wrap="" class="moz-quote-pre">On Thu, 2026-11-19 at 16:10 +0530, Karthik Poosa wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Add a read-only power&lt;i&gt;_cap_max attribute for the card and package
channels. It reports the PL2 (burst) power limit that firmware sets
at
boot, which is the highest value userspace can write to power&lt;i&gt;_cap.
The attribute is present only on platforms using mailbox power limits
where PL2 is enabled at boot.

Signed-off-by: Karthik Poosa <a class="moz-txt-link-rfc2396E" href="mailto:karthik.poosa@intel.com">&lt;karthik.poosa@intel.com&gt;</a>
---
&nbsp;.../ABI/testing/sysfs-driver-intel-xe-hwmon&nbsp;&nbsp; | 24
+++++++++++++++++++
&nbsp;drivers/gpu/drm/xe/xe_hwmon.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 11 +++++++--
&nbsp;2 files changed, 33 insertions(+), 2 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
index 0da739d9a816..097902fd8346 100644
--- a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
+++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
@@ -296,6 +296,30 @@ Description:	RW. Package burst (PL2)
power limit in microwatts.
&nbsp;
&nbsp;		Only supported for particular Intel Xe graphics
platforms.
&nbsp;
+What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon&lt;i&gt;/power1_ca
p_max
+Date:		November 2026
+KernelVersion:	7.4
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
7.5 if merged in the next 1.5 week.</pre>
    </blockquote>
    okay, this will be 7.5 we are planning to merge this week
    <blockquote type="cite" cite="mid:6af580630e7b618aee5d4a92b7163814488a4530.camel@intel.com">
      <pre wrap="" class="moz-quote-pre">
7.6 after Thomas send the last drm-xe-next PR of this cycle.

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+Contact:	<a class="moz-txt-link-abbreviated" href="mailto:intel-xe@lists.freedesktop.org">intel-xe@lists.freedesktop.org</a>
+Description:	RO. Card default burst (PL2) power limit in
microwatts.
+
+		This is the firmware-provided default limit and the
maximum
+		value accepted for power1_cap.
+
+		Only supported for particular Intel Xe graphics
platforms where
+		PL2 is enabled.
+
+What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon&lt;i&gt;/power2_ca
p_max
+Date:		November 2026
+KernelVersion:	7.4
+Contact:	<a class="moz-txt-link-abbreviated" href="mailto:intel-xe@lists.freedesktop.org">intel-xe@lists.freedesktop.org</a>
+Description:	RO. Package default burst (PL2) power limit in
microwatts.
+
+		This is the firmware-provided default limit and the
maximum
+		value accepted for power2_cap.
+
+		Only supported for particular Intel Xe graphics
platforms where
+		PL2 is enabled.
+
&nbsp;What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon&lt;i&gt;/power1_ca
p_interval
&nbsp;Date:		May 2025
&nbsp;KernelVersion:	6.15
diff --git a/drivers/gpu/drm/xe/xe_hwmon.c
b/drivers/gpu/drm/xe/xe_hwmon.c
index 515b288f18e5..023a317a443e 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -865,8 +865,9 @@ static const struct hwmon_channel_info
hwmon_temp_info = {
&nbsp;static const struct hwmon_channel_info * const hwmon_info[] = {
&nbsp;	&amp;hwmon_temp_info,
&nbsp;	HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX |
HWMON_P_LABEL | HWMON_P_CRIT |
-			&nbsp;&nbsp; HWMON_P_CAP,
-			&nbsp;&nbsp; HWMON_P_MAX | HWMON_P_RATED_MAX |
HWMON_P_LABEL | HWMON_P_CAP),
+			&nbsp;&nbsp; HWMON_P_CAP | HWMON_P_CAP_MAX,
+			&nbsp;&nbsp; HWMON_P_MAX | HWMON_P_RATED_MAX |
HWMON_P_LABEL | HWMON_P_CAP |
+			&nbsp;&nbsp; HWMON_P_CAP_MAX),
&nbsp;	HWMON_CHANNEL_INFO(curr, HWMON_C_LABEL, HWMON_C_CRIT |
HWMON_C_LABEL),
&nbsp;	HWMON_CHANNEL_INFO(in, HWMON_I_INPUT | HWMON_I_LABEL,
HWMON_I_INPUT | HWMON_I_LABEL),
&nbsp;	HWMON_CHANNEL_INFO(energy, HWMON_E_INPUT | HWMON_E_LABEL,
HWMON_E_INPUT | HWMON_E_LABEL),
@@ -1423,6 +1424,8 @@ xe_hwmon_power_is_visible(struct xe_hwmon
*hwmon, u32 attr, int channel)
&nbsp;	struct xe_mmio *mmio = xe_root_tile_mmio(hwmon-&gt;xe);
&nbsp;
&nbsp;	switch (attr) {
+	case hwmon_power_cap_max:
+		return hwmon-&gt;pl2_on_boot[channel] ? 0444 : 0;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
I believe we also need to take PWR_LIM_EN in consideration here, no?!</pre>
    </blockquote>
    <p>not needed, because pl2_on_boot filled with
      xe_hwmon_pcode_read_power_limit(),&nbsp;</p>
    <p>which is give power limit &gt; 0 value, only if corresponding
      power limit is enabled.<br>
      <br>
      &nbsp;261 static int xe_hwmon_pcode_read_power_limit(const struct
      xe_hwmon *hwmon, u32 attr, int channel,<br>
      <br>
      &nbsp;282&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* return the value only if limit is enabled */<br>
      &nbsp;283&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (attr == PL1_HWMON_ATTR)<br>
      &nbsp;284&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;*uval = (val0 &amp; PWR_LIM_EN) ? val0 : 0;<br>
      &nbsp;285&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;else if (attr == PL2_HWMON_ATTR)<br>
      &nbsp;286&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;*uval = (val1 &amp; PWR_LIM_EN) ? val1 : 0;<br>
      &nbsp;287&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;else if (attr == hwmon_power_label)<br>
      &nbsp;288&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;*uval = (val0 | val1) &amp; PWR_LIM_EN;</p>
    <blockquote type="cite" cite="mid:6af580630e7b618aee5d4a92b7163814488a4530.camel@intel.com">
      <pre wrap="" class="moz-quote-pre">Perhaps checking has_mbx_power_limits &amp;&amp; (pl2_on_boot[channel] &amp;
PWR_LIM_EN) ?!</pre>
    </blockquote>
    we can add&nbsp;<span style="white-space: pre-wrap">has_mbx_power_limits though.</span>
    <blockquote type="cite" cite="mid:6af580630e7b618aee5d4a92b7163814488a4530.camel@intel.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">&nbsp;	case hwmon_power_max:
&nbsp;	case hwmon_power_cap:
&nbsp;		if (hwmon-&gt;xe-&gt;info.has_mbx_power_limits) {
@@ -1486,6 +1489,10 @@ static int
&nbsp;xe_hwmon_power_read(struct xe_hwmon *hwmon, u32 attr, int channel,
long *val)
&nbsp;{
&nbsp;	switch (attr) {
+	case hwmon_power_cap_max:
+		*val = mul_u32_u32(REG_FIELD_GET(PWR_LIM_VAL, hwmon-
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">pl2_on_boot[channel]),
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">+				&nbsp;&nbsp; SF_POWER) &gt;&gt; hwmon-
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">scl_shift_power;
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">+		return 0;
&nbsp;	case hwmon_power_max:
&nbsp;	case hwmon_power_cap:
&nbsp;		return xe_hwmon_power_max_read(hwmon, attr, channel,
val);
</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------uvyizuXFUKezERj0BVijUew0--
