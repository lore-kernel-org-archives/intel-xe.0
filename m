Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CF30E77188
	for <intel-xe@archiver.kernel.org>; Fri, 20 Dec 2024 22:09:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31A3F10E4FB;
	Fri, 20 Dec 2024 22:09:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DWQ42saA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A71CC10E4FB
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Dec 2024 22:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734732578; x=1766268578;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=pFx+evzMeGbUyJHe1zmUDz6BKwFXaHYjDWVd3snUCPw=;
 b=DWQ42saAZAC/rGZbE3Mazgf3sAk0CrDRSPeOvUsxmjtRDDeO4LpdOdgV
 B1qvJwIiTZkeQk7FLbIiKbzdEaDyQYDSTu33WvjmMqiFC8S7SmuaPx/aN
 FYJXnV43LpAddhuMQFOMT6Z4NC9C9+RWLtMjsoAbZeDtV7jT97LirIonj
 iAaPR0wWboPosgdy8h7Go5Jau+V0ETKWpQXf36/tlIho0YI6XYEqd7c6k
 XsZ8E8HmEZT5tz58lfFyCCVIHQHgAg2k/uJbZhJ/1mIUHicMtnUfDDmHj
 uUswdB6B8gpcdpA1EAe7AKLD4AoAXleXgKZCsAl/xmrrIznoYh0Pb8n/Z g==;
X-CSE-ConnectionGUID: LzIePtttSpuWEvLcoK1SEQ==
X-CSE-MsgGUID: rGs3Wq0eSKuTFKPG/4wuMQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="35510347"
X-IronPort-AV: E=Sophos;i="6.12,251,1728975600"; d="scan'208";a="35510347"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2024 14:09:37 -0800
X-CSE-ConnectionGUID: aW3eJzPXRRK3et/C26FLSg==
X-CSE-MsgGUID: 88WpCIJGRQWxFI2YjuLang==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,251,1728975600"; d="scan'208";a="98511327"
Received: from ldmartin-desk2.corp.intel.com (HELO ldmartin-desk2)
 ([10.125.108.128])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2024 14:09:37 -0800
Date: Fri, 20 Dec 2024 16:09:30 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>, 
 intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v11 2/4] drm/xe: Add locks in gtidle code
Message-ID: <mwizal2blhojk2mykifbkp7crjh4ellju2pjdsodfqsrufy7kn@qc5s63c3p7om>
References: <20241220205927.441082-1-vinay.belgaumkar@intel.com>
 <20241220205927.441082-3-vinay.belgaumkar@intel.com>
 <Z2Xc8GpN297TI169@lstrano-desk.jf.intel.com>
 <1035f01c-92dc-430d-a87f-2e7ac12fdb35@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1035f01c-92dc-430d-a87f-2e7ac12fdb35@intel.com>
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

On Fri, Dec 20, 2024 at 01:15:07PM -0800, Belgaumkar, Vinay wrote:
>
>On 12/20/2024 1:09 PM, Matthew Brost wrote:
>>On Fri, Dec 20, 2024 at 12:59:25PM -0800, Vinay Belgaumkar wrote:
>>>Another entry point is added so PMU code can call into the gtidle
>>>method for residency. Add locking so that parallel calls to this
>>>method from sysfs and PMU don't give inconsistent gtidle states
>>>for c6 residency.
>>>
>>>Suggested-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>>Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>>Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>>>---
>>>  drivers/gpu/drm/xe/xe_gt_idle.c       | 23 ++++++++++++++++++++---
>>>  drivers/gpu/drm/xe/xe_gt_idle.h       |  1 +
>>>  drivers/gpu/drm/xe/xe_gt_idle_types.h |  3 +++
>>>  3 files changed, 24 insertions(+), 3 deletions(-)
>>>
>>>diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c b/drivers/gpu/drm/xe/xe_gt_idle.c
>>>index fd80afeef56a..1f32ac964abe 100644
>>>--- a/drivers/gpu/drm/xe/xe_gt_idle.c
>>>+++ b/drivers/gpu/drm/xe/xe_gt_idle.c
>>>@@ -69,6 +69,8 @@ static u64 get_residency_ms(struct xe_gt_idle *gtidle, u64 cur_residency)
>>>  {
>>>  	u64 delta, overflow_residency, prev_residency;
>>>+	lockdep_assert_held(&gtidle->lock);
>>>+
>>>  	overflow_residency = BIT_ULL(32);
>>>  	/*
>>>@@ -273,8 +275,21 @@ static ssize_t idle_status_show(struct device *dev,
>>>  	return sysfs_emit(buff, "%s\n", gt_idle_state_to_string(state));
>>>  }
>>>-static DEVICE_ATTR_RO(idle_status);
>>>+u64 xe_gt_idle_residency_msec(struct xe_gt_idle *gtidle)
>>>+{
>>>+	struct xe_guc_pc *pc = gtidle_to_pc(gtidle);
>>>+	u64 residency;
>>>+	unsigned long flags;
>>>+
>>>+	raw_spin_lock_irqsave(&gtidle->lock, flags);
>>Why raw spin lock rather than just spin lock?
>
>Lucas suggested this as  the perf subsystem uses raw_spinlocks, so we 
>cannot use spinlocks when the perf calls into Xe.

correct. Any entrypoint via perf may be via a hardirq and always use a
raw_spinlock. All the other PMUs I could find (except i915, that is
wrong) use raw_spinlock

More info:
https://lore.kernel.org/intel-xe/20241212093123.GV21636@noisy.programming.kicks-ass.net/

Alternative is to have a worker where the actual read happens and make
the perf entrypoint to read that value from memory. But then that value
will need to be protected via a raw_spinlock anyway.

Lucas De Marchi
