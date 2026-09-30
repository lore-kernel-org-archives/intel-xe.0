Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEA24CA5FB1
	for <intel-xe@archiver.kernel.org>; Wed, 30 Sep 2026 06:23:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7935910E848;
	Wed, 30 Sep 2026 06:23:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XWTjvv1V";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AD9810E848
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Sep 2026 06:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790749429; x=1822285429;
 h=from:date:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=0gsMiSe5toVLTWzqulSHdEczaG5WOsFb2mCdrELo2A8=;
 b=XWTjvv1VMT8eRk2u+lOYxTIpOJS5c9NvUjxHzpOILP8zVoXy4aQaTcSo
 7WMMwJkxYVRJ12loOu4stTwSqVNP5yElZ+I36bodCjPiExphoyh21lC6m
 lOYIHOdO+iz5D+V56WphD/S3pAF6IJFpD5PKNJmQdNPzrurxSvq/PeBQ8
 jfMNPIH6q/hFxYEWQNodA3G51hqppSHAB54VJOIWhkUQ9vI3Za8b/ozfM
 /gxSySpMN1yGaAtlwCHEWS3nv+EtunihBikvpuyUUh5Xoc5WXAZywVdsl
 EpyGYsH1bfdWDQZ8ns0jLS/9HAWVS4GOynufEyAofzLC8vC1s9ZS2VD3V Q==;
X-CSE-ConnectionGUID: JmnNaH3ORJis1/G5Z9I8OQ==
X-CSE-MsgGUID: 1rO7X/zQQXqL9zntjvhAYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="91341224"
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; d="scan'208";a="91341224"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 23:23:49 -0700
X-CSE-ConnectionGUID: 1MEN64kEROu5UVAQ/E6j/w==
X-CSE-MsgGUID: bjVhNjhTQ0OJ33vmNyBjbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; d="scan'208";a="274707923"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.245.106])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 23:23:44 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 30 Sep 2026 09:23:40 +0300 (EEST)
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
cc: "Michael J. Ruhl" <michael.j.ruhl@intel.com>, 
 platform-driver-x86@vger.kernel.org, intel-xe@lists.freedesktop.org, 
 Hans de Goede <hansg@kernel.org>, matthew.brost@intel.com, 
 thomas.hellstrom@linux.intel.com, airlied@gmail.com, simona@ffwll.ch, 
 david.e.box@linux.intel.com, anoop.c.vijay@intel.com, 
 badal.nilawar@intel.com, matthew.d.roper@intel.com, james.ausmus@intel.com, 
 karthik.poosa@intel.com
Subject: Re: [PATCH v11 00/20] Crescent Island PMT support
In-Reply-To: <aru7BEn1SkkDOJd2@intel.com>
Message-ID: <a6027f1d-9583-fd3e-c430-c58c171d70e5@linux.intel.com>
References: <20260923181115.2514193-22-michael.j.ruhl@intel.com>
 <6805e8bd-9b48-df74-986c-d5aa43a6724c@linux.intel.com>
 <aru7BEn1SkkDOJd2@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-667003526-1790749420=:1755"
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-667003526-1790749420=:1755
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Tue, 29 Sep 2026, Rodrigo Vivi wrote:

> On Tue, Sep 29, 2026 at 11:12:34AM +0300, Ilpo J=E4rvinen wrote:
> > On Wed, 23 Sep 2026, Michael J. Ruhl wrote:
> >=20
> > > The Crescent Island (CRI) GPU supports PMT via Xe driver
> > > registration.
> > >=20
> > > The CRI PMT MMIO mapping is shared for each PMT feature and it is
> > > necessary to set an index register value to access the correct memory
> > > space.
> > >=20
> > > The PMT driver has a callback infrastructure to access data areas wit=
h
> > > driver specific access. It is does not support the PMT control access=
=2E
> > >=20
> > > CRI discovery/control spaces are part of the access window so a drive=
r
> > > callback is necessary to allow for the correct window to be exposed.
> > >=20
> > > Add control path callback support to the PMT driver.
> > >=20
> > > Add CRI PMT discovery information.
> > >=20
> > > Update the Xe driver to support the CRI PMT access.
> > >=20
> > > The crashlog access needs to be done with power enabled (telem is onl=
y
> > > available when the device is powered).
> > >=20
> > > Determine which access is requested, and do the appropriate power
> > > request.
> > >=20
> > > CRI FW is loaded at device power.  Support the late-binding API to
> > > wait for FW readiness. (pending sysctl patch set implements the API).
> > >=20
> > > v2:
> > >   Address AI feedback:
> > >   - add missing entry->cb check
> > >   - address SRIOV VF concerns
> > >   - use xe_pm_runtime_put instead of _get in error path
> > >=20
> > >   Address review comments:
> > >   - redo power/lock sequencing
> > >   - support device hotplug events
> > >=20
> > > v3:
> > >   - cleanup power manangement flow
> > >   - fixed an out of order power management locking issue
> > >   - add a GUID caching mechanism, for GUID read
> > >   - removed unused parameter (mmio)
> > >=20
> > > v4:
> > >  - address various review comments
> > >  - refactor crashlog to allow for return values
> > >  - for callback usage, decouple PMT remap of data areas
> > >  - use IS_SRIOV_VF() rather than expose soc-remapper internals
> > >  - separate locking fixes intos distinct steps
> > >  - refactor define update patches to seperate BMG and CRI updates
> > >  - separate internal GUID into separate steps
> > >=20
> > > v5:
> > >  - removed callback helpers
> > >  - do not return error message with sysfs
> > >  - fix missed return code check in trigger_store
> > >  - return error value not false
> > >  - use DEFINE_RES_MEM
> > >  - document when base is unused
> > >  - return error on invalid GUID request
> > >=20
> > > v6:
> > >  - fix enabled/disabled inversion
> > >  - fix missing DOC reference
> > >  - change memcpy_to/fromio to readl/writel for register read
> > >  - guid cache comment and update on valid guid
> > >=20
> > > v7:
> > >  - reordered to have BMG updates followed by CRI support
> > >  - separate base_offset usage for clarity
> > >  - added EAGAIN usage to block uninitialized use of the API
> > >=20
> > > v8:
> > >  - fix punit crashlog offset (should be 0xE60 not 0xE78)
> > >  - remove EAGAIN support and re-order probe steps to initialize
> > >    VSEC before other features use it
> > >=20
> > > v9:
> > >  - added appropriate reviewed-bys
> > >  - use dev_err instead of pr_err
> > >  - enforce defined base usage when callbacks are in plcace
> > >  - move SRIOV check to get_platform_info
> > >  - assert SRIOV for API check
> > >  - use scoped_guard() where possible
> > >  - update to use correct sysctrl helper
> > >=20
> > > v10:
> > >  - fix incorrect return type (broken in refactor, int -> bool)
> > >  - fix incorrectly documented error return values
> > >  - doc text cleanup
> > >=20
> > > v11:
> > >  - add reviewed-by
> > >  - fix minor checkpatch issue
> > >  - use xe_assert() for a consistent API check
> > >=20
> > > Michael J. Ruhl (18):
> > >   platform/x86/intel/pmt: complete pcidev to device update
> > >   platform/x86/intel/pmt: refactor rmw with a return value
> > >   platform/x86/intel/pmt: refactor rc with a return value
> > >   platform/x86/intel/pmt: Add register access callbacks
> > >   platform/x86/intel/pmt: Do not remap when using callbacks
> >=20
> > These platform drivers side patches looked ready so I've taken these=20
> > into a separate branch in pdx86 repo (+ one standalone pmt fix that loo=
ked=20
> > relevant to this case).
> >=20
> > I can do an IB PR out of that branch as needed if xe side wants to take=
=20
> > the rest sometime in this cycle.
>=20
> Well, I'd say that patch 17 is the only blocking on the rest of the serie=
s.
> If that gets reworked today/tomorrow then I would prefer to take all the
> patches through drm-xe-next with your ack.
>=20
> Otherwise, please go with your pull request and then when we backmerge th=
e
> next -rc1/-rc2 we push the rest of the series to drm-xe-next.

We'll have to use this second option then, the changes are so extensive=20
that I prefer the pdx86 side changes go through my tree.

--
 i.

> Thanks,
> Rodrigo.
>=20
> >=20
> > >   drm/xe/vsec: Do not register BMG PMT for VF
> > >   drm/xe/vsec: Correct locking order
> > >   drm/xe/vsec: Use correct pm state get
> > >   drm/xe/vsec: Add DOC text for VSEC
> > >   drm/xe/vsec: Support possible hotplug exit
> > >   drm/xe/vsec: Refactor BattleMage PMT defines
> > >   drm/xe/vsec: Update VSEC probe order
> > >   drm/xe/vsec: Add base_offset to allow for more flexibilty
> > >   drm/xe/vsec: Support Crescent Island PMT
> > >   drm/xe/vsec: Crescent Island PMT decode
> > >   drm/xe/vsec: Crescent Island PMT callbacks
> > >   drm/xe/vsec: Support late bind fw information
> > >   drm/xe/vsec: Add PMT GUID internal access
> > >   drm/xe/vsec: Update PMT internal access
> > >   drm/xe/vsec: Refactor platform check
> > >=20
> > >  Documentation/gpu/xe/index.rst             |   1 +
> > >  Documentation/gpu/xe/xe_vsec.rst           |  14 +
> > >  drivers/gpu/drm/xe/regs/xe_pmt.h           |  12 +-
> > >  drivers/gpu/drm/xe/xe_debugfs.c            |  45 +-
> > >  drivers/gpu/drm/xe/xe_device.c             |   6 +-
> > >  drivers/gpu/drm/xe/xe_device_types.h       |   9 +
> > >  drivers/gpu/drm/xe/xe_hwmon.c              |  10 +-
> > >  drivers/gpu/drm/xe/xe_pcode.c              |  10 +-
> > >  drivers/gpu/drm/xe/xe_vsec.c               | 552 +++++++++++++++++++=
--
> > >  drivers/gpu/drm/xe/xe_vsec.h               |   3 +-
> > >  drivers/platform/x86/intel/pmt/class.c     |  26 +-
> > >  drivers/platform/x86/intel/pmt/class.h     |   5 +-
> > >  drivers/platform/x86/intel/pmt/crashlog.c  | 235 ++++++---
> > >  drivers/platform/x86/intel/pmt/discovery.c |   2 +-
> > >  drivers/platform/x86/intel/pmt/telemetry.c |   3 +
> > >  include/linux/intel_vsec.h                 |  14 +-
> > >  16 files changed, 781 insertions(+), 166 deletions(-)
> > >  create mode 100644 Documentation/gpu/xe/xe_vsec.rst
--8323328-667003526-1790749420=:1755--
