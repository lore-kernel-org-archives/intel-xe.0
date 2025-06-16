Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0F3BC71136
	for <intel-xe@archiver.kernel.org>; Mon, 16 Jun 2025 08:38:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7120810E2D9;
	Mon, 16 Jun 2025 08:38:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ml1UFEmf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BCE910E2D9
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Jun 2025 08:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750063134; x=1781599134;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=HGEWapgbUnBwuAIjJwtsC4Ver19x0wsdUnQ9YdRHV3w=;
 b=ml1UFEmfvTJfjDsCkn9WkwFgsTYObmgyww/6JT8o1jP1ao94sDgjR9a5
 DECQxTRIiYPvq6R0GKbjPsAXGxSc4o1cpORqZa7bMMt2ZNrIabhQIj4Cc
 KhIE2kXPEvXenh9Xe3aV9VFc1kVvPxx6LurvmCFlr/AyUN35TQhhHX10i
 bLR3cYcPu/r32Vf59K3M3VrLw0z61yu+5PV++cbnVbrCygXU6uRaM1EqH
 50czwbX90HgQFiU71p5f3Dmv6po3j9Uc1LEeKNj8leTvhxVctd3CYzmpc
 CsQUwDfHPzvy9y3t9I4yj1RWArCVY7iktk0y81nIJT9tbkNL9o1djUMWS Q==;
X-CSE-ConnectionGUID: DUNRguRfTqy7edaQjPVoaw==
X-CSE-MsgGUID: S01P1aMcRTOfKsq9bY0hFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="74729449"
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; d="scan'208";a="74729449"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 01:38:54 -0700
X-CSE-ConnectionGUID: sZIHzNjmR7mCjN9ocAa42g==
X-CSE-MsgGUID: Gz8K8YizSqiUooD/yqOx4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; d="scan'208";a="153559814"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 01:38:53 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 16 Jun 2025 01:38:52 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 16 Jun 2025 01:38:52 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (40.107.101.54)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 16 Jun 2025 01:38:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xdzG3nH9ZB1xTH4nUJB5Qn2lpCB9CTwTqPOUG+oARXkeAG0mlEPuWWrrCezQgyZ6xiofhPSGWYo8H3tbgEnqKW55SLmsWs9ndhmlKfxjNwF01GybpkzCL/N713G9iCl7xg3xjTVHoad4UMFN8j8Yw6r1SfQjILy136VbzzFU/g/hpnBtOzPVHzaN/U9u4tTDChOgWCW0faufG3A0sFXqGg7vK7ixA9Yjrw0fZHiX1kLPqGJ9ymsYT1KHJlRubsnrpbfXT9rnTsWXi1r+1PI5G7iTEfq6wOD/M71t9Gi450RdXs/8veWNEssDELckIGScHGWsERIvLc3pZeLgAWtpHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SKqQugD7IRq/Qx0WiHrf0VEiIT2lOgWILGzg83ze2qQ=;
 b=MtbhjamiCiOMB7ZdV3Z8v6aSDdCFadgACQIiziJOT1F7J4zuIFfurfP7e90xmIRQ4pbV8HB7cKogyVK6NUSfMAF3y7PPaPWU63auhJxhNmu7HqkbaqfvoCs1mXwmX+8438VLk6USpGfeVgjP5/2RQjalNj7GqqUx0ohcUU8ZqYgmPvnB/UsXWCgZg0RFv/F1r9rOesVjATvMyQxpWyRUWqKMsVhDG99WwPqwi62HKU83bCpJj/hp4PKbwr9SgI0LfHlBV0Zy5lyRTAtZ4pfsDpYdr8SZA9v3zZSbAwbVtHZE3PCNQVxW3IxE9ibGj71KGteRciJIuktXydNl7NLHWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by LV8PR11MB8678.namprd11.prod.outlook.com
 (2603:10b6:408:20b::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.21; Mon, 16 Jun
 2025 08:38:49 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::9c2a:ba60:c5fe:6a64]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::9c2a:ba60:c5fe:6a64%5]) with mapi id 15.20.8835.026; Mon, 16 Jun 2025
 08:38:49 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Bhadane, Dnyaneshwar" <dnyaneshwar.bhadane@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Bhadane, Dnyaneshwar" <dnyaneshwar.bhadane@intel.com>
Subject: RE: [PATCH v6 8/9] drm/i915/wcl: C10 phy connected to port A and B
Thread-Topic: [PATCH v6 8/9] drm/i915/wcl: C10 phy connected to port A and B
Thread-Index: AQHb3JniEvCDxlpTY02mQFyxzTgU8rQFeNtA
Date: Mon, 16 Jun 2025 08:38:49 +0000
Message-ID: <DM3PPF208195D8DF1F76C172386940583D7E370A@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20250613193146.3549862-1-dnyaneshwar.bhadane@intel.com>
 <20250613193146.3549862-9-dnyaneshwar.bhadane@intel.com>
In-Reply-To: <20250613193146.3549862-9-dnyaneshwar.bhadane@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|LV8PR11MB8678:EE_
x-ms-office365-filtering-correlation-id: ab1e139d-3ace-490b-62c1-08ddacb1374a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?Gctqh2xoK31BX3vkGBrD2TKONYCSsFbn5J6xPrrxAhTjqumbkXAH6jlowJ7U?=
 =?us-ascii?Q?KfjkX8+X3SRobohlKVt53B4qIbUsGdIKZ+FoS0tdxscPLFtHhVwA1wcVmIH3?=
 =?us-ascii?Q?S3F0Fj4hhoXS5rbxy0BjEBoi8oiS3aj4FZgwbT/0VayV7oYzGt64pQSalJ9g?=
 =?us-ascii?Q?ZxLMVWj0WqI6l17x6hs2r3dNCS3A1mFT2hRPvsTpCYsNTy/oMsa+5TCGU0z+?=
 =?us-ascii?Q?Q9KTZOoTK3ri0fo/QgjsQ3kK7HPHYioVJ66CtZ+3EUM3y5jLL8+YdTMRXp2s?=
 =?us-ascii?Q?aimnXaAdk9UUAb/3h+XHsSnLrR/piaIZ5cCJtjqkDmGvq7wPBLgzRHOP2bpm?=
 =?us-ascii?Q?TrYZFU0Ou8Z9o/KuUv7IrE3shLXnC4ukaXbVTpkBHzFbSwYjXk+Ai5OHc0QA?=
 =?us-ascii?Q?tCe+EQ1g7UpilrSPpIfmNH580TI2dZgBjSpuLYIKzdVIx1EcEatuVeNoZXoF?=
 =?us-ascii?Q?xrEvkwKKuOdhRDSkWCFTCdoegwsRvvMEBWtAHkiNVn3f4rg4omCHdtJM8ZDk?=
 =?us-ascii?Q?IJ10ICwK65YjYMs1+4++3IEKXfub5KcQPCjIuid+lhcQre5RmwxBGLD2DBFL?=
 =?us-ascii?Q?V3QVvZ/Ej7x9L5LxynHCrLlNnR2X0pLBkK/eGabgYHbbImeHfqRDeRufVCN5?=
 =?us-ascii?Q?B93hi3pnSgez2RDVVLUPF4aFiIoCGUM4EIPZeR0qmcTQZ2wiHTWcUBEt2zBe?=
 =?us-ascii?Q?Ii6srLZpJgYJ6liRVg5jtKewiglLIQG03wuhpCNCHEvveltjQ3YQnPFmDFAx?=
 =?us-ascii?Q?jB4U+n4UGCYNl7gbs5sz497g7mourp9Xe4BfTKjtGrhLEbzKjccfVA9Dksey?=
 =?us-ascii?Q?wr0ale0D0jfPSet9J94U3SqYVf9wA7vHNdRcLHhIIdRi+PJdhedoF3GAbrOa?=
 =?us-ascii?Q?tV63C+i1fr+DLr17ymufIQsJOi1dYucdmDaBRaQcE0FQHPEH0VvOZiDsBaw5?=
 =?us-ascii?Q?wE0B2ku5TusVXYWbpy7gQZJIAV4FaHWtyEyRvKuGdVd4+RrxUUpOfJaDHg2r?=
 =?us-ascii?Q?zcHJAcVKiPfvQ0/QKQbZNhbPFSJPt5+WLHPFxiZ8BdQx/ILbY98eXd2V3NPM?=
 =?us-ascii?Q?G01ChRAKtKuCbK24exeJpwPLNxD81f5nU4qPmcigzlfE/kXTv2xyEMx2jKdG?=
 =?us-ascii?Q?ieYv6ZZuYwMkUVNEY8pmpA4QotWK3njbUHEbytIJnyjZR6+UM0YZSvavPD5b?=
 =?us-ascii?Q?rD6Jf0x475J5p6i9+cH9g7680x3MUSgB+pd6209bJFEmsDyKJYFCFxLS7N9d?=
 =?us-ascii?Q?ZHof2U4vIVbJc6lAV7fhzaaYd/oTY+ZVGRpIOPk+Z/ZbQXh+W/MvFaw5pbR7?=
 =?us-ascii?Q?qq7PzVLbY4HCocrxOxXFHuw3Mxc1Fl10cfscoq5RecOVX/3KkWeBQR0eDCBS?=
 =?us-ascii?Q?4/wdZBuSD+prKDuK9Hi7j8plJEclXWqmZiU5rAz5eIsy3hzMmI+PnwqkbHch?=
 =?us-ascii?Q?TyPbq08YbriKOwZRzQ3BcE84aADmvW/3KLSi6FMedhUmDQpIVLTQUw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?1K/9FZWf/RwEKyMZ/dpHxw1IWBwPrE0V0oYTCQKSgGorz4ejEdOAv3ldFL6F?=
 =?us-ascii?Q?GaZsp3ccdOcQPCq9Pf8+/JAsZmzXSP1hnXZU/6f6jTeaqP9PvXGFf/gy0Dg/?=
 =?us-ascii?Q?qcAXtmXAe79pzuWjd1pmEjwCfmYg5Fzn1AlRzCqTdL3r9EtAHU3hg8rVwUpz?=
 =?us-ascii?Q?Ymrkvsjh7jFKUSLEoMm2QnodbYHp0qaZrwzUbaGXQnf/h9Q1yK7vysTlbPsK?=
 =?us-ascii?Q?CE1QyoYoRvBziyXPB5u/OZ+K9b9EOMDg2eIUv6xWdH3qjD3f8aV7IKn1uqW3?=
 =?us-ascii?Q?l+DxuHFtyjREgJdTA5eYZuTDrOHBDJEtp0hZFMolbJDvP1m4KcJP4w7YaobE?=
 =?us-ascii?Q?ZkFOSF4xMQmA7rYnU8/HR3PkXxBrhpSYBVaX0G8jUgsaytX9Y/Dt8GmOPIsp?=
 =?us-ascii?Q?tjzsqfF/HcnPeoo+8Ec69wHaniA1RyrYosq6ThF8aQuP4Gw/7t8RgexoCg03?=
 =?us-ascii?Q?gL5Tq7uulOMuPslhSepYqjLNiHBIub++TCvZX4xuWa4ShCs+Dmxa4g1yMXMa?=
 =?us-ascii?Q?QIRDTvj8HozYL/mG3mEBOcc/tRSoYP56Eo4jIT2Z/f0ZJfCBWwX1dU9ceLYB?=
 =?us-ascii?Q?o/o7eyn2UmAXRgRSKYW9DqtLnIAOikeuwtEDQ6LATgjRTRDFB/MMncserrQ+?=
 =?us-ascii?Q?J+GJDaR8mKarU669vp3ObgO29NLdmm9qd4CGR3d6o++WmldKZVdpvXbtXNxX?=
 =?us-ascii?Q?CuhT+MLcGkxDmpo04OtU3WPhORVpr0LZIfmBd7DuTjYS6Dc3iwtNCvAggMFr?=
 =?us-ascii?Q?jyGxO4Sww6GBYRREkvInf3KWZ3xR52CLEF+C9HyHaNaxht4KZo6xR5KK9r81?=
 =?us-ascii?Q?wlFBBX2woTEQg+LMKiWeTGfYSF8XSCfuMr1+lH39+emeKowcZvQ3iiTXbmGp?=
 =?us-ascii?Q?Az6YnnjIet4nMHr9V8TTPizKns5DI5ALj4J7ZyAvqnVEHmZx5vVy1WC0Cfxj?=
 =?us-ascii?Q?MU4niODc+KQUy/iS+am1k0eFtKy0WnCq13DYtAv+m3nZvtxdbtHnrbHYfv0t?=
 =?us-ascii?Q?iOzrO91SdEu6P1IoJ/poHuIEPUOEuauzhGuq2FAu5Fpkwu9alB7LmTtW8rR4?=
 =?us-ascii?Q?M1vjUdZvYCFOyZSptKpXdbWx6Cc+9KleZdH+OjO0XgwHBbm30QmdLt3kmJRF?=
 =?us-ascii?Q?G+TI630NUU9hdWhLd5f2lZlePat5CxqRQuQTlOHEhIKVQmIHY9WL121SSsjA?=
 =?us-ascii?Q?HntNgDNUUXjjhu2DcTfS/8k5ws7H8zzOFkm/KA4c6xKaDsrKFCuWkUOsPuCx?=
 =?us-ascii?Q?WSgQh4gotHViBBdPijywmnt7a9TfZ5NPIHH9h2pVrK+dpBLbQqW6n/R4uxip?=
 =?us-ascii?Q?vs0sVLgURn5bBSET6C82esn4YS89kTSoNn9RzyOozYtEAf650uIO8J5aP/bb?=
 =?us-ascii?Q?DJxaPpWT8y/MNo0FXPEbL5oR7U4sD9kXlMbrMX1InTf04eh3bg1EZx+jyenh?=
 =?us-ascii?Q?JdCESMRKZDxbaw7BpfmTAe3IQpEYfUp24vGy0sjhsNm/mVo1hlPZPGSUNUP2?=
 =?us-ascii?Q?QZ7TM29VV7sWjyqB3zquhFbf5AKtP8Yy72XRmoX7f/lYV3paojvAPJQA8tIi?=
 =?us-ascii?Q?tseEaZiKAAt+/DYCJpHvUZORJxeWtEplJkDtjldw?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab1e139d-3ace-490b-62c1-08ddacb1374a
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jun 2025 08:38:49.2802 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: i6nm1EVtkUenUt/yikeb6ROdlRMacsNfAs+vN7VtkDB0a4I6NmJJBdfPoacgx4U1X5HLFjPoEZFsyP907KtiMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8678
X-OriginatorOrg: intel.com
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
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of
> Dnyaneshwar Bhadane
> Sent: Saturday, June 14, 2025 1:02 AM
> To: intel-xe@lists.freedesktop.org
> Cc: Bhadane, Dnyaneshwar <dnyaneshwar.bhadane@intel.com>
> Subject: [PATCH v6 8/9] drm/i915/wcl: C10 phy connected to port A and B
>=20
> WCL added a c10 phy connected to port B. PTL code is currently restrictin=
g c10
> to phy_a only.
>=20
> PTL doesn't have a PHY connected to PORT B; as such,there will never be a
> case where PTL uses PHY B.
> WCL uses PORT A and B with the C10 PHY.Reusing the condition for WCL and
> extending it for PORT B should not cause any issues for PTL.
>=20
> -v2: Reuse and extend PTL condition for WCL (Matt)

Add the bspec reference here

>=20
> Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_cx0_phy.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_cx0_phy.c
> b/drivers/gpu/drm/i915/display/intel_cx0_phy.c
> index 83c8df9dbc0c..ed8e640b96b0 100644
> --- a/drivers/gpu/drm/i915/display/intel_cx0_phy.c
> +++ b/drivers/gpu/drm/i915/display/intel_cx0_phy.c
> @@ -39,7 +39,13 @@ bool intel_encoder_is_c10phy(struct intel_encoder
> *encoder)
>  	struct intel_display *display =3D to_intel_display(encoder);
>  	enum phy phy =3D intel_encoder_to_phy(encoder);
>=20
> -	if (display->platform.pantherlake && phy =3D=3D PHY_A)
> +	/* PTL doesn't have a PHY connected to PORT B; as such,
> +	 * there will never be a case where PTL uses PHY B.
> +	 * WCL uses PORT A and B with the C10 PHY.
> +	 * Reusing the condition for WCL and extending it for PORT B
> +	 * should not cause any issues for PTL.
> +	 */
> +	if (display->platform.pantherlake && phy < PHY_C)

Just because PTL does not have PHY connected to  Port B does not mean the c=
ode wont come here it seemed like this is the check
That made sure we go to c10 PHY and with this it will go for c10 phy when p=
ort becomes port B

Regards,
Suraj Kandpal
>  		return true;
>=20
>  	if ((display->platform.lunarlake || display->platform.meteorlake) &&
> phy < PHY_C)
> --
> 2.34.1

