Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17B67C5AC7C
	for <intel-xe@archiver.kernel.org>; Fri,  7 Aug 2026 08:09:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B105510F371;
	Fri,  7 Aug 2026 08:09:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bfpYyRo3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF9D110F371;
 Fri,  7 Aug 2026 08:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786090164; x=1817626164;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=N2W/5z8QOqwpPv7KPi36rYTF07Oela+emc9nv/wMxZk=;
 b=bfpYyRo3L9l15oieOA8reTrwUdGqJf1M6fSCTBzDSbKx/+48tFNPoI8d
 ZaoyqbIeVT964SiW28kvox3Ru8R6RX8fcKe9W7rxVrT188wbiIaeT6yWS
 RG7EIAixNVoxttfptp2CjpGoyWexg7LNfHu9PnTCJWyCKbQElKmTqNowV
 rvGJeudiWoyD+Hiq5G7I9cybv+/GF9PLvOzF2CfvKrq7KWUvc0FXMXtrU
 LQgYNLV5JNohib8KcnNV5JalKDznfmg+kW6KinL3IXVl7k19hprXGFQ/c
 wl6lAhYIN8BBPym7URqheuAbJ2pgMbknKH4URGS9rAM0dooVzhMDF5MHW Q==;
X-CSE-ConnectionGUID: WGlwfuJQQxuEiAAwvbBtvA==
X-CSE-MsgGUID: Jg/AoZTCT8a0B51+dkngbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="86634105"
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; d="scan'208";a="86634105"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2026 01:09:24 -0700
X-CSE-ConnectionGUID: /46QnES2QkOuY9+67NMRxA==
X-CSE-MsgGUID: jjlaTS14TeGbsNr0G+jg7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; d="scan'208";a="259006177"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2026 01:09:23 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 7 Aug 2026 01:09:22 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Fri, 7 Aug 2026 01:09:22 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.38) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 7 Aug 2026 01:09:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lMB7SmtLxSbJrcKJg4DNrgoeNjGscRIybSeyd+XaONggpGmSQYDqVUM21zBnXajbCsvciPg2tTY+b4D7F5nRkU6vNYknc98zTt6Emc+/4Q9UmiKD16JVQ5pja8lS/yABAV7BhZRweTHY3UMoBKHVmMer8ya4d60sGoQPcOUSXADKEAjW94T6/0UHL2K53GnZ5CZQerxh1ZMnPqbG47ZBs8zVnGx2bms3gns7Uh022I8NfJWG1dKOQ04Me5q59lSv74/oesvmRA0p+kj7mY5dkcffOv+hzVxE/fYxch4APEUqYtGqilg6elGfwZXgCdPk2ShN4IOCrRPyUSCLcdvX5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I+hk+HkvPV4rxPNb7z4WNc81JDsL2J45ZVpqA3P2sV4=;
 b=XitBf/4Oa+3qQG6+UzQjCYHzzvBUpmGVgluqI/ZFIF4UufH1WLdxjLfVKjDlPAdBYYZBW6wxJG1S1omjqXEIsgSe5/YdqOae+ZFcWauPWusXhGxDm4OhTi1QVOmQRo4J6ws/JaQ5yS27jAVGaQbn2zNdZlVxrlI5GV3qAjkGsG2ibRLhFHZFLLXpOyaYFmURUJOLIomXg3wVQEqNtouLQr4Jjc1RT7mRISbERgKpa5o8+oIVT+6Uv23ybJiHHETzBqH1uSqmBR4OdYKjysrY6ZFdyZrkQkow1GipUm3uLFuBk/FH7A1J7q1cjvjwrTVBxGP2nryUQ5eE0UzjGaGKbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB8049.namprd11.prod.outlook.com (2603:10b6:8:116::6) by
 IA1PR11MB6466.namprd11.prod.outlook.com (2603:10b6:208:3a6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.21; Fri, 7 Aug
 2026 08:09:20 +0000
Received: from DS0PR11MB8049.namprd11.prod.outlook.com
 ([fe80::603c:772d:6793:d4eb]) by DS0PR11MB8049.namprd11.prod.outlook.com
 ([fe80::603c:772d:6793:d4eb%6]) with mapi id 15.21.0270.016; Fri, 7 Aug 2026
 08:09:20 +0000
From: "Manna, Animesh" <animesh.manna@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>,
 "Shankar, Uma" <uma.shankar@intel.com>
Subject: RE: [PATCH] drm/i915/cmtg: Disable CMTG after PSR exit to avoid
 disable timeout
Thread-Topic: [PATCH] drm/i915/cmtg: Disable CMTG after PSR exit to avoid
 disable timeout
Thread-Index: AQHdJjZFYOq1TsypMU+g00F8WbtuebaSOcoAgAABiWA=
Date: Fri, 7 Aug 2026 08:09:19 +0000
Message-ID: <DS0PR11MB8049B57E8E753BDDBEBE62E9F9D12@DS0PR11MB8049.namprd11.prod.outlook.com>
References: <20260807055452.2997983-1-animesh.manna@intel.com>
 <220f80c2de131ecf25a869bd9218af30fbbe4b54@intel.com>
In-Reply-To: <220f80c2de131ecf25a869bd9218af30fbbe4b54@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB8049:EE_|IA1PR11MB6466:EE_
x-ms-office365-filtering-correlation-id: 65d0a002-94d7-469f-774d-08def45b2ef1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|23010399003|376014|1800799024|38070700021|6133799003|56012099006|10067099003|11063799006|4143699003|18002099003|22082099003;
x-microsoft-antispam-message-info: CxVwXCOrPFnmAWc0tTiNdpfsJ+ktybMLOEWk7CeWx1attidDQwx2+Fk8X/Vw1YYvoDDCvAWVnmiFZOrMN25UFB6ZGz2tQx4G4BmFAbcMBUD2fzkg3QFNoYjhCIBECtmnwSOlwyl+vm1/ifkkZmMW1/Ta4w7E/ssIJWkuI5K4SHHu4yyW66w1X5Q8I/PLYJ5cmb77TziwiZqW6euZCD8aznuTLqVbJkbTOzuHPRmjKjZxJaqxyNO7jeOjWyvY1KiN58ZGNsGVhuNggsStiUdVI+uN0uxLy/ptaY65oP0M1LdhQf27uwIPbTUplafOAeVnd9xrH+6XKNn9+MHc/lLqE8SHINgoS/5MPSvpC3PQzdbMKdBVee9Oux64IGLe+IwfIQmg6GPxsgg3VyXWN8lQ1oVNbLP/na/YgQ7YaxAPolvXNekaUXVYkH2wUqT3jOCAm1FVbbHQEiGUjXRURMetv/PuSbCopeECDdSwmPZuKUCbceG2pV8cVL+efjYGZjEMUjASqHtYLuXu+tCXzDldOEoh5niuWrjOo3jVWk1mj4R3FaE8/DroZ9Bx3I3ZNgS4WuS7O6VmkzUR01JJICsezHR0FwyW9fIQPu/hZkCGpr/BOPA4uHcNkhTCg7xEnu/nPRV8d8apnpomzhRlzdavZPOvIuAjCcnoYrMiEFI71ZKqKdN5B8GkWvu3Jp0QEDt2qMIZhsQi9MQd/2iqhJBRPNtvH59VT03vER4BVOKyhKo=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8049.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(38070700021)(6133799003)(56012099006)(10067099003)(11063799006)(4143699003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?9Zh/LfLDnodXiEK0X95idq/1mZ30dDtn9tmQTnwZgCY3+OpfHUV6OiBHtJ5g?=
 =?us-ascii?Q?pO/3nqFkUNgCozb+WxeCMxwAETdua5oHuTME6+xy/ogDRBnDCcJgjMMIL8k2?=
 =?us-ascii?Q?qTywwIzXE4w7hmpYfO/Kgz7adExx2hbwuone9DBWVO3nrtSl+zxq3yT3re0j?=
 =?us-ascii?Q?APsOS4PZa09RfgEYh4sSZCy/tPHRinbuS15EAqQVXRUwL2g8nwT7XAifEnBa?=
 =?us-ascii?Q?tBHLOlaHusD5prxn+7lODIXWwvr0nl8VIP7Tod2bevAYSVmQozomp0yB2k1b?=
 =?us-ascii?Q?V9jaDC+QQ/iFTtS6YiT29MeJ68cd/MyS0m6eusNl7T2h5PVUQoFLV7pDjpms?=
 =?us-ascii?Q?clSXwN6nx0xe4xQuuDLwHLC/zV88oimtsx5LZYuSO5+k+wWETgAjUHIbzZTt?=
 =?us-ascii?Q?LPQflUW3ddViu1y3YbxAOuSiGjCgDl6Ex2u53j4fapOczTHltlnl95tmcj7I?=
 =?us-ascii?Q?8panfy5aVycZBrQFgY52xn9pN0aE1cdvjGyqbUyx5D417FiFx6kx5dgh4Egh?=
 =?us-ascii?Q?Q98RjS5/ZOFZs1+8Ks4zLAD/h1J8JWfxR2h0570TjG+Cpoeo8uyOWLmAVIBp?=
 =?us-ascii?Q?jVbLAxfExFgyLa592q8kPq33gqvzuxsnHToCb+zeA5UTAl92l8hU00EZHlI0?=
 =?us-ascii?Q?ufwcR0v4iMGEd3GankaHewecAcUsMRqVkyV0EcE37I5KS68Lg10TiUzd1YQo?=
 =?us-ascii?Q?eNJPncmlmzxu2l+wyGjLRMZ24m90+NWJuIjaeJg+mdNRmX657QyPHoxuM22b?=
 =?us-ascii?Q?rsvvkDMN7wActT4DEIoX17BEgHKpqpWjV7x6V+k86iNUd/ytBvbEtmt1xwJQ?=
 =?us-ascii?Q?If5U0rfGV/KL5w90x50FVRLvoTfA8ai95CZI4jgypELhqz54F3J/ouBI6kj1?=
 =?us-ascii?Q?YGBxIfi47+G72VyvvnYL7nmNSZA95xwGdyceuvVzlZdZEyE67llxT9d5Zqgv?=
 =?us-ascii?Q?gtmQ1xqgwyQIzvXytRLb3XgdIaJxHUP9dZCPLmRsv45aHESqVbfsXtx6aaQ+?=
 =?us-ascii?Q?1MLewK+g8RmlxADI8fNm/GohHSLauGKJnzE7nU64WX9f9xAQns4Y0vIIaJSb?=
 =?us-ascii?Q?HbwmR1R03x7oQCYaLUJh3W6wrL5MZE7AI2Toszua2g0MLfi8UTXfo5Ih+POJ?=
 =?us-ascii?Q?83N3xE0c2HsJKRrEaAE+f3mJAxsrVvsR3eYjodMudSojtrnDoyt/wO56PAQi?=
 =?us-ascii?Q?PDmR987miwxHCMcDPRmu0JBs4Wpe9U1aJBoWQVu1gWMJB13+TugP6hzKk7eH?=
 =?us-ascii?Q?cjk6mwAATgrpY5GVEpqIa/M2r9zTf9KkyB2E+vqnwkaoM/if1+ejltFgWgwk?=
 =?us-ascii?Q?P+7X04BXLepOgL9X/K0J+70Hf3cMCOsir3sVyL8tKz6O4oWZn4s+p3hq6Y3n?=
 =?us-ascii?Q?ntDyunQEaotfWt4s2kb6trvcRu9WxbzrxRFyRPT84252RZSQMSdKfu8Wk6Cj?=
 =?us-ascii?Q?T0g5GzavJyLl4Ud2LMy6xvkJiz5M7PAKutL0AieCP3Yoe6A+nVDMXl3R0M2N?=
 =?us-ascii?Q?6y8NKkfzgeAbmKGsngVlsEUamK7wrgKBCARLXrQdUZVhfzJX63ptfjG5qUky?=
 =?us-ascii?Q?D15K4GI3889FUHxIHvHlZXXGmDB/wdBY8kqDkr+H8/vDUbXlyb32yfRcnZ1x?=
 =?us-ascii?Q?BITfh3jiy2gbyZ6ad81ZvXDv/ulMFM1Kv+dbXX9FRWIvOMShkh6ynJHIs7QZ?=
 =?us-ascii?Q?jnGZON2D5sKRYecYlxxJibZ4a+GgyvhQUmFoWc68Js3t/PrbdJn/++9toGKw?=
 =?us-ascii?Q?UGIHFEPpwQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: HI1YlxJU0MUYrXPDztuATEFh8fnoBjXwhPGgQHqskbiNefMTTGSWw8A4nOwdVg3m2cYaksihFRTousvtj8z5h1STboUZECGFTefGFeUZSdSz5F8w/O/cs4EzF2gVFsfYb1cd8cJIExnhQn0VwwwlR7hBY2/yz1J1a87os09JzJ7Oe7ZAOqmY90dsMDbWyLp7AIwlxHzoBFy6wTP34wv8wzheMZuD72eT0H25N2VPLMUgLA+3GkUGf8OFa7ol50qXVEfawJbRwMaQXdkXYAO2YnINLOBjdaB5LnZF/VgjpRlY01yBLNz7oI73y6zKVAinT6ZZ82bxK+kc/aZqQxtPdg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8049.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65d0a002-94d7-469f-774d-08def45b2ef1
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Aug 2026 08:09:19.9517 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NwWigJJAF9IgLuqJO+xg4T+aQSnrph6sQ9FKjrs9K0cUOW0ac2w2MFkUIFvMKX/dGI+Fqc6yoZNbY/WEXSxamw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6466
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Jani Nikula <jani.nikula@linux.intel.com>
> Sent: Friday, August 7, 2026 1:33 PM
> To: Manna, Animesh <animesh.manna@intel.com>; intel-
> gfx@lists.freedesktop.org; intel-xe@lists.freedesktop.org
> Cc: Manna, Animesh <animesh.manna@intel.com>; Dibin Moolakadan
> Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>; Shankar,
> Uma <uma.shankar@intel.com>
> Subject: Re: [PATCH] drm/i915/cmtg: Disable CMTG after PSR exit to avoid
> disable timeout
>=20
> On Fri, 07 Aug 2026, Animesh Manna <animesh.manna@intel.com> wrote:
> > CMTG is enabled in sync-to-port mode, so its running state
> > (CMTG_STATE) can only clear while the port is actively timing. In
> > hsw_crtc_disable() the CMTG was torn down at the very beginning of the
> > sequence, before the encoders were disabled. At that point PSR may
> > still be active on the eDP, leaving the port timing generator idle. As
> > a result, after clearing CMTG_ENABLE the wait for CMTG_STATE to clear
> never completes and triggers:
> >
> >   xe 0000:00:02.0: [drm] CMTG: A disable timeout
> >   WARNING: drivers/gpu/drm/i915/display/intel_cmtg.c:205
> > intel_cmtg_disable+0x331/0x3d0 [xe]
> >
> > This is intermittently seen with igt@kms_hdr@bpc-switch-suspend, which
> > repeatedly cycles the eDP in and out of PSR across suspend/resume.
> >
> > Move the CMTG disable to after intel_encoders_disable() (so PSR is
> > exited) but before intel_encoders_post_disable()/intel_dpll_disable(),
> > so the transcoder timing generator and port PLL are still active while
> > CMTG_STATE is polled. The ordering requirement of disabling CMTG
> > before the transcoder and port PLL are brought down is preserved.
> >
> > Cc: Dibin Moolakadan Subrahmanian
> > <dibin.moolakadan.subrahmanian@intel.com>
> > Cc: Uma Shankar <uma.shankar@intel.com>
> > Signed-off-by: Animesh Manna <animesh.manna@intel.com>
>=20
> Fixes: ?
> Cc: stable ?

Sure, will add in next version.

Regards,
Animesh
>=20
> > ---
> >  drivers/gpu/drm/i915/display/intel_display.c | 18 ++++++++++++++----
> >  1 file changed, 14 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/i915/display/intel_display.c
> > b/drivers/gpu/drm/i915/display/intel_display.c
> > index 829d7a411dcc..cc4d20fdda44 100644
> > --- a/drivers/gpu/drm/i915/display/intel_display.c
> > +++ b/drivers/gpu/drm/i915/display/intel_display.c
> > @@ -1791,15 +1791,25 @@ static void hsw_crtc_disable(struct
> intel_atomic_state *state,
> >  		intel_atomic_get_old_crtc_state(state, crtc);
> >  	struct intel_crtc *pipe_crtc;
> >
> > -	if (crtc->cmtg.enabled && intel_cmtg_is_allowed(old_crtc_state)) {
> > -		intel_cmtg_set_clk_select(old_crtc_state);
> > -		intel_cmtg_disable(old_crtc_state);
> > -	}
> >  	/*
> >  	 * FIXME collapse everything to one hook.
> >  	 * Need care with mst->ddi interactions.
> >  	 */
> >  	intel_encoders_disable(state, crtc);
> > +
> > +	/*
> > +	 * Disable CMTG after the encoders are disabled (so PSR is exited) bu=
t
> > +	 * before the transcoder timing generator and port PLL are torn down
> in
> > +	 * intel_encoders_post_disable()/intel_dpll_disable(). CMTG is
> synced to
> > +	 * the port, so its running state (CMTG_STATE) can only clear while
> the
> > +	 * port is actively timing. Doing this while PSR is still active leav=
es
> > +	 * the port idle and makes the CMTG_STATE clear wait time out.
> > +	 */
> > +	if (crtc->cmtg.enabled && intel_cmtg_is_allowed(old_crtc_state)) {
> > +		intel_cmtg_set_clk_select(old_crtc_state);
> > +		intel_cmtg_disable(old_crtc_state);
> > +	}
> > +
> >  	intel_encoders_post_disable(state, crtc);
> >
> >  	intel_dpll_disable(old_crtc_state);
>=20
> --
> Jani Nikula, Intel
