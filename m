Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BE35CDB466
	for <intel-xe@archiver.kernel.org>; Sun, 21 Jun 2026 04:07:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 163F510E2EB;
	Sun, 21 Jun 2026 04:07:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="hptvdn7h";
	dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 768F010E2EB;
 Sun, 21 Jun 2026 04:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=XCxSbVufly1F5OgcrC8pX68PnRpg/ZBltK5Fv8aADtc=; b=hptvdn7hAEyqLSSi6UHEbZRFEY
 LxsLkOs05u4riAeR02ItCutTOd6zOyS3H6Fcm2wPyWHifrhGtgqtANxAcOJRKBQFqFoLbtyvjVQCU
 zbD8yoHVPtstUv1nE0n/ujT4Z5voOasbqlJAgJEuw0qUDsG3auFIQ/TRjO0ocGuwEf8Echl79RvOj
 oR8Z2DG0eIRNKZuUdE/b7XxmNLOxvuNy+aFZq1k3+wHNHOvbHo7br+Skz8S36LnSw0/sfz+BDvQYc
 3pJVpeI+rZQG+rpP7XuH4jWj7bHUqMKBQlOx9toWbyTJ+2fvO1Rn+K/0u0g9XTC2peSFgEvTV4XCe
 Co8bt4cQ==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
 by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
 id 1wb9TM-00000003jpw-1ZVX; Sun, 21 Jun 2026 04:07:52 +0000
Message-ID: <1a20e4bf-fd7f-453e-b7a8-c7feb0b077c6@infradead.org>
Date: Sat, 20 Jun 2026 21:07:51 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] Documentation: xe_drm: fix chars used for subsection
To: Rafael Passos <rafael@rcpassos.me>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 skhan@linuxfoundation.org
References: <20260621030114.963405-1-rafael@rcpassos.me>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260621030114.963405-1-rafael@rcpassos.me>
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



On 6/20/26 8:01 PM, Rafael Passos wrote:
> Fixes "ERROR: A level 2 section cannot be used here".
> Equal signs are reserved for document titles.
> This file docs gets imported by driver-uapi.rst,
> and the page title is defined the.

                        defined there.

> 
> 
> Signed-off-by: Rafael Passos <rafael@rcpassos.me>

LGTM. Thanks.

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>

> ---
> Hi, I send the v1 for this patch only for the linux-doc list.
> The v2 fixes this, and has improvements to the commit message.
> Thanks,
> 
> Rafael
> 
>  include/uapi/drm/xe_drm.h | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 48e9f1fdb78d..4dfb30e6c8a8 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -2537,21 +2537,21 @@ struct drm_xe_exec_queue_set_property {
>   * Refer to Documentation/netlink/specs/drm_ras.yaml for complete interface specification.
>   *
>   * Node Registration
> - * =================
> + * -----------------
>   *
>   * The driver registers DRM RAS nodes for each error severity level.
>   * enum drm_xe_ras_error_severity defines the node-id, while DRM_XE_RAS_ERROR_SEVERITY_NAMES maps
>   * node-id to node-name.
>   *
>   * Error Classification
> - * ====================
> + * --------------------
>   *
>   * Each node contains a list of error counters. Each error is identified by a error-id and
>   * an error-name. enum drm_xe_ras_error_component defines the error-id, while
>   * DRM_XE_RAS_ERROR_COMPONENT_NAMES maps error-id to error-name.
>   *
>   * User Interface
> - * ==============
> + * --------------
>   *
>   * To retrieve error values of a error counter, userspace applications should
>   * follow the below steps:

-- 
~Randy
