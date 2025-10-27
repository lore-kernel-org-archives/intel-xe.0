Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF930CCF9E5
	for <intel-xe@archiver.kernel.org>; Mon, 27 Oct 2025 06:06:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACFA710E138;
	Mon, 27 Oct 2025 06:06:40 +0000 (UTC)
Received: from psionic.psi5.com (psionic.psi5.com [185.187.169.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFA2E10E138
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Oct 2025 06:06:39 +0000 (UTC)
Received: from [192.168.10.90] (unknown [39.110.247.193])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (Client did not present a certificate)
 by psionic.psi5.com (Postfix) with ESMTPSA id AE9C33F019
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Oct 2025 07:06:37 +0100 (CET)
Message-ID: <f60e07f2-1325-4b78-9d1d-7a49d984222a@hogyros.de>
Date: Mon, 27 Oct 2025 15:06:33 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
From: Simon Richter <Simon.Richter@hogyros.de>
Subject: VM modesetting
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

stupid question: when a VM starts up, how is it supposed to

1. find out what virtual monitors are available
2. indicate what buffers to use for these?

Slightly related: is there a way to expose a "ROM" from a VF, to allow 
firmware to do some early initialization?

    Simon
