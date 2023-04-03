Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D8E8C76196
	for <intel-xe@archiver.kernel.org>; Mon,  3 Apr 2023 17:00:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E71110E525;
	Mon,  3 Apr 2023 17:00:21 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38CC610E525
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Apr 2023 17:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680541219; x=1712077219;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=thXd3ntpoEXds9pEYRXx6q0kdyDDhBRw49359gJe8Tw=;
 b=cB72sq8rM3RsBTqMYe893jQFYe7MYPotKu+PwXeTIbinAfu2hE7O65wP
 qJ7tb7tzJTEEJt17hPOGX3hHo2z0NG2AdCV2MGqQDpq6tCJtUCam399vG
 duLLOkafRZzWi/5vDz6EhqxWktWwdIGrAiLqUMSTNNOC6SDLc5KwCzIDM
 1V09ieUb/Qzn4/RPnQKGsWg9/86a34nvusw+73+cg+04FLrx/aLMS5mBE
 HhA69N9KiTyuIy4Rz3oipR6tZFjQlS9w85A4VmyNXythSF3OjocFDdP0O
 OfkUJwRiu/YCPmglF9mCR7gqz195V6oAxcg5TReNEySw8VLsiKwMVuE+z g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="341981671"
X-IronPort-AV: E=Sophos;i="5.98,315,1673942400"; d="scan'208";a="341981671"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2023 10:00:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="809905873"
X-IronPort-AV: E=Sophos;i="5.98,315,1673942400"; d="scan'208";a="809905873"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga004.jf.intel.com with ESMTP; 03 Apr 2023 10:00:17 -0700
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.28.164])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 96387580C63
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Apr 2023 10:00:17 -0700 (PDT)
Received: from localhost ([127.0.0.1])
 by linux.intel.com with esmtp (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1pjNXS-000kqm-34
 for intel-xe@lists.freedesktop.org; Mon, 03 Apr 2023 19:00:14 +0200
Message-ID: <16e6ea71-d8fd-85ec-22a3-5799b8ac1dba@linux.intel.com>
Date: Mon, 3 Apr 2023 19:00:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Content-Language: en-US
To: intel-xe@lists.freedesktop.org
References: <20230401085151.1786204-1-lucas.demarchi@intel.com>
 <20230401085151.1786204-4-lucas.demarchi@intel.com>
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
In-Reply-To: <20230401085151.1786204-4-lucas.demarchi@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH v2 3/7] drm/xe: Use symbol namespace for
 kunit tests
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


On 4/1/23 10:51, Lucas De Marchi wrote:
> Instead of simply using EXPORT_SYMBOL() to export the functions needed
> in xe.ko to be be called across modules, use EXPORT_SYMBOL_IF_KUNIT()
> which will export the symbol under the EXPORTED_FOR_KUNIT_TESTING
> namespace.
>
> This avoids accidentally "leaking" these functions and letting them be
> called from outside the kunit tests. If these functiosn are accidentally
> called from another module, they receive a modpost error like below:
>
> 	ERROR: modpost: module XXXXXXX uses symbol
> 	xe_ccs_migrate_kunit from namespace EXPORTED_FOR_KUNIT_TESTING,
> 	but does not import it.
>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

LGTM.
Reviewed-by:  Mauro Carvalho Chehab <mchehab@kernel.org>

> ---
>   drivers/gpu/drm/xe/tests/xe_bo.c           | 5 +++--
>   drivers/gpu/drm/xe/tests/xe_bo_test.c      | 1 +
>   drivers/gpu/drm/xe/tests/xe_dma_buf.c      | 3 ++-
>   drivers/gpu/drm/xe/tests/xe_dma_buf_test.c | 1 +
>   drivers/gpu/drm/xe/tests/xe_migrate.c      | 3 ++-
>   drivers/gpu/drm/xe/tests/xe_migrate_test.c | 1 +
>   6 files changed, 10 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/tests/xe_bo.c b/drivers/gpu/drm/xe/tests/xe_bo.c
> index aa433a7b59b7..9bd381e5b7a6 100644
> --- a/drivers/gpu/drm/xe/tests/xe_bo.c
> +++ b/drivers/gpu/drm/xe/tests/xe_bo.c
> @@ -4,6 +4,7 @@
>    */
>   
>   #include <kunit/test.h>
> +#include <kunit/visibility.h>
>   
>   #include "tests/xe_bo_test.h"
>   #include "tests/xe_pci_test.h"
> @@ -166,7 +167,7 @@ void xe_ccs_migrate_kunit(struct kunit *test)
>   {
>   	xe_call_for_each_device(ccs_test_run_device);
>   }
> -EXPORT_SYMBOL(xe_ccs_migrate_kunit);
> +EXPORT_SYMBOL_IF_KUNIT(xe_ccs_migrate_kunit);
>   
>   static int evict_test_run_gt(struct xe_device *xe, struct xe_gt *gt, struct kunit *test)
>   {
> @@ -304,4 +305,4 @@ void xe_bo_evict_kunit(struct kunit *test)
>   {
>   	xe_call_for_each_device(evict_test_run_device);
>   }
> -EXPORT_SYMBOL(xe_bo_evict_kunit);
> +EXPORT_SYMBOL_IF_KUNIT(xe_bo_evict_kunit);
> diff --git a/drivers/gpu/drm/xe/tests/xe_bo_test.c b/drivers/gpu/drm/xe/tests/xe_bo_test.c
> index 92dda4fca21b..1c868e3635bc 100644
> --- a/drivers/gpu/drm/xe/tests/xe_bo_test.c
> +++ b/drivers/gpu/drm/xe/tests/xe_bo_test.c
> @@ -22,3 +22,4 @@ kunit_test_suite(xe_bo_test_suite);
>   
>   MODULE_AUTHOR("Intel Corporation");
>   MODULE_LICENSE("GPL");
> +MODULE_IMPORT_NS(EXPORTED_FOR_KUNIT_TESTING);
> diff --git a/drivers/gpu/drm/xe/tests/xe_dma_buf.c b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
> index cf9dddf1a8d7..513a3b3362e9 100644
> --- a/drivers/gpu/drm/xe/tests/xe_dma_buf.c
> +++ b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
> @@ -4,6 +4,7 @@
>    */
>   
>   #include <kunit/test.h>
> +#include <kunit/visibility.h>
>   
>   #include "tests/xe_dma_buf_test.h"
>   #include "tests/xe_pci_test.h"
> @@ -259,4 +260,4 @@ void xe_dma_buf_kunit(struct kunit *test)
>   {
>   	xe_call_for_each_device(dma_buf_run_device);
>   }
> -EXPORT_SYMBOL(xe_dma_buf_kunit);
> +EXPORT_SYMBOL_IF_KUNIT(xe_dma_buf_kunit);
> diff --git a/drivers/gpu/drm/xe/tests/xe_dma_buf_test.c b/drivers/gpu/drm/xe/tests/xe_dma_buf_test.c
> index a1adfd1e1605..35312bfd5fb7 100644
> --- a/drivers/gpu/drm/xe/tests/xe_dma_buf_test.c
> +++ b/drivers/gpu/drm/xe/tests/xe_dma_buf_test.c
> @@ -21,3 +21,4 @@ kunit_test_suite(xe_dma_buf_test_suite);
>   
>   MODULE_AUTHOR("Intel Corporation");
>   MODULE_LICENSE("GPL");
> +MODULE_IMPORT_NS(EXPORTED_FOR_KUNIT_TESTING);
> diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
> index d410305c9b59..95985c9c9392 100644
> --- a/drivers/gpu/drm/xe/tests/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
> @@ -4,6 +4,7 @@
>    */
>   
>   #include <kunit/test.h>
> +#include <kunit/visibility.h>
>   
>   #include "tests/xe_migrate_test.h"
>   #include "tests/xe_pci_test.h"
> @@ -407,4 +408,4 @@ void xe_migrate_sanity_kunit(struct kunit *test)
>   {
>   	xe_call_for_each_device(migrate_test_run_device);
>   }
> -EXPORT_SYMBOL(xe_migrate_sanity_kunit);
> +EXPORT_SYMBOL_IF_KUNIT(xe_migrate_sanity_kunit);
> diff --git a/drivers/gpu/drm/xe/tests/xe_migrate_test.c b/drivers/gpu/drm/xe/tests/xe_migrate_test.c
> index d6be360c3b6d..39179eae890b 100644
> --- a/drivers/gpu/drm/xe/tests/xe_migrate_test.c
> +++ b/drivers/gpu/drm/xe/tests/xe_migrate_test.c
> @@ -21,3 +21,4 @@ kunit_test_suite(xe_migrate_test_suite);
>   
>   MODULE_AUTHOR("Intel Corporation");
>   MODULE_LICENSE("GPL");
> +MODULE_IMPORT_NS(EXPORTED_FOR_KUNIT_TESTING);
