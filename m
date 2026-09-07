Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3994C79F9E
	for <intel-xe@archiver.kernel.org>; Mon,  7 Sep 2026 12:00:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4818710E0B6;
	Mon,  7 Sep 2026 12:00:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GfZP/ebj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 968A910E0B6;
 Mon,  7 Sep 2026 12:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788782425; x=1820318425;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=54KeeU8HJFfsYwXVboxXR6Xc4hjO9B6+qdJbxV0vLAA=;
 b=GfZP/ebjXh84c71fhmglpSdC7DsHo7vMz3rQSHIqH4B9Ixp8iZ3uhiUn
 uIye6JTNamhsB4Bz0usFJAzel2Ul8qZBrVDXFszdjo7q7XIAFFu5XQ7KB
 Dx4tugLN7zAjPJaS9dSpcBCUbQW4hsWqmKWAvBSYgIzXnk4uTNHaCSFIs
 pJKo2T0b5iEOVAuaAFlKABs5sjsB9eWG+svrmmACc5bTklMJuaIneT4N/
 2Z8gZugzghFQUqYMF8Hn/KVco3kynFUV3o6C7BjI5pVUGGtT0UZGbUzgf
 A2d3leIimxNs+v40yqDUKZ3kA6Kh23EOgt1xONI6cad5lo7+1n2KxABxI Q==;
X-CSE-ConnectionGUID: 7L9U8FHuQiWchBfS6nbvSA==
X-CSE-MsgGUID: YwkZeermQmyjFSGDJCp5mA==
X-IronPort-AV: E=McAfee;i="6800,10657,11898"; a="100706302"
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="100706302"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 05:00:25 -0700
X-CSE-ConnectionGUID: E+Veg8nrRe2rfKYnGrvjAA==
X-CSE-MsgGUID: FDnIv9ozRsi07q9poU3Zag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="266352191"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 05:00:24 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 7 Sep 2026 05:00:23 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 7 Sep 2026 05:00:23 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.67) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 7 Sep 2026 05:00:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KANukC4An7upFBB8ty6FwzpZfIGaCdXIY6viPWvN5XbwuqdkffdS3F8mAIloJ2KGvwd7zbv9fpO05E0FCAdolXYSdpRcj0GP1sMwI8m5+0Qp5nwEX8UM6JN5mtPAAbMc6k7uA6Eo5StD9SpcVXWP6osSJP6giBFtRI3YRXzNWtkBtQIuG5NsRZ4Ov+GT/pWHWbWsP7qXIfeOZI1rMPZGZSIuA9Ti5wQ2NsmPb+vQuQATtNwLIzdlufEQlWxn/yC1JCjI25DD4/QQMBedJFf18aF3+Q/69g5nde/s6nlf4YuMcztTIZ7skv1Zkc49Z4cW5Vm5tSCqH8RZcPxxYabU1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=54KeeU8HJFfsYwXVboxXR6Xc4hjO9B6+qdJbxV0vLAA=;
 b=VJfFDX/Jy1FTrcqmcU7AKvFMdJ8vmXt4IrFBt1406XZgoLpt8817XzTM6paVdEdXQG0nmp0gZOlj0cIJiudBymSc+kNZrW5/GEIoLtSweEK0IYhcgClp/DOwTzslhk71VohCePDCPxdcSeyM/Gd8cROPXyjm/znCCZiRZLlHo6TfifcShLwyJJQd0NsqZIK8DtVuysX7zMqWkNXArBK2DsiGuy0fxtNFxa5Tp7XG4mwvaBYqPSZ4+CUhySyXPeYNGvy/Jw/RO/msOY0REUofyJrj796qvX8Vt/bF4OMlEX9tagH/GDgVJaz0zgz7UBWyBSctZ0lBM0L1juLs/lMtig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 CHXPR11MB9627.namprd11.prod.outlook.com (2603:10b6:610:2f9::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.15; Mon, 7 Sep 2026 12:00:18 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::9086:5e0b:ad24:762]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::9086:5e0b:ad24:762%6]) with mapi id 15.21.0382.014; Mon, 7 Sep 2026
 12:00:18 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "j@metarealtyinc.ca" <j@metarealtyinc.ca>
CC: "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>, "Nikula, 
 Jani" <jani.nikula@intel.com>, "Manna, Animesh" <animesh.manna@intel.com>
Subject: Re: [PATCH v3] drm/i915/alpm: Add a quirk to keep the fast wake ahead
 of the IO buffer wake
Thread-Topic: [PATCH v3] drm/i915/alpm: Add a quirk to keep the fast wake
 ahead of the IO buffer wake
Thread-Index: AQHdPAZtF49PnFiACkOFn8CPBMwlJra+TpWAgAAdCoCABJ04AA==
Date: Mon, 7 Sep 2026 12:00:18 +0000
Message-ID: <503d08599513b0670130aae64fa22f2a1a8f18b4.camel@intel.com>
References: <20260903131724.49496-1-j@metarealtyinc.ca>
 <20260904004308.185788-1-j@metarealtyinc.ca>
 <20260904114835.483057-1-j@metarealtyinc.ca>
 <20260904133231.9028-1-j@metarealtyinc.ca>
In-Reply-To: <20260904133231.9028-1-j@metarealtyinc.ca>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|CHXPR11MB9627:EE_
x-ms-office365-filtering-correlation-id: 4520055a-25fb-48cf-188c-08df0cd795d2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|376014|10067099003|22082099003|18002099003|56012099006|11063799006|4143699003|38070700021;
x-microsoft-antispam-message-info: TnYz4wlfTnOSpyxF7XNpXWW3ttUqEKq/+G1ivFL25fhlRt/7TzVKNE1Uyp1nBcHYfWc8/kj7sut0UniJEnX+2vh5I00rKZ+mw55WfQ7N0NBMjVXw5pgbfY+NZvNuyk3vVx5KlJRLJ6pWJRS7JMSy1qYLJx3j9Xof4HIFJCY63anshoTKQ7uGRE63xs3EcIdk4xTtYG5JbzTD0oYQKEZ0AkKPGQTcWcZg1MeV0dplRW4bvr4/6EhlazEvzKpP18Kv06bW1xr3EGzR4bzrI3oQuNJQFymkVbPkFH38uNUz2I8NoQB0P4SHwYBSDVGKXsu0UUTwCSerrZLaFijMph+JoFPQh6RMkVwIf4mmCqSC/Q1UUIiU1iVppNCK2S0p6yva/c3Ld4vhj/8Ki+b1pMirh3tfA6uoMj4jRsx2crALDXQUFnJ/l+Nty3SDvbpsYsHMqFyIBGiQDpQR6lpRHrzmons70gjEBVRkJ3Aa0gGaAAwVYQgK2xp1QBh13Aq3CAILgNia2Dnx9JdGfIsU+AT5YJhZVI3RugiSBfRSmKg6h9YgYmHB4QwqeSFHVW1BnMBR+g3o9PVLB2qPUefxYbZbeIV9WqVsVOq377CfZSUOlaEKInnfoRX1d6ubasnQw+rt0Rhb8G90hSYtrajvLcJwGfW59KnYks7VZ92+ANMCLh0PD+Gq3x8A7DWM/mE+Nst7mBaPTME6ydDWU9ep9Luc4kNR9nzh+WnmXgAlcr+mVzU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(10067099003)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z2VxSWF2bXB6aVlzNXV3NEVrWG5MZlJnU0p6MHpBRCtQM3l0WGRqWXNsNUhW?=
 =?utf-8?B?ZXVPaStrQjhDcWp6WUlidUxjejlXSUx6MXlCcTRtRit4bUFWenVaazVtSS9h?=
 =?utf-8?B?UWNEdExPRlFGYzhydlY0U1R1STZ2MFNCVDc4ZGFFeTZnNnJ0eVFTT3MrWU56?=
 =?utf-8?B?MVpxT3hYRm51WWQwb0JMZ1ZvN0xpYVFhcjM1T3pYQ2krQW9VdDhrajJjVUl4?=
 =?utf-8?B?VGhxSUdwN01CZThLc01oblFpU1FBa0VwMnZlTWIxQlVKN05zYjFzdkZSVG9C?=
 =?utf-8?B?VmZWM3hVRCtZTjlBMU9YY3c2WG1jQnJ0c1V4Y2lMTjM3TlZ6WVozT0ZIS1ZX?=
 =?utf-8?B?SHJ0N0xjajZaUlJaYUZPUTBWRHdyMkNRNDNsMHptZW5lQkE5S01XMzVqbnpZ?=
 =?utf-8?B?MTR4WGNLdDEydUx4R295Y3F2QkJ4QmFwNkVBeUlmVU8xYXhpUERCbklVd0g4?=
 =?utf-8?B?QlRiaUgzSUpDcHRnZ2xTL01JVG9QVHJWbkxERWY5N1NHZE80aEF6RDdOeURJ?=
 =?utf-8?B?OXQ5ZXNvMVpZeCt4eWxHWjBwQlV5R2czRUozcUk5QUxIRjhqbkZPTVpoT2c0?=
 =?utf-8?B?N1hHdGEvdzhFRlVDYWs2SUwxdkRjTGdLcEttcGJERWs4ekkrUDFnc0hDam4x?=
 =?utf-8?B?anMxREhNSUdFSWI1UWJYSzVudk1lQzgzTzBTWStOWVBqdHljc0o0UmFVSCt1?=
 =?utf-8?B?QUhzajE1UGFrSko4c05EbkgxVGRjblhML3Q4d3JxL0c5YVJvd0VrZWplYmhR?=
 =?utf-8?B?SHlBV0FKSkhtTmg0SklIT01Hdyt4MFVSaU11ejZobFViQXB5SEkwTjJTa3Bj?=
 =?utf-8?B?SGY0cDBBVExYU0hJR3psb0ZibC92dFhVSzhONzZWL1B0eDBHcnhrbUsvdHY1?=
 =?utf-8?B?dFNjYldERlRZTWFtVTczdllBak1CWDUza1JlcldSNlV0YjlmL3hYWUt0SzJh?=
 =?utf-8?B?MVRYYjNxYzhDb1ZLdTB3VWdNTm1nZ2dBNnY0T3Z6bnkxek5MMDZUN1lxZEFB?=
 =?utf-8?B?NXJsbXRnSzIzMnlzd25DZjNyZXJ2NWczd3dkWDFVaHo1QnoxVFFkRS9uZVFn?=
 =?utf-8?B?MTZuMHlqTWN4NC92c1FURXNCd05TSDgwMHJNR3RvRDdxMjVqbGxobHZ0a2Q4?=
 =?utf-8?B?RmQ3VGxyTzFERXc4ZkFoMEFIMU1JYUdURjEwMlZqOXNTZXJzOU1FUjZTa2Mw?=
 =?utf-8?B?SFNOREJaalg2cklScWpQTHpSR09JbWJBcUVoS0ZxbVhuTC9RRGkwdWkxTUZ3?=
 =?utf-8?B?MlhXZGoxY2dZdENZRmxpTm5Xa05aV1ltTXB4WEJHeityZHowV2UrSC9xNG9y?=
 =?utf-8?B?bUVyamxHcldod3QrNTcyTkdLcE9CV0RSUU4rN0ZEc2dtMU1wd0FWQTZaSjVJ?=
 =?utf-8?B?eGhUc0xYdXB5ajFBelVXQ0J3K2JJMmV0Y0MxTVpSTmM1bVdTS3drTVBVY3JL?=
 =?utf-8?B?RWV6ZEtPdWlxZHF0R0V4NWt3bm9HdXBONEUyVkViS3d5cm1YVk9wMlFROTNW?=
 =?utf-8?B?dkpRZC8yYmc0NTZVelFObDdsRk5aS0VqYzFUUUVZQ0pyVlNrckU1STNJeEN3?=
 =?utf-8?B?TmZmOENyRldxUy83WHZraE81Ty9JaktqL0xtcCtGUVA1TnpMNjVYWjBCTzIx?=
 =?utf-8?B?NjlFcGNjc1g0RE1wV3hZMytzNC9OclI3eEo3QUQrLzhtTGdzYkM2VXJDemFk?=
 =?utf-8?B?MytmTUhwRE1MYWpZOWJpNnJIakZWN0ludkZTU296cEg5N3cxNVEvanRlOVkx?=
 =?utf-8?B?dEVSSE1EN2dsZGk4amY1eHNETEZNazZ4RkdoQVB1YkNIdTV1UTkzTWpPb1hM?=
 =?utf-8?B?RytTNVBydnNxQjhDZy9QTmVVT0VMeHdURk8zZGc4MnJEQlViZ0tBamxleGtw?=
 =?utf-8?B?aC9XNzIydys2amdQWUc3T2ZVU2E4S0RaVUlTalNUVFVaRTFrcTZ0Tjd1ZDI0?=
 =?utf-8?B?enJTeXd6YXBJdGF2RHBVTG5hRmkvaFNxWXNLRWxhTVJYdnZRYkwySEl3czlU?=
 =?utf-8?B?OEI1MWV1WmlWZStXd0hkREpndFlRUXdkRFJMUVJXUGR0c1RZL2NWRnNPQ1pZ?=
 =?utf-8?B?QTBDV3gydmlnRE95OHIwMlVmUHBHcFRMWVpaZkJiWXYwRlJvaTJLajhSUERX?=
 =?utf-8?B?SHc4ajBIV1g5dGtFcnR3RTZpSEZZOVVQZXM0ckltMzJWWEFzWndBd3Z3aUE0?=
 =?utf-8?B?dGpGdm1hQjJmMjBwNDVjKzZtYUZEQVR3UnQzdXh3Nm80YmhaWk1yZk56U0M2?=
 =?utf-8?B?ajl6Q0tUditPa2VONDdHWFBOcWNCUXNhME1yUFRHWEgrZGVURFlzbCtoOVN0?=
 =?utf-8?B?aCtYaGh1WjBZVEJsMDFVZ0M3RDVYZ2JWVWw2VFRhU0JxQWVyVkRRRXZxK1B5?=
 =?utf-8?Q?Ll9PwAaC1wY07PsA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FDC9FFD638296147AD030F42CD178624@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: vHF76pzMrshSAI9eBqNXawNVrgLfNYt8hFVWNuD2izWCCh4c8HZgxglN0TpNtWGeVP4GMzsqbzktwWggEyZctXb4k9ZfqjvQ9CXx77706xFhLjIL9cb0UlUwXi+dxbO024HyHtNbIrNaPwa+zqSHl3UK8tu+rrp1zgWi2Vr/fuQEBbmE5xORGc1UQzuHdadaH/Rd5KIgwlzdiR1xGO6NO03wz4FzEjFbHUOhMl0+FGDP7lPrHIA8BuLjALC85NkmZFTmHHta21qAw5hwrrRbjB8RbJAExT6OKfJBxK5tTp3GPnwDXfiqQb9scNQOElzr/SMYmtuY3SV0csGQWCsIrA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4520055a-25fb-48cf-188c-08df0cd795d2
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Sep 2026 12:00:18.0571 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MovXBLLFQKYMa7Y3Ytx8QuUOOv29y+cZvmdfel3gVmqf6INWctQP67gxH1c7QWDfmc2CqeY5t3BRD5GAoZofiPGhJ1YaascIltdpztao+pM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CHXPR11MB9627
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

T24gRnJpLCAyMDI2LTA5LTA0IGF0IDA5OjMyIC0wNDAwLCBKYWtlIFN0ZWlubWFuIHdyb3RlOg0K
PiBPbiBGcmksIDIwMjYtMDktMDQgSm91bmkgSMO2Z2FuZGVyIHdyb3RlOg0KPiA+IEkgdGhpbmsg
UFNSMiB3YXMgd29ya2luZyBvbiB0aGF0IHNldHVwIGF0IHRoZSBwb2ludCB3aGVuIEkNCj4gPiBp
bnRyb2R1Y2VkDQo+ID4gdGhhdCBxdWlyaw0KPiA+IC4uLg0KPiA+IE1heWJlIHRoaXMgaXMgYWN0
dWFsbHkgbWF0dGVyIG9mIGJpc2VjdGlvbj8NCj4gDQo+IENoZWNrZWQgdGhhdCB0b2RheSB3aXRo
IGEgcHJvYmUgdGhhdCBvbmx5IHBvbGxzIHRoZSBzaW5rICgweDIwMDYsDQo+IDB4MjAwOCwgMHgy
MDBhIGV2ZXJ5IDIwMCBtcywgZXJyb3IgYml0IGNsZWFyZWQgYWZ0ZXIgZWFjaCByZWFkKSwgc28N
Cj4gaXQNCj4gcnVucyB0aGUgc2FtZSBvbiBhbnkga2VybmVsOg0KPiANCj4gwqAgc3RvY2sgNy4y
LjIsIGlvL2Zhc3QgMTEvMTE6wqDCoMKgIENSQyBlcnJvciByZS1sYXRjaGVkIG9uIGV2ZXJ5IHBv
bGwsDQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgMHgyMDA4ID0gMyB0aHJvdWdob3V0LA0KPiDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDB4MjAwYSBz
aG93cyBTVV9WQUxJRCBpbiAyIG9mIDk0DQo+IHBvbGxzDQo+IMKgIDcuMy1yYzEsIGlvL2Zhc3Qg
MTEvMTE6wqDCoMKgwqDCoMKgwqAgc2FtZSwgU1VfVkFMSUQgaW4gNyBvZiA5MCBwb2xscw0KPiDC
oCA3LjMtcmMxLCBpby9mYXN0IDExLzEyOsKgwqDCoMKgwqDCoMKgIG5vIENSQyBlcnJvcnMsIDB4
MjAwOCA9IDIsDQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgU1VfVkFMSUQgbmV2ZXINCj4gDQo+IFNvIHdoYXQgbG9va3Mg
bGlrZSBQU1IyIHdvcmtpbmcgaXMgdGhlIGxpbmsgZmFpbGluZyBvbiBldmVyeSB3YWtlIGFuZA0K
PiB0aGUgZW5naW5lIHJlLWVudGVyaW5nIG92ZXIgYW5kIG92ZXIuIEVhY2ggcmUtZW50cnkgZG9l
cyBpdHMgdHdvDQo+IGVudHJ5DQo+IGNhcHR1cmVzLCB0aG9zZSBjYXJyeSBTVV9WQUxJRCwgdGhl
biB0aGUgZW5naW5lIHBhcmtzIGluIFNVX1NUQU5EQlkNCj4gdW50aWwgdGhlIG5leHQgZmFpbGVk
IHdha2UgcmVzZXRzIGl0LiBTY3JlZW4gdXBkYXRlcyBjb21lIGZyb20gdGhlDQo+IHJlc3luY3Ms
IG5vdCBmcm9tIHNlbGVjdGl2ZSB1cGRhdGVzLiBXaXRoIHRoZSB3YWtlIGNsZWFuIHRoZXJlIGFy
ZSBubw0KPiByZXN5bmNzIGFuZCB0aGUgcGFuZWwgc3RheXMgb24gdGhlIHN0YWxlIGZyYW1lLg0K
PiANCj4gSSBkb3VidCBiaXNlY3RpbmcgZmluZHMgYW55dGhpbmcgZm9yIFBTUjI6IGl0IHdhcyBp
biB0aGlzIHN0YXRlIGluDQo+IEFwcmlsIHRvbyB1bmxlc3MgdGhlIHdha2UgZm9ybXVsYXMgd2Vy
ZSBkaWZmZXJlbnQgdGhlbiwgYW5kDQo+IGludGVsX2FscG0uYyBoYXMgZm91ciBjb21taXRzIHNp
bmNlIE1hcmNoLCBub25lIHRvdWNoaW5nIHRoZW0uIFBhbmVsDQo+IFJlcGxheSB1c2VzIHRoZSBh
dXgtbGVzcyB3YWtlLCB3aGljaCBkb2VzIG5vdCBmYWlsLCBzbyBpdCBmcm96ZQ0KPiBvdXRyaWdo
dCBmcm9tIHRoZSBzdGFydC4gVGhhdCBpcyB0aGUgcXVpcmsuDQo+IA0KPiBQcm9iZSBzY3JpcHQg
YW5kIGxvZ3MgYXJlIG9uIDkxMTkuDQoNCklzIFBTUjIgd29ya2luZyBvbiB5b3VyIHNldHVwIHdp
dGggdGhpcyBxdWlyaz8NCg0KQlIsDQpKb3VuaSBIw7ZnYW5kZXINCg0KPiANCj4gSmFrZQ0KDQo=
