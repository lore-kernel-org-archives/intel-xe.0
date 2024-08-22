Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C494C3DA4A
	for <intel-xe@archiver.kernel.org>; Thu, 22 Aug 2024 15:42:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C04BD10EB3F;
	Thu, 22 Aug 2024 15:42:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EZ1zc5FA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E1A710EB3F
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Aug 2024 15:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724341368; x=1755877368;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=4bOgDukeZxgRcdjMaQgou8CPSEMHsxvuDmayYnEPc3E=;
 b=EZ1zc5FAZaFGISs7T8PwRQSotblQTr51sAZM2U717RXfKuBdtiFONkrI
 6b28CQOI+tJz/jOYnSYLMVsmDUnJN4q3Q0lEouFQTsZ5OpYWbGQCgeEm8
 5rjGuOjd8TBPNjrEa+6VfxJpEKRCumvlKHiUAfmF9uFvs3JCSJhmqHQn1
 A12rOAMpy4TmHh+NSMlAt5ijYrTpTFEtSPEwgt/c8vC3XYzWTYmMnWyIP
 46aRnYiarDiJLFtonnpok6uJgNhzvA0fZ3kStMmmTcqouyYnMkqujhVrL
 HIRLc5ovUrIn/P6v3bOs7+aDEd3mg+zJB1rdi8dj7pB5FFPr487HKV16P w==;
X-CSE-ConnectionGUID: nTL98n1MQrSmQSCjjC6FXw==
X-CSE-MsgGUID: DRq7lkgWQHyw/hNHvZsG/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="33389657"
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; d="scan'208";a="33389657"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2024 08:42:42 -0700
X-CSE-ConnectionGUID: BhtHvXmBTEm1RWZrZdSkUg==
X-CSE-MsgGUID: JWlgdx2dSeyWfOTDHdrbLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; d="scan'208";a="61477317"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Aug 2024 08:42:43 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 22 Aug 2024 08:42:42 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 22 Aug 2024 08:42:42 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 22 Aug 2024 08:42:42 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.172)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 22 Aug 2024 08:42:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TsbbOfrJApMBE/F+LKQcZu2IsOXCqLwG8bH0rwPwRVW/SeKj3bJF9sLz92TlcJLaymx/JvBXGNAqPgHd5hAP1MjOrs2jxq1EJZXXB8i+IS8vHYQLuIuCbaJFKqxSk/rSGly2YuzjOQIsagBOoHfIfBWd3UOGMr1Y3Fhij0NxkyUdE68DBTV8/TBGB7s9wGOObxK86c62nCrhPgHrt8LoM+m4kg1FOnchmw8n9rDxcD0A8JCTeRUdG/C5I4X4umjmx6z2fHrOiOvnbuqXRrXSLX1aNs7uXUtZ1gS/mgY6s61OtxauYHyLt6qHVeqescVdiTZmDTrsjpt54y42mVXxvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jQHdWp8RigVwRMNxmAbrJgFyiMjlortM9CuNgkWne5M=;
 b=Gv2CBoMzNxU4HXBjLT+wJ+HxI5hhhLL/OwWYZMpKRATQc/ZQwvPusdpPWVEcCsrSh4vOeqjvcvAQOYEVVAFQCVJLSdagAf+gwdsDhyeZckpb958lKOyVUTI7IG2Ox5xs6XX+kxYFqLnUmePu9czaxnTqCdLbihfX/OoZeD0vDFf11KPRG0plim7pw10r/0ObULN7w5SezxXdOc3n9xWRfb3P/4JZNfIiz0Gy0fj14KY4k5UoXgYNcuXz69unaniv4PY8kNaFgpOXjx9ihZuxSfc73Tx/ppjWrv4k7snZjyr/F1jikzYZB76QrIznMmN+bPtFC9Kn9n/xCbz4w7/XCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by PH0PR11MB4981.namprd11.prod.outlook.com (2603:10b6:510:39::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.19; Thu, 22 Aug
 2024 15:42:37 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%6]) with mapi id 15.20.7897.014; Thu, 22 Aug 2024
 15:42:37 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Levi, Ilia" <ilia.levi@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Levi, Ilia" <ilia.levi@intel.com>, "Wajdeczko, Michal"
 <Michal.Wajdeczko@intel.com>, "Vishwanathapura, Niranjana"
 <niranjana.vishwanathapura@intel.com>, "Elbaz, Koby" <koby.elbaz@intel.com>,
 "Avizrat, Yaron" <yaron.avizrat@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH 3/5] drm/xe: add memirq offsets for engine instance 0 to
 hw engine properties
Thread-Topic: [PATCH 3/5] drm/xe: add memirq offsets for engine instance 0 to
 hw engine properties
Thread-Index: AQHa9JR+0hZOP+vbXE2nO7orlMGT47IzYEKA
Date: Thu, 22 Aug 2024 15:42:36 +0000
Message-ID: <CH0PR11MB544423035FB9CD6D25FD9532E58F2@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20240822130815.1355437-1-ilia.levi@intel.com>
 <20240822130815.1355437-4-ilia.levi@intel.com>
In-Reply-To: <20240822130815.1355437-4-ilia.levi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|PH0PR11MB4981:EE_
x-ms-office365-filtering-correlation-id: d0a34314-28de-440c-fb33-08dcc2c10c43
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?M4yW3tas7hibEUifJnhLmCOGXhQXwF2tpD9Ma7VByt17ROEfkQckr8+g0ACs?=
 =?us-ascii?Q?R8Quh6NSOIinUuAmRt92OfogB2cDKOrOyMOqiVqlVy00DwFI89u37MPujG4Z?=
 =?us-ascii?Q?Mkjxjf+XuR1FQ6bIXloUVAGGxC5WggM6dP9i8MoZod3zK3yd7aSFuETeQkww?=
 =?us-ascii?Q?2Al6L81Pnc17LselYqIXQ6UA3L6T4+vJUWHmar/jZCNrcCR9VD4SVfsh3B/s?=
 =?us-ascii?Q?DeX+x4xQ0IKYfoF1FaVInlulXPKsk9CVt9FboShpTEfpOTb/9I7vbH/6nfCL?=
 =?us-ascii?Q?Vpj89KOo13HPMuHZpOvffiqccDgNXoF9DJNL0J5vP3dQ4JZ3xwJB4mk/fu/5?=
 =?us-ascii?Q?3AZFKYbjeberJdfRFK3xMi7li4tuyYs+JAYi6KNNdBoyX1kPQQ6nomfHkd/Q?=
 =?us-ascii?Q?dcMZ2/AbpS1vmvbUSYRAVA6D98vsDivq7PgVts7j6olQNYftEWWce540kA2F?=
 =?us-ascii?Q?iC1uER46CjPmYH7Ge/QWMKCxnefRLY6l7uVlZKv0kxxzCbA63WOleDzhmR93?=
 =?us-ascii?Q?OWnR2x0F+wJSajge+G6T4w86WSTPIC7TjY9gNeXCxoBTMqcs68NOJ63Q+Uay?=
 =?us-ascii?Q?vL2otm9v6DcadSeF1ugyW3y7oJvV0oCNXGt8h17iKToUd2J6Xs+7euJW+4rK?=
 =?us-ascii?Q?sMEkwwduz17vZN9OSj22UXVeHS2Izejil5PIn1TSRk7ONjBN/dYOvGi2P5/w?=
 =?us-ascii?Q?pKAJF19SWWLvqyYF93r1Vj//p3F5fSFTL2yPkZ+4eNYWrBgjzOhcf4zo+cM+?=
 =?us-ascii?Q?TjO46gnx0GcWtvLUxFkUq5sfmv6hDWIHqoxPn5rtOuE2KgWn77eBF7l0Tbus?=
 =?us-ascii?Q?C6h98uRNFLu2i7IOI26oZ/ztNxNAijrqjzby8m7VN7M28wHGA25Jnlu0vAjk?=
 =?us-ascii?Q?xZjrqOYnpfR1Fm+k6iQ0/Qxkj1BEmascZMQ/GRwTk14PfzKdBoPgbLKc5rMc?=
 =?us-ascii?Q?N6CYIxvRpEODLNtY2F4+TrmFpfOZvUZ6PIhbMhyNnzrjy61FGH5BrQ0J8yuM?=
 =?us-ascii?Q?xj3gqAU1vG+gpUwPhoS+QmCIFk1Lez5GRi7mQcU5vuNvrhKIOaYLODOg/49A?=
 =?us-ascii?Q?mFj4h2xGLBoExhrWQHCkZBq2SNosaFrLH6QxMwYvm+nEgAadTolRx1Ly6MQf?=
 =?us-ascii?Q?GWDQ+jyjegvcXBjwRuA2/1cBKs4g1YRTpLilHQBtP5MWLsZUcwPzQi5Ro6pl?=
 =?us-ascii?Q?fATGZTm0csCeKlkPz/UKMeEbzbsP+8h39qVIrkDwpnZfIGN1u1CMPCWrPKLY?=
 =?us-ascii?Q?HHoDUJVwfpMJtqokgcwS3aA2kOYRBhyYYTDjVBF1Pa0LFJ/bQSh/dGh7LxmL?=
 =?us-ascii?Q?fxVfkgMAhe1Z1ApNFWnOYF8hSuzTJiqHq9AjgbBsvCnhJWcz3oyH2t4KRykN?=
 =?us-ascii?Q?tlsXHBPrPEU4q8RMI3hXyWGRzRPI?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?jW1JEzOdd8bR3TCCu7GLB6a9J6osn+h4SXBZ/UGb5kfRwsvuWewo8K/KZEVO?=
 =?us-ascii?Q?K2lsujlcHYrbT8f6W6JSqtDEaBmaUI7403J0qxyqbnq9C+BYRALtw7kRgjZQ?=
 =?us-ascii?Q?qlaKCrKO8k51/LqIG1XyoAC39g1KhrvnaOyh1fvU+1Xy8wvaEnmCWqXqn51a?=
 =?us-ascii?Q?7L4jBOLiaZ6/nVn0OJCmo7EeBwCTx12FXx2IkTZSJB8e+GLLjvwx6Q7LRKkK?=
 =?us-ascii?Q?EwNhrpCNFbYlXkmRZByohcnO8fx9fcvAClL5UCmIwpSoM5DZeRgjq1XSs83h?=
 =?us-ascii?Q?K2/BsMEa32OOg3hgdS96UWNeDKAWclhF3UDGIjOF2m/1H5Wi6dK1uzftFk8L?=
 =?us-ascii?Q?OtvDDUHNBCTk3J05F9BEsJh4iZjafjloJdDNgmcCS1OlnXHayItsXzvw9lu9?=
 =?us-ascii?Q?PgNYVMugP8PBAvJAeWaFSFE+gZ1/aWK/YjKBYIlEum/NmA/pyxTYQ3ORihmm?=
 =?us-ascii?Q?4RlsyszsXh0A0ylblDUYLyQ3aqIs8p5xgtDMvZghxTgGhl1FBPAqPY4fe/za?=
 =?us-ascii?Q?e/31BvZB91hd8Ne/RbhrrY2sh/dZ4BN2dTgVyNL72zWbH3EllQJ8TUUI8bCR?=
 =?us-ascii?Q?0kKeujxOjM8nk+ldnP9wj8HRqnQEEReHbZA1nJ4y4lJLQM46BBdS8WWH+A7P?=
 =?us-ascii?Q?9YOLLOZTKFHOSnaa28X5W6jxGrZHJX5vPRn60duvJir8QaKHfNHSx4Zy3/Dg?=
 =?us-ascii?Q?/5ngPkWOl2cTeKdo4JCqMDToRmU/8ldFYBmGkYmSR4Lev3HXuzo31jnI5Djx?=
 =?us-ascii?Q?vyQvGpPqAtSBaNfuuDgXWHugPd3+7sz/CFz/7q56aWN4tECDhOzG8usSM6ZW?=
 =?us-ascii?Q?3/7AEVm6/aByoC2JLe8kyAcswUWlm/CeZxreIaH4w5zNyzst1G6/cODI977u?=
 =?us-ascii?Q?o745ByQHRcOw61/v3nz7MEQnIF9UqEouktyse+B3jTIR01HFhP1/Bx7Ghk48?=
 =?us-ascii?Q?kD0+BNZX6l9LRKzHK8J8QCaCH9BwJCqHvrb7aqgyiXsSFm03wpq2gF/ZchY/?=
 =?us-ascii?Q?IYdm70gVLtwFWerdXyiHA34GSNL/2LaoWU9Nbdch310850uLxm5oRn79PTUY?=
 =?us-ascii?Q?SWvDqlfeIHCeYhPy1O1x+fMLUeEvzDenxIn9gX9utOPNqotzd08mvzqTVSiK?=
 =?us-ascii?Q?F0NiL+UrCiB6L9R+9TbwVuvlOO2tTvYqNDRt50xH+0wFqvs3ItywgWF4J+J6?=
 =?us-ascii?Q?ORMEBX75CYgiL/jKbwkiw3Gk+esPSQJE6zNsikpmzTdXjUbAyPYy+0lUtBaF?=
 =?us-ascii?Q?tD/6PgacK6LtHBfnir8+CA7OYNmx72Ukw3rkgi/wNpszi9FjOjNkc3pCYNtr?=
 =?us-ascii?Q?9TxnYzy/yWKP8rK53nGG6buRDLNsH8g3R6mJA88/U1SY7igUZTuVZj2VyWRH?=
 =?us-ascii?Q?lUP0xRxaqac0IfL2HBdH2alLxm3x+HiktiJNy0Hu7UTXmd4ycdHxBLTHcb6P?=
 =?us-ascii?Q?kxX6PdBu9+6ygsqJZ7v35mfekblp7w9KFiFf7QIlA2gJwJIzW5HvyL6YTsUN?=
 =?us-ascii?Q?9wWbW+C0K4840CAEo0JIZ486OtYrBejs8GtXQ/RZOY/UsLdbIeXMAd0KIrV8?=
 =?us-ascii?Q?TUsNMNob0SD63UmcDw8WsN4nH0X4gs7Og4zuuNYt?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0a34314-28de-440c-fb33-08dcc2c10c43
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Aug 2024 15:42:36.9519 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pBwaNmbnLDLJl8PlSEByfU+pR6rlhhMrnytV9xjzI7o0amALRRgzZqAqMaXIEIFsHuLI/shvgasiw43RgSIv2v58scVXW4KbtIqSjyUsY44=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4981
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
From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Ilia L=
evi
Sent: Thursday, August 22, 2024 6:08 AM
To: intel-xe@lists.freedesktop.org
Cc: Levi, Ilia <ilia.levi@intel.com>; Wajdeczko, Michal <Michal.Wajdeczko@i=
ntel.com>; Vishwanathapura, Niranjana <niranjana.vishwanathapura@intel.com>=
; Elbaz, Koby <koby.elbaz@intel.com>; Avizrat, Yaron <yaron.avizrat@intel.c=
om>
Subject: [PATCH 3/5] drm/xe: add memirq offsets for engine instance 0 to hw=
 engine properties
>=20
> This is needed for accessing memirq interrupt status and source for
> MSI-X devices.
>=20
> Signed-off-by: Ilia Levi <ilia.levi@intel.com>

Here are two alternative solutions to consider:

1.
Create a function that takes a hwe and returns the e0_irq_offset from the
engine class:

"""
static inline int xe_hw_engine_get_e0_irq_offset(struct xe_hw_engine *hwe)
{
        switch (hwe->class) {
        case XE_ENGINE_CLASS_RENDER:
                return ilog2(INTR_RCS0);
        case XE_ENGINE_CLASS_COPY:
                return ilog2(INTR_BCS(0));
        case XE_ENGINE_CLASS_VIDEO_DECODE:
                return ilog2(INTR_VCS(0));
        case XE_ENGINE_CLASS_VIDEO_ENHANCE:
                return ilog2(INTR_VECS(0));
        case XE_ENGINE_CLASS_COMPUTE:
                return ilog2(INTR_CCS(0));
        default:
                return -EINVAL;
        }
}
"""

2.
Same as above, but with a dictionary:

"""
static const int e0_irq_offset[] =3D {
        [XE_ENGINE_CLASS_RENDER] =3D ilog2(INTR_RCS0),
        [XE_ENGINE_CLASS_COPY] =3D ilog2(INTR_BCS(0)),
        [XE_ENGINE_CLASS_VIDEO_DECODE] =3D ilog2(INTR_VCS(0)),
        [XE_ENGINE_CLASS_VIDEO_ENHANCE] =3D ilog2(INTR_VECS(0)),
        [XE_ENGINE_CLASS_COMPUTE] =3D ilog2(INTR_CCS(0)),
};
"""

I put both of these into xe_hw_engine.h to assure the formatting was correc=
t,
and I should note that wherever these functions are put, you'll need to inc=
lude
"regs/xe_gt_regs.h".

Also, note that in the case of the second solution, you may need to squash
this patch into the next one to prevent "unused variable" warnings on
compilation.


I have no problems with the current implementation, and thus won't block
on these considerations, but someone else might want one of these solutions
instead.

Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt


> ---
>  drivers/gpu/drm/xe/xe_hw_engine.c       | 28 +++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_hw_engine_types.h |  2 ++
>  2 files changed, 30 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw=
_engine.c
> index aa9b2b16a6e0..b73a4379ce06 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -44,6 +44,7 @@ struct engine_info {
>  	unsigned int class : 8;
>  	unsigned int instance : 8;
>  	unsigned int irq_offset : 8;
> +	unsigned int e0_irq_offset : 8;
>  	enum xe_force_wake_domains domain;
>  	u32 mmio_base;
>  };
> @@ -54,6 +55,7 @@ static const struct engine_info engine_infos[] =3D {
>  		.class =3D XE_ENGINE_CLASS_RENDER,
>  		.instance =3D 0,
>  		.irq_offset =3D ilog2(INTR_RCS0),
> +		.e0_irq_offset =3D ilog2(INTR_RCS0),
>  		.domain =3D XE_FW_RENDER,
>  		.mmio_base =3D RENDER_RING_BASE,
>  	},
> @@ -62,6 +64,7 @@ static const struct engine_info engine_infos[] =3D {
>  		.class =3D XE_ENGINE_CLASS_COPY,
>  		.instance =3D 0,
>  		.irq_offset =3D ilog2(INTR_BCS(0)),
> +		.e0_irq_offset =3D ilog2(INTR_BCS(0)),
>  		.domain =3D XE_FW_RENDER,
>  		.mmio_base =3D BLT_RING_BASE,
>  	},
> @@ -70,6 +73,7 @@ static const struct engine_info engine_infos[] =3D {
>  		.class =3D XE_ENGINE_CLASS_COPY,
>  		.instance =3D 1,
>  		.irq_offset =3D ilog2(INTR_BCS(1)),
> +		.e0_irq_offset =3D ilog2(INTR_BCS(0)),
>  		.domain =3D XE_FW_RENDER,
>  		.mmio_base =3D XEHPC_BCS1_RING_BASE,
>  	},
> @@ -78,6 +82,7 @@ static const struct engine_info engine_infos[] =3D {
>  		.class =3D XE_ENGINE_CLASS_COPY,
>  		.instance =3D 2,
>  		.irq_offset =3D ilog2(INTR_BCS(2)),
> +		.e0_irq_offset =3D ilog2(INTR_BCS(0)),
>  		.domain =3D XE_FW_RENDER,
>  		.mmio_base =3D XEHPC_BCS2_RING_BASE,
>  	},
> @@ -86,6 +91,7 @@ static const struct engine_info engine_infos[] =3D {
>  		.class =3D XE_ENGINE_CLASS_COPY,
>  		.instance =3D 3,
>  		.irq_offset =3D ilog2(INTR_BCS(3)),
> +		.e0_irq_offset =3D ilog2(INTR_BCS(0)),
>  		.domain =3D XE_FW_RENDER,
>  		.mmio_base =3D XEHPC_BCS3_RING_BASE,
>  	},
> @@ -94,6 +100,7 @@ static const struct engine_info engine_infos[] =3D {
>  		.class =3D XE_ENGINE_CLASS_COPY,
>  		.instance =3D 4,
>  		.irq_offset =3D ilog2(INTR_BCS(4)),
> +		.e0_irq_offset =3D ilog2(INTR_BCS(0)),
>  		.domain =3D XE_FW_RENDER,
>  		.mmio_base =3D XEHPC_BCS4_RING_BASE,
>  	},
> @@ -102,6 +109,7 @@ static const struct engine_info engine_infos[] =3D {
>  		.class =3D XE_ENGINE_CLASS_COPY,
>  		.instance =3D 5,
>  		.irq_offset =3D ilog2(INTR_BCS(5)),
> +		.e0_irq_offset =3D ilog2(INTR_BCS(0)),
>  		.domain =3D XE_FW_RENDER,
>  		.mmio_base =3D XEHPC_BCS5_RING_BASE,
>  	},
> @@ -110,6 +118,7 @@ static const struct engine_info engine_infos[] =3D {
>  		.class =3D XE_ENGINE_CLASS_COPY,
>  		.instance =3D 6,
>  		.irq_offset =3D ilog2(INTR_BCS(6)),
> +		.e0_irq_offset =3D ilog2(INTR_BCS(0)),
>  		.domain =3D XE_FW_RENDER,
>  		.mmio_base =3D XEHPC_BCS6_RING_BASE,
>  	},
> @@ -117,6 +126,7 @@ static const struct engine_info engine_infos[] =3D {
>  		.name =3D "bcs7",
>  		.class =3D XE_ENGINE_CLASS_COPY,
>  		.irq_offset =3D ilog2(INTR_BCS(7)),
> +		.e0_irq_offset =3D ilog2(INTR_BCS(0)),
>  		.instance =3D 7,
>  		.domain =3D XE_FW_RENDER,
>  		.mmio_base =3D XEHPC_BCS7_RING_BASE,
> @@ -126,6 +136,7 @@ static const struct engine_info engine_infos[] =3D {
>  		.class =3D XE_ENGINE_CLASS_COPY,
>  		.instance =3D 8,
>  		.irq_offset =3D ilog2(INTR_BCS8),
> +		.e0_irq_offset =3D ilog2(INTR_BCS(0)),
>  		.domain =3D XE_FW_RENDER,
>  		.mmio_base =3D XEHPC_BCS8_RING_BASE,
>  	},
> @@ -135,6 +146,7 @@ static const struct engine_info engine_infos[] =3D {
>  		.class =3D XE_ENGINE_CLASS_VIDEO_DECODE,
>  		.instance =3D 0,
>  		.irq_offset =3D 32 + ilog2(INTR_VCS(0)),
> +		.e0_irq_offset =3D 32 + ilog2(INTR_VCS(0)),
>  		.domain =3D XE_FW_MEDIA_VDBOX0,
>  		.mmio_base =3D BSD_RING_BASE,
>  	},
> @@ -143,6 +155,7 @@ static const struct engine_info engine_infos[] =3D {
>  		.class =3D XE_ENGINE_CLASS_VIDEO_DECODE,
>  		.instance =3D 1,
>  		.irq_offset =3D 32 + ilog2(INTR_VCS(1)),
> +		.e0_irq_offset =3D 32 + ilog2(INTR_VCS(0)),
>  		.domain =3D XE_FW_MEDIA_VDBOX1,
>  		.mmio_base =3D BSD2_RING_BASE,
>  	},
> @@ -151,6 +164,7 @@ static const struct engine_info engine_infos[] =3D {
>  		.class =3D XE_ENGINE_CLASS_VIDEO_DECODE,
>  		.instance =3D 2,
>  		.irq_offset =3D 32 + ilog2(INTR_VCS(2)),
> +		.e0_irq_offset =3D 32 + ilog2(INTR_VCS(0)),
>  		.domain =3D XE_FW_MEDIA_VDBOX2,
>  		.mmio_base =3D BSD3_RING_BASE,
>  	},
> @@ -159,6 +173,7 @@ static const struct engine_info engine_infos[] =3D {
>  		.class =3D XE_ENGINE_CLASS_VIDEO_DECODE,
>  		.instance =3D 3,
>  		.irq_offset =3D 32 + ilog2(INTR_VCS(3)),
> +		.e0_irq_offset =3D 32 + ilog2(INTR_VCS(0)),
>  		.domain =3D XE_FW_MEDIA_VDBOX3,
>  		.mmio_base =3D BSD4_RING_BASE,
>  	},
> @@ -167,6 +182,7 @@ static const struct engine_info engine_infos[] =3D {
>  		.class =3D XE_ENGINE_CLASS_VIDEO_DECODE,
>  		.instance =3D 4,
>  		.irq_offset =3D 32 + ilog2(INTR_VCS(4)),
> +		.e0_irq_offset =3D 32 + ilog2(INTR_VCS(0)),
>  		.domain =3D XE_FW_MEDIA_VDBOX4,
>  		.mmio_base =3D XEHP_BSD5_RING_BASE,
>  	},
> @@ -175,6 +191,7 @@ static const struct engine_info engine_infos[] =3D {
>  		.class =3D XE_ENGINE_CLASS_VIDEO_DECODE,
>  		.instance =3D 5,
>  		.irq_offset =3D 32 + ilog2(INTR_VCS(5)),
> +		.e0_irq_offset =3D 32 + ilog2(INTR_VCS(0)),
>  		.domain =3D XE_FW_MEDIA_VDBOX5,
>  		.mmio_base =3D XEHP_BSD6_RING_BASE,
>  	},
> @@ -183,6 +200,7 @@ static const struct engine_info engine_infos[] =3D {
>  		.class =3D XE_ENGINE_CLASS_VIDEO_DECODE,
>  		.instance =3D 6,
>  		.irq_offset =3D 32 + ilog2(INTR_VCS(6)),
> +		.e0_irq_offset =3D 32 + ilog2(INTR_VCS(0)),
>  		.domain =3D XE_FW_MEDIA_VDBOX6,
>  		.mmio_base =3D XEHP_BSD7_RING_BASE,
>  	},
> @@ -191,6 +209,7 @@ static const struct engine_info engine_infos[] =3D {
>  		.class =3D XE_ENGINE_CLASS_VIDEO_DECODE,
>  		.instance =3D 7,
>  		.irq_offset =3D 32 + ilog2(INTR_VCS(7)),
> +		.e0_irq_offset =3D 32 + ilog2(INTR_VCS(0)),
>  		.domain =3D XE_FW_MEDIA_VDBOX7,
>  		.mmio_base =3D XEHP_BSD8_RING_BASE,
>  	},
> @@ -199,6 +218,7 @@ static const struct engine_info engine_infos[] =3D {
>  		.class =3D XE_ENGINE_CLASS_VIDEO_ENHANCE,
>  		.instance =3D 0,
>  		.irq_offset =3D 32 + ilog2(INTR_VECS(0)),
> +		.e0_irq_offset =3D 32 + ilog2(INTR_VECS(0)),
>  		.domain =3D XE_FW_MEDIA_VEBOX0,
>  		.mmio_base =3D VEBOX_RING_BASE,
>  	},
> @@ -207,6 +227,7 @@ static const struct engine_info engine_infos[] =3D {
>  		.class =3D XE_ENGINE_CLASS_VIDEO_ENHANCE,
>  		.instance =3D 1,
>  		.irq_offset =3D 32 + ilog2(INTR_VECS(1)),
> +		.e0_irq_offset =3D 32 + ilog2(INTR_VECS(0)),
>  		.domain =3D XE_FW_MEDIA_VEBOX1,
>  		.mmio_base =3D VEBOX2_RING_BASE,
>  	},
> @@ -215,6 +236,7 @@ static const struct engine_info engine_infos[] =3D {
>  		.class =3D XE_ENGINE_CLASS_VIDEO_ENHANCE,
>  		.instance =3D 2,
>  		.irq_offset =3D 32 + ilog2(INTR_VECS(2)),
> +		.e0_irq_offset =3D 32 + ilog2(INTR_VECS(0)),
>  		.domain =3D XE_FW_MEDIA_VEBOX2,
>  		.mmio_base =3D XEHP_VEBOX3_RING_BASE,
>  	},
> @@ -223,6 +245,7 @@ static const struct engine_info engine_infos[] =3D {
>  		.class =3D XE_ENGINE_CLASS_VIDEO_ENHANCE,
>  		.instance =3D 3,
>  		.irq_offset =3D 32 + ilog2(INTR_VECS(3)),
> +		.e0_irq_offset =3D 32 + ilog2(INTR_VECS(0)),
>  		.domain =3D XE_FW_MEDIA_VEBOX3,
>  		.mmio_base =3D XEHP_VEBOX4_RING_BASE,
>  	},
> @@ -231,6 +254,7 @@ static const struct engine_info engine_infos[] =3D {
>  		.class =3D XE_ENGINE_CLASS_COMPUTE,
>  		.instance =3D 0,
>  		.irq_offset =3D ilog2(INTR_CCS(0)),
> +		.e0_irq_offset =3D ilog2(INTR_CCS(0)),
>  		.domain =3D XE_FW_RENDER,
>  		.mmio_base =3D COMPUTE0_RING_BASE,
>  	},
> @@ -239,6 +263,7 @@ static const struct engine_info engine_infos[] =3D {
>  		.class =3D XE_ENGINE_CLASS_COMPUTE,
>  		.instance =3D 1,
>  		.irq_offset =3D ilog2(INTR_CCS(1)),
> +		.e0_irq_offset =3D ilog2(INTR_CCS(0)),
>  		.domain =3D XE_FW_RENDER,
>  		.mmio_base =3D COMPUTE1_RING_BASE,
>  	},
> @@ -247,6 +272,7 @@ static const struct engine_info engine_infos[] =3D {
>  		.class =3D XE_ENGINE_CLASS_COMPUTE,
>  		.instance =3D 2,
>  		.irq_offset =3D ilog2(INTR_CCS(2)),
> +		.e0_irq_offset =3D ilog2(INTR_CCS(0)),
>  		.domain =3D XE_FW_RENDER,
>  		.mmio_base =3D COMPUTE2_RING_BASE,
>  	},
> @@ -255,6 +281,7 @@ static const struct engine_info engine_infos[] =3D {
>  		.class =3D XE_ENGINE_CLASS_COMPUTE,
>  		.instance =3D 3,
>  		.irq_offset =3D ilog2(INTR_CCS(3)),
> +		.e0_irq_offset =3D ilog2(INTR_CCS(0)),
>  		.domain =3D XE_FW_RENDER,
>  		.mmio_base =3D COMPUTE3_RING_BASE,
>  	},
> @@ -481,6 +508,7 @@ static void hw_engine_init_early(struct xe_gt *gt, st=
ruct xe_hw_engine *hwe,
>  	hwe->instance =3D info->instance;
>  	hwe->mmio_base =3D info->mmio_base;
>  	hwe->irq_offset =3D info->irq_offset;
> +	hwe->e0_irq_offset =3D info->e0_irq_offset;
>  	hwe->domain =3D info->domain;
>  	hwe->name =3D info->name;
>  	hwe->fence_irq =3D &gt->fence_irq[info->class];
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine_types.h b/drivers/gpu/drm/xe=
/xe_hw_engine_types.h
> index 39f24012d0f4..18998e204458 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine_types.h
> +++ b/drivers/gpu/drm/xe/xe_hw_engine_types.h
> @@ -118,6 +118,8 @@ struct xe_hw_engine {
>  	u16 logical_instance;
>  	/** @irq_offset: IRQ offset of this hw engine */
>  	u16 irq_offset;
> +	/** @e0_irq_offset: IRQ offset of engine instance 0 (of that class) */
> +	u16 e0_irq_offset;
>  	/** @mmio_base: MMIO base address of this hw engine*/
>  	u32 mmio_base;
>  	/**
> --=20
> 2.43.2
>=20
>=20
