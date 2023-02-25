Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EC82C6FA8E
	for <intel-xe@archiver.kernel.org>; Sat, 25 Feb 2023 00:27:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CC6010EDA0;
	Sat, 25 Feb 2023 00:27:07 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73DE010EE1B
 for <intel-xe@lists.freedesktop.org>; Sat, 25 Feb 2023 00:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677284824; x=1708820824;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=r1eJ6XKFLXKgvxh7dvS2XDHBnZN2NBHNWCJZKDiL4VE=;
 b=ZWnOQpxhAyufu8X2uazkB75blyf6H/MJAc4wtOQKGmnBwiL5gk+xftoR
 wMs6hSYHHJe24qjyIGUCtfoW2m+D/9oe0KghfW9MCYj0YN/wfQSxPLM1D
 VTkbDsDnkOmDg/h0ZBrSh/vFW3IS5kmzzUfAZXNOtJq6Pthjpj+pzRFv9
 5654st+T8ZAl9fsLP9ZXUSRqGo7nnfqeWmOkZsrfY3eyRM/tCh+yJG3Yk
 f+ntVmddskA9I0A3Yj0gw8Uk2o8rQe3Kr4h6Ml3bvLYWot3QCEg0nrUwA
 juH+7PjLzg+IbcllSLtAJDu7o3g+oq5OHYldKuXaKmSLBhW+L0SfKOflu g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="313247317"
X-IronPort-AV: E=Sophos;i="5.97,326,1669104000"; d="scan'208";a="313247317"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2023 16:27:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="918589858"
X-IronPort-AV: E=Sophos;i="5.97,326,1669104000"; d="scan'208";a="918589858"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga006.fm.intel.com with ESMTP; 24 Feb 2023 16:27:04 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 24 Feb 2023 16:27:03 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 24 Feb 2023 16:27:03 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 24 Feb 2023 16:27:03 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.47) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Fri, 24 Feb 2023 16:27:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c4HicNLewcFdMVx4Cna/3oYJ40koPpkVNQrC+dFVsqwDedlysafQnS06my31SXVoCuEIyCmckyScxa+HOrwLkSNvxisTefa0K4nBS0/Q4oFesryjIQ5p+tSNLvSkELLYtD5iPs1NjzzL2ihxMBYtSgnLfrhKwT/m9c757tONA/6zDF/SQHnfCy5hmunaAx2SKTg3sF0kqG68jtAuGfoVSh190uWAL/7EprvGr9d9a3CPQXKG51ghdVhse+Ij2unJkidMFpdc6xTf9bahfh6pMaOrLhE72SJrbTy5WBDhMnw0nZviX45GRap5ax9MHGR0KlCNlEu3wEue4RLRX6LgIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ltQE2ViHhda91B/09dpN1U90JgEWuOtRxphEH1zhPlU=;
 b=FiAhfT+mXrH/tw5zXZ5nH7KugwaPo2fgOEny2Y8KApoFGAfYaNu/MpEuusa/1aJSh7xHwQOB7uWEULEqL04VG1TGBy9i+ibtZjk09kVmXgMEizjzxu2z/Mn51I+e3W7tjr1jf/I+82fZ0wo1+mDRJvoz4OB+EGMmPoKfXajXpLDWz7ahxulgwyBpAQe87Uae/KV+GIkQlsq55vsOTiTy+eITg/zuZqOYx9roFrFDae5lEdhufcqzne0d7UJVcnX1h3i9NZoJoXhwxnkbdYy8zGf94NOSWh+n6Az+fISZVpY6rc9z2fesr9/a3aEP8Pea6YF0PhLv67fDgA/ycbHgtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 DM4PR11MB6479.namprd11.prod.outlook.com (2603:10b6:8:8c::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6134.24; Sat, 25 Feb 2023 00:27:00 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::7333:f4b:7dbb:36b]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::7333:f4b:7dbb:36b%7]) with mapi id 15.20.6134.024; Sat, 25 Feb 2023
 00:27:00 +0000
Date: Fri, 24 Feb 2023 16:26:57 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <Y/lV0SNeBZnJtc7m@mdroper-desk1.amr.corp.intel.com>
References: <20230225001548.1743820-1-lucas.demarchi@intel.com>
 <20230225001548.1743820-7-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230225001548.1743820-7-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0PR03CA0185.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::10) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|DM4PR11MB6479:EE_
X-MS-Office365-Filtering-Correlation-Id: e446429f-ee61-4f4b-56f7-08db16c7028d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: v1f2o/R+fUPQLm+rNGaIJg9mo7MhoE0qVTIbjKveff+UFBZAYgpUnemBlE5kN7Vizoo5RblC3vHA8SYvB1t4hlA0ftsesznjIzTOgkku6Q0HB2SzT8017HziV8AEzn31X2y3rkdClc/F/IgcjUhvGV5RXF8fX+VId4B0CTs1UPkkzby/+WuirnANh70mktr2e2Q+JQRMoSYp3DZAsvuMDkm+D1GKJDffO4EtROFAZ8fY7nQpEELFNbWSIPVJ5Rt43KDSEngDVmxyvJd6O3HxL0Z4vZAAZ2hqezqP5Ov9WFvZF8Zt5f7+guEP4vlI8gGH/WMjVjM0HFLh+6e7SUTrV48v9Cc3yeiAN64SMh1YgUo2pfDDQI4Xlb4nVAzbAEi//VZxebhO7KjsKi/ylnst9/6IYcuWLZieuuawD7WaOfr1KzKlGrxhzPvIw0HqAA+At04aRpbscODE2/EU2alDbtAv659NU597EL2mYRS2OJEpshTJHiIpFPjEnYjFuUW/SHhmAwBbPE0kWcv3hQm2RBux3Ws1+ycVdWNqCX6zDPXjicsPYEfDTwqaIXBpGfcB/v5aSC67BhixIZGDN5q/hwvOLWfrgnbPhIl2Q9Myn8uK8/XjRsZ0xD+QelWBjkHN3S3EvOed4EU/Vyb8fSdIKA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(136003)(39860400002)(366004)(376002)(346002)(396003)(451199018)(83380400001)(2906002)(107886003)(6666004)(6512007)(6506007)(54906003)(6636002)(478600001)(41300700001)(8936002)(6862004)(6486002)(86362001)(82960400001)(186003)(26005)(66476007)(4326008)(5660300002)(8676002)(66556008)(66946007)(316002)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?OWUxWGyYbWIQIRBZsml6Hr5K0krmx+HBoofSJP/Uz/bzuxUWZFPjqlcP/T?=
 =?iso-8859-1?Q?jov+9Cao5xjHanOjJbryPYfaVZ4xrVIlQlW8R9f+NKqOVjDk1Tec5ua5cr?=
 =?iso-8859-1?Q?8Nk/n1BkuScbZ8FdrGrD4moziGwPscPQq0gDtyyb34TOR45CSBXR3nE1aM?=
 =?iso-8859-1?Q?5oX5GM455+8/t77hd+jfcLK7da1OOvJZK/biaZtij9BxtMNq1aNsQ/S7xv?=
 =?iso-8859-1?Q?Mp6PCmjonZklg+Hw1b01QjoJV048K69ZJFftgFFZUZTY7SVPRZQkKXPOuE?=
 =?iso-8859-1?Q?nV8pvv0Vf4nT09CsMcG/oiViCJ/wn5TiiYibcoKRYlzkmzIaHLkI7X+pOn?=
 =?iso-8859-1?Q?/WlNr8TvqbgtaLH1hCtaM6Zh8197a1bkL7DlIePyS8CWK53bR07xL8+nAQ?=
 =?iso-8859-1?Q?xo+dll/eeifs0uUe5A3zTqqF+dlXR6D3NNB1AQ3KXYQP9bvk+cHj/q+WN5?=
 =?iso-8859-1?Q?WSuQ+OlSMAOSJWdWAhTfco90tG6PL5c95D23SIRRQtloB45eR4UJPOfCJK?=
 =?iso-8859-1?Q?Uc0Ttp42Hj8LfsLadaz2dz/SwxgYEJoMEEggU/vQsimr9Be9ZIqcRvdOq/?=
 =?iso-8859-1?Q?Sy7BxeG4fsbnOOz18TErZ6tN3WmoK1kRLnQAnkd4pSRfq9aLNlFmPsczH1?=
 =?iso-8859-1?Q?Mqkv2vYAb1iHgi9yp0EyImX3cnK0lu8pa7UwUZkhwwPjdyIs2k2lzY+iS2?=
 =?iso-8859-1?Q?MpwP1F9GB4unPc7XPcua+K1hvhRNLH16iHJoXgipUF9v0kyZilA/5NDE2M?=
 =?iso-8859-1?Q?jGxP6yf11oFKnhC2Kk1Zx+HGNfJDygKssHXGkeKN09Pp7ZnBtZwYO1d1bE?=
 =?iso-8859-1?Q?C21eVKWD2wn2vZJYaQFselb9d1Ov7bwkNMrvBZoxNWotckCIL+aSPcEvNj?=
 =?iso-8859-1?Q?4S0xsjGMcIEkgm2WObt+eGj559krXTLq+JvF7bvSMkE1Qux21kf94LC0kt?=
 =?iso-8859-1?Q?jQ7d3SHz80+Ru9MwAhxgdTCkf5WhS6U/wrqIydvknnTA4xcsVrbBOki7j9?=
 =?iso-8859-1?Q?9p6nqIlpoT5JX+8vrNrQfkQBR1/bgfVLK5cquw+8LAz5zFjbGAC2/TKESy?=
 =?iso-8859-1?Q?x+sSlpjknxDRbjTZ9qyzZl4nbrsvrlyBGEcG1ILWbx0XJh6iDhK+MybsYQ?=
 =?iso-8859-1?Q?6jenPIq+ut/hjDT97x8L54JJhExXl4WuP7mpx0/8V+gcurofQpdLo2vuUo?=
 =?iso-8859-1?Q?TlPfxMyVd+wr6i3hmqruowGMF+pZ2MRKaZbMjEQByYYYEfss6HKDNYMU1W?=
 =?iso-8859-1?Q?OoXN8GLf6Kr+YfsJknZIWXJ/IpqjctttuiSMNK0PA60A9bOwEMcKDrfsHZ?=
 =?iso-8859-1?Q?oxq51TZCDvMu6paXAbCN5Z8v8mIE6UtJxShQsmVy9iuVpQsQHr+nqJ43go?=
 =?iso-8859-1?Q?rhPCuFstsiW2nbZ9hu3lV0nuSic5twSTuYSphjSqxmflksCruXbWQ7zMi8?=
 =?iso-8859-1?Q?R95ugrM92cwF/X97Aiv7LC/Z0A/drb+EEsF228vKFjNuGmfoz5sJiEr3pF?=
 =?iso-8859-1?Q?RClOpcPg+ODLsMPQMRHJZLa+RhMsISN38teGeR/cZU1LQtoRXHuKCmqYEA?=
 =?iso-8859-1?Q?/cCQPCy1y/pK3VnUacADKsQUOZ4OZJGn/tprll6hv+cotTSBMjryTNJmje?=
 =?iso-8859-1?Q?MCdfov95OGy5H0Q5GWl4827b7RBSh8aoay0o5dXIbtTym9DfuxSXXBBg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e446429f-ee61-4f4b-56f7-08db16c7028d
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2023 00:27:00.1740 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gI2ioOMyKVyZOnzIoYrgg/oEkq0fQA+RpyyZ09xSgWrjdnHwhlFqL732l2jIdK0jyiE5Vzoi3jPdAgFQVcjTaw3XWNgq75imtOPces+bKuk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6479
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v4 06/12] drm/xe: Remove dependency on
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

On Fri, Feb 24, 2023 at 04:15:42PM -0800, Lucas De Marchi wrote:
> Copy the macros used by xe in intel_gpu_commands.h to
> regs/xe_gpu_commands.h. PIPE_CONTROL_3D_ENGINE_FLAGS and
> PIPE_CONTROL_3D_ARCH_FLAGS were already defined in
> drivers/gpu/drm/xe/xe_ring_ops.c and only used there. So let that define
> to be used instead of also adding to the new header.
> 
> v2: Let PIPE_CONTROL_3D_ENGINE_FLAGS/PIPE_CONTROL_3D_ARCH_FLAGS in the
>     only .c that uses it instead of redefining (Matt Roper)
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

I assume that, like the register headers, we'll eventually come back and
clean this up a bit more.  For now we're just copying the important
definitions over from i915 as-is.

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/regs/xe_gpu_commands.h | 79 +++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_bb.c                |  3 +-
>  drivers/gpu/drm/xe/xe_device.h            |  3 +-
>  drivers/gpu/drm/xe/xe_execlist.c          |  2 +-
>  drivers/gpu/drm/xe/xe_lrc.c               |  2 +-
>  drivers/gpu/drm/xe/xe_migrate.c           |  3 +-
>  drivers/gpu/drm/xe/xe_ring_ops.c          | 49 +++++++-------
>  7 files changed, 109 insertions(+), 32 deletions(-)
>  create mode 100644 drivers/gpu/drm/xe/regs/xe_gpu_commands.h
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gpu_commands.h b/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
> new file mode 100644
> index 000000000000..288576035ce3
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
> @@ -0,0 +1,79 @@
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
> +#define MI_ARB_CHECK            MI_INSTR(0x05, 0)
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_bb.c b/drivers/gpu/drm/xe/xe_bb.c
> index d10448d1b4d7..5b24018e2a80 100644
> --- a/drivers/gpu/drm/xe/xe_bb.c
> +++ b/drivers/gpu/drm/xe/xe_bb.c
> @@ -5,6 +5,7 @@
>  
>  #include "xe_bb.h"
>  
> +#include "regs/xe_gpu_commands.h"
>  #include "xe_device.h"
>  #include "xe_engine_types.h"
>  #include "xe_hw_fence.h"
> @@ -12,8 +13,6 @@
>  #include "xe_sched_job.h"
>  #include "xe_vm_types.h"
>  
> -#include "gt/intel_gpu_commands.h"
> -
>  struct xe_bb *xe_bb_new(struct xe_gt *gt, u32 dwords, bool usm)
>  {
>  	struct xe_bb *bb = kmalloc(sizeof(*bb), GFP_KERNEL);
> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> index ed55ef567d18..263620953c3b 100644
> --- a/drivers/gpu/drm/xe/xe_device.h
> +++ b/drivers/gpu/drm/xe/xe_device.h
> @@ -11,12 +11,11 @@ struct xe_file;
>  
>  #include <drm/drm_util.h>
>  
> +#include "regs/xe_gpu_commands.h"
>  #include "xe_device_types.h"
>  #include "xe_force_wake.h"
>  #include "xe_macros.h"
>  
> -#include "gt/intel_gpu_commands.h"
> -
>  static inline struct xe_device *to_xe_device(const struct drm_device *dev)
>  {
>  	return container_of(dev, struct xe_device, drm);
> diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
> index ba9f72694277..59cfbeec09d1 100644
> --- a/drivers/gpu/drm/xe/xe_execlist.c
> +++ b/drivers/gpu/drm/xe/xe_execlist.c
> @@ -8,6 +8,7 @@
>  #include <drm/drm_managed.h>
>  
>  #include "regs/xe_engine_regs.h"
> +#include "regs/xe_gpu_commands.h"
>  #include "regs/xe_gt_regs.h"
>  #include "regs/xe_lrc_layout.h"
>  #include "xe_bo.h"
> @@ -22,7 +23,6 @@
>  #include "xe_ring_ops_types.h"
>  #include "xe_sched_job.h"
>  
> -#include "gt/intel_gpu_commands.h"
>  #include "i915_reg.h"
>  
>  #define XE_EXECLIST_HANG_LIMIT 1
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index 5baa3cf53852..4435ec750489 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -6,6 +6,7 @@
>  #include "xe_lrc.h"
>  
>  #include "regs/xe_engine_regs.h"
> +#include "regs/xe_gpu_commands.h"
>  #include "regs/xe_gt_regs.h"
>  #include "regs/xe_lrc_layout.h"
>  #include "xe_bo.h"
> @@ -16,7 +17,6 @@
>  #include "xe_map.h"
>  #include "xe_vm.h"
>  
> -#include "gt/intel_gpu_commands.h"
>  #include "i915_reg.h"
>  
>  #define GEN8_CTX_VALID				(1 << 0)
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index a3f35fec1b67..6c0033cb238f 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -11,6 +11,7 @@
>  #include <drm/ttm/ttm_tt.h>
>  #include <drm/xe_drm.h>
>  
> +#include "regs/xe_gpu_commands.h"
>  #include "xe_bb.h"
>  #include "xe_bo.h"
>  #include "xe_engine.h"
> @@ -27,8 +28,6 @@
>  #include "xe_trace.h"
>  #include "xe_vm.h"
>  
> -#include "gt/intel_gpu_commands.h"
> -
>  /**
>   * struct xe_migrate - migrate context.
>   */
> diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
> index 276fc9691986..16c56d0a9bb0 100644
> --- a/drivers/gpu/drm/xe/xe_ring_ops.c
> +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
> @@ -5,6 +5,7 @@
>  
>  #include "xe_ring_ops.h"
>  
> +#include "regs/xe_gpu_commands.h"
>  #include "regs/xe_gt_regs.h"
>  #include "regs/xe_lrc_layout.h"
>  #include "xe_engine_types.h"
> @@ -14,9 +15,32 @@
>  #include "xe_sched_job.h"
>  #include "xe_vm_types.h"
>  
> -#include "gt/intel_gpu_commands.h"
>  #include "i915_reg.h"
>  
> +/*
> + * 3D-related flags that can't be set on _engines_ that lack access to the 3D
> + * pipeline (i.e., CCS engines).
> + */
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
> +
> +/* 3D-related flags that can't be set on _platforms_ that lack a 3D pipeline */
> +#define PIPE_CONTROL_3D_ARCH_FLAGS ( \
> +		PIPE_CONTROL_3D_ENGINE_FLAGS | \
> +		PIPE_CONTROL_INDIRECT_STATE_DISABLE | \
> +		PIPE_CONTROL_FLUSH_ENABLE | \
> +		PIPE_CONTROL_TEXTURE_CACHE_INVALIDATE | \
> +		PIPE_CONTROL_DC_FLUSH_ENABLE)
> +
> +
>  static u32 preparser_disable(bool state)
>  {
>  	return MI_ARB_CHECK | BIT(8) | state;
> @@ -181,29 +205,6 @@ static void __emit_job_gen12_video(struct xe_sched_job *job, struct xe_lrc *lrc,
>  	xe_lrc_write_ring(lrc, dw, i * sizeof(*dw));
>  }
>  
> -/*
> - * 3D-related flags that can't be set on _engines_ that lack access to the 3D
> - * pipeline (i.e., CCS engines).
> - */
> -#define PIPE_CONTROL_3D_ENGINE_FLAGS (\
> -		PIPE_CONTROL_RENDER_TARGET_CACHE_FLUSH | \
> -		PIPE_CONTROL_DEPTH_CACHE_FLUSH | \
> -		PIPE_CONTROL_TILE_CACHE_FLUSH | \
> -		PIPE_CONTROL_DEPTH_STALL | \
> -		PIPE_CONTROL_STALL_AT_SCOREBOARD | \
> -		PIPE_CONTROL_PSD_SYNC | \
> -		PIPE_CONTROL_AMFS_FLUSH | \
> -		PIPE_CONTROL_VF_CACHE_INVALIDATE | \
> -		PIPE_CONTROL_GLOBAL_SNAPSHOT_RESET)
> -
> -/* 3D-related flags that can't be set on _platforms_ that lack a 3D pipeline */
> -#define PIPE_CONTROL_3D_ARCH_FLAGS ( \
> -		PIPE_CONTROL_3D_ENGINE_FLAGS | \
> -		PIPE_CONTROL_INDIRECT_STATE_DISABLE | \
> -		PIPE_CONTROL_FLUSH_ENABLE | \
> -		PIPE_CONTROL_TEXTURE_CACHE_INVALIDATE | \
> -		PIPE_CONTROL_DC_FLUSH_ENABLE)
> -
>  static void __emit_job_gen12_render_compute(struct xe_sched_job *job,
>  					    struct xe_lrc *lrc,
>  					    u64 batch_addr, u32 seqno)
> -- 
> 2.39.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
