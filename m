Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 941FDEB64D9
	for <intel-xe@archiver.kernel.org>; Tue, 27 Jun 2023 18:12:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E2D110E31B;
	Tue, 27 Jun 2023 18:12:01 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 476A110E31B
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Jun 2023 18:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687889519; x=1719425519;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=7oKVPw04f1OI3FWh5opz31HgL+2NClM0WWYzLpyNSww=;
 b=OTlEpF3ToO7TL4oILn07UHnaR3w4Ln3YoRLiRurbonP8Dy9Gcl/u5TfJ
 RNJ7Vf/vUJxKjagkU6/mAfyCX8beVJXAuVZB4n4ix8nepteI6et/MjBVP
 Y4CoUlVB5Hd7QB7VbA/G9Uj3MRb3aOpVOXFSUAb09UP65w6tuu9n1EpKM
 niDzpn/SnWlAYOAHhpZV3QRXjHsuLVkSdQWouBeJsRi1GYmXAIdE7XZSg
 AJ24KMNN5RllXd5YIVuxcDaPaJi10IMGRFsNvsJLP/lsIAFsXZ4RYUo7I
 jYVyrVGLDAdoIz1YEeBdHl0JL05ayVEsUxGN8qabzg5pzfK6hqaiAc9Z+ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="427652252"
X-IronPort-AV: E=Sophos;i="6.01,163,1684825200"; d="scan'208";a="427652252"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2023 11:11:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="890761566"
X-IronPort-AV: E=Sophos;i="6.01,163,1684825200"; d="scan'208";a="890761566"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga005.jf.intel.com with ESMTP; 27 Jun 2023 11:11:57 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 27 Jun 2023 11:11:57 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 27 Jun 2023 11:11:57 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 27 Jun 2023 11:11:57 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.175)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 27 Jun 2023 11:11:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RFMPbKcHThoTcKZusuP2NwAAHzVxMD6Fg6ZGEaJHo7ZMW5tnHffCs2ja9on3l+/35N56vOEIEFN0wuXRyMthlIGVnEfFJMgaHC7qsbmnbcekip9uPXmdD5fjnwschKAjSoK/N5g277AQvzFh5g8m/hwb4O9L+9GvRiZCAc36i3FSD0mj6ZRkLbDibfs33u971Cyc/+cUjS2S4eR7S6hpaCia+uGaRyLgvb2/51tq0zJ/Mv2HncUagwnJX/GocblyvO1uMCgSlvvSIvga852kNMUp1CC+Bk2uaugI9ijkLMYJXS8WHcKGBTZKRlv1S3DBvcONKG/hydkufMQzIVKjzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pw2AXgRNyCXQTPz6i/FGlTKdnW0xDUGM+MDPyvocSzU=;
 b=T0toVIgbtVrbmBHdsveOxOtcqHXZSVhQYzk/w8HYTh2Jf+PvRODioQpccjZ/ymuC9Y0uh+X1Pb84xnR5pP/E4CXQrWlk2hWOxnEt09MyFOx9ahFbDF7ZlGkoun6exStf51No6JrgYzbmDDnp2lhzRHcGjwj+sJ1cMxV/muD0aOnSc1X028hOi+drvyYs6uZqtPpAckVd/DqCob+PYK0V4sVPDR1zi7QUdB83G3wq+7sNXX8azJ3Z5uDagHSYDwLOCa2ej8DXMceh19K1T1iKlh8hrKeXU3sIpd7Bj8uGQd72z30EPSNOsG/FOPFVnTNkjjaux8vsfrB353u2ZRGeSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by MW4PR11MB6936.namprd11.prod.outlook.com (2603:10b6:303:226::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Tue, 27 Jun
 2023 18:11:55 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::875c:90e1:89a3:9c5e]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::875c:90e1:89a3:9c5e%7]) with mapi id 15.20.6521.024; Tue, 27 Jun 2023
 18:11:55 +0000
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Thread-Topic: [Intel-xe] [PATCH V4 0/3] drm/xe: Add sysfs entry for tile and
 relate it to GTs
Thread-Index: AQHZpNppIu0jlrfI2UqEAUEOmS/uqq+e+8nw
Date: Tue, 27 Jun 2023 18:11:55 +0000
Message-ID: <MW4PR11MB7056E935C6498F1044C08468B327A@MW4PR11MB7056.namprd11.prod.outlook.com>
References: <20230622072818.3182423-1-tejas.upadhyay@intel.com>
In-Reply-To: <20230622072818.3182423-1-tejas.upadhyay@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB7056:EE_|MW4PR11MB6936:EE_
x-ms-office365-filtering-correlation-id: 7b1a2cd3-9497-4631-b336-08db7739fd71
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hSNllcTQh/b8IojEd7nICh2KYks52LktzNPCQIhMs8tfuhFYJ1NqDSEffv3KdTUdtU7ml6MAHV54IHmswLU0j1/AwJx9Qi7DIJNCttONKatWyVhk08TDp/KfTS2QgjSm9dR/t3rKuoKW59+IwC9fXWzQof44tabPNjj50Ars88ZTJGw23PPS5oBArKF2Sfhm0KjRIFmrP0lfJT7LV+aOIhmvg3Sb+Px/XsxKSLnveyKsqADBFnk1DjTSrwr3WvgafKGE8Eeq4uSnuEfW1rTO2Y3MjWdS7+3o8LT8ccJq3hKlbyCH3gDdTRlX3X3NcNj0nDjiCmzDsgbaZk+dmcOfA6V8nUZR++PrRbukg/ITofClAsJuBAjsoomt2LpWM5FMD5siEH1fz5n86yiZFV8BAzpaitnaO3/iiEkAEStoDv3WSXWFwmly/N741NlgNTF5Epo6pJ9UlyAMSZJhvP3u2M0Ld/3NVu8rCRAOMtfzs/bcJtKMRejPKUvDs/EEcHN9lpZS50PVmfdAMQ8TrJrCxMRMrcIRSxdmnU+a1XzoVp6jl+iG4dsNyvWntqxzPQosQPQEomfmANaxKXPlB7RfqX0mL+Jz6RTP/zo1EiXtypo=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(346002)(376002)(39860400002)(396003)(136003)(451199021)(2906002)(186003)(71200400001)(9686003)(122000001)(82960400001)(38100700002)(83380400001)(6506007)(53546011)(86362001)(26005)(7696005)(966005)(55016003)(110136005)(41300700001)(38070700005)(316002)(478600001)(66556008)(66446008)(66946007)(76116006)(33656002)(64756008)(66476007)(5660300002)(52536014)(8676002)(8936002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?IRjfavLf6Wbt/JXm5Zd7qVrgVu1ME4XpKmozRvjn2E0QPlyHJnsmmXeBZVtm?=
 =?us-ascii?Q?BLxIisqisfAr3o7pSzxNJxKjoV/bEmDF/cChJF12W2+KM59j3j0zM0sWaYez?=
 =?us-ascii?Q?xrKCHhcCSpOK/gIeA86VOjKXqFtxoDY+fhzH4fEdRJJqfl2cEzpbInjuOfE6?=
 =?us-ascii?Q?wKSBFvhHdg8N50nl3MJ3x74i4Khi7y4CX6cTm1sBKX/yhEapLyNwczulIbLL?=
 =?us-ascii?Q?ZSsAhSwcb4iVSfyAjhfD31TXuKuUJmBTVXo9+my4Rk8B6qx4njQAjEW4jUpR?=
 =?us-ascii?Q?izPHy5IIC9IV3DgoEyAVsdx048bVqwl8r0DtQ63JpIn5FusRguAsWzBYLbIp?=
 =?us-ascii?Q?Nvjkod2AmEX+158U2EUgDnwhbCadBxWKzmO8r0iwAFAnVmakP/MJyn20/yXG?=
 =?us-ascii?Q?Kw2zpE9yFVWErl/QfK0G46KvPuQ9R19wyYHL/KoODwG1JMEhowXtVMxbFVVv?=
 =?us-ascii?Q?ZcayPK6pS0PW3SIMAX7AhaK7qBAW4Kl2RUCWqVIm8Nff0z5jvDaQ9DaD9sNN?=
 =?us-ascii?Q?lmVR/YNUsOJGhQvrZi2+QzTqEZiI7O8R3c06Ba6NZsMg/LAZ29/camAfY0gV?=
 =?us-ascii?Q?IVAexZmDPFx662/dRxqv9LSNWpS8eIbLhi0eZx5ILyi7dxaF3J5VHlNxcKJz?=
 =?us-ascii?Q?/fFIRU4syfLI9/LHSCfsA1h4xemyN4x5P5l7GlisZ3GElKDRfBzY8QoArzyu?=
 =?us-ascii?Q?fHi0xWjysY1fxbneGuw3UE4wmBLIrIi4wnKm0VfyNhvQF5XmCuAckhq1Ze76?=
 =?us-ascii?Q?jTOv7TKDSD9QNvEM5lHBegGEwwMQaLG5jUXm3L03pSK84PTeXJ5KVdaXpyvr?=
 =?us-ascii?Q?mDHLVBzyvSjLqsdY4/Jry12XzFD16eLhCO+7cRFiNsjcLFywIA6MNLOEi+O4?=
 =?us-ascii?Q?uD23BRqmBOKAY3HMYhn5EvM75unPnxngtObr+M4FdzrBa2SazbyZKaoaUub9?=
 =?us-ascii?Q?8Phgj0SsE0mha01edR+XjrqY01bEyR52utO3IYgZtiXGZaFJHR5L4E82YV0j?=
 =?us-ascii?Q?YX6cPBjEaCjEcp2jiFh9sSmwh4UmDduxPgUPJAb9csOtdo8XFSf0hNnj9Xav?=
 =?us-ascii?Q?07ndnKX3K14JTdNg6gs8gwGmQsV4/QFiLO8F0MhEfZQ/m+ZIuD4jdj6pbsll?=
 =?us-ascii?Q?wvvPuhpj0+WU0fbbf0eEKMIGv16ew6hZ+OrlqRd4ePX+irSPeTGfGkLx1aDQ?=
 =?us-ascii?Q?S+boHRMHg5w25OpxTNw5xVp4Bumfy6fVssXMmQjkv2A0udZZWDwDDzHeckiV?=
 =?us-ascii?Q?k+Ur/IlY86C2lOT2TfQBSJAtSYlAdsGEwJg4Dn7oBErwOQUjgzKFrNXnYuNS?=
 =?us-ascii?Q?tqQgqr2GU69CInuqwiYFUAbZ3Z2bnAHC5Z6tqJN+2yhIuPPuAOXwLMZpl+ul?=
 =?us-ascii?Q?m6j3uvxZw6n3HBz+JT8psdix5guA/4rqs3+wnntEkr45xMl0ahH9dRuRnAB5?=
 =?us-ascii?Q?nBzCH546UkZpovTPlhAadDQiD6Dx6XtDFE+mc0xBESh5yQPP/RaBLQMzne8I?=
 =?us-ascii?Q?ZTI5+1RUs2qxyHnr7jei8GGEY3g4RwVMHyJRKs18Fwe/XHc3troYbBIddE6j?=
 =?us-ascii?Q?K9qHyRE0hnv+OtNOXY03C/xAN4oG9dhU4wdUkarlEasgCRKsPVAomRbu0Hwv?=
 =?us-ascii?Q?9w=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b1a2cd3-9497-4631-b336-08db7739fd71
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jun 2023 18:11:55.1633 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +CqxZvXUSWO8c7PNK32ti3CR8bCbQB2/YKLzLrVagxc8+cpydlxEnWm/h85WWlNctM0mFCKanj5mx1Wk5StD6x5LPX/3vtW4zu6eHaaJN5E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6936
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

Tested-With: https://patchwork.freedesktop.org/series/119801/=20

> -----Original Message-----
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Teja=
s
> Upadhyay
> Sent: 22 June 2023 12:58
> To: intel-xe@lists.freedesktop.org
> Subject: [Intel-xe] [PATCH V4 0/3] drm/xe: Add sysfs entry for tile and r=
elate
> it to GTs
>=20
> With the separation of xe_tile and xe_gt, We now consider a PCI device
> (xe_device) to contain one or more tiles (struct xe_tile).
> Each tile will contain one or more GTs (struct xe_gt).
>=20
> Sysfs entries also needs to be aligned as follows:
>=20
> drm/xe: Add sysfs entry per tile - Adds tile sysfs infrastructure
> drm/xe: Add GTs under respective tile sysfs - Relates GTs to each tile sy=
sfs
> drm/xe: Add sysfs entry to report per tile memory size - Reports actual
> physical memory per respective tile
>=20
> Sysfs entries will be as follows:
> cat /sys/class/drm/card1/device/tileN/physical_vram_size_bytes
>=20
> V4 :
>    - %s/addr_range/physical_vram_size_byes, make it
>      user readable name - Joonas/Aravind
>    - Display in bytes - Joonas/Aravind
>    - Reorder headers and modify s/LMEM/VRAM - Matt/Aravind
> V3 :
>    - Make tile_sysfs_init return void and warn for errors
>    - Exclude DG1 as it does not have TILE_ADDR_RANGE reg
>    - Use sysfs_create_files -> sysfs_create_file
> V2 :
>    - Address review comments
>=20
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
>=20
> Tejas Upadhyay (3):
>   drm/xe: Add sysfs entry for tile
>   drm/xe: Add GTs under respective tile sysfs
>   drm/xe: Add sysfs entry to report per tile memory size
>=20
>  drivers/gpu/drm/xe/Makefile              |  1 +
>  drivers/gpu/drm/xe/xe_device_types.h     |  9 +++
>  drivers/gpu/drm/xe/xe_gt_sysfs.c         |  4 +-
>  drivers/gpu/drm/xe/xe_mmio.c             |  1 +
>  drivers/gpu/drm/xe/xe_tile.c             |  3 +
>  drivers/gpu/drm/xe/xe_tile.h             |  2 +
>  drivers/gpu/drm/xe/xe_tile_sysfs.c       | 78 ++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_tile_sysfs.h       | 19 ++++++
>  drivers/gpu/drm/xe/xe_tile_sysfs_types.h | 27 ++++++++
>  9 files changed, 142 insertions(+), 2 deletions(-)  create mode 100644
> drivers/gpu/drm/xe/xe_tile_sysfs.c
>  create mode 100644 drivers/gpu/drm/xe/xe_tile_sysfs.h
>  create mode 100644 drivers/gpu/drm/xe/xe_tile_sysfs_types.h
>=20
> --
> 2.25.1

