Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31CD5C47073
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jan 2024 15:10:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE20D10E46E;
	Tue,  9 Jan 2024 15:10:40 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56EF810E46E
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Jan 2024 15:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704813039; x=1736349039;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=K2aIMv4J7T0nvgjYtpMOec/sIyAiNM/ceuzXVEy/MKU=;
 b=VAHb5PpfWHgBmnvMp0qNThga0qMwDAPDpMMR/HBpofAq1e6z4Cw6LwIq
 WndXhGj9J/EXOW7kELSf/4R85iBs2STS3uaQj5WKs01lvIjvYTG0dPeXM
 KyMXlq1qoUfCbZmNaS+3TxSOSiOotr3AzeAqHS3uAog0umPL54+GjujRX
 TIhxVHLb5Ag+yPhjR15FBrHrX7ujZDYOzDXu+Z9RjXdlIlGjgVP1hd7xI
 eenpgCBvACw4HhhaMVLu4mt+PKQf86OXx+W5FSNR4LT08v923u0t1o/ey
 CmZCmXMctHaOX5vTcDiqNir5wxDAhht86EHGOOtkvpfngCOC2C0XammWS g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="395391924"
X-IronPort-AV: E=Sophos;i="6.04,183,1695711600"; d="scan'208";a="395391924"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2024 07:10:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="872270845"
X-IronPort-AV: E=Sophos;i="6.04,183,1695711600"; d="scan'208";a="872270845"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by FMSMGA003.fm.intel.com with ESMTP; 09 Jan 2024 07:10:36 -0800
Received: from [10.249.150.124] (mwajdecz-MOBL.ger.corp.intel.com
 [10.249.150.124])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 7C62CB4D55
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Jan 2024 15:10:35 +0000 (GMT)
Message-ID: <3e64d343-9be8-4680-b3f9-a9dba5af5ff1@intel.com>
Date: Tue, 9 Jan 2024 16:10:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Fix compilation without CONFIG_KUNIT
Content-Language: en-US
To: intel-xe@lists.freedesktop.org
References: <20240105171947.321-1-michal.wajdeczko@intel.com>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20240105171947.321-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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



On 05.01.2024 18:19, Michal Wajdeczko wrote:
> It looks that declaration of kunit_get_current_test() was
> available in xe_guc_relay.c only with CONFIG_KUNIT enabled.
> If CONFIG_KUNIT is disabled we fail with:
> 
> In file included from ../include/linux/build_bug.h:5,
>                  from ../include/linux/bitfield.h:10,
>                  from ../drivers/gpu/drm/xe/xe_guc_relay.c:6:
> ../drivers/gpu/drm/xe/xe_guc_relay.c: In function ‘xe_guc_relay_process_guc2vf’:
> ../drivers/gpu/drm/xe/xe_guc_relay.c:863:52: error: implicit declaration of function ‘kunit_get_current_test’ [-Werror=implicit-function-declaration]
>   863 |  if (unlikely(!IS_SRIOV_VF(relay_to_xe(relay)) && !kunit_get_current_test()))
>       |                                                    ^~~~~~~~~~~~~~~~~~~~~~
> ../include/linux/compiler.h:77:42: note: in definition of macro ‘unlikely’
>    77 | # define unlikely(x) __builtin_expect(!!(x), 0)
>       |                                          ^
> 
> Reported-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
> Fixes: 9a2c2ecb1b77 ("drm/xe/guc: Introduce Relay Communication for SR-IOV")

kernel test robot says problem was introduces by other patch, so it
should rather be:

Fixes: 27b717bac93f ("drm/xe/kunit: Add GuC Relay kunit test")

and since it's already merged, also for the record:

Closes:
https://lore.kernel.org/oe-kbuild-all/202401070036.60pNn4uZ-lkp@intel.com/

> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_relay.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_relay.c b/drivers/gpu/drm/xe/xe_guc_relay.c
> index b772088979bd..c0a2d8d5d3b3 100644
> --- a/drivers/gpu/drm/xe/xe_guc_relay.c
> +++ b/drivers/gpu/drm/xe/xe_guc_relay.c
> @@ -9,6 +9,7 @@
>  #include <drm/drm_managed.h>
>  
>  #include <kunit/static_stub.h>
> +#include <kunit/test-bug.h>
>  
>  #include "abi/guc_actions_sriov_abi.h"
>  #include "abi/guc_relay_actions_abi.h"
