Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 160E1C76196
	for <intel-xe@archiver.kernel.org>; Fri, 31 Mar 2023 22:20:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A77010F323;
	Fri, 31 Mar 2023 22:20:48 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0AD910F323
 for <intel-xe@lists.freedesktop.org>; Fri, 31 Mar 2023 22:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680301218; x=1711837218;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=AcIGHlQWzWKzxDVcpulhpzJghjDFEp+xeWUE/6p4a6w=;
 b=Oj0+Fqz8Wxh74TE+EGhd4wkTXTZoB6rH8TPiJtW5CL8Eu9adk0pfjP0k
 ryDyhsSDkof40t8gTlwfeXDziqd/5tq2hzagABvQgOKGw5QcqlUcqO5lS
 k9CcNVjqt7T+/lBHwi63d2353khWnFsRcNT/eibJz4RXBnWim5sP3Ett0
 gxgGpw+HFxqfPm+0/rVbSZuMJdrO1VDQBTJ3NU/7PnZ46HPvqoQzlKn/Z
 SWRVxfNaANolebfh+oydfPBPNrT+zTgKrYTiNZ717aaanrMMfcS0BlegF
 Q8ntpPUAGW+o0YjKpT49++LDDKTx5opefnTOQusULUnyht2nidhwMMRO/ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="321223165"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; d="scan'208";a="321223165"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2023 15:20:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="931338604"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; d="scan'208";a="931338604"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga006.fm.intel.com with ESMTP; 31 Mar 2023 15:20:18 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 31 Mar 2023 15:20:17 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Fri, 31 Mar 2023 15:20:17 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.103)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Fri, 31 Mar 2023 15:20:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CRsILAf6klF3nvcHzpIkLU8ZFzkpOURw5Inwlb8MIXLS0cudIDs9xC4GxJWqKuqpNUoVtSBsJ4Gl3FjcAvJ3N4Ji9JwnQtcxt+f8YZpDBYSAOVo8x9gsHI7FBh86xvgk0fXfMYjPzAnBSTpPMaLTxoDFCkncP4i8x1tRR+ndKaPyRAypExsPFDUIiS/qhOV+gOD5I/FEjq7ra1KxY2DGDokdwzwinPE2TR/fpamdlVJ/1FCxqS7DYMbZ+lULuDAd0ki1iv558nhwSIF4GZ8Au5M+/lgKAudj9q+Fs7sbrJEz5iBKb2X6ahMM3uLN2rdPGvZVmiAl+Y+7SNQshX+xJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UzVDn07G8d0z5N5/BE9mcVL8/wGEAdW3f9wKDUI/LgQ=;
 b=AZhnMk+nVT7dKxCwxF/j++Xw8cWj/eZb0uUNFY4xtL3sMVjJEh19z9UZgSlfpYGoABZZWLDkHFdEYkelNeNOdMQ3EyJQVjDncYvFeTJoqanGVNiVe/W8kvBzjskl9983VbLDTu3Yo1ygJJ1qWs0t2orMgw9GCyhrhiju0MtW6kS+/rIhBjy3yP5hcQKqvS7Abqkb7K2U4R2JzfNWoqBIDoyT6J27I0FfrxY0KoxKRl59JOhimh+a+uwy8J7pCMsXSQ90K4Nlsp2sN1WXBnrvLuDAZG3VCQbETyhNxlsVrLkzeknltLPVClU/agGqAFuQqSfAllKdyqHDyc0JpEHwFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ0PR11MB5214.namprd11.prod.outlook.com (2603:10b6:a03:2df::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.22; Fri, 31 Mar
 2023 22:20:14 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745%5]) with mapi id 15.20.6254.022; Fri, 31 Mar 2023
 22:20:14 +0000
Date: Fri, 31 Mar 2023 15:20:12 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <20230331222012.lm25bzafbq3z42nn@ldmartin-desk2.lan>
References: <20230330182405.43993-1-matthew.d.roper@intel.com>
 <20230330182405.43993-5-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230330182405.43993-5-matthew.d.roper@intel.com>
X-ClientProxiedBy: BY5PR13CA0002.namprd13.prod.outlook.com
 (2603:10b6:a03:180::15) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ0PR11MB5214:EE_
X-MS-Office365-Filtering-Correlation-Id: e5a3db69-a5fa-486a-5d52-08db323619bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aQkp0cmAV4frERdMYckKl7z+gn6dkILvv3emQEM/1+ISZR7lVlp9s28Gn5L/Z4wxgYwYv6pX5i/mhNZizG9h3/6s2H7EfrFUwk+cGjXNuOGrOoBSgdlidn/3Cp86ZZfMDACatrqIgcj2nOxrtfe/ZM9nUUiS3l8ojkAVp4dfhkpI+cPydqL+tdRz990MZsTXaDuajSiPDgAGHuMm/CH9XtHs+1bMKbmhztNnMOTekFXSsZMQTMDQ4lhOS1Kcayoc17h3lKnoc32UuTAQFS97yyryWod1XwnCYKa06eArSi6P2/TlnW7x2Xm/1aqz/HOrABna4bRTTZ7ZAWtfYJyecP7k6PIiwAxr4liubXDQ9soNSOyuV9hvo0AdfEgfItlaShR3iGCNWrz+DZKwiT1j8Wy+jUpxkXGS3hcYJG3pgt0aeTtdsTlUavAhpJ9Oj2dO2o9XY9npHFE8u6ngBpuDc3tel1ix7rr0g9GCBeIPlmpvrbXEorUZwx8aGkPK5IqNfr0IlrAgeV0ByWV9/XskIYI3oEYc+7t/1UXySVL4D3/QDNmwE0RGs+s8MoAoZKZk
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(376002)(396003)(346002)(136003)(39860400002)(451199021)(36756003)(86362001)(6486002)(4326008)(316002)(30864003)(186003)(478600001)(83380400001)(9686003)(6636002)(6512007)(6506007)(26005)(1076003)(2906002)(5660300002)(6862004)(8936002)(8676002)(82960400001)(66476007)(41300700001)(66946007)(66556008)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uSMkD1uMdm8vTnr18kAx0blEyFiTZmqIXI1b3E8BUltse6qTZT1lq5uir5/U?=
 =?us-ascii?Q?f8d3ao/V7RPuWgdEHdTZis9DZVZp4L4sKK+J5hBRIkkW7+fdXNsKLHJi7d1E?=
 =?us-ascii?Q?LzjtgGxA24HvHuQGLoVj9f6ju/bCbUnGczCx6fk9PGCh9admZnlFVIEvDVVg?=
 =?us-ascii?Q?SAufbOypBv857kDLLSkvTNMwAtMwYG+OkbkxDsHZ8fGct7fFiELZqcroR/bn?=
 =?us-ascii?Q?ngz2F0n2yhseu66XQZny1rduUXtv+FBRMBV6lNaEjV5jRNNijLeYOZrpqygR?=
 =?us-ascii?Q?FdsCf3dwh1vPJhltCKdoKv/dCZPfAJSNJMLX7pxe90xM7YQM8mCiuPQpiavn?=
 =?us-ascii?Q?qOFNYhQQ7VSRUFMf1NlB9E6grcZ7q3ONQwF+2Z6jeNn3KmFO/OnHmqlyW3Cy?=
 =?us-ascii?Q?tkmfcDvtaYOKWaiIuvP1a08bbxKcJGJ4MQ/WA88kVmV/6BLg2BLFj9cYpnf7?=
 =?us-ascii?Q?df3cqhUmdlNpwgihFV9GMPMF+ohVzRAdrK1BZEnxrZSpBzd+3/g1VUO/MMns?=
 =?us-ascii?Q?priLYzlYOr+3ue44TrOm8SSjPSXW4MostU4bJh/ldMKcWVW6KlYbZW7ZBY0Z?=
 =?us-ascii?Q?wdhUeg3MwpUwtN2SRTFi8kytkO9ost0gWztn2B6pgRywVhDRaXC+wCxYM9YF?=
 =?us-ascii?Q?8s2XirqsUHEHFaq+j/2GZpIYQDYOohCW7wGlH8EMvcv4Uy57i0ODJTxwlzU1?=
 =?us-ascii?Q?BWglLvgUtguN+8M3jMpiN6OMaoNndkwdaAyg0xBTCdcNJtS7ZubUUrn8OcMA?=
 =?us-ascii?Q?0wnHeeqMDaV4SI44S73f18snIjky33ENnOKhwgZTQSwteFRxS/2PeOTfyasy?=
 =?us-ascii?Q?jIcCE5ioGoZG1O+hmXUucqBEb8a0Q/ijlcK4nzGJrQm5dDtDPagx/Tqnw48/?=
 =?us-ascii?Q?XKS/6+LSBCquYkf0bQvkInqoSO5SzLqJvRUKXS+9KuslamL2tm6t2+fiUV/K?=
 =?us-ascii?Q?R6P+it4k//SpdZa0NmNwI2Fu09HdDM5qr2JE2LXRxrhQjWAQN9adFBc1h1Vl?=
 =?us-ascii?Q?Cn8gzcANvn7o0JSKuhkj26XRU+l9ReoJQ4GSBLcIvI7zAZLOJAQv2GZDkwxW?=
 =?us-ascii?Q?x0Rw1HvaXllWbI/9oJsExNFLOrgK+BpK+fTNbySefTza6tpmhukIaEdBdKbC?=
 =?us-ascii?Q?mQX2Sg32UcpzNWIHik7ntyPd7e3jmkj9Q7I6XS5qoJZZXnDqcXzcW8u6Qlou?=
 =?us-ascii?Q?UOXrqynsDrsHCfr8pKfPoU/w5RfzMApYfFU0fct7Wqt1CvF39lkKtFR9dVkQ?=
 =?us-ascii?Q?jZ2xtrLbWnJdKnITUPZAFQLWTzkevVDMI1t3Pp/lFYGoosut2H3WYn/x6nmV?=
 =?us-ascii?Q?+r9lVCXFNPljM66QaV1f8a6i38XqjGbY+9oz1XAVSKe2evNdHo8wBGRicNSI?=
 =?us-ascii?Q?BcVwuAMe/DluuEscWolbT9iTmXPgyQFRRC4xCGztnbaImTqIGbznwDGXWZro?=
 =?us-ascii?Q?GG/MhweoIdFSGoKGdvduNiqC64CCc+K3X8bWvqMM924CisWCWOTYjLIskApa?=
 =?us-ascii?Q?dDIl/POwQ+CQE2EaGhWY7Q4iCjqSS7fIk+krQ6BKXmXM1qPoQnRNgHYUe5sy?=
 =?us-ascii?Q?/yR6bfMb8GBEK1f4cuSNN26YRanK7E+MB/Czt4a0hZsSOKjMtvTEH7FRt9NU?=
 =?us-ascii?Q?uA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e5a3db69-a5fa-486a-5d52-08db323619bd
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2023 22:20:14.8117 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cFp8oJU+aviAnul9I/RRrsi+WbHqra+oPgvxviJcqtAWl7ohHAek/y/x+wKUdifzc4B8OF7lO2NnTZqiZ8rkbIPIzk73W313+Jcvd7hkucI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5214
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 4/8] drm/xe/irq: Drop unnecessary GEN11_ and
 GEN12_ register prefixes
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

On Thu, Mar 30, 2023 at 11:24:01AM -0700, Matt Roper wrote:
>Any interrupt registers that were introduced by platforms i915
>considered to be "gen11" or "gen12" are present on all platforms that
>the Xe driver supports; drop the unnecessary prefixes.
>
>While working in the area, also convert a few open-coded bit
>manipulations over to REG_BIT and REG_FIELD_GET notation.
>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>---
> drivers/gpu/drm/xe/regs/xe_gt_regs.h |  42 +++++------
> drivers/gpu/drm/xe/regs/xe_regs.h    |  12 +--

I was thinking more on an approach of cleaning up the entire driver:
get all the defines from regs/* that have the GEN*_ or _GEN* suffix and
drop the suffix.

I wrote it some time ago, but was having some issues with display/
failing to compile because of that (some of the ifdef's inside i915 use
our register defines).

Since this is done for irq, with more contained changes, I won't oppose
though. It's going in the right direction.

Checked with --color-words and it does what it says


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>


thanks
Lucas De Marchi

> drivers/gpu/drm/xe/xe_guc.c          |   6 +-
> drivers/gpu/drm/xe/xe_irq.c          | 109 +++++++++++++--------------
> 4 files changed, 84 insertions(+), 85 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>index f45251df5715..a8a37e6a45a3 100644
>--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>@@ -348,34 +348,34 @@
> #define GFX_FLSH_CNTL_GEN6			_MMIO(0x101008)
> #define   GFX_FLSH_CNTL_EN			(1 << 0)
>
>-#define GEN11_GT_INTR_DW(x)			_MMIO(0x190018 + ((x) * 4))
>+#define GT_INTR_DW(x)				_MMIO(0x190018 + ((x) * 4))
>
>-#define GEN11_GUC_SG_INTR_ENABLE		_MMIO(0x190038)
>+#define GUC_SG_INTR_ENABLE			_MMIO(0x190038)
> #define   ENGINE1_MASK				REG_GENMASK(31, 16)
> #define   ENGINE0_MASK				REG_GENMASK(15, 0)
>
>-#define GEN11_GPM_WGBOXPERF_INTR_ENABLE		_MMIO(0x19003c)
>+#define GPM_WGBOXPERF_INTR_ENABLE		_MMIO(0x19003c)
>
>-#define GEN11_INTR_IDENTITY_REG(x)		_MMIO(0x190060 + ((x) * 4))
>-#define   GEN11_INTR_DATA_VALID			(1 << 31)
>-#define   GEN11_INTR_ENGINE_INSTANCE(x)		(((x) & GENMASK(25, 20)) >> 20)
>-#define   GEN11_INTR_ENGINE_CLASS(x)		(((x) & GENMASK(18, 16)) >> 16)
>-#define   GEN11_INTR_ENGINE_INTR(x)		((x) & 0xffff)
>+#define INTR_IDENTITY_REG(x)			_MMIO(0x190060 + ((x) * 4))
>+#define   INTR_DATA_VALID			REG_BIT(31)
>+#define   INTR_ENGINE_INSTANCE(x)		REG_FIELD_GET(GENMASK(25, 20), x)
>+#define   INTR_ENGINE_CLASS(x)			REG_FIELD_GET(GENMASK(18, 16), x)
>+#define   INTR_ENGINE_INTR(x)			REG_FIELD_GET(GENMASK(15, 0), x)
> #define   OTHER_GUC_INSTANCE			0
>
>-#define GEN11_RENDER_COPY_INTR_ENABLE		_MMIO(0x190030)
>-#define GEN11_VCS_VECS_INTR_ENABLE		_MMIO(0x190034)
>-#define GEN12_CCS_RSVD_INTR_ENABLE		_MMIO(0x190048)
>-#define GEN11_IIR_REG_SELECTOR(x)		_MMIO(0x190070 + ((x) * 4))
>-#define GEN11_RCS0_RSVD_INTR_MASK		_MMIO(0x190090)
>-#define GEN11_BCS_RSVD_INTR_MASK		_MMIO(0x1900a0)
>-#define GEN11_VCS0_VCS1_INTR_MASK		_MMIO(0x1900a8)
>-#define GEN11_VCS2_VCS3_INTR_MASK		_MMIO(0x1900ac)
>-#define GEN11_VECS0_VECS1_INTR_MASK		_MMIO(0x1900d0)
>-#define GEN11_GUC_SG_INTR_MASK			_MMIO(0x1900e8)
>-#define GEN11_GPM_WGBOXPERF_INTR_MASK		_MMIO(0x1900ec)
>-#define GEN12_CCS0_CCS1_INTR_MASK		_MMIO(0x190100)
>-#define GEN12_CCS2_CCS3_INTR_MASK		_MMIO(0x190104)
>+#define RENDER_COPY_INTR_ENABLE			_MMIO(0x190030)
>+#define VCS_VECS_INTR_ENABLE			_MMIO(0x190034)
>+#define CCS_RSVD_INTR_ENABLE			_MMIO(0x190048)
>+#define IIR_REG_SELECTOR(x)			_MMIO(0x190070 + ((x) * 4))
>+#define RCS0_RSVD_INTR_MASK			_MMIO(0x190090)
>+#define BCS_RSVD_INTR_MASK			_MMIO(0x1900a0)
>+#define VCS0_VCS1_INTR_MASK			_MMIO(0x1900a8)
>+#define VCS2_VCS3_INTR_MASK			_MMIO(0x1900ac)
>+#define VECS0_VECS1_INTR_MASK			_MMIO(0x1900d0)
>+#define GUC_SG_INTR_MASK			_MMIO(0x1900e8)
>+#define GPM_WGBOXPERF_INTR_MASK			_MMIO(0x1900ec)
>+#define CCS0_CCS1_INTR_MASK			_MMIO(0x190100)
>+#define CCS2_CCS3_INTR_MASK			_MMIO(0x190104)
> #define XEHPC_BCS1_BCS2_INTR_MASK		_MMIO(0x190110)
> #define XEHPC_BCS3_BCS4_INTR_MASK		_MMIO(0x190114)
> #define XEHPC_BCS5_BCS6_INTR_MASK		_MMIO(0x190118)
>diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h b/drivers/gpu/drm/xe/regs/xe_regs.h
>index ffe5d726e196..34f12eacd432 100644
>--- a/drivers/gpu/drm/xe/regs/xe_regs.h
>+++ b/drivers/gpu/drm/xe/regs/xe_regs.h
>@@ -78,13 +78,13 @@
>
> #define PCU_IRQ_REGS				0x444e0
> #define GU_MISC_IRQ_REGS			0x444f0
>-#define   GEN11_GU_MISC_GSE			(1 << 27)
>+#define   GU_MISC_GSE				REG_BIT(27)
>
>-#define GEN11_GFX_MSTR_IRQ			_MMIO(0x190010)
>-#define   GEN11_MASTER_IRQ			(1 << 31)
>-#define   GEN11_GU_MISC_IRQ			(1 << 29)
>-#define   GEN11_DISPLAY_IRQ			(1 << 16)
>-#define   GEN11_GT_DW_IRQ(x)			(1 << (x))
>+#define GFX_MSTR_IRQ				_MMIO(0x190010)
>+#define   MASTER_IRQ				REG_BIT(31)
>+#define   GU_MISC_IRQ				REG_BIT(29)
>+#define   DISPLAY_IRQ				REG_BIT(16)
>+#define   GT_DW_IRQ(x)				REG_BIT(x)
>
> #define DG1_MSTR_TILE_INTR			_MMIO(0x190008)
> #define   DG1_MSTR_IRQ				REG_BIT(31)
>diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>index 58b9841616e4..ee71b969bcbf 100644
>--- a/drivers/gpu/drm/xe/xe_guc.c
>+++ b/drivers/gpu/drm/xe/xe_guc.c
>@@ -561,12 +561,12 @@ static void guc_enable_irq(struct xe_guc *guc)
> 		REG_FIELD_PREP(ENGINE0_MASK, GUC_INTR_GUC2HOST)  :
> 		REG_FIELD_PREP(ENGINE1_MASK, GUC_INTR_GUC2HOST);
>
>-	xe_mmio_write32(gt, GEN11_GUC_SG_INTR_ENABLE.reg,
>+	xe_mmio_write32(gt, GUC_SG_INTR_ENABLE.reg,
> 			REG_FIELD_PREP(ENGINE1_MASK, GUC_INTR_GUC2HOST));
> 	if (xe_gt_is_media_type(gt))
>-		xe_mmio_rmw32(gt, GEN11_GUC_SG_INTR_MASK.reg, events, 0);
>+		xe_mmio_rmw32(gt, GUC_SG_INTR_MASK.reg, events, 0);
> 	else
>-		xe_mmio_write32(gt, GEN11_GUC_SG_INTR_MASK.reg, ~events);
>+		xe_mmio_write32(gt, GUC_SG_INTR_MASK.reg, ~events);
> }
>
> int xe_guc_enable_communication(struct xe_guc *guc)
>diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
>index bf097ba6a10b..b1b94ba43b3f 100644
>--- a/drivers/gpu/drm/xe/xe_irq.c
>+++ b/drivers/gpu/drm/xe/xe_irq.c
>@@ -72,7 +72,7 @@ static void mask_and_disable(struct xe_gt *gt, u32 irqregs)
>
> static u32 gen11_intr_disable(struct xe_gt *gt)
> {
>-	xe_mmio_write32(gt, GEN11_GFX_MSTR_IRQ.reg, 0);
>+	xe_mmio_write32(gt, GFX_MSTR_IRQ.reg, 0);
>
> 	/*
> 	 * Now with master disabled, get a sample of level indications
>@@ -80,7 +80,7 @@ static u32 gen11_intr_disable(struct xe_gt *gt)
> 	 * New indications can and will light up during processing,
> 	 * and will generate new interrupt after enabling master.
> 	 */
>-	return xe_mmio_read32(gt, GEN11_GFX_MSTR_IRQ.reg);
>+	return xe_mmio_read32(gt, GFX_MSTR_IRQ.reg);
> }
>
> static u32
>@@ -88,7 +88,7 @@ gen11_gu_misc_irq_ack(struct xe_gt *gt, const u32 master_ctl)
> {
> 	u32 iir;
>
>-	if (!(master_ctl & GEN11_GU_MISC_IRQ))
>+	if (!(master_ctl & GU_MISC_IRQ))
> 		return 0;
>
> 	iir = xe_mmio_read32(gt, IIR(GU_MISC_IRQ_REGS).reg);
>@@ -100,9 +100,9 @@ gen11_gu_misc_irq_ack(struct xe_gt *gt, const u32 master_ctl)
>
> static inline void gen11_intr_enable(struct xe_gt *gt, bool stall)
> {
>-	xe_mmio_write32(gt, GEN11_GFX_MSTR_IRQ.reg, GEN11_MASTER_IRQ);
>+	xe_mmio_write32(gt, GFX_MSTR_IRQ.reg, MASTER_IRQ);
> 	if (stall)
>-		xe_mmio_read32(gt, GEN11_GFX_MSTR_IRQ.reg);
>+		xe_mmio_read32(gt, GFX_MSTR_IRQ.reg);
> }
>
> static void gen11_gt_irq_postinstall(struct xe_device *xe, struct xe_gt *gt)
>@@ -125,14 +125,14 @@ static void gen11_gt_irq_postinstall(struct xe_device *xe, struct xe_gt *gt)
> 	smask = irqs << 16;
>
> 	/* Enable RCS, BCS, VCS and VECS class interrupts. */
>-	xe_mmio_write32(gt, GEN11_RENDER_COPY_INTR_ENABLE.reg, dmask);
>-	xe_mmio_write32(gt, GEN11_VCS_VECS_INTR_ENABLE.reg, dmask);
>+	xe_mmio_write32(gt, RENDER_COPY_INTR_ENABLE.reg, dmask);
>+	xe_mmio_write32(gt, VCS_VECS_INTR_ENABLE.reg, dmask);
> 	if (ccs_mask)
>-		xe_mmio_write32(gt, GEN12_CCS_RSVD_INTR_ENABLE.reg, smask);
>+		xe_mmio_write32(gt, CCS_RSVD_INTR_ENABLE.reg, smask);
>
> 	/* Unmask irqs on RCS, BCS, VCS and VECS engines. */
>-	xe_mmio_write32(gt, GEN11_RCS0_RSVD_INTR_MASK.reg, ~smask);
>-	xe_mmio_write32(gt, GEN11_BCS_RSVD_INTR_MASK.reg, ~smask);
>+	xe_mmio_write32(gt, RCS0_RSVD_INTR_MASK.reg, ~smask);
>+	xe_mmio_write32(gt, BCS_RSVD_INTR_MASK.reg, ~smask);
> 	if (bcs_mask & (BIT(1)|BIT(2)))
> 		xe_mmio_write32(gt, XEHPC_BCS1_BCS2_INTR_MASK.reg, ~dmask);
> 	if (bcs_mask & (BIT(3)|BIT(4)))
>@@ -141,31 +141,31 @@ static void gen11_gt_irq_postinstall(struct xe_device *xe, struct xe_gt *gt)
> 		xe_mmio_write32(gt, XEHPC_BCS5_BCS6_INTR_MASK.reg, ~dmask);
> 	if (bcs_mask & (BIT(7)|BIT(8)))
> 		xe_mmio_write32(gt, XEHPC_BCS7_BCS8_INTR_MASK.reg, ~dmask);
>-	xe_mmio_write32(gt, GEN11_VCS0_VCS1_INTR_MASK.reg, ~dmask);
>-	xe_mmio_write32(gt, GEN11_VCS2_VCS3_INTR_MASK.reg, ~dmask);
>+	xe_mmio_write32(gt, VCS0_VCS1_INTR_MASK.reg, ~dmask);
>+	xe_mmio_write32(gt, VCS2_VCS3_INTR_MASK.reg, ~dmask);
> 	//if (HAS_ENGINE(gt, VCS4) || HAS_ENGINE(gt, VCS5))
>-	//	intel_uncore_write(uncore, GEN12_VCS4_VCS5_INTR_MASK, ~dmask);
>+	//	intel_uncore_write(uncore, VCS4_VCS5_INTR_MASK, ~dmask);
> 	//if (HAS_ENGINE(gt, VCS6) || HAS_ENGINE(gt, VCS7))
>-	//	intel_uncore_write(uncore, GEN12_VCS6_VCS7_INTR_MASK, ~dmask);
>-	xe_mmio_write32(gt, GEN11_VECS0_VECS1_INTR_MASK.reg, ~dmask);
>+	//	intel_uncore_write(uncore, VCS6_VCS7_INTR_MASK, ~dmask);
>+	xe_mmio_write32(gt, VECS0_VECS1_INTR_MASK.reg, ~dmask);
> 	//if (HAS_ENGINE(gt, VECS2) || HAS_ENGINE(gt, VECS3))
>-	//	intel_uncore_write(uncore, GEN12_VECS2_VECS3_INTR_MASK, ~dmask);
>+	//	intel_uncore_write(uncore, VECS2_VECS3_INTR_MASK, ~dmask);
> 	if (ccs_mask & (BIT(0)|BIT(1)))
>-		xe_mmio_write32(gt, GEN12_CCS0_CCS1_INTR_MASK.reg, ~dmask);
>+		xe_mmio_write32(gt, CCS0_CCS1_INTR_MASK.reg, ~dmask);
> 	if (ccs_mask & (BIT(2)|BIT(3)))
>-		xe_mmio_write32(gt,  GEN12_CCS2_CCS3_INTR_MASK.reg, ~dmask);
>+		xe_mmio_write32(gt,  CCS2_CCS3_INTR_MASK.reg, ~dmask);
>
> 	/*
> 	 * RPS interrupts will get enabled/disabled on demand when RPS itself
> 	 * is enabled/disabled.
> 	 */
> 	/* TODO: gt->pm_ier, gt->pm_imr */
>-	xe_mmio_write32(gt, GEN11_GPM_WGBOXPERF_INTR_ENABLE.reg, 0);
>-	xe_mmio_write32(gt, GEN11_GPM_WGBOXPERF_INTR_MASK.reg,  ~0);
>+	xe_mmio_write32(gt, GPM_WGBOXPERF_INTR_ENABLE.reg, 0);
>+	xe_mmio_write32(gt, GPM_WGBOXPERF_INTR_MASK.reg,  ~0);
>
> 	/* Same thing for GuC interrupts */
>-	xe_mmio_write32(gt, GEN11_GUC_SG_INTR_ENABLE.reg, 0);
>-	xe_mmio_write32(gt, GEN11_GUC_SG_INTR_MASK.reg,  ~0);
>+	xe_mmio_write32(gt, GUC_SG_INTR_ENABLE.reg, 0);
>+	xe_mmio_write32(gt, GUC_SG_INTR_MASK.reg,  ~0);
> }
>
> static void gen11_irq_postinstall(struct xe_device *xe, struct xe_gt *gt)
>@@ -174,7 +174,7 @@ static void gen11_irq_postinstall(struct xe_device *xe, struct xe_gt *gt)
>
> 	gen11_gt_irq_postinstall(xe, gt);
>
>-	unmask_and_enable(gt, GU_MISC_IRQ_REGS, GEN11_GU_MISC_GSE);
>+	unmask_and_enable(gt, GU_MISC_IRQ_REGS, GU_MISC_GSE);
>
> 	gen11_intr_enable(gt, true);
> }
>@@ -190,7 +190,7 @@ gen11_gt_engine_identity(struct xe_device *xe,
>
> 	lockdep_assert_held(&xe->irq.lock);
>
>-	xe_mmio_write32(gt, GEN11_IIR_REG_SELECTOR(bank).reg, BIT(bit));
>+	xe_mmio_write32(gt, IIR_REG_SELECTOR(bank).reg, BIT(bit));
>
> 	/*
> 	 * NB: Specs do not specify how long to spin wait,
>@@ -198,18 +198,17 @@ gen11_gt_engine_identity(struct xe_device *xe,
> 	 */
> 	timeout_ts = (local_clock() >> 10) + 100;
> 	do {
>-		ident = xe_mmio_read32(gt, GEN11_INTR_IDENTITY_REG(bank).reg);
>-	} while (!(ident & GEN11_INTR_DATA_VALID) &&
>+		ident = xe_mmio_read32(gt, INTR_IDENTITY_REG(bank).reg);
>+	} while (!(ident & INTR_DATA_VALID) &&
> 		 !time_after32(local_clock() >> 10, timeout_ts));
>
>-	if (unlikely(!(ident & GEN11_INTR_DATA_VALID))) {
>+	if (unlikely(!(ident & INTR_DATA_VALID))) {
> 		drm_err(&xe->drm, "INTR_IDENTITY_REG%u:%u 0x%08x not valid!\n",
> 			bank, bit, ident);
> 		return 0;
> 	}
>
>-	xe_mmio_write32(gt, GEN11_INTR_IDENTITY_REG(bank).reg,
>-			GEN11_INTR_DATA_VALID);
>+	xe_mmio_write32(gt, INTR_IDENTITY_REG(bank).reg, INTR_DATA_VALID);
>
> 	return ident;
> }
>@@ -243,24 +242,24 @@ static void gen11_gt_irq_handler(struct xe_device *xe, struct xe_gt *gt,
> 	spin_lock(&xe->irq.lock);
>
> 	for (bank = 0; bank < 2; bank++) {
>-		if (!(master_ctl & GEN11_GT_DW_IRQ(bank)))
>+		if (!(master_ctl & GT_DW_IRQ(bank)))
> 			continue;
>
> 		if (!xe_gt_is_media_type(gt)) {
> 			intr_dw[bank] =
>-				xe_mmio_read32(gt, GEN11_GT_INTR_DW(bank).reg);
>+				xe_mmio_read32(gt, GT_INTR_DW(bank).reg);
> 			for_each_set_bit(bit, intr_dw + bank, 32)
> 				identity[bit] = gen11_gt_engine_identity(xe, gt,
> 									 bank,
> 									 bit);
>-			xe_mmio_write32(gt, GEN11_GT_INTR_DW(bank).reg,
>+			xe_mmio_write32(gt, GT_INTR_DW(bank).reg,
> 					intr_dw[bank]);
> 		}
>
> 		for_each_set_bit(bit, intr_dw + bank, 32) {
>-			class = GEN11_INTR_ENGINE_CLASS(identity[bit]);
>-			instance = GEN11_INTR_ENGINE_INSTANCE(identity[bit]);
>-			intr_vec = GEN11_INTR_ENGINE_INTR(identity[bit]);
>+			class = INTR_ENGINE_CLASS(identity[bit]);
>+			instance = INTR_ENGINE_INSTANCE(identity[bit]);
>+			intr_vec = INTR_ENGINE_INTR(identity[bit]);
>
> 			if (class == XE_ENGINE_CLASS_OTHER) {
> 				gen11_gt_other_irq_handler(gt, instance,
>@@ -337,7 +336,7 @@ static void dg1_irq_postinstall(struct xe_device *xe, struct xe_gt *gt)
> {
> 	gen11_gt_irq_postinstall(xe, gt);
>
>-	unmask_and_enable(gt, GU_MISC_IRQ_REGS, GEN11_GU_MISC_GSE);
>+	unmask_and_enable(gt, GU_MISC_IRQ_REGS, GU_MISC_GSE);
>
> 	if (gt->info.id == XE_GT0)
> 		dg1_intr_enable(xe, true);
>@@ -365,7 +364,7 @@ static irqreturn_t dg1_irq_handler(int irq, void *arg)
> 			continue;
>
> 		if (!xe_gt_is_media_type(gt))
>-			master_ctl = xe_mmio_read32(gt, GEN11_GFX_MSTR_IRQ.reg);
>+			master_ctl = xe_mmio_read32(gt, GFX_MSTR_IRQ.reg);
>
> 		/*
> 		 * We might be in irq handler just when PCIe DPC is initiated
>@@ -379,7 +378,7 @@ static irqreturn_t dg1_irq_handler(int irq, void *arg)
> 		}
>
> 		if (!xe_gt_is_media_type(gt))
>-			xe_mmio_write32(gt, GEN11_GFX_MSTR_IRQ.reg, master_ctl);
>+			xe_mmio_write32(gt, GFX_MSTR_IRQ.reg, master_ctl);
> 		gen11_gt_irq_handler(xe, gt, master_ctl, intr_dw, identity);
> 	}
>
>@@ -400,14 +399,14 @@ static void gen11_gt_irq_reset(struct xe_gt *gt)
> 	u32 bcs_mask = xe_hw_engine_mask_per_class(gt, XE_ENGINE_CLASS_COPY);
>
> 	/* Disable RCS, BCS, VCS and VECS class engines. */
>-	xe_mmio_write32(gt, GEN11_RENDER_COPY_INTR_ENABLE.reg,	 0);
>-	xe_mmio_write32(gt, GEN11_VCS_VECS_INTR_ENABLE.reg,	 0);
>+	xe_mmio_write32(gt, RENDER_COPY_INTR_ENABLE.reg,	 0);
>+	xe_mmio_write32(gt, VCS_VECS_INTR_ENABLE.reg,	 0);
> 	if (ccs_mask)
>-		xe_mmio_write32(gt, GEN12_CCS_RSVD_INTR_ENABLE.reg, 0);
>+		xe_mmio_write32(gt, CCS_RSVD_INTR_ENABLE.reg, 0);
>
> 	/* Restore masks irqs on RCS, BCS, VCS and VECS engines. */
>-	xe_mmio_write32(gt, GEN11_RCS0_RSVD_INTR_MASK.reg,	~0);
>-	xe_mmio_write32(gt, GEN11_BCS_RSVD_INTR_MASK.reg,	~0);
>+	xe_mmio_write32(gt, RCS0_RSVD_INTR_MASK.reg,	~0);
>+	xe_mmio_write32(gt, BCS_RSVD_INTR_MASK.reg,	~0);
> 	if (bcs_mask & (BIT(1)|BIT(2)))
> 		xe_mmio_write32(gt, XEHPC_BCS1_BCS2_INTR_MASK.reg, ~0);
> 	if (bcs_mask & (BIT(3)|BIT(4)))
>@@ -416,24 +415,24 @@ static void gen11_gt_irq_reset(struct xe_gt *gt)
> 		xe_mmio_write32(gt, XEHPC_BCS5_BCS6_INTR_MASK.reg, ~0);
> 	if (bcs_mask & (BIT(7)|BIT(8)))
> 		xe_mmio_write32(gt, XEHPC_BCS7_BCS8_INTR_MASK.reg, ~0);
>-	xe_mmio_write32(gt, GEN11_VCS0_VCS1_INTR_MASK.reg,	~0);
>-	xe_mmio_write32(gt, GEN11_VCS2_VCS3_INTR_MASK.reg,	~0);
>+	xe_mmio_write32(gt, VCS0_VCS1_INTR_MASK.reg,	~0);
>+	xe_mmio_write32(gt, VCS2_VCS3_INTR_MASK.reg,	~0);
> //	if (HAS_ENGINE(gt, VCS4) || HAS_ENGINE(gt, VCS5))
>-//		xe_mmio_write32(xe, GEN12_VCS4_VCS5_INTR_MASK.reg,   ~0);
>+//		xe_mmio_write32(xe, VCS4_VCS5_INTR_MASK.reg,   ~0);
> //	if (HAS_ENGINE(gt, VCS6) || HAS_ENGINE(gt, VCS7))
>-//		xe_mmio_write32(xe, GEN12_VCS6_VCS7_INTR_MASK.reg,   ~0);
>-	xe_mmio_write32(gt, GEN11_VECS0_VECS1_INTR_MASK.reg,	~0);
>+//		xe_mmio_write32(xe, VCS6_VCS7_INTR_MASK.reg,   ~0);
>+	xe_mmio_write32(gt, VECS0_VECS1_INTR_MASK.reg,	~0);
> //	if (HAS_ENGINE(gt, VECS2) || HAS_ENGINE(gt, VECS3))
>-//		xe_mmio_write32(xe, GEN12_VECS2_VECS3_INTR_MASK.reg, ~0);
>+//		xe_mmio_write32(xe, VECS2_VECS3_INTR_MASK.reg, ~0);
> 	if (ccs_mask & (BIT(0)|BIT(1)))
>-		xe_mmio_write32(gt, GEN12_CCS0_CCS1_INTR_MASK.reg, ~0);
>+		xe_mmio_write32(gt, CCS0_CCS1_INTR_MASK.reg, ~0);
> 	if (ccs_mask & (BIT(2)|BIT(3)))
>-		xe_mmio_write32(gt,  GEN12_CCS2_CCS3_INTR_MASK.reg, ~0);
>+		xe_mmio_write32(gt,  CCS2_CCS3_INTR_MASK.reg, ~0);
>
>-	xe_mmio_write32(gt, GEN11_GPM_WGBOXPERF_INTR_ENABLE.reg, 0);
>-	xe_mmio_write32(gt, GEN11_GPM_WGBOXPERF_INTR_MASK.reg,  ~0);
>-	xe_mmio_write32(gt, GEN11_GUC_SG_INTR_ENABLE.reg,	 0);
>-	xe_mmio_write32(gt, GEN11_GUC_SG_INTR_MASK.reg,		~0);
>+	xe_mmio_write32(gt, GPM_WGBOXPERF_INTR_ENABLE.reg, 0);
>+	xe_mmio_write32(gt, GPM_WGBOXPERF_INTR_MASK.reg,  ~0);
>+	xe_mmio_write32(gt, GUC_SG_INTR_ENABLE.reg,	 0);
>+	xe_mmio_write32(gt, GUC_SG_INTR_MASK.reg,		~0);
> }
>
> static void gen11_irq_reset(struct xe_gt *gt)
>-- 
>2.39.2
>
