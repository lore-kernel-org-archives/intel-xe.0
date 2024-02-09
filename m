Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78A70C48297
	for <intel-xe@archiver.kernel.org>; Fri,  9 Feb 2024 08:39:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FBF410EF15;
	Fri,  9 Feb 2024 08:39:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PeKJT8AH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B64B10EF15
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Feb 2024 08:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707467993; x=1739003993;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=AjGJLQ/WCeZjF4QiztNc/2NcgU7ayakMTuEl6fsgvRE=;
 b=PeKJT8AHE1FXP9a89Us7fvBpoNJmYY9hR7jIHlzCXYlhIQwkqSvyZXZl
 MYI2wSwbsi4KIeCBeexvnthnrdG6TYW6DhqxIwYwXM8gt+uWXkAd53zCv
 pPr5CjSOCP24ZrwmZJ5E9S0AK+/JVzK8JEQJoXjp2tOsEkiiUtlU0SGvD
 p7fABjxYMzfeUoT/EyfPswwL4vptTjUfQCj9sTQT3pSeqJMiDcXnNm6Vs
 YxAhDPPXA6sjIdU+Fwb+XcxwzgC4cHpdeWXGrHIPvI4zOli/BqW0jirn6
 6r7rOMnz9UcDvWSmAMTYAlWNYLVD72upK1lNLtHb9OCDC8wIatpK1r6LI A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="1276945"
X-IronPort-AV: E=Sophos;i="6.05,256,1701158400"; 
   d="scan'208";a="1276945"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2024 00:39:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,256,1701158400"; d="scan'208";a="32964211"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Feb 2024 00:39:51 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 9 Feb 2024 00:39:50 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 9 Feb 2024 00:39:50 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 9 Feb 2024 00:39:50 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 9 Feb 2024 00:39:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d4C9SDXN3+yaUDTc16s3Hu2lXSEGaq4bL0ubUBzx4XRzG+ytYnQG7oBHt7IKlgd94XW99ryQIv4D44oJ8imHLRSN3y/D2cLOMZCQhd/EtzjyBKugx3ZgXNtTZFOedUs1sUK6RVQL+O+e5skhw4jJGstqd+FO9jHMHGGLr1tE5ZbrzrVe3wDg0GEaAilalmYvVJ9CXG6tK5Iecz9sKBX8gEi8J+niFfvh0Ko/Br4nbrRf8rCielvnf/1TNFhAhJ26WFZKz1ERj2DDOeqpmrxs8M4bM8lzAAhx9dbpbYETWPL+NfxYpgMldOn1xUwqKWqKeZb//rxB0EdUF9UwHvd2Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QggRB+Y+BW2t3SViJhXHMYsQ+NO+ohUE5YlR/VN+MlM=;
 b=HuxV8oFOT0iqjNaR7s6/pA5OmRskVgnte00LOwk6fxLKIWurT4w9tIIiS9mfAZ+a/vzcR1qD/fOtX/kl6i/75sxSTAwJ+y9LiKEgoDGxGNUpDDrnSX8WnG186lqaOIsZu/W2lS7Z9oUmXScE5tGuOx9rVVcHPWpvOXP4hU2qlZpV0oTqtrJmh+QpOJDBRkTDyqXgJQUC03bX6BFfGY4UHuVvcXxlxMffVECm9eu2/v8+agucjmNJ8yUcs491A1yE+Hu8MskY44J8sqRY9Jtg4bV/oDdR4MhqujKNKjoerw717q1nVnGhGJA6GCmDlRTk2u4lA4V7uhcUscdO4BWaHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB6750.namprd11.prod.outlook.com (2603:10b6:806:266::21)
 by PH8PR11MB7968.namprd11.prod.outlook.com (2603:10b6:510:25f::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.24; Fri, 9 Feb
 2024 08:39:48 +0000
Received: from SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::f1c4:e34a:54f7:233e]) by SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::f1c4:e34a:54f7:233e%7]) with mapi id 15.20.7249.032; Fri, 9 Feb 2024
 08:39:48 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Auld, Matthew" <matthew.auld@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH] drm/xe/display: fix i915_gem_object_is_shmem() wrapper
Thread-Topic: [PATCH] drm/xe/display: fix i915_gem_object_is_shmem() wrapper
Thread-Index: AQHaWEhu34GwbB73PUSnDbrY0que/rEBtjzA
Date: Fri, 9 Feb 2024 08:39:48 +0000
Message-ID: <SN7PR11MB67500DE40555B0DC3825C781E34B2@SN7PR11MB6750.namprd11.prod.outlook.com>
References: <20240205153110.38340-2-matthew.auld@intel.com>
In-Reply-To: <20240205153110.38340-2-matthew.auld@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB6750:EE_|PH8PR11MB7968:EE_
x-ms-office365-filtering-correlation-id: 44f7edc5-9d11-4275-4e21-08dc294aacc2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BNCi/0nH2sLa0Dh+IqfPKm7qLfpMfggPdoAmNQ4GZVRtVA5WU4rXeUStMCpmy+hLhmLpWPSQ5P3qAfrdcq0vM8Z6IdDDnb6DSCEz31B7Sq+L4DJ0TRrxmohLW1jLfh6JgdeH0rKHrIjCXmWr9sHUymE5+ylqvxiF/6OYidP9ETzf2Eq1woEMJqOJijPTDznaeIVOKvtVxHoDyXMK+FqObSlR/3mA4QqgBUZj0akpNN50zwZZisrQf/oCJj5R2fvx+jx4LK2Bc6Si5Y9U0Yq5M0bf6fWNbH7gMBmmqV+M/Os2IXYvlnDed7dpKg+iJwRcS4BXFDPgAQHd/FepGCHObhqFKCfEonYOzoU1NkVY5waw1ZUQLt1o02ny2tEesOdQ+M4E5ie7+JIhxV1nbwLbqJF8M4ofvT0mxGLYonOZ4n1sFbIM5BknAiYkTTHy4WitgSPr4G+MD9M4Al54sytq0jibfumBXwVje5cOLuMMZUevp1T4eiD5E0FILNNzO/ly/JlAYN0pCchd+jv5wTXOrof9Qz1faZf7ai6QiW/lKPH9i3irRVizOb28QJIWd8ZpIEP87VdgksWADYwYS3JkmFcak6kEX+Kzx5+5lYmNPMtw56zBZldtlQat3GZZGBJg
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB6750.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(366004)(346002)(396003)(136003)(39860400002)(230922051799003)(64100799003)(1800799012)(186009)(451199024)(7696005)(71200400001)(55016003)(2906002)(52536014)(110136005)(5660300002)(316002)(41300700001)(8676002)(66476007)(66946007)(66446008)(6506007)(478600001)(9686003)(66556008)(8936002)(76116006)(64756008)(38070700009)(83380400001)(38100700002)(82960400001)(86362001)(26005)(33656002)(122000001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?bscZ4kO5xTKev+vTto9EoaVdakna/59QXVq4NNtE3eHstEYTpox0r/rnz8y9?=
 =?us-ascii?Q?LMoCkjXdoiakPRssKYWTVX/ytYgqiCoPrCrLYAchVCUEIVd90q6dWPZV09A/?=
 =?us-ascii?Q?uEQ3Q2TByjKCyr647/kM+QZp29M7H36h4+TnB9Xp8vNm61rwiTVU7PxN6bxx?=
 =?us-ascii?Q?qSgaEEOV1glDHvEsiqOpAwwce2Jj/InZ9gZ9X55hHcP9++BjtNO6lPTEKc1U?=
 =?us-ascii?Q?P3znisVi6AAkBPG+R+jMyJRQr9EY4GbiXcefL2QZ1kLt+GU8ktEGBmDXWLzP?=
 =?us-ascii?Q?oLr18Q4HRkB3RyImcL76PPckTuDBrn+9IAlrAHwyq3/ToIQ3fbG0wK0o3pjR?=
 =?us-ascii?Q?VM+LnR1oNOAPp2LTWZehUnaNFk610Tz4JQJeHGF3QzDh7Lf/tOp6CGas7s2i?=
 =?us-ascii?Q?c5oTa3EdUVRAqg6IXZG4Ew4bKtJqj63ePfUFHRC89CiGWMCaIrLiYbvPhQx2?=
 =?us-ascii?Q?FpEO8VSX/NGBRDovX/sqZu3CaeI/u1Nr+Os0O5bwhvSSWMJ7XiN2gEiaZfNz?=
 =?us-ascii?Q?vT3qfoUhUhwJlq612ksj6PaOdCUEZc6ViI/Grbqm9pBjBKnNN4wpPiN9YCXh?=
 =?us-ascii?Q?XPmZF5Ezah77op8Lqw4htzyb8B8wiAtuH/D1VXdAv0VdeO6xxQRbZ5DADtfR?=
 =?us-ascii?Q?XDnfupSifYRH4bqohvd9gX10In83LdyU3pWIXJnXZSeAUs5UVgF5dikDl2kR?=
 =?us-ascii?Q?DqKddgbc7OQkFJm31jyBUsxoTv8bM1Z0f/5ExONll7oMJykP3KHVzu7Io7Yu?=
 =?us-ascii?Q?4IEUmY/1ixqB+t+fQAbM4d989w5wYP7ahiirAxa3jJx6CcNT84h/tstTgb95?=
 =?us-ascii?Q?FPJgfXK1i3f2DvQiG3nTV/4n8LOBLkh7op8urcy4jxpKxVVrD3Ru3w1fF8s0?=
 =?us-ascii?Q?LDMyIStC7roWXRlKMWvfkN7PfKwxoywQ6y/BpgSDwR2ZaY0Cw7ylfQaOueif?=
 =?us-ascii?Q?xhb9f/2tANMFoN9094FyKmO83uDEDXmGTn7/Vch5uid9t38zSavP4l3QOFZi?=
 =?us-ascii?Q?zB8fsutMCXydLrr7yRkXx9YOZG62NPsTAPnz8Ch9mKYWE4hx3UIsV2nlk3S9?=
 =?us-ascii?Q?xHQOw2J4jPCO8w4gnle/zFvNGGW6WqF9qJLn30G6BvAcY8LxV8p0Nz5CFpa2?=
 =?us-ascii?Q?OZpYCvjDqIxhHCWXJrjNEjoAF2RBg2y8iYv60hicRJFpmreSc0TS833xdC06?=
 =?us-ascii?Q?KQ6hNgVlnH19FoaiTemXTA838Le499K+3kt/rswI43917HtaAE3b9KYm1qUI?=
 =?us-ascii?Q?w4rZy14nYEu1nPk+fvV58g+vEGjSkCyeenaj3kwY17b6/tbaio+aiV3Qnxmi?=
 =?us-ascii?Q?Cn6jPva72O3D5CYycRhHo9x/9fOw6614E5sTjZfnfZB50LygmrRpGtBPK0iQ?=
 =?us-ascii?Q?DIp5UNMskGLpGJpDNWJcrG95tfewm5G+jAahJIFxTyQd4Vik1Ti2Pn7eiphd?=
 =?us-ascii?Q?NLKNw/kIqMb+IzljI3t41k7bM6SUL4A2xT/Ht0IIuoYUy8FZSxpIIvHIonKN?=
 =?us-ascii?Q?sR8nOYYUTPgcNuKAkKB3bq03f/hMRFWIkSUV9aTVprdICu17THHC5hbAZYkS?=
 =?us-ascii?Q?U/yu2cwl5LrL8YI3FfeFGAnoj7zdEk15oT2bqOI5?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6750.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44f7edc5-9d11-4275-4e21-08dc294aacc2
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Feb 2024 08:39:48.2180 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iNuJafxa9s+DiL567Jz6mAX/AEk+5lrv4QAr7qiT6vroOfg8oDwAbo1KLWX3AH/MRdhYCAIeHSCjocxmfNqgow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7968
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

> Subject: [PATCH] drm/xe/display: fix i915_gem_object_is_shmem() wrapper
>=20
> shmem ensures the memory is cleared on allocation, however here we are
> using TTM, which doesn't natively support shmem (other than for swap), bu=
t
> instead just allocates normal system memory. And we only zero such memory
> for userspace allocations. In the case of intel_fbdev we are missing the
> memset_io().
>=20

LGTM
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>

> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> ---
>  drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_object.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/xe/compat-i915-
> headers/gem/i915_gem_object.h b/drivers/gpu/drm/xe/compat-i915-
> headers/gem/i915_gem_object.h
> index 68d9f6116bdf..777c20ceabab 100644
> --- a/drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_object.h
> +++ b/drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_object.h
> @@ -10,7 +10,7 @@
>=20
>  #include "xe_bo.h"
>=20
> -#define i915_gem_object_is_shmem(obj) ((obj)->flags &
> XE_BO_CREATE_SYSTEM_BIT)
> +#define i915_gem_object_is_shmem(obj) (0) /* We don't use shmem */
>=20
>  static inline dma_addr_t i915_gem_object_get_dma_address(const struct
> xe_bo *bo, pgoff_t n)  {
> --
> 2.43.0

