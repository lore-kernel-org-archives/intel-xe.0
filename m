Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3286606A320
	for <intel-xe@archiver.kernel.org>; Wed, 28 Oct 2026 13:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BHZX2V4h
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BBBA10FC70;
	Wed, 28 Oct 2026 13:44:03 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D51D110E2FC
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Oct 2026 13:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793195037; x=1824731037;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=QTnAAXYrBb5Y9/N773dnezvvG2NTAi8pMXf4OXBLSKs=;
 b=BHZX2V4hFq24/beM1CaGBzXUFcEgGRY3Gx2bDk9k8NQyBZUu7x4+h638
 dTZUxwL4he54pyDvqytJMMOB5gLnv+9hCabgJaOMsw8gA/6ah6RYrSj61
 ZOOQ2jYUHATobxli0f4O+bFY53JeuPK0eYAoR6P8wwCfwo8OdzbUzDBI1
 AcpVrjmWYiBYWIjf0szwpmsqrbE/bEJzz+4LnyJneV2YsV5g3ld5dyaLG
 p7qrZOOIbGeaUSnwSE/IhT/tLE5loLj5MGUzLInLMvekKdEjl2+2h0Evz
 l/WTDj1hi0EvtDvesj/WTTOyeGDRWxLrKNlhX3boUCuVb84E7rEIiGOip A==;
X-CSE-ConnectionGUID: zojXLhD8SCeHAWEpyxK5hQ==
X-CSE-MsgGUID: vT8+/pwzSdWM//ACpRWVaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1818637"
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="1818637"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 06:43:57 -0700
X-CSE-ConnectionGUID: 2DOWB5SpROe/YPhO54uEqQ==
X-CSE-MsgGUID: UfXAGO28SfuFOYb51XVjjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="4919367"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 06:43:57 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 28 Oct 2026 06:43:55 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 28 Oct 2026 06:43:55 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.45) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 28 Oct 2026 06:43:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rZLQ/HdKfVmghnftzyFuhpLatQ/1EUjofrBNeXlkPCxum0DhdPHefdvqmP+gU/VB2CsPdW2vrBy9KlT5TfuXDiy4Y0YX6Otz/q4bG8ga5QxEDOF/8uCM6JKH/qYx/JhUM/flvJRfZWLIkgwlMyp0c+popH0k4fC37dnFT4fHzR4rMvcmfJk/o8gSouLP1OjmsG12WyEkYpdbskOi3JnM6lctBQw3CGyB0dhRwVB5Sl68xz9LNGvLrQY3tuE/dm0CZ6pg8rGnGjZs8jD76qZRFi/PlxGT59uv3I3XxkWC1LxJcKALflx7En+UfaoIU3sE9Eo32casRWk0pYXuhQSvBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8qCLIdHnzFeOPqJSgdNmemx9KWnIiRvpctQv9UOgkRU=;
 b=LJWcfEu5fTUHN2HMmr36l4H9/qz3yWBsiZko/VskKrotwGkh8N4agUtyZMokJYjyDA12ItXcjC0tHTvGSKOqpdKRbLAbeZEmsxW+RbYscQRRYrUETbk8/mjqboZpU2quaUYD/e+JYuxtEsMGVdEJce01etuBEZ8s1oM7iOz04RZ/vc3VZu1fV3sS+rwvfgqjrwOHxGBXJQfajMR7Y3s+mTms1OQ/2gfVl2owQOR2qrXvQm1UH3OdBk3uncVsj25JrORdPalsjeG3sOaBRMD0LX2bDO9E27tNgzBO91MwDj238s52ZzKPtAe7tTQmnLKTSRJEkxHdZiXl65SsUBZWXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB8718.namprd11.prod.outlook.com (2603:10b6:8:1b9::20)
 by PH4PPFAC68B944F.namprd11.prod.outlook.com (2603:10b6:518:1::e6b) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Wed, 28 Oct
 2026 13:43:43 +0000
Received: from DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c]) by DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c%4]) with mapi id 15.21.0546.021; Wed, 28 Oct 2026
 13:43:43 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>, "Kumar G, Naresh"
 <naresh.kumar.g@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH v5 6/7] drm/xe: capture L3 node status registers in
 devcoredump
Thread-Topic: [PATCH v5 6/7] drm/xe: capture L3 node status registers in
 devcoredump
Thread-Index: AQHdYinRVibngg3/H0+1XRc2odR2m7cPa1YggAOU40A=
Date: Wed, 28 Oct 2026 13:43:43 +0000
Message-ID: <DS0PR11MB87182990D3A199417FC2F03E816F2@DS0PR11MB8718.namprd11.prod.outlook.com>
References: <20261022132957.2479469-1-naresh.kumar.g@intel.com>
 <20261022132957.2479469-7-naresh.kumar.g@intel.com>
 <DS0PR11MB8718FE2B22F02ECD15FD408581612@DS0PR11MB8718.namprd11.prod.outlook.com>
In-Reply-To: <DS0PR11MB8718FE2B22F02ECD15FD408581612@DS0PR11MB8718.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB8718:EE_|PH4PPFAC68B944F:EE_
x-ms-office365-filtering-correlation-id: 4e7c220b-5b38-46bd-4430-08df34f97b85
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|23010399003|38070700021|261026140227099003|11063799006|4143699003|261009223027099003|56012099006|261022105027099003|261021121427099003|261021135927099003|10067099003|261022075727099003|261021123027099003|18002099003|261026121527099003|22082099003|6133799003;
x-microsoft-antispam-message-info: ECe9rMpkTK8MB8tHvj1onWBEpqA8A8DJzUhc9Pc3bBf251euFH9jxKiJ/xs6Ikx+u2y8BokbvNRCkQixXNxaJmEv/Dg8vBDKxLMwrjhRMECjibHIsvr1tkUCDYJn56pEkYyJ0UI6UXvZVERXofL/a5xvI4ob5NHSO1NyHlVgu/NfWFh0gJcVWUgXLW5twmh2Q0UciOQvdtTtbZB6DLWZv3rf9xY74B8iaJkl/FEm+zo8NY1yvgmnixIM6LjLO1DCp5hrROquJPz3ixl1l3rau3G0oIZT/A1+UA+Xlj31iGz2Fev+gF87DfrTC5oza+x6F7D1kK7de18Cb4voEy4nFtrcEcyXZizmKikDcFBTpn2VlE6aN2Cb1SqewLTSfJTCpyNOrVFcloHquRWOAKNW6+vNuMwwPNGxOBrPM+msTDyvAxZQ69BKuW8Gqq+PHh1+mGHx4pUNOWa4BTXDnjeMf/5CPdej5z7coTEBPRk8weUOvmFl2ErzVhQcb1fUc3h3ZJVuWPftuIMybdCefnZ71viB/GbenrXAEwx2wgXPVufRJr+b8c9Ze4BmEcULgN5eiBDWTwDQQa0nJPuXkfmaH1oZ0zVlSbSLqmyMsB5oY/OFQ6HgtV45bBvis7cYDP8x/KMt7dHIOykEJASEqu+bpWv/Ye3jXOJ8iaIgC4ORsqI7wrs/WAwyQU/siZdEO+4mXe7qFYBKIwiPxOeDyyrNVCNRLCg/to4n2T0SACeXQ7E=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8718.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(38070700021)(261026140227099003)(11063799006)(4143699003)(261009223027099003)(56012099006)(261022105027099003)(261021121427099003)(261021135927099003)(10067099003)(261022075727099003)(261021123027099003)(18002099003)(261026121527099003)(22082099003)(6133799003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?ebyn82crc+ikn1gweRQZrbCPwZOJCKCmAtZMK1bNbyUWZpr3zoF8lefRi5?=
 =?iso-8859-1?Q?sWshNB/JWiJeH0Q/2536hXyWS+vUgok0iRjzd/VVm0h/t0KcN8zhFzNcl+?=
 =?iso-8859-1?Q?gwN616FfEfbkxKcLIWTi8XXQQPTe6avvMEjo/6jwb1HeznOnkh7VaXp1OB?=
 =?iso-8859-1?Q?FuMLlaHCdV9c9BaKhe2q9nQ/xkk93MZVqTPlIeIBbT3L9XKDrSjHSSLHLF?=
 =?iso-8859-1?Q?//caSAwCveW4rrxxT//vsiGst60Bod541YnSknZt8vnech4rgpRgq58FWY?=
 =?iso-8859-1?Q?XYa+P0VBYkJzs8+afGlYA8FbJmt5dwD9hTVJ4YrVVdKqiORxfHoeX6thkO?=
 =?iso-8859-1?Q?+OTZF9V8iU0aYIVkCaI3rFBvEaLYhXyFM4f4ItgwVAkiTG4qe61uDYOaLE?=
 =?iso-8859-1?Q?GmqGxrX7Et7v82vFJpwX3SIANwtJ+1KMdKbCN2urvBjncHds+YIE0WXc4T?=
 =?iso-8859-1?Q?34T4EuiBxHyuPlgYgzz+6m6pXoYwIZ/l2hfyTl86uEiu/ATJ+s4HprPQlm?=
 =?iso-8859-1?Q?8Y+jDcNpF3TOya6bPO1j3Y/oDJtkbRFZemvst5/aYACH4DNiL45bLtu/CG?=
 =?iso-8859-1?Q?GdnMKmqZiyceNAXE0tAwozP3Eooflq9E4MFScAI1aAkAaO5nOnBiRBQkFk?=
 =?iso-8859-1?Q?48/TcahWkZrZHMEl7RYWR6ghkSgoazu4AjHqLPFInSJEGN3N/eEtW7XjzM?=
 =?iso-8859-1?Q?ynpL/T62qoQuAwKHUo/Y7lUOnaOGj2mGmlbSKylugb3WOtvm/z5s7fW65d?=
 =?iso-8859-1?Q?89iwWHxxQtvoQHp8Moa91cYfpJt/3LiWvDzD3kItiA5bGXyZolvxIeR+ec?=
 =?iso-8859-1?Q?JIr3Kt0/+ZC4OK0T75XH8bG1oMUdsq9TVmRyMdjMLFR0vcWV7wFqdldRnR?=
 =?iso-8859-1?Q?GbC8NmE+Kdf28/ASE3ikamX3KfZhGJuRAWbrRV8+HA6gZG1kb5g99cyQ8q?=
 =?iso-8859-1?Q?/qY3lD//afwl+AegNShvDmxA5otRYVojlEWrwOhh3JVsUElid3EWtowXZP?=
 =?iso-8859-1?Q?tfrEA5fnSYCnH7O2Wn97bJp0aYEXggYJ7KxjdYh3t/dWs6I+J82P2e5Xth?=
 =?iso-8859-1?Q?2nO0cMMCiX9BxVTcSKgEzFcy+tg2Dxnf/3I0MAPtlk71ZajbjXI0AzkghZ?=
 =?iso-8859-1?Q?dhDQ0HEOS/+tPRXYJZ4aCN7Ezo4fSjom1bZ3JtMrLQOYunOIv6/GNwukKi?=
 =?iso-8859-1?Q?/pCoXYpSoaMH7RC0LLwGuyDNJiQmNjTAkLFUznuyBajBCOau9jSMbk/fEM?=
 =?iso-8859-1?Q?pFby+CWs/jmwPO0ThiiBv1HTKibcT7wwMoi3So4cRgs32wAXPBkDyY4R5O?=
 =?iso-8859-1?Q?J3pTN9sls78oDvZWgesrxSUrzj/OwYtzVa8Q2uoOVDr/XlphxnlF1/Odfw?=
 =?iso-8859-1?Q?fhod9IRsJMZq7ERd3tYCMODnGMMyDLSQMu0v5RYlM8AXI29lCy57OXdhku?=
 =?iso-8859-1?Q?MuJb2ePf6+xEQEIWJdgcsubU09CrdjzGci7AeTVawHBHMMA+orK/L1AXZv?=
 =?iso-8859-1?Q?q95hJj6caYeqwwuGcf8JF1EfcPo2lcYE+hQcFA/2gUMrlim6HMbFoaGWGu?=
 =?iso-8859-1?Q?joI6ggXO9xGMMddTBptvJ8dBwiFZDsdBglGoWKXsBxxyfKl9MTsZwcUv4Y?=
 =?iso-8859-1?Q?i8F4Q5OSwfHNyzkEEMbO12BdYN8ouL3/x5saz+k3m+S5R2eKKxJkzyjXfi?=
 =?iso-8859-1?Q?J5q5NUcMG0mZAIc0JCBRwt+CEP4wGXkeqciN0szOLFgZDugXTC8ufIFVdm?=
 =?iso-8859-1?Q?iLgZa/WyhcGJik4p29RytZdyeyT0XwigdMWg5rTvDDnESmZ0LI6RxY/EDE?=
 =?iso-8859-1?Q?rgV5U801uw=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: pqiyEz23a8XCq6UQspM++gQjUUbVcVt0N0T25gDZlx1iaVkS5MDF9yzk6phiPv14VKvhni3pfUJBJMn4eFV3OCeU0ob6PE3zPfc72hKaGFVa2Rf3gYS4N/SKtzpWg0R/2SV1PrWYzYinePuvd54lyJr/DivU59R+nqmTBT8kJShuyHfw4UWqVEYahBFVKQqc/WoRvcavEcZSJPFjr2foRMHDFmtV0bwhaP8Y6P4YVFuZUFBwHAvQja1ZM/cCTiPr+vyhuKSiI1ROIY7ruXcy1bhxquO4e98LcmP9Q+dhK1TQI9SMIMAnnerxGMc0K59Eq2X/4mGgd8RE+f2kA8dDhA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8718.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e7c220b-5b38-46bd-4430-08df34f97b85
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2026 13:43:43.3589 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Q73DjM5PPmVGgmGC7xjoRywhyipRoF73EovgyOop3fAWcmcdYTdBIHe3Puz45Y2MkI6G+35ir/H/ZARJjJ5q3M6xuYRckUGCP+JoHaL9Yc0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH4PPFAC68B944F
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
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNWANTED_LANGUAGE_BODY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



> -----Original Message-----
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of
> Upadhyay, Tejas
> Sent: 26 October 2026 12:37
> To: Kumar G, Naresh <naresh.kumar.g@intel.com>; intel-
> xe@lists.freedesktop.org
> Subject: RE: [PATCH v5 6/7] drm/xe: capture L3 node status registers in
> devcoredump
>=20
>=20
>=20
> > -----Original Message-----
> > From: Kumar G, Naresh <naresh.kumar.g@intel.com>
> > Sent: 22 October 2026 19:00
> > To: intel-xe@lists.freedesktop.org
> > Cc: Upadhyay, Tejas <tejas.upadhyay@intel.com>; Kumar G, Naresh
> > <naresh.kumar.g@intel.com>
> > Subject: [PATCH v5 6/7] drm/xe: capture L3 node status registers in
> > devcoredump
> >
> > Add L3_NODE_IDLE and L3STAT_LBCF_GFX register definitions and include
> > them in the devcoredump snapshot as a node status section.
> >
> > Extend the register descriptor to mark MCR registers so the snapshot
> > code can read them through xe_gt_mcr_unicast_read_any(), then print
> > and free the captured node status registers alongside the existing dump
> sections.
> >
> > v2:(Sashiko)
> > - change L3 node registers as XE_REG_MCR type
> > - identify mcr register type from reg.mcr
> > - As generic capture function ensure VF check this will not execute
> >   on VF Mode.
> >
> > v4:(Tejas)
> > - Add L3_NODE type into the enum as changed/added in initial patch
> >
> > v5:
> > - Rebase
> >
> > Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
> > ---
> >  drivers/gpu/drm/xe/regs/xe_gt_regs.h      |  3 +++
> >  drivers/gpu/drm/xe/xe_devcoredump.c       | 32 ++++++++++++++++++++-
> --
> >  drivers/gpu/drm/xe/xe_devcoredump_types.h | 10 +++++--
> >  3 files changed, 40 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > index 2e4cb4957479..55f0eee4e20e 100644
> > --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > @@ -454,6 +454,9 @@
> >  #define   L3_ESC_MASK				REG_BIT(0)
> >  #define   L3_ESC(value)
> > 	REG_FIELD_PREP(L3_ESC_MASK, value)
> >
> > +#define L3_NODE_IDLE
> > 	XE_REG_MCR(0xb0b0)
> > +#define L3STAT_LBCF_GFX
> > 	XE_REG_MCR(0xb128)
> > +
> >  #define XEHP_L3NODEARBCFG
> 	XE_REG_MCR(0xb0b4)
> >  #define   XEHP_LNESPARE				REG_BIT(19)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c
> > b/drivers/gpu/drm/xe/xe_devcoredump.c
> > index 9f2f46e40012..1c80cc6c3b6a 100644
> > --- a/drivers/gpu/drm/xe/xe_devcoredump.c
> > +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
> > @@ -28,6 +28,7 @@
> >  #include "xe_mmio.h"
> >  #include "regs/xe_gt_regs.h"
> >  #include "regs/xe_guc_regs.h"
> > +#include "xe_gt_mcr.h"
>=20
> Place correctly
>=20
> >
> >  /**
> >   * DOC: Xe device coredump
> > @@ -73,6 +74,7 @@
> >  #define XE_COREDUMP_TIMEOUT_JIFFIES (60 * 60 * HZ)
> >
> >  #define XE_REG_DESC(_reg, _name)	{ .reg =3D (_reg), .name =3D (_name) =
}
> > +#define XE_REG_DESC_MCR(_reg, _name)	{ .mcr_reg =3D (_reg), .name =3D
> > (_name) }
> >
> >  static const struct xe_reg_desc xe_dbg_gt_guc_reglist[] =3D {
> >  	XE_REG_DESC(GUC_STATUS,	"GUC_STATUS"),
> > @@ -119,6 +121,11 @@ static const struct xe_reg_desc
> > xe_dbg_gam_pf_reglist[] =3D {
> >  	XE_REG_DESC(PAGE_FLTRPTQ_TAIL_GAMCTRL,
> > "PAGE_FLTRPTQ_TAIL_GAMCTRL"),  };
> >
> > +static const struct xe_reg_desc xe_dbg_l3_node_reglist[] =3D {
> > +	XE_REG_DESC_MCR(L3_NODE_IDLE, "L3_NODE_IDLE"),
> > +	XE_REG_DESC_MCR(L3STAT_LBCF_GFX, "L3STAT_LBCF_GFX"), };
> > +
> >  /**
> >   * struct xe_gt_regset - Struct for register descriptor list for GT
> >   *
> > @@ -139,6 +146,7 @@ struct xe_gt_regset {
> >   * @XE_DBG_REGSET_RPM: RPM register set
> >   * @XE_DBG_REGSET_GUC: GUC register set
> >   * @XE_DBG_REGSET_GAM_PF: GAM Pagefault registers set
> > + * @XE_DBG_REGSET_L3_NODE: L3 Node register Set
> >   * @XE_DBG_REGSET_MAX: Number of debug register set types
> >   */
> >  enum xe_dbg_regset_type {
> > @@ -146,6 +154,7 @@ enum xe_dbg_regset_type {
> >  	XE_DBG_REGSET_RPM,
> >  	XE_DBG_REGSET_GUC,
> >  	XE_DBG_REGSET_GAM_PF,
> > +	XE_DBG_REGSET_L3_NODE,
> >  	XE_DBG_REGSET_MAX,
> >  };
> >
> > @@ -172,6 +181,10 @@ static const struct xe_gt_regset
> > xe_dbg_regsets[XE_DBG_REGSET_MAX] =3D {
> >  		.gt[XE_GT_TYPE_MAIN] =3D { xe_dbg_gam_pf_reglist,
> >  					ARRAY_SIZE(xe_dbg_gam_pf_reglist)
> },
> >  	},
> > +	[XE_DBG_REGSET_L3_NODE] =3D {
> > +		.gt[XE_GT_TYPE_MAIN] =3D { xe_dbg_l3_node_reglist,
> > +					 ARRAY_SIZE(xe_dbg_l3_node_reglist)
> > },
> > +	},
> >  };
> >
> >  static void xe_dbg_reg_snapshot_print(struct drm_printer *p, @@
> > -262,8
> > +275,13 @@ xe_dbg_reg_snapshot_capture_target(struct xe_gt *gt,
> >
> >  	snap->desc	=3D reglist;
> >  	snap->num_regs =3D reglist->num_regs;
> > -	for (i =3D 0; i < reglist->num_regs; i++)
> > -		snap->values[i] =3D xe_mmio_read32(&gt->mmio, reglist-
> > >regs[i].reg);
> > +	for (i =3D 0; i < reglist->num_regs; i++) {
> > +		if (reglist->regs[i].reg.mcr)
> > +			snap->values[i] =3D xe_gt_mcr_unicast_read_any(gt,
> > +								     reglist-
> > >regs[i].mcr_reg);
>=20
> The requirement calls for reading L3_NODE_IDLE once per groupid (0-7), an=
d
> L3STAT_LBCF_GFX once per every groupid=D7instanceid combination (8=D74 =
=3D 32
> reads), each explicitly steered via the MCR selector and labeled
> Node[groupid]/Bank[groupid][instanceid]. Isn't it?

Was this addressed?

Tejas
>=20
> Tejas
>=20
> > +		else
> > +			snap->values[i] =3D xe_mmio_read32(&gt->mmio,
> > reglist->regs[i].reg);
> > +	}
> >
> >  	return snap;
> >  }
> > @@ -345,6 +363,8 @@ static ssize_t __xe_devcoredump_read(char *buffer,
> > ssize_t count,
> >
> >  	xe_gam_pf_snapshot_print(&p, "GAM PF Report", ss-
> > >gam_pf_report);
> >
> > +	xe_dbg_reg_snapshot_print(&p, "Node Status", ss->ns);
> > +
> >  	drm_puts(&p, "\n**** Contexts ****\n");
> >  	xe_guc_exec_queue_snapshot_print(ss->ge, &p);
> >
> > @@ -402,6 +422,9 @@ static void xe_devcoredump_snapshot_free(struct
> > xe_devcoredump_snapshot *ss)
> >  	xe_dbg_reg_snapshot_free(ss->gam_pf_report);
> >  	ss->gam_pf_report =3D NULL;
> >
> > +	xe_dbg_reg_snapshot_free(ss->ns);
> > +	ss->ns =3D NULL;
> > +
> >  	xe_guc_exec_queue_snapshot_free(ss->ge);
> >  	ss->ge =3D NULL;
> >
> > @@ -602,6 +625,10 @@ static void
> xe_devcoredump_capture_gt_regs(struct
> > xe_devcoredump_snapshot *ss,
> >  						       other_gt,
> >
> > XE_DBG_REGSET_GAM_PF,
> >  						       XE_GT_TYPE_MAIN);
> > +	ss->ns =3D xe_dbg_gt_snapshot_capture(gt,
> > +					    other_gt,
> > +					    XE_DBG_REGSET_L3_NODE,
> > +					    XE_GT_TYPE_MAIN);
> >  }
> >
> >  static void devcoredump_snapshot(struct xe_devcoredump *coredump,
> @@
> > -653,7 +680,6 @@ static void devcoredump_snapshot(struct
> > xe_devcoredump *coredump,
> >  		if (job)
> >  			ss->job =3D xe_sched_job_snapshot_capture(job);
> >  		ss->vm =3D xe_vm_snapshot_capture(q->vm);
> > -
> >  		xe_engine_snapshot_capture_for_queue(q);
> >  	}
> >
> > diff --git a/drivers/gpu/drm/xe/xe_devcoredump_types.h
> > b/drivers/gpu/drm/xe/xe_devcoredump_types.h
> > index 34f224a6751f..6cbecad43c42 100644
> > --- a/drivers/gpu/drm/xe/xe_devcoredump_types.h
> > +++ b/drivers/gpu/drm/xe/xe_devcoredump_types.h
> > @@ -21,8 +21,12 @@ struct xe_gt;
> >   * of the register to dump its value during coredump for debug purpose=
.
> >   */
> >  struct xe_reg_desc {
> > -	/** @reg: The register */
> > -	struct xe_reg reg;
> > +	union {
> > +		/** @reg: The register */
> > +		struct xe_reg reg;
> > +		/** @mcr_reg: The mcr register */
> > +		struct xe_reg_mcr mcr_reg;
> > +	};
> >  	/** @name: Name of the register */
> >  	const char *name;
> >  };
> > @@ -105,6 +109,8 @@ struct xe_devcoredump_snapshot {
> >
> >  	/** @gam_pf_report: GAM PF report snapshot */
> >  	struct xe_dbg_reg_snapshot *gam_pf_report;
> > +	/** @ns: Node status snapshot */
> > +	struct xe_dbg_reg_snapshot *ns;
> >
> >  	/** @ge: GuC Submission Engine snapshot */
> >  	struct xe_guc_submit_exec_queue_snapshot *ge;
> > --
> > 2.43.0

