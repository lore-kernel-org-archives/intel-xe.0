Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6692606A319
	for <intel-xe@archiver.kernel.org>; Thu, 22 Oct 2026 17:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IFk8OVIp
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C09010E44B;
	Thu, 22 Oct 2026 17:46:18 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 673A810E44B
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Oct 2026 17:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792691171; x=1824227171;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WPeHvIZ7KHt1jGSUtLr+ccf9UBJfzbMlGT3szMA5ruc=;
 b=IFk8OVIppfcdws8VFi2/047go5kTjwJxUhPy1UfXGh9fywrgnw2x4qWs
 /3CeIPmB73utqlIe3v/gW4y1mF+vgTxcIjh0ebba93gAyNyTArkTsPgq6
 Of+U9rINGhrkkUsBHpV4wTnS/cn81bzEbV6PSzasOYEdPZxrgJbNN9z/8
 9LqhtGZmgUKEFC/PcGhsQQCXQP5IdF2MWmxWJj3a0WNRxVbWHmzuX9rbs
 VrtxzJmLOJA0VhrTD4BLBU2F9y25LiyKuu+FCJzUhH0gZ4E/KdJEIqEKd
 xGzqUxKDcgRlZtwp+KVv/oiCoz5tkUqaWtEchY9M+On4tcKFCILDAFe0/ A==;
X-CSE-ConnectionGUID: PwwskxT+T3eTOuf2YIqwcg==
X-CSE-MsgGUID: mRZ+cdHjRgSvQZIX5q6Yvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1327112"
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="1327112"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 10:46:11 -0700
X-CSE-ConnectionGUID: 6x7R7BtuSJyZ+KQFDJnRxw==
X-CSE-MsgGUID: /YzKGp//RfawnHK0TiAgMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="3544971"
Received: from mdroper-desk1.fm.intel.com ([10.121.64.167])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 10:46:10 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org,
	Raag Jadav <raag.jadav@intel.com>
Cc: matthew.d.roper@intel.com
Subject: Re: [PATCH v14 0/9] Introduce xe_wedge
Date: Thu, 22 Oct 2026 10:45:18 -0700
Message-ID: <179269103857.500250.15593770103482553062.b4-ty@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261022051303.282805-1-raag.jadav@intel.com>
References: <20261022051303.282805-1-raag.jadav@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Thu, 22 Oct 2026 10:42:24 +0530, Raag Jadav wrote:
> In the history of xe technical debt, this series takes one more step and
> consolidates all wedging implementation into a dedicated xe_wedge component.
> 
> While at it, this fixes a few pre-existing issues related to wedge handling.
> Detailed description in commit message.
> 
>  v1: https://patchwork.freedesktop.org/series/172727/
> 
> [...]

Applied to drm-xe-next.  Thanks for the patches and reviews!

[1/9] drm/xe/gt: Use GT ordered workqueue for wedging
      commit: 913d394eb2be6536c66995affde44255d1e36493
[2/9] drm/xe: Drop xe_device_set_wedged_method()
      commit: 972234baa32845afe458fc547434c250035b5466
[3/9] drm/xe/hw_error: Guard csc_hw_error_work() with runtime PM
      commit: fc8d229d76102489b6f56538a818c285a87db1e9
[4/9] drm/xe: Move xe_device_wedged_fini() registration to xe_device_probe_early()
      commit: 6599a0eb0990cde96c4e66a4e1e2ae1b172e85d2
[5/9] drm/xe: Make xe_device_declare_wedged() IRQ safe
      commit: 49c00ef335741eb3c6ce21e49eb988a17cf2e62a
[6/9] drm/xe/pci_error: Flush GT wedge worker before bus reset
      commit: 0dbc1d0762bc89649aeaea98a63f6e5f786ea1b8
[7/9] drm/xe/amc: Guard xe_amc_work() with runtime PM
      commit: 5fb4aefb5f4baaa1cbec6c4cee0f91925b33f310
[8/9] drm/xe: Introduce xe_wedge
      commit: 82f813f7a0de8b8ed299df6bba13347175c4fa50
[9/9] drm/xe/ras: Move xe_ras_process_errors() to xe_ras
      commit: 84474fbf9ae5a0fe482aa81fd255f2ce247ab566


Matt

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation

