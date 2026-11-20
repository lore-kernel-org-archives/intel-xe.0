Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 976F2606A320
	for <intel-xe@archiver.kernel.org>; Fri, 20 Nov 2026 12:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FzhzXe7f;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=JNrRKFPT
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5210A1129AC;
	Fri, 20 Nov 2026 12:36:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB66E10E8BC
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Nov 2026 12:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795178181; x=1826714181;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=XIq7dlnNmkNR2SdS120W+8Sukj4lsUxGda9oGfxkOiI=;
 b=FzhzXe7fLFKn+hC4Tfm0UXIoNWb64Yi4CkNv1CGW6L/gO+RzXU25XEZh
 Y31Mvw6UqfBhUkgjaOh1+aCXvrnmH8DJ3I9XpPNmb/dsCOFyjYxyNtXEl
 WX38Skgzs9cchatiIUFSC4M7Vyn88D01nIlaDYZJTNXH1ZBDs5ur+5Eq2
 WxTP8z/3GvG/ML3NnFgyS7b9MhrLyPkGHxfe1H8xIPJ6A7sKjgcNl1WrW
 P6PeZ72quqG7KctWGPf2ZIZNYqSamFRyNeLBcX23Oul688zZaCa02dabU
 tsETMY+5L917U5QAB9mVuzVn88rRw+lg2uBBdeLqbgsICg3wk8bahm/7K A==;
X-CSE-ConnectionGUID: 9lgTl4yUTSe5rC8hl3nBrg==
X-CSE-MsgGUID: BouLVQmfQSifw/RoyCurpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="4057888"
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="4057888"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 04:36:20 -0800
X-CSE-ConnectionGUID: 6ldvf4ZARWuR/i7EZSFSGw==
X-CSE-MsgGUID: PiAmuNieS/WypP/6bE7yVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; d="scan'208";a="10503158"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 04:36:20 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 20 Nov 2026 04:36:19 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Fri, 20 Nov 2026 04:36:19 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.2) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 20 Nov 2026 04:36:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D+STSp4eJCmkLohK3LeMJBDgBuYRBldDvyRxgg0rfYCQbYzHll0UiDXb4y2T4pkDFdQ58uF3NVUsQmpBa7LwQPQyt1s7ZZjrnaQwYU64WkROXtKN9bFmJOBsY8A0XH+niS0s+qcZtykWpA+itdkzpX8EVV9VVybEUqUMuQe8LavycQVE56rGZEtl0YMPu/P5aA+FSC7brhXkRsR6I9BlT+AZJUxFvHcUBmKoa338HCXe15ih+AF56elxrTK4Lg1ONQBb0kwKk3RwGdL9MEeC261wThhTKr2wJsslovp/JEL+lBzbxOYD72M3ZsEFVlyVntvie7irFyw++2tsRkHmVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XIq7dlnNmkNR2SdS120W+8Sukj4lsUxGda9oGfxkOiI=;
 b=dEBvXhPAmfqqj8zPODm3zo/+titObTFC3EcX8VnRkUnb0uN1dKuYoqsuCp5M8CCJNXQjYc3Q6HhcLeUfkugj9O9nbsReej0MorLC4/GmneuqVcMbdBu4iv9hRD6ERiPjaTWaSTmfKlcpy5uxdBMFnzNM81QDt+YLgU4UBRRmLmUfJ6yvqKapPHUnVf05Bg2oKYIHIpLk9Bb+jHm8I4k7gOTJN7Mk/x/v/tdIw/vD87VkFSzTohPAdScA0Cynk4qNzOaMx1rvqTdSCF6m47taAj9qkk2irtJaqb61o+/kLtv86wYXFOHkhL1Jt6Hmxuz3lIXxJP5yAIKG5NssUtkA8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XIq7dlnNmkNR2SdS120W+8Sukj4lsUxGda9oGfxkOiI=;
 b=JNrRKFPTNHxk9NJcGTjAHQCvNx58d1u0mpPINKJEDrAe0YiWJREi9E8WrujudFYcIqOAyDxRcbiQDHthz8CEDtFxI/JWJGp/LoUodgOXZ2nPBIWQfePCTV54afU0kx95EQIREJ7ZNKm58CZ4gPVG17HKdO0nCF+EA9udDl9R4Ws=
Received: from DS4PR11MB131308.namprd11.prod.outlook.com (2603:10b6:8:502::7)
 by DSVPR11MB297563.namprd11.prod.outlook.com (2603:10b6:8:3ea::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Fri, 20 Nov
 2026 12:36:17 +0000
Received: from DS4PR11MB131308.namprd11.prod.outlook.com
 ([fe80::40c0:7a50:a98c:8920]) by DS4PR11MB131308.namprd11.prod.outlook.com
 ([fe80::40c0:7a50:a98c:8920%6]) with mapi id 15.21.0639.011; Fri, 20 Nov 2026
 12:36:17 +0000
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
Thread-Index: AQHdc4gTipSxNVJaGEaU8avaAK5LZrc2n90AgABNoaA=
Date: Fri, 20 Nov 2026 12:36:17 +0000
Message-ID: <DS4PR11MB131308979BF5529C7AEA338F72C8782@DS4PR11MB131308.namprd11.prod.outlook.com>
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
x-ms-traffictypediagnostic: DS4PR11MB131308:EE_|DSVPR11MB297563:EE_
x-ms-office365-filtering-correlation-id: 1881b4fd-fb15-482c-2f2c-08df4702df4f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|1800799024|22082099003|18002099003|3023799007|261022113327099003|4143699003|11063799006|260925021311599003|260925022911599003|260925021911599003|921020|261022075727099003|261026140227099003|261022105027099003|261028144727099003|56012099006|10067099003|261026121527099003|261021121427099003|261009223027099003|261102123227099003|38070700021;
x-microsoft-antispam-message-info: uHmQOdTJ8YcqW3EhvdTtBdIjwjoqq/fU+LSTS4MCyHEUrSB3vF05M8LfbvfA5Yl2CmVtTpGVZWFB43KAWXiWlg9DtHzAvZ8f+X9tgtc+aO180PKR+Nm3FGv7VKC9XbBDD2KIdXm2qbSskQMTyUipW7Ihx5yhLlWCqrBcM7mzHfpvL7wiN9zHkj9wjGfX3Jfvkg9sextKjPLA3tdj2Ub0u8DIko2YiALSzHu18BluMcOWFYxhhYwR/DSSxeZVbrNOlgsHFV/lfFOZjuxwd2ESfg04aqNs+XJUJz+jwWrgf0kPPp2SGXDgX+2hRqKIE3lVdimJtjLynXqm6y/sp5yZ261mahnDlwuSqkCn2ffWnaOMqJd9Sa29wY4nXgWq56tdQMoYlWPGVS3yu3+bqvAjv2HW6rZc1OjeU++ovWV09GVicM6W2pO1/0xopzHa0/2pZHnQKe+HKN2QcMXzlNg8M5ZobIzxFkUvDsZ5m0TM9ZaJx01Umaieey0XFDWDPcKwHsem39hY5/m9HItwdAFgr28w1d26wfmuzZf+G77im8QFeM/SfKS7WY0YvVissafpkw+braYV+1O6lSBLGp1zTDMYzQAHWT9dd2fnLqrcYFRmaLLXLxUpFjeakoYIt3J3ZtrNVIt7F5PVA8uzpcdlhK9/AZv0KsoZKJGgyq2VepE+EvgDDYeEhWU2tkhW4pNA5lFbDh7S8v3MHClTvei8eg0gFJpMRshokf5b3ljSXhk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PR11MB131308.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(22082099003)(18002099003)(3023799007)(261022113327099003)(4143699003)(11063799006)(260925021311599003)(260925022911599003)(260925021911599003)(921020)(261022075727099003)(261026140227099003)(261022105027099003)(261028144727099003)(56012099006)(10067099003)(261026121527099003)(261021121427099003)(261009223027099003)(261102123227099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YTJDeGJ4Z0lrZzB3ejE4V2FzUHFqTnNrb0FHbHFVVkU1T05Ia0svOENyOC9F?=
 =?utf-8?B?SU1IQkVKNjc2Zlh3Q0xTZTR1YjBNenpBSHlMUVZjWEpFaEJtUmkvTGdHMFIv?=
 =?utf-8?B?VjRlaTdjRktrcUtIaVVLaHlZMWNhcEp4UFR5cjV3cTVDemNXK1VIdUtrSDVB?=
 =?utf-8?B?TEc5c0xGUFlBKzd6Z3JGUVdISGZ5SWY4Ny91L25oc0hPTmJxcXFxTUxCemJ1?=
 =?utf-8?B?c3ROS2VUdVJESnp4eXZRUExpZmdrby9XMU5sbmZTRC9lZkRoRVpPQVIrTjNR?=
 =?utf-8?B?ZXVlcHBYNmx3V0FPaXBDTGpkWjlqcG1YOUtXL1RxcGZCTmdHR29qeHdaemw5?=
 =?utf-8?B?SzVXRzJ5TWFSVzMwQmQzMFpWSXFQMUk2R1pQU092aUFiN2ZCaVNTVm5RU25M?=
 =?utf-8?B?NFhQaUIranBaRXhEWUY5TTNjWUlRWEdoMUNZK3JkeEg1bUx5OXlwdU9vZmxG?=
 =?utf-8?B?T1htZm41RFlsSzRUc2JBUWdNK0Rna2tvekNQY0xFMlk2RUVzczZ0Rmxtc1FV?=
 =?utf-8?B?Tk83Q2hJTDFSeEl4L3R3eHBBL0ZIbzZZcG43NE9NOHg0VXF0MjcvQzFFV0dj?=
 =?utf-8?B?bms3QkxHLzQ1eGNrM3NuOFFuQWRjeXpSYTRIWnhjMzBhU29vRUF5WEdvL1lY?=
 =?utf-8?B?aDVIOUdreEY2UXVoUDdoeTVZVUtPdDBOWHh0ckRxOHBjeFFabGFEVWttZm1I?=
 =?utf-8?B?QXpWSmN6TStZbmFjeUlkY0ZyelhlOUhlQm1wT1UyWjh2QkpvTEljMy8rUWNB?=
 =?utf-8?B?REdTY2c3MkZYV3JwRVJYYW1WODNjR3ZDSnFKQU52SGpyQmllM2VUUExndU1k?=
 =?utf-8?B?cTYvQVJSKzBockJEOWpINWM2NjNyQXp4aUpLbDNKeE1TZm1FSFlrM0xzNXN3?=
 =?utf-8?B?eVVKVFE4bzVTTkN5OTkxb1duWDFHOXYyWC84TnBEeXk1T29va29uOWtUbitX?=
 =?utf-8?B?RE5yaldnMEwxNVJlTG9pNHBzZ0xKWGkrMFN0aHZ4azdoNTVteVJSL0s5YVNX?=
 =?utf-8?B?ak50SVBwdEVETVpObnRkSUJMOWM1b0VaOXFjb2VGKzRQK3hPS2NlWkJPMG5z?=
 =?utf-8?B?eU94L2Y3OUI4U2x5c3NvOXNjYUprcFZBWmdseU11UFJFMkdEbGdneW1UR2dI?=
 =?utf-8?B?WHdjV1dvZWhkbEtnU2ZZUlBIU3dXaDZ4cVZRMlEzZzN5dzI2NTJQT2lqYlpE?=
 =?utf-8?B?Ym9HTGV3UU0zZWIybjBwUTZoR3JpM1c2L3NVcHZLbEhSdWVabTh4aWVyUy93?=
 =?utf-8?B?L3Awa01JVWpobmlja3BSd2loSlZpR3N5N1JqaXNrVWViT0tWWTB5SDB0Ukph?=
 =?utf-8?B?emZIcm5Kelp6RFdjdzJpeFh0Z1JSMmFnK3dZd3dmQ1hEQjJKRG1ObUxtS1c1?=
 =?utf-8?B?VzIvbGFEZFZaQ0Z1QnJWMmpFRktUaFlFbzNna01hb3hpV1VNMEUrTFBiV3E5?=
 =?utf-8?B?YzlsaVZ0YThCYnA1dXo2VUhpd0Z6dEliZW8wRmNxU0hiazFVZ0hnazNtbG1k?=
 =?utf-8?B?M2pGNmpjd1k5WDRXWHd5MzZ0bEQraFFtM3hIanRtSVVQSzFqQWlCVjFES0FI?=
 =?utf-8?B?ekFpWnhKYTlWYVNHNC9ZSklkYXBmMU9sUDJMUUtEcVFZS0lMMFdoQ044cElI?=
 =?utf-8?B?MXRjcUNtTkljS0tuNDZUa09QUTZxY0E4bGhXY1JuQXRDYm95c0xVeUJNRzF2?=
 =?utf-8?B?cS9jb29zY3FxVjRSUjNPMUhVWVFsQWN1d1gzajAxaFlMZ2p2bVNZR2pVbWVz?=
 =?utf-8?B?ZFVpUU55Z0NhZlMrcEdncll0QkpJZjJBZVprbkcwRlBUcHk5M2F0aWZjTjhL?=
 =?utf-8?B?QTBlaS9rMmIyQmgxMDhxTmprZzZmVTRGOFpTSmZ3VDBTZk5BZnpmRmZXV2p3?=
 =?utf-8?B?SzNMSnp3RncveFZQT2M5cDF4b0Z6VU5SakQwdmlTR2JiRWkxT0tVM09pLzVr?=
 =?utf-8?B?UGptUlJXVkJzOC82bms5WDdHcVlFdmtUaG5MTHJyMHdmcS9panJSbExxcE5U?=
 =?utf-8?B?U0RFallEcHlGVXN4SWtUTkRmT3ovYkYycGdNSGNGd05FVHN2MVprVUQreXZB?=
 =?utf-8?B?VWdLTGd0cHhvR1Bja0dVWFdZVDRZQ1FtNW9hRjRIbTNxR2dzRTFLeWs1TzNm?=
 =?utf-8?B?R2VnQUNWMHVmWXBSeUR5NEhLN0lvS1g1WVVZWjRYSlhPSjNsMHBMajdGUDJy?=
 =?utf-8?B?MXFoQ0t3NUlHbWg2SWtleXJVclM4NG1pWUhzMmhoLzYzTC8vSjA5bTBSWWZm?=
 =?utf-8?B?TjFOZWdOZFN4TnFENTJ3K3ZteEhXY3FGVlhReFZodUV2MGwydlk2Y24vbDlP?=
 =?utf-8?B?MU9iekFzZU5CN21rTVhrVEpOSGMrYUQ0K2I1QmRvUFd3MjNVT0VRU0pod3pQ?=
 =?utf-8?Q?7aEQ1lJfqXL6MiLo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: CHR2V8RcqYJ9gejx/nL7wm635tyFjD2r2r4mdQ47bNFwD7B48NS3POYB+e1kiTFjdOjqDV5GAmQc/Rd4jw/0nGTWo6BoPprnD+sAa3mEdeNCHyvIQos3FRczHlT5zqLGpD6Xyj5nkFcDK2JY7hpWxT+bFJV2TUL3jDb9pZ2PE8mX7NU1ai09Tn8m4VUpBDnarDpGMJyhlAou7bflXez1sQCvICuvuto0MMTVwcEYiBwGIwomd6Rhw/4xqCiAmkFU9tGHmlOb/I6FxNJ9U1ju+EKYvaxuXcOJbqpA5JtJdBd60al3EsTqHcJXzzJ0c+Q+ZjoEJIK21J5Etx/K+fPMjw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PR11MB131308.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1881b4fd-fb15-482c-2f2c-08df4702df4f
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2026 12:36:17.1859 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XLBEDfr+pPhpqPPDJ9K8He5OZahDmOtKuMm+zgTYunnTwVoTgTUvx2PODuGcTMXEippMq8wSXZGzjc/QhD0yy70/Tyte9R2fwYndzPlbfgSI663QShRcLPP7gLwzo3Xh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR11MB297563
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
aWxlPw0KDQpJIG1pc3NlZCB0aGlzIGNvbW1lbnQsIGFwb2xvZ2llcyANCg0KQWdyZWVkIHdpdGgg
U2F0eWEncyBjb21tZW50LiBCdXQgdGhlbiBob3cgZG8gd2UgcHJvbXB0IGZ1dHVyZSB1c2VycyBu
b3QgdG8NCnVzZSB0aGUgbGVnYWN5IHNlbWFwaG9yZSBvbiBwbGF0Zm9ybXMgdGhhdCBzdXBwb3J0
IHNlbTY0Pw0KDQpTdHVhcnQvRGFuaWVsZSwgYW55IHN1Z2dlc3Rpb25zIGhlcmU/DQoNCi1UaWxh
aw0KDQo+ID4gICAjZGVmaW5lIE1JX1NFTUFQSE9SRV9XQUlUCQkoX19NSV9JTlNUUigweDFjKSB8
DQo+IFhFX0lOU1RSX05VTV9EVyg1KSkNCj4gPiAgICNkZWZpbmUgICBNSV9TRU1XX0dHVFQJCQlS
RUdfQklUKDIyKQ0KPiA+ICAgI2RlZmluZSAgIE1JX1NFTVdfUkVHSVNURVJfUE9MTAkJUkVHX0JJ
VCgxNikNCj4gPiBAQCAtNDgsNiArNDksMTEgQEANCj4gPiAgICNkZWZpbmUgICBNSV9TRU1XX0NP
TVBBUkUoT1ApDQo+IAlSRUdfRklFTERfUFJFUChNSV9TRU1XX0NPTVBBUkVfT1BfTUFTSywNCj4g
Q09NUEFSRV9PUF8jI09QKQ0KPiA+ICAgI2RlZmluZSAgIE1JX1NFTVdfVE9LRU4odG9rZW4pDQo+
IAlSRUdfRklFTERfUFJFUChSRUdfR0VOTUFTSyg5LCAyKSwgKHRva2VuKSkNCj4gPg0KPiA+ICsj
ZGVmaW5lIE1JX1NFTUFQSE9SRV9XQUlUXzY0CQkoX19NSV9JTlNUUigweDNiKSB8DQo+IFhFX0lO
U1RSX05VTV9EVyg3KSkNCj4gPiArI2RlZmluZSAgIE1JX1NFTVc2NF9JTlRFUlJVUFQJCVJFR19C
SVQoMjApIC8qIHJhaXNlcyB0aGUNCj4gc2VtYXBob3JlLWZhaWwgaW50ZXJydXB0ICovDQo+ID4g
KyNkZWZpbmUgICBNSV9TRU1XNjRfMzJCX0NPTVBBUkUJCVJFR19CSVQoMTkpIC8qIDA6IDY0Yg0K
PiBjb21wYXJlIChkZWZhdWx0KSwgMTogMzJiIGNvbXBhcmUgKi8NCj4gDQo+IENoZWNrIGFsaWdu
bWVudCBoZXJlLg0KPiANCj4gLVNhdHlhLg0KQWRkcmVzc2VkDQo+IA0KPiA+ICsjZGVmaW5lICAg
TUlfU0VNVzY0X0lOSElCSVRfQ1RYX1NXSVRDSAlSRUdfQklUKDE1KSAvKiBwb2xsIGluDQo+IHBs
YWNlLCBkb24ndCBzd2l0Y2ggb3V0IG9uIGZhaWwgKi8NCj4gPiArDQo+ID4gICAjZGVmaW5lIE1J
X1NUT1JFX0RBVEFfSU1NCQlfX01JX0lOU1RSKDB4MjApDQo+ID4gICAjZGVmaW5lICAgTUlfU0RJ
X0dHVFQJCQlSRUdfQklUKDIyKQ0KPiA+ICAgI2RlZmluZSAgIE1JX1NESV9MRU5fRFcJCQlHRU5N
QVNLKDksIDApDQo=
