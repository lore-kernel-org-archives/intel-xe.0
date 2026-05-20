Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CD1CCD4F3D
	for <intel-xe@archiver.kernel.org>; Wed, 20 May 2026 14:03:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3998D10E494;
	Wed, 20 May 2026 14:03:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M4E7/mD3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 884E510E494
 for <intel-xe@lists.freedesktop.org>; Wed, 20 May 2026 14:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779285810; x=1810821810;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=uIHGPI9aUQeurBIxfTUfccsGQ0Zc5rFrnrlcwryUkHU=;
 b=M4E7/mD3MFuG09YPF4OIlbwN6nhUaRnO8OV4MuNiwmu/o0iYTxZd8zDu
 GIe7fI7PdkZxznPoEFWi4JHK4KNkHtoQGZXBLx6Dg6LOilXVZRJxnzMQN
 VyDTW4ww2wlHdrlYu/KuPa4Ys3gzEiFsIAvMN4SJ+SAvkCRbnd5e5KTc7
 hWtQm6aUXz0tpe3qMPv7UIXQZ7wpvAJWwBVQrvKfDoJbCcMpCSE1+Twy8
 R2r8pL0cDAcz7UxZDB6qiCyLYdmjAXuQvBbT0dau+XN2j+9Tx8XkNs+Fe
 zEZDBV8OKjfzRLbh+AdzLFxJly3oXnk4nm0OuI6npbdRHq09W4vFbD/H2 g==;
X-CSE-ConnectionGUID: wSfbtVd+SbqPjrZ5+O6hCw==
X-CSE-MsgGUID: LkNTyWB5R1ufOA7oWNFE1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="91576857"
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; d="scan'208";a="91576857"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2026 07:03:30 -0700
X-CSE-ConnectionGUID: 8KLVM+QVQ7izSFB6DssSyg==
X-CSE-MsgGUID: qQnKND9gTCqrrQ0zCb57zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; d="scan'208";a="242000015"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.148])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2026 07:03:29 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Jakub Bystron <jb@elitecode.cz>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Subject: Re: [BUG] xe: Meteor Lake 7d55 eDP PHY A/DPLL state mismatch,
 flip_done timeout
In-Reply-To: <pqne8IzoDMDIqi1_8iCtI-YGeB7j4hczgaNPp2JUSJbsF9ovVC3KUo9t4va0uxxDTa376ZG26AwIoltpFV41C9w-Rxf9j-CYQroVaPJZvN0=@elitecode.cz>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <pqne8IzoDMDIqi1_8iCtI-YGeB7j4hczgaNPp2JUSJbsF9ovVC3KUo9t4va0uxxDTa376ZG26AwIoltpFV41C9w-Rxf9j-CYQroVaPJZvN0=@elitecode.cz>
Date: Wed, 20 May 2026 17:03:27 +0300
Message-ID: <fb38414a888f689b96135f65706c2125059e53ca@intel.com>
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

On Wed, 20 May 2026, Jakub Bystron <jb@elitecode.cz> wrote:
> I hit a display-side xe failure on a Lenovo ThinkPad P1 Gen 7 with
> Meteor Lake / Core Ultra 7 165H integrated graphics.
>
> Hardware:
> Manufacturer: LENOVO
> Product:      21KV001UCK
> BIOS:         N48ET33W (1.20)
> GPU:          Intel Meteor Lake iGPU, PCI ID 8086:7d55
>
> Kernel:
> Linux 7.0.9_1, Void Linux
>
> Environment:
> Xorg
> Internal eDP panel
>
> Kernel command line:
> i915.force_probe=!7d55 xe.force_probe=7d55 i915.enable_psr=0 xe.enable_psr=0
>
> The kernel is tainted due to force_probe. i915 is explicitly blocked and xe is used for 8086:7d55.

The usual boilerplate response: Use the i915 driver with MTL. When the
issue is specific to the xe + MTL (or older) combo, you're fresh out of
luck.

That said, this is a known display issue, there's at least:

https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/16042
https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/16064
https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/16098


BR,
Jani.


-- 
Jani Nikula, Intel
