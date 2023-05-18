Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D0BCC7EE31
	for <intel-xe@archiver.kernel.org>; Thu, 18 May 2023 11:40:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1070D10E090;
	Thu, 18 May 2023 11:40:55 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1B7F10E090
 for <intel-xe@lists.freedesktop.org>; Thu, 18 May 2023 11:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684410052; x=1715946052;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=rb8VrG8hywMxwl/6ehGDIWcRNoLcpwEzVBNfBF1A53U=;
 b=VfQbuGhYHJXJI29athRHonE+CDJ0oyEZ/Ny8OTuQo6KGJEoWQIdHl8Je
 s9pdr4aRzOkog34+np4ZmwBlyK9OkSulTWkJTOm+lqOB5NzRvtgFSRWJG
 3Pd6Os/fFbLDekgLfWa7buID0o6S+ZQy8F4duGvEnbiozqZ6miZPQCXmu
 XQEyXp27xe+3vbzdxQtFzwgRWgDUyO4we2N6Q4lCFI4RPjq7JxOF43Khh
 U3aB1vy2MxgDzGZjzgU+inEKzWWmkyctAOO9+u52+bmbi/OjbfEuU2VSY
 8C9nszr/wgvMKKTDiWYoWZ5nuOjM9schTB3eACoRmOEM3Vcuemyry5V5J w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="438384923"
X-IronPort-AV: E=Sophos;i="5.99,285,1677571200"; d="scan'208";a="438384923"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2023 04:40:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="702105327"
X-IronPort-AV: E=Sophos;i="5.99,285,1677571200"; d="scan'208";a="702105327"
Received: from amcminn-mobl.ger.corp.intel.com (HELO [10.252.19.102])
 ([10.252.19.102])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2023 04:40:50 -0700
Message-ID: <bbe0416b-6206-37ea-9fbc-fe0b88345aeb@intel.com>
Date: Thu, 18 May 2023 12:40:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.0
Content-Language: en-GB
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>,
 intel-xe@lists.freedesktop.org
References: <20230517160857.2791619-1-michael.j.ruhl@intel.com>
 <20230517160857.2791619-4-michael.j.ruhl@intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20230517160857.2791619-4-michael.j.ruhl@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH 3/4] drm/xe: Size GT device memory correctly
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

On 17/05/2023 17:08, Michael J. Ruhl wrote:
> The current method of sizing GT device memory is not quite right.
> 
> Update the algorithm to use the relevant HW information and offsets
> to set up the sizing correctly.
> 
> Update the stolen memory sizing to reflect the changes, and to be
> GT specific.
> 
> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
