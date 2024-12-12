Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C3DAE77180
	for <intel-xe@archiver.kernel.org>; Thu, 12 Dec 2024 17:31:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6BCD10E3E3;
	Thu, 12 Dec 2024 17:30:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kV60Rxta";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72B8D10E3E3
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Dec 2024 17:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734024659; x=1765560659;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to;
 bh=qBJysWKN8M9v51By+v1kETYL841cU8jMY2vQhTcclHI=;
 b=kV60RxtaiFyva5Y0KePqo0KypMp1VF5MarzinJUH7+1x4CrK2iP9yKOO
 ePY6X1gcMitc0bEJYSAlvqGencvhaHIGp93OzcG19H9ayBHp32UtBemiM
 QwBmgID158fnO1OAF9/vopQDKYVJU+v/QoH28XhwmLKFUmzK94cGfTvlI
 TYvDuAdyIP1fkv3Vg7Rhtbs7hoVl/kDmX6S9maJCnI16GY0KfLChuYGE3
 zb/ly3ObRl8NKbIlLdaqT2M3nRJnJ962VNtMdogEGh3F3E4jmDq1MjDs4
 N+Iye5NZlCff5mlgXtQn2+XBAzByxTbG9IkWB2Un5e875QUMrVcW7KrH2 A==;
X-CSE-ConnectionGUID: jKVQggChR2WANvtQn9BY9Q==
X-CSE-MsgGUID: eU2J7NRURu2nxPJvYqABrQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11284"; a="38242635"
X-IronPort-AV: E=Sophos;i="6.12,229,1728975600"; d="scan'208,217";a="38242635"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2024 09:30:58 -0800
X-CSE-ConnectionGUID: TrmvimjgQBePMuW1vUXZ9Q==
X-CSE-MsgGUID: Fd7c5LCRRxuoxz0CA1sRjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,229,1728975600"; d="scan'208,217";a="96700667"
Received: from uweinrib-mobl1.ger.corp.intel.com (HELO [10.245.149.72])
 ([10.245.149.72])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2024 09:30:55 -0800
Content-Type: multipart/alternative;
 boundary="------------dDwiGds8G8ytj73E9V4DsaFk"
Message-ID: <c1d4a307-bebf-401d-ba88-e27675b388d7@linux.intel.com>
Date: Thu, 12 Dec 2024 18:30:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe/xe_sync: Add debug printing to check_ufence
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Cc: "Gupta, saurabhg" <saurabhg.gupta@intel.com>,
 "Zuo, Alex" <alex.zuo@intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
References: <20241206181155.87070-1-jonathan.cavitt@intel.com>
 <103d96a4-753b-4dd1-9e43-e75b12ef10bf@linux.intel.com>
 <CH0PR11MB5444CF26B806C6784B54AEFBE53E2@CH0PR11MB5444.namprd11.prod.outlook.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <CH0PR11MB5444CF26B806C6784B54AEFBE53E2@CH0PR11MB5444.namprd11.prod.outlook.com>
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
--------------dDwiGds8G8ytj73E9V4DsaFk
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On 12/11/2024 4:24 PM, Cavitt, Jonathan wrote:
>
>  
>
>  
>
> *From:*Nirmoy Das <nirmoy.das@linux.intel.com>
> *Sent:* Friday, December 6, 2024 11:28 PM
> *To:* Cavitt, Jonathan <jonathan.cavitt@intel.com>; intel-xe@lists.freedesktop.org
> *Cc:* Gupta, saurabhg <saurabhg.gupta@intel.com>; Zuo, Alex <alex.zuo@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>
> *Subject:* Re: [PATCH v2] drm/xe/xe_sync: Add debug printing to check_ufence
>
>  
>
>  
>
> On 12/6/2024 7:11 PM, Jonathan Cavitt wrote:
>
>     The xe_sync helper function check_ufence can occasionally report EBUSY
>
>     if the ufence has not been signalled yet.  EBUSY is a non-fatal error
>
>     value for the function, so it is not desireable to warn in cases where
>
>     EBUSY is reported because it is up to the user to decide if EBUSY is a
>
>     fatal error in their use cases.  However, we can and should report EBUSY
>
>     to the debug logs for diagnostic purposes.
>
>      
>
>     v2: Use vm_dbg instead of XE_IOCTL_DBG (Rodrigo)
>
>      
>
>     Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com> <mailto:jonathan.cavitt@intel.com>
>
>     CC: Rodrigo Vivi <rodrigo.vivi@intel.com> <mailto:rodrigo.vivi@intel.com>
>
>     ---
>
>      drivers/gpu/drm/xe/xe_vm.c | 10 ++++++++--
>
>      1 file changed, 8 insertions(+), 2 deletions(-)
>
>      
>
>     diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>
>     index 74d684708b00..8c770d1b916c 100644
>
>     --- a/drivers/gpu/drm/xe/xe_vm.c
>
>     +++ b/drivers/gpu/drm/xe/xe_vm.c
>
>     @@ -2402,8 +2402,11 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
>
>                break;
>
>        case DRM_GPUVA_OP_REMAP:
>
>                err = check_ufence(gpuva_to_vma(op->base.remap.unmap->va));
>
>     -          if (err)
>
>     +          if (err) {
>
>     +                  vm_dbg(&vm->xe->drm,
>
>     +                         "REMAP: vma check ufence status = %i\n", err);
>
> Move that to check_ufence() instead so there there is only one copy of logging ?
>
> IMO I think there’s value in knowing which operation is failing, and that information would
>
> be lost if we moved the logging into check_ufence.
>
igt stack strace[1] dumps the operation info and any UMD should be able know the failed operation but not against as it is now:

Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>


[1] https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12052/shard-bmg-8/igt@xe_exec_compute_mode@many-rebind.html

> -Jonathan Cavitt
>
> Regards,
>
> Nirmoy
>
>
>
>      
>
>                        break;
>
>     +          }
>
>      
>
>                err = vma_lock_and_validate(exec,
>
>                                           gpuva_to_vma(op->base.remap.unmap->va),
>
>     @@ -2415,8 +2418,11 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
>
>                break;
>
>        case DRM_GPUVA_OP_UNMAP:
>
>                err = check_ufence(gpuva_to_vma(op->base.unmap.va));
>
>     -          if (err)
>
>     +          if (err) {
>
>     +                  vm_dbg(&vm->xe->drm,
>
>     +                         "UNMAP: vma check ufence status = %i\n", err);
>
>                        break;
>
>     +          }
>
>      
>
>                err = vma_lock_and_validate(exec,
>
>                                           gpuva_to_vma(op->base.unmap.va),
>
--------------dDwiGds8G8ytj73E9V4DsaFk
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
    <div class="moz-cite-prefix">On 12/11/2024 4:24 PM, Cavitt, Jonathan
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CH0PR11MB5444CF26B806C6784B54AEFBE53E2@CH0PR11MB5444.namprd11.prod.outlook.com">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <meta name="Generator"
        content="Microsoft Word 15 (filtered medium)">
      <style>@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}@font-face
	{font-family:Aptos;}@font-face
	{font-family:Consolas;
	panose-1:2 11 6 9 2 2 4 3 2 4;}p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:12.0pt;
	font-family:"Aptos",sans-serif;}a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}pre
	{mso-style-priority:99;
	mso-style-link:"HTML Preformatted Char";
	margin:0in;
	font-size:10.0pt;
	font-family:"Courier New";}span.HTMLPreformattedChar
	{mso-style-name:"HTML Preformatted Char";
	mso-style-priority:99;
	mso-style-link:"HTML Preformatted";
	font-family:Consolas;}span.hljs
	{mso-style-name:hljs;}span.EmailStyle22
	{mso-style-type:personal-reply;
	font-family:"Aptos",sans-serif;
	color:windowtext;}.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;
	mso-ligatures:none;}div.WordSection1
	{page:WordSection1;}</style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext="edit" spidmax="1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext="edit">
<o:idmap v:ext="edit" data="1" />
</o:shapelayout></xml><![endif]-->
      <div class="WordSection1">
        <p class="MsoNormal"><span style="font-size:11.0pt"><o:p> </o:p></span></p>
        <p class="MsoNormal"><span style="font-size:11.0pt"><o:p> </o:p></span></p>
        <div>
          <div
style="border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0in 0in 0in">
            <p class="MsoNormal" style="margin-left:.5in"><b><span
style="font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif">From:</span></b><span
style="font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif">
                Nirmoy Das <a class="moz-txt-link-rfc2396E" href="mailto:nirmoy.das@linux.intel.com">&lt;nirmoy.das@linux.intel.com&gt;</a>
                <br>
                <b>Sent:</b> Friday, December 6, 2024 11:28 PM<br>
                <b>To:</b> Cavitt, Jonathan
                <a class="moz-txt-link-rfc2396E" href="mailto:jonathan.cavitt@intel.com">&lt;jonathan.cavitt@intel.com&gt;</a>;
                <a class="moz-txt-link-abbreviated" href="mailto:intel-xe@lists.freedesktop.org">intel-xe@lists.freedesktop.org</a><br>
                <b>Cc:</b> Gupta, saurabhg
                <a class="moz-txt-link-rfc2396E" href="mailto:saurabhg.gupta@intel.com">&lt;saurabhg.gupta@intel.com&gt;</a>; Zuo, Alex
                <a class="moz-txt-link-rfc2396E" href="mailto:alex.zuo@intel.com">&lt;alex.zuo@intel.com&gt;</a>; Vivi, Rodrigo
                <a class="moz-txt-link-rfc2396E" href="mailto:rodrigo.vivi@intel.com">&lt;rodrigo.vivi@intel.com&gt;</a><br>
                <b>Subject:</b> Re: [PATCH v2] drm/xe/xe_sync: Add debug
                printing to check_ufence<o:p></o:p></span></p>
          </div>
        </div>
        <p class="MsoNormal" style="margin-left:.5in"><o:p> </o:p></p>
        <p style="margin-left:.5in"><o:p> </o:p></p>
        <div>
          <p class="MsoNormal" style="margin-left:.5in">On 12/6/2024
            7:11 PM, Jonathan Cavitt wrote:<o:p></o:p></p>
        </div>
        <blockquote style="margin-top:5.0pt;margin-bottom:5.0pt">
          <pre style="margin-left:.5in">The xe_sync helper function check_ufence can occasionally report EBUSY<o:p></o:p></pre>
          <pre style="margin-left:.5in">if the ufence has not been signalled yet.  EBUSY is a non-fatal error<o:p></o:p></pre>
          <pre style="margin-left:.5in">value for the function, so it is not desireable to warn in cases where<o:p></o:p></pre>
          <pre style="margin-left:.5in">EBUSY is reported because it is up to the user to decide if EBUSY is a<o:p></o:p></pre>
          <pre style="margin-left:.5in">fatal error in their use cases.  However, we can and should report EBUSY<o:p></o:p></pre>
          <pre style="margin-left:.5in">to the debug logs for diagnostic purposes.<o:p></o:p></pre>
          <pre style="margin-left:.5in"><o:p> </o:p></pre>
          <pre style="margin-left:.5in">v2: Use vm_dbg instead of XE_IOCTL_DBG (Rodrigo)<o:p></o:p></pre>
          <pre style="margin-left:.5in"><o:p> </o:p></pre>
          <pre style="margin-left:.5in">Signed-off-by: Jonathan Cavitt <a
          href="mailto:jonathan.cavitt@intel.com" moz-do-not-send="true">&lt;jonathan.cavitt@intel.com&gt;</a><o:p></o:p></pre>
          <pre style="margin-left:.5in">CC: Rodrigo Vivi <a
          href="mailto:rodrigo.vivi@intel.com" moz-do-not-send="true">&lt;rodrigo.vivi@intel.com&gt;</a><o:p></o:p></pre>
          <pre style="margin-left:.5in">---<o:p></o:p></pre>
          <pre style="margin-left:.5in"> drivers/gpu/drm/xe/xe_vm.c | 10 ++++++++--<o:p></o:p></pre>
          <pre style="margin-left:.5in"> 1 file changed, 8 insertions(+), 2 deletions(-)<o:p></o:p></pre>
          <pre style="margin-left:.5in"><o:p> </o:p></pre>
          <pre style="margin-left:.5in">diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c<o:p></o:p></pre>
          <pre style="margin-left:.5in">index 74d684708b00..8c770d1b916c 100644<o:p></o:p></pre>
          <pre style="margin-left:.5in">--- a/drivers/gpu/drm/xe/xe_vm.c<o:p></o:p></pre>
          <pre style="margin-left:.5in">+++ b/drivers/gpu/drm/xe/xe_vm.c<o:p></o:p></pre>
          <pre style="margin-left:.5in">@@ -2402,8 +2402,11 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,<o:p></o:p></pre>
          <pre style="margin-left:.5in">           break;<o:p></o:p></pre>
          <pre style="margin-left:.5in">   case DRM_GPUVA_OP_REMAP:<o:p></o:p></pre>
          <pre style="margin-left:.5in">           err = check_ufence(gpuva_to_vma(op-&gt;base.remap.unmap-&gt;va));<o:p></o:p></pre>
          <pre style="margin-left:.5in">-          if (err)<o:p></o:p></pre>
          <pre style="margin-left:.5in">+          if (err) {<o:p></o:p></pre>
          <pre style="margin-left:.5in">+                  vm_dbg(&amp;vm-&gt;xe-&gt;drm,<o:p></o:p></pre>
          <pre style="margin-left:.5in">+                         "REMAP: vma check ufence status = %i\n", err);<o:p></o:p></pre>
        </blockquote>
        <p style="margin-left:.5in">Move that to <span class="hljs">check_ufence()
            instead so there there is only one copy of logging ?
            <o:p></o:p></span></p>
        <p><span style="font-size:11.0pt">IMO I think there’s value in
            knowing which operation is failing, and that information
            would<o:p></o:p></span></p>
        <p><span style="font-size:11.0pt">be lost if we moved the
            logging into check_ufence.</span></p>
      </div>
    </blockquote>
    <p>igt stack strace[1] dumps the operation info and any UMD should
      be able know the failed operation but not against as it is now: <br>
    </p>
    <p>Reviewed-by: Nirmoy Das <a class="moz-txt-link-rfc2396E" href="mailto:nirmoy.das@intel.com">&lt;nirmoy.das@intel.com&gt;</a><br>
    </p>
    <p><br>
    </p>
    <p>[1]
<a class="moz-txt-link-freetext" href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12052/shard-bmg-8/igt@xe_exec_compute_mode@many-rebind.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12052/shard-bmg-8/igt@xe_exec_compute_mode@many-rebind.html</a><br>
    </p>
    <blockquote type="cite"
cite="mid:CH0PR11MB5444CF26B806C6784B54AEFBE53E2@CH0PR11MB5444.namprd11.prod.outlook.com">
      <div class="WordSection1">
        <p><span style="font-size:11.0pt"><o:p></o:p></span></p>
        <p><span style="font-size:11.0pt">-Jonathan Cavitt<o:p></o:p></span></p>
        <p style="margin-left:.5in"><span class="hljs">Regards,</span><o:p></o:p></p>
        <p style="margin-left:.5in"><span class="hljs">Nirmoy </span><o:p></o:p></p>
        <p class="MsoNormal" style="margin-left:.5in"><br>
          <br>
          <o:p></o:p></p>
        <blockquote style="margin-top:5.0pt;margin-bottom:5.0pt">
          <pre style="margin-left:.5in"><o:p> </o:p></pre>
          <pre style="margin-left:.5in">                   break;<o:p></o:p></pre>
          <pre style="margin-left:.5in">+          }<o:p></o:p></pre>
          <pre style="margin-left:.5in"> <o:p></o:p></pre>
          <pre style="margin-left:.5in">           err = vma_lock_and_validate(exec,<o:p></o:p></pre>
          <pre style="margin-left:.5in">                                      gpuva_to_vma(op-&gt;base.remap.unmap-&gt;va),<o:p></o:p></pre>
          <pre style="margin-left:.5in">@@ -2415,8 +2418,11 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,<o:p></o:p></pre>
          <pre style="margin-left:.5in">           break;<o:p></o:p></pre>
          <pre style="margin-left:.5in">   case DRM_GPUVA_OP_UNMAP:<o:p></o:p></pre>
          <pre style="margin-left:.5in">           err = check_ufence(gpuva_to_vma(op-&gt;base.unmap.va));<o:p></o:p></pre>
          <pre style="margin-left:.5in">-          if (err)<o:p></o:p></pre>
          <pre style="margin-left:.5in">+          if (err) {<o:p></o:p></pre>
          <pre style="margin-left:.5in">+                  vm_dbg(&amp;vm-&gt;xe-&gt;drm,<o:p></o:p></pre>
          <pre style="margin-left:.5in">+                         "UNMAP: vma check ufence status = %i\n", err);<o:p></o:p></pre>
          <pre style="margin-left:.5in">                   break;<o:p></o:p></pre>
          <pre style="margin-left:.5in">+          }<o:p></o:p></pre>
          <pre style="margin-left:.5in"> <o:p></o:p></pre>
          <pre style="margin-left:.5in">           err = vma_lock_and_validate(exec,<o:p></o:p></pre>
          <pre style="margin-left:.5in">                                      gpuva_to_vma(op-&gt;base.unmap.va),<o:p></o:p></pre>
        </blockquote>
      </div>
    </blockquote>
  </body>
</html>

--------------dDwiGds8G8ytj73E9V4DsaFk--
