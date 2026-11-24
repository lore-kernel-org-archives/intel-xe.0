Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 164A5606A321
	for <intel-xe@archiver.kernel.org>; Tue, 24 Nov 2026 11:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AdbOAtNP;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=il/+DUaO
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF8BF10F4EE;
	Tue, 24 Nov 2026 11:21:05 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E0A710F50C;
 Tue, 24 Nov 2026 11:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795519255; x=1827055255;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=1attYrfrwKi2f+9KvRNREVi1vdx/dIQgIewh7an1PC8=;
 b=AdbOAtNP0Gh2msuUhhl3EnViqlEttgQWPM+/BUq/Ai0W1DOM/uABuOLR
 61UBNEA03Dz4YK8a0tGZGZE7zLBL1jBSVgqPBM7772lHwCsuXEmtA9+vq
 M6wacuujyU4f6AYo2AM9zDvfyDxCpgfD/oyQmvJ0z+c+ELKYByACyelaM
 HQXSwTHPklc89SWlOLGQQhRwcWrz2q8u/GkeKWMeMP6ZMesksPNH03Jao
 IIU8YcNyZl0AGlG9cRgleKUZOQ8wfNdbG/7kn19UnEmPmIJVkZBL9onIt
 6bqHA7GI/y+DJoRZUGntsKjReWytdKAq7h/GvdpTriLtdmNDA7Fzh5fXi A==;
X-CSE-ConnectionGUID: qR4rAPRfQbiOeOiGoeW7dg==
X-CSE-MsgGUID: 1CXnwOv/QOO/myoFVyl+yg==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4238536"
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; 
   d="scan'208";a="4238536"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 03:20:55 -0800
X-CSE-ConnectionGUID: vFXt99WWSqu4bIcIxCiYiQ==
X-CSE-MsgGUID: erU7O5zXT5OjwmshHexKgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; d="scan'208";a="12134086"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 03:20:55 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Tue, 24 Nov 2026 03:20:53 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Tue, 24 Nov 2026 03:20:53 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.19) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Tue, 24 Nov 2026 03:20:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hCrG52hwOAm1d1RbDRECfklUqsTfBtTzqKqYKvZYUpsdN6wwMauVsmpJK/wILjeLy+8k81Qcujl0cmZ9k8p38yNEWMPS1vPkB7zaN4PYHZ7Nl0MrSHFgqSF2dhUxMcN5dA8Y1BR4duighxmatbreRavnREl/J6Cw06MIwZVNzd1+RoL9Rrg2KRlI+PcUpCENhd89w75QJzFNjG51/gAvwk2BK6KrC9Q5u/OYrJ1iN92eJTCCck9nKCnb40yZbC47efzdy3j5Kc2tOVKz858v+UAfWZAqTkQm/YqM6kbNlfPyr5BbbvOD0xo4MLTP5maLY01oNH4vydoN3GpGormxAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1attYrfrwKi2f+9KvRNREVi1vdx/dIQgIewh7an1PC8=;
 b=AeTqKpbi3PFKwqM0jYdxh/x75zcYeEAzi9DMXFpTkEN9hUWqAygGr65sGsKgaCKOzP1Wqks56jqlJ39f7CrZuS82yvkPCroKCTk9AqWq1mT4/pZCaf2W49ZNBX7CnaZxibZAnUQLXi1nq4YWDnDM2v7AX8QvJuF0pHfPyYQav6Yt/AKMMBn2eSrZQ59x6unHgpEOC2UifCcz0OiE6xojIEPc8HRjW5fjQnTU82pYv3oEefWCdmk8e0k56YRkjNgkO1kFsu/T+FaJeHhqJYhrGlOqesvQH0xpwhJ62+1sr3wGmFeCV7bKm6CYBN0z/N3Eb9L43ydugWLpVoHhhHHong==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1attYrfrwKi2f+9KvRNREVi1vdx/dIQgIewh7an1PC8=;
 b=il/+DUaOrHcB58zUPAd4+UU1cuxi2M04L4II5d2GnBMN7CBdZ85b+NqKRsjY+nWTyCIfR1kQy5aShcinUglH26hJhRnawQE7YCmtvNFrNFmv8peagUDayJ9gw6R/CNCE7G3vYxULBAwXlpRteMc0gFldbcudVJwLw2/JAIRyJSg=
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 SA2PR11MB5004.namprd11.prod.outlook.com (2603:10b6:806:112::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Tue, 24 Nov
 2026 11:20:50 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::9086:5e0b:ad24:762]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::9086:5e0b:ad24:762%6]) with mapi id 15.21.0639.012; Tue, 24 Nov 2026
 11:20:50 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 "j@metarealtyinc.ca" <j@metarealtyinc.ca>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Shankar, Uma" <uma.shankar@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, "Manna, Animesh" <animesh.manna@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>, "Nautiyal, Ankit
 K" <ankit.k.nautiyal@intel.com>
Subject: Re: [PATCH v2 0/4] drm/i915/psr: Send the AS SDP in PR Active while
 frames are updating
Thread-Topic: [PATCH v2 0/4] drm/i915/psr: Send the AS SDP in PR Active while
 frames are updating
Thread-Index: AQHdebN+cu76hNK6E0OG3j5XNSbUm7c9GE2A
Date: Tue, 24 Nov 2026 11:20:49 +0000
Message-ID: <3077ed0636a6c98e919934d2c860461f98222537.camel@intel.com>
References: <awCCGeCxHToY8tsI@intel.com>
 <cover.1795263689.git.j@metarealtyinc.ca>
In-Reply-To: <cover.1795263689.git.j@metarealtyinc.ca>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|SA2PR11MB5004:EE_
x-ms-office365-filtering-correlation-id: 0ce3ee17-3130-4451-8c86-08df4a1cfea8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|4143699003|38070700021|261022105027099003|261026140227099003|11063799006|56012099006|261021121427099003|10067099003|261102123227099003|261009223027099003|261021123027099003|261026121527099003|261028144727099003|6133799003|18002099003|22082099003;
x-microsoft-antispam-message-info: MNye37u0cGc8DwVg8Ct2JsZXfzUmCUSWi2fSq998fzOEtZWPF+4VJ95DW/Tq78jpHgaolRJz1q9MJNegTmA+WkO9ufKFHSKUr7xk/rhPsdRsvs3xAn/2X5UTN7w8CfTTsmkFcO02v5wl+0/i8URr4mi0ViwmxnAZuZqJj/5BKNFNR+x559w2TzbM1SCd2i+JeoU1qwYb8YZaWOefhFPHSnaIDGooD2Uj2RKvMiwDqOweFCEgQpVuLVknoIBy2aJHEQ+g+VNdOpWMG6EvNbgE2ItIaN7mInGQ4ed8UyIzmvljyLYrAqdR7sOO8OLatJnFG2mY7gekXIGjoze4DpvGSIyN1PUSAbgNTXF6znq87Ef0j6H5RTbzY5yr6PG7WGo/x+zG4ahDKJ4RrZjr6oqm2fDqby0l5D/pbWC+lF5fOX22lThyBRumzU/ulQPltmP7T/LUDo3vNxFjCpY1sHCfEQ3XC5kC8/+zYUXHVt0JBvt/23sGr2LfO5OWYH6sC2+S3e4rPg0GRutj3y5/NaeDIgALN9kjoW/fk03TzcJ6LNMhfL5Fi/tkU64hEL9CNOZUB5jgKv1YCVc7P34fZ58scJU4a/35xluIS4/pskT+Oh/EW2DsS0ao0/Qdls2AT3r+VtGip6cqKL0sFKNrqun96Xd6EUfYWGiPyKk9GEfqSHYC4kBuO5Tmpn82H91YHoPn/A+mhFm3ViRqS5ho2Bjq1Z34ikUv7+JTYwJggZDBzOM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(4143699003)(38070700021)(261022105027099003)(261026140227099003)(11063799006)(56012099006)(261021121427099003)(10067099003)(261102123227099003)(261009223027099003)(261021123027099003)(261026121527099003)(261028144727099003)(6133799003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MlB4L2JPZXovbTZJWjMyUGpHbWpHL09haVA0SHZBU0ZXYU9xeDlReXlEc3ll?=
 =?utf-8?B?NmxiRWtzRGIyU3lyc3duVytoZUxTOStxaVVVbnl1Zm0vK1puNGMyQ2JjUm9N?=
 =?utf-8?B?WUR3d0x0ODFjbVNZMVAvZHpSUElYMW90a3NBUWViYm14Yll3c2hmWlQvS3Zv?=
 =?utf-8?B?UlR3RFhvaVF4Uk4xTUZoZlNnRENTVHRpV0tjL0VRaDJlRTF4b0dHWW1Zakph?=
 =?utf-8?B?SW1YaDIrR2tLbklTN3g1TVBITGdaWmpoa0hLdXNsUU5CMlI3VFlXYmVrVHds?=
 =?utf-8?B?SzNXZTJ5WWxWTlV5YVViRjQxMlRVRlRTaXptRDQva0gzald1MUdMOHc2UGhM?=
 =?utf-8?B?OTdYRjlISUl5UlBwVFh4b1FKMzRibGQ1V0VTbkNnejgvaDhYYWo2bXgxOVZV?=
 =?utf-8?B?VzJhRXhOWXZqdUJNTzcxNWRBU0dScHAzUVZGeXFxandYSjBkdHN5bjVpV3BS?=
 =?utf-8?B?RUYwbFNBYlBmRlU3T2lZdExIaUlUd2NUZVRqTGUxb1ZNTUovRkNmallJRmxL?=
 =?utf-8?B?bEg4Y29ROWQ1Z01SdVVQMGRMU0xoZk0xcm9hSGx4Ti9RRHFXOEtYb1p0aE11?=
 =?utf-8?B?SUxYb3NJazRCRGNER2pIam9ENmsvaW5VVmFWZ05CclhONDQrL0ZURzBRRmtq?=
 =?utf-8?B?RGVmZ29ObUJ0UmRYTWJzS0JoK21vQmlWUDV6cDZhNzdSNVpiSDRyZ0s1bE9E?=
 =?utf-8?B?d1BaUG1aZVRXbW1YNERLSGR0TlB2ZmNLRFlJN2hyZUN3eUdIVThwRVJkeDFv?=
 =?utf-8?B?QysxOEZTdWlHL3AvRlJLZDIzK29hUHBWem0xSWRXSWdYTyttRGZuYnJJdVhY?=
 =?utf-8?B?ZEVIV3pHRGNyNTkyQ2RmOXZUWk8vNzJ1RFI0U2NHTjFudjRBeE5SVXFrK250?=
 =?utf-8?B?RzMxZ0VyYWwzM2VEQnNPZG9oeGJBaTVkMEppTEpRS1V2cWREVnJIVjgrM01T?=
 =?utf-8?B?a003c0lpeDNCcG96L01qeXg5ZGRjaEE2OXJGeFFSdVIrYXlHakpWYmVVcE92?=
 =?utf-8?B?OER4bmlxM1BrOERLdVhybUFBZ3M3dUpXMklBWVVGUkg5YlZmNy9RSnlYYnp6?=
 =?utf-8?B?ckRJaldIVHF4TjFNTFRtc1A4Tm9HZGV2eWZRWnJkR3MxREdmbjhmTUpMKy8z?=
 =?utf-8?B?Ti8rczEzTWhpUExaaHFBTWR1S1g2dHJVK2d5dUF1WERUT1Z2WEJPclV6OU16?=
 =?utf-8?B?c1EvNW84ZlcrZFUzdytzWFZ6cTBIV0J0Sm1udEt1M2VyRWpGVTV6YTJCN1E4?=
 =?utf-8?B?U3dUNndyMitSVzN6MHk5UzBQeDhDQ0xSM05yc2FzdzFrOFdOUUMwT2tYdUYz?=
 =?utf-8?B?dFFMNWJqWlhPZkN5YUhKYVhBRVVBaDFJcS9tZUE2NS8yWnJGSGZrMk4rT2pj?=
 =?utf-8?B?V1Y3ZURSamRTYzhmZ2V4ZXRhcm1EeUw1UlFOcDlRSWhOWVNxMHhNcUNXY091?=
 =?utf-8?B?UWNSR1JURW1XQnVoNVovUFBqN0d0VjBXRVR5VnpYeFc4cVpibE0zenAwbmFM?=
 =?utf-8?B?Z2xyUGRZaWs4L1lJNXl6d2swYWFUanBhWUYvbk9iTWhpeXpJRGh3bFdicWxq?=
 =?utf-8?B?U0lod0RsU2d2VmQyQTkxZFVMQzM4aUJDRmF6VWkxOGFOemFPNEV1ZkY5UkQv?=
 =?utf-8?B?QWFBOXZiUitRRlJYdWI1VEJRM0xuVjBad3cxOURaRWJONVZwRFFPQ2NIKzFp?=
 =?utf-8?B?cU1oeUo4SVQ5bUdpRnhTeHNLUGJrRkljNTJtVFZWbzdaeXNHaXJwQzgxTWxW?=
 =?utf-8?B?NHlxWFA4N2JtaXB3WnppWDMxVDNUbFA5a1d6RzAxRFd2cWhOTkI4OGpwbFRH?=
 =?utf-8?B?MDN4dHVRdEJweWJtWjdJQ2xLMFhmM2NudWlVZit3a3pOMCtpbGd4S0cxaFQ3?=
 =?utf-8?B?RGwxakxOdUNRZHl6QTBMMzlXSUpvZWw0SjhvRW90OGI2ZkMwV0Y5ZkI5Znlw?=
 =?utf-8?B?ZGVEQWFmeExqdTNvZ1ljMmp2bDl0Z0ZRVlluQnFydzNXRk5oMmh6L3NCNXQv?=
 =?utf-8?B?aEhiRm5mQUFZanpRcjM1d3NCWW0rM1dxcnNoclpndk5JTVhnRkI0VGovM01D?=
 =?utf-8?B?d1FpYTZsOFRsdGVxVDFtenZWTklpdkNCNXhPTmlHQWZia21ES1JZZjhSdGtU?=
 =?utf-8?B?VHAwallmcmFsRkVrVFNqbDBTdjI5Nzd0Q1c0S0JVbzRjQjRtYUp6UmxOOG9i?=
 =?utf-8?B?SHByN3JjeTd2Qm9IeWp5RzZyamdlOG1RWWJuVGc0Ulo0Z0VTTXBkVUNBOFk5?=
 =?utf-8?B?eGIzOTRwSGh1cWhQZHd2VnhyR1RHYStxZnlGSll5aHZUWVBtKzJ3dUNSVnJW?=
 =?utf-8?B?Qnp5eXV5VkQxaHRFQW1iM2h6Q1p1ckJjZ2lSUUg1MmJTWUtQak1VdVJaSW1t?=
 =?utf-8?Q?GR4riI55KFGSOcjc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <063CC9E20747F844976C0E25FDC74365@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: o9EIq5NpsOHQCYeNCxM4v4LnsJY2MUyhtaCZ622Ox/8+uKnuPmobL/Y9KLuljijzHN+8M2qXLaNyymB0aQvcn8gtv0iC+8YgaEOcbZRUCcMO/hwyCrZVsaD8YFuzX4luSkLnhGFBopu0w24EouFJAykGebdpizU7tydQYSwxuHNTun4+Vl0yFDLakn8V7o6HUzaBAFxB6ueVxppQgH1Q7y3a+HpYCvLDKVqKX3qcrz4CfcK2foYFk5OnMefY7ROg+ZstpnNAVTGdhMmzyWZbAYgiaYMPlJiOWkYr07J8j/kqIK7IFOTfkpnzNl07XFNBa97joLNJMm13U+F6pREUMA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ce3ee17-3130-4451-8c86-08df4a1cfea8
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2026 11:20:49.9578 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qc+XAUYkb3A3x5JYAYBnSDB5oG+x7KAASM3rhD8oSGMDXu2lfWagJbtqiL9ctNOCamg4l6st7SszewOPdlPygGtkqIymWXsCfQvPFYVI2vQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5004
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gU2F0LCAyMDI2LTExLTIxIGF0IDA3OjI1IC0wNTAwLCBKYWtlIFN0ZWlubWFuIHdyb3RlOg0K
PiBKb3VuaSwgVmlsbGUsDQo+IA0KPiB2MiBvZiB0aGUgUkZDLCBzcGxpdCB0aGUgd2F5IEpvdW5p
IGFza2VkLiBGb2xsb3dpbmcgVmlsbGUncyBjb21tZW50DQo+IGl0IG5vDQo+IGxvbmdlciBkZXBl
bmRzIG9uIHZibGFuayBpbnRlcnJ1cHRzLiBBIGZyb250YnVmZmVyIGZsdXNoIChmbGlwcywNCj4g
Y3Vyc29yDQo+IHVwZGF0ZXMsIGZyb250YnVmZmVyIHJlbmRlcmluZykgY2xlYXJzIEFTIFNEUCBU
cmFuc21pc3Npb24gaW4gQWN0aXZlDQo+IERpc2FibGUsIGFuZCBhIGRlbGF5ZWQgd29yayBzZXRz
IGl0IGFnYWluIGFmdGVyIDYgaWRsZSBmcmFtZXMsIHRoZQ0KPiBzYW1lDQo+IGlkbGUgdGltZSBE
QzNDTyBhbmQgREM1L0RDNiB1c2UuDQo+IA0KPiBUZXN0ZWQgb24gNy40LXJjMyBvbiB0aGUgRGVs
bCBYUFMgMTYgREExNjI2MCAoUFRMLCB4ZSk6IFBhbmVsIFJlcGxheQ0KPiBTVQ0KPiB3aXRoIEVh
cmx5IFRyYW5zcG9ydCBzdGF5cyBlbmFibGVkLCBzY3JvbGxpbmcgaXMgc21vb3RoLCBpbmNsdWRp
bmcNCj4gYWZ0ZXINCj4gYSBsaWQgY2xvc2Uvb3Blbiwgd2hpY2gganVkZGVycyB3aXRob3V0IHRo
aXMuIERDNS9EQzYgaXMgc3RpbGwNCj4gZW50ZXJlZA0KPiB3aGVuIGlkbGUuIFJlYmFzZWQgb24g
ZHJtLXRpcCBhbmQgYnVpbGQgdGVzdGVkIHRoZXJlIChXPTEsIGk5MTUgYW5kDQo+IHhlKS4NCg0K
R2VuZXJpYyBjb21tZW50OiBJIHRoaW5rIHlvdSBzaG91bGQgZ28gYmFjayB0byB5b3VyIG9yaWdp
bmFsIGFwcHJvYWNoDQpzZXR0aW5nL2NsZWFyaW5nIHRoaXMgYml0IHdpdGggdmJsYW5rLg0KDQpC
UiwNCkpvdW5pIEjDtmdhbmRlcg0KDQo+IA0KPiBDaGFuZ2VzIHNpbmNlIHRoZSBSRkM6DQo+IC0g
VHJpZ2dlciBvbiBmcmFtZSB1cGRhdGVzIGluc3RlYWQgb2YgdmJsYW5rIGVuYWJsZS9kaXNhYmxl
IChWaWxsZSkNCj4gLSBOZXcgaW50ZWxfYWxwbV9wcl9hc19zZHBfaW5fYWN0aXZlX2Rpc2FibGUo
KSBoZWxwZXIgKEpvdW5pKQ0KPiAtIERyb3AgcHJfYXNfc2RwX2ZvbGxvd192YmxhbmssIGRvIHRo
ZSBjaGVja3MgaW4NCj4gwqAgY29tcHV0ZV9kaXNhYmxlX2FzX3NkcF93aGVuX3ByX2FjdGl2ZSgp
IChKb3VuaSkNCj4gLSBTdG9wIHNldHRpbmcgdGhlIGJpdCBpbiBpbnRlbF9hbHBtX2NvbmZpZ3Vy
ZV9wcl9hc19zZHAoKSwgd2hpY2gNCj4gYWxzbw0KPiDCoCBjb3ZlcnMgdGhlIHNlYW1sZXNzIFZS
UiB0b2dnbGUgY2FzZSBmcm9tIHRoZSBSRkMgKEpvdW5pKQ0KPiAtIFJlbW92ZSB0aGUgREExNjI2
MCBxdWlyaywgYWRkIEZpeGVzIGFuZCBzdGFibGUgdGFncyAoSm91bmkpDQo+IA0KPiBKYWtlIFN0
ZWlubWFuICg0KToNCj4gwqAgZHJtL2k5MTUvYWxwbTogQWRkIGEgaGVscGVyIHRvIHN1c3BlbmQg
dGhlIEFTIFNEUCBpbiBQUiBBY3RpdmUNCj4gwqAgZHJtL2k5MTUvcHNyOiBTZW5kIHRoZSBBUyBT
RFAgaW4gUFIgQWN0aXZlIHdoaWxlIGZyYW1lcyBhcmUNCj4gdXBkYXRpbmcNCj4gwqAgZHJtL2k5
MTUvYWxwbTogTGVhdmUgQVMgU0RQIFRyYW5zbWlzc2lvbiBpbiBBY3RpdmUgRGlzYWJsZSB0byBQ
U1INCj4gY29kZQ0KPiDCoCBkcm0vaTkxNS9kaXNwbGF5OiBSZW1vdmUgdGhlIFBhbmVsIFJlcGxh
eSBxdWlyayBmb3IgRGVsbCBYUFMgMTYNCj4gwqDCoMKgIERBMTYyNjANCj4gDQo+IMKgZHJpdmVy
cy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9hbHBtLmPCoMKgwqDCoCB8IDMwICsrKysrKy0N
Cj4gwqBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2FscG0uaMKgwqDCoMKgIHzC
oCA0ICsNCj4gwqAuLi4vZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5X3R5cGVzLmjCoMKg
wqAgfMKgIDUgKysNCj4gwqBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwLmPC
oMKgwqDCoMKgwqAgfMKgIDEgKw0KPiDCoGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50
ZWxfcHNyLmPCoMKgwqDCoMKgIHwgOTANCj4gKysrKysrKysrKysrKysrKysrLQ0KPiDCoGRyaXZl
cnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfcHNyLmjCoMKgwqDCoMKgIHzCoCAyICsNCj4g
wqBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX3F1aXJrcy5jwqDCoCB8wqAgOCAt
LQ0KPiDCoDcgZmlsZXMgY2hhbmdlZCwgMTI2IGluc2VydGlvbnMoKyksIDE0IGRlbGV0aW9ucygt
KQ0K
