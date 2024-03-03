Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0051C54798
	for <intel-xe@archiver.kernel.org>; Sun,  3 Mar 2024 01:24:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89D9510E689;
	Sun,  3 Mar 2024 01:24:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZHzYRHG+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5664010E689
 for <intel-xe@lists.freedesktop.org>; Sun,  3 Mar 2024 01:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709429069; x=1740965069;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=y/rW8rxptyiZOhMeQyDb825rKj1Baer014/V81xzTJk=;
 b=ZHzYRHG+yqOHnZ0nu0WezbuVn+Uq6YXpvUvbrauNhAPbhZLFfXfs2e4Y
 NAQyR+qkFy8lc0MKulrYU0OD4FrbQCvV5oNZEKlYPmp6QX7IBGqPUA1P5
 qOn3GmbJmlJED86AO6O6ShLqC5utdtVjhEkTalz+mfyB0EBvP/BowhGeq
 YWCm2D0s6g/rSE1hwxKiOnSFcm1fOd9w/F7vb4W37Slvq1vHcW6gRBECq
 gdva6GSpLKj5N4hqN3sZx539ZP5EgBzly4b6HCJN7hCB2CB3LFuDqNeGu
 M/E14gPA8NY6DFJbUFrsgxZLPlD+zSzE0aAmOmLnqzbqRQUODghxjeEH8 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11001"; a="3835231"
X-IronPort-AV: E=Sophos;i="6.06,200,1705392000"; 
   d="scan'208";a="3835231"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2024 17:24:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,200,1705392000"; 
   d="scan'208";a="8972368"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2024 17:24:28 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org,
	Dafna Hirschfeld <dhirschfeld@habana.ai>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, ogabbay@kernel.org,
 obitton@habana.ai
Subject: Re: [PATCH v3] replace 'grouped target' in Makefile with pattern rule
Date: Sat,  2 Mar 2024 17:24:57 -0800
Message-ID: <170942908250.1403609.8407379332682369759.b4-ty@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240302153927.2602241-1-dhirschfeld@habana.ai>
References: <20240302153927.2602241-1-dhirschfeld@habana.ai>
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


On Sat, 02 Mar 2024 17:39:28 +0200, Dafna Hirschfeld wrote:
> Since 'grouped target' is used only in 'make' 4.3, it should
> be avoided. Replace it with 'multi-target pattern rule' which
> has the same behavior.
> 
> 

Applied, thanks!

[1/1] replace 'grouped target' in Makefile with pattern rule
      commit: be3939be12c3bdf83ca724aba936197cf1c13c61

Best regards,
-- 
Lucas De Marchi <lucas.demarchi@intel.com>
