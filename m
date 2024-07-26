Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA88AC3DA49
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jul 2024 18:36:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7483B10E046;
	Fri, 26 Jul 2024 18:36:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ajVjmJNe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E67210E046
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Jul 2024 18:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722019013; x=1753555013;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=KXzsNe8u0LVrmto+xwEc3F8L7MQQaWJ3BNxCpj3Bhck=;
 b=ajVjmJNe1gC4oFRO6XqCAagEr7nlRBMMrgjrJRkKCTsk3pX3DK+R/Sdb
 tFBMQEx777d+6rZZmnsbxjUFks08BQWQ45RrdJP9ITTw7yggERSZAWITU
 PzWZ7FFvJweE5ozm5C63lUcqz4aVKoG+GaVdcDr1DKNc+ZtobkYXL3M3+
 DJQW71ikNl+X5k9axFyuLxPpZkZLJl8Le0LAh+dsOLffbkjA1C3ppWraF
 0tmy4tIEadOjYjh3E2CcswJbEy3mC8Rl6InJ+HXYGoyUfxsOIhLVvVhc9
 PnSEUgEHN0Qu9qHh+E2BXKYlQbSvkc6EUvVPfgXzIoU3E7zzqkCwWWcKB w==;
X-CSE-ConnectionGUID: leBbZXEDSWK6vTD/AopT4Q==
X-CSE-MsgGUID: 8Ix6cLyvQoyQvWNvJFxJ3g==
X-IronPort-AV: E=McAfee;i="6700,10204,11145"; a="19627172"
X-IronPort-AV: E=Sophos;i="6.09,239,1716274800"; d="scan'208";a="19627172"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2024 11:36:53 -0700
X-CSE-ConnectionGUID: vaNGQlaCQ5a9YLtmVjSSjA==
X-CSE-MsgGUID: ItAxV+RNQ2OptbYqF1d08A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,239,1716274800"; d="scan'208";a="57923120"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Jul 2024 11:36:53 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 26 Jul 2024 11:36:52 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 26 Jul 2024 11:36:52 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.172)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 26 Jul 2024 11:36:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xbhuwLlgd4g6tqLaWZ9qKC09sRPBYD5VmaBVMKUYa2jnSBmosOnp0jiewScyOnd5YNKL71Gi0AuG+pnw7dxA0+lL8vjZaHOFyT9K92eOv2mImtFES7K4AV0J2D3aOYsFTc4FJCwByjplsqL61xTdUGaPNt1sO8u73O5TZ7W/pfzsrtQsE5KWtycIHLsz7jH4ju4gyIi949+VzPmiufMwBRReB2rx8UGRtuAA8P75oU65kGJruXn0qxG/0Wm/qUhs0hzmZC1i6e3sFFmjOBEo9/ZPp99yJR3YAHdRugjUdEytnUwLLNEL8XtYVk3VRzycx2dDsdde2P/+T0b0bKhYYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bY9yMOWkrfhzC8sngbS+XZO77nWHiGYSyjGIyfjT5FA=;
 b=H+nEN9XMa8KjA/Kp8o1DpqQzYtxbURLtsPN3m60R5+Tr7aXtY3W3sUXhXRW4cahasst92bWmWu/cc9zc0i7LhCV/3WYTPzEboPnoOMVNbGRixauzJfrJ/5MIb9zvbQY/bDg9tg44bzWYmy6LtbCAN9juuHl8wXwtg7a23TwQwyE1uGnjoMmjN7HPFVDdGWTaoIUpRGuNv5VWytFRHVNhekA4lyMDyiWEjoy/07W32D7T4iBnI5Nm+x7ftkqb99Rn8iRThP7R6wQqqTFEiKnyjLkH6hYwGk/VaIlbuu5W2w/8MnYi51hJtVLDsxfSSKXVW/JSHpOV9dLzGhTZ7krytQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SN7PR11MB6945.namprd11.prod.outlook.com (2603:10b6:806:2a8::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.19; Fri, 26 Jul
 2024 18:36:43 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7784.020; Fri, 26 Jul 2024
 18:36:43 +0000
Date: Fri, 26 Jul 2024 18:35:52 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Mika Kuoppala <mika.kuoppala@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Dominik Grzegorzek
 <dominik.grzegorzek@intel.com>
Subject: Re: [PATCH 09/21] drm/xe: Add EUDEBUG_ENABLE exec queue property
Message-ID: <ZqPsiLqEZ5jMMyY8@DUT025-TGLU.fm.intel.com>
References: <20240726140818.54304-1-mika.kuoppala@linux.intel.com>
 <20240726140818.54304-10-mika.kuoppala@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240726140818.54304-10-mika.kuoppala@linux.intel.com>
X-ClientProxiedBy: BYAPR07CA0061.namprd07.prod.outlook.com
 (2603:10b6:a03:60::38) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SN7PR11MB6945:EE_
X-MS-Office365-Filtering-Correlation-Id: eaa5768a-389f-48e3-4d1e-08dcada1e57a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?hbT8qcyrf4wtB6FxZhSpY7OQI6ka7GpnsNdXjSdoHnqpCnU6OWw8d+ixjDEh?=
 =?us-ascii?Q?QABvbeGY4th7IIhb7Y4/2fPPYtqgGgm+INLjCj/nVEHoSo91nDs12P7PMeNw?=
 =?us-ascii?Q?C2QCl2Rb+P91mXEjREhs88OGFxq9sTAePPJTrf2sYouB+D8+mCoWE+0QRUdg?=
 =?us-ascii?Q?ZOd0tPbcLMiQe1g+PCNKab31dLruDgPX6VIm6tQodliQQBudfXwKM4aGfEyX?=
 =?us-ascii?Q?Q+51WmwpKM0NHruMHOWXNzk2EejaplgPtdjRNsLMORoFA1xVsM8Yg0vqGEYl?=
 =?us-ascii?Q?3VYAUOVARpIuMmwf/VpV1YVX+Rr4wrcpTQrVMrlwhSj7+OiRYmH38rtcDppN?=
 =?us-ascii?Q?dpHE4Z4Yj4BX6LQ2yeRO+P7iGWSsWoOZiP4bavDIQVO7CuiOuSuKkf7byeG4?=
 =?us-ascii?Q?IFsYvVz4OWevRtPpOBC3QdK9xY9fQ00HCKCLtfozVY1T+b/RPCNE0D7lHulA?=
 =?us-ascii?Q?MrkSvp6fVi5aOvJOGedD66obJmoAhaVLa2+8n1TQrQa5lJhwgY+yyyf5LTbQ?=
 =?us-ascii?Q?cs4D+G+SiYH6zGLOqLnzkAccggmFoBpKMaiq3pF2qMYBaHw3dOYlc7d055vl?=
 =?us-ascii?Q?IpN8qJ+37RIPSlYSR5X9QJqN1QSVkUpHWyI3XXrX/yWYVI5cg7RVjuj8zyAA?=
 =?us-ascii?Q?O/JheT3mcWaa7UlefWEHts2xs2FknXhY9LtadODgCQPNF49T4Qr3Mtv/WjM5?=
 =?us-ascii?Q?oXjvzf/DoUtaiMcee9Gs41jPNpSvsDzyEswWCNIVlFX2nXJYUtrZBUTb9egU?=
 =?us-ascii?Q?RcZUSp50fOlogm5CeVciNWQqyZc5CO1IQfkgjQqdu4DHinWoLmk3iIr4cimn?=
 =?us-ascii?Q?Kv2YCEt17Op+fNuf33yScAV5ulsqNYIZV/L9LaGfFdZXpDvMs8VQ2GPzD3IA?=
 =?us-ascii?Q?7Er+G5Ldze3owBYj8bcBZt9hP4IysmBmcyBod0JMZIGPzJ0Xvn5v/LvqyquL?=
 =?us-ascii?Q?zghEmdjbWln8wypzwHZ4J9rdibY0a5bokH9zO0/FgLHp5LCkMklGWINIGdQL?=
 =?us-ascii?Q?0PnOH1qEl5zUpgf9y0LS6SSUiRYz7OASbbK+ZWhNOXyv+yXvv5IMNE2WooGG?=
 =?us-ascii?Q?wds7d2T1GzHyvDZjDLrn+2Kcey4vDSU/Zw7YEjY52BPjt0ztgXEez8xB6YAs?=
 =?us-ascii?Q?YiyuTuf2xEY5XfpIzOejiCqqBbtopfU+QX45qm6oKqumMFNrpzfdWHA8oEyR?=
 =?us-ascii?Q?YYl1g0FYKYGb63+LY0H6Dx1rlbFlz6wz6gLdCD2MmdnMjLoWj62Bb1gXqkeF?=
 =?us-ascii?Q?588JmY7f3QC+jPB1upIBE+u4tJ8gTkUr4vo1riNmlaGJrK7YU34S4t77DslJ?=
 =?us-ascii?Q?6bBQwh0Zc4+CsT/pNvX6BtxXryGp8DgT2klqjG2Pago+/g=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?r6Rqf8Lhg9e2wvaheAooerEhsscnejeJzOo4lGbjWXhfQKshUjOCzARS7yE5?=
 =?us-ascii?Q?aX7HoyAQ6x+MyikTe/Nyl+dCUQruSNK32vTPzQPY8d7mp/eu1Zb9cYigZxXT?=
 =?us-ascii?Q?h1HMiQw5nKlqihPEbS1+1ROdFtNyyG/+I5JAtVP3a2B/D6bi/fj+LBKLZWaZ?=
 =?us-ascii?Q?0xjSY3ic7X3FMhSuwKUG/7NSztE8USFSNLqW+V+hmXhTTE2BANNrnDTlUOXI?=
 =?us-ascii?Q?0YiC3Pvquvzto4e3UM0nEmr69V+O1fQ/ify4h5fdY2N9QMDasqjgDaJJSyS0?=
 =?us-ascii?Q?Qi+UfPIsS7fRdjQ/5/stKaDIOeTdtAEQcFtt2x9HCVOYBidBoa1LnH5xKSDO?=
 =?us-ascii?Q?PsPkP8gye9XvaqjQha6I8npycjJSi0WvhJ94NPQyciWYtyRpc7h6IUvSfOuB?=
 =?us-ascii?Q?F+cq5Kz1EZAj93YMD1qnWEB+PMYoSoetBA3xsChFK5Qwq2LfeNCqjUEEhJa1?=
 =?us-ascii?Q?EiUAco4v7EseoVfpUdGzUIq2EBtxz427EhNko6rtvTz7vOUg3kKvSPPJXaGY?=
 =?us-ascii?Q?Kgkalf72dh0dzwRv4vKv7qKDrchKTgKC/+o5/H8cg9iHaL/ILLSn0szvAdip?=
 =?us-ascii?Q?1Hwf54Ym9Ypkg9goTlhYJix00Zw6iRaLJTO93ezmbmRAkJRtiDqgWgp0CUyO?=
 =?us-ascii?Q?AzaKlKLeP+51mcA8+X0HV7qwe27Ucbjfz9VGxWi7hYoFzXKkYL1Qs4/JrWMa?=
 =?us-ascii?Q?WmyGyYpcSRKdSzOlMzxR8hxCWhhfUZF2hpWL6tUTkquhD88nDA6rtwf1Iwf/?=
 =?us-ascii?Q?Qqxn1e/LBXs7lei+RjnuHE1XquDcTI+dgQaNInnPvDWnQ/THbm2GmmCwQ1VQ?=
 =?us-ascii?Q?wU2mw//VSCgbXrChiQpLK+23O9Y2G2Y7wIutGQ4Q1QBYKlMuvGJdM7p+wGKu?=
 =?us-ascii?Q?d5U7JQGA7Qn19pCUbiWhmbzPJR+BtDLKkoQD5YUydStQS9zagXJa/vQNG57w?=
 =?us-ascii?Q?862/739MC/ULXxNjIYlLZXn8Jz4m+A6e2Ffx+nxbnSbpSj0DbVNVjAQzQ/QY?=
 =?us-ascii?Q?Ix6r/vkw8zlHOUEHA3NGdt7FyTEMdbqX/+vy0fAwTwkzsPrRhjdO0+cNPBZE?=
 =?us-ascii?Q?ONRbsWx6iGwcIUsLCSRWiovBGRET5/wd9gkO5yGcNkFTJ4wbGaAFT+g/w5fx?=
 =?us-ascii?Q?dVw7DYsc1c8CeWCQOW+ENyZTbga3OviqIoHRSup0aSzSF0oOKIbSPDt/eJ1J?=
 =?us-ascii?Q?KOSuujpr9mCpcf5TjrTc4fdZHquA/iaHxPFQ2tEMqAjTSHHV4zdLqFDh5eua?=
 =?us-ascii?Q?9zFPtixId/I2YoxzpsCT4afEQEbbavKo5TtFX/3PqLj5b7PSAUR6q5PSxD++?=
 =?us-ascii?Q?Avx07VKHzza4bjx/+WRSeAVG1tud5XWdsfX8NR2zg/KRcrxbL+rTUjMgu1Fh?=
 =?us-ascii?Q?ch6usFpZJ9qEi8YtiCyF57LRs+cnppStrxk1x4U52bk0iISZBCIl/FgzbVnC?=
 =?us-ascii?Q?3KA9GEs76BnyPtA1CFcpvcO7bc4ChiVYNzghNTUJSRbnOlMSC59ytp1yQE9K?=
 =?us-ascii?Q?7aVfRQQNT9FwE77gfeRXeqS3OO4KHwg+BU/lQBTIaL5ZAQkHGnvsoznBWEPT?=
 =?us-ascii?Q?q/nXoS59aEJDUxKBU/aUT5fe87H7Q5odoJ3Cw20Qu9TcRalEouYKH0/FVmee?=
 =?us-ascii?Q?eg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: eaa5768a-389f-48e3-4d1e-08dcada1e57a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2024 18:36:43.2689 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RccNZIJU9Pq8yvgoiieQrTjdsGQ1Z001c96LtW7+WcR/yVc7DazG8wAsFyc+j25XnU8coYHZkxG/S2Qmf4HlMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6945
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

On Fri, Jul 26, 2024 at 05:08:06PM +0300, Mika Kuoppala wrote:
> From: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
> 
> Introduce exec queue immutable property of eudebug
> with a flags as value to enable eudebug specific feature(s).
> 
> For now engine lrc will use this flag to set up runalone
> hw feature. Runalone is used to ensure that only one hw engine
> of group [rcs0, ccs0-3] is active on a tile.
> 
> Note: unlike the i915, xe allows user to set runalone
> also on devices with single render/compute engine. It should not
> make much difference, but leave control to the user.
> 
> v2: use exec queue flags (Mika)
> v3: eudebug enable as flags (Mika)
> v4: adapt to lrc_create (Mika)
> v5: EUDEBUG property space squash (Mika)
> v6: runalone as rmw (Dominik)
> 
> Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
> Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_engine_regs.h |  1 +
>  drivers/gpu/drm/xe/xe_exec_queue.c       | 35 ++++++++++++++++++++++--
>  drivers/gpu/drm/xe/xe_exec_queue_types.h |  7 +++++
>  drivers/gpu/drm/xe/xe_hw_engine.c        |  2 +-
>  drivers/gpu/drm/xe/xe_lrc.c              | 16 +++++++++--
>  drivers/gpu/drm/xe/xe_lrc.h              |  4 ++-
>  include/uapi/drm/xe_drm.h                |  3 +-
>  7 files changed, 60 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> index fd31f3fb2b4c..764c270599d0 100644
> --- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> @@ -136,6 +136,7 @@
>  #define	  CTX_CTRL_OAC_CONTEXT_ENABLE		REG_BIT(8)
>  #define	  CTX_CTRL_RUN_ALONE			REG_BIT(7)
>  #define	  CTX_CTRL_INDIRECT_RING_STATE_ENABLE	REG_BIT(4)
> +#define	  CTX_CTRL_RUN_ALONE			REG_BIT(7)
>  #define	  CTX_CTRL_INHIBIT_SYN_CTX_SWITCH	REG_BIT(3)
>  #define	  CTX_CTRL_ENGINE_CTX_RESTORE_INHIBIT	REG_BIT(0)
>  
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 26ae2fdbf682..bc2edade5e5b 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -106,10 +106,14 @@ static struct xe_exec_queue *__xe_exec_queue_alloc(struct xe_device *xe,
>  
>  static int __xe_exec_queue_init(struct xe_exec_queue *q)
>  {
> +	u32 flags = 0;
>  	int i, err;
>  
> +	if (q->eudebug_flags & EXEC_QUEUE_EUDEBUG_FLAG_ENABLE)
> +		flags |= LRC_CREATE_RUNALONE;
> +
>  	for (i = 0; i < q->width; ++i) {
> -		q->lrc[i] = xe_lrc_create(q->hwe, q->vm, SZ_16K);
> +		q->lrc[i] = xe_lrc_create(q->hwe, q->vm, SZ_16K, flags);
>  		if (IS_ERR(q->lrc[i])) {
>  			err = PTR_ERR(q->lrc[i]);
>  			goto err_lrc;
> @@ -336,6 +340,31 @@ static int exec_queue_set_timeslice(struct xe_device *xe, struct xe_exec_queue *
>  	return 0;
>  }
>  
> +static int exec_queue_set_eudebug(struct xe_device *xe, struct xe_exec_queue *q,
> +				  u64 value)
> +{
> +	const u64 known_flags = DRM_XE_EXEC_QUEUE_EUDEBUG_FLAG_ENABLE;
> +
> +	if (XE_IOCTL_DBG(xe, (q->class != XE_ENGINE_CLASS_RENDER &&
> +			      q->class != XE_ENGINE_CLASS_COMPUTE)))
> +		return -EINVAL;
> +

The EU debugger only works on LR VMs, right? i.e. We can't use
dma-fences with EU debugger enabled. If so, then I'd check the q->vm to
ensure it is in a support mode.

Matt

> +	if (XE_IOCTL_DBG(xe, (value & ~known_flags)))
> +		return -EINVAL;
> +
> +	/*
> +	 * We want to explicitly set the global feature if
> +	 * property is set.
> +	 */
> +	if (XE_IOCTL_DBG(xe,
> +			 !(value & DRM_XE_EXEC_QUEUE_EUDEBUG_FLAG_ENABLE)))
> +		return -EINVAL;
> +
> +	q->eudebug_flags = EXEC_QUEUE_EUDEBUG_FLAG_ENABLE;
> +
> +	return 0;
> +}
> +
>  typedef int (*xe_exec_queue_set_property_fn)(struct xe_device *xe,
>  					     struct xe_exec_queue *q,
>  					     u64 value);
> @@ -343,6 +372,7 @@ typedef int (*xe_exec_queue_set_property_fn)(struct xe_device *xe,
>  static const xe_exec_queue_set_property_fn exec_queue_set_property_funcs[] = {
>  	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY] = exec_queue_set_priority,
>  	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE] = exec_queue_set_timeslice,
> +	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_EUDEBUG] = exec_queue_set_eudebug,
>  };
>  
>  static int exec_queue_user_ext_set_property(struct xe_device *xe,
> @@ -362,7 +392,8 @@ static int exec_queue_user_ext_set_property(struct xe_device *xe,
>  			 ARRAY_SIZE(exec_queue_set_property_funcs)) ||
>  	    XE_IOCTL_DBG(xe, ext.pad) ||
>  	    XE_IOCTL_DBG(xe, ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY &&
> -			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE))
> +			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE &&
> +			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_EUDEBUG))
>  		return -EINVAL;
>  
>  	idx = array_index_nospec(ext.property, ARRAY_SIZE(exec_queue_set_property_funcs));
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> index 1408b02eea53..48e1190c2b58 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> @@ -90,6 +90,13 @@ struct xe_exec_queue {
>  	 */
>  	unsigned long flags;
>  
> +	/**
> +	 * @eudebug_flags: immutable eudebug flags for this exec queue.
> +	 * Set up with DRM_XE_EXEC_QUEUE_SET_PROPERTY_EUDEBUG.
> +	 */
> +#define EXEC_QUEUE_EUDEBUG_FLAG_ENABLE		BIT(0)
> +	unsigned long eudebug_flags;
> +
>  	union {
>  		/** @multi_gt_list: list head for VM bind engines if multi-GT */
>  		struct list_head multi_gt_list;
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index 0d8b871b47fe..74813bc20787 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -532,7 +532,7 @@ static int hw_engine_init(struct xe_gt *gt, struct xe_hw_engine *hwe,
>  		goto err_name;
>  	}
>  
> -	hwe->kernel_lrc = xe_lrc_create(hwe, NULL, SZ_16K);
> +	hwe->kernel_lrc = xe_lrc_create(hwe, NULL, SZ_16K, 0);
>  	if (IS_ERR(hwe->kernel_lrc)) {
>  		err = PTR_ERR(hwe->kernel_lrc);
>  		goto err_hwsp;
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index 94ff62e1d95e..563b57f5b9ee 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -890,7 +890,7 @@ static void xe_lrc_finish(struct xe_lrc *lrc)
>  #define PVC_CTX_ACC_CTR_THOLD	(0x2a + 1)
>  
>  static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
> -		       struct xe_vm *vm, u32 ring_size)
> +		       struct xe_vm *vm, u32 ring_size, u32 flags)
>  {
>  	struct xe_gt *gt = hwe->gt;
>  	struct xe_tile *tile = gt_to_tile(gt);
> @@ -1007,6 +1007,16 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>  	map = __xe_lrc_start_seqno_map(lrc);
>  	xe_map_write32(lrc_to_xe(lrc), &map, lrc->fence_ctx.next_seqno - 1);
>  
> +	if (flags & LRC_CREATE_RUNALONE) {
> +		u32 ctx_control = xe_lrc_read_ctx_reg(lrc, CTX_CONTEXT_CONTROL);
> +
> +		drm_dbg(&xe->drm, "read CTX_CONTEXT_CONTROL: 0x%x\n", ctx_control);
> +		ctx_control |= _MASKED_BIT_ENABLE(CTX_CTRL_RUN_ALONE);
> +		drm_dbg(&xe->drm, "written CTX_CONTEXT_CONTROL: 0x%x\n", ctx_control);
> +
> +		xe_lrc_write_ctx_reg(lrc, CTX_CONTEXT_CONTROL, ctx_control);
> +	}
> +
>  	return 0;
>  
>  err_lrc_finish:
> @@ -1026,7 +1036,7 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>   * upon failure.
>   */
>  struct xe_lrc *xe_lrc_create(struct xe_hw_engine *hwe, struct xe_vm *vm,
> -			     u32 ring_size)
> +			     u32 ring_size, u32 flags)
>  {
>  	struct xe_lrc *lrc;
>  	int err;
> @@ -1035,7 +1045,7 @@ struct xe_lrc *xe_lrc_create(struct xe_hw_engine *hwe, struct xe_vm *vm,
>  	if (!lrc)
>  		return ERR_PTR(-ENOMEM);
>  
> -	err = xe_lrc_init(lrc, hwe, vm, ring_size);
> +	err = xe_lrc_init(lrc, hwe, vm, ring_size, flags);
>  	if (err) {
>  		kfree(lrc);
>  		return ERR_PTR(err);
> diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
> index c24542e89318..d2429a26fb22 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.h
> +++ b/drivers/gpu/drm/xe/xe_lrc.h
> @@ -22,8 +22,10 @@ struct xe_vm;
>  
>  #define LRC_PPHWSP_SCRATCH_ADDR (0x34 * 4)
>  
> +#define LRC_CREATE_RUNALONE     BIT(0)
> +
>  struct xe_lrc *xe_lrc_create(struct xe_hw_engine *hwe, struct xe_vm *vm,
> -			     u32 ring_size);
> +			     u32 ring_size, u32 flags);
>  void xe_lrc_destroy(struct kref *ref);
>  
>  /**
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index a68734ff12f4..61c4c061bd75 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -1110,7 +1110,8 @@ struct drm_xe_exec_queue_create {
>  #define DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY		0
>  #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY		0
>  #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE		1
> -
> +#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_EUDEBUG		2
> +#define     DRM_XE_EXEC_QUEUE_EUDEBUG_FLAG_ENABLE		(1 << 0)
>  	/** @extensions: Pointer to the first extension struct, if any */
>  	__u64 extensions;
>  
> -- 
> 2.34.1
> 
