Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABC52CD6E45
	for <intel-xe@archiver.kernel.org>; Wed, 11 Oct 2023 08:54:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5620A10E4C8;
	Wed, 11 Oct 2023 08:54:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D8E610E5CC
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Oct 2023 08:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697014449; x=1728550449;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=KSeIwDvet0QpJ9fJ4gNvoVhesOgBUeBF2/rQlyf7E0A=;
 b=I+xBdkWEkgsC5NzRzNlo/G0RCRFG8G3yuxWUSNxRMeVeY1N7bA+BRjD2
 f4onNd0zA15eFlrKPmXxMCtAkRm30RKuNGByp723jVtbFwTJFXezgxKDV
 RYsYf5zCI6XqQOV5XHnSi9p1zlkhyfs3S/8Knh5JPc5UkZlCy2n1wfapK
 3c6O9/+GfsOhi8DGCTHX3jSV76M4+XMhozJKOVuZ0W4aQIrTvtFY6mmeD
 KUE65zbEm7w4MMNYw7eQBsa60OAIVui77o06lKmzNeMZAsmdz4d2A2zSO
 uZ5xjTbfNm7E0UQpsoJ0IQ2raukpcGB6nfCJ/oJ8RisvVc0vc2loBHdQd Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="415657985"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; d="scan'208";a="415657985"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2023 01:54:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="927488319"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; d="scan'208";a="927488319"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Oct 2023 01:54:08 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 11 Oct 2023 01:54:08 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 11 Oct 2023 01:54:08 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 11 Oct 2023 01:54:08 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 11 Oct 2023 01:54:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FUJg+33kVZUiTo3AE4IvzZ31ce0EwScgU9NopLVjpPUtyi+/HpnUexhXJT/zVBQH9R3GvHJ96mPzUdRA0RrPgZE/NFRP7AtPAWiPGt4XOPjKv1jMhZxX+wf8Cjrtd/bIW80UlyE4w2QuCR3ieMCTvBSEnzfgYTasrb8GWqUm8Q3l9H1SMtx6yfRezPvga/9qZAhjJ1nQ4WMt1IqBi2QhS9VKCJ8gWWJLYvwMtj7T1+nM52UAHXtH7Gs5W8ll6LFn8bicduoPttFDKEzM6AHEFkirc5G5DfIENa37xVUDyDWFzhXpVvi+xf6kSYeoGcjKj8rO+UVfKjEMhVwbCTkfEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KmJllRX7FpuLFHiZlE168xOTift5ymD+oFSsHxc/OTk=;
 b=DSt7Geh7cuhDTIgICkEdzS0pJ/h2KhpEHLbDL3Z80y0A6wpleK47vOVeZmLpYOzcLVv8LkQiORCs451hUitscjW2Q8pLOXiojwfZ4c3LqU6qGvJOxx8us6zdlbtvqo+6PFOkqGw1FdcBl59EH18PFWIMejFgH20AXPYMvauy9+v74DB5uvKN8nCqFcm/TA0g22/oBnVJi3AXCstqLytcbmk5nb0K4BqMT3Vejy5vVrnVBZgboLF/7PLSVRku1H81hguPGfdXPxNz2lzOGp/ZklKnyFJDo1rVEuD2JriVAvs40a5c6NbV6BkqWGLL5wk7GF7/HCJtWYMxHM/lyNLD0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6360.namprd11.prod.outlook.com (2603:10b6:8:bd::12) by
 PH0PR11MB5142.namprd11.prod.outlook.com (2603:10b6:510:39::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6863.38; Wed, 11 Oct 2023 08:54:04 +0000
Received: from DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::42bc:8d57:e26f:ecd4]) by DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::42bc:8d57:e26f:ecd4%3]) with mapi id 15.20.6863.032; Wed, 11 Oct 2023
 08:54:03 +0000
From: "Shankar, Uma" <uma.shankar@intel.com>
To: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Thread-Topic: [PATCH] Revert "FIXME: drm/i915/ips: apparently silence warnings"
Thread-Index: AQHZ+3SkTVinKgjDkUu9ipb7QQhscLBESfJA
Date: Wed, 11 Oct 2023 08:54:03 +0000
Message-ID: <DM4PR11MB6360AB7E57A81CF3AE7D98B3F4CCA@DM4PR11MB6360.namprd11.prod.outlook.com>
References: <20231010121905.1769182-1-chaitanya.kumar.borah@intel.com>
In-Reply-To: <20231010121905.1769182-1-chaitanya.kumar.borah@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6360:EE_|PH0PR11MB5142:EE_
x-ms-office365-filtering-correlation-id: 95fe3436-a1ef-4bb1-cdc2-08dbca379e8d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NQmjEqFpaNSed/cc0JlmhEH7BrUllENuAdAz+59XuJB/tBCvVlQdiXwQB7Mgu4lcAhjjFfkeJBw0rudkjfzq3LgjQi1WX3PFZO+3AXO5qjj3bZ5d3/xJcRrNs6/qrH+ZL1n1kOk1NG//aMnoTfw2011dD/x5YeL1+bHqbkKvDQHMbRGPmFVthBIWwCx9bONO/HzjJpSQIgxMx+jomtSKIrMW2oNGRu5JsYstBXfpnKECAkGg8AjvWUcg/XoabGEyB0aZl6jJsKZmyPV1mLdDH6epAhyOslcWVFe+ZA8ybM7SEb7T/EYm18RM8Rf932McMy6WLTuHOQ3Ekmeaj0+H82sKgBgTybSTaCFMyVkAy+PALw5S0w88xGZu/Ge1LWhscSWpPwAUHXn2cj93NWA90VAEAXs5iEhnBnCpXMM3nDJEeP/8cpiGQF9PpYPE0urz7XzjRSC8San3BxwdYPtfYjF6laorASozScf/JCrFwWWls5v/aB+QYfzCrEq/sMoNcKH0tk1+H/rgu7r9LZu0KtHLbct+dWYQpdIOFSMXQqYHx7u5uZMEnxXXM9rA3S4YHEItuGyHrPN167DvB8ZSQhQ48XGrTwStAC0Ir6TqxzXcmC+ne3lMQ5SeeO2sRpmw
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6360.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(376002)(366004)(396003)(346002)(39860400002)(230922051799003)(186009)(1800799009)(451199024)(64100799003)(53546011)(7696005)(9686003)(6506007)(26005)(71200400001)(478600001)(66946007)(110136005)(83380400001)(64756008)(66556008)(66476007)(66446008)(316002)(76116006)(38100700002)(41300700001)(122000001)(52536014)(8936002)(8676002)(4326008)(5660300002)(55016003)(38070700005)(2906002)(86362001)(82960400001)(33656002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?hLRE1pz0GDTbpi2/mDVXTehwKBy1/qQzAKNW1ePf8Zk2SJKO0wEsD32agRSL?=
 =?us-ascii?Q?NDUDtLDiyv9+vujwhiZzwHLjc1pkGUHnEG8L303vbj3XP6tZoakygxAeHV+q?=
 =?us-ascii?Q?aeyMQ+I02iITWgCYNLDoSO1Y3YJOJTbdLcihlhlA5mVsFfEWFjjuAQz8Xjib?=
 =?us-ascii?Q?IDpH2wCJXeLzJpCNm/KzHdoP9wnMSpXhV/MohiMIyc660zdJf0jr3wMD8vr5?=
 =?us-ascii?Q?YqHfmWArwzyPOsSsB7AmcSrnmwgy6znWQ3qQiedXKvKo0l5TJGNA/j2nwRpf?=
 =?us-ascii?Q?TXv5eGA6rL7ueyW1BX6rKSzJW7JykIyHcXG6ci39vQOmldTENfxdEhvF2NLt?=
 =?us-ascii?Q?1OE+MOvsdJL4dBBqnVKDbNdD0jSwykc3b5OypbOMnUmq7qJwCnkXjEN/yasq?=
 =?us-ascii?Q?fQLHTS7JsXT1c+s11Ir+yObDaXQuKqiR2JRQlgzXX9fzgaPwHd5FnYoAXI2Y?=
 =?us-ascii?Q?+LUnJNBTIj/+OyDAN9bgLyjHvr0tOhPV/dRsKI04TBnuRJcjU7Nu2Cg0YWbs?=
 =?us-ascii?Q?24VmMn5qoiTYk0u+jfLdAEBJXh8LmZRb76ulvGB+Q4/JDPPBEkmS5RAZHKJZ?=
 =?us-ascii?Q?DZ6cXG9X5w/Ss/+S+qv2sfTz75ntrieVqhQ4gjEYUOUZTJX+PInB2egkkPGp?=
 =?us-ascii?Q?p5HLUGM4nHNcybNtQWCk6sOS0rxKZj0if3KitwxFSGfqhY/R4TGtyJLk26py?=
 =?us-ascii?Q?vImLzmvkeKeiuB3Ras4fjk5rM/880SDs7ETELXAi6/7c83ZwLrihTMbtuHSW?=
 =?us-ascii?Q?HoO//lZIxvfzStByIwNYjUBP8O+bHiuHuuS4Nr/X1KqcIdFU8YSU2yL0Rq3c?=
 =?us-ascii?Q?KY8V3YxpA0AfpOmvC4Z5DxDdWNLYY2bwhbys45MDXF6smSlWuL8awzEijGem?=
 =?us-ascii?Q?T2U71yg14Mpnvrxab2b+3TR1eR2+v/u2Bv8lqM92v28gAjhm8qItZYUuOr2f?=
 =?us-ascii?Q?XoEAagTpWFWj124XSravQKACB/vuEVW9Gv7Z8XugFaM+a/sCFknZRJ0t2J99?=
 =?us-ascii?Q?DPPt5IwbqXBYQq4Jbv65va/KWYWELSAcnmYerst2BKG0yImtPFht+alBm2BX?=
 =?us-ascii?Q?1BkrLKVFbP28cM10kBZ7OfH7tG9NfCIE6Mp41go3BD5UHhqlCFVBlhG4uHR9?=
 =?us-ascii?Q?0qWeb4F1bG99JiiXkQwOZyhjHLUEOjB9Qe9Wa7taA1mYnalEL3Pj0Lxhq+RD?=
 =?us-ascii?Q?ccCWobk0Av4pAaOjs8RSVBoQ2wan/HAPfAAa0GBmvujZIRmSLAD2eM7J026W?=
 =?us-ascii?Q?ozy4pCyU4L3cFYH47p2ONomHYri3YQqGSjLFLNkpiZB1BVQ6UIyBMbyiBW/R?=
 =?us-ascii?Q?6ngZOShzfeBi46/dTkHUUhQ5NhWF34df19rnYHYj72BC/W2NTxfY6bWhg2Rn?=
 =?us-ascii?Q?gS0UDjW29Zj9PNydQ+1zMqQ5A6pSZ7NPkVEMi3YfqoRGNd3gRkfyn9EmiWSm?=
 =?us-ascii?Q?JEcMNIOH0XE0Jwd/VWgDmPGw3IlDt6Y3XZHsl3ixEU3oeFhfb997RfDQewtF?=
 =?us-ascii?Q?fTQAFoYj/qdFvuIJ5HKE50JNnc3PO+HTdAP7uop4ATfruX5yx1dBmRBHAEux?=
 =?us-ascii?Q?6j3QZudw57h6xGJPQObFgzLWZU39+96cQ3Hn+l2g?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6360.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95fe3436-a1ef-4bb1-cdc2-08dbca379e8d
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Oct 2023 08:54:03.4657 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Gwl1wJAh2JbFV9PIQjSb3WFbBRN9kEO4qArH3cy+5dY6QIde/Pj9BssQVCc6XGzRPCxCe4CEStVz8Tjn5JgIUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5142
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] Revert "FIXME: drm/i915/ips: apparently
 silence warnings"
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
> From: Borah, Chaitanya Kumar <chaitanya.kumar.borah@intel.com>
> Sent: Tuesday, October 10, 2023 5:49 PM
> To: intel-xe@lists.freedesktop.org
> Cc: Shankar, Uma <uma.shankar@intel.com>; jani.nikula@linux.intel.com; Bo=
rah,
> Chaitanya Kumar <chaitanya.kumar.borah@intel.com>
> Subject: [PATCH] Revert "FIXME: drm/i915/ips: apparently silence warnings=
"
>=20
> This reverts commit efdb834bbd7c6cd80e018dd0c0935070f2f27169.

Reviewed-by: Uma Shankar <uma.shankar@intel.com>

> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_display.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c
> b/drivers/gpu/drm/i915/display/intel_display.c
> index b28b4b718a2b..4b73db93d23d 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -4199,8 +4199,8 @@ static u16 hsw_linetime_wm(const struct
> intel_crtc_state *crtc_state)
>  	return min(linetime_wm, 0x1ff);
>  }
>=20
> -static inline u16 hsw_ips_linetime_wm(const struct intel_crtc_state *crt=
c_state,
> -				      const struct intel_cdclk_state *cdclk_state)
> +static u16 hsw_ips_linetime_wm(const struct intel_crtc_state *crtc_state=
,
> +			       const struct intel_cdclk_state *cdclk_state)
>  {
>  	const struct drm_display_mode *pipe_mode =3D
>  		&crtc_state->hw.pipe_mode;
> @@ -4243,7 +4243,7 @@ static int hsw_compute_linetime_wm(struct
> intel_atomic_state *state,
>  	struct drm_i915_private *dev_priv =3D to_i915(crtc->base.dev);
>  	struct intel_crtc_state *crtc_state =3D
>  		intel_atomic_get_new_crtc_state(state, crtc);
> -	__maybe_unused const struct intel_cdclk_state *cdclk_state;
> +	const struct intel_cdclk_state *cdclk_state;
>=20
>  	if (DISPLAY_VER(dev_priv) >=3D 9)
>  		crtc_state->linetime =3D skl_linetime_wm(crtc_state);
> --
> 2.25.1

