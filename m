Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E31A9606A334
	for <intel-xe@archiver.kernel.org>; Tue, 17 Nov 2026 23:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=a0GovxHV;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=is+JP6NX
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CAB810E0DF;
	Tue, 17 Nov 2026 23:15:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 133FF10F9D1
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Nov 2026 23:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794957299; x=1826493299;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=kQa+1qd+9EnmHoL2ul+m6P2ZQuqlRDPvzBrXJ+UXedE=;
 b=a0GovxHVg883Ova0ytVO7YYptg4SxKHHK8epOouTFs6LoAqips1MHuv4
 3flNzcQOKvJuwSQ15JgVeRAn+2qMaQ+qTbnL8Kj5RmlLB3Fb3CdlNROf3
 0HlzrFx+6OmgER62lY/yLvYmHvf9bNI7O2OtzVYzMmowzitTmgfe2IqZ7
 bp5n7RyktMyUWBE4OjDh8WC/Y07FxsvubBYMBT559WS4d3gvBkyg4li7t
 Y3DhRTIMUF+c5T9eJfXTjqbjmehaYyrCDoSQTvNhhj1MM08AE6n8ZKIQg
 C/An4i+YcJA/gto98iDIj0Mig1ICiKSOqk6DA5ZYujDs3yxqePPZSj2A5 w==;
X-CSE-ConnectionGUID: 4cOkO/WTSXCEgmtZ0NSbiA==
X-CSE-MsgGUID: TYGQQfeDQ9CunCde7vbDGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3760906"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3760906"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2026 15:14:58 -0800
X-CSE-ConnectionGUID: rEvmsageRfWWZiKJw2FNXw==
X-CSE-MsgGUID: tNQaI3thSbOO/QDOG+kYtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; d="scan'208";a="10038143"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2026 15:14:57 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 17 Nov 2026 15:14:57 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Tue, 17 Nov 2026 15:14:57 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.47) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 17 Nov 2026 15:14:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gj1xrNL6MjydHU06pM4Z15JecWT6p7fnkuFCBSsOR9aXjg0ia+0bXr5pdeWM77mple4IBNrnXO8gnvssbq5s60eoOWXY+/pappMjkvqMT2MfzMURW9eTCXTM7f3XRiU7wTys5mDIXqUijhmG8XysvisdSBCgAOlIZ+unGG+5CWAQulmzYdUJM1N9aObKfU6LXe7iUnE5yuBohTcUZjfX3rx37Z7gOsYC9tEU61BGt8RymFAlPHJaz4U0ymh4XZGc3MX+NprpsA9aWKvaCqmfBZCu8pDBkNdVf9BHHR9PiePv+Wnq07byGKzC1wE52Mfw6U7eI9HbTcOU413pV72OGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kQa+1qd+9EnmHoL2ul+m6P2ZQuqlRDPvzBrXJ+UXedE=;
 b=yl3c5G4dCg63IUp452ealzuCEI3Q21a503kGFi34bhORA1cHVRdq4EhCxiwrsBPnaqZSMac9yC7mUdq86pC/Jlv0o4CWvKFc5gt1b2lGkxy9MgyEQvQe6QtNcsxlZIvWmnwPL57XQnW8io3d6RBA8F1zBiOxoHSuvNmapB3ZaWX57yJ7qSj27h+emc+i1REYHSljjl3i2EwwloSBdV4pJOV4L2PupaAMPPYufhE9CGWQ9b8o8+ftpH5H8aVDt00SB2V5kZHTZrBP+QkIwUfV3dVaJKUvES2n5Mad82S6bhsYqOy+TdikjJcwulrzFZBvnSGEWsZwUcqBAPPr63Uv5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kQa+1qd+9EnmHoL2ul+m6P2ZQuqlRDPvzBrXJ+UXedE=;
 b=is+JP6NXtTTQ8kCPIDovGDzOslhCpJRu7/Qo8lbZML5SDN8skBXLDLGwriTlXg7mYOmFq87GMpPNcen/Qaq/kKUCQU77+ciB3JY8hOXjiNweNP4XrAjj5CyHHGpsO3lQeVcl2pHE2Tpd7WRx+vHnJm8VH5Oe12W9TIlMV0cPffk=
Received: from AT6PR11MB072844.namprd11.prod.outlook.com
 (2603:10b6:170:10a::16) by PH7PR11MB8249.namprd11.prod.outlook.com
 (2603:10b6:510:1a7::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 23:14:53 +0000
Received: from AT6PR11MB072844.namprd11.prod.outlook.com
 ([fe80::520a:561:ace1:e64b]) by AT6PR11MB072844.namprd11.prod.outlook.com
 ([fe80::520a:561:ace1:e64b%6]) with mapi id 15.21.0615.013; Tue, 17 Nov 2026
 23:14:53 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>
Subject: Re:  Xe.CI.FULL: failure for drm/xe/guc: Reset GuC before unmapping
 its post-hwconfig buffers
Thread-Topic: Xe.CI.FULL: failure for drm/xe/guc: Reset GuC before unmapping
 its post-hwconfig buffers
Thread-Index: AQHddul0LPqpbs1K/UyWfuCOAiak0A==
Date: Tue, 17 Nov 2026 23:14:53 +0000
Message-ID: <5b7bee71e1d3508db80f301a3a4fcb6c0fff2b6e.camel@intel.com>
References: <20261019100448.759503-1-sujaritha.sundaresan@intel.com>
 <179241172879.39992.11184448398668896772@221881a7231d>
In-Reply-To: <179241172879.39992.11184448398668896772@221881a7231d>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AT6PR11MB072844:EE_|PH7PR11MB8249:EE_
x-ms-office365-filtering-correlation-id: a0c49ca0-bb63-4e7d-866b-08df45009684
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|18002099003|22082099003|261009223027099003|4143699003|56012099006|11063799006|261102123227099003|261028144727099003|261026135527099003|261026121527099003|261026130827099003|261026140227099003|261021130227099003|261021123027099003|261021121427099003|261022115727099003|261022113327099003|261022105027099003|261022075727099003|261021135927099003|261021133027099003|38070700021|10067099003;
x-microsoft-antispam-message-info: GUgz6cIZM7LkfL3ymF5F47Mwnj++lEwI/PXPXmGSrEBGL682GU4JyeWV2/+pM0Byql6DLSElMTRWycyoZHiUny3qGHfvLswZRn0LMefb9xIXKgFQ/hgI6F0YBZRlvzGRHqujV7YXVzdRVZRloaVifTDUN3WXsZZOemkFPdvawRXpK8qdz8gNVx0AFCGoDxZZGoriMvc8zDgg/4ewhCSxOXu7nBFhOJqrDmHxCvFbt8lL0AHqRb00D32qK3WK6Xy19Zcc4fyismTryufljFH3FUOPb5M/NhHt4EwXS3VrBpulsSbjewl676/pb46t9QZfkOvtw9+uqgGTlqPSFcVVVQWlKuiFJIAm0qsORJsEu3f1oc/b+Mmk84Ti/ECqjIpQWJzePDJjUxGOcsgj7uQbDV/6iDJk29K9OWAMBwrs+SJIM+miyg1RVnEWXho8BN/CXvUjh7Jyfg6gvWfL0YdZRBp2cJ7Cu+M5hIskrFn5uyJw2iNXD7OkVbysfcXQHEdUVpn4TvhNO/K8DveimtpZlinvzsQ/aHl3LeCG9Q9i3sMRXC+p9ltMcsY73YLMzR0ubSQdeEyhOyEiIeRsAB1QPR63reUjyRDBAvkA7LgiYBl/dp1uXeVNybtHD77Z6IRkFQUc9O/P7PDXJSDcwZfVLVgKKOerS4xmYKOy6gILDgE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AT6PR11MB072844.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(18002099003)(22082099003)(261009223027099003)(4143699003)(56012099006)(11063799006)(261102123227099003)(261028144727099003)(261026135527099003)(261026121527099003)(261026130827099003)(261026140227099003)(261021130227099003)(261021123027099003)(261021121427099003)(261022115727099003)(261022113327099003)(261022105027099003)(261022075727099003)(261021135927099003)(261021133027099003)(38070700021)(10067099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WHl5Zi8xbWpYV2Zxcmk2Tk5uR1U4b1Iybyt1R1NRbE0zN21oNGRSdnpQWlEz?=
 =?utf-8?B?d0dEVkJyZnVhTEVOcE9XcytUVUVOWFphZzhBU05kc1llNEtYa1Fvb0hJZFF1?=
 =?utf-8?B?NFJ2d1VCUmd2dXk4TFFmSSt4THhkeUNuYm5BUlFBSVJVQmkwaU5FT1dYMjg2?=
 =?utf-8?B?ZmpNMmMzUVpBUk0rc25rbzdtRngzb3JGSkN1QnpDZTFUN0lZYzk0Q2VOZzJr?=
 =?utf-8?B?TmdsdmxxL2JhMTg0NEdMUStKaEd6ZmtPU2JMeHdKN0ZZbFlTenZlWlN1dlFq?=
 =?utf-8?B?NHUvRE42WDF0cjJRdzlUVFFYZHJkRTBUT2MxQWpWby9pbGd1dVljQTBac25C?=
 =?utf-8?B?N0RoZHlERERNWXF4MGdjZWhqeC9IVHVyaXNUTHpxcDgwY3lMY0x3RlFKbTY3?=
 =?utf-8?B?bmF4bDVIK0pZcU5ZMjhMV0NYM0dhWmtQTmo1b21HYkJPNU9lUE1OQlJXcG1M?=
 =?utf-8?B?OUdvRnpuOE44SlRWQ2RSc3BMRmloQ08rejR2MUZWallFYXRPcU0vYm9yWWIx?=
 =?utf-8?B?b2dvb1M3Y1pzdjVkN2VldkducWdkSUx1cE1WMUtYUGFzRzYxOG0wYmt4RDFP?=
 =?utf-8?B?d3YzUlZOTkkvVmxQcUk0QmZLVFlOdmtwUjJVTkVKVEpJWnNEUjdYRHJtTTJo?=
 =?utf-8?B?TWxVa3F3UmdXVzNVYnlhcUQyUGFsODhEMC9lZDlQM1dpSUNvY2Z1ZDlvRXBw?=
 =?utf-8?B?WGd5S2tmNXhZRW51VHhVNUl2eXU4V2RxV2JuQkxGOGg5ODJCNW5PdkNKY3E0?=
 =?utf-8?B?eXV0U3Iyd1M0WHNBai92Mml2UzJ2MUwvcHF3SjZEOUZLZzJBWTFLamxYTnNL?=
 =?utf-8?B?ZERNbjAzMlpKMmp2Ujk4bGVzZSt2NGtyazZGTlpUalFRNFg2R0xXWWFjSGQ0?=
 =?utf-8?B?b0FhTVFjTkgvdS9BY2NWTzZJRDA3TjRhR3FPRG13VFpGaTVyUHpQTWhvcTZO?=
 =?utf-8?B?ejRCNit4WDZ5TUluV3hlNzM5alV1dHdUOVRXSXpjZy9obmhwL0JReEFtL2Fu?=
 =?utf-8?B?dXpJekU3cVB0N3pZWUxFUFh6SDZKaVFjcVhIbjFOZDVSZmYvK1VEaFd5OC9J?=
 =?utf-8?B?T1RZRzJNYlZuR3dja245ditud3JnVmtBQkpyeE1ZQ0pXTEZpdDRVV2VaSXFO?=
 =?utf-8?B?aUM4d0l4UmdGSTBFTEVLTXNGUTJyeW5XdlJ4ay9MbkNCN3FaS0JJMzhrOXJs?=
 =?utf-8?B?Nit0UEI5UFpYQWVMcmtwM1pCZS81YmhlNmdVR25UdFgzN09DMWVKWmt2Tjdo?=
 =?utf-8?B?c1F0MUZkdDk3RDZvRmxLMHIxWTcyRHd1ZXZkVGNjQy92OGQ0NUFDajEya2c5?=
 =?utf-8?B?SzRJb0pjbDhBdUxBcFV0bGJqaFdHc1BLaXMxNHNHNm53QTBPL1pDZzBXcnJV?=
 =?utf-8?B?TndWcHN1Z3IzcmVuMHVRQWZydUtmTHczbGFDS1dPdkFoN2J4U1AwTkRiTGs2?=
 =?utf-8?B?OXorazhQVEJmVldXV3l3c1JFbElPMWhLc3dqdDRvUkc0cUt3ajRJdEY1bGpS?=
 =?utf-8?B?cHZ1Q1hVajh5RVV2cGo3WVBYTDA2Z2d0b3FwNmF0c2FaY1ZIMkhKZ0EwT0NO?=
 =?utf-8?B?bFVaVExWSjVUVThnaEozanphaHdlSFcrTDR1RTFGa2JMQndNRmxmTkROUzJh?=
 =?utf-8?B?YlBReXJMYjIzVW5kV3F1REppR2ViQWx5UnFEam5tck0xcm9RVEkwR0ExdUpX?=
 =?utf-8?B?d1lmVDhhckRQOUNFM1lhVnNiT2pxeml1bFVOOUpnd3NySzltZmNLY2k2NGpa?=
 =?utf-8?B?UnJ3YWUvMXVjTCt0VUtVOWU4anFKM3htMHU2cTVhVTdhTWJHYXcvMTl2SWVV?=
 =?utf-8?B?YTVsSENJU0FTMFBubHFld2dKR3h3VGg3VWlDWEdkekh3WlJ0Uys2U3dIbUZz?=
 =?utf-8?B?YllScElLNDJjZys4eitVLzFrR3M5Zmg0bThBVnp4bzJ2R0loS3kvK1dLdGVQ?=
 =?utf-8?B?Qld1M0VjYUpzbFVRdzlmT3hHS04xdXhHRDZYNmNmSWJGV0pNM0poY0pYRWRU?=
 =?utf-8?B?UWxFdG1DWXBzdFZWM3BKSWdzSHJKUFYwYkYxYnFIVS9Lcm1aekJWT0NUejlP?=
 =?utf-8?B?OFBSOUJFbDBUSm1IeWhGUithais0VXdveGdIL0dZSzRqTGhvZFN4TzFSZzQ1?=
 =?utf-8?B?ZE5RcTc5SFJNdkNzNlZEUEZKWStGMjBmb25leUhHTmQzUDc0ei9odmJpZWtz?=
 =?utf-8?B?RkxSQjRVZHU1Wk5NMUU5UU4wRWtkZG1vUzd0RS94VldTeW9SM2RnM1d5bXJp?=
 =?utf-8?B?UmNuZUw2ek5VclRsSU1kTmxJVmVxM3lMbk4zWnNYSnlMRmZ5TVQva1NPcVRC?=
 =?utf-8?B?M2czQ1hydE1DREw1Y0E5bVJBY1VicnFmdmNzS2t0RmJNUmhTK1BhTk1JTGRG?=
 =?utf-8?Q?zXd7ZhPdVNbYAshg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BC9778D80BE6BE4F92EAEA40012875A4@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: acL2pH8ixrJGfQn5tNuRKSB/1HTx8niIGiTInDDggu3pnhUw1er6Hz1JAfzOMVkJdylazT6b6x9fC01SsRkoqaqwHxdILr3XSEo5Dr6dzorocn/kzebvOPKIJonMVILcMd8u6twj9RbFBRoCYmL3SZuIEMt0Auhod9/7/fZUOK97GgrshBHOQdY/0EGFLlaKxwaWgFw7QjWEJXrd+pFc1g7AxwzWYPSo167lHQANAWjraR3LvjRkuQAenTHCNRGafkZtX2PA9xJTSH53+fL/6EzJzGDu30mjeLWpmp/H3Pca5slVftbC6APWDUfVazY+lvSJyzUm0Pbtx+Yci6GDMA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AT6PR11MB072844.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0c49ca0-bb63-4e7d-866b-08df45009684
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2026 23:14:53.6926 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zfBjQ97379FQlrzUx1qJtZJn1pJOcTJ7hEW41NT2dhPpiRKhGrklZdKvOGbjm42Kd0pwjnQUK7MlVOY6018YeQK7a1gk8iuUwi4TlPH5e8o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8249
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
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gTW9uLCAyMDI2LTEwLTE5IGF0IDEyOjA4ICswMDAwLCBQYXRjaHdvcmsgd3JvdGU6DQo+IFBh
dGNoIERldGFpbHMNCj4gU2VyaWVzOglkcm0veGUvZ3VjOiBSZXNldCBHdUMgYmVmb3JlIHVubWFw
cGluZyBpdHMgcG9zdC1od2NvbmZpZw0KPiBidWZmZXJzDQo+IFVSTDoJaHR0cHM6Ly9wYXRjaHdv
cmsuZnJlZWRlc2t0b3Aub3JnL3Nlcmllcy8xNzYzNzAvDQo+IFN0YXRlOglmYWlsdXJlDQo+IERl
dGFpbHM6CQ0KPiBodHRwczovL2ludGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9pbnRlbC14ZS94ZS1w
dy0xNzYzNzB2MS9pbmRleC5odG1sDQo+IEVSUk9SOiBUaGUgcnVuY29uZmlnICd4ZS01OTcyLQ0K
PiBhOTgyOGNjM2NjNDI4YjM4OTJjZGU1MTdkMzY2MmJhYTMwNjg3ZGFkX0ZVTEwnIGRvZXMgbm90
IGV4aXN0IGluIHRoZQ0KPiBkYXRhYmFzZQ0KDQpNYXliZSBnb29kIHRvIHJlLXJ1biB0aGlzIGp1
c3QgdG8gYmUgc2FmZS4uLg0KDQotU3R1YXJ0DQo=
