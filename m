Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6403BCDB46E
	for <intel-xe@archiver.kernel.org>; Thu, 12 Oct 2023 09:11:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C79710E46E;
	Thu, 12 Oct 2023 09:11:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67BD210E46E
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Oct 2023 09:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697101886; x=1728637886;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=5aNu9NwQ+oaD0j4nk2eqf+Lr2INtONHttiKgoHv5Hkk=;
 b=b5OgF97VjDb8naeNgVGpCnELvZp2+hl6rguQAx6p3BUa1H5AXbfPKc9P
 NbdXrso6AEj/+mHIt7jWABcYkodBI3A9UttGwtCjzopOMDJfnSdOlc9Lw
 8mSYfKmrblLtnyrAqq7/kZGy/1KLmbn8Sbrk5Sn21T+EcwGCgDmE0T5f+
 C79VOYnUaIc//TZ0Hdt6M+sCde+drvc4UIUQcoqHvryoJbS3xoFgEI4JO
 kYr6lUZmnxlBW0zG/3JARyoFne6OZ8VGflp0Fl/lzfw7d5Y6h6/5tcPgZ
 NePwjGcR4NtqSDYiQ/fd5hImV0sfMlQQW48NcQSRXKsekl1KWsVfS2EIH A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="369937190"
X-IronPort-AV: E=Sophos;i="6.03,218,1694761200"; d="scan'208";a="369937190"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2023 02:11:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="898010552"
X-IronPort-AV: E=Sophos;i="6.03,218,1694761200"; d="scan'208";a="898010552"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Oct 2023 02:09:13 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 12 Oct 2023 02:11:00 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 12 Oct 2023 02:11:00 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 12 Oct 2023 02:11:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XK2ddRCBrlovzbbMUlAZsba8dtpc5XLkcl3Rt8Ebd68i4kDOBwi9RjW7CdH2uiE04ZiDFs5yW1Y2SMTM5fJK7LbDHijTCsnGaRwQJNXMlIDN21RliXZV8/T3wsUmuyUV2A8GiI3KrHGdnAf5vrRzwtp3Nrdtn+p73eqAnc1bSxIy3kW/UtbflYWYEO2x0m3oHCtIViMlDs4/qnRJ+06R8L5cOTkYndr3oeFakbTCd2L+MvaH1cWuBUnj+8XL/+7FM+1Yhyc0lvHrEZnR6KueBcVtD8WKCx/lkA6tuWdeOfLQOgTvJa0iTyU/srRq+tTV4vjHyIN52TXcwkqIQryKag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HRwBnKzWP5FUxghsUDkYuQFTmIns5J/MnotD2o7Ba3I=;
 b=UQC/5CEBnQTjC3CXsKtvSlJY1TFgubA5azD1nj2iYXUMQxXSCwfNbRbcpizrXKKgVKvctWaljirO0BCCmz4Ut48wAZcskD/AoxaYeMneWpYmBDXszphMXY00F4tvDe831sfIqhw2tMiJR66H1pPKQ+9F7q9Ap1mhxP3d0WKzkJ/HdcdtMBE5f0QLn1f8QUbYzoOCEJJ/C6HBWKex/MPTuSjdmfRnrXaJWS2MoXS+QizzSWZc6gpuBG2sLuEBpwGboa93wGMoVKJf6PL9ea9/Om/UPmCWbJg9SObq6cTN2WiWebdD3dlr6Ejb0fO5DiEyTbR44SXyJ2TEq//EnBWsWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB3177.namprd11.prod.outlook.com (2603:10b6:5:c::28) by
 MW4PR11MB5935.namprd11.prod.outlook.com (2603:10b6:303:18a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.38; Thu, 12 Oct
 2023 09:10:58 +0000
Received: from DM6PR11MB3177.namprd11.prod.outlook.com
 ([fe80::55a3:7967:f63d:b76b]) by DM6PR11MB3177.namprd11.prod.outlook.com
 ([fe80::55a3:7967:f63d:b76b%5]) with mapi id 15.20.6863.043; Thu, 12 Oct 2023
 09:10:58 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: "Nikula, Jani" <jani.nikula@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "Shankar, Uma" <uma.shankar@intel.com>
Thread-Topic: [PATCH 1/2] drm/i915: Remove the module parameter 'fastboot'
Thread-Index: AQHZ/On8uXG3qtv7kkSjKDrAWSIY3rBF3QMAgAAAXjA=
Date: Thu, 12 Oct 2023 09:10:58 +0000
Message-ID: <DM6PR11MB317724F933FEF643A1CCAFE1BAD3A@DM6PR11MB3177.namprd11.prod.outlook.com>
References: <20230924144751.446446-1-arun.r.murthy@intel.com>
 <20231012084707.1254386-1-arun.r.murthy@intel.com> <87ttqw2orf.fsf@intel.com>
In-Reply-To: <87ttqw2orf.fsf@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR11MB3177:EE_|MW4PR11MB5935:EE_
x-ms-office365-filtering-correlation-id: a8d7631d-c195-4e18-3064-08dbcb03262a
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZfQhiCRWBkhYv5yCYGDKkfs2JsauXXT/BKPHDImiMXhFUrU24SvrRz132a6VeffufoJga47hClXDVK2I0+G7wpI93z2WlzP442sGUn7TDT6hLGHUJsqsQygEYSHER7WAi9YoPEAjNAl0pKxfzcdMh6iFpVvKG4sgF8IlRNKz04CQEs2A4JsNKsgI2NWDwbei+qdyHcpoW5aYo9ToE2Xv2qfw8Dfh5Pqhxlxex/qy39Jg6wYkIWBrJoEygXMiMVIzR94snmYwpU0P7fyfnrRtze9P6bZCkaJozyVpQGI+3d9JlNGC28A8hiWgfO4DWxs7Nh5tJuc6lSqI/t2EEbo/zqK+3s7w+m7t6DkvuIoNGlHHDhzDOb/U1VzfOHfOUxKnhWvjOMprA89hrs+BmfhgNrvX0OodpcrE2lwyY4xBcUbojn82CkQTB3feRu+Kzam8jg+FLIeWSGlxihiB4hAiCds1lsUhYzdj6/xrHNANrJdvD51Be9SDXvYWyA6/CgTBi25kKtncNl6jJLk+S2QcqojdRFmlB3QwRTU2kP4dU4IFiudMTNVuOD+QNgxhNFtmBXED/Ne51Db23TyMiNoMC7vX/ZB3YdaHdXEkjIoFTCY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB3177.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(396003)(346002)(136003)(366004)(39860400002)(230922051799003)(186009)(64100799003)(1800799009)(451199024)(33656002)(9686003)(53546011)(55236004)(6506007)(7696005)(966005)(71200400001)(66946007)(2906002)(83380400001)(8676002)(66476007)(64756008)(66556008)(76116006)(5660300002)(110136005)(66446008)(52536014)(8936002)(6636002)(41300700001)(316002)(86362001)(82960400001)(478600001)(122000001)(55016003)(38070700005)(38100700002)(26005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?dmEcnG2lVHef2og8SVI+eSeBuqDdEj9oRkUf25NR2ajxH62sElf7LgqlFGN+?=
 =?us-ascii?Q?9d5jcFxnT+N76YmEMYTm1GomYUgSxweZGoF3c/yMGvBuVJ0oB2grDFf+ngmL?=
 =?us-ascii?Q?DJUr3Cjs2KzrNKxTktXdpouvroIoq4voLokjcexActSaAqQecIhciQbsfm9Y?=
 =?us-ascii?Q?4Id8r/qh+5pv14KU2B0t4bPpFILrI3+vTZDG9gctBRbD37FkEgolOkxJEFpV?=
 =?us-ascii?Q?df5RQGSWjakEI+5uyMXE7gysj9BeYO43jItXPzEmwIBSAKKdmay4h89Ocj22?=
 =?us-ascii?Q?xjaocdqYqxr14dWoDS5m2obkJWpIZsi23p8Pf8sJXQ2Yr3YorTCWeaJ0cqIw?=
 =?us-ascii?Q?FDKGYvlkikhIPKUKuvGeat97KnrTG3ihNcPJd2S0VEKwhTyd0qbS0MLjIhoa?=
 =?us-ascii?Q?c4OzdDJhTOnUyrEFrfUwq2mxlRrLEEYpWX+SbhazFIoCcaW6SkQ86RFuCGT/?=
 =?us-ascii?Q?BpOBZz+SWDMOFC+W6yz/gXKprUVLp29GCiJjBU8fTZ1opee9zB5CXvDQYv8T?=
 =?us-ascii?Q?gMqUz1NBT1W0Ij8Iyu+R+6EDfXSEMACGmpubcUfzeFq7dSJifJh0O+PHc/dF?=
 =?us-ascii?Q?x5RcHU7H7u/eVak80FE6FssqZjyo3fis5S6ZXIUfQahxeNNcL8cAXDQiZUrW?=
 =?us-ascii?Q?YGXWb2T538PRYmPmOVAcUQCVsphs2YEjtuH9ewHCmCQrudTrAHJi/0ysQAxl?=
 =?us-ascii?Q?F3GKS4AyN26k+dSc+9/8zVvVVz5rsh7mBXq2+qZ2Ucy+3qqS7cU9ky10M+Z0?=
 =?us-ascii?Q?/MO9cMKrt34EH7tMQio6+QsIiC/3YrFPJyVJf8Z3OeH05mSvvy20uCa2tT+X?=
 =?us-ascii?Q?91QnhiaHJtkHahoaGZYiJtx0ph71HQNEsOs4iO2/2q/zZHvoWX15xZYa+iOY?=
 =?us-ascii?Q?VOxN7WP9Kd4GUSN4ZyzR+ejwUwpqblY7TfRMoBV5yGs9YWOw+F4EgFP6HIeD?=
 =?us-ascii?Q?0aa9pg8R/sGwFZszdn6G1D6Jk50gSZXpQ+lcdTg8IAwCl2kW5RyBjpY7pLE0?=
 =?us-ascii?Q?rCHr5lzID6mpWML5pCM3LIL887cwy3IkT8//ZZjv9d6nP9AIn9dxOOAwVCeL?=
 =?us-ascii?Q?Ih5lOmdurZfka8FivCUwXs2GTM6C0Qo/g6ScgEWghp+vfOP0sRbkSby6pCpD?=
 =?us-ascii?Q?cHv/ZdN+VDgHl8Chk6CDXONnjQc17C3OE+c7oAZxDZupcNAI7wztrTWEVcOb?=
 =?us-ascii?Q?v+TJAoc5AbFqqrI8w2zzQpO5t60B+dqoFKcKB5CW25JRIzb98MXEKYSBbJLz?=
 =?us-ascii?Q?vM3NtBcaAnSsbjElZZuozaLXCrADvAMo9z2W7tmD6UzJiKn8GsUGtep5ra6O?=
 =?us-ascii?Q?4Id59TcuH0SPm/RwfgbhgYhZVXaU+0uCPnPm6FSz0ThIM//YJ7pDOWGVnZGu?=
 =?us-ascii?Q?i5Eubj2HaBUBfIP3MqsqWoYrEpipm2DiZ3E87Kldsb4ORywBnTDgC7h5su8M?=
 =?us-ascii?Q?IiMec6LPTRJAoVlUHcWAwuguD92xmSEmro3uQRU8Nm1jv+hzSDZ9tv7tnJnf?=
 =?us-ascii?Q?JhRQK5sHH9eNT1cUifKUe3ZTygvnWUnZwh2goU1gQcncRWEzbMTeJARMGzMc?=
 =?us-ascii?Q?0fDVLTqY0H1hjajMx4H3B01OdOl8cyyEARjpYPRx?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3177.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8d7631d-c195-4e18-3064-08dbcb03262a
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2023 09:10:58.8482 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8m92RELeZrXHgRyqzebIYpLkvCFzTxoKhbG5/ujKdTDGf0xlF4wRNTd1DdM+Sru6fa56IE/bItEA74r6TztYBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5935
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/2] drm/i915: Remove the module parameter
 'fastboot'
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
> From: Nikula, Jani <jani.nikula@intel.com>
> Sent: Thursday, October 12, 2023 2:37 PM
> To: Murthy, Arun R <arun.r.murthy@intel.com>; intel-xe@lists.freedesktop.=
org;
> Shankar, Uma <uma.shankar@intel.com>
> Cc: Murthy, Arun R <arun.r.murthy@intel.com>
> Subject: Re: [PATCH 1/2] drm/i915: Remove the module parameter 'fastboot'
>=20
> On Thu, 12 Oct 2023, Arun R Murthy <arun.r.murthy@intel.com> wrote:
> > By default fastboot is enabled on all Display 9+ platforms and
> > disabled on older platforms. Its not necessary to retain this as a
> > module parameter.
> >
> > Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
> > Link:
> > https://patchwork.freedesktop.org/patch/msgid/20230926091157.635438-1-
> > arun.r.murthy@intel.com (cherry picked from commit
> > 58883680a8416661b48a800e5530e2efcea64a4a
> > ---
> >  drivers/gpu/drm/i915/display/intel_display.c | 3 ---
> >  drivers/gpu/drm/i915/i915_params.c           | 5 -----
> >  drivers/gpu/drm/i915/i915_params.h           | 1 -
> >  3 files changed, 9 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/i915/display/intel_display.c
> > b/drivers/gpu/drm/i915/display/intel_display.c
> > index 4b73db93d23d..748e9a42e94f 100644
> > --- a/drivers/gpu/drm/i915/display/intel_display.c
> > +++ b/drivers/gpu/drm/i915/display/intel_display.c
> > @@ -4989,9 +4989,6 @@ pipe_config_mismatch(bool fastset, const struct
> > intel_crtc *crtc,  static bool fastboot_enabled(struct
> > drm_i915_private *dev_priv)  {  #ifdef I915
> > -	if (dev_priv->params.fastboot !=3D -1)
> > -		return dev_priv->params.fastboot;
> > -
>=20
> Sorry, you've got the patch order wrong. You've had to modify the backpor=
t
> which is evident from the context.
>=20
> The revert goes first and the backport next. When the original patch and =
its
> revert get rebased away, the backport will still be intact. With this ord=
er, you
> get conflicts every step of the way, and have to be fixed, and still risk=
 deviating
> from the upstream commit.

I was assuming that if the revert goes first then that would break the buil=
d.
Hence though of removing that variable first and then revert thereby each
individual patch builds are not broken.
Anyway will get it done this way.

>=20
> Also, please post new revisions of patch series as new threads. The repli=
es to
> threads gets confusing to both humans and CI.

In order to retain the history used in-reply-to. Will push as a new series.

Thanks and Regards,
Arun R Murthy
--------------------
>=20
> BR,
> Jani.
>=20
>=20
> >  	/* Enable fastboot by default on Skylake and newer */
> >  	if (DISPLAY_VER(dev_priv) >=3D 9)
> >  		return true;
> > diff --git a/drivers/gpu/drm/i915/i915_params.c
> > b/drivers/gpu/drm/i915/i915_params.c
> > index 0a171b57fd8f..036c4c3ed6ed 100644
> > --- a/drivers/gpu/drm/i915/i915_params.c
> > +++ b/drivers/gpu/drm/i915/i915_params.c
> > @@ -137,11 +137,6 @@ i915_param_named_unsafe(enable_ips, int, 0400,
> > "Enable IPS (default: true)");  i915_param_named_unsafe(enable_dpt, boo=
l,
> 0400,
> >  	"Enable display page table (DPT) (default: true)");
> >
> > -i915_param_named(fastboot, int, 0400,
> > -	"Try to skip unnecessary mode sets at boot time "
> > -	"(0=3Ddisabled, 1=3Denabled) "
> > -	"Default: -1 (use per-chip default)");
> > -
> >  i915_param_named_unsafe(load_detect_test, bool, 0400,
> >  	"Force-enable the VGA load detect code for testing (default:false). "
> >  	"For developers only.");
> > diff --git a/drivers/gpu/drm/i915/i915_params.h
> > b/drivers/gpu/drm/i915/i915_params.h
> > index 68abf0ad6c00..d5194b039aab 100644
> > --- a/drivers/gpu/drm/i915/i915_params.h
> > +++ b/drivers/gpu/drm/i915/i915_params.h
> > @@ -72,7 +72,6 @@ struct drm_printer;
> >  	param(int, edp_vswing, 0, 0400) \
> >  	param(unsigned int, reset, 3, 0600) \
> >  	param(unsigned int, inject_probe_failure, 0, 0) \
> > -	param(int, fastboot, -1, 0600) \
> >  	param(int, enable_dpcd_backlight, -1, 0600) \
> >  	param(char *, force_probe, CONFIG_DRM_I915_FORCE_PROBE, 0400) \
> >  	param(unsigned int, request_timeout_ms,
> > CONFIG_DRM_I915_REQUEST_TIMEOUT,
> CONFIG_DRM_I915_REQUEST_TIMEOUT ?
> > 0600 : 0) \
>=20
> --
> Jani Nikula, Intel
