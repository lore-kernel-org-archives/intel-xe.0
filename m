Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1D32E77180
	for <intel-xe@archiver.kernel.org>; Mon,  9 Dec 2024 14:54:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 930FC10E7AE;
	Mon,  9 Dec 2024 14:54:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LKeKfK2N";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E136010E75E
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Dec 2024 14:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733756090; x=1765292090;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=UEAc3xJswpMSdjsTudNvrR4O/735Cip2Zh0O5zz+M90=;
 b=LKeKfK2NNnq1h1K73pTRxrcqULF6njiGr35bITDCvPRQFGoiwYUqfH0m
 aKCwXh17eY0SzCeCSrXIYpCdGPJYVMUIlM+K+Ph7hdcGFS25PyknzSNA+
 UJ9w0RrhcyVUF/AdQQkbSdAV+Miuju4FXLpzU6hL4O3RpgxEPnpPqMABR
 IzPHWPioF5XuKs3/m1zFKMFsRMz4oR/iUqlJwZ1mLfoJPkOZQctoxyNXM
 /zsBwln8bsMhOKqElzMqrFrF/PAfKyzUKC+x/JSxj2GtNawikrJCyLp0z
 +8bplKIwLomSfMJ/DoIkJpdhMkoBhsJfXb2/3aPDliRzPIRtqhJ47XJ4F Q==;
X-CSE-ConnectionGUID: 1VIQ7pioSxiVzrbCceFrRw==
X-CSE-MsgGUID: XwIT2G+DRf+ogGed2IdV7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="34294720"
X-IronPort-AV: E=Sophos;i="6.12,219,1728975600"; d="scan'208";a="34294720"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2024 06:54:49 -0800
X-CSE-ConnectionGUID: 2ZUn1wkhQQ2zMQ8WzxW/4A==
X-CSE-MsgGUID: 9y0PTsV1SQufapNM5uBXXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,219,1728975600"; d="scan'208";a="100051444"
Received: from black.fi.intel.com ([10.237.72.28])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2024 06:54:48 -0800
Date: Mon, 9 Dec 2024 16:54:45 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Maciej Patelczyk <maciej.patelczyk@intel.com>
Cc: intel-xe@lists.freedesktop.org, niranjana.vishwanathapura@intel.com
Subject: Re: [PATCH 1/2] drm/xe: introduce xe_gt_reset_wait to wait for async
 gt reset
Message-ID: <Z1cEtYgIRzoaVRY4@black.fi.intel.com>
References: <20241209141210.1311374-1-maciej.patelczyk@intel.com>
 <20241209141210.1311374-2-maciej.patelczyk@intel.com>
 <Z1cB5Wx7AWUUD7L2@black.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z1cB5Wx7AWUUD7L2@black.fi.intel.com>
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

On Mon, Dec 09, 2024 at 04:42:49PM +0200, Raag Jadav wrote:
> On Mon, Dec 09, 2024 at 03:12:09PM +0100, Maciej Patelczyk wrote:
> > The reset of the GT is asynchronous.
> > Adding a wait helper to wait until gt reset is done.
> > 
> > Signed-off-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
> > ---
> >  drivers/gpu/drm/xe/tests/xe_bo.c   |  2 +-
> >  drivers/gpu/drm/xe/tests/xe_mocs.c |  2 +-
> >  drivers/gpu/drm/xe/xe_gt.h         | 12 ++++++++++++
> >  drivers/gpu/drm/xe/xe_gt_debugfs.c |  2 +-
> >  4 files changed, 15 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/tests/xe_bo.c b/drivers/gpu/drm/xe/tests/xe_bo.c
> > index c9ec7a313c6b..b51434fc5bd1 100644
> > --- a/drivers/gpu/drm/xe/tests/xe_bo.c
> > +++ b/drivers/gpu/drm/xe/tests/xe_bo.c
> > @@ -266,7 +266,7 @@ static int evict_test_run_tile(struct xe_device *xe, struct xe_tile *tile, struc
> >  		 */
> >  		for_each_gt(__gt, xe, id) {
> >  			xe_gt_reset_async(__gt);
> > -			flush_work(&__gt->reset.worker);
> > +			xe_gt_reset_wait(__gt);
> 
> Why not just create a
> 
> void xe_gt_reset_sync(gt)
> {
> 	xe_gt_reset_async()
> 	flush_work()
> }
> 
> and use it instead?

Or perhaps reuse force_reset_sync()?

Raag
