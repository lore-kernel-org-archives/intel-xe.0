Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF2FDCDB465
	for <intel-xe@archiver.kernel.org>; Thu, 19 Oct 2023 06:35:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 518BD10E488;
	Thu, 19 Oct 2023 06:35:05 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EA7610E488
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Oct 2023 06:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697697303; x=1729233303;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=lKSIZl/Mi4dp3wCV/hB5ycmKQZFnvKJPhXqx6B+3Bxk=;
 b=Z+iNgvrR8M6yokZN1Piz0iJrx4eMWU0NYDzMLrfa8pae6O4472R8bxkh
 W1anD2L/eDkGhXmaje6UhEPE5Dhv5lmUQ2zltebcv/uJAueqmCc+wU/Wy
 mj4eL/wbLTlz3xgbx3+nsH9rLM9Cn9UFYC9WyPLDMTSyK1pidQ21eTcV9
 LqBUZuHCXbOckdDgmIgbprBcA3I44a3UQzBFshrtOmC8e4V8wcteN++qo
 4mQjW2lj65ldmG+MUqAfMSh1/t4EiqUG4fJbtDgiYdQAxiCDC/hBLSaDp
 r1Mep6RwNCPSXcp7totvHgTtVQDggrNt9+6Jm7mKgtVaAq+mGAfgf2pxO w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="386008040"
X-IronPort-AV: E=Sophos;i="6.03,236,1694761200"; d="scan'208";a="386008040"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2023 23:35:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="791888551"
X-IronPort-AV: E=Sophos;i="6.03,236,1694761200"; d="scan'208";a="791888551"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Oct 2023 23:35:02 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 18 Oct 2023 23:35:02 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 18 Oct 2023 23:35:02 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 18 Oct 2023 23:35:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G7u7hsD/NEU2tp3zCn38ny08sKg6vGih9ATCIwa4NmkrIu4Hn0/qv3O81aCvexNhqkPa1QN3jJn/wT0TeHekmOgS56qgjiYKKldJSfX4x7sxSlyMT6VHF16slH8YXsbORTaeuMrMsMKBKe2CRBSg00foAeDdnbMSDjb8GAhI+xxv3mQA+sJX5yokVmfg7xhGUBib9VeBsl5/vCB5yLN3Ooz9RF2xVPNGXZSLQvd/D9FCrHID/rGYmQ+WG9PZvF4GmYW6xnhvt91eea7et674Z6YU7UlIK+7Nk4cp0znTB+Hp77onMoNiWpML6lXmPetRPaIfKMv++9DUrsksRpNVFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sBHiPv/4fd9ASyFbCpnAnwoGOraG+iD2CdUNbNuc3E8=;
 b=WwpI8xXoi6WTshIn8RnMj3vEHTuLsKOn6bkw73XvACB7xgI+yEGBQvitCPoNy6t5bglGWUPleOR+7mi8sbtEUmd8MPQZAW+9BgZDC6fHicirx9rRmcBrU1je9D5Ml6MQpi6l2KP9xqMHlDeHfJtW1MndArW+iKzVs1flaRc1La6f6JYqHDHPSct+mlzGuTHJPd71jLRnnwsqTVVAIbK80VGdygymuu6i6oLi/bXTqWcA5k4avxR84lIFPBkAXRjHsT5zKkow4u50L/sD9YEqzNFl0xTiadbKwW3HmZAl6Qv8E1sIYCoR1xG3sTCHtAG4jxeVVAzVt9EO5qoeAwxU/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6211.namprd11.prod.outlook.com (2603:10b6:930:25::6)
 by SN7PR11MB8042.namprd11.prod.outlook.com (2603:10b6:806:2ed::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.36; Thu, 19 Oct
 2023 06:34:59 +0000
Received: from CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::413:a622:bff4:bdd6]) by CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::413:a622:bff4:bdd6%4]) with mapi id 15.20.6907.025; Thu, 19 Oct 2023
 06:34:59 +0000
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Nilawar, Badal" <badal.nilawar@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Thread-Topic: [PATCH v2 2/3] drm/xe/hwmon: Protect hwmon rw attributes with
 hwmon_lock
Thread-Index: AQHaAfS/IuTdTZj6bkC3G/UCXte4fbBQoPHA
Date: Thu, 19 Oct 2023 06:34:59 +0000
Message-ID: <CY5PR11MB62112039E53B9B263A7EF43B95D4A@CY5PR11MB6211.namprd11.prod.outlook.com>
References: <20231018190341.726098-1-badal.nilawar@intel.com>
 <20231018190341.726098-3-badal.nilawar@intel.com>
In-Reply-To: <20231018190341.726098-3-badal.nilawar@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6211:EE_|SN7PR11MB8042:EE_
x-ms-office365-filtering-correlation-id: aec892af-aa00-44a4-8087-08dbd06d8465
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qr0nd7O6dASrBLIX7L6om3lNRgOXwAnwNDGL9zOAiAgxVQugKp24zXSebmJovY7SGpoxcEqdzY3z3cn2r4odaX3HagWQ8BRvXxGjDlR2CHMxr8SCwFKkdtaUbhSEFx90Reno/d2XXEn6TbC9E0ChK9NlM4QSlNHlrhfkFljCHJB0Lm1JKIrWow2BveeKMC21y4P9zt9JzNPUr6Dx2xcsWa8odJ8K57gOIKOwkBtOsvV30YAREz8Q3gczUCjJjEdfgRo8yv5LiPRSMoDHKnG6iT00Aue+O3XCDHOY5/Hj5J+jFSXO0NOs7z2ggV+GKBijRqVu/v6vt4km3tleNhLHj55ElB2lwParKnVCJnJeBZFiMv5OWDQEqD9XT432lE24TX5xfFRMIFqkbOqHxw8Tr9Jdu3gKh7IbOId0bTxOsbjgNQDyeIYR/tHCDbWdjPF03YPoo/oQWTTlS65baoKPK6TfvWnR8Ed9/imM8J756ORqb+vrTmypJJDALjFT06txJYl2AJCrPUAEBhNg1UZtayfV8CuwykTVfcHlk2lawZGuLgbar0DTA5ePAGdyF0bMHmFPl09X0ZRkY+OJQqZ/7qyGROOswi8JLvJzqr4OGQuScuRZEKAfNVvmK27lyX3n
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6211.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(366004)(396003)(346002)(136003)(39860400002)(230922051799003)(64100799003)(186009)(1800799009)(451199024)(9686003)(33656002)(55016003)(66556008)(54906003)(64756008)(66476007)(38100700002)(110136005)(86362001)(8936002)(38070700005)(122000001)(82960400001)(66446008)(53546011)(316002)(76116006)(66946007)(83380400001)(26005)(71200400001)(7696005)(6506007)(2906002)(478600001)(41300700001)(52536014)(4326008)(8676002)(5660300002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?nHSoVT3SD1m0d5HKM/TRBaJIcniQ5uGBVNsWNBxbJ+NPEUbQBrKmo4bWCYwY?=
 =?us-ascii?Q?EU6XFdlnEGwCVFnCGbSdv7riLfDS7KOxuTIA9Pp1/mubqR6CJwjPrN+44oVg?=
 =?us-ascii?Q?vgUV0x5sKi+E/HduQ22FxOLDRQKSH+yei3EcukusWPpgh2U5r8vRAojasnGQ?=
 =?us-ascii?Q?lgMmrDVRiOaAh4ktGbwSPtXzuWkHfZog8EzALtxLfisTd/btJIr3oAEsXJXR?=
 =?us-ascii?Q?ZQFofTSXwpAV7nreum3PCRviqRESfzZBRx6JLuZLEIIOObWKGJMUnU/C5Hja?=
 =?us-ascii?Q?WRTgYCODN2/Y1j3qDiQl6/0DN7/akJwsbJ5rjR/OQZnaN82is0CZxKLlCEDq?=
 =?us-ascii?Q?k6JUTMpHVK67t0pJMaA+McP3HSvuZlGbaLGfqWI3kfUEIGa9gp8D/Q1RmTEX?=
 =?us-ascii?Q?SNyOMCzL+f1aWKxv59MdCrTpLv7Ysc77RZF1+3UAfnntZfu6BeXEFgtcnw/Z?=
 =?us-ascii?Q?im0w8sXRyONfafeMfSLXljJPGX7X+VtgxzGc2zrNtzQenJ2B9HaQ9EwI8v4A?=
 =?us-ascii?Q?I59vrkPMYeitO4PBXYvCA8/VAh1q22OR2WSpATTpSFN++A6nYt52wNan/60t?=
 =?us-ascii?Q?fCZ6h5wLTVgw/KZKRLCXV5871ExTvBAZI/GHYRUXoFtRdTVQx/eTyoXeqKDZ?=
 =?us-ascii?Q?Tilz/AemQXVu5sjMX90KapH3sGcd6nhLFwfkzuBlsXv+jUEBVyCcSA3lrS9j?=
 =?us-ascii?Q?bNpXlG/ssAPsPlL6lx65oZwjwD68miiXoa94kUADwlkM7gtPhzQ5qIPYGlkD?=
 =?us-ascii?Q?oVgcG3LIdu1MTdO6zB4RZByiTCa5GGYQh9hBgPZWhrh7sWyp6rP03p6muyM0?=
 =?us-ascii?Q?04pqynXsEKnroDMKF1gT4mf5obDvrOxtVXRagmDh/0NS/xpJIsyMrznednG4?=
 =?us-ascii?Q?nm/g47ShNL37aREzSpMwE1P1CUl6+vgrRqJmo+gGhVaNSLi+eAfHOcc1iGNE?=
 =?us-ascii?Q?VRVik2DdoLqIHsMsUZdDm2Y9I++DSnxmnYM8f8PMbXeIxmHRDJcYZU3uY90q?=
 =?us-ascii?Q?6VgZDg4B7GPdRC/YhgnS8mp8utG7qKEmrmH3f5Ca5JV5JSVN2LarGaphfvd8?=
 =?us-ascii?Q?SrRIL6MuLW9FuNOQ+AfzhlXRbzv3RXqy4djOZIAH28/ibeJ9aiftxA5Fb9eA?=
 =?us-ascii?Q?5pMF/hlT1APs9URyVwzk/Cm3Kjug9gH17Z20bDUhEnWUQPW2A5kPLqccjsCj?=
 =?us-ascii?Q?mXyZpytpRRE7xG4WVFy/NaRdDWAsB5pMlBAbcY+Lk8WsCad+OTTSDEGgx0Z5?=
 =?us-ascii?Q?kuh3lxu6uzMCQGdzX/UueNTLjno5CpHzpsp1m8qMxZCO/jhuRR2fjFTStFfc?=
 =?us-ascii?Q?MWV95uFiICKytV3twDtk3Cs1Fmm1/xVYiWa2rMJ4Zbkpzw0trsnkcMAIbcPE?=
 =?us-ascii?Q?xgFynd70cE4P1bvQ3ukZimxO71SWOJEPROlbtiEQfq6xi7q71DR1N+dD6joz?=
 =?us-ascii?Q?VRF2Hot5G3ClIzHKDdQAmcwopM5COs7IP9WFBIOMNX/lN2wnrjqjr6nPb4dG?=
 =?us-ascii?Q?Ojv5DQ/CSSseU7ZClXCCi/zVzP5ydM2STKgXi3bEVuOQS/dEfr5KR1yWjjqZ?=
 =?us-ascii?Q?bFhDwoBY+a+k1JBHDhrC8qYubunkofTVRILBcQEe?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6211.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aec892af-aa00-44a4-8087-08dbd06d8465
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Oct 2023 06:34:59.4109 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 34bLXeGcEkIWsd8wPw5hAzPBXh/pkO8ILx/2Bn69//hUw2jRFAVcqdMBsIFLKkMSGqQzxz1M2hzC4n5Xhmwq54ikxqNs2FBs9goMz2LR6zM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8042
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 2/3] drm/xe/hwmon: Protect hwmon rw
 attributes with hwmon_lock
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
Cc: "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Nilawar, Badal <badal.nilawar@intel.com>
> Sent: Thursday, October 19, 2023 12:34 AM
> To: intel-xe@lists.freedesktop.org
> Cc: Gupta, Anshuman <anshuman.gupta@intel.com>; Dixit, Ashutosh
> <ashutosh.dixit@intel.com>; andi.shyti@linux.intel.com; Tauro, Riana
> <riana.tauro@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>
> Subject: [PATCH v2 2/3] drm/xe/hwmon: Protect hwmon rw attributes with
> hwmon_lock
>=20
> Take hwmon_lock while accessing hwmon rw attributes. For readonly
> attributes its not required to take lock as reads are protected by sysfs =
layer and
> therefore sequential.
This patch should only have functionality related to locking, why this is a=
dding=20
xe_hwmon_power_curr_crit_write and xe_hwmon_power_curr_crit_read ?
>=20
> Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
> Cc: Anshuman Gupta <anshuman.gupta@intel.com>
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_hwmon.c | 92 ++++++++++++++++++++--------------
> -
>  1 file changed, 52 insertions(+), 40 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c
> b/drivers/gpu/drm/xe/xe_hwmon.c index 08c7289723ae..c87d028f1955
> 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -47,7 +47,7 @@ struct xe_hwmon_energy_info {  struct xe_hwmon {
>  	struct device *hwmon_dev;
>  	struct xe_gt *gt;
> -	struct mutex hwmon_lock; /* rmw operations*/
> +	struct mutex hwmon_lock; /* For rw attributes */
Make this Kernel Doc comment, and this is wrongly placed here in .c , struc=
ture are declared
In headers in all xe files, and requires kernel doc comment.
Thanks,
Anshuman Gupta.
>  	int scl_shift_power;
>  	int scl_shift_energy;
>  	struct xe_hwmon_energy_info ei;	/*  Energy info for
> energy1_input */
> @@ -135,11 +135,13 @@ static void xe_hwmon_power_max_read(struct
> xe_hwmon *hwmon, long *value)  {
>  	u64 reg_val, min, max;
>=20
> +	mutex_lock(&hwmon->hwmon_lock);
> +
>  	xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT,
> REG_READ32, &reg_val, 0, 0);
>  	/* Check if PL1 limit is disabled */
>  	if (!(reg_val & PKG_PWR_LIM_1_EN)) {
>  		*value =3D PL1_DISABLE;
> -		return;
> +		goto unlock;
>  	}
>=20
>  	reg_val =3D REG_FIELD_GET(PKG_PWR_LIM_1, reg_val); @@ -153,12
> +155,17 @@ static void xe_hwmon_power_max_read(struct xe_hwmon
> *hwmon, long *value)
>=20
>  	if (min && max)
>  		*value =3D clamp_t(u64, *value, min, max);
> +unlock:
> +	mutex_unlock(&hwmon->hwmon_lock);
>  }
>=20
>  static int xe_hwmon_power_max_write(struct xe_hwmon *hwmon, long
> value)  {
> +	int ret =3D 0;
>  	u64 reg_val;
>=20
> +	mutex_lock(&hwmon->hwmon_lock);
> +
>  	/* Disable PL1 limit and verify, as limit cannot be disabled on all
> platforms */
>  	if (value =3D=3D PL1_DISABLE) {
>  		xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT,
> REG_RMW32, &reg_val, @@ -166,8 +173,10 @@ static int
> xe_hwmon_power_max_write(struct xe_hwmon *hwmon, long value)
>  		xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT,
> REG_READ32, &reg_val,
>  				     PKG_PWR_LIM_1_EN, 0);
>=20
> -		if (reg_val & PKG_PWR_LIM_1_EN)
> -			return -EOPNOTSUPP;
> +		if (reg_val & PKG_PWR_LIM_1_EN) {
> +			ret =3D -EOPNOTSUPP;
> +			goto unlock;
> +		}
>  	}
>=20
>  	/* Computation in 64-bits to avoid overflow. Round to nearest. */
> @@ -176,8 +185,9 @@ static int xe_hwmon_power_max_write(struct
> xe_hwmon *hwmon, long value)
>=20
>  	xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT,
> REG_RMW32, &reg_val,
>  			     PKG_PWR_LIM_1_EN | PKG_PWR_LIM_1, reg_val);
> -
> -	return 0;
> +unlock:
> +	mutex_unlock(&hwmon->hwmon_lock);
> +	return ret;
>  }
>=20
>  static void xe_hwmon_power_rated_max_read(struct xe_hwmon *hwmon,
> long *value) @@ -215,8 +225,6 @@ xe_hwmon_energy_get(struct
> xe_hwmon *hwmon, long *energy)
>  	struct xe_hwmon_energy_info *ei =3D &hwmon->ei;
>  	u64 reg_val;
>=20
> -	mutex_lock(&hwmon->hwmon_lock);
> -
>  	xe_hwmon_process_reg(hwmon, REG_PKG_ENERGY_STATUS,
> REG_READ32,
>  			     &reg_val, 0, 0);
>=20
> @@ -229,8 +237,6 @@ xe_hwmon_energy_get(struct xe_hwmon *hwmon,
> long *energy)
>=20
>  	*energy =3D mul_u64_u32_shr(ei->accum_energy, SF_ENERGY,
>  				  hwmon->scl_shift_energy);
> -
> -	mutex_unlock(&hwmon->hwmon_lock);
>  }
>=20
>  static const struct hwmon_channel_info *hwmon_info[] =3D { @@ -260,6
> +266,38 @@ static int xe_hwmon_pcode_write_i1(struct xe_gt *gt, u32 uval)
>  			      uval);
>  }
>=20
> +static int xe_hwmon_power_curr_crit_read(struct xe_hwmon *hwmon, long
> +*value, u32 scale_factor) {
> +	int ret;
> +	u32 uval;
> +
> +	mutex_lock(&hwmon->hwmon_lock);
> +
> +	ret =3D xe_hwmon_pcode_read_i1(hwmon->gt, &uval);
> +	if (ret)
> +		goto unlock;
> +
> +	*value =3D
> mul_u64_u32_shr(REG_FIELD_GET(POWER_SETUP_I1_DATA_MASK, uval),
> +				 scale_factor, POWER_SETUP_I1_SHIFT);
> +unlock:
> +	mutex_unlock(&hwmon->hwmon_lock);
> +	return ret;
> +}
> +
> +static int xe_hwmon_power_curr_crit_write(struct xe_hwmon *hwmon, long
> +value, u32 scale_factor) {
> +	int ret;
> +	u32 uval;
> +
> +	mutex_lock(&hwmon->hwmon_lock);
> +
> +	uval =3D DIV_ROUND_CLOSEST_ULL(value << POWER_SETUP_I1_SHIFT,
> scale_factor);
> +	ret =3D xe_hwmon_pcode_write_i1(hwmon->gt, uval);
> +
> +	mutex_unlock(&hwmon->hwmon_lock);
> +	return ret;
> +}
> +
>  static void xe_hwmon_get_voltage(struct xe_hwmon *hwmon, long *value)  {
>  	u64 reg_val;
> @@ -291,9 +329,6 @@ xe_hwmon_power_is_visible(struct xe_hwmon
> *hwmon, u32 attr, int chan)  static int  xe_hwmon_power_read(struct
> xe_hwmon *hwmon, u32 attr, int chan, long *val)  {
> -	int ret;
> -	u32 uval;
> -
>  	switch (attr) {
>  	case hwmon_power_max:
>  		xe_hwmon_power_max_read(hwmon, val);
> @@ -302,14 +337,7 @@ xe_hwmon_power_read(struct xe_hwmon
> *hwmon, u32 attr, int chan, long *val)
>  		xe_hwmon_power_rated_max_read(hwmon, val);
>  		return 0;
>  	case hwmon_power_crit:
> -		ret =3D xe_hwmon_pcode_read_i1(hwmon->gt, &uval);
> -		if (ret)
> -			return ret;
> -		if (!(uval & POWER_SETUP_I1_WATTS))
> -			return -ENODEV;
> -		*val =3D
> mul_u64_u32_shr(REG_FIELD_GET(POWER_SETUP_I1_DATA_MASK, uval),
> -				       SF_POWER, POWER_SETUP_I1_SHIFT);
> -		return 0;
> +		return xe_hwmon_power_curr_crit_read(hwmon, val,
> SF_POWER);
>  	default:
>  		return -EOPNOTSUPP;
>  	}
> @@ -318,14 +346,11 @@ xe_hwmon_power_read(struct xe_hwmon
> *hwmon, u32 attr, int chan, long *val)  static int
> xe_hwmon_power_write(struct xe_hwmon *hwmon, u32 attr, int chan, long
> val)  {
> -	u32 uval;
> -
>  	switch (attr) {
>  	case hwmon_power_max:
>  		return xe_hwmon_power_max_write(hwmon, val);
>  	case hwmon_power_crit:
> -		uval =3D DIV_ROUND_CLOSEST_ULL(val <<
> POWER_SETUP_I1_SHIFT, SF_POWER);
> -		return xe_hwmon_pcode_write_i1(hwmon->gt, uval);
> +		return xe_hwmon_power_curr_crit_write(hwmon, val,
> SF_POWER);
>  	default:
>  		return -EOPNOTSUPP;
>  	}
> @@ -348,19 +373,9 @@ xe_hwmon_curr_is_visible(const struct xe_hwmon
> *hwmon, u32 attr)  static int  xe_hwmon_curr_read(struct xe_hwmon
> *hwmon, u32 attr, long *val)  {
> -	int ret;
> -	u32 uval;
> -
>  	switch (attr) {
>  	case hwmon_curr_crit:
> -		ret =3D xe_hwmon_pcode_read_i1(hwmon->gt, &uval);
> -		if (ret)
> -			return ret;
> -		if (uval & POWER_SETUP_I1_WATTS)
> -			return -ENODEV;
> -		*val =3D
> mul_u64_u32_shr(REG_FIELD_GET(POWER_SETUP_I1_DATA_MASK, uval),
> -				       SF_CURR, POWER_SETUP_I1_SHIFT);
> -		return 0;
> +		return xe_hwmon_power_curr_crit_read(hwmon, val,
> SF_CURR);
>  	default:
>  		return -EOPNOTSUPP;
>  	}
> @@ -369,12 +384,9 @@ xe_hwmon_curr_read(struct xe_hwmon *hwmon,
> u32 attr, long *val)  static int  xe_hwmon_curr_write(struct xe_hwmon
> *hwmon, u32 attr, long val)  {
> -	u32 uval;
> -
>  	switch (attr) {
>  	case hwmon_curr_crit:
> -		uval =3D DIV_ROUND_CLOSEST_ULL(val <<
> POWER_SETUP_I1_SHIFT, SF_CURR);
> -		return xe_hwmon_pcode_write_i1(hwmon->gt, uval);
> +		return xe_hwmon_power_curr_crit_write(hwmon, val,
> SF_CURR);
>  	default:
>  		return -EOPNOTSUPP;
>  	}
> --
> 2.25.1

