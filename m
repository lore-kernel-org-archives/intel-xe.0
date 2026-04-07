Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2531EEDB7F0
	for <intel-xe@archiver.kernel.org>; Tue,  7 Apr 2026 10:37:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D32F110E3BD;
	Tue,  7 Apr 2026 10:37:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B3QvnAq5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEF5410E3BD
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Apr 2026 10:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775558228; x=1807094228;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=Vru+D9xJ9kr52hGsL1ddkqqrxTPR6DgAeGgVFhAF+rY=;
 b=B3QvnAq52V6qmm7qlppEH7wqgQPuKq6KTW7oJlkloxZVxnV06YzUxsZH
 +z8+ziQ63vyL9UxFr+u9B4Uu/jBrttfz2bcAy6MiT0wkac1lmpSTL7U1d
 P/wgDHC0brDDxOCdHjOkuZGIhJLvwzDT9d9cNdtdo2YARKA82MY5TMwtQ
 0KxUExbDzMJDqCyI/9hZoiGH7UyqTQVmYQtg25B/YjyhsL8kzLvBTzwVe
 F4DdLZfEMJyZ24mN1d+lGa/cj13D4vnPa8iggEhJyRYXCpHHJbPOwVy6k
 fswQvg3r1Jb7qm4crQUUtGi7xjhgTg395cFBSgZiy2GEFM2gYSRw773Kb g==;
X-CSE-ConnectionGUID: wuaEsSCoQ7qHz5wpN5OALQ==
X-CSE-MsgGUID: pcgwmWl5Q1+mbenqTyln9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="87144110"
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; d="scan'208";a="87144110"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 03:37:07 -0700
X-CSE-ConnectionGUID: a5dEAQq4R+mgQOpsJrO1jg==
X-CSE-MsgGUID: GYcwBfl5TeaNLEhum9xxQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; d="scan'208";a="233007327"
Received: from rvuia-mobl.ger.corp.intel.com (HELO [10.245.244.172])
 ([10.245.244.172])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 03:37:07 -0700
Message-ID: <434ce3de-ea41-4019-b335-c97ee5f08b6a@intel.com>
Date: Tue, 7 Apr 2026 11:37:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe: Standardize pat_index to u16 type
To: Xin Wang <x.wang@intel.com>, intel-xe@lists.freedesktop.org
References: <20260406182546.569131-1-x.wang@intel.com>
 <20260406182546.569131-2-x.wang@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20260406182546.569131-2-x.wang@intel.com>
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

On 06/04/2026 19:25, Xin Wang wrote:
> Ensure all pat_index definitions consistently use u16 type across
> the XE driver. This addresses two remaining instances where pat_index
> was incorrectly typed:
> 
> - xe_vm_snapshot structure used int for pat_index field
> - xe_device pat.idx array used u32 instead of u16
> 
> This cleanup improves type consistency and ensures proper alignment
> with the PAT subsystem design.
> 
> Signed-off-by: Xin Wang <x.wang@intel.com>

Reviewed-by: Matthew Auld <matthew.auld@intel.com>

