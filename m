Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46144C27C65
	for <intel-xe@archiver.kernel.org>; Tue, 11 Jun 2024 16:19:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2B9610E69C;
	Tue, 11 Jun 2024 16:18:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SkhVUxF9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E34CA10E69C
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Jun 2024 16:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718122738; x=1749658738;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=dlfLF6KN8U9qSB2prOfnMRVbazxLydnO/FADjdb0FAw=;
 b=SkhVUxF9JrR2fb37UQrPIAJEZdbrcgsMaOE94S6veVJDlpnd53DOyPR/
 mUKjBv/Vu3nHeuN2fd9jj8buasMk9GN+nfzk6qraSmfacgw0lRbXjBg+M
 sgueCwqECwMAonRJOEqnpN7nFe8UOEcOEwXV8M28BK98DbhhI59TC4mRr
 v0almkjiJyeYvCrV5iwJJ/XNHQypRPiZ+3E71C20J47nDATO0FhrnzMJg
 s60Me+8kP21HB2tdoKGAkYeuB2Ivq5pvKhb4K+V0oZQLcIYpDvJR+Aue+
 Tls78YVbrwQ1i+AOdK/EhhFFecBha+gVHUdYSikmQ4OyWgCdOPj8aDgnE g==;
X-CSE-ConnectionGUID: gWvpU5pJTd6OKYv7EAQ+yA==
X-CSE-MsgGUID: Wfff/OCkT7udXOlJGaNhNg==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="18674657"
X-IronPort-AV: E=Sophos;i="6.08,230,1712646000"; d="scan'208";a="18674657"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 09:18:57 -0700
X-CSE-ConnectionGUID: wWMVXNslSZGU+EIZv+9mGg==
X-CSE-MsgGUID: JK11p9mISqejlpe9kxwObQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,230,1712646000"; d="scan'208";a="44037965"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa004.fm.intel.com with ESMTP; 11 Jun 2024 09:18:56 -0700
Received: from [10.94.248.185] (mwajdecz-MOBL.ger.corp.intel.com
 [10.94.248.185])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id DC7A233BF1;
 Tue, 11 Jun 2024 17:18:50 +0100 (IST)
Message-ID: <72811845-da48-49b2-b1a5-e6467c14c825@intel.com>
Date: Tue, 11 Jun 2024 18:18:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/xe/guc: Add kernel-doc for HXG Fast Request
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
References: <20240610120411.1768-1-michal.wajdeczko@intel.com>
 <20240610120411.1768-3-michal.wajdeczko@intel.com>
 <fqnvnnee7eytwa26gkz4znew6ijenvwa3bq3536o5gdbpy7z2j@ycm4zvdljnlp>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <fqnvnnee7eytwa26gkz4znew6ijenvwa3bq3536o5gdbpy7z2j@ycm4zvdljnlp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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



On 11.06.2024 17:09, Lucas De Marchi wrote:
> On Mon, Jun 10, 2024 at 02:04:11PM GMT, Michal Wajdeczko wrote:
>> We have kernel-doc for all HXG message types but Fast Request.
>>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> ---
>> drivers/gpu/drm/xe/abi/guc_messages_abi.h | 28 +++++++++++++++++++++++
>> 1 file changed, 28 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/abi/guc_messages_abi.h
>> b/drivers/gpu/drm/xe/abi/guc_messages_abi.h
>> index e32142e3fe41..f6ed4dfd215c 100644
>> --- a/drivers/gpu/drm/xe/abi/guc_messages_abi.h
>> +++ b/drivers/gpu/drm/xe/abi/guc_messages_abi.h
>> @@ -91,6 +91,34 @@
>> #define GUC_HXG_REQUEST_MSG_0_ACTION        (0xffffu << 0)
>> #define GUC_HXG_REQUEST_MSG_n_DATAn        GUC_HXG_MSG_n_PAYLOAD
>>
>> +/**
>> + * DOC: HXG Fast Request
>> + *
>> + * The `HXG Request`_ message should be used to initiate asynchronous
>> activity
> 
> I think you meant HXG Fast Request here.

oops, it was copy-pasted from i915 as-as and already pushed ;(

will sent fixup (including ones found while working on 134722)

> 
> Lucas De Marchi
> 
>> + * for which confirmation or return data is not expected.
>> + *
>> + * If confirmation is required then `HXG Request`_ shall be used
>> instead.
>> + *
>> + * The recipient of this message may only use `HXG Failure`_ message
>> if it was
>> + * unable to accept this request (like invalid data).
>> + *
>> + * Format of `HXG Fast Request`_ message is same as `HXG Request`_
>> except @TYPE.
>> + *
>> + * 
>> +---+-------+--------------------------------------------------------------+
>> + *  |   | Bits  |
>> Description                                                  |
>> + * 
>> +===+=======+==============================================================+
>> + *  | 0 |    31 | ORIGIN - see `HXG
>> Message`_                                  |
>> + *  |  
>> +-------+--------------------------------------------------------------+
>> + *  |   | 30:28 | TYPE =
>> `GUC_HXG_TYPE_FAST_REQUEST`_                          |
>> + *  |  
>> +-------+--------------------------------------------------------------+
>> + *  |   | 27:16 | DATA0 - see `HXG
>> Request`_                                   |
>> + *  |  
>> +-------+--------------------------------------------------------------+
>> + *  |   |  15:0 | ACTION - see `HXG
>> Request`_                                  |
>> + * 
>> +---+-------+--------------------------------------------------------------+
>> + *  |...|       | DATAn - see `HXG
>> Request`_                                   |
>> + * 
>> +---+-------+--------------------------------------------------------------+
>> + */
>> +
>> /**
>>  * DOC: HXG Event
>>  *
>> -- 
>> 2.43.0
>>
