Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C2C2F8A160
	for <intel-xe@archiver.kernel.org>; Thu, 16 Apr 2026 11:54:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 416F010E890;
	Thu, 16 Apr 2026 11:54:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="juzYmMLu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0293F10E890
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Apr 2026 11:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776340465; x=1807876465;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=hsRfQ32+a1HNQ7bDnBSNCthlhipR6Bmg9AM5VKkolvM=;
 b=juzYmMLukZc+fxZ/249+sdjE7yys9Oa5uNaodITRZAF8YQcsUcohXiEQ
 FY5OJuPahCe2WE12TnN9PbuzxQGOQgivYCTlpcAslEg56J2inaXJYVvh7
 E6Hs0qXs/3tiQiqq0b/iq+swcDgdkll+xJSnaV/Cxi2v9JwZe5hro1Hbl
 O8XUTYAdGzCgUnfegKBLseMgIq2euGvIZ+VEQ1kPU1J3kuDch+SrjK1W1
 zeInrkA85IV/BqGxs8oKB0eJO99QLYRNQuUoPN868aJU0HV/sMvDsVSBN
 fhC3Uc0cwbcX0CNV0JcMdOBAlMcGfbHhlE8VVaX1WcLKw05TMDkI2ESBZ g==;
X-CSE-ConnectionGUID: HMy38S62S/KYm0+1ilHhYQ==
X-CSE-MsgGUID: Byhbkr25SxSL40vJu8i9TQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="99985113"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="99985113"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 04:54:24 -0700
X-CSE-ConnectionGUID: fJ5YrvRjTuyeVLkyJ7LmSQ==
X-CSE-MsgGUID: zNPXLOk6RFGbWWgndOQq3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="227566391"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.251])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 04:54:20 -0700
Date: Thu, 16 Apr 2026 13:54:18 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Soham Purkait <soham.purkait@intel.com>
Cc: intel-xe@lists.freedesktop.org, riana.tauro@intel.com,
 anshuman.gupta@intel.com, aravind.iddamsetty@linux.intel.com,
 badal.nilawar@intel.com, raag.jadav@intel.com,
 ravi.kishore.koppuravuri@intel.com, mallesh.koujalagi@intel.com,
 anoop.c.vijay@intel.com
Subject: Re: [PATCH v1 2/2] drm/xe/xe_ras: Add RAS support for GPU health
 indicator
Message-ID: <aeDN6g6HWd3v-V72@ashyti-mobl2.lan>
References: <20260416093610.4085667-1-soham.purkait@intel.com>
 <20260416093610.4085667-3-soham.purkait@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260416093610.4085667-3-soham.purkait@intel.com>
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

Hi Soham,

On Thu, Apr 16, 2026 at 03:06:10PM +0530, Soham Purkait wrote:
> GPU health indicator exposes a single sysfs interface, gpu_health,
> at the device level, allowing administrators and management tools to
> query the GPU health status. The interface permits both read and write
> operations on PF and native functions, while on VFs it is exposed as
> read-only.

Can you describe better the interfaces? The input and output
values?

> v1:
>  - gpu_health is read-write on PFs and native functions. It is read-only
>    on VFs. VF write attempts are rejected.

Are you adding a changelog for V1?

> Signed-off-by: Soham Purkait <soham.purkait@intel.com>

...

> +static const char * const gpu_health_states[] = { "ok", "warning", "critical" };
> +static const char * const gpu_health_fmt[] = {
> +	"[%s] %s %s\n",
> +	"%s [%s] %s\n",
> +	"%s %s [%s]\n",
> +};

Please, don't use complex sentences in sysfs outputs. Use a
single string/character/value

...

> +static ssize_t gpu_health_show(struct device *dev, struct device_attribute *attr, char *buf)
> +{
> +	struct xe_device *xe = kdev_to_xe_device(dev);
> +	struct xe_sysctrl_mailbox_command command = {0};
> +	struct xe_ras_health_get_response response = {0};
> +	struct xe_ras_health_get_input request = {0};
> +	u8 health;
> +	int ret;
> +	size_t rlen = 0;
> +
> +	prepare_sysctrl_command(&command, XE_SYSCTRL_CMD_GET_HEALTH, &request,
> +				sizeof(request), &response, sizeof(response));
> +	ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen);
> +	if (ret) {
> +		xe_err(xe, "[RAS]: Sysctrl error ret %d\n", ret);
> +		return -EIO;

why not return ret? (same goes for the rest of the function and
the store() function).

> +	}
> +	if (rlen != sizeof(response)) {
> +		xe_err(xe,
> +		       "[RAS]: invalid Sysctrl response length %zu (expected %zu)\n",
> +		       rlen, sizeof(response));
> +		return -EIO;
> +	}
> +	if (response.current_health >= ARRAY_SIZE(gpu_health_states)) {
> +		xe_err(xe, "[RAS]: invalid health state %u from Sysctrl\n",
> +		       response.current_health);
> +		return -EIO;
> +	}

...

> +static ssize_t gpu_health_store(struct device *dev, struct device_attribute *attr,
> +				const char *buf, size_t count)
> +{

...

> +	if (IS_SRIOV_VF(xe)) {
> +		xe_dbg(xe, "[RAS]: GPU health state update rejected on VF\n");
> +		return -EPERM;
> +	}

This is redundant as this function wouldn't be used for sriov.

> +	state = sysfs_match_string(gpu_health_states,
> +				   buf);
> +	if (state < 0)
> +		return -EINVAL;
> +
> +	request.new_health = (xe_ras_health_status_t)state;
> +
> +	prepare_sysctrl_command(&command, XE_SYSCTRL_CMD_SET_HEALTH, &request,
> +				sizeof(request), &response, sizeof(response));
> +	ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen);
> +	if (ret) {
> +		xe_err(xe, "[RAS]: Sysctrl error ret %d\n", ret);
> +		return -EIO;
> +	}
> +	if (rlen != sizeof(response)) {
> +		xe_err(xe,
> +		       "[RAS]: invalid Sysctrl response length %zu (expected %zu)\n",
> +		       rlen, sizeof(response));
> +		return -EIO;
> +	}
> +	if (response.current_health >= ARRAY_SIZE(gpu_health_states)) {
> +		xe_err(xe, "[RAS]: invalid health state %u from Sysctrl\n",
> +		       response.current_health);
> +		return -EIO;
> +	}
> +
> +	health = response.current_health;
> +
> +	xe_dbg(xe, "[RAS]: current GPU health state=%d (%s)\n",
> +	       health, gpu_health_states[health]);
> +

BTW, why do we need the field response.operation_status that is
not used at all here?

> +	return count;
> +}
> +
> +static struct device_attribute dev_attr_gpu_health_rw =
> +	__ATTR_RW_MODE(gpu_health, 0600);
> +
> +static struct device_attribute dev_attr_gpu_health_ro =
> +	__ATTR_RO_MODE(gpu_health, 0400);
> +
> +static struct device_attribute *gpu_health_attr(struct xe_device *xe)
> +{
> +	return IS_SRIOV_VF(xe) ? &dev_attr_gpu_health_ro : &dev_attr_gpu_health_rw;
> +}

...

> +static void gpu_health_indicator_sysfs_init(struct xe_device *xe)
> +{
> +	struct device *dev = xe->drm.dev;
> +	int err;
> +
> +	err = device_create_file(dev, gpu_health_attr(xe));
> +	if (err)
> +		goto err;

Please, don't use goto this way. If you need only one log out of
the outcome of this function, print it in _init(): make this
an int function, return err and check err in the calling
function.

Andi

> +
> +	err = devm_add_action_or_reset(dev, gpu_health_sysfs_fini, dev);
> +	if (err)
> +		goto err;
> +
> +	return;
> +
> +err:
> +	xe_err(xe, "[RAS]: failed to initialize GPU health sysfs, err=%d\n", err);
> +}
> +
> +/**
> + * xe_ras_init - Initialize Xe RAS
> + * @xe: xe device instance
> + *
> + * Initialize Xe RAS
> + */
> +void xe_ras_init(struct xe_device *xe)
> +{
> +	if (!xe->info.has_sysctrl)
> +		return;
> +
> +	gpu_health_indicator_sysfs_init(xe);
> +}
