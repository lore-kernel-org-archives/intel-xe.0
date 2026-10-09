Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FC94CA601C
	for <intel-xe@archiver.kernel.org>; Fri,  9 Oct 2026 10:41:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08F2A11207F;
	Fri,  9 Oct 2026 10:41:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="OP9pn0QB";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B568511208A
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Oct 2026 10:41:27 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 0565A60534;
 Fri,  9 Oct 2026 10:41:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D3021F00893;
 Fri,  9 Oct 2026 10:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1791542486;
 bh=b7Gjr+F5H7XlpmMOc+o3cW3nhM6OeAqUAUG2mS89O6c=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=OP9pn0QBdC57t6Xcg8JKfdWwoEpVypKShuMO8UZPgKu5EGtAXfPuhMhcov/X0sbBE
 CkmK/mO5Q+y6BGjj5/+39o4oqKypG9NT3K4y9w95j4adRkXchuDE+ejXAUHJ5fdBBq
 FXK/HBIkET3N71jXe3n7A4vnMH8xgFLBzxzjD0CdWbQdeKkjMLObF+HKi3xon+ZbIq
 LBu3g7k7DGKXB2s8OpVEG4VjuAz4Ul8U5odpct4Shis/RygmS7mF2ucMu4nYxzNr/k
 N0SDfkltZb2eRNOX4ciBIFd26czCHd2E6v+ohyVk7VX0qW9iP1vMjUkKPsc41NEWo4
 zGVZw6nLJfoMw==
Message-ID: <sashiko-outbox-165253@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 06/12] drm/xe/cper: Prepare Intel CPER error info
 records
To: "Badal Nilawar" <badal.nilawar@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20261009104602.1075405-20-badal.nilawar@intel.com>
References: <20261009104602.1075405-14-badal.nilawar@intel.com>
 <20261009104602.1075405-20-badal.nilawar@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 10:41:26 +0000
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
Reply-To: sashiko-reviews@lists.linux.dev
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] xe/cper: missing __packed attributes on CPER structs causes ABI br=
eakage and unaligned access
--

commit 48cc4e07bb3144fabbe0d059b7aa4e8d590267c1
Author: Badal Nilawar <badal.nilawar@intel.com>

drm/xe/cper: Prepare Intel CPER error info records

This commit prepares xe_cper_sec_intel_error_info records from RAS info
queue data. Depending on the error class type, one or more error info
records may be generated and embedded in the CPER record.

> diff --git a/drivers/gpu/drm/xe/xe_cper.c b/drivers/gpu/drm/xe/xe_cper.c
> index 1000c78b41e97..7acb503efd118 100644
> --- a/drivers/gpu/drm/xe/xe_cper.c
> +++ b/drivers/gpu/drm/xe/xe_cper.c
[ ... ]
> +static struct xe_cper_sec_intel_error_info *
> +build_einfo(const struct xe_ras_error_log *logs, u32 num_logs,
> +	    const struct xe_ras_error_class *ec, u32 error_count)
> +{
> +	u32 queue_len =3D num_logs * XE_CPER_RAS_LOG_ENTRY_SIZE;
> +	struct xe_cper_sec_intel_error_info *einfo;
> +	struct xe_intel_priv_event_entry *entry;
> +	u32 i;
> +
> +	einfo =3D kzalloc_flex(*einfo, event_queue, queue_len);
> +	if (!einfo)
> +		return NULL;
> +
> +	einfo->error_count        =3D error_count;
> +	einfo->event_queue_length =3D queue_len;
> +	einfo->event_queue_count  =3D num_logs;
> +	fill_cper_error_class(&einfo->error_class, ec);
> +
> +	entry =3D (struct xe_intel_priv_event_entry *)einfo->event_queue;
> +	for (i =3D 0; i < num_logs; i++) {
> +		entry->entry_length =3D sizeof_field(struct xe_ras_error_log, error_de=
tails);
> +		entry->timestamp    =3D logs[i].timestamp;

[Severity: High]
Can this assignment cause an alignment fault?=20

Because xe_cper_sec_intel_error_info is evaluated as 28 bytes in size,
event_queue starts at offset 28. In xe_intel_priv_event_entry, the
timestamp is at offset 8. The resulting address for the timestamp field is
therefore 36 bytes from the kzalloc base, which is not 8-byte aligned.

Writing a 64-bit value to a 4-byte-aligned address can cause a kernel panic
on architectures that strictly enforce 64-bit alignment.

> +		memcpy(entry->metadata, logs[i].error_details, sizeof(logs[i].error_de=
tails));
> +		entry =3D (void *)entry + XE_CPER_RAS_LOG_ENTRY_SIZE;
> +	}
> +
> +	return einfo;
> +}
[ ... ]
> diff --git a/drivers/gpu/drm/xe/xe_cper_types.h b/drivers/gpu/drm/xe/xe_c=
per_types.h
> index 7612518c9d47b..627c7117f23eb 100644
> --- a/drivers/gpu/drm/xe/xe_cper_types.h
> +++ b/drivers/gpu/drm/xe/xe_cper_types.h
[ ... ]
> +struct xe_cper_sec_intel_error_info {
> +	/** @error_class: Error classification */
> +	struct xe_cper_error_class error_class;
> +	/** @error_count: Total number of errors recorded */
> +	u32 error_count;
> +	/** @event_queue_length: Total byte size of the @event_queue array */
> +	u32 event_queue_length;
> +	/** @event_queue_count: Number of entries in @event_queue */
> +	u32 event_queue_count;
> +	/** @event_queue: Packed array of &xe_intel_priv_event_entry records */
> +	u8 event_queue[];
> +};
> +
> +/**
> + * struct xe_intel_priv_event_entry - Single error event in the event qu=
eue
> + *
> + * Each entry is variable-length; @entry_length gives the byte size of
> + * @metadata only (not including @entry_length or @timestamp).
> + */
> +struct xe_intel_priv_event_entry {
> +	/** @entry_length: Byte length of the @metadata payload */
> +	u32 entry_length;
> +	/** @timestamp: Timestamp of this event, in firmware ticks */
> +	u64 timestamp;
> +	/** @metadata: Event-specific payload bytes */
> +	u8  metadata[];
> +};

[Severity: High]
Are these structures missing the __packed attribute?

Without it, the compiler injects a 4-byte hole before the timestamp field,
which also enforces 8-byte alignment for the struct. This implicit padding
corrupts the intended binary CPER layout, potentially leading to ABI
breakage when the records are parsed by external tools. It also causes the
memory alignment issues mentioned above.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261009104602.1075=
405-14-badal.nilawar@intel.com?part=3D6
