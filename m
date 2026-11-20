Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12FE2606A320
	for <intel-xe@archiver.kernel.org>; Fri, 20 Nov 2026 11:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LufAtDb3;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=fnQjt01n
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5B2D112926;
	Fri, 20 Nov 2026 11:42:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05497112926
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Nov 2026 11:42:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795174927; x=1826710927;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=8ruHIOU03+cqLdWjBXTeIP/LjoROoF/C6SbhZPOJ1vc=;
 b=LufAtDb3jLRg91svIhsKCgtgeoxg6ba23S+gN+jMJuMp0FWMTBDKA+4h
 navhAtaHjyXgYwrYXHEdiD0sM9TFQkLvoNJ/rfOjZtnCcE0arn7r+TLFF
 +/lAUl0wKKAKvazMoGch0eYY/ZG9VfyBsTx1XhJsdpNpqvbRtvziGdn3I
 kNoFG57uoIIzhWjlcNT0k1+X+mkW6MkHZkk36fI6tFY9bcApwm8qtBnnr
 Bc3zb38AsD5dhQYsMgjWJHkolaiMdi4ThpO9C4P8YCZXo3nRJGDaUX3h3
 YFiJvNTCzRDpChfkzUEyB8CcmfecXmU8CXk0ejwrg5ZNVLmkM3oFTj+CS g==;
X-CSE-ConnectionGUID: scVzfrrbQZW4CPDIpQ7fBw==
X-CSE-MsgGUID: fhtTfqQ7SL6xIOtGdwgV2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="4131414"
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="4131414"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 03:42:07 -0800
X-CSE-ConnectionGUID: 6BiWqCOKToe9kpHyMzcbpg==
X-CSE-MsgGUID: kGS9gZ15SGWKv6ys7HDcjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; d="scan'208";a="11254778"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 03:42:06 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 20 Nov 2026 03:42:05 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Fri, 20 Nov 2026 03:42:05 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.31) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 20 Nov 2026 03:42:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yVO1xd3K/A1jZtIxV6SlDz0qJrOi3v90pjkkmrXBUAZ+dHmraZxvtEEyDj9zQe60Dh4tFuI0yBCQ99jMoEr3Zbuzcmj4wzfrUVyOq5YXWUj5crRVYXnnbHXnrO/W3u8HSpps5fAUus2I8OvIke2WQdF6eUGQG7N1gsD/rEWY3RCK7uOSUtqxmoGKC7V0PD/KtUfo6zQeJADPJAcvqTHl1gBV2COP/iiO0W0+uNzPq3d0v8JKMFm2OV0Pkt6a/cGfQxk4WkeW8nBNC1TlxJ9hjsP06QjLWcwIQZP3TCX10LQHt9sMXyOekGgaeb9bs9Ihz1LG66YR5z/JDNIfVBieQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8ruHIOU03+cqLdWjBXTeIP/LjoROoF/C6SbhZPOJ1vc=;
 b=bEaNrVvKiFfd8VAOwcbb9yOFHY4Z2Az7ee7cF8WEmEX5nCr4HOMe0XMmoRR7E2bEUOfr6bHqm2geXhqDIkAvsq6L/PJk6c0/v0WID1xozt7fIMZO9YBZlU3LZszghGdp/+//KLr8n4wesP74/gMSxKhAlcOLQSVMidh80+SEXedF77yJ2FnDR4OIuwYARg7zT8tmTTLUab+JMBE4Ft8otqjM3udDA88Ata9igNqU26Ancyhr8hHpfsukb2NIPAfcfgdx3v59yKRFWJQDzsLU0+fhDUmFIuT/YBYxffRur2CDMrSFoPn97SaiHlPJjEmhvlBvyOwiv7TW0KG5nXT8Qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8ruHIOU03+cqLdWjBXTeIP/LjoROoF/C6SbhZPOJ1vc=;
 b=fnQjt01nyenEqwmqSWgK8pHodsfsjceSouG3Hgu5ePzrItY+ZQxcZLsR4Z2Dtfu9RkJa8be2VYEny4FzdKXh34vBkQDJUOe1opv3uInhiYRJeXgRBWih/G+d0xOQMcU1EsIFfcD1kOqaeYoPj9tL1t0yEze7EGavKBG3i49I30c=
Received: from DS4PR11MB131308.namprd11.prod.outlook.com (2603:10b6:8:502::7)
 by IA1PR11MB6169.namprd11.prod.outlook.com (2603:10b6:208:3eb::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Fri, 20 Nov
 2026 11:40:01 +0000
Received: from DS4PR11MB131308.namprd11.prod.outlook.com
 ([fe80::40c0:7a50:a98c:8920]) by DS4PR11MB131308.namprd11.prod.outlook.com
 ([fe80::40c0:7a50:a98c:8920%6]) with mapi id 15.21.0639.011; Fri, 20 Nov 2026
 11:40:01 +0000
From: "Tangudu, Tilak Tirumalesh" <tilak.tirumalesh.tangudu@intel.com>
To: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>, "Piorkowski,
 Piotr" <piotr.piorkowski@intel.com>, "Narvaez, Jesus"
 <jesus.narvaez@intel.com>, "Ceraolo Spurio, Daniele"
 <daniele.ceraolospurio@intel.com>, "Summers, Stuart"
 <stuart.summers@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH 2/4] drm/xe: Add MI_SEMAPHORE_WAIT_64 instruction
 definition
Thread-Topic: [PATCH 2/4] drm/xe: Add MI_SEMAPHORE_WAIT_64 instruction
 definition
Thread-Index: AQHdc4gTipSxNVJaGEaU8avaAK5LZrc2n90AgAA+V2CAAAJesA==
Date: Fri, 20 Nov 2026 11:40:01 +0000
Message-ID: <DS4PR11MB131308DEBDF6C874BA74131C3AC8782@DS4PR11MB131308.namprd11.prod.outlook.com>
References: <20261113155734.4164230-1-tilak.tirumalesh.tangudu@intel.com>
 <20261113155734.4164230-3-tilak.tirumalesh.tangudu@intel.com>
 <1334be6a-b10d-48ba-acdd-81b54e0cc15b@intel.com>
 <DS4PR11MB131308D11E0F408542E7355B81C8782@DS4PR11MB131308.namprd11.prod.outlook.com>
In-Reply-To: <DS4PR11MB131308D11E0F408542E7355B81C8782@DS4PR11MB131308.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PR11MB131308:EE_|IA1PR11MB6169:EE_
x-ms-office365-filtering-correlation-id: 13a4ba7b-10af-4a70-fe9d-08df46fb0335
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|22082099003|18002099003|3023799007|921020|260925021311599003|260925022911599003|260925021911599003|4143699003|11063799006|56012099006|10067099003|261022113327099003|261022105027099003|261026121527099003|261022075727099003|261028144727099003|261026140227099003|261021121427099003|261009223027099003|261102123227099003|38070700021;
x-microsoft-antispam-message-info: HivG0x3Q+ItBz85MisFKzF0woqnErkSOHRLCfvav+iHOB+erMzfNEHunRoUMp6n26Lets5k4acHXozc3zsuISkbubHmxVAX+WpDL7XygvXBMYz0k44ghP31b0pJ6xj8HVuxSw6fG54c99Esi8ArlrpYE6Uqm6FMKanI8aOITh+UKkiAD62DGoTC2+1Raj39fHVDUDPBK5xLW9IZjfx8u/aEdwPCKJt6pa173UjbP6eUCIz4CEP8eOoHxL/epYXBTpLNh+W1Bczor9jgk4nuQRPzlmJg1pYGaB0LAN5JoRGfeSlbXGq3e+EnYTec2C2t2A3j20n35x+e888XibJKSm7PYTNqm5W6bDCz+g9J0DHVOFE927zWtXMb4ZbCUFg2G8Bl1PzSM6NI4fxCKK5CFSd4RjVljyV/7M5ZeWhKKvUJoLG7E/wd7fPUqnMkNORsCL35TbZFIIWbETBZgSgSIwzB5pLcDkSVGNArjlVwiUWSCKXh8OSioYkfy1B/I4hleM5ZVG4H5imPcUyGatnDEvq+gF1Q7eQToZUE+QvC6Skt9WFtNDpQK2wiJhd9PzvjvS1ZoBrgXQpg4SJwbaRYSYss9IGs/O+PYx6KVRaiSmrXuu81ecK+5hgm7iJRuRrqPODX83DIhmfgUA4YKn+a2weAzHd/2iiCPHO6T/cxHkiIfD2lap3F8ukl5hJll3O88irCtmR1p/1g8QMvpLp5iq57xXz0jhxYhW7Fe6t5lUWM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PR11MB131308.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(22082099003)(18002099003)(3023799007)(921020)(260925021311599003)(260925022911599003)(260925021911599003)(4143699003)(11063799006)(56012099006)(10067099003)(261022113327099003)(261022105027099003)(261026121527099003)(261022075727099003)(261028144727099003)(261026140227099003)(261021121427099003)(261009223027099003)(261102123227099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YVFYUUptTWZDTlB3TTg3YU9kVUdCOStXTkZDc0FtL1oycmJLcmZadFBPbTRh?=
 =?utf-8?B?UW1yU1RjRi9DYituUERBd25oalp0aS92d2dNZWJGUlh2VC9zdlRieDZVTGNW?=
 =?utf-8?B?QnVHQkFhUWplSXFoZ1M2d29teFlXaE9xZXVoUTJkMW9lQmYrbHpyZS8wMFVW?=
 =?utf-8?B?Z1R6eko5VlJ1Y1FDb21CUjhOcnJ5SVE0T09FaHREakMvZ2Z6d0N3d3pDZmww?=
 =?utf-8?B?WUFVaUs2MW51azJRMENpelZqeFVnL094a3FmY2xRanloVkxFdDh2SnZSd0VZ?=
 =?utf-8?B?dUFrNWp3anRyRFU1a3V1eTdJcHhkd0xhTXdlQTJJY2lWRDhwdk5RMGh3RnFF?=
 =?utf-8?B?RC9ueVB6MXZab3ZHZHdPTnVuT3ZqamljNllTa1ZtSEtsQ2pwQmQ2cUsyL1ZV?=
 =?utf-8?B?ZzVUOU9aUk1yZURXVmV4dVlRUFRGQ2FPaDVKamxlT1l0S21hM3V3Q1ZvQ2Jm?=
 =?utf-8?B?b3BnWERBa2YyYTlxQnN1cFhWTER3RFVxUHFZTFo5ZlhIc1FibEwxVllPZCtH?=
 =?utf-8?B?Z1Vic1FiMk5meUppMWpvakZacWczOVNWWmNFaXplNXgzRktGSTdIaVdzM0ZY?=
 =?utf-8?B?OG9UdldlRWxzTnA2aVdjTlgvcUFqVTdERnFnZWd2dzdrdnUzZVJGME9LcGw2?=
 =?utf-8?B?OHJVSDg1RmFwR1dWOGNSQWplRURCZStjSXRkdUVIaEZKMEx4b1Z1cTJnRjQw?=
 =?utf-8?B?MmpadDNaZmYyaGZ2QU9vc2FRNnBOUnljdWR5TmtZd1UzU01FTnhkNjNOWFNm?=
 =?utf-8?B?RkxMMXdvazdNRW1jVThDZmljQkxsWWdnZDYyUmlnR1I0N0VXUTM2NzNiVzhh?=
 =?utf-8?B?U3FWdTcwMjIrWFVydkhVdWtRVkEvTUlybjNOZkZhcmNFbEVOYmtLUVFUVDJH?=
 =?utf-8?B?RmYwcXo1M01Ia0FNVTN2ZE1IVnI1cHZidkRTL240VWFlTjlwV243OFNiT0xG?=
 =?utf-8?B?T0ViWVdPbkhKQ0JveE5sd1h1MXRpVUhXRXN4N3FaR0lkNFZjMHZJV1NUSVhC?=
 =?utf-8?B?Y3VRdHl3WHcyYVlSTW1aSVV6TFN5TlFSM3RoMENBRWJwZDcxVUhjWGpNamx2?=
 =?utf-8?B?VlVoVkpxamltVEJkRmVqNEs0VWk4UnJUYm5JTmkzSy9CTHppK2x2WG80ck5Y?=
 =?utf-8?B?STlYTllqdWh6blRiVDY3NUhYMmVNTGZkWVlJNXNBMmJLYWNvMVNVaWlodDND?=
 =?utf-8?B?cGxNOHovUUE1QUlLRUc0bHVNZFRrdk50Z0ZvcTFOWGl1VE5MYmNQa2tqYSt6?=
 =?utf-8?B?TkNIUVQ5WmZIZWk1YTN0ZVRvd1BrV0YxeHg2dFFKRnlWUDhvNFN3SE5PNUNo?=
 =?utf-8?B?Rlk5T2VNZ2ZxQkdnR2RmOExCR0k5VzcyUEVKNzI3ZndtSWo4MTZvd1E3T0N3?=
 =?utf-8?B?YmluTEE5VWZGSGswVEljWThjWW9LQlk2QXZ4RmQwT2NlRTBEMWJ2U1RmNTlw?=
 =?utf-8?B?eCs0bGRnbDR0ZTltN0FxSEViKzBuek1DS1VmWHEza2k4UGROZDZVL1ZOcUph?=
 =?utf-8?B?OXdDQWUxQVlJNzgyWG9FMjBld1kxaGdvNUp4LzZWYmxqTHRHWS9qWjZzT3Zp?=
 =?utf-8?B?cmlyMGNwcEVzY0VmcUg1Ym1CQVNVaDhKUFFBYk55ZTVNbWcrWVZOT3F5cEVR?=
 =?utf-8?B?Y25aeko4c20xUmJZdzhBOXNxNmMxSkhhQytaNHRnSWM1ODZMSDFJVTBVaksv?=
 =?utf-8?B?NWhaWW9LaEIyWlp3Qlc2eVA1akNDZFNTOWF4elV5cVRhdngyQ2F3OERBdUNr?=
 =?utf-8?B?MHdKMEM3NVNlOTR4QmRjU2U2Y0ZMdngvZitPSjcvUTJEMG1VUEtrRTZURjB3?=
 =?utf-8?B?LzRDc2lZZzZGdlM0dmV1THhCNUM0YU5ZY3VNZlhRS3laMmhtaThYa3FjRmUr?=
 =?utf-8?B?UVA0WUFnZm9UdXAxalVhVnBaOExyc2dYbzZ3OWU4cE14QVp6clo4YnVMSUNz?=
 =?utf-8?B?Skh4SEtwYzIwQUdVVlJ5Qkx4Tms1MkJtSmtRb2d4Vzd1U0ZzY3ZvNS9QRFRU?=
 =?utf-8?B?S294a2R3dDdtVFF2dzVwbmU3NnJQSlF1aGYreThvSzAxeDNxdWNES2tzQ2Z5?=
 =?utf-8?B?V3VDYXhqbW9wTm1OUXM0ajExYndjNGxuTFdYc1A3ZTJ1emlJbnp3d2VnZFlh?=
 =?utf-8?B?MkxuQ2twQzBIRTJqanBmZ00vNmVOaWJSTVhMYXZGd09tOE9tU3Nwem5Fd1Bn?=
 =?utf-8?B?SlBWTjNQWUJhdUFSck1RbVVEMUo4MEo5YzVKMElCKy9mTlhXWmVtWUhnR1VP?=
 =?utf-8?B?NytOMlEyV3pNcVhWZTlSSHovTFQvT2RscWJpSVFVV1RZRXMxQ3hyVm9ibm1C?=
 =?utf-8?B?b2VyS0hPODJXM2xiOXlLdTdQUkhkcnJUd1ZHOGw5TVo3S21MK0dER25yMmN3?=
 =?utf-8?Q?fJL0eR61yZVsehkU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: KnGXxHigJANhwnZ8+mTmx0Lx1wQyUnjuPDKiZ02oQPRQJNV7ejBzpm+7E9TjrYIztFSLi+NuZkZXZDJp0sNJUfaiOeZQFVUP052rf+k7FIXzRL8iKso1rj6ADfPEn34NDmH/Fhtc7XAgdt+ChlpHuXVJ9LxQbp/UnY1FlKxbA2wfLOjDog+QuBgUcY8sqTPRzcM3k2F7+k0o9F4LTxL9HK7Dan+RC+9+D9E9d7/gnzYavvHk4M1yhAxqs43evn2ivBrTjN2F+xAxODn7KIC8bRhJO1QdWDlxvctaffWMa+qAxki3zs6J4HFp1IvJKRBrMmd828M4rZhnQ/OVXZ4WhA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PR11MB131308.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13a4ba7b-10af-4a70-fe9d-08df46fb0335
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2026 11:40:01.4161 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yId+RX4uIs77ILAJqSSBTiYGIj/apa2buLLXYMIlUE3iVe2RmebR9OTMcZ4Xbp8U9EQCm3WXVvlfN1KNmpjKUgiKSBEnLlPrw43fLwkf5LclvSXysoJ1YtA1+0N2aEAG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6169
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogVGFuZ3VkdSwgVGlsYWsg
VGlydW1hbGVzaA0KPiBTZW50OiAyMCBOb3ZlbWJlciAyMDI2IDE3OjAyDQo+IFRvOiBLIFYgUCwg
U2F0eWFuYXJheWFuYSA8U2F0eWFuYXJheWFuYS5LLlYuUEBpbnRlbC5jb20+OyBQaW9ya293c2tp
LCBQaW90cg0KPiA8UGlvdHIuUGlvcmtvd3NraUBpbnRlbC5jb20+OyBOYXJ2YWV6LCBKZXN1cyA8
amVzdXMubmFydmFlekBpbnRlbC5jb20+Ow0KPiBDZXJhb2xvIFNwdXJpbywgRGFuaWVsZSA8ZGFu
aWVsZS5jZXJhb2xvc3B1cmlvQGludGVsLmNvbT47IFN1bW1lcnMsIFN0dWFydA0KPiA8c3R1YXJ0
LnN1bW1lcnNAaW50ZWwuY29tPjsgaW50ZWwteGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IFN1
YmplY3Q6IFJFOiBbUEFUQ0ggMi80XSBkcm0veGU6IEFkZCBNSV9TRU1BUEhPUkVfV0FJVF82NCBp
bnN0cnVjdGlvbg0KPiBkZWZpbml0aW9uDQo+IA0KPiANCj4gDQo+ID4gLS0tLS1PcmlnaW5hbCBN
ZXNzYWdlLS0tLS0NCj4gPiBGcm9tOiBLIFYgUCwgU2F0eWFuYXJheWFuYSA8c2F0eWFuYXJheWFu
YS5rLnYucEBpbnRlbC5jb20+DQo+ID4gU2VudDogMjAgTm92ZW1iZXIgMjAyNiAxMzoxOA0KPiA+
IFRvOiBUYW5ndWR1LCBUaWxhayBUaXJ1bWFsZXNoIDx0aWxhay50aXJ1bWFsZXNoLnRhbmd1ZHVA
aW50ZWwuY29tPjsNCj4gPiBQaW9ya293c2tpLCBQaW90ciA8cGlvdHIucGlvcmtvd3NraUBpbnRl
bC5jb20+OyBOYXJ2YWV6LCBKZXN1cw0KPiA+IDxqZXN1cy5uYXJ2YWV6QGludGVsLmNvbT47IENl
cmFvbG8gU3B1cmlvLCBEYW5pZWxlDQo+ID4gPGRhbmllbGUuY2VyYW9sb3NwdXJpb0BpbnRlbC5j
b20+OyBTdW1tZXJzLCBTdHVhcnQNCj4gPiA8c3R1YXJ0LnN1bW1lcnNAaW50ZWwuY29tPjsgaW50
ZWwteGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+ID4gU3ViamVjdDogUmU6IFtQQVRDSCAyLzRd
IGRybS94ZTogQWRkIE1JX1NFTUFQSE9SRV9XQUlUXzY0IGluc3RydWN0aW9uDQo+ID4gZGVmaW5p
dGlvbg0KPiA+DQo+ID4NCj4gPiBPbiAxMy1Ob3YtMjYgOToyNyBQTSwgdGlsYWsudGlydW1hbGVz
aC50YW5ndWR1QGludGVsLmNvbSB3cm90ZToNCj4gPiA+IEZyb206IFRhbmd1ZHUgVGlsYWsgVGly
dW1hbGVzaCA8dGlsYWsudGlydW1hbGVzaC50YW5ndWR1QGludGVsLmNvbT4NCj4gPiA+DQo+ID4g
PiBXYV8xNjAyOTI4MTkxMyByZWNvbW1lbmRzIHVzaW5nIHRoZSBNSV9TRU1BUEhPUkVfV0FJVF82
NA0KPiA+IGluc3RydWN0aW9uDQo+ID4gPiBpbnN0ZWFkIG9mIHRoZSBsZWdhY3kgTUlfU0VNQVBI
T1JFX1dBSVQsIGR1ZSB0byBhbiBpc3N1ZSB3aXRoIHRoZQ0KPiA+ID4gbGVnYWN5IHNlbWFwaG9y
ZSBvbiBzb21lIFhlM3AgcGxhdGZvcm1zLg0KPiA+ID4NCj4gPiA+IEFzc2lzdGVkLWJ5OiBMTE0N
Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IFRhbmd1ZHUgVGlsYWsgVGlydW1hbGVzaA0KPiA+ID4gPHRp
bGFrLnRpcnVtYWxlc2gudGFuZ3VkdUBpbnRlbC5jb20+DQo+ID4gPiAtLS0NCj4gPiA+ICAgZHJp
dmVycy9ncHUvZHJtL3hlL2luc3RydWN0aW9ucy94ZV9taV9jb21tYW5kcy5oIHwgNiArKysrKysN
Cj4gPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKQ0KPiA+ID4NCj4gPiA+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUvaW5zdHJ1Y3Rpb25zL3hlX21pX2NvbW1hbmRz
LmgNCj4gPiA+IGIvZHJpdmVycy9ncHUvZHJtL3hlL2luc3RydWN0aW9ucy94ZV9taV9jb21tYW5k
cy5oDQo+ID4gPiBpbmRleCA4MzVlZjc1YmJlYjEuLjE4NmM5YWMzNWU1YiAxMDA2NDQNCj4gPiA+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS9pbnN0cnVjdGlvbnMveGVfbWlfY29tbWFuZHMuaA0K
PiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL2luc3RydWN0aW9ucy94ZV9taV9jb21tYW5k
cy5oDQo+ID4gPiBAQCAtMzQsNiArMzQsNyBAQA0KPiA+ID4gICAjZGVmaW5lIE1JX0ZPUkNFX1dB
S0VVUAkJCV9fTUlfSU5TVFIoMHgxRCkNCj4gPiA+ICAgI2RlZmluZSBNSV9NQVRIKG4pCQkJKF9f
TUlfSU5TVFIoMHgxQSkgfA0KPiA+IFhFX0lOU1RSX05VTV9EVygobikgKyAxKSkNCj4gPiA+DQo+
ID4gPiArLyogV2FfMTYwMjkyODE5MTM6IE1JX1NFTUFQSE9SRV9XQUlUIGhhcyBhbiBpc3N1ZSBv
biBzb21lIFhlM3AsDQo+ID4gdXNlDQo+ID4gPiArTUlfU0VNQVBIT1JFX1dBSVRfNjQgKi8NCj4g
PiBEbyB3ZSBuZWVkIHRvIG1lbnRpb24gdGhpcyBpbiB0aGUgcmVnaXN0ZXIgZGVmaW5pdGlvbiBm
aWxlPw0KPiA+ID4gICAjZGVmaW5lIE1JX1NFTUFQSE9SRV9XQUlUCQkoX19NSV9JTlNUUigweDFj
KSB8DQo+ID4gWEVfSU5TVFJfTlVNX0RXKDUpKQ0KPiA+ID4gICAjZGVmaW5lICAgTUlfU0VNV19H
R1RUCQkJUkVHX0JJVCgyMikNCj4gPiA+ICAgI2RlZmluZSAgIE1JX1NFTVdfUkVHSVNURVJfUE9M
TAkJUkVHX0JJVCgxNikNCj4gPiA+IEBAIC00OCw2ICs0OSwxMSBAQA0KPiA+ID4gICAjZGVmaW5l
ICAgTUlfU0VNV19DT01QQVJFKE9QKQ0KPiA+IAlSRUdfRklFTERfUFJFUChNSV9TRU1XX0NPTVBB
UkVfT1BfTUFTSywNCj4gPiBDT01QQVJFX09QXyMjT1ApDQo+ID4gPiAgICNkZWZpbmUgICBNSV9T
RU1XX1RPS0VOKHRva2VuKQ0KPiA+IAlSRUdfRklFTERfUFJFUChSRUdfR0VOTUFTSyg5LCAyKSwg
KHRva2VuKSkNCj4gPiA+DQo+ID4gPiArI2RlZmluZSBNSV9TRU1BUEhPUkVfV0FJVF82NAkJKF9f
TUlfSU5TVFIoMHgzYikgfA0KPiA+IFhFX0lOU1RSX05VTV9EVyg3KSkNCj4gPiA+ICsjZGVmaW5l
ICAgTUlfU0VNVzY0X0lOVEVSUlVQVAkJUkVHX0JJVCgyMCkgLyogcmFpc2VzIHRoZQ0KPiA+IHNl
bWFwaG9yZS1mYWlsIGludGVycnVwdCAqLw0KPiA+ID4gKyNkZWZpbmUgICBNSV9TRU1XNjRfMzJC
X0NPTVBBUkUJCVJFR19CSVQoMTkpIC8qIDA6IDY0Yg0KPiA+IGNvbXBhcmUgKGRlZmF1bHQpLCAx
OiAzMmIgY29tcGFyZSAqLw0KPiA+DQo+ID4gQ2hlY2sgYWxpZ25tZW50IGhlcmUuDQo+ID4NCj4g
PiAtU2F0eWEuDQo+IFRoaXMgc2VlbXMgdG8gYmUgcGF0Y2ggdmlld2VyIGlzc3VlLCBJIGRvIG5v
dCBzZWUgYWxpZ25tZW50IElzc3VlIGluIGNvZGUNCj4gdmlld2VyLg0KPiANCldpbGwgdGFrZSB0
aGlzIGJhY2suLnVuZGVyc3Rvb2QgdGhlIGlzc3VlDQo+ID4NCj4gPiA+ICsjZGVmaW5lICAgTUlf
U0VNVzY0X0lOSElCSVRfQ1RYX1NXSVRDSAlSRUdfQklUKDE1KSAvKiBwb2xsIGluDQo+ID4gcGxh
Y2UsIGRvbid0IHN3aXRjaCBvdXQgb24gZmFpbCAqLw0KPiA+ID4gKw0KPiA+ID4gICAjZGVmaW5l
IE1JX1NUT1JFX0RBVEFfSU1NCQlfX01JX0lOU1RSKDB4MjApDQo+ID4gPiAgICNkZWZpbmUgICBN
SV9TRElfR0dUVAkJCVJFR19CSVQoMjIpDQo+ID4gPiAgICNkZWZpbmUgICBNSV9TRElfTEVOX0RX
CQkJR0VOTUFTSyg5LCAwKQ0K
