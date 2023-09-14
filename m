Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDCB4EEAA66
	for <intel-xe@archiver.kernel.org>; Thu, 14 Sep 2023 19:32:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3D4110E0D4;
	Thu, 14 Sep 2023 19:32:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97B5E10E0D4
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Sep 2023 19:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694719946; x=1726255946;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=aancCkUEil0v940ErsMO68gY45ntKHchJOScIm3esIM=;
 b=RlTwTX+68c/sUf4N/+0tXJ3OKpn1Nf4W1yTnI/pdXOuFZsZpqNlvkTjO
 dNSS2UsFgVfEah41pgBncIerT6XBR3Ad1PSNpxPlg6zbYWv3lkccxejwh
 Xhb98s2AD0YsGQlPLZnXpqeEaUYw2q5i5BX50LgON0v0AdyX/wgbcgSWi
 7Z7EVRpxuy5a97K/P+PLNGBwM7HEsteFM7EWF14uHjzfi9WETiEJcrDd2
 XowtHb0FQW37/dgcTrOEqlIoonUBMuf8jFmIoo6iuHX0tzCCLRvBYXlPb
 U4zamYsWaL36h+6qh3tgSzBF58J/m2c9W6CKuZrmZxTZZYJNtPd0VQCYA w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="443100178"
X-IronPort-AV: E=Sophos;i="6.02,146,1688454000"; d="scan'208";a="443100178"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2023 12:32:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="744663952"
X-IronPort-AV: E=Sophos;i="6.02,146,1688454000"; d="scan'208";a="744663952"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Sep 2023 12:32:25 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 14 Sep 2023 12:32:24 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 14 Sep 2023 12:32:24 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.107)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 14 Sep 2023 12:32:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BKo+YWurW8L9g0SMVJLH8D8wMwZ1t0CxREdjzOVWDXclBUN1C0z2B9r942/JRPtwAzpCUPhTxwaSFUQF5RxLjig2evXzaVJ4ad/J+em1qM54vmP4qxIWcuQWoafMGGyCpIwW9fbKPtWm9NoTCD1BB10MP6uQcQ9hWNSz4wH9bAGdkXD2qNlcf+XfJO+LNRShNxK4pN1CKxONsgJEtLUd1aoJq9jd2NiSzkHj1bGDceuzDtyDehxdU4Ecc9ynuN1TLdS79RKKihOg6LjEAUyJYA86FNdVFAi9nvQcHcRQ7bnbqVezq5O00EwUP82tGtStDBH3+31qfx9z6JSb0yFdEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cj9SSn9xLx/uxsnUZBQ6zmBtAMwsWKYTTOA6EhBJS1g=;
 b=KCp+5pNeLMSqQNiKXw08pYLAGJ3erzV61r7/XVOCeFZjIRNQ8EvLWFa9YI7Uml+gBdjfnr2lTs3YWRojjSg5phAgyLoXhjYA3iPVgwtrzOEZ8vsR47/Zufta0kSwOPubp8VYeAEyaOjkHq12HRkujKuc8odeoY//SeKfut+D/nflzHGK+GYfGB7WPAHjCC/5iMd3b5V8wEb9b6I48S1BDDk3ihTz4hbyA1eH57hfS/uQ4eoCYk23H0wU42BdXOH6Pf6sqI0QB4ABQ2NykBDM63KrddGGlqpPEu6VIzacxRQkwmfSVbc8M1USK5eLichfovY6X86VG9Aa4oraZ3Htlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DM6PR11MB4514.namprd11.prod.outlook.com (2603:10b6:5:2a3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.20; Thu, 14 Sep
 2023 19:32:22 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6745.034; Thu, 14 Sep 2023
 19:32:22 +0000
Date: Thu, 14 Sep 2023 15:32:17 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Message-ID: <ZQNfwZ4ZotwaFS8H@intel.com>
References: <20230814223734.375449-1-umesh.nerlige.ramappa@intel.com>
 <20230814223734.375449-4-umesh.nerlige.ramappa@intel.com>
 <4793cb528b5977e3bca6fe9d2883fbd8acd68625.camel@intel.com>
 <ZNvGn7kpYmtDMrH6@orsosgc001.jf.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZNvGn7kpYmtDMrH6@orsosgc001.jf.intel.com>
X-ClientProxiedBy: SJ0PR05CA0006.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::11) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DM6PR11MB4514:EE_
X-MS-Office365-Filtering-Correlation-Id: caa365a4-89c2-420d-48d3-08dbb5595136
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8oup74NHbGX1+JwhfhBYutZtlx0Fi9mpqAUKPVQ/HEI5zVNMlpZveXGAiRxmQYocUhcgAjIRkdpEev4TFqzxb8LqwTF18yuy+vQ5DqjxESvMxr4YnYPYwIy7fUeseYgXKH4IeJxaFKW35qGd/pry0a5wkP6T8eXN63tfq43enYZX+yIaegeNFwp7Gz5+TueCwKzneHOsSYby8bZswexLlnVgDmzJcKugdCWylXUPQTvHoKwGjpPpOJqQqrY/EOCIkEF9E/mphXcX0BK61WOgbOuv7CqHCaEkqQC9qHNlRuO6Q82Pybssa64veQrGffD7WOeSxvQxmagUm93LfxuyzvJUHTbZxQwv7XLUKAxU4r/sc7bTGNvd+z0ni2jGia9HP47xHZdqfMVb6W1HSVo6gYvp1x1Zxvwmlc/v0DU1vD2vc7qyOZ8bXiJ8tdqFF2w9qP9UeS7zBSzfQBDias6NDvpvJa2hpMdSeJywkDWic8bWsiq34B9ziXpKLfs2DGUXvsIleWtR90DwnLBctBJM8p2Cwj+swcvq4CeyZTTyfntMTQ47hL81Me0Ya9xLNh8t
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(376002)(136003)(396003)(39860400002)(346002)(186009)(451199024)(1800799009)(6486002)(82960400001)(478600001)(6512007)(6666004)(6506007)(38100700002)(36756003)(66946007)(54906003)(316002)(66556008)(37006003)(66476007)(6636002)(41300700001)(26005)(83380400001)(2616005)(5660300002)(8936002)(6862004)(4326008)(8676002)(86362001)(44832011)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Bekm5PfdIxNRcr8CwIJhV699vqRmHAOCB95EgV0nkStNvI5Mg1azbM3PmTEE?=
 =?us-ascii?Q?SJqf7Mw9vODV2HeUJ0mbPiwuYD7qbFoWzO4oABw/DaSJYbgXdQRAf3gkA7Fb?=
 =?us-ascii?Q?0Q3RRabojPvfOUY1CGMWoRYglQjUdfgxnAPrhbs6BCd7OgetlkVzfe6O0q/d?=
 =?us-ascii?Q?vl1pgs4CTzR61zd2w0wImvrIc5dPwAjxBCuYwhl1pv2ORo/A3Ly9Ae6OV0js?=
 =?us-ascii?Q?mf7ply9HxcdqNIQyxefyOb27KuHQODmn6aLn3yVQhqTTlqy0OHtYTWn0uc/m?=
 =?us-ascii?Q?7Eg2R29Ho4gvsBUHpsoclfeIHtENQmCEkuuvgrfp60ysCUxO+kO8aWTvreP5?=
 =?us-ascii?Q?uAigp33eSnARpt86LQ1+TDDnva7kyPF/vLVDxb8bqH7mvpdQrBerLZnxFpn+?=
 =?us-ascii?Q?lOobYWLXSMBptjcHHGG3vZtUU0DtBzicQD/iWKVIens/9UYU9e0RyNOGBGnj?=
 =?us-ascii?Q?VsjF7XE6frA2+xaDdXLWYNQT0QKAUETjrM8sYT/uybKYM4lFw3WVmbVC/Lo8?=
 =?us-ascii?Q?i/9u1ZLEWYZLrmqtkcgm6nwB0g/0wYrwZ614gHv+oDw/O1Ba8gMpLvsGouiu?=
 =?us-ascii?Q?WuuZV+821bpx0UP9J5YY54pZLKRwG2YKrliokxbsDn4pYvK6cTyyC5hVFTPW?=
 =?us-ascii?Q?6qU1VxYxvID2Ku9Ze59F6oOIoq3LxAgPMbV9sOANRTZB6dViICs6XuLIqtQW?=
 =?us-ascii?Q?jALvZkls7bC5LWzAoWSTq5hBGJ4RRbwjTrKEC5hAigEeUwLWx/pPGXBKPFws?=
 =?us-ascii?Q?EN1TcRSYeNDXwhbGczLkZ3DKA8gFC7pjAR3sfh2FRQfTcr+r7hkllNPoCYKC?=
 =?us-ascii?Q?56Zr7MvgxZyXL9dQP8DmARa1bPo/j5wlXr3olnQgPfSm8DHK6oDp8NGY1MDT?=
 =?us-ascii?Q?KRcmJN6lG/NEjFQpouO4BqlCTfk5gZA3dcIv/GovNgwa+vjy3Jjg63Ds1oBG?=
 =?us-ascii?Q?Clc6EWrnJieoB91eXAoXEC7dtnrvnRSBnnHUjbVqw9M7EC5BUU7ONQu9Y5hp?=
 =?us-ascii?Q?D95DBVGPHmgPq1tJ/MW6Z1BItea9kg2Dr9McCZFdKXjNbcqHW4k7aeu/xlRV?=
 =?us-ascii?Q?SHrO4f+tSRM5CiYCSDT9x8jRMetNqxT902MAynbVXm0rdvtKH//KqwfSl/m0?=
 =?us-ascii?Q?34sKRga0DVX1EFEHpvfGFOSapfQaQMn8uQ+qiZ0x7mxY/4R+nAntkAxPL+By?=
 =?us-ascii?Q?3I9d1FfVrxYwiM/LLfsKjHpPZBaAsuPooLV4EDSuN/FRmD5IutTDqoPJdJ6M?=
 =?us-ascii?Q?RNz7leoUy9i3XqOX1Rb1p+Im5Eij0WxNg7SQr1QYnIyMUs6I5RqArc6YFMDl?=
 =?us-ascii?Q?nvCpIM3ckJhWRrnF37K2elLIOaZ9LxMZ1CrXWTS7Bam8hoftIfQoyj9ZYPLS?=
 =?us-ascii?Q?DuIOf79OXkK4nL0uLRlYFtTa7doKYlX0mkV3mB/4BkbuH1ZffeNqvdozHRoF?=
 =?us-ascii?Q?fWGFlVT+ALPwGgIos6fQE0w5zk7vcUzBJRiQhtg5Ab2zw2aw4iTckskcZtaP?=
 =?us-ascii?Q?cHWZrwTpa8wic12h6a0yrnz7CPBOOdHJj+65Z/QFGqXMvGFSt4flMOfbIbH8?=
 =?us-ascii?Q?04S22YCcuFhmp8kmb7lMOJ18BXcX0s0wSV9U791lSoHcXZVLGNaRdSOVB8mJ?=
 =?us-ascii?Q?3g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: caa365a4-89c2-420d-48d3-08dbb5595136
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2023 19:32:22.7114 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FB9UqMYCmOCGEjNtodpsQ9dkiaWFaRTthqgAWZZkMLWbJcv4mWodtrh9A2ylxeK4GdhM0eNcB9joV1r4vvEqtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4514
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 3/4] fixup! drm/xe: Introduce a new DRM
 driver for Intel GPUs
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
Cc: "lionel.g.landwerlin@linux.intel.com"
 <lionel.g.landwerlin@linux.intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Aug 15, 2023 at 11:40:31AM -0700, Umesh Nerlige Ramappa wrote:
> Hi Matt, Rodrigo,
> 
> I have a uAPI change here that breaks UMDs. How do I land this and what UMDs
> should I inform for updating xe_drm.h?

Hi Umesh, if you don't mind, I'm going to take your patches here and put
with the series that me and Francois are putting together so we change
the uapi only once.

It is critical for our series, since Francois' removal of mmio depend
on the addition of this one here, so Mesa can stop using the mmio_ioctl.

Also, I'm going to rename the patches. They should not be fixups at
this time.

> 
> Thanks,
> Umesh
> 
> On Tue, Aug 15, 2023 at 07:03:42AM -0700, Souza, Jose wrote:
> > On Mon, 2023-08-14 at 15:37 -0700, Umesh Nerlige Ramappa wrote:
> > > struct drm_xe_engine_class_instance might get padded for 64-bit
> > > alignment based on compiler used. Since engine information is kmalloced
> > > in the query and drm_xe_engine_class_instance may be padded, it could
> > > potentially leak some kernel memory to user.
> > > 
> > > Add a rsvd field to struct drm_xe_engine_class_instance to make it
> > > 64-bit aligned and zero out the field before returning to user.
> > > 
> > > Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_query.c | 7 +++++--
> > >  include/uapi/drm/xe_drm.h     | 1 +
> > >  2 files changed, 6 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
> > > index 99a4800c7c53..b9d565264ceb 100644
> > > --- a/drivers/gpu/drm/xe/xe_query.c
> > > +++ b/drivers/gpu/drm/xe/xe_query.c
> > > @@ -65,7 +65,7 @@ static int query_engines(struct xe_device *xe,
> > >  		return -EINVAL;
> > >  	}
> > > 
> > > -	hw_engine_info = kmalloc(size, GFP_KERNEL);
> > > +	hw_engine_info = kzalloc(size, GFP_KERNEL);
> > >  	if (!hw_engine_info)
> > >  		return -ENOMEM;
> > > 
> > > @@ -78,7 +78,10 @@ static int query_engines(struct xe_device *xe,
> > >  				xe_to_user_engine_class[hwe->class];
> > >  			hw_engine_info[i].engine_instance =
> > >  				hwe->logical_instance;
> > > -			hw_engine_info[i++].gt_id = gt->info.id;
> > > +			hw_engine_info[i].gt_id = gt->info.id;
> > > +			hw_engine_info[i].rsvd = 0;
> > > +
> > > +			i++;
> > >  		}
> > > 
> > >  	if (copy_to_user(query_ptr, hw_engine_info, size)) {
> > > diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> > > index 86f16d50e9cc..53cd57342620 100644
> > > --- a/include/uapi/drm/xe_drm.h
> > > +++ b/include/uapi/drm/xe_drm.h
> > > @@ -753,6 +753,7 @@ struct drm_xe_engine_class_instance {
> > > 
> > >  	__u16 engine_instance;
> > >  	__u16 gt_id;
> > > +	__u16 rsvd;
> > 
> > I don't think this change should be fixup, as this breaks the uAPI.
> > Please ping the Rodrigo, Matt Brost... about what we should do here.
> > But at least you need to sync with other UMD contacts about landing this change at the same time UMDs update their xe_drm.h.
> > 
> > >  };
> > > 
> > >  struct drm_xe_exec_queue_create {
> > 
