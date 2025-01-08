Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03C6DE77188
	for <intel-xe@archiver.kernel.org>; Wed,  8 Jan 2025 22:11:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76DF510E43E;
	Wed,  8 Jan 2025 22:11:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fv/Dc0Nt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E0A710E43E
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Jan 2025 22:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736374312; x=1767910312;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=mlpB9jdFWipju3tPl+LIrfogeEppJD2GM7aaya9HMpE=;
 b=fv/Dc0NtuxW/XlD+7FSnK7F2T+9uO7t96Jh2B3pItRK69VHEAGT+0Hof
 cAK+n9DBC/esE8Tgl2V2WREC7e26NhICx1QfgYFIldWT6JXp5Cfr/w8dN
 Jj+BtFLkoq3lYo3XDZ0fLUYFM+s5Om0VwhNlk1kTOdvSx+IYYwznNQUpG
 2KN2l/mLVMob5upddqaTOGPUUE0soB8bKUl5hpQC1PCj9ZljKnngqThT0
 gbyvr+7sX4fpUNaEGEZ1XmmZlqCOFn/6YfNQARPdKTwnlZ7L9HEBDxWyf
 OPi/T2N5WZyfc+Hb8VZgQ8j8cBb0mEP7G4FJuQ+qOVor43kipK5XE4doy w==;
X-CSE-ConnectionGUID: lwb8VfxmQmykJR6PbBs0ng==
X-CSE-MsgGUID: XUwjZBpTS7WaX4tDh7PdNQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="47117112"
X-IronPort-AV: E=Sophos;i="6.12,299,1728975600"; d="scan'208";a="47117112"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2025 14:11:51 -0800
X-CSE-ConnectionGUID: RM5POTS4RnSc49fN8pD2+w==
X-CSE-MsgGUID: DxX4AK1WTDOMg6Xl70Y/tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="108335359"
Received: from ldmartin-desk2.corp.intel.com (HELO ldmartin-desk2)
 ([10.125.111.59])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2025 14:11:51 -0800
Date: Wed, 8 Jan 2025 16:11:45 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: John Harrison <john.c.harrison@intel.com>
Cc: Julia Filipchuk <julia.filipchuk@intel.com>, 
 intel-xe@lists.freedesktop.org,
 =?utf-8?B?Sm9zw6k=?= Roberto de Souza <jose.souza@intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v3 1/1] drm/xe/guc: Fix GuC log/ct output via debugfs
Message-ID: <qj6jh2z7qncr73nesmsdjaa46rxnm34tf4slp6y4ctv4w2dzv2@lttsv323fanu>
References: <20250107202252.2642853-1-julia.filipchuk@intel.com>
 <3god5fzcfbzxwlssqdb6eenzedqkykv2scpktlk5uglgf2ro73@bjuq2knwuweh>
 <ef3c1576-74bf-4fbf-be8b-9ff8d24cc24f@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ef3c1576-74bf-4fbf-be8b-9ff8d24cc24f@intel.com>
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

+Jose
+Rodrigo

On Wed, Jan 08, 2025 at 12:14:49PM -0800, John Harrison wrote:
>On 1/7/2025 13:10, Lucas De Marchi wrote:
>>On Tue, Jan 07, 2025 at 12:22:52PM -0800, Julia Filipchuk wrote:
>>>Change to disable asci85 GuC logging only when output to devcoredump
>>>(was temporarily disabled for all code paths).
>>>
>>>v2: Ignore only for devcoredump case (not dmesg output).
>>>v3: Rebase to resolve parent tag mismatch.
>>>
>>>Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>
>>>---
>>>drivers/gpu/drm/xe/xe_devcoredump.c | 8 +++++---
>>>include/drm/drm_print.h             | 2 ++
>>>2 files changed, 7 insertions(+), 3 deletions(-)
>>>
>>>diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c 
>>>b/drivers/gpu/drm/xe/xe_devcoredump.c
>>>index 6980304c8903..8e5d1f9866a7 100644
>>>--- a/drivers/gpu/drm/xe/xe_devcoredump.c
>>>+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
>>>@@ -424,10 +424,12 @@ void xe_print_blob_ascii85(struct 
>>>drm_printer *p, const char *prefix,
>>>     * Splitting blobs across multiple lines is not compatible 
>>>with the mesa
>>>     * debug decoder tool. Note that even dropping the explicit 
>>>'\n' below
>>>     * doesn't help because the GuC log is so big some underlying 
>>>implementation
>>>-     * still splits the lines at 512K characters. So just bail 
>>>completely for
>>>-     * the moment.
>>>+     * still splits the lines at 512K characters.
>>
>>did we investigate where this is done and how we can overcome it? I
>Yes. And the comment could be updated as part of this patch to make it 
>clearer...
>
>
>     * Splitting blobs across multiple lines is not compatible with 
>the mesa
>     * debug decoder tool. Note that even dropping the explicit line 
>wrapping
>     * below doesn't help because the GuC log can be so big it needs 
>to be split
>     * into multiple 2MB chunks, each of which must be printed 
>individually and
>     * therefore will be a separate line.

so there's no "underlying implemenation that splits like at 512K chars"?
Nowe it's something else: a 2MB chunk because of what?

I don't really want to keep updating this instead of fixing it.

>
>The dump helper could be updated to never add any line feeds, not even 

when you say "dump helper", what exactly are you talking about?
xe_print_blob_ascii85(), __xe_devcoredump_read(), __drm_puts_coredump()
or what?

If it's about xe_print_blob_ascii85(), I think this would be the first step:
drop the \n you are adding. AFAICS calling the print function in chunks
of 800B would be fine, just don't add any \n. If that still adds \n
somewhere, we can check how to drop it or you then may have a pretty
solid argument to adapt the mesa tool with a newline
continuar char and send them the MR.  

>at the end. And then the burden would be on the callers to add line 
>feeds as appropriate. That seems extremely messy, though. And it will 
>break the dmesg output facility. That does need the line wrapping at 
>~800 characters which can't be done from outside the helper.
>
>>
>>understand having to split it into multiple calls, but not something
>>adding a \n. particularly for the functions dealing with seq_file and
>>devcoredump.
>>
>>>+     *
>>>+     * Only disable from devcoredump output.
>>>     */
>>>-    return;
>>>+    if (p->coredump)
>>
>>but we do want the guc log to be inside the devcoredump, so rather than
>>adding more workarounds, can we fix it ?
>The simplest fix is your suggestion of adding an extra white space 
>character at the end of the line in the helper function and updating 
>the mesa tool to support multi-line output. That seems like it should 
>be a trivial update to the mesa tool and it keeps the KMD side simple 
>and consistent across all potential output methods. But Jose seemed 
>absolutely dead set against any updates to the mesa tool at all :(.
>
>The more complex fix is Joonas' idea of using an official structured 
>output format of some sort - TOML, YAML, JSON or whatever. Something 

it actually doesn't fix this particular issue. It fixes others, but not
this one.

	"Guc Log": "<encoded data .........."

if you need to split lines, you still need something to do do it in
whatever format you choose. One json I remember working on in the past
that embeds the binary is the .apj format... example:
https://firmware.ardupilot.org/Copter/2024-12/2024-12-02-13:12/CubeBlack/arducopter.apj

	{
	    "board_id": 9,
	    "magic": "APJFWv1",
	    "description": "Firmware for a STM32F427xx board",
	    "image": "eNqUvAlcU1faMH5u7k1yCQGCICCgBoIaRW0EtVSxhg ...

here "image" is base64-encoded  afair. But in your case, just printing
the json to dmesg wouldn't work because of needing to split the line.
It wouldn't fix the kind of bugs we had in the past too:  in json it
would be the equivalent of adding a field to the wrong object and then
move it elsewhere. An application trying to read that object in the
previous place would be broken regardless.

toml is more for configuration and yaml isn't a good one for this case
as it further relies on indentation. I wouldn't oppose to use json, but
don't expect to have dmesg to magically work because of that.

So let's fix the issue at hand and let the talk about xe's coredump
format for a later time.

>that ideally supports binary data and compression natively and has a 
>helper library that can be included in the kernel source tree. That 

oh no, we'd need to define the schema - there are plenty of json libraries
in multiple languages for users to choose from  and that would be basically
then main benefit of using it.

Lucas De Marchi

>will then remove any and all confusion over interpretation of the file 
>forever more. But it would require updating all userland tools to use 
>the appropriate helper library.
>
>John.
>
>>
>>Lucas De Marchi
>
