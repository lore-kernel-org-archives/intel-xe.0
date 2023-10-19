Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C187FCDB482
	for <intel-xe@archiver.kernel.org>; Thu, 19 Oct 2023 06:05:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A85E10E485;
	Thu, 19 Oct 2023 06:05:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17A0810E48D
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Oct 2023 06:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697695505; x=1729231505;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Syg9UNIdef6K9QMh5SviBZ5MBgvouaRH6374TswibAE=;
 b=ncNiljNziu753cHudG14AcIUEBc0+3QkZuyYrheCd+l44/41l+ywg0uo
 uaUgKVUlzSEBimhvUBsJuHSQMLeujxqCZ46/yggIdPh/+l3JpFkntUvL+
 g80xRrvDNQ1au5uQSRAG6UsCV5nCmeOZYB5k+hG6u3KvDwEJJW2pNG0gS
 AFHSVtnZEumr/wfR5eDfDQuS5NS9UPYkV34MUk5buH0UdlN8twCHlKr4p
 9LWi2vfdgYA6Az93yydgx02b+PLrgY8DlaVBG0wBlrcc9s36KGb1ud1/Z
 2yvZjVTSQEYKjyshl7OCGhLrFDzrXAQDv5PmaRoRS8JSBlxKnCJZwwyy6 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="371246004"
X-IronPort-AV: E=Sophos;i="6.03,236,1694761200"; d="scan'208";a="371246004"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2023 23:05:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,236,1694761200"; 
   d="scan'208";a="4636115"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Oct 2023 23:03:55 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 18 Oct 2023 23:05:04 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 18 Oct 2023 23:05:03 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 18 Oct 2023 23:05:03 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 18 Oct 2023 23:05:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eWQ/l65Qee885/CSb+fWu9qowlA2k2luUKMsMgxp13DGzjxhAj0RVagQ9s4LDzxsW9PjAujLg+g9budmjrRR3motsb7q6uEFfSjk7D2xNt4GcEcZI6QAJcL0RwdkO+eJJiRwRNaCzA4St0KVCtNA8GZKW8lkBA4SjLN+fPjDfhlm5458B2aFITHLgnjXq1NDyW0x/Q6SRdjxWowBKdfXa8y9p+32n26zdLRdk2Kuy1v1YunEFi+s+HsK8tLirzGFV63gd4MXm/Vc6j2PDlmtdichoiZJkm3cknKbI8zEdtIAIk/ABvqEBdG1f5BnpwciOJUi7Lr5OFXDXs2mu27uSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gc/GcrYIJyvemVL9/+g1m7kKd6VaHe1F/R4llA/XQJM=;
 b=Ar4IncE05uoXa+J3Z6F2k4wtnI4V9MEK9A9mAFU/dcKo0Jtkych28HC+TK3ese2KU1r3qpe5B1yqeXT9ARDQzP+RaYWWYbf0IU8TYSpUnZbls76n5DTnQc6EGQd9XjlJok2I5lealRnw9rWIVJ2p2j/Woc1twCckhBWatwm2Cx9nvD0JeBK2dpy6CAUJexE9ZMw4Z+W95tRVQKzgaCdNiygp7nx375aIdqYbGkYgGB4jruBX3io1mtcFMnLWJBYVbu7mc7999NUImTXfEnGH3PGH+nVSgV0G4MpnQdhiF82+GlQtG20hvsLoSaPWOC4pLQ3YnbQyY91lfpHlpjtEpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6211.namprd11.prod.outlook.com (2603:10b6:930:25::6)
 by SA2PR11MB4985.namprd11.prod.outlook.com (2603:10b6:806:111::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.24; Thu, 19 Oct
 2023 06:04:56 +0000
Received: from CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::413:a622:bff4:bdd6]) by CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::413:a622:bff4:bdd6%4]) with mapi id 15.20.6907.025; Thu, 19 Oct 2023
 06:04:54 +0000
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Nilawar, Badal" <badal.nilawar@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Thread-Topic: [PATCH v2 1/3] drm/xe/hwmon: Wrap 64 bit reg accesses to
 xe_hwmon_process_reg
Thread-Index: AQHaAfTAtuC8WXRrBU6zSLK3sJLt57BQn6dw
Date: Thu, 19 Oct 2023 06:04:54 +0000
Message-ID: <CY5PR11MB6211E43E9DC96961DA842F1795D4A@CY5PR11MB6211.namprd11.prod.outlook.com>
References: <20231018190341.726098-1-badal.nilawar@intel.com>
 <20231018190341.726098-2-badal.nilawar@intel.com>
In-Reply-To: <20231018190341.726098-2-badal.nilawar@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6211:EE_|SA2PR11MB4985:EE_
x-ms-office365-filtering-correlation-id: cb9f3508-8c10-43f1-3b7e-08dbd06950a6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: al0hakqeVla0PtdQ0fKDqvXXnJ0/NnLVqJzl039kt7Tt33kSmv+gecfQRFsfOCWRSuyLnaUrFT2wGcQVxFOcwsWNFGtdrotQzWe1aAXlBK84Rhu52WfIAUXAFCRZSNfK1Gn4d22ZbDn8XovJi55uQ1NtOS7MywyEvzb4339suSeuZ7qWR85yFOQqTVy0JS0j1TYRCpvP4BC8S5BnGEcq1yJNHKxvzim1i7Gvs/ekBCzgJVavc4ixslkx9isS0L+wciUYCuUI2qoTsCT6gppxgXHH3pY0nJ9rSp4U/ZKjSG8sL4/IRjuIbFehhij9xU/iYD//iX7briYBCSAuG/i902KAaOYaWJDLeDGqyqw5T6WOHmqqAotS2j5taMcd7t+qejL4dSQs5P4680dorQqlimcLcyHmGRnHw2Kfm2FYonEwBVLZqWkuG8B7z57dk+7JGsXucG62GXCprbfXLr0+jqXWBD2QoZ4/UHKCoYrwsU+hoY64BtaabivLS1h1/U8+hYUzjIaDhG16jkzQYl3M5Oh6U1gKaornR0iF8W2/07YwOK2HhpCyQULrsZ/1nkXatVOXsHB2UdpBuo1kLOJRiiFK7DUlhNGXyWxhXnRKBC+kNIkxpVQ6X8uv6w/8S/+V
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6211.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(396003)(39860400002)(366004)(346002)(136003)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(71200400001)(6506007)(26005)(7696005)(9686003)(53546011)(83380400001)(52536014)(4326008)(8936002)(5660300002)(8676002)(2906002)(478600001)(41300700001)(64756008)(54906003)(316002)(66476007)(110136005)(66446008)(66556008)(66946007)(76116006)(122000001)(82960400001)(38070700005)(38100700002)(86362001)(33656002)(55016003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?5T7mFiE7Qd10d05NZzHc08xpi+xEU9SH/j3GtV1RM53M+Or4w7x87ZWGqbVl?=
 =?us-ascii?Q?7JaeXCIFBHMACcCVTu3UHJXNdyTpTVSTII6VclYEJ83Dmhv3ikMEvDzGihwA?=
 =?us-ascii?Q?WuE7hYIxON3BFMDdcLgcIN2Zp+wNEgLL/SmUdbnCKH5KOVyzXqHeGoB5694r?=
 =?us-ascii?Q?IWujU35+yeQl1Yu7tOfORwUfDdY5D/PEn5M+P1yvEVWPCBrQMU3Uj8QoPgX2?=
 =?us-ascii?Q?WQ/7ytITerrqB/9kfnXwUZCcKaAlrPDMou5rvAvwkKiPJO4GvuVv/MXtsX4p?=
 =?us-ascii?Q?5cOcnQKNQjirSWG+O55ti3rDHaFaDmLTxXLGU0wTE5Fq/s+wEnMfwSkKt9Ny?=
 =?us-ascii?Q?B8D5ixEskFTVBPI+QQpdQ9MfiyLMff1ePkaO7IQ2nRyS6wVMuJ9cJrafLaKK?=
 =?us-ascii?Q?/Hb1XW7XQexQ7fn7L7lZ7caQBj5E24RLGMotVvwkX3w1Ye+cvdmrNXGJKY0Y?=
 =?us-ascii?Q?hzv5cQZHLndOOYFT6liBijfJlPRcrbVd/K6771Gl44H9lVIY8mmlTuyVU2db?=
 =?us-ascii?Q?HwAS5Y3Yr908f8ryJZ4w0j25zzH1WDbMHHBA2b/F8k1r5X8VGv+SCBVzLJoI?=
 =?us-ascii?Q?pAW48CmGH7bPEC4YcpPcIOg82nGpyJCbKsFdStL8XtIdKNdGq4MsoV9q6UBH?=
 =?us-ascii?Q?3jyUVrsphnzVmaDwc6rpRzlhw+zZdU6y1u5/RgH9uxbyYDLBC/MZq4QVcfxD?=
 =?us-ascii?Q?++PZixHDVH9l4Sgqt5WPbxIAl7KrnLOzq31atlvFdQc5//0KFEfX1n1WWVOa?=
 =?us-ascii?Q?okA/olGt2j9XkDQ/p7psB0O/VQQeiVuQlMLg94ZT/ERt6O8D7XrQmwvlvZ+s?=
 =?us-ascii?Q?Dc5J28w8LVi0oHJEWdhwPbgT8175vwKfEQdkLFJPYMTOnr3lEW3twZYOqxCx?=
 =?us-ascii?Q?Ai8ne6KnGu3WB/mK+OINEDBoeLiNXVTLTcL6QSffK7B6dhZLKjrMzjGdM4OL?=
 =?us-ascii?Q?DwZrJAKhkjxm8Hkd9lvZepJ2TL6IehXCaEoybuslY158oTHjbfY6Axb7Wvfj?=
 =?us-ascii?Q?NixS9MeY5fflG2gUI+VzXTqOxkkCL1sqLeZyLiAs+Gaa5XmgnJcxdlLEQiu7?=
 =?us-ascii?Q?tOVDElBcLucF52a9GccLCT25g+ne5BCtrqV/BUphNRYqDyIEJL+jt3jOz0j6?=
 =?us-ascii?Q?9EHJgbsqYjfjuDnAa/eqjlDH3YZANuxuvl+9VElv5fJvRgZDUyOCadFDZVSK?=
 =?us-ascii?Q?NPMmcYZLE1oS65u1s7Da+y6jTXfasABlccdbIeu+ucn9uaYMHt+5thxdJEAM?=
 =?us-ascii?Q?27wzMp05XimgIkQ3D+1MTNva+FI/absMllZNX5hOw3Mh+8XgFTI3RYL2tA/A?=
 =?us-ascii?Q?KJJXEnSpiFZpTckvsfvjllwHSuhTN7agwMbAuhEp0BUjZAH1XdPp8eH+iuqt?=
 =?us-ascii?Q?m7UqEWO37c7VTyfF4puzdSZzRuY4xM/xjBlXfwwZPwZbcDLlg3lZEPXI2U/y?=
 =?us-ascii?Q?L6/lygjwsnNK4upD3zMo2U/Q5UWZynox2U9PCzeYzUbPQYsKkoYhJgGsC93G?=
 =?us-ascii?Q?/XhjpilL4jk3DAEKbaLL36wDabmp6Iu8Y7CGhSHgDzPH8RM5wDphLv1BJnWa?=
 =?us-ascii?Q?1dKRGgVRugWbb9gYE9Aw8t1/7uqKs8wYNOAr3VAJ?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6211.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb9f3508-8c10-43f1-3b7e-08dbd06950a6
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Oct 2023 06:04:54.5742 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: G5UDuU/O7GnKNSbz7IVi5jB9FzqCiy8fSz8ZfyJCJkVo7SN0Dn5e4LukhFbm/CxXO3G8TTMHC9Ww8EBcxrNjhMTYgCUMX0G3CRat4XJJd/M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4985
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 1/3] drm/xe/hwmon: Wrap 64 bit reg
 accesses to xe_hwmon_process_reg
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
> Subject: [PATCH v2 1/3] drm/xe/hwmon: Wrap 64 bit reg accesses to
> xe_hwmon_process_reg
>=20
> Maintain single wrapper for 32 bit and 64 bit reg accesses
Missing full stop here.
The patch should do only  the stuff mentioned in subject, converting functi=
on
to void should be another patch.
With that,
Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
>=20
> Cc: Anshuman Gupta <anshuman.gupta@intel.com>
> Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_hwmon.c | 122 +++++++++++++---------------------
>  1 file changed, 45 insertions(+), 77 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c
> b/drivers/gpu/drm/xe/xe_hwmon.c index 9ac05994a967..08c7289723ae
> 100644
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
> @@ -95,49 +95,34 @@ static u32 xe_hwmon_get_reg(struct xe_hwmon
> *hwmon, enum xe_hwmon_reg hwmon_reg)
>  	return reg.raw;
>  }
>=20
> -static int xe_hwmon_process_reg(struct xe_hwmon *hwmon, enum
> xe_hwmon_reg hwmon_reg,
> -				enum xe_hwmon_reg_operation operation,
> u32 *value,
> -				u32 clr, u32 set)
> +static void xe_hwmon_process_reg(struct xe_hwmon *hwmon, enum
> xe_hwmon_reg hwmon_reg,
> +				 enum xe_hwmon_reg_operation operation,
> u64 *value,
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
>  		drm_warn(&gt_to_xe(hwmon->gt)->drm, "Invalid xe hwmon
> reg operation: %d\n",
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
> @@ -146,42 +131,39 @@ static int xe_hwmon_process_reg_read64(struct
> xe_hwmon *hwmon,
>   * same pattern for sysfs, allow arbitrary PL1 limits to be set but disp=
lay
>   * clamped values when read.
>   */
> -static int xe_hwmon_power_max_read(struct xe_hwmon *hwmon, long
> *value)
> +static void xe_hwmon_power_max_read(struct xe_hwmon *hwmon, long
> +*value)
>  {
> -	u32 reg_val;
> -	u64 reg_val64, min, max;
> +	u64 reg_val, min, max;
>=20
> -	xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, REG_READ,
> &reg_val, 0, 0);
> +	xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT,
> REG_READ32, &reg_val,
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
> +	xe_hwmon_process_reg(hwmon, REG_PKG_POWER_SKU,
> REG_READ64, &reg_val, 0, 0);
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
>  static int xe_hwmon_power_max_write(struct xe_hwmon *hwmon, long
> value)  {
> -	u32 reg_val;
> +	u64 reg_val;
>=20
>  	/* Disable PL1 limit and verify, as limit cannot be disabled on all
> platforms */
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
> @@ -192,21 +174,19 @@ static int xe_hwmon_power_max_write(struct
> xe_hwmon *hwmon, long value)
>  	reg_val =3D DIV_ROUND_CLOSEST_ULL((u64)value << hwmon-
> >scl_shift_power, SF_POWER);
>  	reg_val =3D PKG_PWR_LIM_1_EN | REG_FIELD_PREP(PKG_PWR_LIM_1,
> reg_val);
>=20
> -	xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, REG_RMW,
> &reg_val,
> +	xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT,
> REG_RMW32, &reg_val,
>  			     PKG_PWR_LIM_1_EN | PKG_PWR_LIM_1, reg_val);
>=20
>  	return 0;
>  }
>=20
> -static int xe_hwmon_power_rated_max_read(struct xe_hwmon *hwmon,
> long *value)
> +static void xe_hwmon_power_rated_max_read(struct xe_hwmon *hwmon,
> long
> +*value)
>  {
> -	u32 reg_val;
> +	u64 reg_val;
>=20
> -	xe_hwmon_process_reg(hwmon, REG_PKG_POWER_SKU, REG_READ,
> &reg_val, 0, 0);
> +	xe_hwmon_process_reg(hwmon, REG_PKG_POWER_SKU,
> REG_READ32, &reg_val,
> +0, 0);
>  	reg_val =3D REG_FIELD_GET(PKG_TDP, reg_val);
>  	*value =3D mul_u64_u32_shr(reg_val, SF_POWER, hwmon-
> >scl_shift_power);
> -
> -	return 0;
>  }
>=20
>  /*
> @@ -233,13 +213,11 @@ static void
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
> @@ -253,8 +231,6 @@ xe_hwmon_energy_get(struct xe_hwmon *hwmon,
> long *energy)
>  				  hwmon->scl_shift_energy);
>=20
>  	mutex_unlock(&hwmon->hwmon_lock);
> -
> -	xe_device_mem_access_put(gt_to_xe(hwmon->gt));
>  }
>=20
>  static const struct hwmon_channel_info *hwmon_info[] =3D { @@ -284,16
> +260,14 @@ static int xe_hwmon_pcode_write_i1(struct xe_gt *gt, u32 uval)
>  			      uval);
>  }
>=20
> -static int xe_hwmon_get_voltage(struct xe_hwmon *hwmon, long *value)
> +static void xe_hwmon_get_voltage(struct xe_hwmon *hwmon, long *value)
>  {
> -	u32 reg_val;
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
> @@ -322,9 +296,11 @@ xe_hwmon_power_read(struct xe_hwmon
> *hwmon, u32 attr, int chan, long *val)
>=20
>  	switch (attr) {
>  	case hwmon_power_max:
> -		return xe_hwmon_power_max_read(hwmon, val);
> +		xe_hwmon_power_max_read(hwmon, val);
> +		return 0;
>  	case hwmon_power_rated_max:
> -		return xe_hwmon_power_rated_max_read(hwmon, val);
> +		xe_hwmon_power_rated_max_read(hwmon, val);
> +		return 0;
>  	case hwmon_power_crit:
>  		ret =3D xe_hwmon_pcode_read_i1(hwmon->gt, &uval);
>  		if (ret)
> @@ -418,21 +394,13 @@ xe_hwmon_in_is_visible(struct xe_hwmon
> *hwmon, u32 attr)  static int  xe_hwmon_in_read(struct xe_hwmon *hwmon,
> u32 attr, long *val)  {
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
> @@ -564,15 +532,15 @@ xe_hwmon_get_preregistration_info(struct
> xe_device *xe)  {
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
> +		xe_hwmon_process_reg(hwmon,
> REG_PKG_POWER_SKU_UNIT,
> +				     REG_READ32, &val_sku_unit, 0, 0);
>  		hwmon->scl_shift_power =3D REG_FIELD_GET(PKG_PWR_UNIT,
> val_sku_unit);
>  		hwmon->scl_shift_energy =3D
> REG_FIELD_GET(PKG_ENERGY_UNIT, val_sku_unit);
>  	}
> --
> 2.25.1

