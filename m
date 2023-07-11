Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6084BEB64DC
	for <intel-xe@archiver.kernel.org>; Tue, 11 Jul 2023 10:32:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F79510E35D;
	Tue, 11 Jul 2023 10:32:41 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A01A10E35D
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Jul 2023 10:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689071558; x=1720607558;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=tbzCJZ2JlL6sprXQtDeLeBJpZDreSebVBI/LnjetGRc=;
 b=NFjArHWJ+GEkMngn81GyBfnEu6Jt2wGdXbvD5YO2DSRtkdwTiNPMS3gc
 HIqxSYXWGhcxy1xN68RTxbF/Wtd0S+jNam1lr8n/sno5qkQma4cK8wvYz
 hoMeIOtY/DT/VDCjw0dvB6SnwQym+m09XULRKMJK0rEouuENwLkJ4Imhb
 Bo4x+4IB/azc3NRPKNmM/brlQiqwXjveeEJ5tWMgIJUX5K3jh7HH2E8sU
 44tlzA+/9MKzRx2RpOodpXHzgE1258dEF/vFjKa02KppRguc8Bk9cC6Oj
 Ay/l3NDbkGsJ5wvgvbfDT5HSl/qbtU4I1+kU9RYu0sJmQTjnAh9jE5jlL A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="354446675"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200"; d="scan'208";a="354446675"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2023 03:32:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="786559029"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200"; d="scan'208";a="786559029"
Received: from sbodin-mobl3.ger.corp.intel.com (HELO intel.com)
 ([10.252.53.13])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2023 03:32:34 -0700
Date: Tue, 11 Jul 2023 12:32:24 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Message-ID: <ZK0vuLKbpVDlj3DR@ashyti-mobl2.lan>
References: <20230630115019.123675-1-jani.nikula@intel.com>
 <20230630115019.123675-2-jani.nikula@intel.com>
 <ZKw0I6s8yM48JGYI@ashyti-mobl2.lan> <87bkgij23p.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87bkgij23p.fsf@intel.com>
Subject: Re: [Intel-xe] [RESEND 1/5] drm/i915/uncore: add
 intel_uncore_regs() helper
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hi Jani,

On Tue, Jul 11, 2023 at 11:15:22AM +0300, Jani Nikula wrote:
> On Mon, 10 Jul 2023, Andi Shyti <andi.shyti@linux.intel.com> wrote:
> > Hi Jani,
> >
> > On Fri, Jun 30, 2023 at 02:50:15PM +0300, Jani Nikula wrote:
> >> Add a helper for accessing uncore->regs instead of doing it
> >> directly. This will help display code reuse with the xe driver.
> >
> > I asked you in a previous mail if you had tried
> > intel_uncore_{read,write}_fw() helpers instead of the simple
> > intel_uncore_{read,write}.
> 
> Yes, sorry. I decided this was a more generally useful approach,
> abstracting the uncore->regs access everywhere.
> 
> This does not block a further cleanup.

OK, either way, I'm fine with it:

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thank you!
Andi
