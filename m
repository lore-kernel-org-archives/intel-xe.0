Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D185CE77180
	for <intel-xe@archiver.kernel.org>; Tue, 10 Dec 2024 04:29:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8029510E0E3;
	Tue, 10 Dec 2024 04:29:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="H5YUKu2r";
	dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AFCE10E0E3;
 Tue, 10 Dec 2024 04:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=W0mVNYleG7rejvTbSAYKoOpittcDfBCnrACXJYLLcN8=; b=H5YUKu2rtpLnxLyMrn/owXTZbk
 kNqdORedQBdRJ8ZkGg+HarmxiLCFk2iiE3LjamNeV1gO1ny4BO6FgXjalTLugUhyO4OxUTdYnrZuD
 TXHJ97dOAhOd1t8jWDvJe/q9kZ0WygEhF5gSTRwc2SPmvSKjN7VXDbA4dFWW6McylpsOvUQWV0Nd4
 /zSpGRD0Iam2J3jjHiKs0DMEtPRegsJ11gAXyO0Wchbk7NgYSgmLLNEZ2bfbOo3qW7Yidn3RS5+wo
 uAU0roywBuS+bz3rodBqZFAVKRl/y/UMGgl8RK/IkKlWrinWUL37xMTMDQ86/QNf4s6ODbzEmSyzv
 hap6q4zA==;
Received: from hch by bombadil.infradead.org with local (Exim 4.98 #2 (Red Hat
 Linux)) id 1tKrsQ-0000000AC9F-1WCJ; Tue, 10 Dec 2024 04:29:38 +0000
Date: Mon, 9 Dec 2024 20:29:38 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Mika Kuoppala <mika.kuoppala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, Oleg Nesterov <oleg@redhat.com>,
 linux-kernel@vger.kernel.org, Dave Airlie <airlied@redhat.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Matthew Brost <matthew.brost@intel.com>, Andi Shyti <andi.shyti@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Maciej Patelczyk <maciej.patelczyk@linux.intel.com>,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>
Subject: Re: [PATCH 01/26] ptrace: export ptrace_may_access
Message-ID: <Z1fDsvIKB4j_-Tv_@infradead.org>
References: <20241209133318.1806472-1-mika.kuoppala@linux.intel.com>
 <20241209133318.1806472-2-mika.kuoppala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241209133318.1806472-2-mika.kuoppala@linux.intel.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
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

On Mon, Dec 09, 2024 at 03:32:52PM +0200, Mika Kuoppala wrote:
> xe driver would like to allow fine grained access control
> for GDB debugger using ptrace. Without this export, the only
> option would be to check for CAP_SYS_ADMIN.
> 
> The check intended for an ioctl to attach a GPU debugger
> is similar to the ptrace use case: allow a calling process
> to manipulate a target process if it has the necessary
> capabilities or the same permissions, as described in
> Documentation/process/adding-syscalls.rst.
> 
> Export ptrace_may_access function to allow GPU debugger to
> have identical access control for debugger(s)
> as a CPU debugger.

This seems to mis an actual user or you forgot to Cc linux-kernel on it.

