Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB123606A322
	for <intel-xe@archiver.kernel.org>; Tue, 27 Oct 2026 15:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fmKayECf
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 810F910F6DE;
	Tue, 27 Oct 2026 15:53:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECC0E10F6D5;
 Tue, 27 Oct 2026 15:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793116415; x=1824652415;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=GNAB8tnUdfYg9w3vUAihOyIkVnEilvCu8h0uMCSK18M=;
 b=fmKayECfQpB/Ivbk/N6XRx/71aMFB9NsrAQUB39pfFXH0J/tj1ca+GWN
 tQO/inLygATzWQmLK4bz7kWTJCc6mWlXOXSfXsMnYu3snmOAiT2JSf6ne
 hNsCd3m/KzpRHJ/D+vs6Pjj/JEbknTEOnF3HnKQAFqnSTP/b3csWtjMC0
 SJTXGDn6b1My8SGKRKPLtzif3fl8k7peWOGDGFrLLaVoopCOjWvdZ5bk4
 d9YVXauZO6YuFEaPJJ7TbJUfKqhwgd8H+gE4vJXwn79qMpVTVe2iJOKYj
 /Yqs4HYY5CtEhZCNOhtShmRCvscWo7oZFf9RU0JpVhOcAuhrImQpMkf0p w==;
X-CSE-ConnectionGUID: i4YVOJLuSLmZOpR1PZ1zBQ==
X-CSE-MsgGUID: qtU26HRaTOyV+L2KppxGXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1813768"
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="1813768"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2026 08:53:35 -0700
X-CSE-ConnectionGUID: rfKTJa1RR5eRqdHJDxvyRg==
X-CSE-MsgGUID: StW2iTjxQN2b5aNLJjJRzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="4526835"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2026 08:53:34 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 27 Oct 2026 08:53:34 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 27 Oct 2026 08:53:34 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.66) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 27 Oct 2026 08:53:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QGUrvmMIivURd7ND1MbCm83rLI5bROs/+jrOTPvwBbBTj1XPB3bZLT9fANSShi0uHxH62zgla1APTRX2cBXmn37Ad0CAI0qdJbeevPnKggnSf5HJHQeOe9El1iN3rx3ipmY6SNpK83LVvp6SR1IOwlPPe2Zii+7vkjwUm2dhpKl8UN1cJKIl4LV5SCPwMWcFs4YMu9ipySYO5QSBOi37ucqM7sHGIkPutXIjL1BD98W9vBQQ6wasV+KnQsraxmH0X8EYdXsWjcYSlywu+q8Rs7bbio1wL6z2Hm7RFnboBARaEkLncQnTNF4ro4xuXhfhbSbxNrCmwVh2IO5dG6GTSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GNAB8tnUdfYg9w3vUAihOyIkVnEilvCu8h0uMCSK18M=;
 b=AD94tZdpcLyIZMYarNQqy0J34BP+CSXyc5gAJ4CImpdYXBzykTALkhp9IBgRSj4zMVqLIbWjDwcJ0uqdJENfBcpDtw/0MgXR6pAiWbwObYEspL5aQmQs3c5ENkq3/AyI/x6OJ66NAcyix8JdSg+3AdHcRBNVIKnsIF5Vvf5VK3yR7txIcz8ails4GpGOxNpb/HXCiMWjEWaKkt+dPnfpsKU/0nYfl//T3UhwcvfzZdGG5CTludXsjDwlylFw2Xx2LuBmwGgF7pE72HEe6xK0scDtPRCtOqXJfFI8YSTRUodIM0IFfGhpbEAPOu8GTyLUXG6ODBrVrwR4wwby+VsiAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY8PR11MB7777.namprd11.prod.outlook.com (2603:10b6:930:71::14)
 by DM4PR11MB6480.namprd11.prod.outlook.com (2603:10b6:8:8d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 15:53:25 +0000
Received: from CY8PR11MB7777.namprd11.prod.outlook.com
 ([fe80::5a6:cd7:969c:fa41]) by CY8PR11MB7777.namprd11.prod.outlook.com
 ([fe80::5a6:cd7:969c:fa41%4]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 15:53:25 +0000
From: "Govindapillai, Vinod" <vinod.govindapillai@intel.com>
To: "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Heikkila, Juha-pekka" <juha-pekka.heikkila@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "Syrjala, Ville" <ville.syrjala@intel.com>
Subject: Re: [PATCH v3 2/3] drm/i915/fbc: Apply Wa_14028723391
Thread-Topic: [PATCH v3 2/3] drm/i915/fbc: Apply Wa_14028723391
Thread-Index: AQHdZiTBn1WFDX6jQ0eVLjXh7q80DbcRf0gAgAALAgA=
Date: Tue, 27 Oct 2026 15:53:25 +0000
Message-ID: <7340968078ff6e9d8e4cc1c8850e5a243d964e66.camel@intel.com>
References: <20261027150544.81548-1-vinod.govindapillai@intel.com>
 <20261027150544.81548-2-vinod.govindapillai@intel.com>
 <auC_tAQTwUlC67Wv@intel.com>
In-Reply-To: <auC_tAQTwUlC67Wv@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1.1 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR11MB7777:EE_|DM4PR11MB6480:EE_
x-ms-office365-filtering-correlation-id: 32f16bc5-da2e-4750-be09-08df34426f68
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|23010399003|261026140227099003|38070700021|260925021311599003|260925021911599003|260925022911599003|4143699003|10067099003|11063799006|261009223027099003|56012099006|261022105027099003|261021121427099003|18002099003|261026121527099003|22082099003;
x-microsoft-antispam-message-info: Z2yyYvhBv/G+o9TRtkXGos+yFgHAP25C9Zd8nNT1ewWYQJSCQrdjy8+Rop2VyEhlOhPARNmC05ype2cPKecKa0PF6c24C/TW8T6VmxK/WYsqVeCAqnjxxTV1QbMVBrecq7dadlm5ltmte0p/1uguGII8i8PWIj81gllMidPmjns0kYPB0uFM43IkX+s2Wvr87b9SR63CIusO7nAVMAfcj4knOC4UavTf5PzUgY00Po+Hqo4P6fvpmRxlFvDU5mqQvix/RTZpZw8pbFwAXGd6gC3C3eMna3RikbYfsVIK22ClQB0DPyyciMVD8xUQwVre3uQTe4Azz2076RFwZ1wGGqln7W8JFcJlFX3YQTW9HEIbhX+9GoIJk/1LMwhCfY740SfbfRWa6vfAhg6g+evWASa451xPA2NVU0m8E21U0HXRHztuKPCyh7VtkWB67GM8+gKO5NOY0Qq4sefj52GXSCHJxw/1hPnMXdx5Gz9MOOGJQ+G9gRc5o73z3DfBm519TWPBA0NlR6hEui2sYlRwBSl9nnvefJdUA69l6+bUWlIeCIHzPlsEXlxWn6KEPR9xhj0i35tgqckI3O/PHdOO3HS0M+ESf7RhiLRGQWQ+XNpHrqVVaAoGWMw0usTgYg1qFrQGOmXW1RLUBVx6dz3Fo1RWsJUvB9Bkku8zEWib/iDjCO+WXzw7DN+qtMhxM0xbwcMJLdxHUeKukHmkmH9aqKopv7tCkh6IariAb+kVfVI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7777.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(261026140227099003)(38070700021)(260925021311599003)(260925021911599003)(260925022911599003)(4143699003)(10067099003)(11063799006)(261009223027099003)(56012099006)(261022105027099003)(261021121427099003)(18002099003)(261026121527099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VGFmcm5tVjRqM3NMQTI0VWxkWVpJcWdRZFlvL0loZGlmZTY4RUd1SC9Qejdm?=
 =?utf-8?B?RURWT28yRTRzdWpyZnIxd0VnRUtPcnVvck90d3NzbUwwR2c2aUlvVXMwQy8r?=
 =?utf-8?B?LzBNbmlDdHdGVjdWcEdFOFBiK3FxcmE4NUFTV1JrT3lnMFpzbk1GTWViMEJK?=
 =?utf-8?B?Y29HY1loZDgvb1NsS2VUUmRYZGVSZ3RMMFJEZU1aMkk5NGVGQy9aeHdnb3Zn?=
 =?utf-8?B?NFlkNHhiRzErYnoyTG5HMXlyZGlBWjBlMUFobkxNSXdSNklUSVprcWN2TGtN?=
 =?utf-8?B?ZjFHQk5OR3V1ZEoxT20xUm1NRitySG1iM1psUkZKbzF3WkVoV1hUTnhGMUZB?=
 =?utf-8?B?c0NZblJsMmlpdG1ZWmw2WUlpKzJBQ0dMWUN4dTJBME5oL2U4VTlKZzRNWm5y?=
 =?utf-8?B?SmZjbFZMYnBQaWRFeXY1NHNHRllQa3l6aXJ1emFPT09oYmlTZnVXMHRwRXpD?=
 =?utf-8?B?RHNVejR5aTY5a1pveVhiREZpSGFlQVRGQUNtczRSSjNMdE8wOHpNMWRVSit5?=
 =?utf-8?B?LzVSZlFGRDArT3JyU1hkNUZFdGpDRkpBT2g3VGhqQ3kvY1cxVEVOaHkwYkl4?=
 =?utf-8?B?ZlZqVFAwVWhSVktqN1lIc3BuTE1DSWZjdmtaZTBtZTdOSVpza0pGNkZEMGwr?=
 =?utf-8?B?UkNXbHU3Qnh5UEhOM0NFeFJiWnFtMzB1Y2VNdWltL2lZK2pxR1pxMGFmWGY4?=
 =?utf-8?B?dFJhWTNWR1FNaXVkbWZjT21xamE1djc1K3pUeFgwbVY2aXFoSUttVjRCOW1C?=
 =?utf-8?B?blkzaUJOWHdwclNRTSs2K1pKNWVQL1FwZmFlN3I0U1NWV1hhNk9qVmxJN1Z6?=
 =?utf-8?B?VzhsbCt1dkxyVVducURQbEhjalVqR3VRRHU2N0RXWGUxbXlqWE9oNno5bG9w?=
 =?utf-8?B?WEJoN2ROQmk4MzNiK2haUlQ1SEg3SmdNSmdkRndBZldZM0RQMWRpdWhCMWEr?=
 =?utf-8?B?c2s0ZUhQUVQrcEhQRG1aYlU4ZTdNN29JSll6cjh0WW04S1Nid0VYNHR6OTBL?=
 =?utf-8?B?T3JaN2M2Y0QvQ2QxcU5ENFFkeHVueDBncGNyb2pUUWFnN3U1K3h5M3gySVlY?=
 =?utf-8?B?bXRYUkxyc1llTXFTSTc0dFlEeWl0ck9IdzNCSkc0K0Z5SlNKR2txdVpxNHBE?=
 =?utf-8?B?QndoK01ldzcxRTNtY3JRdGduKytFUWhiRko1NDNIbERYd0dTTXI3TklMTVVv?=
 =?utf-8?B?eHJpYXdvUnh3T1F4bFNZaVNPa1lucXVsU0xKWUNadDk1RGRyZjZjTXgvOHJM?=
 =?utf-8?B?QWllSmNYYnU3bC9tNWJsRTh3R0NrYlMvbk56RXpMdENXMkxDSE1jMGZBQnZI?=
 =?utf-8?B?NUpiQ1BvdDByTkthckNWc2hGUTQ5LzlLYjdSZDkwRGM0VHFveVNWZFpRMTRH?=
 =?utf-8?B?QWZVVzdDcURQUVBZNEhtNnVtdXBIbHFVL2xqODJaZTlkbGtSYkJEazJxcnpW?=
 =?utf-8?B?QVRsMHhOOGcxcno3Nm1kTUk2a3ZOQmVncUxJYkZ5Y1hHUWtrQ05adHd1ei9Z?=
 =?utf-8?B?UmsvbWdlbUpJOU1NTUg5YTNMUG5oWDZ1TDRrM2s5VW1Nd01OQzJxTFpzVDVI?=
 =?utf-8?B?ZFFmVEVHRkMzakpOSm5BdDFkanJvWWc3eS81MGtzT3l1OUFGejI5Zk96cUpo?=
 =?utf-8?B?Ym1JMmdVUkxydDBRcHZFS3d4c2I2Z2h2WnplZmtVZG01VUo1czRiSkVjWDdR?=
 =?utf-8?B?TG1veCtJV1owM2pERGFPUEl5dk1YTkJrSThpSG1zcVA0QWJIM0JZd2pqV0xW?=
 =?utf-8?B?UjE2elBVcG1ObWZFVDdleGtYRGprWStQTlZMa2ZWK0Z6UHA0ZXA4Z1RsMjNp?=
 =?utf-8?B?eE1ucDROSnJXUkJwZVdMK3huY3BwYlFPK2N3UlZEMzJJcDhqVTFoYjJ4VVdH?=
 =?utf-8?B?L2Zqc1BnSDFRTWpKNllFVUZwM3VMNmU5ZmxaVXRUc09hN01Hbm1KNjIzcHk5?=
 =?utf-8?B?YVdjbUhxYjhYTlJ3dHZQdUtRRnhESHB6WTBQR2UwM1JEMVFkYWNUSmhNTHB3?=
 =?utf-8?B?TW5nSTY4SDFkdEFDNVFoZ2h6QU9waWR1YXN0LzU2S2pkMVRlN2owT1ZTaXZl?=
 =?utf-8?B?UnBucWNaRFUwa3hDbmhBclNpQnp0T2g0R1hiT3NUamw0dUFDdk1McHhiV1Er?=
 =?utf-8?B?MkloQ1BaWVg3SHN6T2RrbGRwVjZnSUlTK2RiNWRoNXFNRWpxTnpqY2xFSkJp?=
 =?utf-8?B?eUN2T1JTcGxYaU5LY2RwdWtsSzgxUzhDTUliVVdtbGR4bXhpMjZWMGdCRWRq?=
 =?utf-8?B?OTFrQzNPMWMyN1gzZGxNQzJIOHNsdlhyN3o4NnJ1Rko0VzNlSWMxZHIwWTZw?=
 =?utf-8?B?QlpDRWtNbnVWTHVUSDN3cE1IQUZwM013eTJiS1NyZWlYRGp4UDdhQXd6TlZE?=
 =?utf-8?Q?JgBmJMsDddabvKDU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E97C4E92BC67D340A6F0BA20971C9D85@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Qw36oV7YQUQhQmE7DZFwIEtku/5gzerSDcd7Vup+RWjaR0newIADxOWg6QlkxDRZYLqqSip1HOKP4AUF/tyXZEqCMNuEen76R4YOkXx8iYPvmprfzgEBMixPdS2HCm8diaK1IGj3F1JHvtTD9Sq6dl2c7NUZXVE8VA1zMBtesUQABfehJXWCoTfTOCD6CLcZu3TNiMBFs8ZGVXmXArsYQ3bATcdi0rGghBnuVu1nxAjwffyg20DHR85bGgbyudm12s1ySkVzP68rnCmTz/i/mELPi/feh3hj+4A05Vh+bf8Jpj7iM34TGUINiG1Drp6dI/ULc37NRIuk1Uvdm/MDww==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7777.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32f16bc5-da2e-4750-be09-08df34426f68
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Oct 2026 15:53:25.0488 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EqkSCUC+0/3M2kE0Xan55no4F6afbggaXDBpUw+tKTzsI1JRBnv6sR8KVxuCO7cE7IhWPcAxr5fd3necpTVSJghPwhpOOhv3RNw6ZepJkew=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6480
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
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gVHVlLCAyMDI2LTEwLTI3IGF0IDE3OjEzICswMjAwLCBWaWxsZSBTeXJqw6Rsw6Qgd3JvdGU6
DQo+IE9uIFR1ZSwgT2N0IDI3LCAyMDI2IGF0IDA1OjA1OjQzUE0gKzAyMDAsIFZpbm9kIEdvdmlu
ZGFwaWxsYWkgd3JvdGU6DQo+ID4gRGlzYWJsZSBGQkMgaW4gWEUzUF9MUEQgZm9yIEZQMTYgZm9y
bWF0cyB3aXRoIEFscGhhLg0KPiA+IA0KPiA+IHYyOiBHcm91cCB0aGUgd2EgY29uZGl0aW9ucyBh
cyBhIHNlcGFyYXRlIGZ1bmN0aW9uDQo+ID4gwqDCoMKgIFdhIGNvbmRpdGlvbiB0byBjaGVjayBw
aXhlbCBibGVuZCBtb2RlDQo+ID4gDQo+ID4gdjM6IHVzZSBmb21yYXRfaXNfZmxvYXQoKQ0KPiA+
IA0KPiA+IFNpZ25lZC1vZmYtYnk6IFZpbm9kIEdvdmluZGFwaWxsYWkgPHZpbm9kLmdvdmluZGFw
aWxsYWlAaW50ZWwuY29tPg0KPiA+IC0tLQ0KPiA+IMKgLi4uL2dwdS9kcm0vaTkxNS9kaXNwbGF5
L2ludGVsX2Rpc3BsYXlfd2EuY8KgwqAgfMKgIDIgKysNCj4gPiDCoC4uLi9ncHUvZHJtL2k5MTUv
ZGlzcGxheS9pbnRlbF9kaXNwbGF5X3dhLmjCoMKgIHzCoCAxICsNCj4gPiDCoGRyaXZlcnMvZ3B1
L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZmJjLmPCoMKgwqDCoMKgIHwgMjINCj4gPiArKysrKysr
KysrKysrKysrKysrDQo+ID4gwqAzIGZpbGVzIGNoYW5nZWQsIDI1IGluc2VydGlvbnMoKykNCj4g
PiANCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9k
aXNwbGF5X3dhLmMNCj4gPiBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlz
cGxheV93YS5jDQo+ID4gaW5kZXggY2MwYjI4ZDUyNGY2Li4zZGYyNTEwNGZiMTIgMTAwNjQ0DQo+
ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5X3dhLmMN
Cj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXlfd2Eu
Yw0KPiA+IEBAIC0xNTksNiArMTU5LDggQEAgYm9vbCBfX2ludGVsX2Rpc3BsYXlfd2Eoc3RydWN0
IGludGVsX2Rpc3BsYXkNCj4gPiAqZGlzcGxheSwgZW51bSBpbnRlbF9kaXNwbGF5X3dhIHdhLA0K
PiA+IMKgCQlyZXR1cm4gSVNfRElTUExBWV9WRVJ4MTAwKGRpc3BsYXksIDExMDAsIDE0MDApOw0K
PiA+IMKgCWNhc2UgSU5URUxfRElTUExBWV9XQV8yMjAyMTA0ODA1OToNCj4gPiDCoAkJcmV0dXJu
IElTX0RJU1BMQVlfVkVSKGRpc3BsYXksIDE0LCAzNSk7DQo+ID4gKwljYXNlIElOVEVMX0RJU1BM
QVlfV0FfMTQwMjg3MjMzOTE6DQo+ID4gKwkJcmV0dXJuIERJU1BMQVlfVkVSKGRpc3BsYXkpID09
IDM1Ow0KPiA+IMKgCWRlZmF1bHQ6DQo+ID4gwqAJCWRybV9XQVJOKGRpc3BsYXktPmRybSwgMSwg
Ik1pc3NpbmcgV2E6ICVzXG4iLA0KPiA+IG5hbWUpOw0KPiA+IMKgCQlicmVhazsNCj4gPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5X3dhLmgN
Cj4gPiBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxheV93YS5oDQo+
ID4gaW5kZXggMjA4NmM3ZGE3MTBkLi41NTE0NzcxZjUxM2IgMTAwNjQ0DQo+ID4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5X3dhLmgNCj4gPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXlfd2EuaA0KPiA+IEBAIC01
Niw2ICs1Niw3IEBAIGVudW0gaW50ZWxfZGlzcGxheV93YSB7DQo+ID4gwqAJSU5URUxfRElTUExB
WV9XQV8yMjAxMjM1ODU2NSwNCj4gPiDCoAlJTlRFTF9ESVNQTEFZX1dBXzIyMDE0MjYzNzg2LA0K
PiA+IMKgCUlOVEVMX0RJU1BMQVlfV0FfMjIwMjEwNDgwNTksDQo+ID4gKwlJTlRFTF9ESVNQTEFZ
X1dBXzE0MDI4NzIzMzkxLA0KPiA+IMKgfTsNCj4gPiDCoA0KPiA+IMKgYm9vbCBfX2ludGVsX2Rp
c3BsYXlfd2Eoc3RydWN0IGludGVsX2Rpc3BsYXkgKmRpc3BsYXksIGVudW0NCj4gPiBpbnRlbF9k
aXNwbGF5X3dhIHdhLCBjb25zdCBjaGFyICpuYW1lKTsNCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9mYmMuYw0KPiA+IGIvZHJpdmVycy9ncHUvZHJt
L2k5MTUvZGlzcGxheS9pbnRlbF9mYmMuYw0KPiA+IGluZGV4IGI4NGZhMzUwYzQzMy4uZjcwZjNl
MzRkNjU1IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50
ZWxfZmJjLmMNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Zi
Yy5jDQo+ID4gQEAgLTEyMTUsNiArMTIxNSwyMyBAQCBzdGF0aWMgYm9vbA0KPiA+IHhlM3BfbHBk
X2ZiY19waXhlbF9mb3JtYXRfaXNfdmFsaWQoY29uc3Qgc3RydWN0IGludGVsX3BsYW5lX3N0YXRl
DQo+ID4gKnANCj4gPiDCoAl9DQo+ID4gwqB9DQo+ID4gwqANCj4gPiArc3RhdGljIGJvb2wNCj4g
PiAraW50ZWxfZmJjX3dhXzE0MDI4NzIzMzkxX2FwcGxpZXMoY29uc3Qgc3RydWN0IGludGVsX3Bs
YW5lX3N0YXRlDQo+ID4gKnBsYW5lX3N0YXRlKQ0KPiA+ICt7DQo+ID4gKwlzdHJ1Y3QgaW50ZWxf
ZGlzcGxheSAqZGlzcGxheSA9DQo+ID4gdG9faW50ZWxfZGlzcGxheShwbGFuZV9zdGF0ZSk7DQo+
ID4gKwljb25zdCBzdHJ1Y3QgZHJtX2ZyYW1lYnVmZmVyICpmYiA9IHBsYW5lX3N0YXRlLT5ody5m
YjsNCj4gPiArDQo+ID4gKwkvKg0KPiA+ICsJICogV2FfMTQwMjg3MjMzOTE6DQo+ID4gKwkgKiBG
aXhlczogU2NyZWVuIGNvcnJ1cHRpb24gd2l0aCBGQkMgZW5hYmxlZCBvbiBhIHBsYW5lDQo+ID4g
d2l0aCB0aGUgRlAxNg0KPiA+ICsJICogV29ya2Fyb3VuZDogRGlzYWJsZSBGQkMgZm9yIEZQMTYr
QWxwaGEgaW4geGUzcF9scGQNCj4gPiArCSAqLw0KPiA+ICsJcmV0dXJuIGludGVsX2Rpc3BsYXlf
d2EoZGlzcGxheSwNCj4gPiBJTlRFTF9ESVNQTEFZX1dBXzE0MDI4NzIzMzkxKSAmJg0KPiA+ICsJ
wqDCoMKgwqDCoMKgIGZvcm1hdF9pc19mbG9hdChwbGFuZV9zdGF0ZSkgJiYNCj4gPiArCcKgwqDC
oMKgwqDCoCBmYi0+Zm9ybWF0LT5oYXNfYWxwaGEgJiYNCj4gPiArCcKgwqDCoMKgwqDCoCBwbGFu
ZV9zdGF0ZS0+aHcucGl4ZWxfYmxlbmRfbW9kZSAhPQ0KPiA+IERSTV9NT0RFX0JMRU5EX1BJWEVM
X05PTkU7DQo+IA0KPiBTZWVtcyBvdmVybHkgY29tcGxpY2F0ZWQuIENvdWxkIGp1c3QgZHJvcCB0
aGUgYWxwaGEgZm9ybWF0cyBmcm9tDQo+IHRoZSBsaXN0IGFuZCBiZSBkb25lIHdpdGggaXQuDQoN
ClRoaXMgV0EgaXMgIm9ubHkiIHRvIE5WTC4gVGhpcyBmb3JtYXQgc3VwcG9ydGVkIGZyb20gdGhp
cyBwbGF0Zm9ybQ0Kb253YXJkcy4gU28gaXNuJ3QgdGhpcyB0aGUgcmlnaHQgYXBwcm9hY2ggdG8g
bGlzdCBhcyBzdXBwb3J0ZWQgdGhvdWdoDQp0aGlzIFdBIGNvdW50ZXJhY3Qgb24gdGhhdC4gDQoN
CkFsc28gZ2F0aGVyZWQgdGhhdCwgQVJHQi9BQkdSIHdpdGggRFJNX01PREVfQkxFTkRfUElYRUxf
Tk9ORSBpcyB0cmVhdGVkDQpsaWtlIFhSR0IvWEJHUi4gU28gYXJlbid0IHRob3NlIGNhc2UgbmVl
ZCB0byBiZSBhbGxvd2VkPyBBbmQgdGhlcmUgaXMNCmFub3RoZXIgZXhpc3RpbmcgY2FzZSBpbiB0
aGUgZmJjX2NoZWNrX3BhbmUoKSB3aGVyZSB3ZSBkbyB0aGUgc2FtZS4NCg0KQlINClZpbm9kDQog
IA0KPiANCj4gPiArfQ0KPiA+ICsNCj4gPiDCoGJvb2wgaW50ZWxfZmJjX25lZWRfcGl4ZWxfbm9y
bWFsaXplcihjb25zdCBzdHJ1Y3QNCj4gPiBpbnRlbF9wbGFuZV9zdGF0ZSAqcGxhbmVfc3RhdGUp
DQo+ID4gwqB7DQo+ID4gwqAJc3RydWN0IGludGVsX2Rpc3BsYXkgKmRpc3BsYXkgPQ0KPiA+IHRv
X2ludGVsX2Rpc3BsYXkocGxhbmVfc3RhdGUpOw0KPiA+IEBAIC0xNjc5LDYgKzE2OTYsMTEgQEAg
c3RhdGljIGludCBpbnRlbF9mYmNfY2hlY2tfcGxhbmUoc3RydWN0DQo+ID4gaW50ZWxfYXRvbWlj
X3N0YXRlICpzdGF0ZSwNCj4gPiDCoAkJcmV0dXJuIDA7DQo+ID4gwqAJfQ0KPiA+IMKgDQo+ID4g
KwlpZiAoaW50ZWxfZmJjX3dhXzE0MDI4NzIzMzkxX2FwcGxpZXMocGxhbmVfc3RhdGUpKSB7DQo+
ID4gKwkJcGxhbmVfc3RhdGUtPm5vX2ZiY19yZWFzb24gPSAiV2FfMTQwMjg3MjMzOTEiOw0KPiA+
ICsJCXJldHVybiAwOw0KPiA+ICsJfQ0KPiA+ICsNCj4gPiDCoAlpZiAoIXRpbGluZ19pc192YWxp
ZChwbGFuZV9zdGF0ZSkpIHsNCj4gPiDCoAkJcGxhbmVfc3RhdGUtPm5vX2ZiY19yZWFzb24gPSAi
dGlsaW5nIG5vdA0KPiA+IHN1cHBvcnRlZCI7DQo+ID4gwqAJCXJldHVybiAwOw0KPiA+IC0tIA0K
PiA+IDIuNDMuMA0KPiANCg0K
