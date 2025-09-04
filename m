Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92683CA1002
	for <intel-xe@archiver.kernel.org>; Thu,  4 Sep 2025 16:20:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5895A10EA98;
	Thu,  4 Sep 2025 16:20:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mZ11ThVz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E824810EA91
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Sep 2025 16:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757002813; x=1788538813;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=BF6l56Q3fKl3araaaEGalXsjNUgLAlBXWLMWl9S0VyU=;
 b=mZ11ThVzXHoK8R97BjLtNmLvJBWVwKXuqFiKrbl3/ODlQxjbN875hmI1
 w6Vxh10+I+coYq5m/+eX21cOZbLE3xTUtASSQSEHiodQG0cqpSUlIRoTd
 Rcn6AvUTFMhZwaas8+MDl7UjvRdDMQWfQQHaTGTUNASnkJeHVSNRh2m9U
 p/DewLeTo0DGZqCmA9FCHBalXXonVLAR7GXsveHkcrGhyoLefSgk4dZ/J
 q+yYfsmmFA1Mto3HKZfT/zxFXuoqUUwDEpa5LyGCc6e8KDpfNKSmaZKg0
 gAM2dIP9W0l0KFsLlmsz8kFdFzurxgAk19zOiZPYfaoYJBDx41K7LfETQ A==;
X-CSE-ConnectionGUID: rOrkakUyS2udGCdXmyJdBQ==
X-CSE-MsgGUID: 3cGQ6BL8RgCGJqcWF73qpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11543"; a="59457959"
X-IronPort-AV: E=Sophos;i="6.18,238,1751266800"; d="scan'208";a="59457959"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2025 09:20:12 -0700
X-CSE-ConnectionGUID: uJKB9va0Sny9lTS7GDDk7A==
X-CSE-MsgGUID: KA5NiNE+SxGb3UCjpC+hqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,238,1751266800"; d="scan'208";a="176277487"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO [10.245.244.143])
 ([10.245.244.143])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2025 09:20:11 -0700
Message-ID: <0fe6e8c7-f45f-43d2-982e-41ef003cfcc5@intel.com>
Date: Thu, 4 Sep 2025 17:20:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] drm/xe: Block exec and rebind worker while
 evicting for suspend / hibernate
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 Rodrigo vivi <rodrigo.vivi@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
References: <20250904160715.2613-1-thomas.hellstrom@linux.intel.com>
 <20250904160715.2613-4-thomas.hellstrom@linux.intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20250904160715.2613-4-thomas.hellstrom@linux.intel.com>
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

On 04/09/2025 17:07, Thomas Hellström wrote:
> When the xe pm_notifier evicts for suspend / hibernate, there might be
> racing tasks trying to re-validate again. This can lead to suspend taking
> excessive time or get stuck in a live-lock. This behaviour becomes
> much worse with the fix that actually makes re-validation bring back
> bos to VRAM rather than letting them remain in TT.
> 
> Prevent that by having exec and the rebind worker waiting for a completion
> that is set to block by the pm_notifier before suspend and is signaled
> by the pm_notifier after resume / wakeup.
> 
> It's probably still possible to craft malicious applications that block
> suspending. More work is pending to fix that.
> 
> v3:
> - Avoid wait_for_completion() in the kernel worker since it could
>    potentially cause work item flushes from freezable processes to
>    wait forever. Instead terminate the rebind workers if needed and
>    re-launch at resume. (Matt Auld)
> v4:
> - Fix some bad naming and leftover debug printouts.
> - Fix kerneldoc.
> - Use drmm_mutex_init() for the xe->rebind_resume_lock (Matt Auld).
> - Rework the interface of xe_vm_rebind_resume_worker (Matt Auld).
> 
> Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/4288
> Fixes: c6a4d46ec1d7 ("drm/xe: evict user memory in PM notifier")
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: <stable@vger.kernel.org> # v6.16+
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Reviewed-by: Matthew Auld <matthew.auld@intel.com>

