Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FB75606A32A
	for <intel-xe@archiver.kernel.org>; Fri, 20 Nov 2026 11:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UMJMlftm;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=aehKomiw
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF92A10E02A;
	Fri, 20 Nov 2026 11:32:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AE4E10E263
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Nov 2026 11:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795174332; x=1826710332;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=FqZ/EF+5OeDuYNKrs6WfGDwMnhyAmpU6Y8ryONtbQr4=;
 b=UMJMlftmpvzxLnbE4U48lCpAZlGiDJ1qJ+/wMQ0k7iU5oEbJ2jdcy8to
 n5RmoTx18jbuNC5ElIUibK5tilTsJu6yrIqWNEdYYGE14DPdZQWqHdTay
 FWnFQzRz+7kUCz7OJla6RscovvcLUYEhyX6If+fdO151r854DmWYvf2Ny
 jiWTWj8qhUAPvU9I6qaVF09fLHjez2IyqaklD2P1IuElii9IayC1l+1uU
 Zaq+BscGYTAJMYvKJykflzw0GPbhtHhzgRJ/TdPlxs0QR3ei1xktVKJQJ
 PwN9unVTl4t9imwVVY4EUxD22RbJhJT+oNvaU1h8KOI3484JZupbbVNoe A==;
X-CSE-ConnectionGUID: LdyB4dFmSueOuJEfkgJlFA==
X-CSE-MsgGUID: 9FiTNPSlRRut3MVDHQkFYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="4042798"
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="4042798"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 03:32:12 -0800
X-CSE-ConnectionGUID: XSBJP1PzRomMGvnqis4wIA==
X-CSE-MsgGUID: jDjrNUE1Sru8duqyvigUsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; d="scan'208";a="11014173"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 03:32:12 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 20 Nov 2026 03:32:11 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Fri, 20 Nov 2026 03:32:11 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.65) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 20 Nov 2026 03:32:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F2VS2wSMo2V145EcVfw6uEH5ENrS3g4hwnCYGUNCqoEYORTXIoHErBNcgw1KjqClq2B6RQ8CiIIQKYHXRiPi5B5JIDvvlmV0+fkfrzVHJagVn4AiE4CNllUaPML8PXtHMfTdguTEEQRAKzBKRsmIotS6zALjQ5+wsgOukJHEn9ERl+wx/Yd61J1190sCP0OaBv340Ao9mlqVqTjdDBeSYOpbD1Lov3fPOU4kA8yvsjuQ4VnS0NYgQWZm4xPk1Ry4zWQEj4pR6k6pqqht0a541mbmR2QxUOLFy3wRKJl2VEUk7oKeGwdX4aHk6vFxAw8de/X/PIh4j8ezzoqZeuHncw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FqZ/EF+5OeDuYNKrs6WfGDwMnhyAmpU6Y8ryONtbQr4=;
 b=DL2vvyQtxfhTPvQz+C8w3+lHzozVkVJyyUjn/V6FHeWy84i1Wcg5FrC/E4A7QL1rjSCzPoiyl2/AHdvYrBtvYqDW7eITzPtP/EJZFN+Ezod6Uwe5so6l+ea0MWecyhwveExLQxaX8gOAcvBMR2aiGO4vBYQs+B/w2hoseFNrTPIyQ7PCeFP3meyyP5AHEdgOkwy59z/eNHaHZZBKCPc+0+YtI/NsvcUTRSBZE5Ga9eKlAn7Me5AQNcEzUuq1h1O9LPdC5owLy9WYwHfEVznV6FRSJmff54r9jD34SFuuvoMtiI9/TPu+E0RtDQ918mjXziNA68CD+TbNvxvOZW3tdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FqZ/EF+5OeDuYNKrs6WfGDwMnhyAmpU6Y8ryONtbQr4=;
 b=aehKomiw9a9ph51MywmhM10JdID2L63tbRxwTWPSpa7JLnK1fb1In4kb1Q93iAnrkPsHRkYb0mlVgJ+W14DGX+yWuiEanQJbNXwU+eXq3TxCDNhIPft6ZQStbCzmG2Mmxrb5OFs5FTrMxkg3SJHseLsHQ/EqFu0rNxoblqKmCYE=
Received: from DS4PR11MB131308.namprd11.prod.outlook.com (2603:10b6:8:502::7)
 by CY8PR11MB7396.namprd11.prod.outlook.com (2603:10b6:930:87::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Fri, 20 Nov
 2026 11:32:08 +0000
Received: from DS4PR11MB131308.namprd11.prod.outlook.com
 ([fe80::40c0:7a50:a98c:8920]) by DS4PR11MB131308.namprd11.prod.outlook.com
 ([fe80::40c0:7a50:a98c:8920%6]) with mapi id 15.21.0639.011; Fri, 20 Nov 2026
 11:32:07 +0000
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
Thread-Index: AQHdc4gTipSxNVJaGEaU8avaAK5LZrc2n90AgAA+V2A=
Date: Fri, 20 Nov 2026 11:32:07 +0000
Message-ID: <DS4PR11MB131308D11E0F408542E7355B81C8782@DS4PR11MB131308.namprd11.prod.outlook.com>
References: <20261113155734.4164230-1-tilak.tirumalesh.tangudu@intel.com>
 <20261113155734.4164230-3-tilak.tirumalesh.tangudu@intel.com>
 <1334be6a-b10d-48ba-acdd-81b54e0cc15b@intel.com>
In-Reply-To: <1334be6a-b10d-48ba-acdd-81b54e0cc15b@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PR11MB131308:EE_|CY8PR11MB7396:EE_
x-ms-office365-filtering-correlation-id: bcfa6cde-84c5-4669-3a32-08df46f9e8e8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|1800799024|921020|38070700021|10067099003|261026140227099003|4143699003|11063799006|260925021311599003|260925021911599003|261022105027099003|56012099006|261102123227099003|260925022911599003|261022075727099003|261026121527099003|261022113327099003|261021121427099003|261028144727099003|261009223027099003|22082099003|18002099003|3023799007;
x-microsoft-antispam-message-info: I9T+U+QspjuX8Fk7+rLnVjeoi4K8sqQLd5scJWTvOO220CZ7g1yHFQO+FcfpC44BVxkcq+f96hwfLDKoFTnl1kX1MZBhp4p9jDoNRfwxaqVZ7yRuCjykZGXeKDbNomfW/CsFrmwCzUDbV6nDUo9QMKeZJFnAJOGcShWRNZL9lFZ0mOmLDL2+1837cCr84HfhlpvfNjFy1c4B2DRnO/j2v6KPTSEO8B2lpPMu9kA0EbeSIVJDPpDCFLhen/sNAcFcTmNVfzpAdfzUL9bDne0JrzJXDp+aeWAmU9kk0ksbYmBydCzVVLfLAIi1kJ5uy/pxpB+pGmO+MH88tYwTTa0xYyEo0Uge77jxsLUH5PDI6wlY22rGovTa5KSEq4KZVS6uuz3Ygoi7o1YZwXECAt00RZxW2OaSRpG0AydcQ5tc1VINpkjF3j8dyGcnkGYgRcm9DSowQQ9gTHHuxI6NK8bOoWEjXqNc0Slb6y7m1KBDTvYlMKNHRD3rW7EQNMUzuRqT2Ki7DyYwGlcJBW8obh6Qcg9u+80VGnj3SWTrlaHC+x8zJRApGSD2FHXqWDuEiwBxLKKOJNRMh12Xxjv8MeuHd4J3M9/De99uQnA0uQb5y1lXKVDF2INjKRKW4xRr3B6yrvO86hWPm9dkycGN7NA++VuS0k6LoSsT9mUkAde00v0SSyCKqUx4IoT7syIAW5Da53VEOofV4d2qxduVnwiflLWzLr22lcDDXLca3q1fAc4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PR11MB131308.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(921020)(38070700021)(10067099003)(261026140227099003)(4143699003)(11063799006)(260925021311599003)(260925021911599003)(261022105027099003)(56012099006)(261102123227099003)(260925022911599003)(261022075727099003)(261026121527099003)(261022113327099003)(261021121427099003)(261028144727099003)(261009223027099003)(22082099003)(18002099003)(3023799007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aElNbGVBd3B0ZGpVbzhWTWJKczRZNDh5ZE1JUExaSU1uUzVQNjc2WCtHQlBD?=
 =?utf-8?B?Zi9hMVpUNFVtUFlzL2VRWjZzcGtXZ3phMGZQbzhyZmNpR1ZHK0c3UXRiekZS?=
 =?utf-8?B?TTlNSllOMm1kem1kQytLRllqa0FVbUN5UVBPRGdmL2pLRmNhTVRJSUN6SDdz?=
 =?utf-8?B?eG9UQUZSeFRJZ1c1M3pJUkUyKzlLSk1tTFczeG1UZS9HcitTaXM4c2pHaU5j?=
 =?utf-8?B?cW5vaVZiQnJFTHk1N0s1Uld1UlJ4TWZ3OFFwM1ZEZE5oT05vUTVBU2U3VEZ2?=
 =?utf-8?B?WkNENjBWbmYybXNGclJPSW9xQXBDRUZmOTVwVUN1NU9jdlFXeEMza1ZiSm5F?=
 =?utf-8?B?ZnR1WlFZQUE3a2VHNTA3Kys5bEZsa0hqWERyNHhrdU4zelhzckR4M1ppMUV6?=
 =?utf-8?B?QnBBbGJlNjhHaTh6Nzg2SmNaUnRGTURRSno0VmJsVXAxRmZNWThQWTh0VEhL?=
 =?utf-8?B?NE5GVmI3ZGc2SmgrNi9hd09kWVdsaThuVkNheU8rOWh4VkRoVXhVR0RTU1dV?=
 =?utf-8?B?Qy9ZeVRoSUhmcll1enRCL203aTkvdTVzSDVOd3BBTjR5YThHWDA4STFNNWZX?=
 =?utf-8?B?eTZHY3h4bWQ0M0laVFJ4d2w1emVKUDFoaFozd3NmRTNQQUtYYkZtR1ZOakRp?=
 =?utf-8?B?VEptV1hDL3hQMUlUNVdIWGJKKzhrNHFvQ1lCVU5RYzAwTERCTkZ3dlVjSHFL?=
 =?utf-8?B?RVJkaHRZeDYweDRlL05IZE55M0dQYlpQOGJDdndtWlJKNjNSc1ZHRUVYZE9I?=
 =?utf-8?B?VVdTS3BzUXdWSGxWdGF6dUVqK1Jnd3hqL01TcXVPeDl5SHZ6T1BpaS9VYnlQ?=
 =?utf-8?B?ZEVQSFMwcnVta2NJQ0xBOWdYbGxobitKamlaNWhPWUR3cXgvQW90aWhVMk0x?=
 =?utf-8?B?NHpqSDU0OExRd1B0S1cxR3kyd0RrY1ZLSk1tQVA3amdCMmdZcy95cHQvb29i?=
 =?utf-8?B?M2pJN29GNXRoRm1vZzRzTVQreFJKeXhUVmluWmgwbmZ2RzJJWjMrcUI1ZVFP?=
 =?utf-8?B?T1Q2Z0JOUFFnQUF4V05TdWFxSG52MlZuQURSaGhCMElTbERxZUcyaWNINU5Z?=
 =?utf-8?B?MEFNM1lINFRjMy9VQUFFOXBGSG0xZ3JpK1FpN29KVGRkT1RmU213N2V0a1Vv?=
 =?utf-8?B?VWZlVkxFTXpTc1M2WUlSb2pTcGhyQ1pPdTNhSVozYVdhMlprUkN4dDBzTzMw?=
 =?utf-8?B?b2NFYkp1UjBZQVZmVk01UzliOE9LYTRHbVV2cGFRc0QzOGhxVVFOMVBPZ0V5?=
 =?utf-8?B?R21lQWtYcDJjRmNxa1JBdTJ6N21QV2lKS1BFSEFESjVRMTNIOGpIMlI4cnZ2?=
 =?utf-8?B?K21lYWlZR3NnS1huQXJLcVBtRW9yZm4xQWNvVlFNU2dXSjJQanN2bjFrUEVp?=
 =?utf-8?B?dWt3Z1NjV2xjZWVQNFJ5M29wUjVISUZzVThWZUplWkIySVRzRktJWFBLVVFn?=
 =?utf-8?B?bWlHOVFONGVOY2tmaGhRNFNHWmgxV1FtWTd1WS9FTVBRdndiTllnbEFXekhU?=
 =?utf-8?B?NzhKbWU3c0Nxd1YvMlc2b3U3NmtxSkJaaDlZK28yc0FVa0RDVjJla09HOUs3?=
 =?utf-8?B?Q2s0K1NRTHF2MzlUN21YSjRMU3oyT1hIaEtTQ1VKdjJicUJCQXdKYm1ibE1I?=
 =?utf-8?B?WHl4ejlRNmd6SmJxVnJuTG5xK0Q2TVQ1UHhQM2J5QlVSRlFZNVpQMGk1U0Zq?=
 =?utf-8?B?UnIrMTNMLy9xKzNtT2pVQXptTTEwYmhhUzg1VGFNMEp5djZsNU1oQVF4cnlG?=
 =?utf-8?B?UFM5dVRrOFhBbzNYeGRnK2xjMFR6YTN4bnZpSW9sRjU5TkxxRVl6ODBaSkpX?=
 =?utf-8?B?OUVVak9zQ09KOXhEZUdoQUR5SExjTllPYVRXbHJweFZqQ2htMU5Td0tFM1BX?=
 =?utf-8?B?eHptNnNNMmorbDRYWE04WjVMNExwRjI0ZDBJVkxjK1V1QlRjZ3NPTnpaRFd3?=
 =?utf-8?B?WG80MFd6OHNWaFJsczROUitZUm01OFgzTE5jc2lGWE9CMkVXdStybmkyQVMv?=
 =?utf-8?B?ak95dlM0alNCVytHRUNmdGtjWlBHWDBmUFhURnVuNUt4RWtMY3ZxMmo3Tjhw?=
 =?utf-8?B?RVJRR1IrRG9vNjBpZG4vSmZnS1pqOWY4NUVxeEE0US9BOHdkNWxqazlmK1lW?=
 =?utf-8?B?MjVycjFQV2V2SVpiR2hUMytOcElpWm9rbU9mZUtzSnJ4MGNUSDFTKzBhSi9K?=
 =?utf-8?B?ekczMzNaZit5MzFyYnV1NGFEQThERlJMQTNqbUh1S0EwNzZuTEhCblJHNmxW?=
 =?utf-8?B?T2Fsa2J2MHVoRjRZcGtjcHhBbGVTUDZ0Ri9mY0xnZGpVQXVDNEtuU3VNbDl6?=
 =?utf-8?B?c0FQSENvcHB6bHhnaXp2WnBLZlJkQytFaWRKOGtrR2p2MWs3NWhQTnJBNjg3?=
 =?utf-8?Q?ZjWLDQVsahWsalto=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: QO+oTa+eFsd5QzQK8jAWXrg4/LdGlLbn+snGM0J+y/0Y1gCcAw/bLHXoizaXqxCFXQaEZxqol6jKRYYQXmDCXFjNldvX07u9Ocoxci78vEGY++OTQwsC40rPXhKZaoU7mKWWFEbbATZJ0sLAcl9wytIEtI6ywliqkuMBvsnH34xvgay4YzQ+50yZsxevVqJ6z5JWmEFA/jz4hFUZwdmnDPeSOZbPSSB/H08ZDIZr8ISTi/yseGs1TszG1dxyotp26kXS986peEtD7hDvChZVVHUL0+mC/VsB7bbcghu7b4WKg5cQ7hvqiu0XUCYx00PIhEfCBEccxYdd+hDsmEbUlw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PR11MB131308.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bcfa6cde-84c5-4669-3a32-08df46f9e8e8
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2026 11:32:07.7753 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5OM9a8GxfW4OQjWX/SW9wR6tdY6zUU2IXFmNGSXbTfCTBn+JS49PjDXdXvjZuQyq9sQncaF6aM7HiWVQXVC0T2fqpLEa2zcsm50tWWs25pbAQGcguqZ3kM0YqID2GPps
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7396
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSyBWIFAsIFNhdHlhbmFy
YXlhbmEgPHNhdHlhbmFyYXlhbmEuay52LnBAaW50ZWwuY29tPg0KPiBTZW50OiAyMCBOb3ZlbWJl
ciAyMDI2IDEzOjE4DQo+IFRvOiBUYW5ndWR1LCBUaWxhayBUaXJ1bWFsZXNoIDx0aWxhay50aXJ1
bWFsZXNoLnRhbmd1ZHVAaW50ZWwuY29tPjsNCj4gUGlvcmtvd3NraSwgUGlvdHIgPHBpb3RyLnBp
b3Jrb3dza2lAaW50ZWwuY29tPjsgTmFydmFleiwgSmVzdXMNCj4gPGplc3VzLm5hcnZhZXpAaW50
ZWwuY29tPjsgQ2VyYW9sbyBTcHVyaW8sIERhbmllbGUNCj4gPGRhbmllbGUuY2VyYW9sb3NwdXJp
b0BpbnRlbC5jb20+OyBTdW1tZXJzLCBTdHVhcnQNCj4gPHN0dWFydC5zdW1tZXJzQGludGVsLmNv
bT47IGludGVsLXhlQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBTdWJqZWN0OiBSZTogW1BBVENI
IDIvNF0gZHJtL3hlOiBBZGQgTUlfU0VNQVBIT1JFX1dBSVRfNjQgaW5zdHJ1Y3Rpb24NCj4gZGVm
aW5pdGlvbg0KPiANCj4gDQo+IE9uIDEzLU5vdi0yNiA5OjI3IFBNLCB0aWxhay50aXJ1bWFsZXNo
LnRhbmd1ZHVAaW50ZWwuY29tIHdyb3RlOg0KPiA+IEZyb206IFRhbmd1ZHUgVGlsYWsgVGlydW1h
bGVzaCA8dGlsYWsudGlydW1hbGVzaC50YW5ndWR1QGludGVsLmNvbT4NCj4gPg0KPiA+IFdhXzE2
MDI5MjgxOTEzIHJlY29tbWVuZHMgdXNpbmcgdGhlIE1JX1NFTUFQSE9SRV9XQUlUXzY0DQo+IGlu
c3RydWN0aW9uDQo+ID4gaW5zdGVhZCBvZiB0aGUgbGVnYWN5IE1JX1NFTUFQSE9SRV9XQUlULCBk
dWUgdG8gYW4gaXNzdWUgd2l0aCB0aGUNCj4gPiBsZWdhY3kgc2VtYXBob3JlIG9uIHNvbWUgWGUz
cCBwbGF0Zm9ybXMuDQo+ID4NCj4gPiBBc3Npc3RlZC1ieTogTExNDQo+ID4gU2lnbmVkLW9mZi1i
eTogVGFuZ3VkdSBUaWxhayBUaXJ1bWFsZXNoDQo+ID4gPHRpbGFrLnRpcnVtYWxlc2gudGFuZ3Vk
dUBpbnRlbC5jb20+DQo+ID4gLS0tDQo+ID4gICBkcml2ZXJzL2dwdS9kcm0veGUvaW5zdHJ1Y3Rp
b25zL3hlX21pX2NvbW1hbmRzLmggfCA2ICsrKysrKw0KPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDYg
aW5zZXJ0aW9ucygrKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS9p
bnN0cnVjdGlvbnMveGVfbWlfY29tbWFuZHMuaA0KPiA+IGIvZHJpdmVycy9ncHUvZHJtL3hlL2lu
c3RydWN0aW9ucy94ZV9taV9jb21tYW5kcy5oDQo+ID4gaW5kZXggODM1ZWY3NWJiZWIxLi4xODZj
OWFjMzVlNWIgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL2luc3RydWN0aW9u
cy94ZV9taV9jb21tYW5kcy5oDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL2luc3RydWN0
aW9ucy94ZV9taV9jb21tYW5kcy5oDQo+ID4gQEAgLTM0LDYgKzM0LDcgQEANCj4gPiAgICNkZWZp
bmUgTUlfRk9SQ0VfV0FLRVVQCQkJX19NSV9JTlNUUigweDFEKQ0KPiA+ICAgI2RlZmluZSBNSV9N
QVRIKG4pCQkJKF9fTUlfSU5TVFIoMHgxQSkgfA0KPiBYRV9JTlNUUl9OVU1fRFcoKG4pICsgMSkp
DQo+ID4NCj4gPiArLyogV2FfMTYwMjkyODE5MTM6IE1JX1NFTUFQSE9SRV9XQUlUIGhhcyBhbiBp
c3N1ZSBvbiBzb21lIFhlM3AsDQo+IHVzZQ0KPiA+ICtNSV9TRU1BUEhPUkVfV0FJVF82NCAqLw0K
PiBEbyB3ZSBuZWVkIHRvIG1lbnRpb24gdGhpcyBpbiB0aGUgcmVnaXN0ZXIgZGVmaW5pdGlvbiBm
aWxlPw0KPiA+ICAgI2RlZmluZSBNSV9TRU1BUEhPUkVfV0FJVAkJKF9fTUlfSU5TVFIoMHgxYykg
fA0KPiBYRV9JTlNUUl9OVU1fRFcoNSkpDQo+ID4gICAjZGVmaW5lICAgTUlfU0VNV19HR1RUCQkJ
UkVHX0JJVCgyMikNCj4gPiAgICNkZWZpbmUgICBNSV9TRU1XX1JFR0lTVEVSX1BPTEwJCVJFR19C
SVQoMTYpDQo+ID4gQEAgLTQ4LDYgKzQ5LDExIEBADQo+ID4gICAjZGVmaW5lICAgTUlfU0VNV19D
T01QQVJFKE9QKQ0KPiAJUkVHX0ZJRUxEX1BSRVAoTUlfU0VNV19DT01QQVJFX09QX01BU0ssDQo+
IENPTVBBUkVfT1BfIyNPUCkNCj4gPiAgICNkZWZpbmUgICBNSV9TRU1XX1RPS0VOKHRva2VuKQ0K
PiAJUkVHX0ZJRUxEX1BSRVAoUkVHX0dFTk1BU0soOSwgMiksICh0b2tlbikpDQo+ID4NCj4gPiAr
I2RlZmluZSBNSV9TRU1BUEhPUkVfV0FJVF82NAkJKF9fTUlfSU5TVFIoMHgzYikgfA0KPiBYRV9J
TlNUUl9OVU1fRFcoNykpDQo+ID4gKyNkZWZpbmUgICBNSV9TRU1XNjRfSU5URVJSVVBUCQlSRUdf
QklUKDIwKSAvKiByYWlzZXMgdGhlDQo+IHNlbWFwaG9yZS1mYWlsIGludGVycnVwdCAqLw0KPiA+
ICsjZGVmaW5lICAgTUlfU0VNVzY0XzMyQl9DT01QQVJFCQlSRUdfQklUKDE5KSAvKiAwOiA2NGIN
Cj4gY29tcGFyZSAoZGVmYXVsdCksIDE6IDMyYiBjb21wYXJlICovDQo+IA0KPiBDaGVjayBhbGln
bm1lbnQgaGVyZS4NCj4gDQo+IC1TYXR5YS4NClRoaXMgc2VlbXMgdG8gYmUgcGF0Y2ggdmlld2Vy
IGlzc3VlLCBJIGRvIG5vdCBzZWUgYWxpZ25tZW50IA0KSXNzdWUgaW4gY29kZSB2aWV3ZXIuDQoN
Cj4gDQo+ID4gKyNkZWZpbmUgICBNSV9TRU1XNjRfSU5ISUJJVF9DVFhfU1dJVENICVJFR19CSVQo
MTUpIC8qIHBvbGwgaW4NCj4gcGxhY2UsIGRvbid0IHN3aXRjaCBvdXQgb24gZmFpbCAqLw0KPiA+
ICsNCj4gPiAgICNkZWZpbmUgTUlfU1RPUkVfREFUQV9JTU0JCV9fTUlfSU5TVFIoMHgyMCkNCj4g
PiAgICNkZWZpbmUgICBNSV9TRElfR0dUVAkJCVJFR19CSVQoMjIpDQo+ID4gICAjZGVmaW5lICAg
TUlfU0RJX0xFTl9EVwkJCUdFTk1BU0soOSwgMCkNCg==
