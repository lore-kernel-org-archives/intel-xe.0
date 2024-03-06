Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE357C5475B
	for <intel-xe@archiver.kernel.org>; Wed,  6 Mar 2024 11:35:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 518A71130B3;
	Wed,  6 Mar 2024 11:35:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jFNACQ/u";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E22871130B4
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Mar 2024 11:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709724954; x=1741260954;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=HK1AWwnbjEtJKJppULtN9SVOAzy/I3fvRqR+XA4sADQ=;
 b=jFNACQ/uLLXMoayOxupXJjSm14B41d7ZzQx0SKwzxMN2SLS/jAQI1lb1
 z7RZn/OP7HOLhBoNT/BjJy0h5kd3kY16Kk7K9UF9mgQHWEtbHaIyXqXFt
 FYr1xoe2/jkToDrwzX5cKeSgYapEqr/KuaYvgJbICwsudr3dqW6FqlSlJ
 mTuJcHpLk6zMlV5+Jw+UhoA6Y0Kw1uglF2kPC7pcrV2Bih0fQAGBxWuUg
 yCj/juI2/qGGOQ8G6EUyaDvvBDB95/vlAkcbI8QEgYVBB++ytN7KXvcEh
 125Fg14mgeYQlpazSIBCca57Lvr6e3gljeaNd55aOmvg6IySb9JfWyYYN w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11004"; a="4217475"
X-IronPort-AV: E=Sophos;i="6.06,208,1705392000"; 
   d="scan'208";a="4217475"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2024 03:35:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,208,1705392000"; 
   d="scan'208";a="9818444"
Received: from rjongalo-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.33.211])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2024 03:35:51 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Patchwork <patchwork@emeril.freedesktop.org>, Tiwei Bie
 <tiwei.btw@antgroup.com>
Cc: intel-xe@lists.freedesktop.org
Subject: Re: =?utf-8?Q?=E2=9C=93?= CI.KUnit: success for um: Minor fixes and
 cleanups
In-Reply-To: <170972323611.524851.613102023126568344@8e613ede5ea5>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240306101925.1088870-1-tiwei.btw@antgroup.com>
 <170972323611.524851.613102023126568344@8e613ede5ea5>
Date: Wed, 06 Mar 2024 13:35:47 +0200
Message-ID: <87bk7rzj70.fsf@intel.com>
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


Thanks Tiwei, this is a clear improvement over e.g. [1].

BR,
Jani.


[1] https://lore.kernel.org/r/170972018947.524258.12952216008088468886@8e61=
3ede5ea5


On Wed, 06 Mar 2024, Patchwork <patchwork@emeril.freedesktop.org> wrote:
> =3D=3D Series Details =3D=3D
>
> Series: um: Minor fixes and cleanups
> URL   : https://patchwork.freedesktop.org/series/130801/
> State : success
>
> =3D=3D Summary =3D=3D
>
> + trap cleanup EXIT
> + /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/=
gpu/drm/xe/.kunitconfig
> [11:06:24] Configuring KUnit Kernel ...
> Generating .config ...
> Populating config with:
> $ make ARCH=3Dum O=3D.kunit olddefconfig
> [11:06:28] Building KUnit Kernel ...
> Populating config with:
> $ make ARCH=3Dum O=3D.kunit olddefconfig
> Building with:
> $ make ARCH=3Dum O=3D.kunit --jobs=3D48
> ../arch/x86/um/os-Linux/registers.c:146:15: warning: no previous prototyp=
e for =E2=80=98get_thread_reg=E2=80=99 [-Wmissing-prototypes]
>   146 | unsigned long get_thread_reg(int reg, jmp_buf *buf)
>       |               ^~~~~~~~~~~~~~
> ../arch/x86/um/vdso/um_vdso.c:16:5: warning: no previous prototype for =
=E2=80=98__vdso_clock_gettime=E2=80=99 [-Wmissing-prototypes]
>    16 | int __vdso_clock_gettime(clockid_t clock, struct __kernel_old_tim=
espec *ts)
>       |     ^~~~~~~~~~~~~~~~~~~~
> ../arch/x86/um/vdso/um_vdso.c:30:5: warning: no previous prototype for =
=E2=80=98__vdso_gettimeofday=E2=80=99 [-Wmissing-prototypes]
>    30 | int __vdso_gettimeofday(struct __kernel_old_timeval *tv, struct t=
imezone *tz)
>       |     ^~~~~~~~~~~~~~~~~~~
> ../arch/x86/um/vdso/um_vdso.c:44:21: warning: no previous prototype for =
=E2=80=98__vdso_time=E2=80=99 [-Wmissing-prototypes]
>    44 | __kernel_old_time_t __vdso_time(__kernel_old_time_t *t)
>       |                     ^~~~~~~~~~~
> ../arch/x86/um/vdso/um_vdso.c:57:1: warning: no previous prototype for =
=E2=80=98__vdso_getcpu=E2=80=99 [-Wmissing-prototypes]
>    57 | __vdso_getcpu(unsigned *cpu, unsigned *node, struct getcpu_cache =
*unused)
>       | ^~~~~~~~~~~~~
> ../arch/um/os-Linux/skas/process.c:107:6: warning: no previous prototype =
for =E2=80=98wait_stub_done=E2=80=99 [-Wmissing-prototypes]
>   107 | void wait_stub_done(int pid)
>       |      ^~~~~~~~~~~~~~
> ../arch/um/os-Linux/skas/process.c:683:6: warning: no previous prototype =
for =E2=80=98__switch_mm=E2=80=99 [-Wmissing-prototypes]
>   683 | void __switch_mm(struct mm_id *mm_idp)
>       |      ^~~~~~~~~~~
> ../arch/um/os-Linux/mem.c:28:6: warning: no previous prototype for =E2=80=
=98kasan_map_memory=E2=80=99 [-Wmissing-prototypes]
>    28 | void kasan_map_memory(void *start, size_t len)
>       |      ^~~~~~~~~~~~~~~~
> ../arch/um/os-Linux/mem.c:212:13: warning: no previous prototype for =E2=
=80=98check_tmpexec=E2=80=99 [-Wmissing-prototypes]
>   212 | void __init check_tmpexec(void)
>       |             ^~~~~~~~~~~~~
> ../arch/x86/um/signal.c:560:6: warning: no previous prototype for =E2=80=
=98sys_rt_sigreturn=E2=80=99 [-Wmissing-prototypes]
>   560 | long sys_rt_sigreturn(void)
>       |      ^~~~~~~~~~~~~~~~
> ../lib/iomap.c:156:5: warning: no previous prototype for =E2=80=98ioread6=
4_lo_hi=E2=80=99 [-Wmissing-prototypes]
>   156 | u64 ioread64_lo_hi(const void __iomem *addr)
>       |     ^~~~~~~~~~~~~~
> ../lib/iomap.c:163:5: warning: no previous prototype for =E2=80=98ioread6=
4_hi_lo=E2=80=99 [-Wmissing-prototypes]
>   163 | u64 ioread64_hi_lo(const void __iomem *addr)
>       |     ^~~~~~~~~~~~~~
> ../lib/iomap.c:170:5: warning: no previous prototype for =E2=80=98ioread6=
4be_lo_hi=E2=80=99 [-Wmissing-prototypes]
>   170 | u64 ioread64be_lo_hi(const void __iomem *addr)
>       |     ^~~~~~~~~~~~~~~~
> ../lib/iomap.c:178:5: warning: no previous prototype for =E2=80=98ioread6=
4be_hi_lo=E2=80=99 [-Wmissing-prototypes]
>   178 | u64 ioread64be_hi_lo(const void __iomem *addr)
>       |     ^~~~~~~~~~~~~~~~
> ../lib/iomap.c:264:6: warning: no previous prototype for =E2=80=98iowrite=
64_lo_hi=E2=80=99 [-Wmissing-prototypes]
>   264 | void iowrite64_lo_hi(u64 val, void __iomem *addr)
>       |      ^~~~~~~~~~~~~~~
> ../lib/iomap.c:272:6: warning: no previous prototype for =E2=80=98iowrite=
64_hi_lo=E2=80=99 [-Wmissing-prototypes]
>   272 | void iowrite64_hi_lo(u64 val, void __iomem *addr)
>       |      ^~~~~~~~~~~~~~~
> ../lib/iomap.c:280:6: warning: no previous prototype for =E2=80=98iowrite=
64be_lo_hi=E2=80=99 [-Wmissing-prototypes]
>   280 | void iowrite64be_lo_hi(u64 val, void __iomem *addr)
>       |      ^~~~~~~~~~~~~~~~~
> ../lib/iomap.c:288:6: warning: no previous prototype for =E2=80=98iowrite=
64be_hi_lo=E2=80=99 [-Wmissing-prototypes]
>   288 | void iowrite64be_hi_lo(u64 val, void __iomem *addr)
>       |      ^~~~~~~~~~~~~~~~~
>
> [11:06:51] Starting KUnit Kernel (1/1)...
> [11:06:51] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [11:06:51] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D guc_=
dbm (7 subtests) =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [11:06:51] [PASSED] test_empty
> [11:06:51] [PASSED] test_default
> [11:06:51] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D test_size  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
> [11:06:51] [PASSED] 4
> [11:06:51] [PASSED] 8
> [11:06:51] [PASSED] 32
> [11:06:51] [PASSED] 256
> [11:06:51] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D [=
PASSED] test_size =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> [11:06:51] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D test_reuse  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
> [11:06:51] [PASSED] 4
> [11:06:51] [PASSED] 8
> [11:06:51] [PASSED] 32
> [11:06:51] [PASSED] 256
> [11:06:51] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D [PAS=
SED] test_reuse =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [11:06:51] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D test=
_range_overlap  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [11:06:51] [PASSED] 4
> [11:06:51] [PASSED] 8
> [11:06:51] [PASSED] 32
> [11:06:51] [PASSED] 256
> [11:06:51] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D [PASSED] test_ra=
nge_overlap =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [11:06:51] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D test=
_range_compact  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [11:06:51] [PASSED] 4
> [11:06:51] [PASSED] 8
> [11:06:51] [PASSED] 32
> [11:06:51] [PASSED] 256
> [11:06:51] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D [PASSED] test_ra=
nge_compact =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [11:06:51] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D t=
est_range_spare  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> [11:06:51] [PASSED] 4
> [11:06:51] [PASSED] 8
> [11:06:51] [PASSED] 32
> [11:06:51] [PASSED] 256
> [11:06:51] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D [PASSED] test=
_range_spare =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [11:06:51] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D [PASSED] guc_dbm =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> [11:06:51] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D no_rela=
y (3 subtests) =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [11:06:51] [PASSED] xe_drops_guc2pf_if_not_ready
> [11:06:51] [PASSED] xe_drops_guc2vf_if_not_ready
> [11:06:51] [PASSED] xe_rejects_send_if_not_ready
> [11:06:51] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D [=
PASSED] no_relay =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> [11:06:51] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D pf_rela=
y (14 subtests) =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [11:06:51] [PASSED] pf_rejects_guc2pf_too_short
> [11:06:51] [PASSED] pf_rejects_guc2pf_too_long
> [11:06:51] [PASSED] pf_rejects_guc2pf_no_payload
> [11:06:51] [PASSED] pf_fails_no_payload
> [11:06:51] [PASSED] pf_fails_bad_origin
> [11:06:51] [PASSED] pf_fails_bad_type
> [11:06:51] [PASSED] pf_txn_reports_error
> [11:06:51] [PASSED] pf_txn_sends_pf2guc
> [11:06:51] [PASSED] pf_sends_pf2guc
> [11:06:51] [SKIPPED] pf_loopback_nop
> [11:06:51] [SKIPPED] pf_loopback_echo
> [11:06:51] [SKIPPED] pf_loopback_fail
> [11:06:51] [SKIPPED] pf_loopback_busy
> [11:06:51] [SKIPPED] pf_loopback_retry
> [11:06:51] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D [=
PASSED] pf_relay =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> [11:06:51] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D vf_rela=
y (3 subtests) =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [11:06:51] [PASSED] vf_rejects_guc2vf_too_short
> [11:06:51] [PASSED] vf_rejects_guc2vf_too_long
> [11:06:51] [PASSED] vf_rejects_guc2vf_no_payload
> [11:06:51] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D [=
PASSED] vf_relay =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> [11:06:51] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D lmtt (1 subtest) =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> [11:06:51] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D test_ops  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> [11:06:51] [PASSED] 2-level
> [11:06:51] [PASSED] multi-level
> [11:06:51] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D [=
PASSED] test_ops =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> [11:06:51] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D [PASSED] lmtt =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> [11:06:51] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D x=
e_bo (2 subtests) =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> [11:06:51] [SKIPPED] xe_ccs_migrate_kunit
> [11:06:51] [SKIPPED] xe_bo_evict_kunit
> [11:06:51] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D [SKIPPED] xe_bo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
> [11:06:51] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D xe_dma_=
buf (1 subtest) =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [11:06:51] [SKIPPED] xe_dma_buf_kunit
> [11:06:51] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D [SKI=
PPED] xe_dma_buf =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [11:06:51] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D xe_migr=
ate (1 subtest) =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [11:06:51] [SKIPPED] xe_migrate_sanity_kunit
> [11:06:51] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D [SKI=
PPED] xe_migrate =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [11:06:51] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D xe_m=
ocs (2 subtests) =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [11:06:51] [SKIPPED] xe_live_mocs_kernel_kunit
> [11:06:51] [SKIPPED] xe_live_mocs_reset_kunit
> [11:06:51] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D [=
SKIPPED] xe_mocs =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> [11:06:51] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D xe_p=
ci (2 subtests) =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [11:06:51] [PASSED] xe_gmdid_graphics_ip
> [11:06:51] [PASSED] xe_gmdid_media_ip
> [11:06:51] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D [PASSED] xe_pci =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
> [11:06:51] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D x=
e_rtp (1 subtest) =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> [11:06:51] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D xe_rtp_=
process_tests  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> stty: 'standard input': Inappropriate ioctl for device
> [11:06:51] [PASSED] coalesce-same-reg
> [11:06:51] [PASSED] no-match-no-add
> [11:06:51] [PASSED] no-match-no-add-multiple-rules
> [11:06:51] [PASSED] two-regs-two-entries
> [11:06:51] [PASSED] clr-one-set-other
> [11:06:51] [PASSED] set-field
> [11:06:51] [PASSED] conflict-duplicate
> [11:06:51] [PASSED] conflict-not-disjoint
> [11:06:51] [PASSED] conflict-reg-type
> [11:06:51] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D [PASSED] xe_rtp_pro=
cess_tests =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [11:06:51] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D [PASSED] xe_rtp =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
> [11:06:51] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D x=
e_wa (1 subtest) =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> [11:06:51] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D xe_wa_gt  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> [11:06:51] [PASSED] TIGERLAKE (B0)
> [11:06:51] [PASSED] DG1 (A0)
> [11:06:51] [PASSED] DG1 (B0)
> [11:06:51] [PASSED] ALDERLAKE_S (A0)
> [11:06:51] [PASSED] ALDERLAKE_S (B0)
> [11:06:51] [PASSED] ALDERLAKE_S (C0)
> [11:06:51] [PASSED] ALDERLAKE_S (D0)
> [11:06:51] [PASSED] ALDERLAKE_P (A0)
> [11:06:51] [PASSED] ALDERLAKE_P (B0)
> [11:06:51] [PASSED] ALDERLAKE_P (C0)
> [11:06:51] [PASSED] ALDERLAKE_S_RPLS (D0)
> [11:06:51] [PASSED] ALDERLAKE_P_RPLU (E0)
> [11:06:51] [PASSED] DG2_G10 (C0)
> [11:06:51] [PASSED] DG2_G11 (B1)
> [11:06:51] [PASSED] DG2_G12 (A1)
> [11:06:51] [PASSED] METEORLAKE (g:A0, m:A0)
> [11:06:51] [PASSED] METEORLAKE (g:A0, m:A0)
> [11:06:51] [PASSED] METEORLAKE (g:A0, m:A0)
> [11:06:51] [PASSED] LUNARLAKE (g:A0, m:A0)
> [11:06:51] [PASSED] LUNARLAKE (g:B0, m:A0)
> [11:06:51] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D [=
PASSED] xe_wa_gt =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> [11:06:51] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D [PASSED] xe_wa =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> [11:06:51] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [11:06:51] Testing complete. Ran 81 tests: passed: 70, skipped: 11
> [11:06:51] Elapsed time: 27.723s total, 4.152s configuring, 23.350s build=
ing, 0.181s running
>
> + /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/=
gpu/drm/tests/.kunitconfig
> [11:06:52] Configuring KUnit Kernel ...
> Regenerating .config ...
> Populating config with:
> $ make ARCH=3Dum O=3D.kunit olddefconfig
> [11:06:53] Building KUnit Kernel ...
> Populating config with:
> $ make ARCH=3Dum O=3D.kunit olddefconfig
> Building with:
> $ make ARCH=3Dum O=3D.kunit --jobs=3D48
> ../arch/x86/um/signal.c:560:6: warning: no previous prototype for =E2=80=
=98sys_rt_sigreturn=E2=80=99 [-Wmissing-prototypes]
>   560 | long sys_rt_sigreturn(void)
>       |      ^~~~~~~~~~~~~~~~
> ../lib/iomap.c:156:5: warning: no previous prototype for =E2=80=98ioread6=
4_lo_hi=E2=80=99 [-Wmissing-prototypes]
>   156 | u64 ioread64_lo_hi(const void __iomem *addr)
>       |     ^~~~~~~~~~~~~~
> ../lib/iomap.c:163:5: warning: no previous prototype for =E2=80=98ioread6=
4_hi_lo=E2=80=99 [-Wmissing-prototypes]
>   163 | u64 ioread64_hi_lo(const void __iomem *addr)
>       |     ^~~~~~~~~~~~~~
> ../lib/iomap.c:170:5: warning: no previous prototype for =E2=80=98ioread6=
4be_lo_hi=E2=80=99 [-Wmissing-prototypes]
>   170 | u64 ioread64be_lo_hi(const void __iomem *addr)
>       |     ^~~~~~~~~~~~~~~~
> ../lib/iomap.c:178:5: warning: no previous prototype for =E2=80=98ioread6=
4be_hi_lo=E2=80=99 [-Wmissing-prototypes]
>   178 | u64 ioread64be_hi_lo(const void __iomem *addr)
>       |     ^~~~~~~~~~~~~~~~
> ../lib/iomap.c:264:6: warning: no previous prototype for =E2=80=98iowrite=
64_lo_hi=E2=80=99 [-Wmissing-prototypes]
>   264 | void iowrite64_lo_hi(u64 val, void __iomem *addr)
>       |      ^~~~~~~~~~~~~~~
> ../lib/iomap.c:272:6: warning: no previous prototype for =E2=80=98iowrite=
64_hi_lo=E2=80=99 [-Wmissing-prototypes]
>   272 | void iowrite64_hi_lo(u64 val, void __iomem *addr)
>       |      ^~~~~~~~~~~~~~~
> ../lib/iomap.c:280:6: warning: no previous prototype for =E2=80=98iowrite=
64be_lo_hi=E2=80=99 [-Wmissing-prototypes]
>   280 | void iowrite64be_lo_hi(u64 val, void __iomem *addr)
>       |      ^~~~~~~~~~~~~~~~~
> ../lib/iomap.c:288:6: warning: no previous prototype for =E2=80=98iowrite=
64be_hi_lo=E2=80=99 [-Wmissing-prototypes]
>   288 | void iowrite64be_hi_lo(u64 val, void __iomem *addr)
>       |      ^~~~~~~~~~~~~~~~~
>
> [11:07:13] Starting KUnit Kernel (1/1)...
> [11:07:13] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [11:07:13] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D drm_test_pick_cmdline (2 =
subtests) =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [11:07:13] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
> [11:07:13] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D drm_test_pick_cm=
dline_named  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [11:07:13] [PASSED] NTSC
> [11:07:13] [PASSED] NTSC-J
> [11:07:13] [PASSED] PAL
> [11:07:13] [PASSED] PAL-M
> [11:07:13] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D [PASSED] drm_test_pick_cmdli=
ne_named =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [11:07:13] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D [PASSED] drm_test_p=
ick_cmdline =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [11:07:13] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D drm_bud=
dy (6 subtests) =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [11:07:13] [PASSED] drm_test_buddy_alloc_limit
> [11:07:13] [PASSED] drm_test_buddy_alloc_optimistic
> [11:07:13] [PASSED] drm_test_buddy_alloc_pessimistic
> [11:07:13] [PASSED] drm_test_buddy_alloc_pathological
> [11:07:13] [PASSED] drm_test_buddy_alloc_contiguous
> [11:07:13] [PASSED] drm_test_buddy_alloc_range_bias
> [11:07:13] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D [=
PASSED] drm_buddy =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> [11:07:13] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D drm_cmdline_parser (40=
 subtests) =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [11:07:13] [PASSED] drm_test_cmdline_force_d_only
> [11:07:13] [PASSED] drm_test_cmdline_force_D_only_dvi
> [11:07:13] [PASSED] drm_test_cmdline_force_D_only_hdmi
> [11:07:13] [PASSED] drm_test_cmdline_force_D_only_not_digital
> [11:07:13] [PASSED] drm_test_cmdline_force_e_only
> [11:07:13] [PASSED] drm_test_cmdline_res
> [11:07:13] [PASSED] drm_test_cmdline_res_vesa
> [11:07:13] [PASSED] drm_test_cmdline_res_vesa_rblank
> [11:07:13] [PASSED] drm_test_cmdline_res_rblank
> [11:07:13] [PASSED] drm_test_cmdline_res_bpp
> [11:07:13] [PASSED] drm_test_cmdline_res_refresh
> [11:07:13] [PASSED] drm_test_cmdline_res_bpp_refresh
> [11:07:13] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
> [11:07:13] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
> [11:07:13] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
> [11:07:13] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
> [11:07:13] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
> [11:07:13] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
> [11:07:13] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_f=
orce_on
> [11:07:13] [PASSED] drm_test_cmdline_res_margins_force_on
> [11:07:13] [PASSED] drm_test_cmdline_res_vesa_margins
> [11:07:13] [PASSED] drm_test_cmdline_name
> [11:07:13] [PASSED] drm_test_cmdline_name_bpp
> [11:07:13] [PASSED] drm_test_cmdline_name_option
> [11:07:13] [PASSED] drm_test_cmdline_name_bpp_option
> [11:07:13] [PASSED] drm_test_cmdline_rotate_0
> [11:07:13] [PASSED] drm_test_cmdline_rotate_90
> [11:07:13] [PASSED] drm_test_cmdline_rotate_180
> [11:07:13] [PASSED] drm_test_cmdline_rotate_270
> [11:07:13] [PASSED] drm_test_cmdline_hmirror
> [11:07:13] [PASSED] drm_test_cmdline_vmirror
> [11:07:13] [PASSED] drm_test_cmdline_margin_options
> [11:07:13] [PASSED] drm_test_cmdline_multiple_options
> [11:07:13] [PASSED] drm_test_cmdline_bpp_extra_and_option
> [11:07:13] [PASSED] drm_test_cmdline_extra_and_option
> [11:07:13] [PASSED] drm_test_cmdline_freestanding_options
> [11:07:13] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
> [11:07:13] [PASSED] drm_test_cmdline_panel_orientation
> [11:07:13] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D drm_test_cmdl=
ine_invalid  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [11:07:13] [PASSED] margin_only
> [11:07:13] [PASSED] interlace_only
> [11:07:13] [PASSED] res_missing_x
> [11:07:13] [PASSED] res_missing_y
> [11:07:13] [PASSED] res_bad_y
> [11:07:13] [PASSED] res_missing_y_bpp
> [11:07:13] [PASSED] res_bad_bpp
> [11:07:13] [PASSED] res_bad_refresh
> [11:07:13] [PASSED] res_bpp_refresh_force_on_off
> [11:07:13] [PASSED] res_invalid_mode
> [11:07:13] [PASSED] res_bpp_wrong_place_mode
> [11:07:13] [PASSED] name_bpp_refresh
> [11:07:13] [PASSED] name_refresh
> [11:07:13] [PASSED] name_refresh_wrong_mode
> [11:07:13] [PASSED] name_refresh_invalid_mode
> [11:07:13] [PASSED] rotate_multiple
> [11:07:13] [PASSED] rotate_invalid_val
> [11:07:13] [PASSED] rotate_truncated
> [11:07:13] [PASSED] invalid_option
> [11:07:13] [PASSED] invalid_tv_option
> [11:07:13] [PASSED] truncated_tv_option
> [11:07:13] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D [PASSED] drm_test_cmdline=
_invalid =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [11:07:13] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D drm_test_cmdline=
_tv_options  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [11:07:13] [PASSED] NTSC
> [11:07:13] [PASSED] NTSC_443
> [11:07:13] [PASSED] NTSC_J
> [11:07:13] [PASSED] PAL
> [11:07:13] [PASSED] PAL_M
> [11:07:13] [PASSED] PAL_N
> [11:07:13] [PASSED] SECAM
> [11:07:13] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D [PASSED] drm_test_cmdline_tv=
_options =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [11:07:13] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D [PASSED] drm_cmd=
line_parser =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [11:07:13] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D drmm_connector_init (3=
 subtests) =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [11:07:13] [PASSED] drm_test_drmm_connector_init
> [11:07:13] [PASSED] drm_test_drmm_connector_init_null_ddc
> [11:07:13] =3D=3D=3D=3D=3D=3D=3D=3D=3D drm_test_drmm_connector_init_type_=
valid  =3D=3D=3D=3D=3D=3D=3D=3D=3D
> [11:07:13] [PASSED] Unknown
> [11:07:13] [PASSED] VGA
> [11:07:13] [PASSED] DVI-I
> [11:07:13] [PASSED] DVI-D
> [11:07:13] [PASSED] DVI-A
> [11:07:13] [PASSED] Composite
> [11:07:13] [PASSED] SVIDEO
> [11:07:13] [PASSED] LVDS
> [11:07:13] [PASSED] Component
> [11:07:13] [PASSED] DIN
> [11:07:13] [PASSED] DP
> [11:07:13] [PASSED] HDMI-A
> [11:07:13] [PASSED] HDMI-B
> [11:07:13] [PASSED] TV
> [11:07:13] [PASSED] eDP
> [11:07:13] [PASSED] Virtual
> [11:07:13] [PASSED] DSI
> [11:07:13] [PASSED] DPI
> [11:07:13] [PASSED] Writeback
> [11:07:13] [PASSED] SPI
> [11:07:13] [PASSED] USB
> [11:07:13] =3D=3D=3D=3D=3D [PASSED] drm_test_drmm_connector_init_type_val=
id =3D=3D=3D=3D=3D
> [11:07:13] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D [PASSED] drmm_co=
nnector_init =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [11:07:13] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D drm_get_tv_mode_from_name (2 su=
btests) =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [11:07:13] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D drm_test_get_tv_mode_from_name_=
valid  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [11:07:13] [PASSED] NTSC
> [11:07:13] [PASSED] NTSC-443
> [11:07:13] [PASSED] NTSC-J
> [11:07:13] [PASSED] PAL
> [11:07:13] [PASSED] PAL-M
> [11:07:13] [PASSED] PAL-N
> [11:07:13] [PASSED] SECAM
> [11:07:13] =3D=3D=3D=3D=3D=3D [PASSED] drm_test_get_tv_mode_from_name_val=
id =3D=3D=3D=3D=3D=3D=3D
> [11:07:13] [PASSED] drm_test_get_tv_mode_from_name_truncated
> [11:07:13] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D [PASSED] drm_get_tv_mode_=
from_name =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [11:07:13] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D drm_damage_helper (21 =
subtests) =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [11:07:13] [PASSED] drm_test_damage_iter_no_damage
> [11:07:13] [PASSED] drm_test_damage_iter_no_damage_fractional_src
> [11:07:13] [PASSED] drm_test_damage_iter_no_damage_src_moved
> [11:07:13] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
> [11:07:13] [PASSED] drm_test_damage_iter_no_damage_not_visible
> [11:07:13] [PASSED] drm_test_damage_iter_no_damage_no_crtc
> [11:07:13] [PASSED] drm_test_damage_iter_no_damage_no_fb
> [11:07:13] [PASSED] drm_test_damage_iter_simple_damage
> [11:07:13] [PASSED] drm_test_damage_iter_single_damage
> [11:07:13] [PASSED] drm_test_damage_iter_single_damage_intersect_src
> [11:07:13] [PASSED] drm_test_damage_iter_single_damage_outside_src
> [11:07:13] [PASSED] drm_test_damage_iter_single_damage_fractional_src
> [11:07:13] [PASSED] drm_test_damage_iter_single_damage_intersect_fraction=
al_src
> [11:07:13] [PASSED] drm_test_damage_iter_single_damage_outside_fractional=
_src
> [11:07:13] [PASSED] drm_test_damage_iter_single_damage_src_moved
> [11:07:13] [PASSED] drm_test_damage_iter_single_damage_fractional_src_mov=
ed
> [11:07:13] [PASSED] drm_test_damage_iter_damage
> [11:07:13] [PASSED] drm_test_damage_iter_damage_one_intersect
> [11:07:13] [PASSED] drm_test_damage_iter_damage_one_outside
> [11:07:13] [PASSED] drm_test_damage_iter_damage_src_moved
> [11:07:13] [PASSED] drm_test_damage_iter_damage_not_visible
> [11:07:13] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D [PASSED] drm_=
damage_helper =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [11:07:13] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D drm_dp_mst_helper (=
3 subtests) =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [11:07:13] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D drm_test_dp_mst_cal=
c_pbn_mode  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [11:07:13] [PASSED] Clock 154000 BPP 30 DSC disabled
> [11:07:13] [PASSED] Clock 234000 BPP 30 DSC disabled
> [11:07:13] [PASSED] Clock 297000 BPP 24 DSC disabled
> [11:07:13] [PASSED] Clock 332880 BPP 24 DSC enabled
> [11:07:13] [PASSED] Clock 324540 BPP 24 DSC enabled
> [11:07:13] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D [PASSED] drm_test_dp_mst_calc_p=
bn_mode =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [11:07:13] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D drm_test_dp_mst_cal=
c_pbn_div  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [11:07:13] [PASSED] Link rate 2000000 lane count 4
> [11:07:13] [PASSED] Link rate 2000000 lane count 2
> [11:07:13] [PASSED] Link rate 2000000 lane count 1
> [11:07:13] [PASSED] Link rate 1350000 lane count 4
> [11:07:13] [PASSED] Link rate 1350000 lane count 2
> [11:07:13] [PASSED] Link rate 1350000 lane count 1
> [11:07:13] [PASSED] Link rate 1000000 lane count 4
> [11:07:13] [PASSED] Link rate 1000000 lane count 2
> [11:07:13] [PASSED] Link rate 1000000 lane count 1
> [11:07:13] [PASSED] Link rate 810000 lane count 4
> [11:07:13] [PASSED] Link rate 810000 lane count 2
> [11:07:13] [PASSED] Link rate 810000 lane count 1
> [11:07:13] [PASSED] Link rate 540000 lane count 4
> [11:07:13] [PASSED] Link rate 540000 lane count 2
> [11:07:13] [PASSED] Link rate 540000 lane count 1
> [11:07:13] [PASSED] Link rate 270000 lane count 4
> [11:07:13] [PASSED] Link rate 270000 lane count 2
> [11:07:13] [PASSED] Link rate 270000 lane count 1
> [11:07:13] [PASSED] Link rate 162000 lane count 4
> [11:07:13] [PASSED] Link rate 162000 lane count 2
> [11:07:13] [PASSED] Link rate 162000 lane count 1
> [11:07:13] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D [PASSED] drm_test_dp_mst_calc_p=
bn_div =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [11:07:13] =3D=3D=3D=3D=3D=3D=3D=3D=3D drm_test_dp_mst_sideband_msg_req_d=
ecode  =3D=3D=3D=3D=3D=3D=3D=3D=3D
> [11:07:13] [PASSED] DP_ENUM_PATH_RESOURCES with port number
> [11:07:13] [PASSED] DP_POWER_UP_PHY with port number
> [11:07:13] [PASSED] DP_POWER_DOWN_PHY with port number
> [11:07:13] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
> [11:07:13] [PASSED] DP_ALLOCATE_PAYLOAD with port number
> [11:07:13] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
> [11:07:13] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
> [11:07:13] [PASSED] DP_QUERY_PAYLOAD with port number
> [11:07:13] [PASSED] DP_QUERY_PAYLOAD with VCPI
> [11:07:13] [PASSED] DP_REMOTE_DPCD_READ with port number
> [11:07:13] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
> [11:07:13] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
> [11:07:13] [PASSED] DP_REMOTE_DPCD_WRITE with port number
> [11:07:13] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
> [11:07:13] [PASSED] DP_REMOTE_DPCD_WRITE with data array
> [11:07:13] [PASSED] DP_REMOTE_I2C_READ with port number
> [11:07:13] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
> [11:07:13] [PASSED] DP_REMOTE_I2C_READ with transactions array
> [11:07:13] [PASSED] DP_REMOTE_I2C_WRITE with port number
> [11:07:13] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
> [11:07:13] [PASSED] DP_REMOTE_I2C_WRITE with data array
> [11:07:13] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
> [11:07:13] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
> [11:07:13] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
> [11:07:13] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
> [11:07:13] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
> [11:07:13] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavi=
or
> [11:07:13] =3D=3D=3D=3D=3D [PASSED] drm_test_dp_mst_sideband_msg_req_deco=
de =3D=3D=3D=3D=3D
> [11:07:13] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D [PASSED] drm_=
dp_mst_helper =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [11:07:13] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D drm_exe=
c (7 subtests) =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [11:07:13] [PASSED] sanitycheck
> [11:07:13] [PASSED] test_lock
> [11:07:13] [PASSED] test_lock_unlock
> [11:07:13] [PASSED] test_duplicates
> [11:07:13] [PASSED] test_prepare
> [11:07:13] [PASSED] test_prepare_array
> [11:07:13] [PASSED] test_multiple_loops
> [11:07:13] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D [=
PASSED] drm_exec =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> [11:07:13] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D drm_format_helper_test (17 s=
ubtests) =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [11:07:13] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D drm_test_fb_xrgb888=
8_to_gray8  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [11:07:13] [PASSED] single_pixel_source_buffer
> [11:07:13] [PASSED] single_pixel_clip_rectangle
> [11:07:13] [PASSED] well_known_colors
> [11:07:13] [PASSED] destination_pitch
> [11:07:13] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D [PASSED] drm_test_fb_xrgb8888_t=
o_gray8 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [11:07:13] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D drm_test_fb_xrgb8888_t=
o_rgb332  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [11:07:13] [PASSED] single_pixel_source_buffer
> [11:07:13] [PASSED] single_pixel_clip_rectangle
> [11:07:13] [PASSED] well_known_colors
> [11:07:13] [PASSED] destination_pitch
> [11:07:13] =3D=3D=3D=3D=3D=3D=3D=3D=3D [PASSED] drm_test_fb_xrgb8888_to_r=
gb332 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [11:07:13] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D drm_test_fb_xrgb8888_t=
o_rgb565  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [11:07:13] [PASSED] single_pixel_source_buffer
> [11:07:13] [PASSED] single_pixel_clip_rectangle
> [11:07:13] [PASSED] well_known_colors
> [11:07:13] [PASSED] destination_pitch
> [11:07:13] =3D=3D=3D=3D=3D=3D=3D=3D=3D [PASSED] drm_test_fb_xrgb8888_to_r=
gb565 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [11:07:13] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D drm_test_fb_xrgb8888_to_x=
rgb1555  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [11:07:13] [PASSED] single_pixel_source_buffer
> [11:07:13] [PASSED] single_pixel_clip_rectangle
> [11:07:13] [PASSED] well_known_colors
> [11:07:13] [PASSED] destination_pitch
> [11:07:13] =3D=3D=3D=3D=3D=3D=3D=3D [PASSED] drm_test_fb_xrgb8888_to_xrgb=
1555 =3D=3D=3D=3D=3D=3D=3D=3D=3D
> [11:07:13] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D drm_test_fb_xrgb8888_to_a=
rgb1555  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [11:07:13] [PASSED] single_pixel_source_buffer
> [11:07:13] [PASSED] single_pixel_clip_rectangle
> [11:07:13] [PASSED] well_known_colors
> [11:07:13] [PASSED] destination_pitch
> [11:07:13] =3D=3D=3D=3D=3D=3D=3D=3D [PASSED] drm_test_fb_xrgb8888_to_argb=
1555 =3D=3D=3D=3D=3D=3D=3D=3D=3D
> [11:07:13] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D drm_test_fb_xrgb8888_to_r=
gba5551  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [11:07:13] [PASSED] single_pixel_source_buffer
> [11:07:13] [PASSED] single_pixel_clip_rectangle
> [11:07:13] [PASSED] well_known_colors
> [11:07:13] [PASSED] destination_pitch
> [11:07:13] =3D=3D=3D=3D=3D=3D=3D=3D [PASSED] drm_test_fb_xrgb8888_to_rgba=
5551 =3D=3D=3D=3D=3D=3D=3D=3D=3D
> [11:07:13] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D drm_test_fb_xrgb8888_t=
o_rgb888  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [11:07:13] [PASSED] single_pixel_source_buffer
> [11:07:13] [PASSED] single_pixel_clip_rectangle
> [11:07:13] [PASSED] well_known_colors
> [11:07:13] [PASSED] destination_pitch
> [11:07:13] =3D=3D=3D=3D=3D=3D=3D=3D=3D [PASSED] drm_test_fb_xrgb8888_to_r=
gb888 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [11:07:13] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D drm_test_fb_xrgb8888_to_a=
rgb8888  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [11:07:13] [PASSED] single_pixel_source_buffer
> [11:07:13] [PASSED] single_pixel_clip_rectangle
> [11:07:13] [PASSED] well_known_colors
> [11:07:13] [PASSED] destination_pitch
> [11:07:13] =3D=3D=3D=3D=3D=3D=3D=3D [PASSED] drm_test_fb_xrgb8888_to_argb=
8888 =3D=3D=3D=3D=3D=3D=3D=3D=3D
> [11:07:13] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D drm_test_fb_xrgb8888_to_xrgb=
2101010  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [11:07:13] [PASSED] single_pixel_source_buffer
> [11:07:13] [PASSED] single_pixel_clip_rectangle
> [11:07:13] [PASSED] well_known_colors
> [11:07:13] [PASSED] destination_pitch
> [11:07:13] =3D=3D=3D=3D=3D=3D=3D [PASSED] drm_test_fb_xrgb8888_to_xrgb210=
1010 =3D=3D=3D=3D=3D=3D=3D
> [11:07:13] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D drm_test_fb_xrgb8888_to_argb=
2101010  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [11:07:13] [PASSED] single_pixel_source_buffer
> [11:07:13] [PASSED] single_pixel_clip_rectangle
> [11:07:13] [PASSED] well_known_colors
> [11:07:13] [PASSED] destination_pitch
> [11:07:13] =3D=3D=3D=3D=3D=3D=3D [PASSED] drm_test_fb_xrgb8888_to_argb210=
1010 =3D=3D=3D=3D=3D=3D=3D
> [11:07:13] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D drm_test_fb_xrgb888=
8_to_mono  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [11:07:13] [PASSED] single_pixel_source_buffer
> [11:07:13] [PASSED] single_pixel_clip_rectangle
> [11:07:13] [PASSED] well_known_colors
> [11:07:13] [PASSED] destination_pitch
> [11:07:13] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D [PASSED] drm_test_fb_xrgb8888_t=
o_mono =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [11:07:13] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D d=
rm_test_fb_swab  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> [11:07:13] [PASSED] single_pixel_source_buffer
> [11:07:13] [PASSED] single_pixel_clip_rectangle
> [11:07:13] [PASSED] well_known_colors
> [11:07:13] [PASSED] destination_pitch
> [11:07:13] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D [PASSED] drm_=
test_fb_swab =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [11:07:13] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D drm_test_fb_xrgb8888_to_x=
bgr8888  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [11:07:13] [PASSED] single_pixel_source_buffer
> [11:07:13] [PASSED] single_pixel_clip_rectangle
> [11:07:13] [PASSED] well_known_colors
> [11:07:13] [PASSED] destination_pitch
> [11:07:13] =3D=3D=3D=3D=3D=3D=3D=3D [PASSED] drm_test_fb_xrgb8888_to_xbgr=
8888 =3D=3D=3D=3D=3D=3D=3D=3D=3D
> [11:07:13] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D drm_test_fb_xrgb8888_to_a=
bgr8888  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [11:07:13] [PASSED] single_pixel_source_buffer
> [11:07:13] [PASSED] single_pixel_clip_rectangle
> [11:07:13] [PASSED] well_known_colors
> [11:07:13] [PASSED] destination_pitch
> [11:07:13] =3D=3D=3D=3D=3D=3D=3D=3D [PASSED] drm_test_fb_xrgb8888_to_abgr=
8888 =3D=3D=3D=3D=3D=3D=3D=3D=3D
> [11:07:13] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D drm_test_f=
b_clip_offset  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [11:07:13] [PASSED] pass through
> [11:07:13] [PASSED] horizontal offset
> [11:07:13] [PASSED] vertical offset
> [11:07:13] [PASSED] horizontal and vertical offset
> [11:07:13] [PASSED] horizontal offset (custom pitch)
> [11:07:13] [PASSED] vertical offset (custom pitch)
> [11:07:13] [PASSED] horizontal and vertical offset (custom pitch)
> [11:07:13] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D [PASSED] drm_test_fb_c=
lip_offset =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [11:07:13] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D drm_test_fb_build_f=
ourcc_list  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [11:07:13] [PASSED] no native formats
> [11:07:13] [PASSED] XRGB8888 as native format
> [11:07:13] [PASSED] remove duplicates
> [11:07:13] [PASSED] convert alpha formats
> [11:07:13] [PASSED] random formats
> [11:07:13] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D [PASSED] drm_test_fb_build_four=
cc_list =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [11:07:13] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D drm_=
test_fb_memcpy  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [11:07:13] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x343=
25258)
> [11:07:13] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x384=
15258)
> [11:07:13] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x343=
25559)
> [11:07:13] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34=
324258)
> [11:07:13] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38=
415258)
> [11:07:13] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34=
325559)
> [11:07:13] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
> [11:07:13] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
> [11:07:13] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
> [11:07:13] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
> [11:07:13] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
> [11:07:13] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
> [11:07:13] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D [PASSED] drm_tes=
t_fb_memcpy =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [11:07:13] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D [PASSED] drm_format_he=
lper_test =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [11:07:13] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D drm_format=
 (18 subtests) =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [11:07:13] [PASSED] drm_test_format_block_width_invalid
> [11:07:13] [PASSED] drm_test_format_block_width_one_plane
> [11:07:13] [PASSED] drm_test_format_block_width_two_plane
> [11:07:13] [PASSED] drm_test_format_block_width_three_plane
> [11:07:13] [PASSED] drm_test_format_block_width_tiled
> [11:07:13] [PASSED] drm_test_format_block_height_invalid
> [11:07:13] [PASSED] drm_test_format_block_height_one_plane
> [11:07:13] [PASSED] drm_test_format_block_height_two_plane
> [11:07:13] [PASSED] drm_test_format_block_height_three_plane
> [11:07:13] [PASSED] drm_test_format_block_height_tiled
> [11:07:13] [PASSED] drm_test_format_min_pitch_invalid
> [11:07:13] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
> [11:07:13] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
> [11:07:13] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
> [11:07:13] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
> [11:07:13] [PASSED] drm_test_format_min_pitch_two_plane
> [11:07:13] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
> [11:07:13] [PASSED] drm_test_format_min_pitch_tiled
> [11:07:13] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D [PAS=
SED] drm_format =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [11:07:13] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D drm_framebuffer =
(1 subtest) =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [11:07:13] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D drm_test_framebu=
ffer_create  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [11:07:13] [PASSED] ABGR8888 normal sizes
> [11:07:13] [PASSED] ABGR8888 max sizes
> [11:07:13] [PASSED] ABGR8888 pitch greater than min required
> [11:07:13] [PASSED] ABGR8888 pitch less than min required
> [11:07:13] [PASSED] ABGR8888 Invalid width
> [11:07:13] [PASSED] ABGR8888 Invalid buffer handle
> [11:07:13] [PASSED] No pixel format
> [11:07:13] [PASSED] ABGR8888 Width 0
> [11:07:13] [PASSED] ABGR8888 Height 0
> [11:07:13] [PASSED] ABGR8888 Out of bound height * pitch combination
> [11:07:13] [PASSED] ABGR8888 Large buffer offset
> [11:07:13] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
> [11:07:13] [PASSED] ABGR8888 Valid buffer modifier
> [11:07:13] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSU=
NG_64_32_TILE)
> [11:07:13] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
> [11:07:13] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
> [11:07:13] [PASSED] NV12 Normal sizes
> [11:07:13] [PASSED] NV12 Max sizes
> [11:07:13] [PASSED] NV12 Invalid pitch
> [11:07:13] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS f=
lag
> [11:07:13] [PASSED] NV12 different  modifier per-plane
> [11:07:13] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
> [11:07:13] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
> [11:07:13] [PASSED] NV12 Modifier for inexistent plane
> [11:07:13] [PASSED] NV12 Handle for inexistent plane
> [11:07:13] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_=
MODIFIERS
> [11:07:13] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
> [11:07:13] [PASSED] YVU420 Normal sizes
> [11:07:13] [PASSED] YVU420 Max sizes
> [11:07:13] [PASSED] YVU420 Invalid pitch
> [11:07:13] [PASSED] YVU420 Different pitches
> [11:07:13] [PASSED] YVU420 Different buffer offsets/pitches
> [11:07:13] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MOD=
E_FB_MODIFIERS
> [11:07:13] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM=
_MODE_FB_MODIFIERS
> [11:07:13] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MOD=
E_FB_MODIFIERS
> [11:07:13] [PASSED] YVU420 Valid modifier
> [11:07:13] [PASSED] YVU420 Different modifiers per plane
> [11:07:13] [PASSED] YVU420 Modifier for inexistent plane
> [11:07:13] [PASSED] X0L2 Normal sizes
> [11:07:13] [PASSED] X0L2 Max sizes
> [11:07:13] [PASSED] X0L2 Invalid pitch
> [11:07:13] [PASSED] X0L2 Pitch greater than minimum required
> [11:07:13] [PASSED] X0L2 Handle for inexistent plane
> [11:07:13] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB=
_MODIFIERS set
> [11:07:13] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
> [11:07:13] [PASSED] X0L2 Valid modifier
> [11:07:13] [PASSED] X0L2 Modifier for inexistent plane
> [11:07:13] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D [PASSED] drm_test_framebuffe=
r_create =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [11:07:13] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D [PASSED] d=
rm_framebuffer =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [11:07:13] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D drm_gem_shmem=
 (8 subtests) =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [11:07:13] [PASSED] drm_gem_shmem_test_obj_create
> [11:07:13] [PASSED] drm_gem_shmem_test_obj_create_private
> [11:07:13] [PASSED] drm_gem_shmem_test_pin_pages
> [11:07:13] [PASSED] drm_gem_shmem_test_vmap
> [11:07:13] [PASSED] drm_gem_shmem_test_get_pages_sgt
> [11:07:13] [PASSED] drm_gem_shmem_test_get_sg_table
> [11:07:13] [PASSED] drm_gem_shmem_test_madvise
> [11:07:13] [PASSED] drm_gem_shmem_test_purge
> [11:07:13] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D [PASSED=
] drm_gem_shmem =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [11:07:13] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D drm_manage=
d (2 subtests) =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [11:07:13] [PASSED] drm_test_managed_release_action
> [11:07:13] [PASSED] drm_test_managed_run_action
> stty: 'standard input': Inappropriate ioctl for device
> [11:07:13] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D [PAS=
SED] drm_managed =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [11:07:13] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D drm_=
mm (6 subtests) =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [11:07:13] [PASSED] drm_test_mm_init
> [11:07:13] [PASSED] drm_test_mm_debug
> [11:07:13] [PASSED] drm_test_mm_align32
> [11:07:13] [PASSED] drm_test_mm_align64
> [11:07:13] [PASSED] drm_test_mm_lowest
> [11:07:13] [PASSED] drm_test_mm_highest
> [11:07:13] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D [PASSED] drm_mm =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
> [11:07:13] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D drm_modes_analog_tv (4=
 subtests) =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [11:07:13] [PASSED] drm_test_modes_analog_tv_ntsc_480i
> [11:07:13] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
> [11:07:13] [PASSED] drm_test_modes_analog_tv_pal_576i
> [11:07:13] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
> [11:07:13] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D [PASSED] drm_mod=
es_analog_tv =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [11:07:13] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D drm_plane_helper (2=
 subtests) =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [11:07:13] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D drm_test_check_p=
lane_state  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [11:07:13] [PASSED] clipping_simple
> [11:07:13] [PASSED] clipping_rotate_reflect
> [11:07:13] [PASSED] positioning_simple
> [11:07:13] [PASSED] upscaling
> [11:07:13] [PASSED] downscaling
> [11:07:13] [PASSED] rounding1
> [11:07:13] [PASSED] rounding2
> [11:07:13] [PASSED] rounding3
> [11:07:13] [PASSED] rounding4
> [11:07:13] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D [PASSED] drm_test_check_plan=
e_state =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [11:07:13] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D drm_test_check_invalid_plane=
_state  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [11:07:13] [PASSED] positioning_invalid
> [11:07:13] [PASSED] upscaling_invalid
> [11:07:13] [PASSED] downscaling_invalid
> [11:07:13] =3D=3D=3D=3D=3D=3D=3D [PASSED] drm_test_check_invalid_plane_st=
ate =3D=3D=3D=3D=3D=3D=3D=3D
> [11:07:13] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D [PASSED] drm_=
plane_helper =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [11:07:13] =3D=3D=3D=3D=3D=3D drm_connector_helper_tv_get_modes (1 subtes=
t) =3D=3D=3D=3D=3D=3D=3D
> [11:07:13] =3D=3D=3D=3D=3D=3D drm_test_connector_helper_tv_get_modes_chec=
k  =3D=3D=3D=3D=3D=3D=3D
> [11:07:13] [PASSED] None
> [11:07:13] [PASSED] PAL
> [11:07:13] [PASSED] NTSC
> [11:07:13] [PASSED] Both, NTSC Default
> [11:07:13] [PASSED] Both, PAL Default
> [11:07:13] [PASSED] Both, NTSC Default, with PAL on command-line
> [11:07:13] [PASSED] Both, PAL Default, with NTSC on command-line
> [11:07:13] =3D=3D [PASSED] drm_test_connector_helper_tv_get_modes_check =
=3D=3D=3D
> [11:07:13] =3D=3D=3D=3D=3D=3D=3D=3D [PASSED] drm_connector_helper_tv_get_=
modes =3D=3D=3D=3D=3D=3D=3D=3D
> [11:07:13] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D drm_rec=
t (9 subtests) =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [11:07:13] [PASSED] drm_test_rect_clip_scaled_div_by_zero
> [11:07:13] [PASSED] drm_test_rect_clip_scaled_not_clipped
> [11:07:13] [PASSED] drm_test_rect_clip_scaled_clipped
> [11:07:13] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
> [11:07:13] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D drm_test_r=
ect_intersect  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [11:07:13] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
> [11:07:13] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
> [11:07:13] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
> [11:07:13] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
> [11:07:13] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
> [11:07:13] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
> [11:07:13] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
> [11:07:13] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
> [11:07:13] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
> [11:07:13] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
> [11:07:13] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
> [11:07:13] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
> [11:07:13] [PASSED] far away: 1x1+0+0 x 1x1+3+6
> [11:07:13] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
> [11:07:13] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
> [11:07:13] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D [PASSED] drm_test_rect=
_intersect =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [11:07:13] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D drm_test_rect=
_calc_hscale  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [11:07:13] [PASSED] normal use
> [11:07:13] [PASSED] out of max range
> [11:07:13] [PASSED] out of min range
> [11:07:13] [PASSED] zero dst
> [11:07:13] [PASSED] negative src
> [11:07:13] [PASSED] negative dst
> [11:07:13] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D [PASSED] drm_test_rect_ca=
lc_hscale =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [11:07:13] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D drm_test_rect=
_calc_vscale  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [11:07:13] [PASSED] normal use
> [11:07:13] [PASSED] out of max range
> [11:07:13] [PASSED] out of min range
> [11:07:13] [PASSED] zero dst
> [11:07:13] [PASSED] negative src
> [11:07:13] [PASSED] negative dst
> [11:07:13] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D [PASSED] drm_test_rect_ca=
lc_vscale =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [11:07:13] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D drm_tes=
t_rect_rotate  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [11:07:13] [PASSED] reflect-x
> [11:07:13] [PASSED] reflect-y
> [11:07:13] [PASSED] rotate-0
> [11:07:13] [PASSED] rotate-90
> [11:07:13] [PASSED] rotate-180
> [11:07:13] [PASSED] rotate-270
> [11:07:13] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D [PASSED] drm_test_r=
ect_rotate =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [11:07:13] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D drm_test_rect=
_rotate_inv  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [11:07:13] [PASSED] reflect-x
> [11:07:13] [PASSED] reflect-y
> [11:07:13] [PASSED] rotate-0
> [11:07:13] [PASSED] rotate-90
> [11:07:13] [PASSED] rotate-180
> [11:07:13] [PASSED] rotate-270
> [11:07:13] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D [PASSED] drm_test_rect_ro=
tate_inv =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [11:07:13] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D [=
PASSED] drm_rect =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> [11:07:13] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [11:07:13] Testing complete. Ran 416 tests: passed: 416
> [11:07:13] Elapsed time: 21.747s total, 1.663s configuring, 19.904s build=
ing, 0.176s running
>
> + cleanup
> ++ stat -c %u:%g /kernel
> + chown -R 1003:1003 /kernel
>
>

--=20
Jani Nikula, Intel
