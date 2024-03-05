Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 347B0C54E41
	for <intel-xe@archiver.kernel.org>; Tue,  5 Mar 2024 19:14:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEB3089F63;
	Tue,  5 Mar 2024 19:14:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OlkTM/XQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEE4E89F63
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Mar 2024 19:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709666082; x=1741202082;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=zDnd2gd/mbtKtUnovNOBs05xiVP68vai3lVkT+Cb/a8=;
 b=OlkTM/XQi9m6pHRnoQJ0gM+gEzGf0ruu2/qHPzsg8gfcMBVkt9U3tA7X
 kvVbtJWFnNgnmket44M5sZooMSgn3vcZH+Q8D6fy118gbh6OnWzcrB7t0
 I0twh6QUIk14Di25vlN5i7kxVTa/TwtraaPXa2i429fI4JC7ma4l8IGLN
 mvxLmobMTlU097hj1FTfERaskUet5IMvw3qz3XkZdDVlNib3OEAHoCcoD
 dx3skNf69JZTiKjaTDi47rTj0Y+Y/eu3/mx0MSC5xI0VrpTOsgg+JfTGn
 SlakWKtGq3LuwoxLr8CIRmynJFzMeYC8o/s4mUvSnVzZGr5IfRIspmKZB w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11004"; a="26702353"
X-IronPort-AV: E=Sophos;i="6.06,206,1705392000"; d="scan'208";a="26702353"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2024 11:14:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,206,1705392000"; d="scan'208";a="10059752"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Mar 2024 11:14:41 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 5 Mar 2024 11:14:40 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 5 Mar 2024 11:14:40 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 5 Mar 2024 11:14:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KG2vvPW4canjyy5x16s1ko70uPQjPMAgSTrO91s+NTTzjKcsEltWuRXf/2Csun9Vyc66rGVQsku07GlZkd0q6WiEdcO00SAIfDBqGlY28IcX4OEpet0YrLIZ760mp8PdcM+jwOnR2nMpXMsbF+fxngC7Qz3cyG1QgDyVuPx5wTqV6mjZXSV9TegfSJvrz2u3W5TmEkRz5yFLq2QtLt4GSIgSQ4gIezjDrzm7Z65gN0u8xB3/5GvUBGahzlxYrrqIcPyX7ucvgdvqXPyMK0cyjuZOmPh/owxPAHc2zdSPOm4Qe9wqutxYIKB1kWOk4l/qOyqwuDXG7QTrxN4SweYRSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wUU78ME3lEh/q7jqY0IkE5dN9/Dj/0kTxIsuvlP6nkE=;
 b=iAA3YoYvwng+lB8qAwdfu8InSrtGgLTQPW+zw+Ik/qS03rseozIRrMGbeyEwztBV4AbvBFHPLShQ6L406ms4V7gmeV7U/F76ai5gqCrI0ivsuzdSALTU3+rxGczXX4Jpq1uYUHHtDxoYJA8pYX/oMbp7TpKVmDNUI+GLFcsRVn/VxurJ/Fhi3NpvnsbvEKXzi3W9EYHsDO6XVdbzNSQIdKjWAqplNNp/mmEjUvYtgjJugXqWempUThwWdJaVb8Jn9NEM1qozrlEcVnep4eKZw50S/BJSFuFqsYNtg7dfWsnRZwnMwKsSi6k00Z2OSAct+KaMjRloAzAfcl488/GRLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DM4PR11MB6430.namprd11.prod.outlook.com (2603:10b6:8:b6::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.23; Tue, 5 Mar
 2024 19:14:33 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7362.019; Tue, 5 Mar 2024
 19:14:33 +0000
Date: Tue, 5 Mar 2024 14:14:29 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>, Lucas De Marchi <lucas.demarchi@intel.com>, 
 Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH 2/4] drm/xe: Do not grab forcewakes when issuing GGTT TLB
 invalidation via GuC
Message-ID: <ZedvFU3GZCTQCsQd@intel.com>
References: <20240305131250.5330-1-maarten.lankhorst@linux.intel.com>
 <20240305131250.5330-3-maarten.lankhorst@linux.intel.com>
 <ZedrH8URnZU/PGTS@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZedrH8URnZU/PGTS@DUT025-TGLU.fm.intel.com>
X-ClientProxiedBy: BY3PR04CA0010.namprd04.prod.outlook.com
 (2603:10b6:a03:217::15) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DM4PR11MB6430:EE_
X-MS-Office365-Filtering-Correlation-Id: e4937d0e-cc2a-4e35-86a4-08dc3d487d15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /e06LWLll+AzLF5Gnw5LSRJihiqXImYMTAOT1tSJclzgnIvbcOantkA9vWRkGIIo2EFUHvHaI51vWdoToPIl1Z9loN5H/xZhP2pbldgiZwM/ckYQ7zj1zRAC8So7YWjnrL25K8c1bl6QXPX8u7PKSuj3yPc0AUcG44iy6Kc9c37AI3QtxTHmg4LR8uhtrMYtL4tP3kVOnGZf4tA6YPOalatwn2r8hpegs5Z5RHRHnYLyMCEBgqvJU/jC/fVGpOT0AR75CH4Ug+CTe9D/ytzCHzo8rZVnL6dVlKEh5am1ktG7xLL2OFAqjRufFqTm2pM1yQlvnlAbmlsUtxWkvHp7FiQ/SPIdL++x92f+xBhiHOnbNNUWOwbXi2iJn8GxvHaz48D4xSPw5YvlkaOSCcw6y8D5eWPimuQlDKUWSFvkqy4/M2mfGi2FIVc0ptC1PgotCoKhQR8qO2Vk6Lkb/uTvF/k6RNlEKi95XKhHVfVBhtq58ceB/EUPkSapbS8O14aQrW7c/6wPbTLjRCznOzGNIaAVu1iM8xt7AlYkBQYKQa0AAd0nGT+Mjd2UUCaUpS0yudbhDZixdEEG07SS166wsZVUD7eoTP2fSgmePVv0RMbhhkVIJX/hYO7z6UDNAqseiiYnIORaih76wRTQRvB6Ug==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1QiHdLn9QyKlHAXJPMmOZeZ8pLaLcZFdh7mZMXnu2eK/fpc3VRhQH8GMRJ4I?=
 =?us-ascii?Q?stiKftaJRQb5EDb/iFuDdDDG0NujNg4xB2sTVBFs7HJkmxE45yM2Ebrt8aLJ?=
 =?us-ascii?Q?OGU2Km3jjGz1u7Cb8DAEbZvvuCg2fCmS5nJ9oTNF1DFCKOmpOHvPbweMXUZG?=
 =?us-ascii?Q?k22+dFQX7EpJBipDYAsR9ITea90NYjCa1hS1JzojzuhxeU+K6i8xUiJiLkk0?=
 =?us-ascii?Q?SVlLd9cr+wOh29OfvPduGG1wtqHtjySWw/wla4CA204MKaPjpvo2qxuX7iOK?=
 =?us-ascii?Q?vGiE6AxZR01iqNAGZIhEGv3GCYt5cpNwHCOuKgK9tVM34YcmCGGmq+44QULm?=
 =?us-ascii?Q?3HTUDaHHQ2/sy9MfPwKy3GJJ5Fl2aXe6aBE8LE0jhtF6LlgZp8XRdEk5XTUm?=
 =?us-ascii?Q?NPLaZW0twoEmdKOZLIUmLs83SZPKIJxJqVYbo1uHez8iFRq+HaqL4SoirGKA?=
 =?us-ascii?Q?Oi9RWogIOWTKUYSohiffDrpj7bKtoFFxCdpYiwdyXNNEVgXRDiXgUg1XHG9A?=
 =?us-ascii?Q?S0LaMucsWtRuPstutz0iDWlHT6A1YePzizMNGh8ZEvmfLOzTvO5cLU+EwT3X?=
 =?us-ascii?Q?ESnzyOFvFewEaXcHapyBbGgwhEuBTckRnvvMbySI8r/YyZerisLayVGddhRX?=
 =?us-ascii?Q?7MF3ZiJV3kotyGvnTiv/4OgjGu60dCWl1RJh9FLX2g0L0SKmLb2Xk6EaX2Qo?=
 =?us-ascii?Q?bk7/zuQeeL06CNMw6t+1k1yIeLb+EsbcECgqcj5g6EqwTJjprSXvxnNNEfsf?=
 =?us-ascii?Q?HfRfH4OT7px9acoPggVKgALTbL14Tp14reciosrHyfFRhZcDrXE4AzwsYrAj?=
 =?us-ascii?Q?QIAniXuBatGv8eJBOGwHWJL1NxVOuxoA2rN/ABjOmZjTPixvXcyCVdVS50wn?=
 =?us-ascii?Q?WNWMZCtKNnLnpQpE4iSTuqu7g/gfUywrsV/LevFgNVyHeV1Oh/cnTBuq0Ice?=
 =?us-ascii?Q?NJqmRvttB+LnYnN+z9t08GTt68cJmV9EUwyqByJxS1447Cxn5w6M/qOBSHHi?=
 =?us-ascii?Q?uFGg2UIXsTczB7BqIsH8lr4r0uN7R8C+ndtaT12dKGO966iVFJ0pTzlp2n3s?=
 =?us-ascii?Q?9OAju9J81HznTdeMSW/m7yLAyeXopPqjL2RyWDTnU/mCLPcm/5imvKd509re?=
 =?us-ascii?Q?00j471k1RqZyDnPZQZP7LpPEnwnoJCFL4SHCewATDVdfb0kVh1EN0PeQ2Dk6?=
 =?us-ascii?Q?WBm74/ItLveeW2spktEQkSEIAAkp7sv2EaYkUWGY663+h8rPYv3wkATrKu4f?=
 =?us-ascii?Q?A5mOSH34lDlDI2RSXocd/cPQC1YuvBaJpCXL9ZF+axqpyC6lwUIvrX0YjRm4?=
 =?us-ascii?Q?EyCDowkY55oXj6r4VgsKYVkIyXu/PETTdB+Oo5qH7FVAiUh6WWogGBA51Ezm?=
 =?us-ascii?Q?rP3uB6s+kg3tlrbmvswYySZdu95gnVh+fTm0IG1zQf0Dx53rn2eVHT14KTP5?=
 =?us-ascii?Q?6bcZQXkGFMH2ooFy2ySRZsoIIHSRem+1yiOURh3LVDY5/6rW9ktOgcDUQMcD?=
 =?us-ascii?Q?Cbu1juKww9Uiw6mI51Fql3zoUyAJalz1IQgjTO4fYFqnF/UEmuEI90TfdIMa?=
 =?us-ascii?Q?ogBY3VNtY/w8mTCigHnqzKTrCzqX/9YuRNTgUY6eVVlDr2mLx+O9yhZLN1TD?=
 =?us-ascii?Q?wQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e4937d0e-cc2a-4e35-86a4-08dc3d487d15
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2024 19:14:33.1392 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AO/A8ifzLzY/BskvCeojphktq7rcAJQAqdKN2wNOpH7X4HsvguTZGluozN9ucwqtPG2qOmXBO/JKehM3Hll5ig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6430
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

On Tue, Mar 05, 2024 at 06:57:35PM +0000, Matthew Brost wrote:
> On Tue, Mar 05, 2024 at 02:12:48PM +0100, Maarten Lankhorst wrote:
> > Forcewakes are not required for communication with the GuC via CTB
> > as it is a memory based interfaced. Acquring forcewakes takes
> > considerable time. With that, do not grab a forcewake when issuing a
> > GGTT TLB invalidation via the GuC.
> > 
> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > Cc: Matt Roper <matthew.d.roper@intel.com>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> 
> I am the author too.

Co-developed-by: is the recommended in this case then.
Besides the signed-off-by.

> 
> Matt
> 
> > Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_ggtt.c                | 7 -------
> >  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 2 ++
> >  2 files changed, 2 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> > index 0435e1202c46..325337c38961 100644
> > --- a/drivers/gpu/drm/xe/xe_ggtt.c
> > +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> > @@ -256,16 +256,9 @@ static void ggtt_invalidate_gt_tlb(struct xe_gt *gt)
> >  	if (!gt)
> >  		return;
> >  
> > -	/*
> > -	 * Invalidation can happen when there's no in-flight work keeping the
> > -	 * GT awake.  We need to explicitly grab forcewake to ensure the GT
> > -	 * and GuC are accessible.
> > -	 */
> > -	xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> >  	err = xe_gt_tlb_invalidation_ggtt(gt);
> >  	if (err)
> >  		drm_warn(&gt_to_xe(gt)->drm, "xe_gt_tlb_invalidation_ggtt error=%d", err);
> > -	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
> >  }
> >  
> >  void xe_ggtt_invalidate(struct xe_ggtt *ggtt)
> > diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> > index f29ee1ccfa71..a3c4ffba679d 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> > @@ -247,6 +247,7 @@ int xe_gt_tlb_invalidation_ggtt(struct xe_gt *gt)
> >  
> >  		xe_gt_tlb_invalidation_wait(gt, seqno);
> >  	} else if (xe_device_uc_enabled(xe)) {
> > +		xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> >  		if (xe->info.platform == XE_PVC || GRAPHICS_VER(xe) >= 20) {
> >  			xe_mmio_write32(gt, PVC_GUC_TLB_INV_DESC1,
> >  					PVC_GUC_TLB_INV_DESC1_INVALIDATE);
> > @@ -256,6 +257,7 @@ int xe_gt_tlb_invalidation_ggtt(struct xe_gt *gt)
> >  			xe_mmio_write32(gt, GUC_TLB_INV_CR,
> >  					GUC_TLB_INV_CR_INVALIDATE);
> >  		}
> > +		xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
> >  	}
> >  
> >  	return 0;
> > -- 
> > 2.43.0
> > 
