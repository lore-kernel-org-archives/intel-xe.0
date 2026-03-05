Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABCEFF33A8D
	for <intel-xe@archiver.kernel.org>; Thu,  5 Mar 2026 15:24:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F97E10E2B9;
	Thu,  5 Mar 2026 15:24:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EYp8X7Um";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7940610E2B9
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Mar 2026 15:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772724245; x=1804260245;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=gBsSPQ5qs85RHARIYO2G+TFWc1Jd9LzTUaA1Aqx+v/s=;
 b=EYp8X7UmvdrnvMNmlMWqgNxzMdV+JAvzhu9eIMqJBEdPbKB7U1JIixGj
 I+mnTZPW8pJG+0O7k+ynXGk/clNIybjxDUTRtuYLLt8KCcTCoEJxZYj9F
 PQ/KltdWp+ZtBkJdxA8nvM56ypLdBkrKAlD8NbDpqNyhjFSWV5YWBdBZ8
 llLdF8kIJS+UC8GsjoKjHjFF/55THgf41vENmZyHbZkcHqpLEkqS8a0ow
 GRNkV9nphmM9eQf7eezAaQCabsIssIiPqiB/evfdL7JiGB5iuXj90Dc+8
 eEfBC03A3w8iP2yaV2INyk6PaXGA7WvSzKOMPaRiE6URlRJk2kJnWnbNw w==;
X-CSE-ConnectionGUID: 1rEop6lOQlSPvcXJcz8FmA==
X-CSE-MsgGUID: FGljh2TZSmqhy2iuBMsLeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="61386588"
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; d="scan'208";a="61386588"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 07:24:05 -0800
X-CSE-ConnectionGUID: aTHR2XVAQLelfW+EbtJHOQ==
X-CSE-MsgGUID: ZnfID9Z1T1uGFApV7lcL8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; d="scan'208";a="217863549"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 07:24:01 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 5 Mar 2026 07:24:00 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 5 Mar 2026 07:24:00 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.10) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 5 Mar 2026 07:23:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ytkUZ9TVHNekeHfB/s/PvL963DId18liAFXy3LbFtM6MpnnTCtoeCe975p3PUi7N0o/BO5Y1ZqRqFhv+PlbAErVU5yD4AihrCnfvTKrqGSJWcd5+ei+OAxMcHND7ge5csyj1f4gEbU32EPeqIiIWBjNIwwhNbd9QoxP7OS6cfZ+lUtvqAv7+L05YnsSqwTId7zcYr2XicM5M4XngtcwBpipbTpYPCdjog8WlmjfqFx8Rz1C1qlCnK/NhNX6flS4puMCemsDj80FJeWDS/bdKk2GDXLDnPiCDtsPjvwtqbakzaRhvIUv5B6krRr/NhILrOSNb+Vx/2uYe1XAfRL3nxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QwC/dD1jqTOZAInhDwqEP0XOJ6wmh0CQLFZGzDH5Wdw=;
 b=pDVW6iaJGcLEt70mf22M/rCP+S2xQkO2pMrrU/rw/ywuf7/4N0a1bzLIa09De4kR2WJ71Z1f2xg9xUklOwXY4amwAo0Y3VwOm0TvDBTVyxxBVlZd2eSvoicR4GscuhSiyGvZUkZT/H3rzj02anW4K3gqqw8fd9uQvb8aGV9DLpIXhgjtR5OVgzlKaR8W5Ivm7mPDMJ7ALeIcP85ivLwb/WrGGXixmvspfDjtSfRivCfVz2j0p6YFaYB2mhWbeArkFit/BHXsAAI/nbXQ/pSpGyzFTt7WFZ7086aycQFEu7yjNBuG1WFhMheaLyNX38SK9tFBEcqIe4cPXcZu17ZlqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by SJ0PR11MB4862.namprd11.prod.outlook.com (2603:10b6:a03:2de::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Thu, 5 Mar
 2026 15:23:57 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a%3]) with mapi id 15.20.9678.016; Thu, 5 Mar 2026
 15:23:56 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: Re: [PATCH 5/7] drm/xe/nvlp: Implement Wa_14026539277
In-Reply-To: <20260305-extra-nvl-p-enabling-patches-v1-5-5020d5289dea@intel.com>
References: <20260305-extra-nvl-p-enabling-patches-v1-0-5020d5289dea@intel.com>
 <20260305-extra-nvl-p-enabling-patches-v1-5-5020d5289dea@intel.com>
Date: Thu, 5 Mar 2026 12:23:52 -0300
Message-ID: <87a4wm8flj.fsf@intel.com>
Content-Type: text/plain
X-ClientProxiedBy: BYAPR03CA0022.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::35) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|SJ0PR11MB4862:EE_
X-MS-Office365-Filtering-Correlation-Id: 9056d6e7-a5fc-4aea-30e9-08de7acb37d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: S/gg3mQsAo20g8Z4wyA5ytvMxfIaTt2dmpguREMUyUYEKZbGPOFdJp19N5x9IgUo361E5Yninjm5nGFEDkoYbO6s4xtwRt6SvPuttCyGknxzjmQH01fi98s8qlftX81Is84B50OEHiNhjYq1vLjc4CtdpI5Wq11huKNVnU1PMLYSIt9X+/xJ8WREh3kgisJ7OTdfFYPXtbBsMGHhjCQfdAV2VoH0/tnxASYlPgihJ6SRayBxXOtKVMXPPonYmJ1TyYfh4S+NQvnOTI6kYh9g0oq3NI1XygTMiDEys9dm+Yo4Cx627C+UBR5aU9JNH8ZnZGqizgYCSjyR3dcmrm4US2TWP0F3EGlAiWtetARC1H/InQUZLN+J6WIQ7ArRMHWcdH8RehW8XfODcNvufX3jso57F1qNY++UHwdld57QklUl576M178wx7EbsQGXrtC4/ca7tcj/Ivd9uFJrN4AMS3flPCaa/UfqcgkFFBfCzfogkfxZnys3Wm0d7qprRSyy9pOAYt4a1pDLEON6Xrb/oEVRArcORpaPCSjSUaOFQzHoHTfAombvjWHTgQgg4+J6gRPU6ak3b01IMcMMRtnxXKO5DyLiLq52EA+RtOIYDV9BNoKdB/tBeSpQ8Z4lzhjMFHGWWV7ANBCS0Gf6lGjpQAt3rqcezZz2kHLU36R8xgNi7hSGF6H+QMYRG0lBJxdxLRCUxuI/de26EirqO6mS61TSF34W7GWtozY+hOv6yZc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?L4MJnODBnq4hzP+Y5LfGl64LAMs22EX+qwMdyRrh6ACZCOd0QGO1L9DcV0Um?=
 =?us-ascii?Q?Cl+Q1YBcDtIxF2Rl/xYh847i+oTTG60NpRpVPnHn54ZifZpcdBhxyewKesa/?=
 =?us-ascii?Q?nI8kcOmZi1siH5Djak6YM1lKo2GWfLO+9Fjy40aJ8fvqlpBBezKjY53q3CjO?=
 =?us-ascii?Q?9FFW5dUriHAboOmX9DEGDyfJnicV8CrcI2CbwIiq51sxeUbDjJqTotLR77T1?=
 =?us-ascii?Q?tztfp/K/kEWGTlAtjjSN6uoxMgW4hwSNZaY7a5X0hR7M8Be4CPoIaTYRWtnR?=
 =?us-ascii?Q?wvxRMjr9SV/TQ/zip4HRzufFfnNo9YUIVOULVViTnVmuKp9lA4w2cGfbHM77?=
 =?us-ascii?Q?IIqrO8dw6ePxTDjg0LqFZAgurWp6ExI1LoO4rKRtfW97dKbN2OYk+WKGOOVM?=
 =?us-ascii?Q?5qkL2wvtepnvk0S71EJKT5SCAmONXfIyt11johajOMi6NRFBoQrgtrHjlPuV?=
 =?us-ascii?Q?HPsYvvi9qsjRxylw67XKE3kigkXhOHsaASLKNhcAwb85Pq+SHBuVcLITi6JY?=
 =?us-ascii?Q?3CQG6Hj1n8iq5SovJWJjyEqLqaBLQdlK41C2LLp8U6KfFo+Eh8kZH/yohmcO?=
 =?us-ascii?Q?vCN5ljUbk1YMY4STxOKV9rErbzq/ZOah5602yN35VrwDZxm9T3yRBul85Z2f?=
 =?us-ascii?Q?7PHPHi+UUQ7d5v9WxWS6s/yNiEMz0x33VBKFPoeaDq+l4vQF2LuJwLB5byoF?=
 =?us-ascii?Q?N7sdO8qTew6d6QYGYv7W9GY8CKKK9nbV1PZvemuZQF0b6+uyHNWrYD8oI7/d?=
 =?us-ascii?Q?15dtH/4Hueed3RCCXmP0H99hV+boMB/Ep5mIiFH2DVGKGBax7ujhZ500Lh3K?=
 =?us-ascii?Q?GrckBozC8hM/aFhIo+Eua7QMViMjExBRTAXS8VBQgzrpoAO20tzZkNFkigm7?=
 =?us-ascii?Q?RPiG10rtyXR5j0VKLPhm7mby6n7HUtEsJNGmEuMD6jnbhop9kKceBxKdQ28S?=
 =?us-ascii?Q?FszGCKNpeRwYJpyjBNopK3tn9/iZTHTsKbSaX/QlhgDTSi+2pu+f7VAbY4t0?=
 =?us-ascii?Q?2jKSEJsy52/YCmGSFmPfVOfZGMOvCuf9lNeXAxKudty8/oH+fhfKO+5qkI3V?=
 =?us-ascii?Q?GtKokkFXKpnsvvrhM7UOuFpMT6S6dkgAGfCsyL6Kduu3+EJ5Lkjx3GjV1YWj?=
 =?us-ascii?Q?FfjQvSojKpU5TRfdyxC0C0Txj9wDOCzgTi+yTl9Kv/cfVZfbxa44Pi6t9gEr?=
 =?us-ascii?Q?goNAmg1LiwK9p0khsFXBMZCOfQvLachrV4kRqtYmp6+DcWd9YLIeJI+8L4my?=
 =?us-ascii?Q?TAKyDPFL4+GTFYi/E11248wgKAZC6/H7IKsxVl1MK391OKxtPYAveBSdyPyz?=
 =?us-ascii?Q?GpTCofCeJLEm9/8XPcu7VnGRmgYioo5/LCSiiWJwpES8Zlg+uX3rGvuccmbH?=
 =?us-ascii?Q?WrrQwaXVJFMqYGxD8pQqac/8l3A8B14uLAYXsXLQIp8l5e56o+ui6Vu+6Tcs?=
 =?us-ascii?Q?WSFMvviexV5iW0xaWhie/Zg2vewAyVRz826hrBk2DlcDU2QYNrp2pjE//C1s?=
 =?us-ascii?Q?j9aPDEeBDZzhkbt2JY6lItdxueHcF+t3mh9qU7EqVgRFPDnhyd9v7a4JQKMT?=
 =?us-ascii?Q?1u8Q9g9BuDRXuuw6pF58FSaXwMVwT2hv/ylCb72ZVAGCR1NIQwi6C0v+cDfH?=
 =?us-ascii?Q?tqJ1Yy79Ans4a5S6yS8Vo9Ect3/nQrCV2hcvjNOwl5lEQh+6905kKpAzUGUq?=
 =?us-ascii?Q?GMkz/e7ljaitNM+rQ4YNCnhBS0PLennqvw2j2pErhgneFY9jsLb9Hi5eXZo8?=
 =?us-ascii?Q?y55cOrJAqw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9056d6e7-a5fc-4aea-30e9-08de7acb37d6
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 15:23:56.8985 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BQxk6Bgk0RVTtDM0Pc/QdFQJEyIaBD2NM93VMPgzZ9GEXe7uf3Dkh1GsLFqufL09Jlx3CfScdX66yDYNPDjEDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4862
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

Gustavo Sousa <gustavo.sousa@intel.com> writes:

> Implement the KMD part of Wa_14026539277, which applies to NVL-P A0.
> The KMD implementation is just one component of the workaround, which
> also depends on Pcode to implement its part in order to be complete.
>
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

It appears SRIOV VF wouldn't have access to the register below, right?

Adding Piotr here, since we talked about it offline recently. Does
implementing this only on PF side suffice?

If so, should we return early here if on a VF or should we rather add a
FUNC(xe_rtp_match_not_sriov_vf) in the rules for Wa_14026539277?

One thing that I realize with the latter approach is that 14026539277
would not be listed in the workarounds debugfs file.  Do we really want
that? I think this question applies to all cases where we use
FUNC(xe_rtp_match_not_sriov_vf), not only this one.

--
Gustavo Sousa

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
> index 80b54b195f20..7f42436df6ab 100644
> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> @@ -58,3 +58,5 @@
>  
>  14025883347	MEDIA_VERSION_RANGE(1301, 3503)
>  		GRAPHICS_VERSION_RANGE(2004, 3005)
> +
> +14026539277	PLATFORM(NOVALAKE_P), PLATFORM_STEP(A0, B0), GRAPHICS_VERSION(3510)
>
> -- 
> 2.52.0
