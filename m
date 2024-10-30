Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C8ABD3A67E
	for <intel-xe@archiver.kernel.org>; Wed, 30 Oct 2024 09:29:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 473EE10E76B;
	Wed, 30 Oct 2024 09:29:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e5HJPiKn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 295EB10E76B
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Oct 2024 09:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730280539; x=1761816539;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to;
 bh=AlfbVTZt/hxPl8wBmnjJ8VRaEykPObYnCERoHfXZ7t8=;
 b=e5HJPiKnZkFZlml72MdmHghcz24bOW5lPqa64zTV5qH3g+s3BhUxi6NJ
 zO0d4+hcImb20RAhB81+VzTpIcjNav4UXp6ZGj7a42NdBwlgfsYwBd5V9
 nKMm9oy959ZCYMaWzSwxVeE2noEAqHiBZh4SYWUQYTMNmgiAnV5MTNPeZ
 qJatlKa7/mOO0CUT/0E/i/bWTFCRuVie6+XbHE1GPJSsm1DwQyUjyKALG
 hn2l7D/i/itI+wFc5kKKwX+fELGiqumTMLdxrs/ocywTXknDRAVOJJKsA
 fb4gR1mQLO9/cLyy6fTzatjABqfTBfi6FecQRtMEcyFfLRTgszw5G9keu Q==;
X-CSE-ConnectionGUID: er0FmlVCTlC/fml2agil6g==
X-CSE-MsgGUID: qj4fmGUhRL6bFyapVFbIsw==
X-IronPort-AV: E=McAfee;i="6700,10204,11240"; a="29869852"
X-IronPort-AV: E=Sophos;i="6.11,244,1725346800"; d="scan'208,217";a="29869852"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2024 02:28:56 -0700
X-CSE-ConnectionGUID: GYMCpsIXTgGkPGxmTvyopw==
X-CSE-MsgGUID: TzoziSNXRSqiNhUo3tJdvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,244,1725346800"; d="scan'208,217";a="82342184"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.245.197.87])
 ([10.245.197.87])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2024 02:28:54 -0700
Content-Type: multipart/alternative;
 boundary="------------SPiwjxpVf5doOgC9m0KYyZbp"
Message-ID: <4f4a5fe8-fb47-4429-94e3-815da323c5b2@linux.intel.com>
Date: Wed, 30 Oct 2024 10:28:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] drm/xe: Reword exec_queue.lock doc
To: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
References: <20241029214351.776293-1-lucas.demarchi@intel.com>
 <20241029214351.776293-4-lucas.demarchi@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20241029214351.776293-4-lucas.demarchi@intel.com>
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

This is a multi-part message in MIME format.
--------------SPiwjxpVf5doOgC9m0KYyZbp
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 10/29/2024 10:43 PM, Lucas De Marchi wrote:
> Reword documentation to possibly what it meant to be.
>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_device_types.h | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 85bede4dd6461..ef7412d653d2e 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -597,7 +597,7 @@ struct xe_file {
>  		/** @vm.xe: xarray to store VMs */
>  		struct xarray xa;
>  		/**
> -		 * @vm.lock: Protects VM lookup + reference and removal a from
> +		 * @vm.lock: Protects VM lookup + reference and removal from
>  		 * file xarray. Not an intended to be an outer lock which does
>  		 * thing while being held.
>  		 */
> @@ -610,8 +610,8 @@ struct xe_file {
>  		struct xarray xa;
>  		/**
>  		 * @exec_queue.lock: Protects exec queue lookup + reference and
> -		 * removal a frommfile xarray. Not an intended to be an outer
> -		 * lock which does thing while being held.
> +		 * removal from file xarray. Not intended to be an outer lock
> +		 * which does things while being held.
>  		 */
>  		struct mutex lock;
>  	} exec_queue;
--------------SPiwjxpVf5doOgC9m0KYyZbp
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 10/29/2024 10:43 PM, Lucas De Marchi
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20241029214351.776293-4-lucas.demarchi@intel.com">
      <pre wrap="" class="moz-quote-pre">Reword documentation to possibly what it meant to be.

Signed-off-by: Lucas De Marchi <a class="moz-txt-link-rfc2396E" href="mailto:lucas.demarchi@intel.com">&lt;lucas.demarchi@intel.com&gt;</a></pre>
    </blockquote>
    <br>
    <pre wrap="" class="moz-quote-pre"><span
    style="padding: 0px; tab-size: 8;"
    class="hljs diff colorediffs language-diff">Reviewed-by: Nirmoy Das </span><a
    class="moz-txt-link-rfc2396E" href="mailto:nirmoy.das@intel.com">&lt;nirmoy.das@intel.com&gt;</a><span
    style="padding: 0px; tab-size: 8;"
    class="hljs diff colorediffs language-diff"></span></pre>
    <blockquote type="cite"
      cite="mid:20241029214351.776293-4-lucas.demarchi@intel.com">
      <pre wrap="" class="moz-quote-pre">
---
 drivers/gpu/drm/xe/xe_device_types.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 85bede4dd6461..ef7412d653d2e 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -597,7 +597,7 @@ struct xe_file {
 		/** @vm.xe: xarray to store VMs */
 		struct xarray xa;
 		/**
-		 * @vm.lock: Protects VM lookup + reference and removal a from
+		 * @vm.lock: Protects VM lookup + reference and removal from
 		 * file xarray. Not an intended to be an outer lock which does
 		 * thing while being held.
 		 */
@@ -610,8 +610,8 @@ struct xe_file {
 		struct xarray xa;
 		/**
 		 * @exec_queue.lock: Protects exec queue lookup + reference and
-		 * removal a frommfile xarray. Not an intended to be an outer
-		 * lock which does thing while being held.
+		 * removal from file xarray. Not intended to be an outer lock
+		 * which does things while being held.
 		 */
 		struct mutex lock;
 	} exec_queue;
</pre>
    </blockquote>
  </body>
</html>

--------------SPiwjxpVf5doOgC9m0KYyZbp--
