Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4020CC79FA0
	for <intel-xe@archiver.kernel.org>; Mon,  7 Sep 2026 16:19:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C68DD10E295;
	Mon,  7 Sep 2026 16:19:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NbHnBnNo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8360910E14B
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Sep 2026 16:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788797973; x=1820333973;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=c25cg+X1tncePPLT/+QSe+Q8bs1UUO8h61gOp2ih66I=;
 b=NbHnBnNoh9PwK63IQEViWIvTkoeIAY/TxDVFQArnayjC4wQu5PPK+5ll
 IlrgmRstEX7alcJPgThaS12BdJ9dnMoX5BXwB4fu2gK8ptTGOqvW7Vkfg
 mrbpa59rOgrse8Zo2aNSp3hK/g1uWdtlMbPql8SkoeCTeAzRi4jkhdrHw
 pqRhTcOBeVucZszu+iWqr3bt2vZnnWXjesHgK/eZ5tZxlhD9blzNaqlUB
 QRj34fm+FMDV+oEVZCwsRHecF8LLOioHsFjPq2pQwOKyl6fixEyJ4f6ST
 jfkv3q8XE6w9PcVjPK6dkJlCd4PsdvKZ/F0BG+PRvVtA/ViTI9d4SOWQk A==;
X-CSE-ConnectionGUID: 5xTow79uSJirRrg31LB7CA==
X-CSE-MsgGUID: MePR+BCeSbyQTM8+zRxg4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="89221770"
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="89221770"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 09:19:33 -0700
X-CSE-ConnectionGUID: PjTlkUNJSNywszJIkLfwHQ==
X-CSE-MsgGUID: oRiraS2wRJSjJQPH4vep2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="268176208"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO [10.245.245.247])
 ([10.245.245.247])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 09:19:32 -0700
Message-ID: <9f8ed1a2-1ac1-4b91-9587-8fe78c77820c@intel.com>
Date: Mon, 7 Sep 2026 17:19:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] drm/xe/xe_migrate: Fix page tracking in
 access_memory
To: Jan Maslak <jan.maslak@intel.com>, intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 rodrigo.vivi@intel.com, Christoph Manszewski <christoph.manszewski@intel.com>
References: <20260622103449.3335928-1-jan.maslak@intel.com>
 <20260622103449.3335928-3-jan.maslak@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20260622103449.3335928-3-jan.maslak@intel.com>
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

On 22/06/2026 11:34, Jan Maslak wrote:
> From: Christoph Manszewski <christoph.manszewski@intel.com>
> 
> xe_migrate_access_memory() advances the pagemap cursor based on the
> current page in the CPU buffer.
> 
> Include the initial page offset when recalculating current_page so
> subsequent iterations continue to index the mapped pages correctly.
> 
> Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
> Signed-off-by: Jan Maslak <jan.maslak@intel.com>

Reviewed-by: Matthew Auld <matthew.auld@intel.com>
