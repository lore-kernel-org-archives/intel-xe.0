Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 561BFC9833E
	for <intel-xe@archiver.kernel.org>; Mon, 28 Sep 2026 08:56:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1423710E828;
	Mon, 28 Sep 2026 08:56:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gW5l2AkN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 471C710E828;
 Mon, 28 Sep 2026 08:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790585760; x=1822121760;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=V745FfHKyNFKwSXdh+zkOX/MGK/EEULuaC1YR9TZh0Q=;
 b=gW5l2AkNfxiL5Nb48gUj/G8hzhkbNTKRUKioOU7ooE7WiapDZP6pNX3K
 aire2F+s4YmiA7IMvQH9U5ExA3pDEIi4JM9WjEGFxAfi6KVh4BXqJ9UPQ
 zrPxq34ru24GbLR+uxq68PsP+EjJOdpuOrzq3JHEnoJ8/hTKF7IwiMCBX
 uBUOjjnEQZgA2rD+DrE16zSMfmKrjdmd2RvuhyTjw06oGO0FmQwDDeSkF
 KEd0YfIyWDkv+GP4RbQgecqCvD6DzlWIXRnOHMNzXZsTg2M4oz3rthwOr
 JYLQFSayIOwGTP3PPFLLED6hNG70p72hllMHRLrm0veWLSDuVGUW7UOy+ A==;
X-CSE-ConnectionGUID: xA0DRWj3RvSN1KlnAHhWBA==
X-CSE-MsgGUID: WgjP9B4JROSSHxWfZYQErg==
X-IronPort-AV: E=McAfee;i="6800,10657,11918"; a="90182945"
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; d="scan'208";a="90182945"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2026 01:56:00 -0700
X-CSE-ConnectionGUID: NpZ0qe7oTp6eOclGWTU/pg==
X-CSE-MsgGUID: QreHrD0NSOCV1AvcFKQnCA==
X-ExtLoop1: 1
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2026 01:56:00 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 28 Sep 2026 01:55:59 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 28 Sep 2026 01:55:59 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.20) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 28 Sep 2026 01:55:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tL3CiobDc8C7ODVSS3o5XlRIjnGuRtGPIZboS/PmuV5GuEtFoimPG+oGgQ0p480A88kKJ4WyQNJG+QWT5+Z05S52ajoI7bzVb/CKcgyZuHdheW1WKJamO3MO52FzEN86GeOPtwGIM1axyAoAPbq0dQplLWMvHDGzJ3lhTWHHXmnVAsib+GM0KTE2MUmOIfeiAK5KnhMyE+zT2DUDUorw1mtqh+VjiHB2wafUUgz98gNO1dXaac0uqnZmFya9GXmvYJ35BSz1v/GhCGN3c7Pg6FfnvbEYtjw0xqiGoG/TA2vx1HflgOVjgsCvLe/Ygh6pSOywxcwlVFNd7QCoeUY2+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BX8eubeVZCrFh6qPZ1KnEc3veXCpoDMwtcw5I8a3b14=;
 b=NXU1/W9t8YWZZJLTeHbqow0O5mQ351b/BxNxu8NehP7yjm05yyXaNJi1W60AaitRGbnc2+4G7lkyscODi7SukJM2gwoZHzmqw2BO18uSlrtWsSC5MebCQoEfDJyOt3STs2/lXs+MRdE8egC3wer8Jz6+eG+U5ObaQ05u9w87E7NbOJUBK/iym05dLmvUm4ndpr66dfua86+1PPgU6+eIMoUV147yLrazE7Hdk5jb5gIfv5tc4lilxuUkjQevjUhX3egiixaUjsdFYzX9y6dG2mvqsEnxtICWVV2Rb01rR+p0ZmEaqUMJ1FX6jKGbrJIRofpNpe+7WfPXY7VpD/DwNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::5b) by DS4PR11MB383999.namprd11.prod.outlook.com
 (2603:10b6:8:509::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Mon, 28 Sep
 2026 08:55:56 +0000
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::5be7:2ceb:99ef:6334]) by DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::5be7:2ceb:99ef:6334%8]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 08:55:56 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Deak,
 Imre" <imre.deak@intel.com>
CC: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>,
 "arun.r.murthy@intel.comm" <arun.r.murthy@intel.comm>
Subject: RE: [PATCH] drm/i915/pps: Don't block DC states while the VDD
 override is held
Thread-Topic: [PATCH] drm/i915/pps: Don't block DC states while the VDD
 override is held
Thread-Index: AQHdTxBX5NbRXFSSbkKXLjZW4RbJ/Lbjq4kAgAAARwCAAAKdgIAAAW2w
Date: Mon, 28 Sep 2026 08:55:55 +0000
Message-ID: <DS4PPFE901A304F5D1E1AD81739F43903A9E38D2@DS4PPFE901A304F.namprd11.prod.outlook.com>
References: <20260928061211.2764543-1-suraj.kandpal@intel.com>
 <03e6056ddce4ff7c7e6f0dafdfe42a75e0beb203@intel.com>
 <DS4PPFE901A304F2F30F230DF7378468608E38D2@DS4PPFE901A304F.namprd11.prod.outlook.com>
 <d2d37b6abd46bab14cf6716ff1f8c06c8d06f174@intel.com>
In-Reply-To: <d2d37b6abd46bab14cf6716ff1f8c06c8d06f174@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPFE901A304F:EE_|DS4PR11MB383999:EE_
x-ms-office365-filtering-correlation-id: 96879ff0-610f-4edc-e615-08df1d3e4efa
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|366016|376014|18002099003|22082099003|38070700021|3023799007|4143699003|10067099003|56012099006|5023799004|11063799006;
x-microsoft-antispam-message-info: nNcbLkaAlM5urJAL/g3+QIgLyQinItFDbY4DEj3dan7NqwHnt3jskB699UTdhaTn0ez6vWJom91O8WZLc8PdKcu3gI5LN9mN0AmcLYB+YotihG9QCOikzOcJQfKmT2D16Rolrat1Fo8JsMvVB7mTLUtLR3pSUZ/f2iLxCaW+MfpPsz6PufHC/xoSwdnZu0AmHhM0BE3yvtiOQt9bRg4qFLjqV7qaxCiiLtx2I0TarB6C2YT2LzD3buut9A5B4Mlcj3cuzzXrBnH3tOiORqOdXAseq8qSGnaIswCBajMOwsYF3hpruheEuiG5oywRDFg++Hm+AHaLJSahcPI4CxXOJcKh4jupDd/r/YXvXPpUFJAXNOujtMPUBFEpoBGPlggq+45pyoHyQthdRbqp7tIhmrk4xvSWYShg/NjWNETVbbipx/XhnzJRUPMVMnhkmcADV1O8tr4DVwzTV20czyH0yPVXpLZ0oJdA2aOC+llLIpcLhn8GEHOPRhzb564mWMjO/M5uabTUGARPD4AfGSmJmaw/7PUQRYDINFMDA5vZxs4LDbpN2xGHiJIItYiBXlIyyVtrlZKbT0sVFqA7ajJCzLtpefYKqcXLczDruHjKjBIQJUzd5v6zVyOAnRg6diJPDucgXEC0WF2elONWtoOc6P57DD2V8bZ2GRpmgJcx1bkhM4DqXVV2HPp5Byrs1CEz2eeKolpktIogRnxpTAJ4nFXA1s/2af4NfzzeNK/apig=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPFE901A304F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(18002099003)(22082099003)(38070700021)(3023799007)(4143699003)(10067099003)(56012099006)(5023799004)(11063799006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?HJ8tbNR29bkyegR/QLF1aKs0g3d07W3WFJUsUe0tGZ5W/Ua7639PPmiRBuMg?=
 =?us-ascii?Q?R9cb/I4hgyn8ZKJAld11/rQS0KbMnn2Y6rqm05ViB/0ylQire70hV3EVTGkg?=
 =?us-ascii?Q?g8rWVHEq03EY0znMNeq9TbjB8XubI5utP+sL1qQc9Iuowps1NB6kaEdgMXNM?=
 =?us-ascii?Q?NvHrPvWZLpjNqf3qcqTh91b3EGeAxhGDZ7h10gGZfuUud4PiCJBh+xPCrlaW?=
 =?us-ascii?Q?1x+OJxQXS2SPH8X6OsKfpBoYevm17lNxEFBrIaU5ZZA8aI6kKozoy7wXvOfr?=
 =?us-ascii?Q?g2vUAKwNwyRnnDRx+2Pq3LFpFt+a3BN9KLq+Q+vrnG4EBmjltWzvq2SiCOd0?=
 =?us-ascii?Q?CWXhrL8Xv2mHR+XEr8RsELrux7qXh342u09haoJyl1D99NGEAKNdVEVgtHB6?=
 =?us-ascii?Q?GEp5AmtbjWBzRqujC2o0eooZPIqTLw82rK0Xd92/CFSWqGzxSQFr3rG5SZZB?=
 =?us-ascii?Q?QxK0fnqhhlw99TunChkPPhWB8aGdk+fwio/vqerGoVDTZBHHtHznKUANYV1+?=
 =?us-ascii?Q?s5t1d/9FptntcIN0OYd00hS9YL5Eld9KE2MVJOEEPjtl9Q6caRNOY6QDXTee?=
 =?us-ascii?Q?c81Au2gZcRqviZifmlr/V6ak7Em0OHRt9DJkqKpLzaiQcC6lzONB+4YbYjyk?=
 =?us-ascii?Q?vPb2IofZHRZaZofSFdW51f6gpKR1nrdlwsVHl3Lz9DG/RgFwLV2YJsFeGfim?=
 =?us-ascii?Q?axok/i4wn6963QmAA6I0lZztqj4aWQJin3DvmfiPojhWaKwlKGBV9G6qP46V?=
 =?us-ascii?Q?WmJOW5Fb5kpNJCo29pNxW+pXG0jp//gJTwPvDgi6n6nqJNoXoK7FonjT2lF2?=
 =?us-ascii?Q?4e6QNxHaeh/7lQHbpBl1r44cNfeWY9MEtqZE7px8YfLVvOd6khw3JROcQPFT?=
 =?us-ascii?Q?7p77Mqz/DvX/N+PXoFJQNWxcX9vJ6M6vtl5pROPpB5X20+v4BzI8psnxJyqh?=
 =?us-ascii?Q?hSU7Z8Bo7R2GDnibliyKi+VUfCC+QXUzr6OAz5yXrTyoxZMfxZvy7BBMAUS/?=
 =?us-ascii?Q?oVsofR9HOY8QxoUcnultX+KDjmU+VOBGpoQfIGpKgx+cvLvMQ/hUC0Ss24dY?=
 =?us-ascii?Q?fa/zPQPJN2rcpK4yRUA4tJuoW7Xsr8WR3+5GtsAkjG4nLO6YwLy+yKlKWqdh?=
 =?us-ascii?Q?cXVRw2Ydr0NKII5j0Qq/0t6oY32wZOrF8eQxmzQqs0ediOBR9H9dk+FVxbYu?=
 =?us-ascii?Q?VVq2de7RkBgCzhc71pexDPCKbvbiOp2f4C0Z7nMCyvkiZc/AH/cML3du4Khg?=
 =?us-ascii?Q?GYrhoCe1RA20riLOf5eIrBiyhSE85lh/e2h8f3v+PIamy0NrQYMnQAPFRsRb?=
 =?us-ascii?Q?fzj+uCpYWD3ZgJTXBDa63F277PVbot+lKPNuN04tXYzNeeexwfMu+ChkAcuV?=
 =?us-ascii?Q?1wgzYkMUqcS0al7DVD3D7yECp+giZR/iDeaA4arZ9Mv3A1RQlz9WvUXrY8b8?=
 =?us-ascii?Q?uKRrzGr3t5KK1EbVI6GB7A39r+1XR0bgEnjR+AnZkbOErqol3Mb9POB/NyjM?=
 =?us-ascii?Q?YN6NNdG9FWUGV2aLJn//rvqUdu3Amszvb7RRz99vc/mguPRQbqTnFcmYmov0?=
 =?us-ascii?Q?wlB3EEr7R573mDtWICfYsqlUq/ISUDmb3jasT/5RX6Fy6glYShnH88l4gBvs?=
 =?us-ascii?Q?eVHVFTK6PURkqCS2kYVk+HaCq08Di+vNAl779SZvgLMo0lxWXU8D/ZDevGJs?=
 =?us-ascii?Q?tQSZPufGUOwgaU/eeRiCZutfTVsZxLmBnsKECal1ISBVlSSq5bL/kImdvgID?=
 =?us-ascii?Q?BFvog+SfmA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 2zmlIaKnpWMYHkqKuoqy66mfDat0/6doMwDGPr0zYy6ZKMcVcoolpSwiAQppnESds6qlHcKa0zi/gSkUhGynOxif9sEFV1H6P1I19WP1TBtlIzXcAhg/FgGoT96amOsa4ALPSQTiWyQy2w7oyjuEhL/XNTgh02vHXyFF4i+xWPbYU10EFspa22HX5bUNNi1y+cvUpaPs7735oJt2tlukd/fwUQAX0oCQiw5hW5FjjcGfFCZum7PW0Md0YwdfNwKRW5cKnaz33xf0bkndrnsujmmprgK7xw+nj9kGes816vnqV7O9icmugHTSbguvYNIRp6moWgi08YV5PW/7rio+aQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFE901A304F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96879ff0-610f-4edc-e615-08df1d3e4efa
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Sep 2026 08:55:56.0054 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lX9e67oRjLMMO5D6RHzliyR/bf1God3bckklEb2duS+sbnhr3ceQYmJRkYdvnrVXYcm2x/Axu9fsMs6WNbh00g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR11MB383999
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

> Subject: RE: [PATCH] drm/i915/pps: Don't block DC states while the VDD
> override is held
>=20
> On Mon, 28 Sep 2026, "Kandpal, Suraj" <suraj.kandpal@intel.com> wrote:
> >> arun.r.murthy@intel.comm; Kandpal, Suraj <suraj.kandpal@intel.com>
> >> Subject: Re: [PATCH] drm/i915/pps: Don't block DC states while the
> >> VDD override is held
> >>
> >> On Mon, 28 Sep 2026, Suraj Kandpal <suraj.kandpal@intel.com> wrote:
> >> > intel_pps_vdd_on_unlocked() takes the AUX power domain and holds it
> >> > until
> >> > edp_panel_vdd_schedule_off() drops it, panel_power_cycle_delay * 5
> >> > ms after the last AUX transfer. That is seconds on a typical panel.
> >> > The AUX domains now block DC states on Xe3p_LPD, so that reference
> >> > keeps DC_off up for all of it. DC3co arms with a 1 ms put delay and
> >> > never gets a window, and its residency counter does not increment.
> >> > Nothing in the panel power sequence needs DC states off for as long
> >> > as the override is held. Take AUX IO instead, which powers up the
> >> > same well without blocking DC states, the same split
> >> > intel_ddi_main_link_aux_domain() makes for PSR. AUX transfers still
> >> > take the DC state blocking domain around each transfer.
> >> >
> >> > Bspec: 49277
> >> > Fixes: 2827c44f148c ("drm/i915/xe3plpd: Map AUX power domains to
> >> > DC_off")
> >> > Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> >> > ---
> >> >  drivers/gpu/drm/i915/display/intel_pps.c | 21
> >> > +++++++++++++++++----
> >> >  1 file changed, 17 insertions(+), 4 deletions(-)
> >> >
> >> > diff --git a/drivers/gpu/drm/i915/display/intel_pps.c
> >> > b/drivers/gpu/drm/i915/display/intel_pps.c
> >> > index d4c98b150fa2..bdbaa10bce23 100644
> >> > --- a/drivers/gpu/drm/i915/display/intel_pps.c
> >> > +++ b/drivers/gpu/drm/i915/display/intel_pps.c
> >> > @@ -11,6 +11,7 @@
> >> >  #include "g4x_dp.h"
> >> >  #include "intel_de.h"
> >> >  #include "intel_display_jiffies.h"
> >> > +#include "intel_display_power.h"
> >> >  #include "intel_display_power_well.h"
> >> >  #include "intel_display_regs.h"
> >> >  #include "intel_display_types.h"
> >> > @@ -734,6 +735,18 @@ static  u32 ilk_get_pp_control(struct intel_dp
> >> *intel_dp)
> >> >  	return control;
> >> >  }
> >> >
> >> > +static enum intel_display_power_domain
> >> > +intel_pps_vdd_power_domain(struct intel_dp *intel_dp) {
> >> > +	struct intel_display *display =3D to_intel_display(intel_dp);
> >> > +	struct intel_digital_port *dig_port =3D dp_to_dig_port(intel_dp);
> >> > +
> >> > +	if (DISPLAY_VER(display) >=3D 35 && !intel_encoder_is_tc(&dig_port=
-
> >> >base))
> >> > +		return intel_display_power_aux_io_domain(display,
> >> > +dig_port->aux_ch);
> >>
> >> Seems like this is something that the power domain framework should
> >> take care of instead of hacking together locally.
> >
> > Actually it does not at least not for Xe3p which now has DC_OFF when
> > taking AUX domain, Because of that when PPS take AUX power domain it
> > also takes DC_OFF(exiting DC states) which is not required And since
> > it keeps the reference for longer than what a normal aux transaction wo=
uld
> DC3CO does not increment its Counter.
>=20
> I mean the power domain should be modified to take care of this, not that=
 it
> should already take care of this.

Hmm.. I am not very well versed in power wells and domains but let me see w=
hat can be done
Without hurting other parts of code.

Regards,
Suraj Kandpal

>=20
> BR,
> Jani.
>=20
>=20
> >
> >>
> >> Cc: Imre, which you should pretty much always do when doing anything
> >> related to power domains.
> >>
> >
> > Sure will keep in mind going forward.
> >
> > Regards,
> > Suraj Kandpal
> >
> >>
> >> BR,
> >> Jani.
> >>
> >> > +
> >> > +	return intel_aux_power_domain(dig_port); }
> >> > +
> >> >  /*
> >> >   * Must be paired with intel_pps_vdd_off_unlocked().
> >> >   * Must hold pps_mutex around the whole on/off sequence.
> >> > @@ -760,7 +773,7 @@ bool intel_pps_vdd_on_unlocked(struct intel_dp
> >> > *intel_dp)
> >> >
> >> >  	drm_WARN_ON(display->drm, intel_dp->pps.vdd_wakeref);
> >> >  	intel_dp->pps.vdd_wakeref =3D intel_display_power_get(display,
> >> > -
> >> intel_aux_power_domain(dig_port));
> >> > +
> >> intel_pps_vdd_power_domain(intel_dp));
> >> >
> >> >  	pp_stat_reg =3D _pp_stat_reg(intel_dp);
> >> >  	pp_ctrl_reg =3D _pp_ctrl_reg(intel_dp); @@ -862,7 +875,7 @@ static
> >> > void intel_pps_vdd_off_sync_unlocked(struct intel_dp *intel_dp)
> >> >  	}
> >> >
> >> >  	intel_display_power_put(display,
> >> > -				intel_aux_power_domain(dig_port),
> >> > +				intel_pps_vdd_power_domain(intel_dp),
> >> >  				fetch_and_zero(&intel_dp-
> >> >pps.vdd_wakeref));
> >> >  }
> >> >
> >> > @@ -1064,7 +1077,7 @@ void intel_pps_off_unlocked(struct intel_dp
> >> > *intel_dp)
> >> >
> >> >  	/* We got a reference when we enabled the VDD. */
> >> >  	intel_display_power_put(display,
> >> > -				intel_aux_power_domain(dig_port),
> >> > +				intel_pps_vdd_power_domain(intel_dp),
> >> >  				fetch_and_zero(&intel_dp-
> >> >pps.vdd_wakeref));
> >> >  }
> >> >
> >> > @@ -1336,7 +1349,7 @@ static void pps_vdd_init(struct intel_dp
> >> *intel_dp)
> >> >  		    pps_name(intel_dp));
> >> >  	drm_WARN_ON(display->drm, intel_dp->pps.vdd_wakeref);
> >> >  	intel_dp->pps.vdd_wakeref =3D intel_display_power_get(display,
> >> > -
> >> intel_aux_power_domain(dig_port));
> >> > +
> >> intel_pps_vdd_power_domain(intel_dp));
> >> >  }
> >> >
> >> >  bool intel_pps_have_panel_power_or_vdd(struct intel_dp *intel_dp)
> >>
> >> --
> >> Jani Nikula, Intel
>=20
> --
> Jani Nikula, Intel
