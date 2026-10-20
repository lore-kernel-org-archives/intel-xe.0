Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2CE8606A319
	for <intel-xe@archiver.kernel.org>; Tue, 20 Oct 2026 11:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XkmsvvFj
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B523810E8BD;
	Tue, 20 Oct 2026 11:19:36 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8D3610E8BD;
 Tue, 20 Oct 2026 11:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792495170; x=1824031170;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=zGl+9hRTdFrVEu4fUHEevYa8NUR1q3WnfljorLNPr+Y=;
 b=XkmsvvFjWKsRI8PfA8X9X6Peyw5mKFbtqeN2QElx92nPFGC26wzfBoKW
 cqHpXR7FJxNnk02SA/hzdyxH9LCx7mDRqhdzCBM+JE4eJzulJJnjI9O7F
 T6P/i2Py1jU4QbDrRX0dF01XHCmge5VZOcSmOrCHBOssG0F+N4UdtH3d5
 9gMDczGHa6IhwuiCwB3vrMop9VNpA1kfeYZ9r4Ww1feHcpO2eaRTWCeGW
 bj6BjYItDGH0PERl/KFE7R3gjGwchmfSjJBfP5BWmTQIgNhgFzmxEyFnl
 QXP9HXMEQPTZzUydOanTwHBYAyh8cAXjBSKgJx2mrQaLCN2EqRjoo1QjH g==;
X-CSE-ConnectionGUID: AVEk3TT1RmeOX9e6A5avow==
X-CSE-MsgGUID: J2Our98oRVKC6U6xuSfZ+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1206046"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1206046"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 04:19:30 -0700
X-CSE-ConnectionGUID: lvopwQYNSymv3DaMQbsBgg==
X-CSE-MsgGUID: Zv/xV8C1TP2b6OV+tTdZwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="3191882"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 04:19:30 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 20 Oct 2026 04:19:29 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 20 Oct 2026 04:19:29 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.62) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 20 Oct 2026 04:19:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Udn/8Wllr55pvbBeq/62z90gVVwJ7DThzm5A+M9S2jjFzF3gFikpIRbfD0R+ovl13J0CaaCGbJjwNWEy3OhQSuz6+E0g3yTWtWAbcUqaa/ocSzVRgh35oBAwa+ZjMQXdvqFJ+et541rM5aMARqRoajvuldJIWRotNW5w4M8OSnUu2CFiW6d+XnoJZiCE/npwwNW0uc2fvqic1J/Ra95/X+oPmQTHljuUAPp0dTo4DqmdUIh1iwvS7kVskbA1qlp/9kgR516D7zN4y1kbX6iiemmQ5xsum3ioUDgjRM8P4Dt9nh6xns2BX8g7HDDFwaNMZJrFUe+Zxpxqy97XbSFIqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zGl+9hRTdFrVEu4fUHEevYa8NUR1q3WnfljorLNPr+Y=;
 b=HYF+rufWop6KJHPp7HoTE0T41r7uSk0D4sCcZXDmRw1+DmiCVj/8G79d1P95Lw2vOqVUJ39YMTHR05l25DO2eKWrEYezcymQDk7hbegXpuxXog+BK6Xo0pOs0/vxaaANWahYBGf8YYOxlT+5AjX1Woa8jqPTfaJIwpdkRHaAEMz6TdvfuoiQvA2StTX0ho+4UJCKk/fEH+z2T2d7irRdUeVjxOgDShXl/34Ntvk+gvr7w+DtQY+bc/IyQhSyCsApXR/BOzPfARJzfG9QBXiBNlLto2zxONVbMM9HD9MBwswryq2Enq3QR4+g4NrhHXY1+u38WYEsDKezem0PUrcdfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPF69154114F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::28) by DSWPR11MB9955.namprd11.prod.outlook.com
 (2603:10b6:8:369::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Tue, 20 Oct
 2026 11:19:28 +0000
Received: from DS4PPF69154114F.namprd11.prod.outlook.com
 ([fe80::79ab:f4ae:b1c2:61d9]) by DS4PPF69154114F.namprd11.prod.outlook.com
 ([fe80::79ab:f4ae:b1c2:61d9%5]) with mapi id 15.21.0546.012; Tue, 20 Oct 2026
 11:19:27 +0000
From: "Kahola, Mika" <mika.kahola@intel.com>
To: "Hogander, Jouni" <jouni.hogander@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Hogander, Jouni" <jouni.hogander@intel.com>, "stable@vger.kernel.org"
 <stable@vger.kernel.org>
Subject: RE: [PATCH 1/8] drm/i915/psr: Clear selective fetch area when
 duplicating plane state
Thread-Topic: [PATCH 1/8] drm/i915/psr: Clear selective fetch area when
 duplicating plane state
Thread-Index: AQHdT/dBwHXTPA0xpEa3B64CaluLKrcGabPw
Date: Tue, 20 Oct 2026 11:19:27 +0000
Message-ID: <DS4PPF69154114F2B403DB0BBE04C503D6EEF672@DS4PPF69154114F.namprd11.prod.outlook.com>
References: <20260929094434.77129-1-jouni.hogander@intel.com>
 <20260929094434.77129-2-jouni.hogander@intel.com>
In-Reply-To: <20260929094434.77129-2-jouni.hogander@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPF69154114F:EE_|DSWPR11MB9955:EE_
x-ms-office365-filtering-correlation-id: 44ddb9ee-bd25-4097-0a4b-08df2e9c0120
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|38070700021|56012099006|11063799006|4143699003|261009223027099003|10067099003|18002099003|22082099003|6133799003;
x-microsoft-antispam-message-info: 4fzS7NRYoE3h9LQh3wnOWjIgr2aYGet+dNTiwidIq382uJHePpf1TX4CTuoWDv/H7Lx2RTVanegfbsX1QdHfsWVHXZvntvv+7IebKlMEMSdhSZEpzd1HHyPOjsaJUtyDKvudsLgcF/oBF0owO9DQISeJPFg92ehgmJju4SgjSK71E4QAa8RiznvNgXQRRw4hL92dx+L5wFCGb/eDK+2BsI427/PevrOlTFcJNRe61YgcUjy6wVkQtbkPqXaJNhKKIm/pOahA9YabBLURU7MNcRfVaO73zNXrewGCMO90TKSQK7GGOqK+Qcsx/UBTxWTXpHvLou/AtxBa3xDfFOwJoqbQNruXAmF6rogxc7odGJoYB/NqoEYsnwFxUmdck2Rd4zIQ0VHSkTLbgwCPB1KSIPQXaxBTFWpAz82AzYSkkEa+Mi++G4/W6pD0C9JtIGfaH4v0aJbzmVbdoOy5MWBkZ8P6dy75GZ2vxHoFgNSIA1p32WLsDTOy5YB7h/UAUaYTbrWijjNH8CpM+OjzkpKXkufoDf3DLAo2IEpqlaZEeSveSYR+pe89Gx3gyebQ8CY2cc6NOd2jymVEEdsYeaVqE8QaQoQl9eBhNTbxSwni6UqISaAM1QG6VDj0vQe2yNGqDMyWt4e8iv6QkJThgwrrYHx0R7XeDXcpNH44oG5mi+u9Luwv2mBFUEhAZOY8jxtZRBSikAomhKPCWx6okMMxGSSGxXXlx7pA1erF4bVxG0c=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF69154114F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(38070700021)(56012099006)(11063799006)(4143699003)(261009223027099003)(10067099003)(18002099003)(22082099003)(6133799003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?em5MZDRYMjdkbEx1blpUeFE1Rk9uY3h2V01SeElPZG1hMkZqUzRhMmN1Ly9w?=
 =?utf-8?B?eEtPaEJXa3FyZUNxU3J2Z3NHSngxTjhTL0hPTlJjNlpJWVROckZwMzBjYU5n?=
 =?utf-8?B?TGIwd3lXeXhXTWZjU3VHT09jdUxOSnM4bWJETkpIcjlYd0xzejVmR0xsNFVH?=
 =?utf-8?B?ZE11T0Jsd1UwYi9xd2hicjZDYkVkWmZoZ3I5U0RtZGdrZ3VCUHA2c3V0eU05?=
 =?utf-8?B?dGo1OThUOUowNVlCUWFOdmVLRnNmQXJabEdsN2orYW0xRDFvbXVzSjY3OHp6?=
 =?utf-8?B?azFsWkJMajM1WG85bzhVcUVyNkhpb2c5UytGRTc5dFRFWkhodzE3ZEk2VjZU?=
 =?utf-8?B?MjVGeHZ5UVRSUW94anoxS2NHWjNjanB4bmFManV5YncwZi9odDdQSDR0TExQ?=
 =?utf-8?B?ZG9pRm1nd216ZjlScGpRVEQrRHV6YlVCSTNEUGZaZFJPMHBvV0FzSUNGdWNK?=
 =?utf-8?B?MXJFTjZoZC82QkR5UVZtQlhWYTVocWhtR0RQTXdWZHA0YjhkbXh1SDdWSVgr?=
 =?utf-8?B?QVQwNm5NNUpaZkR2V1RZTXdSUzhwdGFwbWg5dzFmWWVCbWc2NDBaYnFqZ3My?=
 =?utf-8?B?RzJXOWdCSU1NQ3hFR09uZ0Iwek5QL2hIOU1kc0J3WHNyemk1Q0dtcmR1U0Rx?=
 =?utf-8?B?cVFDajJYcVBVWEtxdEFxSlZtT3prV3NWV2RabkdUMnBMR0U1cmlPQjdOU21N?=
 =?utf-8?B?cDlqUkQ3SXVpNlNiKzFGdmVKL1NEbEVRSnZQbFh2bkFPVVR5SzcyeXJhK3Ux?=
 =?utf-8?B?Q3VGb2ZBSUlQN2JBaU9FMldlL3BWTzhJdjgwODNLRDhpd05rTDVtY0Y2TXVo?=
 =?utf-8?B?Vkh0UnpyeVM4RlNEUFo3NmQ3MTNDL3ExNTRhei9tUnFlWnJOZUNWWWVmYlBa?=
 =?utf-8?B?d0p4aVBUeWdnY0xVNk5wU0lOamNsWVo2aFdoUWJVRXBqcTRGekhjWFNvODVR?=
 =?utf-8?B?bEUrd0lPYlNYWUNDaE9Eak96Z3JSRDBqZXBETU5tTGxXY2ZraDFET3p5clgr?=
 =?utf-8?B?T2FKYWZxcXEzRzRBam9BNVlLb2pMNzlZM281REh5M2RNenFWSGk3YUhtMTJo?=
 =?utf-8?B?OUhjNkNURVkrb2g4ZEhuUTVXZHloWkszNXhqQS95QkJpTWszTE04dTErdGJr?=
 =?utf-8?B?RDdMd0ZoZUp6elB4UmNqSHRUdkRIejNFS3lYbVBtVk9tY21wQ21zTjlwMklo?=
 =?utf-8?B?YVdpVzhJbm12U1pDWWJDaFpxb0VKVXQ1V0QzbWsrYjFqaFhCcnRuZzY2c1VY?=
 =?utf-8?B?SzJVcWw1SnRpblFjdjFScDBpOHRaNTQ4SWZZNTlwQTRlZ2RjemlIVGhFRjdB?=
 =?utf-8?B?TnZXMjJDTVlJYnA3WHlUSnVTbGJiSjNVWFFLUzhkK2hpQ1JjWlk1WlZjempt?=
 =?utf-8?B?T1drSGNXYzh1ZVRJTElJQXQydHVkemdFZ1lZdDg3T2xMcE40STN6OFhnZXZE?=
 =?utf-8?B?b2Y5ZVJBUXpieHlHbFFLTURDM2Y4QVBPMThHcmlITEtidFY5RzQrbExqekY3?=
 =?utf-8?B?MGZESVNPcEVaa1hsQUtFVkYySGxvaXkvWUltckxHRVpiVnJjbXh2Um02Mk1m?=
 =?utf-8?B?N0JNQWVVQW8zZFI0TUFZRW1UZjBZSklnbFArZWU0aW9qbkovQ3d6d2IvdUdL?=
 =?utf-8?B?K2dtMjFOS2hqeHRTZS93ZmV1bUdlVFdVMk4zMi9QTUo1NXhsQXg0VVFxRXkv?=
 =?utf-8?B?djRvbi9BdzQ0UFBRUGtybjBiUGpkcFp6Q09WRFdsRXdiRzRKNUg3NUhGQ0tV?=
 =?utf-8?B?cXZ5Q3N5bmtyWGZLL3NMR1JncC9wdlhmMEFKb2JQeE1CYU5SaE1ZeFR0c3lm?=
 =?utf-8?B?SDc2Y0ROdTRpckVTME9IdGYyNDRsWFFsa2pzOERid3p2Q0tCdUc3Q1QzOXZj?=
 =?utf-8?B?R1pQcUQxSkdMU2NFTEZhQjliWFZlWTNFME1CWkNxc1FzeFVuSWNEREZsM3dI?=
 =?utf-8?B?RGgzT3cxdHFTcG5rZDhadlpHczY3TElRWkZMMkZPMk5MbHhWNlhDMFpyZjB5?=
 =?utf-8?B?RXJZRkdyMS9PR3pYanR4bXdKbVNoTEsraU9Od1AxeXk2V1kwbkZxd243d2pY?=
 =?utf-8?B?QjJRUU9HeXBScjE4ZnZHSjA0NDJHUXpTb0E3UVFvazFZYWJ1OW50dFZpempI?=
 =?utf-8?B?elFaa0YyaTJKODYyRWlnK2Z2YVp4T3NWUitxeERrdGxGaTFBajlaZzBsT01H?=
 =?utf-8?B?YjFSMWRybk9OdThtekkvMWh1L0ZnS1NOU21HWjFLdjR3Z1laSEszV1ZVZHVj?=
 =?utf-8?B?Rm1nUzVMVjJPQ0F4MlpqMkQvTzhOdlRvZEwvRSs1VTU5d25ibWZaQW9aam8z?=
 =?utf-8?B?N05odnBPemxOQXlUQ2cvUHZFRWdVcTVkZjhhcms5MVUybmhmZmR4QT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: F62EbAEU9jn4L2hDXyzaBF/Ew0H4arRQ8aKDuEKkXQXi43tMPasFDDOBrQhPg/PLUynLb8bbUSNcwT2Hgue6/IgCIPldIlLnk2mT7tPpzG4GjTRk9ycoEUis0ZivgsRBbOFGeC702xB9eNxcbtq78Ug4YH0MKVNq+JsqfvrSJK9obyuOgFykwgbIk1Amgi0DbyhdKkkWZWBvHmuLs7IOtZWXrB74t4ylvN69HbbLGvLKimkdjgYXXGXTkSnuFR/G0WaE4bGR9l7rpPUC1VpG1UC52UDq3SOYMDAt5vOFPcUYNAfBwtRNPN7FizHnbsbp6yJttyisx76xiEoqHYHnzw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF69154114F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44ddb9ee-bd25-4097-0a4b-08df2e9c0120
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Oct 2026 11:19:27.7951 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Bmkeu263nM2y4hJyRDYcJY6jxB6dW8dco86uuPvWbTwlTryBmliTaPgFR2dtxw+77fF298F1CIzvxmy2/CsLjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSWPR11MB9955
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
	SPF_PASS autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBJbnRlbC1nZnggPGludGVsLWdm
eC1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mIEpvdW5pIEjDtmdh
bmRlcg0KPiBTZW50OiBUdWVzZGF5LCAyOSBTZXB0ZW1iZXIgMjAyNiAxMi40NA0KPiBUbzogaW50
ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgaW50ZWwteGVAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnDQo+IENjOiBIb2dhbmRlciwgSm91bmkgPGpvdW5pLmhvZ2FuZGVyQGludGVsLmNvbT47IHN0
YWJsZUB2Z2VyLmtlcm5lbC5vcmcNCj4gU3ViamVjdDogW1BBVENIIDEvOF0gZHJtL2k5MTUvcHNy
OiBDbGVhciBzZWxlY3RpdmUgZmV0Y2ggYXJlYSB3aGVuIGR1cGxpY2F0aW5nIHBsYW5lIHN0YXRl
DQo+IA0KPiBXZSBhcmUgY3VycmVudGx5IG5vdCBjbGVhcmluZyBzZWxlY3RpdmUgZmV0Y2ggYXJl
YSB3aGVuIGR1cGxpY2F0aW5nIHBsYW5lDQo+IHN0YXRlLiBUaGlzIGlzIGNhdXNpbmcgcHJvYmxl
bSB3aGVuIHBsYW5lIGlzIHJlLXVzZWQgZm9yIGFub3RoZXINCj4gcHVycG9zZS4gRml4IHRoaXMg
YnkgY2xlYXJpbmcgc2VsZWN0aXZlIGZldGNoIGFyZWEgd2hlbiBkdXBsaWNhdGluZyBwbGFuZQ0K
PiBzdGF0ZS4NCj4gDQo+IE5vdyBhcyB0aGUgc3RhdGUgaXMgY2xlYXJlZCB3ZSBuZWVkIHRvIGVu
c3VyZSB3ZSBoYXZlIGNvbnNpc3RlbnQgc2VsZWN0aXZlDQo+IGZldGNoIGFyZWEgaW4gcGxhbmUg
c3RhdGUgb24gZnVsbCB1cGRhdGUuIEVhcmxpZXIgdGhpcyB3YXMgcmVseWluZyBvbg0KPiBzZWxl
Y3RpdmUgZmV0Y2ggYXJlYSBiZWluZyBjb3BpZWQgZnJvbSBvbGQgc3RhdGUgb24gc3RhdGUgZHVw
bGljYXRlLiBOb3cNCj4gdGhpcyBpc24ndCB0cnVlIGFueW1vcmUgYXMgd2UgYXJlIGNsZWFyaW5n
IGl0LiBUYWNrbGUgdGhpcyBieSBzZXR0aW5nIGZ1bGwNCj4gcGxhbmUgYXJlYSBhcyBzZWxlY3Rp
dmUgZmV0Y2ggYXJlYSBmb3IgZWFjaCBwbGFuZSBvbiBmdWxsIHVwZGF0ZS4gUmVuYW1lDQo+IHRo
ZSBsYWJlbCBhcyBza2lwX3N1X2FyZWFfY2FsYyBhcyB0aGUgbG9vcCBzZXR0aW5nIHRoZSBwbGFu
ZSBzZWxlY3RpdmUNCj4gZmV0Y2ggYXJlYSBpcyBub3Qgc2tpcHBlZCBhbnltb3JlLg0KPiANCj4g
TW92ZSBhbHNvIHBzcjJfc2VsX2ZldGNoX3BpcGVfc3RhdGVfc3VwcG9ydGVkIGNoZWNrIGFmdGVy
IHBzcjJfc3VfYXJlYQ0KPiBpbml0aWFsaXphdGlvbi4gVGhlIGxvb3AgaXMgcnVuIG9uIGZ1bGwg
dXBkYXRlIGFzIHdlbGwgbm93IGFuZCBpdCBuZWVkcw0KPiBpbml0aWFsaXplZCBwc3IyX3N1X2Fy
ZWEuIENsaXBfYXJlYV91cGRhdGUgaXMgb25seSB0b3VjaGluZyByZWN0IGhlaWdodCBhbmQNCj4g
eDEveDIgYXJlIGxlZnQgdW50b3VjaGVkLg0KPiANCj4gRG9uJ3Qgc2V0IHRoZSBhcmVhIGF0IGFs
bCBmb3IgcGxhbmVzIG5vdCBpbnRlcnNlY3Rpbmcgd2l0aCB0aGUgc2VsZWN0aXZlDQo+IHVwZGF0
ZSBhcmVhLiBJdCBpcyBhbHJlYWR5IHplcm8gc2l6ZWQgYWZ0ZXIgcGxhbmUgc3RhdGUgZHVwbGlj
YXRlLg0KPiANCj4gRml4ZXM6IGVmYWI0NzY1OGE2YyAoImRybS9pOTE1L2Rpc3BsYXkvcHNyOiBD
YWxjdWxhdGUgc2VsZWN0aXZlIGZldGNoIHBsYW5lIHJlZ2lzdGVycyIpDQo+IENjOiA8c3RhYmxl
QHZnZXIua2VybmVsLm9yZz4gIyB2NS4xMisNCj4gQXNzaXN0ZWQtYnk6IEdpdEh1Yi1Db3BpbG90
OmNsYXVkZS1vcHVzLTUNCj4gU2lnbmVkLW9mZi1ieTogSm91bmkgSMO2Z2FuZGVyIDxqb3VuaS5o
b2dhbmRlckBpbnRlbC5jb20+DQoNClJldmlld2VkLWJ5OiBNaWthIEthaG9sYSA8bWlrYS5rYWhv
bGFAaW50ZWwuY29tPg0KDQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9p
bnRlbF9wbGFuZS5jIHwgIDEgKw0KPiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRl
bF9wc3IuYyAgIHwgMjQgKysrKysrKysrKy0tLS0tLS0tLS0tLQ0KPiAgMiBmaWxlcyBjaGFuZ2Vk
LCAxMiBpbnNlcnRpb25zKCspLCAxMyBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX3BsYW5lLmMgYi9kcml2ZXJzL2dwdS9k
cm0vaTkxNS9kaXNwbGF5L2ludGVsX3BsYW5lLmMNCj4gaW5kZXggMjVjYTA0OTAwOWVmYi4uZjkw
OGVhYmU2MDRiYiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9p
bnRlbF9wbGFuZS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxf
cGxhbmUuYw0KPiBAQCAtMTQwLDYgKzE0MCw3IEBAIGludGVsX3BsYW5lX2R1cGxpY2F0ZV9zdGF0
ZShzdHJ1Y3QgZHJtX3BsYW5lICpwbGFuZSkNCj4gIAlpbnRlbF9zdGF0ZS0+ZHB0X3ZtYSA9IE5V
TEw7DQo+ICAJaW50ZWxfc3RhdGUtPmZlbmNlX2lkID0gLTE7DQo+ICAJaW50ZWxfc3RhdGUtPmRh
bWFnZSA9IERSTV9SRUNUX0lOSVQoMCwgMCwgMCwgMCk7DQo+ICsJaW50ZWxfc3RhdGUtPnBzcjJf
c2VsX2ZldGNoX2FyZWEgPSBEUk1fUkVDVF9JTklUKDAsIDAsIDAsIDApOw0KPiANCj4gIAkvKiBh
ZGQgcmVmZXJlbmNlIHRvIGZiICovDQo+ICAJaWYgKGludGVsX3N0YXRlLT5ody5mYikNCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfcHNyLmMgYi9kcml2
ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX3Bzci5jDQo+IGluZGV4IGYxZDQ4YjY5YTE4
ZmEuLmY2MjBjNDRlZTQwMDggMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rp
c3BsYXkvaW50ZWxfcHNyLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9p
bnRlbF9wc3IuYw0KPiBAQCAtMjkyMCwxNiArMjkyMCwxNiBAQCBpbnQgaW50ZWxfcHNyMl9zZWxf
ZmV0Y2hfdXBkYXRlKHN0cnVjdCBpbnRlbF9hdG9taWNfc3RhdGUgKnN0YXRlLA0KPiAgCWlmICgh
Y3J0Y19zdGF0ZS0+ZW5hYmxlX3BzcjJfc2VsX2ZldGNoKQ0KPiAgCQlyZXR1cm4gMDsNCj4gDQo+
IC0JaWYgKCFwc3IyX3NlbF9mZXRjaF9waXBlX3N0YXRlX3N1cHBvcnRlZChjcnRjX3N0YXRlKSkg
ew0KPiAtCQlmdWxsX3VwZGF0ZSA9IHRydWU7DQo+IC0JCWdvdG8gc2tpcF9zZWxfZmV0Y2hfc2V0
X2xvb3A7DQo+IC0JfQ0KPiAtDQo+ICAJY3J0Y19zdGF0ZS0+cHNyMl9zdV9hcmVhLngxID0gMDsN
Cj4gIAljcnRjX3N0YXRlLT5wc3IyX3N1X2FyZWEueTEgPSAtMTsNCj4gIAljcnRjX3N0YXRlLT5w
c3IyX3N1X2FyZWEueDIgPSBkcm1fcmVjdF93aWR0aCgmZGlzcGxheV9hcmVhKTsNCj4gIAljcnRj
X3N0YXRlLT5wc3IyX3N1X2FyZWEueTIgPSAtMTsNCj4gDQo+ICsJaWYgKCFwc3IyX3NlbF9mZXRj
aF9waXBlX3N0YXRlX3N1cHBvcnRlZChjcnRjX3N0YXRlKSkgew0KPiArCQlmdWxsX3VwZGF0ZSA9
IHRydWU7DQo+ICsJCWdvdG8gc2tpcF9zdV9hcmVhX2NhbGM7DQo+ICsJfQ0KPiArDQo+ICAJLyoN
Cj4gIAkgKiBDYWxjdWxhdGUgbWluaW1hbCBzZWxlY3RpdmUgZmV0Y2ggYXJlYSBvZiBlYWNoIHBs
YW5lIGFuZCBjYWxjdWxhdGUNCj4gIAkgKiB0aGUgcGlwZSBkYW1hZ2VkIGFyZWEuDQo+IEBAIC0z
MDEzLDcgKzMwMTMsNyBAQCBpbnQgaW50ZWxfcHNyMl9zZWxfZmV0Y2hfdXBkYXRlKHN0cnVjdCBp
bnRlbF9hdG9taWNfc3RhdGUgKnN0YXRlLA0KPiAgCX0NCj4gDQo+ICAJaWYgKGZ1bGxfdXBkYXRl
KQ0KPiAtCQlnb3RvIHNraXBfc2VsX2ZldGNoX3NldF9sb29wOw0KPiArCQlnb3RvIHNraXBfc3Vf
YXJlYV9jYWxjOw0KPiANCj4gIAlpbnRlbF9wc3JfYXBwbHlfc3VfYXJlYV93b3JrYXJvdW5kcyhj
cnRjX3N0YXRlKTsNCj4gDQo+IEBAIC0zMDQ5LDYgKzMwNDksMTEgQEAgaW50IGludGVsX3BzcjJf
c2VsX2ZldGNoX3VwZGF0ZShzdHJ1Y3QgaW50ZWxfYXRvbWljX3N0YXRlICpzdGF0ZSwNCj4gIAkJ
CWJyZWFrOw0KPiAgCX0gd2hpbGUgKHN1X2FyZWFfY2hhbmdlZCk7DQo+IA0KPiArc2tpcF9zdV9h
cmVhX2NhbGM6DQo+ICsJaWYgKGZ1bGxfdXBkYXRlKQ0KPiArCQljbGlwX2FyZWFfdXBkYXRlKCZj
cnRjX3N0YXRlLT5wc3IyX3N1X2FyZWEsICZkaXNwbGF5X2FyZWEsDQo+ICsJCQkJICZkaXNwbGF5
X2FyZWEpOw0KPiArDQo+ICAJLyoNCj4gIAkgKiBOb3cgdGhhdCB3ZSBoYXZlIHRoZSBwaXBlIGRh
bWFnZWQgYXJlYSBjaGVjayBpZiBpdCBpbnRlcnNlY3Qgd2l0aA0KPiAgCSAqIGV2ZXJ5IHBsYW5l
LCBpZiBpdCBkb2VzIHNldCB0aGUgcGxhbmUgc2VsZWN0aXZlIGZldGNoIGFyZWEuDQo+IEBAIC0z
MDY1LDggKzMwNzAsNiBAQCBpbnQgaW50ZWxfcHNyMl9zZWxfZmV0Y2hfdXBkYXRlKHN0cnVjdCBp
bnRlbF9hdG9taWNfc3RhdGUgKnN0YXRlLA0KPiAgCQlpbnRlciA9IGNydGNfc3RhdGUtPnBzcjJf
c3VfYXJlYTsNCj4gIAkJc2VsX2ZldGNoX2FyZWEgPSAmbmV3X3BsYW5lX3N0YXRlLT5wc3IyX3Nl
bF9mZXRjaF9hcmVhOw0KPiAgCQlpZiAoIWRybV9yZWN0X2ludGVyc2VjdCgmaW50ZXIsICZuZXdf
cGxhbmVfc3RhdGUtPnVhcGkuZHN0KSkgew0KPiAtCQkJc2VsX2ZldGNoX2FyZWEtPnkxID0gLTE7
DQo+IC0JCQlzZWxfZmV0Y2hfYXJlYS0+eTIgPSAtMTsNCj4gIAkJCS8qDQo+ICAJCQkgKiBpZiBw
bGFuZSBzZWwgZmV0Y2ggd2FzIHByZXZpb3VzbHkgZW5hYmxlZCAtPg0KPiAgCQkJICogZGlzYWJs
ZSBpdA0KPiBAQCAtMzEwNiwxMSArMzEwOSw2IEBAIGludCBpbnRlbF9wc3IyX3NlbF9mZXRjaF91
cGRhdGUoc3RydWN0IGludGVsX2F0b21pY19zdGF0ZSAqc3RhdGUsDQo+ICAJCX0NCj4gIAl9DQo+
IA0KPiAtc2tpcF9zZWxfZmV0Y2hfc2V0X2xvb3A6DQo+IC0JaWYgKGZ1bGxfdXBkYXRlKQ0KPiAt
CQljbGlwX2FyZWFfdXBkYXRlKCZjcnRjX3N0YXRlLT5wc3IyX3N1X2FyZWEsICZkaXNwbGF5X2Fy
ZWEsDQo+IC0JCQkJICZkaXNwbGF5X2FyZWEpOw0KPiAtDQo+ICAJcHNyMl9tYW5fdHJrX2N0bF9j
YWxjKGNydGNfc3RhdGUsIGZ1bGxfdXBkYXRlKTsNCj4gIAljcnRjX3N0YXRlLT5waXBlX3NyY3N6
X2Vhcmx5X3RwdCA9DQo+ICAJCXBzcjJfcGlwZV9zcmNzel9lYXJseV90cHRfY2FsYyhjcnRjX3N0
YXRlLCBmdWxsX3VwZGF0ZSk7DQo+IC0tDQo+IDIuNDMuMA0KDQo=
