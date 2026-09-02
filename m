Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54C53C624D0
	for <intel-xe@archiver.kernel.org>; Wed,  2 Sep 2026 08:55:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0665C10F0BE;
	Wed,  2 Sep 2026 08:55:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HtDsYVq/";
	dkim-atps=neutral
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com
 [209.85.160.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7F8110F0BE
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Sep 2026 08:55:09 +0000 (UTC)
Received: by mail-qt1-f171.google.com with SMTP id
 d75a77b69052e-52cd38ddcdfso7216021cf.3
 for <intel-xe@lists.freedesktop.org>; Wed, 02 Sep 2026 01:55:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788339308; cv=none;
 d=google.com; s=arc-20260327;
 b=pyD+iJImnth6ruaHHBDdolt7y2XGwYbfYHq5vzrII1pl+q9VHzfvmGa4j/bLcSKkQr
 tB1PEIxWdpd6AT/sHWMaj5/QhAuLK4XltsHgFxrpYWj6wM3ABOaqm30iy/JHW9rSsm1F
 F4zzezb26qh3j7cuf713Ln+tmurboZs+q+cV5wo51pCL02TZfmDzAT1W9+aQ/EYd8r5d
 y4sRn1mfObUPu9WcZIL4yKGXB+MSs2pWO+/kheh05UXsY9cyrJiLAq33GW4dwqUXWZZC
 Cx8UE+spKceWHd3wPC69TpItI+TFza1YpBwKl72A9m6Hzzjxs1bpz+usjmfdp9Tm2X8M
 gWNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=A6NfQsMe4AWk/u2vAtduAV/QnsJCjKyJO6vpib7gRdc=;
 fh=TRtjaAqd3JprL2cclh9oz4UHTaydEOaqirWDIgpSmic=;
 b=fECwntXgcCv2Si8wqyKuuUA71vpJq53NugmZSXsMg0Ly/W86b2O/m18K/1Ku9bO6Tp
 LR6kDS2aqD8HlAoqJ/Ei/ufb68f6VQCAl02LyJtJ1leYWtBkvesZtIOL0NVzg8Z7gsIE
 hRA3pgu6G1E4KjDhI3daw6gC70ksrg7xReoGOIPZ9lpJvhYBG99wAJH9N88W5DgcizIL
 wf/EDJeuXQOk0bmCCZqDslhOA6dbkgWOPcSIT6XRLoFJHfBK5ajiL9ojIxCk1vcKh2Gz
 zTiv3tz4t7f3Mwz0L0djA++jC4L473f2DuUN1iTwm25RO8sUt4K55kJ7aennFk76NvwS
 ueJg==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1788339308; x=1788944108; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=A6NfQsMe4AWk/u2vAtduAV/QnsJCjKyJO6vpib7gRdc=;
 b=HtDsYVq/g0O9kjD4fQmICyfOxrZunc7kOGm+D+k4SeTt3EcqJlzLOHqV1hypUjwSOz
 0RE7RA2r/gPFEWkIAZVam3hAhBxnL9XV/bTWeUDvh/RXtLE0dFuLH4M6wICVMwYdF2aF
 CR9ZK8OjbSKKVTZScublUudTYSB+JBJgSQAAxrCAK2vDofMyZCe4UPDERI8uMG8JoRhx
 vaABoShvix+QWmJn6/OQHL3Ll3VY+idGwEbktMGOj7G3ANJVcUZRa0LZAxoqaCCbGD+C
 8R9+GM1+F4Tbe3Gl3hJYrXTuY5OkC8d5Uiyb1nr9aULrKzLUxMKM9PqjqDCYo5/o7zGT
 B73A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788339308; x=1788944108;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=A6NfQsMe4AWk/u2vAtduAV/QnsJCjKyJO6vpib7gRdc=;
 b=neXObKhr1lPv11ONY2jg9MqvjuZdK2rt/OmNf836E8jgOlp9MxDDe0QMXdjUR06XSt
 ObaDrkSkSVpdBE0CxrmTBWo8tjsmCZZvR4R5CPwJx2Xeb/V4mX+65xozfxI1oQ319M2s
 eD27WeyMlqjQvtMyeRDhNbHS0gYQGwBa4hnXhFLVskNom7LBKO69DrwgYRlizLzONHcn
 0Tkx1Qxy9NxrB87NeodCQj9Xm7yqXEzptx188DaOn7cagQ29oK9odRwqJ2KFbD0Kli/v
 92LbxaD6Ao3qNMd/ESXlqwYkI2lRqkdAS0bh5F48GbD8TuIkq0GnTAcDQxAdz2yhp5FI
 Pumg==
X-Forwarded-Encrypted: i=1;
 AHgh+Rp0w8tJiZ+kqrd16+KH8ASmVocuPLH3/X+rVyTOepsO+yEZ5hTtkYQL5hgnNG8eAztAVStzQdcYMg==@lists.freedesktop.org
X-Gm-Message-State: AFuF++m0VNFPmjF4hpEpio/6443WhfA6cAljTayGfNedee69qt9+NcoM
 prY3rZWNcFvk93ubuuDG2re5dLquV1v43ogcyBZ2hf/tv4WgVH/pzBwmIXq3dqdpn1OMLb1uF1p
 FI1r1tG/RdCc5mBt7rxqEbezjTHd7Y90As++8
X-Gm-Gg: AR+sD124ST4T3w8sfEFL5az7KvAr59UlXDJtCxB/UmAKZHMBUA86Y2DCuHdd6GCB/O3
 jiZvgagnt1ENzrSFAsH4MW10T1UMjnmlcvkGicOx3IqAYWNQrjwwTdOdmwI7Au1cnDKDYLmCqAu
 D+IysvmHXSQwnqXyZXT2J5zVJOYM76FbYzvRaxfHdxMRCnZJzqMf2bLkmNX9q7RVU0nO3FwI0un
 uwEJGW93kc7Sg6s7isnC9zl5jLI1plRpfsnrTK69W299pCt2raKT4fIIZLgetpUVjYzcUS9JQRu
 i6V2usvSgTIINQsC+ykvTwkZaL29OJfdzytZkzUUfiDAe0dGa45qWAKirfJJyc03p5yVNHydwg1
 V3pksitnQs1VsNa9+S5FcaaiOp/7CQ1h4WkZTEwSw
X-Received: by 2002:a05:622a:4185:b0:52e:a11:571e with SMTP id
 d75a77b69052e-53036bb6af6mr33554901cf.11.1788339308272; Wed, 02 Sep 2026
 01:55:08 -0700 (PDT)
MIME-Version: 1.0
References: <20260820031901.1018324-1-iridescentrosesfall@gmail.com>
 <aoczaCuoaZfUkfm5@gsse-cloud1.jf.intel.com>
 <CAMpTW2cxRrG4oJ0HrRoKhHrVHxWO01-L+QDoWMLCAUaSfw75sA@mail.gmail.com>
 <CAMpTW2fxFRrpn1b5WGYBrtLLMfUo_fmx9s2D0b552GJp-sF5qg@mail.gmail.com>
 <8b7001c68c94491095f41d2a3dff45090c0a95cf.camel@linux.intel.com>
 <aoeUdfrPX+0ZnZMr@gsse-cloud1.jf.intel.com>
 <CAPM=9twBded3B553KYzwDtVd0NbhbAwbiVDGw_bdrmBnOKgtKA@mail.gmail.com>
 <CAMpTW2eXS9tBzppJvvfZ-FiwoJ5MKOAdB9sqYgCDPVQ_+___ZA@mail.gmail.com>
 <ao+acQG/wyZYNYfW@gsse-cloud1.jf.intel.com>
 <apfZcEF8IlDak/As@gsse-cloud1.jf.intel.com>
In-Reply-To: <apfZcEF8IlDak/As@gsse-cloud1.jf.intel.com>
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 2 Sep 2026 18:54:55 +1000
X-Gm-Features: AcwNN1WILUlKuU0Lq9lIUugwcS75tHY73FPdHaQF0ZD-dcIRr3i6vZZ9zmPYrQw
Message-ID: <CAPM=9tw9dtxN+tZLrb4fvPGndUT+He7Y=o39ByMEva8wWyq56g@mail.gmail.com>
Subject: Re: [PATCH] drm/xe: Fix unnecessary host-side population of ttm_tt on
 non-TT resources
To: Matthew Brost <matthew.brost@intel.com>
Cc: Nathan Bourgeois <iridescentrosesfall@gmail.com>, 
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Matthew Auld <matthew.auld@intel.com>, Simona Vetter <simona@ffwll.ch>
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

On Wed, 2 Sept 2026 at 18:08, Matthew Brost <matthew.brost@intel.com> wrote=
:
>
> On Wed, Aug 26, 2026 at 07:01:21PM -0700, Matthew Brost wrote:
>
> Dave ping. Question below.
>
> > On Thu, Aug 20, 2026 at 10:34:49PM -0400, Nathan Bourgeois wrote:
> > > > Shouldn't we just be calling xe_bo_validate() here instead of
> > > > ttm_tt_populate? (With the correct xe_validation_guard() wrapping).
> > >
> > > > Yes, this might be a better solution, making ttm_bo_setup_export()
> > > > completely unnecessary.
> > >
> > > If ttm_bo_setup_export() is unnecessary, I'm happy to change the patc=
h
> > > or make a new patch. I will attempt to implement and test this locall=
y.
> > >
> > > > This part looks good as different patch from what I'm assuming will=
 be a
> > > > TTM fix.
> > >
> > > Regarding this, what do you recommend I do, assuming the patch
> > > remains local to drm/xe? I'm still learning the ropes of contributing=
.
> > >
> >
> >
> > For Xe I believe Thomas and I aligned a xe_bo_validate with a correct
> > xe_validation_guard is the Xe preferred solution in the existing
> > design... But a question to Dave below before I commit to anything.
> >
> > > Nathan
> > >
> > > On Thu, Aug 20, 2026 at 9:08=E2=80=AFPM Dave Airlie <airlied@gmail.co=
m> wrote:
> > > >
> > > > > Yes, this might be a better solution, making ttm_bo_setup_export(=
)
> > > > > completely unnecessary.
> > > > >
> > > > > It's also a bit odd that, in flows where we don't have backing st=
orage
> > > > > on export, we populate with pages and charge the system memory cg=
roup,
> > > > > only to move the data to VRAM when the import attach is triggered=
,
> > > > > resulting in a copy and a change in cgroup charging.
> > > > >
> > > > > I guess the question is why was ttm_bo_setup_export() introduced =
over
> > > > > just a validation at export?
> > > > >
> > > >
> > > > I'd like to think I had an answer for that, but I don't. Likely
> > > > because I wasn't thinking about VRAM charging at all, and just
> > > > worrying about making sure we had populated some pages for system
> > > > memory ones, so the other side couldn't DoS us.
> > > >
> >
> > Dave:
> >
> > We don't charge any cgroups yet, right? This would only come into play
> > once a version of [1] merges, correct?
> >
> > What would prevent the pages populated for a TTM BO from being
> > immediately reclaimed and discarded? I'm fairly certain Xe's shrinker
> > could do exactly that, since we don't pin those pages. This seems to
> > imply that we'd need to store the cgroup associated with the TTM BO at
> > creation time and charge allocations to that cgroup, regardless of whic=
h
> > task ultimately triggers the page allocation.

This was actually to fix a non-cgroup bug with a possible priority
inversion problems.

i.e. a client could allocate a BO export it to a compositor, and then
the compositor would populate it for the first time and get ENOMEM.

This was to avoid that case by making sure a client had tried to
allocate all the pages for the BO before exporting it, so it would get
the failure at that time.

I don't believe xe should just be reclaiming and discarding these
pages without swapping them to shmem first?

Validating is probably fine as well.

Dave.
