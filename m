Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC659C61DB9
	for <intel-xe@archiver.kernel.org>; Thu, 27 Aug 2026 06:30:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CBFA10EE29;
	Thu, 27 Aug 2026 06:30:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q6Dbg+s/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F88710EE29
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Aug 2026 06:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787812253; x=1819348253;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=rHRHuaWzvD3SWfAO+llMeMukSYoOZR99zDest7fdLMU=;
 b=Q6Dbg+s/7oNnAVL7/UgoHnJYQ24zquYSEknwEXoq1iYM/kqw1O1C1omJ
 ALMYKIHQRoMSCa0Yz23FVZ49mWDy2CZXGfuwkubOWx7oPoca89FsQ7w0q
 zOoBZeHk6Ij9ImshjuInE/Sh+1A3t4yWl4A9F6EQFSmpz36yqm5gnYalG
 HxSLIC2LQoCccdp+8oUM56mdA6eQg1YL4PU26eOe3DokY4NfsDA6fX0qn
 Q8nr08sS89gynEfSMv8HCmgD+vCcIAhlrZnQq7G+0dswJ4Gjw1mJg7fmf
 CHV7TEe4r229VKJyvxJ1XWINCH20IIwYGEBsFVrLTABkCGenNrr/0bpYp w==;
X-CSE-ConnectionGUID: Qab1ZXYyTjKzYV+ezpQICg==
X-CSE-MsgGUID: LhhbZQvoSoSGEwJ9FUmIzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="99655946"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; d="scan'208";a="99655946"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 23:30:49 -0700
X-CSE-ConnectionGUID: lvDTzFIYRYykOKBMHch1rw==
X-CSE-MsgGUID: jYCM0Xl2Qjaoadp28uiDmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; d="scan'208";a="305995281"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 23:30:49 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 26 Aug 2026 23:30:48 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 26 Aug 2026 23:30:48 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.25) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 26 Aug 2026 23:30:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JK8sVzrboVsHy/ihMkL131I91sMdax7so4WnBh4q3f91C8+PBbFXjUT6ouecoRmzuar9Ko61VnwTJ2hK32Mh+XXXWRl5vvy85HpgIlFRaVXevU7qrAjid0e/TBscN8QKkvMa+ZmsLez4GGXHw3hUei0FnmVCzfmpkH0yalLj478vM3DEAzV4hJDksR1cz6cIbTLDa2b264ON7sYeN58Ypt6TgkSowXOuyyAcBpzS9YLwZqjb95tLMKrBaLPXpL8d9Gov7ylX5uD5mIHSw+0nUQhBFEyxYiP35jxwh3XI9Tj/u2xp0+28kd/BR+5IDp7Hp7Tyf+m6+FGt2/G/S6Vjcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yXWGRz2mfhMgLIzIx8J5k3hPFaCudtCIBcFa6ZH6ev8=;
 b=Z3SlHOmln9x+1bho5UHCH/lJKlJ7tBlz8aha8XDUmeWb6IGB/HYxIp4uzzzl1MMZVu30bLZxphFKHSlDcbHFQqjRbUClasBc/JuyktmHaTYMbEXmU5yojReJnBEG2d/YWrAk3byi9OV3UMKNcJKglGcTwbFV2O/XB9Ag6yVWA0MICdfcodTXTxu+MaBHsf5RyBIgyNhcqs/QzYEZFzkmg9KqtOMH9G4k86+8kCHxvDgAzNsxVgsOWTp697DOHdEKLJF3H4v5EjuVaeKunHfMebyEZQWpLlKMFuMV9mJHBdVAF/78H2G3eXayjdIjLzdn3tOgIXNWuBQqZmtn7IDLRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ2PR11MB7645.namprd11.prod.outlook.com (2603:10b6:a03:4c6::11)
 by PH8PR11MB7966.namprd11.prod.outlook.com (2603:10b6:510:25d::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Thu, 27 Aug
 2026 06:30:43 +0000
Received: from SJ2PR11MB7645.namprd11.prod.outlook.com
 ([fe80::d3b1:f4f8:31a7:14b5]) by SJ2PR11MB7645.namprd11.prod.outlook.com
 ([fe80::d3b1:f4f8:31a7:14b5%4]) with mapi id 15.21.0360.006; Thu, 27 Aug 2026
 06:30:42 +0000
From: "Tangudu, Tilak Tirumalesh" <tilak.tirumalesh.tangudu@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>, "Vishwanathapura, Niranjana"
 <niranjana.vishwanathapura@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH 2/3] drm/xe/tlb_inval: add xe_tlb_inval_ggtt_full() GGTT
 invalidation helper
Thread-Topic: [PATCH 2/3] drm/xe/tlb_inval: add xe_tlb_inval_ggtt_full() GGTT
 invalidation helper
Thread-Index: AQHdNU3enVo1kJGP8UimNR6zIVlGI7awuDgAgAAExwCAAAC/AIAAsTtQ
Date: Thu, 27 Aug 2026 06:30:42 +0000
Message-ID: <SJ2PR11MB76450343245D833A562DCDC1C8AD2@SJ2PR11MB7645.namprd11.prod.outlook.com>
References: <20260826112533.3289978-1-tilak.tirumalesh.tangudu@intel.com>
 <20260826112533.3289978-3-tilak.tirumalesh.tangudu@intel.com>
 <ao8-8NPZpFCiBSQB@nvishwa1-desk> <ao9C8umPyn2ANiIg@gsse-cloud1.jf.intel.com>
 <ao9Dkj8tZJv9wK5x@gsse-cloud1.jf.intel.com>
In-Reply-To: <ao9Dkj8tZJv9wK5x@gsse-cloud1.jf.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR11MB7645:EE_|PH8PR11MB7966:EE_
x-ms-office365-filtering-correlation-id: 5602d08b-28e0-4056-2f35-08df0404b826
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|10067099003|6133799003|22082099003|18002099003|4143699003|56012099006|5023799004|11063799006|38070700021;
x-microsoft-antispam-message-info: 9N9aADJXpl6fwZDfZAdo3elw6E83iqT3vbc1fJh4u9UspRgOWVqHZE82ausHedac/CkI1qfYvC2DOpKOCnnpUP27Qlfm1GurcotusO/vi947w2UZVLGhi9eOR8OLm4/bR/FIxlsJmBS5aQOQNkT83ZxCYRV7LaXZDNzr+5ZBIM6ha+xEqA7AeFq+lnXf+x1ap6F79rAx+0Yck16TsKqH368XUfIRhN1fBNnCqXEFWrgU2MJP48Cp0rPJPHYhy7fXScKz/84FdhqGn1MGCmjaACcaxo7NWHPZAn4WjZJX0hqTFCpexzHah/gHJdH8wvbTPHfp+9hwC31Ab3ZOCxDbq0Ht6aszpr+YM2MW5p5jdYecsF5jtbYbOdZWKauxoSLkdEAT48NEjZ1xE9UHmNPD2GmGExpNDdjJVH/nT6XcIoP7gP3pQ69rNGWL6YoCgHH1B5mu4DtdXNpjuMMuFaR+44XdrIrIBC7nTrnoEY7QVkmiCGFa8+bBIMeba1umRYZ1F5GzWyD3wfb5lSjeA4oePPyocxKgk6QREA9wRiYEfxDnVJqfX3a03FawD9LtSdOzPl2YxJtx3kzTv9HCAdwRTM7wHa4517mekSrO/4kiDGjFeMiJ/3YWJkmbAeZ67Z983X/16eBg/qM8xroiMd+3IuM1BVpncNJHVCJGW2eJ2dnSCwjJgveFiRUqhawbv/jEUOtT1yQjhsw4OZyljjN3Qw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ2PR11MB7645.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(10067099003)(6133799003)(22082099003)(18002099003)(4143699003)(56012099006)(5023799004)(11063799006)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?2Lf6f+KprROmSVCDG9yYjyGZ6rzW9V3uyiofUr4qSkiJE3LMAmEF8o0pBfQ+?=
 =?us-ascii?Q?SOVQsIluyVNWxXRlc1AYqF/q/joQq0Ky0u7CTWp79q40nEDBxccZ5rIhQ9Op?=
 =?us-ascii?Q?dV3qZIb1Ccwy0ghDmQy/xJu+rNVqYztcLKqSmbvfnQ89jICKhPWNPD/FFp0r?=
 =?us-ascii?Q?gUDNpCh8QlzzV74pnLCV+KK3WzaUSX3YjCgRzQpBRaNL1xo0l5CnRrY7c9fq?=
 =?us-ascii?Q?vtqfXbbNVa7scR9pvVCiNE66xR9LMw7CtEGXUm9uutpjNE762zSwBzIFu/TJ?=
 =?us-ascii?Q?MmkcyusHji8DWa+ZJWiTs94lHgOfERDi60BWhzOKdGbwhlYm/56DsVDugffA?=
 =?us-ascii?Q?LU/xY+63gvX3KCSVe64nVLzYXk6pWKvQgpUjPh1Pdx/SDtEhd8qMJz5/GvIm?=
 =?us-ascii?Q?EospOcL4/mVY/8M3PEqshiGzR+CRObvkPKbRAGvxq9PeX2+Wq0mbAWNm3sJa?=
 =?us-ascii?Q?FwJGGKLGYA8eJ7Dae+GTkrnrvKVOWgZEu+N7ETCR3WE1TbG30nRliNHwpgB0?=
 =?us-ascii?Q?qJ5NUnGni9tyR+l4miiSY6di/2jMiZwG6kVS6GYyNQMlqoSta68Vf9Imh2K4?=
 =?us-ascii?Q?gS0KkYDDcZJd1fEbaRL9v1NOx6KoLK1vDkDpjiiq+vADvLCF4NL9OMTqLxWY?=
 =?us-ascii?Q?QFbnPCd4uVBpAhQAiPCG7JE/Q9ZjrQuDz93ERppI0s51oJd/mJSHpC0RDp0v?=
 =?us-ascii?Q?GDWBkvoBsY3YFWVU8T4z9vnvnAAPRFQ2wnuhF+pVrcGmmLSmysQe+ApoJnT1?=
 =?us-ascii?Q?aSsS8/TLsBxKuBxt5cQRAxTFbBq8lcY6xTPSxJoZSdEJZnA1Vr7sQsDvS4uj?=
 =?us-ascii?Q?5H7TcK179939/YtyuCbffMVM2Wc0DC7fCOeoV6CsZ+8EbOWU0WEtHwW9PG3Y?=
 =?us-ascii?Q?yvlRZ9KIIchh/BNx7XO79O+njRPJuK05XZRQ8ZA6vGzqDbeLx30qGpwCdFs5?=
 =?us-ascii?Q?iQ16ukOf7zGw6WnbECk+VupiQnRBrutkAvZedGn1GraRO701XAfetXmd8Ibp?=
 =?us-ascii?Q?aNd2n5EkYSdmYSL15qhkZXpUbNFc6Ynk58KQRwb1eJ2tt6V2f+hgI9Hh3nc8?=
 =?us-ascii?Q?Gc1385pBQhmKa5PHtDFGe8M7jH7v1u/m0uFO835si+wNeVjK5Rti523UsU5M?=
 =?us-ascii?Q?aMD43NKAGcRm2giyXytyHpkt3MH38GLpXMdGZA40YuAhnilmyIkZzJzGOA9J?=
 =?us-ascii?Q?tC4B5kTjKvIIB9bys/RH4Js1sPmE30nNizyI33y6QwL6+YOnZGfP9cPr9KJb?=
 =?us-ascii?Q?QF/p8lVfx5n8MEptOTNG2mVUlQM3sG97VJ2WZOjfUplLEkjSCaWKFApOnJiz?=
 =?us-ascii?Q?nomUESoEAAjYAakAK4SBdfrXWS1WqLfOOEKIGTSQP0IDF1m919NqSvNfGgyB?=
 =?us-ascii?Q?FuBetsa1uwT7Wo4EuXictahCMub2D3gIPEM1B2mfVP0UhYFCQaYoriuGTO/E?=
 =?us-ascii?Q?TkoimpDj+dGtGN9fAJWb8+sX2/kIZPw/1j1ODPuVtxqdafp5QPn8AX4OCSYQ?=
 =?us-ascii?Q?ZdaGcx86jdL8lrDyaLYHRDT766+QB6l0MRrf60jJrsWEwVfupavovDkmZyil?=
 =?us-ascii?Q?ES4vtf8rn9wHi1uzmMNY7gpomFqq3VvtoHu3HLh9kQGZx3pBtCgTI+Ol0g6o?=
 =?us-ascii?Q?uxcJq6tKvHwN1j2opiNPuMm0D8FzbasCJmQTIu+DbQK7LonquLSQbrp80LOr?=
 =?us-ascii?Q?FI0UKE4QIC6XQHwvoRfjdkGWU0Jx9mHrXicy5y6f+TBtINu8flNsf+5hgXcC?=
 =?us-ascii?Q?eBYb64V5JJw69qa1Wsj4QAduT3Pd6Iw=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 5Lz87MRFXIFjZrUtZv78qjpw5IpSR7x9Yx9aIVQNOPgUCVYiPjMFCCYtDUHsE/1kpevIJllzUqZl9If0QdvGeUcT5aKCaV2iaQkmsDG9fDKQAUApSYkv5LPs0QytI1nPXeCGMgsljJUz0ejTuT32iozBOwe7T1Zl/wdFFz+9sU8rsomWXyedllhQxbv3tzwls2zT5LSUbXTy607cxA7/Dg2qGl71Kswywi6iPDLzG5C0/sJeu5Tw7bvomrPA4OSQID0qKPlSm5mQSBxeyvZRrfF5d7obj5f/htpTm3AJnp8hytogKJ6HtsMTqrJsLlwHrW8STp9xlVIdYEeQSEhyAA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7645.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5602d08b-28e0-4056-2f35-08df0404b826
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2026 06:30:42.5421 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wj8bpcT0+VHNa/V8LFt2K++CdaKOAIlnSMHF7H29o+Xn6mLyYvZDaQR15afzMv33yGa6RT8u98acS9pwSxPh6Z3oPIMEib8t/A97oUWdfs5dveFq49mXc5l6u0Pm5aWH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7966
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
> From: Brost, Matthew <matthew.brost@intel.com>
> Sent: 27 August 2026 01:21
> To: Vishwanathapura, Niranjana <niranjana.vishwanathapura@intel.com>
> Cc: Tangudu, Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>; intel=
-
> xe@lists.freedesktop.org
> Subject: Re: [PATCH 2/3] drm/xe/tlb_inval: add xe_tlb_inval_ggtt_full() G=
GTT
> invalidation helper
>=20
> On Wed, Aug 26, 2026 at 12:48:02PM -0700, Matthew Brost wrote:
> > On Wed, Aug 26, 2026 at 12:30:56PM -0700, Niranjana Vishwanathapura
> wrote:
> > > On Wed, Aug 26, 2026 at 04:55:32PM +0530,
> tilak.tirumalesh.tangudu@intel.com wrote:
> > > > From: Tangudu Tilak Tirumalesh
> > > > <tilak.tirumalesh.tangudu@intel.com>
> > > >
> > > > Add xe_tlb_inval_ggtt_full() and its GuC backend
> > > > send_tlb_inval_ggtt_full() for full engine TLB invalidation within
> > > > the requesting VF across all engines.
> > > >
> > > > v2:
> > > > - Refactor with new helper xe_tlb_inval_issue_op_wait() and
> > > > address  nits (Niranjana)
> > > > v3:
> > > > - Avoid TOCTOU issue around CT state (Matt Brost)
> > > > v4:
> > > > - Propagate real send errors instead of masking as -ECANCELED
> > > > (Sashiko)
> > > >
> > > > Assisted-by: Claude:claude-opus-4-8
> > > > Signed-off-by: Tangudu Tilak Tirumalesh
> > > > <tilak.tirumalesh.tangudu@intel.com>
> > > > ---
> > > > drivers/gpu/drm/xe/xe_guc_tlb_inval.c   | 25 +++++++++++++++
> > > > drivers/gpu/drm/xe/xe_tlb_inval.c       | 42 +++++++++++++++++++++-=
---
> > > > drivers/gpu/drm/xe/xe_tlb_inval.h       |  1 +
> > > > drivers/gpu/drm/xe/xe_tlb_inval_types.h | 10 ++++++
> > > > 4 files changed, 72 insertions(+), 6 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> > > > b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> > > > index 046d0655122f..665483bf2e67 100644
> > > > --- a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> > > > +++ b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> > > > @@ -98,6 +98,29 @@ static int send_tlb_inval_ggtt(struct xe_tlb_inv=
al
> *tlb_inval, u32 seqno)
> > > > 	return -ECANCELED;
> > > > }
> > > >
> > > > +/*
> > > > + * Emit INVAL_FULL (intra vf) to invalidate engine TLBs across
> > > > +all engines
> > > > + * within the VF.
> > > > + */
> > > > +static int send_tlb_inval_ggtt_full(struct xe_tlb_inval
> > > > +*tlb_inval, u32 seqno) {
> > > > +	struct xe_guc *guc =3D tlb_inval->private;
> > > > +	u32 action[] =3D {
> > > > +		XE_GUC_ACTION_TLB_INVALIDATION,
> > > > +		seqno,
> > > > +		MAKE_INVAL_OP(XE_GUC_TLB_INVAL_FULL),
> > > > +	};
> > > > +	int ret;
> > > > +
> > > > +	ret =3D send_tlb_inval(guc, action, ARRAY_SIZE(action));
> > > > +
> > > > +	/* CT unavailable means nothing runs on the engines; treat as
> cancelled. */
> > > > +	if (ret =3D=3D -ENODEV || ret =3D=3D -ECANCELED)
> > > > +		return -ECANCELED;
> > >
> > > Looks like we don't need the check 'ret =3D=3D -ECANCELED' here (redu=
ndent).
> > > Basically, we only need,
> > > if (ret =3D=3D -ENODEV)
> > >      ret =3D -ECANCELED;
> >
> > I think actually -ENODEV is needed because it is odd corner that only
> > GGTT invalidations can legitimently hit with a blind CT send which was
> > my suggestion.
> >
> > -ENODEV is the return if the CT is disabled (cold boot start)
> > -ECANCELED is return if the CT is stopped (runtime toggle)
> >
> > GGTT invalidations can be issued during cold boots as these are kernel
> > objects, PPGTT cannot because these are user objects.
> >
> > Thus, I think this actually correct in the current code.
> >
>=20
> Opps one more thing - iirc wedge devices return a different error code, b=
ut that
> might be getting revert. We should check on that as I think wedged needs =
to be
> handle here.
>=20
> Matt
wedge devices return ENOTRECOVERABLE now, can I go with the below?
    if (ret =3D=3D -ENODEV || ret =3D=3D -ENOTRECOVERABLE)
        return -ECANCELED;


-Tilak
>=20
> > Matt
> >
> > >
> > > Also, It seems bit odd that other functions like
> > > send_tlb_inval_all(),
> > > send_tlb_inval_lmmtt() etc, has similar structure and similar
> > > documentation in xe_tlb_inval_types.h (regarding -ECANCELED), but doe=
sn't
> do this conversion.
> > > So, they are not treating XE_GUC_CT_STATE_DISABLED (where
> > > guc_ct_send returns
> > > ENODEV) as a 'cancelled' state. May be here also we should do that
> > > for now, if we need fix, then it will be a fix for all of these callb=
ack functions
> later.
> > >
> > > Niranjana
> > >
> > > > +
> > > > +	return ret;
> > > > +}
> > > > +
> > > > static int send_page_reclaim(struct xe_guc *guc, u32 seqno,
> > > > 			     u64 gpu_addr)
> > > > {
> > > > @@ -346,6 +369,7 @@ static long tlb_inval_timeout_delay(struct
> > > > xe_tlb_inval *tlb_inval) static const struct xe_tlb_inval_ops
> guc_tlb_inval_asid_ops =3D {
> > > > 	.all =3D send_tlb_inval_all,
> > > > 	.ggtt =3D send_tlb_inval_ggtt,
> > > > +	.ggtt_full =3D send_tlb_inval_ggtt_full,
> > > > 	.ppgtt =3D send_tlb_inval_asid_ppgtt,
> > > > 	.initialized =3D tlb_inval_initialized,
> > > > 	.flush =3D tlb_inval_flush,
> > > > @@ -354,6 +378,7 @@ static const struct xe_tlb_inval_ops
> > > > guc_tlb_inval_asid_ops =3D {
> > > >
> > > > static const struct xe_tlb_inval_ops guc_tlb_inval_ctx_ops =3D {
> > > > 	.ggtt =3D send_tlb_inval_ggtt,
> > > > +	.ggtt_full =3D send_tlb_inval_ggtt_full,
> > > > 	.all =3D send_tlb_inval_all,
> > > > 	.ppgtt =3D send_tlb_inval_ctx_ppgtt,
> > > > 	.initialized =3D tlb_inval_initialized, diff --git
> > > > a/drivers/gpu/drm/xe/xe_tlb_inval.c
> > > > b/drivers/gpu/drm/xe/xe_tlb_inval.c
> > > > index bbd21d393062..7c3bf32d9258 100644
> > > > --- a/drivers/gpu/drm/xe/xe_tlb_inval.c
> > > > +++ b/drivers/gpu/drm/xe/xe_tlb_inval.c
> > > > @@ -301,26 +301,56 @@ int xe_tlb_inval_all(struct xe_tlb_inval
> > > > *tlb_inval, }
> > > >
> > > > /**
> > > > - * xe_tlb_inval_ggtt() - Issue a TLB invalidation for the GGTT
> > > > + * xe_tlb_inval_issue_op_wait() - Issue a TLB invalidation and
> > > > + wait
> > > >  * @tlb_inval: TLB invalidation client
> > > > - *
> > > > - * Issue a TLB invalidation for the GGTT. Completion of TLB is
> > > > asynchronous and
> > > > - * caller can use the invalidation fence to wait for completion.
> > > > + * @op: backend invalidation hook to issue
> > > >  *
> > > >  * Return: 0 on success, negative error code on error  */ -int
> > > > xe_tlb_inval_ggtt(struct xe_tlb_inval *tlb_inval)
> > > > +static int xe_tlb_inval_issue_op_wait(struct xe_tlb_inval *tlb_inv=
al,
> > > > +				      int (*op)(struct xe_tlb_inval *tlb_inval, u32
> seqno))
> > > > {
> > > > 	struct xe_tlb_inval_fence fence, *fence_ptr =3D &fence;
> > > > 	int ret;
> > > >
> > > > 	xe_tlb_inval_fence_init(tlb_inval, fence_ptr, true);
> > > > -	ret =3D xe_tlb_inval_issue(tlb_inval, fence_ptr, tlb_inval->ops->=
ggtt);
> > > > +	ret =3D xe_tlb_inval_issue(tlb_inval, fence_ptr, op);
> > > > 	xe_tlb_inval_fence_wait(fence_ptr);
> > > >
> > > > 	return ret;
> > > > }
> > > >
> > > > +/**
> > > > + * xe_tlb_inval_ggtt() - Issue a TLB invalidation for the GGTT
> > > > + * @tlb_inval: TLB invalidation client
> > > > + *
> > > > + * Issue a TLB invalidation for the GGTT. Completion of TLB is
> > > > +asynchronous and
> > > > + * caller can use the invalidation fence to wait for completion.
> > > > + *
> > > > + * Return: 0 on success, negative error code on error  */ int
> > > > +xe_tlb_inval_ggtt(struct xe_tlb_inval *tlb_inval) {
> > > > +	return xe_tlb_inval_issue_op_wait(tlb_inval,
> > > > +tlb_inval->ops->ggtt); }
> > > > +
> > > > +/**
> > > > + * xe_tlb_inval_ggtt_full() - Full engine TLB invalidation within
> > > > +a VF
> > > > + * @tlb_inval: TLB invalidation client
> > > > + *
> > > > + * Issue INVAL_FULL (intra vf) to flush engine TLBs across all
> > > > +engines
> > > > + * within the requesting VF.
> > > > + *
> > > > + * Return: 0 on success, negative error code on error  */ int
> > > > +xe_tlb_inval_ggtt_full(struct xe_tlb_inval *tlb_inval) {
> > > > +	if (!tlb_inval->ops->ggtt_full)
> > > > +		return -EOPNOTSUPP;
> > > > +
> > > > +	return xe_tlb_inval_issue_op_wait(tlb_inval,
> > > > +tlb_inval->ops->ggtt_full); }
> > > > +
> > > > /**
> > > >  * xe_tlb_inval_range() - Issue a TLB invalidation for an address
> > > > range
> > > >  * @tlb_inval: TLB invalidation client diff --git
> > > > a/drivers/gpu/drm/xe/xe_tlb_inval.h
> > > > b/drivers/gpu/drm/xe/xe_tlb_inval.h
> > > > index a76b7823a5f2..665072b4b81d 100644
> > > > --- a/drivers/gpu/drm/xe/xe_tlb_inval.h
> > > > +++ b/drivers/gpu/drm/xe/xe_tlb_inval.h
> > > > @@ -20,6 +20,7 @@ void xe_tlb_inval_reset(struct xe_tlb_inval
> > > > *tlb_inval); int xe_tlb_inval_all(struct xe_tlb_inval *tlb_inval,
> > > > 		     struct xe_tlb_inval_fence *fence); int
> > > > xe_tlb_inval_ggtt(struct xe_tlb_inval *tlb_inval);
> > > > +int xe_tlb_inval_ggtt_full(struct xe_tlb_inval *tlb_inval);
> > > > void xe_tlb_inval_vm(struct xe_tlb_inval *tlb_inval, struct xe_vm
> > > > *vm); int xe_tlb_inval_range(struct xe_tlb_inval *tlb_inval,
> > > > 		       struct xe_tlb_inval_fence *fence, diff --git
> > > > a/drivers/gpu/drm/xe/xe_tlb_inval_types.h
> > > > b/drivers/gpu/drm/xe/xe_tlb_inval_types.h
> > > > index 3d1797d186fd..d77be1aedc91 100644
> > > > --- a/drivers/gpu/drm/xe/xe_tlb_inval_types.h
> > > > +++ b/drivers/gpu/drm/xe/xe_tlb_inval_types.h
> > > > @@ -36,6 +36,16 @@ struct xe_tlb_inval_ops {
> > > > 	 */
> > > > 	int (*ggtt)(struct xe_tlb_inval *tlb_inval, u32 seqno);
> > > >
> > > > +	/**
> > > > +	 * @ggtt_full: Full engine TLB invalidation within a VF
> > > > +	 * @tlb_inval: TLB invalidation client
> > > > +	 * @seqno: Seqno of TLB invalidation
> > > > +	 *
> > > > +	 * Return 0 on success, -ECANCELED if backend is mid-reset, error=
 on
> > > > +	 * failure
> > > > +	 */
> > > > +	int (*ggtt_full)(struct xe_tlb_inval *tlb_inval, u32 seqno);
> > > > +
> > > > 	/**
> > > > 	 * @ppgtt: Invalidate per-process translation TLBs
> > > > 	 * @tlb_inval: TLB invalidation client
> > > > --
> > > > 2.46.0
> > > >
