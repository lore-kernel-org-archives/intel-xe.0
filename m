Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72A2EC4345F
	for <intel-xe@archiver.kernel.org>; Fri, 12 Apr 2024 10:53:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E026710EC55;
	Fri, 12 Apr 2024 10:53:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hBolZ0za";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA1F710E747
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Apr 2024 10:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712919220; x=1744455220;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=RQkoyFAiqVpsYU5dw6ewLEnrfiKPamRY4Wjwk4XcRUc=;
 b=hBolZ0zasIgOgpxDFMjBOMRlufabo3gz91AfBpCH/HoWeJdl9q6Cnk5s
 MnhxHfxC9iX0WapDr8rznUNHw+9t6tZOglvK9zulI6rMELbV5fRmzSSDT
 UFqdGKhHIk+o8soe1eOnnRBHdYFWf7nvBC1mYPKhDRTTggMT4AYLzVYGW
 dIocNMGO+9WFAntMqKySfdavz+EHbv/DsXSeGL1+GxGbXAe+iAN0fRqWE
 3lRx/36bbbTg2DWUDECAd7nMI1il+qAUg2jhnikFNJeluOU+STxNBGPeM
 jw9JL3eBBAdGOJv02WGlzidmzRoYHr9tLB0/IAfPNJRgkbtsBVJ3XSYq/ w==;
X-CSE-ConnectionGUID: XDdB3q28S7qcMcjO82dWnA==
X-CSE-MsgGUID: 92M3ly6zQ76Fyh8SNHC/OA==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="8242695"
X-IronPort-AV: E=Sophos;i="6.07,195,1708416000"; 
   d="scan'208";a="8242695"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2024 03:53:39 -0700
X-CSE-ConnectionGUID: aeFYmJuJRaa1Ff57NZRAxA==
X-CSE-MsgGUID: MusvUPfsT+SHCk5LGFYu3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,195,1708416000"; d="scan'208";a="21184150"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Apr 2024 03:53:38 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 12 Apr 2024 03:53:38 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 12 Apr 2024 03:53:38 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 12 Apr 2024 03:53:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e2zn5hTuSr8y9qXQOlyLsKP5wwy9d8Ozr69PICCLjTGqyHoB3UBfrBd03WDFEc0gRXkp+fsCxSn1fIfbYj6RzwHiAntOEzF/rf8zM13IPECxlXxS425+2pN4cvGwis+RqPQAboDdTmOYTZFK5NWmFJWDo1Ifv456k+MhF9ERniCe1yoxqFVM9l8aUe3Le8Lau/YJfcqVOAkzKB4x1hxaGZ7AY/1QbrvjiFJu+AK3kaCWfuAyqEs5gIb3Fp2dcDjYXfjx//2XWvBPzx6ihw0IS2U9EBWMseqZB8U0B5hv9krnTb0pk4Lgkdf7zlnQytT9CrSPvAb7GFnQt0VliCCYrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8/ShoHtg4oRxVgzt4i3Ns1BKEQItPk5KJ7+1unnOT8U=;
 b=XnfX2jxnfY4I6EM33O2z6u0hDkcQGtVws79FXOsh9dzWP8Z0C24/lYibfPuj4iopFliEmZ0cRiwgKaYbW4YUMlRRc0xEr6dkFMs7DAVmFL/zTQYO446Ikj9O2+pKfib5fodiXCTPyNT+2r2WeungrHjOFhRB3yZ0WamXz6Zu0Vf3TNNkGrAmHfKDnv8Weoo1G6CZ9A0ceuJ6WUuy6vk6FHc5NuWQCyYS3OZ1oaT6ZBMrF9waPbBDDl1iSBnCjzEOBLY0uLZeeuRgvd+x3YxzSF/yVQFvcJGtCVScni8yN1zC7yNLayDGBBZwEiK13ct1liwi4yInhZBZioF5bgmMyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by PH7PR11MB7145.namprd11.prod.outlook.com (2603:10b6:510:1ec::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.26; Fri, 12 Apr
 2024 10:53:35 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::1604:d970:ed05:4729]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::1604:d970:ed05:4729%7]) with mapi id 15.20.7452.019; Fri, 12 Apr 2024
 10:53:35 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Brost, Matthew" <matthew.brost@intel.com>, "Vishwanathapura, Niranjana"
 <niranjana.vishwanathapura@intel.com>
Subject: RE: [PATCH v2] drm/xe: Modify minimum of various scheduler timeout to
 0.
Thread-Topic: [PATCH v2] drm/xe: Modify minimum of various scheduler timeout
 to 0.
Thread-Index: AQHajMVlA5PGJXBI3EqqlvXOokCETrFkdVmA
Date: Fri, 12 Apr 2024 10:53:35 +0000
Message-ID: <SJ1PR11MB6204A4A00F9DD8FA9B132CC781042@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20240412105053.1050268-1-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20240412105053.1050268-1-himal.prasad.ghimiray@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|PH7PR11MB7145:EE_
x-ms-office365-filtering-correlation-id: b725dbae-6938-4311-c8c5-08dc5adecd8e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +fbGlN1NjAZK7z3MOgcK3L2E6GWy7lOSguY2PiurpC3wS6xAQiDKpaarA3W3jAAxSMuOfKNQxS1RwlsMIVc4D3GScX19qiciJctMIL7q37P4SF3lh0HXlhBPAb/u1j+k6msitd16v4nk6JnvTdhSHJAb1p1Q1T9Hi08QQMFh/RITpm+FVN4vwvmBsh7ka6MP/eMmEWqdH9Xak5H8SsQ3tfdNzjuey/8HVocVhY7uv4g8lZjV8MjNEJvh/8qBcBJoTBifWTF2flKVD0K3fYsFfwW5cTBIUx3T4JdnqYOFMSX5JRsz96BA/UW/b48GB/dMczxRE0XqIK9VAZC8q63JxPOsAuS8CPbXxxXDTRySkiZm4kE8nmk/2cEMtNFRgZ9eWGFOCbeOYTwVDFaGKy1QAckodC5rFPiz8d/o6YHz1f5OK6PbUqVNIJGHqiHetKUZTJuUrNhzxljClDXZX+zh4ecUq1GSZNpswIpYGgo/bVElCW0UUSUuqaoQIQjIt8htdtVZ/+WWoPLvFwfAYg9XmbH/4G/mzUomQ5rmLjMeNDpdK3yfMmZOF+VS0toNT4jNpNuJ1fzd7kdnZwv73kGql7NUSI2kG74uiTPqXdv13OU0EouJdKNva9EhbqVRN/6UwrWxAkoVmFOJZk4E7VF8u/bg5r7MCy4VtmXSxP6kJM6HlTY8SEszx/yDIB6vB1KiL9wWLQzKg8QWM3fu98s8vH60cIDsFnBavfqiGku3ntg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?q4juNFtaDfowCLwGqdT2nuTv1apTKtfvG8fJKuv1z+xbRsTSaEPPgTqOORqx?=
 =?us-ascii?Q?5kos9GOPGgDw5z46MjIxKf5/DtFVTui4dku5IcRuv2cb9dqmiqrxJySWeqGZ?=
 =?us-ascii?Q?RUckiHHn5l2NCHVbkUIIRGSPgcTaJZUkStKg9lEdF+UH6x4oBUSncltlzWe7?=
 =?us-ascii?Q?6ZpS/CLfp+iVi8vXVg92DI7XS4MpYSKrCsfQlTIkylmH9T7sxvs8VfMfAOKG?=
 =?us-ascii?Q?vnaljp/nDrOxs9tRGTxj28YsmBc4MOmCT+yOo74dw4HjQi31pCVkjXX+zm3F?=
 =?us-ascii?Q?uoQMbLWqk18CxXLzT+4fEUGO3iTdpq2rZZHKHkOBqEvGqaCo26PyLVSIX0eX?=
 =?us-ascii?Q?Awo2h3eJqgI3gBurphGIGW+1H4ox24/TXMdn7qkNuRaKrLa+cUBDR5cKpJob?=
 =?us-ascii?Q?x6Hg6+BJ9KNPkH0ctOpCWnS0F8mP20N6vtBf5nk0hEtDyfASDF7CcWBLkXPd?=
 =?us-ascii?Q?qlDilvkDY+hIjO2hpbs65fowLgg2vuFRvZZ43AfLy6/nQ1Nu1qHS72Rm7SHA?=
 =?us-ascii?Q?daxiTeG4ODGVNAis2vCQ5ilCbQ5N0YlDlhidZGTIky9qU2/ikJYmRKTGgqN5?=
 =?us-ascii?Q?TTviaGJWEJqeZKULDn7UPI2I2tX/l4J+rw5t08pZF+DWar6Xg7Oq7MMl/AaO?=
 =?us-ascii?Q?/OFMjLR+jUHpY2SafnVFQc/YyuKXChFgTubDaB/q3d0psEcc4XW3BstvaWGL?=
 =?us-ascii?Q?8ZvVPReGjcr7PESEeJAIZ5fE2PgfypAa5PjzIh9aZ3GgvZGsKPBSZ4P8cI2y?=
 =?us-ascii?Q?NY2qeeYenMJvVoxg3dEuvjTXM4g/3jD75DrHK3ctOHyD1EeNwdZxLtMvNaiy?=
 =?us-ascii?Q?Jz7F8iB1DDk1/IzY8upmGOCgtA4DVRXGc9JLGbT79SqyEOWogykLhe10stpG?=
 =?us-ascii?Q?dzNTkU8GAeTFsJslRTdXHRWHiGUbhcUqsXEMAtdLjqnUC6BpG6+gvmDC2Pig?=
 =?us-ascii?Q?EEeL6g24frBp/mGvaUyd/SJPgbBNcwQ8xFMLx5HmWHpiDzXRp2m/V4VVuZYB?=
 =?us-ascii?Q?ZdK3QdcfKnnQlAz2XVh3QLjxyz+s3ght1jyAjWRy1ifmlJ64G390abTEz2ai?=
 =?us-ascii?Q?VXTEAKD+wIo2FpqJqCV8rhQ8KPJJTsGTUUWFXRF+GPHg3g4KgoBRIsnOPXNX?=
 =?us-ascii?Q?RwQQafA1bYxdgOn5SY97xVLwtJhc+/ZFTjXFsgTMWNxrw9infvlM03Ef2tYR?=
 =?us-ascii?Q?yuE6C5YHJO8JS+Y0LXNafnwVbDISuPXTFRqtXGw6MKJAduv+ihUmy82IWxzq?=
 =?us-ascii?Q?JxhYWBPhWvyYas3Gld1BQ+Q77iBk4zFNudVmGyLOSNftoFCRAMMbt0mfphcz?=
 =?us-ascii?Q?Mcvw/IQ6P0lHr+uTAaYuV64PXWVwqEl4BBdU3ZZ5NxNiavDdp05gyWTr41So?=
 =?us-ascii?Q?prpNvIotx66XSgK7R4zs7wxDJ+6d/XmaZpibOmVREwE/mri1/05gFiWoQOXl?=
 =?us-ascii?Q?iE3/ehiXeFOs9NK6gOVbmTH0OgL4f2LmEoxAgn9cFb5WEJLSfbDVo5zLa94+?=
 =?us-ascii?Q?+RIx9xTGB70TbNrkgb1gQtYWj1WtGaav2lA8QMjtCEYxHNnYtktUmNI8mH0h?=
 =?us-ascii?Q?UmqmRqkY8O7Y7kWTcBUCE35cBnSn85sB7oJ6fg6VrmNS/da6IymzgYaXXxbD?=
 =?us-ascii?Q?O7FThttA0LXZ82eyTfTCLRw=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b725dbae-6938-4311-c8c5-08dc5adecd8e
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Apr 2024 10:53:35.7553 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BJ7I8Udvy56t/JYS5rblfLtpco/ZHOMm4OwvFtNFoWUb6wL7cz8dTjMrCcEMSaO56OY1mNPigR7kpxPWNLZB9XhQ8xeJY81p2TyLZOSkSSs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7145
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
> From: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>
> Sent: Friday, April 12, 2024 4:21 PM
> To: intel-xe@lists.freedesktop.org
> Cc: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>; Brost,
> Matthew <matthew.brost@intel.com>; Vishwanathapura, Niranjana
> <niranjana.vishwanathapura@intel.com>; Upadhyay, Tejas
> <tejas.upadhyay@intel.com>
> Subject: [PATCH v2] drm/xe: Modify minimum of various scheduler timeout t=
o
> 0.
>=20
> The sysman teams needs to disable preemption and timeslice to test
> exclusivity mode and are relying on setting 'timeslice_duration_us'
> and 'preempt_timeout_us' to 0 for the same. Hence set the min configs to =
0.
>=20
> -v2
> Modify values in drivers/gpu/drm/xe/xe_hw_engine.h
>=20
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

LGTM,
Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

> ---
>  drivers/gpu/drm/xe/Kconfig.profile | 4 ++--
> drivers/gpu/drm/xe/xe_hw_engine.h  | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/Kconfig.profile
> b/drivers/gpu/drm/xe/Kconfig.profile
> index ba17a25e8db3..80e80b55467f 100644
> --- a/drivers/gpu/drm/xe/Kconfig.profile
> +++ b/drivers/gpu/drm/xe/Kconfig.profile
> @@ -18,7 +18,7 @@ config DRM_XE_TIMESLICE_MAX
>  	  contexts by guc scheduling.
>  config DRM_XE_TIMESLICE_MIN
>  	int "Default min timeslice duration (us)"
> -	default 1 # microseconds
> +	default 0 # microseconds
>  	help
>  	  Configures the default min timeslice duration between multiple
>  	  contexts by guc scheduling.
> @@ -39,7 +39,7 @@ config DRM_XE_PREEMPT_TIMEOUT_MAX
>  	  run.
>  config DRM_XE_PREEMPT_TIMEOUT_MIN
>  	int "Default min preempt timeout (us)"
> -	default 1 # microseconds
> +	default 0 # microseconds
>  	help
>  	  Configures the default min preempt timeout after which context
>  	  will be forcefully taken away and higher priority context will diff -=
-git
> a/drivers/gpu/drm/xe/xe_hw_engine.h
> b/drivers/gpu/drm/xe/xe_hw_engine.h
> index 71968ee2f600..5be0783a8865 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.h
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.h
> @@ -23,7 +23,7 @@ struct drm_printer;
>  #ifdef CONFIG_DRM_XE_TIMESLICE_MIN
>  #define XE_HW_ENGINE_TIMESLICE_MIN CONFIG_DRM_XE_TIMESLICE_MIN
> #else -#define XE_HW_ENGINE_TIMESLICE_MIN 1
> +#define XE_HW_ENGINE_TIMESLICE_MIN 0
>  #endif
>  #ifdef CONFIG_DRM_XE_TIMESLICE_MAX
>  #define XE_HW_ENGINE_TIMESLICE_MAX
> CONFIG_DRM_XE_TIMESLICE_MAX @@ -38,7 +38,7 @@ struct drm_printer;
> #ifdef CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN  #define
> XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN
> CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN  #else -#define
> XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN 1
> +#define XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN 0
>  #endif
>  #ifdef CONFIG_DRM_XE_PREEMPT_TIMEOUT_MAX  #define
> XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX
> CONFIG_DRM_XE_PREEMPT_TIMEOUT_MAX
> --
> 2.25.1

