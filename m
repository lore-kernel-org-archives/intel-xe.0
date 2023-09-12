Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26511CA0EC3
	for <intel-xe@archiver.kernel.org>; Tue, 12 Sep 2023 08:45:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4BAF10E3C2;
	Tue, 12 Sep 2023 08:45:06 +0000 (UTC)
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5887810E3C1;
 Tue, 12 Sep 2023 08:45:04 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 640E56607313;
 Tue, 12 Sep 2023 09:45:02 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1694508302;
 bh=lErICr+q3ZQmh/6qxgn+s5S3emeQX9FvqkNGfIW8eIE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=IA9dmnnsAKGyEKJgDTJAEm90F4WWeELJltzbdWRhfyB/aV5Z7MpB4L1t+/P54ISDR
 IUGdLnMZJT1BMRWad96UWLwcMSIALIPMJ4Bah/BjzrjWGdYVixEkeQZSZAGDD2AnLL
 PXJOTMzCtpDXLOwkQJkWUpFw5pRj0ypF7+Yta9uOW5rSh+lxI0qVKGffh1Fp8BUeUD
 +/LA9YHz6p+55kg8v9NbCDflvRvQkk18DEWrDoWoOXKq3BdK+Ztcw/7TvELMycc1NS
 LF6vR8Pnup2raaz642AGR0qPZbrq1qpDg1MwXQskkcudHejBfT/gHA8rBDBUx0QwCL
 7NQogmlhGgYDQ==
Date: Tue, 12 Sep 2023 10:44:59 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Matthew Brost <matthew.brost@intel.com>
Message-ID: <20230912104459.746f2f29@collabora.com>
In-Reply-To: <20230912021615.2086698-12-matthew.brost@intel.com>
References: <20230912021615.2086698-1-matthew.brost@intel.com>
 <20230912021615.2086698-12-matthew.brost@intel.com>
Organization: Collabora
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH v3 11/13] drm/sched: Waiting for pending jobs
 to complete in scheduler kill
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
Cc: robdclark@chromium.org, sarah.walker@imgtec.com, ketil.johnsen@arm.com,
 Liviu.Dudau@arm.com, mcanal@igalia.com, frank.binns@imgtec.com,
 dri-devel@lists.freedesktop.org, christian.koenig@amd.com,
 luben.tuikov@amd.com, donald.robson@imgtec.com, daniel@ffwll.ch,
 lina@asahilina.net, airlied@gmail.com, intel-xe@lists.freedesktop.org,
 faith.ekstrand@collabora.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, 11 Sep 2023 19:16:13 -0700
Matthew Brost <matthew.brost@intel.com> wrote:

> Wait for pending jobs to be complete before signaling queued jobs.

You probably want to add 'in drm_sched_entity_kill()', even if it's
already specified in the subject, because I was trying to understand
why we'd want to do that in the normal path.

> This
> ensures dma-fence signaling order correct and also ensures the entity is
> not running on the hardware after drm_sched_entity_flush or
> drm_sched_entity_fini returns.
