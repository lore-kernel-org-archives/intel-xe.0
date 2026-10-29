Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA94F606A31D
	for <intel-xe@archiver.kernel.org>; Thu, 29 Oct 2026 08:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=aHPmXykT
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACAA4112077;
	Thu, 29 Oct 2026 08:08:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E52A4112077;
 Thu, 29 Oct 2026 08:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793261313; x=1824797313;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=6CfLUm/IHp1QYC/w04/nItHXj7zMrUKJXuSbf9wqfHk=;
 b=aHPmXykTaGieHutNsQuEOWM7fvOINhaIDYMQFW7c+7hzbat/L7jHEHrN
 2l12SeRiGgXnu9xrjcXS4pVR65uIo5XjY5lR375I+TnJ0VfCeRhi0dkug
 baTBoXGgA6zJ/ASuKmK+YsuJHXlppHYLCkY7qsRA9z41FKbvLw2A25y07
 H1MNxmhGJwGZAo5E3zyO9rQYIuLV4TsGP2Wq8fN53rFndM3xnaLZHTIqi
 5cLo2ClZ0gyTyRucLuPa6njmKRX9sPTldyYbezNb4Hvmv4AF88JPGJA0H
 tK3ZX4cRvW4Rocm6p3bj8TObA7QTVN0EXA9xC0VOJaZflFZFRqJ6zp0Nu Q==;
X-CSE-ConnectionGUID: hijcivOsSeyNEyDSaFfKGg==
X-CSE-MsgGUID: EW26udkQRnGgLQQ8/65BDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1990712"
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="1990712"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2026 01:08:33 -0700
X-CSE-ConnectionGUID: 8R0okulTSbigkUP2HxZDxg==
X-CSE-MsgGUID: QIM+9RNwQWu5peVyyTsnTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="5402960"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2026 01:08:32 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 29 Oct 2026 01:08:31 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 29 Oct 2026 01:08:31 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.6) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 29 Oct 2026 01:08:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u9AV+1RwZza6W2+W824sRdA6NDV48DNCIb/OFYqWfFo9bPz1KCqMlTVAj6OYKj4EYLERblbZxY6lRFgP3Mb+lN8Mk6HxjXiTckDPAzwsRei0nYDun61pitNRcuLKMD61G8wh9/HsfTEGuiaGjjLpl6nuDSQhuhdpl+4Z6pxQKaWjK6nn97qyZpefUTXMiuCyZUw/hX0dBQvJ605gWsWA2IIl6EYgmIJ369TOrG02tCLucg53MMUhCfAb9rwzxA8TZjuMTppmf5Xd5qz4+yqUuU9Kx4Gmfj/oyZ7wgv7QQGeYh9xsqYUh/iDpSA8y4bRfQXDRrLMG5Tdj/vV98k4ZXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6CfLUm/IHp1QYC/w04/nItHXj7zMrUKJXuSbf9wqfHk=;
 b=G6Q/XXvvRrCgw5T+PIX56t/CXxdkaWS+sMQqmGMTFIXQOaFJ/jPkEz/nVHOBIT5VR6vnhDg2jwhyhQWCPYIluY0QmvJ8TCj7fAwpQRDDmOljWMGuPREucwi3+huc4LYOBvpQCelRcUwVnzAcrGDE1WxDACMo+1pUWOsNhTH0p3BPgixzBI/S5emUSNDiaArgOzpooEQ3wuJ01odi3PZMaZgtJflBW6e/I7DKL42VcqfOEg7YhGMlaldd6BSMRBWAsPpx1eR1V/4zL9RWfDLyahY1QWgMqEhdDD2anj61OIxEmuRREyH+BjbbSwHqq1iilCS2vnEToX46+IH5569t0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::5b) by PH8PR11MB6657.namprd11.prod.outlook.com
 (2603:10b6:510:1c0::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Thu, 29 Oct
 2026 08:08:24 +0000
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::19f5:13eb:df52:68ff]) by DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::19f5:13eb:df52:68ff%8]) with mapi id 15.21.0546.021; Thu, 29 Oct 2026
 08:08:23 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Murthy, Arun R" <arun.r.murthy@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: Jani Nikula <jani.nikula@linux.intel.com>, "Borah, Chaitanya Kumar"
 <chaitanya.kumar.borah@intel.com>, "Shankar, Uma" <uma.shankar@intel.com>
Subject: RE: [PATCH v3 1/7] drm/i915/dp: Factor out the DSC slice count and
 link bpp lookup
Thread-Topic: [PATCH v3 1/7] drm/i915/dp: Factor out the DSC slice count and
 link bpp lookup
Thread-Index: AQHdZ3rrunid2oIt/U2BgIuxC/GmJbcUKkIw
Date: Thu, 29 Oct 2026 08:08:23 +0000
Message-ID: <DS4PPFE901A304FC559B8E517EB5B09241FE36E2@DS4PPFE901A304F.namprd11.prod.outlook.com>
References: <20261029-vlk-64036-dp-symbol-tg-v3-0-69022424ef17@intel.com>
 <20261029-vlk-64036-dp-symbol-tg-v3-1-69022424ef17@intel.com>
In-Reply-To: <20261029-vlk-64036-dp-symbol-tg-v3-1-69022424ef17@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPFE901A304F:EE_|PH8PR11MB6657:EE_
x-ms-office365-filtering-correlation-id: a7698cfb-395d-4398-796f-08df3593cd5c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|261028144727099003|38070700021|4143699003|56012099006|11063799006|261009223027099003|261009221227099003|261026140227099003|261022105027099003|261021121427099003|10067099003|261021123027099003|22082099003|18002099003|3023799007;
x-microsoft-antispam-message-info: g9SzH7b2SeRQr1OniepPxgOj8+GWT4hciq2Ty38EUvzdM2et5jzxcVs7kqCux/rIGqH/ZbMMXmLLRScodLVhSU6F2LXIAFLeBhlHbrItOw1GFnA/LAPvjPlAs4VIlIxxXGonZa0olVXvefz7x7R3ytCzw6yOuFJM3bilQN0wgOyXqXXJZdgRHLbTAdC/0zfrIgPWoH5wdsPV8NZWOyVN7s5Srph78wdphlzBIXrV5wUeWMc1yaPJ04GgMbbG2doCe4o8lZrA/7yUaJBHuMn9J2hZarT31lBuJmeNttuZKeZiI3j76bOG12sBmkHj/rLJbfpcewwh39aocjz6rDnv/3K2y+zJzSe1E0jxfS4KWDqmS5qXs0ZoL4uk11KiTuTUkyApQkJdcCWiic18LI0gaoG4zg6bM+/GKy+/TAa8OHUMe5Ds7e13d17vP7PxlCJD6D8baILoy55P7pIeNsQMKFS3/0FCPQwXW/6XUDWZT2OM0tASvkPzVsdQ6NfHZxcwb8ecbY3cNqPkhV9SaPv82lqg+Bv4hAIH7SGS55qTNi/cU1MAYKV94aj8DrJ46p++JygV4g2tlHLQXVgl02k9ZocSUe09dmzS8o4HiGFEh1s2Wrlo9rOFyGHBv6zruO6AIOnNLVzDed4SE2jg1nePctKNsJc+oLKIyvUxbEjsFo3Io/jJVO55zGhrJBuGPKt9mbjKDMFQWm5b7mhryeMHeo0X7Js0t7ZmFVRAinYTbHA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPFE901A304F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(261028144727099003)(38070700021)(4143699003)(56012099006)(11063799006)(261009223027099003)(261009221227099003)(261026140227099003)(261022105027099003)(261021121427099003)(10067099003)(261021123027099003)(22082099003)(18002099003)(3023799007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MnpTRG9ma1piYm5UQjQ4Z3pHdW9BV1p6eXZILzRCRzE5bVExazh0c3lHZE5X?=
 =?utf-8?B?ZFpJdXVuczVnZXdqcm9hcjZldWF5MGZ5cTR2enZYZDU1U0pnRGZoQ1hiZWkz?=
 =?utf-8?B?WFdhMTZPd1k1Z3ZSS20yaHUwZHM0NGdGS3B2d01BVDJTak9mcjFyY3JEck9a?=
 =?utf-8?B?K1ZML29YMk1uWjJUYTVmUDVIWFdPSHJRa0RhT3J0YkhYbk9lbFpGaUhWVmFV?=
 =?utf-8?B?ODF0WmwrRkExOEp3dGZJTFUrWmxkeVZrcTJpczlZdEY4Z0dXTzhJa3FQbE1Z?=
 =?utf-8?B?UDRMTFVKQVpUTkNib3h2ZjQyS1R3bHVoNFJQcVBmNHN3SWhYZHowKzVPUGZC?=
 =?utf-8?B?cUJsUXpXVWkxL2ZHQWRRRDkwSzUycnhNWllBT01XaFVjRVJSb0pnWFpEcmdI?=
 =?utf-8?B?Vnk4TGkwWXNrYlpYdnhUT0JDUlNwam5XZFdVdFdpcUo1MVNDSk1jQytqZnY2?=
 =?utf-8?B?a28vc2MxZHg0MUkzYjlxYUtGNWxWdExodmJHeHpOOTNJUlVKT01JUFhRNWZp?=
 =?utf-8?B?bktLQ3ZsSi8xbkJYSjA2c1kvbVN2aW4vaHlKNDJSVUE1Y2xoaEt4dUR0UXVi?=
 =?utf-8?B?dzB0TnF4c3dUVE5xMXZFN1huZU01WEFFSHhpVmhVL3ZtaUxUaGd1WUJndkVO?=
 =?utf-8?B?TUVBY0tLWUtPaklpTTlCdDRJa3BGWkIyeUxQM1UrbFBGNHh0WlUxSERSMEI1?=
 =?utf-8?B?cGVSVEk2Z0FBU1hMY3BOZHVQTlcxNHpBbkgrVGFIczR0dEZuNld5b2JMcFIy?=
 =?utf-8?B?OW0ybmJuNDdZTXA2Z2hNd2gzanBHQUFVd0JwOXd4eEJTVjRHdjVqc2RESUF2?=
 =?utf-8?B?dXlLalFwdGZwWXBZMDRDRmZhdE1tek8xbGx2ZnZkY3VFTHNXQ2FUbWN5SzVK?=
 =?utf-8?B?QnZRVFpXdk8wR29ydjZhWTJmVXc5WWJ0Z1BsdE5xRTRqSW9JT01kVGlDbE5H?=
 =?utf-8?B?WlRBZXYyb3ZPWFg3NFR5T0dPZWhBZnliTEIwVlZ4QStlY2M2M3JTL2NBRnFN?=
 =?utf-8?B?VlZNKy8yRHljblAxQmF2MzVRbU90aGcwQkY4cWNlMEhoR0Z2ajNoVnlyaDRT?=
 =?utf-8?B?NVVjV2twZWhNUWlXN2laU2VEVktUeC9pQTNwWEorT09XWDBiZW1CQ09DSklM?=
 =?utf-8?B?aVB2LzVXZnQ3NDRJTkZDUHhLeWRPY1BGcTNkVllWajZxVnhjVXAyMk93cEVZ?=
 =?utf-8?B?QWZYekNGbjg0VGZGQ3dud2tFZUhzOTVta1hDTm9iaDlSU1haV1ROaEJ1ZWlE?=
 =?utf-8?B?NjVnc2FWUXlTV2FXMFE4UjY3ZDh3UmJ6NFVzYjMwR1FKMjFqUk5hZmJJb25G?=
 =?utf-8?B?U3ZOY0xGNGlXRUQvWmM1eGdZZ3czZndmdEFoL2IxaXJoakhYVFJqbnpKRThQ?=
 =?utf-8?B?TXZqSTdKeVJIS3lxbGZFTlRoYmhnTXY0a2syZm5wUmpaM3dRdXpPdWl0eWkz?=
 =?utf-8?B?bUh2UXI5VmE2RXFJZUVpRXVBNHNMQnNETTI0Uk8rZy9uc2JGQk44MEh5Ni9W?=
 =?utf-8?B?ZnpIQnA1bkMvc3o5STlualJjQ0lJcDNBSHI3R3RWUTNFbUdOSUlQdDc5ZjBr?=
 =?utf-8?B?eFpUNGZ1SHJVc25paU1IVU4xNTZWYmYyTTl0MEpDV3NwbHFOUnpkQVpwbjNz?=
 =?utf-8?B?R3JDRzJ3QkRkWXhmTHY3NmN2U1UvVWl5ZSt2UGk5dXB1bXhYS2YzWTFzVlNa?=
 =?utf-8?B?NlBHTkRCdDJWSC83OTBWNU1VajBWT2s5RXJjUHdnV0NjamVlRmxxeDRtRTdp?=
 =?utf-8?B?WGs5cXExSGF5QTNMdTZVTmE0MXlWd3I4WU5LQVhWcXlCZEZkYXpNaUl2Zmhj?=
 =?utf-8?B?ZVZvMmpSSDZtOTZlVEVjTElDbEVZc1RRQXdQVGJKdCtFUVROS01FZEpkR0wy?=
 =?utf-8?B?UDlycW95emNOdndzMXhUdTNGRFhEaWdYY3ZCQlBZQmFkdWUra1FiL05iMVF2?=
 =?utf-8?B?czR4SXViRlh6aVVJeTNYWUZwb0ZiSFdmeGZpOXhBQm5uN2NSZjR4N2VKSG1R?=
 =?utf-8?B?bnhUKzJzMElwMGU3T1FTdzNsZkVndi9VMXlXenU3bGpMU2VtYTJ2dmdxdDFI?=
 =?utf-8?B?UHMvcDh1OWdER0tFUmdvdnBwT01ycjdRMEFFR2JwbHNydWFjU01lYXJxYUxM?=
 =?utf-8?B?cVlWbklGajRCNlp4Y29DZmNNMGRHbnBJN1RSRVlUazR2eTlTT3JGcHBKUjNm?=
 =?utf-8?B?T1ZNMXAyNEFnSDVObm4rN2J2YXRaeDF4L3hzZytSK2F5SEx5T1ZScVFxeUFy?=
 =?utf-8?B?b2FSSjAwQlF1TGJmT0pmdnBYdmhMMk12UWlWSytrWWU1U3RUUTlScURET3Zm?=
 =?utf-8?B?V3AvL2wveXNxYkZYL2FVMFQxc2lCaVFIalJHcXRiR2Uva21JSEUvZz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: eL7QGubRBK+OZ043QJTAkVHEVW9mQOPZe2GySfL8iit1oQnFWZRXu2h3L5ZFV2zqFsqJ3XbEpAoAIeP2Y697fODykMKiu9SFkoWzGwMWvli9o02FN9HFxtlB3OcrykpRgd5gjtO3TDKRFgDXCqQMvt3vh3QVNeytgQyqEfmV2n5CWMagvUC5N3Y29R5js7SEjhPxQnjbGqOYme5PUz0/FYGQpMH4+RjaHI0HIXECMyR6SrxYDSvDpcmB5Ce/yLOs5O6/LR3bmUwUbef9WgAWqcK07L7EpWo5bUi+iKjz4h6jkTguhMJY3IFkHi0WfCMTrbwkxmYyQc+6yV8TEjQgOw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFE901A304F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7698cfb-395d-4398-796f-08df3593cd5c
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2026 08:08:23.1207 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 22aQ98mjgTnrH1p81sRVMj/nLNnMnTNORyxNUGwnYhotAtzz64BNzGSXiDjOiCnda/r9HsxcnZf4LBjmvm+IHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6657
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
	SPF_PASS autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTXVydGh5LCBBcnVuIFIg
PGFydW4uci5tdXJ0aHlAaW50ZWwuY29tPg0KPiBTZW50OiAyOSBPY3RvYmVyIDIwMjYgMTM6MjAN
Cj4gVG86IGludGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGludGVsLXhlQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZw0KPiBDYzogSmFuaSBOaWt1bGEgPGphbmkubmlrdWxhQGxpbnV4LmludGVs
LmNvbT47IEJvcmFoLCBDaGFpdGFueWEgS3VtYXINCj4gPGNoYWl0YW55YS5rdW1hci5ib3JhaEBp
bnRlbC5jb20+OyBTaGFua2FyLCBVbWENCj4gPHVtYS5zaGFua2FyQGludGVsLmNvbT47IEthbmRw
YWwsIFN1cmFqIDxzdXJhai5rYW5kcGFsQGludGVsLmNvbT47DQo+IE11cnRoeSwgQXJ1biBSIDxh
cnVuLnIubXVydGh5QGludGVsLmNvbT4NCj4gU3ViamVjdDogW1BBVENIIHYzIDEvN10gZHJtL2k5
MTUvZHA6IEZhY3RvciBvdXQgdGhlIERTQyBzbGljZSBjb3VudCBhbmQgbGluaw0KPiBicHAgbG9v
a3VwDQo+IA0KPiBNb3ZlIHRoZSBEU0Mgc2xpY2UgY291bnQgYW5kIGxpbmsgYnBwIGRldGVybWlu
YXRpb24gb3V0IG9mDQo+IGludGVsX2RwX2NvbXB1dGVfbWluX2hibGFuaygpIGludG8gYSBoZWxw
ZXIsIHNvIHRoYXQgaXQgY2FuIGJlIHNoYXJlZCB3aXRoDQo+IHRoZSB1cGNvbWluZyBEUCBzeW1i
b2wgYmFzZWQgdGltaW5nIGdlbmVyYXRvciBjb21wdXRhdGlvbi4NCj4gTm8gZnVuY3Rpb25hbCBj
aGFuZ2UuDQo+IA0KPiB2MzogY2hhbmdlIGludGVsX2RwX2dldF9zY2xpY2VfYW5kX2xpbmtfYnBw
IC0+IGludGVsX2RwX2NvbXB1dGVfIChTdXJhaikNCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEFydW4g
UiBNdXJ0aHkgPGFydW4uci5tdXJ0aHlAaW50ZWwuY29tPg0KDQpMR1RNLA0KUmV2aWV3ZWQtYnk6
IFN1cmFqIEthbmRwYWwgPHN1cmFqLmthbmRwYWxAaW50ZWwuY29tPg0KDQo+IC0tLQ0KPiAgZHJp
dmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kcC5jIHwgNTEgKysrKysrKysrKysrKysr
KysrKysrKy0tLS0tLQ0KPiAtLS0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDM0IGluc2VydGlvbnMo
KyksIDE3IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9p
OTE1L2Rpc3BsYXkvaW50ZWxfZHAuYw0KPiBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkv
aW50ZWxfZHAuYw0KPiBpbmRleA0KPiBiZjVlODdhNzIxMDhlYWYyNzRmMjRiYzk5N2YyZThlMmNj
ODMyMGEwLi5kYjdjOGZjYzg2ODNhYWUxYTJiYzcwNTBlZg0KPiA3Yzg3ZWQ1MTU1YzhkYyAxMDA2
NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kcC5jDQo+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHAuYw0KPiBAQCAtMzYyOCw2
ICszNjI4LDM1IEBAIGludGVsX2RwX3F1ZXVlX21vZGVzZXRfcmV0cnlfZm9yX2xpbmsoc3RydWN0
DQo+IGludGVsX2F0b21pY19zdGF0ZSAqc3RhdGUsDQo+ICAJfQ0KPiAgfQ0KPiANCj4gK3N0YXRp
YyBpbnQgaW50ZWxfZHBfY29tcHV0ZV9kc2Nfc2xpY2VzX2FuZF9saW5rX2JwcChjb25zdCBzdHJ1
Y3QNCj4gaW50ZWxfY3J0Y19zdGF0ZSAqY3J0Y19zdGF0ZSwNCj4gKwkJCQkJCSAgICBzdHJ1Y3Qg
aW50ZWxfY29ubmVjdG9yDQo+ICpjb25uZWN0b3IsDQo+ICsJCQkJCQkgICAgaW50ICpkc2Nfc2xp
Y2VzLCBpbnQNCj4gKmxpbmtfYnBwX3gxNikgew0KPiArCXN0cnVjdCBpbnRlbF9kaXNwbGF5ICpk
aXNwbGF5ID0gdG9faW50ZWxfZGlzcGxheShjcnRjX3N0YXRlKTsNCj4gKwljb25zdCBzdHJ1Y3Qg
ZHJtX2Rpc3BsYXlfbW9kZSAqYWRqdXN0ZWRfbW9kZSA9DQo+ICsJCQkJCSZjcnRjX3N0YXRlLT5o
dy5hZGp1c3RlZF9tb2RlOw0KPiArDQo+ICsJKmRzY19zbGljZXMgPSAwOw0KPiArDQo+ICsJaWYg
KGNydGNfc3RhdGUtPmRzYy5jb21wcmVzc2lvbl9lbmFibGUpIHsNCj4gKwkJKmRzY19zbGljZXMg
PSBpbnRlbF9kcF9kc2NfZ2V0X3NsaWNlX2NvdW50KGNvbm5lY3RvciwNCj4gKwkJCQkJCQkgICBh
ZGp1c3RlZF9tb2RlLQ0KPiA+Y3J0Y19jbG9jaywNCj4gKwkJCQkJCQkgICBhZGp1c3RlZF9tb2Rl
LQ0KPiA+Y3J0Y19oZGlzcGxheSwNCj4gKw0KPiBpbnRlbF9jcnRjX251bV9qb2luZWRfcGlwZXMo
Y3J0Y19zdGF0ZSkpOw0KPiArCQlpZiAoISpkc2Nfc2xpY2VzKSB7DQo+ICsJCQlkcm1fZGJnKGRp
c3BsYXktPmRybSwgImZhaWxlZCB0byBjYWxjdWxhdGUgZHNjIHNsaWNlDQo+IGNvdW50XG4iKTsN
Cj4gKwkJCXJldHVybiAtRUlOVkFMOw0KPiArCQl9DQo+ICsNCj4gKwkJKmxpbmtfYnBwX3gxNiA9
IGNydGNfc3RhdGUtPmRzYy5jb21wcmVzc2VkX2JwcF94MTY7DQo+ICsJfSBlbHNlIHsNCj4gKwkJ
KmxpbmtfYnBwX3gxNiA9DQo+IGludGVsX2RwX291dHB1dF9mb3JtYXRfbGlua19icHBfeDE2KGNy
dGNfc3RhdGUtPm91dHB1dF9mb3JtYXQsDQo+ICsJCQkJCQkJCSAgICBjcnRjX3N0YXRlLQ0KPiA+
cGlwZV9icHApOw0KPiArCX0NCj4gKw0KPiArCXJldHVybiAwOw0KPiArfQ0KPiArDQo+ICBpbnQg
aW50ZWxfZHBfY29tcHV0ZV9taW5faGJsYW5rKHN0cnVjdCBpbnRlbF9jcnRjX3N0YXRlICpjcnRj
X3N0YXRlLA0KPiAgCQkJCWNvbnN0IHN0cnVjdCBkcm1fY29ubmVjdG9yX3N0YXRlDQo+ICpjb25u
X3N0YXRlKSAgeyBAQCAtMzY0MiwxMiArMzY3MSwxMiBAQCBpbnQNCj4gaW50ZWxfZHBfY29tcHV0
ZV9taW5faGJsYW5rKHN0cnVjdCBpbnRlbF9jcnRjX3N0YXRlICpjcnRjX3N0YXRlLA0KPiAgCSAq
Lw0KPiAgCWludCBtaW5fc3ltX2N5Y2xlcyA9IGludGVsX2RwX2lzX3VoYnIoY3J0Y19zdGF0ZSkg
PyAzIDogNTsNCj4gIAlib29sIGlzX21zdCA9IGludGVsX2NydGNfaGFzX3R5cGUoY3J0Y19zdGF0
ZSwNCj4gSU5URUxfT1VUUFVUX0RQX01TVCk7DQo+IC0JaW50IG51bV9qb2luZWRfcGlwZXMgPSBp
bnRlbF9jcnRjX251bV9qb2luZWRfcGlwZXMoY3J0Y19zdGF0ZSk7DQo+ICAJaW50IG1pbl9oYmxh
bms7DQo+ICAJaW50IG1heF9sYW5lX2NvdW50ID0gNDsNCj4gIAlpbnQgaGFjdGl2ZV9zeW1fY3lj
bGVzLCBodG90YWxfc3ltX2N5Y2xlczsNCj4gIAlpbnQgZHNjX3NsaWNlcyA9IDA7DQo+ICAJaW50
IGxpbmtfYnBwX3gxNjsNCj4gKwlpbnQgcmV0Ow0KPiANCj4gIAlpZiAoRElTUExBWV9WRVIoZGlz
cGxheSkgPCAzMCkNCj4gIAkJcmV0dXJuIDA7DQo+IEBAIC0zNjU2LDIyICszNjg1LDEwIEBAIGlu
dCBpbnRlbF9kcF9jb21wdXRlX21pbl9oYmxhbmsoc3RydWN0DQo+IGludGVsX2NydGNfc3RhdGUg
KmNydGNfc3RhdGUsDQo+ICAJaWYgKCFpc19tc3QgJiYgIWludGVsX2RwX2lzX3VoYnIoY3J0Y19z
dGF0ZSkpDQo+ICAJCXJldHVybiAwOw0KPiANCj4gLQlpZiAoY3J0Y19zdGF0ZS0+ZHNjLmNvbXBy
ZXNzaW9uX2VuYWJsZSkgew0KPiAtCQlkc2Nfc2xpY2VzID0gaW50ZWxfZHBfZHNjX2dldF9zbGlj
ZV9jb3VudChjb25uZWN0b3IsDQo+IC0JCQkJCQkJICBhZGp1c3RlZF9tb2RlLQ0KPiA+Y3J0Y19j
bG9jaywNCj4gLQkJCQkJCQkgIGFkanVzdGVkX21vZGUtDQo+ID5jcnRjX2hkaXNwbGF5LA0KPiAt
CQkJCQkJCSAgbnVtX2pvaW5lZF9waXBlcyk7DQo+IC0JCWlmICghZHNjX3NsaWNlcykgew0KPiAt
CQkJZHJtX2RiZyhkaXNwbGF5LT5kcm0sICJmYWlsZWQgdG8gY2FsY3VsYXRlIGRzYyBzbGljZQ0K
PiBjb3VudFxuIik7DQo+IC0JCQlyZXR1cm4gLUVJTlZBTDsNCj4gLQkJfQ0KPiAtCX0NCj4gLQ0K
PiAtCWlmIChjcnRjX3N0YXRlLT5kc2MuY29tcHJlc3Npb25fZW5hYmxlKQ0KPiAtCQlsaW5rX2Jw
cF94MTYgPSBjcnRjX3N0YXRlLT5kc2MuY29tcHJlc3NlZF9icHBfeDE2Ow0KPiAtCWVsc2UNCj4g
LQkJbGlua19icHBfeDE2ID0NCj4gaW50ZWxfZHBfb3V0cHV0X2Zvcm1hdF9saW5rX2JwcF94MTYo
Y3J0Y19zdGF0ZS0+b3V0cHV0X2Zvcm1hdCwNCj4gLQkJCQkJCQkJICAgY3J0Y19zdGF0ZS0NCj4g
PnBpcGVfYnBwKTsNCj4gKwlyZXQgPSBpbnRlbF9kcF9jb21wdXRlX2RzY19zbGljZXNfYW5kX2xp
bmtfYnBwKGNydGNfc3RhdGUsDQo+IGNvbm5lY3RvciwNCj4gKwkJCQkJCSAgICAgICAmZHNjX3Ns
aWNlcywNCj4gJmxpbmtfYnBwX3gxNik7DQo+ICsJaWYgKHJldCkNCj4gKwkJcmV0dXJuIHJldDsN
Cj4gDQo+ICAJLyogQ2FsY3VsYXRlIG1pbiBIYmxhbmsgTGluayBMYXllciBTeW1ib2wgQ3ljbGUg
Q291bnQgZm9yIDhiLzEwYg0KPiBNU1QgJiAxMjhiLzEzMmIgKi8NCj4gIAloYWN0aXZlX3N5bV9j
eWNsZXMgPSBkcm1fZHBfbGlua19zeW1ib2xfY3ljbGVzKG1heF9sYW5lX2NvdW50LA0KPiANCj4g
LS0NCj4gMi4yNS4xDQoNCg==
