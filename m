Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD801C54F4C
	for <intel-xe@archiver.kernel.org>; Tue, 28 Jul 2026 14:47:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84E5410E943;
	Tue, 28 Jul 2026 14:47:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FdvfpAHY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DC4010E943
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Jul 2026 14:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785250064; x=1816786064;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to;
 bh=2B+xVWidP1VSdvISWjAAZnOOiQi1NGUXDtiV6J6Eifk=;
 b=FdvfpAHYHvHBq2kVte3ZhFTK85AaQzOkmaWTued1/g3TBGubN5ieZvPC
 5CV5WCB6f3xD4E9kpLAR67SofSRtm5rst4hOKN3jQLBcJdjqKj+OzbMNx
 REbC179KspKKgqj4/1Efbu1odwujPOO8xYbeKKPkCOumK2cLUBeZsem7d
 UJpPLaM+LuJ0sDVYGfv3Y1gBto2lQOM0pcc49jaMP5kDE0cSKEnXMAm0b
 wmSPQEGzwWS8Ie7JXVL+/4xZ0xnEgGYLOXz1F/bxXHXbJ1Qd9Xcp+tx70
 RtdcKLu/jWiuGrnSAHLvCZvYYMYhLXRiiaxjBkPwgTCvdDuXUNtPp6s7L w==;
X-CSE-ConnectionGUID: w6gtMSscRdaVLe3rk6Wjyg==
X-CSE-MsgGUID: UwWls+7iRme14Noeicy9fA==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="85954641"
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; d="scan'208,217";a="85954641"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2026 07:47:44 -0700
X-CSE-ConnectionGUID: h54O2aHLQr2kCE/jXEEepA==
X-CSE-MsgGUID: PjS5Ai20SfKo0QU2PBf2Sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; 
 d="scan'208,217";a="289676931"
Received: from aiddamse-mobl3.gar.corp.intel.com (HELO [10.247.183.94])
 ([10.247.183.94])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2026 07:47:42 -0700
Content-Type: multipart/alternative;
 boundary="------------nObe0p7aUS9WvBzOco75rKRw"
Message-ID: <b935fecb-ad8d-4e4c-b63e-8bcbc764320e@linux.intel.com>
Date: Tue, 28 Jul 2026 20:17:39 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/19] drm/xe/log: Extend components list with hardware
 items
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>, Yoni Levitt <yoni.levitt@intel.com>
References: <20260723203754.3782-1-michal.wajdeczko@intel.com>
 <20260723203754.3782-11-michal.wajdeczko@intel.com>
 <91c76e0f-073c-416c-969e-5cf81c0a330c@linux.intel.com>
 <2b075c91-db8a-4099-84cb-0102db5d3225@intel.com>
Content-Language: en-US
From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
In-Reply-To: <2b075c91-db8a-4099-84cb-0102db5d3225@intel.com>
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
--------------nObe0p7aUS9WvBzOco75rKRw
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On 24-07-2026 20:41, Michal Wajdeczko wrote:
>
> On 7/24/2026 1:49 PM, Aravind Iddamsetty wrote:
>> On 24-07-2026 02:07, Michal Wajdeczko wrote:
>>> Update our super macro with new top level hardware components.
>>>
>>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>> ---
>>>  drivers/gpu/drm/xe/abi/xe_log_abi.h | 11 +++++++++++
>>>  1 file changed, 11 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/xe/abi/xe_log_abi.h b/drivers/gpu/drm/xe/abi/xe_log_abi.h
>>> index cde86c6c08f2..edf4dc13377d 100644
>>> --- a/drivers/gpu/drm/xe/abi/xe_log_abi.h
>>> +++ b/drivers/gpu/drm/xe/abi/xe_log_abi.h
>>> @@ -124,6 +124,10 @@ enum xe_log_location_bits {
>>>   *     @SIGID is the default xe_sigid for the component (without the XE_SIGID_ prefix)
>>>   */
>>>  #define DEFINE_XE_LOG_COMPONENTS(define) \
>>> +	DEFINE_XE_LOG_SOFTWARE_COMPONENTS(define) \
>>> +	DEFINE_XE_LOG_HARDWARE_COMPONENTS(define)
>>> +
>>> +#define DEFINE_XE_LOG_SOFTWARE_COMPONENTS(define) \
>>>  	/* */									\
>>>  	define(SYSTEM, 1, PCI, SW, "Linux PCI Subsystem")			\
>>>  	define(SYSTEM, 2, DRM, SW, "DRM")					\
>>> @@ -151,6 +155,13 @@ enum xe_log_location_bits {
>>>  	define(DRIVER_FIRMWARE, 3, GSC, RUNTIME_FW, "GSC")			\
>>>  	define(DRIVER_FIRMWARE, 16, PCODE, DEVICE_FW, "PCode")			\
>>>  	define(DRIVER_FIRMWARE, 17, SYSCTRL, DEVICE_FW, "System Controller")	\
>>> +
>>> +#define DEFINE_XE_LOG_HARDWARE_COMPONENTS(define) \
>>> +	define(HARDWARE, 1, PCIE, PCIE, "PCIe Interface")			\
>>> +	define(HARDWARE, 2, HWCORE, CORE_COMPUTE, "Core Compute")		\
>>> +	define(HARDWARE, 3, DEVMEM, DEVICE_MEMORY, "Device Memory")		\
>>> +	define(HARDWARE, 4, FABRIC, FABRIC, "Fabric")				\
>>> +	define(HARDWARE, 5, SOC, SOC_INTERNAL, "SoC Internal")			\
>>>  	/* eod */
>>>  
>> For HW errors FW already reports the components, we already have
>> definition of component "enum xe_ras_component" that matches how FW
>> reports the errors we shall reuse it not redefine again.
> from what I can see in [1] this enum was defined just as local definition and there was no mention that they are fixed HW originated values and wasn't placed in regs/ (like we do with all HW related stuff)

check
this https://gitlab.com/freedesktop-mirror/drm-tip/-/blob/drm-tip/drivers/gpu/drm/xe/xe_ras.c?ref_type=heads#L379

where error details is retrieved from FW and component details are
extracted into structxe_ras_error_class
<https://elixir.bootlin.com/linux/v7.2-rc4/C/ident/xe_ras_error_class>

>
> OTOH, these LOG components definitions are supposed to be part of the log ABI, so shall be defined in more exposed place (like our abi/ folder)
>
> but there is still a solution for this.
>
> we can define HW LOG components in this LOG abi/ as:
>
> +	define(HARDWARE, 1, DEVMEM, DEVICE_MEMORY, "Device Memory")		\
> +	define(HARDWARE, 2, HWCORE, CORE_COMPUTE, "Core Compute")		\
> +	define(HARDWARE, 4, PCIE, PCIE, "PCIe Interface")			\
> +	define(HARDWARE, 5, FABRIC, FABRIC, "Fabric")				\
> +	define(HARDWARE, 6, SOC, SOC_INTERNAL, "SoC Internal")			\

As the component needs to go to CPER in case of HW errors it will
derived from structxe_ras_error_class
<https://elixir.bootlin.com/linux/v7.2-rc4/C/ident/xe_ras_error_class>
given by FW which will go into CPER. We shall use whatever the FW has given.

Thanks,

Aravind.

>
> as this will include TYPE(HARDWARE) definition for each component identifier
> so the XE_LOG_COMPONENT_SOC is still defined as 0x0608, not as a plain 6
>
> and have separate HW components definitions as reported by the FW in another abi/ as:
>
> 	SYSCTRL_COMP_DEVICE_MEMORY = 1,
> 	SYSCTRL_COMP_CORE_COMPUTE = 2,
> 	SYSCTRL_COMP_PCIE = 4,
> 	SYSCTRL_COMP_FABRIC = 5,
> 	SYSCTRL_COMP_SOC_INTERNAL = 6,
>
> and finally somewhere in the code we can make sure we don't change that accidentally:
>
> 	BUILD_BUG_ON(SYSCTRL_COMP_DEVICE_MEMORY !=
> 		     FIELD_GET(XE_LOG_LOCATION_ID_MASK,
> 			       XE_LOG_COMPONENT_DEVICE_MEMORY));
> 	...
> 	BUILD_BUG_ON(SYSCTRL_COMP_SOC_INTERNAL !=	// aka 6
> 		     FIELD_GET(XE_LOG_LOCATION_ID_MASK,	// aka 0xFF00
> 			       XE_LOG_COMPONENT_SOC));  // aka 0x0608
>
>
> [1] https://elixir.bootlin.com/linux/v7.2-rc4/source/drivers/gpu/drm/xe/xe_ras.c#L23
>
>
>> Thanks,
>> Aravind.
>>>  /**
--------------nObe0p7aUS9WvBzOco75rKRw
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 24-07-2026 20:41, Michal Wajdeczko
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:2b075c91-db8a-4099-84cb-0102db5d3225@intel.com">
      <pre wrap="" class="moz-quote-pre">

On 7/24/2026 1:49 PM, Aravind Iddamsetty wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">
On 24-07-2026 02:07, Michal Wajdeczko wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">Update our super macro with new top level hardware components.

Signed-off-by: Michal Wajdeczko <a class="moz-txt-link-rfc2396E" href="mailto:michal.wajdeczko@intel.com">&lt;michal.wajdeczko@intel.com&gt;</a>
Cc: Rodrigo Vivi <a class="moz-txt-link-rfc2396E" href="mailto:rodrigo.vivi@intel.com">&lt;rodrigo.vivi@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/abi/xe_log_abi.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/xe/abi/xe_log_abi.h b/drivers/gpu/drm/xe/abi/xe_log_abi.h
index cde86c6c08f2..edf4dc13377d 100644
--- a/drivers/gpu/drm/xe/abi/xe_log_abi.h
+++ b/drivers/gpu/drm/xe/abi/xe_log_abi.h
@@ -124,6 +124,10 @@ enum xe_log_location_bits {
  *     @SIGID is the default xe_sigid for the component (without the XE_SIGID_ prefix)
  */
 #define DEFINE_XE_LOG_COMPONENTS(define) \
+	DEFINE_XE_LOG_SOFTWARE_COMPONENTS(define) \
+	DEFINE_XE_LOG_HARDWARE_COMPONENTS(define)
+
+#define DEFINE_XE_LOG_SOFTWARE_COMPONENTS(define) \
 	/* */									\
 	define(SYSTEM, 1, PCI, SW, "Linux PCI Subsystem")			\
 	define(SYSTEM, 2, DRM, SW, "DRM")					\
@@ -151,6 +155,13 @@ enum xe_log_location_bits {
 	define(DRIVER_FIRMWARE, 3, GSC, RUNTIME_FW, "GSC")			\
 	define(DRIVER_FIRMWARE, 16, PCODE, DEVICE_FW, "PCode")			\
 	define(DRIVER_FIRMWARE, 17, SYSCTRL, DEVICE_FW, "System Controller")	\
+
+#define DEFINE_XE_LOG_HARDWARE_COMPONENTS(define) \
+	define(HARDWARE, 1, PCIE, PCIE, "PCIe Interface")			\
+	define(HARDWARE, 2, HWCORE, CORE_COMPUTE, "Core Compute")		\
+	define(HARDWARE, 3, DEVMEM, DEVICE_MEMORY, "Device Memory")		\
+	define(HARDWARE, 4, FABRIC, FABRIC, "Fabric")				\
+	define(HARDWARE, 5, SOC, SOC_INTERNAL, "SoC Internal")			\
 	/* eod */
 
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
For HW errors FW already reports the components, we already have
definition of component "enum xe_ras_component" that matches how FW
reports the errors we shall reuse it not redefine again.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
from what I can see in [1] this enum was defined just as local definition and there was no mention that they are fixed HW originated values and wasn't placed in regs/ (like we do with all HW related stuff)</pre>
    </blockquote>
    <p>check
this <a class="moz-txt-link-freetext" href="https://gitlab.com/freedesktop-mirror/drm-tip/-/blob/drm-tip/drivers/gpu/drm/xe/xe_ras.c?ref_type=heads#L379">https://gitlab.com/freedesktop-mirror/drm-tip/-/blob/drm-tip/drivers/gpu/drm/xe/xe_ras.c?ref_type=heads#L379</a></p>
    <p>where error details is retrieved from FW and component details
      are extracted into <span class="k"
style="box-sizing: inherit; vertical-align: top; font-family: &quot;Ubuntu Mono&quot;, monospace; font-size: 14.4px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; text-align: start; text-indent: 0px; text-transform: none; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">struct</span><span
      class="w"
style="box-sizing: inherit; vertical-align: top; font-family: &quot;Ubuntu Mono&quot;, monospace; font-size: 14.4px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; text-align: start; text-indent: 0px; text-transform: none; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;"> </span><span
      class="nc"
style="box-sizing: inherit; vertical-align: top; font-family: &quot;Ubuntu Mono&quot;, monospace; font-size: 14.4px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; text-align: start; text-indent: 0px; text-transform: none; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;"><a
      class="ident"
href="https://elixir.bootlin.com/linux/v7.2-rc4/C/ident/xe_ras_error_class"
style="box-sizing: inherit; background: linear-gradient(rgba(0, 0, 0, 0) 10%, rgb(244, 246, 255) 10%, rgb(244, 246, 255) 90%, rgba(0, 0, 0, 0) 90%); text-decoration: none; outline: dotted 1px; outline-offset: -1px; vertical-align: top; font-weight: 700; border-radius: 0.2em; border-bottom: 1px dotted rgb(0, 0, 0);">xe_ras_error_class</a></span></p>
    <blockquote type="cite"
      cite="mid:2b075c91-db8a-4099-84cb-0102db5d3225@intel.com">
      <pre wrap="" class="moz-quote-pre">

OTOH, these LOG components definitions are supposed to be part of the log ABI, so shall be defined in more exposed place (like our abi/ folder)

but there is still a solution for this.

we can define HW LOG components in this LOG abi/ as:

+	define(HARDWARE, 1, DEVMEM, DEVICE_MEMORY, "Device Memory")		\
+	define(HARDWARE, 2, HWCORE, CORE_COMPUTE, "Core Compute")		\
+	define(HARDWARE, 4, PCIE, PCIE, "PCIe Interface")			\
+	define(HARDWARE, 5, FABRIC, FABRIC, "Fabric")				\
+	define(HARDWARE, 6, SOC, SOC_INTERNAL, "SoC Internal")			\</pre>
    </blockquote>
    <p>As the component needs to go to CPER in case of HW errors it will
      derived from <span class="k"
style="box-sizing: inherit; vertical-align: top; font-family: &quot;Ubuntu Mono&quot;, monospace; font-size: 14.4px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; text-align: start; text-indent: 0px; text-transform: none; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">struct</span><span
      class="w"
style="box-sizing: inherit; vertical-align: top; font-family: &quot;Ubuntu Mono&quot;, monospace; font-size: 14.4px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; text-align: start; text-indent: 0px; text-transform: none; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;"> </span><span
      class="nc"
style="box-sizing: inherit; vertical-align: top; font-family: &quot;Ubuntu Mono&quot;, monospace; font-size: 14.4px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; text-align: start; text-indent: 0px; text-transform: none; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;"><a
      class="ident"
href="https://elixir.bootlin.com/linux/v7.2-rc4/C/ident/xe_ras_error_class"
style="box-sizing: inherit; background: linear-gradient(rgba(0, 0, 0, 0) 10%, rgb(244, 246, 255) 10%, rgb(244, 246, 255) 90%, rgba(0, 0, 0, 0) 90%); text-decoration: none; outline: dotted 1px; outline-offset: -1px; vertical-align: top; font-weight: 700; border-radius: 0.2em; border-bottom: 1px dotted rgb(0, 0, 0);">xe_ras_error_class</a> given by FW which will go into CPER. We shall use whatever the FW has given.</span></p>
    <p><span class="nc"
style="box-sizing: inherit; vertical-align: top; font-family: &quot;Ubuntu Mono&quot;, monospace; font-size: 14.4px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; text-align: start; text-indent: 0px; text-transform: none; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">Thanks,</span></p>
    <p><span class="nc"
style="box-sizing: inherit; vertical-align: top; font-family: &quot;Ubuntu Mono&quot;, monospace; font-size: 14.4px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; text-align: start; text-indent: 0px; text-transform: none; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">Aravind.</span></p>
    <blockquote type="cite"
      cite="mid:2b075c91-db8a-4099-84cb-0102db5d3225@intel.com">
      <pre wrap="" class="moz-quote-pre">

as this will include TYPE(HARDWARE) definition for each component identifier
so the XE_LOG_COMPONENT_SOC is still defined as 0x0608, not as a plain 6

and have separate HW components definitions as reported by the FW in another abi/ as:

	SYSCTRL_COMP_DEVICE_MEMORY = 1,
	SYSCTRL_COMP_CORE_COMPUTE = 2,
	SYSCTRL_COMP_PCIE = 4,
	SYSCTRL_COMP_FABRIC = 5,
	SYSCTRL_COMP_SOC_INTERNAL = 6,

and finally somewhere in the code we can make sure we don't change that accidentally:

	BUILD_BUG_ON(SYSCTRL_COMP_DEVICE_MEMORY !=
		     FIELD_GET(XE_LOG_LOCATION_ID_MASK,
			       XE_LOG_COMPONENT_DEVICE_MEMORY));
	...
	BUILD_BUG_ON(SYSCTRL_COMP_SOC_INTERNAL !=	// aka 6
		     FIELD_GET(XE_LOG_LOCATION_ID_MASK,	// aka 0xFF00
			       XE_LOG_COMPONENT_SOC));  // aka 0x0608


[1] <a class="moz-txt-link-freetext" href="https://elixir.bootlin.com/linux/v7.2-rc4/source/drivers/gpu/drm/xe/xe_ras.c#L23">https://elixir.bootlin.com/linux/v7.2-rc4/source/drivers/gpu/drm/xe/xe_ras.c#L23</a>


</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">
Thanks,
Aravind.
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre"> /**
</pre>
        </blockquote>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
</pre>
    </blockquote>
  </body>
</html>

--------------nObe0p7aUS9WvBzOco75rKRw--
