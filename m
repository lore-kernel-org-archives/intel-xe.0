Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7547BC001DC
	for <intel-xe@archiver.kernel.org>; Thu, 27 Jul 2023 13:55:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E67610E58B;
	Thu, 27 Jul 2023 13:55:39 +0000 (UTC)
Received: from mgamail.intel.com (unknown [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B828710E58B
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Jul 2023 13:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690466137; x=1722002137;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=CKgeXEd+y/DM0yIqTZnZgGIWGQbgaEncPvxiFpwPw48=;
 b=XkeFjblIXBsQX27xahNV/KPnVyIubOYghSIn3myWPw+KX8xQd209xbiF
 wklNzMzSTuNz2O/5jn4xy/WWumtVNnLSoV14HfqBfstj8qIgXkQYeOK0L
 S9I0ksY4RR9fNmODKiUIOb2C0CjgPC4+SEX+XCtQb8oLzGlHZJrvnjwQD
 F7sNkJdVXcg2TMXX51FocuJ3aXDhb2oNvlZkNWDnwJ8mESJZmBdG0XJb4
 dHOzDtNm0aoZWbqG5rz5fpyI/ZNTH/ADOsIsdHr2FQ972LKl9Y27hzBr1
 +Bkej+JOIY3cGKUp1z3pvlFo98fPJ5KBjiGGe0/HUKbba8Wbx2/vzf0DN w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="454677318"
X-IronPort-AV: E=Sophos;i="6.01,235,1684825200"; d="scan'208";a="454677318"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2023 06:55:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="762169193"
X-IronPort-AV: E=Sophos;i="6.01,235,1684825200"; d="scan'208";a="762169193"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga001.jf.intel.com with ESMTP; 27 Jul 2023 06:55:36 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 27 Jul 2023 06:55:36 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 27 Jul 2023 06:55:36 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.48) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 27 Jul 2023 06:55:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LTUtBd/pWld6u0TVAkLbNwi0GapBfuNVurm7u+T/xfB+GQTn2+a1Fkbx9CDY2FFunvupkNdj25/uTkX+AMrXHe2fGvrLZwa5Wfk0IQTxqtAn0u3oWW0z2Oz/kZL590Lx0J+yujd3vK1zuDmEjGG0k4zAaMjcZnk44WXwhGb1wUMek+RopatQUm43SOb9TqgcHG1HV5p73mrruqsBqtvhozhPPa04SObgruBYF7CZPi1Rcv9yQtJ3f2uci1KT4sYJ7fH48YNDmtQe7VgpuCTOQ6gY0mpKgwCtDVPwPBURSeIMkVZFbG2jgwYIup7Pol/QnzOg6o6ib0Em25TtcUfOHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sxJiIi76LzlJP8mVKmFgW3sMVVfmZUZtTp4BjG7xnZ0=;
 b=BEY39h5mQTzJz/V7d+5x/Ybjdg9p3ULjuANntOCK0X6NwGjIdgudKHe2WFquFN1tmMEFFJ6O9/zJD28wvJ4kPGljl3vBegHK5va6mtdSgswCBnzWdiUqa7UTlQ/6THGvf3OHxgtM66+c+YWQiwrf20VhB+iH/ZiGSat5jMlRi9shdJVh5iw/M9g3hPFPvJH20sEnXFRI3SpbFNE+cujt6HPWBo1fkPMIZiGNUmvY2OtpWhp7BmmREZ54XK2Yd+K3krEkJuCNh/jKakSO7k5u+gKNvxba+5cZhtUoap5iK+F7SJNSnvGTPY9z+UZQtkIWSGEKMefGH86yi9Ur07dvBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by IA1PR11MB6514.namprd11.prod.outlook.com (2603:10b6:208:3a2::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Thu, 27 Jul
 2023 13:55:27 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6609.032; Thu, 27 Jul 2023
 13:55:27 +0000
Date: Thu, 27 Jul 2023 09:55:23 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <ZMJ3S2hk/UAczabO@intel.com>
References: <20230726222528.366732-1-daniele.ceraolospurio@intel.com>
 <20230726234550.GB209733@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230726234550.GB209733@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: SJ0PR05CA0171.namprd05.prod.outlook.com
 (2603:10b6:a03:339::26) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|IA1PR11MB6514:EE_
X-MS-Office365-Filtering-Correlation-Id: 2fc17fcf-9151-42d5-d42f-08db8ea921c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qgVwokRxRBpWd6oxT5mjxuqQNmX/LHHktJyvuT8hCQhaGxBUF3ij6CNvnQBYfdx91VJcEwVtwRIsGL0JDOhITGGYrX8u1ICMboYGtvukBEWw8j3Ce5L6gagO71zhTwpEKkaLAr65tpiTTs/t4baOZA9YB6x18w0q00P36CTA8y7goqRRCrktD2QU+8P9zuzCbZnfiu45z72eU1RsKG7OJjemZyr5L/WXjOyRTdPm7hIZ4kzL7RPBjW4t/AOIJFGt9KNWaPPas4iIX9vMJWHOcREuOfX2l6E03dfNGb3MbKeG0RdyeYuKAlToxQsVSkbe0RweXpjgDGEcIyRf8LC2tJ21cDxrpTyEfUxLmCN4BZSE28hzwjupwq24xO5F3d1+82w7EKMnJa1Un+6vbTZdGQnoxbLDRfyF/Q87NnrFRghOBmbB3skMagDgO3pQPvJbMt0rXvLOpeDnSG0hvzQrpb4JW7djp95+IYSlDjiY5xFNydpoCNtcPkHBgKx4lLWseRFptzO+3PTaU2YmBkylABAfNTJawJBMN59AqTgqQT3BsxXaLyrpmEFx370EL2RN
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(136003)(39860400002)(366004)(376002)(346002)(451199021)(2906002)(83380400001)(6486002)(6666004)(2616005)(36756003)(38100700002)(186003)(44832011)(5660300002)(86362001)(316002)(26005)(6506007)(6862004)(8936002)(8676002)(41300700001)(6636002)(4326008)(66946007)(66476007)(66556008)(6512007)(478600001)(82960400001)(37006003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lO1m/wu+8OhjaXmjOjRUfCpApXGcOuBnPmjPdwXZMEEN8IkoZFnCm3lXg4p3?=
 =?us-ascii?Q?TXVlbGAqcu6UtXL+ys3jxBZrEulOpj4oTpa//wrwYaCv5drh8Gs2Rr/cESiw?=
 =?us-ascii?Q?VHfJTFgjESXvyUIT7FRS1y8AKhq6Rf3rlLwbeLZB/ycchKHrGsfzS7TWLMhY?=
 =?us-ascii?Q?GIjnmzc9ivymCLwWHrvA9xVGf/b+gvH4HEVj0mfSGBdzrNa5p2RGNvfUbfwY?=
 =?us-ascii?Q?yXtzQuwfLv4RTTp8SojzzJsovI8t7MAgdbMnTKKKu2nI7LGtpYk37oExuilm?=
 =?us-ascii?Q?JBmQSJ7wIxk6QTBsmGOOjU455U02Lkau+KnfgOlOOPgIINCz7hrGYMVqhBUP?=
 =?us-ascii?Q?SN+PSd10NZdqfTJP6dw0NCHwAjWYCufhqnEs5gM2sgNe0CVY3t7iOa1mag0K?=
 =?us-ascii?Q?IZD7w04cIK3x1QirFPOyJqzza+lJvOInvPl1ybFDAgBM+Ive67zc/a34ffdz?=
 =?us-ascii?Q?17LdLSOIKUq/anvnHzPFaemRRTbc7xVt1kEjQjtaeoK1QJVPikLO6u4hcHJ+?=
 =?us-ascii?Q?AsLVuSQ4yoDbfhLQ1g1lmRj7Cg4//wVr8mnTh6qn5q+maQfREan0LN88uri3?=
 =?us-ascii?Q?sSvUj4KuWZDJPhXaJfesTmLhLEILAUMWIXb/daC6wOl/MWo6hiYgrg14uVt/?=
 =?us-ascii?Q?3y/7dtPA61Wasnbut1bjyeSCL/ytblazVEcX0mIYmq4/RSTmQKv0tV4CdjKf?=
 =?us-ascii?Q?yK0Xj0hqSo8+rBb6fVjQkGmKOLpT3lSLnalZUR7Dlu6MZRdM5Fk2EbIqQL9I?=
 =?us-ascii?Q?CvR53M+TDdIQlB2wR8UvikzHmVTA+L9AFX9itZu1CfHgv0hAU2Tjkv627ow6?=
 =?us-ascii?Q?GNVLAbeWzh8KN742HghQYV5v+OqJRNUfnxYm3kcs8ifguLZXx9cJvjdxkRIE?=
 =?us-ascii?Q?cCcPUUV0N5Znirl8SRNQXmOv8ioXS+87nKV48cOPfGho56irlnCmo2hUXPer?=
 =?us-ascii?Q?QfpRSd+6VirGup309IKZkFgkUxOJQw+hUc67W24p8J6cOAY2P6DHlj6uVVhA?=
 =?us-ascii?Q?owaUwzdWpL/g4By5YZbmZI1ZFKp4a/SyjiEvAVuC5EvClxPaYUDMwWaAkEVF?=
 =?us-ascii?Q?bbYNI/VZTsObts1Z6kKOtE/EATwpaq1Fd6HrQ9RMboHerWg6EPjFcJO6WJ5l?=
 =?us-ascii?Q?IAPraarFzYq/tzsGcIsXfOpmdEut+fw2q562YVH3ExYs1+NXsYbjwV7DdJtp?=
 =?us-ascii?Q?8vGXCJ3y1DCLeYSzq2+qklOuVstGIHX4T3JRonpAl6//L7l6KqlV7MJ2N8jj?=
 =?us-ascii?Q?2k3drMX7ck4fzPaCyUqJW6TRbaog2WFUvxOZkF2lyhT4Y56jZjxgGn6fxdgQ?=
 =?us-ascii?Q?FF6WZ7BRrdvgkBhQHYhJD9AmcKpGk0xvKpfLyzomOUYGQWXqoyQ47Wf0M1Uy?=
 =?us-ascii?Q?6unha7ADUZfk3dFcwzXIWLYZxfWJL+qwfvhgJsOfcMRFp1WrsXaG2O0pD0/Y?=
 =?us-ascii?Q?J1G4xr2SNkWAsyOxDyKVnHjLMlJr7vOPDHMFgIt0g9oXNkzrmfZRKolBxNwL?=
 =?us-ascii?Q?i1DhyUwwcSQ7ra4GF6ETdgPjaF+ZPOa5FEILFI+sxJmzkeo762UxOqX9pAZZ?=
 =?us-ascii?Q?/WgJ6/yZl8mWqf4NQsqh75lRMylOOvylromLHQkMvd3cIc0cYox8RIO/Enf5?=
 =?us-ascii?Q?6g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fc17fcf-9151-42d5-d42f-08db8ea921c9
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2023 13:55:27.2876 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FZBTs5MqRCCzSWN+mAU8uKZilSukICh0oshsNgZOKOMSpCjyyTkVNLrW/ijMQvgXex14XfpJByxNFY1GmHWKEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6514
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: fix mcr semaphore locking for MTL
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

On Wed, Jul 26, 2023 at 04:45:50PM -0700, Matt Roper wrote:
> On Wed, Jul 26, 2023 at 03:25:28PM -0700, Daniele Ceraolo Spurio wrote:
> > in commit 8604f978f45b ("drm/xe: Convert xe_mmio_wait32 to us so we can
> > stop using wait_for_us.") the mcr semaphore register read was
> > accidentally switched from waiting for the register to go to 1 to
> > waiting for the register to go to 0, so we need to flip it back.
> > 
> > Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Cc: Matthew Brost <matthew.brost@intel.com>
> 
> Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

I just pushed this since I have changes on top of xe_mmio_wait32 that would
conflict with this.

Thanks for the patch and review and sorry for the mistake previous patch.

> 
> > ---
> >  drivers/gpu/drm/xe/xe_gt_mcr.c | 7 ++++---
> >  1 file changed, 4 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
> > index c56815af0686..9eb7a6a1348d 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_mcr.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
> > @@ -420,10 +420,11 @@ static void mcr_lock(struct xe_gt *gt)
> >  	/*
> >  	 * Starting with MTL we also need to grab a semaphore register
> >  	 * to synchronize with external agents (e.g., firmware) that now
> > -	 * shares the same steering control register.
> > +	 * shares the same steering control register. The semaphore is obtained
> > +	 * when a read to the relevant register returns 1.
> >  	 */
> >  	if (GRAPHICS_VERx100(xe) >= 1270)
> > -		ret = xe_mmio_wait32(gt, STEER_SEMAPHORE, 0, 0x1, 10, NULL,
> > +		ret = xe_mmio_wait32(gt, STEER_SEMAPHORE, 0x1, 0x1, 10, NULL,
> >  				     true);
> >  
> >  	drm_WARN_ON_ONCE(&xe->drm, ret == -ETIMEDOUT);
> > @@ -431,7 +432,7 @@ static void mcr_lock(struct xe_gt *gt)
> >  
> >  static void mcr_unlock(struct xe_gt *gt)
> >  {
> > -	/* Release hardware semaphore */
> > +	/* Release hardware semaphore - this is done by writing 1 to the register */
> >  	if (GRAPHICS_VERx100(gt_to_xe(gt)) >= 1270)
> >  		xe_mmio_write32(gt, STEER_SEMAPHORE, 0x1);
> >  
> > -- 
> > 2.41.0
> > 
> 
> -- 
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
