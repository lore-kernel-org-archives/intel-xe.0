Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2751AC021B0
	for <intel-xe@archiver.kernel.org>; Wed, 19 Feb 2025 22:29:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1E3310E37B;
	Wed, 19 Feb 2025 22:29:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BljV5MMm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D527710E07B
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Feb 2025 22:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740004149; x=1771540149;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=KxB0tYVaBBE0JRdwYW98GntPQc3lFWoVl6oojiF9HqE=;
 b=BljV5MMmFql2lKKacBUf+8S9D2+GzFgj7vLk5ZbK2No1cmrmguwkzFdh
 p6b31crRpUhJn29RkGTrg+2vRhgQgA6D84wDNw43XGWwYvGbhfR8T3wP7
 2jTjXcEzFU7lk4wWbSaQz7l44yj5kq2fua/mjXzbZ4M2K9Fw+uHrjuLYD
 UssuFpbOQidfsdyVi+A+OLv4qlBc32JjGnv1ihyz4fKemI0b6SVs+gJJe
 MfxeusiR5zsuoibsxHKpQQwBgeYwz2yaFcgBgssCmC771FZgFLjd8UZZw
 +7loYLpcZKNyMQNHIxfQK/zjPVFEC46lBnvjob1nAPyFF9EkG701GlqvI Q==;
X-CSE-ConnectionGUID: goKfZyN3TRevMgEX/9zPfg==
X-CSE-MsgGUID: ekWOnr4PQ1ObzdNh6JL8DQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11350"; a="51382740"
X-IronPort-AV: E=Sophos;i="6.13,299,1732608000"; d="scan'208";a="51382740"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2025 14:29:08 -0800
X-CSE-ConnectionGUID: I/hKDwsKRFuvBlYlugbUrA==
X-CSE-MsgGUID: Zq+W0uaeTR6WmBAYaOdzCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,299,1732608000"; d="scan'208";a="145691538"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2025 14:29:08 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Wed, 19 Feb 2025 14:29:07 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 19 Feb 2025 14:29:07 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 19 Feb 2025 14:29:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kp/zNMukHWIwyli0pio18UqjFgpLF4DUHRohwsweBMTykVc2ErrRqmGgrUvPzalTZwcenpy0mzR2XB1oO8OfjK0t8caKzI0MgIStM1SeREYsqEdK4vV3F4/QOkXimyW1QFUA3mrh5d6BCph+4P5er+qXPgFf0CETb3tMbX+dyAxsi7+VUGiQlkANU7gzvu+LVdUPhKMT0xPn7SllMx0ZJnpYyOyo+fTqyj879sEKUNBA+2MsC8cAg0pEIUYiKiK8mt+YFbASrTtQTdEpn+0OYQY4TaNpryh7VyNxs6uK7dczHaa6R7o0aq4rcJXZd3Me+apYdxXJu4N18+eLEfx6iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UJYdiS7Yu5QjoMVRoxPG/BgITnT6ar+z7isUh3WWWIU=;
 b=Kyu4awYWrXo7PdXCRMUeb6+/V6ainoTZ2aLpuXehDyaVZMkUeAoZ3eMFhzFRjUxIkzbJy4qrtl+VhD0dSIZqvAElQMs/ZQZfLrzjG5Zbsv973LwfOyRvbbNfovsb7IJHc2jaQWQZ/u8U9aN42c12y/J0u3+q4FJSkq0YGsNeV9XzTDc6M1hj+H/6yEDzyTSorFd17DXn5/9G6m73dzmt1FaphramTAmVWXFSCmbzk2s8kQapLnskcuvaSn8QRo3SIwyWDDQkaqLeiunoqED2sIOa63n08nKyIKR3fRsMLUNS5whNwT1Lq36d/tVwsAzbJ+eh/Ri8L3CNl49tehP7Kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by DS7PR11MB7950.namprd11.prod.outlook.com (2603:10b6:8:e0::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.18; Wed, 19 Feb
 2025 22:28:36 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%3]) with mapi id 15.20.8466.015; Wed, 19 Feb 2025
 22:28:35 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Lin, Shuicheng" <shuicheng.lin@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Lin, Shuicheng" <shuicheng.lin@intel.com>, "Harrison, John C"
 <john.c.harrison@intel.com>, "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH] drm/xe/devcoredump: Remove IS_ERR_OR_NULL check for
 kzalloc
Thread-Topic: [PATCH] drm/xe/devcoredump: Remove IS_ERR_OR_NULL check for
 kzalloc
Thread-Index: AQHbgxfaWz8b6XQxzkGhld9Sffz0K7NPMXUA
Date: Wed, 19 Feb 2025 22:28:35 +0000
Message-ID: <CH0PR11MB5444E815E7601CD500325E62E5C52@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250219214313.1798569-1-shuicheng.lin@intel.com>
In-Reply-To: <20250219214313.1798569-1-shuicheng.lin@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|DS7PR11MB7950:EE_
x-ms-office365-filtering-correlation-id: ec906df9-1a61-4bf5-be0e-08dd5134bfdf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?yZDtezJqykVeCt3hBpXPLbiUtNwlM8XYudn6MIMmDEtL4Qj6UP1SfumXKidu?=
 =?us-ascii?Q?a53o4plQvsVzrmoIRf4YKKtu0GT/FeaGvdw5i3tr2vUSRsqJCuKx3ZbUxMb0?=
 =?us-ascii?Q?7SgVzO7wLvbKre2gaCmxtKIaEUG2zh5ViLx3GqU8hICeYzQlEIROc0OjWdJA?=
 =?us-ascii?Q?sOSGUlDEYznWpfMO5QGFa8vI9LCrhfOCiO9NJNwsMrE0kSHQyxe2focXOD3p?=
 =?us-ascii?Q?oppPe5o5BgenF/7md5goIl3wctIHLoJKcmSwVjcoPDL+TxnDukfcvhy4sWoN?=
 =?us-ascii?Q?XMAP8CGkWOJVjaKjtI6h/T415pqdxC4HdPdFkbpWrWTsCeyJeNtoKhYWhGGE?=
 =?us-ascii?Q?GHfYb6cGkZSKtpGvHfcEB5XCaGF8VLCmTfVE7MSPAHiUdLc3Uzqd6SG6qAw2?=
 =?us-ascii?Q?SNyD7Ri+LaTxPI/16+WnuNfMn3oYgRdvAlP3XxwQ/TwZKrBITZO2UFLCPa6C?=
 =?us-ascii?Q?b08n8ad5RTspMaEHI8v29NUFAVBvtTPYILytEt/4c0X49ak6UVNJwF05x0i0?=
 =?us-ascii?Q?Ejcgh8AGEVZ6bv5v9vL2bVvKzGvw3YpMcGClb4zulWvMgKz8n/sMfttDZvqx?=
 =?us-ascii?Q?deuskR1+bR3MkWJO2DP8q+wPDGWS8l1WGsXKtKDwaH67pK2ZEpHLCdg0gEff?=
 =?us-ascii?Q?M4YTUKyoHJcDbiOwZBRkaTdXV12n0fGFAhQKmptJ20rLbOsDMokzqFu2Z3vh?=
 =?us-ascii?Q?y6zdiVOO6byFjnZXb/UCQSVyOKk9dBXFKqrPcirOvGWHjeZPzf6OS6VI8wxF?=
 =?us-ascii?Q?w7Z5gmDolD/8ifYTK3nDUFG1ouqMpZUIrqJGrJbTZ9XI4uKbhZyCKgfEYR+u?=
 =?us-ascii?Q?gzpb92HTAB6FzhSIaHuJxMXQs6/WYM6iL2vwzcHJi6X0o6FkfEK/4tx6iZdF?=
 =?us-ascii?Q?1Eh30MCpsSWplkDONtVqWE0bI5O86yKYHPf5b8wXspb6PGipS8ch/VUGJBej?=
 =?us-ascii?Q?aUrQKWKhFT3HIQXQIPpPsXV2iLzx3nhIbbrlEGzk4jtCBLT86anllBGoN984?=
 =?us-ascii?Q?6jh+yJdbOTQlw/q0kLMd36zivjOBbBI8YYvpZ5CPyOSaKqW8g5Rxg3oH/XYE?=
 =?us-ascii?Q?wTVBFkUHVeWZowo2/UaKZLUpn2tK+BuXHEe2GGH1uUT1JgOltpCLxR/pWZ4X?=
 =?us-ascii?Q?oRwtJC8sI0/UYaCfxxYHIwvxm0gz3s1gSu42/be5lf195bjUc5NM3ZR6uvA6?=
 =?us-ascii?Q?4g8Vw4Syvu2uFZ1hB1J396jpSY1WYTjSRmcBfrIG2tUr/iV7HhNz0o0blhfo?=
 =?us-ascii?Q?jDd3SHkG3lzwUVFH1UbC0o7O0JWOVQg6NDZgB/146XcPlvPf0YlzWEcrqTd0?=
 =?us-ascii?Q?YDtLiB5KcEFmFlThRvzuU7BXYoJ0/+0d+1qhKUEmQsLEWMmDlPGTetg83bRS?=
 =?us-ascii?Q?149fLDCKsf9b6QAYiYW3VaGB2rE5UePXF8JuwtsDoAXxIIDKx+mzKR890jZc?=
 =?us-ascii?Q?bcIQOwUbz+Ls+PoTCXmUWD2JvBe4pQ+c?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?FJ86I1QVFy/OZO0/9O/Osyk3hZtW/0Fe5pJBAWp4kGVJpQ09YfPGDOysnymA?=
 =?us-ascii?Q?gVpq6HpXwxLrEELaksVQn4sjADikxoCXSPk4LL47OKIo2jjCq3IvuLVhaUVE?=
 =?us-ascii?Q?QfEBa36oFDgcvsH8nP+IwvRoKs9r4eqhdZ+S6GacIP50yQrjx9acDxPV6tOo?=
 =?us-ascii?Q?Q56n/XOown0Mn6H4hVCNCQPpg1g8JE79N0a7tS1xvsmTnxrSivTcA8mL1sdN?=
 =?us-ascii?Q?cXBLIeXmks2fIaZMxfM659gJqkbIfV80/sO3b/TdwRgEHi1Xc538wm2qv621?=
 =?us-ascii?Q?aGRo0UBYCq9uobuj+QTJbS75BFXXFhYz4AoEOKpEoEnuV1WEACIVCJNr/3Rx?=
 =?us-ascii?Q?l5I3TJVi2rwmUG/CP32+HLjMU3U+wDHy8PA5ZfXb8Ch9okZM81wuFH9dacns?=
 =?us-ascii?Q?oK8Ux3uuIOizxn2RLqrcZgP48EuZMVGY6jYrAWyYS128tYfke63be84givi7?=
 =?us-ascii?Q?oQAOxtZLCq/pkUW6GRpY6ZDgQkv6SdoSbZcPswZd3TnfJwNl58fBTujXp4B/?=
 =?us-ascii?Q?FJnL8TTAXoJVWCSeM1EQe+6Md0IaBwg7YbWoQoi/YF/BMFQ4MRmduB5cILwf?=
 =?us-ascii?Q?lMNG7Wt0U8hiLEGXUUi1ke0JjMOyhEK4Askf8cL6Bj1SGqbfQaB7rwjPCkHc?=
 =?us-ascii?Q?obDVylC+WcqFF1+zXE5sp5yfvtt5zcTN0mwsqVugKR4Yum4NlxQT9YmptR2J?=
 =?us-ascii?Q?nfqAkIS7x6H0kZWY9S6Sy60uw6OD1NmQ9EwsIMeVkJZ7tt4GmDLHVus2orBU?=
 =?us-ascii?Q?PP34qUCfnGxDkVveRELdkvC1o5QNrgX2w4PlkvlW6GCBLKBtYsWFPCfVx0eH?=
 =?us-ascii?Q?lPw57rRl/YgGhgascMJHgwPCV5VHr4s3Cuso22ZTSPbo3R2UcWsfsRABruc3?=
 =?us-ascii?Q?Gy3Ot3JvqaS7501ywVGEC1P0JiW/w28O3qkun+tl/XxSpJQdNrsIMEr3k+u4?=
 =?us-ascii?Q?tKhUNlDZl7BVGNypTXWCOwAYZFANE2FCyinYhq+vu3FQwgB7hCArrJcaWHcT?=
 =?us-ascii?Q?F4mFCGHQwDElcLXJi7C3PotPNt4hTxrImWqsYu/LOa9Fq8pEqhj098hxEGIV?=
 =?us-ascii?Q?Ag/KT8458Yj6JOAypNRZLym5PbWXTeSZtnCAgnGt1ldOF5JUpL5ykS/f5wpF?=
 =?us-ascii?Q?+8Jgj4d525SHW1BZnkD8lVcVUlPnWBkPZ001ElZeA8ocGB1dO2g46iIWbqaZ?=
 =?us-ascii?Q?lTiPMdmhPZ2ufj5VzxwAUrf/EJSywz4JmFhjlOSgkDBwWyrtTMLxv4IvpJ89?=
 =?us-ascii?Q?RMty78x+BR6jZgvJ1k1I/qYhyVcGaA6gP7Bc4ugKeWOmTLyrjX5KCwSlvzun?=
 =?us-ascii?Q?3MVQCwG/85ABsVR2EBHrToKO/S69G4VaWjS303JoC9bv2pknMeJsrWjI9Avj?=
 =?us-ascii?Q?WSUFE+KUA8Hgvq9XSD+gct3BtZJR1mgig7bkwg6WyYIPy8XjeW8E7SqMEF4W?=
 =?us-ascii?Q?uL3lMzHagxYOTD1EThe7JL6cW5fFa9hIgwqILlpgXBM+EarySxJAdqq+hVSv?=
 =?us-ascii?Q?2BN8gXKCDCr24ku27WeGKwjtHhQOc4aEn0JWf0JLje+Rziav5BP+Ls1YO2sA?=
 =?us-ascii?Q?qZrcs46bIuIW/9nmFKURDQr8Bgpbr/IyfueRP/L6?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec906df9-1a61-4bf5-be0e-08dd5134bfdf
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Feb 2025 22:28:35.5320 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PAP/NugVzMzk9vb1G+e0//Uqs/CSmVbl1UkEJG2sIB3yH0JDyz3NDVQ/5+rOFX4FvNITQMZcLLrkXBy2t9Wd8NLWxpUsMWRa9sIHAG0B6ZE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7950
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

-----Original Message-----
From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Shuich=
eng Lin
Sent: Wednesday, February 19, 2025 1:43 PM
To: intel-xe@lists.freedesktop.org
Cc: Lin, Shuicheng <shuicheng.lin@intel.com>; Harrison, John C <john.c.harr=
ison@intel.com>; De Marchi, Lucas <lucas.demarchi@intel.com>
Subject: [PATCH] drm/xe/devcoredump: Remove IS_ERR_OR_NULL check for kzallo=
c
>=20
> kzalloc returns a valid pointer or NULL if the allocation fails.
> It never returns an error pointer. It is better to check for NULL directl=
y.
>=20
> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>

LGTM.
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> ---
>  drivers/gpu/drm/xe/xe_devcoredump.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_=
devcoredump.c
> index 60d15e455017..81b9d9bb3f57 100644
> --- a/drivers/gpu/drm/xe/xe_devcoredump.c
> +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
> @@ -426,8 +426,8 @@ void xe_print_blob_ascii85(struct drm_printer *p, con=
st char *prefix, char suffi
>  		drm_printf(p, "Offset not word aligned: %zu", offset);
> =20
>  	line_buff =3D kzalloc(DMESG_MAX_LINE_LEN, GFP_KERNEL);
> -	if (IS_ERR_OR_NULL(line_buff)) {
> -		drm_printf(p, "Failed to allocate line buffer: %pe", line_buff);
> +	if (!line_buff) {
> +		drm_printf(p, "Failed to allocate line buffer\n");
>  		return;
>  	}
> =20
> --=20
> 2.25.1
>=20
>=20
