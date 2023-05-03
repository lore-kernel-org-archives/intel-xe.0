Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28F81C77B78
	for <intel-xe@archiver.kernel.org>; Wed,  3 May 2023 22:52:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9A2B10E060;
	Wed,  3 May 2023 22:52:46 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C3EE10E060
 for <intel-xe@lists.freedesktop.org>; Wed,  3 May 2023 22:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683154365; x=1714690365;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=sa6wJY4/47nEf+Bcgeer05XHtPQ6wOehvQtB9kxEVC8=;
 b=NFvhI7wLi9+qnsgJGgL0RK2UjxCaCX8E51Mu16wy/gNiNvWfA+Sp4GVF
 +yUe4rRgqgQnLy6xbcOs4WVxvQuj+SgLfWMv0ZLFBMw2xJTFh206cinTx
 /tOmHrCHf17Gf09csznLhQFnlhL15kup+KOVTARNX0LB4ZOzVm75U+O7t
 gHjCo5sU1dzci8MvOZD39bRDaMPw7wF06Jy+vyD8WUwj3xjM7nmiQmqun
 Lmic8IV237IYVnkNnL+wT2/9dv6qB2DOaaVGLeFDrBkMbhnQLlCS7nttC
 ssa2k+pP+wSbAqCoaSIsd35P6JmpNO5/qM9U2eLn2Ac48cqfb5qqAYxtD A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="350866544"
X-IronPort-AV: E=Sophos;i="5.99,248,1677571200"; d="scan'208";a="350866544"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2023 15:52:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="943059276"
X-IronPort-AV: E=Sophos;i="5.99,248,1677571200"; d="scan'208";a="943059276"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga006.fm.intel.com with ESMTP; 03 May 2023 15:52:44 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 3 May 2023 15:52:44 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 3 May 2023 15:52:44 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 3 May 2023 15:52:44 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.45) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 3 May 2023 15:52:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VYQL454SDvPvXpczzU+zYmJ2hVlD9gD24YSn7o504/h2SoSsxuwHFG4+Dfwmzbz2ChuiRJp2RQ4IA8ls8JY65m470SXxpayOcxJ0HrOu8hBp3emmoQv8sceJx7eZUbIap/2he1yEuzMJNRxC4dPP89cfEi+U0vZTi0HgwQLZScvlKSsw2TBNL+dZ9yqgUeYfzwKQ2WrJ6/wr+aNWz7pYaBs0Cf8ddw+GE2z8vkLsE3jf5X+9NZUEYyv605mllp9ZvtbMYjg7oNzDEArtaxvavGRW+CBsVB2EXN1MJdSgP3GVylVOHucr91X+O41ZdJ0CHU34nF6qPTbZ+mHI4qJeJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Wuufm6gsmai5eXfwd7b76ytHAps+HNrJvZHUI3+Ir4=;
 b=EC7lorFbf1d5DpthcB+nvE3TDR2a91ueLZF50kGf/XMWUy5UsMNNPVhkwS2Xgwdq2k/YCyzPoaBOmcu9z0oOEvftAY3j0R1T3RJUVWCISeqbPOK6xqf+rI71+EYaZWE0LtDzFPjtMfLRDOrAj1NdRtniE6RliAyqX33RRiyJVXff5UdsP34p76pK9TKcM4Mw4Q0ic1SOW8/SCyLf5psMCLxUq7T4RSk0u287b7ivhaDqdK8pMqOhbqKBnNviIZOELrBds16CjvsEdFHLkKY7w//kkP53S6gaqe9uHcT2nISVww943CqroCozYvKYf5ke3PkSxBnE8TKiHgahrZaSgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 SA3PR11MB7978.namprd11.prod.outlook.com (2603:10b6:806:2fa::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6363.22; Wed, 3 May 2023 22:52:42 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396%7]) with mapi id 15.20.6363.022; Wed, 3 May 2023
 22:52:41 +0000
Date: Wed, 3 May 2023 15:52:38 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: =?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>
Message-ID: <20230503225238.GL10045@mdroper-desk1.amr.corp.intel.com>
References: <20230503163013.50231-1-jose.souza@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230503163013.50231-1-jose.souza@intel.com>
X-ClientProxiedBy: BYAPR07CA0008.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::21) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|SA3PR11MB7978:EE_
X-MS-Office365-Filtering-Correlation-Id: cc8af347-138d-4c7d-6412-08db4c2919ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 51n3TAv5bM5deropQe0WUB+BfK9WnlIKgOCsLrDQXofEHy9mkKf0xvT8RqdNlWhPt6hpw6aWxtwEoJyTg0DNP7qQAiZWUeFYEpw27NIzlhRmoylGjSubQ8rsWM4eDMg60tmq+FheOxA2ej+GEqIALtUtUnKj7X6lAmaeSYeU6kNiadLzuwm7BcoxDiQly8wSz3hrvc4on5ViWdz6s4aSEL25h8sP95hXTFR38v98BzT1yHq7BV1VMR2WKDrEFscid9u95TGiP2ohJoCPhS5DuyZ4uQ0eW/7aFtZPT+xk2VZE8oHR2DfSrHxsCnmePtL7dAPpLmRth78Ua5Zdtsi0oz5AZbwyJAt3FC0Yk+a5pqlVhBbJbXod3c1N71ywuJaGB2SFngICSW8Aal8GXtavJfjdHkj3bRs23ySPGKdk4n+kg0xmNUFUsrNiiJRlDyZrwVaeW7odEqXO/NclEKLmk0zcvJdWL+HnMmpJyCK/kz6/of0HVJt1frj++xIz9ktHZiTGQBp8J97sKVYj1M+PyHd3svlt0uB7rzQeXEMYz3P5/ScA506otzp8fra69Gok
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(136003)(376002)(39860400002)(346002)(366004)(451199021)(6506007)(6862004)(6512007)(8936002)(8676002)(1076003)(26005)(186003)(316002)(5660300002)(66946007)(66556008)(66476007)(4326008)(6666004)(6636002)(6486002)(41300700001)(478600001)(82960400001)(38100700002)(86362001)(33656002)(83380400001)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?+xSiSqqcO85IlQVq1hcWJj30QHr5eSsvBLb1UKf4lcNTxIbV4a37MV6DBw?=
 =?iso-8859-1?Q?Ix6eQtylfZuXr1H4MICKqWBpSfWsMN8s3Dfzk5Ak3Dg/HT4ebDjTUWIblT?=
 =?iso-8859-1?Q?n/W3k4lGVFxLsAxUvVthw86PiV81hcZC5qDD74PM0FAKuDaZNLfyhPqdXg?=
 =?iso-8859-1?Q?gnr65A76wrt5168IOm/ckBfYEFZ2bRWhTPbSNzau6VbMHvriFx4y1w4dSS?=
 =?iso-8859-1?Q?PLUqHNrnU5sBIrYkgb4OMgJkXN/LEXo9zvS2HJlTVvv1k5mZKADIJ9hZb/?=
 =?iso-8859-1?Q?vjZn+Lf0hked84VGE3Zr8kIFIR49bVG10coE0RVh1FLNQ1uX8uB6YVsznl?=
 =?iso-8859-1?Q?fQXjIWlWcsA97prPfK9wf8rEHvhtCrATmVtyFJnd+Rewd4qhtcLAyYWE4D?=
 =?iso-8859-1?Q?3jWY7P/8OAXW4w8F+/HvSZijPT5g5BngfvUg7Gt0ZlQtTCEiDzjlPl27XP?=
 =?iso-8859-1?Q?gWqQe5JFCtL8ci4kyszuXmqakw+DJbvUDQV4oyQp1MtycVlAuI+9Sqjqea?=
 =?iso-8859-1?Q?W2OZZTbCcAJTvSMoKHNoIkNjD+35gM6hMywHeuUc5Qr1om5+onmmIfgVSu?=
 =?iso-8859-1?Q?x1TR5QYtv3eD+C6lfYFyAhpQB7WsLocgtrCHwhWBDGCQLTUDU7kD/lAs/6?=
 =?iso-8859-1?Q?aqINWer5czRSzuf2QzNCBGgrL4qgTqP/CIRM6MQUUmjSMVlIWDAg/ZxlGK?=
 =?iso-8859-1?Q?pOkM2QDOuNRu6H4V9IONdO/EJS/I1LETK3OU2Oh8HwPmpEakT2QJfaRqpW?=
 =?iso-8859-1?Q?kxuKPK4NhF6Ic03aP2fNyWkfAXAN3A6eyP9xc7w3aQLr6VBHVSdV3vFK7u?=
 =?iso-8859-1?Q?e3ijw/bXZP+5gqS+1Bf+vF8odFM+OFCK4NBrG2AIgWSvK6ie69kJE/ofui?=
 =?iso-8859-1?Q?z6bsO5hqCGA2srQLp3QMuvrxn1PCT9sTdl7M9/uLHNqJsKa4z/0wJpTovw?=
 =?iso-8859-1?Q?ffld/deTQLSm9id1W+cS32aukih4gi6mbhIwnpPR/qF9p98ao0xDtdlKtP?=
 =?iso-8859-1?Q?5qX8tSOvTv+fGa+aUUTXt6tCwDwUl8CMPi4Bs8505jx1WoN+7A9y1sW+R5?=
 =?iso-8859-1?Q?oEE76ID6x+SyPtV2tXVHYF2NXW+YRYU0CxPEdoFlngnDMp0DFNxrXRxQ77?=
 =?iso-8859-1?Q?uXU/1Cj9vU/URCVd6+AKgpNh3wfTfcVQCevmo9CTYLicVMDMBeUPdWRXIL?=
 =?iso-8859-1?Q?KdsLo852iQJIJnRx0cSBXcQwzCuPvpYcLq4+RECa4BjfJRqNyysgJV2IVa?=
 =?iso-8859-1?Q?7/LA3s1ygZqscpIAVuU6fTRuR6HC2uMYuC0f9ebf37amk3Y9ftpkYIWCry?=
 =?iso-8859-1?Q?FVfjHSFZ7sNLdjjNZK9cfWelTw6eZOzRrOm3omBS1sLKe6bsGF5QFxsd1k?=
 =?iso-8859-1?Q?wP76cRNeZL8ywZPy8K6qtvvJQvT8dsqF3/0lV16tbLN5FsNb2mYuHMir7u?=
 =?iso-8859-1?Q?lSB4autPpN2Lce0oKcwKsONtp4qeXKp0m0u81knCXZO+tymz34l0C7446Z?=
 =?iso-8859-1?Q?kJ/kQPYk5bdeyvEP78xoXTk5dy8v5z9LledmS9cMpsTkEB1zFb7hCTcSOG?=
 =?iso-8859-1?Q?EVqGYuSAXcsgfP3uypoaG7GEh2+5ZiZv9KgQKZEpBs64yP4bVpVJdvpRCG?=
 =?iso-8859-1?Q?hbcoLz5+B7Bfdpi0syaGx3KbV+XCCUkC6b86rtlgCqQSDIiCHWuQdsUQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cc8af347-138d-4c7d-6412-08db4c2919ab
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2023 22:52:41.2763 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cweZPyejm6vBqUTAsrhzdvP1sn4VZ1ucHJEGhfxAUzX7O/NKZmVjivV/4tFKADkUPLDl29G4xxM2pQYqqcXSNKWy/Ic3vC1rFgDhHIqbKIk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7978
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 1/2] drm/xe: Set default MOCS value for cs
 instructions
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

On Wed, May 03, 2023 at 09:30:12AM -0700, José Roberto de Souza wrote:
> CS instructions that dont have a explicit MOCS field will use this
> default MOCS value.
> 
> To do this, it was necessary to initialize part of the mocs earlier
> and add new function that loads another array of rtp entries set
> during run-time.
> 
> This is still missing to handle of mocs read for platforms with
> HAS_L3_CCS_READ(aka PVC).
> 
> This was mainly copied from i915 source code.
> 
> v2:
> - move to xe_hw_engine.c
> - remove CMD_CCTL auxiliary macros
> 
> v3:
> - rebased
> 
> Bspec: 45826
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: José Roberto de Souza <jose.souza@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/regs/xe_engine_regs.h | 12 ++++++++
>  drivers/gpu/drm/xe/xe_gt.c               |  2 ++
>  drivers/gpu/drm/xe/xe_hw_engine.c        | 35 ++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_mocs.c             | 11 ++++++--
>  drivers/gpu/drm/xe/xe_mocs.h             |  1 +
>  5 files changed, 59 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> index f6b3b99a562a6..717d560626cec 100644
> --- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> @@ -44,6 +44,18 @@
>  #define RING_EIR(base)				XE_REG((base) + 0xb0)
>  #define RING_EMR(base)				XE_REG((base) + 0xb4)
>  #define RING_ESR(base)				XE_REG((base) + 0xb8)
> +
> +#define RING_CMD_CCTL(base)			XE_REG((base) + 0xc4, XE_REG_OPTION_MASKED)
> +/*
> + * CMD_CCTL read/write fields take a MOCS value and _not_ a table index.
> + * The lsb of each can be considered a separate enabling bit for encryption.
> + * 6:0 == default MOCS value for reads  =>  6:1 == table index for reads.
> + * 13:7 == default MOCS value for writes => 13:8 == table index for writes.
> + * 15:14 == Reserved => 31:30 are set to 0.
> + */
> +#define   CMD_CCTL_WRITE_OVERRIDE_MASK		REG_GENMASK(13, 8)
> +#define   CMD_CCTL_READ_OVERRIDE_MASK		REG_GENMASK(6, 1)
> +
>  #define RING_BBADDR(base)			XE_REG((base) + 0x140)
>  #define RING_BBADDR_UDW(base)			XE_REG((base) + 0x168)
>  #define RING_EXECLIST_STATUS_LO(base)		XE_REG((base) + 0x234)
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 0d4664e344dac..603bb3ae3e370 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -390,6 +390,8 @@ static int gt_fw_domain_init(struct xe_gt *gt)
>  	/* Rerun MCR init as we now have hw engine list */
>  	xe_gt_mcr_init(gt);
>  
> +	xe_mocs_init_early(gt);
> +
>  	err = xe_hw_engines_init_early(gt);
>  	if (err)
>  		goto err_force_wake;
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index 566b62815dab5..d497f0289c372 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -21,6 +21,7 @@
>  #include "xe_macros.h"
>  #include "xe_mmio.h"
>  #include "xe_reg_sr.h"
> +#include "xe_rtp.h"
>  #include "xe_sched_job.h"
>  #include "xe_wa.h"
>  
> @@ -267,6 +268,39 @@ void xe_hw_engine_enable_ring(struct xe_hw_engine *hwe)
>  	hw_engine_mmio_read32(hwe, RING_MI_MODE(0).reg);
>  }
>  
> +static void
> +hw_engine_setup_default_state(struct xe_hw_engine *hwe)
> +{
> +	struct xe_gt *gt = hwe->gt;
> +	const u8 mocs_write_idx = gt->mocs.uc_index;
> +	/* TODO: missing handling of HAS_L3_CCS_READ platforms */
> +	const u8 mocs_read_idx = gt->mocs.uc_index;
> +	u32 ring_cmd_cctl_val = REG_FIELD_PREP(CMD_CCTL_WRITE_OVERRIDE_MASK, mocs_write_idx) |
> +			        REG_FIELD_PREP(CMD_CCTL_READ_OVERRIDE_MASK, mocs_read_idx);
> +	const struct xe_rtp_entry engine_was[] = {
> +		/*
> +		 * RING_CMD_CCTL specifies the default MOCS entry that will be
> +		 * used by the command streamer when executing commands that
> +		 * don't have a way to explicitly specify a MOCS setting.
> +		 * The default should usually reference whichever MOCS entry
> +		 * corresponds to uncached behavior, although use of a WB cached
> +		 * entry is recommended by the spec in certain circumstances on
> +		 * specific platforms.
> +		 */
> +		{ XE_RTP_NAME("RING_CMD_CCTL_default_MOCS"),
> +		  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, XE_RTP_END_VERSION_UNDEFINED)),
> +		  XE_RTP_ACTIONS(FIELD_SET(RING_CMD_CCTL(0),
> +					   CMD_CCTL_WRITE_OVERRIDE_MASK |
> +					   CMD_CCTL_READ_OVERRIDE_MASK,
> +					   ring_cmd_cctl_val,
> +					   XE_RTP_ACTION_FLAG(ENGINE_BASE)))
> +		},
> +		{}
> +	};
> +
> +	xe_rtp_process(engine_was, &hwe->reg_sr, gt, hwe);
> +}
> +
>  static void hw_engine_init_early(struct xe_gt *gt, struct xe_hw_engine *hwe,
>  				 enum xe_hw_engine_id id)
>  {
> @@ -293,6 +327,7 @@ static void hw_engine_init_early(struct xe_gt *gt, struct xe_hw_engine *hwe,
>  
>  	xe_reg_sr_init(&hwe->reg_sr, hwe->name, gt_to_xe(gt));
>  	xe_wa_process_engine(hwe);
> +	hw_engine_setup_default_state(hwe);
>  
>  	xe_reg_sr_init(&hwe->reg_whitelist, hwe->name, gt_to_xe(gt));
>  	xe_reg_whitelist_process_engine(hwe);
> diff --git a/drivers/gpu/drm/xe/xe_mocs.c b/drivers/gpu/drm/xe/xe_mocs.c
> index f2ceecd536ed0..0d07811a573f6 100644
> --- a/drivers/gpu/drm/xe/xe_mocs.c
> +++ b/drivers/gpu/drm/xe/xe_mocs.c
> @@ -518,6 +518,15 @@ static void init_l3cc_table(struct xe_gt *gt,
>  	}
>  }
>  
> +void xe_mocs_init_early(struct xe_gt *gt)
> +{
> +	struct xe_mocs_info table;
> +
> +	get_mocs_settings(gt->xe, &table);
> +	gt->mocs.uc_index = table.uc_index;
> +	gt->mocs.wb_index = table.wb_index;
> +}
> +
>  void xe_mocs_init(struct xe_gt *gt)
>  {
>  	struct xe_mocs_info table;
> @@ -528,8 +537,6 @@ void xe_mocs_init(struct xe_gt *gt)
>  	 */
>  	flags = get_mocs_settings(gt->xe, &table);
>  	mocs_dbg(&gt->xe->drm, "flag:0x%x\n", flags);
> -	gt->mocs.uc_index = table.uc_index;
> -	gt->mocs.wb_index = table.wb_index;
>  
>  	if (flags & HAS_GLOBAL_MOCS)
>  		__init_mocs_table(gt, &table, GLOBAL_MOCS(0).reg);
> diff --git a/drivers/gpu/drm/xe/xe_mocs.h b/drivers/gpu/drm/xe/xe_mocs.h
> index 63500a1d6660a..25f7b35a76daf 100644
> --- a/drivers/gpu/drm/xe/xe_mocs.h
> +++ b/drivers/gpu/drm/xe/xe_mocs.h
> @@ -11,6 +11,7 @@
>  struct xe_engine;
>  struct xe_gt;
>  
> +void xe_mocs_init_early(struct xe_gt *gt);
>  void xe_mocs_init(struct xe_gt *gt);
>  
>  /**
> -- 
> 2.40.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
