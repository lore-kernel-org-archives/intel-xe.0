Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79A75FCC056
	for <intel-xe@archiver.kernel.org>; Fri,  6 Mar 2026 18:40:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0510A10E3DC;
	Fri,  6 Mar 2026 18:40:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eKvH2O9/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68CB110E3DC
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Mar 2026 18:39:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772822400; x=1804358400;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=FRoa/O4To1+L1toPJ4HVxsVz5ipPK6l5Gv7kZIyi5EM=;
 b=eKvH2O9/xOXlXuE5WgEiJuiWvnueFodXscDHmbZwIGsJjGq03Xhmlq7S
 onDJvbMjL/2Rw+PQHRrsDAxdHLm63m6NkVfW1lS/7Hdw7kkwECWXAibIT
 +14HuBL6+tjfmJeVibSgNOgY5Nd1er8TTG+XAsn1lDyspckbxVmMuZbJV
 carvEtAD5LSNMWM/ZO/RWokhnQsWlNvWivM9oWsx6W4XlCUn989Yp6zy/
 vir3AoEbxKWmzXAaa8iTt3PAo1qs50hwrvpMLC5jlZJeKnUXwddcnxPxR
 dziL4h6o/Gj8Uj0uJ3o/D5U13EFDe8R61+LDP+gxnXS5UDcvza5uKr+Dn g==;
X-CSE-ConnectionGUID: 4hqgClXTSkar106rytN9og==
X-CSE-MsgGUID: j6sQX7ppR4WVjm3Z8ZGYLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11721"; a="77785790"
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; d="scan'208";a="77785790"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2026 10:39:59 -0800
X-CSE-ConnectionGUID: JaWuXrGoRi6YT8xpQuyo0Q==
X-CSE-MsgGUID: wBFqAsklQRaPdlK2W8NDzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; d="scan'208";a="223577824"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2026 10:39:59 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 6 Mar 2026 10:39:58 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 6 Mar 2026 10:39:58 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.59) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 6 Mar 2026 10:39:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XZtEJD9duki2jK92UHK2pOsM3ZwNNwQoV42k1L9cm4SHOfYmeV7L000kgWvN/88JWnULKrT92I938gWi8aMjnBMz5RagCAfGtIsAyk1/zTtEc9EqBKk36oDUAOkhNVwExf2v4oMxr5km49KTUImz3JilgHq6eJ/iW54hrTPWPLBCBqlh3tA13nFGBhTPx7O3x9a4i8a5VTc8/bAS9KmvKCkjGKwubpLjmJo/C+A23EEw/0+dNMIJVDmoh1hM88v0rTilxqkiBf0ubIdoDywaoPm/WbJElC5zoA7XadntB1i87X9+hrOUDApicERCmX7SYGmQuiJRENlzQt4noFwGcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZpIQh/n3EC258Z/TNnLkah4is7BmmicQckH4tZAr44w=;
 b=kqLkNc21bbL3dpBLK78xmxhHSSZer0sRyPrxVTuuVI+elnu6yxlbtLjjUdZHjHmWK8hwD17bbNGHdIXSdaIIo/+s8HGT9yS4PmQ6N5jEkiK4a6JVhxszURsX+zCTuGKiAzD72oWrjBorUZFfr7yQQl11bFMdFQnAhNfz249xviyfv8pV09Smj/AjVhMfbGacVJvFZlaw86Q7o/kSJsI57uys5V6Vz/rrLnryg38nscm1/Nj65AA36dRYwKu44H/iTC3SiaNLU1Sl1evN6oGkMppLF04Z8O4nG3KvolceFFqsSLMRlrmqsL2+Lp0sUKP14JGZAOn+tO/kJAVcY4daUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DS0PR11MB6517.namprd11.prod.outlook.com (2603:10b6:8:d3::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18; Fri, 6 Mar 2026 18:39:55 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9678.017; Fri, 6 Mar 2026
 18:39:55 +0000
Date: Fri, 6 Mar 2026 10:39:53 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 5/7] drm/xe/nvlp: Implement Wa_14026539277
Message-ID: <20260306183953.GY52346@mdroper-desk1.amr.corp.intel.com>
References: <20260306-extra-nvl-p-enabling-patches-v2-0-53dcfa6b44e4@intel.com>
 <20260306-extra-nvl-p-enabling-patches-v2-5-53dcfa6b44e4@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260306-extra-nvl-p-enabling-patches-v2-5-53dcfa6b44e4@intel.com>
X-ClientProxiedBy: SJ0PR03CA0274.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::9) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DS0PR11MB6517:EE_
X-MS-Office365-Filtering-Correlation-Id: 5826dc2d-5914-4df1-df2e-08de7bafc2d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 1f2OL3935VSDgwPU1xaL1QbwEFdZXvpf35BDr1MV043RkYcslLlHzmn5ImrharmNQ35vdugff2EngDXdJ4fM5O70NGr92fR7cGOovlBLEQ6TbWqJCbKCEvtLdZf8MBYE/iOomL0zhWYC/Q5UkE+kcloDpA+NbEtm3NTvtVX7FpoL4CjrjJTQgNMd3+LPLISWYT1pAwO7KyiWSyHq91ShHMV9NKCe8aKluD43KJtRrmHKcXqzI4iza2S12YfNxYXKwG/KJkuoGPq/iIem3ZL+U+DFXdCIe0/7ooGSYHp5wTZIX1zCjNHGoFsYkNZ85VI476IQrhuNm28REsgUji0swMYsYLXmBPjAq129yYO5tvgRopW3wiiT8BYN4cpu5mcSxJmID42lGMqvijSjH6iFIuSvRg55NXxZjW14eUaCsrIvvRfOf24zP25mXXxXe6VMEALjKlj/pg028ft1TvUUtYVrT75nz7swDaPzmeLeBWaUgzahdYl28jniFpNuX7LCTEzY5gYOHyDhCmlGucTPXQKCOL/DhhephZeY46XKM1J4/wJhXALUC0b+HDWMZhOdpEufZRcOSdy2tk31MrEO9BdcTLRMxAkYiM1wXkH9QaSm3IRE982noOcH+3PshpFOjJfCnSNDY/mH/VbEhUJoFB/v1DlFrD9JaRFbKRjWcSWmK2iyfDJS25re+bv0G4MaxCp9xGkObhRHG+xBtGDtyxGTcf0ZmI9AJ7bDCEpMT8Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jUxKiSGpVIYglTJq/5L7fxUfq6Q+v1LMpIPawkf0gQVnI2hpkqjxILQMcgX8?=
 =?us-ascii?Q?wC/guaswsD4Nd70h1aUDZUDwKLjs6dnZLOSvQTYkmxor3ny3gQ0pJoMCDhQI?=
 =?us-ascii?Q?h6fLTI2Wq1OZfZZucpCgF5QTOYI3wJ8+Pcsf66OYlgsAnvnoMg+nFI77+/sU?=
 =?us-ascii?Q?qg1/+7s6zZOAuEYtMlW4WLKYKQmkD2nJyY+yn01TxzvF/gDeYVA3XA8AYtDM?=
 =?us-ascii?Q?6kt7+kJfvmWr0yXQiVvWVmgkCzcELZgGrtiFjqWlXeY7eGf6eA4T5XXs0gVR?=
 =?us-ascii?Q?MOqfV5DWTokPoN32H6d2+a4ZnTvSwi25wqufeu5XXagI80x6Z3yL1ZMCyTZu?=
 =?us-ascii?Q?Z1XP0hzPbNl1HGVeaRuXYI5LzmNzSvmxDUC3ljyeX2Kr9WG/cHxgh/WbFl9z?=
 =?us-ascii?Q?62b6t3axs9ZwfsConBWY0T2QIZA2Iv3LDE2xFrmDw6W9nvsdHM9vjjHYiLHN?=
 =?us-ascii?Q?sxVi7O2iMP0cdECyxKgS0HxwlJQCWJ3KGtuxYNWs+org+6JF+H4N9ByZBUzq?=
 =?us-ascii?Q?GhGOwFlSEjvy7rhG3lVLpesINdSzCYHEKc/DXnHsJrjCHZ7e+WknQ17Uu4Bm?=
 =?us-ascii?Q?idNSdaMdSZGjsn9t2yAO/dffLKRYtOpRCTP2BfmoRWe5FvfhdJVx0fc+PkAt?=
 =?us-ascii?Q?wOyeEF4d5lMt5d1Yqz9yVXQ+gwjLNSTJY9C2y2l5TRvUnJQ0XvWrHDmUDdMf?=
 =?us-ascii?Q?oM5a8dxmicr8lJbu3xaSuVmsJfDFCS3hCabPsJEAtoeuxZN0nRCPW6EsBSDC?=
 =?us-ascii?Q?yXhAuO2xHOmXmon85EvzMtLa4rX/wEYy8ng7HqhHETb62dh4yirho0FM2kot?=
 =?us-ascii?Q?R0O/ROgMQJAW64kwkzTRPz9fPOmZPwSruG4L35EHn/u46e4UdU9Orw1EI9e1?=
 =?us-ascii?Q?1UEHn2pCeYxlrKYOSgGoJX5Prm2MszNCR4wTilaujEeMI5uS9cLleDUDBVzQ?=
 =?us-ascii?Q?RA2H5vDynLuG/s0unNtYRc6zym0k7ObGw+7x5YU8I0ZXUf4BmFwWQ6uIWTvo?=
 =?us-ascii?Q?nCSkW4/Np0Lb8Ui3A2vcliaTF8J9hpeUhauRaOOTQUiUOr0JJz0ZwWV3yd1u?=
 =?us-ascii?Q?LGQi+78Mf2nlRdJzW4VkAIi6q5c2c/V1XVZUpOaCgEpRXOMmgj8XRmlD3Tn7?=
 =?us-ascii?Q?96qtzBpl6jokvLk6/iFWAedQz86B04UkkFGkBAfiLMVilrZAoVBtDhXzchO4?=
 =?us-ascii?Q?mA6RfodNrVykIyBhHVB2eCCgGGPpd3K0Tl2osxjknrgXxyMnmvL8S2kmGzqW?=
 =?us-ascii?Q?igc/P6ClWKdyVs2shnROi1O1gmnx8aOiMpb8g5vO2knrxJ79wb2oSbz0WpBl?=
 =?us-ascii?Q?4mEtyvj5vMiGDDf3rCte1Jc5P65EyeTAdB+wSa8r0dWgOtZ5rU2ve8ea821G?=
 =?us-ascii?Q?4TeBdz1voq3AnVMS8XCs0KtPHDW+OFjkZkQOyhk8Aqx6I+QoUE607d9yKFpr?=
 =?us-ascii?Q?fRT59xDsxVO1GIfeW+bZNkjEDm252qkR2q0x1lzkYGcmREkAGLQkCKLdSwLf?=
 =?us-ascii?Q?LCpDMisoD7Vl4hsc/aQWECMknDiibd9dlGpNXt+S+BJVS7E3L8zj94lyPVhD?=
 =?us-ascii?Q?97Yu6/5zB8i6OB8QRv5HLL8yUWIGzHmGmaLslH7mIONP9dRMAE6orXFh3h4X?=
 =?us-ascii?Q?APcHQ+6FZoxI35UzuTbOXo2hmxkzvMO0b9msJEawkqSEopsbD5N55dhzU7lo?=
 =?us-ascii?Q?NcBocSj6gyXwxi2VsF8S9rrPfjIxjImmCoYkddSjtSkdwjGer1q6zE1tiGwl?=
 =?us-ascii?Q?9iHpLN3KQ6a2+ALCLprPpjNzIf0w41w=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5826dc2d-5914-4df1-df2e-08de7bafc2d4
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 18:39:55.3499 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V5xG5hv/oqvR9qOaB0aGjsDHzeN6YVwWdtOdFl6zIu5a6G52J9n2/j9dKeY65ABqeEL0sVSZ3Bqg3ZVdW7HZ5ha9YJJwblSDG/C82PUdcRo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6517
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

On Fri, Mar 06, 2026 at 02:28:25PM -0300, Gustavo Sousa wrote:
> Implement the KMD part of Wa_14026539277, which applies to NVL-P A0.
> The KMD implementation is just one component of the workaround, which
> also depends on Pcode to implement its part in order to be complete.
> 
> v2:
>   - Add FUNC(xe_rtp_match_not_sriov_vf) to skip applying the workaround
>     to SRIOV VFs. (Matt)
> 
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h |  4 ++++
>  drivers/gpu/drm/xe/xe_gt.c           | 27 +++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_wa_oob.rules   |  2 ++
>  3 files changed, 33 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 66ddad767ad4..a83cafbe03fd 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -452,6 +452,10 @@
>  
>  #define XEHPC_L3CLOS_MASK(i)			XE_REG_MCR(0xb194 + (i) * 8)
>  
> +#define L2COMPUTESIDECTRL			XE_REG_MCR(0xb1c0)
> +#define   CECTRL				REG_GENMASK(2, 1)
> +#define   CECTRL_CENODATA_ALWAYS		REG_FIELD_PREP(CECTRL, 0x0)
> +
>  #define XE2_GLOBAL_INVAL			XE_REG(0xb404)
>  
>  #define XE2LPM_L3SQCREG2			XE_REG_MCR(0xb604)
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index b455af1e6072..3c8692f9b8cf 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -450,6 +450,25 @@ int xe_gt_record_default_lrcs(struct xe_gt *gt)
>  	return err;
>  }
>  
> +static void xe_gt_wa_14026539277(struct xe_gt *gt)
> +{
> +	u32 val;
> +
> +	if (!XE_GT_WA(gt, 14026539277))
> +		return;
> +
> +	/*
> +	 * L2COMPUTESIDECTRL has a specific offset for media and the GSI offset
> +	 * does not apply.
> +	 */
> +	xe_gt_assert(gt, xe_gt_is_main_type(gt));
> +
> +	val = xe_gt_mcr_unicast_read_any(gt, L2COMPUTESIDECTRL);
> +	val &= ~CECTRL;
> +	val |= CECTRL_CENODATA_ALWAYS;
> +	xe_gt_mcr_multicast_write(gt, L2COMPUTESIDECTRL, val);
> +}
> +
>  int xe_gt_init_early(struct xe_gt *gt)
>  {
>  	int err;
> @@ -575,6 +594,14 @@ static int gt_init_with_gt_forcewake(struct xe_gt *gt)
>  	 */
>  	gt->info.gmdid = xe_mmio_read32(&gt->mmio, GMD_ID);
>  
> +	/*
> +	 * Wa_14026539277 can't be implemented as a regular GT workaround (i.e.
> +	 * as an entry in gt_was[]) because we would get the hardware already in
> +	 * a bad state by the time it would be applied.  Hence, we implement it
> +	 * as an OOB workaround and apply it early to prevent that.
> +	 */
> +	xe_gt_wa_14026539277(gt);
> +
>  	return 0;
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
> index 80b54b195f20..03a0bf0aeb6e 100644
> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> @@ -58,3 +58,5 @@
>  
>  14025883347	MEDIA_VERSION_RANGE(1301, 3503)
>  		GRAPHICS_VERSION_RANGE(2004, 3005)
> +
> +14026539277	PLATFORM(NOVALAKE_P), PLATFORM_STEP(A0, B0), GRAPHICS_VERSION(3510), FUNC(xe_rtp_match_not_sriov_vf)

I don't think it's right that we have both platform matches and IP
matches here; that's not something that should usually happen because
the workaround is either tied to the platform (NVL) or tied to the IP
(Xe3p_LPG).  For device workarounds, the handling in our graphics
workaround database can be a bit confusing since what we're looking at
is really just a proxy/placeholder ticket for something that was filed
in a different database originally.  Due to how the databases work, they
have to slap some IP release on the proxy ticket, but in this case we
don't need to add a match for those to our driver rules; just the
platform information is sufficient.

That would also mean that this should probably be an XE_DEVICE_WA()
rather than an XE_GT_WA() and the workaround function we're adding here
should be renamed.


Matt

> 
> -- 
> 2.52.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
