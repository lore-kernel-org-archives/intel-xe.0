Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FC64EB64DA
	for <intel-xe@archiver.kernel.org>; Wed, 14 Jun 2023 10:03:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2CBA10E438;
	Wed, 14 Jun 2023 10:02:59 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 069D310E438
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Jun 2023 10:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686736977; x=1718272977;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=bAjrV4VuVLKD2uYfpOszhmJUKC7BD7RvvypjWieb+f4=;
 b=hxx7KSPcoO5wykiSf44PPsjyseDsi7k2OJXUmXXATE03fyCn2lVv4UHU
 scIhIo9ajUeRF4irwWsd+8PIOHRWWtbZTbCYAkDhSgjbCEEAp+Bys9Z4+
 JFMWR5ZWxptnKbpiqLZeZg5ISo+kEVZdcfrFOXEcji4fMuf9Mgb0lM1UP
 EahFYVJ8FxJU1kbYT0aAMp4Ya46X80GBDC3UppER89xR6jtjTQCrSkEQb
 cWPpiNo3v6h4e0CBOEU6ecDk87eD+stuFt/OdcIM9DWoypklux2eM2tmI
 5R/aS6Poqc5rAV/Dt1tghgAPeCjhcS7ck3Jf6O6p9Wj5cF2SjNqyzQ5TO A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="348233768"
X-IronPort-AV: E=Sophos;i="6.00,242,1681196400"; d="scan'208";a="348233768"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2023 03:02:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="711993063"
X-IronPort-AV: E=Sophos;i="6.00,242,1681196400"; d="scan'208";a="711993063"
Received: from jrowe2-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.249.44.185])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2023 03:02:52 -0700
Date: Wed, 14 Jun 2023 12:02:50 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Riana Tauro <riana.tauro@intel.com>
Message-ID: <ZImQSlvLphPOU5RW@ashyti-mobl2.lan>
References: <20230613084721.3698818-1-riana.tauro@intel.com>
 <20230613084721.3698818-2-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230613084721.3698818-2-riana.tauro@intel.com>
Subject: Re: [Intel-xe] [PATCH 1/2] drm/xe: add a new sysfs directory for
 gtidle properties
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
Cc: joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
 vinay.belgaumkar@intel.com, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hi Riana,

Thanks for Cc'ing me to this patch, I have a few questions.

[...]

> @@ -306,6 +307,10 @@ static int gt_fw_domain_init(struct xe_gt *gt)
>  	if (err)
>  		goto err_force_wake;
>  
> +	err = xe_gt_idle_sysfs_init(&gt->gtidle);
> +	if (err)
> +		goto err_force_wake;

do we really want to fail here? The driver would still work
without sysfs.

In my opinion this should be a warning.

> +
>  	/* XXX: Fake that we pull the engine mask from hwconfig blob */
>  	gt->info.engine_mask = gt->info.__engine_mask;

[...]

> +static u64 get_residency_ms(struct xe_gt_idle *gtidle, u64 cur_residency)
> +{
> +	u64 delta, overflow_residency, prev_residency;
> +
> +	overflow_residency = BIT_ULL(32);
> +
> +	/*
> +	 * Counter wrap handling
> +	 * Store previous hw counter values for counter wrap-around handling
> +	 * Relying on sufficient frequency of queries otherwise counters can still wrap.
> +	 */
> +	prev_residency = gtidle->prev_residency;
> +	gtidle->prev_residency = cur_residency;
> +
> +	/* delta */
> +	if (cur_residency >= prev_residency)
> +		delta = cur_residency - prev_residency;
> +	else
> +		delta = cur_residency + (overflow_residency - prev_residency);
> +
> +	/* Add delta to extended raw driver copy of idle residency */
> +	cur_residency = gtidle->cur_residency + delta;
> +	gtidle->cur_residency = cur_residency;
> +
> +	/* residency multiplier in ns, convert to ms */
> +	cur_residency = mul_u64_u32_div(cur_residency, gtidle->residency_multiplier, 1e6);

do we need to lock something here? Looks a bit racy to me.

> +	return cur_residency;
> +}

[...]

> +static void gt_idle_sysfs_fini(struct drm_device *drm, void *arg)
> +{
> +	struct kobject *kobj = arg;
> +
> +	sysfs_remove_files(kobj, gt_idle_attrs);
> +	kobject_put(kobj);
> +}
> +
> +int xe_gt_idle_sysfs_init(struct xe_gt_idle *gtidle)
> +{
> +	struct xe_gt *gt = gtidle_to_gt(gtidle);
> +	struct xe_device *xe = gt_to_xe(gt);
> +	struct kobject *kobj;
> +	int err;
> +
> +	kobj = kobject_create_and_add("gtidle", gt->sysfs);
> +	if (!kobj)
> +		return -ENOMEM;

I think we shouldn't fail here... although enomem is quite a
severe error, but still I think i915 can still work without
sysfs.

> +	sprintf(gtidle->name, "gt%d-rc\n", gt->info.id);
> +	/* Multiplier for  RC6 Residency counter in units of 1.28us */
> +	gtidle->residency_multiplier = 1280;
> +	gtidle->idle_residency = xe_guc_pc_rc6_residency;
> +	gtidle->idle_status = xe_guc_pc_rc_status;

why are we saving "xe_guc_pc_rc_status" and
"xe_guc_pc_rc6_residency" inside gtidle? What are the
alternatives? Why can't we call them directly?

> +	err = sysfs_create_files(kobj, gt_idle_attrs);
> +	if (err) {
> +		kobject_put(kobj);
> +		return err;
> +	}
> +
> +	err = drmm_add_action_or_reset(&xe->drm, gt_idle_sysfs_fini, kobj);

Just

	return drmm_add_action_or_reset(&xe->drm, gt_idle_sysfs_fini, kobj);

In any case I would make this function "void" and print warnings
in case of failures.

Thanks,
Andi

> +	if (err)
> +		return err;
> +
> +	return 0;
> +}
