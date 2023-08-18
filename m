Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 408A1EE4997
	for <intel-xe@archiver.kernel.org>; Fri, 18 Aug 2023 20:43:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCDE010E56B;
	Fri, 18 Aug 2023 20:43:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FFA110E586
 for <intel-xe@lists.freedesktop.org>; Fri, 18 Aug 2023 20:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692391420; x=1723927420;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=BRNBLVyazVlox9xKCwdPp16nL3CcLVnfxwfejzoGp04=;
 b=KSJKcez3FbMLETvQ28ObJT9YwkapQTRn1tlsWF5OEOIJCj/4r2o1ePPi
 po40KDqC4OsruLxL4aDnccJUmeJS7Xnqaf9sdpS9w5PUO5B1ulOhY610H
 wHcS+Oc+wpcjkvyKyvTmPwyew5W7PoRUm7/3RegPX1a5FUOOhBUK/MXlr
 YnEmyjHiUU8x46ntsnQTmifNn8R37weNdJ7b8s9gKrKSEzBrss1dEAenC
 errqfuaq1CLy8NKUSgprIZo/OEZQdhxZi0BLNqlePGD9LVHM0OQQdZ97h
 K50op2HX3R3+Ljburm/rb3odT3UOET2oU+kYYfL7JrJiDkPbN6n5yZBws A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10806"; a="353494943"
X-IronPort-AV: E=Sophos;i="6.01,184,1684825200"; d="scan'208";a="353494943"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2023 13:43:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10806"; a="712128741"
X-IronPort-AV: E=Sophos;i="6.01,184,1684825200"; d="scan'208";a="712128741"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga006.jf.intel.com with ESMTP; 18 Aug 2023 13:43:38 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 18 Aug 2023 13:43:38 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 18 Aug 2023 13:43:38 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.45) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 18 Aug 2023 13:43:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UGMHuomTQVpa26/2DLV4Gyadhx7SBAR/FlswuqROLVGcI2uFQPtnxPAoAHKoVSMgP0I4CpaAGcU5wP9bOyZjIqegaZES58c5ho2QooKp/4QcXKZtTXG5VgF8Vedt4R5i59uQFRXaIkM6UhRDHH74m+2E/Ru+mJ0VC3DxPzKdHWo3ertkcw797lpKcTkmIHTb6LRc+mWkGv/vYSI79ZSNb9i6HgbSDoNp2NLjeHjBbj7EVJTSuzcFrgoKHqoLb0c7mhUW0LpW/m9lFSxbE/qn4DqIO0UIAxb6WiS1aRVy7K88bdGT16b+pdzSKomHmJRxmF0ERF2UJULrzsE/DOIVeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lx29JvUH4U5Auqz+VisY5XMT8pZyOL9pftciDtTAeEg=;
 b=W//ZXPI2ES3nxA+Wnkb0HXx7utw3aWouC+dYvHjoZJazPCTd9yXw2mage0/87KihDOAvNzv2T4AWyVDO3blgj1aPZEsoSM006JwXXcd8DtHWhTuZTRpmVYsm4ZUt7FEua15pQkMDyNqA8iqxsOmwaiwremMhfI/MMCANovmZV1f0J8O+RdQYhhkX7BGAbSWrdX8iCJkLzB/zW7wo6PGgHWnbPGr3u8z6yU7BZef6OZDxoCetGb2Tg4lSdiqjNuIU372rFAoS34S0pzs8s1K1dMBs9RuXC/9BCArHAX205dgNbFEZc/hnu2RoX0SUuLxnlDriYcvjm1eVBrYsrd+97Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 SA1PR11MB6941.namprd11.prod.outlook.com (2603:10b6:806:2bd::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.31; Fri, 18 Aug
 2023 20:43:33 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::de6b:b5a9:e542:b41]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::de6b:b5a9:e542:b41%5]) with mapi id 15.20.6678.031; Fri, 18 Aug 2023
 20:43:33 +0000
Date: Fri, 18 Aug 2023 13:43:30 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Message-ID: <20230818204330.GB986140@mdroper-desk1.amr.corp.intel.com>
References: <20230817110352.7601-1-niranjana.vishwanathapura@intel.com>
 <20230817110352.7601-4-niranjana.vishwanathapura@intel.com>
 <20230817162906.GD3375865@mdroper-desk1.amr.corp.intel.com>
 <ZN9rFgXcrSzEUD21@nvishwa1-DESK>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZN9rFgXcrSzEUD21@nvishwa1-DESK>
X-ClientProxiedBy: BYAPR01CA0006.prod.exchangelabs.com (2603:10b6:a02:80::19)
 To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|SA1PR11MB6941:EE_
X-MS-Office365-Filtering-Correlation-Id: 83996e11-3bee-4b66-c65a-08dba02bc99b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1zRE1iBL04M0xdrXXdF/ZE5vrTdTFf70zxQqfgdrtoE5dLhwPgSve/XRvnS3WpCfxpcrUL+0Y15bE3CifOyvMryw8Wd8DPq1b9avfd1s8EaE6JpB3H6dpHnGbvUET6xvO7p5TFv3J+RlJqAbwzOeXPpI2EMCaDl+ZFvxGMsVUqU6Nv1bnfxiLkdIyKnm73jJeYzqPVYRh8TOjCZh+FIFXYghkr7ZwatRE1M2WeEfef+OfBiDkTjM4lmbXTLz9ghDEKXRJn2TnLmZH9exqOrfCw51AI9AZyDhNh+TkzJjwjZppPl7LAVcdricCAwxZkbDrVJETjJjDISzh9itppwA838nDeRGfsqyOMlReB6NoxgUWkQ5H9jowkIhgAElBsaSo12zXjizf5mhcdsq+ToVdYc1glYPz0r9zCFmih2km9eki6wSL+NUXruoeqqHK//A24Ur4hs3SKPJDLi4uQrWNmWeY966lahKcVbw/WK4l5MXpBBM77O2Ww2shhNV7DFA1t9dnJ/LsnuX1AKh6zqkAUovjBdB9N4IkJRQmb18+sk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(39860400002)(136003)(366004)(396003)(451199024)(1800799009)(186009)(86362001)(33656002)(82960400001)(38100700002)(966005)(107886003)(5660300002)(6506007)(66946007)(66476007)(478600001)(6486002)(316002)(66556008)(6636002)(26005)(1076003)(8936002)(6512007)(8676002)(4326008)(41300700001)(6862004)(83380400001)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AtSqRG6ZhdevXIG0fhVjw6JV4j75yRsbvJP2KbPgjt8Xify5sfyL0jAKKM6V?=
 =?us-ascii?Q?f62tH7G29/7jctV0ExotsriYN5DoS205M36S5LGunuC3KvWmOrh8ZlXyvncc?=
 =?us-ascii?Q?dw3x4eajwWJa5ycCAvAzt16bDjDSYd+Tc6gNRTc9B0cR1YPK4UH2RtFTUgys?=
 =?us-ascii?Q?+Irp+m5OFPvaFjVuELHHsdljFNZINio2cThn4fuVy+O58W03b8kKz+yl2Ize?=
 =?us-ascii?Q?NvP5D+2IATcdi7azqaKqiqSW7ELfBcV1TJq1kN8lpcU8SghPvh1wJMUqOM4y?=
 =?us-ascii?Q?lVL3Kcz/76UUpa71IwuExO4QSQpgIv736OybcPdvjj1uCF49GqT/6BGfw8uw?=
 =?us-ascii?Q?I8Gsz4FOcIkDDBTw6Bfpjj4Gu6HeL5YmVpwBJTwqc/22ctg7HIrSU09iJokn?=
 =?us-ascii?Q?f2ztTi/D+f2HMeJ1LF1G2lRQCPfYtLRUaiG/g0u1TDi29lEbad9SDO2uJl4N?=
 =?us-ascii?Q?tqmUFjNC1FtT8hc8qc2q/Jgkv1oQXjiOqd7hcit+IxA+tJ3IxeCIXZqXNKKA?=
 =?us-ascii?Q?hWvN03HlvU75TGYW2nMcNSsCBUf8ScJme+I72O1uC+lofP8E8JZzvZMcaxrD?=
 =?us-ascii?Q?HiwcZHByts4cmiqGk1jSCTMDoZbSZvNA6qm258mfAM2e7aTkSqNthXtlpsWU?=
 =?us-ascii?Q?SdzJOGhNfKPk+xFp3J9gw4tahT8RelpNSz4llIxAQRccoJ5n5TdOKLXRX3ig?=
 =?us-ascii?Q?mezeA8CJbPaWzME9IG3gEMTVPs2q/Tob5C7srkzqS0kTJ8gkre/dDX3+szkn?=
 =?us-ascii?Q?cdtZMyWhzLwW8NtxoRJAJ32rFDH/qlUwGcSkxJ9uNE/hIzvMCqBxHRCC9ZQ5?=
 =?us-ascii?Q?3vpcxMEu/oxTLv4Q3shBQg642ZFix9O6cHyBXMa3RMBGOTgDkppsXRlXs/wV?=
 =?us-ascii?Q?3EZezMVkz7nnnZP66uQUPAXTGcex02N5fYlNeZHF1KkprGZc+7q6Q/tfvpkw?=
 =?us-ascii?Q?HURj48eSUj7VlxEiao4L3XxjoRB/WzIsaAKuAwbsI4CTJjrpR1ErCJlZLjGK?=
 =?us-ascii?Q?svkdoKPRQXxo9ED5CLjOoxy2Xx7CMcu57wClG9MwJWSps1WqqrMo56YggjyD?=
 =?us-ascii?Q?k6edtjHLv/rmu1jM2uqZ4tL0WDmIMHgfMY82cyePQBHGaPTpakc/9dM4VccZ?=
 =?us-ascii?Q?a/wovfr2CEM+U/+4bJp/Qon1cOfeCnGeH62si7CCK5okoAFmnb53DSDAMy7K?=
 =?us-ascii?Q?Q4OXyvHAlH7BugyB1NVJ/Eampt5l9WQ/sJ321zKLR+kVoV2NzEe0/fLNoS5Y?=
 =?us-ascii?Q?dN6SgPgzpvRNxJ1Huk40/7vMtWi9UxLmcoKsHY9HXQjAWO5hqv3LkkoQAWY0?=
 =?us-ascii?Q?AX8kJBqqLAbh8XJuvYITSO28iVLNhy0azj9YeYuQmY6TOpJtJrGi/8rSqdnt?=
 =?us-ascii?Q?WzC00d3gGdv6sQ/DogPD8mqA5GhyJQA2o/ooX8YcP5BXNDO/1UbLc2l7JGuO?=
 =?us-ascii?Q?ckYu35lmLus0NMjfMwbYUyrwUeRgojqlfzDHJJEdHDsj5gnRRN6JB8fkm44p?=
 =?us-ascii?Q?0Gjd8pnobDpsLJPI93jPcw/ltijLpAiL81C0bEjqCw6gqxE0vTsbl91DjeUo?=
 =?us-ascii?Q?ATxFz7hfx2c3lzwz+edPTKNua4IsVfBMMWKCQSwbworxircMX2Dis14eAamM?=
 =?us-ascii?Q?Sw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 83996e11-3bee-4b66-c65a-08dba02bc99b
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2023 20:43:33.2362 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EcCN2MsWRhxa7KoZwGqQBAnc555PODM6NbsUVxsnOtzOf+8q3eLxde8bIDFlDrfyenW428as1DHg29SjySKfS2Vbbwa2XQ+WQ/6OqFxoT4g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6941
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 3/3] drm/xe/pvc: Use fast copy engines as
 migrate engine on PVC
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

On Fri, Aug 18, 2023 at 05:59:02AM -0700, Niranjana Vishwanathapura wrote:
> On Thu, Aug 17, 2023 at 09:29:06AM -0700, Matt Roper wrote:
> > On Thu, Aug 17, 2023 at 04:03:52AM -0700, Niranjana Vishwanathapura wrote:
> > > Some copy hardware engine instances are faster than others on PVC.
> > > Use a virtual engine of these plus the reserved instance for the migrate
> > > engine on PVC. The idea being if a fast instance is available it will be
> > > used and the throughput of kernel copies, clears, and pagefault
> > > servicing will be higher.
> > > 
> > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_hw_engine.c | 31 +++++++++++++++++++++++++++++++
> > >  drivers/gpu/drm/xe/xe_hw_engine.h |  1 +
> > >  drivers/gpu/drm/xe/xe_migrate.c   |  7 ++++---
> > >  3 files changed, 36 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> > > index 4c812d04e182..00329efbd968 100644
> > > --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> > > +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> > > @@ -791,3 +791,34 @@ bool xe_hw_engine_is_reserved(struct xe_hw_engine *hwe)
> > >  	return xe->info.supports_usm && hwe->class == XE_ENGINE_CLASS_COPY &&
> > >  		hwe->instance == gt->usm.reserved_bcs_instance;
> > >  }
> > > +
> > > +/**
> > > + * xe_hw_engine_migrate_logical_mask - Return logical mask for migrate engine.
> > > + * @gt: gt instance
> > > + *
> > > + * On PVC, due to workaround 16017236439, odd instance hardware copy engines
> > > + * are faster than even instance ones.
> > > + * This function returns the mask involving all faster copy engines and the
> > > + * reserved copy engine to be used as logical mask for migrate engine.
> > > + * Including the reserved copy engine is required to avoid deadlocks due to
> > > + * migrate jobs servicing the faults gets stuck behind the job that faulted.
> > > + */
> > > +u32 xe_hw_engine_migrate_logical_mask(struct xe_gt *gt)
> > > +{
> > > +	struct xe_device *xe = gt_to_xe(gt);
> > > +	u32 logical_mask = 0;
> > > +	struct xe_hw_engine *hwe;
> > > +	enum xe_hw_engine_id id;
> > > +
> > > +	/* Only support this function on PVC for now */
> > > +	if (XE_WARN_ON(xe->info.platform != XE_PVC))
> > 
> > Here you warn if the platform isn't PVC...
> > 
> > > +		return 0;
> > > +
> > > +	for_each_hw_engine(hwe, gt, id) {
> > > +		if (hwe->class == XE_ENGINE_CLASS_COPY &&
> > > +		    (hwe->instance & 1 || xe_gt_is_usm_hwe(gt, hwe)))
> > > +			logical_mask |= BIT(hwe->logical_instance);
> > > +	}
> > > +
> > > +	return logical_mask;
> > > +}
> > > diff --git a/drivers/gpu/drm/xe/xe_hw_engine.h b/drivers/gpu/drm/xe/xe_hw_engine.h
> > > index 71968ee2f600..edee71e26c57 100644
> > > --- a/drivers/gpu/drm/xe/xe_hw_engine.h
> > > +++ b/drivers/gpu/drm/xe/xe_hw_engine.h
> > > @@ -52,6 +52,7 @@ void xe_hw_engine_handle_irq(struct xe_hw_engine *hwe, u16 intr_vec);
> > >  void xe_hw_engine_enable_ring(struct xe_hw_engine *hwe);
> > >  u32 xe_hw_engine_mask_per_class(struct xe_gt *gt,
> > >  				enum xe_engine_class engine_class);
> > > +u32 xe_hw_engine_migrate_logical_mask(struct xe_gt *gt);
> > > 
> > >  struct xe_hw_engine_snapshot *
> > >  xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe);
> > > diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> > > index 956a96b38346..cb9a82d13089 100644
> > > --- a/drivers/gpu/drm/xe/xe_migrate.c
> > > +++ b/drivers/gpu/drm/xe/xe_migrate.c
> > > @@ -338,11 +338,12 @@ struct xe_migrate *xe_migrate_init(struct xe_tile *tile)
> > >  							   XE_ENGINE_CLASS_COPY,
> > >  							   primary_gt->usm.reserved_bcs_instance,
> > >  							   false);
> > > -		if (!hwe)
> > > +		u32 logical_mask = xe_hw_engine_migrate_logical_mask(primary_gt);
> > 
> > ...but here you call the function unconditionally on all platforms...
> > 
> > > +
> > > +		if (!hwe || !logical_mask)
> > >  			return ERR_PTR(-EINVAL);
> > > 
> > 
> > ...and here we fail out if logical mask isn't set (which is will never
> > be on non-PVC).
> > 
> 
> This patch was derived from the below earlier work.
> https://patchwork.freedesktop.org/patch/528460/?series=115575&rev=2
> 
> It was discussed there.
> 
> We should be fine here as currently only PVC Platforms call this
> xe_hw_engine_migrate_logical_mask() function. The reason for having a
> warning there is to detect any issue while supporting any future platforms
> so that we fix that immediately.

xe_hw_engine_migrate_logical_mask is called on any platform with
supports_usm, right?  I guess that's just PVC at the moment, but we
already have LNL patches pending on the mailing list which I expect to
eventually start setting that bit as well.  I guess we'll have to make
sure we remember to come back here and make some adjustments once a bit
of that code starts landing.

> 
> > I think you probably want an OOB workaround for some of this logic (see
> > xe_wa_oob.rules); then you can do something like
> > 
> >        if (XE_WA(gt, 16017236439))
> > 
> > to guard any code that should only be executed on platforms where this
> > workaround applies.
> > 
> 
> Hmm...the previous patch in the series adds this WA (16017236439) as a
> engine_was (to be moved to lrc_was). I would like to keep that as that
> does the register update nicely (instead of adding additional code for
> that).
> 
> If at all we need, we need to check here whether that engine/lrc WA is
> active. But as you mentioned, XE_WA() only works for OOB WAs.
> We could add a duplicate OOB WA here (with same number 16017236439).
> But not sure if that is a good idea.
> Or, we can add a function to check if a engine/lrc WA is active by
> doing the name comparision (instead of XE_WA()). Third option is to
> support generating WA index numbering for engine/lrc WAs also (similar
> to OOB), so that we can use some macro similar to XE_WA().

+cc Lucas for his thoughts.

Maybe longer term what we want is another RTP matching rule that behaves
as "match platform/stepping according to a specific OOB WA."  That way
workarounds that have both simple register programming (in lrcs_was[]
and such) and additional out-of-band logic can be handled in a
consistent way and the platform/IP matching managed in just a single
place.  We could accomplish the same kind of thing with an RTP "FUNC()"
rule and a wrapper function today, but it would be nice to avoid the
need to manually create a wrapper when adding new workarounds.

> 
> What do you suggest?
> I think we can leave the code as is for now as it gets called only
> for PVC.

Since Lucas is handling the LNL enablement, I'll let him decide whether
he's okay leaving this as-is for now (and we'll come back and make some
adjustments once more of the LNL and Xe2 patches have landed) or whether
he'd rather see some adjustments right now.


Matt

> 
> Niranjana
> 
> > 
> > Matt
> > 
> > > -		m->q = xe_exec_queue_create(xe, vm,
> > > -					    BIT(hwe->logical_instance), 1,
> > > +		m->q = xe_exec_queue_create(xe, vm, logical_mask, 1,
> > >  					    hwe, EXEC_QUEUE_FLAG_KERNEL);
> > >  	} else {
> > >  		m->q = xe_exec_queue_create_class(xe, primary_gt, vm,
> > > --
> > > 2.21.0.rc0.32.g243a4c7e27
> > > 
> > 
> > -- 
> > Matt Roper
> > Graphics Software Engineer
> > Linux GPU Platform Enablement
> > Intel Corporation

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
