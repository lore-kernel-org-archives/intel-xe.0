Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E1C6C6FD19
	for <intel-xe@archiver.kernel.org>; Sat, 11 Mar 2023 00:27:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56E6B10E009;
	Sat, 11 Mar 2023 00:27:19 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2384010E009
 for <intel-xe@lists.freedesktop.org>; Sat, 11 Mar 2023 00:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678494437; x=1710030437;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=MniXHKLJ3Y1a2zz+EtfLYh1CpPuQkEuM/lqYV2+zlI0=;
 b=DeQf+UgelWLteTmgOygsusVkZ/7whA+zXvZ7/c0WcMbx1XCcahQJ+Xxp
 kQ08TjAqBPpUXRbFhS0NokmLamCdC0WeucQ8sdq78x1EUz36HMNeoxt0K
 queCm+8KcKLAqFmN1GUvS7NlpsHM+4+5wPE1ROINBhAmIoF/Doo6ovWvC
 3dfDd9YzzNivjbMun6mH5Ygcqy8Tohh98Gm/pDwEpJxylUKbAfHbnJF10
 Rc6FMRbdO4+UiHC9wEKwyhiKWQmT59ZNEQ9UuHoXhN1068WoHPxRXNrEw
 l8tr0KhDyeHwgUX2AlzrUSkSUCYbW+YQE8NgFxPQuYZdnSxax75HybRrx g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="317248007"
X-IronPort-AV: E=Sophos;i="5.98,251,1673942400"; d="scan'208";a="317248007"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2023 16:27:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="710475161"
X-IronPort-AV: E=Sophos;i="5.98,251,1673942400"; d="scan'208";a="710475161"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga001.jf.intel.com with ESMTP; 10 Mar 2023 16:27:16 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 10 Mar 2023 16:27:15 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Fri, 10 Mar 2023 16:27:15 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.42) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Fri, 10 Mar 2023 16:27:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OqVXwTzp8IKjVYB5qlWsTo5bVGXO7DcSVQP5gGrPl85mIPT1plfJXDlnMUqzzeS9dFivWD7pWtjbe5qPx/RYiH96ImBHPxx21dGRwJAJSBEakrkoCayVkqcfuTcm6qZgpLbkKcB0vOLnyd+HreidAoA7gR1GchLrwibhbrWcVE/qCGhopzW+bvTCpBvea9bCGXlaeax2urbhlokQfj4lWiLkqnW8g5t+xKub7KX4/icy4IDKYptnTie7sPI9z2UEcA5uK2sQMs14CkIfG47at2Ra8YHyYE3EBU4en1JcvHWJKmo2SkpXPj+NV1Qfkd5WwK3AVMFFIMCF8+wPR27AuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3qGqFYzOS1E7CrH0hkGIWJl52Umpdkl51E6ADPMfkXU=;
 b=lngzJy5wvl5yKl2TC77ew0lHozMzAwQxVihRckDCZQLRaUsVLKWCcA/rjxMdrWwQljVSu20FJIR5GIDbTdbJjoeul59kPYPR8liOlS+Sz6/7QMR307PyaChHKDLS1m5NKURxJgc/pt06rubogX+mkLuHS38U7liHdJ984ZE2kGK+iT83i0djcrJLYEk9j8B0kQ8PH8pClCZZOmzp5I21X6arAT7GAG/ayhbCJqbPzG/J0zCCkBULRbLCJ40mF1PfxG1sWX4Rrpapq0koS2A4dBK+zvZEi6JdzE6j116GDWXtncMCnTSg7R7c7mIeOs2ZlYA1YBFB9LyokdjqzsFanA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 IA1PR11MB6148.namprd11.prod.outlook.com (2603:10b6:208:3ec::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.19; Sat, 11 Mar
 2023 00:27:13 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0%6]) with mapi id 15.20.6178.022; Sat, 11 Mar 2023
 00:27:06 +0000
Date: Fri, 10 Mar 2023 16:27:03 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230311002703.GC1175070@mdroper-desk1.amr.corp.intel.com>
References: <20230310221549.2337402-1-lucas.demarchi@intel.com>
 <20230310221549.2337402-11-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230310221549.2337402-11-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0P220CA0020.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::26) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|IA1PR11MB6148:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c30cb8c-e372-48a9-37cc-08db21c757e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OX1mspMvJMDXF8n2MAflcgIgpo0YLVOcjKy4V4lLq+/cIaL2kX6ScFALx9+CPsxtiWYkkiFppv93/euwfyUw7FxaoHQ5y0m480xvYhLRZ/O3FvxtIPQuyqm2QoUNUd5oiwLx+W+P/eAH09UIaIsYA7QvQiovEJVIvP4FLA3kMgGrZSfw35unbRP8jZ5wDzSRoqC4rYxHHS2/e3TZCuNzysKwQkU6y2Tb56DOcS9qt7AFN7O/NDkKr+Cqho8rzBKQnLVA1x3ZCXfVb2UgmZKtxmYG5uiDFVnWrofNfnB+L7k7vr1RuZFPAxOvRIgEmCYTu5anYcQisoVBExKWGNLASvTiNB9EurRt5sERZN9MDFuZbvmPNbhvtzdVwg6vH6pOaJB0a7Ns4e2c4NZ2XrX7aHGwAZOg6wbmi98Cf6YEOMnf5bVCKdQn4MSB4MjrjAWApiWR3W8MdA5WGgGJ9dsHbshQQGa0klJH2xPavCKw5APQT0G7qxOrwhN4OhcpgZZ42gjxmAvvZ84WYS2BErkvSNhg1TTb2xztCj8uQSGCS6J8fqExjJn/23/s68X41Z7Yn1LCi/tnIZWKEVRd7SLhzBqKgik3TsznfdEj54lA/pLKvZm//wI4xfB2L0LS5w0VRwp4mhP327f9+8eS1BFDsQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(376002)(346002)(136003)(366004)(39860400002)(396003)(451199018)(38100700002)(6636002)(33656002)(86362001)(1076003)(186003)(26005)(478600001)(6512007)(6506007)(83380400001)(6666004)(82960400001)(316002)(6862004)(6486002)(5660300002)(66476007)(41300700001)(4326008)(8936002)(2906002)(66556008)(8676002)(30864003)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oJ1Bm/lB7A+e2CniEWrk8rZOB5ncfn9Mlap/2vOILGXk40j/V+ElAfrPlAUo?=
 =?us-ascii?Q?vPLQ9we36KFI3h8ykONkcxmRy44BjT3K534Yz9fVzL9xQfkqVPMpmZ/mNqc3?=
 =?us-ascii?Q?NkwLGD2qqEQZ3RUvidGJ/mgRS3sXjc0N64ZdQ/R0W8bMHn4WkhBafYDwB1kw?=
 =?us-ascii?Q?QdE/v4I4exScjnepPdxrBrWeYND2VI3U89QKEDY7xQNikua7cLE4fk+23gvh?=
 =?us-ascii?Q?qfbbEm9MXZu78CVak2QmISScJ8OspatZcvrDGwm7COygaeWLZyATI9FkwlM/?=
 =?us-ascii?Q?spyMI39vGTHCAMZ/aBOGPkmeE5htvzl6Zb61iTwVdLkxXhhlNdIUBlVq6NJF?=
 =?us-ascii?Q?HPy8w6ZJ1GjRPQJgt7OuAyB2+2kNTB8Ne1GyOKTkWEK6AzT4C4cuUXNvNmJn?=
 =?us-ascii?Q?8xXfbILDDicnmZUZhSXCQdaF9Yw+AhST7BHJynztWK/yOOzeJnwbkO7Xn9+4?=
 =?us-ascii?Q?fRDSKqBzK/dXGz2SquyImbfgS+lGuwgYOH7NlXUvWr/B15ZhTQiBQ2zpTk05?=
 =?us-ascii?Q?bsnMbI12AKjXmlzdVNPYgY39owJ8p4T0TZCxV8LZtxd0yUubHAoyzW1Pd6uD?=
 =?us-ascii?Q?Nl0flT0L4WapxIFht9ddySftANGoR6aK+e0AgQdxUZ54Dy0E3w+C+nC2NZSt?=
 =?us-ascii?Q?bRDmbbcKzJ0675zNv/GhKgXMd+2kWb7S2+RmKe5oInigypIJNQ8ZXkHVuF5z?=
 =?us-ascii?Q?hwL/4bQsxxoCXMKv6dBlrcVE2SVyO0XW66wYEdaD9Ig/p0YwjFH3NCFW73ml?=
 =?us-ascii?Q?hSAX2WeqxHdekhrF4c/PJ/C8WmIWqr97y7lSNdhdCZ7GPnZW9Rh03l8JLfEI?=
 =?us-ascii?Q?Vl5GHekANXNPHXdGkaR/xjE5YcssUZL6MjuUJzhedoenlu4E15zBIpSz19JZ?=
 =?us-ascii?Q?RSe9hhqcSfXiZQ09jMG3qRbn7b0H810wSV4YuwLVDLMKBKTMmduCDfWvfUE/?=
 =?us-ascii?Q?w88AfiGX89JoW1qIIz6/daISHEkB+TRnH1ODZmNUDijiX+699FWBMJzDt5yr?=
 =?us-ascii?Q?oI5DGHLcVMhkG6BMMdKIm+R9YIrZ86LNn0qTiy7CMFh92qMCTHuLuRurwXRc?=
 =?us-ascii?Q?8RtMbDB3REwZpWP1uVWVnmw45iaMVeY+xG2IPfWwW+5qXko96oYtB6wHj/nM?=
 =?us-ascii?Q?uj6b+09oGc+t/jebqBOMTrFLarxr9O5G/SYvBk1tz5J15cCY33MLamY26nmj?=
 =?us-ascii?Q?MLVmYdUU/0rDosPOhJCuS0MgimIanu/FhOt191RT2kQzaniX6Wj9H3Ac3zSn?=
 =?us-ascii?Q?EgYnaamDBlA8lKKXbXQR7XedpGmb3Ru9uEc+aYWAa4o2F6U6FxAMm9A6C0oY?=
 =?us-ascii?Q?9LqQjfY+YyU/B1IxhE0vjfSi8ZbBr2R6vHLcZA2rl7PBGiHRhePfC/O8cUR1?=
 =?us-ascii?Q?STlgL56GHoKZyRyHW9GLt1iy5d85VzTX0qTTsKB4xtG9NvthhinJXaf9Lkm7?=
 =?us-ascii?Q?2Jf1Khgkeqd20ZhA7+luv3Jp9xYfQLu/TifCk2Puli8aVQ2XoJbHAUXvY1mP?=
 =?us-ascii?Q?iXULxsHS9rmwvf0cH0ET8syzIt15TWGVtiCHTI4ZkAPRkzE4MbuQxSFN73Ri?=
 =?us-ascii?Q?tQPHVw4Hp/sZ3bh8Lp3WtMQP4SrN1z07AgM/m+76B9GTN1e6EzHQ4sDWRrxK?=
 =?us-ascii?Q?3w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c30cb8c-e372-48a9-37cc-08db21c757e0
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2023 00:27:06.0984 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZXHjLNmnCuDOfQPc/B5ECp/JOPDaifvbmtEOtEHOzbmy6xcUwzRqoHyzWITaREVnlhP1aB4szO3sc4dnbGySdLFrjp6a9L1T8VSG0qP6NWU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6148
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 10/12] drm/xe: Add missing DG2 engine
 workarounds
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

On Fri, Mar 10, 2023 at 02:15:47PM -0800, Lucas De Marchi wrote:
> Synchronize with i915 the DG2 gt workarounds as of
> commit 4d14d7717f19 ("drm/i915/selftest: Fix ktime_get() and h/w access
> order").
> 
> A few simplifications were done when the WA should be applied to
> some steps of a subplatform and all the steppings of the other
> subplatforms. This happened with Wa_1509727124, Wa_22012856258 and a few
> others. In figure the pre-production steppings will be removed, so this
> can be already simplified a little bit.
> 
> v2:
>   - Make 1308578152 conditional on first gslice fused off
>   - Add the missing Wa_1608949956/Wa_14010198302 (Matt Roper)
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h |  27 ++++
>  drivers/gpu/drm/xe/xe_wa.c           | 192 ++++++++++++++++++++++++++-
>  2 files changed, 216 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 90c270f2405a..2600704ace0a 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -48,6 +48,7 @@
>  
>  #define GEN9_CS_DEBUG_MODE1			_MMIO(0x20ec)
>  #define   FF_DOP_CLOCK_GATE_DISABLE		REG_BIT(1)
> +#define   GEN12_REPLAY_MODE_GRANULARITY		REG_BIT(0)
>  
>  #define PS_INVOCATION_COUNT			_MMIO(0x2348)
>  
> @@ -91,6 +92,9 @@
>  #define   GEN11_BLEND_EMB_FIX_DISABLE_IN_RCC	REG_BIT(11)
>  #define   GEN12_DISABLE_CPS_AWARE_COLOR_PIPE	REG_BIT(9)
>  
> +#define VFG_PREEMPTION_CHICKEN			_MMIO(0x83b4)
> +#define   POLYGON_TRIFAN_LINELOOP_DISABLE	REG_BIT(4)
> +
>  #define XEHP_SQCM				MCR_REG(0x8724)
>  #define   EN_32B_ACCESS				REG_BIT(30)
>  
> @@ -248,8 +252,13 @@
>  #define   SC_DISABLE_POWER_OPTIMIZATION_EBB	REG_BIT(9)
>  #define   GEN11_SAMPLER_ENABLE_HEADLESS_MSG	REG_BIT(5)
>  
> +#define GEN9_HALF_SLICE_CHICKEN7		MCR_REG(0xe194)
> +#define   DG2_DISABLE_ROUND_ENABLE_ALLOW_FOR_SSLA	REG_BIT(15)
> +
>  #define CACHE_MODE_SS				MCR_REG(0xe420)
> +#define   ENABLE_EU_COUNT_FOR_TDL_FLUSH		REG_BIT(10)
>  #define   DISABLE_ECC				REG_BIT(5)
> +#define   ENABLE_PREFETCH_INTO_IC		REG_BIT(3)
>  
>  #define GEN9_ROW_CHICKEN4			MCR_REG(0xe48c)
>  #define   GEN12_DISABLE_GRF_CLEAR		REG_BIT(13)
> @@ -260,6 +269,10 @@
>  #define   THREAD_EX_ARB_MODE			REG_GENMASK(3, 2)
>  #define   THREAD_EX_ARB_MODE_RR_AFTER_DEP	REG_FIELD_PREP(THREAD_EX_ARB_MODE, 0x2)
>  
> +#define GEN8_ROW_CHICKEN			MCR_REG(0xe4f0)
> +#define   UGM_BACKUP_MODE			REG_BIT(13)
> +#define   MDQ_ARBITRATION_MODE			REG_BIT(12)
> +
>  #define GEN8_ROW_CHICKEN2			MCR_REG(0xe4f4)
>  #define   GEN12_DISABLE_READ_SUPPRESSION	REG_BIT(15)
>  #define   GEN12_DISABLE_EARLY_READ		REG_BIT(14)
> @@ -267,8 +280,22 @@
>  #define   GEN12_PUSH_CONST_DEREF_HOLD_DIS	REG_BIT(8)
>  #define   GEN12_DISABLE_DOP_GATING              REG_BIT(0)
>  
> +#define XEHP_HDC_CHICKEN0			MCR_REG(0xe5f0)
> +#define   LSC_L1_FLUSH_CTL_3D_DATAPORT_FLUSH_EVENTS_MASK	REG_GENMASK(13, 11)
> +
> +#define RT_CTRL					MCR_REG(0xe530)
> +#define   DIS_NULL_QUERY			REG_BIT(10)
> +
>  #define LSC_CHICKEN_BIT_0			MCR_REG(0xe7c8)
>  #define   DISABLE_D8_D16_COASLESCE		REG_BIT(30)
> +#define   FORCE_1_SUB_MESSAGE_PER_FRAGMENT	REG_BIT(15)
> +
> +#define LSC_CHICKEN_BIT_0_UDW			MCR_REG(0xe7c8 + 4)
> +#define   DIS_CHAIN_2XSIMD8			REG_BIT(55 - 32)
> +#define   FORCE_SLM_FENCE_SCOPE_TO_TILE		REG_BIT(42 - 32)
> +#define   FORCE_UGM_FENCE_SCOPE_TO_TILE		REG_BIT(41 - 32)
> +#define   MAXREQS_PER_BANK			REG_GENMASK(39 - 32, 37 - 32)
> +#define   DISABLE_128B_EVICTION_COMMAND_UDW	REG_BIT(36 - 32)
>  
>  #define SARB_CHICKEN1				MCR_REG(0xe90c)
>  #define   COMP_CKN_IN				REG_GENMASK(30, 29)
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index b08d5fd24e25..cc7a6552f17c 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -91,6 +91,9 @@
>  #define _MMIO(x)	_XE_RTP_REG(x)
>  #define MCR_REG(x)	_XE_RTP_MCR_REG(x)
>  
> +__diag_push();
> +__diag_ignore_all("-Woverride-init", "Allow field overrides in table");
> +
>  static const struct xe_rtp_entry gt_was[] = {
>  	{ XE_RTP_NAME("14011060649"),
>  	  XE_RTP_RULES(MEDIA_VERSION_RANGE(1200, 1255),
> @@ -269,6 +272,11 @@ static const struct xe_rtp_entry engine_was[] = {
>  	  XE_RTP_ACTIONS(SET(GEN10_SAMPLER_MODE, ENABLE_SMALLPL,
>  			     XE_RTP_ACTION_FLAG(MASKED_REG)))
>  	},
> +	{ XE_RTP_NAME("18019627453"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1255), ENGINE_CLASS(RENDER)),
> +	  XE_RTP_ACTIONS(SET(GEN9_CS_DEBUG_MODE1, FF_DOP_CLOCK_GATE_DISABLE,
> +			     XE_RTP_ACTION_FLAG(MASKED_REG)))
> +	},
>  
>  	/* TGL */
>  
> @@ -292,16 +300,192 @@ static const struct xe_rtp_entry engine_was[] = {
>  
>  	/* DG2 */
>  
> +	{ XE_RTP_NAME("22013037850"),
> +	  XE_RTP_RULES(PLATFORM(DG2), FUNC(xe_rtp_match_first_render_or_compute)),
> +	  XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0_UDW,
> +			     DISABLE_128B_EVICTION_COMMAND_UDW))
> +	},
> +	{ XE_RTP_NAME("22014226127"),
> +	  XE_RTP_RULES(PLATFORM(DG2), FUNC(xe_rtp_match_first_render_or_compute)),
> +	  XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0, DISABLE_D8_D16_COASLESCE))
> +	},
> +	{ XE_RTP_NAME("18017747507"),
> +	  XE_RTP_RULES(PLATFORM(DG2), FUNC(xe_rtp_match_first_render_or_compute)),
> +	  XE_RTP_ACTIONS(SET(VFG_PREEMPTION_CHICKEN,
> +			     POLYGON_TRIFAN_LINELOOP_DISABLE,
> +			     XE_RTP_ACTION_FLAG(MASKED_REG)))
> +	},
> +	{ XE_RTP_NAME("22012826095, 22013059131"),
> +	  XE_RTP_RULES(SUBPLATFORM(DG2, G10), STEP(B0, C0),
> +		       FUNC(xe_rtp_match_first_render_or_compute)),
> +	  XE_RTP_ACTIONS(FIELD_SET(LSC_CHICKEN_BIT_0_UDW,
> +				   MAXREQS_PER_BANK,
> +				   REG_FIELD_PREP(MAXREQS_PER_BANK, 2)))
> +	},
> +	{ XE_RTP_NAME("22012826095, 22013059131"),
> +	  XE_RTP_RULES(SUBPLATFORM(DG2, G11),
> +		       FUNC(xe_rtp_match_first_render_or_compute)),
> +	  XE_RTP_ACTIONS(FIELD_SET(LSC_CHICKEN_BIT_0_UDW,
> +				   MAXREQS_PER_BANK,
> +				   REG_FIELD_PREP(MAXREQS_PER_BANK, 2)))
> +	},
> +	{ XE_RTP_NAME("22013059131"),
> +	  XE_RTP_RULES(SUBPLATFORM(DG2, G10), STEP(B0, C0),
> +		       FUNC(xe_rtp_match_first_render_or_compute)),
> +	  XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0, FORCE_1_SUB_MESSAGE_PER_FRAGMENT))
> +	},
> +	{ XE_RTP_NAME("22013059131"),
> +	  XE_RTP_RULES(SUBPLATFORM(DG2, G11),
> +		       FUNC(xe_rtp_match_first_render_or_compute)),
> +	  XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0, FORCE_1_SUB_MESSAGE_PER_FRAGMENT))
> +	},
> +	{ XE_RTP_NAME("14010918519"),
> +	  XE_RTP_RULES(SUBPLATFORM(DG2, G10),
> +		       FUNC(xe_rtp_match_first_render_or_compute)),
> +	  XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0,
> +			     FORCE_SLM_FENCE_SCOPE_TO_TILE |
> +			     FORCE_UGM_FENCE_SCOPE_TO_TILE,
> +			     /*
> +			      * Ignore read back as it always returns 0 in these
> +			      * steps
> +			      */
> +			     .read_mask = 0))
> +	},
>  	{ XE_RTP_NAME("14015227452"),
> -	  XE_RTP_RULES(PLATFORM(DG2), ENGINE_CLASS(RENDER)),
> +	  XE_RTP_RULES(PLATFORM(DG2),
> +		       FUNC(xe_rtp_match_first_render_or_compute)),
>  	  XE_RTP_ACTIONS(SET(GEN9_ROW_CHICKEN4, XEHP_DIS_BBL_SYSPIPE,
>  			     XE_RTP_ACTION_FLAG(MASKED_REG)))
>  	},
> -	{ XE_RTP_NAME("18019627453"),
> +	{ XE_RTP_NAME("16015675438"),
> +	  XE_RTP_RULES(PLATFORM(DG2),
> +		       FUNC(xe_rtp_match_first_render_or_compute)),
> +	  XE_RTP_ACTIONS(SET(FF_SLICE_CS_CHICKEN2,
> +			     PERF_FIX_BALANCING_CFE_DISABLE,
> +			     XE_RTP_ACTION_FLAG(MASKED_REG)))
> +	},
> +	{ XE_RTP_NAME("16011620976, 22015475538"),
> +	  XE_RTP_RULES(PLATFORM(DG2),
> +		       FUNC(xe_rtp_match_first_render_or_compute)),
> +	  XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0_UDW, DIS_CHAIN_2XSIMD8))
> +	},
> +	{ XE_RTP_NAME("22012654132"),
> +	  XE_RTP_RULES(SUBPLATFORM(DG2, G10), STEP(A0, C0),
> +		       FUNC(xe_rtp_match_first_render_or_compute)),
> +	  XE_RTP_ACTIONS(SET(CACHE_MODE_SS, ENABLE_PREFETCH_INTO_IC,
> +			     XE_RTP_ACTION_FLAG(MASKED_REG),
> +			     /*
> +			      * Register can't be read back for verification on
> +			      * DG2 due to Wa_14012342262
> +			      */
> +			     .read_mask = 0))
> +	},
> +	{ XE_RTP_NAME("22012654132"),
> +	  XE_RTP_RULES(SUBPLATFORM(DG2, G11),
> +		       FUNC(xe_rtp_match_first_render_or_compute)),
> +	  XE_RTP_ACTIONS(SET(CACHE_MODE_SS, ENABLE_PREFETCH_INTO_IC,
> +			     XE_RTP_ACTION_FLAG(MASKED_REG),
> +			     /*
> +			      * Register can't be read back for verification on
> +			      * DG2 due to Wa_14012342262
> +			      */
> +			     .read_mask = 0))
> +	},
> +	{ XE_RTP_NAME("1509727124"),
>  	  XE_RTP_RULES(PLATFORM(DG2), ENGINE_CLASS(RENDER)),
> -	  XE_RTP_ACTIONS(SET(GEN9_CS_DEBUG_MODE1, FF_DOP_CLOCK_GATE_DISABLE,
> +	  XE_RTP_ACTIONS(SET(GEN10_SAMPLER_MODE, SC_DISABLE_POWER_OPTIMIZATION_EBB,
> +			     XE_RTP_ACTION_FLAG(MASKED_REG)))
> +	},
> +	{ XE_RTP_NAME("22012856258"),
> +	  XE_RTP_RULES(PLATFORM(DG2), ENGINE_CLASS(RENDER)),
> +	  XE_RTP_ACTIONS(SET(GEN8_ROW_CHICKEN2, GEN12_DISABLE_READ_SUPPRESSION,
> +			     XE_RTP_ACTION_FLAG(MASKED_REG)))
> +	},
> +	{ XE_RTP_NAME("14013392000"),
> +	  XE_RTP_RULES(SUBPLATFORM(DG2, G11), STEP(A0, B0), ENGINE_CLASS(RENDER)),
> +	  XE_RTP_ACTIONS(SET(GEN8_ROW_CHICKEN2, GEN12_ENABLE_LARGE_GRF_MODE,
> +			     XE_RTP_ACTION_FLAG(MASKED_REG)))
> +	},
> +	{ XE_RTP_NAME("14012419201"),
> +	  XE_RTP_RULES(SUBPLATFORM(DG2, G10), STEP(A0, B0), ENGINE_CLASS(RENDER)),
> +	  XE_RTP_ACTIONS(SET(GEN9_ROW_CHICKEN4,
> +			     GEN12_DISABLE_HDR_PAST_PAYLOAD_HOLD_FIX,
> +			     XE_RTP_ACTION_FLAG(MASKED_REG)))
> +	},
> +	{ XE_RTP_NAME("14012419201"),
> +	  XE_RTP_RULES(SUBPLATFORM(DG2, G11), STEP(A0, B0), ENGINE_CLASS(RENDER)),
> +	  XE_RTP_ACTIONS(SET(GEN9_ROW_CHICKEN4,
> +			     GEN12_DISABLE_HDR_PAST_PAYLOAD_HOLD_FIX,
> +			     XE_RTP_ACTION_FLAG(MASKED_REG)))
> +	},
> +	{ XE_RTP_NAME("1308578152"),
> +	  XE_RTP_RULES(SUBPLATFORM(DG2, G10), STEP(B0, C0), ENGINE_CLASS(RENDER),
> +		       FUNC(xe_rtp_match_first_gslice_fused_off)),
> +	  XE_RTP_ACTIONS(CLR(GEN9_CS_DEBUG_MODE1,
> +			     GEN12_REPLAY_MODE_GRANULARITY,
> +			     XE_RTP_ACTION_FLAG(MASKED_REG)))
> +	},
> +	{ XE_RTP_NAME("22010960976, 14013347512"),
> +	  XE_RTP_RULES(PLATFORM(DG2), ENGINE_CLASS(RENDER)),
> +	  XE_RTP_ACTIONS(CLR(XEHP_HDC_CHICKEN0,
> +			     LSC_L1_FLUSH_CTL_3D_DATAPORT_FLUSH_EVENTS_MASK,
>  			     XE_RTP_ACTION_FLAG(MASKED_REG)))
>  	},
> +	{ XE_RTP_NAME("1608949956, 14010198302"),
> +	  XE_RTP_RULES(PLATFORM(DG2), ENGINE_CLASS(RENDER)),
> +	  XE_RTP_ACTIONS(SET(GEN8_ROW_CHICKEN,
> +			     MDQ_ARBITRATION_MODE | UGM_BACKUP_MODE,
> +			     XE_RTP_ACTION_FLAG(MASKED_REG)))
> +	},
> +	{ XE_RTP_NAME("22010430635"),
> +	  XE_RTP_RULES(SUBPLATFORM(DG2, G10), STEP(A0, B0), ENGINE_CLASS(RENDER)),
> +	  XE_RTP_ACTIONS(SET(GEN9_ROW_CHICKEN4,
> +			     GEN12_DISABLE_GRF_CLEAR,
> +			     XE_RTP_ACTION_FLAG(MASKED_REG)))
> +	},
> +	{ XE_RTP_NAME("14013202645"),
> +	  XE_RTP_RULES(SUBPLATFORM(DG2, G10), STEP(B0, C0), ENGINE_CLASS(RENDER)),
> +	  XE_RTP_ACTIONS(SET(RT_CTRL, DIS_NULL_QUERY))
> +	},
> +	{ XE_RTP_NAME("14013202645"),
> +	  XE_RTP_RULES(SUBPLATFORM(DG2, G11), STEP(A0, B0), ENGINE_CLASS(RENDER)),
> +	  XE_RTP_ACTIONS(SET(RT_CTRL, DIS_NULL_QUERY))
> +	},
> +	{ XE_RTP_NAME("22012532006"),
> +	  XE_RTP_RULES(SUBPLATFORM(DG2, G10), STEP(A0, C0), ENGINE_CLASS(RENDER)),
> +	  XE_RTP_ACTIONS(SET(GEN9_HALF_SLICE_CHICKEN7,
> +			     DG2_DISABLE_ROUND_ENABLE_ALLOW_FOR_SSLA,
> +			     XE_RTP_ACTION_FLAG(MASKED_REG)))
> +	},
> +	{ XE_RTP_NAME("22012532006"),
> +	  XE_RTP_RULES(SUBPLATFORM(DG2, G11), STEP(A0, B0), ENGINE_CLASS(RENDER)),
> +	  XE_RTP_ACTIONS(SET(GEN9_HALF_SLICE_CHICKEN7,
> +			     DG2_DISABLE_ROUND_ENABLE_ALLOW_FOR_SSLA,
> +			     XE_RTP_ACTION_FLAG(MASKED_REG)))
> +	},
> +	{ XE_RTP_NAME("22014600077"),
> +	  XE_RTP_RULES(SUBPLATFORM(DG2, G11), STEP(B0, FOREVER),
> +		       ENGINE_CLASS(RENDER)),
> +	  XE_RTP_ACTIONS(SET(CACHE_MODE_SS,
> +			     ENABLE_EU_COUNT_FOR_TDL_FLUSH,
> +			     XE_RTP_ACTION_FLAG(MASKED_REG),
> +			     /* 
> +			      * Wa_14012342262 write-only reg, so skip
> +			      * verification
> +			      */
> +			     .read_mask = 0))
> +	},
> +	{ XE_RTP_NAME("22014600077"),
> +	  XE_RTP_RULES(SUBPLATFORM(DG2, G10), ENGINE_CLASS(RENDER)),
> +	  XE_RTP_ACTIONS(SET(CACHE_MODE_SS,
> +			     ENABLE_EU_COUNT_FOR_TDL_FLUSH,
> +			     XE_RTP_ACTION_FLAG(MASKED_REG),
> +			     /* 
> +			      * Wa_14012342262 write-only reg, so skip
> +			      * verification
> +			      */
> +			     .read_mask = 0))
> +	},
>  
>  	/* PVC */
>  
> @@ -359,6 +543,8 @@ static const struct xe_rtp_entry lrc_was[] = {
>  	{}
>  };
>  
> +__diag_pop();
> +
>  /**
>   * xe_wa_process_gt - process GT workaround table
>   * @gt: GT instance to process workarounds for
> -- 
> 2.39.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
