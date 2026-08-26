Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B31D0C61DBE
	for <intel-xe@archiver.kernel.org>; Wed, 26 Aug 2026 22:42:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58FB010EE05;
	Wed, 26 Aug 2026 22:42:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="nNxIQ70Z";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1228210EE05
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Aug 2026 22:42:43 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id A190141465;
 Wed, 26 Aug 2026 22:42:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEBBE1F000E9;
 Wed, 26 Aug 2026 22:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1787784162;
 bh=RwcfTipTlfjjbxeRloT2u377baWVxst0jwLO9dcPvr0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=nNxIQ70ZQ9WMqOoHJN4PSskfTipTPCBFd17KtJHOZPYfDEjakoR0DiSadvQ9UvMN6
 UtaIIJPQU4p7E3TGUgvomE1saBfHLRDJRpAylToJCzEzIWS+o54VdV0m3V0OV4t4GV
 gpmsAwSQj7dvdajOLV3+eyeZcTQfBnVyAI8l5h8JJN4jZMuZl/JruLXF9S071dNSi1
 fzVCFZqUABIIpJkWpdlNdxXHp2aXaeOsnk0L2/D74yZKjqu3k/ZsRQMTC/IRp/VlvC
 g4L7XIHHcsNaYOquH097UrgCW2NR+j43PYja9PcRwFSikaQlbYSGAqR7HBu1wSXGSc
 aS+Xb5YS3I3jg==
Date: Thu, 27 Aug 2026 00:42:39 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>
Cc: intel-xe@lists.freedesktop.org, himal.prasad.ghimiray@intel.com, 
 rodrigo.vivi@intel.com, michal.wajdeczko@intel.com, 
 Arvind Yadav <arvind.yadav@intel.com>
Subject: Re: [PATCH V18 03/14] drm/xe: Extend BO purge to handle vram pages
 as well
Message-ID: <ao9rmRZlZMf_kqSV@zenone.zhora.eu>
References: <20260826135136.204044-16-tejas.upadhyay@intel.com>
 <20260826135136.204044-19-tejas.upadhyay@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260826135136.204044-19-tejas.upadhyay@intel.com>
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

On Wed, Aug 26, 2026 at 07:21:38PM +0530, Tejas Upadhyay wrote:
> Recent driver update introduce support for purgeable buffer
> objects (BOs), extending the API to include VRAM pages to
> better manage memory pressure and enable memory offlining.

this commit description is not really telling anything.

Besides, can we split it in two parts?

Andi
