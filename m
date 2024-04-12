Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B041C4345F
	for <intel-xe@archiver.kernel.org>; Fri, 12 Apr 2024 23:46:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45F7A10F973;
	Fri, 12 Apr 2024 23:46:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ak0holu1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AFBE10F973
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Apr 2024 23:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712965611; x=1744501611;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=1ABAfU7Q3IvzAiUI6pc9QuZFzpBbdchUs2TkpL/kNcU=;
 b=ak0holu1ClRoRKlWcesEdhaSvcMRyQzj9xrrxWglHJiZ4MBSzbTxi0LX
 GtRuN0/x0te4N4St6dfWeN8b2DWG382gW1UwcBG/qhP76EI1ugCFpI7y9
 9o95ALTBnC6o8BUOCE//ksp0r2wkYQ9anzeN6xZNpNtuLRAmMoiXctNsZ
 3c/8t7TmL+iwYbRwvHYQvIG1LvXH+B8s0wHqCbvK6iEYRMzOTqL9frFtD
 68mq+nHeLJl7kVSNTS7BPnMywZeRPbyGzGi9FRHoIJzo6AWA/XVv0VuR4
 QpyKjU/ndVLZ0ITXHaumKxd7H7gdqspyedohJUrlRCz6DmPcOXa3WD6FR A==;
X-CSE-ConnectionGUID: CQoVq2SKRxWKp3/qLqOMXA==
X-CSE-MsgGUID: Ac8SyqXWSnyTaTs77SH+Eg==
X-IronPort-AV: E=McAfee;i="6600,9927,11042"; a="8299430"
X-IronPort-AV: E=Sophos;i="6.07,197,1708416000"; 
   d="scan'208";a="8299430"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2024 16:46:51 -0700
X-CSE-ConnectionGUID: dUHU4mUQSL+gvKIwOWtiSw==
X-CSE-MsgGUID: AQG2nl+jQoqQorHO19L28A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,197,1708416000"; d="scan'208";a="25795512"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Apr 2024 16:46:52 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 12 Apr 2024 16:46:50 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 12 Apr 2024 16:46:49 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 12 Apr 2024 16:46:49 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 12 Apr 2024 16:46:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GMKZl/uPTEu7oL8q5sdMfNB8LWO2eyvstjaH4AkWz244UPy4gCa6UOLEAc5DDA5e0KnI5zaJ56o03kjmaMx6X90TzI8AXV1LpmLbVFmzoSVgVo3IC95pcGFsmoWNZVAcFyLTuqLVCcMXNSCm9Akl0GEU8uxImaI63Jeet7cFDv8vncdccZnvaOY/Rux6srau/CrN5YYLtpBvGTBlRS2h/4l3Ky7pyo3qGQI4HTH2loh1sNWTm9FeHmIKadsxYbBTh8R4WFfxmJqvDfU3rOqQGE78qhL/kc1M3j5YcEA1fSkMb/sCHRX98zfnQKISjrGKZKas16M35YcqccmypaU2xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+U9Iog7M5aL09WVSLKWnEYSvXXvAJwwomxLfDh9VMgA=;
 b=TDqkl4Bt4lgkZvuV5Sk1MuSNNmGn/U0hC+v7K+ECbhD7gG+xQtRgQC7ZIYgPrJAifg0zGHNX0ebjcg3Y9UlsSaNl2SPkl6WuvZDjGA22WJ7gmZ2OPYK1doEjE9xy35GfRi0zIDvmlSRXHoIhGbq1MlFU8vSFlHZE1sVj6CkC+wynUU7DagDsdEL96fWXJtOXmXM92M55PWXvNhCEviwA4AHoVdOQSN9FS9dpIPVh9LXG1ztyhVugFdP4L0fcRCinMsi/x0TCrg+X/P7WFBHrO5BcX/tlOCes0orDqxYkjMy6+HC94c7eAuytfNpf7WYpnDdG/GtfZG3qrOnktoA61A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ0PR11MB6766.namprd11.prod.outlook.com (2603:10b6:a03:47c::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.31; Fri, 12 Apr
 2024 23:46:47 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7452.019; Fri, 12 Apr 2024
 23:46:47 +0000
Date: Fri, 12 Apr 2024 23:45:32 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
CC: "Summers, Stuart" <stuart.summers@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Harrison, 
 John C" <john.c.harrison@intel.com>, "Gupta, saurabhg"
 <saurabhg.gupta@intel.com>, "De Marchi, Lucas" <lucas.demarchi@intel.com>
Subject: Re: [PATCH v4 2/3] drm/xe/xe_guc_submit: Allow lr exec queues to be
 banned
Message-ID: <ZhnHnMO8gsppdwg4@DUT025-TGLU.fm.intel.com>
References: <20240405175505.1161756-1-jonathan.cavitt@intel.com>
 <20240405175505.1161756-2-jonathan.cavitt@intel.com>
 <682a2bc1206df21d50611442ff2bced0aef71e27.camel@intel.com>
 <BL1PR11MB544510DC6F6F4F2644E2DA0DE5042@BL1PR11MB5445.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BL1PR11MB544510DC6F6F4F2644E2DA0DE5042@BL1PR11MB5445.namprd11.prod.outlook.com>
X-ClientProxiedBy: BYAPR21CA0027.namprd21.prod.outlook.com
 (2603:10b6:a03:114::37) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ0PR11MB6766:EE_
X-MS-Office365-Filtering-Correlation-Id: 9bc37ec6-b912-404a-ba44-08dc5b4ad112
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xpiXvRUqfA8ExHK+9ZAUmvU3PN8hpnHtOKvxIu3mY4lwSYbCoM3l/RGJCn1X83sHNNa+m2z5Jb2pSzX9cjHeerFIr5F5WJbzygABnw/fvyyGtSEFvqfeAcLpx6HrjFvWiEnnzIFxFnLqL/EdRveKRDiItZ1ZFvTzV7yozeS4I1wfVN5WxLCV5zJwyrAdP4XSaUiTHkUrrvjemZl8CB+kH+1OhgwkTFepcgTBs4dVJ32TA2Ncx9UptKUCv96TFJtPnWBqGD3HHTX9rbCu6t9gPY7egHS9/zCo9w2RidjiDwn5cB2cdezTkUp1sbkTaFeK9Q5742fjIEFw+fuoy4iO6HZUD0AQkvwfZIyX19QslfhLrYXvTAlsi3MM/ac0w4R90nOXc/QeZ6UZLcwZzt33z/XDqY8Fs8S9UmDFZFSziVgogAtiMYwG2iUTXDa87/zhTanJJo/QI8tFS4iRKJOIbLQ3AFYg7SeKADlRl+9ItumtpYQdl/hAu8O6T46TA+RoQAN61YqRoPruYWkvwr0XWnqO8SQdvfN1H9w04rgwsaRP5/hV+I9JCeinH4RnrnHS6wR9pgNUvIdFtqwfSe7So0DcHd+Ni+kD7VAGw5jl9njBru726PPK7Tl1p1E4mTVJ/zdH83SbW7PLtlOcSfFch4LBAmHidgb7pN7WYzdGMdE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?1TNZulNpJCGv0rdMnPwCgVjWaqfw+bBADHLgwO6CoYIPZngX9duc6fkQZE?=
 =?iso-8859-1?Q?lUB3KSaG/2mxL4PC1REEbEvdK1FNWA2sxPE6l7pn4+/kci3MPhc3tzbswO?=
 =?iso-8859-1?Q?wQBjQJAp9kNzDzowA8p0mwSQuf14m0MtgXGhob7xGLEDQxeVmzFqQREI4O?=
 =?iso-8859-1?Q?nU2koMpF4Nn0vZCRecpskv3GTN8d3VqHG/rdgh0JQRTGJtMvOYe9Nfn29F?=
 =?iso-8859-1?Q?yaPOjs7g51XTCTUmGB7HU4xx4v3ucUwZ0pZwhUzDht7XUeroUoPzcGudv3?=
 =?iso-8859-1?Q?PS8NuLTDo3zsSEuv57evSImaBKr7Z0Kh9xPgObFDRX5yTQdxaXLvnZII0s?=
 =?iso-8859-1?Q?pLKGuSCYQypUrvrRVjEZmETjzLRWG3QYChqznwEApXL2w4FBd2fh8IzlKN?=
 =?iso-8859-1?Q?CLLzYQUIMMOfgDwW8ycjRJ3kLe1oaK139sORH/Xu2Exjq5L2aCgeMyXolN?=
 =?iso-8859-1?Q?tkYbE/eqTspbCjgN6WeHazRKaPgDF6Tp0b+0jZrj6z375Rloue3+yjL0ac?=
 =?iso-8859-1?Q?NOeCEytk3ujwW18RosT5kn9whbr9y6/BlicYjQOSjwa0cANkzE3QTO2CXn?=
 =?iso-8859-1?Q?6LeX7utMPzlSn6qeYE9/VJf06RFPXfVAISOVU+jALSd2EUMsaVPsU2fY0D?=
 =?iso-8859-1?Q?xMj4oVNOsY9ygO0SA3epS6iIF1koQPz2vOYRiopokXUaGK4coEd/9RlCIT?=
 =?iso-8859-1?Q?lEj6rteIf+KGqgZ7Wo1DaSyPGRcTg/AxEA3cgIAnTHqXCfyI2/h0IOljhn?=
 =?iso-8859-1?Q?oOBDXVY8TtV/60keMLX2y0ACyR3sFE5Yefb6T26r0hlkUQZyBDKOUqs3TI?=
 =?iso-8859-1?Q?w9rMBt8qFJYscAG9U/YXT2z8E2ojQF4Js4lgeXUcHqWk9u+8a/jl8XJL+q?=
 =?iso-8859-1?Q?4go1GZHLSa9x+W+/jC3NXtp5eEyTtyhrRgjXhZEmmOsK/b1Xdk03YgNBQh?=
 =?iso-8859-1?Q?AtUkMxTFZ8/7i3DZZdS6E7CxBRnPSCeALVV3UBxJaYbZ+5kD8LeP/Hq4IX?=
 =?iso-8859-1?Q?lwNHzOncr8r58I4tbvXA/vSUGotRQaqlcUE/t/CZyvwxBrfI2kHgb6FqDI?=
 =?iso-8859-1?Q?W2R7IHgon1Pa9xXujfC6kUnBvD7vSdzf7GCK8mNKEfOaE3gF0DDXEv7d4l?=
 =?iso-8859-1?Q?so0y+gH8JLbswSnhRpYD7h7uMjBBsZMM8zuEoReEZY1HhTLcKF2kVKnHyg?=
 =?iso-8859-1?Q?f71V5SPYXuzCbdd59vQZOBTXw6Y507U7CbK/p7K0TrAzVTGdrgcUk09bXb?=
 =?iso-8859-1?Q?iAxvM2YbCcKpK3v2gLzIBisJvSLQ1T6jftpXgpa0SmQBg+lkJrYpiy+r3f?=
 =?iso-8859-1?Q?Q/DYup68K4Qqwtmh8ubw83e5j3RAGLh/s1HOgxGKNEpt6rbhb2HXBHMeZo?=
 =?iso-8859-1?Q?/c2Q7FMz/GQ3rPbpv/+/bO9dDNu4bikkoX29bGyvNyvHpNNj/5Qqnh1RB8?=
 =?iso-8859-1?Q?sJxqJIi0JEow0wfplG4MbO3qUMEnudTCczLxlxlluJjHF9V6AmrYGrRCFR?=
 =?iso-8859-1?Q?lxxCE/4pqPAyus3VgwagCP9Xr5MfJKzrPkLCIWebGX7EjcS70ypYy6CyUT?=
 =?iso-8859-1?Q?N77L5SdNC8avM6+VuTIg8KcZgra+ZlJCCmXQNht75WazIxhXP/rX5pP1Pj?=
 =?iso-8859-1?Q?hC4SGlvDgv6QGWFUT0wqWrq1exV6k02/vu/IBQ6MQkfdzTrId4vBOHzA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bc37ec6-b912-404a-ba44-08dc5b4ad112
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2024 23:46:47.4362 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ebEbuwAhotTUv6MwG8FeC4sCrS/ywuEpG+0jfxDFozVb3pH45+yeNa4d0AhhMRDEZPqeh3dHyhCS3lbuRycgew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6766
X-OriginatorOrg: intel.com
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Apr 12, 2024 at 02:58:21PM -0600, Cavitt, Jonathan wrote:
> -----Original Message-----
> From: Summers, Stuart <stuart.summers@intel.com> 
> Sent: Friday, April 12, 2024 1:49 PM
> To: intel-xe@lists.freedesktop.org; Cavitt, Jonathan <jonathan.cavitt@intel.com>
> Cc: Brost, Matthew <matthew.brost@intel.com>; Harrison, John C <john.c.harrison@intel.com>; Gupta, saurabhg <saurabhg.gupta@intel.com>; De Marchi, Lucas <lucas.demarchi@intel.com>
> Subject: Re: [PATCH v4 2/3] drm/xe/xe_guc_submit: Allow lr exec queues to be banned
> > 
> > On Fri, 2024-04-05 at 10:55 -0700, Jonathan Cavitt wrote:
> > > LR queues currently don't get banned during a GT/GuC reset because
> > > they
> > > lack a job.  Though they don't have a job to detect the reset status
> > > of,
> > > it's still possible to tell when they should be banned by looking at
> > > the
> > > LRC: if the LRC head and tail don't match, then the exec queue should
> > > be
> > > banned and cleaned up.
> > > 
> > > This also requires swapping the usage of xe_sched_tdr_queue_imm with
> > > xe_guc_exec_queue_trigger_cleanup, as the former is specific to non-
> > > lr
> > > exec queues.
> > > 
> > > Suggested-by: Matthew Brost <matthew.brost@intel.com>
> > > Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > > Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> > > ---
> > > 
> > > v2:
> > > - Fix Subject line
> > > - Modify change slightly to remove need for "ban" boolean
> > > 
> > > v3: Revert change involving "ban" boolean to version 1
> > > 
> > > v4: Add missing semicolon and remove whitespace
> > > 
> > >  drivers/gpu/drm/xe/xe_guc_submit.c | 12 ++++++++++--
> > >  1 file changed, 10 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c
> > > b/drivers/gpu/drm/xe/xe_guc_submit.c
> > > index 1a6abb10a960e..e72f2a6cad60a 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > > @@ -1424,15 +1424,23 @@ static void guc_exec_queue_stop(struct xe_guc
> > > *guc, struct xe_exec_queue *q)
> > >          */
> > >         if (!(q->flags & (EXEC_QUEUE_FLAG_KERNEL |
> > > EXEC_QUEUE_FLAG_VM))) {
> > >                 struct xe_sched_job *job =
> > > xe_sched_first_pending_job(sched);
> > > +               bool ban = false;
> > >  
> > >                 if (job) {
> > >                         if ((xe_sched_job_started(job) &&
> > >                             !xe_sched_job_completed(job)) ||
> > >                             xe_sched_invalidate_job(job, 2)) {
> > >                                 trace_xe_sched_job_ban(job);
> > > -                               set_exec_queue_banned(q);
> > > -                               xe_sched_tdr_queue_imm(&q->guc-
> > > >sched);
> > > +                               ban = true;
> > >                         }
> > > +               } else if (xe_exec_queue_is_lr(q) &&
> > > +                          (xe_lrc_ring_head(q->lrc) != q->lrc-
> > > >ring.tail)) {
> > 
> > Why do you read the head out of the lrc but the tail from our internal
> > variable? Isn't there a small chance here that you could get something
> > ready to send but not quite submitted to GuC and in which case these
> > would not be equal but not necessarily need the ban? I guess the flip
> > side is maybe that doesn't actually have any real functional impact...
> 

LR jobs don't have in deps, i.e. they run immediately. I guess there is
very small window between exec IOCTL moving the tail and actually
hitting the hardware. 

> 
> IIRC it's because no equivalent xe_lrc_ring_head function exists to
> read the lrc ring tail.  It's likely that I just missed the function to read
> the tail, so if you know what the function is, I'll replace the internal
> call with the proper functional call for the next revision.
> 
> Alternatively, should I use the internal variable for both halves of
> the comparison?

No, if anything check both values in memory.

That being said, I think this is fine as is due the nature of LRC
jobs but I guess it would not hurt to read tail from memory.

If Stuart insists, we change this.

Matt

> -Jonathan Cavitt
> 
> 
> > 
> > Thanks,
> > Stuart
> > 
> > > +                       ban = true;
> > > +               }
> > > +
> > > +               if (ban) {
> > > +                       set_exec_queue_banned(q);
> > > +                       xe_guc_exec_queue_trigger_cleanup(q);
> > >                 }
> > >         }
> > >  }
> > 
> > 
