Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F094CF31AF
	for <intel-xe@archiver.kernel.org>; Wed,  2 Oct 2024 10:16:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44F2D10E166;
	Wed,  2 Oct 2024 10:16:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E1iegvF1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C8E810E166
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Oct 2024 10:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727864179; x=1759400179;
 h=message-id:date:mime-version:subject:from:to:references:
 in-reply-to:content-transfer-encoding;
 bh=a77PiFxv/5B6xq7pzwne7ZZSLkCuTf2Fdbv5MK3wAp0=;
 b=E1iegvF1bkh4yiqM5FW8kPWFr2AyhyFFhz4dnh5KdU0J63YmJihl8/ej
 7T03xgIKZixZTzD3p7e2PsTnCefU5vL+Xh5I/8fQQsWP+V4V1flnlqPAw
 mfwCW6QBzx8wcWPGZN+bhiFtQAbKn+l1FbINscGwWMo+gYq5XJGxi8oaF
 q6fNVuZrqgdhU4fkYq3QxIJ+qDg7eY5HG8n0oVYwlmBkwCCDpQ5S8N7El
 rFideG4xaSSeJs13ovc+k8XXylMFIglJQKlTmr6jOguXwcFmP0Ct+kmDE
 UKOwpNT7KuTsHcpLz50rtNH0KHQ7pmWTuYk1rKn1a5/RhYwhkZ3ucAHGZ Q==;
X-CSE-ConnectionGUID: g0kr+8A7R0CDfNqxWnAq2A==
X-CSE-MsgGUID: /0OcCBYGRymkRvkFvcgfhg==
X-IronPort-AV: E=McAfee;i="6700,10204,11212"; a="37613983"
X-IronPort-AV: E=Sophos;i="6.11,171,1725346800"; d="scan'208";a="37613983"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2024 03:16:19 -0700
X-CSE-ConnectionGUID: y7AuWfU0QkS6SMpCktvFVA==
X-CSE-MsgGUID: BFvb9TtlTqqUEEFzmgBgDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,171,1725346800"; d="scan'208";a="78698460"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO [10.245.244.25])
 ([10.245.244.25])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2024 03:16:19 -0700
Message-ID: <a5254b5e-4355-4ec9-959b-c6c51f79be2b@intel.com>
Date: Wed, 2 Oct 2024 11:16:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] drm/xe: Move l2 flush to a more sensible place
From: Matthew Auld <matthew.auld@intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 intel-xe@lists.freedesktop.org
References: <20240918141817.99842-1-maarten.lankhorst@linux.intel.com>
 <6828c1f5-39db-42e2-8b23-f8c7a4a7f965@intel.com>
Content-Language: en-GB
In-Reply-To: <6828c1f5-39db-42e2-8b23-f8c7a4a7f965@intel.com>
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

On 18/09/2024 15:20, Matthew Auld wrote:
> On 18/09/2024 15:18, Maarten Lankhorst wrote:
>> Flushing l2 is only needed after all data has been written.
>>
>> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> Fixes: 01570b446939 ("drm/xe/bmg: implement Wa_16023588340")
>> Cc: Matthew Auld <matthew.auld@intel.com>
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>

Ping to push this?

> 
