Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D971D606A31F
	for <intel-xe@archiver.kernel.org>; Wed, 28 Oct 2026 11:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=crsmQ3Fj
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D9E810FBA7;
	Wed, 28 Oct 2026 11:21:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D389410FB84;
 Wed, 28 Oct 2026 11:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793186455; x=1824722455;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=EPnJ0UpyPdS3gNAfDZ0wlAEFWWm1wc2vxKYBBuRcE2o=;
 b=crsmQ3Fjnihzusa/Yi57/1BDfYWKTijLZcWnuwJkCC2RtLUBKeSTD8tL
 OR0+woaYln5MMeN9KuXd6sJ20VFNscuk+OOh2IALBqjzeuYkZz6Zq2dGr
 OJ5glptwmcXt7Er7em5LASnXHQpbhRw5re9LF0SlqT/kni6Ulm5Pw8Ghh
 4K5+de+iJ+c/ATNnc0SFR667GGDDL7yRD7Uj/U6b7p1mAIvHAutV6Kewz
 CDgoBIQ80bkZ5S58IdZzzKhvYx5CsYsVUeh7wgZ6UUYnEcX4RUC2JIAtP
 l2vc92WiDawcq7HiJotmHWKh5mmpWAJ55kAvxNpbZY1hOwEowf5GHlzVD A==;
X-CSE-ConnectionGUID: eS3j/PVmQvu5PwitDkpkSA==
X-CSE-MsgGUID: +R0GNVNPT+a9DCgXuRDeFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="2008677"
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="2008677"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 04:20:55 -0700
X-CSE-ConnectionGUID: 2Rbktj5yTWyJ/jEeZOsb/g==
X-CSE-MsgGUID: lhStS1mjTyaBTvcIVqgVvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="6581563"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa012.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 04:20:54 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 28 Oct 2026 04:20:54 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 28 Oct 2026 04:20:54 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.62) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 28 Oct 2026 04:20:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EJKaXaYrYbtMTvTQ3kBHuiSkDsl25hjHuaEVLmvePoc3kFWiCf4iUte53F9ChrWOovjReh48/obkIcofrHYKSsnsyfOJxWgyDP2/T5jaHgfRjp3pAx4LTllxfGzGw1h2MpmPGUacqODR4PKWQLg4XhHIpA4UusQ5ZCytHHFrV0bCjcMAc+aHah3g8BVFZ1krJOlXQH0px8LHxrFoycfNj5gF7sU8SW7CzUth3Uvk69mSngBBCERBDJVglR0H+qGWifzzXZ7aQA63tn/8dy4990MdymYpqOdttoek1AkNSHZ/a7ZXvAwOqLtZK+wMcq0nENziVo2+L+gXi4KINEdCVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EPnJ0UpyPdS3gNAfDZ0wlAEFWWm1wc2vxKYBBuRcE2o=;
 b=Bo6tUXBSFCvqGw2RmtxaIsKU8VgfMmn/pDphNFZCzer6J84hwdho6nLVsJT8K19aNda3nHYTFMaVis/8ymiXsxwDp/fKRR3974ugqxED40p1RRkyf1jaGuZ9JX4+yE/kjDwhcVW47U/JfRDLCvgEEOpyShzy/SxKJre0sBvSAqQkGbxZ8pHvjqc7TgdXgcKWnHFpU6JjeuI+kudAAQbzhk5613dqcsc2RQkkWTcUH8XdZ1WyA/ZKDIC24YdPHZQ3gV0h3stPM+mfZdrWARBcwtHKSBdBLLon/fwzA3wy7csElVbC0uKtt6hWtK47wTjanJItNLFMqrh6NomfFAtNDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ2PR11MB8346.namprd11.prod.outlook.com (2603:10b6:a03:536::13)
 by SAWPR11MB9897.namprd11.prod.outlook.com (2603:10b6:806:54a::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Wed, 28 Oct
 2026 11:20:51 +0000
Received: from SJ2PR11MB8346.namprd11.prod.outlook.com
 ([fe80::6f5:b048:e73d:d6bc]) by SJ2PR11MB8346.namprd11.prod.outlook.com
 ([fe80::6f5:b048:e73d:d6bc%3]) with mapi id 15.21.0546.016; Wed, 28 Oct 2026
 11:20:51 +0000
From: "Shankar, Uma" <uma.shankar@intel.com>
To: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>, "Naladala, Ramanaidu"
 <ramanaidu.naladala@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>
CC: "Nikula, Jani" <jani.nikula@intel.com>
Subject: RE: [PATCH v5 1/1] drm/i915/gmbus: Add bit-banging debugfs control
Thread-Topic: [PATCH v5 1/1] drm/i915/gmbus: Add bit-banging debugfs control
Thread-Index: AQHdW7IiKFbr5lxe90W5QVUdMaSNE7b9BHYAgBXguCA=
Date: Wed, 28 Oct 2026 11:20:51 +0000
Message-ID: <SJ2PR11MB8346B814E6D59718A863766DF46F2@SJ2PR11MB8346.namprd11.prod.outlook.com>
References: <20261014075956.2104356-1-ramanaidu.naladala@intel.com>
 <20261014075956.2104356-2-ramanaidu.naladala@intel.com>
 <1d9c4669-2523-4bf6-b662-b28a6a0a5716@intel.com>
In-Reply-To: <1d9c4669-2523-4bf6-b662-b28a6a0a5716@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR11MB8346:EE_|SAWPR11MB9897:EE_
x-ms-office365-filtering-correlation-id: 865265ea-f719-4dd7-608e-08df34e5863f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|366016|261026140227099003|38070700021|4143699003|11063799006|56012099006|261009223027099003|261022075727099003|261022113327099003|261021121427099003|10067099003|261022105027099003|3023799007|22082099003|18002099003;
x-microsoft-antispam-message-info: LKY1sFgeIswN2oO67q8O/ZrxEmVUdtGeNUpPM8TbPlFhO+yoogmOAiGIG5EnNgwXHhfOaNpuH4gTuL6y6zXn8CNwkhCPPLeqDnuSOBGoFRAMkPRoNYZBtiy+0cXZI4dGlx29K82JnaGvR3DBmcIy42QDyG2Zf8/dksZpeq512WvpN4RZ2UirRvJ4cUrndk4+iSbz+rd3+n/y8gGeGPngEcP8RPEKfU/xpPEEHXE0u52VhCfjcQCNGCZ7/lKPF56zcsMiGw0nsMlAt0/USt/ZdGvcorQNFKpl/0CUUJXWWz7to26COginXFIbzUY7aJg/7d0x9Ljejp1HPjEce7sjPVzsDuEkvutCjAh4bIR5CQ4Mhd9DFYMwZWJrRkQ+hzkJN9lzD9Avpxz32yuNydG3/iN+62q+FK6q/NfV5Z2eDxyybgiPVt+na8ioblfpT0fhMNWvAUC/qzitazev2QsQJAXC4eUpwcMf7To4wulQAYNZYJ+EuRp4mDbpnXDLu+VLHN/lsO5EbvJO71Ycn0cT8/HiS2S8Wodc4z1myeaQ4xjvHAoZPjfQ2Q1RS8MQYSY+XzfHmPuyn11uMEuf18suZUeiIwB4/K6CgdSy1kP6oJOEqhCNSECN7F54TTsFknOz4HL7eciOHZBOrY05Vgp3muiTJqs1f6lAUgQQOdZS8jtsciKwPw7YsvcjTiZu/+lpiPdncoTxv06n2idmUVzwQGPrnEZWRxpqVGsrnfQiaQk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ2PR11MB8346.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(261026140227099003)(38070700021)(4143699003)(11063799006)(56012099006)(261009223027099003)(261022075727099003)(261022113327099003)(261021121427099003)(10067099003)(261022105027099003)(3023799007)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?a0pHK2s2MmY5ZEJIb1o0dGZoSDljMERyM1ViOHJQcnFjQXBYS2NCQUZqdFBN?=
 =?utf-8?B?b3JlMmJXOURvdlZwZHY5bkVJUHVYc3l1Yk1MS0hsNlFWVnMrZURzK08yQ1Yv?=
 =?utf-8?B?N01iMUhhK0Z0cnZzSEdtVzVMaCt3d3hLV2YyU3kvZ3h1ejBZUGFjcURsTGF3?=
 =?utf-8?B?ZUUvdmRzOC9OSzEzUVc4SWd2NUFOZGVoSEhhRWpQeGNMcDloYUJJSS9maGtL?=
 =?utf-8?B?bTNheEF1cVR2Y2Nua1FSSGxsZEJURjlwMmJIcXgrWUQ3WnlUd2pNRXJxc1VI?=
 =?utf-8?B?b2llelBOWFA1am5ZOFZBd0hmNUozeVB4WmdyWEJQZFlmUUw0NE5HQzc3ZkpH?=
 =?utf-8?B?bmt4eEk1aW5oaEZFYXl1ME1sVEdYU1NuUUlSaENodngyY3F2bVZ2YVhjR3d1?=
 =?utf-8?B?MEtSbjhreGNUcXYwTXp6dzlkUlp3b3BvMUlVR1dvS1AzVUxCbktRTXFNZzda?=
 =?utf-8?B?OTBkcXNGQVd0cUlvUm1sOWpoelVnTnA0M05ycWVqQ2ViS1c2bExvelRNSzJN?=
 =?utf-8?B?YmVHWitLdTBuYWlvSUFteWdhTGJld0F2MGpJVHNCTGR5VGFBSkRwZ0ZWRTk4?=
 =?utf-8?B?c05sYlRuS1lyZHZzdWdtM0RPZ2FIZUxsMW9qUzV3VmNTVjUyQXRQT1V4eFhR?=
 =?utf-8?B?eE9UK081MGFzVVg2MGcyd280UVRUR0tQbjNBZW5JSHVUR0RqMEkrcFFMZVZy?=
 =?utf-8?B?R1A0RzFkb1hRSDlIVzBDQVE0TVI0cVZzUkFyR0lIbEx2ekc2TnIrTTBSNDFi?=
 =?utf-8?B?QmpmaE5PRmxWR0F4Mng4SFJ1VmhabTM3dEU4NWRPVkh2R0RxcU1oY1ZmLzNS?=
 =?utf-8?B?dHpiTUtpcGFCYVVZeDdNWEszejN6dVBhR3JKUW4zRVp5c25NcWhvUEQyeW15?=
 =?utf-8?B?NXNwOEsydXBJRm9IU3dTYStSeDRxNHI5T3FIU2dxTVhGMEZEM21GcURWNEd4?=
 =?utf-8?B?N29CM25oNU1MejR3R3lacm84UTZlcysza05teEY1eXVuc2JQeGtDSVFtdk1J?=
 =?utf-8?B?WDJsRjl3cWMzQUJMOCtpN0s5QUNKZ29Oc2ZjTFpVdDZ2TGhtT01IQWF5ODJN?=
 =?utf-8?B?ejVUaFZ0UXkwbm1ybi9PbVMwbmVDYkIxT1FtZTlsdm1wTE5TeXFBYU9zVlV0?=
 =?utf-8?B?MWNrWVB4RmtaYU9QVWREeUNyOFltQlg1M1JUR0JTOFB6cWtiVENSZEJGemQ5?=
 =?utf-8?B?TjJsTkc4eVZGZlpEbjc0TGNITlowa2ZwZEk5RDhyTkJjT3RHdTVpRzU2L2Mv?=
 =?utf-8?B?UEsraHltbzdQWG92YnhRZnIvWE9wbVhoVjlBVkZTTTVOSXBzWXJkdWgxcjdF?=
 =?utf-8?B?eUE1RW9OZ0IwSmRYSXB6azRUc21MSzBRczRsQVBKTFBTOENLU0Zzb2VpUzdh?=
 =?utf-8?B?Z0ZlSHF4R2RkZ1I2bVI1YWNHbVl2WlhVc3VXOGZsM0Z2eDVYL2xVdzhFSXhj?=
 =?utf-8?B?UXF3Mzg3dGpmZmhsUDBuL05idHBIOGZiQWw2ZmhvdVAwUmFmMWlyMnhla3pZ?=
 =?utf-8?B?T3FDUGVHOE9Sem95aEszSUFLTGRnandmVUN2WXR4Z0FQbC9abkFsa2Z5OEhy?=
 =?utf-8?B?L05XVnQrMFovY3kzVDZqQzBQYjJsN0lIRkxqTGFBYjFKbkxoOFAxc0c5VmZl?=
 =?utf-8?B?Q3pRb0toNFp2cWpDcE9XR3RYMTNBMS9ZcmoyTVhKUHFDMTlKcnpvYjd6MEY1?=
 =?utf-8?B?dms2dUhXWGpPdmorei9KUzJWYmFKQ202RkdxUWFwVVYrRjlqTlVGaHBuZmh3?=
 =?utf-8?B?emdVUWRJY2hKeFFsWU9zbWhXeDI2K3d6a0tMeEh2TDN6TTc0UW5KSTdTVVdW?=
 =?utf-8?B?ZjVYVys2cEppcitQYVlQZ0ZEVVBaWWtla2laSUN0anRIVkExVkYraW9uU1E0?=
 =?utf-8?B?UXFsb3FrQ1cyTHlNRG5aWkJic2V0RU93M1RRQmpJS1lEUXpESUJMd3dEVEVs?=
 =?utf-8?B?ZjFXaC9RQ1B5bFcwMS91b1lYL0hXWnFvQUhEdEc0bk9kYTQ5dUVEczN6M3Z5?=
 =?utf-8?B?akwrTnBRRjFSVTlJV3JWTFBFdU43MFFXTnNONEcrR1NyZ1dHbndhNHl6QldL?=
 =?utf-8?B?aUhCeUxjdThQcTdJUkJSNE1CaUVFYVZFVVd1RTl3c2k4UFphcEJQQnRMYldk?=
 =?utf-8?B?a0F1bFUyS3Q0ZXJTam5UdGY2M0w3MDZXZ2d3d2l6L2RucG1mWWpMVFVOUWhs?=
 =?utf-8?B?RmRTYVZNaEVUMkRoSFJ3ekJnRm9iV1czTVFPQ2xzZnR4RG95RmhPYmNNczZp?=
 =?utf-8?B?NEJIMUVpa3E1azhWV0E4cDZoZmpjRHFzSzY1TmVjcStLUkYzR1R2MStZa3kx?=
 =?utf-8?B?WENMN21idmRqQzdtMk54ZzNxUVB0b2pFNTA2OTNwcllnbDVadVpUQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: XNUi2KI+rRMcqoCtgMnNLy5El5KeuByR9I7uhOeGYLnLOlBgRkveph1nldYU0hHexRp3cIwQisr0nUjEX4FCpwuugrue6Npl+hD+BliR3OaYNG6qI9HrQ+AcKZJL6iRXTtaDvGn1P5kO4eT1NOAWNy5/cYJkH5EmPltPnk4XGB/27Awd7NLvHOdefcbyikAMkJyHeZMxvVFS8mKYhCWiNjoQNCdXYt6+17L7e9d5/sKNMrszzFmv5wEeqsP6mR95Me8bNziUzPNTt6aUjfuIpD2ToSEacSz8PuT+XDkeeD8piiiBv0Z+AEh2MgKBpuTVNgE4E1VC0bfJ34B7VsTHnQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8346.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 865265ea-f719-4dd7-608e-08df34e5863f
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2026 11:20:51.3385 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2/8dO0TFl0G8uOtaJg4LRxlGClneUtyE3MXEvyQCi21YTmSKOawUKknkLYc+OldyBsSSwhXUhCqhHEynyYgyHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAWPR11MB9897
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSW50ZWwteGUgPGludGVs
LXhlLWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgTmF1dGl5YWws
DQo+IEFua2l0IEsNCj4gU2VudDogV2VkbmVzZGF5LCBPY3RvYmVyIDE0LCAyMDI2IDY6NDQgUE0N
Cj4gVG86IE5hbGFkYWxhLCBSYW1hbmFpZHUgPHJhbWFuYWlkdS5uYWxhZGFsYUBpbnRlbC5jb20+
OyBpbnRlbC0NCj4geGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBpbnRlbC1nZnhAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnDQo+IENjOiBOaWt1bGEsIEphbmkgPGphbmkubmlrdWxhQGludGVsLmNvbT4N
Cj4gU3ViamVjdDogUmU6IFtQQVRDSCB2NSAxLzFdIGRybS9pOTE1L2dtYnVzOiBBZGQgYml0LWJh
bmdpbmcgZGVidWdmcyBjb250cm9sDQo+IA0KPiANCj4gT24gMTAvMTQvMjAyNiAxOjI5IFBNLCBO
YWxhZGFsYSBSYW1hbmFpZHUgd3JvdGU6DQo+ID4gQWRkIGEgY29ubmVjdG9yIGRlYnVnZnMgaW50
ZXJmYWNlIHRvIGVuYWJsZSBvciBkaXNhYmxlIEkyQyBiaXQtYmFuZ2luZw0KPiA+IGZvciBJbnRl
bCBHTUJVUyBhZGFwdGVycy4NCj4gPg0KPiA+IHYxOiBBZGRyZXNzIGJlbG93IHJldmlldyBjb21t
ZW50czogKEphbmkgTmlrdWxhKQ0KPiA+ICAgICAgLSBSZW1vdmUgSERNSS1zcGVjaWZpYyBFRElE
IHJlYWQgcGF0aCBjaGFuZ2VzLg0KPiA+ICAgICAgLSBDb250cm9sIGJpdC1iYW5naW5nIGRpcmVj
dGx5IGZyb20gZGVidWdmcyB2aWENCj4gPiBpbnRlbF9nbWJ1c19mb3JjZV9iaXQoKQ0KPiA+DQo+
ID4gdjI6IEFkZHJlc3MgYmVsb3cgcmV2aWV3IGNvbW1lbnRzOiAoSmFuaSBOaWt1bGEpDQo+ID4g
ICAgICAtIFJlbW92ZSBzdXBlcmZsdW91cyBuZXdsaW5lLg0KPiA+ICAgICAgLSBNb3ZlIGRlYnVn
ZnMgYml0LWJhbmdpbmcgc3RhdGUgZnJvbSBzdHJ1Y3QgaW50ZWxfY29ubmVjdG9yIHRvIHN0cnVj
dA0KPiA+ICAgICAgICBpbnRlbF9nbWJ1cyBhcyBkZWJ1Z2ZzX2ZvcmNlX2JpdC4NCj4gPiAgICAg
IC0gTWFrZSBpbnRlbF9nbWJ1c19pc19hZGFwdGVyKCkgc3RhdGljLg0KPiA+ICAgICAgLSBGb2xk
IE5VTEwgYWRhcHRlciBjaGVjayBpbnRvIGludGVsX2dtYnVzX2lzX2FkYXB0ZXIoKS4NCj4gPiAg
ICAgIC0gUmVtb3ZlIHVudXNlZCBpbnRlbF9nbWJ1c19pc19hZGFwdGVyKCkgZGVjbGFyYXRpb24g
ZnJvbSBoZWFkZXIuDQo+ID4NCj4gPiB2MzogUHJvdGVjdCBkZWJ1Z2ZzX2ZvcmNlX2JpdCBhbmQg
Zm9yY2VfYml0IHVwZGF0ZXMgd2l0aA0KPiA+ICAgICAgZ21idXMubXV0ZXguIChBbmtpdCwgc2Fz
aGlrbykNCj4gPg0KPiA+IHY0OiBGaXggY2hlY2twYXRjaCBpc3N1ZXMgYW5kIGFkZHJlc3MgcmV2
aWV3IG5pdHBpY2tzLiAoQW5raXQpDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBOYWxhZGFsYSBS
YW1hbmFpZHUgPHJhbWFuYWlkdS5uYWxhZGFsYUBpbnRlbC5jb20+DQo+IA0KPiBSZXZpZXdlZC1i
eTogQW5raXQgTmF1dGl5YWwgPGFua2l0LmsubmF1dGl5YWxAaW50ZWwuY29tPg0KDQpQdXNoZWQg
dG8gZHJtLWludGVsLW5leHQuIFRoYW5rcyBmb3IgdGhlIHBhdGNoIGFuZCByZXZpZXdzLg0KDQpS
ZWdhcmRzLA0KVW1hIFNoYW5rYXINCg0KPiANCj4gPiAtLS0NCj4gPiAgIC4uLi9kcm0vaTkxNS9k
aXNwbGF5L2ludGVsX2Rpc3BsYXlfZGVidWdmcy5jICB8ICAyICsNCj4gPiAgIGRyaXZlcnMvZ3B1
L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZ21idXMuYyAgICB8IDg2ICsrKysrKysrKysrKysrKysr
KysNCj4gPiAgIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZ21idXMuaCAgICB8
ICAyICsNCj4gPiAgIDMgZmlsZXMgY2hhbmdlZCwgOTAgaW5zZXJ0aW9ucygrKQ0KPiA+DQo+ID4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxheV9k
ZWJ1Z2ZzLmMNCj4gPiBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxh
eV9kZWJ1Z2ZzLmMNCj4gPiBpbmRleCAzZTMwMmYyM2YyNDcuLmI4ZmQ2NTQxNDk5MCAxMDA2NDQN
Cj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXlfZGVi
dWdmcy5jDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kaXNw
bGF5X2RlYnVnZnMuYw0KPiA+IEBAIC00MCw2ICs0MCw3IEBADQo+ID4gICAjaW5jbHVkZSAiaW50
ZWxfZmIuaCINCj4gPiAgICNpbmNsdWRlICJpbnRlbF9mYmMuaCINCj4gPiAgICNpbmNsdWRlICJp
bnRlbF9mYmRldi5oIg0KPiA+ICsjaW5jbHVkZSAiaW50ZWxfZ21idXMuaCINCj4gPiAgICNpbmNs
dWRlICJpbnRlbF9oZGNwLmgiDQo+ID4gICAjaW5jbHVkZSAiaW50ZWxfaGRtaS5oIg0KPiA+ICAg
I2luY2x1ZGUgImludGVsX2hvdHBsdWcuaCINCj4gPiBAQCAtMTMyNyw2ICsxMzI4LDcgQEAgdm9p
ZCBpbnRlbF9jb25uZWN0b3JfZGVidWdmc19hZGQoc3RydWN0DQo+IGludGVsX2Nvbm5lY3RvciAq
Y29ubmVjdG9yKQ0KPiA+ICAgCWlmICghcm9vdCkNCj4gPiAgIAkJcmV0dXJuOw0KPiA+DQo+ID4g
KwlpbnRlbF9nbWJ1c19jb25uZWN0b3JfZGVidWdmc19hZGQoY29ubmVjdG9yKTsNCj4gPiAgIAlp
bnRlbF9kcnJzX2Nvbm5lY3Rvcl9kZWJ1Z2ZzX2FkZChjb25uZWN0b3IpOw0KPiA+ICAgCWludGVs
X2hkY3BfY29ubmVjdG9yX2RlYnVnZnNfYWRkKGNvbm5lY3Rvcik7DQo+ID4gICAJaW50ZWxfcHBz
X2Nvbm5lY3Rvcl9kZWJ1Z2ZzX2FkZChjb25uZWN0b3IpOw0KPiA+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2dtYnVzLmMNCj4gPiBiL2RyaXZlcnMvZ3B1
L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZ21idXMuYw0KPiA+IGluZGV4IGI2YzYzYTQ2NjIzMy4u
ZDQzYzgxZDM2MmU2IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3Bs
YXkvaW50ZWxfZ21idXMuYw0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkv
aW50ZWxfZ21idXMuYw0KPiA+IEBAIC0yNyw2ICsyNyw3IEBADQo+ID4gICAgKglDaHJpcyBXaWxz
b24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4NCj4gPiAgICAqLw0KPiA+DQo+ID4gKyNpbmNs
dWRlIDxsaW51eC9kZWJ1Z2ZzLmg+DQo+ID4gICAjaW5jbHVkZSA8bGludXgvZXhwb3J0Lmg+DQo+
ID4gICAjaW5jbHVkZSA8bGludXgvaTJjLWFsZ28tYml0Lmg+DQo+ID4gICAjaW5jbHVkZSA8bGlu
dXgvaTJjLmg+DQo+ID4gQEAgLTQ3LDYgKzQ4LDcgQEAgc3RydWN0IGludGVsX2dtYnVzIHsNCj4g
PiAgIAlzdHJ1Y3QgaTJjX2FkYXB0ZXIgYWRhcHRlcjsNCj4gPiAgICNkZWZpbmUgR01CVVNfRk9S
Q0VfQklUX1JFVFJZICgxVSA8PCAzMSkNCj4gPiAgIAl1MzIgZm9yY2VfYml0Ow0KPiA+ICsJYm9v
bCBkZWJ1Z2ZzX2ZvcmNlX2JpdDsNCj4gPiAgIAl1MzIgcmVnMDsNCj4gPiAgIAlpbnRlbF9yZWdf
dCBncGlvX3JlZzsNCj4gPiAgIAlzdHJ1Y3QgaTJjX2FsZ29fYml0X2RhdGEgYml0X2FsZ287DQo+
ID4gQEAgLTg4OSw2ICs4OTEsOTAgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBpMmNfYWxnb3JpdGht
IGdtYnVzX2FsZ29yaXRobSA9IHsNCj4gPiAgIAkuZnVuY3Rpb25hbGl0eQk9IGdtYnVzX2Z1bmMN
Cj4gPiAgIH07DQo+ID4NCj4gPiArc3RhdGljIGJvb2wgaW50ZWxfZ21idXNfaXNfYWRhcHRlcihz
dHJ1Y3QgaW50ZWxfY29ubmVjdG9yICpjb25uZWN0b3IpDQo+ID4gK3sNCj4gPiArCXN0cnVjdCBp
MmNfYWRhcHRlciAqYWRhcHRlciA9IGNvbm5lY3Rvci0+YmFzZS5kZGM7DQo+ID4gKw0KPiA+ICsJ
cmV0dXJuIGFkYXB0ZXIgJiYgYWRhcHRlci0+YWxnbyA9PSAmZ21idXNfYWxnb3JpdGhtOyB9DQo+
ID4gKw0KPiA+ICtzdGF0aWMgaW50IGludGVsX2ZvcmNlX2JpdF9iYW5naW5nX3Nob3coc3RydWN0
IHNlcV9maWxlICptLCB2b2lkDQo+ID4gKypkYXRhKSB7DQo+ID4gKwlzdHJ1Y3QgaW50ZWxfY29u
bmVjdG9yICpjb25uZWN0b3IgPSBtLT5wcml2YXRlOw0KPiA+ICsJc3RydWN0IGludGVsX2dtYnVz
ICpidXMgPSBjb250YWluZXJfb2YoY29ubmVjdG9yLT5iYXNlLmRkYywNCj4gPiArCQkJCQkgICAg
ICAgc3RydWN0IGludGVsX2dtYnVzLCBhZGFwdGVyKTsNCj4gPiArCXN0cnVjdCBpbnRlbF9kaXNw
bGF5ICpkaXNwbGF5ID0gYnVzLT5kaXNwbGF5Ow0KPiA+ICsJYm9vbCBmb3JjZV9iaXRfYmFuZ2lu
ZzsNCj4gPiArDQo+ID4gKwltdXRleF9sb2NrKCZkaXNwbGF5LT5nbWJ1cy5tdXRleCk7DQo+ID4g
Kwlmb3JjZV9iaXRfYmFuZ2luZyA9IGJ1cy0+ZGVidWdmc19mb3JjZV9iaXQ7DQo+ID4gKwltdXRl
eF91bmxvY2soJmRpc3BsYXktPmdtYnVzLm11dGV4KTsNCj4gPiArDQo+ID4gKwlzZXFfcHJpbnRm
KG0sICIldVxuIiwgZm9yY2VfYml0X2JhbmdpbmcpOw0KPiA+ICsNCj4gPiArCXJldHVybiAwOw0K
PiA+ICt9DQo+ID4gKw0KPiA+ICtzdGF0aWMgc3NpemVfdCBpbnRlbF9mb3JjZV9iaXRfYmFuZ2lu
Z193cml0ZShzdHJ1Y3QgZmlsZSAqZmlsZSwNCj4gPiArCQkJCQkgICAgIGNvbnN0IGNoYXIgX191
c2VyICp1YnVmLA0KPiA+ICsJCQkJCSAgICAgc2l6ZV90IGxlbiwgbG9mZl90ICpvZmZwKQ0KPiA+
ICt7DQo+ID4gKwlzdHJ1Y3Qgc2VxX2ZpbGUgKm0gPSBmaWxlLT5wcml2YXRlX2RhdGE7DQo+ID4g
KwlzdHJ1Y3QgaW50ZWxfY29ubmVjdG9yICpjb25uZWN0b3IgPSBtLT5wcml2YXRlOw0KPiA+ICsJ
c3RydWN0IGludGVsX2dtYnVzICpidXMgPSBjb250YWluZXJfb2YoY29ubmVjdG9yLT5iYXNlLmRk
YywNCj4gPiArCQkJCQkgICAgICAgc3RydWN0IGludGVsX2dtYnVzLCBhZGFwdGVyKTsNCj4gPiAr
CXN0cnVjdCBpbnRlbF9kaXNwbGF5ICpkaXNwbGF5ID0gYnVzLT5kaXNwbGF5Ow0KPiA+ICsJYm9v
bCBmb3JjZV9iaXRfYmFuZ2luZzsNCj4gPiArCWJvb2wgY2hhbmdlZCA9IGZhbHNlOw0KPiA+ICsJ
dTMyIGZvcmNlX2JpdCA9IDA7DQo+ID4gKwlpbnQgcmV0Ow0KPiA+ICsNCj4gPiArCXJldCA9IGtz
dHJ0b2Jvb2xfZnJvbV91c2VyKHVidWYsIGxlbiwgJmZvcmNlX2JpdF9iYW5naW5nKTsNCj4gPiAr
CWlmIChyZXQpDQo+ID4gKwkJcmV0dXJuIHJldDsNCj4gPiArDQo+ID4gKwltdXRleF9sb2NrKCZk
aXNwbGF5LT5nbWJ1cy5tdXRleCk7DQo+ID4gKwlpZiAoZm9yY2VfYml0X2JhbmdpbmcgIT0gYnVz
LT5kZWJ1Z2ZzX2ZvcmNlX2JpdCkgew0KPiA+ICsJCWJ1cy0+Zm9yY2VfYml0ICs9IGZvcmNlX2Jp
dF9iYW5naW5nID8gMSA6IC0xOw0KPiA+ICsJCWZvcmNlX2JpdCA9IGJ1cy0+Zm9yY2VfYml0Ow0K
PiA+ICsJCWJ1cy0+ZGVidWdmc19mb3JjZV9iaXQgPSBmb3JjZV9iaXRfYmFuZ2luZzsNCj4gPiAr
CQljaGFuZ2VkID0gdHJ1ZTsNCj4gPiArCX0NCj4gPiArCW11dGV4X3VubG9jaygmZGlzcGxheS0+
Z21idXMubXV0ZXgpOw0KPiA+ICsNCj4gPiArCWlmIChjaGFuZ2VkKQ0KPiA+ICsJCWRybV9kYmdf
a21zKGRpc3BsYXktPmRybSwNCj4gPiArCQkJICAgICIlc2FibGluZyBiaXQtYmFuZ2luZyBvbiAl
cy4gZm9yY2UgYml0IG5vdyAlZFxuIiwNCj4gPiArCQkJICAgIGZvcmNlX2JpdF9iYW5naW5nID8g
ImVuIiA6ICJkaXMiLA0KPiA+ICsJCQkgICAgY29ubmVjdG9yLT5iYXNlLmRkYy0+bmFtZSwgZm9y
Y2VfYml0KTsNCj4gPiArDQo+ID4gKwkqb2ZmcCArPSBsZW47DQo+ID4gKw0KPiA+ICsJcmV0dXJu
IGxlbjsNCj4gPiArfQ0KPiA+ICsNCj4gPiArc3RhdGljIGludCBpbnRlbF9mb3JjZV9iaXRfYmFu
Z2luZ19vcGVuKHN0cnVjdCBpbm9kZSAqaW5vZGUsIHN0cnVjdA0KPiA+ICtmaWxlICpmaWxlKSB7
DQo+ID4gKwlyZXR1cm4gc2luZ2xlX29wZW4oZmlsZSwgaW50ZWxfZm9yY2VfYml0X2Jhbmdpbmdf
c2hvdywNCj4gPiAraW5vZGUtPmlfcHJpdmF0ZSk7IH0NCj4gPiArDQo+ID4gK3N0YXRpYyBjb25z
dCBzdHJ1Y3QgZmlsZV9vcGVyYXRpb25zIGludGVsX2ZvcmNlX2JpdF9iYW5naW5nX2ZvcHMgPSB7
DQo+ID4gKwkub3duZXIgPSBUSElTX01PRFVMRSwNCj4gPiArCS5vcGVuID0gaW50ZWxfZm9yY2Vf
Yml0X2Jhbmdpbmdfb3BlbiwNCj4gPiArCS5yZWFkID0gc2VxX3JlYWQsDQo+ID4gKwkubGxzZWVr
ID0gc2VxX2xzZWVrLA0KPiA+ICsJLnJlbGVhc2UgPSBzaW5nbGVfcmVsZWFzZSwNCj4gPiArCS53
cml0ZSA9IGludGVsX2ZvcmNlX2JpdF9iYW5naW5nX3dyaXRlLCB9Ow0KPiA+ICsNCj4gPiArdm9p
ZCBpbnRlbF9nbWJ1c19jb25uZWN0b3JfZGVidWdmc19hZGQoc3RydWN0IGludGVsX2Nvbm5lY3Rv
cg0KPiA+ICsqY29ubmVjdG9yKSB7DQo+ID4gKwlpZiAoaW50ZWxfZ21idXNfaXNfYWRhcHRlcihj
b25uZWN0b3IpKQ0KPiA+ICsJCWRlYnVnZnNfY3JlYXRlX2ZpbGUoImludGVsX2ZvcmNlX2JpdF9i
YW5naW5nIiwgMDY0NCwNCj4gPiArCQkJCSAgICBjb25uZWN0b3ItPmJhc2UuZGVidWdmc19lbnRy
eSwgY29ubmVjdG9yLA0KPiA+ICsJCQkJICAgICZpbnRlbF9mb3JjZV9iaXRfYmFuZ2luZ19mb3Bz
KTsgfQ0KPiA+ICsNCj4gPiAgIHN0YXRpYyB2b2lkIGdtYnVzX2xvY2tfYnVzKHN0cnVjdCBpMmNf
YWRhcHRlciAqYWRhcHRlciwNCj4gPiAgIAkJCSAgIHVuc2lnbmVkIGludCBmbGFncykNCj4gPiAg
IHsNCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9n
bWJ1cy5oDQo+ID4gYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2dtYnVzLmgN
Cj4gPiBpbmRleCA1ZmRlYWIxYWE3OTQuLjVjMDMxMDBjZTQ2YiAxMDA2NDQNCj4gPiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2dtYnVzLmgNCj4gPiArKysgYi9kcml2
ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2dtYnVzLmgNCj4gPiBAQCAtOSw2ICs5LDcg
QEANCj4gPiAgICNpbmNsdWRlIDxsaW51eC90eXBlcy5oPg0KPiA+DQo+ID4gICBzdHJ1Y3QgaTJj
X2FkYXB0ZXI7DQo+ID4gK3N0cnVjdCBpbnRlbF9jb25uZWN0b3I7DQo+ID4gICBzdHJ1Y3QgaW50
ZWxfZGlzcGxheTsNCj4gPg0KPiA+ICAgI2RlZmluZSBHTUJVU19QSU5fRElTQUJMRUQJMA0KPiA+
IEBAIC00MSw2ICs0Miw3IEBAIGludCBpbnRlbF9nbWJ1c19vdXRwdXRfYWtzdihzdHJ1Y3QgaTJj
X2FkYXB0ZXINCj4gPiAqYWRhcHRlcik7DQo+ID4NCj4gPiAgIHN0cnVjdCBpMmNfYWRhcHRlciAq
DQo+ID4gICBpbnRlbF9nbWJ1c19nZXRfYWRhcHRlcihzdHJ1Y3QgaW50ZWxfZGlzcGxheSAqZGlz
cGxheSwgdW5zaWduZWQgaW50DQo+ID4gcGluKTsNCj4gPiArdm9pZCBpbnRlbF9nbWJ1c19jb25u
ZWN0b3JfZGVidWdmc19hZGQoc3RydWN0IGludGVsX2Nvbm5lY3Rvcg0KPiA+ICsqY29ubmVjdG9y
KTsNCj4gPiAgIHZvaWQgaW50ZWxfZ21idXNfZm9yY2VfYml0KHN0cnVjdCBpMmNfYWRhcHRlciAq
YWRhcHRlciwgYm9vbCBmb3JjZV9iaXQpOw0KPiA+ICAgYm9vbCBpbnRlbF9nbWJ1c19pc19mb3Jj
ZWRfYml0KHN0cnVjdCBpMmNfYWRhcHRlciAqYWRhcHRlcik7DQo+ID4gICB2b2lkIGludGVsX2dt
YnVzX3Jlc2V0KHN0cnVjdCBpbnRlbF9kaXNwbGF5ICpkaXNwbGF5KTsNCg==
