Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45BCBE92FC6
	for <intel-xe@archiver.kernel.org>; Thu,  5 Oct 2023 21:23:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F19610E496;
	Thu,  5 Oct 2023 21:23:07 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3060D10E42C
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Oct 2023 21:23:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 87A06B826B2;
 Thu,  5 Oct 2023 21:23:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF6F4C433C7;
 Thu,  5 Oct 2023 21:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1696540981;
 bh=k9ogAMNTwUu/79lH07v0A91/gGJzw0lDsKwCEGx54As=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nnacWpn5XiweDeOlXAlh4eVAoKj+BA6EtVTxJuH0NBSluq/95XOSAmdDVVqpTS/GG
 gSy9lR76jm+h2XITHFLRJaWLoABKGwiFEEKaqPwWLrV70qk7GncMCXISCBjT9p6Z8k
 KD3EXDiAWgBs0nREG5HhetMzL3eY+1hHgFwN4poe5Xixb+uIJIwSxzYCw5au/oKh9F
 7FzKzIyWr4w+8kSH1nu2OwLXf37uvMYfXP7OuPvldckOUDbfCZEt/BEDFyDb+DhEtx
 Mj8tSh6E0kULmtSBQgaG9WPd0PIqAjjURwgGnBrOR2U8jxo8KTNUaDDc2/gbwYrcLE
 vC+ms4W9lI6/Q==
Date: Thu, 5 Oct 2023 23:22:56 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: David Kershner <david.kershner@intel.com>
Message-ID: <20231005212256.gt3ouonmgktw754o@zenone.zhora.eu>
References: <20231003222145.4090918-1-david.kershner@intel.com>
 <20231003222145.4090918-3-david.kershner@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231003222145.4090918-3-david.kershner@intel.com>
Subject: Re: [Intel-xe] [PATCH v3 2/2] drm/xe/xe_hwmon.c: Add static to
 xe_hwmon_process_reg_read64
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
Cc: john.fleck@intel.com, stuart.summers@intel.com, matthew.d.roper@intel.com,
 intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hi David,

On Tue, Oct 03, 2023 at 06:21:45PM -0400, David Kershner wrote:
> Add static to xe_hwmon_process_reg_read64 to avoid compile warning:
> 
>     ../drivers/gpu/drm/xe/xe_hwmon.c:126:5: error: no previous prototype
>          for ‘xe_hwmon_process_reg_read64’ [-Werror=missing-prototypes]
> 
> Signed-off-by: David Kershner <david.kershner@intel.com>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks,
Andi
