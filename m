Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4858DC77B7E
	for <intel-xe@archiver.kernel.org>; Tue,  2 May 2023 12:44:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FCE610E1BD;
	Tue,  2 May 2023 12:44:04 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D845A10E1BD
 for <intel-xe@lists.freedesktop.org>; Tue,  2 May 2023 12:44:02 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0084061D12
 for <intel-xe@lists.freedesktop.org>; Tue,  2 May 2023 12:44:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68D27C4339E
 for <intel-xe@lists.freedesktop.org>; Tue,  2 May 2023 12:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1683031441;
 bh=HXwANSecxHkUSCtYZ6VpMk4VwjJUDD5lGKjUl4D8Aqs=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=XhI7P9Choo+lCNeGCt0vNXqTv2V2Cz0cIKEF89rw6A/sHx66dQbFwswE4vJZ0yWqG
 EBJ6esVO9iwtcOcTTnB37yuv+EJBBuJMD9d04RxDJHy8WXxs3WSr6rC7MrXd/ezCRn
 Ua0Lf29FeoUCzMzFBMdxNgDc4VSx8Y/CPyi26VuNFMdOR/OXlDUWw8LLpKRtbdGuRm
 c/4cKHbOVqHhb4iTM1CKq1uwLUEpvFzwjdnGuDGU90CcnQCJXdOeNmMXTqIiKLacgY
 8LLI1HHcDaDcT9CMIcWBJ+2oqsr64ZyWgzn84sZ7ULtn8rDPQ78IPK0KrBxBIRfJyi
 /T0avLMvpZbKg==
Received: by mail-yb1-f180.google.com with SMTP id
 3f1490d57ef6-b9a6eec8611so24653917276.0
 for <intel-xe@lists.freedesktop.org>; Tue, 02 May 2023 05:44:01 -0700 (PDT)
X-Gm-Message-State: AC+VfDzgZHABiiPGSd+9b0TJCDZW+xW7VWzb+G9dt4DYV2okh8nT80ZE
 ILbftJQFOEE1kYzSXf+5We5NUhP5lHkBOzlghRc=
X-Google-Smtp-Source: ACHHUZ7CafXXXrRmtbJBhDclZAT0Uoh7V172S27bYFVH10bmMd8jt361e+jkfhMI/cE6tQNezGxU/NuwkDlJIxD60Nk=
X-Received: by 2002:a0d:e811:0:b0:55a:7c7:a0bb with SMTP id
 r17-20020a0de811000000b0055a07c7a0bbmr9058156ywe.2.1683031440412; Tue, 02 May
 2023 05:44:00 -0700 (PDT)
MIME-Version: 1.0
References: <77046462e38d71c3d0d87ddf84d2c412d0cdf8d6.camel@intel.com>
 <20230502082438.GA3774192@kav-xto-001.ka.intel.com>
In-Reply-To: <20230502082438.GA3774192@kav-xto-001.ka.intel.com>
From: Oded Gabbay <ogabbay@kernel.org>
Date: Tue, 2 May 2023 15:43:34 +0300
X-Gmail-Original-Message-ID: <CAFCwf10s4S7FJpSKxb_WZBq-85-=VKBYM+HQgE9wgzJyJbu8AQ@mail.gmail.com>
Message-ID: <CAFCwf10s4S7FJpSKxb_WZBq-85-=VKBYM+HQgE9wgzJyJbu8AQ@mail.gmail.com>
To: Francois Dugast <francois.dugast@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Intel-xe] xe-rev1 Branch for ease the intial review / ack.
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
Cc: "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, May 2, 2023 at 11:24=E2=80=AFAM Francois Dugast
<francois.dugast@intel.com> wrote:
>
> On Mon, May 01, 2023 at 10:28:03PM +0000, Vivi, Rodrigo wrote:
> > Hi Oded,
> >
> > I have created a xe-rev1 branch in our gitlab [1]
> > to ease your review.
> >
> > The patches there are a subset of current drm-xe-next,
> > excluding any patch that is needed for display, but also
> > any other non-display patch that is on top of the display patches.
> >
> > Let's start with these for now, and iterate next.
> >
> > The only (big?!) risk for changes on this patch is related
> > to the drm/sched patches that we have underneath the initial
> > mega squash. Depending on the acceptance of the drm/sched changes
> > for the fw scheduling and the 1:1 relationship on the sched and entity.
> >
> > Other than that, these patches shouldn't change any longer. Unless
> > requested in any review in this round.
> >
> > Anyway, I truly hope that the review requests can end up in
> > gitlab/issues and addressed with follow-up patches on top.
> >
> > Thanks a lot for jumping in to help on this upstreaming acceptance.
> >
> > Cheers,
> > Rodrigo.
> >
> > [1] https://gitlab.freedesktop.org/drm/xe/kernel/-/tree/xe-rev1
>
> Adding Oded.
>
> Francois
- my Intel email
Thanks Rodrigo and Francois.
I'll start doing the review today/tomorrow.
I plan to write all the comments in a text file, as we don't have a
patch-set in emails.
I think it would be best if I'll just push that file into the review
branch itself, so we can track review comments vs. the code.
For discussions we can copy the relevant comment to a mail and start a
mail thread in this list.

btw, next week I'm on vacation so the review will be on hold during
that time, sorry.
Thanks,
Oded
