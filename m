Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C03FBEB64D8
	for <intel-xe@archiver.kernel.org>; Thu, 22 Jun 2023 18:50:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9141910E5A2;
	Thu, 22 Jun 2023 18:50:20 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 196E610E5A2
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Jun 2023 18:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687459819; x=1718995819;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=t4S9mz2eHI3BdJl+B/xh9OLXCRlkHSxeHWWR1y78xj8=;
 b=jYkVLUL3jN0fN0/71nc4czimcLIvq4XoKGfYsSc5+L00JFOfF8b9SHyE
 9he38Gd9tKC2xXIS0HSG3J2/IKsEkKx3dloNf+ljrTjsq42STlydo6IfY
 9Y8HPgtDHICSYxVYOeWAybWswGk0ZiAcPVTnLR3Wd9OumHMAiE3Ey8+W/
 Av8iPwFSKLOhgyVZiOyzU9P4cuNsOLNP4hu8SI/mZhZIf5PKxOwr6DGsa
 z4sQX2/Iekm7MU/bz6FJhizAOvOzALmQJ0LkADs1rZItQd382f8TTh1wF
 YCWS4vwjlgcUqpucfDKhjxHRQeI8hKbBE5g1Dq2YT97365J8PSTJyYFra A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="345340583"
X-IronPort-AV: E=Sophos;i="6.01,149,1684825200"; d="scan'208";a="345340583"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2023 11:50:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="804936075"
X-IronPort-AV: E=Sophos;i="6.01,149,1684825200"; d="scan'208";a="804936075"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by FMSMGA003.fm.intel.com with ESMTP; 22 Jun 2023 11:50:17 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 22 Jun 2023 11:50:16 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 22 Jun 2023 11:50:16 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.176)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 22 Jun 2023 11:50:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MY4fA5dbSjw0pPgLnp6eGOukA8YPfrh7lCVVw5WZ6Qb4QgwL9q+VpNqdhgBBkLqLIdnkU0YqHTKcwtAzfKrhjN5TSejxHmAWZoC4k1b6miYenF3TYAXowaPVT6bCAz8zEASXhQJoFuraB07kFZjrOuWQ3nsvBVlDN17l1oI/Wi5rDCL2vS28wSDI7Y8Cw1j7N40zGHfydZsNZ7BWXt8kiTCeRHcDvZnyfzB8CPV2h0WbdCQ1FYTjU4Ls5SzE+JoZKiQcRPO9Cf/cFNg40X+ZuaduZN6EKgWOSecY5jpBasXEH+JXZKHWB+yg758KFB548pCmkdu5UoDzC38umumOrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AsMTQHL3ssjct1kMNz3y7v3wj7tqRqii2ifSgNrjHtc=;
 b=n9Pl8BcfZgJvDm3jhiHK43jXJ6N77Ul2S2GizS4qjhlas89w23O7zvP8fWj5VJWuQh0bMYAiXY1RIcfTltMvVkfFulTCi+Pe0rCZb3icimtE0Gw1HVhh39onT3dSz9+dq8Iz8J1NN1JL0jcMevJ2SZ3PDfsefow44l0qAsNS+S+RtWUUYMH75sWX3EOu9ejZlpRw+2md6OoNWDYVXhPrt534TfKY9k1SjMPb/UTtFh9OwXbEeEUotxzB4inGee3brquQMwgFqTPS34udhQGMLxyqGm1B6lO102we6aHztZ86Z77WqCtRPsIHOgl0uZSx0X7X64BYeEF1PDd8PCN8uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5971.namprd11.prod.outlook.com (2603:10b6:8:5e::7) by
 SN7PR11MB6972.namprd11.prod.outlook.com (2603:10b6:806:2ac::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Thu, 22 Jun
 2023 18:50:14 +0000
Received: from DM4PR11MB5971.namprd11.prod.outlook.com
 ([fe80::df8c:4a33:f53a:9a2e]) by DM4PR11MB5971.namprd11.prod.outlook.com
 ([fe80::df8c:4a33:f53a:9a2e%5]) with mapi id 15.20.6521.024; Thu, 22 Jun 2023
 18:50:14 +0000
From: "Sripada, Radhakrishna" <radhakrishna.sripada@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>, "Roper, Matthew D"
 <matthew.d.roper@intel.com>
Thread-Topic: [Intel-xe] [PATCH v2 2/2] drm/xe: Add reg read/write trace
Thread-Index: AQHZo65XKmLJRtXRWEeVQ19I0PrYNK+UNMWAgAAOquCAACMPgIAAHU+AgAFcbYCAATPvIA==
Date: Thu, 22 Jun 2023 18:50:14 +0000
Message-ID: <DM4PR11MB5971A53F407E735E54D25FBB8722A@DM4PR11MB5971.namprd11.prod.outlook.com>
References: <20230620193229.1698372-1-radhakrishna.sripada@intel.com>
 <20230620193229.1698372-3-radhakrishna.sripada@intel.com>
 <p7zjd7pktccivhdosyrteoixzrkqqiawzcjluhfujwo35qpisl@zol4cc6pxhjp>
 <DM4PR11MB5971ED74CBC0D05B16B0CD41875CA@DM4PR11MB5971.namprd11.prod.outlook.com>
 <oekkd7ikdekbxmqaumvffxxxmgimawic232muweq4c2vgjpd7q@4fkzr5dpx55o>
 <20230621021043.GC5433@mdroper-desk1.amr.corp.intel.com>
 <l5cru7upg7xhoyjfzjn4vkkstelvt3or34i255u7rcygxvfuo7@mekxbs6kw47t>
In-Reply-To: <l5cru7upg7xhoyjfzjn4vkkstelvt3or34i255u7rcygxvfuo7@mekxbs6kw47t>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5971:EE_|SN7PR11MB6972:EE_
x-ms-office365-filtering-correlation-id: 9cd87d6f-07c6-4e93-0eb4-08db735183b3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4oxxBoGWbtM6ypFixjMP5EtS9Hm6/SLJJXdpyWRNizQVrW23RDu5FKe2xVTjrCtYM4UpdU4kgIozIBkdwjwp2Qi0pQEi6pA+l7SZaVSd+CGh5kyohAdD+10dP8TF4wDlh2UlESJxsq3Rw+Iaq5W91OoX+fWZTcUk+0ZJHA66pDcq6gHnKnnW87Nd0CgT95vPt596CHqzvdnXXu39CWv8MCxjX55B0qmBpN4qo9iDg/KFoYJmEHRaWFbdhuvH7qjM+cDF5DqrA/Lnw+4dRK7XMtgmwvggFxtMvbHD65adGU0C14ylPDQW0kFxNuPZ4Cz3gP0Vxrl6k59f7JlFhiPsj7MMJ/v525kNzRb7+6XKMMKopEgjzEo5U4LqLGEoZcV8Ar8zyjh72nebsy6ybqxD/Iy4iBa1i8KO+BMy9bYke1goOVgMfVXAYrx639a35+YdEmzvWTIt3NtyydCTXtoE8rYAI/wfK+d3mgocaIexjRUDkTHbmlqUKkOfjW7LWqmbrT+qYE3ArdCwzR5u9dtZPPZz3fI/4gpzhPKh+ZW9zzaRQc6V75mbGc+9bHDTbyM8GoBE5pVuNiT4+UZa3N7iSxVGeBa9wEN0gDDVcpqLbCKI64weeX3sidj/btOlvr1v
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5971.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(346002)(39860400002)(376002)(396003)(366004)(451199021)(2906002)(41300700001)(8936002)(8676002)(478600001)(122000001)(38100700002)(71200400001)(110136005)(82960400001)(83380400001)(26005)(9686003)(186003)(6506007)(53546011)(7696005)(55016003)(38070700005)(86362001)(316002)(66946007)(6636002)(76116006)(4326008)(33656002)(66476007)(64756008)(66446008)(66556008)(52536014)(30864003)(5660300002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?nLoIy5j9siY/qtJA4td68nDC6Sl60kWoy8yEL5bBYU90rZzkpbTpR3QRz7L3?=
 =?us-ascii?Q?wOA+vOKlSzid515BBhnXz6lVhCJq3HTZhCMi3Ra/38Z0CPHixzAHUNg0Q7rg?=
 =?us-ascii?Q?k+oTtz3YVffoiegnzc30KzIhOc/svoohmjpXJ0jolq2Hol5SFknTFJ6HtKej?=
 =?us-ascii?Q?+z2BhZp+T0ERwutP669NiAKgEb9yuHu6zi7pKhWlK489Gah9JnWoI/TgzLcp?=
 =?us-ascii?Q?H5Ctld85rtOU5TAG+KffLbZXFEtdCG8QAg1QKYLmDYe49pb5eSATOJcTE3ut?=
 =?us-ascii?Q?yrolK2oSseBS8rSyJeVnchgs98+g0MY7ljBA/A2KNEGR4cIRSnW2y3xvqNtv?=
 =?us-ascii?Q?H+DwePhVH4UbSidipEn03pGISRHNxiSTEngaOKMv6n3Udyu25yxIQSVzjR3d?=
 =?us-ascii?Q?dNwLAUCGfzvYljAJKHvT4eBJcBY8f7xMwef5HNtAVLaJzDHAogaCbECLx0g/?=
 =?us-ascii?Q?ewkRvE0eF9FU4oedmTA3W52q/+jrBJOLASIaXELEOh4T7xMsXDd9nJ0jeKl9?=
 =?us-ascii?Q?tRyWb0AeU14uyDivSZ9wiks0X251Hr8fLHBOO8cQkCA6YXLpYLtJ1t6x+A0M?=
 =?us-ascii?Q?V2Xexvjwm3RA7+UOv5xRyotiAxPi7IVEaO7p75i5mQs9VUtiwNW/k6hM5U3L?=
 =?us-ascii?Q?SKcj6lM48reHkOq02kKNXcZdBUCkN/9gYXkiclp4hfCCiYo7OcBZI2mPDRcM?=
 =?us-ascii?Q?RRKD3QCD3+2HPkPHyCaoFYbz/zp3pWGE+vuNL08RU9c+dm7B358Z0p8sMWg+?=
 =?us-ascii?Q?ddY/X+rzXXngCGzyMtqVgfY5ZvaF5w8oUh1Yzx8BlWR/rBYa0Yu5tAV0NyKg?=
 =?us-ascii?Q?+g7CG3IK7u1Tt6ZsUVROumf+I9L9pOw++wPWexJjtHWeDQ8H93/vKbEmnOEr?=
 =?us-ascii?Q?97Dwi983F3kVKtDn3mQVV4Zzcd+TtYIo1XwhoxI1RbdBL8zOkhMGkJicLb8d?=
 =?us-ascii?Q?AJIP4x32WYflznZaEEXK783FDcbcnDzVQbki11vpxl7fWsrj3Y9WVM+uJiej?=
 =?us-ascii?Q?1DRyQbTpSLBUTxcS12pa6XzCklAEkjKtVHXxXK2os5Phn+tU5rTqXDEhureG?=
 =?us-ascii?Q?RT1IZpNOrLwcGbn8GmI7D9IR0UKw/UIoeH8qLQSy32w1aSMv5d+hWAJG0t3R?=
 =?us-ascii?Q?rATMW/MOhgR1Ef7F2dksa+Zwz07dTFkDzFB0CeE4U3KAOkhiTMS/yJ47ULET?=
 =?us-ascii?Q?gQ+m5DVh93sacGWwR5TwSEhVlHsvL1ZAcbyaQFUUGbmVokxg6aPMTLOK3uLz?=
 =?us-ascii?Q?4cf/gSKEOP8sBdZ1M1UuUGZ4/ez3Bt62hNtEQr5A6MfZeZqaXgEl8rQp8Z72?=
 =?us-ascii?Q?annKW2Kz41rPHISMKqQEpEKuD7ULjHf6LOdS1V3iiF6/rU6grPiCjX1uIx9w?=
 =?us-ascii?Q?k6Ghf6GhvoLKpr397nmAJQHBJYIQWXPFVxYwT8zY/W8p9ZZZzbK8Rt8MZN70?=
 =?us-ascii?Q?/CgSz6NFDYpqU01us2eoRsrV7jREoH/UFQcTmH/tutew/WJ1u5lKua0j8Kzm?=
 =?us-ascii?Q?tcpQpTRIfsTypa+EIpXLfXZgdyZRJ2efX8FMRLCBlh1MtodBskSS1GLApkvL?=
 =?us-ascii?Q?C+50BnGFbFUXdIh4EkOACHu5ZXpaheUwH/3+s9y1rEdzBczV55wZvzsxzjL/?=
 =?us-ascii?Q?Tg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5971.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cd87d6f-07c6-4e93-0eb4-08db735183b3
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jun 2023 18:50:14.1663 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YD1k9rOvDGqVHZkhzWlfJqVd7MzYvH7m396gG6KBf340lVmCFqCYrUwlq52Y/2bbuZQyrVWJ2i8Vh+pX5eK+s0vTIa+QsMprkF2oMqwnfiY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6972
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 2/2] drm/xe: Add reg read/write trace
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hi Lucas/Matt,

> -----Original Message-----
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Luca=
s De
> Marchi
> Sent: Wednesday, June 21, 2023 3:58 PM
> To: Roper, Matthew D <matthew.d.roper@intel.com>
> Cc: intel-xe@lists.freedesktop.org
> Subject: Re: [Intel-xe] [PATCH v2 2/2] drm/xe: Add reg read/write trace
>=20
> On Tue, Jun 20, 2023 at 07:10:43PM -0700, Matt Roper wrote:
> >On Tue, Jun 20, 2023 at 05:25:49PM -0700, Lucas De Marchi wrote:
> >> On Tue, Jun 20, 2023 at 10:38:50PM +0000, Radhakrishna Sripada wrote:
> >> >
> >> >
> >> > > -----Original Message-----
> >> > > From: De Marchi, Lucas <lucas.demarchi@intel.com>
> >> > > Sent: Tuesday, June 20, 2023 2:28 PM
> >> > > To: Sripada, Radhakrishna <radhakrishna.sripada@intel.com>
> >> > > Cc: intel-xe@lists.freedesktop.org; Roper, Matthew D
> >> > > <matthew.d.roper@intel.com>
> >> > > Subject: Re: [Intel-xe] [PATCH v2 2/2] drm/xe: Add reg read/write =
trace
> >> > >
> >> > > On Tue, Jun 20, 2023 at 12:32:29PM -0700, Radhakrishna Sripada wro=
te:
> >> > > >This will help debug register read/writes and provide
> >> > > >a way to trace all the mmio transactions.
> >> > > >
> >> > > >In order to avoid spam from xe_mmio_wait32,
> >> > > >xe_mmio_read32_notrace is introduced and used.
> >> > >
> >> > > feedback given before was to avoid the exported _notrace stuff. If=
 there
> >> > > was a justification for it somewhere I probably lost it. Could you
> >> > > clarify? If I understand the above paragraph correctly, it's due t=
o
> >> > > the fact the xe_mmio_wait32() reads the register multiple times...
> >> > > why would we want to avoid the "spam"? If we are reading it multip=
le
> >> > > times, the trace should show it instead of hiding.  If we demonstr=
ate
> >> > > there is an actual impact, then xe_mmio_wait32() should be adjuste=
d, not
> >> > > the rest of the shim layer in intel_uncore.h
> >> > Unless I missed some whaere earlier feedback I received was on the u=
sage
> of inline in function definitions.
> >> > Xe_mmio_wait32 I believe is loosely based out of
> __intel_wait_for_register(atleast based on compat-headers)
> >> > Where during the actual check, no trace version of register read is =
used and
> just the final value is traced before
> >> > Returning from the function. A similar kind of approach is adapted h=
ere.
> >> >
> >> > If it does not make much value like that then I believe we can use a
> traceable version
> >> > But in case if developers want to have a stack trace for each tracee=
 out put
> then the spam becomes even more
> >> > messy.
> >>
> >> there was a chat last week about that... maybe I misremembered and you
> >> were not part of it.  The trace part should be pretty cheap to be kept
> >> everywhere, particularly because it's not enabled by default it's
> >> nothing more than a few nop instructions.
> >>
> >> If we don't trace everything and hide some of them behind functions li=
ke
> >> xe_mmio_wait32() or intel_uncore_read_fw(), with no indication in thei=
r
> >> name that they won't trace, then when we are reading the trace we spen=
d
> >> a long time tracking back what exactly was happening.
> >> When we have the complete trace, filtering should be pretty
> >> easy. Eliminating random traces means we lose information that is not
> >> possible to recover after the fact.
> >
> >I could see an argument for avoiding tracepoint i915:i915_reg_rw within
> >xe_mmio_wait32() if that function utilized separate tracepoints like
> >i915:i915_reg_wait_start and i915:i915_reg_wait_end instead.  That could
> >potentially consolidate the repeated trace output down to just two lines
> >without losing any information.  We don't have tracepoints like those
> >today though.
>=20
> you mean xe:xe_mmio_wait_start/xe:xe_mmio_wait_end, right?
> Yes, that would be good and the non-tracing functions would be local to
> xe_mmio rather than exported for everybody to shoot their own foot.

So in order to summarize the discussions, we can reduce(if possible elimina=
te)
the number of non_trace functions being exported, introduce 2 more trace po=
ints
namely xe:xe_mmio_wait_start/xe:xe_mmio_wait_end(it should be cheap to
implement), if we define the current xe_reg_rw as an event class and only u=
se the
nontrace variant  inside xe_mmio_wait32.

However the question still remains on the display side. There is an i915 pa=
tchset [1]
which should eliminate the nesting of trace events, for which non trace ver=
sions of
register read/writes need to be used. The motive is to avoid nested trace c=
alls. Though
in my recent tests it did not cause any problem, I think it is good to avoi=
d it overall.

Can you suggest a path forward? IMO we have to minimize the export of non t=
race functions
just to be used under other traces(however there is no way to guarantee tha=
t those functions
are not called other times.)

Thoughts?

Radhakrishna(RK) Sripada
>=20
> Lucas De Marchi
>=20
> >
> >
> >Matt
> >
> >>
> >> >
> >> > >
> >> > > >
> >> > > >v2: Do not use inline for the function declarations.(MattR)
> >> > > >
> >> > > >Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> >> > > >Cc: Matt Roper <matthew.d.roper@intel.com>
> >> > > >Signed-off-by: Radhakrishna Sripada <radhakrishna.sripada@intel.c=
om>
> >> > > >---
> >> > > > .../drm/xe/compat-i915-headers/intel_uncore.h |  8 +-
> >> > > > drivers/gpu/drm/xe/xe_mmio.c                  | 80 +++++++++++++=
+++++-
> >> > > > drivers/gpu/drm/xe/xe_mmio.h                  |  5 ++
> >> > > > drivers/gpu/drm/xe/xe_trace.h                 | 26 ++++++
> >> > > > 4 files changed, 111 insertions(+), 8 deletions(-)
> >> > > >
> >> > > >diff --git a/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.=
h
> >> > > b/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h
> >> > > >index fae6213d26f1..036f3b963a84 100644
> >> > > >--- a/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h
> >> > > >+++ b/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h
> >> > > >@@ -113,7 +113,7 @@ static inline u32 intel_uncore_read_fw(struct
> >> > > fake_uncore *uncore,
> >> > > > {
> >> > > > 	struct xe_reg reg =3D XE_REG(i915_mmio_reg_offset(i915_reg));
> >> > > >
> >> > > >-	return xe_mmio_read32(__fake_uncore_to_gt(uncore), reg);
> >> > > >+	return
> xe_mmio_read32_notrace(__fake_uncore_to_gt(uncore), reg);
> >> > >
> >> > > how would you even know that intel_uncore_read_fw() is non-traceab=
le?
> >> > > ditto for all the other functions in this header.
> >> > In i915 intel_uncore_read_fw and other _fw functions translate to
> raw_uncore_read
> >> > And its variants which do not include the GEN6 Header/footer which h=
ave
> the traces
> >> > included and hence are the non-trace variants. Unless I am missing
> something.
> >>
> >> I meant "as a user of the API". There's no clue whatsoever in
> >> intel_uncore_read_fw() that it will not trace. I think the selective
> >> trace/no-trace in random places in i915 was a mistake.
> >>
> >> Lucas De Marchi
> >>
> >> >
> >> > --Radhakrishna(RK) Sripada
> >> > >
> >> > >
> >> > > Lucas De Marchi
> >> > >
> >> > > > }
> >> > > >
> >> > > > static inline void intel_uncore_write_fw(struct fake_uncore *unc=
ore,
> >> > > >@@ -121,7 +121,7 @@ static inline void intel_uncore_write_fw(stru=
ct
> >> > > fake_uncore *uncore,
> >> > > > {
> >> > > > 	struct xe_reg reg =3D XE_REG(i915_mmio_reg_offset(i915_reg));
> >> > > >
> >> > > >-	xe_mmio_write32(__fake_uncore_to_gt(uncore), reg, val);
> >> > > >+	xe_mmio_write32_notrace(__fake_uncore_to_gt(uncore), reg,
> val);
> >> > > > }
> >> > > >
> >> > > > static inline u32 intel_uncore_read_notrace(struct fake_uncore
> *uncore,
> >> > > >@@ -129,7 +129,7 @@ static inline u32
> intel_uncore_read_notrace(struct
> >> > > fake_uncore *uncore,
> >> > > > {
> >> > > > 	struct xe_reg reg =3D XE_REG(i915_mmio_reg_offset(i915_reg));
> >> > > >
> >> > > >-	return xe_mmio_read32(__fake_uncore_to_gt(uncore), reg);
> >> > > >+	return
> xe_mmio_read32_notrace(__fake_uncore_to_gt(uncore), reg);
> >> > > > }
> >> > > >
> >> > > > static inline void intel_uncore_write_notrace(struct fake_uncore
> *uncore,
> >> > > >@@ -137,7 +137,7 @@ static inline void
> intel_uncore_write_notrace(struct
> >> > > fake_uncore *uncore,
> >> > > > {
> >> > > > 	struct xe_reg reg =3D XE_REG(i915_mmio_reg_offset(i915_reg));
> >> > > >
> >> > > >-	xe_mmio_write32(__fake_uncore_to_gt(uncore), reg, val);
> >> > > >+	xe_mmio_write32_notrace(__fake_uncore_to_gt(uncore), reg,
> val);
> >> > > > }
> >> > > >
> >> > > > #endif /* __INTEL_UNCORE_H__ */
> >> > > >diff --git a/drivers/gpu/drm/xe/xe_mmio.c
> b/drivers/gpu/drm/xe/xe_mmio.c
> >> > > >index 78c7f839f783..ef2192a2d060 100644
> >> > > >--- a/drivers/gpu/drm/xe/xe_mmio.c
> >> > > >+++ b/drivers/gpu/drm/xe/xe_mmio.c
> >> > > >@@ -19,6 +19,7 @@
> >> > > > #include "xe_gt_mcr.h"
> >> > > > #include "xe_macros.h"
> >> > > > #include "xe_module.h"
> >> > > >+#include "xe_trace.h"
> >> > > >
> >> > > > #define XEHP_MTCFG_ADDR		XE_REG(0x101800)
> >> > > > #define TILE_COUNT		REG_GENMASK(15, 8)
> >> > > >@@ -429,7 +430,7 @@ static const struct xe_reg
> mmio_read_whitelist[] =3D {
> >> > > > 	RING_TIMESTAMP(RENDER_RING_BASE),
> >> > > > };
> >> > > >
> >> > > >-u8 xe_mmio_read8(struct xe_gt *gt, struct xe_reg reg)
> >> > > >+u8 xe_mmio_read8_notrace(struct xe_gt *gt, struct xe_reg reg)
> >> > > > {
> >> > > > 	struct xe_tile *tile =3D gt_to_tile(gt);
> >> > > >
> >> > > >@@ -439,6 +440,31 @@ u8 xe_mmio_read8(struct xe_gt *gt, struct
> xe_reg
> >> > > reg)
> >> > > > 	return readb(tile->mmio.regs + reg.addr);
> >> > > > }
> >> > > >
> >> > > >+u8 xe_mmio_read8(struct xe_gt *gt, struct xe_reg reg)
> >> > > >+{
> >> > > >+	struct xe_tile *tile =3D gt_to_tile(gt);
> >> > > >+	u8 val;
> >> > > >+
> >> > > >+	if (reg.addr < gt->mmio.adj_limit)
> >> > > >+		reg.addr +=3D gt->mmio.adj_offset;
> >> > > >+
> >> > > >+	val =3D readb(tile->mmio.regs + reg.addr);
> >> > > >+
> >> > > >+	trace_xe_reg_rw(false, &reg, val, sizeof(val));
> >> > > >+
> >> > > >+	return val;
> >> > > >+}
> >> > > >+
> >> > > >+void xe_mmio_write32_notrace(struct xe_gt *gt, struct xe_reg reg=
,
> u32 val)
> >> > > >+{
> >> > > >+	struct xe_tile *tile =3D gt_to_tile(gt);
> >> > > >+
> >> > > >+	if (reg.addr < gt->mmio.adj_limit)
> >> > > >+		reg.addr +=3D gt->mmio.adj_offset;
> >> > > >+
> >> > > >+	writel(val, tile->mmio.regs + reg.addr);
> >> > > >+}
> >> > > >+
> >> > > > void xe_mmio_write32(struct xe_gt *gt, struct xe_reg reg, u32 va=
l)
> >> > > > {
> >> > > > 	struct xe_tile *tile =3D gt_to_tile(gt);
> >> > > >@@ -446,10 +472,12 @@ void xe_mmio_write32(struct xe_gt *gt,
> struct
> >> > > xe_reg reg, u32 val)
> >> > > > 	if (reg.addr < gt->mmio.adj_limit)
> >> > > > 		reg.addr +=3D gt->mmio.adj_offset;
> >> > > >
> >> > > >+	trace_xe_reg_rw(true, &reg, val, sizeof(val));
> >> > > >+
> >> > > > 	writel(val, tile->mmio.regs + reg.addr);
> >> > > > }
> >> > > >
> >> > > >-u32 xe_mmio_read32(struct xe_gt *gt, struct xe_reg reg)
> >> > > >+u32 xe_mmio_read32_notrace(struct xe_gt *gt, struct xe_reg reg)
> >> > > > {
> >> > > > 	struct xe_tile *tile =3D gt_to_tile(gt);
> >> > > >
> >> > > >@@ -459,6 +487,21 @@ u32 xe_mmio_read32(struct xe_gt *gt, struct
> xe_reg
> >> > > reg)
> >> > > > 	return readl(tile->mmio.regs + reg.addr);
> >> > > > }
> >> > > >
> >> > > >+u32 xe_mmio_read32(struct xe_gt *gt, struct xe_reg reg)
> >> > > >+{
> >> > > >+	struct xe_tile *tile =3D gt_to_tile(gt);
> >> > > >+	u32 val;
> >> > > >+
> >> > > >+	if (reg.addr < gt->mmio.adj_limit)
> >> > > >+		reg.addr +=3D gt->mmio.adj_offset;
> >> > > >+
> >> > > >+	val =3D readl(tile->mmio.regs + reg.addr);
> >> > > >+
> >> > > >+	trace_xe_reg_rw(false, &reg, val, sizeof(val));
> >> > > >+
> >> > > >+	return val;
> >> > > >+}
> >> > > >+
> >> > > > u32 xe_mmio_rmw32(struct xe_gt *gt, struct xe_reg reg, u32 clr, =
u32
> set)
> >> > > > {
> >> > > > 	u32 old, reg_val;
> >> > > >@@ -470,6 +513,16 @@ u32 xe_mmio_rmw32(struct xe_gt *gt, struct
> xe_reg
> >> > > reg, u32 clr, u32 set)
> >> > > > 	return old;
> >> > > > }
> >> > > >
> >> > > >+void xe_mmio_write64_notrace(struct xe_gt *gt, struct xe_reg reg=
,
> u64 val)
> >> > > >+{
> >> > > >+	struct xe_tile *tile =3D gt_to_tile(gt);
> >> > > >+
> >> > > >+	if (reg.addr < gt->mmio.adj_limit)
> >> > > >+		reg.addr +=3D gt->mmio.adj_offset;
> >> > > >+
> >> > > >+	writeq(val, tile->mmio.regs + reg.addr);
> >> > > >+}
> >> > > >+
> >> > > > void xe_mmio_write64(struct xe_gt *gt, struct xe_reg reg, u64 va=
l)
> >> > > > {
> >> > > > 	struct xe_tile *tile =3D gt_to_tile(gt);
> >> > > >@@ -477,10 +530,12 @@ void xe_mmio_write64(struct xe_gt *gt,
> struct
> >> > > xe_reg reg, u64 val)
> >> > > > 	if (reg.addr < gt->mmio.adj_limit)
> >> > > > 		reg.addr +=3D gt->mmio.adj_offset;
> >> > > >
> >> > > >+	trace_xe_reg_rw(true, &reg, val, sizeof(val));
> >> > > >+
> >> > > > 	writeq(val, tile->mmio.regs + reg.addr);
> >> > > > }
> >> > > >
> >> > > >-u64 xe_mmio_read64(struct xe_gt *gt, struct xe_reg reg)
> >> > > >+u64 xe_mmio_read64_notrace(struct xe_gt *gt, struct xe_reg reg)
> >> > > > {
> >> > > > 	struct xe_tile *tile =3D gt_to_tile(gt);
> >> > > >
> >> > > >@@ -490,6 +545,21 @@ u64 xe_mmio_read64(struct xe_gt *gt, struct
> xe_reg
> >> > > reg)
> >> > > > 	return readq(tile->mmio.regs + reg.addr);
> >> > > > }
> >> > > >
> >> > > >+u64 xe_mmio_read64(struct xe_gt *gt, struct xe_reg reg)
> >> > > >+{
> >> > > >+	struct xe_tile *tile =3D gt_to_tile(gt);
> >> > > >+	u64 val;
> >> > > >+
> >> > > >+	if (reg.addr < gt->mmio.adj_limit)
> >> > > >+		reg.addr +=3D gt->mmio.adj_offset;
> >> > > >+
> >> > > >+	val =3D readq(tile->mmio.regs + reg.addr);
> >> > > >+
> >> > > >+	trace_xe_reg_rw(false, &reg, val, sizeof(val));
> >> > > >+
> >> > > >+	return val;
> >> > > >+}
> >> > > >+
> >> > > > int xe_mmio_write32_and_verify(struct xe_gt *gt, struct xe_reg r=
eg,
> u32 val,
> >> > > > 			       u32 mask, u32 eval)
> >> > > > {
> >> > > >@@ -511,7 +581,7 @@ int xe_mmio_wait32(struct xe_gt *gt, struct
> xe_reg
> >> > > reg, u32 val, u32 mask,
> >> > > > 	u32 read;
> >> > > >
> >> > > > 	for (;;) {
> >> > > >-		read =3D xe_mmio_read32(gt, reg);
> >> > > >+		read =3D xe_mmio_read32_notrace(gt, reg);
> >> > > > 		if ((read & mask) =3D=3D val) {
> >> > > > 			ret =3D 0;
> >> > > > 			break;
> >> > > >@@ -531,6 +601,8 @@ int xe_mmio_wait32(struct xe_gt *gt, struct
> xe_reg
> >> > > reg, u32 val, u32 mask,
> >> > > > 		wait <<=3D 1;
> >> > > > 	}
> >> > > >
> >> > > >+	trace_xe_reg_rw(false, &reg, read, sizeof(read));
> >> > > >+
> >> > > > 	if (out_val)
> >> > > > 		*out_val =3D read;
> >> > > >
> >> > > >diff --git a/drivers/gpu/drm/xe/xe_mmio.h
> b/drivers/gpu/drm/xe/xe_mmio.h
> >> > > >index c06fcac2cc5b..02364ba9dda2 100644
> >> > > >--- a/drivers/gpu/drm/xe/xe_mmio.h
> >> > > >+++ b/drivers/gpu/drm/xe/xe_mmio.h
> >> > > >@@ -20,11 +20,16 @@ struct xe_device;
> >> > > > #define GEN12_LMEM_BAR		2
> >> > > >
> >> > > > int xe_mmio_init(struct xe_device *xe);
> >> > > >+u8 xe_mmio_read8_notrace(struct xe_gt *gt, struct xe_reg reg);
> >> > > > u8 xe_mmio_read8(struct xe_gt *gt, struct xe_reg reg);
> >> > > >+void xe_mmio_write32_notrace(struct xe_gt *gt, struct xe_reg reg=
,
> u32 val);
> >> > > > void xe_mmio_write32(struct xe_gt *gt, struct xe_reg reg, u32 va=
l);
> >> > > >+u32 xe_mmio_read32_notrace(struct xe_gt *gt, struct xe_reg reg);
> >> > > > u32 xe_mmio_read32(struct xe_gt *gt, struct xe_reg reg);
> >> > > > u32 xe_mmio_rmw32(struct xe_gt *gt, struct xe_reg reg, u32 clr, =
u32
> set);
> >> > > >+void xe_mmio_write64_notrace(struct xe_gt *gt, struct xe_reg reg=
,
> u64 val);
> >> > > > void xe_mmio_write64(struct xe_gt *gt, struct xe_reg reg, u64 va=
l);
> >> > > >+u64 xe_mmio_read64_notrace(struct xe_gt *gt, struct xe_reg reg);
> >> > > > u64 xe_mmio_read64(struct xe_gt *gt, struct xe_reg reg);
> >> > > > int xe_mmio_write32_and_verify(struct xe_gt *gt, struct xe_reg r=
eg,
> u32 val,
> >> > > > 			       u32 mask, u32 eval);
> >> > > >diff --git a/drivers/gpu/drm/xe/xe_trace.h
> b/drivers/gpu/drm/xe/xe_trace.h
> >> > > >index 2f8eb7ebe9a7..a5d514c190a2 100644
> >> > > >--- a/drivers/gpu/drm/xe/xe_trace.h
> >> > > >+++ b/drivers/gpu/drm/xe/xe_trace.h
> >> > > >@@ -12,6 +12,7 @@
> >> > > > #include <linux/tracepoint.h>
> >> > > > #include <linux/types.h>
> >> > > >
> >> > > >+#include "regs/xe_reg_defs.h"
> >> > > > #include "xe_bo_types.h"
> >> > > > #include "xe_engine_types.h"
> >> > > > #include "xe_gt_tlb_invalidation_types.h"
> >> > > >@@ -507,6 +508,31 @@ DEFINE_EVENT(xe_vm,
> xe_vm_rebind_worker_exit,
> >> > > > 	     TP_ARGS(vm)
> >> > > > );
> >> > > >
> >> > > >+TRACE_EVENT(xe_reg_rw,
> >> > > >+	    TP_PROTO(bool write, struct xe_reg *reg, u64 val, int len),
> >> > > >+	    TP_ARGS(write, reg, val, len),
> >> > > >+
> >> > > >+	    TP_STRUCT__entry(
> >> > > >+		    __field(u64, val)
> >> > > >+		    __field(struct xe_reg *, reg)
> >> > > >+		    __field(u16, write)
> >> > > >+		    __field(u16, len)
> >> > > >+		    ),
> >> > > >+
> >> > > >+	    TP_fast_assign(
> >> > > >+		   __entry->val =3D (u64)val;
> >> > > >+		   __entry->reg =3D reg;
> >> > > >+		   __entry->write =3D write;
> >> > > >+		   __entry->len =3D len;
> >> > > >+		),
> >> > > >+
> >> > > >+	    TP_printk("%s reg=3D0x%x, len=3D%d, val=3D(0x%x, 0x%x)",
> >> > > >+		      __entry->write ? "write" : "read",
> >> > > >+		      __entry->reg->addr, __entry->len,
> >> > > >+		      (u32)(__entry->val & 0xffffffff),
> >> > > >+		      (u32)(__entry->val >> 32))
> >> > > >+);
> >> > > >+
> >> > > > TRACE_EVENT(xe_guc_ct_h2g_flow_control,
> >> > > > 	    TP_PROTO(u32 _head, u32 _tail, u32 size, u32 space, u32
> len),
> >> > > > 	    TP_ARGS(_head, _tail, size, space, len),
> >> > > >--
> >> > > >2.34.1
> >> > > >
> >
> >--
> >Matt Roper
> >Graphics Software Engineer
> >Linux GPU Platform Enablement
> >Intel Corporation
