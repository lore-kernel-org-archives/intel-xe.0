Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A89DBC6FD1F
	for <intel-xe@archiver.kernel.org>; Wed, 22 Mar 2023 18:16:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 793F410E0E1;
	Wed, 22 Mar 2023 18:16:27 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08A5410E0E1
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Mar 2023 18:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679508986; x=1711044986;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=+f9k3u6xFa2uNGZvxVQPfjDKFDbOu1cT/yJyTvpq14Q=;
 b=EQ8KxBf60k4woDoIghQ/CauE3trxCyu2MJUG5okS2R4QP2Va9yT6BRqG
 Yv4cvr20Qff5FyDiviAvwsPJpLcgnpJi2fr+vXXo0w2hSvs19BM66NefH
 x1ZdANTmvXq6zLEw7c2t7vmV4O1ORnhBAZ7uRWfOSDvN5CPfqlJiyryg3
 mu3jfvY3jsxhCWNFIwt2zQr+J73q/hRTS8ohQAoj9d2iI2D6dUqmGRMLD
 Ym6zz3pRMDbUzoeyeqsTS6m3qBRiAAGFD0wi34ytAcePOa/i9fec//PKH
 +BbA+HrWFPc2mlEbN1ifVcV1rU3lMRaExKcBkB4BSQY5iaaWxc/zVSQPt w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="367033576"
X-IronPort-AV: E=Sophos;i="5.98,282,1673942400"; d="scan'208";a="367033576"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 11:16:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="856201859"
X-IronPort-AV: E=Sophos;i="5.98,282,1673942400"; d="scan'208";a="856201859"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga005.jf.intel.com with ESMTP; 22 Mar 2023 11:16:25 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 22 Mar 2023 11:16:24 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 22 Mar 2023 11:16:24 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Wed, 22 Mar 2023 11:16:24 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Wed, 22 Mar 2023 11:16:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=il9LCWCNxFrdWwsuAWs2Cqhl5yfSAZ13d9D2FlVkqYkXR3cLJ7Hz9QZQGU4S5dAAbYoUIU2IoLDHLXkC+yjGMoDz/oidRp2wJMi0x8wv2LNJixy5DXqfJJ6g3pIH7B9S6kl3WDsG9YdeGnc6GbzBlesFb4C9EL1pIthB64pNtV+BbO+9qGnlhx+IuM81YQSDS/VLp3rPGTNn0cja6Y0k5mUugsSR2pPIvW+OwfbNw2iLE+Jkrom05Tx3RUWf++fbgTAu3SDoJbzwUAFjKUTa/fiLpM4WCQfkAfHBf+7BgsDQAD6e4LWbio+WqEsEM7Pv4w86wwcZq4W3xOwN4bI4DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kwlPVpiNwhfMn/4//eX1C/ednD3Cuy2OFgXvHW1eSjI=;
 b=ixRmIYYSAogIJnrYj5D4obiq2hXuXePY1TBMzuwFTkXcutS6ejfMGbbo+ak86jTNrjpJyaJ8z/BWchGQ+cSSDm8kztlrDWBOlXTtXACa/lVSzxSbrQ6yO3MBSoQSeblB0iPXzPtAJp0DGtYSmMUFj3JkC8M6/+O80Gon72ZssvWGFOrl2C1BNH1DOpBIOS29E/8KoU/ZkIPVzTW1b9ewgqUEVz0AqNvma2nbzKliHgSjIEP09MpH7NYbWM5hFCbtJHa+18qf4wGfRZ8DbPJqR7RZlo4b/2TvcV+ZoDqwJ3AlMyuKiHYaMv/nfYSMFAAa7fitT7dJTFArGmVo72lGGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 IA1PR11MB6417.namprd11.prod.outlook.com (2603:10b6:208:3ab::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.21; Wed, 22 Mar
 2023 18:16:00 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0%7]) with mapi id 15.20.6178.037; Wed, 22 Mar 2023
 18:16:00 +0000
Date: Wed, 22 Mar 2023 11:15:57 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: "Souza, Jose" <jose.souza@intel.com>
Message-ID: <20230322181557.GZ4085390@mdroper-desk1.amr.corp.intel.com>
References: <20230322165733.309447-1-matthew.auld@intel.com>
 <aa60c2742360614e4e14fcba6ae683895c8e59d1.camel@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aa60c2742360614e4e14fcba6ae683895c8e59d1.camel@intel.com>
X-ClientProxiedBy: SJ0PR05CA0161.namprd05.prod.outlook.com
 (2603:10b6:a03:339::16) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|IA1PR11MB6417:EE_
X-MS-Office365-Filtering-Correlation-Id: 694b0989-2145-42ba-791f-08db2b017d6f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RHLclONksawEXAIfgtURNtO0Z9zLGSnVDH9kXPR+LKYiqitrAz9P5O6+FNdrGS11NyjUDjMCFthkKq9claHCOawWyKQ368aJ2npsGOSTatLwGwaGZeq7lVWff8XFPI4gsp9T1U3WWAbx0lcuRr6neLkwwhWC0O/H0H9XcNYVrXY5KZZhEyXNnqkW+qTFdg15IQOg8NZxx4mSNq/zOVNorPA93zlB068s2Ph5mne9yNeN0k8lRyqAaSXY2yAeHHWnJXoeHUv6hMx6Qi3oDybtxt1oDF1xDY3SYFeAuIJu7faFee8Ud2pxW4MVdKgKV1lUpAEXIF+vcFcn27z5ZU689ayKmv+6QfP9MZ2gpdIXD1w7tiLfR24Tk0+bZCh0kFhOj5nxeeNSJ47CQaNlwkwkEAYhREJJJd7/mgu8KTQ49ZjpnmtAOBZ98idwOlDil1VMMaJ5frz+HCryK9KycLXS1av5xbuXbA7kyGOKyM2a9gmGBUDNpKANEKOuZuEsqzamamgy4mh0IAYYtTOQGUZydxNmTfyML4gZcvowD+wZqeiOVZS+d+tesEU6aJzc+EvDbs/H6rfzedG872cGw7wJ53QQlrcgydnTy82+2gwlwnrLHPkAA0L2yBS8Dziquj/4ST1QFzn0FgauKCBleeFskA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(346002)(376002)(396003)(39860400002)(136003)(366004)(451199018)(33656002)(38100700002)(86362001)(5660300002)(6862004)(4326008)(8936002)(41300700001)(6512007)(66476007)(83380400001)(82960400001)(66556008)(66946007)(2906002)(8676002)(6506007)(478600001)(107886003)(54906003)(186003)(6636002)(1076003)(26005)(316002)(6486002)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?caj3nWJ8VIZrGZSWU/jrYD+vDkUL799kM83+4IK2871Lim7x7SW1qPeu0cUI?=
 =?us-ascii?Q?fAHMlULCmmv1LIe7G92+LwpT0XNVlP0DVdcUIQq/GZvVIDYK+Bh2hOBZrChT?=
 =?us-ascii?Q?/jdxK5wQD+N1IhdC7rfgOysaLTwu8WzUEiCUnhWC6fo3mc4vH9KM7GvLJQiu?=
 =?us-ascii?Q?k8yRH9O9p2NCMcS5eJXvfHCkFLoR7YIq+NwMAGL/KnU90RMnGzeAEbZ6wJxi?=
 =?us-ascii?Q?GjjNR79B4rtjsTjO5JKzWYcn/jYbBfxZNiyy76TfrK95YOosap3BxYzFQgLb?=
 =?us-ascii?Q?uUsE1YyduqjLUWY7buCiwcUqDOGVcMZZfcTfnKyu7uXsNFDoVjDeEPKw3ali?=
 =?us-ascii?Q?NpBJunDaVBhxAYQoiGHkEs/Q2QDqVV4F+MYC1J8m8fcDYRUoNqxNQj/37uPh?=
 =?us-ascii?Q?RHsn+Ue8vLpKU6Ap/Gx9RBJ+g8fmCxNIK5yev+F/bmejpg9VAdod6m0tNpVE?=
 =?us-ascii?Q?Q1a7v5f2jpb9LmeNr/dEJ7NjOJYWZn48M6Tsuo5w7M/RhP0uy/ttpr9itmB4?=
 =?us-ascii?Q?u8p4KbL9beQHxoGj72L8viN/dzb5/hknYZsvpBIZn0MqsXKjb0a/uh0JELFX?=
 =?us-ascii?Q?wFGnHYlqOy8BUcs76rREnHsqUz0C4GVGyFFc/aRjkJh2K3FECW5PKP2GixrR?=
 =?us-ascii?Q?Hse16tlDdkHY2wK18bDLTgcTc13hQFC21wFKP7p8ceBJ2KskBO9njxD3y1Ba?=
 =?us-ascii?Q?uJJeJbnNbfOv7diLzKlzguylvrqaytgpc/z/SBg8rg+SGPvxGaNhaftr0yPS?=
 =?us-ascii?Q?m5ZxlcqwPeMzIm7k2gBHs3vXybTsRRSYSP73mP4O2DPYUtjtwcRpn4zzfJ4g?=
 =?us-ascii?Q?mpsUXLwsn/3U/PsrhG1slfOfbild912EtW2Mj+9YE51OURBw73rTWako1IbV?=
 =?us-ascii?Q?f2Cuq/OtVr2YUI71qHd0NqJWRmTQ9nR0uuGOSC728w72tIkjOGlpHazOwTK6?=
 =?us-ascii?Q?pls+7Yx9qT3TUX+qGBd5Mxwgl+CvQsAjzijIPXx1Nn3XCrkMWgG8R+iA/gps?=
 =?us-ascii?Q?KsYAgcxEj/1DMYC+74aEvuefUQTD+lVuQsVwrJRKNizpWpQc0KQhSMi8wNya?=
 =?us-ascii?Q?mvQasusZw3kMtdCBjhm6E9ubTdk6uFhpYT6+URn3BkjnjXM2Yomi1yZvFVMm?=
 =?us-ascii?Q?QK2vjHZgMuIqCFJEcjOzGJ4dGHdqC2Vulx/y4gntflQne1VsV1PzZCIFLV+g?=
 =?us-ascii?Q?o96ZcMaBtcinV1Q0EaeHnPgO107AqZwmVXBSs9iafE2HNBM1ZLGkUGNVWO9o?=
 =?us-ascii?Q?/hr5fiJ9OdakbNa2zRk0SDoIx7cHf3S65zZAhSw9O/oDep/VkJQ3YsKWDifS?=
 =?us-ascii?Q?yxZ36K3jI8WZhz2SxJO1tuFQw/esB35uu9I2r6ZuT2fnzw+nvrytVGIBptDC?=
 =?us-ascii?Q?72YJYobfCP9L0xrRy+AkUroDx7uFzREN/n7i9HSrQWkQ8X4JokqTz8TH67b9?=
 =?us-ascii?Q?h+la6SlJOdPdhOhbVYVcvGyaYotZTtAg4z8j/tS7YYWeLr6BahYYHW8sZrse?=
 =?us-ascii?Q?IJxQBlfYkbvXE2ePtJilHfqXNnOX9IkMOfVx45QYdJIWrkcmOUJ/hd1cVIxh?=
 =?us-ascii?Q?bycYVtdjA8ssaJ9mqL/Y4/Dx+fjw1G0tF3zCU04/D2ussLmo41lczdBIetMK?=
 =?us-ascii?Q?kg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 694b0989-2145-42ba-791f-08db2b017d6f
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2023 18:16:00.4195 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X1PCAE2HjrQiz44O6veqFt1xgXzi2RfRieAfVoU0MmnsGxAYxbkuN/YEjml92hDJW1Gm+UJ1sZzX1ZT27ymOux/NnvCUKh2cVfZQnJMmUCI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6417
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] Revert "drm/xe: Allocate regset space for
 Wa_1607983814 unconditionally"
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Auld, 
 Matthew" <matthew.auld@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Mar 22, 2023 at 10:51:04AM -0700, Souza, Jose wrote:
> On Wed, 2023-03-22 at 16:57 +0000, Matthew Auld wrote:
> > This reverts commit d51afeaae0479c964e720f3855834a82914112f6.
> > 
> > See if this helps the ADL-P in CI.
> > 
> > Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_guc_ads.c | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
> > index 304a9501b447..fd9911ffeae4 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> > @@ -224,7 +224,10 @@ static size_t calculate_regset_size(struct xe_gt *gt)
> >  		xa_for_each(&hwe->reg_sr.xa, sr_idx, sr_entry)
> >  			count++;
> >  
> > -	count += (ADS_REGSET_EXTRA_MAX + LNCFCMOCS_REG_COUNT) * XE_NUM_HW_ENGINES;
> > +	count += ADS_REGSET_EXTRA_MAX * XE_NUM_HW_ENGINES;
> > +
> > +	if (needs_wa_1607983814(gt_to_xe(gt)))
> > +		count += LNCFCMOCS_REG_COUNT;
> 
> needs_wa_1607983814() also applies to ADL-P, so it should not flip adlp-p results.
> 
> I guess the problem is the calculation:
> (ADS_REGSET_EXTRA_MAX * XE_NUM_HW_ENGINES) + LNCFCMOCS_REG_COUNT != (ADS_REGSET_EXTRA_MAX + LNCFCMOCS_REG_COUNT) * XE_NUM_HW_ENGINES.
> 
> Did not checked what is correct for the workaround implementation.

This:

   (ADS_REGSET_EXTRA_MAX * XE_NUM_HW_ENGINES) + LNCFCMOCS_REG_COUNT

is a proper regset allocation for all the registers that we need the GuC
to save/restore today (it's actually still a slightly larger allocation
than we technically need).

However we found that using this more appropriate regset allocation
(rather than grossly overallocating it as we used to), increases the
frequency with which the initial LRC submission to the hardware fails on
some platforms.  The cause of the LRC submission failure is still
unknown; it's not actually related to regset at all as far as we can
see, but this change happens to change timing or cache access or
something in a way that makes the pre-existing problem much easier to
hit on certain platforms.

We're still searching for the real, underlying problem.  But in the
meantime we backed out the regset size change so that there'd be less
impact to other Xe development in the meantime.  So the revert here is
technically a "correct" change for us to make and will be what we want
in the end, but for now there's a good chance that it will increase the
rate of driver load failure on some platforms.


Matt

> 
> >  
> >  	return count * sizeof(struct guc_mmio_reg);
> >  }
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
