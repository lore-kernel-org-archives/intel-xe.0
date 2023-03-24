Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE4D2C6FD20
	for <intel-xe@archiver.kernel.org>; Fri, 24 Mar 2023 07:02:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97CA210E502;
	Fri, 24 Mar 2023 07:02:49 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2974510E502
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Mar 2023 07:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679641367; x=1711177367;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=mvyELeFLrfJwSQ5tXjp/Cvfv92muvB8Flu85icbrCtA=;
 b=VkR91k1g51lCSJeNxtTwtC6J/h9lynY2toTYQwlA/nw+vMjhLvis9z6q
 l0dNgfs6EGY/FcqDeRT09PZWPo4VMwK2lHEw+VbJ2pLzRqKAn0xkp2n+M
 jJgdTFsckDnFu1mcXX7DiSLqwUzI+DPZxQLBEPAFng8yimkytER4dWZCE
 29Isrqc6ET0KNn94i7PwyWi5/t2WQ8gXpzAaVl71y6d3FSFcvDiGtkiwr
 etGhAb/lwUiEV1VCb0z+pdjzdQJPTNKzAPiwvCRlokegPE6+J6ANwkYtx
 OL7D/chei7SmJwuDbIUQzWLq1FlZeDMioF1Ibx/zTF+knP7IBc1CkR9gb Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="320103060"
X-IronPort-AV: E=Sophos;i="5.98,287,1673942400"; d="scan'208";a="320103060"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2023 00:02:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="712970384"
X-IronPort-AV: E=Sophos;i="5.98,287,1673942400"; d="scan'208";a="712970384"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga008.jf.intel.com with ESMTP; 24 Mar 2023 00:02:46 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 24 Mar 2023 00:02:46 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Fri, 24 Mar 2023 00:02:46 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.170)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Fri, 24 Mar 2023 00:02:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fx7VQBaI1lG7fNKCJ5Ug+fofSQ2ovsbARn8rJpZKQSARHohfFiGNMGbli3n88qZr/k7dGkgMjRrRVsPxwjQHGWNlaU2cGMfjfWlfuioHggxZdI0aTsphu6vUihTxb7DXQhvD/GfwLkfqaTe36EE5HGuJqy/+SoBWdgLnePEM7UrEIyu4jKpvsICjmBfc8mvcpwTEr+eOfNE56cGqDpq09YAU15mbjxb8LcUETNSrneK8ddLK+MG8G3Dv9YJx5tHSHM/qgBg6sfPBF09lpdA9213lV1YcdME7D8Rnya5wAk4rBjAHoUNA5wV68AwV1+CFMrXsyS057rJzyL3mZAOdsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UYJppCgm6ZROGAS0U6UY5x92KyV7CRZ24gKP8/697I8=;
 b=blGEvqWdmgK0R58eymIQutdvTcobLsTvajVGVlAyuDo4LoeAet9pfD/VvBWc/is/13YDXZjtADh/5br/KdMFmC7El2FGhnkOgWrBa30lcVh5THUZeSDomUl4/v43wbXlnJ+Q16xAL64ug7xlj2Gyy+KZA+ne1YSnYB1z34Et1rC4+MFL2aSprlBY1BqyAAz4cS3Ho6mlc2DEwjaKKbe+L5LfQzsJdll9OKHzCWBIKO063WmlDa+J6rvK+QH6rR6HzuNrVmj5lmSC3s6MFnvUdXSCsyaxatg5Nz95QStQVVw5Apw82+UsvReJyjktoXW65a3D9djLQ9QZrGfevGpBtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH0PR11MB4904.namprd11.prod.outlook.com (2603:10b6:510:40::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.38; Fri, 24 Mar
 2023 07:02:43 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::fc88:c65f:4ef5:c3da]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::fc88:c65f:4ef5:c3da%5]) with mapi id 15.20.6178.037; Fri, 24 Mar 2023
 07:02:43 +0000
Date: Fri, 24 Mar 2023 07:02:06 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Message-ID: <ZB1K7h+RjQCBD7C9@DUT025-TGLU.fm.intel.com>
References: <20230324012329.1195977-1-matthew.brost@intel.com>
 <20230324074233.292b4f1d@maurocar-mobl2>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230324074233.292b4f1d@maurocar-mobl2>
X-ClientProxiedBy: SJ0PR03CA0034.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::9) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH0PR11MB4904:EE_
X-MS-Office365-Filtering-Correlation-Id: cb168302-4487-4336-6d43-08db2c35c40b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: avSwMxnj7oflxc/XMdN20cZVrLKAY7D69+6WyT1yhmd59czIAFiJtbxmgT1pJzaSXMNnqeIgTH/uLOeQ0cuL3rpSNNPuaY5LdQ8DDtpoWcc9U78ajdgj/V1V+UdkA0Kr4SLvsg62c6Lrk2gcM4hbZGS5xBCDc25z0ucYU2JcPyIQq87QJCvS/arwKOhU3vOc/DY0stXnjPstO6x56Qt6MBkp70a1WCepADaQexSeqdasNRrAHA3AJXmJEBnMCtWV/l0nH+n6q8wjigMIZsycZVD5Xx8pOecv8JHqDLfRuiU6bwY7TQ4OJ4gF1/MIMsuL2lXSzRXWKowFCeS4oV5L+ZYoGx80mwzh7G51rN5bsSYuz0U5Z43dRnDT9uyZ5Ny2b1FNzuuljc7BlKm/Dr/aAlMhtJf1kIBRgPEIKoqQF9amzfvkYGpgvgt7Ehy896N3vPS9pjYswk2dDd62HKtrrC9CW97cRJ6FbzxaJzwOyOUlmeciq5k4QHHm/r5fmASTjJHJYjVOiC8lPRWwZFUGWVrZN27U7naT2JXMKGBRl4KUD+Rh0NM+DKFqMeDhlThrTt8W454hUP1IQwxos6RJE5YXGZL+sJu6XkSQVsA6cnmLKdWrAPseE0YhP8OLLrlrs88DfZx2QTdyDj3dKg4jXEJXyYuc/RG8ItuF3+QIWOIZ76BWoGq8hYgyFVDUa3zjXDwZfZkKy09PUL9UwojWVtoktcvpRXlkzaYEcO97i88=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(136003)(396003)(366004)(376002)(346002)(39860400002)(451199018)(2906002)(38100700002)(478600001)(83380400001)(6486002)(186003)(86362001)(316002)(66946007)(66476007)(8676002)(4326008)(66556008)(6916009)(5660300002)(6666004)(44832011)(8936002)(26005)(6506007)(6512007)(41300700001)(82960400001)(21314003)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?quBLMFeviSKWrPY+NEA47abOOVYZ5Tz+gwk2edOF7gTIOWhwA7xsTBt/zG+o?=
 =?us-ascii?Q?f4xNdAo2/2Dhwcj6Myr+L6vQ5UvShiO/d20ZRaDiM9FwUtga4LOtF8NynC3w?=
 =?us-ascii?Q?iUiYc+P31JE0CRFbM9jFuWC5tU4KVVz8uBoQdNcwhsuXdJMEY/VF0t1ncU5j?=
 =?us-ascii?Q?7ykzurGYjdas7dnE4neMjh3mz8rz7eTUN0q/ksv4283wa08MDtqUlOKY2sCS?=
 =?us-ascii?Q?AyS4RKa1ZYL9lcosnK5jg6Zs4pxO62cx8ZhLkiQzB3wIk7bQ54kIPyr8Vmfl?=
 =?us-ascii?Q?4nUZcQ+hy1n2mtKFzIfSWh5zqBiBkLB54zaMtYeDJa08lKgWDg8gQ9RmX4i+?=
 =?us-ascii?Q?CbwjH6EwCt0IIJZQZ3i9AodWyl8kumbuJlIeiST0iwgQJ/irDpFlP1WE2nvi?=
 =?us-ascii?Q?ZjMff1eFnWkUyrADsGiq72F287SdBiwtIwAXPQNoKlNbngXxIllD3pNMrbmp?=
 =?us-ascii?Q?KlqSgUwEjBtXkQDThdWPPlUO02VGqQvtJNIdM5VMq/mEHS7QatsBcz5lZbjp?=
 =?us-ascii?Q?iQsdey+EJToY0mR4a5m1IU6CSikX6fHXACAIz1o4HO4W7GsB8DSrZHGXRcKr?=
 =?us-ascii?Q?se+d3T4n1x8Xh9YnR7vd9rQEV+5Y+QB1c9ziodMqEOXw6BJEhsbUAMt5LCes?=
 =?us-ascii?Q?66A/cRhuSe7LWpR7b7+aEOptG74Y0sMSJGIt4sjI/3lu3EN2qIYdYY++NZxF?=
 =?us-ascii?Q?7KHhuHWT/GLcBL1NhljNQXUdcnwRo0Q+qu6SYRrwb3vBC5LgDwFqxy8/RjlW?=
 =?us-ascii?Q?qT8Jn2KixhkKSkOma7cnbJGeufhdQkeAKAtSF2Th8GRtrTMcSrDej+Jc+3KA?=
 =?us-ascii?Q?zAsJeAbynSZQR9GsGuIiJz2YcF5KO+c7XPVsuURTangICJrb8d6uIk+CHcQc?=
 =?us-ascii?Q?WQzyPDTzPvH8VrXrpnJTtdiQ8NYWm0UivYNkg8rPnVFzd1M6X3CIQkg0mxGS?=
 =?us-ascii?Q?URkHo+B6CxznyfVANNPEyYaZdWcFTnwBXSKQA6jcgIgVAr5LFf0od6jzzSqF?=
 =?us-ascii?Q?szuHAOpUI4aNHtpZMKN0C5bq8Z53jGbGGOyWgJwFHo+Xr/yEWVfQHUuxGTgQ?=
 =?us-ascii?Q?ZOBXyO/sIadc54TNAkKc/Fvh2N4eMLXRvy7EtX7RHtHPWxSUL8YLA4uEDYiu?=
 =?us-ascii?Q?a6VDxLTvEHyXSaQ741yRKBWpH6/2lOX3T/yv0U/4EexOjFrYoTsp0ri3lSUB?=
 =?us-ascii?Q?Hqlt6qywZZHHwLQhmXuBfFRmgvsrWGnQyoCfzpKkwFN3eyg4vdq+wqLHltzu?=
 =?us-ascii?Q?meszPOVpcltyMFEt5aD33qPc8rHhXf4pRnnbW1NsylTHC/JAlzAz8O2AkmnU?=
 =?us-ascii?Q?+jgfXNn4WcPn0rLLccVQKXEqwnfIV+Nkvmu6OlJoOv50ZSeZe5yhSoVPQ6xn?=
 =?us-ascii?Q?Qr6+cHU6yLYi04le5AQ4O/nEshNqPVVeRgH0XGX/a5aBJqOZnfcl17+fvu3c?=
 =?us-ascii?Q?hsezogZIAW/FQf2hcSidxsVRyOYpxzsNX/Q64kjyUDa/zNcQA1TcBu2kSbzW?=
 =?us-ascii?Q?cg7HkBS9p6g0XVVWtqOXw6543diql7umL3Ku9NrAZkDl1GigrhcCrbL/SfQR?=
 =?us-ascii?Q?Qnb4w39JapdEiucLBSowRu1f8guwqdrCzrJGXWb+40yXbs4bOha+Z2dHTIPo?=
 =?us-ascii?Q?SQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cb168302-4487-4336-6d43-08db2c35c40b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2023 07:02:43.7967 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c3G7GV5LYlX8zrvFgUuBu8JzRHyn0xR+oyz5JLd50d/utG72Q22qw7cl1Bs11/p5NoGVIMX3HloXu3qsz2tRNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4904
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2] drm/xe: Use fast virtual copy engine for
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
Cc: intel-xe@lists.freedesktop.org, Bruce Chang <yu.bruce.chang@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Mar 24, 2023 at 07:42:33AM +0100, Mauro Carvalho Chehab wrote:
> On Thu, 23 Mar 2023 18:23:29 -0700
> Matthew Brost <matthew.brost@intel.com> wrote:
> 
> > Some copy hardware engine instances are faster than others on PVC, use a
> > virtual engine of these plus the reserved instance for the migrate
> > engine on PVC. The idea being if a fast instance is available it will be
> > used and the throughput of kernel copies, clears, and pagefault
> > servicing will be higher.
> > 
> > v2: Include local change of correct mask for fast instances
> > 
> > Cc: Bruce Chang <yu.bruce.chang@intel.com>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_engine.h    |  2 ++
> >  drivers/gpu/drm/xe/xe_hw_engine.c | 20 ++++++++++++++++++++
> >  drivers/gpu/drm/xe/xe_migrate.c   |  7 ++++---
> >  3 files changed, 26 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_engine.h b/drivers/gpu/drm/xe/xe_engine.h
> > index 1cf7f23c4afd..0a9c35ea3d34 100644
> > --- a/drivers/gpu/drm/xe/xe_engine.h
> > +++ b/drivers/gpu/drm/xe/xe_engine.h
> > @@ -26,6 +26,8 @@ void xe_engine_destroy(struct kref *ref);
> >  
> >  struct xe_engine *xe_engine_lookup(struct xe_file *xef, u32 id);
> >  
> > +u32 xe_hw_engine_fast_copy_logical_mask(struct xe_gt *gt);
> > +
> >  static inline struct xe_engine *xe_engine_get(struct xe_engine *engine)
> >  {
> >  	kref_get(&engine->refcount);
> > diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> > index 63a4efd5edcc..d2b43b189b14 100644
> > --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> > +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> > @@ -600,3 +600,23 @@ bool xe_hw_engine_is_reserved(struct xe_hw_engine *hwe)
> >  	return xe->info.supports_usm && hwe->class == XE_ENGINE_CLASS_COPY &&
> >  		hwe->instance == gt->usm.reserved_bcs_instance;
> >  }
> > +
> > +u32 xe_hw_engine_fast_copy_logical_mask(struct xe_gt *gt)
> > +{
> > +	struct xe_device *xe = gt_to_xe(gt);
> > +	struct xe_hw_engine *hwe;
> > +	const u32 fast_physical_mask = 0xab;	/* 0, 1, 3, 5, 7 */
> 
> Since this is PVC-only, I would use, instead:
> 
> 	const u32 pvc_fast_physical_mask = BIT(0) | BIT(1) | BIT(3) | BIT(5) | BIT(7);
> 
> as:
>  - it would avoid the comment;
>  - it will document that other GPU models may need different physical masks.
> 

Agree that is better, will change.

> 
> > +	u32 fast_logical_mask = 0;
> > +	enum xe_hw_engine_id id;
> > +
> > +	/* XXX: We only support this function on PVC for now */
> > +	XE_BUG_ON(!(xe->info.platform == XE_PVC));
> 
> Why bug on? Since this future is PVC only (for now), other platforms
> may not need. So, I would do, instead (as before):
> 
> 	if (!(xe->info.platform == XE_PVC))
> 		return (hwe->logical_instance);
> 
> perhaps calling a drm_dbg() to report it, just in case newer platforms
> might require it as well.
>

I added the BUG_ON so if we add new platforms that support USM this
function blows and we immediately fix it. I prefer to keep it as is.

Matt

> > +
> > +	for_each_hw_engine(hwe, gt, id) {
> > +		if ((fast_physical_mask | gt->usm.reserved_bcs_instance) &
> > +		    BIT(hwe->instance))
> > +			fast_logical_mask |= hwe->logical_instance;
> > +	}
> > +
> > +	return fast_logical_mask;
> > +}
> > diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> > index 11c8af9c6c92..4a7fec5d619d 100644
> > --- a/drivers/gpu/drm/xe/xe_migrate.c
> > +++ b/drivers/gpu/drm/xe/xe_migrate.c
> > @@ -345,11 +345,12 @@ struct xe_migrate *xe_migrate_init(struct xe_gt *gt)
> >  							   XE_ENGINE_CLASS_COPY,
> >  							   gt->usm.reserved_bcs_instance,
> >  							   false);
> > -		if (!hwe)
> > +		u32 logical_mask = xe_hw_engine_fast_copy_logical_mask(gt);
> > +
> > +		if (!hwe || !logical_mask)
> >  			return ERR_PTR(-EINVAL);
> >  
> > -		m->eng = xe_engine_create(xe, vm,
> > -					  BIT(hwe->logical_instance), 1,
> > +		m->eng = xe_engine_create(xe, vm, logical_mask, 1,
> >  					  hwe, ENGINE_FLAG_KERNEL);
> >  	} else {
> >  		m->eng = xe_engine_create_class(xe, gt, vm,
