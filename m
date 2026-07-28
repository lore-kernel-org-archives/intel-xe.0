Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40CE9C5516D
	for <intel-xe@archiver.kernel.org>; Thu, 30 Jul 2026 22:07:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1E4410F0C7;
	Thu, 30 Jul 2026 22:07:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="q1vHS6ZN";
	dkim-atps=neutral
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com
 [209.85.222.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60BBC10E845
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Jul 2026 09:26:40 +0000 (UTC)
Received: by mail-qk1-f169.google.com with SMTP id
 af79cd13be357-930c0f9c1b1so248695485a.1
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Jul 2026 02:26:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785230799; cv=none;
 d=google.com; s=arc-20260327;
 b=NgZGH2v1QB96Ha92CnzMl/GS5axTs/bV85Lru/Ua1aocqFzPEs4t+AH0bswIfLm3zM
 G9TGynfHRju2MikTGcE5ehx7oEtim2jioyOMpKNbK4IWtmynuU1vhI+C8c9wOXTXu2VX
 8mLawi6vVIACuJBVaDjU8XXLpjlEoEdA1wlnzvfKY6zZ7b0/wEthfX0ito/17BTm2oDl
 PCooOGcyK8KV+zmCz13EJvvNTDItbYrjSs6mdEn3iAalohbB0dm+Rj5sOI9Yt7HahgL+
 zTFx4a1yjKbiT9FNZ8RYKthHlohNo3xRT/7JqH8IwOfJYJhY1fJnLSK3pX3YBabohePE
 27MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
 bh=HkB6DreSOAo+9vKQiWdyygt+QTD1D++BYO8p9ru1EYk=;
 fh=mxTT9zC+mg/qKz5dmQNvhZpMxOYyA3Rw6pMMLmbV+yg=;
 b=ASyDnWsEYly0D7G+RmJFCUmf5H+I0Ja8qhK148za9ck4BFuhPVrm2W9x0wOIWbQKm5
 CkOHtmJJ/BuU/piRr+UmLcVcQtzwKaeWXjTuuKDyHAzlvvlWDcAycTr9LhwsIs4/aIUV
 ruGm0xkNOh7eOqVs6My2RBqLK2GtPYo4urSdpMO3H3haFzf2bwooaUL4wAz/p3N1DBDm
 wWZobMrUsSImxr+LJA6C1SCjNyk3tYEY9shjXrj5pWINZciKgUd3E0LMBZJGaakhQbB/
 TwdgIBukCIsCy4s/gQ+ZF/wOzt1ecl09m2muuQ+mzalRTOKSL2WpR6+H383s8hJELIZA
 wyyQ==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1785230799; x=1785835599; darn=lists.freedesktop.org;
 h=content-type:cc:to:subject:message-id:date:from:mime-version:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=HkB6DreSOAo+9vKQiWdyygt+QTD1D++BYO8p9ru1EYk=;
 b=q1vHS6ZNsFBsCpM3eKeKnTBN+l013PzGl+lchgacyqIdVA6JAoEgkqomyHaJt1i/kK
 y7QB+MPZMY+DlacS1p9KSk3D6aCawnQeXYu21eJTK/AFwl0k6h//Bi/Z2GXn7EO9eYrf
 5WwVeH3hnc51oqxZJeY8QPlsI3tgh0t42seM3e5yQLdw8JtFNythN1qdI9X+Q541Vm1r
 ZwAI55yuK4l2MIZnLcYHvJXknuIBjMDvWCwjx//Rr8RFoNUdZx1UVM600Z4YgiQPMHtB
 FaCcf/juVM6oC9WxYBSEbPVLJqyHuOPPdsX5jKeESAnTYWQsT+SQnGiTj1130zT9ZvKC
 SUNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785230799; x=1785835599;
 h=content-type:cc:to:subject:message-id:date:from:mime-version
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=HkB6DreSOAo+9vKQiWdyygt+QTD1D++BYO8p9ru1EYk=;
 b=au0JaoxpXBis/dA7dDstLozWTVoksogSZ1tD98sqdZNWFDTZU6ww2mmO8XtmWWAex3
 ER+PWws6f1d4HPNzB4aVMg4MFx3uZg86GVMfvjcNTbZ6DqFI9+qSXYUE8QyFPUjwWywh
 F7NcTQ1HtdRkBwU6csVOpsg5JKRKSZHBpVe+jNUL75kD4YlUfAJEXnmoO8qsuvULC6fG
 +SnafjizHxX9WJQuC7Py5R61Z6NtuTSqp7t1Qd1o6eJxGvR2/RdE2caoXDRsKnEFUsgv
 dp9RT5xP2edZ6vgHveXsppb4kxcFugHWNhHNmwXg01vanLqyVczuEpEo056ioCGJshRp
 2g3g==
X-Gm-Message-State: AOJu0YyiyBz27LcgUy4YjVj46Fin/rXc3nG4Ytlchuy9Rhbn+fDxGNFF
 I5CtNGDIpd5ndHmKlzQVNM1zTxw1vxAMMUb9FPo161cFrwpubJg0mqCHTHXU9X7Rttye3pHaxPZ
 a06SpSHF7SVsJkp6Fg0oibVGKRZk0vDJbCFv2oiCG0Q==
X-Gm-Gg: AR+sD13joEcoTiWo6G+opa/AxyoOVAukuFICSLOIKvsuugq8Sq97dS7xO+SXiAXiygA
 nhm6brr++adgoqRI2yRfM/wnOZc8vt3oKvoKQ33d3y70IbWDp0MRddbPXbo0NuVEcXkeSMX03tI
 +9/inbICd9wmAxY/c8qr72nnCgUm8bHkdH3kAxvCo3enbCk0a3/amEYABSQhHP8xXkggAWVeZAb
 zV/BzQIdnXh3JgH0g0j+PfpxXG8Eiqj0Y57LYTQOUMCtAKOgFTl5C76yjDY
X-Received: by 2002:a05:620a:468e:b0:930:ab28:9459 with SMTP id
 af79cd13be357-9330262103amr133139685a.56.1785230799089; Tue, 28 Jul 2026
 02:26:39 -0700 (PDT)
MIME-Version: 1.0
From: Orestis Palampougioukis <opalharmonyco@gmail.com>
Date: Tue, 28 Jul 2026 12:26:27 +0300
X-Gm-Features: AUfX_mw3fAxl7od81QDLiVS5aZ_S0GLJQEQlFA22_nuiNdBA3Xsx7KGt6Y88-LU
Message-ID: <CAE6rXOutQNoLB59ethSrkpg=6Npo274YfPhvnhhibevr29rWrg@mail.gmail.com>
Subject: =?UTF-8?Q?xe=3A_GT0_GuC_scheduler_wedge_on_Meteor_Lake_=287d55=29_?=
 =?UTF-8?Q?=E2=80=94_=22Schedule_disable_failed_to_respond=22=2C_recovers_or_hard=2Dl?=
 =?UTF-8?Q?ocks_nondeterministically?=
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com, 
 rodrigo.vivi@intel.com
Content-Type: multipart/alternative; boundary="0000000000009f325a0657a86f10"
X-Mailman-Approved-At: Thu, 30 Jul 2026 22:07:25 +0000
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

--0000000000009f325a0657a86f10
Content-Type: text/plain; charset="UTF-8"

Subject: drm/xe: MTL GT0 "Schedule disable failed to respond" wedge,
sometimes fatal

Hi,

Reporting an xe GT0 wedge on Meteor Lake that we have been tracking on
one machine for about four weeks. Happy to move this to the GitLab
tracker if you prefer; sending here first since it needs no account.

A device coredump is available (349K gzipped) plus ten more from earlier
instances. I have not attached it to a list post - say the word and I
will send it directly or attach it to a tracker issue.


SUMMARY
-------

The xe GT0 render queue wedges with

  GT0: Schedule disable failed to respond, guc_id=N

followed by a GT reset that reports "reset done" but does not restore a
working GPU. Measured rate: one wedge per ~29 hours, 16 wedges across
31 boots and 466 hours of uptime.

The part that seems worth reporting beyond "MTL GuC hangs": the same
signature has two very different outcomes and we cannot predict which.
Sometimes rendering dies but the kernel keeps running normally for
hours; sometimes the machine hard-locks within seconds. Same kernel,
same firmware, same guilty process, same guc_id.


HARDWARE / SOFTWARE
-------------------

  Machine    Lenovo ThinkPad P16s Gen 3 (21KS000MGM)
             BIOS R2DET38W 1.23
  CPU        Intel Core Ultra 7 165H (Meteor Lake)
  iGPU       8086:7d55 rev 08, subsystem 17aa:50ea
             GT0 main IP 12.71.4, GT1 media IP 13.0.8
  Driver     xe, via i915.force_probe=!7d55 xe.force_probe=7d55
  Kernel     6.17.0-35-generic, Ubuntu 24.04.4 LTS
             also reproduces on 7.0.0-14-generic, at a higher rate
  GuC        70.53.0 - note the driver asks for 70.44.1, see below
  Mesa       25.2.8, libdrm 2.4.125
  Session    native Wayland (GNOME/mutter), 3 displays all on card0
  Note       fully muxless box; the discrete NVIDIA GPU has no display
             connectors and its driver is blacklisted


KERNEL LOG SIGNATURE
--------------------

The entire event, inside 11 ms:

  xe 0000:00:02.0: [drm] GT0: Schedule disable failed to respond, guc_id=22
  xe 0000:00:02.0: [drm] Xe device coredump has been created
  xe 0000:00:02.0: [drm] GT0: trying reset from guc_exec_queue_timedout_job
[xe]
  xe 0000:00:02.0: [drm] GT0: reset queued
  xe 0000:00:02.0: [drm] GT0: reset started
  xe 0000:00:02.0: [drm] GT0: reset done
  xe 0000:00:02.0: [drm] GT0: Timedout job: seqno=3090483,
      lrc_seqno=3090483, guc_id=22, flags=0x0 in systemd-logind [1507]

Coredump header:

  Reason: Schedule disable failed to respond, guc_id=22, ret=0, guc_read=0
  kernel: 6.17.0-35-generic   module: xe
  Process: systemd-logind [1507]
  PCI ID: 0x7d55   PCI revision: 0x08
  GuC firmware: i915/mtl_guc_70.bin
  GuC version: 70.53.0 (wanted 70.44.1)

Note ret=0, guc_read=0 - the GuC is not returning an error, it is not
answering at all.

There is a second, rarer shape on the same box which storms instead of
firing once (e.g. 30 of each plus 21 reset cycles in one burst):

  GT0: VM job timed out on non-killed execqueue
  GT0: Timedout job: seqno=N, lrc_seqno=N, guc_id=N, flags=0x4 in
      no process [-1]

flags=0x4 and "in no process [-1]", versus flags=0x0 and a named
process in the common shape. Unclear to us whether these are one bug
or two.


THE NONDETERMINISTIC OUTCOME - the main thing we are reporting
-------------------------------------------------------------

Measured as (last journal entry) minus (the GT wedge line), every wedge
since 07-18:

  date          xe-hang lines   survived after wedge
  ------------  -------------   --------------------
  07-18 20:22    179 (storm)        0.2 min
  07-19 01:30      3                2.5 min
  07-19 21:10      3              304.9 min
  07-20 07:23      3              124.3 min
  07-25 01:48      5               10.7 min
  07-25 15:39      3               70.0 min
  07-26 21:23   2449 (storm)        0.0 min
  07-28 11:27      3                0.2 min

In the long-survival cases the box is fully usable except that nothing
renders: the journal keeps flowing, timers and cron keep firing, the
devcoredump even ages out on its normal ~1h TTL. In the short cases
everything stops. On 07-28 the last log line is 15 s after the wedge,
and a 30-second systemd timer that fired at 11:27:31 never fired again.

Three orders of magnitude of variation on an identical fingerprint. We
could not find a covariate. Ruled out on our corpus:

  - not the hang-line count: a 3-line wedge produced both 0.2 min and
    304.9 min
  - not thermal: the fatal boot peaked at 310k package-throttle events,
    while boots that survived 14.8h and 53.1h peaked at 1.25M and 959k
  - not memory: 62 GB RAM, ~46 GB available, zero swap used, no OOM
    anywhere
  - not CPU: no MCE / machine-check / panic in any boot, pstore empty
    every time
  - not the client: see below


THE GUILTY CONTEXT IS systemd-logind IN 8 OF 8 WEDGES
-----------------------------------------------------

systemd-logind is named in the "Timedout job" line of every wedge we
have full logs for. Chrome appeared in early instances and was the
obvious suspect, but we have run Chrome fully GPU-starved
(--disable-gpu --disable-gpu-compositing, VA-API decode off) since
2026-07-09 and the wedges continued at the same rate with Chrome absent
from the guilty list entirely. Xwayland appears in some storms as an
additional owner.

We read logind as an always-present session client rather than a
culprit, but it is the one constant, and it is a light client - which is
why "heavy GPU load causes this" never fit our data.


FIRMWARE VERSION - possible relevance
-------------------------------------

The coredump reports:

  GuC version: 70.53.0 (wanted 70.44.1)

We are running a GuC nine minor versions ahead of what this driver
requests. That was not deliberate - we were fixing a too-old-GuC
warning and took the newest blob on the linux-firmware branch. We are
about to soak the matched 70.44.1 build. If a driver/GuC mismatch in
this direction is known to affect the scheduler path, that would be
useful to know before we spend days on the soak.


WHY xe AND NOT i915
-------------------

MAINTAINERS scopes the i915 entry to "Meteor Lake, DG2 and older" and
the xe entry to "Lunar Lake and newer", so at first glance an MTL report
belongs to i915. We think the code boundary is the right one here: this
machine runs xe on MTL (the distro default cmdline is
i915.force_probe=!7d55 xe.force_probe=7d55), the wedge is in
drivers/gpu/drm/xe/xe_guc_submit.c, and that path is covered by the xe
entry's F: glob with no platform qualifier. If MTL-on-xe is out of
scope, please say so and we will refile - but the config is what Ubuntu
24.04 ships by default, so it is not exotic.


PRIOR ART WE CHECKED - why we do not think this is a duplicate
-------------------------------------------------------------

drm/i915#14469 tracks Meteor Lake GuC hangs attributed to the GuC
failing to respond when the GPU wakes from RC6, with the signature
"GT0: GUC: TLB invalidation response timed out" plus "GPU HANG: ecode".
Plausibly the same underlying behaviour, but:

  - it is filed against i915; we are on xe, and xe has no
    enable_rc6-style parameter (37 module parameters, none for RC6 or
    GT idle), so its documented workarounds do not apply
  - we have zero instances of that signature. Grepping every boot back
    to 07-01 for "TLB invalidation response/fence timed out" returns 0
    hits. Ours is exclusively "Schedule disable failed to respond" on
    the exec-queue scheduler path
  - the BIOS workaround suggested there ("disable IGFX RenderStandby")
    is a Dasharo/coreboot option. This Lenovo firmware exposes 104
    attributes via thinklmi and none is RenderStandby or any IGFX/RC6
    toggle

For what it is worth, RC6 is active here - the following reports
name=gt0-rc and idle_status=gt-c6:

  /sys/class/drm/card0/device/tile0/gt0/gtidle/

So if #14469's RC6 mechanism generalises to xe, this box is exposed to
it; we just cannot confirm it from our logs and cannot test the
workaround.


WHAT WE HAVE TRIED (all negative, listed so you can skip them)
-------------------------------------------------------------

  GuC 70.36.0 -> 70.53.0        wedges continued

  kernel 6.17.0-35 -> 7.0.0-14  worse: 2 wedges in 13 min; reverted

  fall back to i915             no driver binds at all on 6.17; falls
                                through to simpledrm, no acceleration
                                and no external displays

  Chrome fully GPU-starved      wedges continued at the same rate;
                                Chrome left the guilty-context list
                                entirely

  Chrome render onto the dGPU   GT still wedged, guilty context still
  (PRIME offload, x11 ozone)    logind; abandoned for unrelated reasons


WHAT WE CAN PROVIDE
-------------------

  - the 07-28 devcoredump, plus ten more from 07-20 to 07-26 (a udev
    rule snapshots them before the ~1h TTL expires)
  - full journalctl -k for any of the 31 boots
  - we can run instrumented builds or debug parameters on request. This
    box reproduces roughly once a day under normal desktop use.

Thanks,
Orestis Palampougioukis

--0000000000009f325a0657a86f10
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Subject: drm/xe: MTL GT0 &quot;Schedule disable faile=
d to respond&quot; wedge, sometimes fatal<br><br>Hi,<br><br>Reporting an xe=
 GT0 wedge on Meteor Lake that we have been tracking on<br>one machine for =
about four weeks. Happy to move this to the GitLab<br>tracker if you prefer=
; sending here first since it needs no account.<br><br>A device coredump is=
 available (349K gzipped) plus ten more from earlier<br>instances. I have n=
ot attached it to a list post - say the word and I<br>will send it directly=
 or attach it to a tracker issue.<br><br><br>SUMMARY<br>-------<br><br>The =
xe GT0 render queue wedges with<br><br>=C2=A0 GT0: Schedule disable failed =
to respond, guc_id=3DN<br><br>followed by a GT reset that reports &quot;res=
et done&quot; but does not restore a<br>working GPU. Measured rate: one wed=
ge per ~29 hours, 16 wedges across<br>31 boots and 466 hours of uptime.<br>=
<br>The part that seems worth reporting beyond &quot;MTL GuC hangs&quot;: t=
he same<br>signature has two very different outcomes and we cannot predict =
which.<br>Sometimes rendering dies but the kernel keeps running normally fo=
r<br>hours; sometimes the machine hard-locks within seconds. Same kernel,<b=
r>same firmware, same guilty process, same guc_id.<br><br><br>HARDWARE / SO=
FTWARE<br>-------------------<br><br>=C2=A0 Machine =C2=A0 =C2=A0Lenovo Thi=
nkPad P16s Gen 3 (21KS000MGM)<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0BIOS R2DET38W 1.23<br>=C2=A0 CPU =C2=A0 =C2=A0 =C2=A0 =C2=A0Intel Cor=
e Ultra 7 165H (Meteor Lake)<br>=C2=A0 iGPU =C2=A0 =C2=A0 =C2=A0 8086:7d55 =
rev 08, subsystem 17aa:50ea<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0GT0 main IP 12.71.4, GT1 media IP 13.0.8<br>=C2=A0 Driver =C2=A0 =C2=
=A0 xe, via i915.force_probe=3D!7d55 xe.force_probe=3D7d55<br>=C2=A0 Kernel=
 =C2=A0 =C2=A0 6.17.0-35-generic, Ubuntu 24.04.4 LTS<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0also reproduces on 7.0.0-14-generic, at a hi=
gher rate<br>=C2=A0 GuC =C2=A0 =C2=A0 =C2=A0 =C2=A070.53.0 - note the drive=
r asks for 70.44.1, see below<br>=C2=A0 Mesa =C2=A0 =C2=A0 =C2=A0 25.2.8, l=
ibdrm 2.4.125<br>=C2=A0 Session =C2=A0 =C2=A0native Wayland (GNOME/mutter),=
 3 displays all on card0<br>=C2=A0 Note =C2=A0 =C2=A0 =C2=A0 fully muxless =
box; the discrete NVIDIA GPU has no display<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0connectors and its driver is blacklisted<br><br><br>KER=
NEL LOG SIGNATURE<br>--------------------<br><br>The entire event, inside 1=
1 ms:<br><br>=C2=A0 xe 0000:00:02.0: [drm] GT0: Schedule disable failed to =
respond, guc_id=3D22<br>=C2=A0 xe 0000:00:02.0: [drm] Xe device coredump ha=
s been created<br>=C2=A0 xe 0000:00:02.0: [drm] GT0: trying reset from guc_=
exec_queue_timedout_job [xe]<br>=C2=A0 xe 0000:00:02.0: [drm] GT0: reset qu=
eued<br>=C2=A0 xe 0000:00:02.0: [drm] GT0: reset started<br>=C2=A0 xe 0000:=
00:02.0: [drm] GT0: reset done<br>=C2=A0 xe 0000:00:02.0: [drm] GT0: Timedo=
ut job: seqno=3D3090483,<br>=C2=A0 =C2=A0 =C2=A0 lrc_seqno=3D3090483, guc_i=
d=3D22, flags=3D0x0 in systemd-logind [1507]<br><br>Coredump header:<br><br=
>=C2=A0 Reason: Schedule disable failed to respond, guc_id=3D22, ret=3D0, g=
uc_read=3D0<br>=C2=A0 kernel: 6.17.0-35-generic =C2=A0 module: xe<br>=C2=A0=
 Process: systemd-logind [1507]<br>=C2=A0 PCI ID: 0x7d55 =C2=A0 PCI revisio=
n: 0x08<br>=C2=A0 GuC firmware: i915/mtl_guc_70.bin<br>=C2=A0 GuC version: =
70.53.0 (wanted 70.44.1)<br><br>Note ret=3D0, guc_read=3D0 - the GuC is not=
 returning an error, it is not<br>answering at all.<br><br>There is a secon=
d, rarer shape on the same box which storms instead of<br>firing once (e.g.=
 30 of each plus 21 reset cycles in one burst):<br><br>=C2=A0 GT0: VM job t=
imed out on non-killed execqueue<br>=C2=A0 GT0: Timedout job: seqno=3DN, lr=
c_seqno=3DN, guc_id=3DN, flags=3D0x4 in<br>=C2=A0 =C2=A0 =C2=A0 no process =
[-1]<br><br>flags=3D0x4 and &quot;in no process [-1]&quot;, versus flags=3D=
0x0 and a named<br>process in the common shape. Unclear to us whether these=
 are one bug<br>or two.<br><br><br>THE NONDETERMINISTIC OUTCOME - the main =
thing we are reporting<br>-------------------------------------------------=
------------<br><br>Measured as (last journal entry) minus (the GT wedge li=
ne), every wedge<br>since 07-18:<br><br>=C2=A0 date =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0xe-hang lines =C2=A0 survived after wedge<br>=C2=A0 ----------=
-- =C2=A0------------- =C2=A0 --------------------<br>=C2=A0 07-18 20:22 =
=C2=A0 =C2=A0179 (storm) =C2=A0 =C2=A0 =C2=A0 =C2=A00.2 min<br>=C2=A0 07-19=
 01:30 =C2=A0 =C2=A0 =C2=A03 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A02.5 min<br>=C2=A0 07-19 21:10 =C2=A0 =C2=A0 =C2=A03 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0304.9 min<br>=C2=A0 07-20 07:23 =C2=A0 =
=C2=A0 =C2=A03 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0124.3 min<br=
>=C2=A0 07-25 01:48 =C2=A0 =C2=A0 =C2=A05 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 10.7 min<br>=C2=A0 07-25 15:39 =C2=A0 =C2=A0 =C2=A03 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 70.0 min<br>=C2=A0 07-26 21:2=
3 =C2=A0 2449 (storm) =C2=A0 =C2=A0 =C2=A0 =C2=A00.0 min<br>=C2=A0 07-28 11=
:27 =C2=A0 =C2=A0 =C2=A03 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A00.2 min<br><br>In the long-survival cases the box is fully usable exc=
ept that nothing<br>renders: the journal keeps flowing, timers and cron kee=
p firing, the<br>devcoredump even ages out on its normal ~1h TTL. In the sh=
ort cases<br>everything stops. On 07-28 the last log line is 15 s after the=
 wedge,<br>and a 30-second systemd timer that fired at 11:27:31 never fired=
 again.<br><br>Three orders of magnitude of variation on an identical finge=
rprint. We<br>could not find a covariate. Ruled out on our corpus:<br><br>=
=C2=A0 - not the hang-line count: a 3-line wedge produced both 0.2 min and<=
br>=C2=A0 =C2=A0 304.9 min<br>=C2=A0 - not thermal: the fatal boot peaked a=
t 310k package-throttle events,<br>=C2=A0 =C2=A0 while boots that survived =
14.8h and 53.1h peaked at 1.25M and 959k<br>=C2=A0 - not memory: 62 GB RAM,=
 ~46 GB available, zero swap used, no OOM<br>=C2=A0 =C2=A0 anywhere<br>=C2=
=A0 - not CPU: no MCE / machine-check / panic in any boot, pstore empty<br>=
=C2=A0 =C2=A0 every time<br>=C2=A0 - not the client: see below<br><br><br>T=
HE GUILTY CONTEXT IS systemd-logind IN 8 OF 8 WEDGES<br>-------------------=
----------------------------------<br><br>systemd-logind is named in the &q=
uot;Timedout job&quot; line of every wedge we<br>have full logs for. Chrome=
 appeared in early instances and was the<br>obvious suspect, but we have ru=
n Chrome fully GPU-starved<br>(--disable-gpu --disable-gpu-compositing, VA-=
API decode off) since<br>2026-07-09 and the wedges continued at the same ra=
te with Chrome absent<br>from the guilty list entirely. Xwayland appears in=
 some storms as an<br>additional owner.<br><br>We read logind as an always-=
present session client rather than a<br>culprit, but it is the one constant=
, and it is a light client - which is<br>why &quot;heavy GPU load causes th=
is&quot; never fit our data.<br><br><br>FIRMWARE VERSION - possible relevan=
ce<br>-------------------------------------<br><br>The coredump reports:<br=
><br>=C2=A0 GuC version: 70.53.0 (wanted 70.44.1)<br><br>We are running a G=
uC nine minor versions ahead of what this driver<br>requests. That was not =
deliberate - we were fixing a too-old-GuC<br>warning and took the newest bl=
ob on the linux-firmware branch. We are<br>about to soak the matched 70.44.=
1 build. If a driver/GuC mismatch in<br>this direction is known to affect t=
he scheduler path, that would be<br>useful to know before we spend days on =
the soak.<br><br><br>WHY xe AND NOT i915<br>-------------------<br><br>MAIN=
TAINERS scopes the i915 entry to &quot;Meteor Lake, DG2 and older&quot; and=
<br>the xe entry to &quot;Lunar Lake and newer&quot;, so at first glance an=
 MTL report<br>belongs to i915. We think the code boundary is the right one=
 here: this<br>machine runs xe on MTL (the distro default cmdline is<br>i91=
5.force_probe=3D!7d55 xe.force_probe=3D7d55), the wedge is in<br>drivers/gp=
u/drm/xe/xe_guc_submit.c, and that path is covered by the xe<br>entry&#39;s=
 F: glob with no platform qualifier. If MTL-on-xe is out of<br>scope, pleas=
e say so and we will refile - but the config is what Ubuntu<br>24.04 ships =
by default, so it is not exotic.<br><br><br>PRIOR ART WE CHECKED - why we d=
o not think this is a duplicate<br>----------------------------------------=
---------------------<br><br>drm/i915#14469 tracks Meteor Lake GuC hangs at=
tributed to the GuC<br>failing to respond when the GPU wakes from RC6, with=
 the signature<br>&quot;GT0: GUC: TLB invalidation response timed out&quot;=
 plus &quot;GPU HANG: ecode&quot;.<br>Plausibly the same underlying behavio=
ur, but:<br><br>=C2=A0 - it is filed against i915; we are on xe, and xe has=
 no<br>=C2=A0 =C2=A0 enable_rc6-style parameter (37 module parameters, none=
 for RC6 or<br>=C2=A0 =C2=A0 GT idle), so its documented workarounds do not=
 apply<br>=C2=A0 - we have zero instances of that signature. Grepping every=
 boot back<br>=C2=A0 =C2=A0 to 07-01 for &quot;TLB invalidation response/fe=
nce timed out&quot; returns 0<br>=C2=A0 =C2=A0 hits. Ours is exclusively &q=
uot;Schedule disable failed to respond&quot; on<br>=C2=A0 =C2=A0 the exec-q=
ueue scheduler path<br>=C2=A0 - the BIOS workaround suggested there (&quot;=
disable IGFX RenderStandby&quot;)<br>=C2=A0 =C2=A0 is a Dasharo/coreboot op=
tion. This Lenovo firmware exposes 104<br>=C2=A0 =C2=A0 attributes via thin=
klmi and none is RenderStandby or any IGFX/RC6<br>=C2=A0 =C2=A0 toggle<br><=
br>For what it is worth, RC6 is active here - the following reports<br>name=
=3Dgt0-rc and idle_status=3Dgt-c6:<br><br>=C2=A0 /sys/class/drm/card0/devic=
e/tile0/gt0/gtidle/<br><br>So if #14469&#39;s RC6 mechanism generalises to =
xe, this box is exposed to<br>it; we just cannot confirm it from our logs a=
nd cannot test the<br>workaround.<br><br><br>WHAT WE HAVE TRIED (all negati=
ve, listed so you can skip them)<br>---------------------------------------=
----------------------<br><br>=C2=A0 GuC 70.36.0 -&gt; 70.53.0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0wedges continued<br><br>=C2=A0 kernel 6.17.0-35 -&gt; 7.0.=
0-14 =C2=A0worse: 2 wedges in 13 min; reverted<br><br>=C2=A0 fall back to i=
915 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 no driver binds at all on 6.1=
7; falls<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 through to simpledrm, no a=
cceleration<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 and no external displa=
ys<br><br>=C2=A0 Chrome fully GPU-starved =C2=A0 =C2=A0 =C2=A0wedges contin=
ued at the same rate;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Chrome left =
the guilty-context list<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 entirely<br=
><br>=C2=A0 Chrome render onto the dGPU =C2=A0 GT still wedged, guilty cont=
ext still<br>=C2=A0 (PRIME offload, x11 ozone) =C2=A0 =C2=A0logind; abandon=
ed for unrelated reasons<br><br><br>WHAT WE CAN PROVIDE<br>----------------=
---<br><br>=C2=A0 - the 07-28 devcoredump, plus ten more from 07-20 to 07-2=
6 (a udev<br>=C2=A0 =C2=A0 rule snapshots them before the ~1h TTL expires)<=
br>=C2=A0 - full journalctl -k for any of the 31 boots<br>=C2=A0 - we can r=
un instrumented builds or debug parameters on request. This<br>=C2=A0 =C2=
=A0 box reproduces roughly once a day under normal desktop use.<br><br>Than=
ks,<br>Orestis Palampougioukis</div></div>

--0000000000009f325a0657a86f10--
