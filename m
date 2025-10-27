Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8D13CCF9E5
	for <intel-xe@archiver.kernel.org>; Mon, 27 Oct 2025 12:32:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E8F410E468;
	Mon, 27 Oct 2025 12:32:54 +0000 (UTC)
Received: from psionic.psi5.com (psionic.psi5.com [185.187.169.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2296710E468
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Oct 2025 12:32:53 +0000 (UTC)
Received: from [192.168.10.90] (unknown [39.110.247.193])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (Client did not present a certificate)
 by psionic.psi5.com (Postfix) with ESMTPSA id 37C843F019
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Oct 2025 13:32:50 +0100 (CET)
Message-ID: <779c2479-f23d-43c3-aaa2-cd55d3edb32e@hogyros.de>
Date: Mon, 27 Oct 2025 21:32:47 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: VM modesetting
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <f60e07f2-1325-4b78-9d1d-7a49d984222a@hogyros.de>
 <542979eb-94f5-4fd6-ad82-3a708a3aecdd@lankhorst.se>
Content-Language: en-US
From: Simon Richter <Simon.Richter@hogyros.de>
In-Reply-To: <542979eb-94f5-4fd6-ad82-3a708a3aecdd@lankhorst.se>
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

On 10/27/25 6:01 PM, Maarten Lankhorst wrote:

> Display is never exposed on a VF, instead only buffers are shared between the VF and the PF, which the host may choose
> to display on real hardware. The VF never touches any display register at all, so no need for a ROM.

> Because of this it's entirely up to the virtualization software what a display is, and what buffer formats are used.

My goal would be to use the VF in a similar way to how I use i350 
Ethernet virtual functions, where I can just create a VF and pass it to 
the VM, whatever is running in there can just connect to the network 
through that single interface, and both Windows and Linux ship with 
drivers to use those directly.

So in essence the VF appears in the guest as a headless GPU that is 
importing a buffer and a set of semaphores from vfio-gpu?

    Simon
