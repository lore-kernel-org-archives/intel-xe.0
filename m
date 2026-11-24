Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65F12606A321
	for <intel-xe@archiver.kernel.org>; Tue, 24 Nov 2026 11:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NmktBKP7;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=Lw/3E33J
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E794C10F4E5;
	Tue, 24 Nov 2026 11:19:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3220410F4E5;
 Tue, 24 Nov 2026 11:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795519183; x=1827055183;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=tVsbQt9h/dDYOEANmDCMAS1jJGG17jPzH1HLIy/O+XI=;
 b=NmktBKP7Fr/mkQqjDE91/Wm9MLnwbQrs/FQxX1e/X2Q63fU7Zok8pHRb
 cvoWIEiYXpD5GRkLkEU4g0AjxOE1uly2bahLvgRrbyi6iTmNdo3gvCfSM
 q7oxFKd1O3pyk8WpRx2GLIXVpJ7D5JzZkFUaEwCqU4a/ghyukBptFbIss
 47TZ2cIv4IVHJYDeEzSJxQRclmSXqB0tlwlSKPuWvXAZ91bTCeUKFu0L6
 U6rzEIktY2CMjWovRkTCZKxL3LUF4msuuP+fWvHkweKPKxDRcYGR3eQgr
 Q1dAVT3miqF0TWkczRrlmMm5k9OkaKH7uF+4Gjr2a4IzVQL+cggAxjh+h A==;
X-CSE-ConnectionGUID: o9PyVuiwTnq++7mjoKm7Rw==
X-CSE-MsgGUID: o6o4x25mSuGM/Zz6Yy6V5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4267780"
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; 
   d="scan'208";a="4267780"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 03:19:27 -0800
X-CSE-ConnectionGUID: RwFPXkLPRs2epWbRUeGs3A==
X-CSE-MsgGUID: 46Nu16KjQICUhBJw513mrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; d="scan'208";a="11727136"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 03:19:23 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Tue, 24 Nov 2026 03:19:21 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Tue, 24 Nov 2026 03:19:21 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.58) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Tue, 24 Nov 2026 03:19:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vAYAr/bzg+sgGdDL7hpkIZlGKRuN3CfG3K2ywTMKYWmk7urtBLgHr9PumMBygREEzndBOkHiKYX8A2Ri7qk9yBY8E+oGKMuEwUpekOszGEa0wqVU/i7rpl3MigJZeiJT3s1DKGHZ4k+bpalbMKO0q5sqoHCx5e0RuxrKFNcw6V36c3C52WdpQS/s5USWYRLlPK5A3T/OdKOtatVFWURAupKt/O4PieVGX3ePC4HMc1JccjStVwwNaWOm9mOcAZzIWonKt3JJWj0Fn13viqAq5Dk6xn+G6vIk7oujfYCH1Gdk2j0E+iNQGq/z3Wbhcy/p/w7Vd+UZkuhNydA8YtxD+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tVsbQt9h/dDYOEANmDCMAS1jJGG17jPzH1HLIy/O+XI=;
 b=g2M7ts1V8dPmn4yWl5reAXHsa2Y3w2i0bCApIeD65dmA0s/f9EoNTrraxo3ancabJeWyTHw/IX/7ALQy+ZYgECYV19vb3jkk+M75DdsPu8O0vgUmSbiK3FyhQIN13+4lX5QQLTsgei7DjJJLwYBT/c1qfNjDnk2VJkpROGFf+xXMylhUk80q5lXnCMAarHG1bo57eJ2Jrs+8Ymjbd01C000d9PGQpe3hyLW6cuLvHSmsBZQKpfrRBv98c5Rsxuw08P0KZjVS9iq5IhgG/QaY9t7C4PxV2sFJ+iZyCpRb8qK5xwjgkalHRS/h3RBBIatb4vRmrlC/bqotQPK3hltfog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tVsbQt9h/dDYOEANmDCMAS1jJGG17jPzH1HLIy/O+XI=;
 b=Lw/3E33JmbK/dcGJgzMV4+2Wl8LYZ9Je2lsawN54C+EWvHGijqqxnDzzs+dBwsih0G7V7EG5jZMOPoepCkhw81gR0uN3T1gQe2RkPGZVMfalp+dP/eJ2++3is/A5G+Tkmls1ndxeJGWSLYpFPdvtVYPEGxJMbD0glpkORhN7L9c=
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 SA2PR11MB5004.namprd11.prod.outlook.com (2603:10b6:806:112::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Tue, 24 Nov
 2026 11:19:12 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::9086:5e0b:ad24:762]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::9086:5e0b:ad24:762%6]) with mapi id 15.21.0639.012; Tue, 24 Nov 2026
 11:19:12 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 "j@metarealtyinc.ca" <j@metarealtyinc.ca>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Shankar, Uma" <uma.shankar@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, "Manna, Animesh" <animesh.manna@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>, "Nautiyal, Ankit
 K" <ankit.k.nautiyal@intel.com>
Subject: Re: [PATCH v2 3/4] drm/i915/alpm: Leave AS SDP Transmission in Active
 Disable to PSR code
Thread-Topic: [PATCH v2 3/4] drm/i915/alpm: Leave AS SDP Transmission in
 Active Disable to PSR code
Thread-Index: AQHdebOC8p2Jiiuo2kSrTDowOyP+67c9F9iA
Date: Tue, 24 Nov 2026 11:19:12 +0000
Message-ID: <d6a772b2bb1cf3c97a3436d3699532e9b8a73d44.camel@intel.com>
References: <awCCGeCxHToY8tsI@intel.com>
 <cover.1795263689.git.j@metarealtyinc.ca>
 <7b1c4022b174d3806130f5814142760a8693e340.1795263689.git.j@metarealtyinc.ca>
In-Reply-To: <7b1c4022b174d3806130f5814142760a8693e340.1795263689.git.j@metarealtyinc.ca>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|SA2PR11MB5004:EE_
x-ms-office365-filtering-correlation-id: f3140cc2-bed3-40f0-66d0-08df4a1cc475
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|4143699003|38070700021|11063799006|56012099006|261021121427099003|10067099003|261102123227099003|261009223027099003|261021123027099003|18002099003|22082099003|3023799007;
x-microsoft-antispam-message-info: stvW4OokEajR9468x8qpjI99vp6rGPPtc+t+WBr2tqjWOtW/sEf7VZ4k9xXCMA5nkq+5lF+RThkjXC7CtyuaI/LSSUUuvHY3WjbOVQdF/QgJdOMJ2rdMepaql5su11HuBvhYtmn+7WhEv0vMeC9gvldY952+7evBgHQUo2pOMPNDuY0uqytPZybJqdKK/q099QBsOjvguyzt2DcHl9V8ebQz1Yogq6hEG1/VLzns/KVgYUQQfSjWhXtfGcphtbKK2/h+zRPUHITk99iomiSByrqsp/YffRv1GbIbKqrmUx6kUHi8VXfjnW4c0/CsEuBm0NzYvNhM88xbAa+Gwws2k+731yN9RHqXjQwo2yZiYORpAL/KxDrFR2AGq1OuuE29ZQUU6iKCqNLyBe+M0wv4wlvuUo7l8AAYXrbYiYI/VUYCagMhDm4IKqxiMcoBRGa9RA8nckAd2qlDY534d+byErMEjE4J0NBaujTc7oE+JptwSlNlDEWpjnDZ7q0xVaBLNjDAHDZSaedwgNynapQGmNmWuYk6Ze0D0yy7ejMjjnoiJ/ObZrHQ3uPTP/PKvrvbPNSb5ELRiyT1TuvWHQMT1BEV5rWuTVUeaYx1ADFSa6nV4gPrZd7dhWOvlj7wW1WGP+7CNb5qJPfRLzEqLolfMFarNCejXCLAGsYF6mGF0BCuVJqP+K60E71FKJCYQ/xt6lRekY0U6AVNm1M+AkUWew==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(4143699003)(38070700021)(11063799006)(56012099006)(261021121427099003)(10067099003)(261102123227099003)(261009223027099003)(261021123027099003)(18002099003)(22082099003)(3023799007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aE03SzlyL0N4YUhlV3ZtQ01qMS9aWTJROHIxRCtzYlhmQUVCdXA1UGVIL0t0?=
 =?utf-8?B?UkxmTFFDM1FrVk9LQ3llRllDdHVWYURLU1F5Ulk0TElkOFdLMnRjYkNaUURN?=
 =?utf-8?B?dDkwZFRCQjBGcE13bWZtSlNxczArMm0xWTBSRTNaak1iS1hxRmFQbm5neUo0?=
 =?utf-8?B?bFlQcm9uQVI4ZE5NN2ZpSmxRQi91aW4yb1lJWUExak5GSElBMHI3SU5pZklz?=
 =?utf-8?B?NysxVGhZMHZPUi9HZWZEWUxQT1ZsbFV5RW1xd3loc2xBZllZRG9nWHFlZXBh?=
 =?utf-8?B?aU94am9wSHNwd2gwU1RPWm8xNnF0QURxK1daYlhiNzRENnVlaG04Vk95NC9P?=
 =?utf-8?B?dDZQTVo2VTN0K2RkZlAzU0FLRFlzQU5uRE5Ob3hyRXpKN2dCV05QeUF0a3Vt?=
 =?utf-8?B?eHVYaXdFZ2Q3dWdTRWF0OW5Zb2JibE80UTNPZ3FIRFZubUhQc3JySUVScjRK?=
 =?utf-8?B?dkdqazZUL3MwZVJ5dlVueGhvQldKazcvVS8veVFPTlcxL21TN1c3Q2dORHRz?=
 =?utf-8?B?NVBKRHBrN3lDTysxTGZSd3FJbGQyQlpSODdvcGNlVkZzL0pXaldEMVVkMFQx?=
 =?utf-8?B?TjdKYUg0UnoweG5sZm95OFpUOUZkTFdIcERvcHdDVkxvdG1FaWhzb29ldnNx?=
 =?utf-8?B?UVFFOUZHaVFpaEl0OFNOVVlqR25EbVFrVDJpYVh5OFNIcWIyaWhTVXR2UDZp?=
 =?utf-8?B?alVtQmhnazMyYzhYN2k0ZDhTN3ltWXhIMFYyZzRrdGI0YzdDTWVFZkorTW1B?=
 =?utf-8?B?QUlsb3RwRXZSNTRYazgyWDFRZkltUWRhRytpeTM2MlpUOEJyQU8wN080V1VM?=
 =?utf-8?B?c1RwZHdkSmxLQS9LcHRsZE5qWnU1MzJLM1BHUnRLa0RPYmNKWThScmt1bW05?=
 =?utf-8?B?aHF2Z2k2TGY5WEZmZkdUSVVRQUlEd1J2T2NSMEhSMDhXS241aFNyVTFYZy94?=
 =?utf-8?B?ZzZycHFtekYxNFM1aTUxcnoxOWhXR1AvYU0rRzhaQkRQa0E3SGkyVGovUldZ?=
 =?utf-8?B?UGRXcXh1NlhYMEVLQ09uSEQvQ3lvU0F0VzZvSFVYNFUwZUtIbk52UHA5Snhz?=
 =?utf-8?B?c2dvZCsvejEzSjc0YUNYbDh0NER0NE9nMkNuK3RQZEIrRmNoVzVhNENpZFpI?=
 =?utf-8?B?UW9SS3UxUXJHTEw1TnhuNU1nSUpRRjRiL3RRODJLZHUwQTRSV09yaEo0Q1dQ?=
 =?utf-8?B?Yk5haDhkVVZCVHphaG0xclhYdkxTM1F4eDFOV0tDdlRBaWhoaVRqZUorWkpL?=
 =?utf-8?B?UnZHWjdncnYzZ09Md2hicHJ4SlAyZDBST3psNW1HOXdVYlFESWkrY05mY1Jl?=
 =?utf-8?B?VjNWYWxzQm9sb0VnZGxORXphNW14aXFIMExFd1hWOEFhdTJhY3ltZTZLV2pI?=
 =?utf-8?B?UGJSOVNMN0Q5SE80cVFMUExmWnpDYzVETERVck16aHQ0MGFPL25wby9PZUJs?=
 =?utf-8?B?ODhySWI2NHpET0xzdFhtNmRwM0d6Q1NNQlVMM3Y2TVYwOHU4S2ttVlNFV3o4?=
 =?utf-8?B?bGlSMEdJY056N2UzaFIwc1dBM1duQ3pQMGVUb2E5R05JNGM0MkRwd0VFbG02?=
 =?utf-8?B?SjFjQlMyT2Q0c0VlTW9ET2ZoQXkzTGZEWThTOVBwWTdkaURuc1piZzJ2WkxF?=
 =?utf-8?B?OE9CM0lpeUg5Z2JleVBJbWlCZjFNK29QL3ZOMmNJNDVTQ21KOFRlb0tnTkxw?=
 =?utf-8?B?S2wxK3RyQW1lTjVUSkltbFdEa2duTU9uSE9IaWtFQWg0ZGZoMThjWERuY2NM?=
 =?utf-8?B?RnRVNWo1ZkgrT3hrUmRZdy9RcjR5WlU1K3pUd05peDNUZloycUduZ0V2ZHo1?=
 =?utf-8?B?cnJRR1QvZXlaUmJNbGtpSDNHMmc5OHE0dnRxcWhDM2l2Z0plUEhEVUtyMkxl?=
 =?utf-8?B?bGFUZDM3dG1MK091WFBGSkk1UUkvK3JPOVM4d0hQdkl6S0RXVWJhQTNUcTBp?=
 =?utf-8?B?S21oUVRVanp2bTVMZVB1NlRVc25OQ0lwL1kxWWZUNkxoRFR5ME1CaWQ3c2dl?=
 =?utf-8?B?alpqSWtXeDlLWGg1MHVHVE5aeWdGMjZxbHY5Q1dJL3pZcTNYdnVUdzZJZ3Ir?=
 =?utf-8?B?YXFXN0xFZEFFdzJJMjVYeTl6UDZtMWI0TGI1OEhGS25WSHNkeWdnNmlPVDBU?=
 =?utf-8?B?SE1DbEJQQStHZ0d3b2cwWHhrUjMvVlVpS01tUWtzODlLeEFIVVRUTHE3ZTFm?=
 =?utf-8?B?b1RZS3VzYmRDZ0VRT2pra0t5QjhXM09Pcm5VOEliQlBDOHlXdjR1WHRubEVO?=
 =?utf-8?B?NzRXZGtGbUpQUFFCcXRWTnQwUFZyOWhNejFDSGtpQ2lFM1ZOaWVLcm5UTmRO?=
 =?utf-8?B?Q0F5RHJQVVBkWllDa2Yyc0VBUUhIbjg1UHhNalRkRjNjeTdUWmhlVmRTRXpa?=
 =?utf-8?Q?IO6iXc8DWRhx0X7U=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <60604FF699EEA44D8D2D64FF7458FAD9@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: eCLvuU4k15ZuaIDW1/u6VHFX5caxDSHgXqjkv9+US3PbD2aBZP63YnAfVGyBZwTMjk+JMab+nTcIF+JiIGj/oJ28k7bzdYmYiuusufG7hWiQV8u536Ism8iX5R2oxn5qLwGw48KGdrz/zOyKt+xuWeVva2Kg66MOYYg4B1O96Z5ls8d45V1id2YMeBySwdatVEGUcbw99fEAvv7cLslEVpsvXPhaGwSm2nh5bbCxDHpS9E4iRhm5P2ut91624Qx/P5TWxNor3sASciW6P3MNzPuydQNLRCYl2ieU+KGEMy6bBz9xzXxQiOild/eNgFhmd+VVFQk93maT9Cn3QheRIw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3140cc2-bed3-40f0-66d0-08df4a1cc475
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2026 11:19:12.4893 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: a3i9dOmcmQb9J+am3ftJyTTM7ZeltlDWU8YsShYw/qgH7KBlMhdwxcd2xI+3bN+1uzCrUNjHUI7/3+IC7wrW402f3s67PDK5bJGfM8i4R38=
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gU2F0LCAyMDI2LTExLTIxIGF0IDA3OjI1IC0wNTAwLCBKYWtlIFN0ZWlubWFuIHdyb3RlOg0K
PiBQU1IgY29kZSBub3cgc2V0cyBhbmQgY2xlYXJzIFBSX0FMUE1fQ1RMW0FTIFNEUCBUcmFuc21p
c3Npb24gaW4NCj4gQWN0aXZlDQo+IERpc2FibGVdIGFyb3VuZCBmcmFtZSB1cGRhdGVzLiBTdG9w
IHNldHRpbmcgaXQgaW4NCj4gaW50ZWxfYWxwbV9jb25maWd1cmVfcHJfYXNfc2RwKCkgYW5kIGtl
ZXAgaXRzIGN1cnJlbnQgdmFsdWUgaW5zdGVhZCwNCj4gc28NCj4gdGhhdCBhIHNlYW1sZXNzIFZS
UiB0b2dnbGUgbm8gbG9uZ2VyIHN1c3BlbmRzIHRoZSBBUyBTRFAgd2hpbGUgZnJhbWVzDQo+IGFy
ZQ0KPiBiZWluZyB1cGRhdGVkLg0KPiANCj4gQ2M6IEpvdW5pIEjDtmdhbmRlciA8am91bmkuaG9n
YW5kZXJAaW50ZWwuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBKYWtlIFN0ZWlubWFuIDxqQG1ldGFy
ZWFsdHlpbmMuY2E+DQo+IC0tLQ0KPiDCoGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50
ZWxfYWxwbS5jIHwgOCArKysrKystLQ0KPiDCoDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMo
KyksIDIgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5
MTUvZGlzcGxheS9pbnRlbF9hbHBtLmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5
L2ludGVsX2FscG0uYw0KPiBpbmRleCA5MTAwNjdkMjcuLjZmMmJlYjRhNCAxMDA2NDQNCj4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9hbHBtLmMNCj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9hbHBtLmMNCj4gQEAgLTQ2Nyw4ICs0Njcs
MTIgQEAgc3RhdGljIHZvaWQNCj4gaW50ZWxfYWxwbV9jb25maWd1cmVfcHJfYXNfc2RwKHN0cnVj
dCBpbnRlbF9kcCAqaW50ZWxfZHAsDQo+IMKgCX0gZWxzZSB7DQo+IMKgCQlwcl9hbHBtX2N0bCAm
PSB+UFJfQUxQTV9DVExfQVNfU0RQX1NLSVBfRlJBTUVTX01BU0s7DQo+IMKgDQo+IC0JCWlmIChj
cnRjX3N0YXRlLT5kaXNhYmxlX2FzX3NkcF93aGVuX3ByX2FjdGl2ZSkNCj4gLQkJCXByX2FscG1f
Y3RsIHw9DQo+IFBSX0FMUE1fQ1RMX0FTX1NEUF9UUkFOU01JU1NJT05fSU5fQUNUSVZFX0RJU0FC
TEU7DQo+ICsJCS8qDQo+ICsJCSAqIEFTIFNEUCBUcmFuc21pc3Npb24gaW4gQWN0aXZlIERpc2Fi
bGUgZm9sbG93cw0KPiBmcmFtZSB1cGRhdGVzDQo+ICsJCSAqIGFuZCBpcyBvd25lZCBieSBQU1Ig
Y29kZSwga2VlcCBpdHMgY3VycmVudCB2YWx1ZS4NCj4gKwkJICovDQo+ICsJCXByX2FscG1fY3Rs
IHw9IGludGVsX2RlX3JlYWQoZGlzcGxheSwNCj4gUFJfQUxQTV9DVEwoZGlzcGxheSwgY3B1X3Ry
YW5zY29kZXIpKSAmDQo+ICsJCQlQUl9BTFBNX0NUTF9BU19TRFBfVFJBTlNNSVNTSU9OX0lOX0FD
VElWRV9ESQ0KPiBTQUJMRTsNCg0KSSdtIG5vdCBzdXJlIGlmIHRoaXMgZGVzZXJ2ZXMgdGhpcyBt
dWNoIGF0dGVudGlvbi4gSnVzdCByZW1vdmUgc2V0dGluZw0KaXQuDQoNCkJSLA0KSm91bmkgSMO2
Z2FuZGVyDQoNCj4gwqANCj4gwqAJCWlmIChpbnRlbF9kaXNwbGF5X3Bvd2VyX2RjM2NvX2FsbG93
ZWQoZGlzcGxheSkpDQo+IMKgCQkJcHJfYWxwbV9jdGwgfD0NCj4gUFJfQUxQTV9DVExfVVNFX0RD
M0NPX0lETEVfUFJPVE9DT0w7DQo=
