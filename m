Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 060CDC6FD1C
	for <intel-xe@archiver.kernel.org>; Mon,  6 Mar 2023 14:41:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D97CD10E299;
	Mon,  6 Mar 2023 14:41:04 +0000 (UTC)
X-Greylist: delayed 318 seconds by postgrey-1.36 at gabe;
 Tue, 28 Feb 2023 14:14:45 UTC
Received: from mblankhorst.nl (lankhorst.se
 [IPv6:2a02:2308:0:7ec:e79c:4e97:b6c4:f0ae])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E6B410E200
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Feb 2023 14:14:45 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="------------9y8nsSFsSFmSAY73QiB82wP0"
Message-ID: <b7413066-4cef-9371-d646-eb42c86f656d@lankhorst.se>
Date: Tue, 28 Feb 2023 15:09:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.8.0
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
References: <20230228104137.80965-1-matthew.auld@intel.com>
 <20230228104137.80965-2-matthew.auld@intel.com>
From: Maarten Lankhorst <maarten@lankhorst.se>
In-Reply-To: <20230228104137.80965-2-matthew.auld@intel.com>
X-Mailman-Approved-At: Mon, 06 Mar 2023 14:41:02 +0000
Subject: Re: [Intel-xe] [PATCH v2 01/14] drm/xe/display: fix IS_ALDERLAKE_P()
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--------------9y8nsSFsSFmSAY73QiB82wP0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Reviewed-by: Maarten Lankhorst<maarten.lankhorst@linux.intel.com>


On 2023-02-28 11:41, Matthew Auld wrote:
> On ADL-P we currently trigger:
>
> xe 0000:00:02.0: drm_WARN_ON(!((dev_priv)->info.platform == XE_ALDERLAKE_S) && !(dev_priv && 0))
> WARNING: CPU: 3 PID: 338 at drivers/gpu/drm/xe/display/ext/intel_pch.c:32 intel_pch_type+0xce/0x2f0 [xe]
>
> Signed-off-by: Matthew Auld<matthew.auld@intel.com>
> Cc: Lucas De Marchi<lucas.demarchi@intel.com>
> ---
>   drivers/gpu/drm/xe/display/i915_drv.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/display/i915_drv.h b/drivers/gpu/drm/xe/display/i915_drv.h
> index da83a957dd86..06348cb03f44 100644
> --- a/drivers/gpu/drm/xe/display/i915_drv.h
> +++ b/drivers/gpu/drm/xe/display/i915_drv.h
> @@ -73,7 +73,7 @@ static inline struct drm_i915_private *kdev_to_i915(struct device *kdev)
>   #define IS_ROCKETLAKE(dev_priv)	(dev_priv && 0)
>   #define IS_DG1(dev_priv)        IS_PLATFORM(dev_priv, XE_DG1)
>   #define IS_ALDERLAKE_S(dev_priv) IS_PLATFORM(dev_priv, XE_ALDERLAKE_S)
> -#define IS_ALDERLAKE_P(dev_priv) (dev_priv && 0)
> +#define IS_ALDERLAKE_P(dev_priv) IS_PLATFORM(dev_priv, XE_ALDERLAKE_P)
>   #define IS_XEHPSDV(dev_priv) (dev_priv && 0)
>   #define IS_DG2(dev_priv)	IS_PLATFORM(dev_priv, XE_DG2)
>   #define IS_PONTEVECCHIO(dev_priv) IS_PLATFORM(dev_priv, XE_PVC)
--------------9y8nsSFsSFmSAY73QiB82wP0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <pre>Reviewed-by: Maarten Lankhorst <a class="moz-txt-link-rfc2396E" href="mailto:maarten.lankhorst@linux.intel.com">&lt;maarten.lankhorst@linux.intel.com&gt;</a></pre>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2023-02-28 11:41, Matthew Auld
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20230228104137.80965-2-matthew.auld@intel.com">
      <pre class="moz-quote-pre" wrap="">On ADL-P we currently trigger:

xe 0000:00:02.0: drm_WARN_ON(!((dev_priv)-&gt;info.platform == XE_ALDERLAKE_S) &amp;&amp; !(dev_priv &amp;&amp; 0))
WARNING: CPU: 3 PID: 338 at drivers/gpu/drm/xe/display/ext/intel_pch.c:32 intel_pch_type+0xce/0x2f0 [xe]

Signed-off-by: Matthew Auld <a class="moz-txt-link-rfc2396E" href="mailto:matthew.auld@intel.com">&lt;matthew.auld@intel.com&gt;</a>
Cc: Lucas De Marchi <a class="moz-txt-link-rfc2396E" href="mailto:lucas.demarchi@intel.com">&lt;lucas.demarchi@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/display/i915_drv.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/display/i915_drv.h b/drivers/gpu/drm/xe/display/i915_drv.h
index da83a957dd86..06348cb03f44 100644
--- a/drivers/gpu/drm/xe/display/i915_drv.h
+++ b/drivers/gpu/drm/xe/display/i915_drv.h
@@ -73,7 +73,7 @@ static inline struct drm_i915_private *kdev_to_i915(struct device *kdev)
 #define IS_ROCKETLAKE(dev_priv)	(dev_priv &amp;&amp; 0)
 #define IS_DG1(dev_priv)        IS_PLATFORM(dev_priv, XE_DG1)
 #define IS_ALDERLAKE_S(dev_priv) IS_PLATFORM(dev_priv, XE_ALDERLAKE_S)
-#define IS_ALDERLAKE_P(dev_priv) (dev_priv &amp;&amp; 0)
+#define IS_ALDERLAKE_P(dev_priv) IS_PLATFORM(dev_priv, XE_ALDERLAKE_P)
 #define IS_XEHPSDV(dev_priv) (dev_priv &amp;&amp; 0)
 #define IS_DG2(dev_priv)	IS_PLATFORM(dev_priv, XE_DG2)
 #define IS_PONTEVECCHIO(dev_priv) IS_PLATFORM(dev_priv, XE_PVC)
</pre>
    </blockquote>
  </body>
</html>

--------------9y8nsSFsSFmSAY73QiB82wP0--
