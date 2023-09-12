Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68F14CA0EC3
	for <intel-xe@archiver.kernel.org>; Tue, 12 Sep 2023 07:37:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3649E10E39C;
	Tue, 12 Sep 2023 07:37:12 +0000 (UTC)
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8794B10E39C;
 Tue, 12 Sep 2023 07:37:10 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 8C4BC6607318;
 Tue, 12 Sep 2023 08:37:08 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1694504229;
 bh=WxTh9Y0mrhqkDiw4zX/gU4Nyzj3bJHVnSTm4chUHTo8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=kn+9RL/4TK4L1oci79IUZqIOkXOa8Ni21MT3Yz4WWJNP6FUm/xxo1uU3HTlRNKNkI
 ZtSOAOspQvC0Zhz1ORyLagUPsqmwJvcmY783i4Xki7M+EHiC+WnJutjpbtAfAlqOed
 GH3d4PApA+6MwrY7Nbvq819RcezWACMS/+Eede3uZYr+FPygwzm4Icox/GwmFtpS5x
 2HjRdFhBUAqvle8tqD4Njt4lUgQ3CHr9JMTB9+VNRtxln9vFSRrL8BKVOYBUhF9TF+
 QKTeuuRhnPFnL0NxkcHE4CCUa+3hn2x7g5tB3zjnZx0MLHdW+DZwLbExDiUUAILfTB
 5v6E8836LTdtQ==
Date: Tue, 12 Sep 2023 09:37:06 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Matthew Brost <matthew.brost@intel.com>
Message-ID: <20230912093706.54d3af77@collabora.com>
In-Reply-To: <20230912021615.2086698-4-matthew.brost@intel.com>
References: <20230912021615.2086698-1-matthew.brost@intel.com>
 <20230912021615.2086698-4-matthew.brost@intel.com>
Organization: Collabora
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH v3 03/13] drm/sched: Move schedule policy to
 scheduler / entity
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

On Mon, 11 Sep 2023 19:16:05 -0700
Matthew Brost <matthew.brost@intel.com> wrote:

> Rather than a global modparam for scheduling policy, move the scheduling
> policy to scheduler / entity so user can control each scheduler / entity
> policy.

I'm a bit confused by the commit message (I think I'm okay with the
diff though). Sounds like entity is involved in the sched policy
choice, but AFAICT, it just has to live with the scheduler policy chosen
by the driver at init time. If my understanding is correct, I'd just
drop the ' / entity'.
