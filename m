Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 959B1C4332F
	for <intel-xe@archiver.kernel.org>; Wed,  1 Nov 2023 18:51:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5677210E043;
	Wed,  1 Nov 2023 18:51:40 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E4FF10E043
 for <intel-xe@lists.freedesktop.org>; Wed,  1 Nov 2023 18:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698864698; x=1730400698;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=1IpRGWf2Ucu0X8XHxe6Fdq8g6HS/F4v34O2NiQHhGaE=;
 b=jHkj7tGzSXHSRhLyZVk9bE5fLwTDOQt7uANL5LqdTEUeTU+92ufaKqJS
 /IQfkFNYx8u620DNTF1uHC0o+4gKC9TCwL34r3SNHuysIuhgsPZ5hBI1/
 GwFk2QRPgZbzmiPEDtMewY+imZOBsFr1fLDUUqq2UdXygWQ7sumQCz8Bp
 uvqp/VobYC/LJmi2aQHHIDoRBTnXPdyDifnqb5L39hriyXFEgkzjlDRGg
 YklNKxfXBt1izKrrwU9LoG/pWjxmrgWjntnU29eaXll6IjU8eIgEYc9Aj
 ZnEKQImYDUR2euTXN/mXGdTYQ5t5a2laUOCHAKZLK79AZe6WzL/37c8BI Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="387440701"
X-IronPort-AV: E=Sophos;i="6.03,269,1694761200"; d="scan'208";a="387440701"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2023 11:51:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="826860660"
X-IronPort-AV: E=Sophos;i="6.03,269,1694761200"; d="scan'208";a="826860660"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Nov 2023 11:51:29 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 1 Nov 2023 11:51:28 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 1 Nov 2023 11:51:28 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 1 Nov 2023 11:51:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JShunqG2G37ju7gS0nWF5UMPQq7J8hus7iDwfqFFJaYwxFb5/1/5EECchhxNdjLFoJzYyONf4aDCDEH05TNaC2wfWfMDG9POMunhG+9+2XznNmQtonPn8AIE5A6T/glqHVCZYAFOqUSxw3RRXAm0+hNROA/A3U9UgBRfxFL/i6FMfLN1pdi+IYl5UIimpeTgDT5FNCGfzhPN8UGcsnWUo2zstNRyeFivGvB5Vgotx0zTleZBszVHjFAgoyhQTusHf+ivryEt8/SJ0RJapVosdXXRdWIyODGZa9NFXS+lz7cx7TiZorcXiD+E56hEVzf5u3afimUcttRNyNrmVCsXbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k4mRmBdeVTuVqu9JB5xgnTjMRiBiE2R5L3p1ZTu0WtE=;
 b=CMn9m+UZ+f+9L9RmCRgwrTHjKg2u+9ynqznxBweBok103awJUnvw0wruDyK2y4s8XFvDge/Ox9LKMwyzvLtPlm1JuBficfZOo5x1d3Q4A/DXpZfgipPVx4+W30GBKq/qN+oOYx/5bs4CIhhuNflhaQ7kEZBs3A/aXGIZX6NyeZYuj2FxJINITTl2Bjdrr1RxhyR4VSGiwb0dEUwJsD0BclP9UFIrvjUGo79lrXuDM08i6MCgSlS1xb9pSOgoR7MjYzpVFA8MdB9D9thTnkiDdCGTSu8DYTuPYJSY7gclE931lLzC/GErHhBW8hFBRWNQwZliNXlKTqaKoNivRWCvlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH0PR11MB5782.namprd11.prod.outlook.com (2603:10b6:510:147::11)
 by DM4PR11MB6044.namprd11.prod.outlook.com (2603:10b6:8:63::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6933.28; Wed, 1 Nov 2023 18:51:26 +0000
Received: from PH0PR11MB5782.namprd11.prod.outlook.com
 ([fe80::dfa4:95a8:ac5:bc37]) by PH0PR11MB5782.namprd11.prod.outlook.com
 ([fe80::dfa4:95a8:ac5:bc37%4]) with mapi id 15.20.6954.019; Wed, 1 Nov 2023
 18:51:26 +0000
From: "Mishra, Pallavi" <pallavi.mishra@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Thread-Topic: [Intel-xe] [PATCH v2] drm/xe/xe2: Program correct MOCS registers
Thread-Index: AQHaDANqu4BKjrQ7xkuMy6kEvsPJCbBl0CDw
Date: Wed, 1 Nov 2023 18:51:25 +0000
Message-ID: <PH0PR11MB5782F7CA299CA630C466474182A7A@PH0PR11MB5782.namprd11.prod.outlook.com>
References: <20231031140151.303296-2-matthew.d.roper@intel.com>
 <20231031140536.303746-2-matthew.d.roper@intel.com>
In-Reply-To: <20231031140536.303746-2-matthew.d.roper@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB5782:EE_|DM4PR11MB6044:EE_
x-ms-office365-filtering-correlation-id: 8b096548-91fb-49ed-9919-08dbdb0b8ced
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0PGyj+rSMo4xpSlE4e58ZxCm1ajFkxhwKtS8V10Z0Jmwf1G9H1I8YwPttycvrxk9ZI1C0AvihKFqSk9oh+1W0HB7v3yuHzHQKJM8ogt1kHC6SNAkajK3NgQuaqhFcmnu/LX00CHwuma76mVUn39OIwTb+sYyOwnFiYR+OaIx6qGUs1r/HMMDLcI2ClX9XzKHWJXCSraWNnWie+8B12xSwfDhUSaZs5yag7RPrMZIV5PwSWDXeyZQDjJAbUJGFkpWvYuFUyrn3f714QKOvp/qjZsRD+YQkVn8I3QFUUnqzOCNGrGgnqHjhulmOPB2KXioGS+6Jz9EEHe1wiCSOarilxDdG9HURCnwMLc4xbD+ojEY+zheURW5M4HzT1BYyktoDi+Tu8v/+o5a8BGk74V79bUwm697izZ+wOaFrDA4FBjDJ9nAaZWDwzEBewJYupKBJaf6ZXflLRoAHKYxdSNcGxy2Pl4unPRQqQtG60pZ5muqoB76alnGCjhnAGq73JlOo23jriUt8fY/SMcGO3334cpNlvF8rWY8/XRzVsh099QZCygY3cHXT46HDxQyp3CqXX1gqu749AaTXjDrx88gI6aSOVqrpn8SZn08usgG+fkz2X15hCtr71z9t2H3V6k4
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5782.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(366004)(376002)(136003)(346002)(396003)(230922051799003)(64100799003)(186009)(451199024)(1800799009)(82960400001)(122000001)(7696005)(38070700009)(38100700002)(6506007)(478600001)(76116006)(66946007)(316002)(53546011)(9686003)(110136005)(8676002)(66446008)(64756008)(66476007)(4326008)(8936002)(66556008)(2906002)(5660300002)(41300700001)(71200400001)(83380400001)(107886003)(52536014)(26005)(33656002)(55016003)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?O8BIG44hi7BOaIs7ON89EyV+YU6ox00KodskNBluOipJFP2m4y2/iyFOa49H?=
 =?us-ascii?Q?4Nr+J13TEqwssFtHV5TuFP+uQ/jeYrvsJInsUeFdu9DnMHDyCf7MITSxsBr2?=
 =?us-ascii?Q?iKDXoglG2kTqNiJrqwf3v5IR9VyMUWh8eCPKZc7O0dWc53Q/DN6Rau/mulFJ?=
 =?us-ascii?Q?q58W0B0xzg1ClB1NZkPR2b6I4aQjN5uiLk1XtFZKgLlO9tVws9J2PoqJx65Y?=
 =?us-ascii?Q?yGXaOBvjFDmxpwxNB2HSbLvFYQbBr2K7+Wubc2PIYulIUUm+2kq3j4sPYdaB?=
 =?us-ascii?Q?7vx/EZmcnHB4+x7/G62XxFKaC5FYbWcrhQsOM92HdTk5TOW8xCiniGeXYt0M?=
 =?us-ascii?Q?s3Qoj2vS2C3LF3g7U5+JH4a2ve2loZq8I4I5492OAZgTzGyDOySonGBgmMLr?=
 =?us-ascii?Q?isczut9vnh+/LxuszoRssUNKlHV/r6qt9jOa5NqR3j6YCYCVwH2t2+iG6u+g?=
 =?us-ascii?Q?2kC2MV6u/59DK5W46Jt6ri5afEvotFXHq5KgsgMWg2h+c2NEhmwSONsYNLPj?=
 =?us-ascii?Q?dH1l1chkZfpO0YwTdvGsKeiHUdJKc5nItRmz70HwFMoNy0cvCYkLFO7Oovkn?=
 =?us-ascii?Q?6FUipmcTr8HIpRsXQfOr1+WyrXowsACopjBPgWx6AZ4PkZB27ggiZfJsDRHt?=
 =?us-ascii?Q?SDYqkuJYowEo9HKxU+YvYbCbavncE9BRpUISSRLVAeBZr0sB4j/48pvsdBzd?=
 =?us-ascii?Q?Een42QtMneVSnj9ZeW+O/NA2Ubg+iAzpYbIbWpfy2/D8tapa7HZ9oFC9lY8+?=
 =?us-ascii?Q?dNCAoLtBgw9/28Owdti2BC3ZtOUG/Oz66f4g6X8iRiuUff3boT6hZO+9k45O?=
 =?us-ascii?Q?g3vX/yLCu8hf+kJUd+Qw6C4FWDFUGiei8w+uTlVDvHGdepgE/V/dgZihIgHx?=
 =?us-ascii?Q?2Z3SBs/2gk3TeMWTDLLpN4D4Y0CyDPkkgo+XkGcwdkaqc0ryQQy+++6srHVh?=
 =?us-ascii?Q?MEwlzvlz/LN2PRWyhDDEfzftcc3+xpuOelv/OH9x/P8HWnQGUUro7eS79aZD?=
 =?us-ascii?Q?TFit8XNk6qavQ+1PTSJXY956+72MVqfmpRA7JMM17+26dg/ILvF8ETA0WunK?=
 =?us-ascii?Q?vwORHRE++LTzC0dUFAiiDJJtdCm/zFvSNaFbSmrNpEHjKtBiYT5ZgHquiQST?=
 =?us-ascii?Q?ribJy4FbDC4m4cXtY9zQOuCDWCKEReR44v/gA2vsnrj94/jDDabJRqH/ncXv?=
 =?us-ascii?Q?gEhqZQ/C8cDKHIsDaimAXsh3z1wK96547mULrNq0PAPq6bKsoLx2wwz0Kcs1?=
 =?us-ascii?Q?WB3TtrgI9BydDhZ66rOK2Or6uKGm5SR4Cp3SAI85lG5V3FzWAtEPy1vGmMxF?=
 =?us-ascii?Q?EhPm+HyDg9nvBAWMTjr8Z4IAe5f4mY/Rwg3RJfqYe6ZGuzp9JMgXx/HNgnhE?=
 =?us-ascii?Q?+7spKkdubaU/hSl3GSP4X6QAiUq0BRimiMLNZFcxvO3rwZVzFaJbbPkthQda?=
 =?us-ascii?Q?USPQAl4Z5AYTm6vnFohbpSJ3MMJIBQqNUynIhAGJf90MGpfDmczFZsQI5qNA?=
 =?us-ascii?Q?4+hFcn9BngDGqeEOkd0iMG9fHlkqldPpBfgJO+qO1yI0HiYeZyYOcmA/TKx4?=
 =?us-ascii?Q?iGdkENKCAwOEA8liJ4hAqlPqqmU2CBLOWLYLH9gV?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5782.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b096548-91fb-49ed-9919-08dbdb0b8ced
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Nov 2023 18:51:25.8368 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PqHgzPxWVjD5SMU3WMRVsaNrtr8FFfbyeuWLkI3YZZf0aQsszje+2sLH4iPTdP8Njh48ttTC3DZSm71kFApgVWWiDqW3wOobJhD1WESO7Nw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6044
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2] drm/xe/xe2: Program correct MOCS registers
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
> Sent: Tuesday, October 31, 2023 7:06 AM
> To: intel-xe@lists.freedesktop.org
> Cc: Roper, Matthew D <matthew.d.roper@intel.com>
> Subject: [Intel-xe] [PATCH v2] drm/xe/xe2: Program correct MOCS registers
>=20
> The LNCFCMOCS registers no longer exist on Xe2 so there's no need to
> attempt to program them.  Since GLOB_MOCS is the only set of MOCS
> registers now, it's expected to be used for all platforms (both igpu and
> dgpu) going forward, so adjust the MOCS programming flags accordingly.
>=20
> v2:
>  - Fix typo (global mocs condition is >=3D, not >)
>=20
> Bspec: 71582
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_mocs.c | 24 +++++++++++++-----------
>  1 file changed, 13 insertions(+), 11 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_mocs.c b/drivers/gpu/drm/xe/xe_mocs.c
> index 21972bbef8fd..46e999257862 100644
> --- a/drivers/gpu/drm/xe/xe_mocs.c
> +++ b/drivers/gpu/drm/xe/xe_mocs.c
> @@ -26,6 +26,7 @@ static inline void mocs_dbg(const struct drm_device
> *dev,
>=20
>  enum {
>  	HAS_GLOBAL_MOCS =3D BIT(0),
> +	HAS_LNCF_MOCS =3D BIT(1),
>  };
>=20
>  struct xe_mocs_entry {
> @@ -473,8 +474,10 @@ static unsigned int get_mocs_settings(struct
> xe_device *xe,
>  		return 0;
>  	}
>=20
> -	if (!IS_DGFX(xe))
> +	if (!IS_DGFX(xe) || GRAPHICS_VER(xe) >=3D 20)
>  		flags |=3D HAS_GLOBAL_MOCS;
> +	if (GRAPHICS_VER(xe) < 20)
> +		flags |=3D HAS_LNCF_MOCS;
>=20
>  	return flags;
>  }
> @@ -505,7 +508,7 @@ static void __init_mocs_table(struct xe_gt *gt,
>  	for (i =3D 0;
>  	     i < info->n_entries ? (mocs =3D get_entry_control(info, i)), 1 : 0=
;
>  	     i++) {
> -		mocs_dbg(&gt_to_xe(gt)->drm, "%d 0x%x 0x%x\n", i,
> +		mocs_dbg(&gt_to_xe(gt)->drm, "GLOB_MOCS[%d] 0x%x
> 0x%x\n", i,
>  			 XELP_GLOBAL_MOCS(i).addr, mocs);
>=20
>  		if (GRAPHICS_VERx100(gt_to_xe(gt)) > 1250) @@ -545,7
> +548,7 @@ static void init_l3cc_table(struct xe_gt *gt,
>  	     (l3cc =3D l3cc_combine(get_entry_l3cc(info, 2 * i),
>  				  get_entry_l3cc(info, 2 * i + 1))), 1 : 0;
>  	     i++) {
> -		mocs_dbg(&gt_to_xe(gt)->drm, "%d 0x%x 0x%x\n", i,
> XELP_LNCFCMOCS(i).addr,
> +		mocs_dbg(&gt_to_xe(gt)->drm, "LNCFCMOCS[%d] 0x%x
> 0x%x\n", i,
> +XELP_LNCFCMOCS(i).addr,
>  			 l3cc);
>=20
>  		if (GRAPHICS_VERx100(gt_to_xe(gt)) >=3D 1250) @@ -570,19
> +573,18 @@ void xe_mocs_init(struct xe_gt *gt)
>  	unsigned int flags;
>=20
>  	/*
> -	 * LLC and eDRAM control values are not applicable to dgfx
> +	 * MOCS settings are split between "GLOB_MOCS" and/or
> "LNCFCMOCS"
> +	 * registers depending on platform.
> +	 *
> +	 * These registers should be programmed before GuC initialization
> +	 * since their values will affect some of the memory transactions
> +	 * performed by the GuC.
>  	 */
>  	flags =3D get_mocs_settings(gt_to_xe(gt), &table);
>  	mocs_dbg(&gt_to_xe(gt)->drm, "flag:0x%x\n", flags);
>=20
>  	if (flags & HAS_GLOBAL_MOCS)
>  		__init_mocs_table(gt, &table);
> -
> -	/*
> -	 * Initialize the L3CC table as part of mocs initalization to make
> -	 * sure the LNCFCMOCSx registers are programmed for the
> subsequent
> -	 * memory transactions including guc transactions
> -	 */
> -	if (table.table)
> +	if (flags & HAS_LNCF_MOCS)
>  		init_l3cc_table(gt, &table);
>  }

Reviewed-by: Pallavi Mishra <pallavi.mishra@intel.com>

> --
> 2.41.0

