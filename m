Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1371CC48BEB
	for <intel-xe@archiver.kernel.org>; Wed, 14 Feb 2024 23:21:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C253B10E0F8;
	Wed, 14 Feb 2024 23:21:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g6PnrxX/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D60710E0F8
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Feb 2024 23:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707952882; x=1739488882;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=T/qUGXQiBki1KE2q7PQSMhBdX7IgU8631yguEypBrmA=;
 b=g6PnrxX/PFGqUxukfK6W9RfnxAFqIWRvidG0pl+glyEsl5WZjl33M+YR
 Jm39PmsP5LT4fCZHKxe9Vv11nq0MHAJMLQ68/Ympizf7hFQSrkKqrb2kY
 j5R2bMuSao/plSMcI/TJvTZn2Zsm0RsEDSrnc6ytY9XcRzaiEP1wK5RFE
 sAPrtvk1t2b8v1OD+Ksr70nmFiGNuFlCDl4oI5VAWoYB8QvWuoiBj1ax5
 PSkIdW3JTqqFZJieYr21jykkx1naGtjeIyjyLXchPVJlqw2W1cnxIK0a4
 Sdlb/T5P/FTyF2gUbHNevAunZwuicuWJRQpu2qQLoMp2lS5Kkfz2aHFRn Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10984"; a="13422813"
X-IronPort-AV: E=Sophos;i="6.06,160,1705392000"; d="scan'208";a="13422813"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2024 15:21:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10984"; a="826369899"
X-IronPort-AV: E=Sophos;i="6.06,160,1705392000"; d="scan'208";a="826369899"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 14 Feb 2024 15:21:18 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 15 Feb 2024 01:21:17 +0200
Date: Thu, 15 Feb 2024 01:21:17 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Koby Elbaz <kelbaz@habana.ai>
Cc: "Summers, Stuart" <stuart.summers@intel.com>,
 "Winiarski, Michal" <michal.winiarski@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v6 1/2] drm/xe: add a new debugfs file - mmio
Message-ID: <Zc1K7WMR1z_JT5hf@intel.com>
References: <20240131195953.852641-1-kelbaz@habana.ai>
 <41d1faeb0cc7e8a0ffe9f3258c22ca3ef566ea34.camel@intel.com>
 <6d0d6a8b-7794-44ce-adb2-8c8d7b7bae49@habana.ai>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6d0d6a8b-7794-44ce-adb2-8c8d7b7bae49@habana.ai>
X-Patchwork-Hint: comment
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

On Tue, Feb 06, 2024 at 05:16:23PM +0000, Koby Elbaz wrote:
> On 31/01/2024 22:14, Summers, Stuart wrote:
> > On Wed, 2024-01-31 at 21:59 +0200, Koby Elbaz wrote:
> >> Now that the former mmio handlers are fully removed, this
> >> debugfs file will be used for mmio access (read/write)
> >> through the debugfs ioctl file operation.
> > Sorry I don't know the history here of v0-v5, but one question, with
> > igt-gpu-tools/tools/intel_reg we can read and write MMIO registers
> > without needing to have the driver loaded at all (i.e. straight through
> > the BARs). Why do we want to also put this capability in the xe debugfs
> > then?
> >
> > Thanks,
> > Stuart
> 
> Hi Stuart,
> Sorry for the late response,
> To some extent we can use it, however, it does not satisfy our 
> development needs.
> Moreover, this change was recently agreed upon throughout the removal of 
> the former mmio-ioctl code:
> https://patchwork.freedesktop.org/series/123403/

If someone intends to hook this up into intel_reg then please
make sure it's _not_ the default path. When debugging I want my
register accesses to go directly to hardware and not be
potentially mucked up by a busted driver.

> 
> 
> Thanks,
> Koby Elbaz
> 
> >
> >> Signed-off-by: Koby Elbaz <kelbaz@habana.ai>
> >> ---
> >>   drivers/gpu/drm/xe/xe_debugfs.c | 12 ++++++++++++
> >>   1 file changed, 12 insertions(+)
> >>
> >> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c
> >> b/drivers/gpu/drm/xe/xe_debugfs.c
> >> index 01db5b27bec5..21b2257aa3a8 100644
> >> --- a/drivers/gpu/drm/xe/xe_debugfs.c
> >> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> >> @@ -98,12 +98,22 @@ static int forcewake_release(struct inode *inode,
> >> struct file *file)
> >>          return 0;
> >>   }
> >>   
> >> +static long xe_debugfs_mmio_ioctl(struct file *f, unsigned int cmd,
> >> unsigned long arg)
> >> +{
> >> +       return 0;
> >> +}
> >> +
> >>   static const struct file_operations forcewake_all_fops = {
> >>          .owner = THIS_MODULE,
> >>          .open = forcewake_open,
> >>          .release = forcewake_release,
> >>   };
> >>   
> >> +static const struct file_operations mmio_fops = {
> >> +       .owner = THIS_MODULE,
> >> +       .unlocked_ioctl = xe_debugfs_mmio_ioctl,
> >> +};
> >> +
> >>   void xe_debugfs_register(struct xe_device *xe)
> >>   {
> >>          struct ttm_device *bdev = &xe->ttm;
> >> @@ -142,6 +152,8 @@ void xe_debugfs_register(struct xe_device *xe)
> >>          for_each_gt(gt, xe, id)
> >>                  xe_gt_debugfs_register(gt);
> >>   
> >> +       debugfs_create_file("mmio", 0644, root, xe, &mmio_fops);
> >> +
> >>   #ifdef CONFIG_FAULT_INJECTION
> >>          fault_create_debugfs_attr("fail_gt_reset", root,
> >> &gt_reset_failure);
> >>   #endif
> 
> 

-- 
Ville Syrjälä
Intel
