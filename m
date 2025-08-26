Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B73F4CA0EFF
	for <intel-xe@archiver.kernel.org>; Wed, 27 Aug 2025 12:28:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53E7910E803;
	Wed, 27 Aug 2025 12:28:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="cyRse94l";
	dkim-atps=neutral
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6624310E6B8
 for <intel-xe@lists.freedesktop.org>; Tue, 26 Aug 2025 18:49:01 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-24611734e50so26255ad.1
 for <intel-xe@lists.freedesktop.org>; Tue, 26 Aug 2025 11:49:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1756234141; x=1756838941;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=E/Ye7/SL7tqTx9oBx/tviBmGnvw5YMp+2zk7nWejWf0=;
 b=cyRse94lhrN03tNoNUZne7hw9vNFcXBOYEf2gnA6S5HO/HsiFNSPHcsMQ3wWyViX/e
 UzWloGD2348tmhXFSVbZb6tJAyMut4pkkdmRRIxDVK22SYagmpQ8ZkLsESwHCb/GC9k1
 ho10tbNP9zMDhWg9yaFh/PpzeX7KQI5sFFQFhZlhNWeW3Ri8LpfBHOKTLVxFw9+opIkX
 IAUFPdZB1mUYh7W2zwXlAZT1X8jAn+hxK5DcYnf7uCxcuguMV9euzWr9xFDb/L9cBion
 yOaIQ5RsNmREfFwjytzA9wqzN3puRwZpGPRp0g5E1Ei7/sf8XhKsXZ53WX3jlZ6NDBZ6
 X7Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756234141; x=1756838941;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=E/Ye7/SL7tqTx9oBx/tviBmGnvw5YMp+2zk7nWejWf0=;
 b=G26cK5QcGtUZjnuoA+RE7dgdaZiaAMY72B7A5A9THkbVgz6Lh6NxA2WmE1aRz5Ud4k
 1XmWqzpKqo1HcX7HTWqXAVRDJ1mOQf8qAcTqHcdduJ1SFPxdbpbdXdTq1XuIx2eKo6OR
 1xooJHuiuFAi2I0o4Ya6lIY6G0CcuvJp26GlPH+HHXzFWVKsYHqESa/6WYXs07mJAtro
 VX80vt8Nk9wvPVTqdb12LqGIL0vF07x05bwcU3OWaDLYq7XjCBeo93gLtbdE0Nj2CGGN
 S5IisjdXQtAExxwkFBai6M6yBdC8jmnuR0eim1Pt17p7sff76HvjMB7MI5/VU7CIdVXO
 4BVg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXSl5uwKHJ1+f7tqolt1S/9b8xDH6eGD6Aj4o0j/TjuUrUS95lX7y/6qr4uXWSlHKec0Ozwfi/4kg==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzAZELXNMKjxKCvOcUrx60cbaVp7OvVikcjEovGgHFy4xlxzOt4
 zI8BX+rRE/UgyTqkhrGwy/CksEAHFko2dCoMyrACidFiaR+GqAtkL5X4ix9W2XlLiM8rmTSs6xu
 73HiPetr34iefRHD/GfaEBzWkBz6RmfxHotpTipwC
X-Gm-Gg: ASbGncvsTXmn+GyQyCZqCw+kkII2hrh4ek4xdwtkE+WsbtEfVidyA1ZzIxRVzFLkyWm
 28NONB323pe/xE8qg2pYW/i1gUNiy1GwD0iPVyT/9RnrI03tyD2xnqwFHUwjDMyJrxS2uXypvRO
 A7n0UQTHWKQ+I22bEg0G2UAO5iNdXn3O4zs96TSDU2l12ikA15JdTa5RuzmouM4+QN+FPP2ZWvX
 SpTyz0F1N66Y451jvpuvPCsUEAgzcMWWW8Xip3awSljNzav6gVgDJdkqr/X8+A+
X-Google-Smtp-Source: AGHT+IG+ollMBmiaOYcyGD4fK0EXbH34IwD2F+IqBBnZbD5S5EK8GUe1Cco16tj20beWZxJ5YP1hQInru/5q0vhDcUY=
X-Received: by 2002:a17:903:228c:b0:243:afef:cd88 with SMTP id
 d9443c01a7336-2486395f193mr4627105ad.11.1756234140425; Tue, 26 Aug 2025
 11:49:00 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1755096883.git.robin.murphy@arm.com>
 <d6cda4e2999aba5794c8178f043c91068fa8080c.1755096883.git.robin.murphy@arm.com>
 <20250826130329.GX4067720@noisy.programming.kicks-ass.net>
 <6080e45d-032e-48c2-8efc-3d7e5734d705@arm.com>
In-Reply-To: <6080e45d-032e-48c2-8efc-3d7e5734d705@arm.com>
From: Ian Rogers <irogers@google.com>
Date: Tue, 26 Aug 2025 11:48:48 -0700
X-Gm-Features: Ac12FXxL0fQGFTk6-3SCJz15Qd8Ums9V_bcQA6gIxaEwQacWk3scYfeQZZ7cYZQ
Message-ID: <CAP-5=fXF2x3hW4Sk+A362T-50cBbw6HVd7KY+QEUjFwT+JL37Q@mail.gmail.com>
Subject: Re: [PATCH 12/19] perf: Ignore event state for group validation
To: Robin Murphy <robin.murphy@arm.com>
Cc: Peter Zijlstra <peterz@infradead.org>, mingo@redhat.com, will@kernel.org, 
 mark.rutland@arm.com, acme@kernel.org, namhyung@kernel.org, 
 alexander.shishkin@linux.intel.com, jolsa@kernel.org, adrian.hunter@intel.com, 
 kan.liang@linux.intel.com, linux-perf-users@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, 
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 imx@lists.linux.dev, linux-csky@vger.kernel.org, loongarch@lists.linux.dev, 
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
 sparclinux@vger.kernel.org, linux-pm@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, dmaengine@vger.kernel.org, 
 linux-fpga@vger.kernel.org, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, coresight@lists.linaro.org, 
 iommu@lists.linux.dev, linux-amlogic@lists.infradead.org, 
 linux-cxl@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Wed, 27 Aug 2025 12:28:22 +0000
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

On Tue, Aug 26, 2025 at 8:32=E2=80=AFAM Robin Murphy <robin.murphy@arm.com>=
 wrote:
>
> On 2025-08-26 2:03 pm, Peter Zijlstra wrote:
> > On Wed, Aug 13, 2025 at 06:01:04PM +0100, Robin Murphy wrote:
> >> It may have been different long ago, but today it seems wrong for thes=
e
> >> drivers to skip counting disabled sibling events in group validation,
> >> given that perf_event_enable() could make them schedulable again, and
> >> thus increase the effective size of the group later. Conversely, if a
> >> sibling event is truly dead then it stands to reason that the whole
> >> group is dead, so it's not worth going to any special effort to try to
> >> squeeze in a new event that's never going to run anyway. Thus, we can
> >> simply remove all these checks.
> >
> > So currently you can do sort of a manual event rotation inside an
> > over-sized group and have it work.
> >
> > I'm not sure if anybody actually does this, but its possible.
> >
> > Eg. on a PMU that supports only 4 counters, create a group of 5 and
> > periodically cycle which of the 5 events is off.

I'm not sure this is true, I thought this would fail in the
perf_event_open when adding the 5th event and there being insufficient
counters for the group. Not all PMUs validate a group will fit on the
counters, but I thought at least Intel's core PMU would validate and
not allow this. Fwiw, the metric code is reliant on this behavior as
by default all events are placed into a weak group:
https://web.git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.gi=
t/tree/tools/perf/util/metricgroup.c?h=3Dperf-tools-next#n631
Weak groups are really just groups that when the perf_event_open fails
retry with the grouping removed. PMUs that don't fail the
perf_event_open are problematic as the reads just report "not counted"
and the metric doesn't work. Sometimes the PMU can't help it due to
errata. There are a bunch of workarounds for those cases carried in
the perf tool, but in general weak groups working is relied upon:
https://web.git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.gi=
t/tree/tools/perf/pmu-events/pmu-events.h?h=3Dperf-tools-next#n16

Thanks,
Ian

> > So I'm not against changing this, but changing stuff like this always
> > makes me a little fearful -- it wouldn't be the first time that when it
> > finally trickles down to some 'enterprise' user in 5 years someone come=
s
> > and finally says, oh hey, you broke my shit :-(
>
> Eww, I see what you mean... and I guess that's probably lower-overhead
> than actually deleting and recreating the sibling event(s) each time,
> and potentially less bother then wrangling multiple groups for different
> combinations of subsets when one simply must still approximate a complex
> metric that requires more counters than the hardware offers.
>
> I'm also not keen to break anything that wasn't already somewhat broken,
> especially since this patch is only intended as cleanup, so either we
> could just drop it altogether, or perhaps I can wrap the existing
> behaviour in a helper that can at least document this assumption and
> discourage new drivers from copying it. Am I right that only
> PERF_EVENT_STATE_{OFF,ERROR} would matter for this, though, and my
> reasoning for state <=3D PERF_EVENT_STATE_EXIT should still stand? As for
> the fiddly discrepancy with enable_on_exec between arm_pmu and others
> I'm not really sure what to think...
>
> Thanks,
> Robin.
