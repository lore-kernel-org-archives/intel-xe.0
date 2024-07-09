Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6534BC2BD09
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jul 2024 10:33:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0721F10E4EF;
	Tue,  9 Jul 2024 10:33:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gwhhxDAE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3E9810E4EF
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Jul 2024 10:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720521187; x=1752057187;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=EH0jNlKEhZd8uyeGBnKIEY/rYXGGb+Subfk8PW8lXSY=;
 b=gwhhxDAExxA9r4MGMXtSz6AsyHI7u0qdZh/3GexeAHLKnQotNW7Acr2d
 qhpamql8aybdM6+KA+kVCoOKbP37+PaQt/oSIBnn1MBlGknVb8FcvaGCp
 gAJKQuhjLUuhNwfHtUCnk3uxM9NO15Xhvu3nR3mVIDEPMsO6jMauwnJPo
 cKUhiH0z/NiqNYTNCrX7nO9uYXBVqck4Hro8/dEnAl9L7vc7KdkUgay+P
 HleJdGgP8L+dLQWm/v345G706iLqg8fc5QQOj3l8yrcb+hi076+7SXlqz
 qS1aCtoMEJzBlrqqVaSBJ7l0J6kMAucnxIpgEgHEwX/sonEr3UvfQ73mF A==;
X-CSE-ConnectionGUID: A/l793WUQ92ML8C1kiL86A==
X-CSE-MsgGUID: Pb0ERdBvSmaWgX8UOuEpzw==
X-IronPort-AV: E=McAfee;i="6700,10204,11127"; a="28925449"
X-IronPort-AV: E=Sophos;i="6.09,194,1716274800"; d="scan'208";a="28925449"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2024 03:33:06 -0700
X-CSE-ConnectionGUID: xE8GKBYPT5aUwk/azJbEUg==
X-CSE-MsgGUID: pEKa3IH4QYuJNb4Hh/85Ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,194,1716274800"; d="scan'208";a="47782692"
Received: from unknown (HELO [10.245.244.94]) ([10.245.244.94])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2024 03:33:05 -0700
Message-ID: <5f2c5b72-6111-4ad7-8635-6a575c17aae8@intel.com>
Date: Tue, 9 Jul 2024 11:33:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] Implement compression support on BMG
To: Akshata Jahagirdar <akshata.jahagirdar@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com, himal.prasad.ghimiray@intel.com,
 lucas.demarchi@intel.com
References: <cover.1720515376.git.akshata.jahagirdar@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <cover.1720515376.git.akshata.jahagirdar@intel.com>
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

On 09/07/2024 11:49, Akshata Jahagirdar wrote:
> According to the SAS for BMG compression, we need to decompress during eviction,
> and not recompress on restore. Due to this, we need to introduce encoding pat_index
> in case of vram too. This patch explores the solution of setting up an additional
> identity map for the vram, this time at the end of previous mapping offset and
> with compressed pat_index.
> We then select the appropriate mapping during eviction/restore/clear.

Hey, I don't see this series on the ml. Are you subscribed?

> 
> Akshata Jahagirdar (6):
>    drm/xe/xe2: Introduce identity map for compressed pat for vram
>    drm/xe/migrate: Handle clear ccs logic for xe2 dgfx
>    drm/xe/migrate: Add kunit to test clear functionality
>    drm/xe/xe_migrate: Handle migration logic for xe2+ dgfx
>    drm/xe/migrate: Add kunit to test migration functionality for BMG
>    drm/xe/xe2: Do not run xe_bo_test for xe2+ dgfx
> 
>   drivers/gpu/drm/xe/tests/xe_bo.c           |   6 +
>   drivers/gpu/drm/xe/tests/xe_migrate.c      | 388 +++++++++++++++++++++
>   drivers/gpu/drm/xe/tests/xe_migrate_test.c |   1 +
>   drivers/gpu/drm/xe/tests/xe_migrate_test.h |   1 +
>   drivers/gpu/drm/xe/xe_device.h             |   5 +
>   drivers/gpu/drm/xe/xe_migrate.c            |  66 +++-
>   6 files changed, 449 insertions(+), 18 deletions(-)
> 
