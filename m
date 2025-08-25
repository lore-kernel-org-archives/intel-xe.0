Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 346D3CA0EFA
	for <intel-xe@archiver.kernel.org>; Mon, 25 Aug 2025 14:14:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA75110E494;
	Mon, 25 Aug 2025 14:14:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="HTyz3Jv+";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D516910E494
 for <intel-xe@lists.freedesktop.org>; Mon, 25 Aug 2025 14:14:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id BE18A44C24;
 Mon, 25 Aug 2025 14:14:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8EEDC113D0;
 Mon, 25 Aug 2025 14:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756131270;
 bh=Bk7dcO1odHaCzbeFszCLUFeYX9n/cg932lfX7VTJ6w8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HTyz3Jv+p9IyQ++Ir6V6kG3lZcqZVp4Uk4cPqM/WwrF11R6pGHXjHGkPLklMyaEef
 Jo8bE7oY10XvzwLVLjICIiElYBuP6yWtFMCMWn3V9xOA3JgYtYCogFtA+bnB2HswlC
 4PTIw5aYLlxm+LgVQvirjErPOx2KYZh2GQvaq6tw29TYgboxaVPmeK6zYySg1egRu9
 GMpdcBbopKLrgjVM0rO81mcI9UwAULCVbvID5UllMahLtfsNtmJudIyjj1OoJQvbU0
 d55gMNzxveW2StmVrT5pLT2YPuabF0qopQYOokSt2PckgyRz26uUBtk4yu2G6Uy5if
 K9qYaUKPg8fFA==
Date: Mon, 25 Aug 2025 13:14:25 -0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: intel-xe@lists.freedesktop.org, 
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: Re: [PATCH v3] drm/xe/vf: Enable CCS save/restore only on supported
 GUC versions
Message-ID: <7jhual3h7h2rclibyknvtfphiqt7qkoeq6eh7bx7yyxfzndspp@7c7iuvo4uppp>
References: <20250825135641.4259-1-satyanarayana.k.v.p@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250825135641.4259-1-satyanarayana.k.v.p@intel.com>
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

Hi,

> +	guc_version = &tile->primary_gt->sriov.vf.guc_version;
> +	if (!IS_DGFX(xe) && MAKE_GUC_VER(guc_version->major, guc_version->minor,
> +					 guc_version->patch) < MAKE_GUC_VER(1, 23, 0)) {
> +		return vf_disable_migration(xe,
> +					    "CCS migration requires GuC ABI >= 1.23 but only %u.%u found",
> +					    guc_version->major, guc_version->minor);
> +	}

You don't need brackets here.

Andi
