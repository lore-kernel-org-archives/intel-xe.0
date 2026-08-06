Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAD32C5AC7C
	for <intel-xe@archiver.kernel.org>; Thu,  6 Aug 2026 17:37:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5215E10F278;
	Thu,  6 Aug 2026 17:37:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="qG5g/jhW";
	dkim-atps=neutral
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com
 [209.85.128.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD2E610F278
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Aug 2026 17:37:56 +0000 (UTC)
Received: by mail-yw1-f171.google.com with SMTP id
 00721157ae682-81e69a2db34so40444617b3.0
 for <intel-xe@lists.freedesktop.org>; Thu, 06 Aug 2026 10:37:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786037876; cv=none;
 d=google.com; s=arc-20260327;
 b=E7CrRPnKKqRAl+cI+RRY3nuJcbDw1e5MCC1Z6+YlztK8TkK9UXnvTJIB1BsEmAO8+t
 GGLd9BsAtSydGu8bt9HYoD+32wAarvoq6574TK0ibyA0ywjaM/+nDP++qU0MCcLRm7sS
 VuiRMuBX6qAliZaiAorB8/uPjLYdXhiETNWqi9lBSWlOmqfVqqwaO0+Q1VnY7zTWhMsr
 5LTCkGkCIASS422eQbM/sfjCcyM54TybXEc8HcvYNAzPQ+SU0BfT9sHWTkfKLnObLtes
 6ZD8J+c+Y4SMvY5gFBkYOJE03o+p1MvxFvNTWb6MtE5bgo6KG8twvRAygFUn1x4vTaLC
 WtTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=D8kpHb54C2TKax53/YGs9dz5FGU1BqIxSNHBWOKdGh4=;
 fh=Y0vd7KUI5qg+MMVhv2hmtVIJy1PPu31pnjJxQUYLb0M=;
 b=LBMM2wHiuWkeOT9jZbrraQ44eqpIP35se013qgE4yUdqH6sAcrtREul7vi/ItrvOFJ
 IseFNWeNUx6JaCOpuYasCbXN3AXYHu+9u5L+x80NaPadNtpPH9YLqsIRM1m0mWsH4mhD
 7v2QRpB2I/JCLOLIiKniat/o4CY9AqGsW8gWW2KkkWdbtTEvoBbJ7NaywAnJ6MeN0+Mw
 FDeWMmQfKHFBwHNCQv2Dlz4Zb9OVc0fhy63C6aC/9cP/KDqLMY4v8g/a/8PwrBeFoBQs
 whsTEzl+vDqMeHyeio7p6ORuFp8WjEddqZZ9Q/qaI41JwsPChSC3xxt9yDfFjw1jCdpz
 ZUgQ==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1786037876; x=1786642676; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=D8kpHb54C2TKax53/YGs9dz5FGU1BqIxSNHBWOKdGh4=;
 b=qG5g/jhWIuwHmFn7SN+kjgrB/FkQZeisoBkm/yXUV/hQBSAI1iVh9Un96Md3rY0h0z
 NO+JKS1YtsaYdWWD0ZcwsPs5+1do3ND5kgurVX8IEG0kb6eZEi2TSwCL5Wy6yl4b2SlU
 yhgpmF0OftwEYZnCh2VZzjhIqaV7CIHle5WaOhg5ePUhaowK4E7wPn4U2YcBJzmLlHVc
 2ediRzlBmpZlcTyeN//I5A/6SxIUPup9EZVYBfCWjz+vtjlO5xFueIjFuh9g/tV9inKY
 wA/f/3/CI1WmqQSQlp5F8j5+76q2x73Ozn9gfVtHup+qI/DLd4NmaA8yIwZRGUQD8VHE
 I6iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786037876; x=1786642676;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=D8kpHb54C2TKax53/YGs9dz5FGU1BqIxSNHBWOKdGh4=;
 b=s0pzP6/KZRZ6tXqJFZI5pQhw6Mh8xgcTQW0ENUYcufuQZvhGVnfaF9cIydgVBYJtH1
 ITiCOV8r3Q2e1lItYwUVY5BEp4T5PXx7fKXC2c//rt2DXMUxQqASoAqPC5BN+TxEdAQJ
 kj28ejKGlpShUU1H7r7MvQpc3o+v2+4wONV2QbHGh+DICsc4+yOjGyhdtO1gMv3kMShP
 xF4ynXoq20pgK74FW+0tx2ngv73i1mAIKrF6MAYQGZ5ue5e6436YhACsTQSAMj05RW8w
 oDNeejJVH62XzGszgpB8lHK944AulT8h7Wcm+wOr47LJAFxPp9SzlQJbk37xhkO/uauq
 s3FQ==
X-Gm-Message-State: AOJu0Yx9hn+h2iEG3JXbcWZPrHk0mZUXfXPGflBAdZnyVwUXIj0139LL
 u50PW4gVPDAG5CRt4JanA+c50lcROTzxB79CCmimjdO7tbt3d7Du92XnlwSZ9ZZO+TNZCj1zwLM
 sifibpshVL7Z86hXemblsJatDZRnBMxw=
X-Gm-Gg: AR+sD11w2+fUnUHn7RHoPgN+cvwoG289lwc7uHZHgHvvGD34haz5LN9sA8nIzakihhS
 i5yMb+mDOdkziArlPL4Y5mavyiVs3BCAKrZcf/FFdzihrk2aQUz9KK9vOmVtiYU7BqyxZNV3dDp
 /yjgljmrCczeUK4OVCbkTO+qE3ELaVn/HRoxd2Q+I4b140R7ImawH2A8I6is+mP+9KdTCJuxpHX
 twNvPhHZfbqHObdIifb6VjdCm2ITGpD6B2fQdJvXM+sVho6nYGRXijHlpomBmtjRplbbpteJYRa
 pKv9qy+zcYdGjtgoyifWTOZwUq0W0lfggGhXW6Hpkqp5eJWHHU/NVPyHmaWXUeLS5F4himtiEhT
 LUw/xoBaWs1eQLJhhJBLnu7Jq/6xxjFZq
X-Received: by 2002:a05:690c:6c02:b0:81d:4174:6818 with SMTP id
 00721157ae682-820222e4c47mr102819147b3.13.1786037875675; Thu, 06 Aug 2026
 10:37:55 -0700 (PDT)
MIME-Version: 1.0
References: <20260804021441.3054424-1-talesam@gmail.com>
 <CAHBRX4GYEKniGb8jw-h=QYPi=FpbWRKwHHnfw-K5wYiy6AWfJA@mail.gmail.com>
 <anJZt4PzCE5t49Qg@gsse-cloud1.jf.intel.com>
 <anOcGqIyrA8LUHo/@gsse-cloud1.jf.intel.com>
In-Reply-To: <anOcGqIyrA8LUHo/@gsse-cloud1.jf.intel.com>
From: =?UTF-8?B?VGFsZXMgQS4gTWVuZG9uw6dh?= <talesam@gmail.com>
Date: Thu, 6 Aug 2026 14:37:43 -0300
X-Gm-Features: AUfX_mzrBTONbYkxayjN2V6P4s7xW31SjVn7RfCgKTHZVTLxDuKWK5ijAujO2r4
Message-ID: <CAHBRX4FpsT3CwSrpbLA7dUEpasJOFJxdHTNkU7W81RcQw50AOg@mail.gmail.com>
Subject: Re: [RFC PATCH 0/3] drm/xe: diagnostics and workaround for GuC TLB
 invalidation ack stalls on ARL
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, thomas.hellstrom@linux.intel.com, 
 rodrigo.vivi@intel.com, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
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

> You've been approved in our CI for future revs.

Thanks!

> Also I came across this issue on i915 for MTL [1] which appears to
> indicate the same issue (ARL and MTL are very close and share the same Gu=
C
> firmware), the suggestion is to disable rc6. Unfortunately Xe
> doesn't have a knob for this, but per [1] you can turn off rc6
> in the BIOS. Maybe worth trying.

Good find - that does look like the same ~2.3s signature, and it being
visible on i915/MTL too is an important data point (Daniele asked
exactly that in the other subthread).

On the rc6 angle: I ran an A/B experiment earlier that should be
equivalent to disabling rc6 at the GT level - holding forcewake across
the whole GT for hours (C6 residency pinned at 0ms for the entire
window, verified) - and still hit 9 timeouts in a row, with the same
~2.3s request-to-ack. So at least keeping the GT out of RC6 does not
avoid the stall here. If the BIOS suggestion covers more than GT RC6
(e.g. package C-states), that would be a different experiment - my
consumer ASUS BIOS does not expose an rc6 knob, but I can look for
C-state options if you think it is worth isolating.

Next on my side: switching to the GuC 70.72.1 build Daniele posted and
reporting back, plus GuC logs from severe stalls are now attached to
the gitlab issue.

Thanks,
Tales

Em qua., 5 de ago. de 2026 =C3=A0s 17:25, Matthew Brost
<matthew.brost@intel.com> escreveu:
>
> On Tue, Aug 04, 2026 at 02:29:27PM -0700, Matthew Brost wrote:
> > On Tue, Aug 04, 2026 at 01:34:19PM -0300, Tales A. Mendon=C3=A7a wrote:
> > > Patchwork reports my address is not on the CI allowlist, so CI was no=
t
> > > triggered for this series:
> > >
> > >     Series author address 'talesam@gmail.com' is not on the allowlist=
,
> > > which prevents CI from being automatically triggered.
> > >
> > >   Could one of the project owners click 'retest' on the series (and/o=
r
> > > add me to the allowlist)? Series URL:
> > >
> > >     https://patchwork.freedesktop.org/series/171539/
> > >
> >
> > We'd have to resend this ourselves. I can do this, but I've requested
> > for you to be on our allow list as well. I'll ping here once that goes
> > through.
> >
>
> You are approved on our CI for future patches.
>
> Also I came across this issue in the i915 for MTL [1] which seems to
> indicate the same issue (ARL and MTL are very close and share same GuC
> firmware), the suggestion there is turn off rc6. Unfortunately Xe
> doesn't have a knob to do this but according to [1] you can turn off rc6
> in the BIOS. Might be worth a try.
>
> Matt
>
> [1] https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/14469
>
> > Matt
> >
> > >   Thanks!
> > >   Tales
> > >
> > >
> > > Em seg., 3 de ago. de 2026 =C3=A0s 23:14, Tales A. Mendon=C3=A7a
> > > <talesam@gmail.com> escreveu:
> > > >
> > > > Hi,
> > > >
> > > > This series is a follow-up to the TLB invalidation ack stall I have
> > > > been debugging on ARL, tracked in:
> > > >
> > > >   https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/8678
> > > >
> > > > Summary of the issue: with GuC 70.53.0 on ARL (reproduced on 7d51 a=
nd
> > > > 7dd1 machines here, plus an independent Arc Pro 130T report on the
> > > > issue above), TLB invalidation acks intermittently stall for ~2.3s.
> > > > The H2G request is consumed from the CTB immediately and the G2H CT=
B
> > > > is empty the whole time - the firmware simply does not send the ack
> > > > until much later. The fence timeout fires at 2.25s and the ack land=
s
> > > > tens of ms after it. Userspace blocked on the invalidation (composi=
tor
> > > > buffer unmaps etc.) hitches for the full window.
> > > >
> > > > Patch 1 adds xe_devcoredump_gt() so this kind of hang - which has n=
o
> > > > exec queue or job to blame - leaves a devcoredump with the GuC log =
and
> > > > CT state behind (Matt suggested capturing devcoredumps when we
> > > > discussed the issue; devcoredumps from both machines are attached t=
o
> > > > the issue above).
> > > >
> > > > Patch 2 logs when the ack for a timed out invalidation finally
> > > > arrives. This is what established that the acks are late rather tha=
n
> > > > lost.
> > > >
> > > > Patch 3 is the RFC part: a delayed work that pokes the GuC (status
> > > > register read, CT flush, doorbell ring) every 250ms while an ack is
> > > > overdue. On my machines this converts the guaranteed 2.3s stall int=
o a
> > > > sub-500ms hiccup for the majority of occurrences; a minority of sev=
ere
> > > > episodes ignore 8-9 consecutive doorbells, which points at the GuC
> > > > firmware being internally blocked for the whole window. Full data o=
n
> > > > the issue. I am happy to rework the approach (different delay,
> > > > tying it to the G2H handler, dropping the status read, etc.) - main=
ly
> > > > I would like the firmware side investigated, since no host-side pok=
e
> > > > can fix the severe cases.
> > > >
> > > > Based on drm-tip. Tested for several days on both ARL machines unde=
r
> > > > desktop and VM-heavy workloads.
> > > >
> > > > Thanks,
> > > > Tales
> > > >
> > > > Tales A. Mendon=C3=A7a (3):
> > > >   drm/xe: Capture devcoredump on TLB invalidation timeout
> > > >   drm/xe: Log when a timed out TLB invalidation ack finally arrives
> > > >   drm/xe: Kick GuC while TLB invalidation acks are overdue
> > > >
> > > >  drivers/gpu/drm/xe/xe_devcoredump.c     |  68 ++++++++++++
> > > >  drivers/gpu/drm/xe/xe_devcoredump.h     |   6 ++
> > > >  drivers/gpu/drm/xe/xe_tlb_inval.c       | 131 ++++++++++++++++++++=
+++-
> > > >  drivers/gpu/drm/xe/xe_tlb_inval_types.h |  42 ++++++++
> > > >  4 files changed, 243 insertions(+), 4 deletions(-)
> > > >
> > > > --
> > > > 2.55.0
> > > >
> > >
> > >
> > > --
> > > Com os cumprimentos,
> > >
> > > Tales A. Mendon=C3=A7a
> > > talesam.org
> > > communitybig.org



--=20
Com os cumprimentos,

Tales A. Mendon=C3=A7a
talesam.org
communitybig.org
