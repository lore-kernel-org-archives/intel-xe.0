Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92A54C54E5D
	for <intel-xe@archiver.kernel.org>; Mon, 18 Mar 2024 16:41:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2667D10FC8B;
	Mon, 18 Mar 2024 16:41:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S9b/oWxL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DE9510FC3B
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Mar 2024 16:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710780113; x=1742316113;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=5X+LHv0jBfqfrGbt6YcK8Vlo+eU0hGn1WxhNshtrqT8=;
 b=S9b/oWxLETiKy1ny9MVH8wQxmZzRwC7iNrsmuNyN/PSuk73SUTezcgNo
 O5dZ91ayeQm483lBOPd31KHIx5qHORqg4Y+F3IWvyXlLrmAJmKf+ULDLV
 DReLEQkH+sc5SSJp/nVzwqHUtWClAjJtY1fsZ1MoXbUbavEM25JMC/DaG
 SDl1apglAt94zbsEgEnGtfmsOl6u0L0uovaLGFhhtbID8WnROfOR0gIKF
 w8Tzjtn0NrFWFgjBeixlyPipcd7vOTeliBvKqM1PKMPhhk2fdQzoAQANI
 xBRx8E9iE1s1Eljg/nMDmVFWCHEZHVS8uljA0sxcJ730Jn5OMCwxaqiYE g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="17050369"
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; d="scan'208";a="17050369"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2024 09:41:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; d="scan'208";a="18218125"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Mar 2024 09:41:54 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 18 Mar 2024 09:41:52 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 18 Mar 2024 09:41:52 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 18 Mar 2024 09:41:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aUI8KzpubGgVATYNfNgxNjJoHFzC846dy4W1bxHxoTSmrkubKUXx3zQO1+aIPZY/+G5DJ3wxORUapgiqgQ94q/PEYijjSOEQbRAKeEk1qX6l+lkioRnfIBVUDIudS8C+ol+G5mzvMQpKZLSanSj1cwtUVeebSvczUjZxff6tLDEr3V3QItjFryKGfFq7mKiW1oBrAwW5vXY/+tsJ36u6HYQMZbduguPNlDmQtAoExphII013fnBzeO/U/DKfjsy7QFeoHH4XRDS4SBUM0/fAz/08Trd45bH+CzcwJ/xZOPUkPIZNDPV6jKuo3bBGDuMaD42al2bnYVXT0eP78Yuy5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CuDC7CDz2akp+ezbzLTsrMC8sPqygxX/RSryv1v4014=;
 b=htDgKKvPY6rI3KWYUNntDYhPPc92CJauH6FPC3lGTpxmKNEy0ZidMzqheXuWwiDlh2bB+YMBBISPhT+V4xf3h8ro/nMp8HtCD3LBgyBrKKb8PgEjSnKhKVmkqfkOuWNGVaKMVIBNaOUnDiB0hPIyQU772FxMwtBgP2uCqJK+yjeXIeSQT76QNr2JIVgifF1Xu3eertDKbLEAjvlLRzhLaDNbJKMrjEuzBgwguDgxkvkk2x7IoWFTDED7X3qNiDu6MXfLXZVCoUM6o+yfPziNRQzuuj2+V/NVcl1Zz0WKhtKOqU7kmfzHT4GcBRJu6Eun93Na2M8buijg8CDSPn3RlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by CY5PR11MB6416.namprd11.prod.outlook.com (2603:10b6:930:34::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.12; Mon, 18 Mar
 2024 16:41:50 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::1604:d970:ed05:4729]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::1604:d970:ed05:4729%6]) with mapi id 15.20.7409.010; Mon, 18 Mar 2024
 16:41:50 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Roper, Matthew D" <matthew.d.roper@intel.com>
Subject: RE: [PATCH v2] drm/xe: Always check force_wake_get return code
Thread-Topic: [PATCH v2] drm/xe: Always check force_wake_get return code
Thread-Index: AQHaeUvn9BWd8u7OsUeW0LNvldm1IbE9s5Bw
Date: Mon, 18 Mar 2024 16:41:50 +0000
Message-ID: <SJ1PR11MB6204AF34935E72E61B8486C3812D2@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20240318154924.3453513-1-daniele.ceraolospurio@intel.com>
In-Reply-To: <20240318154924.3453513-1-daniele.ceraolospurio@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|CY5PR11MB6416:EE_
x-ms-office365-filtering-correlation-id: 72f5be13-391f-41d9-3e1f-08dc476a4f38
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 33QistdbA4bCBvhmk8i+r2tQhPTJb4jfLL6VkukuxzLuvTHVjjqWIvEGYX/36prbXaVKGZMTWdga2HHPPMGlKIqYnfp9mJT7uxldRbsDsj/j56UX9Nk4NmycNkpXr5EW4rLx9FmNbW8639nyGATNSKrEUeBfarY1Jmb32x7U4T8pZVt7wHsWthXqh5oh6FlGzyNEk7UNBTV2GVJZm0ll7PuppS3+g3E2Lo6UNT8SwjTaOg0k7ysz/fBznYgio5TU9YuidbVH1/As4m3tdhNuIpmlg0qYsUM0k7DEHJ6c5jPe1HpDd0EIIwDqhRVqPw7+ChKKLCo0KBvFunfVsw4TmdIjtGImq1y3WUOrcdWOLgJxa/aP6bkE3VFx9i4Qj3vzM8dVfY7KCrH4GZYrB6T1OYr/KHNXUOe2B2VsZard2C/8sstQGI6W/4pFftlYGKSY46q+dJtYzaMW/5+xA4sD5F1JuUbrq2l+Uqcs8VoZjKT1Yh2cSehkrLcBOxVj4Gr6cHZasjXiHxn46xBRtD5yPaaf/+sI+J8n32SzDBW/6h27YKlD5LRc4UDrLgChbTAoCTHx3Vsrini+9K1Lk/Sl57ZJLIkFmDZgmUHmzPun/9rUs5In7AXssAywxEz/b/3WMscE0ZbU4OtUBrslrNug3lwsHYZHRnFWeIeredI1Izaa2qmnS2vXa3D+eKi1FNl/iVZq/L0s7PZtfaP6flBM0Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?yR3lzu7E9eB5wj8276i+DJ4vp8Zozp9JpdcMD2BsOz1q4dWsQD7fP4QKkIt1?=
 =?us-ascii?Q?gQ5K1uFdlQ2oId+EoCbp/vzy6ewtGyzCLAHCENrQg05tHA4sMrLXQd02SiZh?=
 =?us-ascii?Q?jQJI2f0ejZurAXGlGGqDUnQIAF2LHir6zH8F4i65/skHz8Knhps3MjVRa3nY?=
 =?us-ascii?Q?W0wv57mbvjXM7OwckfYGCzXUNidWJpbuU1fEPaLPmbAGJGRUNBFv/Y2rBglt?=
 =?us-ascii?Q?32aljoes7j2KhFS6NPZikYOkZ7fLcCmoICC6G8KEegdTaJNLdj3l4rI2JVGb?=
 =?us-ascii?Q?oy7n9npZdQOV90IqDRibgUfg8W6OGZtWofsODIwh02yEgjQYOH3SodFZcddS?=
 =?us-ascii?Q?dyyqrH76nKz/1VSv0a1lT2d4aLrG7GlxJXimWqr0TPXDWNa+IOLuDA85PUl6?=
 =?us-ascii?Q?cvXU6wyejOOynvrK4EwSOeUcMGPPT+y/5wYAq/UM0EMcik7oNp6JiKY7iYo4?=
 =?us-ascii?Q?BV6gpmfc9jfY/+Hk8GMLp5i8l6QwrsgaWStVLCjT6R0AhxnugGmIYQsGjpNy?=
 =?us-ascii?Q?9JHd+Dsvf5E8GSAr5V+c7BiT76hW4ETruEX8DPml254a3qq7CdlLyX2rryi8?=
 =?us-ascii?Q?7OJIegoCUUUeTXhxv5Z7A2ATZ+eVvDCQYDm71CaWWqzHRlwPgJerN2V+I1zh?=
 =?us-ascii?Q?3XOKZ+nM6+Y/4p3bosrH7DSwVU1QBxImj++0ED+KeMbsP9so/6lnwnrfaE4+?=
 =?us-ascii?Q?Cjw7TnU2mrPE7xwIuP8PD7M3ee5/p6/93m3nvELGj+JPA6XF1lZN1MoShl2F?=
 =?us-ascii?Q?SzaR5JgAnmp9t3jLKRvETJJeJg8zSQ6q3eA7kPWQzvJ91RAqbW6zo1AYAmh9?=
 =?us-ascii?Q?FjqTGMizzZigtPKedMFq1ayjyD53PxpuGZWYnLTrpSQvXaC1xowJQ3iLFDXi?=
 =?us-ascii?Q?iX9IWpkBpaKNe0BaITQ6/Koco2zPpHWoMNMawoRZ4pgkf1xB29DmLhMxvGAC?=
 =?us-ascii?Q?OxTBmyrlnsk+ofQEvfW5BSDziJdnIy7HrvhLCy8ISpAg/ASlIzd2nKVoqh98?=
 =?us-ascii?Q?6pR3n4g3g/IHfIKhgrmierYjTg6lmyRxzymIgdaXRvid7p0riAWHThZozuWC?=
 =?us-ascii?Q?dWSz/paRx/nwcdGncFzMSyIJa/hNB7KeZabueqHeaFJJghP0dwIl9BipYPEM?=
 =?us-ascii?Q?cbmNZ5MCnwghZmt8JtHnA+gT4zq4FniJ3oqN8WQErjqApl9UDs3Xq4i12akM?=
 =?us-ascii?Q?8kA2o6xxNX1FL6HmTKXsJvZRGnbfHRdzBcmb0tSBaq8Lu9lUt8SmnSflkF0a?=
 =?us-ascii?Q?eynAStq4CzJSlgXBAPmFc5cyMq0fWen2rPWPAWZLW4omYVzUrO6mynk8r7x/?=
 =?us-ascii?Q?UB73bbzg67b8p85kkewkzAOeHsZ2wAlH2zbKQ2rYC8fe7pqaZBBEAleZSWyI?=
 =?us-ascii?Q?op7oPuBvtyRWVQ35EH65w+OfuRu/HxMI+GgcJv8Vu258z+SV6iKcgvXlxqPN?=
 =?us-ascii?Q?R7ijTx/n0PDAFY8lfXBjs1YJtzGOGxJ356qlVqHjmkbdRaUMa2vCvUImthB+?=
 =?us-ascii?Q?6MHETlb37nMqjydgxVrp8B4vxUmFlF2jWEQqFDjgupm/7HGg0gplTmp2E6j7?=
 =?us-ascii?Q?5cpOH8iDHA5X0ETlgg6K/ROjhdh2MEHa4RdIzDBa?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72f5be13-391f-41d9-3e1f-08dc476a4f38
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Mar 2024 16:41:50.0881 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IdeiKDDX2+XYZW9M5LyevpxdUSmm8QQx9T5Ej2mq49/LIcA5On9wD4pxFK3kWgNIRG97IYY3ph1oeknCe2I4ASc2sD17ZQQ6gHu4hODT6v0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6416
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
> From: Ceraolo Spurio, Daniele <daniele.ceraolospurio@intel.com>
> Sent: Monday, March 18, 2024 9:19 PM
> To: intel-xe@lists.freedesktop.org
> Cc: Ceraolo Spurio, Daniele <daniele.ceraolospurio@intel.com>; Upadhyay,
> Tejas <tejas.upadhyay@intel.com>; Roper, Matthew D
> <matthew.d.roper@intel.com>
> Subject: [PATCH v2] drm/xe: Always check force_wake_get return code
>=20
> A force_wake_get failure means that the HW might not be awake for the
> access we're doing; this can lead to an immediate error or it can be a mo=
re
> subtle problem (e.g. a register read might return an incorrect value that=
 is still
> valid, leading the driver to make a wrong choice instead of flagging an e=
rror).
> We avoid an error from the force_wake function because callers might hand=
le
> or tolerate the error, but this only works if all callers are checking th=
e error
> code. The majority already do, but a few are not.
> These are mainly falling into 3 categories, which are each handled
> differently:
>=20
> 1) error capture: in this case we want to continue the capture, but we
>    log an info message in dmesg to notify the user that the capture
>    might have incorrect data.
>=20
> 2) ioctl: in this case we return a -EIO error to userspace
>=20
> 3) unabortable actions: these are scenarios where we can't simply abort
>    and retry and so it's better to just try it anyway because there is a
>    chance the HW is awake even with the failure. In this case we throw a
>    warning so we know there was a forcewake problem if something fails
>    down the line.
>=20
> v2: use gt_WARN_ON where appropriate
>=20
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
> Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_devcoredump.c         | 9 +++++++--
>  drivers/gpu/drm/xe/xe_gsc.c                 | 2 +-
>  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 2 +-
>  drivers/gpu/drm/xe/xe_guc.c                 | 5 +++--
>  drivers/gpu/drm/xe/xe_guc_pc.c              | 2 +-
>  drivers/gpu/drm/xe/xe_guc_submit.c          | 4 +++-
>  drivers/gpu/drm/xe/xe_query.c               | 3 ++-
>  7 files changed, 18 insertions(+), 9 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c
> b/drivers/gpu/drm/xe/xe_devcoredump.c
> index 0fcd30680323..7d3aa6bd3524 100644
> --- a/drivers/gpu/drm/xe/xe_devcoredump.c
> +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
> @@ -13,6 +13,7 @@
>  #include "xe_exec_queue.h"
>  #include "xe_force_wake.h"
>  #include "xe_gt.h"
> +#include "xe_gt_printk.h"
>  #include "xe_guc_ct.h"
>  #include "xe_guc_submit.h"
>  #include "xe_hw_engine.h"
> @@ -64,7 +65,9 @@ static void xe_devcoredump_deferred_snap_work(struct
> work_struct *work)  {
>  	struct xe_devcoredump_snapshot *ss =3D container_of(work,
> typeof(*ss), work);
>=20
> -	xe_force_wake_get(gt_to_fw(ss->gt), XE_FORCEWAKE_ALL);
> +	/* keep going if fw fails as we still want to save the memory and SW
> data */
> +	if (xe_force_wake_get(gt_to_fw(ss->gt), XE_FORCEWAKE_ALL))
> +		xe_gt_info(ss->gt, "failed to get forcewake for coredump
> capture\n");
>  	xe_vm_snapshot_capture_delayed(ss->vm);
>  	xe_guc_exec_queue_snapshot_capture_delayed(ss->ge);
>  	xe_force_wake_put(gt_to_fw(ss->gt), XE_FORCEWAKE_ALL); @@ -
> 180,7 +183,9 @@ static void devcoredump_snapshot(struct xe_devcoredump
> *coredump,
>  		}
>  	}
>=20
> -	xe_force_wake_get(gt_to_fw(q->gt), XE_FORCEWAKE_ALL);
> +	/* keep going if fw fails as we still want to save the memory and SW
> data */
> +	if (xe_force_wake_get(gt_to_fw(q->gt), XE_FORCEWAKE_ALL))
> +		xe_gt_info(ss->gt, "failed to get forcewake for coredump
> capture\n");
>=20
>  	coredump->snapshot.ct =3D xe_guc_ct_snapshot_capture(&guc->ct,
> true);
>  	coredump->snapshot.ge =3D
> xe_guc_exec_queue_snapshot_capture(job);
> diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c in=
dex
> 09f6e7899921..8339b0b49dfb 100644
> --- a/drivers/gpu/drm/xe/xe_gsc.c
> +++ b/drivers/gpu/drm/xe/xe_gsc.c
> @@ -326,7 +326,7 @@ static void gsc_work(struct work_struct *work)
>  	spin_unlock_irq(&gsc->lock);
>=20
>  	xe_pm_runtime_get(xe);
> -	xe_force_wake_get(gt_to_fw(gt), XE_FW_GSC);
> +	xe_gt_WARN_ON(gt, xe_force_wake_get(gt_to_fw(gt), XE_FW_GSC));
>=20
>  	if (actions & GSC_ACTION_ER_COMPLETE) {
>  		ret =3D gsc_er_complete(gt);
> diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> index a3c4ffba679d..25b4111097bc 100644
> --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> @@ -247,7 +247,7 @@ int xe_gt_tlb_invalidation_ggtt(struct xe_gt *gt)
>=20
>  		xe_gt_tlb_invalidation_wait(gt, seqno);
>  	} else if (xe_device_uc_enabled(xe)) {
> -		xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> +		xe_gt_WARN_ON(gt, xe_force_wake_get(gt_to_fw(gt),
> XE_FW_GT));
>  		if (xe->info.platform =3D=3D XE_PVC || GRAPHICS_VER(xe) >=3D 20) {
>  			xe_mmio_write32(gt, PVC_GUC_TLB_INV_DESC1,
>=20
> 	PVC_GUC_TLB_INV_DESC1_INVALIDATE);
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c in=
dex
> caa86ccbe9e7..9ed939c20602 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -250,10 +250,11 @@ static void guc_write_params(struct xe_guc *guc)
> static void guc_fini(struct drm_device *drm, void *arg)  {
>  	struct xe_guc *guc =3D arg;
> +	struct xe_gt *gt =3D guc_to_gt(guc);
>=20
> -	xe_force_wake_get(gt_to_fw(guc_to_gt(guc)), XE_FORCEWAKE_ALL);
> +	xe_gt_WARN_ON(gt, xe_force_wake_get(gt_to_fw(gt),
> XE_FORCEWAKE_ALL));
>  	xe_uc_fini_hw(&guc_to_gt(guc)->uc);
> -	xe_force_wake_put(gt_to_fw(guc_to_gt(guc)), XE_FORCEWAKE_ALL);
> +	xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>  }
>=20
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c
> b/drivers/gpu/drm/xe/xe_guc_pc.c index f4b031b8d9de..b4b39bfcb5d5
> 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -927,7 +927,7 @@ static void xe_guc_pc_fini(struct drm_device *drm,
> void *arg)
>  		return;
>  	}
>=20
> -	xe_force_wake_get(gt_to_fw(pc_to_gt(pc)), XE_FORCEWAKE_ALL);
> +	XE_WARN_ON(xe_force_wake_get(gt_to_fw(pc_to_gt(pc)),
> +XE_FORCEWAKE_ALL));

Why no XE_gt_WARN_ON() here?

Thanks,
Tejas
>  	XE_WARN_ON(xe_guc_pc_gucrc_disable(pc));
>  	XE_WARN_ON(xe_guc_pc_stop(pc));
>  	xe_force_wake_put(gt_to_fw(pc_to_gt(pc)), XE_FORCEWAKE_ALL);
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c
> b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 82c955a2a15c..d51cb9a4a6b7 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -833,7 +833,9 @@ static void simple_error_capture(struct
> xe_exec_queue *q)
>  			}
>  		}
>=20
> -		xe_force_wake_get(gt_to_fw(guc_to_gt(guc)),
> XE_FORCEWAKE_ALL);
> +		if (xe_force_wake_get(gt_to_fw(guc_to_gt(guc)),
> XE_FORCEWAKE_ALL))
> +			xe_gt_info(guc_to_gt(guc),
> +				   "failed to get forcewake for error capture");
>  		xe_guc_ct_print(&guc->ct, &p, true);
>  		guc_exec_queue_print(q, &p);
>  		for_each_hw_engine(hwe, guc_to_gt(guc), id) { diff --git
> a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c index
> e80321b34918..fcd8680d2ccc 100644
> --- a/drivers/gpu/drm/xe/xe_query.c
> +++ b/drivers/gpu/drm/xe/xe_query.c
> @@ -148,7 +148,8 @@ query_engine_cycles(struct xe_device *xe,
>  	if (!hwe)
>  		return -EINVAL;
>=20
> -	xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> +	if (xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL))
> +		return -EIO;
>=20
>  	__read_timestamps(gt,
>  			  RING_TIMESTAMP(hwe->mmio_base),
> --
> 2.43.0

