Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E425CD5BDE
	for <intel-xe@archiver.kernel.org>; Wed, 27 May 2026 05:54:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEBED10E236;
	Wed, 27 May 2026 05:54:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZxeDZ1ea";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF12410E236
 for <intel-xe@lists.freedesktop.org>; Wed, 27 May 2026 05:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779861297; x=1811397297;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=FvxPsL+Wbi+Pl0Ol8K/yG/87Ap53AUFaYStQMjeVpLs=;
 b=ZxeDZ1ea2SI55s3CMopa+uZbE5Ukw0cZ+p9YaIKvwP6gu+DudK7z0O2T
 tk+UPvFTR3F3qT9/0d5mtjndt34nx/cTbZS00ZVIgKgxcXatzgLu8V0kj
 ujTnNDWGaETRuASg6iHjokDiZRVoKRuVwnqf1GW42qxTeiaRRX6fz4/JF
 0LB+nL9nItIQhJ2R0INuMnMSH4DzG+EDZ6V7MyX+E9UUZILRETzjsCw5M
 MnY8qQZCPjDlIjac+rJlH1SswBrs14G9SXYuvBkd/4xq1RogrDMEpiMCV
 VgNhVaF4+YwKtZ5zGrCcL90fV7aTHCimjjzWx/b16KvsDE5inPV2MR3EQ g==;
X-CSE-ConnectionGUID: wIxArrJlQZmw9syhHAIhDw==
X-CSE-MsgGUID: Ug5yJ/QnSXOwLkji94HPZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="91373947"
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; d="scan'208";a="91373947"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 22:54:56 -0700
X-CSE-ConnectionGUID: gqdTHQ1SRu2YvsR0mJYLCg==
X-CSE-MsgGUID: v9TMjgGoQomFaZMb6a1ZgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; d="scan'208";a="242204575"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 22:54:56 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 26 May 2026 22:54:56 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 26 May 2026 22:54:56 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.69) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 26 May 2026 22:54:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f2gQQPETEBUVFSKTYEQfCRRpgPqkZGjHOpG7C8Bz8i1wA//NtGNsFvV5drheeJKPuDD+a6qbSx8gstl+D7qnvKzTZTDCMByw0TKgsswf9vV3rtMP9TJ3Htu9Hscmd+uctp3SaeXY3+4KJBUzJg9BhNMJNzjuWOlAtO0hiXra8LNc5upMr0P417qyT8Px9swV9QjFU7UZJOth8doq259dijWzOd+m20pJ67kpJfwepnuXZK59xhp6RjGJ6B+V2gg4VeBmiLz4WXn/VRlndoE+W373o+6jK8J/DTNAndCd63lRJEkAL1AQVQ/EXnaH6+9scVcO4IlqQYSMqIjyJzkDQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FvxPsL+Wbi+Pl0Ol8K/yG/87Ap53AUFaYStQMjeVpLs=;
 b=VlR2vXbX4ovYhPGTY4++xJB/dwl1trem1NpzvCjSj5Ux3Ci0AA7o2WF2wEfsYp5vU4bR5nIIAZ8U7qKgScEKaM+K8ORhidP4OaZTckCoW8hZOgxzrdzo5vF5vYwsosJwRtIcXJwkwlUtxcTKsVghEtiaFeRiw6eULmz/dy2i9r9G8LKT82ZqmT9JdYo4VRZYPf35DOiFCRygqs4uBW0HHSOT093oMROFlEmuXeX8RQrQ8wuJc0Rjd3psS78FIQbfRQPl+vdWYYyXcTZ0hJenlU5rx+2zsLDXqxnuZz1Na662U7ruGKEPUQ187nf4ycb15FNwp5ieGoWgcS8CncDS9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5525.namprd11.prod.outlook.com (2603:10b6:208:31f::10)
 by DM3PPF1939049CF.namprd11.prod.outlook.com (2603:10b6:f:fc00::f0b)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Wed, 27 May
 2026 05:54:49 +0000
Received: from BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::7181:6f6e:ae0e:3a4a]) by BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::7181:6f6e:ae0e:3a4a%7]) with mapi id 15.21.0071.011; Wed, 27 May 2026
 05:54:49 +0000
From: "Gurram, Pravalika" <pravalika.gurram@intel.com>
To: "Gote, Nitin R" <nitin.r.gote@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Auld, Matthew" <matthew.auld@intel.com>, "Muqthyar Ahmed, Syed Abdul"
 <syed.abdul.muqthyar.ahmed@intel.com>
Subject: RE: [PATCH v1] drm/xe: Fix decompress validation in
 vm_bind_ioctl_check_args
Thread-Topic: [PATCH v1] drm/xe: Fix decompress validation in
 vm_bind_ioctl_check_args
Thread-Index: AQHc6/6+Etcsdr0c8kGkh9fiAYVqAbYeREQAgAMd6PA=
Date: Wed, 27 May 2026 05:54:49 +0000
Message-ID: <BL1PR11MB552561D8176E9CBB81E290D384082@BL1PR11MB5525.namprd11.prod.outlook.com>
References: <20260525044239.83893-1-pravalika.gurram@intel.com>
 <SA3PR11MB811814B5E1EDA1E26E56020ED00A2@SA3PR11MB8118.namprd11.prod.outlook.com>
In-Reply-To: <SA3PR11MB811814B5E1EDA1E26E56020ED00A2@SA3PR11MB8118.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5525:EE_|DM3PPF1939049CF:EE_
x-ms-office365-filtering-correlation-id: d7f621c3-638f-4f8c-e142-08debbb47693
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|38070700021|4143699003|11063799006|56012099006|22082099003|18002099003;
x-microsoft-antispam-message-info: Z3DH5UYSZSIFOEyYU5zNYUF/b5g0aTWXppA3aYtM5R/woHXvQuoORyxnsBBTsdazmqCGe6VhQHh0Oiw7ifmhBCD5MldIqqd3bNGkcfCpRzhOvB8gFdJe6SZj4Ev+lnNygrkUvecONHSSF5l5DJnVH4tbMlz5QBMOWmklhy8VWMTqgt7iwdQwgZwNmF6U+FPRiiO8vGFgNMBOwPrbhN38E0ywhlMJv2r/mXvqdHaVNQaJzdmtXWcvVb07cPzO95TP3W8rtrsHsyPu7kjHrXuxBoJU7VMDVeNzxKi5vR1bKGBFczOk5P7ptYUQgIdlKLYjCgVURBy4ovJC54Xa+hflHaV+M13WFVOosSN/MHNoJ3yUydb+Hpp4/xRUzhCjVuXxO0iJauMqjrSpnEC6pAlolMZSjeC/kXPggZsRusD3aIS4JB3o817y+ZnYlRBfckqqFFpAKxrasPC9fl/nacDJ4QDJaZH5sADIZAVvr0YXTdVUqVXlW45wt6BQ1b7jG2RApoYCRSIlcPPLDC/pPFGG9meuxb6qzhQ2qAD8cpS5rPUe8hHUCvzShPvb6+0wj3rCiRxiX9Wv58EuXBAD4s1DkaREycOiNV1cdTcrjzF7incpJV7mptcao2rSD+IVi/3IflAVYJ498tNhUs6Yk+zcDqTxJ9AbQWRXZoigJLKky703rwC0WqQ2FVgKWbRWjUYppXmM9VQ1UFwFMMn1dxZXtDjzoRMNRM+FcEfn1oZTtAJ8mIqBRAPa1Cu7tFV25SGo
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5525.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(4143699003)(11063799006)(56012099006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cW56ajd1cmk2YzQ4MENES3BjUnQ2VVZzek1ESjhWUThBcHBZVVFoQkFCT3Y2?=
 =?utf-8?B?WW15UnU0U01XZURqaHhaaEI4YmYxS3ZYTlN1OC9DTVZYa1hYVDVIQ253TnVC?=
 =?utf-8?B?ZXRqdlN6VGdnZTBIL256azZFbjVSM1BtcDF5WndPeVJqek02SWxBa2NXazZs?=
 =?utf-8?B?Slh1QVkxdUpyU21NLy9mdHh1RUw0RWkyZWtLL0tTTHVrdE9KTnN3Y2hyMTA4?=
 =?utf-8?B?RzE4NndEQlJ2MlRkamZTZjVBR0tScGZNZEZSUXNVbDgyS0ZRTENXbk85T1hq?=
 =?utf-8?B?SlV2WE1HYW9OMUZyak9ma2F4UGVSZUc5TnR0cDZFS1ljNldUV2RLcHg0Z3kw?=
 =?utf-8?B?cWlUVHZZKzQxdGZ0R2xUUEhhVFo5UG1UU3Flb29vRDJXeWVyY3F2U3hoR25o?=
 =?utf-8?B?dFFFQ3ZJcHVoTm5CRGF3YUJyOHpPaWdrbDIvVzI1SXkzZjRraTl0NnhPMURq?=
 =?utf-8?B?a3FtZlZXMStFb1VNMkNDNkwrVU1tMC9RUjYxNEMzSkhXdVFHZEJKUE1XdzEw?=
 =?utf-8?B?d1dxbjhMOG1hZGVkN3JUYmxvcTk5YzVSck11ZzJxbXJwVW9hNjR1blhNRllX?=
 =?utf-8?B?LzhmQWZrQitZbmVaVXZ2VlY5aU9JclI2emlmcENTc1VwaU4wUWNjWXFoU1l3?=
 =?utf-8?B?cWpPbmdzMndTOVYvNjBPMmlWVkVjYTNHS29NOVhMSmJuMDY4bXl6azUyY00v?=
 =?utf-8?B?QWpXS3M5ZklWbndiSVh6WEpWUTJTYWpqQ0NqazJoenk2MnZFRlFxaE1qdEdZ?=
 =?utf-8?B?dEdOcWx4YVYyc2RoeWpDTmtCU1N6eGdxbS90NUVtT2tia25WeFNNb3pJQTdN?=
 =?utf-8?B?Unl6Sjk1eUI2NEFSSTMyNHJkM3FzTnp6LzBEeG1PSTFTS09BcTJvbFR1eGJ4?=
 =?utf-8?B?U3ZiUHRyY2tBWGZSbUsxZUlmWEJXZXlvNkkrVDNKeHNsQWJ5SkpZQ3NNdFFV?=
 =?utf-8?B?ZTA1ZEVlWmltTGlsYXFPcGRlTXFEM2tsZlJ3YUxkNGNvQ0ZCYkV6VGVGTlRC?=
 =?utf-8?B?Nys0YzJDR212aTlyRUMzc3RDSXUwZWZjcUE2RlczWXNXcWcvWU8xa3AwN2JR?=
 =?utf-8?B?MHI2Wkw3UzBsdU51REl6RDVVVkFlS2wwY0h4bGVNTnV3cEZycFNzSG9oaFU0?=
 =?utf-8?B?MWFSdGxFaVh5R3cvaTRjQ2JtUkI4eThWTE1YdDdtVVNKQklUVDlDNVVHbUNi?=
 =?utf-8?B?YXYxSTFSTnFvYk4yVHhjYmNHeUJVUXIwemY1bEg2NWFISDJqSEVTWjFzdWVz?=
 =?utf-8?B?NkNQcVBWKzh0K1ZUK2t0SlZ4MjU3eUFUWFdiUEhMZWN3dWRJU3NOcVIzMWFv?=
 =?utf-8?B?ekdvUmMzOUpJZkNjcVJhZU8rTTU3U0RlamJjZnRyTm91Y0RwTnhEUjhTWVEx?=
 =?utf-8?B?RTFKdlhwM2thZ2M4bkhHUXovdjQ4ZFFZWU12MjlHUTZQUE16TkJ4WjhjL1o3?=
 =?utf-8?B?UUgyWkNwRVVKeGxhL1FJeWFYMmFuT05Vbm1jaFVUZUJrdGJkaUQ3Y2ttMVlL?=
 =?utf-8?B?bkM2QWtUb29DR3hkUGgwTjQ2QmtWeEw0L1Y2aUVEZ0J4N3ppOU9zVDRUU3NH?=
 =?utf-8?B?UjloY3BrZDNzRFN6cDV2WGpPclRjOExsVEJnNDF1S3JpU2dXVDE4MzBtKzAw?=
 =?utf-8?B?L1EyL003OFFpZFRtcEFVaFBFSHR5VzZJajhlNUVxZWw0U2oxcE42T095Nllw?=
 =?utf-8?B?SE1lMlQwc2dUWkR0aXdHN0ltT0lLR2hHZ2pxRXF3dUtZa3huZlRjQzcxQjc4?=
 =?utf-8?B?YWpjSTQ1RFZDVWpKbStEcFkrT0RGZkZyV2Vnb3YzR3hRVEFLTzRBTG1MSXl0?=
 =?utf-8?B?RU0zVDQ0MDlpUXZlZGxxSUlRd0ErS2ZFcE80ZzhjdmZzME1GOTRnbGI2eVdK?=
 =?utf-8?B?ZDZkWm8rUitBZHBranRPTkx1ZWVDRVNCdE5iVzdVY3B5R3ZFY0lmbGtqdFhi?=
 =?utf-8?B?QUxTaFlmZ0l1YTBKU0pVM2JWUUkzS3BLTUswQWpyTm1WWjVuUjdZRGtGamVR?=
 =?utf-8?B?S241NU9CKzRXZFFKTFNOdmovVkdhRDJjTVBYRWZYZVVVdTZBOGRmMjQyVGhE?=
 =?utf-8?B?YXVBY3FTWUE1dDdEOE5MV3NaUE5yQVcrUTlSNU1rZ2J6L08wMXBpeFJVQTIy?=
 =?utf-8?B?K0FJOFFZM2dYYkFxSzNlblFreFhWL3lORU1uQ0g5RmErUi9pTVBwT0xXdm9v?=
 =?utf-8?B?M3RXMXZRdW9BeGkzZEQwVlVNUmlxLzJ3V3BjdmlueHljb1F2ck5QaThOWVZz?=
 =?utf-8?B?eWM3S0xEeCt2YlNXdHJTclcxYW56YlFhcEpCOHU3VkgvSUpiOWNhRDViZ05J?=
 =?utf-8?B?UkxvazZKQnhrUCtlU2RSY01XeTV2MFhPeWpPUkYxQUFPUFVSYWF3Zz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Mxx5qnHJZNgYBIs74V4CgVXYW4biRuhFC2tsMh2Nxd4pc273EV21OsVky/CjqhaKmRL8HCGlT/qRXcbUfHwiYOX9XEGAr3yQr8brwLj6n/J4drqj6G9gEk/3FCKcuH4cU1S5E915BmrmLJJhrgLnvNSBpPxKknOXI7kijqm2j6KLyFNIL47Ajmblfnpnht1+dKH53ysa6iCDYVOnHdVYR38HhID+mdfdTzrchlpCk6PeOfJ+tLr3UrRrQVoIEEyTbpFtvfuEgvmlb9g0K7jir9ZS8CU6tqE5DqZp7fx1SMKKCEU6Q7XbNvprJ4gXMTXRIxesQwVI64X3WmvLmT4tTA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5525.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7f621c3-638f-4f8c-e142-08debbb47693
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 May 2026 05:54:49.1030 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Z6hfAEwDhNW5SCT9uk2dBqsaszLtjC3vmckgZWR2W/UuoCxJw49xG9E73tPspErAsipD5w+D/801vMSfpQKV1BqAAQy6+sgmA3izgyaP9QM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF1939049CF
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR290ZSwgTml0aW4gUiA8
bml0aW4uci5nb3RlQGludGVsLmNvbT4NCj4gU2VudDogTW9uZGF5LCAyNSBNYXksIDIwMjYgMTE6
NDcgQU0NCj4gVG86IEd1cnJhbSwgUHJhdmFsaWthIDxwcmF2YWxpa2EuZ3VycmFtQGludGVsLmNv
bT47IGludGVsLQ0KPiB4ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6IEF1bGQsIE1hdHRo
ZXcgPG1hdHRoZXcuYXVsZEBpbnRlbC5jb20+OyBNdXF0aHlhciBBaG1lZCwgU3llZA0KPiBBYmR1
bCA8c3llZC5hYmR1bC5tdXF0aHlhci5haG1lZEBpbnRlbC5jb20+DQo+IFN1YmplY3Q6IFJFOiBb
UEFUQ0ggdjFdIGRybS94ZTogRml4IGRlY29tcHJlc3MgdmFsaWRhdGlvbiBpbg0KPiB2bV9iaW5k
X2lvY3RsX2NoZWNrX2FyZ3MNCj4gDQo+IEhpLA0KPiANCj4gPiAtLS0tLU9yaWdpbmFsIE1lc3Nh
Z2UtLS0tLQ0KPiA+IEZyb206IEd1cnJhbSwgUHJhdmFsaWthIDxwcmF2YWxpa2EuZ3VycmFtQGlu
dGVsLmNvbT4NCj4gPiBTZW50OiBNb25kYXksIE1heSAyNSwgMjAyNiAxMDoxMyBBTQ0KPiA+IFRv
OiBpbnRlbC14ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gPiBDYzogR3VycmFtLCBQcmF2YWxp
a2EgPHByYXZhbGlrYS5ndXJyYW1AaW50ZWwuY29tPjsgR290ZSwgTml0aW4gUg0KPiA+IDxuaXRp
bi5yLmdvdGVAaW50ZWwuY29tPg0KPiA+IFN1YmplY3Q6IFtQQVRDSCB2MV0gZHJtL3hlOiBGaXgg
ZGVjb21wcmVzcyB2YWxpZGF0aW9uIGluDQo+ID4gdm1fYmluZF9pb2N0bF9jaGVja19hcmdzDQo+
ID4NCj4gPiBUaGUgdmFsaWRhdGlvbiBsb2dpYyBmb3IgZGVjb21wcmVzcyBvcGVyYXRpb25zIHdh
cyBpbnZlcnRlZC4gSXQgd2FzDQo+ID4gYWxsb3dpbmcgZGVjb21wcmVzcyB0byBoYXBwZW4gZXZl
biB3aGVuIGNvbXByZXNzaW9uIHN1cHBvcnQgd2Fzbid0DQo+ID4gZW5hYmxlZCBpbiB0aGUgUEFU
IGluZGV4LCB3aGljaCBjYXVzZWQgdGhlIEdQVSB0byB0cnkgZGVjb21wcmVzc2luZw0KPiB1bmNv
bXByZXNzZWQgZGF0YS4NCj4gPg0KPiA+IE1pc3NpbmcgbmVnYXRpb24gb3BlcmF0b3IgKCEpIHdh
cyB0aGUgY3VscHJpdC4gTm93IGl0IHByb3Blcmx5IHJlamVjdHMNCj4gPiBkZWNvbXByZXNzIHdo
ZW4gY29tcHJlc3Npb24gaXNuJ3QgYXZhaWxhYmxlOg0KPiA+IC0gaXNfZGVjb21wcmVzcz0xICsg
Y29tcF9lbj0wIOKGkiBSRUpFQ1QgKHdhcyBhbGxvd2luZyBiZWZvcmUpDQo+ID4gLSBpc19kZWNv
bXByZXNzPTEgKyBjb21wX2VuPTEg4oaSIEFMTE9XDQo+ID4NCj4gPiBUaGlzIGZpeGVzIHRoZSBl
eGVjIHF1ZXVlIHJlc2V0IHN0b3JtcyB3ZSB3ZXJlIHNlZWluZyBkdXJpbmcgVk0gYmluZCBvcHMu
DQo+ID4NCj4gPiBGaXhlczogMmI0ODQ0MTk3MDBhICgiZHJtL3hlOiBpbXBsZW1lbnQgVk1fQklO
RCBkZWNvbXByZXNzaW9uIGluDQo+ID4gdm1fYmluZF9pb2N0bCIpDQo+ID4NCj4gPiBDYzogTml0
aW4gR290ZSA8bml0aW4uci5nb3RlQGludGVsLmNvbT4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBQcmF2
YWxpa2EgR3VycmFtIDxwcmF2YWxpa2EuZ3VycmFtQGludGVsLmNvbT4NCj4gPiAtLS0NCj4gPiAg
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX3ZtLmMgfCAyICstDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS94ZS94ZV92bS5jIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3ZtLmMNCj4gPiBp
bmRleA0KPiA+IGIwMWYzMWVkNDQxNy4uNzU4MTM4ZGJjYzkwIDEwMDY0NA0KPiA+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS94ZS94ZV92bS5jDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hl
X3ZtLmMNCj4gPiBAQCAtMzY3Nyw3ICszNjc3LDcgQEAgc3RhdGljIGludCB2bV9iaW5kX2lvY3Rs
X2NoZWNrX2FyZ3Moc3RydWN0DQo+ID4geGVfZGV2aWNlICp4ZSwgc3RydWN0IHhlX3ZtICp2bSwN
Cj4gPiAgCQkgICAgWEVfSU9DVExfREJHKHhlLCBvcCAhPSBEUk1fWEVfVk1fQklORF9PUF9NQVAg
JiYNCj4gPiAgCQkJCSAoaXNfZGVjb21wcmVzcyB8fCBpc19udWxsIHx8DQo+ID4gaXNfY3B1X2Fk
ZHJfbWlycm9yKSkgfHwNCj4gPiAgCQkgICAgWEVfSU9DVExfREJHKHhlLCBpc19kZWNvbXByZXNz
ICYmDQo+ID4gLQkJCQkgeGVfcGF0X2luZGV4X2dldF9jb21wX2VuKHhlLCBwYXRfaW5kZXgpKQ0K
PiB8fA0KPiA+ICsJCQkJICF4ZV9wYXRfaW5kZXhfZ2V0X2NvbXBfZW4oeGUsIHBhdF9pbmRleCkp
DQo+IHx8DQo+IA0KPiBUaGlzIHBhdGNoIGludmVydHMgdGhlIHZhbGlkYXRpb24gbG9naWMgaW5j
b3JyZWN0bHkuDQo+IA0KPiBUaGUgY3VycmVudCBjb2RlIGlzIGNvcnJlY3QgYXMtaXM6DQo+IA0K
PiAgICAgWEVfSU9DVExfREJHKHhlLCBpc19kZWNvbXByZXNzICYmDQo+ICAgICAgICAgICAgICAg
ICAgeGVfcGF0X2luZGV4X2dldF9jb21wX2VuKHhlLCBwYXRfaW5kZXgpKQ0KPiANCj4gWEVfSU9D
VExfREJHKCkgcmVqZWN0cyAocmV0dXJucyAtRUlOVkFMKSB3aGVuIGl0cyBjb25kaXRpb24gZXZh
bHVhdGVzIHRvDQo+IHRydWUuIHhlX3BhdF9pbmRleF9nZXRfY29tcF9lbigpIHJldHVybnMgdHJ1
ZSB3aGVuIFhFMl9DT01QX0VOIChiaXQgOSkgaXMNCj4gU0VUIGluIHRoZSBQQVQgZW50cnksIG1l
YW5pbmcgY29tcHJlc3Npb24gaXMgZW5hYmxlZCBmb3IgdGhhdCBwYXRfaW5kZXguDQo+IA0KPiBT
byB0aGUgY3VycmVudCBsb2dpYyBpczoNCj4gICAtIGlzX2RlY29tcHJlc3M9MSArIGNvbXBfZW49
MSAoY29tcHJlc3NlZCBQQVQpIOKGkiBSRUpFQ1QgCSAgICAoQ29ycmVjdCkNCj4gICAtIGlzX2Rl
Y29tcHJlc3M9MSArIGNvbXBfZW49MCAodW5jb21wcmVzc2VkIFBBVCkg4oaSIEFMTE9XICAgKENv
cmVjdCkNCj4gDQo+IFRoaXMgaXMgdGhlIGNvcnJlY3QgYmVoYXZpb3IuIFRoZSBERUNPTVBSRVNT
IGZsYWcncyAgcmVxdWlyZXMgdGhlIHVzZXItDQo+IHN1cHBsaWVkIHBhdF9pbmRleCB0byBzZWxl
Y3QgYSAibm8tY29tcHJlc3Npb24iIFBBVCBlbnRyeS4NCj4gVGhlIEtNRCBpbnRlcm5hbGx5IHVz
ZXMgdGhlIGNvbXByZXNzaW9uIFBBVCBpbiB4ZV9taWdyYXRlX3Jlc29sdmUoKSBmb3IgdGhlDQo+
IEJDUyBpbi1wbGFjZSBjb3B5IChyZWFkcyBjb21wcmVzc2VkLCB3cml0ZXMgdW5jb21wcmVzc2Vk
KS4NCj4gVGhlIGZpbmFsIG1hcHBpbmcgdGhlbiB1c2VzIHRoZSB1c2VyJ3MgdW5jb21wcmVzc2Vk
IHBhdF9pbmRleC4NCj4gDQo+IFdpdGggeW91ciBwcm9wb3NlZCBjaGFuZ2UgKCF4ZV9wYXRfaW5k
ZXhfZ2V0X2NvbXBfZW4pLCB0aGUgbG9naWMNCj4gYmVjb21lczoNCj4gICAtIGlzX2RlY29tcHJl
c3M9MSArIGNvbXBfZW49MCAodW5jb21wcmVzc2VkIFBBVCkg4oaSIFJFSkVDVCAgKEluY29ycmVj
dCkNCj4gICAtIGlzX2RlY29tcHJlc3M9MSArIGNvbXBfZW49MSAoY29tcHJlc3NlZCBQQVQpIOKG
kiBBTExPVwkgKEluY29ycmVjdCkNCj4gDQo+IFRoaXMgd291bGQgcmVqZWN0IHZhbGlkIHVzZXJz
cGFjZSByZXF1ZXN0cyAoTkVPL0NvbXB1dGUgUnVudGltZSBwYXNzZXMgYW4NCj4gdW5jb21wcmVz
c2VkIHBhdF9pbmRleCBwZXIgdGhlIHVBUEkgY29udHJhY3QpIGFuZCBhbGxvdyBpbnZhbGlkIG9u
ZXMuDQo+IA0KPiBJZiB5b3UncmUgc2VlaW5nIGV4ZWMgcXVldWUgcmVzZXQgaXNzdWUgZHVyaW5n
IFZNIGJpbmQgb3BzLCB0aGUgcm9vdCBjYXVzZSBpcw0KPiBlbHNld2hlcmUgdGhpcyB2YWxpZGF0
aW9uIGNoZWNrIGlzIHdvcmtpbmcgYXMgaW50ZW5kZWQuDQo+IA0KPiBDYzogTWF0dGhldyBBdWxk
IDxtYXR0aGV3LmF1bGRAaW50ZWwuY29tPg0KPiANCj4gLSBOaXRpbg0KPiANCkFncmVlZC4gSXNz
dWUgZHVlIFVBUEkgbWlzbWF0Y2guDQpUaGFua3MgTml0aW4uDQoNCi0gUHJhdmFsaWthDQo+ID4g
IAkJICAgIFhFX0lPQ1RMX0RCRyh4ZSwgIW9iaiAmJg0KPiA+ICAJCQkJIG9wID09IERSTV9YRV9W
TV9CSU5EX09QX01BUCAmJg0KPiA+ICAJCQkJICFpc19udWxsICYmICFpc19jcHVfYWRkcl9taXJy
b3IpIHx8DQo+ID4gLS0NCj4gPiAyLjQzLjANCg0K
