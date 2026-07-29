Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBD68C53200
	for <intel-xe@archiver.kernel.org>; Wed, 29 Jul 2026 08:31:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DA2F10EB06;
	Wed, 29 Jul 2026 08:31:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="njc1tW08";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5C4010EB06
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Jul 2026 08:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785313913; x=1816849913;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=Eq4Ad3k4guS/gx1W6JAkGnY01IDI8GhMI946qgFoxnc=;
 b=njc1tW08cZcex+jxV5zRWMSrYjw2SVwhcpGkLuBBsA3dIDfZuDiTXsXv
 ja4NvothIgs5wQDqZigMVbGY8Kd9Uh8FH/IG6ue6LvhxnE7IHfIBVVPtH
 6mg507N1bKOHYgUQ7P6JhW9E8c8WPzlvjK1KZ9eolXy6iX4uCA4VD4B1b
 J/Q/vvqgnEar1zpJ3KPKhMJYDiQdB7K2FbQEfz3V9DUBU+wPXWRYaNO4b
 MQhO6LqAkGmoqyo8wKAxjp/Re/3rbxQ66dIunlWZL7BqLO7kzJhNI79XJ
 oDQARJqXXlb73e6/OHU6G4+nn8WN4DwafgDT3xj+Cjt1CfQ7tcyQf2OSz w==;
X-CSE-ConnectionGUID: x2OrZ7OTTLCxEtU3H4rCug==
X-CSE-MsgGUID: /dKYI04vROifQHepJ7deug==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="86104075"
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; d="scan'208";a="86104075"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 01:31:53 -0700
X-CSE-ConnectionGUID: y/CxJyJiR4iOPhFtZlbDHA==
X-CSE-MsgGUID: DNKqBvQBTAqkrmeaMyPGBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; d="scan'208";a="258180749"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.244.212])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 01:31:49 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>, Mallesh Koujalagi
 <mallesh.koujalagi@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>, Aravind Iddamsetty
 <aravind.iddamsetty@intel.com>, Riana Tauro <riana.tauro@intel.com>, Raag
 Jadav <raag.jadav@intel.com>, Badal Nilawar <badal.nilawar@intel.com>
Subject: Re: [PATCH v2 00/22] drm/xe: Add structured SIGID error logging
 infrastructure
In-Reply-To: <20260728161039.579-1-michal.wajdeczko@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260728161039.579-1-michal.wajdeczko@intel.com>
Date: Wed, 29 Jul 2026 11:31:46 +0300
Message-ID: <dfe82413d317aee8bd39dbbc45ece77f9b6d7610@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Tue, 28 Jul 2026, Michal Wajdeczko <michal.wajdeczko@intel.com> wrote:
> Today the driver reports faults with ad-hoc drm_err()/xe_gt_err()
> strings that have no stable shape. That is readable for a human, but it
> gives fleet tooling nothing durable to match on: the wording changes
> between releases, lines can be rate-limited or dropped under an error
> storm, and there is no consistent way to ask "which recognised fault
> just happened?".
>
> Introduce a signature identifier (SIGID): a small, stable integer that
> names one recognised Xe fault situation and serves as the primary handle
> for triage. A SIGID maps, through published end-user documentation, to a
> description and a recommended action; the driver only has to emit the
> right SIGID next to the usual human-readable text.
>
> Design decisions:
>
>  - Software-emitted signatures only. This header enumerates just the
>    situations the driver detects and reports itself. Signatures that
>    originate in firmware or hardware are identified by those layers (via
>    their own records/counters) and are logged as received -- minting a
>    driver-side id for them would duplicate an id the reporting layer
>    already owns.
>
>  - Flat catalogue, chosen per report site. Each site emits the single
>    most specific situation for that site, so a multi-layer failure
>    produces a chain of reports rather than one ambiguous classification
>    (e.g. a failed GT reset reports GT_TDR and then WEDGED). A site that
>    matches no defined situation keeps using ordinary xe_err() /
>    xe_gt_err() rather than forcing a wrong id.
>
>  - Stable numbering. A single flat list numbered sequentially from 1, in
>    introduction order. Values are only ever appended, never renumbered
>    or reused.
>
>  - First-order action. Each SIGID carries a coarse, in-tree resolution
>    bucket (COLLECT / RETRY / UPDATE / RECOVER) so it is actionable
>    without an external reference, and so every new id must declare what
>    to do about it.
>
>  - Severity is decoupled from the SIGID and chosen at the call site via
>    xe_ras_log_fatal() / _recoverable() / _info(); the same situation can
>    be reported at different severities depending on the instance.
>
>  - dmesg stays close to a normal xe error line by reusing xe_err() /
>    xe_gt_err() (and their Tile/GT decoration); the only stable,
>    machine-matchable token added is SIGID=3D<n>. dmesg is not an ABI --
>    the durable machine record is the CPER carrying the same SIGID (a
>    planned follow-up, left as a TODO).
>
> Wire up a representative site for each software signature so the set is
> exercised rather than merely declared:
>
>  - PROBE: xe workqueue allocation failure during early init
>  - WEDGED: xe_device_declare_wedged() (drop redundant "CRITICAL" + BDF)
>  - SURVIVABILITY: entering boot survivability mode
>  - RUNTIME_FW: GuC mmio request failure
>  - DEVICE_FW: PCODE mailbox failure
>  - GT_TDR: GT reset failure (which then chains into a WEDGED report)
>  - MEM_FAULT: page-fault queue overflow
>  - IO_BUS: PCI re-enable failure after a bus reset

The idea is not new, see for example [1] and [2]. I'm not sure if that
was ever merged, though. Would be good to know what came of it, and why.

There's also the printk index support already in the kernel [3]. Did you
look into that? If not, please do. If yes, please iterate why that can't
be used, or extended, and a local mechanism is required.

FWIW, I think merging driver local mechanisms for what should really be
generic kernel stuff usually ends up being a maintenance PITA. It's easy
in the beginning, a burden in the end, and even harder to migrate to
generic mechanisms. We've seen this over and over in i915, even for
superficially small things. Part of the reason for xe existing in the
first place is to use common stuff instead of reinventing the weels.

BR,
Jani.


[1] https://lwn.net/Articles/464276/
[2] https://lwn.net/Articles/492125/
[3] https://lkml.org/lkml/2021/6/15/1053

>
> Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> Cc: Riana Tauro <riana.tauro@intel.com>
> Cc: Raag Jadav <raag.jadav@intel.com>
> Cc: Badal Nilawar <badal.nilawar@intel.com>
>
> v1: https://patchwork.freedesktop.org/series/171022/#rev1
> v2: component/location dmesg decorations moved away from macros
>     HW component identifiers related to RAS/FW enum values
>     CORRECTED severity rendered as an error
>     more support for const pointers
>     log 'probe blocked' as INFO
>     fix kunit device setup
>     more tests
>
> Mallesh Koujalagi (1):
>   drm/xe/log: Add structured SIGID error logging infrastructure
>
> Michal Wajdeczko (21):
>   drm/xe: Introduce xe_any helpers
>   drm/xe/log: Introduce structured component/location identifiers
>   drm/xe/log: Add component/location decorations to dmesg
>   drm/xe/log: Add SIGID log helpers for severity
>   drm/xe/log: Add SIGID log helpers for location
>   drm/xe/log: Add SIGID log helpers for location & severity
>   drm/xe/log: Add SIGID log helpers for components
>   drm/xe/log: Add SIGID log helpers for errno-only
>   drm/xe/log: Add hardware error signatures
>   drm/xe/log: Extend components list with hardware items
>   drm/xe/ras: Check RAS and LOG component definitions
>   drm/xe/kunit: Setup driver data in the test device
>   drm/xe/tests: Add Kunit tests for xe_log
>   drm/xe: Report 'probe blocked' error using SIGID
>   drm/xe: Report 'device wedged' errors using SIGID
>   drm/xe: Report 'Survivability Mode' errors using SIGID
>   drm/xe/guc: Report 'GuC mmio' errors using SIGID
>   drm/xe/pcode: Report 'Mailbox failed' error using SIGID
>   drm/xe/gt: Report 'reset failed' errors using SIGID
>   drm/xe/gt: Report 'pagefault' errors using SIGID
>   drm/xe/pci: Report 'cannot re-enable' error using SIGID
>
>  Documentation/gpu/xe/index.rst              |   1 +
>  Documentation/gpu/xe/xe_sigid.rst           |  14 +
>  drivers/gpu/drm/xe/Makefile                 |   1 +
>  drivers/gpu/drm/xe/abi/xe_log_abi.h         | 197 ++++++++
>  drivers/gpu/drm/xe/abi/xe_sigid_abi.h       | 195 ++++++++
>  drivers/gpu/drm/xe/tests/xe_kunit_helpers.c |   4 +
>  drivers/gpu/drm/xe/tests/xe_log_kunit.c     | 480 ++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_any.h                 | 112 +++++
>  drivers/gpu/drm/xe/xe_device.c              |  16 +-
>  drivers/gpu/drm/xe/xe_gt.c                  |   7 +-
>  drivers/gpu/drm/xe/xe_guc.c                 |  18 +-
>  drivers/gpu/drm/xe/xe_log.c                 | 212 +++++++++
>  drivers/gpu/drm/xe/xe_log.h                 | 158 +++++++
>  drivers/gpu/drm/xe/xe_pagefault.c           |  10 +-
>  drivers/gpu/drm/xe/xe_pci.c                 |   5 +-
>  drivers/gpu/drm/xe/xe_pci_error.c           |   7 +-
>  drivers/gpu/drm/xe/xe_pcode.c               |   5 +-
>  drivers/gpu/drm/xe/xe_ras.c                 |  11 +
>  drivers/gpu/drm/xe/xe_survivability_mode.c  |  24 +-
>  19 files changed, 1438 insertions(+), 39 deletions(-)
>  create mode 100644 Documentation/gpu/xe/xe_sigid.rst
>  create mode 100644 drivers/gpu/drm/xe/abi/xe_log_abi.h
>  create mode 100644 drivers/gpu/drm/xe/abi/xe_sigid_abi.h
>  create mode 100644 drivers/gpu/drm/xe/tests/xe_log_kunit.c
>  create mode 100644 drivers/gpu/drm/xe/xe_any.h
>  create mode 100644 drivers/gpu/drm/xe/xe_log.c
>  create mode 100644 drivers/gpu/drm/xe/xe_log.h

--=20
Jani Nikula, Intel
