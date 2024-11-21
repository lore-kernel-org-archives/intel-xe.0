Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05731D78796
	for <intel-xe@archiver.kernel.org>; Thu, 21 Nov 2024 16:54:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B254A10E9DB;
	Thu, 21 Nov 2024 16:54:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k72wgX2n";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0FE910E1D2
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Nov 2024 16:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732208075; x=1763744075;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ZBTG4KXzuoAsYSpi08xH6Nr8mW0ttx0aVCpXUExlTQo=;
 b=k72wgX2n4Ji4kbtNQhrdyk3hkGKy7KrckVAnBssX0mGp2UuHYffQc3sh
 640NWl2ALrdCI/fsV6vzgxWOk3KGIKO1KW72rxn8IEfiVvClKfSGl8WYp
 9On3kpkHXYXXqVDNSF28AuHY4ogqv7qkq5CbRLgym67ZHKP0gnE6PCk8s
 gYhDBmUzWFk8+gOH1P4n8Zyn/LF/8pwCBwYIAqLwWEDWaBWVd3FlDp67w
 dY8BrITj4VmzfLILDQPR/C9rKXBTylkvm24r4gIutOh7tt7Bm7A7ETyGu
 hn97nLAtQVbSIV39+6nICLB7B8EBnLHF0k379STRYmBGzW1cOCIrBWd0J Q==;
X-CSE-ConnectionGUID: P5D8czxLQlOY53Ps/qqcEw==
X-CSE-MsgGUID: SR5v57KeQ3C6TfdV6Qvkzg==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="54843636"
X-IronPort-AV: E=Sophos;i="6.12,173,1728975600"; d="scan'208";a="54843636"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 08:54:35 -0800
X-CSE-ConnectionGUID: kBS+yp2MS4mTFx27FUAOXQ==
X-CSE-MsgGUID: i+T/rsc7Q+25t69LmtW7qA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,173,1728975600"; d="scan'208";a="95103360"
Received: from ldmartin-desk2.corp.intel.com (HELO ldmartin-desk2)
 ([10.125.109.234])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 08:54:33 -0800
Date: Thu, 21 Nov 2024 10:54:28 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, ryszard.knop@intel.com
Subject: Re: [PATCH] drm/xe: Sort again the info flags
Message-ID: <4urb7iogs2b2wkznlix2jnhflgb7izryfzsp2yz2ux4bx7xv5l@lt2w26ab52af>
References: <20241118223314.1969166-1-lucas.demarchi@intel.com>
 <7f8fccfd-cb92-47bd-b6d3-bbed2a11094e@intel.com>
 <pma4bikew4wnxhs2nczdzbbpz2yt77pvoy5xdxq23sg5cw4e3n@aypm5hztxb2v>
 <87wmgy14oe.fsf@intel.com>
 <gh2z4erofoxvb5npgoopc7cq7b32erdfxeqztroseyqywmel5o@fc6r37gczlpk>
 <87a5ds26zy.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <87a5ds26zy.fsf@intel.com>
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

On Thu, Nov 21, 2024 at 12:53:05PM +0200, Jani Nikula wrote:
>On Wed, 20 Nov 2024, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
>> IMO we should turn all these "checks run on the build machine" rather
>> than "checks executed on the target hosts" part of the hooks infra....
>> because that is much more visible than scripts hidden inside the CI
>> pipeline. And then people can even run on their own machines.
>
>Going on a slight tangent, thinking aloud. Could we split the load more
>between running on target and running in, say, qemu? Like, there's no

why qemu? does it need HW access? If not, it should just run in the
build machine that uses UML for "virtualization".

>point in running some of the drm selftests on each target host. And
>could we move more towards splitting igt this direction too?

on the xe side we are already running the drm kunit tests that don't
need HW access:

Example:
https://patchwork.freedesktop.org/series/141644/

Look at CI.KUnit:

[11:31:03] Starting KUnit Kernel (1/1)...
[11:31:03] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[11:31:03] ================== drm_buddy (7 subtests) ==================
[11:31:03] [PASSED] drm_test_buddy_alloc_limit
[11:31:03] [PASSED] drm_test_buddy_alloc_optimistic
[11:31:03] [PASSED] drm_test_buddy_alloc_pessimistic
[11:31:03] [PASSED] drm_test_buddy_alloc_pathological
[11:31:03] [PASSED] drm_test_buddy_alloc_contiguous
[11:31:03] [PASSED] drm_test_buddy_alloc_clear
[11:31:03] [PASSED] drm_test_buddy_alloc_range_bias
[11:31:03] ==================== [PASSED] drm_buddy ====================
[11:31:03] ============= drm_cmdline_parser (40 subtests) =============
[11:31:03] [PASSED] drm_test_cmdline_force_d_only
[11:31:03] [PASSED] drm_test_cmdline_force_D_only_dvi
[11:31:03] [PASSED] drm_test_cmdline_force_D_only_hdmi
[11:31:03] [PASSED] drm_test_cmdline_force_D_only_not_digital
[11:31:03] [PASSED] drm_test_cmdline_force_e_only
[11:31:03] [PASSED] drm_test_cmdline_res
[11:31:03] [PASSED] drm_test_cmdline_res_vesa
[11:31:03] [PASSED] drm_test_cmdline_res_vesa_rblank
[11:31:03] [PASSED] drm_test_cmdline_res_rblank
...


These are SW-only tests that are already executed as part of each patch
series. We also have SW-only tests for xe in the same place:

[11:30:38] Starting KUnit Kernel (1/1)...
[11:30:38] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[11:30:39] =================== guc_dbm (7 subtests) ===================
[11:30:39] [PASSED] test_empty
...

Is this what you mean by drm selftests or did I misinterpret it?

Looking at https://intel-gfx-ci.01.org/tree/drm-tip/shards-all.html?testfilter=selftest
it seems some of the tests need HW access?

In xe we split what is SW-only from what needs HW access because of
this...  all kunit tests that need HW are inside xe_live_ktest, that
provides the igt integration (there's also a slight preference on not
using kunit for that too, but that varies depending who you talk to and
how much it's a unit vs integration test). Tests that are SW-only are
executed by build machines, they don't need to run on each target.

Lucas De Marchi

>
>BR,
>Jani.
>
>
>-- 
>Jani Nikula, Intel
