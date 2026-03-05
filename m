Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5288EFCA17A
	for <intel-xe@archiver.kernel.org>; Mon,  9 Mar 2026 18:55:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C72310E58D;
	Mon,  9 Mar 2026 18:55:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=sina.com header.i=@sina.com header.b="ymqM37cY";
	dkim-atps=neutral
X-Greylist: delayed 323 seconds by postgrey-1.36 at gabe;
 Thu, 05 Mar 2026 23:15:25 UTC
Received: from r3-23.sinamail.sina.com.cn (r3-23.sinamail.sina.com.cn
 [202.108.3.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6291D10EC85
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Mar 2026 23:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208;
 t=1772752525; bh=Shl+BiZngOGxg1GDTZ6fLo/PO0+5Oaw5mzBqiPTjjjQ=;
 h=From:Subject:Date:Message-ID;
 b=ymqM37cYXL5cx2FbwSffTjCRopCatOi5pDbD1+TwGtL+RJA//7UyXXl67ldUXzqZA
 M8GSqqTE/IoaVUWp/nKCs1PsqecK6QCzlwED0Vj6Fp3evZW1Q5dFDnPFzBhKlLupmH
 MmQOPgGvamdAXpow/y7pHcb4Fc0i6cJlaCpoexqE=
X-SMAIL-HELO: localhost.localdomain
Received: from unknown (HELO localhost.localdomain)([114.249.62.144])
 by sina.com (10.54.253.31) with ESMTP
 id 69AA0D4600005D81; Thu, 6 Mar 2026 07:09:59 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
Authentication-Results: sina.com; spf=none smtp.mailfrom=hdanton@sina.com;
 dkim=none header.i=none;
 dmarc=none action=none header.from=hdanton@sina.com
X-SMAIL-MID: 3628436816224
X-SMAIL-UIID: 0D0675C103F64A02951E9EFE8FA1D363-20260306-070959-1
From: Hillf Danton <hdanton@sina.com>
To: Chia-I Wu <olvaffe@gmail.com>
Cc: Matthew Brost <matthew.brost@intel.com>,
 DRI <dri-devel@lists.freedesktop.org>, intel-xe@lists.freedesktop.org,
 Danilo Krummrich <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 LKML <linux-kernel@vger.kernel.org>
Subject: Re: drm_sched run_job and scheduling latency
Date: Fri,  6 Mar 2026 07:09:46 +0800
Message-ID: <20260305230948.679-1-hdanton@sina.com>
In-Reply-To: <CAPaKu7RbCtkz1BbX57+CebB2uepyCAi-3QzBy8BDGngCJ-Du0w@mail.gmail.com>
References: <CAPaKu7RbCtkz1BbX57+CebB2uepyCAi-3QzBy8BDGngCJ-Du0w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 09 Mar 2026 18:55:56 +0000
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

On Wed, Mar 04, 2026 at 02:51:39PM -0800, Chia-I Wu wrote:
> Hi,
> 
> Our system compositor (surfaceflinger on android) submits gpu jobs
> from a SCHED_FIFO thread to an RT gpu queue. However, because
> workqueue threads are SCHED_NORMAL, the scheduling latency from submit
> to run_job can sometimes cause frame misses. We are seeing this on
> panthor and xe, but the issue should be common to all drm_sched users.
> 
> Using a WQ_HIGHPRI workqueue helps, but it is still not RT (and won't
> meet future android requirements). It seems either workqueue needs to
> gain RT support, or drm_sched needs to support kthread_worker.
>
As RT means (in general) to some extent that the game of eevdf is played in
__userspace__, but you are not PeterZ, so any issue like frame miss is
understandably expected.
Who made the workqueue worker a victim if the CPU cycles are not tight?
Who is the new victim of a RT kthread worker?
As RT is not free, what did you pay for it, given fewer RT success on market?
