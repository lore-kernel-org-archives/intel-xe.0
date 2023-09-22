Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2C35CD4850
	for <intel-xe@archiver.kernel.org>; Fri, 22 Sep 2023 19:10:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEB9A10E704;
	Fri, 22 Sep 2023 19:10:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B5DE10E704
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Sep 2023 19:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695409825; x=1726945825;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=oNzseLNdZfoJGrYL3+A6DqamITdi1DBBlKijp+bHvcY=;
 b=hoMV19x1JSSIr8wb21TktMlKDmfvB2fZ50oteHhmLCvQGdjKF5aJ3q8n
 j7cRhzuJkpx7TTPTvRLHDwImpStv77OyztTs2HiwuwHDHHHIzPaPi4ZbF
 XmIwZ845vleSnLr7tSyDdg95kJO7OfxR3ICyQlDq1L8Z9fKnyj93HC6eZ
 ICRgVOjv7vIJE800KykHrhmNzcbeYwCCXsstN8rv2/h6qutP2oS0F2Nr6
 sb0LEh0zaDoR7W8+WGUh7K5bMtvrqY38WFFQn3xNoe0RUnT4zUbEiUVSe
 NgVo7a7f9ExQos9q5ednSenylZ6akYJLwQ21oizRuj0uVRlj8ijaKruIe g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="378204053"
X-IronPort-AV: E=Sophos;i="6.03,169,1694761200"; d="scan'208";a="378204053"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2023 12:10:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="871349902"
X-IronPort-AV: E=Sophos;i="6.03,169,1694761200"; d="scan'208";a="871349902"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Sep 2023 12:10:17 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 22 Sep 2023 12:10:17 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 22 Sep 2023 12:10:16 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 22 Sep 2023 12:10:16 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.46) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 22 Sep 2023 12:10:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UqoBX58qkMZX/9oQb86UvqZSAmPWhYJxIq6i77DTEbsCNJ2wp799ecp0jhgEMJIq2jtz58QnjsfUsryOlXu+mecPvKcNanSvyM2saVTDCDf1Ma6QzQfwMV8dQgVzbjn09xsMgW/NHrKuukgLyNaqXP/Qhs5UYItwLb/XqqgCQL5qtrMRECtD6eRU8WcFiMvmLb0oWsNrKoboxyF9zfyE3moJOyMCTpkVb6v0cmjGcQfjuwDJjFDD1kY6oM5v32wvVKqf/SpHDfirPW9h2LVdJ263o3BAxnrw6l461VrIQu2aAJDNHJirlzzPaN2EanPPk+1V/vy8UVYNCbk8qi6Kkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mLNXqA5hNs9Az7NtTjwCnp/Wc9GgmWF08+Z+OYH57xs=;
 b=P2ifC4bt8/ln7iNOPfpuBuwHDVQUrykcfO8Yrrh/gxYjue7BUgklM5P2ccwofQVFap9tK2f937H9ZYezj+ct6Hh8qLyuEjzNga8ve58fJJ8QHRqK3ZOMlfSDNzPpGmkUVFOlUsRJbkS1w+55JSYFtP+WwgYUcTJYk/c73QsWNeYOYyqmVGbcqGHytQoCRChJ3GwxiwwhbRm3HP4SaoTj4A7TtZBlbR+KLvviTeQQC2Gj/M17uOdhDT+RRi79parPQnA+0Uhc9W+TxNH4rFWUrTTWd+7a9TBUsNcZx4MeWfoWv3tBougPF9mi5oCFzv6x8E09CJxXA/7Ry67NqA2GFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SJ0PR11MB5149.namprd11.prod.outlook.com (2603:10b6:a03:2d1::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.20; Fri, 22 Sep
 2023 19:10:12 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%7]) with mapi id 15.20.6813.017; Fri, 22 Sep 2023
 19:10:12 +0000
Date: Fri, 22 Sep 2023 15:10:09 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Message-ID: <ZQ3mkUT8sAWP1nZ7@intel.com>
References: <20230919161049.2307855-1-ashutosh.dixit@intel.com>
 <20230919161049.2307855-17-ashutosh.dixit@intel.com>
 <ZQyrgm74zjHjdr3x@intel.com>
 <87a5tfi3yh.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <87a5tfi3yh.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: BY5PR16CA0001.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::14) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SJ0PR11MB5149:EE_
X-MS-Office365-Filtering-Correlation-Id: bde571e4-edc0-4865-6792-08dbbb9f8bc4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4Cvs2gWrNq1yaXBaD23S8OlYkRWZeCQUj/zrNjyu2Hu8zC8HaPZr/zlZod8txnLc2j1LobrwZFStZGxKlUCK6RVY1gZ0RVkdw96MKpCWwc5n0SimaJ4Chjl8zPDANcU5YCRwGEfiOjHO3Tqb39Qr+ChDZNjgktP3WIpxY37SN+ZwWp1leOLZuILxvKpboL/PoKOGpYO4xPY0RgsE2kI18UOHaXxJl8o1mygxfhHjmGF9rCwXQ0YhKoO6ZHurJp2eyzbru3XG3+r8GWrA3/ek+5DaNW0aw3AdkmcX+S5pTm7btV5rUBET8o0NmgRJxCKkWAa+LsAqwc/TM31bD2zyqb9zv7cwolqYqHF3Ymns5yi6NMV9jmI3IHafeG/cu6eF0Cj4TQ8ENXCpo3zK7765EWwCjeBIEenoZtNNyut5PqLutuzHr89n5ggNl0hY9VcquZ/pJOeT6Z4IwntIKSggtvjE8XEOvpdkCdu3azEHCruQ43ezOpxX6lQwhtr6UNp0kPQlC0VPtl34X8qnx99wiIz/1TI9zGDA9hMs9RITRFDzlUBxQQwUrh122yrUKrKp9vLDdFvmcmflp4yueOvgqg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(346002)(376002)(396003)(136003)(39860400002)(451199024)(186009)(1800799009)(6666004)(6506007)(6512007)(26005)(478600001)(4326008)(966005)(2616005)(44832011)(83380400001)(66946007)(8936002)(66476007)(8676002)(37006003)(2906002)(316002)(66556008)(6636002)(5660300002)(41300700001)(6862004)(38100700002)(82960400001)(86362001)(6486002)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IqhV4TbTupCMqb7ZxgQtKg7j6n8q20hhmW3t+60U0GugpRF+jjaVLM63P85u?=
 =?us-ascii?Q?lAT21VuDiU0/uRIRYBJL9FKEd8h7zTLBe6rqpAVHPlNMX9AQrOysKqc6+S0u?=
 =?us-ascii?Q?bDm8ScsHqwFqOUVYl7iikI+f3que7r89JYpxWwwfvoDv1uP5o4JfXR6lpKNz?=
 =?us-ascii?Q?aASuVjthhYcdzxpjfUP08WnwjVELrL6I4jYt4425PhWDPmsL4HcVngH1Mtft?=
 =?us-ascii?Q?37UNoeVh1B4spAoCu9LTu7A83Kk+a44LeTz2ULAVEe5bgdeQfA/t9FZCACEi?=
 =?us-ascii?Q?Yziqe8SNjBrOCSSG6ZinImhT07k/cCnhs9oC8HepIDtG6lWvK2ntjXKKGpZa?=
 =?us-ascii?Q?3fxssmq70ZdGDKGB7LKnTYTF8RxxmvT0sLbvNDfKzpX7ja0vLHpg/4svtd3e?=
 =?us-ascii?Q?EIzffk2aKCsGJyeXFN2CejB+JrnoGrxG3Tuummlgp14QzHz+5hwsPYxMd5IK?=
 =?us-ascii?Q?y3mZGcmMF9v7b9aImuT1O15mZoonen7Qpjc1ujyJq8aG3dS1KH9RCXu6oj35?=
 =?us-ascii?Q?jhKdcDue7LRJmY922Ciy2EXeg4jiz7SrwHPJggU45yvw6YdT20HoA149rf/k?=
 =?us-ascii?Q?d7EtoL3+KCu8o7MKUzr9f0vxVgiJGtR3f0pRgLfNas+Q/5fWnsLQ3TxzLVgr?=
 =?us-ascii?Q?F40LBErgbs/F8idJ+rZZ1pdJzh4lvJe1x7rlLJ0WZJY7LWtQnkdaKrwO4/hm?=
 =?us-ascii?Q?6bASATRLJRxt4hVY3nYecGHMu5y5VzUoHfICvyWGSzKgvEIQT+DpYeSj4vOW?=
 =?us-ascii?Q?wedbGJ6OCqA7iShnUWD0jxRS497woUNkh2fCZLPTW4SuWvLDz292+um5PBlq?=
 =?us-ascii?Q?xQgY0MKBZ9N0+uUs8E1OZsqJwCkmzoXo2X3v6y11Wv136HV/sAN1k6N2ZBm5?=
 =?us-ascii?Q?8jWkFePfYLY75j4CguOF5pEWdhDUzMyy8itPC2VYJ05nLPHJFWizRYIpjpPz?=
 =?us-ascii?Q?BD+rscpi6LPmS2oVEgSJ+jHdk5T7zc6GQ00LXHjd0Tdu+EAPEQtmTmQTbNLs?=
 =?us-ascii?Q?8RqBc98sPFAfdPaAHHFZN2ELvKQAkQxwq6INKDM7Ooe6Lh9vRfO5IsCAVJvQ?=
 =?us-ascii?Q?T58dEPhEeiCXNh4rfsVV2cbtIwFUb7IO5HViwfKsQlTnaZJx6tdfoBqpHVIa?=
 =?us-ascii?Q?Ho2BoHFG5j8+Rt5FicL53K/2uOgog+2ZP2pcsRlWpSVCZX4GNycRzKVcrpOd?=
 =?us-ascii?Q?s9nkI94rH0kKtljzZRR9+aQLPZpwAGuBZ8BKytiVLNk1I2tOh7CvkvnFT4ys?=
 =?us-ascii?Q?XgEB7lmTgaC1x4qNacGlg7dQt5L45tXN504EQxna/K2WIDpld14PdvWNlZWu?=
 =?us-ascii?Q?L7vfG5OMz0VoD+OYqxBEnga66VoSSh9tdvJLUVpiPIid+/ePcOjAEkpUCoTP?=
 =?us-ascii?Q?AcPoDPbGjKvJzOa5DsbNt3w7lrLfeQm8egq9sGM+/YlZsau4Bqx17uocHJy4?=
 =?us-ascii?Q?0ifdpHh95ja/1JM74HgsbDmeGjrm3031dTqbyWjXvoMZhlGTLqHu37lftbZK?=
 =?us-ascii?Q?XwDmoG4aRXHkWnrKmUi8oWxDLcRQgGHShUHyzgPNZURRAFbcfT2nOX42V7vJ?=
 =?us-ascii?Q?gQWZi466y1/Z3tNPE13HZs7EjtSz4mnJ4Gr1QLVytoG5XZ2KrA6jf94lLdxK?=
 =?us-ascii?Q?NA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bde571e4-edc0-4865-6792-08dbbb9f8bc4
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2023 19:10:12.4501 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xDvqDXIeiyWXnd6aBSPGdSUEboKpr5PgDo/rkzsyuvzlwfFjsqcnZm5Z06uwgSGjqzDBXSrIeUR3TLxIGXAcDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5149
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 16/21] drm/xe/oa: Make
 xe_oa_timestamp_frequency per gt
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

On Thu, Sep 21, 2023 at 02:58:14PM -0700, Dixit, Ashutosh wrote:
> On Thu, 21 Sep 2023 13:45:54 -0700, Rodrigo Vivi wrote:
> >
> 
> Hi Rodrigo,
> 
> > On Tue, Sep 19, 2023 at 09:10:44AM -0700, Ashutosh Dixit wrote:
> > > Clock freq's can be different for different gt's.
> > >
> > > Suggested-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> > > Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_oa.c    | 44 +++++++++++++++++------------------
> > >  drivers/gpu/drm/xe/xe_oa.h    |  2 +-
> > >  drivers/gpu/drm/xe/xe_query.c |  2 +-
> > >  3 files changed, 24 insertions(+), 24 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
> > > index d49debe732bbd..8648652e05aa5 100644
> > > --- a/drivers/gpu/drm/xe/xe_oa.c
> > > +++ b/drivers/gpu/drm/xe/xe_oa.c
> > > @@ -1496,7 +1496,7 @@ xe_oa_stream_open_ioctl_locked(struct xe_oa *oa,
> > >   * platforms OA unit ignores the CTC_SHIFT and the 2 timestamps differ. In such
> > >   * cases, return the adjusted CS timestamp frequency to the user.
> > >   */
> > > -u32 xe_oa_timestamp_frequency(struct xe_device *xe)
> > > +u32 xe_oa_timestamp_frequency(struct xe_gt *gt)
> > >  {
> > >	u32 reg, shift;
> > >
> > > @@ -1505,26 +1505,26 @@ u32 xe_oa_timestamp_frequency(struct xe_device *xe)
> > >	 * Wa_14015568240:pvc
> > >	 * Wa_14015846243:mtl
> > >	 */
> > > -	switch (xe->info.platform) {
> > > +	switch (gt->tile->xe->info.platform) {
> > >	case XE_DG2:
> > >	case XE_PVC:
> > >	case XE_METEORLAKE:
> > > -		xe_device_mem_access_get(xe);
> > > -		reg = xe_mmio_read32(xe_root_mmio_gt(xe), RPM_CONFIG0);
> > > -		xe_device_mem_access_put(xe);
> > > +		xe_device_mem_access_get(gt->tile->xe);
> > > +		reg = xe_mmio_read32(gt, RPM_CONFIG0);
> > > +		xe_device_mem_access_put(gt->tile->xe);
> > >
> > >		shift = REG_FIELD_GET(RPM_CONFIG0_CTC_SHIFT_PARAMETER_MASK, reg);
> > > -		return xe_root_mmio_gt(xe)->info.clock_freq << (3 - shift);
> > > +		return gt->info.clock_freq << (3 - shift);
> > >
> > >	default:
> > > -		return xe_root_mmio_gt(xe)->info.clock_freq;
> > > +		return gt->info.clock_freq;
> > >	}
> > >  }
> 
> /snip/
> 
> > > diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
> > > index 4a3a9c11e8cc4..ad280bac9eed4 100644
> > > --- a/drivers/gpu/drm/xe/xe_query.c
> > > +++ b/drivers/gpu/drm/xe/xe_query.c
> > > @@ -244,7 +244,7 @@ static int query_gts(struct xe_device *xe, struct drm_xe_device_query *query)
> > >			gts->gts[id].type = XE_QUERY_GT_TYPE_MAIN;
> > >		gts->gts[id].instance = id;
> > >		gts->gts[id].clock_freq = gt->info.clock_freq;
> >
> > first look it here                      ^
> >
> > > -		gts->gts[id].oa_timestamp_freq = xe_oa_timestamp_frequency(xe);
> > > +		gts->gts[id].oa_timestamp_freq = xe_oa_timestamp_frequency(gt);
> >
> > Then please notice that we are trying to kill the duplications on the uapi [1]
> > and now notice that this series is adding yet another duplication:
> >
> > +u32 xe_oa_timestamp_frequency(struct xe_gt *gt)
> > +               return gt->info.clock_freq;
> > (copied from above)
> >
> > [1] - https://lore.kernel.org/all/20230920192940.135004-20-rodrigo.vivi@intel.com/
> 
> Well it's duplicated on some platforms but not on others.

Oh, I see now. Thanks for the explanation.

> If it helps,
> there is another proposal which will move all OA related information
> (including oa_timestamp_freq) into a separate drm_xe_query_oa_info struct
> (so out of the current uapi struct's into drm_xe_query_oa_info). See:
> 
> https://patchwork.freedesktop.org/patch/558367/?series=121084&rev=6

yeap, the individual query looks good.

> 
> Thanks.
> --
> Ashutosh
