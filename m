Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79920C001DE
	for <intel-xe@archiver.kernel.org>; Fri, 11 Aug 2023 20:39:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 492C810E6F7;
	Fri, 11 Aug 2023 20:39:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35D3F10E6F7
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Aug 2023 20:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691786380; x=1723322380;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=36njv/LF2clkuHZhnt9Q3GNtnEomZ/B4eghtTt+aaxQ=;
 b=hskAdjc/4N1SJikY/w6AnFsXQogzdnTW0ag0S9iWwU+wLnrF62Ifb/rc
 1VrwHyCfPfskjcT5/R/MBvroyfMFUPK1Go4lIY/xNwsEW+CFppUcwypOW
 c0zMXnqavpRyFn3Lb61upejDBF2lMnSSH+3PZLoJmthmT94sbpMm7xP2A
 ofDEyPL8gEYYMt6kZX0M6g0/Y/jq59ZKktkwpZNE86d+8vllfenTJ+Qcv
 MIKaLmMvB3iyXiG8n+43MUHwBplW3aVKWvMPidVAfCLfWfcrKzboJV1jv
 ZlbFLhgRhzg91MdenJw4DC5Rp/nbBd12zOOdSPdIrYtot631L1ezNcRU1 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="369227652"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; d="scan'208";a="369227652"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2023 13:39:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="726368228"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; d="scan'208";a="726368228"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga007.jf.intel.com with ESMTP; 11 Aug 2023 13:39:15 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 11 Aug 2023 13:39:14 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 11 Aug 2023 13:39:14 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.109)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 11 Aug 2023 13:39:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VJw2DimNkxAV05xNMw9VZAC2sUG+3g7fRgUqNWhHQbAXr9QSOQkRDjj5W6rv2d9XNa7rcSZPkg+e9iWiANhdmWStmmTVYkArcykRb8AwxOrI+pA0j0bDXjUHrrsQ3n9+oQSnlp8c0xDF9AU1cOcvHlrGRNh1/UI16VLrdQCzTLlMxCMrKN7JErue+WAKV81QtSXlPA6Nvp3H58uLlEq/Sq0naRVex0jIzst+Hb62/zZRfRvTxbjM1LW1xKQe2SL5Yq/krio4BRGX5qdNLjWvHw5T0uyFWKW9xY7Jz7my8xpgU0wmx7a7WT5sOM3zmiP4OWQzmjM4Xvt6XOB6dD4HXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VcXUmIdeFmwJsyW37irzY2AN63e2E0WxlaPMNpq1RBg=;
 b=f8bn+7O3HX/QktfyNX0A70UF8sm30zm65jlCgXn+TiQGwjQoZO8ifAibT4sF2V/i3xafYlcVEI0tm+iYC5ro7zwqL70SYmpzL0PA2WaPiLsfjqGZYAgaF5IANYyoBQorL5Mxw8tWxNo+EgBORj6A9fk+DI4ABnpj1Ar9rwvaQ+tFjbYqAlJrr7RrQsKVW2xzrhtrK4SGslYy0JsLsqJ2ph5g9ZJwngSarcLGvbntduSjuWnKc4ltkCufF81V6QYiWsPp6B8nhZ/tg2GsMeVC89FdPhdeV9k3CV5M+EAGSJeYgpuVdi4prEarQvOiPeIUanpxmJHOUCc9+YmxcQybsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA1PR11MB6193.namprd11.prod.outlook.com (2603:10b6:208:3eb::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.30; Fri, 11 Aug
 2023 20:39:12 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b429:ee19:a001:eb69]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b429:ee19:a001:eb69%4]) with mapi id 15.20.6652.029; Fri, 11 Aug 2023
 20:39:12 +0000
Date: Fri, 11 Aug 2023 20:38:20 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <ZNacPHwHJy10FdKJ@DUT025-TGLU.fm.intel.com>
References: <20230809120730.383981-1-ravi.kumar.vodapalli@intel.com>
 <ddgqx7khgaapfvaaxgfmwveuic2ilyhgv7ambdbanpo73q25lv@2pv4li27hr2m>
 <20230811203012.GG209733@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230811203012.GG209733@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: SJ0PR13CA0082.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::27) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA1PR11MB6193:EE_
X-MS-Office365-Filtering-Correlation-Id: 10825305-5b0a-4859-77ed-08db9aab052f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lVIMJWstXPDvmqVmAEp9svpWjl83216zcUPMCGVzx3Sf75b271p2+n66dndjXFaslFyyQvAT8wNLvR9Hw6HyVEa9qWJu9wCs9/v6WtmJdPnjjwQLbnbY/+YtIuWuu3jribDKxaU51iOI0KGwvViShjz6BvLcHxV3c+bunxOq2klUibGhsArLokd51g/ThdrVtGEfovP880lL0Pq5rVQCYwng79xj+Q01zbiZK21Qlr0RiwEbuGgBPYVlabHM0LCX0je7KT0CvmnWoRtSRlWijkTIzDBxjAbZaE7H/qT7babzBt5PjEeBI/oDIq6oCfvi2y7eBfGv/hRQ+g7Z0qJQz5vsGaT0ZY6Urcqn950JK1yYjTd5Q2355e7R31lqI7UJa8j6z6Q6CYdXFeqYuZViBElAhdzMlDXOgq9jUPwFGeqW7qlpb6WPtQxW/j64hmyVZqxS3G0KnQ/px2hTgU0vawGMJk4VLGgCufyhE2m3Lm+Ay/33zwpikzKhSX6SefP4wXtEZ3hPFkElCqRHvTM9oWCX6+U5nhk9hWSQzhkBJ6w=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(396003)(366004)(346002)(39860400002)(136003)(186006)(1800799006)(451199021)(30864003)(316002)(5660300002)(6862004)(2906002)(41300700001)(8676002)(8936002)(44832011)(82960400001)(66556008)(66946007)(66476007)(4326008)(478600001)(6636002)(86362001)(6666004)(6486002)(966005)(6512007)(38100700002)(6506007)(26005)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dzB3SBcZ2Ae7o7MtsQCEG+0IFHo6IN1M9uQpbJ1Ta6WPE0O1RMM68hg/gmKM?=
 =?us-ascii?Q?0UMt7+Mf48eiAmgseq8ccsKMq+/IvHBFTNPEEFhcHgeeXYOQQdaQB3zUxv9q?=
 =?us-ascii?Q?YEs81+LEJXJLaRFG1TUxxvzpCIeLf9iJbYiqUhWwessyGfjs2iRY++IARZz9?=
 =?us-ascii?Q?BCXesGhlAX3XF037H8cpkkXOELCDVbrqoEpp7j6L+IQyVIraLtEL4LN6VBRF?=
 =?us-ascii?Q?yZm5bs98O0KpBTRdKd+5Z2Wg/gefYtDKJxwyjZ2CzwaSFGa+tjGgIpHmwmam?=
 =?us-ascii?Q?B/2msAgJPUgfmKNVosok3w3BjYEFjdxUNFbWAjzEmuj1xjN0haauugH4tdoy?=
 =?us-ascii?Q?9cQCv5AP6cmEBUSdqkxqZ+otdW8ivE0YtoaS8218ILPuSA7NssCDRLBG084v?=
 =?us-ascii?Q?JqXx7FOCiq3PnXNTOU39an8w/IvCavgRrdSgEO8rZEMII2Xdsp139S7j0w/N?=
 =?us-ascii?Q?b1epm+pf/HbC1WSG1FkuXtblZiNTjahAGN9Si7cJjbGPuHziX/HZcU4/oBgd?=
 =?us-ascii?Q?7L3dK25PfgYHrju+bgzxGCNkE14+F0mBvfM5+Kx/+ZgpeVVC1BJhe3f+8Pqw?=
 =?us-ascii?Q?8Iu5M7Uo8T3I1+b19csLQzKy7FCrPmQSBiuGYdj+nqdiW6UaQVVX1QhME+2s?=
 =?us-ascii?Q?EMF6VEsXJqEdTzxkQQLlk2oOyY9ewQDaRafKXk4MTX5oKOozhaYWU1RB4Hcs?=
 =?us-ascii?Q?Jw6FOVYOaG7Kxs6dnlA0lWblZBNjr4Ss65Xx3ick5HtILFONptUNugK2ZTMK?=
 =?us-ascii?Q?+kePfzRska3E6vgwfTBzrZof3LKB6LevDQSQg4Bi+2BiammLfGx6K8dkLAPS?=
 =?us-ascii?Q?1SnMhU347i+BrkSOUJ0lUgPD31+BcuCBV0yJ4L/mDDIrO+4V+FB9Z38DM5iE?=
 =?us-ascii?Q?2GwqeEbRF6Nmznu5p7F0xeZKdRA8ASCb2kdENEd7F4KQRC2+woByPH7/30NS?=
 =?us-ascii?Q?tH3FZE8C2YYhN8i11FeAvShz0rzrFtJmwf/5/OZtpIuHUN8acciio0vs/RTN?=
 =?us-ascii?Q?Ps8OES2Ki9lGEcg5To1sfANHZ+YRN5zndqejb7opSid2ROcpnFqlY4W9y0F/?=
 =?us-ascii?Q?8aPUGNDL15ifUh1OT/DYdd7AP3o9IJqI0wnboSkh+PuhTh2+oyJDuwE+Qeft?=
 =?us-ascii?Q?cQEwvvv3lRPndydPdAGZbtDk1OKam84WtWg9CPbsx5UVsLAWc/r/HJG11gRJ?=
 =?us-ascii?Q?kiWQJF+d1M+hj+TNqV8Rhbc+M9pvNEITfWX4dfl+Hecj+UNYhXnWvhTdAG1Y?=
 =?us-ascii?Q?oyACSbS18GuwoPCcZQuoUkl41IbaduJKuafgh5TsdMDcfgNbjvy5t3PsHwos?=
 =?us-ascii?Q?cbUUepw/TdBmbGCoW2elPCNXbhTkKowgqOfDPGu1wkITR+WFo5Ow3ii5Zyiw?=
 =?us-ascii?Q?B8gRb+7KD+ym7HKrmwb2o10IQA8oQTGjWXXP78pwdeAGRhqZS/vCMeia1d5t?=
 =?us-ascii?Q?sFxEqXbR/Z2CJRFRq1Gmpa/BeJiPAlWU+x56r9RF1a3p1crz4p+DbKt5lcuU?=
 =?us-ascii?Q?I8szzS6BMQbfMQz98ta6GOTMpdFNJeWUNIzr+OVOLMIl3mUTuyFIdJyp8Z/C?=
 =?us-ascii?Q?GVJgpN6Zw1vPunZ5O5CD3PW1PHAANNLqfwjfxwk20hYOL/095rPhFFGMlR/L?=
 =?us-ascii?Q?VA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 10825305-5b0a-4859-77ed-08db9aab052f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2023 20:39:12.1632 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X90bAAqzhoannYRBiZqqrQeoFZXZBY27/on3zuovGb9g5FZDZqIyc3CsCQa0JAOdD36BxnfxFR1y+tm6n8wudg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6193
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] Different platforms has different PAT
 encoding in PTE and PDE format,
 add correct PAT encoding for pre-Xe2 platforms (XELP, XEHPC, XELPG).
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Aug 11, 2023 at 01:30:12PM -0700, Matt Roper wrote:
> On Wed, Aug 09, 2023 at 12:26:30PM -0600, Lucas De Marchi wrote:
> > 
> > As Ashutosh said, please take a look on kernel documentation on how to
> > write proper commit messages.
> > 	
> > 	https://www.kernel.org/doc/html/latest/process/submitting-patches.html#describe-your-changes
> > 
> > It's a good idea to check checkpatch on the patch before submitting too.
> > Yes, sometimes we forget, but it's good to create the habit.
> > 
> > On Wed, Aug 09, 2023 at 05:37:30PM +0530, Ravi Kumar Vodapalli wrote:
> > > Bspec: 45101, 71582
> > > Signed-off-by: Ravi Kumar Vodapalli <ravi.kumar.vodapalli@intel.com>
> > > ---
> > > drivers/gpu/drm/xe/xe_device.c       |  3 ++
> > > drivers/gpu/drm/xe/xe_device_types.h |  5 ++
> > > drivers/gpu/drm/xe/xe_pat.c          | 76 ++++++++++++++++++++++++++++
> > > drivers/gpu/drm/xe/xe_pat.h          | 25 +++++++++
> > > drivers/gpu/drm/xe/xe_pt.c           | 28 +++-------
> > > drivers/gpu/drm/xe/xe_pt_types.h     |  3 +-
> > > 6 files changed, 119 insertions(+), 21 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> > > index 766df07de979..0675a60f17f9 100644
> > > --- a/drivers/gpu/drm/xe/xe_device.c
> > > +++ b/drivers/gpu/drm/xe/xe_device.c
> > > @@ -34,6 +34,7 @@
> > > #include "xe_vm.h"
> > > #include "xe_vm_madvise.h"
> > > #include "xe_wait_user_fence.h"
> > > +#include "xe_pat.h"
> > 
> > all the includes are alphabetically sorted. Do not simply append here.
> > 
> > > 
> > > #ifdef CONFIG_LOCKDEP
> > > struct lockdep_map xe_device_mem_access_lockdep_map = {
> > > @@ -292,6 +293,8 @@ int xe_device_probe(struct xe_device *xe)
> > > 			goto err_irq_shutdown;
> > > 	}
> > > 
> > > +	xe_pte_pat_init(xe);
> > > +
> > > 	err = xe_mmio_probe_vram(xe);
> > > 	if (err)
> > > 		goto err_irq_shutdown;
> > > diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> > > index bfedcc7571b0..3c64834c32fc 100644
> > > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > > @@ -23,6 +23,8 @@
> > > #include "intel_display_device.h"
> > > #endif
> > > 
> > > +#include "xe_pt_types.h"
> > > +
> > > struct xe_ggtt;
> > > 
> > > #define XE_BO_INVALID_OFFSET	LONG_MAX
> > > @@ -470,6 +472,9 @@ struct xe_device {
> > > 		u32 lvds_channel_mode;
> > > 	} params;
> > > #endif
> > > +	const u32 *pte_pat_table;
> > > +	u64 (*ppgtt_pte_encode)(struct xe_device *xe, u64 pte_pat, enum xe_cache_level cache);
> > > +	u64 (*ppgtt_pde_encode)(struct xe_device *xe, u64 pde_pat, enum xe_cache_level cache);
> > 
> > A few lines above we have:
> > 
> > 		/* private: */
> > 
> > 	#if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
> > 		/*                                                                     		
> > * Any fields below this point are the ones used by display.           		 *
> > They are temporarily added here so xe_device can be desguised as    		 *
> > drm_i915_private during build. After cleanup these should go away,  		 *
> > migrating to the right sub-structs                                  		 */
> > 
> > 
> > You need to find a proper place in the structure to add new fields. Do
> > not simply append. However I'll defer to Matt Roper (Cc'ed) if xe_device
> > is the correct place or if this should be on the gt level. Anyway, it
> > should probably be a substruct "ops" or "funcs" for this vfunc approach.
> 
> I think it might make more sense to keep this closer to what it's
> operating on, in a more object-oriented sense.  Since these vfuncs are
> specific to PPGTT handling, I think 'xe_vm' might be a better spot for

Agree.

Also the ops should defined as a struct rather than individual ops too.

See 'const struct xe_ring_ops *ring_ops' in xe_exec_queue_types.h".

The pte_pat_table, ppgtt_pte_encode, ppgtt_pde_encode, probably all could in a single struct.

Matthew Brost

> them than 'xe_device.'  We could also drop the 'ppgtt_' prefix and
> assign the function pointers inside xe_vm_create().
> 
> 
> Matt
> 
> > 
> > > };
> > > 
> > > /**
> > > diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
> > > index b56a65779d26..8f4c33d0f7dc 100644
> > > --- a/drivers/gpu/drm/xe/xe_pat.c
> > > +++ b/drivers/gpu/drm/xe/xe_pat.c
> > > @@ -62,6 +62,24 @@ static const u32 mtl_pat_table[] = {
> > > 	[4] = MTL_PAT_0_WB | MTL_3_COH_2W,
> > > };
> > > 
> > > +static const u32 xelp_pte_pat_table[] = {
> > > +	[XE_CACHE_NONE] = XELP_PAT_UNCACHE,
> > > +	[XE_CACHE_WT] = XELP_PAT_WT_CACHE,
> > > +	[XE_CACHE_WB] = XELP_PAT_WB_CACHE,
> > > +};
> > > +
> > > +static const u32 xehpc_pte_pat_table[] = {
> > > +	[XE_CACHE_NONE] = XEHPC_PAT_CLOS0_UNCACHE,
> > > +	[XE_CACHE_WT] = XEHPC_PAT_CLOS0_WT_CACHE,
> > > +	[XE_CACHE_WB] = XEHPC_PAT_CLOS0_WB_CACHE,
> > > +};
> > > +
> > > +static const u32 xelpg_pte_pat_table[] = {
> > > +	[XE_CACHE_NONE] = XELPG_PAT_UNCACHE,
> > > +	[XE_CACHE_WT] = XELPG_PAT_WT_CACHE,
> > > +	[XE_CACHE_WB] = XELPG_PAT_WB_CACHE,
> > > +};
> > 
> > you added XE_CACHE_LAST but then did nothing with that. Did you mean to
> > add a static assert to make sure we don't have arrays with fewer
> > elements than XE_CACHE_LAST?
> > 
> > > +
> > > static void program_pat(struct xe_gt *gt, const u32 table[], int n_entries)
> > > {
> > > 	for (int i = 0; i < n_entries; i++) {
> > > @@ -111,3 +129,61 @@ void xe_pat_init(struct xe_gt *gt)
> > > 			GRAPHICS_VER(xe), GRAPHICS_VERx100(xe) % 100);
> > > 	}
> > > }
> > > +
> > > +u32 xe_pat_get_index(struct xe_device *xe, enum xe_cache_level cache)
> > > +{
> > > +	return xe->pte_pat_table[cache];
> > > +}
> > > +
> > > +static u64 xelp_ppgtt_pde_encode_pat(struct xe_device *xe, u64 pde_pat, enum xe_cache_level cache)
> > > +{
> > > +	u32 pat_index = xe_pat_get_index(xe, cache);
> > > +
> > > +	pde_pat &= ~(XELP_PDE_PAT_MASK);
> > > +
> > > +	if (pat_index & BIT(0))
> > > +		pde_pat |= BIT(3);
> > > +
> > > +	if (pat_index & BIT(1))
> > > +		pde_pat |= BIT(4);
> > > +
> > > +	if (pat_index & BIT(2))
> > > +		pde_pat |= BIT(12);
> > > +}
> > > +
> > > +static u64 xelp_ppgtt_pte_encode_pat(struct xe_device *xe, u64 pte_pat, enum xe_cache_level cache)
> > > +{
> > > +	u32 pat_index = xe_pat_get_index(xe, cache);
> > > +
> > > +	pte_pat &= ~(XELP_PTE_PAT_MASK);
> > > +
> > > +	if (pat_index & BIT(0))
> > > +		pte_pat |= BIT(3);
> > > +
> > > +	if (pat_index & BIT(1))
> > > +		pte_pat |= BIT(4);
> > > +
> > > +	if (pat_index & BIT(2))
> > > +		pte_pat |= BIT(7);
> > > +
> > > +	return pte_pat;
> > > +}
> > > +
> > > +void xe_pte_pat_init(struct xe_device *xe)
> > 
> > any non-static function in this file should be xe_pat_*  (there a few
> > exceptions, but this is usually the rule).
> > 
> > > +{
> > > +	if (GRAPHICS_VERx100(xe) >= 1270) {
> > > +		xe->pte_pat_table = xelpg_pte_pat_table;
> > > +		xe->ppgtt_pte_encode = xelp_ppgtt_pte_encode_pat;
> > > +		xe->ppgtt_pde_encode = xelp_ppgtt_pde_encode_pat;
> > 
> > setting those don't belong to this file. They should be in the relevant
> > file that cares about ppgtt (i.e. xe_pt.c).
> > 
> > Also you are missing the necessary changes to xe_ggtt.c that should also
> > encode the bits.
> > 
> > > +	} else if (GRAPHICS_VERx100(xe) >= 1260) {
> > > +		xe->pte_pat_table = xehpc_pte_pat_table;
> > > +		xe->ppgtt_pte_encode = xelp_ppgtt_pte_encode_pat;
> > > +		xe->ppgtt_pde_encode = xelp_ppgtt_pde_encode_pat;
> > > +	} else {
> > > +		xe->pte_pat_table = xelp_pte_pat_table;
> > > +		xe->ppgtt_pte_encode = xelp_ppgtt_pte_encode_pat;
> > > +		xe->ppgtt_pde_encode = xelp_ppgtt_pde_encode_pat;
> > > +	}
> > > +}
> > > diff --git a/drivers/gpu/drm/xe/xe_pat.h b/drivers/gpu/drm/xe/xe_pat.h
> > > index 659de4008131..1138ac78943f 100644
> > > --- a/drivers/gpu/drm/xe/xe_pat.h
> > > +++ b/drivers/gpu/drm/xe/xe_pat.h
> > > @@ -6,8 +6,33 @@
> > > #ifndef _XE_PAT_H_
> > > #define _XE_PAT_H_
> > > 
> > > +#include "xe_device_types.h"
> > 
> > why?  we don't add includes, particularly in headers, that aren't used.
> > 
> > > +
> > > +#define XELP_PTE_PAT_MASK                  (BIT_ULL(7) | BIT_ULL(4) | BIT_ULL(3))
> > > +#define XELP_PDE_PAT_MASK                  (BIT_ULL(12) | BIT_ULL(4) | BIT_ULL(3))
> > > +#define XELP_PAT_WB_CACHE              0
> > > +#define XELP_PAT_WC_CACHE              1
> > > +#define XELP_PAT_WT_CACHE              2
> > > +#define XELP_PAT_UNCACHE               3
> > > +
> > > +#define XEHPC_PAT_CLOS0_UNCACHE        0
> > > +#define XEHPC_PAT_CLOS0_WC_CACHE       1
> > > +#define XEHPC_PAT_CLOS0_WT_CACHE       2
> > > +#define XEHPC_PAT_CLOS0_WB_CACHE       3
> > > +#define XEHPC_PAT_CLOS1_WT_CACHE       4
> > > +#define XEHPC_PAT_CLOS1_WB_CACHE       5
> > > +#define XEHPC_PAT_CLOS2_WT_CACHE       6
> > > +#define XEHPC_PAT_CLOS2_WB_CACHE       7
> > > +
> > > +#define XELPG_PAT_WB_CACHE             0
> > > +#define XELPG_PAT_WT_CACHE             1
> > > +#define XELPG_PAT_UNCACHE              2
> > > +#define XELPG_PAT_1_WAY_WB_CACHE       3
> > > +#define XELPG_PAT_2_WAY_WB_CACHE       4
> > 
> > only define what you use.
> > 
> > > +
> > > struct xe_gt;
> > > 
> > > void xe_pat_init(struct xe_gt *gt);
> > > +void xe_pte_pat_init(struct xe_device *xe);
> > > 
> > > #endif
> > > diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> > > index 5709518e314b..eccb0942ff46 100644
> > > --- a/drivers/gpu/drm/xe/xe_pt.c
> > > +++ b/drivers/gpu/drm/xe/xe_pt.c
> > > @@ -58,19 +58,16 @@ static struct xe_pt *xe_pt_entry(struct xe_pt_dir *pt_dir, unsigned int index)
> > >  * Return: An encoded page directory entry. No errors.
> > >  */
> > > u64 xe_pde_encode(struct xe_bo *bo, u64 bo_offset,
> > > -		  const enum xe_cache_level level)
> > > +		  const enum xe_cache_level cache)
> > > {
> > > 	u64 pde;
> > > +	struct xe_vm *vm = bo->vm;
> > > +	struct xe_device *xe = vm->xe;
> > > 
> > > 	pde = xe_bo_addr(bo, bo_offset, XE_PAGE_SIZE);
> > > 	pde |= XE_PAGE_PRESENT | XE_PAGE_RW;
> > > 
> > > -	/* FIXME: I don't think the PPAT handling is correct for MTL */
> > > -
> > > -	if (level != XE_CACHE_NONE)
> > > -		pde |= PPAT_CACHED_PDE;
> > > -	else
> > > -		pde |= PPAT_UNCACHED;
> > > +	pde = xe->ppgtt_pde_encode(xe, pde, cache);
> > > 
> > > 	return pde;
> > > }
> > > @@ -78,6 +75,9 @@ u64 xe_pde_encode(struct xe_bo *bo, u64 bo_offset,
> > > static u64 __pte_encode(u64 pte, enum xe_cache_level cache,
> > > 			struct xe_vma *vma, u32 pt_level)
> > > {
> > > +	struct xe_vm *vm = xe_vma_vm(vma);
> > > +	struct xe_device *xe = vm->xe;
> > > +
> > > 	pte |= XE_PAGE_PRESENT | XE_PAGE_RW;
> > > 
> > > 	if (unlikely(vma && xe_vma_read_only(vma)))
> > > @@ -86,19 +86,7 @@ static u64 __pte_encode(u64 pte, enum xe_cache_level cache,
> > > 	if (unlikely(vma && xe_vma_is_null(vma)))
> > > 		pte |= XE_PTE_NULL;
> > > 
> > > -	/* FIXME: I don't think the PPAT handling is correct for MTL */
> > > -
> > > -	switch (cache) {
> > > -	case XE_CACHE_NONE:
> > > -		pte |= PPAT_UNCACHED;
> > > -		break;
> > > -	case XE_CACHE_WT:
> > > -		pte |= PPAT_DISPLAY_ELLC;
> > > -		break;
> > > -	default:
> > > -		pte |= PPAT_CACHED;
> > > -		break;
> > > -	}
> > > +	pte = xe->ppgtt_pte_encode(xe, pte, cache);
> > > 
> > > 	if (pt_level == 1)
> > > 		pte |= XE_PDE_PS_2M;
> > > diff --git a/drivers/gpu/drm/xe/xe_pt_types.h b/drivers/gpu/drm/xe/xe_pt_types.h
> > > index 2ed64c0a4485..2a94ecbaa844 100644
> > > --- a/drivers/gpu/drm/xe/xe_pt_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_pt_types.h
> > > @@ -9,9 +9,10 @@
> > > #include "xe_pt_walk.h"
> > > 
> > > enum xe_cache_level {
> > > -	XE_CACHE_NONE,
> > > +	XE_CACHE_NONE = 0,
> > > 	XE_CACHE_WT,
> > > 	XE_CACHE_WB,
> > > +	XE_CACHE_LAST,
> > 
> > I can't make sense of these changes here
> > 
> > Lucas De Marchi
> > 
> > > };
> > > 
> > > #define XE_VM_MAX_LEVEL 4
> > > -- 
> > > 2.25.1
> > > 
> 
> -- 
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
