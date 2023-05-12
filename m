Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C80FC77B7C
	for <intel-xe@archiver.kernel.org>; Fri, 12 May 2023 16:32:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE26C10E6D7;
	Fri, 12 May 2023 16:32:14 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FC3010E6D7
 for <intel-xe@lists.freedesktop.org>; Fri, 12 May 2023 16:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683909133; x=1715445133;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=GXTGO0rP5s4dsEfvXWtoMfFRjXFK7/uTemYha9Voovg=;
 b=m5u8iNTB/F5ZdcTudlF5P5hM7wOt1WIfoOFdt2ACUCLFJG+MApe/CzKv
 pa5NuQD4BF23eK58dt7c64G+yNt3FmXjuW/b3ZlpcD783Z8iLdYiyrEAQ
 26OufufSpQpAGAoGlxlI81mkVvGHeepZIBZfsIHMHsKgmxrN+6h6KTt/K
 ySRI4a44gfHxmHGBD4FwcfsStmkyFvSQ+76jy/htHqHoDLjMITdCtPPJq
 /OfCEFFXFLO0uyDOIc4tN6sr/aSMQVLSHvGE0sOwTwLwmM4Oux2GKwDdG
 1x9AfzwZqC2YjdCJ8kxVWd1MfGTU++qhJAm6gdnrqO6vfjsP/g7Kgchq/ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="353081023"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; d="scan'208";a="353081023"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2023 09:31:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="765220695"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; d="scan'208";a="765220695"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga008.fm.intel.com with ESMTP; 12 May 2023 09:31:37 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 12 May 2023 09:31:37 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 12 May 2023 09:31:37 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 12 May 2023 09:31:37 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.102)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 12 May 2023 09:31:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TnXF/WVSmyU0onCeFK3YkUibGySgDBwS85jItxqWVxC3tG2+EqSUE7ragLH+lGcmrCCy0M8v8fAenhqaP5g/qVm6deMvhry0YPOci8VL2vMki1t6UsXxzB/RXMayJKTobZXr1EFN5sJbSbSKlIDkgl217cIQE2J3PEVq1YaWcI0+8l1n3W4LueWDpNcsufwAVViw6GA/a+Vz7tHFsSlWKIrQ5mYkoqGDqeZCnZt4N7ULBGJya9WumuySj4DuRORff43N7Oa2NI51182W1HSXMpNi2r31oKEwz+d2cGFrpwV5AHO5uzEFZKP5lBL7JSN08m6I16D1zBLfVMmVUHXn6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vDgcRZMKjufr1JdjM0MkiPCCnStz7cHBkxn//XtjkqI=;
 b=NsGZPG7NHZIMHi0BI7r9LF8GrvCNuCt9s6uMB4P1NND/apLXKK9JeFYuSfnoDv+tE1A0EbnHMJUSYjgqgYj5piLsRrQ47ReQOOm6YHCx2ciz7ss1rIoOxm8xjE3z6usGfjlUXquAt88s4HUupIEfHPQo3U4k8iBBTrG1fU7OKW7ILh8jbHyDubhCrw5b0Qg9SbDfyTxpiJrLGD0ZpYLk87OWZsH4yAyyKpm3OY5GMCpHrkZ/NInpjrZN5JmuHsafE8KK2XCfo2W9tTz+5KRUrNecBRCkvcMRJBRCjEreb6Y5UQEgZ0J8gi2CRSlPEPoF2x6KAzlL/v3ZF9bEIZdGAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN2PR11MB4239.namprd11.prod.outlook.com (2603:10b6:208:192::20)
 by SA1PR11MB5828.namprd11.prod.outlook.com (2603:10b6:806:237::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Fri, 12 May
 2023 16:31:33 +0000
Received: from MN2PR11MB4239.namprd11.prod.outlook.com
 ([fe80::e585:1863:208d:7e7b]) by MN2PR11MB4239.namprd11.prod.outlook.com
 ([fe80::e585:1863:208d:7e7b%4]) with mapi id 15.20.6387.019; Fri, 12 May 2023
 16:31:32 +0000
Date: Fri, 12 May 2023 09:31:27 -0700
From: Matt Atwood <matthew.s.atwood@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <lucas.demarchi@intel.com>,
 <intel-xe@lists.freedesktop.org>
Message-ID: <ZF5p3ylRXl6OcYq8@msatwood-mobl>
References: <20230511034722.1929038-1-matthew.d.roper@intel.com>
 <20230511034722.1929038-4-matthew.d.roper@intel.com>
 <qf2idx37zw7ss2s4lp6zpfomk4v3q6jid3iqfnnxi4avyh6med@qa3htrgeal4n>
 <20230512162002.GB10045@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20230512162002.GB10045@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: BY3PR05CA0005.namprd05.prod.outlook.com
 (2603:10b6:a03:254::10) To MN2PR11MB4239.namprd11.prod.outlook.com
 (2603:10b6:208:192::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR11MB4239:EE_|SA1PR11MB5828:EE_
X-MS-Office365-Filtering-Correlation-Id: b8dc193f-f1f1-436c-4442-08db5306589b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oGqkhTV/FOK7tqUHraZd80oThMr94CoQ2w9Dz+w2xTzjXV9hdewCXcI7Tgl43DmKz5xKqHpFK0IvDvyZDddKRkZGTPvp7+7qWzwf2QPZkHuSiOf5c0YN6iXeSfY0Fkh10ZGQZT7d0W77TU5TAOjuFLXou9aNWitvMQb8qVkxnHzHFgOPXwjvY4AQykXQyW+JbSSmizlM/024dFKZ9D+7Kvbz8DWJnIM/mvAMk+iZaVyfrduILzOkn+HQK+uxRUJXUjWCWSsNrIoJP4CSws6UvyFU2eL8GYVyHhVrd/X0X4bz8Xcou9Iv4amB8M6H9QHUU/tHZ5sfQjUnm7wm1tSU2h2z+0dT8xLtgxiXtO06pQDI/VFozHSlPlsEmsr0L1XxOVe71OJNWxh6d4DOzmJ3E1DC5JAEdv0sF352m0zWZqoPW+NJiAtuyTdlVRbv3KXkUFYB5lvDbMm29ZaeGgd5aw6PYG4v7ZPiuwmncysswrRxz1immJFVr+BaaARCdSHGEy8a4yEnGYS9AjFcAQXGpvk7mG5eyJlcTPqtEPmuEmC4oJR/VDl+3qHm47BtsZPt
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR11MB4239.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(366004)(396003)(346002)(136003)(376002)(39860400002)(451199021)(86362001)(66946007)(6506007)(478600001)(6666004)(6486002)(33716001)(6512007)(9686003)(186003)(38100700002)(2906002)(83380400001)(66556008)(66476007)(4326008)(5660300002)(82960400001)(41300700001)(8936002)(8676002)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cGI1Z1VsbHZ4Z3RtYzVPM3p2eWlhenc0VzNDUGtxWEhWS0tyMGdWalAzS2dK?=
 =?utf-8?B?TDBwTjVFV1FnZDVXUjJyZ2YxTkpVMGE2VHlQRi9MNEFKcnNvdk5JczFSeTg5?=
 =?utf-8?B?TnBiUHcrK1AzZHA0enJ1Q3pISUw5bmRMVmZrR2tPMWRHSlZkdUN1dmhGdFhX?=
 =?utf-8?B?TGVzbEVqK3l5L2h6Zy9qT09mVG1lR1pYN082YnNtQjhDaTZqR3M3Y2UwYThF?=
 =?utf-8?B?Q2lkUHZTNFg2MVpRVndReXp6d2hyS1JGb1FNSzREZ0VzOEtoMHQ5UnArWEZ4?=
 =?utf-8?B?UEozUzZPSUFmRkJtU1JNcXNmRk5hZ0crUm02d0ZRMGdMcC9ONXh3NXBiUkhz?=
 =?utf-8?B?VXNvOE9NN1NHcTBHYVZJYVNLWnFxaVpSSlJ1clpHYkhuVGZyQ25ZakpXNW81?=
 =?utf-8?B?RUhac0VpZGROb1g4SmhDRENJV2lDL1NyRlBnYmp5ZDJ0clU5UElVK3BRSFpy?=
 =?utf-8?B?NDFvTEpZcUVqMDRuM1pMcXhTUWdHeVdvb01ENmJKTU45b0x4R1E0OGJSb1Vl?=
 =?utf-8?B?UURFUktmM3ZrSzBIYkVtUUMrSGdrTEt2K1Y1T2tnS3pUd1VGYlZzYWNTOU1h?=
 =?utf-8?B?N0UwZlJpenpLY21vaTZISU93L2s0MmxzMjZwSnl1TzBVVkQyQ21UZGdRQmJi?=
 =?utf-8?B?NDQvS0QrWFV3cjJSeDM4aE4yRWNHVEVENHo1eGM2eXZSbE8wRmdIKy9DWUVY?=
 =?utf-8?B?cGYzazZUbml6UmNaMytnTGJDSG0xalJtZzhwQkFNZkU4a3VmQUNhc0RWaHI3?=
 =?utf-8?B?Mk52U2t1K010ZmNPZkNzdmhaUGtWeHh6WnRVQk9zeGx3SHZCalJtTDNYa25I?=
 =?utf-8?B?b251UW1MV0xNQ0JSSGV1NGZyYlQ0cnc4Zmp6Si9hTnlWRWVVd3lRdktVbDAy?=
 =?utf-8?B?R0Q4TXdpcVM5TVRHRFNMYmY1VGE0azR6aFk3czJ3TWdtT0R2Z3VPWXdHeFNu?=
 =?utf-8?B?b2x2bzhyVXRxWCtENW4wKzI1QjNISTFrNjg0R2Z6T0sybU83Rmo1QlVzUFNs?=
 =?utf-8?B?OGRWV0JmRnZzWFVwRlFEMDhDMGl1eUwwSnM5SGlac2ZpVVAzZTVFMU03N0NK?=
 =?utf-8?B?N1BiTnEwTEN3UTVpZkswSzBlTEtnOThYalFEVGZuQWl6b0djZXRIaHJ3NHdI?=
 =?utf-8?B?aWZOT1lrd29YM2JtT0lJdTk3UDllY0d0V2ZDbVhod1ErZXNHdkdjczIyaWdN?=
 =?utf-8?B?VnEwREE3VVZUVHY0dzlzalc3K3VRSFI3R01rS3lramRha3REOVpJRkJEM0ZL?=
 =?utf-8?B?cTNhWWRRck5oSTFKV3RRMld6Rm9uUnpQQ0IyV3U1bFl3VklFTmRZVUpRcnVi?=
 =?utf-8?B?TklEVkFhWlJnMzNxbFN2cW1MR2VUUTlUYVRVZk1aWjBpMWlPZW1OOE5XdXV2?=
 =?utf-8?B?R1NhNXZaV2FtRk92UmZYUXBzZEhWaXJqb0ZsUUJDWlhjd3VRMzVQNjF2Y0dz?=
 =?utf-8?B?b1huTjhJYzlDM0ROcWF1am1sUlJJNzlYTHI3WVMzNTM2L3lUNVJNY3VVTWh6?=
 =?utf-8?B?U0RvV09US3NvYWQrdUJZbCsyMFp4RW1LbldEbG1ldnZWdVczd21STkZ2YmF6?=
 =?utf-8?B?YXdhUGFuTGlJS3hGL1lWaTJGZEhBa29ZRUkvbko4SkFpY1JRVUJnVzlKRzdw?=
 =?utf-8?B?L1kwTTZZUnVjR1FpMnR4QjlOZjRqUEtXUkFzN3VKb3M2cytMcEJZdy9scW5J?=
 =?utf-8?B?NFhzVFdCNEVXaERKdmY3NStndzZmMXVzL1lxNjRUTm9vVnFYT2lzdFRiaTdB?=
 =?utf-8?B?WjdRbmlRbEtVYlI1YzRFQmsrSDdzNWZ0azJQWDJWZ1d6Z1ptcjgrM3FpVDRU?=
 =?utf-8?B?WEc5ak5TWVEvNDFiRHh4YVA2dWZRdmR6WERxZUEvMEpBME5YRTVzdVBpTy9s?=
 =?utf-8?B?NmZZeGhEcmRDL1RVNm15TFVMVHU0SVRuVkhKWng0QVVYYVBNdVBjei9mYTBp?=
 =?utf-8?B?RGtWYTlSa2xMWVRNWTY3a29GRXNNeGY1SDlWUEg4eU9wVktvY25oSkZ2U25I?=
 =?utf-8?B?VkhEZzhCbGJBZjZnenBPamcrRHdTV0VvK2RYTFdsbVg1ZklQRG5wNnFrTGZt?=
 =?utf-8?B?VmxmVDVsLzl2UDhwZVdtYWg2bU91YWo0RGFSR2VQazRnVzBtYjdkcnBzWlpD?=
 =?utf-8?B?azg2T0lOTytZeHkrQ01CUDhHdWlvTXcyeEVnMS9zYThDWFBCaVZXbmJCVk5Y?=
 =?utf-8?Q?Mu7h4ZDRuaygYsbwGdo8IkU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b8dc193f-f1f1-436c-4442-08db5306589b
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB4239.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2023 16:31:32.7300 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ulFEw1nL3pHAtmzOcbEzJtX7Cx5jRZ+NDeme7ywHAYXcAmLzAegXbS3QUyBPrqEA72AAnASHoH+seAFUGZ1FHK4SbXTD4T2G5GlkWeK2kY8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5828
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 03/26] drm/xe: Add backpointer from gt to tile
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

On Fri, May 12, 2023 at 09:20:02AM -0700, Matt Roper wrote:
> On Thu, May 11, 2023 at 05:07:46PM -0700, Lucas De Marchi wrote:
> > On Wed, May 10, 2023 at 08:46:59PM -0700, Matt Roper wrote:
> > > Rather than a backpointer to the xe_device, a GT should have a
> > > backpointer to its tile (which can then be used to lookup the device if
> > > necessary).
> > > 
> > > The gt_to_xe() helper macro (which moves from xe_gt.h to xe_gt_types.h)
> > > can and should still be used to jump directly from an xe_gt to
> > > xe_device.
> > > 
> > > Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> > > ---
> > > drivers/gpu/drm/xe/xe_bb.c                  |  2 +-
> > > drivers/gpu/drm/xe/xe_gt.h                  |  5 -----
> > > drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c |  4 ++--
> > > drivers/gpu/drm/xe/xe_gt_types.h            | 14 ++++++++++++--
> > > drivers/gpu/drm/xe/xe_mocs.c                | 14 +++++++-------
> > > drivers/gpu/drm/xe/xe_pci.c                 | 11 +++++++----
> > > drivers/gpu/drm/xe/xe_pt.c                  |  2 +-
> > > 7 files changed, 30 insertions(+), 22 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_bb.c b/drivers/gpu/drm/xe/xe_bb.c
> > > index 3deb2d55f421..bf7c94b769d7 100644
> > > --- a/drivers/gpu/drm/xe/xe_bb.c
> > > +++ b/drivers/gpu/drm/xe/xe_bb.c
> > > @@ -16,7 +16,7 @@
> > > 
> > > static int bb_prefetch(struct xe_gt *gt)
> > > {
> > > -	struct xe_device *xe = gt->xe;
> > > +	struct xe_device *xe = gt_to_xe(gt);
> > > 
> > > 	if (GRAPHICS_VERx100(xe) >= 1250 && !xe_gt_is_media_type(gt))
> > > 		/*
> > > diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
> > > index 086369f7ee6d..f4e98f499b36 100644
> > > --- a/drivers/gpu/drm/xe/xe_gt.h
> > > +++ b/drivers/gpu/drm/xe/xe_gt.h
> > > @@ -49,11 +49,6 @@ static inline bool xe_gt_is_media_type(struct xe_gt *gt)
> > > 	return gt->info.type == XE_GT_TYPE_MEDIA;
> > > }
> > > 
> > > -#define gt_to_xe(gt__)								\
> > > -	_Generic(gt__,								\
> > > -		 const struct xe_gt *: (const struct xe_device *)((gt__)->xe),	\
> > > -		 struct xe_gt *: (gt__)->xe)
> > > -
> > > static inline bool xe_gt_is_usm_hwe(struct xe_gt *gt, struct xe_hw_engine *hwe)
> > > {
> > > 	struct xe_device *xe = gt_to_xe(gt);
> > > diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> > > index c815a42e2cdb..c9e8825c02aa 100644
> > > --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> > > +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> > > @@ -322,8 +322,8 @@ int xe_guc_tlb_invalidation_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
> > > 		TLB_INVALIDATION_SEQNO_MAX;
> > > 	if (!expected_seqno)
> > > 		expected_seqno = 1;
> > > -	if (drm_WARN_ON(&gt->xe->drm, expected_seqno != msg[0])) {
> > > -		drm_err(&gt->xe->drm, "TLB expected_seqno(%d) != msg(%u)\n",
> > > +	if (drm_WARN_ON(&gt_to_xe(gt)->drm, expected_seqno != msg[0])) {
> > > +		drm_err(&gt_to_xe(gt)->drm, "TLB expected_seqno(%d) != msg(%u)\n",
> > > 			expected_seqno, msg[0]);
> > > 	}
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> > > index e0ed4508269b..c4376d50786b 100644
> > > --- a/drivers/gpu/drm/xe/xe_gt_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> > > @@ -76,6 +76,16 @@ enum xe_steering_type {
> > > 	NUM_STEERING_TYPES
> > > };
> > > 
> > > +#define gt_to_tile(gt__)							\
> > > +	_Generic(gt__,								\
> > > +		 const struct xe_gt *: (const struct xe_tile *)((gt__)->tile),	\
> > > +		 struct xe_gt *: (gt__)->tile)
> > > +
> > > +#define gt_to_xe(gt__)										\
> > > +	_Generic(gt__,										\
> > > +		 const struct xe_gt *: (const struct xe_device *)(gt_to_tile(gt__)->xe),	\
> > > +		 struct xe_gt *: gt_to_tile(gt__)->xe)
> > > +
> > > /**
> > >  * struct xe_gt - A "Graphics Technology" unit of the GPU
> > >  *
> > > @@ -90,8 +100,8 @@ enum xe_steering_type {
> > >  * within a tile.
> > >  */
> > > struct xe_gt {
> > > -	/** @xe: backpointer to XE device */
> > > -	struct xe_device *xe;
> > > +	/** @tile: Backpointer to GT's tile */
> > > +	struct xe_tile *tile;
> > > 
> > > 	/** @info: GT info */
> > > 	struct {
> > > diff --git a/drivers/gpu/drm/xe/xe_mocs.c b/drivers/gpu/drm/xe/xe_mocs.c
> > > index 817afd301d52..d57fbf16a3ef 100644
> > > --- a/drivers/gpu/drm/xe/xe_mocs.c
> > > +++ b/drivers/gpu/drm/xe/xe_mocs.c
> > > @@ -471,7 +471,7 @@ static void __init_mocs_table(struct xe_gt *gt,
> > > 	unsigned int i;
> > > 	u32 mocs;
> > > 
> > > -	mocs_dbg(&gt->xe->drm, "entries:%d\n", info->n_entries);
> > > +	mocs_dbg(&gt_to_xe(gt)->drm, "entries:%d\n", info->n_entries);
> > > 	drm_WARN_ONCE(&xe->drm, !info->unused_entries_index,
> > > 		      "Unused entries index should have been defined\n");
> > > 	for (i = 0;
> > > @@ -479,7 +479,7 @@ static void __init_mocs_table(struct xe_gt *gt,
> > > 	     i++) {
> > > 		struct xe_reg reg = XE_REG(addr + i * 4);
> > > 
> > > -		mocs_dbg(&gt->xe->drm, "%d 0x%x 0x%x\n", i, reg.addr, mocs);
> > > +		mocs_dbg(&gt_to_xe(gt)->drm, "%d 0x%x 0x%x\n", i, reg.addr, mocs);
> > > 		xe_mmio_write32(gt, reg, mocs);
> > > 	}
> > > }
> > > @@ -508,13 +508,13 @@ static void init_l3cc_table(struct xe_gt *gt,
> > > 	unsigned int i;
> > > 	u32 l3cc;
> > > 
> > > -	mocs_dbg(&gt->xe->drm, "entries:%d\n", info->n_entries);
> > > +	mocs_dbg(&gt_to_xe(gt)->drm, "entries:%d\n", info->n_entries);
> > > 	for (i = 0;
> > > 	     i < (info->n_entries + 1) / 2 ?
> > > 	     (l3cc = l3cc_combine(get_entry_l3cc(info, 2 * i),
> > > 				  get_entry_l3cc(info, 2 * i + 1))), 1 : 0;
> > > 	     i++) {
> > > -		mocs_dbg(&gt->xe->drm, "%d 0x%x 0x%x\n", i, LNCFCMOCS(i).addr,
> > > +		mocs_dbg(&gt_to_xe(gt)->drm, "%d 0x%x 0x%x\n", i, LNCFCMOCS(i).addr,
> > > 			 l3cc);
> > > 		xe_mmio_write32(gt, LNCFCMOCS(i), l3cc);
> > > 	}
> > > @@ -524,7 +524,7 @@ void xe_mocs_init_early(struct xe_gt *gt)
> > > {
> > > 	struct xe_mocs_info table;
> > > 
> > > -	get_mocs_settings(gt->xe, &table);
> > > +	get_mocs_settings(gt_to_xe(gt), &table);
> > > 	gt->mocs.uc_index = table.uc_index;
> > > 	gt->mocs.wb_index = table.wb_index;
> > > }
> > > @@ -537,8 +537,8 @@ void xe_mocs_init(struct xe_gt *gt)
> > > 	/*
> > > 	 * LLC and eDRAM control values are not applicable to dgfx
> > > 	 */
> > > -	flags = get_mocs_settings(gt->xe, &table);
> > > -	mocs_dbg(&gt->xe->drm, "flag:0x%x\n", flags);
> > > +	flags = get_mocs_settings(gt_to_xe(gt), &table);
> > > +	mocs_dbg(&gt_to_xe(gt)->drm, "flag:0x%x\n", flags);
> > > 
> > > 	if (flags & HAS_GLOBAL_MOCS)
> > > 		__init_mocs_table(gt, &table, GLOBAL_MOCS(0).addr);
> > > diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> > > index e79b16d8bf7f..87c328106aca 100644
> > > --- a/drivers/gpu/drm/xe/xe_pci.c
> > > +++ b/drivers/gpu/drm/xe/xe_pci.c
> > > @@ -471,6 +471,7 @@ static int xe_info_init(struct xe_device *xe,
> > > {
> > > 	const struct xe_graphics_desc *graphics_desc = NULL;
> > > 	const struct xe_media_desc *media_desc = NULL;
> > > +	struct xe_tile *tile;
> > > 	struct xe_gt *gt;
> > > 	u8 id;
> > > 
> > > @@ -525,13 +526,15 @@ static int xe_info_init(struct xe_device *xe,
> > > 	xe->info.step = xe_step_get(xe);
> > > 
> > > 	for (id = 0; id < xe->info.tile_count; ++id) {
> > > -		xe->tiles[id].xe = xe;
> > > -		xe->tiles[id].id = id;
> > > +		tile = &xe->tiles[id];
> > > +		tile->xe = xe;
> > > +		tile->id = id;
> > > 
> > > -		gt = &xe->tiles[id].primary_gt;
> > > +		gt = &tile->primary_gt;
> > 
> > these seem to have been squash in the wrong patch, changing the style
> > from using xe->tiles[i].* to declaring a local var. Maybe squash it in
> > the previous one to avoid the back and forth here?
> > 
> > otherwise,
> > 
> > 
> > Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
> > 
> > > 		gt->info.id = id;
> > > -		gt->xe = xe;
> > > +		gt->tile = tile;
> > > 
> > > +		gt->info.id = id;
> > 
> > the gt than has the id of the tile? Because right now there can only be
> > primary_gt? Looks odd, but it's a consequence of removing the only
> > platform with 1 tile and multiple gts.
> 
> Yeah, deciding how we want to number GTs is a bit of an open question.
> Right now at the end of this series, the numbering is
> 
>  * PVC:  0 = root tile primary, 1 = remote tile primary
>  * MTL:  0 = root tile primary, 1 = root tile media
>  * everything else:  only has GT0
> 
> Some day we may have a platform with multiple tiles and separate
> graphics/media GTs within each tile.  In that case would all graphics
> GTs get even numbers and all media GTs get odd?  Or would all primary
> GTs get gt_id = tile_id and all media GTs get gt_id = tile_id +
> tile_count?
> 
> The bigger open question is whether uapi should still expose GTs (like
> it does today) or whether it should be converted to just expose tiles
> and keep the graphics vs media separation an internal implementation
> detail.  If uapi changes to only expose tiles, then we probably don't
> even need IDs for the GTs...
I recall doing the uapi changes for topology that UMD seemed really
bound to the idea of interacting with "GTs". Likely only exposing tiles
would cause a need for alot of changes in implementation and methodolgy in the UMD. 
MattA
> 
> 
> Matt
> 
> > 
> > Lucas De Marchi
> > 
> > > 		if (id == 0) {
> > > 			gt->info.type = XE_GT_TYPE_MAIN;
> > > 			gt->info.vram_id = id;
> > > diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> > > index f15282996c3b..61126cefe0b5 100644
> > > --- a/drivers/gpu/drm/xe/xe_pt.c
> > > +++ b/drivers/gpu/drm/xe/xe_pt.c
> > > @@ -695,7 +695,7 @@ xe_pt_stage_bind_entry(struct xe_ptw *parent, pgoff_t offset,
> > > 		 * TODO: Suballocate the pt bo to avoid wasting a lot of
> > > 		 * memory.
> > > 		 */
> > > -		if (GRAPHICS_VERx100(xe_walk->gt->xe) >= 1250 && level == 1 &&
> > > +		if (GRAPHICS_VERx100(gt_to_xe(xe_walk->gt)) >= 1250 && level == 1 &&
> > > 		    covers && xe_pt_scan_64K(addr, next, xe_walk)) {
> > > 			walk->shifts = xe_compact_pt_shifts;
> > > 			flags |= XE_PDE_64K;
> > > -- 
> > > 2.40.0
> > > 
> 
> -- 
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
