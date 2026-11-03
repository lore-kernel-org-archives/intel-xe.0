Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5666C606A324
	for <intel-xe@archiver.kernel.org>; Tue,  3 Nov 2026 23:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NblHt+ho
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CE4D10E442;
	Tue,  3 Nov 2026 23:43:33 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E31010F8A7
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Nov 2026 23:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793749407; x=1825285407;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=UhDiS7gxn+83lWI4JOSZYs0b9fnqCgcRD7Lxddn+cKs=;
 b=NblHt+hoNDlJDaJtEe+Sd39VrECXWpi9aZLOCey2ClNhdFqchkrO5L96
 8HAikl4bVL70JjlxMShrWwZXJMeHxWUcvcc8BCyYR7kKMkEP30EyotdkO
 IzsA2lFJ6QqlKWFB/9UPOAdzHCHHuKPQn5pPbAx9sVFr6PqmCt7u4PQA1
 SZ2wkciTb76QHtBQSU0cvmWudX3r2VqAyVM98E3yIddhKCZvE2FuMCJEG
 vqAB3uZEJGw7jhVQ/+yA2x/p9XClN41t3xnmZopwp4qjlQnDgMHldxaXk
 ok0tbd5LzL5KQEzVFPj9uypE9e0iqCq10+QCLdPVe+N5hkXMtDJiiEI40 Q==;
X-CSE-ConnectionGUID: vVOKpVHMRkewYyaRUOWCEQ==
X-CSE-MsgGUID: PpvAitngSkS9Sl9kX7K33Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2490652"
X-IronPort-AV: E=Sophos;i="6.27,194,1787036400"; 
   d="scan'208";a="2490652"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2026 15:43:25 -0800
X-CSE-ConnectionGUID: J62S+Jv/SXSC+aQMpR1lZQ==
X-CSE-MsgGUID: PyqpNkMnQa2EyOI7iXsB9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,194,1787036400"; 
   d="scan'208";a="8421661"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa013.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2026 15:43:26 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 3 Nov 2026 15:43:25 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Tue, 3 Nov 2026 15:43:25 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.0) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 3 Nov 2026 15:43:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=noCrbl6h62zYJnfXFBrc6pPkHZx1A1w2+BaDvFkxDY3JoB5fGiBDhtrR7YYpAZKTqDiFJ7xrzAwaBgbBQWXMNCxUYrhar+A4m7WZXSoOfVM75wyN1V1a7ysqzSQPvWfotqijcLA5W/xDYewQhMIFDOggIbfzggHMmAarJNYT2qFbxWVH1YOL+km+lFON1pcqaESClSa1+fwn60C4Y/FfHOlQmLJjW6ElNvKnG7RGH9I1Jz7byksrmYoUqzwBBAYMrRdDGV8MEheGZizwQkx7/+sLK6bnSiF9kGq92ZMewsjtPiE1JvuL2xN1qExhkHb0RWz1ReDWfJAWEwa9qzrqGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UhDiS7gxn+83lWI4JOSZYs0b9fnqCgcRD7Lxddn+cKs=;
 b=qEGkZwig9L9iwQ7aLhr/Z5x6/HgeYsgnTEjNAvedZQueeEkZw5xyaEFrtud8C+aBRo+Egp3fAkMKoizgHted3Qtu7jFSUMMA11/MxMvqONW41UEkiGp8VXwm6znopBZB2wCUoCIXXgDQYZWP5vUb3dOvIuw3M+0f2TInbdos95eNePqWuu93i2VxF9acw2qC3J1SKMpsm/zx2zeBlVfHG2Hh43Z8pDybrMjBZvhynTnG6kdYKG3FyPQPPW97pcUR5lns9kNjW+sm28lWkhkgBLCmfZM78V15LIecUc+2QqYwfwByi2txOq+Em/aT4ZvnSWeYmWp+8OZmH+zYogiDJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from AT6PR11MB072844.namprd11.prod.outlook.com
 (2603:10b6:170:10a::16) by IA1PR11MB8197.namprd11.prod.outlook.com
 (2603:10b6:208:446::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Tue, 3 Nov
 2026 23:43:23 +0000
Received: from AT6PR11MB072844.namprd11.prod.outlook.com
 ([fe80::520a:561:ace1:e64b]) by AT6PR11MB072844.namprd11.prod.outlook.com
 ([fe80::520a:561:ace1:e64b%6]) with mapi id 15.21.0592.007; Tue, 3 Nov 2026
 23:43:23 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
 "brgl@kernel.org" <brgl@kernel.org>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Upadhyay, Tejas" <tejas.upadhyay@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, "Kumar G, Naresh" <naresh.kumar.g@intel.com>,
 "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>,
 "dakr@kernel.org" <dakr@kernel.org>, "heikki.krogerus@linux.intel.com"
 <heikki.krogerus@linux.intel.com>, "bartosz.golaszewski@oss.qualcomm.com"
 <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH] drm/xe/i2c: Fix use-after-free on driver unload
Thread-Topic: [PATCH] drm/xe/i2c: Fix use-after-free on driver unload
Thread-Index: AQHdWAv2C1K8lB/uD0uf3ba2q+QLVLb5znsAgAAZS4CAFepAgIAAaF4AgASkLgCACEuPAA==
Date: Tue, 3 Nov 2026 23:43:23 +0000
Message-ID: <80e999b49fb3489a891742dc4267be740b0035c6.camel@intel.com>
References: <20261009164241.923756-2-balasubramani.vivekanandan@intel.com>
 <7939f69c-bc63-4465-a578-8024e20c4eb8@intel.com>
 <aszdvyOY5zkyFTU1@bvivekan-mobl1> <at8_996Aarbq0_TO@black.igk.intel.com>
 <at-XhFGST5C3lFTu@ashevche-desk.local>
 <q2caxyahv532pazvrfgzartdn6433hkkz35ofwhfuizdzbd5ch@rkvjmv63kdce>
In-Reply-To: <q2caxyahv532pazvrfgzartdn6433hkkz35ofwhfuizdzbd5ch@rkvjmv63kdce>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AT6PR11MB072844:EE_|IA1PR11MB8197:EE_
x-ms-office365-filtering-correlation-id: 73a38861-872a-41f3-5ec8-08df3a043fb3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|18002099003|10067099003|22082099003|38070700021|56012099006|261026121527099003|261022105027099003|261026140227099003|261022075727099003|261028144727099003|261009223027099003|4143699003|11063799006;
x-microsoft-antispam-message-info: 5bT+82jnl+MYUNPYEFinW72VuWvN6sy7uDjHAUEeMOfPYDrV0YveCHpExJAyUVATle8dNKtj9FvWDCdxYe1xmmS09xCkSIjF/DBlTn49egIsLahIR0daEoispmnQZzOtFsBP+pAmz7oFXxwdIs7FjQ9Y5EZwOSt5KMX4ncAR3rOHLbMAweQq4NVo9Riq/0S2IAqxbbwZivcOIL2S4yvwrJBMks84bGwRC6PW1ZvoEwU5V89A/hPfnmpIp1CZ8JrJY7cY3WyO0e237Mxmx9bhxEz9xw/YZBLcAy/J/hgVqreiu9RLothp3HED0xjI8W3DtoteIEoWfvdLsAsSQhR9ur+KaFTuHbVEfHVDYLt2Dxizi6LJFKX0la2CViaRbfSURL2qOepNswxkagiwjhcdXSKpP2L2AIooJNhj2ZeV5EhvnjpsRmQn79ZbhqUcjtXpkJMaBDxEr/JMW/pXQgOlJbdV/iH02OO+6mArjMlNW26uxQBkd0kcZgeInNHG+I/kKwR1wvQ5Mx0znBqb4pciKOJdKKi69Tw6TiRxNXhi8q6HoYpyEBw50+cWv2E+mkAr6tBAOKPChK9opQHj10+7MbUoV4A0brW2fvN9Jg2jAk0/co+OTAWVjgmXZC6a2/I4OmKMR0BoT0ouUS7HCAZ+3/ZNPbkAH4nYfhnQFBvq6PQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AT6PR11MB072844.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(18002099003)(10067099003)(22082099003)(38070700021)(56012099006)(261026121527099003)(261022105027099003)(261026140227099003)(261022075727099003)(261028144727099003)(261009223027099003)(4143699003)(11063799006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SjhqVUsyOVE0amtuSThmR0dDb1RWWkZZNXlzb0s3OWF5SysyMzJLVENQSUFr?=
 =?utf-8?B?V292Mzl5ZHhHdGhBRmpwQjFhSTBXTVRIeHgxSXVxUEpVaDM4RC9VYnBhTWZs?=
 =?utf-8?B?UWY4VUhNNlBwZ0ZUZXN3c09LOUJrSlNRaEE3K0E4N2NpSTRYRVF1d0FCUU9x?=
 =?utf-8?B?NWtRVkcyakg5R1E4NjB1K0w1Vy83NGlDS0J5VHZGK2crQlliZkYvWFRqdVNI?=
 =?utf-8?B?QWNPYldkREltZkI5RXpPcWwwbXI1dDVuUjRiWUx6dFdiZmhCM29KN2xBOXNx?=
 =?utf-8?B?RXBPUERaNSttZC9qa3UrNzlDRFJlSEFTWnNqTVkvWkZRWlBsVE5hTUlRQjl3?=
 =?utf-8?B?OXp2WkxtTHlHemoyL2NNOU5FeHhIak11QzBTMnl1ZGdiY001bWl3S240TEZm?=
 =?utf-8?B?NElSNjBKV3VSbi9MWkluTEQ3N1VjM253TlFNVzhqUWFzbExaTHJJVG4yYVhU?=
 =?utf-8?B?NmNBa2NjTGJDRWswYXZvZUU4RTk1WEFkS2liSGFzcTI0Wnp5Ui8vQ3ljUFFx?=
 =?utf-8?B?bjMrZkZaNlJPY1NmcnhQMHFvL0UrUXI2Q1pSQUdjVXVIb1Bid1ZVb2gwNmRm?=
 =?utf-8?B?YlhxdTJQSDRYS2FMelpScjNRVXZKd25FdDRwS04rNFhxZngwamMrdTJTeDJ1?=
 =?utf-8?B?V0x0S083S3crc2piMnJjS0F4Rlh3QTkwajRyUkpUWkFiYXltWlkrSjBUNVpn?=
 =?utf-8?B?QlIzb21ROXhyMmdMWTZQaExyT29nV3FENlRHS3hscWdLVmR4WXRyb0hBREpE?=
 =?utf-8?B?eldjYmhUOWlpRW81bllKZjFkLzhlT2JMcVEvWTA3SE5LNHk1NEREY0xBajlX?=
 =?utf-8?B?emwrQmZFZ0ZPZkdCZi84bXIzUlh5SXh4aktoS2VDYkxqYm9OUUhoV3BMemdO?=
 =?utf-8?B?Um5WVnBFdUdGNUhxNVVGaHBkVkQ2cVY5MVQrcGdzekRXY0ZvUEFvM3gvVUVE?=
 =?utf-8?B?UDlWRmJaSUlQQ2daT3NBekt6bG1paHUxbjIyTmYyVjB4K1NsRVlOVkkxRDRV?=
 =?utf-8?B?NUwwbmZiRGcwUU42TEtXNVRLYXV5dXg2R0VHWXgxSXVZM0FabEVveDF3Wm9R?=
 =?utf-8?B?TFdjMUM3eVh1MUMzcCtlUTZrRyswVk1VdnRrdjhPYlc0ampGenY4SEVJcVJD?=
 =?utf-8?B?cDB2YVVYbkNJY003T3hoV0tOdHh5TmQybTVsVTdTUmtUM0IvRXhZQUdYOTA1?=
 =?utf-8?B?bG4xRkZOY3F2eUtFM2g5c1lzT0EzOGd1SFRiY1pjL1N4dE5IbysyQzR1KzdB?=
 =?utf-8?B?SDVMUHdHUE5jek1pZ3FiWStoMmhOLysweXNuYmQvS1hxRDBleEhzcnBtSTNC?=
 =?utf-8?B?UGh4YTRrdG5WOWVLc21XZnRNeHFsRkhKbTd5STl4Wm5kQVlodVFDMlRJTTkx?=
 =?utf-8?B?dDMzbFdmRHJpMmtINFVvNjhYVnBseGxDRHVXYnhFMGNQSU1Galg2MlNmSm85?=
 =?utf-8?B?UFlRQ2hCMzFZVHdMZUhwVEJENG5aQUpmL3YyK242Y2xwMUVZeXE0TEE2S2Fv?=
 =?utf-8?B?VGZsVVhVL0RHTmUzZFFhN2pwWFl2SXVzQ1RtNHp2Nkg0bkNLZ2ZadkVpUEhj?=
 =?utf-8?B?TlByeFJpcXhrTU5tb1ZZOEZNUHBWTWxBdUJGTk95bERIUmYwa00zYVBXc3I5?=
 =?utf-8?B?aDc2NjVTWDdzOEtsV1JNNitub3JkaUFYNXVHQklqUGVKL1ZMZmZSZHBGWG5P?=
 =?utf-8?B?cFA4d3dWQW9xRlBEWTJ3ODNxUkN3V2pUb1lHSzhXSk1oUjhwVjVqbHNUY3lr?=
 =?utf-8?B?QnVjK3p2Z1JJeDJhc2Uwbm5maWtTd2xsVnlWQnNxVENxTkxpNkpZYURQQU5Z?=
 =?utf-8?B?dnRvbHV0cXdTZm1EbnhISDhnY0E3anN3bUtCVHcxRkdDRk5QZytVS1VqNFNt?=
 =?utf-8?B?eUUvUlpaOGNoVWRZUlhtcDR5Nm41NkU5UVdldkoyWHAwSDRoK3U1SlBtck96?=
 =?utf-8?B?SmdtS0FUQ0VkTEJEZmdxOXFBVVB4dVlFcDNDemdabU5OdWhvcTFkUEh3RHcy?=
 =?utf-8?B?aHllY3VXQityVGQwZXJIS3M0Z2VWMHNZd1hUMEVvRHY5TEpEa1dleDhRSDhm?=
 =?utf-8?B?K2RYTDVoaFVNekdNSVlvYXFNalNlak5iaWpQaFN3Qmw0UlZELzJSSHV4ZDUr?=
 =?utf-8?B?ankyTHRPOVdsRStLYzN6eTBPVUxGVFdiQ2F1WDh5L0R4ZUVZNWl6bW40bURB?=
 =?utf-8?B?THMvdUNhTUZCNjRURHBKQWVCUGRuS1YwelBReldOOE82djgzNmpZQW1PdnJs?=
 =?utf-8?B?aUN2NC9PcEVwamtQVE9QUkJSZFdSUmNQRVJBamlBblU5ZmIrNkI4eGE2UmRq?=
 =?utf-8?B?SmlZNVd4SUZMdlQwRVdtK2x6RFQ1WHBWMkFCTk9obU9meW9PUWtORXF6RnFR?=
 =?utf-8?Q?LM2gEu23R6KEzH94=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0466127F0ADF6F4B8FD69B93F66C64CC@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: DefAncK3Gu7MpE04i1hc5ZHzHdNccHVLUFJd+NdsQmhR6+oSX4XP8+FGFFi/cJ1aj6YSzafEjLks5hqk7nXE3TTED8/EXN+uwc6rabBisJyGkFP6nVCSQWtNQuJMcO/yvhSznTbzFPOWBWBYCJMJuDEAoux5RTZU0FioWCNJlUNW6NHACF/7JaFWsl1YTBsAmcKFub9JUNXyuMc+g5izhnsl3Ye0ggBNUpijwVbt5q3xrDMlmfOKqYx1g8wPuPwzxJb5K79XjWoaqL8omIEPRbyZeK47xvxfL7YPaTolk2J6GbPlosJNt5j/8+hay5+sT0T4HllyGdFepebniMQGnA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AT6PR11MB072844.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73a38861-872a-41f3-5ec8-08df3a043fb3
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2026 23:43:23.2620 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fvljoQ+i9QDVD5BE/TcSkjzHKfFVMg2dk47x/g601dYUuQpQW/F7LStdY1qzraOnDj7TmxJ+HM6VDrsUD8yZDwmeqidjYcikkEv9+3uaeyw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8197
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

T24gVGh1LCAyMDI2LTEwLTI5IGF0IDE4OjAyICswMTAwLCBCYXJ0b3N6IEdvbGFzemV3c2tpIHdy
b3RlOg0KPiBPbiBNb24sIE9jdCAyNiwgMjAyNiBhdCAwODoxMDoxMlBNICswMjAwLCBBbmR5IFNo
ZXZjaGVua28gd3JvdGU6DQo+ID4gPiANCj4gPiA+IFRoZSBiZWxvdyBwYXRjaCBhY3R1YWxseSBs
b29rcyBtb3JlIGNvcnJlY3QgdG8gbWUgY29tcGFyZWQgdG8gdGhlDQo+ID4gPiBzd25vZGUgcGF0
Y2ggYWJvdmUuDQo+ID4gPiANCj4gPiA+IEFuZHksIEknbSBzb3JyeSB0byBib3RoZXIgeW91IHdp
dGggdGhpcywgYnV0IGNhbiB5b3UgdGFrZSBhIGxvb2suDQo+ID4gDQo+ID4gQmFydCBpcyBpbiBD
YyBhbmQgSSBiZWxpZXZlIGhlIHJlY2VudGx5IHByb3Bvc2VkIHNvbWUgZml4ZXMgYWdhaW5zdA0K
PiA+IGRyaXZlcg0KPiA+IGNvcmUsIGJ1dCBJIGNhbid0IHNheSBub3cgaG93IHJlbGV2YW50IHRo
ZXkgYXJlIChhdCBsZWFzdCBhbGwNCj4gPiBrZXl3b3JkcyBzb3VuZHMNCj4gPiB2ZXJ5IHNpbWls
YXIpLg0KPiA+IA0KPiA+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvMjAyNjEwMjMtc3du
b2RlLWRldi1ub3RpZnktYmFsYW5jZS12Mi0wLTk0OGQ5MjBhNzlmNkBvc3MucXVhbGNvbW0uY29t
Lw0KPiA+IA0KPiA+IENhIHlvdSBnaXZlIGEgdHJ5IGFuZCBzZWUgaWYgaXQgcmVzb2x2ZXMgeW91
ciBpc3N1ZT8NCj4gPiANCj4gwqANCj4gSGkhDQo+IA0KPiBTb3JyeSwgSSBtaXNzZWQgdGhpcyB0
aHJlYWQgYmVmb3JlLiBUaGlzIHNlcmllcyBmaXhlcyBhIGRpZmZlbnQNCj4gaXNzdWUuDQo+IEkn
bGwgdGFrZSBhIGxvb2sgYXQgdGhpcyBvbmUgYnV0IGl0J2xsIHByb2JhYmx5IGJlIGEgZGlmZmVy
ZW50IGZpeC4NCj4gDQo+IE9uIHRoYXQgbm90ZTogaXMgdGhlIHN3bm9kZSBiYWxhbmNpbmcgc2Vy
aWVzIGdvb2QgdG8gZ28/IEkgaGF2ZW4ndA0KPiByZWNlaXZlZCBhbnkgcmV2aWV3cy4NCj4gDQo+
IEJhcnQNCg0KSSB3YXMgc2VlaW5nIHRoaXMgb24gbXkgc2lkZSB0b28gb24geGUgZHJpdmVyIHVu
YmluZCBhbmQgcHV0IGEgcXVpY2sNCnVuaXQgdGVzdCB0b2dldGhlciB3aXRoIENsYXVkZSBpbiB0
aGF0IHJlcHJvZHVjZXMgaWYgdGhhdCdzDQppbnRlcmVzdGluZy4uLg0KDQpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9iYXNlL3Rlc3QvcGxhdGZvcm0tZGV2aWNlLXRlc3QuYw0KYi9kcml2ZXJzL2Jhc2Uv
dGVzdC9wbGF0Zm9ybS1kZXZpY2UtdGVzdC5jDQppbmRleCA5Y2U1NjNmNzZhYWQuLjM3OGJhN2Zh
YjJhYyAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvYmFzZS90ZXN0L3BsYXRmb3JtLWRldmljZS10ZXN0
LmMNCisrKyBiL2RyaXZlcnMvYmFzZS90ZXN0L3BsYXRmb3JtLWRldmljZS10ZXN0LmMNCkBAIC00
MjAsOSArNDIwLDY2IEBAIHN0YXRpYyB2b2lkIHBsYXRmb3JtX2RldmljZV90d29fc3dub2Rlcyhz
dHJ1Y3QNCmt1bml0ICp0ZXN0KQ0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICJFeHBlY3Rl
ZCBlcnJubyA9PSAtRUlOVkFMLCBnb3Q6ICVwZSIsDQpwZGV2KTsNCiB9DQoNCitzdGF0aWMgdm9p
ZCBwbGF0Zm9ybV9kZXZpY2Vfc3dub2RlX3NoYXJlcl9yZWxlYXNlKHN0cnVjdCBkZXZpY2UgKmRl
dikNCit7DQorfQ0KKw0KKy8qDQorICogQSBzb2Z0d2FyZSBub2RlIGFzc2lnbmVkIGFzIGEgcGxh
dGZvcm0gZGV2aWNlJ3MgcHJpbWFyeSBmaXJtd2FyZQ0Kbm9kZSBtYXkgYmUNCisgKiBzaGFyZWQg
d2l0aCBvdGhlciBkZXZpY2VzOiBpMmMtZGVzaWdud2FyZSBwYXNzZXMgZGV2X2Z3bm9kZSgpIG9m
DQppdHMgcGxhdGZvcm0NCisgKiBkZXZpY2UgZG93biB0byB0aGUgaTJjIGFkYXB0ZXIgZGV2aWNl
IGl0IGNyZWF0ZXMuIENoZWNrIHRoYXQNCnJlbW92aW5nIHRoZQ0KKyAqIHNoYXJpbmcgZGV2aWNl
IGxlYXZlcyB0aGUgb3duZXIncyBzb2Z0d2FyZSBub2RlIGludGFjdC4NCisgKi8NCitzdGF0aWMg
dm9pZCBwbGF0Zm9ybV9kZXZpY2Vfc3dub2RlX3NoYXJlZChzdHJ1Y3Qga3VuaXQgKnRlc3QpDQor
ew0KKyAgICAgICBzdGF0aWMgY29uc3Qgc3RydWN0IHByb3BlcnR5X2VudHJ5IHByb3BlcnRpZXNb
XSA9IHsNCisgICAgICAgICAgICAgICBQUk9QRVJUWV9FTlRSWV9TVFJJTkcoImNvbXBhdGlibGUi
LCAidGVzdCxzaGFyZWQtDQpzd25vZGUiKSwNCisgICAgICAgICAgICAgICB7IH0NCisgICAgICAg
fTsNCisgICAgICAgc3RydWN0IGZ3bm9kZV9oYW5kbGUgKmZ3bm9kZTsNCisgICAgICAgc3RydWN0
IHBsYXRmb3JtX2RldmljZSAqcGRldjsNCisgICAgICAgc3RydWN0IGRldmljZSAqc2hhcmVkOw0K
KyAgICAgICBpbnQgcmV0Ow0KKw0KKyAgICAgICBwZGV2ID0gcGxhdGZvcm1fZGV2aWNlX2FsbG9j
KERFVklDRV9OQU1FLCBQTEFURk9STV9ERVZJRF9OT05FKTsNCisgICAgICAgS1VOSVRfQVNTRVJU
X05PVF9FUlJfT1JfTlVMTCh0ZXN0LCBwZGV2KTsNCisNCisgICAgICAgZndub2RlID0gZndub2Rl
X2NyZWF0ZV9zb2Z0d2FyZV9ub2RlKHByb3BlcnRpZXMsIE5VTEwpOw0KKyAgICAgICBLVU5JVF9B
U1NFUlRfTk9UX0VSUl9PUl9OVUxMKHRlc3QsIGZ3bm9kZSk7DQorICAgICAgIHBsYXRmb3JtX2Rl
dmljZV9zZXRfZndub2RlKHBkZXYsIGZ3bm9kZSk7DQorDQorICAgICAgIHJldCA9IHBsYXRmb3Jt
X2RldmljZV9hZGQocGRldik7DQorICAgICAgIEtVTklUX0FTU0VSVF9FUSh0ZXN0LCByZXQsIDAp
Ow0KKw0KKyAgICAgICAvKg0KKyAgICAgICAgKiBBIHNlY29uZCwgbm9uLXBsYXRmb3JtIGRldmlj
ZSByZWZlcmVuY2luZyB0aGUgc2FtZSBmd25vZGUsDQpsaWtlIHRoZQ0KKyAgICAgICAgKiBpMmMg
YWRhcHRlciBkZXZpY2UgY3JlYXRlZCBieSBpMmMtZGVzaWdud2FyZS4NCisgICAgICAgICovDQor
ICAgICAgIHNoYXJlZCA9IGt1bml0X2t6YWxsb2ModGVzdCwgc2l6ZW9mKCpzaGFyZWQpLCBHRlBf
S0VSTkVMKTsNCisgICAgICAgS1VOSVRfQVNTRVJUX05PVF9FUlJfT1JfTlVMTCh0ZXN0LCBzaGFy
ZWQpOw0KKw0KKyAgICAgICBkZXZpY2VfaW5pdGlhbGl6ZShzaGFyZWQpOw0KKyAgICAgICBzaGFy
ZWQtPnJlbGVhc2UgPSBwbGF0Zm9ybV9kZXZpY2Vfc3dub2RlX3NoYXJlcl9yZWxlYXNlOw0KKyAg
ICAgICByZXQgPSBkZXZfc2V0X25hbWUoc2hhcmVkLCAidGVzdC1zd25vZGUtc2hhcmVyIik7DQor
ICAgICAgIEtVTklUX0FTU0VSVF9FUSh0ZXN0LCByZXQsIDApOw0KKyAgICAgICBkZXZpY2Vfc2V0
X25vZGUoc2hhcmVkLCBkZXZfZndub2RlKCZwZGV2LT5kZXYpKTsNCisNCisgICAgICAgcmV0ID0g
ZGV2aWNlX2FkZChzaGFyZWQpOw0KKyAgICAgICBLVU5JVF9BU1NFUlRfRVEodGVzdCwgcmV0LCAw
KTsNCisNCisgICAgICAgZGV2aWNlX3VucmVnaXN0ZXIoc2hhcmVkKTsNCisNCisgICAgICAgLyog
VGhlIG93bmVyIG11c3Qgc3RpbGwgaGF2ZSBpdHMgc29mdHdhcmUgbm9kZS4gKi8NCisgICAgICAg
S1VOSVRfRVhQRUNUX1BUUl9FUSh0ZXN0LCBkZXZfZndub2RlKCZwZGV2LT5kZXYpLCBmd25vZGUp
Ow0KKw0KKyAgICAgICBwbGF0Zm9ybV9kZXZpY2VfdW5yZWdpc3RlcihwZGV2KTsNCisgICAgICAg
Zndub2RlX3JlbW92ZV9zb2Z0d2FyZV9ub2RlKGZ3bm9kZSk7DQorfQ0KKw0KIHN0YXRpYyBzdHJ1
Y3Qga3VuaXRfY2FzZSBwbGF0Zm9ybV9kZXZpY2Vfc3dub2RlX3Rlc3RzW10gPSB7DQogICAgICAg
IEtVTklUX0NBU0UocGxhdGZvcm1fZGV2aWNlX3N3bm9kZV9hZGRfdHdpY2UpLA0KICAgICAgICBL
VU5JVF9DQVNFKHBsYXRmb3JtX2RldmljZV9zd25vZGVfYXNfcHJpbWFyeSksDQorICAgICAgIEtV
TklUX0NBU0UocGxhdGZvcm1fZGV2aWNlX3N3bm9kZV9zaGFyZWQpLA0KICAgICAgICBLVU5JVF9D
QVNFKHBsYXRmb3JtX2RldmljZV90d29fc3dub2RlcyksDQogICAgICAgIHt9DQogfTsNCg0KDQpU
aGFua3MsDQpTdHVhcnQNCg==
