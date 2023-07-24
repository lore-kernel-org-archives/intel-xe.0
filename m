Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1851AC001B0
	for <intel-xe@archiver.kernel.org>; Mon, 24 Jul 2023 08:02:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA4D010E1B5;
	Mon, 24 Jul 2023 08:02:39 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA8BD10E1B5
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Jul 2023 08:02:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690185756; x=1721721756;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=YyDICCdt4XB19AEl+KB8VEffdUMj+S8gVPtXcH1+jss=;
 b=c7RoU3XZ2q3+cR/3UwmM6/jIAQcLcTqwZRenWqRyRdMN5u+XiYIdDdP/
 NfchWVsJRgWvlgWJf1IcRWlow+ZDcTv+zacQpNo0qx5vcxmFH9PwraF2s
 yKhy1Ow62PZqxpQd3rCdHK7BdRQkl6p0IugF22OUF7yoD1c+RfMtFN6qu
 Ycah1L9C4kU3SrCrsYA+3+WeadTrty2CFbchyRpxqAx6TdJTns9D/6iqE
 J4TUeADT/KUcw0+9b4CdbhLphcRgBakkM1qEwucIqRmgXA89EQ4V1eIVX
 XTA7hk9AHl95JUsNbrf1seBeEEAVJZXLd88K03hlyn6UyI8fqaEi+o0FR g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10780"; a="431171945"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; d="scan'208";a="431171945"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2023 01:02:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10780"; a="760701205"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; d="scan'208";a="760701205"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga001.jf.intel.com with ESMTP; 24 Jul 2023 01:02:36 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 24 Jul 2023 01:02:35 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 24 Jul 2023 01:02:35 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.170)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 24 Jul 2023 01:02:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NxaXWDXFzKxS9cjHCstpV+Cq0JrV7Y24NFWC3FPkxh/GNFZHEpMUaMj01N/tX7KdA/CEqU1wGv359awIP+zA+VENJV6nAzowF9bAQIKQI2Iqemx71QW6skfqYot/jCGgYWrdE/Kt65N8OLqnMCoJ/y97GR6/b5BGgt/p8N+DBawc7WdhR023uBL18qFk2Z22uW2rWNRBaZW/5GRps0RdUSqhkGSqH43wE4lyQ0bjYGrm/RWvwNXWkHVUq+JabHq8uiwyCfQRQIYSE9/x/8wbjPZFVvoMnNMWm9ZBUFojDV/7r1wbTWs05DiAvCusmUWqnkuGo92q9u7qn8aNPU3VjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nat1eAhZKBcwBy5DyAn3FFk6Zv3njxouAvyw4TtMfLA=;
 b=J2wONuzrhS9xSyxRNF1t6xJTwAHpXC3luqL9V/FxbzGgj9UwMS0KVPoKyIsFm+UOc2mCsCSpi4L9iKIBN/dyVUG/hLBC6Lz1j55uWdfoCuLtaJgp6TAuyWjoSRK/vhL1BFCDEkkUBXsin40QyNNmnaCKFamuAZfeStTIMFYUDJpsWki0/XXQkC4SwL6WKWmFOh664HiJT7SWahqajXXuCAsvMYr53PZR2tea9VfwEzCv6NPYk65tsQpi4aCiBX+LIodTd+S25hwitxD1UL3uRKion19PNtaGEEUlu8IsfR3daDWNqglzGDQZHedLtCN7EQdgH6rto+uLb7lnQTQOzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by PH7PR11MB7570.namprd11.prod.outlook.com (2603:10b6:510:27a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.32; Mon, 24 Jul
 2023 08:02:33 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::df9e:93d2:70c8:bf83]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::df9e:93d2:70c8:bf83%4]) with mapi id 15.20.6609.030; Mon, 24 Jul 2023
 08:02:33 +0000
Date: Mon, 24 Jul 2023 10:02:24 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: "Souza, Jose" <jose.souza@intel.com>
Message-ID: <ZL4wEOdDSEVA5yyl@fdugast-desk.home>
References: <20230721202144.269837-1-rodrigo.vivi@intel.com>
 <20230721202144.269837-4-rodrigo.vivi@intel.com>
 <0a4f11d54a1349b750a87d322c89e939ed6fc4e6.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0a4f11d54a1349b750a87d322c89e939ed6fc4e6.camel@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: FR0P281CA0209.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ad::6) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|PH7PR11MB7570:EE_
X-MS-Office365-Filtering-Correlation-Id: dcd80417-c131-4cf9-bee0-08db8c1c559e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jieDGBlqjGgtlzZAQNHYNw21eRsw7J/CYxxIZ0EsNxzNNMH1tgKHHtv4Sb2o3OQ6BdBzeGlELLcIJ02Z6vp4RIEMP5skGgI6UIiHd94KMHuYLBJvcKM4BPNoGeqQ+BvRJPXmAJc4k7IFQz1kYQ7FdRxLLMtNtgIWEREhkUAtt8EDEqXIkMeyHuNfuWeonRqHYAKuducWfINrXnUxBYpoHtSR2fEklrbdib/hLaWgc5CO5kQkSMQz8Gc93N/lqt+iROpF21NgP8yn4qLudZcNaKLufIqrkVYFsSIutCjtms1L2z3PAq0p1TkPvQY7wuK8FSTkMDJ2ko07TXv3ahbJlxQotmL0zs1A4cF696l0iYn58QYir2rWBFJwP+KDLzmBGsSwt7IJc/U8EioZ7Ge+UvoqeO57FWf+ft10o4Fy2hqPezctVjmZT7fCeMg2ZANIH2HRe2Pa7a8mhscwavcmYTDYFdFuLsyjLbbHdc5obXaeQV9W7Qc9Sn7UQqM0lOy+evZTZ18vXBezxF44OtcnWiBZOj/pm58DW/T3tGErrqitv3uzbfh9AOpChOS9Wc3Z
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(376002)(39860400002)(136003)(396003)(346002)(451199021)(8676002)(8936002)(6862004)(6506007)(26005)(6666004)(54906003)(41300700001)(107886003)(5660300002)(6512007)(36916002)(6486002)(66946007)(66556008)(66476007)(9686003)(4326008)(6636002)(316002)(478600001)(44832011)(186003)(2906002)(83380400001)(30864003)(38100700002)(36756003)(86362001)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?omCyom07rH18i4j2kIXseraYU8SQAaxQuKx4nXsFf5KoVocsRsjBSDo8fa?=
 =?iso-8859-1?Q?FQQG30wn6dI3B9M8llY2FU+hOkv/MSRx1OYTpC59SfnoBC4o1ZaeWMo0UZ?=
 =?iso-8859-1?Q?DiCiBj1Yw4S0FyQTrJDnTSw5vCHl04bryN6AfOZK5loUGxlXsKr1uIwhpJ?=
 =?iso-8859-1?Q?wLarDp5e9oOD5x1pj16D12NPvEaUdEgUtEsZakpbQPS+CAmVZJcG3ewexB?=
 =?iso-8859-1?Q?8JLH6WhxuwjiotWCzzddvOMzXZR5UgC5kC8UnjQZWtwGEgta+LnwBJLtDE?=
 =?iso-8859-1?Q?5RP8owyVBIENnPAhLNIr6B4Gue7v0uk4drP7AzEYGO3YsURtX7Roqd2AQQ?=
 =?iso-8859-1?Q?Gqz/a2cu+IdhtX9cvW7UGa6RQb0hycovqVqPVR4ASqmhV0COFcc86iQ8gH?=
 =?iso-8859-1?Q?ExPIS+TancUJhdQALB1hzq5kuIcoITlGpyyFc5GxcfdQx7JvMt2+N5/vlk?=
 =?iso-8859-1?Q?T4smSm3AiKQfaC0MLaqoCMctvAyMfRGK8dbybO6dduGaunPIRSFgpizQKd?=
 =?iso-8859-1?Q?DNWKei3ujiqhw4FVrFB3JUS8qoJsWdfMNo6b6wsSAK52TSWw4P4kSjFhLY?=
 =?iso-8859-1?Q?4qnIUczRDb7TC1xRnwYtIaXvlyznnlPCa76BX+c6ZxtkBON25kCg4ReATI?=
 =?iso-8859-1?Q?+zOyyffQZPLyfmrWXkmxm5YLFDwllevkEand7P2u9oN9IEUnSejX3GI4WC?=
 =?iso-8859-1?Q?ihnJsEowBYzqPIgSxeNtZ4IMLL6WIyBMMrB/JMdKMgsEvWVgp7vWLshu99?=
 =?iso-8859-1?Q?NUcJ56eHra84E7NraOQBeM9Jca2lvU9HHHuHZIzfJz9IEmmwSRctFRIkxW?=
 =?iso-8859-1?Q?okGGJoBicCP48/sH28I7+QNgDwaMb+wzhdg1kfASwuM4wATa+EhbKnke7i?=
 =?iso-8859-1?Q?FJo6mIF+DkWaaTb5ixtzNlrT0MzLeyDisC41iZxkYdqRg6u8xAY3PWE5fZ?=
 =?iso-8859-1?Q?Fd9lPKH7ymCmtV2InreU1OXxp2kb+lPRQseTssEQVumJ9sJIvDNw4MjMtl?=
 =?iso-8859-1?Q?LDZi859Noj1BpYJ8s/nobRznONGRJGgG3Ql7l+VSQcIa76wbMdfh3vd45M?=
 =?iso-8859-1?Q?mLcbzpQmDbE5lc5Vgcvym9XsNHKojzk4QSKuj8l/q2sirSj8IPCCYPErsL?=
 =?iso-8859-1?Q?JwG+Yix5qfZJA6B+G4qK9ERVTfWWDaecaT4A6P6lwErzQ0zvVg26255hud?=
 =?iso-8859-1?Q?ob42ZCvO3zkYc5ppFEoVgSdeGKVwhy5sRNcls8q25yZM0mwysrnSNSDnSZ?=
 =?iso-8859-1?Q?UCaeReEVbnLDizHPhi5oI6+wmX5UijU3OrP8PqhP1lBqn6yw4imx3E2o97?=
 =?iso-8859-1?Q?247YMipg35Obj7uRlOnftUGZHrNFBGEBuU6gNOnQ75aZbj3+BsZ2MPxXuf?=
 =?iso-8859-1?Q?uJEK+/12GKhSn01Tyfb/75aa0Oni3q58AwmiSg88ufIiqMdH6gdlgMn5dl?=
 =?iso-8859-1?Q?5d4IGd3W6lDu4g0k9KXOTc8GSZBra9QPBxap5TKLJc2zBdL4uR71YIoON2?=
 =?iso-8859-1?Q?S1NrqFpDpSoC5/Ye7KLIum3DAjylK+SJQHWYA+/1hvID6qfgccX17+iIMs?=
 =?iso-8859-1?Q?ktdmKHYwKvxVYBjE1CxzT72oG1Ae3VUz6pqILtK4jAL6ZX8GsbFvOfYPts?=
 =?iso-8859-1?Q?50s3M2sZ39TcgCtvxB2wqJdzi/aJrPNoI2Dms/kkVqcPsODYuI4gTXag?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dcd80417-c131-4cf9-bee0-08db8c1c559e
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2023 08:02:32.9262 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KtZw/vIkn6ZvRB4YUZlms607EJ4ce88T1gmTmPRO+Jx6YPwbIXANWJRn6nZnqCaKvW2zfrC84PMWkMOsVNTeqaiRBaZAHjEau/clJo+nJds=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7570
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 3/3] drm/xe: Kill execlist support.
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

On Fri, Jul 21, 2023 at 08:40:01PM +0000, Souza, Jose wrote:
> On Fri, 2023-07-21 at 16:19 -0400, Rodrigo Vivi wrote:
> > This submission backend is incomplete and unsupported.
> > It was left there only for some initial bring-up for comparison
> > and experiments. But most of Xe driver and its features rely
> > entirely on the GuC submission.
> > 
> > If this code is not entirely broken yet, it is likely just a matter
> > of time.
> 
> My 2 cents here, I think it is worthy to keep it even broken to make sure Xe have a backend layered architecture and don't end up like i915 +
> execlist.
> Also for new platforms bring-up this might come handy when fixed(if the necessity comes someone will put the needed hours to make it functional
> again)...
> 

My 2 cents: I agree execlist has potential to be useful but only if it is fixed
and maintained in the long run, and (quoting the cover letter) "untested,
unvalidated, un-ci, unsupported" are all addressed.

Otherwise I think it is better to remove it and to keep it somewhere else as a
patch if needed in the future, because it is odd to keep code we know not to be
functional.

Francois

> 
> > 
> > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > ---
> >  drivers/gpu/drm/xe/Makefile             |   1 -
> >  drivers/gpu/drm/xe/xe_debugfs.c         |   1 -
> >  drivers/gpu/drm/xe/xe_device.c          |   1 -
> >  drivers/gpu/drm/xe/xe_device.h          |   5 -
> >  drivers/gpu/drm/xe/xe_device_types.h    |   2 -
> >  drivers/gpu/drm/xe/xe_engine.c          |   5 -
> >  drivers/gpu/drm/xe/xe_engine_types.h    |   9 +-
> >  drivers/gpu/drm/xe/xe_execlist.c        | 485 ------------------------
> >  drivers/gpu/drm/xe/xe_execlist.h        |  21 -
> >  drivers/gpu/drm/xe/xe_execlist_types.h  |  49 ---
> >  drivers/gpu/drm/xe/xe_ggtt.c            |   2 +-
> >  drivers/gpu/drm/xe/xe_gt.c              |  12 -
> >  drivers/gpu/drm/xe/xe_guc_pc.c          |   2 -
> >  drivers/gpu/drm/xe/xe_guc_submit.c      |   5 -
> >  drivers/gpu/drm/xe/xe_hw_engine.c       |  16 +-
> >  drivers/gpu/drm/xe/xe_hw_engine_types.h |   2 -
> >  drivers/gpu/drm/xe/xe_irq.c             |  11 +-
> >  drivers/gpu/drm/xe/xe_module.c          |   4 -
> >  drivers/gpu/drm/xe/xe_module.h          |   1 -
> >  drivers/gpu/drm/xe/xe_uc.c              |  32 --
> >  20 files changed, 6 insertions(+), 660 deletions(-)
> >  delete mode 100644 drivers/gpu/drm/xe/xe_execlist.c
> >  delete mode 100644 drivers/gpu/drm/xe/xe_execlist.h
> >  delete mode 100644 drivers/gpu/drm/xe/xe_execlist_types.h
> > 
> > diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> > index 4ea9e3150c20..06d806c8a68d 100644
> > --- a/drivers/gpu/drm/xe/Makefile
> > +++ b/drivers/gpu/drm/xe/Makefile
> > @@ -53,7 +53,6 @@ xe-y += xe_bb.o \
> >  	xe_dma_buf.o \
> >  	xe_engine.o \
> >  	xe_exec.o \
> > -	xe_execlist.o \
> >  	xe_force_wake.o \
> >  	xe_ggtt.o \
> >  	xe_gt.o \
> > diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
> > index 491506a1e12e..313b666c1c6e 100644
> > --- a/drivers/gpu/drm/xe/xe_debugfs.c
> > +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> > @@ -47,7 +47,6 @@ static int info(struct seq_file *m, void *data)
> >  	drm_printf(&p, "revid %d\n", xe->info.revid);
> >  	drm_printf(&p, "tile_count %d\n", xe->info.tile_count);
> >  	drm_printf(&p, "vm_max_level %d\n", xe->info.vm_max_level);
> > -	drm_printf(&p, "force_execlist %s\n", str_yes_no(xe->info.force_execlist));
> >  	drm_printf(&p, "supports_usm %s\n", str_yes_no(xe->info.supports_usm));
> >  	drm_printf(&p, "has_flat_ccs %s\n", str_yes_no(xe->info.has_flat_ccs));
> >  	for_each_gt(gt, xe, id) {
> > diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> > index 7221806c1693..7f7198a3dc6d 100644
> > --- a/drivers/gpu/drm/xe/xe_device.c
> > +++ b/drivers/gpu/drm/xe/xe_device.c
> > @@ -203,7 +203,6 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
> >  
> >  	xe->info.devid = pdev->device;
> >  	xe->info.revid = pdev->revision;
> > -	xe->info.force_execlist = force_execlist;
> >  
> >  	spin_lock_init(&xe->irq.lock);
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> > index 0ee44856ad08..327453781f91 100644
> > --- a/drivers/gpu/drm/xe/xe_device.h
> > +++ b/drivers/gpu/drm/xe/xe_device.h
> > @@ -110,11 +110,6 @@ static inline struct xe_gt *xe_root_mmio_gt(struct xe_device *xe)
> >  	return xe_device_get_root_tile(xe)->primary_gt;
> >  }
> >  
> > -static inline bool xe_device_guc_submission_enabled(struct xe_device *xe)
> > -{
> > -	return !xe->info.force_execlist;
> > -}
> > -
> >  #define for_each_tile(tile__, xe__, id__) \
> >  	for ((id__) = 0; (id__) < (xe__)->info.tile_count; (id__)++) \
> >  		for_each_if((tile__) = &(xe__)->tiles[(id__)])
> > diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> > index b156f69d7320..0432ef995a03 100644
> > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > @@ -217,8 +217,6 @@ struct xe_device {
> >  		u8 supports_usm:1;
> >  		/** @has_asid: Has address space ID */
> >  		u8 has_asid:1;
> > -		/** @force_execlist: Forced execlist submission */
> > -		u8 force_execlist:1;
> >  		/** @has_flat_ccs: Whether flat CCS metadata is used */
> >  		u8 has_flat_ccs:1;
> >  		/** @has_4tile: Whether tile-4 tiling is supported */
> > diff --git a/drivers/gpu/drm/xe/xe_engine.c b/drivers/gpu/drm/xe/xe_engine.c
> > index 59e0a9e085ba..b0218b09ded7 100644
> > --- a/drivers/gpu/drm/xe/xe_engine.c
> > +++ b/drivers/gpu/drm/xe/xe_engine.c
> > @@ -460,16 +460,11 @@ static u32 calc_validate_logical_mask(struct xe_device *xe, struct xe_gt *gt,
> >  				      struct drm_xe_engine_class_instance *eci,
> >  				      u16 width, u16 num_placements)
> >  {
> > -	int len = width * num_placements;
> >  	int i, j, n;
> >  	u16 class;
> >  	u16 gt_id;
> >  	u32 return_mask = 0, prev_mask;
> >  
> > -	if (XE_IOCTL_DBG(xe, !xe_device_guc_submission_enabled(xe) &&
> > -			 len > 1))
> > -		return 0;
> > -
> >  	for (i = 0; i < width; ++i) {
> >  		u32 current_mask = 0;
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_engine_types.h b/drivers/gpu/drm/xe/xe_engine_types.h
> > index 36bfaeec23f4..24cabeb4021b 100644
> > --- a/drivers/gpu/drm/xe/xe_engine_types.h
> > +++ b/drivers/gpu/drm/xe/xe_engine_types.h
> > @@ -14,7 +14,6 @@
> >  #include "xe_hw_fence_types.h"
> >  #include "xe_lrc_types.h"
> >  
> > -struct xe_execlist_engine;
> >  struct xe_gt;
> >  struct xe_guc_engine;
> >  struct xe_hw_engine;
> > @@ -73,12 +72,8 @@ struct xe_engine {
> >  		struct list_head multi_gt_link;
> >  	};
> >  
> > -	union {
> > -		/** @execlist: execlist backend specific state for engine */
> > -		struct xe_execlist_engine *execlist;
> > -		/** @guc: GuC backend specific state for engine */
> > -		struct xe_guc_engine *guc;
> > -	};
> > +	/** @guc: GuC backend specific state for engine */
> > +	struct xe_guc_engine *guc;
> >  
> >  	/**
> >  	 * @persistent: persistent engine state
> > diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
> > deleted file mode 100644
> > index 541f82387bb5..000000000000
> > --- a/drivers/gpu/drm/xe/xe_execlist.c
> > +++ /dev/null
> > @@ -1,485 +0,0 @@
> > -// SPDX-License-Identifier: MIT
> > -/*
> > - * Copyright © 2021 Intel Corporation
> > - */
> > -
> > -#include "xe_execlist.h"
> > -
> > -#include <drm/drm_managed.h>
> > -
> > -#include "regs/xe_engine_regs.h"
> > -#include "regs/xe_gpu_commands.h"
> > -#include "regs/xe_gt_regs.h"
> > -#include "regs/xe_lrc_layout.h"
> > -#include "regs/xe_regs.h"
> > -#include "xe_bo.h"
> > -#include "xe_device.h"
> > -#include "xe_engine.h"
> > -#include "xe_gt.h"
> > -#include "xe_hw_fence.h"
> > -#include "xe_lrc.h"
> > -#include "xe_macros.h"
> > -#include "xe_mmio.h"
> > -#include "xe_mocs.h"
> > -#include "xe_ring_ops_types.h"
> > -#include "xe_sched_job.h"
> > -
> > -#define XE_EXECLIST_HANG_LIMIT 1
> > -
> > -#define GEN11_SW_CTX_ID_SHIFT 37
> > -#define GEN11_SW_CTX_ID_WIDTH 11
> > -#define XEHP_SW_CTX_ID_SHIFT  39
> > -#define XEHP_SW_CTX_ID_WIDTH  16
> > -
> > -#define GEN11_SW_CTX_ID \
> > -	GENMASK_ULL(GEN11_SW_CTX_ID_WIDTH + GEN11_SW_CTX_ID_SHIFT - 1, \
> > -		    GEN11_SW_CTX_ID_SHIFT)
> > -
> > -#define XEHP_SW_CTX_ID \
> > -	GENMASK_ULL(XEHP_SW_CTX_ID_WIDTH + XEHP_SW_CTX_ID_SHIFT - 1, \
> > -		    XEHP_SW_CTX_ID_SHIFT)
> > -
> > -
> > -static void __start_lrc(struct xe_hw_engine *hwe, struct xe_lrc *lrc,
> > -			u32 ctx_id)
> > -{
> > -	struct xe_gt *gt = hwe->gt;
> > -	struct xe_device *xe = gt_to_xe(gt);
> > -	u64 lrc_desc;
> > -
> > -	lrc_desc = xe_lrc_descriptor(lrc);
> > -
> > -	if (GRAPHICS_VERx100(xe) >= 1250) {
> > -		XE_BUG_ON(!FIELD_FIT(XEHP_SW_CTX_ID, ctx_id));
> > -		lrc_desc |= FIELD_PREP(XEHP_SW_CTX_ID, ctx_id);
> > -	} else {
> > -		XE_BUG_ON(!FIELD_FIT(GEN11_SW_CTX_ID, ctx_id));
> > -		lrc_desc |= FIELD_PREP(GEN11_SW_CTX_ID, ctx_id);
> > -	}
> > -
> > -	if (hwe->class == XE_ENGINE_CLASS_COMPUTE)
> > -		xe_mmio_write32(hwe->gt, RCU_MODE,
> > -				_MASKED_BIT_ENABLE(RCU_MODE_CCS_ENABLE));
> > -
> > -	xe_lrc_write_ctx_reg(lrc, CTX_RING_TAIL, lrc->ring.tail);
> > -	lrc->ring.old_tail = lrc->ring.tail;
> > -
> > -	/*
> > -	 * Make sure the context image is complete before we submit it to HW.
> > -	 *
> > -	 * Ostensibly, writes (including the WCB) should be flushed prior to
> > -	 * an uncached write such as our mmio register access, the empirical
> > -	 * evidence (esp. on Braswell) suggests that the WC write into memory
> > -	 * may not be visible to the HW prior to the completion of the UC
> > -	 * register write and that we may begin execution from the context
> > -	 * before its image is complete leading to invalid PD chasing.
> > -	 */
> > -	wmb();
> > -
> > -	xe_mmio_write32(gt, RING_HWS_PGA(hwe->mmio_base),
> > -			xe_bo_ggtt_addr(hwe->hwsp));
> > -	xe_mmio_read32(gt, RING_HWS_PGA(hwe->mmio_base));
> > -	xe_mmio_write32(gt, RING_MODE(hwe->mmio_base),
> > -			_MASKED_BIT_ENABLE(GFX_DISABLE_LEGACY_MODE));
> > -
> > -	xe_mmio_write32(gt, RING_EXECLIST_SQ_CONTENTS_LO(hwe->mmio_base),
> > -			lower_32_bits(lrc_desc));
> > -	xe_mmio_write32(gt, RING_EXECLIST_SQ_CONTENTS_HI(hwe->mmio_base),
> > -			upper_32_bits(lrc_desc));
> > -	xe_mmio_write32(gt, RING_EXECLIST_CONTROL(hwe->mmio_base),
> > -			EL_CTRL_LOAD);
> > -}
> > -
> > -static void __xe_execlist_port_start(struct xe_execlist_port *port,
> > -				     struct xe_execlist_engine *exl)
> > -{
> > -	struct xe_device *xe = gt_to_xe(port->hwe->gt);
> > -	int max_ctx = FIELD_MAX(GEN11_SW_CTX_ID);
> > -
> > -	if (GRAPHICS_VERx100(xe) >= 1250)
> > -		max_ctx = FIELD_MAX(XEHP_SW_CTX_ID);
> > -
> > -	xe_execlist_port_assert_held(port);
> > -
> > -	if (port->running_exl != exl || !exl->has_run) {
> > -		port->last_ctx_id++;
> > -
> > -		/* 0 is reserved for the kernel context */
> > -		if (port->last_ctx_id > max_ctx)
> > -			port->last_ctx_id = 1;
> > -	}
> > -
> > -	__start_lrc(port->hwe, exl->engine->lrc, port->last_ctx_id);
> > -	port->running_exl = exl;
> > -	exl->has_run = true;
> > -}
> > -
> > -static void __xe_execlist_port_idle(struct xe_execlist_port *port)
> > -{
> > -	u32 noop[2] = { MI_NOOP, MI_NOOP };
> > -
> > -	xe_execlist_port_assert_held(port);
> > -
> > -	if (!port->running_exl)
> > -		return;
> > -
> > -	xe_lrc_write_ring(&port->hwe->kernel_lrc, noop, sizeof(noop));
> > -	__start_lrc(port->hwe, &port->hwe->kernel_lrc, 0);
> > -	port->running_exl = NULL;
> > -}
> > -
> > -static bool xe_execlist_is_idle(struct xe_execlist_engine *exl)
> > -{
> > -	struct xe_lrc *lrc = exl->engine->lrc;
> > -
> > -	return lrc->ring.tail == lrc->ring.old_tail;
> > -}
> > -
> > -static void __xe_execlist_port_start_next_active(struct xe_execlist_port *port)
> > -{
> > -	struct xe_execlist_engine *exl = NULL;
> > -	int i;
> > -
> > -	xe_execlist_port_assert_held(port);
> > -
> > -	for (i = ARRAY_SIZE(port->active) - 1; i >= 0; i--) {
> > -		while (!list_empty(&port->active[i])) {
> > -			exl = list_first_entry(&port->active[i],
> > -					       struct xe_execlist_engine,
> > -					       active_link);
> > -			list_del(&exl->active_link);
> > -
> > -			if (xe_execlist_is_idle(exl)) {
> > -				exl->active_priority = DRM_SCHED_PRIORITY_UNSET;
> > -				continue;
> > -			}
> > -
> > -			list_add_tail(&exl->active_link, &port->active[i]);
> > -			__xe_execlist_port_start(port, exl);
> > -			return;
> > -		}
> > -	}
> > -
> > -	__xe_execlist_port_idle(port);
> > -}
> > -
> > -static u64 read_execlist_status(struct xe_hw_engine *hwe)
> > -{
> > -	struct xe_gt *gt = hwe->gt;
> > -	u32 hi, lo;
> > -
> > -	lo = xe_mmio_read32(gt, RING_EXECLIST_STATUS_LO(hwe->mmio_base));
> > -	hi = xe_mmio_read32(gt, RING_EXECLIST_STATUS_HI(hwe->mmio_base));
> > -
> > -	return lo | (u64)hi << 32;
> > -}
> > -
> > -static void xe_execlist_port_irq_handler_locked(struct xe_execlist_port *port)
> > -{
> > -	u64 status;
> > -
> > -	xe_execlist_port_assert_held(port);
> > -
> > -	status = read_execlist_status(port->hwe);
> > -	if (status & BIT(7))
> > -		return;
> > -
> > -	__xe_execlist_port_start_next_active(port);
> > -}
> > -
> > -static void xe_execlist_port_irq_handler(struct xe_hw_engine *hwe,
> > -					 u16 intr_vec)
> > -{
> > -	struct xe_execlist_port *port = hwe->exl_port;
> > -
> > -	spin_lock(&port->lock);
> > -	xe_execlist_port_irq_handler_locked(port);
> > -	spin_unlock(&port->lock);
> > -}
> > -
> > -static void xe_execlist_port_wake_locked(struct xe_execlist_port *port,
> > -					 enum drm_sched_priority priority)
> > -{
> > -	xe_execlist_port_assert_held(port);
> > -
> > -	if (port->running_exl && port->running_exl->active_priority >= priority)
> > -		return;
> > -
> > -	__xe_execlist_port_start_next_active(port);
> > -}
> > -
> > -static void xe_execlist_make_active(struct xe_execlist_engine *exl)
> > -{
> > -	struct xe_execlist_port *port = exl->port;
> > -	enum drm_sched_priority priority = exl->entity.priority;
> > -
> > -	XE_BUG_ON(priority == DRM_SCHED_PRIORITY_UNSET);
> > -	XE_BUG_ON(priority < 0);
> > -	XE_BUG_ON(priority >= ARRAY_SIZE(exl->port->active));
> > -
> > -	spin_lock_irq(&port->lock);
> > -
> > -	if (exl->active_priority != priority &&
> > -	    exl->active_priority != DRM_SCHED_PRIORITY_UNSET) {
> > -		/* Priority changed, move it to the right list */
> > -		list_del(&exl->active_link);
> > -		exl->active_priority = DRM_SCHED_PRIORITY_UNSET;
> > -	}
> > -
> > -	if (exl->active_priority == DRM_SCHED_PRIORITY_UNSET) {
> > -		exl->active_priority = priority;
> > -		list_add_tail(&exl->active_link, &port->active[priority]);
> > -	}
> > -
> > -	xe_execlist_port_wake_locked(exl->port, priority);
> > -
> > -	spin_unlock_irq(&port->lock);
> > -}
> > -
> > -static void xe_execlist_port_irq_fail_timer(struct timer_list *timer)
> > -{
> > -	struct xe_execlist_port *port =
> > -		container_of(timer, struct xe_execlist_port, irq_fail);
> > -
> > -	spin_lock_irq(&port->lock);
> > -	xe_execlist_port_irq_handler_locked(port);
> > -	spin_unlock_irq(&port->lock);
> > -
> > -	port->irq_fail.expires = jiffies + msecs_to_jiffies(1000);
> > -	add_timer(&port->irq_fail);
> > -}
> > -
> > -struct xe_execlist_port *xe_execlist_port_create(struct xe_device *xe,
> > -						 struct xe_hw_engine *hwe)
> > -{
> > -	struct drm_device *drm = &xe->drm;
> > -	struct xe_execlist_port *port;
> > -	int i;
> > -
> > -	port = drmm_kzalloc(drm, sizeof(*port), GFP_KERNEL);
> > -	if (!port)
> > -		return ERR_PTR(-ENOMEM);
> > -
> > -	port->hwe = hwe;
> > -
> > -	spin_lock_init(&port->lock);
> > -	for (i = 0; i < ARRAY_SIZE(port->active); i++)
> > -		INIT_LIST_HEAD(&port->active[i]);
> > -
> > -	port->last_ctx_id = 1;
> > -	port->running_exl = NULL;
> > -
> > -	hwe->irq_handler = xe_execlist_port_irq_handler;
> > -
> > -	/* TODO: Fix the interrupt code so it doesn't race like mad */
> > -	timer_setup(&port->irq_fail, xe_execlist_port_irq_fail_timer, 0);
> > -	port->irq_fail.expires = jiffies + msecs_to_jiffies(1000);
> > -	add_timer(&port->irq_fail);
> > -
> > -	return port;
> > -}
> > -
> > -void xe_execlist_port_destroy(struct xe_execlist_port *port)
> > -{
> > -	del_timer(&port->irq_fail);
> > -
> > -	/* Prevent an interrupt while we're destroying */
> > -	spin_lock_irq(&gt_to_xe(port->hwe->gt)->irq.lock);
> > -	port->hwe->irq_handler = NULL;
> > -	spin_unlock_irq(&gt_to_xe(port->hwe->gt)->irq.lock);
> > -}
> > -
> > -static struct dma_fence *
> > -execlist_run_job(struct drm_sched_job *drm_job)
> > -{
> > -	struct xe_sched_job *job = to_xe_sched_job(drm_job);
> > -	struct xe_engine *e = job->engine;
> > -	struct xe_execlist_engine *exl = job->engine->execlist;
> > -
> > -	e->ring_ops->emit_job(job);
> > -	xe_execlist_make_active(exl);
> > -
> > -	return dma_fence_get(job->fence);
> > -}
> > -
> > -static void execlist_job_free(struct drm_sched_job *drm_job)
> > -{
> > -	struct xe_sched_job *job = to_xe_sched_job(drm_job);
> > -
> > -	xe_sched_job_put(job);
> > -}
> > -
> > -static const struct drm_sched_backend_ops drm_sched_ops = {
> > -	.run_job = execlist_run_job,
> > -	.free_job = execlist_job_free,
> > -};
> > -
> > -static int execlist_engine_init(struct xe_engine *e)
> > -{
> > -	struct drm_gpu_scheduler *sched;
> > -	struct xe_execlist_engine *exl;
> > -	struct xe_device *xe = gt_to_xe(e->gt);
> > -	int err;
> > -
> > -	XE_BUG_ON(xe_device_guc_submission_enabled(xe));
> > -
> > -	drm_info(&xe->drm, "Enabling execlist submission (GuC submission disabled)\n");
> > -
> > -	exl = kzalloc(sizeof(*exl), GFP_KERNEL);
> > -	if (!exl)
> > -		return -ENOMEM;
> > -
> > -	exl->engine = e;
> > -
> > -	err = drm_sched_init(&exl->sched, &drm_sched_ops, NULL,
> > -			     e->lrc[0].ring.size / MAX_JOB_SIZE_BYTES,
> > -			     XE_SCHED_HANG_LIMIT, XE_SCHED_JOB_TIMEOUT,
> > -			     NULL, NULL, e->hwe->name,
> > -			     DRM_SCHED_POLICY_SINGLE_ENTITY,
> > -			     gt_to_xe(e->gt)->drm.dev);
> > -	if (err)
> > -		goto err_free;
> > -
> > -	sched = &exl->sched;
> > -	err = drm_sched_entity_init(&exl->entity, DRM_SCHED_PRIORITY_NORMAL,
> > -				    &sched, 1, NULL);
> > -	if (err)
> > -		goto err_sched;
> > -
> > -	exl->port = e->hwe->exl_port;
> > -	exl->has_run = false;
> > -	exl->active_priority = DRM_SCHED_PRIORITY_UNSET;
> > -	e->execlist = exl;
> > -	e->entity = &exl->entity;
> > -
> > -	switch (e->class) {
> > -	case XE_ENGINE_CLASS_RENDER:
> > -		sprintf(e->name, "rcs%d", ffs(e->logical_mask) - 1);
> > -		break;
> > -	case XE_ENGINE_CLASS_VIDEO_DECODE:
> > -		sprintf(e->name, "vcs%d", ffs(e->logical_mask) - 1);
> > -		break;
> > -	case XE_ENGINE_CLASS_VIDEO_ENHANCE:
> > -		sprintf(e->name, "vecs%d", ffs(e->logical_mask) - 1);
> > -		break;
> > -	case XE_ENGINE_CLASS_COPY:
> > -		sprintf(e->name, "bcs%d", ffs(e->logical_mask) - 1);
> > -		break;
> > -	case XE_ENGINE_CLASS_COMPUTE:
> > -		sprintf(e->name, "ccs%d", ffs(e->logical_mask) - 1);
> > -		break;
> > -	default:
> > -		XE_WARN_ON(e->class);
> > -	}
> > -
> > -	return 0;
> > -
> > -err_sched:
> > -	drm_sched_fini(&exl->sched);
> > -err_free:
> > -	kfree(exl);
> > -	return err;
> > -}
> > -
> > -static void execlist_engine_fini_async(struct work_struct *w)
> > -{
> > -	struct xe_execlist_engine *ee =
> > -		container_of(w, struct xe_execlist_engine, fini_async);
> > -	struct xe_engine *e = ee->engine;
> > -	struct xe_execlist_engine *exl = e->execlist;
> > -	unsigned long flags;
> > -
> > -	XE_BUG_ON(xe_device_guc_submission_enabled(gt_to_xe(e->gt)));
> > -
> > -	spin_lock_irqsave(&exl->port->lock, flags);
> > -	if (WARN_ON(exl->active_priority != DRM_SCHED_PRIORITY_UNSET))
> > -		list_del(&exl->active_link);
> > -	spin_unlock_irqrestore(&exl->port->lock, flags);
> > -
> > -	if (e->flags & ENGINE_FLAG_PERSISTENT)
> > -		xe_device_remove_persistent_engines(gt_to_xe(e->gt), e);
> > -	drm_sched_entity_fini(&exl->entity);
> > -	drm_sched_fini(&exl->sched);
> > -	kfree(exl);
> > -
> > -	xe_engine_fini(e);
> > -}
> > -
> > -static void execlist_engine_kill(struct xe_engine *e)
> > -{
> > -	/* NIY */
> > -}
> > -
> > -static void execlist_engine_fini(struct xe_engine *e)
> > -{
> > -	INIT_WORK(&e->execlist->fini_async, execlist_engine_fini_async);
> > -	queue_work(system_unbound_wq, &e->execlist->fini_async);
> > -}
> > -
> > -static int execlist_engine_set_priority(struct xe_engine *e,
> > -					enum drm_sched_priority priority)
> > -{
> > -	/* NIY */
> > -	return 0;
> > -}
> > -
> > -static int execlist_engine_set_timeslice(struct xe_engine *e, u32 timeslice_us)
> > -{
> > -	/* NIY */
> > -	return 0;
> > -}
> > -
> > -static int execlist_engine_set_preempt_timeout(struct xe_engine *e,
> > -					       u32 preempt_timeout_us)
> > -{
> > -	/* NIY */
> > -	return 0;
> > -}
> > -
> > -static int execlist_engine_set_job_timeout(struct xe_engine *e,
> > -					   u32 job_timeout_ms)
> > -{
> > -	/* NIY */
> > -	return 0;
> > -}
> > -
> > -static int execlist_engine_suspend(struct xe_engine *e)
> > -{
> > -	/* NIY */
> > -	return 0;
> > -}
> > -
> > -static void execlist_engine_suspend_wait(struct xe_engine *e)
> > -
> > -{
> > -	/* NIY */
> > -}
> > -
> > -static void execlist_engine_resume(struct xe_engine *e)
> > -{
> > -	/* NIY */
> > -}
> > -
> > -static const struct xe_engine_ops execlist_engine_ops = {
> > -	.init = execlist_engine_init,
> > -	.kill = execlist_engine_kill,
> > -	.fini = execlist_engine_fini,
> > -	.set_priority = execlist_engine_set_priority,
> > -	.set_timeslice = execlist_engine_set_timeslice,
> > -	.set_preempt_timeout = execlist_engine_set_preempt_timeout,
> > -	.set_job_timeout = execlist_engine_set_job_timeout,
> > -	.suspend = execlist_engine_suspend,
> > -	.suspend_wait = execlist_engine_suspend_wait,
> > -	.resume = execlist_engine_resume,
> > -};
> > -
> > -int xe_execlist_init(struct xe_gt *gt)
> > -{
> > -	/* GuC submission enabled, nothing to do */
> > -	if (xe_device_guc_submission_enabled(gt_to_xe(gt)))
> > -		return 0;
> > -
> > -	gt->engine_ops = &execlist_engine_ops;
> > -
> > -	return 0;
> > -}
> > diff --git a/drivers/gpu/drm/xe/xe_execlist.h b/drivers/gpu/drm/xe/xe_execlist.h
> > deleted file mode 100644
> > index 26f600ac8552..000000000000
> > --- a/drivers/gpu/drm/xe/xe_execlist.h
> > +++ /dev/null
> > @@ -1,21 +0,0 @@
> > -/* SPDX-License-Identifier: MIT */
> > -/*
> > - * Copyright © 2021 Intel Corporation
> > - */
> > -
> > -#ifndef _XE_EXECLIST_H_
> > -#define _XE_EXECLIST_H_
> > -
> > -#include "xe_execlist_types.h"
> > -
> > -struct xe_device;
> > -struct xe_gt;
> > -
> > -#define xe_execlist_port_assert_held(port) lockdep_assert_held(&(port)->lock)
> > -
> > -int xe_execlist_init(struct xe_gt *gt);
> > -struct xe_execlist_port *xe_execlist_port_create(struct xe_device *xe,
> > -						 struct xe_hw_engine *hwe);
> > -void xe_execlist_port_destroy(struct xe_execlist_port *port);
> > -
> > -#endif
> > diff --git a/drivers/gpu/drm/xe/xe_execlist_types.h b/drivers/gpu/drm/xe/xe_execlist_types.h
> > deleted file mode 100644
> > index 05a620940209..000000000000
> > --- a/drivers/gpu/drm/xe/xe_execlist_types.h
> > +++ /dev/null
> > @@ -1,49 +0,0 @@
> > -/* SPDX-License-Identifier: MIT */
> > -/*
> > - * Copyright © 2022 Intel Corporation
> > - */
> > -
> > -#ifndef _XE_EXECLIST_TYPES_H_
> > -#define _XE_EXECLIST_TYPES_H_
> > -
> > -#include <linux/list.h>
> > -#include <linux/spinlock.h>
> > -#include <linux/workqueue.h>
> > -
> > -#include <drm/gpu_scheduler.h>
> > -
> > -struct xe_hw_engine;
> > -struct xe_execlist_engine;
> > -
> > -struct xe_execlist_port {
> > -	struct xe_hw_engine *hwe;
> > -
> > -	spinlock_t lock;
> > -
> > -	struct list_head active[DRM_SCHED_PRIORITY_COUNT];
> > -
> > -	u32 last_ctx_id;
> > -
> > -	struct xe_execlist_engine *running_exl;
> > -
> > -	struct timer_list irq_fail;
> > -};
> > -
> > -struct xe_execlist_engine {
> > -	struct xe_engine *engine;
> > -
> > -	struct drm_gpu_scheduler sched;
> > -
> > -	struct drm_sched_entity entity;
> > -
> > -	struct xe_execlist_port *port;
> > -
> > -	bool has_run;
> > -
> > -	struct work_struct fini_async;
> > -
> > -	enum drm_sched_priority active_priority;
> > -	struct list_head active_link;
> > -};
> > -
> > -#endif
> > diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> > index e1b84bc25375..01164eb25a10 100644
> > --- a/drivers/gpu/drm/xe/xe_ggtt.c
> > +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> > @@ -234,7 +234,7 @@ static void ggtt_invalidate_gt_tlb(struct xe_gt *gt)
> >  		XE_WARN_ON(seqno <= 0);
> >  		if (seqno > 0)
> >  			xe_gt_tlb_invalidation_wait(gt, seqno);
> > -	} else if (xe_device_guc_submission_enabled(gt_to_xe(gt))) {
> > +	} else {
> >  		struct xe_device *xe = gt_to_xe(gt);
> >  
> >  		if (xe->info.platform == XE_PVC) {
> > diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> > index 3e32d38aeeea..1b54344fe78f 100644
> > --- a/drivers/gpu/drm/xe/xe_gt.c
> > +++ b/drivers/gpu/drm/xe/xe_gt.c
> > @@ -14,7 +14,6 @@
> >  #include "xe_bo.h"
> >  #include "xe_device.h"
> >  #include "xe_engine.h"
> > -#include "xe_execlist.h"
> >  #include "xe_force_wake.h"
> >  #include "xe_ggtt.h"
> >  #include "xe_gt_clock.h"
> > @@ -355,9 +354,6 @@ static int all_fw_domain_init(struct xe_gt *gt)
> >  		goto err_force_wake;
> >  
> >  	xe_mocs_init(gt);
> > -	err = xe_execlist_init(gt);
> > -	if (err)
> > -		goto err_force_wake;
> >  
> >  	err = xe_hw_engines_init(gt);
> >  	if (err)
> > @@ -504,10 +500,6 @@ static int gt_reset(struct xe_gt *gt)
> >  {
> >  	int err;
> >  
> > -	/* We only support GT resets with GuC submission */
> > -	if (!xe_device_guc_submission_enabled(gt_to_xe(gt)))
> > -		return -ENODEV;
> > -
> >  	xe_gt_info(gt, "reset started\n");
> >  
> >  	xe_gt_sanitize(gt);
> > @@ -587,10 +579,6 @@ int xe_gt_suspend(struct xe_gt *gt)
> >  {
> >  	int err;
> >  
> > -	/* For now suspend/resume is only allowed with GuC */
> > -	if (!xe_device_guc_submission_enabled(gt_to_xe(gt)))
> > -		return -ENODEV;
> > -
> >  	xe_gt_sanitize(gt);
> >  
> >  	xe_device_mem_access_get(gt_to_xe(gt));
> > diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> > index 91a3967fd799..3e442b1619df 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> > @@ -814,8 +814,6 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
> >  	u32 size = PAGE_ALIGN(sizeof(struct slpc_shared_data));
> >  	int ret;
> >  
> > -	XE_WARN_ON(!xe_device_guc_submission_enabled(xe));
> > -
> >  	xe_device_mem_access_get(pc_to_xe(pc));
> >  
> >  	memset(pc->bo->vmap.vaddr, 0, size);
> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > index 911d4965c27c..390a29b2fa70 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > @@ -1118,8 +1118,6 @@ static int guc_engine_init(struct xe_engine *e)
> >  	long timeout;
> >  	int err;
> >  
> > -	XE_BUG_ON(!xe_device_guc_submission_enabled(guc_to_xe(guc)));
> > -
> >  	ge = kzalloc(sizeof(*ge), GFP_KERNEL);
> >  	if (!ge)
> >  		return -ENOMEM;
> > @@ -1899,9 +1897,6 @@ void xe_guc_submit_print(struct xe_guc *guc, struct drm_printer *p)
> >  	struct xe_engine *e;
> >  	unsigned long index;
> >  
> > -	if (!xe_device_guc_submission_enabled(guc_to_xe(guc)))
> > -		return;
> > -
> >  	mutex_lock(&guc->submission_state.lock);
> >  	xa_for_each(&guc->submission_state.engine_lookup, index, e)
> >  		guc_engine_print(e, p);
> > diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> > index 1af5cccd1142..0c7bf79ed767 100644
> > --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> > +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> > @@ -12,7 +12,6 @@
> >  #include "regs/xe_regs.h"
> >  #include "xe_bo.h"
> >  #include "xe_device.h"
> > -#include "xe_execlist.h"
> >  #include "xe_force_wake.h"
> >  #include "xe_gt.h"
> >  #include "xe_gt_topology.h"
> > @@ -225,8 +224,6 @@ static void hw_engine_fini(struct drm_device *drm, void *arg)
> >  {
> >  	struct xe_hw_engine *hwe = arg;
> >  
> > -	if (hwe->exl_port)
> > -		xe_execlist_port_destroy(hwe->exl_port);
> >  	xe_lrc_finish(&hwe->kernel_lrc);
> >  
> >  	xe_bo_unpin_map_no_vm(hwe->hwsp);
> > @@ -395,16 +392,7 @@ static int hw_engine_init(struct xe_gt *gt, struct xe_hw_engine *hwe,
> >  	if (err)
> >  		goto err_hwsp;
> >  
> > -	if (!xe_device_guc_submission_enabled(xe)) {
> > -		hwe->exl_port = xe_execlist_port_create(xe, hwe);
> > -		if (IS_ERR(hwe->exl_port)) {
> > -			err = PTR_ERR(hwe->exl_port);
> > -			goto err_kernel_lrc;
> > -		}
> > -	}
> > -
> > -	if (xe_device_guc_submission_enabled(xe))
> > -		xe_hw_engine_enable_ring(hwe);
> > +	xe_hw_engine_enable_ring(hwe);
> >  
> >  	/* We reserve the highest BCS instance for USM */
> >  	if (xe->info.supports_usm && hwe->class == XE_ENGINE_CLASS_COPY)
> > @@ -416,8 +404,6 @@ static int hw_engine_init(struct xe_gt *gt, struct xe_hw_engine *hwe,
> >  
> >  	return 0;
> >  
> > -err_kernel_lrc:
> > -	xe_lrc_finish(&hwe->kernel_lrc);
> >  err_hwsp:
> >  	xe_bo_unpin_map_no_vm(hwe->hwsp);
> >  err_name:
> > diff --git a/drivers/gpu/drm/xe/xe_hw_engine_types.h b/drivers/gpu/drm/xe/xe_hw_engine_types.h
> > index 803d557cf5aa..0ebbe5ae2419 100644
> > --- a/drivers/gpu/drm/xe/xe_hw_engine_types.h
> > +++ b/drivers/gpu/drm/xe/xe_hw_engine_types.h
> > @@ -99,8 +99,6 @@ struct xe_hw_engine {
> >  	struct xe_bo *hwsp;
> >  	/** @kernel_lrc: Kernel LRC (should be replaced /w an xe_engine) */
> >  	struct xe_lrc kernel_lrc;
> > -	/** @exl_port: execlists port */
> > -	struct xe_execlist_port *exl_port;
> >  	/** @fence_irq: fence IRQ to run when a hw engine IRQ is received */
> >  	struct xe_hw_fence_irq *fence_irq;
> >  	/** @irq_handler: IRQ handler to run when hw engine IRQ is received */
> > diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
> > index eae190cb0969..5b00dd9ea31e 100644
> > --- a/drivers/gpu/drm/xe/xe_irq.c
> > +++ b/drivers/gpu/drm/xe/xe_irq.c
> > @@ -129,15 +129,8 @@ void xe_irq_enable_hwe(struct xe_gt *gt)
> >  	u32 ccs_mask, bcs_mask;
> >  	u32 irqs, dmask, smask;
> >  
> > -	if (xe_device_guc_submission_enabled(xe)) {
> > -		irqs = GT_RENDER_USER_INTERRUPT |
> > -			GT_RENDER_PIPECTL_NOTIFY_INTERRUPT;
> > -	} else {
> > -		irqs = GT_RENDER_USER_INTERRUPT |
> > -		       GT_CS_MASTER_ERROR_INTERRUPT |
> > -		       GT_CONTEXT_SWITCH_INTERRUPT |
> > -		       GT_WAIT_SEMAPHORE_INTERRUPT;
> > -	}
> > +	irqs = GT_RENDER_USER_INTERRUPT |
> > +		GT_RENDER_PIPECTL_NOTIFY_INTERRUPT;
> >  
> >  	ccs_mask = xe_hw_engine_mask_per_class(gt, XE_ENGINE_CLASS_COMPUTE);
> >  	bcs_mask = xe_hw_engine_mask_per_class(gt, XE_ENGINE_CLASS_COPY);
> > diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
> > index de85494e2280..81f2379935db 100644
> > --- a/drivers/gpu/drm/xe/xe_module.c
> > +++ b/drivers/gpu/drm/xe/xe_module.c
> > @@ -14,10 +14,6 @@
> >  #include "xe_pci.h"
> >  #include "xe_sched_job.h"
> >  
> > -bool force_execlist = false;
> > -module_param_named_unsafe(force_execlist, force_execlist, bool, 0444);
> > -MODULE_PARM_DESC(force_execlist, "Force Execlist submission");
> > -
> >  bool enable_display = true;
> >  module_param_named(enable_display, enable_display, bool, 0444);
> >  MODULE_PARM_DESC(enable_display, "Enable display");
> > diff --git a/drivers/gpu/drm/xe/xe_module.h b/drivers/gpu/drm/xe/xe_module.h
> > index 2c1f9199f909..33ee4add5e87 100644
> > --- a/drivers/gpu/drm/xe/xe_module.h
> > +++ b/drivers/gpu/drm/xe/xe_module.h
> > @@ -6,7 +6,6 @@
> >  #include <linux/types.h>
> >  
> >  /* Module modprobe variables */
> > -extern bool force_execlist;
> >  extern bool enable_display;
> >  extern u32 xe_force_vram_bar_size;
> >  extern int xe_guc_log_level;
> > diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
> > index addd6f2681b9..f27059d96602 100644
> > --- a/drivers/gpu/drm/xe/xe_uc.c
> > +++ b/drivers/gpu/drm/xe/xe_uc.c
> > @@ -31,10 +31,6 @@ int xe_uc_init(struct xe_uc *uc)
> >  {
> >  	int ret;
> >  
> > -	/* GuC submission not enabled, nothing to do */
> > -	if (!xe_device_guc_submission_enabled(uc_to_xe(uc)))
> > -		return 0;
> > -
> >  	ret = xe_guc_init(&uc->guc);
> >  	if (ret)
> >  		goto err;
> > @@ -65,10 +61,6 @@ int xe_uc_init(struct xe_uc *uc)
> >   */
> >  int xe_uc_init_post_hwconfig(struct xe_uc *uc)
> >  {
> > -	/* GuC submission not enabled, nothing to do */
> > -	if (!xe_device_guc_submission_enabled(uc_to_xe(uc)))
> > -		return 0;
> > -
> >  	return xe_guc_init_post_hwconfig(&uc->guc);
> >  }
> >  
> > @@ -109,10 +101,6 @@ int xe_uc_init_hwconfig(struct xe_uc *uc)
> >  {
> >  	int ret;
> >  
> > -	/* GuC submission not enabled, nothing to do */
> > -	if (!xe_device_guc_submission_enabled(uc_to_xe(uc)))
> > -		return 0;
> > -
> >  	ret = xe_guc_min_load_for_hwconfig(&uc->guc);
> >  	if (ret)
> >  		return ret;
> > @@ -128,10 +116,6 @@ int xe_uc_init_hw(struct xe_uc *uc)
> >  {
> >  	int ret;
> >  
> > -	/* GuC submission not enabled, nothing to do */
> > -	if (!xe_device_guc_submission_enabled(uc_to_xe(uc)))
> > -		return 0;
> > -
> >  	ret = xe_uc_sanitize_reset(uc);
> >  	if (ret)
> >  		return ret;
> > @@ -169,10 +153,6 @@ int xe_uc_init_hw(struct xe_uc *uc)
> >  
> >  int xe_uc_reset_prepare(struct xe_uc *uc)
> >  {
> > -	/* GuC submission not enabled, nothing to do */
> > -	if (!xe_device_guc_submission_enabled(uc_to_xe(uc)))
> > -		return 0;
> > -
> >  	return xe_guc_reset_prepare(&uc->guc);
> >  }
> >  
> > @@ -188,19 +168,11 @@ void xe_uc_stop_prepare(struct xe_uc *uc)
> >  
> >  int xe_uc_stop(struct xe_uc *uc)
> >  {
> > -	/* GuC submission not enabled, nothing to do */
> > -	if (!xe_device_guc_submission_enabled(uc_to_xe(uc)))
> > -		return 0;
> > -
> >  	return xe_guc_stop(&uc->guc);
> >  }
> >  
> >  int xe_uc_start(struct xe_uc *uc)
> >  {
> > -	/* GuC submission not enabled, nothing to do */
> > -	if (!xe_device_guc_submission_enabled(uc_to_xe(uc)))
> > -		return 0;
> > -
> >  	return xe_guc_start(&uc->guc);
> >  }
> >  
> > @@ -220,10 +192,6 @@ int xe_uc_suspend(struct xe_uc *uc)
> >  {
> >  	int ret;
> >  
> > -	/* GuC submission not enabled, nothing to do */
> > -	if (!xe_device_guc_submission_enabled(uc_to_xe(uc)))
> > -		return 0;
> > -
> >  	uc_reset_wait(uc);
> >  
> >  	ret = xe_uc_stop(uc);
> 
