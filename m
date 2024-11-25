Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50AEFD58D4C
	for <intel-xe@archiver.kernel.org>; Mon, 25 Nov 2024 13:53:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CF2010E3C5;
	Mon, 25 Nov 2024 13:53:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Pzy+sPa9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C71A10E3C5
 for <intel-xe@lists.freedesktop.org>; Mon, 25 Nov 2024 13:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732542818; x=1764078818;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=f/aRNUJPLkMV1fqrhtdLH+LNhcwx/MSIv0IWDd+Vs4w=;
 b=Pzy+sPa9ba6SVJhNqFeT1+I34JXeA9VFhltw7DJqy/4xGQQ8h3jHrM7a
 5BfOy82xZtBsDdnlfLIEn0DUDBJK1/eF+cJXG9q/jD1s9omqCn4KhTYa8
 Q3knOZv6QIl9vrkJ3T8bngEKFVrBcTAdkhT6oPpgUJGI/9Cpryi3gmsuR
 64vibbeEZs2w9/hAhVOfo9M7VNPZEEyI+xjd+P1M/sdhP1p4hnKEkcPH5
 tgNbapGljmyZwOJU7SgSLHPJY38YInk63Q1rytWUg4OlOhvhNN64CQbf7
 PVbQjnVpCThVeL+nlLoba0sgo7jyIN+HII4Tynjp5ZmcIUcMTu6eE9WPk A==;
X-CSE-ConnectionGUID: ifeCWCD2SienTkYjn9cTwA==
X-CSE-MsgGUID: n93j1jqPSqWQfLg1XRwJSw==
X-IronPort-AV: E=McAfee;i="6700,10204,11267"; a="32507866"
X-IronPort-AV: E=Sophos;i="6.12,182,1728975600"; d="scan'208";a="32507866"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2024 05:53:38 -0800
X-CSE-ConnectionGUID: k1RAXl0BTA+7Ic08E1ceSg==
X-CSE-MsgGUID: 65nQIChiRUWkjphzeSEkZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,182,1728975600"; d="scan'208";a="96184494"
Received: from black.fi.intel.com ([10.237.72.28])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2024 05:53:36 -0800
Date: Mon, 25 Nov 2024 15:53:33 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH v2 1/2] drm/xe: Introduce force-wake guard class
Message-ID: <Z0SBXaFHdbTLi2ia@black.fi.intel.com>
References: <20241118184511.258-1-michal.wajdeczko@intel.com>
 <20241118184511.258-2-michal.wajdeczko@intel.com>
 <ZzzdQGnrSSD7jKs_@intel.com> <ZzzlLQAh9yqAl3q8@black.fi.intel.com>
 <4mulnkmh6np2ney767qf5hvcj4tfse6t2bavudulnz77jjyagg@r4xtypqhsnkq>
 <855208c6-cd7c-4e63-a865-8d970bda11df@intel.com>
 <Z0RpewnaZocMaBoX@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z0RpewnaZocMaBoX@intel.com>
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

On Mon, Nov 25, 2024 at 07:11:39AM -0500, Rodrigo Vivi wrote:
> On Tue, Nov 19, 2024 at 09:26:42PM +0100, Michal Wajdeczko wrote:
> > On 19.11.2024 20:59, Lucas De Marchi wrote:
> > > On Tue, Nov 19, 2024 at 09:21:17PM +0200, Raag Jadav wrote:
> > >> On Tue, Nov 19, 2024 at 01:47:28PM -0500, Rodrigo Vivi wrote:
> > >>> On Mon, Nov 18, 2024 at 07:45:10PM +0100, Michal Wajdeczko wrote:
> > >>> > There is support for 'classes' with constructor and destructor
> > >>> > semantics that can be used for any scope-based resource management,
> > >>> > like our domain force-wake management.
> > >>>
> > >>> There is, okay...
> > >>> It can be, okay...
> > >>>
> > >>> But why do we want?
> > >>> What are the advantages?
> > >>
> > >> Makes error cases easier to handle + less code.
> > 
> > and this 'easier' is not just that as it also means that code is much
> > more robust as it's the compiler job to take care of all the cleanup,
> > which could be tricky when doing early exits from different paths, or
> > due to late updates to the code done by someone else
> > 
> > >> We significantly cleaned up intel pinctrl and gpio drivers a few
> > >> months ago
> > >> and almost halved the footprint in some cases.
> > > 
> > > I'm ok with using this pattern as I already expressed before.
> > > Particularly seeing other subsystems adopting it and being used well in
> > > the core kernel as well.
> > > 
> > > Main ask here is to provide proper justification in the commit message.
> > 
> > there was a little more in the cover letter:
> > 
> > ""
> > This should allow us to use:
> > 
> > 	CLASS(xe_fw, var)(fw, XE_FORCEWAKE_ALL);
> > or
> > 	guard(xe_fw)(fw, XE_FW_GT);
> > or
> > 	scoped_guard(xe_fw, fw, XE_FW_GT)
> > 		foo();
> > 
> > without any concern of leaking the force-wake references.
> > ""
> > 
> > do you want/need more?
> 
> this block here also just say 'allow to use' but fail to describe
> why we should use. But the upper block started by Raav seems a good
> why. Just make sure that that is in the commit message and
> 
> Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

with

Reviewed-by: Raag Jadav <raag.jadav@intel.com>
