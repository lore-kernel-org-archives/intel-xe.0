Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04FF3C4345F
	for <intel-xe@archiver.kernel.org>; Wed, 24 Apr 2024 08:59:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCFAA10FE5E;
	Wed, 24 Apr 2024 08:59:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iITgtd0/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8656C10FE5E
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Apr 2024 08:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713949156; x=1745485156;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=pSRFSGZ0wC7uWuBpP+f3Cbc3Z5CSbBjm2ztHkWQTU0I=;
 b=iITgtd0/vCSLxniIfOCsEutq5yh5qQXzC7rwK2o6/Tsxz7bs250ed3bR
 RRzh//8jxMlDSbRQJUVED4MJckHCOMSzT8srgO+DmdpVMb8zRE5l3/W+6
 QlBakT5hXcLL7EtMpgWwAH29+pdBym31SDuZSuPkGI3p8rOXoEsUmSTyF
 uH2BRvJDxXmvCT3T/GGg7Iz0I2QgwgP/MYjtsAeDb03JJmB+CAOhBTkYt
 K1OFVwbWXyRZFhMQOUjNdoZDDUUEp6l0YCyc/ADkdWqg9SuS6f0yW7QyM
 j6BILyjJ3BrGi5XXe2f7II/qZXfZf1YLfdS9mZg0fnZrR34iAlFso2cNt g==;
X-CSE-ConnectionGUID: 1FMVyv2kQNqWpq5dkHO2XQ==
X-CSE-MsgGUID: yqkao0mySLSrd2D/qpQp6A==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="9688728"
X-IronPort-AV: E=Sophos;i="6.07,225,1708416000"; 
   d="scan'208";a="9688728"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2024 01:59:16 -0700
X-CSE-ConnectionGUID: zXHN5e0mTieN49JVM2puqg==
X-CSE-MsgGUID: 5xsvHTTDR2KKloTsxn0rug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,225,1708416000"; d="scan'208";a="47905534"
Received: from vgrigo2x-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.48.49])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2024 01:59:13 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: "Sripada, Radhakrishna" <radhakrishna.sripada@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Cc: "De Marchi, Lucas" <lucas.demarchi@intel.com>
Subject: RE: [PATCH] drm/xe: Add reg read/write trace
In-Reply-To: <DM4PR11MB5971E5F411F81A5E4F651D0C87112@DM4PR11MB5971.namprd11.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240418222243.3285041-1-radhakrishna.sripada@intel.com>
 <877cgtwp6o.fsf@intel.com>
 <DM4PR11MB5971E5F411F81A5E4F651D0C87112@DM4PR11MB5971.namprd11.prod.outlook.com>
Date: Wed, 24 Apr 2024 11:59:10 +0300
Message-ID: <87jzknqgpt.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Tue, 23 Apr 2024, "Sripada, Radhakrishna" <radhakrishna.sripada@intel.com> wrote:
> Hi Jani,
>
> After this patch the following will be the main trace declarations
> xe_gt_tlb_invalidation_fence, xe_bo, xe_exec_queue, xe_sched_job, xe_sched_msg,
> xe_hw_fence, xe_vma, xe_vm, xe_guc_ct_flow_control, xe_guc_ctb, xe_reg_rw
>
> Would it be ok if we can group them like the following.
>
> xe_trace_bo.h : xe_bo, xe_vma, xe_vm
> xe_trace_gt.h: xe_gt_tlb_invalidation_fence, xe_exec_queue, xe_sched_job, xe_sched_msg, xe_hw_fence, xe_reg_rw
> xe_trace_guc.h: xe_guc_ct_flow_control, xe_guc_ctb
>
> Does this grouping seem ok?

I have no clue. I'm just pointing out a header dependency problem.

BR,
Jani.

-- 
Jani Nikula, Intel
