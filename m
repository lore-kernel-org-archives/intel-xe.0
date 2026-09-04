Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B30C8C624DE
	for <intel-xe@archiver.kernel.org>; Fri,  4 Sep 2026 12:14:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DE6D10FB10;
	Fri,  4 Sep 2026 12:14:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="niC1dhnI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 371D610FB11
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Sep 2026 12:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788524093; x=1820060093;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=JnB/OBhQvb2CeNhTnvuqvTFtTBARarYt6lEQvlEBSn4=;
 b=niC1dhnIuv7rf9csfwWE0LXzh5TZIshgMjWEIwI+Imuf03S82H2qjiMZ
 JY/CHLn9VTMruzFuItYUJQ5evwf9dFy/64Q2rhna/6joRvdhuQFIo5BNJ
 Ak/QDU22p04HV07ztOJKXQglE9D7PR+hHKWpGgOVYGDgl8N/J78VkUtM2
 RvwOaEGePqC+nXRa0tze7afy5QQaSHyc0gIAG9Hc7rPTMUhJIgqKuRfXW
 cyNfuNxSns13b5mpXTRWWPyIE6JqDOEmVL1K09DtPIbyMhQImgvUn8dGZ
 i1yEo5/S9XyZIxSQdYI1Tgkxy7YBllh9s2NuUxIbz/4ahtRdMi976kHbe g==;
X-CSE-ConnectionGUID: wuWhRKzlRmGNfQb+6LZTQQ==
X-CSE-MsgGUID: Svt4Q2IuSweOi1cHV4E7iw==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="92722363"
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; d="scan'208";a="92722363"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2026 05:14:53 -0700
X-CSE-ConnectionGUID: Ro181CFjTAeLpF7bmwqZmQ==
X-CSE-MsgGUID: XeD+xl2tRPyG4VUepwwpcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; d="scan'208";a="273814135"
Received: from slindbla-desk.ger.corp.intel.com (HELO [10.245.245.30])
 ([10.245.245.30])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2026 05:14:51 -0700
Message-ID: <49ec8460-4099-4ca6-962e-cf819d8737fa@intel.com>
Date: Fri, 4 Sep 2026 13:14:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] drm/xe/tests: Add xe_migrate_access_memory subtest
To: Jan Maslak <jan.maslak@intel.com>, intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 rodrigo.vivi@intel.com, Christoph Manszewski <christoph.manszewski@intel.com>
References: <20260622103449.3335928-1-jan.maslak@intel.com>
 <20260622103449.3335928-5-jan.maslak@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20260622103449.3335928-5-jan.maslak@intel.com>
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

On 22/06/2026 11:34, Jan Maslak wrote:
> From: Christoph Manszewski <christoph.manszewski@intel.com>
> 
> Add a new xe_migrate subtest for vram to sram migration works:
>   - when the dst address is not 4-byte aligned
>   - when the dst address in not 4-byte aligned but the migration size is
>   - when src BO offset is not 4-byte aligned
> 
> Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
> Signed-off-by: Jan Maslak <jan.maslak@intel.com>

Reviewed-by: Matthew Auld <matthew.auld@intel.com>

