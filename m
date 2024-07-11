Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 356A7C3DA49
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jul 2024 12:57:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E560A10E09B;
	Thu, 11 Jul 2024 12:57:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VxZCB8fR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEF9510E09B
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jul 2024 12:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720702674; x=1752238674;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=dEiGQqfao9aSNRn6konwqleFau1dwRxUBi7Ghsjnx+s=;
 b=VxZCB8fRqiiBbavuQmTOaj7oUOGc3PtEBXQQoOA8yc4Jeu6EBJxb7ShV
 jyYgDIPYLVQZARcEKa7ueSDPpH5N5FjbyKva0Ll6zDVHwELx1fttlODuF
 T2xfWbB/E6fwYQdZS3MuKMd3NfwGu4lYeHdnw5Y/TLH4tkgN+ytOSNrFF
 37gzZEjFMIDhOTI7amwguMjPIh0efylD5VCHC0bGa3s+XLKlggdLADdR1
 vj7m06BOZr0qvTj2kBpgt3AtImip3LenMl8BQcXkAnOtRAsZZWN506fI/
 5OaeWtmhz1SpJ8PkKffakvm7wzZkmhQ5ue02EB7lRycSCFS1zulBRk/N4 g==;
X-CSE-ConnectionGUID: TRzQ28y2QLCQK87zbGolAw==
X-CSE-MsgGUID: CiypCDlnRuqZ5zSh5Nyb1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11130"; a="12498611"
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; d="scan'208";a="12498611"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2024 05:57:53 -0700
X-CSE-ConnectionGUID: w9K/eiAERZS3XSbjgKqooQ==
X-CSE-MsgGUID: MxASisTeQuyiKLPxe3XYFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; d="scan'208";a="79259192"
Received: from fpallare-mobl3.ger.corp.intel.com (HELO [10.245.245.34])
 ([10.245.245.34])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2024 05:57:52 -0700
Message-ID: <be16c4a7-7fde-4d51-9eb8-367d61b46e3a@intel.com>
Date: Thu, 11 Jul 2024 13:57:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] drm/xe/xe_migrate: Handle migration logic for xe2+
 dgfx
To: Akshata Jahagirdar <akshata.jahagirdar@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: akshatajahagirdar6@gmail.com
References: <cover.1720689220.git.akshata.jahagirdar@intel.com>
 <4c5165d6352f58371ef3452704c542e1a21284ed.1720689220.git.akshata.jahagirdar@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <4c5165d6352f58371ef3452704c542e1a21284ed.1720689220.git.akshata.jahagirdar@intel.com>
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

On 11/07/2024 10:20, Akshata Jahagirdar wrote:
> During eviction (vram->sysmem), we use the mapping from compressed -> uncompressed.
> During restore (sysmem->vram), we need the mapping from uncompressed -> uncompressed.
> Handle logic for selecting the compressed identity map for eviction,
> and selecting uncompressed map for restore operations.
> 
> Signed-off-by: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
