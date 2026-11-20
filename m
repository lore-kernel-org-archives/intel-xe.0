Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3812B606A32A
	for <intel-xe@archiver.kernel.org>; Fri, 20 Nov 2026 07:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WU+sabc+
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9F0910E2BB;
	Fri, 20 Nov 2026 07:54:55 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3214110E2BB
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Nov 2026 07:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795161290; x=1826697290;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=juVBVKqACIcRlOQSiNY74SwgubrapxhHOuBZ6EPGGtw=;
 b=WU+sabc+zcL031VSdraERS6E0/kFw8NCON+PN9SuDnfEeEB5m4S4MPlP
 GolYQDn0H940EhJRNgy9r9W7FJKlOq1CsKka4Iex3Sm/4mq9lKsPej2Tt
 9x64ILL1GyzojH9fSfiV8M6jY7qJFGoDwEYUHQFHImFFOQuZz9ZT+MwZe
 BNF+BfBFIlo4Kns46xzbsy85CdBQglGZBgfXth7fJjfE7NaeL3u0MmPw5
 T3l/jIBN3QON4afccghzjdJwUw79K6wWnWt/ebNA+5LZVl3+9KVXTXvxw
 QLxzK9f+kbKBz1JMnoGJN8s8s/qNm25NWjn3qO2SKwVqctuVqpl76/7nZ g==;
X-CSE-ConnectionGUID: eXkZXg2xTte/2Nv9Y6VcIA==
X-CSE-MsgGUID: aUAXa/xjQjyNBbfYw+2EZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3951298"
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="3951298"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 23:54:50 -0800
X-CSE-ConnectionGUID: BRFsG67gQYCBxavcMBdcgA==
X-CSE-MsgGUID: Z6+Jqpz+RkWMrHEQgyvTzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; d="scan'208";a="10454883"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 23:54:48 -0800
Date: Fri, 20 Nov 2026 08:54:46 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: sashiko-reviews@lists.linux.dev
Cc: Badal Nilawar <badal.nilawar@intel.com>, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH v8 2/3] drm/xe/xe_ras: Add support to retrieve info queue
 data
Message-ID: <av_8xkcebltpXt4H@black.igk.intel.com>
References: <20261120043303.107183-5-badal.nilawar@intel.com>
 <20261120043303.107183-7-badal.nilawar@intel.com>
 <sashiko-outbox-224467@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <sashiko-outbox-224467@kernel.org>
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 20, 2026 at 04:42:00AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] drm/xe/ras: assertion and 0-byte fetch in
>   get_remaining_chunks() when full
> --
> 
> commit 6c6fff86d117ac6d5e465e2c1c62372c93a7e520
> Author: Badal Nilawar <badal.nilawar@intel.com>
> 
> drm/xe/xe_ras: Add support to retrieve info queue data
> 
> This commit adds helpers and mailbox structures to retrieve RAS info queue
> data in chunks and assemble it into a flat buffer.
> 
> > diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> > index e8984c966876a..46542852e0552 100644
> > --- a/drivers/gpu/drm/xe/xe_ras.c
> > +++ b/drivers/gpu/drm/xe/xe_ras.c
> > @@ -1123,6 +1123,192 @@ int xe_ras_set_threshold(struct xe_device *xe, u8 severity, u8 component, u32 th
> 
> [ ... ]
> 
> > +static u32 get_remaining_chunks(struct xe_device *xe,
> > +				const struct xe_ras_get_counter_response *counter_resp,
> > +				u8 *dest_buf, u32 dest_size, u32 offset, u32 flags)
> > +{
> > +	u32 requests_left = XE_SYSCTRL_FLOOD_LIMIT * 2;
> > +	int ret;
> > +
> > +	while (flags & XE_RAS_INFO_QUEUE_FLAG_MORE_DATA) {
> > +		struct xe_ras_info_queue_data_request *qdata_req;
> > +		struct xe_ras_get_info_queue_response response = {};
> > +		struct xe_ras_get_info_queue_request request = {};
> > +		struct xe_ras_info_queue_header *hdr;
> > +
> > +		xe_assert(xe, offset < dest_size);
> > +
> > +		qdata_req = &request.qdata_req;
> > +		qdata_req->offset = offset;
> > +		qdata_req->size = min_t(u32, XE_RAS_INFO_QUEUE_MAX_CHUNK_SIZE, dest_size - offset);
> > +		qdata_req->session_id = counter_resp->counter;
> > +
> > +		ret = get_info_queue(xe, &request, &response);
> > +		if (ret) {
> > +			xe_err(xe, "[RAS]: info queue drain aborted: fetch at offset=%u, ret = %d\n",
> > +			       offset, ret);
> > +			return offset;
> > +		}
> > +
> > +		hdr = &response.qdata_resp.header;
> > +
> > +		if (!chunk_is_valid(hdr, offset, counter_resp->first.header.total_size,
> > +				    dest_size)) {
> > +			xe_warn(xe, "[RAS]: invalid info queue chunk (total=%u offset=%u size=%u, expected offset=%u)\n",
> > +				hdr->total_size, hdr->chunk_offset, hdr->chunk_size, offset);
> > +			return offset;
> > +		}
> > +
> > +		memcpy(dest_buf + offset, response.qdata_resp.data, hdr->chunk_size);
> > +		offset += hdr->chunk_size;
> > +		flags = hdr->flags;
> > +
> > +		if (!--requests_left) {
> > +			xe_warn(xe, "[RAS]: info queue flooding, aborted at offset=%u\n", offset);
> > +			break;
> > +		}
> > +	}
> 
> [Severity: Medium]
> Can get_remaining_chunks() trip xe_assert(xe, offset < dest_size) and issue
> a 0-byte GET_INFO_QUEUE request when dest_buf fills up while
> XE_RAS_INFO_QUEUE_FLAG_MORE_DATA is still set?

True, the assert should actually be

	xe_assert(xe, offset <= dest_size);

Raag
