Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9B4F606A320
	for <intel-xe@archiver.kernel.org>; Fri, 23 Oct 2026 05:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PGa5FaYC
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96715112991;
	Fri, 23 Oct 2026 05:29:13 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FB2F112963;
 Fri, 23 Oct 2026 05:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792733348; x=1824269348;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=9wNPpLmdyzbOuIUSA1xORLdjEYiYs6CmLutCLjaYkSM=;
 b=PGa5FaYCyv5ywB42sgJo3j6FHdxxATk07fLN/f4qqsxRqyOvGZBrGxYe
 3+CnIFokcOBynFJ8/Es2bmDOaqb0OoBMf28KQrsDlAKroALnq0dSOu4nm
 kdT3I3xJBcmWT4+DGRDWfRam8MjHfvSdUPgHrPT9UGx2hveBDUv535A8n
 3KEwS/gt0qIzI0aWlsDq2kh0USZe5Rxq8G+59zjV7MNhtyhx59vD4TPKj
 Xgzy5jp6pvtUoqY9iQj941/A4MZeLSDt5MVWXbQgKpYrUzp+h5KOStw6s
 Zq6WqgnIrVTNeyQzd201hgEhwfBqctbkCMCpaDkJ/u9eIZEhJF+m9Ecjl A==;
X-CSE-ConnectionGUID: /W4KGlUmQmW1EXqjQU8nMw==
X-CSE-MsgGUID: gxcCGGgGTrqVPDMtyxcA7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11943"; a="1497030"
X-IronPort-AV: E=Sophos;i="6.27,173,1787036400"; 
   d="scan'208";a="1497030"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 22:29:08 -0700
X-CSE-ConnectionGUID: PAzHl2poRPyehbido774Iw==
X-CSE-MsgGUID: YR+uhdsmT5OrAD/7kNwgFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,173,1787036400"; 
   d="scan'208";a="3499030"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 22:29:08 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 22 Oct 2026 22:29:06 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 22 Oct 2026 22:29:06 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.28) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 22 Oct 2026 22:29:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m91+lS0dxU67+GStGSAZXGYC8OSxOynF2u6jDf70SUmHaO7V0l8YQemClKnGXY3Q+9YZ2z0HXolDhcseFeWU0bX8QwjUtVujRVD5nr8SpBfPBcoCeiFlZWFKS2ZyGdaUDmd1s48+v6GNBvkHH+L+wiGLNC/Vhvl3IulwntVc11aEHziTC+91t1YpM71UGgi5jx3yoNicEkSuaniQRhwY+8cKNcTFoSHOWFGPGRG+ZieBsVF0TGDXgi+QJQXnek6Agplq/weddCKHuMsiLsfNaxW37AaldXLZHTz6P5UnfuEv8dxdWWwRnXyS9w4P+p+f6zwhozqt3WF7AOFEEh52Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qf/7JBHDjbIXDE/02HHqpir1fgCznmsKn1s9JB4aNQg=;
 b=eGL6qr8NNstejX35BSTfhIqqHtLUlbQvDSV0Jpk5P5uHjXf87ErIdL+lhxDF5a1ar7ziTbdOPLgDuEKocfhlM9Biy0crh12ZuCKAfc1G1ufozKDoNJ2G9ygKu+5oaqwiyKVbH9Ji4P/voiEIZwZEYehJ1aDySY4v2y609MyNtdT8BmJ6MP9ci+kSm1YOJrPNT3he2o9NQO7LIDSoo0UvxyBMLf7t2f0UCdY9/NtGN3CM0MQFYyx7PaNDQwgIV0B1k01zZL7j+riUWHLKQIhbAru7yFLgIWF6qAEPYfiK6IOxnq5ls1g3uFogTMD1jxAGa1hLlwPz0ATCoeIyAgouzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BYAPR11MB3783.namprd11.prod.outlook.com (2603:10b6:a03:f5::12)
 by DM3PPF8ABC16DA2.namprd11.prod.outlook.com (2603:10b6:f:fc00::f36)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.18; Fri, 23 Oct
 2026 05:29:04 +0000
Received: from BYAPR11MB3783.namprd11.prod.outlook.com
 ([fe80::fc32:42c6:f275:4f13]) by BYAPR11MB3783.namprd11.prod.outlook.com
 ([fe80::fc32:42c6:f275:4f13%6]) with mapi id 15.21.0496.021; Fri, 23 Oct 2026
 05:29:04 +0000
From: "Golani, Mitulkumar Ajitkumar" <mitulkumar.ajitkumar.golani@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
Subject: RE: [PATCH v8 04/14] drm/i915/dp_mst: Limit M/N ratio for MST
Thread-Topic: [PATCH v8 04/14] drm/i915/dp_mst: Limit M/N ratio for MST
Thread-Index: AQHdYqvAtk2Y++sCDkSgNhNyI4m2KLcKmVug
Date: Fri, 23 Oct 2026 05:29:04 +0000
Message-ID: <BYAPR11MB378373EBA17BE2408BBD5B07B2642@BYAPR11MB3783.namprd11.prod.outlook.com>
References: <20261023050227.2068466-1-suraj.kandpal@intel.com>
 <20261023050227.2068466-5-suraj.kandpal@intel.com>
In-Reply-To: <20261023050227.2068466-5-suraj.kandpal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR11MB3783:EE_|DM3PPF8ABC16DA2:EE_
x-ms-office365-filtering-correlation-id: 4dff48f4-139f-462c-4712-08df30c68d68
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|366016|261021123027099003|261022105027099003|261022075727099003|56012099006|261009223027099003|4143699003|11063799006|10067099003|22082099003|18002099003|261021135927099003|6133799003|261021121427099003|38070700021;
x-microsoft-antispam-message-info: iqaEa+NqmBQA9y6ZWbq/SD/TUCmu4HenidSoE/7E70J0BteBBIbl5R7zeiEaT034F6xwN8moM2I2+7yyscDyC6SLCfHnjjByb0NwfkfykG/cz7SkVDmLTYkesNKcp3r6F6B5Ej1UqoLdt5JAN47gq3Ly11BVmoIWM7ZLf2g0Z/MSEpiPuq0pgONbyUO6WOGfP4iQG3yu8fxRlQTp1vMIWXezpQsdWs3OzPYHzDv6ua0z+MhEJw58hT5l0sxYYb1nLzf9wGMZnwEXlP0/ajQ7tV3BhkEYOyx65GnNXfVACfPM2boz9vd5xEcZL9EIbvSgtHUqHhoHqiCtvyoPFcfsHdp9yj5itymjrPLh66WWRl6TXZkhmCyjHGtwQtXlqsuSia5RVQ9DeG+drU/m6Ufp/icMtlrhWcHZf73NeArB1+Lj2m6ajdgr5V73akzgG9wUIwcvjwyPhvjxIM7ZRMSsF9Ev8WKb1oQtOnwp20zuyZtnhIUvq3WwhJua/c0k/Yz+iXHqeQ8SDMqVJuNKFAaev8O/iVkvX2efb5Lhh9pcQ/rW9bWOxPaPbzEOpIKZxbeP493SNbLhIz3NCZ1OyJQGl0gN8LHy9t/IYAaaRYWWpecAQNmLkmuf+EzISV+mOSdtIRutW1qRKrTUzsq36teh/+b5sW9mGiVc5cNIyuIYjTAnqZHC5RFe5/I/sFnHyalxeRH6QN85zgFMMW0wqcur7RxNMyRQhvVDql3jm1d9cFw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB3783.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(261021123027099003)(261022105027099003)(261022075727099003)(56012099006)(261009223027099003)(4143699003)(11063799006)(10067099003)(22082099003)(18002099003)(261021135927099003)(6133799003)(261021121427099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?0D/SAY/RLlwCgkjES9rBF8IxduS+A1w8a+jL0voSQSymkWgNoSjTPE9Qedtu?=
 =?us-ascii?Q?Wv7AYAzSbfnafiAS5gmBMW25GJmHxg1Tm5rwchVC5DYHy38uf1dGd/VHh6wV?=
 =?us-ascii?Q?XwUAsy2RwDwAyauFlKrwfXKpczkQOuEJgy4oqRCNniuRmZbsFVLlt82Pnsto?=
 =?us-ascii?Q?/XyLEV+VrpQE4VRfzXzlRK0ztZakJ8Fq7f+omy9fF3ZTorWapax/MKTjMXtA?=
 =?us-ascii?Q?REWie1liSaqLfD+APQ13M5Du0kcoQu07OvvLmWtqV9HUUgYpZvnWfeZ1/Uu7?=
 =?us-ascii?Q?UWgiLIHSpSPmXW1nzf0o3fkn+OrduBH1CRKP7STS3UwxKH5d692QWmFUquL3?=
 =?us-ascii?Q?sLAbkZtqjbNY4sohMV9NCevpqZIL0z4rnCz1hRRyRRfwe2CkXzrzpdxxU9Z6?=
 =?us-ascii?Q?13TK+yMvEU0glBSZNFgYH3sS0xwZgbjj58Nyu7waC2gf5xtoibtj20UDCgHH?=
 =?us-ascii?Q?98uKUpvHV6ECJcZxwgsRI/sTSlneBo74hbA6f/gAamdr6SiEWpQFm5KWWKFX?=
 =?us-ascii?Q?ZXf+nUh6IOJLrKvlAELGdOAIQK0RvA9xBM0If71UQk5ScJnMCmzfv+Griesw?=
 =?us-ascii?Q?cOterYNxaguxYgU6W72prUrg7ndC8pVsVVL8IbqpRX41JOLXK5GmV2LV6878?=
 =?us-ascii?Q?UeHU0i/TjSfYr41UPN+/T76DEcDuiQtifom2mTs5f6VsG2a4RA7nid/ntSO5?=
 =?us-ascii?Q?eMFaOgmMnJaLcm4MgWSPnr6hoXx8MIKldmWyqaLR1Zw0eUUSO9Eiv9/JHl3/?=
 =?us-ascii?Q?NoQm/u5pbcqYUu//cY8WXdy3Omec/KBnNMqIdnLr0h/8TTT0TO2/GmwUmqic?=
 =?us-ascii?Q?rE0pKTO8OMWOWbi7NNy4TZ80B+aHPMnUIj/3YBt06t+3Sd9MBN2CEHNPF2VA?=
 =?us-ascii?Q?7FowcLpMp8xfwosii1g3uCrJ17p6YLPCsyMhLoW8aTedJi2aEQPA7/YHQnjI?=
 =?us-ascii?Q?0PIdwVheb8R0iDD/9WxQFopAsQQl1E4Elh6nWVZz3ANWobY+6yXZAtd70g+O?=
 =?us-ascii?Q?YiVBhu/LbBxwLaJh7jxYIvyQK9sxqEY66x9AIyJZ8sUusNxglIW58u46j7Fk?=
 =?us-ascii?Q?h2nQbEjVbbX1aODt+nIPgwBGhZc8jiEw5/g+BnFfmIBbK504yb0qZJaZhtGg?=
 =?us-ascii?Q?P0rxQBeD8VuIl7JNIdXYGMD3Mwwwey0elYgoe+8Up93b/sA+Ooo9TBZBuptv?=
 =?us-ascii?Q?sS1rT+AlHqpAG93HjZKD6Uut40dFhLrpdQKk6+ip3ZmYjmAHdNOxSRklXMLL?=
 =?us-ascii?Q?4ac1Z+TjKjaXV2MmNT24i2/YsJWXkY47gxMQDhsGETqbCppTY1iU9Y990wLT?=
 =?us-ascii?Q?PtYo/UJFivCROpe4m8kpIfcHUzrHHNRpgZkRp/tm+mNFFsnredFWjUtttCMu?=
 =?us-ascii?Q?CnxP/CzFMb6E2RqFVzN2SgbI+8eQ5sduk1w5VELf2Tb0c6dZYDxqfA08TSA0?=
 =?us-ascii?Q?ZgTmJp3NP0mx47A9Prq83z5DD96srDtEKyPxPi9odTU5O6LoYqRYkSg2M2aj?=
 =?us-ascii?Q?ZGPEK8E0QFIPBW6P+aCpTwIxDYvd60exs2MkOLQ81bwcX9Zpu2vpqQ2ldw+o?=
 =?us-ascii?Q?V408bBicFhK7lJpJgFBE8SieuJkUuU7LEXMS4RQ99TG2FQaWUJ/ovB09GwVU?=
 =?us-ascii?Q?LHXKeQLHfnTxKX8EpVH24Ue/YsaNzPnthxWhjneqCelOe2ZI0v2FxQfIAsuS?=
 =?us-ascii?Q?yUxvmY+XvVAXEZlauIXN0duA3ZcZbzBHeQ4/o6PZjGMIie7koezwtywyiJSa?=
 =?us-ascii?Q?pX4GF1um2uXzGuUYG+aBkbsc5HquNiuocZHcQDSmIBBNRPCaLgcN?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: K2bT9Yqp0V4FuaJWcDhiOAChYF7ZWHOUlLr4uRjgfqQ1kd7jCEOFOH3sIiJHGRmLuPYRStac/rk9c8UMHowlEXpRQ1mVNPJtNgbTfYpJbIi/EqDZI2RZPB1AUEKjX1SWBO49RvQxuwekflVEOQvlxvmHA/Vgbb3uOzHm2cakImDoUwos1n5ctNGdvSt3Zh2CwvjhrYfdvX2BwcqVUiCI6JDi2enoxoiO8CgH334RFZgd8G+tORIeMwZp+yCwlODToqL9q00SIhxRfTVeskfZ3bou4g0hhoTxvEtJ//cdCkyIsJOEhopSQIklGahJSHMiISKqEmqh0MtfLUvTojTPZw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3783.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4dff48f4-139f-462c-4712-08df30c68d68
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2026 05:29:04.3548 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UX7BWv+t2uPXNIDkGuUR1wZEfI0UO+8El/QVK9x3BxeBhnug6DpBBEqZG2N0oj0b76p1PfVHFjVYX0EkQ6sPkrrurwrm814Ch78yHwLrFjLlPneEoI+8xQWIONLM+/5A
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF8ABC16DA2
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



> -----Original Message-----
> From: Kandpal, Suraj <suraj.kandpal@intel.com>
> Sent: 23 October 2026 10:32
> To: intel-gfx@lists.freedesktop.org; intel-xe@lists.freedesktop.org
> Cc: Golani, Mitulkumar Ajitkumar <mitulkumar.ajitkumar.golani@intel.com>;
> Nautiyal, Ankit K <ankit.k.nautiyal@intel.com>; Kandpal, Suraj
> <suraj.kandpal@intel.com>
> Subject: [PATCH v8 04/14] drm/i915/dp_mst: Limit M/N ratio for MST
>=20
> From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
>=20
> The hardware does not support DisplayPort configurations where the ceilin=
g
> of the Link M/Link N ratio exceeds the limit. Enforce this constraint for=
 MST as
> well.
>=20
> The compute config path needs no change: MST goes through
> intel_dp_compute_config_limits() too, which pins the link configuration t=
o
> the maximum BW one before the ratio filtering, so a stream whose ratio do=
es
> not fit that configuration is rejected there.
>=20
> What is still missing is pruning such modes, so add the check to
> mst_connector_mode_valid_ctx(). MST always runs the link at the maximum
> BW configuration, which mode_valid already uses for the BW check, so chec=
k
> the ratio against that configuration as well. Accepting the mode if any
> configuration could satisfy the ratio would let through modes MST then fa=
ils
> to compute: on UHBR links the maximum BW configuration has a lower link
> symbol clock than HBR3 or HBR2.
>=20
> v2:
> -Drop the checks in the MST link config helpers, redundant now that the
> constraint is applied while computing the link config limits. (Imre) -Sha=
re the
> mode_valid helper with SST instead of evaluating the ratio at one link ra=
te,
> since the link symbol clock is not monotonic in the link rate and there i=
s no
> single best case configuration.
> v3:
> -Now that intel_dp_mode_valid_m_n checks for all configs just call that
> (Sashiko)
> v4:
> -Go back to checking the ratio against the maximum BW configuration, whic=
h
> is the only one MST uses. Walking all the link configurations accepted mo=
des
> that MST then fails to compute. (Mitul)
>=20
> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> Co-developed-by: Suraj Kandpal <suraj.kandpal@intel.com>
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dp.c     | 5 ++---
>  drivers/gpu/drm/i915/display/intel_dp.h     | 3 +++
>  drivers/gpu/drm/i915/display/intel_dp_mst.c | 5 +++++
>  3 files changed, 10 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c
> b/drivers/gpu/drm/i915/display/intel_dp.c
> index 3703135f41e2..1e06107627bc 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -1286,9 +1286,8 @@ static int intel_dp_link_m_n_ratio(u32 link_m, u32
> link_n)
>  	return DIV_ROUND_UP(link_m, link_n);
>  }
>=20
> -static bool
> -intel_dp_can_support_m_n(struct intel_display *display,
> -			 int pixel_clock, int link_rate)
> +bool intel_dp_can_support_m_n(struct intel_display *display,
> +			      int pixel_clock, int link_rate)
>  {
>  	int max_m_n_ratio =3D intel_dp_get_max_m_n_ratio(display);
>  	u32 link_m, link_n;
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.h
> b/drivers/gpu/drm/i915/display/intel_dp.h
> index 04fae203bb69..de90296acce9 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.h
> +++ b/drivers/gpu/drm/i915/display/intel_dp.h
> @@ -239,6 +239,9 @@ bool intel_dp_joiner_candidate_valid(struct
> intel_connector *connector,
>=20
>  u8 intel_dp_as_sdp_transmission_time(void);
>=20
> +bool intel_dp_can_support_m_n(struct intel_display *display,
> +			      int pixel_clock, int link_rate);
> +
>  int intel_dp_link_init(struct intel_dp *intel_dp);  void
> intel_dp_link_cleanup(struct intel_dp *intel_dp);
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> index 7023619aaaba..ae18817b4f35 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> @@ -1565,6 +1565,11 @@ mst_connector_mode_valid_ctx(struct
> drm_connector *_connector,
>  					   min_link_bpp_x16,
>  					   bw_overhead_flags);
>=20
> +	if (!intel_dp_can_support_m_n(display, mode->clock,
> max_link_clock)) {
> +		*status =3D MODE_CLOCK_HIGH;
> +		return 0;
> +	}
> +

LGTM
Reviewed-by: Mitul Golani<mitulkumar.ajitkumar.golani@intel.com>

>  	/*
>  	 * TODO:
>  	 * - Also check if compression would allow for the mode
> --
> 2.34.1

