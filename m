Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 946F8C02183
	for <intel-xe@archiver.kernel.org>; Wed, 15 Jan 2025 23:47:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 513A910E531;
	Wed, 15 Jan 2025 23:47:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V6ViiHBD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7603510E531
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Jan 2025 23:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736984856; x=1768520856;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=lKi5oHgl7o7uUz4YyGsUBXBboA7YyxCrHkmnP4CrA48=;
 b=V6ViiHBDMFy4ee/R+H8VJ0Np+Nw7TpQnAX5zBAIJjn45JPu3Ps7n5S6C
 LSe2APlPSiXgJb8nVAEATyhvGU93CypiSSi/grWomJ+gqLtX343N5BSWi
 x0ahobXaKfjjWQQtZprJwaADOJOjG35SjditKzXLm1ugLI6ELP/TL5JOL
 6ChxGDt1PBFpHYRTcm8vyB5o70nCbhNICOLbZEj7d3qn8/FUZKa3aBPAh
 vNTs/dDnXWJn+D6EcirY+fNJI7wQ3iBacXNR+IpOsqFABmKhSPaHOQSAT
 vYlWyFUm0fDaDsmrPsOhREXQZWXwCUkXtN0sdRu1M0pa1qSj2ES39Dtvs w==;
X-CSE-ConnectionGUID: mg9cyeA6TSyaFKIOw42S7A==
X-CSE-MsgGUID: 3ADny56xT4KhKWOX/QB1FA==
X-IronPort-AV: E=McAfee;i="6700,10204,11316"; a="59821402"
X-IronPort-AV: E=Sophos;i="6.13,207,1732608000"; d="scan'208";a="59821402"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2025 15:47:36 -0800
X-CSE-ConnectionGUID: 7cvNc6MIQb+9UdJph1+CWQ==
X-CSE-MsgGUID: PRUw+SuwQAup7zVEwSqlTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="106163621"
Received: from ldmartin-desk2.corp.intel.com (HELO ldmartin-desk2)
 ([10.125.109.25])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2025 15:47:35 -0800
Date: Wed, 15 Jan 2025 17:47:36 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Joel Granados <joel.granados@kernel.org>
Cc: intel-xe@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZ1bGw6IGZhaWx1cmUgZm8=?= =?utf-8?Q?r?=
 treewide: const qualify ctl_tables where applicable (rev2)
Message-ID: <y6w5z5sbjqjgo4ssqoq6zoepmqy7etxpzfufp7znajgjz2t5gg@jauogd3eahd4>
References: <20250110-jag-ctl_table_const-v2-1-0000e1663144@kernel.org>
 <173677806092.3265512.10738274622257046049@b555e5b46a47>
 <4lwrqbmyzey57cfagup6ur45owh5hbttamlllghvsh22s5voyi@zpgzbhbx2vcs>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <4lwrqbmyzey57cfagup6ur45owh5hbttamlllghvsh22s5voyi@zpgzbhbx2vcs>
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

On Tue, Jan 14, 2025 at 10:35:55AM +0100, Joel Granados wrote:
>On Mon, Jan 13, 2025 at 02:21:00PM -0000, Patchwork wrote:
>> == Series Details ==
>>
>> Series: treewide: const qualify ctl_tables where applicable (rev2)
>> URL   : https://patchwork.freedesktop.org/series/143333/
>> State : failure
>After searching for "Xe.CI.Full: failure" in lore.kernel.org, I believe
>that this is just another false positive. If you see that I'm wrong
>please get back to me with a way to reproduce and a way to pinpoint
>where things are going wrong. ATM there are way to many links that I
>don't know what to do with.

it is a false positive indeed.

For the xe part:


Acked-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks
Lucas De Marchi
