Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8322CFF886D
	for <intel-xe@archiver.kernel.org>; Wed, 29 Apr 2026 09:35:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41EC410EE7A;
	Wed, 29 Apr 2026 09:35:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fuJoNkCp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7327310EE7A
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Apr 2026 09:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777455341; x=1808991341;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=AHnq+XwRxL6QTc/c/GrRGDdx9LILO/fiZfCT0IWipLk=;
 b=fuJoNkCpvgJUf9GnXbkXDZq4yoP59roXU1qXGcdoefigTpyqXLJT89fW
 ZceJVK9lrLjTtvSh9vXsFX/XwicijCy5X6m3Ua2esnedC0g26EYHNgvCW
 zUQ4Na4ntqzQ7/LTmYB7pXf3Ps054cnIYauagEJNxFU5Q1nhI93nq6S8j
 ZkTI7dLfVJs7jlKxnnyjX1mw0DSLaCQcy7IoKx3ilbATLUrNgQmij+tGu
 drFPDS2EJOWvYCfn/HG00AOeGgpDBlGxMaf/Ur0o79vVB9oOYIB4vkFC3
 vl+MStyEdIIe2trfEnRaujtLjLQ7HWJbqlomUPZRgUsU+zOyyqXxdDs4G g==;
X-CSE-ConnectionGUID: Lqen00KoTXOi3yvDX0twlQ==
X-CSE-MsgGUID: +Ak/FBiOSmiORjiGHWnjaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11770"; a="95798768"
X-IronPort-AV: E=Sophos;i="6.23,205,1770624000"; d="scan'208";a="95798768"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2026 02:35:40 -0700
X-CSE-ConnectionGUID: EK/0YmyfRnOqg4IBNGoJNQ==
X-CSE-MsgGUID: nHGOfJNfQ7SB0+6o0QesjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,205,1770624000"; d="scan'208";a="233189309"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO [10.245.245.195])
 ([10.245.245.195])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2026 02:35:39 -0700
Message-ID: <5ac24376-70b8-411e-973c-12d11312b919@intel.com>
Date: Wed, 29 Apr 2026 10:35:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Use drmm_mutex_init for VRAM manager lock
To: Tejas Upadhyay <tejas.upadhyay@intel.com>, intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 himal.prasad.ghimiray@intel.com
References: <20260429093138.3899280-2-tejas.upadhyay@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20260429093138.3899280-2-tejas.upadhyay@intel.com>
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

On 29/04/2026 10:31, Tejas Upadhyay wrote:
> Replace mutex_init()/mutex_destroy() with drmm_mutex_init() for the
> VRAM manager lock. This leverages DRM managed infrastructure to
> automatically destroy the mutex during device teardown, eliminating
> manual mutex_destroy() calls in both the normal fini path and the
> gpu_buddy_init() error path.
> 
> Assisted-by: Claude:claude-opus-4.6
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

Reviewed-by: Matthew Auld <matthew.auld@intel.com>

