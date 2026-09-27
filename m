Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E082C9832F
	for <intel-xe@archiver.kernel.org>; Sun, 27 Sep 2026 14:45:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B38210E616;
	Sun, 27 Sep 2026 14:45:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="TXDFqODK";
	dkim-atps=neutral
Received: from mail-dl2-f43.google.com (mail-dl2-f43.google.com
 [74.125.229.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B410110E604
 for <intel-xe@lists.freedesktop.org>; Sun, 27 Sep 2026 14:10:27 +0000 (UTC)
Received: by mail-dl2-f43.google.com with SMTP id
 a92af1059eb24-144f7915355so1870914c88.3
 for <intel-xe@lists.freedesktop.org>; Sun, 27 Sep 2026 07:10:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790518227; cv=none;
 d=google.com; s=arc-20260327;
 b=VHMlP0teVAa+sGOo/6iD2LB+jmxK3auZb+EAIJE7ZCuwY1ew1cNnoFvXsfG1eveKXf
 DcR2LXJO57KqMmXMkjIi/VSwp6OieyzDGxsAdV2Ig6roaNWZTsDr/M6XMbVK7dIwCUiY
 A7NZN/sIBscAOLWEwkJeutNJ7HKyt6hECjHdSrpwk/K3Py03/pHeQd00Dzk22KQVhQuK
 P3OoxTJ/xHf1gWJff4unOe33FcgYrSatvOzEUGWbCylWgVGBx6/3a8bXaCHzZcjkVW12
 uH9tnmcqJGs4SWmdr8xQhzvhhigNzL8SToVKqsiJA7MhT/4MNmyNKRiThEt4ziAEenHY
 sJeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=VdRfASuaMtbJkFBJAwYC9rnzaSM2II3A+Fdz+ZAc8xA=;
 fh=QSmtyqbPu0bk0NEk9Tl5+cxMrjkQUB/iUdmaqgjJ8mI=;
 b=Xre2eIlY9C9S49swYQrbBbwu2rF14MhS53CZg21Q9qPw4J5SEImjCp2XXdedr/tPFu
 uVuNi1PgXehhHP15SpUEW881InWp97A+OCuI5EO1ueYmduqZVDhvYfmg76laQWrKKA9C
 pVff/XpA17FwOIvP2H+7S+9KsjUz+THnE850r+myRa21WHSDTDuDom3adZACGDOzthRN
 OJEzpPIgxP7ylD57Rl2gBBPCsm6sgyYjPx65A0Iw3PK2g6o8KrxLD1iccsJ38z6t9cpt
 rHIHH/H/NxY651mgaf0OJpnATKHsQr4QVwtxhWST1fqyyDEGihIdJDHzCQV2QJDyNMXu
 lS1Q==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790518227; x=1791123027; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=VdRfASuaMtbJkFBJAwYC9rnzaSM2II3A+Fdz+ZAc8xA=;
 b=TXDFqODKM4wLt9p9qa6Y/aWpZnY8qov1gjFc/ZHJIH8bgvhoNhLWrL0/4DO4Iy7Mi4
 GFE/w4pmdyUyvlES65Kg8fYSENGix5cuu12LyPWwr5isfwAOswfcGqlCL/9V5IhcFQV2
 I4k/mi6HQewi9ZDje6ClDd2dO5uETpfLn98580FMcC2aCuGpfxMrXw/ozFXZN8G68sZg
 JkLsGmjhB5IXSZ2Jtf+2qsJF9M96JmKNLGVj2mFIcllsMywftCP1SG2dq31PF0h3NDfZ
 zGN3tR1P4YtrWbAKZSlLxi/RitWGA1llcDDM+5PamtToOMJ/UudRdqzKfpnkzfB9LlIj
 mQxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790518227; x=1791123027;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=VdRfASuaMtbJkFBJAwYC9rnzaSM2II3A+Fdz+ZAc8xA=;
 b=xmrymMeClz/Jq5T9VrsHg/WIhmrpZX4GoTTamibpan5d/gz5jjDSjOJ9yAIY0MNpcx
 NxpRqSQoi1ji0BdSTZ1fOQl8aCHoA3/pimkpY04Icu6/rZrnvHdkpjTuDdvwcq9+a0wM
 QIImC97Cqwjqi0yWjtrrJmz1GW1ugjK3a5L7Ow+E5fB17VVfkAz+dLpU7k8KtXIdzjTd
 F5m3cxHSxyAjKRO/RcuAq+DLdDzo1H1jceLv3d5tMW6+X2GMGuMOa58VQGvq5m3GzS5i
 KBI3TYou6jFfQ+8nVr1/SgjUkrLLGGkwGm0TJKvotDI4B6Kub5FIe3q7ci+USGimve5i
 ScyQ==
X-Gm-Message-State: AFuF++kaMWG+k5TrEsF5A1Rirdl6m0Q2NxZ92uAmWEPkg0gRwwryDkCz
 TApEcvYun+QvVuUSL7Y3k3VoIyQuEkcyf+daZKZ5KEsnH2NRu7QDCc0a/qDTIxTkKXWdZU6JXLJ
 5GtXsoIzQVK6kfHgjAaeUW1Q8Mm/Ag1NH2Obntns=
X-Gm-Gg: AYBFou36p0fnh+T7jc/uN57f6DNFY0b5kxT0nWIyUDp5lN3E8ZmA/pqSo5nDPwoWgL2
 uo6aGLqrQaKFO6b22hLBPat4FF+NsZ/V8GsCQ/excTAZhP3ZZV4dkN+RQp04tDWdpAu7ZPlpPCP
 n7urZPkXcnwOHtkDneVbh/I/6EY2imQMsXpyR7n4+45iUzdmMjdwQxHo4O6nkaBVyK/e4Xl5FsQ
 THrREeeKsic5PY+8FwpJZ3EXMHHTKPeruucMZkWI37n4vGiNeVz+9jLvV2nxgQriPC5a9lIZ8Nr
 +icVe3ec99YpSHGPgcwdQCrgLU8JdkJNKWdmp/oxRHrwEUQ4Zx/XIyCg0v9GC4rbHXHjpcNke8y
 CwlUFR93QJzl/KlPI3SgrUTcfmMYh2AxR6fMDbspuHgqncBiiWbV4tsB1bGxql6AZZhXvPYMpCi
 viuQhf4FALb9UTUtWGVQ==
X-Received: by 2002:a05:701b:4183:10b0:144:e246:a0c4 with SMTP id
 a92af1059eb24-146d096cf80mr6059183c88.45.1790518225852; Sun, 27 Sep 2026
 07:10:25 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1787385860.git.avablaba@gmail.com>
In-Reply-To: <cover.1787385860.git.avablaba@gmail.com>
From: Yuta Higuchi <avablaba@gmail.com>
Date: Sun, 27 Sep 2026 23:10:14 +0900
X-Gm-Features: AclHuK-XXDC-6xDBUzEvUG8bxtT96gfUqdEWP3Ryqf-y_L_nYasN1_Z8Jm1KH4M
Message-ID: <CAN6N41v=6hcN2Vt3jveeZBVQPzQjYaSiGUY2gMVjAz3gMbysSg@mail.gmail.com>
Subject: Re: [RFC PATCH 0/1] drm/xe/hwmon: wake render domain for BMG package
 temperature
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>, 
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Sun, 27 Sep 2026 14:45:54 +0000
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

Hello,

Following up on this RFC with additional measurements from two Arc Pro
B70 cards in a different host. A matched A-B-B-A comparison supports the
submitted read-scoped change: the difference between an ordinary package
read and a subsequent longer-wake reference was 11-18 C without the patch,
and 0-1 C with it, across 12 trials per arm.

Matched comparison
------------------
A was a 7.0.14 diagnostic kernel with unmodified hwmon; B was the same
source with the submitted 35-line patch. Only xe_hwmon.c differed in the
sources, and only LOCALVERSION differed in configuration. Both included
the same reference-pulse instrumentation. These were matched diagnostic
builds, not a stock Ubuntu versus patched-kernel comparison.

All four boots used DMC 2.6, GuC 70.58.0 and HuC 8.2.10. The original
August report used GuC 70.72.1, so this is not an otherwise identical
repeat of that environment. The two cards share one host; they are not
two independent platforms.

Each boot had six trials: two cards x three package-read schedules.
After a common reference pulse, 15 s baseline and 10 s OpenCL load,
each trial cooled for 150 s. During cooling, package was either unread,
read once at 30 s, or read every second from 30 through 89 s, then left
unread. Non-package temperatures and fan speed were sampled throughout;
no GPU jobs or diagnostic pulses were submitted during cooling. Each
arm included both forward and reverse trial order.

At 150 s I read package, applied a requested 20 ms RENDER reference
pulse, then read package again. The table lists reference minus first
read, with all six results from each boot in execution order:

  Boot  Arm   Differences (C)
  0     A     -17, -12, -18, -15, -18, -15
  1     B      +1,  +1,   0,  +1,   0,   0
  2     B      +1,  +1,  +1,   0,   0,  +1
  3     A     -11, -17, -13, -16, -12, -17

A's median difference was -15.5 C; B's was +1 C. B matched exactly in
five trials and the reference was 1 C higher in seven. B's second read
also used the patched path. This is agreement with a longer-wake
reference, not independent thermometry or an architectural freshness
guarantee. The 244 scheduled B reads during cooling had measured
ACK-complete-to-MMIO intervals of 3.034-3.609 ms; those are execution
checks, not 244 independent freshness comparisons.

Fan behavior and domain scope
-----------------------------
With B's single/periodic package reads, both cards slowed down. At
80-89 s, one card was at 715-716 rpm versus A's 3082-3215 rpm, and the
other at 1786-2148 versus 3334-3691 rpm. In B's four no-package-read
cooling trials, there was no comparable decrease. A single patched read
could sustain lower speed through the remaining cooling window. The
final combined read/reference operation could increase fan speed again.
This supports an effect on the observed thermal/fan state, but does not
establish an autonomous fan-control fix or its internal temperature input.

There is also an important update to the original GT-negative observation.
In separate unpatched-kernel tests on these two cards, both GT-only and
RENDER-only pulses of about 20 ms changed package/mctrl/PCIe readings and
were followed by fan slowdown, without GPU work or temperature reads
inside the pulse. A further exploratory test on one card observed
C6 -> C0 -> C6 with both domains; sham remained in C6. Each card/condition
in these pulse comparisons was tested once. The original persistent-
holder test had different conditions, but its negative GT result should
not be generalized into a RENDER-exclusive dependency. RC6 exit itself
has not been isolated from other effects common to forcewake.

Trace/accounting note
---------------------
All 24 A/B trials are retained, with no retries or exclusions. Trace
coverage matched 379,980 sensor/fan reads and found no external hwmon
readers during collection. The reference-pulse audit initially included
intentional neighboring reads in an overly broad userspace time window.
I preserved the original results and separately corrected the audit to
use traced function entry/exit, retaining the forcewake/ACK/duration and
in-pulse read checks. All trials passed the corrected condition audit;
measurement windows and values were unchanged. Raw traces, scripts and
per-trial tables are retained and can be provided if useful.

The main remaining question is still the documented wake/publication
requirement: is there an update-completion indication or an appropriate
refresh sequence instead of a fixed delay, and what domain should be
used? Guidance would help determine the correct scope of a driver fix.

Finally, the CI reply says this series was not run because my address
was outside the allowlist. If appropriate, could a project owner trigger
retest for series 172621?
https://patchwork.freedesktop.org/series/172621/

Thanks,
Yuta Higuchi


2026=E5=B9=B48=E6=9C=8822=E6=97=A5(=E5=9C=9F) 17:53 Yuta Higuchi <avablaba@=
gmail.com>:
>
> Hello,
>
> This RFC addresses a reproducible stale package-temperature value on one =
Intel
> Arc Pro B70 (8086:e223). During GPU activity, temp2_input changes continu=
ously.
> After the workload exits, it changes for only a short lifecycle burst and=
 then
> remains fixed for more than 200 seconds during idle cooldown. Other telem=
etry,
> including VRAM, mctrl, PCIe, fan, energy, and runtime state, continues to=
 move.
> An independent PID reading the same sysfs node sees the same result.
>
> The symptom reproduces after cold boot, without OpenVINO, with a standard
> clpeak workload, and on Linux 6.17, 7.0, 7.1.5, and 7.2-rc7 using the sam=
e
> official BMG firmware. Holding runtime PM active alone did not restore id=
le
> updates, and a controlled Xe reprobe did not restore continuous updates.
>
> The tested firmware is byte-identical after decompression to official
> linux-firmware main:
>
> - DMC 2.6, content SHA-256
>   76e3ec6ea3a53ce727e43b84f5ea14c55400a2d118dac356d4e12a3cfac06b4d;
> - GuC 70.72.1, content SHA-256
>   de81c75f46a127c33cd59f604d800e9ffc7ed3495967ba0d8767cd6985ab398b;
> - HuC 8.2.10, content SHA-256
>   747452aa8c4ed7760c68a80f3d913eafde9304d6f4db481e3f2aebb0a818bf15.
>
> Source path and causal isolation
> --------------------------------
>
> For BMG, temp2_input reaches BMG_PACKAGE_TEMPERATURE (0x138434) through
> xe_mmio_read32(). On the tested B70:
>
> - stock forcewake_all kept package temperature updating;
> - main-GT XE_FW_RENDER alone was sufficient in 3/3 independent persistent
>   holder rounds;
> - releasing the RENDER holder was followed immediately by renewed stalene=
ss in
>   3/3 rounds;
> - main-GT XE_FW_GT alone was negative in the single persistent-holder rou=
nd
>   tested;
> - a transient RENDER acquisition produced the first fresh publication aft=
er
>   1.17 to 2.172 ms; and
> - after a 20 ms RENDER hold with no sysfs reads, the first package-temper=
ature
>   read was already fresh.
>
> These observations support a wake/publication dependency rather than a
> collector or sysfs-reader problem. They do not establish that register
> 0x138434 architecturally belongs to XE_FW_RENDER, nor whether PCODE, GuC,=
 or
> other firmware produces a shadow value.
>
> Proposed RFC behavior
> ---------------------
>
> For the BMG package-temperature channel only, acquire the main GT
> XE_FW_RENDER domain, wait 3.0 to 3.5 ms, read the mapped package-temperat=
ure
> register, and release the reference automatically. Forcewake acquisition
> failure is returned as -ETIMEDOUT, following existing Xe forcewake-ACK ti=
meout
> precedent.
>
> The 3.0 to 3.5 ms settling interval is empirical. The maximum fresh trans=
ition
> latency observed in the transient tests was 2.172 ms. FORCEWAKE_ACK_RENDE=
R is a
> wake-domain acknowledgement; it has not been shown to be a temperature
> producer-ready acknowledgement. The fixed delay is not presented as an
> architectural contract.
>
> Scope and known limitations
> ---------------------------
>
> Runtime validation was performed on one Arc Pro B70 (8086:e223). The RFC =
is
> scoped to Battlemage because the affected package-temperature path is
> BMG-specific; guidance on applicability to other BMG devices and stepping=
s is
> welcome.
>
> XE_FW_RENDER was single-domain sufficient among the directly compared sta=
tes.
> XE_FW_GT alone was tested once and was negative. Media, GSC, and other
> individual forcewake domains were not tested after the RENDER-only positi=
ve was
> established. This RFC does not claim that RENDER is the unique minimum am=
ong
> every possible domain combination.
>
> Validation
> ----------
>
> Extensive runtime validation was performed with the equivalent diagnostic
> implementation on Ubuntu 7.0:
>
> - three independent 180-second cooldown rounds;
> - 1, 5, 10, and 30 second read cadences;
> - four concurrent readers (240/240 successful reads);
> - 30 minutes of continuous operation;
> - OpenVINO ruri-v3 and bge-m3 requests;
> - suspend/resume; and
> - controlled Xe unbind/rebind.
>
> No GPU hang, reset, fault, or wedge occurred. Persistent RENDER forcewake=
 had a
> large power cost, whereas read-scoped references allowed GT idle residenc=
y to
> advance. The displayed cur_freq remained 2800 MHz while act_freq was zero=
 and
> GT C6/idle residency progressed, so cur_freq was classified as telemetry =
state
> rather than evidence of a physically busy GT.
>
> The rebased current-tree candidate was additionally smoke-tested directly=
 as
> 7.2.0-b70rfc2+, based on drm-tip 75140c4ee9ad. With the standard clpeak
> workload, both a main reader and an independent PID observed package
> temperature continue from 46 C down to 44 C during a 180-second cooldown.
> act_freq was zero, GT entered C6, and idle residency advanced by 178.25
> seconds. A separate bounded candidate-kernel test returned HTTP 200 for
> OpenVINO ruri-v3 and bge-m3. No hang, reset, fault, wedge, or taint occur=
red.
> This direct smoke does not include the 30-minute, suspend/resume, or repr=
obe
> tests listed above; those were run only with the equivalent Ubuntu 7.0
> diagnostic implementation.
>
> On stock kernels, a separate operational workaround submits one warmed In=
tel
> ICD work-item / one Xe job every 30 seconds and reads temp2_input 50 ms l=
ater.
> That workaround refreshes snapshots but is not the proposed kernel behavi=
or.
>
> Related issues
> --------------
>
> Primary: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/7805
> Secondary: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/4560
>
> Questions for maintainers
> -------------------------
>
> 1. Is 0x138434 a live sensor register, or a shadow value published by PCO=
DE,
>    GuC, or other firmware?
> 2. Is there a documented producer-ready indication after XE_FW_RENDER is
>    acquired?
> 3. If not, what is the official minimum delay or refresh sequence for thi=
s
>    register?
>
> If an existing mechanism is available to trigger or wait for
> package-temperature publication, I would prefer that over the empirical
> settling delay used by this RFC.
>
> Coding-assistant disclosure
> ---------------------------
>
> AI coding assistants were used during this investigation and RFC preparat=
ion:
> Claude Code for the initial investigation and independent review of the p=
atch
> against the current tree, OpenAI Codex for implementation, evidence colle=
ction
> and test orchestration, and ChatGPT GPT-5.6 Sol Pro for investigation pla=
nning,
> submission workflow design and review. The human submitter reviewed the
> resulting code and evidence and takes responsibility for the submission.
>
> Thanks,
> Yuta Higuchi
>
> Yuta Higuchi (1):
>   drm/xe/hwmon: wake render domain for BMG package temperature
>
>  drivers/gpu/drm/xe/xe_hwmon.c | 35 +++++++++++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
>
>
> base-commit: 75140c4ee9ad250b2524ff5bfffd7f9fe4bb6012
> --
> 2.43.0
>
