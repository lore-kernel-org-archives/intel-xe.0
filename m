Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 001D1C27C65
	for <intel-xe@archiver.kernel.org>; Tue, 11 Jun 2024 16:22:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D88A10E1A6;
	Tue, 11 Jun 2024 16:22:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QY5ZQ+4y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 622B910E1A6
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Jun 2024 16:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718122952; x=1749658952;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=/uaqzMT8mJ6AYpaUlmtONvAkqqeAzmuNFkyZrh6d88I=;
 b=QY5ZQ+4yeMoAOducpgIaaqC3Nje0MkxLzJAYxWS+LiMRTkcxbvLqfguG
 ehoxtgCHEP0Ed8FQlIYh4JvPg9nxBHkhoHexTT7qMDS8zkGWJzu5isfU3
 nxT6j+VbZHgPFt/hP32/vgBA/Xmn7Uzn4/Z9gX1yeHxTm3ITeFnOWQ7Aj
 b3QZpvVdCeEMFP8a+fCZuurSwUak3bw1bUADgrgXjFS2/Zg5xEEWp8DBK
 hFiDcn7W+2XqzC6QbBkB9J6sqmFYGO1uMYNpDlRrUVnNqVQfv/p0s5Lhl
 Zy9mY3dmPQWrUstQ3MJBbZye1tNPtD1w43ylyO+4jGbtMfbocTqnlAU8Q w==;
X-CSE-ConnectionGUID: vOueQqk3QBiBULLsoJanwA==
X-CSE-MsgGUID: ZK59iuUlQQCizzZC1n7foA==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="26262783"
X-IronPort-AV: E=Sophos;i="6.08,230,1712646000"; d="scan'208";a="26262783"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 09:22:31 -0700
X-CSE-ConnectionGUID: jrf6lvXHT8ewr4kFlfDD4Q==
X-CSE-MsgGUID: 4KcD5ZkDTDaaMMJa6lFGEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,230,1712646000"; d="scan'208";a="44614451"
Received: from unknown (HELO [10.245.245.156]) ([10.245.245.156])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 09:22:29 -0700
Message-ID: <d0890a8e-bc72-473f-89d6-02d84eb4f493@intel.com>
Date: Tue, 11 Jun 2024 17:22:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/irq: remove xe_irq_shutdown
To: Ilia Levi <illevi@habana.ai>, intel-xe@lists.freedesktop.org
Cc: obitton@habana.ai, dliberman@habana.ai, dmeriin@habana.ai,
 matthew.brost@intel.com
References: <20240606124705.822451-1-illevi@habana.ai>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20240606124705.822451-1-illevi@habana.ai>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 06/06/2024 13:47, Ilia Levi wrote:
> The cleanup is done by devres in irq_uninstall.
> 
> Commit bbc9651fe9f4 ("drm/xe/irq: move irq_uninstall over to devm")
> resolved the ordering issue where irq_uninstall (registered with drmm)
> was called after pci_free_irq_vectors (registered with devm upon calling
> pci_alloc_irq_vectors). This happened because drmm action list is
> registered with devm very early in the init flow - before
> pci_alloc_irq_vectors.
> 
> Now that irq_uninstall is registered with devm, it will be called before
> pci_free_irq_vectors and we can remove xe_irq_shutdown.
> 
> Signed-off-by: Ilia Levi <illevi@habana.ai>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
