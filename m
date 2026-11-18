Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B3A2606A31C
	for <intel-xe@archiver.kernel.org>; Wed, 18 Nov 2026 22:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iIJIZFwQ;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=TMkVEllW
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 375B810ECC4;
	Wed, 18 Nov 2026 22:05:16 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1760810ECC4
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Nov 2026 22:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795039506; x=1826575506;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=SNSX2QmxsPlC5CCg5hFmILL6RHWdWeoTvO8gN8X4Q3Q=;
 b=iIJIZFwQ2nSMBr4W/N1dtWp3zji1SYl1NyBKDxZeUtZ1WAcaPkUcwEZO
 X4XZXp0kOGVod+ul9KxnX906//I7KrDXKWKoED757PEsWxKgAyP1EBq/7
 tV5A68OeK6DWq/nUX2BGirAMgMUjutEn3YG9U/JIJB4nBBAU9GRkR8iSr
 TxCRU52vL5J8tM9p5Bz3857jfjeQv265hbWzv8LQLsFSNyYflkvXxGiqx
 +XzzG+mrtBXYRtRXZ6h3wx0S2NgolEYr4Sb/ZGww6FBenEMSv1xjRb8AJ
 sOb1JcvR6aKykhwwvtOQerCWBLtQNiqQRE1OxgqECov8MxeQ2P6qE0s7K w==;
X-CSE-ConnectionGUID: d9ZJlIhBTUmr+zmLZ1frZA==
X-CSE-MsgGUID: BpqyWgODRSiE4BLNsMMJuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3889156"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3889156"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 14:05:05 -0800
X-CSE-ConnectionGUID: 99+2lx8tRmSFUkA7ZICsXw==
X-CSE-MsgGUID: OmMc4OBOTq6xTiEyCFtlAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; d="scan'208";a="10131952"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 14:05:05 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 18 Nov 2026 14:05:04 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 18 Nov 2026 14:05:04 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.20) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 18 Nov 2026 14:05:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gbjxtZ54t/txyV9hIvRrQSqdmzABsieB2ToglVf9biGQ594ttpfEmbHCjRaicVMaD1nMOhbLGXT1ELedzbTB2pL34wbbMH3dwjayG3L+g8LjF1B0aDv8zbqQeqp01nHnKRNLcZI/wYRIp0b7YT5y42O0T8618X+He9HS80tdGl4bfYCXvPZ07z8Z3m6AO16iCDkm+/qOOzeU8NYWlCatZsgnvP2qmqlz005IuhQ8WoH0oyedJHPcO3B4hKgADlDWLqmmFoq5Z8xICPdG0Fp9lnEAJpK79qsxn93YP6YzmlFCLCPNxWTdq3z6H9/8AFyowMeVyZC6YBBvwrFzww9zuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SNSX2QmxsPlC5CCg5hFmILL6RHWdWeoTvO8gN8X4Q3Q=;
 b=nS3OIHQlPBs7oU807nwOB7aVbvJRDZ+e1aiXxZJfgrQxnl6xDhR6K4WF5CXtoiOK7B7SJuG+wh2ln9B+pMdWI/tQ9y7Nn+dXcBltfLk6aoE8VOP9/Vq/DzuLqYrpcmKlcavXee/y+UeJv5XcXflaPsNbQqWO7UP1uXuPLrnL/nyErSXy2t52Tu3EKZIEP7Ik5IKbnHPFay86rIR3ZhPvvx4gNSeQrSd0hIk5el5t3mZFXw/M6RptoFURTgHiI4atn4vtNv/j+0QTTOEnVCoy9Lr5VAAHQjFAE1Kz8b0AX+NJwLE3axyJOim7sX0XNiycKDiUWsd7gmT0d6icLcbl7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SNSX2QmxsPlC5CCg5hFmILL6RHWdWeoTvO8gN8X4Q3Q=;
 b=TMkVEllWG5x5zSEhGuDtL04dXALZbK9O+UxxPRx8yRx8umHcsnLe9zxBzKmrQRVxvlyztY/IU3IdJBhVFDTiFK2uCe9FArNNWBI0PIN6r542WvyQNTpEcsGS1sFxOh4SeqbO/2/NOgorPjFFLDqvB2IZYZQ7MKmoKOJtptVF1R4=
Received: from AT6PR11MB072844.namprd11.prod.outlook.com
 (2603:10b6:170:10a::16) by DS0PR11MB7902.namprd11.prod.outlook.com
 (2603:10b6:8:f6::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 22:05:02 +0000
Received: from AT6PR11MB072844.namprd11.prod.outlook.com
 ([fe80::520a:561:ace1:e64b]) by AT6PR11MB072844.namprd11.prod.outlook.com
 ([fe80::520a:561:ace1:e64b%6]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 22:05:02 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Tauro, 
 Riana" <riana.tauro@intel.com>, "Vijay, Anoop C" <anoop.c.vijay@intel.com>
Subject: Re: [PATCH 3/3] drm/xe/sysctrl: Restore the SoC remapper on every
 runtime resume
Thread-Topic: [PATCH 3/3] drm/xe/sysctrl: Restore the SoC remapper on every
 runtime resume
Thread-Index: AQHdbKcEWaL9nBi78ke9mE0WKNVeKbcpU9CAgAsklwA=
Date: Wed, 18 Nov 2026 22:05:01 +0000
Message-ID: <2b32ebc993e57ef80eeb408c87a7aab5eb201468.camel@intel.com>
References: <20261104215353.234314-5-stuart.summers@intel.com>
 <20261104215353.234314-8-stuart.summers@intel.com>
 <avTIHy8y9T3jcMnJ@intel.com>
In-Reply-To: <avTIHy8y9T3jcMnJ@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AT6PR11MB072844:EE_|DS0PR11MB7902:EE_
x-ms-office365-filtering-correlation-id: bc1d58d0-e108-4002-3706-08df45bffe79
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|23010399003|1800799024|376014|22082099003|18002099003|6133799003|5023799004|261021123027099003|4143699003|56012099006|11063799006|261028144727099003|261022075727099003|261102123227099003|261021121427099003|261021135927099003|261009223027099003|10067099003|38070700021|261026121527099003|261026140227099003|261022105027099003;
x-microsoft-antispam-message-info: Y37N3v2Yf/IkCW14U+OgIKlDB8z+RVucAk27mfg/1ZnJ1dqSBWfxpeOal1f/2dnTJs4LS8xQWV6Q46uUeM9Al9xeWE1Kg9deG6xILF7epsivafsXiEtZvArkp4hi0K8VNCPlqZHFsVdXMuGh9P0poSorxlgKDbZkl//7M+pTaf6VWTN5i1ZycV2jydPbluNnb7Dyx5Ya3t7cuTXAConnZMNiAmu7jg8sZvU3s1zavs6CHo16WKCV7HD5bnvm96Nwweec/no8KFxb8Vz3q6WpFnwjRb5aDRpY0S0mB5nSOqqVu39YJJCbpL4ntVQjz8opiQ6Mde5bsBLuhlyy9Rg3kW+pIS+ECk0APGoe5OnM5N8snmDtsie6S8svSw1rZT+Xqn+6UIwT+TQYNu2sN/L3uKt76+anac+7SncbgEnBDIgp/4TRHIWZwviCRWvaIpkuPO65guUJjnv8GqunLoY2+dzbevLJwT/Vl3Q2tcEZEXGsuj/nBs0nuELumWTISIuTz4EiXjPaQeU58SFk333S6E48/zfaDtZH1+mqE6LorzqemrLgAqLW7p1mBrOkEqKsGeTmd7nIrFsix6t1usV/23ipdgfCPpjpWDMSVxj0OksVosD/1QkiP/E6BrSd4yLd4UOjYnY8NrXRuI+ZnVcrje/dnl6MmVIK/KQxy1xWvUMM55dPz5q6jNNDW7E5orrSPv9B2Hw7bJEn9Xm7aJrq+2UeoUa5NQK+cLn3La4HUF0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AT6PR11MB072844.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(22082099003)(18002099003)(6133799003)(5023799004)(261021123027099003)(4143699003)(56012099006)(11063799006)(261028144727099003)(261022075727099003)(261102123227099003)(261021121427099003)(261021135927099003)(261009223027099003)(10067099003)(38070700021)(261026121527099003)(261026140227099003)(261022105027099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?S2FQdjBFZFdTb3F6dFJvK3VRdWVxRHFJT3p1SitzVEVlWk5vanFBT3FjRkxY?=
 =?utf-8?B?SkpQN096UndSV3UvYkNkdDRDODRPUVI1b2g5MkdOY1RMZFlWSFJwZVE2ZEtL?=
 =?utf-8?B?TnMxTUMwdm9uYU9TUGRxU09hOEJuSDdoYzBuaUo4QzBWeStsaGxLWTVzUkxo?=
 =?utf-8?B?MmhpSzFXU0Z0UWZXTWFjTXI5bjVtOElYMkNFazZ3UVB2ZVgwek1wdnAwUFJ1?=
 =?utf-8?B?UmhhbVoya0Y4VGYzL09pdFlxM01wUjh6b0F5a0FUQmsvY0hzbFpTaFNxTDBZ?=
 =?utf-8?B?RkM4Z1AwOXovYU5qUnBNeUt4N2hjQlJqemViWmRhYUVHeWs0VUR5cSs2ZXAz?=
 =?utf-8?B?R1RiYkNUK2JTOU43UVZ5VFZRSjU5OTU5dHdERjFkUmVUY25qM3phaWFhTDZn?=
 =?utf-8?B?Q2d1ZktENUVoa09zVVd0WmlkcFJJWk54alZlMnprMnQ0WU1rR1h2b3NwdU0w?=
 =?utf-8?B?RlQxR1RPTnJja0dOK21aQ2tqTnc5QWlzNEJNcWZkUWdPNks1ZW5PZGIyc0Q5?=
 =?utf-8?B?U2NGVHUxMlc3dWhSNllJZ0pnRXhIbzFSTjZrSnNiVnRHSkhXZWFMVThtSS9t?=
 =?utf-8?B?SWRpMml4MHIzeVNpTkZuRy95NmhUK0dEbmhhRlBReHM5dU91UlBUQXBqRDNy?=
 =?utf-8?B?Nnova1BRQnl1cU40UVFMVE93MUJMb2V3ZGVxdWxYdTlENDNzZGdHM3NIYlRW?=
 =?utf-8?B?OHIzR2pjTXBjSTFiRlhuWWRXaWQ2Vk1LSjhWUGtmR0RDMEthTld0STJVOGRw?=
 =?utf-8?B?bnFjK0lUNWt0NlNrb1Izb1drNVphajJoZVFsSTBGZVJxSHNhbDVWN3Y3QkpL?=
 =?utf-8?B?ZTRUVE9xZ01rcU9TOHhSaEY1Rk1jQ0cwRHZINEZUOVpFa0c2NWtLSUV2SS82?=
 =?utf-8?B?T0djOGk3dXBuMlhSYkF5NGpYekg3dElLdkNYNkJTem81WlRFd203ZWFTYnEy?=
 =?utf-8?B?ZEQ3MWtwNWM3VE1UbmR2c3M4L1JodHl1WUJ4Rm51MGd1N1VmdVpkYndwOEV3?=
 =?utf-8?B?L2M2WlFxeE5LbUYwREp2ajRWbmZocktWQnY1Nlk3aGhieFd4R3FqR0k4QjR2?=
 =?utf-8?B?NlVPN3g3OGNRcHQ5WGFPOW5WbzJJWC82ZEczeTVqVWVucFZnZS9LdXk2Mk5D?=
 =?utf-8?B?anB1M3QvMWNWczlwa2J3Z0dVRWcyZDgrWTJGdVN5eFhkeHFBeHlsbHBlRG4y?=
 =?utf-8?B?WkFObHovSnFtR3VwSW8zWEN5Qzhtc1NXYnRrVm9CcXU1U3pid0NzUldHSi9J?=
 =?utf-8?B?UFY0d0tqbFhqdytxWlNxaEVTUzE2dXIwcVQ5aWNtYVorR2FTZG1TNlBwZ1ZD?=
 =?utf-8?B?ajUxa2c2WjYrdndxc0o3dHd3UFdTUWxpb25QNXYzUmtwQ0RqYi9CazNqckE2?=
 =?utf-8?B?enZOV3BtdksyQVNPT0o5YktMTWpTRElzbkF2ditMUERxaTdJallGcGFWMmtw?=
 =?utf-8?B?V0tIdDl1d1RoK0JWcFdoekpJUDd0cnN1aHVmU0Mwb3VwaWZCMnZXdm85VU4w?=
 =?utf-8?B?UVdhaXZYK1RZcmlFYmhiMGtFdEZqM1pBRDhrT2JCUjFOK25LNjc2WE1WaTdy?=
 =?utf-8?B?cVA5WHAyT2ZINEszVUZLRGFqekE5eGxzRXpoYVFQQTVuYzkxV2krU3lMWkEy?=
 =?utf-8?B?VFEwWlNwanJ6MWRFR1NuNG5tYkkzK1kvRUxoQk4xczgyNmFHWEVZOW1nWnQw?=
 =?utf-8?B?UHM1RUtUTHZiaSs5RVg3aHkzZVJlNWRYdUhMWDgxMGYrdFJmOXczR0w5TE4x?=
 =?utf-8?B?V0tQUTIrdG9lTXM0ODRjSmJEVkhwUUJrdmhYNG50VWlGTUdFamg0QkQ3eE51?=
 =?utf-8?B?MHJSeHcvSXJCV0JWYkhmcFhmTmE3eklPakV6QUZDUENNMWdyOStpSG15SmFF?=
 =?utf-8?B?L0tiUVB3OEh1UFVvMEU3ZEFPVEpLWm9UNjFWck42NllzRGJqaGsyUVpEakJG?=
 =?utf-8?B?NVVENDlFQ1NWVDg4M250eEd2TkVIR21xdTBVMy9TRytPeTNUTVRhUndybnRa?=
 =?utf-8?B?TFRiUEVaaHdlb3BXVTRWRWJsYnVoRzM4RmZOekphcWM5YlZlVG9KME1iWGJW?=
 =?utf-8?B?QW85OUI4UHpHYm5DSjMzYmw2R1liRVpyTC96QUx4RlBkOHdyMSt3WURGeGZu?=
 =?utf-8?B?SjdXZ1hrMVNPaFg2OHpadnJwWnhlTWpZOTNXSll6Zmc4K0F4aTczbFkrUmhW?=
 =?utf-8?B?T3dFRkRNUmNpVFlOWlIxdU9oTTljR0hIWUdmUHZGUnhFK3NsMDQ4NUt1N01o?=
 =?utf-8?B?aUcvVzNhQktUSWx2M3V5cXl6c2d0NzEvMHBSa0crcnpJRGRzQ3FqekpwcXZH?=
 =?utf-8?B?cWk1QzBBb0I5YlJnaGJxS3RXL01iZWdaeFA4cWNGcUFLNXphOXYxRjY0dXhu?=
 =?utf-8?Q?V+w9KL7XzP8nRpjM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <193DB16D9A317A4A9548AC8701FCBD1A@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: wBJcK6kB9H6A2JY48T8tXt/7e/ymiyGfbZpsmM/esE5sAywNN3+PqTJym3zGQErEdpHcZvhZBq1cEiQhVQ7S5Pe4SNuHBjvYA5NNePQ6CGvMyR/QgyzcxGXpPmNCPSqvz8WF5EtDiXWD6GPAsGcvORvNfLXYAc7wgN1GZfjNeg13IymMCBJreaNp+pWQVBVb1B+M+areU1DhoENsq32YvGF4GFSsiwTwPVHx2+AbvBahoqf4Hf2+o25BkD8yNE3QHhYGneqBKyO2Mm6uvV3HGK93y1mzNcrYZXaK5KwMHCPpndW1BGiVtEclaXv3lCIMAFX2XPgYahn+Uq4YFNhUVA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AT6PR11MB072844.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc1d58d0-e108-4002-3706-08df45bffe79
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2026 22:05:01.9927 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IiFlb5eHg0e6QbLlT5gA0OraeRaxdTFTQxvk9ZDtdERgeTvmdxS9zaFJjTcCQKxq6EMr6rftQhSEuBG4kFdMwRhZRcXcauff8Vl782w/lTQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7902
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gV2VkLCAyMDI2LTExLTExIGF0IDE0OjU1IC0wNTAwLCBSb2RyaWdvIFZpdmkgd3JvdGU6DQo+
IE9uIFdlZCwgTm92IDA0LCAyMDI2IGF0IDA5OjUzOjU2UE0gKzAwMDAsIFN0dWFydCBTdW1tZXJz
IHdyb3RlOg0KPiA+IFRoZSBTb0MgcmVtYXBwZXIgY29uZmlndXJhdGlvbiBpcyBsb3N0IHdoZW5l
dmVyIHRoZSBkZXZpY2UgbG9zZXMNCj4gPiBwb3dlciwNCj4gPiBhbmQgQGQzY29sZC5hbGxvd2Vk
IG9ubHkgcmVjb3JkcyB0aGUgc3RhdGUgeGUgYXNrZWQgdGhlIFBDSSBjb3JlDQo+ID4gZm9yLg0K
PiA+IFRoZSBwbGF0Zm9ybSBjYW4gc3RpbGwgZHJvcCBwb3dlciBiZWhpbmQgb3VyIGJhY2sgd2hl
biB0aGUgYnJpZGdlDQo+ID4gYWJvdmUNCj4gPiB1cyBydW50aW1lIHN1c3BlbmRzLCB3aGljaCBs
ZWF2ZXMgdGhlIHJlbWFwcGVyIHVucHJvZ3JhbW1lZCBhbmQgYW55DQo+ID4gbGF0ZXIgU3lzdGVt
IENvbnRyb2xsZXIgYWNjZXNzIHBvaW50ZWQgYXQgbm90aGluZy4NCj4gPiANCj4gPiBSZXN0b3Jl
IGl0IG9uIGV2ZXJ5IHJ1bnRpbWUgcmVzdW1lIGluc3RlYWQuDQo+ID4gDQo+ID4gRml4ZXM6IDAy
ZWNhNmVkY2IzMiAoImRybS94ZS94ZV9zeXNjdHJsOiBBZGQgU3lzdGVtIENvbnRyb2xsZXINCj4g
PiBwb3dlciBtYW5hZ2VtZW50IHN1cHBvcnQiKQ0KPiA+IFNpZ25lZC1vZmYtYnk6IFN0dWFydCBT
dW1tZXJzIDxzdHVhcnQuc3VtbWVyc0BpbnRlbC5jb20+DQo+ID4gLS0tDQo+ID4gwqBkcml2ZXJz
L2dwdS9kcm0veGUveGVfcG0uY8KgwqDCoMKgwqAgfCA5ICsrKysrKystLQ0KPiA+IMKgZHJpdmVy
cy9ncHUvZHJtL3hlL3hlX3N5c2N0cmwuYyB8IDYgKysrKy0tDQo+ID4gwqAyIGZpbGVzIGNoYW5n
ZWQsIDExIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pDQo+ID4gDQo+ID4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9wbS5jDQo+ID4gYi9kcml2ZXJzL2dwdS9kcm0veGUv
eGVfcG0uYw0KPiA+IGluZGV4IGY0ODNiNTY1ZDMyMy4uZTliZWJjMmZmMjlkIDEwMDY0NA0KPiA+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9wbS5jDQo+ID4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX3BtLmMNCj4gPiBAQCAtNzE4LDggKzcxOCwxMyBAQCBpbnQgeGVfcG1fcnVudGlt
ZV9yZXN1bWUoc3RydWN0IHhlX2RldmljZSAqeGUpDQo+ID4gwqANCj4gPiDCoMKgwqDCoMKgwqDC
oMKgeGVfaTJjX3BtX3Jlc3VtZSh4ZSwgeGUtPmQzY29sZC5hbGxvd2VkKTsNCj4gPiDCoA0KPiA+
IC3CoMKgwqDCoMKgwqDCoGlmICh4ZS0+ZDNjb2xkLmFsbG93ZWQpDQo+ID4gLcKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoHhlX3N5c2N0cmxfcG1fcmVzdW1lKHhlKTsNCj4gPiArwqDCoMKg
wqDCoMKgwqAvKg0KPiA+ICvCoMKgwqDCoMKgwqDCoCAqIERvbmUgdW5jb25kaXRpb25hbGx5OiBA
ZDNjb2xkLmFsbG93ZWQgaXMgb25seSB0aGUgc3RhdGUNCj4gPiB4ZSBhc2tlZCB0aGUNCj4gPiAr
wqDCoMKgwqDCoMKgwqAgKiBQQ0kgY29yZSBmb3IsIHRoZSBwbGF0Zm9ybSBjYW4gc3RpbGwgZHJv
cCBwb3dlciB3aGVuIHRoZQ0KPiA+IGJyaWRnZQ0KPiA+ICvCoMKgwqDCoMKgwqDCoCAqIGFib3Zl
IHVzIHJ1bnRpbWUgc3VzcGVuZHMsIHRha2luZyB0aGUgU29DIHJlbWFwcGVyDQo+ID4gY29uZmln
dXJhdGlvbg0KPiA+ICvCoMKgwqDCoMKgwqDCoCAqIHdpdGggaXQuDQo+ID4gK8KgwqDCoMKgwqDC
oMKgICovDQo+ID4gK8KgwqDCoMKgwqDCoMKgeGVfc3lzY3RybF9wbV9yZXN1bWUoeGUpOw0KPiAN
Cj4gVGhhdCBpcyByZWFsbHkgYXdrd2FyZC4uLiBpZiB3ZSBsb3NlIHBvd2VyIG9uIGQzaG90IHdl
IHdvdWxkIGhhdmUgYQ0KPiBsb3QNCj4gbW9yZSB0cm91YmxlIHRoYW4gdGhpcyByZW1hcHBlci4u
Lg0KPiANCj4gWW91IGFyZSByaWdodCB0aGF0IGQzY29sZCBhbGxvd2VkIGlzIHdlIGFsbG93aW5n
IGZvciBkM2NvbGQsIGJ1dCB0aGUNCj4gZmluYWwgZGVjaXNpb24gaXMgbm90IG91cnMuLi7CoCBi
dXQgaWYgd2UgZG9uJ3QgYWxsb3cgZDNjb2xkIGFuZCBnbyB0bw0KPiBydW50aW1lIHN1c3BlbmQs
IGl0IG1lYW5zIHdlIGFyZSBhbGxvd2luZyBvbmx5IGQzaG90LiBBbmQgdGhlIG9ubHkNCj4gZGlm
ZmVyZW5jZQ0KPiBvZiBkM2NvbGQgYW5kIGQzaG90IGlzIHRoYXQgbWFpbiB2Y2MgaXMgb2ZmIGlu
IGQzY29sZC4uLiBidXQgYWx3YXlzDQo+IG9uIG9uDQo+IGQzaG90Li4uIFNvLCBzb21ldGhpbmcg
aXMgb2ZmIGluIGhlcmUuLi4NCg0KT2sgeWVhaCBpbiB0aGUgZGVidWcgSSdtIGRvaW5nLCBJJ20g
c2VuZGluZyBzb21ldGhpbmcgZG93biB0byB0aGUgR0ZTUA0KdG8gd3JpdGUgYSByZWdpc3RlciBm
b3IgbWUuIFRoYXQgcmVnaXN0ZXIgd3JpdGUgd2Fzbid0IHRha2luZyBlZmZlY3QNCmFuZCBJIHdh
cyB0aGlua2luZyB0aGF0IHdhcyByZWxhdGVkIHRvIHRoaXMgbm90IGJlaW5nIHByb3Zpc2lvbmVk
DQpjb3JyZWN0bHkgb24gYSBkM2NvbGQuLi4gQWZ0ZXIgZGVidWcgaXQgc2VlbXMgbGlrZSB0aGVy
ZSB3YXMgYSBtaXNzaW5nDQpmb3JjZXdha2UgdGhvdWdoIHNvIEknbSBub3Qgc3VyZSB0aGlzIGlz
IHN0cmljdGx5IHJlcXVpcmVkLiBJdCBkb2VzDQpzZWVtIHNhZmVyIHRob3VnaCBpZiB3ZSBuZWVk
IHRoYXQga2luZCBvZiBjb21tdW5pY2F0aW9uLg0KDQpJIGd1ZXNzIEknZCBwcmVmZXIgdG8ga2Vl
cCB0aGlzIGluLCBhbHRob3VnaCBtYXliZSB0aGUgY29tbWl0IG1lc3NhZ2UNCmNvdWxkIGJlIHJl
d29yZGVkL2Ryb3BwZWQ/IEZyb20gd2hhdCB5b3UncmUgc2F5aW5nIGl0IHNvdW5kcyBsaWtlIGlm
IHdlDQp3YW50IHRvIGRvIHRoaXMgd2UgbWlnaHQgd2FudCB0byBqdXN0IHJld29yayB0aGlzIHdo
b2xlIGZsb3cgdG8gbmV2ZXINCm1ha2UgYW55IGFzc3VtcHRpb25zIGFib3V0IGQzaG90L2QzY29s
ZC4gSSdkIHByZWZlciB0byBrZWVwIHRoaXMgYQ0KbGl0dGxlIGlzb2xhdGVkIGlmIHBvc3NpYmxl
IHRob3VnaC4NCg0KTGV0IG1lIGtub3cgd2hhdCB5b3UgdGhpbmsuDQoNClRoYW5rcywNClN0dWFy
dA0KDQo+IA0KPiA+IMKgDQo+ID4gwqDCoMKgwqDCoMKgwqDCoHhlX2Rpc3BsYXlfcG1fcnVudGlt
ZV9yZXN1bWVfZWFybHkoeGUpOw0KPiA+IMKgDQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS94ZS94ZV9zeXNjdHJsLmMNCj4gPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9zeXNjdHJs
LmMNCj4gPiBpbmRleCAyN2E1OWU4ZTQ0ODcuLmEzZmZmOTVkMTZlYSAxMDA2NDQNCj4gPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0veGUveGVfc3lzY3RybC5jDQo+ID4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX3N5c2N0cmwuYw0KPiA+IEBAIC0xMjksOCArMTI5LDEwIEBAIHZvaWQgeGVfc3lz
Y3RybF9pcnFfaGFuZGxlcihzdHJ1Y3QgeGVfZGV2aWNlDQo+ID4gKnhlLCB1MzIgbWFzdGVyX2N0
bCkNCj4gPiDCoCAqIHhlX3N5c2N0cmxfcG1fcmVzdW1lKCkgLSBTeXN0ZW0gQ29udHJvbGxlciBy
ZXN1bWUgaGFuZGxlcg0KPiA+IMKgICogQHhlOiB4ZSBkZXZpY2UgaW5zdGFuY2UNCj4gPiDCoCAq
DQo+ID4gLSAqIEludm9rZWQgZHVyaW5nIHN5c3RlbSByZXN1bWUgKFMzL1M0IHRvIFMwKSBhbmQg
cnVudGltZSByZXN1bWUNCj4gPiBmcm9tIEQzY29sZC4NCj4gPiAtICogUmVzdG9yZXMgU29DIHJl
bWFwcGVyIGNvbmZpZ3VyYXRpb24uDQo+ID4gKyAqIEludm9rZWQgZHVyaW5nIHN5c3RlbSByZXN1
bWUgKFMzL1M0IHRvIFMwKSBhbmQgb24gZXZlcnkgcnVudGltZQ0KPiA+IHJlc3VtZS4NCj4gPiAr
ICogUmVzdG9yZXMgU29DIHJlbWFwcGVyIGNvbmZpZ3VyYXRpb24sIHdoaWNoIGlzIGxvc3Qgd2hl
bmV2ZXIgdGhlDQo+ID4gZGV2aWNlDQo+ID4gKyAqIGxvc2VzIHBvd2VyIC0gaW5jbHVkaW5nIHdo
ZW4gdGhlIHBsYXRmb3JtIGRyb3BzIHBvd2VyIGJlaGluZA0KPiA+IG91ciBiYWNrDQo+ID4gKyAq
IGJlY2F1c2UgdGhlIGJyaWRnZSBhYm92ZSB1cyBydW50aW1lIHN1c3BlbmRlZC4NCj4gPiDCoCAq
Lw0KPiA+IMKgdm9pZCB4ZV9zeXNjdHJsX3BtX3Jlc3VtZShzdHJ1Y3QgeGVfZGV2aWNlICp4ZSkN
Cj4gPiDCoHsNCj4gPiAtLSANCj4gPiAyLjQzLjANCj4gPiANCg0K
