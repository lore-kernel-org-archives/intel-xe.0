Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D269CD3441
	for <intel-xe@archiver.kernel.org>; Tue, 19 Sep 2023 06:42:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D95D910E253;
	Tue, 19 Sep 2023 06:42:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3697D10E1DE
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Sep 2023 06:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695105752; x=1726641752;
 h=from:to:subject:date:message-id:references:in-reply-to:
 mime-version; bh=KXvjpTNJUuo9rTgdbz7h5SpdfpRIFjQbyVM0VrTkJKA=;
 b=a30/4QbmpPLQ27gPMMtMrEri4LfpMOf/qaDWUGI0prBe1tI7QPTBBIgQ
 9qy3PiZ/FuavLVslJOg2uoSgocChk64GXaFnWMkfzYu/Jhx99WuNbs2Yh
 nTKIILRVth7o8/S3tAm5tVVAdUaNJAQw+IRNtJMqoWptoXoFtc3QPChWP
 tHqlq12BNdkdORSKdMYVQFH43HzLb/rTyfWNM+AW0oiYsRV/TmJfgo4aL
 0L2Qvjeuci9uOrb7hKtiiODuyskjQkZ2v9c+kEB6P9wjwvF6bl5VsNAe3
 TS/j5Zx05FBAeTGZXZonqDxqrTLEwaqUgVQ4HH6C7+U2Gqc36p//USQ4L A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="383688905"
X-IronPort-AV: E=Sophos;i="6.02,158,1688454000"; 
 d="scan'208,217";a="383688905"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2023 23:42:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="889388264"
X-IronPort-AV: E=Sophos;i="6.02,158,1688454000"; 
 d="scan'208,217";a="889388264"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Sep 2023 23:41:45 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 18 Sep 2023 23:42:29 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 18 Sep 2023 23:42:29 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 18 Sep 2023 23:42:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bM8eMdydcB7aV1RG9KSMLS+QDbK/Sw22TAjqZFZ2WaPnzxi65g9JwbM4wbY3p3ShopMhg4c/OH56MGsQRdma60v1939umVLbU5eW7O7EdHHR09jLqM13fNUkRIN1qkmFqu6Fi7GxnLJ6R6O4R7EcFnnyR1TLkwn9KxywVZsa3iPgi0IYZCUj5YUyzw7W40VjzbZzDXcL9daYfQ5Y3VL/bd9g6JQtSufA4yp7C9crRikgy3Vx3J39HnCrBscVzS+oA6PfFzeHhu3HmpjkcUB232qfk1G3XA4Poy5DAdMic6myNEno2iAPIO2gRFK9ckK7Z+OD7/NV16207UnVhnQR4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pbUikNdO+e5rnMfM7/5UhU3BXmznEmZde19rbYUYmss=;
 b=dJ8bW/n75uaCXcU/uuS0FvuJKfiyLx1NZ/HnxsFtWHnzEbCdtj/+Zm7LKbwVFPzPX+iFtFvLuZNx/9SY+1ivApjpkJih/JhOKxgKTnJxA3JVIdX0oYy7qvDHNLjXV/C/Y/V9RO755cBQnXNKXp67a7SkbLZZ5/fqZJxZ7lByGKqOEV3WSdOZoWQC46G2SaQW89HZd9LyHaMIKAXzEe3IB73tOsQuVr0Dk0D7iW5dQ71fzn72oMFNXk2HBfKgME3FCx2q3orrxCxLnB30epjjYH8iDqQhZ2t8YUXtKbfm1MaWLVIDD7GC+6XHdT4WQ70DzFcLJ/GG8WOygiVCgOiY0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY8PR11MB7777.namprd11.prod.outlook.com (2603:10b6:930:71::14)
 by PH0PR11MB5046.namprd11.prod.outlook.com (2603:10b6:510:3b::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.27; Tue, 19 Sep
 2023 06:42:22 +0000
Received: from CY8PR11MB7777.namprd11.prod.outlook.com
 ([fe80::cf28:4320:6c5e:aec]) by CY8PR11MB7777.namprd11.prod.outlook.com
 ([fe80::cf28:4320:6c5e:aec%5]) with mapi id 15.20.6792.026; Tue, 19 Sep 2023
 06:42:22 +0000
From: "Govindapillai, Vinod" <vinod.govindapillai@intel.com>
To: "Hogander, Jouni" <jouni.hogander@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Thread-Topic: [Intel-xe] [PATCH 1/6] Revert "FIXME: drm/i915: include
 intel_frontbuffer.h from skl_universal_plane.c"
Thread-Index: AQHZ58N8wHuMzMA6dEe/x5NketoN2bAhFP0AgACSwgCAAAlUMg==
Date: Tue, 19 Sep 2023 06:42:22 +0000
Message-ID: <CY8PR11MB777736B25114581AA50586A8F6FAA@CY8PR11MB7777.namprd11.prod.outlook.com>
References: <20230915105724.1025509-1-jouni.hogander@intel.com>
 <20230915105724.1025509-2-jouni.hogander@intel.com>
 <826cdfdb62b6033f60aeaa9d6384b3d92a4e81fc.camel@intel.com>
 <fbdb146cfcea0dd1bb147a669836081cccda7e5c.camel@intel.com>
In-Reply-To: <fbdb146cfcea0dd1bb147a669836081cccda7e5c.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR11MB7777:EE_|PH0PR11MB5046:EE_
x-ms-office365-filtering-correlation-id: 03a735de-461e-4f78-f583-08dbb8db93e3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qoTanMh6tybH7sEntUbz9kawar6cajQSEWCuXASxHtrA9O4aTmmj0AbQMel9PxHjKaqZPVVaHXlahsrSJSXPLtyGSrmkZ+Oy/9jVfB49/iDwjx0g26S4iioF7/DB5tsfTZ/3wrC/BEWwaIUiwcupHpTl16v4fe0Vt/SWm5zIAdrrNLEYDtQdUcgpL/x179oa1tJfdVosyyPHgOPu6zfuQ3NAtTRbJDcuIgw9YpH26IAgVo1cAWQFNJuswciEYydWSgaz3im0QcyD4EZIBC9wY32Cg2RdgaWcbJgTTEeqUwbliHZ4BeyaWekRDYfjMZX7pYRRG5jExMiOWIgWYhxU0HNqcer0yanxYiEkJp+bL7KpyNeu02d2ZfH34E5hlsLzdoMXEMBlFSh9J8JItZ5nDuaVFb8z20XDAHbqTmF0GwzwPeLp7pVtIbXDsqAUaUFhUrk0YThpMslgfEmCfPLUTXq4b0yYqUw0bgOpGonV45c+y3oFD3T9Ps5d4pnARutxXyti+pPsMbrGO5UXonrsY6AhHncm90O96PN3tB3Zk2NhfnahRimMMiV5195iJVWwu+qLlxf/Q+E6DZf7/i55uoDvefKpXvRw/TiiGSbjkUWpucYgL3jDHzpuS+yPRJEc
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7777.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(396003)(136003)(376002)(346002)(366004)(186009)(1800799009)(451199024)(66574015)(41300700001)(52536014)(5660300002)(55016003)(8936002)(8676002)(66446008)(76116006)(82960400001)(122000001)(66556008)(316002)(66476007)(66946007)(64756008)(110136005)(83380400001)(2906002)(478600001)(26005)(38070700005)(7696005)(38100700002)(33656002)(71200400001)(53546011)(6506007)(9686003)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?ZFuQLkWazjh6IZjrKDwrB4ThWdMjGKTt78u5hDyHV1Nr30bnlp46R9LqFQ?=
 =?iso-8859-1?Q?jWYtDP6mct0DbaeBYlM2sOmB/IMGV0ryZn/mDlcmj0HYb4PO6tWhlEdd9V?=
 =?iso-8859-1?Q?xqw9OPEtCCnSZZNCCgpBa4cHjE3wNRGGr93ArGat3zBekZ87AcF3e1pesK?=
 =?iso-8859-1?Q?3+kDuUaQqbHqezotHDwAEhj6G5xDgrjJeNANEfmh2dpZbJMSFsOCKjlEtX?=
 =?iso-8859-1?Q?x26KDZUrlSvcsKEcKEQeivW/8imIHPMUwOIGSozc75+btl6P7hsbvmp03V?=
 =?iso-8859-1?Q?doaefL1zOPcvsJUv0cL/tT83MrW6QwST7+OfsmJfVVRvK+79FI9SrluX5E?=
 =?iso-8859-1?Q?jq0bR7sA/uXqhK2Bq2PpK7N5xZI9RgcX0/6heha4dXi0jg0Bn7H4d9vJ74?=
 =?iso-8859-1?Q?ad9fwyeu1wTbTJoJPUarzonlQ4bHEt1js/gAjFBq0ka919iYIVXyXA+WsI?=
 =?iso-8859-1?Q?pjSqW9smCHFOlpT081QnGQhAJ85W9GRNv3d6GUo1auztSr0MfQiQKg06Ew?=
 =?iso-8859-1?Q?kzeI+dCmY36D/IjNB8Nt5rcD53zVfT3A7TH+2LlZppkrSXoVmdlKQoXaUd?=
 =?iso-8859-1?Q?qwfnIZ3tY6YwatyTLcwHSe/DMYdjz6+JkQQEuFIcmrPdDu2HJSjklj3w6c?=
 =?iso-8859-1?Q?x66+CVcZDdiJpV4w+umcIU5+ctysgIjJG3pGOqZrhF0H8xJBiE/eis11FR?=
 =?iso-8859-1?Q?5ElZwL+eY1bbopXYreQgRBi/5c4jvbEGhmmY04SaeO7vZ/BGuT7q9zzzYi?=
 =?iso-8859-1?Q?K5m8UNlhiM+Zg7KuL855sT0j0nvhcUmF0LZ5HaQ8n7qJz57g0emXpjzaEF?=
 =?iso-8859-1?Q?PlDNDMynqVal6mYQcDgjvFxP2pZhbOwQ8bmvojQuGQDpl1ovhvz6dLkmrq?=
 =?iso-8859-1?Q?BFEM40x0Fya0EYXvoDx2XKTsAIWR9Boz4phOS10JcBFJ01MB6sYJ4lC/nb?=
 =?iso-8859-1?Q?J9F/FDvGax66ft1Bn5hOXvwm5COw0deWA2FAGo3HUlp7LtD9t4hJ8gsM2+?=
 =?iso-8859-1?Q?HrQ/FHPTt7wO87+3IZkvVM6Kha6ydoBXHn4/KxjAbICGe5PYptkiGN9YJJ?=
 =?iso-8859-1?Q?D1JFPkW/wRVhk86p8452SQPsh4qGDMkmAxWLdc24rYeP38kfb4hm1aHmza?=
 =?iso-8859-1?Q?y4dVOOhA0GP/zQQgsdh3NeTrKND/e9RQQocY/Xb4Jf9nGL2K0QanizRXpn?=
 =?iso-8859-1?Q?7sVXBDvw+UOmXjZf8bNsIXghujOHsk025BfGy7fqTDdZ1ombhHsomGzIdK?=
 =?iso-8859-1?Q?2bnMiLp2o5tmZpsMNBcCTaIUQ3Xg7QfGxpsUD60f1chpTtj8ikOrvoq1Vm?=
 =?iso-8859-1?Q?dTSeBhNPojs6KXW2OZO9+C42wVe9QdU59TjK8guftLbGzd/IRpg4pdUpUv?=
 =?iso-8859-1?Q?kh+8n4FxzWGPlPTpKdvfMWTIU4MSwsQPcRO9jQ96NR4WHbc81bXmpgy5Sj?=
 =?iso-8859-1?Q?S47Y1+OMe2dfaxsbWXkcAkp9VF4ugKjutOSbafLSMQzekauyrQ9hNqDhAn?=
 =?iso-8859-1?Q?RS2GODApNVYzmbReAgFFS5EY9LOR6lRNFyXX59+U5tk+yb7/Wb0ecLTFEl?=
 =?iso-8859-1?Q?Cn4J6sDIdUZCrkgyFMmEqrs5+hvtEJuFf6Kdsk9XYPJKG1Zz7xfCpUr+A1?=
 =?iso-8859-1?Q?vUhwnPERCRmmrw92U08dPEdvLXxl2+tNvC0pMzc0f1eV0YX5DuK5jUebyF?=
 =?iso-8859-1?Q?fRMN9dnsyq+NU3VgXH8=3D?=
Content-Type: multipart/alternative;
 boundary="_000_CY8PR11MB777736B25114581AA50586A8F6FAACY8PR11MB7777namp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7777.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03a735de-461e-4f78-f583-08dbb8db93e3
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Sep 2023 06:42:22.1197 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eoYUCqCpSthm1geLFyxBqTrGflu8XGzXcuZj5LFytX+cLTbqze7udryIJPZOT2VLlnhPkmkOh+QTPVATVpJ4Yj1dWV46WLYzXXO+dPxcKjE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5046
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/6] Revert "FIXME: drm/i915: include
 intel_frontbuffer.h from skl_universal_plane.c"
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

--_000_CY8PR11MB777736B25114581AA50586A8F6FAACY8PR11MB7777namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Jouni

Okay. Seems reasonable. Reviewed-by is already there for the patches.

Br
Vinod

________________________________
From: Hogander, Jouni <jouni.hogander@intel.com>
Sent: Tuesday, September 19, 2023 8:39:24 am
To: intel-xe@lists.freedesktop.org <intel-xe@lists.freedesktop.org>; Govind=
apillai, Vinod <vinod.govindapillai@intel.com>
Subject: Re: [Intel-xe] [PATCH 1/6] Revert "FIXME: drm/i915: include intel_=
frontbuffer.h from skl_universal_plane.c"

On Mon, 2023-09-18 at 20:54 +0000, Govindapillai, Vinod wrote:
> On Fri, 2023-09-15 at 13:57 +0300, Jouni H=F6gander wrote:
> > This reverts commit c3e942a06433e8c538108f24b4fe78a0927e2aea.
> >
> > We are about to backport upstream changes that is taking care of
> > including
> > intel_frontbuffer.h as necessary.
> >
> > Signed-off-by: Jouni H=F6gander <jouni.hogander@intel.com>
> > ---
>
> Hi Jouni,
>
> Should these reverts be moved after the patch 4 in this series? Won't
> that cause build failure? Or
> the patch description is not accurate?

I choose this approach as backporting patch 4 would have lots of
conflicts if backporting it first. On next rebase all these patches
will disappear anyways.

BR,

Jouni H=F6gander

>
> With that checked,
>
> Reviewed-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
>
> >  drivers/gpu/drm/i915/display/skl_universal_plane.c | 1 -
> >  1 file changed, 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c
> > b/drivers/gpu/drm/i915/display/skl_universal_plane.c
> > index 4d01c7ae4485..2ded1bcce754 100644
> > --- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
> > +++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
> > @@ -16,7 +16,6 @@
> >  #include "intel_display_types.h"
> >  #include "intel_fb.h"
> >  #include "intel_fbc.h"
> > -#include "intel_frontbuffer.h"
> >  #include "intel_psr.h"
> >  #include "skl_scaler.h"
> >  #include "skl_universal_plane.h"
>



--_000_CY8PR11MB777736B25114581AA50586A8F6FAACY8PR11MB7777namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
</head>
<body>
<div dir=3D"auto">Hi Jouni</div>
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto">Okay. Seems reasonable. Reviewed-by is already there for =
the patches.</div>
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto">Br</div>
<div dir=3D"auto">Vinod</div>
<div id=3D"mail-editor-reference-message-container" dir=3D"auto"><br>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" style=3D"font-size: 11pt;"><strong>From:</strong>=
 Hogander, Jouni &lt;jouni.hogander@intel.com&gt;<br>
<strong>Sent:</strong> Tuesday, September 19, 2023 8:39:24 am<br>
<strong>To:</strong> intel-xe@lists.freedesktop.org &lt;intel-xe@lists.free=
desktop.org&gt;; Govindapillai, Vinod &lt;vinod.govindapillai@intel.com&gt;=
<br>
<strong>Subject:</strong> Re: [Intel-xe] [PATCH 1/6] Revert &quot;FIXME: dr=
m/i915: include intel_frontbuffer.h from skl_universal_plane.c&quot;<br>
</div>
<br>
<meta name=3D"Generator" content=3D"Microsoft Exchange Server">
<!-- converted from text --><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On Mon, 2023-09-18 at 20:54 +0000, Govindapillai, =
Vinod wrote:<br>
&gt; On Fri, 2023-09-15 at 13:57 +0300, Jouni H=F6gander wrote:<br>
&gt; &gt; This reverts commit c3e942a06433e8c538108f24b4fe78a0927e2aea.<br>
&gt; &gt; <br>
&gt; &gt; We are about to backport upstream changes that is taking care of<=
br>
&gt; &gt; including<br>
&gt; &gt; intel_frontbuffer.h as necessary.<br>
&gt; &gt; <br>
&gt; &gt; Signed-off-by: Jouni H=F6gander &lt;jouni.hogander@intel.com&gt;<=
br>
&gt; &gt; ---<br>
&gt; <br>
&gt; Hi Jouni,<br>
&gt; <br>
&gt; Should these reverts be moved after the patch 4 in this series? Won't<=
br>
&gt; that cause build failure? Or<br>
&gt; the patch description is not accurate?<br>
<br>
I choose this approach as backporting patch 4 would have lots of<br>
conflicts if backporting it first. On next rebase all these patches<br>
will disappear anyways.<br>
<br>
BR,<br>
<br>
Jouni H=F6gander<br>
&nbsp;<br>
&gt; <br>
&gt; With that checked, <br>
&gt; <br>
&gt; Reviewed-by: Vinod Govindapillai &lt;vinod.govindapillai@intel.com&gt;=
<br>
&gt; <br>
&gt; &gt; &nbsp;drivers/gpu/drm/i915/display/skl_universal_plane.c | 1 -<br=
>
&gt; &gt; &nbsp;1 file changed, 1 deletion(-)<br>
&gt; &gt; <br>
&gt; &gt; diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c<b=
r>
&gt; &gt; b/drivers/gpu/drm/i915/display/skl_universal_plane.c<br>
&gt; &gt; index 4d01c7ae4485..2ded1bcce754 100644<br>
&gt; &gt; --- a/drivers/gpu/drm/i915/display/skl_universal_plane.c<br>
&gt; &gt; +++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c<br>
&gt; &gt; @@ -16,7 +16,6 @@<br>
&gt; &gt; &nbsp;#include &quot;intel_display_types.h&quot;<br>
&gt; &gt; &nbsp;#include &quot;intel_fb.h&quot;<br>
&gt; &gt; &nbsp;#include &quot;intel_fbc.h&quot;<br>
&gt; &gt; -#include &quot;intel_frontbuffer.h&quot;<br>
&gt; &gt; &nbsp;#include &quot;intel_psr.h&quot;<br>
&gt; &gt; &nbsp;#include &quot;skl_scaler.h&quot;<br>
&gt; &gt; &nbsp;#include &quot;skl_universal_plane.h&quot;<br>
&gt; <br>
<br>
</div>
</span></font><br>
</div>
</body>
</html>

--_000_CY8PR11MB777736B25114581AA50586A8F6FAACY8PR11MB7777namp_--
