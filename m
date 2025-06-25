Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39A00C77B7C
	for <intel-xe@archiver.kernel.org>; Wed, 25 Jun 2025 14:21:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D1FB10E73D;
	Wed, 25 Jun 2025 14:20:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FZsy9vgr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62B4210E742
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Jun 2025 14:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750861258; x=1782397258;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=0/kQNSohHm26yf07CgeRrMGHtAF2wAdf+hzMIIfAO9k=;
 b=FZsy9vgrQGz7OQYzQKNHm/F5qU3BP73zoaQVZv/neLv362Hrl2F1ToW+
 IEBuNGYG/kvyGIpl0zd1TZ/sq/mrpWfWqUjWgqFo0FA0RlJcjo3ffHvq+
 rQZFm27aF8U6l0jUADNvgDzN/4WvsLT9mKRSGtKuK2MW9Buj2WMZvXV8o
 D7j16mH9F+lXNYFYOwdHE0IT42rcxmpnXzC+pBK+A1KDnhbefnlg9jfYS
 HaXq3unxWqXfkUtcVYR79R2jvE4fEuUOrdrHGJeU/l08ntrjbfo2+Kby5
 HOtLQ13gVFzyUTKSlxruTpXyBVTDGxwnrlhW2EuuoJCj642QSKrGM/cTi g==;
X-CSE-ConnectionGUID: qCa7pA2rSo6slCvWqHbq0w==
X-CSE-MsgGUID: gyEw6qXvTSKgIW+IQptJoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="52854745"
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; d="scan'208";a="52854745"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 07:20:57 -0700
X-CSE-ConnectionGUID: 8+KU4BQVTyeZ6TX0DEzq3Q==
X-CSE-MsgGUID: 7Uk3aeI9SYmqV4t5RCxnUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; d="scan'208";a="151743537"
Received: from savramon-mobl1.ger.corp.intel.com (HELO [10.245.245.244])
 ([10.245.245.244])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 07:20:56 -0700
Message-ID: <aacb3d74-2845-4627-b78f-15fd6f00cea8@linux.intel.com>
Date: Wed, 25 Jun 2025 16:20:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe: Process deferred GGTT node removals on device
 unwind
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
References: <20250612220937.857-1-michal.wajdeczko@intel.com>
 <20250612220937.857-2-michal.wajdeczko@intel.com>
Content-Language: en-US
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <20250612220937.857-2-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

Hey,

On 2025-06-13 00:09, Michal Wajdeczko wrote:
> While we are indirectly draining our dedicated workqueue ggtt->wq
> that we use to complete asynchronous removal of some GGTT nodes,
> this happends as part of the managed-drm unwinding (ggtt_fini_early),
> which could be later then manage-device unwinding, where we could
> already unmap our MMIO/GMS mapping (mmio_fini).
> 
> This was recently observed during unsuccessful VF initialization:
> 
>  [ ] xe 0000:00:02.1: probe with driver xe failed with error -62
>  [ ] xe 0000:00:02.1: DEVRES REL ffff88811e747340 __xe_bo_unpin_map_no_vm (16 bytes)
>  [ ] xe 0000:00:02.1: DEVRES REL ffff88811e747540 __xe_bo_unpin_map_no_vm (16 bytes)
>  [ ] xe 0000:00:02.1: DEVRES REL ffff88811e747240 __xe_bo_unpin_map_no_vm (16 bytes)
>  [ ] xe 0000:00:02.1: DEVRES REL ffff88811e747040 tiles_fini (16 bytes)
>  [ ] xe 0000:00:02.1: DEVRES REL ffff88811e746840 mmio_fini (16 bytes)
>  [ ] xe 0000:00:02.1: DEVRES REL ffff88811e747f40 xe_bo_pinned_fini (16 bytes)
>  [ ] xe 0000:00:02.1: DEVRES REL ffff88811e746b40 devm_drm_dev_init_release (16 bytes)
>  [ ] xe 0000:00:02.1: [drm:drm_managed_release] drmres release begin
>  [ ] xe 0000:00:02.1: [drm:drm_managed_release] REL ffff88810ef81640 __fini_relay (8 bytes)
>  [ ] xe 0000:00:02.1: [drm:drm_managed_release] REL ffff88810ef80d40 guc_ct_fini (8 bytes)
>  [ ] xe 0000:00:02.1: [drm:drm_managed_release] REL ffff88810ef80040 __drmm_mutex_release (8 bytes)
>  [ ] xe 0000:00:02.1: [drm:drm_managed_release] REL ffff88810ef80140 ggtt_fini_early (8 bytes)
> 
> and this was leading to:
> 
>  [ ] BUG: unable to handle page fault for address: ffffc900058162a0
>  [ ] #PF: supervisor write access in kernel mode
>  [ ] #PF: error_code(0x0002) - not-present page
>  [ ] Oops: Oops: 0002 [#1] SMP NOPTI
>  [ ] Tainted: [W]=WARN
>  [ ] Workqueue: xe-ggtt-wq ggtt_node_remove_work_func [xe]
>  [ ] RIP: 0010:xe_ggtt_set_pte+0x6d/0x350 [xe]
>  [ ] Call Trace:
>  [ ]  <TASK>
>  [ ]  xe_ggtt_clear+0xb0/0x270 [xe]
>  [ ]  ggtt_node_remove+0xbb/0x120 [xe]
>  [ ]  ggtt_node_remove_work_func+0x30/0x50 [xe]
>  [ ]  process_one_work+0x22b/0x6f0
>  [ ]  worker_thread+0x1e8/0x3d
> 
> Add managed-device action that will explicitly drain the workqueue
> with all pending node removals prior to releasing MMIO/GSM mapping.

I'm curious, would it not make sense to put drain_workqueue inside the ggtt_fini_early()
call mentioned there instead of adding a new devm call?

Kind regards,
~Maarten

