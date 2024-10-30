Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E29CD3A67D
	for <intel-xe@archiver.kernel.org>; Wed, 30 Oct 2024 09:24:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1753F10E76D;
	Wed, 30 Oct 2024 09:24:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CgfT7aCQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 047FC10E766
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Oct 2024 09:24:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730280297; x=1761816297;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to;
 bh=vgzaCUtIpJOefIE0r8okk9e+pz91NvTLVGnJnliQ/4E=;
 b=CgfT7aCQoylwQCiL8Pts++BBtx8z/e/nSVm3ZjV6Ch7epeC2UQR/TiP9
 od9QpLI0ZeyCA21TWzH0BV60Q0nBvLGpng/kmA2ewjxq7fRtdMdY+O18i
 5CMwzMRNFsKJPcj0rVrqID8juwKdqGB6ozp/mmnTFBODt6HVcpTNg23eq
 qZcSMg9Ymhh5MbjNac9GTTzEveleM7I8/pC40Bp8Z82GAYr8ljejHCfbU
 wAbGWBKRZQgW4iZ8e1MWCQLowZwVd7PjA/zaRkka059H6iRfXHh5r6eog
 VFPPvSgnNVwVbl1rSI7tyiMRSuIoALU9DX3FeNeZmXGEE3SpRjdk7syRn A==;
X-CSE-ConnectionGUID: 8MLQyIxfRHeR5iL2DxmFEg==
X-CSE-MsgGUID: /ioi5P7iS12WgEk+nq9+bw==
X-IronPort-AV: E=McAfee;i="6700,10204,11240"; a="55376782"
X-IronPort-AV: E=Sophos;i="6.11,244,1725346800"; d="scan'208,217";a="55376782"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2024 02:24:57 -0700
X-CSE-ConnectionGUID: OVSu1Qj0TDall7PmtYZXwg==
X-CSE-MsgGUID: NaAg9UojRIScTnwXGVz96A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,244,1725346800"; d="scan'208,217";a="81894171"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.245.197.87])
 ([10.245.197.87])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2024 02:24:55 -0700
Content-Type: multipart/alternative;
 boundary="------------JqqBHxgzw0YV0mQ5nZ4PQFvZ"
Message-ID: <cb3304b6-cedb-46f2-9869-4f652f150b7a@linux.intel.com>
Date: Wed, 30 Oct 2024 10:24:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] drm/xe: Add trace to lrc timestamp update
To: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
References: <20241029214351.776293-1-lucas.demarchi@intel.com>
 <20241029214351.776293-2-lucas.demarchi@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20241029214351.776293-2-lucas.demarchi@intel.com>
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

This is a multi-part message in MIME format.
--------------JqqBHxgzw0YV0mQ5nZ4PQFvZ
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On 10/29/2024 10:43 PM, Lucas De Marchi wrote:
> Help debugging when LRC timestamp is updated for a exec queue.
>
> Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>  drivers/gpu/drm/xe/Makefile       |  1 +
>  drivers/gpu/drm/xe/xe_lrc.c       |  3 ++
>  drivers/gpu/drm/xe/xe_trace_lrc.c |  9 ++++++
>  drivers/gpu/drm/xe/xe_trace_lrc.h | 52 +++++++++++++++++++++++++++++++
>  4 files changed, 65 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/xe_trace_lrc.c
>  create mode 100644 drivers/gpu/drm/xe/xe_trace_lrc.h
>
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index bc7a04ce69fd0..21d69935c3365 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -101,6 +101,7 @@ xe-y += xe_bb.o \
>  	xe_trace.o \
>  	xe_trace_bo.o \
>  	xe_trace_guc.o \
> +	xe_trace_lrc.o \
>  	xe_ttm_sys_mgr.o \
>  	xe_ttm_stolen_mgr.o \
>  	xe_ttm_vram_mgr.o \
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index 4f64c7f4e68de..4b65da77c6e09 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -25,6 +25,7 @@
>  #include "xe_map.h"
>  #include "xe_memirq.h"
>  #include "xe_sriov.h"
> +#include "xe_trace_lrc.h"
>  #include "xe_vm.h"
>  #include "xe_wa.h"
>  
> @@ -1758,5 +1759,7 @@ u32 xe_lrc_update_timestamp(struct xe_lrc *lrc, u32 *old_ts)
>  
>  	lrc->ctx_timestamp = xe_lrc_ctx_timestamp(lrc);
>  
> +	trace_xe_lrc_update_timestamp(lrc, *old_ts);
> +
>  	return lrc->ctx_timestamp;
>  }
> diff --git a/drivers/gpu/drm/xe/xe_trace_lrc.c b/drivers/gpu/drm/xe/xe_trace_lrc.c
> new file mode 100644
> index 0000000000000..ab9b7e2970bc2
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_trace_lrc.c
> @@ -0,0 +1,9 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +#ifndef __CHECKER__
> +#define CREATE_TRACE_POINTS
> +#include "xe_trace_lrc.h"
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_trace_lrc.h b/drivers/gpu/drm/xe/xe_trace_lrc.h
> new file mode 100644
> index 0000000000000..5c669a0b21808
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_trace_lrc.h
> @@ -0,0 +1,52 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +#undef TRACE_SYSTEM
> +#define TRACE_SYSTEM xe
> +
> +#if !defined(_XE_TRACE_LRC_H_) || defined(TRACE_HEADER_MULTI_READ)
> +#define _XE_TRACE_LRC_H_
> +
> +#include <linux/tracepoint.h>
> +#include <linux/types.h>
> +
> +#include "xe_gt_types.h"
> +#include "xe_lrc.h"
> +#include "xe_lrc_types.h"
> +
> +#define __dev_name_lrc(lrc)	dev_name(gt_to_xe((lrc)->fence_ctx.gt)->drm.dev)
> +
> +TRACE_EVENT(xe_lrc_update_timestamp,
> +	    TP_PROTO(struct xe_lrc *lrc, uint32_t old),
> +	    TP_ARGS(lrc, old),
> +	    TP_STRUCT__entry(
> +		     __field(struct xe_lrc *, lrc)
> +		     __field(u32, old)
> +		     __field(u32, new)
> +		     __string(name, lrc->fence_ctx.name)
> +		     __string(device_id, __dev_name_lrc(lrc))
> +	    ),
> +
> +	    TP_fast_assign(
> +		   __entry->lrc	= lrc;
> +		   __entry->old = old;
> +		   __entry->new = lrc->ctx_timestamp;
> +		   __assign_str(name);
> +		   __assign_str(device_id);
> +		   ),
> +	    TP_printk("lrc=:%p lrc->name=%s old=%u new=%u device_id:%s",
> +		      __entry->lrc, __get_str(name),
> +		      __entry->old, __entry->new,
> +		      __get_str(device_id))
> +);
> +
> +#endif
> +
> +/* This part must be outside protection */
> +#undef TRACE_INCLUDE_PATH
> +#undef TRACE_INCLUDE_FILE
> +#define TRACE_INCLUDE_PATH ../../drivers/gpu/drm/xe
> +#define TRACE_INCLUDE_FILE xe_trace_lrc
> +#include <trace/define_trace.h>
--------------JqqBHxgzw0YV0mQ5nZ4PQFvZ
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 10/29/2024 10:43 PM, Lucas De Marchi
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20241029214351.776293-2-lucas.demarchi@intel.com">
      <pre wrap="" class="moz-quote-pre">Help debugging when LRC timestamp is updated for a exec queue.

Reviewed-by: Jonathan Cavitt <a class="moz-txt-link-rfc2396E" href="mailto:jonathan.cavitt@intel.com">&lt;jonathan.cavitt@intel.com&gt;</a>
Signed-off-by: Lucas De Marchi <a class="moz-txt-link-rfc2396E" href="mailto:lucas.demarchi@intel.com">&lt;lucas.demarchi@intel.com&gt;</a></pre>
    </blockquote>
    <span style="padding: 0px; tab-size: 8; white-space: pre-wrap;"
    class="hljs diff colorediffs language-diff">
Reviewed-by: Nirmoy Das </span><a class="moz-txt-link-rfc2396E"
    href="mailto:nirmoy.das@intel.com" style="white-space: pre-wrap;">&lt;nirmoy.das@intel.com&gt;</a><span
    style="padding: 0px; tab-size: 8; white-space: pre-wrap;"
    class="hljs diff colorediffs language-diff"></span>
    <blockquote type="cite"
      cite="mid:20241029214351.776293-2-lucas.demarchi@intel.com">
      <pre wrap="" class="moz-quote-pre">
---
 drivers/gpu/drm/xe/Makefile       |  1 +
 drivers/gpu/drm/xe/xe_lrc.c       |  3 ++
 drivers/gpu/drm/xe/xe_trace_lrc.c |  9 ++++++
 drivers/gpu/drm/xe/xe_trace_lrc.h | 52 +++++++++++++++++++++++++++++++
 4 files changed, 65 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_trace_lrc.c
 create mode 100644 drivers/gpu/drm/xe/xe_trace_lrc.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index bc7a04ce69fd0..21d69935c3365 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -101,6 +101,7 @@ xe-y += xe_bb.o \
 	xe_trace.o \
 	xe_trace_bo.o \
 	xe_trace_guc.o \
+	xe_trace_lrc.o \
 	xe_ttm_sys_mgr.o \
 	xe_ttm_stolen_mgr.o \
 	xe_ttm_vram_mgr.o \
diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 4f64c7f4e68de..4b65da77c6e09 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -25,6 +25,7 @@
 #include "xe_map.h"
 #include "xe_memirq.h"
 #include "xe_sriov.h"
+#include "xe_trace_lrc.h"
 #include "xe_vm.h"
 #include "xe_wa.h"
 
@@ -1758,5 +1759,7 @@ u32 xe_lrc_update_timestamp(struct xe_lrc *lrc, u32 *old_ts)
 
 	lrc-&gt;ctx_timestamp = xe_lrc_ctx_timestamp(lrc);
 
+	trace_xe_lrc_update_timestamp(lrc, *old_ts);
+
 	return lrc-&gt;ctx_timestamp;
 }
diff --git a/drivers/gpu/drm/xe/xe_trace_lrc.c b/drivers/gpu/drm/xe/xe_trace_lrc.c
new file mode 100644
index 0000000000000..ab9b7e2970bc2
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_trace_lrc.c
@@ -0,0 +1,9 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+#ifndef __CHECKER__
+#define CREATE_TRACE_POINTS
+#include "xe_trace_lrc.h"
+#endif
diff --git a/drivers/gpu/drm/xe/xe_trace_lrc.h b/drivers/gpu/drm/xe/xe_trace_lrc.h
new file mode 100644
index 0000000000000..5c669a0b21808
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_trace_lrc.h
@@ -0,0 +1,52 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+#undef TRACE_SYSTEM
+#define TRACE_SYSTEM xe
+
+#if !defined(_XE_TRACE_LRC_H_) || defined(TRACE_HEADER_MULTI_READ)
+#define _XE_TRACE_LRC_H_
+
+#include &lt;linux/tracepoint.h&gt;
+#include &lt;linux/types.h&gt;
+
+#include "xe_gt_types.h"
+#include "xe_lrc.h"
+#include "xe_lrc_types.h"
+
+#define __dev_name_lrc(lrc)	dev_name(gt_to_xe((lrc)-&gt;fence_ctx.gt)-&gt;drm.dev)
+
+TRACE_EVENT(xe_lrc_update_timestamp,
+	    TP_PROTO(struct xe_lrc *lrc, uint32_t old),
+	    TP_ARGS(lrc, old),
+	    TP_STRUCT__entry(
+		     __field(struct xe_lrc *, lrc)
+		     __field(u32, old)
+		     __field(u32, new)
+		     __string(name, lrc-&gt;fence_ctx.name)
+		     __string(device_id, __dev_name_lrc(lrc))
+	    ),
+
+	    TP_fast_assign(
+		   __entry-&gt;lrc	= lrc;
+		   __entry-&gt;old = old;
+		   __entry-&gt;new = lrc-&gt;ctx_timestamp;
+		   __assign_str(name);
+		   __assign_str(device_id);
+		   ),
+	    TP_printk("lrc=:%p lrc-&gt;name=%s old=%u new=%u device_id:%s",
+		      __entry-&gt;lrc, __get_str(name),
+		      __entry-&gt;old, __entry-&gt;new,
+		      __get_str(device_id))
+);
+
+#endif
+
+/* This part must be outside protection */
+#undef TRACE_INCLUDE_PATH
+#undef TRACE_INCLUDE_FILE
+#define TRACE_INCLUDE_PATH ../../drivers/gpu/drm/xe
+#define TRACE_INCLUDE_FILE xe_trace_lrc
+#include &lt;trace/define_trace.h&gt;
</pre>
    </blockquote>
  </body>
</html>

--------------JqqBHxgzw0YV0mQ5nZ4PQFvZ--
