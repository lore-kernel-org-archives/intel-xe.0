Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08186C02194
	for <intel-xe@archiver.kernel.org>; Fri,  7 Feb 2025 13:29:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5C9E10E31D;
	Fri,  7 Feb 2025 13:29:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QzsWdrEq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E89210E31D
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Feb 2025 13:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738934985; x=1770470985;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=XDXdapGZG3XpIIo6NzjkJPL4IAx0vf3ACXuSO45mxpo=;
 b=QzsWdrEq4LmIW/+0eXjsNZTGcI3qoV3i9xABcgGH9yNE0cw+U45wgFk4
 hC6lk5HBy9FGBNZq94n7tnFzK9Gesze4Ci/67gyuolhu8y1UwkZUzmRSn
 PrQw9CG8o7ksNeiOqvxnfqoQlnHjGvJDq/Tum5qn/Fo6lydT6f8OlJthO
 e4ieTjE5PFmJ8xFTEUUjqDBqYRPenwD5qFoxvB5KMRd+kRv9o7Wtng9/U
 awwoO7V8MzPQLdX718xQF8RS3tsQ83YjlMJIC6xeNTdj2P0U2FCtMDPEu
 4AlW/cZ+0HCf2TblVbsQLVpSPvw7bqYLx27LabRC1DO/d5VVwhS6a5XMy w==;
X-CSE-ConnectionGUID: Lui8oaw6QQOFXUey22+b2g==
X-CSE-MsgGUID: YWc69GspSr28vsxbdmtAgA==
X-IronPort-AV: E=McAfee;i="6700,10204,11338"; a="39481538"
X-IronPort-AV: E=Sophos;i="6.13,267,1732608000"; d="scan'208";a="39481538"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2025 05:29:45 -0800
X-CSE-ConnectionGUID: XSk6qiWKTpqqWu6BnXECNw==
X-CSE-MsgGUID: PNSzpwuMQsmuVr2qL5EaDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,267,1732608000"; d="scan'208";a="112154511"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO [10.245.99.135])
 ([10.245.99.135])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2025 05:29:44 -0800
Message-ID: <725f8e35-c395-4f3e-8bd9-b8c928958740@linux.intel.com>
Date: Fri, 7 Feb 2025 14:29:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Enable SR-IOV for PTL
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
 =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>
References: <20250206214545.940-1-michal.wajdeczko@intel.com>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20250206214545.940-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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



On 2/6/2025 10:45 PM, Michal Wajdeczko wrote:
> We should now have sufficient changes in the driver to run it on
> PTL platforms in the SR-IOV Physical Function (PF) mode, that would
> allow us to enable SR-IOV Virtual Functions (VFs), and successfully
> probe our driver in the VF mode on enabled VF devices.
> 
> To unblock SR-IOV PF mode you need to load xe with modparam:
> 
>   xe.max_vfs=7
> 
> Then to enable VFs it is sufficient to use:
> 
>   $ echo 7 > /sys/bus/pci/devices/0000:00:02.0/sriov_numvfs
> 
> Note that in default auto-provisioning all VFs are allocated with
> some amount of shared resources (like unlimited GPU execution and
> preemption times, fair GGTT space, fair GuC context IDs range, ...)
> 
> However with CONFIG_DEBUG_FS enabled it is possible to tweak most
> of the SR-IOV configuration parameters using attributes like:
> 
>   /sys/kernel/debug/dri/0000:00:02.0/gt0/
>   ├── pf
>   │   ├── contexts_spare
>   │   ├── doorbells_spare
>   │   ├── exec_quantum_ms
>   │   ├── ggtt_spare
>   │   ├── preempt_timeout_us
>   │   ├── sched_priority
>   │   └── ...
>   ├── vf1
>   │   ├── contexts_quota
>   │   ├── doorbells_quota
>   │   ├── exec_quantum_ms
>   │   ├── ggtt_quota
>   │   ├── preempt_timeout_us
>   │   ├── sched_priority
>   │   └── ...
>   ├── vf2
>   │   └── ...
>   :
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Thomas Hellstrom <thomas.hellstrom@linux.intel.com>
> ---
> Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
> Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> ---
>   drivers/gpu/drm/xe/xe_pci.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index e8ef7d6b4db8..6a8e82aff385 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -367,6 +367,7 @@ static const struct xe_device_desc ptl_desc = {
>   	PLATFORM(PANTHERLAKE),
>   	.dma_mask_size = 46,
>   	.has_display = true,
> +	.has_sriov = true,

LGTM,

        name: ptl_vm_bat_results on xe-pw-144449v1
        ----  --------------------
        pass:                  227
        fail:                    0
       crash:                    0
        skip:                   86  (all expected skips: 
fbdev(5),kms(58),PF tests(3), xe_gt_freq(3), xe_evict(11), xe_pat(3), 
xe_pm_residency(1), xe_mmap@vram(1), xe_live_ktest@xe_migrate(1))
     timeout:                    0
        warn:                    0
  incomplete:                    0
  dmesg-warn:                    0
  dmesg-fail:                    0
     changes:                    0
       fixes:                    0
regressions:                    0
       total:                  313
        time:             00:00:49


Tested-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Reviewed-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>

>   	.require_force_probe = true,
>   };
>   

