Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2A99E77197
	for <intel-xe@archiver.kernel.org>; Thu,  9 Jan 2025 15:39:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42F0010EE77;
	Thu,  9 Jan 2025 15:39:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cdBxaQkm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FA2510EE97
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Jan 2025 15:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736437183; x=1767973183;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=5iVJkpvgAAPeU1qgp98e0TnxSGieNbbdn+Vpye/dsbc=;
 b=cdBxaQkmRTcPM8FNAFNYFrd1gUg1aTUVApQCTKLzRbY3pN6HZWDZCZm8
 0/MW6YSGPxM1KS1Bd1Pi70ZCM85JmDi4xM0Z5k9TN0+st3NRVJWXSwLdm
 KwzwufCrUHpDh5ercN3AgYrZ7UujDMyO2ST3sXqmboHq0Q9Ii1foBXRvW
 v04MvNiLTUEF4KgrzAfO5X4wcd3Qg3fx6ILKdBL7xI6/demLbVSN4srrt
 kJnFjyrw6PvtCoxXcJuh2p8lZjCSyJLgnqkee72uTQsuePXVnqyd3UBZI
 l9VJ27aPvG8ld754Ih2tmTidvEWEHHewqQOx2BgzlM/CIJeFdfNb9Atah w==;
X-CSE-ConnectionGUID: GmAirNp8TKCgLTcs88j7Lg==
X-CSE-MsgGUID: yqJBXfWbQr2WNtVrqi1gmg==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="47202103"
X-IronPort-AV: E=Sophos;i="6.12,301,1728975600"; d="scan'208";a="47202103"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2025 07:39:42 -0800
X-CSE-ConnectionGUID: /gz5Wv+DRmC+N+GFtUBIMg==
X-CSE-MsgGUID: PeD4qpEmQcuF6ExaUtUw+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="126728297"
Received: from ldmartin-desk2.corp.intel.com (HELO ldmartin-desk2)
 ([10.125.111.77])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2025 07:39:40 -0800
Date: Thu, 9 Jan 2025 09:39:35 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: John Harrison <john.c.harrison@intel.com>
Cc: Julia Filipchuk <julia.filipchuk@intel.com>, 
 intel-xe@lists.freedesktop.org,
 =?utf-8?B?Sm9zw6k=?= Roberto de Souza <jose.souza@intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v3 1/1] drm/xe/guc: Fix GuC log/ct output via debugfs
Message-ID: <zkjzktceuth45bignihe2vy5j3durxymlur5ama4npxjtraetp@2cta2iw2pq7r>
References: <20250107202252.2642853-1-julia.filipchuk@intel.com>
 <3god5fzcfbzxwlssqdb6eenzedqkykv2scpktlk5uglgf2ro73@bjuq2knwuweh>
 <ef3c1576-74bf-4fbf-be8b-9ff8d24cc24f@intel.com>
 <qj6jh2z7qncr73nesmsdjaa46rxnm34tf4slp6y4ctv4w2dzv2@lttsv323fanu>
 <789cbf9a-fbd8-44e8-a528-22a6c098189e@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <789cbf9a-fbd8-44e8-a528-22a6c098189e@intel.com>
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

On Wed, Jan 08, 2025 at 03:59:58PM -0800, John Harrison wrote:
>On 1/8/2025 14:11, Lucas De Marchi wrote:
>>+Jose
>>+Rodrigo
>>
>>On Wed, Jan 08, 2025 at 12:14:49PM -0800, John Harrison wrote:
>>>On 1/7/2025 13:10, Lucas De Marchi wrote:
>>>>On Tue, Jan 07, 2025 at 12:22:52PM -0800, Julia Filipchuk wrote:
>>>>>Change to disable asci85 GuC logging only when output to devcoredump
>>>>>(was temporarily disabled for all code paths).
>>>>>
>>>>>v2: Ignore only for devcoredump case (not dmesg output).
>>>>>v3: Rebase to resolve parent tag mismatch.
>>>>>
>>>>>Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>
>>>>>---
>>>>>drivers/gpu/drm/xe/xe_devcoredump.c | 8 +++++---
>>>>>include/drm/drm_print.h             | 2 ++
>>>>>2 files changed, 7 insertions(+), 3 deletions(-)
>>>>>
>>>>>diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c 
>>>>>b/drivers/gpu/drm/xe/xe_devcoredump.c
>>>>>index 6980304c8903..8e5d1f9866a7 100644
>>>>>--- a/drivers/gpu/drm/xe/xe_devcoredump.c
>>>>>+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
>>>>>@@ -424,10 +424,12 @@ void xe_print_blob_ascii85(struct 
>>>>>drm_printer *p, const char *prefix,
>>>>>     * Splitting blobs across multiple lines is not compatible 
>>>>>with the mesa
>>>>>     * debug decoder tool. Note that even dropping the 
>>>>>explicit '\n' below
>>>>>     * doesn't help because the GuC log is so big some 
>>>>>underlying implementation
>>>>>-     * still splits the lines at 512K characters. So just 
>>>>>bail completely for
>>>>>-     * the moment.
>>>>>+     * still splits the lines at 512K characters.
>>>>
>>>>did we investigate where this is done and how we can overcome it? I
>>>Yes. And the comment could be updated as part of this patch to 
>>>make it clearer...
>>>
>>>
>>>     * Splitting blobs across multiple lines is not compatible 
>>>with the mesa
>>>     * debug decoder tool. Note that even dropping the explicit 
>>>line wrapping
>>>     * below doesn't help because the GuC log can be so big it 
>>>needs to be split
>>>     * into multiple 2MB chunks, each of which must be printed 
>>>individually and
>>>     * therefore will be a separate line.
>>
>>so there's no "underlying implemenation that splits like at 512K chars"?
>>Nowe it's something else: a 2MB chunk because of what?
>The GuC log is captured in multiple 2MB chunks because we can't 
>kmalloc a full 16MB block at a single time irrespective of memory 
>fragmentation - the kmalloc function aborts with a page size error 
>above 8MB, I recall. Might even have been 4MB? The 2MB chunks become 
>approx 512K characters of ASCII85 output (when mostly full of zeros). 
>Because each chunk is a separate bo object the memory is not 
>contiguous so each must be printed with a separate call to 
>xe_print_blob_ascii85(). If xe_print_blob_ascii85() includes a 
>terminating line feed at the end of the print then that means multiple 
>lines for the GuC log.

now it makes sense... and contradicts what was said earlier about the
"underlying implementation still splits the lines at 512K characters".
It's this very function that is splitting it.

>
>>
>>I don't really want to keep updating this instead of fixing it.
>>
>>>
>>>The dump helper could be updated to never add any line feeds, not 
>>>even
>>
>>when you say "dump helper", what exactly are you talking about?
>>xe_print_blob_ascii85(), __xe_devcoredump_read(), __drm_puts_coredump()
>>or what?
>xe_print_blob_ascii85
>
>>
>>If it's about xe_print_blob_ascii85(), I think this would be the 
>>first step:
>>drop the \n you are adding. AFAICS calling the print function in chunks
>>of 800B would be fine, just don't add any \n. If that still adds \n
>>somewhere, we can check how to drop it or you then may have a pretty
>>solid argument to adapt the mesa tool with a newline
>>continuar char and send them the MR.
>As above, the chunking is at the next level out. So dropping the 800 
>byte \n won't help with the GuC log still being split into multiple 
>lines. You have to either move the terminating \n outside of the 
>helper and into the callers or add a bool parameter to enable/disable 
>it. Either of which is just messy.

If the caller knows it's calling the function multiple times to continue
previous data, it's not unreasonable to have an arg to terminate it or
not. It's for example what python does with its 'end' arg to the print()
function.

>
>Or extend the helper to take an array/list of pointers in a 
>scatter/gather fashion.
>
>And if you drop the 800B \n then you break the dmesg output facility. 
>Which means we can't get logs out from CI panic type situations.

Or that we should have another way to get a devcoredump. I don't think
we are going to print the devcoredump to dmesg when the kernel panics.
We may print it when we fail to probe, but the cpu should still be very
much alive - we tie the devcoredump lifecycle to the lifecycle of the
device, so we don't have an opportunity to get that data.

The workaround you add is to dump the whole thing to dmesg, but we could
dump it somewhere else like a debugfs that is tied to the module
lifecycle.

The dmesg (kmsg) format already contains other things you have to ignore
to extract the message:

  * /dev/kmsg exports the structured data in the following line format:           
  *   "<level>,<sequnum>,<timestamp>,<contflag>[,additional_values, ... ];<message text>\n"

so you will always have to preprocess it, ignore lines that don't belong
to the log, etc.

And if you print it correctly, you can even make use of the LOG_CONT to
mark the new line as continuation of the previous one.

>
>>>at the end. And then the burden would be on the callers to add 
>>>line feeds as appropriate. That seems extremely messy, though. And 
>>>it will break the dmesg output facility. That does need the line 
>>>wrapping at ~800 characters which can't be done from outside the 
>>>helper.
>>>
>>>>
>>>>understand having to split it into multiple calls, but not something
>>>>adding a \n. particularly for the functions dealing with seq_file and
>>>>devcoredump.
>>>>
>>>>>+     *
>>>>>+     * Only disable from devcoredump output.
>>>>>     */
>>>>>-    return;
>>>>>+    if (p->coredump)
>>>>
>>>>but we do want the guc log to be inside the devcoredump, so rather than
>>>>adding more workarounds, can we fix it ?
>>>The simplest fix is your suggestion of adding an extra white space 
>>>character at the end of the line in the helper function and 
>>>updating the mesa tool to support multi-line output. That seems 
>>>like it should be a trivial update to the mesa tool and it keeps 
>>>the KMD side simple and consistent across all potential output 
>>>methods. But Jose seemed absolutely dead set against any updates 
>>>to the mesa tool at all :(.
>>>
>>>The more complex fix is Joonas' idea of using an official 
>>>structured output format of some sort - TOML, YAML, JSON or 
>>>whatever. Something
>>
>>it actually doesn't fix this particular issue. It fixes others, but not
>>this one.
>If we do it properly then it fixes everything. The format library 
>would have helper functions that the devcoredump code can call to 

but we are *NOT* going to export a library for that. You are just
shifting the problem to "we have only one userspace that is our own
library, deal with it".

>print integers, bools, strings and BLOBs. The debugfs/sysfs output 
>would just stream the encoded output exactly as is. The dmesg output 
>layer would add the 800 character line wrapping in a way that the 
>dmesg decoder can undo before passing to the decoder library.
>
>>
>>    "Guc Log": "<encoded data .........."
>>
>>if you need to split lines, you still need something to do do it in
>>whatever format you choose. One json I remember working on in the past
>>that embeds the binary is the .apj format... example:
>>https://firmware.ardupilot.org/Copter/2024-12/2024-12-02-13:12/CubeBlack/arducopter.apj
>>
>>
>>    {
>>        "board_id": 9,
>>        "magic": "APJFWv1",
>>        "description": "Firmware for a STM32F427xx board",
>>        "image": "eNqUvAlcU1faMH5u7k1yCQGCICCgBoIaRW0EtVSxhg ...
>>
>>here "image" is base64-encoded  afair. But in your case, just printing
>>the json to dmesg wouldn't work because of needing to split the line.
>>It wouldn't fix the kind of bugs we had in the past too:  in json it
>>would be the equivalent of adding a field to the wrong object and then
>>move it elsewhere. An application trying to read that object in the
>>previous place would be broken regardless.
>>
>>toml is more for configuration and yaml isn't a good one for this case
>>as it further relies on indentation. I wouldn't oppose to use json, but
>>don't expect to have dmesg to magically work because of that.
>TOML basically says 'use base64 and print it as a string'. And it 
>supports multi-line strings, so the reader would have to drop newlines 
>within a base64 object before doing the base64 decode. Or just use a 
>base64 decoder that ignores whitespace.
>
>YAML seems to make even more explicit. From the 1.2.2 spec page:
>    picture: !!binary |
>     R0lGODlhDAAMAIQAAP//9/X
      ^ space here for line continuation, as I mentioned.
      

>     17unp5WZmZgAAAOfn515eXv
>     Pz7Y6OjuDg4J+fn5OTk6enp
>     56enmleECcgggoBADs=
>
>So the userland reader just gets binary data straight out of the 
>decoder library with no processing required.

A decoder library that we are *NOT* going to write.


>
>
>>
>>So let's fix the issue at hand and let the talk about xe's coredump
>>format for a later time.
>The issue at hand is that we have two fundamentally conflicting 
>requirements. DMesg output requires line wrapping but the mesa tool 
>has been coded in such a way that it breaks when given wrapped lines. 
>There is nothing we can do about dmesg but making the mesa tool's 
>parser more robust does not seem difficult.
>
>Switching to an externally defined encoding scheme that internally 
>manages binary objects and supports wrapped lines would fix all issues 
>and guarantee future compatibility.
>
>Note that line wrapping is not the only problem with the current mesa 
>tool. Unless it has been updated since? The tool breaks if the context 
>information is not part of the "GuC Communication Transport" section. 
>Which is totally incorrect. Context state is very definitely not part 

We reverted it because it's not ok to just move it to the "correct"
place and break the users. If it's in the incorrect place and we know
there's this parser already using it incorrectly, we can treat as a bug
in the kernel and adjust the userspace (it'd be considered a bug there
too and backported to their earlier releases).  What we don't do is
simply merge the fix and break userspace.

Send the fix to the mesa tool if you want to change this in the kernel.

And as I said, for this particular change it doesn't matter if it's a
custom format, json, toml or whatever... the bug would still be the
same.

>of the GuC CT layer. That absolutely needs to be fixed. And generally, 
>anything we can do to make the decoding more robust and future proof 
>would be a very good thing.
>
>Note that the devcoredump content is highly dependent upon the 
>internal workings of the driver. It is going to change over time. So 
>the more robust the decoder, the better chance it has of not breaking 
>when some new piece of data is added to the dump or an existing item 
>removed or modified.
>
>>
>>>that ideally supports binary data and compression natively and has 
>>>a helper library that can be included in the kernel source tree. 
>>>That
>>
>>oh no, we'd need to define the schema - there are plenty of json 
>>libraries
>>in multiple languages for users to choose from  and that would be 
>>basically
>>then main benefit of using it.
>Well, we can certainly define extra formats on top of a base format 
>but it seems like it would be simpler if the base format supported all 
>the data types we need already. Doesn't really matter either way as 
>long as the underlying file format supports all the uses we want of 
>it.

My point is that we are not going to add a decoder library that all
userspace consumers have to use. The kernel interface is not a library.
You are relying on having just one userspace to not break userspace.

The benefit of a common format like json, toml etc is exactly that it's
a format already understood by hundreds of libraries and we can even do
something like this instead of having to write our own parser:

cat devcoredump | jq '.[] | .foo, .bar'

Lucas De Marchi

>
>John.
>
>>
>>Lucas De Marchi
>>
>>>will then remove any and all confusion over interpretation of the 
>>>file forever more. But it would require updating all userland 
>>>tools to use the appropriate helper library.
>>>
>>>John.
>>>
>>>>
>>>>Lucas De Marchi
>>>
>
