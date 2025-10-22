Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D68ECCD1BE
	for <intel-xe@archiver.kernel.org>; Wed, 22 Oct 2025 06:31:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EF7510E6B3;
	Wed, 22 Oct 2025 06:31:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V8la5H9M";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5220D10E6B3
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Oct 2025 06:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761114703; x=1792650703;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=/Vq4DYq59sABXa2nMwLkrUSWFKe9K2bA/NiDbAR9eSA=;
 b=V8la5H9M4xgB8z4qZOg9OrJEpBB9fSKUBD9wIi71CtB5S6bxwB8JLN4k
 AuYBGo26KpkfFFeZWz7Ag1hwladEOnoPwFqLNPPvMPwG+44jI7bJduAhN
 jsohyN/5t2y0mpips6h7dw9ce/zDPxUj6DsAyZgzdYD7Nmt+ZToQCbmi0
 qVoj+qPVVF3m5O4VeuL94MMZGMpTlfGx/OwJVqK4PGSZExZKdtEyyNktL
 sLGgCgUf3WAxO61RAb7Z/8sPCzMw94YV1KqiEMxMZvS5cD51n8H3c5WIE
 X7yzOdc9tix3mdfNFSj8put42qcgKotB5oIlAjXWk3dnYfbHhPmeaKkjc Q==;
X-CSE-ConnectionGUID: Re4/oQv+QUGqzUOImslZOA==
X-CSE-MsgGUID: bJkqL1/7RqKmCwfBPu5lhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63162375"
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; d="scan'208";a="63162375"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 23:31:43 -0700
X-CSE-ConnectionGUID: Eg2K3LEkSIWCp2eBbnxz/w==
X-CSE-MsgGUID: eHD3uXYXQs2Qz6RE2PywQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; d="scan'208";a="188199639"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 23:31:41 -0700
Date: Wed, 22 Oct 2025 08:31:39 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Sk Anirban <sk.anirban@intel.com>, lucas.demarchi@intel.com
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 4/12] drm/xe/cri: Add new performance limit reasons bits
Message-ID: <aPh6S_8bv345QPR0@black.igk.intel.com>
References: <20251021-cri-v1-4-bf11e61d9f49@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251021-cri-v1-4-bf11e61d9f49@intel.com>
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

On Tue, Oct 21, 2025 at 10:17:36PM -0700, Sk Anirban wrote:
> Add support for additional performance limit reasons in
> GT0_PERF_LIMIT_REASONS register.
> 
> Signed-off-by: Sk Anirban <sk.anirban@intel.com>
> ---
> There are some improvements to be made here before applying to reduce
> the amount of code for one platform. I plan to take a look on that for
> v2.

Yes, I had planned this but there were some concerns related to backporting
(in case there arises such a requirement). I'll leave the final call to you.

Raag

> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
