Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C3DFC04AAC
	for <intel-xe@archiver.kernel.org>; Thu, 21 Sep 2023 12:00:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2631410E5E8;
	Thu, 21 Sep 2023 12:00:26 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DA1810E5E6
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Sep 2023 12:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695297624; x=1726833624;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=RANsyjQ4Zd55M6DvZTM/Dz9HCFaVYMB9T73jv+Ga6x0=;
 b=UmjjJ8GUxAKI0y0Ie1pN95Xxt7pXR3UMBMEjq3As6ZQF4v0E5LtX3uyp
 e6+C098iL0wE5Ie556RJUd8cJ8czqXFakPxwRuXbMS7fWsozPNmD9OjLV
 fIazRBhKerh4ku1lMYa9p+z4Qmahs7dHa4hQglRlvxfBVp5cOK7drQaFB
 x2Ym52iweONqGmjSt3ixU13DYpSGl2nueBGIh9iTxLpOYu3lsF4/ATbfI
 14uqL4pahWehD6iuy00/4acZMqv0DhkoWYmj2acoZb/OCXHLy0+2sRn3Q
 hQ64MF+uwBdgolipB4CWSkvEdKgeF+57lHqgn6GMV7SHXyGCPMvpoXP31 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="379384191"
X-IronPort-AV: E=Sophos;i="6.03,165,1694761200"; d="scan'208";a="379384191"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2023 05:00:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="750365718"
X-IronPort-AV: E=Sophos;i="6.03,165,1694761200"; d="scan'208";a="750365718"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Sep 2023 05:00:14 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 21 Sep 2023 05:00:14 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 21 Sep 2023 05:00:14 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 21 Sep 2023 05:00:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LTIc/5IxEVEqij12jF8gXALKj6wuXXS4cNPO9cq8gl99mn76PZIF8aE9as8gtprr3H6zPgB9MCMpKMbErz94hig+mUSefZqxpxUpVrvFtk6hh9fZvDjx+gBLktlDvuyRrSlvd2i2zdQ4QIemj5SIsnO8aHVguPfegf+DdY9eLDQZevZbCSkSsOZXiElmLcIH1LHobUEmNXZQCFeAm+/DTGly7l53hlruIxUvfgBjm0G7MR0HehkpsPNnT96QQNA4InTbsTmXDumWNc2SzJR/G1iCEonk7vcXx30w6lT2vh2ujnpV3GmwMLJHpyqXihEjP25UHfenwqAhgrHcGXf7Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZEIh3gMEvuSf1Ir2AinJIoeKqFiarzGQ5K+gk12tZxI=;
 b=YbIpWP9X0kdO5hhJY6sxlrZ88slWK8Pl5lZJUVim0V2u1r8dDBFqHkDP9x1RCyLy+7F205mGEs/WYIy8vub7bt0QQNoRi4ccg4+Yup/bMGJxXEM/BdUvE6rj0wh/yERYdBi0ThQQwRoSlpZ0wJnL2uZtqtRtc3dpBuWv8S7SGQdHkEcT1Ew11M4oe7nNHiRf3tgm1xqwOYrcW/QKb9K47UnCenkvbHPtcADJUTeB28JD9zTM97BduD4xkphKb8twMZvWs6A9tJ4qdMfXTwaF8jeLMxsEWqEmlWTrRCUMqsD3WRecSPVoYMX8n36p1WH59iAdm+34Ij7p3NjraV1Rpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6360.namprd11.prod.outlook.com (2603:10b6:8:bd::12) by
 CH0PR11MB5561.namprd11.prod.outlook.com (2603:10b6:610:d4::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6813.21; Thu, 21 Sep 2023 12:00:12 +0000
Received: from DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::42bc:8d57:e26f:ecd4]) by DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::42bc:8d57:e26f:ecd4%3]) with mapi id 15.20.6813.017; Thu, 21 Sep 2023
 12:00:12 +0000
From: "Shankar, Uma" <uma.shankar@intel.com>
To: "Nikula, Jani" <jani.nikula@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "ville.syrjala@linux.intel.com"
 <ville.syrjala@linux.intel.com>
Thread-Topic: [PATCH 2/3] drm/xe: Add wrapper function for VGA decode setup
Thread-Index: AQHZ6lXdhnR6bAnnAkuRArVea0TjA7Ah8+MAgAGA5iCAAAtZgIAAKIYwgAGDi1A=
Date: Thu, 21 Sep 2023 12:00:11 +0000
Message-ID: <DM4PR11MB6360951259D4C7F75BF1BAEAF4F8A@DM4PR11MB6360.namprd11.prod.outlook.com>
References: <20230918173711.625930-1-uma.shankar@intel.com>
 <20230918173711.625930-3-uma.shankar@intel.com> <87h6nqtpzb.fsf@intel.com>
 <DM4PR11MB63600D5DCF025595B46C98B9F4F9A@DM4PR11MB6360.namprd11.prod.outlook.com>
 <878r91rwbm.fsf@intel.com>
 <DM4PR11MB6360E6B0DAAF5EADCB0BAA31F4F9A@DM4PR11MB6360.namprd11.prod.outlook.com>
In-Reply-To: <DM4PR11MB6360E6B0DAAF5EADCB0BAA31F4F9A@DM4PR11MB6360.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6360:EE_|CH0PR11MB5561:EE_
x-ms-office365-filtering-correlation-id: 1f5a2e38-12ed-40c8-f34d-08dbba9a4f37
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: k20H7pbG6qZGync8UVLwxT9Wx1oP1OuMjFLHdN2V5TRcARJmuT8vobJEE4I5YzGIzjgl1tROaIvR6x7gNoyv+zbI/GW05ZdePNdgPTUaw8deuXG/S9qeMyYrLm4b6S93ALLRta+MPv+pEhHE/Fpsk5Ek4/AjFH2vrUiC0yUuHczB4gScih6A5hLLYlqOf1/U8k9C1skptcp8VeGC/rlwPuX7MRRp08wdLNaz1prMQ87hNpvREvkmZYmV0o5w2FOk+Pxue4SfhE2YeX2AwRNFxo/oVuSxYiioDU/TkXPd1Lp3ADJSOfQMwGvaEY6toKBeQm1aLF8VSCkuD4oMP7tCNmzmtKjlG0S6jHWXHQmFBORrSqaHzwEmQLEnpi+6PMnSFYqN3L2b1Jnx9Q40845VzCZJcc48iz/XWHDSz/wXbixJ8i9RgWamd5OfE9Goy3QpWbk623IE04NvypHlT+EY7F6ev4/EXRl6VHLs8BRTCiNsddmNUXtM9EUB3FAmeiXMCkC/ovZXkU/Mi/W/ZKdh+RsMh2H+uDHMfm8TPGGONYHmbkdJIvAUnSi76SDq6m79FE/jBBpmF/3SXm837x2oarIt27gkcfzwW0XikZlzC1U=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6360.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(366004)(136003)(396003)(39860400002)(376002)(451199024)(186009)(1800799009)(52536014)(5660300002)(2906002)(66899024)(4326008)(38070700005)(38100700002)(41300700001)(8936002)(8676002)(110136005)(82960400001)(316002)(66946007)(76116006)(66446008)(66476007)(66556008)(64756008)(33656002)(86362001)(55016003)(26005)(83380400001)(9686003)(53546011)(71200400001)(6506007)(7696005)(478600001)(122000001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Hy6Q3Z+r2voSz2WuBemezFUJ72MzuQXiQfufUDZOLy+9G8OQjFTJhWIk+Mhr?=
 =?us-ascii?Q?kD1u3x1YAOuh3l9qEtKrC1TAikL8UuqP+oqDUWvvVQInDwevteTJpOUtaAA3?=
 =?us-ascii?Q?LxQCOljosR8A+Oou/aiW4nUFD3MDAo9cv2u80uvD62IV/cPcZJPscKJoTMDg?=
 =?us-ascii?Q?ZLCdhGzfhBM8kGWkAI6eSITrdLh5PGonoCGezJZQJdRmKijFbxPmwfHtR1UN?=
 =?us-ascii?Q?myJF1wln7sIIYtngWKH8pLPz14c9h/Kiimmvtuw5/qylhjBCYUm+pROQvPiU?=
 =?us-ascii?Q?1VhnfmntFOKonsJNHputL81teyV2O6kSJuUm1vyeJBVsLEkJUGLyD6X6J2O4?=
 =?us-ascii?Q?twdBSEAL1sv5CGQ96ciI0ByKjwXSiRK7qxRqNChku/HTR8xkUxg5X9ujwVMF?=
 =?us-ascii?Q?m7VkritQhJGNC2lc1Jhw6id/lNPMNLuWgkWbPPbVhcWrvjHjHqpbJYY5fHwJ?=
 =?us-ascii?Q?odnZ7tlKndk7dEFWoggsgYw5arLB0If4kfrcTyin1fqe7j9BQzuhfHbYUDdT?=
 =?us-ascii?Q?8CrDmhae/c2wKB/DLhzxJxYwODJO+9UJDcksyvSYVk7uwn0dFPyGpg1Ik0mo?=
 =?us-ascii?Q?wwinLxSjXBbXYjiR8DclCi/n5Dptzn8xmSfWXe/EGhMrCh3ktHfBlY1MOUh9?=
 =?us-ascii?Q?krkX47KFrwjvA5hHgITPQPXPabBnyihNvwkaEbbU8bOilFSe+//+p4Bc2wof?=
 =?us-ascii?Q?bv00EgbIN0/3iN5v/X5e+QuMwbm8acjw8KP5clfUed+nmbOMBXuxX6/5nHBs?=
 =?us-ascii?Q?q3Wf2j1zzeie9fqY44/yV9aNYeCroypnMFjUhCedlP1U9XMhFSNh5p9HwRqk?=
 =?us-ascii?Q?FG6t6b4cp9wl+UIweBEJ/AJxaGpSYNqDI0Mw2LkbioeX1EIEf6kOhpb/5D/K?=
 =?us-ascii?Q?Fc+esSIUyE9Qbbd3myvfgoFjtSCDuerUYe6C55+Eax4wKsqNCgUcpy0uBpMH?=
 =?us-ascii?Q?R56T+hdntad+LlTElAG5HiWC/Wz8MZSm59IdR4/nSSw5jw6xy/N23qhGmGC0?=
 =?us-ascii?Q?Bv+Po2pkQqz7SBtJVUWNqCgfSppk62yjLRL/0XBpuoDmHg2iiz22w91AmfLL?=
 =?us-ascii?Q?w/8hA5fLeIBSHf2PAZCpz7Wu2GQVig+Ovo4WGLPPUobepiCbOqBu5q3Moho0?=
 =?us-ascii?Q?FAKKCrbneog6EkYv5L5qGDC9Ycxti8XGfEXDzH1WwXMklNy7rV8u9zygOzpt?=
 =?us-ascii?Q?t5v/wxJhQ2OFf9tr+eB8hssUjkLyeppqNlugHehL9Z0vibUoWExtoTPnkWSs?=
 =?us-ascii?Q?AVv36j4Pq/Xl/wiRAaCW+OnUnvKEYoLviLb+qrNU05wn7kqH/VMyfu2nZr2p?=
 =?us-ascii?Q?+AfkcQDVJUAIbfC8TW1nDyUMfHWS6lv+uOd9GeuMeb1wI8tKeNIegsyGgkeO?=
 =?us-ascii?Q?93vONH3MVNAIq7eHYDk1vHvUf9N1uvim6waqUKzBYXQN42xfEApIJ/Sa9kKr?=
 =?us-ascii?Q?NW0jDvhG5eaaAiQFOigGMUQXfzduD4Ekzy8am1R5jOhMBTXH/4TBaIje8XF9?=
 =?us-ascii?Q?3qkQLpUGffCrZTu2bebJybMrTnHCk5lXDCn2rdZpjvXtOPKDIjjtWtnKTjlN?=
 =?us-ascii?Q?qy2e7AwpKzFCtbyNZCEYpF8wUBTvgKWux1+QlmAP?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6360.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f5a2e38-12ed-40c8-f34d-08dbba9a4f37
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Sep 2023 12:00:11.8600 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: r8Nse60rH2baOFU5qzUa1QtT+hrR0jnHD1piW5W9EsPBBj33DcR4mDyn5aaZiB28eZWSKl8BmJKy6U0t2qwAUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5561
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/3] drm/xe: Add wrapper function for VGA
 decode setup
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
> From: Shankar, Uma
> Sent: Wednesday, September 20, 2023 6:09 PM
> To: Nikula, Jani <jani.nikula@intel.com>; intel-xe@lists.freedesktop.org;
> ville.syrjala@linux.intel.com
> Cc: Borah, Chaitanya Kumar <chaitanya.kumar.borah@intel.com>
> Subject: RE: [PATCH 2/3] drm/xe: Add wrapper function for VGA decode setu=
p
>=20
>=20
>=20
> > -----Original Message-----
> > From: Nikula, Jani <jani.nikula@intel.com>
> > Sent: Wednesday, September 20, 2023 3:38 PM
> > To: Shankar, Uma <uma.shankar@intel.com>;
> > intel-xe@lists.freedesktop.org
> > Cc: Borah, Chaitanya Kumar <chaitanya.kumar.borah@intel.com>
> > Subject: RE: [PATCH 2/3] drm/xe: Add wrapper function for VGA decode
> > setup
> >
> > On Wed, 20 Sep 2023, "Shankar, Uma" <uma.shankar@intel.com> wrote:
> > >> -----Original Message-----
> > >> From: Nikula, Jani <jani.nikula@intel.com>
> > >> Sent: Tuesday, September 19, 2023 4:00 PM
> > >> To: Shankar, Uma <uma.shankar@intel.com>;
> > >> intel-xe@lists.freedesktop.org
> > >> Cc: Borah, Chaitanya Kumar <chaitanya.kumar.borah@intel.com>;
> > >> Shankar, Uma <uma.shankar@intel.com>
> > >> Subject: Re: [PATCH 2/3] drm/xe: Add wrapper function for VGA
> > >> decode setup
> > >>
> > >> On Mon, 18 Sep 2023, Uma Shankar <uma.shankar@intel.com> wrote:
> > >> > Some of the VGA functionality is not needed by the Intel Xe driver=
.
> > >> > Adding a wrapper function for VGA decode setup.
> > >> >
> > >> > Signed-off-by: Uma Shankar <uma.shankar@intel.com>
> > >> > ---
> > >> >  drivers/gpu/drm/xe/display/ext/i915_utils.c | 5 +++++
> > >> >  drivers/gpu/drm/xe/xe_display.h             | 1 +
> > >> >  2 files changed, 6 insertions(+)
> > >> >
> > >> > diff --git a/drivers/gpu/drm/xe/display/ext/i915_utils.c
> > >> > b/drivers/gpu/drm/xe/display/ext/i915_utils.c
> > >> > index 981edc2788bc..aa3e9ad718c3 100644
> > >> > --- a/drivers/gpu/drm/xe/display/ext/i915_utils.c
> > >> > +++ b/drivers/gpu/drm/xe/display/ext/i915_utils.c
> > >> > @@ -20,3 +20,8 @@ int __i915_inject_probe_error(struct
> > >> > drm_i915_private *i915, int err,  {
> > >> >     return 0;
> > >> >  }
> > >> > +
> > >> > +unsigned int intel_gmch_vga_set_decode(struct pci_dev *pdev,
> > >> > +bool
> > >> > +enable_decode) {
> > >> > +   return -EIO;
> > >> > +}
> > >>
> > >> We don't really want to add anything new to i915_utils.c. It's just
> > >> temporary cruft that had to be taken from i915 to make the rest comp=
ile.
> > >
> > > Hi Jani,
> > > Thanks for the feedback.
> > >
> > > I was looking at any good place to stack it together. There are some
> > > misc stuff like this which we may need for some other stuff as well.
> > > Should I add a xe_disp_misc file for this or any other suggestion on
> > > file which
> > we can use.
> >
> > Let's take a step back, though.
> >
> > Why is this call needed on i915 but not on xe?
>=20
> Ideally it should be needed even here. Not sure on the exact usage though=
, the
> GMCHGraphicsControl is there on current platforms as well. Trying to gath=
er
> some info to get clarity.
>=20
> @ville.syrjala@linux.intel.com Do you know how critical this is or can we=
 defer its
> enabling and add support later directly in upstream.

Hi Jani,
Tried to check this and it seems Xe is managing this per tile and doing it =
at tile initialization (xe_tile_init_noalloc)
So, we should need this for Xe separately. Hope my understanding is correct=
.

Regards,
Uma Shankar

> > BR,
> > Jani.
> >
> >
> > >
> > > Regards,
> > > Uma Shankar
> > >
> > >> > diff --git a/drivers/gpu/drm/xe/xe_display.h
> > >> > b/drivers/gpu/drm/xe/xe_display.h index
> > >> > 03b7ea9268d4..d7a200e6ec30
> > >> > 100644
> > >> > --- a/drivers/gpu/drm/xe/xe_display.h
> > >> > +++ b/drivers/gpu/drm/xe/xe_display.h
> > >> > @@ -38,6 +38,7 @@ void xe_display_pm_suspend(struct xe_device
> > >> > *xe); void xe_display_pm_suspend_late(struct xe_device *xe);
> > >> > void xe_display_pm_resume_early(struct xe_device *xe);  void
> > >> > xe_display_pm_resume(struct xe_device *xe);
> > >> > +unsigned int intel_gmch_vga_set_decode(struct pci_dev *pdev,
> > >> > +bool enable_decode);
> > >>
> > >> We also don't want to add random declarations in xe_display.h either=
...
> > >
> > > Yeah, looking deeper seems we don't need it as compat-header is
> > > already
> > including the same.
> > > Will drop this declaration.
> > >
> > > Regards,
> > > Uma Shankar
> > >
> > >> BR,
> > >> Jani.
> > >>
> > >> >
> > >> >  #else
> > >>
> > >> --
> > >> Jani Nikula, Intel
> >
> > --
> > Jani Nikula, Intel
