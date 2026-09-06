Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73CF5C79F8C
	for <intel-xe@archiver.kernel.org>; Sun,  6 Sep 2026 17:30:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 291CC10E088;
	Sun,  6 Sep 2026 17:30:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="VXd2e9/5";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC68110E088
 for <intel-xe@lists.freedesktop.org>; Sun,  6 Sep 2026 17:30:16 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id AB387412B7;
 Sun,  6 Sep 2026 17:30:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CE4B1F00A3A;
 Sun,  6 Sep 2026 17:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788715816;
 bh=11Une6TKncNsLLCmNyxc0osL5+nN321oiEWig5QIZAc=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=VXd2e9/5UUYACsgFT3vrjTRqXjLcZFa6NGuAhOSYIC0EE+lw+n0IynWDW5Qmjm8Ca
 iDd38aCtglckG0rpJqCl0q8ElvoJ5WBzYyDGJADcO5Jw2/uyiraksfMIPdgS8R95X3
 pw+0F7NMd1+B7QIzSy9h6QS80hDoifNNafzBpXTxsNfv8fE3FipoZ2Ku1S2h4FGrMe
 62uyxpWxnTeHFbWefbmjWpovO7aOwuD2qnsQWdmgXb5izhJRC3G/LE1QvpL6BTZJb/
 l3ONUDZfLleopzLNQDT5RoyF3gzf/AoAfp2/VgB7/O5Mn1DMu9Etf0OSRFRKVuLzVZ
 JuP85PHPm3Y1w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 06/12] drm/xe/cper: Prepare Intel CPER error info
 records
To: "Badal Nilawar" <badal.nilawar@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260906172604.2215987-20-badal.nilawar@intel.com>
References: <20260906172604.2215987-14-badal.nilawar@intel.com>
 <20260906172604.2215987-20-badal.nilawar@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 06 Sep 2026 17:30:16 +0000
Message-Id: <20260906173016.6CE4B1F00A3A@smtp.kernel.org>
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

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] Incorrect parsing of aggregate info queue logs causes offset corru=
ption and truncated error counts.

Pre-existing issues:
- [High] Inverted hardware SIGID check causes the hardware error handler to=
 unconditionally abort.
- [High] Unbounded loop in `xe_ras_drain_info_queue_raw` leading to Denial =
of Service.
--

commit 08c625ea20b49a15a86e85dcc258d1ff791d3145
Author: Badal Nilawar <badal.nilawar@intel.com>
drm/xe/cper: Prepare Intel CPER error info records

This patch prepares xe_cper_sec_intel_error_info records from RAS info
queue data. Depending on the error class type, one or more error info
records are generated and embedded in the CPER record.

> diff --git a/drivers/gpu/drm/xe/xe_cper.c b/drivers/gpu/drm/xe/xe_cper.c
> --- a/drivers/gpu/drm/xe/xe_cper.c
> +++ b/drivers/gpu/drm/xe/xe_cper.c
[ ... ]
> +static struct xe_cper_einfo_entry *
> +xe_prepare_cper_error_info(struct xe_device *xe,
> +			   const struct xe_ras_get_counter_response *counter_resp,
> +			   const struct xe_ras_error_class *error_class,
> +			   u32 *count_out)
> +{
[ ... ]
> +	raw_buf =3D kzalloc(XE_RAS_INFO_QUEUE_MAX_TOTAL_SIZE, GFP_KERNEL);
> +	if (!raw_buf)
> +		return NULL;
> +
> +	raw_total =3D xe_ras_drain_info_queue_raw(xe, counter_resp, raw_buf,
> +						XE_RAS_INFO_QUEUE_MAX_TOTAL_SIZE);

[Severity: High]
This is a pre-existing issue, but since this patch adds a call to it here,
can xe_ras_drain_info_queue_raw() cause a denial of service if the
hardware misbehaves?

Looking at xe_ras_drain_info_queue_raw() in drivers/gpu/drm/xe/xe_ras.c,
the loop bounds check evaluates the received chunk offset:

    if (check_add_overflow(qhdr->chunk_offset, qhdr->chunk_size, &end) ||
        end > XE_RAS_INFO_QUEUE_MAX_TOTAL_SIZE || end > raw_buf_size) {

However, the loop termination relies entirely on the MORE_DATA flag:

    } while (iq_response.queue_response.queue_header.flags &
             XE_RAS_INFO_QUEUE_FLAG_MORE_DATA);

It never checks if the accumulated iq_offset exceeds the total maximum
limit across iterations. Could a malfunctioning or malicious firmware
hang the kernel by continuously returning valid small chunks with the
MORE_DATA flag set?

[ ... ]
> +		for (i =3D 0; i < num_headers; i++) {
> +			u32 num_logs =3D min_t(u32, hdrs[i].counter, XE_RAS_NUM_COUNTERS);
> +			struct xe_cper_sec_intel_error_info *einfo;
> +
> +			if (log_offset + num_logs > avail_logs) {
> +				xe_warn(xe, "[RAS]: CPER: header[%u] claims %u logs but only %u rema=
in\n",
> +					i, num_logs, avail_logs - log_offset);
> +				break;
> +			}
> +
> +			if (!num_logs)
> +				continue;
> +
> +			einfo =3D build_einfo(&all_logs[log_offset], num_logs,
> +					    &hdrs[i].error_class, num_logs,
> +					    &einfo_arr[einfo_count].einfo_size,
> +					    &einfo_arr[einfo_count].timestamp);

[Severity: High]
Does clamping num_logs to XE_RAS_NUM_COUNTERS here cause parsing
desynchronization?

If the hardware returns an aggregate info queue where hdrs[i].counter is
greater than XE_RAS_NUM_COUNTERS, num_logs is clamped. But this clamped
value is also passed to build_einfo() as the error_count, leading to
truncated error counts.

> +			if (!einfo) {
> +				free_einfo_arr(einfo_arr, einfo_count);
> +				kfree(raw_buf);
> +				return NULL;
> +			}
> +
> +			einfo_arr[einfo_count].hdr   =3D hdrs[i];
> +			einfo_arr[einfo_count].einfo =3D einfo;
> +			log_offset +=3D num_logs;

[Severity: High]
Additionally, does incrementing log_offset by the clamped amount rather
than the claimed amount cause subsequent headers to read the wrong log
data? It seems like it would leave unconsumed logs in the stream,
corrupting the offset for the next iteration.

[ ... ]
>  void xe_emit_hardware_error_cper(struct pci_dev *pdev, int cper_sev, enu=
m xe_sigid sigid,
>  				 struct xe_ras_error_class *counter,
>  				 struct xe_ras_get_counter_response *response)
>  {
>  	struct xe_device *xe =3D pdev_to_xe_device(pdev);
>  	struct xe_ras_get_counter_response local_resp =3D {};
>  	struct xe_ras_get_counter_response *counter_response =3D response;
>  	struct xe_cper_sec_intel_err_hdr ihdr =3D {};
> +	struct xe_cper_einfo_entry *einfo_arr =3D NULL;
> +	u32 einfo_count =3D 0;
> +	u32 i;
> =20
>  	if (!xe)
>  		return;
> =20
>  	if ((int)sigid >=3D INTEL_SIGID_GPU_XE_HARDWARE_START)
>  		return;

[Severity: High]
This is a pre-existing issue, but is this check inverted?

It aborts if the error is >=3D INTEL_SIGID_GPU_XE_HARDWARE_START, which
seems to dead-code the entire hardware error logging feature. Since this
occurs on every hardware error, does this check completely neutralize
xe_emit_hardware_error_cper() for hardware errors?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260906172604.2215=
987-14-badal.nilawar@intel.com?part=3D6
