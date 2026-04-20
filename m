Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45777F36C58
	for <intel-xe@archiver.kernel.org>; Mon, 20 Apr 2026 08:21:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06CCF10E46A;
	Mon, 20 Apr 2026 08:21:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DDscwd59";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8042E10E114
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Apr 2026 08:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776673284; x=1808209284;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=qxlYS77blfMx87TB2ME2hq+49BwhINpkvvmvhod4MKY=;
 b=DDscwd59VyySqqvn7eWOWwJIbDTv3r3c39D2/hPj8CIFm/Zm9ij2UrLh
 TYBweX/za8sPup8IuCPiqAfwTlLytTJ5//dhE6yAzlGw+smeAQVSE7G3U
 S4PhKN9vHF3pt4k4nU5ens3ICrMM+83sfsSvfmq7OrysTjNQGt79t9KvF
 eZ7hF/8CZXP8m4yFEXKo3CPuKQueVWUJxJkgb3FJAe+EfOtNvBuOwGWnM
 nFq5udz/tGjwVl3ykaUz171Rm8rwWOapEVrsIT/JYPbe4RcB2xYDJnHai
 HQVDzJ9pajFwzDVf4s5kzqTMeMrQ7iGYFGNTVIhngBqIw79MnnFjx4a0i w==;
X-CSE-ConnectionGUID: CZ/bNL27TPaM33UfhEVQtg==
X-CSE-MsgGUID: Gsp3i5BNQki9fSLn3e5Row==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="77597351"
X-IronPort-AV: E=Sophos;i="6.23,189,1770624000"; d="scan'208";a="77597351"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2026 01:21:24 -0700
X-CSE-ConnectionGUID: ZbnLy0xSSDO0ee2yMP4OyQ==
X-CSE-MsgGUID: FTMZyW5kSq6hZdgpL7Nhzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,189,1770624000"; d="scan'208";a="236645631"
Received: from unknown (HELO black.igk.intel.com) ([10.91.253.5])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2026 01:21:18 -0700
Date: Mon, 20 Apr 2026 10:21:13 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: "Tauro, Riana" <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 rodrigo.vivi@intel.com, aravind.iddamsetty@linux.intel.com,
 badal.nilawar@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com
Subject: Re: [PATCH v2 3/5] drm/xe/xe_ras: Add support to query error counter
 for CRI
Message-ID: <aeXh-QaXIpqBY1Mn@black.igk.intel.com>
References: <20260406145440.2016065-7-riana.tauro@intel.com>
 <20260406145440.2016065-10-riana.tauro@intel.com>
 <ady1PyArv2MFbwz3@black.igk.intel.com>
 <00921c44-5120-4d77-841c-efd199f37f49@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <00921c44-5120-4d77-841c-efd199f37f49@intel.com>
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

On Mon, Apr 20, 2026 at 12:03:06PM +0530, Tauro, Riana wrote:
> On 4/13/2026 2:49 PM, Raag Jadav wrote:
> > On Mon, Apr 06, 2026 at 08:24:42PM +0530, Riana Tauro wrote:
> > > Add support to get error counter value for CRI.
> > > 
> > > When userspace queries a drm_ras error counter, fetch the
> > > latest counter value from system controller.

...

> > > +static int get_error_counter(struct xe_device *xe, struct xe_ras_error_class *error_class,
> > > +			     u32 *value)
> > > +{
> > > +	struct xe_ras_get_counter_response response = {0};
> > > +	struct xe_ras_get_counter_request request = {0};
> > > +	struct xe_sysctrl_mailbox_command command = {0};
> > > +	size_t rlen;
> > > +	int ret;
> > > +
> > > +	request.error_class = *error_class;
> > > +
> > > +	prepare_sysctrl_command(&command, XE_SYSCTRL_CMD_GET_COUNTER, &request, sizeof(request),
> > > +				&response, sizeof(response));
> > > +
> > > +	ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen);
> > > +	if (ret) {
> > > +		xe_err(xe, "[RAS]: Sysctrl error ret %d\n", ret);
> > This gives the impression of RAS error, but is it really?
> 
> This command can be used from different components. This will help
> differentiate
> the file.

File is not much useful for debugging, what's probably more useful is
distinguishable error message.

	xe_err(xe, "sysctrl: failed to get counter %d\n", ret);

or perhaps

	xe_err(xe, "sysctrl: command %x failed with %d\n", cmd, ret);

Also, I think [RAS] tag should be exclusive to hardware errors but I'll
leave it to you all.

> > > +		return ret;
> > > +	}
> > > +
> > > +	if (rlen != sizeof(response)) {
> > > +		xe_err(xe, "[RAS]: Sysctrl response size mismatch. Expected %zu, got %zu\n",
> > Ditto.
> > 
> > > +		       sizeof(response), rlen);
> > > +		return -EINVAL;
> > Is this propagated back to the user? If yes, is this the correct error
> > code for the scenario?
> 
> Yes the error code will be propagated back to the user.  Any suggestions?
> EIO for system controller errors?

Yep, we tried to query system controller but it had different (or perhaps
no) idea what it was.

PS: Probably another reason to not have [RAS] in error message ;)

Raag

> > > +	}
> > > +
> > > +	*value = response.counter_value;
> > > +
> > > +	return 0;
> > > +}
