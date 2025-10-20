Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 703D6CCD193
	for <intel-xe@archiver.kernel.org>; Mon, 20 Oct 2025 15:03:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FBF910E463;
	Mon, 20 Oct 2025 15:03:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="pzSj9Ggg";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA13F10E463
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Oct 2025 15:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wFOkhDHT2HT1mbI9aXUINznquhu0foXwU+zcPnXC+Aw=; b=pzSj9GggCCOt8Qh5Z7eA/fDZe+
 0pG5yidWPKU/3QeareePaSOuWyF0cau2End/dWZlDA8ioQ/0cYmyE78Bknj3/wasnnL9RQyHd+Ovc
 W+UZbSAE3jEayMSywki06MmrmS2Eq5cbGHByMxs/7oesRSOc1XbdbrwI0rTGJr6PPR6vuOu1UyC1k
 9qm7iWa1a0YVBgcAlAOAzbxvuPHFRPm0L+6fNVbXw2Cdn4NChfziqaBlcFe0oFjVXaPWz3GVeaHBu
 spTioVcdmGAsjg+9zMN2A2QfK0fDbHohfMepwaPooQvxKi+g77229uEwLcneGhRA5ITOGyuhoO919
 eI8rsD+g==;
Received: from [90.242.12.242] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1vArPt-00C9IV-3r
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Oct 2025 17:03:21 +0200
Message-ID: <fa3c4429-295c-4b7f-b9db-515f2fc0b0ec@igalia.com>
Date: Mon, 20 Oct 2025 16:03:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_AuxCCS_hand?=
 =?UTF-8?Q?ling_and_render_compression_modifiers?=
To: intel-xe@lists.freedesktop.org
References: <20251020075831.32818-1-tvrtko.ursulin@igalia.com>
 <176097193188.32873.4288895112675611838@97596180aaec>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <176097193188.32873.4288895112675611838@97596180aaec>
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



On 20/10/2025 15:52, Patchwork wrote:
> *Patch Details*
> *Series:*	AuxCCS handling and render compression modifiers
> *URL:*	https://patchwork.freedesktop.org/series/156189/ <https:// 
> patchwork.freedesktop.org/series/156189/>
> *State:*	failure
> *Details:*	https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156189v1/ 
> index.html <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156189v1/ 
> index.html>
> 
> ERROR: The runconfig 'xe-pw-156189v1_FULL' does not exist in the database

What happened here? Should I re-run?

Regards,

Tvrtko

