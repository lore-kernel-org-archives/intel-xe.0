Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3C1EC25B76
	for <intel-xe@archiver.kernel.org>; Wed,  5 Jun 2024 09:45:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D06D10E023;
	Wed,  5 Jun 2024 09:45:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C4LNZSVi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A60C910E023
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Jun 2024 09:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717580698; x=1749116698;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=tbQWK1IdASqDN/DvGVaj7SP1BeFkrA8TV1GrdaT6XWY=;
 b=C4LNZSViIQM1lw/jmBGKWvPXTRtBQFLngmD8BNXQSxjLAd70RidBGFau
 imbb3X+Cv8jreBWAP/tAKfInCu9xOAh8P9RQgLDGio9o8zCFfIq94TjHV
 a6vn6LSiEcvpbm6cilS+8ByjQ0XIi9Z5I26CAqgU8WPYPRPOxlYvsifY9
 bruPcB6JcEaFCW8w3I5J6mETu7tObbEKn6sNxMSD8rhkg56/QFGYHpDFr
 hgZJ9J/+IMX1f4prJZR04usDLxHgAa9KqLNLJCONOhtwujbxj9r8ENSWX
 BkKbqWkqWPVVx9bDdMxTegTpuiAB+NZ+m90JTLsm4Fd65m1FgQXI5jDuo g==;
X-CSE-ConnectionGUID: ZlpBJ2mVQKu/w83zu59p/g==
X-CSE-MsgGUID: qBdkr7UEScGxvlpHEUyRgw==
X-IronPort-AV: E=McAfee;i="6600,9927,11093"; a="14061724"
X-IronPort-AV: E=Sophos;i="6.08,216,1712646000"; d="scan'208";a="14061724"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2024 02:44:57 -0700
X-CSE-ConnectionGUID: b59bl9O1QV+BGLnpjbBq8A==
X-CSE-MsgGUID: lIjxiLjqQTiljss+xR9nSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,216,1712646000"; d="scan'208";a="41961720"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Jun 2024 02:44:55 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 5 Jun 2024 02:44:55 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 5 Jun 2024 02:44:55 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 5 Jun 2024 02:44:55 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.172)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 5 Jun 2024 02:44:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kpa5kdgFaFD3xkFKeLSF/kLNaNzIMmm411OegjOK7yQv4i+ItYjqldZDKLYzqDkYpInka4oQviiMqhgradEPNNq5XRbi5QfF2roprOX086/gm0XVjZUT3NRM46n5N/7L6qRUbLVVOI0wWIM2glY+cfjAJVId5FABsFT4KFHRXEKWnLm4txES4ogWLYb/zlxop2gBuKvnyhHO3LYuZLZoaF7NJBqKT/LoCNSiiHi/xbYih1O4zrdkZW3K2yCONrEWMmalFelLYuRRAQ6S0hmZAj2HLDDY46MeIYXiVZalvQ9FgasRaYQ97UxI8OWX9lM38oQgXrqWHabat83Ry/RzqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tbQWK1IdASqDN/DvGVaj7SP1BeFkrA8TV1GrdaT6XWY=;
 b=afeP7XcfkcSczH5HGHrg6qmQLB7AWQfujI4+ZVeaJANhuY442thFQiQcaZaSFxivY1rxmIwXyeI+qzlvdsqfoM8uMqOawCK27NdepQtgqXWzKFkbhtb8sfLMKeBhB3Us3MJWhffZdEGCEySx+CV5z94pRAjN2vesb4OjENapr6pfa0YXKNA+lPOMZRgKBok6XTkVw5MfTAysZgCxql6x+U2/d4SYzpaF27sIMicXZ9rU757CflNJ6tiGPq6yuI5c84faeRENs8SMYfuPqani4/XePPLbN64DKFJDs2Rxk/Gpp+FBa5sVc361FRlS1lb3g9JRbmirKccIZaldcun5ZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by IA0PR11MB7838.namprd11.prod.outlook.com (2603:10b6:208:402::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.30; Wed, 5 Jun
 2024 09:44:52 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762%4]) with mapi id 15.20.7633.021; Wed, 5 Jun 2024
 09:44:52 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: Nirmoy Das <nirmoy.das@linux.intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
Subject: RE: [PATCH V2] drm/xe: Access port only after lock acquired
Thread-Topic: [PATCH V2] drm/xe: Access port only after lock acquired
Thread-Index: AQHatmw/2IAGL+XehEq2g8QT36T0E7G43BUAgAAQwdA=
Date: Wed, 5 Jun 2024 09:44:52 +0000
Message-ID: <SJ1PR11MB6204C65490147290833A7E6D81F92@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20240604104516.766058-1-tejas.upadhyay@intel.com>
 <40e1ff44-2a54-4d99-bbc9-83738821c1f0@linux.intel.com>
In-Reply-To: <40e1ff44-2a54-4d99-bbc9-83738821c1f0@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|IA0PR11MB7838:EE_
x-ms-office365-filtering-correlation-id: feae8f74-986d-43d8-0ffc-08dc8544263e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|366007|376005|1800799015|38070700009;
x-microsoft-antispam-message-info: =?utf-8?B?SGVJTnprMGFyWFdjUUR4R0x1c2ZqMS9TcGUvU1BXRWhoK2V4VHJtbXNMb1Bn?=
 =?utf-8?B?R2F6d09OM1poaWNrenVXUDNNa3ZTVHlMZmlSb0tyWXlpZGVQK1dYTkgwWU94?=
 =?utf-8?B?SXBRWk5TMHBad29QUUFxQWxvZER0VWpNV3hjMzdnaHRVaW9Wbit5K3Viam55?=
 =?utf-8?B?Zm1OdFdCSTFMV3JZbitJdGg0dVA1b1k0c0NzNHJJN2JrR3VlNXRFY2gxNVZr?=
 =?utf-8?B?TkpsaVlOWkJsQmNlcERVR1JPNU1KQTVBd21BK21HZWM4QWxtQ1QrV1cvWG5i?=
 =?utf-8?B?aGhwdjJaQ01aM0RJWmQvcTNqbU9KQytXYVNCdXUrMEk5OTVvUFRpZTFDcFNR?=
 =?utf-8?B?dWxsbTBLVzU1bHBWUlk1b3ZSTG5Yb2JxWDZZRWpwZUpYME53cVU0anQ1eWNL?=
 =?utf-8?B?UmMvWGI1UUVTQUpHYWxFeWV2K1pRZHB6ZXJXdDQreFZ5MUxKSHcrRUVqTU5z?=
 =?utf-8?B?MUU4aTllYjJlY1dyNEdRazdEdnoyYTJoZGlXTTBjT0tGSHJKeWJFRXdieG5q?=
 =?utf-8?B?Sk02ejg4NlBmdlFIMjJ1SEtzYjlLbWZzc01Pc1RvN0tZZlIwZUlVN2IyVC9a?=
 =?utf-8?B?K1Yxei9iakZWWG00NE1xL1lleXhCWlgrM3JsWVpLSUQwZ1llVzVvQ2hNRWhO?=
 =?utf-8?B?cEhpVTFPRkt4d0ZxMTNCM2ZYODdXL3NWUlZVNzRCTXRYNEZHbExxUTZQVGhJ?=
 =?utf-8?B?MkkxUmsxUmE3cStjWms0SGpTUURmNUk5cUJ5QS82eU1LQ1NhQTZESmFqV0pH?=
 =?utf-8?B?Z3BtK3JmMmFadXdmc1JHVVljOGZQODZuMEhNTnpuUzNna0ZGVkxRaFBLLzNJ?=
 =?utf-8?B?NUpsaXBSSWd6dHpoTTRrZDIwWmh2SDZzbkpjb0hDVWM2OThROUFtcFNyajBW?=
 =?utf-8?B?clNja2p5Q3JoeGtOM2VoK0drNkdHS29MaWdGeXVHVjFDZU1XblNyY1lQOFRP?=
 =?utf-8?B?cEZsZnRIR3U0NGo3bklJYU4rRkJyTEh2d2RxR0JxUWJNOHVueThmYVRDd0N0?=
 =?utf-8?B?c042Q3JDaktzZ2g4SUg1Q2ZoWTNLMlNiQVh3WE5lYTZWMnJzLzhSTEczZ3h5?=
 =?utf-8?B?Y3FuNGhxdXU1RWIxdjQ4NlpxWkx5c0lBbFVpc2I5QkVtWmtxclREU3NOUEhI?=
 =?utf-8?B?SXU1SmIyWVYrak83emI3TlBCNUxFb01yTlhYYW0zVnpTa1FjNzB3Q293d3pR?=
 =?utf-8?B?UE9SZ21lbU5TMVpKZWhMNWdYdDBrRUxsZjlveEJSaXRoQy9icU1pcTdQVHlP?=
 =?utf-8?B?OTlUM0RNNHFNbktCQ1dCWHRiRnorSGtPanprS1Q3cGhBK3FwOFVrZmNPTjdv?=
 =?utf-8?B?cGVIUCtLQ1FxNnl1dUN5bXdSV0lHR0RVUzVGMWFxbnYxb1loMldONXBrSllR?=
 =?utf-8?B?Q3FUdjRlZUNNNHVNNmNOT1Z0VExPeXFDaS9iM2hCWFRNZkVVenprOGdBUERU?=
 =?utf-8?B?ZHpkNDN5eHZ4bWQvbUg2azlXRW02d3EwZ2NQUSt6VTgzWURKeUFwRTcwdnA0?=
 =?utf-8?B?YUJoVHM2b25MMU1TWDQ1WFFQd3hzSFNBbmdGemd5TUx4NGpaY3AySTZ4cWV2?=
 =?utf-8?B?cSs5RkNxUHc3Z1FWZVhvRSt1bWhSZnhvWUFsaEdiNDRmOVJuQ1gxTzMvMWNE?=
 =?utf-8?B?MEp4RkJDYzA1UU0vZVJxVjN5bGlQOFNOTS9hcGxNbW9aeXNubU1wanE2NWdz?=
 =?utf-8?B?aUt5aFJJRmVGb0g3SDhyRkNxZzNYczFZUHB3M3RjeGQxQ01KSnF0bENZOHhV?=
 =?utf-8?B?Umx6NUg1OGZWMjJ6cXRXYUhZVXR3cnFGbE5ReU5Tc1ZJNmk0WUlOS0liOWlE?=
 =?utf-8?B?cy91NnhoVm5oV2FiZWhDdz09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RnJwa0RUcmFZS3dhZjBjWGx3VS9STjJVcVVNUlYzU1RUcFQ3VHNGUEh3d2hM?=
 =?utf-8?B?R0lGOWp6N0UrUzROaWYvVS9TY3hNT3RaV2I3dUhvSU9wdUZrZVBFWlJoTDRY?=
 =?utf-8?B?VHZMNzFpcGxoZjVzVjdkUEdjT2hqMnRYWDZITkJGSnJLelhHd3p2MmhkQ0Rh?=
 =?utf-8?B?TERySlN0UzhvWXlvUGRpaktXZmcyTEV6cjhFYWZUNFdVSHhWRElDVlBSTVJF?=
 =?utf-8?B?cXFBa3JDelhEb09hRHRqYTllRWhBMEJZNjlwYUZUdTNLU0hOVFlmVkFwdjd1?=
 =?utf-8?B?YkRHa3grWnVhZTY0d0lsMThWU3UyV1kya21mTXQvNHZTZXZYVmhvVGY1SmVG?=
 =?utf-8?B?b2M0eXI2UGowT2Jjcm9ZdGF6NUI4aGVCSDFPVitiK0tpTUEzeHVFcjhKRjVa?=
 =?utf-8?B?RUtPQkd3SEZLNkZnQTZSZnF1MzI2VHJadzJySUZoQ0dqa0FueE02dVJFVllp?=
 =?utf-8?B?OEpGekFmSnhoc2U1c0FsNEF6ekdQRlk1Y3pySmdCTm9wRlFDMHdCR1BSVCtR?=
 =?utf-8?B?R1laaGR1bGNGZDB4SGM0VExMNWxFeWVzT2hIV3lrL015REhDVTVqUHZWWW4x?=
 =?utf-8?B?dXkwNk15N21TNmtFYWgzQU9PT0ZDRk8rOVhuQWt3VC9NdElzQmM0dXNuVXQw?=
 =?utf-8?B?Y3c1V2NyM2FvQTVtNUVhcmh4OEZqVHp3SjdpbS9GY3ZIWGhaZ2k1ZDROV2RZ?=
 =?utf-8?B?YUNtbXNYdHc1bFlNb2V5SllSQlJhQS9kVjBudERJMko1dENHRkZRWlhDa2NV?=
 =?utf-8?B?enVtQm4vTkRXcE9DU3pDWWJrWWFUUmJYcEt4U24rcnVMTmowYVV3ODRrYTFt?=
 =?utf-8?B?M0h6WWpldTJoUGdidlpEUmJhTkhSV2NaOGhqYng4SVU4aVRYcjJwVHRNU3RR?=
 =?utf-8?B?M3NxUjVlQ3kzYlpUVDJrbWpKSDRtMFhoQnF5ZUYvU29pNEVVNHprR1hBZDlj?=
 =?utf-8?B?OGNXdU4vYTBHRlc5OU5ic3FPdGRXbVdiTXpadHB6NCtRTmFURy9lZ0g3LzBD?=
 =?utf-8?B?eUQ4NmZjbitjZWZST3ZQd0tibVFSZi8rcWFyNEo3dGtlTGMyNHBaMTJSeFBD?=
 =?utf-8?B?ZFpWOGpHMDFjSHpocnFzQlhCSUUvWXQ0dzRSZzRlSXhRZ1FGbEZMZVhJc0NY?=
 =?utf-8?B?UExSZ2ticDlCVzhuZWxtemtEYUpwZUpwS3FtYWM5d3E1WTZNVEtia0ZSRmpT?=
 =?utf-8?B?aDNWRW51VVpNYWRFclFURXM2c0pRcVBtYW9SSFRhRnJOei95NnFPbTE1czZk?=
 =?utf-8?B?d3IzYjB4RHVNeEVrSVJGSHlKd0xXUW1od2lkN0lSb21iZWNhVDNmUEdBZ1pS?=
 =?utf-8?B?bWljWVRCK1FwZjNrNDIvVE5FNnFmblZvcTR1WHNCQzJaRW53b2N4STRRZE1B?=
 =?utf-8?B?K0dKeEpjeUp5NWdPOFpYWGlneG01NCthb21weE5nZnVlVFF3UnAxNi8zcUlv?=
 =?utf-8?B?dHNlaGhtS0xudnR3RGNreWNLeVZzd1IrVDh0YlRNMGcyT3V4aStKdlRUMHFG?=
 =?utf-8?B?TWxmNzBRVnBpc0FGVm0xQ3FydHR3SXJHS2ZjZmRTMjg4dFRwT3FlS3VIWXlY?=
 =?utf-8?B?WUFFY3M3UWJIeWk4dHowbVczSzA1K2hRMUZrUEZZbE1haGM4RWZqV1hyeHI3?=
 =?utf-8?B?cEFSeFRIK3V0Z2dQQ291NldtNkEwenNwVXZqcTJCellBM0RDNytxQjkwcDdY?=
 =?utf-8?B?TXBNMWs4QWQ3UmNvQmo0S0tIRVNIV0hreTJNcWxINERTNWs4S29UejNJTmJ2?=
 =?utf-8?B?VmZOaXNCclFRY2dwVEZHNlMzd1BkZ3YxRnc3NHV3MGlJSCs0YUpuQWZ2S3Rj?=
 =?utf-8?B?Nm5IMGNJK3czNDdrK1VkSFMxUG9xdC84ZVlYanRyM3VaSlpvQVVUK05ObW1S?=
 =?utf-8?B?Tk1UOG4ycVRFWGZPSU55RVN6NHVQSG40bVlXT1F5NEhBaGRZSTFSRHU2TVpn?=
 =?utf-8?B?ZjFvSitXTmJsY2VEaVNyUk0wK2M4ZDYyRWtNTEZydEZYSEdXQ08yN3BsUkZw?=
 =?utf-8?B?Z3RKdFBaSXMwdUZWQUs3MUtlR2FCREZ2VU9JbVdMb3N0TjBEaXBwUXY5NHFC?=
 =?utf-8?B?UVJhYU84YlFXeU1RS0Z0YlcrUW85MWZFbFI0NFRZZ28xbjdDZWZNYW1odXJE?=
 =?utf-8?Q?5AT/y40zSy19Y+KLt4And/Rf5?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: feae8f74-986d-43d8-0ffc-08dc8544263e
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jun 2024 09:44:52.5201 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wnE/Qc5uJTCwIjYU350Gn5NSr04M6Y3FxOewih0UvCgR4gi4NARUzoY/Brp0ZK8Ngf5qMyQeHAZdq/05fac1hWA40125V6rmWaTMMhsbG9U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7838
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTmlybW95IERhcyA8bmly
bW95LmRhc0BsaW51eC5pbnRlbC5jb20+DQo+IFNlbnQ6IFdlZG5lc2RheSwgSnVuZSA1LCAyMDI0
IDI6MTQgUE0NCj4gVG86IFVwYWRoeWF5LCBUZWphcyA8dGVqYXMudXBhZGh5YXlAaW50ZWwuY29t
PjsgaW50ZWwtDQo+IHhlQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBDYzogR2hpbWlyYXksIEhp
bWFsIFByYXNhZCA8aGltYWwucHJhc2FkLmdoaW1pcmF5QGludGVsLmNvbT4NCj4gU3ViamVjdDog
UmU6IFtQQVRDSCBWMl0gZHJtL3hlOiBBY2Nlc3MgcG9ydCBvbmx5IGFmdGVyIGxvY2sgYWNxdWly
ZWQNCj4gDQo+IEhpIFRlamFzLA0KPiANCj4gT24gNi80LzIwMjQgMTI6NDUgUE0sIFRlamFzIFVw
YWRoeWF5IHdyb3RlOg0KPiA+IEN1cnJlbnRseSwgcG9ydCBpcyBhY2Nlc3NlZCBiZWZvcmUgbG9j
ayBvZiBwb3J0IGlzIGFjcXVpcmVkLg0KPiA+IEFzIGZvbGxvd2VkIGF0IG90aGVyIHBsYWNlcywg
bGV0cyBhY3F1aXJlIGxvY2sgYmVmb3JlIGFjY2Vzc2luZyBmb3INCj4gPiBldmVuIGJldHRlciBz
eW5jIHVwLg0KPiANCj4gVGhlIGxvY2sgaXMgZm9yIHByb3RlY3RpbmcgcG9ydC0+YWN0aXZlIGxp
c3Qgc28gdGhpbmsgdGhlIGNvZGUgaGVyZSBpcyBmaW5lLg0KPiANCj4gDQo+IFJlZ2FyZHMsDQo+
IA0KPiBOaXJtb3kNCj4gDQo+ID4gVjI6DQo+ID4gICAgLSBBZGQgcG9ydC0+YWN0aXZlIGNoZWNr
IHVuZGVyIGxvY2sNCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFRlamFzIFVwYWRoeWF5IDx0ZWph
cy51cGFkaHlheUBpbnRlbC5jb20+DQo+ID4gLS0tDQo+ID4gICBkcml2ZXJzL2dwdS9kcm0veGUv
eGVfZXhlY2xpc3QuYyB8IDcgKysrKy0tLQ0KPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0
aW9ucygrKSwgMyBkZWxldGlvbnMoLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0veGUveGVfZXhlY2xpc3QuYw0KPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9leGVjbGlz
dC5jDQo+ID4gaW5kZXggZGI5MDYxMTdkYjZkLi5mY2JjM2JhYzFlYmUgMTAwNjQ0DQo+ID4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2V4ZWNsaXN0LmMNCj4gPiArKysgYi9kcml2ZXJzL2dw
dS9kcm0veGUveGVfZXhlY2xpc3QuYw0KPiA+IEBAIC0yMTAsMTUgKzIxMCwxNiBAQCBzdGF0aWMg
dm9pZCB4ZV9leGVjbGlzdF9wb3J0X3dha2VfbG9ja2VkKHN0cnVjdA0KPiB4ZV9leGVjbGlzdF9w
b3J0ICpwb3J0LA0KPiA+DQo+ID4gICBzdGF0aWMgdm9pZCB4ZV9leGVjbGlzdF9tYWtlX2FjdGl2
ZShzdHJ1Y3QgeGVfZXhlY2xpc3RfZXhlY19xdWV1ZSAqZXhsKQ0KPiA+ICAgew0KPiA+IC0Jc3Ry
dWN0IHhlX2V4ZWNsaXN0X3BvcnQgKnBvcnQgPSBleGwtPnBvcnQ7DQo+ID4gKwlzdHJ1Y3QgeGVf
ZXhlY2xpc3RfcG9ydCAqcG9ydDsNCj4gPiAgIAllbnVtIHhlX2V4ZWNfcXVldWVfcHJpb3JpdHkg
cHJpb3JpdHkgPSBleGwtPnEtDQo+ID5zY2hlZF9wcm9wcy5wcmlvcml0eTsNCj4gPg0KPiA+ICAg
CVhFX1dBUk5fT04ocHJpb3JpdHkgPT0gWEVfRVhFQ19RVUVVRV9QUklPUklUWV9VTlNFVCk7DQo+
ID4gICAJWEVfV0FSTl9PTihwcmlvcml0eSA8IDApOw0KPiA+IC0JWEVfV0FSTl9PTihwcmlvcml0
eSA+PSBBUlJBWV9TSVpFKGV4bC0+cG9ydC0+YWN0aXZlKSk7DQo+ID4NCj4gPiAtCXNwaW5fbG9j
a19pcnEoJnBvcnQtPmxvY2spOw0KPiA+ICsJc3Bpbl9sb2NrX2lycSgmZXhsLT5wb3J0LT5sb2Nr
KTsNCj4gPg0KPiA+ICsJWEVfV0FSTl9PTihwcmlvcml0eSA+PSBBUlJBWV9TSVpFKGV4bC0+cG9y
dC0+YWN0aXZlKSk7DQoNCk15IGJhZCwgSSB0aGluayBoZXJlIGxvY2sgaXMgcHJvdGVjdGluZyBh
Y3RpdmVfbGluayBsaXN0IGFuZCBwb3J0LT5hY3RpdmUgZG9lcyBub3QgbmVlZCBhbnkgbG9jay4g
TGV0cyBkcm9wIHRoaXMgY2hhbmdlLCBpdHMgbm90IHJlcXVpcmVkLg0KDQpUaGFua3MsDQpUZWph
cw0KPiA+ICsJcG9ydCA9IGV4bC0+cG9ydDsNCj4gPiAgIAlpZiAoZXhsLT5hY3RpdmVfcHJpb3Jp
dHkgIT0gcHJpb3JpdHkgJiYNCj4gPiAgIAkgICAgZXhsLT5hY3RpdmVfcHJpb3JpdHkgIT0gWEVf
RVhFQ19RVUVVRV9QUklPUklUWV9VTlNFVCkgew0KPiA+ICAgCQkvKiBQcmlvcml0eSBjaGFuZ2Vk
LCBtb3ZlIGl0IHRvIHRoZSByaWdodCBsaXN0ICovDQo=
