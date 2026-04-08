Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B60FB1073C9C
	for <intel-xe@archiver.kernel.org>; Wed,  8 Apr 2026 11:28:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49FAC10E615;
	Wed,  8 Apr 2026 11:28:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ABnCUwJ8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82A8510E614;
 Wed,  8 Apr 2026 11:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775647705; x=1807183705;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=09aZq9rZpn5zKsyP6jgVgJ3v1e+A0RU9Kq2l/jezRX4=;
 b=ABnCUwJ8wEDgki2ZpP6cFO9aD6b08vavTrvcx0mRKT8a7hrBnnv0eE+e
 YQSnDGnVaYjhWtRtqSsKyWL9sFwntiKxV2SPzIAoZAGJWuodDMB3XaxU6
 i5kbBBcUGE46QLW5eoAhIEv7Tn/O8tqMe1eq5R74pVCPoWlFMckgKQBe8
 hZdYK3i2kj96dJmwNZ9lAoBOtsdvVIpSQDuqwA4GIfpsd3PdVUzR7qdZk
 eCzwDjeR2DkHArS8CRo6wEGXRoy4VGTvtU64687IU0IBPBYy9o7rJ3bvc
 JeeROf5HwfYJoo+fSGlKcsEh3pjJjbnYZxlptpCtz5+OpLfyubFOqmx9q g==;
X-CSE-ConnectionGUID: OIVONSzVSe+0c11EfoZ3zg==
X-CSE-MsgGUID: b2zKSklxS1aDzu7afNOBsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="76518963"
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; d="scan'208";a="76518963"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 04:28:25 -0700
X-CSE-ConnectionGUID: xmx/mPIQRPO1UdOv+pHi+g==
X-CSE-MsgGUID: bxmqejaPQCG3iat3WwVg0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; d="scan'208";a="258873466"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.245.73])
 by orviesa002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2026 04:28:23 -0700
Date: Wed, 8 Apr 2026 14:28:19 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 10/12] drm/i915/selftests: Eliminate duplicate vma size
 check
Message-ID: <adY700Bp2S4UMi-9@intel.com>
References: <20260407155053.32156-1-ville.syrjala@linux.intel.com>
 <20260407155053.32156-11-ville.syrjala@linux.intel.com>
 <818d1ebdafb20f3b5ed25e1349f2965948ab819b@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <818d1ebdafb20f3b5ed25e1349f2965948ab819b@intel.com>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

On Wed, Apr 08, 2026 at 12:01:26PM +0300, Jani Nikula wrote:
> On Tue, 07 Apr 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> > From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> >
> > Both remapped and rotated views need the exact same size check.
> 
> This is misleading, see below. At the very least the commit message
> needs amending.
> 
> > Currently that is being done separately for each type. Share
> > the code by just checking for !NORMAL view. This test doesn't
> > use I915_GTT_VIEW_PARTIAL so the inverse check is fine here.
> >
> > Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > ---
> >  drivers/gpu/drm/i915/selftests/i915_vma.c | 10 +---------
> >  1 file changed, 1 insertion(+), 9 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/i915/selftests/i915_vma.c b/drivers/gpu/drm/i915/selftests/i915_vma.c
> > index 7c4111e60f2e..258557388a2d 100644
> > --- a/drivers/gpu/drm/i915/selftests/i915_vma.c
> > +++ b/drivers/gpu/drm/i915/selftests/i915_vma.c
> > @@ -634,7 +634,7 @@ static int igt_vma_rotate_remap(void *arg)
> >  
> >  					expected_pages = remapped_size(view.type, &plane_info[0], &plane_info[1]);
> >  
> > -					if (view.type == I915_GTT_VIEW_ROTATED &&
> > +					if (view.type != I915_GTT_VIEW_NORMAL &&
> >  					    vma->size != expected_pages * PAGE_SIZE) {
> >  						pr_err("VMA is wrong size, expected %lu, found %llu\n",
> >  						       PAGE_SIZE * expected_pages, vma->size);
> > @@ -642,14 +642,6 @@ static int igt_vma_rotate_remap(void *arg)
> >  						goto out_object;
> >  					}
> >  
> > -					if (view.type == I915_GTT_VIEW_REMAPPED &&
> > -					    vma->size > expected_pages * PAGE_SIZE) {
> 
> This check becomes stricter now, expecting exact match. Does it matter?

I didn't even notice tbh.

> 
> History points at you! ;)
> 
> e2e394bffa19 ("drm/i915/selftests: Add mock selftest for remapped vmas")
> 
> If you think the change in the check is okay, and with the commit
> message amended,

Hmm. I don't actually know why I did the more relaxed check originally.
Can't think right now why the exact check wouldn't be correct for both.
I suppose actually running the test should tell us...

And now that I think about this, the strict check would be incorrect if
we were testing the plane_alignment stuff. But we seem to lack selftests
for that stuff for some reason. I should really add that, and switch
the size calculations to use the real intel_remapped_info_size()...

> 
> Reviewed-by: Jani Nikula <jani.nikula@intel.com>
> 
> 
> > -						pr_err("VMA is wrong size, expected %lu, found %llu\n",
> > -						       PAGE_SIZE * expected_pages, vma->size);
> > -						err = -EINVAL;
> > -						goto out_object;
> > -					}
> > -
> >  					if (vma->pages->nents > expected_pages) {
> >  						pr_err("sg table is wrong sizeo, expected %u, found %u nents\n",
> >  						       expected_pages, vma->pages->nents);
> 
> -- 
> Jani Nikula, Intel

-- 
Ville Syrjälä
Intel
