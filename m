Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B10A2C77B75
	for <intel-xe@archiver.kernel.org>; Fri, 12 May 2023 17:00:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EA6810E227;
	Fri, 12 May 2023 17:00:43 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81C4510E227
 for <intel-xe@lists.freedesktop.org>; Fri, 12 May 2023 17:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683910841; x=1715446841;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=xHnuDPb/IEXRM5Pb99rTw4bO2NOzdt/NUpc5Kdvnt0c=;
 b=R4Fk0GlO6O4wloemji78vZZtpFkAeVAAMVMtVeMV5qU3N1ZU/zn+jPqT
 iocZQavX//6j3VA7SITugKw/6d5qw1kEElQNzSJvi+qlWggqd5HYWu+vs
 z8tnncew/xUe5f+JW4T9ZsRmnHW9cEvavS2bjZvWw50dq80HclsYOfntX
 iFgjus/yzWaNvSqn95mzpJe+N+yrOSV0ip+pDFyuaQ7J17tBpw9Ez9i36
 muHZKUfES4/V8W8COyyo+40igMkElpClbSj1gzdlha98jhvAjJVrPDYAV
 8kG6sXiV8RLnDW0jmUHOARjT8wUfwWMatJLbkWCFhw+8sPtZOkUwYcKPu Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="350860064"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; d="scan'208";a="350860064"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2023 10:00:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="650699519"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; d="scan'208";a="650699519"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga003.jf.intel.com with ESMTP; 12 May 2023 10:00:37 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 12 May 2023 10:00:37 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 12 May 2023 10:00:33 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 12 May 2023 10:00:33 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.105)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 12 May 2023 10:00:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MJgQslv4K/BejS8pEzr8JpHen+3Vt1b8JIe6mV4t8R/etz08qUCURaOANBYE3ojyiw4D0xsx/qAElxDV2P2HLj8CmNUrEJJno0YYAQtO/S7tJUC1tuWgL9La42HaoAoPwtMdvLZqYAxj1ktzTfPaTTZmy5SZAzV1J1AagLssWBY/4BAwtDzulpGzcdkIDtCqvib4CvWeRKKd//dw0ToEJQ5E39GlSXwLLfwSKCvg3+6GwuVd/h2II9Ro/6gF1tTue0uJNJtWU8+E7nOoGQgMUN8stjAlm4i4DNlDMZsLDl1suQFaPD/ZqngrH2szpaoAZbb2ilagMhHsk5YFDQ+HTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cCFzBMUcx7ZrTTd0MJJZibN1KwHw4BKTobXL+RSJIlk=;
 b=JG1foouvQJoYXzH3naUv3j9ZW4yKi2SLO4NFmuBAgRPDGqUoyhP+rM54oyG8V9dpehou1ZSVriW2uBmAGoClPSu1rQu3Z2UtqFn2kLY+k3ikRre1b5JpnT64s99t54o6WVhag+Ri0fFVb9XoWAyVsvesd5JfH4aDBkrlnUTgJjYx6gVQ85P/z1/PCA5NqJObx52fO10Rr+Wx6aD3gifOyYUAPuIKxe13u23eHsWr4CSFazkJqIDx453U/UjpTDqDFpubZkkV5Jq7+xkl73NPlrGZYc+/WzxLUn4VdNqqfox75mfkZ94Qp7LSeXcQagqZEVX3LK+pPl4NlvCnsbucSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 PH0PR11MB7542.namprd11.prod.outlook.com (2603:10b6:510:28b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.19; Fri, 12 May
 2023 17:00:30 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396%7]) with mapi id 15.20.6387.020; Fri, 12 May 2023
 17:00:29 +0000
Date: Fri, 12 May 2023 10:00:26 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Matt Atwood <matthew.s.atwood@intel.com>
Message-ID: <20230512170026.GF10045@mdroper-desk1.amr.corp.intel.com>
References: <20230511034722.1929038-1-matthew.d.roper@intel.com>
 <20230511034722.1929038-4-matthew.d.roper@intel.com>
 <qf2idx37zw7ss2s4lp6zpfomk4v3q6jid3iqfnnxi4avyh6med@qa3htrgeal4n>
 <20230512162002.GB10045@mdroper-desk1.amr.corp.intel.com>
 <ZF5p3ylRXl6OcYq8@msatwood-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZF5p3ylRXl6OcYq8@msatwood-mobl>
X-ClientProxiedBy: SJ0PR03CA0289.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::24) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|PH0PR11MB7542:EE_
X-MS-Office365-Filtering-Correlation-Id: af926dba-ade9-4921-6ad2-08db530a63b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZDK3h7xK2hQVumqbZyTgOblyyr2gyhnCTm3/gUCr98Ze1gENUvHiRzIWNA3CSsafS7bOv/gsYNmAsKhqHIzRPBeNTQuNvLtwFzpwL0Dh8RZadw7RjqwX/TQ5D2buvvV9ia9h/o43CoHku/9S8Kghoftdy49UeV34n2upvHTSsXrJFBlZuisOnLH5KxvlvgO4b1ECczJh6KUiZK79DncrUxbX0wtILtsevuy+NimuJALPE7mx2onb4N3e40gGr+LTdJuBkTzh58XrIP65v3pbuLdwWSvO0A/fEXGfI6uN6e+5+9eKt3Vn4GobBRgD4YpDAn4mOI3CA0oIhJz9SAVAIhZ3VEZyzBHBs2eyOVru2+AKxa+x4F/WlVuK2DfVLS56MiffnkP2O2FOKL9DD3ahMD5qLMaM50n/R9fbYbrgig/kPDI7aPnVf+2b1bb5YWTHEWL9NvzE57y7Ir4M2tg4Nu62S6y+ZOA721uVoGwciQReQaBCXwu11WouVjDF4FHNn6U5vk7w+DfrhhPEAyX9NLnZVpxXpNcg0Pm1FpO8gb3YKYtHMAGSIrKCK47CxqSA
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(136003)(366004)(376002)(39860400002)(346002)(451199021)(38100700002)(82960400001)(33656002)(86362001)(186003)(8676002)(1076003)(8936002)(6862004)(26005)(6506007)(478600001)(5660300002)(6486002)(66556008)(83380400001)(2906002)(30864003)(6666004)(316002)(41300700001)(6636002)(66946007)(4326008)(66476007)(6512007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?njkq0AyEJuYu7b+2bBdhTPE284Rqr4fVY6+SfYrFdF1FZ6vpVKMa37te4EfL?=
 =?us-ascii?Q?4YsDrQyzeMF4k5Wm+flUuif7700yLWQwhDobrcTJjdwoowgVV5YguJJhnCao?=
 =?us-ascii?Q?3Hs8HhaKb/GzqsHOHJy/AJEEVTPndk2l+1vNMeagLViVSeulKMSZokGZl4eo?=
 =?us-ascii?Q?lMALS+zH++I7TpC22L0cgBgwmr5Ed82AQ1extF3Y0422jSE7R+aK0ng2cnq4?=
 =?us-ascii?Q?OKIaVATYgtz9z8KzacabmY0m+PKeKjLh9MgO169vck+TGrBeJi1IWZbkpVN8?=
 =?us-ascii?Q?SrC/57Ud0FTp44WdehtF/cgSiMiyVAKQ1aH7a9w7m35LXNYLjwLhCBbEGmMl?=
 =?us-ascii?Q?msqltYsUyI+tSn+Ib6S7nxAzJP3oA5FCF+MyujRi0qo8vjbl6jsdBdCqiCfP?=
 =?us-ascii?Q?9c7IIT7IxdLU15osoJuXAZZtGZVy+tv+cZ0v2OG1ggyztZvdmgxb2FwztC9Z?=
 =?us-ascii?Q?miF3OFbv1AkVpghmNSNhbuwAU4fotkbcGRI/eBBkxydQ+/2Bl9QZ4XbGpEf6?=
 =?us-ascii?Q?D2jfnQMeWL6yBles/dAM9TtVGt84shLNldbKnguFCuAmXSKdwO+Z0wc+vDHW?=
 =?us-ascii?Q?FU7vRVu/K3wphROzD+9FTanFZl5DU+HdAFfmiwypNJuD+RUdfmJTPNW7d/eu?=
 =?us-ascii?Q?Mqt+oWcWGf2Y/nCBIcE37/TCZqgpv3tJdaz9H40v1xEQtLvcV0U140MteeSQ?=
 =?us-ascii?Q?UWA47ctFojP6vCsuQUJgCtr4vTbOzZfeQB5VZuyOlo3MnEXwUpYZfbOKhZol?=
 =?us-ascii?Q?YbZkCl/TchU62leauW0HO2YQioJjIRZcs73vp21qpgrTdZClK0mxNZ2HRpRA?=
 =?us-ascii?Q?h/RCq/wKipg7sM4mgy9ZK+hOGxBWgiOgOIefWUwBoGdOVl6wyjPUl81sOBXt?=
 =?us-ascii?Q?zfHqW3Z8smc14bK7rE3dwZ210L4PmcBK5IHH96fEWNXnZ4xS62sVkcQevipE?=
 =?us-ascii?Q?Ew97aSQL7QgvTxkjOy+2ZprwsIFHDO+gKb57H+anWnjqR0nYZqxYoCMARNN5?=
 =?us-ascii?Q?wQOC9oAD8BhWtmZYtUnebsfou0WtMNkTlyhaVs8iJI18hynId2d/kgrIefOB?=
 =?us-ascii?Q?OCNrwsmvykBMcjJTDxX4zkA9S8P8GZistrX4gCWWdxne+nM6F6/pyyVJ+piF?=
 =?us-ascii?Q?CWoIcwMy4e1DlOpCLak1+KAOnnLN5lpUUUJHQc1Sa/Dc5jwKLszzEJDA2ZLO?=
 =?us-ascii?Q?ATQmc6MxT6fVPaME6cpXNqPNDvQJ/dCck+RDBoLlZGrrHTTG8+EH5wSzFRpx?=
 =?us-ascii?Q?uy+yn0N2IVVvidEQGZykB+SP09CwROU1c16yGEN6HScx2hQXl+P+T+zmsepF?=
 =?us-ascii?Q?UBYvhNBHy1eVWjDVoJwyBDWCQB1JRww+kQNq9n5Ap7vSEVDXAxVvc3Zbzn8G?=
 =?us-ascii?Q?d7GANPiLgqRsFuBpiF/rlWEDhaLmNODtly5vZ2X1xfJh2GTZnIPBNG6nZUoH?=
 =?us-ascii?Q?MDjcU1+685HZx0dTPNjfKDCQM0p8Qg6WgURFVXwg3jXgPOsSCpmsnTi/RJc9?=
 =?us-ascii?Q?SMNB4tU7IVdTPB2fJ38y/mme2t1LaXdfC9umZMn4e21NK4FldVGYiTqzkcIO?=
 =?us-ascii?Q?Is3F9+gG4XfVvvCQf0iUPbRGfvv3v2mQk4KxezmmRVIX+H/a/CYO+s8kF7AL?=
 =?us-ascii?Q?Vg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: af926dba-ade9-4921-6ad2-08db530a63b9
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2023 17:00:29.4095 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MpDAuf1FrZ6t7Q+hUMpYTTqgL+kq7H5InrtFDVYZy05B+iWNDk6bO37/Pggx+oovkz0gOCIY9pXC/VJu6RjB4h1FWeiK6ZtYXJ8cNYxl/hI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7542
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
Cc: lucas.demarchi@intel.com, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, May 12, 2023 at 09:31:27AM -0700, Matt Atwood wrote:
> On Fri, May 12, 2023 at 09:20:02AM -0700, Matt Roper wrote:
> > On Thu, May 11, 2023 at 05:07:46PM -0700, Lucas De Marchi wrote:
> > > On Wed, May 10, 2023 at 08:46:59PM -0700, Matt Roper wrote:
> > > > Rather than a backpointer to the xe_device, a GT should have a
> > > > backpointer to its tile (which can then be used to lookup the device if
> > > > necessary).
> > > > 
> > > > The gt_to_xe() helper macro (which moves from xe_gt.h to xe_gt_types.h)
> > > > can and should still be used to jump directly from an xe_gt to
> > > > xe_device.
> > > > 
> > > > Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> > > > ---
> > > > drivers/gpu/drm/xe/xe_bb.c                  |  2 +-
> > > > drivers/gpu/drm/xe/xe_gt.h                  |  5 -----
> > > > drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c |  4 ++--
> > > > drivers/gpu/drm/xe/xe_gt_types.h            | 14 ++++++++++++--
> > > > drivers/gpu/drm/xe/xe_mocs.c                | 14 +++++++-------
> > > > drivers/gpu/drm/xe/xe_pci.c                 | 11 +++++++----
> > > > drivers/gpu/drm/xe/xe_pt.c                  |  2 +-
> > > > 7 files changed, 30 insertions(+), 22 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/xe_bb.c b/drivers/gpu/drm/xe/xe_bb.c
> > > > index 3deb2d55f421..bf7c94b769d7 100644
> > > > --- a/drivers/gpu/drm/xe/xe_bb.c
> > > > +++ b/drivers/gpu/drm/xe/xe_bb.c
> > > > @@ -16,7 +16,7 @@
> > > > 
> > > > static int bb_prefetch(struct xe_gt *gt)
> > > > {
> > > > -	struct xe_device *xe = gt->xe;
> > > > +	struct xe_device *xe = gt_to_xe(gt);
> > > > 
> > > > 	if (GRAPHICS_VERx100(xe) >= 1250 && !xe_gt_is_media_type(gt))
> > > > 		/*
> > > > diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
> > > > index 086369f7ee6d..f4e98f499b36 100644
> > > > --- a/drivers/gpu/drm/xe/xe_gt.h
> > > > +++ b/drivers/gpu/drm/xe/xe_gt.h
> > > > @@ -49,11 +49,6 @@ static inline bool xe_gt_is_media_type(struct xe_gt *gt)
> > > > 	return gt->info.type == XE_GT_TYPE_MEDIA;
> > > > }
> > > > 
> > > > -#define gt_to_xe(gt__)								\
> > > > -	_Generic(gt__,								\
> > > > -		 const struct xe_gt *: (const struct xe_device *)((gt__)->xe),	\
> > > > -		 struct xe_gt *: (gt__)->xe)
> > > > -
> > > > static inline bool xe_gt_is_usm_hwe(struct xe_gt *gt, struct xe_hw_engine *hwe)
> > > > {
> > > > 	struct xe_device *xe = gt_to_xe(gt);
> > > > diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> > > > index c815a42e2cdb..c9e8825c02aa 100644
> > > > --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> > > > +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> > > > @@ -322,8 +322,8 @@ int xe_guc_tlb_invalidation_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
> > > > 		TLB_INVALIDATION_SEQNO_MAX;
> > > > 	if (!expected_seqno)
> > > > 		expected_seqno = 1;
> > > > -	if (drm_WARN_ON(&gt->xe->drm, expected_seqno != msg[0])) {
> > > > -		drm_err(&gt->xe->drm, "TLB expected_seqno(%d) != msg(%u)\n",
> > > > +	if (drm_WARN_ON(&gt_to_xe(gt)->drm, expected_seqno != msg[0])) {
> > > > +		drm_err(&gt_to_xe(gt)->drm, "TLB expected_seqno(%d) != msg(%u)\n",
> > > > 			expected_seqno, msg[0]);
> > > > 	}
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> > > > index e0ed4508269b..c4376d50786b 100644
> > > > --- a/drivers/gpu/drm/xe/xe_gt_types.h
> > > > +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> > > > @@ -76,6 +76,16 @@ enum xe_steering_type {
> > > > 	NUM_STEERING_TYPES
> > > > };
> > > > 
> > > > +#define gt_to_tile(gt__)							\
> > > > +	_Generic(gt__,								\
> > > > +		 const struct xe_gt *: (const struct xe_tile *)((gt__)->tile),	\
> > > > +		 struct xe_gt *: (gt__)->tile)
> > > > +
> > > > +#define gt_to_xe(gt__)										\
> > > > +	_Generic(gt__,										\
> > > > +		 const struct xe_gt *: (const struct xe_device *)(gt_to_tile(gt__)->xe),	\
> > > > +		 struct xe_gt *: gt_to_tile(gt__)->xe)
> > > > +
> > > > /**
> > > >  * struct xe_gt - A "Graphics Technology" unit of the GPU
> > > >  *
> > > > @@ -90,8 +100,8 @@ enum xe_steering_type {
> > > >  * within a tile.
> > > >  */
> > > > struct xe_gt {
> > > > -	/** @xe: backpointer to XE device */
> > > > -	struct xe_device *xe;
> > > > +	/** @tile: Backpointer to GT's tile */
> > > > +	struct xe_tile *tile;
> > > > 
> > > > 	/** @info: GT info */
> > > > 	struct {
> > > > diff --git a/drivers/gpu/drm/xe/xe_mocs.c b/drivers/gpu/drm/xe/xe_mocs.c
> > > > index 817afd301d52..d57fbf16a3ef 100644
> > > > --- a/drivers/gpu/drm/xe/xe_mocs.c
> > > > +++ b/drivers/gpu/drm/xe/xe_mocs.c
> > > > @@ -471,7 +471,7 @@ static void __init_mocs_table(struct xe_gt *gt,
> > > > 	unsigned int i;
> > > > 	u32 mocs;
> > > > 
> > > > -	mocs_dbg(&gt->xe->drm, "entries:%d\n", info->n_entries);
> > > > +	mocs_dbg(&gt_to_xe(gt)->drm, "entries:%d\n", info->n_entries);
> > > > 	drm_WARN_ONCE(&xe->drm, !info->unused_entries_index,
> > > > 		      "Unused entries index should have been defined\n");
> > > > 	for (i = 0;
> > > > @@ -479,7 +479,7 @@ static void __init_mocs_table(struct xe_gt *gt,
> > > > 	     i++) {
> > > > 		struct xe_reg reg = XE_REG(addr + i * 4);
> > > > 
> > > > -		mocs_dbg(&gt->xe->drm, "%d 0x%x 0x%x\n", i, reg.addr, mocs);
> > > > +		mocs_dbg(&gt_to_xe(gt)->drm, "%d 0x%x 0x%x\n", i, reg.addr, mocs);
> > > > 		xe_mmio_write32(gt, reg, mocs);
> > > > 	}
> > > > }
> > > > @@ -508,13 +508,13 @@ static void init_l3cc_table(struct xe_gt *gt,
> > > > 	unsigned int i;
> > > > 	u32 l3cc;
> > > > 
> > > > -	mocs_dbg(&gt->xe->drm, "entries:%d\n", info->n_entries);
> > > > +	mocs_dbg(&gt_to_xe(gt)->drm, "entries:%d\n", info->n_entries);
> > > > 	for (i = 0;
> > > > 	     i < (info->n_entries + 1) / 2 ?
> > > > 	     (l3cc = l3cc_combine(get_entry_l3cc(info, 2 * i),
> > > > 				  get_entry_l3cc(info, 2 * i + 1))), 1 : 0;
> > > > 	     i++) {
> > > > -		mocs_dbg(&gt->xe->drm, "%d 0x%x 0x%x\n", i, LNCFCMOCS(i).addr,
> > > > +		mocs_dbg(&gt_to_xe(gt)->drm, "%d 0x%x 0x%x\n", i, LNCFCMOCS(i).addr,
> > > > 			 l3cc);
> > > > 		xe_mmio_write32(gt, LNCFCMOCS(i), l3cc);
> > > > 	}
> > > > @@ -524,7 +524,7 @@ void xe_mocs_init_early(struct xe_gt *gt)
> > > > {
> > > > 	struct xe_mocs_info table;
> > > > 
> > > > -	get_mocs_settings(gt->xe, &table);
> > > > +	get_mocs_settings(gt_to_xe(gt), &table);
> > > > 	gt->mocs.uc_index = table.uc_index;
> > > > 	gt->mocs.wb_index = table.wb_index;
> > > > }
> > > > @@ -537,8 +537,8 @@ void xe_mocs_init(struct xe_gt *gt)
> > > > 	/*
> > > > 	 * LLC and eDRAM control values are not applicable to dgfx
> > > > 	 */
> > > > -	flags = get_mocs_settings(gt->xe, &table);
> > > > -	mocs_dbg(&gt->xe->drm, "flag:0x%x\n", flags);
> > > > +	flags = get_mocs_settings(gt_to_xe(gt), &table);
> > > > +	mocs_dbg(&gt_to_xe(gt)->drm, "flag:0x%x\n", flags);
> > > > 
> > > > 	if (flags & HAS_GLOBAL_MOCS)
> > > > 		__init_mocs_table(gt, &table, GLOBAL_MOCS(0).addr);
> > > > diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> > > > index e79b16d8bf7f..87c328106aca 100644
> > > > --- a/drivers/gpu/drm/xe/xe_pci.c
> > > > +++ b/drivers/gpu/drm/xe/xe_pci.c
> > > > @@ -471,6 +471,7 @@ static int xe_info_init(struct xe_device *xe,
> > > > {
> > > > 	const struct xe_graphics_desc *graphics_desc = NULL;
> > > > 	const struct xe_media_desc *media_desc = NULL;
> > > > +	struct xe_tile *tile;
> > > > 	struct xe_gt *gt;
> > > > 	u8 id;
> > > > 
> > > > @@ -525,13 +526,15 @@ static int xe_info_init(struct xe_device *xe,
> > > > 	xe->info.step = xe_step_get(xe);
> > > > 
> > > > 	for (id = 0; id < xe->info.tile_count; ++id) {
> > > > -		xe->tiles[id].xe = xe;
> > > > -		xe->tiles[id].id = id;
> > > > +		tile = &xe->tiles[id];
> > > > +		tile->xe = xe;
> > > > +		tile->id = id;
> > > > 
> > > > -		gt = &xe->tiles[id].primary_gt;
> > > > +		gt = &tile->primary_gt;
> > > 
> > > these seem to have been squash in the wrong patch, changing the style
> > > from using xe->tiles[i].* to declaring a local var. Maybe squash it in
> > > the previous one to avoid the back and forth here?
> > > 
> > > otherwise,
> > > 
> > > 
> > > Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
> > > 
> > > > 		gt->info.id = id;
> > > > -		gt->xe = xe;
> > > > +		gt->tile = tile;
> > > > 
> > > > +		gt->info.id = id;
> > > 
> > > the gt than has the id of the tile? Because right now there can only be
> > > primary_gt? Looks odd, but it's a consequence of removing the only
> > > platform with 1 tile and multiple gts.
> > 
> > Yeah, deciding how we want to number GTs is a bit of an open question.
> > Right now at the end of this series, the numbering is
> > 
> >  * PVC:  0 = root tile primary, 1 = remote tile primary
> >  * MTL:  0 = root tile primary, 1 = root tile media
> >  * everything else:  only has GT0
> > 
> > Some day we may have a platform with multiple tiles and separate
> > graphics/media GTs within each tile.  In that case would all graphics
> > GTs get even numbers and all media GTs get odd?  Or would all primary
> > GTs get gt_id = tile_id and all media GTs get gt_id = tile_id +
> > tile_count?
> > 
> > The bigger open question is whether uapi should still expose GTs (like
> > it does today) or whether it should be converted to just expose tiles
> > and keep the graphics vs media separation an internal implementation
> > detail.  If uapi changes to only expose tiles, then we probably don't
> > even need IDs for the GTs...
> I recall doing the uapi changes for topology that UMD seemed really
> bound to the idea of interacting with "GTs". Likely only exposing tiles
> would cause a need for alot of changes in implementation and methodolgy in the UMD. 
> MattA

On i915, neither tiles nor GTs are exposed to userspace.  Exposing GTs
as a first-class concepts is a large design change on the Xe driver.

I think there's even been talk about splitting this out at the /dev/dri
level, with separate render nodes being exposed per tile.  So there may
be even larger design changes coming before we settle on exactly how Xe
should work.


Matt

> > 
> > 
> > Matt
> > 
> > > 
> > > Lucas De Marchi
> > > 
> > > > 		if (id == 0) {
> > > > 			gt->info.type = XE_GT_TYPE_MAIN;
> > > > 			gt->info.vram_id = id;
> > > > diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> > > > index f15282996c3b..61126cefe0b5 100644
> > > > --- a/drivers/gpu/drm/xe/xe_pt.c
> > > > +++ b/drivers/gpu/drm/xe/xe_pt.c
> > > > @@ -695,7 +695,7 @@ xe_pt_stage_bind_entry(struct xe_ptw *parent, pgoff_t offset,
> > > > 		 * TODO: Suballocate the pt bo to avoid wasting a lot of
> > > > 		 * memory.
> > > > 		 */
> > > > -		if (GRAPHICS_VERx100(xe_walk->gt->xe) >= 1250 && level == 1 &&
> > > > +		if (GRAPHICS_VERx100(gt_to_xe(xe_walk->gt)) >= 1250 && level == 1 &&
> > > > 		    covers && xe_pt_scan_64K(addr, next, xe_walk)) {
> > > > 			walk->shifts = xe_compact_pt_shifts;
> > > > 			flags |= XE_PDE_64K;
> > > > -- 
> > > > 2.40.0
> > > > 
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
