Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68F8AC7EE2C
	for <intel-xe@archiver.kernel.org>; Mon,  8 May 2023 21:35:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C2B310E308;
	Mon,  8 May 2023 21:35:06 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06CD110E308
 for <intel-xe@lists.freedesktop.org>; Mon,  8 May 2023 21:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683581704; x=1715117704;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=cWox4VHROEnXBxDE7s30VloBRhgnPTFZ4BbxLdBbKyo=;
 b=KI3sYzUhdzAqbyCYWvLa8qgLnyuJDd7HZ43lxEEhznm6YerAEQYBXODs
 DxLag1+Z2zcXAS9FbSMViVYwQoDXObL7PrSvbOxEzJx7mCKdMFXAhN1FL
 nZsN3sNH71kgH6AczHXBryZbGm5j3MAw0FHE/zQpyotRQr6lbisf/Sowb
 4E4Ez54lH6MmhUFAhrQlahWStDeyCoNsaLZZPeP0Owr/jQoxxhqHFHjYD
 /pX2RWmC2YNLReS4FaWKO9VL+NbfY5f7jOJFmheQHZ29Fk5iUn3wilyUe
 MNlDOpeYGqpF3dfGWCgCPl0X4aNgwg+BAhelxz3la138dv/+Y5vj/2Fu4 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="377857302"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; d="scan'208";a="377857302"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2023 14:35:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="788270020"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; d="scan'208";a="788270020"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by FMSMGA003.fm.intel.com with ESMTP; 08 May 2023 14:35:03 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 8 May 2023 14:35:02 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 8 May 2023 14:35:02 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 8 May 2023 14:35:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FhRecVHppQR5Au3DI/uOvDWf7TOwm19JEccld2KWxkq+mUe/6gu12ujkKvBgonfuS1CZj8ebdM06jClHMladjLuiG5prtfZmfs+tzba3r+QfsQ4xfYMaRfG1g54SE5p4iwqz56JI2IrF6Sq49NePmpxkZ+xkk22KjJPBTXP2akgOxmnE8t9GZpI3fClsdZ6JmsTFMUokhGdX1xABane+KkU8znjCtIUtn7rrPQZ0WhHoaUByX+/ke03Gwdlvwyt6cuwpDe5JNjG46fjuMZvEWXGeYNKxmXnM5tUl46UySWhvMXom2CUPs3/en/UibJrc6L86ijblSBy7uGcVyIfwOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kyyl4W/sxK2OdEUE/fMrecZxZDQD3RGlaZVnj44KLUA=;
 b=BPR6e+Ew2z4OTZs0MCTGWIXDoH1xly+ln+igFzheCYRN1JFWtVsFr0ndSIvFO4MgjEL8UP/KrblUmP4ZtLLlr9i4m8R360N+oeCb6GNoOraW6P+WBmJChSAnQJeVRWxlAMeOL+YcyqoIb8TOdOGadRJI/TDtdMyFg5UI3v7Yzd4by3Fsb12Z8dtfUEWnTTAE0n3QMZNGwZv+t0QmCKILEI8k9MvkvlUvQ8HsFamI6ECSOy2b1xfiMxP/UCAMCK/W98BfKXZhW0Jg1lWuT6e+WBIK4bIW+30ySHj09Fk4sZZRtbZk2seTT4ss12UZiJSHg5enKuRCNqzswKmXB/c9aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CY5PR11MB6415.namprd11.prod.outlook.com (2603:10b6:930:35::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.31; Mon, 8 May
 2023 21:35:01 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004%6]) with mapi id 15.20.6363.032; Mon, 8 May 2023
 21:35:00 +0000
Date: Mon, 8 May 2023 17:34:56 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Message-ID: <ZFlrAJI44mbZcq7X@intel.com>
References: <20230502001727.3211096-1-matthew.brost@intel.com>
 <20230502001727.3211096-8-matthew.brost@intel.com>
 <ZFVNqF+iqsN059E3@rdvivi-mobl4>
 <ZFhLejusrFMU3dIk@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZFhLejusrFMU3dIk@DUT025-TGLU.fm.intel.com>
X-ClientProxiedBy: SJ0PR13CA0167.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::22) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CY5PR11MB6415:EE_
X-MS-Office365-Filtering-Correlation-Id: b06099d2-4ef6-4767-220f-08db500c13b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QXKdPjeSGxCu/Qaq+I6OpRducDvbOMIsJ+Enn2GgTwZtEFdLvi6adEh3I7mHrokEESE5LRi2fHu91nND0gpzAB2IKghoKmalmzytP/EY2bxleRusTxMNIjkMqXYfftySQvM/+tSfYiSztsD34VhPW8WcG/fMhZgan1EYGasflwQ5RPIMXVg/U7lPAsOPwhRKfxlm+P4novOMKzXcG7PZ5jY/HQboLkh5IlR16XCN3YeqJW0IMT9ZSm15wZit4a6OAVwIKuBYzad1i7VV3jyEPWJlzSsgPMB5PqD1XqNmN9aRd8HBBL3ClBSk7O1Pn3VdgMc1VDXB4XdPUhlc9RKQy6PzQcqTEcLr3n9+WFpyTZsvVCpcbn1P9WHKVUZ6aWYT2pOqR3aW+gqODGAeLtx8PgyYXa3ntA040m8nGqPSpFjf1wntDPItp1cbB+ICfpqv/X5IvLbkqIfUjnpunwIqBXJKCfAWIKpQFdqHg/TfKgf/pWbPsqiiZEOVHFKTw6Yt1lwCIfcXxEX/uMzAZpxvugih10r5ruDFykaySHwht93s7jcMegpJZVzNvKi5L7S6
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(39860400002)(136003)(366004)(346002)(396003)(451199021)(478600001)(86362001)(54906003)(6666004)(36756003)(66556008)(37006003)(4326008)(6636002)(316002)(66476007)(6486002)(82960400001)(41300700001)(44832011)(8936002)(6862004)(5660300002)(8676002)(186003)(2906002)(2616005)(38100700002)(6506007)(26005)(107886003)(6512007)(83380400001)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4NE+yE/jCg7kg+CvZhftvOJzEY7tZKlSI/mN1VqyMLz5OmGH3sM5cswW0iE0?=
 =?us-ascii?Q?DnIH0Wen9Kbi23WhO/UeG32m0mg92Vi3tkKksmZWmj3B8QSKKXczdJ1wxT9j?=
 =?us-ascii?Q?k2JzU5jw3jh6Z77rgS7D9qIWdj9h477x4b5s9Ol7P4bRkWCfrDa9y2NJRfO1?=
 =?us-ascii?Q?fIBUuKzQ7HdQ4BqRI445XLjoxJa+uBWZEnCqAX7TH9oziaDWs8R9XBRDpjEO?=
 =?us-ascii?Q?G/KC3OxYJuT01ReUYDz2hFyojHFFrWR1KnQkA8dINDoUQaexFRCLTVsktQug?=
 =?us-ascii?Q?55mdySD+hMGaCF/3suws1OyhgBLLF36D6SlCGNLmbrHzCap96DOSUcor4iPK?=
 =?us-ascii?Q?tYA2q5zZSCeTwsdOnMelBvokGqWA2V4bXBZ0yeAJxtK5Cf2s7DqJa/EFfA0V?=
 =?us-ascii?Q?2V1rdMaf+C3eaygPpELld/WE7JmeEKUKZq3BXlPoYoT52K4l/Tb2Vvtu87YE?=
 =?us-ascii?Q?857aZAx9998bYwpK/6Ysp1Cxkx+aMI4gT6Y9tl2LDToBOvziBTMT/6q2vITf?=
 =?us-ascii?Q?cPjvBP90xjNd8nUv3giU3cEVp2Z+ow3yn4ZF28GfVzp9OyXfEz5MlulGEXAc?=
 =?us-ascii?Q?XELEUoO3eQLCMVpZmVVx/QXUu3Cv2IaA8pNCSkhgTJKZzMme3+9xPNF5JXlx?=
 =?us-ascii?Q?chreQSVQ+GOLxl24a2pM0CjBSfuXtMVSXAhcfqColTCHIzn8x37bwMro2z+Z?=
 =?us-ascii?Q?vnA9G4o9K/wU6mEWoVgFyI/3FUtfXKhgu4eXvFBirfEHrkkyW8nC/VhU144m?=
 =?us-ascii?Q?rijZsmRxhanjGwXPfUEi8Ps+qvtO+8gxLrquCg1TINgHOUqWTXZGZs//vPyg?=
 =?us-ascii?Q?JvdIJ9hpxwgTJ4ceUZqPHWarwJigIynuqlXLzkrXl6lOMozPtK0VAdLrFjeB?=
 =?us-ascii?Q?NwUUQrOQJ3FC2CTDHXNkiGla4CPwmvzrjq3uNkdug2IyYUuRGlQCwiC9NaQ2?=
 =?us-ascii?Q?rA7b9mRGW4GBPUgdP/QgPbt+RR55C2u6Ci4RJiR6heCiVJqPxn5izPfFeHvS?=
 =?us-ascii?Q?9CwvPo0DWCbISvnluRbdMZYROIVD7oPs/3rGoKpUA0nbINokw+cWZ91ngMn7?=
 =?us-ascii?Q?eB/uc+Tdr2VnrpYOcUv0cphdAZC27ad6IFAGLgL999JHgaPFyeaikqGixeaX?=
 =?us-ascii?Q?NK1vkQD55LycgFeYDA9KUMb/LfHqoloEO57lYxkF/o06ZEyHzSDBzRZrspWZ?=
 =?us-ascii?Q?FFePksNVsOrswZ2vD1hIe5jAFf85WpPrgcb8GmRy7oEaXGiGt5ewpPTTN9Lw?=
 =?us-ascii?Q?wd77IhRJ1Vk4+MZycF25kxWanbRrbnANoYZILce62z5CbxPl1/D2H80Neiz9?=
 =?us-ascii?Q?bSEkQuHyCNpb4aJa1Pj9xKq69K1eUEXGwuSH3NvEzHbOZnBhFXqYVERSusiP?=
 =?us-ascii?Q?yQly+YLzCC21raQjzMmRcZ6qVSMcz6octGdmvGXCcecvM+o4tiumPQhV/83S?=
 =?us-ascii?Q?JcWWpmn+2YrcY167+acOr0tIZGvSRSnq8/J3jhAZiHAly0Igdz3EJ5mOg0zG?=
 =?us-ascii?Q?MNpjQjXFYB5vJkkaaKdE3SFdTW1/WzRW66AFQdwp9b0/5MvMnlxI3FCUxSS6?=
 =?us-ascii?Q?j2xTMsDLFVi5jtdYK6WZ1chIMvNle2wycfqLeyZo9u80vMHS/fs05BCAyGvg?=
 =?us-ascii?Q?gA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b06099d2-4ef6-4767-220f-08db500c13b5
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2023 21:35:00.8751 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X8sHY+jzLiCglbMZlIKDjv1v92U0HFSCw5W/eCfj2LZHU60PlzMotVebsjobVk7xt/jZekNk0KMnaxdHHp60KA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6415
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 07/31] drm/xe: Only try to lock external
 BOs in VM bind
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
Cc: Rodrigo Vivi <rodrigo.vivi@kernel.org>, intel-xe@lists.freedesktop.org,
 Matthew Brost <mattthew.brost@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, May 08, 2023 at 01:08:10AM +0000, Matthew Brost wrote:
> On Fri, May 05, 2023 at 02:40:40PM -0400, Rodrigo Vivi wrote:
> > On Mon, May 01, 2023 at 05:17:03PM -0700, Matthew Brost wrote:
> > > Not needed and causes some issues with bulk LRU moves.
> > 
> > I'm confused with this explanation and the code below.
> > could you please provide a bit more wording here?
> > 
> 
> We only need to try to lock a BO if it external as non-external BOs
> share the dma-resv with the already locked VM. Trying to lock
> non-external BOs caused an issue (list corruption) in an uncoming patch
> which adds bulk LRU move. Since this code isn't needed, remove it.

it makes more sense now. with this in commit msg (but with Christopher fix)


Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>


> 
> ^^^ How about this.
> 
> > > 
> > > Signed-off-by: Matthew Brost <mattthew.brost@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_vm.c | 8 +++++---
> > >  1 file changed, 5 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > > index 272f0f7f24fe..6c427ff92c44 100644
> > > --- a/drivers/gpu/drm/xe/xe_vm.c
> > > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > > @@ -2064,9 +2064,11 @@ static int vm_bind_ioctl(struct xe_vm *vm, struct xe_vma *vma,
> > >  		 */
> > >  		xe_bo_get(vbo);
> > >  
> > > -		tv_bo.bo = &vbo->ttm;
> > > -		tv_bo.num_shared = 1;
> > > -		list_add(&tv_bo.head, &objs);
> > > +		if (!vbo->vm) {
> > > +			tv_bo.bo = &vbo->ttm;
> > > +			tv_bo.num_shared = 1;
> > > +			list_add(&tv_bo.head, &objs);
> > > +		}
> > >  	}
> > >  
> > >  again:
> > > -- 
> > > 2.34.1
> > > 
