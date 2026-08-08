Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 543EEC5AD55
	for <intel-xe@archiver.kernel.org>; Sat,  8 Aug 2026 16:23:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE24210E087;
	Sat,  8 Aug 2026 16:23:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="aMZFmQ2C";
	dkim-atps=neutral
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com
 [209.85.160.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0569210E0D2
 for <intel-xe@lists.freedesktop.org>; Sat,  8 Aug 2026 07:42:25 +0000 (UTC)
Received: by mail-qt1-f174.google.com with SMTP id
 d75a77b69052e-51c08df8513so1745361cf.3
 for <intel-xe@lists.freedesktop.org>; Sat, 08 Aug 2026 00:42:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786174945; cv=none;
 d=google.com; s=arc-20260327;
 b=JaftoL3Eg+I0Ju3aTTFVCSYfIJ/jh6Db1YO2aGxxNseG0lEyYj+p4YCm/xijWcU+MD
 +czz0srN+phAX2PcDsPEQW9vCDwPNuVyHLy5XEP07wsokLI/r6IcKzOrtVbUEupfD3w5
 wT9FJm2cHnmaGV1+/bXPL9u5DO5cyPLMlHD4uYhOsuhSge+3zTQyIHGadLTvQ/njlcQx
 /iCdPnb2q8hrOcibPjpCMErPM1DZ49wPoAucEkildE56j0RIaGg8FQ9Zj0w8K776s4A+
 BJPa7CyK1a0u0Sgq8mN38Ld0T+YvMW+DzhZvBPQ913+oS+J2AdThF+ClxwbaC4KXVJwp
 dVRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=5Gkck+vTHD3nkHS7yKHtwvQweawZmFWofg11wrmS+aA=;
 fh=nSICiLSMf6dfHPXbijDAA8GhC5E1D3/eOgLUcQOuVIQ=;
 b=fdHtbdZhUxR/Cqj7KMrpiddHM3F9VKT1UWuJ792sfUQ16LMHuJkVWMNZg7lhZvqmgh
 wc995Q3a+lOM+7O+zLK68ruXG057uw771ROh9oWzUPrtrKbTT5b0G+E5HFKXOOwje9Qc
 aJcnwbx0nJq6gyFKLAR8ZPhSuHrIl5y+Z5YpH3ied0Lsl32yHMolB58Tq1jAn6ULquEf
 djDv4uNVUkZ0xB1lrAB9Zih5YDE3vW4okM9hZ6S3KEfvoYY5jPLlCWeX0AkDwCQS8e27
 Mo5GcxB4IFRZzubtPy3zXjTUxBw6XXp2vnFV9YvzDNKpmyM9FvTQ2FQchKM8b60JJID7
 ykFw==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1786174945; x=1786779745; darn=lists.freedesktop.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=5Gkck+vTHD3nkHS7yKHtwvQweawZmFWofg11wrmS+aA=;
 b=aMZFmQ2CuoJfD1pC6l4rszJ554SnYyyiMu91d/O5g3nmIkYjwcVKsyqTkHHA+Vel/V
 2WVvgtwZ/9EkE3ruurlAQErkGN+2Kj9/drZTH46fEjWSBIfQtr3a7BAV9UOyfLahglj9
 516JFepXgkDmV5XHaXZYYKbesBqYc+yteTFUo63n0UZGjluShTsM72ZfszwpZDGPn9zG
 8KP+lgqR/yKlePkhUo4GX/d0WbgRhtN1LADnguOQ5HZ2GVBuiQuIWXJPhYeZy/e0+5e6
 ft57NfpnG6pEHZ+Uhb92GCn7wN39cTx6MyCz7mjZeW++txAER5RHgsqr6S9yvoy/lvJA
 cOeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786174945; x=1786779745;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=5Gkck+vTHD3nkHS7yKHtwvQweawZmFWofg11wrmS+aA=;
 b=JGke/4AFtmQpXp4ooI9E2UeiuAmfR2LruC8vb99wqWQIBeLkTKHvCsfgps1mTLXmpD
 eMX4xAHRzwf+lSpNH2kzfurmBxAqibpVG1vCeTzVjQHBHkfFI8MTj38y4dxYwWYIIvNc
 kllSuP3bi6IvkcBQi6WWgquHGcd3PdxNceGO/ZjvkhyAlfGRHL+Khlp699rgMVsGnuhV
 hxeGYtq/jGshPAfNMValm31ZIx28RRb2OV75KucSHH/wLl6E3syx7vqVDHf98QxTLT+y
 DvxnkXjye5eebohOSE8ZFAJNS6lzLVjR0MU7jl18pWpC8ENOZ1dz9GD6wZfbdE5vE7jW
 L8sw==
X-Gm-Message-State: AOJu0YwAfAQ8bxpyPh9b2RVe5fq7vo8FoAtqKjVlvAioa20qebgguQZR
 P4QNmdOlc774inm9Sebeze0CldOd5Vv7fyzYHwqtwuKYe1CqMISL94edtAobQCZBJZXp6uzjtRl
 uXAZYwhjaMCdJOdG5RgEDkZdETnqFPic=
X-Gm-Gg: AR+sD13f1MNa2F4TIPr2UhgOS7G7DSjey0MzQtqM55b9git2j34YxAtES5UZJyzONR9
 BQylcn52YqDXW4nOpgZTHQBwEkd9gQL1YM6uuE6BzYCeM2QnVXpY2yQHUny1m/9ACwc9s3VRBt0
 QOnfwvcdr1KK4ZVZTdNkYosloMOOnc8OrFz49YkdiUM+ai1rLDcoDYmooBAg5RP1j4xKHvQ2hdv
 bUxtZpSvfkEfS2mj4UWkTkQGxVwiZwvSHB9Z4dstcEFQ/31Ee/M+uXIZxQMzaEn00cqU3Zs+zg0
 YhxpKK1ZrJOys+P1BXaYl/DgYLtKozTc/UjBKkUb2Ho=
X-Received: by 2002:a05:622a:588d:b0:528:3882:386a with SMTP id
 d75a77b69052e-52d18e6e5b9mr105188701cf.11.1786174944583; Sat, 08 Aug 2026
 00:42:24 -0700 (PDT)
MIME-Version: 1.0
References: <CAE6rXOutQNoLB59ethSrkpg=6Npo274YfPhvnhhibevr29rWrg@mail.gmail.com>
 <1eea561c0ef3b641bc7e079ba59e43b882770d09.camel@intel.com>
In-Reply-To: <1eea561c0ef3b641bc7e079ba59e43b882770d09.camel@intel.com>
From: Orestis Palampougioukis <opalharmonyco@gmail.com>
Date: Sat, 8 Aug 2026 10:42:13 +0300
X-Gm-Features: AUfX_myNLvcvr3xaAyyGoLNa4tfto3rUq6NXGmr1fClkoMQoIQgHO5lliqzpBG4
Message-ID: <CAE6rXOtz2zs0-EYbsoM-KrhvZ-1K5OzeSandhYxYy37rSX8faw@mail.gmail.com>
Subject: =?UTF-8?Q?Re=3A_xe=3A_GT0_GuC_scheduler_wedge_on_Meteor_Lake_=287d55?=
 =?UTF-8?Q?=29_=E2=80=94_=22Schedule_disable_failed_to_respond=22=2C_recovers_or_hard?=
 =?UTF-8?Q?=2Dlocks_nondeterministically?=
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, 
 "Brost, Matthew" <matthew.brost@intel.com>, 
 "thomas.hellstrom@linux.intel.com" <thomas.hellstrom@linux.intel.com>
Content-Type: multipart/alternative; boundary="0000000000001421fb06588443f4"
X-Mailman-Approved-At: Sat, 08 Aug 2026 16:23:30 +0000
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

--0000000000001421fb06588443f4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, 2026-08-05 at 23:03 +0000, Vivi, Rodrigo wrote:
> Yes, please send it to gitlab following
> https://drm.pages.freedesktop.org/intel-docs/how-to-file-i915-bugs.html

Filed: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/8870

Two things changed since the original post, both in the issue:

The matched GuC does not fix it. The post asked whether running 70.53.0
against a driver requesting 70.44.1 could affect the scheduler path, and
said we were about to soak the matched build. We did, and it has since
wedged twice on 70.44.1 - 2026-08-06 05:38 and 2026-08-08 09:37 - with a
byte-identical fingerprint both times: same guc_id, same flags=3D0x0, same
systemd-logind. So the version mismatch is ruled out. The rate looks
somewhat lower on the matched build, but on a corpus where the identical
signature has survived 0.2 min and 305 min we are not claiming that as an
improvement.

Two more survival data points, 61.7 min and 33.9 min, both on the matched
build. The 08-06 one is the cleanest example of the nondeterminism we are
reporting: the devcoredump aged out on its normal ~1h TTL, systemd units
were still executing a minute after that, and then the log simply stops -
no shutdown target, no panic.

Attached to the issue: three per-boot kernel logs and the devcoredumps for
both matched-GuC wedges. The logs have one unrelated OOM event's process
table removed; the issue body says so and offers the unfiltered originals.

Not in that batch: a drm.debug=3D0xe capture. Every wedge so far was caught
under a normal cmdline. Those parameters are armed now, and the box
reproduces roughly once a day, so I will attach one to the issue as soon as
I have it - no need to ask.

Thanks for pointing me at the tracker, and apologies for the delay - I only
saw your reply today.

Orestis Palampougioukis

On Wed, Aug 5, 2026 at 11:03=E2=80=AFPM Vivi, Rodrigo <rodrigo.vivi@intel.c=
om>
wrote:

> On Tue, 2026-07-28 at 12:26 +0300, Orestis Palampougioukis wrote:
>
> Subject: drm/xe: MTL GT0 "Schedule disable failed to respond" wedge,
> sometimes fatal
>
> Hi,
>
> Reporting an xe GT0 wedge on Meteor Lake that we have been tracking on
> one machine for about four weeks. Happy to move this to the GitLab
> tracker if you prefer;
>
>
> Yes, please send it to gitlab following
>
> https://drm.pages.freedesktop.org/intel-docs/how-to-file-i915-bugs.html
>
>  sending here first since it needs no account.
>
>
>
> But this email had been lost in the freedesktop spam filter... I just
> noticed in my
> inbox...
>
>
> A device coredump is available (349K gzipped) plus ten more from earlier
> instances. I have not attached it to a list post - say the word and I
> will send it directly or attach it to a tracker issue.
>
>
> SUMMARY
> -------
>
> The xe GT0 render queue wedges with
>
>   GT0: Schedule disable failed to respond, guc_id=3DN
>
> followed by a GT reset that reports "reset done" but does not restore a
> working GPU. Measured rate: one wedge per ~29 hours, 16 wedges across
> 31 boots and 466 hours of uptime.
>
> The part that seems worth reporting beyond "MTL GuC hangs": the same
> signature has two very different outcomes and we cannot predict which.
> Sometimes rendering dies but the kernel keeps running normally for
> hours; sometimes the machine hard-locks within seconds. Same kernel,
> same firmware, same guilty process, same guc_id.
>
>
> HARDWARE / SOFTWARE
> -------------------
>
>   Machine    Lenovo ThinkPad P16s Gen 3 (21KS000MGM)
>              BIOS R2DET38W 1.23
>   CPU        Intel Core Ultra 7 165H (Meteor Lake)
>   iGPU       8086:7d55 rev 08, subsystem 17aa:50ea
>              GT0 main IP 12.71.4, GT1 media IP 13.0.8
>   Driver     xe, via i915.force_probe=3D!7d55 xe.force_probe=3D7d55
>   Kernel     6.17.0-35-generic, Ubuntu 24.04.4 LTS
>              also reproduces on 7.0.0-14-generic, at a higher rate
>   GuC        70.53.0 - note the driver asks for 70.44.1, see below
>   Mesa       25.2.8, libdrm 2.4.125
>   Session    native Wayland (GNOME/mutter), 3 displays all on card0
>   Note       fully muxless box; the discrete NVIDIA GPU has no display
>              connectors and its driver is blacklisted
>
>
> KERNEL LOG SIGNATURE
> --------------------
>
> The entire event, inside 11 ms:
>
>   xe 0000:00:02.0: [drm] GT0: Schedule disable failed to respond, guc_id=
=3D22
>   xe 0000:00:02.0: [drm] Xe device coredump has been created
>   xe 0000:00:02.0: [drm] GT0: trying reset from
> guc_exec_queue_timedout_job [xe]
>   xe 0000:00:02.0: [drm] GT0: reset queued
>   xe 0000:00:02.0: [drm] GT0: reset started
>   xe 0000:00:02.0: [drm] GT0: reset done
>   xe 0000:00:02.0: [drm] GT0: Timedout job: seqno=3D3090483,
>       lrc_seqno=3D3090483, guc_id=3D22, flags=3D0x0 in systemd-logind [15=
07]
>
> Coredump header:
>
>   Reason: Schedule disable failed to respond, guc_id=3D22, ret=3D0, guc_r=
ead=3D0
>   kernel: 6.17.0-35-generic   module: xe
>   Process: systemd-logind [1507]
>   PCI ID: 0x7d55   PCI revision: 0x08
>   GuC firmware: i915/mtl_guc_70.bin
>   GuC version: 70.53.0 (wanted 70.44.1)
>
> Note ret=3D0, guc_read=3D0 - the GuC is not returning an error, it is not
> answering at all.
>
> There is a second, rarer shape on the same box which storms instead of
> firing once (e.g. 30 of each plus 21 reset cycles in one burst):
>
>   GT0: VM job timed out on non-killed execqueue
>   GT0: Timedout job: seqno=3DN, lrc_seqno=3DN, guc_id=3DN, flags=3D0x4 in
>       no process [-1]
>
> flags=3D0x4 and "in no process [-1]", versus flags=3D0x0 and a named
> process in the common shape. Unclear to us whether these are one bug
> or two.
>
>
> THE NONDETERMINISTIC OUTCOME - the main thing we are reporting
> -------------------------------------------------------------
>
> Measured as (last journal entry) minus (the GT wedge line), every wedge
> since 07-18:
>
>   date          xe-hang lines   survived after wedge
>   ------------  -------------   --------------------
>   07-18 20:22    179 (storm)        0.2 min
>   07-19 01:30      3                2.5 min
>   07-19 21:10      3              304.9 min
>   07-20 07:23      3              124.3 min
>   07-25 01:48      5               10.7 min
>   07-25 15:39      3               70.0 min
>   07-26 21:23   2449 (storm)        0.0 min
>   07-28 11:27      3                0.2 min
>
> In the long-survival cases the box is fully usable except that nothing
> renders: the journal keeps flowing, timers and cron keep firing, the
> devcoredump even ages out on its normal ~1h TTL. In the short cases
> everything stops. On 07-28 the last log line is 15 s after the wedge,
> and a 30-second systemd timer that fired at 11:27:31 never fired again.
>
> Three orders of magnitude of variation on an identical fingerprint. We
> could not find a covariate. Ruled out on our corpus:
>
>   - not the hang-line count: a 3-line wedge produced both 0.2 min and
>     304.9 min
>   - not thermal: the fatal boot peaked at 310k package-throttle events,
>     while boots that survived 14.8h and 53.1h peaked at 1.25M and 959k
>   - not memory: 62 GB RAM, ~46 GB available, zero swap used, no OOM
>     anywhere
>   - not CPU: no MCE / machine-check / panic in any boot, pstore empty
>     every time
>   - not the client: see below
>
>
> THE GUILTY CONTEXT IS systemd-logind IN 8 OF 8 WEDGES
> -----------------------------------------------------
>
> systemd-logind is named in the "Timedout job" line of every wedge we
> have full logs for. Chrome appeared in early instances and was the
> obvious suspect, but we have run Chrome fully GPU-starved
> (--disable-gpu --disable-gpu-compositing, VA-API decode off) since
> 2026-07-09 and the wedges continued at the same rate with Chrome absent
> from the guilty list entirely. Xwayland appears in some storms as an
> additional owner.
>
> We read logind as an always-present session client rather than a
> culprit, but it is the one constant, and it is a light client - which is
> why "heavy GPU load causes this" never fit our data.
>
>
> FIRMWARE VERSION - possible relevance
> -------------------------------------
>
> The coredump reports:
>
>   GuC version: 70.53.0 (wanted 70.44.1)
>
> We are running a GuC nine minor versions ahead of what this driver
> requests. That was not deliberate - we were fixing a too-old-GuC
> warning and took the newest blob on the linux-firmware branch. We are
> about to soak the matched 70.44.1 build. If a driver/GuC mismatch in
> this direction is known to affect the scheduler path, that would be
> useful to know before we spend days on the soak.
>
>
> WHY xe AND NOT i915
> -------------------
>
> MAINTAINERS scopes the i915 entry to "Meteor Lake, DG2 and older" and
> the xe entry to "Lunar Lake and newer", so at first glance an MTL report
> belongs to i915. We think the code boundary is the right one here: this
> machine runs xe on MTL (the distro default cmdline is
> i915.force_probe=3D!7d55 xe.force_probe=3D7d55), the wedge is in
> drivers/gpu/drm/xe/xe_guc_submit.c, and that path is covered by the xe
> entry's F: glob with no platform qualifier. If MTL-on-xe is out of
> scope, please say so and we will refile - but the config is what Ubuntu
> 24.04 ships by default, so it is not exotic.
>
>
> PRIOR ART WE CHECKED - why we do not think this is a duplicate
> -------------------------------------------------------------
>
> drm/i915#14469 tracks Meteor Lake GuC hangs attributed to the GuC
> failing to respond when the GPU wakes from RC6, with the signature
> "GT0: GUC: TLB invalidation response timed out" plus "GPU HANG: ecode".
> Plausibly the same underlying behaviour, but:
>
>   - it is filed against i915; we are on xe, and xe has no
>     enable_rc6-style parameter (37 module parameters, none for RC6 or
>     GT idle), so its documented workarounds do not apply
>   - we have zero instances of that signature. Grepping every boot back
>     to 07-01 for "TLB invalidation response/fence timed out" returns 0
>     hits. Ours is exclusively "Schedule disable failed to respond" on
>     the exec-queue scheduler path
>   - the BIOS workaround suggested there ("disable IGFX RenderStandby")
>     is a Dasharo/coreboot option. This Lenovo firmware exposes 104
>     attributes via thinklmi and none is RenderStandby or any IGFX/RC6
>     toggle
>
> For what it is worth, RC6 is active here - the following reports
> name=3Dgt0-rc and idle_status=3Dgt-c6:
>
>   /sys/class/drm/card0/device/tile0/gt0/gtidle/
>
> So if #14469's RC6 mechanism generalises to xe, this box is exposed to
> it; we just cannot confirm it from our logs and cannot test the
> workaround.
>
>
> WHAT WE HAVE TRIED (all negative, listed so you can skip them)
> -------------------------------------------------------------
>
>   GuC 70.36.0 -> 70.53.0        wedges continued
>
>   kernel 6.17.0-35 -> 7.0.0-14  worse: 2 wedges in 13 min; reverted
>
>   fall back to i915             no driver binds at all on 6.17; falls
>                                 through to simpledrm, no acceleration
>                                 and no external displays
>
>   Chrome fully GPU-starved      wedges continued at the same rate;
>                                 Chrome left the guilty-context list
>                                 entirely
>
>   Chrome render onto the dGPU   GT still wedged, guilty context still
>   (PRIME offload, x11 ozone)    logind; abandoned for unrelated reasons
>
>
> WHAT WE CAN PROVIDE
> -------------------
>
>   - the 07-28 devcoredump, plus ten more from 07-20 to 07-26 (a udev
>     rule snapshots them before the ~1h TTL expires)
>   - full journalctl -k for any of the 31 boots
>   - we can run instrumented builds or debug parameters on request. This
>     box reproduces roughly once a day under normal desktop use.
>
> Thanks,
> Orestis Palampougioukis
>
>
>

--0000000000001421fb06588443f4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>Hi,<br><br>On Wed, 2026-08-05 at 23:=
03 +0000, Vivi, Rodrigo wrote:<br>&gt; Yes, please send it to gitlab follow=
ing<br>&gt; <a href=3D"https://drm.pages.freedesktop.org/intel-docs/how-to-=
file-i915-bugs.html">https://drm.pages.freedesktop.org/intel-docs/how-to-fi=
le-i915-bugs.html</a><br><br>Filed: <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/-/issues/8870">https://gitlab.freedesktop.org/drm/xe/kerne=
l/-/issues/8870</a><br><br>Two things changed since the original post, both=
 in the issue:<br><br>The matched GuC does not fix it. The post asked wheth=
er running 70.53.0<br>against a driver requesting 70.44.1 could affect the =
scheduler path, and<br>said we were about to soak the matched build. We did=
, and it has since<br>wedged twice on 70.44.1 - 2026-08-06 05:38 and 2026-0=
8-08 09:37 - with a<br>byte-identical fingerprint both times: same guc_id, =
same flags=3D0x0, same<br>systemd-logind. So the version mismatch is ruled =
out. The rate looks<br>somewhat lower on the matched build, but on a corpus=
 where the identical<br>signature has survived 0.2 min and 305 min we are n=
ot claiming that as an<br>improvement.<br><br>Two more survival data points=
, 61.7 min and 33.9 min, both on the matched<br>build. The 08-06 one is the=
 cleanest example of the nondeterminism we are<br>reporting: the devcoredum=
p aged out on its normal ~1h TTL, systemd units<br>were still executing a m=
inute after that, and then the log simply stops -<br>no shutdown target, no=
 panic.<br><br>Attached to the issue: three per-boot kernel logs and the de=
vcoredumps for<br>both matched-GuC wedges. The logs have one unrelated OOM =
event&#39;s process<br>table removed; the issue body says so and offers the=
 unfiltered originals.<br><br>Not in that batch: a drm.debug=3D0xe capture.=
 Every wedge so far was caught<br>under a normal cmdline. Those parameters =
are armed now, and the box<br>reproduces roughly once a day, so I will atta=
ch one to the issue as soon as<br>I have it - no need to ask.<br><br>Thanks=
 for pointing me at the tracker, and apologies for the delay - I only<br>sa=
w your reply today.<br><br>Orestis Palampougioukis</div></div><br><div clas=
s=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_att=
r">On Wed, Aug 5, 2026 at 11:03=E2=80=AFPM Vivi, Rodrigo &lt;<a href=3D"mai=
lto:rodrigo.vivi@intel.com">rodrigo.vivi@intel.com</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex"><div class=3D"msg-4531836=
001204146362">




<div>
<div>On Tue, 2026-07-28 at 12:26 +0300, Orestis Palampougioukis wrote:</div=
>
<blockquote type=3D"cite" style=3D"margin:0px 0px 0px 0.8ex;border-left:2px=
 solid rgb(114,159,207);padding-left:1ex">
<div dir=3D"ltr">
<div>Subject: drm/xe: MTL GT0 &quot;Schedule disable failed to respond&quot=
; wedge, sometimes fatal<br>
<br>
Hi,<br>
<br>
Reporting an xe GT0 wedge on Meteor Lake that we have been tracking on<br>
one machine for about four weeks. Happy to move this to the GitLab<br>
tracker if you prefer;</div>
</div>
</blockquote>
<div><br>
</div>
<div style=3D"color:rgb(0,0,0);font-family:&quot;Adwaita Sans&quot;;font-st=
yle:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;t=
ext-align:start;text-indent:0px;text-transform:none;white-space:normal;word=
-spacing:0px;text-decoration-line:none;text-decoration-style:solid">
Yes, please send it to gitlab following</div>
<div style=3D"color:rgb(0,0,0);font-family:&quot;Adwaita Sans&quot;;font-st=
yle:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;t=
ext-align:start;text-indent:0px;text-transform:none;white-space:normal;word=
-spacing:0px;text-decoration-line:none;text-decoration-style:solid">
<br>
</div>
<div style=3D"color:rgb(0,0,0);font-family:&quot;Adwaita Sans&quot;;font-st=
yle:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;t=
ext-align:start;text-indent:0px;text-transform:none;white-space:normal;word=
-spacing:0px;text-decoration-line:none;text-decoration-style:solid">
<a href=3D"https://drm.pages.freedesktop.org/intel-docs/how-to-file-i915-bu=
gs.html" style=3D"color:rgb(46,52,54)" target=3D"_blank">https://drm.pages.=
freedesktop.org/intel-docs/how-to-file-i915-bugs.html</a></div>
<div><br>
</div>
<blockquote type=3D"cite" style=3D"margin:0px 0px 0px 0.8ex;border-left:2px=
 solid rgb(114,159,207);padding-left:1ex">
<div dir=3D"ltr">
<div>=C2=A0sending here first since it needs no account.</div>
</div>
</blockquote>
<div><br>
</div>
<div><br>
</div>
<div>But this email had been lost in the freedesktop spam filter... I just =
noticed in my</div>
<div>inbox...</div>
<div><br>
</div>
<blockquote type=3D"cite" style=3D"margin:0px 0px 0px 0.8ex;border-left:2px=
 solid rgb(114,159,207);padding-left:1ex">
<div dir=3D"ltr">
<div><br>
A device coredump is available (349K gzipped) plus ten more from earlier<br=
>
instances. I have not attached it to a list post - say the word and I<br>
will send it directly or attach it to a tracker issue.<br>
<br>
<br>
SUMMARY<br>
-------<br>
<br>
The xe GT0 render queue wedges with<br>
<br>
=C2=A0 GT0: Schedule disable failed to respond, guc_id=3DN<br>
<br>
followed by a GT reset that reports &quot;reset done&quot; but does not res=
tore a<br>
working GPU. Measured rate: one wedge per ~29 hours, 16 wedges across<br>
31 boots and 466 hours of uptime.<br>
<br>
The part that seems worth reporting beyond &quot;MTL GuC hangs&quot;: the s=
ame<br>
signature has two very different outcomes and we cannot predict which.<br>
Sometimes rendering dies but the kernel keeps running normally for<br>
hours; sometimes the machine hard-locks within seconds. Same kernel,<br>
same firmware, same guilty process, same guc_id.<br>
<br>
<br>
HARDWARE / SOFTWARE<br>
-------------------<br>
<br>
=C2=A0 Machine =C2=A0 =C2=A0Lenovo ThinkPad P16s Gen 3 (21KS000MGM)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0BIOS R2DET38W 1.23<br>
=C2=A0 CPU =C2=A0 =C2=A0 =C2=A0 =C2=A0Intel Core Ultra 7 165H (Meteor Lake)=
<br>
=C2=A0 iGPU =C2=A0 =C2=A0 =C2=A0 8086:7d55 rev 08, subsystem 17aa:50ea<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GT0 main IP 12.71.4, GT1 me=
dia IP 13.0.8<br>
=C2=A0 Driver =C2=A0 =C2=A0 xe, via i915.force_probe=3D!7d55 xe.force_probe=
=3D7d55<br>
=C2=A0 Kernel =C2=A0 =C2=A0 6.17.0-35-generic, Ubuntu 24.04.4 LTS<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0also reproduces on 7.0.0-14=
-generic, at a higher rate<br>
=C2=A0 GuC =C2=A0 =C2=A0 =C2=A0 =C2=A070.53.0 - note the driver asks for 70=
.44.1, see below<br>
=C2=A0 Mesa =C2=A0 =C2=A0 =C2=A0 25.2.8, libdrm 2.4.125<br>
=C2=A0 Session =C2=A0 =C2=A0native Wayland (GNOME/mutter), 3 displays all o=
n card0<br>
=C2=A0 Note =C2=A0 =C2=A0 =C2=A0 fully muxless box; the discrete NVIDIA GPU=
 has no display<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0connectors and its driver i=
s blacklisted<br>
<br>
<br>
KERNEL LOG SIGNATURE<br>
--------------------<br>
<br>
The entire event, inside 11 ms:<br>
<br>
=C2=A0 xe 0000:00:02.0: [drm] GT0: Schedule disable failed to respond, guc_=
id=3D22<br>
=C2=A0 xe 0000:00:02.0: [drm] Xe device coredump has been created<br>
=C2=A0 xe 0000:00:02.0: [drm] GT0: trying reset from guc_exec_queue_timedou=
t_job [xe]<br>
=C2=A0 xe 0000:00:02.0: [drm] GT0: reset queued<br>
=C2=A0 xe 0000:00:02.0: [drm] GT0: reset started<br>
=C2=A0 xe 0000:00:02.0: [drm] GT0: reset done<br>
=C2=A0 xe 0000:00:02.0: [drm] GT0: Timedout job: seqno=3D3090483,<br>
=C2=A0 =C2=A0 =C2=A0 lrc_seqno=3D3090483, guc_id=3D22, flags=3D0x0 in syste=
md-logind [1507]<br>
<br>
Coredump header:<br>
<br>
=C2=A0 Reason: Schedule disable failed to respond, guc_id=3D22, ret=3D0, gu=
c_read=3D0<br>
=C2=A0 kernel: 6.17.0-35-generic =C2=A0 module: xe<br>
=C2=A0 Process: systemd-logind [1507]<br>
=C2=A0 PCI ID: 0x7d55 =C2=A0 PCI revision: 0x08<br>
=C2=A0 GuC firmware: i915/mtl_guc_70.bin<br>
=C2=A0 GuC version: 70.53.0 (wanted 70.44.1)<br>
<br>
Note ret=3D0, guc_read=3D0 - the GuC is not returning an error, it is not<b=
r>
answering at all.<br>
<br>
There is a second, rarer shape on the same box which storms instead of<br>
firing once (e.g. 30 of each plus 21 reset cycles in one burst):<br>
<br>
=C2=A0 GT0: VM job timed out on non-killed execqueue<br>
=C2=A0 GT0: Timedout job: seqno=3DN, lrc_seqno=3DN, guc_id=3DN, flags=3D0x4=
 in<br>
=C2=A0 =C2=A0 =C2=A0 no process [-1]<br>
<br>
flags=3D0x4 and &quot;in no process [-1]&quot;, versus flags=3D0x0 and a na=
med<br>
process in the common shape. Unclear to us whether these are one bug<br>
or two.<br>
<br>
<br>
THE NONDETERMINISTIC OUTCOME - the main thing we are reporting<br>
-------------------------------------------------------------<br>
<br>
Measured as (last journal entry) minus (the GT wedge line), every wedge<br>
since 07-18:<br>
<br>
=C2=A0 date =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0xe-hang lines =C2=A0 survived=
 after wedge<br>
=C2=A0 ------------ =C2=A0------------- =C2=A0 --------------------<br>
=C2=A0 07-18 20:22 =C2=A0 =C2=A0179 (storm) =C2=A0 =C2=A0 =C2=A0 =C2=A00.2 =
min<br>
=C2=A0 07-19 01:30 =C2=A0 =C2=A0 =C2=A03 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A02.5 min<br>
=C2=A0 07-19 21:10 =C2=A0 =C2=A0 =C2=A03 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0304.9 min<br>
=C2=A0 07-20 07:23 =C2=A0 =C2=A0 =C2=A03 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0124.3 min<br>
=C2=A0 07-25 01:48 =C2=A0 =C2=A0 =C2=A05 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 10.7 min<br>
=C2=A0 07-25 15:39 =C2=A0 =C2=A0 =C2=A03 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 70.0 min<br>
=C2=A0 07-26 21:23 =C2=A0 2449 (storm) =C2=A0 =C2=A0 =C2=A0 =C2=A00.0 min<b=
r>
=C2=A0 07-28 11:27 =C2=A0 =C2=A0 =C2=A03 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A00.2 min<br>
<br>
In the long-survival cases the box is fully usable except that nothing<br>
renders: the journal keeps flowing, timers and cron keep firing, the<br>
devcoredump even ages out on its normal ~1h TTL. In the short cases<br>
everything stops. On 07-28 the last log line is 15 s after the wedge,<br>
and a 30-second systemd timer that fired at 11:27:31 never fired again.<br>
<br>
Three orders of magnitude of variation on an identical fingerprint. We<br>
could not find a covariate. Ruled out on our corpus:<br>
<br>
=C2=A0 - not the hang-line count: a 3-line wedge produced both 0.2 min and<=
br>
=C2=A0 =C2=A0 304.9 min<br>
=C2=A0 - not thermal: the fatal boot peaked at 310k package-throttle events=
,<br>
=C2=A0 =C2=A0 while boots that survived 14.8h and 53.1h peaked at 1.25M and=
 959k<br>
=C2=A0 - not memory: 62 GB RAM, ~46 GB available, zero swap used, no OOM<br=
>
=C2=A0 =C2=A0 anywhere<br>
=C2=A0 - not CPU: no MCE / machine-check / panic in any boot, pstore empty<=
br>
=C2=A0 =C2=A0 every time<br>
=C2=A0 - not the client: see below<br>
<br>
<br>
THE GUILTY CONTEXT IS systemd-logind IN 8 OF 8 WEDGES<br>
-----------------------------------------------------<br>
<br>
systemd-logind is named in the &quot;Timedout job&quot; line of every wedge=
 we<br>
have full logs for. Chrome appeared in early instances and was the<br>
obvious suspect, but we have run Chrome fully GPU-starved<br>
(--disable-gpu --disable-gpu-compositing, VA-API decode off) since<br>
2026-07-09 and the wedges continued at the same rate with Chrome absent<br>
from the guilty list entirely. Xwayland appears in some storms as an<br>
additional owner.<br>
<br>
We read logind as an always-present session client rather than a<br>
culprit, but it is the one constant, and it is a light client - which is<br=
>
why &quot;heavy GPU load causes this&quot; never fit our data.<br>
<br>
<br>
FIRMWARE VERSION - possible relevance<br>
-------------------------------------<br>
<br>
The coredump reports:<br>
<br>
=C2=A0 GuC version: 70.53.0 (wanted 70.44.1)<br>
<br>
We are running a GuC nine minor versions ahead of what this driver<br>
requests. That was not deliberate - we were fixing a too-old-GuC<br>
warning and took the newest blob on the linux-firmware branch. We are<br>
about to soak the matched 70.44.1 build. If a driver/GuC mismatch in<br>
this direction is known to affect the scheduler path, that would be<br>
useful to know before we spend days on the soak.<br>
<br>
<br>
WHY xe AND NOT i915<br>
-------------------<br>
<br>
MAINTAINERS scopes the i915 entry to &quot;Meteor Lake, DG2 and older&quot;=
 and<br>
the xe entry to &quot;Lunar Lake and newer&quot;, so at first glance an MTL=
 report<br>
belongs to i915. We think the code boundary is the right one here: this<br>
machine runs xe on MTL (the distro default cmdline is<br>
i915.force_probe=3D!7d55 xe.force_probe=3D7d55), the wedge is in<br>
drivers/gpu/drm/xe/xe_guc_submit.c, and that path is covered by the xe<br>
entry&#39;s F: glob with no platform qualifier. If MTL-on-xe is out of<br>
scope, please say so and we will refile - but the config is what Ubuntu<br>
24.04 ships by default, so it is not exotic.<br>
<br>
<br>
PRIOR ART WE CHECKED - why we do not think this is a duplicate<br>
-------------------------------------------------------------<br>
<br>
drm/i915#14469 tracks Meteor Lake GuC hangs attributed to the GuC<br>
failing to respond when the GPU wakes from RC6, with the signature<br>
&quot;GT0: GUC: TLB invalidation response timed out&quot; plus &quot;GPU HA=
NG: ecode&quot;.<br>
Plausibly the same underlying behaviour, but:<br>
<br>
=C2=A0 - it is filed against i915; we are on xe, and xe has no<br>
=C2=A0 =C2=A0 enable_rc6-style parameter (37 module parameters, none for RC=
6 or<br>
=C2=A0 =C2=A0 GT idle), so its documented workarounds do not apply<br>
=C2=A0 - we have zero instances of that signature. Grepping every boot back=
<br>
=C2=A0 =C2=A0 to 07-01 for &quot;TLB invalidation response/fence timed out&=
quot; returns 0<br>
=C2=A0 =C2=A0 hits. Ours is exclusively &quot;Schedule disable failed to re=
spond&quot; on<br>
=C2=A0 =C2=A0 the exec-queue scheduler path<br>
=C2=A0 - the BIOS workaround suggested there (&quot;disable IGFX RenderStan=
dby&quot;)<br>
=C2=A0 =C2=A0 is a Dasharo/coreboot option. This Lenovo firmware exposes 10=
4<br>
=C2=A0 =C2=A0 attributes via thinklmi and none is RenderStandby or any IGFX=
/RC6<br>
=C2=A0 =C2=A0 toggle<br>
<br>
For what it is worth, RC6 is active here - the following reports<br>
name=3Dgt0-rc and idle_status=3Dgt-c6:<br>
<br>
=C2=A0 /sys/class/drm/card0/device/tile0/gt0/gtidle/<br>
<br>
So if #14469&#39;s RC6 mechanism generalises to xe, this box is exposed to<=
br>
it; we just cannot confirm it from our logs and cannot test the<br>
workaround.<br>
<br>
<br>
WHAT WE HAVE TRIED (all negative, listed so you can skip them)<br>
-------------------------------------------------------------<br>
<br>
=C2=A0 GuC 70.36.0 -&gt; 70.53.0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wedges continue=
d<br>
<br>
=C2=A0 kernel 6.17.0-35 -&gt; 7.0.0-14 =C2=A0worse: 2 wedges in 13 min; rev=
erted<br>
<br>
=C2=A0 fall back to i915 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 no drive=
r binds at all on 6.17; falls<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 through to simpledrm, no acceleratio=
n<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 and no external displays<br>
<br>
=C2=A0 Chrome fully GPU-starved =C2=A0 =C2=A0 =C2=A0wedges continued at the=
 same rate;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Chrome left the guilty-context list<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 entirely<br>
<br>
=C2=A0 Chrome render onto the dGPU =C2=A0 GT still wedged, guilty context s=
till<br>
=C2=A0 (PRIME offload, x11 ozone) =C2=A0 =C2=A0logind; abandoned for unrela=
ted reasons<br>
<br>
<br>
WHAT WE CAN PROVIDE<br>
-------------------<br>
<br>
=C2=A0 - the 07-28 devcoredump, plus ten more from 07-20 to 07-26 (a udev<b=
r>
=C2=A0 =C2=A0 rule snapshots them before the ~1h TTL expires)<br>
=C2=A0 - full journalctl -k for any of the 31 boots<br>
=C2=A0 - we can run instrumented builds or debug parameters on request. Thi=
s<br>
=C2=A0 =C2=A0 box reproduces roughly once a day under normal desktop use.<b=
r>
<br>
Thanks,<br>
Orestis Palampougioukis</div>
</div>
</blockquote>
<div><br>
</div>
<div><span></span></div>
</div>

</div></blockquote></div></div>

--0000000000001421fb06588443f4--
