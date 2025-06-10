Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26CEBC5B543
	for <intel-xe@archiver.kernel.org>; Tue, 10 Jun 2025 16:34:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D789210E320;
	Tue, 10 Jun 2025 16:34:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f8fWhihr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F79010E320
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Jun 2025 16:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749573259; x=1781109259;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=IEpACBBSUb2vQmCFvmLyzpm5FzHPa50c7RcGPef6Wjw=;
 b=f8fWhihrEq1Y9sZBNoY7OQBhK8e75O2Gb4+jAAGhxbOIczx/osb+2dpD
 01PgPljiPniY8t5906saWLytz/diCjDaciex5aa6D5pYW5vEHSHWtRhFe
 bh7p1p0mkFzNrkahxyBjaLxxC/ZhfdI1WJgbMZhn3LtlnDMAMIPaTpFI7
 Sr379eSA77hAKk2BCU9pg0fjYrcb+DZhOmLK6MVkl6jrFka7NGuXn/Czk
 dpSda93pOrkr7Ey1vT5ZTqx3LkqiLrF2toRSjbP7WgphcXZiPQ/9aug79
 xb5VcU73/3n2weQWvha+0k+nkKUEvNI3as0SyNZEhVuywGO9c/tNVA0on A==;
X-CSE-ConnectionGUID: SpKB7Ru9TTmgoDN3TscNnQ==
X-CSE-MsgGUID: /45DtuO1RTKofF39uZhYDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11460"; a="51684903"
X-IronPort-AV: E=Sophos;i="6.16,225,1744095600"; d="scan'208";a="51684903"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2025 09:34:18 -0700
X-CSE-ConnectionGUID: 3WZ7axoPTlKlQV1yjWTKpQ==
X-CSE-MsgGUID: Kbe6IKiiRti9ucv55uuG/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,225,1744095600"; d="scan'208";a="147844035"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2025 09:34:17 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 10 Jun 2025 09:32:41 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 10 Jun 2025 09:32:41 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.89)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Tue, 10 Jun 2025 09:31:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VdwHTR2PJ/uuColfHcxj/+9Lf7G4HAzMWehG3xS8tsXtK4MOLb3ittFlNnQSxxSMEkM6PIEHQcZR5zLbiB8U7/KRS9GgQ2Fa9nWp4+yxBTh5xsjCsS5XH7c5xU1JmH/22Luckx1XLiQPATWGF1OFp6DgyOjq5fXK+GHoOmHdSw6qiCdZv89G8NTt/Pt5nadM8wnoJDqAHBfQQC7ZrTGwxnyr7fucMgzIMCn28ynHA59MY2wqWPXuG+3UOpMi8NvulygZw1MOoAQVDe6Q9ilMxuRbkg7SoJpCtDcfuwRNFfFwMYw0BzkgcP1ijd8xTjNutnJezr6vMSnaBGdlKZV0ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IEpACBBSUb2vQmCFvmLyzpm5FzHPa50c7RcGPef6Wjw=;
 b=ANvbl+bvNLMLEz20S5QzlM2eJwAUd3DqRiqDm9M98ibXzP2N2NP/WWQCJqEcqF46vu3a0UbvoaQY3u2rDkPTnnyT8n7feo8Og2m8bLloDoKaokQ27kVyXm8kmep557lokUq1n/xdbii/2lC7PFyEtSdfEvMiwU3wwHput9V/Sjs8NKkYk2b9iPI8ZPiB7afUl8MzhBr/MgxdCq22TX7tyhF1Mc02Lkk/xrk+lsi3TLfQeW4My62vSrz/2Ox9EDtmXCwoqd2ngR9snZU4H/La3ofeswN9EHHbHCibgGwIcP0BoQOKfsRQRJQVSgd1h3Gkhc7F0rD6/nVJ+vBiMwXAog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL3PR11MB5700.namprd11.prod.outlook.com (2603:10b6:208:33f::22)
 by SJ2PR11MB7672.namprd11.prod.outlook.com (2603:10b6:a03:4cd::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.33; Tue, 10 Jun
 2025 16:31:52 +0000
Received: from BL3PR11MB5700.namprd11.prod.outlook.com
 ([fe80::7fe7:55d4:2fc0:6398]) by BL3PR11MB5700.namprd11.prod.outlook.com
 ([fe80::7fe7:55d4:2fc0:6398%6]) with mapi id 15.20.8769.029; Tue, 10 Jun 2025
 16:31:51 +0000
From: "Taylor, Clinton A" <clinton.a.taylor@intel.com>
To: "Bhadane, Dnyaneshwar" <dnyaneshwar.bhadane@intel.com>, "Roper, Matthew D"
 <matthew.d.roper@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 8/9] drm/i915/wcl: C10 phy connected to port A and B
Thread-Topic: [PATCH 8/9] drm/i915/wcl: C10 phy connected to port A and B
Thread-Index: AQHb1xxu82DgvOWCrUSvuepXiYykn7P68aSAgAF8+oCAABeCgIAAFfwA
Date: Tue, 10 Jun 2025 16:31:51 +0000
Message-ID: <6925754dbc7e5feb99c98adf30b2354b9cc78eaa.camel@intel.com>
References: <20250606195104.1771715-1-dnyaneshwar.bhadane@intel.com>
 <20250606195104.1771715-9-dnyaneshwar.bhadane@intel.com>
 <20250609150527.GL6239@mdroper-desk1.amr.corp.intel.com>
 <IA1PR11MB62668338EF7E973EBC4AB446E26AA@IA1PR11MB6266.namprd11.prod.outlook.com>
 <20250610151309.GS5080@mdroper-desk1.amr.corp.intel.com>
In-Reply-To: <20250610151309.GS5080@mdroper-desk1.amr.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL3PR11MB5700:EE_|SJ2PR11MB7672:EE_
x-ms-office365-filtering-correlation-id: 6d7e7da3-ad51-4ef4-9d19-08dda83c4e28
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?utf-8?B?WXBDVGFRZmNqSEZxNm5hMzlNNEhuT3JrOGk1eTFKeXIyeldQVGI0ZnZpNjMr?=
 =?utf-8?B?SzNJaG5WNnRJTVdNYWM2Szk5OVd2R1BZMmJhRExnR1RXNEFyMlhWbkFoTDVt?=
 =?utf-8?B?TlBZT0Jnb3J1MTNvbzFlaEJrQ25IM3lDRzFQNmZWSWJKOEVTTStlQ296S1k5?=
 =?utf-8?B?eFU3blJEMngwd2kzQzFmRVdMV3ZMRmtwTC8xdkk0N3hveW55WVNya0I2dE0z?=
 =?utf-8?B?bkpaSklCTHNBam1VN2lTNE85eWRmY3dROHo0NGZYTEtVbEk5MFMxdWdWWFJh?=
 =?utf-8?B?MW1oNHRXZVl1VVpnY1lSUVBWWDFSVHBQVTk0QS9MVmcyY0dyMmNWWklUcE5U?=
 =?utf-8?B?N0w0eFF2TzVvelJSTkdja21KSkt3MmJHSWZGS2RuV0s0cUtqOGU3WW1hRmgr?=
 =?utf-8?B?UG1rdU1uc3l2SG1sVGNrb3p0NmJlay9LN1Y5eW5IQVExRFlGYzc2aXhGTXJq?=
 =?utf-8?B?TC80Wjl1V2x0UngxcXRCbnV4U3c3U3ZqUHBSMWRKdU81UHpINUxjS2FWcEZ6?=
 =?utf-8?B?WkJtYktmMmpkK0sxMmkyRFh4NkxERkxLUExyek5Hb05PVHoxZ2ltZEJXR25O?=
 =?utf-8?B?MlVuQVBHbUY3bXY1VG5neTd0VVNYajhkc29hZkdOeEY3Z3orMlIzU3UwMXVP?=
 =?utf-8?B?MkJiUithRHp2NFNhYWY1RGFCTGlaV2xwNzZHcFcwRnZSaTl3c0FhdnowWkt5?=
 =?utf-8?B?SXN4eDJCM1ZDd0dFTUFVTGdISnVmdldKTVdYSTZwV3dRYVJZT2xTOTRRVkE5?=
 =?utf-8?B?L0IwN01WQmFXODJ2dEcrbkNCbW1vRkc5NkthVTJQWEd2aEVUTWNpckhTbk9H?=
 =?utf-8?B?NGZDVDFHS2V5NkhTSGlMSy9GQ3dXY2RxTHc1T2lydGZqS0ZzdTdKMHhZQWsx?=
 =?utf-8?B?Z1A1ZkFuTTBObXRLZ05XSlBjVjJmYW5WcDVsZVMrY3FhZEh6WDdCM2dRNmdi?=
 =?utf-8?B?VjJ3eEFWbEdlZ1JkSkp0blZoMFVDRnBUWXhwSlBrM1hjS29tcFI4VVV6QitQ?=
 =?utf-8?B?QUd2bDQ5OEprTFBINksyYXc5aWh5Z2JCV0FDMDIvYVhLYTRTOThNZGViRzZp?=
 =?utf-8?B?dHF5Qmk4d3FpTFJYY0kzYW1EenA2UmxDVVVtM1VOSXAyeVRqK2g1S25jOUwz?=
 =?utf-8?B?UXZDdWlqUTNmb3hxa3NDdkk4bTNNQ1c3bVptdWpWWkhLNnFicVhqRVErU3Vm?=
 =?utf-8?B?aUdnVkcvQ05RNlhPTUxwVzlORHF6UlBrM3QrbW5wQVFnR0VhUXh3eTRLck9l?=
 =?utf-8?B?U0JFSmlKYks1SFJacEpJekRoNlNEalNuZEFweDgxMHg5dHdqQ1ZsMDcvbkxK?=
 =?utf-8?B?VGVsVE53TGoxMXZyYmk1bjQ1U243U1ZiWkVRUDlxRDQxOWFMMzMrS0Fha3ZS?=
 =?utf-8?B?c1V4dmFJWHdTODlJWlNEenY4MlJPbmM4ZEtIZGtDNkRKZ3UzOUVscG9DM0tE?=
 =?utf-8?B?WjdIWWVjNTZaYlN2NHhCaDQrQWFOeXhTcERpcnJYbTVzRm14bkU0aFYxek9Q?=
 =?utf-8?B?YkFiRVFramFZRVFYOEdXU2xNWDlPVE1wczNRazQ0TXJaUk5ZT2pmQnJVU1Nu?=
 =?utf-8?B?bXlFMDM3dDdLL29OOGkvMmZiK0tKT0RRbGZFdUJsT3pHUnNFYlhhZlJMeTRm?=
 =?utf-8?B?YlVRaWdUcUw2dkw5djJvT2JzWVJYcTdOZGxpeEFtZlJYeDdWaWQ1QWFLZjhr?=
 =?utf-8?B?SGZ5UWRhdmtoZFBzOVJMdlQwbkJka0l4ZkpqYnZMVEhVbS9mVG44S1dLR0FC?=
 =?utf-8?B?N3FOdHZTQ3R4MVJ1aDVCcWJMcG85SkRoQjhkL2xXQTBSbEpDcWFDMFMrUkJI?=
 =?utf-8?B?L1RvOFowaFJQT0pZZ1hCbUJvT25XZWNoaFlscEVMU2NDaGxrdXl6NzlMUmZQ?=
 =?utf-8?B?YkRhcW02SER1TWpLWnVLd1VRcVhJUkR3bTVWa3lPYkdQMmExZmd6aE0zNWY4?=
 =?utf-8?B?eXQwdFZweERlbXhBUXVYRC9EaFJpQ1o0OS9EaE1FdE9ZK3phWjFzdnI1cThC?=
 =?utf-8?Q?hF1eg50qDY6zBjujLSwwmYTo+ndlOM=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB5700.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Mzg1NHhmUEgvdm1FV1lpM1p1TnFzS0pLWjdKcWZ3SDVhcjJObzZnZ1ZEM0V1?=
 =?utf-8?B?RUVRNlBHYUNQQWNEcTlIU3RObFhtU3lMOUFrZUMvN0tybnk2dUFJVmpTcXBu?=
 =?utf-8?B?NmlacG1XeUNFTjRqbE9tdlpYejJ2WDlKeWlYZHdDZStDYlh1RVBsYnpPSUgx?=
 =?utf-8?B?OXZaRUV5OGNuWi83MGFGMW1QZTJZNkliU21GYWZGNk0zSkxyaDBKMFBWQ2sz?=
 =?utf-8?B?cm1Ca1NPeXJYOEtiWSs0dlB5anloa3QySXh3UTlkMEFvVlkrZWdSUXh1RHUr?=
 =?utf-8?B?NkFJdGtSSzl3a3RrdEMraDFSaDNGdldmQnNyZFIxV282cDRWQVU2L0w4VUJ0?=
 =?utf-8?B?Rmd2R252UmEvaGF6ZHp2M2FoQ2NyQU1ub3Vma0VkZHM1L3A5MjBCeDRZd3pq?=
 =?utf-8?B?djhjM3Zpd2pzdWd0endjQzdFWk5GT05tNmRhL0VKajg5UVlrTWZBSGlTdjh5?=
 =?utf-8?B?TjJ3eS9hZEc2eHVjT2xaSUJBL000Q0ZmWkZlcmg1QWppaTg5ZjJWdkpKTU9u?=
 =?utf-8?B?em92aW5ZU3VScnJRNFJhd0NXMndkVGRHZm9Ga0RJelhCRG16L1lDVmpZWGRX?=
 =?utf-8?B?MlFVSkgySUVCU1FBMXJGelRYYzFSZ1BvNVVacnVuU0JTUENkdlhJK1NJOE5P?=
 =?utf-8?B?T2dmYTFMcTN0cUsrdm5CamswZDkvYnFVNENLdjhUSUVSeVJUWkpleGw0dFlI?=
 =?utf-8?B?Y0J2VytvYkNwdkR5aFBVa1B1amFKSXF4TExqelU1MlNhdGtid2k4QTh3VGg2?=
 =?utf-8?B?MjJTSUVIanJheThjNExIeDhnN0JMRUxzWnN0NEdDOXFWVytaVHBOYmNpeTdX?=
 =?utf-8?B?eG1pV01XWUhRYXYvZ0lyUExiTVA4T2d4VU00OVBOelRJVkFWc0M0NVl3ampL?=
 =?utf-8?B?MDJDWEZEWjFoREZkZy9Qa2h3R1JlZERYc3ZlRENXMjRJMkQzYWtsOEJLakpL?=
 =?utf-8?B?K1QrbDhGVmszZysrZzFZVGwwM28vMk1ZQUNZT0JveFpiZy80WkUrK3hzZnN0?=
 =?utf-8?B?UHdKbGp1dUdXL05ES1BLSVNEVmtudkUzQTYrL21vc09pTDhOblI0N1BmQlVK?=
 =?utf-8?B?MzdEb1VoaGVHT3UyaFd2bjF2WlVzUEIrb0ZQWXFPUTlWRHcwU0R4OHJuZENa?=
 =?utf-8?B?dm9QOVgzY1ZJUy90RmM1TjUycXlWM0lEZDM0UVZCaDRLcjM1VVEzLzVWZW51?=
 =?utf-8?B?RnNMM2xWbjRpMUFGR2hlUjJLR0ZEQzBSMkFhUC9vYXhNaFczTHdLbm9zLzVy?=
 =?utf-8?B?ZjJvbng4djlCcWFyeEI2ekdiTlJLYTQ5SUxTKzhPNjdmU2NBejhzSXNTTlR1?=
 =?utf-8?B?Ynp2eUJWTU5MbVZGRzEyamJPNGNOc0RDc29QQlE4YUU4QjUxS3FadFoxcVlt?=
 =?utf-8?B?UndDaVBUdDVmQUwzQnJFUURESktyc3ZEMGhQZHB2L1dqcG1PVjVGUHEwb3pk?=
 =?utf-8?B?cExlR0FZVlhMbXE2ZVJMWjdZVEo5M2FKZTE4Y2lWNzM0cXBFMy93bFU2WnAz?=
 =?utf-8?B?WmNkNTNIanp5M2hVVFlUb2ppd0xocHlhck90ZzdhaUNBRWFuS09oMmw2N3JG?=
 =?utf-8?B?OVdPdmM2RTRHc0N6Nys3SkhadGJvMFhMOGdxNGVoSU8vSUcwUzBWRjJRUE9O?=
 =?utf-8?B?VUcydVkzL1F0MDFZSGtWd1JvRWJBa1BERzhFSjFGSFVnWU5mU1FBSDlUa1B3?=
 =?utf-8?B?My9jR1ZnanRta0RsdEVPRkdWcXFCaGdvbjdob3dSTkdCeWNiN3FYUnFESTAw?=
 =?utf-8?B?V0VIS1Q1RVVBejBmc2VUTlBmVjNCWmVGSmtJblp4RjFHQXlaR08yWmEwVkY4?=
 =?utf-8?B?aVBQVWVkaE03cGhUM2RzREFRSjNHaExqQ1I2TjV2LytXSThvS3psQ2JvY2pS?=
 =?utf-8?B?R3F6MFBjM1c2L2VxSnZBd09ORjhLVFJFdERnK0R2M21ub1hPTmQ1a2pFUDZz?=
 =?utf-8?B?L0g5aTIvZW1lK214RDZKN21hU29Cd1NjTWFpRmE2aEVPWFJtWnNLZEY2SW5Q?=
 =?utf-8?B?akpUcHZIRFh0SC9GYlAxZ1dYS1ArcUt5dzg0bFMyNlhGV2VXZ0k2K3FsbWZo?=
 =?utf-8?B?Skl1eGRZMVVjV3B0UDBnMWJCNTE5cXFIZ2xCejNQYTl4NUYzaDJZMWV5R3h4?=
 =?utf-8?B?UlptMzVmUnA4ajhCMFVWdVRBdSs0VUp1MG1hejc0QThNWHVwb2pwdmFoSkxt?=
 =?utf-8?B?WkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7335B75892728547A44AB6087754EA91@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB5700.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d7e7da3-ad51-4ef4-9d19-08dda83c4e28
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jun 2025 16:31:51.9179 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3KPSwKvkWrWxttmXRV/m5srRaaEEWaZNCZFR24ddnUHffa++YSwudunpRYT953icKo4XOSOcXS1HefLdNWf13YLanfQXK5tEfinjD7U2tMA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7672
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

T24gVHVlLCAyMDI1LTA2LTEwIGF0IDA4OjEzIC0wNzAwLCBNYXR0IFJvcGVyIHdyb3RlOg0KPiBP
biBUdWUsIEp1biAxMCwgMjAyNSBhdCAwNjo0OTowMUFNIC0wNzAwLCBCaGFkYW5lLCBEbnlhbmVz
aHdhciB3cm90ZToNCj4gPiANCj4gPiANCj4gPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0t
DQo+ID4gPiBGcm9tOiBSb3BlciwgTWF0dGhldyBEIDxtYXR0aGV3LmQucm9wZXJAaW50ZWwuY29t
Pg0KPiA+ID4gU2VudDogTW9uZGF5LCBKdW5lIDksIDIwMjUgODozNSBQTQ0KPiA+ID4gVG86IEJo
YWRhbmUsIERueWFuZXNod2FyIDxkbnlhbmVzaHdhci5iaGFkYW5lQGludGVsLmNvbT4NCj4gPiA+
IENjOiBpbnRlbC14ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gPiA+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggOC85XSBkcm0vaTkxNS93Y2w6IEMxMCBwaHkgY29ubmVjdGVkIHRvIHBvcnQNCj4gPiA+
IEEgYW5kIEINCj4gPiA+IA0KPiA+ID4gT24gU2F0LCBKdW4gMDcsIDIwMjUgYXQgMDE6MjE6MDNB
TSArMDUzMCwgRG55YW5lc2h3YXIgQmhhZGFuZQ0KPiA+ID4gd3JvdGU6DQo+ID4gPiA+IFdDTCBh
ZGRlZCBhIGMxMCBwaHkgY29ubmVjdGVkIHRvIHBvcnQgQi4gUFRMIGNvZGUgaXMgY3VycmVudGx5
DQo+ID4gPiA+IHJlc3RyaWN0aW5nIGMxMCB0byBwaHlfYSBvbmx5Lg0KPiA+ID4gDQo+ID4gPiBU
aGlzIHNlZW1zIGxpa2UgaXQncyBhIGNoYXJhY3RlcmlzdGljIG9mIHRoZSBwbGF0Zm9ybSByYXRo
ZXIgdGhhbg0KPiA+ID4gdGhlIElQIGl0c2VsZi7CoCBXZQ0KPiA+ID4gc2hvdWxkIHByb2JhYmx5
IGdvIGFoZWFkIGFuZCBicmVhayBXQ0wgb3V0IGludG8gaXRzIG93biBkaXNwbGF5DQo+ID4gPiBw
bGF0Zm9ybSB0aGF0DQo+ID4gPiB3ZSBjYW4gbWF0Y2ggYWdhaW5zdCByYXRoZXIgdGhhbiBhc3N1
bWluZyBXQ0wgb25seSB1c2VzIGRpc3BsYXkNCj4gPiA+IDMwLjAyIGFuZA0KPiA+ID4gdmljZS12
ZXJzYS7CoCBPciBtYXliZSB3ZSBjYW4ganVzdCB1cGRhdGUgdGhlIGV4aXN0aW5nIFBUTA0KPiA+
ID4gY29uZGl0aW9uIGlmIHRoaXMNCj4gPiA+IGZ1bmN0aW9uIHdvdWxkIG5ldmVyIGJlIGNhbGxl
ZCBvbiBQVEwgd2l0aCBhIG5vbi1leGlzdGVudCBQSFkgQj8NCj4gPiBIaSBNYXR0LCANCj4gPiAx
LiBXZSBjb3VsZCBhZGQgdGhlIFdDTCBhcyBkaXNwbGF5IHBsYXRmb3JtLiBCdXQgZm9yIG5vdywg
dGhlcmUgaXMNCj4gPiBub3QgbXVjaCByZWFzb24gdG8gYWRkIHRoZSBXQ0wgZGlzcGxheSBwbGF0
Zm9ybSBkZWZpbmUgZm9yIHNpbmdsZQ0KPiA+IGluc3RhbmNlLiBUaG91Z2h0cyA/DQo+ID4gDQo+
ID4gMi4gV2UgY291bGQgbm90IGV4dGVuZCB0aGUgY29uZGl0aW9uIGRpcmVjdGx5IHdpdGggZGlz
cGxheS0NCj4gPiA+cGxhdGZvcm0ucGFudGhlcmxha2UgJiYgcGh5IDwgUEhZX0MgYXMgaXQgd2ls
bCB3cm9uZ2x5IHNlbGVjdCB0aGUNCj4gPiBjMTAgUEhZIHR5cGUgZm9yIHRoZSBQVEwgaXRzZWxm
Lg0KPiANCj4gV2hhdCBkbyB5b3UgbWVhbiBoZXJlP8KgIElmIHRoZXJlJ3Mgbm8gUEhZIEIgYXQg
YWxsIG9uIFBUTCAoYmFzZWQgb24NCj4gNzI1NzEpLCB0aGVuIHRoaXMgZnVuY3Rpb24gc2hvdWxk
IG5ldmVyIGdldCBjYWxsZWQgd2l0aCBwaHkgPT0gUEhZX0IsDQo+IHJpZ2h0Pw0KDQpUaGlzIGZ1
bmN0aW9uIGlzIGNhbGxlZCBmb3IgdmVyeSBQSFkuIFRoaXMgZnVuY3Rpb24gaXMgdGhlIG9ubHkg
d2F5IHRvDQpkZXRlcm1pbmUgaW4gdGhlIFBIWSBpcyBDMTAgb3IgQzIwLg0KDQo+IA0KPiA+IMKg
wqDCoMKgwqDCoMKgwqANCj4gPiDCoMKgwqDCoMKgwqDCoMKgQnV0IGNhbiBiZSBkb25lDQo+ID4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKChkaXNwbGF5LT5wbGF0Zm9ybS5w
YW50aGVybGFrZSAmJiBwaHkgPT0NCj4gPiBQSFlfQSkgfHwNCj4gPiDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCAoKERJU1BMQVlfVkVSeDEwMChkaXNwbGF5KSA9PSAzMDAyKSAmJiBw
aHkgPT0NCj4gPiBQSFlfQikgKQ0KPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoHJldHVybiB0cnVlOw0KPiANCj4gVGhlIFBIWSB0eXBlcyBhcmUgYSBj
aGFyYWN0ZXJpc3RpYyBvZiB0aGUgcGxhdGZvcm0sIG5vdCB0aGUgZGlzcGxheQ0KPiBJUC4NCj4g
U28gd2Ugd2FudCB0byB0cnkgdG8gYXZvaWQgdXNpbmcgRElTUExBWV9WRVIgY2hlY2tzIHNpbmNl
IHRoZW4gd2UnZA0KPiBkbw0KPiB0aGUgd3JvbmcgdGhpbmcgaWYgdGhpcyBJUCBnZXRzIHJlLXVz
ZWQgb24gYSBwbGF0Zm9ybSB3aXRoIGRpZmZlcmVudA0KPiBQSFkNCj4gY29uZmlndXJhdGlvbiwg
b3IgaWYgb3RoZXIgV0NMIFNLVXMgc2hvdyB1cCBhdCBzb21lIHBvaW50IHdpdGggYQ0KPiBkaXNw
bGF5DQo+IElQIG90aGVyIHRoYW4gMzAuMDIuDQoNCklmIHRoaXMgaXMgdGhlIGNhc2UsIHdlIG5l
ZWQgdG8gbWFrZSBhIG5ldyBJTlRFTF9ESVNQTEFZX0RFVklDRSBmb3INCldDTC4gQ3VycmVudGx5
IFdDTCBzaG93cyB1cCBhcyBhIFBUTCB0byB0aGUgZHJpdmVyLg0KDQpDbGludA0KDQo+IA0KPiAN
Cj4gTWF0dA0KPiANCj4gPiANCj4gPiBEbnlhbmVzaHdhciwgDQo+ID4gPiANCj4gPiA+IA0KPiA+
ID4gTWF0dA0KPiA+ID4gDQo+ID4gPiA+IA0KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBEbnlhbmVz
aHdhciBCaGFkYW5lDQo+ID4gPiA+IDxkbnlhbmVzaHdhci5iaGFkYW5lQGludGVsLmNvbT4NCj4g
PiA+ID4gLS0tDQo+ID4gPiA+IMKgZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9j
eDBfcGh5LmMgfCAzICsrKw0KPiA+ID4gPiDCoDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMo
KykNCj4gPiA+ID4gDQo+ID4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9k
aXNwbGF5L2ludGVsX2N4MF9waHkuYw0KPiA+ID4gPiBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rp
c3BsYXkvaW50ZWxfY3gwX3BoeS5jDQo+ID4gPiA+IGluZGV4IDc1Y2FjY2I2NTUxMy4uNTllZWUw
ZWRlZjc5IDEwMDY0NA0KPiA+ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5
L2ludGVsX2N4MF9waHkuYw0KPiA+ID4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNw
bGF5L2ludGVsX2N4MF9waHkuYw0KPiA+ID4gPiBAQCAtNDAsNiArNDAsOSBAQCBib29sIGludGVs
X2VuY29kZXJfaXNfYzEwcGh5KHN0cnVjdA0KPiA+ID4gPiBpbnRlbF9lbmNvZGVyDQo+ID4gPiAq
ZW5jb2RlcikNCj4gPiA+ID4gwqDCoMKgwqDCoMKgwqDCoHN0cnVjdCBpbnRlbF9kaXNwbGF5ICpk
aXNwbGF5ID0NCj4gPiA+ID4gdG9faW50ZWxfZGlzcGxheShlbmNvZGVyKTsNCj4gPiA+ID4gwqDC
oMKgwqDCoMKgwqDCoGVudW0gcGh5IHBoeSA9IGludGVsX2VuY29kZXJfdG9fcGh5KGVuY29kZXIp
Ow0KPiA+ID4gPiANCj4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgaWYgKChESVNQTEFZX1ZFUngxMDAo
ZGlzcGxheSkgPT0gMzAwMikgJiYgcGh5IDwgUEhZX0MpDQo+ID4gPiA+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gdHJ1ZTsNCj4gPiA+ID4gKw0KPiA+ID4gPiDCoMKgwqDC
oMKgwqDCoMKgaWYgKGRpc3BsYXktPnBsYXRmb3JtLnBhbnRoZXJsYWtlICYmIHBoeSA9PSBQSFlf
QSkNCj4gPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gdHJ1ZTsN
Cj4gPiA+ID4gDQo+ID4gPiA+IC0tDQo+ID4gPiA+IDIuMzQuMQ0KPiA+ID4gPiANCj4gPiA+IA0K
PiA+ID4gLS0NCj4gPiA+IE1hdHQgUm9wZXINCj4gPiA+IEdyYXBoaWNzIFNvZnR3YXJlIEVuZ2lu
ZWVyDQo+ID4gPiBMaW51eCBHUFUgUGxhdGZvcm0gRW5hYmxlbWVudA0KPiA+ID4gSW50ZWwgQ29y
cG9yYXRpb24NCj4gDQoNCg==
