Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F319DC3601A
	for <intel-xe@archiver.kernel.org>; Mon,  7 Apr 2025 10:34:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B82A010E421;
	Mon,  7 Apr 2025 10:34:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WG2kC482";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 157A710E421
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Apr 2025 10:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744022059; x=1775558059;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Uf+l5A7v0cBv+l1ySXfXbg8zdoirixkap5PiOuRr1+M=;
 b=WG2kC482ZicBJQa99ipZ5FCIhmOHSrCr2mIHjFuIBsT5PAkp4C5zDdX6
 tBXUxYLWsas0wZbRPREn2AylF/Kr3PbfBqF1MRFwLBJ+wA8qWG+p8cFs8
 ymdQtb0MUhlFS9vlpTBhliQtauevkl0QsQZaUGrLbtD8sa7oB5P3DflYn
 JH/LgC9+Z6T0V+lvLGmZ+veQjLb18IryHRkWckv1Jwa6DXj9YME+GgGL2
 BEscTEWL4IfMuXyUs9dYdxjiWCfDBgsSiLEOwg96mTgawD0YFyyTSnMAQ
 +Ujkg9qqC22YfXxXA8ga29VHfOAmsjDnkrKuEogqYNLd5p8P/VCn3pHZN A==;
X-CSE-ConnectionGUID: MA5LLMfjRAStdiZ9D8QQ/w==
X-CSE-MsgGUID: o0t5a1UPTZqG/eFqM1dYbQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11396"; a="49192124"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; d="scan'208";a="49192124"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2025 03:34:19 -0700
X-CSE-ConnectionGUID: 3x2DXkXTRNa/F3DydpRz/Q==
X-CSE-MsgGUID: QoYbt91+TD2TRWC2a85TYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; d="scan'208";a="128240718"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Apr 2025 03:34:18 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 7 Apr 2025 03:34:17 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 7 Apr 2025 03:34:17 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.45) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 7 Apr 2025 03:34:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p5ddSLaN5V4YnOqw6JzKzP8D5Jcry7OsrysaLxhutEQGM0zsKCVnDXsVSPd5OIPum5yGKqg+GtUK5VsdJg5+GVfgMlXquA+xdzktHHn9zmTw/Ix7Ql/thnzqCLc86wzkhY6x/8Gmx/ddxDv6E/0q5T2/Hh+u3CiPYmEKpQxymrqGOqQsgctBJuAqMfCYp11cSTysakePpwiR76xw5E3oez97X7cAKBzLlH0340GWWVlKko7xjMbmLtdobYBOahTqq/5UY7AOJAnk3K298v+RdQSiYzNPRfhXjqeEB4k0kgfILQGoFnfE2oFT7x1HYsHSmrcnluC0FAlh+1dzXs3TLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FLpXOfLP5TMo/Uligln/QhFcXbc9RJInf+pk3I7vlIg=;
 b=HOscm/zXuDHOHdZNFvTwlc4iqGIzcC22+s6K6oBbNG4ZJpuxUx9u7H+LzZYpANWqzrjngYbN3AgIIbYQSQ/ghuhE6KCRLeA2JPTzhEct4kKnt0yBqx9nffaemH4DdjXLFb451on3AuHHrdT2OApZHUJ/uIP0+kCRUKMqUy9YjScNJpKAbu2WipsZPVFyJMQz0Fyh9/6piehtWe4WRTGJw1C16EzCDbQdhS38zp6Km26abfUCdJQZOftDbK+HHWm7UfDFTRba5+Kg1/dnJeuwMZTDP5h6dSIK4X/BPk2RWgTLsUuKp1229ihiRxhcC1UbQf4lcy6inHzZKvIhIFuy/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6974.namprd11.prod.outlook.com (2603:10b6:510:225::16)
 by CH3PR11MB8381.namprd11.prod.outlook.com (2603:10b6:610:17b::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.32; Mon, 7 Apr
 2025 10:34:15 +0000
Received: from PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::c0b4:f63a:9c33:ec4a]) by PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::c0b4:f63a:9c33:ec4a%4]) with mapi id 15.20.8534.048; Mon, 7 Apr 2025
 10:34:15 +0000
Date: Mon, 7 Apr 2025 16:04:08 +0530
From: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, John Harrison
 <John.C.Harrison@intel.com>, Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH] drm/xe: Fix taking invalid lock on wedge
Message-ID: <Z_OqICELyg3hWnfP@bvivekan-mobl1>
References: <20250402-warn-after-wedge-v1-1-93e971511fa5@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20250402-warn-after-wedge-v1-1-93e971511fa5@intel.com>
X-ClientProxiedBy: MA0PR01CA0045.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::20) To PH8PR11MB6974.namprd11.prod.outlook.com
 (2603:10b6:510:225::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6974:EE_|CH3PR11MB8381:EE_
X-MS-Office365-Filtering-Correlation-Id: 9230ddff-e6ae-46d4-6997-08dd75bfbe42
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WThvbUM5UTM1YzgyUFlXOSs0WEhpNWVVbHVSM3VrbmJsUXhhb3VKbnRBblFw?=
 =?utf-8?B?OTFMb3dWZ3ZPV3k1bFNHTnJ2YnJPT1IvenJLRFFrUUpTb2xCUnljOGFEdDI5?=
 =?utf-8?B?cFRqT1ZmdGRqcHhRZ2lub1dvaGNnWnEvYUpSWW5oZmE0RnNMUExaZ05nMmlW?=
 =?utf-8?B?Q2JMRDBIYnFTMkhlNDhXOUFCaWZ1TmI2UnoxMVpVc050Q2VwNE9sQU5XaFdJ?=
 =?utf-8?B?V1BlbjA5WWJyM21xeWZGdC9GdTZhb1k5eTc3eVN1bUdPdmhiZEV3SW91TUZ2?=
 =?utf-8?B?VzZtNXR5NGdudzlibkx3ME56d2JSSmoxanYwT0Y0RFNTaDRSa1pZSFR1Ynht?=
 =?utf-8?B?U3prQmdEQUJCelJXbVNudisvWU1sRWQwd1BJRmNQOE9hRDBEZFNGODN4dW9G?=
 =?utf-8?B?MUR4eWE1MFhtQXNKUmdET1ZpWjRlN3p1dXQwejVkbk4ybUcyVTBwVVpqbEFN?=
 =?utf-8?B?cjB3ZXRueG00NDJDcWZoWU5JazZjelJTWUQ3Yk83SERjNENxUjhHbWZMNE0z?=
 =?utf-8?B?SlBsbEo4MDZZUkR1aEttazZ5Sk5NVzY3Y3EwS3lxQW4wUzFmSzBZckhjYy9E?=
 =?utf-8?B?RlBpZnVDcGtZMUFTOXE5RGFPYTNLNElaUU4ydUowV2lPT29EVFl6YzZMeFhq?=
 =?utf-8?B?TEVseWJoUXZSNXc4b0VMWTVwT3FqSVhBZURrcTJTeXRtMHFiOUhWdGV1YW5j?=
 =?utf-8?B?anBXaW8yRGhpOGFSWS9PekVuQ0RrWnROdlNReEJiOVVlaUxqSnJ3ckQyNjly?=
 =?utf-8?B?TVgwdW5YenV0c3lFM1RsS0tqNWRuaERweGlheitlL1dmYmVCRHI2RTllS1JG?=
 =?utf-8?B?bE8rVFJTRmFIVnJ6QWpBcUkwZ2tJUXRwMUZ0VFYwMld3Ym1IZmZhWll3WUJT?=
 =?utf-8?B?a3hGYWFobEdyZ2xBejljSTZJNzBtUERCSmxrSFI3cVBjNkdvQytiMER5S3Jj?=
 =?utf-8?B?SkliOXJwMFFDYWxKUUhleC91RnNnaDdEekcrcXVDMjB1MmM2NDRZSUV5UzB3?=
 =?utf-8?B?K0h3MWFRZXB6UzR4SkhvcjlQRmJ1SXhxMVZ4OWtJelFsM0xJeHM3TmlXQmlQ?=
 =?utf-8?B?b2lvbTdXOERiT2VCRGpsQXB1Z1RTQ0E2MHIwOEZqVDZpM21yWEJ1MUpXcE9D?=
 =?utf-8?B?aGR4aTV5ODhHazJPZTZ1REZBd3JFVE9lV0VkNmtXbGJCdUFPYjBPRjFlL3dC?=
 =?utf-8?B?ZEZZZmlvcmVHdThmalM3KzNnUC9zQ3hxVWlMREpJdE45SktMNWh3NDlnTEt5?=
 =?utf-8?B?eXVzRm91THFjU0VlVXlSVFdLNlhVdDhRSWxGRno3MVN3WklhcEFhNmhoRml3?=
 =?utf-8?B?eHJnRFlUQWJPOXRsVHNtZ2VSLzVBeVdnSGlmc3B6NXNablplWHk4NFlzY1J6?=
 =?utf-8?B?cWQ5NkJocVN3bG12Y1p2dzI3UFRnRjB4c0dNbXFYRjFPenFHdmpJTXliSy9h?=
 =?utf-8?B?U0wrQ2hFejJDTFg4YWZnY0lNQTZ1YmoxTzduaE5qOWFtNFNsamRUR0ZTZllN?=
 =?utf-8?B?VU1tdXd4ZHNXaDMvRlFSWnN5SXZxeW44NzEyTWtMUGN3eGwwZ1lET3dZMVRl?=
 =?utf-8?B?Z2ltcXVWVUYyb1J1eGhXdU5zWk92cHdrYk5IeHUxa3dZdVR5cFBkakpSNFFv?=
 =?utf-8?B?Rkh2YStnVEI2OWo2SHhPMjVBNTBRc3k3Ky96TUJtZ1JPMThpQWJoclRiZDly?=
 =?utf-8?B?L1ZVSERiRW5NSjZEUWRaQU05QU5IYW16TWlkRmc5Y2NVSnI4R2JWOUwrc2Jp?=
 =?utf-8?B?Tld5R3A2MVhrY0RlcFo3TlYxZjFMaTVaU1J6ek9XRGhSU0tjS21xZG9FRXhD?=
 =?utf-8?B?Vjh2dXBYNGh1VG1wSFRaam45NGtMbzkyb0YwNGRjRUVvU2o4RHJ4ZnNvNnhZ?=
 =?utf-8?Q?7ck9DYZ3ae9ES?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6974.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b0ZKWHYvUm1ZRFB2WnFjSUdaUHluenE3RzBjV3F4ZWJjZm5lSjY5ZTZmNklW?=
 =?utf-8?B?bTZGRGt0TDFBQTU4S3VNc2xud3ZXZWViUHg0d0liMGViQTJudnorOFJlU3BX?=
 =?utf-8?B?U2pkZ1RURHlSa29tNVBzQ2JLZENzUDBVakdTcDRPNlNldWl2Yis5WFZENlNK?=
 =?utf-8?B?NFBCeGVTMDBKY0FQT2ZwanNXZ1VJNGdWTkdTbFJ5cW5xZlJzVmpMTkJIZDdN?=
 =?utf-8?B?S2VGaTVrWFlLemxTT2FRU3gwSWMyVTM5M08yMnR1SWN3b3lOL2FMejJFY2hq?=
 =?utf-8?B?cG5IWVY2Qm1zOWl5dy9zYVZpbVBxazBMZ2xWTGs3VjNwV1g3Y3I2cFZZMDdv?=
 =?utf-8?B?d1JFcFovRE5SYWJWdG1mV1I2YlNaZ21pM2pCOXNsbFA3R1JKdFJ2N3UyS3JU?=
 =?utf-8?B?dldPeEJmYzJOcU56Z3FBNlFxL1IrSTdRVVpTbXNRaVRjSy9JblY5YjBwK2JX?=
 =?utf-8?B?akZKTjF6em1lbzh3cTlzSnMyM1dRU1ZNQVdkYTltSjF4UHlmanVLeTIzU0xm?=
 =?utf-8?B?WHduaHNDenE1Ry9uVnU0WEZxdnBORWp6RGtRVk00eStpWDRJY3F0STQ0dlV0?=
 =?utf-8?B?bjMxZlU2OXNHVmhzWVdhdDlJMjlURnh4enNVRnFkalcvNy9HdXdCUjNRUjMy?=
 =?utf-8?B?UGg0eHg1cUJzUGxYd0g2MmJndDZYcnE4ZUM3N291M3RoNHY4WEtWM1IxSFBx?=
 =?utf-8?B?MjlFZTRoQ3NyZElCdzMwUWRDSXgyS1BZdGdqeWMxZTdTZ0RkZHlRQzVaL1Nm?=
 =?utf-8?B?WmNnamhVZE8wUFZmSXBKTXM0SHJkK05QNWxwZ3AxazRmOEJjc3owdTdvb0ox?=
 =?utf-8?B?dzVMSHl2WEZMbTZva21LZmQ1OEo1YVdYTjdncG8wZFY0QmYwMHYwYWRMU1dn?=
 =?utf-8?B?RXJ0eUEwYlJCVGtCOHlxOWZMRXdNRjNGYWNkZkxMd21rWG5OODBaOE85TTJS?=
 =?utf-8?B?WkZublVzU3RsczdwM21zTTZ3KzFjc0V4SmE4NU1lSFNraTArWDJQU2kwaE1S?=
 =?utf-8?B?T2tTN29xY1hTcWRxVWd5T3VwaXJEdUVxaUtZL2EvK3FiM2RlbExuakFqNytn?=
 =?utf-8?B?S0hlcHpDa3ZmQWsrNDNRbHFQVjExTjJkbEw1d2FJVFZ1S3ozQlRrdmVzMmQy?=
 =?utf-8?B?dTRhL2JJa0JEZWVMYXdjeGJXOVU1QmFKcWViZDh1dkx0L004ME5jTkxFUHdL?=
 =?utf-8?B?RnRKS3dxdjYzVzlmSkxpWFFqMUtCTThRV2RmVFZzR0p0S1I4aVV1blJzWUFF?=
 =?utf-8?B?ZC90MnNHTy9Kd1JjeGFTcVpvb0tjTEpocS84VDRGRG1ydEVhTU5qV1c3S0Rn?=
 =?utf-8?B?aHBRaFc0WWdiVUpNTG5rRGEvREVVcFFHZDNpUjZoYldmeHd5bTU0ZmJ0elY5?=
 =?utf-8?B?T0FwTE1iQisxOHNjSEhVQlFYTU43ckJNWVhTSTMvaHFEZTA3V1c1Uk45RkhS?=
 =?utf-8?B?K0NrdFJQWmJBSjNCc093OVNIUWZ0aVhGazdmNmU2alNVWnZvR0lQNVM1RmNX?=
 =?utf-8?B?R3dXaVZJTVBSUGt3N3UvRjFEa3RPSlJQOWpnWFlSZ1dhVXA2RTNlL0k1YU8z?=
 =?utf-8?B?QmdPM2Vndmx5L3MxZTV1TGwrdUU5aVZ5VDF3Q2ZCanJqbUdTaUxjSHZ0cmMv?=
 =?utf-8?B?aTQ1ek4xSkhrYzJ3bEdTNnJHcnZ6SkJ4dzFHWS80N1g3VDN6Slg2dlN4QzdS?=
 =?utf-8?B?Y2wwZUF6ckYxc01OMU8rUm5HbnlZS2YvV0xIRXdHbUxXMk9hMVNhVitaNjNL?=
 =?utf-8?B?cHpwdk94YmppSmd1bHNUalZEQzIreERINEJ5c3RIdTdOaVlJSStIZHZPVXZZ?=
 =?utf-8?B?dUJqamJicWZWMkxsdmppNm83MVV5UVQ4dWxDUUZQVzQxZ3BKa0F2N213bTBu?=
 =?utf-8?B?NEowV1o0cExuazFCbVFGYjBOeDhFb2o4MDVCaXR1dVJ0aWVYcTNPZCtselNv?=
 =?utf-8?B?VmFpTEprdFgzSmVVTm03S3NLYnZKUnR1bW1NWENHenJEWFIxcG1TY2tnS1B3?=
 =?utf-8?B?VWVBc3Irek53QnRmUXJkazNYTlV1OWtGUVh5dVExY2NlcGtRTHdicjdYY3VN?=
 =?utf-8?B?YkhmNWtDU3dMb1FDVXdwYkRobGtDc2xWdUxPMW1vZnFySHpnMmZ6djNSRlNl?=
 =?utf-8?B?WGdKZ3VyZDVTMkhBUkNvVDJJWmNlTDRKL1R5ajM1Q3JmUmR3bDhUOGh6b3Fx?=
 =?utf-8?Q?zFc1Ls9kgcisaOaxYEP4goI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9230ddff-e6ae-46d4-6997-08dd75bfbe42
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6974.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2025 10:34:15.1738 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vE9xVcuJAedg5oQgWzSwzVlukl9OgCZzqaxh/nxeKYQvZRMJstMIGSHtG1E7AEZKofF1D6G2Q8EGxMNp2PI3d2Japx52dmklFn4d6jTTW3g7hi5NS/hSQEBmeE233FiQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8381
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

On 02.04.2025 22:38, Lucas De Marchi wrote:
> If device wedges on e.g. GuC upload, the submission is not yet enabled
> and the state is not even initialized. Protect the wedge call so it does
> nothing in this case. It fixes the following splat:
> 
> 	[] xe 0000:bf:00.0: [drm] device wedged, needs recovery
> 	[] ------------[ cut here ]------------
> 	[] DEBUG_LOCKS_WARN_ON(lock->magic != lock)
> 	[] WARNING: CPU: 48 PID: 312 at kernel/locking/mutex.c:564 __mutex_lock+0x8a1/0xe60
> 	...
> 	[] RIP: 0010:__mutex_lock+0x8a1/0xe60
> 	[]  mutex_lock_nested+0x1b/0x30
> 	[]  xe_guc_submit_wedge+0x80/0x2b0 [xe]
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_submit.c | 9 +++++++++
>  drivers/gpu/drm/xe/xe_guc_types.h  | 5 +++++
>  2 files changed, 14 insertions(+)

Looks good to me.

Reviewed-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>

Regards,
Bala

> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 31bc2022bfc2d..813c3c0bb2500 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -300,6 +300,8 @@ int xe_guc_submit_init(struct xe_guc *guc, unsigned int num_ids)
>  
>  	primelockdep(guc);
>  
> +	guc->submission_state.initialized = true;
> +
>  	return drmm_add_action_or_reset(&xe->drm, guc_submit_fini, guc);
>  }
>  
> @@ -834,6 +836,13 @@ void xe_guc_submit_wedge(struct xe_guc *guc)
>  
>  	xe_gt_assert(guc_to_gt(guc), guc_to_xe(guc)->wedged.mode);
>  
> +	/*
> +	 * If device is being wedged even before submission_state is
> +	 * initialized, there's nothing to do here.
> +	 */
> +	if (!guc->submission_state.initialized)
> +		return;
> +
>  	err = devm_add_action_or_reset(guc_to_xe(guc)->drm.dev,
>  				       guc_submit_wedged_fini, guc);
>  	if (err) {
> diff --git a/drivers/gpu/drm/xe/xe_guc_types.h b/drivers/gpu/drm/xe/xe_guc_types.h
> index 63bac64429a5d..1fde7614fcc52 100644
> --- a/drivers/gpu/drm/xe/xe_guc_types.h
> +++ b/drivers/gpu/drm/xe/xe_guc_types.h
> @@ -89,6 +89,11 @@ struct xe_guc {
>  		struct mutex lock;
>  		/** @submission_state.enabled: submission is enabled */
>  		bool enabled;
> +		/**
> +		 * @submission_state.initialized: mark when submission state is
> +		 * even initialized - before that not even the lock is valid
> +		 */
> +		bool initialized;
>  		/** @submission_state.fini_wq: submit fini wait queue */
>  		wait_queue_head_t fini_wq;
>  	} submission_state;
> 
> 
> 
