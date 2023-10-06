Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47E50E92FDB
	for <intel-xe@archiver.kernel.org>; Fri,  6 Oct 2023 03:20:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C657710E1C3;
	Fri,  6 Oct 2023 03:20:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA54F10E1C3
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Oct 2023 03:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696562432; x=1728098432;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=XSehDSzzq0Ehzi9MJxQeF80cwihmHdg+cNUI/xXXwBs=;
 b=i+k716DPQhJr3bE0EL+r/pp0VKTH9ibDtBy+I3nNbVm54dLGNxOXPqJU
 L3Upspd0RgHHvWghLvFu2IZtIYaU3oae/GwYSutedcyDO5jDnvthRFy2k
 Yt4hVyq1YuaX2RNkcucJOivb94Z4tkgvOprDLFR3IdTjLvzhwhDDZGQbo
 klRM+yPrslrQa7b4GSQT6n4RfjeGxsmLdx6mbmix1fs9TQqQVWi74zui4
 GWH3C9I3PTWC3jeYGErwHzWpiH8miS71/MyOKf5BT7MXrzobdw6PupwLS
 qCtJxfVuJIf7dr1VF6kNYEO190VxVlgr7R7xYvZuIE3k1upELan4mzzyH Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="414653826"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="414653826"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2023 20:20:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="701904795"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="701904795"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Oct 2023 20:20:11 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 5 Oct 2023 20:20:11 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 5 Oct 2023 20:20:11 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.104)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 5 Oct 2023 20:20:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lqljpYRsWFiDCY8vefJBE/1FDKnyfyxeTSK+Gg0pNjAclPWtJddaz/gvCYOZsNyyDyiKHlSZX/SyXIbvDCrrdYVGa+/NprLIj4SJvi8wHRGyCxDXOMyVtjh7GP/D8lluQ6j4LLXOeVnPIBN6T/HxGcV47p+ud8CtrwxxV3x0tbFx9FYVFrh57WIhMvauzAitvNjTrSx+YywDTCWAERFWKmwwlp0XL7LAwyqr/ZbIQ5iEYvocO/KLlMsHfAL9WTzSm0zpE0SojXYyZyEfoFSaj9n+oIHyMacIHTL7ZZJ41B6G7Jp5ja7S9d0WJeeEuBnN+q7S6yd7TuRsC1J41SLA+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VcqmuVxqJe8xjsYa/B2zmt/ZZ1Hs1AxI70A6g3LRvcc=;
 b=k+coK8w7huQohWYQ2UXycSPQA/f8ltGDttaboaimy4UWk6h4b/FviHKAQX27rl//4N7NRDd7zuQIT2mgLGCmN7OZ7HNKe/lXimMgYedIQ2MejN8DYeQ5EDisxdTPIMW5q1OLXPgfMeQAOyRELvhuUQlWCT/c4rplk85udmVRoXAgLF/ZcgXjmeoNm1GYt2AUbzisJmS2TIwc6fX4UO8d+zHmFeT9rqSxzJxohQpMYG59DWQeX0FNpvXt74GlASd6+ffBiS4Wk7YI7IvJ6sD8jCZW7gVNfxNqY8W42tzh4q3xYk6rERP7oa0QOG171eKdjGULJ2faTlDWdTVwc+0G9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB3177.namprd11.prod.outlook.com (2603:10b6:5:c::28) by
 PH8PR11MB7072.namprd11.prod.outlook.com (2603:10b6:510:214::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6838.34; Fri, 6 Oct 2023 03:20:09 +0000
Received: from DM6PR11MB3177.namprd11.prod.outlook.com
 ([fe80::c013:26f7:5743:995b]) by DM6PR11MB3177.namprd11.prod.outlook.com
 ([fe80::c013:26f7:5743:995b%6]) with mapi id 15.20.6838.033; Fri, 6 Oct 2023
 03:20:09 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: "Shankar, Uma" <uma.shankar@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Thread-Topic: [PATCH 1/3] Revert "FIXME: drm/i915/vga: disable vga set decode
 for xe"
Thread-Index: AQHZ95MsH1HULEuwc0OhP76QIaVkBrA8GKkA
Date: Fri, 6 Oct 2023 03:20:08 +0000
Message-ID: <DM6PR11MB31775FD2C9BC417A07C1D2DCBAC9A@DM6PR11MB3177.namprd11.prod.outlook.com>
References: <20231005135918.2345364-1-uma.shankar@intel.com>
 <20231005135918.2345364-2-uma.shankar@intel.com>
In-Reply-To: <20231005135918.2345364-2-uma.shankar@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR11MB3177:EE_|PH8PR11MB7072:EE_
x-ms-office365-filtering-correlation-id: 29656534-65e1-4cd3-9c0a-08dbc61b24ff
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: r0vTdF2vHI+TEJObNX5NASGiKh+XzfJAEltKQY8hfhjhzdA48dHzl08WpzUOpCtA2ZfOZ8oif3cT5/ZB7OwCcCmPsoG+AnXMQtAcButkkR77Gmik62HbkCER83XZ5GogqTY7m1c3ylSsiGKjtt/vV7SQ1WrQhZDrKaybUSXZtCKrezgpyzzIfhWjaWKtrhVyBEFKeoOMqb1BWRYLHw1mCIVAPhTQft0zdFV848WIKoVZ8Fm3kqwhz2w5RyNE3jvi1690f4+cdK72e0akxoxF34Y1I7T3DW1/efXZOx+b8D4EpTRoSsUoxBEBGWlisgJQmpNRlpqHyXlaDjZWNsn4B/CM4kw07G6QEf6foxMKpJ69YhLR4k4u1v8gDdoqsYFcGBiucnzLnZT+WFavavJz7SCj8CZmO/sROv8V2Vrkxqlu42I+4nxy6v2zAS3kcv/X7RFt8IZbmtVozK6RzgxjHxxUS8NbOTFvDl35F7KPmQMyjRyCR6dWv+5cC9xf/TJ9f5MD+qOYVUYQg6ffUbaFky1/mXoz5w/3rTT/797ZKKpMXPVmJm+dg5Yx9JQBjZejZyXDfqJcywKPsIFUO7NynsMa0waHJtQZKXpyuSuwYAi2n10BHenQfGZkvJpZlwS3
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB3177.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(346002)(376002)(396003)(136003)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(8676002)(107886003)(9686003)(6506007)(7696005)(53546011)(83380400001)(66946007)(26005)(71200400001)(5660300002)(110136005)(4326008)(66556008)(76116006)(66446008)(66476007)(41300700001)(2906002)(64756008)(52536014)(8936002)(478600001)(316002)(38070700005)(82960400001)(38100700002)(55016003)(122000001)(33656002)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?7rvGyl47zrZ7CYACahl2twZ7o3xGXpqHiJnmGHYYoqwQUx9ktr6MUb8JHqqU?=
 =?us-ascii?Q?fvwNmr/ilkvC6bruNNuY3eQT8g8hLUWnRSk9oLWcOxhLcUghXGHci2lKfOzm?=
 =?us-ascii?Q?8L8Np4Avh4xZuWnS7yggNbeX3PZDMlB0TAJ+EYai9TcddfgP/D72/wsLxljy?=
 =?us-ascii?Q?485kEW3/LLLH098wagIm8E5mhSz7ORYajSctWD4ZCQ0qafo8Y9GPZlZgCRUU?=
 =?us-ascii?Q?fNrpC83fBw0SE6squTc4SFphoK3tmnIJs44XLB8qc9dleK2UZoLy+zYPLWDX?=
 =?us-ascii?Q?8DXSUqBKT324RWJ2lvy/nN5U4QwCNcmXcVgbUYIV4XTR85TlZeeoX7gUwfAW?=
 =?us-ascii?Q?eJyQdJad9W4BPrQegLq+BSek3kb8Jt2rcjruZrUC1Bhzbl/DmrvSQ7O70rgk?=
 =?us-ascii?Q?PAT8Z2mgqPo5lz6Hgc4wJNhJLkl1ktYKDUSwUt5oaDK13s/KOj1s0fiAcF/N?=
 =?us-ascii?Q?U7Pi6mAelW9fowPv1xh5ffE2bnVTP5GGlmILrwCU8R4ED2JvHyel+0R8T0Mb?=
 =?us-ascii?Q?OHptukYU8AC7+VnlpJyU6KPHrjiUmExl05ws0AyzlDuxdHuXVPdgxOKf5dNo?=
 =?us-ascii?Q?D8O6BuhkO44+MVy13WwdVTtMvlB7dC4OVl+mZatAIVVJY8/Fel2GKHEfulVx?=
 =?us-ascii?Q?hX8QkxWUFojMS9KOltfTntf7tXtVVaATO556lRBMY7yxR4bL0bNDz3Fa8hdn?=
 =?us-ascii?Q?uXBD5LpKXOgQbq/+GL/9F7CRAUCLl/lWIPT/3REYdXx6kgLFVWKx6l9nnoyW?=
 =?us-ascii?Q?tDMjYz7kGfO21aYrgLC4cVmK3ZdbbKRKaDljNmUkKUO2BA73xnhaQUnymDhw?=
 =?us-ascii?Q?f3Ki1TRh1tye61BkV+1bIiD4Fs86bObcACT8L3U0ucJJcCY/meE8o5QHDFXB?=
 =?us-ascii?Q?skvwxCeec/oXR6IOXKVABskMU00Hu1Lud4Ep2EFkycrmYXEmF9/NLBeuXObt?=
 =?us-ascii?Q?RqeFBEQl7inc29P4Yu2NNKdOpeg7z5sJqIG1R+lnmLOXlQb9FcForDI1Tu3t?=
 =?us-ascii?Q?ciLSUnZUdtQgw1u3YRUsI+6OLnJZ84gDMWVPWTI47x7VvRaEkDzFtTyYzv0R?=
 =?us-ascii?Q?zMiKGYCmqv92DzVE1WbxSl3XAF0sIgfk77bcBmrWElqeQGx3G57xsei7M0gI?=
 =?us-ascii?Q?VCdA9w4UL1gn5lmzMxYefGtgcay1nx20OVD3ykRRpo+dEgZeSLrYPp0I98Ji?=
 =?us-ascii?Q?MEMcn3jBPZ5qR0CXGC1hoOzKGCR9N1zXxmbu1pdqafcTPWdk8AlSXWNxC6Pr?=
 =?us-ascii?Q?nA+raR0inA2rQDqSTOTZIP73S5foj65psj1JTJHizHVZ9NZKxEIRTdVYbWkP?=
 =?us-ascii?Q?5ROITbxw+pTdnEpaLZweVLl8u2a12gFtzu9K9Qd9ULIBgVG+yWpTkds0g514?=
 =?us-ascii?Q?c6ljfG1brnmiiBVfqSKU3aFWwJ8lq5RAT/gYdkNljTHseC95V+zqAr4KMAe3?=
 =?us-ascii?Q?SaPwbwFNBlNwllRqysSCZRUXOtLwcn+UPOKEb0cbZLYot/Xrj0dzC37f7tXE?=
 =?us-ascii?Q?fO6LYL+g0S/uCDFOkwe6PPFJsizoB8FByAEB3qgLweKuFd1XUSB6e55REYPx?=
 =?us-ascii?Q?2+akiZ6Xjvmmm8fMTc74aa+lUZARLQ87m+zG2kHW?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3177.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29656534-65e1-4cd3-9c0a-08dbc61b24ff
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Oct 2023 03:20:08.9699 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zezkROJ5tpx948HG0BO+1BH/CIzLIQS+TvFBuiMUYsDqpA42TArmmsF54QVwcXFZLf/GqUBBUDm5aRbUPKCfJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7072
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/3] Revert "FIXME: drm/i915/vga: disable vga
 set decode for xe"
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
Cc: "Nikula, Jani" <jani.nikula@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Shankar, Uma <uma.shankar@intel.com>
> Sent: Thursday, October 5, 2023 7:29 PM
> To: intel-xe@lists.freedesktop.org
> Cc: Nikula, Jani <jani.nikula@intel.com>; Murthy, Arun R
> <arun.r.murthy@intel.com>; Shankar, Uma <uma.shankar@intel.com>
> Subject: [PATCH 1/3] Revert "FIXME: drm/i915/vga: disable vga set decode =
for
> xe"
>=20
> This reverts commit 28da6179478e3f29cb27df30b71f68b904dfff26.
>=20
> This will be addressed with an exclusive version for xe.
>=20
> Signed-off-by: Uma Shankar <uma.shankar@intel.com>
> ---
Reviewed-by: Arun R Murthy <arun.r.murthy@intel.com>

Thanks and Regards,
Arun R Murthy
--------------------

>  drivers/gpu/drm/i915/display/intel_vga.c | 4 ----
>  1 file changed, 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_vga.c
> b/drivers/gpu/drm/i915/display/intel_vga.c
> index 42da1a038042..286a0bdd28c6 100644
> --- a/drivers/gpu/drm/i915/display/intel_vga.c
> +++ b/drivers/gpu/drm/i915/display/intel_vga.c
> @@ -102,7 +102,6 @@ void intel_vga_reset_io_mem(struct drm_i915_private
> *i915)  static unsigned int  intel_vga_set_decode(struct pci_dev *pdev, b=
ool
> enable_decode)  { -#ifdef I915
>  	struct drm_i915_private *i915 =3D pdev_to_i915(pdev);
>=20
>  	intel_gmch_vga_set_state(i915, enable_decode); @@ -112,9 +111,6
> @@ intel_vga_set_decode(struct pci_dev *pdev, bool enable_decode)
>  		       VGA_RSRC_NORMAL_IO | VGA_RSRC_NORMAL_MEM;
>  	else
>  		return VGA_RSRC_NORMAL_IO | VGA_RSRC_NORMAL_MEM; -
> #else
> -	return -EIO;
> -#endif
>  }
>=20
>  int intel_vga_register(struct drm_i915_private *i915)
> --
> 2.42.0

