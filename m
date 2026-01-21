Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6662DC4452E
	for <intel-xe@archiver.kernel.org>; Wed, 21 Jan 2026 13:19:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E7D010E1EF;
	Wed, 21 Jan 2026 13:19:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.b="QKy0MKmm";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Emw2iIPf";
	dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0ABE10E1EF;
 Wed, 21 Jan 2026 13:19:48 +0000 (UTC)
Date: Wed, 21 Jan 2026 14:19:45 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1769001587;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gS2+iHxIbevA83J45Omvh8/BUHWmgVWea1xnhRoZIig=;
 b=QKy0MKmmtsDWsex5jjbDiYzULhWZhMSKLDtYJaJVkWh2KoLFS6G0SMQAUW581hm/A01gC5
 MaQDYQFKxSNw3paCHGHBznYCmTAOc6kyOE2elI2woIrzgYZx3wLDd0oHzwggwEVzIkFEYN
 rsDJNv2viTyKzZgFnH10vWDFNu8rszKm6BH+yRc8L1Wa33EwGPl+GBYJ0D8o3y0g9YYFMx
 IvmjH8earqkeg5Sfa2dmRf8NQEpBaQTWLtVNDtSD+ac18R8oV7rysax7iHVLSq8bCwRdEd
 A0z9wziULb6Lldfwo8qVNCS251e3+39n2IZ/Bpu15ZyzvhZlg74/3jbVWB/W8Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1769001587;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gS2+iHxIbevA83J45Omvh8/BUHWmgVWea1xnhRoZIig=;
 b=Emw2iIPfU/LjQBQfEsFgPEyEfYs6Rw1TSZd9/MgsQG/gXXpbWh1gUu7ysxdHnWntVYSc3J
 fseZOvj/X0D7OUDQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
Cc: hansg@kernel.org, "Kurmi, Suresh Kumar" <suresh.kumar.kurmi@intel.com>,
 "Saarinen, Jani" <jani.saarinen@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev,
 sfr@canb.auug.org.au, ilpo.jarvinen@linux.intel.com,
 regressions@leemhuis.info
Subject: Re: REGRESSION on linux-next (next-20260115)
Message-ID: <20260121131945.i78zWqhv@linutronix.de>
References: <555f1c56-0f74-41bf-8bd2-6217e0aab0c6@intel.com>
 <20260121075348.5MyqcHFB@linutronix.de>
 <89de03a5-e5da-4d2e-8547-8e54ad73b324@intel.com>
 <20260121090154.Lpaj9hrr@linutronix.de>
 <5d83c0d0-8f82-40a8-bca6-7052658a5fb6@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <5d83c0d0-8f82-40a8-bca6-7052658a5fb6@intel.com>
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

On 2026-01-21 17:43:50 [+0530], Borah, Chaitanya Kumar wrote:
> This helps. Thank you for the patch. Would you be floating it soon?

Yes, I will. I consider this as a tested-by.

Sebastian
