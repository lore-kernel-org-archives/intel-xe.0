Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43637E77198
	for <intel-xe@archiver.kernel.org>; Tue,  7 Jan 2025 17:05:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C09C010E756;
	Tue,  7 Jan 2025 17:05:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YEwiR5UR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9012010E754;
 Tue,  7 Jan 2025 17:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736269517; x=1767805517;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=ymTzUWjgm5IBUFPx4vwB6T+s1WsFt6vb1A0kl3VQvFI=;
 b=YEwiR5URXWbQI+FNFsPGd3Ux29HlqbTiAgLujjI0DZ1PMW4QthkRNI0d
 OnfrhT6aYZxWCYRdRqAaa+wlcCiAf+XN8Y2q7AB7+b3x6M23t8YthvpGW
 O9AfulozfTWWwAXn6DfuO7Sl75iN9Lyj2VmnIVmBNgmNpfP8S6RmkBKQo
 RYc6OuhaU4k1tqTQeeUjoduSPmZdTDT+Fk1IbhWTUaAMRP01YqMkF6nTm
 fIzX8awomqcTltbB7v4A8orLzgiDh4dkm1V6yMGPf18nyZUpeKgPHGXMg
 6Z05sKCxFn3jQOAHS+HF7EMWbYCIFV1xM7N/WxcivoSwMv8vZHcuF9AbX Q==;
X-CSE-ConnectionGUID: xY4a4UTOR4apZaLBPMlXJg==
X-CSE-MsgGUID: qXyPYu37RPajv2gRqV+vAQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="36684979"
X-IronPort-AV: E=Sophos;i="6.12,296,1728975600"; d="scan'208";a="36684979"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2025 09:05:16 -0800
X-CSE-ConnectionGUID: iY6F23etQE6QVXq4ZKvIgw==
X-CSE-MsgGUID: AMYDzYA9SAm2+GBK/CJ7kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,296,1728975600"; d="scan'208";a="107820622"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.85])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2025 09:05:13 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, imre.deak@intel.com, Lyude Paul <lyude@redhat.com>
Subject: Re: [PATCH v3 01/16] drm/mst: remove mgr parameter and debug
 logging from drm_dp_get_vc_payload_bw()
In-Reply-To: <20250107-classy-burrowing-kingfisher-a8a0d1@houat>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1735912293.git.jani.nikula@intel.com>
 <72d77e7a7fe69c784e9df048b7e6f250fd7599e4.1735912293.git.jani.nikula@intel.com>
 <875xmrlzhd.fsf@intel.com>
 <20250107-classy-burrowing-kingfisher-a8a0d1@houat>
Date: Tue, 07 Jan 2025 19:05:09 +0200
Message-ID: <87wmf6lflm.fsf@intel.com>
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

On Tue, 07 Jan 2025, Maxime Ripard <mripard@kernel.org> wrote:
> On Tue, Jan 07, 2025 at 11:55:42AM +0200, Jani Nikula wrote:
>> On Fri, 03 Jan 2025, Jani Nikula <jani.nikula@intel.com> wrote:
>> > The struct drm_dp_mst_topology_mgr *mgr parameter is only used for debug
>> > logging in case the passed in link rate or lane count are zero. There's
>> > no further error checking as such, and the function returns 0.
>> >
>> > There should be no case where the parameters are zero. The returned
>> > value is generally used as a divisor, and if we were hitting this, we'd
>> > be seeing division by zero.
>> >
>> > Just remove the debug logging altogether, along with the mgr parameter,
>> > so that the function can be used in non-MST contexts without the
>> > topology manager.
>> >
>> > v2: Also remove drm_dp_mst_helper_tests_init as unnecessary (Imre)
>> >
>> > Cc: Imre Deak <imre.deak@intel.com>
>> > Cc: Lyude Paul <lyude@redhat.com>
>> > Reviewed-by: Imre Deak <imre.deak@intel.com>
>> > Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> 
>> Maarten, Maxime, Thomas, ack for merging this via drm-intel along with
>> the rest of the series?
>
> Ack

Thanks, pushed via drm-intel-next with Maxime's ack and Thomas' IRC ack.

BR,
Jani.

-- 
Jani Nikula, Intel
