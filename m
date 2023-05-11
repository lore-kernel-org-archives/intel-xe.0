Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52870C7EE26
	for <intel-xe@archiver.kernel.org>; Thu, 11 May 2023 12:33:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27BF910E0A4;
	Thu, 11 May 2023 12:33:35 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C238310E0A4
 for <intel-xe@lists.freedesktop.org>; Thu, 11 May 2023 12:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683808413; x=1715344413;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=HmjwlMd/zrnHPqjhw+Q3X0gZf3Gs2pMdOZWwwBuKoNk=;
 b=RIPA35nSJXAh5poXVHXMdWKXitNyv6zk3pTNIiwKIIKEC3lHm4PrGFOG
 GgLP5F6DtrxDYqm7iaeCBHuqKRDz69KBTWPuyYOg/e4yIdnm3PCnaBXyz
 NKWl4tsxf3pntP0J1uu7o2zmrEbG/cz3BbavCjQJx+mxBHKfcTqJtBgM7
 Scjs9kEj58jwPYSdnTmoLyEh+E2Nqp4F89TG3TlhqTA/E8+L7Zl2jOD32
 l/gFIslPBkBeum2zXokVy4sQOscxXmDMZfDBFuq2l+EtSprshAMHqD9XT
 bqfrZlLdTpAMJDcnpKVxUML64mkHGw/Ti1CQFqfsKPsZrAWl0HyIfzAng w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="334971286"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; d="scan'208";a="334971286"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2023 05:33:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="650154275"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; d="scan'208";a="650154275"
Received: from unknown (HELO localhost) ([10.237.66.162])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2023 05:33:31 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
In-Reply-To: <fliqzlotxeedvkcickrymodhpkh7sqheqy7pgzoyrfdcpzcv7q@a25nxqhm5fbe>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230510160220.714725-1-jani.nikula@intel.com>
 <fliqzlotxeedvkcickrymodhpkh7sqheqy7pgzoyrfdcpzcv7q@a25nxqhm5fbe>
Date: Thu, 11 May 2023 15:33:29 +0300
Message-ID: <87mt2bkpye.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Subject: Re: [Intel-xe] [PATCH] fixup! drm/xe/display: Add intel_pps support
 too
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
Cc: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, 10 May 2023, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
> On Wed, May 10, 2023 at 07:02:20PM +0300, Jani Nikula wrote:
>>This is an unrelated, unneeded change in "drm/xe/display: Add intel_pps
>>support too".
>>
>>After that gets applied, "drm/xe/display: Add intel_pps support too"
>>should itself be a fixup to "drm/xe/display: Implement display support".
>>
>>Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>
>
> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Thanks, pushed to drm-xe-next.

Rodrigo, what would be the best way to add a git rebase todo list for
you?


BR,
Jani.


>
> Lucas De Marchi
>
>>---
>> drivers/gpu/drm/i915/display/intel_pps.c | 2 +-
>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>
>>diff --git a/drivers/gpu/drm/i915/display/intel_pps.c b/drivers/gpu/drm/i915/display/intel_pps.c
>>index cfe40c64f6d4..c859b066e827 100644
>>--- a/drivers/gpu/drm/i915/display/intel_pps.c
>>+++ b/drivers/gpu/drm/i915/display/intel_pps.c
>>@@ -481,7 +481,7 @@ static void intel_pps_get_registers(struct intel_dp *intel_dp,
>> 				    struct pps_registers *regs)
>> {
>> 	struct drm_i915_private *dev_priv = dp_to_i915(intel_dp);
>>-	int pps_idx = 0;
>>+	int pps_idx;
>>
>> 	memset(regs, 0, sizeof(*regs));
>>
>>-- 
>>2.39.2
>>

-- 
Jani Nikula, Intel Open Source Graphics Center
