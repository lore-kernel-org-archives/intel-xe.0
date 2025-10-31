Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19A35CCF9EE
	for <intel-xe@archiver.kernel.org>; Fri, 31 Oct 2025 06:08:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7B6C10E13F;
	Fri, 31 Oct 2025 06:08:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WBs8La61";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18BA110E13F
 for <intel-xe@lists.freedesktop.org>; Fri, 31 Oct 2025 06:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761890933; x=1793426933;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=i/y2VkjW8BMSmo79njrynG9JBtiQBgZOWP4uIkYDz98=;
 b=WBs8La612YbAdBSEU9mERfEEx9GWMZi6JfbYoeUOp2U6beXJkq1EiJPT
 9PXFylFAc3sAIcoqwiv1SydZNztoWGmX3Cb1kk+9iK4TtBEPo39K6mIEU
 Ni5loFRn9+J6mtlP/Rir/e8UEwrNpwfRdCc42ZDJwbjHa5TUjF2TD3Yy+
 yh8vCVCOQDwzli471TLo486XMBO64kUZkdXBL6L/srtAT6VPPg8zKk3NE
 WNd1k091qHdRCGfqbKGrcyHkJenIzPbsszTuMhC8aOlTuv5gKdVqj5pyt
 0XCsMig5awpj/wubBvkOz3WKLk4MMInvtj7K+dTTs1cre5evmco46RKKo w==;
X-CSE-ConnectionGUID: 9PPCfTvWR5iVehQD3ZduCg==
X-CSE-MsgGUID: YjUxOAv9TCq69KA1bnn8XA==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="66658432"
X-IronPort-AV: E=Sophos;i="6.19,268,1754982000"; d="scan'208";a="66658432"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 23:08:53 -0700
X-CSE-ConnectionGUID: iVmyfriHRteZbBBOIRm3gQ==
X-CSE-MsgGUID: pXhhBI8gT7aYQmKC4Syhew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,268,1754982000"; d="scan'208";a="185813484"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 23:08:52 -0700
Date: Fri, 31 Oct 2025 07:08:48 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Cc: "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v3 8/8] drm/xe/gt_throttle: Avoid TOCTOU when monitoring
 reasons
Message-ID: <aQRScHYyxiaAHuNU@black.igk.intel.com>
References: <20251029-gt-throttle-cri-v3-0-d1f5abbb8114@intel.com>
 <20251029-gt-throttle-cri-v3-8-d1f5abbb8114@intel.com>
 <aQM1oKHBh0GvQQK5@black.igk.intel.com>
 <jnuis4h4uq7he4yq52rsb7ee6jffgclyf4skvftu3m3gsnk7xy@vhtbsgchkvyx>
 <aQOIdza-zd3ES9xw@intel.com> <aQONFr2dRVU93R3T@black.igk.intel.com>
 <qcs3fp5unhjdbqwlayweo4c42igytx3n5xro7tbs7kkso2lnzz@zcelrecmbsfe>
 <3e341f0de412ec02c3c4d7209d54b9b2cf88ec1d.camel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3e341f0de412ec02c3c4d7209d54b9b2cf88ec1d.camel@intel.com>
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

On Fri, Oct 31, 2025 at 01:24:08AM +0530, Vivi, Rodrigo wrote:
> On Thu, 2025-10-30 at 13:43 -0500, Lucas De Marchi wrote:
> > On Thu, Oct 30, 2025 at 05:06:46PM +0100, Raag Jadav wrote:
> > > On Thu, Oct 30, 2025 at 11:47:03AM -0400, Rodrigo Vivi wrote:
> > > > On Thu, Oct 30, 2025 at 09:55:30AM -0500, Lucas De Marchi wrote:
> > > > > On Thu, Oct 30, 2025 at 10:53:36AM +0100, Raag Jadav wrote:
> > > > > > On Wed, Oct 29, 2025 at 04:45:10PM -0700, Lucas De Marchi
> > > > > > wrote:
> > > > > > > It's currently not possible to safely monitor if there's
> > > > > > > throttling
> > > > > > > happening and what are the reasons. The approach of reading
> > > > > > > the status
> > > > > > > and then reading the reasons is not reliable as by the time
> > > > > > > sysadmin
> > > > > > > reads the reason, the throttling could not be happening
> > > > > > > anymore.
> > > > > > > 
> > > > > > > Previous tentative to fix that[1] was breaking the ABI and
> > > > > > > potentially
> > > > > > > sysadmin's scripts. This takes a different approach of
> > > > > > > adding and
> > > > > > > documenting the additional attribute. It's still valuable,
> > > > > > > though
> > > > > > > redundant, to provide the simpler 0/1 interface.
> > > > > > > 
> > > > > > > In order to avoid userspace knowledge on the bitmask
> > > > > > > meaning and to be
> > > > > > > able to maintain the kernel side in sync with possible
> > > > > > > changes in
> > > > > > > future, just walk the attribute group and check what are
> > > > > > > the masks that
> > > > > > > match the value read.
> > > > > > > 
> > > > > > > [1]
> > > > > > > https://lore.kernel.org/intel-xe/20241025092238.167042-1-raag.jadav@intel.com/
> > > > > > 
> > > > > > ...
> > > > > > 
> > > > > > > +static const struct attribute_group
> > > > > > > *get_platform_throttle_group(struct xe_device *xe);
> > > > > > > +
> > > > > > > +static ssize_t status_reasons_show(struct kobject *kobj,
> > > 
> > > Semantically there's much of a 'status' here, so this could simply
> > > be
> > > 'reasons' (and same for the attribute name).
> > > 
> > > > > > > +				   struct kobj_attribute
> > > > > > > *attr, char *buff)
> > > > > > > +{
> > > > > > > +	struct xe_gt *gt = throttle_to_gt(kobj);
> > > > > > > +	struct xe_device *xe = gt_to_xe(gt);
> > > > > > > +	const struct attribute_group *group;
> > > > > > > +	struct attribute **pother;
> > > > > > > +	ssize_t ret = 0;
> > > > > > > +	u32 reasons;
> > > > > > > +
> > > > > > > +	reasons = xe_gt_throttle_get_limit_reasons(gt);
> > > > > > > +	group = get_platform_throttle_group(xe);
> > > > > > > +
> > > > > > > +	for (pother = group->attrs; *pother; pother++) {
> > > > > > > +		struct kobj_attribute *kattr =
> > > > > > > container_of(*pother, struct kobj_attribute, attr);
> > > > > > > +		struct throttle_attribute *other_ta =
> > > > > > > kobj_attribute_to_throttle(kattr);
> > > > > > > +
> > > > > > > +		if (other_ta->mask != U32_MAX && reasons &
> > > > > > > other_ta->mask)
> > > > > > > +			ret += sysfs_emit_at(buff, ret,
> > > > > > > "%s ", (*pother)->name);
> > > > > > 
> > > > > > Much better.
> > > > > > 
> > > > > > > +	}
> > > > > > > +
> > > > > > > +	/* Drop extra space from last iteration above */
> > > > > > > +	if (ret)
> > > > > > > +		ret--;
> > > > > > > +
> > > > > > > +	ret += sysfs_emit_at(buff, ret, "\n");
> > > > > > 
> > > > > > I went through the documentation again and I couldn't find
> > > > > > any rules
> > > > > > related to empty files or whether it is allowed (just
> > > > > > thinking out
> > > > > > loud about no throttling cases).
> > > > > 
> > > > > do you mean if "empty" files are allowed in sysfs? I don't
> > > > > think there's
> > > > > any problem with that. It's also not empty, it has a newline
> > > > > there ;)
> > > > 
> > > > alternatively we could print the entire reg in hex format?
> > > > But I prefer the text line in this patch.
> > > > 
> > > > Nothing against the 'empty' file with or without the new-line,
> > > > but perhaps we could consider to track that in the loop
> > > > and if none is add we print
> > > > 
> > > > if (ret)
> > > > 	ret--;
> > > > else
> > > > 	sysfs_emit_at(buff, ret, "none");
> > > > 
> > > > and document that above...
> > > 
> > > +1.
> > 
> > collecting all the review commends from you 2, that would be with
> > this
> > diff squashed:
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_gt_throttle.c
> > b/drivers/gpu/drm/xe/xe_gt_throttle.c
> > index ca45aea8c17a6..f3476fda7f4f6 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_throttle.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_throttle.c
> > @@ -22,15 +22,15 @@
> >    * Their availability depend on the platform and some may not be
> > visible if that
> >    * reason is not available.
> >    *
> > - * The ``status_reasons`` attribute can be used by sysadmin
> > monitoring all
> > - * possible reasons for throttling and reporting them. It's
> > preferred over
> > - * monitoring ``status`` and then reading the reason both for
> > simplicity and to
> > - * avoid TOCTOU (time-of-check to time-of-use).
> > + * The ``reasons`` attribute can be used by sysadmin to monitor all
> > possible
> > + * reasons for throttling and report them. It's preferred over
> > monitoring
> > + * ``status`` and then reading the reason from individual attributes
> > since that
> > + * is racy. If there's no throttling happening, "none" is returned.
> >    *
> >    * The following attributes are available on Crescent Island
> > platform:
> >    *
> >    * - ``status``: Overall throttle status (0: no throttling, 1:
> > throttling)
> > - * - ``status_reasons``: All reasons causing throttling separated by
> > newline.
> > + * - ``reasons``: All reasons causing throttling separated by space

"Array of" ...

> >    * - ``reason_pl1``: package PL1
> >    * - ``reason_pl2``: package PL2
> >    * - ``reason_pl4``: package PL4
> > @@ -50,7 +50,7 @@
> >    * Other platforms support the following reasons:
> >    *
> >    * - ``status``: Overall throttle status (0: no throttling, 1:
> > throttling)
> > - * - ``status_reasons``: All reasons causing throttling separated by
> > newline.
> > + * - ``reasons``: All reasons causing throttling separated by space

Ditto.

> >    * - ``reason_pl1``: package PL1
> >    * - ``reason_pl2``: package PL2
> >    * - ``reason_pl4``: package PL4, Iccmax etc.
> > @@ -120,8 +120,8 @@ static ssize_t reason_show(struct kobject *kobj,
> >   
> >   static const struct attribute_group
> > *get_platform_throttle_group(struct xe_device *xe);
> >   
> > -static ssize_t status_reasons_show(struct kobject *kobj,
> > -				   struct kobj_attribute *attr, char
> > *buff)
> > +static ssize_t reasons_show(struct kobject *kobj,
> > +			    struct kobj_attribute *attr, char *buff)
> >   {
> >   	struct xe_gt *gt = throttle_to_gt(kobj);
> >   	struct xe_device *xe = gt_to_xe(gt);
> > @@ -141,9 +141,11 @@ static ssize_t status_reasons_show(struct
> > kobject *kobj,
> >   			ret += sysfs_emit_at(buff, ret, "%s ",
> > (*pother)->name);
> >   	}
> >   
> > -	/* Drop extra space from last iteration above */
> >   	if (ret)
> > +		/* Drop extra space from last iteration above */
> >   		ret--;
> > +	else
> > +		ret += sysfs_emit_at(buff, ret, "none");
> >   
> >   	ret += sysfs_emit_at(buff, ret, "\n");
> >   
> > @@ -162,7 +164,7 @@ static ssize_t status_reasons_show(struct kobject
> > *kobj,
> >   		.mask = _mask,					\
> >   	}
> >   
> > -static THROTTLE_ATTR_RO_FUNC(status_reasons, 0,
> > status_reasons_show);
> > +static THROTTLE_ATTR_RO_FUNC(reasons, 0, reasons_show);
> >   static THROTTLE_ATTR_RO(status, U32_MAX);
> >   static THROTTLE_ATTR_RO(reason_pl1, POWER_LIMIT_1_MASK);
> >   static THROTTLE_ATTR_RO(reason_pl2, POWER_LIMIT_2_MASK);
> > @@ -174,7 +176,7 @@ static THROTTLE_ATTR_RO(reason_vr_thermalert,
> > VR_THERMALERT_MASK);
> >   static THROTTLE_ATTR_RO(reason_vr_tdc, VR_TDC_MASK);
> >   
> >   static struct attribute *throttle_attrs[] = {
> > -	&attr_status_reasons.attr.attr,
> > +	&attr_reasons.attr.attr,
> >   	&attr_status.attr.attr,
> >   	&attr_reason_pl1.attr.attr,
> >   	&attr_reason_pl2.attr.attr,
> > @@ -200,7 +202,7 @@ static THROTTLE_ATTR_RO(reason_psys_crit,
> > PSYS_CRIT_MASK);
> >   
> >   static struct attribute *cri_throttle_attrs[] = {
> >   	/* Common */
> > -	&attr_status_reasons.attr.attr,
> > +	&attr_reasons.attr.attr,
> >   	&attr_status.attr.attr,
> >   	&attr_reason_pl1.attr.attr,
> >   	&attr_reason_pl2.attr.attr,
> 
> works for me. count on my rv-b.
> 
> unless Raag has any further concern...

Works for me as well.

Raag
