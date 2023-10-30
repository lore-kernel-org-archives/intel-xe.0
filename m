Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F45CC4332F
	for <intel-xe@archiver.kernel.org>; Mon, 30 Oct 2023 12:09:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0211610E0BE;
	Mon, 30 Oct 2023 12:09:25 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B229E10E0BE
 for <intel-xe@lists.freedesktop.org>; Mon, 30 Oct 2023 12:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698667763; x=1730203763;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=PCbW4mHjwPOTS2caNhuX/s2EAm6aQNChsZvHcAknDuI=;
 b=Jxb3Zeedgtxa+OynnniU6ueuj7B3uxE44yVQF+95gRS/xhMup6cwdpJ+
 gPDVjIVf6tPh5j/wmDWdEI+4uExImkvxgwGtgyV1VVsfc+ycK5VtkdTbo
 3TtWcBnaU1211JrOL8GwbIrVdyPQrsUQVNgh9EY7uAjUWM1bFrlqmlGm7
 IJDL8mt7gVqzHFEqHAlLcsiVZoGOb8o2k+cpOHCHUbEy+j4/858cd3+3E
 1dSHlF12vA6eWwdnmyhE7YKlYQdehfX+wGTIRxNysoF+cQ6U4WmSSqufr
 1UoqJ3YLtHDdy1uAs8XtZoVS0J4vgK1ygEeOQWwAch0j/nzJh+90VqW4v g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10878"; a="390917033"
X-IronPort-AV: E=Sophos;i="6.03,263,1694761200"; d="scan'208";a="390917033"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2023 05:09:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10878"; a="795246746"
X-IronPort-AV: E=Sophos;i="6.03,263,1694761200"; d="scan'208";a="795246746"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Oct 2023 05:09:23 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 30 Oct 2023 05:09:22 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Mon, 30 Oct 2023 05:09:22 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Mon, 30 Oct 2023 05:09:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NZku18pUvrHE8hTtgTxRX96r8+rHeVK4//vMZsGGQcl6OviZ0vm4tG4vATQc3jpBCB3NHG72+oMiuy5zcmVYcbNfFT0sII195u9bLGQdxOvqKe9RobEjTZzunNm3S39yUge1ZGbKcZlonxtiwwg2FAher+XNYxau+hv5PDzQdjnYR0qWI1+j2Ov4ghB/zBHv6HPvq7PaJJtb/q13s6BNbN/VHYHTOMbgwjHIt33H7QK8leCa7VhNZpzlfINje/l+CoH0Im9IA6yZP0IFpKJHKSHcW08rKFT0U3+GP9YAePeR+kDzDTw/v5gvK9M6/GYzxISBwLpddOqjqUXtehtwng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hLqTuycCatysDPCgctCmAEUi5bdOdxYDJDwJpf7Sfwk=;
 b=IfunLdpXtcx2IT3d3vnhCbIcpHkAHBDP549HNHTDDjcA3ckVoRYYiS4CgJJItvsOJkBqKpziZIaBgV6gLrgTrSXvmEbevgbfUBnbb48LRxg8ZVycb6rt/e3u0wj8s48qK5WCOsjiltsDENCbCFCIzGIcgt1Vmkusd1MXdWFWTe6WuyAkDvQGLyoPyxoamk7nht0dBK07WI9T2lhFTdPqisXnk81WVzOYP3ZpsAiVIT9uu9GUbSFWkE+0DSa4sIJsy8+m+O9dmb7yfp7OieS6FCLc0BXjVp7xtL54rwqwRrrr44p+7aQx395mvD5v/6Za/I13xC/Se35q3euLwHGzXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6211.namprd11.prod.outlook.com (2603:10b6:930:25::6)
 by SN7PR11MB7041.namprd11.prod.outlook.com (2603:10b6:806:298::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.28; Mon, 30 Oct
 2023 12:09:19 +0000
Received: from CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::413:a622:bff4:bdd6]) by CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::413:a622:bff4:bdd6%4]) with mapi id 15.20.6933.024; Mon, 30 Oct 2023
 12:09:19 +0000
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Nilawar, Badal" <badal.nilawar@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Thread-Topic: [PATCH v3 1/3] drm/xe/hwmon: Add kernel doc and refactor xe hwmon
Thread-Index: AQHaCycCG4teGiWK+kq0959M+H1VyLBiPVEg
Date: Mon, 30 Oct 2023 12:09:19 +0000
Message-ID: <CY5PR11MB62115182E5FA4441BC17A4F995A1A@CY5PR11MB6211.namprd11.prod.outlook.com>
References: <20231030115618.1382200-1-badal.nilawar@intel.com>
 <20231030115618.1382200-2-badal.nilawar@intel.com>
In-Reply-To: <20231030115618.1382200-2-badal.nilawar@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6211:EE_|SN7PR11MB7041:EE_
x-ms-office365-filtering-correlation-id: 1b4d44bc-64e9-4f86-c5c2-08dbd9410b98
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: AosmtDqXt2HWWj5YpxlPuboi6xN7ITnJKgQ8AOTWnkPQ+4irJ6jLXZbFzwu2x4PGFXvm7F/t0i0WHUeJkSbSPLRyrNXy+TZTe4Xj9oz0qzBKlf+F1kqcconEun949Y3rtq+Y5nzTiin0tNov0xjLjg1vQK0EsvO78nt3qvaEtm+geEyO2O4sowDqm6m0JPcUQnn/37wAF/EeYfPtWf1ZSlrBduY/ybarx4lO3yFUJcl5sc4HdTLBMpUe5lSVJi7EKrEt61H7923FQawhcRwvT/jXNwEDzupBL6JmEEUlxfXNJ5YpMZ5k/Qg819G22QZgxBX/cbB2URMq44TWjy1+kesxyl7SsDEYGRdRxEJJTirVWK+lPzzPcDku7+F5EHgQj+T/JJXoblj7ISppDjNylTadFcMcRurLNC4wWo8F03lEBIsyGTik3a96TY0Aj6qagU7/Z+iq/cSeYDhGKKh4rLk5XsR7EfFG1ibSIvCovyUv6tAJeou6Mm3ZSGfqKGWXFr0sIZmLuZ8A33tuvuQerkt1O+dyDXif0cuNAnGwbn3qGetUdecYueQWgYssVbVIpYPHCCo/S3QcMW+eMKMZy6Hs3HngXkh5gXtXkDX1gx/a5qby051L7ytsqTrQm1HC
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6211.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(136003)(346002)(396003)(376002)(366004)(230922051799003)(1800799009)(451199024)(64100799003)(186009)(83380400001)(26005)(66556008)(38100700002)(76116006)(110136005)(316002)(54906003)(64756008)(66446008)(66476007)(66946007)(5660300002)(52536014)(4326008)(8676002)(8936002)(53546011)(6506007)(7696005)(71200400001)(9686003)(2906002)(30864003)(478600001)(41300700001)(122000001)(82960400001)(86362001)(33656002)(38070700009)(55016003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?V6TIEM5BL+ENwf4CxiSVXRYzK0w71DqRQpQ9Zgv5cpYUBqpL5Ew+751OcXgN?=
 =?us-ascii?Q?+kSExEZb0rgWGeKpis8KYlhpypZqtk9CgzG/eEulFEhpJd2lW/1MDMTi5Jkm?=
 =?us-ascii?Q?3LEbo7LbCHa7u/B/TOVxqL3y8blAh6dnoetKn33v2XNdlTW/RpQ0vNTCzOVM?=
 =?us-ascii?Q?wX22G7R+edHvgrlGFTo5eveb5MqJAd/biYbVURpnYXxpdrqyDwWjJmnLgKEM?=
 =?us-ascii?Q?2Zhs0JYhRMUuaQhEaTQx4I7hax4Zl6WLK0jemw562ODPlA2UNHZhzUyleoDw?=
 =?us-ascii?Q?0IwlRSzdp6us3PQMlA41hoxK3rer5WT3v1lhAp2Mq7torDgI3zc8FfLTunqD?=
 =?us-ascii?Q?CwsPgYX9/Eh3MSXvrDXUlkHV1bRRk0eO6v1XVCYhl+OEK9XPBFMcHzylGLkp?=
 =?us-ascii?Q?nWlKunUF4I+EjNn8813BF/x1dg95o6pwqPDi5yHiZPF6bC1+1CDMH7j4IXE5?=
 =?us-ascii?Q?soA8YomEsbBZVddTiMnBlLXbZ1+pS00yk4cJFeBDe4cVaOgkmXSdc8Cvs3uA?=
 =?us-ascii?Q?65Ngv3ztXmfFimMM0dQinnQxdZdwHiCylEvx2ukvhdrkOF81J/yexDABwojd?=
 =?us-ascii?Q?D6Q3I+qJjF/iO7qxH8MyR2khbNpA+QTC5MGotWASRf1TRyyvzJC/yYg4ERDR?=
 =?us-ascii?Q?LQL3riYDHKTxrDTEkRy7cKfMOauh+JdcfNu2XLfSf9uWmcuCzeyN92Odqsrn?=
 =?us-ascii?Q?KAcFbuVMLxGpyOnDW8NBr/KI7M481wzEpQKl2fehal1r9xfLPPgy9loTT4xc?=
 =?us-ascii?Q?MTvSJsmLB1y1WLAPIqIZhuw3XJZCwhueHUnDLZbut7Tp0TN0Ft/cAGE+CSET?=
 =?us-ascii?Q?Kw4npedHe2n9DObbRgNBoon94EPGutGSfbWp+mXutQN4CpReoyuITFPp1Y5V?=
 =?us-ascii?Q?zA3uKA3aeZrZkVC0eOGya3EuHMtXm0DTlsm0n2wCYpzBwMpVutpVCjyHJVnm?=
 =?us-ascii?Q?ZgoXzx+o1b8WiFSonw4XcabK4b4luINyQi0CkNVJ4F0kWOWd7P2lvTmLAT4j?=
 =?us-ascii?Q?zOKMGfBjFgcMYvv4JDoHmOS0jsXvAwWSXzBBLX++Ce1yxa5B8ZlJ19xOMSB3?=
 =?us-ascii?Q?z7Z8hoMGPzYyYalG6RIKnTRiXoHD5m9uoY1ZbcAeliz5AYis0tq/x7nuJiH+?=
 =?us-ascii?Q?sL9w0NjPcECtdM1iNBv/gswkww00TCVS05nZiwqqZ7UqE+hpFKOW0vrEPIRn?=
 =?us-ascii?Q?6zblxhIqec9F9RzNZ4P+h1J3XkopCy/RQg6k9gbrng1IKgFY4uDrWKsaMKQa?=
 =?us-ascii?Q?MEfPAGJSB/9cq7NtQgcnLTPzAxRK0r0Mok3T9HwX3hg0hIcvcbgypCeQgBIj?=
 =?us-ascii?Q?SZ45OYFVEgXfyQSV3BADRC7GHh5Ep2jFdlX/Q6xoVMbw2M1wMPV5YnYewsEj?=
 =?us-ascii?Q?7WG07J4fu3Yar6X4Xp8Wctxthnapg4qmhH8GJPJOLGDX2hcz6NYnddjVk/LP?=
 =?us-ascii?Q?3FihcaCxgS92YKk6YkUjZEi8TO+v9pDBwRx+dmn01X0Eovc5P2ZiFHgvcfCS?=
 =?us-ascii?Q?ppCz8V8Z3EFPOnQwboOSN4WbVyOVAoDs8iCnVsT5TiYIPL96+1DpxrI0Tjf9?=
 =?us-ascii?Q?6HGuA3IhYoQvcr8V3/PC/A3/hOfHjcydy/pCFwrs?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6211.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b4d44bc-64e9-4f86-c5c2-08dbd9410b98
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Oct 2023 12:09:19.3589 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LM8J0DZYpLtERVTTQeec1uzUbpCfHMSQhwHr0vAYrtWB1d/oLkxkxi0hXhYwL1kI7KIP2+TFYjXRvq5AgOCgxKjEhLKgjoH8ursmf1gquPY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7041
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 1/3] drm/xe/hwmon: Add kernel doc and
 refactor xe hwmon
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
> Sent: Monday, October 30, 2023 5:26 PM
> To: intel-xe@lists.freedesktop.org
> Cc: Gupta, Anshuman <anshuman.gupta@intel.com>; Dixit, Ashutosh
> <ashutosh.dixit@intel.com>; andi.shyti@linux.intel.com; Tauro, Riana
> <riana.tauro@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>
> Subject: [PATCH v3 1/3] drm/xe/hwmon: Add kernel doc and refactor xe hwmo=
n
>=20
> Add kernel doc and refactor some of the hwmon functions, there is no
> functionality change.
>=20
> Cc: Anshuman Gupta <anshuman.gupta@intel.com>
> Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_hwmon.c | 201 +++++++++++++++-------------------
>  1 file changed, 91 insertions(+), 110 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.=
c
> index 9ac05994a967..9b7773441f62 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -26,9 +26,9 @@ enum xe_hwmon_reg {
>  };
>=20
>  enum xe_hwmon_reg_operation {
> -	REG_READ,
> -	REG_WRITE,
> -	REG_RMW,
> +	REG_READ32,
> +	REG_RMW32,
> +	REG_READ64,
>  };
>=20
>  /*
> @@ -39,18 +39,32 @@ enum xe_hwmon_reg_operation {
>  #define SF_VOLTAGE	1000		/* millivolts */
>  #define SF_ENERGY	1000000		/* microjoules */
>=20
> +/**
> + * struct xe_hwmon_energy_info - to accumulate energy  */
>  struct xe_hwmon_energy_info {
> +	/** @reg_val_prev: previous energy reg val */
>  	u32 reg_val_prev;
> -	long accum_energy;		/* Accumulated energy for
> energy1_input */
> +	/** @accum_energy: accumulated energy */
> +	long accum_energy;
>  };
>=20
> +/**
> + * struct xe_hwmon - xe hwmon data structure  */
>  struct xe_hwmon {
> +	/** @hwmon_dev: hwmon device for xe */
>  	struct device *hwmon_dev;
> +	/** @gt: primary gt */
>  	struct xe_gt *gt;
> -	struct mutex hwmon_lock; /* rmw operations*/
> +	/** @hwmon_lock: lock for rmw operations */
> +	struct mutex hwmon_lock;
> +	/** @scl_shift_power: pkg power unit */
>  	int scl_shift_power;
> +	/** @scl_shift_energy: pkg energy unit */
>  	int scl_shift_energy;
> -	struct xe_hwmon_energy_info ei;	/*  Energy info for
> energy1_input */
> +	/** @ei: Energy info for energy1_input */
> +	struct xe_hwmon_energy_info ei;
>  };
>=20
>  static u32 xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg
> hwmon_reg) @@ -95,49 +109,34 @@ static u32 xe_hwmon_get_reg(struct
> xe_hwmon *hwmon, enum xe_hwmon_reg hwmon_reg)
>  	return reg.raw;
>  }
>=20
> -static int xe_hwmon_process_reg(struct xe_hwmon *hwmon, enum
> xe_hwmon_reg hwmon_reg,
> -				enum xe_hwmon_reg_operation operation, u32
> *value,
> -				u32 clr, u32 set)
> +static void xe_hwmon_process_reg(struct xe_hwmon *hwmon, enum
> xe_hwmon_reg hwmon_reg,
> +				 enum xe_hwmon_reg_operation operation, u64
> *value,
> +				 u32 clr, u32 set)
>  {
>  	struct xe_reg reg;
>=20
>  	reg.raw =3D xe_hwmon_get_reg(hwmon, hwmon_reg);
>=20
>  	if (!reg.raw)
> -		return -EOPNOTSUPP;
> +		return;
>=20
>  	switch (operation) {
> -	case REG_READ:
> +	case REG_READ32:
>  		*value =3D xe_mmio_read32(hwmon->gt, reg);
> -		return 0;
> -	case REG_WRITE:
> -		xe_mmio_write32(hwmon->gt, reg, *value);
> -		return 0;
> -	case REG_RMW:
> +		break;
> +	case REG_RMW32:
>  		*value =3D xe_mmio_rmw32(hwmon->gt, reg, clr, set);
> -		return 0;
> +		break;
> +	case REG_READ64:
> +		*value =3D xe_mmio_read64_2x32(hwmon->gt, reg);
> +		break;
>  	default:
>  		drm_warn(&gt_to_xe(hwmon->gt)->drm, "Invalid xe hwmon reg
> operation: %d\n",
>  			 operation);
> -		return -EOPNOTSUPP;
> +		break;
>  	}
>  }
>=20
> -static int xe_hwmon_process_reg_read64(struct xe_hwmon *hwmon,
> -				       enum xe_hwmon_reg hwmon_reg, u64
> *value)
> -{
> -	struct xe_reg reg;
> -
> -	reg.raw =3D xe_hwmon_get_reg(hwmon, hwmon_reg);
> -
> -	if (!reg.raw)
> -		return -EOPNOTSUPP;
> -
> -	*value =3D xe_mmio_read64_2x32(hwmon->gt, reg);
> -
> -	return 0;
> -}
> -
>  #define PL1_DISABLE 0
>=20
>  /*
> @@ -146,42 +145,39 @@ static int xe_hwmon_process_reg_read64(struct
> xe_hwmon *hwmon,
>   * same pattern for sysfs, allow arbitrary PL1 limits to be set but disp=
lay
>   * clamped values when read.
>   */
> -static int xe_hwmon_power_max_read(struct xe_hwmon *hwmon, long *value)
> +static void xe_hwmon_power_max_read(struct xe_hwmon *hwmon, long
> +*value)
>  {
> -	u32 reg_val;
> -	u64 reg_val64, min, max;
> +	u64 reg_val, min, max;
>=20
> -	xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, REG_READ,
> &reg_val, 0, 0);
> +	xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, REG_READ32,
> &reg_val,
> +0, 0);
>  	/* Check if PL1 limit is disabled */
>  	if (!(reg_val & PKG_PWR_LIM_1_EN)) {
>  		*value =3D PL1_DISABLE;
> -		return 0;
> +		return;
>  	}
>=20
>  	reg_val =3D REG_FIELD_GET(PKG_PWR_LIM_1, reg_val);
>  	*value =3D mul_u64_u32_shr(reg_val, SF_POWER, hwmon-
> >scl_shift_power);
>=20
> -	xe_hwmon_process_reg_read64(hwmon, REG_PKG_POWER_SKU,
> &reg_val64);
> -	min =3D REG_FIELD_GET(PKG_MIN_PWR, reg_val64);
> +	xe_hwmon_process_reg(hwmon, REG_PKG_POWER_SKU, REG_READ64,
> &reg_val, 0, 0);
> +	min =3D REG_FIELD_GET(PKG_MIN_PWR, reg_val);
>  	min =3D mul_u64_u32_shr(min, SF_POWER, hwmon->scl_shift_power);
> -	max =3D REG_FIELD_GET(PKG_MAX_PWR, reg_val64);
> +	max =3D REG_FIELD_GET(PKG_MAX_PWR, reg_val);
>  	max =3D mul_u64_u32_shr(max, SF_POWER, hwmon->scl_shift_power);
>=20
>  	if (min && max)
>  		*value =3D clamp_t(u64, *value, min, max);
> -
> -	return 0;
>  }
>=20
>  static int xe_hwmon_power_max_write(struct xe_hwmon *hwmon, long value) =
 {
> -	u32 reg_val;
> +	u64 reg_val;
>=20
>  	/* Disable PL1 limit and verify, as limit cannot be disabled on all pla=
tforms
> */
>  	if (value =3D=3D PL1_DISABLE) {
> -		xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT,
> REG_RMW, &reg_val,
> +		xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT,
> REG_RMW32, &reg_val,
>  				     PKG_PWR_LIM_1_EN, 0);
> -		xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT,
> REG_READ, &reg_val,
> +		xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT,
> REG_READ32, &reg_val,
>  				     PKG_PWR_LIM_1_EN, 0);
>=20
>  		if (reg_val & PKG_PWR_LIM_1_EN)
> @@ -192,21 +188,19 @@ static int xe_hwmon_power_max_write(struct
> xe_hwmon *hwmon, long value)
>  	reg_val =3D DIV_ROUND_CLOSEST_ULL((u64)value << hwmon-
> >scl_shift_power, SF_POWER);
>  	reg_val =3D PKG_PWR_LIM_1_EN | REG_FIELD_PREP(PKG_PWR_LIM_1,
> reg_val);
>=20
> -	xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, REG_RMW,
> &reg_val,
> +	xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, REG_RMW32,
> &reg_val,
>  			     PKG_PWR_LIM_1_EN | PKG_PWR_LIM_1, reg_val);
>=20
>  	return 0;
>  }
>=20
> -static int xe_hwmon_power_rated_max_read(struct xe_hwmon *hwmon, long
> *value)
> +static void xe_hwmon_power_rated_max_read(struct xe_hwmon *hwmon, long
> +*value)
>  {
> -	u32 reg_val;
> +	u64 reg_val;
>=20
> -	xe_hwmon_process_reg(hwmon, REG_PKG_POWER_SKU, REG_READ,
> &reg_val, 0, 0);
> +	xe_hwmon_process_reg(hwmon, REG_PKG_POWER_SKU, REG_READ32,
> &reg_val,
> +0, 0);
>  	reg_val =3D REG_FIELD_GET(PKG_TDP, reg_val);
>  	*value =3D mul_u64_u32_shr(reg_val, SF_POWER, hwmon-
> >scl_shift_power);
> -
> -	return 0;
>  }
>=20
>  /*
> @@ -233,13 +227,11 @@ static void
>  xe_hwmon_energy_get(struct xe_hwmon *hwmon, long *energy)  {
>  	struct xe_hwmon_energy_info *ei =3D &hwmon->ei;
> -	u32 reg_val;
> -
> -	xe_device_mem_access_get(gt_to_xe(hwmon->gt));
> +	u64 reg_val;
>=20
>  	mutex_lock(&hwmon->hwmon_lock);
>=20
> -	xe_hwmon_process_reg(hwmon, REG_PKG_ENERGY_STATUS,
> REG_READ,
> +	xe_hwmon_process_reg(hwmon, REG_PKG_ENERGY_STATUS,
> REG_READ32,
>  			     &reg_val, 0, 0);
>=20
>  	if (reg_val >=3D ei->reg_val_prev)
> @@ -253,8 +245,6 @@ xe_hwmon_energy_get(struct xe_hwmon *hwmon, long
> *energy)
>  				  hwmon->scl_shift_energy);
>=20
>  	mutex_unlock(&hwmon->hwmon_lock);
> -
> -	xe_device_mem_access_put(gt_to_xe(hwmon->gt));
>  }
>=20
>  static const struct hwmon_channel_info *hwmon_info[] =3D { @@ -284,16 +2=
74,39
> @@ static int xe_hwmon_pcode_write_i1(struct xe_gt *gt, u32 uval)
>  			      uval);
>  }
>=20
> -static int xe_hwmon_get_voltage(struct xe_hwmon *hwmon, long *value)
> +static int xe_hwmon_power_curr_crit_read(struct xe_hwmon *hwmon, long
> +*value, u32 scale_factor)
>  {
> -	u32 reg_val;
> +	int ret;
> +	u32 uval;
> +
> +	ret =3D xe_hwmon_pcode_read_i1(hwmon->gt, &uval);
> +	if (ret)
> +		return ret;
> +
> +	*value =3D
> mul_u64_u32_shr(REG_FIELD_GET(POWER_SETUP_I1_DATA_MASK, uval),
> +				 scale_factor, POWER_SETUP_I1_SHIFT);
> +	return ret;
> +}
> +
> +static int xe_hwmon_power_curr_crit_write(struct xe_hwmon *hwmon, long
> +value, u32 scale_factor) {
> +	int ret;
> +	u32 uval;
> +
> +	uval =3D DIV_ROUND_CLOSEST_ULL(value << POWER_SETUP_I1_SHIFT,
> scale_factor);
> +	ret =3D xe_hwmon_pcode_write_i1(hwmon->gt, uval);
> +
> +	return ret;
> +}
> +
> +static void xe_hwmon_get_voltage(struct xe_hwmon *hwmon, long *value) {
> +	u64 reg_val;
>=20
>  	xe_hwmon_process_reg(hwmon, REG_GT_PERF_STATUS,
> -			     REG_READ, &reg_val, 0, 0);
> +			     REG_READ32, &reg_val, 0, 0);
>  	/* HW register value in units of 2.5 millivolt */
>  	*value =3D DIV_ROUND_CLOSEST(REG_FIELD_GET(VOLTAGE_MASK,
> reg_val) * 2500, SF_VOLTAGE);
> -
> -	return 0;
>  }
>=20
>  static umode_t
> @@ -317,23 +330,15 @@ xe_hwmon_power_is_visible(struct xe_hwmon
> *hwmon, u32 attr, int chan)  static int  xe_hwmon_power_read(struct xe_hw=
mon
> *hwmon, u32 attr, int chan, long *val)  {
> -	int ret;
> -	u32 uval;
> -
>  	switch (attr) {
>  	case hwmon_power_max:
> -		return xe_hwmon_power_max_read(hwmon, val);
> +		xe_hwmon_power_max_read(hwmon, val);
> +		return 0;
>  	case hwmon_power_rated_max:
> -		return xe_hwmon_power_rated_max_read(hwmon, val);
> -	case hwmon_power_crit:
> -		ret =3D xe_hwmon_pcode_read_i1(hwmon->gt, &uval);
> -		if (ret)
> -			return ret;
> -		if (!(uval & POWER_SETUP_I1_WATTS))
> -			return -ENODEV;
> -		*val =3D
> mul_u64_u32_shr(REG_FIELD_GET(POWER_SETUP_I1_DATA_MASK, uval),
> -				       SF_POWER, POWER_SETUP_I1_SHIFT);
> +		xe_hwmon_power_rated_max_read(hwmon, val);
>  		return 0;
> +	case hwmon_power_crit:
> +		return xe_hwmon_power_curr_crit_read(hwmon, val,
> SF_POWER);
>  	default:
>  		return -EOPNOTSUPP;
>  	}
> @@ -342,14 +347,11 @@ xe_hwmon_power_read(struct xe_hwmon *hwmon,
> u32 attr, int chan, long *val)  static int  xe_hwmon_power_write(struct x=
e_hwmon
> *hwmon, u32 attr, int chan, long val)  {
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
> @@ -372,19 +374,9 @@ xe_hwmon_curr_is_visible(const struct xe_hwmon
> *hwmon, u32 attr)  static int  xe_hwmon_curr_read(struct xe_hwmon *hwmon,
> u32 attr, long *val)  {
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
> @@ -393,12 +385,9 @@ xe_hwmon_curr_read(struct xe_hwmon *hwmon, u32
> attr, long *val)  static int  xe_hwmon_curr_write(struct xe_hwmon *hwmon,=
 u32
> attr, long val)  {
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
> @@ -418,21 +407,13 @@ xe_hwmon_in_is_visible(struct xe_hwmon *hwmon,
> u32 attr)  static int  xe_hwmon_in_read(struct xe_hwmon *hwmon, u32 attr,=
 long
> *val)  {
> -	int ret;
> -
> -	xe_device_mem_access_get(gt_to_xe(hwmon->gt));
> -
>  	switch (attr) {
>  	case hwmon_in_input:
> -		ret =3D xe_hwmon_get_voltage(hwmon, val);
> -		break;
> +		xe_hwmon_get_voltage(hwmon, val);
> +		return 0;
>  	default:
> -		ret =3D -EOPNOTSUPP;
> +		return -EOPNOTSUPP;
>  	}
> -
> -	xe_device_mem_access_put(gt_to_xe(hwmon->gt));
> -
> -	return ret;
>  }
>=20
>  static umode_t
> @@ -564,15 +545,15 @@ xe_hwmon_get_preregistration_info(struct xe_device
> *xe)  {
>  	struct xe_hwmon *hwmon =3D xe->hwmon;
>  	long energy;
> -	u32 val_sku_unit =3D 0;
> -	int ret;
> +	u64 val_sku_unit =3D 0;
>=20
> -	ret =3D xe_hwmon_process_reg(hwmon, REG_PKG_POWER_SKU_UNIT,
> REG_READ, &val_sku_unit, 0, 0);
>  	/*
>  	 * The contents of register PKG_POWER_SKU_UNIT do not change,
>  	 * so read it once and store the shift values.
>  	 */
> -	if (!ret) {
> +	if (xe_hwmon_get_reg(hwmon, REG_PKG_POWER_SKU_UNIT)) {
> +		xe_hwmon_process_reg(hwmon, REG_PKG_POWER_SKU_UNIT,
> +				     REG_READ32, &val_sku_unit, 0, 0);
>  		hwmon->scl_shift_power =3D REG_FIELD_GET(PKG_PWR_UNIT,
> val_sku_unit);
>  		hwmon->scl_shift_energy =3D
> REG_FIELD_GET(PKG_ENERGY_UNIT, val_sku_unit);
>  	}
> --
> 2.25.1

