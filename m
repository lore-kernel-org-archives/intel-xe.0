Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A5D6EE4993
	for <intel-xe@archiver.kernel.org>; Mon, 21 Aug 2023 13:16:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9B8410E24F;
	Mon, 21 Aug 2023 13:16:45 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C65C810E24F
 for <intel-xe@lists.freedesktop.org>; Mon, 21 Aug 2023 13:16:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692623802; x=1724159802;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Q/JBhoW3vNVv7YtXMxmywsBUERfJaqomCtksBsC+0ik=;
 b=KxN5LMwKsQwLckb2yu+8m6846KWX8lBzX+rO3gf/ywh4rSxXJxnFX+FG
 zZ4SeNGp7KgGbYq0L9uakX3/weQ5DpCzC879MoXbreK4cWaNqT5LQ8NuV
 cg9b2l6I1yXCaoortcSAH++KjuSKSO9YepRJHRIGzW61pONyYr8heTvHI
 Rg65p1gIOHLa7zOsTiEpapSb/VSSyUZDIGqbFF++eDxL6OrLp9yPunAxK
 XNWp0PgBH8HlOkAAwHLspbOyCdHdmGit9k97ancI5QSw2Yqq5spwd5jM/
 LD2Rt72Wy9qiBTlP40RCH+q3KaeJMRm3oYL28GPfJ497fOONdvprNbSf4 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="377323402"
X-IronPort-AV: E=Sophos;i="6.01,190,1684825200"; d="scan'208";a="377323402"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2023 06:16:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; d="scan'208";a="879506385"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga001.fm.intel.com with ESMTP; 21 Aug 2023 06:16:45 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 21 Aug 2023 06:16:40 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 21 Aug 2023 06:16:40 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 21 Aug 2023 06:16:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MrWINrBS1oiXfAN6+uJOcG5ZVgoOF13e3aZe7VW/zVh5yU//E5B3GUWk1urpFnaY4GGOVWJSjbF2nP0Cyztk64EFMwPNSU1Vcgd5VQb2bfxM3yaocbrVu+Y1q6s8KmSNDfVdhMqMZy9/Q6fXDusyMky930OiHiTKekR5TVib/CTMT+wjPKpJw+P0w89QKTPJEcSfcJNzBP+M1ISRAlbgTbouzTGQK58lHLdfMAsohscp2dDfkcQgAAVlEo7wGvGr9GgeAiZJj4wEH3szqX53rupIvJBfF3ORtRH5bf+xGqXxQIjeI05wOTt7LjPLulxcykwMmlV/omfxXPxyolYq+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kM1dM8fW5xPsNnYwInYHvZuZDwaOuKfLEaDFiJ+NIa4=;
 b=KvcoidpC1c1f7ngox8Cafd/2OBHAW0yG0UFuiIXPam+dU9mKuJDKUKUW5RAU+g1gOlRGm6gRaeE39x3PrquRUY+2m5HHLKqWNthrKHv3f/V5mXkUu4fqk8uwv8pXgw7xNqfvU/cUM0cM0VNJVTjQ9eDCtxkxmYa6KZrdCVqvv2hdCHnpydxRfHCnSsfXV0kiAGAjPkzRzJdcUziCGjyrbcZzmytzvzDCDOxcDW9LdeVLrnUBgJiZc3S75s/dSlwvPGHDxfjdaJD9cjibIELpVTzv6b16ZPgOpd0rBQchcCX/f9MtXQc5GADNMxuPEJnF9kF/GmNHFCc9aT+7UvB3qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6211.namprd11.prod.outlook.com (2603:10b6:930:25::6)
 by SN7PR11MB7567.namprd11.prod.outlook.com (2603:10b6:806:328::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Mon, 21 Aug
 2023 13:16:37 +0000
Received: from CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::bddf:185b:23c:241]) by CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::bddf:185b:23c:241%7]) with mapi id 15.20.6699.022; Mon, 21 Aug 2023
 13:16:37 +0000
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Thread-Topic: [Intel-xe] [RFC][PATCH 1/2] drm/xe: Add a couple of pcode helpers
Thread-Index: AQHZ1Ca0JrlKb9O2R0mgbyQY1MAc06/0ujNw
Date: Mon, 21 Aug 2023 13:16:37 +0000
Message-ID: <CY5PR11MB62118E5479707B19C5DC0929951EA@CY5PR11MB6211.namprd11.prod.outlook.com>
References: <20230821120728.3871527-1-sujaritha.sundaresan@intel.com>
 <20230821120728.3871527-2-sujaritha.sundaresan@intel.com>
In-Reply-To: <20230821120728.3871527-2-sujaritha.sundaresan@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6211:EE_|SN7PR11MB7567:EE_
x-ms-office365-filtering-correlation-id: 279a6251-7160-4e0b-9dc8-08dba248d9c2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WY3Rs8N0iHuIibX+aK8ZpR7kFCTyhZShm3g7tI/nSf1Y0SjV7s1GUCsuis/6iVODOOM/5yXJhZ21QnnchtzvfLlVThg8qOyKn8rnHHvYYcIEH3lqoR9vK4MDiPGuDPCrlS0k8pfLfuMX84dM0zHkvDQ1vUC2P+TnZiD1MpMvWibe1xoJj+6CNmXKDUBjZMRtvJvZyrX7OsNCFlQJfPIFqCyiX3AYZxWR8c+htNvRLVq5Cynu5ZoMwzBzSmsYSHj0whp2fQOlNxh/Fuy8uW6zsomdCl+tSyAg+YxKQgArsY7VpjR63QZnNI3Wfj55rH2lB3RzwJZa8W72Zwk66tma1mf20BPq63UkNzPMN95p7obmLikRjzVCY46rRvAKFtZ7i5PO3zo4XGhcQkH1zQ95WZgYe+8u4LWNb9SNoQQwLG4psvEbTyvhrXu7V3YrOZEG36VG38T4ae55H1EeVWOD2O3ZculOFz6r19TMimrh6DjG89lNEfsGDU+FLLCNHk3Ee1OK9BAlH+QM4Ym9gexdT8YZNrqMdU4O2raSklM5jIObePfiUrroaFRdPcTwneDGg7TZU5KOUtto4CL8nKCsfIMTiwi8/kMUkCDV5BZObzOYeM93jv1XKFyHcG5Ux0vy
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6211.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(366004)(39860400002)(376002)(136003)(396003)(451199024)(186009)(1800799009)(2906002)(53546011)(38100700002)(38070700005)(6506007)(83380400001)(5660300002)(52536014)(33656002)(26005)(7696005)(86362001)(8676002)(8936002)(107886003)(4326008)(316002)(9686003)(66946007)(64756008)(66446008)(66556008)(76116006)(66476007)(110136005)(82960400001)(478600001)(122000001)(55016003)(71200400001)(41300700001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?75UHMg25x/E082wallcXuFMw3dtTWvU68M8B0JeyHkGo1XwMvMmn+EvAsazN?=
 =?us-ascii?Q?mHxVZOWMjop9EICynjfU07yhWBDp41KVwa2jjGcbn5WuX6sZiugMd8ZxGQYb?=
 =?us-ascii?Q?odH3YUAOh9iRTvRjanUJJ7K6iOvrrlh2lObJoCvC/qNCTKKDYEhXS95VK76K?=
 =?us-ascii?Q?Xl+dOhW8oQj6CP46YjZ/rO5mMQ1bOzNDd+kMWe06bne2UZM/j3vBkrYwjCE3?=
 =?us-ascii?Q?0MgnaTsCoBbGBy2HCiJ4t8uULO8Fsojuy/wxmfKAZBtjR1kUxX6CyRaZKG/V?=
 =?us-ascii?Q?ZlIUS9Z9IxvFl2sXJZmJCr+gdhWWvCP276mTc9Ot+Gak52VlYKwyjQU56afH?=
 =?us-ascii?Q?PlaXsDR/kO/1jzIxmwPAc/51HRJyKOrSCu2UXGjCGmjo5PsK5y96/gxqe6+b?=
 =?us-ascii?Q?EaKP3NyeGE+dlgp1IbkQpB/Yhkz8n61sElWFKyfJqnCQaXyfxIHbT0qJPOxU?=
 =?us-ascii?Q?3nAiTx5n4cmtsrASpycjzfwY5lqf1S+HhCwGKY/PdUcmXp5cz0G59/ZKq1zT?=
 =?us-ascii?Q?XUcvGQBDXo7ToHPoq+kEeAnoZNwP8sZW/FM1slfJ3pzlkDTjFhm0AbiSa3lZ?=
 =?us-ascii?Q?6nq5Ktaj3sEuVYs0dvA09MEV4Eg0GqSr2Cb/CNTV/tjXpsvMoX7dlQRikKBN?=
 =?us-ascii?Q?sjv0rfD/mlnMbHSq6ayr802ROoMY8cn1bhSupUokX+Ty0GxeYedlX7zKzGvM?=
 =?us-ascii?Q?0TT6ZRODY3LkqIfwguLYPofrkeLCxmlj0JvXnoFT6Wi1ep3NND/AoySycNmw?=
 =?us-ascii?Q?vHe8e1MdVLYHbsbMIJ05nYL1ypkg+BnjJnQVOAmtIxGyZT3gm8SlkFhMMm0Z?=
 =?us-ascii?Q?0pzLxClCiNlbYvEz8vvogA+isBvdeZ4FQfxbllf6uufDne2GxPP1dc4tQoqS?=
 =?us-ascii?Q?0WjlKw3+5peZWjm6g00F2suuB4bL7GQMPj18rrwqVc1OP6d62n22E1QCG/1r?=
 =?us-ascii?Q?C5ekhWgtBuNW4POcoCUr1i4CLhuS1pPdp1whmrHvRSAHxT66aPfDCv2jZDFl?=
 =?us-ascii?Q?Jgskm3nX9sNwCdlOA4PM3k2we7r/08MbskdfLWN9BBrjHW4kYVy270qleHhH?=
 =?us-ascii?Q?MdqJw5KIXHX/+t9+g2OEndYXqv3zVzGh4PvPwHG6fnQYcrYgPmz5SyDSsjsG?=
 =?us-ascii?Q?8P1Gey59/Ik4ZA9me9sGAZ6s6BLqwrDuwF2os+xJQ2ZGcpRMP69JqQ8KCRoq?=
 =?us-ascii?Q?DhzeZ+k///p4Mem/bDxNEVRUZb651oMdX+LNBoI+Dj6cSpypIzVCDjR5OjB8?=
 =?us-ascii?Q?Nu8qkp/nxmdEY8zJ8mpiEwJQfO34mSleO6F9DYPjUEVFhrXBoGYNFznbjHB9?=
 =?us-ascii?Q?+1RnSwAIi89YsIvcwdL2hFUVckBmuIJGmPF66ojAwcg8YG5r3gVjEWVu7QAk?=
 =?us-ascii?Q?pu0IZDZRoJoQnvsDG61osm7NITtov0MZpKw3dE1vfTA2k00FdALKxe01mEj3?=
 =?us-ascii?Q?fIGFhePEMJJj3p9AupBk8+Q9VbhjI98+Tc9S85c+RgNBCR2HDSmnvt1pxqws?=
 =?us-ascii?Q?rTX0ZlSLW69PfNmrqKaXkz5APB0fclJ17jDBKuRO0r9F11ABDNQoPF85Tml5?=
 =?us-ascii?Q?Nx/WMtI6STSpD9dhULG8llaNtM8GjZ2uDb8Crp/8?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6211.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 279a6251-7160-4e0b-9dc8-08dba248d9c2
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Aug 2023 13:16:37.7376 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XJgtFadCmwAzoRu+9zHhwHX6ebuIIlGW73rMtK8YXbfHbWrGgfpehR+aDrWZb68W5ap2yNzrvAOr2DdLvI6xpv2P0Zmek390BUf0CqLb5hs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7567
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [RFC][PATCH 1/2] drm/xe: Add a couple of pcode
 helpers
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
Cc: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of
> Sujaritha Sundaresan
> Sent: Monday, August 21, 2023 5:37 PM
> To: intel-xe@lists.freedesktop.org
> Cc: Sundaresan, Sujaritha <sujaritha.sundaresan@intel.com>
> Subject: [Intel-xe] [RFC][PATCH 1/2] drm/xe: Add a couple of pcode helper=
s
>=20
> Some pcode commands take additional sub-commands and parameters. Add
> a couple of helpers to help formatting these commands to improve code
> readability.
IMO we don't need this, instead I would prefer to have a macro in the calle=
r of
xe_pcode_read, which would convert the pcode params to mbox.
Thanks,
Anshuman.
>=20
> Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pcode.c | 28 ++++++++++++++++++++++++++++
> drivers/gpu/drm/xe/xe_pcode.h |  3 +++
>  2 files changed, 31 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_pcode.c
> b/drivers/gpu/drm/xe/xe_pcode.c index 7f1bf2297f51..e45169f47500 100644
> --- a/drivers/gpu/drm/xe/xe_pcode.c
> +++ b/drivers/gpu/drm/xe/xe_pcode.c
> @@ -104,6 +104,34 @@ int xe_pcode_read(struct xe_gt *gt, u32 mbox, u32
> *val, u32 *val1)
>  	return err;
>  }
>=20
> +int xe_pcode_read_p(struct xe_gt *gt, u32 mbcmd, u32 p1, u32 p2, u32
> +*val) {
> +	u32 mbox;
> +	int err;
> +
> +	mbox =3D REG_FIELD_PREP(PCODE_MB_COMMAND, mbcmd)
> +		| REG_FIELD_PREP(PCODE_MB_PARAM1, p1)
> +		| REG_FIELD_PREP(PCODE_MB_PARAM2, p2);
> +
> +	err =3D xe_pcode_read(gt, mbox, val, NULL);
> +
> +	return err;
> +}
> +
> +int xe_pcode_write_p(struct xe_gt *gt, u32 mbcmd, u32 p1, u32 p2, u32
> +val) {
> +	u32 mbox;
> +	int err;
> +
> +	mbox =3D REG_FIELD_PREP(PCODE_MB_COMMAND, mbcmd)
> +		| REG_FIELD_PREP(PCODE_MB_PARAM1, p1)
> +		| REG_FIELD_PREP(PCODE_MB_PARAM2, p2);
> +
> +	err =3D xe_pcode_write(gt, mbox, val);
> +
> +	return err;
> +}
> +
>  static int xe_pcode_try_request(struct xe_gt *gt, u32 mbox,
>  				u32 request, u32 reply_mask, u32 reply,
>  				u32 *status, bool atomic, int timeout_us) diff
> --git a/drivers/gpu/drm/xe/xe_pcode.h b/drivers/gpu/drm/xe/xe_pcode.h
> index 3b4aa8c1a3ba..8d4103afd7e0 100644
> --- a/drivers/gpu/drm/xe/xe_pcode.h
> +++ b/drivers/gpu/drm/xe/xe_pcode.h
> @@ -19,6 +19,9 @@ int xe_pcode_write_timeout(struct xe_gt *gt, u32
> mbox, u32 val,  #define xe_pcode_write(gt, mbox, val) \
>  	xe_pcode_write_timeout(gt, mbox, val, 1)
>=20
> +int xe_pcode_read_p(struct xe_gt *gt, u32 mbcmd, u32 p1, u32 p2, u32
> +*val); int xe_pcode_write_p(struct xe_gt *gt, u32 mbcmd, u32 p1, u32
> +p2, u32 val);
> +
>  int xe_pcode_request(struct xe_gt *gt, u32 mbox, u32 request,
>  		     u32 reply_mask, u32 reply, int timeout_ms);
>=20
> --
> 2.25.1

