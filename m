Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01D5EFCA17E
	for <intel-xe@archiver.kernel.org>; Mon,  9 Mar 2026 18:56:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACACB10E598;
	Mon,  9 Mar 2026 18:56:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=sina.com header.i=@sina.com header.b="ZvKYF/5b";
	dkim-atps=neutral
X-Greylist: delayed 45960 seconds by postgrey-1.36 at gabe;
 Fri, 06 Mar 2026 11:58:26 UTC
Received: from smtp153-165.sina.com.cn (smtp153-165.sina.com.cn
 [61.135.153.165])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17DE810ED0C
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Mar 2026 11:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208;
 t=1772798306; bh=avyToukqBCgR47QJWZapPZk3My1EVsZ0bDwSZ+GeHwg=;
 h=From:Subject:Date:Message-ID;
 b=ZvKYF/5bwpDuIEbgxRcD6bX2UJpApyEIixgfWoQqs+nDe1GH/JMqF8461PuDbNJCD
 hHhTnn5B1VP0WIMRF/VChcEzVJzW04IciGjAtkfBZW50ot0HP1JCa2iVkPXQB2OG9+
 fgCvpg+2fYeeVICg+/gVCoolxdailL/Q47w/hYnE=
X-SMAIL-HELO: localhost.localdomain
Received: from unknown (HELO localhost.localdomain)([114.249.62.144])
 by sina.com (10.54.253.32) with ESMTP
 id 69AAC15D00007DF9; Fri, 6 Mar 2026 19:58:22 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
Authentication-Results: sina.com; spf=none smtp.mailfrom=hdanton@sina.com;
 dkim=none header.i=none;
 dmarc=none action=none header.from=hdanton@sina.com
X-SMAIL-MID: 7320354456676
X-SMAIL-UIID: C324B5B58FA84231A77A84B622E6BD47-20260306-195822-1
From: Hillf Danton <hdanton@sina.com>
To: Chia-I Wu <olvaffe@gmail.com>
Cc: Matthew Brost <matthew.brost@intel.com>,
 DRI <dri-devel@lists.freedesktop.org>, intel-xe@lists.freedesktop.org,
 Danilo Krummrich <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 LKML <linux-kernel@vger.kernel.org>
Subject: Re: drm_sched run_job and scheduling latency
Date: Fri,  6 Mar 2026 19:58:09 +0800
Message-ID: <20260306115811.695-1-hdanton@sina.com>
In-Reply-To: <CAPaKu7RBw9mzvQVznX7UWhMTXLVU+tcaOVHtNP2FmoT5-D+daA@mail.gmail.com>
References: 
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

On Thu, 5 Mar 2026 21:46:21 -0800 Chia-I Wu wrote:
>On Thu, Mar 5, 2026 at 3:10 PM Hillf Danton <hdanton@sina.com> wrote:
>> On Wed, Mar 04, 2026 at 02:51:39PM -0800, Chia-I Wu wrote:
>> > Hi,
>> >
>> > Our system compositor (surfaceflinger on android) submits gpu jobs
>> > from a SCHED_FIFO thread to an RT gpu queue. However, because
>> > workqueue threads are SCHED_NORMAL, the scheduling latency from submit
>> > to run_job can sometimes cause frame misses. We are seeing this on
>> > panthor and xe, but the issue should be common to all drm_sched users.
>> >
>> > Using a WQ_HIGHPRI workqueue helps, but it is still not RT (and won't
>> > meet future android requirements). It seems either workqueue needs to
>> > gain RT support, or drm_sched needs to support kthread_worker.
>> >
>> As RT means (in general) to some extent that the game of eevdf is played in
>> __userspace__, but you are not PeterZ, so any issue like frame miss is
>> understandably expected.
>> Who made the workqueue worker a victim if the CPU cycles are not tight?
>> Who is the new victim of a RT kthread worker?
>> As RT is not free, what did you pay for it, given fewer RT success on market?
>>
> That is a deliberate decision for android, that avoiding frame misses
> is a top priority.
> 
> Also, I think most drm drivers already signal their fences from irq
> handlers or rt threads for a similar reason. And the reasoning applies
> to submissions as well.
> 
If RT submission alone works for you then your CPU cycles are tight.
And if your workloads are sanely correct then making workqueue and/or kthread
worker RT barely makes sense because the right option is to buy CPU with
higher capacity.
