Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7764A606A31A
	for <intel-xe@archiver.kernel.org>; Mon, 23 Nov 2026 10:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ioVh/i6f
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38DBB10E04B;
	Mon, 23 Nov 2026 10:44:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7604E10E04B
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Nov 2026 10:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795430642; x=1826966642;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=6bq+P0iSuuSTJjtVd3jT4CRKc0QAjm0d1CQdq2BZNn8=;
 b=ioVh/i6f5gt1a9hJMUt7SbjQL9fU5/mh5S1KpWU228rpp8kbgHO3i+tE
 jKGHOBDtwjRpCrjv6BMrTRz4Oz4qWl77xp0QL8HEBW2pkcQ0uWmL2gayG
 /3gDnzx70lsgVL2ZbZFm1Rievz49CMI4ZAHNdEiT0J6qXfnGhs1zxkqBO
 dYgzd0xZ9jKkVSHMDvT0FI2NfR6rJ8U6+gJP3ovYPTIOwNVA5wxvwWp3/
 EaItQTFhMDe7qH2FT8Bq2Kh0qI9j2VrTyRKF1lTjFXt+Jhi0IblldiyMn
 pXIma2PbbrzzZEg2UMu11TZ9kMqLfDdz+LfCpLkl+IIhamJdyaZZPyMYZ g==;
X-CSE-ConnectionGUID: gDeGHvR8QimLZJvURiELSg==
X-CSE-MsgGUID: 9+calQK3T/ySC6v4lO1WKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4117983"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4117983"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 02:44:01 -0800
X-CSE-ConnectionGUID: O3jbDRjDRq6L26xoFNZ7HQ==
X-CSE-MsgGUID: TEXhmQNBRCaTySfXDpXeOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; d="scan'208";a="13069925"
Received: from soc-5cg43972f8.clients.intel.com (HELO [172.28.182.154])
 ([172.28.182.154])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 02:44:00 -0800
Message-ID: <e17a9676-d10b-45af-9a90-329235dc558f@linux.intel.com>
Date: Mon, 23 Nov 2026 11:43:58 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/2] Prepare VFs enabling for VGPU profiles
To: =?UTF-8?Q?Pi=C3=B3rkowski=2C_Piotr?= <piotr.piorkowski@intel.com>,
 intel-xe@lists.freedesktop.org
References: <20261123094607.3300722-1-piotr.piorkowski@intel.com>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20261123094607.3300722-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 11/23/2026 10:46 AM, Piórkowski, Piotr wrote:
> From: Piotr Piórkowski <piotr.piorkowski@intel.com>
>
> Split pf_enable_vfs() into prepare, provision and commit steps,
> so the upcoming VGPU profiles code can reuse it with its own
> provisioning step. Error handling stays the same.
The current error path misses xe_sriov_pf_reprovision_default(), leaving
the PF with fair-sched EQ/PT after a failed VFs enabling. I posted a fix
for that some time ago:

https://lore.kernel.org/all/20260806095046.1360538-1-marcin.bernatowicz@linux.intel.com/

As it's a fix (Fixes: afc480ff55c5), could it go in first and this
series be rebased on top? Alternatively I can resend it on top of this
series, or you can pick it up as 1/3.

--
marcin
>
> Michal Wajdeczko (2):
>    drm/xe/pf: Extract VFs enabling revert helper
>    drm/xe/pf: Split VFs enabling into prepare and commit steps
>
>   drivers/gpu/drm/xe/xe_pci_sriov.c | 93 ++++++++++++++++++++-----------
>   1 file changed, 60 insertions(+), 33 deletions(-)
>
