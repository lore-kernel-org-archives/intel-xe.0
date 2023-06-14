Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AECDBEB64D8
	for <intel-xe@archiver.kernel.org>; Wed, 14 Jun 2023 21:19:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FBFB10E46A;
	Wed, 14 Jun 2023 21:19:37 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E66B210E46A
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Jun 2023 21:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686777574; x=1718313574;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0wLcGNVogDrUOqaKJvM4B9iMIVZqYiMSfnhhUE4aRog=;
 b=NyIEu+m2SKSATjtRkW4tomB7eQt4m+2Nb/3q+OH6QTIuzkpgr0O/cspc
 I16bnJwTlaulcF0H3Lrtd8UtmJ6BoubG6P5RkkkUmDwIDerwJr0apds/5
 p1LPDvMYMj5glVt/8cIZuWBv4b9MoLmxSBYTfDZJYeactfe7gnZJ43GiX
 r6pg5/B+wkpiyWYjkz45rGFKz0ciupIFk7yjkkUvPr6RnCT+muJ9VWSTZ
 AKmwGkBIFXP1z+jSsuW5ENodf7Q0cpi5qGkB9+Dznj5ghGPp5spncAr4H
 EnNSJTqg3LWkMrEs0pg5ehan33FMwsbSNxTp74tuB3kBY+Eyc/t9rXQ4j Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="348403526"
X-IronPort-AV: E=Sophos;i="6.00,243,1681196400"; d="scan'208";a="348403526"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2023 14:19:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="689534277"
X-IronPort-AV: E=Sophos;i="6.00,243,1681196400"; d="scan'208";a="689534277"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga006.jf.intel.com with ESMTP; 14 Jun 2023 14:19:29 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 14 Jun 2023 14:19:28 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 14 Jun 2023 14:19:28 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.44) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 14 Jun 2023 14:19:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B1iKlv+ZlIY099a6y0LE3iXtf6MkFchhV9xe4d0OoamdFZ8wuW8oDFCMH55TLJXaMGTwlo4/ThOwBSLGVPF3ZaljaapThgYqV5fFwjA5qswvt4M9FHlbEDiD3DxTHPl1cVOKQmzBiD8J0m2lkpv1NTGrdNbRospTJcJdec2ssx0xcNnJcy/DIa4vPNweua3nTlTiGJfvd/eAhSwpsZ2q7hnUm1Rqi06lt5VvVBaQCt9//BIUvL6ioVCFEr0tfzPOnhJrRtBd3WoaN3+quTeg6nTKf93/KnvvJ6QxQkzWQqEahVqSnbMcZNyY20rNtgCMojdaBIEQIHpFIFswOcJQ8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PmT9CSjHvtArUQCiJWqpDxNICIRyCGz0/F0U7ndMjzk=;
 b=i+BtOI1UvWDB3sxdoHzYPyTtumWXv37dQ+B4uQTGcRLdjWZp2Zec50HVH+CRpvpMeTYFusYBzgLOs3wIXMtSsvGKiyoq9SvfRlJn+f9cVge5wIU9bfXiwwy5KX3wP4yI7IB7dfRmf29ScPAsCQWqzOJhppb5MxyKcb2NQv7Chdp9sbErvjkd9YbvOc+h3YdGcx5XsUrDXu/ASzpKJiF0W4PfP0N5oyOQ+yXC2k+cIWu0YtQkp9J1YKrkiRiGuhXKe56jnrr/ilYdpUrC/zV/SMqaaveHTBSCHZwvS49HJwV2c/dpjhg+nm5NCNgz5mooKWdW04rkzpCHlqg1jznxUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5971.namprd11.prod.outlook.com (2603:10b6:8:5e::7) by
 SJ0PR11MB5630.namprd11.prod.outlook.com (2603:10b6:a03:3bb::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6455.46; Wed, 14 Jun 2023 21:19:26 +0000
Received: from DM4PR11MB5971.namprd11.prod.outlook.com
 ([fe80::df8c:4a33:f53a:9a2e]) by DM4PR11MB5971.namprd11.prod.outlook.com
 ([fe80::df8c:4a33:f53a:9a2e%5]) with mapi id 15.20.6477.037; Wed, 14 Jun 2023
 21:19:26 +0000
From: "Sripada, Radhakrishna" <radhakrishna.sripada@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Thread-Topic: [Intel-xe] [PATCH] drm/xe/mtl: Add some initial MTL workarounds
Thread-Index: AQHZmjUu4yc0XRxVGEeJyo6Kxf1Lvq+K1ymg
Date: Wed, 14 Jun 2023 21:19:26 +0000
Message-ID: <DM4PR11MB597105FE6DD2308901006C8E875AA@DM4PR11MB5971.namprd11.prod.outlook.com>
References: <20230608181217.2385932-1-matthew.d.roper@intel.com>
In-Reply-To: <20230608181217.2385932-1-matthew.d.roper@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5971:EE_|SJ0PR11MB5630:EE_
x-ms-office365-filtering-correlation-id: a3ada063-4d5f-4bac-9e1f-08db6d1d0824
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: v4bfcjNc0RBkzAsK33mi8Hlz89yryW2HTcSPcwqkQPnhILOBbwUU8cHnQ3Og91WPZkQFnEi+kqVPGO3F9qEcfl16b3R+wyQuaHj61jONjYM8t4cHrZPqcyeySJY/URwa35bBNGl1fUW6Po8MYgu6CSdpq31kjA1iI22rZl6vIqCZtudaHvKqvpj8DRafyy8Go0euj1wD8iyLy1RfEGIJeKgtCOTYG6wVnwcNgsBAczqNBNCQB6O7OlJIwSeldXYvzz4G0uHBp82X4GVh1XFS4sfo2Kj0JKp7Ak1LYLr3gMKDWGRAMHrHfYlE0/UH2p1RdpyqDPQk7qFKyeUY3kGLoxayVyRLEwG71+zShDLEjo7HEFi7P9LLc5PD8+Fy4LVv1mKmQ/hvoTRYnK8y5QSfYPX058tdk8f/EaledlOi0eJpDgs1J95l3zwaEgJwliVnwW8wL8KZ2cZYxF+IQuK6Yf6PmBDq1uNn3MTuhM6D0MYf/bB4c4AZnp1xQP+BsHwKt6duqIzxaiVhL5GxFAxyHbTkRzbvvTz7g8Dpl+oS69i6XClMI7kwmEcN0ncIWbt3jBju2cEPxkuWubguKxCjSNlZsHV9yTPf/3afIVZBu7EU1RMkcX2zATomqfnGbWoV
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5971.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(346002)(366004)(39860400002)(136003)(396003)(451199021)(186003)(478600001)(6506007)(53546011)(9686003)(83380400001)(26005)(107886003)(7696005)(55016003)(86362001)(4326008)(8676002)(316002)(41300700001)(38100700002)(2906002)(66556008)(71200400001)(8936002)(122000001)(66446008)(64756008)(82960400001)(66476007)(76116006)(5660300002)(38070700005)(66946007)(52536014)(33656002)(110136005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?gP+vLDX8kXSTDI1jV0PZhCIdBK3khfsOBhdW8Ls5wLTNjJZbxc1xPsXWzcYl?=
 =?us-ascii?Q?YQBflhZInRf8IgYyncnSkyNGVMSM+miE3f6ITCrluPJetB3/viIHrA1nJRX9?=
 =?us-ascii?Q?f5Czdwv8rlhUNfbyXCbxhP5EhBF5kSjHU6+UZZDr6GTAV7FCY7Vxqj9Xab2R?=
 =?us-ascii?Q?l8cfEEbAj3s5YBG2YiSzsFEKwLY/sDmYI651Tx4vVXAyFLOpiU2vNBZkkp6m?=
 =?us-ascii?Q?1FwRdQQTizavXLFYxA5G+Lr52McGuockufHTdxDv2jH/0dUwrVRp0sTGLXOz?=
 =?us-ascii?Q?JPmQpdNQOaH6MxSVRV58viQq7qKannH55mD9nGvtGDTLSOldGjzWKDqmRYwo?=
 =?us-ascii?Q?FaRcU6nxriaJpwTAKou6xrns1SHEKnNVFGv1XXZZYdhKPB+V7Z6fOQoSD8pO?=
 =?us-ascii?Q?gVN5FTbjyXQaZkkS/ufoQ0OiHGUmnVIxHVDO/UKh138ZNzA/9QuQRVxwrEaB?=
 =?us-ascii?Q?AfuhBUM8PdAjMBm9/a+jKo0JndR+Ew6SSGIX1vb6jlx0isq2hDcNTvy1zOpc?=
 =?us-ascii?Q?tJXN839n7SI57Yo7u0kmQ18FyNzhSQ4ThopTCrOmdsEPLb/IteD52WOik7Fd?=
 =?us-ascii?Q?pqYYke7KiOcSVAuYbebiJaPjePNAsyRqyA0o1pZh1D1Yxvx438Re2hpzM5Xw?=
 =?us-ascii?Q?ATQ827+/yuvbl7rzxe2DROHNfLIXXc3ua3JRgRHTV2TveiMSB+AK9/P/Jmbe?=
 =?us-ascii?Q?bCt4ivAyArpn3nt3DuN/c2z3mpx7Nkc3LrckK4jo+S4eARbqS1pQLsMG7DGy?=
 =?us-ascii?Q?8rjKOuhJjMCFSiUL7+Ki9BNHy1GyG0XgApxhZVhpbyPI6MNnj8YOX2dL3KN/?=
 =?us-ascii?Q?cicEMS5jxhi9qyCMhAcOuf/g715Y5703Tr8i37XcpRBYdC4UYx5YfLRt0d6J?=
 =?us-ascii?Q?bktH0BWIx3VzanRwRSkClv5jU64Sr0aYknAt8DVyvce6VH9Wa47EGiaY1q8B?=
 =?us-ascii?Q?A85KOxrYHoyaIIoBRbAzefrx56eWFEJgBdGsORBVIpUFgAgLytBgP74/IlZd?=
 =?us-ascii?Q?pINSMkAbTGpi5w7Zkw2Zqvf01+mxuPiFFFrFrA0OzG2JLqdrvZiH3C8aExEj?=
 =?us-ascii?Q?YX0Krvl2tTxTFtT5NSriSbj6eXHdMmGOr6jb0gkEtxKRlM41kJ4Vc23du469?=
 =?us-ascii?Q?C/N87j8XYgHNI1482WsB7h/S92tfFgYokwgZ21qnbjlyG1ja486SdLyNa3xj?=
 =?us-ascii?Q?zYiBnFKvHNNj0ndFumj7jFL9nBTLNuk1Fn1lDQcwYRL8qYj0SHoHoU1tGs8F?=
 =?us-ascii?Q?5RaFMIqq7DwGk85TuVaTD+VcIxa1F851JCyZanYMEEi9gnONpwl2q2pogIdy?=
 =?us-ascii?Q?sidomHhLx7UUH8rLZ88VqK3NCBEgmN6WrfRGhIUyVOPIcBgivMsr8m1J17Te?=
 =?us-ascii?Q?/yetuGIQO5hwr2wZJ5ROYRaI+XhLvJIsfeBEEOnNQVmkbytzm9fFzY1xfn8L?=
 =?us-ascii?Q?2CHZtINXIkFkpx/Gjmgi0I40ox1vSHOU+CkrEkuFf9dKMry35UluV9bylcuQ?=
 =?us-ascii?Q?DidHBcRyAU9APMmS7E9JugPQovDUkZheZv9iH0gXfHzU4Ro62G3njglVa03X?=
 =?us-ascii?Q?FMkf6G92s/VZ8uQlBfeNKTVc+9o7WbQrUX4pdHqQnMi1bHiIhUEPo2qgAb+I?=
 =?us-ascii?Q?AQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5971.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3ada063-4d5f-4bac-9e1f-08db6d1d0824
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jun 2023 21:19:26.0993 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CKLlfELTUmPS121eS5vBTJ3/PrJcifKB2yPf6JwexzDirWbeRNIJVsiWLXzG/KfHDMc4lm81F7SBYNs3LkZ6Bx/i1YOv8tR/yiHyBPZ8v0U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5630
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe/mtl: Add some initial MTL workarounds
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
Cc: "Roper, Matthew D" <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Matt
> Roper
> Sent: Thursday, June 8, 2023 11:12 AM
> To: intel-xe@lists.freedesktop.org
> Cc: Roper, Matthew D <matthew.d.roper@intel.com>
> Subject: [Intel-xe] [PATCH] drm/xe/mtl: Add some initial MTL workarounds
>=20
> This adds a handful of workarounds that apply to production steppings of
> MTL:
>  - Wa_14018575942
>  - Wa_22016670082
>  - Wa_14017856879
>  - Wa_18019271663
>=20
> Wa_22016670082 is currently only applied to the primary GT at the
> moment, but may need to be extended to the media GT in the future if a
> pending update to the workaround database gets finalized.
>=20
> OOB workarounds will need to be implemented separately in future patches
> for Wa_14016712196, Wa_16018063123, and Wa_18013179988.
>=20
LGTM,
Reviewed-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com>

--Radhakrishna(RK) Sripada
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h |  8 +++++++
>  drivers/gpu/drm/xe/xe_wa.c           | 31 ++++++++++++++++++++++++++++
>  2 files changed, 39 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 0f920175526e..3f664011eaea 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -133,6 +133,9 @@
>  #define VFG_PREEMPTION_CHICKEN			XE_REG(0x83b4,
> XE_REG_OPTION_MASKED)
>  #define   POLYGON_TRIFAN_LINELOOP_DISABLE	REG_BIT(4)
>=20
> +#define SQCNT1					XE_REG_MCR(0x8718)
> +#define   ENFORCE_RAR				REG_BIT(23)
> +
>  #define XEHP_SQCM				XE_REG_MCR(0x8724)
>  #define   EN_32B_ACCESS				REG_BIT(30)
>=20
> @@ -268,7 +271,9 @@
>  #define RENDER_MOD_CTRL				XE_REG_MCR(0xcf2c)
>  #define COMP_MOD_CTRL				XE_REG_MCR(0xcf30)
>  #define XEHP_VDBX_MOD_CTRL			XE_REG_MCR(0xcf34)
> +#define XELPMP_VDBX_MOD_CTRL			XE_REG(0xcf34)
>  #define XEHP_VEBX_MOD_CTRL			XE_REG_MCR(0xcf38)
> +#define XELPMP_VEBX_MOD_CTRL			XE_REG(0xcf38)
>  #define   FORCE_MISS_FTLB			REG_BIT(3)
>=20
>  #define XEHP_GAMSTLB_CTRL			XE_REG_MCR(0xcf4c)
> @@ -302,6 +307,9 @@
>  #define   THREAD_EX_ARB_MODE			REG_GENMASK(3, 2)
>  #define   THREAD_EX_ARB_MODE_RR_AFTER_DEP
> 	REG_FIELD_PREP(THREAD_EX_ARB_MODE, 0x2)
>=20
> +#define ROW_CHICKEN3				XE_REG_MCR(0xe49c,
> XE_REG_OPTION_MASKED)
> +#define   DIS_FIX_EOT1_FLUSH			REG_BIT(9)
> +
>  #define ROW_CHICKEN				XE_REG_MCR(0xe4f0,
> XE_REG_OPTION_MASKED)
>  #define   UGM_BACKUP_MODE			REG_BIT(13)
>  #define   MDQ_ARBITRATION_MODE			REG_BIT(12)
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index e5b3ff669465..5eaa9bed9d12 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -236,6 +236,22 @@ static const struct xe_rtp_entry_sr gt_was[] =3D {
>  	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1270, 1271),
> GRAPHICS_STEP(A0, B0)),
>  	  XE_RTP_ACTIONS(CLR(MISCCPCTL,
> DOP_CLOCK_GATE_RENDER_ENABLE))
>  	},
> +	{ XE_RTP_NAME("14018575942"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1270, 1271)),
> +	  XE_RTP_ACTIONS(SET(RENDER_MOD_CTRL, FORCE_MISS_FTLB),
> +			 SET(COMP_MOD_CTRL, FORCE_MISS_FTLB))
> +	},
> +	{ XE_RTP_NAME("22016670082"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1270, 1271)),
> +	  XE_RTP_ACTIONS(SET(SQCNT1, ENFORCE_RAR))
> +	},
> +
> +	/* Xe_LPM+ */
> +	{ XE_RTP_NAME("14018575942"),
> +	  XE_RTP_RULES(MEDIA_VERSION(1300)),
> +	  XE_RTP_ACTIONS(SET(XELPMP_VDBX_MOD_CTRL,
> FORCE_MISS_FTLB),
> +			 SET(XELPMP_VEBX_MOD_CTRL, FORCE_MISS_FTLB))
> +	},
>=20
>  	{}
>  };
> @@ -502,6 +518,14 @@ static const struct xe_rtp_entry_sr engine_was[] =3D=
 {
>  		       GRAPHICS_STEP(B0, C0)),
>  	  XE_RTP_ACTIONS(SET(CACHE_MODE_SS, DISABLE_ECC))
>  	},
> +
> +	/* Xe_LPG */
> +	{ XE_RTP_NAME("14017856879"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1270, 1271),
> +		       FUNC(xe_rtp_match_first_render_or_compute)),
> +	  XE_RTP_ACTIONS(SET(ROW_CHICKEN3, DIS_FIX_EOT1_FLUSH))
> +	},
> +
>  	{}
>  };
>=20
> @@ -580,6 +604,13 @@ static const struct xe_rtp_entry_sr lrc_was[] =3D {
>  	  XE_RTP_RULES(PLATFORM(DG2)),
>  	  XE_RTP_ACTIONS(SET(CACHE_MODE_1,
> MSAA_OPTIMIZATION_REDUC_DISABLE))
>  	},
> +
> +	/* Xe_LPG */
> +	{ XE_RTP_NAME("18019271663"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1270, 1271)),
> +	  XE_RTP_ACTIONS(SET(CACHE_MODE_1,
> MSAA_OPTIMIZATION_REDUC_DISABLE))
> +	},
> +
>  	{}
>  };
>=20
> --
> 2.40.1

