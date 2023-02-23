Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09329C636D6
	for <intel-xe@archiver.kernel.org>; Thu, 23 Feb 2023 10:17:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5C6010E03C;
	Thu, 23 Feb 2023 10:17:02 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1DF510E03C
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Feb 2023 10:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677147420; x=1708683420;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=KtvxBy/KCNCAtLWUXv6BdXFOB6A3YpqF6auowENBJEk=;
 b=K8fL4prpVArNxy3W7NNRiD7XS7Oy04S9z2/RckNi1EpPvZgapdio3nKz
 0XMlx9W6kTA3VLQidOa78vtuP66jUv4m1uKq/IRqX44erpzOQ5KNMiWna
 EETPIItb8BGDYK0Pd9xfUdg3y0qVa64r6QohFG0n2Um4ugLyTGV4fZMRE
 X22jT0MURESmWKsgGPOertcjn8tzFaMUWNWsbaAf5yrsde8inAnVAPZFz
 6cql39JYL/7nCU/fUaFeXy7ZoEcEP90iadUrchD5R4tFvdJ6aYaohhnxz
 +W26UhGaC0Na38UCNuJqMtp6TTEJZeLLewJRBHzKtVS4m84S0CBY9rA14 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10629"; a="397867547"
X-IronPort-AV: E=Sophos;i="5.97,320,1669104000"; d="scan'208";a="397867547"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2023 02:17:00 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10629"; a="796251798"
X-IronPort-AV: E=Sophos;i="5.97,320,1669104000"; d="scan'208";a="796251798"
Received: from pwozniak-mobl1.ger.corp.intel.com (HELO [10.252.9.210])
 ([10.252.9.210])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2023 02:16:59 -0800
Message-ID: <d2aeae69-95f1-1576-9dbd-71d48e8562e3@intel.com>
Date: Thu, 23 Feb 2023 10:16:56 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.8.0
To: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
References: <20230223050035.1009541-1-lucas.demarchi@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20230223050035.1009541-1-lucas.demarchi@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH] drm/xe: Fix kunit integration due to missing
 prototypes
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

On 23/02/2023 05:00, Lucas De Marchi wrote:
> In order to avoid  -Werror=missing-prototypes, add the prototypes
> in a separate tests/<test-name>_test.h file that is included by both
> the implementation (tests/xe_<testname>.c, injected in xe.ko) and the
> kunit module (tests/xe_<testname>_test.c -> xe-<testname>-test.ko).
> 
> v2: Add header and don't add ifdef to files that are already not built
> when not using kunit (Matt Auld)
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
