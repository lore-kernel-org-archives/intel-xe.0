Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ABA0C8302F
	for <intel-xe@archiver.kernel.org>; Tue,  1 Jul 2025 07:45:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E10DD10E26D;
	Tue,  1 Jul 2025 07:45:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EI28J6jf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE15910E26D
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Jul 2025 07:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751355943; x=1782891943;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=WaOTPXDOyXamFIF5gpJvhYL4L6gdolAygZ+SPRNtOgc=;
 b=EI28J6jfAJBnuGpwn8Yx+dRdkc0zFu44V2Zlgalxem2K9/mV0qJh1gOk
 0ntvSfwc+Buzq0lkH8LrwloL6se2FePvv0MzTwdU8hnscd8NXKycquUXr
 mTZFpOTlGpx7e0ydusYYgDf9vPoyFPgPe5yVArak9JqzfB5h7I6IDDR4B
 Ew3GQiKXD2xzcqviCur2Vr1MnUlLxwiq2a+dUg3RBM16/68nagGiErPqj
 ChuMdGuxNCWtg/xyBsHoKjrn5SBeBZXdZA3Nk4x6ipOZcZSFBHx1C+2U3
 J/RIAEz5YtGShL9EIATrxpSArxaySLsLGhmSAyvtMhhM5fG3hB64GskPN g==;
X-CSE-ConnectionGUID: Q+qamqi5SKadPCdIhAoIEw==
X-CSE-MsgGUID: 0sIYgokgRg6AVooDl6n4Lw==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="53469627"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="53469627"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 00:45:43 -0700
X-CSE-ConnectionGUID: Zpkqcd5iTdm04AVh9hqdyg==
X-CSE-MsgGUID: 8cqIeScNSdiGEsZ+NLaUjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="153083489"
Received: from kuha.fi.intel.com ([10.237.72.152])
 by orviesa010.jf.intel.com with SMTP; 01 Jul 2025 00:45:38 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation);
 Tue, 01 Jul 2025 10:45:36 +0300
Date: Tue, 1 Jul 2025 10:45:36 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jarkko Nikula <jarkko.nikula@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Jan Dabros <jsd@semihalf.com>, Raag Jadav <raag.jadav@intel.com>,
 "Tauro, Riana" <riana.tauro@intel.com>,
 "Adatrao, Srinivasa" <srinivasa.adatrao@intel.com>,
 "Michael J. Ruhl" <michael.j.ruhl@intel.com>,
 intel-xe@lists.freedesktop.org, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/4] i2c: designware: Add quirk for Intel Xe
Message-ID: <aGOSIB_H70IAWH3g@kuha.fi.intel.com>
References: <20250627135314.873972-1-heikki.krogerus@linux.intel.com>
 <20250627135314.873972-2-heikki.krogerus@linux.intel.com>
 <gljpd4foldjwairaca7ip2qqpdl7ipto77wsqwhbfamv6kdd3v@2doqwso7ccx3>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <gljpd4foldjwairaca7ip2qqpdl7ipto77wsqwhbfamv6kdd3v@2doqwso7ccx3>
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

On Mon, Jun 30, 2025 at 08:28:12PM +0200, Andi Shyti wrote:
> Hi Heikki,
> 
> On Fri, Jun 27, 2025 at 04:53:11PM +0300, Heikki Krogerus wrote:
> > The regmap is coming from the parent also in case of Xe
> > GPUs. Reusing the Wangxun quirk for that.
> 
> What I don't like, though, is that there is no mention of the
> change in the probe in the commit log.
> 
> Besides, are these changes related? Can we have them split in two
> different patches? I guess this would also make Andy's point
> about the extra churn.

I think you are right about splitting the patch. I'll do just that.
Thanks for the review Andi.

-- 
heikki
