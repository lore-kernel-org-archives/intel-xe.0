Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3865FFF8864
	for <intel-xe@archiver.kernel.org>; Wed, 29 Apr 2026 05:39:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED8EA10EE5C;
	Wed, 29 Apr 2026 05:39:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LVHUwr4k";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1F7F10EE5C
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Apr 2026 05:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777441183; x=1808977183;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=KCG1qEXBKLyKlBzz6u+GKXCew2svPo0iQzTXtS1MuXM=;
 b=LVHUwr4kf6FHN+BVnO1ywaysnMD4ekBm+E3cmpD4mFQje2kIGqIwrRwF
 630DHy57gWnUSlsNABnht9h7Ejnh5JH/Dfl1WpRAeZRW+iByPisVwexWL
 qkbfNHf59+mUR/H0oPtFxjtHEgu9Js1RStw/P6Kgsj4iO3Wy/V8rrRwqw
 G0Qpe2GHPK9f57dynUNtRhuPxcLU5cWc2oQ4x2w7GKJusTN8UkrBzo54p
 AlXhmDd+tbf78BXTaPVT52y9nAbYVDEx7CsVT9ZzJHi+X83NYiwZm+TD6
 YTl5Yn2bvCQVbSljUS8/MYctJicqZkxk6eAjAB1AjVZVbn9qhnvJr3zSF A==;
X-CSE-ConnectionGUID: gXg9RKnvQk++4SaYa/mWPA==
X-CSE-MsgGUID: pa5tzrZzS6WgWkvMpKyc2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11770"; a="81970031"
X-IronPort-AV: E=Sophos;i="6.23,205,1770624000"; d="scan'208";a="81970031"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 22:39:43 -0700
X-CSE-ConnectionGUID: ilXoeDU7TfOdhs7ZK0+2jA==
X-CSE-MsgGUID: KBcHa1SWSrG2j31vYyVcGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,205,1770624000"; d="scan'208";a="234449722"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 22:39:40 -0700
Date: Wed, 29 Apr 2026 07:39:37 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Soham Purkait <soham.purkait@intel.com>
Cc: intel-xe@lists.freedesktop.org, riana.tauro@intel.com,
 anshuman.gupta@intel.com, aravind.iddamsetty@linux.intel.com,
 badal.nilawar@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, andi.shyti@intel.com,
 rodrigo.vivi@intel.com, anoop.c.vijay@intel.com
Subject: Re: [PATCH v2 2/2] drm/xe/xe_ras: Add RAS support for GPU health
 indicator
Message-ID: <afGZmfJAHYmwrQAo@black.igk.intel.com>
References: <20260423173925.699486-1-soham.purkait@intel.com>
 <20260423173925.699486-3-soham.purkait@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260423173925.699486-3-soham.purkait@intel.com>
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

On Thu, Apr 23, 2026 at 11:09:25PM +0530, Soham Purkait wrote:
> GPU health indicator exposes a single sysfs interface, gpu_health,
> at the device level, allowing administrators and management tools to
> query the GPU health status. The interface permits both read and write
> operations on PF and native functions, while on VFs it is exposed as
> read-only.

...

> +++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-ras
> @@ -0,0 +1,33 @@
> +What:		/sys/bus/pci/drivers/.../gpu_health
> +Date:		April 2026
> +KernelVersion:	7.0

This ship has sailed. Please use the correct version as per prediction[1].

[1] https://jnikula.github.io/linux-kernel-tea-leaves/

Raag
