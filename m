Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3A27CCA470
	for <intel-xe@archiver.kernel.org>; Tue,  7 Oct 2025 09:51:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46F0010E5BF;
	Tue,  7 Oct 2025 09:51:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="BZWLmcJF";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 266D610E5BF;
 Tue,  7 Oct 2025 09:51:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id B048E43CA4;
 Tue,  7 Oct 2025 09:51:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24EC3C4CEF1;
 Tue,  7 Oct 2025 09:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759830710;
 bh=+F+WB7SfIjeyyoWM7d4P0rGj/MP4s8/FSBTcJ/LmQFM=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=BZWLmcJFlRgLT8EklsUDGJeK9cg1sUOOkLgtg06SCcs6Cx6Xpo657P1rrw5sYALsn
 eaWRuI/+3t0qpCgr5+g/WzaD2ShUF7xvbFG0OIweeIhSP9cAIcdwehynIUNws1NFBA
 rr8FlJnjW2uhCN50VrUDtyZE+UvurFFE+yCCzFByygKakfUpewYcfMlr2UXSl0IX7l
 iZXHwWLbog05lDwsmObNR0z66px1DcC5tHVxPtpHvze0GZyqd4S7LLql+pyRjmfYfH
 33Ry58NEsfuGMG5nEBukEfOB454PvufwjLQvSevwfK5pXesi4iIKgg5MJaBmqQ5MtD
 oPQiqluUjsl6w==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 07 Oct 2025 11:51:47 +0200
Message-Id: <DDBZX652KAXI.22E6JCVD9FZ1F@kernel.org>
Subject: Re: [RFC PATCH 1/4] drm/sched: Add pending job list iterator
Cc: =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 <dri-devel@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <alexdeucher@gmail.com>, <pstanner@redhat.com>, "Philipp Stanner"
 <phasta@kernel.org>
To: "Matthew Brost" <matthew.brost@intel.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20251002051604.1865322-1-matthew.brost@intel.com>
 <20251002051604.1865322-2-matthew.brost@intel.com>
 <be806a5e-75c9-45da-962f-2c1db75b4a07@amd.com>
 <aOTKvgqYFk8kw6Tm@lstrano-desk.jf.intel.com>
 <aOTPMlBMHK/c5KBh@lstrano-desk.jf.intel.com>
 <43628878-d414-459c-acad-fe7bf1afa332@amd.com>
 <aOTg47xjxt6cFnIF@lstrano-desk.jf.intel.com>
In-Reply-To: <aOTg47xjxt6cFnIF@lstrano-desk.jf.intel.com>
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

On Tue Oct 7, 2025 at 11:44 AM CEST, Matthew Brost wrote:
> Honestly I'd just lean towards dropping the debug version then. It is
> basically useless information in Xe as the number of pending jobs can
> dervived from the ring's seqnos which is also printed.

Yes, either do that or provide a dedicated debugfs layer in the scheduler
itself.

For printing driver specific job information we can easily add a callback.
