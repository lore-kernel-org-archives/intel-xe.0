Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63A09FC6174
	for <intel-xe@archiver.kernel.org>; Sat,  3 Jan 2026 06:21:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92F6810E300;
	Sat,  3 Jan 2026 06:21:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b/RMRurc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58E7D10E300
 for <intel-xe@lists.freedesktop.org>; Sat,  3 Jan 2026 06:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767421272; x=1798957272;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=6t6CKKxXR3MA9mdn6b+uRktrS4Ir60pk+aM9REoRizQ=;
 b=b/RMRurclzHlxRYYL4f4syKrHy4ctJrXFXjgxeI/WaE0JT7VZk6B7Z3r
 WQYT/BwmlXg46GhuQHUDe8+Bp3cwn8g7UAt72eSWhdEj5knqgXeuaDVAZ
 fhRNCzTIXYJ5pvA6VZSoZjShrnTkBVIzNTwSuObJC99LNfNhhbaes3K6f
 NKmEOXjWRtxhKSNyaHadIsnpUVBFBSqPjdO9LttNGL6Hiln7nVF1d9ow/
 ZJ6CNXCI2qQfrnFOlhvn2mjAmVOAJ5HeQWeB3W3B5hRKrZDANboBJG9mD
 wnZlQX1gfXGiU+PQPwhuGMyrkeYX8AC0I96IN2a0+PaO9mWKgCheYN0wn g==;
X-CSE-ConnectionGUID: 0oCoA/47Ts+3rGFvYlZ+Wg==
X-CSE-MsgGUID: xrlhMy82Tvm+sz4DOdpKUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11659"; a="68926920"
X-IronPort-AV: E=Sophos;i="6.21,198,1763452800"; d="scan'208";a="68926920"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jan 2026 22:21:12 -0800
X-CSE-ConnectionGUID: S6sA4CnRQdigkVaBVv4cqQ==
X-CSE-MsgGUID: ix11ubpgSnujqcxKEogRMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,198,1763452800"; d="scan'208";a="202912296"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jan 2026 22:21:12 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 2 Jan 2026 22:21:11 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 2 Jan 2026 22:21:11 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.71) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 2 Jan 2026 22:21:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VQuOUY9u85RDnfXudY2F5fXrNef0HaK/ghtnzMLjhNdHr+NZBORxAcGangpxMnLKrDfJRBCKbYTN6QCaScKZBOspKIC4wo0bxEYbTrttN4Q6wuNrKvNNzTvdvr4WsHRtcho1suGOKkbkAfKW9+hHN/rNllv9ViOj9zd3tVX3f+M6kWKjw3lGhce9s841GmkPkKf1HSjQazDLmTtFd4rm8Q0oMv9zLmHJqkyr9pVrVQtlpdshKERK9hjJi004WlXe2+oGmPyu1MZIPDqkXpS1ORGrIIVx73xQMSuW3PPxwdQdNXQbCtEm6cD6AMypyh7JjQYaaF/IjpDgPMfq8ipRyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4HgZ1WJLHk7xxPstT7IWpOONEeO3Uj+83hmx956p/r0=;
 b=Wrd8tT+LIcL7SUASeRAYhsTseY0H6/ANEZ6G9q0zyARfFg9Snt25TPGWlCkiDOlW07dKdDVaP3aCo5LX3rLT4TsogcF0CmueKctwfPL7P8+lffB5mzRn0UBdf+xPa5FalFCJd4+dNv423T3eimpUvFtpJ9lO9WcYxSeQyiFw7TU5i8cU+rGnlHhNubxW60TMAfEAIracT6Cu+L3dZIqtTUGkxMLcPAuMvfW/uBPnNMpkGrfPTJ3MEIlvrLkKTxl0gzRbA+j1UJBZeJCtj1xlPihMxYrqIwl/+vB+E/Q3IrhUdGqZnrMip0PmAamUFadc6eRRfEW6V2YQA9l704T5wQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB8839.namprd11.prod.outlook.com (2603:10b6:806:467::17)
 by SA3PR11MB8003.namprd11.prod.outlook.com (2603:10b6:806:2f7::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Sat, 3 Jan
 2026 06:21:09 +0000
Received: from SA1PR11MB8839.namprd11.prod.outlook.com
 ([fe80::ce6c:3c7f:92ef:1394]) by SA1PR11MB8839.namprd11.prod.outlook.com
 ([fe80::ce6c:3c7f:92ef:1394%5]) with mapi id 15.20.9456.013; Sat, 3 Jan 2026
 06:21:08 +0000
From: "Nguyen, Brian3" <brian3.nguyen@intel.com>
To: "Nguyen, Brian3" <brian3.nguyen@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Brost, Matthew" <matthew.brost@intel.com>
Subject: RE: [PATCH 1/2] drm/xe: Fix page reclaim entry handling for large
 pages
Thread-Topic: [PATCH 1/2] drm/xe: Fix page reclaim entry handling for large
 pages
Thread-Index: AQHcdS406LcziOFrHUiptU3npXlQTLU/7VXw
Date: Sat, 3 Jan 2026 06:21:08 +0000
Message-ID: <SA1PR11MB8839BBCE618C31517EFA4A47AAB8A@SA1PR11MB8839.namprd11.prod.outlook.com>
References: <20251224233638.1535283-4-brian3.nguyen@intel.com>
 <20251224233638.1535283-5-brian3.nguyen@intel.com>
In-Reply-To: <20251224233638.1535283-5-brian3.nguyen@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB8839:EE_|SA3PR11MB8003:EE_
x-ms-office365-filtering-correlation-id: 0459971d-b323-4ba7-50ca-08de4a9048a3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|10070799003|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?VMVaWt4D0ayaFzutLg15sT4xOACz4ZGqR1N33jRWtYts9zwwADqm1mHkw40k?=
 =?us-ascii?Q?t3tT1i1NyrSzGeW4lsZ79Ve2zW/v5i3P6oxgO7JRpvD8EfT08ICeOGZ2a4sS?=
 =?us-ascii?Q?FA96aamotuCTZCN5D1oT6eQbkb9aB5Y8ijumBnAGLXMcQ0XRvYniDkWRGvi4?=
 =?us-ascii?Q?3GAPPOkS2bcr47NmOBrFGhAOfXPmChyF1teZiLUeGu4lDqo8S6OzCoteZlYm?=
 =?us-ascii?Q?wcrAY0N05JzC9p0oUZpOGVUYzBAngiUAMEMI7WOJeV60Oz4NyE9sOnRYqE04?=
 =?us-ascii?Q?mF/pzKvAm18qowC0ccrh85n+TkgdkmcCU1NZIswgk507aiiVlzCI8eeBtIoP?=
 =?us-ascii?Q?ZDXdBqqsWp3108QLdSVZcVqEA9YwsgM38OHQMKMZagKMnVfe/GTostGEtb1p?=
 =?us-ascii?Q?peYPLRjtH7ie4fBzNkVs5njhI1IHBB5/GcVo1byCZfzW9U/Jbxbr7XiXhYpf?=
 =?us-ascii?Q?eNTbWsgHimktv/FBV15gU2KEzRdth9dP4+P4Exucxf2HC3812yLkCGQiverD?=
 =?us-ascii?Q?L58juUeWU53JZiv15hD9IwDdvNCPxueP+/Oo/9OjD23Fp6vsB8m2y1/EQyIx?=
 =?us-ascii?Q?6smnYp461LrVD9hGw7OsmrTOFHPLaJyurQBryiwAWxTmkjo0VDPXDJvNZ70c?=
 =?us-ascii?Q?CewmWjYP9+1DtEyjmnTpd0BEdD3WFl5pWo6BpX7yE7GGwm/grCpyWfGx+39G?=
 =?us-ascii?Q?UY/lgT5GAPrtBv6/X3pz6oz94pseSX0bzHzQaaWPKwmYC7tgrOAk8Wp/HBto?=
 =?us-ascii?Q?PbTbdpyaEV9q6TpUiQRvtXThJAsYG2LPts/3lKHf44KTVjSr+XdlwWVSj2xX?=
 =?us-ascii?Q?JjpxhmfxVhRx5gzPfeNUlByGrasAvjKGV0EpjtTUOSrfrkitulvGc7Xlebsj?=
 =?us-ascii?Q?JC/ml3zRpXA/hxDnsVCERn4ReVG3ZaHuI52WtCSgIPUVgPgD3Qn3wc1N7Cnr?=
 =?us-ascii?Q?eL4Bd9QDQn72prkE+Stct1G0lu2CiVmermkQjhIpxGkgpsviJgHYOXOIikfb?=
 =?us-ascii?Q?T+JGD2DzHusbDaAabQRxGiQn17RMu98MLw0H+DsNEs7svi8j5d02n7tN23ZM?=
 =?us-ascii?Q?RyrVUcl5NbbaUmNCrbVuKtWXyq59GAzwFlqR1dOd2z6TxmfWJCuPdUyjZ7pq?=
 =?us-ascii?Q?u85HbXc3HU0Gw7KquXMaSzIIiV9xftND9mUJk7GuoXA233rI0Me18tVGxXuz?=
 =?us-ascii?Q?UTjTKlNsAlnCyEqsk57gK2AAFRNv0htqugYOLVZsYJIyN+QfjE9KyfPjiEI0?=
 =?us-ascii?Q?/mD30jYDSXU2sCG0xB/GgOO6UspIX6+IBbN3EzJv49F6LNX+y50kI1fBq3Sr?=
 =?us-ascii?Q?LpCDEV8cypVD0cASrkgVJzMMTN/tfIqqrUKYKVmlKMImyHmfcWwJQKou+C18?=
 =?us-ascii?Q?u4Oniaa9kgi02Pl0y4o8b9j8+MoIRK+EPSBPLnfGndBNeebs57i1TG0jRzsS?=
 =?us-ascii?Q?zNgjSUbuJPyuMvDmdSvzSfLGsFObCd9tikMuBkhLeuuC06BqcW4hwluH6U2F?=
 =?us-ascii?Q?D+qowMYvpZSUAfLBjfm2M7snSZhs6L+YIbpQ?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB8839.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(10070799003)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?t+U8kyEpRI5CzTh5PwF7v89k32sqLMeqb6k+QpCBpp5OWcAYzwxwGWeKEU5o?=
 =?us-ascii?Q?A23qJ1CNqJY+jtZk/nsmZtmEhSq9FR2WxSJwYi7chqeQT9ru9CGY3PAGqn5k?=
 =?us-ascii?Q?M+PIi12lpIoUdNVxKIAvMoEePol3go/cLp/G4JGv/Nuk1EYddJrer1FxXh+1?=
 =?us-ascii?Q?Rc+Wb50wxWodPjvYS1THPBXJ69RNR/hKywgDbxEDEbRQABDMkwOO12Opei64?=
 =?us-ascii?Q?aYHluasQC1PygWiiJyJBieYCtLVna8LaT9wn+Eze6DE/RWEgAj/CKW5bkhYz?=
 =?us-ascii?Q?6H6ae5fSMWJL1hAeAMJWlIwUfVCEba/YloANIHkckp6YhR6/pMNBaLbnopEZ?=
 =?us-ascii?Q?4xNWtvL+nERk4qxOZCW1DB+p8orZpsN4sqSia/d5sGqkgOl+8Df3zActZQk6?=
 =?us-ascii?Q?C0PxCiogxr9ow942z9+5OS2aKn2wXGhESFhhrmBpcNTmd3LjncSVA+9ltT1f?=
 =?us-ascii?Q?N9dwwID2o7wPwN1gI9WRpx3U7ZE8ZWjY0ME2CZstWCk0EzQ2irH64iZOImiZ?=
 =?us-ascii?Q?eih6oBYXJSxRLxpuyIYAbEfnVlMYaCg6GQ5tZ/5kWykJ3Gqazc/c9Ba1Hx2u?=
 =?us-ascii?Q?ZtUEXz4M/H3FKhwTGH9fsArPEogovnNLmQEoV+JXdvyIifGuqJ10yzKX721n?=
 =?us-ascii?Q?LlqtHVieXiDp2U+Kd95xHXnTU2OAjfXC4YCb1OUtJ/wGj0sf1Q731Igankyq?=
 =?us-ascii?Q?x/Imtp9XLy4bT+ePfCrpK4sOe5vEdwT/GqJWkIyDQ5tRN++DkLtN6kQavH5G?=
 =?us-ascii?Q?mgILDQ3Mpko3t7C2Qrmnn3W4KW8ImkrDjdw8WWyGvlo18getn/WacuwFEjpe?=
 =?us-ascii?Q?PJaSZSxD2X4qEf60svMFNTaAqsice+ixEcvNzh8wWAWxGnRMNPsiLDBVcpPH?=
 =?us-ascii?Q?pSTldLKqJ9+Lax9lvPj+TFMjUo6926foT/BrqL+964fYKCde6eSyEH9A3foM?=
 =?us-ascii?Q?BTOVKs1GXoDplbkld5wJR7Dkc+PgZ5VaW4229V5dTW/bndIY3VdDdObB2X64?=
 =?us-ascii?Q?4yTw0w1BioB0nYbT2Ag5WQYW1WsCdnEZDi44apofOIL2JvRIcr/Nlco3+z27?=
 =?us-ascii?Q?74/Ws+pMX2upivDbuU/4kG3XXpCMn/K0xA9Tze8Oa6bFQrWXd5AVA1NiK9HP?=
 =?us-ascii?Q?4LOzgODSXkVJx9f9U32XAwSu4JpRrWvRsrjzTgcEOuKcl/R+epX+LRudyCa6?=
 =?us-ascii?Q?xQqwHIlfKerUD9DDhdZ1bfnve9OJBjOBr+j7sBgquPg8u7s3FdpL05n3+Dd/?=
 =?us-ascii?Q?73hZo+AlRCFlarvGpsZskbP8+OYsWf7EzcGi0Ns4R70GvQhjzq8WC8oEvODJ?=
 =?us-ascii?Q?+P4m1NUR7xuIQPleJZNoewKwAQfxeiKUHOejo4M+IuNsCIZdSQ2wn4/MpNSI?=
 =?us-ascii?Q?u9cpY3jBi4f/9jJkWjSFnvdCyXp1SzWtEkv1eQu2XBPNXsKND98vVkjpoWR1?=
 =?us-ascii?Q?wcneyC7UJg95mEUnPbdgSsvah+8P9EuHdqt6gtN/Vi8vRzh6iPGK8GvqovM8?=
 =?us-ascii?Q?yCScwLhzPtvKCun9i4ZQMbLeGMeOIsmGJcrWUdCF6tRILXpI9knTLbffEtfo?=
 =?us-ascii?Q?dYCfcXNi+Aeqgya26y+ISoMEKNH6/H8xsUDrFXMsamqEgoUxVKaI/p8+TfnJ?=
 =?us-ascii?Q?pA0OZEG5chbfYtX+88zHXHoy9sWXWUZVVealbyWNu4bOMi6bKybKsnKsTgQE?=
 =?us-ascii?Q?y5F3ZNGC4K70uixdLTaKuDDyTCNFmnA8caH4AYenSCIntnkhioNOPasMHI/e?=
 =?us-ascii?Q?3AMqOp3W7Kb8ktvmL5/uFyjBkz3BMSKUIRuEyZdJvEHKHgzmwQij/ctaYCbl?=
x-ms-exchange-antispam-messagedata-1: 6l+TIJWKwsT2NA==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB8839.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0459971d-b323-4ba7-50ca-08de4a9048a3
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jan 2026 06:21:08.7487 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Son3s/lfG4SskSszghWR3gCeFxxLQKxdCmWiuPLpFIHsx6SyxwZL3X4BX/sHxULHVFfcWE4yZWNej/I+wK591A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8003
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

On Wednesday, December 24, 2025 3:37 PM, Brian Nguyen wrote:
> For 64KB pages, XE_PTE_PS64 is defined for all consecutive 4KB pages and =
are all considered leaf nodes, so existing check was falsely
> adding multiple 64KB pages to PRL.
>=20
> For larger entries such as 2MB PDE, the check for pte->base.children is i=
nsufficient since this array is always  defined for page directory,
> level 1 and above, so perform a check on the entry itself pointing to the=
 correct page.
>=20
> For unmaps, if the range is properly covered by the page full directory, =
page walker may finish without walking to the leaf nodes.
>=20
> For example, a 1G range can be fully covered by 512 2MB pages if alignmen=
t allows. In this case, the page walker will walk until it
> reaches this corresponding directory which can correlate to the 1GB range=
. Page walker will simply complete its walk and the individual
> 2MB PDE leaves won't get accessed.
>=20
> In this case, PRL invalidation is also required, so add a check to see if=
 pt entry cover the entire range since the walker will complete the
> walk.
>=20
> One small case is some seemingly racy condition where multiple invalidati=
on on the same PTE will caused the value read to be zeroed
> out. In that case, we could just skip the entry since it only occurs if a=
 previous page walks invalidates it.
>=20
> Fixes: b912138df299 ("drm/xe: Create page reclaim list on unbind")
> Signed-off-by: Brian Nguyen <brian3.nguyen@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pt.c | 44 ++++++++++++++++++++++++++------------
>  1 file changed, 30 insertions(+), 14 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c inde=
x 6cd78bb2b652..a79734079ef3 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -1576,12 +1576,6 @@ static bool xe_pt_check_kill(u64 addr, u64 next, u=
nsigned int level,
>  	return false;
>  }
>=20
> -/* Huge 2MB leaf lives directly in a level-1 table and has no children *=
/ -static bool is_2m_pte(struct xe_pt *pte) -{
> -	return pte->level =3D=3D 1 && !pte->base.children;
> -}
> -
>  /* page_size =3D 2^(reclamation_size + XE_PTE_SHIFT) */
>  #define COMPUTE_RECLAIM_ADDRESS_MASK(page_size)				\
>  ({									\
> @@ -1594,7 +1588,8 @@ static int generate_reclaim_entry(struct xe_tile *t=
ile,
>  				  u64 pte, struct xe_pt *xe_child)
>  {
>  	struct xe_guc_page_reclaim_entry *reclaim_entries =3D prl->entries;
> -	u64 phys_page =3D (pte & XE_PTE_ADDR_MASK) >> XE_PTE_SHIFT;
> +	u64 phys_addr =3D pte & XE_PTE_ADDR_MASK;
> +	u64 phys_page =3D phys_addr >> XE_PTE_SHIFT;
>  	int num_entries =3D prl->num_entries;
>  	u32 reclamation_size;
>=20
> @@ -1613,10 +1608,13 @@ static int generate_reclaim_entry(struct xe_tile =
*tile,
>  	 */
>  	if (xe_child->level =3D=3D 0 && !(pte & XE_PTE_PS64)) {
>  		reclamation_size =3D COMPUTE_RECLAIM_ADDRESS_MASK(SZ_4K);  /* reclamat=
ion_size =3D 0 */
> +		xe_tile_assert(tile, phys_addr % SZ_4K =3D=3D 0);
>  	} else if (xe_child->level =3D=3D 0) {
>  		reclamation_size =3D COMPUTE_RECLAIM_ADDRESS_MASK(SZ_64K); /* reclamat=
ion_size =3D 4 */
> -	} else if (is_2m_pte(xe_child)) {
> +		xe_tile_assert(tile, phys_addr % SZ_64K =3D=3D 0);
> +	} else if (xe_child->level =3D=3D 1 && pte & XE_PDE_PS_2M) {
>  		reclamation_size =3D COMPUTE_RECLAIM_ADDRESS_MASK(SZ_2M);  /* reclamat=
ion_size =3D 9 */
> +		xe_tile_assert(tile, phys_addr % SZ_2M =3D=3D 0);
>  	} else {
>  		xe_page_reclaim_list_invalidate(prl);
>  		vm_dbg(&tile_to_xe(tile)->drm,
> @@ -1648,20 +1646,33 @@ static int xe_pt_stage_unbind_entry(struct xe_ptw=
 *parent, pgoff_t offset,
>  	struct xe_pt_stage_unbind_walk *xe_walk =3D
>  		container_of(walk, typeof(*xe_walk), base);
>  	struct xe_device *xe =3D tile_to_xe(xe_walk->tile);
> +	pgoff_t first =3D xe_pt_offset(addr, xe_child->level, walk);
>=20
>  	XE_WARN_ON(!*child);
>  	XE_WARN_ON(!level);
>  	/* Check for leaf node */
>  	if (xe_walk->prl && xe_page_reclaim_list_valid(xe_walk->prl) &&
> -	    !xe_child->base.children) {
> +	    (!xe_child->base.children || !xe_child->base.children[first])) {
>  		struct iosys_map *leaf_map =3D &xe_child->bo->vmap;
> -		pgoff_t first =3D xe_pt_offset(addr, 0, walk);
> -		pgoff_t count =3D xe_pt_num_entries(addr, next, 0, walk);
> +		pgoff_t count =3D xe_pt_num_entries(addr, next, xe_child->level, walk)=
;
>=20
>  		for (pgoff_t i =3D 0; i < count; i++) {
>  			u64 pte =3D xe_map_rd(xe, leaf_map, (first + i) * sizeof(u64), u64);
>  			int ret;
>=20
> +			/* Skip already cleared PTE from past unbinds */
> +			if (!pte)
> +				continue;

Jumped to a conclusion a bit quick on this.
On a second review of this specific case, this pte read of 0x0 is not a cle=
ared PTE but an unwritten value to pte.
It looks like there is a race condition here when xe_migrate_update_pgtable=
s() does the gpu job instead of the cpu write,
So, the pte value read here is an unwritten pte value still awaiting the wr=
ite from bind time issued job.

I'm working on a better handling here that will most likely have to wait on=
 the fence of the gpu job to be signalled
rather than just skipping the value (?)

Brian

> +
> +			/* Ensure it is a defined page */
> +			xe_tile_assert(xe_walk->tile,
> +				       xe_child->level =3D=3D 0 ||
> +				       (pte & (XE_PTE_PS64 | XE_PDE_PS_2M | XE_PDPE_PS_1G)));
> +
> +			/* An entry should be added for 64KB but contigious 4K have XE_PTE_PS=
64 */
> +			if (pte & XE_PTE_PS64)
> +				i +=3D 15; /* Skip other 15 consecutive 4K pages in the 64K page */
> +
>  			/* Account for NULL terminated entry on end (-1) */
>  			if (xe_walk->prl->num_entries < XE_PAGE_RECLAIM_MAX_ENTRIES - 1) {
>  				ret =3D generate_reclaim_entry(xe_walk->tile, xe_walk->prl,
> @@ -1679,9 +1690,14 @@ static int xe_pt_stage_unbind_entry(struct xe_ptw =
*parent, pgoff_t offset,
>  		}
>  	}
>=20
> -	/* If aborting page walk early, invalidate PRL since PTE may be dropped=
 from this abort */
> -	if (xe_pt_check_kill(addr, next, level - 1, xe_child, action, walk) &&
> -	    xe_walk->prl && level > 1 && xe_child->base.children && xe_child->n=
um_live !=3D 0) {
> +	/*
> +	 * If aborting page walk early or page walk finishes,
> +	 * invalidate PRL since PTE may be dropped from this abort
> +	 */
> +	if ((xe_pt_check_kill(addr, next, level - 1, xe_child, action, walk) ||
> +	     xe_pt_covers(addr, next, xe_child->level, &xe_walk->base)) &&
> +	    xe_walk->prl && level > 1 && (xe_child->base.children &&
> +	    xe_child->base.children[first]) && xe_child->num_live !=3D 0) {
>  		xe_page_reclaim_list_invalidate(xe_walk->prl);
>  		vm_dbg(&xe->drm,
>  		       "PRL invalidate: kill at level=3D%u addr=3D%#llx next=3D%#llx n=
um_live=3D%u\n",
> --
> 2.52.0

