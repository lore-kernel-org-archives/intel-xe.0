Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B307C61DC2
	for <intel-xe@archiver.kernel.org>; Wed, 26 Aug 2026 23:09:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D853410EE2A;
	Wed, 26 Aug 2026 23:09:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="nUktTJMf";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C94610EE2A
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Aug 2026 23:09:17 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id DA2E340949;
 Wed, 26 Aug 2026 23:09:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22F6A1F000E9;
 Wed, 26 Aug 2026 23:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1787785756;
 bh=yuS670eMpmTqRijNrTTORyVxD2VhaX8Kjyf+xsNv5Jw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=nUktTJMfYJCD/9Q5JyUlUtKlKIpVPmaEHWXi4HhFSDeY/HFhCpUlialAMpaRa9iIi
 sXQOXLefZ7cORBFEJpMw3CqQf/p5dU8RR68ycrr7uNKSbWS/DcqpnpRFigHdngZUjT
 kasoDwvPS+qGFg7IjKU2N6aZY2mj9UNNzstQl1BPY8Y49Mglil4mvLV8HcZ3Uf2/Bx
 j5K2CY2HlmmJBs7lJJtfbtAplrtq4Y1o8879RBVaeSCwknhcAIb58R4IiL3gy732kI
 cySZnKiPFDmNiADTCsj/ceh+oIN5gpOWRleOdlA/Ytwm6MBZbz4D9mDXkAlQwDXA9X
 rod1r4BNIvVag==
Date: Thu, 27 Aug 2026 01:09:14 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>
Cc: intel-xe@lists.freedesktop.org, himal.prasad.ghimiray@intel.com, 
 rodrigo.vivi@intel.com, michal.wajdeczko@intel.com
Subject: Re: [PATCH V18 07/14] drm/xe/vram: Add page offline data structures
 and lifecycle
Message-ID: <ao9yByU3AranMXth@zenone.zhora.eu>
References: <20260826135136.204044-16-tejas.upadhyay@intel.com>
 <20260826135136.204044-23-tejas.upadhyay@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260826135136.204044-23-tejas.upadhyay@intel.com>
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

On Wed, Aug 26, 2026 at 07:21:42PM +0530, Tejas Upadhyay wrote:
> Add xe_ttm_vram_offline_resource to track individual offlined VRAM
> pages, and extend xe_ttm_vram_mgr with offlined_pages/queued_pages
> lists and their counters.
> 
> Initialize the lists in __xe_ttm_vram_mgr_init() and add
> xe_ttm_vram_free_bad_pages() to release all tracked pages during
> xe_ttm_vram_mgr_fini() teardown.
> 
> v3(Sashiko):
> - Reorder xe_ttm_vram_buddy_free and list_del_rcu
> - Introduce reservation status
> v2(Himal):
> - Address possible leak in xe_ttm_vram_mgr_fini()
> - Remove unused dev and add comment for used_visible_size 0
> 
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Andi
