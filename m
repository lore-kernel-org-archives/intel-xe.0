Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83D1ED0D791
	for <intel-xe@archiver.kernel.org>; Fri, 11 Oct 2024 13:55:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ECE010EAF2;
	Fri, 11 Oct 2024 13:55:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (4096-bit key; secure) header.d=ijzerbout.nl header.i=@ijzerbout.nl header.b="a4piOjoD";
	dkim-atps=neutral
X-Greylist: delayed 593 seconds by postgrey-1.36 at gabe;
 Tue, 08 Oct 2024 21:28:39 UTC
Received: from bout3.ijzerbout.nl (bout3.ijzerbout.nl [136.144.140.114])
 by gabe.freedesktop.org (Postfix) with ESMTP id 286C810E5DD
 for <Intel-Xe@Lists.FreeDesktop.Org>; Tue,  8 Oct 2024 21:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ijzerbout.nl; s=key;
 t=1728422326; bh=8lkI87krURgIcOV8uOM/P79JnTmvQgF971fRxlj7j8M=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=a4piOjoDhl1TbmKP4hz/I5SKIxh4MNnODH5rKGenosEBzrdzbFNzRl4KRbFUTp1WL
 AenbI4VSQlzeOvnmF28YSJQAxJZNbKstjKEbMm5NQ+m4nzagrLQ5nJ+tC/aDoptfrd
 O/IMZYCr9xX3UeewURl3wDAmCKXO/g0bxfvpBM7WSSuIAEGU2LdZUgtx4vJF+REBKw
 GWzJ4j8HElWZt0cqr/N0FC/Lkoj3CJQQkbxYkSiknec9igH+9KvAnDUF3BMO1CRk1h
 Wz+wSK4uGgDE56RS7FhDCiDfP1OxW2SWmgLwYU+3M545Qvdkvl3C4J4OCH+ksxK9p2
 996Z4+aYULy+1TyO9uPXMXuovgOezEYtqrnRU8FmTlI5+8xstjvw8SJ/x9Gj9ALlGD
 kuWeIa53AUMdzBW16muvLMwYFtTtqfj2hCn6MDpx+CHVRMnVy5YgkN6wUSsRnpHFW9
 1nhCGjk8vLn9IH4S0IP/Ys7w2AipiyPu15mZy/vDz8fCZlmjCbw1BhHM9U4SEWxuwU
 e5mcjKUSqJtoj0O8+b2LyK32NYN+EbwQPK/ykBrBDH0MjaVb38ZdRhIWq2P6qBJNNd
 QthqiIAnjWL2RtQnaOnLuyy9JSKaOICbu6bfQE9fomM/8ygjHBMjC19gcBE+Lec9co
 LglE30+54IpHerSH5PZkjw60=
Received: from [IPV6:2a10:3781:99:1:1ac0:4dff:fea7:ec3a] (racer.ijzerbout.nl
 [IPv6:2a10:3781:99:1:1ac0:4dff:fea7:ec3a])
 by bout3.ijzerbout.nl (Postfix) with ESMTPSA id 5B67D16B16D;
 Tue,  8 Oct 2024 23:18:46 +0200 (CEST)
Message-ID: <58c11f91-a5e0-4232-9050-572f835f180e@ijzerbout.nl>
Date: Tue, 8 Oct 2024 23:18:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v9, 06/11] drm/xe/guc: Use a two stage dump for GuC logs and add
 more info
To: John.C.Harrison@Intel.com, Intel-Xe@Lists.FreeDesktop.Org
Cc: Julia Filipchuk <julia.filipchuk@intel.com>
References: <20241003004611.2323493-7-John.C.Harrison@Intel.com>
Content-Language: en-US
From: Kees Bakker <kees@ijzerbout.nl>
In-Reply-To: <20241003004611.2323493-7-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Fri, 11 Oct 2024 13:55:28 +0000
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

Op 03-10-2024 om 02:46 schreef John.C.Harrison@Intel.com:
> From: John Harrison <John.C.Harrison@Intel.com>
>
> Split the GuC log dump into a two stage snapshot and print mechanism.
> This allows the log to be captured at the point of an error (which may
> be in a restricted context) and then dump it out later (from a regular
> context such as a worker function or a sysfs file handler).
>
> Also add a bunch of other useful pieces of information that can help
> (or are fundamentally required!) to decode and parse the log.
>
> v2: Add kerneldoc and fix a couple of comment typos - review feedback
> from Michal W.
> v3: Move chunking code to this patch as it makes the deltas simpler.
> Fix a bunch of kerneldoc issues.
> v4: Move the CS frequency out of the coredump snapshot function into
> the debugfs only code (as that info is already part of the main
> devcoredump). Add a header to the debugfs log to match the one in the
> devcoredump to aid processing by a unified tool. Add forcewake to the
> GuC timestamp read so it actually works.
> v6: Add colon to GuC version string (review feedback by Julia F).
>
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> Reviewed-by: Julia Filipchuk <julia.filipchuk@intel.com>
> ---
>   drivers/gpu/drm/xe/regs/xe_guc_regs.h |   1 +
>   drivers/gpu/drm/xe/xe_guc_log.c       | 178 +++++++++++++++++++++++---
>   drivers/gpu/drm/xe/xe_guc_log.h       |   4 +
>   drivers/gpu/drm/xe/xe_guc_log_types.h |  27 ++++
>   4 files changed, 195 insertions(+), 15 deletions(-)
> [...]
> + * xe_guc_log_snapshot_free - free a previously captured GuC log snapshot
> + * @snapshot: GuC log snapshot structure
> + *
> + * Return: pointer to a newly allocated snapshot object or null if out of memory. Caller is
> + * responsible for calling xe_guc_log_snapshot_free when done with the snapshot.
> + */
> +void xe_guc_log_snapshot_free(struct xe_guc_log_snapshot *snapshot)
> +{
> +	int i;
> +
> +	if (!snapshot)
> +		return;
> +
> +	if (!snapshot->copy) {
I guess you meant "if (snapshot->copy) {"
Otherwise the kfree's are going to use NULL pointers.
> +		for (i = 0; i < snapshot->num_chunks; i++)
> +			kfree(snapshot->copy[i]);
> +		kfree(snapshot->copy);
> +	}
> +
> +	kfree(snapshot);
> +}
>
