Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82360C0015E
	for <intel-xe@archiver.kernel.org>; Fri, 14 Jul 2023 14:28:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 445C710E895;
	Fri, 14 Jul 2023 14:28:31 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C159410E895
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Jul 2023 14:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689344909; x=1720880909;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=uAPTutbSNLYO0KMa34gCh+NceWNe0dEQBHGdEfuxFAs=;
 b=HG40tcU60/ho2bMsl1bhp/+YOHjl5e8dqOjxa622Tv4ubi0Cs+vbr8aZ
 n3qrw98IOPQzvKJMoFR60/O2Mi79T4lPhZfu5Xos/WDqMsiZ3X/pI8Rz/
 TiguoZybAaqvQZkFJL+Me40JyAL37kNtpt/+5q9H6IwLcal2GLX1Uiuh3
 9HtHJ53e3+6Oj62Q90tfkuJ1sH5lgu7kht7GNxUtQ7HquJxFRfMtyj1Lv
 mmU96SFJB1uxmdAA53LHlYrutxztPwCRYVYms99r2jOTHdfnQIn+I6YbH
 W1ShdIPmqD9bUFAKaEf/f7Yn4Sb8YSCqLEqrix9mtUKGh0aSxbhd0UYHz g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10771"; a="365526023"
X-IronPort-AV: E=Sophos;i="6.01,205,1684825200"; d="scan'208";a="365526023"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2023 07:28:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10771"; a="792459055"
X-IronPort-AV: E=Sophos;i="6.01,205,1684825200"; d="scan'208";a="792459055"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga004.fm.intel.com with ESMTP; 14 Jul 2023 07:28:13 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 14 Jul 2023 07:28:13 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 14 Jul 2023 07:28:12 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 14 Jul 2023 07:28:12 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.108)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 14 Jul 2023 07:28:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GbbLskTHuD3T1spP3Va1XsjIrKVS3oOLc7IUVSDtYRWNBrKD+9IjlRV4q7DZLl9QlrZylH5RBeMXXEtrSIXQVsj13+/Svjf2JUv0+1NiGPr0mUiyjaKQM83Dc8nmPNEmFjPtDvyCocFEOJw/A+RjjJI1ownNaA+UsI2GmMY5prRs/jxgDCx1qO3VNWDMjuG32wa0vlW7SYEdOjLV8tKfsPTqZu54uJs9nCUxH8mp18Oc1jSuMgEXvMbOvyicCWTsh1UxSc5juy1nFHOWeiK+J9VET9Mbt2eKDHWoExfFsi7TtXZVx6D91HD813l5tiiTJHeEtF7Bkv13+n0P+dWLSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UR7lAJdZARIGjmAr1RyvBEjYe37AAoUpY6tLkgRaiV4=;
 b=FeilUkTkdwSVn61wooWrXViEmLkp+ajZHrh3QRP5I7BbXZUI2PFnMd1+rigxc6w4WVxZMiq79GvE60wF21xjeUBwZuZP3uJXKkXa49WGckuZvBdoHlJWpjvVp5d39s+WYgd/4n3ez/C+h31Jj6CxpzU/lEjTj5uShdOXy1aeUKLDrJ5OirddEyQw8d8JyS8f4wUgTiAn5dt9EztLeiGFthFfIOu9kYweB/mi9MVxg07mbRKomqVPP8vjxxllAcGTEYsj0u/1Fi8KPePxRs1jlvgfi/5Bj6IcVu5qW42y+FD0+OqYsyTB10tZg3Qm2zS9zaIITgJWxOYyYhAvmcoZRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DS0PR11MB7925.namprd11.prod.outlook.com (2603:10b6:8:f8::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.27; Fri, 14 Jul
 2023 14:28:08 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::2677:dfb9:456f:1227]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::2677:dfb9:456f:1227%5]) with mapi id 15.20.6544.024; Fri, 14 Jul 2023
 14:28:08 +0000
Date: Fri, 14 Jul 2023 10:28:04 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Message-ID: <ZLFbdCsfJ80M7xJH@intel.com>
References: <20230711212748.2029455-1-matthew.brost@intel.com>
 <20230711212748.2029455-5-matthew.brost@intel.com>
 <ZLBdT866TPKU2quC@intel.com> <ZLDGxJsRmdEKrCnZ@DUT025-TGLU>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZLDGxJsRmdEKrCnZ@DUT025-TGLU>
X-ClientProxiedBy: SJ0PR13CA0200.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::25) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DS0PR11MB7925:EE_
X-MS-Office365-Filtering-Correlation-Id: 772e268e-d7f7-4bd7-54b6-08db84768b43
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wVI8C++J1+rAff3abXNg/+9KIvQI3hp9OzRZ0bKkM9w7vp00L6HHSHSUzPKcdS4QFe7Tpxc/Es6t3x27ZSuGtLjs8DwjOikYQXV5DTIH3R1OR968erHsx6pHMUj93xyWGoFNUZ4+ZjFUtDEGq8053rIK4dADvbpanN++fX03YP78MONDbBBVWRkWM3vUpOExI5eTfcBLZ9P4lYHBBGIHAV/uR+qurxxBDySfffvPXnLieouGhQRpBF+JRXVW2TzTAYjrgyUOVgyVpbkYJAlQIxy/wnlD5ryD+fTenBVFk8JRUmDpx4pN146CtXCrpEbtU/UOae//j9Gz+pRS5Gidai5x5lvxh8voqys/ruQqEx2ptRgS7UkYNowvhoAmfV8u+ytDUC0I11OwjvOBTDdUY/KSQyLETlek0rWIehAy+7ytldfu1dWgvRENDLOnIw7PL5gQkxWE11zqKmzIwh79BYTl2yfxx7mW4wXmXdeF+OM6ZcIzn3v4kZ1IE/8SkPtCVuyrrvmE8qCqgUKs6KbSpdgw8kqmxO/ChuXZJ27pLY7n8Y5bNw9+CzyGhg1dljUP
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(396003)(366004)(136003)(39860400002)(346002)(451199021)(37006003)(2906002)(38100700002)(82960400001)(6512007)(83380400001)(186003)(2616005)(26005)(6506007)(5660300002)(86362001)(6862004)(8676002)(36756003)(44832011)(8936002)(6486002)(6666004)(41300700001)(66946007)(66556008)(6636002)(66476007)(316002)(4326008)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BoheZ7tQXbxgRvxy55VeCRoEiTOJsPYMBuiqM7O96rBVh6Da0CLvDhdPxk7T?=
 =?us-ascii?Q?m0vhiDdox+2yY4F5kjLLTRXbYXkxpD55cdK9rjsx/63rFlddZfPmF+1s9+Q4?=
 =?us-ascii?Q?iGr08tiqxs/tUrMlwSumgK4HcrgtJ6sJKPCdl+NrWiU5FAcL2RqwwetWrBFm?=
 =?us-ascii?Q?5mCwXm4CufxdXr+l+8/9QNSgESt9niMk9u2r4JDUOXGJuhUT4ni8mNqTg0iU?=
 =?us-ascii?Q?pkqUZhZOfu0dXBND25ncxCmPjwiNeYSx4fXM6b1y39WRgujYGhA+9GUr8eQv?=
 =?us-ascii?Q?ZmuEtZZLhZCoTaDcxNaQqm89F7Ao5KC0A/RStVHnnz7j3AorlC9aGUF99wCT?=
 =?us-ascii?Q?8mTRwv5wT8S6eMZnsqguu7gaI0BcH9fl8mZCYyCBx/E2d7GqcCEDvRZU4tlK?=
 =?us-ascii?Q?f3MkHSUH3PK0l98HaOTpNcAcB8Aq9UY7sRUtEMBjLcKXZ2KDHnp0uKPfuvDy?=
 =?us-ascii?Q?xB+vrRa556VkWpMgObZ+JgsT1B1hIWqcTGe/RnHYxQj5zVJeLjVlcATPiJ7x?=
 =?us-ascii?Q?NlNr0mwSOqDd31/2s/g80QxmtpeXFtO1X4kggng4uhF7TZ7pTaZ+fmiS8OaT?=
 =?us-ascii?Q?s2YYPsQfAbgcsf5/9zaxpr80DQve1sgtBtahQmv7g1oilg1uPI4hqY86KZjp?=
 =?us-ascii?Q?P88IHnm2+mk5AJa2Uc1UfuAa1FPhRgFwbCyxD4pxp02a8b14LuWyY3X5DwBa?=
 =?us-ascii?Q?waWci2wPooISalhnmG4Y+GFLgTqtAzl+JJUukdVoGFcR0GHYBeQXFEfDgwoA?=
 =?us-ascii?Q?m9GS7R2mVJTtJF8Rip4f2lm3C2j7ZWUYf6x8ZZk7Lk/nCgTqUA1GFszyxrTf?=
 =?us-ascii?Q?erQPn5vygzCVb6rIApwZfQcF8Gheey1m55H3cuzZtJeQnqVJ6ZHFTyIQ16kZ?=
 =?us-ascii?Q?XOGO193poqLmMm5+RNlkF+jIe11h4kR4zi+l7+6r+pqPND9moqW6okwfyAqV?=
 =?us-ascii?Q?+Md9wzgGtjyh74gzNJAPfMKxkTsP8Gkmjr73ca1XjZQ59zq4IxtS726ZAsNt?=
 =?us-ascii?Q?A9YhzCdVROTMW5zAgS7kIDuB9YoARzfRYwXsM+9HQMNFlx45LjUUWbicumjZ?=
 =?us-ascii?Q?kfz6Ma3HPADUtm2nHDFPIZHCOqtecAZig12SS1OiJ07jKnKdrNis7YmLKEpE?=
 =?us-ascii?Q?UuckLRCAAvdACGlJpq7Q9EDbS4F9HRuttMfcEJ1UMgznafLrfZzrptrsjfen?=
 =?us-ascii?Q?yFwlQO3uT4AdZVv1RyWangbeGYAUk+Tc8+WU72h8xxKqrCC4NnWPM6o1wGBU?=
 =?us-ascii?Q?YWrxD1OS70o7FuiVN3evqkNVxwHGvnNqYjbLE+s80YSI6nq4Y7p1lf78lxPx?=
 =?us-ascii?Q?Tclr0sFcsB39QLZOz322g8iUiuwiRq2s59FIiQ+yqpcUYJ00dXWo31wM6bh+?=
 =?us-ascii?Q?5VfENbbjiSepDY9Z8X5wN4SUINIP93YoQuLK8Dq52F1UZPb12/qKH902WihY?=
 =?us-ascii?Q?CnE0wypBf1bqml1LfX+JbOwZeVJuDyjGMZe3lEVm1nWDE9lwiwZt78yAHPHx?=
 =?us-ascii?Q?vsnI36TlscMB3+ISTW4jzdxYYZXjAFN54BK2mQ3GzrWyQhRBEXmgb+AvgvOE?=
 =?us-ascii?Q?I8cbWH7oW+yh1xLI4ISihs4L+eTcPStJUgFr6EuTJ65qsQrtA+QtIoCT1cm1?=
 =?us-ascii?Q?Zg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 772e268e-d7f7-4bd7-54b6-08db84768b43
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2023 14:28:08.5161 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4c9F5rU7iwotiyJxoy+5ax/VmynSa0qEEUOdFzmGwQveXl4IbM6HVriiyxKaRQqMyhtLgHMH0OCANh5g/3zrpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7925
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 4/5] drm/xe: Combine destroy_cb and
 destroy_work in xe_vma into union
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

On Fri, Jul 14, 2023 at 03:53:40AM +0000, Matthew Brost wrote:
> On Thu, Jul 13, 2023 at 04:23:43PM -0400, Rodrigo Vivi wrote:
> > On Tue, Jul 11, 2023 at 02:27:47PM -0700, Matthew Brost wrote:
> > > The callback kicks the worker thus mutually exclusive execution,
> > > combining saves a bit of space in xe_vma.
> > 
> > could you please open up a bit on why they are multually exclusive?!
> > 
> 
> Not sure how else to word this. The callback function (below) queues the
> worker, the callback argument at this point is safe to clobber.
> 
> 1047 static void vma_destroy_cb(struct dma_fence *fence,
> 1048                            struct dma_fence_cb *cb)
> 1049 {
> 1050         struct xe_vma *vma = container_of(cb, struct xe_vma, destroy_cb);
> 1051
> 1052         INIT_WORK(&vma->destroy_work, vma_destroy_work_func);
> 1053         queue_work(system_unbound_wq, &vma->destroy_work);
> 1054 }

oh, indeed... I should had checked that.
for a moment I wondered about scenarios where the callback would
be called more than once, but that is really not possible and
we would have other errors anyway.

no change needed in the original patch or commit msg.
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> 
> Matt
> 
> > > 
> > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_vm_types.h | 11 ++++++-----
> > >  1 file changed, 6 insertions(+), 5 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> > > index 2a8691a48c55..30beae541aca 100644
> > > --- a/drivers/gpu/drm/xe/xe_vm_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> > > @@ -51,11 +51,12 @@ struct xe_vma {
> > >  		struct list_head destroy;
> > >  	} combined_links;
> > >  
> > > -	/** @destroy_cb: callback to destroy VMA when unbind job is done */
> > > -	struct dma_fence_cb destroy_cb;
> > > -
> > > -	/** @destroy_work: worker to destroy this BO */
> > > -	struct work_struct destroy_work;
> > > +	union {
> > > +		/** @destroy_cb: callback to destroy VMA when unbind job is done */
> > > +		struct dma_fence_cb destroy_cb;
> > > +		/** @destroy_work: worker to destroy this BO */
> > > +		struct work_struct destroy_work;
> > > +	};
> > >  
> > >  	/** @userptr: user pointer state */
> > >  	struct {
> > > -- 
> > > 2.34.1
> > > 
