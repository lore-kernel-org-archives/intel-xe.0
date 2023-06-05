Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E4A6C77B73
	for <intel-xe@archiver.kernel.org>; Mon,  5 Jun 2023 16:24:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A58C10E1CB;
	Mon,  5 Jun 2023 16:24:34 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F5C410E1CB
 for <intel-xe@lists.freedesktop.org>; Mon,  5 Jun 2023 16:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685982272; x=1717518272;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=+bD82mH+xbNqHDQy3+1bgxCtRLsNRJbJ6/yOQq0maRc=;
 b=d12uksgtkBFYtq8kBze9dCh5TUicqqwDGIYtyN4IWMXiIQfpPQ5RoTSV
 ApZmu4FNLDwXCVBqsdnckqmjxHKC6R6XXuvLXrW/tSSWZ1yAIDUKBu3Zi
 SQp3eTQbXHvov2++mDGX5Bq/lFODcrC40ZnxgfLTI/OesLZFg5sl0Dqbd
 NbPYukmdDYAOUKIomG0xguHyaR+i3gNi7PYZZ3JQOo/Is80LaGajqBiGy
 Sg/z49SkU+HQWeKJuwSFVTZsPYovL9GDQwgVUnhunorzCvKmwOik3z4Bq
 EyXLtsc6KjHUZ8aWVLhHrzSwvaBQ5HFaDr6DJvGu5lQ79J6z4q5qb6rW9 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="419957352"
X-IronPort-AV: E=Sophos;i="6.00,217,1681196400"; d="scan'208";a="419957352"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2023 09:24:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="832866287"
X-IronPort-AV: E=Sophos;i="6.00,217,1681196400"; d="scan'208";a="832866287"
Received: from aukonwai-mobl1.ger.corp.intel.com (HELO [10.252.20.193])
 ([10.252.20.193])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2023 09:24:29 -0700
Message-ID: <cff3eda4-55e5-af69-04d8-2a47d1dd832f@intel.com>
Date: Mon, 5 Jun 2023 17:24:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.0
Content-Language: en-GB
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>,
 intel-xe@lists.freedesktop.org
References: <20230605161705.3680031-1-michael.j.ruhl@intel.com>
 <20230605161705.3680031-2-michael.j.ruhl@intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20230605161705.3680031-2-michael.j.ruhl@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH 1/1] drm/xe: REBAR resize should be best
 effort
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
Cc: lucas.demarchi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On 05/06/2023 17:17, Michael J. Ruhl wrote:
> The resizing of the PCI BAR is a best effort feature.  If it is
> not available, it should not fail the driver probe.
> 
> Rework the resize to not exit on failure.
> 
> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
