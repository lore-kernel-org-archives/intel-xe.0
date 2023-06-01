Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37000C77B7A
	for <intel-xe@archiver.kernel.org>; Thu,  1 Jun 2023 10:21:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4AF510E22F;
	Thu,  1 Jun 2023 10:21:36 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3033710E22F
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Jun 2023 10:21:35 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8F44763990
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Jun 2023 10:21:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03B99C433D2
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Jun 2023 10:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1685614894;
 bh=y+7w2Q578ndLOedaMgLHGcto048XdWRASlmYnCVFIk4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=fd+cJxfW3JVDyOxG4HBvejpS0jF38DeYDo6MBB5YAgZhX4YcsG7uUBsxUV7u6Mec9
 6xnOv9X25K5lcZ+nxDBNhNT0kRZsPghsbyowDR05cCkFM5f3cLxNcMFcKjhlwv4vDi
 dO7rUM3Kk8xZdhlY+l4OAbBYTn2HgfxNwZwcOHNGcSffo7jmrQ6mtLPAnpTno/o6+r
 Zq+wNsKqfB4w8Ct4ErXl14uvI7cj6HyID00uzstfqnFLO7I8tnNcKgYJLhgXWTmT2r
 i/AXgJ0zcdrS7dZkKSzSd5/3ovf7h9cfx3CyMxjuLwdQZH9/HMrmuHTAUKnb8ISW6T
 vwIR+1DoHKRjQ==
Received: by mail-yw1-f172.google.com with SMTP id
 00721157ae682-5689335d2b6so5879487b3.3
 for <intel-xe@lists.freedesktop.org>; Thu, 01 Jun 2023 03:21:33 -0700 (PDT)
X-Gm-Message-State: AC+VfDzPgh17dAhCnZ+pZZ9MKqtUhGz8Fm3NLMVxodxhN4C5IVm3ZDwF
 889npCVlaf+5EWB/8KvMxkde7+RP+q/NGcNPmyA=
X-Google-Smtp-Source: ACHHUZ5Oe87aONc7MzixujuuFOx73Efub+Q82OeuLg781gScGowyvu5B34imr1TMYgu0pSJsZ64W/eSz5LwByq6fAXU=
X-Received: by 2002:a81:4f0e:0:b0:565:caaf:dca4 with SMTP id
 d14-20020a814f0e000000b00565caafdca4mr8674397ywb.0.1685614892949; Thu, 01 Jun
 2023 03:21:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230531152338.6-1-francois.dugast@intel.com>
 <uieo7p5pwbj252uxdtmyyozj3crbbrkcm4uevookml3vxqj2ik@c3ilb7d7okcl>
 <ZHd9u1AdemcPGPn3@fdugast-desk.home>
 <jjkmqjebxtljdu4chzjuj7a56xbpttd7wf3wqh6o7ciigb55ur@pgci7bqedka6>
In-Reply-To: <jjkmqjebxtljdu4chzjuj7a56xbpttd7wf3wqh6o7ciigb55ur@pgci7bqedka6>
From: Oded Gabbay <ogabbay@kernel.org>
Date: Thu, 1 Jun 2023 13:21:06 +0300
X-Gmail-Original-Message-ID: <CAFCwf11Cz8=3=nnhCTGKN9Coz_dsZL7XcAc9HFyayHRcUCioCg@mail.gmail.com>
Message-ID: <CAFCwf11Cz8=3=nnhCTGKN9Coz_dsZL7XcAc9HFyayHRcUCioCg@mail.gmail.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Intel-xe] [PATCH v2 0/5] drm/xe: uAPI cleanup
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, May 31, 2023 at 11:29=E2=80=AFPM Lucas De Marchi
<lucas.demarchi@intel.com> wrote:
>
> On Wed, May 31, 2023 at 07:02:51PM +0200, Francois Dugast wrote:
> >On Wed, May 31, 2023 at 09:23:45AM -0700, Lucas De Marchi wrote:
> >> +Oded
> >>
> >> On Wed, May 31, 2023 at 03:23:33PM +0000, Francois Dugast wrote:
> >> > This series addresses some feedback on xe_drm.h provided here:
> >> > https://lists.freedesktop.org/archives/intel-xe/2023-May/004704.html
> >> >
> >> > It is based on xe-rev1-2023-05-02, not on drm-xe-next, so it will
> >> > likely break CI.
> >>
> >> As I said on the previous reply, this is not going to fly. Now we have=
 a
> >> patch series against xe-rev1-2023-05-02, pushed as xe-rev2 branch with
> >> *no recorded reviews*, doing things that already conflict with other
> >> fixes that landed in drm-xe-next. Examples: the 32b compat for uapi,
> >> the mmio refactor, the oob WAs, the probe refactor, etc etc.
> >>
> >> Also, there are other fixes queued as fixups, which is still the proce=
ss
> >> being used in drm-xe-next. It's also where CI is running. Due to displ=
ay
> >> being moved up in the branch it's basically the only sane thing to do.
> >>
> >> I think we need we are shooting ourselves on the foot and this review
> >> process needs to be fixed / agreed upon before we create a mess out of
> >> it.
> >>
> >> Lucas De Marchi
> >
> >Yes I understand the concern. The intention is to address Oded's feedbac=
k on the
> >revision that was reviewed, so that the next review iteration is managea=
ble and
> >not based on a moving target, which could lead to and endless effort.
>
> and then what are we going to do next? rebase the rest of drm-xe-next on =
top?
> How do we guarantee the fixes on top of xe-rev is not breaking stuff?
> What about the changes that are already there changing the commits that
> are on xe-rev?
>
> >
> >Maybe I created confusion by sharing on the mailing list but at this sta=
ge the
>
> no, that was the right part of it. Reviews on the patches happen on this
> mailing list. The wrong part IMO was to push it as a branch before it
> got the necessary review and before we know how we are going to
> reconciliate things. Rebasing drm-xe-next on xe-rev doesn't
> really work for the reasons mentioned above.
>
> >idea is not to get this series merged, only to get Oded's validation tha=
t it
> >fixes the issues that he reported. Yes this means more work will be requ=
ired to
> >rebase and create fixups later for drm-xe-next but it seems acceptable f=
or the
> >work that has been done so far.
> >
> >Do you see a better way that would still satisfy the "not moving target"=
 goal?
>
> 0) Ignore the "not moving target" goal

Hi Lucas,
I would like to say a few things.

The first point is that the current xe-rev1 branch was something that
Rodrigo and I set-up. If you feel this is not a good starting point
for the review, let's talk and decide on a new starting point. Even
though I have already invested multiple hours in reviewing it, I can
understand the point you are making and I'm willing to re-start the
review with a new starting point.

The second point is once we make a decision regarding the code
baseline (keep using the old or moving to the new), I want *all* of us
to agree that newer patches that are sent to the mailing list will not
be part of the initial Xe upstreamed code. There are mainly two
reasons for that:

1. There is a long-standing process of upstreaming a new driver to the
Linux kernel and that process assumes a code baseline that doesn't
change between revisions, except for addressing code review comments.
As a person who has undergone this a couple of times from the side
being reviewed I would like to follow this same process here as well
:)

2. The Xe driver is one big driver, with a large team behind it that
continuously sends patches. The code keeps getting re-factored and
acquires new features at a high rate. If every revision of the review
the baseline code will change, the changes from the previous revision
will be too large to review independently. I will have to review the
entire driver again... Not to mention how will I be able to easily
verify that my comments were addressed properly (btw, I also wrote it
here https://lore.kernel.org/intel-xe/CAFCwf124UMR3VQ=3DTr6mT_eTRQi9ssqZqEH=
4jys1bGggHJjboLw@mail.gmail.com/).

Therefore, I think we need to agree on some method that won't burn me
out and cause me to tell Dave & Daniel I'm giving up on what they
asked me to do. One way is to follow the rule above, but if you still
disagree with this, I'm open to hearing other suggestions on how to
enable a proper review in a timely manner that won't cause me to pull
my hair out.

In that context, I feel your "Ignore the not moving target goal"
statement to Francois was inappropriate. We need to have an agreement,
you can't decide that on your own.

Thanks,
Oded




>
> 1) The review should be on very a recent rev, not something old with a
>     lot of commits on top. That doesn't scale and there will be another 1=
00
>     patches before the next review round.
>
>         $ tag=3Dxe-rev1-2023-05-02
>         $ s=3D$(git log -1 --format=3D%s $tag)
>         $ commit=3D$(git log --grep "$s" -n1 --format=3D%H)
>         $ git rev-list $commit..HEAD | wc -l
>         208
>
>     Then as outcome of the review we have more patches to land, rebase
>     the rest, etc, etc.  This is a much worse "moving target" and IMO
>     it's worse for both reviewers and committers.
>
> 2) The xe-revX should have the same baseline. That makes for a really
>     simple way to check "what changed since I last looked". This can be
>     checked on the overall diff with `git diff` or on the amended fixes
>     with git range-diff.
>
>     Currently drm-xe-next is on drm-tip due to the display integration.
>     Being on drm-next is important for merging the branch upstream, but
>     not so much for these kind of reviews
>
> 3) Not merge things in the xe-revX branch that is not already
>     in drm-xe-next.  Ideally if there are things that really need to
>     be changed back in the xe-rev branch, it should be a fixup on
>     drm-xe-next that is then brought back to the xe-rev branch.
>
>
> Lucas De Marchi
>
> >
> >Thanks,
> >Francois
> >
> >>
> >> >
> >> > v2: fix ordering of defines and fields in uAPI (Lucas De Marchi)
> >> >
> >> > Francois Dugast (5):
> >> >  drm/xe: Use SPDX-License-Identifier instead of license text
> >> >  drm/xe: Group engine related structs
> >> >  drm/xe: Move defines before relevant fields
> >> >  drm/xe: Document usage of struct drm_xe_device_query
> >> >  drm/xe: Fix some formatting issues in uAPI
> >> >
> >> > include/uapi/drm/xe_drm.h | 171 ++++++++++++++++++++----------------=
--
> >> > 1 file changed, 90 insertions(+), 81 deletions(-)
> >> >
> >> > --
> >> > 2.34.1
> >> >
