Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBAA3C197A0
	for <intel-xe@archiver.kernel.org>; Thu, 16 Nov 2023 20:56:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9122910E6F5;
	Thu, 16 Nov 2023 20:56:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CC8B10E6F5
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Nov 2023 20:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700168198; x=1731704198;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Rrg/BM/Xqn1mI6eZZC6bndtyoeiOOkXV0MiZtgzZLKo=;
 b=IvZEK01L0qqCsjOd6vl1vhgq6rpSHFAslZ5qrUnU2GLOg8BzYY44nK5a
 mmyUgp5XEjXgiSVxhVW/spDASNxLBP77tquw2j85itpBn0PkSNtyeoMca
 9KegPCB+7NOjTKgS5hp8i10AwTg6hhch335zmnNquUn9MXd5OoVX0DoXP
 Lmyiez/7zAGzOGc5/WS291LwzcBxGN6/38uajr0NZV6SwV/OQC7HKl8oX
 SSfnpHq52IJo8FfVZJSYNXChl6Pn2AYfnkwYhsUtTamkEq/etRTymn8nv
 tpXxMJYxV1uydazbIXDBR04/R1PadRzWMXB2HUsrwad5kyDk9CqrhCy3O A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="12729927"
X-IronPort-AV: E=Sophos;i="6.04,205,1695711600"; d="scan'208";a="12729927"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2023 12:56:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="715344577"
X-IronPort-AV: E=Sophos;i="6.04,205,1695711600"; d="scan'208";a="715344577"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Nov 2023 12:56:36 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 16 Nov 2023 12:56:36 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 16 Nov 2023 12:56:35 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 16 Nov 2023 12:56:35 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 16 Nov 2023 12:56:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NPn9FwnOs/aZEnM3a+FOzrip9M5Z43QihCPzU/AtAklWn0LwsvLUGN83gX/5HobxSQUxV5kq+tzJrHvXY0OAt0KsP+d8n3DRsWu3eZV8aEruA2SBMJ8ASIraqgiTWlXw82qGXxw6HBVZK+tKaYbq1FMyXvV6Nfa0bRMJZQ3Ergw0u1MIUJk5p4lNDB0/B3NWuueLucQERcB4BnG+zVz9y/Rs8BXvhIXxCz6F/jNYw0u+ksyGWuMlkUGKC1GIkide4hiWW9jfHp46crSTaPRE26naXAtsS81cqX8+8Bd5B9hfP4wxpZIrdgMduTtkQAcr6nZpOlvyVCNoJDfM2qjEmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CKORwvEYZmVJzutohjWy9EsF1QNnRJd6QLbqhJ0dkys=;
 b=N+3xseJZ+ijy6BzGCRrmkL4nShFMM+Ze7/wQLYXHG3O0kQ1gViaTUgIyovc9pdJDGCqsNt1zDUVtNhrf+XpY491EM82jlVEd17R+psWi4fvFk6ednNSw6nA1QkQe5PKfB9/42wmg8IkuhBctruLqFT+TTh8v9zygQsedQIJJkgQPlryvZTPqnuipVNn+k5RUwn6K9ZVSmj3CpNKE05s8B7JpXBWWfD08KfjpEuXclGURuCvIjgrGgNCO7yBCJn8+gGbSd6xZfXOkNPCa/Jxgcvoqh06WHsK9umGztq00/hWOViafIB9+jkIrCYMkpvA9dLYQvCSgbWRmjMHfl1hH/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CY5PR11MB6344.namprd11.prod.outlook.com (2603:10b6:930:3b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.17; Thu, 16 Nov
 2023 20:56:33 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7002.015; Thu, 16 Nov 2023
 20:56:33 +0000
Date: Thu, 16 Nov 2023 15:56:29 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Souza, Jose" <jose.souza@intel.com>
Message-ID: <ZVaB/d2fR0GBje3T@intel.com>
References: <20231116144316.7-1-francois.dugast@intel.com>
 <20231116144316.7-7-francois.dugast@intel.com>
 <b53c6f92cafa55a32d2315dfabc4698b6cea17ac.camel@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <b53c6f92cafa55a32d2315dfabc4698b6cea17ac.camel@intel.com>
X-ClientProxiedBy: BYAPR11CA0068.namprd11.prod.outlook.com
 (2603:10b6:a03:80::45) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CY5PR11MB6344:EE_
X-MS-Office365-Filtering-Correlation-Id: a48ea9f7-9dba-4362-a6d6-08dbe6e6836f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xi2RkjEHru7koplWGzuZpr/sUqxW0gvoKjP1HFDyUCDb2+0bEzCss4rU7dv16MYlebq5MRyyRVyik89PXp0TSWO3mguGisxg4eoRdA8npR0fSBNmnUphiwUq+of9paPdyIYxRSKwh6lCNx1ObjKmZC6ubiPWs0FPmCeagpOXcSgJxX5OCdZV+ipRaNBg/O5604r7HoYkuY0xjYW/mwzDGB4rD/wRt/FaFS/vNHOmrIusWH1VlMWR6HQlUvFp+SkjarzmgxkTgzBvwbpsNJMKFA7Gqa4aLted8IKqHY1pI/gXWF5gbnqBFuutlwOXO5cs9iXdFdbex8WnsgjVyNUsE0/rX+ww/joO/u+dvezIbMn98aZmVsXfuUy8XhjdXouocudovlvSx73868s0x+5qJPjquIVkUQAta29ilnCNkmnY2Nps88yhg0bsjsfLFsUiyuMbMKefpyB/kXGbTuKLCzPJVl9CNca5UiDIdxeS5xvplil0MOv1Wkc3e4Ie3BnBwHbGHkiRZ5qjdVr/OP1iBiI4OGgR9F5yOiGr73SkWsrzg4MRQ+I9e/qpCGejYNw/8e4rRnO4mGoKwnyPsKmXw7hRRjnqkDgzo8f1JCEuj9A=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(39860400002)(376002)(396003)(346002)(366004)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(6512007)(6666004)(26005)(2616005)(6506007)(6862004)(83380400001)(41300700001)(4326008)(8676002)(2906002)(6636002)(316002)(4001150100001)(5660300002)(44832011)(8936002)(6486002)(478600001)(54906003)(66556008)(107886003)(66476007)(37006003)(66946007)(86362001)(38100700002)(82960400001)(36756003)(43043002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lyyPmFbvkrX/Jpzq9mNboMs+ZeLrdtPKjJjhkMzVJF9dK+QiPH8Yl0VX4vpS?=
 =?us-ascii?Q?UNobab3i89tyPE78+Bq4l1Yjle0+7sYURAL6tBaJYDPGlzN2y/Qd6FeOKmSS?=
 =?us-ascii?Q?OsLduU84EaCxfL/XF1rSTFj0i1Br+BvZLAWvAHYdyQggjHvhu/CE6jcw/VL+?=
 =?us-ascii?Q?vB895xwcTbO0a9VBDfDqys2Td0/EIIA9o2lghgL/9Z8yV90WSnRYVDWE/vR+?=
 =?us-ascii?Q?lOzXhikf6crP6idC9AqgnbIxc3Qqe6ZgtpfOm/RSayCGTemlUa+c2iTczfnr?=
 =?us-ascii?Q?BpZLPW/bbRz1wCYQMGInD33QyTd3jTDlMWFBjn5Iu/FuQCTse+YEo7lorPov?=
 =?us-ascii?Q?ujMf9ABo2Q5DSqQYUfDIur8r0lRkNsDbjQn9rGhhA4Pv+Edk+E6IaUViRkt/?=
 =?us-ascii?Q?CzUDccK4RN6lQ1Zt2NqX7F3Jk6a3TRbuWRZlBjxwK/MQp2de/xZp1Y+gOQfZ?=
 =?us-ascii?Q?Jt80JvMr4kBvwd5JPX/KeAHrRG4COYFkzOqOBaAA6CIMCu+4HZQIeUAc7RC8?=
 =?us-ascii?Q?Ik210txJm+cEyk5xE5KXKLHAERWca6gxrQbA7w7cGwvNYqMXKELQgtP4Tp0w?=
 =?us-ascii?Q?ScTywHhEkKOS+DOjhodxez/ZqEgsZOTnA129t9BidTOIYs3oPccIRz2g62vF?=
 =?us-ascii?Q?Bb9P4InvYPRx0x2+JJEvQwKX8cE4QqeUxW1vAqCYNR6BDoNBmjPaSix9U9nf?=
 =?us-ascii?Q?bDLr/biCgAl5CjWwa+790H1gRvgOe9q8Vy2eadezPTbzb+U3O7nTJAk6Er7k?=
 =?us-ascii?Q?DqEaXHn195ArZwJjjaa+aEbBd5VZZO5/t0DYZWS2pzBN7OB5nxSB0K0aE2Bl?=
 =?us-ascii?Q?po/azJuuebRXMj4022H0KPGeGygkyBLENjeH0qch+84yTgka5KQJEF1q1x1Y?=
 =?us-ascii?Q?WVTvhSPlSM7Pt3RDTtBPFKUidJpvNoDwiLXLd7vExqXX8hMSTShed+J4MBMm?=
 =?us-ascii?Q?fwyLt6Ed850o5buJW4Q7OSHF6n+Y0PWaENJDFBugOgDurcxifhOvlLc+BZQB?=
 =?us-ascii?Q?hublG2jY/Q18J0QK1gZIkVitCcLT9Yp+HtV5Ub1bDRC2qO7GPScsx1ItnRye?=
 =?us-ascii?Q?NY4XZlgHby6kCgcV7uqZrJzJMT9OVYU/JSnWLR92bOeog+LwbozGsnGWTwXN?=
 =?us-ascii?Q?5RC498shPVvz2MldubzqUqnwPph5lG2ggKPu/I3Rq4IFoBo5wz/bmSuH1hGZ?=
 =?us-ascii?Q?VHRURIyY+PNpNxKcj8ORWomFa1l0qBQ4Y/HlZeg+tN/3Ke41WkqnRffNjhJ4?=
 =?us-ascii?Q?h/S0m5wAxBzhsft9H1z32M1aHZWO1gpegOps1tod2vgluBnAz66XzQd7qQ7K?=
 =?us-ascii?Q?WNgi+8A0dNsO7xSlduPh1R14vl19cWWdZogxSqgIbeREGKK/5cfYhcKWgWyT?=
 =?us-ascii?Q?aNYALml09u28W4a/EvKxOrsY3lulhBT7NZn1GRS+dnBmbzoY8yudBI8MOarb?=
 =?us-ascii?Q?HPOOUs85bUrRHvVrYplGg9JQj1g6/Edk1pPa4HfFELapLHu/fmA/4Qy4vnMZ?=
 =?us-ascii?Q?9WDZd4Q18Tru28GM6UG9thWad7OLZ4UeCiDJn4TPYW+8hCVji+Lzr9Q8N+M2?=
 =?us-ascii?Q?3KMUZbSCAvpr9tv+U1bghxigOE7C0xAhVP4+xgOD?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a48ea9f7-9dba-4362-a6d6-08dbe6e6836f
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2023 20:56:32.9607 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oSOnkdYd1HOiFieKinvZCy57NlAvsUmNEM4Y1rK610kjqkbXIVVPKDIqo9p1KKLSkGxa73CSOUbZ0PscmkpNRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6344
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v1 6/8] drm/xe/uapi: Align on a common way to
 return arrays (gt)
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
Cc: "Dugast, Francois" <francois.dugast@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Nov 16, 2023 at 08:40:26PM +0000, Souza, Jose wrote:
> On Thu, 2023-11-16 at 14:43 +0000, Francois Dugast wrote:
> > The uAPI provides queries which return arrays of elements. As of now
> > the format used in the struct is different depending on which element
> > is queried. Fix this for gt by applying the pattern below:
> > 
> >     struct drm_xe_query_X {
> >        __u32 num_X;
> >        struct drm_xe_X Xs[];
> >        ...
> >     }
> > 
> > However, strictly following this rule would bring back the name "gts"
> > which is avoided as per commit ("drm/xe/uapi: Rename gts to gt_list")
> > so leave exceptions in the case of gt with num_gt (singular) and
> > "gt_list". Also, this change removes "query" in the name of struct
> > drm_xe_query_gt as it is not returned from the query IOCTL. There is
> > no functional change.
> > 
> > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_query.c |  8 ++++----
> >  include/uapi/drm/xe_drm.h     | 18 +++++++++---------
> >  2 files changed, 13 insertions(+), 13 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
> > index b31e00bd29bc..5756d8eaf972 100644
> > --- a/drivers/gpu/drm/xe/xe_query.c
> > +++ b/drivers/gpu/drm/xe/xe_query.c
> > @@ -353,11 +353,11 @@ static int query_config(struct xe_device *xe, struct drm_xe_device_query *query)
> >  static int query_gt_list(struct xe_device *xe, struct drm_xe_device_query *query)
> >  {
> >  	struct xe_gt *gt;
> > -	size_t size = sizeof(struct drm_xe_query_gt_list) +
> > -		xe->info.gt_count * sizeof(struct drm_xe_query_gt);
> > -	struct drm_xe_query_gt_list __user *query_ptr =
> > +	size_t size = sizeof(struct drm_xe_query_gt) +
> > +		xe->info.gt_count * sizeof(struct drm_xe_gt);
> > +	struct drm_xe_query_gt __user *query_ptr =
> >  		u64_to_user_ptr(query->data);
> > -	struct drm_xe_query_gt_list *gt_list;
> > +	struct drm_xe_query_gt *gt_list;
> >  	u8 id;
> >  
> >  	if (query->size == 0) {
> > diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> > index f54e545cc4fb..fa4f554b5264 100644
> > --- a/include/uapi/drm/xe_drm.h
> > +++ b/include/uapi/drm/xe_drm.h
> > @@ -356,14 +356,14 @@ struct drm_xe_query_config {
> >  };
> >  
> >  /**
> > - * struct drm_xe_query_gt - describe an individual GT.
> > + * struct drm_xe_gt - describe an individual GT.
> >   *
> > - * To be used with drm_xe_query_gt_list, which will return a list with all the
> > + * To be used with drm_xe_query_gt, which will return a list with all the
> >   * existing GT individual descriptions.
> >   * Graphics Technology (GT) is a subset of a GPU/tile that is responsible for
> >   * implementing graphics and/or media operations.
> >   */
> > -struct drm_xe_query_gt {
> > +struct drm_xe_gt {
> >  #define DRM_XE_QUERY_GT_TYPE_MAIN		0
> >  #define DRM_XE_QUERY_GT_TYPE_MEDIA		1
> >  	/** @type: GT type: Main or Media */
> > @@ -390,19 +390,19 @@ struct drm_xe_query_gt {
> >  };
> >  
> >  /**
> > - * struct drm_xe_query_gt_list - A list with GT description items.
> > + * struct drm_xe_query_gt - A list with GT description items.
> >   *
> >   * If a query is made with a struct drm_xe_device_query where .query
> > - * is equal to DRM_XE_DEVICE_QUERY_GT_LIST, then the reply uses struct
> > - * drm_xe_query_gt_list in .data.
> > + * is equal to DRM_XE_DEVICE_QUERY_GT, then the reply uses struct
> > + * drm_xe_query_gt in .data.
> >   */
> > -struct drm_xe_query_gt_list {
> > +struct drm_xe_query_gt {
> 
> In my opinion it should be drm_xe_query_gts or keep drm_xe_query_gt_list

Cc: Matt Roper <matthew.d.roper@intel.com>

I honestly prefer gts better to align better with the plural of
everything else. But Matt's point is that a plural of an acronym
looks another acronym and people might ask what is "gee-tee-ess"?

so, I like Francois attempt to align them all in a consistent way.
But maybe we need to keep plural everywhere and accept "gts"?

> 
> >  	/** @num_gt: number of GT items returned in gt_list */
> >  	__u32 num_gt;
> >  	/** @pad: MBZ */
> >  	__u32 pad;
> >  	/** @gt_list: The GT list returned for this device */
> > -	struct drm_xe_query_gt gt_list[];
> > +	struct drm_xe_gt gt_list[];
> >  };
> >  
> >  /**
> > @@ -495,7 +495,7 @@ struct drm_xe_device_query {
> >  #define DRM_XE_DEVICE_QUERY_ENGINES		0
> >  #define DRM_XE_DEVICE_QUERY_MEM_REGION		1
> >  #define DRM_XE_DEVICE_QUERY_CONFIG		2
> > -#define DRM_XE_DEVICE_QUERY_GT_LIST		3
> > +#define DRM_XE_DEVICE_QUERY_GT			3
> >  #define DRM_XE_DEVICE_QUERY_HWCONFIG		4
> >  #define DRM_XE_DEVICE_QUERY_GT_TOPOLOGY		5
> >  #define DRM_XE_DEVICE_QUERY_ENGINE_CYCLES	6
> 
