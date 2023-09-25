Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 249D8CE79A4
	for <intel-xe@archiver.kernel.org>; Mon, 25 Sep 2023 22:08:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E415D10E334;
	Mon, 25 Sep 2023 22:08:04 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B595E10E334
 for <intel-xe@lists.freedesktop.org>; Mon, 25 Sep 2023 22:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695679683; x=1727215683;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=GnWp2U1rSZ79lP/Nvz6FBYCbj8MxAwhkDcXBhAlaZbY=;
 b=eAoSaPV0k0FhclaHrYz1OJ1iNF3ZXWjCDiSjm8xMwOuT2qMZYwTwsMq6
 wZmCRWioUdFT5ITbvJISllG20iV+SVj1F+Up5NIzMdKNgpqXSvDoB8DXU
 R9AEL5C5n0/32kYWYuuUo4GyTkb7Re8OcxWHpTucALQ8XY1PhCCB6Gr7w
 yE6eVGg/gCtSkxk7TNWxoUJ2smzlUsL3XNkM5oMdQ9IRi9R3frZSFrP3R
 BwOA+KRZsMbdRDPZQM/f3rHV1oqmsrY5XQX8R59Ez2VMAXgWO6FzwRxHp
 xwo1OCLQFr5dsOtuVGoXkam3MIe+jt8gvm2WiCcY3mnmWgTd38TSXMpk5 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="412331732"
X-IronPort-AV: E=Sophos;i="6.03,176,1694761200"; d="scan'208";a="412331732"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2023 15:08:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="742087118"
X-IronPort-AV: E=Sophos;i="6.03,176,1694761200"; d="scan'208";a="742087118"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Sep 2023 15:08:02 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 25 Sep 2023 15:08:01 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 25 Sep 2023 15:08:01 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 25 Sep 2023 15:08:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VqzoD0iu3S3MyGTiQJW3IxiXFAxmf3TbWNFybjqv7ioxYMEOeUGBphYyHUzfdmqFgwjt0Hyz5SiVpOut6pye3pFQ79p1FjWKbRzVEWhmIs4sct3zc+298/fiGR6wTDqQjCj1lckRCWRp4CZARXhIYVGbbHyMglWCvq1oHEA3AbwGXfLvCvmHMc6ASpQo5V07xjMmJWwxkU2WCmqJrXwo6ghBY7bv1wJVYiw2YyOslCY8KdbE3ce9rriEqLLd4azrLXZ7nhtwH8OjEsbKHbt1HRAen3Z1npOQEzgoidh5K1Rs3o+8jcyjyveQNUaY2K7BNeRkokFi+be4KRZ8ojoxyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HJ3VlVnD0hYVhPk45zkCN6UW/YrJdj5czCP+xr5uJGs=;
 b=HAHCCyOflBFRiEmsCd4p3iwAiThzBOB/hATBt1iqvGTdzNQfqxhA5gTfOCtdeidNhDcQMaCD3NauPSxSwYLgWKpqtL46Bqin8ZVJgRrTmehALswfTykeWyWTKX5ngJ4vQCXgVmwZRP7mg/40su4HiI/4p/7/G+IYk9LySQcxEol3Eahwpyr5IeISXogfBCanMJfB4fG7CS7nZu4MCl0FqhIU6ayiz+aHc6T2AcpunZnJErB35V7OqtrY6CFa8Vi2pvR2EMWcI7IXrVBgaIyS0WXyVyUCci/uKtc8DN9NOARTKDc+sqwE/Hg9HVcfDHFecKc9bf2eKPeSu+1kp5oDNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB6991.namprd11.prod.outlook.com (2603:10b6:806:2b8::21)
 by SN7PR11MB6656.namprd11.prod.outlook.com (2603:10b6:806:26e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.27; Mon, 25 Sep
 2023 22:07:58 +0000
Received: from SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::18a2:59e7:4541:b61c]) by SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::18a2:59e7:4541:b61c%3]) with mapi id 15.20.6792.026; Mon, 25 Sep 2023
 22:07:58 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Thread-Topic: [Intel-xe] [PATCH DONTMERGE] drm/xe: uapi review submission
Thread-Index: AQHZ5qLTBMZB+MS6UUqYCSSHSH1HrLAZfgVAgBKnC4CAAAH6IA==
Date: Mon, 25 Sep 2023 22:07:58 +0000
Message-ID: <SA1PR11MB6991C46A049D8DA32312D2EB92FCA@SA1PR11MB6991.namprd11.prod.outlook.com>
References: <20230630100059.122881-1-thomas.hellstrom@linux.intel.com>
 <76c3d534-453a-7fd3-6fc8-cf30e9c8d464@intel.com>
 <SA1PR11MB6991CD7989DA6687290762F292F7A@SA1PR11MB6991.namprd11.prod.outlook.com>
 <ZRH+vx282lENgSpM@intel.com>
In-Reply-To: <ZRH+vx282lENgSpM@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB6991:EE_|SN7PR11MB6656:EE_
x-ms-office365-filtering-correlation-id: d735aff9-8f29-4a2a-ecf2-08dbbe13e0a1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Y+PV4q0/kG+MLeG05Pn5Q90Ns1neKLBerU9RNz2iJEkD0JtSnFPlrqos4FKzpkQLpDBCZH6meADzGPAMPtp1Uh5SZDAax5bba1pTUMDupNWSZ7jSunX8FDM7glS1YKf8t3F+eOAzsZm9bgf/mRlgIHThSsrtebFpcY9OKhUUzIZhSy0C5JOqr2WUGJKKAwX6bpLcAyIkSXKPelyqn/XFH0+3OuTIwiG11EtKgkdLyjpfHPb16sjLx0YrkuoHEjqLX+8+3epYHLrYtsrfePAOjiUXKLX2ODG10JBaTPzj6efoG0ZcqSzufdv1Op8kQbmo8HAem9ILS37unr5J4QDhqheyQ7QX5CZVnym9DqCVUnYooKUm8cpG+Q9xzZ/uEIBlXFSRKuZj+hCoDXqc9G5eXcDH0MQTY/cBhldw9j76YOlPDedcwp9VT+srvHZwmhMMonrRCQ1yXjLobpILkKUTlLn5ljlvHB965ta52C8TnZ6a25MpsyJGbJyBwSJeuNiyjHYdhIsLbg8K7seKU7kdo5AhDWdIpEK0IdVRH64fduOQ9dY6q4/ujKrGc4Y+SMhMiufHJF4rXcViTEMIJvyaNZHYJMziJTuHdQ9rngATxuQ2m5sK8DLa1ftEde1vodcMSZ6bXbIEgI/To3z83CKVaA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6991.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(396003)(136003)(376002)(366004)(346002)(230922051799003)(1800799009)(186009)(451199024)(26005)(316002)(6862004)(6636002)(8936002)(8676002)(54906003)(64756008)(66556008)(76116006)(4326008)(66946007)(66446008)(66476007)(9686003)(5660300002)(52536014)(55016003)(41300700001)(71200400001)(966005)(86362001)(30864003)(2906002)(82960400001)(38100700002)(38070700005)(122000001)(478600001)(83380400001)(66574015)(7696005)(6506007)(33656002)(53546011)(559001)(579004);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?wBKVKLYWl30MLTPA283bQ1u+U8k7syQnoY7FWWjmteGh3wR83iKAGWso/a?=
 =?iso-8859-1?Q?JWSCjZ5edqfLa+kA3ixfr2SfebBTRym5M3KJgaILwT/YCNsCq/kVMQCGMo?=
 =?iso-8859-1?Q?VnNQlFJDL//QHyEZ4JrTZHsSy0MaV2KTi4pTGlF6dJZeMH/sviO+bbisrk?=
 =?iso-8859-1?Q?3uo5MNp9JSg0Y6kJzS4T0r12deObo7dGshJn5ldZ2DGoJDDCwOq/jzVUnP?=
 =?iso-8859-1?Q?hpD0sSH0E1rXq7GkmnKrP1fZr+v5wx/FVtvPjPKPFfWZ/cl6spHJaFkXGx?=
 =?iso-8859-1?Q?yGpsoDrgmOCYuR/THz8717Nl5rlXSw1qNasrKPqk1uBVlNz9qE4cYNG1hZ?=
 =?iso-8859-1?Q?XNBVVnp8IQjhY8lixVth4M1jF8o0ZApneY4ANQWHkel+EEhRcGbZqvf890?=
 =?iso-8859-1?Q?t1lunB3uIc4ggKEA8jGvZJ1Y1jZdsn+FdEdgzO0EsFulKk1vnXkAPnS1pc?=
 =?iso-8859-1?Q?MrxEb79QwUgmtMXY8HQQgBdKzDmxaFLwNfvzSnOA5Z9C8yUvAaZRFJrDaF?=
 =?iso-8859-1?Q?U/kmCnDzdZ/KiFKuaYpAXQf78OtCr9fkLDWueeRpJ+qJMcC8rw61+5Yuxw?=
 =?iso-8859-1?Q?AWAhoHoSWlGj4eZLQxyYKJsKQxif+8I+mROvLqgonhGQO3OlgoZHDpdar7?=
 =?iso-8859-1?Q?vZ9I+FXEDl7WBIoI0Rw6UTfyUmbD/Z781sgIlVV5T8u7ovew2V1CYgOTeF?=
 =?iso-8859-1?Q?Ts0B9JOL10qVbXK3XuG9DJnzJepsYsYijpLoZsp8A0PdltBJZ4kKZjgw2u?=
 =?iso-8859-1?Q?ilm5liGIRdC8aKX753o6J0tVFBhr7zmaDnoA0jEEwsa+6MXTBZugpf7G5f?=
 =?iso-8859-1?Q?Qlos3mKMno4qgwoDg6NUW8R8mtTvGZXiCfOt17P4T0Ltw81vk9/oJO28uu?=
 =?iso-8859-1?Q?kjrcMVrOu113pGN3ehBCGhpY+DEUbzaTV06wziiESnb8j4VJJ6eu5GKIjv?=
 =?iso-8859-1?Q?gHZgCtuvr+MUm/77sUsuYqz9gAxVfGNf2VHp1jEg9WiJeLVWeHbasSXCsH?=
 =?iso-8859-1?Q?s3sDLQWct7e/6ca4zdPAjUFq6Fm9TuuDGLABYTCSbK4O1RPoWPbpOesFlg?=
 =?iso-8859-1?Q?ccQoTFaiVVpsYkrX7o/6SffqkEjaRdYew7pZfy09MCVU3LYFo7X5Wyb5G1?=
 =?iso-8859-1?Q?F/Jfxj53fFF44eB2j3PK2b/Jr8S/ziTcvziRpIUHchIRsHd9cKRrrUQDAH?=
 =?iso-8859-1?Q?7RUVs30fdgEm66CBAXfNSldnhiSZqA09C1bo66DqB+dQKQlR13U/uncHRr?=
 =?iso-8859-1?Q?+YV9n766Wo7E8QH9NY9hkMY8s7r30GgBL2eb1+dQsX66ZakhH2Anh6X6HE?=
 =?iso-8859-1?Q?1zogRKw024BA+P2BW5eP0GmtGGfYeWFyy6xckWY+ZRFvoT4BBSUlc3iPJr?=
 =?iso-8859-1?Q?S7IuwwuU3w13qGa3gvLYzgJ6qFPIwfG+SF7Zyhx8Vi1jbbvZAra5YHA666?=
 =?iso-8859-1?Q?YUAmqKSqLTA3hlaUhhF4e/MGTpYXGaUqbsW1Iddrm23QZLPFZCsmi/1Cct?=
 =?iso-8859-1?Q?G+malS0rbxiLJ8WZC7yx7pE8KPaCVX5WyuzwGl5XLuLV1MvKtcVTXa/Gg7?=
 =?iso-8859-1?Q?kuum+yYudCGneuDLQEAtQjZkJofII7FvSRD/OtXaQb0LFwQV/+yadLbbLF?=
 =?iso-8859-1?Q?6Allj9NLpnI9o=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6991.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d735aff9-8f29-4a2a-ecf2-08dbbe13e0a1
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2023 22:07:58.5201 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: H+OSH51KvaqJBVD0PIW4b4yqBqPH+cAVjwF64+p7O/c6nV/pd6c6uIv6WvhcVwqrqQgVYQl8AjXkD1ic/4lQBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6656
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH DONTMERGE] drm/xe: uapi review submission
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Arteaga
 Molina, Jaime A" <jaime.a.arteaga.molina@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



Thanks,
Oak

> -----Original Message-----
> From: Vivi, Rodrigo <rodrigo.vivi@intel.com>
> Sent: Monday, September 25, 2023 5:42 PM
> To: Zeng, Oak <oak.zeng@intel.com>
> Cc: Thomas Hellstr=F6m <thomas.hellstrom@linux.intel.com>; intel-
> xe@lists.freedesktop.org; Arteaga Molina, Jaime A
> <jaime.a.arteaga.molina@intel.com>
> Subject: Re: [Intel-xe] [PATCH DONTMERGE] drm/xe: uapi review submission
>=20
> On Thu, Sep 14, 2023 at 01:40:12AM +0000, Zeng, Oak wrote:
> > Hi Thomas,
> >
> > One thing regarding the atomic madvise came up in our recent discussion=
 with
> L0 team. See inline
> >
> > > -----Original Message-----
> > > From: Welty, Brian <brian.welty@intel.com>
> > > Sent: Wednesday, September 13, 2023 8:32 PM
> > > To: Zeng, Oak <oak.zeng@intel.com>
> > > Subject: [Intel-xe] [PATCH DONTMERGE] drm/xe: uapi review submission
> > >
> > >
> > >
> > >
> > > -------- Forwarded Message --------
> > > Subject: [Intel-xe] [PATCH DONTMERGE] drm/xe: uapi review submission
> > > Date: Fri, 30 Jun 2023 12:00:59 +0200
> > > From: Thomas Hellstr=F6m <thomas.hellstrom@linux.intel.com>
> > > To: intel-xe@lists.freedesktop.org
> > >
> > > Add a copy of xe_drm.h for uAPI review purposes only. Never commit th=
is,
> > > the intention is to perform an uAPI review in this thread and if need=
ed
> > > move it to Gitlab for easier discussion.
> > >
> > > Signed-off-by: Thomas Hellstr=F6m <thomas.hellstrom@linux.intel.com>
> > > ---
> > >   include/uapi/drm/xe_drm_reviewonly.h | 1009
> > > ++++++++++++++++++++++++++
> > >   1 file changed, 1009 insertions(+)
> > >   create mode 100644 include/uapi/drm/xe_drm_reviewonly.h
> > >
> > > diff --git a/include/uapi/drm/xe_drm_reviewonly.h
> > > b/include/uapi/drm/xe_drm_reviewonly.h
> > > new file mode 100644
> > > index 000000000000..e890b131af91
> > > --- /dev/null
> > > +++ b/include/uapi/drm/xe_drm_reviewonly.h
> > > @@ -0,0 +1,1009 @@
> > > +/* SPDX-License-Identifier: MIT */
> > > +/*
> > > + * Copyright =A9 2023 Intel Corporation
> > > + */
> > > +
> > > +#ifndef _UAPI_XE_DRM_H_
> > > +#define _UAPI_XE_DRM_H_
> > > +
> > > +#include "drm.h"
> > > +
> > > +#if defined(__cplusplus)
> > > +extern "C" {
> > > +#endif
> > > +
> > > +/* Please note that modifications to all structs defined here are
> > > + * subject to backwards-compatibility constraints.
> > > + */
> > > +
> > > +/**
> > > + * struct xe_user_extension - Base class for defining a chain of ext=
ensions
> > > + *
> > > + * Many interfaces need to grow over time. In most cases we can simp=
ly
> > > + * extend the struct and have userspace pass in more data. Another o=
ption,
> > > + * as demonstrated by Vulkan's approach to providing extensions for
> forward
> > > + * and backward compatibility, is to use a list of optional structs =
to
> > > + * provide those extra details.
> > > + *
> > > + * The key advantage to using an extension chain is that it allows u=
s to
> > > + * redefine the interface more easily than an ever growing struct of
> > > + * increasing complexity, and for large parts of that interface to b=
e
> > > + * entirely optional. The downside is more pointer chasing; chasing =
across
> > > + * the __user boundary with pointers encapsulated inside u64.
> > > + *
> > > + * Example chaining:
> > > + *
> > > + * .. code-block:: C
> > > + *
> > > + *	struct xe_user_extension ext3 {
> > > + *		.next_extension =3D 0, // end
> > > + *		.name =3D ...,
> > > + *	};
> > > + *	struct xe_user_extension ext2 {
> > > + *		.next_extension =3D (uintptr_t)&ext3,
> > > + *		.name =3D ...,
> > > + *	};
> > > + *	struct xe_user_extension ext1 {
> > > + *		.next_extension =3D (uintptr_t)&ext2,
> > > + *		.name =3D ...,
> > > + *	};
> > > + *
> > > + * Typically the struct xe_user_extension would be embedded in some =
uAPI
> > > + * struct, and in this case we would feed it the head of the chain(i=
.e
> > > ext1),
> > > + * which would then apply all of the above extensions.
> > > + *
> > > + */
> > > +struct xe_user_extension {
> > > +	/**
> > > +	 * @next_extension:
> > > +	 *
> > > +	 * Pointer to the next struct xe_user_extension, or zero if the end=
.
> > > +	 */
> > > +	__u64 next_extension;
> > > +
> > > +	/**
> > > +	 * @name: Name of the extension.
> > > +	 *
> > > +	 * Note that the name here is just some integer.
> > > +	 *
> > > +	 * Also note that the name space for this is not global for the who=
le
> > > +	 * driver, but rather its scope/meaning is limited to the specific =
piece
> > > +	 * of uAPI which has embedded the struct xe_user_extension.
> > > +	 */
> > > +	__u32 name;
> > > +
> > > +	/**
> > > +	 * @pad: MBZ
> > > +	 *
> > > +	 * All undefined bits must be zero.
> > > +	 */
> > > +	__u32 pad;
> > > +};
> > > +
> > > +/*
> > > + * xe specific ioctls.
> > > + *
> > > + * The device specific ioctl range is [DRM_COMMAND_BASE,
> > > DRM_COMMAND_END) ie
> > > + * [0x40, 0xa0) (a0 is excluded). The numbers below are defined as o=
ffset
> > > + * against DRM_COMMAND_BASE and should be between [0x0, 0x60).
> > > + */
> > > +#define DRM_XE_DEVICE_QUERY		0x00
> > > +#define DRM_XE_GEM_CREATE		0x01
> > > +#define DRM_XE_GEM_MMAP_OFFSET		0x02
> > > +#define DRM_XE_VM_CREATE		0x03
> > > +#define DRM_XE_VM_DESTROY		0x04
> > > +#define DRM_XE_VM_BIND			0x05
> > > +#define DRM_XE_ENGINE_CREATE		0x06
> > > +#define DRM_XE_ENGINE_DESTROY		0x07
> > > +#define DRM_XE_EXEC			0x08
> > > +#define DRM_XE_MMIO			0x09
> > > +#define DRM_XE_ENGINE_SET_PROPERTY	0x0a
> > > +#define DRM_XE_WAIT_USER_FENCE		0x0b
> > > +#define DRM_XE_VM_MADVISE		0x0c
> > > +#define DRM_XE_ENGINE_GET_PROPERTY	0x0d
> > > +
> > > +/* Must be kept compact -- no holes */
> > > +#define DRM_IOCTL_XE_DEVICE_QUERY
> > > 	DRM_IOWR(DRM_COMMAND_BASE +
> > > DRM_XE_DEVICE_QUERY, struct drm_xe_device_query)
> > > +#define DRM_IOCTL_XE_GEM_CREATE
> > > 	DRM_IOWR(DRM_COMMAND_BASE +
> > > DRM_XE_GEM_CREATE, struct drm_xe_gem_create)
> > > +#define DRM_IOCTL_XE_GEM_MMAP_OFFSET
> > > 	DRM_IOWR(DRM_COMMAND_BASE +
> > > DRM_XE_GEM_MMAP_OFFSET, struct drm_xe_gem_mmap_offset)
> > > +#define DRM_IOCTL_XE_VM_CREATE
> > > 	DRM_IOWR(DRM_COMMAND_BASE +
> > > DRM_XE_VM_CREATE, struct drm_xe_vm_create)
> > > +#define DRM_IOCTL_XE_VM_DESTROY
> > > DRM_IOW(DRM_COMMAND_BASE +
> > > DRM_XE_VM_DESTROY, struct drm_xe_vm_destroy)
> > > +#define DRM_IOCTL_XE_VM_BIND
> > > DRM_IOW(DRM_COMMAND_BASE +
> > > DRM_XE_VM_BIND, struct drm_xe_vm_bind)
> > > +#define DRM_IOCTL_XE_ENGINE_CREATE
> > > 	DRM_IOWR(DRM_COMMAND_BASE +
> > > DRM_XE_ENGINE_CREATE, struct drm_xe_engine_create)
> > > +#define DRM_IOCTL_XE_ENGINE_GET_PROPERTY
> > > 	DRM_IOWR(DRM_COMMAND_BASE +
> > > DRM_XE_ENGINE_GET_PROPERTY, struct drm_xe_engine_get_property)
> > > +#define DRM_IOCTL_XE_ENGINE_DESTROY
> > > DRM_IOW(DRM_COMMAND_BASE +
> > > DRM_XE_ENGINE_DESTROY, struct drm_xe_engine_destroy)
> > > +#define DRM_IOCTL_XE_EXEC
> > > DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC,
> > > struct drm_xe_exec)
> > > +#define DRM_IOCTL_XE_MMIO
> > > 	DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_MMIO,
> > > struct drm_xe_mmio)
> > > +#define DRM_IOCTL_XE_ENGINE_SET_PROPERTY
> > > DRM_IOW(DRM_COMMAND_BASE +
> > > DRM_XE_ENGINE_SET_PROPERTY, struct drm_xe_engine_set_property)
> > > +#define DRM_IOCTL_XE_WAIT_USER_FENCE
> > > 	DRM_IOWR(DRM_COMMAND_BASE +
> > > DRM_XE_WAIT_USER_FENCE, struct drm_xe_wait_user_fence)
> > > +#define DRM_IOCTL_XE_VM_MADVISE
> > > DRM_IOW(DRM_COMMAND_BASE +
> > > DRM_XE_VM_MADVISE, struct drm_xe_vm_madvise)
> > > +
> > > +/**
> > > + * enum drm_xe_memory_class - Supported memory classes.
> > > + */
> > > +enum drm_xe_memory_class {
> > > +	/** @XE_MEM_REGION_CLASS_SYSMEM: Represents system memory.
> > > */
> > > +	XE_MEM_REGION_CLASS_SYSMEM =3D 0,
> > > +	/**
> > > +	 * @XE_MEM_REGION_CLASS_VRAM: On discrete platforms, this
> > > +	 * represents the memory that is local to the device, which we
> > > +	 * call VRAM. Not valid on integrated platforms.
> > > +	 */
> > > +	XE_MEM_REGION_CLASS_VRAM
> > > +};
> > > +
> > > +/**
> > > + * struct drm_xe_query_mem_region - Describes some region as known t=
o
> > > + * the driver.
> > > + */
> > > +struct drm_xe_query_mem_region {
> > > +	/**
> > > +	 * @mem_class: The memory class describing this region.
> > > +	 *
> > > +	 * See enum drm_xe_memory_class for supported values.
> > > +	 */
> > > +	__u16 mem_class;
> > > +	/**
> > > +	 * @instance: The instance for this region.
> > > +	 *
> > > +	 * The @mem_class and @instance taken together will always give
> > > +	 * a unique pair.
> > > +	 */
> > > +	__u16 instance;
> > > +	/** @pad: MBZ */
> > > +	__u32 pad;
> > > +	/**
> > > +	 * @min_page_size: Min page-size in bytes for this region.
> > > +	 *
> > > +	 * When the kernel allocates memory for this region, the
> > > +	 * underlying pages will be at least @min_page_size in size.
> > > +	 *
> > > +	 * Important note: When userspace allocates a GTT address which
> > > +	 * can point to memory allocated from this region, it must also
> > > +	 * respect this minimum alignment. This is enforced by the
> > > +	 * kernel.
> > > +	 */
> > > +	__u32 min_page_size;
> > > +	/**
> > > +	 * @max_page_size: Max page-size in bytes for this region.
> > > +	 */
> > > +	__u32 max_page_size;
> > > +	/**
> > > +	 * @total_size: The usable size in bytes for this region.
> > > +	 */
> > > +	__u64 total_size;
> > > +	/**
> > > +	 * @used: Estimate of the memory used in bytes for this region.
> > > +	 *
> > > +	 * Requires CAP_PERFMON or CAP_SYS_ADMIN to get reliable
> > > +	 * accounting.  Without this the value here will always equal
> > > +	 * zero.
> > > +	 */
> > > +	__u64 used;
> > > +	/** @reserved: MBZ */
> > > +	__u64 reserved[8];
> > > +};
> > > +
> > > +/**
> > > + * struct drm_xe_query_mem_usage - describe memory regions and usage
> > > + *
> > > + * If a query is made with a struct drm_xe_device_query where .query
> > > + * is equal to DRM_XE_DEVICE_QUERY_MEM_USAGE, then the reply uses
> > > + * struct drm_xe_query_mem_usage in .data.
> > > + */
> > > +struct drm_xe_query_mem_usage {
> > > +	/** @num_regions: number of memory regions returned in @regions */
> > > +	__u32 num_regions;
> > > +	/** @pad: MBZ */
> > > +	__u32 pad;
> > > +	/** @regions: The returned regions for this device */
> > > +	struct drm_xe_query_mem_region regions[];
> > > +};
> > > +
> > > +/**
> > > + * struct drm_xe_query_config - describe the device configuration
> > > + *
> > > + * If a query is made with a struct drm_xe_device_query where .query
> > > + * is equal to DRM_XE_DEVICE_QUERY_CONFIG, then the reply uses
> > > + * struct drm_xe_query_config in .data.
> > > + */
> > > +struct drm_xe_query_config {
> > > +	/** @num_params: number of parameters returned in info */
> > > +	__u32 num_params;
> > > +
> > > +	/** @pad: MBZ */
> > > +	__u32 pad;
> > > +
> > > +#define XE_QUERY_CONFIG_REV_AND_DEVICE_ID	0
> > > +#define XE_QUERY_CONFIG_FLAGS			1
> > > +	#define XE_QUERY_CONFIG_FLAGS_HAS_VRAM		(0x1 << 0)
> > > +	#define XE_QUERY_CONFIG_FLAGS_USE_GUC		(0x1 << 1)
> > > +#define XE_QUERY_CONFIG_MIN_ALIGNEMENT		2
> > > +#define XE_QUERY_CONFIG_VA_BITS			3
> > > +#define XE_QUERY_CONFIG_GT_COUNT		4
> > > +#define XE_QUERY_CONFIG_MEM_REGION_COUNT	5
> > > +#define XE_QUERY_CONFIG_MAX_ENGINE_PRIORITY	6
> > > +#define XE_QUERY_CONFIG_NUM_PARAM
> > > 	(XE_QUERY_CONFIG_MAX_ENGINE_PRIORITY
> > > + 1)
> > > +	/** @info: array of elements containing the config info */
> > > +	__u64 info[];
> > > +};
> > > +
> > > +/**
> > > + * struct drm_xe_query_gts - describe GTs
> > > + *
> > > + * If a query is made with a struct drm_xe_device_query where .query
> > > + * is equal to DRM_XE_DEVICE_QUERY_GTS, then the reply uses struct
> > > + * drm_xe_query_gts in .data.
> > > + */
> > > +struct drm_xe_query_gts {
> > > +	/** @num_gt: number of GTs returned in gts */
> > > +	__u32 num_gt;
> > > +
> > > +	/** @pad: MBZ */
> > > +	__u32 pad;
> > > +
> > > +	/**
> > > +	 * @gts: The GTs returned for this device
> > > +	 *
> > > +	 * TODO: convert drm_xe_query_gt to proper kernel-doc.
> > > +	 * TODO: Perhaps info about every mem region relative to this GT? e=
.g.
> > > +	 * bandwidth between this GT and remote region?
> > > +	 */
> > > +	struct drm_xe_query_gt {
> > > +#define XE_QUERY_GT_TYPE_MAIN		0
> > > +#define XE_QUERY_GT_TYPE_REMOTE		1
> > > +#define XE_QUERY_GT_TYPE_MEDIA		2
> > > +		__u16 type;
> > > +		__u16 instance;
> > > +		__u32 clock_freq;
> > > +		__u64 features;
> > > +		__u64 native_mem_regions;	/* bit mask of instances from
> > > drm_xe_query_mem_usage */
> > > +		__u64 slow_mem_regions;		/* bit mask of instances
> > > from
> > > drm_xe_query_mem_usage */
> > > +		__u64 inaccessible_mem_regions;	/* bit mask of instances
> > > from
> > > drm_xe_query_mem_usage */
> > > +		__u64 reserved[8];
> > > +	} gts[];
> > > +};
> > > +
> > > +/**
> > > + * struct drm_xe_query_topology_mask - describe the topology mask of=
 a
> GT
> > > + *
> > > + * This is the hardware topology which reflects the internal physica=
l
> > > + * structure of the GPU.
> > > + *
> > > + * If a query is made with a struct drm_xe_device_query where .query
> > > + * is equal to DRM_XE_DEVICE_QUERY_GT_TOPOLOGY, then the reply uses
> > > + * struct drm_xe_query_topology_mask in .data.
> > > + */
> > > +struct drm_xe_query_topology_mask {
> > > +	/** @gt_id: GT ID the mask is associated with */
> > > +	__u16 gt_id;
> > > +
> > > +	/*
> > > +	 * To query the mask of Dual Sub Slices (DSS) available for geometr=
y
> > > +	 * operations. For example a query response containing the followin=
g
> > > +	 * in mask:
> > > +	 *   DSS_GEOMETRY    ff ff ff ff 00 00 00 00
> > > +	 * means 32 DSS are available for geometry.
> > > +	 */
> > > +#define XE_TOPO_DSS_GEOMETRY	(1 << 0)
> > > +	/*
> > > +	 * To query the mask of Dual Sub Slices (DSS) available for compute
> > > +	 * operations. For example a query response containing the followin=
g
> > > +	 * in mask:
> > > +	 *   DSS_COMPUTE    ff ff ff ff 00 00 00 00
> > > +	 * means 32 DSS are available for compute.
> > > +	 */
> > > +#define XE_TOPO_DSS_COMPUTE	(1 << 1)
> > > +	/*
> > > +	 * To query the mask of Execution Units (EU) available per Dual Sub
> > > +	 * Slices (DSS). For example a query response containing the follow=
ing
> > > +	 * in mask:
> > > +	 *   EU_PER_DSS    ff ff 00 00 00 00 00 00
> > > +	 * means each DSS has 16 EU.
> > > +	 */
> > > +#define XE_TOPO_EU_PER_DSS	(1 << 2)
> > > +	/** @type: type of mask */
> > > +	__u16 type;
> > > +
> > > +	/** @num_bytes: number of bytes in requested mask */
> > > +	__u32 num_bytes;
> > > +
> > > +	/** @mask: little-endian mask of @num_bytes */
> > > +	__u8 mask[];
> > > +};
> > > +
> > > +/**
> > > + * struct drm_xe_device_query - main structure to query device infor=
mation
> > > + *
> > > + * If size is set to 0, the driver fills it with the required size f=
or the
> > > + * requested type of data to query. If size is equal to the required=
 size,
> > > + * the queried information is copied into data.
> > > + *
> > > + * For example the following code snippet allows retrieving and prin=
ting
> > > + * information about the device engines with
> > > DRM_XE_DEVICE_QUERY_ENGINES:
> > > + *
> > > + * .. code-block:: C
> > > + *
> > > + *	struct drm_xe_engine_class_instance *hwe;
> > > + *	struct drm_xe_device_query query =3D {
> > > + *		.extensions =3D 0,
> > > + *		.query =3D DRM_XE_DEVICE_QUERY_ENGINES,
> > > + *		.size =3D 0,
> > > + *		.data =3D 0,
> > > + *	};
> > > + *	ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query);
> > > + *	hwe =3D malloc(query.size);
> > > + *	query.data =3D (uintptr_t)hwe;
> > > + *	ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query);
> > > + *	int num_engines =3D query.size / sizeof(*hwe);
> > > + *	for (int i =3D 0; i < num_engines; i++) {
> > > + *		printf("Engine %d: %s\n", i,
> > > + *			hwe[i].engine_class =3D=3D
> > > DRM_XE_ENGINE_CLASS_RENDER ? "RENDER":
> > > + *			hwe[i].engine_class =3D=3D DRM_XE_ENGINE_CLASS_COPY ?
> > > "COPY":
> > > + *			hwe[i].engine_class =3D=3D
> > > DRM_XE_ENGINE_CLASS_VIDEO_DECODE ?
> > > "VIDEO_DECODE":
> > > + *			hwe[i].engine_class =3D=3D
> > > DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE ?
> > > "VIDEO_ENHANCE":
> > > + *			hwe[i].engine_class =3D=3D
> > > DRM_XE_ENGINE_CLASS_COMPUTE ? "COMPUTE":
> > > + *			"UNKNOWN");
> > > + *	}
> > > + *	free(hwe);
> > > + */
> > > +struct drm_xe_device_query {
> > > +	/** @extensions: Pointer to the first extension struct, if any */
> > > +	__u64 extensions;
> > > +
> > > +#define DRM_XE_DEVICE_QUERY_ENGINES	0
> > > +#define DRM_XE_DEVICE_QUERY_MEM_USAGE	1
> > > +#define DRM_XE_DEVICE_QUERY_CONFIG	2
> > > +#define DRM_XE_DEVICE_QUERY_GTS		3
> > > +#define DRM_XE_DEVICE_QUERY_HWCONFIG	4
> > > +#define DRM_XE_DEVICE_QUERY_GT_TOPOLOGY	5
> > > +	/** @query: The type of data to query */
> > > +	__u32 query;
> > > +
> > > +	/** @size: Size of the queried data */
> > > +	__u32 size;
> > > +
> > > +	/** @data: Queried data is placed here */
> > > +	__u64 data;
> > > +
> > > +	/** @reserved: Reserved */
> > > +	__u64 reserved[2];
> > > +};
> > > +
> > > +struct drm_xe_gem_create {
> > > +	/** @extensions: Pointer to the first extension struct, if any */
> > > +	__u64 extensions;
> > > +
> > > +	/**
> > > +	 * @size: Requested size for the object
> > > +	 *
> > > +	 * The (page-aligned) allocated size for the object will be returne=
d.
> > > +	 */
> > > +	__u64 size;
> > > +
> > > +#define XE_GEM_CREATE_FLAG_DEFER_BACKING	(0x1 << 24)
> > > +#define XE_GEM_CREATE_FLAG_SCANOUT		(0x1 << 25)
> > > +	/**
> > > +	 * @flags: Flags, currently a mask of memory instances of where BO =
can
> > > +	 * be placed
> > > +	 */
> > > +	__u32 flags;
> > > +
> > > +	/**
> > > +	 * @vm_id: Attached VM, if any
> > > +	 *
> > > +	 * If a VM is specified, this BO must:
> > > +	 *
> > > +	 *  1. Only ever be bound to that VM.
> > > +	 *
> > > +	 *  2. Cannot be exported as a PRIME fd.
> > > +	 */
> > > +	__u32 vm_id;
> > > +
> > > +	/**
> > > +	 * @handle: Returned handle for the object.
> > > +	 *
> > > +	 * Object handles are nonzero.
> > > +	 */
> > > +	__u32 handle;
> > > +
> > > +	/** @pad: MBZ */
> > > +	__u32 pad;
> > > +
> > > +	/** @reserved: Reserved */
> > > +	__u64 reserved[2];
> > > +};
> > > +
> > > +struct drm_xe_gem_mmap_offset {
> > > +	/** @extensions: Pointer to the first extension struct, if any */
> > > +	__u64 extensions;
> > > +
> > > +	/** @handle: Handle for the object being mapped. */
> > > +	__u32 handle;
> > > +
> > > +	/** @flags: Must be zero */
> > > +	__u32 flags;
> > > +
> > > +	/** @offset: The fake offset to use for subsequent mmap call */
> > > +	__u64 offset;
> > > +
> > > +	/** @reserved: Reserved */
> > > +	__u64 reserved[2];
> > > +};
> > > +
> > > +/**
> > > + * struct drm_xe_vm_bind_op_error_capture - format of VM bind op err=
or
> > > capture
> > > + */
> > > +struct drm_xe_vm_bind_op_error_capture {
> > > +	/** @error: errno that occured */
> > > +	__s32 error;
> > > +
> > > +	/** @op: operation that encounter an error */
> > > +	__u32 op;
> > > +
> > > +	/** @addr: address of bind op */
> > > +	__u64 addr;
> > > +
> > > +	/** @size: size of bind */
> > > +	__u64 size;
> > > +};
> > > +
> > > +/** struct drm_xe_ext_vm_set_property - VM set property extension */
> > > +struct drm_xe_ext_vm_set_property {
> > > +	/** @base: base user extension */
> > > +	struct xe_user_extension base;
> > > +
> > > +#define XE_VM_PROPERTY_BIND_OP_ERROR_CAPTURE_ADDRESS
> 	0
> > > +	/** @property: property to set */
> > > +	__u32 property;
> > > +
> > > +	/** @pad: MBZ */
> > > +	__u32 pad;
> > > +
> > > +	/** @value: property value */
> > > +	__u64 value;
> > > +
> > > +	/** @reserved: Reserved */
> > > +	__u64 reserved[2];
> > > +};
> > > +
> > > +struct drm_xe_vm_create {
> > > +#define XE_VM_EXTENSION_SET_PROPERTY	0
> > > +	/** @extensions: Pointer to the first extension struct, if any */
> > > +	__u64 extensions;
> > > +
> > > +#define DRM_XE_VM_CREATE_SCRATCH_PAGE	(0x1 << 0)
> > > +#define DRM_XE_VM_CREATE_COMPUTE_MODE	(0x1 << 1)
> > > +#define DRM_XE_VM_CREATE_ASYNC_BIND_OPS	(0x1 << 2)
> > > +#define DRM_XE_VM_CREATE_FAULT_MODE	(0x1 << 3)
> > > +	/** @flags: Flags */
> > > +	__u32 flags;
> > > +
> > > +	/** @vm_id: Returned VM ID */
> > > +	__u32 vm_id;
> > > +
> > > +	/** @reserved: Reserved */
> > > +	__u64 reserved[2];
> > > +};
> > > +
> > > +struct drm_xe_vm_destroy {
> > > +	/** @vm_id: VM ID */
> > > +	__u32 vm_id;
> > > +
> > > +	/** @pad: MBZ */
> > > +	__u32 pad;
> > > +
> > > +	/** @reserved: Reserved */
> > > +	__u64 reserved[2];
> > > +};
> > > +
> > > +struct drm_xe_vm_bind_op {
> > > +	/**
> > > +	 * @obj: GEM object to operate on, MBZ for MAP_USERPTR, MBZ for
> > > UNMAP
> > > +	 */
> > > +	__u32 obj;
> > > +
> > > +	/** @pad: MBZ */
> > > +	__u32 pad;
> > > +
> > > +	union {
> > > +		/**
> > > +		 * @obj_offset: Offset into the object, MBZ for CLEAR_RANGE,
> > > +		 * ignored for unbind
> > > +		 */
> > > +		__u64 obj_offset;
> > > +
> > > +		/** @userptr: user pointer to bind on */
> > > +		__u64 userptr;
> > > +	};
> > > +
> > > +	/**
> > > +	 * @range: Number of bytes from the object to bind to addr, MBZ for
> > > UNMAP_ALL
> > > +	 */
> > > +	__u64 range;
> > > +
> > > +	/** @addr: Address to operate on, MBZ for UNMAP_ALL */
> > > +	__u64 addr;
> > > +
> > > +	/**
> > > +	 * @tile_mask: Mask for which tiles to create binds for, 0 =3D=3D A=
ll tiles,
> > > +	 * only applies to creating new VMAs
> > > +	 */
> > > +	__u64 tile_mask;
> > > +
> > > +#define XE_VM_BIND_OP_MAP		0x0
> > > +#define XE_VM_BIND_OP_UNMAP		0x1
> > > +#define XE_VM_BIND_OP_MAP_USERPTR	0x2
> > > +#define XE_VM_BIND_OP_RESTART		0x3
> > > +#define XE_VM_BIND_OP_UNMAP_ALL		0x4
> > > +#define XE_VM_BIND_OP_PREFETCH		0x5
> > > +
> > > +#define XE_VM_BIND_FLAG_READONLY	(0x1 << 16)
> > > +	/*
> > > +	 * A bind ops completions are always async, hence the support for o=
ut
> > > +	 * sync. This flag indicates the allocation of the memory for new p=
age
> > > +	 * tables and the job to program the pages tables is asynchronous
> > > +	 * relative to the IOCTL. That part of a bind operation can fail un=
der
> > > +	 * memory pressure, the job in practice can't fail unless the syste=
m is
> > > +	 * totally shot.
> > > +	 *
> > > +	 * If this flag is clear and the IOCTL doesn't return an error, in
> > > +	 * practice the bind op is good and will complete.
> > > +	 *
> > > +	 * If this flag is set and doesn't return an error, the bind op can
> > > +	 * still fail and recovery is needed. If configured, the bind op th=
at
> > > +	 * caused the error will be captured in
> > > drm_xe_vm_bind_op_error_capture.
> > > +	 * Once the user sees the error (via a ufence +
> > > +	 * XE_VM_PROPERTY_BIND_OP_ERROR_CAPTURE_ADDRESS), it should
> > > free memory
> > > +	 * via non-async unbinds, and then restart all queue'd async binds =
op via
> > > +	 * XE_VM_BIND_OP_RESTART. Or alternatively the user should destroy
> > > the
> > > +	 * VM.
> > > +	 *
> > > +	 * This flag is only allowed when
> > > DRM_XE_VM_CREATE_ASYNC_BIND_OPS is
> > > +	 * configured in the VM and must be set if the VM is configured wit=
h
> > > +	 * DRM_XE_VM_CREATE_ASYNC_BIND_OPS and not in an error state.
> > > +	 */
> > > +#define XE_VM_BIND_FLAG_ASYNC		(0x1 << 17)
> > > +	/*
> > > +	 * Valid on a faulting VM only, do the MAP operation immediately ra=
ther
> > > +	 * than differing the MAP to the page fault handler.
> > > +	 */
> > > +#define XE_VM_BIND_FLAG_IMMEDIATE	(0x1 << 18)
> > > +	/*
> > > +	 * When the NULL flag is set, the page tables are setup with a spec=
ial
> > > +	 * bit which indicates writes are dropped and all reads return zero=
.  In
> > > +	 * the future, the NULL flags will only be valid for XE_VM_BIND_OP_=
MAP
> > > +	 * operations, the BO handle MBZ, and the BO offset MBZ. This flag =
is
> > > +	 * intended to implement VK sparse bindings.
> > > +	 */
> > > +#define XE_VM_BIND_FLAG_NULL		(0x1 << 19)
> > > +	/** @op: Operation to perform (lower 16 bits) and flags (upper 16 b=
its)
> > > */
> > > +	__u32 op;
> > > +
> > > +	/** @mem_region: Memory region to prefetch VMA to, instance not a
> > > mask */
> > > +	__u32 region;
> > > +
> > > +	/** @reserved: Reserved */
> > > +	__u64 reserved[2];
> > > +};
> > > +
> > > +struct drm_xe_vm_bind {
> > > +	/** @extensions: Pointer to the first extension struct, if any */
> > > +	__u64 extensions;
> > > +
> > > +	/** @vm_id: The ID of the VM to bind to */
> > > +	__u32 vm_id;
> > > +
> > > +	/**
> > > +	 * @engine_id: engine_id, must be of class
> > > DRM_XE_ENGINE_CLASS_VM_BIND
> > > +	 * and engine must have same vm_id. If zero, the default VM bind en=
gine
> > > +	 * is used.
> > > +	 */
> > > +	__u32 engine_id;
> > > +
> > > +	/** @num_binds: number of binds in this IOCTL */
> > > +	__u32 num_binds;
> > > +
> > > +	/** @pad: MBZ */
> > > +	__u32 pad;
> > > +
> > > +	union {
> > > +		/** @bind: used if num_binds =3D=3D 1 */
> > > +		struct drm_xe_vm_bind_op bind;
> > > +
> > > +		/**
> > > +		 * @vector_of_binds: userptr to array of struct
> > > +		 * drm_xe_vm_bind_op if num_binds > 1
> > > +		 */
> > > +		__u64 vector_of_binds;
> > > +	};
> > > +
> > > +	/** @num_syncs: amount of syncs to wait on */
> > > +	__u32 num_syncs;
> > > +
> > > +	/** @pad2: MBZ */
> > > +	__u32 pad2;
> > > +
> > > +	/** @syncs: pointer to struct drm_xe_sync array */
> > > +	__u64 syncs;
> > > +
> > > +	/** @reserved: Reserved */
> > > +	__u64 reserved[2];
> > > +};
> > > +
> > > +/** struct drm_xe_ext_engine_set_property - engine set property
> > > extension */
> > > +struct drm_xe_ext_engine_set_property {
> > > +	/** @base: base user extension */
> > > +	struct xe_user_extension base;
> > > +
> > > +	/** @property: property to set */
> > > +	__u32 property;
> > > +
> > > +	/** @pad: MBZ */
> > > +	__u32 pad;
> > > +
> > > +	/** @value: property value */
> > > +	__u64 value;
> > > +};
> > > +
> > > +/**
> > > + * struct drm_xe_engine_set_property - engine set property
> > > + *
> > > + * Same namespace for extensions as drm_xe_engine_create
> > > + */
> > > +struct drm_xe_engine_set_property {
> > > +	/** @extensions: Pointer to the first extension struct, if any */
> > > +	__u64 extensions;
> > > +
> > > +	/** @engine_id: Engine ID */
> > > +	__u32 engine_id;
> > > +
> > > +#define XE_ENGINE_SET_PROPERTY_PRIORITY			0
> > > +#define XE_ENGINE_SET_PROPERTY_TIMESLICE		1
> > > +#define XE_ENGINE_SET_PROPERTY_PREEMPTION_TIMEOUT	2
> > > +	/*
> > > +	 * Long running or ULLS engine mode. DMA fences not allowed in this
> > > +	 * mode. Must match the value of
> > > DRM_XE_VM_CREATE_COMPUTE_MODE, serves
> > > +	 * as a sanity check the UMD knows what it is doing. Can only be se=
t at
> > > +	 * engine create time.
> > > +	 */
> > > +#define XE_ENGINE_SET_PROPERTY_COMPUTE_MODE		3
> > > +#define XE_ENGINE_SET_PROPERTY_PERSISTENCE		4
> > > +#define XE_ENGINE_SET_PROPERTY_JOB_TIMEOUT		5
> > > +#define XE_ENGINE_SET_PROPERTY_ACC_TRIGGER		6
> > > +#define XE_ENGINE_SET_PROPERTY_ACC_NOTIFY		7
> > > +#define XE_ENGINE_SET_PROPERTY_ACC_GRANULARITY		8
> > > +	/** @property: property to set */
> > > +	__u32 property;
> > > +
> > > +	/** @value: property value */
> > > +	__u64 value;
> > > +
> > > +	/** @reserved: Reserved */
> > > +	__u64 reserved[2];
> > > +};
> > > +
> > > +/** struct drm_xe_engine_class_instance - instance of an engine clas=
s */
> > > +struct drm_xe_engine_class_instance {
> > > +#define DRM_XE_ENGINE_CLASS_RENDER		0
> > > +#define DRM_XE_ENGINE_CLASS_COPY		1
> > > +#define DRM_XE_ENGINE_CLASS_VIDEO_DECODE	2
> > > +#define DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE	3
> > > +#define DRM_XE_ENGINE_CLASS_COMPUTE		4
> > > +	/*
> > > +	 * Kernel only class (not actual hardware engine class). Used for
> > > +	 * creating ordered queues of VM bind operations.
> > > +	 */
> > > +#define DRM_XE_ENGINE_CLASS_VM_BIND		5
> > > +	__u16 engine_class;
> > > +
> > > +	__u16 engine_instance;
> > > +	__u16 gt_id;
> > > +};
> > > +
> > > +struct drm_xe_engine_create {
> > > +#define XE_ENGINE_EXTENSION_SET_PROPERTY               0
> > > +	/** @extensions: Pointer to the first extension struct, if any */
> > > +	__u64 extensions;
> > > +
> > > +	/** @width: submission width (number BB per exec) for this engine *=
/
> > > +	__u16 width;
> > > +
> > > +	/** @num_placements: number of valid placements for this engine */
> > > +	__u16 num_placements;
> > > +
> > > +	/** @vm_id: VM to use for this engine */
> > > +	__u32 vm_id;
> > > +
> > > +	/** @flags: MBZ */
> > > +	__u32 flags;
> > > +
> > > +	/** @engine_id: Returned engine ID */
> > > +	__u32 engine_id;
> > > +
> > > +	/**
> > > +	 * @instances: user pointer to a 2-d array of struct
> > > +	 * drm_xe_engine_class_instance
> > > +	 *
> > > +	 * length =3D width (i) * num_placements (j)
> > > +	 * index =3D j + i * width
> > > +	 */
> > > +	__u64 instances;
> > > +
> > > +	/** @reserved: Reserved */
> > > +	__u64 reserved[2];
> > > +};
> > > +
> > > +struct drm_xe_engine_get_property {
> > > +	/** @extensions: Pointer to the first extension struct, if any */
> > > +	__u64 extensions;
> > > +
> > > +	/** @engine_id: Engine ID */
> > > +	__u32 engine_id;
> > > +
> > > +#define XE_ENGINE_GET_PROPERTY_BAN			0
> > > +	/** @property: property to get */
> > > +	__u32 property;
> > > +
> > > +	/** @value: property value */
> > > +	__u64 value;
> > > +
> > > +	/** @reserved: Reserved */
> > > +	__u64 reserved[2];
> > > +};
> > > +
> > > +struct drm_xe_engine_destroy {
> > > +	/** @engine_id: Engine ID */
> > > +	__u32 engine_id;
> > > +
> > > +	/** @pad: MBZ */
> > > +	__u32 pad;
> > > +
> > > +	/** @reserved: Reserved */
> > > +	__u64 reserved[2];
> > > +};
> > > +
> > > +struct drm_xe_sync {
> > > +	/** @extensions: Pointer to the first extension struct, if any */
> > > +	__u64 extensions;
> > > +
> > > +#define DRM_XE_SYNC_SYNCOBJ		0x0
> > > +#define DRM_XE_SYNC_TIMELINE_SYNCOBJ	0x1
> > > +#define DRM_XE_SYNC_DMA_BUF		0x2
> > > +#define DRM_XE_SYNC_USER_FENCE		0x3
> > > +#define DRM_XE_SYNC_SIGNAL		0x10
> > > +	__u32 flags;
> > > +
> > > +	/** @pad: MBZ */
> > > +	__u32 pad;
> > > +
> > > +	union {
> > > +		__u32 handle;
> > > +
> > > +		/**
> > > +		 * @addr: Address of user fence. When sync passed in via exec
> > > +		 * IOCTL this a GPU address in the VM. When sync passed in via
> > > +		 * VM bind IOCTL this is a user pointer. In either case, it is
> > > +		 * the users responsibility that this address is present and
> > > +		 * mapped when the user fence is signalled. Must be qword
> > > +		 * aligned.
> > > +		 */
> > > +		__u64 addr;
> > > +	};
> > > +
> > > +	__u64 timeline_value;
> > > +
> > > +	/** @reserved: Reserved */
> > > +	__u64 reserved[2];
> > > +};
> > > +
> > > +struct drm_xe_exec {
> > > +	/** @extensions: Pointer to the first extension struct, if any */
> > > +	__u64 extensions;
> > > +
> > > +	/** @vm_id: VM ID to run batch buffer in */
> > > +	__u32 engine_id;
> > > +
> > > +	/** @num_syncs: Amount of struct drm_xe_sync in array. */
> > > +	__u32 num_syncs;
> > > +
> > > +	/** @syncs: Pointer to struct drm_xe_sync array. */
> > > +	__u64 syncs;
> > > +
> > > +	/**
> > > +	 * @address: address of batch buffer if num_batch_buffer =3D=3D 1 o=
r an
> > > +	 * array of batch buffer addresses
> > > +	 */
> > > +	__u64 address;
> > > +
> > > +	/**
> > > +	 * @num_batch_buffer: number of batch buffer in this exec, must mat=
ch
> > > +	 * the width of the engine
> > > +	 */
> > > +	__u16 num_batch_buffer;
> > > +
> > > +	/** @pad: MBZ */
> > > +	__u16 pad[3];
> > > +
> > > +	/** @reserved: Reserved */
> > > +	__u64 reserved[2];
> > > +};
> > > +
> > > +struct drm_xe_mmio {
> > > +	/** @extensions: Pointer to the first extension struct, if any */
> > > +	__u64 extensions;
> > > +
> > > +	__u32 addr;
> > > +
> > > +#define DRM_XE_MMIO_8BIT	0x0
> > > +#define DRM_XE_MMIO_16BIT	0x1
> > > +#define DRM_XE_MMIO_32BIT	0x2
> > > +#define DRM_XE_MMIO_64BIT	0x3
> > > +#define DRM_XE_MMIO_BITS_MASK	0x3
> > > +#define DRM_XE_MMIO_READ	0x4
> > > +#define DRM_XE_MMIO_WRITE	0x8
> > > +	__u32 flags;
> > > +
> > > +	__u64 value;
> > > +
> > > +	/** @reserved: Reserved */
> > > +	__u64 reserved[2];
> > > +};
> > > +
> > > +/**
> > > + * struct drm_xe_wait_user_fence - wait user fence
> > > + *
> > > + * Wait on user fence, XE will wakeup on every HW engine interrupt i=
n the
> > > + * instances list and check if user fence is complete::
> > > + *
> > > + *	(*addr & MASK) OP (VALUE & MASK)
> > > + *
> > > + * Returns to user on user fence completion or timeout.
> > > + */
> > > +struct drm_xe_wait_user_fence {
> > > +	/** @extensions: Pointer to the first extension struct, if any */
> > > +	__u64 extensions;
> > > +
> > > +	union {
> > > +		/**
> > > +		 * @addr: user pointer address to wait on, must qword aligned
> > > +		 */
> > > +		__u64 addr;
> > > +
> > > +		/**
> > > +		 * @vm_id: The ID of the VM which encounter an error used with
> > > +		 * DRM_XE_UFENCE_WAIT_VM_ERROR. Upper 32 bits must be
> > > clear.
> > > +		 */
> > > +		__u64 vm_id;
> > > +	};
> > > +
> > > +#define DRM_XE_UFENCE_WAIT_EQ	0
> > > +#define DRM_XE_UFENCE_WAIT_NEQ	1
> > > +#define DRM_XE_UFENCE_WAIT_GT	2
> > > +#define DRM_XE_UFENCE_WAIT_GTE	3
> > > +#define DRM_XE_UFENCE_WAIT_LT	4
> > > +#define DRM_XE_UFENCE_WAIT_LTE	5
> > > +	/** @op: wait operation (type of comparison) */
> > > +	__u16 op;
> > > +
> > > +#define DRM_XE_UFENCE_WAIT_SOFT_OP	(1 << 0)	/* e.g. Wait on
> VM bind
> > > */
> > > +#define DRM_XE_UFENCE_WAIT_ABSTIME	(1 << 1)
> > > +#define DRM_XE_UFENCE_WAIT_VM_ERROR	(1 << 2)
> > > +	/** @flags: wait flags */
> > > +	__u16 flags;
> > > +
> > > +	/** @pad: MBZ */
> > > +	__u32 pad;
> > > +
> > > +	/** @value: compare value */
> > > +	__u64 value;
> > > +
> > > +#define DRM_XE_UFENCE_WAIT_U8		0xffu
> > > +#define DRM_XE_UFENCE_WAIT_U16		0xffffu
> > > +#define DRM_XE_UFENCE_WAIT_U32		0xffffffffu
> > > +#define DRM_XE_UFENCE_WAIT_U64		0xffffffffffffffffu
> > > +	/** @mask: comparison mask */
> > > +	__u64 mask;
> > > +	/**
> > > +	 * @timeout: how long to wait before bailing, value in nanoseconds.
> > > +	 * Without DRM_XE_UFENCE_WAIT_ABSTIME flag set (relative timeout)
> > > +	 * it contains timeout expressed in nanoseconds to wait (fence will
> > > +	 * expire at now() + timeout).
> > > +	 * When DRM_XE_UFENCE_WAIT_ABSTIME flat is set (absolute timeout)
> > > wait
> > > +	 * will end at timeout (uses system MONOTONIC_CLOCK).
> > > +	 * Passing negative timeout leads to neverending wait.
> > > +	 *
> > > +	 * On relative timeout this value is updated with timeout left
> > > +	 * (for restarting the call in case of signal delivery).
> > > +	 * On absolute timeout this value stays intact (restarted call stil=
l
> > > +	 * expire at the same point of time).
> > > +	 */
> > > +	__s64 timeout;
> > > +
> > > +	/**
> > > +	 * @num_engines: number of engine instances to wait on, must be zer=
o
> > > +	 * when DRM_XE_UFENCE_WAIT_SOFT_OP set
> > > +	 */
> > > +	__u64 num_engines;
> > > +
> > > +	/**
> > > +	 * @instances: user pointer to array of drm_xe_engine_class_instanc=
e to
> > > +	 * wait on, must be NULL when DRM_XE_UFENCE_WAIT_SOFT_OP set
> > > +	 */
> > > +	__u64 instances;
> > > +
> > > +	/** @reserved: Reserved */
> > > +	__u64 reserved[2];
> > > +};
> > > +
> > > +struct drm_xe_vm_madvise {
> > > +	/** @extensions: Pointer to the first extension struct, if any */
> > > +	__u64 extensions;
> > > +
> > > +	/** @vm_id: The ID VM in which the VMA exists */
> > > +	__u32 vm_id;
> > > +
> > > +	/** @pad: MBZ */
> > > +	__u32 pad;
> > > +
> > > +	/** @range: Number of bytes in the VMA */
> > > +	__u64 range;
> > > +
> > > +	/** @addr: Address of the VMA to operation on */
> > > +	__u64 addr;
> > > +
> > > +	/*
> > > +	 * Setting the preferred location will trigger a migrate of the VMA
> > > +	 * backing store to new location if the backing store is already
> > > +	 * allocated.
> > > +	 *
> > > +	 * For DRM_XE_VM_MADVISE_PREFERRED_MEM_CLASS usage, see
> > > enum
> > > +	 * drm_xe_memory_class.
> > > +	 */
> > > +#define DRM_XE_VM_MADVISE_PREFERRED_MEM_CLASS	0
> > > +#define DRM_XE_VM_MADVISE_PREFERRED_GT		1
> > > +	/*
> > > +	 * In this case lower 32 bits are mem class, upper 32 are GT.
> > > +	 * Combination provides a single IOCTL plus migrate VMA to preferre=
d
> > > +	 * location.
> > > +	 */
> > > +#define DRM_XE_VM_MADVISE_PREFERRED_MEM_CLASS_GT	2
> > > +	/*
> > > +	 * The CPU will do atomic memory operations to this VMA. Must be se=
t
> > > on
> > > +	 * some devices for atomics to behave correctly.
> > > +	 */
> > > +#define DRM_XE_VM_MADVISE_CPU_ATOMIC		3
> > > +	/*
> > > +	 * The device will do atomic memory operations to this VMA. Must be=
 set
> > > +	 * on some devices for atomics to behave correctly.
> > > +	 */
> > > +#define DRM_XE_VM_MADVISE_DEVICE_ATOMIC		4
> > > +	/*
> > > +	 * Priority WRT to eviction (moving from preferred memory location =
due
> > > +	 * to memory pressure). The lower the priority, the more likely to =
be
> > > +	 * evicted.
> > > +	 */
>=20
> Hi Oak,
>=20
> Thanks for your reviews and comments here...
>=20
> >
> > Making ATOMIC as a madvise caused some problem. Atomic should be a hard
> requirement, not a hint, because atomic has correctness implication.
> Hint/madvise is best effort. Even if we can't meet the requirement of a h=
int, it
> won't cause any correctness problem. For example, one some device, when w=
e
> mark an allocation as DEVICE_ATOMIC, driver will HAVE to guarantee the ba=
cking
> store of the allocation is in device as device can't perform atomic opera=
tions to
> system memory across PCIe on such device.
> >
> > So we should remove the MADVISE verb from above definition, such as:
> >
> > +#define DRM_XE_VM_SET_DEVICE_ATOMIC		4
>=20
> I don't quite get this suggestion since this doesn't align
> with the madvise_func call. So, should we kill that function
> and make this a VM property? in such case, what would this
> property do?


In struct xe_bo, we already have a properties for atomics, such as device_a=
tomic, cpu_atomic. This is good. What I was saying above is, the function t=
o set the device_atomic property should not be a madvise function. The pref=
erred_gt, _priority etc can be a madvise function, but the device_atomic ca=
n't be set through the xe_vm_madvise_ioctl function, due the reason I expla=
ined above. It would be better we introduce some set_property ioctl to set =
the atomic property of xe_bo.


>=20
> >
> > Also, besides CPU_ATOMIC and DEVICE_ATOMIC, we should also define
> SYSTEM_ATOMIC which means both CPU and device can perform atomics to such
> allocation. This definition is better aligned with the new L0 specificati=
on, see:
> https://spec.oneapi.io/level-
> zero/latest/core/api.html#ze__api_8h_1a020717d3d1d0f52f645226b7ffd4552b.
> The old version of the L0 specification is https://spec.oneapi.io/level-
> zero/latest/core/api.html#ze-memory-advice-t, which is similar to your
> definitions above (having the word ADVICE).
> >
> > HOST_ATOMIC seems a little bit better name than CPU_ATOMIC, to pair wit=
h
> DEVICE_ATOMIC.
>=20
> Could you please open up on your proposal for the proper alignment?
>=20
> I just created https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/739
> so we don't lose track of it.

Ok, I will follow up on gitlab then.

Thanks,
Oak
>=20
> Thanks,
> Rodrigo.
>=20
> >
> > Thanks,
> > Oak
> >
> > > +#define DRM_XE_VM_MADVISE_PRIORITY		5
> > > +#define		DRM_XE_VMA_PRIORITY_LOW		0
> > > +#define		DRM_XE_VMA_PRIORITY_NORMAL	1	/* Default
> > > */
> > > +#define		DRM_XE_VMA_PRIORITY_HIGH	2	/* Must
> > > be elevated user */
> > > +	/* Pin the VMA in memory, must be elevated user */
> > > +#define DRM_XE_VM_MADVISE_PIN			6
> > > +	/** @property: property to set */
> > > +	__u32 property;
> > > +
> > > +	/** @pad2: MBZ */
> > > +	__u32 pad2;
> > > +
> > > +	/** @value: property value */
> > > +	__u64 value;
> > > +
> > > +	/** @reserved: Reserved */
> > > +	__u64 reserved[2];
> > > +};
> > > +
> > > +#if defined(__cplusplus)
> > > +}
> > > +#endif
> > > +
> > > +#endif /* _UAPI_XE_DRM_H_ */
> > > --
> > > 2.40.1
> >
