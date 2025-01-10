Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D9B7E77188
	for <intel-xe@archiver.kernel.org>; Fri, 10 Jan 2025 11:40:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D608510F0AC;
	Fri, 10 Jan 2025 11:40:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="TlJjmgzk";
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC79A10F0AC
 for <intel-xe@lists.freedesktop.org>; Fri, 10 Jan 2025 11:40:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 542D25C10C3
 for <intel-xe@lists.freedesktop.org>; Fri, 10 Jan 2025 11:39:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD15DC4CED6
 for <intel-xe@lists.freedesktop.org>; Fri, 10 Jan 2025 11:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736509205;
 bh=5SigbtN2i1FZnI81q649BUKplxUQ748fSLjbdaewxWY=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=TlJjmgzkt7WIpseuCtZTHNZkojuUKV01tTgv1awb/ng6QnhE7Qz84PPx06JO7hERv
 4T/NOQ+qBNB+a75zlaa8y2bEEnq4oHDuMnhP9q8XF7FUFiAlxb+R6e/ECZRL2s0dI0
 YqeJ1mKmFlhpWGqAWWWM1wcufPOMhEGAenjFyIlbVOQu2YZ+PBZ6GcJ8WPIp3QULSD
 s/6vPK/h6jGwwfmOnrqkW9gE1vnwwuOOsXWEOXuHm5q9dHaNdtjm8yaQaRedRfechJ
 zY53O4pBW0/yXnN8sbGUxNGTEO8mQoZ0dIPzi/tGLe/oA/lrq8Ern+rvnDAlkoDuuC
 UnMmxdfkGJJjQ==
Date: Fri, 10 Jan 2025 12:40:00 +0100
From: Joel Granados <joel.granados@kernel.org>
To: intel-xe@lists.freedesktop.org
Subject: Re: =?utf-8?Q?=E2=9C=97_CI=2Echeckpatch=3A_warnin?= =?utf-8?Q?g?=
 for treewide: const qualify ctl_tables where applicable
Message-ID: <q6cslwxwegnfcphgjvhekzkcpzo5ovw6ha6rqj6puta6lljlcl@pn422kv3q33w>
References: <20250109-jag-ctl_table_const-v1-1-622aea7230cf@kernel.org>
 <173643910431.1675666.10821350029808089715@b555e5b46a47>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <173643910431.1675666.10821350029808089715@b555e5b46a47>
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

On Thu, Jan 09, 2025 at 04:11:44PM -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: treewide: const qualify ctl_tables where applicable
> URL   : https://patchwork.freedesktop.org/series/143333/
> State : warning
This can be ignored.
> 
> == Summary ==
> 
> + KERNEL=/kernel
> + git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
> Cloning into 'mt'...
> warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
> + git -C mt rev-list -n1 origin/master
> 30ab6715fc09baee6cc14cb3c89ad8858688d474
> + cd /kernel
> + git config --global --add safe.directory /kernel
> + git log -n1
> commit 8c9fd692cfd7df82d0454d25ab66dc2185697be7
> Author: Joel Granados <joel.granados@kernel.org>
> Date:   Thu Jan 9 14:16:39 2025 +0100
> 
>     treewide: const qualify ctl_tables where applicable
>     
>     Add the const qualifier to all the ctl_tables in the tree except the
>     ones in ./net dir. The "net" sysctl code is special as it modifies the
>     arrays before passing it on to the registration function.
>     
>     Constifying ctl_table structs will prevent the modification of
>     proc_handler function pointers as the arrays would reside in .rodata.
>     This is made possible after commit 78eb4ea25cd5 ("sysctl: treewide:
>     constify the ctl_table argument of proc_handlers") constified all the
>     proc_handlers.
>     
>     Created this by running an spatch followed by a sed command:
>     Spatch:
>         virtual patch
>     
>         @
>         depends on !(file in "net")
>         disable optional_qualifier
>         @
>         identifier table_name;
>         @@
>     
>         + const
>         struct ctl_table table_name [] = { ... };
>     
>     sed:
>         sed --in-place \
>           -e "s/struct ctl_table .table = &uts_kern/const struct ctl_table *table = \&uts_kern/" \
This line is a little bit long, but I think dividing it is overkill

>           kernel/utsname_sysctl.c
>     
>     Signed-off-by: Joel Granados <joel.granados@kernel.org>
>     Acked-by: Steven Rostedt (Google) <rostedt@goodmis.org> # for kernel/trace/
>     Acked-by: Jani Nikula <jani.nikula@intel.com>
>     Reviewed-by: "Darrick J. Wong" <djwong@kernel.org> # xfs
> + /mt/dim checkpatch 424f495e9572bf87a42e3be0aa02ac4777541033 drm-intel
> 8c9fd692cfd7 treewide: const qualify ctl_tables where applicable
> -:32: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
> #32: 
>       -e "s/struct ctl_table .table = &uts_kern/const struct ctl_table *table = \&uts_kern/" \
> 
> -:444: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
> #444: FILE: drivers/misc/sgi-xp/xpc_main.c:114:
>  };
> +static const struct ctl_table xpc_sys_xpc[] = {
pre-existing from before
> 
> -:1224: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
> #1224: FILE: kernel/stackleak.c:47:
>  }
> +static const struct ctl_table stackleak_sysctls[] = {
pre-existing from before
> 
> total: 0 errors, 1 warnings, 2 checks, 960 lines checked
> 
> 
best

-- 

Joel Granados
