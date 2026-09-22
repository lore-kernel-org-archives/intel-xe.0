Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68A5AC982FA
	for <intel-xe@archiver.kernel.org>; Tue, 22 Sep 2026 13:43:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B1A010ECCB;
	Tue, 22 Sep 2026 13:43:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FBCW2d/R";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A21A010ECCB;
 Tue, 22 Sep 2026 13:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790084586; x=1821620586;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=nf3U+HOtEsUXDvWg4ER9c+NBPHvl6dTKMKnT9lsX+CA=;
 b=FBCW2d/Rs5VWDoRs0pr6hCYrDc6nTYad+ZbTLqigAhl9MVtoW5V80MxZ
 Vj6kjGoIcbYzdcby9jPXfop11TUiBbV4tplj70lM98avC67kHX/qY7WEA
 cXtiYrCWCeZ7MdORU70xGUfQjZm2M7lbNNOTwWmDYba8tXphGB7higsJX
 EzUPBkYY5xon9mU4pDv2zENDu0xlslGYrfEv20cN4MFS4OpKA/u3+2eo1
 +hq0MIfnDz5yMtxcRcwsNCR5uJxg8JT4zgt3mtwMiF3MzgdApbsi5Nnnu
 CLo6bKVINJ8a6IN1LetakJcsx+TgCYFwzZa2HiDq1vVAckyN/HnQUHNsE Q==;
X-CSE-ConnectionGUID: K4dk/IgIR6eVddRAnIiapA==
X-CSE-MsgGUID: ArLYlhiHTdCnHFImZ+PR1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="90805117"
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; d="scan'208";a="90805117"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2026 06:43:06 -0700
X-CSE-ConnectionGUID: FRH+3ib4TV6mGhF/6XIWUg==
X-CSE-MsgGUID: vf24GCBiTJmCPw9c7IpFrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="4435553"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.71])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2026 06:43:05 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH v2] drm/i915/hdcp: switch to
 drm_dp_dpcd_{read_byte,read_data,write_data}()
In-Reply-To: <DS4PPFE901A304F108943697D7853999374E3832@DS4PPFE901A304F.namprd11.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <e168dad72f78fdb74419da94b0a38d732159fc82.1789547331.git.jani.nikula@intel.com>
 <20260921094103.701841-1-jani.nikula@intel.com>
 <DS4PPFE901A304F108943697D7853999374E3832@DS4PPFE901A304F.namprd11.prod.outlook.com>
Date: Tue, 22 Sep 2026 16:43:02 +0300
Message-ID: <a64d0bae43513a03528539bbf6cbcaa42c60acd5@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Tue, 22 Sep 2026, "Kandpal, Suraj" <suraj.kandpal@intel.com> wrote:
>> Subject: [PATCH v2] drm/i915/hdcp: switch to
>> drm_dp_dpcd_{read_byte,read_data,write_data}()
>> 
>> Switch to the modern DPCD access functions that return negative error codes on
>> errors, -EIO for incomplete access, and 0 on success.
>> 
>> This simplifies error handling all over the place. Convert the error logging to use
>> %pe and ERR_PTR() while at it.
>> 
>> Add comments to the read/write places that depend on the functions that return
>> the number of bytes read/written for incomplete access.
>> 
>> v2: return length from get_receiver_id_list_rx_info() (Sashiko)
>> 
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> LGTM,
> Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>

Thanks for the reviews, pushed the lot to drm-intel-next.

BR,
Jani.


-- 
Jani Nikula, Intel
