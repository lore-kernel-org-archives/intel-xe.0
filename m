Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E666CA5FA5
	for <intel-xe@archiver.kernel.org>; Tue, 29 Sep 2026 12:54:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A557810E191;
	Tue, 29 Sep 2026 12:54:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HGkVbJuF";
	dkim-atps=neutral
Received: from mail-qv2-f41.google.com (mail-qv2-f41.google.com
 [74.125.230.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D336F10E54C
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Sep 2026 11:59:40 +0000 (UTC)
Received: by mail-qv2-f41.google.com with SMTP id
 6a1803df08f44-917912f0b95so2578776d6.3
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Sep 2026 04:59:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790683180; cv=none;
 d=google.com; s=arc-20260327;
 b=GxvWZ8EPatuctCAsi7rhsDXXh/c+AFV0Q4Re/kH+B8QjBBfDDH05bIOpVbQz7TO8RL
 AqaxPIIJH4ML0E8SvcXy3VLtiv2DUU3KhP9TCAf07pxh37EC0WXbHA2OjTgkJSoUIBGF
 ue/b8TMaW+WnMcd+Rv9LdZwOIRmwg/bAU1ChKDsFl/mnL+yXbAf8IjTsrCNmr4bGACZ2
 kneLhVu/PbSVSDuE8VHl1pDjS/aApK+qIfoYy5vHSIXSSoRqOzDqUurb46Vl6k3qqWB+
 4idTLv8Kv/huzm1uZwvJ/lAMTFVJa7b8CYx/IEAejlKQiS06L/Oqpg+1Aqs4sxyNSQxr
 ZW4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=Ah3iGvC79pGt1/+QIpkuBDtRtKgRUtRd9oQekkO3PYQ=;
 fh=aGYqXdsf0H+f55WZ7MSNi5PZAbJDtPQah8nf/0OFR0E=;
 b=MaNAc0oGTz37X+hl0gx6PT9eJzHwnYCrrEUTqRA6f2jHT4vl1zRPMABgnwihnGsZWW
 9oe03vwsTa+6BhD7hArXm/CFbUgj48fHr9ExE0ayHb8MmnJvg25SXNf3L8HSkK0zuPKP
 x5wttYJgSciF1IZIXKW0VWREQ3LJcXsxmwwDes44xMkj8Jsnuer19cVRgUn7ZFNEBRub
 ykutTk6K2G3LH2E3Ch38qgoGYh2xc+1P5OSttrdTYOda5QPH3Jxy5naAiaOsrWjeZtb+
 2B9pM+rJdaRDCVXI4O0euY/pUTPFGpt9IprTC7T8rdPSpYnh11LhOEsXAozyKZdt0frt
 rAMw==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790683180; x=1791287980; darn=lists.freedesktop.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=Ah3iGvC79pGt1/+QIpkuBDtRtKgRUtRd9oQekkO3PYQ=;
 b=HGkVbJuFDp1pq3uFeSSkX5zD8xy5vVVfdnNmRmJfQZM7yaszdLdh5XD1sU6Fr3QBbM
 Iu9lYn1XMAC3byrtfvS8adU8YXFaFpMJ3S6PdJqnB+xoDzmx/ogonEjlG7PDqmcvjX/B
 HA+G2PWQUuJ3kGYBvO/uc5JvtRC3P799doDMPybTnP5eVUD+LgV/U0ZjuuleNvBLysHB
 OcF9Y/GXrI83I3bP47nj+ga/HrPGm8Ovfa8kXlWeib+sZAV5x8mV0doX4glb3ut+t/xf
 GkOheUgoNkm6GMi9T8BW/8gBZgnK81RBoomTAMg+RdDeFtHLh66PoAsF275uBhPlPHl8
 8CKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790683180; x=1791287980;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=Ah3iGvC79pGt1/+QIpkuBDtRtKgRUtRd9oQekkO3PYQ=;
 b=FE2Bom5sFLWxAj4W69jwwqsq+4IUdZO468rEEbbQI44lJncr6ySI/Ql03AH+PyMVHT
 mLKpMNp1HnSvSt+1ScA/D1kSL+6RCNSk2UYhwdHGux6SI2ICdQb0KuLzLkMOdIY6KvxT
 TDSaXXhdOE/+MegmF2ia5m8hf/EDz57BtYgWtlIeOxnlzZFmlBqnTdtm0V9kmGcm28dH
 vBBN2pmf9In0aCP628H6qokita++4/azvss/eEwFIX6ldLMzIMFAPXk5F2A8UYLGORs8
 s6Pcle9XXOss2tKp7Z2+Xs1f1dVOpA+5V9dfwxE2PPaH3BeOUKbumM0YDzlX46HuF2JF
 7p2A==
X-Gm-Message-State: AFq9FYLTz4nNCpVLoPwpmkLok64pN5aDzPxFlLiV4WL5naYEv+2LqT6G
 qhKH6idnIlYLLSKkOqf9fS/03gIRRnXGCIprqgA6sjKihviM1HXg/OP9b7mHKlfhFUOn2m6dzsJ
 Vy3wqZcRjm00gxYw6RznYNqDe3Y0XSBM=
X-Gm-Gg: AYBFou246WKP00hV+1tTpamO9bF6Ede/byrKpR6GK/bbRSd8cCKG5Jyh7nRT+i9+/9r
 JS8judtXplJeGoP6ZjnR50ofsrt+dZTtg8Dv4HNhgMTGvfkZyFSvwBt5ekZhIy+oZI9Om3gsEVv
 oiU2klbT2aVRYym8ON19N90ibmCc3HCZqPx0SEvGX2hKsmsvmmE0ZemNpXPLffghYa80OzVkEgF
 WjlWHcDq+kelX79CM5NHewhHzq2PwvHyANqftRHpcwu8bogQ63DrNHftpERKHsMx/H2QNZpLQ58
 is8TB3HTHSXPZvQoUMEYxWxPptys2mY1iIeDcGSrKQYHrNWU6KWLoH9DbGVGyooCLw==
X-Received: by 2002:a05:6214:8502:10b0:917:85c3:7734 with SMTP id
 6a1803df08f44-91785c3798amr32641636d6.28.1790683178286; Tue, 29 Sep 2026
 04:59:38 -0700 (PDT)
MIME-Version: 1.0
References: <179041811564.526373.13204522833274380927.b70-hwmon-rfc@gmail.com>
 <armvfxjttsjTVWk-@intel.com>
In-Reply-To: <armvfxjttsjTVWk-@intel.com>
From: Roland Bata <batarolandkrisztian@gmail.com>
Date: Tue, 29 Sep 2026 13:59:26 +0200
X-Gm-Features: AclHuK8vNIVBqvCyFne1-pG7Et891GjtQJJvZed1eqK6DibctL0684W96IARQbQ
Message-ID: <CAAF4-EQTO0VNRkc6gBa5hjvNLD4KWYgS8u-zL3DQAvQH1xWTWw@mail.gmail.com>
Subject: Re: [PATCH RFC] drm/xe/hwmon: refresh B70 temperature inputs after GT
 idle
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org, karthik.poosa@intel.com, 
 matthew.brost@intel.com, raag.jadav@intel.com, 
 thomas.hellstrom@linux.intel.com
Content-Type: multipart/mixed; boundary="000000000000bfc866065c9dea58"
X-Mailman-Approved-At: Tue, 29 Sep 2026 12:54:01 +0000
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

--000000000000bfc866065c9dea58
Content-Type: multipart/alternative; boundary="000000000000bfc864065c9dea56"

--000000000000bfc864065c9dea56
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Rodrigo,

Thanks for the feedback. I share the concern about monitoring changing the
power state it is observing. For ordinary background collection, my
preference
is to leave runtime-suspended devices asleep and report the sample
unavailable.

Yes, holding debugfs/forcewake_all across the reads worked as an explicit
diagnostic workaround in the original two-card tests. That is how the RFC
measurements were obtained. The detail still needing hardware guidance is
that successful open/forcewake ACK did not immediately give a refreshed
temperature. The first read was still old; the first changed batch started
around 1.05 ms after successful open and finished around 1.17 ms. The RFC's
2 ms delay was empirical, not a conversion-time guarantee.

The use case motivating this report is temperature-based chassis cooling.
In the original measurements, the GTs did return to C6 after the workload;
the observed issue was the temperature value remaining latched afterward.
The energy-derived watt figures were intended to quantify the cost of the
refresh intervention. I have also observed a low latched reading change
upward, so the consumer cannot reliably identify stale data from its value.

There is an important update to the original setup: I have since installed
the vendor board firmware update (FWCODE 31.1062). It resolved the D3hot
whistle, allowing power/control=3Dauto again. My collector now skips suspen=
ded
cards. A first current-auto pilot on one card completed 28 seconds of OpenC=
L
work and then spent 83.4% of a 180-second cooldown in runtime suspend.
The available package publications timestamped after load completion stayed
at 56 C through approximately 175 seconds. This pilot used no reference
wake.

I have now followed it with a matched diagnostic on that card using the
stock
7.1.10-200.fc44.x86_64 kernel and current board firmware, temporarily
holding
the device in D0. The fixed order was sham/wake/wake/sham, each with a
common
20 ms normalization, 30 s baseline, a fresh approximately 28 s workload, an=
d
150 s cooldown. Both GTs reported C6/0 MHz before each primary comparison;
their sampled cooldown residency deltas were about 99.995% idle.

The primary package read/wait/read pairs were:

  sham: 57 -> 57 C       wake: 64 -> 39 C
  wake: 63 -> 39 C       sham: 63 -> 63 C

The wake endpoint was read while forcewake_all remained open; measured wake
fd scopes were 20.114 and 20.105 ms. Entry/return tracing verified the two
successful package reads and both GT forcewake acquisitions/releases, with
no foreign target reader/job/forcewake in the primary windows and no
recorded
trace loss or missed probes. Ordinary collection continued outside them.

There were coupled changes beyond package temperature. At the first +1 s
auxiliary checkpoint, mctrl/PCIe were 48/63 -> 29/40 C and 47/62 -> 30/40 C=
.
VRAM changed later. The driver's interval-averaged fan1 feedback went from
1254/1206 RPM before the wakes to 30/15 RPM at +5 s; the sham feedback
stayed
near its pre-probe level. These are exported values, not independent
thermometry/tachometry or a demonstrated firmware fan-control fix.

Existing card-energy-counter deltas gave approximately 41 W in the D0
cooldown windows, then 4.37/8.47 W in the two post-wake windows; sham
follow-ups
remained around 40-42 W. The second wake trial had a late counter-rate rise
and increasing fan feedback without a captured target job/forcewake, so thi=
s
is not evidence of a durable low-power fix. These are counter-derived value=
s
with coarse collection timestamps, not external-meter measurements or the
isolated cost of the pulse. Both these diagnostics and the original power
tests used control=3Don; normal-auto resume and autosuspend-tail costs rema=
in
unmeasured. The coupled behavior makes me wonder whether publication and
board power/fan control share some affected internal state.

For completeness, an earlier attempt stopped after one sham because an
optional fan read returned EAGAIN and exposed a buffered-reader error; it i=
s
retained separately. During the complete run, GitOps recreated the LLM Pod,
but it remained pending until after the diagnostic and its follow-up ended.
No target job was captured in the instrumented cooldown/follow-up windows.
All temporary resources were removed and the normal auto policy restored.

This is one card and two primary trials per arm, with differing starting
temperatures and normalization as an intervention. It supports a current
wake-sensitive discrepancy, not a universal delay/domain requirement, a
firmware-only before/after effect, or a boot test of the RFC.

I agree that a per-input, all-domain wake with a hardcoded PCI ID is not a
generic final solution. I also found Yuta Higuchi's related series 172621
and September 27 follow-up:
https://lists.freedesktop.org/archives/intel-xe/2026-September/142524.html
His matched A/B results and newer GT-only versus RENDER-only pulse results
look useful to coordinate with. In particular, our short negative cur_freq
pulse should not be taken as proof that the GT domain cannot refresh this
telemetry.

Could you clarify the intended direction for a generic solution?

1. Is there a documented temperature publication/ready mechanism, required
   wake domain and latency, or a firmware-side fix? Could the related fan
and
   energy-counter behavior help identify the responsible internal state?
2. Should ordinary hwmon reads avoid waking the device/GT and expose missin=
g
   data when freshness cannot be provided, with explicit refresh opt-in, or
   should a requested temperature read guarantee a fresh sample? What scope
   did you have in mind by generic: the affected Xe platforms/channels or a
   wider interface?
3. If driver-assisted refresh is appropriate, should one bounded refresh be
   shared across thermal channels/readers, with defined age/invalidation,
   rather than waking independently on each input read?

I can share the detailed matched records and help test the agreed sequence,
the other card, and the full PM cost under normal auto policy.

Attached are b70-d1-results-2026-09-29.txt and
b70-d1-summary-2026-09-29.json, containing a short measurement report and
structured results. Full raw logs and the measurement code are available
on request.

Thanks,
Roland

Rodrigo Vivi <rodrigo.vivi@intel.com> ezt =C3=ADrta (id=C5=91pont: 2026. sz=
ept. 28.,
H, 2:06):

> On Sat, Sep 26, 2026 at 12:21:55PM +0200, Bata Roland Kriszti=C3=A1n via =
B4
> Relay wrote:
> > From: Bata Roland Kriszti=C3=A1n <batarolandkrisztian@gmail.com>
> >
> > Two Arc Pro B70 devices (8086:e223) retain their package temperature
> > after compute workloads despite both GTs returning to C6. A device
> > runtime PM reference does not refresh the sample while power/control
> > is already on.
> >
> > With GuC 70.72.1 on Fedora kernel 7.1.10, a 60-second OpenCL workload
> > followed by 45 seconds of idle left package temperature at 55 C on both
> > cards. Acquiring all GT forcewake references still returned 55 C in
> > the first read, about 57 us after open completed. At about 1053 us the
> > reported value became 34 C on both cards. A brief GT-only pulse from
> > reading cur_freq did not refresh the package value.
> >
> > As an RFC, acquire forcewake references for the temperature input read,
> > allow time for a new sample, then release the references on both the
> > success and partial-acquisition failure paths. Limit the experiment to
> > the measured PCI ID and leave labels, limits and other hwmon types on
> > their existing paths.
> >
> > The 2 ms interval and use of all domains are empirical, not a hardware
> > specification guarantee. This needs review of the sensor conversion
> > time, minimum wake domains and alternatives such as a PCODE refresh or
> > readiness indication before it can become a production fix.
> >
> > Compile-tested xe_hwmon.o on current drm-tip with W=3D1 and Xe display =
both
> > disabled and enabled. The wake/wait/read sequence was measured through
> > debugfs on two B70s; the modified kernel has not been boot-tested.
> >
> > Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/7805
> > Assisted-by: OpenAI:gpt-6-astra
> > Signed-off-by: Bata Roland Kriszti=C3=A1n <batarolandkrisztian@gmail.co=
m>
> > ---
> > RFC: proposed direction for issue 7805, not a claim of a
> production-ready fix.
>
> The fundamental question here is, do we want to burn power in order to
> check
> for the power?
> If so, is grabbing the debugfs/forcewake_all an option before reading thi=
s?
>
> But if we decide that this is what we want, we need a generic solution,
> not only for this part...
>
> >
> > Hi Xe maintainers,
> >
> > I am following up on my B70 stale-temperature report with a smaller
> > reproduction, timing measurements, and a prototype read-side change.
> >
> > Questions before turning this into v1:
> >
> > 1. Is there a PCODE operation or freshness/conversion-ready indication
> that
> >    should be used instead of a fixed settling interval? The first MMIO
> read
> >    after successful forcewake still returned the old temperature.
> > 2. Which wake domains are actually required? A GT0 hw_engines read, whi=
ch
> >    holds all domains for that GT while dumping registers, also refreshe=
d
> >    package/mctrl/PCIe readings. The conservative prototype mirrors the
> >    device forcewake_all sequence used for the controlled timing
> experiment.
> > 3. Should a refresh cover/cache several temperature channels together?
> The
> >    prototype wakes per input read. The power measurements below are for
> one
> >    batch per device every two seconds, not for reading every hwmon
> channel
> >    at high frequency and not measurements of this compiled patch.
> > 4. Is this a known firmware issue with a preferred fix? Should the
> eventual
> >    driver handling apply to other Battlemage IDs? This RFC only opts in
> the
> >    tested 8086:e223 devices.
> >
> > Hardware and reproduction
> > -------------------------
> > Two Intel Arc Pro B70s, PCI ID 8086:e223, on an ASRock X870E Taichi /
> Ryzen
> > 5 9600X. Fedora CoreOS 44.20260829.3.1, kernel 7.1.10-200.fc44.x86_64,
> > GuC 70.72.1, HuC 8.2.10. power/control=3Don was kept throughout; it is =
an
> > existing workaround for noisy PCI runtime suspend/resume cycling.
> >
> > A bounded 60-second OpenCL workload used a private 1 MiB output buffer
> per
> > device, followed by 45 seconds without GPU submissions. Both GTs reache=
d
> > C6, actual frequency was zero, and idle residency continued advancing.
> > Package readings stayed at 55 C on both cards. A short GT0 cur_freq rea=
d
> > (itself a GT-only forcewake pulse) did not correct the package reading.
> >
> > Opening forcewake_all, then reading temperatures while holding the fd:
> >
> >                     B70 A                  B70 B
> > before              55 C                   55 C
> > first read          55 C at 57.769 us       55 C at 56.119 us
> > first correction    34 C at 1053.529 us     34 C at 1053.039 us
> >
> > Times are measured from completion of open, not the initial wake reques=
t.
> > The 2, 5, 10 ms and later samples were also refreshed. These two
> observations
> > are not a guaranteed maximum sensor-conversion latency.
> >
> > In a separate 30-second observation / short-pulse / observation sequenc=
e,
> > 16 two-millisecond holds at two-second intervals returned approximately
> > 24 C and 22-23 C. The complete open/wait/read/close scope was about 3.0=
6
> ms
> > and 3.07 ms median. GT idle residency during the pulse phase exceeded
> 99.7%.
> >
> > Energy-counter-derived card power, W:
> >                     before       pulses       after
> > B70 A               5.30         5.51         4.87
> > B70 B               4.31         4.48         4.39
> >
> > These are short observations with normal background system activity; th=
ey
> > are not a general power-regression benchmark. Holding all domains for t=
wo
> > seconds during the timing experiment cost about 81 W per card at the
> > retained 2800 MHz request and caused self-heating. A permanent forcewak=
e
> is
> > therefore unsuitable. References were released and both GTs returned to
> C6
> > after every completed experiment. No reset, rebind or PM-policy change
> was
> > used for these measurements.
> >
> > Source/build checks
> > -------------------
> > The BMG temperature read path is unchanged between v7.1.10, v7.2.5 and
> the
> > current drm-tip version examined here. The newer Fedora 20260910 firmwa=
re
> > collection contains byte-identical BMG GuC/HuC files to 20260810.
> >
> > Base: drm-tip 666d2f09d9045fc8f72cc1f71528a04acbaf5229
> >       2026-09-26 04:44:20 UTC integration manifest
> > Checked: checkpatch --strict, zero errors/warnings/checks for the patch=
;
> >          xe_hwmon.o compile with W=3D1, Xe display disabled and enabled=
.
> > Not yet tested: booted patched kernel, IGT/CI, suspend/resume, hardware
> >                acquisition-error paths, other GPU variants, high-rate
> >                multi-channel reads.
> >
> > The attached change is deliberately an RFC. I would appreciate guidance
> on
> > the correct hardware handshake and domain scope, and can test a revised
> > approach on these two cards.
> >
> > A later smoke test of the standalone reproducer below also changed a
> > previously low reading upward (26 to 44 C on one card). I therefore do
> not
> > use an unchanged/high-value heuristic to declare a value stale, or
> replace
> > readings with an inferred idle temperature. The observations concern th=
e
> > reported values; independent physical thermometry was not performed.
> >
> > Standalone reproduction aid
> > ---------------------------
> > After a GPU workload and idle interval, save this as repro.py and run:
> >   sudo python3 repro.py 0000:03:00.0 0000:08:00.0
> > Use your cards' PCI addresses. This script itself starts no workload.
> >
> > #!/usr/bin/env python3
> > # SPDX-License-Identifier: MIT
> > """Measure B70 temperature refresh after forcewake; run after
> workload/idle.
> >
> > No workload, PM-policy/frequency write, reset or driver rebind is
> performed.
> > Only the requested 8086:e223 Xe devices are read. Each wake lasts about
> 10 ms;
> > readings are printed after the descriptor has been closed.
> > """
> > import argparse
> > import json
> > import os
> > from pathlib import Path
> > import re
> > import signal
> > import time
> >
> >
> > def text(path):
> >     return path.read_text().strip()
> >
> >
> > def card(bdf, debugfs):
> >     if not re.fullmatch(r"[0-9a-f]{4}:[0-9a-f]{2}:[0-9a-f]{2}\.[0-7]",
> bdf):
> >         raise ValueError("Expected a full lowercase PCI address")
> >     pci =3D Path("/sys/bus/pci/devices") / bdf
> >     if (text(pci / "vendor"), text(pci / "device")) !=3D ("0x8086",
> "0xe223"):
> >         raise ValueError(f"Not the tested B70 PCI ID: {bdf}")
> >     if (pci / "driver").resolve() !=3D Path("/sys/bus/pci/drivers/xe"):
> >         raise ValueError(f"Not bound to xe: {bdf}")
> >     hw =3D list((pci / "hwmon").glob("hwmon*"))
> >     if len(hw) !=3D 1 or text(hw[0] / "name") !=3D "xe":
> >         raise ValueError(f"Ambiguous hwmon: {bdf}")
> >     labels =3D {text(p): p.with_name(p.name.replace("_label", "_input")=
)
> >               for p in hw[0].glob("temp*_label")}
> >     if "pkg" not in labels:
> >         raise ValueError(f"Missing package sensor: {bdf}")
> >     paths =3D {label: labels[label] for label in ("pkg", "vram", "mctrl=
",
> "pcie")
> >              if label in labels}
> >     return bdf, pci, paths, debugfs / bdf / "forcewake_all"
> >
> >
> > def snapshot(pci, paths):
> >     start =3D time.monotonic_ns()
> >     values =3D {label: int(text(path)) for label, path in paths.items()=
}
> >     return {"temp_read_start_ns": start, "temp_read_end_ns":
> time.monotonic_ns(),
> >             "millidegrees": values,
> >             "gt_idle": [text(pci / "tile0" / f"gt{n}" /
> "gtidle/idle_status")
> >                         for n in (0, 1)]}
> >
> >
> > def interrupted(signum, _frame):
> >     raise SystemExit(f"Interrupted by signal {signum}; descriptors will
> close")
> >
> >
> > def main():
> >     parser =3D argparse.ArgumentParser(description=3D__doc__)
> >     parser.add_argument("--debugfs-root", type=3DPath,
> default=3DPath("/sys/kernel/debug/dri"))
> >     parser.add_argument("devices", nargs=3D"+")
> >     args =3D parser.parse_args()
> >     if os.geteuid() !=3D 0:
> >         parser.error("Run with sudo for debugfs access")
> >     if len(args.devices) > 8 or len(set(args.devices)) !=3D
> len(args.devices):
> >         parser.error("Select at most eight distinct devices")
> >     cards =3D [card(bdf, args.debugfs_root) for bdf in args.devices]
> >     signal.signal(signal.SIGTERM, interrupted)
> >     signal.signal(signal.SIGALRM, interrupted)
> >     signal.alarm(30)
> >     for bdf, pci, paths, wake in cards:
> >         before =3D snapshot(pci, paths)
> >         if before["gt_idle"] !=3D ["gt-c6", "gt-c6"]:
> >             print(json.dumps({"bdf": bdf, "skipped": "GT is active",
> "before": before}))
> >             continue
> >         samples =3D []
> >         opened_at =3D time.monotonic_ns()
> >         with wake.open("rb"):
> >             open_returned_at =3D time.monotonic_ns()
> >             for target_us in (0, 1000, 2000, 5000, 10000):
> >                 remaining_ns =3D open_returned_at + target_us * 1000 -
> time.monotonic_ns()
> >                 if remaining_ns > 0:
> >                     time.sleep(remaining_ns / 1e9)
> >                 value =3D snapshot(pci, paths)
> >                 samples.append({"target_us": target_us,
> >                                 "since_open_us":
> (value["temp_read_start_ns"] - open_returned_at) / 1000,
> >                                 **value})
> >         closed_at =3D time.monotonic_ns()
> >         time.sleep(1)
> >         print(json.dumps({"bdf": bdf, "kernel": os.uname().release,
> >                           "power_control": text(pci / "power/control"),
> >                           "before": before, "samples": samples,
> >                           "open_us": (open_returned_at - opened_at) /
> 1000,
> >                           "total_scope_us": (closed_at - opened_at) /
> 1000,
> >                           "after_close": snapshot(pci, paths)}),
> flush=3DTrue)
> >
> >
> > if __name__ =3D=3D "__main__":
> >     main()
> >
> >  drivers/gpu/drm/xe/xe_hwmon.c | 38 +++++++++++++++++++++++++++++++++++
> >  1 file changed, 38 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_hwmon.c
> b/drivers/gpu/drm/xe/xe_hwmon.c
> > index 5edeac96..2bb5bca2 100644
> > --- a/drivers/gpu/drm/xe/xe_hwmon.c
> > +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> > @@ -3,6 +3,7 @@
> >   * Copyright =C5=A0 2023 Intel Corporation
> >   */
> >
> > +#include <linux/delay.h>
> >  #include <linux/hwmon-sysfs.h>
> >  #include <linux/hwmon.h>
> >  #include <linux/jiffies.h>
> > @@ -14,6 +15,8 @@
> >  #include "regs/xe_mchbar_regs.h"
> >  #include "regs/xe_pcode_regs.h"
> >  #include "xe_device.h"
> > +#include "xe_force_wake.h"
> > +#include "xe_gt.h"
> >  #include "xe_hwmon.h"
> >  #include "xe_mmio.h"
> >  #include "xe_pcode.h"
> > @@ -1096,6 +1099,35 @@ xe_hwmon_temp_read(struct xe_hwmon *hwmon, u32
> attr, int channel, long *val)
> >       }
> >  }
> >
> > +static int xe_hwmon_b70_temp_read(struct xe_hwmon *hwmon, u32 attr,
> > +                               int channel, long *val)
> > +{
> > +     unsigned int refs[XE_MAX_TILES_PER_DEVICE * XE_MAX_GT_PER_TILE] =
=3D
> {};
> > +     struct xe_device *xe =3D hwmon->xe;
> > +     struct xe_gt *gt;
> > +     int ret =3D -ETIMEDOUT;
> > +     u8 id;
> > +
> > +     for_each_gt(gt, xe, id) {
> > +             refs[id] =3D xe_force_wake_get(gt_to_fw(gt),
> XE_FORCEWAKE_ALL);
> > +             if (!xe_force_wake_ref_has_domain(refs[id],
> XE_FORCEWAKE_ALL))
> > +                     goto out;
> > +     }
> > +
> > +     /*
> > +      * A forcewake acknowledgment does not imply a fresh thermal
> sample.
> > +      * RFC: this interval is empirical on 8086:e223; the conversion
> time
> > +      * and minimum required wake domains need hardware-spec
> confirmation.
> > +      */
> > +     usleep_range(2000, 2500);
> > +     ret =3D xe_hwmon_temp_read(hwmon, attr, channel, val);
> > +out:
> > +     for_each_gt(gt, xe, id)
> > +             xe_force_wake_put(gt_to_fw(gt), refs[id]);
> > +
> > +     return ret;
> > +}
> > +
> >  static umode_t
> >  xe_hwmon_power_is_visible(struct xe_hwmon *hwmon, u32 attr, int channe=
l)
> >  {
> > @@ -1408,6 +1440,12 @@ xe_hwmon_read(struct device *dev, enum
> hwmon_sensor_types type, u32 attr,
> >
> >       switch (type) {
> >       case hwmon_temp:
> > +             /* Limit the RFC workaround to the PCI ID measured in
> issue 7805. */
> > +             if (attr =3D=3D hwmon_temp_input &&
> > +                 hwmon->xe->info.platform =3D=3D XE_BATTLEMAGE &&
> > +                 hwmon->xe->info.devid =3D=3D 0xe223)
> > +                     return xe_hwmon_b70_temp_read(hwmon, attr,
> channel, val);
> > +
> >               return xe_hwmon_temp_read(hwmon, attr, channel, val);
> >       case hwmon_power:
> >               return xe_hwmon_power_read(hwmon, attr, channel, val);
> >
> > base-commit: 666d2f09d9045fc8f72cc1f71528a04acbaf5229
> > --
> > 2.55.0
> >
> >
>

--000000000000bfc864065c9dea56
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Rodrigo,<br><br>Thanks for the feedback. I share the co=
ncern about monitoring changing the<br>power state it is observing. For ord=
inary background collection, my preference<br>is to leave runtime-suspended=
 devices asleep and report the sample unavailable.<br><br>Yes, holding debu=
gfs/forcewake_all across the reads worked as an explicit<br>diagnostic work=
around in the original two-card tests. That is how the RFC<br>measurements =
were obtained. The detail still needing hardware guidance is<br>that succes=
sful open/forcewake ACK did not immediately give a refreshed<br>temperature=
. The first read was still old; the first changed batch started<br>around 1=
.05 ms after successful open and finished around 1.17 ms. The RFC&#39;s<br>=
2 ms delay was empirical, not a conversion-time guarantee.<br><br>The use c=
ase motivating this report is temperature-based chassis cooling.<br>In the =
original measurements, the GTs did return to C6 after the workload;<br>the =
observed issue was the temperature value remaining latched afterward.<br>Th=
e energy-derived watt figures were intended to quantify the cost of the<br>=
refresh intervention. I have also observed a low latched reading change<br>=
upward, so the consumer cannot reliably identify stale data from its value.=
<br><br>There is an important update to the original setup: I have since in=
stalled<br>the vendor board firmware update (FWCODE 31.1062). It resolved t=
he D3hot<br>whistle, allowing power/control=3Dauto again. My collector now =
skips suspended<br>cards. A first current-auto pilot on one card completed =
28 seconds of OpenCL<br>work and then spent 83.4% of a 180-second cooldown =
in runtime suspend.<br>The available package publications timestamped after=
 load completion stayed<br>at 56 C through approximately 175 seconds. This =
pilot used no reference wake.<br><br>I have now followed it with a matched =
diagnostic on that card using the stock<br>7.1.10-200.fc44.x86_64 kernel an=
d current board firmware, temporarily holding<br>the device in D0. The fixe=
d order was sham/wake/wake/sham, each with a common<br>20 ms normalization,=
 30 s baseline, a fresh approximately 28 s workload, and<br>150 s cooldown.=
 Both GTs reported C6/0 MHz before each primary comparison;<br>their sample=
d cooldown residency deltas were about 99.995% idle.<br><br>The primary pac=
kage read/wait/read pairs were:<br><br>=C2=A0 sham: 57 -&gt; 57 C =C2=A0 =
=C2=A0 =C2=A0 wake: 64 -&gt; 39 C<br>=C2=A0 wake: 63 -&gt; 39 C =C2=A0 =C2=
=A0 =C2=A0 sham: 63 -&gt; 63 C<br><br>The wake endpoint was read while forc=
ewake_all remained open; measured wake<br>fd scopes were 20.114 and 20.105 =
ms. Entry/return tracing verified the two<br>successful package reads and b=
oth GT forcewake acquisitions/releases, with<br>no foreign target reader/jo=
b/forcewake in the primary windows and no recorded<br>trace loss or missed =
probes. Ordinary collection continued outside them.<br><br>There were coupl=
ed changes beyond package temperature. At the first +1 s<br>auxiliary check=
point, mctrl/PCIe were 48/63 -&gt; 29/40 C and 47/62 -&gt; 30/40 C.<br>VRAM=
 changed later. The driver&#39;s interval-averaged fan1 feedback went from<=
br>1254/1206 RPM before the wakes to 30/15 RPM at +5 s; the sham feedback s=
tayed<br>near its pre-probe level. These are exported values, not independe=
nt<br>thermometry/tachometry or a demonstrated firmware fan-control fix.<br=
><br>Existing card-energy-counter deltas gave approximately 41 W in the D0<=
br>cooldown windows, then 4.37/8.47 W in the two post-wake windows; sham fo=
llow-ups<br>remained around 40-42 W. The second wake trial had a late count=
er-rate rise<br>and increasing fan feedback without a captured target job/f=
orcewake, so this<br>is not evidence of a durable low-power fix. These are =
counter-derived values<br>with coarse collection timestamps, not external-m=
eter measurements or the<br>isolated cost of the pulse. Both these diagnost=
ics and the original power<br>tests used control=3Don; normal-auto resume a=
nd autosuspend-tail costs remain<br>unmeasured. The coupled behavior makes =
me wonder whether publication and<br>board power/fan control share some aff=
ected internal state.<br><br>For completeness, an earlier attempt stopped a=
fter one sham because an<br>optional fan read returned EAGAIN and exposed a=
 buffered-reader error; it is<br>retained separately. During the complete r=
un, GitOps recreated the LLM Pod,<br>but it remained pending until after th=
e diagnostic and its follow-up ended.<br>No target job was captured in the =
instrumented cooldown/follow-up windows.<br>All temporary resources were re=
moved and the normal auto policy restored.<br><br>This is one card and two =
primary trials per arm, with differing starting<br>temperatures and normali=
zation as an intervention. It supports a current<br>wake-sensitive discrepa=
ncy, not a universal delay/domain requirement, a<br>firmware-only before/af=
ter effect, or a boot test of the RFC.<br><br>I agree that a per-input, all=
-domain wake with a hardcoded PCI ID is not a<br>generic final solution. I =
also found Yuta Higuchi&#39;s related series 172621<br>and September 27 fol=
low-up:<br><a href=3D"https://lists.freedesktop.org/archives/intel-xe/2026-=
September/142524.html">https://lists.freedesktop.org/archives/intel-xe/2026=
-September/142524.html</a><br>His matched A/B results and newer GT-only ver=
sus RENDER-only pulse results<br>look useful to coordinate with. In particu=
lar, our short negative cur_freq<br>pulse should not be taken as proof that=
 the GT domain cannot refresh this<br>telemetry.<br><br>Could you clarify t=
he intended direction for a generic solution?<br><br>1. Is there a document=
ed temperature publication/ready mechanism, required<br>=C2=A0 =C2=A0wake d=
omain and latency, or a firmware-side fix? Could the related fan and<br>=C2=
=A0 =C2=A0energy-counter behavior help identify the responsible internal st=
ate?<br>2. Should ordinary hwmon reads avoid waking the device/GT and expos=
e missing<br>=C2=A0 =C2=A0data when freshness cannot be provided, with expl=
icit refresh opt-in, or<br>=C2=A0 =C2=A0should a requested temperature read=
 guarantee a fresh sample? What scope<br>=C2=A0 =C2=A0did you have in mind =
by generic: the affected Xe platforms/channels or a<br>=C2=A0 =C2=A0wider i=
nterface?<br>3. If driver-assisted refresh is appropriate, should one bound=
ed refresh be<br>=C2=A0 =C2=A0shared across thermal channels/readers, with =
defined age/invalidation,<br>=C2=A0 =C2=A0rather than waking independently =
on each input read?<br><br>I can share the detailed matched records and hel=
p test the agreed sequence,<br>the other card, and the full PM cost under n=
ormal auto policy.<br><br>Attached are b70-d1-results-2026-09-29.txt and<br=
>b70-d1-summary-2026-09-29.json, containing a short measurement report and<=
br>structured results. Full raw logs and the measurement code are available=
<br>on request.<br><br>Thanks,<br>Roland<br></div><br><div class=3D"gmail_q=
uote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Rodrigo V=
ivi &lt;<a href=3D"mailto:rodrigo.vivi@intel.com">rodrigo.vivi@intel.com</a=
>&gt; ezt =C3=ADrta (id=C5=91pont: 2026. szept. 28., H, 2:06):<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">On Sat, Sep 26, 2026 at 12:2=
1:55PM +0200, Bata Roland Kriszti=C3=A1n via B4 Relay wrote:<br>
&gt; From: Bata Roland Kriszti=C3=A1n &lt;<a href=3D"mailto:batarolandkrisz=
tian@gmail.com" target=3D"_blank">batarolandkrisztian@gmail.com</a>&gt;<br>
&gt; <br>
&gt; Two Arc Pro B70 devices (8086:e223) retain their package temperature<b=
r>
&gt; after compute workloads despite both GTs returning to C6. A device<br>
&gt; runtime PM reference does not refresh the sample while power/control<b=
r>
&gt; is already on.<br>
&gt; <br>
&gt; With GuC 70.72.1 on Fedora kernel 7.1.10, a 60-second OpenCL workload<=
br>
&gt; followed by 45 seconds of idle left package temperature at 55 C on bot=
h<br>
&gt; cards. Acquiring all GT forcewake references still returned 55 C in<br=
>
&gt; the first read, about 57 us after open completed. At about 1053 us the=
<br>
&gt; reported value became 34 C on both cards. A brief GT-only pulse from<b=
r>
&gt; reading cur_freq did not refresh the package value.<br>
&gt; <br>
&gt; As an RFC, acquire forcewake references for the temperature input read=
,<br>
&gt; allow time for a new sample, then release the references on both the<b=
r>
&gt; success and partial-acquisition failure paths. Limit the experiment to=
<br>
&gt; the measured PCI ID and leave labels, limits and other hwmon types on<=
br>
&gt; their existing paths.<br>
&gt; <br>
&gt; The 2 ms interval and use of all domains are empirical, not a hardware=
<br>
&gt; specification guarantee. This needs review of the sensor conversion<br=
>
&gt; time, minimum wake domains and alternatives such as a PCODE refresh or=
<br>
&gt; readiness indication before it can become a production fix.<br>
&gt; <br>
&gt; Compile-tested xe_hwmon.o on current drm-tip with W=3D1 and Xe display=
 both<br>
&gt; disabled and enabled. The wake/wait/read sequence was measured through=
<br>
&gt; debugfs on two B70s; the modified kernel has not been boot-tested.<br>
&gt; <br>
&gt; Link: <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/-/work_i=
tems/7805" rel=3D"noreferrer" target=3D"_blank">https://gitlab.freedesktop.=
org/drm/xe/kernel/-/work_items/7805</a><br>
&gt; Assisted-by: OpenAI:gpt-6-astra<br>
&gt; Signed-off-by: Bata Roland Kriszti=C3=A1n &lt;<a href=3D"mailto:bataro=
landkrisztian@gmail.com" target=3D"_blank">batarolandkrisztian@gmail.com</a=
>&gt;<br>
&gt; ---<br>
&gt; RFC: proposed direction for issue 7805, not a claim of a production-re=
ady fix.<br>
<br>
The fundamental question here is, do we want to burn power in order to chec=
k<br>
for the power?<br>
If so, is grabbing the debugfs/forcewake_all an option before reading this?=
<br>
<br>
But if we decide that this is what we want, we need a generic solution,<br>
not only for this part...<br>
<br>
&gt; <br>
&gt; Hi Xe maintainers,<br>
&gt; <br>
&gt; I am following up on my B70 stale-temperature report with a smaller<br=
>
&gt; reproduction, timing measurements, and a prototype read-side change.<b=
r>
&gt; <br>
&gt; Questions before turning this into v1:<br>
&gt; <br>
&gt; 1. Is there a PCODE operation or freshness/conversion-ready indication=
 that<br>
&gt;=C2=A0 =C2=A0 should be used instead of a fixed settling interval? The =
first MMIO read<br>
&gt;=C2=A0 =C2=A0 after successful forcewake still returned the old tempera=
ture.<br>
&gt; 2. Which wake domains are actually required? A GT0 hw_engines read, wh=
ich<br>
&gt;=C2=A0 =C2=A0 holds all domains for that GT while dumping registers, al=
so refreshed<br>
&gt;=C2=A0 =C2=A0 package/mctrl/PCIe readings. The conservative prototype m=
irrors the<br>
&gt;=C2=A0 =C2=A0 device forcewake_all sequence used for the controlled tim=
ing experiment.<br>
&gt; 3. Should a refresh cover/cache several temperature channels together?=
 The<br>
&gt;=C2=A0 =C2=A0 prototype wakes per input read. The power measurements be=
low are for one<br>
&gt;=C2=A0 =C2=A0 batch per device every two seconds, not for reading every=
 hwmon channel<br>
&gt;=C2=A0 =C2=A0 at high frequency and not measurements of this compiled p=
atch.<br>
&gt; 4. Is this a known firmware issue with a preferred fix? Should the eve=
ntual<br>
&gt;=C2=A0 =C2=A0 driver handling apply to other Battlemage IDs? This RFC o=
nly opts in the<br>
&gt;=C2=A0 =C2=A0 tested 8086:e223 devices.<br>
&gt; <br>
&gt; Hardware and reproduction<br>
&gt; -------------------------<br>
&gt; Two Intel Arc Pro B70s, PCI ID 8086:e223, on an ASRock X870E Taichi / =
Ryzen<br>
&gt; 5 9600X. Fedora CoreOS 44.20260829.3.1, kernel 7.1.10-200.fc44.x86_64,=
<br>
&gt; GuC 70.72.1, HuC 8.2.10. power/control=3Don was kept throughout; it is=
 an<br>
&gt; existing workaround for noisy PCI runtime suspend/resume cycling.<br>
&gt; <br>
&gt; A bounded 60-second OpenCL workload used a private 1 MiB output buffer=
 per<br>
&gt; device, followed by 45 seconds without GPU submissions. Both GTs reach=
ed<br>
&gt; C6, actual frequency was zero, and idle residency continued advancing.=
<br>
&gt; Package readings stayed at 55 C on both cards. A short GT0 cur_freq re=
ad<br>
&gt; (itself a GT-only forcewake pulse) did not correct the package reading=
.<br>
&gt; <br>
&gt; Opening forcewake_all, then reading temperatures while holding the fd:=
<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0B70 A=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 B=
70 B<br>
&gt; before=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 55 C=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A055 C<br>
&gt; first read=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 55 C at 57.769 us=C2=A0 =
=C2=A0 =C2=A0 =C2=A055 C at 56.119 us<br>
&gt; first correction=C2=A0 =C2=A0 34 C at 1053.529 us=C2=A0 =C2=A0 =C2=A03=
4 C at 1053.039 us<br>
&gt; <br>
&gt; Times are measured from completion of open, not the initial wake reque=
st.<br>
&gt; The 2, 5, 10 ms and later samples were also refreshed. These two obser=
vations<br>
&gt; are not a guaranteed maximum sensor-conversion latency.<br>
&gt; <br>
&gt; In a separate 30-second observation / short-pulse / observation sequen=
ce,<br>
&gt; 16 two-millisecond holds at two-second intervals returned approximatel=
y<br>
&gt; 24 C and 22-23 C. The complete open/wait/read/close scope was about 3.=
06 ms<br>
&gt; and 3.07 ms median. GT idle residency during the pulse phase exceeded =
99.7%.<br>
&gt; <br>
&gt; Energy-counter-derived card power, W:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0before=C2=A0 =C2=A0 =C2=A0 =C2=A0pulses=C2=A0 =C2=A0 =C2=A0 =C2=A0aft=
er<br>
&gt; B70 A=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A05.30=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A05.51=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A04.87<br>
&gt; B70 B=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A04.31=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A04.48=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A04.39<br>
&gt; <br>
&gt; These are short observations with normal background system activity; t=
hey<br>
&gt; are not a general power-regression benchmark. Holding all domains for =
two<br>
&gt; seconds during the timing experiment cost about 81 W per card at the<b=
r>
&gt; retained 2800 MHz request and caused self-heating. A permanent forcewa=
ke is<br>
&gt; therefore unsuitable. References were released and both GTs returned t=
o C6<br>
&gt; after every completed experiment. No reset, rebind or PM-policy change=
 was<br>
&gt; used for these measurements.<br>
&gt; <br>
&gt; Source/build checks<br>
&gt; -------------------<br>
&gt; The BMG temperature read path is unchanged between v7.1.10, v7.2.5 and=
 the<br>
&gt; current drm-tip version examined here. The newer Fedora 20260910 firmw=
are<br>
&gt; collection contains byte-identical BMG GuC/HuC files to 20260810.<br>
&gt; <br>
&gt; Base: drm-tip 666d2f09d9045fc8f72cc1f71528a04acbaf5229<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A02026-09-26 04:44:20 UTC integration manifest=
<br>
&gt; Checked: checkpatch --strict, zero errors/warnings/checks for the patc=
h;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xe_hwmon.o compile with W=3D1, Xe di=
splay disabled and enabled.<br>
&gt; Not yet tested: booted patched kernel, IGT/CI, suspend/resume, hardwar=
e<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 acquisition-err=
or paths, other GPU variants, high-rate<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 multi-channel r=
eads.<br>
&gt; <br>
&gt; The attached change is deliberately an RFC. I would appreciate guidanc=
e on<br>
&gt; the correct hardware handshake and domain scope, and can test a revise=
d<br>
&gt; approach on these two cards.<br>
&gt; <br>
&gt; A later smoke test of the standalone reproducer below also changed a<b=
r>
&gt; previously low reading upward (26 to 44 C on one card). I therefore do=
 not<br>
&gt; use an unchanged/high-value heuristic to declare a value stale, or rep=
lace<br>
&gt; readings with an inferred idle temperature. The observations concern t=
he<br>
&gt; reported values; independent physical thermometry was not performed.<b=
r>
&gt; <br>
&gt; Standalone reproduction aid<br>
&gt; ---------------------------<br>
&gt; After a GPU workload and idle interval, save this as repro.py and run:=
<br>
&gt;=C2=A0 =C2=A0sudo python3 repro.py 0000:03:00.0 0000:08:00.0<br>
&gt; Use your cards&#39; PCI addresses. This script itself starts no worklo=
ad.<br>
&gt; <br>
&gt; #!/usr/bin/env python3<br>
&gt; # SPDX-License-Identifier: MIT<br>
&gt; &quot;&quot;&quot;Measure B70 temperature refresh after forcewake; run=
 after workload/idle.<br>
&gt; <br>
&gt; No workload, PM-policy/frequency write, reset or driver rebind is perf=
ormed.<br>
&gt; Only the requested 8086:e223 Xe devices are read. Each wake lasts abou=
t 10 ms;<br>
&gt; readings are printed after the descriptor has been closed.<br>
&gt; &quot;&quot;&quot;<br>
&gt; import argparse<br>
&gt; import json<br>
&gt; import os<br>
&gt; from pathlib import Path<br>
&gt; import re<br>
&gt; import signal<br>
&gt; import time<br>
&gt; <br>
&gt; <br>
&gt; def text(path):<br>
&gt;=C2=A0 =C2=A0 =C2=A0return path.read_text().strip()<br>
&gt; <br>
&gt; <br>
&gt; def card(bdf, debugfs):<br>
&gt;=C2=A0 =C2=A0 =C2=A0if not re.fullmatch(r&quot;[0-9a-f]{4}:[0-9a-f]{2}:=
[0-9a-f]{2}\.[0-7]&quot;, bdf):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0raise ValueError(&quot;Expected a ful=
l lowercase PCI address&quot;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0pci =3D Path(&quot;/sys/bus/pci/devices&quot;) / bd=
f<br>
&gt;=C2=A0 =C2=A0 =C2=A0if (text(pci / &quot;vendor&quot;), text(pci / &quo=
t;device&quot;)) !=3D (&quot;0x8086&quot;, &quot;0xe223&quot;):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0raise ValueError(f&quot;Not the teste=
d B70 PCI ID: {bdf}&quot;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0if (pci / &quot;driver&quot;).resolve() !=3D Path(&=
quot;/sys/bus/pci/drivers/xe&quot;):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0raise ValueError(f&quot;Not bound to =
xe: {bdf}&quot;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0hw =3D list((pci / &quot;hwmon&quot;).glob(&quot;hw=
mon*&quot;))<br>
&gt;=C2=A0 =C2=A0 =C2=A0if len(hw) !=3D 1 or text(hw[0] / &quot;name&quot;)=
 !=3D &quot;xe&quot;:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0raise ValueError(f&quot;Ambiguous hwm=
on: {bdf}&quot;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0labels =3D {text(p): p.with_name(p.name.replace(&qu=
ot;_label&quot;, &quot;_input&quot;))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for p in hw[0].g=
lob(&quot;temp*_label&quot;)}<br>
&gt;=C2=A0 =C2=A0 =C2=A0if &quot;pkg&quot; not in labels:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0raise ValueError(f&quot;Missing packa=
ge sensor: {bdf}&quot;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0paths =3D {label: labels[label] for label in (&quot=
;pkg&quot;, &quot;vram&quot;, &quot;mctrl&quot;, &quot;pcie&quot;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if label in labels}<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0return bdf, pci, paths, debugfs / bdf / &quot;force=
wake_all&quot;<br>
&gt; <br>
&gt; <br>
&gt; def snapshot(pci, paths):<br>
&gt;=C2=A0 =C2=A0 =C2=A0start =3D time.monotonic_ns()<br>
&gt;=C2=A0 =C2=A0 =C2=A0values =3D {label: int(text(path)) for label, path =
in paths.items()}<br>
&gt;=C2=A0 =C2=A0 =C2=A0return {&quot;temp_read_start_ns&quot;: start, &quo=
t;temp_read_end_ns&quot;: time.monotonic_ns(),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;millidegrees&quot=
;: values,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;gt_idle&quot;: [t=
ext(pci / &quot;tile0&quot; / f&quot;gt{n}&quot; / &quot;gtidle/idle_status=
&quot;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0for n in (0, 1)]}<br>
&gt; <br>
&gt; <br>
&gt; def interrupted(signum, _frame):<br>
&gt;=C2=A0 =C2=A0 =C2=A0raise SystemExit(f&quot;Interrupted by signal {sign=
um}; descriptors will close&quot;)<br>
&gt; <br>
&gt; <br>
&gt; def main():<br>
&gt;=C2=A0 =C2=A0 =C2=A0parser =3D argparse.ArgumentParser(description=3D__=
doc__)<br>
&gt;=C2=A0 =C2=A0 =C2=A0parser.add_argument(&quot;--debugfs-root&quot;, typ=
e=3DPath, default=3DPath(&quot;/sys/kernel/debug/dri&quot;))<br>
&gt;=C2=A0 =C2=A0 =C2=A0parser.add_argument(&quot;devices&quot;, nargs=3D&q=
uot;+&quot;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0args =3D parser.parse_args()<br>
&gt;=C2=A0 =C2=A0 =C2=A0if os.geteuid() !=3D 0:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0parser.error(&quot;Run with sudo for =
debugfs access&quot;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0if len(args.devices) &gt; 8 or len(set(args.devices=
)) !=3D len(args.devices):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0parser.error(&quot;Select at most eig=
ht distinct devices&quot;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0cards =3D [card(bdf, args.debugfs_root) for bdf in =
args.devices]<br>
&gt;=C2=A0 =C2=A0 =C2=A0signal.signal(signal.SIGTERM, interrupted)<br>
&gt;=C2=A0 =C2=A0 =C2=A0signal.signal(signal.SIGALRM, interrupted)<br>
&gt;=C2=A0 =C2=A0 =C2=A0signal.alarm(30)<br>
&gt;=C2=A0 =C2=A0 =C2=A0for bdf, pci, paths, wake in cards:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0before =3D snapshot(pci, paths)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if before[&quot;gt_idle&quot;] !=3D [=
&quot;gt-c6&quot;, &quot;gt-c6&quot;]:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0print(json.dumps({&quot=
;bdf&quot;: bdf, &quot;skipped&quot;: &quot;GT is active&quot;, &quot;befor=
e&quot;: before}))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0samples =3D []<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0opened_at =3D time.monotonic_ns()<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0with wake.open(&quot;rb&quot;):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0open_returned_at =3D ti=
me.monotonic_ns()<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for target_us in (0, 10=
00, 2000, 5000, 10000):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0remaining=
_ns =3D open_returned_at + target_us * 1000 - time.monotonic_ns()<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if remain=
ing_ns &gt; 0:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0time.sleep(remaining_ns / 1e9)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0value =3D=
 snapshot(pci, paths)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0samples.a=
ppend({&quot;target_us&quot;: target_us,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;since_open_us&quot;: =
(value[&quot;temp_read_start_ns&quot;] - open_returned_at) / 1000,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0**value})<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0closed_at =3D time.monotonic_ns()<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0time.sleep(1)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0print(json.dumps({&quot;bdf&quot;: bd=
f, &quot;kernel&quot;: os.uname().release,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;power_control&quot;: text(pci / &quot;powe=
r/control&quot;),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;before&quot;: before, &quot;samples&quot;:=
 samples,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;open_us&quot;: (open_returned_at - opened_=
at) / 1000,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;total_scope_us&quot;: (closed_at - opened_=
at) / 1000,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;after_close&quot;: snapshot(pci, paths)}),=
 flush=3DTrue)<br>
&gt; <br>
&gt; <br>
&gt; if __name__ =3D=3D &quot;__main__&quot;:<br>
&gt;=C2=A0 =C2=A0 =C2=A0main()<br>
&gt; <br>
&gt;=C2=A0 drivers/gpu/drm/xe/xe_hwmon.c | 38 +++++++++++++++++++++++++++++=
++++++<br>
&gt;=C2=A0 1 file changed, 38 insertions(+)<br>
&gt; <br>
&gt; diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwm=
on.c<br>
&gt; index 5edeac96..2bb5bca2 100644<br>
&gt; --- a/drivers/gpu/drm/xe/xe_hwmon.c<br>
&gt; +++ b/drivers/gpu/drm/xe/xe_hwmon.c<br>
&gt; @@ -3,6 +3,7 @@<br>
&gt;=C2=A0 =C2=A0* Copyright =C5=A0 2023 Intel Corporation<br>
&gt;=C2=A0 =C2=A0*/<br>
&gt;=C2=A0 <br>
&gt; +#include &lt;linux/delay.h&gt;<br>
&gt;=C2=A0 #include &lt;linux/hwmon-sysfs.h&gt;<br>
&gt;=C2=A0 #include &lt;linux/hwmon.h&gt;<br>
&gt;=C2=A0 #include &lt;linux/jiffies.h&gt;<br>
&gt; @@ -14,6 +15,8 @@<br>
&gt;=C2=A0 #include &quot;regs/xe_mchbar_regs.h&quot;<br>
&gt;=C2=A0 #include &quot;regs/xe_pcode_regs.h&quot;<br>
&gt;=C2=A0 #include &quot;xe_device.h&quot;<br>
&gt; +#include &quot;xe_force_wake.h&quot;<br>
&gt; +#include &quot;xe_gt.h&quot;<br>
&gt;=C2=A0 #include &quot;xe_hwmon.h&quot;<br>
&gt;=C2=A0 #include &quot;xe_mmio.h&quot;<br>
&gt;=C2=A0 #include &quot;xe_pcode.h&quot;<br>
&gt; @@ -1096,6 +1099,35 @@ xe_hwmon_temp_read(struct xe_hwmon *hwmon, u32 =
attr, int channel, long *val)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; +static int xe_hwmon_b70_temp_read(struct xe_hwmon *hwmon, u32 attr,<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int channel, long *val)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0unsigned int refs[XE_MAX_TILES_PER_DEVICE * XE_MA=
X_GT_PER_TILE] =3D {};<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct xe_device *xe =3D hwmon-&gt;xe;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct xe_gt *gt;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int ret =3D -ETIMEDOUT;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u8 id;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0for_each_gt(gt, xe, id) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0refs[id] =3D xe_force=
_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!xe_force_wake_re=
f_has_domain(refs[id], XE_FORCEWAKE_ALL))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0goto out;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * A forcewake acknowledgment does not imply a fr=
esh thermal sample.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * RFC: this interval is empirical on 8086:e223; =
the conversion time<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * and minimum required wake domains need hardwar=
e-spec confirmation.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0usleep_range(2000, 2500);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D xe_hwmon_temp_read(hwmon, attr, channel, =
val);<br>
&gt; +out:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0for_each_gt(gt, xe, id)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0xe_force_wake_put(gt_=
to_fw(gt), refs[id]);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; +}<br>
&gt; +<br>
&gt;=C2=A0 static umode_t<br>
&gt;=C2=A0 xe_hwmon_power_is_visible(struct xe_hwmon *hwmon, u32 attr, int =
channel)<br>
&gt;=C2=A0 {<br>
&gt; @@ -1408,6 +1440,12 @@ xe_hwmon_read(struct device *dev, enum hwmon_se=
nsor_types type, u32 attr,<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0switch (type) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0case hwmon_temp:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Limit the RFC work=
around to the PCI ID measured in issue 7805. */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (attr =3D=3D hwmon=
_temp_input &amp;&amp;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hwmon-&=
gt;xe-&gt;info.platform =3D=3D XE_BATTLEMAGE &amp;&amp;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hwmon-&=
gt;xe-&gt;info.devid =3D=3D 0xe223)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0return xe_hwmon_b70_temp_read(hwmon, attr, channel, val);<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return xe_hwmon_=
temp_read(hwmon, attr, channel, val);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0case hwmon_power:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return xe_hwmon_=
power_read(hwmon, attr, channel, val);<br>
&gt; <br>
&gt; base-commit: 666d2f09d9045fc8f72cc1f71528a04acbaf5229<br>
&gt; -- <br>
&gt; 2.55.0<br>
&gt; <br>
&gt; <br>
</blockquote></div>

--000000000000bfc864065c9dea56--

--000000000000bfc866065c9dea58
Content-Type: text/plain; charset="US-ASCII"; name="b70-d1-results-2026-09-29.txt"
Content-Disposition: attachment; filename="b70-d1-results-2026-09-29.txt"
Content-Transfer-Encoding: base64
Content-ID: <f_mummiim30>
X-Attachment-Id: f_mummiim30

QjcwIEQxOiBtYXRjaGVkIHRlbXBlcmF0dXJlLXB1YmxpY2F0aW9uIGRpYWdub3N0aWMsIDIwMjYt
MDktMjkKPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09CgpTY29wZSBhbmQgbWV0aG9kCi0tLS0tLS0tLS0tLS0tLS0KT25lIEludGVsIEFy
YyBQcm8gQjcwICg4MDg2OmUyMjMsIDAwMDA6MDg6MDAuMCksIHN0b2NrIFhlIGRyaXZlciBvbgo3
LjEuMTAtMjAwLmZjNDQueDg2XzY0IC8gRmVkb3JhIENvcmVPUyA0NC4yMDI2MDgyOS4zLjEuIEJv
YXJkIGZpcm13YXJlOgpGV0NPREUgMzEuMTA2MiwgRldEQVRBIDIwMy40NiwgT3B0aW9uUk9NIDIz
LjEwNjYuMC4wLCB2ZXJpZmllZCBkdXJpbmcKMjAyNi0wOS0yNyBtYWludGVuYW5jZTsgbm8gZmly
bXdhcmUgaGFyZHdhcmUgcXVlcnkgaW5zaWRlIHRoZSBleHBlcmltZW50LgpDb21wbGV0ZSBydW46
IGI3MC1wMS1kMS0yMDI2MDkyOS1jLCAwNjoxNjoxMS0wNjozMjozNiBVVEMuCgpPbmx5IHRoZSB0
YXJnZXQgd2FzIHRlbXBvcmFyaWx5IGhlbGQgaW4gRDAgKHBvd2VyL2NvbnRyb2w9b24pOyBib3Ro
IEdUcwpjb3VsZCBlbnRlciBDNi4gTm9ybWFsIGF1dG8vMTAwMCBtcyBwb2xpY3kgd2FzIHNhdmVk
IGFuZCByZXN0b3JlZC4gRXhpc3RpbmcKY29vbGluZyBhbmQgY29sbGVjdGlvbiByZW1haW5lZCBl
bmFibGVkLiBUaGUgc2Vjb25kIGNhcmQga2VwdCBpdHMgcG9saWN5LgoKRml4ZWQgb3JkZXI6IHNo
YW0gLyB3YWtlIC8gd2FrZSAvIHNoYW0sIGVhY2ggd2l0aCBhIGZyZXNoIHdvcmtsb2FkIGVwaXNv
ZGU6CjEuIENvbW1vbiBub21pbmFsIDIwIG1zIGZvcmNld2FrZV9hbGwgbm9ybWFsaXphdGlvbiwg
dGhlbiAzMCBzIGJhc2VsaW5lLgoyLiBUYXJnZXQtb25seSBPcGVuQ0wgY2hpbGQsIHByaXZhdGUg
MSBNaUIgYnVmZmVyLCBhYm91dCAyOCBzIG9mIGRpc3BhdGNoZXM7CiAgIGNvbXBsZXRpb24vcmVh
ZGJhY2sgYW5kIHJlc291cmNlIHJlbGVhc2UgYmVmb3JlIGNoaWxkIGV4aXQvY29vbGRvd24uCjMu
IDE1MCBzIGNvb2xkb3duOyBkaXJlY3QgY2hlY2twb2ludHMgbmVhciA1LzMwLzYwLzkwLzEyMC8x
NTAgcy4KNC4gQm90aCBHVHMgbXVzdCByZXBvcnQgQzYvMCBNSHouIFJlYWQgcGFja2FnZSwgb3Bl
biAvZGV2L251bGwgKHNoYW0pIG9yCiAgIHRhcmdldCBmb3JjZXdha2VfYWxsICh3YWtlKSwgd2Fp
dCBub21pbmFsIDIwIG1zLCByZWFkIHBhY2thZ2UsIHRoZW4gY2xvc2UuCjUuIEZvbGxvdyBmb3Ig
MzAgcywgd2l0aCBzZXF1ZW50aWFsIGF1eGlsaWFyeSByZWFkcyBuZWFyICsxLys1LysxNS8rMzAg
cy4KICAgVGhvc2UgYXV4aWxpYXJ5IHJlYWRzIGFyZSBvdXRzaWRlIHRoZSBwcmltYXJ5IGRlc2Ny
aXB0b3ItaG9sZCB3aW5kb3cuCgpQcmltYXJ5IGNvbXBhcmlzb24gKHJlcG9ydGVkIHBhY2thZ2Ug
dGVtcGVyYXR1cmUpCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLQpUcmlhbCAgQXJtICAgIEJlZm9yZSBDICBBZnRlciBDICBEZWx0YSBDICBGRCBzY29wZSBt
cyAgUmVhZCBzcGFuIG1zCjEgICAgICBzaGFtICAgICAgICA1NyAgICAgICA1NyAgICAgICAgMCAg
ICAyMC4zMzUzNDYgICAgIDIwLjYzNDY3NAoyICAgICAgd2FrZSAgICAgICAgNjQgICAgICAgMzkg
ICAgICAtMjUgICAgMjAuMTE0MjE5ICAgICAyMC44NTI3ODIKMyAgICAgIHdha2UgICAgICAgIDYz
ICAgICAgIDM5ICAgICAgLTI0ICAgIDIwLjEwNDY0OSAgICAgMjAuODQxOTAyCjQgICAgICBzaGFt
ICAgICAgICA2MyAgICAgICA2MyAgICAgICAgMCAgICAyMC4zMDY5NjYgICAgIDIwLjYwNjk4NAoK
RkQgc2NvcGU6IG9wZW4tcmV0dXJuIHRvIGNsb3NlLXJldHVybi4gUmVhZCBzcGFuOiBiZWZvcmUt
cmVhZCBzdGFydCB0bwphZnRlci1yZWFkIGVuZC4gVGhlIHdha2UgZW5kcG9pbnQgd2FzIHJlYWQg
d2hpbGUgdGhlIGRlc2NyaXB0b3Igd2FzIG9wZW4uClNlcGFyYXRlIHByZXBhcmF0b3J5IG5vcm1h
bGl6YXRpb24gcGFpcnMgd2VyZSAyNy0+MjYsIDU3LT40MCwgMzktPjM1IGFuZAozOS0+MzggQy4g
VGhleSBhcmUgaW50ZXJ2ZW50aW9ucywgbm90IGFkZGl0aW9uYWwgcHJpbWFyeSBjb21wYXJpc29u
cy4KClRyaWFsICBCYXNlbGluZSBwa2cgQyAgTG9hZCBzICAgICBEaXNwYXRjaGVzICBNYXggZGlz
cGF0Y2ggbXMgIFBlYWsgcGtnL1ZSQU0gQwoxICAgICAgICAgICAgICAgICAyNiAgMjguMDAxNzUy
ICAgICAgIDE3MjY5ICAgICAgICAgOC4wMjM3MDAgICAgICAgICAgICA2MS80NgoyICAgICAgICAg
ICAgICAgICA0MCAgMjguMDAyMTUzICAgICAgIDE3MjE3ICAgICAgICAgNi4xNzY1NTkgICAgICAg
ICAgICA2Ny81MgozICAgICAgICAgICAgICAgICAzNSAgMjguMDAxODQ2ICAgICAgIDE3MjIxICAg
ICAgICAgNS4zNDEyMTcgICAgICAgICAgICA2Ni81MAo0ICAgICAgICAgICAgICAgICAzOCAgMjgu
MDAxNDM2ICAgICAgIDE3MjE2ICAgICAgICAgNi4yNDk4MjcgICAgICAgICAgICA2Ny81MgoKQWxs
IHJlYWRiYWNrczogMS41OTk5MzUyOTMxOTc2MzE4LiBCb3RoIEdUcyB3ZXJlIEM2LzAgTUh6IGF0
IGV2ZXJ5IGNvb2xkb3duCmFuZCBmb2xsb3ctdXAgY2hlY2twb2ludC4gRmlyc3QtdG8tbGFzdCBj
b29sZG93biBjaGVja3BvaW50IGNvdW50ZXIgZGVsdGFzCmdhdmUgOTkuOTk0LTk5Ljk5NiUgR1Qg
aWRsZTsgdGhpcyBleGNsdWRlcyB0aGUgaW1tZWRpYXRlIGxvYWQgdGFpbC4gQ1BVCm1heGltdW0g
d2FzIDU0Ljg3NSBDLCBhbGwgZWlnaHQgY2FzZS1mYW4gdGFjaCBzaWduYWxzIHN0YXllZCBwb3Np
dGl2ZSwgYW5kCmNvb2xpbmcgaGFkIG5vIHJlc3RhcnQvY3V0b2ZmLiBBdXhpbGlhcnkgVlJBTSBy
ZWFjaGVkIDU0IEMgaW4gdHJpYWwgNC4KCkF1eGlsaWFyeSB0ZW1wZXJhdHVyZXMgYW5kIEdQVSBm
YW4gZmVlZGJhY2sKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tClRl
bXBlcmF0dXJlIHR1cGxlcyBiZWxvdyBhcmUgcGtnL1ZSQU0vbWN0cmwvUENJZSwgYWxsIGluIEMu
IFdpdGhpbiBlYWNoCnRyaWFsLCBhbGwgc2l4IGNvb2xkb3duIHRlbXBlcmF0dXJlIHR1cGxlcyB3
ZXJlIGlkZW50aWNhbC4gQXQgKzUgcywgZWFjaAp0cmlhbCBzdGlsbCBoYWQgaXRzICsxIHMgdHVw
bGU7IFZSQU0gY2hhbmdlZCBsYXRlciBpbiB0aGUgd2FrZSB0cmlhbHMuCgpUcmlhbCAgQXJtICAg
Q29vbGRvd24gZW5kICArMSBzICAgICAgICAgKzE1IHMgICAgICAgICszMCBzCjEgICAgICBzaGFt
ICA1Ny80Ni80My81NiAgIDU3LzQ2LzQzLzU2ICAgNTcvNDYvNDMvNTYgIDU3LzQ2LzQzLzU2CjIg
ICAgICB3YWtlICA2NC81Mi80OC82MyAgIDM5LzUyLzI5LzQwICAgMzkvNDQvMjkvNDAgIDM5LzM2
LzI5LzQwCjMgICAgICB3YWtlICA2My81MC80Ny82MiAgIDM5LzUwLzMwLzQwICAgMzkvNDYvMzAv
NDAgIDM5LzM4LzMwLzQwCjQgICAgICBzaGFtICA2My81NC80OC82MiAgIDYzLzU0LzQ4LzYyICAg
NjMvNTQvNDgvNjIgIDYzLzU0LzQ4LzYyCgpUcmlhbCAgR1BVIGZhbjEgUlBNOiBjb29sZG93biBl
bmQgICArMSBzICAgKzUgcyAgICsxNSBzICAgKzMwIHMKMSAgICAgICAgICAgICAgICAgICAgICAg
ICAgICA5NzggICAgOTQ5ICAgIDk3NSAgICAgOTc4ICAgICA5NzYKMiAgICAgICAgICAgICAgICAg
ICAgICAgICAgIDEyNTQgICAgNjUzICAgICAzMCAgICAgIDEyICAgICAgMjAKMyAgICAgICAgICAg
ICAgICAgICAgICAgICAgIDEyMDYgICAgNTkzICAgICAxNSAgICAgIDEyICAgICAyODQKNCAgICAg
ICAgICAgICAgICAgICAgICAgICAgIDEyNTMgICAxMjQ2ICAgMTI0NCAgICAxMjUzICAgIDEyNTUK
ClRoZXNlIGZhbiBpbnB1dHMgYXJlIGRyaXZlci1yZXBvcnRlZCBpbnRlcnZhbCBhdmVyYWdlcywg
bm90IGluZGVwZW5kZW50CnRhY2hvbWV0cnkgb3IgcHJvb2Ygb2YgYWN0dWFsIGZhbiBzdG9wLiBJ
bml0aWFsIHdhcm0tdXAgcmVhZGluZ3MgYXJlIG9taXR0ZWQuCgpFeGlzdGluZyBjYXJkLWVuZXJn
eS1jb3VudGVyIGNvbnRleHQKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCkRl
bHRhIGpvdWxlcyAvIGRlbHRhIHB1YmxpY2F0aW9uIHNlY29uZHMsIHVuZGVyIHRoZSBkZWxpYmVy
YXRlIEQwIGhvbGQ6CgpUcmlhbCAgQXJtICAgQmFzZWxpbmUgVyAgTGF0ZSBjb29sZG93biBXICBG
b2xsb3ctdXAgVwoxICAgICAgc2hhbSAgICAgICAgNC40NCAgICAgICAgICAgIDQxLjA3ICAgICAg
ICA0MC40OQoyICAgICAgd2FrZSAgICAgICAgNC40OCAgICAgICAgICAgIDQxLjc4ICAgICAgICAg
NC4zNwozICAgICAgd2FrZSAgICAgICAgNC4zNiAgICAgICAgICAgIDQxLjUwICAgICAgICAgOC40
Nwo0ICAgICAgc2hhbSAgICAgICAgNC4zNiAgICAgICAgICAgIDQxLjY5ICAgICAgICA0Mi4zMwoK
TW9ub3RvbmljIGNhcmQgY291bnRlcnMsIGV4aXN0aW5nIFJBTSBwdWJsaWNhdGlvbnMsIHBoYXNl
IGVkZ2VzIG9taXR0ZWQuCkludGVydmFsczogYmFzZWxpbmUgMjMtMjUgcywgbGF0ZSBjb29sZG93
biAxMTYgcywgZm9sbG93LXVwIDIyLTIzIHMuIEludGVnZXIKcHVibGljYXRpb24gdGltZXN0YW1w
cyBjYXVzZSByYXRlIHF1YW50aXphdGlvbi4gVGhlc2UgYXJlIG5vdCBleHRlcm5hbC1tZXRlcgpt
ZWFzdXJlbWVudHMsIGlzb2xhdGVkIHB1bHNlIGNvc3RzLCB3aG9sZS1ob3N0IHdhdHRzIG9yIG5v
cm1hbC1hdXRvIHNhdmluZ3MuCgpUcmlhbCAzJ3MgYXBwcm94aW1hdGUgKzIzLjUxMiB0byArMjYu
NTEyIHMgcHVibGljYXRpb24gaW50ZXJ2YWwgcm9zZSB0bwozNC41MyBjb3VudGVyLWRlcml2ZWQg
VzsgZmFuMSByZXBvcnRlZCAyODQgUlBNIGF0ICszMCBzIHdoaWxlIHBhY2thZ2Ugc3RheWVkCjM5
IEMuIE5vIHRhcmdldCBqb2IvZm9yY2V3YWtlIGNhbGxiYWNrIHdhcyBjYXB0dXJlZCBkdXJpbmcg
dGhhdCBmb2xsb3ctdXAuClRoZSBjYXVzZSBpcyB1bnJlc29sdmVkOyBhIGR1cmFibGUgbG93LXBv
d2VyL2Zhbi1jb250cm9sIGZpeCBpcyBub3QgcHJvdmVuLgoKVHJhY2UgYXR0cmlidXRpb24KLS0t
LS0tLS0tLS0tLS0tLS0KUnVuLXdpZGUgcHJvYmUgY291bnRzIChub3QgdGFyZ2V0LW9ubHkpOiBo
d21vbiBlbnRyeS9yZXR1cm4gMTA1OTIvMTA1OTI7CmZvcmNld2FrZSBnZXQvcmV0dXJuIDM1MC8z
NTAgYW5kIHB1dC9yZXR1cm4gMzUwLzM1MC4gWmVybyByaW5nLWJ1ZmZlciBsb3NzLAptYWxmb3Jt
ZWQgcHJvYmUgcmVjb3Jkcywgb3IgcmVjb3JkZWQgcHJvYmUgbWlzc2VzLgoKQWxsIGZvdXIgcHJp
bWFyeSBhbmQgZm91ciBub3JtYWxpemF0aW9uIGNvbXBhcmlzb25zIHBhc3NlZCB0aGUgYXVkaXQ6
CnR3byBvd24gc3VjY2Vzc2Z1bCBwYWNrYWdlIGNhbGxiYWNrcywgcGFpcmVkIGluc2lkZSB0aGVp
ciB0aW1lZCByZWFkczsKY2FsaWJyYXRlZCBtb25vdG9uaWMgbWFya2Vyczsgbm8gZm9yZWlnbiB0
YXJnZXQvdW5rbm93bi1kZXZpY2UgcmVhZCwKZm9yZWlnbiB0YXJnZXQgZm9yY2V3YWtlLCB0YXJn
ZXQgam9iLCBvciB1bm1hdGNoZWQgY2FsbGJhY2sgaW4gdGhlIHdpbmRvdy4KRWFjaCB3YWtlIGFj
cXVpcmVkIHR3byBkaXN0aW5jdCBHVCByZWZlcmVuY2VzIGR1cmluZyBvcGVuLiBSZXF1ZXN0ZWQg
QUxMCm1hcmtlciAweDEwMDAwOyByZXR1cm5lZCByZWZzIDB4MTAwMDMvMHgxMTgyOS4gQ2xvc2Ug
cmVsZWFzZWQgd2l0aCAweDEwMDAwLAp3aGljaCBzdG9jayBYZSBleHBhbmRzIHRvIHRoZSBpbml0
aWFsaXplZCBkb21haW5zLiBBQ0sgaXMgbm90IHNlbnNvci1yZWFkeS4KCkZvciBlYWNoIHNhbXBs
ZWQgY29vbGRvd24gKGZpcnN0IH4rNSBzIGNoZWNrcG9pbnQgdGhyb3VnaCB0aGUgcHJlLXByaW1h
cnkKcmVhZCksIDEzMDYgdGFyZ2V0IGh3bW9uIGNhbGxiYWNrcywgemVybyB0YXJnZXQgam9icyBh
bmQgemVybyB0YXJnZXQgZm9yY2V3YWtlCmNhbGxzIHdlcmUgY2FwdHVyZWQuIEVhY2ggMzAgcyBm
b2xsb3ctdXAgYWxzbyBoYWQgemVybyB0YXJnZXQgam9icy9mb3JjZXdha2UuCkh3bW9uIHRyYWNp
bmcgd2FzIGNvbnRpbnVvdXM7IFBNLWdldC9mb3JjZXdha2Uvam9iIHRyYWNpbmcgd2FzIGRpc2Fi
bGVkIGR1cmluZwpjb21wdXRlIGRpc3BhdGNoZXMuIFRoaXMgZG9lcyBub3Qgb2JzZXJ2ZSBldmVy
eSBhdXRvbm9tb3VzIGZpcm13YXJlIGFjdGlvbi4KCkRldmlhdGlvbnMsIGxpbWl0cyBhbmQgcmV0
YWluZWQgZXZpZGVuY2UKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KRWFy
bGllciBwYXJ0aWFsIHJ1biBiNzAtcDEtZDEtMjAyNjA5MjktYiBjb21wbGV0ZWQgb25lIHNoYW0g
KDU3LT41NyBDKSwgdGhlbgpzdG9wcGVkIGJlZm9yZSB0cmlhbCAyJ3Mgbm9ybWFsaXphdGlvbiBj
b21wYXJpc29uOiBhbiBvcHRpb25hbCBmYW4gcmVhZApyZXR1cm5lZCAtRUFHQUlOIGFuZCBleHBv
c2VkIGEgYnVmZmVyZWQgUHl0aG9uIHJlYWRlciBlcnJvci4gUmF3IHJlYWRpbmcgYW5kCm9wdGlv
bmFsLWVycm9yIGhhbmRsaW5nIHdlcmUgY29ycmVjdGVkLiBUaGF0IHJ1biBpcyByZXRhaW5lZCBz
ZXBhcmF0ZWx5LgoKRHVyaW5nIHRoZSBjb21wbGV0ZSBydW4sIEdpdE9wcyB1bmRpZCB0aGUgaW50
ZW5kZWQgYXBwbGljYXRpb24gcGF1c2UgYW5kCmNyZWF0ZWQgYSByZXBsYWNlbWVudCBMTE0gUG9k
IGF0IDA2OjE4OjMwIFVUQy4gSXQgcmVtYWluZWQgcGVuZGluZyB1bnRpbAowNjozMjozNCwgYWZ0
ZXIgdGhlIGRpYWdub3N0aWMgZmluaXNoZWQgYXQgMDY6MzI6MzIuNDg2MDcyIGFuZCB0aGUgbGFz
dApwcmltYXJ5IGNvbXBhcmlzb24gYXQgMDY6MzI6MDIuNDU2ODIxLiBObyBjb21wZXRpbmcgdGFy
Z2V0IGpvYiB3YXMgY2FwdHVyZWQKaW4gdGhlIG1lYXN1cmVkIHF1aWV0IHdpbmRvd3MuIEZ1dHVy
ZSBsb25nLXJ1biBjb29yZGluYXRpb24gbmVlZHMgYSBkdXJhYmxlCmhvbGQvbGl2ZS1zdGF0ZSBn
dWFyZC4gQm90aCBydW5zJyBQTS9hcHBsaWNhdGlvbiBzdGF0ZSBhbmQgY2xlYW51cCBwYXNzZWQu
CgpPbmUgY2FyZCwgdHdvIHRyaWFscyBwZXIgYXJtLCBmaXhlZCBzZXF1ZW50aWFsIG9yZGVyLCBk
aWZmZXJpbmcgc3RhcnRpbmcKdGVtcGVyYXR1cmVzIGFuZCBkeW5hbWljYWxseSByZXNwb25kaW5n
IGNhc2UgZmFucy4gTm9ybWFsaXphdGlvbiBpcyBpdHNlbGYKYW4gaW50ZXJ2ZW50aW9uLiBUaGUg
ZGF0YSBzdXBwb3J0IGN1cnJlbnQtZmlybXdhcmUgd2FrZS1zZW5zaXRpdmUgcHVibGljYXRpb24K
YW5kIGNvdXBsZWQgZmFuL2NvdW50ZXIgY2hhbmdlcywgbm90IGluZGVwZW5kZW50IHBoeXNpY2Fs
IHRoZXJtb21ldHJ5LCBhCnVuaXZlcnNhbCBkZWxheS9taW5pbXVtIGRvbWFpbiwgZmlybXdhcmUt
b25seSBjYXVzYWxpdHksIG9yIGFuIFJGQyBib290IHRlc3QuCgpDb21wYW5pb246IGI3MC1kMS1z
dW1tYXJ5LTIwMjYtMDktMjkuanNvbiAodW5pdHMgYW5kIHRpbWluZyBkZWZpbml0aW9ucyBpbnNp
ZGUpLgpSYXcgcmVjb3JkcyBhbmQgZXhhY3QgZXhlY3V0ZWQgbWVhc3VyZW1lbnQgY29kZSBhcmUg
YXZhaWxhYmxlIG9uIHJlcXVlc3QuClJldGFpbmVkIHJlc3VsdCBhcmNoaXZlIFNIQS0yNTYsIGNv
bXBsZXRlIHJ1bjoKYmQ1OTRkNjA2OWFlYTBiOTQ3MWZjNmZlNGUyNzIyZDA5ZjlkOGIyMGI1YWEz
ODk3MWEzN2U5ZDNlZjgxZDZiOQpSZXRhaW5lZCByZXN1bHQgYXJjaGl2ZSBTSEEtMjU2LCBlYXJs
aWVyIHBhcnRpYWwgcnVuOgoxZDQzYzlmY2E2NTVmMDM0YWEwYTVlYjdmNzJjNmEwYzk4MzRkZWVi
M2I3ZDNkNTc2NmFhNDJiNDBiYjgxZjY3Cg==
--000000000000bfc866065c9dea58
Content-Type: application/json; name="b70-d1-summary-2026-09-29.json"
Content-Disposition: attachment; filename="b70-d1-summary-2026-09-29.json"
Content-Transfer-Encoding: base64
Content-ID: <f_mummiimq1>
X-Attachment-Id: f_mummiimq1

ewogICJzY2hlbWFfdmVyc2lvbiI6IDEsCiAgInRpdGxlIjogIkI3MCBEMSBtYXRjaGVkIGRpYWdu
b3N0aWMsIDIwMjYtMDktMjkiLAogICJjb21wbGV0ZV9ydW5faWQiOiAiYjcwLXAxLWQxLTIwMjYw
OTI5LWMiLAogICJlbnZpcm9ubWVudCI6IHsKICAgICJHUFUiOiAiSW50ZWwgQXJjIFBybyBCNzAi
LAogICAgIlBDSV92ZW5kb3JfZGV2aWNlIjogIjgwODY6ZTIyMyIsCiAgICAidGFyZ2V0X0JERiI6
ICIwMDAwOjA4OjAwLjAiLAogICAgImtlcm5lbCI6ICI3LjEuMTAtMjAwLmZjNDQueDg2XzY0IiwK
ICAgICJPUyI6ICJGZWRvcmEgQ29yZU9TIDQ0LjIwMjYwODI5LjMuMSIsCiAgICAiUkZDX3BhdGNo
X2luc3RhbGxlZCI6IGZhbHNlLAogICAgImJvYXJkX2Zpcm13YXJlIjogewogICAgICAiRldDT0RF
IjogIjMxLjEwNjIiLCAiRldEQVRBIjogIjIwMy40NiIsICJPcHRpb25ST00iOiAiMjMuMTA2Ni4w
LjAiLAogICAgICAidmVyaWZpZWRfZGF0ZSI6ICIyMDI2LTA5LTI3IiwKICAgICAgInF1ZXJpZWRf
ZHVyaW5nX0QxIjogZmFsc2UKICAgIH0sCiAgICAiT3BlbkNMX3J1bnRpbWVfaW1hZ2UiOiAiZ2hj
ci5pby9tb3N0bHlnZWVrL2xsYW1hLXN3YXA6aW50ZWwiLAogICAgInJ1bnRpbWVfaW1hZ2VfY29u
ZmlnX3NoYTI1NiI6ICJmYTZiOTg0ZDk0OTEzZTBkOGRiYzc1YTFiN2MwODZlNTIyMTU0ZDYzOGVl
YTJmYjcwNjU4MzFiYmNhZmU5MDBhIiwKICAgICJpbWFnZV9wdWxsX3BvbGljeSI6ICJOZXZlciIs
CiAgICAidGFyZ2V0X3Bvd2VyX2NvbnRyb2xfZHVyaW5nX0QxIjogIm9uIiwKICAgICJvcmlnaW5h
bF9hbmRfcmVzdG9yZWRfcG93ZXJfY29udHJvbCI6ICJhdXRvIiwKICAgICJhdXRvc3VzcGVuZF9k
ZWxheV9tcyI6IDEwMDAsCiAgICAiZXhpc3RpbmdfY29vbGluZ19hbmRfY29sbGVjdGlvbl9lbmFi
bGVkIjogdHJ1ZQogIH0sCiAgInByb3RvY29sIjogewogICAgIm9yZGVyIjogWyJzaGFtIiwgIndh
a2UiLCAid2FrZSIsICJzaGFtIl0sCiAgICAibm9ybWFsaXphdGlvbl9tcyI6IDIwLAogICAgImJh
c2VsaW5lX3NlY29uZHMiOiAzMCwKICAgICJ3b3JrbG9hZCI6ICJUYXJnZXQtb25seSBPcGVuQ0wg
Y2hpbGQsIHByaXZhdGUgMSBNaUIgYnVmZmVyLCBhcHByb3hpbWF0ZWx5IDI4IHMgb2Ygc2hvcnQg
ZGlzcGF0Y2hlczsgcmVhZGJhY2sgYW5kIHJlc291cmNlIHJlbGVhc2UgYmVmb3JlIHByb2Nlc3Mg
ZXhpdC9jb29sZG93bi4iLAogICAgImNvb2xkb3duX3NlY29uZHMiOiAxNTAsCiAgICAicHJpbWFy
eV9ub21pbmFsX2R3ZWxsX21zIjogMjAsCiAgICAic2hhbV9kZXNjcmlwdG9yIjogIi9kZXYvbnVs
bCIsCiAgICAid2FrZV9kZXNjcmlwdG9yIjogInRhcmdldCBHUFUgZGVidWdmcyBmb3JjZXdha2Vf
YWxsIiwKICAgICJwcmltYXJ5X2VuZHBvaW50IjogIlJlYWQgcGFja2FnZSBiZWZvcmUgb3Blbiwg
d2FpdCBhZnRlciBzdWNjZXNzZnVsIG9wZW4sIHJlYWQgcGFja2FnZSB3aGlsZSBkZXNjcmlwdG9y
IHJlbWFpbnMgb3BlbiwgdGhlbiBjbG9zZS4iLAogICAgImVsaWdpYmlsaXR5IjogIkJvdGggR1Rz
IHJlcG9ydCBDNiBhbmQgMCBNSHogYWN0dWFsIGZyZXF1ZW5jeSBiZWZvcmUgY29tcGFyaXNvbi4i
LAogICAgImZvbGxvd3VwX3NlY29uZHMiOiAzMCwKICAgICJub3JtYWxpemF0aW9uX2lzX3NlcGFy
YXRlX2ludGVydmVudGlvbiI6IHRydWUKICB9LAogICJkZWZpbml0aW9ucyI6IHsKICAgICJtQyI6
ICJtaWxsaWRlZ3JlZXMgQ2Vsc2l1czsgcmVwb3J0ZWQgdmFsdWVzLCBub3QgaW5kZXBlbmRlbnQg
dGhlcm1vbWV0cnkiLAogICAgImF1eGlsaWFyeV90ZW1wZXJhdHVyZV9hcnJheXMiOiAiQWxsIGF1
eGlsaWFyeSB0ZW1wZXJhdHVyZSBhcnJheXMgdXNlIG1DIGluIHRlbXBlcmF0dXJlX29yZGVyLCBl
eGNlcHQgbG9hZF9ndWFyZF9tYXhfcGtnX3ZyYW0sIHdob3NlIHR3byBlbnRyaWVzIGFyZSBwa2cv
VlJBTS4iLAogICAgImFybV9hbmRfa2luZCI6ICJhcm0gaXMgdGhlIHRyaWFsJ3MgcHJpbWFyeSBj
b25kaXRpb247IGtpbmQgaXMgdGhlIGFjdHVhbCBjb21wYXJpc29uIGludGVydmVudGlvbi4gRXZl
cnkgbm9ybWFsaXphdGlvbiBpcyBraW5kPXdha2UsIGluY2x1ZGluZyBzaGFtLWFybSB0cmlhbHMu
IiwKICAgICJ0ZW1wZXJhdHVyZV9vcmRlciI6IFsicGtnIiwgInZyYW0iLCAibWN0cmwiLCAicGNp
ZSJdLAogICAgImNvb2xkb3duX2NoZWNrcG9pbnRfc2Vjb25kcyI6IFs1LCAzMCwgNjAsIDkwLCAx
MjAsIDE1MF0sCiAgICAicG9zdF9wcm9iZV9jaGVja3BvaW50X3NlY29uZHMiOiBbMSwgNSwgMTUs
IDMwXSwKICAgICJjaGVja3BvaW50X3RpbWVzIjogIk5vbWluYWwgc2Vjb25kcyB3aXRoaW4gdGhl
IG5hbWVkIG9ic2VydmF0aW9uIHBoYXNlOyBhdXhpbGlhcnkgY2hhbm5lbHMgYXJlIHJlYWQgc2Vx
dWVudGlhbGx5IG91dHNpZGUgdGhlIHByaW1hcnkgaG9sZC4iLAogICAgInRpbWluZ19uc19yZWxh
dGl2ZV90b19iZWZvcmVfcmVhZF9zdGFydCI6ICJVc2Vyc3BhY2UgbW9ub3RvbmljLWNsb2NrIG9m
ZnNldHMgaW4gbmFub3NlY29uZHMsIGJlZm9yZS1yZWFkIHN0YXJ0ID0gMC4gU3lzY2FsbCBlbnZl
bG9wZXMsIG5vdCBjb252ZXJzaW9uIHRpbWVzOyBmdHJhY2UgdGltZXN0YW1wcyBoYXZlIG1pY3Jv
c2Vjb25kIHByZWNpc2lvbi4iLAogICAgImZkX3Njb3BlX21zIjogIm9wZW4tcmV0dXJuIHRvIGNs
b3NlLXJldHVybiIsCiAgICAicHJlX3RvX3Bvc3RfbXMiOiAiYmVmb3JlLXJlYWQgc3RhcnQgdG8g
YWZ0ZXItcmVhZCBlbmQiLAogICAgInVzYWJsZV9pc29sYXRlZF93aW5kb3ciOiAiQ2FsaWJyYXRl
ZCBtYXJrZXJzLCBzdWNjZXNzZnVsIG93biBwYWNrYWdlIGNhbGxiYWNrIGluc2lkZSBlYWNoIHJl
YWQsIHBhaXJlZCBmb3JjZXdha2UgcmVmZXJlbmNlcyBhbmQgcmVsZWFzZSwgbm8gZm9yZWlnbiB0
YXJnZXQvdW5rbm93bi1kZXZpY2UgcmVhZCwgZm9yZWlnbiB0YXJnZXQgZm9yY2V3YWtlLCB0YXJn
ZXQgam9iIG9yIHVubWF0Y2hlZCBjYWxsYmFjayBhZmZlY3RpbmcgdGhlIGNvbXBhcmlzb247IHpl
cm8gcmVjb3JkZWQgdHJhY2UgbG9zcy9wcm9iZSBtaXNzZXMuIiwKICAgICJmYW4xX3JlcG9ydGVk
X3JwbSI6ICJEcml2ZXItcmVwb3J0ZWQgaW50ZXJ2YWwgYXZlcmFnZSwgbm90IGluZGVwZW5kZW50
IHRhY2hvbWV0cnk7IGluaXRpYWwgd2FybS11cCBleGNsdWRlZCBmcm9tIHRoZXNlIGNvbXBhcmlz
b25zLiIsCiAgICAiR1RfaWRsZV9wZXJjZW50IjogIlJlc2lkZW5jeS1jb3VudGVyIGRlbHRhIGJl
dHdlZW4gZmlyc3QgYW5kIGxhc3QgY29vbGRvd24gY2hlY2twb2ludCwgZGl2aWRlZCBieSBlbGFw
c2VkIHRpbWUgYmV0d2VlbiB0aGVpciByZWFkczsgZXhjbHVkZXMgaW1tZWRpYXRlIGxvYWQgdGFp
bC4iLAogICAgImNvdW50ZXJfZGVyaXZlZF9XIjogIk1vbm90b25pYyBjYXJkIGVuZXJneTEgZGVs
dGEgam91bGVzIC8gZGVsdGEgaW50ZWdlciBwdWJsaWNhdGlvbiBzZWNvbmRzLCB1c2luZyBleGlz
dGluZyBSQU0gdGV4dGZpbGVzIHVuZGVyIEQwIGhvbGQuIEJhc2VsaW5lL2ZvbGxvdy11cCBzZWxl
Y3Rpb24gZXhjbHVkZXMgZmlyc3QvbGFzdCAyIHBoYXNlIHNlY29uZHM7IGNvb2xkb3duIHNlbGVj
dGlvbiBiZWdpbnMgYXQgcGhhc2UgKzMwIHMgYW5kIGVuZHMgMiBzIGJlZm9yZSB0aGUgbmV4dCBw
aGFzZS4gTm90IGV4dGVybmFsLW1ldGVyIHZhbGlkYXRpb24sIGlzb2xhdGVkIHB1bHNlIGVuZXJn
eSwgd2hvbGUtaG9zdCBwb3dlciwgb3Igbm9ybWFsLWF1dG8gc2F2aW5ncy4iCiAgfSwKICAicHJp
bWFyeV9jb21wYXJpc29ucyI6IFsKICAgIHsKICAgICAgInRyaWFsIjogMSwgImFybSI6ICJzaGFt
IiwgInBoYXNlIjogInByaW1hcnkiLCAia2luZCI6ICJzaGFtIiwKICAgICAgImJlZm9yZV9tQyI6
IDU3MDAwLCAiYWZ0ZXJfbUMiOiA1NzAwMCwgImRlbHRhX21DIjogMCwKICAgICAgImZkX3Njb3Bl
X21zIjogMjAuMzM1MzQ2LCAicHJlX3RvX3Bvc3RfbXMiOiAyMC42MzQ2NzQsCiAgICAgICJvd25f
cGFja2FnZV9yZWFkcyI6IDIsICJvd25fZm9yY2V3YWtlX2dldHMiOiAwLCAib3duX2ZvcmNld2Fr
ZV9wdXRzIjogMCwKICAgICAgInVzYWJsZV9pc29sYXRlZF93aW5kb3ciOiB0cnVlLAogICAgICAi
dGltaW5nX25zX3JlbGF0aXZlX3RvX2JlZm9yZV9yZWFkX3N0YXJ0IjogewogICAgICAgICJiZWZv
cmVfcmVhZF9lbmQiOiAyNDQ2OTcsICJvcGVuX2NhbGwiOiAyNDcxOTcsICJvcGVuX3JldHVybiI6
IDMwNjM4NywKICAgICAgICAiYWZ0ZXJfcmVhZF9zdGFydCI6IDIwMzY2MTE2LCAiYWZ0ZXJfcmVh
ZF9lbmQiOiAyMDYzNDY3NCwKICAgICAgICAiY2xvc2VfY2FsbCI6IDIwNjQwNDIzLCAiY2xvc2Vf
cmV0dXJuIjogMjA2NDE3MzMKICAgICAgfQogICAgfSwKICAgIHsKICAgICAgInRyaWFsIjogMiwg
ImFybSI6ICJ3YWtlIiwgInBoYXNlIjogInByaW1hcnkiLCAia2luZCI6ICJ3YWtlIiwKICAgICAg
ImJlZm9yZV9tQyI6IDY0MDAwLCAiYWZ0ZXJfbUMiOiAzOTAwMCwgImRlbHRhX21DIjogLTI1MDAw
LAogICAgICAiZmRfc2NvcGVfbXMiOiAyMC4xMTQyMTksICJwcmVfdG9fcG9zdF9tcyI6IDIwLjg1
Mjc4MiwKICAgICAgIm93bl9wYWNrYWdlX3JlYWRzIjogMiwgIm93bl9mb3JjZXdha2VfZ2V0cyI6
IDIsICJvd25fZm9yY2V3YWtlX3B1dHMiOiAyLAogICAgICAidXNhYmxlX2lzb2xhdGVkX3dpbmRv
dyI6IHRydWUsCiAgICAgICJ0aW1pbmdfbnNfcmVsYXRpdmVfdG9fYmVmb3JlX3JlYWRfc3RhcnQi
OiB7CiAgICAgICAgImJlZm9yZV9yZWFkX2VuZCI6IDI0MDM2OCwgIm9wZW5fY2FsbCI6IDI0MzE5
OCwgIm9wZW5fcmV0dXJuIjogNzY5ODczLAogICAgICAgICJhZnRlcl9yZWFkX3N0YXJ0IjogMjA4
MjgzNDIsICJhZnRlcl9yZWFkX2VuZCI6IDIwODUyNzgyLAogICAgICAgICJjbG9zZV9jYWxsIjog
MjA4NTc0MjIsICJjbG9zZV9yZXR1cm4iOiAyMDg4NDA5MgogICAgICB9CiAgICB9LAogICAgewog
ICAgICAidHJpYWwiOiAzLCAiYXJtIjogIndha2UiLCAicGhhc2UiOiAicHJpbWFyeSIsICJraW5k
IjogIndha2UiLAogICAgICAiYmVmb3JlX21DIjogNjMwMDAsICJhZnRlcl9tQyI6IDM5MDAwLCAi
ZGVsdGFfbUMiOiAtMjQwMDAsCiAgICAgICJmZF9zY29wZV9tcyI6IDIwLjEwNDY0OSwgInByZV90
b19wb3N0X21zIjogMjAuODQxOTAyLAogICAgICAib3duX3BhY2thZ2VfcmVhZHMiOiAyLCAib3du
X2ZvcmNld2FrZV9nZXRzIjogMiwgIm93bl9mb3JjZXdha2VfcHV0cyI6IDIsCiAgICAgICJ1c2Fi
bGVfaXNvbGF0ZWRfd2luZG93IjogdHJ1ZSwKICAgICAgInRpbWluZ19uc19yZWxhdGl2ZV90b19i
ZWZvcmVfcmVhZF9zdGFydCI6IHsKICAgICAgICAiYmVmb3JlX3JlYWRfZW5kIjogMjQyNTU4LCAi
b3Blbl9jYWxsIjogMjQ1MTM4LCAib3Blbl9yZXR1cm4iOiA3NjU5OTMsCiAgICAgICAgImFmdGVy
X3JlYWRfc3RhcnQiOiAyMDgyMjY0MiwgImFmdGVyX3JlYWRfZW5kIjogMjA4NDE5MDIsCiAgICAg
ICAgImNsb3NlX2NhbGwiOiAyMDg0NDcxMiwgImNsb3NlX3JldHVybiI6IDIwODcwNjQyCiAgICAg
IH0KICAgIH0sCiAgICB7CiAgICAgICJ0cmlhbCI6IDQsICJhcm0iOiAic2hhbSIsICJwaGFzZSI6
ICJwcmltYXJ5IiwgImtpbmQiOiAic2hhbSIsCiAgICAgICJiZWZvcmVfbUMiOiA2MzAwMCwgImFm
dGVyX21DIjogNjMwMDAsICJkZWx0YV9tQyI6IDAsCiAgICAgICJmZF9zY29wZV9tcyI6IDIwLjMw
Njk2NiwgInByZV90b19wb3N0X21zIjogMjAuNjA2OTg0LAogICAgICAib3duX3BhY2thZ2VfcmVh
ZHMiOiAyLCAib3duX2ZvcmNld2FrZV9nZXRzIjogMCwgIm93bl9mb3JjZXdha2VfcHV0cyI6IDAs
CiAgICAgICJ1c2FibGVfaXNvbGF0ZWRfd2luZG93IjogdHJ1ZSwKICAgICAgInRpbWluZ19uc19y
ZWxhdGl2ZV90b19iZWZvcmVfcmVhZF9zdGFydCI6IHsKICAgICAgICAiYmVmb3JlX3JlYWRfZW5k
IjogMjM4MzY3LCAib3Blbl9jYWxsIjogMjQxMjI3LCAib3Blbl9yZXR1cm4iOiAzMDMzNzcsCiAg
ICAgICAgImFmdGVyX3JlYWRfc3RhcnQiOiAyMDM1OTI3NiwgImFmdGVyX3JlYWRfZW5kIjogMjA2
MDY5ODQsCiAgICAgICAgImNsb3NlX2NhbGwiOiAyMDYwOTcxMywgImNsb3NlX3JldHVybiI6IDIw
NjEwMzQzCiAgICAgIH0KICAgIH0KICBdLAogICJub3JtYWxpemF0aW9uX2NvbXBhcmlzb25zIjog
WwogICAgewogICAgICAidHJpYWwiOiAxLCAiYXJtIjogInNoYW0iLCAicGhhc2UiOiAibm9ybWFs
aXphdGlvbiIsICJraW5kIjogIndha2UiLAogICAgICAiYmVmb3JlX21DIjogMjcwMDAsICJhZnRl
cl9tQyI6IDI2MDAwLCAiZGVsdGFfbUMiOiAtMTAwMCwKICAgICAgImZkX3Njb3BlX21zIjogMjAu
MDcwMjksICJwcmVfdG9fcG9zdF9tcyI6IDIwLjc4MjY0MiwKICAgICAgIm93bl9wYWNrYWdlX3Jl
YWRzIjogMiwgIm93bl9mb3JjZXdha2VfZ2V0cyI6IDIsICJvd25fZm9yY2V3YWtlX3B1dHMiOiAy
LAogICAgICAidXNhYmxlX2lzb2xhdGVkX3dpbmRvdyI6IHRydWUsCiAgICAgICJ0aW1pbmdfbnNf
cmVsYXRpdmVfdG9fYmVmb3JlX3JlYWRfc3RhcnQiOiB7CiAgICAgICAgImJlZm9yZV9yZWFkX2Vu
ZCI6IDM1ODUyNiwgIm9wZW5fY2FsbCI6IDM2MDU4NiwgIm9wZW5fcmV0dXJuIjogNzQwMzcyLAog
ICAgICAgICJhZnRlcl9yZWFkX3N0YXJ0IjogMjA3NzI0OTIsICJhZnRlcl9yZWFkX2VuZCI6IDIw
NzgyNjQyLAogICAgICAgICJjbG9zZV9jYWxsIjogMjA3ODQ5MzIsICJjbG9zZV9yZXR1cm4iOiAy
MDgxMDY2MgogICAgICB9CiAgICB9LAogICAgewogICAgICAidHJpYWwiOiAyLCAiYXJtIjogIndh
a2UiLCAicGhhc2UiOiAibm9ybWFsaXphdGlvbiIsICJraW5kIjogIndha2UiLAogICAgICAiYmVm
b3JlX21DIjogNTcwMDAsICJhZnRlcl9tQyI6IDQwMDAwLCAiZGVsdGFfbUMiOiAtMTcwMDAsCiAg
ICAgICJmZF9zY29wZV9tcyI6IDIwLjEwMDU2OSwgInByZV90b19wb3N0X21zIjogMjAuOTkwMDQs
CiAgICAgICJvd25fcGFja2FnZV9yZWFkcyI6IDIsICJvd25fZm9yY2V3YWtlX2dldHMiOiAyLCAi
b3duX2ZvcmNld2FrZV9wdXRzIjogMiwKICAgICAgInVzYWJsZV9pc29sYXRlZF93aW5kb3ciOiB0
cnVlLAogICAgICAidGltaW5nX25zX3JlbGF0aXZlX3RvX2JlZm9yZV9yZWFkX3N0YXJ0Ijogewog
ICAgICAgICJiZWZvcmVfcmVhZF9lbmQiOiAyMzQ1ODcsICJvcGVuX2NhbGwiOiAyMzY1MzcsICJv
cGVuX3JldHVybiI6IDkxNzc4MSwKICAgICAgICAiYWZ0ZXJfcmVhZF9zdGFydCI6IDIwOTczNDMw
LCAiYWZ0ZXJfcmVhZF9lbmQiOiAyMDk5MDA0MCwKICAgICAgICAiY2xvc2VfY2FsbCI6IDIwOTky
NTMwLCAiY2xvc2VfcmV0dXJuIjogMjEwMTgzNTAKICAgICAgfQogICAgfSwKICAgIHsKICAgICAg
InRyaWFsIjogMywgImFybSI6ICJ3YWtlIiwgInBoYXNlIjogIm5vcm1hbGl6YXRpb24iLCAia2lu
ZCI6ICJ3YWtlIiwKICAgICAgImJlZm9yZV9tQyI6IDM5MDAwLCAiYWZ0ZXJfbUMiOiAzNTAwMCwg
ImRlbHRhX21DIjogLTQwMDAsCiAgICAgICJmZF9zY29wZV9tcyI6IDIwLjEwMjE2OSwgInByZV90
b19wb3N0X21zIjogMjAuODA3NjIyLAogICAgICAib3duX3BhY2thZ2VfcmVhZHMiOiAyLCAib3du
X2ZvcmNld2FrZV9nZXRzIjogMiwgIm93bl9mb3JjZXdha2VfcHV0cyI6IDIsCiAgICAgICJ1c2Fi
bGVfaXNvbGF0ZWRfd2luZG93IjogdHJ1ZSwKICAgICAgInRpbWluZ19uc19yZWxhdGl2ZV90b19i
ZWZvcmVfcmVhZF9zdGFydCI6IHsKICAgICAgICAiYmVmb3JlX3JlYWRfZW5kIjogMzY3NjM3LCAi
b3Blbl9jYWxsIjogMzY5MzI3LCAib3Blbl9yZXR1cm4iOiA3MzQ5NDMsCiAgICAgICAgImFmdGVy
X3JlYWRfc3RhcnQiOiAyMDc5Mzk2MiwgImFmdGVyX3JlYWRfZW5kIjogMjA4MDc2MjIsCiAgICAg
ICAgImNsb3NlX2NhbGwiOiAyMDgwOTgwMiwgImNsb3NlX3JldHVybiI6IDIwODM3MTEyCiAgICAg
IH0KICAgIH0sCiAgICB7CiAgICAgICJ0cmlhbCI6IDQsICJhcm0iOiAic2hhbSIsICJwaGFzZSI6
ICJub3JtYWxpemF0aW9uIiwgImtpbmQiOiAid2FrZSIsCiAgICAgICJiZWZvcmVfbUMiOiAzOTAw
MCwgImFmdGVyX21DIjogMzgwMDAsICJkZWx0YV9tQyI6IC0xMDAwLAogICAgICAiZmRfc2NvcGVf
bXMiOiAyMC4xMjgwMTksICJwcmVfdG9fcG9zdF9tcyI6IDIxLjAxMzIzLAogICAgICAib3duX3Bh
Y2thZ2VfcmVhZHMiOiAyLCAib3duX2ZvcmNld2FrZV9nZXRzIjogMiwgIm93bl9mb3JjZXdha2Vf
cHV0cyI6IDIsCiAgICAgICJ1c2FibGVfaXNvbGF0ZWRfd2luZG93IjogdHJ1ZSwKICAgICAgInRp
bWluZ19uc19yZWxhdGl2ZV90b19iZWZvcmVfcmVhZF9zdGFydCI6IHsKICAgICAgICAiYmVmb3Jl
X3JlYWRfZW5kIjogMjM2NDI4LCAib3Blbl9jYWxsIjogMjM4NDM4LCAib3Blbl9yZXR1cm4iOiA5
MTU5NTEsCiAgICAgICAgImFmdGVyX3JlYWRfc3RhcnQiOiAyMDk4NDQyMCwgImFmdGVyX3JlYWRf
ZW5kIjogMjEwMTMyMzAsCiAgICAgICAgImNsb3NlX2NhbGwiOiAyMTAxNjc4MCwgImNsb3NlX3Jl
dHVybiI6IDIxMDQzOTcwCiAgICAgIH0KICAgIH0KICBdLAogICJhdXhpbGlhcnlfdHJpYWxzIjog
WwogICAgewogICAgICAidHJpYWwiOiAxLCAiYXJtIjogInNoYW0iLAogICAgICAiYmFzZWxpbmVf
bGFzdF90ZW1wZXJhdHVyZXMiOiBbMjYwMDAsIDI2MDAwLCAxOTAwMCwgMjgwMDBdLAogICAgICAi
bG9hZF9zZWNvbmRzIjogMjguMDAxNzUyMzg0OTk2NTA3LAogICAgICAiZGlzcGF0Y2hlcyI6IDE3
MjY5LAogICAgICAibG9uZ2VzdF9kaXNwYXRjaF9tcyI6IDguMDIzNzAwMDA3NDcwMzI1LAogICAg
ICAibG9hZF9ndWFyZF9tYXhfcGtnX3ZyYW0iOiBbNjEwMDAsIDQ2MDAwXSwKICAgICAgImNvb2xk
b3duX3RlbXBlcmF0dXJlc19hdF9hbGxfc2l4X2NoZWNrcG9pbnRzIjogWzU3MDAwLCA0NjAwMCwg
NDMwMDAsIDU2MDAwXSwKICAgICAgImNvb2xkb3duX2ZhbjFfcmVwb3J0ZWRfcnBtIjogWzc1Mywg
OTc3LCA5NzgsIDk3NiwgOTc2LCA5NzhdLAogICAgICAicG9zdF9wcm9iZV90ZW1wZXJhdHVyZXMi
OiBbWzU3MDAwLCA0NjAwMCwgNDMwMDAsIDU2MDAwXSwgWzU3MDAwLCA0NjAwMCwgNDMwMDAsIDU2
MDAwXSwgWzU3MDAwLCA0NjAwMCwgNDMwMDAsIDU2MDAwXSwgWzU3MDAwLCA0NjAwMCwgNDMwMDAs
IDU2MDAwXV0sCiAgICAgICJwb3N0X3Byb2JlX2ZhbjFfcmVwb3J0ZWRfcnBtIjogWzk0OSwgOTc1
LCA5NzgsIDk3Nl0sCiAgICAgICJHVF9pZGxlX3BlcmNlbnRfYmV0d2Vlbl9maXJzdF9hbmRfbGFz
dF9jb29sZG93bl9jaGVja3BvaW50cyI6IFs5OS45OTUxMjA0NjgwMDkyNiwgOTkuOTk1MTE3MDUw
MTc1NjZdLAogICAgICAicHJpbWFyeV91dGMiOiAiMjAyNi0wOS0yOVQwNjoxOTo1MC40NDI3Njcr
MDA6MDAiLAogICAgICAiY291bnRlcl9kZXJpdmVkX1ciOiB7ImJhc2VsaW5lIjogNC40MzYzNjAs
ICJjb29sZG93biI6IDQxLjA3MzQxMSwgInBvc3RfcHJvYmUiOiA0MC40ODg5MTh9LAogICAgICAi
Y291bnRlcl9pbnRlcnZhbF9zZWNvbmRzIjogeyJiYXNlbGluZSI6IDI1LCAiY29vbGRvd24iOiAx
MTYsICJwb3N0X3Byb2JlIjogMjN9CiAgICB9LAogICAgewogICAgICAidHJpYWwiOiAyLCAiYXJt
IjogIndha2UiLAogICAgICAiYmFzZWxpbmVfbGFzdF90ZW1wZXJhdHVyZXMiOiBbNDAwMDAsIDM4
MDAwLCAzMDAwMCwgNDEwMDBdLAogICAgICAibG9hZF9zZWNvbmRzIjogMjguMDAyMTUyNTQzMDIw
MjAyLAogICAgICAiZGlzcGF0Y2hlcyI6IDE3MjE3LAogICAgICAibG9uZ2VzdF9kaXNwYXRjaF9t
cyI6IDYuMTc2NTU5MDIxNjk2NDQ4LAogICAgICAibG9hZF9ndWFyZF9tYXhfcGtnX3ZyYW0iOiBb
NjcwMDAsIDUyMDAwXSwKICAgICAgImNvb2xkb3duX3RlbXBlcmF0dXJlc19hdF9hbGxfc2l4X2No
ZWNrcG9pbnRzIjogWzY0MDAwLCA1MjAwMCwgNDgwMDAsIDYzMDAwXSwKICAgICAgImNvb2xkb3du
X2ZhbjFfcmVwb3J0ZWRfcnBtIjogWzkxNywgMTI2OSwgMTI1MywgMTI1NCwgMTI1MywgMTI1NF0s
CiAgICAgICJwb3N0X3Byb2JlX3RlbXBlcmF0dXJlcyI6IFtbMzkwMDAsIDUyMDAwLCAyOTAwMCwg
NDAwMDBdLCBbMzkwMDAsIDUyMDAwLCAyOTAwMCwgNDAwMDBdLCBbMzkwMDAsIDQ0MDAwLCAyOTAw
MCwgNDAwMDBdLCBbMzkwMDAsIDM2MDAwLCAyOTAwMCwgNDAwMDBdXSwKICAgICAgInBvc3RfcHJv
YmVfZmFuMV9yZXBvcnRlZF9ycG0iOiBbNjUzLCAzMCwgMTIsIDIwXSwKICAgICAgIkdUX2lkbGVf
cGVyY2VudF9iZXR3ZWVuX2ZpcnN0X2FuZF9sYXN0X2Nvb2xkb3duX2NoZWNrcG9pbnRzIjogWzk5
Ljk5NDc5OTcyNjcxNzAzLCA5OS45OTUwMTY1MzExODE5Ml0sCiAgICAgICJwcmltYXJ5X3V0YyI6
ICIyMDI2LTA5LTI5VDA2OjIzOjU0LjUxOTE1MSswMDowMCIsCiAgICAgICJjb3VudGVyX2Rlcml2
ZWRfVyI6IHsiYmFzZWxpbmUiOiA0LjQ3ODE2MiwgImNvb2xkb3duIjogNDEuNzgwMzYwLCAicG9z
dF9wcm9iZSI6IDQuMzY1NjMwfSwKICAgICAgImNvdW50ZXJfaW50ZXJ2YWxfc2Vjb25kcyI6IHsi
YmFzZWxpbmUiOiAyNSwgImNvb2xkb3duIjogMTE2LCAicG9zdF9wcm9iZSI6IDIzfQogICAgfSwK
ICAgIHsKICAgICAgInRyaWFsIjogMywgImFybSI6ICJ3YWtlIiwKICAgICAgImJhc2VsaW5lX2xh
c3RfdGVtcGVyYXR1cmVzIjogWzM1MDAwLCAzNjAwMCwgMjYwMDAsIDM2MDAwXSwKICAgICAgImxv
YWRfc2Vjb25kcyI6IDI4LjAwMTg0NjQ5MTk5OTQ2LAogICAgICAiZGlzcGF0Y2hlcyI6IDE3MjIx
LAogICAgICAibG9uZ2VzdF9kaXNwYXRjaF9tcyI6IDUuMzQxMjE2OTgwMDEzOTk2LAogICAgICAi
bG9hZF9ndWFyZF9tYXhfcGtnX3ZyYW0iOiBbNjYwMDAsIDUwMDAwXSwKICAgICAgImNvb2xkb3du
X3RlbXBlcmF0dXJlc19hdF9hbGxfc2l4X2NoZWNrcG9pbnRzIjogWzYzMDAwLCA1MDAwMCwgNDcw
MDAsIDYyMDAwXSwKICAgICAgImNvb2xkb3duX2ZhbjFfcmVwb3J0ZWRfcnBtIjogWzg2OSwgMTIx
NCwgMTIwOCwgMTIwNiwgMTIwNiwgMTIwNl0sCiAgICAgICJwb3N0X3Byb2JlX3RlbXBlcmF0dXJl
cyI6IFtbMzkwMDAsIDUwMDAwLCAzMDAwMCwgNDAwMDBdLCBbMzkwMDAsIDUwMDAwLCAzMDAwMCwg
NDAwMDBdLCBbMzkwMDAsIDQ2MDAwLCAzMDAwMCwgNDAwMDBdLCBbMzkwMDAsIDM4MDAwLCAzMDAw
MCwgNDAwMDBdXSwKICAgICAgInBvc3RfcHJvYmVfZmFuMV9yZXBvcnRlZF9ycG0iOiBbNTkzLCAx
NSwgMTIsIDI4NF0sCiAgICAgICJHVF9pZGxlX3BlcmNlbnRfYmV0d2Vlbl9maXJzdF9hbmRfbGFz
dF9jb29sZG93bl9jaGVja3BvaW50cyI6IFs5OS45OTQyODczNTExOTg4OCwgOTkuOTk0NDg5NDg2
OTAzMzJdLAogICAgICAicHJpbWFyeV91dGMiOiAiMjAyNi0wOS0yOVQwNjoyNzo1OC40ODc5NDQr
MDA6MDAiLAogICAgICAiY291bnRlcl9kZXJpdmVkX1ciOiB7ImJhc2VsaW5lIjogNC4zNTczNTgs
ICJjb29sZG93biI6IDQxLjQ5ODc5NiwgInBvc3RfcHJvYmUiOiA4LjQ3MTA4M30sCiAgICAgICJj
b3VudGVyX2ludGVydmFsX3NlY29uZHMiOiB7ImJhc2VsaW5lIjogMjMsICJjb29sZG93biI6IDEx
NiwgInBvc3RfcHJvYmUiOiAyM30KICAgIH0sCiAgICB7CiAgICAgICJ0cmlhbCI6IDQsICJhcm0i
OiAic2hhbSIsCiAgICAgICJiYXNlbGluZV9sYXN0X3RlbXBlcmF0dXJlcyI6IFszODAwMCwgMzYw
MDAsIDI5MDAwLCAzOTAwMF0sCiAgICAgICJsb2FkX3NlY29uZHMiOiAyOC4wMDE0MzYxNzAwMTU5
NSwKICAgICAgImRpc3BhdGNoZXMiOiAxNzIxNiwKICAgICAgImxvbmdlc3RfZGlzcGF0Y2hfbXMi
OiA2LjI0OTgyNzAxMjY1MjUzMSwKICAgICAgImxvYWRfZ3VhcmRfbWF4X3BrZ192cmFtIjogWzY3
MDAwLCA1MjAwMF0sCiAgICAgICJjb29sZG93bl90ZW1wZXJhdHVyZXNfYXRfYWxsX3NpeF9jaGVj
a3BvaW50cyI6IFs2MzAwMCwgNTQwMDAsIDQ4MDAwLCA2MjAwMF0sCiAgICAgICJjb29sZG93bl9m
YW4xX3JlcG9ydGVkX3JwbSI6IFs5MTIsIDEyNTcsIDEyNTUsIDEyNTMsIDEyNTMsIDEyNTNdLAog
ICAgICAicG9zdF9wcm9iZV90ZW1wZXJhdHVyZXMiOiBbWzYzMDAwLCA1NDAwMCwgNDgwMDAsIDYy
MDAwXSwgWzYzMDAwLCA1NDAwMCwgNDgwMDAsIDYyMDAwXSwgWzYzMDAwLCA1NDAwMCwgNDgwMDAs
IDYyMDAwXSwgWzYzMDAwLCA1NDAwMCwgNDgwMDAsIDYyMDAwXV0sCiAgICAgICJwb3N0X3Byb2Jl
X2ZhbjFfcmVwb3J0ZWRfcnBtIjogWzEyNDYsIDEyNDQsIDEyNTMsIDEyNTVdLAogICAgICAiR1Rf
aWRsZV9wZXJjZW50X2JldHdlZW5fZmlyc3RfYW5kX2xhc3RfY29vbGRvd25fY2hlY2twb2ludHMi
OiBbOTkuOTk0NTQ2OTgzOTc1OSwgOTkuOTk1MjM1MTc5MzkyMTRdLAogICAgICAicHJpbWFyeV91
dGMiOiAiMjAyNi0wOS0yOVQwNjozMjowMi40NTY4MjErMDA6MDAiLAogICAgICAiY291bnRlcl9k
ZXJpdmVkX1ciOiB7ImJhc2VsaW5lIjogNC4zNTY4MzAsICJjb29sZG93biI6IDQxLjY4NTA3OCwg
InBvc3RfcHJvYmUiOiA0Mi4zMzM0ODV9LAogICAgICAiY291bnRlcl9pbnRlcnZhbF9zZWNvbmRz
IjogeyJiYXNlbGluZSI6IDIzLCAiY29vbGRvd24iOiAxMTYsICJwb3N0X3Byb2JlIjogMjJ9CiAg
ICB9CiAgXSwKICAiY29tbW9uX2F1eGlsaWFyeV9vYnNlcnZhdGlvbnMiOiB7CiAgICAidGVtcGVy
YXR1cmVfdW5pdCI6ICJtQyIsCiAgICAiYWxsX3dvcmtsb2FkX3JlYWRiYWNrcyI6IDEuNTk5OTM1
MjkzMTk3NjMxOCwKICAgICJhbGxfY29vbGRvd25fYW5kX3Bvc3RfcHJvYmVfR1RfY2hlY2twb2lu
dHMiOiB7ImlkbGUiOiBbImd0LWM2IiwgImd0LWM2Il0sICJhY3R1YWxfTUh6IjogWzAsIDBdfSwK
ICAgICJjb29saW5nIjogeyJvYnNlcnZhdGlvbnMiOiA5MjIsICJDUFVfbWF4X21DIjogNTQ4NzUs
ICJhbGxfZWlnaHRfY2FzZV9mYW5zX3Bvc2l0aXZlIjogdHJ1ZSwgInBvbGljeV91bmNoYW5nZWQi
OiB0cnVlfSwKICAgICJ0cmlhbF8zX2xhdGVfY291bnRlcl9yYXRlX3Jpc2UiOiB7CiAgICAgICJw
dWJsaWNhdGlvbl9pbnRlcnZhbF9zdGFydF9vZmZzZXRfc2Vjb25kc19hcHByb3giOiAyMy41MTIs
CiAgICAgICJwdWJsaWNhdGlvbl9pbnRlcnZhbF9lbmRfb2Zmc2V0X3NlY29uZHNfYXBwcm94Ijog
MjYuNTEyLAogICAgICAiY291bnRlcl9kZXJpdmVkX1dfcm91bmRlZCI6IDM0LjUzLAogICAgICAi
ZmFuMV9yZXBvcnRlZF9ycG1fYXRfMzBfc2Vjb25kcyI6IDI4NCwKICAgICAgInBhY2thZ2VfbUNf
YXRfMzBfc2Vjb25kcyI6IDM5MDAwLAogICAgICAiaW50ZXJwcmV0YXRpb24iOiAiVW5yZXNvbHZl
ZCBsYXRlIHJpc2UsIHdpdGhvdXQgY2FwdHVyZWQgdGFyZ2V0IGpvYi9mb3JjZXdha2UgaW4gdGhl
IGZvbGxvdy11cDsgbm90IGV2aWRlbmNlIG9mIGEgZHVyYWJsZSBsb3ctcG93ZXIvZmFuIGZpeC4i
CiAgICB9CiAgfSwKICAiY29tcGxldGVfcnVuX3RyYWNlIjogewogICAgImNvdW50c19zY29wZSI6
ICJSdW4td2lkZSwgbm90IHRhcmdldC1vbmx5OyBoaWdoLXZvbHVtZSBldmVudHMgZW5hYmxlZCBv
dXRzaWRlIGNvbXB1dGUgZGlzcGF0Y2hlcy4iLAogICAgImh3bW9uX2VudHJ5X3JldHVybl9jb3Vu
dHMiOiBbMTA1OTIsIDEwNTkyXSwKICAgICJmb3JjZXdha2VfZ2V0X2VudHJ5X3JldHVybl9jb3Vu
dHMiOiBbMzUwLCAzNTBdLAogICAgImZvcmNld2FrZV9wdXRfZW50cnlfcmV0dXJuX2NvdW50cyI6
IFszNTAsIDM1MF0sCiAgICAicmluZ19idWZmZXJfbG9zdF9ldmVudHMiOiAwLAogICAgIm1hbGZv
cm1lZF9wcm9iZV9ldmVudHMiOiAwLAogICAgImFsbF9zaXhfcHJvYmVfbWlzc19jb3VudHMiOiBb
MCwgMCwgMCwgMCwgMCwgMF0sCiAgICAiYWxsX2VpZ2h0X2NvbXBhcmlzb25zX3VzYWJsZSI6IHRy
dWUsCiAgICAiZm9yY2V3YWtlX3JlcXVlc3RlZF9tYXJrZXIiOiAiMHgxMDAwMCIsCiAgICAiZm9y
Y2V3YWtlX3JldHVybmVkX3JlZnNfaW5fYWNxdWlzaXRpb25fb3JkZXIiOiBbIjB4MTAwMDMiLCAi
MHgxMTgyOSJdLAogICAgImZvcmNld2FrZV9yZWxlYXNlX2FyZ3VtZW50IjogIjB4MTAwMDAiLAog
ICAgInJlZmVyZW5jZV92YWxpZGF0aW9uIjogIlR3byBkaXN0aW5jdCBHVCByZWZlcmVuY2VzLCBz
dWNjZXNzZnVsIEFMTCBhY2tub3dsZWRnbWVudCBhbmQgZXF1aXZhbGVudCBBTEwtbWFya2VyIHJl
bGVhc2UgaW5zaWRlIG9wZW4vY2xvc2UuIEZvcmNld2FrZSBhY2tub3dsZWRnbWVudCBpcyBub3Qg
c2Vuc29yLXJlYWR5LiIsCiAgICAiZWFjaF9zYW1wbGVkX2Nvb2xkb3duX3RyYWNlIjogeyJpbnN0
cnVtZW50YXRpb25fZW5hYmxlZCI6IHRydWUsICJ0YXJnZXRfam9iX2V2ZW50cyI6IDAsICJ0YXJn
ZXRfZm9yY2V3YWtlX2NhbGxzIjogMCwgInRhcmdldF9od21vbl9yZWFkX2NhbGxiYWNrcyI6IDEz
MDZ9LAogICAgInNhbXBsZWRfY29vbGRvd25fdHJhY2Vfc2NvcGUiOiAiRmlyc3QgYXBwcm94aW1h
dGVseSArNSBzIGNoZWNrcG9pbnQgdGhyb3VnaCB0aGUgcHJlLXByaW1hcnkgcmVhZDsgbm90IHRo
ZSBpbW1lZGlhdGUgbG9hZCB0YWlsLiIsCiAgICAiZWFjaF9wb3N0X3Byb2JlX3RyYWNlIjogeyJp
bnN0cnVtZW50YXRpb25fZW5hYmxlZCI6IHRydWUsICJ0YXJnZXRfam9iX2V2ZW50cyI6IDAsICJ0
YXJnZXRfZm9yY2V3YWtlX2NhbGxzIjogMH0sCiAgICAiY292ZXJhZ2VfbGltaXQiOiAiSHdtb24g
ZW50cnkvcmV0dXJuIGNvbnRpbnVvdXM7IGZvcmNld2FrZSwgbmF0aXZlIFBNLWdldCBhbmQgam9i
IGV2ZW50cyBkaXNhYmxlZCBkdXJpbmcgY29tcHV0ZSBkaXNwYXRjaGVzLiBEb2VzIG5vdCBvYnNl
cnZlIGFsbCBhdXRvbm9tb3VzIGZpcm13YXJlIGFjdGl2aXR5LiBCYWNrZ3JvdW5kIGNvbGxlY3Rp
b24gY29udGludWVkIG91dHNpZGUgcHJpbWFyeSB3aW5kb3dzLiIKICB9LAogICJlYXJsaWVyX3Bh
cnRpYWxfYXR0ZW1wdCI6IHsKICAgICJydW5faWQiOiAiYjcwLXAxLWQxLTIwMjYwOTI5LWIiLAog
ICAgImNvbXBsZXRlZCI6IGZhbHNlLAogICAgImNvbXBsZXRlZF90cmlhbHMiOiBbMV0sCiAgICAi
cG9vbGVkX2ludG9fY29tcGxldGVfcnVuIjogZmFsc2UsCiAgICAic3RvcF9yZWFzb24iOiAiQmVm
b3JlIHRyaWFsIDIgbm9ybWFsaXphdGlvbiBjb21wYXJpc29uLCBvcHRpb25hbCBmYW4gcmVhZCBy
ZXR1cm5lZCBrZXJuZWwgLUVBR0FJTjsgYnVmZmVyZWQgUHl0aG9uIHJlYWQgcmFpc2VkIFR5cGVF
cnJvcjogY2FuJ3QgY29uY2F0IE5vbmVUeXBlIHRvIGJ5dGVzLiIsCiAgICAiY29ycmVjdGlvbiI6
ICJVc2Ugb25lIHJhdyByZWFkLCBwcmVzZXJ2ZSBvcHRpb25hbCByZWFkIGVycm9ycyBhcyBtaXNz
aW5nLCByZW1vdmUgcmVkdW5kYW50IGFkamFjZW50IGZhbiByZWFkLiIsCiAgICAiY29tcGFyaXNv
bnMiOiBbCiAgICAgIHsKICAgICAgICAidHJpYWwiOiAxLCAiYXJtIjogInNoYW0iLCAicGhhc2Ui
OiAibm9ybWFsaXphdGlvbiIsICJraW5kIjogIndha2UiLAogICAgICAgICJiZWZvcmVfbUMiOiAy
NTAwMCwgImFmdGVyX21DIjogMjgwMDAsICJkZWx0YV9tQyI6IDMwMDAsCiAgICAgICAgImZkX3Nj
b3BlX21zIjogMjAuMTAyODE4LCAicHJlX3RvX3Bvc3RfbXMiOiAyMS4wMjI4LAogICAgICAgICJv
d25fcGFja2FnZV9yZWFkcyI6IDIsICJvd25fZm9yY2V3YWtlX2dldHMiOiAyLCAib3duX2ZvcmNl
d2FrZV9wdXRzIjogMiwKICAgICAgICAidXNhYmxlX2lzb2xhdGVkX3dpbmRvdyI6IHRydWUsCiAg
ICAgICAgInRpbWluZ19uc19yZWxhdGl2ZV90b19iZWZvcmVfcmVhZF9zdGFydCI6IHsKICAgICAg
ICAgICJiZWZvcmVfcmVhZF9lbmQiOiAyNDM3NTgsICJvcGVuX2NhbGwiOiAyNDU5MzgsICJvcGVu
X3JldHVybiI6IDk0NzgyMSwKICAgICAgICAgICJhZnRlcl9yZWFkX3N0YXJ0IjogMjEwMDQ3ODAs
ICJhZnRlcl9yZWFkX2VuZCI6IDIxMDIyODAwLAogICAgICAgICAgImNsb3NlX2NhbGwiOiAyMTAy
NDQ5MCwgImNsb3NlX3JldHVybiI6IDIxMDUwNjM5CiAgICAgICAgfQogICAgICB9LAogICAgICB7
CiAgICAgICAgInRyaWFsIjogMSwgImFybSI6ICJzaGFtIiwgInBoYXNlIjogInByaW1hcnkiLCAi
a2luZCI6ICJzaGFtIiwKICAgICAgICAiYmVmb3JlX21DIjogNTcwMDAsICJhZnRlcl9tQyI6IDU3
MDAwLCAiZGVsdGFfbUMiOiAwLAogICAgICAgICJmZF9zY29wZV9tcyI6IDIwLjM0NjY2NywgInBy
ZV90b19wb3N0X21zIjogMjAuNjU2MTY0LAogICAgICAgICJvd25fcGFja2FnZV9yZWFkcyI6IDIs
ICJvd25fZm9yY2V3YWtlX2dldHMiOiAwLCAib3duX2ZvcmNld2FrZV9wdXRzIjogMCwKICAgICAg
ICAidXNhYmxlX2lzb2xhdGVkX3dpbmRvdyI6IHRydWUsCiAgICAgICAgInRpbWluZ19uc19yZWxh
dGl2ZV90b19iZWZvcmVfcmVhZF9zdGFydCI6IHsKICAgICAgICAgICJiZWZvcmVfcmVhZF9lbmQi
OiAyNTA3NzcsICJvcGVuX2NhbGwiOiAyNTMwNzcsICJvcGVuX3JldHVybiI6IDMxNDE1NywKICAg
ICAgICAgICJhZnRlcl9yZWFkX3N0YXJ0IjogMjAzNzMxNjYsICJhZnRlcl9yZWFkX2VuZCI6IDIw
NjU2MTY0LAogICAgICAgICAgImNsb3NlX2NhbGwiOiAyMDY1OTE5NCwgImNsb3NlX3JldHVybiI6
IDIwNjYwODI0CiAgICAgICAgfQogICAgICB9CiAgICBdCiAgfSwKICAibWFpbnRlbmFuY2VfZGV2
aWF0aW9uIjogewogICAgImRlc2NyaXB0aW9uIjogIkdpdE9wcyByZWFzc2VydGVkIGRlc2lyZWQg
YXBwbGljYXRpb24gc3RhdGUgZHVyaW5nIHRoZSBjb21wbGV0ZSBydW47IHRoZSBpbnRlbmRlZCBw
YXVzZSBkaWQgbm90IHJlbWFpbiBpbiBlZmZlY3QuIFJlcGxhY2VtZW50IExMTSBQb2Qgc3RheWVk
IHBlbmRpbmcgdW50aWwgdGhlIGRpYWdub3N0aWMgZmluaXNoZWQuIiwKICAgICJyZXBsYWNlbWVu
dF9jcmVhdGVkX3V0YyI6ICIyMDI2LTA5LTI5VDA2OjE4OjMwWiIsCiAgICAibGFzdF9wcmltYXJ5
X3V0YyI6ICIyMDI2LTA5LTI5VDA2OjMyOjAyLjQ1NjgyMSswMDowMCIsCiAgICAiZGlhZ25vc3Rp
Y19kb25lX3V0YyI6ICIyMDI2LTA5LTI5VDA2OjMyOjMyLjQ4NjA3MiswMDowMCIsCiAgICAicmVw
bGFjZW1lbnRfc2NoZWR1bGVkX2FuZF9zdGFydGVkX3V0YyI6ICIyMDI2LTA5LTI5VDA2OjMyOjM0
WiIsCiAgICAiZm9sbG93dXBfcmVxdWlyZWQiOiAiRHJpZnQtc2FmZSBtYWludGVuYW5jZSBob2xk
IGFuZCBsaXZlLXN0YXRlIGd1YXJkIGJlZm9yZSBhbm90aGVyIGxvbmcgcnVuLiIKICB9LAogICJy
ZXN0b3JhdGlvbiI6IHsKICAgICJib3RoX3J1bnNfY2xlYW51cF9zdWNjZXNzZnVsIjogdHJ1ZSwK
ICAgICJub3JtYWxfUE1fYW5kX2FwcGxpY2F0aW9uX3N0YXRlX3Jlc3RvcmVkIjogdHJ1ZSwKICAg
ICJ0ZW1wb3JhcnlfcnVuX3Jlc291cmNlc19yZW1vdmVkIjogdHJ1ZSwKICAgICJyZXN1bHRfZGly
ZWN0b3JpZXNfcmVtb3ZlZF9hZnRlcl92ZXJpZmllZF9jb3B5IjogdHJ1ZQogIH0sCiAgImxpbWl0
YXRpb25zIjogWwogICAgIk9uZSBjYXJkLCB0d28gcHJpbWFyeSB0cmlhbHMgcGVyIGFybSwgZml4
ZWQgc2VxdWVudGlhbCBvcmRlciwgZGlmZmVyZW50IHN0YXJ0aW5nIHJlcG9ydGVkIHRlbXBlcmF0
dXJlcyBhbmQgZHluYW1pY2FsbHkgcmVzcG9uZGluZyBjYXNlIGZhbnM7IG5vIHN0YXRpc3RpY2Fs
IGluZGVwZW5kZW5jZS9lcXVhbC1haXJmbG93IGNsYWltLiIsCiAgICAiTm9ybWFsaXphdGlvbiBp
cyBhbiBpbnRlcnZlbnRpb24sIHNlcGFyYXRlZCBmcm9tIHRoZSBwcmltYXJ5IHJlc3VsdHMuIiwK
ICAgICJSZXBvcnRlZCB0ZW1wZXJhdHVyZXMgYW5kIGludGVydmFsLWF2ZXJhZ2VkIEdQVSBmYW4g
dmFsdWVzIGxhY2sgaW5kZXBlbmRlbnQgcGh5c2ljYWwgdGhlcm1vbWV0cnkvdGFjaG9tZXRyeTsg
Zmlyc3QgYXV4aWxpYXJ5IHJlYWRpbmdzIG9jY3VyIGFmdGVyIHRoZSBwcmltYXJ5IGhvbGQuIiwK
ICAgICJUaGUgb2JzZXJ2ZWQgMjQtMjUgQyBwYWNrYWdlIGNoYW5nZSBpcyBub3QgYSAyMCBtcyBw
aHlzaWNhbCBjb29saW5nIG1lYXN1cmVtZW50LiBBIHN1Y2Nlc3NmdWwgcmVhZCBvciB3YWtlIEFD
SyBhbG9uZSBkb2VzIG5vdCBlc3RhYmxpc2ggZnJlc2huZXNzLiIsCiAgICAiTGF0ZSBjb3VudGVy
L2ZhbiByaXNlIGluIHRyaWFsIDMgcmVtYWlucyB1bmV4cGxhaW5lZC4gTm8gZHVyYWJsZSBsb3ct
cG93ZXIvZmFuLWNvbnRyb2wgZml4IGlzIGRlbW9uc3RyYXRlZC4iLAogICAgIkQwIGNhcmQtY291
bnRlciBlc3RpbWF0ZXMgd2l0aCBjb2Fyc2UgdGltZXN0YW1wcyBkbyBub3QgbWVhc3VyZSBub3Jt
YWwtYXV0byByZXN1bWUvYXV0b3N1c3BlbmQtdGFpbCBjb3N0IG9yIHdob2xlLWhvc3QvZXh0ZXJu
YWwtbWV0ZXIgcG93ZXIuIiwKICAgICJObyB1bml2ZXJzYWwgZGVsYXkvbWluaW11bS1kb21haW4g
cmVxdWlyZW1lbnQsIGNvbnRyb2xsZWQgZmlybXdhcmUtYmVmb3JlL2FmdGVyIGNhdXNhbGl0eSwg
b3IgYm9vdCB0ZXN0IG9mIHRoZSBSRkMgcGF0Y2ggaXMgZXN0YWJsaXNoZWQuIgogIF0sCiAgInJl
dGFpbmVkX3Jlc3VsdF9hcmNoaXZlX3NoYTI1NiI6IHsKICAgICJiNzAtcDEtZDEtMjAyNjA5Mjkt
YyI6ICJiZDU5NGQ2MDY5YWVhMGI5NDcxZmM2ZmU0ZTI3MjJkMDlmOWQ4YjIwYjVhYTM4OTcxYTM3
ZTlkM2VmODFkNmI5IiwKICAgICJiNzAtcDEtZDEtMjAyNjA5MjktYiI6ICIxZDQzYzlmY2E2NTVm
MDM0YWEwYTVlYjdmNzJjNmEwYzk4MzRkZWViM2I3ZDNkNTc2NmFhNDJiNDBiYjgxZjY3IgogIH0K
fQo=
--000000000000bfc866065c9dea58--
