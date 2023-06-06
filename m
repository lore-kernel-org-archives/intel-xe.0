Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F892C7EE24
	for <intel-xe@archiver.kernel.org>; Tue,  6 Jun 2023 08:23:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3179110E2F0;
	Tue,  6 Jun 2023 08:23:41 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D89A10E2CE
 for <intel-xe@lists.freedesktop.org>; Tue,  6 Jun 2023 08:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686039819; x=1717575819;
 h=date:from:to:cc:subject:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=feaTbHnzjChWsk6XuS+aVPFBJJUgeyc0iVOXajPFzgE=;
 b=UUgAxZrRitFSncQ94WnC3R3vbiSx0QK7FQNscJUyTN6hm+RmcNi3uvD2
 LGmpESAklKuJmYjW+NMC1oXkbb+Cf2Sb2kjoPbv4nHYa4BXmneRJK6KqD
 G0try3gEWGmKAYTm8DMp9/zDZitJ0wpVEF4QyY0KHYLjGSQTfZvf6hC9s
 AlaHerShaRBsOH9Hh6DbVb4L/05Beb8q/I3tQcPjfe4+ZeHvSKd4rFZvN
 OPccxwQwtpxmGCyjdQpbW8vTY8/z7HPhBOIOxa+GQ9Ny8svMNj3ML7Ghx
 GeIoUnA9w0SIuzSDy5eDy/12MB0rLWF1bszY/1mgzDLn08at32SZhVvIV w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="354095326"
X-IronPort-AV: E=Sophos;i="6.00,219,1681196400"; d="scan'208";a="354095326"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2023 01:23:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="774036436"
X-IronPort-AV: E=Sophos;i="6.00,219,1681196400"; d="scan'208";a="774036436"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga008.fm.intel.com with ESMTP; 06 Jun 2023 01:23:32 -0700
Received: from maurocar-mobl2 (maurocar-mobl2.ger.corp.intel.com
 [10.252.20.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 3C1E35804D9;
 Tue,  6 Jun 2023 01:23:30 -0700 (PDT)
Date: Tue, 6 Jun 2023 10:23:27 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
Message-ID: <20230606102327.4cd5c0af@maurocar-mobl2>
In-Reply-To: <MW4PR11MB7056B78BBD72CADF823802EEB352A@MW4PR11MB7056.namprd11.prod.outlook.com>
References: <20230524070641.1601255-1-himal.prasad.ghimiray@intel.com>
 <ZG461NbVPLb7utFZ@bvivekan-mobl> <ZG4+rQfYHFvwiR5f@rdvivi-mobl4>
 <077e443da6439d4ae30428cf86a2e478e821c045.camel@intel.com>
 <20230525080621.196a76cd@maurocar-mobl2>
 <MW4PR11MB7056B78BBD72CADF823802EEB352A@MW4PR11MB7056.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH v2 1/1] drm/xe: Add a debugfs for faking gt
 reset failure.
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "mauro.chehab@kernel.org" <mauro.chehab@kernel.org>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, 6 Jun 2023 04:03:20 +0000
"Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com> wrote:

> > -----Original Message-----
> > From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of
> > Mauro Carvalho Chehab
> > Sent: 25 May 2023 11:36
> > To: Vivi, Rodrigo <rodrigo.vivi@intel.com>
> > Cc: mauro.chehab@kernel.org; intel-xe@lists.freedesktop.org
> > Subject: Re: [Intel-xe] [PATCH v2 1/1] drm/xe: Add a debugfs for faking gt
> > reset failure.
> > 
> > On Wed, 24 May 2023 16:50:04 +0000
> > "Vivi, Rodrigo" <rodrigo.vivi@intel.com> wrote:
> >   
> > > On Wed, 2023-05-24 at 12:43 -0400, Rodrigo Vivi wrote:
> > > On Wed, May 24, 2023 at 09:57:00PM +0530, Balasubramani Vivekanandan  
> > wrote:  
> > > On 24.05.2023 12:36, Himal Prasad Ghimiray wrote:
> > > In case of gt reset failure, KMD notifies userspace about failure via
> > > uevent. To validate this notification we need to ensure gt reset fails
> > > and there is no mechanism to cause failure from hardware.
> > > Hence added a debugfs which will cause fake reset failure.
> > >
> > > v1(Rodrigo)
> > > - Change the variable to fake_reset_failure_in_progress.
> > > - Drop usage of READ_ONCE and WRITE_ONCE.
> > > - Follow consistency for variable assignment. Either use
> > >   functions for all the assignments or don't use for any.
> > >
> > > Cc: Rodrigo Vivi
> > > <rodrigo.vivi@intel.com<mailto:rodrigo.vivi@intel.com>>
> > > Signed-off-by: Himal Prasad Ghimiray
> > > <himal.prasad.ghimiray@intel.com<mailto:himal.prasad.ghimiray@intel.co  
> > > m>>  
> > > ---
> > >  drivers/gpu/drm/xe/xe_gt.c         | 15 ++++++++++++++-
> > >  drivers/gpu/drm/xe/xe_gt_debugfs.c | 11 +++++++++++
> > >  drivers/gpu/drm/xe/xe_gt_types.h   |  1 +
> > >  3 files changed, 26 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> > > index 80d42c7c7cfa..b3ac8b3ab455 100644
> > > --- a/drivers/gpu/drm/xe/xe_gt.c
> > > +++ b/drivers/gpu/drm/xe/xe_gt.c
> > > @@ -506,6 +506,9 @@ int xe_gt_init(struct xe_gt *gt)
> > >         int err;
> > >         int i;
> > >
> > > +       /*Fake reset failure should be disabled by default*/
> > > +       gt->reset.fake_reset_failure_in_progress = false;
> > > +
> > >         INIT_WORK(&gt->reset.worker, gt_reset_worker);
> > >
> > >         for (i = 0; i < XE_ENGINE_CLASS_MAX; ++i) { @@ -601,8 +604,18
> > > @@ static int gt_reset(struct xe_gt *gt)
> > >         xe_gt_info(gt, "reset started\n");
> > >
> > >         xe_gt_sanitize(gt);
> > > -
> > >         xe_device_mem_access_get(gt_to_xe(gt));
> > > +
> > > +       err = gt->reset.fake_reset_failure_in_progress;
> > > +       if (err) {
> > >
> > > This doesn't look the right way. It should be something like
> > >
> > > ```
> > > if (gt->reset.fake_reset_failure_in_progress) {
> > >
> > >         err = -ECANCELED; or whatever appropriate
> > >         ...
> > > ```
> > >
> > > +               xe_gt_info(gt, "Fake GT reset failure is in
> > > + progress\n");
> > > +
> > > +               /* Disable fake reset failure for next call */
> > > +               gt->reset.fake_reset_failure_in_progress = false;
> > > +
> > > +               goto err_msg;
> > > +       }
> > > +
> > >         err = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> > >         if (err)
> > >                 goto err_msg;
> > > diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> > > b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> > > index 8bf441e850a0..13d2a974bc00 100644
> > > --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> > > +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> > > @@ -127,6 +127,16 @@ static int register_save_restore(struct seq_file *m,  
> > void *data)  
> > >         return 0;
> > >  }
> > >
> > > +static int fake_reset_failure(struct seq_file *m, void *data) {
> > > +       struct xe_gt *gt = node_to_gt(m->private);
> > > +
> > > +       gt->reset.fake_reset_failure_in_progress = true;
> > > +       xe_gt_reset_async(gt);
> > > +
> > > +       return 0;
> > > +}
> > > +
> > >  static const struct drm_info_list debugfs_list[] = {
> > >         {"hw_engines", hw_engines, 0},
> > >         {"force_reset", force_reset, 0}, @@ -135,6 +145,7 @@ static
> > > const struct drm_info_list debugfs_list[] = {
> > >         {"steering", steering, 0},
> > >         {"ggtt", ggtt, 0},
> > >         {"register-save-restore", register_save_restore, 0},
> > > +       {"fake_reset_failure", fake_reset_failure, 0},
> > >  };
> > >
> > >  void xe_gt_debugfs_register(struct xe_gt *gt) diff --git
> > > a/drivers/gpu/drm/xe/xe_gt_types.h  
> > b/drivers/gpu/drm/xe/xe_gt_types.h  
> > > index 7c47d67aa8be..746d65c4aacc 100644
> > > --- a/drivers/gpu/drm/xe/xe_gt_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> > > @@ -168,6 +168,7 @@ struct xe_gt {
> > >
> > >         /** @reset: state for GT resets */
> > >         struct {
> > > +               bool fake_reset_failure_in_progress;
> > >                 /**
> > >                  * @worker: work so GT resets can done async allowing to reset
> > >                  * code to safely flush all code paths
> > >
> > > @Rodrigo
> > > This feature is purely to support test the driver and not something
> > > which helps debugging. I am concerned whether such code should be part
> > > of production build. I am thinking if this feature or any such patches
> > > in future could be made part of a kernel config, which can be enabled
> > > in CI when the driver is subjected to testing.
> > >
> > > I like this idea of having things like this behind a kernel config,
> > > but we need to be careful to not simply break IGT or force IGT to
> > > always depend on this flag.  
> > 
> > Well, debugfs is actually something that shouldn't be used in production ;-)
> > 
> > Granted, read-only debugfs nodes that would be just printing the engine
> > states without affecting the driver functionality can be present on production
> > environments, as those could be used by sysadmins to report issues to
> > distribution vendors.
> > 
> > On other words, we may have two separate groups of debugfs entries:
> > 
> > - entries that won't be changing the driver or GPU state machine;
> > - entries that will be affecting the driver, like forcing resets
> >   forcing reset to fail, etc. are more dangerous and may deserve an
> >   special Kconfig entry.
> > 
> > On such case, I would be placing a scary message at the Kconfig.debug file,
> > like:
> > 
> > 	config DRM_XE_DANGEROUS_DEBUGFS
> > 		bool "Enable driver development debugfs entries
> > (DANGEROUS)"
> > 		depends on DRM_XE_DEBUG && DEBUGFS
> > 		default n
> > 
> > 		help
> > 
> > 		  Add special debugfs entries meant to test Xe driver.
> > 
> > 		  Never enable those in production as those may cause
> > 		  malfunctioning at the Xe driver.
> > 
> > 		  Set it to "N", except if you're debugging Xe driver.
> > 
> > I would also place those options on a separate debugfs list, e. g.:  
> Hi Mauro,
> Thanks for proposing on this. For the time being can we go ahead and introduce this debugfs in existing list ?
> Once the changes are in for separating debugfs list  it into danger_debugfs_list  and debugfs_list 
> we will move fake_reset_failure debugfs  to that list along with other applicable entries. 

Works for me.

Regards,
Mauro

> 
> BR
> Himal 
> > 
> > 	static const struct drm_info_list danger_debugfs_list[] = {
> > 		{"force_reset", force_reset, 0},
> > 		/*
> > 		 * Whatever other node that writing to it would cause
> > 		 * side effects at the driver
> > 		 */
> > 		{"fake_reset_failure", fake_reset_failure, 0},
> > 	};
> > 
> > In time, DRM_XE_USERPTR_INVAL_INJECT is also a dangerous option. Btw,
> > shouldn't it be enabled only via a debugfs entry too? If not, then perhaps we
> > should use a menuconfig where we'll be placing all those error-inject
> > features altogether.
> > 
> > Regards,
> > Mauro  
