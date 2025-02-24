Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58672C021A4
	for <intel-xe@archiver.kernel.org>; Mon, 24 Feb 2025 19:43:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 206E888DA9;
	Mon, 24 Feb 2025 19:43:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="XKf6E7Gc";
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 989A488DA9
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Feb 2025 19:43:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1FB3D5C64F5;
 Mon, 24 Feb 2025 19:42:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CE26C4CED6;
 Mon, 24 Feb 2025 19:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740426186;
 bh=f90Hn38Tq9+2tN/TZJiAHQjfIgYjPB9Pf+J4MmnEJAQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=XKf6E7GccM3hW6b/BnVduyU/8Lnlqf5+P98RjmurB6N8mNrfcSW/kygI0ugFw5wyr
 Gyl7NSMZUhPHXiRoLo2zH0EBhk3JOsGvqELr3G5RRfDCPrqkB2B7BCwe+QdyH49cGd
 WgUuTR51bWtIu6uEqG5DgHDAAeYQcSHGZq6I6ESLn6pkiyjQieaWxqE/1T+QUolfa+
 HJnHSbpJw9k7OY0O2zIpOaekdh3A1uXDg7TmPaoc4EoiLnFstayIIy0SvM8eocz6M5
 iUrRR8riKvVHujEXfl1etp6pksw9WozrGUiZn8sQsxu+SJ/HoVmBPk/AKsaMyciywO
 4vcwITQmGLfHg==
Date: Mon, 24 Feb 2025 13:43:05 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Anshuman Gupta <anshuman.gupta@intel.com>
Cc: intel-xe@lists.freedesktop.org, linux-acpi@vger.kernel.org,
 linux-pci@vger.kernel.org, rafael@kernel.org, lenb@kernel.org,
 bhelgaas@google.com, ilpo.jarvinen@linux.intel.com,
 lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 badal.nilawar@intel.com, kam.nasim@intel.com
Subject: Re: [RFC 3/6] drm/xe/vrsr: Apis to init and enable VRSR feature
Message-ID: <20250224194305.GA473249@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250224164849.3746751-4-anshuman.gupta@intel.com>
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

s/Apis/APIs/ in subject to match common usage and use below.

Also perhaps s/Detect vrsr/Detect VRSR/ in previous patch subject to
match this one.

On Mon, Feb 24, 2025 at 10:18:46PM +0530, Anshuman Gupta wrote:
> From: Badal Nilawar <badal.nilawar@intel.com>
> 
> APIs to enable and initialize VRSR feature.

I always think it's nice when the commit log includes the actual names
of the APIs being added so we don't have to grub that out of the
patch.
