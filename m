Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FF00C6FD1D
	for <intel-xe@archiver.kernel.org>; Fri, 17 Mar 2023 15:07:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C9AB10E3C9;
	Fri, 17 Mar 2023 15:07:52 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7A2910E3C9
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Mar 2023 15:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679065669; x=1710601669;
 h=date:from:to:cc:subject:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4Wl3nVYxvKgAlQG5IfiRdHvuxtZGt3n/oBsL+h1zIGk=;
 b=gA+D+q/2s/eY6SEvd0rLpohz06vqgW/wcAtGc52+AqXZ8hxfM/DBnA0+
 HO4Izqau/dLcu5a8X1XCiXwQN/vMZKpUz+Uwk1QVlK43grlw5+7BBxrMv
 v7m8Mjfzx2XWdCsWoKhKViTmC/k1IBqNOhvow5669Q6XfXD1qzRU1ReBa
 jD8rKmd6KqEHfq0+v1neaV7giZjviun0TtP+ZkHzMR2YgwTUh7WdfM3UF
 v+r3nBZS2ksIgo69SkmgeXFHNoY8RQEWViq/r49kwILb+RcpUsd5SSRYd
 1SmqswmVwWtX+I50C3u4fAWQx3wNSpMmqZ4Lc35pplWGDyTmc7uvtxOcu g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="335775102"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; d="scan'208";a="335775102"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2023 08:07:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="926174630"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; d="scan'208";a="926174630"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga006.fm.intel.com with ESMTP; 17 Mar 2023 08:07:45 -0700
Received: from maurocar-mobl2 (maurocar-mobl2.ger.corp.intel.com
 [10.252.25.205])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 7331B580677;
 Fri, 17 Mar 2023 08:07:43 -0700 (PDT)
Date: Fri, 17 Mar 2023 16:07:40 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230317160740.0fb124de@maurocar-mobl2>
In-Reply-To: <20230316210341.3547058-3-lucas.demarchi@intel.com>
References: <20230316210341.3547058-1-lucas.demarchi@intel.com>
 <20230316210341.3547058-3-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH v2 2/3] UML: define RUNTIME_DISCARD_EXIT
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
Cc: Matt Roper <matthew.d.roper@intel.com>, thomas.hellstrom@intel.com,
 mauro.chehab@intel.com, intel-xe@lists.freedesktop.org,
 maarten.lankhorst@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, 16 Mar 2023 14:03:40 -0700
Lucas De Marchi <lucas.demarchi@intel.com> wrote:

> From: Masahiro Yamada <masahiroy@kernel.org>
> 
> With CONFIG_VIRTIO_UML=y, GNU ld < 2.36 fails to link UML vmlinux
> (w/wo CONFIG_LD_SCRIPT_STATIC).
> 
>   `.exit.text' referenced in section `.uml.exitcall.exit' of arch/um/drivers/virtio_uml.o: defined in discarded section `.exit.text' of arch/um/drivers/virtio_uml.o
>   collect2: error: ld returned 1 exit status
> 
> This fix is similar to the following commits:
> 
> - 4b9880dbf3bd ("powerpc/vmlinux.lds: Define RUNTIME_DISCARD_EXIT")
> - a494398bde27 ("s390: define RUNTIME_DISCARD_EXIT to fix link error
>   with GNU ld < 2.36")
> - c1c551bebf92 ("sh: define RUNTIME_DISCARD_EXIT")
> 
> Fixes: 99cb0d917ffa ("arch: fix broken BuildID for arm64 and riscv")
> Reported-by: SeongJae Park <sj@kernel.org>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> Tested-by: SeongJae Park <sj@kernel.org>
> Signed-off-by: Richard Weinberger <richard@nod.at>
> (cherry picked from commit b99ddbe8336ee680257c8ab479f75051eaa49dcf)

Hacky... Ok, feel free to add my R-B:

Reviewed-by: Mauro Carvalho Chehab <mchehab@kernel.org>

> ---
>  arch/um/kernel/vmlinux.lds.S | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/um/kernel/vmlinux.lds.S b/arch/um/kernel/vmlinux.lds.S
> index 16e49bfa2b42..53d719c04ba9 100644
> --- a/arch/um/kernel/vmlinux.lds.S
> +++ b/arch/um/kernel/vmlinux.lds.S
> @@ -1,4 +1,4 @@
> -
> +#define RUNTIME_DISCARD_EXIT
>  KERNEL_STACK_SIZE = 4096 * (1 << CONFIG_KERNEL_STACK_ORDER);
>  
>  #ifdef CONFIG_LD_SCRIPT_STATIC
