Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DDA9CF855D
	for <intel-xe@archiver.kernel.org>; Thu,  3 Oct 2024 06:39:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E18610E7A5;
	Thu,  3 Oct 2024 06:39:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AM0PPfYv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E88110E7A5
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Oct 2024 06:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727937587; x=1759473587;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Dm8OqVSWzRh8wnJTlPGgBurRZEWCgPM2FC8ih1SbAcs=;
 b=AM0PPfYvU8DZcqPtuxhpO/0kVliN2MErE0j4PVFBkULdlKDW5rNKE3W9
 LED8GLg+JoUms+1yER4y+lgOIyUEWC25oFDEmPp46LYse72VC/xbsh6tp
 FlVRgv0mqaiRInNqJ5tX1oUUF1xOcFH+JKdheUGtVkpG6FVRuEJLy+gX3
 71img+gGlQEHelGJNUts8GaRYqIIFdrIW3KBknrdoxMjdju2cQ+5+aHq1
 qWjahW76HJae5eHRGRMnjWB5Xyps4Tw6+hEGwd3e1ml/xrNbcWkQES0rD
 bdkOuoyCZ3gqBOLWFX+55WrkMNe6HFNy6MMNbNXocSFkM3bn2fk1ucP6C A==;
X-CSE-ConnectionGUID: sRhDZcGbRyCDopckstm1Eg==
X-CSE-MsgGUID: UmzSFldHRGy1vdwiLux43Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11213"; a="37714965"
X-IronPort-AV: E=Sophos;i="6.11,173,1725346800"; d="scan'208";a="37714965"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2024 23:39:47 -0700
X-CSE-ConnectionGUID: 1Ince19SQr+jXwU7S3KsEQ==
X-CSE-MsgGUID: xYS33QCYRcGcLaCgvbadhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,173,1725346800"; d="scan'208";a="79227951"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.244.147])
 ([10.245.244.147])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2024 23:39:45 -0700
Message-ID: <ece97465-f875-4a2c-88b6-e0cf1f577315@intel.com>
Date: Thu, 3 Oct 2024 07:39:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe: Take job list lock in xe_sched_add_pending_job
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
Cc: paulo.r.zanoni@intel.com
References: <20241003001657.3517883-1-matthew.brost@intel.com>
 <20241003001657.3517883-2-matthew.brost@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20241003001657.3517883-2-matthew.brost@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 03/10/2024 01:16, Matthew Brost wrote:
> A fragile micro optimization in xe_sched_add_pending_job relied on both
> the GPU scheduler being stopped and fence signaling stopped to safely
> add a job to the pending list without the job list lock in
> xe_sched_add_pending_job. Remove this optimization and just take the job
> list lock.
> 
> Reported-by: Paulo Zanoni <paulo.r.zanoni@intel.com>
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2822
> Fixes: 7ddb9403dd74 ("drm/xe: Sample ctx timestamp to determine if jobs have timed out")
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>

