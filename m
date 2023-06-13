Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 452F9C7EE2E
	for <intel-xe@archiver.kernel.org>; Tue, 13 Jun 2023 10:52:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1076E10E368;
	Tue, 13 Jun 2023 10:52:39 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BFEE10E368
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Jun 2023 10:52:36 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1FB1B61440
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Jun 2023 10:52:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AB98C433D2
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Jun 2023 10:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686653554;
 bh=LZHm6ofYB7z8gH3zQMZEuPJeZVJrQKFgbyWxh9uFlS0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=rETVLb+8F9D5BxaLdEwuHATMebyGe2T7rkLrKzS+OLC5VMifUBlB33QBkA9FsFUAY
 glUKCX244rz06DwW+kzoesVLb8KE130MPDov0PNp259/f/pwZ1DwqY4niplrfC/11u
 qKijlydCjoNz+7hITV4jj4HcOL6oaSh8JmQiPtE4sZoTaBDJ2E9YXwsgVU75v4Gkmn
 YiFC9dj7ocuc9WCJjXQJGIDPvs/fHXvxG2r7A2CvAqKVKiCeu5l4LNh57kZC7NkRPc
 Rz74EbiDEmx25KnVe9CuOUQapnlQqG5kiCfJlRV/SiwYob3HvuDyha0US25GpP98n8
 YzKoNz3HBcgkA==
Received: by mail-yw1-f172.google.com with SMTP id
 00721157ae682-56d07c7cf03so31590747b3.1
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Jun 2023 03:52:34 -0700 (PDT)
X-Gm-Message-State: AC+VfDyBOJiQ8xdgWK83O8RfgPU60Fcng674Bv2g2TpGWUt/q9g/Y+Oq
 Urt4UGgkbE1CkM824C78c/CNetq2pGiDVRRPRa0=
X-Google-Smtp-Source: ACHHUZ6f7YnAjd+SUMjt+FnQSe3kaMJqi2/gevFMITR0MBcd6zIruqUePX81BMZ50sQp31aM0fDicCTv1iCpErYe6mI=
X-Received: by 2002:a81:4744:0:b0:56c:e88e:de9a with SMTP id
 u65-20020a814744000000b0056ce88ede9amr1403695ywa.39.1686653553364; Tue, 13
 Jun 2023 03:52:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230531152338.6-1-francois.dugast@intel.com>
 <uieo7p5pwbj252uxdtmyyozj3crbbrkcm4uevookml3vxqj2ik@c3ilb7d7okcl>
 <ZHd9u1AdemcPGPn3@fdugast-desk.home>
 <jjkmqjebxtljdu4chzjuj7a56xbpttd7wf3wqh6o7ciigb55ur@pgci7bqedka6>
 <CAFCwf11Cz8=3=nnhCTGKN9Coz_dsZL7XcAc9HFyayHRcUCioCg@mail.gmail.com>
 <sptofjhqdc5kjs6fm64ueghqluyi3p7g6x2d63nxruxxp6zzlq@fktu4g44adrs>
 <CAFCwf10F=AT4apgR++C+usW4MOefM=CHi58Oni0vT-B+QBtVjA@mail.gmail.com>
 <jifbozq2jzctt2a226hectd5izr757haxl4jrqduxhhhshfcox@i54q36fox4at>
 <CAFCwf10kqEdmv0n+wzcZ5Wad6SheWB7cvStWq2+23fwGVWAu6g@mail.gmail.com>
 <z3h35yqsti5koywkzbrsdsxtgti62m4i3vbsdsi2br5gurbinx@fprbtlmy5km4>
In-Reply-To: <z3h35yqsti5koywkzbrsdsxtgti62m4i3vbsdsi2br5gurbinx@fprbtlmy5km4>
From: Oded Gabbay <ogabbay@kernel.org>
Date: Tue, 13 Jun 2023 13:52:06 +0300
X-Gmail-Original-Message-ID: <CAFCwf12QA9beJ5YwN6RvDaop7-OX8zWqZTn4RWpfj2nrip2_Vg@mail.gmail.com>
Message-ID: <CAFCwf12QA9beJ5YwN6RvDaop7-OX8zWqZTn4RWpfj2nrip2_Vg@mail.gmail.com>
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

On Wed, Jun 7, 2023 at 10:42=E2=80=AFPM Lucas De Marchi
<lucas.demarchi@intel.com> wrote:
>
> On Tue, Jun 06, 2023 at 01:58:43PM +0300, Oded Gabbay wrote:
> >On Mon, Jun 5, 2023 at 11:09=E2=80=AFPM Lucas De Marchi
> ><lucas.demarchi@intel.com> wrote:
> >>
> >> On Mon, Jun 05, 2023 at 10:33:57AM +0300, Oded Gabbay wrote:
> >> >On Thu, Jun 1, 2023 at 7:48=E2=80=AFPM Lucas De Marchi <lucas.demarch=
i@intel.com> wrote:
> >> >>
> >> >> On Thu, Jun 01, 2023 at 01:21:06PM +0300, Oded Gabbay wrote:
> >> >> >On Wed, May 31, 2023 at 11:29=E2=80=AFPM Lucas De Marchi
> >> >> ><lucas.demarchi@intel.com> wrote:
> >> >> >>
> >> >> >> On Wed, May 31, 2023 at 07:02:51PM +0200, Francois Dugast wrote:
> >> >> >> >On Wed, May 31, 2023 at 09:23:45AM -0700, Lucas De Marchi wrote=
:
> >> >> >> >> +Oded
> >> >> >> >>
> >> >> >> >> On Wed, May 31, 2023 at 03:23:33PM +0000, Francois Dugast wro=
te:
> >> >> >> >> > This series addresses some feedback on xe_drm.h provided he=
re:
> >> >> >> >> > https://lists.freedesktop.org/archives/intel-xe/2023-May/00=
4704.html
> >> >> >> >> >
> >> >> >> >> > It is based on xe-rev1-2023-05-02, not on drm-xe-next, so i=
t will
> >> >> >> >> > likely break CI.
> >> >> >> >>
> >> >> >> >> As I said on the previous reply, this is not going to fly. No=
w we have a
> >> >> >> >> patch series against xe-rev1-2023-05-02, pushed as xe-rev2 br=
anch with
> >> >> >> >> *no recorded reviews*, doing things that already conflict wit=
h other
> >> >> >> >> fixes that landed in drm-xe-next. Examples: the 32b compat fo=
r uapi,
> >> >> >> >> the mmio refactor, the oob WAs, the probe refactor, etc etc.
> >> >> >> >>
> >> >> >> >> Also, there are other fixes queued as fixups, which is still =
the process
> >> >> >> >> being used in drm-xe-next. It's also where CI is running. Due=
 to display
> >> >> >> >> being moved up in the branch it's basically the only sane thi=
ng to do.
> >> >> >> >>
> >> >> >> >> I think we need we are shooting ourselves on the foot and thi=
s review
> >> >> >> >> process needs to be fixed / agreed upon before we create a me=
ss out of
> >> >> >> >> it.
> >> >> >> >>
> >> >> >> >> Lucas De Marchi
> >> >> >> >
> >> >> >> >Yes I understand the concern. The intention is to address Oded'=
s feedback on the
> >> >> >> >revision that was reviewed, so that the next review iteration i=
s manageable and
> >> >> >> >not based on a moving target, which could lead to and endless e=
ffort.
> >> >> >>
> >> >> >> and then what are we going to do next? rebase the rest of drm-xe=
-next on top?
> >> >> >> How do we guarantee the fixes on top of xe-rev is not breaking s=
tuff?
> >> >> >> What about the changes that are already there changing the commi=
ts that
> >> >> >> are on xe-rev?
> >> >> >>
> >> >> >> >
> >> >> >> >Maybe I created confusion by sharing on the mailing list but at=
 this stage the
> >> >> >>
> >> >> >> no, that was the right part of it. Reviews on the patches happen=
 on this
> >> >> >> mailing list. The wrong part IMO was to push it as a branch befo=
re it
> >> >> >> got the necessary review and before we know how we are going to
> >> >> >> reconciliate things. Rebasing drm-xe-next on xe-rev doesn't
> >> >> >> really work for the reasons mentioned above.
> >> >> >>
> >> >> >> >idea is not to get this series merged, only to get Oded's valid=
ation that it
> >> >> >> >fixes the issues that he reported. Yes this means more work wil=
l be required to
> >> >> >> >rebase and create fixups later for drm-xe-next but it seems acc=
eptable for the
> >> >> >> >work that has been done so far.
> >> >> >> >
> >> >> >> >Do you see a better way that would still satisfy the "not movin=
g target" goal?
> >> >> >>
> >> >> >> 0) Ignore the "not moving target" goal
> >> >> >
> >> >> >Hi Lucas,
> >> >> >I would like to say a few things.
> >> >> >
> >> >> >The first point is that the current xe-rev1 branch was something t=
hat
> >> >> >Rodrigo and I set-up. If you feel this is not a good starting poin=
t
> >> >> >for the review, let's talk and decide on a new starting point. Eve=
n
> >> >> >though I have already invested multiple hours in reviewing it, I c=
an
> >> >> >understand the point you are making and I'm willing to re-start th=
e
> >> >> >review with a new starting point.
> >> >> >
> >> >> >The second point is once we make a decision regarding the code
> >> >> >baseline (keep using the old or moving to the new), I want *all* o=
f us
> >> >> >to agree that newer patches that are sent to the mailing list will=
 not
> >> >> >be part of the initial Xe upstreamed code. There are mainly two
> >> >> >reasons for that:
> >> >> >
> >> >> >1. There is a long-standing process of upstreaming a new driver to=
 the
> >> >> >Linux kernel and that process assumes a code baseline that doesn't
> >> >> >change between revisions, except for addressing code review commen=
ts.
> >> >> >As a person who has undergone this a couple of times from the side
> >> >> >being reviewed I would like to follow this same process here as we=
ll
> >> >> >:)
> >> >> >
> >> >> >2. The Xe driver is one big driver, with a large team behind it th=
at
> >> >> >continuously sends patches. The code keeps getting re-factored and
> >> >> >acquires new features at a high rate. If every revision of the rev=
iew
> >> >> >the baseline code will change, the changes from the previous revis=
ion
> >> >> >will be too large to review independently. I will have to review t=
he
> >> >> >entire driver again... Not to mention how will I be able to easily
> >> >> >verify that my comments were addressed properly (btw, I also wrote=
 it
> >> >> >here https://lore.kernel.org/intel-xe/CAFCwf124UMR3VQ=3DTr6mT_eTRQ=
i9ssqZqEH4jys1bGggHJjboLw@mail.gmail.com/).
> >> >>
> >> >> Let me use a few examples:
> >> >>
> >> >>         22ad50d184c0 ("fixup! drm/xe: Introduce a new DRM driver fo=
r Intel GPUs")
> >> >>
> >> >> Do we want to leave the commit "drm/xe: Introduce a new DRM driver =
for
> >> >> Intel GPUs" as part of the original and then have a Fix commit leav=
ing a
> >> >> few hundreds of broken commits?  On other "first driver submissions=
"
> >> >> I've seen that would be frowned upon and it would be expected that =
this
> >> >> is fixed inplace instead of leaving broken commits behind.
> >> >>
> >> >>         a00a92181ab1 ("fixup! drm/xe: Introduce a new DRM driver fo=
r Intel GPUs")
> >> >>
> >> >> Same thing: a nasty memory corruption lurking there. Do we leave it
> >> >> broken?  With the previous (current(?)) process we were actually ad=
ding
> >> >> these fixups that are later moved back in the git history so things=
 like
> >> >> this are never part of the upstream code. Looking at xe-rev2 branch
> >> >> being pushed without any code review, why is 83ac6e02bf5e ("drm/xe:
> >> >> Remove unused define") more important that deserves being brought b=
ack
> >> >> to the original submission?
> >> >I'm sure there are multiple additional bugs/broken code paths that we
> >> >don't know about right now, will be part of the original submission
> >> >and will be fixed only in a couple of months or further than that.
> >> >Therefore, I don't think this is a critical issue.
> >> >But in any case, no one said we need to have the original submission
> >> >sent upstream, without additional patches after it in the same merge
> >> >cycle.
> >> >
> >> >What is critical imo, is to have confidence that this driver is not
> >> >doing something horrendously wrong, like abstracting entire kernel
> >> >layers, or putting up a broken uapi, or incorrectly using kernel API,
> >> >or whatever.
> >> >
> >> >>
> >> >> Another one that comes to mind: the engine vs context name that you
> >> >> raised on the other review and I pointed out to the history: would =
it be
> >> >> something to be changed on xe-rev branch and invalidate the other t=
hings
> >> >> on top?  Or would we better change this in drm-xe-next?
> >> >
> >> >I agree the changes between rev1 and rev2 are often quite significant=
.
> >> >And with all your other input, I think we can consider the following:
> >> >1. Halting the review for now.
> >> >2. You will prepare a rev2 branch with all the changes we agreed upon
> >> >+ updated code to make it more aligned with drm-xe-next.
> >> >3. I'll restart the review on rev2, while we agree to keep the
> >> >drm-xe-next mostly aligned with the review branch until the review is
> >> >over.
> >>
> >> mostly agree, but need some clarifications below.
> >>
> >> >
> >> >>
> >> >>  From what I talked with Rodrigo before, we'd actually discuss and =
agree
> >> >> about things that needed to be changed/fixed, particularly on the d=
esign
> >> >> and interface of the driver (with drm subsystem and with userspace)=
.
> >> >> Line by line review with non-critical things would then become gitl=
ab
> >> >> issues, like when Matt Roper went through a similar line by line
> >> >> review and Rodrigo created a bunch of gitlab issues that are being
> >> >> solved in drm-xe-next.
> >> >>
> >> >> >Therefore, I think we need to agree on some method that won't burn=
 me
> >> >> >out and cause me to tell Dave & Daniel I'm giving up on what they
> >> >> >asked me to do. One way is to follow the rule above, but if you st=
ill
> >> >> >disagree with this, I'm open to hearing other suggestions on how t=
o
> >> >> >enable a proper review in a timely manner that won't cause me to p=
ull
> >> >> >my hair out.
> >> >> >
> >> >> >In that context, I feel your "Ignore the not moving target goal"
> >> >> >statement to Francois was inappropriate. We need to have an agreem=
ent,
> >> >> >you can't decide that on your own.
> >> >>
> >> >> What am I deciding on my own and why was that inappropriate?  I wen=
t
> >> >> back to read again what I wrote to check if it was badly phrased, b=
ut I
> >> >> don't see it that way. He asked my opinion on a different method, w=
hich
> >> >> you are also asking when you say "I'm open to hearing other suggest=
ions
> >> >> on how to enable a proper review in a timely manner that won't caus=
e me
> >> >> to pull my hair out". If you hear and disagree, I'm totally fine wi=
th
> >> >> it, but asking for it and then saying it's inappropriate to disagre=
e
> >> >> with the premise seems odd.
> >> >I read it as something else but if you meant it only as a suggestion,
> >> >then I take my words back.
> >> >>
> >> >> I went on and explained *why*, saying that the moving base is alrea=
dy
> >> >> there and IMO a better method would be to accept the moving base, w=
ith a
> >> >> different review method. And if you look at the proposal below, I'm
> >> >> actually removing the "moving base" factor between what's being rev=
iewed
> >> >> and where the rest of development is happening, CI is running, othe=
r
> >> >> review comments are being handled, etc.
> >> >>
> >> >> What I'm currently seeing and I don't agree with:
> >> >>
> >> >> - Commits are being pushed to a xe-revN branch bypassing code revie=
w
> >> >Correct, this should not happen. That's why Francois sent them to the
> >> >ml and I thought it was sufficient.
> >> >>
> >> >> - Since CI is running on drm-xe-next, it's also bypassing CI. I was
> >> >>    part of enough upstream submissions to know our ability to break
> >> >>    things when handling code review comments, which is only noticed=
 later
> >> >>    when the rest is rebased on top and CI is running again
> >> >I agree, but unless you can trigger CI on specific branch, I think
> >> >your only option is to run CI on drm-xe-next after it is rebased over
> >> >the final xe-rev branch (after the review is over).
> >> >>
> >> >> - drm-xe-next and xe-revN are not on the same baseline. If they wer=
e,
> >> >>    then comparing both would be trivial and we'd probably not have
> >> >>    this discussion. Question here on your process: currently xe-rev
> >> >>    is on top of drm-next-2023-04-27, which is on top of v6.3-rc4.
> >> >>    Is your intention that fixes (to only your review commens) are
> >> >>    accumulated  on xe-rev* and then propose this to be merged to dr=
m-next
> >> >>    when that is finished, without any rebase?
> >> >I thought you would rebase drm-next-xe over the final xe-rev branch.
> >> >Then just make sure all those commits on top are passing CI after the=
 rebase.
> >> >>
> >> >> - changes to "the original submission" that from my pov some are go=
od,
> >> >>    some would better be discussed and some that are not critical
> >> >>    taking precedence over others that should really be there. And t=
hat
> >> >>    is happening because there is this disconnect between drm-xe-nex=
t and
> >> >>    xe-rev as per above.
> >> >That's why I don't mind if for xe-rev2, we make it aligned with a
> >> >newer baseline that matches drm-xe-next.
> >> >I'll continue the review on that branch when it's done.
> >> >Then, after the review is over, rebase drm-xe-next over xe-revLast,
> >> >which shouldn't be too hard hopefully.
> >> >
> >> >wdyt ?
> >>
> >> Let me first start saying that when I saw your 1/6 in your second batc=
h
> >> I thought it was 1 out of 6 and you would send each of them on
> >> Thursdays, leading to 6 weeks from a state that is already 250 behind
> >> drm-xe-next. I was pointed out today that that was actually the date.
> >> My bad.
> >>
> >> To move forward I think we need to clarify and agree on a few things:
> >>
> >> 1. How are you splitting the code review? I know you are reviewing "th=
e
> >> final state" rather than patch by patch. But what I'm looking for is t=
o
> >> know if you split the driver in 2, 3, 10 parts/files and we should
> >> expect 2, 3, 10 batches of reviews or what? Depending on if we are
> >> looking at 2 weeks, 2 month or a year, we may need to adapt the workfl=
ow
> >> differently. If it's 1 week we could simply halt any change at all.
> >> If it's 2 months, then we may have some problems to figure out the
> >> workflow
> >I think we can finish this in 3-4 weeks (3-4 sets of additional comments=
).
> >>
> >> 2. I will quote what you said:
> >>
> >> >What is critical imo, is to have confidence that this driver is not
> >> >doing something horrendously wrong, like abstracting entire kernel
> >> >layers, or putting up a broken uapi, or incorrectly using kernel API,
> >> >or whatever.
> >>
> >> I completely agree with that. Isn't this the original ask from drm
> >> maintainers? However reading the review comments, the critical ones
> >> related to the above paragraph seem to be swamped with other
> >> cleanup-related. Some of those cleanups already happened or we moved i=
n
> >> another direction  with drm-xe-next.
> >Yes, but I thought that if I'm already passing over the code, why
> >ignore these issues...
> >I was already documenting errors so I preferred to mention everything.
> >>
> >> Considering that as the critical part, what about the changes that com=
e
> >> due to others' feedback that also fall into that category?  Examples:
> >> the uapi break we needed to do so we are not completely imcompatible
> >> with 32b applications?  Or for example other patches changing jiffies
> >> to nsec in the uapi. Wouldn't it be sensible to include those in the
> >> next xe-revN?
> >Yes, but again, I'm pretty sure you will continue to figure out stuff
> >as we go along, and we don't want to re-start the review each time.
> >Let's set a new baseline, do a concentrated 3-4 weeks review on it. We
> >will fix all the issues in that review and that will be good enough.
> >Then, any patches above it will go through the regular upstream flow.
> >>
> >> With that in mind, what about this?
> >>
> >> 1. Halting the review for now.
> >>
> >> 2. I will tag the current drm-xe-next, just before the point
> >>     in which we add display. This would give the same baseline between
> >>     drm-xe-next and xe-rev2 tag.
> >>
> >> 3. We don't modify anymore the code below that point. If there are som=
e
> >>     critical changes that we'd rather have squashed below that point,
> >>     then we just accumulate on top of that tag. So from your point of
> >>     view, the next xe-rev3 tag won't have those changes together with
> >>     others
> >>
> >> 4. No patch is merged/pushed directly to a xe-revX branch - xe-revX
> >>     would be actually tags. Instead, the patch is based on drm-xe-next
> >>     to get CI passing and having a solution that is agreed upon.
> >>     When you're done with xe-rev2 and we send a xe-rev3, those patches=
 can
> >>     be moved so you actually get those changes first/only. Again, depe=
nding
> >>     on the timeline we are talking about, it may be simply done by
> >>     halting any other change. If it's a long time, then we may need to
> >>     rebase and move commits around before giving you a xe-rev3 tag.
> >>
> >Sounds like a good plan.
> >
> >> 5. For the questions you made in the review comments, do you want devs
> >>     to answer inline like I've been doing? Or to create gitlab issues =
like
> >>     Rodrigo suggested when this process started?
> >I think inline is fine. I think we should open gitlab issues for
> >points raising from this review only for extreme cases where they
> >can't be fixed now for some reason.
> >>
> >> 6. (only if we are talking a long timeline, to be agreed on a case by
> >>     case basis):  for intrusive changes that don't fall into the
> >>     critical classification you gave above, may we agree on handling
> >>     those on top of drm-xe-next, without moving them before other
> >>     things?
> >I think 3-4 weeks is not a long time, so I hope this point can be
> >disregarded right now.
>
> Ok, let's do that then. A new tag is pushed which should contain
> everything we have until now except display. Please take a look at
> https://gitlab.freedesktop.org/drm/xe/kernel.git xe-rev2
>
> thanks
> Lucas De Marchi
Thanks,
Will look into that.
Oded
