Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFF1BC4345F
	for <intel-xe@archiver.kernel.org>; Sun, 28 Apr 2024 21:33:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47F4810E300;
	Sun, 28 Apr 2024 21:33:53 +0000 (UTC)
X-Greylist: delayed 468 seconds by postgrey-1.36 at gabe;
 Mon, 22 Apr 2024 20:43:19 UTC
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65F5F10F83C
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Apr 2024 20:43:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 3D434647A80D;
 Mon, 22 Apr 2024 22:35:29 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id hbLXo3DjthWs; Mon, 22 Apr 2024 22:35:28 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 8D197609B3C4;
 Mon, 22 Apr 2024 22:35:28 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id tQFA0JRDxHeL; Mon, 22 Apr 2024 22:35:28 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id 603A1647A80D;
 Mon, 22 Apr 2024 22:35:28 +0200 (CEST)
Date: Mon, 22 Apr 2024 22:35:28 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Jani Nikula <jani.nikula@intel.com>
Cc: Johannes Berg <johannes@sipsolutions.net>, 
 anton ivanov <anton.ivanov@cambridgegreys.com>, 
 linux-um <linux-um@lists.infradead.org>, intel-xe@lists.freedesktop.org, 
 Lucas De Marchi <lucas.demarchi@intel.com>, 
 Tiwei Bie <tiwei.btw@antgroup.com>
Message-ID: <1006521759.15130.1713818128220.JavaMail.zimbra@nod.at>
In-Reply-To: <87frx52btl.fsf@intel.com>
References: <87jzmh2chs.fsf@intel.com>
 <5d1dfb9fce5d7647ff3203080416eadc9806059a.camel@sipsolutions.net>
 <87frx52btl.fsf@intel.com>
Subject: Re: -Wmissing-prototypes warnings in user-mode linux
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Topic: -Wmissing-prototypes warnings in user-mode linux
Thread-Index: vZ6D8nAA6Q+6wg62ykN4hANATIV+4g==
X-Mailman-Approved-At: Sun, 28 Apr 2024 21:33:52 +0000
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

----- Urspr=C3=BCngliche Mail -----
> Von: "Jani Nikula" <jani.nikula@intel.com>
> An: "Johannes Berg" <johannes@sipsolutions.net>, "richard" <richard@nod.a=
t>, "anton ivanov"
>> I think this series addressed most already?
>>
>> https://patchwork.ozlabs.org/project/linux-um/list/?series=3D393619
>>
>> But I haven't checked myself yet.
>=20
> Oh, nice, it certainly helps!
>=20
> But after applying that in my branch, I do still get a bunch of
> warnings.

Exactly.

Tiwei Bie, with your v3 series[0] applied,
I still see the following build warnings:
arch/x86/um/signal.c:559:6: warning: no previous prototype for =E2=80=98sys=
_rt_sigreturn=E2=80=99 [-Wmissing-prototypes]
  559 | long sys_rt_sigreturn(void)
      |      ^~~~~~~~~~~~~~~~
arch/um/os-Linux/mem.c:28:6: warning: no previous prototype for =E2=80=98ka=
san_map_memory=E2=80=99 [-Wmissing-prototypes]
   28 | void kasan_map_memory(void *start, size_t len)
      |      ^~~~~~~~~~~~~~~~
arch/um/os-Linux/mem.c:212:13: warning: no previous prototype for =E2=80=98=
check_tmpexec=E2=80=99 [-Wmissing-prototypes]
  212 | void __init check_tmpexec(void)
      |             ^~~~~~~~~~~~~
arch/x86/um/os-Linux/registers.c:146:15: warning: no previous prototype for=
 =E2=80=98get_thread_reg=E2=80=99 [-Wmissing-prototypes]
  146 | unsigned long get_thread_reg(int reg, jmp_buf *buf)
      |               ^~~~~~~~~~~~~~
arch/um/os-Linux/skas/process.c:107:6: warning: no previous prototype for =
=E2=80=98wait_stub_done=E2=80=99 [-Wmissing-prototypes]
  107 | void wait_stub_done(int pid)
      |      ^~~~~~~~~~~~~~
arch/um/os-Linux/skas/process.c:683:6: warning: no previous prototype for =
=E2=80=98__switch_mm=E2=80=99 [-Wmissing-prototypes]
  683 | void __switch_mm(struct mm_id *mm_idp)
      |      ^~~~~~~~~~~
arch/x86/um/vdso/um_vdso.c:16:5: warning: no previous prototype for =E2=80=
=98__vdso_clock_gettime=E2=80=99 [-Wmissing-prototypes]
   16 | int __vdso_clock_gettime(clockid_t clock, struct __kernel_old_times=
pec *ts)
      |     ^~~~~~~~~~~~~~~~~~~~
arch/x86/um/vdso/um_vdso.c:30:5: warning: no previous prototype for =E2=80=
=98__vdso_gettimeofday=E2=80=99 [-Wmissing-prototypes]
   30 | int __vdso_gettimeofday(struct __kernel_old_timeval *tv, struct tim=
ezone *tz)
      |     ^~~~~~~~~~~~~~~~~~~
arch/x86/um/vdso/um_vdso.c:44:21: warning: no previous prototype for =E2=80=
=98__vdso_time=E2=80=99 [-Wmissing-prototypes]
   44 | __kernel_old_time_t __vdso_time(__kernel_old_time_t *t)
      |                     ^~~~~~~~~~~
arch/x86/um/vdso/um_vdso.c:57:1: warning: no previous prototype for =E2=80=
=98__vdso_getcpu=E2=80=99 [-Wmissing-prototypes]
   57 | __vdso_getcpu(unsigned *cpu, unsigned *node, struct getcpu_cache *u=
nused)
      | ^~~~~~~~~~~~~

[0] https://patchwork.ozlabs.org/project/linux-um/list/?series=3D397986

Thanks,
//richard
