Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 624F5CCD1B3
	for <intel-xe@archiver.kernel.org>; Wed, 18 Sep 2024 14:28:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D7FA10E5B8;
	Wed, 18 Sep 2024 14:28:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dqi1U5ua";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CBB910E26C
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Sep 2024 14:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726669727; x=1758205727;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=0LnSHd6afS1EK5a2KUrZzYigOSdMDvKCs0FwNhK04e4=;
 b=dqi1U5uaaIJ/RTwjkEQNzful7cZcSxE3mqMqfyFJEjxPBY96R9fmtVKf
 /n/ilMkwhxKvRLoWlOVCKVL7VwbRNa3tOfT4oRK6hnT++mzFabBVCL/iV
 okmKnAwUntt9i20gZSkHol1hXxnbUqLdgmKVCx7yyRED37xUMs5PLN1h7
 03TxqXzbiUkN3PHwXrGSIGLPMSnKt7EIT9V/hvL9SybKApeotja3fX7vj
 WK0b5AoqtjbTCo558wVufJxtxt9eoOsN7VJU+I68E2dHRCpIuLWO9TxI9
 fb5NmXJFSn1v0JowPwyVFqTW54KVSqGTgbAi47Lt7VsMjzyUWU/VhretU g==;
X-CSE-ConnectionGUID: kFD8YOiNQpe+kZNe4zhuxg==
X-CSE-MsgGUID: qAXrvmS5She89Xc/Qa79Dg==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="29374620"
X-IronPort-AV: E=Sophos;i="6.10,239,1719903600"; d="scan'208";a="29374620"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2024 07:20:48 -0700
X-CSE-ConnectionGUID: 4cJEQao1TDiq+FCtTXQPkw==
X-CSE-MsgGUID: JOBjF/MuQnaRbNibvs2jvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,239,1719903600"; d="scan'208";a="73964291"
Received: from carterle-desk.ger.corp.intel.com (HELO [10.245.245.137])
 ([10.245.245.137])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2024 07:20:47 -0700
Message-ID: <6828c1f5-39db-42e2-8b23-f8c7a4a7f965@intel.com>
Date: Wed, 18 Sep 2024 15:20:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] drm/xe: Move l2 flush to a more sensible place
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 intel-xe@lists.freedesktop.org
References: <20240918141817.99842-1-maarten.lankhorst@linux.intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20240918141817.99842-1-maarten.lankhorst@linux.intel.com>
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

On 18/09/2024 15:18, Maarten Lankhorst wrote:
> Flushing l2 is only needed after all data has been written.
> 
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Fixes: 01570b446939 ("drm/xe/bmg: implement Wa_16023588340")
> Cc: Matthew Auld <matthew.auld@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>

