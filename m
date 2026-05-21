Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CEEFCD5BAB
	for <intel-xe@archiver.kernel.org>; Thu, 21 May 2026 20:13:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1981A10E63E;
	Thu, 21 May 2026 20:13:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="PwjWJcJa";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA1DD10E63E
 for <intel-xe@lists.freedesktop.org>; Thu, 21 May 2026 20:13:14 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with UTF8SMTP id E47FC600FF;
 Thu, 21 May 2026 20:13:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 6F6561F000E9;
 Thu, 21 May 2026 20:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1779394393;
 bh=2mkrp+7CFhzJFOg4LD6CsVexg7gtohVBtM5IptpBMRQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To;
 b=PwjWJcJagMbdil30Xk4OPToTglPieM1u8DMgZFULIdF60JW13wB+lpvgVl2GySvnu
 J4mNcc1XAqMXONGmP4Kvcsdtx1ai75jHY2pTKerhKCpjkw8ERI4zXrFowb0RkGCr1/
 dBCZZxka3VZcrb6JBddQmZ7eqI8aSRWmD3LRkectKPgWKX1gBQaI5ec3qWOi8GpVFJ
 A+X6+5SUfJK1wchhrwtbT1DSGqJM0LT11HB2eBe3gF3KaLYeCjoPD8FFguOG3d/dlC
 8IYoJNFKObDLbhZ3EL3bONTTVSQ33u0ZjX+v3k7zbhoNBj2QZbnfeOkMlkQ6gkY3sp
 7d/VOEHcPhcpg==
Date: Thu, 21 May 2026 15:13:12 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: "Ionut Nechita (Wind River)" <ionut.nechita@windriver.com>
Cc: linux-pci@vger.kernel.org, bhelgaas@google.com, sebott@linux.ibm.com,
 schnelle@linux.ibm.com, bblock@linux.ibm.com, linux@roeck-us.net,
 lukas@wunner.de, stable@vger.kernel.org,
 linux-kernel@vger.kernel.org, intel-xe@lists.freedesktop.org,
 matthew.brost@intel.com, michal.wajdeczko@intel.com,
 piotr.piorkowski@intel.com, dtatulea@nvidia.com, mani@kernel.org,
 kbusch@kernel.org, lkml@mageta.org, alifm@linux.ibm.com,
 julianr@linux.ibm.com, ionut_n2001@yahoo.com, sunlightlinux@gmail.com
Subject: Re: [PATCH v14 0/2] PCI/IOV: Fix SR-IOV locking races and AB-BA
 deadlock
Message-ID: <20260521201312.GA182641@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1776839248.git.ionut.nechita@windriver.com>
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

On Wed, Apr 22, 2026 at 09:32:40AM +0300, Ionut Nechita (Wind River) wrote:
> Hi Bjorn,
> 
> This is v14 of the fix for the SR-IOV race between driver .remove()
> and concurrent hotplug events.

Thanks for your persistence on this!

Can you take a look at the sashiko feedback and see whether there's
any merit to it?

https://sashiko.dev/#/patchset/cover.1776839248.git.ionut.nechita%40windriver.com
