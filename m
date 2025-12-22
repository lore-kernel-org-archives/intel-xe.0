Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 851FFE6749C
	for <intel-xe@archiver.kernel.org>; Mon, 22 Dec 2025 12:42:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44A1010E635;
	Mon, 22 Dec 2025 12:42:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZN7AlQrV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0A6E10E635
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Dec 2025 12:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766407331; x=1797943331;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=/cTUekp/lYyPN06c993ZqZi30huibGOvzEXEFtMn6GY=;
 b=ZN7AlQrVTt+5AC3dmCrmGXAtnoqmBjAaO1Vqeo4VBxITJdhEeuj8xEgt
 2zmFmJWIgE9iIiF/1TvKbjSZZHpplAwHOWtuxZEcIJxQw8Qe0KZiYQz6O
 2/E6jzQ/FL8TrxGzFdcVETV22ElLprIHrf2V3QP3ttcsL8Jq5LbzKBsqN
 1h7s5t62Jednpmw9a4HC7QZBm9834w0DYaHD5viGceTehgdsIPDZ2yzBR
 YoqSSzEHixE6dHNnzvu0HT4k9x1bLnUAlFDB3RXCB5nkQvoZRz5mgaifp
 l/PY8h4iljqFXBE2Y/JstXP7khCQ6JwmI8y+X0oKrUOs7EkmSohqFfS89 Q==;
X-CSE-ConnectionGUID: 64Dyxzd9QAiQkP4WGatghQ==
X-CSE-MsgGUID: e5PONwpKShypgXb4DnwcLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="68142936"
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; d="scan'208";a="68142936"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2025 04:42:10 -0800
X-CSE-ConnectionGUID: 272WHt5oTZKTx8GkWvIwbA==
X-CSE-MsgGUID: z2LymzXMT0CxmRDEjw6a/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; d="scan'208";a="199431564"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.79])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2025 04:42:09 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, Riana Tauro <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 matthew.d.roper@intel.com
Subject: Re: [PATCH] drm/xe: select CONFIGFS_FS dependency
In-Reply-To: <aUV3dk3wUpf7U6tP@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20251219080513.848072-2-riana.tauro@intel.com>
 <aUV3dk3wUpf7U6tP@intel.com>
Date: Mon, 22 Dec 2025 14:42:05 +0200
Message-ID: <a4928fe2e89de39161f8b794e798998a3fbebdd1@intel.com>
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

On Fri, 19 Dec 2025, Rodrigo Vivi <rodrigo.vivi@intel.com> wrote:
> On Fri, Dec 19, 2025 at 01:35:14PM +0530, Riana Tauro wrote:
>> Xe driver uses configfs functions to expose configuration to userspace.
>> If CONFIGFS_FS is built as module (=m) when Xe is built-in (=y),
>> undefined reference errors occur.
>
> Perhaps we don't need  this middle phrase. Only the first and the last.
> But anyway, we need the patch in. I just pushed it.

I think the correct fix to this one would've been

	depends on CONFIGFS_FS || CONFIGFS_FS=n

BR,
Jani.

>
> Thanks,
> Rodrigo.
>
>> Add select CONFIGFS_FS to ensure configfs is built at minimum required
>> level.
>> 
>> Cc: Matt Roper <matthew.d.roper@intel.com>
>> Reported-by: kernel test robot <lkp@intel.com>
>> Closes: https://lore.kernel.org/oe-kbuild-all/202512190827.IeXYj4qg-lkp@intel.com/
>> Closes: https://lore.kernel.org/oe-kbuild-all/202512181854.hPyTAXc5-lkp@intel.com/
>> Closes: https://lore.kernel.org/oe-kbuild-all/202512190407.CcUFXX2F-lkp@intel.com/
>> Fixes: 16280ded45fb ("drm/xe: Add configfs to enable survivability mode")
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>>  drivers/gpu/drm/xe/Kconfig | 1 +
>>  1 file changed, 1 insertion(+)
>> 
>> diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
>> index 4b288eb3f5b0..1094c5fc5bdf 100644
>> --- a/drivers/gpu/drm/xe/Kconfig
>> +++ b/drivers/gpu/drm/xe/Kconfig
>> @@ -46,6 +46,7 @@ config DRM_XE
>>  	select WANT_DEV_COREDUMP
>>  	select AUXILIARY_BUS
>>  	select REGMAP if I2C
>> +	select CONFIGFS_FS
>>  	help
>>  	  Driver for Intel Xe2 series GPUs and later. Experimental support
>>  	  for Xe series is also available.
>> -- 
>> 2.47.1
>> 

-- 
Jani Nikula, Intel
