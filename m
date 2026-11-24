Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C2CA606A31E
	for <intel-xe@archiver.kernel.org>; Tue, 24 Nov 2026 11:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ekp2UTau;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=YFV0xCeJ
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A5D410E686;
	Tue, 24 Nov 2026 11:02:04 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A1A510E686;
 Tue, 24 Nov 2026 11:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795518114; x=1827054114;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=gu+mJosB1ZIoCS6xdcsslh+wvfkQw7QCKho9hHZJNiE=;
 b=Ekp2UTauXDa0dcLBHKb03jXiA3Fa9XQzNqsDbVRIDA+2CibkSG57km1+
 i29f5hzMwdqxJy45D5wI15UyHS6Gy1EQ2cZn1F6xLK3jCqO6h+lz8+iz7
 SCVb3pnojqHEVpzRQCSyYXlOJu/wJm6V61xeQb+RfjJQUyDfnMov8+19B
 zA10j8b9phBao+00xALzb0rvNlAPB26nsYEd+Gf9LwWTOBjHlwLZbtRgQ
 IqopFN+rf9xgLlqeRG/4lNXqRP0eY/f0rPY27nRchuTcTqWy+1u2ptixH
 4HqoY5+GJrefp3o9Q2nJRxHzDWa+QYKZ95wBixyU6OYQlvg9QbWNC/r76 g==;
X-CSE-ConnectionGUID: zNiFk3++S1q0ctl+tTl0zw==
X-CSE-MsgGUID: UYUgp0HGQ4uoTWItZNeJ+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4440989"
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; 
   d="scan'208";a="4440989"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 03:01:37 -0800
X-CSE-ConnectionGUID: o+3ftwwPQDmXikANG/A8Ag==
X-CSE-MsgGUID: fUeuBl99TfurKl691nD/FA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; d="scan'208";a="11417641"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 03:01:37 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Tue, 24 Nov 2026 03:01:36 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Tue, 24 Nov 2026 03:01:36 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.10) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Tue, 24 Nov 2026 03:01:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d5h0GItDfHY7mT0+VtJQvvhBPvQekaGnfsknFS1URgWDLw1O0/P0ELk7cjbStPWtaOTDGOsR8H0bSnGBFLJovaWPcCCPUIcWtc72QZHVbJG2NP3ag04pdDrwNu8HHc7q94EiPEidQ6cHmsG+eqAUtMPyTLcAmaJrhsPcRDLG6SGFAMuBAOTt846z9xnlbVE+EpsfRJkHWazhuL6YfhYA/ZAnTxgy5ZhTxSzfp6DNERfWIAI7KWixzFhx+2zqIFL+9SgKwfTDzgEY6p/FuRt+ruYZryamgeDvkEExI864o/eS1K7ONvi40Ls4lJNIJJgSPRi8hSBf8IqWANknu87C+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gu+mJosB1ZIoCS6xdcsslh+wvfkQw7QCKho9hHZJNiE=;
 b=gsJbPFfP/CxcWDb/4X6YM4vPykeo2a8c2/gSuq3Sh1sNMztZUjNgDCFyjbNmEZaQjBhBrTMG4yTqnxLiM/hnzroE7PFA8xPvQpawEL5TAnG/b4tymMvMpjkNuOz5El+G2BBt2dCc1y4TNoygD2cuHt9pXm4HqlEruTvnkbKfKrnQgPCIf/0GsSTTpWyjvTYEcX4VU0BdGs8y2/xSBg8hcdROxAAHLPKeywMv0E3DoTdghXmNXoUT5zgUJsDwc2EqFafdaywIR1ceNb2T/ZOMrQzXWCqD0jdH6MBd2ZVFnbxrJ8p//J+TcFuSgFpzU+31Hpmv/vwXfs933jIhp6JKMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gu+mJosB1ZIoCS6xdcsslh+wvfkQw7QCKho9hHZJNiE=;
 b=YFV0xCeJPanMB2pEfEQK0oy8MXN5JqFEM7gjHhZcPxyJOavY30odv0SgOzXbIWOul2MTtbycmNn4uoLz6XKKbGD9/LS41IM4gykUucKDh5cGQPHFZr9lhR+uTQtp7ykNaSDftaFMijDmx03fKig7iOWUd8r9+VJFnpWYs627ZWc=
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 DS7PR11MB5967.namprd11.prod.outlook.com (2603:10b6:8:72::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.12; Tue, 24 Nov 2026 11:00:01 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::9086:5e0b:ad24:762]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::9086:5e0b:ad24:762%6]) with mapi id 15.21.0639.012; Tue, 24 Nov 2026
 11:00:01 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 "j@metarealtyinc.ca" <j@metarealtyinc.ca>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Shankar, Uma" <uma.shankar@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, "Manna, Animesh" <animesh.manna@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>, "Nautiyal, Ankit
 K" <ankit.k.nautiyal@intel.com>
Subject: Re: [PATCH v2 1/4] drm/i915/alpm: Add a helper to suspend the AS SDP
 in PR Active
Thread-Topic: [PATCH v2 1/4] drm/i915/alpm: Add a helper to suspend the AS SDP
 in PR Active
Thread-Index: AQHdebN9o+gj/fLVcUmbECQuHTtXwrc9En8A
Date: Tue, 24 Nov 2026 11:00:01 +0000
Message-ID: <dba0eb8b968559f72162178103ab46a4aaf6dae2.camel@intel.com>
References: <awCCGeCxHToY8tsI@intel.com>
 <cover.1795263689.git.j@metarealtyinc.ca>
 <3ab45d0e8c1bded51e0dadd71fd5b3fa0a1cad9e.1795263689.git.j@metarealtyinc.ca>
In-Reply-To: <3ab45d0e8c1bded51e0dadd71fd5b3fa0a1cad9e.1795263689.git.j@metarealtyinc.ca>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|DS7PR11MB5967:EE_
x-ms-office365-filtering-correlation-id: 5e03d8d9-3b2e-4825-5a2f-08df4a1a1680
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|18002099003|22082099003|56012099006|4143699003|11063799006|261021121427099003|261009223027099003|261102123227099003|10067099003|38070700021;
x-microsoft-antispam-message-info: bVQIalU2rLTl6gSVwrHEYZQjuinmGVVja1p5LuA1Ia2PTYtxBAN+1/w3nnh7eFydzMfZ+asCjVzKEECDy3sH12zfJtwpqOxAu/whcl5vQx5E6Kvf5AwpW4RUyo9IceN0oKYp0ZXIf5et6CJTHOgBzV+ln93X/u3UA1g4tLevfrZmLexYwNyCAXH4fbseq5lA8p9dJ8ejyM7FyNVP4fqN2iW7NArDk3tXoIkQgqJ9OAk6GqLBk0zHG4HQ36csP9dZa9S7sHgRPJB3CJ7rTziGvOJNvSYu7W6SdEeXfpyYWf4Vs4iCP60gMjAw0HiSXwfChW4h+zo1Vs8mnaU+xOHpcnNt1NayRWs+HMrYo6qYJwXsfWBs+cY7DncSSDuJ/NyREIIGbE+M8MwlFTLfkRMGvJ+M0iSh85KqqsJzmGUJnG9wwvM5MRk4HSdv9QbA9mZAjhh8kMFHUz8T6PYT5xk5vzp4A95umyfy/mB3TQdR3xYidXIZqLLjS6CwviVdXxo3qXlF/k7S27dJrVJQruZvbn9z/NlL72GPsumZ1fTyVV4XSSfz12bJBr9ktZcbbBZCOfnc7thoQE20lEtwV0GJmK9FBuuwme7sgFCEoBCx7DXS2boTEszDcQFqDYI+VwN1UPeWe2Bs3pSRn7felcP4YuKpSNo9ApxwtaS5D1MLp+JDFyeyesvoK3Up1N1CAPUPPHlxaZTbenOIiw5/imfYTQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(18002099003)(22082099003)(56012099006)(4143699003)(11063799006)(261021121427099003)(261009223027099003)(261102123227099003)(10067099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RkVCZXYwdHN6clJkaDdVOFdXUEZsNlM5dktZNGZhYlRwMzF3c0pIOVFBaFBE?=
 =?utf-8?B?SDZwVlVKTGt6dytnSm0rSmM5VDFlWEhScC9YaGdoUlpES3MybjZ2ai80SC9J?=
 =?utf-8?B?TFFOUEV2TStST244aXF1SXl0SlppMURtdWRmSEZ1WGc2L3BQVXorR1E2TEdq?=
 =?utf-8?B?STNKRnRNQmlZTGlqaDBBVE1UQTNaOXhERjdhekZUc2FnTXRONGRMQmdVQjFt?=
 =?utf-8?B?cVAzM3d2ZGFUdStHV21sa1NIbGhJSWR0WG5adlVRT2haR2o0RVdSUnpHQXQ4?=
 =?utf-8?B?RFh4QmhwKzh1THF1NXF5VE9lOElnNVlTbFpVbU1Zc3lpNmplWVFtaFpmVmx6?=
 =?utf-8?B?MDAwbGpDSUFLWkxnSWJRNUw4Nys3emd2TGRVTE1aTW5GVmxGaW93c1N3ZnpT?=
 =?utf-8?B?WDNDWWVscjhaS1JvR0dla3B0Z1JhMUgzZHJVV3lnd01YYWh1REFqTHdRSkxE?=
 =?utf-8?B?MGJsWUZUQk9QM2Z1endqdVhOWlQxNFIxdTY1ZWdTakpyczlVRStCQ25NWG5u?=
 =?utf-8?B?K1c1MnRUQ3ZwUTZrcG5aL0tEdU81b2FNSFFKbHhQa0U3VE5zRXZ5ajJscDg4?=
 =?utf-8?B?ajhmT0VCV0JoZzNOZFZId2t5Q2RZVnhXTmM2UnBKMkxrcmJ3YVNLemUwbFFH?=
 =?utf-8?B?VEVrWUtmbis2WURFV256RFhZUUx3VmtoL0EvYkRVRzBLNUN0SW5DQ3Ztd0xw?=
 =?utf-8?B?bkdXQ1ZYVFptcFBRVDVPdzlsOGV5YkRsYmVLNDhvRHVRcE9VTzQwUGJDQ3pR?=
 =?utf-8?B?SVdwZHo0NHZZUjVYa2IwR1NDV0N6dGpPUk9pL2tRYXRXZUE5QUNHWlNiMUhl?=
 =?utf-8?B?MTdjbkRTQnErdjFxWFlISXM0YU9zNytnL2h3dzREWUx3R2FLZE9xelpiYXl5?=
 =?utf-8?B?U0xjVFA5NmkrQkw5bGdNdlFEU25MUUQ4VFIvenZaMTY4VHBVd1NKWmYvMFBj?=
 =?utf-8?B?b2xZSzlMVElZbVhRdlhCaHo0SitvYkRxNjNOK0lKalJlbFB2VUlUZmxLZXRP?=
 =?utf-8?B?a0YyUGJERit0b3N4NXMxbzYzQXA1SEZIUVJtQkVLNDRzWnF5NVAzeE1sNWtp?=
 =?utf-8?B?bTVsR1dLU1dDYWNMcFBkNkFZSnlGRzEvQjZEZkxnd3d5K2hQVWo2a2Nyd1dt?=
 =?utf-8?B?R3JWSVZTRWpWY3NHQ1NqV29ZL1J3OEpjdU1tZzRPajYvVmt2aFZlSE90S2pk?=
 =?utf-8?B?RlRzL04zamZzVzJpZGpKMUZPdEJJMkd3SFZIQ1NGbTFWVmFMSUNSSGE3d1U0?=
 =?utf-8?B?WDZHT203M21CNFE0cDhzbDhkdkgwa0dRVUJmbjRVTDRVY3dwNFhBSjhqZjJB?=
 =?utf-8?B?Mkg1Zy8rMTE5aG91UnJhMnRSY0NRZ0ZFVGpIS3FNS0ZrY05raXZyb0dtd1J5?=
 =?utf-8?B?Y2M2WXZ5cHAxQmFRTVFJSmZValdNdGo5eUZoSE1HQzBnOVg4djBETkpHd214?=
 =?utf-8?B?T3pnWm45NCt4Q1NYYWhzeURFUjNzbEsvdnhzZzVLY0J3cXpvRE45dEw0emtD?=
 =?utf-8?B?bE1jUXczS2UrOE5BVkxhdlpGWThEY2FLOVlEUVBoK0R3TVlFNDRTUnMrR2py?=
 =?utf-8?B?OGh4dHVIMUpHaHZNNy9KNlAxM1pLc1JNV0lhU1pOT2dGcW8wbFlPa0doMWRp?=
 =?utf-8?B?ejh3a2NINklNWUVscy96VC9oVTRtSG1MUWgxLzNieXRoczlXOFA2OGMwTEFI?=
 =?utf-8?B?SFJZSU9ITzdBZS81S3E4eThxT3VjbmNOaU9CYlFQUnNCbG05NzFTcE5EWWRY?=
 =?utf-8?B?NXBFdGFlUVBTZWNNZURkRHZvRjZHczlBZVFjVWV3RDVUUlJWVFV6QjBRbGFq?=
 =?utf-8?B?THUxUmFyeGk0Vy9ub2kzbGdIcHE0NEJrcU92YThwOVRwaXNMaGlhcGRCT3hM?=
 =?utf-8?B?aVd4WTdjWTFBV2tvd0hhWjZJU2dqYjlDMXBndU9TUW10UGhOSy8zY2RQcTMz?=
 =?utf-8?B?N3d4SXhlM1gxb1Awc211VjRMZ3BWckNsSkpRaHoybXBwSXFaTHBrMEFGSGhF?=
 =?utf-8?B?MitwUUhlaGpoeTBlQXlLRktSL3AwYlpVVnhSVEE3aUJQczk5ck8xdllIdCtu?=
 =?utf-8?B?TGx6MmxBVjIxb0cxODFxanM4a0ZRTjE2T3RDR2dsTDVMY1NIWEdPb09qcVov?=
 =?utf-8?B?UlAwbkY5aVdCdHdEVFVtOFNqRmRHZGxGMXJacUh2eFNvaHYzYnMxendvSWxV?=
 =?utf-8?B?YlJ5dTdtWXhaUjd5RzhnZk85OWtHd0FROXZ6YUt1ZmVmYWpoUTNzVEJPYnd1?=
 =?utf-8?B?QXU2czdqNUxYYU9CbkJ3N2s1anFIMW1IZ2FqQjRaS3k3VCsrbVEvdFFuMG1X?=
 =?utf-8?B?YitKRi9wUmF6SUk5ejZWS1ZkL3BseWQ2TFpwQzBSUTM2VXY3L085dVB0Rm1Y?=
 =?utf-8?Q?ceSnZOojs70qXhiU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D9F09CFD703AE64D92ED75CC9D49B242@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: GDv/lq6yRqrBHW6XhMk6x3qu2RpXT9eTgFmsCL9kzHOcRuKFRU1FiL2FsYF16vd/IGmROtuP4e+/5yYIZRYkyyjBo0N5k/4swBY3dTM48KeURM5B/lTEkgDU2brVUkBtUVmp8zRDXOorpEAugxiiXzeO9Tigui2n/W5C2i4aKft64ixLUNSMq9JG2Tz1Du/CUssJpQerSXom/sR1m+xflnJk2tty/eHt0nnv+6Kr3RzsSfz8B6LtRaqxvbbsNXGk0xOdmtRv2WHDk7RKSploltN4pRiycno282W6rAv5HmE48znzrpTZUkL9rgxZeA8ktd2pf1SkYpAYgu7nMhEajQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e03d8d9-3b2e-4825-5a2f-08df4a1a1680
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2026 11:00:01.6784 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: THmvcrnzpX78hMaUIsJYLhDkWXyDSh84SOzdlE/CC0n4oMsKK5GqkoAy/kHO8Du9I/5bI98SSCra9WI2Ej4krxebO6NkkX5qJKyrqjJqexY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB5967
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

T24gU2F0LCAyMDI2LTExLTIxIGF0IDA3OjI1IC0wNTAwLCBKYWtlIFN0ZWlubWFuIHdyb3RlOg0K
PiBBZGQgaW50ZWxfYWxwbV9wcl9hc19zZHBfaW5fYWN0aXZlX2Rpc2FibGUoKSB0byBzZXQgb3Ig
Y2xlYXINCj4gUFJfQUxQTV9DVExbQVMgU0RQIFRyYW5zbWlzc2lvbiBpbiBBY3RpdmUgRGlzYWJs
ZV0gd2l0aG91dCB0b3VjaGluZw0KPiB0aGUNCj4gb3RoZXIgUFJfQUxQTV9DVEwgZmllbGRzLiBQ
U1IgY29kZSB1c2VzIGl0IGluIHRoZSBuZXh0IHBhdGNoIHRvIHNlbmQNCj4gdGhlDQo+IEFTIFNE
UCBpbiBQUiBBY3RpdmUgd2hpbGUgZnJhbWVzIGFyZSBiZWluZyB1cGRhdGVkLg0KPiANCj4gQ2M6
IEpvdW5pIEjDtmdhbmRlciA8am91bmkuaG9nYW5kZXJAaW50ZWwuY29tPg0KPiBTaWduZWQtb2Zm
LWJ5OiBKYWtlIFN0ZWlubWFuIDxqQG1ldGFyZWFsdHlpbmMuY2E+DQo+IC0tLQ0KPiDCoGRyaXZl
cnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfYWxwbS5jIHwgMjINCj4gKysrKysrKysrKysr
KysrKysrKysrKw0KPiDCoGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfYWxwbS5o
IHzCoCA0ICsrKysNCj4gwqAyIGZpbGVzIGNoYW5nZWQsIDI2IGluc2VydGlvbnMoKykNCj4gDQo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2FscG0uYw0K
PiBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfYWxwbS5jDQo+IGluZGV4IGY1
NGIyOWUxOS4uOTEwMDY3ZDI3IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9k
aXNwbGF5L2ludGVsX2FscG0uYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5
L2ludGVsX2FscG0uYw0KPiBAQCAtNTExLDYgKzUxMSwyOCBAQCB2b2lkIGludGVsX2FscG1fcHJf
YXNfc2RwX3VwZGF0ZShjb25zdCBzdHJ1Y3QNCj4gaW50ZWxfY3J0Y19zdGF0ZSAqY3J0Y19zdGF0
ZSkNCj4gwqAJfQ0KPiDCoH0NCj4gwqANCj4gKy8qKg0KPiArICogaW50ZWxfYWxwbV9wcl9hc19z
ZHBfaW5fYWN0aXZlX2Rpc2FibGUgLSBzdXNwZW5kIG9yIHNlbmQgdGhlIEFTDQo+IFNEUCBpbiBQ
UiBBY3RpdmUNCj4gKyAqIEBpbnRlbF9kcDogSW50ZWwgRFAgc3RydWN0DQo+ICsgKiBAY3B1X3Ry
YW5zY29kZXI6IHRyYW5zY29kZXIgUGFuZWwgUmVwbGF5IGlzIGVuYWJsZWQgb24NCj4gKyAqIEBk
aXNhYmxlOiB0cnVlIHRvIHN1c3BlbmQgdGhlIEFTIFNEUCBpbiBQUiBBY3RpdmUsIGZhbHNlIHRv
IGtlZXANCj4gc2VuZGluZyBpdA0KPiArICoNCj4gKyAqIFNldCBvciBjbGVhciBQUl9BTFBNX0NU
TFtBUyBTRFAgVHJhbnNtaXNzaW9uIGluIEFjdGl2ZSBEaXNhYmxlXQ0KPiBhbmQgbGVhdmUNCj4g
KyAqIHRoZSBvdGhlciBQUl9BTFBNX0NUTCBmaWVsZHMgYXMgdGhleSBhcmUuDQo+ICsgKi8NCj4g
K3ZvaWQgaW50ZWxfYWxwbV9wcl9hc19zZHBfaW5fYWN0aXZlX2Rpc2FibGUoc3RydWN0IGludGVs
X2RwDQo+ICppbnRlbF9kcCwNCj4gKwkJCQkJwqDCoMKgIGVudW0gdHJhbnNjb2Rlcg0KPiBjcHVf
dHJhbnNjb2RlciwNCg0KWW91IGNhbiB1c2UgaW50ZWxfZHAtPmFscG0udHJhbnNjb2RlciBpbnN0
ZWFkLg0KDQpCUiwNCkpvdW5pIEjDtmdhbmRlcg0KDQo+ICsJCQkJCcKgwqDCoCBib29sIGRpc2Fi
bGUpDQo+ICt7DQo+ICsJc3RydWN0IGludGVsX2Rpc3BsYXkgKmRpc3BsYXkgPSB0b19pbnRlbF9k
aXNwbGF5KGludGVsX2RwKTsNCj4gKw0KPiArCW11dGV4X2xvY2soJmludGVsX2RwLT5hbHBtLmxv
Y2spOw0KPiArCWludGVsX2RlX3JtdyhkaXNwbGF5LCBQUl9BTFBNX0NUTChkaXNwbGF5LCBjcHVf
dHJhbnNjb2RlciksDQo+ICsJCcKgwqDCoMKgDQo+IFBSX0FMUE1fQ1RMX0FTX1NEUF9UUkFOU01J
U1NJT05fSU5fQUNUSVZFX0RJU0FCTEUsDQo+ICsJCcKgwqDCoMKgIGRpc2FibGUgPw0KPiBQUl9B
TFBNX0NUTF9BU19TRFBfVFJBTlNNSVNTSU9OX0lOX0FDVElWRV9ESVNBQkxFIDogMCk7DQo+ICsJ
bXV0ZXhfdW5sb2NrKCZpbnRlbF9kcC0+YWxwbS5sb2NrKTsNCj4gK30NCj4gKw0KPiDCoHN0YXRp
YyB2b2lkIGxubF9hbHBtX2NvbmZpZ3VyZShzdHJ1Y3QgaW50ZWxfZHAgKmludGVsX2RwLA0KPiDC
oAkJCcKgwqDCoMKgwqDCoCBjb25zdCBzdHJ1Y3QgaW50ZWxfY3J0Y19zdGF0ZQ0KPiAqY3J0Y19z
dGF0ZSkNCj4gwqB7DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5
L2ludGVsX2FscG0uaA0KPiBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfYWxw
bS5oDQo+IGluZGV4IGY4ZjYwNWQ5NC4uYTQ1ZGRkMDRmIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2FscG0uaA0KPiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vaTkxNS9kaXNwbGF5L2ludGVsX2FscG0uaA0KPiBAQCAtMTQsNiArMTQsNyBAQCBzdHJ1Y3Qg
ZHJtX2Nvbm5lY3Rvcl9zdGF0ZTsNCj4gwqBzdHJ1Y3QgaW50ZWxfY29ubmVjdG9yOw0KPiDCoHN0
cnVjdCBpbnRlbF9hdG9taWNfc3RhdGU7DQo+IMKgc3RydWN0IGludGVsX2NydGM7DQo+ICtlbnVt
IHRyYW5zY29kZXI7DQo+IMKgDQo+IMKgdm9pZCBpbnRlbF9hbHBtX2luaXQoc3RydWN0IGludGVs
X2RwICppbnRlbF9kcCk7DQo+IMKgYm9vbCBpbnRlbF9hbHBtX2NvbXB1dGVfcGFyYW1zKHN0cnVj
dCBpbnRlbF9kcCAqaW50ZWxfZHAsDQo+IEBAIC0zNyw2ICszOCw5IEBAIGJvb2wgaW50ZWxfYWxw
bV9pc19hbHBtX2F1eF9sZXNzKHN0cnVjdCBpbnRlbF9kcA0KPiAqaW50ZWxfZHAsDQo+IMKgYm9v
bCBpbnRlbF9hbHBtX3ByX2FzX3NkcF9za2lwX2ZyYW1lc19lbmFibGVkKHN0cnVjdCBpbnRlbF9k
cA0KPiAqaW50ZWxfZHAsDQo+IMKgCQkJCQnCoMKgwqDCoMKgIGNvbnN0IHN0cnVjdA0KPiBpbnRl
bF9jcnRjX3N0YXRlICpjcnRjX3N0YXRlKTsNCj4gwqB2b2lkIGludGVsX2FscG1fcHJfYXNfc2Rw
X3VwZGF0ZShjb25zdCBzdHJ1Y3QgaW50ZWxfY3J0Y19zdGF0ZQ0KPiAqY3J0Y19zdGF0ZSk7DQo+
ICt2b2lkIGludGVsX2FscG1fcHJfYXNfc2RwX2luX2FjdGl2ZV9kaXNhYmxlKHN0cnVjdCBpbnRl
bF9kcA0KPiAqaW50ZWxfZHAsDQo+ICsJCQkJCcKgwqDCoCBlbnVtIHRyYW5zY29kZXINCj4gY3B1
X3RyYW5zY29kZXIsDQo+ICsJCQkJCcKgwqDCoCBib29sIGRpc2FibGUpOw0KPiDCoHZvaWQgaW50
ZWxfYWxwbV9kaXNhYmxlKHN0cnVjdCBpbnRlbF9kcCAqaW50ZWxfZHApOw0KPiDCoGJvb2wgaW50
ZWxfYWxwbV9nZXRfZXJyb3Ioc3RydWN0IGludGVsX2RwICppbnRlbF9kcCk7DQo+IMKgdm9pZCBp
bnRlbF9hbHBtX2xvYmZfY29tcHV0ZV9jb25maWdfbGF0ZShzdHJ1Y3QgaW50ZWxfZHAgKmludGVs
X2RwLA0K
