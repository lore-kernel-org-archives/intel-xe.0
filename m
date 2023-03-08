Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 623BBC678D5
	for <intel-xe@archiver.kernel.org>; Wed,  8 Mar 2023 08:09:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECC6510E5A9;
	Wed,  8 Mar 2023 08:09:35 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C89C110E5A9
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Mar 2023 08:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678262974; x=1709798974;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=V3w0shFIPR11J1Pnyg06ElaAMpMqwhq2k3RhLuLgEpA=;
 b=dT53dXGllMzHJyy1I4qxKZIwQMOfWmz3hDgEJ0F+pH1Evz8JPmQrdfNx
 b8Y4IS9ALSP+v7oc2eWoX/c4vAw8t8TQ++mq+nrAasdrcoG0Sb17tjoH1
 25b2SM/wnxCJ5w5TP1IIkiLPlJ/7sH8CANSsbYg26s6Nw+a7Weojsy/jG
 yPHarUbLa1T93oRNz2e0IFyvJSd88HxbztsCsNbe5SpkiLKrmhpJZ/5vL
 K19PA2JZNr0V8xz3/wOVeeX7ad11tZQdZbi9P8zLfcOrh3S3Npj1KKIag
 J89uxqXSKkz1IZlA36d+KS19dpq6IfuH9NaYkCdZxbfSHj8RvzFuPwk95 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="333567509"
X-IronPort-AV: E=Sophos;i="5.98,243,1673942400"; d="scan'208";a="333567509"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2023 00:09:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="922694189"
X-IronPort-AV: E=Sophos;i="5.98,243,1673942400"; d="scan'208";a="922694189"
Received: from rgoettsc-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.47.172])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2023 00:09:32 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <167823854624.1367036.8213075220868814471.b4-ty@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230303105222.3550161-1-jani.nikula@intel.com>
 <167823854624.1367036.8213075220868814471.b4-ty@intel.com>
Date: Wed, 08 Mar 2023 10:09:29 +0200
Message-ID: <87edpzd5qe.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Subject: Re: [Intel-xe] [PATCH v2 0/8] drm/xe: clean up i915 includes both
 sides
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, 07 Mar 2023, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
> On Fri, 3 Mar 2023 12:52:14 +0200, Jani Nikula wrote:
>> v2 of https://patchwork.freedesktop.org/series/114573/
>> 
>> Jani Nikula (8):
>>   drm/i915/display: don't use relative ../i915 includes
>>   drm/i915/display: drop redundant display/ from includes
>>   drm/xe: drop unnecessary include
>>   drm/xe: drop redundant display/ from includes
>>   drm/xe: drop redundant ../ from includes
>>   drm/xe: move all top level i915 compat headers to a separate
>>     subdirectory
>>   drm/xe: remove unnecessary include
>>   drm/xe: drop top level i915 from include path
>> 
>> [...]
>
> CI failures seem totally unrelated, with build failing in paths that don't
> exist. Tested it locally on DG2 without (new) issues.
>
> Applied, thanks!

Oh, nice surprise, thanks!

BR,
Jani.


>
>
> [1/8] drm/i915/display: don't use relative ../i915 includes
>       commit: 7427e6efafe5d27b61c874d601b9777d2c3d22be
> [2/8] drm/i915/display: drop redundant display/ from includes
>       commit: 8125838bb041c99c44c7a1a9c835f3e8b5ba0872
> [3/8] drm/xe: drop unnecessary include
>       commit: 4c49d3819590d7d4f47063060eb9c67b1a2413db
> [4/8] drm/xe: drop redundant display/ from includes
>       commit: cda2426139690947b709afe5328e2b566a27ccae
> [5/8] drm/xe: drop redundant ../ from includes
>       commit: ff19a0d7bade988ac8bb45d2b22b4e9777694a7a
> [6/8] drm/xe: move all top level i915 compat headers to a separate subdirectory
>       commit: d718a268655a51169764d7a9faf9fb34be53372c
> [7/8] drm/xe: remove unnecessary include
>       commit: e411806284d177358c9ba7f33346fa8a9641490c
> [8/8] drm/xe: drop top level i915 from include path
>       commit: c60ca5493bbb5dc134b93331a111445e945a1521
>
> Best regards,

-- 
Jani Nikula, Intel Open Source Graphics Center
