Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 016D1C5DF97
	for <intel-xe@archiver.kernel.org>; Wed, 26 Aug 2026 22:34:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F45610EDF6;
	Wed, 26 Aug 2026 22:34:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="VVj+k1XL";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 891C510EDF6
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Aug 2026 22:34:44 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id CD76D60A63;
 Wed, 26 Aug 2026 22:34:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1E5A1F000E9;
 Wed, 26 Aug 2026 22:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1787783683;
 bh=l4luLTH3sfKhj0Fx//DMSgYv8kBjCIQGQRhORKIMqgI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=VVj+k1XLC33mcQmh/pFwqil11HHiDBQAEhoPKx2eEHNY3y0zn7A7pboCvKXsJENkm
 YITbSVr4+OCgOk+KbbDAmcl+jNN2vpIuLj4RsLQ4PsxpunXmTKx7NvowpX5lVcieUG
 jH6HedN6xcRm41G3Wa/upyPNlm9QUlQpmaBCgXov4bDiGY2qVbn5Nsk10/DIjLdl/h
 1BqeJg55R8iR+oBhoDNOLpHsqEa9oGYuR1EgnkA4DXHZMG4SyqEXoOcXzfIoi3S6Qb
 aWvVqLlJA1/fJcXVzOsOuwS9taJt2tIn/haDPO9ztD1IuSZA1R5GltdXu7p4wwo7sf
 6Ew1esKrK3Kvw==
Date: Thu, 27 Aug 2026 00:34:40 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>
Cc: intel-xe@lists.freedesktop.org, himal.prasad.ghimiray@intel.com, 
 rodrigo.vivi@intel.com, michal.wajdeczko@intel.com
Subject: Re: [PATCH V18 02/14] drm/xe: Link LRC BO and its execution Queue
Message-ID: <ao9pcLSFT6FP8h-N@zenone.zhora.eu>
References: <20260826135136.204044-16-tejas.upadhyay@intel.com>
 <20260826135136.204044-18-tejas.upadhyay@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260826135136.204044-18-tejas.upadhyay@intel.com>
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

Hi Tejas,

On Wed, Aug 26, 2026 at 07:21:37PM +0530, Tejas Upadhyay wrote:
> To establish a link between an LRC BO (Logical Ring Context
> Buffer Object) and its corresponding execution Queue in the
> drm/xe driver, you need to store a back-pointer to the queue
> within the BO's private data structure. This allows the
> driver to identify and take corrective action on the specific
> queue if the LRC BO encounters an error (e.g., memory
> corruption or eviction issues).
> 
> V3(Sashiko):
> - Placeholder of 8 byte for non-lrc bo is acceptable
> - Assign bo-q is safe just use READ_ONCE/WRITE_ONCE
> V2(MattB):
> - Handle multiqueue
> 
> Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks,
Andi
