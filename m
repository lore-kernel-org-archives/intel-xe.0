Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5467CA9ED5
	for <intel-xe@archiver.kernel.org>; Mon, 12 Oct 2026 06:16:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C61C10EEA4;
	Mon, 12 Oct 2026 06:16:33 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5439710EEA4
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Oct 2026 06:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791785787; x=1823321787;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=o7XI+wDwywmekdyPNx3q2+++AHHuzUBuqGnKMkj9a4g=;
 b=FNGZqzC8wjpH4+ybDVFPg/wZJOWPEj+fyEL06AdmJ3SS39aG+xxhwON1
 +y85D71NWHJCW09MRZcIp15Brq+Otuf7NU3LUb1R61WhcGCa7njMvkttb
 x09kbneLuS6xBxFOtyGKjSyzWY7+C/tepWkvKOxKk09ByLnrgbIA6/mgo
 jgCtIDGZJVBzBNAxgt+bP9QcNeARQC/cwMbwYMq7Hg4dPi9tQrGva52sI
 Iu015RAtFgtN8iR8r4eqnWux33/cQiTNeahmAgvqODdOQ28Stm8k3vdJl
 dCfiMxQNq6vrwF3vJoFF8FqW/VXSc2EgcCYG+6DqgdgEvCDbnTW35TsHA g==;
X-CSE-ConnectionGUID: 3/2JOVtEQWCY0kNF4PNPIw==
X-CSE-MsgGUID: TqDZmZ/nQQawhcs7gUQJVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11932"; a="374037"
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="374037"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2026 23:16:11 -0700
X-CSE-ConnectionGUID: ZqaRbQ2CSQiibc5aRkwuRA==
X-CSE-MsgGUID: m2B3xedOQ5GXmDdMMnOMKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="789897"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2026 23:16:11 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Sun, 11 Oct 2026 23:16:10 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Sun, 11 Oct 2026 23:16:10 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.54) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Sun, 11 Oct 2026 23:16:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WBVD7Ybph5ethzx0SE+rtFDcfxCfIUgY6HOLwwRaASVY02io2S2w5YkSlTpUXUAldLZRvu3KH4caG5JGgGuiZOKBeLMep2N/5ZI8TF4H5ybnkYrY6x6uipGMi/idzmfK71OZW02qHiMWfVd86g4Fo8fBWrSObdLuAl8p/p8RX8bcUW0nt23r3NSa6qjrpXTLBbXYJoEHFH2CU/5jLJhnkgC5N7iIzJVNZsJjjnsXkGNGGFx8XbcvHSuoy1xFOXbMSBVCsDroEtUZl29a1GUObBlXnvD6WvKHv88GbEJmgAwYZcRccFZxWaijBquJoa64/rJgdhTtA9xiOLRdjLHWWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zRvd3slT3Ehe2OnpfSnjMMjRONP1TEHNAnTM/G/mhig=;
 b=wmwRIWPV/Z1GHrBHWIZEDK1kK2H9EjLBX6yYV14l8Hx61N3/LQporxr8dqqYNKc787tzvggJS7F0fpnrwaMBrnNvrRzgeFITFg1WSRpdhyyBXVFOFqkuf9+SCNQcjHuQ3nWrI14XYoG9l7gy2Zm1Uh0pRsfzR6AUYSCfZ1tF+M6kHmUkGdsyesrGwctALNxtgR3LTwW5ojFti98KUR8KZigHhgR+63vu9lnqAMIpn/5zVJ0Pn2WkaBUDQvdAW/j8+WA5RX1fsIx+8U6yvE4VwNaGfSz92XL/9z8hE+4ldO0RdL1y4P9MoX8BQp3PPDtpfDAPHDJv/emQ7sY7UyDIUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB8718.namprd11.prod.outlook.com (2603:10b6:8:1b9::20)
 by SN7PR11MB7540.namprd11.prod.outlook.com (2603:10b6:806:340::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.20; Mon, 12 Oct
 2026 06:16:07 +0000
Received: from DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c]) by DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c%4]) with mapi id 15.21.0496.020; Mon, 12 Oct 2026
 06:16:07 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Tauro, Riana" <riana.tauro@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Tauro, Riana" <riana.tauro@intel.com>, "Gupta, Anshuman"
 <anshuman.gupta@intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "Jadav, 
 Raag" <raag.jadav@intel.com>
Subject: RE: [PATCH 3/3] drm/xe/xe_hw_error: Handle non-fatal errors routed
 via direct IRQ
Thread-Topic: [PATCH 3/3] drm/xe/xe_hw_error: Handle non-fatal errors routed
 via direct IRQ
Thread-Index: AQHdOEy1H9m21RQUwU6/Kc84+j55dbb5sNjQ
Date: Mon, 12 Oct 2026 06:16:07 +0000
Message-ID: <DS0PR11MB8718EB07069F3D70DB15E0D5819F2@DS0PR11MB8718.namprd11.prod.outlook.com>
References: <20260830065603.419055-5-riana.tauro@intel.com>
 <20260830065603.419055-8-riana.tauro@intel.com>
In-Reply-To: <20260830065603.419055-8-riana.tauro@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB8718:EE_|SN7PR11MB7540:EE_
x-ms-office365-filtering-correlation-id: ee70581a-932d-4e9b-a2c7-08df28284d83
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|261009223027099003|38070700021|56012099006|11063799006|4143699003|10067099003|18002099003|22082099003;
x-microsoft-antispam-message-info: ElMgR+aElYZJCEOJupWPPmOsjztwqdFpaVXhXbCDKRwmuff33GuC0io7duYPkQneZcj3QD83xDjS09VKvgLu1Ly860pB3jgt6SzSo3rJYpmk9UJhEwqMFKJENrnYaya8NYH6RxlDxZnJ7roOOqUomSqb9K0CgGxjvU/hinIpCsaRfzEOap87xFf1G464oIbye+euantR4yVwKnQ46+jpERZHrJ7b1zGB6zzbTGAomxD31+qhAQXNGfAzq3Q1gf2Mlt9cH5codv5vXJ4uFLchIu2a/jgeFmBswiSW0rCKPCG+kfA2q6j+ATedgPyZFeieGR5X13Vdztnh1uCow+SOGPxBD3VvxHp0Qk7NsGdovJZunMrEjtcAwCr0npeI8upK2bEi6jCXj2UaWfUVYn0jL3qTXvAQVR7CFVv0RzSiWT2B9wQSmwfQ9H8wMCORg64XXdr/IlprPs0BBGA6x5VwZwtVMUT/NxS+Rp/ALBOx2Lf5kjfbCISfFh6HQr536Bf1URGy94kXrJsxyo2AsAT6hSypDEtlpMEx+/0zoUlrpAENuKm+ZmjIb+Lfbx8AUt9a9KSf+cZvZjygT9H+vHqQQmk4UFuOVFmg6p6gNt72xEI1MXitPpQz+ljjmL1S57cDLjFhBAzIITVeCK7Whdn9NuqXb/6FysS0eW/LOLN8f0vBUeF2BKFXLpq3cpO41/iH2qV02HyJ3mwJ+z7dNS0gr0oLoxRXgLdoxOYBIYlFHrA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8718.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(261009223027099003)(38070700021)(56012099006)(11063799006)(4143699003)(10067099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?z3ifmvwmzJPAlmY9sE7SVGwn2BPMsVuphBSHV9CzhOyNYXd1bqNsT0PhWYEQ?=
 =?us-ascii?Q?mIc0ZKZ/WpamKtnuyTa3xcUnwOeWjFWKsnTt26VMnadNtUDjTKM9f/YouUrt?=
 =?us-ascii?Q?OtbSfQA9xJxMWD5uWxkOzLquQittyDxq6Q15l7enFAGgoyTkrhTMmHayPR8D?=
 =?us-ascii?Q?LNmXpyoUVIDMAVr1/Lrdm7uz9KkEaHAkCt94xVervDm6WOLmTvUuCdhKHgA8?=
 =?us-ascii?Q?uKQtNnYKhx1vyblnAI0uvlypnvKh+H/IJMqL05oBcxB6OmJBUDxCfd/CPxJR?=
 =?us-ascii?Q?740K3U/w5AIbrC5iqRuia10TZFj+iXIlqcbsuQ8QrVkO6toI+3lzIO9VIMwY?=
 =?us-ascii?Q?/vQebPgMoeZ39mWcuwUC5Ooz+vqFwrKsj2gBs1smcdFFhwaOVSSQSE51YGwq?=
 =?us-ascii?Q?PJspyk9zBW7GVdPiRJGFJqhABXo8NUMEXCzqcIWrA0950+4cOmBwjxFO8DIP?=
 =?us-ascii?Q?CJOBxvN4pgqGvdPNJfsNylMx+bAjukxX5mIEZlawdbfhhr2Sr0aH67o5cebo?=
 =?us-ascii?Q?XcGxPAcrCvQeEsxzFkEdDtHvTH2yJ5PlqRw+HS9JvSQOWzK748I9p7Mm7wFq?=
 =?us-ascii?Q?+EcqZOZHRhQS9+rWZJ81KikqPl91mVIESYohnx1d2jyPvSIPk2bXr+Ah84Ky?=
 =?us-ascii?Q?1gsRakFz+6kLMhjZrReRsP9ZSnl41L/SkNbP1UoE8TbNAJuaKpaeA42UWaMU?=
 =?us-ascii?Q?mHskbik/Xu6tfxxxgjDpVYDZF78colXDJrDbxwCukQpp+doHu0fO7pg9JiJg?=
 =?us-ascii?Q?PlPxYsIYBDDqmRtScQ8vsKwPAvmi0hAjk+l0LZydeCq5rxAU522TQj6twrS7?=
 =?us-ascii?Q?ki0eWZ/4qJpEFQndtuJFfz3kCaV5u+Vq47QVKzG/owR/lVqGD18jVWiLs0Q3?=
 =?us-ascii?Q?h86UyfDKJB0BckS3R/Y+KduIsd13Bw4G30FIPd8aUOT/IX7UwtdJNhxmcgwP?=
 =?us-ascii?Q?3zNM3PtcAk4hkKZew7g41HnjTp6bA4JaW2oi/h16yIgCI6zKMKYsYASLCxNs?=
 =?us-ascii?Q?NFwLmqGm6hWI6voL+by98qRpvI3gMTCTCbER8Ts/74sFZ8TW6NPjZh5yRqKp?=
 =?us-ascii?Q?xmaTNNUnFUmOuCnnjsyfxBh9jWHWDWafe91DPVk4U5Vaehz+kux8H6OhSvWo?=
 =?us-ascii?Q?ekstrLNX4cXiUiSyTZ853eC56XuGQD2MP5tDHXu3TDpBpvuXwArHGKBnC/gU?=
 =?us-ascii?Q?O9ARVnZ6HQG7dUspPxrx2wEWLAzLBVL2/IwOZa3uECoGunu+NFq0YjZnSIQn?=
 =?us-ascii?Q?PCKVGqAg+Uf31fg2E2skIkq/eSUfFajPZewyaioDmiRaAR4guKwS8rBoUTSB?=
 =?us-ascii?Q?nhwTDc38aQ6VxN0DLpY4aPC/D7tsEbltZMi0ROVGR1dbH+OOgTSRu/56aerS?=
 =?us-ascii?Q?ZgQU+kbDxtb9ksG68ymCenkryjK3rSmCYVFUi8wggHYEWP+DxFVQXQu9G7Bi?=
 =?us-ascii?Q?I/mDfo/FEb994Va3XddP2U4MyhPw+S8vq0K1Xh/R6RYEFHdY5rm0snShvpcB?=
 =?us-ascii?Q?GtHDcl3YWwp0Ni/wyXUc8r6O3nqzhy5Ux/W8g3eLog1KXHCceBMskQUpjiBX?=
 =?us-ascii?Q?pjHG/8XCbbsQ+GFBIH74ltec5iN+9JaQQ4itmUxvKE3P3Y+iKA5ayItV5Yie?=
 =?us-ascii?Q?hR9sZHJ7VwO5ZSdFZwEXyvnQGHmV2oKoPZpxA/JR0ymqseRabo2rCd2xBEEA?=
 =?us-ascii?Q?/C6drXOwNBqPsZt1XMcGqtbmqxVJr1dMU9yH1bucNVNJjpHpwzaJpdXgUkw4?=
 =?us-ascii?Q?6yLe5FwOdg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: teqfkCORAURedEG16zmVWORZwz1tA3vFq/7IkULWmSoA35z3Aa6PID9kJipY8JYsp6thhGn+3RkDT+2IQ87y1UQoJiUgqdtdQtmLAra2Z/W47nREfXIidDGXuNJHdYYGlISaIZ+U/imD7vTIhvO7M4IZoNbPgf3Oq5e5D3SCzTqMM3S21SgXMaGwGW1Auzmk8sOfEfMMKo3pFo8fWHJ2+sb2OSl1kYnibHcVJqTu7CkQd9Bk2j97RlCBxd5EsiG9e72Rn/MVhXlYgBwEjKG/RM7JsYjKD8oscv21hVmmEwWM50dIcrqIRx5KyfVCqI5M60lwgdMv07JcON2wMX/EfA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8718.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee70581a-932d-4e9b-a2c7-08df28284d83
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2026 06:16:07.4013 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Q3MzbZf8eyoGdsrMSJv5o39md3ybbzI2MMDC9EoxXtoWDLFAsrd1Wnl7Z7gIQMJRdLCQu+i4lXyc1RwOTMrwMWUs3e00C6D/G4qQrRCStyc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7540
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
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Rian=
a
> Tauro
> Sent: 30 August 2026 12:26
> To: intel-xe@lists.freedesktop.org
> Cc: Tauro, Riana <riana.tauro@intel.com>; Gupta, Anshuman
> <anshuman.gupta@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>; Jadav=
,
> Raag <raag.jadav@intel.com>
> Subject: [PATCH 3/3] drm/xe/xe_hw_error: Handle non-fatal errors routed v=
ia
> direct IRQ
>=20
> Process, log and recover non-fatal errors routed via direct IRQ. For erro=
rs that
> cannot be recovered locally, wedge the device with bus-reset as the recov=
ery
> action.

We should mention WA # under which this is proposed?

>=20
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_hw_error.c | 37
> ++++++++++++++++++++++++++++----
>  1 file changed, 33 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_hw_error.c
> b/drivers/gpu/drm/xe/xe_hw_error.c
> index 5a57b7eaebc3..8435c74147ed 100644
> --- a/drivers/gpu/drm/xe/xe_hw_error.c
> +++ b/drivers/gpu/drm/xe/xe_hw_error.c
> @@ -14,6 +14,7 @@
>  #include "xe_drm_ras.h"
>  #include "xe_hw_error.h"
>  #include "xe_mmio.h"
> +#include "xe_ras.h"
>  #include "xe_survivability_mode.h"
>=20
>  #define GT_HW_ERROR_MAX_ERR_BITS		16
> @@ -165,11 +166,38 @@
> static_assert(ARRAY_SIZE(pvc_master_local_nonfatal_err_reg) =3D=3D
> XE_RAS_REG_SIZE);
>=20
> pvc_master_local_fatal_err_reg : \
>=20
> pvc_master_local_nonfatal_err_reg)
>=20
> +static const char *hw_err_to_str(const enum hardware_error hw_err) {
> +	switch (hw_err) {
> +	case HARDWARE_ERROR_CORRECTABLE:
> +		return "Correctable";
> +	case HARDWARE_ERROR_NONFATAL:
> +		return "Non-Fatal";
> +	case HARDWARE_ERROR_FATAL:
> +		return "Fatal";
> +	default:
> +		return "Unknown";
> +	}
> +}
> +
>  static void hw_error_work(struct work_struct *work)  {
>  	struct xe_tile *tile =3D container_of(work, typeof(*tile), hw_error_wor=
k);
>  	struct xe_device *xe =3D tile_to_xe(tile);
>=20
> +	if (xe->info.has_sysctrl) {
> +		int ret;
> +

Should you hold wakeref!

> +		ret =3D xe_ras_process_errors(xe);
> +		/* For any non-fatal errors that do not return recovered,
> declare wedged */
> +		if (ret) {
> +			xe_device_set_wedged_method(xe,
> DRM_WEDGE_RECOVERY_BUS_RESET);
> +			xe_device_declare_wedged(xe);

SBR is planned later in phased manner, should you mention TODO?

Tejas=20
> +		}
> +
> +		return;
> +	}
> +
>  	xe_survivability_mode_runtime_enable(xe);
>  }
>=20
> @@ -431,12 +459,13 @@ static void hw_error_source_handler(struct xe_tile
> *tile, const enum hardware_er
>  		return;
>=20
>  	/*
> -	 * Hardware errors are reported through System Controller on the
> platforms that
> -	 * support it, and never routed as direct IRQ to SGUnit. So we should
> never be
> -	 * here for those platforms.
> +	 * Non fatal errors are routed as a direct IRQ on platforms that suppor=
t
> +	 * system controller.
>  	 */
>  	if (xe->info.has_sysctrl) {
> -		drm_err_ratelimited(&xe->drm, HW_ERR "Invalid error
> routing\n");
> +		drm_err_ratelimited(&xe->drm, HW_ERR "%s %s reported\n",
> hw_err_to_str(hw_err),
> +				    severity_str);
> +		schedule_work(&tile->hw_error_work);
>  		return;
>  	}
>=20
> --
> 2.47.1

