Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAAF1CA1002
	for <intel-xe@archiver.kernel.org>; Thu,  4 Sep 2025 16:21:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F31610E263;
	Thu,  4 Sep 2025 16:21:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ExlgEBXk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5285A10EA91
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Sep 2025 16:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757002872; x=1788538872;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=ozgiL4qXynERFxlQ2bXi+UBbq1snm5YrI7VUUNxnPHs=;
 b=ExlgEBXkbGk3kXbY/9Q/gIyKk5Cv2qmqkA3KH3nVGynTwUKJvAS6YDvz
 AGdhg5OiawK1U60DzS5K36bQeVbZOkOBLMMGlVOvuvLVeaotuGns2vK6s
 Uxn/Ywqt+viLYFOp7YYaJbVqX4PVEvQNEvF4yAhzPHmyzBe8eYrd38asS
 muOcPy9RyKSQThDKOpapjP2asTX+FYEmSbvDOG+StuNhIbhJOlUOvzDVG
 3HvjY4HUTsQPiGNm1phv45L7g3GsOcy4la62zKRR5Wtew6t3puQTg+IvF
 qyMEWTH+LhnZx2jeiycxPRii85qCgQTxjkqQfZi2Uu1xlqG81WNVXw718 Q==;
X-CSE-ConnectionGUID: BglIY8cTRWWAYobj4oATUg==
X-CSE-MsgGUID: 5EqNi9OMQE+ys2xvFijYPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11543"; a="63173492"
X-IronPort-AV: E=Sophos;i="6.18,238,1751266800"; d="scan'208";a="63173492"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2025 09:21:11 -0700
X-CSE-ConnectionGUID: 9XiyMAW6Q9CRPuTX8WxRiA==
X-CSE-MsgGUID: 1UUDSAwIQpKmipRoBdvH3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,238,1751266800"; d="scan'208";a="171878875"
Received: from abityuts-desk.ger.corp.intel.com (HELO [10.245.244.98])
 ([10.245.244.98])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2025 09:21:10 -0700
Message-ID: <a987dced05d29398c774b0e93b3318c340f2fb30.camel@linux.intel.com>
Subject: Re: [PATCH v4 3/3] drm/xe: Block exec and rebind worker while
 evicting for suspend / hibernate
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>, Rodrigo vivi	
 <rodrigo.vivi@intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>
Date: Thu, 04 Sep 2025 18:21:04 +0200
In-Reply-To: <0fe6e8c7-f45f-43d2-982e-41ef003cfcc5@intel.com>
References: <20250904160715.2613-1-thomas.hellstrom@linux.intel.com>
 <20250904160715.2613-4-thomas.hellstrom@linux.intel.com>
 <0fe6e8c7-f45f-43d2-982e-41ef003cfcc5@intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
MIME-Version: 1.0
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

On Thu, 2025-09-04 at 17:20 +0100, Matthew Auld wrote:
> On 04/09/2025 17:07, Thomas Hellstr=C3=B6m wrote:
> > When the xe pm_notifier evicts for suspend / hibernate, there might
> > be
> > racing tasks trying to re-validate again. This can lead to suspend
> > taking
> > excessive time or get stuck in a live-lock. This behaviour becomes
> > much worse with the fix that actually makes re-validation bring
> > back
> > bos to VRAM rather than letting them remain in TT.
> >=20
> > Prevent that by having exec and the rebind worker waiting for a
> > completion
> > that is set to block by the pm_notifier before suspend and is
> > signaled
> > by the pm_notifier after resume / wakeup.
> >=20
> > It's probably still possible to craft malicious applications that
> > block
> > suspending. More work is pending to fix that.
> >=20
> > v3:
> > - Avoid wait_for_completion() in the kernel worker since it could
> > =C2=A0=C2=A0 potentially cause work item flushes from freezable process=
es to
> > =C2=A0=C2=A0 wait forever. Instead terminate the rebind workers if need=
ed and
> > =C2=A0=C2=A0 re-launch at resume. (Matt Auld)
> > v4:
> > - Fix some bad naming and leftover debug printouts.
> > - Fix kerneldoc.
> > - Use drmm_mutex_init() for the xe->rebind_resume_lock (Matt Auld).
> > - Rework the interface of xe_vm_rebind_resume_worker (Matt Auld).
> >=20
> > Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/4288
> > Fixes: c6a4d46ec1d7 ("drm/xe: evict user memory in PM notifier")
> > Cc: Matthew Auld <matthew.auld@intel.com>
> > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Cc: <stable@vger.kernel.org> # v6.16+
> > Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
>=20
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
>=20
Thanks a lot Matthew!

/Thomas

