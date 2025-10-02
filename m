Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5C08CAC5B8
	for <intel-xe@archiver.kernel.org>; Thu,  2 Oct 2025 11:18:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DAE710E194;
	Thu,  2 Oct 2025 11:18:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EGSk0Wr7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AF7810E194
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Oct 2025 11:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759403885; x=1790939885;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LLgf56JuePG7W5rOfrwxuvdOYemU+I6v3P1e2f9X744=;
 b=EGSk0Wr7SQB5EdqEYsuMnLbjBD+5/08eG70Cpt8RAEh6FkVgcxiyQGD0
 0XADqYSzHNW5tDKu201DqRwnLpAhE5jh1rhyg3F8fb5il/BfU5MZxlLIm
 1C8ZzTlENcgs29ZZXhlbBttyCrNPiujL+iTmlUc7uUOVEkhfyqbZQW7uo
 L1YmthVcA3V2PY51z+WIBsRbeZmtj45MPI2NOT7LLpddB2gXKdZ+39vme
 NRqz+VAs9Dq9ozQX1/Z15rYz0P0f/4oWLOuz4Y5dIeJUzqBJEbXy2t4iy
 DYx+e9FzRVs76thah6Y7hu3FYp9wljuXk3zNu55GUxY783/gttrfWXBWp w==;
X-CSE-ConnectionGUID: kzh24cgKSxexyDCL7GII5w==
X-CSE-MsgGUID: 9znaNm35QgSZ9Z4kxHSYpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="61850262"
X-IronPort-AV: E=Sophos;i="6.18,309,1751266800"; d="scan'208";a="61850262"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 04:18:04 -0700
X-CSE-ConnectionGUID: 4aL5n84uTlqZTqf55lqAPw==
X-CSE-MsgGUID: IAIcZetNQjO1baIUskv90A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,309,1751266800"; d="scan'208";a="183318109"
Received: from naresh-nuc8i7beh.iind.intel.com (HELO
 nkumarg-desk.iind.intel.com) ([10.190.216.171])
 by orviesa004.jf.intel.com with ESMTP; 02 Oct 2025 04:18:02 -0700
From: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
To: naresh.kumar.g@intel.com,
	intel-xe@lists.freedesktop.org
Cc: Michal.Wajdeczko@intel.com,
	varun.gupta@intel.com
Subject: Re: [PATCH] drm/xe/: Mutual Exclusivity b/w Multi CCS Mode & SRIOV VF
 Provisioning
Date: Thu,  2 Oct 2025 16:43:12 +0530
Message-ID: <20251002111311.1188631-2-naresh.kumar.g@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250929083613.644931-2-naresh.kumar.g@intel.com>
References: <20250929083613.644931-2-naresh.kumar.g@intel.com>
MIME-Version: 1.0
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

In My Test check:
Although I attempted to acquire a lock within ccs_mode_store to ensure protection, 
a deadlock occurs because the lock has already been acquired earlier in the code flow before entering the function.
As a result, trying to acquire the same lock again inside ccsmode_store leads to a deadlock situation.

>>  	err = xe_sriov_pf_wait_ready(xe);
>>  	if (err)
>>  		goto out;
>> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_helpers.h 
>> b/drivers/gpu/drm/xe/xe_sriov_pf_helpers.h
>> index dd1df950b021..e26837091375 100644
>> --- a/drivers/gpu/drm/xe/xe_sriov_pf_helpers.h
>> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_helpers.h
>> @@ -43,4 +43,17 @@ static inline struct mutex *xe_sriov_pf_master_mutex(struct xe_device *xe)
>>  	return &xe->sriov.pf.master_lock;
>>  }
>>  
>> +/**
>> + * xe_sriov_pf_has_vfs_enabled() - Determines if the PF has any VFs 
>> +enabled
>> + * @xe: ptr to xe_device
>> + *
>> + * Return: true if one or more VFs are enabled on the PF, false otherwise.
>> + */
>> +static inline bool xe_sriov_pf_has_vfs_enabled(const struct xe_device 
>> +*xe) {
>> +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>> +
>> +	return pci_num_vf(pdev) > 0;
>> +}
>> +
>>  #endif


