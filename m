Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5077DCDB465
	for <intel-xe@archiver.kernel.org>; Mon, 16 Oct 2023 15:57:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F2DC10E1FF;
	Mon, 16 Oct 2023 15:57:15 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5316D10E1FF
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Oct 2023 15:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697471833; x=1729007833;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=fNW7ggy00xizbniiU82MaA/WZihypnmEEka3IwjJVzQ=;
 b=WgnewU6ibY2fS/gh/7bUZaMOdXR4ZSkm4X853U0BPYxbX3KDTcVGCGmA
 klGo+TjrbJzp++oCHYMHqaHv9yXyKWsJMSO82CV2f8vZSIkCD7CKdObNM
 EoPJtiF/7qAYyk99pEdXjzzM8ywl6BlGh5v42fV8w3j1v+C48vMP7U91+
 QUEHzi5nKKGfLS1lGcDOjcxXaonPC9XsCfMErf8TRZDQVnxK+uDdsqlww
 NALQ8tsO1V7W7qkeRNgTT5Yu3awgQC/3uvApp5erswCWGq+GLKkDyFu9X
 ixadIvr0rgVpwxmnUXx88WPI1uqIw4Bi/TQhK4o5PkgGLgToeg5YwHnCK A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="4171824"
X-IronPort-AV: E=Sophos;i="6.03,229,1694761200"; 
   d="scan'208";a="4171824"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2023 08:57:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="1087118600"
X-IronPort-AV: E=Sophos;i="6.03,229,1694761200"; d="scan'208";a="1087118600"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Oct 2023 08:57:12 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 16 Oct 2023 08:57:12 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 16 Oct 2023 08:57:11 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 16 Oct 2023 08:57:11 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 16 Oct 2023 08:57:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZCw3gP+qraErfAIFSm4czIlYMk8vvyIxCjL4+rJF14R82qrEV/9e+pwpAeGznT/cHOJR+ADpLUE8ocvMYZcsmwG/lIzo6981OYXgPbXeJMpjm38ixhsa2MoZvgI7AmZyV++JpgSZ+ax68PodXT2mTr9nBhBCoSDGurCwztlFj+HYVsxQYO18QsB3qBTmY2FFx6/FkwnCSwgW+U7Nk7qF18HAA2lDgkplnEBudDpv+dyXbc+tnyZxeO+3FK1JrYQdsvPKlLzcnyP9E/nt8j+UMkAmqvsxEsB1WbIHDllO8sE0eOoEPEm4wLAQu4qUXERc5Vn3nP2xT2cZ0kxkmBjRrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y2XCAm5clU6fWNhqh7KII97RUYEjwqmDhqnL0L4SW5w=;
 b=Lk+wvVK6uBk5t5Lj/i+COoHwsqg+yEdru6ywV9erQHKdvf+2uUEOAf9jpjhpZx4rHtfX1hFbGiYhJLYSxmFT0B7sPBelwUnN9BA2fB0RnNeSxZC9u5xuh2HMkGhYz0UtdSUEso6yJAqWEQJLs9zafEaolDFVO7Xu1DKyeI3R08/9E705855DKyDGhzktTktPHTv889I7HhxuJmu8vRRpICA3v5Td5HDHlZKJgR40do2WJQSa2JR4aYjENqVpAHhIAaCgJN+MC5BxXDstjwkZ3J5QyN7OtVrDmYBh5LzxyiUCXiii1zS0SIqf/YawfVhd2ecDX2iBJTy2fGeNiRrv/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ2PR11MB8515.namprd11.prod.outlook.com (2603:10b6:a03:568::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.35; Mon, 16 Oct
 2023 15:57:09 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::f345:2318:9a82:51b5]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::f345:2318:9a82:51b5%7]) with mapi id 15.20.6886.034; Mon, 16 Oct 2023
 15:57:09 +0000
Date: Mon, 16 Oct 2023 10:57:07 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <jewedgk4umkokvuy5di2wbzyryinvfxvkmxsmnu6z2cwdtnfoi@ohbe75z6cxfj>
References: <20231013220250.927876-8-matthew.d.roper@intel.com>
 <20231013220250.927876-12-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231013220250.927876-12-matthew.d.roper@intel.com>
X-ClientProxiedBy: BYAPR02CA0062.namprd02.prod.outlook.com
 (2603:10b6:a03:54::39) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ2PR11MB8515:EE_
X-MS-Office365-Filtering-Correlation-Id: e18be41c-b179-45c8-db6d-08dbce608dc6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CvYh895d6+7x/PytLVkFtwqk2HHtBYHQbSA5XO0FM3h/+YUz9U5XVT9v8wb1TWtd8jFI4weB6O0aaIbU/N4v3hTYXKj0oXiFusPKZjblE/b+iZx5pLYXJyP4ga804fRR/F2EjIFgF2qEMIOraLpJcEqgvGYnE2hoDuXd7OMdiXyQoT6CCxDQu/JFUlCYnpYiFXjKc/8N4/CYfRktwEoH6ZNhxIQlurvwfskiJgDbcx0a3D82pAkpB72b3384Mwdf6qWk2GoqQ9LnvYczljs5VXCFW/xorawOwHGNW6o3SolX29tcNkN3O7hi9FfC/Jy120HXMpSNTX8kiTgU41//LIswdRoDonXZ6SKeaFeqxh50EJU1n5pZIHSqONaHbk/3tsL/3jdHffu2Gh+ui/gPzGPcE99Huhavv+TOmD94Hrg24r4JEWRj4E2aNWm8BiTSTcSUVoCQw6OBVFmv77RdTeWzBAOhhhhTQSHjB5giIcaFhfomFFWLk5RBo1jgCm0ifMrWlcP2323enBQ74ywyeMDZHWEhiqbefwUILwyGRJbd4R6cHV0+mYWKr+PALk7E
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(396003)(376002)(39860400002)(366004)(346002)(136003)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(83380400001)(6512007)(66946007)(66556008)(66476007)(8676002)(6862004)(4326008)(8936002)(316002)(6636002)(41300700001)(6506007)(9686003)(5660300002)(478600001)(33716001)(2906002)(6486002)(38100700002)(82960400001)(86362001)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?PTEm6HZotXMfXBwvHrGr1bRHV9o4QxCaMUJB17dITOZA5sO9X4TugO0i3i?=
 =?iso-8859-1?Q?vGVDYSp58TRbRBQhQKTDOeaEUk++DjGPpA/T7/FaxL10vt2INHCF6kqO/R?=
 =?iso-8859-1?Q?rlNoQ9tGVLRSybspzIuo1+E9Em74NQOJ2OnbGdwPrGYadL62Hq5g52+aoi?=
 =?iso-8859-1?Q?2URRfGN+mX3SQl0mbUEcwg6TTUSxloXeyPdTAbhau7pM27Gd13Moxt3Q/0?=
 =?iso-8859-1?Q?2Z6YMdSj7oi/P5gDrwsfwRgYX5c5jkuRQV90/z6NdjJ8UfYEw4hKuhSAMD?=
 =?iso-8859-1?Q?/uJhHsUh+M0OqTriD2zFk0KVTDuuwiJbmVyAJGukzgiSbJhNCww8S1eudm?=
 =?iso-8859-1?Q?sNylklSgNL3AmTss3pBU1KfvHhAgD/OzT+xXCBwltoNrpFqe4712oZDV28?=
 =?iso-8859-1?Q?pueeIB8nWdWBUNlj2nJdS70xnxv/CA0STXPHpnlrhiOpK6y1P+riivAPYY?=
 =?iso-8859-1?Q?8YN0PwdXvDG5SXU1bOYi3DG86oUx1OTvziXycVa72n3mGctmtonGkAfIaJ?=
 =?iso-8859-1?Q?KTFiYJjPPguLRAuUYvMtEemeO3520LzE2oRYdCC3LiEwhqMkZA2jxzCO8+?=
 =?iso-8859-1?Q?+J8URnacek5u98DrJT5GSIoQ2hd7SJUmCsdIB2z8l+GHlGutF/dbAFM3KH?=
 =?iso-8859-1?Q?swKTc2ohq+TPEX1XRzFIiPzW7mkfXxTFa81eg1r2ZNEsORRYOZ7Jlcmpuw?=
 =?iso-8859-1?Q?mzbVmKSF75/jc6Ukj2Ut29zfmoevt/26L6lEGnwx1+KQMJJ1BwQgAUCYBA?=
 =?iso-8859-1?Q?GoBqMF4h3PTBlrDLNj2oVcKqYLzfCvaf8W393/WCxtG0vXQXZuB5heWYEb?=
 =?iso-8859-1?Q?qkRk2guieR+N9/oC3gynZKFLSYGq6Ron/BaPg6vhXTJlGjeRll0HtTu1+W?=
 =?iso-8859-1?Q?PiBV8qfRDN4v2XHlme6nFk/JUiLJ0k3P05QSBJUu/sJ5QDlyul222dOs8E?=
 =?iso-8859-1?Q?5JZx31TBaEbmb5tux8DXmTqaZDpTFHI96U6kjZ1ITrHaXPUg5Wz5kJAmy3?=
 =?iso-8859-1?Q?ozfS8XBef2bMxZRW7IFxdknMwAa68U0EOl+ctfrVxKCJsc30MookqFbw0i?=
 =?iso-8859-1?Q?v48k/GFALCycwq7uDV607ivSLJp15om7cNm7u19vxNCRYcp7osnje7yYUI?=
 =?iso-8859-1?Q?o3yPagjm2llgRtV4tAN7yKkWe8xWi9yQOaLWozeIXQG62ZmBGxWsYjoFQY?=
 =?iso-8859-1?Q?TREHtCAFxns0kkGQ7iu462EmwLLA+fctI1kxPXlA3SqxxgxJ/8iqFJOqjC?=
 =?iso-8859-1?Q?1JVV1Tj6d6WAd+tPJYx2pHF9k/kMX02XJgVrZvOL6F1BgBhIM/AuLHQy7+?=
 =?iso-8859-1?Q?CzOEp92ckfj2+Rz7vCTTrmt6xUgAHV42k9ac1gLeypoqGEu8H5Uptnd7eJ?=
 =?iso-8859-1?Q?oQ8dOPoIOyQmJIUrcnT7JViSmyKfQtRubdiLcvmgi8R6KAnQGoeEo6JX/b?=
 =?iso-8859-1?Q?sz4mr0qFeYo7oPZVJUMdMMlah+1zerALL9wRLk61W1rDExdUiXBClUaOK/?=
 =?iso-8859-1?Q?9g5y2KjxwN2IwLWpFQUQ5LL59WgjAOXiSLEwZxQ4jPZw5Kpw2vestG/ZB3?=
 =?iso-8859-1?Q?JFFI+zzFWc52FeFUs1NUshlnFHlxVa5mZvI/B1NffuozZTwkP5S4Bue5Ui?=
 =?iso-8859-1?Q?cmDuNgBJd6u98UPw1r0dmfGwZAKZfrwk1nrTLc2nFKIp+C/iamXIarrQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e18be41c-b179-45c8-db6d-08dbce608dc6
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2023 15:57:09.6293 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Juc49OcNOIosGJ5YekS94gh2pKy/Byb5k+vd07+nWGQmd4PqdORzRTuBnLCnriRoXvNg0bjPDyHceaT+4T9AvgW08auWD0AxM5L/TOV63WE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8515
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 4/6] drm/xe: Extract MI_* instructions to
 their own header
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

On Fri, Oct 13, 2023 at 03:02:55PM -0700, Matt Roper wrote:
>Extracting the common MI_* instructions that can be used with any engine
>to their own header will make it easier as we add additional engine
>instructions in upcoming patches.
>
>Also, since the majority of GPU instructions (both MI and non-MI) have
>a "length" field in bits 7:0 of the instruction header, a common define
>is added for that.  Instruction-specific length fields are still defined
>for special case instructions that have larger/smaller length fields.
>
>v2:
> - Use "instr" instead of "inst" as the short form of "instruction"
>   everywhere.  (Lucas)
> - Include xe_reg_defs.h instead of the i915 compat header.  (Lucas)
>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>---
> .../gpu/drm/xe/instructions/xe_instr_defs.h   | 31 ++++++++++
> .../gpu/drm/xe/instructions/xe_mi_commands.h  | 58 +++++++++++++++++++
> drivers/gpu/drm/xe/regs/xe_gpu_commands.h     | 41 -------------
> drivers/gpu/drm/xe/xe_bb.c                    |  1 +
> drivers/gpu/drm/xe/xe_execlist.c              |  1 +
> drivers/gpu/drm/xe/xe_gt.c                    |  1 +
> drivers/gpu/drm/xe/xe_lrc.c                   |  1 +
> drivers/gpu/drm/xe/xe_migrate.c               |  1 +
> drivers/gpu/drm/xe/xe_ring_ops.c              |  3 +-
> 9 files changed, 96 insertions(+), 42 deletions(-)
> create mode 100644 drivers/gpu/drm/xe/instructions/xe_instr_defs.h
> create mode 100644 drivers/gpu/drm/xe/instructions/xe_mi_commands.h
>
>diff --git a/drivers/gpu/drm/xe/instructions/xe_instr_defs.h b/drivers/gpu/drm/xe/instructions/xe_instr_defs.h
>new file mode 100644
>index 000000000000..a7ec46395786
>--- /dev/null
>+++ b/drivers/gpu/drm/xe/instructions/xe_instr_defs.h
>@@ -0,0 +1,31 @@
>+/* SPDX-License-Identifier: MIT */
>+/*
>+ * Copyright © 2023 Intel Corporation
>+ */
>+
>+#ifndef _XE_INSTR_DEFS_H_
>+#define _XE_INSTR_DEFS_H_
>+
>+#include "regs/xe_reg_defs.h"
>+
>+/*
>+ * The first dword of any GPU instruction is the "instruction header."  Bits
>+ * 31:29 identify the general type of the command and determine how exact
>+ * opcodes and sub-opcodes will be encoded in the remaining bits.
>+ */
>+#define XE_INSTR_CMD_TYPE		GENMASK(31, 29)
>+#define   XE_INSTR_MI			REG_FIELD_PREP(XE_INSTR_CMD_TYPE, 0x0)
>+
>+/*
>+ * Most (but not all) instructions have a "length" field in the instruction
>+ * header.  The value expected is the total number of dwords for the
>+ * instruction, minus two.
>+ *
>+ * Some instructions have length fields longer or shorter than 8 bits, but
>+ * those are rare.  This definition can be used for the common case where
>+ * the length field is from 7:0.
>+ */
>+#define XE_INSTR_LEN_MASK		GENMASK(7, 0)

nit: if this is not to be used outside this header, I guess it could use
double underscore like you did for __MI_INSTR().

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks
Lucas De Marchi
