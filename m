Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01DB1606A31A
	for <intel-xe@archiver.kernel.org>; Mon, 26 Oct 2026 11:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Eo31wzWZ
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAF7B10E035;
	Mon, 26 Oct 2026 11:48:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFBC210E035
 for <intel-xe@lists.freedesktop.org>; Mon, 26 Oct 2026 11:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793015281; x=1824551281;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=O785Oj3HyrQdd5DT+jQRBsv+lmkJonAGHT75EZJpY6o=;
 b=Eo31wzWZswDp0nY/4EVTYFENCz0G0UzqnYGmFODT0a4mj6EPkKFSfsC8
 9GU8YPJNNqjuL3bZ6VG2ThlTfFsEBxafuhztebRrWX4n5sd4uiQRFZfhB
 mWOMlNlAdL8fLDxhpnwBrNOStHFhiT3Ebn9R5QWn61RJ253VQzoq/jWJJ
 5aBFq3/sv79fCUBb4pO9Uy13GZOypc7suB2o7/zUUpcI+3xiVapV4wn5F
 Ae7uaZxO6sZUTNRsfbk98WGtMW4ZAvKHceLfaMo5x24msBJDdBD4J45ps
 OQFkj/XWNIH5A7zOx2PcGNZTHlgi7lyPXcK2tg4ObRFP7V6jqXgvamjba Q==;
X-CSE-ConnectionGUID: sJ3xpiOOS16agF8lh21tOw==
X-CSE-MsgGUID: yBxBb7ixQ6KGG3MAUe/olQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11946"; a="1570877"
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="1570877"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2026 04:48:00 -0700
X-CSE-ConnectionGUID: ZuUXIDiYTMO5dVcTNh6VGw==
X-CSE-MsgGUID: 4OnS2TzgTHe0F1LeGAK36Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="4303491"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa009.jf.intel.com with ESMTP; 26 Oct 2026 04:47:59 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
 id C740299; Mon, 26 Oct 2026 12:47:57 +0100 (CET)
Date: Mon, 26 Oct 2026 12:47:57 +0100
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: "Kumar G, Naresh" <naresh.kumar.g@intel.com>
Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Danilo Krummrich <dakr@kernel.org>,
 "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
Subject: Re: [PATCH] drm/xe/i2c: Fix use-after-free on driver unload
Message-ID: <at897eWTsL57jHR3@black.igk.intel.com>
References: <20261009164241.923756-2-balasubramani.vivekanandan@intel.com>
 <7939f69c-bc63-4465-a578-8024e20c4eb8@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7939f69c-bc63-4465-a578-8024e20c4eb8@intel.com>
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
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Oct 12, 2026 at 05:16:16PM +0530, Kumar G, Naresh wrote:
> Hi Bala,
> 
> I was investigating this issue earlier in sometime and found the root cause
> in software _node_notify_remove().
> 
> It is a kind of ownership bug in driver/base/swnode.c
> sofware_node_notify_remove(). when a manged swnode is mirrored onto a
> 
> second device(which is exactly what i2c-core does for the adapter's own
> struct device), the old code does an extra
> set_secondary_fwnode()/swnode_put()
> 
> for every device that tears down, not just the true owner. this is a
> double-release/UAF risk. The following fix solves the issue without changing
> i2c adapter registration flow.
> 
> The following code patch is suggested/provided to @heikki: waiting for his
> inputs on the same.

As I already explained you guys before, you don't need my ACK for
that. I have not input for it.

Br,

-- 
heikki
