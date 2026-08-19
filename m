Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22792C5DF6D
	for <intel-xe@archiver.kernel.org>; Wed, 19 Aug 2026 13:23:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9E3789D9A;
	Wed, 19 Aug 2026 13:23:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KhYU36Nj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C423089D9A
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Aug 2026 13:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787145792; x=1818681792;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=dTzHWbTe9FDbD7ibyy+/YCTJ1VfrCMm63S6eifvrxuM=;
 b=KhYU36NjvU6vVUATaffxN+Zs8StS2fL3z+PKtbk2WBSfsT5pkowuhQk7
 81EAfA/8nq0ZogEhTRrguJX+/iZtj2qodBEqUHpBc4NR/Yi4wi42tmkkR
 M7lS9F75/xyYSqfpUh0R/7wUWKamlmBdGvfNE6taIH0n50+3ni6PFhQih
 Tqw41imaRR/WFAHx35py56wbHpSjFHqmfdcQpavV1O464PKCzCNXi+R1D
 Mlx5ueVFvQ2fOVe+yr5587ma8kVMi/rPZ7yABWc8NQqwMbbvutvG5CG/r
 uiPVCrvnllJRTLgWCk9Ava8PS6qjdvpdKYFrydvH0hJWeWcMhBvWfz9tg w==;
X-CSE-ConnectionGUID: tt8RTfXZRnO6p8uZdAYEvw==
X-CSE-MsgGUID: I/UZ6Wv2RG2fNXG0A+jI6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="91469277"
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; d="scan'208";a="91469277"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2026 06:23:11 -0700
X-CSE-ConnectionGUID: uZt21w1iRS6KG/n7OcAFCA==
X-CSE-MsgGUID: 7iIRDqnQTbOBFmDybS+MxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; d="scan'208";a="265573202"
Received: from inaky-mobl1.amr.corp.intel.com (HELO [10.245.244.176])
 ([10.245.244.176])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2026 06:23:11 -0700
Message-ID: <e377a167-32ac-4912-a1b0-4fe74e9f6230@intel.com>
Date: Wed, 19 Aug 2026 14:23:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] Revert "drm/xe/nvlp: Implement Wa_14026539277"
To: Gustavo Sousa <gustavo.sousa@intel.com>, intel-xe@lists.freedesktop.org
References: <20260724-wa_14026539277-v2-0-ad786cc6ba1e@intel.com>
 <20260724-wa_14026539277-v2-2-ad786cc6ba1e@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20260724-wa_14026539277-v2-2-ad786cc6ba1e@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 24/07/2026 22:44, Gustavo Sousa wrote:
> This reverts commit 0919b266456d81e71277c5963d4e806e85b65232.
> 
> The definition of Wa_14026539277 has been updated in the workaround
> database and requires a different implementation.  So let's revert the
> current implementation; a follow-up change will add the proper
> handling for this workaround.
> 
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>

Reviewed-by: Matthew Auld <matthew.auld@intel.com>

