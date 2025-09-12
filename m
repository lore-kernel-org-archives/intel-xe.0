Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8D97CAC582
	for <intel-xe@archiver.kernel.org>; Fri, 12 Sep 2025 15:18:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FCDA10ECA4;
	Fri, 12 Sep 2025 15:18:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DTD+Kcwx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D7A210EC86
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Sep 2025 15:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757690283; x=1789226283;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YlARK8lHUrSaHl83yUknDEBFyqrLcqnf2zk42B/CrFY=;
 b=DTD+Kcwx9arTdmVFnmYHwq1+cocDVixgd69THA8kjN5BkvGDkCZMZ9TC
 COT5xmGqW4cCFwLWJkE5W5Gq/FRV0a39nAtev3GbQJR8GY+8PFGiMNKuG
 7RQ/kKmjgeV8KVhrl+vaOF9C6g40bMlrxmcywxjLDtZRqOadi+hFb7A6G
 pMpoHtI390rKwJZf+/bQHSrOAtXCU35mig6oLl0nWHNF3877kOSVjqXOc
 +KMEbPSxjgqiU5hNZ5zcTo3HRt0SpE4kejuc81mPV3/8IPfqiSFncmotJ
 0ANmn3zaSnlu7QuH84Q1jKipq6J7QY43XerQzkrvYGYy6CpPuard//oav Q==;
X-CSE-ConnectionGUID: gZF3BFtEQZ+zxdBRZDdvDQ==
X-CSE-MsgGUID: XsnIYYecQve/WbLgUS/ZkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11551"; a="70720285"
X-IronPort-AV: E=Sophos;i="6.18,259,1751266800"; d="scan'208";a="70720285"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2025 08:18:02 -0700
X-CSE-ConnectionGUID: 79uvt/m5QvWWsCf5u4KNjw==
X-CSE-MsgGUID: mf5/j2F5R8yr0MtpO5lKwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,259,1751266800"; d="scan'208";a="204982188"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2025 08:18:00 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org, Harish Chegondi <harish.chegondi@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Matt Atwood <matthew.s.atwood@intel.com>
Subject: Re: [PATCH v2 1/1] drm/xe/xe3: Extend Wa_18041344222 to graphics IP
 versions 30.00 and 30.01
Date: Fri, 12 Sep 2025 08:17:30 -0700
Message-ID: <175769022646.556603.5482486399607598031.b4-ty@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <7368f8059013424ac94f4a01c23f9c98a37b06dc.1757552915.git.harish.chegondi@intel.com>
References: <7368f8059013424ac94f4a01c23f9c98a37b06dc.1757552915.git.harish.chegondi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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

On Wed, 10 Sep 2025 18:27:41 -0700, Harish Chegondi wrote:
> Apply WA 18041344222 to Xe3 LPG graphics IP versions 30.00 and 30.01 too.
> 
> 

Merged to drm-xe-next, thanks!

[1/1] drm/xe/xe3: Extend Wa_18041344222 to graphics IP versions 30.00 and 30.01
      commit: 2a810401aa054513f8f740af5e381c9e4f651d0d

--
Lucas De Marchi

