Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B02A1606A321
	for <intel-xe@archiver.kernel.org>; Tue, 10 Nov 2026 15:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mt/kDibA
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 749B710F138;
	Tue, 10 Nov 2026 15:39:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7B3C10F138;
 Tue, 10 Nov 2026 15:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794325136; x=1825861136;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=gWj3ZuG8+Vw7hII29dphRUJmZ4sQ2W5CezCAytnFhsU=;
 b=mt/kDibAOpUrnfV+cDTGabuaBaVjbSFRtqlE846EOdssM/rOoT9fnIDu
 +SXU75u/kW/52GE211MC19pLMUcfpxUBaP6V8ZxvlUZO9LN6aKNHSHrhO
 2d1XcaOj6V7tuyq/gz/peWkhJex4oNTdEZT24Inwx/cnlYFcb2Ax9VE9Y
 Jc+H/kYnD8tjjSZ+B6oanH+O0Q6iT3MrdhCMpi4+fV3zcAG+Bx16MCBDe
 UhjezWEBiHNqqayQDCnf6FEgWm6Cngae4zQts0OxaslihtUbcEHmPoj2a
 lDBsRBXrAO8QyM+qK3MQlZx6+5P8P5WqSCSVqNcTTFpOsW1HM1gWLD44S w==;
X-CSE-ConnectionGUID: MuQTIE/lROql57h9po9TKQ==
X-CSE-MsgGUID: IQAhtumoRyyx10Msd2Y3hg==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="2944763"
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="2944763"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 07:38:56 -0800
X-CSE-ConnectionGUID: vrcAcjMXSuOD0p90oKEJyQ==
X-CSE-MsgGUID: N3yN/Zo7S1SJSO2dxjS5Xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="8472147"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 07:38:56 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 10 Nov 2026 07:38:55 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Tue, 10 Nov 2026 07:38:55 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.13) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 10 Nov 2026 07:38:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ITGiNYNxwG/V94+nnFoKy79xnyYnKoNsmPNnQlOqktLQtQGM9glqN8ZNFTTZM4GNPJq2ZsCs0nzP0TksMUNNFPW+XoMqltdSdqCf8bABR8sd0zv2MVsuE5tRMV6pXd7bZBJSPhnnKCmOHTHJGyWtHJ4m6ch8BSMTccFimp+K/yeR+zEqFU/w09qt81z2VmYdp1vh3Nx6c0xAM2bDTGKaalITTBJAOul/fFcAcLNJCOn7+ZwKGCYzje5lYPk1Gi5NEBWHX7owFwMiATrLmbu0iSIEEhUOQkwnfpb6pjmJAS/MjxnXAdgIMfHYgtAxxSYXew0Y+hmVjWU4W5PmeVbmRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gWj3ZuG8+Vw7hII29dphRUJmZ4sQ2W5CezCAytnFhsU=;
 b=lq28zIy4sL2JdsNpufAD3hy8NAunQ00jxvLYTaMfvAGogP34Uf86L7uK/6AMfC/sWvOP1T+GmTWUNRvPwRAjrtmKQ2mIvSmOAgpRMs96L1nKzyP7eVkhnLY+7gbETjkIuFJubkCYt5ihIdpBkwemqJay5xJ2lcnmJI80sJLt/Y5pBK7G6YUau9I1HXb5GGvC7XzjykaTlm/eWEgk1wrc1HMD0kjN9Ily4qVbb/UKYENamgE0VleOBTSRMgXzuG5xLYaGz/rQMSxjfxQ/8fIYeMjNrf0DA92dAeMSCe5sVU6p59wf9Elj0LUAYx08pSE+x9PwKGxw3X+nxrB4f49yHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPF69154114F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::28) by DSWPR11MB9558.namprd11.prod.outlook.com
 (2603:10b6:8:36c::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Tue, 10 Nov
 2026 15:38:52 +0000
Received: from DS4PPF69154114F.namprd11.prod.outlook.com
 ([fe80::79ab:f4ae:b1c2:61d9]) by DS4PPF69154114F.namprd11.prod.outlook.com
 ([fe80::79ab:f4ae:b1c2:61d9%5]) with mapi id 15.21.0615.007; Tue, 10 Nov 2026
 15:38:50 +0000
From: "Kahola, Mika" <mika.kahola@intel.com>
To: =?utf-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
CC: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Victor
 Carreras" <vicajilau@gmail.com>
Subject: RE: [PATCH] drm/i915/dp: Don't recheck the eDP link state after a
 passing link training
Thread-Topic: [PATCH] drm/i915/dp: Don't recheck the eDP link state after a
 passing link training
Thread-Index: AQHdcPyxe4t7yoLDnU2psk8LS6XOv7cnLrKAgABAu6A=
Date: Tue, 10 Nov 2026 15:38:50 +0000
Message-ID: <DS4PPF69154114FF218CC9ED71E781976E5EF722@DS4PPF69154114F.namprd11.prod.outlook.com>
References: <20261110101713.3684346-1-mika.kahola@intel.com>
 <avMCw5rPER8uY_wu@intel.com>
In-Reply-To: <avMCw5rPER8uY_wu@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPF69154114F:EE_|DSWPR11MB9558:EE_
x-ms-office365-filtering-correlation-id: a2dfc32c-3245-49bc-cb4f-08df3f40b7bf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|23010399003|376014|1800799024|4143699003|11063799006|38070700021|56012099006|22082099003|18002099003|6133799003|10067099003|261022105027099003|261102123227099003|261022075727099003|261021121427099003|261021123027099003|261028144727099003|261026140227099003|261026121527099003|261009223027099003;
x-microsoft-antispam-message-info: uatz/ZwS5fSOxCOBa04AUZyQ/PJb3gglQ1Nm759qvhb4LIL8V19FDOWr2zqiXFHkxCoBXrYzZANpiAtE7LOZfblv6NXiuRuzIhiBQyjGO6qmq83A4yZQTPbsg6VANHSlqrFGZl2ATJogc42C2adhEz/mBEfdoi+kwZNJ6Km7aPbo0f8O3UMhPgnd5My9zX+V5mpoOdzc7YWn2GqMzTbzI4GOdgsF4pj5VzqbAcSqxNujs3gXJlKJciJ6pnP+eiwOrzVGqzACFkXoOwyZtLGVh03FI+owrMe7VwqPYswBX/xKzcWKSD/l6DHOIOQYFY1+bhMb6S3dZqp3O1KerufxqDjslNjyCsNtRcS7j//e9vHo1XZAKlqHAcXaCPnCH6dN7v2nSR/s72ixemplhQDgQdvC91BvdvyHlcxc8djdoyHnI2ady2X+X0CiSGh+WsH8NJUuSySPY3AXhW3jKv2QuMmqznaU6mC1gDSeg+snUDABmMVxl//bEkqh8QBILhLijYhU8H5JhZerAPDvKxviyfbYSENf3jUTZOHMOAiwaWtpq9T7Xb1TYnBQj3+rVQoumOWZ6zvacryfsrZTf9qYttZNpYLIwHofwmg+zETPoLjMdtJprCRsfvLtHKzr9p09jVmys6cO7HLFhze7w/3p0/w//V4m0DbUppbuUjMZ/8M=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF69154114F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(4143699003)(11063799006)(38070700021)(56012099006)(22082099003)(18002099003)(6133799003)(10067099003)(261022105027099003)(261102123227099003)(261022075727099003)(261021121427099003)(261021123027099003)(261028144727099003)(261026140227099003)(261026121527099003)(261009223027099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aWhtVEtBV2hxa3BsODA0WklFWExEQnRTMUVIZXZHeE40TE94TW1Da2dTWkZ0?=
 =?utf-8?B?SDhIcmRCdFZoZlVtdFZ2K2xpV2NsS2swTjIzbGVZUWF4cDdiVE84U2owcjU4?=
 =?utf-8?B?Um5pZENmejhCdDRyRk1FVWdySGtCTlNYcE4zRzlBWG03TDE0cUhoVjVJUDEx?=
 =?utf-8?B?aWhCV0czRHNLa1NlRzZCcHlZZUsxSjFHKzc1RDgwd0tqTE40ZjlsTjJRMmhx?=
 =?utf-8?B?S2NZYVE4dlNKT0ZVYnJ1b1AzRGxTQ0FPdjdPdFhwNmpOTmxjZ3A0a3BEQzA0?=
 =?utf-8?B?QVdEM1V2dlE2eUpVUGxEbzhUWE8yc2dITHhyY3V4dWdrSzJ6bjFvTTR1UjE5?=
 =?utf-8?B?SWtYVVFGR3RGcm9sOGVyVTdoQ1huYkc3OEJGM05IZ2NCbytncGdQMGU2clFr?=
 =?utf-8?B?Q1Fwam5YazlHUDEzWnY5enE5Ym5aQjRaRG4rYmNYTzVtbUM2cnRuODA5Z1Vh?=
 =?utf-8?B?OHQ1cUlObTFqN0dtenZRUU1vcFM1RjlhR0JueGdyc1VFK2FKNnNQSng4VWp1?=
 =?utf-8?B?cVBJNmtMQ011Z2VGKzBLTzVSaEVPMnR3eUtSemRXS1FzT3RUR1RkODdlVFBW?=
 =?utf-8?B?MlVSaGFlMEtaZ2p6bjlyTndFRFVFTFRUTXRjNDRxNitoRWtpemJzcXpSZkFp?=
 =?utf-8?B?ODl4dFp3ak5Ka2RKYy9HMmFCREpORk9kODNMQktxeWMzMDhyRG9nT2luaHJr?=
 =?utf-8?B?a3VzTHljL2M4U1FZQzM5R1pFVkZid1FRckY1QXREZTZkTnNSZjJYQUZpUUtC?=
 =?utf-8?B?VE9ybjVYcjA1VjZubzBWYW9PQXlyNkQwb05KZ3JNU3Fud3dGajRZdVhxTWZy?=
 =?utf-8?B?YkViMnlER01uMlpKNHpnMlV5ZTR5ZVgyb1YySjVIckNOOVZJV1hlbHMyUHlm?=
 =?utf-8?B?SE8yK1k1MXJISmdTbitWTjYwaCt1bWJLWnRqdnV2U0pLVFQvUGFVZXd0Y0tW?=
 =?utf-8?B?b2ZjR0FIL2t5RlJ3QWdWQVlHRUZHRmxkOEFkRFVNQlJ3QXc2Rng1Q25xazh2?=
 =?utf-8?B?UVp3cFFsekNyU3NRdkc1N0hQc2o2c3dlNXFaK2VVMjhBT0VCc2RLVlZkeDZO?=
 =?utf-8?B?bzBNd08zSmpNMnEvSHRDYVA2NjlYaGtvdDZyL2ZhRWxERUpVYytVazlYZjBp?=
 =?utf-8?B?YUFsNnhyaWI5YktJdmNPWi85MEFzMkJ0T28ycWl6blcwbXd1Rm5hdndSa3pv?=
 =?utf-8?B?TzVDa2ZzenM3UnUzTG9LUG56RTE1dStzTmQ1ckhIQnJheTZVU3IxVVZMQ2Mr?=
 =?utf-8?B?K1JCN2FxeW1pbTg5ZHhRSXNocGlySWhCS0UwM3VQZkJ4cGwwSW94a2tDaW5H?=
 =?utf-8?B?WlUwVUZGeHM3WDZOckh6dTlPeFg5Wm9uWnp6Y2t5eDViRmVhUEh2djVwd0ty?=
 =?utf-8?B?VU4yT2J0enZJemhQWWtaUkRZSEM4MnVLektBMVg0clFiaUdZRmpmdGQ2NlRp?=
 =?utf-8?B?YkxLUjlwaDJOSmhoc0FtVzFTTlErU2xxNWJLWmp6VXBra2NNQ1hrcFFDamM2?=
 =?utf-8?B?SmR6Z0ZIU3BCakhJTTZqei9QeEJtNElBSHRLUml5ZzM1SU9qd2hZYU1CV2hl?=
 =?utf-8?B?VExtSW9Fdlg4blhoU0UzZllwRjhuWkJVRnQ3RHQ2VGU5QmJiZ1FHbVV3Tnoy?=
 =?utf-8?B?K3RRR2liTHRyNVNOc2tqN25nZlg2WG1QQTB4YXR0VHFrdHFtbWVXTmlCSjdQ?=
 =?utf-8?B?KzJMMU93d0s5eTJCcHNzNnVEMUh5OVFRMitMRjl6aUh5WURSdG0vUHN5ZUdH?=
 =?utf-8?B?aGZGbVVTZ1V4S2V3M00vaWpPRHEzNVFzUmp1anNHODRjQXIvVEdCd0dWa2s3?=
 =?utf-8?B?dmFKeGNYZFFBWUVWVXBRNm5XK24wR0drNDNxOHNVdXI1aHJHOXc2cW5wWVNY?=
 =?utf-8?B?d2twSmxreWFpaG9SZE1QTHZRQzBvWVhGQXB0TjhuNDN3dHVDdUFMWkRldHV5?=
 =?utf-8?B?YXF5OVhGbDZzQ3FJSXFpV1RHNzJhTWpoc2prY21tTjlIWEhKSlJjZWJGVTNT?=
 =?utf-8?B?bTQ1a3VyUjRvbjVwV1grN0VkMmlUNzR1d3Zhb3ZwK0VLOXkwWW9TWnBwY0lk?=
 =?utf-8?B?N2NmL0ZJTTI1cENWWDd5U3M4KzczNFU3WGoxMVJFeXhpblI4clREV3NJMDIr?=
 =?utf-8?B?VmJtTDU0Y2xrOEhTQXFnRmhiQTJmSGRPRVBHL3lySmNUUFBNNmY5MEJUeFZl?=
 =?utf-8?B?T3plUWF3d2krc2V0d0tnQW9xUDVMUkhVS1hpQmxtS1FwOGkrQVluSVdMaEhX?=
 =?utf-8?B?aXpOYjZWa0tzeW8yb3BTMFNSNy9pTExrSmFzVnZKQXZvL0tXclZYTGhIbnVa?=
 =?utf-8?B?RGx2cDVveVdFRUVHTnFTQzRIVlNyUmQ2T1IweEVhbkJKcTAzK0lHdz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: uYQfaqhVVIgInZSWM8FarSmlNwaSGa5pD8B4lYTw32O1wxKlri7QSHP7KF5FreUf1VB4ilperfS1To8kttBVoNnqON20h8ivlFfmImDvxNS0A2Dd7Tnn90Wr3pjWJbLJxQmcAdADen8BrAboPLJUoB1CUnuTkH95Wa2reLTDmEQ3oT7tswNetY+4zFMAzOAXmNgtQ7mv3wYEnwcWUfYJANFcxKJdVY4FJxHK/w6+jPT9HeCxa9W+MTyvWzwqDjhC8iImnmJY7y2j9qhUY0M5YtPrv5GkyhBHmyZEOvp2aCPv0x6H497v0mXqezi+tfO8t+eeRfKPzSbdwgQCkMFHCw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF69154114F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2dfc32c-3245-49bc-cb4f-08df3f40b7bf
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2026 15:38:50.3131 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: z6BiriCO1A9KWQ+d0vF4oXpgFPs9xV9Ekyz0vosoPlyrHszJTyOZnxjuRzwkBFIBaPXJdGFH5o6CvE3fe8AMvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSWPR11MB9558
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBWaWxsZSBTeXJqw6Rsw6QgPHZp
bGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPg0KPiBTZW50OiBUdWVzZGF5LCAxMCBOb3ZlbWJl
ciAyMDI2IDEzLjQxDQo+IFRvOiBLYWhvbGEsIE1pa2EgPG1pa2Eua2Fob2xhQGludGVsLmNvbT4N
Cj4gQ2M6IGludGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGludGVsLXhlQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZzsgVmljdG9yIENhcnJlcmFzIDx2aWNhamlsYXVAZ21haWwuY29tPg0KPiBT
dWJqZWN0OiBSZTogW1BBVENIXSBkcm0vaTkxNS9kcDogRG9uJ3QgcmVjaGVjayB0aGUgZURQIGxp
bmsgc3RhdGUgYWZ0ZXIgYSBwYXNzaW5nIGxpbmsgdHJhaW5pbmcNCj4gDQo+IE9uIFR1ZSwgTm92
IDEwLCAyMDI2IGF0IDEwOjE3OjEzQU0gKzAwMDAsIE1pa2EgS2Fob2xhIHdyb3RlOg0KPiA+IE9u
IGVEUCwgYSBsaW5rIHJldHJhaW4gcG93ZXIgY3ljbGVzIHRoZSBwYW5lbC4gSWYgdGhlIHBhbmVs
IHJlcG9ydHMgYQ0KPiA+IHRyYW5zaWVudCBsaW5rIGVycm9yIGFmdGVyIHBvd2VyLW9uLCB0aGUg
bGluayBzdGF0ZSByZWNoZWNrIGFmdGVyIGENCj4gPiBwYXNzaW5nIGxpbmsgdHJhaW5pbmcgZW5k
cyB1cCBpbiBhIHJldHJhaW4gbG9vcC4gU2tpcCB0aGlzIHJlY2hlY2sgb24NCj4gPiBlRFAuDQo+
ID4NCj4gPiBDbG9zZXM6IGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9kcm0vaTkxNS9r
ZXJuZWwvLS93b3JrX2l0ZW1zLzE3NzM3DQo+ID4gVGVzdGVkLWJ5OiBWaWN0b3IgQ2FycmVyYXMg
PHZpY2FqaWxhdUBnbWFpbC5jb20+DQo+ID4gU2lnbmVkLW9mZi1ieTogTWlrYSBLYWhvbGEgPG1p
a2Eua2Fob2xhQGludGVsLmNvbT4NCj4gPiAtLS0NCj4gPiAgLi4uL2RybS9pOTE1L2Rpc3BsYXkv
aW50ZWxfZHBfbGlua190cmFpbmluZy5jIHwgMTkgKysrKysrKysrKysrKysrLS0tLQ0KPiA+ICAx
IGZpbGUgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkNCj4gPg0KPiA+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwX2xpbmtf
dHJhaW5pbmcuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHBfbGlua190
cmFpbmluZy5jDQo+ID4gaW5kZXggYWMxYWZmNmVkZjA1Li4zNWJmMjlmN2I5OTYgMTAwNjQ0DQo+
ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kcF9saW5rX3RyYWlu
aW5nLmMNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwX2xp
bmtfdHJhaW5pbmcuYw0KPiA+IEBAIC0xODAwLDEyICsxODAwLDIzIEBAIHZvaWQgaW50ZWxfZHBf
c3RvcF9saW5rX3RyYWluKHN0cnVjdCBpbnRlbF9kcCAqaW50ZWxfZHAsDQo+ID4NCj4gPiAgCWlu
dGVsX2hwZF91bmJsb2NrKGVuY29kZXIpOw0KPiA+DQo+ID4gLQlpZiAoIWRpc3BsYXktPmhvdHBs
dWcuaWdub3JlX2xvbmdfaHBkICYmDQo+ID4gLQkgICAgbGlua19yZWNvdmVyeV9hdXRvcmV0cmFp
bl9hbGxvd2VkKGxpbmtfdHJhaW5pbmcpKSB7DQo+ID4gLQkJaW50IGRlbGF5X21zID0gbGlua19y
ZWNvdmVyeV9hdXRvcmV0cmFpbl9wZW5kaW5nKGxpbmtfdHJhaW5pbmcpID8gMCA6IDIwMDA7DQo+
ID4gKwlpZiAoZGlzcGxheS0+aG90cGx1Zy5pZ25vcmVfbG9uZ19ocGQgfHwNCj4gPiArCSAgICAh
bGlua19yZWNvdmVyeV9hdXRvcmV0cmFpbl9hbGxvd2VkKGxpbmtfdHJhaW5pbmcpKQ0KPiA+ICsJ
CXJldHVybjsNCj4gPg0KPiA+IC0JCWludGVsX2VuY29kZXJfbGlua19jaGVja19xdWV1ZV93b3Jr
KGVuY29kZXIsIGRlbGF5X21zKTsNCj4gPiArCWlmIChsaW5rX3JlY292ZXJ5X2F1dG9yZXRyYWlu
X3BlbmRpbmcobGlua190cmFpbmluZykpIHsNCj4gPiArCQlpbnRlbF9lbmNvZGVyX2xpbmtfY2hl
Y2tfcXVldWVfd29yayhlbmNvZGVyLCAwKTsNCj4gPiArCQlyZXR1cm47DQo+ID4gIAl9DQo+ID4g
Kw0KPiA+ICsJLyoNCj4gPiArCSAqIEFuIGVEUCByZXRyYWluIHBvd2VyIGN5Y2xlcyB0aGUgcGFu
ZWwsIHdoaWNoIGNhbiByZXRyaWdnZXINCj4gPiArCSAqIGEgdHJhbnNpZW50IGxpbmsgZXJyb3Ig
YWZ0ZXIgcG93ZXItb24sIGxlYWRpbmcgdG8gYSByZXRyYWluIGxvb3AuDQo+ID4gKwkgKi8NCj4g
DQo+IElzIGl0IGEgdHJhbnNpZW50IGVycm9yPyBJZS4gZG9lcyB0aGUgaW50ZXJsYW5lIGFsaWdu
IGJpdCBwaW5nLXBvbmdpbmcNCj4gcmFuZG9tbHkgb3IgZG9lcyBpdCBhbHdheXMgKGFzIGluIGV2
ZXJ5IGxpbmsgcmF0ZSBhbmQgbGFuZSBjb3VudA0KPiB0aGF0IGlzIHBvc3NpYmxlKSBzdGF5IGNv
bXBsZXRlbHkgb2ZmIGFmdGVyIGxpbmsgdHJhaW5pbmc/DQoNClRoaXMgd2FzIG5hdGl2ZSBwYW5l
bCB3aXRoIERPV05TVFJFQVBPUlRfUFJFU0VOVD0wDQoNCltkcm06ZHJtX2RwX3JlYWRfZHBjZF9j
YXBzIFtkcm1fZGlzcGxheV9oZWxwZXJdXSBBVVggQS9EREkgQS9QSFkgQTogRFBDRDogMTQgMWUg
NDQgNDEgMDAgMDAgMDEgYzAgMDIgMDAgMDIgMDAgMDAgMGIgODANCg0KVGhlIGludGVybGFuZSBh
bGlnbiBiaXQgSSBiZWxpZXZlIGlzIG5vdCBhbHdheXMgb2ZmLiBUaGUgcmVwb3J0ZXIgbWVudGlv
bmVkIHRoYXQgdGhlIGVEUCBrZWVwcyByZXRyYWluaW5nIHRoZSBsaW5rIGFuZCBnZXRzIHN0dWNr
IGluIHRoYXQgbG9vcC4gRm9yIGhpbSB0aGlzIHBhdGNoIGZpeGVzIHRoZSBpc3N1ZSBpZiB3ZSBh
cmUgaGFwcHkgd2l0aCB0aGUgZmlyc3QgTFQuDQoNCj4gDQo+IFdlIGtub3cgdGhhdCBvbiB0aG9z
ZSBjcmFwcHkgQ0g3NTExIGJyaWRnZXMgdGhlIGJpdCBvbmx5IHdvcmtzIGR1cmluZw0KPiBsaW5r
IHRyYWluaW5nLCBhbmQgdGhlbiBqdXN0IHBlcm1hbmVudGx5IHR1cm5zIG9mZiB3aGVuIGxpbmsg
dHJhaW5pbmcNCj4gZW5kcy4gSUlSQyBvbiB0aG9zZSB0aGUgYml0IGRpc2FwcGVhcnMgZXhhY3Rs
eSB3aGVuIHdlIHN3aXRjaCB0aGUNCj4gdHJhaW5pbmcgcGF0dGVybiBvZmYuDQo+IA0KPiA+ICsJ
aWYgKGludGVsX2RwX2lzX2VkcChpbnRlbF9kcCkpDQo+ID4gKwkJcmV0dXJuOw0KPiA+ICsNCj4g
PiArCWludGVsX2VuY29kZXJfbGlua19jaGVja19xdWV1ZV93b3JrKGVuY29kZXIsIDIwMDApOw0K
PiA+ICB9DQo+ID4NCj4gPiAgc3RhdGljIGJvb2wNCj4gPiAtLQ0KPiA+IDIuNDMuMA0KPiANCj4g
LS0NCj4gVmlsbGUgU3lyasOkbMOkDQo+IEludGVsDQo=
