Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FD35C56205
	for <intel-xe@archiver.kernel.org>; Thu,  6 Aug 2026 17:37:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02E4910F278;
	Thu,  6 Aug 2026 17:37:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="tKNyTqx4";
	dkim-atps=neutral
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com
 [209.85.128.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83EF810F279
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Aug 2026 17:37:06 +0000 (UTC)
Received: by mail-yw1-f178.google.com with SMTP id
 00721157ae682-81e8fa1b8d6so35917267b3.1
 for <intel-xe@lists.freedesktop.org>; Thu, 06 Aug 2026 10:37:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786037825; cv=none;
 d=google.com; s=arc-20260327;
 b=GaXMyUhTNVtLOdlZwX4IvPv6Xew4tD7WgxuAsywaa1glVQ7fcnUOn5KWA46CwNNqdw
 Wutw8lh8WQYkZEPwjOs/29/Kcz/O97B6IzH6pxEK7zRzRguDsRLPG69w8UBzX4fmzg3u
 5XW1QzvfgitWe/lKAlrW2ryF3fR+ZCK3JNpkkPKOUWa1S3B6BkGJnmEeFxB5YJ1C6o6R
 1raQZln8b4cs8vNdNgZWge0Xm/EX6BEBkgZc+2uCRxINkEz3sGBU9eESB6NhQGhBRS2w
 5qMVXTE3d/MsEz3hdhttQdjNZCNFuPP+gQSb0xWLa5Rl1SA4bnRXusOnu5I6Mpl0ZULT
 qdeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=1ti4zZBL3pMi8XmAuN1mdDFzCdeNUWNiFemBwgtfUR0=;
 fh=y6OG2OR0gBYR1DbSFb/JFnMSBt4zkroZufhjvn66GaQ=;
 b=T1xGB1v5aIM3Nhgra0Ulg/ArsEmkyi3IL7mqV1iZVAlphqSPmiN/bsM8vDkJjLYDU9
 pu81QHXzAzCKoTKQ/Y6jchnnYAJ5pRkpA+3NH/cSTEj9noacYZ4X7mRPpB2SFAKFCv/g
 hSsHPBT5amF0c6jEnRKDILYaoLVzCeSioDbFR1q87O06urDO+0DNA2aimLq+Kdck3nqN
 RkNpCmqrLpRbRgfbvA5SjASS1eK4Df66BDk81vnhf1OnW6rhtQyN46K5efH3RdBEUd/c
 SOY4uIGRsIHUlUN48nh3LVczFQt4E9NHZDjlB41T8DYgVozMjlFv82HXbUfqICJ/1m2s
 wI/w==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1786037825; x=1786642625; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=1ti4zZBL3pMi8XmAuN1mdDFzCdeNUWNiFemBwgtfUR0=;
 b=tKNyTqx4ynXIRew1HDQmBUq3EDbJ3zDdJXU2zhQd+rLkKYaTuqvX8CNxAUOzfPQMNn
 ebcIjKsBM5UBn64LbhNWwdz5N8/cfdZFLY/nMD2Cc+hUt0JEtLdpcTEqqIkZilt6huxu
 JG6O4hpX04xdMzQ3nDT6TOM8BdhfzxH+B59QU/6GBVoOVabN2FuoaLasKtjtLZj/geEU
 97xgeq1rUOk1YFC4+bz1tddNfB4YrfuXnFN8oNK8oOaBOL/MBBagsXaAYvG610Rp5njh
 X3RfWIuDl1Hsw4LmpFka14zFPQPbnp66a5fMYT1q1NmLCYxgN8wuy4x73kytGwiYmTOI
 AExg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786037825; x=1786642625;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=1ti4zZBL3pMi8XmAuN1mdDFzCdeNUWNiFemBwgtfUR0=;
 b=b+ll+ECvK43Iti0jHuelQMijT1hO0E35/ZKAf1mPLpA6Lnjk4WlOK3MDFU/E1200G0
 OjO3Yp8tIIlnVhScWbNtxLJgHOLQ0Mw28P7f/oVwVSbfn93A0b2LyUXbITRSODNH8L6L
 lm/XxtU/MYMRINOeiIIPB0k5ycgtMFH86ZRssYmCm0YsRJLYr2oC8nHx8M5J/wIR3naU
 q6g7i8Yhv8hCGS2y19OMXEQ37JROHcfQJkfHubKLkwd/5zkw07HPnLV8Y4BqaxwqsyHu
 OtfCAySCMfls/vYKK6GCtmWPwaGtCdTq28LJ32ASe9jTYaQYN3CJogWFLAdKQUz0twKR
 Gwkg==
X-Forwarded-Encrypted: i=1;
 AHgh+RqOrVHOskGlHpzWi1pTCceF9/jjMEtTf1bc7EqnS22ndiYmqOPMsLkDSR/UCAnm98dRwgfExmTQzw==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyAEeNfVWeMZnuIfwdjhtkeImzgRwM+HIdbh7m98aMKWOUOB7lI
 t0oRzwOLrgPhAzl33svTqrLi9r9VSC7sW7Zdomzmln/aEobSnV/1BVuclLkM+iUu947PE/XVo6F
 xARJI/USS9lJpF+9M2YsxvhPH/pg+iyY=
X-Gm-Gg: AR+sD13+VtmgV0MrK87+3FeA15f31SWiPOt4DIvMBXYgvgSzB0C10Y6PDsrK8GYSd10
 655B6gYII4fO+e2FH6ieB3c8tiQlx227B3x4rowGPDuRbJxXfXfo7iBChcj2hTW9GZfMGUmD6nm
 fywO4ilXLn2mZhmEODDuLZaHbymIWntj5CZ+w0PFQ6G8is2OYYs8mqLxRv+eSwHVAMPUu0N5t6J
 PIFhErdHc+MVv2PxEIEk71nz4YQNHqWWfgB1nFGeRRtPY4KkSCakBUc10fFTT/QkvJR3HkY1swh
 +oTKbVFNds5GkdnTSSKK8+rmBsXfOlrkIONoQgrjmR1HhuuEb1K48XkisaRGPNLr4LMEnsPGST8
 Ju3/8544QyXQn8+Crs/vDXUcaQ6dDy1h7
X-Received: by 2002:a05:690c:6908:b0:81e:89b2:8caa with SMTP id
 00721157ae682-820229909b1mr102918047b3.29.1786037825202; Thu, 06 Aug 2026
 10:37:05 -0700 (PDT)
MIME-Version: 1.0
References: <20260804021441.3054424-1-talesam@gmail.com>
 <c0c50dff0f9b64a2db8e1470d75e450ba35cccde.camel@intel.com>
 <anJZSDD+lmzbaE7b@gsse-cloud1.jf.intel.com>
 <176e54adc75dc9b947caadbf95333df1b60c0240.camel@intel.com>
 <cb06c8e0-0cf8-4dc2-a586-77aafc95f0c0@intel.com>
 <CAHBRX4ErWF0e4X9DCXyycyqJUHaVcv36J=X0PRrNANqZxrzidg@mail.gmail.com>
 <49792f00-d8e3-41c7-ab2d-1d7efe4b5aca@intel.com>
In-Reply-To: <49792f00-d8e3-41c7-ab2d-1d7efe4b5aca@intel.com>
From: =?UTF-8?B?VGFsZXMgQS4gTWVuZG9uw6dh?= <talesam@gmail.com>
Date: Thu, 6 Aug 2026 14:36:53 -0300
X-Gm-Features: AUfX_mwNE1ml01qiywwHeI9ZzDVWApKtpCu29ZCry6Uwx4vIn1W32Tda3NV2dH0
Message-ID: <CAHBRX4ELrBJcRj-8LLryKT_0Jnc-8R0ZFLc4N4fu6yDb6f=wDQ@mail.gmail.com>
Subject: Re: [RFC PATCH 0/3] drm/xe: diagnostics and workaround for GuC TLB
 invalidation ack stalls on ARL
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: "Summers, Stuart" <stuart.summers@intel.com>, "Brost,
 Matthew" <matthew.brost@intel.com>, 
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>, 
 "thomas.hellstrom@linux.intel.com" <thomas.hellstrom@linux.intel.com>, 
 "Filipchuk, Julia" <julia.filipchuk@intel.com>
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

> That would definitely help, because if the issue does not happen on i915
> it likely means that we're missing a WA or something like that in Xe.

Two data points on that, pulling in different directions:

* My second ARL machine (7dd1) has been running i915 for 7 days now,
  with the same GuC 70.53.0, and there is not a single TLB invalidation
  timeout or GuC error in its logs. Caveat: i915's TLB invalidation
  timeout is longer than xe's 2.25s, so short stalls could be silent
  there.

* However, Matt just pointed at i915 MTL issue 14469, which looks like
  the same problem on i915 - so it may not be xe-specific after all.

If it helps I can also boot i915 on the primary machine (7d51), where I
can compare against days of xe statistics on identical workloads.

> Just a bit of a terminology update here, to make sure we're on the same
> page: we usually refer to the notification you're sending to the GuC as
> an H2G interrupt and not a doorbell.

Thanks for the correction - I will use H2G interrupt from here on and
fix the terminology in v2.

> It feels like when the
> issue occurs something is stuck in HW rather than GuC FW and triggering
> the interrupt causes the HW to get unstuck.

That fits a pattern I can now see clearly with more data. Since
enabling the bigger GuC logs (~1.5 days, 35 stalls): 12 stalls were
unstuck by one of the H2G interrupts within 0.3-1.5s, but 23 ignored
8-9 consecutive interrupts and ran to the end. And in those severe
cases the request-to-ack time is nearly constant: 2.28-2.34s, every
single time. It does not look like congestion - it looks like a fixed
internal timeout expiring somewhere and releasing things.

Related: an A/B experiment I ran earlier (holding forcewake across the
whole GT, C6 residency pinned at 0ms for the whole window) still hit 9
timeouts in a row, so GT-level RC6 avoidance alone does not prevent it.

> Also, would you be able to capture the GuC logs when the issue occurs?

Done. I rebuilt with the debug-sized log buffers (8M event data / 1M
crash dump / 1M state capture) and xe.guc_log_level=3D3, and the series'
patch 1 (devcoredump on TLB invalidation timeout) captures the GuC log
at the exact moment the timeout fires. I attached three devcoredumps
(4-8.7MB each, containing the full GuC log around severe stalls that
ignored 8-9 H2G interrupts) to the gitlab issue:

  https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/8678

I have more captures if useful (9 so far).

> I have pushed the latest GuC FW for MTL here in case you want to give it
> a go:

Downloaded and staged - I will switch to 70.72.1 via
xe.guc_firmware_path today and report back with a few days of data
(this machine currently reproduces 20-35 stalls/day under my normal
workload, so the signal should be quick).

Thanks,
Tales

Em ter., 4 de ago. de 2026 =C3=A0s 20:50, Daniele Ceraolo Spurio
<daniele.ceraolospurio@intel.com> escreveu:
>
>
>
> On 8/4/2026 4:00 PM, Tales A. Mendon=C3=A7a wrote:
> >> Are we seeing this on i915?
> > I have not tested i915 on the affected machines yet - the
> > instrumentation that measured the stalls (late-ack logging, kick
> > results) is xe-only, so I have no comparable i915 data. I can boot one
> > of the ARL machines with i915 for a few days and watch for TLB
> > invalidation timeouts there, if that data helps.
>
> That would definitely help, because if the issue does not happen on i915
> it likely means that we're missing a WA or something like that in Xe.
>
> >
> > More generally: both machines here reproduce reliably (~1 stall/hour
> > on a desktop workload, much more under memory pressure), so I am happy
> > to test anything on them - including any GuC build the firmware team
> > would like data on.
> >
> > On Stuart's masking concern: fully agreed, that is why patch 3 is
> > marked RFC. Patches 1-2 are pure diagnostics and stand on their own; I
> > am fine holding patch 3 until the firmware side has been looked at.
> > The data point it adds is that a doorbell ring unblocks the ack in the
> > majority of episodes, while the severe ones ignore 8-9 consecutive
> > rings - hopefully that narrows where to look inside the GuC.
>
> Just a bit of a terminology update here, to make sure we're on the same
> page: we usually refer to the notification you're sending to the GuC as
> an H2G interrupt and not a doorbell. I'm making this clarification
> because the GuC supports a separate per-context notification mechanism
> that is referred to as doorbell and which we currently do not implement
> in neither i915 nor Xe.
>
> When receiving the H2G interrupt, the only thing that the GuC does is
> look into the CTB and process anything in there; however, you've said
> that the contents of the H2G CTB are processed immediately, so the
> follow up interrupt should result in the GuC just bailing out and doing
> nothing because there is no data to process. It feels like when the
> issue occurs something is stuck in HW rather than GuC FW and triggering
> the interrupt causes the HW to get unstuck.
>
> I have pushed the latest GuC FW for MTL here in case you want to give it
> a go:
> https://gitlab.com/dceraolo/drm-firmware/-/blob/f783b931555be057dafc2400b=
7eb4d445c953fec/i915/mtl_guc_70.72.1.bin
> . You can override the GuC firmware used by the driver via the
> xe.guc_firmware_path modparam; the path is relative to /lib/firmware/
> and the firmware needs to be in initramfs for the driver to find it at
> boot. Note that we haven't tested this image on MTL, so it might have
> unexpected results.
>
> Also, would you be able to capture the GuC logs when the issue occurs?
> The default guc log size is relatively small, so you'd have to capture
> right when the issue happens. However, you can make them bigger by
> building the kernel with CONFIG_DRM_XE_DEBUG or by simply modifying the
> xe_guc_log.h file to pick the bigger size by default. If you go with the
> latter, please also set xe.guc_log_level=3D3 on the command line (this is
> automatically added by the kconfig).
>
> Thanks,
> Daniele
>
> >
> > I will send a v2 addressing Matt's review comments (the
> > __xe_devcoredump unification and the fixes on patch 2).
> >
> > Thanks,
> > Tales
> >
> > Em ter., 4 de ago. de 2026 =C3=A0s 19:08, Daniele Ceraolo Spurio
> > <daniele.ceraolospurio@intel.com> escreveu:
> >>
> >>
> >> On 8/4/2026 2:33 PM, Summers, Stuart wrote:
> >>> On Tue, 2026-08-04 at 14:27 -0700, Matthew Brost wrote:
> >>>> On Tue, Aug 04, 2026 at 03:02:44PM -0600, Summers, Stuart wrote:
> >>>>> On Mon, 2026-08-03 at 23:14 -0300, Tales A. Mendon=C3=A7a wrote:
> >>>>>> Hi,
> >>>>>>
> >>>>>> This series is a follow-up to the TLB invalidation ack stall I
> >>>>>> have
> >>>>>> been debugging on ARL, tracked in:
> >>>>>>
> >>>>>>     https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/8678
> >>>>>>
> >>>>>> Summary of the issue: with GuC 70.53.0 on ARL (reproduced on 7d51
> >>>>>> and
> >>>>>> 7dd1 machines here, plus an independent Arc Pro 130T report on
> >>>>>> the
> >>>>>> issue above), TLB invalidation acks intermittently stall for
> >>>>>> ~2.3s.
> >>>>>> The H2G request is consumed from the CTB immediately and the G2H
> >>>>>> CTB
> >>>>>> is empty the whole time - the firmware simply does not send the
> >>>>>> ack
> >>>>>> until much later. The fence timeout fires at 2.25s and the ack
> >>>>>> lands
> >>>>>> tens of ms after it. Userspace blocked on the invalidation
> >>>>>> (compositor
> >>>>>> buffer unmaps etc.) hitches for the full window.
> >>>>> Firstly, thanks for the patch!
> >>>>>
> >>>>> I haven't looked in to all the details of the sighting you were
> >>>>> debugging, but we have had similar issues that were fixed in a
> >>>>> later
> >>>>> GuC version. I think around 70.60.0? It might be worth trying on
> >>>>> something later than that to see if that helps... (+Daniele)
> >>>>>
> >>>> I think this would require an AR on our end to make a new firmware
> >>>> version available.
> >>>>
> >>>> The upstream repo only has 70.53.0 available for ARL [1] (iirc, ARL
> >>>> aliases to MTL for firmware). (+Julia too).
> >>>>
> >>>> Presumably, the GuC changelogs should indicate whether an issue
> >>>> related
> >>>> this has been fixed. If so, we need to update all GuC versions acros=
s
> >>>> both i915 and Xe.
> >>> Right... I guess I'd still like to see if we can test this in GuC (or
> >>> get confirmation we can't for some reason) before committing somethin=
g.
> >>> My worry is we will prevent bug reports like this by working around i=
t
> >>> and miss critical bugs that need to be fixed in the right component.
> >>>
> >>>> [1]
> >>>> https://gitlab.com/kernel-firmware/linux-firmware/-/blob/main/i915/m=
tl_guc_70.bin?ref_type=3Dheads
> >>>>
> >>>>>> Patch 1 adds xe_devcoredump_gt() so this kind of hang - which has
> >>>>>> no
> >>>>> Is there a reason we don't just re-use the main xe_devcoredump()?
> >>>>>
> >>>> This is my suggestion: the main devcoredump infrastructure is job-
> >>>> based,
> >>>> so it cannot be used for hangs that are not associated with a job.
> >>>>
> >>>> In my opinion, this is a gap on our end. Introducing something like
> >>>> `xe_devcoredump_gt()`, which can be used for non-job-based hangs
> >>>> (e.g.,
> >>>> TLB invalidation timeouts like those addressed in this series, or
> >>>> more
> >>>> generally any GuC protocol hang), makes sense to me.
> >>> Ok makes sense. We can do that here. It would be nice to have a more
> >>> inclusive implementation that lets us call this from anywhere so we
> >>> aren't duplicating things around for different use cases. But not a
> >>> blocker here.
> >>>
> >>>> I haven't looked at the patch yet, but at a high level, adding
> >>>> `xe_devcoredump_gt()` seems like a reasonable approach.
> >>>>
> >>>>>> exec queue or job to blame - leaves a devcoredump with the GuC
> >>>>>> log
> >>>>>> and
> >>>>>> CT state behind (Matt suggested capturing devcoredumps when we
> >>>>>> discussed the issue; devcoredumps from both machines are attached
> >>>>>> to
> >>>>>> the issue above).
> >>>>>>
> >>>>>> Patch 2 logs when the ack for a timed out invalidation finally
> >>>>>> arrives. This is what established that the acks are late rather
> >>>>>> than
> >>>>>> lost.
> >>>>>>
> >>>>>> Patch 3 is the RFC part: a delayed work that pokes the GuC
> >>>>>> (status
> >>>>>> register read, CT flush, doorbell ring) every 250ms while an ack
> >>>>>> is
> >>>>>> overdue. On my machines this converts the guaranteed 2.3s stall
> >>>>>> into
> >>>>> I'm a little worried we're just papering over something here that
> >>>>> needs
> >>>>> to be addressed in GuC, particularly around GT going to sleep or
> >>>>> something around the time we're expecting a response, so the pings
> >>>>> on
> >>>>> registers might be prematurely waking things up which is something
> >>>>> we'd
> >>>>> want to happen in GuC, not the KMD.
> >>>>>
> >>>> In general, I agree with this. We should avoid papering over the
> >>>> issue
> >>>> and instead fix it properly in the GuC. That said, this workaround
> >>>> provides a pretty strong data point, since it appears to get the TLB
> >>>> invalidation unstuck.
> >>> So if we hit this issue I guess we're already going to have some
> >>> performance degredation and the workaround makes that better. I need =
to
> >>> look at the implementation, but we could be potentially introducing
> >>> performance penalties in other areas doing these pings.
> >>>
> >>> Again, I'd like to see if we can fix this in the right place before
> >>> implementing a workaround for it. Hopefully Daniele or Julia can give
> >>> some direction there.
> >> Are we seeing this on i915 at all? Given that Xe does not officially
> >> support MTL/ARL and is missing several critical WAs for those platform=
s,
> >> the approach so far has been to only update the GuC FW if it is requir=
ed
> >> for i915.
> >> Looking at the GuC release notes, there have been a couple of
> >> TLB-related fixes after 70.53, but they're both marked as only affecti=
ng
> >> PVC and Xe2+ platforms, so no fixes seem to be available for ARL (or a=
t
> >> least they're not listed in the release notes).
> >>
> >> Daniele
> >>
> >>> Thanks,
> >>> Stuart
> >>>
> >>>> Matt
> >>>>
> >>>>> Thanks,
> >>>>> Stuart
> >>>>>
> >>>>>> a
> >>>>>> sub-500ms hiccup for the majority of occurrences; a minority of
> >>>>>> severe
> >>>>>> episodes ignore 8-9 consecutive doorbells, which points at the
> >>>>>> GuC
> >>>>>> firmware being internally blocked for the whole window. Full data
> >>>>>> on
> >>>>>> the issue. I am happy to rework the approach (different delay,
> >>>>>> tying it to the G2H handler, dropping the status read, etc.) -
> >>>>>> mainly
> >>>>>> I would like the firmware side investigated, since no host-side
> >>>>>> poke
> >>>>>> can fix the severe cases.
> >>>>>>
> >>>>>> Based on drm-tip. Tested for several days on both ARL machines
> >>>>>> under
> >>>>>> desktop and VM-heavy workloads.
> >>>>>>
> >>>>>> Thanks,
> >>>>>> Tales
> >>>>>>
> >>>>>> Tales A. Mendon=C3=A7a (3):
> >>>>>>     drm/xe: Capture devcoredump on TLB invalidation timeout
> >>>>>>     drm/xe: Log when a timed out TLB invalidation ack finally
> >>>>>> arrives
> >>>>>>     drm/xe: Kick GuC while TLB invalidation acks are overdue
> >>>>>>
> >>>>>>    drivers/gpu/drm/xe/xe_devcoredump.c     |  68 ++++++++++++
> >>>>>>    drivers/gpu/drm/xe/xe_devcoredump.h     |   6 ++
> >>>>>>    drivers/gpu/drm/xe/xe_tlb_inval.c       | 131
> >>>>>> +++++++++++++++++++++++-
> >>>>>>    drivers/gpu/drm/xe/xe_tlb_inval_types.h |  42 ++++++++
> >>>>>>    4 files changed, 243 insertions(+), 4 deletions(-)
> >>>>>>
> >
>


--=20
Com os cumprimentos,

Tales A. Mendon=C3=A7a
talesam.org
communitybig.org
