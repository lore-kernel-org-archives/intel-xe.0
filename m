Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81EC4C79F87
	for <intel-xe@archiver.kernel.org>; Fri,  4 Sep 2026 12:51:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2251710E1F1;
	Fri,  4 Sep 2026 12:51:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Nfev00CY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B10FC10E135;
 Fri,  4 Sep 2026 12:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788526265; x=1820062265;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=B+e26PD9NtLwggTMObkYBfjVh7xg9Tz6rWyzxViWTec=;
 b=Nfev00CYJz0vgP2Dhto/G73qjgnIes6MZLfwPYtE+7iApwJJgXjdDz8f
 OFkr3pBCcdwc//Ctm49oTFT2V7rpanzVtnind83k1qKlUxFyXjDtsfecy
 KLPEjS/NoVu8sauiD7j8dY8S3+w/h0Y0gcgB4SCq2mucQHZn2D9GpuZEU
 AYeaJ3zYey7vH4aVafhLb+Ldy7YmNwrDE4nBKSNliMt2zkCass5sPrlKz
 BvCxGVRWamaEcs3NArcAgTeqUoDgYJRLAen7zJzCw/n4BUWeDm/9x9SZD
 LLoMOz5pSwJlZLjItNcqoWijylMjojzyyUNYUI55MbUofMEcVXrC8HGD3 g==;
X-CSE-ConnectionGUID: SpWflmjiT2GcNhU9c4NBdQ==
X-CSE-MsgGUID: CRX9rRF5Tnaw2kG/Ht3log==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="89059365"
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; d="scan'208";a="89059365"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2026 05:51:04 -0700
X-CSE-ConnectionGUID: ALF3YvujRx6WOyyryBh12w==
X-CSE-MsgGUID: Tm+OwjhPQCeN0b92hVO42w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; d="scan'208";a="273554914"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2026 05:51:05 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 4 Sep 2026 05:51:03 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 4 Sep 2026 05:51:03 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.10) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 4 Sep 2026 05:51:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IDlrzsvFwa0CH81rq9xZ6SpQESdGmlHh0kVftMZh/dsACm/TnttIvDPdTHVkuFW5/tCvaydSDRxhXe9/Lpz3aiGJBh58uQDDDuJp2lKwE8rXD2G4cWiskhxen3fVYQ/vRkWIkvVNd4XmdKjVk2Mf6dY5UJ1kMMBR0bDzSccdoRfnVSfJwimetdrMhqlDnaHzYz8abpD5aNyL9BjS2QWjF/A5N+E+hcAAKty746q3f+dilUIKD5SZHCsOnzGK6JgFqVJ0XPNCSjU84X2qOXoeh33yLyJ7C3s1F9FGsCYXVQxcVDRGOWz0+2qN3i1Q+yAxOPez72QW3of/g/HSE/N0eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B+e26PD9NtLwggTMObkYBfjVh7xg9Tz6rWyzxViWTec=;
 b=gSlp5uXlndzZuuW8678ezoIdXmU6rc0K8EHltSfcJ45Bkya94RYxDNnw08rFJ4gbKiwj1rloie6M88c2WsL1237iy6xwn6NxBgxd/aLgQBdgCfsWtiwT5lM+TNZ8QgYjz0heV+L7DVZWjK3W6Yhy2xQUAAcs2JpG9aGXqxyep9bB1V7PvBhQ6YT4aQe+H+3X5/gvqakiw5nGHfj7UCNEB03/OJhs4Ut+NKPW8mFgDkUjX7sCOE4Z4ZZlbQ7/iAcVNhZcurQr6tO2KHwx/lgd8qwuwyFR8omNDa9/igcnzysRy3Add9P0+1a07wXfUhHLua2v8D+wNdlQZ4yChhc4pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 SJ1PR11MB6132.namprd11.prod.outlook.com (2603:10b6:a03:45d::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.13; Fri, 4 Sep 2026 12:51:00 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::9086:5e0b:ad24:762]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::9086:5e0b:ad24:762%6]) with mapi id 15.21.0360.008; Fri, 4 Sep 2026
 12:51:00 +0000
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
Thread-Index: AQHdPAZtF49PnFiACkOFn8CPBMwlJra+TpWAgAARbgA=
Date: Fri, 4 Sep 2026 12:51:00 +0000
Message-ID: <9bcfbb0aee505ca2fda77dbe386a7569290619ae.camel@intel.com>
References: <20260903131724.49496-1-j@metarealtyinc.ca>
 <20260904004308.185788-1-j@metarealtyinc.ca>
 <20260904114835.483057-1-j@metarealtyinc.ca>
In-Reply-To: <20260904114835.483057-1-j@metarealtyinc.ca>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|SJ1PR11MB6132:EE_
x-ms-office365-filtering-correlation-id: 48c03ebd-e096-4118-09ce-08df0a832bca
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|23010399003|10067099003|4143699003|56012099006|11063799006|38070700021|18002099003|22082099003;
x-microsoft-antispam-message-info: SEUPRPUPKA0UDrz4fdyB7ZUQG61b0735WZ94Gal9NwsdbcLJ2JmKpqALTAsXMqeXhoXg/s0ifHSvpv8GutgE0cCK75bV6qWrHcPPAgBvwAJF2wRWY0WRKu01hUcptQYgQ/G0z7ntd3EVqBEgzGlmnswp8xau7/to3NxbO52kYW2R+cKW6RYV74ze00Wv6UsdRQAejc+VByIlnK9p56/3DdoO22yzzE7jdwFsq0F0X5ZiIBoMwuBg9GuJK0cbvZjl9jNjyeEP4nsIDE9aU6QgIXfnAcIdB4GCtjaxx2Pr043bHer2lwL+LzRj9lbe7AAvtjyNO6GGu5KIw9bMbDTSu+3rnWJnkcjCaV2Dw50+CIjF5hj5duWSmcnJ4Jdbavs0hcrPf4M9eB9VXCW7uzzYck6z4zgaaFq7HLrjnfWXIce3yCUAugRqZXGMP5U+rwUOi4p4snSoEJ9FQiVGK5hrZjdgKusryWTDhkk/bM+5LEx4RWAbDwvjdzU1cX0fyQkKC/5f3b9qaklmn5PukQ/uCjCY4dHhi1Ulx15oEjllYXtX+OWCSc3aaEht4vs0SrnVvXQ5m8dtt7wq20ormGGLXolX902NR+6vWWjM1mWXk3py3jQTz31SWvVNMy0ZmF2VZSQNi/wwpahviFdpeSWiKPF6up021ij4UPbckHjTuuA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(10067099003)(4143699003)(56012099006)(11063799006)(38070700021)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U2pWRWZwOEEvL1VMRUh1YkpCc1h1dG1hd21BM2RIaGYyRnRCYmo2WFJKb0hO?=
 =?utf-8?B?R3M5Qk5NaXd3WDFiSkN4Si8rZkNqaHFPSUNNaDZVK0YvcStJdm95cDY2cnhm?=
 =?utf-8?B?QzZva0NZZWc3b0dBUnF3ZStIRzZrUE1qNXdBOXd4LzJDWTFJZEJDb0s2enRI?=
 =?utf-8?B?cDN1RTI4OEczYzNUOXgwM1MyRVVCK2VuR0lwL2Nic29mMWdpV1FzRXJGY240?=
 =?utf-8?B?SmoxeE1tajUxcFdSZGgxUUU0LzladVBTcDZzM2NtNitndkNybjVlZkdhc0NW?=
 =?utf-8?B?NCszcmd2RGhZSGsrNVpML0VkNDhGYmJoU1kwR2ZCbG13Qk9zdnhnSUd5b09n?=
 =?utf-8?B?cWg1ZGc2am01cVhrakxLa1VTL2FiUHZ4aTNobndza1IxVHRHT2doUnJzSnVG?=
 =?utf-8?B?Und6QWFSbjB5cVJBVHJoU0Rlb0tSLy80RDNJVUNPY0ZvZWlyT3FkSHpJcHA0?=
 =?utf-8?B?SVU3bS9GV2RyZ1AvaWZYaWt0dEd2SnFycHRXbE9qY1dXTmxacVV2d2ZMQldX?=
 =?utf-8?B?RktqSTg5TFRMQ3FvTmRGSEV5L3NjVXkvSmw4b2pRNHFJNE5BSHRSeG5Qb2sy?=
 =?utf-8?B?RGtoOE5rbWVCMTR6Z2M2YWtERmxBQkZ5elpUYmZ2L092ZGpIQVdXOXVxT1BN?=
 =?utf-8?B?REtjSGlTTzJZeVRvejZvOCtPd05Wb0lhVUNCdTRzUVZCTFRhL1RTUWJLZjBT?=
 =?utf-8?B?WGpabjNuZzgrOVNzZzFUazVPYVMrOXNxSVBOSVN1MUlXTnhCTmwrSGFGdGdn?=
 =?utf-8?B?SVNJaS9FOTlpNHFSSGc5UDlTNW9Qak1Zc2k5L3YwODZkRHVaNlF6ZzkzdkVu?=
 =?utf-8?B?cVRzNkZRVXV1YlY4WWNGeVAzRmdXQUlDbW5YZHNIdW1id2pBdmpiSnJYY3lY?=
 =?utf-8?B?OTFmNWYwaHNKTk1oaHNnOGVIM3FHMXB2OENWcEFWeVRHYnhNVURzVTRuYUs5?=
 =?utf-8?B?Q0EvRW9XMDlJcnNITlVCQzVBRXJhTE1DVlprSHNPZGl6QXBiM2F0Z2MweUdZ?=
 =?utf-8?B?SmlFTEpaK09ZRGZyM2VQcUhjeitkZFo3ZGlHMndBdmdVcFNNeW10U1lMbjd0?=
 =?utf-8?B?UnF6UU5FOE13bjc5UW90aXA1cVlkbzFsK0Q0N3JwU1VPemlWWjVIQ3QzRDBw?=
 =?utf-8?B?NUlMa2F1Zzg1bWI0S1JvWWJBKzhxeEg5Vnk2VWd5dE5OY3M1WEpUUlIwVklp?=
 =?utf-8?B?VTJ6SllpaDdzcWN4eTQwUEduOWRkaWRWY2ZaYnczZXFCNll5a1k5Vjl0N3gy?=
 =?utf-8?B?R25nZ1QzdUoydkhXWVFVRGhvUlRwdG9SNUQ1QzBsWU0xWlA5TjNRZmxYQ0lD?=
 =?utf-8?B?Z2d3RXE0alhqNVpXNTVVaSs3Qmg0YUhKTU1xOVZzV2ZZWlhLNWoxUlJVYWU4?=
 =?utf-8?B?ZjZkaHZSMnlST2tFZVdpb0QwRlIreTNxS01ZS0pnVCtsOUk5OTJCeVIyYjNF?=
 =?utf-8?B?cm9YdE44YmYrRGovL25aU3o2Y0ZGajJENGEyNFpQcUJYeGxGaHpXcmE3SGJR?=
 =?utf-8?B?RjdiVDlQQW1heGd3cDFMTFNiQ3NzcWl3ek82cC9yMUpXN05JNmNVSllaWHBQ?=
 =?utf-8?B?dWdUV0tZYzN5dmJHSkRmelE3VVA5ZC9aUjE3QmhiWjhMVHlKejczUlUwRHVq?=
 =?utf-8?B?UHhReXpRRWpjejlNbzlGTmlSUGRmK25BL0R3MVVJRnhuQWl2L2YzOExmZTIr?=
 =?utf-8?B?VjVGc3kwQnc0Zi81K0luZHlOakZCeUk4VnFjY1J0a2lYZnZrMHErWlJWODRr?=
 =?utf-8?B?dVVSMVkxeVFTbjNZRWhYWTRFR3NYVHFpTmZMWTJNdEJTRnZNZ3FIZ1U5WGVW?=
 =?utf-8?B?Vm12bUlkVGZ1ci9ZbVNhaHRCVkp6cnlQUGNPeUx2Q1MrUkZsd2NCN3BuaW1R?=
 =?utf-8?B?YTNQdWFNalhWMmhoSml3K1N1eTVTRitsQUZwMlRZYkNZNFdmS3BuNWRScVg3?=
 =?utf-8?B?bDZaWlFuamdyR1ptVHhjeDgwcHVYV2Z4NDE3bVFkRXRFZ05nV3loaXYwUEJO?=
 =?utf-8?B?UHN4MGxqUzNZZjFsNVVpMjlHek9yYWxBWWVTNEo3RFcxbjZxTmJEcDhxZE5W?=
 =?utf-8?B?VWgwR0o3NzBtSGgxMnVPSWI5SVFhNnRTWjEvSXZ2TVROUnlwZzcrY0Rhakhi?=
 =?utf-8?B?R1Y0aytTWkdTSUVTMWhrVExrSVdRNTRWejltVUw4MWtpNzdRSGlEVjNjeGQy?=
 =?utf-8?B?Y2xxMHo3TnB6bGYzK2V0dnRLQkIzNGRWMXJBYUo3dk5wU0tORGYvakZmd0Zn?=
 =?utf-8?B?a25KbFJSY3dUd2lpbVl3dm0zMEJ0VEJCRUtsbm9tNUxNVkRLYmIwNmx1TWJY?=
 =?utf-8?B?Q01oZFdyVkI3REYweXRrQ25PYjVsSmVaaGg2dHZSYWo2Z2F6THhLZGt2dGxW?=
 =?utf-8?Q?qvw+qgHxLplnSXII=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <19966BA676527449986DF93DE80F99C2@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: OxOCFYka6YWnLLEOYOTxWVJWWrwQzIYy8AKZIWyCR4eG8jazXCsIL08qeG428MAX8SaCYvvKpS6ykRb1ovlg03okKiuHpRo7uQ91PHxMaW6VRYWBV0KVoL86qCNv7b3d1fE4b3VrpJEvCrg4Zt2/ZLthG3HJuSSW0vy7Kwyd+agrBCCHWiGcMrdV6e9TLzqYWOlNFcAo4XoDqesGhuBlZWef+OXJDn2VtKOTHT/dzuD5PMulWhBiuU/T2nn55m9Jp2atsBxFvSue14VPRzfWfQt1DfxjE7/rH2vA74M5mGI7kTE7obdQG5TkV6nROeSUtTI8HueQR9FKMTrG00Rq4Q==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48c03ebd-e096-4118-09ce-08df0a832bca
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2026 12:51:00.0631 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yw8aADGfaiKg20xDqCEJBGdJIvOmQklNzi/Mpe8iLrs8ofGqJP0juJY+FvzlWgAH2G4Y6KRqmPGnYPgAnPH84frcZhSPmitm2GcEWDVqKao=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6132
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

T24gRnJpLCAyMDI2LTA5LTA0IGF0IDA3OjQ4IC0wNDAwLCBKYWtlIFN0ZWlubWFuIHdyb3RlOg0K
PiBPbiBUaHUsIDIwMjYtMDktMDQgSm91bmkgSMO2Z2FuZGVyIHdyb3RlOg0KPiA+IFRoaXMgcGF0
Y2ggZG9lc24ndCBoZWxwIG11Y2ggQVRNIGJlY2F1c2Ugd2Ugd29udCBnZXQgcmlkIG9mIHRoZQ0K
PiA+IHF1aXJrDQo+ID4gZGlzYWJsaW5nIHNlbGVjdGl2ZSBmZXRjaCBhbnl3YXlzLg0KPiANCj4g
VW5kZXJzdG9vZC4gV2hpY2ggcXVpcmsgaXMgdGhhdD8gQXMgb2YgeWVzdGVyZGF5J3MgZHJtLXRp
cCB0aGlzDQo+IG1hY2hpbmUNCj4gb25seSBoYXMgdGhlIFBhbmVsIFJlcGxheSBxdWlyazsgUFNS
MiB3aXRoIHNlbGVjdGl2ZSBmZXRjaCBpcw0KPiBlbmFibGVkLA0KPiBhbmQgdGhhdCBpcyB3aGVy
ZSB0aGVzZSBDUkMgZXJyb3JzIHNob3cgdXAuIElmIHNlbGVjdGl2ZSBmZXRjaCBpcw0KPiBnb2lu
Zw0KPiB0byBiZSBxdWlya2VkIG9mZiBmb3IgdGhlIERBMTYyNjAgYXMgd2VsbCwgdGhlbiBhZ3Jl
ZWQsIHRoaXMgY2FuIHdhaXQNCj4gdW50aWwgdGhlIFNVIHByb2JsZW0gaXMgdW5kZXJzdG9vZC4N
Cg0KT2ssIEkgdW5kZXJzdG9vZCB3cm9uZy4NCg0KSSB0aGluayBQU1IyIHdhcyB3b3JraW5nIG9u
IHRoYXQgc2V0dXAgYXQgdGhlIHBvaW50IHdoZW4gSSBpbnRyb2R1Y2VkDQp0aGF0IHF1aXJrDQoN
CmNiOGQxNTViMDgwNiBkcm0vaTkxNS9wc3I6IERpc2FibGUgUGFuZWwgUmVwbGF5IG9uIERlbGwg
WFBTIDE2IERBMTYyNjANCmFzIGEgcXVpcmsNCg0KU2VlIGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNr
dG9wLm9yZy9kcm0veGUva2VybmVsLy0vd29ya19pdGVtcy83NjgyDQoNCk1heWJlIHRoaXMgaXMg
YWN0dWFsbHkgbWF0dGVyIG9mIGJpc2VjdGlvbj8NCg0KQlIsDQpKb3VuaSBIw7ZnYW5kZXINCg0K
PiANCj4gVGhlIFNVIHByb2JsZW0gaXMNCj4gaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3Jn
L2RybS94ZS9rZXJuZWwvLS9pc3N1ZXMvOTExOS4NCj4gSSdkIG11Y2ggcmF0aGVyIHNlZSB0aGF0
IGZpeGVkIHRoYW4gYW5vdGhlciBxdWlyayBvbiB0aGlzIG1hY2hpbmUsDQo+IGFuZA0KPiBJIGNh
biB0ZXN0IHdoYXRldmVyIHlvdSB3YW50IG9uIGl0LCBzYW1lIGRheS4NCj4gDQo+IEpha2UNCg0K
