Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42275606A31A
	for <intel-xe@archiver.kernel.org>; Thu, 29 Oct 2026 05:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=STrdASRY
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB4A010E380;
	Thu, 29 Oct 2026 05:04:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B74A310E380;
 Thu, 29 Oct 2026 05:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793250263; x=1824786263;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=5iGtGKwc7yvahLKJ0Pc0dFX4gKodmCJaypyruFmDmWA=;
 b=STrdASRYnsdPC4hP/3aMrNFVCKwRF58DjdQBfe+SaqN7bgLUQANuBqHq
 UFdNJH+CGfb8m1bownEHH5IT05oNGiZ30Hy4HFEMJdgFALTq+7fmzgY8w
 z5MfvDCiEyRWwe+UUFdwpY9zqR6q+tjDNPUbM68+O2xXX+BRa0eDqhU7L
 8h3ul1YU67vdVyUWTtCV7nKdJ+rlnjnspEfO4Hq/96nW05zKShypwF+Fz
 ADP49+qNsYFS5Ap2ryGXZBNJ/rpOKyOeF9UF5zTCqmkfJkOer1r8yyr9K
 40NYRTB6q6sL4o5k19tTZg8Yj+bYcT62bZj9zuxSJwy9zMDXmRsr+DxPM Q==;
X-CSE-ConnectionGUID: eSefhVg8Ra2MgViIJRHQng==
X-CSE-MsgGUID: NrQiA1SIROSRr4sBQNBdxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1976957"
X-IronPort-AV: E=Sophos;i="6.27,183,1787036400"; 
   d="scan'208";a="1976957"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 22:04:22 -0700
X-CSE-ConnectionGUID: tMnMqjBtShWlYoXDyuJ5ag==
X-CSE-MsgGUID: 8+SB9YY9Tb+vHBJEOgip6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,183,1787036400"; 
   d="scan'208";a="5377533"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 22:04:21 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 28 Oct 2026 22:04:20 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 28 Oct 2026 22:04:20 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.17) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 28 Oct 2026 22:04:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ziz1kb7Ws+6eMBB7qq3pPlwugTdfUczp7iN+SvPL0R8yWwgZjpYC6fUefcWg+Yhsgy6fbBQOcjkTFjE+D7u0GVLDlfkcZkD74++oythALOucs5ZOrLhe6lH8cvUbVeMz9r3TbN1wXDQIFM8eluEUguY3bMt6FBI8Sw6MAlLmscO2F0atmHs85MHUo15cM8RcIrkIscqI3JTDlcKS0z9ehHBIKLzvq2OxZ730viy39wOnp5dcUd4JNKT8MZA3DdAIY4FaJc1jqFzvXgGsusPSA8rlDTl69rnUHtzmQxi6wTHdgAOFpHnwj/mXiQKurOYj1G0fp0DXlUuNllSWTaa52A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5iGtGKwc7yvahLKJ0Pc0dFX4gKodmCJaypyruFmDmWA=;
 b=DgoFzIKnKNbjTOqbs/2wnBLSr7OCEVOe99L0pKOjSjZ+kRJMrGP3uSYu6XN9D4yJKL8YUEkFN1VQH7sjpuhgjSo0jVADtlT2DvO0dZPtfa3BeUffQkUymx8Z34/IOhykzUBAInZs0FijPQFMAytuHidrpCRKdOFRl4rv8ivdM4Vy9NxwL4YARE13Niq93X6211vXR/+I8RrQf3VXUm+oKzSz47k6YoBV5zDDhBau7Omm/BN0fhHzWPQLK29dRYERt2dPIpasKoJxB6IEv9giaQ4Psukf0LSVPCdHJ+TwbJRvh62SC3YrgO4MWRf9kTKVUZbKLkYhuYG/GvfoZp7CyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::5b) by DSVPR11MB9958.namprd11.prod.outlook.com
 (2603:10b6:8:3bc::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Thu, 29 Oct
 2026 05:04:19 +0000
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::19f5:13eb:df52:68ff]) by DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::19f5:13eb:df52:68ff%8]) with mapi id 15.21.0546.021; Thu, 29 Oct 2026
 05:04:19 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Murthy, Arun R" <arun.r.murthy@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: Jani Nikula <jani.nikula@linux.intel.com>, "Borah, Chaitanya Kumar"
 <chaitanya.kumar.borah@intel.com>, "Shankar, Uma" <uma.shankar@intel.com>
Subject: RE: [PATCH v2 1/6] drm/i915/dp: Factor out the DSC slice count and
 link bpp lookup
Thread-Topic: [PATCH v2 1/6] drm/i915/dp: Factor out the DSC slice count and
 link bpp lookup
Thread-Index: AQHdZphOATId/vINIUy74KJP/V6YB7cT9/fw
Date: Thu, 29 Oct 2026 05:04:18 +0000
Message-ID: <DS4PPFE901A304FA2B0319E172963C40BF2E36E2@DS4PPFE901A304F.namprd11.prod.outlook.com>
References: <20261028-vlk-64036-dp-symbol-tg-v2-0-43849c325d32@intel.com>
 <20261028-vlk-64036-dp-symbol-tg-v2-1-43849c325d32@intel.com>
In-Reply-To: <20261028-vlk-64036-dp-symbol-tg-v2-1-43849c325d32@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPFE901A304F:EE_|DSVPR11MB9958:EE_
x-ms-office365-filtering-correlation-id: 8310afb8-3188-49a3-39aa-08df357a1674
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|23010399003|38070700021|261028144727099003|261026140227099003|56012099006|11063799006|4143699003|261009221227099003|261021123027099003|261022105027099003|261009223027099003|261021121427099003|261022075727099003|261026121527099003|10067099003|22082099003|18002099003|6133799003|3023799007;
x-microsoft-antispam-message-info: 6JwYTaJHMSOaJ/aJN1+D5QBHnQ1QB+3nE0iO9KWgOThYEvjr4Xwi2f1D4k9inFlLN+5ZqrKLLjLIh9VT8X0JRIF/CrQuJdJ2kwOWqa/8+67oGdoSCIptubUo0bsmimp9M8ZUrZr1j9YypVafIRid5wh9OJ3/Up4QHEIwVJjRWhITkzdqwu2r4pAV/bJxl9wS9XcR9DrM/CKwXO6N1lCgUsbYZxgbnW9gtcv68RlpqdaPY2iaQ8YkaX0p5W63dWwI592Ok14V7tmYcql1QaoMpnrxZyDwHpGyLMpsQAptnBs1ZRkG5QT/nOnYlZDmhR280dU9oDDk9nNfM2eP0tZOHY2JtRQS0gH4wt7hxK+6er+92ckjNK8qAcV0CfZHrfgtMY1/NjGabm9QPCzDQKubHUJs3+7rd2j3wzWsM5gYe+TBWDz+fvUopPG7MNQfz1ka5t+U3sM74UyuQYxgx+qM1MiLXQes7azeRcj1cW1DT0GQpu1shk6x9dpHr+t6It6k84BRsH7Ntc9f6OpFp1ch+ofikLC8t8ZpL4ErcHkBXZBgZr+AStm9NMgXpwL9bpv7Ah2gJanX49Xd9TPYBvhrqNWikt9KUPYzznpzcPU+KxbxampJ43sKRi5pWWPogYjqGllELCmtOtn43lN5GFTTaiGoHY27sua+qgaImMr8pa5E7xxhRibjq2Brl+CiHIMUVYLUIKV8qitbJwxfE64vyxezBZbLX+D9QaB09OujeX8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPFE901A304F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(38070700021)(261028144727099003)(261026140227099003)(56012099006)(11063799006)(4143699003)(261009221227099003)(261021123027099003)(261022105027099003)(261009223027099003)(261021121427099003)(261022075727099003)(261026121527099003)(10067099003)(22082099003)(18002099003)(6133799003)(3023799007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UHpWVlk2VHhkMUdNMFVycWd3a2lwSlpiQmlPZFNEUEI0Y3hzQ2JNMjlKRG5M?=
 =?utf-8?B?NmFoQjUrNG84dmkvZnNZYnNaZ0U1QURyM2cwSFBKbDBhTlA1WTVLMWlCdWxs?=
 =?utf-8?B?MThLcTQ0bEovZzBFcE44T3lyRGxJOTBmUXpxcXIzbFR3Vy9NOC8rZDhTM05P?=
 =?utf-8?B?Z2lZYlNYVm44dVpLQWhXaC85eVpHNlJ6M0pDU0RBOUtIK0JPM1ExNFU1dTNR?=
 =?utf-8?B?bCtQN0d3MjNKLy83dXg2S1dic2RuZE5UbE50Smg0R2cyY2xQdGNnMDU3Vkcz?=
 =?utf-8?B?ZGl6bEdOUGVCc1NtM2pZOVdyL0ovckdzYmtKcStZdXlUS29SWGxnMDRyV1NU?=
 =?utf-8?B?bmc2TCtNOXEvTWtGSUFXdFdvOS83NmMvZ1FTNkNQTjVUdEdKT2hGZGx6c0hl?=
 =?utf-8?B?WmxSS1gwVTFOckJsVWZTVGlwOXVJMU56bW40MVl6SmhIQStIQTcyUUZCMGQw?=
 =?utf-8?B?cVYrSHRvdG1NTU5GeGNvanZ4M2k4cmFHd1dtRFNyQ3dPSmhuME5TdEtkZE9M?=
 =?utf-8?B?TktzbmpIN2ZRSjV0Vnp1TUU1TW8yeHcwdlJ2MkVRSW1mK3F0VjhjOWp5UlF4?=
 =?utf-8?B?cWorZ1RXdTBoWE5jZWtSWEN4SURVWVN4UGI0N0hOaUJNdTRsUUhVdTlxckk4?=
 =?utf-8?B?NDNESEpqNDFXdktCZko4ZTdFWlRxUzlvQTVHUVFpTWRJRFRRaHlHMVp0aExS?=
 =?utf-8?B?ZXF0WTZxOUpKMXoyM0JwaXduTGVnUmtWSnQ0RkdsbzNFa2ZxMDNBM1E2TVVM?=
 =?utf-8?B?Mko4Z05MTzJqM3A5SlhiTVhDT1NTaWRDc3BRYW54SUh0NlN5akFwYW9uRUdR?=
 =?utf-8?B?K0lkcEhEWm5NNzBoVysxdWVsbTVFeStkR0VsaURtVG1UOEtiejNYWm9xa21w?=
 =?utf-8?B?bzA3UXNsNE4zbzR1NGpQc0pVd3d4enNmYk9uMVNiQWp6a3lMZUN4VzM2MFFP?=
 =?utf-8?B?UFc4VENFWXJCalRHbTVBUTVLZG92MDA3R1gzODFCOWtjVmFaWXFPT0pPc1dw?=
 =?utf-8?B?U3h6WndWb1VsVjRHQ0xqMEdTWTNLV0p4VUEyTTltSmszVlJyN09ZNld0UEpz?=
 =?utf-8?B?THQ2cXN5M2d5dThEOU9aSFBnTjh3Qmo3QTlCRW5wcUt2MVFpSzdPMGNNVUUz?=
 =?utf-8?B?YmYzUU94L1JXMVBVVTBJTjRJdisrUlVOMndocXhGNlJ5Tm5jUFcycGRjZEl1?=
 =?utf-8?B?RWtYY0hVclBYNXdpeHNJOXE2Y2d5dit0UTNxeUVFTE9nb2hlSWtHZUxxUXJt?=
 =?utf-8?B?eVlkR0RDZVhJMVBjM1U1TXR0b3FtcTQ2T2R1L1dOQ1JtV3lIME5nQzE2RXBT?=
 =?utf-8?B?Kzc3eTNZYVRSUzJjSWdrZW1vOTYzRkY2R0JNWEw5U1JoMGxGYVJYUXRpSk1h?=
 =?utf-8?B?VDFha0k5VDA5KytrbDRGMzNrMUdBZUw0THpGdTJnMXR6YnpMZlVROUlIUTE0?=
 =?utf-8?B?azU1WEI3S1RzQmdDVW1uQ2w4WWpnTXRhMU9IUVVLMG1FOEs2VW53QThWSzI5?=
 =?utf-8?B?Mjh3K2lhdE4wcXFlV2F2TXJMNUtIWllXOUYxWUJDVjNPOGN5VC92Y29vQXVP?=
 =?utf-8?B?bjdidFVWVmE0RDYxQU5GRFpaTldQSlZncmtwY2I1WmpIVWV0cnI2V0lmYTJu?=
 =?utf-8?B?dTVzQmJRQm91MmlGZThGQ1NYeHNGN3EvbTRPZmR1N3JiVmM4d3lodENVVmd4?=
 =?utf-8?B?UGRLUjFHTGg2VTNkYU1kaHduODBzb2IwakxPdk9yZjcyVkdiYWNyMy9tbEU2?=
 =?utf-8?B?RnFNTlRONlNobEdITms0U2RIdkRsSVRlc2RWZDZRTjNpN1NXZVoxK2JXSGZt?=
 =?utf-8?B?NUdFaG5xQTZCTmhnemlhMTAwd1RaQ0IyR285OTU0c2RvdytYSWV5MVEwR2Ji?=
 =?utf-8?B?N2Jza3lhVnpIT0ZLZEt3N2YzZzdHQWZFL3FtdCtPbUZzS3RybzFCejAwT2V2?=
 =?utf-8?B?czV6UVFBd1dUbGd6VmNxUWkwR21wbCtrTGNBQ2J0aU9IT0l1cVBhOVZPQnBI?=
 =?utf-8?B?V2ZHZ3FzV1NwTCtXaXpyZEF3M2owZHBQVzFrbVZxTTk0S1FqWHFBN0ZtTE5t?=
 =?utf-8?B?UnhjcUkvRnljTGRWc0N0R0xXSWl3U0hpa0JYbW1obFJmT3BZVXJBU3lkWUJm?=
 =?utf-8?B?NTJrcTNCTU4wdkFCd2tNVDA1UTRka0lpTFJ4d2hjMXNHR09kRXNYRWNOVDdW?=
 =?utf-8?B?eVF5MXNiTFBSajBnK0NEMkJRYUVBWEszb256d0tLRUxvOU5OQVVtR2ZTdVpx?=
 =?utf-8?B?Vkt3QjBjcDVweGVBYmJSWW45MG1HcGdOL0RWVFpiZVJqbFo0MXkxK2lQeExX?=
 =?utf-8?B?NGJGdk5oQjNvd1k1bTNKSU5qVmo1SjVmbEFxcG5kQjNNNUZQaFVSQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: BNTLTwJfAhSTaqMzA8AyzHDSj07rWmXTBVP7pJPJl46O6EuVQwBwza3wRIxnDXOsF392KY32ejCZfglNcOx1U3kfZ9Lf8t1Lc2E/PK2pDk82ZkLfR/bSmvP+lo9wqsWTGxU3VNU6mkOQdAaSaM7D5hKRaL+v0gVp8FKoIaoSeUsyDj5A/NyOaTdJLoinvlvojzwVdWbFYhjG6dtiTUGkg+pm9TEsKZSM6Uvt1SGiu4DkessZmU6JP7SrI5MGEgKkrlTFe3yt54vaydZWTF8/AojiDxZcYH2QSO+VCOiwfstBeJ/Pqhkj4HbOytKnQRhK9ws2tY4Mbhx/eWvWZCXDIQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFE901A304F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8310afb8-3188-49a3-39aa-08df357a1674
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2026 05:04:18.8597 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ufyC4nVL+qi2AvyhPRhotsSSdK5vM2g7Jmfuq/oWDgkToADYJbCGeq78WmiMtJsR8QL+j+SVljcRNikHunG6Fg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR11MB9958
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

PiBTdWJqZWN0OiBbUEFUQ0ggdjIgMS82XSBkcm0vaTkxNS9kcDogRmFjdG9yIG91dCB0aGUgRFND
IHNsaWNlIGNvdW50IGFuZCBsaW5rDQo+IGJwcCBsb29rdXANCj4gDQo+IE1vdmUgdGhlIERTQyBz
bGljZSBjb3VudCBhbmQgbGluayBicHAgZGV0ZXJtaW5hdGlvbiBvdXQgb2YNCj4gaW50ZWxfZHBf
Y29tcHV0ZV9taW5faGJsYW5rKCkgaW50byBhIGhlbHBlciwgc28gdGhhdCBpdCBjYW4gYmUgc2hh
cmVkIHdpdGggdGhlDQo+IHVwY29taW5nIERQIHN5bWJvbCBiYXNlZCB0aW1pbmcgZ2VuZXJhdG9y
IGNvbXB1dGF0aW9uLg0KPiBObyBmdW5jdGlvbmFsIGNoYW5nZS4NCj4gDQo+IFNpZ25lZC1vZmYt
Ynk6IEFydW4gUiBNdXJ0aHkgPGFydW4uci5tdXJ0aHlAaW50ZWwuY29tPg0KPiAtLS0NCj4gIGRy
aXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHAuYyB8IDUxICsrKysrKysrKysrKysr
KysrKysrKystLS0tLS0NCj4gLS0tLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAzNCBpbnNlcnRpb25z
KCspLCAxNyBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
aTkxNS9kaXNwbGF5L2ludGVsX2RwLmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5
L2ludGVsX2RwLmMNCj4gaW5kZXgNCj4gYmY1ZTg3YTcyMTA4ZWFmMjc0ZjI0YmM5OTdmMmU4ZTJj
YzgzMjBhMC4uMzgyNzczN2MwZDgwODIyOTQxM2VmOTYNCj4gOTA4MmQ1OTI0OWE2Yjk2YjIgMTAw
NjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHAuYw0KPiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwLmMNCj4gQEAgLTM2Mjgs
NiArMzYyOCwzNSBAQCBpbnRlbF9kcF9xdWV1ZV9tb2Rlc2V0X3JldHJ5X2Zvcl9saW5rKHN0cnVj
dA0KPiBpbnRlbF9hdG9taWNfc3RhdGUgKnN0YXRlLA0KPiAgCX0NCj4gIH0NCj4gDQo+ICtzdGF0
aWMgaW50IGludGVsX2RwX2dldF9kc2Nfc2xpY2VzX2FuZF9saW5rX2JwcChjb25zdCBzdHJ1Y3Qg
aW50ZWxfY3J0Y19zdGF0ZQ0KPiAqY3J0Y19zdGF0ZSwNCg0KDQpXZSB1c2UgdGhlIG5hbWUgSW50
ZWxfZ2V0X3NvbWV0aGluZw0KV2hlbiB3ZSB3YW50IHRvIGRvIGEgcmVhZG91dCBmcm9tIHJlZ2lz
dGVycyBhbmQgZmlsbCBpbiBjcnRjIHN0YXRlIHRvIGdldCBpdCByZWFkeSBmb3IgZWl0aGVyDQpD
b21wYXJpc29uIG9yIGR1bXAuIEhlcmUgdGhpcyBmdW5jdGlvbiBkb2VzIG5laXRoZXIsIHRoaXMg
aXMgYWN0dWFsbHkgZG9pbmcgY29tcHV0YXRpb24uDQpDYW4gd2UgcmVuYW1lIHRoZSBmdW5jdGlv
bnMgdG8gcmVwcmVzZW50IHRoYXQgPw0KDQpSZWdhcmRzLA0KU3VyYWogS2FuZHBhbA0KDQo+ICsJ
CQkJCQlzdHJ1Y3QgaW50ZWxfY29ubmVjdG9yDQo+ICpjb25uZWN0b3IsDQo+ICsJCQkJCQlpbnQg
KmRzY19zbGljZXMsIGludA0KPiAqbGlua19icHBfeDE2KSB7DQo+ICsJc3RydWN0IGludGVsX2Rp
c3BsYXkgKmRpc3BsYXkgPSB0b19pbnRlbF9kaXNwbGF5KGNydGNfc3RhdGUpOw0KPiArCWNvbnN0
IHN0cnVjdCBkcm1fZGlzcGxheV9tb2RlICphZGp1c3RlZF9tb2RlID0NCj4gKwkJCQkJJmNydGNf
c3RhdGUtPmh3LmFkanVzdGVkX21vZGU7DQo+ICsNCj4gKwkqZHNjX3NsaWNlcyA9IDA7DQo+ICsN
Cj4gKwlpZiAoY3J0Y19zdGF0ZS0+ZHNjLmNvbXByZXNzaW9uX2VuYWJsZSkgew0KPiArCQkqZHNj
X3NsaWNlcyA9IGludGVsX2RwX2RzY19nZXRfc2xpY2VfY291bnQoY29ubmVjdG9yLA0KPiArCQkJ
CQkJCSAgIGFkanVzdGVkX21vZGUtDQo+ID5jcnRjX2Nsb2NrLA0KPiArCQkJCQkJCSAgIGFkanVz
dGVkX21vZGUtDQo+ID5jcnRjX2hkaXNwbGF5LA0KPiArDQo+IGludGVsX2NydGNfbnVtX2pvaW5l
ZF9waXBlcyhjcnRjX3N0YXRlKSk7DQo+ICsJCWlmICghKmRzY19zbGljZXMpIHsNCj4gKwkJCWRy
bV9kYmcoZGlzcGxheS0+ZHJtLCAiZmFpbGVkIHRvIGNhbGN1bGF0ZSBkc2Mgc2xpY2UNCj4gY291
bnRcbiIpOw0KPiArCQkJcmV0dXJuIC1FSU5WQUw7DQo+ICsJCX0NCj4gKw0KPiArCQkqbGlua19i
cHBfeDE2ID0gY3J0Y19zdGF0ZS0+ZHNjLmNvbXByZXNzZWRfYnBwX3gxNjsNCj4gKwl9IGVsc2Ug
ew0KPiArCQkqbGlua19icHBfeDE2ID0NCj4gaW50ZWxfZHBfb3V0cHV0X2Zvcm1hdF9saW5rX2Jw
cF94MTYoY3J0Y19zdGF0ZS0+b3V0cHV0X2Zvcm1hdCwNCj4gKwkJCQkJCQkJICAgIGNydGNfc3Rh
dGUtDQo+ID5waXBlX2JwcCk7DQo+ICsJfQ0KPiArDQo+ICsJcmV0dXJuIDA7DQo+ICt9DQo+ICsN
Cj4gIGludCBpbnRlbF9kcF9jb21wdXRlX21pbl9oYmxhbmsoc3RydWN0IGludGVsX2NydGNfc3Rh
dGUgKmNydGNfc3RhdGUsDQo+ICAJCQkJY29uc3Qgc3RydWN0IGRybV9jb25uZWN0b3Jfc3RhdGUN
Cj4gKmNvbm5fc3RhdGUpICB7IEBAIC0zNjQyLDEyICszNjcxLDEyIEBAIGludA0KPiBpbnRlbF9k
cF9jb21wdXRlX21pbl9oYmxhbmsoc3RydWN0IGludGVsX2NydGNfc3RhdGUgKmNydGNfc3RhdGUs
DQo+ICAJICovDQo+ICAJaW50IG1pbl9zeW1fY3ljbGVzID0gaW50ZWxfZHBfaXNfdWhicihjcnRj
X3N0YXRlKSA/IDMgOiA1Ow0KPiAgCWJvb2wgaXNfbXN0ID0gaW50ZWxfY3J0Y19oYXNfdHlwZShj
cnRjX3N0YXRlLCBJTlRFTF9PVVRQVVRfRFBfTVNUKTsNCj4gLQlpbnQgbnVtX2pvaW5lZF9waXBl
cyA9IGludGVsX2NydGNfbnVtX2pvaW5lZF9waXBlcyhjcnRjX3N0YXRlKTsNCj4gIAlpbnQgbWlu
X2hibGFuazsNCj4gIAlpbnQgbWF4X2xhbmVfY291bnQgPSA0Ow0KPiAgCWludCBoYWN0aXZlX3N5
bV9jeWNsZXMsIGh0b3RhbF9zeW1fY3ljbGVzOw0KPiAgCWludCBkc2Nfc2xpY2VzID0gMDsNCj4g
IAlpbnQgbGlua19icHBfeDE2Ow0KPiArCWludCByZXQ7DQo+IA0KPiAgCWlmIChESVNQTEFZX1ZF
UihkaXNwbGF5KSA8IDMwKQ0KPiAgCQlyZXR1cm4gMDsNCj4gQEAgLTM2NTYsMjIgKzM2ODUsMTAg
QEAgaW50IGludGVsX2RwX2NvbXB1dGVfbWluX2hibGFuayhzdHJ1Y3QNCj4gaW50ZWxfY3J0Y19z
dGF0ZSAqY3J0Y19zdGF0ZSwNCj4gIAlpZiAoIWlzX21zdCAmJiAhaW50ZWxfZHBfaXNfdWhicihj
cnRjX3N0YXRlKSkNCj4gIAkJcmV0dXJuIDA7DQo+IA0KPiAtCWlmIChjcnRjX3N0YXRlLT5kc2Mu
Y29tcHJlc3Npb25fZW5hYmxlKSB7DQo+IC0JCWRzY19zbGljZXMgPSBpbnRlbF9kcF9kc2NfZ2V0
X3NsaWNlX2NvdW50KGNvbm5lY3RvciwNCj4gLQkJCQkJCQkgIGFkanVzdGVkX21vZGUtDQo+ID5j
cnRjX2Nsb2NrLA0KPiAtCQkJCQkJCSAgYWRqdXN0ZWRfbW9kZS0NCj4gPmNydGNfaGRpc3BsYXks
DQo+IC0JCQkJCQkJICBudW1fam9pbmVkX3BpcGVzKTsNCj4gLQkJaWYgKCFkc2Nfc2xpY2VzKSB7
DQo+IC0JCQlkcm1fZGJnKGRpc3BsYXktPmRybSwgImZhaWxlZCB0byBjYWxjdWxhdGUgZHNjIHNs
aWNlDQo+IGNvdW50XG4iKTsNCj4gLQkJCXJldHVybiAtRUlOVkFMOw0KPiAtCQl9DQo+IC0JfQ0K
PiAtDQo+IC0JaWYgKGNydGNfc3RhdGUtPmRzYy5jb21wcmVzc2lvbl9lbmFibGUpDQo+IC0JCWxp
bmtfYnBwX3gxNiA9IGNydGNfc3RhdGUtPmRzYy5jb21wcmVzc2VkX2JwcF94MTY7DQo+IC0JZWxz
ZQ0KPiAtCQlsaW5rX2JwcF94MTYgPQ0KPiBpbnRlbF9kcF9vdXRwdXRfZm9ybWF0X2xpbmtfYnBw
X3gxNihjcnRjX3N0YXRlLT5vdXRwdXRfZm9ybWF0LA0KPiAtCQkJCQkJCQkgICBjcnRjX3N0YXRl
LQ0KPiA+cGlwZV9icHApOw0KPiArCXJldCA9IGludGVsX2RwX2dldF9kc2Nfc2xpY2VzX2FuZF9s
aW5rX2JwcChjcnRjX3N0YXRlLCBjb25uZWN0b3IsDQo+ICsJCQkJCQkgICAmZHNjX3NsaWNlcywg
JmxpbmtfYnBwX3gxNik7DQo+ICsJaWYgKHJldCkNCj4gKwkJcmV0dXJuIHJldDsNCj4gDQo+ICAJ
LyogQ2FsY3VsYXRlIG1pbiBIYmxhbmsgTGluayBMYXllciBTeW1ib2wgQ3ljbGUgQ291bnQgZm9y
IDhiLzEwYiBNU1QNCj4gJiAxMjhiLzEzMmIgKi8NCj4gIAloYWN0aXZlX3N5bV9jeWNsZXMgPSBk
cm1fZHBfbGlua19zeW1ib2xfY3ljbGVzKG1heF9sYW5lX2NvdW50LA0KPiANCj4gLS0NCj4gMi4y
NS4xDQoNCg==
