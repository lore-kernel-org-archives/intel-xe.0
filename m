Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A0D4C61DC4
	for <intel-xe@archiver.kernel.org>; Thu, 27 Aug 2026 14:40:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49EAE10F0B5;
	Thu, 27 Aug 2026 14:40:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="oogWrzEe";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CCA810F0B5
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Aug 2026 14:40:29 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id D42DC40C29;
 Thu, 27 Aug 2026 14:40:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B38E1F00A3A;
 Thu, 27 Aug 2026 14:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1787841628;
 bh=1AutwoHB5W0NABvJy0dm9i5A5QE0IOF/Y68WN3gIsqM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=oogWrzEeltWnbq05j6h+h1q/awn2BpTYikXbACQ2L3uz/wAC0B68wgqZKFYw0LGaq
 5xmftrVaPnnbr8egyPbSCzp6qIjy7yzJ6ba5zi/i8Cn2OCm+EfkGvVkM3mszNCW7Jq
 qS4gvbmy6Vz6OUcvJHpOEXLU286Sl8JpJmj9BZQL9YgrMgngTEwl/VoLR0uAhnq8US
 ec/7XYMFeHIlwqevGBJ5tpLy/Cb148RpXD6faXcFnnk5opZpcWnQvI2KNYgxU4hrbz
 y2h6AMH+d/YcptKyexZq+crLm3W/y6HqJaCgodPBU/RC3Hzq9QMng0EkNHo+YyQhg7
 ZSDb5Pr8HO0xg==
Date: Thu, 27 Aug 2026 16:40:25 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, 
 "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>, 
 "Wajdeczko, Michal" <michal.wajdeczko@intel.com>, "Yadav,
 Arvind" <arvind.yadav@intel.com>
Subject: Re: [PATCH V18 03/14] drm/xe: Extend BO purge to handle vram pages
 as well
Message-ID: <apBLqyLbxFisF5xi@zenone.zhora.eu>
References: <20260826135136.204044-16-tejas.upadhyay@intel.com>
 <20260826135136.204044-19-tejas.upadhyay@intel.com>
 <ao9rmRZlZMf_kqSV@zenone.zhora.eu>
 <DS0PR11MB8718159BBB829F3009BA9FB281AD2@DS0PR11MB8718.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DS0PR11MB8718159BBB829F3009BA9FB281AD2@DS0PR11MB8718.namprd11.prod.outlook.com>
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

> > 
> > Besides, can we split it in two parts?
> 
> Not sure I understand correctly what split mean here, anyhow I will add little elaborative comment here.

we can have one patch that is adding xe_ttm_bo_purge() to the
library and one removing the if statement. They look independent
to me and both are vaguely hinted in the commit log.

Andi
