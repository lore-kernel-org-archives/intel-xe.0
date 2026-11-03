Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39F5C606A324
	for <intel-xe@archiver.kernel.org>; Tue,  3 Nov 2026 04:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lTRFPQwQ
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC42410F350;
	Tue,  3 Nov 2026 04:02:09 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64D8110E739;
 Tue,  3 Nov 2026 04:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793678524; x=1825214524;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=PfnnUkymssj9zX6hXoJ7jSl2pUtRo5U443s2GIpaCUs=;
 b=lTRFPQwQxjBnBKp3jWBOofLzT42zpzb77KQeXVF7JEJihcOl9b9eBwaD
 2pLfwEVllS8LTpxYVyzRKcUY57RWndBU3fAC2ODFIJpAb9NTC3aGE7U0a
 H3akgpvwuWM5l/nGcTPS0lFnOhllEpmSSx1JyARlisWDZM/o5cb7iqtoQ
 nvLk2KxeHAiFMEu25riH5gK4hM/hXMvEQeHwNVJRBlLW7OMX6awcbJMUk
 y93Uq4C+eYe92HUV9PEqupRwNIyOCUiSje1ko0E5FP6rlSSOXB3W610SA
 1fXaq58m9mkQhaefO0azbV4SU8sG0Fdqi54wh7MWZVbUntowOQR9qVz5A A==;
X-CSE-ConnectionGUID: RiC2L/WDT0CiRPoIio86zw==
X-CSE-MsgGUID: tiyZ7daZT0yUpDNoM90VWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2396784"
X-IronPort-AV: E=Sophos;i="6.27,192,1787036400"; 
   d="scan'208";a="2396784"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 20:02:02 -0800
X-CSE-ConnectionGUID: CMbqhSXpTEuK4sqWWA4YIQ==
X-CSE-MsgGUID: gv2C3beDRaWl1NNiHYi0+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,192,1787036400"; 
   d="scan'208";a="6470423"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 20:02:00 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 2 Nov 2026 20:01:58 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Mon, 2 Nov 2026 20:01:58 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.71) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 2 Nov 2026 20:01:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DQyAFqjBKuok295m8tdco69/69F3b3HXmaXCXR62XWBNYzjsgEbe44A4IxSoIi9kPFOmY6+hRh+XF13E+h2uIPXBIcoOshndtnMwr4h96JbokhEi5fcvyzmGQa6yEK/iN2ewvN6hX9pzKJtWh3P8n+tzWS7+uHDw0LIFHomEWNTOd+/9r+Wa+ko0idPasEgRg6pF2RX1ibFy1MEdTlxOdLyv4OhiZUmcsJFvz20MWogSSNV008PPgEqhOYVrfv93RIDoRb2ypDULhQf1OstyIZq4TLX/gefRSBHDcoK1ycwgTiTgsZ9q8y0QY/gr178d6LETz1EH0oglFdzcMImrBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PfnnUkymssj9zX6hXoJ7jSl2pUtRo5U443s2GIpaCUs=;
 b=oBoNSSBqMBbIlERv1csXeCyyl7UGPqKYagzMp+dK4Ph91kDJpDcZQsrh2B3fDUvvFJTeuwqNH2mMnzdWZX/W1qzKFrcognzMbJVse0DBSjDL6n+ak+FQeAwTXQk56RUDadJdZ/bbx7cz0M8+nLqCvZCHuuOvU3OFdrlhBXmomcmziJfNGWAZWTu8l2UQmBDtg2/RjWCvOkgbw4RABm9p8oOp//D/iHxqP9RSviGr8HTwyBdGPl2KlLnA0NRvmPvG6zgPGPELGP0YNmBuaxJ8V3f+JUXIk1saU1qpJWpJzItwR/zjVS1MvtQYZRcF0la090wGricMmxCKjmm8V/Kjiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::5b) by DS0PR11MB8762.namprd11.prod.outlook.com
 (2603:10b6:8:1a9::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Tue, 3 Nov
 2026 04:01:35 +0000
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::19f5:13eb:df52:68ff]) by DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::19f5:13eb:df52:68ff%8]) with mapi id 15.21.0569.011; Tue, 3 Nov 2026
 04:01:35 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Samala, Pranay" <pranay.samala@intel.com>
Subject: RE: [PATCH 04/10] Revert "drm/i915/display: Avoid stale PIPE_SCANLINE
 values after crtc_enable"
Thread-Topic: [PATCH 04/10] Revert "drm/i915/display: Avoid stale
 PIPE_SCANLINE values after crtc_enable"
Thread-Index: AQHdaJISR9JRN4uHXk2L1c+ISxhiDLcbvsfw
Date: Tue, 3 Nov 2026 04:01:35 +0000
Message-ID: <DS4PPFE901A304FF95DC43D56D031AED638E3692@DS4PPFE901A304F.namprd11.prod.outlook.com>
References: <20261030171327.29829-1-ville.syrjala@linux.intel.com>
 <20261030171327.29829-5-ville.syrjala@linux.intel.com>
In-Reply-To: <20261030171327.29829-5-ville.syrjala@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPFE901A304F:EE_|DS0PR11MB8762:EE_
x-ms-office365-filtering-correlation-id: 37aebc4d-4d4e-491c-fb27-08df395f2774
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|366016|10067099003|18002099003|22082099003|38070700021|56012099006|4143699003|11063799006|261026140227099003|261022105027099003|261028144727099003|261009223027099003|261021123027099003;
x-microsoft-antispam-message-info: gSZoet3pr8IILtr6w91eYOT10SkwZH937nS5JFhvA2rfMG5fJWewZ7RQyvYTYRmAJHJizG3y4MjFnZDpmKqtuIvsMsXiXCiUWrX/vPvIPLGLleH94z8isyPpC0SpvtgbQf6o/q8jWARd0OcDTqYSxI2+4lwMkWDRlC5xMvxe8z6dEe53kahOxXslzeS92fAkDzFT3mUkGzjoQGWWt8jrM7cHNFJ6WUOl77xiEjNGGPeQZV5dBF+/c3z4U+5b4XMM0OswQBztpvJ34PK+h93kYBq4C843csXKz6ymDjjrafEwbUoA+31bMyVqLQhnEjBxoM3kIyx4XcMWwnodL7C28Le7uC86D4zRhQzGA1Vi9SSC36RNrgjQkHrGee/2FIGYk688JhxYWZombb05E585PCe7D596naW3sM0ugGaOE9c8GiYzQDYbkz3mEqNgnNO3gKTed9ivS8TW58Q9TWBqw6nLOxzOWLevK5Y6/XZB/Qm35/ulOaVHhqntqYvbvtaqbxxrEixRy15+M0HeennCT0unQtmat/sTDeV0pmiP55X1AH7/Ra+1KrNq7SAmOizm4FUGcYRXoeQzGXMKvZYilb9E8jtGTPrxGlU5RjGGHFYEBMMbLJIxEmho3VfAgl9spTTq+7/AYhJJXK634Cg1KYCpoFE1odCmWy6ahypJwngIGihxjsffcuSIOGKpdGZGddpiVIjXebnx0zFyEuSjwNA4M/fBa+T7ZU2M3kT/6P0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPFE901A304F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(10067099003)(18002099003)(22082099003)(38070700021)(56012099006)(4143699003)(11063799006)(261026140227099003)(261022105027099003)(261028144727099003)(261009223027099003)(261021123027099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aVRZMU9yaFhlclhnTGRRZ1ZuMm52bWQrd3lWZ0JrUVpRRUs0MHVVbkpWMW5G?=
 =?utf-8?B?aTF2MzN6SmlxUEk1Z3pUTEUzQjBCSXFzSU9KMmNjVm41VlJycTlZWFYwL3VI?=
 =?utf-8?B?aWpwNk9IaGErTHNXNzF0SjhWRVF5OWJ5Rzk1eGUxVVVrTWRqVXZwU2hkQjFQ?=
 =?utf-8?B?N00yVlM1dmx6ZVBkdWpucG9nU3RVQUJPOWxHNkRkcUdRa2M4ZnBmVnVuVGl3?=
 =?utf-8?B?dVVoZWRwOEtzSUdaWm5kb1VlZkFFUU5xU1dITUdtSHN1OWF3dC9qdjlkdW1o?=
 =?utf-8?B?TkJ3aDlqWFZERVJ5NDJueWcwR01zQzZtVkdkWUhtb1I5TkhFS3hqcTZoNzFP?=
 =?utf-8?B?VkJ4eWg4T3crWWJ6VFREcE5vSzBRREJ4bFNVRHJjb1d3NFRCVnZxRTNxWG8r?=
 =?utf-8?B?QnowV09MNHBFYjZYcXkvNGdCUXlqV01CK3VNNlB2V3dTNVVsMXRQclYydjNH?=
 =?utf-8?B?L2xoc21veFNvRGFOcTNJZG5xZ3dVa2hRSm5GcUpLTFduN3RKVmUyU3NaNXJz?=
 =?utf-8?B?QmVsQ0kzTGZXblV6cm9SdUdzMDgrVG5wbnp0ZDVtUTlUMGFpZkhmdTRTd1FK?=
 =?utf-8?B?R1laYjJhemZUZHpyMmsrSWJ2Y2pjeGorbVg4ZTUxM01lczBrSlM1bHg0QjFU?=
 =?utf-8?B?cnU3V0plT3ZwblR6V0pEYUZMQjRUT25aZHdZTHdmL044RUFiRlI1alYxeDRC?=
 =?utf-8?B?ckJyKzJMZ2gyK1ExMitOQWhtVGJPWEoyMGprdXlTdWIyaVZ2M3VBUHVzN3h1?=
 =?utf-8?B?bUhlU0pRMStXalJoWFZxa283QmRmY0ZUNUVyaFZWaXRXOFg4R29jZEI2YnJM?=
 =?utf-8?B?aTlDS25oWGpOWGY1eGNQUXVGZnl5UDI5aTUyRHFrWFdmaFYxSU1JZWVUZGtt?=
 =?utf-8?B?bzUwV0ZVRWRocG1sVFpiem45YmZwZkx4RnRLMk9KVExiTmY1T29KMGo5U0M4?=
 =?utf-8?B?OGNzb2E2azFiSHJxYTg4TU40NkloTXZVMnMyblhWeS8yUTZFNWV4N0JxTmNs?=
 =?utf-8?B?TWJkczZqL2FySEo3ZEo1NkNqcnkvME1BWXEyUDRsSUlkWXJVaFVqTlR4VWtw?=
 =?utf-8?B?R2ltZ0N3aWpMMW5NSWkxNEFiKzNZQTg4WHZsSTVZZmU0L2hKZExJL0dQMzky?=
 =?utf-8?B?ZC9SaTQra0xiREtzZmg5cUpEWGduaUhoMUtJOERnVWgxK1RiLzZTT2o5dlJr?=
 =?utf-8?B?UlJIcmswNFladkJCL3dCSVhneEtlMllOQXlGRzFpQ2FNUlQySTI5L0VNTGJ1?=
 =?utf-8?B?QzdTaWNDaDF4VjVLc2hQTldFTEMzUnBEMFRadnVGMkQrTFJzVG80UXo4a0lU?=
 =?utf-8?B?MzJnWGg1Y2xZL3Y4M2hoL00zSDNCM1h4Q2JkRDVXWks4SEhITi9oa29qL0xu?=
 =?utf-8?B?K0U5UGxoL2xzT2xIZ0VROFlQY0RhdU5QY3NrZ1BrLzBxR3Q3ZnRKaVV6djVh?=
 =?utf-8?B?TTFLQW93c1VXNlptUnFid1FLNjRIZUtweCs2akVDWnY4cHJzeGxUUTZYYTg2?=
 =?utf-8?B?azc1eW9ZdWRvTHFyOUx1YWNtem8ydjRPQTBhT2JpQWxRRmRlVkJlUW9MWWJz?=
 =?utf-8?B?ekhJalR1YmJOdy9Ma0d1ZzdVb3pjVERaMlBXZDk4ZlBOV3hyaFR0UE1xR2Vm?=
 =?utf-8?B?b2VRNmhwcGFWS09oS0VzeE1oeW5mT3RHWmFtM0gvRGZrZmlVdnkrYldqZjd1?=
 =?utf-8?B?TFZnVm9ETWhpZXhyM1dOb2I3Y1VZZStUOG5abFlqRkNWYlU2Q1VBdTE3WTZM?=
 =?utf-8?B?dnpFaVhzcDQ1UzNoYUMyZmNpQlVVR0R4eEJiSkllNytZcTkxRHFtOW1ZSmpq?=
 =?utf-8?B?V0RmcE1qOFh0dkdGSFBmanB5VzVOaEdhTUJMOWFMRytwZzhZZ1ZGcG9XanU2?=
 =?utf-8?B?T2M1K3NTSHFYNVZJT0w4YXA2QitzT01IRGJxcU5MMlk4K3pLSDVPKzgxTGFR?=
 =?utf-8?B?Z0dkT21seTltRERxbzNVaUlDZ0xmbUxtNzQrLzg4cU1sZkh0RVlLaVNaNkEy?=
 =?utf-8?B?Tm1KTGJjK3YydEpBbVFkZ1RVVDhwYWJ3YkxISHpPNXBZbHozVzdrSVhRcHJZ?=
 =?utf-8?B?d1JIeGxVbllEallKVzJPSzhXQkZ2dVpsUFFCeVZoaVlqK2gxNFRkNkdBUzho?=
 =?utf-8?B?SmljNGlGQTRSbFNHb3dtMjR5UUh4cVd3dWF1TkFndjduMzZJUitZM3VkVGtR?=
 =?utf-8?B?OUhLSmZGdGZqbE91NnpVODU3WmZ3UFdqL28vUXpKWjVjamQ1TWFnOThrSFNS?=
 =?utf-8?B?b2pHZFZkdzdnVTFhSG85MXljUGl0UU5sNzNUc1YwSURTY2NHTVV2NEVEZjJM?=
 =?utf-8?B?R2VybEFCbGo1V0lWZG5Eclkva29Nc2h4dVltWUJvMzBqNHdKV3Jydz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: oRuKiDHXBD7VLffOBH3KeQgH44bh7wQMUL+3GDUQMNqOxHvwS7TehQQIFeJ21kL8DgmvzQORH1rlKIYYlzSbOKbVSN0RxqIZ/5MzG+Jc0X3eJhgverybZTQ6PPpR89EpTQ0DfzXDNyxzBrgsVCBhL+fsXCDhpHIoBHHZehbMMuIDKDT0DNcp1AFwXXX0SoFUnGKnqdilJCPZa2QP/7rB/imTf1QxicqTT89cKef1DtkEm27+iHn9oyDdkYs+QUG0mI3tOTrKW0r5eLZRg5mJo+322MbUeKGPxHyNJI8RFD1x0uJANr0g7C1M42GhpplKh2mv8stTv3V4//+G19LIuA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFE901A304F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37aebc4d-4d4e-491c-fb27-08df395f2774
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2026 04:01:35.6287 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: miOAL41T3ydOXAsGAMFPvZwWfuVD2wYe8JoWs6zx5/dwYeybn8fV4jrDMXOW0QPgBde456NAHaw+TTGOvH2NYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8762
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

PiBTdWJqZWN0OiBbUEFUQ0ggMDQvMTBdIFJldmVydCAiZHJtL2k5MTUvZGlzcGxheTogQXZvaWQg
c3RhbGUgUElQRV9TQ0FOTElORQ0KPiB2YWx1ZXMgYWZ0ZXIgY3J0Y19lbmFibGUiDQo+IA0KPiBG
cm9tOiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPg0KPiAN
Cj4gVGhpcyByZXZlcnRzIGNvbW1pdCBkMDhlNDZlZmFlMTZiNjA3ZjEzZDk1YTRjZDViODRhOTU4
YjdlOTk1Lg0KPiANCj4gVGhpcyBleHRyYSB2Ymxhbmsgd2FpdCBpbiBpbnRlbF91cGRhdGVfY3J0
YygpIHNlZW1zIHRvIGhhdmUgYmVlbiBzb21lIGtpbmQgb2YNCj4gaGFjayB0byBoaWRlIHRoZSBw
cm9ibGVtcyBjYXVzZWQgYnkgZW5hYmxpbmcgdGhlIHZibGFuayBtYWNoaW5lcnkgYmVmb3JlIHRo
ZQ0KPiB0aW1pbmcgZ2VuZXJhdG9yIGhhcyBhY3R1YWxseSBzdGFydGVkLiBUaGF0IGlzIG5vdyBn
ZXR0aW5nIGZpeGVkIHByb3Blcmx5IGFuZCB0aGlzDQo+IGV4dHJhIHZibGFuayB3YWl0IGhhcyBp
biBmYWN0IGJlY29tZSBhIGhpbmRyYW5jZS4gT25jZSBwcm9wZXJseSBoYW5kbGVkLCBwb3J0DQo+
IHN5bmMgc2Vjb25kYXJpZXMgd2lsbCBub3QgaGF2ZSBlbmFibGVkIHZibGFua3MgYXQgdGhpcyBw
b2ludCwgYW5kIHRyeWluZyB0byBjYWxsDQo+IGRybV9jcnRjX3dhaXRfb25lX3ZibGFuaygpIHdp
dGggdmJsYW5rcyBvZmYgd2lsbCByZXN1bHQgaW4gYSBXQVJOLg0KPiANCj4gQ2M6IFN1cmFqIEth
bmRwYWwgPHN1cmFqLmthbmRwYWxAaW50ZWwuY29tPg0KPiBDYzogUHJhbmF5IFNhbWFsYSA8cHJh
bmF5LnNhbWFsYUBpbnRlbC5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IFZpbGxlIFN5cmrDpGzDpCA8
dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+DQoNCkxHVE0sDQpSZXZpZXdlZC1ieTogU3Vy
YWogS2FuZHBhbCA8c3VyYWoua2FuZHBhbEBpbnRlbC5jb20+DQoNCj4gLS0tDQo+ICBkcml2ZXJz
L2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXkuYyB8IDIgLS0NCj4gIDEgZmlsZSBj
aGFuZ2VkLCAyIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxheS5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUv
ZGlzcGxheS9pbnRlbF9kaXNwbGF5LmMNCj4gaW5kZXggN2RkODU3YjBiOGU3Li40MGZmYTAzMWNm
ZWEgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlz
cGxheS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxh
eS5jDQo+IEBAIC03MDAzLDggKzcwMDMsNiBAQCBzdGF0aWMgdm9pZCBpbnRlbF9lbmFibGVfY3J0
YyhzdHJ1Y3QNCj4gaW50ZWxfYXRvbWljX3N0YXRlICpzdGF0ZSwNCj4gDQo+ICAJZGlzcGxheS0+
bW9kZXNldC5mdW5jcy0+Y3J0Y19lbmFibGUoc3RhdGUsIGNydGMpOw0KPiANCj4gLQlpbnRlbF9j
cnRjX3dhaXRfZm9yX25leHRfdmJsYW5rKGNydGMpOw0KPiAtDQo+ICAJLyogdmJsYW5rcyB3b3Jr
IGFnYWluLCByZS1lbmFibGUgcGlwZSBDUkMuICovDQo+ICAJaW50ZWxfY3J0Y19lbmFibGVfcGlw
ZV9jcmMoY3J0Yyk7DQo+ICB9DQo+IC0tDQo+IDIuNTUuMA0KDQo=
