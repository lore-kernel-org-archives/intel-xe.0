Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D080C83F33
	for <intel-xe@archiver.kernel.org>; Tue,  5 Sep 2023 12:43:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18C8F10E4D5;
	Tue,  5 Sep 2023 12:43:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58FD610E4D5;
 Tue,  5 Sep 2023 12:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693917786; x=1725453786;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=yuqfW6KMONGTZx0VrGCYvcb9sS/O7YkdSF45EMmz/y0=;
 b=NK0R32wjLe+8LOlovpa2MxxQ5p+0psIISdfAXQqxg1We2bYvv29hiABG
 eLlDlpRhCptMtIBdZ56LEEHMoD/kx+0gfcZU6FazVUuX9/hfD0mBBm64U
 lzKnh52B1qEO+bMGIwFSRcuwzpjARvmLfS9OuJeBtDurrZy5J1i+Dc+rR
 H6RQsGR/3NgzL/Thq4493HG3xmaRm7jM3lkMoObk0uRvbq+ECkbDHt5am
 C2HkpycvanUkTyIzBnJKiNgwalF8aTvrvxExoZnNwAlQYE9RKYVY4txZl
 pyaYkeegBE7iPoJZEmbwWkqohiAgQWW2QCor0gcLsUs8K5Eb6VqMyHAV8 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10823"; a="375674148"
X-IronPort-AV: E=Sophos;i="6.02,229,1688454000"; d="scan'208";a="375674148"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2023 05:43:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10823"; a="831235171"
X-IronPort-AV: E=Sophos;i="6.02,229,1688454000"; d="scan'208";a="831235171"
Received: from chenxi4-mobl1.ccr.corp.intel.com (HELO [10.249.254.154])
 ([10.249.254.154])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2023 05:43:03 -0700
Message-ID: <0cb8a51c-a1a8-ba03-03b1-8cdabade0353@linux.intel.com>
Date: Tue, 5 Sep 2023 14:43:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Maxime Ripard <mripard@kernel.org>
References: <20230905085832.2103-1-thomas.hellstrom@linux.intel.com>
 <20230905085832.2103-2-thomas.hellstrom@linux.intel.com>
 <efarj6smmvuqlredgy5aelgvm43xovnqo5fywsindq3bhggvul@3rqq27vmatcm>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <efarj6smmvuqlredgy5aelgvm43xovnqo5fywsindq3bhggvul@3rqq27vmatcm>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH 1/3] drm/kunit: Avoid a driver uaf
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
Cc: Daniel Vetter <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hi maxime,

On 9/5/23 14:06, Maxime Ripard wrote:
> On Tue, Sep 05, 2023 at 10:58:30AM +0200, Thomas Hellström wrote:
>> when using __drm_kunit_helper_alloc_drm_device() the driver may be
>> dereferenced by device-managed resources up until the device is
>> freed, which is typically later than the kunit-managed resource code
>> frees it.
> I'd like to have a bit more context on how a driver can end up in that
> situation?

I interpret the attached traces as follows.

INIT:

Code allocates a struct device as a kunit-managed resource.
Code allocates a drm driver as a kunit-managed resource.
Code allocates a drm device as a device-managed resource.

EXIT:

Kunit resource cleanup frees the drm driver
Kunit resource cleanup frees the struct device, which starts a 
device-managed resource cleanup
device-managed cleanup calls drm_dev_put()
drm_dev_put() dereferences the (now freed) drm driver -> Boom.

It should be sufficient to enable KASAN and run the drm_exec_test kunit 
test to trigger this.

Thanks,
Thomas


>
> Maxime
