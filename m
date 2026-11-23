Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A061A606D16D
	for <intel-xe@archiver.kernel.org>; Mon, 23 Nov 2026 08:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MQB9DroC
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64E9410E684;
	Mon, 23 Nov 2026 08:03:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60E5810E684
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Nov 2026 08:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795421006; x=1826957006;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=favUsPE2itKUBllfPtnvCZV6wBHYdUg+xVlJz2g0xMo=;
 b=MQB9DroC8CuQCGN1WLahFgDnEW9jA4w8Iesa1PrD9yewh3yWmXoGIBi/
 f8lbfRNIJwpT2iJ1PUjgb5bp7IEbTr3SRQqQNdcNcHwXFzSZi9kKOCj0Y
 sr8aFiBoqLP3J6QiX2LhLOR+YX0CsdID9jhPaeMULzoUBE0zHJF3IowHB
 zumaXwPP+6S/X+d0tK5RJnHVUPT0JO0GEjL5HqfThzZGEXlOYHmB2pR15
 XlTgK+TtjyJLcWu22U/IpPjsDpE9AAEmBQXusvs9nIbMJbNWtuBEze4kX
 2LPOQv43iHXK/GQ9mhfzhyaITvoBUowLM4WhYwJLrteyYeHN6u7opN0lR g==;
X-CSE-ConnectionGUID: ENNuIUkzQLC5ZLpHKvKoig==
X-CSE-MsgGUID: eg9mDL7RSZeNQPABym73XQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4253821"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4253821"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 00:03:26 -0800
X-CSE-ConnectionGUID: Rb3smIivRvKXMoHcu/JyVw==
X-CSE-MsgGUID: ap9ayqiNTXWHYNEcgjBEbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; d="scan'208";a="11595275"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 00:03:25 -0800
Date: Mon, 23 Nov 2026 09:03:22 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: "Tauro, Riana" <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH v1] drm/xe/ras: Distinguish between detailed and
 aggregate counters
Message-ID: <awPzSlWM4ZiZtGBN@black.igk.intel.com>
References: <20261102090424.987843-1-raag.jadav@intel.com>
 <b49b7767-155c-4f85-9680-0e9500f3e8ee@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b49b7767-155c-4f85-9680-0e9500f3e8ee@intel.com>
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 23, 2026 at 12:16:24PM +0530, Tauro, Riana wrote:
> On 02-11-2026 14:34, Raag Jadav wrote:
> > xe_ras_get_counter_response() only logs counter value, severity and
> > component. Also log the type of counter for easier debugging.
> > 
> > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_ras.c | 9 +++++++--
> >   1 file changed, 7 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> > index 2c01c183d02b..381ea19a8b4a 100644
> > --- a/drivers/gpu/drm/xe/xe_ras.c
> > +++ b/drivers/gpu/drm/xe/xe_ras.c
> > @@ -772,7 +772,9 @@ int xe_ras_get_counter_response(struct xe_device *xe, const struct xe_ras_error_
> >   {
> >   	struct xe_ras_get_counter_request request = {0};
> >   	struct xe_sysctrl_mailbox_command command = {0};
> > +	const struct xe_ras_error_product product = {0};
> >   	struct xe_ras_error_common *common;
> > +	bool detailed;
> >   	size_t rlen;
> >   	int ret;
> > @@ -798,8 +800,11 @@ int xe_ras_get_counter_response(struct xe_device *xe, const struct xe_ras_error_
> >   	common = &response->counter.common;
> > -	xe_dbg(xe, "[RAS]: get counter %u for %s %s\n", response->value,
> > -	       comp_to_str(common->component), sev_to_str(common->severity));
> > +	BUILD_BUG_ON(sizeof(*counter) != sizeof(counter->common) + sizeof(counter->product));
> 
> Why do we need this? This is already common+product and passed by caller.

Can you guarantee that counter layout will remain unchanged forever?

Raag

> > +	detailed = memcmp(&response->counter.product, &product, sizeof(product));
> > +
> > +	xe_dbg(xe, "[RAS]: get %s counter %u for %s %s\n", detailed ? "detailed" : "aggregate",
> > +	       response->value, comp_to_str(common->component), sev_to_str(common->severity));
> >   	return 0;
> >   }
