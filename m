Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 876D8C6FD20
	for <intel-xe@archiver.kernel.org>; Tue, 21 Mar 2023 18:59:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FA9510E2DC;
	Tue, 21 Mar 2023 18:59:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AC5710E2DC
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Mar 2023 18:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=rsI2cY3LfnDqF/xFLtijKGdsVzOBKNAtT8Jv49J7+D8=; b=LfCuq2+Eo5h/YIuFJ+e58qGAkb
 cILnGUMEMUyra6a/AkscNvyKiCg/llQCiFVY4PzfsDLbVq3BK3biHhXxx61VK2zDxV+XQALEuDCbX
 va50V9D12CLeFk7ERxYoP1RO6yk9S8P/IsPvfmWASAB0sgAlZkcWBjVMSWpZchySJlhjRGGdpsrvY
 2a2Jvtr74Bd6PPSSjUS1x91UMyIEeTIPIsIsy5rSucVI7QaPpA/ow9p1uWUtXy8tyv0OFH5u3xBdi
 q592RltRDbILntC600xGbfspmVXOK8YQSnT2Ms5PlQ84P7wlv8oNsBCZH4HGmbvctiv2POK1MAALA
 zDWpgPrA==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.96 #2 (Red
 Hat Linux)) id 1pehCJ-00DP7P-0Z; Tue, 21 Mar 2023 18:59:03 +0000
Date: Tue, 21 Mar 2023 11:59:03 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <ZBn+d8Rd5Bbp/qKF@bombadil.infradead.org>
References: <20230313081316.2408-1-michal.wajdeczko@intel.com>
 <20230313081316.2408-2-michal.wajdeczko@intel.com>
 <20230313162348.s3cle2rpnvtgh6yk@ldmartin-desk2.lan>
 <f7483e45-d145-4e32-64b8-ea921b3ae393@intel.com>
 <20230316064643.fu5thzu4pf7htisq@ldmartin-desk2.lan>
 <b411541a-b357-14f7-e193-f8cbb2e31b4a@linux.intel.com>
 <20230317152936.2ca5ae1a@maurocar-mobl2>
 <20230317162615.cpumy762comdrgzc@ldmartin-desk2.jf.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230317162615.cpumy762comdrgzc@ldmartin-desk2.jf.intel.com>
Subject: Re: [Intel-xe] [PATCH 1/5] drm/xe: Introduce new selftests framework
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Mar 17, 2023 at 09:26:15AM -0700, Lucas De Marchi wrote:
> linux-modules recently started using kdevops
> (https://github.com/mcgrof/kdevops) for testing. I didn't have time yet
> to give it a deeper look yet, but it's something we could think about.
> Adding Luis here. Maybe he has more input on this. Or a demo recorded he
> can point to.

I have live demo scheduled next week March 29 at 9am PST. It will cover
mostly what is *already* supported, but I can give hints as to how to
extend things further. Although initial support for kernel selftests is
present, adding kunit tests is pretty trivial.

PCI-passthrough is also supported, it generates dynamic kconfig content
based on your target system. Ie, it will scrape your lspci output and
then convert things into kconfig like language so you can pick and
choose what you want to PCI-passthrough onto a guest. So if you wanted
to test kunit-live and optionally kunit-mock both could be done. I'd
just make each a new make target.

make kunit-drm-mock-xe
make kunit-drm-live-xe

For instance could be targets.

The PCI passthrough documentation:

https://github.com/mcgrof/kdevops/blob/master/docs/libvirt-pcie-passthrough.md

If anyone wants to attend next week's demo let me know. Since it will be
focused on what we support already it will cover mostly fstests, blktests,
selftests, and CXL support.

  Luis
