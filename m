Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BD72C48BF6
	for <intel-xe@archiver.kernel.org>; Thu, 29 Feb 2024 13:53:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9213310E0BF;
	Thu, 29 Feb 2024 13:53:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Oycw/itv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F23F110E0BF
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Feb 2024 13:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709214814; x=1740750814;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=Ite4UuQOAZaFcEXFZj5ucVPhZzVrdyUU0AmdJ1o8XAI=;
 b=Oycw/itvaxKYIkV+aqnKymdIdNTnRoq2l+ePKDVBAc+P/gTG10w4uveG
 57Fzu0aMdo0RNjt0hJzUl7HMhTYsyDbPHFOdnR1VP8oZawoF+dtRmkBKZ
 L7Ya3NqIEBgUbe1gu0hW0v6U42I9BQVk15B0LwZjLHAddtcbw3gLwszCZ
 IgJ2vAwajlyL1AlvCnrqD4ZD6oHaJDv9atKzl83i4pU8H+2oQ56GWK2Lc
 uQPZtcmnEyDpJ9i29q74nfZaaud2B5lfqblqZATFLQ93CeVJnHnIKNAfz
 9vrnaUhO48gcuq0eR4hprOeRDLWFD2xGfRIZvQQU0Er7iVhEinoAguv0J Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="3848552"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="3848552"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Feb 2024 05:53:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; d="scan'208";a="38861225"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Feb 2024 05:53:33 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 29 Feb 2024 05:53:32 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 29 Feb 2024 05:53:32 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 29 Feb 2024 05:53:32 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 29 Feb 2024 05:53:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D3wmALmi0fUzvhpDojDT4zkQaYjOPvtzTvaBji0dcmYm1UTJqBu60L4Q3vEvjD21euZK2eiBur8G6jv6Wse4YaCd/71AdYwW1cjDJ9vZ1ukPhR5cj+4v9TPso+wJ76IsHjsnh5ZKvpC22HqAjsjWsD2TTyRYyY/MxqMMNL5Ymtvl86onCZ6mg2+Hdva3+6Ex1scSgL+QPxQWD0f3zZggHcnz7UKdRS0+d9FJhV9oJwPLnrMJ2hEylFBvHoWQeYx+ydEYvnzFOr8iJuPG9JVsw1MntGaBnWQzryTniIXRXsdopHEappz1gUAn5Eko8vp7sL06dGK/fbT15hoVKkDMOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+/LH2cQkATicsCSRYx/dci7IM/X4vV9g72jth4ZnlAk=;
 b=VZpbpHO1CMXq9/JlpuGZ0F7G+QJDld0LVUdZ08TKz9uTTsgWRlaNX7oFYA+KfQh5txGCpuXGTkNC3ZBEBJb6pytZiP40nTHiEFmK5tHf4fIQV7kDSKg1GY1VTsY//Z04SdZG/+UJz9EUn7jJ3FqdYwYI9g9HMNn4hWkl74jUV6QXX74+8lYVH+kh9uBL+B7nENC0pbW/pGQFbSCkgXicyzIe2xONcO3rK5XtVbKeW9D0bgHM3D/p7O7n7wi3NLQCXG3LHonAVWucoHIxvxY+RKoTXynIPIomHE/zZjzwXprmei+1v/fuLCdNN3TX35Vm6huxbQxji73OpF/T7AMh1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6211.namprd11.prod.outlook.com (2603:10b6:930:25::6)
 by DM6PR11MB4707.namprd11.prod.outlook.com (2603:10b6:5:2a6::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.25; Thu, 29 Feb
 2024 13:53:30 +0000
Received: from CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::35eb:1d4b:b90f:e584]) by CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::35eb:1d4b:b90f:e584%3]) with mapi id 15.20.7362.010; Thu, 29 Feb 2024
 13:53:30 +0000
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH] drm/xe: Stop checking for power_lost on D3Cold
Thread-Topic: [PATCH] drm/xe: Stop checking for power_lost on D3Cold
Thread-Index: AQHaaazfw1fx+SZWlUyhT7lc+NIlKrEhWBOg
Date: Thu, 29 Feb 2024 13:53:29 +0000
Message-ID: <CY5PR11MB62117835642F0EA2444E997D955F2@CY5PR11MB6211.namprd11.prod.outlook.com>
References: <20240227184330.506881-1-rodrigo.vivi@intel.com>
In-Reply-To: <20240227184330.506881-1-rodrigo.vivi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6211:EE_|DM6PR11MB4707:EE_
x-ms-office365-filtering-correlation-id: 3d026ff9-c6fa-4705-721b-08dc392dcfae
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tGX1w0kCCLL8zZ5c0Ar9SxCzitlq/oRyoxqIOYFEgWh2Lk3vxr0eJN+lYrOXntF0XEkx5d7u86rb6TfweWorYhWyKc/YrPPQXCchF17GHDIdGNYHDk6JO17AGyHbyR3joyhQicZjyFUqJMu2BAtcJsF2K483Hvo/BdPfXVa0Ps0wYSiCSEeTCjInkvmRqNfe3vvLzSn9xd9/UhUKkQxHTLXkLdZNtHZni00tl9YOPFnyX+HGiZAxswdwvEXvesSny1mNCTDNIYg0FW1J7oCmOv/mY3gLcw8WcQeakL3vCJbe86OCPbNb977UHfRI9a0Lk4xuFMYwGK/wR+RmzZK6UEmUIMJ7T3SUcC8baYsDB2GO+fqhPpQtfMANMnO/vbAVe46eYs5MnEMQeOdGY3tunTuvX/YGHmP9KKfqMjCXQjg3FgeBux9m+ym7ggErKq9AznlwZSBNEWdktUHUOccTx/UuT6YgWGFAtfLsQC2kqKRTwT1oxUuUWzXas8Ujbcw8zAvyDthyrXPdodTjTHmVPVPCU2bJxrHOK8vPaIf+iQ4g2s4Wxy46sl1wW3/WXS0al8JG9vdlcs1ZEiPx4TENv5XsSlH5wBD+JYcN8uWvFqQ8vBZ/pL3sryEUGMRCodkPj9K9ZSQbgUntlfSdE9loVguysLkRFxYIYsD02ujS/bJNucMyUboVqK0lvQ3+lQ7EvTkZv+bNzPo5HV05kEPfTXEnH2F8rE7OIeBz4+0Ni3g=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6211.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?HfGAXMg4yfAs++gPD6+4DFzk7IkMkkKDpiOfREB4cYzIvQS5V2AMZ3saRbQg?=
 =?us-ascii?Q?8foDM5teT8rzvbjI1WpdcfHTxSVyxr41MOQzHd9s/ztAC+s6HVmATSwre54z?=
 =?us-ascii?Q?zGKxk+GMqK6Z9PnBWv/UVNfx/QWJx9mFnlM+a6oZsaqu6+Rn8YBydg/MnaAQ?=
 =?us-ascii?Q?B8ZbP3nQM4wFR8LYlmZR6dxLCmOcjdnaD3F2annx9AWYGt1mZfDobCudCwiL?=
 =?us-ascii?Q?RtRe3YMOOahU6N2YdYvNz8Ztdj2yDe/OzZeN5OfhcWzB/LynZX4xgz/ciadg?=
 =?us-ascii?Q?6rVkBuR9TLF7hlfFWr/e5guxzXKecE4s8h6dHeJqEDkjyTiPzxIu7Vw0paI4?=
 =?us-ascii?Q?E9dBpdtz24SbCWVuytJoLYTE65SnjCtdaVXSMV40jViFutTagKYE6BJBpW8f?=
 =?us-ascii?Q?pyQ9oTikyPs+fF0/NHnf+dII6WjYVDSSfCvI2eDYgjl/xqZYadGEdi3yDezv?=
 =?us-ascii?Q?VLZcL2W1GSgJ2fJKbAz9R7/VhPkKd370Cd0B8x3KoIrk0WSt8CDx3VDpsDmU?=
 =?us-ascii?Q?kuHOEg9C61OamJvFWWfMZbR5tNAxVk/S9Lkne4MtWDsbvVHSlB9EBg5QeoHb?=
 =?us-ascii?Q?ESzIeZLbLmZfSrbotm25J4xeN8lL0fln/xK+EazuD7V1oE0TmK99jVxRXith?=
 =?us-ascii?Q?AR6whIWdzLFl384e2qWpGMlRYXzl110yNgfjx1vnqwtIzJMZTPYK8WqCkdE6?=
 =?us-ascii?Q?4AFJ1xf+gD6rKBl7G3LcXw93PmLcWCIKUG7RyauybULOKflStsoaQpvnVn/l?=
 =?us-ascii?Q?2N5IcYnAEvfEv0Jopaxq12heusHJ0y1WP2iT02K4fHxQbxikWZpe6LM1LG2D?=
 =?us-ascii?Q?BHCbG0rrprJMK/UyFNnwmW3IGCM1LGtGrzdTUV38VVY8nkduXoNrz3CSPbBP?=
 =?us-ascii?Q?5ryAvwwJbYResaekNAGvIjhwkiEh0ttkEbgsieGA2G0t1mVRA9NTp/SE35CO?=
 =?us-ascii?Q?5iLIwJLUj5lJyDykVgBATNmul1rRqNmv+Zkp0xzoN5t3ON0I89KSI/oBSaUP?=
 =?us-ascii?Q?j/nn6EQ0+aD9n20+2miMrxCcQoD0l1AzrAEf1rMjxBZ6OepaBdkFna4FjEiP?=
 =?us-ascii?Q?dUBHNssTdaYTkM0VG3GqsfiBsi3ylGKJt8Me9NXnV9bHTCB3xHFPcxUJbcK6?=
 =?us-ascii?Q?LrS6WuaEIws9TfBvt8X5K1VbKqoNtR7loGDFWF5Xhvp3c9MNC5cxKJAwSjWa?=
 =?us-ascii?Q?KvBixxxi59GG9N0D51qq2dE76gymKjILr56zLLyDeL9QCMFDWMqyN5xqFAQE?=
 =?us-ascii?Q?C4PJt9mOJif/VEPkhFQL+14gqyMM0jZ6qHcM5xsS79K0FMMOM30qPGuU0jCd?=
 =?us-ascii?Q?zZg+Vt7iNLiXo1WbXilpN4NQk7FLFPY+paYR1mri55Uen9bEbzu4IT/2gv58?=
 =?us-ascii?Q?ED4TghDzAM5Vs7B8d75xzUqiBRiGEb7vzwTPAuINfDEMZdai3jGqWxhPLQ05?=
 =?us-ascii?Q?1aeKet5LW/rjizVtQ/1DJLcYkC32eHO7DsnLwBgqqXUj0tmJySQ+nH6R/1VE?=
 =?us-ascii?Q?sIf8+s9mFoA6i0Yg5sxIaDxQZWQ18S1D31q1CU9XGvYYd97ntdlLVzOb0Aji?=
 =?us-ascii?Q?11Ss3STwXKAy3QZhvnhFUsxV7CqX6zPmgOCWpLpP?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6211.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d026ff9-c6fa-4705-721b-08dc392dcfae
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Feb 2024 13:53:30.0152 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lSqwPncpddsC5b3CGAMm1mNTSknWTEqNRhiC0okyoGPRa8sg1dmaPxfOKrMJgGRr5WK6y6Y7PPblVjQntDsu/k36dlWH2IlyjA6DqMmS7tk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4707
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
> From: Vivi, Rodrigo <rodrigo.vivi@intel.com>
> Sent: Wednesday, February 28, 2024 12:14 AM
> To: intel-xe@lists.freedesktop.org
> Cc: Vivi, Rodrigo <rodrigo.vivi@intel.com>; Gupta, Anshuman
> <anshuman.gupta@intel.com>
> Subject: [PATCH] drm/xe: Stop checking for power_lost on D3Cold
>=20
> GuC reset status is not reliable for this purpose and it is once in a whi=
le
> ending up in a situation of D3Cold, where power_reset is false and withou=
t
> the proper memory restoration the GuC reload and Display will fail to com=
e
> back from D3Cold.
>=20
> So, let's do a full restoration of everything if we have a risk of losing=
 power,
> without further optimizations.
>=20
> Cc: Anshuman Gupta <anshuman.gupta@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Is guc is not in reset during d3cold ?
Another  comment below
> ---
>  drivers/gpu/drm/xe/xe_device_types.h |  3 ---
>  drivers/gpu/drm/xe/xe_pm.c           | 12 ++----------
>  2 files changed, 2 insertions(+), 13 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h
> b/drivers/gpu/drm/xe/xe_device_types.h
> index 9785eef2e5a4..f7eb473a3aec 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -423,9 +423,6 @@ struct xe_device {
>  		/** @d3cold.allowed: Indicates if d3cold is a valid device
> state */
>  		bool allowed;
>=20
> -		/** @d3cold.power_lost: Indicates if card has really lost
> power. */
> -		bool power_lost;
> -
>  		/**
>  		 * @d3cold.vram_threshold:
>  		 *
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c inde=
x
> b5511e3c3153..9a03a4d5b439 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -365,15 +365,7 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>=20
>  	lock_map_acquire(&xe_device_mem_access_lockdep_map);
>=20
> -	/*
> -	 * It can be possible that xe has allowed d3cold but other pcie
> devices
> -	 * in gfx card soc would have blocked d3cold, therefore card has not
> -	 * really lost power. Detecting primary Gt power is sufficient.
> -	 */
> -	gt =3D xe_device_get_gt(xe, 0);
> -	xe->d3cold.power_lost =3D xe_guc_in_reset(&gt->uc.guc);
xe_guc_in_reset() is unused function after this patch.=20
This should be removed.
Thanks,
Anshuman Gupta.
> -
> -	if (xe->d3cold.allowed && xe->d3cold.power_lost) {
> +	if (xe->d3cold.allowed) {
>  		for_each_gt(gt, xe, id) {
>  			err =3D xe_pcode_init(gt);
>  			if (err)
> @@ -394,7 +386,7 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>  	for_each_gt(gt, xe, id)
>  		xe_gt_resume(gt);
>=20
> -	if (xe->d3cold.allowed && xe->d3cold.power_lost) {
> +	if (xe->d3cold.allowed) {
>  		err =3D xe_bo_restore_user(xe);
>  		if (err)
>  			goto out;
> --
> 2.43.2

