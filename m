Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8064DE77188
	for <intel-xe@archiver.kernel.org>; Sat, 11 Jan 2025 01:22:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2742810E188;
	Sat, 11 Jan 2025 01:22:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="O8COlAwc";
	dkim-atps=neutral
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [IPv6:2604:1380:45d1:ec00::3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C86BA10E188
 for <intel-xe@lists.freedesktop.org>; Sat, 11 Jan 2025 01:22:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 16DD3A426F1;
 Sat, 11 Jan 2025 01:20:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CEC5C4CED6;
 Sat, 11 Jan 2025 01:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736558535;
 bh=7Rx0HOU6kG9xL1mFiiL4n0AMgLBgaTC7ZDdJw2wN1IQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=O8COlAwcHpCtALzuCV3vBeGECQ4ymvGEx0rP/hIXNmbg/ckG4vT/rOcWWtao6sfCd
 wmXE55RgBOYjupJ6lQmAMkwMtBBuGXPUIQBhMD7UaqqB4cM+S3Vd6HUL1Bw1akczJG
 3TLf0B7XudYy/w4PaIu4Dyi5kRhv4AScvPUuWPCCZZ8gFqwTpwUPH0j0h7n+tXNSj8
 Yq8tC1NS3z7zZEU//+67QUC9oQM6So9rMO4lTMJOGVcckoPrgBI8cWSRj+A3W+vi7x
 VQz0UtGX+PwH3kXcrYMd1SMWG1j70Lr3Eu4AxHUBdgg4iPv6nrfU5KATrdHMs1I6kj
 F7iDh6X2a3LJA==
Date: Sat, 11 Jan 2025 02:22:11 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Raag Jadav <raag.jadav@intel.com>
Cc: lucas.demarchi@intel.com, rodrigo.vivi@intel.com, 
 matthew.d.roper@intel.com, andi.shyti@linux.intel.com,
 intel-xe@lists.freedesktop.org, 
 anshuman.gupta@intel.com, riana.tauro@intel.com
Subject: Re: [PATCH v1] drm/xe/hwmon: expose package and vram temperature
Message-ID: <rz7x4udfdx7s56cu5zlf2k5ckkrvctaji6k5teqg4hsyolpq24@z5ezl4nvtywh>
References: <20250108092415.289551-1-raag.jadav@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250108092415.289551-1-raag.jadav@intel.com>
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

Hi Raag,

On Wed, Jan 08, 2025 at 02:54:15PM +0530, Raag Jadav wrote:
> Add hwmon support for temp1_input and temp2_input attributes, which will
> expose package and vram temperature in millidegree Celsius. With this in
> place we can monitor temperature using lm-sensors tool.
> 
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Andi
