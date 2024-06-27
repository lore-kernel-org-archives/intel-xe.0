Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 124D8C3064D
	for <intel-xe@archiver.kernel.org>; Thu, 27 Jun 2024 18:04:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD2AF10E30C;
	Thu, 27 Jun 2024 18:04:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kCF/oz2+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6CD510E30C
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Jun 2024 18:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719511486; x=1751047486;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=z0UnnfmGczBuM0wsE/AE6HuSzAAPlY3kbg9zACdJg4E=;
 b=kCF/oz2+4ueDDmGWyE2KxFiEifr6OhRfXHn79eOh7R5mMkUBCRvw5h7Z
 GXtolYIVtzeIpA672fzcltvG/fket/B42rAKmqBkv/904uTU6TzhkmJsT
 zI503bfatJUbEVAh0zjo6ZwCFMjX8uWDF6KuukMagbripmLl7QwmGV0R8
 AMqHgayvuB60RMrdPglCCbFWjVbsG6OuRf+YsPp6XXMH3gQjTEqCx03L9
 ccRnRexdyfUa/wZkfL0nmcwZ+NSiQgIn4H3naTb5n8g5Z4j87VWvKnzDt
 KdRWyMie8ihIIDby2oCIMABAeqNpCgyL1tIJ6lS3fvQTlln+1MoNHgjXz Q==;
X-CSE-ConnectionGUID: 3dabcRVdSXSymEElByDD2Q==
X-CSE-MsgGUID: 7b2bLwKOSL61VVLUEoks1A==
X-IronPort-AV: E=McAfee;i="6700,10204,11116"; a="28060504"
X-IronPort-AV: E=Sophos;i="6.09,166,1716274800"; d="scan'208";a="28060504"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2024 11:04:31 -0700
X-CSE-ConnectionGUID: EtBh9XPRRnO08zc7gAXFzA==
X-CSE-MsgGUID: 7lQ5T42fR0S1HubR+p4o3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,166,1716274800"; d="scan'208";a="48935183"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Jun 2024 11:04:31 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 27 Jun 2024 11:04:30 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 27 Jun 2024 11:04:30 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 27 Jun 2024 11:04:30 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 27 Jun 2024 11:04:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M4KX9ShlpUTOJksDwIB3v8oB5H+baeVnvUEdGtB2d4Qpb1MZFPNg7us71Fdww35QgrP0NDC8ZtXWybHmfM4K8z9sUx9o/Xd1bocI+PMpbyDNJJzBg2ONhgSyWzMsXr5jeSlXZRPn/ApZ/vbpsnGEhMBjRGY88HV3EtLj0JxY6GD6lcsfykhB9nTEmHq7aAzrh6BoQ3TmJ5F2c/sOvgzlHrej90UcLm236s/TbK7EjcNULcCR2GhyVStGQwFAKG74wec8tQMnpUmSSwTtJWMvawAZcwT3in7fvwJAtE5CbTEbz+IsfSSw4NauEWrgQBXihC7AWhRnelK2v3foZ9acNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kmmIkSCep4fjbQAQOnpchomRlVD+Ii97sud+CPmNwGI=;
 b=jaNmBaIBxTeglFHoCxGV4VORB22UWalIGg/+BxLjiF8mjF+4xW+vIfnuArMTV95AUYVlqzytXX+n02H9WAA9umjYziLcoBTh5SlpFLv/fwGJnhTXZ1MDPNFHWytBi1GGU1xhcDPN2wFXyWT0iOt0YNmRxkmB14o/pu5tQvi/QIAx+N8EQS4aKFAx5XW2Yc80ebMCe6mNnANNXq7+gwAjOCTAAZCBA1OkUDL/JTna5e0TYQLp4zZGqT0RzulujqxyaXLL3bZGe0bYsFd3KLJOvPuaFa7tNX59O+s7kFXCU/0HNLbiEVjgekQ5Wyr7iLF/GhQkFnPwq0HiaVFRPIBDyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by CY8PR11MB7196.namprd11.prod.outlook.com (2603:10b6:930:94::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.32; Thu, 27 Jun
 2024 18:04:27 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%4]) with mapi id 15.20.7698.025; Thu, 27 Jun 2024
 18:04:27 +0000
Date: Thu, 27 Jun 2024 18:03:43 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.auld@intel.com>
Subject: Re: [PATCH v3] drm/xe: Add timeout to preempt fences
Message-ID: <Zn2pfx4AGKpoGADt@DUT025-TGLU.fm.intel.com>
References: <20240626004137.4060806-1-matthew.brost@intel.com>
 <Zn0P9X8yZAVsgdZw@nvishwa1-DESK>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Zn0P9X8yZAVsgdZw@nvishwa1-DESK>
X-ClientProxiedBy: BYAPR02CA0066.namprd02.prod.outlook.com
 (2603:10b6:a03:54::43) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|CY8PR11MB7196:EE_
X-MS-Office365-Filtering-Correlation-Id: 51b56904-ed06-412b-7972-08dc96d39561
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?hhSYS3KGf5+MUlK/fO0kKEwmOpzMDP93YEZtn/zNilbccqNNvJ6IAWAZBzS2?=
 =?us-ascii?Q?OlXo4ALkkwsBnVqcFP5WohuUkwNP0fSRswCnYNFdfuNFsGABmQR9oBTGEMfO?=
 =?us-ascii?Q?61gxobW4ceyRynpKyT0ABLGmpxF9EcMejBpnA7yIJgYOOAb080TAeeG1emcH?=
 =?us-ascii?Q?NnSdyq3ozbjsaFAMItRJC/CkD40qjSF5hWR/3aOyl0uK8qU0NdY7APO9ccmg?=
 =?us-ascii?Q?3cdfsnzCzsFpIfE9E9o+mH5ko5xQP4yiYbGnx/n367WTdeEv5kbD+DlDRnSW?=
 =?us-ascii?Q?b60HBvyA98poYax5f3GzSJWnQnFMioHepwXDnOiIK7UoDRJuuHKSw3rAmO7f?=
 =?us-ascii?Q?fH5PibOXraghLPwC/Z48L0Wx3LwP4CqNZQ+H3N4tZPHb410X04Vj38J589fq?=
 =?us-ascii?Q?8fgHRNtSR5KuhrboWkuaY+U89jVAeQ2lAaW2wqBaNT0Zge6RznEPHA+wdCUi?=
 =?us-ascii?Q?DsvhfCioGSTB8ui3r4W8WN1Zf7NdLvo2g9ubwdxt5T6Z+1AmEWAInGEicy+v?=
 =?us-ascii?Q?ZxzAdSujBnp/D9HVjXvMzPxF1WfZYtArYTLkz5WcZwdN/nb8anYeN5IsUSFL?=
 =?us-ascii?Q?rHRaCNJIegTNV3yOE1N79L5sbuwWTjN6+JQtm7xgtepdx+gpzXsIvQaE8A+x?=
 =?us-ascii?Q?PEUb+jMj1EWP9QxRSKJ7sXPNT9lMroTnOZtp47QU7q9BeAYKF4V0lfvkmtx0?=
 =?us-ascii?Q?1Cx1pU7wbfykcZoKLti1dvAUhQqhzg/3eS/Y9CpePECwWMXhMvFioAxvk3T3?=
 =?us-ascii?Q?H+eAAHD3gUdgx9s2agyFiy4I6nyrKp/oE/iCN9YTzy4MbPtWBqZsd4oxuX5o?=
 =?us-ascii?Q?/0RyfB4DZV5hhJsFvnzFlIZOJViW8lQ/ducUPb87GtiOPO+IMO6af2QiEpSJ?=
 =?us-ascii?Q?Pyf8SronZGhUzRtwKCsXqJKxX6t9XLF/wK3ialyxJzPkrkJKjFbK0auDD7th?=
 =?us-ascii?Q?eaJCaXq8t0O383EiMtZ/hLY0Dq29TBkH4O/r/bq2ilFFmBYd63/1cOtXV98J?=
 =?us-ascii?Q?0Cb0m2/E61ReRZVa1gXu037ID88LeagcTWR2cpvjREkmBV3ydEQWi7iuUmJh?=
 =?us-ascii?Q?m/NykgmXjJGucW89vydl1Ru8En3iyCc4ZoGFHthtSndatycXJdAIFaGI2Daz?=
 =?us-ascii?Q?Cc5EVPOCVwSNnUJNhyjc1o9dT9smmFfm1U4WXkh2ZGlszJBB87IiLdZesrPE?=
 =?us-ascii?Q?Yaq0bph7hkgC5du2/ON6licDWkmEPBwUCAyaLaWVsHTFl5Jpl07SlH7gGy27?=
 =?us-ascii?Q?Q/Yu/VFAcEcOVy9fnJDjNDJZwZADKCo1hQoyuoLchpJpX4i3WtZej+T4NX39?=
 =?us-ascii?Q?4pE2YxL/r+tnlpIZs0pV5JGuHhqVJ1vKo0zzX4FRGKBbvA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rNP6IBs9kye24gMSn9pBuQGzDx84Nk0vowBDYk2DTIfXu/aWISa3EQ6oIJkT?=
 =?us-ascii?Q?AZYuk0bt7vzustiR/nq3v2cIkv++Guw5gMqySRsklE/hHBNQqHgZb4DmT0Fd?=
 =?us-ascii?Q?rJnpPYfcVbCiRz3l17/mMlozOVs7pEc+toIocClhcQO5Rq/XWp6GPI+3HDZ8?=
 =?us-ascii?Q?i68LAohvHEh2vwBk+xhYB/qYvqGEWJklRVQ3ZNDDVVQHCQW7ejeT7hx6aH78?=
 =?us-ascii?Q?qFUnMGO/vRJM2wCvPmPjOgJsDQ6TDiVFmtUsypCgfvvhv+FeU4ZcVFhTNOkf?=
 =?us-ascii?Q?ccCNIhwLzTBpMzNUNBjaHJqOX14+MqMObYHto+tBKnxtJcJ4tNtP4FosWRD8?=
 =?us-ascii?Q?vOSTE1SbBrk/aE09Vn8vDpc9WkBKllmUNjAP/pc0AddrYY7/PeZIxLbczX4i?=
 =?us-ascii?Q?qKFrF5E1WiuhDaZAY9pNizdTwTuGIh82pVudu3SJLWBukXfgcyzHvkEV1WZz?=
 =?us-ascii?Q?souB/uDtjTyibSCzT3kvlo1M0u/FyoohdA96XBXh9rzQmOjout3f5z9F9JLr?=
 =?us-ascii?Q?n2df4eWJPymSpczUDnF45im0tUbsV6UXu5I2OvbWvk+AEnzg8Fc6UEXEbNhT?=
 =?us-ascii?Q?baglIU1IBjcehTlIqAEP1WluIuHIjxW4lfsrLsZv0cl1iZl9HWtEXEQC86Pa?=
 =?us-ascii?Q?CetS0twlYV0LYEI23qCzNg2UCYOLGhrJNN7uiJteXWkvVt46AkdAxeAXslyW?=
 =?us-ascii?Q?yIj6giowuY5aR8VNhNJaEo9yzray5B8ma60LBUu9iZhrrkT5fggLdrfSNJpO?=
 =?us-ascii?Q?dXRo1jVpisxuOOhGaKclMusQd5Ubyby2fVNC5z/6gMTYse30VvA8cCbSGgye?=
 =?us-ascii?Q?Rrd6Dp5ypn9ft7NUnZ+gN77c2Y2cuNtoDa7HAE5xOFijuMhzldXjDvLiZtD0?=
 =?us-ascii?Q?A61S+GAbv+XcxXH+dRmRX4/hSbkd5zYxphKo2qvt2l203ZQ48gp59+68Qqy4?=
 =?us-ascii?Q?e7OOOjO/iCAEopjOJOWpjTXCxGFJugiH708ZBre48IredVVyTJfuSpoHjjHP?=
 =?us-ascii?Q?B7P77ftYPmz83jJDG3A75JgkC0ADELoC2/SyM9HDLMusGN66gEPlDpTIWdEC?=
 =?us-ascii?Q?7l1e6LK8RA58MX+cI0/AGlhFVc0eUDX6nk65drjBh9QiqpbG2o49GS0ih8lB?=
 =?us-ascii?Q?PEAcbIeavWiKyEfJpZoMS7OT/FpUFHIy3zcnr/Yr6xjubr3TP6WUl/AgX0a1?=
 =?us-ascii?Q?t1TxwM8tlaRQoI9aonDinxumxOa3CgFDdJAxYT1MtLlVHNME5T6NqZWqZJx2?=
 =?us-ascii?Q?EfAMELzvP84hk7/d7zUBQC2mzBufETCb9CLIM3PfuseWIeBv+Zbr8Q9+T6/h?=
 =?us-ascii?Q?hiSo9cPPF1hEJXulmEJkTGvZyUO8ZHFqbWtCBHYZpDUod/SOITwqwPEVlryQ?=
 =?us-ascii?Q?eMk/PKfW1uWyAChmdOcg+nord4KrnwvTTqKZkijpyAAMYSxa5+9qCIbB+r39?=
 =?us-ascii?Q?GzsC8VXEqHft1tRPCx6w96zjJ7RKIeqw9WYuvQuya5djwbtTQrp8OeyAKToe?=
 =?us-ascii?Q?R6LxLgTJgMfYQZRx5gxEJJhkwwRtEexrwbd3R9uS+d+La8aYNp5tsm0bQw7K?=
 =?us-ascii?Q?g8hkX/yBAP6NmTzeKUEKucCRwdjgxRsS36d5+HMdofz5STaU49lsCj5XOj27?=
 =?us-ascii?Q?aw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 51b56904-ed06-412b-7972-08dc96d39561
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2024 18:04:26.9350 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RyyoM3bQ9JeOnLbYeXEY5cTMcY81G4Bl6kxReD2oKOafnSMclMVzuk5+Rfmh9GFWVdghswyB5snU2TGqkGv6DQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7196
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

On Thu, Jun 27, 2024 at 12:08:37AM -0700, Niranjana Vishwanathapura wrote:
> On Tue, Jun 25, 2024 at 05:41:37PM -0700, Matthew Brost wrote:
> > To adhere to dma fencing rules that fences must signal within a
> > reasonable amount of time, add a 5 second timeout to preempt fences. If
> > this timeout occurs, kill the associated VM as this fatal to the VM.
> > 
> > v2:
> > - Add comment for smp_wmb (Checkpatch)
> > - Fix kernel doc typo (Inspection)
> > - Add comment for killed check (Niranjana)
> > v3:
> > - Drop smp_wmb (Matthew Auld)
> > - Don't take vm->lock in preempt fence worker (Matthew Auld)
> > - Drop RB given changes to patch
> > 
> > Cc: Matthew Auld <matthew.auld@intel.com>
> > Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> > drivers/gpu/drm/xe/xe_exec_queue_types.h |  6 ++--
> > drivers/gpu/drm/xe/xe_execlist.c         |  3 +-
> > drivers/gpu/drm/xe/xe_guc_submit.c       | 39 ++++++++++++++++++++----
> > drivers/gpu/drm/xe/xe_preempt_fence.c    | 12 ++++++--
> > drivers/gpu/drm/xe/xe_vm.c               | 14 +++++++--
> > drivers/gpu/drm/xe/xe_vm.h               |  2 ++
> > 6 files changed, 62 insertions(+), 14 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > index 201588ec33c3..ded9f9396429 100644
> > --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > @@ -172,9 +172,11 @@ struct xe_exec_queue_ops {
> > 	int (*suspend)(struct xe_exec_queue *q);
> > 	/**
> > 	 * @suspend_wait: Wait for an exec queue to suspend executing, should be
> > -	 * call after suspend.
> > +	 * call after suspend. In dma-fencing path thus must return within a
> > +	 * reasonable amount of time. -ETIME return shall indicate an error
> > +	 * waiting for suspend resulting in associated VM getting killed.
> > 	 */
> > -	void (*suspend_wait)(struct xe_exec_queue *q);
> > +	int (*suspend_wait)(struct xe_exec_queue *q);
> > 	/**
> > 	 * @resume: Resume exec queue execution, exec queue must be in a suspended
> > 	 * state and dma fence returned from most recent suspend call must be
> > diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
> > index db906117db6d..7502e3486eaf 100644
> > --- a/drivers/gpu/drm/xe/xe_execlist.c
> > +++ b/drivers/gpu/drm/xe/xe_execlist.c
> > @@ -422,10 +422,11 @@ static int execlist_exec_queue_suspend(struct xe_exec_queue *q)
> > 	return 0;
> > }
> > 
> > -static void execlist_exec_queue_suspend_wait(struct xe_exec_queue *q)
> > +static int execlist_exec_queue_suspend_wait(struct xe_exec_queue *q)
> > 
> > {
> > 	/* NIY */
> > +	return 0;
> > }
> > 
> > static void execlist_exec_queue_resume(struct xe_exec_queue *q)
> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > index 373447758a60..b06321897cf3 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > @@ -1301,6 +1301,15 @@ static void __guc_exec_queue_process_msg_set_sched_props(struct xe_sched_msg *ms
> > 	kfree(msg);
> > }
> > 
> > +static void __suspend_fence_signal(struct xe_exec_queue *q)
> > +{
> > +	if (!q->guc->suspend_pending)
> > +		return;
> > +
> > +	q->guc->suspend_pending = false;
> 
> Hmm...don't we need WRITE_ONCE here to write to suspend_pending flag
> (along with READ_ONCE() elsewhere) given it is also checked in guc
> callback handler etc? Possible that it might not be an issue on out
> our platforms though. In any case, this patch is not causing this,
> so, I am fine here.
> 

I think the wake_up / wait_for macros have the neede barriers. I adding
the WRITE_ONCE / READ_ONCE for clarity / safety does make a bit of sense
though. Willl add. 

> > +	wake_up(&q->guc->suspend_wait);
> > +}
> > +
> > static void suspend_fence_signal(struct xe_exec_queue *q)
> > {
> > 	struct xe_guc *guc = exec_queue_to_guc(q);
> > @@ -1310,9 +1319,7 @@ static void suspend_fence_signal(struct xe_exec_queue *q)
> > 		  guc_read_stopped(guc));
> > 	xe_assert(xe, q->guc->suspend_pending);
> > 
> > -	q->guc->suspend_pending = false;
> > -	smp_wmb();
> > -	wake_up(&q->guc->suspend_wait);
> > +	__suspend_fence_signal(q);
> > }
> > 
> > static void __guc_exec_queue_process_msg_suspend(struct xe_sched_msg *msg)
> > @@ -1465,6 +1472,7 @@ static void guc_exec_queue_kill(struct xe_exec_queue *q)
> > {
> > 	trace_xe_exec_queue_kill(q);
> > 	set_exec_queue_killed(q);
> > +	__suspend_fence_signal(q);
> > 	xe_guc_exec_queue_trigger_cleanup(q);
> > }
> > 
> > @@ -1561,12 +1569,31 @@ static int guc_exec_queue_suspend(struct xe_exec_queue *q)
> > 	return 0;
> > }
> > 
> > -static void guc_exec_queue_suspend_wait(struct xe_exec_queue *q)
> > +static int guc_exec_queue_suspend_wait(struct xe_exec_queue *q)
> > {
> > 	struct xe_guc *guc = exec_queue_to_guc(q);
> > +	int ret;
> > +
> > +	/*
> > +	 * Likely don't need to check exec_queue_killed() as we clear
> > +	 * suspend_pending upon kill but to be paranoid but races in which
> > +	 * suspend_pending is set after kill also check kill here.
> > +	 */
> > +	ret = wait_event_timeout(q->guc->suspend_wait,
> > +				 !q->guc->suspend_pending ||
> > +				 exec_queue_killed(q) ||
> > +				 guc_read_stopped(guc),
> > +				 HZ * 5);
> > 
> > -	wait_event(q->guc->suspend_wait, !q->guc->suspend_pending ||
> > -		   guc_read_stopped(guc));
> > +	if (!ret) {
> > +		xe_gt_warn(guc_to_gt(guc),
> > +			   "Suspend fence, guc_id=%d, failed to respond",
> > +			   q->guc->id);
> > +		/* XXX: Trigger GT reset? */
> > +		return -ETIME;
> > +	}
> > +
> > +	return 0;
> > }
> > 
> > static void guc_exec_queue_resume(struct xe_exec_queue *q)
> > diff --git a/drivers/gpu/drm/xe/xe_preempt_fence.c b/drivers/gpu/drm/xe/xe_preempt_fence.c
> > index e8b8ae5c6485..56e709d2fb30 100644
> > --- a/drivers/gpu/drm/xe/xe_preempt_fence.c
> > +++ b/drivers/gpu/drm/xe/xe_preempt_fence.c
> > @@ -17,10 +17,16 @@ static void preempt_fence_work_func(struct work_struct *w)
> > 		container_of(w, typeof(*pfence), preempt_work);
> > 	struct xe_exec_queue *q = pfence->q;
> > 
> > -	if (pfence->error)
> > +	if (pfence->error) {
> > 		dma_fence_set_error(&pfence->base, pfence->error);
> > -	else
> > -		q->ops->suspend_wait(q);
> > +	} else if (!q->ops->reset_status(q)) {
> > +		int err = q->ops->suspend_wait(q);
> > +
> > +		if (err)
> > +			dma_fence_set_error(&pfence->base, err);
> > +	} else {
> > +		dma_fence_set_error(&pfence->base, -ENOENT);
> > +	}
> > 
> > 	dma_fence_signal(&pfence->base);
> > 	/*
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index 5b166fa03684..bf1764249724 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -133,8 +133,10 @@ static int wait_for_existing_preempt_fences(struct xe_vm *vm)
> > 		if (q->lr.pfence) {
> > 			long timeout = dma_fence_wait(q->lr.pfence, false);
> > 
> > -			if (timeout < 0)
> > +			/* Only -ETIME on fence indicates VM needs to be killed */
> > +			if (timeout < 0 || q->lr.pfence->error == -ETIME)
> > 				return -ETIME;
> > +
> > 			dma_fence_put(q->lr.pfence);
> > 			q->lr.pfence = NULL;
> > 		}
> > @@ -311,7 +313,15 @@ int __xe_vm_userptr_needs_repin(struct xe_vm *vm)
> > 
> > #define XE_VM_REBIND_RETRY_TIMEOUT_MS 1000
> > 
> > -static void xe_vm_kill(struct xe_vm *vm, bool unlocked)
> > +/**
> > + * xe_vm_kill() - VM Kill
> > + * @vm: The VM.
> > + * @unlocked: Flag indicates the VM's dma-resv is not held
> > + *
> > + * Kill the VM by setting banned flag indicated VM is no longer available for
> > + * use. If in preempt fence mode, also kill all exec queue attached to the VM.
> > + */
> > +void xe_vm_kill(struct xe_vm *vm, bool unlocked)
> > {
> > 	struct xe_exec_queue *q;
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> > index b481608b12f1..c864dba35e1d 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.h
> > +++ b/drivers/gpu/drm/xe/xe_vm.h
> > @@ -259,6 +259,8 @@ static inline struct dma_resv *xe_vm_resv(struct xe_vm *vm)
> > 	return drm_gpuvm_resv(&vm->gpuvm);
> > }
> > 
> > +void xe_vm_kill(struct xe_vm *vm, bool unlocked);
> > +
> > /**
> >  * xe_vm_assert_held(vm) - Assert that the vm's reservation object is held.
> >  * @vm: The vm
> > -- 
> 
> Changes in xe_vm.c and .h are not needed.

Yea I saw this too. Will remove.

Matt

> Given that is taken care of,
> Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> 
> Niranjana
> 
> 
> > 2.34.1
> > 
