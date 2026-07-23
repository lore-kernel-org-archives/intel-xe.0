Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 127FCC531F8
	for <intel-xe@archiver.kernel.org>; Thu, 23 Jul 2026 17:22:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF1E410E315;
	Thu, 23 Jul 2026 17:22:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="byFjBDt2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 930A610E315
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Jul 2026 17:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784827338; x=1816363338;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=YAp1SwsumUrD6j0cg4lwd0rPG0GCvMttv1oeakSOMoI=;
 b=byFjBDt2s6SGSszrfTV2id3HOwBrUAcSnRn0TU8p8naBFSE6XD4VMlvy
 hQI7LALMrKe1wu0l1rvOUkQxj2OsbgoVJX/j+RwCchrA2/hcBNRxXG+4z
 UhNbyVNbl4OUwvTnoXcQWInv+fVTJ94ZCcI4Hf18wkwYerLblQnWLjjQ0
 WZIIoKizMPJi1H0lUk9kFZjuu6tNRxq17ZqLT8/rwTfKf9Lb0ZmGBuQfm
 NS4XqxUWozMYTLPl0+aizR8/U1CLEc3hIiXe0UNBp5h5v39Oiu86FxMwY
 WdhXpeKoztGEcm3QDgIk6MDD1y0CB66OougnUgnpfYUlp/a0EJCKbC0Ue A==;
X-CSE-ConnectionGUID: znENH+7BRneL5rapb17lKw==
X-CSE-MsgGUID: 5vScodo/TfiznOVDldB1Lg==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="85607752"
X-IronPort-AV: E=Sophos;i="6.25,180,1779174000"; d="scan'208";a="85607752"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2026 10:22:18 -0700
X-CSE-ConnectionGUID: TUPEb+K/SD6sfXjuXaWCbg==
X-CSE-MsgGUID: hvqEH8VQQlelXFTnnVotYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,180,1779174000"; d="scan'208";a="262252162"
Received: from abityuts-desk.ger.corp.intel.com (HELO [10.245.244.109])
 ([10.245.244.109])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2026 10:22:17 -0700
Message-ID: <f0577d2e-cc70-4aaa-a104-a9f101fb81f5@intel.com>
Date: Thu, 23 Jul 2026 18:22:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/7] drm/xe/mmio_gem: simplify fault handler loop
To: Ilia Levi <ilia.levi@intel.com>, intel-xe@lists.freedesktop.org
Cc: koby.elbaz@intel.com, meny.yossefi@intel.com, shuicheng.lin@intel.com,
 thomas.hellstrom@intel.com, matthew.brost@intel.com
References: <20260723161832.137153-1-ilia.levi@intel.com>
 <20260723161832.137153-4-ilia.levi@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20260723161832.137153-4-ilia.levi@intel.com>
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

On 23/07/2026 17:18, Ilia Levi wrote:
> Make the iteration over the addresses in the VMA more explicit.
> No functional change, as the VMA matches the GEM object exactly.
> 
> Signed-off-by: Ilia Levi <ilia.levi@intel.com>

Reviewed-by: Matthew Auld <matthew.auld@intel.com>
