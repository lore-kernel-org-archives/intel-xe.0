Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D32E3C61DCD
	for <intel-xe@archiver.kernel.org>; Fri, 28 Aug 2026 07:39:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D11C10F297;
	Fri, 28 Aug 2026 07:39:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="FBHShf5y";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BD0410F297
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Aug 2026 07:39:21 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id DB823433F1;
 Fri, 28 Aug 2026 07:39:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 910991F000E9;
 Fri, 28 Aug 2026 07:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1787902760;
 bh=OxVEMLFd3E00LJAyhSZCjwx73AwKHiOpirYVttPXJdg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=FBHShf5yy5nN/GfcvoRA0GagdtpUXONwyOOaOjccm84tovjlAnk/Q9gdnThNGe016
 f/8X4WhnzfHLBVWlb1wpB69SMOGcJxXLUJeKWNQKqGO4xnQ4IiQVe53rDHR6FPxAAT
 SdDv1IXQvqJ+l5D2K12CydPJdmy1Zl7wo2zyB6u1ji0zKXGAK8vx+g59RuTxGoHDsf
 5NvYxabPlN8oohqxDrxkfMhk0eQ++fxnwuxooZiyytzpC1VZn6PvWj/Zbnp/2y/NUV
 wjhDiWaB/9G43pRbyzXeuz504fUBpdfSH+Nf+ubC7+sVPsWkZHilWG1/w/8JCnzh9K
 b6jlmFlbrx5Sw==
Date: Fri, 28 Aug 2026 09:39:15 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, 
 "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>, 
 "Wajdeczko, Michal" <michal.wajdeczko@intel.com>, "Yadav,
 Arvind" <arvind.yadav@intel.com>
Subject: Re: [PATCH V18 03/14] drm/xe: Extend BO purge to handle vram pages
 as well
Message-ID: <apE6MxxCAuChbNQK@zenone.zhora.eu>
References: <20260826135136.204044-16-tejas.upadhyay@intel.com>
 <20260826135136.204044-19-tejas.upadhyay@intel.com>
 <ao9rmRZlZMf_kqSV@zenone.zhora.eu>
 <DS0PR11MB8718159BBB829F3009BA9FB281AD2@DS0PR11MB8718.namprd11.prod.outlook.com>
 <apBLqyLbxFisF5xi@zenone.zhora.eu>
 <DS0PR11MB871878E0D13455C28397749A81AC2@DS0PR11MB8718.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DS0PR11MB871878E0D13455C28397749A81AC2@DS0PR11MB8718.namprd11.prod.outlook.com>
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

> > > >
> > > > Besides, can we split it in two parts?
> > >
> > > Not sure I understand correctly what split mean here, anyhow I will add little
> > elaborative comment here.
> > 
> > we can have one patch that is adding xe_ttm_bo_purge() to the library and
> > one removing the if statement. They look independent to me and both are
> > vaguely hinted in the commit log.
> 
> Hi Andi,
> 
> I think for such small patch to split does not look good, rather I will make more descriptive commit message to explain what all it does. I hope that is fine.

To me, it's good. There is no limit to how small a patch can be,
but there is a limitation that patches should contain a single
logical change. This patch contains two logical changes.

Andi
