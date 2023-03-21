Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A6D7C6FD20
	for <intel-xe@archiver.kernel.org>; Tue, 21 Mar 2023 22:48:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 729A210E090;
	Tue, 21 Mar 2023 22:48:27 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0545A10E090
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Mar 2023 22:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679438904; x=1710974904;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=rnE8tCl7kUm0n8Jd59sVN9oTOsjbEeVsFet8hYNO+8c=;
 b=fSDaDoMYf3KBmLh64E0wj6FgdYKLMYozKMyjDrC2FaOcLMBN06K9SgB6
 INgYsg1fu6QQdSxmIdcIFT9xzgXnDOsNfJmMx2f/c99+k8Nfi2o1g+js2
 xssw1ycXBjOv8yjxkMbYnIVaT90FyogrdFctbmL+QrMVi4KfRObn7mmBx
 jv3g8Av2wYOWOGZEpxaKKV/l9ThFPn3dROIO3APXqs5KHr3KTddJbwAsb
 saaLgGQVY4y5Abt5pQU+S/L18aR3OxkWNGUHqtMVMd3owGC0qLzMhMtk7
 JbaLGpH67Cd2F5O4nRRyEpcQBvQ2BMgfK7njhxxAKNp1kPV4OzHQBVIUJ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="425366553"
X-IronPort-AV: E=Sophos;i="5.98,279,1673942400"; d="scan'208";a="425366553"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2023 15:48:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="750812486"
X-IronPort-AV: E=Sophos;i="5.98,279,1673942400"; d="scan'208";a="750812486"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga004.fm.intel.com with ESMTP; 21 Mar 2023 15:48:24 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 21 Mar 2023 15:48:24 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Tue, 21 Mar 2023 15:48:24 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.172)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Tue, 21 Mar 2023 15:48:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QJ4zkUarFEZ964eGNax94ZNV18V1c1LNPaHDm4GhImE6IHXWtqoCgz36rh4TKNJBHkxLOyC5Hd7bxJ6LKfJz5yRk+t2qqIPOHQa/z1w7RZofFf+Ix6+mWguWU8Pzh8P4zQnuS8nRQItEaD5hbhqTG3ZI796YatG2LwB7lp80DGb0Mvgs4H6qhzjodKO7dvW8k+bngn6aYONaHrj06WuQ9XhoNTCk5dnUNR9nTfE0HzEJC4DvochYrhkPhw7JztMWCBnRvVIeA3+duJ7ZR/GCCY+BvQLZOJITHVXHqtUKOenLWBSyWT9ekKp4vg/AS6OotNDSnFuxIjN21h8PhvZCTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xGTlXk8DAJhgCuVQdjSiW/yH9yozG+nPyhUbzyymvKs=;
 b=PJZseLNhSNr4dSLtSFQ6uesmAPaxi+lIu9NMed/6hvqKfHChgebXtKQvVn4dmy8biaZUOOSGVIIgSp7j/4st5i3d7GCYUnDb7PxLsMpu/Xsg3QkXfHq2OLEx7DjNCjhd6vK7sFckxvoF6C08xKPJGOgQO8vzgnYqTyUvH6dWuR1IStYQQhaAZiWJi9Q1APFWp1gOHAFfCmJ7BPBBSv6+1Lnkkrcs03oNwn8v0xV4+f+RimDWtD+O3G0tZqWO0tK7rhL0o4d8HrrSndPsZeNxyBaZ0+yCHF8p4nffBY1wO9fYRzHgmbrmxHDuj2iq+QVzsICQL3BiC1WpIaPjue7BvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ2PR11MB7715.namprd11.prod.outlook.com (2603:10b6:a03:4f4::20)
 by SJ0PR11MB5769.namprd11.prod.outlook.com (2603:10b6:a03:420::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Tue, 21 Mar
 2023 22:48:17 +0000
Received: from SJ2PR11MB7715.namprd11.prod.outlook.com
 ([fe80::4b35:822b:2c31:1137]) by SJ2PR11MB7715.namprd11.prod.outlook.com
 ([fe80::4b35:822b:2c31:1137%5]) with mapi id 15.20.6178.037; Tue, 21 Mar 2023
 22:48:17 +0000
From: "Srivatsa, Anusha" <anusha.srivatsa@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>, "Ceraolo Spurio, Daniele"
 <daniele.ceraolospurio@intel.com>
Thread-Topic: [Intel-xe] [PATCH 2/2] drm/xe/huc: Macro support for loading
 unversiond HuC
Thread-Index: AQHZW4aoDO34alaK20mRCTI4tiDu968FYs+AgABXZ4CAAAyeAIAACUOwgAAGxcA=
Date: Tue, 21 Mar 2023 22:48:16 +0000
Message-ID: <SJ2PR11MB77157BDC838C1A64A83D7787F8819@SJ2PR11MB7715.namprd11.prod.outlook.com>
References: <20230320235254.3288679-1-anusha.srivatsa@intel.com>
 <20230320235254.3288679-2-anusha.srivatsa@intel.com>
 <20230321155059.GK4085390@mdroper-desk1.amr.corp.intel.com>
 <20230321210349.mr5e233da5ihvv5f@ldmartin-desk2.lan>
 <20230321214858.GP4085390@mdroper-desk1.amr.corp.intel.com>
 <SJ2PR11MB7715ACCAEFE21E4288F9A230F8819@SJ2PR11MB7715.namprd11.prod.outlook.com>
In-Reply-To: <SJ2PR11MB7715ACCAEFE21E4288F9A230F8819@SJ2PR11MB7715.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: daniele.ceraolospurio@intel.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR11MB7715:EE_|SJ0PR11MB5769:EE_
x-ms-office365-filtering-correlation-id: d5b8744b-ce32-4b08-21e4-08db2a5e5c3a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yii5sUDb4/5PStMbhFY2nlFy46ij9odqxBdYvSs7Wc66q60Y438udnenfWneCkETdnT7we5EEImA6ZoIXJ8tYVnS0CVgLULsaprg3VSlzH7/05a7oeyjLAGT/Rax3OuoxcPB4Um6Nd0GlteSTqNqAzzthaxikt06lPBhmq6o0t5QQ2uc0vBHqMTnskIuUh/ibCsGjYsNT22GZUSiZQM9aZx0MOhVGRYrczHrgCqbobIT614yIWeYMCj5AI8LUf2Cz41+Vt3heJK5p4VyZaSXjT2PB5/viyckIE4rmA+1XHjzX3ZFGQmEm2XHd0hpeJZeqdLuBfXUFRNXVY8EWCKIy5r7Zwjx6OJKE/X/8+fm+lE6KItWLCyuY6iEK7m9/hSlhRRI7831aLNKT2umWMEKjno11lRZ9wMqj7d/QOkjdRnR7J0nZa4ECv59XkpfDa0bng+Gz32jMwnxc3/jfH6X8mzo7hMdFhpn6wTiFLgDayBESHwiCpxNo2kMD56rVE36CIkllpFwlqct2JuAejX1neVWpDfNveN5+9QlvLEb6kZcEnCuVD8HlO4VMdOJSGIrJTupBfuTkXVzeEXofYTfvJwlXHA4fxjyZdcTErtjQ02PDWhKIq4Fx5J76ns2ziN4Zl99/xNCCKGO/ihrHAYD/Cq1WDB7vh/EOGsHeTdIeV88Fo32qt3PNN0DegI1iNq4/wA9zq7BvtR4sbvUysWp6Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ2PR11MB7715.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(376002)(366004)(136003)(396003)(346002)(39860400002)(451199018)(7696005)(33656002)(82960400001)(86362001)(9686003)(71200400001)(316002)(38070700005)(478600001)(110136005)(6636002)(4326008)(66946007)(66476007)(66446008)(8676002)(66556008)(76116006)(64756008)(186003)(6506007)(41300700001)(26005)(38100700002)(122000001)(53546011)(5660300002)(2940100002)(55016003)(52536014)(8936002)(2906002)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?ERrYlkODCOOOcIBxblWOYHEZmQcQKVcvz+yWDswsX3/PHmLdsjX1AaN4Q/?=
 =?iso-8859-1?Q?9FtyAJx8+dJpEGQgbSSBGrsm/BErUfjJ9jldYXoMAAGw8oRURMwKQtmUky?=
 =?iso-8859-1?Q?8U1cGTbTosNc6QGWKZu2Vhje+VeT13uQ+s0YfWRghtPuh6zm/gZ0qNdD0l?=
 =?iso-8859-1?Q?tYW7omeVfNhNFhag//LPqq8MkR5CFnEtupqI7P3DHUV1OFpzglAzQHwgJ0?=
 =?iso-8859-1?Q?zTGKltaiTWjULnxDC/hgAFrbp6yxIgGb2TXO17rNhIni7VYd8TZBF84zFe?=
 =?iso-8859-1?Q?p78ppZYSFVtzrgrHwv+WlkZrmXy+ml6M5Ixq4zw7BMPAf1UIcGgt8CWaj9?=
 =?iso-8859-1?Q?4zliet27Ag7x1AYfc+uYA3/05FzlHGizrSWt24d0nfDtUfZ08LPYk7LC5O?=
 =?iso-8859-1?Q?vaaZWokm1rZxc3CYrcIRzTL0VPbT5D/0OyD4ggIrGaRJJ4KuXhrwLyCSaB?=
 =?iso-8859-1?Q?e3r3Dzt5pXHbd8GF1qT5BE6h5o+8+iN5cNdx8tM5+yud/BBdj0dpRkjWMt?=
 =?iso-8859-1?Q?5WfRiWpg1imKq5nH3Jf0Fqf+i8HtNGOtLX5rV7oBemY9bZNgIbkvdD5Y/X?=
 =?iso-8859-1?Q?as4KUT79zt6EuQFtZZn18WyUjRB8/lbegh/Sw03RtsN8T35iGvskFiScVu?=
 =?iso-8859-1?Q?rdpzUMzn7RqdqeQgdCgix6HD5X/NVVZcAyYlUNTuGE1mIx0293cZKoj6aH?=
 =?iso-8859-1?Q?N3blYOkAG1GxpceF9VnxL9LXEFxM6TE9XBTGHc7jKPToVBzLnii0KjvcCE?=
 =?iso-8859-1?Q?FCFlGsgJc5+wzWbP0QIi15WPMB1c9HaFmSvT5b00LW/H82Rn9gr0hZb6B8?=
 =?iso-8859-1?Q?Lx9ysbwp9vr9JrSaNWESY0cI23lkw8wjrvsbrtE8i4rl32JQ7spoht3vc6?=
 =?iso-8859-1?Q?64ee6KKs88j18NJCgEAs7QYUByRDOTqNAsmsUbbRdymY1yamLJ+Syr6jE9?=
 =?iso-8859-1?Q?6F3G/pKgr5MmxtNwQFB9P0LGY/t1O2DOjTG8n5ZpWVaGsG/NfJXNANECHC?=
 =?iso-8859-1?Q?sQfQ19m34fkuxbZFpPwDA883W5oPMKnq6d4CFAp2Pd53EycNEde2PrH+wM?=
 =?iso-8859-1?Q?NDiVXV62lJeseNtJYry10ANkCbu26Fjb6vv7C39LXAGzg2MJFpF8I8GnPi?=
 =?iso-8859-1?Q?ov2D2E0AMu0ejEXYokvlwTctgtwCUlm68jXGXPfRUoMQhk/UQnW9J0rbM+?=
 =?iso-8859-1?Q?1HtCHRCDrmrHSN3SRJiNOQg30iADDljo6kDNdeLqvSKoUNwM9vAHp4i84w?=
 =?iso-8859-1?Q?xCEPgnPRLRblMG0gwTmigxGW0FNxgM0+dvbTzFWwyXSKraEZOxNeAwz3Hz?=
 =?iso-8859-1?Q?wQWUu1rHyItDGx5g6JV8Q0j2hMCPtveOkl8bKnoLR5al7k+CqTgidFZc7Y?=
 =?iso-8859-1?Q?N6+GAH+Qx3yw8U18hmkzWFi/oOU4XNBoe1fRbBP+gP8g/UAqX5t/NZbeTE?=
 =?iso-8859-1?Q?mbVzyiT7G3M325tTuXp+76Xmkd9Ec/FOBmJYoJsaLKUKmRcKZx0tGWgp4W?=
 =?iso-8859-1?Q?cd63HukKyrnvSIzEEtwedSH7t0Lfp4Te/iHuXIGDoNlKx64ne6dkwdozL7?=
 =?iso-8859-1?Q?va218r2FuIFIdwVj73ZkgbZgWhn7pY8lt5ib8TwbpGqGINb+j4GDw0+kmB?=
 =?iso-8859-1?Q?+i12lPW3JeBT4TLCGBrXjA3Dda+owHxNTCrCwkbBxhwWGW10hh4zh27g?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7715.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5b8744b-ce32-4b08-21e4-08db2a5e5c3a
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Mar 2023 22:48:16.5194 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: u4kWhVDfK8oUWvKKnDgVVCtWOTv6NKx28iN0c5ki0MXdx0dREybW6pA0yx2KW1rn3+ikOfOhqtadRIfafZTPVU5y/isuBf8e3gH5Zjn7nK8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5769
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/2] drm/xe/huc: Macro support for loading
 unversiond HuC
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

+Daniele=20

> -----Original Message-----
> From: Srivatsa, Anusha
> Sent: Tuesday, March 21, 2023 3:24 PM
> To: Roper, Matthew D <matthew.d.roper@intel.com>; De Marchi, Lucas
> <lucas.demarchi@intel.com>
> Cc: intel-xe@lists.freedesktop.org
> Subject: RE: [Intel-xe] [PATCH 2/2] drm/xe/huc: Macro support for loading
> unversiond HuC
>=20
>=20
>=20
> > -----Original Message-----
> > From: Roper, Matthew D <matthew.d.roper@intel.com>
> > Sent: Tuesday, March 21, 2023 2:49 PM
> > To: De Marchi, Lucas <lucas.demarchi@intel.com>
> > Cc: Srivatsa, Anusha <anusha.srivatsa@intel.com>; intel-
> > xe@lists.freedesktop.org
> > Subject: Re: [Intel-xe] [PATCH 2/2] drm/xe/huc: Macro support for
> > loading unversiond HuC
> >
> > On Tue, Mar 21, 2023 at 02:03:49PM -0700, Lucas De Marchi wrote:
> > > On Tue, Mar 21, 2023 at 08:50:59AM -0700, Matt Roper wrote:
> > > > On Mon, Mar 20, 2023 at 04:52:54PM -0700, Anusha Srivatsa wrote:
> > > > > Follow the new direction of firmware and add macro support for
> > > > > loading unversioned HuC.
> > > > >
> > > > > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > > > > Signed-off-by: Anusha Srivatsa <anusha.srivatsa@intel.com>
> > > > > ---
> > > > >  drivers/gpu/drm/xe/xe_uc_fw.c | 16 +++++++++++++---
> > > > >  1 file changed, 13 insertions(+), 3 deletions(-)
> > > > >
> > > > > diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c
> > > > > b/drivers/gpu/drm/xe/xe_uc_fw.c index e2e5f7fbe9db..3c522d970228
> > > > > 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_uc_fw.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
> > > > > @@ -50,7 +50,7 @@ static struct xe_device *uc_fw_to_xe(struct
> > xe_uc_fw *uc_fw)
> > > > >  	fw_def(DG1,          0, guc_def(dg1,  70, 5, 2)) \
> > > > >  	fw_def(TIGERLAKE,    0, guc_def(tgl,  70, 5, 2))
> > > > >
> > > > > -#define XE_HUC_FIRMWARE_DEFS(fw_def, huc_def) \
> > > > > +#define XE_HUC_FIRMWARE_DEFS(fw_def, huc_raw, huc_def) \
> > > >
> > > > Why do we still need the old versioned filename?  Can't we get rid
> > > > of it completely?  There's no backwards compatibility necessary on
> > > > Xe yet so this is our chance to eliminate the version numbers on
> > > > HuC
> > completely.
> > > > It's not clear to me why we're still using huc_def instead of
> > > > huc_raw below either.
> > >
> > > note the version is saved to uc_fw->major_ver_wanted and
> > > uc_fw->minor_ver_wanted.
> >
> > I thought we didn't want to use those for HuC, only for GuC?  Since
> > the kernel doesn't interact with the firmware at all, there's no need
> > for us to enforce any kind of minimum version check as far as I can
> > see.  We don't even care about the major version number, which is why
> > it isn't included in the filename we load, right?
> >
> Yeah if we go down the route of wanting to load unversioned huC. Then we
> should also override the version check for HUC like we do in i915(this ch=
ange is
> part of v2 of this patch that I was just about to send).
>=20
> Else we see:
> [=A0 292.632408] xe 0000:00:02.0: [drm] HuC firmware i915/tgl_huc.bin:
> unexpected version: 7.9 !=3D 0.0 [=A0 292.632415] xe 0000:00:02.0: [drm] =
HuC
> firmware i915/tgl_huc.bin: fetch failed with error -8
>=20
> Because it get 0 and 0 fro mthe table but it finds the 7.9 version which =
is actually
> right but we should not have the check at all for HuC.
>=20
> Anusha
>=20
> > Matt
> >
> > >
> > > Later when we are parsing the blob we read the version that is
> > > encoded inside the blob (rather than on the filename).  See xe_uc_fw_=
init().
> > > I think the version check is still makes sense:
> > > major should never change and minor has to be equal on greater than
> > > the one we first started supporting.
> > >
> > > The version in the filename needs to be removed, however the version
> > > in the table I believe can stay... it should basically check the
> > > minimum version required. We could rename
> > > s/minor_ver_wanted/minor_ver_minimum/
> > > to clarify.  And comments on top of the macro definition to document.


@Ceraolo Spurio, Daniele Any thoughts? Should the driver not check huC vers=
ion at all or just not have it in the file name and still do version checks=
 for sanity purposes?

Anusha
> > > Lucas De Marchi
> >
> > --
> > Matt Roper
> > Graphics Software Engineer
> > Linux GPU Platform Enablement
> > Intel Corporation
