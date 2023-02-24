Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19573C7EE23
	for <intel-xe@archiver.kernel.org>; Fri, 24 Feb 2023 18:26:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB81910E5DA;
	Fri, 24 Feb 2023 18:26:46 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFE1510E5DA
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Feb 2023 18:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677263203; x=1708799203;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=sWYNyG32+Sz1WjQ8pPWSdRgfVyVAQkbYlEIm0BbxNY4=;
 b=O4VTK78/LiZyE40kfDW6BW+rSx47KrZsZ/rOzQDRxJlc/+wongCofduZ
 GqyZ46v5aaMy7CWxIA+A1Z3N9npr5PSfSFpV5ppA/mlaGccwUBM27iMSz
 gTKfNvjLg4ekHqgg4VAvQXTwfV94DcIRhAfPqOIswvheyQcDyZ9Iii1a4
 qYdCNpBVJrbnkY9XnpF1Uh+w6eHS/tNDxHB55dNH2qly3feBRUBFp4nje
 PbocbB6cmbticNFxGySDxDo3ANIJLL6vCtU98u8WXu+01j8ICuzrvDjtp
 fj7iWQHqv+I46g78tvvrMTmsn743TboIoaFuIt0VLbgakkFQvpXYElTmd g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="398278985"
X-IronPort-AV: E=Sophos;i="5.97,325,1669104000"; d="scan'208";a="398278985"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2023 10:26:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="622803655"
X-IronPort-AV: E=Sophos;i="5.97,325,1669104000"; d="scan'208";a="622803655"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga003.jf.intel.com with ESMTP; 24 Feb 2023 10:26:40 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 24 Feb 2023 10:26:40 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 24 Feb 2023 10:26:40 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.48) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Fri, 24 Feb 2023 10:26:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CvB6dXjr552u/1AjgieoueGzDbMAro/qO2NAh5QVAHgm/P04cY9F6NgALDXjlmiMBlkT0y3/z0q7dO6rXfBcToJfbdzhpdm2QfECZAeglQ6UJEDMmCw1/as2QoFPyS2BooN4oznt60t42MsG4yxSMf+Sej5BH3/rLjuM6ku0K1JBf+r/0al2B9OFpIMailvuo/XwiHaYN6SQ/F8aOJCvCC4W37mk2lLKnlPdyM2kTO3fqjTVNU8japDX0YExb4DywKH6rkkkWe6g6G4ZHFcx5osrpb/hprjhJDiC78bNXHoPVfRKfwkj7FtG3GwypuZwZazZ+bQ2jv5BQJ5253vRRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+enmq04O3Gy3TWqKsSBM3fsDCD/fGKX2hsl6l2Wn5Ds=;
 b=a+kZWHigW3b2NH0jSnaAarwzgQnK1l7nPt2SE7ipNBdtY6fR3kqQJgGheWQAHomCGnvw6ZMwoS8ODrjD5QN2VB6/lErV1AtuXKhHQEiHQcmo+1gq7s9YDfAY5wyfVZnuLTTRDKmZerArcBL8hxqNu/9w9xoyW9Zt9HYO23ixi5GpFvhZt36zuYRRE6RMeTV7CCAIgyT8q5U6ow3GgPaTEBIHjQtOYqWFRLMQJE1msR1K2KqPPf8oZfozXEYv5rvtQ0Ux0UNr4jICKu0NxUfIg2GF0e4Bj5+fLPgd93FBVPQy0Vc4ZG+p7csJ+pQ5yyO8aNcMc1YgQF+WdXHa7A09AQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 MN0PR11MB6255.namprd11.prod.outlook.com (2603:10b6:208:3c4::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.24; Fri, 24 Feb
 2023 18:26:37 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::7333:f4b:7dbb:36b]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::7333:f4b:7dbb:36b%7]) with mapi id 15.20.6134.024; Fri, 24 Feb 2023
 18:26:37 +0000
Date: Fri, 24 Feb 2023 10:26:34 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <Y/kBWqDhVxocaygV@mdroper-desk1.amr.corp.intel.com>
References: <20230217005226.106499-1-lucas.demarchi@intel.com>
 <20230217005226.106499-8-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230217005226.106499-8-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0PR03CA0166.namprd03.prod.outlook.com
 (2603:10b6:a03:338::21) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|MN0PR11MB6255:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ab2607b-b2a6-4558-ef6d-08db1694aa69
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CcxKyiDHd/UUoGgugiA4Bqknbswe1D5W8ecrVcfAuhYFI3TeVWXfXUINewOnUokk5BlF8ViE+1+n2Wmsd5dEu7BbrhBPfsVt90XsoQkghbT0HuNSJRdAJjsnuBO+uobnvuKws+VmC6BrbZesXnk55G99DaQkZ5+/DVQ9chc8Ufb0uyktProhhteXob0GsbISJEZosBxdEGXoG1Cabe1oo+YL4Mb/cSRKT8eNV6y80zJCQ+1cY7RMEjr0F8qe//Z6WajoIwTVqDe7PpK9amma7rA5U1YhpE+JbnkkMlpytrOvIgQyPkSQDiPUEptq/ViqzIu8NFwwANJPJAWjYKVoVe01fklrCMt3uw1gYWYprKwl3VNq+ykbnRMyksKWD22pQbETj2vTofQnNBno5Sk5zL3pmzSkdzzLRnWfp+5A2Pf7+zMleFqKzr72pyrgWJu/dSbG4mzQoHwDy5qyzAjDwvaXBWXb1nZb2htOUBSjpgdGTWVX0ARgdnZY2OPIhS5Ttkve0ZTusHfPWabrPtYgIx1mGfWf/zKKMruzkL4P4Y4agPhnaqlbNxyE1FjXqQJjNxIMFw+z+iLDLu8y6SQ6MW+cYeoj6pY2sGvReWRlsJbGdjH7tZv3+oDnT/xMIwn9CBCEWYgZ9yF6R/Dyr+NQ4w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(366004)(39860400002)(376002)(136003)(346002)(451199018)(83380400001)(66556008)(41300700001)(66946007)(4326008)(66476007)(8676002)(316002)(26005)(186003)(82960400001)(6636002)(6862004)(8936002)(54906003)(5660300002)(38100700002)(6506007)(86362001)(478600001)(6512007)(2906002)(6486002)(107886003)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?c4Wa9SzNNmor04Lc5bm03l/JD3E393B4yoZErdbJMNe7Vxw9mWnuU59UTm?=
 =?iso-8859-1?Q?0CtjHHmTJLkMmRuxErdNZDuRhnYiwx5CVX7KBfzZwmWxJoEaqcm5NL0FVq?=
 =?iso-8859-1?Q?xyM9VHQZYRb0RPv3RqLVGXtLjIH0zS12+jzlLhJ5LhdS8/yqC2UOGGwzxC?=
 =?iso-8859-1?Q?IqsRsBXyyoIq9GCw3QeTH6oLXk+W+ByUpwO/Hripwf89X7JDjGN/dK/xUP?=
 =?iso-8859-1?Q?wBMztDYiGs6ewXYwTym6Shq5KEItxg+UbH4gVyQWC5OvuisPk0GsDo0uk5?=
 =?iso-8859-1?Q?Bjoi1cggJDDbhEy7+ImeSTNiusGDc5VHck/DiZoXjj6j/lYeBaHTTi6wUa?=
 =?iso-8859-1?Q?98yAX/Dljyv3YrRokWFGwogTK7u1xIzOu2CyG7qTMNeVNG+6kHgkMAz0Af?=
 =?iso-8859-1?Q?vn3rKexnGE/jJZjhTWsRBNjkk4peRPQq+/Fr7ZUygPkbmA5agSLofmG1jZ?=
 =?iso-8859-1?Q?os+BRGA1pbypgDV9h5c/zrfFqhdEpVRqG59yt3kJFloF9KMC881k9naK9e?=
 =?iso-8859-1?Q?DmA+wLiviBwH5wcfU14K/kts4eo0n9wBSfbeJIzQ1SX1gEIfls55k0jnZ9?=
 =?iso-8859-1?Q?jkNgpMJbNVmDieQkLk831c/3LbEA/aRQ411V73SAlDsZEZpZuzKl2Kbven?=
 =?iso-8859-1?Q?gyL09GvavasqjROqV9tq4PO+DJE+7dWY2ZtvDJPPMVHhCWQa3ZmqkoG7op?=
 =?iso-8859-1?Q?MrPg2c3hm+bXSwge3dBI+i/xtS0yTROy71h1eIuUFabqJgCtO8BTH66+/t?=
 =?iso-8859-1?Q?c0usGGzJgh8IZd08+AgbELbRKhIxkqC6WVAweJ6AtchEU3nMWql2smXhjt?=
 =?iso-8859-1?Q?fOEQNe2ZGqRkM3vlwoNBANRnO16VoRhVhQ95v79KafXfaIoMINwzj0RuUS?=
 =?iso-8859-1?Q?bHfeHZMgBNH4e+peIe8WFYOQNoJYSyZDD38xhW7Qn55a6q9+6zNPjp2PXM?=
 =?iso-8859-1?Q?MRCx3sdlkWKmDqqPx0mLHnpKA53ceq4tartx4PZNRm/Vf81NAma5rATLci?=
 =?iso-8859-1?Q?RWd7XyoVfyz5NT2MF4SSuJ8jcJ/GGFzn4MKOdbS+uRa40x1u5TgCHUomnZ?=
 =?iso-8859-1?Q?WXafhSUt6u9NaWSt9qMpi3I9/87a9mcmUsifck0P4Pw4W8rXPzK9ttIUy/?=
 =?iso-8859-1?Q?6yqLDKELrGvP38qwCj743waWraxxbZfSBqCz+Z7auxZGFwhN9Q63l+67Eq?=
 =?iso-8859-1?Q?+KfX0ddLTFW0TiOsFctSRAB1Rw54ZvXSsvWuH9aqiFACBLztSNlJ9ydnId?=
 =?iso-8859-1?Q?10TKR6iiPqGfz+i0P0SXbVpFN7kwn3wO/axrjIN5d7xlpIwlmKHO47NR8r?=
 =?iso-8859-1?Q?yncdcU0h8DCSSyLtkkH35Syi8xfX2Sx+2w+784+Tkx3f2ASi1SmaDfzdRz?=
 =?iso-8859-1?Q?1b3nNmwqGcJCbA40TVEmJXWvOmS9eaPfu013cT2WBgT2Qc9t0b7h36wbE3?=
 =?iso-8859-1?Q?8voL/1ZbuJrzm8P7ePUDupkV9k09u8mpTT/SNQplGjosxyaxENEnW0JKz2?=
 =?iso-8859-1?Q?49nDLwoaArlTX+1BIZDmlCMMzTa5ReWGKVIbVPJkv+AK62m1JUevZudm5S?=
 =?iso-8859-1?Q?OxLT2Mkz5eyATybLthEAkEyhlAuJb9jou35mOi5tAJn3B4sw2Cqhc7Qq6i?=
 =?iso-8859-1?Q?aZsgDayrdmz0QQQ+8xe9as7oLMEY2J0jmmSbxlwfEK1s/ill8fQFVaVQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ab2607b-b2a6-4558-ef6d-08db1694aa69
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2023 18:26:37.6066 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XYF3TpojRu/TQMP1h+QWB5B+tTBdNaJYnfg+jxq4F803bGKla8vklz9+cMCySPnJL9F41vlmSJwxUZaf6mnBBQuvkO/nzOhMdx7E4K4+DMk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6255
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 07/11] drm/xe: Remove dependency on
 intel_gpu_commands.h
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
Cc: intel-xe@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Feb 16, 2023 at 04:52:22PM -0800, Lucas De Marchi wrote:
> Copy the macros used by xe in intel_gpu_commands.h to
> regs/xe_gpu_commands.h.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_gpu_commands.h | 96 +++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_bb.c                |  3 +-
>  drivers/gpu/drm/xe/xe_device.h            |  3 +-
>  drivers/gpu/drm/xe/xe_execlist.c          |  2 +-
>  drivers/gpu/drm/xe/xe_lrc.c               |  2 +-
>  drivers/gpu/drm/xe/xe_migrate.c           |  3 +-
>  drivers/gpu/drm/xe/xe_ring_ops.c          |  2 +-
>  7 files changed, 102 insertions(+), 9 deletions(-)
>  create mode 100644 drivers/gpu/drm/xe/regs/xe_gpu_commands.h
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gpu_commands.h b/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
> new file mode 100644
> index 000000000000..bf6dc1c8563d
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
> @@ -0,0 +1,96 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#ifndef _XE_GPU_COMMANDS_H_
> +#define _XE_GPU_COMMANDS_H_
> +
> +#define INSTR_CLIENT_SHIFT      29
> +#define   INSTR_MI_CLIENT       0x0
> +#define __INSTR(client) ((client) << INSTR_CLIENT_SHIFT)
> +
> +#define MI_INSTR(opcode, flags) \
> +	(__INSTR(INSTR_MI_CLIENT) | (opcode) << 23 | (flags))
> +
> +#define MI_NOOP			MI_INSTR(0, 0)
> +#define MI_USER_INTERRUPT	MI_INSTR(0x02, 0)
> +
> +#define MI_ARB_ON_OFF		MI_INSTR(0x08, 0)
> +#define   MI_ARB_ENABLE			(1<<0)
> +#define   MI_ARB_DISABLE		(0<<0)
> +
> +#define MI_BATCH_BUFFER_END	MI_INSTR(0x0a, 0)
> +#define MI_STORE_DATA_IMM	MI_INSTR(0x20, 0)
> +
> +#define MI_LOAD_REGISTER_IMM(x)	MI_INSTR(0x22, 2*(x)-1)
> +#define   MI_LRI_LRM_CS_MMIO		REG_BIT(19)
> +#define   MI_LRI_MMIO_REMAP_EN		REG_BIT(17)
> +#define   MI_LRI_FORCE_POSTED		(1<<12)
> +
> +#define MI_FLUSH_DW		MI_INSTR(0x26, 1)
> +#define   MI_FLUSH_DW_STORE_INDEX	(1<<21)
> +#define   MI_INVALIDATE_TLB		(1<<18)
> +#define   MI_FLUSH_DW_CCS		(1<<16)
> +#define   MI_FLUSH_DW_OP_STOREDW	(1<<14)
> +#define   MI_FLUSH_DW_USE_GTT		(1<<2)
> +
> +#define MI_BATCH_BUFFER_START_GEN8	MI_INSTR(0x31, 1)
> +
> +#define XY_CTRL_SURF_COPY_BLT		((2 << 29) | (0x48 << 22) | 3)
> +#define   SRC_ACCESS_TYPE_SHIFT		21
> +#define   DST_ACCESS_TYPE_SHIFT		20
> +#define   CCS_SIZE_MASK			0x3FF
> +#define   CCS_SIZE_SHIFT		8
> +#define   XY_CTRL_SURF_MOCS_MASK	GENMASK(31, 25)
> +#define   NUM_CCS_BYTES_PER_BLOCK	256
> +#define   NUM_BYTES_PER_CCS_BYTE	256
> +#define   NUM_CCS_BLKS_PER_XFER		1024
> +
> +#define XY_FAST_COLOR_BLT_CMD		(2 << 29 | 0x44 << 22)
> +#define   XY_FAST_COLOR_BLT_DEPTH_32	(2 << 19)
> +#define   XY_FAST_COLOR_BLT_DW		16
> +#define   XY_FAST_COLOR_BLT_MOCS_MASK	GENMASK(27, 21)
> +#define   XY_FAST_COLOR_BLT_MEM_TYPE_SHIFT 31
> +
> +#define GEN9_XY_FAST_COPY_BLT_CMD	(2 << 29 | 0x42 << 22)
> +#define   BLT_DEPTH_32			(3<<24)
> +
> +#define GFX_OP_PIPE_CONTROL(len)	((0x3<<29)|(0x3<<27)|(0x2<<24)|((len)-2))
> +#define   PIPE_CONTROL_TILE_CACHE_FLUSH			(1<<28)
> +#define   PIPE_CONTROL_AMFS_FLUSH			(1<<25)
> +#define   PIPE_CONTROL_GLOBAL_GTT_IVB			(1<<24)
> +#define   PIPE_CONTROL_CS_STALL				(1<<20)
> +#define   PIPE_CONTROL_GLOBAL_SNAPSHOT_RESET		(1<<19)
> +#define   PIPE_CONTROL_PSD_SYNC				(1<<17)
> +#define   PIPE_CONTROL_QW_WRITE				(1<<14)
> +#define   PIPE_CONTROL_DEPTH_STALL			(1<<13)
> +#define   PIPE_CONTROL_RENDER_TARGET_CACHE_FLUSH	(1<<12)
> +#define   PIPE_CONTROL_TEXTURE_CACHE_INVALIDATE		(1<<10)
> +#define   PIPE_CONTROL_INDIRECT_STATE_DISABLE		(1<<9)
> +#define   PIPE_CONTROL_FLUSH_ENABLE			(1<<7)
> +#define   PIPE_CONTROL_DC_FLUSH_ENABLE			(1<<5)
> +#define   PIPE_CONTROL_VF_CACHE_INVALIDATE		(1<<4)
> +#define   PIPE_CONTROL_STALL_AT_SCOREBOARD		(1<<1)
> +#define   PIPE_CONTROL_DEPTH_CACHE_FLUSH		(1<<0)
> +
> +#define PIPE_CONTROL_3D_ENGINE_FLAGS (\
> +		PIPE_CONTROL_RENDER_TARGET_CACHE_FLUSH | \
> +		PIPE_CONTROL_DEPTH_CACHE_FLUSH | \
> +		PIPE_CONTROL_TILE_CACHE_FLUSH | \
> +		PIPE_CONTROL_DEPTH_STALL | \
> +		PIPE_CONTROL_STALL_AT_SCOREBOARD | \
> +		PIPE_CONTROL_PSD_SYNC | \
> +		PIPE_CONTROL_AMFS_FLUSH | \
> +		PIPE_CONTROL_VF_CACHE_INVALIDATE | \
> +		PIPE_CONTROL_GLOBAL_SNAPSHOT_RESET)
> +#define PIPE_CONTROL_3D_ARCH_FLAGS ( \
> +		PIPE_CONTROL_3D_ENGINE_FLAGS | \
> +		PIPE_CONTROL_INDIRECT_STATE_DISABLE | \
> +		PIPE_CONTROL_FLUSH_ENABLE | \
> +		PIPE_CONTROL_TEXTURE_CACHE_INVALIDATE | \
> +		PIPE_CONTROL_DC_FLUSH_ENABLE)

These two flag collections are also defined in
drivers/gpu/drm/xe/xe_ring_ops.c right now.  Should we either drop them
here or drop them there?


Matt

> +
> +#define MI_ARB_CHECK            MI_INSTR(0x05, 0)
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_bb.c b/drivers/gpu/drm/xe/xe_bb.c
> index a25079d4e710..742d12023160 100644
> --- a/drivers/gpu/drm/xe/xe_bb.c
> +++ b/drivers/gpu/drm/xe/xe_bb.c
> @@ -4,6 +4,7 @@
>   */
>  #include "xe_bb.h"
>  
> +#include "regs/xe_gpu_commands.h"
>  #include "xe_device.h"
>  #include "xe_engine_types.h"
>  #include "xe_hw_fence.h"
> @@ -11,8 +12,6 @@
>  #include "xe_sched_job.h"
>  #include "xe_vm_types.h"
>  
> -#include "gt/intel_gpu_commands.h"
> -
>  struct xe_bb *xe_bb_new(struct xe_gt *gt, u32 dwords, bool usm)
>  {
>  	struct xe_bb *bb = kmalloc(sizeof(*bb), GFP_KERNEL);
> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> index 88d55671b068..ee10b6c11e9f 100644
> --- a/drivers/gpu/drm/xe/xe_device.h
> +++ b/drivers/gpu/drm/xe/xe_device.h
> @@ -11,12 +11,11 @@ struct xe_file;
>  
>  #include <drm/drm_util.h>
>  
> +#include "regs/xe_gpu_commands.h"
>  #include "xe_device_types.h"
>  #include "xe_macros.h"
>  #include "xe_force_wake.h"
>  
> -#include "gt/intel_gpu_commands.h"
> -
>  static inline struct xe_device *to_xe_device(const struct drm_device *dev)
>  {
>  	return container_of(dev, struct xe_device, drm);
> diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
> index ea551dc922cc..c3c52bdc70b1 100644
> --- a/drivers/gpu/drm/xe/xe_execlist.c
> +++ b/drivers/gpu/drm/xe/xe_execlist.c
> @@ -8,6 +8,7 @@
>  
>  #include "regs/xe_engine_regs.h"
>  #include "regs/xe_lrc_regs.h"
> +#include "regs/xe_gpu_commands.h"
>  #include "regs/xe_gt_regs.h"
>  #include "xe_bo.h"
>  #include "xe_device.h"
> @@ -21,7 +22,6 @@
>  #include "xe_ring_ops_types.h"
>  #include "xe_sched_job.h"
>  
> -#include "gt/intel_gpu_commands.h"
>  #include "i915_reg.h"
>  
>  #define XE_EXECLIST_HANG_LIMIT 1
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index af6fe47a0495..c1df76c2cf78 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -6,6 +6,7 @@
>  
>  #include "regs/xe_engine_regs.h"
>  #include "regs/xe_lrc_regs.h"
> +#include "regs/xe_gpu_commands.h"
>  #include "regs/xe_gt_regs.h"
>  #include "xe_bo.h"
>  #include "xe_device.h"
> @@ -15,7 +16,6 @@
>  #include "xe_map.h"
>  #include "xe_vm.h"
>  
> -#include "gt/intel_gpu_commands.h"
>  #include "i915_reg.h"
>  
>  #define GEN8_CTX_VALID				(1 << 0)
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index 3d2f8d04bc3a..3c2ed4d9f63d 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -10,6 +10,7 @@
>  #include <drm/ttm/ttm_tt.h>
>  #include <drm/xe_drm.h>
>  
> +#include "regs/xe_gpu_commands.h"
>  #include "xe_bb.h"
>  #include "xe_bo.h"
>  #include "xe_engine.h"
> @@ -26,8 +27,6 @@
>  #include "xe_trace.h"
>  #include "xe_vm.h"
>  
> -#include "gt/intel_gpu_commands.h"
> -
>  /**
>   * struct xe_migrate - migrate context.
>   */
> diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
> index 0a1e32ab9758..104f96658e1f 100644
> --- a/drivers/gpu/drm/xe/xe_ring_ops.c
> +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
> @@ -5,6 +5,7 @@
>  #include "xe_ring_ops.h"
>  
>  #include "regs/xe_lrc_regs.h"
> +#include "regs/xe_gpu_commands.h"
>  #include "regs/xe_gt_regs.h"
>  #include "xe_engine_types.h"
>  #include "xe_gt.h"
> @@ -13,7 +14,6 @@
>  #include "xe_sched_job.h"
>  #include "xe_vm_types.h"
>  
> -#include "gt/intel_gpu_commands.h"
>  #include "i915_reg.h"
>  
>  static u32 preparser_disable(bool state)
> -- 
> 2.39.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
