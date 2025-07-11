Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0EABC83F1B
	for <intel-xe@archiver.kernel.org>; Fri, 11 Jul 2025 17:59:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94C1110E2C9;
	Fri, 11 Jul 2025 17:59:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N1xhpp/o";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B53610E3AF
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Jul 2025 17:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752256767; x=1783792767;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=1bTQwRRh18JSkJub71DKitek5MhQp3+2ZFn1Tin5Q9Y=;
 b=N1xhpp/olv7tIIxd8L6DLhCjdh4L4PDzYug8ww+lQ8BEaIQCRXW8ZzRs
 xs67R+/Iv7uuXYfMPDbW/pFKb+Lj6fxnN02juX3v97jFtUwN2ZkVHL8Pv
 be5O1Rp+q9WXbyHuDo6cuMMIM4ZEBS0zSTfu0XWcifb4SKcSsHPetYghH
 QjZKpcqzL3ZbOFoBUQavSbECZST6WTMm8gEzbaLDvY5Ev3n9/0izGqf5O
 2X6kfCf8u4DKtITvdaPjR7INqlpWJdipIN7V/GDH5FOAX5n+doOvfIEOs
 FHvLEOg6NyxH5fs1hRYWS3GXfEHvXCIH866LJFS6PYhuUq8jZOSM303Ww g==;
X-CSE-ConnectionGUID: rtVsf00HQ3yVqI4HPn1uFA==
X-CSE-MsgGUID: zvmnl4vlRZ6fd21aYC60ZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="65258911"
X-IronPort-AV: E=Sophos;i="6.16,304,1744095600"; d="scan'208";a="65258911"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2025 10:59:27 -0700
X-CSE-ConnectionGUID: P93YnsvzT5G/Mn6Zu4QBhQ==
X-CSE-MsgGUID: lQ+y4e9oT9ePECtoxO3Alg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,304,1744095600"; d="scan'208";a="180115514"
Received: from mgerlach-mobl1.amr.corp.intel.com (HELO localhost)
 ([10.124.222.101])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2025 10:59:26 -0700
Date: Fri, 11 Jul 2025 10:59:25 -0700
From: David Box <david.e.box@linux.intel.com>
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Cc: platform-driver-x86@vger.kernel.org, intel-xe@lists.freedesktop.org, 
 hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com, lucas.demarchi@intel.com, 
 rodrigo.vivi@intel.com, thomas.hellstrom@linux.intel.com, airlied@gmail.com, 
 simona@ffwll.ch
Subject: Re: [PATCH v7 02/12] drm/xe: Correct BMG VSEC header sizing
Message-ID: <lfvgatgvexvot7a2x336rdv2vps3o3so5pty7n4mw4u5ze6boz@giw6rw5auo7d>
References: <20250709184458.298283-1-michael.j.ruhl@intel.com>
 <20250709184458.298283-3-michael.j.ruhl@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250709184458.298283-3-michael.j.ruhl@intel.com>
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

On Wed, Jul 09, 2025 at 02:44:48PM -0400, Michael J. Ruhl wrote:
> The intel_vsec_header information for the crashlog feature is
> incorrect.
> 
> Update the VSEC header with correct sizing and count.
> 
> Since the crashlog entries are "merged" (num_entries = 2), the
> separate capabilities entries must be merged as well.
> 
> Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Fixes: 0c45e76fcc62 ("drm/xe/vsec: Support BMG devices")
> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vsec.c | 20 +++++---------------
>  1 file changed, 5 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
> index 3e573b0b7ebd..67238fc57a4d 100644
> --- a/drivers/gpu/drm/xe/xe_vsec.c
> +++ b/drivers/gpu/drm/xe/xe_vsec.c
> @@ -32,28 +32,18 @@ static struct intel_vsec_header bmg_telemetry = {
>  	.offset = BMG_DISCOVERY_OFFSET,
>  };
>  
> -static struct intel_vsec_header bmg_punit_crashlog = {
> -	.length = 0x10,
> +static struct intel_vsec_header bmg_crashlog = {
> +	.length = 0x18,

This doesn't look right. The length field is meant to represent the size
of the entire DVSEC, and it should remain 0x10 even for Crashlog.

This field really ought to be validated in vsec.c, but I see that it
isn’t currently. The rev field, which also isn’t set here, determines the
length. When rev is 1, the length is 0x10. vsec does a basic revision
check when reading the capability from config space but doesn’t validate
this driver-provided structure. That’s a gap I’ll take care of
separately.

For now, even though this length value isn’t actually read by vsec.c,
it should still be set correctly to 0x10. Also, add the rev field here
and set it to 1. I see multiple headers missing the rev. That should be
fixed in a separate patch ahead of this one. All Intel DVEC capabilities
use revision 1.

David

>  	.id = VSEC_ID_CRASHLOG,
> -	.num_entries = 1,
> -	.entry_size = 4,
> +	.num_entries = 2,
> +	.entry_size = 6,
>  	.tbir = 0,
>  	.offset = BMG_DISCOVERY_OFFSET + 0x60,
>  };
>  
> -static struct intel_vsec_header bmg_oobmsm_crashlog = {
> -	.length = 0x10,
> -	.id = VSEC_ID_CRASHLOG,
> -	.num_entries = 1,
> -	.entry_size = 4,
> -	.tbir = 0,
> -	.offset = BMG_DISCOVERY_OFFSET + 0x78,
> -};
> -
>  static struct intel_vsec_header *bmg_capabilities[] = {
>  	&bmg_telemetry,
> -	&bmg_punit_crashlog,
> -	&bmg_oobmsm_crashlog,
> +	&bmg_crashlog,
>  	NULL
>  };
>  
> -- 
> 2.50.0
> 
> 
