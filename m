Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2164C55179
	for <intel-xe@archiver.kernel.org>; Mon,  3 Aug 2026 11:17:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CC6810E14B;
	Mon,  3 Aug 2026 11:17:55 +0000 (UTC)
Received: from psionic.psi5.com (psionic.psi5.com [185.187.169.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71F7310E14B
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Aug 2026 11:17:53 +0000 (UTC)
Received: from [192.168.10.92] (unknown [39.110.247.193])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (Client did not present a certificate)
 by psionic.psi5.com (Postfix) with ESMTPSA id 619953F202;
 Mon,  3 Aug 2026 13:17:46 +0200 (CEST)
Message-ID: <be4bffdc-7e41-4fa9-a8df-c41dc6357225@hogyros.de>
Date: Mon, 3 Aug 2026 20:17:42 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] PCI/IOV: Restore initial VF BAR sizing after VF
 ReBAR
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
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
Content-Language: en-US
From: Simon Richter <Simon.Richter@hogyros.de>
In-Reply-To: <20260803103007.209625-1-marcin.bernatowicz@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Hi,

On 8/3/26 7:30 PM, Marcin Bernatowicz wrote:
> PF drivers can resize a VF BAR using VF Resizable BAR (ReBAR) support via
> pci_iov_vf_bar_set_size(). The new size persists in the SR-IOV capability
> config space. A later reprobe / unplug-rescan / next pci_enable_sriov()
> then sees the inflated VF BAR registers, and the PCI core reserves MMIO
> based on that size multiplied by TotalVFs.

Would it make sense for pci_enable_sriov() to check for a ReBAR 
capability in the VF and set it to the smallest possible setting, so we 
get the same behaviour regardless of whether this was cleaned up correctly?

Also, should it be "previous" or "smallest" size (in order to not make a 
missed cleanup permanent)?

I'm a bit worried about POWER, while we do have lots of MMIO space, we 
also use kexec() quite a lot because on several machines, the bootloader 
is some ancient minimal Linux system.

    Simon
