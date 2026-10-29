Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A45AE606A31A
	for <intel-xe@archiver.kernel.org>; Thu, 29 Oct 2026 08:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=k/XEt8pf
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A9C0112080;
	Thu, 29 Oct 2026 08:13:13 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1BB2112080;
 Thu, 29 Oct 2026 08:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793261587; x=1824797587;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=zVfKXQc4DmcHaLSWVn0LTtDCHqrbosN1BlPgelU4SrM=;
 b=k/XEt8pfjLDDp6bCGtZM4Kf5XY3Gp2Ft1RvDC5TK339+eihSRifDG1Xr
 91YtcOdNNjD2kvUdfuTVFeaPWAHGEzPWEldy30IzQzn9vRx4LDrkizVqE
 Y/vaejEgkKBPn1QP9+oLVu7pL65K5oewrlTJj6YU2Fx3KfsswCh4nB7bu
 cgYZCxVp0IB+TQxgFtevCejQ2wWxyBjmfJIKfjimh4TIkC37p4toCCLRz
 e7tZeX8oBB16IrGuUZ7XdsVP2wF85yvnEPP3Slq3pTkK+a6F2l04iv/Eo
 AEknhPG20qH8YxBrZClo4no/Z/L/mnTe5SmWW5/tD40w9JXqDoqhijasB Q==;
X-CSE-ConnectionGUID: WSawRB4fQM+ptmyKOmTI3g==
X-CSE-MsgGUID: x3vqdwMaRRqV7B1ZvgX1oQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1880553"
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="1880553"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2026 01:13:07 -0700
X-CSE-ConnectionGUID: /5e+fz3tR2yvZyJWYrJ9hQ==
X-CSE-MsgGUID: /YDgHKDpTXqrygWoo908Qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="5602329"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2026 01:13:06 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 29 Oct 2026 01:13:05 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 29 Oct 2026 01:13:05 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.36) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 29 Oct 2026 01:13:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s6vWitZxPpgW5CM2EHnbn/hNw1NtTiZLAMpH+zKBle1z0Crs/s8WdlZfbI7x1PchUsZScUJKhxUPW4gceoDF1HgPGASGNpLZJF+So6pzRLjjh1JwY/AXWCugRksvz9mQucTnV7CIHl8Ju8b0LGvp/4Z0zne/tb3w2FtN50tdmAnch6e6wI+jc+a19Mmi9J2kuo9ty0yxCqtnzLnTj4ZSsQwNrdZrzYknsfLjKmB5IAEQd4ZqeS4rOsW0EMuLIHT4G64I/bVe2j15Z8UCmoSDFVfdtZcZgFBKiuXj6IGwlWuijnG+uN7En1lwUYnFlyaPfTFD8bcMGgs8KVwTM3bxMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zVfKXQc4DmcHaLSWVn0LTtDCHqrbosN1BlPgelU4SrM=;
 b=pxtmLkb5GfDFBbattOEntj6Q4bzt4kaWHwZTiA+xR+n01ClfmmU/OuRo/auUvZatwjPW8p69ckyXVwv7K663dIszkfh8rbA8Mi9riTtspBB0Y3MdMXpE75y98pY4ztIYcCLZc5+gc4B4DRtcyMWJ+qYlQ/I49rJZfD22CfR4xhhGxUL+7nPAczabSvu141XLao/1bc+gQHFjF2DKEG5K2Vml/dqWaW5OeUuuNf8ttWMXsRjGBV2BVdO84B2QIvtVokdUFHo0L6pixTkBOw5aEYOqPjMeK4FtjH9bFEoqb5LyzloqKoON+fSoMB3GpIToq71GwoQmlcPfFhyvMRFHnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::5b) by PH8PR11MB6657.namprd11.prod.outlook.com
 (2603:10b6:510:1c0::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Thu, 29 Oct
 2026 08:12:57 +0000
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::19f5:13eb:df52:68ff]) by DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::19f5:13eb:df52:68ff%8]) with mapi id 15.21.0546.021; Thu, 29 Oct 2026
 08:12:57 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Murthy, Arun R" <arun.r.murthy@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: Jani Nikula <jani.nikula@linux.intel.com>, "Borah, Chaitanya Kumar"
 <chaitanya.kumar.borah@intel.com>, "Shankar, Uma" <uma.shankar@intel.com>
Subject: RE: [PATCH v3 3/7] drm/i915/display: Add the DP symbol timing
 generator crtc state
Thread-Topic: [PATCH v3 3/7] drm/i915/display: Add the DP symbol timing
 generator crtc state
Thread-Index: AQHdZ3rsQuFOuHASoEeVYXiyfNZW4bcUK4gg
Date: Thu, 29 Oct 2026 08:12:57 +0000
Message-ID: <DS4PPFE901A304F53131F364FFA9AD963E5E36E2@DS4PPFE901A304F.namprd11.prod.outlook.com>
References: <20261029-vlk-64036-dp-symbol-tg-v3-0-69022424ef17@intel.com>
 <20261029-vlk-64036-dp-symbol-tg-v3-3-69022424ef17@intel.com>
In-Reply-To: <20261029-vlk-64036-dp-symbol-tg-v3-3-69022424ef17@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPFE901A304F:EE_|PH8PR11MB6657:EE_
x-ms-office365-filtering-correlation-id: a6ccb5a7-cbfb-4eb8-9491-08df359470de
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|38070700021|4143699003|56012099006|11063799006|261009223027099003|261026121527099003|261022075727099003|261021121427099003|10067099003|22082099003|18002099003|6133799003|3023799007;
x-microsoft-antispam-message-info: D34d1bz202m28BUQ784ORIhdoflVXsPyp8otx8EvJRois5mwH9w+o3lih8t7F8wmX7whU3SK1jvogUqAONbVxgVzTJ4LUL50OOlhNPIcYOaLKC8r511SPPiVlBVR5RFfG696DWpX5DHAu6c6cCOYHnSKGDbdq3W+94i73ZViKGQ62QvxywhDBVE5VDygcZj/zteGSOIe3Jf6VvmqJt80fhBWeZEupsIrmTu2KTAKU4L5w+Nw8kbkb+wIUFuLzIFtKC+es9DJEQAnxzDvG6y+glUu0WWISBlUh7nocPXBvnZAD04//AyO1L09qb0dtP7UF+PzebtxB/L65BYYgihAF2HkAqWtKQpQFmID21B+JHrB+3Pizyz4SE/+i1wlCQFeZ09g/72mZm03Iz+Mc74l1QLuFygIViJ1nYAbesOQgtl3xlSxq7RR4VOcEXgYw9qE5zwqB8biZktPijeSKJ1R/TgQAXYlIJYJrRfkLQN4GvjUk9S+4y7mh7LbxLuGXGKG2X5Y+EfJw9j6uVlpvRmajvW+umPGk3wAOGpd2N21FI+h/JCVGo47VIJiSS6PEnsfNV3DbxCIq+fblYx/eMgOvS2tRhBWl+1LQCuINaYbyLmkAlQHUJn8DEHfrL5/67/SJ2Sr4fCb02H8eNc91zfveOg+nMQsZjjJdHqa2a8bwUbJAQJdRJpIOmch6ewXXvnyKT87zGVxYWp/CmZSonMFC7FmYyVXDpAl88rrujotirc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPFE901A304F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(38070700021)(4143699003)(56012099006)(11063799006)(261009223027099003)(261026121527099003)(261022075727099003)(261021121427099003)(10067099003)(22082099003)(18002099003)(6133799003)(3023799007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZzZBaTIwckdybHJHSGJEUVlWT1J1bXlscWpkUkVublFpbnRFVndTdnZldGJo?=
 =?utf-8?B?cTFQVHVoR1NsUXBLLzJxQ2FIbmgxWEtrVkRDV2U4cTlVaVBHbzNvMmdHUW4r?=
 =?utf-8?B?NVRrUmJuanUvQkc5THFXbHBPaW9YSWdZemxFUE5lNGtEQXE4RWI5cjlvSWxL?=
 =?utf-8?B?d3dyVUV1VWVpVTBFZVEvZXUxbXRaWGdNZVBBUXpaNXo4a0EwNWNzZUVyeDBj?=
 =?utf-8?B?ejcwaXBJRk5FMlBXbmlNcGFLK1JKdG5CamlEL1M4OHRkK3BJRXdNNUE1UGpo?=
 =?utf-8?B?V3d5aW16cjAvQm1lQzNQaHFoMnR4REphb09BVnhZckJYdHV3MlZMQUJhdStZ?=
 =?utf-8?B?NVRmbUZhYTFSWGs0NTJ0MHZwY0xFU3NwV1pTb0dwV1dqeU94T1c4UkRocU42?=
 =?utf-8?B?Smd6Zlg2V3B2VEl6N3hwQlE1akU3eHR4WGFrVyt5R3RXQkhkSURhWUo0NXE1?=
 =?utf-8?B?aHViZzdyc1o3RXl6SEZVMWV6QTRGdTJxM2hjNDRkUjU0czluSU1rNHFpZ3dr?=
 =?utf-8?B?a0EzYTNVeXJLakFXbjl3VHdRWk1IZUpZYmhaOCtkcit0ekFQb1BYRnRkejlw?=
 =?utf-8?B?dG5kYngwVXA4RmZnZ3oyUTBIekxiWXI5dGJqQnhSWkNyUldpdjN5eDlRSWtz?=
 =?utf-8?B?MXkrWFpEdkwzekRkbGtqdUVxNDJQS2pZOTNqYW9iTTE0S0hMbDRrV05DcVND?=
 =?utf-8?B?UVJ6d1l5Nlo0RU9ZOG5oQlNiRVB5bzRyaWcwZGUyanhtWGNpb2E2OUNXWUlz?=
 =?utf-8?B?SzdnY1R0Q0s4dFdIYVV1YlZvZHBpTlhIZlVLMWhVL2lDL1JiTUxXT1NIY1g3?=
 =?utf-8?B?SnJ4WjA0eVE3TkEvTmVSSlVWdW9jSU8xR2h2NlF6WC8wV0cyMGVveVJCdzZF?=
 =?utf-8?B?bThLSUNZTjhnWHhFUW9lRGJpeDFzOVhxdWh1b0R6bDNlY3hnclhaZEhPSDFx?=
 =?utf-8?B?N1F3NFpjdmJlZ0xTSXByZVUrMXhQQlZDZi9pL1RPOElIREJuMzNrRDRTaWpy?=
 =?utf-8?B?YUlpb21MOW81bFNZNVN4WnpWUTFlV1hkUWlocHlpUHZGeTJFNzg1ZWhBblFm?=
 =?utf-8?B?SHdTY0F3NDFCZ0FJVVBTM3RKRFNqdFJVZklyVE9TZDcrNFB4UG40SEszWVRn?=
 =?utf-8?B?Q3BIeTZ5UStvd0laTyt1MmJ5UWJZTXkxQTZFekduRzMrUzhNZnVNbHhOdEVW?=
 =?utf-8?B?Y3g3L09waC9vbzNCZmpucVRNTDFydTl5MWhsODk0UFFpVVp3R0N0OGY2YWVF?=
 =?utf-8?B?QjkyN05OZkE4NEx1bXIvM1h5ZTdpUkpiUGVLUTN4Tk1KMEltdGRpQjJrb0NR?=
 =?utf-8?B?Qkpnb0NZTHA4dExNTFVoMDV6WjRDQ2E1VXI0OWQwTkFsSHJ3RGpBOXpZSDJB?=
 =?utf-8?B?S20ybzBnVkxiY2t3TmpGNlVldXJFZ2IxUzYrTHBmSjFneGxzWmoxK3piMWVp?=
 =?utf-8?B?MVp4NnpIaUZpZTU4cGdOdk9JdW1LQmttU2hxbHpOeDE0Vm5Ua3ZsTEl6eUhx?=
 =?utf-8?B?a2VlN1JTc0kvVWlFR25DY2RZYnRDVkJXMGtOSXJOY2tJMm5vWHhrZTBwY0Uv?=
 =?utf-8?B?N0VGeDV5YWhZM1V2NTJJb0NzemwreXdHK3U5UzlqaHo3YVJqOUlvTEFHWmVp?=
 =?utf-8?B?d242bU04YVZIOVlOT04zMURucnFkL2lnVmZWUkdrbmtEUzlPbDRlelhnVnhy?=
 =?utf-8?B?TkxHblZNK0Vtb1I0b2gyb0F1ZEc4bnJMVlRNSWVxSnB6ekg3QkZSQm9VdVk5?=
 =?utf-8?B?aldPU0t4L3VtRnVDeUJWbVdKL0dNTVJRUytTV0luWjBBdzJvcmQ3V3Zkd1ZZ?=
 =?utf-8?B?LzBVMEdJVWhVY1h2U3lNTkNVcVNqbzlDRURteFZ2SWpycjhSZE9EVjNNa0c0?=
 =?utf-8?B?dGh6K2V0YTVTOFRjeHAybklIVGpkZVphckdLeTRqUXBiZ3V4NlkxS3pnZWkw?=
 =?utf-8?B?Qmo1bDBmZkp6L3ZWTmEzdXhhUTBIT09xdGFheFZZZDgwWjJZOTkrMks2bmNz?=
 =?utf-8?B?Ulg3c1VSOW55OUtKTURUZHVLZGZVZnBZU003RWNYNWNTRHZYV1h1OE56dFZr?=
 =?utf-8?B?Z1gxRndUWDQ3STBFdFFCUTAxNFZtaFJhb1RDWGk4VWJYcHYxMVdUU2N2dFNR?=
 =?utf-8?B?WWNMZVYyWU1zbUw0Q0pGNzBGRzdobzBjdWYzQjhNMzI0dEd1emR6Q3o3Z3pI?=
 =?utf-8?B?RDk3Z2o3Tlk0QXFwV29rZmtQaDZOQWE1ZWF0OGU1MW80TmZMbmhBby84S1pX?=
 =?utf-8?B?bFpyRTFwTWhEZVlueXU2NHR5Z2pBamR5bnVOMUthYWI2SXpXbGFySS9idlor?=
 =?utf-8?B?bGFoSTBPRGQ4OTIyOWVTdU5VYlRtNFlyeFNEUEsvSWlEclZlQlgzQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: MybOaZ1DO/c5MrU93uns9AjsLhCaY7YfXsb75zqqFuc3FksCKhu25aPgEwXQrg59VeEru4YUQ72r9SvVtGPPLJ5YHBbUv9f0sdK6HkguM8M9V9KY5sU07CpaQ/rq3+I5QvWV8tBCflyVUwR6P0mcCmeV/WdYABCFjxGVvmNwBeBpWfF2/nQ02uybPB0SkB3UsOqiJw2w6ehpbsfUWWGhAJHjAVnEOOyznHEO9GhbaijQamr8uMnCJp7PrtSaqhD4GmI3F5ijR5gCEi/RWwVBiGW67opcbCY2VrXJkCB8bYUD0ZhOdc2i23N76Uv9zezRmA2daKJwcn/uVLxSTblPBg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFE901A304F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6ccb5a7-cbfb-4eb8-9491-08df359470de
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2026 08:12:57.4350 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AMYQL5Bt/jOQ77oXjdKoOagKHF8Pc1qv6ZvBb2FnRIchpa7Oqn4XrEwzU5OWaaFbyaawVnKp4F9Rfx70gVktfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6657
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

PiBTdWJqZWN0OiBbUEFUQ0ggdjMgMy83XSBkcm0vaTkxNS9kaXNwbGF5OiBBZGQgdGhlIERQIHN5
bWJvbCB0aW1pbmcgZ2VuZXJhdG9yDQo+IGNydGMgc3RhdGUNCj4gDQo+IEFkZCB0aGUgRFAgbGlu
ayBsYXllciAoTEwpIHN5bWJvbCBiYXNlZCB0aW1pbmcgZ2VuZXJhdG9yIHBhcmFtZXRlcnMgdG8g
dGhlIGNydGMNCj4gc3RhdGUuIER1bXAgdGhlbSBpbiB0aGUgY3J0YyBzdGF0ZSBkdW1wIGFuZCBj
b21wYXJlIHRoZW0gaW4gdGhlIHBpcGUgY29uZmlnDQo+IGNoZWNrZXIuDQo+IA0KPiBCc3BlYzog
Njg5MjINCj4gU2lnbmVkLW9mZi1ieTogQXJ1biBSIE11cnRoeSA8YXJ1bi5yLm11cnRoeUBpbnRl
bC5jb20+DQoNCkxHVE0sDQpSZXZpZXdlZC1ieTogU3VyYWogS2FuZHBhbCA8c3VyYWoua2FuZHBh
bEBpbnRlbC5jb20+DQoNCj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2lu
dGVsX2NydGNfc3RhdGVfZHVtcC5jIHwgMTEgKysrKysrKysrKysNCj4gIGRyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxheS5jICAgICAgICAgfCAxMSArKysrKysrKysrKw0K
PiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5X3R5cGVzLmggICB8
IDEzICsrKysrKysrKysrKysNCj4gIDMgZmlsZXMgY2hhbmdlZCwgMzUgaW5zZXJ0aW9ucygrKQ0K
PiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfY3J0
Y19zdGF0ZV9kdW1wLmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Ny
dGNfc3RhdGVfZHVtcC5jDQo+IGluZGV4DQo+IGM1MWIyMTIyMmRjNmU3YzBlNjYyMWI5MDNmYTBj
MDRjYjc1MDhiNjAuLjJlMTBjOWE1YmJhNjNiMDI2ZDFjZTANCj4gMmU0ZTE1ODBmYjVhZWVjYjAy
IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2NydGNf
c3RhdGVfZHVtcC5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxf
Y3J0Y19zdGF0ZV9kdW1wLmMNCj4gQEAgLTI2Miw2ICsyNjIsMTcgQEAgdm9pZCBpbnRlbF9jcnRj
X3N0YXRlX2R1bXAoY29uc3Qgc3RydWN0DQo+IGludGVsX2NydGNfc3RhdGUgKnBpcGVfY29uZmln
LA0KPiAgCQkJICAgcGlwZV9jb25maWctPmRpcC5wcHNfc2RwX3RsLA0KPiAgCQkJICAgcGlwZV9j
b25maWctPmRpcC52c2Nfc2RwX3RsLA0KPiAgCQkJICAgcGlwZV9jb25maWctPmRpcC52c2NfZXh0
X3NkcF90bCk7DQo+ICsNCj4gKwkJZHJtX3ByaW50ZigmcCwNCj4gKwkJCSAgICJkcCBzeW1ib2wg
dGc6ICVzLCBoYWN0aXZlOiAlZCwgaHRvdGFsOiAlZCwgY2h1bmsNCj4gc2l6ZTogJWQsIGRhdGEg
bTogMHglMDE2bGx4JTAxNmxseCwgZGF0YSBuOiAweCUwMTZsbHglMDE2bGx4XG4iLA0KPiArCQkJ
ICAgc3RyX2VuYWJsZWRfZGlzYWJsZWQocGlwZV9jb25maWctDQo+ID5kcF9zeW1ib2xfdGcuZW5h
YmxlKSwNCj4gKwkJCSAgIHBpcGVfY29uZmlnLT5kcF9zeW1ib2xfdGcuaGFjdGl2ZSwNCj4gKwkJ
CSAgIHBpcGVfY29uZmlnLT5kcF9zeW1ib2xfdGcuaHRvdGFsLA0KPiArCQkJICAgcGlwZV9jb25m
aWctPmRwX3N5bWJvbF90Zy5jaHVua19zaXplLA0KPiArCQkJICAgcGlwZV9jb25maWctPmRwX3N5
bWJvbF90Zy5kYXRhX21bMV0sDQo+ICsJCQkgICBwaXBlX2NvbmZpZy0+ZHBfc3ltYm9sX3RnLmRh
dGFfbVswXSwNCj4gKwkJCSAgIHBpcGVfY29uZmlnLT5kcF9zeW1ib2xfdGcuZGF0YV9uWzFdLA0K
PiArCQkJICAgcGlwZV9jb25maWctPmRwX3N5bWJvbF90Zy5kYXRhX25bMF0pOw0KPiAgCX0NCj4g
DQo+ICAJZHJtX3ByaW50ZigmcCwgImF1ZGlvOiAlaSwgaW5mb2ZyYW1lczogJWksIGluZm9mcmFt
ZXMgZW5hYmxlZDoNCj4gMHgleFxuIiwgZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1
L2Rpc3BsYXkvaW50ZWxfZGlzcGxheS5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxh
eS9pbnRlbF9kaXNwbGF5LmMNCj4gaW5kZXgNCj4gYWZlNzBlOWNlMzQ3MzliNjdlNGQ4Nzc1NGY5
YzM2MWZmNzdmMzdhNi4uN2NhZjViZWU4NzE4NzI5NjY3Mzc2YjQ4DQo+IDdiMDU4NGI0Nzg5MWYw
NWEgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlz
cGxheS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxh
eS5jDQo+IEBAIC01NTE1LDYgKzU1MTUsMTcgQEAgaW50ZWxfcGlwZV9jb25maWdfY29tcGFyZShj
b25zdCBzdHJ1Y3QNCj4gaW50ZWxfY3J0Y19zdGF0ZSAqY3VycmVudF9jb25maWcsDQo+IA0KPiAg
CVBJUEVfQ09ORl9DSEVDS19JKG1pbl9oYmxhbmspOw0KPiANCj4gKwlQSVBFX0NPTkZfQ0hFQ0tf
Qk9PTChkcF9zeW1ib2xfdGcuZW5hYmxlKTsNCj4gKwlpZiAocGlwZV9jb25maWctPmRwX3N5bWJv
bF90Zy5lbmFibGUpIHsNCj4gKwkJUElQRV9DT05GX0NIRUNLX0koZHBfc3ltYm9sX3RnLmhhY3Rp
dmUpOw0KPiArCQlQSVBFX0NPTkZfQ0hFQ0tfSShkcF9zeW1ib2xfdGcuaHRvdGFsKTsNCj4gKwkJ
UElQRV9DT05GX0NIRUNLX0koZHBfc3ltYm9sX3RnLmNodW5rX3NpemUpOw0KPiArCQlQSVBFX0NP
TkZfQ0hFQ0tfTExJKGRwX3N5bWJvbF90Zy5kYXRhX21bMF0pOw0KPiArCQlQSVBFX0NPTkZfQ0hF
Q0tfTExJKGRwX3N5bWJvbF90Zy5kYXRhX21bMV0pOw0KPiArCQlQSVBFX0NPTkZfQ0hFQ0tfTExJ
KGRwX3N5bWJvbF90Zy5kYXRhX25bMF0pOw0KPiArCQlQSVBFX0NPTkZfQ0hFQ0tfTExJKGRwX3N5
bWJvbF90Zy5kYXRhX25bMV0pOw0KPiArCX0NCj4gKw0KPiAgCWlmIChIQVNfRE9VQkxFX0JVRkZF
UkVEX01fTihkaXNwbGF5KSkgew0KPiAgCQlpZiAoIWZhc3RzZXQgfHwgIXBpcGVfY29uZmlnLT51
cGRhdGVfbV9uKQ0KPiAgCQkJUElQRV9DT05GX0NIRUNLX01fTihkcF9tX24pOw0KPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5X3R5cGVzLmgN
Cj4gYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXlfdHlwZXMuaA0K
PiBpbmRleA0KPiBkMDc0ODgzN2NlOTdjZTYyOTFiMzZhZGViMDAxNDY4NmY3ZDY5OWY5Li43M2Zj
NjEyNWE4NGEwN2EwMDJjYjcyMA0KPiAyZDgwNzgzM2M3NWRhMTMwYyAxMDA2NDQNCj4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5X3R5cGVzLmgNCj4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5X3R5cGVzLmgNCj4g
QEAgLTExOTYsNiArMTE5NiwxOSBAQCBzdHJ1Y3QgaW50ZWxfY3J0Y19zdGF0ZSB7DQo+ICAJaW50
IG1heF9waXBlX2JwcDsJLyogaW4gMSBicHAgdW5pdHMgKi8NCj4gIAlpbnQgcGlwZV9icHA7CQkv
KiBpbiAxIGJwcCB1bml0cyAqLw0KPiAgCWludCBtaW5faGJsYW5rOw0KPiArDQo+ICsJLyogRFAg
bGluayBsYXllciAoTEwpIHN5bWJvbCBiYXNlZCB0aW1pbmcgZ2VuZXJhdG9yLCA4Yi8xMGIgTVNU
IGFuZA0KPiAxMjhiLzEzMmIgU1NUL01TVCAqLw0KPiArCXN0cnVjdCBpbnRlbF9kcF9zeW1ib2xf
dGcgew0KPiArCQlib29sIGVuYWJsZTsNCj4gKwkJLyogaW4gTEwgc3ltYm9sIGN5Y2xlcywgYXMg
b3Bwb3NlZCB0byB0aGUgemVybyBiYXNlZCByZWdpc3Rlcg0KPiB2YWx1ZXMgKi8NCj4gKwkJdTE2
IGhhY3RpdmU7DQo+ICsJCXUxNiBodG90YWw7DQo+ICsJCXUxNiBjaHVua19zaXplOw0KPiArCQkv
KiAxMjggYml0IERhdGEgTS9OIGFzIHtsb3cgNjQgYml0cywgaGlnaCA2NCBiaXRzfSAqLw0KPiAr
CQl1NjQgZGF0YV9tWzJdOw0KPiArCQl1NjQgZGF0YV9uWzJdOw0KPiArCX0gZHBfc3ltYm9sX3Rn
Ow0KPiArDQo+ICAJc3RydWN0IGludGVsX2xpbmtfbV9uIGRwX21fbjsNCj4gDQo+ICAJLyogbTJf
bjIgZm9yIGVEUCBkb3duY2xvY2sgKi8NCj4gDQo+IC0tDQo+IDIuMjUuMQ0KDQo=
