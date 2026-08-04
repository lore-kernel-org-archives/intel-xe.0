Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FBD1C55184
	for <intel-xe@archiver.kernel.org>; Tue,  4 Aug 2026 11:39:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27C4D10E155;
	Tue,  4 Aug 2026 11:39:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G2ixbB06";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD9F710E9D0
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Aug 2026 11:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785843547; x=1817379547;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=p+DJFh7RLq7GaqRkqbH6BV95W4PmMYR+V5BcC9qDWCE=;
 b=G2ixbB063h8mh/A3Ta1vi+NiOOXuZPdI2ZkzeGVAyLm05rkESxinkj5s
 AOAOvhNtV5KLQFnopp63XOr8yUOtrr1fhof/4yPlH7+9ou7Oa4694amSV
 szJorLdYoDEv+IQ2soOJ6YKHoeSPAw8HeQ/kfNJZ8pbTF3usBo0bOyzFd
 R/wDgel7Tq3g3VVL8B1UW6BjeqWdDkRcvRROwhYed7TDTT/C9cdac5Wku
 A2ZVzVTQoADnJKYDZX5Rvmlk2UJbGy/ptoIwmV35759TwV/tbk1HsYcuX
 MsOKxvYlnbuAz/JM5LrqowQIM3tKfhH5bMuAoIwDMc99AeSiYIgZ8NLeY A==;
X-CSE-ConnectionGUID: CqhU/MWpSSihrXD5cKCq8Q==
X-CSE-MsgGUID: afsF2/nFQ6enD27TbHO/7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="86424810"
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; d="scan'208";a="86424810"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2026 04:39:05 -0700
X-CSE-ConnectionGUID: SRO4CRgeTq6Mf9pVouNmpg==
X-CSE-MsgGUID: UqvoBGmARlyz3EuREoIUng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; d="scan'208";a="260239707"
Received: from soc-5cg43972f8.clients.intel.com (HELO [172.28.182.68])
 ([172.28.182.68])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2026 04:39:03 -0700
Message-ID: <3d43f08a-cbc2-4491-b563-244d321242e2@linux.intel.com>
Date: Tue, 4 Aug 2026 13:39:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] PCI/IOV: Restore initial VF BAR sizing after VF
 ReBAR
To: Simon Richter <Simon.Richter@hogyros.de>,
 Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-xe@lists.freedesktop.org
References: <20260505170010.3414074-1-marcin.bernatowicz@linux.intel.com>
 <20260803103007.209625-1-marcin.bernatowicz@linux.intel.com>
 <be4bffdc-7e41-4fa9-a8df-c41dc6357225@hogyros.de>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <be4bffdc-7e41-4fa9-a8df-c41dc6357225@hogyros.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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


On 8/3/2026 1:17 PM, Simon Richter wrote:
> Hi,
>
> On 8/3/26 7:30 PM, Marcin Bernatowicz wrote:
>> PF drivers can resize a VF BAR using VF Resizable BAR (ReBAR) support 
>> via
>> pci_iov_vf_bar_set_size(). The new size persists in the SR-IOV 
>> capability
>> config space. A later reprobe / unplug-rescan / next pci_enable_sriov()
>> then sees the inflated VF BAR registers, and the PCI core reserves MMIO
>> based on that size multiplied by TotalVFs.
>
> Would it make sense for pci_enable_sriov() to check for a ReBAR 
> capability in the VF and set it to the smallest possible setting, so 
> we get the same behaviour regardless of whether this was cleaned up 
> correctly?
>
> Also, should it be "previous" or "smallest" size (in order to not make 
> a missed cleanup permanent)?
>
> I'm a bit worried about POWER, while we do have lots of MMIO space, we 
> also use kexec() quite a lot because on several machines, the 
> bootloader is some ancient minimal Linux system.
>
>    Simon

Hi Simon,

Thanks for the point.

I think an unconditional reset in pci_enable_sriov() would conflict with 
PF drivers
that intentionally set VF ReBAR before enable (Xe does this in its 
sriov_configure flow).
A core reset-to-smallest would override that policy.

For this reason, this series restores the initial-at-probe size in 
SR-IOV lifecycle cleanup paths
(disable, enable failure, PF remove), which fixes persistence from this 
kernel without forcing a global sizing policy.

You are right that kexec can inherit an already mutated value from an 
older kernel;
that limitation exists, but this series prevents further drift once 
running on a patched kernel.

Thanks,
Marcin
