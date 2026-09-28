Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B0AAC9832F
	for <intel-xe@archiver.kernel.org>; Mon, 28 Sep 2026 06:35:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1657D10E7A4;
	Mon, 28 Sep 2026 06:35:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="aVFWsgIe";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B71910E7A4
 for <intel-xe@lists.freedesktop.org>; Mon, 28 Sep 2026 06:35:26 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 3AB3C41A69;
 Mon, 28 Sep 2026 06:35:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E53891F000FF;
 Mon, 28 Sep 2026 06:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1790577326;
 bh=Ne1ple756me1IKY4DZz33EhnSWuut+rOUmgXdYbejn4=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=aVFWsgIet1W8YNIb9nd6FkFw5rw4vqdL8lbaIMfBjsdavJ66vtECPrnAuTLabmMFQ
 zgb3Y/50JdQW9V34vdN2YylEsNi9zohON/1Mq5li3zG2uGI5ij7QK3KZYwDHd/cote
 w8FtEWV/932yi+rWcjkV8jD3eN8EquRIyp7JymzLA3kWXzJlQV3o1DS+wPtHVehzkk
 V8UCvC9OwC9zcVMH8+lvMVzankkDCNRpr/FNTHdo0bePUzM4irPcS6f+7QvMtdgY39
 aKhVY11RCBV8h8fy2ehhwK3m2wrgTr/9cRPc5mGWzPiWsi49IL/VpFiMoAGmhMJMGs
 oVzhEPQFKPHcQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/6] drm/xe/xe_ras: Add support to query page offline
 queue and list
To: "Riana Tauro" <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260928061830.417395-10-riana.tauro@intel.com>
References: <20260928061830.417395-8-riana.tauro@intel.com>
 <20260928061830.417395-10-riana.tauro@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 28 Sep 2026 06:35:25 +0000
Message-Id: <20260928063525.E53891F000FF@smtp.kernel.org>
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

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [Medium] xe_ras: missing bounds check on pages_returned causes silent pag=
e skipping
- [Medium] xe_ras: unhandled errors in handle_page_offline abort queue fetc=
hing
- [Medium] xe_ras: integer overflow in loop termination check causes hang
- [Medium] xe_ras: missing endianness conversions in sysctrl payload struct=
ures
- [Low] build: pointer sign mismatch in xe_sysctrl_send_command call
--

commit c79936a34d5a6eb6a5f10a97e90fa4f355928529
Author: Riana Tauro <riana.tauro@intel.com>

drm/xe/xe_ras: Add support to query page offline queue and list

This patch adds support to query the list of pages offlined by firmware
and the queue of pages pending to be offlined. It implements mailbox
commands to fetch the data from the firmware during module load.

> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index 96ad473388a95..f1da7f983637a 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -335,6 +335,77 @@ static bool ras_counter_is_valid(struct xe_device *x=
e, struct xe_ras_error_class
>  	return true;
>  }
> =20
> +static void get_offline_pages(struct xe_device *xe, u32 cmd, void *req, =
size_t req_size,
> +			      void *resp, size_t resp_size,
> +			      struct xe_ras_offline_common *common, bool offline)
> +{
> +	struct xe_sysctrl_mailbox_command command =3D {0};
> +	struct xe_ras_offline_list_request *list_req;
> +	u32 total_pages =3D 0, count =3D 0;
> +	ssize_t rlen;
> +	int ret, i;
> +
> +	list_req =3D req ? req : NULL;
> +
> +	xe_sysctrl_create_command(&command, XE_SYSCTRL_GROUP_GFSP, cmd, req, re=
q_size, resp,
> +				  resp_size);
> +
> +	do {
> +		memset(resp, 0, resp_size);
> +
> +		if (list_req)
> +			list_req->index =3D count;

[Severity: Medium]
Since the sysctrl mailbox header explicitly uses little-endian
data conversions, does the payload data also need to be little-endian?=20
Defining the index as a native u32 and assigning it directly without
cpu_to_le32() might send corrupted values to the firmware on big-endian
architectures.

> +
> +		ret =3D xe_sysctrl_send_command(&xe->sc, &command, &rlen);

[Severity: Low]
Does passing a pointer to the signed ssize_t rlen variable here cause a
pointer sign mismatch compiler warning? It looks like
xe_sysctrl_send_command() expects a size_t * for its third argument.

> +		if (ret) {
> +			xe_log_err(xe, SYSCTRL, ret, "failed to get page offline data, cmd=3D=
%#x\n",
> +				   cmd);
> +			return;
> +		}
> +
> +		if (rlen !=3D resp_size) {
> +			xe_log_err(xe, SYSCTRL, -EINVAL,
> +				   "unexpected page offline response length %zu (expected %zu), cmd=
=3D%#x\n",
> +				   rlen, resp_size, cmd);
> +			return;
> +		}
> +
> +		for (i =3D 0; i < common->pages_returned && i < XE_RAS_NUM_PAGES; i++)
> +			handle_page_offline(xe, common->page_addresses[i], offline);

[Severity: Medium]
Can handle_page_offline() fail (for instance with -EIO for a critical BO) a=
nd
return early without sending the offline command to the firmware?=20

Because the return value is ignored here, the page might be left in the
firmware's pending queue. Would the firmware then repeatedly return the same
unhandled pages on the next fetch, eventually causing the loop below to
abruptly abort the entire queue processing once count exceeds total_pages?

> +
> +		count +=3D common->pages_returned;

[Severity: Medium]
If the firmware returns a pages_returned value greater than XE_RAS_NUM_PAGES
(25), the loop above only processes up to 25 pages. Does incrementing count=
 by
the full unvalidated pages_returned value incorrectly shift the list_req->i=
ndex
for the next request, causing the driver to silently skip the remaining
poisoned pages?

> +		if (!common->pages_returned)
> +			break;
> +
> +		if (!total_pages)
> +			total_pages =3D common->total_pages;
> +
> +		if (count > total_pages) {

[Severity: Medium]
Both count and total_pages are 32-bit integers. If the firmware provides
total_pages as the maximum u32 value and additional_data remains set, could
count wrap around to 0? If so, this termination check would never be true,
resulting in an infinite loop.

> +			xe_log_err(xe, SYSCTRL, -EINVAL,
> +				   "Pages returned exceed total pages %u, returned %u, cmd=3D%#x\n",
> +				   total_pages, count, cmd);
> +			return;
> +		}
> +	} while (common->additional_data);
> +}

[ ... ]
> diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ra=
s_types.h
> index f119489bcdf21..021ffbd6d4e2c 100644
> --- a/drivers/gpu/drm/xe/xe_ras_types.h
> +++ b/drivers/gpu/drm/xe/xe_ras_types.h
[ ... ]
> @@ -330,6 +331,40 @@ struct xe_ras_page_offline_response {
>  	u32 reserved;
>  } __packed;
> =20
> +/**
> + * struct xe_ras_offline_common - Common structure for offline list and =
queue
> + */
> +struct xe_ras_offline_common {
> +	/** @total_pages: Total number of queued pages */
> +	u32 total_pages;
> +	/** @pages_returned: Number of pages returned in this response */
> +	u32 pages_returned;
> +	/** @page_addresses: Array of page addresses (4KB aligned) */
> +	u64 page_addresses[XE_RAS_NUM_PAGES];
> +	/** @additional_data: Indicates if more data is available */
> +	u8 additional_data;
> +	/** @reserved: Reserved for future use */
> +	u8 reserved[3];
> +} __packed;
> +
> +/**
> + * struct xe_ras_offline_list_request - Request for get offline list com=
mand
> + */
> +struct xe_ras_offline_list_request {
> +	/** @index: Zero-based index into the offline page list */
> +	u32 index;
> +} __packed;

[Severity: Medium]
Should the index field (and fields in the common structure above) be defined
using __le32 or __le64 types instead of native types to ensure correct
endianness conversion when communicating with the sysctrl firmware?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260928061830.4173=
95-8-riana.tauro@intel.com?part=3D2
