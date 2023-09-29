Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1131CE7AF3
	for <intel-xe@archiver.kernel.org>; Fri, 29 Sep 2023 20:37:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6796610E143;
	Fri, 29 Sep 2023 20:37:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DF9010E143
 for <intel-xe@lists.freedesktop.org>; Fri, 29 Sep 2023 20:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696019865; x=1727555865;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=rgKoOeYwJKjeMr0p+YmFIIWetPNbCUpv22PdQSDaAj4=;
 b=O77FhucmPgpgAr2a+1OziMk2XLXE5ts6ChG3elyo+lMFAbgOXfULyvRO
 23SxU104uKxsqItIUHIswJJDjAnuf2GirCXjUNwlKid3sohSjqv3mG+Wf
 LzbLi4rBOXcpdkaknh5r+kmMnFlKQY6JjF8HuNmNx1Ns8JfEl+gJPsTd4
 Qoc/8ZrJAG5HpDPH4z+p7gVqCculX3X/AFOA7G/ZXPQlF2JYpcxtyZl51
 VsDobD9sgsm6qwtxrX7KSkY/GctpA2lkeAaIQ/gk4PqKa8rBqLLsmfaVL
 WptVRwfGhpdZ45hb8N8+9yULMaloLAAdgCE51RvvNtlZBECYO0a9wb4u5 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="382277999"
X-IronPort-AV: E=Sophos;i="6.03,188,1694761200"; d="scan'208";a="382277999"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2023 12:58:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="785184520"
X-IronPort-AV: E=Sophos;i="6.03,188,1694761200"; d="scan'208";a="785184520"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Sep 2023 12:58:16 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 29 Sep 2023 12:58:16 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 29 Sep 2023 12:58:16 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 29 Sep 2023 12:58:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g4NCriEzUjjeuzHl/McobWbr4U22rEubP1FJ7yPpSQtzmrBNgUJtXZoSJMyk8t9mEWV/ox5Q+HWSCP5W/yiOpddVJPrQmWDiGIjpNEmSrQPA3tgfSfQdh6KFzAT1CzZx0H//S2LsGSTRbMDyl7n19ah6oP0k9wYX7wAVv3CylNyctlL03JXWxrg031STU8Nml8LtxDssRKWGsnS0DO2jn5+gbiTkM6kmfm1AWS7uUYnVnL8u/DpfiHHk4vrOT86hB8stZutFfbwuf28FPLA0619VSs7AIw27PyUmibkcHNno1PPh460ZVtSo3wjYGB0V/BLR8t4LXiTBC8WejXo1Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NS9RqiR9jzLOq0Tfb058U51rLNAJXIcYOZ0btnNXUh4=;
 b=MEstZKU1u3oz9pHlC/dUgu1MFrXda0sUQx33bu9Srx01j2ahKEVuUrGe7YOQPfp7Bmv7Qn/EPJMosQqcOifaVCh6712H89yDIbjWkIblISFXsMorQqyjgGXflC1M2G4EMejwxtrn1clvJOI2P2Rhq7OjlKMOP+/bTsplT2/e5dXxwbzU6UOGjpXr13iuyXoX18SjbOXUXW3bHo7O4vUsOackq8EnoANd88GC8pMZy+UcKkhnMMoYnS0s4uVGK2wJ870JXkN0/QxpkEV59C+xlNPxatefkIxoRk+ZTfoF9iaHiWsvex874tEEmHXkrCATy9KUNS7M0D/aN1rWVwrG1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 DM4PR11MB6189.namprd11.prod.outlook.com (2603:10b6:8:ae::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6813.28; Fri, 29 Sep 2023 19:58:14 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::14ea:3a78:f950:d6d0]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::14ea:3a78:f950:d6d0%7]) with mapi id 15.20.6838.024; Fri, 29 Sep 2023
 19:58:14 +0000
Date: Fri, 29 Sep 2023 12:58:11 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230929195811.GJ233750@mdroper-desk1.amr.corp.intel.com>
References: <20230929051539.3157441-1-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230929051539.3157441-1-lucas.demarchi@intel.com>
X-ClientProxiedBy: BY3PR05CA0042.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::17) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|DM4PR11MB6189:EE_
X-MS-Office365-Filtering-Correlation-Id: 69dbafe1-30b4-4bd3-6ae3-08dbc1266a18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: s5pX41kuz+ErR2O8YmYBwahfIPQL0GJQWK6uZ/VnEUbMwYelHEMpUTBAqZBlwV0vGsxyCwZw0MLR85C36XEdR1rmZ8MW7tXNO4Bam/LUdx4ct+spdei3TcnkckjHp8Fb7VCdb6h8Oz4BTjurRLEcPlbssB2tfZehnbnSVoV+Z19kXEjaORfkACM4h46+cgW9l2g0rYxm48u/4a6BpgINcn+P+kOXL84lvMlDG+g9tEQLergYkiJSF3p4T1VNm6rGAEb2dO+eELeSSugBVLZj3Y6amGAmXnGdAXvBgRnYHUIFfS219Vc9EqYnC2EnhvZYhZkJ3DxHU9hK03bg5D/OPJbNlbMFhyxYRc+otUs+D/QSfYB9i4H7G3BlytMfdbo24K03FsiZFkBc24fDp+HzyLCLx9rIfVKFms6EWAhsn16cLZtF/oKK4X9sKUMx3ppxhMNSUFq4MSqoBV8m3PRzWHnbJTga6qL5CA48xD+mn5KLrGwYA4NfCv8Rqhy2P04Amq7+SOyMj3IL+uKkQlB4h7yo8zn+wdD3m8aKGb7b4NYn8bKCHJGnwM+eCJKAdQFk
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(136003)(396003)(346002)(376002)(366004)(230922051799003)(64100799003)(1800799009)(451199024)(186009)(6666004)(6506007)(2906002)(478600001)(6486002)(8936002)(38100700002)(26005)(6512007)(66946007)(83380400001)(1076003)(86362001)(41300700001)(5660300002)(66476007)(82960400001)(8676002)(6636002)(33656002)(66556008)(6862004)(4326008)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TeBraycoj6yQB03/4XCwIG7MxgxRoiCPC5KQ+r/hxWuhexxnSupplVAd5P+R?=
 =?us-ascii?Q?ixtzhpzRP+2SjFCJKCA46L79M3LS4xcErGFhwEoU5dKrGq6A8L3WE2ZK+VU1?=
 =?us-ascii?Q?QA+GFwQIG/IgdoAIxOtGUWCr7P3+7LxWeRB7e5Wlw35BjlWKNb/mu7VHGmna?=
 =?us-ascii?Q?KIgow9G5G/lj+Uukm4p7KzYNzMbMf0kxHIIql1rHfH5+sZM5rM8HrntBm91U?=
 =?us-ascii?Q?AJQznZ8wW6p+lrAvd/7pq2QvQv2meiTMpEoUqLuI9LrQJm4Bw78kBsu2fmrD?=
 =?us-ascii?Q?CjXz5fI6oIc69np8Eo3oUCESDAyAZPuz8KNAgbLZEk3ODLMxMqefL8M0Uenn?=
 =?us-ascii?Q?BOA4oa2zThzFlpbBAA/ddoX+HcdF2nib2dszkmckiXBUC6NYiHgkaq5fBz0j?=
 =?us-ascii?Q?fUnicg8dGnqUSgvmmCkajmKQgF4lYEoaVqfpzUAvhE3rQDgMEcwYxLXkpaG0?=
 =?us-ascii?Q?cPmTGTcmujn4W2yV8iD9LppdUugPEnSN6uL1Jx6Fy3ej2ROZNyAcH7GR75Vc?=
 =?us-ascii?Q?lNB5yIJhVEM0WQAHSrP7Oce1kHniSdP9N4Z+auI5dlfnhj+4+Z2k0XBhdfJO?=
 =?us-ascii?Q?FzaFHYQaNNhoN347wRW2QbPDFEYvqDeDl7BuAOpZ/ahj9cdpcAZqdM5VXqjM?=
 =?us-ascii?Q?NNAVdYK+X2mSKgefqsnQw/zzcIa9TU472Q/+d0WLj4BPvK8Xck6y9Tpb3kEr?=
 =?us-ascii?Q?pBqoSgKDrQVTdTOZEux+VQ7QU/jtnwOtu6bihHI09yZ1lwVoLMVi554432mo?=
 =?us-ascii?Q?KGzDXjLsxGvl3CnvaWvy2snS6vPX1kXfYghHbzdRiwnpmrngM8XdwYFLz3H4?=
 =?us-ascii?Q?bm5S8BCUVk2aMoJ9hJHsvlKCJm7zEd2lh1/eapUKIR0n/xav9MsrYDGkCmpM?=
 =?us-ascii?Q?OCamliyigaD7RuX32vfv7yC52NJae4MQXsdVS2UiJfGDDo7Jl7ec7lxSie2u?=
 =?us-ascii?Q?sokL6b+lx+vLh4uBtNHd7v4Ur9SJoJpkPMSoESdY0IV/Sn/72qmwlsdxix41?=
 =?us-ascii?Q?18GruNEGO9GVJtjBipia8vfiSO9OiEH/80lY2q8cVqXGnqwWVn7nuVuYNoqV?=
 =?us-ascii?Q?XrAkhXVPtSru3UUXxSKSpj6DTvn+ZnMAz60wOQkAQe+oG17tcuUS/aigQhNZ?=
 =?us-ascii?Q?RydUwyREIeoDJtYCnJreQW7EU0KX4WxFbk63G1IbFEhNE8zFwAyVY7CyIDyP?=
 =?us-ascii?Q?cRRcWJ0Vtm77mlac8vJu64nYCjoi9F/s3V7Gx/4gSR5hwosgRV/WQHA8/OcT?=
 =?us-ascii?Q?lrFvvp9+yX002A/zaPPRfqL52FERaFlvT5xPj5u1emN/ESe6CSFjbXi967lo?=
 =?us-ascii?Q?KzEBiWjQUQC7QHrexdrW4Uqmov9pX9Exrwd0ywnQsqmxB4naKsIemCxHm2Iy?=
 =?us-ascii?Q?TWmnkUmTjF2HkDOzgGOO5pK4kb6/4OaNUg87CnaT34RX7+9t9dzqV1pVZme5?=
 =?us-ascii?Q?n/3Hl7MpnC4rVM2bsBz5YzobQuJzAVrl4yEDQoJRhPs42QlBhsSfBYoxvG66?=
 =?us-ascii?Q?APCtBrcvM5MRm6zR4uyQ21/lzrSizVjvnKNvnjQcoPpeG1gueJF6Mbl6Cm/7?=
 =?us-ascii?Q?1ktXP8k9hZ0JIwq4lo2YfZ0niSVXro/OLthWDwlZmmKzMCTWhGo27dtWh0nx?=
 =?us-ascii?Q?og=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 69dbafe1-30b4-4bd3-6ae3-08dbc1266a18
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2023 19:58:13.9647 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8MgO5DPOT4coYQRhM4N8ngbvbW5ZWifFxIi0CoF+kZiaaErrKwKmJqn9yXUEgqRKOzBGLjHs5knKJPrwEqmzb92qpWKx2GrOXaHsv+8hvFM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6189
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Leverage ComputeCS read L3 caching
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Sep 28, 2023 at 10:15:39PM -0700, Lucas De Marchi wrote:
> From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> 
> On platforms that support read L3 caching, set the default mocs index in
> CCS RING_CMD_CTL to levarage the read caching in L3.
> 
> Currently PVC and Xe2 platforms have the support.
> 
> Bspec: 72161
> Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_hw_engine.c | 25 ++++++++++++++-----------
>  1 file changed, 14 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index a8681089fb60..49128f640e15 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -316,22 +316,25 @@ static void
>  hw_engine_setup_default_state(struct xe_hw_engine *hwe)
>  {
>  	struct xe_gt *gt = hwe->gt;
> +	struct xe_device *xe = gt_to_xe(gt);
> +	/*
> +	 * RING_CMD_CCTL specifies the default MOCS entry that will be
> +	 * used by the command streamer when executing commands that
> +	 * don't have a way to explicitly specify a MOCS setting.
> +	 * The default should usually reference whichever MOCS entry
> +	 * corresponds to uncached behavior, although use of a WB cached
> +	 * entry is recommended by the spec in certain circumstances on
> +	 * specific platforms.
> +	 * Bspec: 72161
> +	 */
>  	const u8 mocs_write_idx = gt->mocs.uc_index;
> -	/* TODO: missing handling of HAS_L3_CCS_READ platforms */
> -	const u8 mocs_read_idx = gt->mocs.uc_index;
> +	const u8 mocs_read_idx = hwe->class == XE_ENGINE_CLASS_COMPUTE &&
> +				 (GRAPHICS_VER(xe) >= 20 || xe->info.platform == XE_PVC) ?
> +				 gt->mocs.wb_index : gt->mocs.uc_index;
>  	u32 ring_cmd_cctl_val = REG_FIELD_PREP(CMD_CCTL_WRITE_OVERRIDE_MASK, mocs_write_idx) |
>  				REG_FIELD_PREP(CMD_CCTL_READ_OVERRIDE_MASK, mocs_read_idx);
>  	struct xe_rtp_process_ctx ctx = XE_RTP_PROCESS_CTX_INITIALIZER(hwe);
>  	const struct xe_rtp_entry_sr engine_entries[] = {
> -		/*
> -		 * RING_CMD_CCTL specifies the default MOCS entry that will be
> -		 * used by the command streamer when executing commands that
> -		 * don't have a way to explicitly specify a MOCS setting.
> -		 * The default should usually reference whichever MOCS entry
> -		 * corresponds to uncached behavior, although use of a WB cached
> -		 * entry is recommended by the spec in certain circumstances on
> -		 * specific platforms.
> -		 */
>  		{ XE_RTP_NAME("RING_CMD_CCTL_default_MOCS"),
>  		  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, XE_RTP_END_VERSION_UNDEFINED)),
>  		  XE_RTP_ACTIONS(FIELD_SET(RING_CMD_CCTL(0),
> -- 
> 2.40.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
