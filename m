Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC110D1CDC7
	for <intel-xe@archiver.kernel.org>; Tue, 22 Oct 2024 09:32:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A71210E632;
	Tue, 22 Oct 2024 09:32:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ee0kzSN1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8728910E632
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Oct 2024 09:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729589533; x=1761125533;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=9/eY0PzNTfaob5f40WNvnGUYz9AuCMpZeBD4hwzTNMQ=;
 b=ee0kzSN1psaJW8sj4KIAS4rXtqLWGnGSns3fa9QnOcOhXBRPAmjWAd7T
 qGppzmBj2gGVwi0QpyOelcB/4ToPOIiEVUtobpFsUCFLxXOtbjrMSqOcS
 DNFMUzRn4sv1sH8aipRkxF/LEqBNDhTQfuPWKswI4cOas7SjBbckcxAkQ
 K8mOCv+GkbhqTG/Om78Eif4owzO+wUOFLuxkydXJpVQ7+BbKMLNM5WWdZ
 pLrrvqelHdAaZ6rGrhu9md4Vib6dM/WQHOcVqNItIHcqnQWkfErHQeJ5P
 Z0ncatFwweioA16o8P1eQxF1U7YfagIZG8BfbNKRi0nYUFEm4dY4DMNFl g==;
X-CSE-ConnectionGUID: wQEGTngxQM22JnM3iPhXbQ==
X-CSE-MsgGUID: bw+f7CB7T3ej7U5LUn9sfg==
X-IronPort-AV: E=McAfee;i="6700,10204,11232"; a="54516631"
X-IronPort-AV: E=Sophos;i="6.11,222,1725346800"; d="scan'208";a="54516631"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2024 02:32:12 -0700
X-CSE-ConnectionGUID: ign4BNKjTTCdpU17VXYfog==
X-CSE-MsgGUID: bxNIpDygRICV7tInXK905Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,222,1725346800"; d="scan'208";a="79741706"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa010.jf.intel.com with ESMTP; 22 Oct 2024 02:32:12 -0700
Received: from [10.246.1.253] (mwajdecz-MOBL.ger.corp.intel.com [10.246.1.253])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 1303627BD9;
 Tue, 22 Oct 2024 10:32:10 +0100 (IST)
Message-ID: <f7bd09df-17c9-4595-8a3f-a7e57298c385@intel.com>
Date: Tue, 22 Oct 2024 11:32:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] drm/xe/guc: Prevent GuC register capture running
 on VF
To: Zhanjun Dong <zhanjun.dong@intel.com>, intel-xe@lists.freedesktop.org
References: <20241022010116.342240-1-zhanjun.dong@intel.com>
 <20241022010116.342240-2-zhanjun.dong@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20241022010116.342240-2-zhanjun.dong@intel.com>
Content-Type: text/plain; charset=UTF-8
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



On 22.10.2024 03:01, Zhanjun Dong wrote:
> GuC based register capture is not supported by VF, thus prevent it
> running on VF.
> 
> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>

LGTM,

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

