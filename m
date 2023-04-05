Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB490C76188
	for <intel-xe@archiver.kernel.org>; Wed,  5 Apr 2023 13:46:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5373F10E966;
	Wed,  5 Apr 2023 13:46:14 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8975610E966
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Apr 2023 13:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680702373; x=1712238373;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=pHXZvJ7QYmEHjKuUazK3Qoeux4CnIt4+HDWig6+RS9o=;
 b=RihFaN4SJhnp+O8X5wpk7+vmuwy2Dez0PQjOrODI+81K990hpSEswiwd
 C+k9VEZduepP69guB0dhvYVRbitd5d8XNGhlppkioYeX3N8AzwAHD2Ax6
 RCyXhZtGwurUxd+0lr900EztTvFuPRYWUxHcIQNEqzfBNSWyg3Htlo+Fc
 Id9MpBlzHAC2FDGViGIdDDpExQT/yU3DmFDpRkX7SbGTDN3p9r14poYK+
 1ELEHCvEnBmRclNg6UHmZLo686/k07XVUb+iZHAJVGEhZvF/Ap5qSnbCI
 DzMnhvJNXGqDVdnaS5O2prHhEJOebKmfhymj7JKXSuXtziO3z7jjiFVhL w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="428739408"
X-IronPort-AV: E=Sophos;i="5.98,319,1673942400"; d="scan'208";a="428739408"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2023 06:46:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="680295711"
X-IronPort-AV: E=Sophos;i="5.98,319,1673942400"; d="scan'208";a="680295711"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga007.jf.intel.com with ESMTP; 05 Apr 2023 06:46:12 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 5 Apr 2023 06:46:11 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Wed, 5 Apr 2023 06:46:11 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.44) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Wed, 5 Apr 2023 06:46:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YjUx9gdcklL83P+yblYXEBHYgFwiVKRD1ffawVTh5qGD7QHnHbHEr2XPIwGvXkgOPa6J/2tUsCDtg0aZqSeWe8x86et6Cr3mKOnvy/7XbNXdv/gEAMItZ4XFRcs2wv5iOWK/OzzDEEPPJLtP7VW6js/FD8bsECD238Xvj6HhTniAMJ1RFMlM7eYUgu5Oshl0pcBxubKbf3kwOat2XmY51tXbuHQYT2+2ICjPrEJESgGr34iltUHnbk3v1Bzju+4YzcI6gKG4irI6FLHWEa/iqbXFrBrsL3UOFirB/S9vd7oNlOpt8zUDTKrkFNrcyJccAEeOIFqcWsdmi1p47h/NoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cQ0WhayeDYuYSMFu9giI2FGfbGm9k44bquuxCVw0cmU=;
 b=mtVx54aIUBvFKO0jWBXuu3efVOWnt/5JaDVVqJhyoEgn50ExLi37Viqk2E9WD9HvIKqQWV7G1fzOXsgxFe8/lYBEEbPWVJ8xz+Tgbs5cssaeV8lvPOdfCYWcFw2zk/jIdMA+nqcR1p7BdjjqIgqtOwbp+vfccO+vu82P6oEuKDnaU0tPIqTPj+NXmnlWhMyq9xoc91ma7Ygc/B8XzvScNuwbj7TibxGwTImyHZ/KvdXKDE7UqIGAo6moeYOwZ8mojvqNFe2nHPZmjJJBdLUnAe/OpEXJMAoVW4ErxWG5UG6l535RaDcMZpWJqJXGOxAbTc+Yr3tZgnTaRWrJGXl/YA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by BL1PR11MB5413.namprd11.prod.outlook.com (2603:10b6:208:30b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.35; Wed, 5 Apr
 2023 13:46:08 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e%9]) with mapi id 15.20.6254.033; Wed, 5 Apr 2023
 13:46:08 +0000
Date: Wed, 5 Apr 2023 13:46:02 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.william.auld@gmail.com>
Message-ID: <ZC17mp4NMXdPVUHt@DUT025-TGLU.fm.intel.com>
References: <20230405024036.3969996-1-matthew.brost@intel.com>
 <20230405024036.3969996-2-matthew.brost@intel.com>
 <CAM0jSHPX3FCEo9uF1A_exQ8nptj1a93A_YeMTXLnh-SppQADRQ@mail.gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAM0jSHPX3FCEo9uF1A_exQ8nptj1a93A_YeMTXLnh-SppQADRQ@mail.gmail.com>
X-ClientProxiedBy: BYAPR07CA0007.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::20) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|BL1PR11MB5413:EE_
X-MS-Office365-Filtering-Correlation-Id: b2ec8d09-b9d5-4213-b4c3-08db35dc1c44
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1Qh3MfqF1t9HTlsBkUkjW6V4vk6CmHhxmB+wcZ6bb4hM0JDk6AifCFzs+MhQZWoTF5w/JvJuzGW1PDdNuI+V06bu3nnizlNf/dWhptNToayv7/d8kE8Xq/3mDNVdA8bZeKRV5mQCJ7jDhnaCtcHTZdqAMaL0y8QltEmVepE2tBIaIe0XQt0Ir7JXSVN0vODqjDuRC0O6EM3gj091l7GgsMkqC09Sb6xj8aa9ckvtUk1rzsd6G+sspw9WsV19dWuO75w1YOAG/hQwGegWrISY/l3EI1P1+DYKrbHS2zOjhaLQeagQ3zk3Gqobhi9CFdbZ9LpX+JVA/WquKTVZbSgGM81Eenp2KrFVZFFSLSzlB+woR3NbhRb4PE+HpNCGOmhdvWo/sNzeWTFIa91cpVHYtNqMw61I5/+DviiLEVo7YYtFKn0P3EH2uaINQGf0K3e6Og0oq6bpQYPsKF70u+2j6+LSBeu2l3xyeF/wQNrbBgCL2xrz0XiGRIb/SWZVaK7mr8gEyCap2Ik48LKa7Aw848nGk3nKkrjshrZSJxTpp2gUcc3acKPxxTLljZK4MmxU
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(396003)(376002)(136003)(346002)(366004)(451199021)(38100700002)(4326008)(5660300002)(2906002)(44832011)(66946007)(66556008)(8676002)(66476007)(6916009)(41300700001)(8936002)(82960400001)(86362001)(6486002)(83380400001)(6666004)(186003)(6512007)(26005)(6506007)(966005)(478600001)(316002)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OKs7qGTDXibjLKjg2o7l2IeP0JsRQSbaUnje5ZZpfcJmlUDTSwRlq52y3Y/c?=
 =?us-ascii?Q?gcZPkeXv6bFPLlN9mYHXYVxLKnECStO45Zbl4Wd6CkHaSWoKY3vYyAW7cLyg?=
 =?us-ascii?Q?7moBJ97xhiMuxvIY8FmTbwncAqAkGYZFDEooSO8Q8Zh/aYIwuVSDBBmB5pZK?=
 =?us-ascii?Q?sVcC3a2toYoP148TSdQkeC2ysKEfQuSG0u2ilkIbOitNVYk4i8sISoFH225Q?=
 =?us-ascii?Q?vbnqGwZsCkyI/PZAm6qdogQd7S7gcwePKDa9j/h+gQL60ma4ME8LqI95z42P?=
 =?us-ascii?Q?75FHyFmc4mx8Skn8el2UU19sWHzPgYpdSaK0gZxTf2ncY0Nths3DUKPzB1rK?=
 =?us-ascii?Q?Bo29BSRZEPk54joYn1veEhypA2MPuFqdMqrn+M15t447YZrb1GuigQZBrizh?=
 =?us-ascii?Q?s9INPqHMyr0z0QG8UTB4/8YAwHiN93nDu+Knt2F/sTmoiZ9M2/EBdp1r+OTO?=
 =?us-ascii?Q?T/vUEJBkfa9CuarS/sIYq+l4uPIbJyIg7yFbK2CFwSLjMhx7DfhgiLiKBFGQ?=
 =?us-ascii?Q?YBdNNKnuK6OoX1ITqMcb9dLRfyfBJF6ML17TQQWzaI3fCp6wDCybocKMDz8H?=
 =?us-ascii?Q?toDDiClNNwM/N5GwJ2bNKkf0Qyo7Qas/e8tN1+IAvzd8cg9MbHqw7ZPUMUwo?=
 =?us-ascii?Q?t9OCCxrGp8jKhP9awEce7/QxUNXYIw+OkSLzz+eyn5zMxMdE0UhIwUpA0MZj?=
 =?us-ascii?Q?5gYId4u/Unjnoa9oNzMrC2qJfDPq/NoF+OX6mmbMtlx82A1iDEFNYKpKRXts?=
 =?us-ascii?Q?BXgdUpaIhcK0CBf7mm8+Y43xFmMS2vKMqqxOs/zPwSNCD/3k4q6wTkqzkmiM?=
 =?us-ascii?Q?3aJnsO5XJVtmaOaoEJ2vgqjyJRJrp2RsJVkaF+bDGIiTMDJOOfNVdx1Ve/YD?=
 =?us-ascii?Q?zkOGEjwJZRIBRpKoq4qDEp0ZoBGmQ5hjzmCFffgTKOo5nZpdsimuyNqy/fsp?=
 =?us-ascii?Q?XD0bALbqg5Rnv7KnBCdylbmMYQ0/HRC2iclng4s0mKCzbfsWthPRybbqGMxa?=
 =?us-ascii?Q?diknP26Ztm2voxIAKMeiQOpiWLlm6Ryii2ofhQMccUyQAW5RtqhzBQEHK4Db?=
 =?us-ascii?Q?vsu6boxBi3D/MtluBlD5qqBGej2VJjoZnvC5BMF2IXmHWwTpbaTJOfIaAb9z?=
 =?us-ascii?Q?qcCtN1tl/YTHZy1ToDa1ZL9wJJKh4rIp2lXH2DKYv3McYBpZZOad6hn145XF?=
 =?us-ascii?Q?v/Rl/M7u+8HMyuRBZrBqkvZeVdSXG4hotI9VBvLHBzQJ8Dj8dl+7U5GBdX+1?=
 =?us-ascii?Q?DAXXNoY9+bWEIXKxkLx9XkIK/8/d6663Az8HGxJZS26Wtp2ljy7QjZZckXYA?=
 =?us-ascii?Q?E41oIH2PNkTlVvcItjI8TCwdZZRedG4IIjL7OCdmtxcI5rLy5/Ej5FCfkNZg?=
 =?us-ascii?Q?CDmwxlnY83HyvHxM6o1g4RcQ/9o+3H+UKA2zUn7NtUS6PVBP0FMlkTmWTpL5?=
 =?us-ascii?Q?i7+4CkXjZHOlz0t9vcjx6WG54OTk/uLvhvvZI9trtgvMe56+m/N94/+zYtrA?=
 =?us-ascii?Q?giwSO/wigs46tzvtD48I+mmnRw317xDnTRnEQEZI0ddpwOzdLufEcP1E8gUA?=
 =?us-ascii?Q?RJDZajCJaUe4RJHKeVaXsqeohypwB8W56OlWh4VWdTD6ryR0HEhqLNH34z4n?=
 =?us-ascii?Q?aA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b2ec8d09-b9d5-4213-b4c3-08db35dc1c44
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2023 13:46:08.7811 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A/wk7Dvc1Sy8j623GvCu+o1VJqcJPk3UxzPRRIvJvqnAN0FPMzGPHdd9ZO8px/g/v0OuUUrYiCQsaGvucyy45g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5413
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 1/2] drm/xe: Always invalidate GGTT on map
 during driver load
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

On Wed, Apr 05, 2023 at 01:50:34PM +0100, Matthew Auld wrote:
> On Wed, 5 Apr 2023 at 03:40, Matthew Brost <matthew.brost@intel.com> wrote:
> >
> > Coalescing GGTT invalidations should work but it creating an issue where
> > the driver sporadically fails to load. For now just disable coalescing
> > during load.
> >
> > Should fix:
> > https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/232
> >
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> 
> Any idea why we don't currently add any 4K padding for
> insert_special_node() users? Don't we need padding for all GGTT
> allocations due to overfetch + coalescing?
> 

Good catch, I wonder if that is causing problems as I swear I thoroughly
tested this before this was merged. Let me look into this a bit more
today.

Matt

> > ---
> >  drivers/gpu/drm/xe/xe_ggtt.c | 9 +++++++--
> >  1 file changed, 7 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> > index a430d1568890..55d0c2554f7b 100644
> > --- a/drivers/gpu/drm/xe/xe_ggtt.c
> > +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> > @@ -263,6 +263,7 @@ int xe_ggtt_insert_special_node(struct xe_ggtt *ggtt, struct drm_mm_node *node,
> >
> >  void xe_ggtt_map_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
> >  {
> > +       struct xe_gt *gt = ggtt->gt;
> >         u64 start = bo->ggtt_node.start;
> >         u64 offset, pte;
> >
> > @@ -278,8 +279,12 @@ void xe_ggtt_map_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
> >                 xe_ggtt_set_pte(ggtt, start + bo->size, pte);
> >         }
> >
> > -       if (ggtt->invalidate) {
> > -               xe_ggtt_invalidate(ggtt->gt);
> > +       /*
> > +        * XXX: Unsure why without invalidation on every map during driver load
> > +        * we can fail the driver load.
> > +        */
> > +       if (ggtt->invalidate || !gt->uc.guc.submission_state.enabled) {
> > +               xe_ggtt_invalidate(gt);
> >                 ggtt->invalidate = false;
> >         }
> >  }
> > --
> > 2.34.1
> >
