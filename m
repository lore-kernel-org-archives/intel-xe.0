Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBD71EB64D7
	for <intel-xe@archiver.kernel.org>; Wed, 28 Jun 2023 05:09:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F9F910E34E;
	Wed, 28 Jun 2023 05:09:25 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51EF410E34E
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Jun 2023 05:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687928963; x=1719464963;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=mT5vgRh6qGxnoOVrPU40MmHNNGxxt86KJeaJU1FZwyw=;
 b=Cr81r/bu43e7gup+R6idfGO5vz0ZEeOuo80Tow/QHAaa3u6SMfikUxbD
 ZCLaslRfxiuZ8m0j9GCsBGQHDKm2CQzbgAX5HUlMBGf/IRHdRsb3c230F
 +Ur036Gfpd2oWX3aw8LZis9qGt5AALvGThtvxuqUa6ZHh/KdxQhovaNUC
 jsDYSI8/UhKbMKLOIVxJMRoba/85jnGcp4QVfIHcOOyPCXWA0az6TUAxa
 RTGH7EcQl+uXTRnQxaREdcEVe5m70jCOcjtTAf7oVpDaadk+KoGKi8mCa
 QimLlKBA6Iue2kIeFP75tNY0qhdhKadrkpHhycR7j+pS0Lmfb8gbd1pXT A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="448139218"
X-IronPort-AV: E=Sophos;i="6.01,164,1684825200"; d="scan'208";a="448139218"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2023 22:09:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="786925512"
X-IronPort-AV: E=Sophos;i="6.01,164,1684825200"; d="scan'208";a="786925512"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga004.fm.intel.com with ESMTP; 27 Jun 2023 22:09:15 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 27 Jun 2023 22:09:14 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 27 Jun 2023 22:09:14 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 27 Jun 2023 22:09:14 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 27 Jun 2023 22:09:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i4m8aL491pyqLNCo0oGRshcHTmCw7KqHrJbM+OnK4tEq5E2HXgRr/HTsjOiOBAFsZsFto38MXqos9+TdKZ8RWfuMyYtQJmjIJ6oPfiVzaN+juZPS3VeGIOHgkIKBc/naTXbT7quedOQG6RHIpWwW+gOuZiY8l9UC52h2tEXH2vGk4P6gc5RXcHAgSaEcn0kbZSB9mqmsMbdRfrcLVJhd9kiWhwcoqTWpSH3YgfmPCNZtgo9lgDB8DaVOzFjbcqKRgR6unXKJRbvnqYy5ybeAAvBMGBMlian7tkTqgF4eS+06BqcdyWzYM7RMv2XmguQg7OH177/oJ+vPUHN7hgbdZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fl61BqSd3BZvDV8hXcSmLILj0vs1AvOQY9DlQFj+YJI=;
 b=cLmMORQ4e6CMRgL2dGo9NXBtpWj46+MvOdtkzLjdt0uKDByDJK2l7yVOun+pQpWGdP/YiEFGJWc0eUo/XLIdGu9zNH3XLa/oatXR+0mITlod/wuP/Y8CmkKxLP2VoaP/Ln5zDb/3ermztLXMmwlgIlDBM6Cewkz0oY18HDK5ZHGsSw7MfkPg0LznEV1ptG8/z57qLqQvLsLIl+5JMqFYp4RBpYkOVhn9VJOasQlM/9cBL71XOokgpo35S0gNn2jRE80Ysi2n/i6P7fanaADRWuWHzy4OA7v3aXSYFA1GCYKCVENKHjX5Fh3YCmJMKlvfoWs8lpubTs5AL/+yDvJvAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by LV8PR11MB8606.namprd11.prod.outlook.com (2603:10b6:408:1f7::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.23; Wed, 28 Jun
 2023 05:09:06 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::2bfb:7d63:f348:1a4]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::2bfb:7d63:f348:1a4%5]) with mapi id 15.20.6521.023; Wed, 28 Jun 2023
 05:09:06 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Thread-Topic: [Intel-xe] [PATCH V4 0/3] drm/xe: Add sysfs entry for tile and
 relate it to GTs
Thread-Index: AQHZpNpIDHzFDac0fUOQxp6/4fjEOK+e/AGAgAC3QDA=
Date: Wed, 28 Jun 2023 05:09:05 +0000
Message-ID: <SJ1PR11MB6204410608266A4ADE78DA428124A@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20230622072818.3182423-1-tejas.upadhyay@intel.com>
 <MW4PR11MB7056E935C6498F1044C08468B327A@MW4PR11MB7056.namprd11.prod.outlook.com>
In-Reply-To: <MW4PR11MB7056E935C6498F1044C08468B327A@MW4PR11MB7056.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|LV8PR11MB8606:EE_
x-ms-office365-filtering-correlation-id: 3b18f094-7471-44fe-604f-08db7795cc01
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xnlcskrzwhUAEFCt90LazA1yyX3/8IPU8DUevu5yhsboOKIOIsi50hf0g0s6TlT/40tY81eFjVg1h4meeVPG/jSyhZDz6mWb/oPnjkANOyzlehgCmMzWuGLPr2kIOWSfphOIpdUOtpFXCcrRWDw+ha76nEtyocCibgBL0Tt0xuYallakWX32gh/6ASpG7gTSEEPBsCVrFPbL7tsQRIHC476BfhRys2Hdn/nfIUoYoF++6MrYLyJqiJ293GdEUBK6QZ1TsQ1deEkpvoqlmv0yfJUghql5JeB0uJaRy+sqDqkp0n6La3jmPJT5vnxLZonYlu58SI98uB5F+qZtx0kn2PTYJMGOBIqeU37EX3gFM0AWCR44hLKcr8LUsmOq7uXiRkApjwANnAZKByodEI0czOOHNT/m10KT3Sr9LaRay/Xjin2G/kTMXBNWeQMqSQlAF38wlP3vouQcrQ9CfuTBG/XyNkACR1n24aE0JbKWCU3UkF5jT9buE0pOq2dXK5KQ1h30tXt/pICGhbPkfEpEmC7+vPc4j8RdOSWNBLkniQDW7BULPelBtdkSJ8PZSU3LKOUNt6fEOsJ64svEj27DeSfmchWwxLwABz8J2j0Vc84=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(39860400002)(366004)(396003)(136003)(346002)(451199021)(122000001)(82960400001)(38100700002)(38070700005)(83380400001)(33656002)(86362001)(478600001)(110136005)(9686003)(966005)(71200400001)(7696005)(8936002)(316002)(76116006)(8676002)(66946007)(55016003)(66476007)(66556008)(41300700001)(66446008)(64756008)(6506007)(26005)(53546011)(186003)(52536014)(5660300002)(2906002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?RgVNMVDSNu6/C3a9BZdES074a527ieSmVWQWNcAGLYm7cb8q0xdnUdsc5A6G?=
 =?us-ascii?Q?yLLSrfaOAUSAgFGzsxMD7m6bjaF5MOyfWv0A0vYk+OtrSd4CP4qQsegHmZYS?=
 =?us-ascii?Q?WG77/h8vbsZD7OFwWCk3Q4ndIwyZhMaKjuAPVsNcuN6Z6oATlbJ9RyQPolQj?=
 =?us-ascii?Q?321JB7JS4TprDbHjl7K5SbvgRKKoBdwbcPjSkIoifjlOnGyHrrpT7yZiw+M2?=
 =?us-ascii?Q?HThg3unV79cMYABJCDxCYvo+oNeUKlBh75OTbu4CGo+eNb+srpN9YbPnXSMK?=
 =?us-ascii?Q?85U1jjWND8EFlwLnIo1zTjn9pRTFy9L+9Q2ENvQwWw4V1h7gR4xVfT3xXosM?=
 =?us-ascii?Q?0y2EWTcZ1dIEY3/baxgvN6PYZN+tHkK3D+dwAayQRob/KbJzH0Cb3mxOO4SS?=
 =?us-ascii?Q?SPOTfkE0XJbucAE+GzmtVeE8MIqA0xeU8kRiJ4qMqMqfsadIHJX+OWofLFmU?=
 =?us-ascii?Q?Dnmkbj68Ixp+dQlLSkUoOLlvRy7dIwXCgnP63ivOu1RUEfkBIXLLW6E7V0u9?=
 =?us-ascii?Q?OAmKxfwPgWCjccC7ch/8jTRQgpdU6X0c8Jts7cMYipsEQyuIpuleUU2fUrQL?=
 =?us-ascii?Q?W923mu+nb4PVVmfbBJX8/s2Aw/u2Y6m0/QykFF2XmDX3SxNZYzBzYd2NBF/s?=
 =?us-ascii?Q?MCJ9BV1xhx0l9iOu+/KFAf0bEEc1yutDkRYsMNqxaJeVJf5fEqM+GRKDBEp3?=
 =?us-ascii?Q?50GyLFqOlbd4ga3GEXWTCFahIBir/EUCtsTSTvOrF8NQ+0xYE7iCMcUHlhzQ?=
 =?us-ascii?Q?gPRpBCCVyOu2uqwZ1xLKtJsmxNZV1dWOqRRLpf6yLC0OGMysiCX1APLn3Nii?=
 =?us-ascii?Q?Om3CEQlDLXqMb2Zp9GAyBgDbaWtp8Ah0MXPqlPw07BWY5eWu/CRyPYUgDRko?=
 =?us-ascii?Q?Ofya1tBopLipWBv2EE+zf63coxbUxaVY9PqEDjRGaDvJMJVeBF5InUrTOPVm?=
 =?us-ascii?Q?axzX5sBt7ts7hbmrfZ+0vF9fdjq4YmQXzmyvj4uGfXp7HAoie/6L8cyvaK4h?=
 =?us-ascii?Q?CwZlMDH3iUv18XPE5hZdpn+Q1h2vKHttEnstHCDjE2O6pSXvHzCEXP+XQab9?=
 =?us-ascii?Q?mh9YvgNn/o85qV19FyeoBcJ/AbCC/PNpbbQI/54YMAl6471HamxOh5G4YGwe?=
 =?us-ascii?Q?fzXxTgSXNVpOjzATxCAbXDfJZX4rACqDQ+RaAJSnMaaDKhbzNkwr+2Ps5iDE?=
 =?us-ascii?Q?eXygfQzSqSn0RpOg/OEoBNYWJTAzSkE9GekkO4auSO4xfAT/HiXRUWnZDFfL?=
 =?us-ascii?Q?Je7K3n7mx5bUZowU+3aQToSwPZ6CmnlPGyfYpc18zGevkYwqINym/sGV6wZZ?=
 =?us-ascii?Q?YtRIFXTmUMb9dBAVU6Ai3fI23JPT98rgScqmpsvCWt4iAY32mqbCn4sgVyuX?=
 =?us-ascii?Q?wTmwzAvKacM+K8AtenXSmLN+KHt+alySlcFkrf/KIt0W8gZjPRxwkfuAd3iM?=
 =?us-ascii?Q?nKk1Q/Qv4l6P8pSiRnSUcl/5KRZJ48CxBWw/+SVtbYWFhhF6V+IVJvCS8JMz?=
 =?us-ascii?Q?eCmNx+Q/bFilP1VI1Lbh0pG6HlIK7JvmZgajsgIlCTjjHeKwbN2fdjszqFlN?=
 =?us-ascii?Q?Dj+D1gasR9wV7ktQRZpWyf9enqZ2A58J6zUp7b1g?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b18f094-7471-44fe-604f-08db7795cc01
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jun 2023 05:09:05.9238 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8Vy2Q5pDresQ8s602PspgjJDVTY1P/6u1CK5F60jl2M2G3qUnzoxvISMHwH+wlRCVPPAkMM8zwjV93kt4UveeuOKvGKTlL2fL9ykAoRxI5k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8606
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH V4 0/3] drm/xe: Add sysfs entry for tile and
 relate it to GTs
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
> From: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>
> Sent: Tuesday, June 27, 2023 11:42 PM
> To: Upadhyay, Tejas <tejas.upadhyay@intel.com>; intel-
> xe@lists.freedesktop.org
> Subject: RE: [Intel-xe] [PATCH V4 0/3] drm/xe: Add sysfs entry for tile a=
nd
> relate it to GTs
>=20
> Tested-With: https://patchwork.freedesktop.org/series/119801/

As far as I know, tag that we can add is as below :

Tested-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Testcase: https://patchwork.freedesktop.org/series/119801/

I will add this.

Thanks,
Tejas
>=20
> > -----Original Message-----
> > From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of
> > Tejas Upadhyay
> > Sent: 22 June 2023 12:58
> > To: intel-xe@lists.freedesktop.org
> > Subject: [Intel-xe] [PATCH V4 0/3] drm/xe: Add sysfs entry for tile
> > and relate it to GTs
> >
> > With the separation of xe_tile and xe_gt, We now consider a PCI device
> > (xe_device) to contain one or more tiles (struct xe_tile).
> > Each tile will contain one or more GTs (struct xe_gt).
> >
> > Sysfs entries also needs to be aligned as follows:
> >
> > drm/xe: Add sysfs entry per tile - Adds tile sysfs infrastructure
> > drm/xe: Add GTs under respective tile sysfs - Relates GTs to each tile
> > sysfs
> > drm/xe: Add sysfs entry to report per tile memory size - Reports
> > actual physical memory per respective tile
> >
> > Sysfs entries will be as follows:
> > cat /sys/class/drm/card1/device/tileN/physical_vram_size_bytes
> >
> > V4 :
> >    - %s/addr_range/physical_vram_size_byes, make it
> >      user readable name - Joonas/Aravind
> >    - Display in bytes - Joonas/Aravind
> >    - Reorder headers and modify s/LMEM/VRAM - Matt/Aravind
> > V3 :
> >    - Make tile_sysfs_init return void and warn for errors
> >    - Exclude DG1 as it does not have TILE_ADDR_RANGE reg
> >    - Use sysfs_create_files -> sysfs_create_file
> > V2 :
> >    - Address review comments
> >
> > Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> >
> > Tejas Upadhyay (3):
> >   drm/xe: Add sysfs entry for tile
> >   drm/xe: Add GTs under respective tile sysfs
> >   drm/xe: Add sysfs entry to report per tile memory size
> >
> >  drivers/gpu/drm/xe/Makefile              |  1 +
> >  drivers/gpu/drm/xe/xe_device_types.h     |  9 +++
> >  drivers/gpu/drm/xe/xe_gt_sysfs.c         |  4 +-
> >  drivers/gpu/drm/xe/xe_mmio.c             |  1 +
> >  drivers/gpu/drm/xe/xe_tile.c             |  3 +
> >  drivers/gpu/drm/xe/xe_tile.h             |  2 +
> >  drivers/gpu/drm/xe/xe_tile_sysfs.c       | 78 ++++++++++++++++++++++++
> >  drivers/gpu/drm/xe/xe_tile_sysfs.h       | 19 ++++++
> >  drivers/gpu/drm/xe/xe_tile_sysfs_types.h | 27 ++++++++
> >  9 files changed, 142 insertions(+), 2 deletions(-)  create mode
> > 100644 drivers/gpu/drm/xe/xe_tile_sysfs.c
> >  create mode 100644 drivers/gpu/drm/xe/xe_tile_sysfs.h
> >  create mode 100644 drivers/gpu/drm/xe/xe_tile_sysfs_types.h
> >
> > --
> > 2.25.1

