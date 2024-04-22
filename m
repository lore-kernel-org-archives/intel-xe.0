Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6B87C4345F
	for <intel-xe@archiver.kernel.org>; Mon, 22 Apr 2024 14:50:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C6CA112B9D;
	Mon, 22 Apr 2024 14:50:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="At3W+9Jg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEE10112B9F
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Apr 2024 14:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713797409; x=1745333409;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=HdhLmlzIKkZ0zpkP4Vziv/ntkyRCfhRonXj4tfvoz9Q=;
 b=At3W+9Jg4nIm/w6ba7YLst4xIu/2tTEF/g/zac4vfh0fuXwfgOqS37C6
 1ZAOERMbxYAgrRk6bXUXyA34NXqLrgq3cO52V70sHf8vW9h0ryMnlulTG
 8eLTqN51bSW5x357PA+IMR5cqc/QWXG1LOYEfcLGoW7aSLDghKSfsZURl
 1iN4yR6Q+Hx4azT6Lz8FKJ6kY83NystHFsHnfdYO/EtDgRxxskhqleHxG
 WsRuitO6eniNEJCJ19L6woE1srnAxQO9Iox69fqGafeyl3HxCtyq2kc51
 HA+JBDoM/bCqfLJ6f5B++ESdWAuZNLlK7AvSAcoPbrf+tOkDf5EIYIrdP w==;
X-CSE-ConnectionGUID: 4hQUb4tfSOmeg9J9XXuXng==
X-CSE-MsgGUID: iOtI5ewiQ6SKAFFlt+kTJA==
X-IronPort-AV: E=McAfee;i="6600,9927,11052"; a="9506907"
X-IronPort-AV: E=Sophos;i="6.07,220,1708416000"; 
   d="scan'208";a="9506907"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2024 07:50:09 -0700
X-CSE-ConnectionGUID: yrhv6WSiRAqqkgfnks1vBA==
X-CSE-MsgGUID: CuXsNR8ESdChhp+S9VFe2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,220,1708416000"; d="scan'208";a="28705674"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Apr 2024 07:50:08 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 22 Apr 2024 07:50:07 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 22 Apr 2024 07:50:07 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 22 Apr 2024 07:50:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qz2jVEpmupca6CjDPNTLzatb1ABJu87HA8CiSSU4czNwIkS0pxABgaViIfeAsG4V1WkvccFKNUi6L5Z/Jwc6KF+6flwnt9CXq1ZMyk3Acd5VmrireJHuqDWsXLHsz8X113hS766pBJ/JkILeD1eTD6XT0SK1dsgD0n/QGnK6tz5Xi/lUIuc02B6LNmokUzl7jeMhTXQiCcPRwNVXuDuzo2n17f6iQ53Fn1LNHSUzUWagwEXQ7om6lqE7sb3e6xTOSDpZmueikRqpP7a1q81PaSMgeY7vdvRZiZ2vdlrzW7E2/O7PcvsjXWIpJhc6ZOAVWNCKqvkeTSy1UbOfRwfKVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HdhLmlzIKkZ0zpkP4Vziv/ntkyRCfhRonXj4tfvoz9Q=;
 b=L33yh9g71pVC4qZZPqtkP5cBasLyNrt4UwFSTYgAn2TARaF6u2uPZ/ma3FIee8nEPjM49DHod7534RDtm06Jyt4Kv6mNx/Hq6uVgi2ikjR8o31fL4Kni3hezIFA9G3+G+ZjUdA8cQsk3UnvEzdcSc0uv8QXJz3IvCurD6WE2TCQeKJFDy5iiTSCMOLXwmQlq+rNHk84wOzsj9uFzbYxKHS+WpPLAV8OKEesThNuPwLhhcACbhfvh7G+INfC72GhgCsxZeujPoAGLf63SljaaQcHDYw5edDGgdDT5aM772+7lK28vrUUaofv2O1zqpvt/IRFIxCnNX0QVHdFRmQrXkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by CY8PR11MB6818.namprd11.prod.outlook.com (2603:10b6:930:62::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.20; Mon, 22 Apr
 2024 14:50:03 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::c563:8fb8:d95:71ac]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::c563:8fb8:d95:71ac%5]) with mapi id 15.20.7519.018; Mon, 22 Apr 2024
 14:50:03 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "Das, Nirmoy" <nirmoy.das@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v3 0/7] Enable device atomics with a VM bind flag
Thread-Topic: [PATCH v3 0/7] Enable device atomics with a VM bind flag
Thread-Index: AQHaj0aH8esI/rRLVU2s6nkkl0/q5rF0aiYA
Date: Mon, 22 Apr 2024 14:50:03 +0000
Message-ID: <9c657249283b22ebf357d63e4754f82811db07f3.camel@intel.com>
References: <20240415145214.25641-1-nirmoy.das@intel.com>
In-Reply-To: <20240415145214.25641-1-nirmoy.das@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|CY8PR11MB6818:EE_
x-ms-office365-filtering-correlation-id: 6e3a50d7-8ae3-4f9f-80a8-08dc62db7e12
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|366007|1800799015|376005|38070700009;
x-microsoft-antispam-message-info: =?utf-8?B?T2k2UlZiVzdVcFk3Z1RBL2ZVZTJzOWJwSU9oOHdmdFRZcWZwbzM4S2FsbGxS?=
 =?utf-8?B?ajQyYXY3WE5JRzdoeHJpV1N0QUdLWWIwT2JjV3FLRXFwRnBvOVVYajlSQUM2?=
 =?utf-8?B?Y2ttLzRORDJHckZBRnhCU3hWL0tqdUdNQnhPeEFVRkgrSVJ0am5kaFMvSEdT?=
 =?utf-8?B?QUExWjRRMEVqblltckl2YlBraG1aYWJDeUt2S3llOTRZUnBLNjJkbnR0SEJz?=
 =?utf-8?B?ODBFc0xuai83ZkF0K1ZIM29WTFhUQ0dkcHdvTkl3Nm9NL1NaZlJaejJMUUNz?=
 =?utf-8?B?UEZNZVBEMHRpUnFJQjBRdjNHVGQvNitZSHE1em1aMWNKWFBYNnEwWnNTZllu?=
 =?utf-8?B?YW1Xd0l3aHBJZzJGRjZWQUtRTkZUVzlJaDJZZUxaaGZ0OU0xR1lmQ1JhVnVx?=
 =?utf-8?B?Nk01a05KbzdqUlpMSVZiNGRpSDdIYi8zMktEQ0tGVWpENnBwZUwvMWVibFl2?=
 =?utf-8?B?dC9Zc0R6OVFvSXZ3enc0S3JGQjFPYWRGVjRBa09wNGE5ZnExOHA4UDlXcFNj?=
 =?utf-8?B?MG9GWEJkSHk2NVZnVGw3eS9Mcnk4SG13K1E5MWNKbXNvcDYzMk5SbkxDM3Fo?=
 =?utf-8?B?djJaTkRPTDRMbjdEVTN1WWlRQWMrZ1o5Y1dSaklLaTRmWkppMWlBWVNaK2Zp?=
 =?utf-8?B?ZGdGVDdnQncyTm1HVTRVTktEYkRKNkxvbXNtblNVaTYzNVNGUnd2SHp2d0tz?=
 =?utf-8?B?d3prTkhCa2xoOGYzemtKd1A3UUJRVEUrM2pLY09Pblpjc0d0ZE9zWURpMXkr?=
 =?utf-8?B?aU1QOUJBZjVPUHFhWUd0anZHdWhxcVNqUW9sYVM4VnVyaXgwS2xTVmlPaVZL?=
 =?utf-8?B?YVFDbExSYnJEUkRtU05MeXJ3azFXT2hvbjZpS1FVTElpUmZHWk9rUTljOENB?=
 =?utf-8?B?Q091T25wL0hQWjk1UlhveHg4MjRIV28rZ20vcEVha2lBK0hRUFFyK0VoU0tW?=
 =?utf-8?B?a1FLWW90Qzl6UWh3WU5LckFQR1hoclZjK2g5L3BjQnljUFh6T2g3blFPa1pv?=
 =?utf-8?B?RlEyVEF4RTlHWlRROU9UajMyckx3dTE4UE5hNTlxMmlFaEdjSGZoQUNiZGk1?=
 =?utf-8?B?cHZDeXFGR3Q5T082RmlLZHZwWGJDYVpMdUowTWw3aU9NMUFOQzFvdFI1dkcx?=
 =?utf-8?B?cDh2ZkxRMWtSR1NDNUVaRFlHZzhRaTRvNEVpZzM3VGplVUI5TTV3MDdXVjVN?=
 =?utf-8?B?bDJGdlZkY2NpQ2NhRThLUGUvdmdmTTZ2aTNORDJNa1ZRU1QzUDZReFZ4WnBa?=
 =?utf-8?B?NmdEN0xZTFZETVBvcnBYZ2tCeC9xN0svRjhPUGFCYTFZMTBUa2tjdjE2cnF6?=
 =?utf-8?B?TTV3Y2wxbkVienAxNllna3hWUW9tZXJyWTFXNllaSDU3MHhwVnpTNWw2cmpR?=
 =?utf-8?B?cnprL3BWbVNMekVvVWRIWEhTQVlMYVNaUnRSOWZkMUxGclh5bmYxUkhXV2Q1?=
 =?utf-8?B?UlAveE52S2NNWnI1T3YrdmZXdkd5UDRaM2VxSHRFWksxNFo3UXlLL3RmbFhu?=
 =?utf-8?B?bktjRmlWZkdlQUdBaThRSE5HTUQvalNHKzNvd0NaZzF2T0s1Ky9Kb0xXb0tN?=
 =?utf-8?B?Z244VnZHTlhjVTZpS0tDOXZLaDJzL2N6c08vM0hQdUZrd2EzN1hSQ1FxU0xZ?=
 =?utf-8?B?TG5QZzFmdzJMNWZNYThIbzJWTGthdXMwb0x6K0JsV2Y4TW1NMHIwYUwzVkFt?=
 =?utf-8?B?TldiUHhwd01uK0dhWjViRjMvaDJ2Vkd5STFOYndTdGVFdWxoSURTdlJQQUdq?=
 =?utf-8?B?bXZVaVo5TUUxck1JS1V4SG91MlpJVWZPK2VpRzg5OGczQTFLZHc0OWVUallV?=
 =?utf-8?B?ZkRGSWpxSmhYVzEvdWp2dz09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dTdjVk1DMFh2Mko4YnhNREgrcTdZUWo4QVBrWWtEcUlwc1ZJUk5jMkErMlBr?=
 =?utf-8?B?Rm5Jb1hoRkVmbkl4Q1RKampIY3J0ZkhIMlo4TjRWcS9XNEpkd0lCN0hhMDV0?=
 =?utf-8?B?L3YrOU1RYVZTa0FXdi9ZeXR1RFVxQ2ErUWhFbzJWL1NhQ3FzSno1NmR6N0xa?=
 =?utf-8?B?ZWNtd0xmdEpmanpSVWlmWDFuWnFIV3lRcEVJUzZUOVJVV21qbGpaYlFFVFlh?=
 =?utf-8?B?bS95bWN6SHd6MTEwTVJQN1JUMXhCMVdsM0x2YlhWV2hsOS8yYWJmbHNtSEx5?=
 =?utf-8?B?Um5FaGg3YVFEVUxWeC9aZC9xZkJKK3k1YmpMSUQ1eDB5aC9rL1o3VkFpaUYw?=
 =?utf-8?B?OWxoSDRSZDE2M2FxeE9sK1NHWk91SEU3c0J1aU52V0d3dHZMTWlRUC9LR1lI?=
 =?utf-8?B?UFJqZWxIbzRuRUxPWHNXUDRkNXNCcmp5RTVKL25FWFcyV0hZenZlOUdCaFhU?=
 =?utf-8?B?anZNVlJSNUNOMjM1c3N2QUhGU1ZzdndOYnJxdS85QTRMNFhOMUVxOTZkOEx4?=
 =?utf-8?B?R1RuTkl6Z29LMUgvNWZDMklzQnhYelZWZ2U0ckg3VEhPT2pzVGNBdHd0czls?=
 =?utf-8?B?bmpNaVRXZFVweUFnTDZ2ajlhS1JyWmtkOForUFBNUEhHOWVzMEMyRnNpaVJ1?=
 =?utf-8?B?S0wvOGxhdjNscWgyREJGUnZGUkF6YUxYeDlaZm5MdUdtb0NTSk9rUnJIVmJL?=
 =?utf-8?B?WlRtbzdlamhJSjdjSzVaeEFEMWd1QWFrS1JCMkFqeVNhWWtKbEV3WUQ3Vml6?=
 =?utf-8?B?cUdOWGQ0a2ZtYkVRR3ByNmg0UFdVcG1ibXJCRlJSOHlJQVBYTmVndjBTUWhG?=
 =?utf-8?B?YlN2cjYxU2F5U1FLN1d0ZWRCSDQ2RzlUazRPMkFoN21uTzV1QytIZjIzbU0v?=
 =?utf-8?B?NGlzOTBsamlPRFo0anRGRDU4UjMyOTc3SDc5Y3NrdTlhOTlzT0JWdTBYT1ZX?=
 =?utf-8?B?dkZlSWVjQ0VKeGJwNFdvRWFaT1NxbHkyaWRMaFc1bTh5ODZwaHo0QkJxWWxK?=
 =?utf-8?B?OHNYQ01FTTZkb1hrVEJQZElkT01peW5rRCtCSGpxS3dESUNIYmo1RkRadlA4?=
 =?utf-8?B?SUVZSTlKdmI3cUIxalNLbGpvS2x2bXFNUkx2WWUrS3c0WW1mc0JFY0p0L1Fn?=
 =?utf-8?B?T0Z6bmRUNE12YWpJeGU4cDcreElyRTVWMnF1TCtPMFp6cXZjRndLVXA0UkI0?=
 =?utf-8?B?TGF6cXcxV3A4ZnRXT01zMEd4VEtoQjBnRzd1cVhCSGNQOW5ldjRnL3pVOWpK?=
 =?utf-8?B?eFk4UTFWRWlvQkRBYm5DdEFOTHFaZ21DRlp4RWQ1enlPR0JOWW9RODNTUGlO?=
 =?utf-8?B?WnRPSC9vcUlyRWE4blhISXFwdjZyUWEvNERnRWRHU2pSeHF1UUxhQ1ptL1Zn?=
 =?utf-8?B?a0NCZ2NFK3FnYWpSYXYxNko3K2hmdGdJTTVMZEhvVDJIdTYyZzI1SmFWQW5J?=
 =?utf-8?B?OGNWL01ObFhsZmNDYk4zSE8vUGp1aW5jNmFiNmt0a3NVZThxdnEvbjVVYVh3?=
 =?utf-8?B?NkgxTGFQL0VGZXpHTVZ0WnV4VVJhVm5qNUhuTWhjS3kvV3JhNkJDMlVyaWFR?=
 =?utf-8?B?Zi9UNUc4Y1h3SnRxcW1EbFhDNzlDTVNVNWdOdFdPUFhTemVqWjgxOHVXRVlJ?=
 =?utf-8?B?N2RYQm5WNU8xNWdHek11Yll0WGNsVkk3WEpSS2hBKzZJZ3ZSc0hQR3ljVThN?=
 =?utf-8?B?RyswU3M4QjRXSzdPSEZZck5XaWx1YU9FaWZyUWx4RUx6aGhPdElYYno0ZXM5?=
 =?utf-8?B?WCtjdXQzUFRtTFJKLzBsWDRKVzlabmh1b0tHbmliT3Z0MzhMZXFUd2g3YTYv?=
 =?utf-8?B?ckRzeVM2NkhHTCthaWNMeVp1SzhrSGxrNjJuNE9XNnZPS0pkclgwYjNmWk9C?=
 =?utf-8?B?cWg3dnRqTDFGT3QxYlhGb2F3Tll2SldUenhYZjA2aDVzOFR4cHNoSFZvQ1Rq?=
 =?utf-8?B?WW5LRm9peTJjZlk5Y3Y1QU90bmJzajNhTzZyemJUKzhGbjZnYmZCRFZCdFh0?=
 =?utf-8?B?aGpUaUM2TmhQc3o0ZHA1SGtpc20yWERDbXVHZzBUbXo4VW5LMm9Wcmxsb09z?=
 =?utf-8?B?emd1THBCNDRMTk9qTTMrZUdXQ01Vd2JhMitKeUswMFZ2VGZ6b21ZTkVSV3Rn?=
 =?utf-8?B?T2ZCcnc5dm9tQy9aM2hXcTIra2gvT2JDbFBnRVJCUkl5R2pmQ29LSlB6T0N1?=
 =?utf-8?B?ekE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7C0CD89A9E2B6647BEDE3D95BDD8A09E@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e3a50d7-8ae3-4f9f-80a8-08dc62db7e12
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Apr 2024 14:50:03.2235 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rZwvav1TngP/HPqzUJf1WLeZeymD5oXQL52T4Vh+mYkXq9iK5WuqQs5HrahRT9gJLpz/oGDP/bfw/LTNdSV+Wg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6818
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

T24gTW9uLCAyMDI0LTA0LTE1IGF0IDE2OjUyICswMjAwLCBOaXJtb3kgRGFzIHdyb3RlOg0KPiBD
dXJyZW50bHkgZGV2aWNlIGF0b21pY3MgaW4gU01FTSBvbmx5IGJ1ZmZlciBpcyBub3Qgc3VwcG9y
dGVkIGFuZA0KPiBnaXZlbiB0aGF0IHNpbXVsdGFuZW91cyB1c2FnZSBvZiBkZXZpY2UgYXRvbWlj
cyBhbmQgQ1BVIGF0b21pY3Mgb24NCj4gdGhlIHNhbWUgU01FTSBidWZmZXIgaXMgbm90IGd1YXJh
bnRlZWQgdG8gZnVuY3Rpb24gd2l0aG91dCBtaWdyYXRpb24sDQo+IGFuZCBVTUQgZXhwZWN0cyBu
byBtaWdyYXRpb24gZm9yIFNNRU0tb25seSBidWZmZXIgb2JqZWN0cywgc28gdGhpcw0KPiBwcm92
aWRlIGEgd2F5IHRvIHNldCBkZXZpY2UgYXRvbWljcyB3aGVuIFVNRCBpcyBjZXJ0YWluIHRvIHVz
ZSB0aGUNCj4gYnVmZmVyIG9ubHkgZm9yIGRldmljZSBhdG9taWNzLg0KPiANCj4gdjM6IENhcHR1
cmUgcmV0IHZhbHVlIG9mIHhlX3ZtX2JpbmRfaW9jdGxfdmFsaWRhdGVfYm8oTWF0dCBCKS4NCj4g
ICAgIFJlbW92ZSByZWR1bmRhbnQgY29oX21vZGUgcGFyYW0gZnJvbSB4ZV92bV9iaW5kX2lvY3Rs
X3ZhbGlkYXRlX2JvKCkuDQo+ICAgICBSZW1vdmUgaGFzX2RldmljZV9hdG9taWNzX29uX3NtZW0g
ZnJvbSB4ZV9ncmFwaGljc19kZXNjKEpvc2UpLg0KPiAgICAgUmVwbGFjZSBEUk1fWEVfUVVFUllf
Q09ORklHX1NVUFBfREVWX0FUT01JQ19PTl9TTUVNIHdpdGggDQo+ICAgICBjb25maWcgZmxhZyBE
Uk1fWEVfUVVFUllfQ09ORklHX0ZMQUdfSEFTX0RFVl9BVE9NSUNfT05fU01FTShKb3NlKS4NCj4g
ICAgIE1lbnRpb24gdGhhdCBQVEVfQUUgd2lsbCBub3QgYmUgYXBwbGllZCB0byB1c2VycHRyKE1h
dHQgUikNCj4gDQo+IHYyOiBBZGQgQk8gaGVscGVyIGZ1bmMgaW4geGVfdm1fYmluZF9pb2N0bCgp
KE1hdHQgQikuDQo+ICAgICBVc2UgWEVfSU9DVExfREJHIGZvciBjaGVja3MoTWF0dCBCKS4NCj4g
ICAgIE1vdmUgcGxhdGZvcm0gY2hlY2tzIHdpdGggaGVscCBvZiBhZGRpbmcgZmxhZ3MgaW4NCj4g
ICAgIGludGVsX2RldmljZV9pbmZvKE1hdHQgQikuDQo+ICAgICBBZGQgZG9jdW1lbnQgZm9yIERS
TV9YRV9WTV9CSU5EX0ZMQUdfREVWSUNFX0FUT01JQ1MoTWF0dCBCKS4gDQo+ICAgICBDcmVhdGUg
cXVlcnkgdUFQSSBmb3IgdGhpcyBuZXdseSBhZGRlZCBWTSBiaW5kIGZsYWcoSm9zZSwgTGlvbmVs
KS4NCg0KV2hvbGUgc2VyaWVzIGlzOiBSZXZpZXdlZC1ieTogSm9zw6kgUm9iZXJ0byBkZSBTb3V6
YSA8am9zZS5zb3V6YUBpbnRlbC5jb20+DQoNCj4gDQo+IFRlc3Qtd2l0aDogMjAyNDA0MTUxNDM1
MjguNDEwNy0xLW5pcm1veS5kYXNAaW50ZWwuY29tDQo+IENjOiBCYWxhc3VicmFtYW5pIFZpdmVr
YW5hbmRhbiA8YmFsYXN1YnJhbWFuaS52aXZla2FuYW5kYW5AaW50ZWwuY29tPg0KPiBDYzogQnJp
YW4gV2VsdHkgPGJyaWFuLndlbHR5QGludGVsLmNvbT4NCj4gQ2M6IEZlaSBZYW5nIDxmZWkueWFu
Z0BpbnRlbC5jb20+DQo+IENjOiBKb3NlIFNvdXphIDxqb3NlLnNvdXphQGludGVsLmNvbT4NCj4g
Q2M6IExpb25lbCBHIExhbmR3ZXJsaW4gPGxpb25lbC5nLmxhbmR3ZXJsaW5AaW50ZWwuY29tPg0K
PiBDYzogTWF0dCBSb3BlciA8bWF0dGhldy5kLnJvcGVyQGludGVsLmNvbT4NCj4gQ2M6IE1hdHRo
ZXcgQnJvc3QgPG1hdHRoZXcuYnJvc3RAaW50ZWwuY29tPg0KPiBDYzogTWljaGFsIE1yb3playA8
bWljaGFsLm1yb3pla0BpbnRlbC5jb20+DQo+IENjOiBPYWsgWmVuZyA8b2FrLnplbmdAaW50ZWwu
Y29tPg0KPiBDYzogVGhvbWFzIEhlbGxzdHJfbSA8dGhvbWFzLmhlbGxzdHJvbUBsaW51eC5pbnRl
bC5jb20+DQo+IA0KPiBOaXJtb3kgRGFzICg3KToNCj4gICBkcm0veGU6IEludHJvZHVjZSBoYXNf
YXRvbWljX2VuYWJsZV9wdGVfYml0IGRldmljZSBpbmZvDQo+ICAgZHJtL3hlOiBDb25zb2xpZGF0
ZSBzZXR0aW5nIFBURV9BRSBpbnRvIG9uZSBwbGFjZQ0KPiAgIGRybS94ZTogQWRkIGZ1bmN0aW9u
IHRvIGNoZWNrIGlmIEJPIGhhcyBzaW5nbGUgcGxhY2VtZW50DQo+ICAgZHJtL3hlOiBNb3ZlIHZt
IGJpbmQgYm8gdmFsaWRhdGlvbiB0byBhIGhlbHBlciBmdW5jdGlvbg0KPiAgIGRybS94ZTogSW50
cm9kdWNlIGhhc19kZXZpY2VfYXRvbWljc19vbl9zbWVtIGRldmljZSBpbmZvDQo+ICAgZHJtL3hl
L3VhcGk6IEludHJvZHVjZSBWTUEgYmluZCBmbGFnIGZvciBkZXZpY2UgYXRvbWljcw0KPiAgIGRy
bS94ZS91YXBpOiBBZGQgYSBxdWVyeSBmbGFnIGZvciBoYXNfZGV2aWNlX2F0b21pY3Nfb25fc21l
bQ0KPiANCj4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9iby5jICAgICAgICAgICB8ICAxNCArKysr
DQo+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfYm8uaCAgICAgICAgICAgfCAgIDEgKw0KPiAgZHJp
dmVycy9ncHUvZHJtL3hlL3hlX2RldmljZV90eXBlcy5oIHwgICA0ICsNCj4gIGRyaXZlcnMvZ3B1
L2RybS94ZS94ZV9wY2kuYyAgICAgICAgICB8ICAgNSArKw0KPiAgZHJpdmVycy9ncHUvZHJtL3hl
L3hlX3BjaV90eXBlcy5oICAgIHwgICAxICsNCj4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9wdC5j
ICAgICAgICAgICB8ICAgNCArLQ0KPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3F1ZXJ5LmMgICAg
ICAgIHwgICAzICsNCj4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV92bS5jICAgICAgICAgICB8IDEw
NiArKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV92
bV90eXBlcy5oICAgICB8ICAgMiArDQo+ICBpbmNsdWRlL3VhcGkvZHJtL3hlX2RybS5oICAgICAg
ICAgICAgfCAgMjIgKysrKy0tDQo+ICAxMCBmaWxlcyBjaGFuZ2VkLCAxMTYgaW5zZXJ0aW9ucygr
KSwgNDYgZGVsZXRpb25zKC0pDQo+IA0KDQo=
