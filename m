Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9894F606A31A
	for <intel-xe@archiver.kernel.org>; Fri, 30 Oct 2026 06:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=i4QXwrMV
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 609C410E82D;
	Fri, 30 Oct 2026 06:54:15 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 559A910E82C
 for <intel-xe@lists.freedesktop.org>; Fri, 30 Oct 2026 06:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793343249; x=1824879249;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=qW0aDohXlYxZUqGCz6X8Dbkv+4JLbuW9PqoPVEhs0t0=;
 b=i4QXwrMV224rCuVNn2AhLWH0xxKdtyBGZwy5zGOqEbVKfghPxV8YV0FI
 ybXoOWjyjpxptaIKKx1A8gudw7V04tA7i8uE+bDMJzi/zVmGp3fR2hcgW
 pZVMCcfQEH0+Grs8nYtuyRuuU6sCaMS8OO4x7KwP8AgbjFNznrjENxWli
 iqK5BDGF3AjYiK60VdMb7OSaytNuY3twC4gvd5XVSkHCKgY+ofXPXOMYn
 cNCaTaVWBDXvKC2Jz3NbyAFWY5laDxzfL7n+XELTvKZqWtlpLhOpsalPZ
 aeP3PmHzAIyRrZEtIB3ku3asebM5rLjVES5srI78kRor+fi04LgjK92qZ w==;
X-CSE-ConnectionGUID: HVaA1qRERdeyWy43VkFagA==
X-CSE-MsgGUID: LnBcxAOjSmGNemX0nmJFxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11950"; a="2014899"
X-IronPort-AV: E=Sophos;i="6.27,185,1787036400"; 
   d="scan'208";a="2014899"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2026 23:54:08 -0700
X-CSE-ConnectionGUID: yq9ENMUbRZGi0zRSqN4IqA==
X-CSE-MsgGUID: G/SziaQrQjejvWTU/Vdmow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,185,1787036400"; 
   d="scan'208";a="5681071"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2026 23:54:07 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 29 Oct 2026 23:54:07 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 29 Oct 2026 23:54:07 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.54) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 29 Oct 2026 23:54:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MLlxpgk2Vzb2uN4HcjEiZzPvc3dcKyqKN8dXk3AOhsUg4eHO5RidXsjix1XrvVq9+qpzozyVZv1HrYPlurMN/UyV7YMwwP9PGH7z/r0CFVtiy/omby5fH+PHTQUW8G4xeUES9f0AWNnS8XjWHFVTqNk3dJlPsrSN2HCLy5kYsZXJ2Qo2PlBy23O1Hcm5kJDHT11GFfULB2qIiihslXTMLu6sz+NVwcMEvi5hk1KQ4XotbbJeCFRJzzK74SzL3KqghRZmr1KHQG8anoR7AKDwfkt6Wna2yzzr28fxvdLI8wKA081/6gYSSXeLdvO4Db5Te4HqncP/b6gAvr3/kxpu2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nZ+RbNidmur9tOv0K7q9mUjsvLDcHiz8r9Gl39APo+A=;
 b=FOmAzFlNRO94gscXQ+BvNnWZiBZ3asa2Le2Dcn1wbLz0tzj7RJyDRE2B2psvJ+w/GEUEapUI9QLN/nkXiPch9+To54P/Gt3f9B0eV9B+RjJKNxohBxN/QZQlAv9npFmZ4vgXivw6nFmQljTzB9sfAbTUYYODeqOHEulwSXYe3Z6Q9AbgH/nZGe6F4toYyRniJMn8BlXh0/98M+hNxEthFDrUGoInNTu2fwmSrA5PMDs1akzLkpUerO8UhhqWJs6w4CWwkm+tiWuqZPcRu0+q53RUCVbaD2ERS7riWrZZCnImcaDLzFdY0NnqjqaL8LR+7xwrrlQKNXnIr5NibTBjhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB8718.namprd11.prod.outlook.com (2603:10b6:8:1b9::20)
 by PH0PR11MB4901.namprd11.prod.outlook.com (2603:10b6:510:3a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Fri, 30 Oct
 2026 06:54:05 +0000
Received: from DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c]) by DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c%4]) with mapi id 15.21.0569.008; Fri, 30 Oct 2026
 06:54:05 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Kumar G, Naresh" <naresh.kumar.g@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH v7 6/7] drm/xe: capture L3 node status registers in
 devcoredump
Thread-Topic: [PATCH v7 6/7] drm/xe: capture L3 node status registers in
 devcoredump
Thread-Index: AQHdZ8tP7pnRHg4JBEeK1eZG2GAk2LcVpzNw
Date: Fri, 30 Oct 2026 06:54:05 +0000
Message-ID: <DS0PR11MB8718CAD46DA8EDC02FABA456816D2@DS0PR11MB8718.namprd11.prod.outlook.com>
References: <20261029172800.2150325-1-naresh.kumar.g@intel.com>
 <20261029172800.2150325-7-naresh.kumar.g@intel.com>
In-Reply-To: <20261029172800.2150325-7-naresh.kumar.g@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB8718:EE_|PH0PR11MB4901:EE_
x-ms-office365-filtering-correlation-id: 39a9b4cd-e55f-4d8f-dc4c-08df365296a4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|23010399003|376014|1800799024|261026140227099003|6133799003|18002099003|22082099003|261028144727099003|10067099003|56012099006|11063799006|261021135927099003|261021123027099003|261022105027099003|261022075727099003|261021121427099003|261009223027099003|4143699003|38070700021;
x-microsoft-antispam-message-info: wcfzGQMIRfdfWvqaDZwwhZkqx9I84ue6d5YNQwqPwH4CHhzTw+8vtKclH8BGvMDca6ro7kkaIByaC4067qyuJwTd5TbBVSnFXpacXFaMUE/OQ5KG31idRtH0NabW74DwQa8t4UYd9SVYKuOJcxtjYPySAjTIx9nJZ5z2VNTFfzLD6qEpvba7YTkl3M3nj8auFJEKWRG/ErXYQ6OeK9J1Yy3brtljPRSdy23P4dk9bLoWfmgy4RfQ+BNiygWQx/5LgSOCwXqoUglrIAHzXv1zSA8KTRTgfMbTi2xFX2k3kIYbinnaiMzmNoRqSMjHOEpYzfCEgQbk4HUIQb8/qfeqCQDrcworJv8wEx+MId6OZwl2xDELUJvUAcJR+IZaN1NagXIpIQD36BtLZl/OswjbGJPVkFUVyoR9YVrXJpqm78NycFFP3yCnN1BQQzP8WQkbI1RqCGC6q6xMxlW/cRNlG43bPA32Z+Cdy25KfKdWR/Lm126YQueIpXcuLPjW3fI3Mc2QHPvAMezbddp+3UQpjaAFLzNR16ntcHOO7dyjyAOVhWBzFGYoJWv8IPigCnqoDmPr97rsttKiQehgGUl5qFofo3H54WwDYSGpb+oOoreCuQTRLYjfssA6JW+lxTQE1e1c7WmkJD+bIzJe4CD19fJqF7C/HBpqP7850dPtwXVicpxBlTPPoYWm/Uva+N2MmH+/8cwZXYItC5nqsOGpwru49g13bM8lVxEG226n5ao=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8718.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(261026140227099003)(6133799003)(18002099003)(22082099003)(261028144727099003)(10067099003)(56012099006)(11063799006)(261021135927099003)(261021123027099003)(261022105027099003)(261022075727099003)(261021121427099003)(261009223027099003)(4143699003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Q7rZ1z7BjJ9M/VKlgJzULsy+ORueqrnjWZM3LlibaW3SlRivGd1O2g2kOcYZ?=
 =?us-ascii?Q?hxxtgg0ygmczyFwFdcaTWGmM+XrlHuPrfA5cA5eXRfQfrRjLVbgNwmM5plHR?=
 =?us-ascii?Q?m+ONabpYfvUVjk1zI7yFjSxngJDGhw/Ix435R4SLwCZ9WvwdX61K4G8oMMJu?=
 =?us-ascii?Q?Jwu0QqhMQWck+mfUFHX5gfbPYACFrLRXnFSLieV1BZXAg7lN9y31eJKq9f12?=
 =?us-ascii?Q?IxTLb5kGO83ak6cGCgF58qzG1OJ75Q5Venj4fsNWob+EQ2rtphccFuvRhu5o?=
 =?us-ascii?Q?/medXjd0TTrIJDtS791OvRlvZRXgS9VYpslIK2AehwWItXT9Q0wutRJ+RvhZ?=
 =?us-ascii?Q?VdXy2l9hsc415vV3KgiZdLmY0e7WypNn33nXvh/9UdKkto+pGKVdtCiwXElc?=
 =?us-ascii?Q?RuKb1M7jIWXcQfNdEBNFn5dn2sHKaebX7wgbMXUfuSScofmJQvKOC3MJTe/g?=
 =?us-ascii?Q?yNP14vWRV5QjIvmqypEA1dgpTR/j2tOMy/SKhRiHhZe5weLCv7J/sCIYB5DZ?=
 =?us-ascii?Q?hPkPUFv+CYXXkFnEdFYZj14x5/HiyjYWKh9ItXqo1w+DBIVrmyzaxMPra40i?=
 =?us-ascii?Q?G4bVEk6AKgZY79X6AqAeb4kxzQcoRdqLrNh5o1NrbDBe2jea+z31mnJxh2vR?=
 =?us-ascii?Q?ZjR/0vPBopSsA6nbwIpTb3OdJ5aRaDTqVSmgLS0NNG7qgcEq6Fqqr3/ZQ7F1?=
 =?us-ascii?Q?2RuStn7FFGIiRYqwSwybRyCAXWg6Tm8gUvQBtfzTHLeiswhMvXs1FHPElpm6?=
 =?us-ascii?Q?LVRcBRuJ2NwSOpjEPzc5QeltyRMA1cCi3wHTknGuydD3wreQorTng7aEA2Ri?=
 =?us-ascii?Q?jOxAPcVzV85H8cLJn6iAUTRbpYypxsWdgjQt8lkraa3/oiUap4xIKj/l/bhf?=
 =?us-ascii?Q?5viqwnyg1medpd0UpflBoubnBPEEgs+QjF59haaDM6U3yin8GK6L3KmNWRGr?=
 =?us-ascii?Q?iO1aD6srfvadExXhfF3a3uHVj8WY4VLNtpqqs2BtcE2c7tZf4O7WT003WDme?=
 =?us-ascii?Q?fZrSqzOhd/JIooa0vszWHNl7imhUgGStOSwTYMebKHUAGq3usu0ufudlJX9G?=
 =?us-ascii?Q?LzP3VCi4LsDsagK7/OLfX+rBCejNWXxLeo6F9r39FSGggXWkNmZX+eIGJMhy?=
 =?us-ascii?Q?oWKQ7MiSVzBmlF1MsfqIFPhZhb4qpu5kp6dCrlrMO9lvcQXhjglso/hIo1NT?=
 =?us-ascii?Q?BcISwHhRqRzvaiAhYDQMNw6RvoicukrmaYNtK03hEd7tq1/GX+JtEa5p0Fr0?=
 =?us-ascii?Q?a6WiHwtktIaIGOvJJqRl0y/hSQ5EJ9zUe6zP83fDbdYBKg29YSX2BPcSEyhS?=
 =?us-ascii?Q?+fVHEV3CtU9sgPFB1egwTJXR2PZD4YfQD6oTC43J5Yij08+IlL9ho+jjxjT6?=
 =?us-ascii?Q?VnP6aQ+T2O1HX5mYHLPmv0Rp3/ASvybzEK+JKIFwL/2f4H7dqv5HxV15B+Ve?=
 =?us-ascii?Q?VLMdNVN7e/hWtuIlJx08HFTheLfFP8g9zsBb0JWDvud8oBBZH/ohHv9+0f97?=
 =?us-ascii?Q?hJCGCAzTfxcbEx/dkx2/uajIIP1KU6ECioLcr/RLIYMZb035j3mFDgpvVaRy?=
 =?us-ascii?Q?A6EoPT0iR7hT13AmV7EomINUiyFy7oIy7uAbO+5Q6vIkAOUcrrYmVoJeteuM?=
 =?us-ascii?Q?ovG2R1zgElPKtNlKn/IcCLGXONDHnt/OAVErI5aAQnRAYsTE6Y8QUog37t0S?=
 =?us-ascii?Q?U40/tuZPxRDDP8rxiQfyv7nUoklt79RzctM0P9z5ufdr09lNxA/l6Ixe4Qz/?=
 =?us-ascii?Q?17TQ8H5INw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: yn2FIAMnJrAeZfMhUnocWAV9I00TOHzlpoZ54lHIF7kEh7fyNWX93+3fmby8BZqkttPdttRZZk1xQGJ3O1uIhgEerosO5BKGisdGFnWX5EEqdkZ7Yd9XTnQCr/9X7vMp+DBCT7nsxCJVCzKe6RNaWDadH3iMsULkz0Hjf5GpBYPoj0OBknez4KbAPl4g6zTJnCbjbVVfGDRYOFqUww/DWqeaMzLJ3bXt+DbGID1XLen5HKIBJ0c5PrSMqqm9iwX4HLsx2KjTblCprD7DNkRu/GMxDYl9h/51cDPekveSHdERZ1FFHKFN3xhZg3zYDFOI+oxfHh2iOgnNaGgM8tJlvA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8718.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39a9b4cd-e55f-4d8f-dc4c-08df365296a4
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Oct 2026 06:54:05.1943 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: L+i7k6VVPtOWkZD3RJaIvREFTINr03E051LaOYRNSVlmVkEgWFHLtxCyPx59udG1Hb5pS8y55e69vtNkWCpVppdcFtrkaaTIErr0GWkThhs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4901
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
> From: Kumar G, Naresh <naresh.kumar.g@intel.com>
> Sent: 29 October 2026 22:58
> To: intel-xe@lists.freedesktop.org
> Cc: Upadhyay, Tejas <tejas.upadhyay@intel.com>; Kumar G, Naresh
> <naresh.kumar.g@intel.com>
> Subject: [PATCH v7 6/7] drm/xe: capture L3 node status registers in
> devcoredump
>=20
> Add L3_NODE_IDLE and L3STAT_LBCF_GFX register definitions and include
> them in the devcoredump snapshot as a node status section.
>=20
> Extend the register descriptor to mark MCR registers so the snapshot code=
 can
> read them through xe_gt_mcr_unicast_read_any(), then print and free the
> captured node status registers alongside the existing dump sections.
>=20
> v2:(Sashiko)
> - change L3 node registers as XE_REG_MCR type
> - identify mcr register type from reg.mcr
> - As generic capture function ensure VF check this will not execute
>   on VF Mode.
>=20
> v4:(Tejas)
> - Add L3_NODE type into the enum as changed/added in initial patch
>=20
> v5:
> - Rebase
>=20
> v7:(Sashiko)
> -Use a Xe_LP-specific L3 capture list to avoid unsupported L3_NODE_IDLE
> MCR reads while retaining L3STAT_LBCF_GFX capture
>=20
> Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>

LGTM,
Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

Tejas
> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h      |  3 ++
>  drivers/gpu/drm/xe/xe_devcoredump.c       | 35
> ++++++++++++++++++++++-
>  drivers/gpu/drm/xe/xe_devcoredump_types.h |  2 ++
>  3 files changed, 39 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index f884fc2e38aaf..28331505bb34e 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -454,6 +454,9 @@
>  #define   L3_ESC_MASK				REG_BIT(0)
>  #define   L3_ESC(value)
> 	REG_FIELD_PREP(L3_ESC_MASK, value)
>=20
> +#define L3_NODE_IDLE
> 	XE_REG_MCR(0xb0b0)
> +#define L3STAT_LBCF_GFX
> 	XE_REG_MCR(0xb128)
> +
>  #define XEHP_L3NODEARBCFG			XE_REG_MCR(0xb0b4)
>  #define   XEHP_LNESPARE				REG_BIT(19)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c
> b/drivers/gpu/drm/xe/xe_devcoredump.c
> index 67e38a4dda8d0..7634246d77258 100644
> --- a/drivers/gpu/drm/xe/xe_devcoredump.c
> +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
> @@ -122,6 +122,15 @@ static const struct xe_reg_desc
> xe_dbg_gam_pf_reglist[] =3D {
>  	XE_REG_DESC_MCR(PAGE_FLTRPTQ_TAIL, "PAGE_FLTRPTQ_TAIL"),  };
>=20
> +static const struct xe_reg_desc xe_dbg_xelp_l3_reglist[] =3D {
> +	XE_REG_DESC_MCR(L3STAT_LBCF_GFX, "L3STAT_LBCF_GFX"), };
> +
> +static const struct xe_reg_desc xe_dbg_l3_node_reglist[] =3D {
> +	XE_REG_DESC_MCR(L3_NODE_IDLE, "L3_NODE_IDLE"),
> +	XE_REG_DESC_MCR(L3STAT_LBCF_GFX, "L3STAT_LBCF_GFX"), };
> +
>  /**
>   * struct xe_gt_regset - Struct for register descriptor list for GT
>   *
> @@ -142,6 +151,8 @@ struct xe_gt_regset {
>   * @XE_DBG_REGSET_RPM: RPM register set
>   * @XE_DBG_REGSET_GUC: GUC register set
>   * @XE_DBG_REGSET_GAM_PF: GAM Pagefault registers set
> + * @XE_DBG_REGSET_XELP_L3: Xe_LP L3 register set
> + * @XE_DBG_REGSET_L3_NODE: L3 Node register Set
>   * @XE_DBG_REGSET_MAX: Number of debug register set types
>   */
>  enum xe_dbg_regset_type {
> @@ -149,6 +160,8 @@ enum xe_dbg_regset_type {
>  	XE_DBG_REGSET_RPM,
>  	XE_DBG_REGSET_GUC,
>  	XE_DBG_REGSET_GAM_PF,
> +	XE_DBG_REGSET_XELP_L3,
> +	XE_DBG_REGSET_L3_NODE,
>  	XE_DBG_REGSET_MAX,
>  };
>=20
> @@ -175,6 +188,14 @@ static const struct xe_gt_regset
> xe_dbg_regsets[XE_DBG_REGSET_MAX] =3D {
>  		.gt[XE_GT_TYPE_MAIN] =3D { xe_dbg_gam_pf_reglist,
>  					ARRAY_SIZE(xe_dbg_gam_pf_reglist)
> },
>  	},
> +	[XE_DBG_REGSET_XELP_L3] =3D {
> +		.gt[XE_GT_TYPE_MAIN] =3D { xe_dbg_xelp_l3_reglist,
> +					 ARRAY_SIZE(xe_dbg_xelp_l3_reglist)
> },
> +	},
> +	[XE_DBG_REGSET_L3_NODE] =3D {
> +		.gt[XE_GT_TYPE_MAIN] =3D { xe_dbg_l3_node_reglist,
> +					 ARRAY_SIZE(xe_dbg_l3_node_reglist)
> },
> +	},
>  };
>=20
>  static void xe_dbg_reg_snapshot_print(struct drm_printer *p, @@ -359,6
> +380,8 @@ static ssize_t __xe_devcoredump_read(char *buffer, ssize_t coun=
t,
>=20
>  	xe_gam_pf_snapshot_print(&p, "GAM PF Report", ss-
> >gam_pf_report);
>=20
> +	xe_dbg_reg_snapshot_print(&p, "Node Status", ss->ns);
> +
>  	drm_puts(&p, "\n**** Contexts ****\n");
>  	xe_guc_exec_queue_snapshot_print(ss->ge, &p);
>=20
> @@ -416,6 +439,9 @@ static void xe_devcoredump_snapshot_free(struct
> xe_devcoredump_snapshot *ss)
>  	xe_dbg_reg_snapshot_free(ss->gam_pf_report);
>  	ss->gam_pf_report =3D NULL;
>=20
> +	xe_dbg_reg_snapshot_free(ss->ns);
> +	ss->ns =3D NULL;
> +
>  	xe_guc_exec_queue_snapshot_free(ss->ge);
>  	ss->ge =3D NULL;
>=20
> @@ -588,6 +614,10 @@ static void
> xe_devcoredump_deferred_snap_work(struct work_struct *work)  static void
> xe_devcoredump_capture_gt_regs(struct xe_devcoredump_snapshot *ss,
>  					   struct xe_gt *gt, struct xe_gt
> *other_gt)  {
> +	enum xe_dbg_regset_type l3_regset =3D
> +		GRAPHICS_VERx100(gt_to_xe(gt)) < 1250 ?
> +		XE_DBG_REGSET_XELP_L3 : XE_DBG_REGSET_L3_NODE;
> +
>  	ss->gt_fuse      =3D xe_dbg_gt_snapshot_capture(gt,
>  						      other_gt,
>  						      XE_DBG_REGSET_FUSE,
> @@ -616,6 +646,10 @@ static void xe_devcoredump_capture_gt_regs(struct
> xe_devcoredump_snapshot *ss,
>  						       other_gt,
>=20
> XE_DBG_REGSET_GAM_PF,
>  						       XE_GT_TYPE_MAIN);
> +	ss->ns =3D xe_dbg_gt_snapshot_capture(gt,
> +					    other_gt,
> +					    l3_regset,
> +					    XE_GT_TYPE_MAIN);
>  }
>=20
>  static void devcoredump_snapshot(struct xe_devcoredump *coredump, @@
> -667,7 +701,6 @@ static void devcoredump_snapshot(struct
> xe_devcoredump *coredump,
>  		if (job)
>  			ss->job =3D xe_sched_job_snapshot_capture(job);
>  		ss->vm =3D xe_vm_snapshot_capture(q->vm);
> -
>  		xe_engine_snapshot_capture_for_queue(q);
>  	}
>=20
> diff --git a/drivers/gpu/drm/xe/xe_devcoredump_types.h
> b/drivers/gpu/drm/xe/xe_devcoredump_types.h
> index fba3d23040b9e..e4fb3e12e068e 100644
> --- a/drivers/gpu/drm/xe/xe_devcoredump_types.h
> +++ b/drivers/gpu/drm/xe/xe_devcoredump_types.h
> @@ -110,6 +110,8 @@ struct xe_devcoredump_snapshot {
>=20
>  	/** @gam_pf_report: GAM PF report snapshot */
>  	struct xe_dbg_reg_snapshot *gam_pf_report;
> +	/** @ns: Node status snapshot */
> +	struct xe_dbg_reg_snapshot *ns;
>=20
>  	/** @ge: GuC Submission Engine snapshot */
>  	struct xe_guc_submit_exec_queue_snapshot *ge;
> --
> 2.43.0

