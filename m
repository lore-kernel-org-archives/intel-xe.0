Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51764606A319
	for <intel-xe@archiver.kernel.org>; Thu, 22 Oct 2026 05:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Xgs7d6uR
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 157A210E050;
	Thu, 22 Oct 2026 05:57:03 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8814310E050
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Oct 2026 05:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792648617; x=1824184617;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=QEO9EsHsLwTDQ7UBC15XTxlHTp0AT8WE9dJYoHAn2fg=;
 b=Xgs7d6uRxXI7+OC6KwiKqAWAtftCDct9cfOZzHET+Qp8ZA61JbcM1a8H
 A36guUz6l3lmR4cZP4CaYLxvMYkO6pY2RPQ/i2yk28XA51zuxP1fY/JTE
 Gu5SOoW5zicN/m//FoWgS4U+aaPJ6+xmNOuH/v/bru9yNVVTZhvFnCg0n
 XKDlppfcKGb58IDwqmfu/CiWmYYDEXL2WhBz8O7HJ32CSzhsID6NfJqGo
 uMsMYtr4qsKhJU5QpQLPtnXouwbeB4O061/ZfHF9bwtewPk8i8liAfPiB
 Muc3U/LW0jwIVjaFBEqSubwNZLDMRlf3gvXr2wYlD6YTI7FCSQzfquG5n g==;
X-CSE-ConnectionGUID: 3PsAmx0CTTy6bPi7WfM2aA==
X-CSE-MsgGUID: 6joSPf4mTq65N3IPte6d5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1401961"
X-IronPort-AV: E=Sophos;i="6.27,171,1787036400"; 
   d="scan'208";a="1401961"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2026 22:56:56 -0700
X-CSE-ConnectionGUID: SnAaPmmsQGCvNKfuBlVtIw==
X-CSE-MsgGUID: E/u5JIQLRHO/iwl+tQUFLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,171,1787036400"; 
   d="scan'208";a="3625541"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2026 22:56:55 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 21 Oct 2026 22:56:54 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 21 Oct 2026 22:56:54 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.54) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 21 Oct 2026 22:56:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EYSlVKmxTcWvbC4D/ZV6Ck9o1RWz8KlfZyqTNzLOETvDllkUdP5pOQcjnDCIV5GMnHKt7NPi02FZbGG0xmMptOOUuwUBOG3xm01zHTKoZIf+xvoTjqysoDTWSKAE8eYc12XyW5PK0XLZBmbjIv2PSpR0jSNyCKCEDWuYByJu2mn2KjYUPraPpTNqVBmN98t2OnGurwooGqVposdYbWQeqCawjq5bHZu3XZ59fx6ESJNZJ/VTp+qAsxNyMiN3OcIMWiFh281aV6LItAQe8OZrSElKINLmHvGq7maWZ/AYKv80lj6cR8kUXNfKDoMyKVQBem4Z78B+HrvTa0tb0RHYCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mdj6heKphtLOohv/1Kf2DBSu2tFGqWMBwBkbQDpPRYQ=;
 b=SUYWKwY0RR9evZUs1NC0EWrvvpqBp4n2tkPSNw98kX2aTjloqGOd1av8XUn/hZSNbV6jq2ApU6tO/Gx4Ie4/FqZM7k1DJpfqml9QAbe3iCIktmvpBEItxTXQVy2OqQbSSTP5Nc2NkYwluRlfDQExlggZl/Tc7mxihPaYrJjVzo23B4zX3vhS2/HVGtdraF2nu+nnHbFKnhBzYjZinODH1mZ3uQjlW9SJ+t4kqJ+VnAMPd1QdspzpOYWi/ZDhAh/WYAGwoOmKgZvxsrxFlNLjexUqZ01uL5tVedUCOarpHlzxE5WpphsUfbfmtCRC8m4fV5TaleD0/jReezJDrhTfRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from EA3PR11MB406321.namprd11.prod.outlook.com
 (2603:10b6:303:309::12) by IA4PR11MB9298.namprd11.prod.outlook.com
 (2603:10b6:208:564::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Thu, 22 Oct
 2026 05:56:51 +0000
Received: from EA3PR11MB406321.namprd11.prod.outlook.com
 ([fe80::d9e7:fbcf:fce2:83c3]) by EA3PR11MB406321.namprd11.prod.outlook.com
 ([fe80::d9e7:fbcf:fce2:83c3%6]) with mapi id 15.21.0546.012; Thu, 22 Oct 2026
 05:56:51 +0000
From: "Gote, Nitin R" <nitin.r.gote@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH v1 1/2] drm/xe/tuning: Stop applying media
 CCCHKNREG1/L3SQCREG3 tunings from Xe3p onward
Thread-Topic: [PATCH v1 1/2] drm/xe/tuning: Stop applying media
 CCCHKNREG1/L3SQCREG3 tunings from Xe3p onward
Thread-Index: AQHdWmhpuh+qkaH/ME+DcBdCiG3rR7b/LQoAgAnvoOA=
Date: Thu, 22 Oct 2026 05:56:51 +0000
Message-ID: <EA3PR11MB406321D665654BCD8AE498D834D0652@EA3PR11MB406321.namprd11.prod.outlook.com>
References: <20261012171901.19508-4-nitin.r.gote@intel.com>
 <20261012171901.19508-5-nitin.r.gote@intel.com>
 <20261015220254.GE578251@mdroper-desk1>
In-Reply-To: <20261015220254.GE578251@mdroper-desk1>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: EA3PR11MB406321:EE_|IA4PR11MB9298:EE_
x-ms-office365-filtering-correlation-id: 0e94ef7e-9894-45e6-f0f4-08df3001449b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|23010399003|376014|1800799024|6133799003|18002099003|22082099003|10067099003|261021123027099003|4143699003|11063799006|261009223027099003|56012099006|261021121427099003|38070700021;
x-microsoft-antispam-message-info: jLojtyJ2FH62WCDlqQfnIVZsQoOscCbc3gjxxD16pWtD99qFW3WaH1vatbKCEXC5tJaFLinFcnq76kswBOmCa/v4Gr+7NqQMCsvD341T1ZZX6dReRvKzc4X/ZPijTYsi4mPi00t5xMCM6HmlMimEUHN7s+M3aJgrFH7AAnzEa343FAveecOiZj5eQf2Hb4U6IvlBPaL0yH67S3aguFaPEZ3MlqOellcU5XqE4ASxK4qmMRYQDbRzXf9575BJgw1iX5VV2U1W5XRh4x64oTm6jvNIx7WRtOltAqtnKTPbECYM2yGtmLeMf9Z0wEZ0TdDxAw4dpWXCbv0VuPfocwXDg5MD3WTq+5Q4yKQ+XheiGCF8ymy23dhtylpEeHMP5D8VwY+UeMTiJkwlumoElbQAnSNTyKYBUAaf2bn2U1hcutrgW/FDhWzHwikeClMb0IeAB2hdBvF3QB0KvAg8ygiuMAqPLjRFLQ5JRUd3vMu9IjdUAOr8/kU7omPkOAZgh7cOBoBt2PCbi2RXH4pKHGAeuXCI1yRKQCaXgIXXiMzOIrTlg652/7gVUvxF9Mckh/AUkzJnV3khjeh5aYvd1zDvSexxy3okuHj4x7EoxNMM2u7YydZ9LpYKCv4RcGTfXVHTbUrCxCfn64/UNCK66lGRPtRKeLzPFGPk05oQ9b+SfQlRfGsMHpihV+i+QGmqvZ5wreEn4+LknLQzLT3d8A21vCG8DEktHHVBkdxHBq+8WyA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:EA3PR11MB406321.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(6133799003)(18002099003)(22082099003)(10067099003)(261021123027099003)(4143699003)(11063799006)(261009223027099003)(56012099006)(261021121427099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?q2xtLUgILbcUkiOxAiGJxFttdfFyLYxlzLfSp7HDxF1nJY0KeeoNf3mCqdd+?=
 =?us-ascii?Q?1WvLpqpVYUsFSjJ0/8sVNspfw6kUDGZWWj5JZCJk+BoS5T8vfG28iL8vnpvb?=
 =?us-ascii?Q?gcnexFfAkSBcafNk6yO9QtvUfMMaqRcT48cbtvBI+0q+S6JefmDvg7TxbaDv?=
 =?us-ascii?Q?e8sNfyOACrV0TrXU1ccNwg4UGRdo53N6Ken1J4AEPmkJA4f7xj4hmZ1GEbLR?=
 =?us-ascii?Q?bYZc2SmwswyjGfyOp7w9lPs42ig0sH3i8+8UwgcLkVIp/fX1oigkVNrmX3qZ?=
 =?us-ascii?Q?maj6izKZQCecGAFePmg/2l3+0oS8X7BB3BtG5n4wDfQQ/ioqStaZMbcZNClS?=
 =?us-ascii?Q?kv6jVFxg5lbVVYMLTmMOYgm/hCY4ELHUXMPtDDBKrKGlEc12ROFjsEGeUApx?=
 =?us-ascii?Q?E6p7vfSLKlaljw1N5+bVT82DEEwr+D6f8ZQv/NhckxD6lURw1VM0BDRXJ/r1?=
 =?us-ascii?Q?HK1TvMjDPlRwLQ+yu7Ez5Sd778vW+ANtUExvgZo8OjPFlMqNGxPTWV/RAIfL?=
 =?us-ascii?Q?L3t6bwJ8hGhMFA2ClyVsbNMnF8mzjCEm5N7NIk1q6UYyFUwOA+xuUOG7FPtp?=
 =?us-ascii?Q?cS2N8HYUDM7Z/VU+UnXxZgw/EPs1hTonwh4rP4HnJ5pEsNqXt1SEqnsT4W0W?=
 =?us-ascii?Q?8icQPKWpYf6R3yuSJ9217seqpNl5ptWvY0Swcfv54v/Y//fhJ3Fv2xnE2GGE?=
 =?us-ascii?Q?p52CRuYwKhnrSwNnOqul8Nk5VYgc2Cb2It8bbPIqwVD7WlYVNm3PlyQQXSk+?=
 =?us-ascii?Q?sNVlqkL38aUH6CUUN2wdrStMf5dcdeWiQ3dgwen27RnhFrIwHz/jcjbB949r?=
 =?us-ascii?Q?ilD+R9HHVNhKTMXjzeTCveHfIcjwZUULOTdFUPtE/IxH7wkB6IDzRIiUgOSM?=
 =?us-ascii?Q?jGjyWtw3ceWYDNbUWuK1oBVVfwjPgb0jy8CUnQ+K4ogEGQs0Mo6Ybi/j2ocM?=
 =?us-ascii?Q?BhzKeKj4e4mKBW1OU0rmjOBmH1DdehnT9jiBV32/7qNX6oJAaL0CU8EYX/ik?=
 =?us-ascii?Q?B7tZ6L3kNWcIsNogwCbkhUFyKMnjzhxFu1WcXxAaS7g/ZJKFsGf4uAzR4L3o?=
 =?us-ascii?Q?cF40HXLV4NuNvOdSifuXe74BuwSmjm2COoLwacQMv9PBB1dyOU95l8Vq7CKE?=
 =?us-ascii?Q?PP7v5OIL2uFb7Q3iznfPbzdc8/3Edu7X0zFC+B+3ozImCCMNAsI+J6itbo3g?=
 =?us-ascii?Q?OAIs8jkH6XIZQJCNmDHSLryhZJBOAARnBzPslXGs1yozwIlkG9LudCfyf2s/?=
 =?us-ascii?Q?PPXX6rA8rEIV9pQF8tg3yV3cQyY4yMmL0pBPRZMuZmOGwjxW5fNZfeRZprol?=
 =?us-ascii?Q?ATQGKS6sPLi4s1dcgVTT14miXp5A1fXnEZixlykPQSd6Is/jWNEbDuiJW+TG?=
 =?us-ascii?Q?HTS9krIQH6pcKk4RzgAMSZ2hT8xMdE8ZEeC3pQQ5oE8bRUAjcj70KSHcN13C?=
 =?us-ascii?Q?C2fQqWhl5yGOZx2z9q1sNA7J9dH0HYBR8yzyO/oSXgrxKlQLKCsmD+WnzJ+H?=
 =?us-ascii?Q?HAqnHdaO7WiObCX7aBODqayluCOJpFlX55wSzsjOxH2+5PNmSexrn76uumvC?=
 =?us-ascii?Q?o8VKFBSuRTxr04Xk4J/hIqIR5njz5WvcQ7bY3qZ6gQ7CqNHdff1Aioj94fFF?=
 =?us-ascii?Q?hffpdstuRlLRK9X9Y9PLgaqMv2HlxlLKAVerUe1gbw0Tmni9ZhyyG23DHl9p?=
 =?us-ascii?Q?+LkLRE8qPfR9yNLBs6LiA6WGHVW9YQaIzGrcQhe5VMTN/I6wzSoAbFtJMhVi?=
 =?us-ascii?Q?RkQZ59Fc4A=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: sKR+EAixCwZjHQeC0ohzj0jNOnazPscBxmeo0Hw7t39ztT+fKFZT8Q+EDAKM1g7r8/tuzQg7m0D6bdHsWuaP3FO4ZV3+dcg4EbIH82cSFpM1eH8uON4WJH/AAZfTmFgsVThY7BOG5uJyyS1OqtjYoIIC/erJu6lMi5spTVy2ne4mBQAsrV/Wnr4Hs2NzqXqRApDS+BfSbfoJuGmW9xf6D5e4LNrB9w/daOGwMRXVyMNqiZlbcB8+j99GxguZVyR3xOoA3W9uyT/J9y+RGTIaxqR5Z/pgNvYeyTUTgkNoxI50Vkp5OGbC0Zpvdoog1XsIiNoI2z2zBltANPMIcPWCDg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: EA3PR11MB406321.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e94ef7e-9894-45e6-f0f4-08df3001449b
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2026 05:56:51.3586 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: O2+4g7VsfClyH4t1924BsmnzktwQ/Mrm5gB3gIEw+nw/vOS81RgnFYBcpBofpdSBbeq7G8xpdwp09xxJA5k66Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9298
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
> From: Roper, Matthew D <matthew.d.roper@intel.com>
> Sent: Friday, October 16, 2026 3:33 AM
> To: Gote, Nitin R <nitin.r.gote@intel.com>
> Cc: intel-xe@lists.freedesktop.org
> Subject: Re: [PATCH v1 1/2] drm/xe/tuning: Stop applying media
> CCCHKNREG1/L3SQCREG3 tunings from Xe3p onward
>=20
> On Mon, Oct 12, 2026 at 10:49:03PM +0530, Nitin Gote wrote:
> > Commit 288b775a1cd4 ("drm/xe/tuning: Stop applying CCCHKNREG1 tuning
> > from Xe3p onward") bounded the graphics-side Compression Overfetch
> > tuning to graphics version 34.99. The media counterparts
> > (XE2LPM_CCCHKNREG1, XE2LPM_L3SQCREG3) were left unbounded and kept
> > being applied on Xe3p-generation media blocks. Both were caught by
> > igt@xe_debugfs@check-gt-reg-sr on a CRI media GT:
> >
> >   Mismatch on 0x82a8, expected 0x800000 got 0x0
> >   Mismatch on 0xb608, expected 0x10000000 got 0x0
> >
> > For CCCHKNREG1, the tuning guide (Bspec: 72161) still lists this
> > programming for HUB_DIE (media) projects on this generation, but bit
> > 23 (L3CMPCTRL) no longer exists on CCCHKNREG1 on Xe3p, and bit 25
> > (COMPOVFDIS) is also absent. Bit 18 (ENCOMPPERFFIX) already defaults
> > to 0, so clearing it is a no-op.
> >
> > For L3SQCREG3, the tuning guide doesn't document a removal condition
> > for bit 28 (COMPPWOVERFETCHEN) on Xe3p, so this change is based on the
> > observed hardware mismatch rather than a confirmed bspec removal.
> > Bound it to the same Xe2-only version range as the related tunings,
> > and flag it for confirmation that bit 28 is actually gone on Xe3p
> > media, the same way CCCHKNREG1's bit 23 is.
> >
> > Bound both media tunings the same way as their graphics counterparts
> > so they stop being applied from Xe3p onward.
>=20
> I think we need to split this into two patches; the first part
> (CCCHKNREG1) is pretty clearly the right thing to do so no concerns there=
.

Agree, I will send a separate patch for CCCHKNREG1.

> But the second part (L3SQCREG3) is a lot more fuzzy.  The spec doesn't su=
pport
> this today so we're guessing that they probably forgot to update things
> appropriately for the media IP.  But it's possible that something else co=
uld be
> causing the test failure here (e.g., failure to read back the register va=
lue properly,
> some other unit clobbering the value we write, etc.).  So I think on that=
 one you
> should reach out to the relevant hw architect (probably Karol since he's =
the
> person who generally updatings the tuning guidance for these L3-related
> registers) and get confirmation that our guess is correct.  Unfortunately=
 it's a
> common problem with this specific bspec page that tuning guidance updates
> often forget to describe the media handling and we wind up needing to rea=
ch out
> after the fact to get clarification on whether the recommendations apply =
to both
> IPs or just to the graphics IP.  :-(
>=20
>=20

For L3SQCREG3, I have initiated a discussion with Karol over email and have=
 included you for visibility.

Nitin
=20
> Matt
>=20
> >
> > Bspec: 72161, 59928
> >
> > Assisted-by: LLM
> > Cc: Matt Roper <matthew.d.roper@intel.com>
> > Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_tuning.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_tuning.c
> > b/drivers/gpu/drm/xe/xe_tuning.c index a9bd3f8969a5..514deded1163
> > 100644
> > --- a/drivers/gpu/drm/xe/xe_tuning.c
> > +++ b/drivers/gpu/drm/xe/xe_tuning.c
> > @@ -49,7 +49,7 @@ VISIBLE_IF_KUNIT const struct xe_rtp_table_sr gt_tuni=
ngs
> =3D XE_RTP_TABLE_SR(
> >  			 SET(CCCHKNREG1, L3CMPCTRL))
> >  	},
> >  	{ XE_RTP_NAME("Tuning: Compression Overfetch - media"),
> > -	  XE_RTP_RULES(MEDIA_VERSION_RANGE(2000,
> XE_RTP_END_VERSION_UNDEFINED)),
> > +	  XE_RTP_RULES(MEDIA_VERSION_RANGE(2000, 3499)),
> >  	  XE_RTP_ACTIONS(CLR(XE2LPM_CCCHKNREG1, ENCOMPPERFFIX),
> >  			 SET(XE2LPM_CCCHKNREG1, L3CMPCTRL))
> >  	},
> > @@ -58,7 +58,7 @@ VISIBLE_IF_KUNIT const struct xe_rtp_table_sr gt_tuni=
ngs
> =3D XE_RTP_TABLE_SR(
> >  	  XE_RTP_ACTIONS(SET(L3SQCREG3, COMPPWOVERFETCHEN))
> >  	},
> >  	{ XE_RTP_NAME("Tuning: Enable compressible partial write overfetch in
> L3 - media"),
> > -	  XE_RTP_RULES(MEDIA_VERSION_RANGE(2000,
> XE_RTP_END_VERSION_UNDEFINED)),
> > +	  XE_RTP_RULES(MEDIA_VERSION_RANGE(2000, 3499)),
> >  	  XE_RTP_ACTIONS(SET(XE2LPM_L3SQCREG3, COMPPWOVERFETCHEN))
> >  	},
> >  	{ XE_RTP_NAME("Tuning: L2 Overfetch Compressible Only"),
> > --
> > 2.50.1
> >
>=20
> --
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
