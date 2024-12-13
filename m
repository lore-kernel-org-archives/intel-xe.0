Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C09FE7717F
	for <intel-xe@archiver.kernel.org>; Fri, 13 Dec 2024 17:20:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B73810E26D;
	Fri, 13 Dec 2024 17:20:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fm0gmbMW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E21C910E26D
 for <Intel-Xe@lists.freedesktop.org>; Fri, 13 Dec 2024 17:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734110419; x=1765646419;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=V+s9ZONyXlMYopRSnedro5FNTHGXX4WKvi1Thd4mEpI=;
 b=fm0gmbMWt4tHnWANEJD0SUs0PjELrvwpy2gNx30ulnlR6AmxtE2WPPGj
 UGQrw2B1mj3SfNvnAWJf0ljitbn2HUtFPJmqaekXD9g+nMqJAC3Tee08U
 yoWhLb7ZEF5HWMK8HeXOfIXjX+Y//EXC5L/fgyDyoXsru21eaHonocFPP
 NcAVJxRQWqah3A4dYzlV9zqNAJTbNBR4rqTEvo1pmOsUTgRoazoiYvoy2
 LNxg7tcwJUETYmVcckt4c6QkT4+i4kpmC0Pq+351j8ot2Z/7TZIii4h0n
 CH8UQqY9DGF5d0bCTgx1K7/usLx9l+kKOFW6xoLv99831Y0kHGyllySsw g==;
X-CSE-ConnectionGUID: FsRkpHFsTV+BsDQ3jQX/EQ==
X-CSE-MsgGUID: TEXquKTaT4GEwLK3aDxbJg==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="45577325"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="45577325"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2024 09:20:19 -0800
X-CSE-ConnectionGUID: w4CUanvxSw26xEn1Clu4dQ==
X-CSE-MsgGUID: O2L5M02ySWGz61mWbqXtFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="101561956"
Received: from ldmartin-desk2.corp.intel.com (HELO ldmartin-desk2)
 ([10.125.110.218])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2024 09:20:18 -0800
Date: Fri, 13 Dec 2024 11:20:09 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: John Harrison <john.c.harrison@intel.com>
Cc: "Souza, Jose" <jose.souza@intel.com>, 
 "Intel-Xe@Lists.FreeDesktop.Org" <Intel-Xe@lists.freedesktop.org>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>, 
 "Filipchuk, Julia" <julia.filipchuk@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH v9 04/11] drm/xe/devcoredump: Add ASCII85 dump helper
 function
Message-ID: <wsg6l3h3ofwmok724jqqoilseve4lj5if7nucuvz62neitlfg2@atylma4bdedv>
References: <20241003004611.2323493-1-John.C.Harrison@Intel.com>
 <20241003004611.2323493-5-John.C.Harrison@Intel.com>
 <ccc1066ab139e800cd8f67535c97aca486bf105d.camel@intel.com>
 <7qhmppwrqj5fsr3tkvufwua3iw7noadrefajrii66x7yydfeba@lqhgd7b5decp>
 <208f50d9-58e8-413e-915f-95ca077e0fa0@intel.com>
 <dahmzb4tveblm74nwhq5mabz672xivpfeuvkpzb6hnjfs4qrwt@rl6c56v6mfyy>
 <db943f8a-0d92-49bc-827e-46284739e8be@intel.com>
 <zy2x47cknwhzycszh7otjn5t65pvsotwwftcbleq44cmzbibaw@5gsx7zp7t2sm>
 <421289df-ed8e-41a3-8f66-959d42e3b9b4@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <421289df-ed8e-41a3-8f66-959d42e3b9b4@intel.com>
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

On Fri, Dec 13, 2024 at 08:36:43AM -0800, John Harrison wrote:
>On 12/12/2024 16:32, Lucas De Marchi wrote:
>>On Thu, Dec 12, 2024 at 01:04:23PM -0800, John Harrison wrote:
>>>On 12/12/2024 12:52, Lucas De Marchi wrote:
>>>>On Thu, Dec 12, 2024 at 11:14:23AM -0800, John Harrison wrote:
>>>>>On 12/12/2024 10:45, Lucas De Marchi wrote:
>>>>>>On Thu, Dec 12, 2024 at 05:41:41PM +0000, Jose Souza wrote:
>>>>>>>On Wed, 2024-10-02 at 17:46 -0700, John.C.Harrison@Intel.com wrote:
>>>>>>>>From: John Harrison <John.C.Harrison@Intel.com>
>>>>>>>>
>>>>>>>>There is a need to include the GuC log and other large 
>>>>>>>>binary objects
>>>>>>>>in core dumps and via dmesg. So add a helper for dumping 
>>>>>>>>to a printer
>>>>>>>>function via conversion to ASCII85 encoding.
>>>>>>>>
>>>>>>>>Another issue with dumping such a large buffer is that 
>>>>>>>>it can be slow,
>>>>>>>>especially if dumping to dmesg over a serial port. So 
>>>>>>>>add a yield to
>>>>>>>>prevent the 'task has been stuck for 120s' kernel hang 
>>>>>>>>check feature
>>>>>>>>from firing.
>>>>>>>>
>>>>>>>>v2: Add a prefix to the output string. Fix memory allocation bug.
>>>>>>>>v3: Correct a string size calculation and clean up a define (review
>>>>>>>>feedback from Julia F).
>>>>>>>>
>>>>>>>>Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>>>>>>>>Reviewed-by: Julia Filipchuk <julia.filipchuk@intel.com>
>>>>>>>>---
>>>>>>>> drivers/gpu/drm/xe/xe_devcoredump.c | 87 
>>>>>>>>+++++++++++++++++++++++++++++
>>>>>>>> drivers/gpu/drm/xe/xe_devcoredump.h |  6 ++
>>>>>>>> 2 files changed, 93 insertions(+)
>>>>>>>>
>>>>>>>>diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c 
>>>>>>>>b/drivers/gpu/drm/xe/xe_devcoredump.c
>>>>>>>>index 2690f1d1cde4..0884c49942fe 100644
>>>>>>>>--- a/drivers/gpu/drm/xe/xe_devcoredump.c
>>>>>>>>+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
>>>>>>>>@@ -6,6 +6,7 @@
>>>>>>>> #include "xe_devcoredump.h"
>>>>>>>> #include "xe_devcoredump_types.h"
>>>>>>>>
>>>>>>>>+#include <linux/ascii85.h>
>>>>>>>> #include <linux/devcoredump.h>
>>>>>>>> #include <generated/utsrelease.h>
>>>>>>>>
>>>>>>>>@@ -315,3 +316,89 @@ int xe_devcoredump_init(struct xe_device *xe)
>>>>>>>> }
>>>>>>>>
>>>>>>>> #endif
>>>>>>>>+
>>>>>>>>+/**
>>>>>>>>+ * xe_print_blob_ascii85 - print a BLOB to some useful 
>>>>>>>>location in ASCII85
>>>>>>>>+ *
>>>>>>>>+ * The output is split to multiple lines because some 
>>>>>>>>print targets, e.g. dmesg
>>>>>>>>+ * cannot handle arbitrarily long lines. Note also that 
>>>>>>>>printing to dmesg in
>>>>>>>>+ * piece-meal fashion is not possible, each separate 
>>>>>>>>call to drm_puts() has a
>>>>>>>>+ * line-feed automatically added! Therefore, the entire 
>>>>>>>>output line must be
>>>>>>>>+ * constructed in a local buffer first, then printed in 
>>>>>>>>one atomic output call.
>>>>>>>>+ *
>>>>>>>>+ * There is also a scheduler yield call to prevent the 
>>>>>>>>'task has been stuck for
>>>>>>>>+ * 120s' kernel hang check feature from firing when 
>>>>>>>>printing to a slow target
>>>>>>>>+ * such as dmesg over a serial port.
>>>>>>>>+ *
>>>>>>>>+ * TODO: Add compression prior to the ASCII85 encoding 
>>>>>>>>to shrink huge buffers down.
>>>>>>>>+ *
>>>>>>>>+ * @p: the printer object to output to
>>>>>>>>+ * @prefix: optional prefix to add to output string
>>>>>>>>+ * @blob: the Binary Large OBject to dump out
>>>>>>>>+ * @offset: offset in bytes to skip from the front of 
>>>>>>>>the BLOB, must be a multiple of sizeof(u32)
>>>>>>>>+ * @size: the size in bytes of the BLOB, must be a 
>>>>>>>>multiple of sizeof(u32)
>>>>>>>>+ */
>>>>>>>>+void xe_print_blob_ascii85(struct drm_printer *p, const 
>>>>>>>>char *prefix,
>>>>>>>>+               const void *blob, size_t offset, size_t size)
>>>>>>>>+{
>>>>>>>>+    const u32 *blob32 = (const u32 *)blob;
>>>>>>>>+    char buff[ASCII85_BUFSZ], *line_buff;
>>>>>>>>+    size_t line_pos = 0;
>>>>>>>>+
>>>>>>>>+#define DMESG_MAX_LINE_LEN    800
>>>>>>>>+#define MIN_SPACE        (ASCII85_BUFSZ + 2) /* 85 + "\n\0" */
>>>>>>>>+
>>>>>>>>+    if (size & 3)
>>>>>>>>+        drm_printf(p, "Size not word aligned: %zu", size);
>>>>>>>>+    if (offset & 3)
>>>>>>>>+        drm_printf(p, "Offset not word aligned: %zu", size);
>>>>>>>>+
>>>>>>>>+    line_buff = kzalloc(DMESG_MAX_LINE_LEN, GFP_KERNEL);
>>>>>>>>+    if (IS_ERR_OR_NULL(line_buff)) {
>>>>>>>>+        drm_printf(p, "Failed to allocate line buffer: 
>>>>>>>>%pe", line_buff);
>>>>>>>>+        return;
>>>>>>>>+    }
>>>>>>>>+
>>>>>>>>+    blob32 += offset / sizeof(*blob32);
>>>>>>>>+    size /= sizeof(*blob32);
>>>>>>>>+
>>>>>>>>+    if (prefix) {
>>>>>>>>+        strscpy(line_buff, prefix, DMESG_MAX_LINE_LEN - 
>>>>>>>>MIN_SPACE - 2);
>>>>>>>>+        line_pos = strlen(line_buff);
>>>>>>>>+
>>>>>>>>+        line_buff[line_pos++] = ':';
>>>>>>>>+        line_buff[line_pos++] = ' ';
>>>>>>>>+    }
>>>>>>>>+
>>>>>>>>+    while (size--) {
>>>>>>>>+        u32 val = *(blob32++);
>>>>>>>>+
>>>>>>>>+        strscpy(line_buff + line_pos, ascii85_encode(val, buff),
>>>>>>>>+            DMESG_MAX_LINE_LEN - line_pos);
>>>>>>>>+        line_pos += strlen(line_buff + line_pos);
>>>>>>>>+
>>>>>>>>+        if ((line_pos + MIN_SPACE) >= DMESG_MAX_LINE_LEN) {
>>>>>>>>+            line_buff[line_pos++] = '\n';
>>>>>>>>+            line_buff[line_pos++] = 0;
>>>>>>>
>>>>>>>This breaks ascii85 parser that we had up to now.
>>>>>It should not break the decoding of existing sections. This 
>>>>>helper is only being used for the new GuC objects at present. 
>>>>>As per the TODO, the intent is to use it for all blobs in the 
>>>>>future. But that was deliberately left to a future update 
>>>>>(which hasn't been posted yet) to avoid breaking the mesa 
>>>>>tool.
>>>>
>>>>it broke nonetheless because then it fails to decode this line the way
>>>>it was doing:  each line starts a new key.
>>>It barfs on any line it doesn't understand? Seems like it could be 
>>>made to be more robust in general.
>>
>>I don't know, you're welcome to look at the source and understand how
>>it may possibly break when you are doing a change like that. Even better
>>if you can make it robust so it doesn't break. I'm sure you know where
>>the mesa repo is. I was just looking at what I wrote in the email thread
>>I pointed out when reviewing this. I was surprised it got applied as is,
>>knowing it would break (because I had pointed it out) even with 2
>>maintainers saying we shouldn't break the mesa tool in question...
>To be clear, no-one *knew* anything would break. The vast majority of 
>that email thread was about whether we should include any ASCII85 data 
>in the devcoredump at all (which is something we had already been 
>doing for a long time). What you actually wrote was:
>
>+José, would it be ok from the userspace POV to start adding the \n?
>Then we can at least have all fields in our devcoredump to follow the
>same format. Are these the decoder parts on the mesa side?
>
>
>Which to me reads as a question about whether we can update the 
>existing ASCII85 sections to use the new helper function. It was not a 
>question about whether adding a totally new field (using the new 
>helper function) would cause a break. And given that there was no 
>response after several weeks, it was reasonable to assume that it was 
>not considered a problem.

no response? you even replied to them. In the very next paragraph of
what you quoted I had already stated that by looking at the mesa parser
it didn't seem safe. José replied to my email confirming it would break
the mesa parser. Rodrigo replied to that saying we shouldn't merge if it
breaks the mesa parser.

what is this part of your reply that is not "ignore that it will break
because I think I can break"?

	> > It will break the parser and I don't think we are allowed to break it at this point.
	> The intent has always been to add compression as we had in i915. That will
	> presumably also break the parser. Although I'm not seeing how a debug log
	> parser counts as critical user space that must not ever be broken.

>
>And there was never any discussion about whether adding extra section 
>headings would cause a problem. That was never even considered to be 
>'unsafe'.

yes, the issue about moving that keyval to another section was not
considered.

Lucas De Marchi

>
>John.
>
>>
>>particuarly it being just to please something that shouldn't exist (a
>>garbage dump to dmesg).
>>
>>And before you argue about format version and potential breakages if an
>>hypothetical parser is doing obscure things... this is different than
>>real breakage: we know there's a parser and we ignored it saying we
>>don't care. That is not acceptable.
>>
>>>
>>>>
>>>>>
>>>>>
>>>>>>>And I think there is not safe way to parse it now, how 
>>>>>>>would the parser know that the blob reach to end?
>>>>>The GuC decoder tool simply ignores leading/trailing 
>>>>>whitespace and keeps decoding until it finds a line with a new 
>>>>>field - i.e. anything with a non-ASCII85 character such as ':' 
>>>>>or '*'. It is totally
>>>>
>>>>character set for ascii85 is [33, 117] and 122, which includes both ':'
>>>>and '*'. Hopefully it's hard to hit a collision, but we 
>>>>shouldn't design
>>>>it in a way that is possible.
>>>Sorry, getting myself confused - it was a while ago when I was 
>>>writing this. Yes, punctuation marks are part of the ASCII85 
>>>character set.
>>>
>>>The GuC decoder looks for white space - a blank line or a line 
>>>with a space in it. Any new field is guaranteed to be "name: data" 
>>>so will have a space. And sections are delimited with blank lines, 
>>>plus section headers are "**** name ****" so also guaranteed to 
>>>have a space.
>>
>>space is good because it's outside the character set, so an
>>if/else chain with `if (strstartswith("RandomKey: "))` could
>>disambiguate it. But maybe it'd be better to have a space at the end of
>>the line so a parser knows when the next line should be a continuation,
>>just like with use "\" in some places. That is better then trying all
>>keys before deciding "never mind, concat with what I was reading before".
>>That may break your guc log parser, but it's probably less drastic than
>>just reverting this whole thing.
>>
>>Lucas De Marchi
>>
>>>
>>>John.
>>>
>>>
>>>>
>>>>
>>>>>reliable for me.
>>>>>
>>>>>>
>>>>>>Just looked at this code to check if we also had a "Size" as 
>>>>>>I remember
>>>>>>seeing it in previous related patches, but we don't. If
>>>>>>we did then you could use that to calculate how much you still had to
>>>>>>read, ignoring the \n. With the current scheme I think one
>>>>>>way would be to continue the previous key when the line doesn't start
>>>>>>with a new key. Awful, yes, and not future proof.
>>>>>Any new field is guaranteed to have a colon in it and any new 
>>>>>section header is guaranteed to have a star in it. Sounds 
>>>>>pretty reliable to me.
>>>>
>>>>that's what I said by "continue the previous key when the line doesn't
>>>>start with a new one".
>>>>
>>>>
>>>>>
>>>>>The other option would be to have an explicit prefix at the 
>>>>>start of each continuation line. E.g. "A85:".
>>>>
>>>>let's not make it worse than it already is. And not future proof by
>>>>given the encoding algorithm the meaning of "continuation line".
>>>>
>>>>Lucas De Marchi
>>>>
>>>>>
>>>>>The problem with a size field is that ASCII85 encoding is data 
>>>>>dependent - it has extremely basic run length encoding of 
>>>>>strings of zeros. So you only know the size after the encoding 
>>>>>is complete. Which means either the size field is in the dump 
>>>>>after the encoded data (which is therefore useless) or you 
>>>>>can't stream the encode and must encode to an in-memory buffer 
>>>>>first, then print the size, then print your pre-encoded data.
>>>>>
>>>>>
>>>>>>
>>>>>>John, I explicitly said *we can't break the existent users*,
>>>>>>pointed to the one in the mesa repo and confirmed with José 
>>>>>>it would be
>>>>>>indeed a breakage. Please check again the past email thread at
>>>>>>https://lore.kernel.org/all/3jexgpnh3br3gqi4ol4c3hx3tyhwevq5nqo5xssyie3xglqohz@e7mnj4dewupu/
>>>>>>
>>>>>>
>>>>>>
>>>>>That discussion was a question for Jose not a statement. As 
>>>>>there was no response for several weeks, I assumed that it 
>>>>>wasn't a problem after all.
>>>>>
>>>>>>
>>>>>>Did you at least prepare the mesa parser for that additional \n?
>>>>>>
>>>>>>We shouldn't have merged the kernel patch as is with the 
>>>>>>excuse it reads
>>>>>>better in dmesg, when we also said we should not print that 
>>>>>>garbage to
>>>>>>dmesg :(
>>>>>Not following. Should not print what garbage in dmesg? As I 
>>>>>keep saying, none of this goes to dmesg by default except in 
>>>>>the case of catastrophic CT failure. And in that case, it is 
>>>>>extremely useful and the only way to debug issues.
>>>>>
>>>>>John.
>>>>>
>>>>>>
>>>>>>Lucas De Marchi
>>>>>
>>>
