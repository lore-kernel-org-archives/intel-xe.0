Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A435103E2F1
	for <intel-xe@archiver.kernel.org>; Wed, 11 Mar 2026 23:23:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A55A10E3D3;
	Wed, 11 Mar 2026 23:23:35 +0000 (UTC)
Received: from psionic.psi5.com (psionic.psi5.com [185.187.169.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B1CA10E3D3;
 Wed, 11 Mar 2026 23:23:33 +0000 (UTC)
Received: from [192.168.10.94] (unknown [39.110.247.193])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (Client did not present a certificate)
 by psionic.psi5.com (Postfix) with ESMTPSA id 095093F535;
 Thu, 12 Mar 2026 00:23:30 +0100 (CET)
Message-ID: <c8edd2ac-5841-4bee-9d06-500c1fdbb3e5@hogyros.de>
Date: Thu, 12 Mar 2026 08:23:27 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] pci: mark pci_set_vga_state() as __must_check
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: linux-pci@vger.kernel.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20260310193607.GA774938@bhelgaas>
Content-Language: en-US
From: Simon Richter <Simon.Richter@hogyros.de>
In-Reply-To: <20260310193607.GA774938@bhelgaas>
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

On 3/11/26 4:36 AM, Bjorn Helgaas wrote:

>> The only caller so far is __vga_tryget() in vgaarb.

> Is there any reason for pci_set_vga_state() to be in pci.c while the
> only caller is in vgaarb.c?  If not, we could move it there, make it
> static, and drop it from include/linux/pci.h.

I have no strong feelings one way or the other. I believe that is

https://lore.kernel.org/linux-pci/20260220194943.3541702-1-bhelgaas@google.com/

Whichever goes first means the other needs to be rebased. Not a problem, 
unless backports are involved.

    Simon

