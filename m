Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97A99C5B549
	for <intel-xe@archiver.kernel.org>; Sat, 31 May 2025 05:54:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A88910E263;
	Sat, 31 May 2025 05:54:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UMLCqXSv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E221310E275
 for <intel-xe@lists.freedesktop.org>; Sat, 31 May 2025 05:54:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748670841; x=1780206841;
 h=from:date:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=+yCu04RtzNhhwOiWuKndBy9a+Pk61SOWVN/Y2XiI91Q=;
 b=UMLCqXSvRpNxk5F2NH2ZhLcKGbGpHUz8rljcjTc5ryg/Hhe/BovNTUPf
 IB9QX7zgYuQhmgKRzAKi0RonshsE0bzQK05d0muLgi7USHmjdGWIYNzcU
 pq7KF5CReS5RcsAJW8P2QwKrnCct82uHz9t/mfGVfoVToLVmY28tm6y8F
 JPZ7l/OVV6/uHCyc1GE6pIiydHgYARKFA/OyO6Hvi0tZYpw7MApOlGqwB
 ZputxxMtdRuhPTmChnIGsJiJTf0UliORjMe35ys+UXza+YGsNwVWn6gNj
 SkqaaPXqM8UfR9Q1nDwjGO5EdF0kjouORMqqqG3YTWLDm+/W94ajXqBfB g==;
X-CSE-ConnectionGUID: qKrcJeuASQCiXixHv1MtNQ==
X-CSE-MsgGUID: dqGPOEmAR6adPUwfxh4D1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11449"; a="50680890"
X-IronPort-AV: E=Sophos;i="6.16,197,1744095600"; d="scan'208";a="50680890"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2025 22:54:00 -0700
X-CSE-ConnectionGUID: Agv7diwOTPO8DwD3TtWP1A==
X-CSE-MsgGUID: eTAStfUhRjq74NfEF0KINQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,197,1744095600"; d="scan'208";a="145036236"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.71])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2025 22:53:58 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Sat, 31 May 2025 08:53:54 +0300 (EEST)
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
cc: platform-driver-x86@vger.kernel.org, intel-xe@lists.freedesktop.org, 
 Hans de Goede <hdegoede@redhat.com>, lucas.demarchi@intel.com, 
 rodrigo.vivi@intel.com
Subject: Re: [PATCH 09/10] sysfs debug
In-Reply-To: <20250530203356.190234-9-michael.j.ruhl@intel.com>
Message-ID: <d78f55df-db7c-9134-996c-4ef4424ad7ae@linux.intel.com>
References: <20250530203356.190234-1-michael.j.ruhl@intel.com>
 <20250530203356.190234-9-michael.j.ruhl@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

On Fri, 30 May 2025, Michael J. Ruhl wrote:

No changelog.

> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> ---
>  drivers/platform/x86/intel/pmt/crashlog.c | 31 +++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
> 
> diff --git a/drivers/platform/x86/intel/pmt/crashlog.c b/drivers/platform/x86/intel/pmt/crashlog.c
> index 7291c93d71df..985f2c685841 100644
> --- a/drivers/platform/x86/intel/pmt/crashlog.c
> +++ b/drivers/platform/x86/intel/pmt/crashlog.c
> @@ -469,6 +469,34 @@ trigger_store(struct device *dev, struct device_attribute *attr,
>  }
>  static DEVICE_ATTR_RW(trigger);
>  
> +#define DEBUG_REGISTER_INFO
> +#ifdef DEBUG_REGISTER_INFO

Ah, I see, this is probably your debug/test patch you included by 
accident. :-)

> +static ssize_t
> +status_show(struct device *dev, struct device_attribute *attr, char *buf)
> +{
> +	struct crashlog_entry *crashlog = dev_get_drvdata(dev);
> +	u32 status = readl(crashlog->entry.disc_table + crashlog->info->status.offset);
> +	u32 control = readl(crashlog->entry.disc_table + crashlog->info->control.offset);
> +	int len = 0;
> +
> +	len += sysfs_emit_at(buf, len, "clear_support: 0x%08x\n", status & crashlog->info->status.clear_supported);
> +	len += sysfs_emit_at(buf, len, "rearmed: 0x%08x\n", status & crashlog->info->status.rearmed);
> +	len += sysfs_emit_at(buf, len, "error: 0x%08x\n", status & crashlog->info->status.error);
> +	len += sysfs_emit_at(buf, len, "consumed: 0x%08x\n", status & crashlog->info->status.consumed);
> +	len += sysfs_emit_at(buf, len, "disable: 0x%08x\n", status & crashlog->info->status.disabled);
> +	len += sysfs_emit_at(buf, len, "cleared: 0x%08x\n", status & crashlog->info->status.cleared);
> +	len += sysfs_emit_at(buf, len, "in_progress: 0x%08x\n", status & crashlog->info->status.in_progress);
> +	len += sysfs_emit_at(buf, len, "complete: 0x%08x\n", status & crashlog->info->status.complete);
> +	len += sysfs_emit_at(buf, len, "sts_off: 0x%02x  ctl_off: 0x%02x\n", crashlog->info->status.offset,
> +			     crashlog->info->control.offset);
> +	len += sysfs_emit_at(buf, len, "status:  0x%08x\n", status);
> +	len += sysfs_emit_at(buf, len, "control: 0x%08x\n", control);
> +
> +	return len;
> +}
> +static DEVICE_ATTR_RO(status);
> +#endif
> +
>  static struct attribute *pmt_crashlog_attrs[] = {
>  	&dev_attr_enable.attr,
>  	&dev_attr_trigger.attr,
> @@ -482,6 +510,9 @@ static struct attribute *pmt_crashlog_ver2_attrs[] = {
>  	&dev_attr_error.attr,
>  	&dev_attr_rearm.attr,
>  	&dev_attr_trigger.attr,
> +#ifdef DEBUG_REGISTER_INFO
> +	&dev_attr_status.attr,
> +#endif
>  	NULL
>  };
>  
> 

-- 
 i.

