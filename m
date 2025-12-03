Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B4F7D1266D
	for <intel-xe@archiver.kernel.org>; Wed,  3 Dec 2025 09:18:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0155010E733;
	Wed,  3 Dec 2025 09:18:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OcPSuK4a";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FAF810E733
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Dec 2025 09:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764753533; x=1796289533;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=47AtD8zVhYRFB3EM7IfO1DUylL6AF4WH/JsXhoMGrj4=;
 b=OcPSuK4au4/b++uqhizvw6V7qRlL+fFxcITyaiyhpibQwc3zBZG6mABY
 NlXgxgHeqTYIv4I+HhZup07P4AuN3+lHKDiEaDN8GRwl6tXTrUGcBGeVs
 SN+FphFNSmN9C28B7mGS46Fdm9SH3Fxr0hK6rVFHSV0PN4RSdvD9YYs5E
 sYXpkXtFEILkxgH7iynRp+asiB2eRCjHuy8LQFAP5NgvNAYVlUrbiaC6+
 ADUpX+M33V/1DMjPwLzZE6vKYIauRBSwaMdL/El87kDs52oC3AhqCqqtE
 fsnF41jfr2UB5HNq9MYXYbKnib45xIcUWsHZbBmU1y1ygqGcu0AMMhdGM Q==;
X-CSE-ConnectionGUID: eFFvQP48SEOFTV4cygSjGg==
X-CSE-MsgGUID: kb19lwx/Rg2dGdb9EvY2iQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="66681979"
X-IronPort-AV: E=Sophos;i="6.20,245,1758610800"; d="scan'208";a="66681979"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2025 01:18:52 -0800
X-CSE-ConnectionGUID: qilrqY7YQWuOnCEAZxSfjA==
X-CSE-MsgGUID: y/zg246+TJaepWvw/hGuhA==
X-ExtLoop1: 1
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.223])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2025 01:18:48 -0800
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: Christian =?utf-8?Q?K=C3=B6nig?= <christian.koenig@amd.com>,
 intel-xe@lists.freedesktop.org
Cc: simona.vetter@ffwll.ch, matthew.brost@intel.com,
 thomas.hellstrom@linux.intel.com, joonas.lahtinen@linux.intel.com,
 christoph.manszewski@intel.com, rodrigo.vivi@intel.com,
 lucas.demarchi@intel.com, andrzej.hajda@intel.com, matthew.auld@intel.com,
 maciej.patelczyk@intel.com, gwan-gyeong.mun@intel.com
Subject: Re: [PATCH 00/15] Intel Xe GPU Debug Support (eudebug) v4
In-Reply-To: <49a1024b-a318-446f-8c97-4076fc647fdd@amd.com>
References: <20250808104356.3294210-1-mika.kuoppala@linux.intel.com>
 <49a1024b-a318-446f-8c97-4076fc647fdd@amd.com>
Date: Wed, 03 Dec 2025 11:18:45 +0200
Message-ID: <874iq7gbyi.fsf@mkuoppal-desk>
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

Christian K=C3=B6nig <christian.koenig@amd.com> writes:

Hi Christian,

> On 08.08.25 12:43, Mika Kuoppala wrote:
>> Hi,
>>=20
>> This is the v4 patch series for Intel Xe GPU debug support (eudebug).
>>=20
>> This series continues from the following previous submissions:
>> - v1: https://lists.freedesktop.org/archives/intel-xe/2024-July/043605.h=
tml
>> - v2: https://lists.freedesktop.org/archives/intel-xe/2024-October/05226=
0.html
>> - v3: https://lists.freedesktop.org/archives/intel-xe/2024-December/0614=
76.html
>>=20
>> This is a major cleanup and rework of eudebug patch series to address the
>> feedback for v3. Page fault handling is omitted for until we receive
>> ack on core design, as there was no feedback on it on previous iteration=
s.
>>=20
>> ### Major Changes
>>=20
>> #### 1. Elimination of ptrace_may_access() and pid
>>=20
>> In previous series, the connection attempt was made using the process ID
>> (PID) as the target. Access was checked using the `ptrace_may_access()`
>> helper to achieve security parity with CPU-side debugging.
>>=20
>> In v4, this has been changed to connect to a DRM client, using a file
>> descriptor as the target. This approach eliminates the need for the
>> `ptrace_may_access()` symbol export, as access control is now managed
>> through the debugger process's access to the file descriptor. For exampl=
e,
>> accessing a remote DRM client requires the debugger process to
>> successfully call `pidfd_getfd()` to obtain a duplicate of the target
>> file descriptor.The 1:1 mapping between DRM clients and their debuggers
>> eliminates the need for `EVENT_OPEN` and simplifies overall connection
>> tracking.
>
> It would be really nice if we could document that approach under Document=
ation/gpu.
>
>>=20
>> #### 2. ELF binaries not held in kernel memory
>>=20
>> In v4, debug data is delivered as a VM bind 'OP_ADD_DEBUG_DATA' extensio=
n.
>> The ELF binaries are no longer stored within the Xe KMD but are instead
>> kept in a file. The file path is passed as part of an extension in
>> the newly introduced 'OP_ADD_DEBUG_DATA' VM bind operation. Alternatively
>> pseudo-paths can be used to annotate special address ranges similar to
>> /proc/<pid>/maps.
>>=20
>> #### 3. Debug metadata not carried in VMA struct
>>=20
>> Instead of attaching debug data to vma created by 'OP_MAP',
>> we introduce separate ops for managing the metadata.
>> Debug data is no longer held in the VMA struct. xe_vm contains a
>> list of all associated debug data.
>
> I need to take a closer look but that sounds like it takes a big step int=
o the right direction.

Encouraged by this positive feedback, we iterated the series further. VM
binds state handling has reworked on top of vm_ops, metada and ufence
handling improved and we added pagefaults on top.

v6 series can be found here:
https://lists.freedesktop.org/archives/intel-xe/2025-December/106405.html

Thanks,
-Mika

>
> Regards,
> Christian.
>
>>=20
>> ### Supported Hardware with v4
>> - Lunarlake (LNL)
>> - Battlemage (BMG)
>> - Pantherlake (PTL)
>>=20
>> The code for this submission can be found at:
>> https://gitlab.freedesktop.org/miku/kernel/-/tree/eudebug-v4
>>=20
>> Christoph Manszewski (5):
>>   drm/xe: Introduce ADD_DEBUG_DATA and REMOVE_DEBUG_DATA vm bind ops
>>   drm/xe/eudebug: Introduce vm bind and vm bind debug data events
>>   drm/xe/eudebug_test: Introduce xe_eudebug wa kunit test
>>   drm/xe: Implement SR-IOV and eudebug exclusivity
>>   drm/xe: Add xe_client_debugfs and introduce debug_data file
>>=20
>> Dominik Grzegorzek (5):
>>   drm/xe/eudebug: Introduce exec_queue events
>>   drm/xe: Add EUDEBUG_ENABLE exec queue property
>>   drm/xe/eudebug: hw enablement for eudebug
>>   drm/xe/eudebug: Introduce EU control interface
>>   drm/xe/eudebug: Introduce per device attention scan worker
>>=20
>> Mika Kuoppala (5):
>>   drm/xe/eudebug: Introduce eudebug interface
>>   drm/xe/eudebug: Introduce discovery for resources
>>   drm/xe/eudebug: Add UFENCE events with acks
>>   drm/xe/eudebug: vm open/pread/pwrite
>>   drm/xe/eudebug: userptr vm pread/pwrite
>>=20
>>  drivers/gpu/drm/xe/Kconfig                  |   10 +
>>  drivers/gpu/drm/xe/Makefile                 |    7 +-
>>  drivers/gpu/drm/xe/regs/xe_engine_regs.h    |    7 +
>>  drivers/gpu/drm/xe/regs/xe_gt_regs.h        |   43 +
>>  drivers/gpu/drm/xe/tests/xe_eudebug.c       |  189 ++
>>  drivers/gpu/drm/xe/tests/xe_live_test_mod.c |    5 +
>>  drivers/gpu/drm/xe/xe_client_debugfs.c      |  118 +
>>  drivers/gpu/drm/xe/xe_client_debugfs.h      |   19 +
>>  drivers/gpu/drm/xe/xe_debug_data.c          |  279 +++
>>  drivers/gpu/drm/xe/xe_debug_data.h          |   22 +
>>  drivers/gpu/drm/xe/xe_debug_data_types.h    |   25 +
>>  drivers/gpu/drm/xe/xe_device.c              |   30 +-
>>  drivers/gpu/drm/xe/xe_device.h              |   42 +
>>  drivers/gpu/drm/xe/xe_device_types.h        |   40 +
>>  drivers/gpu/drm/xe/xe_eudebug.c             | 2309 +++++++++++++++++++
>>  drivers/gpu/drm/xe/xe_eudebug.h             |  116 +
>>  drivers/gpu/drm/xe/xe_eudebug_hw.c          |  730 ++++++
>>  drivers/gpu/drm/xe/xe_eudebug_hw.h          |   32 +
>>  drivers/gpu/drm/xe/xe_eudebug_types.h       |  174 ++
>>  drivers/gpu/drm/xe/xe_eudebug_vm.c          |  434 ++++
>>  drivers/gpu/drm/xe/xe_eudebug_vm.h          |    8 +
>>  drivers/gpu/drm/xe/xe_exec.c                |    2 +-
>>  drivers/gpu/drm/xe/xe_exec_queue.c          |   51 +-
>>  drivers/gpu/drm/xe/xe_exec_queue.h          |    2 +
>>  drivers/gpu/drm/xe/xe_exec_queue_types.h    |    7 +
>>  drivers/gpu/drm/xe/xe_gt.c                  |    1 +
>>  drivers/gpu/drm/xe/xe_gt_debug.c            |  179 ++
>>  drivers/gpu/drm/xe/xe_gt_debug.h            |   41 +
>>  drivers/gpu/drm/xe/xe_hw_engine.h           |   14 +
>>  drivers/gpu/drm/xe/xe_lrc.c                 |   10 +
>>  drivers/gpu/drm/xe/xe_oa.c                  |    3 +-
>>  drivers/gpu/drm/xe/xe_pci_sriov.c           |   10 +
>>  drivers/gpu/drm/xe/xe_reg_sr.c              |   21 +-
>>  drivers/gpu/drm/xe/xe_reg_sr.h              |    4 +-
>>  drivers/gpu/drm/xe/xe_reg_whitelist.c       |    2 +-
>>  drivers/gpu/drm/xe/xe_rtp.c                 |    2 +-
>>  drivers/gpu/drm/xe/xe_sync.c                |   45 +-
>>  drivers/gpu/drm/xe/xe_sync.h                |    8 +-
>>  drivers/gpu/drm/xe/xe_sync_types.h          |   28 +-
>>  drivers/gpu/drm/xe/xe_vm.c                  |  186 +-
>>  drivers/gpu/drm/xe/xe_vm.h                  |   26 +
>>  drivers/gpu/drm/xe/xe_vm_types.h            |   38 +
>>  drivers/gpu/drm/xe/xe_wa_oob.rules          |    4 +
>>  include/uapi/drm/xe_drm.h                   |   59 +
>>  include/uapi/drm/xe_drm_eudebug.h           |  217 ++
>>  45 files changed, 5552 insertions(+), 47 deletions(-)
>>  create mode 100644 drivers/gpu/drm/xe/tests/xe_eudebug.c
>>  create mode 100644 drivers/gpu/drm/xe/xe_client_debugfs.c
>>  create mode 100644 drivers/gpu/drm/xe/xe_client_debugfs.h
>>  create mode 100644 drivers/gpu/drm/xe/xe_debug_data.c
>>  create mode 100644 drivers/gpu/drm/xe/xe_debug_data.h
>>  create mode 100644 drivers/gpu/drm/xe/xe_debug_data_types.h
>>  create mode 100644 drivers/gpu/drm/xe/xe_eudebug.c
>>  create mode 100644 drivers/gpu/drm/xe/xe_eudebug.h
>>  create mode 100644 drivers/gpu/drm/xe/xe_eudebug_hw.c
>>  create mode 100644 drivers/gpu/drm/xe/xe_eudebug_hw.h
>>  create mode 100644 drivers/gpu/drm/xe/xe_eudebug_types.h
>>  create mode 100644 drivers/gpu/drm/xe/xe_eudebug_vm.c
>>  create mode 100644 drivers/gpu/drm/xe/xe_eudebug_vm.h
>>  create mode 100644 drivers/gpu/drm/xe/xe_gt_debug.c
>>  create mode 100644 drivers/gpu/drm/xe/xe_gt_debug.h
>>  create mode 100644 include/uapi/drm/xe_drm_eudebug.h
>>=20
