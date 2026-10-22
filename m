Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32A5C606A319
	for <intel-xe@archiver.kernel.org>; Thu, 22 Oct 2026 01:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=B3nR/Dd+
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C263E10E123;
	Thu, 22 Oct 2026 01:28:15 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A79E610E061
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Oct 2026 01:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792632489; x=1824168489;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=oKZx0n9AUObGlt/666qSFPgZA1vrN7saJQewmx/gXTs=;
 b=B3nR/Dd+Q9wHYSIoigL6klaPBNu/8TuMfKUyAWbwl6cV/ekQ/IfnQDYO
 AoQFJIyGLLw0iQUwtay3kF5yEYKcYMg6xiQISLuZjsTfbx4cN4EJVEvci
 Y6EGMVwXL1Ss/KahD92T7m2w5dQfCIOA6qCNayZjN5BP8SOpvxWW6kx0e
 x2niZbVFnPIzYVdm+EztPx2EXeFWMAwCP51DlkwCnCvt/axMfx8FFBd/P
 h+9i1b+ks/Z6hZLKlsXlaKFYazNV6k2mAfttWB+xK+eoAB9JIjUtqLU5Q
 bvzdwCmqJnrVDg/uU7qum+Jg5k4qTw9b7FpFCJfROkJ2h04APiXmWui/j g==;
X-CSE-ConnectionGUID: 5ejELZLDTHGG0gxF6LCN+g==
X-CSE-MsgGUID: gFk/1uTbR1mZVgdKLokwcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1406714"
X-IronPort-AV: E=Sophos;i="6.27,171,1787036400"; 
   d="scan'208";a="1406714"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2026 18:28:09 -0700
X-CSE-ConnectionGUID: NJbOU1oPRr+xeWdnzimmgg==
X-CSE-MsgGUID: EjEKm9AhTxej1JLTZe5u+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,171,1787036400"; 
   d="scan'208";a="3234957"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2026 18:28:09 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 21 Oct 2026 18:28:08 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 21 Oct 2026 18:28:08 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.35) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 21 Oct 2026 18:28:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sa0/7wFes68cDTQkcmk6YzlCKU9j/gXfbIXYL+bRqPpczAKjGtf1U+LCEznN3vwnT+5jptJE3EcsK9r/vf/+rvP3lhT4TgNBNNNTA2KbioOas6CsKnp8Jhd03iIzZWtLJgf5vfFkgiX2tBbUQ1C1sJfQPSscMnEiTupqkELTSfBpVhQ3vLKi9Dw8GH7MU0/3Yc0H7qoM9oYWuT5wzKUmCzE0dcWj8lkO6iAD/0jcopJUkdR9ZyILRYWVMM17kRJN/8SL1oHNVL6sm57zDes2VjusK/L72dbGjRWhTgodV8lQ1J5yLm9P1b3to77hu5FAR4/HgyJ7VslccV8Rmd5PEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KVZySkyd/BdBBX+0fBfrhPt41fHXqDGOB1FLydUkBwY=;
 b=xOhxcs1F8n8X3lVwQHagoGDw5qTB7Up4P6Pm1eWXe3wmnU/fQPlG1LNYWQAr2Ba75NtHiOKA/bi8LZkSY31a8B8NgxbrHPB2K5GA2f67m59SRl8d8SjMQckqlCUS+FwYQDuHbG7jugCDryQo/WlJhF2zYgWAaZpZW5LSo3KbhiBfftz+cOWnnmEbzMpJU7Yaoy/LPiQ984T3h/0UQ2kWrBsR1heVQZon34JHK7jp9tZEGma20McjfaiGtQHtW7IIfUiEnqnZIGntCufEKp2JisHx94scq8gFHhnEuYA5TO6An30+QJn9Smtyg+oClVXLNC7HRyJfo/blK7n6PC1eCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PR11MB131308.namprd11.prod.outlook.com (2603:10b6:8:502::7)
 by SN7PR11MB6946.namprd11.prod.outlook.com (2603:10b6:806:2a9::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Thu, 22 Oct
 2026 01:28:06 +0000
Received: from DS4PR11MB131308.namprd11.prod.outlook.com
 ([fe80::40c0:7a50:a98c:8920]) by DS4PR11MB131308.namprd11.prod.outlook.com
 ([fe80::40c0:7a50:a98c:8920%6]) with mapi id 15.21.0546.012; Thu, 22 Oct 2026
 01:28:06 +0000
From: "Tangudu, Tilak Tirumalesh" <tilak.tirumalesh.tangudu@intel.com>
To: "Sousa, Gustavo" <gustavo.sousa@intel.com>, "Belgaumkar, Vinay"
 <vinay.belgaumkar@intel.com>, "Lin, Shuicheng" <shuicheng.lin@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Roper, Matthew D" <matthew.d.roper@intel.com>
Subject: RE: [PATCH 2/2] drm/xe: Add wa_14025941587 to xe2, xe3 and xe3p
 platforms
Thread-Topic: [PATCH 2/2] drm/xe: Add wa_14025941587 to xe2, xe3 and xe3p
 platforms
Thread-Index: AQHdRcMw0tThOXpy7UShGuGSb8mrZLcIilmAgABxwdA=
Date: Thu, 22 Oct 2026 01:28:06 +0000
Message-ID: <DS4PR11MB131308CE13341A61366FECD6B2C8652@DS4PR11MB131308.namprd11.prod.outlook.com>
References: <20260916100545.779894-1-tilak.tirumalesh.tangudu@intel.com>
 <20260916100545.779894-3-tilak.tirumalesh.tangudu@intel.com>
 <87cxt2ewb6.fsf@intel.com>
In-Reply-To: <87cxt2ewb6.fsf@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PR11MB131308:EE_|SN7PR11MB6946:EE_
x-ms-office365-filtering-correlation-id: 6699af83-06ec-4598-4dce-08df2fdbb94b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|23010399003|1800799024|260925021311599003|260925021911599003|22082099003|18002099003|261021123027099003|260925022911599003|10067099003|11063799006|261009223027099003|4143699003|261021121427099003|38070700021|56012099006;
x-microsoft-antispam-message-info: FPD5N/eAiNM07rqciE7BGKnGflv7HvSVTsLCtZbCHKqvfsvMnrqcb0/+eiZ1sLvPLJrGcvJHDhnbxvQL2eMCWhzTouc9Pl4UVKI+Vjjkl5NFxogVfZovDMfl9SqH+V/tObxWJISOZVpuXUT4Ons7nMomFhEjta10A4jtdTQ4PM+3a02Cb5+R2P4hIDKW/+7JiYY8fgcOXRrCYhg5uSRf72AlS2zkVUw1RQsVj3IWexCr/MopRZ1zi+O0Rd/1roBwdHdJV76FGTNyCPKMNKjeWo8hoY/eDne2PITTW9tCT0hZmRw20sXVXhmMimyur1Bu1Zfg6ybI+dx4TOOhS/4o530TZ8j+viblrdZh4gYhF5R+99ibXBXIaCZmuO+XWaZrxXw5VJmldFnmtlAcANTuNkZq+LsX9ObhN0jXGejclL6936MXPBNwWNjb2WwAWxDzdSckNTo+cq4EC/jmQcdVGz4PZYSquMvPieJcEGNZhdqQA9m+CAwTgvwfraa6SGiJujOR7F42zVHMrcSRXmMhcPufMZ3ef7qHs64q3oz1GSqnnMq1utDycBuBCgbgXtXKbIK16HZu1AbeGmiJxTgKzUqyDmaU//w8S5PGHLyVyfuWR+L9/RjDqdnS+lMpE/vBiOhYrEZK8fnkAU6llPIvZEVwNKfeMGUhL8vMsw1MRgB4k3bV7GR41+BsRXctjDZrYlfmJXNGR5LWGVFsdD5Wths5kWT7AoMlAipHM+CeTUk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PR11MB131308.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(260925021311599003)(260925021911599003)(22082099003)(18002099003)(261021123027099003)(260925022911599003)(10067099003)(11063799006)(261009223027099003)(4143699003)(261021121427099003)(38070700021)(56012099006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?udELSQvVk2KCV7jjaiFc3nHWr6xbJwE592l6iwuZgjzpMD9i01ZbJ9ZUBS1R?=
 =?us-ascii?Q?XcsmIIDR0/tUkCVmwtl9iS4+N06e5+nLHW7Xp1NTC68lP/n0f0s88e2XET1B?=
 =?us-ascii?Q?I/5NWhlC1z1/SwAoyjQNyx7qOIVXl5SA1kW4yhMnrvzntiR3mkXVjnyFbqZk?=
 =?us-ascii?Q?9ZFoWwSQGpQjPetMngBkDT8uCtPi37woVPvDbPcXJCxD6la2mKHY1Pakzqz6?=
 =?us-ascii?Q?9wu4uWhmmRLZtuQjrP1tfsFf4S3CLTWXV/IJxJDPxYTtvuXDsMaD36FlQzOt?=
 =?us-ascii?Q?FvpSAs6YKGeYnUxfEHnI6VE/Gmt+QtWKrdxX9FyEO9QABPKtbUwbuNzwcjpL?=
 =?us-ascii?Q?PQobwaqJ2ef7T4db1bTZoY3SckfVrz9rV+99o6NiLysrASO/KMbJgPriZB52?=
 =?us-ascii?Q?tmpRPuJFyzoRVZCvOGWKNH6DWUbXHXKAuP5T4Scwn50ISvk+ERyP2o38mT0q?=
 =?us-ascii?Q?ZatnFXozbimILY2uJidM5ZzMH1iotNg0SNLk49hRB7HrVDWqEzKwW0Ay4ivh?=
 =?us-ascii?Q?i2xofojsJt6B2ujF/t08t6JiD3ZkzuNzEYbzFHMK9b756TxXz/1p4r10ZZWp?=
 =?us-ascii?Q?fjqlOgpGc4qbd7leLa/PPCVKH9psIEHaNjZs6NXjGjMxt9z2suriHjxyBZFA?=
 =?us-ascii?Q?XqLUZKETe6l3XLDoBwMVBtmAfnGoAUmoyr2ARfKJzuBQXXmuR01/Ds0oCsTP?=
 =?us-ascii?Q?94KkNisL+O/nDYw+49Pb+z8uSIsA4/3O2YGVCbYXoUlIqZLNfwa/I9kOzwqA?=
 =?us-ascii?Q?lpEIJI872k8kq9foP36r3UyBWZ6ZFeYOaUxGVG8939uVeOZH8y0bIu+UcpI6?=
 =?us-ascii?Q?54//9nN3xqOIu9XdKc2FEwV0A6Dc9hXye6oyRqiL/vdRv4P4Ff6ue3n4WfhD?=
 =?us-ascii?Q?LME24rA/OyoLi098/j32jO2KxC+0h9zG6F4x/J+sn0YU5TOtBzsyw56J7fBr?=
 =?us-ascii?Q?6vh9a9VT4UHUHLUyhwWLMiGA8+1dgeARc3w1lcEJMMwEcOyHVu/3q8ZfngEF?=
 =?us-ascii?Q?D4YhyH4K99Rw6Et1T1SuvCgOYi88wlrA9AVPmxyZEvwn7fjEBobbAeQp19D5?=
 =?us-ascii?Q?llhchwPiu1W9lDog3r4XkMmVEmwq2t+3V+506+xqgvx78UcXbZv9NUNOGWpO?=
 =?us-ascii?Q?OXSLP+/gsxGIiNwZjoFbW4PJk2OrUUnvazgV24tyPNPhktLzr9C2YMHr7H3y?=
 =?us-ascii?Q?FhuHfbZS5nWg5FQpoQFUu5wdIKjhFEaKGHsabcj7v0N80UJhAvM2Ufu8uue2?=
 =?us-ascii?Q?oqYAzHOx+mrUTuQBKpdNPvoI6Bf+z0+wbkDoHL86RL98pscyQ6/dGKnjb7xR?=
 =?us-ascii?Q?MnF+FVE2zZmI1++J3NnXQqPjOepO7vHr+yRByYQLR16exQ6CHUrJTtt2ERVd?=
 =?us-ascii?Q?mswTOdcsvFobECzKWsKyV14PFoc4bUTgSu+VNkkaoMGCwJwjQzszqatZlZmh?=
 =?us-ascii?Q?SOlSaZ/Gz18qQkjnSMCswKs6V8wv2L/29YE//iIEUmg+nRsDa8KnXvywdIRD?=
 =?us-ascii?Q?9fqv5sOZ3KccIaBkAwxqXQhDxpQcdUbjFOrEv4fE2BsJ2Ed+NikjRFGq+hzH?=
 =?us-ascii?Q?vvbNLDnftaTL8gVCx3MoZfXYN4BlOfhOxn7sCf30DtRHyhQY816gMwIq7mQM?=
 =?us-ascii?Q?WGzNrYwmD2R8CTtDFuM1eMwNcNhj5AWvZgz7TJYM/Wnnqhi7tJ99fGg/PmR4?=
 =?us-ascii?Q?ORgk5wiaxHNZSpvtvir0usbxxGISWjVUEbpqsvxTC5qMLf0LIcY50s6S/sOk?=
 =?us-ascii?Q?5NzYtd5eQkJr8b2YVQcV7KRp2qFtef0=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: VK+u0UM+3jyYTKbVhP4eUaHxbtLKe0PGAmI3AeDqWWwrAHtTZGmHOtNr6WdGC/xS4+wBYO03CHlzMrZVj74zXHbyjxMRmtYcnU3pytRUCTFK6stiAzmVeFZjoQHQXVJkXZ25yBuHMxM2VgU8FKMQFpdjVnBwtOh65iTEjrcwaBsIu0xjEPuE35iZpQNEQJJwefRNfL83OIFfbnNKIE1hUiRx1upBNi0VmLIvE+i86oLxzUqNF4A7KdIlqGbqXFbOBiWaa2xNQ5O7ySueqop5zyajnn+DcY8p6yLpiRGRXAOTqiWF5SeycpdK8Tzgq4L8xIQsXMrcbwI4mX12fbdCsQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PR11MB131308.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6699af83-06ec-4598-4dce-08df2fdbb94b
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2026 01:28:06.2588 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2mzlUD2pZdotbrL1UoxIzOaUuADJcuMVl8trHir/Ea8Ae2NdIBzRNXg+FgHNwJepN3Vx2HnQ5lYyZU+cxkMgPzVr2Mya8wjgZzrP4E1fhhy0/olWobfwTkPgLHMHmK2t
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6946
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



> -----Original Message-----
> From: Sousa, Gustavo <gustavo.sousa@intel.com>
> Sent: 22 October 2026 00:05
> To: Tangudu, Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>;
> Tangudu, Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>;
> Belgaumkar, Vinay <vinay.belgaumkar@intel.com>; Lin, Shuicheng
> <shuicheng.lin@intel.com>; intel-xe@lists.freedesktop.org
> Cc: Roper, Matthew D <matthew.d.roper@intel.com>
> Subject: Re: [PATCH 2/2] drm/xe: Add wa_14025941587 to xe2, xe3 and xe3p
> platforms
>=20
> tilak.tirumalesh.tangudu@intel.com writes:
>=20
> > From: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>
> >
> > Avoid programming the IDLEDLY timer to less than 5 microseconds.
> > Apply wa_14025941587 to Graphics Versions 20.01 to 35.11 and Media
> > Versions 13.01 to 35.03
> >
> > v2: Use xe_rtp_match_not_sriov_vf, move to local variable
> >     Remove warn and other knits            - Matt R
> >
> > v3: Add verbose comment - Tejas
> >
> > v4: Restore IDLE_DLY register on engine reset.
> >     Add it to GUC save-restore list. -Vivek
> >
> > v5: Extend WA to Media Versions 13.01 to 35.03 - Vinay
> >
> > v6: Avoid clearing inhibit switch - Bala
> >     Refactor code accordingly by adding idle_reg_val.
> >
> > v7: Rebased with the divide-by-zero/overflow guards living in
> >     a separate hardening patch.
> >
> > v8: Preserve the Wa_16023105232 floor (DIV_ROUND_DOWN_ULL) and the
> >     maxcnt =3D=3D 0 guard from the hardening patch. Round up
> >     (DIV_ROUND_UP_ULL) the Wa_14025941587 minimum conversion
> instead,
> >     so the tick-quantized delay cannot round back below 5 us.
> >
> > v9: Evaluate the Wa_16023105232 xe_gt_WARN_ON() against the value
> >     read from hardware instead of the Wa_14025941587-bumped value,
> >     so it no longer fires on the driver's own floor. Re-check the
> >     rounded-up tick value against maxcnt and floor it if tick
> >     quantization pushed it back to/above maxcnt, logging via
> >     xe_gt_dbg since this is the driver's own value, not a hardware
> >     anomaly.
> >
> > Assisted-by: GitHub_Copilot:claude-opus-4.8
> > Signed-off-by: Tangudu Tilak Tirumalesh
> > <tilak.tirumalesh.tangudu@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_guc_ads.c    |  2 +-
> >  drivers/gpu/drm/xe/xe_hw_engine.c  | 93
> > ++++++++++++++++++++++++------  drivers/gpu/drm/xe/xe_wa_oob.rules |
> > 2 +
> >  3 files changed, 79 insertions(+), 18 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c
> > b/drivers/gpu/drm/xe/xe_guc_ads.c index ff8eee3831aa..58a3f6293ce4
> > 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> > @@ -864,7 +864,7 @@ static unsigned int guc_mmio_regset_write(struct
> xe_guc_ads *ads,
> >  		}
> >  	}
> >
> > -	if (XE_GT_WA(hwe->gt, 16023105232))
> > +	if (XE_GT_WA(hwe->gt, 16023105232) || XE_GT_WA(hwe->gt,
> > +14025941587))
> >  		guc_mmio_regset_write_one(ads, regset_map,
> >  					  RING_IDLEDLY(hwe->mmio_base),
> >  					  count++);
> > diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c
> > b/drivers/gpu/drm/xe/xe_hw_engine.c
> > index d868af8e3301..9680d2a5adec 100644
> > --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> > +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> > @@ -585,44 +585,103 @@ static void hw_engine_init_early(struct xe_gt
> *gt, struct xe_hw_engine *hwe,
> >  	xe_reg_whitelist_process_engine(hwe);
> >  }
> >
> > +static u32 idledly_floor_ticks(u32 idledly_ns, u32 idledly_units_ps)
> > +{
> > +	return DIV_ROUND_DOWN_ULL((u64)idledly_ns * 1000,
> idledly_units_ps);
> > +}
> > +
> >  static void adjust_idledly(struct xe_hw_engine *hwe)  {
> >  	struct xe_gt *gt =3D hwe->gt;
> > -	u32 idledly, maxcnt;
> > +	u32 idledly, idledly_hw, idledly_reg_val, maxcnt;
> >  	u32 idledly_units_ps =3D 8 * gt->info.timestamp_base;
> >  	u32 maxcnt_units_ns =3D 640;
> > -	bool inhibit_switch =3D 0;
> > +	bool inhibit_switch =3D false;
> >  	bool wa_applied =3D false;
> > +	bool clamped_below_maxcnt =3D false;
> > +
> > +	if ((!IS_SRIOV_VF(gt_to_xe(gt)) && XE_GT_WA(gt, 16023105232)) ||
> > +	    XE_GT_WA(gt, 14025941587)) {
>=20
> Hey, eveyone.
>=20
> I came across this recently I was wondering why Wa_14025941587 doesn't
> check for SRIOV as done for Wa_16023105232.
>=20
> I think VF doesn't have access to the IDLEDLY register.
>=20
> I'll be changing this section of the driver soon.  I could send a patch m=
aking
> sure that we bail early if on a VF.
>=20
> --
> Gustavo Sousa
The patch has rtp func guard below in oob rules, this should be sufficient =
right ?

8< -----------------------
> > +14025941587	GRAPHICS_VERSION_RANGE(2001, 3511),
> FUNC(xe_rtp_match_not_sriov_vf)
> > +		MEDIA_VERSION_RANGE(1301, 3503),
> FUNC(xe_rtp_match_not_sriov_vf)

------------------------- >8
-Tilak
>=20
> > +		u32 mincnt_idledly_ns =3D 5000;
> >
> > -	if (!IS_SRIOV_VF(gt_to_xe(gt)) && XE_GT_WA(gt, 16023105232)) {
> >  		/* xe_gt_clock_init() warns and zeroes timestamp_base on
> unknown crystal clock. */
> >  		if (!idledly_units_ps)
> >  			return;
> >
> > -		idledly =3D xe_mmio_read32(&gt->mmio, RING_IDLEDLY(hwe-
> >mmio_base));
> > +		idledly_reg_val =3D xe_mmio_read32(&gt->mmio,
> > +RING_IDLEDLY(hwe->mmio_base));
> >  		maxcnt =3D xe_mmio_read32(&gt->mmio,
> > RING_PWRCTX_MAXCNT(hwe->mmio_base));
> >
> > -		inhibit_switch =3D idledly &
> INHIBIT_SWITCH_UNTIL_PREEMPTED;
> > -		idledly =3D REG_FIELD_GET(IDLE_DELAY, idledly);
> > +		inhibit_switch =3D idledly_reg_val &
> INHIBIT_SWITCH_UNTIL_PREEMPTED;
> > +		idledly =3D REG_FIELD_GET(IDLE_DELAY, idledly_reg_val);
> >  		idledly =3D DIV_ROUND_CLOSEST_ULL((u64)idledly *
> idledly_units_ps,
> > 1000);
> > +		idledly_hw =3D idledly;
> >  		maxcnt =3D REG_FIELD_GET(IDLE_WAIT_TIME, maxcnt);
> >  		maxcnt *=3D maxcnt_units_ns;
> >
> > -		/* Clear the inhibit switch without disturbing a valid delay. */
> > -		if (inhibit_switch)
> > +		/*
> > +		 * Wa_14025941587 is applied before Wa_16023105232,
> which takes
> > +		 * priority if the two ever conflict (not expected in practice).
> > +		 */
> > +		if (XE_GT_WA(gt, 14025941587) &&
> > +		    idledly < mincnt_idledly_ns) {
> > +			idledly =3D mincnt_idledly_ns;
> >  			wa_applied =3D true;
> > +		}
> >
> > -		if (xe_gt_WARN_ON(gt, idledly >=3D maxcnt)) {
> > -			/* Floor below maxcnt; write 0 to still clear the inhibit
> bit. */
> > -			idledly =3D maxcnt ?
> > -				DIV_ROUND_DOWN_ULL((u64)(maxcnt - 1) *
> 1000,
> > -						   idledly_units_ps) : 0;
> > -			wa_applied =3D true;
> > +		if (XE_GT_WA(gt, 16023105232)) {
> > +			/* Clear the inhibit switch without disturbing a valid
> delay. */
> > +			if (inhibit_switch) {
> > +				idledly_reg_val &=3D
> ~INHIBIT_SWITCH_UNTIL_PREEMPTED;
> > +				wa_applied =3D true;
> > +			}
> > +
> > +			/* Warn only on the value read from hardware. */
> > +			xe_gt_WARN_ON(gt, idledly_hw >=3D maxcnt);
> > +
> > +			if (idledly >=3D maxcnt) {
> > +				/* maxcnt may be 0 if IDLE_WAIT_TIME is
> unprogrammed. */
> > +				idledly =3D maxcnt ? maxcnt - 1 : 0;
> > +				clamped_below_maxcnt =3D true;
> > +				wa_applied =3D true;
> > +			}
> >  		}
> >
> > -		if (wa_applied)
> > -			xe_mmio_write32(&gt->mmio, RING_IDLEDLY(hwe-
> >mmio_base),
> > -					REG_FIELD_PREP(IDLE_DELAY,
> idledly));
> > +		if (wa_applied) {
> > +			u32 idledly_ticks;
> > +
> > +			/*
> > +			 * Wa_16023105232 requires idledly < maxcnt, so
> floor
> > +			 * that clamp; otherwise round up to guarantee the
> > +			 * Wa_14025941587 minimum survives tick
> quantization.
> > +			 */
> > +			if (clamped_below_maxcnt)
> > +				idledly_ticks =3D idledly_floor_ticks(idledly,
> idledly_units_ps);
> > +			else
> > +				idledly_ticks =3D
> DIV_ROUND_UP_ULL((u64)idledly * 1000,
> > +
> idledly_units_ps);
> > +
> > +			/*
> > +			 * Tick quantization can still push the rounded-up
> value
> > +			 * to/above maxcnt; re-floor here so
> Wa_16023105232 keeps
> > +			 * priority even in that case.
> > +			 */
> > +			if (!clamped_below_maxcnt && XE_GT_WA(gt,
> 16023105232) &&
> > +			    (u64)idledly_ticks * idledly_units_ps >=3D
> (u64)maxcnt * 1000) {
> > +				xe_gt_dbg(gt, "idledly %s: %u ticks would
> exceed maxcnt=3D%u, so flooring\n",
> > +					  hwe->name, idledly_ticks, maxcnt);
> > +				idledly =3D maxcnt ? maxcnt - 1 : 0;
> > +				idledly_ticks =3D idledly_floor_ticks(idledly,
> idledly_units_ps);
> > +			}
> > +
> > +			idledly_reg_val &=3D ~IDLE_DELAY;
> > +			idledly_reg_val |=3D REG_FIELD_PREP(IDLE_DELAY,
> idledly_ticks);
> > +			xe_gt_dbg(gt, "idledly %s: set %u max=3D%u inh=3D%u
> ts=3D%u\n",
> > +				  hwe->name, idledly, maxcnt,
> > +				  !!inhibit_switch, gt->info.timestamp_base);
> > +			xe_mmio_write32(&gt->mmio,
> > +					RING_IDLEDLY(hwe->mmio_base),
> > +					idledly_reg_val);
> > +		}
> >  	}
> >  }
> >
> > diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules
> > b/drivers/gpu/drm/xe/xe_wa_oob.rules
> > index dd69ad07f7a9..3001155f8d09 100644
> > --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> > +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> > @@ -72,3 +72,5 @@
> >  16029897822	MEDIA_VERSION(3500)
> >  		GRAPHICS_VERSION(3510)
> >  14027054324	GRAPHICS_VERSION(3511)

> > +14025941587	GRAPHICS_VERSION_RANGE(2001, 3511),
> FUNC(xe_rtp_match_not_sriov_vf)
> > +		MEDIA_VERSION_RANGE(1301, 3503),
> FUNC(xe_rtp_match_not_sriov_vf)


> > --
> > 2.46.0
