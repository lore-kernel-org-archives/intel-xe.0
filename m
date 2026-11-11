Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF342606A321
	for <intel-xe@archiver.kernel.org>; Wed, 11 Nov 2026 12:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GQg4JEbH
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A971A10FB46;
	Wed, 11 Nov 2026 12:28:19 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2E9C10FAFD;
 Wed, 11 Nov 2026 12:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794400093; x=1825936093;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6wpkx329J8RO6rYVrz+fz1PzztfS7kOeZIvkFPNq7GA=;
 b=GQg4JEbHAVgwXd6+k4WmKzETmyJufsgXTdysAGET6A/4INwIxtXE+Kjp
 TGSQRSk9FlO4hKnZht2fMHJugxrfGDNr7j13xiemWjqlIKYCoJbvngMxY
 LM7X9F0toi318W14jxTgzuDthZCh2y2obw8Lgh4vPAMe4mA/NUm1wd6Vb
 f+JMXpAivYU0FDfmlRe5I3jfGBmXE5+SXQpusCLcaAYcMbGU4Wj86lUKP
 7q74FAWnUC6E4JnsZqlTu/Hy5NJXlqI//9y0E3gAZvE7I8ziYZNpHi9Vo
 dkZWnrdb2wS2VrcY79EDSYsylUWDx0sVoPXbhmT9uBnI+rxhPIs1+989L A==;
X-CSE-ConnectionGUID: KPVvchFCSIiosTR/TKavvQ==
X-CSE-MsgGUID: 24FrgUFzTKyP/Mp13774/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="3203149"
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="3203149"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2026 04:28:12 -0800
X-CSE-ConnectionGUID: DE+AkHrpTUWkUN1liNni4w==
X-CSE-MsgGUID: 6sMpEePiQyC74b7yyWbz9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="8326792"
Received: from xiaolu.sh.intel.com ([10.239.146.103])
 by orviesa007.jf.intel.com with ESMTP; 11 Nov 2026 04:28:11 -0800
From: Xiao Lu <xiaolu.xie@intel.com>
To: ville.syrjala@linux.intel.com
Cc: chaitanya.kumar.borah@intel.com, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, ankit.k.nautiyal@intel.com,
 suraj.kandpal@intel.com, Xiao Lu <xiaolu.xie@intel.com>
Subject: Re: [PATCH] drm/i915/dip: Write the DIP header last with SDP
 transmission lines
Date: Wed, 11 Nov 2026 20:26:02 +0800
Message-ID: <20261111122602.80325-1-xiaolu.xie@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261111121653.79410-1-xiaolu.xie@intel.com>
References: <20261111121653.79410-1-xiaolu.xie@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
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
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Ville,

Adding you, as you reviewed this patch and I missed you on the Cc list of
my mail below.

On Wed, 11 Nov 2026 12:16:53, Xiao Lu wrote:
> VSC_SELECT is a two bit field (VSC_SELECT_MASK), so a stale value is not
> replaced but merged with the new one, e.g. 1 | 2 results in 3. We clear the
> field before setting it, and also clear it in intel_dp_set_infoframes()
> when the SDPs get disabled.
>
> Was leaving that out intentional, e.g. because the field is guaranteed to be
> clear at that point, or is it something that was missed?

hsw_write_infoframe() ORs VSC_DIP_HW_DATA_SW_HEA into VIDEO_DIP_CTL for the
VSC SDP without clearing VSC_SELECT first. Do you know if that needs
clearing, or is the field known to be clear there? If it does, I can send it
as a separate patch on top of Chaitanya's.
