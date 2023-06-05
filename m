Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDCF7C77B73
	for <intel-xe@archiver.kernel.org>; Mon,  5 Jun 2023 07:34:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95E2110E18A;
	Mon,  5 Jun 2023 07:34:28 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EE6410E185
 for <intel-xe@lists.freedesktop.org>; Mon,  5 Jun 2023 07:34:26 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8175860DF2
 for <intel-xe@lists.freedesktop.org>; Mon,  5 Jun 2023 07:34:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCA8AC433D2
 for <intel-xe@lists.freedesktop.org>; Mon,  5 Jun 2023 07:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1685950464;
 bh=c4Va8uAa5WE7/+YvZJJTKp3WvLSJkpgDithN5TzSR4k=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=jTYkRsr6SVJc+4EGuuLE8fI+oX+wsj5vOnfgu2ksGB1paLWSCQtTP/ELLllHxVLbs
 uUsmtqwJWdaoR902SRlkFj/5/CbMNhMecLFiRvW7Z+FfFzxHOkrbctA4FIpCj9qjO5
 tOTiZO4f6JZWDn3s7IExpjrJiI9MkL+KvFdjLOkoSTvW/OKPUfc+1XuyAupTkZZHST
 jU4/KzwkWXo1Y+LAZ5uecSU5POO0Q3jS7ora95qJnfpE/XgcQrTMtGbWyFbaBZHP4A
 c33LZjnNCH0a7CupUPq00a2qRUBbywUzw7jOLRhcWLFZtE6sXivfaTFajydGVPbV8P
 VQnqlph7xSL8Q==
Received: by mail-qt1-f172.google.com with SMTP id
 d75a77b69052e-3f6bb5e8ed2so41987031cf.0
 for <intel-xe@lists.freedesktop.org>; Mon, 05 Jun 2023 00:34:24 -0700 (PDT)
X-Gm-Message-State: AC+VfDz4MumNzaJr4dyVhnAb9THYnThgvAFSP/xms4stU23rtXjo9b88
 3sDndElXLZe3hI8/dKC3KdLie5748mkIt52LIrg=
X-Google-Smtp-Source: ACHHUZ56CS8r6ismIuf98TLVurnifzDO99KurHOR7/+m3w/HOGnTWQzVvbd70XYokkgqIeJ1mlv198r6QVJhBcVn7T4=
X-Received: by 2002:ac8:5996:0:b0:3f8:f546:fb63 with SMTP id
 e22-20020ac85996000000b003f8f546fb63mr3286228qte.49.1685950463683; Mon, 05
 Jun 2023 00:34:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230531152338.6-1-francois.dugast@intel.com>
 <uieo7p5pwbj252uxdtmyyozj3crbbrkcm4uevookml3vxqj2ik@c3ilb7d7okcl>
 <ZHd9u1AdemcPGPn3@fdugast-desk.home>
 <jjkmqjebxtljdu4chzjuj7a56xbpttd7wf3wqh6o7ciigb55ur@pgci7bqedka6>
 <CAFCwf11Cz8=3=nnhCTGKN9Coz_dsZL7XcAc9HFyayHRcUCioCg@mail.gmail.com>
 <sptofjhqdc5kjs6fm64ueghqluyi3p7g6x2d63nxruxxp6zzlq@fktu4g44adrs>
In-Reply-To: <sptofjhqdc5kjs6fm64ueghqluyi3p7g6x2d63nxruxxp6zzlq@fktu4g44adrs>
From: Oded Gabbay <ogabbay@kernel.org>
Date: Mon, 5 Jun 2023 10:33:57 +0300
X-Gmail-Original-Message-ID: <CAFCwf10F=AT4apgR++C+usW4MOefM=CHi58Oni0vT-B+QBtVjA@mail.gmail.com>
Message-ID: <CAFCwf10F=AT4apgR++C+usW4MOefM=CHi58Oni0vT-B+QBtVjA@mail.gmail.com>
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

On Thu, Jun 1, 2023 at 7:48=E2=80=AFPM Lucas De Marchi <lucas.demarchi@inte=
l.com> wrote:
>
> On Thu, Jun 01, 2023 at 01:21:06PM +0300, Oded Gabbay wrote:
> >On Wed, May 31, 2023 at 11:29=E2=80=AFPM Lucas De Marchi
> ><lucas.demarchi@intel.com> wrote:
> >>
> >> On Wed, May 31, 2023 at 07:02:51PM +0200, Francois Dugast wrote:
> >> >On Wed, May 31, 2023 at 09:23:45AM -0700, Lucas De Marchi wrote:
> >> >> +Oded
> >> >>
> >> >> On Wed, May 31, 2023 at 03:23:33PM +0000, Francois Dugast wrote:
> >> >> > This series addresses some feedback on xe_drm.h provided here:
> >> >> > https://lists.freedesktop.org/archives/intel-xe/2023-May/004704.h=
tml
> >> >> >
> >> >> > It is based on xe-rev1-2023-05-02, not on drm-xe-next, so it will
> >> >> > likely break CI.
> >> >>
> >> >> As I said on the previous reply, this is not going to fly. Now we h=
ave a
> >> >> patch series against xe-rev1-2023-05-02, pushed as xe-rev2 branch w=
ith
> >> >> *no recorded reviews*, doing things that already conflict with othe=
r
> >> >> fixes that landed in drm-xe-next. Examples: the 32b compat for uapi=
,
> >> >> the mmio refactor, the oob WAs, the probe refactor, etc etc.
> >> >>
> >> >> Also, there are other fixes queued as fixups, which is still the pr=
ocess
> >> >> being used in drm-xe-next. It's also where CI is running. Due to di=
splay
> >> >> being moved up in the branch it's basically the only sane thing to =
do.
> >> >>
> >> >> I think we need we are shooting ourselves on the foot and this revi=
ew
> >> >> process needs to be fixed / agreed upon before we create a mess out=
 of
> >> >> it.
> >> >>
> >> >> Lucas De Marchi
> >> >
> >> >Yes I understand the concern. The intention is to address Oded's feed=
back on the
> >> >revision that was reviewed, so that the next review iteration is mana=
geable and
> >> >not based on a moving target, which could lead to and endless effort.
> >>
> >> and then what are we going to do next? rebase the rest of drm-xe-next =
on top?
> >> How do we guarantee the fixes on top of xe-rev is not breaking stuff?
> >> What about the changes that are already there changing the commits tha=
t
> >> are on xe-rev?
> >>
> >> >
> >> >Maybe I created confusion by sharing on the mailing list but at this =
stage the
> >>
> >> no, that was the right part of it. Reviews on the patches happen on th=
is
> >> mailing list. The wrong part IMO was to push it as a branch before it
> >> got the necessary review and before we know how we are going to
> >> reconciliate things. Rebasing drm-xe-next on xe-rev doesn't
> >> really work for the reasons mentioned above.
> >>
> >> >idea is not to get this series merged, only to get Oded's validation =
that it
> >> >fixes the issues that he reported. Yes this means more work will be r=
equired to
> >> >rebase and create fixups later for drm-xe-next but it seems acceptabl=
e for the
> >> >work that has been done so far.
> >> >
> >> >Do you see a better way that would still satisfy the "not moving targ=
et" goal?
> >>
> >> 0) Ignore the "not moving target" goal
> >
> >Hi Lucas,
> >I would like to say a few things.
> >
> >The first point is that the current xe-rev1 branch was something that
> >Rodrigo and I set-up. If you feel this is not a good starting point
> >for the review, let's talk and decide on a new starting point. Even
> >though I have already invested multiple hours in reviewing it, I can
> >understand the point you are making and I'm willing to re-start the
> >review with a new starting point.
> >
> >The second point is once we make a decision regarding the code
> >baseline (keep using the old or moving to the new), I want *all* of us
> >to agree that newer patches that are sent to the mailing list will not
> >be part of the initial Xe upstreamed code. There are mainly two
> >reasons for that:
> >
> >1. There is a long-standing process of upstreaming a new driver to the
> >Linux kernel and that process assumes a code baseline that doesn't
> >change between revisions, except for addressing code review comments.
> >As a person who has undergone this a couple of times from the side
> >being reviewed I would like to follow this same process here as well
> >:)
> >
> >2. The Xe driver is one big driver, with a large team behind it that
> >continuously sends patches. The code keeps getting re-factored and
> >acquires new features at a high rate. If every revision of the review
> >the baseline code will change, the changes from the previous revision
> >will be too large to review independently. I will have to review the
> >entire driver again... Not to mention how will I be able to easily
> >verify that my comments were addressed properly (btw, I also wrote it
> >here https://lore.kernel.org/intel-xe/CAFCwf124UMR3VQ=3DTr6mT_eTRQi9ssqZ=
qEH4jys1bGggHJjboLw@mail.gmail.com/).
>
> Let me use a few examples:
>
>         22ad50d184c0 ("fixup! drm/xe: Introduce a new DRM driver for Inte=
l GPUs")
>
> Do we want to leave the commit "drm/xe: Introduce a new DRM driver for
> Intel GPUs" as part of the original and then have a Fix commit leaving a
> few hundreds of broken commits?  On other "first driver submissions"
> I've seen that would be frowned upon and it would be expected that this
> is fixed inplace instead of leaving broken commits behind.
>
>         a00a92181ab1 ("fixup! drm/xe: Introduce a new DRM driver for Inte=
l GPUs")
>
> Same thing: a nasty memory corruption lurking there. Do we leave it
> broken?  With the previous (current(?)) process we were actually adding
> these fixups that are later moved back in the git history so things like
> this are never part of the upstream code. Looking at xe-rev2 branch
> being pushed without any code review, why is 83ac6e02bf5e ("drm/xe:
> Remove unused define") more important that deserves being brought back
> to the original submission?
I'm sure there are multiple additional bugs/broken code paths that we
don't know about right now, will be part of the original submission
and will be fixed only in a couple of months or further than that.
Therefore, I don't think this is a critical issue.
But in any case, no one said we need to have the original submission
sent upstream, without additional patches after it in the same merge
cycle.

What is critical imo, is to have confidence that this driver is not
doing something horrendously wrong, like abstracting entire kernel
layers, or putting up a broken uapi, or incorrectly using kernel API,
or whatever.

>
> Another one that comes to mind: the engine vs context name that you
> raised on the other review and I pointed out to the history: would it be
> something to be changed on xe-rev branch and invalidate the other things
> on top?  Or would we better change this in drm-xe-next?

I agree the changes between rev1 and rev2 are often quite significant.
And with all your other input, I think we can consider the following:
1. Halting the review for now.
2. You will prepare a rev2 branch with all the changes we agreed upon
+ updated code to make it more aligned with drm-xe-next.
3. I'll restart the review on rev2, while we agree to keep the
drm-xe-next mostly aligned with the review branch until the review is
over.

>
>  From what I talked with Rodrigo before, we'd actually discuss and agree
> about things that needed to be changed/fixed, particularly on the design
> and interface of the driver (with drm subsystem and with userspace).
> Line by line review with non-critical things would then become gitlab
> issues, like when Matt Roper went through a similar line by line
> review and Rodrigo created a bunch of gitlab issues that are being
> solved in drm-xe-next.
>
> >Therefore, I think we need to agree on some method that won't burn me
> >out and cause me to tell Dave & Daniel I'm giving up on what they
> >asked me to do. One way is to follow the rule above, but if you still
> >disagree with this, I'm open to hearing other suggestions on how to
> >enable a proper review in a timely manner that won't cause me to pull
> >my hair out.
> >
> >In that context, I feel your "Ignore the not moving target goal"
> >statement to Francois was inappropriate. We need to have an agreement,
> >you can't decide that on your own.
>
> What am I deciding on my own and why was that inappropriate?  I went
> back to read again what I wrote to check if it was badly phrased, but I
> don't see it that way. He asked my opinion on a different method, which
> you are also asking when you say "I'm open to hearing other suggestions
> on how to enable a proper review in a timely manner that won't cause me
> to pull my hair out". If you hear and disagree, I'm totally fine with
> it, but asking for it and then saying it's inappropriate to disagree
> with the premise seems odd.
I read it as something else but if you meant it only as a suggestion,
then I take my words back.
>
> I went on and explained *why*, saying that the moving base is already
> there and IMO a better method would be to accept the moving base, with a
> different review method. And if you look at the proposal below, I'm
> actually removing the "moving base" factor between what's being reviewed
> and where the rest of development is happening, CI is running, other
> review comments are being handled, etc.
>
> What I'm currently seeing and I don't agree with:
>
> - Commits are being pushed to a xe-revN branch bypassing code review
Correct, this should not happen. That's why Francois sent them to the
ml and I thought it was sufficient.
>
> - Since CI is running on drm-xe-next, it's also bypassing CI. I was
>    part of enough upstream submissions to know our ability to break
>    things when handling code review comments, which is only noticed later
>    when the rest is rebased on top and CI is running again
I agree, but unless you can trigger CI on specific branch, I think
your only option is to run CI on drm-xe-next after it is rebased over
the final xe-rev branch (after the review is over).
>
> - drm-xe-next and xe-revN are not on the same baseline. If they were,
>    then comparing both would be trivial and we'd probably not have
>    this discussion. Question here on your process: currently xe-rev
>    is on top of drm-next-2023-04-27, which is on top of v6.3-rc4.
>    Is your intention that fixes (to only your review commens) are
>    accumulated  on xe-rev* and then propose this to be merged to drm-next
>    when that is finished, without any rebase?
I thought you would rebase drm-next-xe over the final xe-rev branch.
Then just make sure all those commits on top are passing CI after the rebas=
e.
>
> - changes to "the original submission" that from my pov some are good,
>    some would better be discussed and some that are not critical
>    taking precedence over others that should really be there. And that
>    is happening because there is this disconnect between drm-xe-next and
>    xe-rev as per above.
That's why I don't mind if for xe-rev2, we make it aligned with a
newer baseline that matches drm-xe-next.
I'll continue the review on that branch when it's done.
Then, after the review is over, rebase drm-xe-next over xe-revLast,
which shouldn't be too hard hopefully.

wdyt ?
Thanks,
Oded
>
> - the disconnect will only get worse as we are on 1/6 batch of review
>    comments so I don't see the process scaling well.
>
> Lucas De Marchi
>
> >
> >Thanks,
> >Oded
> >
> >
> >
> >
> >>
> >> 1) The review should be on very a recent rev, not something old with a
> >>     lot of commits on top. That doesn't scale and there will be anothe=
r 100
> >>     patches before the next review round.
> >>
> >>         $ tag=3Dxe-rev1-2023-05-02
> >>         $ s=3D$(git log -1 --format=3D%s $tag)
> >>         $ commit=3D$(git log --grep "$s" -n1 --format=3D%H)
> >>         $ git rev-list $commit..HEAD | wc -l
> >>         208
> >>
> >>     Then as outcome of the review we have more patches to land, rebase
> >>     the rest, etc, etc.  This is a much worse "moving target" and IMO
> >>     it's worse for both reviewers and committers.
> >>
> >> 2) The xe-revX should have the same baseline. That makes for a really
> >>     simple way to check "what changed since I last looked". This can b=
e
> >>     checked on the overall diff with `git diff` or on the amended fixe=
s
> >>     with git range-diff.
> >>
> >>     Currently drm-xe-next is on drm-tip due to the display integration=
.
> >>     Being on drm-next is important for merging the branch upstream, bu=
t
> >>     not so much for these kind of reviews
> >>
> >> 3) Not merge things in the xe-revX branch that is not already
> >>     in drm-xe-next.  Ideally if there are things that really need to
> >>     be changed back in the xe-rev branch, it should be a fixup on
> >>     drm-xe-next that is then brought back to the xe-rev branch.
> >>
> >>
> >> Lucas De Marchi
> >>
> >> >
> >> >Thanks,
> >> >Francois
> >> >
> >> >>
> >> >> >
> >> >> > v2: fix ordering of defines and fields in uAPI (Lucas De Marchi)
> >> >> >
> >> >> > Francois Dugast (5):
> >> >> >  drm/xe: Use SPDX-License-Identifier instead of license text
> >> >> >  drm/xe: Group engine related structs
> >> >> >  drm/xe: Move defines before relevant fields
> >> >> >  drm/xe: Document usage of struct drm_xe_device_query
> >> >> >  drm/xe: Fix some formatting issues in uAPI
> >> >> >
> >> >> > include/uapi/drm/xe_drm.h | 171 ++++++++++++++++++++-------------=
-----
> >> >> > 1 file changed, 90 insertions(+), 81 deletions(-)
> >> >> >
> >> >> > --
> >> >> > 2.34.1
> >> >> >
