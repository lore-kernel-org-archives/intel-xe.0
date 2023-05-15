Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF66EC77B7D
	for <intel-xe@archiver.kernel.org>; Mon, 15 May 2023 06:34:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F5E510E138;
	Mon, 15 May 2023 06:34:22 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F56310E133
 for <intel-xe@lists.freedesktop.org>; Mon, 15 May 2023 06:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684132460; x=1715668460;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=zxTuuqmpoCb4EA97+DdbBHWKfoOQ3YNPvquPTP5r9b8=;
 b=UpDnqWg+ClSN4FbEljJsKphJuYpUdPDXtH2y1PJFO3d3H1l6Qdc+8Dfe
 HZ77jM5ZxVZFpAdyBZXvXrqoOvdyMRi+4i+IolXbFEs3xFLJrTdYbbvSo
 oHo0REp4SrmA62+axL/1a5hAl0C4W6iF1VDDuwK9tVrtSXy6zwIPZmiWt
 BkQtAgBbO8bLLmF1fZLaMxP0YuFHGUnKpdWJpqb32e9EzB+BCaI/273AC
 OtbzZXhDFV0WTzVl5lOGAZNMdowixmt80+13SrpPaQZbg9An0jLlTzzdP
 /t5cdkyeeSyVxZY0ZAFXcc/i+xVY6bRfLcqbVL9Zxgq7+A1KYyaygj4oX w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10710"; a="330742448"
X-IronPort-AV: E=Sophos;i="5.99,275,1677571200"; d="scan'208";a="330742448"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2023 23:34:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10710"; a="731519156"
X-IronPort-AV: E=Sophos;i="5.99,275,1677571200"; d="scan'208";a="731519156"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga008.jf.intel.com with ESMTP; 14 May 2023 23:34:19 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Sun, 14 May 2023 23:34:18 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Sun, 14 May 2023 23:34:18 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.172)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Sun, 14 May 2023 23:34:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N99eVAPTWhnuqwreucCI+iSPDF3lxnmxQRwAHgNVU+eS2BH90RlEuMUntwpMwb0eJNMiupckxE0Q0AmKMMP9cM/VQ+rfy/vEkgE6NOVMA1biIRc/OcxCmS6HPcMY7e58x02xaxpqJk5WBZeUshwoJm+aIpLvqaU3OzFBQCuN846tBTigUwPav0jHHRbbK42bepcdOtakltr/sI4B8hoA1mBKVtE34RgtVR+p6o6w9CIfDpkP8WBbL2sg9m4o1AsamS8QCM88Ls3K5kY2SblYNrUimTgEaG0MLRPMen+976SJ+ChXWE7o4DlelUxIRWW1fjwVqvRWmC3o8/H269QPzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9VmkV4pviPqMjMJiJmWJ5Vf5Og7ahDJ9fMZiCZ2X5g0=;
 b=B5Pu3QHGoINOk1klvzLyp8Dv9hp8PmbJyUXwVew9Ui8QuTJ1dLywor7HQ1GtYvft00j4wRWNy7/IJ76XTNXgSSneS8cPoeKYJ81jUiZ63ktzIhjMtrcXmCbNDS7fvQ+lzu9/STGBMqhkcM5t1SBElF+ZHs6AlVLPNrgmaQm+kro2SdSdtKguWI/Eqo3hC732TkSyBwc+foF+3tf6zfUdBjzxpb6dAhLsh3mrx7B6IsHj/0Dh/k6Y/ERqZmhOSoAZjdXPjGc+t8/oFvVUDAl+7JmUWFvereE2QVcPwr25ZF9BGzFB2ZOkoNu2wsS6UKsBfq2UD/Uw6E1Rbu0vH4cElg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6211.namprd11.prod.outlook.com (2603:10b6:930:25::6)
 by PH7PR11MB6794.namprd11.prod.outlook.com (2603:10b6:510:1b8::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.27; Mon, 15 May
 2023 06:34:12 +0000
Received: from CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::3cc2:6622:cce5:cd02]) by CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::3cc2:6622:cce5:cd02%3]) with mapi id 15.20.6387.030; Mon, 15 May 2023
 06:34:12 +0000
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@kernel.org>,
 =?iso-8859-1?Q?Thomas_Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Thread-Topic: [Intel-xe] [RFC] drm/xe/pm: d3cold policy
Thread-Index: AQHZhLWmfbMTwcA0CEKTvj0AtEg82K9WnY6AgAAMBoCABDggMA==
Date: Mon, 15 May 2023 06:34:11 +0000
Message-ID: <CY5PR11MB621122C90ED5A967E5F2133395789@CY5PR11MB6211.namprd11.prod.outlook.com>
References: <20230512093632.2988909-1-anshuman.gupta@intel.com>
 <6fe0d5352a52b6ca19c370d1fc3a4eabd6aa3826.camel@linux.intel.com>
 <ZF5FbiNj8D8U6RLF@rdvivi-mobl4>
In-Reply-To: <ZF5FbiNj8D8U6RLF@rdvivi-mobl4>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6211:EE_|PH7PR11MB6794:EE_
x-ms-office365-filtering-correlation-id: 41a4b197-a8ef-4f23-1260-08db550e6526
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lLpQYaPeJ8Lb7zNLGaCu19aMumqxurLR5xLyaEdLfyDJRIRk/3+YOTsQGMmySiU4b1aIwhKHXXS8UAKgrmP3lbFeqdWXwTcMKANFGgGhFaU/g1s0Zo05aaz2xAjA0/qMlnkSy51Yx0bO1La+TCJPI3n1KA37eAvVjfqY1KPMLvo5TaOBBnXNS4jr7uvM+zr0XvOtPXU5K+LuHh7TLZBk7KnqHkRMAB58Ixgnjp1nHNIFleWSZ6h7FmuFnFUhMkjkD9S6WnqpuwJibw48keyUVhGqop5ZeOZWqz9rkQY+AYhf6ZXI0rbVcQX0KskjMOnioROh2/o21RGggiAFwD4Kg7McY+mmHYH7BbYRZRJ/rGDfiAi3q9nbFB9OjB8tGO0BNoz23VcEctMS9rFGD13tLMnJjONBxX9cwRBidtbXaO/yVPLT3MvNuyX68hXg3xUJJ+NbSpGTEtwQCoVeABcFxjYqCjvkWYAwhAwIomPX63LfbjpQ0rSsV2MTm0P6pgjJWq1EAoV4HR3RsoUlAwMKhlLztxRa0w2vzHZStoNsAsBNG6IlWuq0M65eFWvxEHQ7QeB3+ABU/hHszOAWOIdnIE0GxxquRYvl7pkyl1yB0TFWs3SzhTls3FS8sXQt4seDzEGyUDZu+CQ1uJdI770zw6/OCTrwB/WLRf4xbnPAwko=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6211.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(136003)(396003)(39860400002)(346002)(366004)(451199021)(110136005)(54906003)(86362001)(478600001)(55016003)(186003)(53546011)(9686003)(6506007)(26005)(7696005)(33656002)(71200400001)(122000001)(316002)(38100700002)(41300700001)(76116006)(64756008)(66556008)(66476007)(66946007)(66446008)(4326008)(82960400001)(66574015)(52536014)(5660300002)(38070700005)(83380400001)(2906002)(8936002)(8676002)(42413004)(32563001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?gwC905Jw3DvmxEsMbcvhhqiHu0wiEcergbMnIjRZqbWPx5bKsMS04A7B53?=
 =?iso-8859-1?Q?g5erdTYnZivOAbaCEBp0AvvhipcOGsYKrFbCsl778DoATiR1SbI7vEYwy3?=
 =?iso-8859-1?Q?3QTdXdsNq4jvtyX0giNKL3qljtUg5OvoxT3ZRc2glftC72ps5f3c/yNzbI?=
 =?iso-8859-1?Q?tmqZJ2K5zjMouqt+muLFMGXDNjwsWneiHZ37edHUjPCC1GmTANiHngN3V/?=
 =?iso-8859-1?Q?R9RiVeMcfF700/LU8FkFY02nNpLAvK3i9HgzIAFLREjBcVMDM4xJlFo8qK?=
 =?iso-8859-1?Q?LMSyohHWLe2JkEJBD/dEqDEnJ26d7EjfDxtVElr3HNsChKYTTdhcj1KW7u?=
 =?iso-8859-1?Q?p3K16w4IRNhnEHRuPS0/eXpyFHsd+ElfW3ghthVVuI64FV6jwnSO4cJPw7?=
 =?iso-8859-1?Q?St2NdvMSIDPETfjg1DB5VOjxbTioSdJ9OM2NunJ6FbBeib2XMeP3r/C24U?=
 =?iso-8859-1?Q?MalEvzZ5/qClAlQ/6Usi+NTVfcdc5G7a84T4g+wbNS0mQG9FwX5j0Oo8b3?=
 =?iso-8859-1?Q?5Dg3H375e87ZLg/PZSoYRoAr2e7R1cOZ93FMkbqgSd33wmwwHPNuZxqzuW?=
 =?iso-8859-1?Q?khEc6zoi8Uz4fDaIO9xK85v/S7P8jZoZ0ajQPDaCmyrBGZCgp6yFsNk9l2?=
 =?iso-8859-1?Q?BbFvZESTS2nNH93BC8JqgEuwnSsQLEbV0V2DmEVUrrGz/Efhar29DxyxpT?=
 =?iso-8859-1?Q?VedLcaT7El/gqVHabNBeWcjCgSzly/20waT2SdpCDenKvytZxH0ud8Inhc?=
 =?iso-8859-1?Q?vMi18W20dkkvpJVdLB/lb3GljKToxNQEiuLgqsSIsFZw9j6e+WvVSSpL3E?=
 =?iso-8859-1?Q?nuhLe9FELalT6eM021K5ZnRwyVvtyQ39RWp39ogVR+eSmysaJpLtLFJITh?=
 =?iso-8859-1?Q?yHPP9eOGO4oE6/ydYhdogup0ekafdwiEe9TLebF/QIwBQ1EDmop1uJ4zAy?=
 =?iso-8859-1?Q?aMTbo63mHfNw4OSZume1KMn96P43B9rUAoxn0ZludRrrFJagfgvkMhiItw?=
 =?iso-8859-1?Q?sF2AFZ8uWpM5Lp/BvnjlyiXF2ST7ccqt7vpRue+vwVT02NS+zDY1UzlEyK?=
 =?iso-8859-1?Q?tlniYXW4AkTigQlBAt8C+VbzTArMBsx3V/VWvK3rIjgiP6JY0g6d56FOCc?=
 =?iso-8859-1?Q?FjfuAYOSPZEKte/yjpuGtSpJW2tGLoxnevPggUMMjqwPAz2+EAW3RMEaUj?=
 =?iso-8859-1?Q?QI1LPk4imnwduPdV2zmAih5gJFycr3riVeOpvfoETL62odrgpzmTpXVmKw?=
 =?iso-8859-1?Q?5igqno6uOSSb8x4cfjgitQ0ighD0moR0WAo3RvOdazr0jo1oM/ppaMSVzr?=
 =?iso-8859-1?Q?YkLAb0jgFCLLya+btBg+Zi8VF6ebQWA7zJlo20kCeybzr7fAkuqFjtxkBo?=
 =?iso-8859-1?Q?iuY18Kr/N+lgB/PG7shrFc3jLxD3bU9ar+P8dVMXTjJSQCAFXZIY8tzbVa?=
 =?iso-8859-1?Q?gPoRFuCyML8Y+UNew30uKlVPodAaOGyvXKSd2NUzGco+FhEC1UaR3herGP?=
 =?iso-8859-1?Q?9YiylrNNYQosGeOlPm3llug1/MCc5LjfcBeRJA/KvdscihG0a5tUZcSqkK?=
 =?iso-8859-1?Q?hBHV1QauNQlNFGCb9J5RXp5YeUDRT44qUHA+a8BkgWKlAhsYhACuFW/o7Q?=
 =?iso-8859-1?Q?G/QqX0yXTe+c6B9GAWml/+bQY4ruy92vjh?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6211.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41a4b197-a8ef-4f23-1260-08db550e6526
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2023 06:34:11.7729 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +8kaHvdZKfJTEQn03QDrdTeQGSF3WvS2JQPyf0OM7VT+pFFP3Dwq6ljZRtxsTvt/kiEMDPb9g13TSFRPdW+jBigvIz506yqXFU6KAf+zr94=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6794
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [RFC] drm/xe/pm: d3cold policy
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Vivi, 
 Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Rodrigo Vivi <rodrigo.vivi@kernel.org>
> Sent: Friday, May 12, 2023 7:26 PM
> To: Thomas Hellstr=F6m <thomas.hellstrom@linux.intel.com>
> Cc: Gupta, Anshuman <anshuman.gupta@intel.com>; intel-
> xe@lists.freedesktop.org; Vivi, Rodrigo <rodrigo.vivi@intel.com>
> Subject: Re: [Intel-xe] [RFC] drm/xe/pm: d3cold policy
>=20
> On Fri, May 12, 2023 at 03:13:05PM +0200, Thomas Hellstr=F6m wrote:
> > On Fri, 2023-05-12 at 15:06 +0530, Anshuman Gupta wrote:
> > > Adding pci d3cold capable check support.
> > > Adding a vram_save_restore_threshold modparam, that is the
> >
> > Please use imperative language as per the Linux patch-submission
> > guidelines.
> >
> > "Add pci d3cold capable check support."
> >
> > Typos:
> > > permissisble threshold for vram save/restore. If vram used
> > permissible
> > > is more then
> > more than
> > >  the threshold value then disabllow
> > disallow
> > >  the d3cold
> > > to avoid the vram save/restore latency.
> > >
> > > TODO: At resume vram save/restore only in case card really lost
> > > power.
> > >
> > > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> > > ---
> > > =A0drivers/gpu/drm/xe/xe_device_types.h |=A0 3 ++
> > > =A0drivers/gpu/drm/xe/xe_module.c=A0=A0=A0=A0=A0=A0 |=A0 4 +++
> > > =A0drivers/gpu/drm/xe/xe_module.h=A0=A0=A0=A0=A0=A0 |=A0 1 +
> > > =A0drivers/gpu/drm/xe/xe_pci.c=A0=A0=A0=A0=A0=A0=A0=A0=A0 | 46
> > > ++++++++++++++++++++++++++++
> > > =A0drivers/gpu/drm/xe/xe_pm.c=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 | 20 ++++=
++++++++
> > > =A0drivers/gpu/drm/xe/xe_pm.h=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0 1 +
> > > =A06 files changed, 75 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/xe/xe_device_types.h
> > > b/drivers/gpu/drm/xe/xe_device_types.h
> > > index 1cb404e48aaa..1137f544575d 100644
> > > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > > @@ -263,6 +263,9 @@ struct xe_device {
> > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0bool hold_rpm;
> > > =A0=A0=A0=A0=A0=A0=A0=A0} mem_access;
> > >
> > > +=A0=A0=A0=A0=A0=A0=A0/** d3cold_capable: Indicates if root port is d=
3cold capable
> > > */
> > > +=A0=A0=A0=A0=A0=A0=A0bool d3cold_capable;
> > > +
> > > =A0=A0=A0=A0=A0=A0=A0=A0/** @d3cold_allowed: Indicates if d3cold is a=
 valid device
> > > state */
> > > =A0=A0=A0=A0=A0=A0=A0=A0bool d3cold_allowed;
> > >
> > > diff --git a/drivers/gpu/drm/xe/xe_module.c
> > > b/drivers/gpu/drm/xe/xe_module.c index 6860586ce7f8..1dd515ed8a65
> > > 100644
> > > --- a/drivers/gpu/drm/xe/xe_module.c
> > > +++ b/drivers/gpu/drm/xe/xe_module.c
> > > @@ -26,6 +26,10 @@ u32 xe_force_vram_bar_size;
> > > =A0module_param_named(vram_bar_size, xe_force_vram_bar_size, uint,
> > > 0600);
> > > =A0MODULE_PARM_DESC(vram_bar_size, "Set the vram bar size(in MiB)");
> > >
> > > +u32 xe_vram_save_restore_threshold =3D 300;
> > > +module_param_named(vram_save_restore_threshold,
> > > xe_vram_save_restore_threshold, uint, 0600);
> > > +MODULE_PARM_DESC(vram_save_restore_threshold, "Set the vram
> used
> > > threshold below which vram save/restore premissible (in MB)");
> >
> > With one-driver-multiple-devices, Would we want to use this as the
> > default template and then have an interface to set it per-device?
>=20
> probably a good idea. to have a sysfs per device.
> and sysfs only appears if d3cold is ever possible and supported.
I have some doubts over handling of sysfs.
AFAIU this modparam is per pci device.
What are we referring here as per device ?=20
Is it multiple tiles ?
d3cold is state a for a pci device, so "vram_used" metric has to be account=
 all vram=20
instances in a gpu card, so sysfs for this parameter should be linked to pc=
i device under=20
/sys/bus/pci/devices/$bdf=20
directory ?

Thanks ,
Anshuman Gupta.
>=20
> >
> > Thanks,
> > Thomas
> >
> >
> >
> > > +
> > > =A0int xe_guc_log_level =3D 5;
> > > =A0module_param_named(guc_log_level, xe_guc_log_level, int, 0600);
> > > =A0MODULE_PARM_DESC(guc_log_level, "GuC firmware logging level
> > > (0=3Ddisable, 1..5=3Denable with verbosity min..max)"); diff --git
> > > a/drivers/gpu/drm/xe/xe_module.h
> b/drivers/gpu/drm/xe/xe_module.h
> > > index 7169907c3365..620d1b80cab6 100644
> > > --- a/drivers/gpu/drm/xe/xe_module.h
> > > +++ b/drivers/gpu/drm/xe/xe_module.h
> > > @@ -9,5 +9,6 @@
> > > =A0extern bool enable_guc;
> > > =A0extern bool enable_display;
> > > =A0extern u32 xe_force_vram_bar_size;
> > > +extern u32 xe_vram_save_restore_threshold;
> > > =A0extern int xe_guc_log_level;
> > > =A0extern char *xe_param_force_probe;
> > > diff --git a/drivers/gpu/drm/xe/xe_pci.c
> > > b/drivers/gpu/drm/xe/xe_pci.c index ee61a03d1afd..2c86a8ab727a
> > > 100644
> > > --- a/drivers/gpu/drm/xe/xe_pci.c
> > > +++ b/drivers/gpu/drm/xe/xe_pci.c
> > > @@ -592,6 +592,40 @@ static void
> > > xe_pci_unbounded_bridge_disable_pm(struct pci_dev *pdev)
> > > =A0=A0=A0=A0=A0=A0=A0=A0}
> > > =A0}
> > >
> > > +static bool xe_pci_d3cold_capable(struct pci_dev *pdev) {
> > > +=A0=A0=A0=A0=A0=A0=A0struct pci_dev *root_pdev;
> > > +
> > > +=A0=A0=A0=A0=A0=A0=A0root_pdev =3D pcie_find_root_port(pdev);
> > > +=A0=A0=A0=A0=A0=A0=A0if (!root_pdev)
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0return false;
> > > +
> > > +=A0=A0=A0=A0=A0=A0=A0/* D3Cold requires PME capability and _PR3 powe=
r resource */
> > > +=A0=A0=A0=A0=A0=A0=A0if (!pci_pme_capable(root_pdev, PCI_D3cold) ||
> > > !pci_pr3_present(root_pdev))
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0return false;
> > > +
> > > +=A0=A0=A0=A0=A0=A0=A0return true;
> > > +}
> > > +
> > > +static void xe_pci_d3cold_enable_disable(struct pci_dev *pdev, bool
> > > enable)
> > > +{
> > > +=A0=A0=A0=A0=A0=A0=A0struct xe_device *xe =3D pdev_to_xe_device(pdev=
);
> > > +=A0=A0=A0=A0=A0=A0=A0struct pci_dev *root_pdev;
> > > +
> > > +=A0=A0=A0=A0=A0=A0=A0if (!xe->d3cold_capable)
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0return;
> > > +
> > > +=A0=A0=A0=A0=A0=A0=A0root_pdev =3D pcie_find_root_port(pdev);
> > > +=A0=A0=A0=A0=A0=A0=A0if (!root_pdev)
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0return;
> > > +
> > > +=A0=A0=A0=A0=A0=A0=A0if (enable)
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0pci_d3cold_enable(pdev)=
;
> > > +=A0=A0=A0=A0=A0=A0=A0else
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0pci_d3cold_disable(pdev=
);
> > > +
> > > +}
> > > +
> > > =A0static int xe_pci_probe(struct pci_dev *pdev, const struct
> > > pci_device_id *ent)
> > > =A0{
> > > =A0=A0=A0=A0=A0=A0=A0=A0const struct xe_device_desc *desc =3D (const =
void *)ent-
> > > >driver_data;
> > > @@ -669,6 +703,8 @@ static int xe_pci_probe(struct pci_dev *pdev,
> > > const struct pci_device_id *ent)
> > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0return err;
> > > =A0=A0=A0=A0=A0=A0=A0=A0}
> > >
> > > +=A0=A0=A0=A0=A0=A0=A0xe->d3cold_capable =3D xe_pci_d3cold_capable(pd=
ev);
> > > +
> > > =A0=A0=A0=A0=A0=A0=A0=A0xe_pm_runtime_init(xe);
> > >
> > > =A0=A0=A0=A0=A0=A0=A0=A0return 0;
> > > @@ -741,6 +777,7 @@ static int xe_pci_runtime_suspend(struct device
> > > *dev)
> > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0pci_set_power_state(p=
dev, PCI_D3cold);
> > > =A0=A0=A0=A0=A0=A0=A0=A0} else {
> > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0pci_set_power_state(p=
dev, PCI_D3hot);
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0xe_pci_d3cold_enable_di=
sable(pdev, false);
> > > =A0=A0=A0=A0=A0=A0=A0=A0}
> > >
> > > =A0=A0=A0=A0=A0=A0=A0=A0return 0;
> > > @@ -764,6 +801,8 @@ static int xe_pci_runtime_resume(struct device
> > > *dev)
> > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0return err;
> > >
> > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0pci_set_master(pdev);
> > > +=A0=A0=A0=A0=A0=A0=A0} else {
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0xe_pci_d3cold_enable_di=
sable(pdev, true);
> > > =A0=A0=A0=A0=A0=A0=A0=A0}
> > >
> > > =A0=A0=A0=A0=A0=A0=A0=A0return xe_pm_runtime_resume(xe); @@ -774,6 +8=
13,13 @@ static
> > > int xe_pci_runtime_idle(struct device
> > > *dev)
> > > =A0=A0=A0=A0=A0=A0=A0=A0struct pci_dev *pdev =3D to_pci_dev(dev);
> > > =A0=A0=A0=A0=A0=A0=A0=A0struct xe_device *xe =3D pdev_to_xe_device(pd=
ev);
> > >
> > > +=A0=A0=A0=A0=A0=A0=A0if (!xe->d3cold_capable) {
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0xe->d3cold_allowed =3D =
false;
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0return 0;
> > > +=A0=A0=A0=A0=A0=A0=A0}
> > > +
> > > +=A0=A0=A0=A0=A0=A0=A0xe->d3cold_allowed =3D xe_pm_vram_d3cold_allowe=
d(xe);
> > > +
> > > =A0=A0=A0=A0=A0=A0=A0=A0/*
> > > =A0=A0=A0=A0=A0=A0=A0=A0 * TODO: d3cold should be allowed (true) if
> > > =A0=A0=A0=A0=A0=A0=A0=A0 * (IS_DGFX(xe) && !xe_device_mem_access_ongo=
ing(xe))
> > > diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> > > index b7b57f10ba25..523d5f89ec89 100644
> > > --- a/drivers/gpu/drm/xe/xe_pm.c
> > > +++ b/drivers/gpu/drm/xe/xe_pm.c
> > > @@ -16,6 +16,7 @@
> > > =A0#include "xe_ggtt.h"
> > > =A0#include "xe_gt.h"
> > > =A0#include "xe_irq.h"
> > > +#include "xe_module.h"
> > > =A0#include "xe_pcode.h"
> > >
> > > =A0/**
> > > @@ -117,6 +118,25 @@ int xe_pm_resume(struct xe_device *xe)
> > > =A0=A0=A0=A0=A0=A0=A0=A0return 0;
> > > =A0}
> > >
> > > +bool xe_pm_vram_d3cold_allowed(struct xe_device *xe) {
> > > +=A0=A0=A0=A0=A0=A0=A0struct ttm_resource_manager *man;
> > > +=A0=A0=A0=A0=A0=A0=A0u64 vram_used;
> > > +=A0=A0=A0=A0=A0=A0=A0size_t total_vram_used_mb =3D 0;
> > > +=A0=A0=A0=A0=A0=A0=A0int i;
> > > +
> > > +=A0=A0=A0=A0=A0=A0=A0/* TODO: Extend the logic to beyond XE_PL_VRAM1=
 */
> > > +=A0=A0=A0=A0=A0=A0=A0for (i =3D XE_PL_VRAM0; i <=3D XE_PL_VRAM1; ++i=
) {
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0man =3D ttm_manager_typ=
e(&xe->ttm, i);
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0if (man) {
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0vram_used =3D ttm_resource_manager_usage(man);
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0total_vram_used_mb +=3D
> > > DIV_ROUND_UP_ULL(vram_used, 1024 * 1024);
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0}
> > > +=A0=A0=A0=A0=A0=A0=A0}
> > > +
> > > +=A0=A0=A0=A0=A0=A0=A0return total_vram_used_mb < xe_vram_save_restor=
e_threshold;
> > > +}
> > > +
> > > =A0void xe_pm_runtime_init(struct xe_device *xe)
> > > =A0{
> > > =A0=A0=A0=A0=A0=A0=A0=A0struct device *dev =3D xe->drm.dev; diff --gi=
t
> > > a/drivers/gpu/drm/xe/xe_pm.h b/drivers/gpu/drm/xe/xe_pm.h index
> > > 6a885585f653..33515d5c2cc2 100644
> > > --- a/drivers/gpu/drm/xe/xe_pm.h
> > > +++ b/drivers/gpu/drm/xe/xe_pm.h
> > > @@ -17,6 +17,7 @@ void xe_pm_runtime_init(struct xe_device *xe);
> > > =A0void xe_pm_runtime_fini(struct xe_device *xe);
> > > =A0int xe_pm_runtime_suspend(struct xe_device *xe);
> > > =A0int xe_pm_runtime_resume(struct xe_device *xe);
> > > +bool xe_pm_vram_d3cold_allowed(struct xe_device *xe);
> > > =A0int xe_pm_runtime_get(struct xe_device *xe);
> > > =A0int xe_pm_runtime_put(struct xe_device *xe);
> > > =A0bool xe_pm_runtime_resume_if_suspended(struct xe_device *xe);
> >
