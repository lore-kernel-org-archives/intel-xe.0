Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21890C369CA
	for <intel-xe@archiver.kernel.org>; Wed, 16 Apr 2025 21:40:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF41910E9CD;
	Wed, 16 Apr 2025 21:40:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="QfgBui5L";
	dkim-atps=neutral
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B4CB10E0F4;
 Wed, 16 Apr 2025 21:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
 :In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=JW71Yrm63KAFDznLeuHzMNkNic4k+DAdb4uxGi95x7o=; b=QfgBui5Lt/jYbwOhChwnQ3eyuS
 jPBPseu++95pDBQtGD7MWZtl5vghAroyGSsVmRVO+WRtQY3vz1dUlSHnLi2V4rnBEk0Y91GCnE0Np
 8haDT6AtAzM1ciBi9R/umilQcnJYrhiPAYuI0IjkhbYoYySLcBu6jDyvXIpcWWQNXoxGlR0SolAlo
 d95jLXEt9kp5glBOe1vyzVh9muf5oKcCvTB3HeEHSJJwR+Lgt1ROfC97VTe7v+v7nTPx28sn3ar5q
 pZcIUVkVo+shd4yMl/JyiCLcGfbSplwAmejt9YSFhIlZoRAUYnd6G7rU0czxIxjZ5pgDbSLB2G30m
 rekY60Aw==;
Received: from [50.39.124.201] (helo=[192.168.254.17])
 by desiato.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
 id 1u5AUZ-0000000ABCe-19tR; Wed, 16 Apr 2025 21:40:26 +0000
Message-ID: <0e5ac6ff-12ea-4a95-9849-b5e102de4f97@infradead.org>
Date: Wed, 16 Apr 2025 14:40:19 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: Tree for Apr 16 (drivers/gpu/drm/xe/xe_vsec.o)
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20250416162556.3191a75e@canb.auug.org.au>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250416162556.3191a75e@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
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



On 4/15/25 11:25 PM, Stephen Rothwell wrote:
> Hi all,
> 
> News: there will be no linux-next releases this coming Friday or Monday
> or next Friday.
> 
> Changes since 20250415:
> 

on x86_64:

ld: drivers/gpu/drm/xe/xe_vsec.o: in function `xe_vsec_init':
xe_vsec.c:(.text+0x21a): undefined reference to `intel_vsec_register'


(Yes, this is a known issue so this report is just a reminder since it has
been some time since the other reports.)


-- 
~Randy

