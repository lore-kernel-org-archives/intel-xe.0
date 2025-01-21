Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1968DC02182
	for <intel-xe@archiver.kernel.org>; Tue, 21 Jan 2025 11:36:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8A8B10E144;
	Tue, 21 Jan 2025 11:36:54 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D65FB10E144;
 Tue, 21 Jan 2025 11:36:53 +0000 (UTC)
Message-ID: <a9eef4e6-29dd-44f8-8a63-45e50c691141@lankhorst.se>
Date: Tue, 21 Jan 2025 12:36:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/display: Re-use display vmas when possible
To: Aaron Ma <aaron.ma@canonical.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
References: <20241206182032.196307-1-dev@lankhorst.se>
 <a2b98e03-0a14-4ad3-b0b1-be8620dc839e@canonical.com>
Content-Language: en-US
From: Maarten Lankhorst <dev@lankhorst.se>
In-Reply-To: <a2b98e03-0a14-4ad3-b0b1-be8620dc839e@canonical.com>
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

Hey,

On 2025-01-21 12:33, Aaron Ma wrote:
> It's fixing messing screen of PSR issue on lnl after screen is inverted.
> xe issue: #3992.
> 
> Tested-by: Aaron Ma <aaron.ma@canonical.com>

You just missed the push by an hour. :-)

Cheers,
~Maarten
