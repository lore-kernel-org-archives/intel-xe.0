Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B74E2EB1052
	for <intel-xe@archiver.kernel.org>; Tue, 10 Mar 2026 14:08:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7084410E716;
	Tue, 10 Mar 2026 14:08:48 +0000 (UTC)
Received: from psionic.psi5.com (psionic.psi5.com [185.187.169.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF01510E714;
 Tue, 10 Mar 2026 14:08:46 +0000 (UTC)
Received: from [IPV6:2400:2410:b120:f200:a1f3:73da:3a04:160d] (unknown
 [IPv6:2400:2410:b120:f200:a1f3:73da:3a04:160d])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (Client did not present a certificate)
 by psionic.psi5.com (Postfix) with ESMTPSA id E71273F363;
 Tue, 10 Mar 2026 15:08:43 +0100 (CET)
Message-ID: <1a7a9d17-5086-4fdb-83e7-56d5ddaaadbd@hogyros.de>
Date: Tue, 10 Mar 2026 23:08:40 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/5] pci: check if VGA decoding was really activated
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: linux-pci@vger.kernel.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20260307173538.763188-1-Simon.Richter@hogyros.de>
 <20260307173538.763188-5-Simon.Richter@hogyros.de>
 <abAChDpsUQhpnOcT@intel.com>
Content-Language: en-US
From: Simon Richter <Simon.Richter@hogyros.de>
In-Reply-To: <abAChDpsUQhpnOcT@intel.com>
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

Hi,

On 3/10/26 8:37 PM, Ville Syrjälä wrote:

> Maybe this should also have a comment or spec quote to explain
> that it's legal behavior?

The PCI-to-PCI Bridge Specification version 1.1 has in chapter 4.5 "VGA 
Support":

     Bridges are not required to implement the VGA support mechanisms
     described in the following sections.

So this has always been optional.

What is a bit annoying is that I cannot find an explicit sentence 
allowing the VGAEnable bit to be hardwired to zero in that specification.

It is explicitly allowed to hardwire the VGASnoopEnable bit to zero if 
VGA palette snooping is not supported for downstream devices (Table 3-2 
"Command Register"):

     Implementation of VGA palette snooping by a bridge is optional. If
     VGA palette snooping is not supported, this bit must be implemented
     as read-only with a value of 0

That is the command register though, not the bridge control register.

The bridge control register documentation (Table 3-9) does not 
explicitly say what should be done if VGA support is not available, but 
the behaviour of the VGAEnable bit is a superset of the VGASnoopEnable 
bit, and the VGASnoopEnable bit becomes a Don't Care if VGAEnable is 
set, so "the bit must be hardwired to zero if unsupported" appears to be 
the only valid interpretation.

This seems to be the behaviour of all the devices I have available:

  - IBM PowerNV PCIe root bridge (POWER9)
  - SiFive VisionFive2 PCIe root bridge (PLDA XpressRich-AXI Ref Design)

Both read back this bit as zero when written via setpci:

# setpci -s 0000:00:00.0 BRIDGE_CONTROL
0002
# setpci -s 0000:00:00.0 BRIDGE_CONTROL=0xa
# setpci -s 0000:00:00.0 BRIDGE_CONTROL
0002

There is also a question in the Altera support forum for their PCIe Root 
Bridge IP at https://community.altera.com/kb/knowledge-base/-/345837 .

> The slightly bigger concern I have is whether we need to unwind
> the previous steps if this fails? Looks like we don't update
> vgadev->owns on failure (even though we may have partially
> enabled things). But since the bridge should never forward any
> VGA accesses, leaving some extra PCI_COMMAND enable(s) set on
> the device shouldn't matter in practice.

I was thinking the same, but because we're going upwards in the 
hierarchy, the bridges we leave enabled are downstream of the bridge 
that refused to forward.

I can add this for completeness though, that should be fairly easy.

> So I guess this should
> work even without unwinding. Well, not sure about
> arch_set_vga_state() since that's 100% magic...

It's not entirely magic, because after success from arch_set_vga_state() 
we still go through all the bridges. I believe uv uses it for some kind 
of paravirtualization.

    Simon
