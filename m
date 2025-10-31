Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B6A6CCF9FE
	for <intel-xe@archiver.kernel.org>; Fri, 31 Oct 2025 12:49:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C16C310EB43;
	Fri, 31 Oct 2025 12:49:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cejdwYOY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10FE010EB32
 for <intel-xe@lists.freedesktop.org>; Fri, 31 Oct 2025 12:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761914961; x=1793450961;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=846yBfKZxlwxJA3c+4qOEuilBFyWPhs+WMznLNP9BHA=;
 b=cejdwYOYOkzMdu27rmhe1J9UCfmAqfjzC8Lk4BcO3EvlHXNoiX7dfrjm
 nVK8lYG/psh6sqPGBGiSXX5U3hQRwTuCoKytcFDzKAq750gbaGrfC5Y+S
 +tyB38odfoX8IIc/4HPLk+Xx2KWmSCXqr2YpTOzqE0GJNFGFrf1jH7zwZ
 DyJw7dJYDWXZA7S1hvapbTshetH13CAokWlIrf+xn8FoEcBWrZNHGXPtP
 IkmoKjSzpqoDVn2NamDy6E5K+Ja5M6GJsnfvsggXlv1nXeruZ+jKuuapg
 2O++1snGTkHuDcucABhG+vUjHSXg+p26DLwVzID53M6Pqhtx081Tly3sm Q==;
X-CSE-ConnectionGUID: 41T8BteXQpyYpqJgxs4k7A==
X-CSE-MsgGUID: PWaq/pACTp6ALnGg4FO3Gg==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="64225875"
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; d="scan'208";a="64225875"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 05:49:21 -0700
X-CSE-ConnectionGUID: m7YtP1ZzRP+vpzlNE2wOag==
X-CSE-MsgGUID: mFWbAuskTh6Ex3C3sfJazA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; d="scan'208";a="190311028"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 05:49:21 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 31 Oct 2025 05:49:20 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 31 Oct 2025 05:49:20 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.37) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 31 Oct 2025 05:49:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=knALoR7XXKORZo8XLBLlAFii8UA1opfTEwAh3S2vYGsfhuumTVTDCmcZSpi5uadcx/q0UKAjWIjvalVr03ISrybInConmw24I/OA7TyNTbKuyeg5oqhlAyJ5xzKrbKusynbAgL4X+gGYeOlY6SZ0TLan1P8nKa5dnVm4flHmrTxePa+Etcl7YvZn8FwDuCOkoBK1uDDb0g0IxMOIOcEvCOJ3eGs2URUBFzCooY+QDT8bUTczCereUDNgNmtrWiy7G0udjiao8rePBIfmo8VULoMGTnKUeCxT1WqdocFQ4Te1aQYmQrKpY/BbbQu89Ah7WNCEkTApfbG8ZqC24G2T4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kygvEnKyqx7iVIeHy9h3BHMKwZqa/T1zuNQJfl6fLrI=;
 b=ud5hpIQhTRqSFn+793WH0f3wUNEC5yg+5vyirjw+PWTCFrnPPqDW/UsfoDqMxQM1HmcOfV9O3yMZCs6u+HT/SyQkZHeVmMx+bVkQtEkvoOnsS/Z7ekGHio8SpJjedCeOWJRKzIgb6ubWcOKvdqVVp5nNtvWY3cBrfpKv1nKlzmCZwQyj9dshuaSZcac4zGJF6ODnTPcqrKd8J8VHUf5gKpnpqd2SZEPHq1TBXQUjCopmtOEpJmTFrWCAqpqoaN2Gha6tN2EHEacw7Nk+tt9oKIxj/pBc8XpGxvdeFPXpceFNrTVxQAYWW8jgHSc/QvkNiDF8d4BOnwU6GTzuJ7sTmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by SJ1PR11MB6202.namprd11.prod.outlook.com (2603:10b6:a03:45b::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Fri, 31 Oct
 2025 12:49:18 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9275.013; Fri, 31 Oct 2025
 12:49:17 +0000
Date: Fri, 31 Oct 2025 08:49:14 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
CC: Maarten Lankhorst <dev@lankhorst.se>, <intel-xe@lists.freedesktop.org>,
 Jani Nikula <jani.nikula@intel.com>
Subject: Re: [FOR CI 8/8] drm/i915/display: Use intel_de_write_fw in
 intel_pipe_fastset
Message-ID: <aQSwSmSvXXqVle0v@intel.com>
References: <20251030184710.359870-1-dev@lankhorst.se>
 <20251030184710.359870-9-dev@lankhorst.se>
 <176185045446.3303.6205563147139756281@intel.com>
 <411769c1-d90c-418b-bd3d-30ed434d6285@lankhorst.se>
 <176185593644.3303.41997236546217622@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <176185593644.3303.41997236546217622@intel.com>
X-ClientProxiedBy: BYAPR08CA0062.namprd08.prod.outlook.com
 (2603:10b6:a03:117::39) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|SJ1PR11MB6202:EE_
X-MS-Office365-Filtering-Correlation-Id: d6f0a813-20e4-4c7e-4b30-08de187be75d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?p7qb3xTdwd9/GArEm5cKjZOxucD4Wkd1FBTTnfMDKpQ1dYYD6ab76GMrryAQ?=
 =?us-ascii?Q?dCJwkNr46d1LWhp2a9CdH5amKtcG1WZ7/2lXk/tozSZ696WUu7Pp+6NQZAPp?=
 =?us-ascii?Q?+fzGpzdzXjgNlI65m3vXpaObKNiw8TKX4pzBIat19TCTgMYiV+y1U7+BQKSH?=
 =?us-ascii?Q?8Jd9T4o1VwO50y/TYcOydXdZtKqSzrNQlejaiTAtHRwujMZ9Va0+F33QQcxE?=
 =?us-ascii?Q?QIIXec3BsSAmfuJXbxxMZ5VLbkPDmbzlVLWThRnWtdCuqc5zgQqFSC8WqOg6?=
 =?us-ascii?Q?PRYDVQzIVem1EZG5UWLwXOFpmAIvHVBA5jO1y55qOdrE+m3fPIcyf2TD8Jiv?=
 =?us-ascii?Q?OfEi2Bv8pcC6+r5NQANx1yGmHhIklBoCSXW5D4NRCoc+xKTrJw2cEQl/O/vA?=
 =?us-ascii?Q?d/OLUS4INt8VZBH6BUPH7gdSZMiQcWIqEAnHAp98D/Kmu6H8BFdtPcyctmhu?=
 =?us-ascii?Q?hMEAN1Udl1EDjbrQlVzWv3RJDKCKXx3DueZe2uamaW3fnUnUTOiV0/Ns550v?=
 =?us-ascii?Q?8sa+GKaNk2f8Kuc+tOqtc1cbqSymBwtkATR+h+7juqo2qHlzdswUDQJZl/V8?=
 =?us-ascii?Q?HxoMnI2gt7aTCQnJajobcdKI8iiRdhT3WsZjg3PPXfEx045w30681IYkcCpN?=
 =?us-ascii?Q?5NvGf0QDw15NqQFSCBwERUcG6qHvcmMR2zX8VKfAVWNGqRyTjAKhGl2GKyeR?=
 =?us-ascii?Q?j3QD4lVuyLRRae1A+/YY3X7L19HZV5lVKpIr7qZ04tpNEHkqtZssXmXUkW1N?=
 =?us-ascii?Q?nsu5BfEjCYkyhXX7IksWCHV/Fvk31Mf/bJNCOXCOinHH2bDQdJ0FRQVdtU4Y?=
 =?us-ascii?Q?6xkNviECL7e+ar3D8u8wvg64V5V4DZCsY6hmpBPQoBnkb8ijumfl2SEbZ5Xw?=
 =?us-ascii?Q?pQVeQSwvUnJM4ghwSb7nNicHeYq6cBBCx2Z2ZiI3pj3wnccuZcw8mKTXiCHA?=
 =?us-ascii?Q?YOgH0/ECje3ekzMahaTvFQv2ivaO4u4lxaiGWZ/0WJcHAAQusO8eapDqZfC5?=
 =?us-ascii?Q?xIpO/omJFrNzoX41RDfuWbIdiOJ5AKTOT1LfsjDPDOc5kqPGwx7YpYABgCaQ?=
 =?us-ascii?Q?lgxAOnkpdgnNIHaZ+u2WyyFr45p6mvBwTLJpGQKMgFaIG4csbKlXfkelH25t?=
 =?us-ascii?Q?LWSqDBMLKXWcBONRR515ohupEXsm8PV7rlgbnNm15CfxUUI/LQUcmaMN7Wl8?=
 =?us-ascii?Q?7AsgpCkguKk+76/uhq4mlkjQOgYKdo7b4xXUUIILoTyKNE17TostHnm3/UZW?=
 =?us-ascii?Q?/N8Ccjxku6neRzayNa+FQqI9H7rkwPdhjv9d3CDsUXRMPqy2xk8yLn0LyutM?=
 =?us-ascii?Q?8JsP0wra+znKekc+sxnxvPgJtsijRXeYvCrCb3P5hiPbqlDx8N5SOpBFJUEC?=
 =?us-ascii?Q?mzEvDNWcTW8V+neXhnlGh/zHuXOWJE51S21rPClbFYp9fUtbAfBGc+LYOukh?=
 =?us-ascii?Q?VilwwXd3wDJ807OMS+dfuUs2k53Wtf7K?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YxzR3FGE0/1dQ+DTnKh01OnMee5EpJE3EU+QLqgT6nahlrWRK4vO3VkxfhXf?=
 =?us-ascii?Q?K2jhZyfBGdpFslJHnEFimNVFvVDe6eth8S6V0xdeeHLg/wycVQ6Dq3P33JQJ?=
 =?us-ascii?Q?ON+MwJNSwB7zY1NzGKjel9x/3akq/9LRQtmst4lxpOiPa9os8F3fDANpthmH?=
 =?us-ascii?Q?WjtSk/jBX95Yhx56YT9FsZInqOysvLV0EmhFR/hNLV7E6aMIbHvko0u86KTb?=
 =?us-ascii?Q?O4nAyTFSLfX9gq8arQVI9cGIgcf8I/saq77Q2MRSelTPCJyNJOhgvtVfLo+K?=
 =?us-ascii?Q?JBbwJPd38omsh1GMqL7hxS62OyvE4QlD/57S6p3F1RQsQCIc1rV4CnOG4ibd?=
 =?us-ascii?Q?70cZL/UybI0VCv+KzkLiIsuZau8yx6IxJwo68WP3tpysTXYga+MUW/fYasFu?=
 =?us-ascii?Q?HEn1NnMriFzA3/3Q33WVCP3Nhj8SrXdMwcD8fSmwjxHc0ITmpYq1RjaoFPSm?=
 =?us-ascii?Q?jbtce0HiOxSBEQhJMPw7yz0185HKG8ZtO35F/QtfSw7bUZGbWQk8/5blzYw8?=
 =?us-ascii?Q?Qn4m4bNyVL7z5adRqP/F7FF2nrDhVkUjqyW05vWfctV1fZpKmlME9ZFxgqLC?=
 =?us-ascii?Q?uVVCrYBqvBIzS8SCYjrSlS7eDebWsJk1Z/iy/ZMyWN5e+RtJ1tTy9wBx6kDP?=
 =?us-ascii?Q?SOR3mQZ9vZRnJSqxmaRkyI7gx0khxOXb6zK82/kKvGigLZEhAtfoPYVbMPJI?=
 =?us-ascii?Q?J60ewvfx+D3cZIs19gNndj4uYVFrCbHNFn1mW05pKxfIPSb1T4IvWZvH4yo2?=
 =?us-ascii?Q?DqaC9CcLI12mezElrcCOzukaHfefJb+pQ1qogJ45jNyBcvyGhfEuT+ME+FC2?=
 =?us-ascii?Q?FpALwsgnPkVNzzPa1JcbdBslufq6u5X3RfPm6sm2CA67AWnH1V22ObzybL7e?=
 =?us-ascii?Q?PGAUdrgnNQQ/+dYAtXCcYGy6Z9Y7yYG8DphBzZT0VuK8FLqzWy6vaCVMVgV0?=
 =?us-ascii?Q?Ejkyn6diBcwmTDD0vy9ehovtgUgtRWRNV/huG/1FeBfn00PeWgPBwK2MEdAf?=
 =?us-ascii?Q?gyQU6VwiJ9pfL5ARJIxcxxs7b5PGM2BRlyt65U8O0yU2wmnW3y4mC5FTAf6L?=
 =?us-ascii?Q?xi+fWaQw13BfPciG62G193tWbzL0dxgnVc+XSUH5jBKBvATcA5vONzn3oyij?=
 =?us-ascii?Q?igXzQixQnxQajJio9y5/3T+JeIcTw7I019BoU8xuCJwA8JfdBTQjtMGQPJ6G?=
 =?us-ascii?Q?Qa4RrKJK1D6K5gLWbmlT9CYqvGTgnuBekw74Mvj25ckcDHga5NCLqSHMS4Ev?=
 =?us-ascii?Q?FisqNcYtZ7fE5g9cbcpx2Ne+6yLsVTAh0xp8r438iFVzYave3JteVrYowXye?=
 =?us-ascii?Q?D9CbJmcDYe+J+Y+nP1PQXkRDNrlAXNwTh6azyT/HWCf9F2RiodoRbKyxqAny?=
 =?us-ascii?Q?XjwFf86otG8N1h3xmGhso0FFcIUOdPggVj8mOvI3h0gdczjBWto70ody7BvA?=
 =?us-ascii?Q?rpGspGhN3twu083V+2FnPHB/8tO9+FHoDtk/ZaFcUOv3/FSEfnry5yBTZUi/?=
 =?us-ascii?Q?dWiz3tvn69xF7X6tUkjEd0gHuVOspM6VuLIQR+iTAmMWOdMdUAQaZFWDL89m?=
 =?us-ascii?Q?EuauKiQ+D/a1mRMMfcsrJTYBEYDzcSOy7asDmi5M?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d6f0a813-20e4-4c7e-4b30-08de187be75d
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2025 12:49:17.7264 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LoZBIaybyucJMjfYyk6JauiMgS8lfg9rnc+9QiC4r3UK9UkY80++4+28EPovJ1N+qm01WzPwW+yazwNXfOaurg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6202
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

On Thu, Oct 30, 2025 at 05:25:36PM -0300, Gustavo Sousa wrote:
> Quoting Maarten Lankhorst (2025-10-30 17:00:29-03:00)
> >Hey,
> >
> >Den 2025-10-30 kl. 19:54, skrev Gustavo Sousa:
> >> Quoting Maarten Lankhorst (2025-10-30 15:47:10-03:00)
> >>> intel_set_pipe_src_size(), hsw_set_linetime_wm(),
> >>> intel_cpu_transcoder_set_m1_n1() and intel_set_transcoder_timings_lrr()
> >>> are called from an atomic context on PREEMPT_RT, and should be using the
> >>> _fw functions.
> >>>
> >>> Again noticed when trying to disable preemption in vblank evasion:
> >>> <3> BUG: sleeping function called from invalid context at kernel/locking/spinlock_rt.c:48
> >>> <3> in_atomic(): 1, irqs_disabled(): 0, non_block: 0, pid: 1505, name: kms_cursor_lega
> >>> <3> preempt_count: 1, expected: 0
> >>> <3> RCU nest depth: 0, expected: 0
> >>> <4> 4 locks held by kms_cursor_lega/1505:
> >>> <4>  #0: ffffc90003c6f988 (crtc_ww_class_acquire){+.+.}-{0:0}, at: drm_mode_atomic_ioctl+0x13b/0xe90
> >>> <4>  #1: ffffc90003c6f9b0 (crtc_ww_class_mutex){+.+.}-{3:3}, at: drm_mode_atomic_ioctl+0x13b/0xe90
> >>> <4>  #2: ffff888135b838b8 (&intel_dp->psr.lock){+.+.}-{3:3}, at: intel_psr_lock+0xc5/0xf0 [xe]
> >>> <4>  #3: ffff88812607bbc0 (&wl->lock){+.+.}-{2:2}, at: intel_dmc_wl_get+0x3c/0x140 [xe]
> >>> <4> CPU: 6 UID: 0 PID: 1505 Comm: kms_cursor_lega Tainted: G     U              6.18.0-rc3-lgci-xe-xe-pw-156729v1+ #1 PREEMPT_{RT,(lazy)}
> >>> <4> Tainted: [U]=USER
> >>> <4> Hardware name: Intel Corporation Panther Lake Client Platform/PTL-UH LP5 T3 RVP1, BIOS PTLPFWI1.R00.3383.D02.2509240621 09/24/2025
> >>> <4> Call Trace:
> >>> <4>  <TASK>
> >>> <4>  dump_stack_lvl+0xc1/0xf0
> >>> <4>  dump_stack+0x10/0x20
> >>> <4>  __might_resched+0x174/0x260
> >>> <4>  rt_spin_lock+0x63/0x200
> >>> <4>  ? intel_dmc_wl_get+0x3c/0x140 [xe]
> >>> <4>  intel_dmc_wl_get+0x3c/0x140 [xe]
> >> 
> >> Isn't the real problem reported here that we are using a regular
> >> spinlock for DMC wakelock instead of a raw spinlock?
> >
> >Regardless whether it is, we should be using the _fw variant here.

Right. I do believe the _fw variant is the best choice here. We just need to
review the registers accessed to ensure that they are not in any range of the fw
for the none of the platforms, including the old ones.

But I believe the patch deserves a different commit message.

> >The idea of the pipe_start/end() sections are that all relevant locks are taken,
> >and then complete as deterministically as possible. That's a lot easier when all
> >locks are taken in advance. If the wakelock was needed, it needed to be taken
> >before entering the critical section between pipe_start/pipe_end
> >
> >You're pointing out the related problem that the DMC wakelock implementation is
> >incorrect right now.
> >
> >I believe that too, but we should aim for a better solution. The DMC wakelock
> >implementation should not hide the fact it exists, instead it should be
> >acquired explicitly like the xe_force_wake_get/put() implementation.
> >
> >This may be a bit of work, but it will be more deterministic than the implicit
> >api used in i915.
> >
> >For correctness we could validate and print a debug error if the DMC wakelock
> >was not taken.
> >
> >intel_de_read() can still optionally validate that the DMC wakelock was taken for
> >ranges that need it if debuggig is enabled, but we should aim to remove the
> >current spinlock/refcount implementation.
> 
> That's an interesting view.
> 
> Adding display maintainers to the discussion here. Jani, Rodrigo, how to
> you see DMC wakelock being changed in the way proposed by Maarten?

My opinion might be a bit biased here because I prefer the explicit FW
as handled by the Xe rather than hidden in the mmio call like i915.

So, perhaps the explicit WL is also a good path. But I haven't looked the
code deep enough to get to a final conclusion.

But the quickest fix for the message in the commit message seems to be the
raw spinlock. Perhaps we do this and we run a calm analysis on the explicit
WL or not on a follow up?

> 
> --
> Gustavo Sousa
> 
> >
> >Kind regards,
> >~Maarten Lankhorst
