Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58EF8606A31B
	for <intel-xe@archiver.kernel.org>; Wed,  4 Nov 2026 08:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=L2Mt7Rw3
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 234AD10E85D;
	Wed,  4 Nov 2026 08:07:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D994210E578;
 Wed,  4 Nov 2026 08:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793779647; x=1825315647;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=hKx4+l0IQznHerFEyz3cYEaAZcOP5cGFNpWD24JaxI4=;
 b=L2Mt7Rw3VJ6/JJyIjZLpS2wSsf62g8jxnrhO8TEntONLvcyb9e9ZtEIG
 4AYu79qVbal5jpfq48/ZEE/64wca4e9DB7B1gJWV9+1gSIOfkM45GMfPN
 k1PljvQiuboeF552jKGzbecUQmxgqRwGPSUxI7HT1RxIRANlz/+zrqQdk
 TeuA349Amo+FHMPCdYzZT0xT+pE+ajOrN1GxUV7GPLNqhLg1YbNkD5yAj
 WhTNygM+9nhJ+ZcLudb8iVtKShaS3djNQYep1LqpyV4+SbZP8yUnOlflu
 upbKmpSIFdfCp7j97Nx+EhJLvbA8OymqpRAVOLA30KV9CBdTWD5orHy5j A==;
X-CSE-ConnectionGUID: 35EAFUqeTrmXRAkGjp6EIQ==
X-CSE-MsgGUID: 5tuGACLDRuuPrteTODYRog==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2619049"
X-IronPort-AV: E=Sophos;i="6.27,194,1787036400"; 
   d="scan'208";a="2619049"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2026 00:07:07 -0800
X-CSE-ConnectionGUID: JLUD/2yrSSiYgvI68Cg6eA==
X-CSE-MsgGUID: gljwEafuSaa9eoOfX8JvDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,194,1787036400"; 
   d="scan'208";a="8449681"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa012.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2026 00:05:37 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 4 Nov 2026 00:05:36 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 4 Nov 2026 00:05:36 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.71) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 4 Nov 2026 00:05:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PAQFS1soCO4I7Q6hgXniduCpePfDJwmxbK+/72GVn0Qr0sY9zXXoHBniOytGb9JpUvb5pzM52bbTvaS3Yh8iIIflosYaVbNX4izybXjTvgoCt+Jg6cCMzpWW5xzSvmWl+BTI5yyUT6yVY2yZy4aqfMxpvf5eMmINkzxD+EOn7yUYjaRujRtFk36Bvqc64NSVxopQjaOwoZi7D0yzERbFfj2v0AphtXI84ewoBYZxIWPcLWiBq3soVZBJohZD8kBSZauO02VGaaOd2k+Lywhd0fbRFd0dzfLatYkg3SEY64P+SJ73VcwPX/YzAOnQZ98KqPleyIfr92LHc/zwvYdJpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hKx4+l0IQznHerFEyz3cYEaAZcOP5cGFNpWD24JaxI4=;
 b=um9foURtErU0wtutpbI2RC+E+l9FGIdImly7d53U1wZsUXJFJQHqYMIUPdNrLIFU8nRlHaGCtvzm8Db5a9Jfx7Gvfd2HyQ08GBm0yAeqiOXY2W69ihq3griTRmnQIeN+Ok8vQgIlyjXK8N3z/QeNpPQZ7ZjFkftZfgsqIGTcf4o0EoVkEMV5iss36IhvY6WJJ2LPo/8FZ5RSzFKrHEhAPiIfDejIA4LxYdFek3fpPx8uOzGsrJDY5rAHtja/QOsp047zoPQ07vqJtHyZDy24rcqJlUY3f5NADfp3hsYQ2oBGqdwT8XVRu4o0eY8s6vK4ZbS3rG0i+/2oDd+eOTrSpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from LV2PR11MB6024.namprd11.prod.outlook.com (2603:10b6:408:17a::16)
 by SJ0PR11MB5102.namprd11.prod.outlook.com (2603:10b6:a03:2ac::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Wed, 4 Nov 2026
 08:05:09 +0000
Received: from LV2PR11MB6024.namprd11.prod.outlook.com
 ([fe80::38ad:3190:bbb2:412b]) by LV2PR11MB6024.namprd11.prod.outlook.com
 ([fe80::38ad:3190:bbb2:412b%6]) with mapi id 15.21.0569.011; Wed, 4 Nov 2026
 08:05:08 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Kahola, Mika" <mika.kahola@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/i915/display: Run the selective fetch update after
 the crtc checks
Thread-Topic: [PATCH] drm/i915/display: Run the selective fetch update after
 the crtc checks
Thread-Index: AQHdaqEsgHqePyMBUku+O18SOAS0DLcdkSUA
Date: Wed, 4 Nov 2026 08:05:08 +0000
Message-ID: <6a8afe90ffe405b015ce2ac0747b842b917ca466.camel@intel.com>
References: <20261102080705.2027571-1-mika.kahola@intel.com>
In-Reply-To: <20261102080705.2027571-1-mika.kahola@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR11MB6024:EE_|SJ0PR11MB5102:EE_
x-ms-office365-filtering-correlation-id: 7399b425-8ec7-4bea-218a-08df3a4a57e9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|23010399003|376014|1800799024|10067099003|18002099003|22082099003|38070700021|56012099006|11063799006|5023799004|261102123227099003|261026140227099003|261028144727099003|261021123027099003|261021121427099003|261009223027099003|261022105027099003;
x-microsoft-antispam-message-info: dlsyZTc7TjYujBsTjCVPm6+MDXLgvVQP97QudBdA9Uf70miTjc3+p+Er0cNbveqBE9ar6oFRO0fdX9OPzoThfLeemC1hP4y181+RA8B6K9qA2zF+DQhSzISh3Nn7jgl2EtPxlN9auMINk/s7nWsThkP2r9MwPCI6qze3QJHcgbyBowzd793alh/0v4yC0AEuECXDY4LyuWdY//psjdsTWKwP64QBWcAbSEKOaFZdT0epOyz9LUAk93MhixwKkimLmsejlQCkOV0z67FmICRq3b1t3h5BfH3SGBmhap/TazIOm2PDrRDclbNaQ9DXt6cRB/vSTKEVnvEk2mq8I1hnwpD1mf/BWJfOMTLFEXG1sKotv44Tve7pp1FLBB48sPylIIG9m7AeyfQ7YrkvnAZkkGkgMdRJhH39MmliFlht6AgnEfx30dm1SKxH1ndiNmVsNdLhHlLaw2WIfQcDShrPkGeYVDx64Vis74twNAtX2wHLk+nYT2WpwUkrw9EF7jh7QsjWf9ocOof7YVJauCRVA2RrjBXlZa8rehouvH3UY+GJJ2owuG+J4aS+IhKyRFW1VeAcO+YAvaYh1Iu2Ic5tN8VUYj6J9VQWx71OaF4+FYn+Z3YVlzLh+hkpllW2P/A89QZxI9TyvlqiD/Tk2hi+c5G2JrlRFSlcrMx2EIZLHI5DGhwGxw1ziWGVrqd0k7/oXtvcxdGab74B2YSrFPgqscVYSfXvdbd1ve9waCMV4mk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR11MB6024.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(10067099003)(18002099003)(22082099003)(38070700021)(56012099006)(11063799006)(5023799004)(261102123227099003)(261026140227099003)(261028144727099003)(261021123027099003)(261021121427099003)(261009223027099003)(261022105027099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U2dEQ2Y1c3lYbGdFRkM4QnBNRjVtTG9DSGlMTXljRm5JVXU2ZUtMS25QOEVj?=
 =?utf-8?B?L3VTcElWQ1dyMGJ2ZHhqSGtJQUdYQlI0SVRCdU1QTWRIYmF6bDM1YjIyNFU2?=
 =?utf-8?B?cTBFL3JEeDY3eGZ1Uk5OWjZsK3E1V01IdXd6NVdraGtwWDJpbDFqSDJHM2FN?=
 =?utf-8?B?NVlxcFVGU2YrclFSTTlmZWg3YkhkZ0U0S1kzZGNWbjBkcnFrd295OGxOb2d1?=
 =?utf-8?B?OWRiWE0yMjlYRTJUb1hWaWV6Ky9uQ2daYmNrc1M4NVZHSUNJdTZFR3ZRV0Y1?=
 =?utf-8?B?WnFwUExTR3B1SU9VcXdjR21Od0ZTS2NnN2hrZ05FdW9KVkF0YzBsTjNReXBS?=
 =?utf-8?B?anRGQWlOeW04elZlUHh4WlJuQlZJdXIxWGtlWGlmZkpEbENHMVVYVVBlL0dm?=
 =?utf-8?B?WGVodjlwN0dXaU4rWVRXWDk2K0ZpZnQ1dENkaXRJZ0hoYVV3citLRnZJR1VU?=
 =?utf-8?B?YWhoOW9OYWNOcDFyUEdwWmthdDdxOUlyU2g4TjVqb2pPVHJST1pHR1U3Sms4?=
 =?utf-8?B?WXhOMzNDMDlXc01EY0E4d3FZNDI4UFFOTUhhcGpSNnpBUlZkdEU4OWJmaEQz?=
 =?utf-8?B?ZGp6WGtJNThSR0dSemZCdzRnOGFxbWRHeXlHMGRwL1ZPUytxWGVtNTNkNnVl?=
 =?utf-8?B?MlZwbHZYQWI4OWErdExLdGdNaWZzWmVpdHJYaEYvY0ZpcVozNlhmY0IrWnF4?=
 =?utf-8?B?MlBSaE5TOGdUNCtncnJCUU5FQnRxUVB5dHdEeHVoZjdoZnhRUlJKaUZZNWV4?=
 =?utf-8?B?WG8xRi9HNUJsc01ObUVISmZ1cU1RYnRNWG0wZk01d0lWcmRVSHVvemZOTHVK?=
 =?utf-8?B?b0phVVd3dUZwTXNHaDIyQkkzWWNXbmE2d0c4Z2tMK0dqVzRQZmdIKzNLT09J?=
 =?utf-8?B?WEM1R3lrZS9ERWhFTzB4anFNN0t3b2VsZ1VzaUtSR09IMFpFbTdqME9BZWd5?=
 =?utf-8?B?K1NxRVdqdmNCWG9tYnZsTXVQOC9XdFIzdHQzS2M0bTRBd1VzN1dieFpsb0Vz?=
 =?utf-8?B?RWQybDF5RDZZWnJ1aTRTL2tidUdIWEMzODJQY25xQ0lhNS9rTS9HRWo0akg4?=
 =?utf-8?B?aGwweFVoN2VrYmlUZUpjTVRiQnQzMGQ0anIrcjNLV1Nyc0IzQlp0U3dFYjRL?=
 =?utf-8?B?S2R5RCt3Ym9oMFVJMVRuaGJEdmNLK0JJSTVYd3A1OWhpNzBScElESThjSGhv?=
 =?utf-8?B?MnZPUHlMOS9WY0tWZjFpdWkwWjNNYmRiWUwrMndLUTVHSWlwQ2NkL0xrSnFi?=
 =?utf-8?B?WjhSZ3B4T0xEWjV5bmhDWjYyV2FrVXI1NVZWRU5lM3IzbnpwWWJEbFErYkdS?=
 =?utf-8?B?bnlaWjcvekU3djJUT3lFUFFpS3RBN3IyalNReEZiejA2RnduRTFxTGgveno4?=
 =?utf-8?B?TEZCb1RteTJpSmI3cTBKd2tUeHJZc0UrM2txc1J2YXVBWWx2c3g2NUxvcElG?=
 =?utf-8?B?VDVZU1JyQ1g1Yy8rRjlwMHhzODJsS3grdGoyeUJvYmVQVmt5R3FmM2ZPejZs?=
 =?utf-8?B?NG44MUNDb1FsYTBOdUZSU3R0eTV0dmt4TEVORlhJTE9kNk15ZmtFVjB0MDhr?=
 =?utf-8?B?UUNRUWtYVmptalcwNVdENmxtVXo4YlFYakxtR2lmNmI1RisybzZmOTIyTkRX?=
 =?utf-8?B?VzV4MTJlQk5JUUkzR1hIUm5keHBhZkxmM1JiSUZnbUJnbnpPZ0J2MWNaT2tO?=
 =?utf-8?B?ZU50YjVkQlp2NWJ1WE05NXFOM1N4RVdVZi9QN3ZPOTJwcjhPZkdWcnZ4Zzgr?=
 =?utf-8?B?U3hhODVrMTBmSXlKc2EwelFiZXV2dDgvaFFZd1JaNVovYzM0WGk2T2dCSkJv?=
 =?utf-8?B?bHViNnBxZSt2ekJwWFJleUxDWCs5b21RdGx2TEhlWE9zZHpVQWxXdlVPQytN?=
 =?utf-8?B?eGNaYWc2b0FHaG9rcnBLNzZxZ0QwSlltYXNkaGszV1JhYVowQzludjhYTncw?=
 =?utf-8?B?ajY3VzFORTBaeGIxdnQzSmZTeXVHWS9LdU1SK1lFTy95TXNia3NPdGpkNldp?=
 =?utf-8?B?MVd2Y29GVUVpeFhBTkNualh2YnRaTy9uS3VzOTBOZDVTWTNxTXk0SldGVitX?=
 =?utf-8?B?aXM5Z0V1U3dZb3c0ZDBoQ0lzYkMwT3JCT3pmOUM0NGwxK1JPeVRZOUlmdlhC?=
 =?utf-8?B?azNZUEtDWmZqSmVlam95bENUOVJZbGtqUnVGT0Jnd3p0MlpFVGQxNEJ6Smdx?=
 =?utf-8?B?cEoxc0pva1BLZ2doWXhrTjJVdHhQSEVpak9DZlB2NkpzZFlRVU9kc1hSSHR1?=
 =?utf-8?B?WnVxZ1dDSUVTYkFYWjNCczYvZ1YwdlZFNk1LM2hNdHNyRlQ0M0NSL1hZbGVu?=
 =?utf-8?B?NnFxazk5cGZDUFJGN2J2N0pGdm80b0dPd1JZYnFUNFU5eFB4Wjh2cm9vSmc2?=
 =?utf-8?Q?d8Z9RFTCR/4n2FsQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0F3B47D42199474EB39CB576EF79EA9B@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: l+iVM846UfpXJBWiDINwRzNAufWKniKoDN2GOyUSScwEpIaBy1+PRVFmF6FC/GbFlRVjg5HUGlm9eVibWu8Wvh/byWzcR+fBlTBRUiIXyWi0IRV7YlaxxUEGtbH5kE+Em/eCFOyYTsqOntXN/X5gM9mZmvS1zbUEjnjaz7QdQf7GiIKEvmBDWA48rIbT4UzVBYdV+n4fR+Yw2Ut62665Yr2yyjFCNiJDXEN8qLoFSeCT6PevQdKoTQDWCrnYVZaaUETzgk0j374gOQ9x4cbaMj8ARlBrZ7yjAIra1pUc1AIeUqgP1AVzQ/FmFsVaMsJzcdCoRM43REO1HZSy0VHbwQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR11MB6024.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7399b425-8ec7-4bea-218a-08df3a4a57e9
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Nov 2026 08:05:08.6688 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2ml9LDmmAh8SyYAquGkfMWE2zceVmpVxbu3ccnP//zqyC/IrMd2sbRUHDiwPGxA+ZFYlu2eT68ad43h2ymsuCQMnUMFQJSS4qmRSEAcpb1g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5102
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

T24gTW9uLCAyMDI2LTExLTAyIGF0IDA4OjA3ICswMDAwLCBNaWthIEthaG9sYSB3cm90ZToNCj4g
aW50ZWxfcHNyMl9zZWxfZmV0Y2hfdXBkYXRlKCkgY29tcHV0ZXMgdGhlIHNlbGVjdGl2ZSBmZXRj
aCBhcmVhIG9mDQo+IGFsbA0KPiB0aGUgam9pbmVkIHBpcGVzIGZyb20gdGhlIGpvaW5lciBwcmlt
YXJ5LCBidXQgc3RpbGwgcnVucyBmcm9tDQo+IGludGVsX2NydGNfYXRvbWljX2NoZWNrKCkuIFRo
ZSBzY2FsZXIgaWRzIGl0IGNoZWNrcyBhcmUgb25seSBhc3NpZ25lZA0KPiB3aGlsZSB0aGUgb3du
aW5nIHBpcGUgaXMgYmVpbmcgY2hlY2tlZCwgc28gdGhlIHByaW1hcnksIGNoZWNrZWQNCj4gZmly
c3QsDQo+IHNlZXMgdGhlIHNlY29uZGFyeSBpZHMgb2YgdGhlIHByZXZpb3VzIGNvbW1pdC4gQSBw
bGFuZSB0aGF0IHN0YXJ0cw0KPiBiZWluZyBzY2FsZWQgb24gdGhlIHNlY29uZGFyeSB0aGVuIGxv
b2tzIHVuc2NhbGVkIGFuZCB0aGUgZnVsbCB1cGRhdGUNCj4gZmFsbGJhY2sgaXMgc2tpcHBlZC4N
Cj4gDQo+IFJ1biBpdCBpbiBpdHMgb3duIGxvb3AgYXQgdGhlIGVuZCBvZiBpbnRlbF9hdG9taWNf
Y2hlY2tfY3J0Y3MoKSwgb25jZQ0KPiBldmVyeSBjcnRjIGhhcyBiZWVuIGNoZWNrZWQuIE5vdGhp
bmcgY29uc3VtZXMgdGhlIHNlbGVjdGl2ZSBmZXRjaA0KPiByZXN1bHRzIGJlZm9yZSB0aGUgcGxh
bmVzIGFyZSBwcm9ncmFtbWVkLg0KPiANCj4gRml4ZXM6IGRkMDM4YThkNDQwYSAoImRybS9pOTE1
L3BzcjogTWVyZ2UgdGhlIHNlbGVjdGl2ZSBmZXRjaCBhcmVhDQo+IGFjcm9zcyBqb2luZWQgcGlw
ZXMiKQ0KPiBTaWduZWQtb2ZmLWJ5OiBNaWthIEthaG9sYSA8bWlrYS5rYWhvbGFAaW50ZWwuY29t
Pg0KDQpSZXZpZXdlZC1ieTogSm91bmkgSMO2Z2FuZGVyIDxqb3VuaS5ob2dhbmRlckBpbnRlbC5j
b20+DQoNCj4gLS0tDQo+IMKgZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kaXNw
bGF5LmMgfCAxNyArKysrKysrKysrKysrLS0tLQ0KPiDCoDEgZmlsZSBjaGFuZ2VkLCAxMyBpbnNl
cnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxheS5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL2k5
MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5LmMNCj4gaW5kZXggNWU0MDQ4N2U5YWIwLi4yZWFmY2Ix
NDUwYWEgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxf
ZGlzcGxheS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlz
cGxheS5jDQo+IEBAIC00NTUwLDEwICs0NTUwLDYgQEAgc3RhdGljIGludCBpbnRlbF9jcnRjX2F0
b21pY19jaGVjayhzdHJ1Y3QNCj4gaW50ZWxfYXRvbWljX3N0YXRlICpzdGF0ZSwNCj4gwqANCj4g
wqAJfQ0KPiDCoA0KPiAtCXJldCA9IGludGVsX3BzcjJfc2VsX2ZldGNoX3VwZGF0ZShzdGF0ZSwg
Y3J0Yyk7DQo+IC0JaWYgKHJldCkNCj4gLQkJcmV0dXJuIHJldDsNCj4gLQ0KPiDCoAlyZXR1cm4g
MDsNCj4gwqB9DQo+IMKgDQo+IEBAIC02MDk2LDYgKzYwOTIsMTkgQEAgc3RhdGljIGludCBpbnRl
bF9hdG9taWNfY2hlY2tfY3J0Y3Moc3RydWN0DQo+IGludGVsX2F0b21pY19zdGF0ZSAqc3RhdGUp
DQo+IMKgCQl9DQo+IMKgCX0NCj4gwqANCj4gKwkvKiBTZWxlY3RpdmUgZmV0Y2ggbmVlZHMgdGhl
IHNjYWxlciBzdGF0ZSBvZiBhbGwgdGhlIGpvaW5lZA0KPiBwaXBlcy4gKi8NCj4gKwlmb3JfZWFj
aF9uZXdfaW50ZWxfY3J0Y19pbl9zdGF0ZShzdGF0ZSwgY3J0YywgY3J0Y19zdGF0ZSkgew0KPiAr
CQlpbnQgcmV0Ow0KPiArDQo+ICsJCXJldCA9IGludGVsX3BzcjJfc2VsX2ZldGNoX3VwZGF0ZShz
dGF0ZSwgY3J0Yyk7DQo+ICsJCWlmIChyZXQpIHsNCj4gKwkJCWRybV9kYmdfYXRvbWljKGRpc3Bs
YXktPmRybSwNCj4gKwkJCQnCoMKgwqDCoMKgwqAgIltDUlRDOiVkOiVzXSBzZWxlY3RpdmUgZmV0
Y2gNCj4gY2hlY2sgZmFpbGVkXG4iLA0KPiArCQkJCcKgwqDCoMKgwqDCoCBjcnRjLT5iYXNlLmJh
c2UuaWQsIGNydGMtDQo+ID5iYXNlLm5hbWUpOw0KPiArCQkJcmV0dXJuIHJldDsNCj4gKwkJfQ0K
PiArCX0NCj4gKw0KPiDCoAlyZXR1cm4gMDsNCj4gwqB9DQo+IMKgDQo=
