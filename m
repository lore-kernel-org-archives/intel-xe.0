Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21520E6FE41
	for <intel-xe@archiver.kernel.org>; Fri, 22 Sep 2023 15:16:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D125810E68B;
	Fri, 22 Sep 2023 15:16:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7333310E68B
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Sep 2023 15:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695395797; x=1726931797;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=plevMaCrcoSQiunOePJWM19KJ9OivzRDaLpXHbn/S1E=;
 b=GjMCmfJWhP+sx7JhEXTU4OGppIQAhrkvbXu51WKl6s2WFmdwKxnEs+rm
 MPqvuv6n8UjmCUlxKvJtw6iPGmvVQdn8D0g2pC13LiiUiS24GWlvLjm7e
 PmpC2H9b7g3kxpGVmhOa8HAs3Faf5kOldw2hngshqtXiHFzVLvTblhacw
 DgZxQJWIKswJ18WJwxTKMvG4cEsxuNfNPykL9AM3irvW6jzBocaudjrC9
 phKLSSWakdi3Few67ItB2d/vjMqvFRPK144NZUgkk1VfAb8+k7ieZst0o
 YU6b47/pfwEjg2gtfkT0avEIusg1QuQCDiRozxCHn6TcLMSBepnQ0A63U Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="379729615"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; d="scan'208";a="379729615"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2023 08:16:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="697217719"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; d="scan'208";a="697217719"
Received: from velangov-mobl.gar.corp.intel.com (HELO intel.com)
 ([10.214.174.70])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2023 08:16:29 -0700
Date: Fri, 22 Sep 2023 17:16:23 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Message-ID: <ZQ2vx6CNgDwWW8SU@ashyti-mobl2.lan>
References: <20230921102519.3355538-1-badal.nilawar@intel.com>
 <20230921102519.3355538-2-badal.nilawar@intel.com>
 <ZQxpTss3+OYdbJks@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZQxpTss3+OYdbJks@intel.com>
Subject: Re: [Intel-xe] [PATCH v5 1/6] drm/xe: Add XE_MISSING_CASE macro
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
Cc: linux-hwmon@vger.kernel.org, intel-xe@lists.freedesktop.org,
 linux@roeck-us.net
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hi Rodrigo,

On Thu, Sep 21, 2023 at 12:03:26PM -0400, Rodrigo Vivi wrote:
> On Thu, Sep 21, 2023 at 03:55:14PM +0530, Badal Nilawar wrote:
> > Add XE_MISSING_CASE macro to handle missing switch case
> > 
> > v2: Add comment about macro usage (Himal)
> > 
> > Cc: Andi Shyti <andi.shyti@linux.intel.com>
> > Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> > Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_macros.h | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_macros.h b/drivers/gpu/drm/xe/xe_macros.h
> > index daf56c846d03..6c74c69920ed 100644
> > --- a/drivers/gpu/drm/xe/xe_macros.h
> > +++ b/drivers/gpu/drm/xe/xe_macros.h
> > @@ -15,4 +15,8 @@
> >  			    "Ioctl argument check failed at %s:%d: %s", \
> >  			    __FILE__, __LINE__, #cond), 1))
> >  
> > +/* Parameter to macro should be a variable name */
> > +#define XE_MISSING_CASE(x) WARN(1, "Missing case (%s == %ld)\n", \
> > +				__stringify(x), (long)(x))
> > +
> 
> No, please! Let's not add unnecessary macros.

it's not a bad idea, actually... in i915 we have the MISSING_CASE
for switch cases with a defined number of cases and print
warnings in case none if them is the one inside the switch.

It's so widely used and actually nice to have that I thought many
times to move it to some core kernel libraries.

Andi
