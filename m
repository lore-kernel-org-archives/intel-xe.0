Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33DAEC0015E
	for <intel-xe@archiver.kernel.org>; Fri, 11 Aug 2023 19:20:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0817410E6EB;
	Fri, 11 Aug 2023 19:20:15 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3804710E6EB
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Aug 2023 19:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691781612; x=1723317612;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=FrKUeryElRs4gipV7N4GW7lHFXScatNmq8i5AddnXv8=;
 b=YBbaQjo3ZGc5NHbPGv6qw1omJb6U+PkmdWJlUz676tQ9btN+1IsTemyZ
 dCPOQXGXJBiCCLDT5tfhPik7pnD4wBIy1TLH+UN/fUmZrHC2kFXFi29Fc
 ZMSRqXvy0yC+gvyPI7FlLUq7D8EFChJZkJLyeVR4j3HvIOLcglp6AXJUQ
 S/T0+0iwtkHPC9hlnSy6I6Ezm0KQpbRnDhAKJoEH8XdgnyoYNC2ea9IaP
 xvvORfWVT2ZhXjNlj7oqHQVks7eLuJIt2Oh5CIbC5g8/lj7MQ9tXaCfLO
 pLvOWq27+KtDmcvdZvBWXI5MlOMxTRCnPDAjTp4ln8wXp4hKfYim1vvZb g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="369214676"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; d="scan'208";a="369214676"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2023 12:20:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="846882303"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; d="scan'208";a="846882303"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga002.fm.intel.com with ESMTP; 11 Aug 2023 12:20:11 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 11 Aug 2023 12:20:09 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 11 Aug 2023 12:20:09 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 11 Aug 2023 12:20:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZICNS3l8TsvHSVeoAzelu/RxjO8TVr1qujwi8/TVBzoIJQFBO4seBaD02dkdyOE6il7tJvzbAXg4GQ7pMkRz+X5wJOAExXc8/TQeASYQy79Yvi/mTr1vpbhOsl7+RNDBO7n/UpAKCijiLQD8ABz64WkN7ws4J8PJQtKxcVHtze9jUj1k5o16d3QUbR843QrQ0U7QPSE01N+fh9FFYq2NVSlqWuun5vYM/u3D9NRk4yuNDhtV2VjSn3nasbko+grTijG6lZpBNHiAShQsGFj1AwNOf1RlTMxq1ZQrn+hoT90bfG+JzzWItwSdIFwNklghEjhmCrxGmvIfXMsA/sxn+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B8Y6Iz8YfPunStZwKf1Oj5+vgJAqLUHjxnKBKFXo9zg=;
 b=OjXPWB0H7+0JMmV6VkJA/x+hj9V8ZLEk5isJ3X5sGsWxfVTTUO1ftJL7pt54Y47U4DJDe9N2f2faMchA4hi9ElwJMhj0YdvU7AsVjA3OL1YdpFYN3SQIdMbESHvl61CXukIjOpYDm49lWmkufMQDG8zmr2NRn4nLE8Z4dV8b+lWpV+F24nt/yPXrJ6TkrlDI/ZhkUk77bKk9/KuaZG4MSKytmIaShe3CaklG9gvuFy4Yy1zjo3Knng+FOz4z7mQd/BWRDowpxCL/N6oQee0tBmoEUsc1ijNLDUy/uwtGaOFDOOKqOa5TL+SxG5WRLj2BnKm1Y7Ur4lH8h7f2bdBmVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB6991.namprd11.prod.outlook.com (2603:10b6:806:2b8::21)
 by SJ0PR11MB5896.namprd11.prod.outlook.com (2603:10b6:a03:42c::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.19; Fri, 11 Aug
 2023 19:20:07 +0000
Received: from SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::27f1:a7a0:b6db:6c99]) by SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::27f1:a7a0:b6db:6c99%3]) with mapi id 15.20.6652.029; Fri, 11 Aug 2023
 19:20:05 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
Thread-Topic: [Intel-xe] [PATCH 2/2] drm/xe: Improve vram info debug printing
Thread-Index: AQHZyaF6gq5GsrTWZ0mKAYHWIzIi2K/lbxkAgAADC6A=
Date: Fri, 11 Aug 2023 19:20:05 +0000
Message-ID: <SA1PR11MB6991E20160ABEC94348052329210A@SA1PR11MB6991.namprd11.prod.outlook.com>
References: <20230808024501.11669-1-oak.zeng@intel.com>
 <20230808024501.11669-3-oak.zeng@intel.com>
 <ZNZ9Dk16chiys59k@DUT025-TGLU.fm.intel.com>
In-Reply-To: <ZNZ9Dk16chiys59k@DUT025-TGLU.fm.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB6991:EE_|SJ0PR11MB5896:EE_
x-ms-office365-filtering-correlation-id: 211dbbd7-79fd-41fb-c7cc-08db9a9ff825
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QlF75splQGvDLSIj2e13c8CnWCwBcliaD1zz7lCP9FTeuYsaplfwAulTdH2uhlZmoxU/26zt1WKxdFowUhDZET0Q3NujNmH8FBaYOl71GOPkhMLv+IpagpNXxS5iB+MRdVlE2w1BI35yVnwST1mMfKrCbbvU3ROYVtrtX33YA1cjlIdC1RE3Aa5pjJCxOc8cfUwln1SNGZaRXvsbPbUVywFUGpHzHJHVMWrOxna706IXt0iX/h4hYgpkJ6qwBAlEAfNrxdXQjBLjsBIXSAlhKNuq1S3RXrXlzSliu17R7q1YtvTg5QR1MpJYjcE744e4duZPcaaZmSsX5c0wiNP/8zVt6bZMi8R97UkqN8/yTzwTCE7NgaJ619xuURE3DmNgzleqw9tXkxtwO/PU2gS1K/mk74oqKxMQ9a5UhaXrp0stoO7nfIv0qeVKGxwj0pjyHreAH9Xiqj1hX3nmNFZ3SYl48fy/djY9Ap4DBU/gql2Z+C2ppWAD9iD92a6ghZZnJw9crlrby4HA8kv57StLC9+63q4JqDw2XwKtMcJLaf0OfjoBEZQDlc7hMsXqlbgDv3VEt1hy0MZ4s066rB9Jx5ak0UVwE7R1fg7YRRQ+Ls42AJIUkTFer/wxqfB+ZZqb
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6991.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(376002)(366004)(136003)(39860400002)(396003)(1800799006)(451199021)(186006)(71200400001)(9686003)(7696005)(122000001)(38100700002)(82960400001)(55016003)(53546011)(26005)(6506007)(2906002)(478600001)(83380400001)(5660300002)(41300700001)(6636002)(52536014)(4326008)(76116006)(86362001)(8936002)(38070700005)(8676002)(6862004)(64756008)(33656002)(316002)(66556008)(66446008)(66476007)(66946007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?RcdS0gHVQQbxjqgw9ex9vwFBWuItJQdS+tGbZzuetODBKpS5eMTyxkq7R4MU?=
 =?us-ascii?Q?+61nUd3GBBvi2paG6+QeNFQw4+9s6FJUzpXkzEvj4+Ws7LM9cQBkopP6wsAb?=
 =?us-ascii?Q?4Rfjmxji/Or7rsJNpgpKOPERdrJUEBtncIRNASKWHbB9mfjRu8D6ybnm4f7R?=
 =?us-ascii?Q?Dcuo+kL0Lt2t4ADylvbNQFP+4P0/MBdaoCK8FwoeJdVKiHWX3vW+nuvi4lN1?=
 =?us-ascii?Q?pwB6GixbQKb1BxPU64D3jDMpxpBm46tRmkEy/Yrl8bS/J0nJ6jqKXrxJRzai?=
 =?us-ascii?Q?pn+wZXBkxq7HXC3trVQFZtkjhHxePFaZeZgrR65RgEoE9x3h4ATl4i9/wdpM?=
 =?us-ascii?Q?P+vtoCwoTjrZKMmfNdA3pgZUTuXattTEREMjzy8sHI3gis44Iv6kJhIYbWq8?=
 =?us-ascii?Q?3NgvsUFMnjr029Rfx2fWQ1CkJdSGA3SSAETLWWuZvAXOFque60bIF2rjFfPU?=
 =?us-ascii?Q?1kixVnmoDzpLifEJGst/NL33pUDRSDQ/jy7e3UdwDvnqtAxrzx0ZWJ8Gi4iy?=
 =?us-ascii?Q?B0wBxpajbqTu8lYS33kvxA/W9xJ4wpYRK2qKFkGLd7JvIHHbebqN+sYKYSdc?=
 =?us-ascii?Q?iAtdZZmEgYUaNghwh9yinSK5PEbuu1CzPflKMgS2fUFH+lnBPJ3YvHVxpYrD?=
 =?us-ascii?Q?FgFXfXDe7xGdluFD+o6nxGgFJ8Uq6gIk0dEbzfn2QKXwmy4hht0B8UCdTfIM?=
 =?us-ascii?Q?HqXIx4+R1Fmg2xcE8R1ylepNEymCnEAD+kah6Y7ux6gEWAXWgQz6LQLqYcTy?=
 =?us-ascii?Q?ByXVSN0/OgiFWOPAUtdNVAR1QrIcOQuP+3vR9XxAQPxG2W7YR/ot8N9V3G/c?=
 =?us-ascii?Q?zKHnrJfOP6VG4vHhhkJTWU9M9LPZTTfUa95JkgCjgWnLGz4zjB9X4K/wW2SB?=
 =?us-ascii?Q?oy7DiQEYuAUXIx+83rhkd/Is18hjqeHT9xR/stqPr/eoblbtKIpfrnOgcK/M?=
 =?us-ascii?Q?89zdm9Jzt0r9FA0YONS1BvPZwgLGqHwR5D+gQxYIHkrSCWVOXKwf6N2bTJcp?=
 =?us-ascii?Q?MVAfwaqjb87ryRL7dWi3BG35hzfqnePybiSV+XlhsSnkXWbgdKbnNQxLl59F?=
 =?us-ascii?Q?/xB0jFy4yEoDkZW/53/j1sL6EQ5arOkpWh5hTF7wJzAzCNwC2i04GKh2Gw+v?=
 =?us-ascii?Q?VPUjQGedaKP0Y8hnHfNPZLzYr5vXBIcnT/TOSZP5mFYn1Oplt+kK5CDiteNq?=
 =?us-ascii?Q?MuZcHkW1Yq/sXvczXE+VbeonWS9WLgfPraWvhvRkFU/EcNPqGOSC2fIlIywo?=
 =?us-ascii?Q?49/lF9sWCxddl9dlkno4MQ9IoFiLs39fZ35ZVmGA1EQ/6Hf8iDXwvyQHT6Dw?=
 =?us-ascii?Q?bjaZEUpqFFFNunQx75JNvzpAfo9wj+4jpWqdTzb5y6YeeHr38+ZvGdwMMSDL?=
 =?us-ascii?Q?vuOFnpyFucoTQHoxAngEVFUwW68vavQin2mT1Q4pwSvEINCA98EVqIcPxAVk?=
 =?us-ascii?Q?CbxH908xACDscNFhsWn9IR4WSBZOIpsErL6kKfkRtYTArLz5DMu4nrMsV5x2?=
 =?us-ascii?Q?PYalFUZ4mbvaI6JWZ8cd5Yk5mPp7T3y/7cQh78ful4lSdm1+Y4Wxyk+0tTfZ?=
 =?us-ascii?Q?AMGMHrQdyBdK9DF2SMk=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6991.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 211dbbd7-79fd-41fb-c7cc-08db9a9ff825
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Aug 2023 19:20:05.6500 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TcOAaO2FkoD6YFezP3sMuS891EJGulAhnbCy61hmP4CL6NVgXtm69aAtSSB4K0dOoJIrbVqe+U2vd43jxe+fWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5896
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/2] drm/xe: Improve vram info debug printing
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



Thanks,
Oak

> -----Original Message-----
> From: Brost, Matthew <matthew.brost@intel.com>
> Sent: August 11, 2023 2:25 PM
> To: Zeng, Oak <oak.zeng@intel.com>
> Cc: intel-xe@lists.freedesktop.org
> Subject: Re: [Intel-xe] [PATCH 2/2] drm/xe: Improve vram info debug print=
ing
>=20
> On Mon, Aug 07, 2023 at 10:45:01PM -0400, Oak Zeng wrote:
> > Print both device physical address range and CPU io range
> > of vram. Also print vram's actual size, usable size excluding
> > stolen memory, and CPU io accessible size.
> >
> > Signed-off-by: Oak Zeng <oak.zeng@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_mmio.c | 10 +++++-----
> >  1 file changed, 5 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.=
c
> > index 0d0966691eaa..9f249c61ff8e 100644
> > --- a/drivers/gpu/drm/xe/xe_mmio.c
> > +++ b/drivers/gpu/drm/xe/xe_mmio.c
> > @@ -286,12 +286,12 @@ int xe_mmio_probe_vram(struct xe_device *xe)
> >  		tile->mem.vram.usable_size =3D vram_size;
> >  		tile->mem.vram.mapping =3D xe->mem.vram.mapping + tile_offset;
> >
> > -		drm_info(&xe->drm, "VRAM[%u, %u]: %pa, %pa\n", id, tile->id,
> > -			 &tile->mem.vram.io_start, &tile-
> >mem.vram.usable_size);
> > +		drm_info(&xe->drm, "VRAM[%u, %u]: Actual physical size %pa,
> usable size exclude stolen %pa, CPU accessible size %pa\n", id,
> > +			 tile->id, &tile->mem.vram.actual_physical_size, &tile-
> >mem.vram.usable_size, &tile->mem.vram.io_size);
> >
> > -		if (tile->mem.vram.io_size < tile->mem.vram.usable_size)
> > -			drm_info(&xe->drm, "VRAM[%u, %u]: CPU access limited
> to %pa\n", id,
> > -				 tile->id, &tile->mem.vram.io_size);
>=20
> "CPU access limited to" is helpful to quickly ID if you are on small bar
> device, I would rather not drop this message or at least have a message
> indicating this a small bar device without having to math.

Ok, will add back some small bar device info.

Oak
>=20
> Matt
>=20
> > +		drm_info(&xe->drm, "VRAM[%u, %u]: DPA range: [%pa-%llx], io
> range: [%pa-%llx]\n", id, tile->id,
> > +			 &tile->mem.vram.base, tile->mem.vram.base + tile-
> >mem.vram.actual_physical_size,
> > +			 &tile->mem.vram.io_start, tile->mem.vram.io_start +
> tile->mem.vram.io_size);
> >
> >  		/* calculate total size using tile size to get the correct HW sizing=
 */
> >  		total_size +=3D tile_size;
> > --
> > 2.26.3
> >
