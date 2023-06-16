Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69021EB64D7
	for <intel-xe@archiver.kernel.org>; Fri, 16 Jun 2023 10:58:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09CCE10E5D9;
	Fri, 16 Jun 2023 10:58:51 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73AE810E5D9
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Jun 2023 10:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686913128; x=1718449128;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/C/ArLN3vEUzW2BZxVVAYwfRVqX94Dbrfki10iDv6V0=;
 b=Yqp23Fp67VETqHqhSK0gKY/w9ay7vLEIko1H3yOgGNSz8Of+HNif7UkL
 Kp4eTbROADU0k2Vdy8yFABtg0GI9U4OkOF01a+6jaQioPPSZSsF2VIwom
 8h7FIdOODuJSd2GHhyEN9koy31fnljKch2vB4k46u8HVh1vesR4cx2Hjf
 UNJrHstGCCEnL/yRYKTQyF41/xQY4SAgTfnhlFWGH7mPXpblOvJxLHCXO
 8Mu0zaTuCAlWV9eLHQ4F+/70bLm40JY0lBgTez31ijECm24dHjM49IE5N
 EERrGRBTLKjWjxH15es3dvnat8gxwghfXpgNspIgsYo1GVF3wq4cw/B2I Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="359197370"
X-IronPort-AV: E=Sophos;i="6.00,247,1681196400"; d="scan'208";a="359197370"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2023 03:58:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="715971323"
X-IronPort-AV: E=Sophos;i="6.00,247,1681196400"; d="scan'208";a="715971323"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga007.fm.intel.com with ESMTP; 16 Jun 2023 03:58:25 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 16 Jun 2023 03:58:24 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 16 Jun 2023 03:58:24 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.173)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 16 Jun 2023 03:58:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XI6tST8WK3kTnTZaCby6GHJz0h8DPeSEqCO9QPUJP5E3YgnUDne1yktcUe4X3fhBW9rTwYqm6+O8IAFrbWtNVCvYVVhCNEuzxIbrblObXKHOBqc/t0MSFmclA8jiIUBGJNBxetKAc2zac0kfEBduQakaiG7AWEBlIyDDYhwYGVJ/m2c8j6cN1sIWTxGRcKeWowAoHNQ1eLOCk3YjJtESmtglSSoJjA00zUcuaXdfm2sjZIInR4W79CutWQRZvxde2SdUoXfEVDPhaLUJM4spTXTvikcXPJu0X9SJAv4wkLtNRwaUX4f1DZp6XQXjdm6NW4QPfju/pBN2FU0762hbdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tvUX7JGo2N1hEEhFvy2B3AhHeABzPWw1RSLz7fawxm0=;
 b=i5C84Re5qiGRM9bwPYocy8U6IIDyw66ukON8aq72KS4nBmtf39UDjwsE7WkfyuFpm58IOjArTZgDX+GLY9GN9sH4D/37a2TywCVac7LY9f9wnPckiy2UiT1AjsIguh6iOwTQFxag1JPciLeAZhx7K5rauEz+SuJGrhdclpEdHfuUHjhFFE1zlhuucoixWQT/fysiDJHKK4VgD4fwf1iRrr5jWAOFhvVYDAGWrsxTC+d4MK9WezH+nYFM+Oqe1xbCz8xMWUCtrW8EiADE9hgKx2tXyr4djpZ/aQgceBi3P+JcCMAWDxNuVAwS7p5GPY8ru2CksocBy2vd+jjAE8EVxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6211.namprd11.prod.outlook.com (2603:10b6:930:25::6)
 by DM6PR11MB4578.namprd11.prod.outlook.com (2603:10b6:5:2a7::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.29; Fri, 16 Jun
 2023 10:58:16 +0000
Received: from CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::3cc2:6622:cce5:cd02]) by CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::3cc2:6622:cce5:cd02%5]) with mapi id 15.20.6477.037; Fri, 16 Jun 2023
 10:58:17 +0000
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Tauro, Riana" <riana.tauro@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "Nilawar, Badal" <badal.nilawar@intel.com>
Thread-Topic: [PATCH v2 2/2] drm/xe/mtl: Add support to get C6
 residency/status of MTL
Thread-Index: AQHZoDQPkkoGAKr0gkuAOJZI7/pxyK+NOydQ
Date: Fri, 16 Jun 2023 10:58:17 +0000
Message-ID: <CY5PR11MB6211493B04135E0E8E63AE579558A@CY5PR11MB6211.namprd11.prod.outlook.com>
References: <20230616092521.3862926-1-riana.tauro@intel.com>
 <20230616092521.3862926-3-riana.tauro@intel.com>
In-Reply-To: <20230616092521.3862926-3-riana.tauro@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6211:EE_|DM6PR11MB4578:EE_
x-ms-office365-filtering-correlation-id: 61b2e656-ba5f-4272-d116-08db6e5896ec
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GbZlPcWup4QBRGMgeSWFN5V92AdLuMR5/7gFKsX5GOQ6mEfUMxUeyAJXYdThD/6GyntaCZ7RHOP7pelka112nXT673W1rmo0jKERJF5QSChmFnyjOFvu8c0M8ChvTWSPShiYy5dDzAuPsBOorKjuK04X2DnzzP/LgmHH0ohqyHrX/t50Lut2b3Oz5Lv1JqAG+3y7lUOe3B9zBNJZFU3Z3ISxhh8yURjG72aIS0ZAZmuxqomVbOTahFIDUGVParM2kSIdP0w24aJSFf+4MFf7El1dRfsVMsJtSePTmrER0qykFh2HOsgG1qsXZ+nAlIIOmn9QAjZxe/ozdWrM+uW9qtXn8DodGjgNqLhHO0mnvBnjN/9Sfj0+8GybDQuWquC0rsIdnyz6BPFxvOYb0wNBMDZNJjTJbh4ZzrHxwlSSfFrOMDwmadV3UsVnSuH+qWnJuK5sJVLnVcJjnNqew4HLOlQ9nYQTLq7JmW8RNOawW5bp6QBvtli3AjAEJFYgmvk0lRTDhH7KghargTHYnDAWlc1+yr7/Bqz/0rXGtHzAeLJ7Cq9jv2SGkFLPzmcDAGtj85gL3KyHZb6lewLD9J3yGRfmXTFic7OMhRr6PSxUjV5J7GO24Rvm7YXRaPUFOdRv
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6211.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(39860400002)(396003)(346002)(376002)(136003)(451199021)(86362001)(38070700005)(33656002)(55016003)(2906002)(26005)(5660300002)(52536014)(6506007)(53546011)(9686003)(186003)(83380400001)(76116006)(478600001)(54906003)(110136005)(8676002)(8936002)(41300700001)(71200400001)(4326008)(6636002)(66946007)(66476007)(64756008)(66556008)(66446008)(7696005)(316002)(38100700002)(122000001)(82960400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?oJaNKJf+CB5qvIORPZh/Ga3t8mN/eIUxPeCG8fmQNrBzukadKT61FolMprk4?=
 =?us-ascii?Q?81/zqw4k4cEYsUKI5taq2c1M28K0KVZLQoO0Rk6ONipK8LST9JprfOKWCbCQ?=
 =?us-ascii?Q?3p2WQCmMqWfi1s+0DYv3DZNuPTZE2j+wTTvgAxzSW4LGDg5eBX/tMl8ddKhd?=
 =?us-ascii?Q?RyOumW95smWIzWPTA37/S4gvhfzWeuVNio1SHaTMWXzK4L/rV/nT6PnvvbPx?=
 =?us-ascii?Q?o8vPXU4wwJauVY8/JCxwp699ZoRV7dMcuF7Lh0AUL3jXEqajwNW7CrTrMKok?=
 =?us-ascii?Q?0pi+H16PczE+kIrwgSEUcfaL4w40VqMZoEwGns4JWKvlw1s3eVExdtyO74m5?=
 =?us-ascii?Q?RZ/iaLulZJI68GSRCD07AKrnC7M6tfk0yCgHHy+VqxWDvpTzWCZ9/v2ouiX7?=
 =?us-ascii?Q?dwfpFKpmiLrPqJhnR8FfKuJxpnKHUrnDbixlWMWWUftwKDn6+o8sy+ceQ1De?=
 =?us-ascii?Q?1c9taGQ/CCGuPNuUmfBEMkvXzGha5NmJdq2b6ajvFnAm5ULjP2SR2UeEr+t4?=
 =?us-ascii?Q?UWu0LNUTweaQ9bDx7V1RhBixVqSZuZa0ZlChECGtZ5n1WbgAM8gxBf7yuyzF?=
 =?us-ascii?Q?4CPguA7+UDi4oZsi/JMZHqZv/EdWqzd/pMyQEtiV4cOXcqATO6hPceULnXDs?=
 =?us-ascii?Q?+boWo2knne+bHP/GJbGUWdHzp+fokemTBJa0+8sXk2LnbLAOvzyImBMqDPBC?=
 =?us-ascii?Q?72zki7WXSAiV4akxL0pUxwo8nmwXNohQQozSKI5qVj28s6aYOqCw1oNVTmoi?=
 =?us-ascii?Q?I+Hoqq20b4kC6btfx96gKWYvd+eAIc3lSuAGkQKffabQ+EFoBeMyu7rjRnid?=
 =?us-ascii?Q?SgMaSLyfPG90Madi9+G8Nl3ITIqFvroKo2vvpTJdSdLm8j0bP45G9y+VjYip?=
 =?us-ascii?Q?h0AZTXS3XRrLJPMt/C8NJSuoBEIqNOzXnkBs5WnwxmW4MEFHUNLd1gyXX0f4?=
 =?us-ascii?Q?7RCH+/HcEC/HFW/t3O/hq2EFSLtW20zgpeiqOQjg+GvGPmQJdo+TD6IGWEfX?=
 =?us-ascii?Q?Ty9Wh/X0/Ja5SnUwmuf4SUaYBZbn5Wl3MheC/K81D7XfueoDHCp+/0JChcR5?=
 =?us-ascii?Q?pkIXiq25OLrxeT3nFrlK9X4WqMXG0kch3OIqM5I8jjBmWBWbTrjJfbbJ4CXf?=
 =?us-ascii?Q?udocdi+r1C+PVksIHk1rPXW9Pjfj7ClvsesX0eH1K6R7cf1t/EBhiFqA0s9z?=
 =?us-ascii?Q?JFpVakRIuBCiRICh6rxErFrpL+noefK6uJI2O2Hkcdln+12vroB/iSjus52K?=
 =?us-ascii?Q?S0OxIfc76mIpTU3f5axPcg7jVEjfpipsjFElakrU6r22wuD5a0D+m1RPJ6N0?=
 =?us-ascii?Q?x6/6mMC+ujJJshE7viD/5q4gylpkuRIVWRvPSO7v/gyLskzbH2OhYI3aeLfn?=
 =?us-ascii?Q?HMsIF0ZdR/6Df+SsF7mW0y5TyvpuS/HO0mjp/7u/ppwhGdectpfiQWqs5dqF?=
 =?us-ascii?Q?AYJ2gRLGiecMJmLLDZNBMh7P1u2CXj+FpGUTcTnQbjYqCWJjJfQP0JZjxZe5?=
 =?us-ascii?Q?w6LUm2HnffEWmqnzhJ2f5XWIy8c+nazOdhrSNm3YYGkRCRcXQMGqx5t25cXA?=
 =?us-ascii?Q?o1XpKYMdDHqykhrBN/qazwPmPltpDZHr+9mlU/KJ?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6211.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61b2e656-ba5f-4272-d116-08db6e5896ec
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jun 2023 10:58:17.0793 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aFdfqWKnhQVoqn4jYGv5VNkZIFV5CJwbqx5hwoeGsN4co8l0bDGjUOnC2naRqTeUwmPXbD6XuYFueqlsDsPCEBSb+TQcKzablg+TBmePRec=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4578
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 2/2] drm/xe/mtl: Add support to get C6
 residency/status of MTL
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
Cc: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Tauro, Riana <riana.tauro@intel.com>
> Sent: Friday, June 16, 2023 2:55 PM
> To: intel-xe@lists.freedesktop.org
> Cc: Tauro, Riana <riana.tauro@intel.com>; Gupta, Anshuman
> <anshuman.gupta@intel.com>; Belgaumkar, Vinay
> <vinay.belgaumkar@intel.com>; Dixit, Ashutosh
> <ashutosh.dixit@intel.com>; Nilawar, Badal <badal.nilawar@intel.com>;
> andi.shyti@linux.intel.com; Brost, Matthew <matthew.brost@intel.com>;
> joonas.lahtinen@linux.intel.com
> Subject: [PATCH v2 2/2] drm/xe/mtl: Add support to get C6 residency/statu=
s
> of MTL
>=20
> From: Badal Nilawar <badal.nilawar@intel.com>
>=20
> Add the registers to get C6 residency of MTL SAMedia and
> C6 status of MTL gts
>=20
> v2:
>    - move register definitions to regs header (Anshuman)
>    - correct reg definition for mtl rc status
>    - make idle_status function common (Badal)
>=20
> Bspec: 66300
Please remove this space.
>=20
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h  | 11 +++++--
> drivers/gpu/drm/xe/xe_gt_idle_sysfs.c | 15 +++++++---
>  drivers/gpu/drm/xe/xe_guc_pc.c        | 42 ++++++++++++++++++++-------
>  drivers/gpu/drm/xe/xe_guc_pc.h        |  3 +-
>  4 files changed, 54 insertions(+), 17 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 3f664011eaea..d654f3311351 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -16,6 +16,11 @@
>  #define MEDIA_GT_GSI_OFFSET				0x380000
>  #define MEDIA_GT_GSI_LENGTH				0x40000
>=20
> +/* MTL workpoint reg to get core C state and actual freq of 3D, SAMedia =
*/
> +#define MTL_MIRROR_TARGET_WP1
> 	XE_REG(0xc60)
> +#define   MTL_CAGF_MASK
> 	REG_GENMASK(8, 0)
> +#define   MTL_CC_MASK
> 	REG_GENMASK(12, 9)
> +
>  /* RPM unit config (Gen8+) */
>  #define RPM_CONFIG0
> 	XE_REG(0xd00)
>  #define   RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_MASK
> 	REG_GENMASK(5, 3)
> @@ -349,10 +354,12 @@
>  #define   FORCEWAKE_USER			BIT(1)
>  #define   FORCEWAKE_KERNEL_FALLBACK		BIT(15)
>=20
> +#define MTL_MEDIA_MC6				XE_REG(0x138048)
> +
>  #define GT_CORE_STATUS				XE_REG(0x138060)
>  #define   RCN_MASK				REG_GENMASK(2, 0)
> -#define   GT_RC0				0
> -#define   GT_RC6				3
> +#define   GT_C0					0
> +#define   GT_C6					3
>=20
>  #define GT_GFX_RC6_LOCKED			XE_REG(0x138104)
>  #define GT_GFX_RC6				XE_REG(0x138108)
> diff --git a/drivers/gpu/drm/xe/xe_gt_idle_sysfs.c
> b/drivers/gpu/drm/xe/xe_gt_idle_sysfs.c
> index ec77349dea76..1a1016ff3735 100644
> --- a/drivers/gpu/drm/xe/xe_gt_idle_sysfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_idle_sysfs.c
> @@ -142,11 +142,18 @@ void xe_gt_idle_sysfs_init(struct xe_gt_idle
> *gtidle)
>  		return;
>  	}
>=20
> -	sprintf(gtidle->name, "gt%d-rc\n", gt->info.id);
> -	/* Multiplier for  RC6 Residency counter in units of 1.28us */
> +	if (xe->info.platform =3D=3D XE_METEORLAKE &&
> +	    gt->info.type =3D=3D XE_GT_TYPE_MEDIA) {
Hi Badal,
Do we need MTL specific check here, gt->info.type is not sufficient?
that will scale this condition  for future platform as well.
> +		sprintf(gtidle->name, "gt%d-mc\n", gt->info.id);
> +		gtidle->idle_residency =3D xe_guc_pc_mc6_residency;
> +	} else {
> +		sprintf(gtidle->name, "gt%d-rc\n", gt->info.id);
> +		gtidle->idle_residency =3D xe_guc_pc_rc6_residency;
> +	}
> +
/snip
>  {
>  	struct xe_gt *gt =3D pc_to_gt(pc);
> -	u32 reg;
> +	u32 reg, gt_c_state;
>=20
>  	xe_device_mem_access_get(gt_to_xe(gt));
> -	reg =3D xe_mmio_read32(gt, GT_CORE_STATUS);
> +
> +	if (gt_to_xe(gt)->info.platform =3D=3D XE_METEORLAKE) {
Similarly can't we check gt->info.type here in order to scale this conditio=
n for future
platform ?
Br,
Anshuman Gupta.
> +		reg =3D xe_mmio_read32(gt, MTL_MIRROR_TARGET_WP1);
> +		gt_c_state =3D REG_FIELD_GET(MTL_CC_MASK, reg);
> +	} else {
> +		reg =3D xe_mmio_read32(gt, GT_CORE_STATUS);
> +		gt_c_state =3D REG_FIELD_GET(RCN_MASK, reg);
> +	}
> +
>  	xe_device_mem_access_put(gt_to_xe(gt));
>=20
> -	switch (REG_FIELD_GET(RCN_MASK, reg)) {
> -	case GT_RC6:
> +	switch (gt_c_state) {
> +	case GT_C6:
>  		return GT_IDLE_C6;
> -	case GT_RC0:
> +	case GT_C0:
>  		return GT_IDLE_C0;
>  	default:
>  		return GT_IDLE_UNKNOWN;
> @@ -607,6 +612,23 @@ u64 xe_guc_pc_rc6_residency(struct xe_guc_pc
> *pc)
>  	return reg;
>  }
>=20
> +/**
> + * xe_guc_pc_mc6_residency - mc6 residency counter
> + * @pc: Xe_GuC_PC instance
> + */
> +u64 xe_guc_pc_mc6_residency(struct xe_guc_pc *pc) {
> +	struct xe_gt *gt =3D pc_to_gt(pc);
> +	u64 reg;
> +
> +	xe_device_mem_access_get(gt_to_xe(gt));
> +
> +	reg =3D xe_mmio_read32(gt, MTL_MEDIA_MC6);
> +
> +	xe_device_mem_access_put(gt_to_xe(gt));
> +	return reg;
> +}
> +
>  static const struct attribute *pc_attrs[] =3D {
>  	&dev_attr_freq_act.attr,
>  	&dev_attr_freq_cur.attr,
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.h
> b/drivers/gpu/drm/xe/xe_guc_pc.h index 976179dbc9a8..370353a40a17
> 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.h
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.h
> @@ -12,6 +12,7 @@ int xe_guc_pc_init(struct xe_guc_pc *pc);  int
> xe_guc_pc_start(struct xe_guc_pc *pc);  int xe_guc_pc_stop(struct
> xe_guc_pc *pc);
>=20
> -enum xe_gt_idle_state xe_guc_pc_rc_status(struct xe_guc_pc *pc);
> +enum xe_gt_idle_state xe_guc_pc_c_status(struct xe_guc_pc *pc);
>  u64 xe_guc_pc_rc6_residency(struct xe_guc_pc *pc);
> +u64 xe_guc_pc_mc6_residency(struct xe_guc_pc *pc);
>  #endif /* _XE_GUC_PC_H_ */
> --
> 2.40.0

