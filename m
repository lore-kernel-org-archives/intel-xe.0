Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A25CC25B75
	for <intel-xe@archiver.kernel.org>; Tue, 21 May 2024 10:58:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D739410E85B;
	Tue, 21 May 2024 10:58:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l5DLM+Uu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF8B910E8C8
 for <intel-xe@lists.freedesktop.org>; Tue, 21 May 2024 10:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716289114; x=1747825114;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=Cxg8yPUJXJgmhgAes0NTJaWWb0qQ73rJJwGlTXG45YQ=;
 b=l5DLM+UuajMWVX2r0YbNhs8xb2yq0FyaYsJQZ3LnaU18oxLeBcUb74Ts
 pPEKSxEJLcziyabCrlzMB4T3NWFgfmFHlJP+L76PA9Z7LqTbHH6BaCOMq
 gDP+zL72mH+PbGZxV090hylYEZo+9cMz9jTJLihfLQlXymRtt1IJYBq5W
 7GlPTlLYolFTV7UuWKbQG4FNW2vnosSK0gNuWbBuF8FsK/vQpnuduoRiv
 JiXzDEDLkEWTXKJat+R8tQ4BYbcxqxQvNCDKdPGJmEU5Vl4HkwtCDXHQU
 TDaVha9GeipkUfsU9W2GbM/C7fa2YfjEFfvIdJtduok5/Kqx2zxGtriTk w==;
X-CSE-ConnectionGUID: 7ixLTnl9SE+z951k5eiIcg==
X-CSE-MsgGUID: 7mTHYdzGS0CS0N9jJjWV1A==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="34983349"
X-IronPort-AV: E=Sophos;i="6.08,177,1712646000"; d="scan'208";a="34983349"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2024 03:58:33 -0700
X-CSE-ConnectionGUID: H1F9Xd/hT8u9wnqN5Yrygg==
X-CSE-MsgGUID: dw0qIRCbRH2+AMlYt/fA8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,177,1712646000"; d="scan'208";a="32741810"
Received: from unknown (HELO [10.245.245.25]) ([10.245.245.25])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2024 03:58:32 -0700
Message-ID: <ee41fa2a-b7ef-4da1-8666-a64bb9efb433@intel.com>
Date: Tue, 21 May 2024 11:58:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Add warn when level can not be zero.
To: Nirmoy Das <nirmoy.das@intel.com>, intel-xe@lists.freedesktop.org
References: <20240521103623.11645-1-nirmoy.das@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20240521103623.11645-1-nirmoy.das@intel.com>
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

On 21/05/2024 11:36, Nirmoy Das wrote:
> At xe_pt_zap_ptes_entry() and xe_pt_stage_unbind_entry, the level cannot
> be 0. Therefore, add an independent check for the level. Since the level
> cannot be zero at this point, there is no need to check for `is_compact`,
> so remove that instead.
> 
> Cc: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
