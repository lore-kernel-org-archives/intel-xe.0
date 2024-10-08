Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01732CEFC33
	for <intel-xe@archiver.kernel.org>; Tue,  8 Oct 2024 17:07:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B71E910E1BA;
	Tue,  8 Oct 2024 17:07:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A1EC/2Ph";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB85C10E1BA
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Oct 2024 17:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728407273; x=1759943273;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=GVA1ha7XdLOn5piRv1OD4NTDLPrIhiiOp8sjR3iBUGw=;
 b=A1EC/2PhdmqIf7PqWRm3pwi1J6PNnwP9Lyvng1EzptrJIrMsZFnLry8M
 8uAwyiDLo/OI2Yp1vju/DQUnAwX9LJQ15n7RmRsbII3mZ/pKSKgV6FIA/
 wKEqISmtePR4maeQ96uKIAQ220Z5BA3UIdeloPFeHDI1CsQpAVQal+4SU
 U19kAj/o8X+/1oke2xgErgPTaBtxkUd6Ek0cHZkZF22kdrWr08IudwILx
 q0k8J4H9r3KTv0MrgVdmqPFxm7CJhYfaPIkzdueSx5LkKm/weRB5WSovn
 5GhT+Ue3aJ3AcldRcVqz+SSpcB2j5RoWmBgZWxS0gPcXYPSoaGnPoQQbr A==;
X-CSE-ConnectionGUID: LkQ1crf7RTicI9eizIySfg==
X-CSE-MsgGUID: k20PUPeMRsScVSoLbkS/rw==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="38986611"
X-IronPort-AV: E=Sophos;i="6.11,187,1725346800"; d="scan'208";a="38986611"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2024 10:07:53 -0700
X-CSE-ConnectionGUID: QHjyNmvJSsSOlhkTjqkTWQ==
X-CSE-MsgGUID: z8HN5SluRg+Et/86nqbZvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,187,1725346800"; d="scan'208";a="106665065"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa001.fm.intel.com with ESMTP; 08 Oct 2024 10:07:51 -0700
Received: from [10.246.1.253] (mwajdecz-MOBL.ger.corp.intel.com [10.246.1.253])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id D3E3D2FC5B;
 Tue,  8 Oct 2024 18:07:50 +0100 (IST)
Message-ID: <1c4eef68-c016-491e-bd3e-583cbd52fdd4@intel.com>
Date: Tue, 8 Oct 2024 19:07:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 03/26] drm/xe/forcewake: Add a helper
 xe_force_wake_ref_has_domain()
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Badal Nilawar <badal.nilawar@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20241008071115.1862704-1-himal.prasad.ghimiray@intel.com>
 <20241008071115.1862704-4-himal.prasad.ghimiray@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20241008071115.1862704-4-himal.prasad.ghimiray@intel.com>
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



On 08.10.2024 09:10, Himal Prasad Ghimiray wrote:
> The helper xe_force_wake_ref_has_domain() checks if the input domain
> has been successfully reference-counted and awakened in the reference.
> 
> v2
> - Fix commit message and kernel-doc (Michal)
> - Remove unnecessary paranthesis (Michal)
> 
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Badal Nilawar <badal.nilawar@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

