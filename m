Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1585BF3092C
	for <intel-xe@archiver.kernel.org>; Thu,  5 Mar 2026 12:27:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFA5710E285;
	Thu,  5 Mar 2026 12:27:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="biNLFNkj";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 398F710E24E;
 Thu,  5 Mar 2026 12:27:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id BB6EC4349E;
 Thu,  5 Mar 2026 12:27:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CB1AC116C6;
 Thu,  5 Mar 2026 12:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772713637;
 bh=L3n7iFHFY8oLp/GK7m5k6TlWEUrm9ZXNmYfsDUK0Xb4=;
 h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
 b=biNLFNkjCxen5EPhP8NEiGrfwvJEhL2ub4HOBo6/GdolykJz0c8Ju74GUouQ/1IKD
 mNKDgttN1RRPt0cIaJdx+FNh6ROFfEg9OxTxRNcwfKdVKtgUDIHguXdIsPBucimsge
 kYPZQjTCL5G3+2IU1KNSCah8ZMjt/kdLgqPXSMVVkx2i2Ej8l90b2cW9gnejM1a8jp
 vwB2kIt23yggOuxhwnWCVf+koKylZVTSgf+ifrEFVKq9OyDp0Xcckdtl8uJkpcIZJj
 /k9wt68yXzNggWi7WsLIIPMm2dZbFFGamKM6AbDRjuZY7mExFtrQVQ4/fyoFD+5kfl
 6jPa9hPlL4IoA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 05 Mar 2026 13:27:12 +0100
Message-Id: <DGUUJC379UF0.2MZSISKQIUU22@kernel.org>
To: "Matthew Brost" <matthew.brost@intel.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: drm_sched run_job and scheduling latency
Cc: <phasta@kernel.org>, "Boris Brezillon" <boris.brezillon@collabora.com>,
 "Chia-I Wu" <olvaffe@gmail.com>, "ML dri-devel"
 <dri-devel@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 "Steven Price" <steven.price@arm.com>, "Liviu Dudau" <liviu.dudau@arm.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 =?utf-8?q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 "Rodrigo Vivi" <rodrigo.vivi@intel.com>, "open list"
 <linux-kernel@vger.kernel.org>, <tj@kernel.org>
References: <CAPaKu7RbCtkz1BbX57+CebB2uepyCAi-3QzBy8BDGngCJ-Du0w@mail.gmail.com>
 <aajkqXZDGUFPlq1o@lstrano-desk.jf.intel.com> <20260305092711.20069ca1@fedora>
 <fa4a9c55792b0e79d94faa82085b693aa7feb989.camel@mailbox.org>
 <aalIbgi71svPQs3Z@lstrano-desk.jf.intel.com>
In-Reply-To: <aalIbgi71svPQs3Z@lstrano-desk.jf.intel.com>
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

On Thu Mar 5, 2026 at 10:10 AM CET, Matthew Brost wrote:
> On Thu, Mar 05, 2026 at 09:38:16AM +0100, Philipp Stanner wrote:
>> In the past discussions Danilo and I made it clear that more major
>> features in _new_ patch series aimed at getting merged into drm/sched
>> must be preceded by cleanup work to address some of the scheduler's
>> major problems.
>
> Ah, we've moved to dictatorship quickly. Noted.

While Philipp and me generally share concerns about the scheduler in genera=
l, I
prefer to speak for myself here, as my position is a bit more nuanced than =
that.

I shared my view on this in detail in [1], so I will keep it very brief her=
e.

From a maintainance perspective the concern is less about whether a particu=
lar
change is correct or small in isolation, but about whether it moves the ove=
rall
design in a direction that makes the existing issues harder to resolve
subsequently.

I.e. I think we should try to avoid accumulating new features or special pa=
ths
on top of known design issues.

(Please also note that those are general considerations; they are not meant=
 to
make any implications on this specific topic. Not least because I did not g=
et to
read through the whole thread yet.)

Thanks,
Danilo

[1] https://lore.kernel.org/all/DFPK5HIP7G9C.2LJ6AOH2UPLEO@kernel.org/
