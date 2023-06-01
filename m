Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE6E1C7EE23
	for <intel-xe@archiver.kernel.org>; Thu,  1 Jun 2023 17:28:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A23510E251;
	Thu,  1 Jun 2023 17:28:51 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2882E10E251
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Jun 2023 17:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685640529; x=1717176529;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=CmkMw73dQxtx/fMFIcv6Aop1gtbOTnTqCTtijveAx60=;
 b=BtQBamDYld7sG1RtDtTxxJEEl8cnOfnixL/CP5iH8Yk9JLrNHO/grWVz
 nXlhr2uC1dyHDR4GO4iKMdF4r3sbnVGlUdPFGI8dv7d8dWKlpNiHNlloV
 jg+9ozkvmEBL6K0nGs666f5ISUwQcXs5YJmGJCo+fPZSdN6XE4QucGtOd
 dAjvasfew41iDcAnVbqGJ647kTfiXxKoBjzIw4h7WI3o49J/KOG1PZjij
 aPVCqz+3GB2uZTXSahzzS0SnYBgUQMwCaqQIEruU9FxGUpWY4WsRAaiN8
 Ss+gQol6RONxK0GkP22Bo6fvSTMunqd8C2OI6B2I4n3smmlFWT042+T/X A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="354485350"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; d="scan'208";a="354485350"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2023 10:28:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="881708725"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; d="scan'208";a="881708725"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga005.jf.intel.com with ESMTP; 01 Jun 2023 10:28:47 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 1 Jun 2023 10:28:47 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 1 Jun 2023 10:28:47 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.172)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 1 Jun 2023 10:28:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TRwZtLNgPwhReBSiZ0EQDuKvsRkWZnO0bMNzuRbVbVfsnaIuT9i0F5TnwS7h+wXrQXQ1pLJ/ow6dTXBnzYW6VT/axOROopAsBGquzlLNNW+LqV79XwE/ZA9mMDtRCb1hu5FA3Iqk4En00bSl1Eg4TA8QibSU2tlpSafJl6fB/gVmBhCfk2TPa+L+8axGogKfWuS2jM8ogyTEsTeg/Q1UlSlyDO+eF4tP/4Mo23JZzyQ4a+wFL39M9HLw6Jf5IbnR3smLoAwmkhlC9X/Q9F3DhTjqB+yg46CyfrG43Hm4LiNcd5Y/SJPIE5R7xYPpdKblA7d3dMZuJE/J4B0He1X2DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IognuGWZbjhLsZUbIhP4yhcQ4uDQYnhOI8gTuWYbD8c=;
 b=bRygFp72Ermct0QbB1x3+ndXnG1NEJ1dhdWVMyjd4FytJqtRS236cvWJu3LXnRqx7aihBNpzbKfQy3JSwoK4vAi0dJE7WLe8dDnCdUIqbrb97kf8J7JzQRLBbh3xiY28QSBk08Y5t/9sF3EJGOEXNpJmD3Va949nvdiT5OyeS9FwPVAR1Viz13FjGKITJyTrvFXK5T7RFWXkJ13BujxZSRm9wC0FHLgacj2ZTKLZlFGHd111MVWq62OmG+Pq6eYGzKEeXxuGbQpnHU2bgAvWtd531q6BjQ04lOzPQH5gglZcLKIN3NzUqV8NjjGA/Ny7Tq5LmvgFn+L3ouTpZ02QRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SN7PR11MB7090.namprd11.prod.outlook.com (2603:10b6:806:299::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.24; Thu, 1 Jun
 2023 17:28:45 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%5]) with mapi id 15.20.6433.022; Thu, 1 Jun 2023
 17:28:44 +0000
Date: Thu, 1 Jun 2023 10:28:41 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <w6uvvepfl3b34n2sbli5htn77j2g3jnaqg6fa2kkvntpgwnj6u@wqsakk7vtg5d>
References: <20230525161643.7-1-francois.dugast@intel.com>
 <jxctfqc4627xgu3nxumherp724kyqiz6iqhtxkrbp3ibtagpjn@mqeyghmdhwvf>
 <20230601164106.GJ6953@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230601164106.GJ6953@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: MW2PR16CA0004.namprd16.prod.outlook.com (2603:10b6:907::17)
 To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SN7PR11MB7090:EE_
X-MS-Office365-Filtering-Correlation-Id: 6684a183-2299-4011-bea0-08db62c5a68a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RlHFDBirrJFWZqV9QocL0amjc6m1eTNrS/6ynhWrg/2KkVCsyQDFJ+ro6AtxrIDMxTiP11NdjGYLmaZ14+qVnuNNQvfAVO5xLYXRYo0VrWdtvMDzqLYc/Y2EnGxtwA7r3B7guK2/DhKUZVeh6AsVRKA6A7k5kG1kkK/wMP2dYSeML9gDj1jNbf0JaI2HlpxB4KwxPsZsLH9v5jg1KpPynTN+wpZXp9fyO8bQs8TDFW1dRYMTfqQE7VvQQzOSBs9nzbCA5racyTZOzUtJc2JUBUoLNqsP5JOpNqEPHmUyNoqb8x7Mcsilp1RlDmyCMuv9U4z6YT1Rk6x1dZtdLtYlTuX3stsa9bjIUJpwJSh0ia1VS6xEoqEWZSP3bYuxVNGFputYmTzjRxZCSOmEZolJjNaOrNAyOnFrK+Sp0oXgCy72cFcpfg6gxxtXqGSLkrIcaYuRxSMgZEsJIIzHHnBf3gLN8NafqwKRLFAPRYsHV1MTxqRdYjFtOkgWZM47BDqTsW90AsBFTzzQc6FsemzJkw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(136003)(396003)(39860400002)(366004)(346002)(376002)(451199021)(6512007)(6486002)(478600001)(966005)(6666004)(33716001)(26005)(186003)(86362001)(83380400001)(38100700002)(9686003)(82960400001)(6506007)(41300700001)(66476007)(6636002)(66946007)(66556008)(316002)(4326008)(8676002)(5660300002)(8936002)(6862004)(2906002)(54906003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?orOcyZaiD3BvmILJntEvacah5qvLYFKFSw4r3PP3G32LTHyOqYWB6efYtbDQ?=
 =?us-ascii?Q?F5S1+YhRb0gfCTO858eq9uc3xSArtWQXgnRDGllndW/jZLaZrAm0NRU1uhrb?=
 =?us-ascii?Q?gah1pHPINzhQ2poN3M+rRFErbX60w7L3SzAwsJzSF6zDEdUH7cuRlDDVTlD+?=
 =?us-ascii?Q?iHbLam+HzGibH9ahp5tZzgv0JbUHrDkgMLqF+yWlrOyXteruxN3xa0rQoKJ6?=
 =?us-ascii?Q?VvKVSe/C58wT8pMkpOIOH6B+UIq6cJTrsqK7yYNX8vMgCzgNMdX9yrScoGxY?=
 =?us-ascii?Q?2OTw8cAuIozZz7+a+Hl6SpRKr8d7OSbgFVnY91zg1qzUt8jEDJZAEM9ElaFW?=
 =?us-ascii?Q?2qoWaNrjIxUvgoxdvC4E9w+iWAmafpvupJCRtL7yHP8pQyAKhrmbH8Ro70Mb?=
 =?us-ascii?Q?V1IsgmiPlreEvriZpU6HQUEqsindBf2DbyGtfsHlGWfrWcKQWoynhRRtZ+yK?=
 =?us-ascii?Q?eMMyrPbkiPOFJIwggCCyNWJo35HMplC34vp70Dl2/6W6R49wOGGbJ0NIbWHr?=
 =?us-ascii?Q?9IAxO9mbf2iszYPVN1td/Rx8jLWZGN1FeuqGUlezMxUX5cV+PybjoY28O8Vr?=
 =?us-ascii?Q?3GExcQ5eySi3fTajKX32B28AqGG6LIJKlxp6d2hAjcqNtQTqXgmEoWTeS+P8?=
 =?us-ascii?Q?d/yumXN+bIRla7tVhX1EUfdVwFqcLaMuTA6XjCXiEhFZlcbToXI+qAZZ0xPG?=
 =?us-ascii?Q?wBh2lWEHJhg64uDEHNu6BmJaIOz2j/2JuhZLHaKLuZRYNbQhiKmvSw8iN+qM?=
 =?us-ascii?Q?IqYVvZi4ssrDrEJCEPWLctIB9MQg0yfx+w2fLffPnr0gI09lg0k9N66MlOXw?=
 =?us-ascii?Q?r2aRbAUSNU5a8KRlRYEs5becNpMU5rD5wrF6MGOX1jMYd2IQH6HnnISRhUU1?=
 =?us-ascii?Q?4kZ6LrupRVdfZFkznHhh57m7T5CTX10NTo8MJeQ3vHb9Syg8LCpgog/Cw+mg?=
 =?us-ascii?Q?G7be2gyDKvZbEJjxvHKwiKEsLYkSXVNJONy5lW3sITOveoZ3icRI7fDYckSs?=
 =?us-ascii?Q?UybaOoXDtjKypbNPzEmhH3BAV3NDdoMvLWJRSZgggKf/faBxTf6bYMPrd6Fi?=
 =?us-ascii?Q?4nxN/4XBHmMEwDkIWC0TKraspexNyfV7+ZKgZpL5i5XtklBaDghOb3vw2d5r?=
 =?us-ascii?Q?4uKfhujEz104Lew1M+7XvhE4iV2/V+IQE/o1FlIcXQyXSPjLt/00DaqY2Z8J?=
 =?us-ascii?Q?fjJFO8jpvEbP/1HXsVEEd3x1hd2UHx7Ai22lgaaBPUTCKSBn98wg9ENb9rpf?=
 =?us-ascii?Q?IEjJT/pJ3+vW87iZ2A6Ois5utbbFP+GVuatjELD/DkUEgtVVh5kqy2Tw9Far?=
 =?us-ascii?Q?L1q1+59WKTnejhZR09jQQ/AdNJMuSfttZLBhcdp+0zzXUr6F2ZfxAYRlfGbq?=
 =?us-ascii?Q?shQUSzJBemMRKhiqq7+gt2lirDQo/52LPY+EPfpAJO60ihzRikEA4ypwYnfd?=
 =?us-ascii?Q?AZa2kL1HLog51cjFbwkyEaliyNuAGDxSVRZgCEdqrZSl2q7y3A8JDwz4xyLT?=
 =?us-ascii?Q?NVOvIn0aME6iC1ENkDkLOelm1hug02O+zdN7CUDcckEPingpI8ide62gc4oL?=
 =?us-ascii?Q?v+hii1EqnNIXlnTyRX2okm8P8Bw1lQvlp7v1gntOWQehE85wabfS718MPi6b?=
 =?us-ascii?Q?tA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6684a183-2299-4011-bea0-08db62c5a68a
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2023 17:28:44.7956 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6OTu7J6rHqbUQ8wJN3tBXeCHv0JkdSHITtmrr2ahCvh1cu+ktM/J8WxW+Ljndw7Zhs/ILTRLZ5iLoUjgvTaBksqi+ltmgGmlf+speV99ImQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7090
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Prevent flooding the kernel log with
 XE_IOCTL_ERR
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

On Thu, Jun 01, 2023 at 09:41:06AM -0700, Matt Roper wrote:
>On Wed, May 31, 2023 at 09:45:07AM -0700, Lucas De Marchi wrote:
>> On Thu, May 25, 2023 at 04:16:43PM +0000, Francois Dugast wrote:
>> > Lower log level of XE_IOCTL_ERR macro to debug in order to prevent
>> > flooding kernel log. Rely on drm_dbg macro output which includes
>> > function name, so removing file and name macros.
>> >
>> > Reported-by: Oded Gabbay <ogabbay@kernel.org>
>> > Link: https://lists.freedesktop.org/archives/intel-xe/2023-May/004704.html
>> > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
>> > ---
>> > drivers/gpu/drm/xe/xe_macros.h | 6 +++---
>> > 1 file changed, 3 insertions(+), 3 deletions(-)
>> >
>> > diff --git a/drivers/gpu/drm/xe/xe_macros.h b/drivers/gpu/drm/xe/xe_macros.h
>> > index 0d24c124d202..2b8a46ffb93e 100644
>> > --- a/drivers/gpu/drm/xe/xe_macros.h
>> > +++ b/drivers/gpu/drm/xe/xe_macros.h
>> > @@ -13,8 +13,8 @@
>> > #define XE_BUG_ON BUG_ON
>> >
>> > #define XE_IOCTL_ERR(xe, cond) \
>>
>> 		   ^^^
>>
>> > -	((cond) && (drm_info(&(xe)->drm, \
>> > -			    "Ioctl argument check failed at %s:%d: %s", \
>> > -			    __FILE__, __LINE__, #cond), 1))
>> > +	((cond) && (drm_dbg(&(xe)->drm, \
>>
>> 			^^^
>>
>> now you have a mismatch.
>>
>> From a quick look we already have
>> several places with mixed usage. See e.g. engine_set_timeslice(),
>> engine_set_preemption_timeout(), engine_set_priority(). There are also a
>> few places that will log on ENOMEM, which should not be there, but is
>> not caught by checkpatch since it's obfuscated in the macro (see
>> scripts/checkpatch.pl - "# check for unnecessary "Out of Memory"
>> messages")
>>
>> Can we get away simply removing it?  retsnoop is a thing nowadays and to
>> understand where the error is coming from, userspace could simply run it
>> on the side... something like
>>
>> 	# ./retsnoop -e '*sys_ioctl' -a ':drivers/gpu/drm/xe/*.c'
>>
>> which returns more useful things if the error is farther down the
>> call stack.
>
>That requires manual execution though...I think there's still value in
>having debug-level messages for failures like these so that we get
>meaningful CI logs when something goes wrong.  It's not always quick or
>easy to grab a suitable machine to reproduce a CI-reported failure
>locally with retsnoop.

so XE_IOCTL_DBG()? XE_IOCTL_CHECK()?

Not a pattern I see much in the kernel, but other projects use is below.
It removes the dbg/err mismatch and makes the code shorter to read, but
the return inside the macro is not something very common... but hey,
using the comma operator is not that common neither :). Thoughts?


diff --git a/drivers/gpu/drm/xe/xe_engine.c b/drivers/gpu/drm/xe/xe_engine.c
index 1a9082db8f1b..7070912edd96 100644
--- a/drivers/gpu/drm/xe/xe_engine.c
+++ b/drivers/gpu/drm/xe/xe_engine.c
@@ -249,11 +249,8 @@ static int engine_set_compute_mode(struct xe_device *xe, struct xe_engine *e,
  static int engine_set_persistence(struct xe_device *xe, struct xe_engine *e,
  				  u64 value, bool create)
  {
-	if (XE_IOCTL_ERR(xe, !create))
-		return -EINVAL;
-
-	if (XE_IOCTL_ERR(xe, e->flags & ENGINE_FLAG_COMPUTE_MODE))
-		return -EINVAL;
+	XE_IOCTL_ASSERT(xe, create, -EINVAL);
+	XE_IOCTL_ASSERT(xe, !(e->flags & ENGINE_FLAG_COMPUTE_MODE), -EINVAL);
  
  	if (value)
  		e->flags |= ENGINE_FLAG_PERSISTENT;
@@ -266,11 +263,8 @@ static int engine_set_persistence(struct xe_device *xe, struct xe_engine *e,
  static int engine_set_job_timeout(struct xe_device *xe, struct xe_engine *e,
  				  u64 value, bool create)
  {
-	if (XE_IOCTL_ERR(xe, !create))
-		return -EINVAL;
-
-	if (!capable(CAP_SYS_NICE))
-		return -EPERM;
+	XE_IOCTL_ASSERT(xe, create, -EINVAL);
+	XE_IOCTL_ASSERT(xe, capable(CAP_SYS_NICE), -EPERM);
  
  	return e->ops->set_job_timeout(e, value);
  }
@@ -278,11 +272,8 @@ static int engine_set_job_timeout(struct xe_device *xe, struct xe_engine *e,
  static int engine_set_acc_trigger(struct xe_device *xe, struct xe_engine *e,
  				  u64 value, bool create)
  {
-	if (XE_IOCTL_ERR(xe, !create))
-		return -EINVAL;
-
-	if (XE_IOCTL_ERR(xe, !xe->info.supports_usm))
-		return -EINVAL;
+	XE_IOCTL_ASSERT(xe, create, -EINVAL);
+	XE_IOCTL_ASSERT(xe, xe->info.supports_usm, -EINVAL);
  
  	e->usm.acc_trigger = value;
  
diff --git a/drivers/gpu/drm/xe/xe_macros.h b/drivers/gpu/drm/xe/xe_macros.h
index 0d24c124d202..6660ab49c8a8 100644
--- a/drivers/gpu/drm/xe/xe_macros.h
+++ b/drivers/gpu/drm/xe/xe_macros.h
@@ -17,4 +17,11 @@
  			    "Ioctl argument check failed at %s:%d: %s", \
  			    __FILE__, __LINE__, #cond), 1))
  
+#define XE_IOCTL_ASSERT(xe__, cond__, retcode__)				\
+	if (unlikely(!(cond__))) {						\
+		drm_dbg(&(xe__)->drm, "Ioctl argument check failed: %s",	\
+			#cond__);						\
+		return retcode__;						\
+	}
+
  #endif

>
>
>Matt
>
>>
>> Lucas De Marchi
>>
>> > +			    "Ioctl argument check failed: %s", \
>> > +			    #cond), 1))
>> >
>> > #endif
>> > --
>> > 2.34.1
>> >
>
>-- 
>Matt Roper
>Graphics Software Engineer
>Linux GPU Platform Enablement
>Intel Corporation
