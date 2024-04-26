Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6B2FC4345F
	for <intel-xe@archiver.kernel.org>; Fri, 26 Apr 2024 14:43:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 870FB10F036;
	Fri, 26 Apr 2024 14:43:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a/mGCTUX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C696210F036
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Apr 2024 14:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714142631; x=1745678631;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=BIPjWguTRnzFF2klQO/C6/D1bUC3VMNO6l41uFv1DBI=;
 b=a/mGCTUXNV55Yq9gpTFmpaccvQDtTdO7agh1uvTSUJI1EPcN3LCdlcM8
 fbQUtEi2eqAyfH01T2lYOQPyXbEHa2yi0s2kkbcPQksjSS2B6z2bjC8td
 2Zhg7Ks873GrnhZ7H6bvl7qd1JcmiZoCUD/oRPUquqc4G0GqHLBmZUiRk
 1xakw8vYvacQ13GoqXHj0NXdlZfu4SS9D/50C7VEgtWTEXKKTYdUFN19N
 qNyunBs2ip3YwccCgcta5GwgYaVCJaV44J7EOzHzgQPak3oWYxpDLQd2u
 rdYBU1JnLRQYZjnLatnVMX16YWb7k+UCCuwI+cYMQ+bOqVJOYPT67/9V6 Q==;
X-CSE-ConnectionGUID: BzEh1arUS4CmZevC9AupqQ==
X-CSE-MsgGUID: C5ApI/v0SjurgAKU/hCAUw==
X-IronPort-AV: E=McAfee;i="6600,9927,11056"; a="10000702"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; d="scan'208";a="10000702"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 07:43:50 -0700
X-CSE-ConnectionGUID: XTASa8QnS1ewvG/PhB0q5Q==
X-CSE-MsgGUID: iH1lU8K9SHuH/3aizdF4Kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; d="scan'208";a="25419865"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Apr 2024 07:43:50 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 26 Apr 2024 07:43:49 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 26 Apr 2024 07:43:49 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 26 Apr 2024 07:43:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fmpsOAtyZxwARJufYtX3pK/+p1WCF2m82OTgCGdSd/B9/ehh464gOTebPIBtoBXM9Dzj1Q6clW9lXdM4ByKDtZum87EN8c57VoRouisE7x9ee9NE1DNyyFf5+8suJSvsnO4hifPRr9UXYHJK5mpVBKR8KW1re4h9eiPt0C028JIQqQfgIUclvcopbrFle3yTPfdo3TKR6hLCCPhLk6G5oOEokfZCbrMFNsJ3kx3r6ZiXQwg5PAvitJp0X31Dv//+IJQg3IAdfnrZy+fH9iCoypV2S3xoRkncMZpCfYrxS1MDflmbk5O/D4FDeD9JvHEwgBXcv2qMNGdwcKOfaxUwEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W6zauC1DYoCsBVAuJBNRlzRzHtqcUBpgHRdQoUx1e3I=;
 b=b8R9KqduULy0o46iBJ18fqttuQdVRuKBRUGSjyPUuT8q38VseE8oq5/AirdsOJ8W8G8vftOob+qC4wTdKa7LNHUY9EXgW4KR4f5pL9BflBuwUecm/bQowOZeEONnB3/keWNOek4ouepNdZo/7SNHj0b6zqsrBCbSfpmyVvMVPgIvXXndZ4QFlKNIPJ1mObXxb+Kq0MH3wsEf1vBJFanbFyHJfksxdRkBTWIjSYGOKxV2fIVSPC6YGyc0b4hrcimoyIEl4htDgutALJBot/IZAD09oL/ifEJZhnrotEFWFPnHczH19nZA4OMZ/2Rnc91tWBio97GQO4ckehTYPQwVyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB6991.namprd11.prod.outlook.com (2603:10b6:806:2b8::21)
 by PH7PR11MB6793.namprd11.prod.outlook.com (2603:10b6:510:1b7::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.22; Fri, 26 Apr
 2024 14:43:46 +0000
Received: from SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d]) by SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d%5]) with mapi id 15.20.7519.021; Fri, 26 Apr 2024
 14:43:46 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH v3 01/13] drm/xe: Lock all gpuva ops during VM bind IOCTL
Thread-Topic: [PATCH v3 01/13] drm/xe: Lock all gpuva ops during VM bind IOCTL
Thread-Index: AQHalsyxjRsmvgnS6EicM/krh7bxzrF6oo4g
Date: Fri, 26 Apr 2024 14:43:46 +0000
Message-ID: <SA1PR11MB69910CF9BAEF928DC23E8F6C92162@SA1PR11MB6991.namprd11.prod.outlook.com>
References: <20240425045513.1913039-1-matthew.brost@intel.com>
 <20240425045513.1913039-2-matthew.brost@intel.com>
In-Reply-To: <20240425045513.1913039-2-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB6991:EE_|PH7PR11MB6793:EE_
x-ms-office365-filtering-correlation-id: 975601e4-dad5-4984-ebbb-08dc65ff4702
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|376005|1800799015|366007|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?MKAWhNZmmFT/nMdMaSdYbwUKnSlDninF8WFj7OL2Uyb4Psq/h06HaHxkiQfm?=
 =?us-ascii?Q?VKQPyY0mYx4b0kgBw8FYKqo7ljPalH/X6DGTaPbyypb5+rBPyVaM1XBaSHI5?=
 =?us-ascii?Q?ef1RdUZo1vkDM9BIlnpX/b1rrkiQy3FxB7r6ycUS04GiAsJZqxYvXkwmlM59?=
 =?us-ascii?Q?tzDDxBvkA6T0aULyjz2x3pMcOVw0KCU3wZnrd9C3k+SVsh9sTQUmo7HPAWVu?=
 =?us-ascii?Q?xWBUNJj1klDlse3+drOsUATlCYe+EHMEvIcFBzDD/LeWH+eh1ZOtc68lNZqj?=
 =?us-ascii?Q?ztdSheIIiMbuH4NPZvR2Cab7oeCty7ZIQGZuGLFgAK/ozMr90cwk9iZVoU14?=
 =?us-ascii?Q?x5B5wDoA0cQeg9VNqe0oy57s1bFAEYW9m0XM/LyvHaOIWz8fCLEbTvGDJEet?=
 =?us-ascii?Q?yuctm2iLwPaQm8yXf3vpyom0kYfJCnPbG2MhDpOkp5/gKPcpMHdmu//FyOnG?=
 =?us-ascii?Q?5K0U+5b+NKZSWMemOvNOK8L0eOskRKSdBD7PiuEWAoG9y6Jg8PegbhaY50N5?=
 =?us-ascii?Q?js690JytPuQ+8VRvVHDf6bGhBC2S9qipuOVrx2f7YsMFd9etJOqvF0Y5XZ7s?=
 =?us-ascii?Q?p1Fc4/TYjMUhCHS2+6tkr8oCS3s3IHvmMhW7aJcJ2kPbMhFzniweuR/TKD+P?=
 =?us-ascii?Q?qwpkE0HszWr3nnaXJzulCVuc3qvbtgTo2RhnKoAoQ1yiChSDbAeQXRCpWRwe?=
 =?us-ascii?Q?Y/1HxHO5VEwHEhFY0TlbcFXONVaOE/y1MOZ/ZxwP5nvZMWek7VVOAX4PvEaJ?=
 =?us-ascii?Q?WmdLUIaAn0SnjQHiy0GMu/nntw4KBRmFxqAyT2AzIc3UPmGkZ9YxTNx2bDLT?=
 =?us-ascii?Q?kGaE6378bvWvaqktvUzIlQRPMTryOFyh1gS0iBSum74KUXGmnTy1nWdsQ2Y1?=
 =?us-ascii?Q?tuRVpQxiNISrQvNKiyMFO3qEzNUxtuHCoR6+OxEZjwyBwMRhIuMws5E3Kzyu?=
 =?us-ascii?Q?pcc3jQgsFEhPFsjMR3SrdUFwQsVV4OldZiQ1yELl3We419kVsE7leLP54isu?=
 =?us-ascii?Q?FgYRwAjlc5B9BxMedl2toN/LIS0P8U+pK9m/apmmreVEx8XRLL0xyI18ggnL?=
 =?us-ascii?Q?XlmC+XqohA4NWuHIvP6armCuwLQ78JbtABXQzT9mGh+plpOGw6upuORBzsjg?=
 =?us-ascii?Q?cHFYhrGJe6nOYIW817r4DIXC9lJ3/oNTi4J2C15oTbmvE3g4lUl+HqF35550?=
 =?us-ascii?Q?6soL1vsFMmg3oMIeODAlviO/K+kw1wZNQ3i0U1JG5CvkZ1ZNYlF1/o/9gRCq?=
 =?us-ascii?Q?D1181FY2cQm1yqv/0fyMtcxMbIrhHy8YK1mypYrbYd2KWZZYscMGHLR50HCO?=
 =?us-ascii?Q?a/egxuWws5ksPITBAtvn3M2Lzgk8Wf7raAO9yazT0aSZXQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6991.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?KCrGHrHbCqPJCkO3KxDSz6cwKUs8ioMUm65b/Dx8G0jjj3idrHyJUxvLQF5J?=
 =?us-ascii?Q?X3p7jPp/4zodZiaPN0LVCcHAEQr7ExXxMl4N2y5IKR3HlmVc8W+9D40Rt9+S?=
 =?us-ascii?Q?VFSa0at0aPkCGRQ2OOVYRnD7MmcH6YY7hSBJ79wje2TYANGo26SFsG2RNL63?=
 =?us-ascii?Q?cKy7fGsbtY/Q/ZqOCQdCbOYGEEK5BetgtWoBhabUWEHF4zsdi1QpeYzQ2lCx?=
 =?us-ascii?Q?Hfpxqdsbd33ncw/xDp1CJrOsHBxd4Afglbl0un5R13XsCt01aRQS+MdiVuN5?=
 =?us-ascii?Q?6Kau1AQKZ5JF/FJIK6sijJ1V1FE3YESbpbhFwtCAHrLESHOQzWQldRAw6PfX?=
 =?us-ascii?Q?3nymC/GqEdC73uUk7k8g3DBg0esNFCGyuJ9aoVXgsoUvMsvDg4tPkc/FYiXK?=
 =?us-ascii?Q?ja3ZOvzl1cwYpaoWMGzTuUDKmZH5NjeP0a0uFLof50iHssgHq22Hnl6A4DUp?=
 =?us-ascii?Q?S3x7W1UW3+dL3g6+HdmAN3uj2AAHjwmyudInGMOY8zTahhxZIjCGRlkItixA?=
 =?us-ascii?Q?yIoGksX5jIRq5zLgbOWhzwgxt/0XvgesGdDSY0gUw6fG/hSUyjby9MR280H2?=
 =?us-ascii?Q?LCUGCysIRGiG0qdaLmfdWR71C38WUMEVXrsAlI5kprIL3FUIOTmpxnkkQvt+?=
 =?us-ascii?Q?6qZ4W6qCUYutUQ7vddCfRPh9SXPM9x0IHsF4tKjbY6XZpvJydv5sjUa/zx0P?=
 =?us-ascii?Q?JNCj/CNgEn7xSaegHiaKe++gypGcaizVPZMfuu7+ne+dDP1uVdVA3pZtaJop?=
 =?us-ascii?Q?5O7rV0/bCebB46ollL7GriK5p0/YMqqlljC0ewKr/SJTWGiCVA9EoibyX4ri?=
 =?us-ascii?Q?FcbiKUlT6vaWoTUvr2m1rJqEa5T6RDnC2NIJtroWWMz3aZOJfPe1zhhT0ZDG?=
 =?us-ascii?Q?sf1jlCHuWTNfhDx/SgKtaKhBQ+opnWuQSiAo0BZAqcHzuW0RD63JlRtdE3yu?=
 =?us-ascii?Q?KrRRnziW09Hgjj5HM29k2Pyw0FDjvqSDUf2q45BB1Ozlgy3aHRN4s5SjB0YO?=
 =?us-ascii?Q?OQ7qmxFoTti6N4P3eIuqA0hJkt4fAqi3uqtJlpXlHFHs2lWgR0X4ypPspQx3?=
 =?us-ascii?Q?GtZuhb0PC4BZMstpPkcGzcNRkm5bN+hfPJ3a5VqdUO8NpeeLNoEtDD2yCn/s?=
 =?us-ascii?Q?8A/5vDVovQbxntiU7tgssFA72oLAeMhmbJAOzgfP5tO3fMYwaAnDqzT5J2Nm?=
 =?us-ascii?Q?1kjs7pUrlaWqbTNdSbL8UCKPFK2ZjtrmUN5xZaXj9PhYwno+84Eqtu8nmKm0?=
 =?us-ascii?Q?Xnn2EImhcSVOT7kLcxqlpyR1gDfBnpRiDqP9IAtK1BYb9vej4KlYjiDtQ35w?=
 =?us-ascii?Q?+69VMrafxo86vAMKsJUyF2g+kza9yqt9OUSHY4MYb95VVa7nwEsaafdx+Pbf?=
 =?us-ascii?Q?2e1ncKWnxr4TOo39vygsmcRl0WU38g1cO25Eb2/8Iy1TdZKtk5u1MleAdAuu?=
 =?us-ascii?Q?CzZVn1Z06P2u82FMcoI8W044tzq2Y5Mh/qkkgDmwjJYgrxZcMltAn+Q5Gz7h?=
 =?us-ascii?Q?FPtutwFxeEqL0uvHejS/5UC1siB1eudXGt62tJgsGwJrE47l/EoOaIeL6a7T?=
 =?us-ascii?Q?F6ImQV+ijsyb0qgK8eQ=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6991.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 975601e4-dad5-4984-ebbb-08dc65ff4702
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Apr 2024 14:43:46.1573 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: e+MKfHF/xWppj4NDvp2Pulmz4pk4rBtJDn5lbwC+P3gtLduTjZizCfuQXE+l+PSmNwwEZWlG/Y3CFN9pK7d01w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6793
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

Reviewed-by: Oak Zeng <oak.zeng@intel.com>

> -----Original Message-----
> From: Brost, Matthew <matthew.brost@intel.com>
> Sent: Thursday, April 25, 2024 12:55 AM
> To: intel-xe@lists.freedesktop.org
> Cc: Brost, Matthew <matthew.brost@intel.com>; Zeng, Oak
> <oak.zeng@intel.com>
> Subject: [PATCH v3 01/13] drm/xe: Lock all gpuva ops during VM bind IOCTL
>=20
> Lock all BOs used in gpuva ops and validate all BOs in a single step
> during the VM bind IOCTL.
>=20
> This help with the transition to making all gpuva ops in a VM bind IOCTL
> a single atomic job which is required for proper error handling.
>=20
> v2:
>  - Better commit message (Oak)
>  - s/op_lock/op_lock_and_prep, few other renames too (Oak)
>  - Use DRM_EXEC_IGNORE_DUPLICATES flag in drm_exec_init (local testing)
>  - Do not reserve slots in locking step (direction based on series from T=
homas)
> v3:
>  - Validate BO if is immediate set (Oak)
>=20
> Cc: Oak Zeng <oak.zeng@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vm.c | 148 +++++++++++++++++++++++++++------
> ----
>  1 file changed, 108 insertions(+), 40 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 7ae2b0300db6..ad575ac80352 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -315,19 +315,23 @@ int __xe_vm_userptr_needs_repin(struct xe_vm
> *vm)
>=20
>  #define XE_VM_REBIND_RETRY_TIMEOUT_MS 1000
>=20
> -static void xe_vm_kill(struct xe_vm *vm)
> +static void xe_vm_kill(struct xe_vm *vm, bool unlocked)
>  {
>  	struct xe_exec_queue *q;
>=20
>  	lockdep_assert_held(&vm->lock);
>=20
> -	xe_vm_lock(vm, false);
> +	if (unlocked)
> +		xe_vm_lock(vm, false);
> +
>  	vm->flags |=3D XE_VM_FLAG_BANNED;
>  	trace_xe_vm_kill(vm);
>=20
>  	list_for_each_entry(q, &vm->preempt.exec_queues, compute.link)
>  		q->ops->kill(q);
> -	xe_vm_unlock(vm);
> +
> +	if (unlocked)
> +		xe_vm_unlock(vm);
>=20
>  	/* TODO: Inform user the VM is banned */
>  }
> @@ -557,7 +561,7 @@ static void preempt_rebind_work_func(struct
> work_struct *w)
>=20
>  	if (err) {
>  		drm_warn(&vm->xe->drm, "VM worker error: %d\n", err);
> -		xe_vm_kill(vm);
> +		xe_vm_kill(vm, true);
>  	}
>  	up_write(&vm->lock);
>=20
> @@ -1758,17 +1762,9 @@ static int xe_vm_bind(struct xe_vm *vm, struct
> xe_vma *vma, struct xe_exec_queue
>  		      u32 num_syncs, bool immediate, bool first_op,
>  		      bool last_op)
>  {
> -	int err;
> -
>  	xe_vm_assert_held(vm);
>  	xe_bo_assert_held(bo);
>=20
> -	if (bo && immediate) {
> -		err =3D xe_bo_validate(bo, vm, true);
> -		if (err)
> -			return err;
> -	}
> -
>  	return __xe_vm_bind(vm, vma, q, syncs, num_syncs, immediate,
> first_op,
>  			    last_op);
>  }
> @@ -2421,17 +2417,13 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm
> *vm, struct xe_exec_queue *q,
>  	return 0;
>  }
>=20
> -static int op_execute(struct drm_exec *exec, struct xe_vm *vm,
> -		      struct xe_vma *vma, struct xe_vma_op *op)
> +static int op_execute(struct xe_vm *vm, struct xe_vma *vma,
> +		      struct xe_vma_op *op)
>  {
>  	int err;
>=20
>  	lockdep_assert_held_write(&vm->lock);
>=20
> -	err =3D xe_vm_lock_vma(exec, vma);
> -	if (err)
> -		return err;
> -
>  	xe_vm_assert_held(vm);
>  	xe_bo_assert_held(xe_vma_bo(vma));
>=20
> @@ -2512,19 +2504,10 @@ static int op_execute(struct drm_exec *exec,
> struct xe_vm *vm,
>  static int __xe_vma_op_execute(struct xe_vm *vm, struct xe_vma *vma,
>  			       struct xe_vma_op *op)
>  {
> -	struct drm_exec exec;
>  	int err;
>=20
>  retry_userptr:
> -	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT, 0);
> -	drm_exec_until_all_locked(&exec) {
> -		err =3D op_execute(&exec, vm, vma, op);
> -		drm_exec_retry_on_contention(&exec);
> -		if (err)
> -			break;
> -	}
> -	drm_exec_fini(&exec);
> -
> +	err =3D op_execute(vm, vma, op);
>  	if (err =3D=3D -EAGAIN) {
>  		lockdep_assert_held_write(&vm->lock);
>=20
> @@ -2689,29 +2672,114 @@ static void vm_bind_ioctl_ops_unwind(struct
> xe_vm *vm,
>  	}
>  }
>=20
> +static int vma_lock_and_validate(struct drm_exec *exec, struct xe_vma
> *vma,
> +				 bool validate)
> +{
> +	struct xe_bo *bo =3D xe_vma_bo(vma);
> +	int err =3D 0;
> +
> +	if (bo) {
> +		if (!bo->vm)
> +			err =3D drm_exec_prepare_obj(exec, &bo->ttm.base,
> 0);
> +		if (!err && validate)
> +			err =3D xe_bo_validate(bo, xe_vma_vm(vma), true);
> +	}
> +
> +	return err;
> +}
> +
> +static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
> +			    struct xe_vma_op *op)
> +{
> +	int err =3D 0;
> +
> +	switch (op->base.op) {
> +	case DRM_GPUVA_OP_MAP:
> +		err =3D vma_lock_and_validate(exec, op->map.vma,
> +					    !xe_vm_in_fault_mode(vm) ||
> +					    op->map.immediate);
> +		break;
> +	case DRM_GPUVA_OP_REMAP:
> +		err =3D vma_lock_and_validate(exec,
> +					    gpuva_to_vma(op-
> >base.remap.unmap->va),
> +					    false);
> +		if (!err && op->remap.prev)
> +			err =3D vma_lock_and_validate(exec, op->remap.prev,
> true);
> +		if (!err && op->remap.next)
> +			err =3D vma_lock_and_validate(exec, op->remap.next,
> true);
> +		break;
> +	case DRM_GPUVA_OP_UNMAP:
> +		err =3D vma_lock_and_validate(exec,
> +					    gpuva_to_vma(op-
> >base.unmap.va),
> +					    false);
> +		break;
> +	case DRM_GPUVA_OP_PREFETCH:
> +		err =3D vma_lock_and_validate(exec,
> +					    gpuva_to_vma(op-
> >base.prefetch.va), true);
> +		break;
> +	default:
> +		drm_warn(&vm->xe->drm, "NOT POSSIBLE");
> +	}
> +
> +	return err;
> +}
> +
> +static int vm_bind_ioctl_ops_lock_and_prep(struct drm_exec *exec,
> +					   struct xe_vm *vm,
> +					   struct list_head *ops_list)
> +{
> +	struct xe_vma_op *op;
> +	int err;
> +
> +	err =3D drm_exec_prepare_obj(exec, xe_vm_obj(vm), 0);
> +	if (err)
> +		return err;
> +
> +	list_for_each_entry(op, ops_list, link) {
> +		err =3D op_lock_and_prep(exec, vm, op);
> +		if (err)
> +			return err;
> +	}
> +
> +	return 0;
> +}
> +
>  static int vm_bind_ioctl_ops_execute(struct xe_vm *vm,
>  				     struct list_head *ops_list)
>  {
> +	struct drm_exec exec;
>  	struct xe_vma_op *op, *next;
>  	int err;
>=20
>  	lockdep_assert_held_write(&vm->lock);
>=20
> -	list_for_each_entry_safe(op, next, ops_list, link) {
> -		err =3D xe_vma_op_execute(vm, op);
> -		if (err) {
> -			drm_warn(&vm->xe->drm, "VM op(%d) failed
> with %d",
> -				 op->base.op, err);
> -			/*
> -			 * FIXME: Killing VM rather than proper error handling
> -			 */
> -			xe_vm_kill(vm);
> -			return -ENOSPC;
> +	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT |
> +		      DRM_EXEC_IGNORE_DUPLICATES, 0);
> +	drm_exec_until_all_locked(&exec) {
> +		err =3D vm_bind_ioctl_ops_lock_and_prep(&exec, vm,
> ops_list);
> +		drm_exec_retry_on_contention(&exec);
> +		if (err)
> +			goto unlock;
> +
> +		list_for_each_entry_safe(op, next, ops_list, link) {
> +			err =3D xe_vma_op_execute(vm, op);
> +			if (err) {
> +				drm_warn(&vm->xe->drm, "VM op(%d)
> failed with %d",
> +					 op->base.op, err);
> +				/*
> +				 * FIXME: Killing VM rather than proper error
> handling
> +				 */
> +				xe_vm_kill(vm, false);
> +				err =3D -ENOSPC;
> +				goto unlock;
> +			}
> +			xe_vma_op_cleanup(vm, op);
>  		}
> -		xe_vma_op_cleanup(vm, op);
>  	}
>=20
> -	return 0;
> +unlock:
> +	drm_exec_fini(&exec);
> +	return err;
>  }
>=20
>  #define SUPPORTED_FLAGS	\
> --
> 2.34.1

