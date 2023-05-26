Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60779C7EE2D
	for <intel-xe@archiver.kernel.org>; Fri, 26 May 2023 07:55:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CADE10E7B6;
	Fri, 26 May 2023 07:55:44 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE91310E7B6
 for <intel-xe@lists.freedesktop.org>; Fri, 26 May 2023 07:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685087742; x=1716623742;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=vPNprlyNqGsnsZxmDgEcbVFsMjnUyKCpxs1AL16bOsA=;
 b=hxFa1YdUKkbpgp/kHBnDIzcBCDVhGmgtqjniygRIZ5wTavOzgoLUcmWI
 CaO37zUk8MW5IX1bUqjZduows457jFSUyZLYfZkezicnwvtw2ke1KV9dJ
 De0qvBXQcTvvM0+Qmgrk8AqwLcDuetZlMcZaZUDOD2BOd+E/5s7hv0xUE
 m7fh0FYFd8tQ4PtvANK1dIkFsWQ6nPN8B+i/9Ak+kxOhjA9ot2caSWoM6
 ohzp6/1z60F1wW0T8+s+xPji2/6aj94SzPptqJw9eUpa7yy0e3tdC7OGe
 28nn1nPTQokjDSOQ88g4Z8xmhmEJ8VHxp8jiw8dlc1uKPepza2iXcjKhI w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="357398746"
X-IronPort-AV: E=Sophos;i="6.00,193,1681196400"; d="scan'208";a="357398746"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2023 00:55:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="1035260345"
X-IronPort-AV: E=Sophos;i="6.00,193,1681196400"; d="scan'208";a="1035260345"
Received: from angelabu-mobl4.ger.corp.intel.com (HELO [10.252.1.108])
 ([10.252.1.108])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2023 00:55:39 -0700
Message-ID: <f41f4ff5-addd-da6b-8462-07aecc31d9db@intel.com>
Date: Fri, 26 May 2023 08:55:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.0
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>,
 intel-xe@lists.freedesktop.org
References: <20230525194326.1648781-1-michael.j.ruhl@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20230525194326.1648781-1-michael.j.ruhl@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH v7 0/4] drm/xe: Rework multi tile device
 memory initialization
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

On 25/05/2023 20:43, Michael J. Ruhl wrote:
> The vram initialization path does not take into account
> each tile's actual memory size.
> 
> While updating this, simplify the rebar algorithm and clarify
> some helper functions.

Should we go ahead and push this?

> 
> v2: Address review comments
>      - separate tile sizing to the initial patch
> v3: Re-add deleted warning for small bar systems
> v4: Address review comments
>      - stolen size check should be against pci resource
>      - limit size (patch 2) to keep bisection correct
> v5: Include actual memory size for Xe level for use (1:1 map for xe_migrate,
>      for example)
> v6: Limit gt memory size to visible size (small bar)
>      Fix forced resize missed __fls
> v7: Use GPU offset information (helper) for PT rather than IO offset
> 
> Michael J. Ruhl (4):
>    drm/xe: Rework size helper to be a little more correct
>    drm/xe: Simplify rebar sizing
>    drm/xe: Size GT device memory correctly
>    drm/xe: Rename GPU offset helper to reflect true usage
> 
>   drivers/gpu/drm/xe/regs/xe_gt_regs.h   |   2 +-
>   drivers/gpu/drm/xe/xe_bo.c             |   8 +-
>   drivers/gpu/drm/xe/xe_bo.h             |   2 +-
>   drivers/gpu/drm/xe/xe_device_types.h   |  16 +-
>   drivers/gpu/drm/xe/xe_gt_types.h       |  14 +-
>   drivers/gpu/drm/xe/xe_migrate.c        |   4 +-
>   drivers/gpu/drm/xe/xe_mmio.c           | 276 ++++++++++++++-----------
>   drivers/gpu/drm/xe/xe_mmio.h           |   6 +-
>   drivers/gpu/drm/xe/xe_pt.c             |   5 +-
>   drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c |  34 +--
>   10 files changed, 208 insertions(+), 159 deletions(-)
> 
