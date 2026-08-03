Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BDCDC55184
	for <intel-xe@archiver.kernel.org>; Mon,  3 Aug 2026 10:07:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0E9610E594;
	Mon,  3 Aug 2026 10:07:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QdOyZkcy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 129DB10E594;
 Mon,  3 Aug 2026 10:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785751631; x=1817287631;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=zFvmZ7Qp+n8dFH8s0ixRYy1qGnUsqvqql43t58iObpM=;
 b=QdOyZkcyXnnbqo6/p5BzzxebliVdTXJ5vB7gOW2F7UTl7F1mDo2FtZ+N
 126Mhvl1BDcPG+3A3J6fDdRzgnzFXNbNvbHCGnfR+/pf97qe6edFG0Z/w
 HVDbnsjH2dkRfhkVBw0hfAQAZ0bIxIPD97tx6Ja4zAe3i7EbIYTsb+cvn
 V0XARcZ0QS+PCoT/h+6UMj6tXGMyt3BAjqxb6EJ370NN43D1tFnWQtzLH
 srH+vMM09K/kwPwRLKywlTb/NhyHAKEins7AXvMMEzH/gd7MhC0mDYCE1
 afvnbnez2ocUTSCwApF5pPQfULq1eEiShASU0rUSbgxUewhF0RrRzlgZl Q==;
X-CSE-ConnectionGUID: pc9zidwXRYqQafM90UGH4g==
X-CSE-MsgGUID: rObuLGsgTDWFsaweveUT2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11863"; a="96643690"
X-IronPort-AV: E=Sophos;i="6.25,202,1779174000"; d="scan'208";a="96643690"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2026 03:07:10 -0700
X-CSE-ConnectionGUID: VhUkO0q8T/23uS7A8z+oww==
X-CSE-MsgGUID: 5PNUL6/sQ1CB+jaoTOmGxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,202,1779174000"; d="scan'208";a="259381143"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.30])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2026 03:07:07 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Daniil Seliverstov Denisovich <daniil.seliverstov2003@gmail.com>,
 intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, Seliverstov Daniil Denisovich
 <Danayerofficial@yandex.ru>, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v4] drm/xe: add DG2 HuC GSC support and MEI integration
In-Reply-To: <20260802235811.6574-1-Danayerofficial@yandex.ru>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260802235811.6574-1-Danayerofficial@yandex.ru>
Date: Mon, 03 Aug 2026 13:07:04 +0300
Message-ID: <aa76ebc11fc3627736a016aa5fb8dc6f675a5f82@intel.com>
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

On Mon, 03 Aug 2026, Daniil Seliverstov Denisovich <daniil.seliverstov2003@gmail.com> wrote:
> This enables HuC firmware initialization and authentication
> on DG2 hardware when using the Xe DRM driver.

You've now sent this patch eight (8) times since Thursday. Please stop
sending new versions until you've received some feedback.

Thanks,
Jani.

-- 
Jani Nikula, Intel
