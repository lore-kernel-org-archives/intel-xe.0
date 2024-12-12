Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBDE8E7717F
	for <intel-xe@archiver.kernel.org>; Thu, 12 Dec 2024 18:45:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A683410EE81;
	Thu, 12 Dec 2024 18:45:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T8ve1rvG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACCEA10E64F
 for <Intel-Xe@lists.freedesktop.org>; Thu, 12 Dec 2024 18:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734029136; x=1765565136;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=8ClraKhHyKicgqLboYMOIDsLuF5xY8uXHcR0BFVOn+8=;
 b=T8ve1rvGfBN3Xga9seiWy/FOtPXnHC/zUU6GIgabhR+LEzKo9pLVSPs3
 nYp/IPNg3HsYYaLhLSxiVoKR7QPOfIZOTqmPILt8fwUXaajRHenCTOvpA
 qn18Y85GZOAp4Z/zxD6TMahnNAQnyBbVrysVLCRV9t/D1xsm7WiKHd8be
 Vj2c3/grn4Wgb0htDGV65UgvR9pmRSZPB7KXXmnNBMeUcWe/51fY2FUmg
 XZuj0BInN0rPBluK0MROfOsuCLo/CtYk9hUaIRWYpO7IYbmlstvQNQpzE
 eCq8b00dARoE60nzwbK/Gj74/IWzhIB2LYi3JpYWIy7sleSHALdQxhJ6U Q==;
X-CSE-ConnectionGUID: TFvaaQVBTOWJre821NcI9g==
X-CSE-MsgGUID: 3OUhA1NtRMycpWxgGtcUBA==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="44936591"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="44936591"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2024 10:45:36 -0800
X-CSE-ConnectionGUID: 2uhSZ818SAGrxqq10ffhVg==
X-CSE-MsgGUID: hWPySo6XSwmIacs0vX+38g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="133688725"
Received: from ldmartin-desk2.corp.intel.com (HELO ldmartin-desk2)
 ([10.125.110.80])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2024 10:45:36 -0800
Date: Thu, 12 Dec 2024 12:45:30 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Souza, Jose" <jose.souza@intel.com>
Cc: "Intel-Xe@Lists.FreeDesktop.Org" <Intel-Xe@lists.freedesktop.org>, 
 "Harrison, John C" <john.c.harrison@intel.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>, 
 "Filipchuk, Julia" <julia.filipchuk@intel.com>
Subject: Re: [PATCH v9 04/11] drm/xe/devcoredump: Add ASCII85 dump helper
 function
Message-ID: <7qhmppwrqj5fsr3tkvufwua3iw7noadrefajrii66x7yydfeba@lqhgd7b5decp>
References: <20241003004611.2323493-1-John.C.Harrison@Intel.com>
 <20241003004611.2323493-5-John.C.Harrison@Intel.com>
 <ccc1066ab139e800cd8f67535c97aca486bf105d.camel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ccc1066ab139e800cd8f67535c97aca486bf105d.camel@intel.com>
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

On Thu, Dec 12, 2024 at 05:41:41PM +0000, Jose Souza wrote:
>On Wed, 2024-10-02 at 17:46 -0700, John.C.Harrison@Intel.com wrote:
>> From: John Harrison <John.C.Harrison@Intel.com>
>>
>> There is a need to include the GuC log and other large binary objects
>> in core dumps and via dmesg. So add a helper for dumping to a printer
>> function via conversion to ASCII85 encoding.
>>
>> Another issue with dumping such a large buffer is that it can be slow,
>> especially if dumping to dmesg over a serial port. So add a yield to
>> prevent the 'task has been stuck for 120s' kernel hang check feature
>> from firing.
>>
>> v2: Add a prefix to the output string. Fix memory allocation bug.
>> v3: Correct a string size calculation and clean up a define (review
>> feedback from Julia F).
>>
>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>> Reviewed-by: Julia Filipchuk <julia.filipchuk@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_devcoredump.c | 87 +++++++++++++++++++++++++++++
>>  drivers/gpu/drm/xe/xe_devcoredump.h |  6 ++
>>  2 files changed, 93 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
>> index 2690f1d1cde4..0884c49942fe 100644
>> --- a/drivers/gpu/drm/xe/xe_devcoredump.c
>> +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
>> @@ -6,6 +6,7 @@
>>  #include "xe_devcoredump.h"
>>  #include "xe_devcoredump_types.h"
>>
>> +#include <linux/ascii85.h>
>>  #include <linux/devcoredump.h>
>>  #include <generated/utsrelease.h>
>>
>> @@ -315,3 +316,89 @@ int xe_devcoredump_init(struct xe_device *xe)
>>  }
>>
>>  #endif
>> +
>> +/**
>> + * xe_print_blob_ascii85 - print a BLOB to some useful location in ASCII85
>> + *
>> + * The output is split to multiple lines because some print targets, e.g. dmesg
>> + * cannot handle arbitrarily long lines. Note also that printing to dmesg in
>> + * piece-meal fashion is not possible, each separate call to drm_puts() has a
>> + * line-feed automatically added! Therefore, the entire output line must be
>> + * constructed in a local buffer first, then printed in one atomic output call.
>> + *
>> + * There is also a scheduler yield call to prevent the 'task has been stuck for
>> + * 120s' kernel hang check feature from firing when printing to a slow target
>> + * such as dmesg over a serial port.
>> + *
>> + * TODO: Add compression prior to the ASCII85 encoding to shrink huge buffers down.
>> + *
>> + * @p: the printer object to output to
>> + * @prefix: optional prefix to add to output string
>> + * @blob: the Binary Large OBject to dump out
>> + * @offset: offset in bytes to skip from the front of the BLOB, must be a multiple of sizeof(u32)
>> + * @size: the size in bytes of the BLOB, must be a multiple of sizeof(u32)
>> + */
>> +void xe_print_blob_ascii85(struct drm_printer *p, const char *prefix,
>> +			   const void *blob, size_t offset, size_t size)
>> +{
>> +	const u32 *blob32 = (const u32 *)blob;
>> +	char buff[ASCII85_BUFSZ], *line_buff;
>> +	size_t line_pos = 0;
>> +
>> +#define DMESG_MAX_LINE_LEN	800
>> +#define MIN_SPACE		(ASCII85_BUFSZ + 2)		/* 85 + "\n\0" */
>> +
>> +	if (size & 3)
>> +		drm_printf(p, "Size not word aligned: %zu", size);
>> +	if (offset & 3)
>> +		drm_printf(p, "Offset not word aligned: %zu", size);
>> +
>> +	line_buff = kzalloc(DMESG_MAX_LINE_LEN, GFP_KERNEL);
>> +	if (IS_ERR_OR_NULL(line_buff)) {
>> +		drm_printf(p, "Failed to allocate line buffer: %pe", line_buff);
>> +		return;
>> +	}
>> +
>> +	blob32 += offset / sizeof(*blob32);
>> +	size /= sizeof(*blob32);
>> +
>> +	if (prefix) {
>> +		strscpy(line_buff, prefix, DMESG_MAX_LINE_LEN - MIN_SPACE - 2);
>> +		line_pos = strlen(line_buff);
>> +
>> +		line_buff[line_pos++] = ':';
>> +		line_buff[line_pos++] = ' ';
>> +	}
>> +
>> +	while (size--) {
>> +		u32 val = *(blob32++);
>> +
>> +		strscpy(line_buff + line_pos, ascii85_encode(val, buff),
>> +			DMESG_MAX_LINE_LEN - line_pos);
>> +		line_pos += strlen(line_buff + line_pos);
>> +
>> +		if ((line_pos + MIN_SPACE) >= DMESG_MAX_LINE_LEN) {
>> +			line_buff[line_pos++] = '\n';
>> +			line_buff[line_pos++] = 0;
>
>This breaks ascii85 parser that we had up to now.
>And I think there is not safe way to parse it now, how would the parser know that the blob reach to end?

Just looked at this code to check if we also had a "Size" as I remember
seeing it in previous related patches, but we don't. If
we did then you could use that to calculate how much you still had to
read, ignoring the \n. With the current scheme I think one
way would be to continue the previous key when the line doesn't start
with a new key. Awful, yes, and not future proof.

John, I explicitly said *we can't break the existent users*,
pointed to the one in the mesa repo and confirmed with José it would be
indeed a breakage. Please check again the past email thread at
https://lore.kernel.org/all/3jexgpnh3br3gqi4ol4c3hx3tyhwevq5nqo5xssyie3xglqohz@e7mnj4dewupu/

Did you at least prepare the mesa parser for that additional \n?

We shouldn't have merged the kernel patch as is with the excuse it reads
better in dmesg, when we also said we should not print that garbage to
dmesg :(

Lucas De Marchi
