Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F4AACA6012
	for <intel-xe@archiver.kernel.org>; Fri,  9 Oct 2026 10:40:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FF0C112071;
	Fri,  9 Oct 2026 10:40:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="oU4FlaKE";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52182112068
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Oct 2026 10:40:12 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 5285F60534;
 Fri,  9 Oct 2026 10:40:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D26B21F000FF;
 Fri,  9 Oct 2026 10:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1791542411;
 bh=RU33ae01Jqx48Fj382ECqk+nCUTNYR6xZI8YzL0Pt68=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=oU4FlaKEuFVl4WaZ8iUyC6SUChhjQMjeD4uvQYhmxbPyiszrEW3f4aSS+3Sgcpc0r
 jsDFOPXVO2R8diKbmXZH9kdx0IrtvEAg1Rr/cZi+0Itz7/XqptOTsixt2jVdYKJfcf
 Nbc2uheCthtCJVWpqLUxAC65A1m6qTPYeDzBYojI3hJ+DYRRt4nzlfIWAaiIYxgazE
 BQO9E0mntPLh4F3slgl9lQgC1MeBrAi+J4qlTcN/SOhKckj9SJCCMgZMdmpJemJNAZ
 TidQuLwzsVhNfxzoaeRI7K7/tmY9lULTdsYQzKDG9SUcu2MyoXdRaW5omZPyNZT8dm
 PiGjtCzRIizcA==
Message-ID: <sashiko-outbox-165251@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 05/12] drm/xe/xe_ras: Add support to retrieve info
 queue data for CRI
To: "Badal Nilawar" <badal.nilawar@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20261009104602.1075405-19-badal.nilawar@intel.com>
References: <20261009104602.1075405-14-badal.nilawar@intel.com>
 <20261009104602.1075405-19-badal.nilawar@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 10:40:10 +0000
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
- [Medium] xe_ras: missing validation of operation_status in get_info_queue=
_data
--

commit 7080ef5206c9792b353853f321f38646d98e4924
Author: Badal Nilawar <badal.nilawar@intel.com>

drm/xe/xe_ras: Add support to retrieve info queue data for CRI

Retrieve the RAS info queue data, in multiple chunks, and assemble it into
a flat buffer. A follow-up patch will use this data to prepare the CPER
error info.

> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index 5cfc9beff8c13..900319938fe54 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
[ ... ]
> +static int get_info_queue_data(struct xe_device *xe,
> +			       struct xe_ras_get_info_queue_request *req,
> +			       struct xe_ras_get_info_queue_response *out)
> +{
[ ... ]
> +	if (rlen !=3D sizeof(response)) {
> +		xe_err(xe, "sysctrl: unexpected get info queue data response length %z=
u (expected %zu)\n",
> +		       rlen, sizeof(response));
> +		return -EIO;
> +	}
> +
> +	hdr =3D &response.queue_response.header;
> +	xe_dbg(xe, "[RAS]: info queue data: status=3D%u chunk_size=3D%u flags=
=3D0x%x\n",
> +	       response.operation_status, hdr->chunk_size, hdr->flags);
> +
> +	*out =3D response;
> +	return 0;
> +}

[Severity: Medium]
Does this code need to validate response.operation_status and return an err=
or
if the firmware operation failed?

get_info_queue_data() executes the XE_SYSCTRL_CMD_GET_INFO_QUEUE mailbox
command to fetch chunks from the firmware. The firmware response includes an
operation_status field to indicate whether the request was successful or
rejected (e.g., due to an invalid session ID or out-of-bounds offset).

However, this only logs the status in a debug message and unconditionally
returns 0 (success). Because it fails to return an error (such as converting
the status via ras_status_to_errno()), the caller
xe_ras_drain_info_queue_raw() will proceed to validate and process the
payload. If the firmware did not populate the payload on error, it will
contain zeroes or garbage, resulting in a confusing "invalid info queue
chunk" warning or silent failure, rather than properly halting the fetch
with the correct error code.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261009104602.1075=
405-14-badal.nilawar@intel.com?part=3D5
