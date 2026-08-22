Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59E4EC5DF8C
	for <intel-xe@archiver.kernel.org>; Sat, 22 Aug 2026 13:06:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11DF610E3F9;
	Sat, 22 Aug 2026 13:06:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Ni98Z3hU";
	dkim-atps=neutral
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2933E10E3C9
 for <intel-xe@lists.freedesktop.org>; Sat, 22 Aug 2026 08:53:16 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-2caea3f742bso29295595ad.0
 for <intel-xe@lists.freedesktop.org>; Sat, 22 Aug 2026 01:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1787388795; x=1787993595; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=bR7LrEDWYTPsnuOnqVtcGLotVp78B6n1a5iwn0JbEJk=;
 b=Ni98Z3hUL2S7vC+MoNYCwvw4fc9g5QNP/dpsMgwZ01nYscudyfX7itnx4fLl7a8wwJ
 wEkMztBxLiHhqW0bkW1zLsHEfVWZGjKP/+U3jiffyeOyy/bR+FuEE8W67Oj2RXwHq3cM
 +qgKi4uI3/opBXbApcAcPxjb7hKGte02JjcE57ZZPQwC4toKhYbo/qwH8pWW2P1GvcUf
 BGgdJR7bcBBPMiE8o3lxARp99lJGtGcbhHG1U4pYVRgg2DpOaRweJRvmr1reVrVhy5XS
 qiC7wQL1icq7gknWB7VO989grHKTCfX+yRZKYE7T/YcFpdw3PmvEd+WRQmaeH46muGrE
 rJ3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787388795; x=1787993595;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=bR7LrEDWYTPsnuOnqVtcGLotVp78B6n1a5iwn0JbEJk=;
 b=DCzkmcg6Rsp77h/vAOlJuTFBPdsM+xFlXG9CL4wWD1u0xZUjC3/9y6K+IHpaCPxvM9
 xLppPqk4h+M4exjeEkPcAOkGaIIIzMWXC1VWC+Wwgr9pkbwgruScFS2r2CcHeBNO1mvH
 jgB4stfSgeV2lG6e0mpEy2Q5/3kCYPqKZXhiVDTIFMQcOI6ngUUZZtiHHmk40bIVX2ra
 DXjKrDch7iJR2bclh9bP15xTTU3AWbd1fJQSoT2dHIZhHzOYOMph8Ilk4e4p6JPrQrKm
 PhxboRATQtdq4GcmEPuMpoFZ6bQMFJA+TRKHugjshQCrqTBoaA9qcwte3SQs/6VAby3R
 0uVA==
X-Gm-Message-State: AFuF++lv7+iC1XWfuUmROCx1IaGxH0YIXQrxrx3ZwTotk/neLoRr/MRP
 DQiGHZW/Qx6D6m8k6uV2bZ5f6WtTfRwvUSoLNBLScXRFydNnAEbZDc6yP9FQud59
X-Gm-Gg: AR+sD13HjfdwBs6OaEfa2Xf87rYqDNtYgofU8IPRQfsH5wtYvSqWmUBvEW5R2WGtq7x
 5mbyJXFBz04ioetCs8dPJaVcZDFnd9mVA1cC69V/LU0YbY0CaILaol1DcIP/e3QdiVRhhXeXyX7
 +acefXwpzm4JIqn1mqnztfTwwJG1rRbMaGwP/TtpKviuNGlAj1aE9l8kZouQDDVImVMuLIM1/OL
 0onlZnsP8MJzFT5ravp/8ya0AfqjtHLN1HI/RnUncYKQhgmWd2SvhjL9gfi1x2DpAc01V8YwZgd
 pHowVn7YcA/S8oxD+3K9NK4cVaxONAVeU6NRPtiUNj6JRM9oVlruJxZqsEUZDtpoFpTXiACmNg+
 zbXzkivygVYaIflibU1871YGI8CCAyJM5UJscMtKAkYQGv4gL2UWKm+HpOHX6G7LB8IFSiP18n5
 ZuF4buip3xcQuFsogYM+lkv5bCzFsxeBtLK2kYtxvzv8sscd0DUceDgIvYQyJB1en0JukCWHPul
 a68RpF3kONxOGs=
X-Received: by 2002:a17:902:ec86:b0:2c6:9f66:d573 with SMTP id
 d9443c01a7336-2d64ae3ac9emr225062945ad.2.1787388795383; 
 Sat, 22 Aug 2026 01:53:15 -0700 (PDT)
Received: from mcp-node.. ([240d:f:fe4:c00:e9d:92ff:fe83:dbda])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2d67676170fsm2982575ad.6.2026.08.22.01.53.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Aug 2026 01:53:14 -0700 (PDT)
From: Yuta Higuchi <avablaba@gmail.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [RFC PATCH 0/1] drm/xe/hwmon: wake render domain for BMG package
 temperature
Date: Sat, 22 Aug 2026 17:52:02 +0900
Message-ID: <cover.1787385860.git.avablaba@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Sat, 22 Aug 2026 13:06:44 +0000
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

This RFC addresses a reproducible stale package-temperature value on one In=
tel
Arc Pro B70 (8086:e223). During GPU activity, temp2_input changes continuou=
sly.
After the workload exits, it changes for only a short lifecycle burst and t=
hen
remains fixed for more than 200 seconds during idle cooldown. Other telemet=
ry,
including VRAM, mctrl, PCIe, fan, energy, and runtime state, continues to m=
ove.
An independent PID reading the same sysfs node sees the same result.

The symptom reproduces after cold boot, without OpenVINO, with a standard
clpeak workload, and on Linux 6.17, 7.0, 7.1.5, and 7.2-rc7 using the same
official BMG firmware. Holding runtime PM active alone did not restore idle
updates, and a controlled Xe reprobe did not restore continuous updates.

The tested firmware is byte-identical after decompression to official
linux-firmware main:

- DMC 2.6, content SHA-256
  76e3ec6ea3a53ce727e43b84f5ea14c55400a2d118dac356d4e12a3cfac06b4d;
- GuC 70.72.1, content SHA-256
  de81c75f46a127c33cd59f604d800e9ffc7ed3495967ba0d8767cd6985ab398b;
- HuC 8.2.10, content SHA-256
  747452aa8c4ed7760c68a80f3d913eafde9304d6f4db481e3f2aebb0a818bf15.

Source path and causal isolation
--------------------------------

For BMG, temp2_input reaches BMG_PACKAGE_TEMPERATURE (0x138434) through
xe_mmio_read32(). On the tested B70:

- stock forcewake_all kept package temperature updating;
- main-GT XE_FW_RENDER alone was sufficient in 3/3 independent persistent
  holder rounds;
- releasing the RENDER holder was followed immediately by renewed staleness=
 in
  3/3 rounds;
- main-GT XE_FW_GT alone was negative in the single persistent-holder round
  tested;
- a transient RENDER acquisition produced the first fresh publication after
  1.17 to 2.172 ms; and
- after a 20 ms RENDER hold with no sysfs reads, the first package-temperat=
ure
  read was already fresh.

These observations support a wake/publication dependency rather than a
collector or sysfs-reader problem. They do not establish that register
0x138434 architecturally belongs to XE_FW_RENDER, nor whether PCODE, GuC, or
other firmware produces a shadow value.

Proposed RFC behavior
---------------------

For the BMG package-temperature channel only, acquire the main GT
XE_FW_RENDER domain, wait 3.0 to 3.5 ms, read the mapped package-temperature
register, and release the reference automatically. Forcewake acquisition
failure is returned as -ETIMEDOUT, following existing Xe forcewake-ACK time=
out
precedent.

The 3.0 to 3.5 ms settling interval is empirical. The maximum fresh transit=
ion
latency observed in the transient tests was 2.172 ms. FORCEWAKE_ACK_RENDER =
is a
wake-domain acknowledgement; it has not been shown to be a temperature
producer-ready acknowledgement. The fixed delay is not presented as an
architectural contract.

Scope and known limitations
---------------------------

Runtime validation was performed on one Arc Pro B70 (8086:e223). The RFC is
scoped to Battlemage because the affected package-temperature path is
BMG-specific; guidance on applicability to other BMG devices and steppings =
is
welcome.

XE_FW_RENDER was single-domain sufficient among the directly compared state=
s.
XE_FW_GT alone was tested once and was negative. Media, GSC, and other
individual forcewake domains were not tested after the RENDER-only positive=
 was
established. This RFC does not claim that RENDER is the unique minimum among
every possible domain combination.

Validation
----------

Extensive runtime validation was performed with the equivalent diagnostic
implementation on Ubuntu 7.0:

- three independent 180-second cooldown rounds;
- 1, 5, 10, and 30 second read cadences;
- four concurrent readers (240/240 successful reads);
- 30 minutes of continuous operation;
- OpenVINO ruri-v3 and bge-m3 requests;
- suspend/resume; and
- controlled Xe unbind/rebind.

No GPU hang, reset, fault, or wedge occurred. Persistent RENDER forcewake h=
ad a
large power cost, whereas read-scoped references allowed GT idle residency =
to
advance. The displayed cur_freq remained 2800 MHz while act_freq was zero a=
nd
GT C6/idle residency progressed, so cur_freq was classified as telemetry st=
ate
rather than evidence of a physically busy GT.

The rebased current-tree candidate was additionally smoke-tested directly as
7.2.0-b70rfc2+, based on drm-tip 75140c4ee9ad. With the standard clpeak
workload, both a main reader and an independent PID observed package
temperature continue from 46 C down to 44 C during a 180-second cooldown.
act_freq was zero, GT entered C6, and idle residency advanced by 178.25
seconds. A separate bounded candidate-kernel test returned HTTP 200 for
OpenVINO ruri-v3 and bge-m3. No hang, reset, fault, wedge, or taint occurre=
d.
This direct smoke does not include the 30-minute, suspend/resume, or reprobe
tests listed above; those were run only with the equivalent Ubuntu 7.0
diagnostic implementation.

On stock kernels, a separate operational workaround submits one warmed Intel
ICD work-item / one Xe job every 30 seconds and reads temp2_input 50 ms lat=
er.
That workaround refreshes snapshots but is not the proposed kernel behavior.

Related issues
--------------

Primary: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/7805
Secondary: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/4560

Questions for maintainers
-------------------------

1. Is 0x138434 a live sensor register, or a shadow value published by PCODE,
   GuC, or other firmware?
2. Is there a documented producer-ready indication after XE_FW_RENDER is
   acquired?
3. If not, what is the official minimum delay or refresh sequence for this
   register?

If an existing mechanism is available to trigger or wait for
package-temperature publication, I would prefer that over the empirical
settling delay used by this RFC.

Coding-assistant disclosure
---------------------------

AI coding assistants were used during this investigation and RFC preparatio=
n:
Claude Code for the initial investigation and independent review of the pat=
ch
against the current tree, OpenAI Codex for implementation, evidence collect=
ion
and test orchestration, and ChatGPT GPT-5.6 Sol Pro for investigation plann=
ing,
submission workflow design and review. The human submitter reviewed the
resulting code and evidence and takes responsibility for the submission.

Thanks,
Yuta Higuchi

Yuta Higuchi (1):
  drm/xe/hwmon: wake render domain for BMG package temperature

 drivers/gpu/drm/xe/xe_hwmon.c | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)


base-commit: 75140c4ee9ad250b2524ff5bfffd7f9fe4bb6012
--=20
2.43.0

