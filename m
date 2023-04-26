Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7BEFC77B78
	for <intel-xe@archiver.kernel.org>; Wed, 26 Apr 2023 12:14:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95EA810E2F0;
	Wed, 26 Apr 2023 12:14:35 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFBBC10E2F0
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Apr 2023 12:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682511273; x=1714047273;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=iRuZsYsff4UPuLrVxROMZwaugsg44Awo2u6Wzu3pFZo=;
 b=h09NQQGchIuYvjUTMFAOGGXCZyB8+fWRTOwFjLe0Frt1LCaNAP5kAhAK
 Mb+s+7TJBkJ7H4dAsxf9eeRUncXXSVx3IsUd2u3Ofp8IODCfSrNXNHQxv
 FvL3rr/rSk3VTRapYVqXzE1MsN++C3UIvjGsIZvbShJVNGL6/QtE7sxXZ
 UUxdPdjIhnPuEq2qI9+4EqssZ6/0AzTTJbauYzH9vuaknXbLfANwMxrkN
 kroDlhjhdSEn7n8YmKnKdK6Q7e2GbTjFJiBgqCmuXM52u42Ni77NXpVfX
 fNM+Pj50+7Im5llqqIJqcON9mJ1pIdt94MMFoybWsScWEJcO3+s8UoobU w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10691"; a="326689310"
X-IronPort-AV: E=Sophos;i="5.99,228,1677571200"; d="scan'208";a="326689310"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2023 05:14:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10691"; a="726505390"
X-IronPort-AV: E=Sophos;i="5.99,228,1677571200"; d="scan'208";a="726505390"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga001.jf.intel.com with ESMTP; 26 Apr 2023 05:14:32 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 26 Apr 2023 05:14:32 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 26 Apr 2023 05:14:32 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 26 Apr 2023 05:14:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P0lkaUa55yUdaFiBh0qs2hi6M5s9ZHbh2VfXNlo0RuP0qHF+0SwtVZ1X8ymA4w6dYs0u1RqI1zAOZGZGHe4GRv2u3zKAfuqJLSfGFWSEJE/Qywk+AP1EpFfZnVgi0dj0p9xHBkMbU8CkgOEYB51QK3gVcGehUp+bnH7IHhX7pmS7y0mJevUx1mgndG4OjcKWkqNMuJfMp3FtBR4fMDudlsWzWi9gRzk4xzW3mfeZmr7At8pBIgtgoCHp/WNTwyrbtyL1MXZUQJTcyvAqMo+RepKLWFC0CHrXX700lD1Cze8JTw1N6cHs51s+BHlJ/wv041BfBm+77/gQOXcxcjWjKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GNiTvA8ohKY0+EgDMiNKmzrXi3w7Zg6rHiVWs+q39yU=;
 b=BdFTpjGCLlH1B8W1fOpqjK9uiw3Vmi66XeHVii8dFOtm9my7REjmFTYncwyjA2iJSvBirF0A0cRYO+qi9jFz9TxeXIA8gewnVxBZkNuP6nibwlEU+Q1FPIwvPg4vmHZc2GiZ16gdT2BaxOrY6cSsP41bro68pX9XtaFHOM98ffTzrmgB524YhDBwhxlQ+ZzOfTFRDaQA79HT14OBa/ISLCIdXRQx3CjSjpJQiJodZCfLKUmiUZgl8eSfDVBdGKn/VLX4WsViq0Teg3zLYzBE3jMTc2JAGqitBeZJYXpmKXsyBSPnk2sxrlMjnUqtTpNyTK76iBqT8PzVqvVy4D6viA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB7038.namprd11.prod.outlook.com (2603:10b6:806:2b3::22)
 by BL3PR11MB6364.namprd11.prod.outlook.com (2603:10b6:208:3b7::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.34; Wed, 26 Apr
 2023 12:14:24 +0000
Received: from SA1PR11MB7038.namprd11.prod.outlook.com
 ([fe80::cbf1:a735:6bc0:dcf1]) by SA1PR11MB7038.namprd11.prod.outlook.com
 ([fe80::cbf1:a735:6bc0:dcf1%7]) with mapi id 15.20.6319.033; Wed, 26 Apr 2023
 12:14:24 +0000
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Thread-Topic: [Intel-xe] [PATCH 0/4] RFC: drm/xe/ras: Supporting RAS on XE.
Thread-Index: AQHZaGl+oeFD9yVi5EOF8dnDWFq+t68eNPiAgB9qxoA=
Date: Wed, 26 Apr 2023 12:14:24 +0000
Message-ID: <SA1PR11MB70389B5E7E0207B638A90228B3659@SA1PR11MB7038.namprd11.prod.outlook.com>
References: <20230406092631.2820028-1-himal.prasad.ghimiray@intel.com>
 <871qkxyz7g.fsf@intel.com>
In-Reply-To: <871qkxyz7g.fsf@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB7038:EE_|BL3PR11MB6364:EE_
x-ms-office365-filtering-correlation-id: 8fc00b46-c370-421d-dea5-08db464fc662
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6oeNzRmcCLkpu8SooRH6qVsq4u8khtWWGNLoptlccr0k493xBBCUltcT5jvQrFZA4K4TPAguISKOVoT0jeni7UvZu7KE7tghxtLXirTnLw4IgZMqyTtJD9tnBmNMpUzDuAOh/tFhXrFSab5jv+1Vg47iMK0pZhjKMX2xrdlohCm6C3l6EVfg31oN54PYWb3DliW08beliCKKl/O2FjJD4e5ujIc+PNY7RNZjb9MyheWkZPNiWInBPVqPlf/TsFbG/J+bNGyfZaPwRFySj8f1b57tINlsWYcdDRUm/aj/Qk53IMqOBMuYn99LHnH5OkAS2JCk1hAWqMZSBzOTGoGq+7u15oDwy7ij/ciq+cRaLOlNUt5ceMHQiosC/ENAD6PGwvCwop/WyIh8RumEGnBzcRoaP3S6SVfe0Rd2Fp3zF07SYZ0PC4vhFQ3w6HlXwZ/eOymY0zE+qiRlT3d+W2brHrUrv+hBX8o4iYkTJqAXeE1iISXHE2QmP2+WBrEGE//j2TqVwgDnXN6dRDT5yWNpgzutq/DpbfGf5NxmXyZk+bbOW+tkxyxWY9fUF6ThIhodncEbiglOJ3QuhJoxV6PSOkuXTJx/L2Li6zfDI2pGUAoOS3Mm9yiSe+SGLSWiWd5T
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB7038.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(346002)(396003)(136003)(39860400002)(376002)(451199021)(8676002)(33656002)(82960400001)(122000001)(52536014)(55016003)(316002)(38070700005)(8936002)(5660300002)(38100700002)(66946007)(86362001)(41300700001)(2906002)(64756008)(66476007)(66446008)(66556008)(83380400001)(76116006)(9686003)(26005)(6506007)(53546011)(186003)(7696005)(110136005)(478600001)(71200400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?gg00FVvtzPafBJlrkLRw7yf3qgSbygWjZCx8+loVygQA40C6cOFTv6Kn37Ur?=
 =?us-ascii?Q?Dpiv4tS2+MWdTAEJyT89Ttej4m4mYRkeDTA3uLnmc4y/2RW4m7B0jAGJ8Nj1?=
 =?us-ascii?Q?TX2Y56I12vjx24dt8rRvEDJc7ryrnrCw/OZ2qp0hGD7QN4flq4kl2fy4L/+y?=
 =?us-ascii?Q?0zKtgJecvEVTblTHv/wm+IG1gkbO980GvptblfbRQbuEqYG3bun99RGREFrP?=
 =?us-ascii?Q?ce2xL/kjhJNmYP/6X9bj/DMtnnKNxt4Fuu/lkcMpnyBtLat2B8H1s4k8e36l?=
 =?us-ascii?Q?NlEO759LFWAqDeLfHt9jzs9zRZ8SxKtxNCgVWbEYNJpEK+TEMGYyO/4qwplT?=
 =?us-ascii?Q?DiUIp/fYmI2w4cnLh0rS6tJRrmQBIvmbRbONSMiXYMVNIZPDKV4oABG/+2gP?=
 =?us-ascii?Q?hezNYyxW1FX6tx9V3maOxZnkLNDZjfmGHDkble+T+2YcTCkMC15dTfLPozW5?=
 =?us-ascii?Q?HIWEs7PGerxMHrHwQhpyiXx+5EGF0VWeDOLkmSaJutJq9rKG5yDhmHE/Pi0t?=
 =?us-ascii?Q?agO1oFqa/TMAi0WAVh7NQw2GLBbyIeLU9QsEOb10zY6SBEgAZrwS+6zfip/H?=
 =?us-ascii?Q?wXiCwGd9+caCxI0y2OH+CwdgdNsp32AKdH/dsaBtThzSj+GPqHgXhXQBD1ZE?=
 =?us-ascii?Q?qQDKxfjAzXeegCcqbP8bIwY35QQn73v27sU846r74PcMrgaMidUnBpQE2iW/?=
 =?us-ascii?Q?YRoMfPyHM2eJYYhOXPbm6wDy9KuO9MWLL9ibZ8+qf5fFlYiP5w/vdbZk0Qzv?=
 =?us-ascii?Q?phV/LplApOLUQjhonOjrSG0EpZcBgbH3cRf8S88ZFHeeTDj6hVultxHn6djK?=
 =?us-ascii?Q?p87mrGBSwvfyHvpXBlPJQxsMnrxd0rAklx2ColXrQlJtNT8OiWjV5DsaYZ8J?=
 =?us-ascii?Q?wFYOEOqEcUiuO10fY2YKEkc37HGQSoNqHG0RUca3fYtxl+btbuOZi+AmIMsr?=
 =?us-ascii?Q?lVCkoTW/+RbVSmtS5hulr3Af6WzL3CeqgcQ3hAy+YWpsKW9FergB5ZqV6ycE?=
 =?us-ascii?Q?+9CvVwW4/4pS+0t0hmoOUzWdZh2MI/p/F20Q0fY38ooxMHvccdmZ0K44rfQ+?=
 =?us-ascii?Q?eZ2z3/gqwOsn+qoQLDi1GuQTT0vtCrHUBmUTuyh8B8Z9Gzt7QSzCRGl+9huP?=
 =?us-ascii?Q?p3mhSg6TGQK20yzM4+zSEkzGoHqVay9ZPdhNhbIAIpGtXwjrn2+WPumWMxN6?=
 =?us-ascii?Q?M3Z5jEDOaBeFCF8pAaDkyoqsvRAv9jQDCqJ0wlOMWSCzmKzliFtJHiqlcczI?=
 =?us-ascii?Q?UywmHMOBi/YKhdYZ1rXHYU87O/xgepNjcrYiYZKS5a6ouv34KNiJ/eraC74Y?=
 =?us-ascii?Q?UTnsojS2hLnZSQ5AHeklxKHpw75YctDFjzWdiudISxcCkMktoSeiwoC0D86t?=
 =?us-ascii?Q?YvpuJQrLft0YPV5yWDH3R232IYlDgS5QCauXc/CgvzlT7+LaSKS9zPVPSBG4?=
 =?us-ascii?Q?VRMd7aP8ecIwmM+95H4Mv7qavZRwGDvu0LmI+HAUg3mBTm39NlxLnOtn7PBU?=
 =?us-ascii?Q?je0f7Tn8UskvK7M9yctxC195YGD5YZIgr6UJPaDA/XMQb9oi0hE1zzAOXT8t?=
 =?us-ascii?Q?L+NRCBDbVVHr8JSPijUv/Ui0+PbqV/BdT+/XhqJLRTHqgsykpL2Fi0UTrsIK?=
 =?us-ascii?Q?QQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB7038.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fc00b46-c370-421d-dea5-08db464fc662
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Apr 2023 12:14:24.7454 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SBgi09OYa+r+4P9LMpKgX5gnxao5YlnPCzVF5/L0ESTaesCsb0UTqfKFdKse2iFD8VVe33RejtNEN/QoVad883kUNmyTKULCjujHj7SAEkc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6364
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 0/4] RFC: drm/xe/ras: Supporting RAS on XE.
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

Hi Jani,

Is recommendation to create new .h file for error related registers ?
Can I go ahead with adding file xe_gt_error_regs.h (GT, SOC, GSC) which exp=
licitly mentions registers related to error handling ?

BR
Himal Ghimiray


> -----Original Message-----
> From: Jani Nikula <jani.nikula@linux.intel.com>
> Sent: 06 April 2023 17:56
> To: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>; intel-
> xe@lists.freedesktop.org
> Cc: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>
> Subject: Re: [Intel-xe] [PATCH 0/4] RFC: drm/xe/ras: Supporting RAS on XE=
.
>=20
> On Thu, 06 Apr 2023, Himal Prasad Ghimiray
> <himal.prasad.ghimiray@intel.com> wrote:
> > These patches in series are for adding Reliability, Availability and
> > Serviceability support on xe.
> > Patches provide the infra for various hardware error counting and
> > logging. These error counters will be exposed to userspace in
> > subsequent patches.
> > In current patches:
> > 1) We are adding support to handle new interrupts bits.
> > 2) Counting of GT errors.
> > 3) Soc/SGunit error counting.
> > 4) CSC HW and FW error counting and sending uvent.
> >
> > Akeem G Abodunrin (1):
> >   drm/xe/ras: Add support for reporting CSC HW and FW errors.
> >
> > Aravind Iddamsetty (2):
> >   drm/xe/ras: Log the GT hw errors.
> >   drm/xe/ras: Count SOC and SGUNIT errors
> >
> > Himal Prasad Ghimiray (1):
> >   drm/xe: Handle GRF/IC ECC error irq
> >
> >  drivers/gpu/drm/xe/regs/xe_regs.h    | 244 ++++++++
>=20
> Please don't recreate i915_reg.h in xe. Please add separate regs files li=
ke
> we've been doing in i915. It's pain to split a monster register file late=
r.
>=20
> BR,
> Jani.
>=20
>=20
> >  drivers/gpu/drm/xe/xe_device.c       |   6 +
> >  drivers/gpu/drm/xe/xe_device_types.h |   4 +
> >  drivers/gpu/drm/xe/xe_gt.c           |  30 +
> >  drivers/gpu/drm/xe/xe_gt_types.h     | 105 ++++
> >  drivers/gpu/drm/xe/xe_irq.c          | 824
> +++++++++++++++++++++++++++
> >  drivers/gpu/drm/xe/xe_pci.c          |   6 +
> >  7 files changed, 1219 insertions(+)
>=20
> --
> Jani Nikula, Intel Open Source Graphics Center
