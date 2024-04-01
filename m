Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37C7DCD128A
	for <intel-xe@archiver.kernel.org>; Mon,  1 Apr 2024 17:18:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8DAB10E5BD;
	Mon,  1 Apr 2024 17:18:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jPQBeVnT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 858EF10E5BD;
 Mon,  1 Apr 2024 17:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711991905; x=1743527905;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=lhywV430N3Ksox26XxgqPnSsLP9KCRYy1V5Ol2/2fD0=;
 b=jPQBeVnTS7xvKZwedO+punQ6YlT6Mz2k2ZTEFQaFmF4yhoqS+Kr398qL
 +DgIUhyMKbShYaAh2xylV1+muYoq5bpdp+h6eIDo/hoCjB2XTv4EvZWgM
 825xvsxtvqfRVxh+SFLnFDkhVbf+bpN/cc/o64VP/hXhbkTsUerDaAli3
 2qiTPb0ld+bX7sP6FC41O0isSJClRIfP2A1Vw2Y8J7bxYXUVH6ghNYvmH
 jQxHOCtKBZTLCsnUxJwlgScspUXJN8CZo8+9l4kH35bZPdOar0xZ2Ps19
 6KsfC+CZnks3rFKn0Z1leM32wqnwqV6AS0QvpXwB4MNhrSWNDPCvKpPMD g==;
X-CSE-ConnectionGUID: 6VPZof86TIGfyaIMQP5WQA==
X-CSE-MsgGUID: Mg6tzmHgS9miuwpjg+iTpg==
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="6996249"
X-IronPort-AV: E=Sophos;i="6.07,172,1708416000"; 
   d="scan'208";a="6996249"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2024 10:18:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,172,1708416000"; d="scan'208";a="48969959"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Apr 2024 10:18:24 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 1 Apr 2024 10:18:23 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 1 Apr 2024 10:18:23 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 1 Apr 2024 10:18:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nfYAyg4q4zh8PKarpD0hJS1CIBlvhNqzvbHfzG94yBMxu+lXFiKqRA2SitvEofeLkcKQRA1m9J3otXXqhQ8Xl0BISk9iOa50jj1o0jopZV5s9Lez+G7XqDI2sgjYddEHy9E6uPP094O5k8/7de7ICpFE+QzUMb1PEuaKnSBUKTFvFEpwAv1bAbOOfsTWMYF108Gbfx8pHb7qTgoAjdzXEnRxCbrbgQmzJ2Y/hmrPD1MKM+wT2+t6iMA4gAG06pRL8Hy6PR+YCXA7w6Wuc9emtQYFTkGxiQtvM395kkiGChdKienu6u7QIU9A/nVvzWR5w0m6PLct7HyhR3HZD5KGzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UHNQf7wsqrJ1dcGRQ17VoUY4szKsLmeBrYi9Dtvtdm8=;
 b=ARAfCKAaW2yHDboZdgCrv0KqNv7iMWFt8uE41S/AnEBV01ZCxyTMRQXnqvb/f9NiA3/tpGf9E98kNksgWzlRAa7aNXdva2cPtAg5We+MA7Q9eHsNVsaz7NWPYdLaBEuojEIQkNCRjY4KPZBEuKnv0oJoMbMvleFkpBPhNC9CTiLNM1NB/7F/j6w8gWds2DB9591Tl/6Wn5GjHqVxTva/t87H+1NL03MazWLO2z24OrYVayQEdNOEfZXcfAjr4cLhTZiyg5cesvhgNPJkAwlcp9vmtOsigSFfcs1nretRxU8asIMmqqhJcW7XlkHAE4fTDHVS28cjYR6HEe6kpy7Mgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by MW5PR11MB5761.namprd11.prod.outlook.com (2603:10b6:303:195::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.24; Mon, 1 Apr
 2024 17:18:21 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::1604:d970:ed05:4729]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::1604:d970:ed05:4729%7]) with mapi id 15.20.7452.019; Mon, 1 Apr 2024
 17:18:21 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Brost,
 Matthew" <matthew.brost@intel.com>
Subject: RE: [PATCH i-g-t] tests/xe_exec_threads: Skip Compute engine for
 legacy mode
Thread-Topic: [PATCH i-g-t] tests/xe_exec_threads: Skip Compute engine for
 legacy mode
Thread-Index: AQHahEHoleQQPMgxeEGG8U8gtuHG1rFTkxaAgAAVBUA=
Date: Mon, 1 Apr 2024 17:18:21 +0000
Message-ID: <SJ1PR11MB6204D392668110222C006F9E813F2@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20240401144834.577481-1-tejas.upadhyay@intel.com>
 <j7oll4xipndqfcfplyrgjvvdmjylu3blar7ar5lnd5lwhbfvhr@sfl3padlczqi>
In-Reply-To: <j7oll4xipndqfcfplyrgjvvdmjylu3blar7ar5lnd5lwhbfvhr@sfl3padlczqi>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|MW5PR11MB5761:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: eQMRCYaXf/lkb9iTXvMAMmEmBRjb1NwRAlcMcQrQPvY0+vou0eBSek5MYzEMLg3soqZj4q+mbZT/JBQHltYmcqAIViVAgGpRo4405oqEo3ukD7Hvs3ZhfeLayN8S0BeQ18g0BfZ4nFgLcSXYtquhJ5xalWUyEj8xtdmhdnv7zXyMtAet1FImXN7fG6U3jdpoATX23LWDTUNrK5W3ND3xUvF6eK7yh4hpmnA4VmFXWPfAHHcVkdPhIMttKNN3NB1Jjs360ETv/iBi3nzclylGC94+dbCnJoxW+pGtazkaSIL7goH3UnbDo4vJGid5zRk92ACcZvLhP5xxH8+eBSeBnxk1SoWtDDKhVKEO9iYEW61NxurWHc8MwCrWUe7VQyvlbly80+dQ+06j7E32RM7t07XtcZm2yo2GpExxnrVHfUkKkJH722NFS1zl8cwxUIP5NbWLl9MotjbcxfqbvmYkCEhF2km2ImgqIzFXG7uHJuOHULbj9x3SftT0rp8Qvfa2QYp88s5uHpkbD3qdWm1Ge0kfnfEdb/Ufo5G4xeBIAYCucUdPxbtLX72Ryr9462JXiuoNDJFUHRZVmpQkFUGAujim/Xrg83wOdritE2aqRiqZ5ChxeDlv+z3dwYhEkiaR7F+/3hgC/MBDCs55XO4PGSbHs76/+YSH/V8O8N4RgKQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?heqDizKHugYe4xnuh09cGDOgf4KP5LS3t4pK/1p4MDpIOzdlMYa0aobK8V77?=
 =?us-ascii?Q?vvjbf3zc844QvhHBYjMQ4O3/voN+BSpXi3gbq/2g8PdQ4o0kiGCNr4gzqWvI?=
 =?us-ascii?Q?TIRsI4cjs3/sYfiRMiys6VETgvJxvaiLJ6gO/nGUL8xJVvyGtT2KXV72MDT7?=
 =?us-ascii?Q?FHgiKd9t2pmN2pMcFMcS6xmmIQSjZbQd763ppRnd3WF8pGpVG8YemlGPfj3N?=
 =?us-ascii?Q?oDBmjqDoRowVoj6hxs0E0XbsSfhrIGHkUYz6QOVzvTxbJfxI9tEkBDIIW0bE?=
 =?us-ascii?Q?LcioLOiJ6onXBwKE6/QVCNSJi20cCl09jOtKo0YO7MkBORvSCaMTy+FhBMIe?=
 =?us-ascii?Q?QzIc2OLpxmYMSARMO0GNcsjTtyPkYhc5AxYX41Hodfihvjnd2Jj3AamtKpMm?=
 =?us-ascii?Q?eZEOXSKWVZqfIvGg0Ke+gkA1j79YxIWeOTZ8+x3CVKTwiGXWg9Z03vsY1IvG?=
 =?us-ascii?Q?T9/9vTiG/lldbgujjNfMcBd3B9FbKXRZpPwOU1v2Men0a+0WRjXDBFombiSt?=
 =?us-ascii?Q?+Gd5WsM9To65pxq2RLK/0Mrfrems/fu+igFYSYT96/cIhtrc43Mzej434Dgt?=
 =?us-ascii?Q?ZUVllW5+EahAGfIVs8LaScqYhZhoQvRr2fhnW0dPhgFt8D6SubFdUDTvhVoK?=
 =?us-ascii?Q?f1bOANC3ZR6/cBIEjXdJCRbru62Vi6Oac17h432n8CH3sJenR24OMhP9yLuf?=
 =?us-ascii?Q?qtMQRZyc3Sd2eWGp2WAPyCEyIRKqQz/Gc3dVFBLCUdpnd+RGw66SxrkWfr0I?=
 =?us-ascii?Q?/RFzO84rJQ+3I8GXchUQvUkBP7nhq5vGoInlSI6mwDs35aKzqmtFwxqiSy3r?=
 =?us-ascii?Q?4lGlTp2+lI1rIuQP/ASzyPGvOkiTJO2X7jyqfx5RzJPIIOOy41sVvIFLFzMh?=
 =?us-ascii?Q?nNws289qOYZbGNp/Xmb1jkSwAuEC2pYkLmrTt5+XwPKotJQ6xABh6rTW6dXL?=
 =?us-ascii?Q?QmlmhWwSsxu73QFuoBz1qQXLSWBC07iwtX1bcp0GmylzGVdV/z2Qkg+dSIj/?=
 =?us-ascii?Q?BSWkROMEw5HokYOLE5UbSi92+GjJGAJ+5knuUjUOvlXFQ3LiIYoEPRPDe21d?=
 =?us-ascii?Q?Y1hPbyee86YhfxayzNjKR4RLYzYS3gY6OVfa1do0AlD4SmNhOl15BktptKId?=
 =?us-ascii?Q?vwph++yzl3I6tOxabKixZGVYEH5HfO8CruNXgz3QugMXfl/uiupidANylMvu?=
 =?us-ascii?Q?/p10ZOeyyxPvu3+CBFiSDQQBdnNDxV7Eg09rZGHrdfTZH73bep/HTg0/AlGg?=
 =?us-ascii?Q?97CU5KSYOdipgPUU/tfwiWCg4Js9GlIjriKH96t25yX2oQQq03leRfU961en?=
 =?us-ascii?Q?AqVvH8fiV+tgOz6tnpt/FPe0RzrdaRTzB2jRC9BxiJndq9gang7tCDP3A2q4?=
 =?us-ascii?Q?jFt+uRXFQiV5irept33P37JO1lIj4/ZDyUZubUEEz/v4ZV4+AebrWgVEsSbu?=
 =?us-ascii?Q?DY/QefXo9+G2zfSdtzYZO8I+n6BlR9WVEZafG0IAsVx/8oOxk4xXiWJDeFpH?=
 =?us-ascii?Q?NIhpjioZx2ejBBbOIPkV3VrWDuXjskZl2vxbcPYOIBXM44N9nz6SkFELwTdE?=
 =?us-ascii?Q?ExcQMZ9Qi1qg8HLiDdNFu+ItekdMm8YrU+eDlbdNXIvO01WAaOJKWXXvLyfK?=
 =?us-ascii?Q?w8XhXqZTaAEXqai+hh8gsMU=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0cea363-5be3-443d-8f8b-08dc526fbaee
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Apr 2024 17:18:21.0393 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pFB2H3I0VrdkrA6y4Alu8etWuK4dkhlgSLNrb40jalhCoOYFts6cwse8q4bBlYHOiSYM+Mo7JnMz/fspTKUDvDCVvEQAlX7EehikKUjyO4g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5761
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
> From: De Marchi, Lucas <lucas.demarchi@intel.com>
> Sent: Monday, April 1, 2024 9:31 PM
> To: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> Cc: igt-dev@lists.freedesktop.org; intel-xe@lists.freedesktop.org; Brost,
> Matthew <matthew.brost@intel.com>
> Subject: Re: [PATCH i-g-t] tests/xe_exec_threads: Skip Compute engine for
> legacy mode
>=20
> On Mon, Apr 01, 2024 at 08:18:34PM +0530, Tejas Upadhyay wrote:
> >RCS/CCS are dependent engines as they are sharing reset domain.
> >Whenever there is reset from CCS, all the exec queues running on RCS
> >are victimised.
> >
> >Lets skip parallel execution on CCS with RCS.
> >
> >Fixes: VLK-55941, VLK-52341
>=20
> these shouldn't be here.
>=20
> Also in the title of this commit, what do you mean by "legacy mode"? It
> seems you are just blocking CCS regardless of any flags.

Legacy meaning non-compute mode, skipping for compute indirectly meaning go=
ing in legacy mode and not compute mode.

Thanks,
Tejas
>=20
> Lucas De Marchi
>=20
> >Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> >---
> > tests/intel/xe_exec_threads.c | 8 ++++++++
> > 1 file changed, 8 insertions(+)
> >
> >diff --git a/tests/intel/xe_exec_threads.c
> >b/tests/intel/xe_exec_threads.c index e9588f9b9..b1c65e1c5 100644
> >--- a/tests/intel/xe_exec_threads.c
> >+++ b/tests/intel/xe_exec_threads.c
> >@@ -996,6 +996,14 @@ static void threads(int fd, int flags)
> > 	}
> >
> > 	xe_for_each_engine(fd, hwe) {
> >+		/* RCS/CCS sharing reset domain hence dependent engines.
> >+		 * When CCS is doing reset, all the contexts of RCS are
> >+		 * victimised, so skip the compute engine avoiding
> >+		 * parallel execution with RCS
> >+		 */
> >+		if (hwe->engine_class =3D=3D
> DRM_XE_ENGINE_CLASS_COMPUTE)
> >+			continue;
> >+
> > 		threads_data[i].mutex =3D &mutex;
> > 		threads_data[i].cond =3D &cond;
> > #define ADDRESS_SHIFT	39
> >--
> >2.25.1
> >
