Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 305CEEB64D9
	for <intel-xe@archiver.kernel.org>; Thu, 29 Jun 2023 08:07:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7F0E10E3BC;
	Thu, 29 Jun 2023 08:07:36 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9DDD10E3BC
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Jun 2023 08:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688026054; x=1719562054;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=7J2NusFTeXuKUtjjHGpbFisKHFN9iwb+8HPCYFX3vlY=;
 b=NcmSHnIJCgMQKCa1j4Y0JQJTOalR1CwmbuGmgG6zYPuMkpf6lchcG9kb
 nPeYQWROXKz2XnRJhG1rOO68HCO7PEf+hbxq76vpRt3RIzU6kdz/EbY/4
 3lQMxmCpDPjvxgy0pTaNyYk1W/SzMa81ZRYg0j6f4MPjmK81nftGknX66
 Rm49d0jnmeaMKmGnc7a+WNEKfO8MH3LlkJyhZ3sbrTNSCYoZe5t5ZexAl
 WP2kM+8DsCqiaTobk3n9n1FOlmW9GoCjxp7H3/n/pT4Nmvq3PzyRjxAOP
 qFKZfRKIpC0o4sqQevR3+Kxkyt3aDz/pOGUMUGGqHYvwDWp9X8zAML2BA A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="392772530"
X-IronPort-AV: E=Sophos;i="6.01,168,1684825200"; d="scan'208";a="392772530"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2023 01:07:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="746941669"
X-IronPort-AV: E=Sophos;i="6.01,168,1684825200"; d="scan'208";a="746941669"
Received: from gyorgysx-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.63.135])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2023 01:07:31 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: "Knop, Ryszard" <ryszard.knop@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "De
 Marchi, Lucas" <lucas.demarchi@intel.com>
In-Reply-To: <56dbc1319cd4497ef88368539f7d0ee4d5da7185.camel@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230627102223.260893-1-jani.nikula@intel.com>
 <168786504446.2457.9445918478693831865@emeril.freedesktop.org>
 <daevz6hon5xabm72wzyw3ztzihtdrveaxehe5bdgoo5qacd5dm@xfu24obyt4ev>
 <56dbc1319cd4497ef88368539f7d0ee4d5da7185.camel@intel.com>
Date: Thu, 29 Jun 2023 11:07:12 +0300
Message-ID: <87jzvmsndb.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Subject: Re: [Intel-xe] 
 =?utf-8?q?=E2=9C=97_CI=2Echecksparse=3A_warning_for_x?=
 =?utf-8?q?e_=26_i915_display_integration=2C_display_irqs?=
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

On Wed, 28 Jun 2023, "Knop, Ryszard" <ryszard.knop@intel.com> wrote:
> On Tue, 2023-06-27 at 12:51 -0300, Lucas De Marchi wrote:
>> On Tue, Jun 27, 2023 at 11:24:04AM -0000, Patchwork wrote:
>> > == Series Details ==
>> >
>> > Series: xe & i915 display integration, display irqs
>> > URL   : https://patchwork.freedesktop.org/series/119909/
>> > State : warning
>> >
>> > == Summary ==
>> >
>> > + trap cleanup EXIT
>> > + KERNEL=/kernel
>> > + MT=/root/linux/maintainer-tools
>> > + git clone https://gitlab.freedesktop.org/drm/maintainer-tools /root/linux/maintainer-tools
>> > Cloning into '/root/linux/maintainer-tools'...
>> > warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
>>
>> is the warning because of this redirect?
>
> No, checkpatch/checksparse stages report a warning when "dim sparse" or
> "dim checkpatch" return code != 0.

Now that you're here...

The CI results for xe are different from i915. I have no idea how many
tests there are, and what results I still have to wait for, if any,
before applying.

The result mails or pages don't say where we are, e.g. test 3/6, or what
is still pending.


BR,
Jani.

>
> Ryszard
>
>>
>> Lucas De Marchi
>>
>> > + make -C /root/linux/maintainer-tools
>> > make: Entering directory '/root/linux/maintainer-tools'
>> > cc -O2 -g -Wextra -o remap-log remap-log.c
>> > make: Leaving directory '/root/linux/maintainer-tools'
>> > + cd /kernel
>> > + git config --global --add safe.directory /kernel
>> > + /root/linux/maintainer-tools/dim sparse --fast f135580b567158b23349db5544259730dfb91e78
>> > Sparse version: 0.6.1 (Ubuntu: 0.6.1-2build1)
>> > Fast mode used, each commit won't be checked separately.
>> > + cleanup
>> > ++ stat -c %u:%g /kernel
>> > + chown -R 1003:1003 /kernel
>> >
>> >

-- 
Jani Nikula, Intel Open Source Graphics Center
