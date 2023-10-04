Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5EF5E7B5ED
	for <intel-xe@archiver.kernel.org>; Wed,  4 Oct 2023 10:55:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B2E210E0FA;
	Wed,  4 Oct 2023 10:55:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1B2E10E0FA
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Oct 2023 10:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696416939; x=1727952939;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=XrgDFpV7jf94diglDcu9cEhhQhuGqrAPNoAyHS3uFhQ=;
 b=VUwxQL8de7EeAdOdfQN+p4mKb63JM2LMcqzIIq+iDhFqa4GJT+Dx/bH1
 OyM0c+xVXe49wyFXOK23gPzcDzEMsN6mRImb0b2RYomf+KgB+f7ilmlNY
 sa2ritzIe7UH3k0uEnhkmMJcjn90oEuPvaHsdFsHM+8CdohmKOyyy25co
 PO1ijIp189sL83CR+Fy2d6z33LphS5OhRY5v+IOe1zNRatMMCH3c6scuP
 sUzIfKhTLkurg2AG/+Pr9WpcfHD2FMoQgLB3jCBsJwK+W55paWEeX0JZD
 fAOn4AYYr/psis7FNK8V6IgpZ5kri+mYl+ZDfDx1Ov6iPHmJ4HGrJOY+h Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="447304755"
X-IronPort-AV: E=Sophos;i="6.03,199,1694761200"; d="scan'208";a="447304755"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 03:55:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="894897139"
X-IronPort-AV: E=Sophos;i="6.03,199,1694761200"; d="scan'208";a="894897139"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Oct 2023 03:54:05 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 4 Oct 2023 03:55:30 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 4 Oct 2023 03:55:29 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 4 Oct 2023 03:55:29 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.42) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 4 Oct 2023 03:55:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GofaziQlpeYZNuYfPOzaifn+rrY785vkU9X2U9I5p5OD5ijyaFZDsSRgSR64NewnxVzJdqFMXt0rudgRj9kxd+yaqy0as9/yAy/9m3FzOod53EhwU77bP7oTfqleOZoZmljvaWksDQ6+GooUa5d1FxWWMwrszgPQvmXA+1mskFQ2W8O66eBmja34GYTondC0eViNDmmDYGt2vrd6ps1xtt0KDmItJjdP8IxuUxX18P5SzSvAt6BagbpHoCH86atXeAWxE9cYkQ8h8KJ+ETz2JF3a5HHI1QmRwca6l7bGKc8mwxkpOsNOxNpzURqXMopnuFyO+5wrXlXBMNPvs/wTfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lvjbf4b/sFvDCvV+6bFlHpA7UJh2JJx3cPd1Gr/WD58=;
 b=FDX4TqdgPr5ShUCWjdB81QMbpZmtdi06kz8bkrHB8KwSpIjy1EWa6IxOPF4xRlL5e5BzFUU+7jO1Y4IVbyoA/HoDJZBQhE3i31FhwU3LX9yoX2RvLVqfuPwUOGLjCkKwiZSJj7VPfyhrzBrdmWWY1kmw9fLAQ7a6TiKi86F9qQ8BPyuSx+Ag0id2JKygz+Hdl97E1ErM79U5LR0SSZWFhes4qijF8kumvxNWoFCNipuoXcfakhtIyfH62VksBWFvRLydOMr63Gn+QwjTQVCTk3/AouFIsmYEECqWKQc2VC5GprEMGKDZlDb5XIkUaK/KK7eD3PcpaXWY8c1jNCIvjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by SN7PR11MB6972.namprd11.prod.outlook.com (2603:10b6:806:2ac::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.35; Wed, 4 Oct
 2023 10:55:27 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5772:f514:b746:5723]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5772:f514:b746:5723%5]) with mapi id 15.20.6838.033; Wed, 4 Oct 2023
 10:55:27 +0000
Date: Wed, 4 Oct 2023 12:55:19 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Message-ID: <ZR1El9m3GERsbg_I@fdugast-desk.home>
References: <20230926125540.7-1-francois.dugast@intel.com>
 <20230926125540.7-27-francois.dugast@intel.com>
 <ZRYcFy97svJ8Z4NS@unerlige-ril>
 <ZRaTrQ6qqa9wIO9n@fdugast-desk.home>
 <ZRb0uavwuieKeqVy@unerlige-ril>
 <4bb2a25702832a21263c3e5780644b979697998b.camel@intel.com>
 <ZRxaJFgF1Qoqtoey@unerlige-ril>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZRxaJFgF1Qoqtoey@unerlige-ril>
Organization: Intel Corporation
X-ClientProxiedBy: DU6P191CA0022.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:540::13) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|SN7PR11MB6972:EE_
X-MS-Office365-Filtering-Correlation-Id: ec466aeb-5bbb-478b-8ad3-08dbc4c86af8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2bNwBeBioA+SQ3JdclwZXS8uysEFKVjrKDGOnSUFx2PehUPXf8UhlOd6YqkoE7Dg2r35eORf8L1pkIiLE2kwfHlVPAXNFaLiAMyx+JF7VaihfxYEnCFma7qFTckEsa4yaXAh4xzvJygxofr3zjACpmDaOpwNZVKL2tinApN/GyNNBroj46nhox14NkaI3wGZdFMxXuxz5ytuOpDRWxa7JLG2pgA99IG2ebXL5bcprFLVqZBMKqfGvCQAoInb7Ik5jNmHc5eeNsfLjlCHxOL/SGal1FFt/SlbcsvUgasU26bmabXw+0960HZlP7b1arx7hDR+M301HVC9d92BvSQHKe98rhzcQtOI+3u+/ecIrwoBxKU9Knw5mQpqWz2ykM4+XvUnkFdTLDAvZvnwaA9WdVxYg8s0aMvkIivx2ya2ob6lNMWDQdlT3JphPtALHvvzcN3qOn9AGe2Az8ElVvEcBMh8tnAdUv5Y3rrb/2/B0DsIMQfIF//Y+s5JKOG1MlgUphghnMixn71gZM5+tFuou+jQd4+w831Fb/5yIfyeOL8p7wHmgMkrdesmTBV8FJWr3gnRodklLzXQUYFkEeaDRQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(346002)(376002)(366004)(39860400002)(396003)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(2906002)(83380400001)(26005)(82960400001)(36756003)(86362001)(38100700002)(44832011)(6636002)(6666004)(36916002)(316002)(8936002)(4326008)(8676002)(41300700001)(966005)(6486002)(478600001)(5660300002)(6862004)(66946007)(66556008)(9686003)(66476007)(54906003)(6512007)(6506007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wd20jmRJpTqcTYGojj+Zz8n5QUc8rE0qW0ucvX29oWFgNwWeTR9XlkV1uv5s?=
 =?us-ascii?Q?x5zsFDi0grEjwekC8AAQpZ8+Lxg8x3btgnnhIrcOPlT0Uh042blFZry/0GYx?=
 =?us-ascii?Q?UV/QjZgDMzIZCf9RcTmkvIMBbkKPnPkB+mR2jWyfgmbHe+wzb8aWKt4Vjbqo?=
 =?us-ascii?Q?Colsi6fFJXcHJGvrQx3lXEagrfPtWl80V4aM+x1o3wyXicWeMJi3E9Vlwl/B?=
 =?us-ascii?Q?51kMc1kud6WRszmkFukhnmsyF7TkXTpEJ98NN7xnfEwdZQA8Iit9tqOZZUsj?=
 =?us-ascii?Q?YqGkzHNL2ZjOH8oTEEGGHRICl8EjkXauaeJ65aJsQZLPw00zBt46kiWr9y37?=
 =?us-ascii?Q?gmY87W9W1GJrmcZuVWbYvQdLXW2q4AxBiRyMjDYX179CGTOksI/ZmaY5fbBD?=
 =?us-ascii?Q?4xvdyF95jt/IV7DrMUrIx/Ggo/wJ5UdI2eyiIl28LwWvM08hCa1p0uef77Uv?=
 =?us-ascii?Q?H+n6a0BbZD+px1E4p/OsGbb46IzZHMSNfS7usYS6uxT6i3QbpYBC9YZIq9P1?=
 =?us-ascii?Q?1RohQkAVvYnh0dRsssntqzf9jeP0iCsk/n6rWhk7A+BAFPweRowt7EmwudjN?=
 =?us-ascii?Q?uSZ3umi3/Wm+X43Y9ohjhfusqylN/Zvx1VIPptCn4jcAuGCgbyuoAuJJ8OaA?=
 =?us-ascii?Q?G2tisS0ej43AjLtLeZq9E0gGRORUudhvLeIKEEgF78xVI4BDMxSjMPt9YWhO?=
 =?us-ascii?Q?n+KaWTWWF67BtrBSho++BP+mXaIAuY54Xj027RMG09B4IzZ79qzYLsJrLNOs?=
 =?us-ascii?Q?iDDDFHvVNGoFnC2yhYOJ4ijBheXu3+8wU4pYB7g6y82HVecClSe5LY9YwAXW?=
 =?us-ascii?Q?fzTeveeJixtN568cmMWSMsYZ7CxQGsZC5zPVexdRCdOZ5Vv5j62pol916vpH?=
 =?us-ascii?Q?1qTC018LTdGg2WMv26zHz/oyjGXfHMe56P9pF9INDfGHcZZ55p95S/CNUklA?=
 =?us-ascii?Q?ziI+FYtGgQnJgkQ58f2Mn0dHfgf3wM1wnb6dq8WjrtKoQ5bH5shiJm2HPij/?=
 =?us-ascii?Q?eYt3LXkX0dlsvmJWAe9CzT+S7GVT+k8kMm45+fS3YAW4KQAzNfNQYk8sXzwW?=
 =?us-ascii?Q?BHQcvu0hnIHgdH/KFoDCtHCnuQclD5a+ilMH5dxBqclmoSrzsaJp75EZXsso?=
 =?us-ascii?Q?hE3Ycp7EZ1IVc5A5PnBvva2CdNwRGL8vr+HJcsK6V5s511R9xre6mtzN0brd?=
 =?us-ascii?Q?HgUy1fe9rafVju2Crmr0XouB0GJiKXU6lLYv4tyoY0aBmk8MV+mC8nHaS9Lg?=
 =?us-ascii?Q?SfjbkiaSFtCInKiy3fGTxaSmUCrdFMQVFgQkP7jThZ3mxuo/Kdkmw16PW45r?=
 =?us-ascii?Q?ZZfrZ0UIFerOXwSsaTPr/6c76FH1IyPz5CWbjYowTFbnTm+BNlZdENCCUtWM?=
 =?us-ascii?Q?jHrDd2Jgih17CTpBMJnOLWKFmIrE2yXp3SWyCyeRKido5xDgtCMqsgECJTvV?=
 =?us-ascii?Q?CmV1x8mbuERPYLFG6ATswKtDoGENczjNjycORBw+RgcWpAO71CZxVyiXkxpK?=
 =?us-ascii?Q?eZgEiPJ9HrODuAnd2lFzWI0Q0PQXAmswLw1mJqo04B3PfmiyyPtYW4zqEiPT?=
 =?us-ascii?Q?dsZlBP/frvilVkWQwNoD3rcZPUZ7R/PPI3Hh1lwGCb6sydbfAMiF2mw11lFk?=
 =?us-ascii?Q?Sw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ec466aeb-5bbb-478b-8ad3-08dbc4c86af8
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2023 10:55:27.6267 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MhNv7w/toTpQcLtI40FzHt229Dj0Iwx9g1cOzq7Nt4tY8c+u/ygTIbrBY6jEQzd/NZ8LMAh9Y1wvSrU1EWk+jtnHDTgosZMgafPMibinhsg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6972
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 26/30] drm/xe/uapi: Add pad to
 drm_xe_engine_class_instance
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Oct 03, 2023 at 11:15:00AM -0700, Umesh Nerlige Ramappa wrote:
> On Fri, Sep 29, 2023 at 09:45:35AM -0700, Souza, Jose wrote:
> > On Fri, 2023-09-29 at 09:00 -0700, Umesh Nerlige Ramappa wrote:
> > > On Fri, Sep 29, 2023 at 11:06:53AM +0200, Francois Dugast wrote:
> > > > Hi Umesh,
> > > >
> > > > On Thu, Sep 28, 2023 at 05:36:39PM -0700, Umesh Nerlige Ramappa wrote:
> > > > > On Tue, Sep 26, 2023 at 12:55:36PM +0000, Francois Dugast wrote:
> > > > > > Add pad to reserve space for future uses such as special configurations
> > > > > > for media.
> > > > > >
> > > > > > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> > > > >
> > > > > I saw a comment in v4 that you dropped the patches that are not reviewed, so
> > > > > this is:
> > > > >
> > > > > Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> > > > >
> > > > > Hoping this will be part of the final series that you merge since the
> > > > > ENGINE_CYCLES query is using this structure and relies on this padding.
> > > >
> > > > Actually using your original submission [1] this patch should not longer
> > > > be necessary, right? It includes:
> > > >
> > > >   __u16 rsvd;
> > > >
> > > > [1] https://lore.kernel.org/intel-xe/20230814223734.375449-5-umesh.nerlige.ramappa@intel.com/
> > > 
> > > Hmmm, I failed to notice that earlier. My bad. v4 looks good, you can
> > > ignore this.
> > 
> > It is named as rsvd but it should be a pad.
> > 
> > We can't leave as reserved to be future used to return media engine capabilities because drm_xe_engine_class_instance is also used as input to other
> > uAPIs and that is useless information after initialization that UMDs should not need to carry around.
> > 
> > Instead DRM_XE_DEVICE_QUERY_ENGINES should return something like
> > 
> > struct drm_xe_engine_info {
> > 	struct drm_xe_engine_class_instance instance;
> > 	__u32 rsvd;/* future could be __u16 capabilities; __u16 rsvd; */
> > };
> > 
> > This can be fixed in uAPI take 2.
> 
> Hi Francois,
> 
> As per Jose's inputs, I posted a new version of my series here -
> https://patchwork.freedesktop.org/patch/560614/?series=124565&rev=1.
> 
> Can you please pick up patch 3/3 from here. Note that just adding the pad
> does not resolve the issue I was mentioning in my original series.  We also
> need to explicitly initialize the pad to 0 in this case. I have included
> that change as well in the above patch.
> 
> Thanks,
> Umesh

Hi Umesh,

Thanks for the update. An earlier version was already included in take 1
of the uAPI changes [1], against which UMDs are currently aligning, so it
would be best to leave take 1 as it is and include your fix as a fixup in
take 2. Could you please send a fixup instead?

[1] https://patchwork.freedesktop.org/patch/560614/?series=124565&rev=1

Francois

> > 
> > > 
> > > Thanks,
> > > Umesh
> > > >
> > > > Francois
> > > >
> > > > >
> > > > > Thanks,
> > > > > Umesh
> > > > > > ---
> > > > > > include/uapi/drm/xe_drm.h | 2 ++
> > > > > > 1 file changed, 2 insertions(+)
> > > > > >
> > > > > > diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> > > > > > index 79e47708d526..84091860c7d2 100644
> > > > > > --- a/include/uapi/drm/xe_drm.h
> > > > > > +++ b/include/uapi/drm/xe_drm.h
> > > > > > @@ -143,6 +143,8 @@ struct drm_xe_engine_class_instance {
> > > > > >
> > > > > > 	__u16 engine_instance;
> > > > > > 	__u16 gt_id;
> > > > > > +	/** @pad: MBZ */
> > > > > > +	__u32 pad;
> > > > > > };
> > > > > >
> > > > > > /**
> > > > > > --
> > > > > > 2.34.1
> > > > > >
> > 
