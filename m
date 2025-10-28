Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C030CCD1BF
	for <intel-xe@archiver.kernel.org>; Tue, 28 Oct 2025 09:27:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 129B810E09B;
	Tue, 28 Oct 2025 09:27:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="CEdcStGx";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A99910E09B
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Oct 2025 09:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1761643630;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vMgKcmUijk5xAxok1rWDuN0GhFwUXgOZN19QAh1dZS4=;
 b=CEdcStGxI66s/8dix/isCvBYGEzTCWlXYs7svh8aHNigfGEiM6vSXAwI7bP22sOGGVBpVl
 u9vPzcaIOJ94EhIMsxwEr8UHQsacP3yOIKvTYiEoefuxZOkT1u4w1c3zXfo6BON46TWOU7
 UNDuerzXY0b1bMZe5YJKIuyA8cQ+Ehk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-694-aWp_wBgaPxGem87L3QRWLw-1; Tue, 28 Oct 2025 05:27:09 -0400
X-MC-Unique: aWp_wBgaPxGem87L3QRWLw-1
X-Mimecast-MFC-AGG-ID: aWp_wBgaPxGem87L3QRWLw_1761643628
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-475db4369b1so24604115e9.3
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Oct 2025 02:27:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761643628; x=1762248428;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vMgKcmUijk5xAxok1rWDuN0GhFwUXgOZN19QAh1dZS4=;
 b=sflGsE7Brhhnzkdx+xpts+9Cqiuk+ieiCTCxg6Ye/szpYQZ3LFoYAsXattmJBpa1xP
 ygd4tKLb1Uys39jJROS2CfrEOpeKgQV1luywbxCs+Pm3fI2ndj1oq1ucpxuW86EWgf4P
 9FcCUGtOscXoBJM/oP+ydx7E6PuER3yB+9BxjNQfb/HHuViRYEiv3tzUw5n519IgDS+G
 c3kqBfjGTM5kKMHN3O2KP3qOgNG8G55n+KTMXW7/pVOQdFqu2i+UgtAfDPf/6IfEK58J
 ElEKe4iUKkfs30tbG4pQdoiXsykpFKNLp4rC6E7NpqeshIGWH8xmrzU7hV+LSW/BlhwW
 jURA==
X-Gm-Message-State: AOJu0YypiCDvbuMgSXJPeAwnU/feui1zYrZqCT9C7Pt7npg6b9p0soaW
 vUR/O4u86X2FciYxR241I2VPkVXTyTvMmIK+6af1wC7qSwKKQiW7qvDml3rqSqRFf1dveH/M75d
 a3R6YdybV2U/zir+UYEo7YcNdErmPOonReBPcBWfNaBfDtqHRNVa352HBbTBb8t+mQ7aK
X-Gm-Gg: ASbGncvOIhiPnzNoTcmsLTlj31KS6XpWIUCZkhtcuEatXygxa5LW7j9Kt2A0UnH+xr4
 PLL1GBjHwBcJZ5T0wV+iKKw2x+Te3ZcQeb14oYwhTufBmCbRJ0YkokyrtxNGXnp1DIJ+H6F1nVi
 8y0Kh3xMiyCczO3ECLQ0KuKSHr5ATy46jQpCOY3Sup61idBTvBjQW6vZxBBx6LdHEQrcK7nNvCg
 Ahva/C/XT/SlhjtRT40y5TBpPU1usv5CcWIUDe6hzkS//rN9vdo/HNiNvFL4aR2aMx+KrhEb0ZM
 Dk7TXDtGzAEzX3eIWSHP7Abvkj/nlJ7rqBoq2+v84i90Ls0is3u7xMdkHJoWNvUE2JBuSAsh+eg
 3SLrU89CY8betpnINU4yfvC48xQ==
X-Received: by 2002:a05:600d:4382:b0:475:da13:257c with SMTP id
 5b1f17b1804b1-47718fc881dmr9599665e9.27.1761643627774; 
 Tue, 28 Oct 2025 02:27:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG9RzPzsWtqqUXoRcJrXn1UN+3rD5haW59x9hIYul5AJHvof/tfSMf4EIcxnGzRQ1Zzzg8sdw==
X-Received: by 2002:a05:600d:4382:b0:475:da13:257c with SMTP id
 5b1f17b1804b1-47718fc881dmr9599455e9.27.1761643627335; 
 Tue, 28 Oct 2025 02:27:07 -0700 (PDT)
Received: from [10.200.68.138] (nat-pool-muc-u.redhat.com. [149.14.88.27])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952b79absm19048542f8f.3.2025.10.28.02.27.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Oct 2025 02:27:06 -0700 (PDT)
Message-ID: <d4b7c1635aee89c49416e26ef482238f4ee1fafe.camel@redhat.com>
Subject: Re: [RFC PATCH 3/3] drm/sched: Prevent adding dependencies to an
 armed job
From: Philipp Stanner <pstanner@redhat.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, jiangshanlai@gmail.com, tj@kernel.org, 
 simona.vetter@ffwll.ch, christian.koenig@amd.com, dakr@kernel.org
Date: Tue, 28 Oct 2025 10:27:06 +0100
In-Reply-To: <aP+kJeOEghD+sEsg@lstrano-desk.jf.intel.com>
References: <20251021213952.746900-1-matthew.brost@intel.com>
 <20251021213952.746900-4-matthew.brost@intel.com>
 <537bdebf2112a080ae92526ecfa41d63668d90a3.camel@redhat.com>
 <aP+kJeOEghD+sEsg@lstrano-desk.jf.intel.com>
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 9AHyktYqgtz4sN-B9JpqEuVaM1ue7d9OjtfWZsH0FxU_1761643628
X-Mimecast-Originator: redhat.com
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

On Mon, 2025-10-27 at 09:56 -0700, Matthew Brost wrote:
> On Mon, Oct 27, 2025 at 12:13:58PM +0100, Philipp Stanner wrote:
> > I've got a kernel.org addr by now by the way
> >=20
> > On Tue, 2025-10-21 at 14:39 -0700, Matthew Brost wrote:
> > > According to the DMA scheduler documentation, once a job is armed, it
> > > must be pushed. Drivers should avoid calling the failing code path th=
at
> > > attempts to add dependencies after a job has been armed.
> > >=20
> >=20
> > Why is that a "failing code path"?
> >=20
>=20
> I noticed this after I sent - it should something like:
>=20
> 'avoid calling a possible failing code path, which allocates memory.'
>=20
> I can make this a bit more clear.
>=20
> > The issue with adding callbacks is that adding them to an already
> > signaled fence is a bad idea. I'm not sure if it's illegal, though.
> > dma_fence_add_cb() merely returns an error then, but the driver could
> > in priniciple then execute its cb code itself.
> >=20
> > And even if we agree that this is a hard rule that must be followed,
> > then drm_sched_job_arm() *might* not be the right place, because just
> > because a job is armed doesn't mean that its fence is about to get
> > signaled. drm_sched_entity_push_job() would be the critical place.
> >=20
>=20
> I think this break our rule once arm is called, push must be called as
> adding dependencies can possibly fail. This rule is called out in your
> documentation patch too. I've seen 2 driver posted in the past year add
> dependencies after arming, so I figured lets catch this misuse in the
> scheduler.

We can establish that as a rule, I'm OK with that.

P.

