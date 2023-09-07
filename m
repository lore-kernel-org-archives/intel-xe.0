Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49BE4EC8734
	for <intel-xe@archiver.kernel.org>; Thu,  7 Sep 2023 14:17:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 026C010E7F2;
	Thu,  7 Sep 2023 14:17:04 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A587210E7EF
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Sep 2023 14:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694096221; x=1725632221;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=4+Ph+66GdGsA7/TfWsNpI44lZFZUTbe+ydP1v5ybGRQ=;
 b=lhAR9W+/qL+f8tSkcl9QlABigzbNParQ1xNCmQ6Ei7/SEs0u3hxMcIPL
 +V539u9q1P3Asagd2WoilK6b2WwpVdkxSgY0GlBmZ7UQ/LxGqn1jtGm2I
 5thmG5CLcyzfMeNTA1Q5RhxZ8V/MS7+/E5Sj6ep+1/PMorPtcH2wCMkoZ
 Ma8Dv4LEamhO2FrkRfobi4J9DTSeY3C52dMVShIDnOcrsIzU3NbwJMFES
 rRR/wrZCmCiksLMLKoKg1LWxCJ4FkM882AZARzl2m/u2qRuj3RgJgOTVS
 741Y+tfBEXT+87JakT+bOGX5Eb8CTyeAzIeNrM7GEJQeFlLxOTBMjkPIE g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="441363437"
X-IronPort-AV: E=Sophos;i="6.02,235,1688454000"; d="scan'208";a="441363437"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2023 06:53:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="832178012"
X-IronPort-AV: E=Sophos;i="6.02,235,1688454000"; d="scan'208";a="832178012"
Received: from mkuoppal-desk.fi.intel.com (HELO localhost) ([10.237.72.193])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2023 06:53:27 -0700
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
In-Reply-To: <ZPi0gnYZlMk6mD2d@intel.com>
References: <20230904123605.3255946-1-mika.kuoppala@linux.intel.com>
 <20230904144644.3259148-1-mika.kuoppala@linux.intel.com>
 <ZPi0gnYZlMk6mD2d@intel.com>
Date: Thu, 07 Sep 2023 16:51:21 +0300
Message-ID: <87zg1yay7a.fsf@mkuoppal-desk>
MIME-Version: 1.0
Content-Type: text/plain
Subject: Re: [Intel-xe] [PATCH] drm/xe: Extend drm_xe_vm_bind_op
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
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Francois Dugast <francois.dugast@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Rodrigo Vivi <rodrigo.vivi@intel.com> writes:

> On Mon, Sep 04, 2023 at 05:46:44PM +0300, Mika Kuoppala wrote:
>> The bind api is extensible but for a single bind op, there
>> is not a mechanism to extend. Add extensions field to
>> struct drm_xe_vm_bind_op.
>
> But why would you want to extend the operation?
> Except for the destroy ones, every ioctl itself is extensible.
>
> So, DRM_IOCTL_XE_VM_BIND is extensible. Why would we need to get
> prepared to extend the operations themselves? And if we extend
> the operation, what to do with the extension at the ioctl level?
> which one has precedence? how to organize that?
>

The intent is to pass debugger metadata as part of particular
vm bind operation. For example on MAP, we could associate
ELF/ISA (relevant parts) as metadata for this bind range.

So in vector of binds, we want to tag specific one map (in between)
with debugger metadata.

With extending the XE_VM_BIND itself, this could be possible too
but would then need to deliver index into the vector instead
of carrying the metadata as part of per operation.
As atleast in this example, the extension is heavily tied
into particular OP (map).

I take that you mean precedence of VM_BIND vs bind op?
Excellent question and I dont know all the use cases the
vm_bind have to cater. So I can only refer to example above,
VM_BIND extensions would be only in scope to all operations
and vm_bind_op extensions would be tightly coupled to per
operation only.

Thanks for feedback!
-Mika

>> 
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> Cc: Francois Dugast <francois.dugast@intel.com>
>> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
>> Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
>> Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
>> ---
>>  include/uapi/drm/xe_drm.h | 3 +++
>>  1 file changed, 3 insertions(+)
>> 
>> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>> index 86f16d50e9cc..5c6c86f5e5fc 100644
>> --- a/include/uapi/drm/xe_drm.h
>> +++ b/include/uapi/drm/xe_drm.h
>> @@ -552,6 +552,9 @@ struct drm_xe_vm_destroy {
>>  };
>>  
>>  struct drm_xe_vm_bind_op {
>> +	/** @extensions: Pointer to the first extension struct, if any */
>> +	__u64 extensions;
>> +
>>  	/**
>>  	 * @obj: GEM object to operate on, MBZ for MAP_USERPTR, MBZ for UNMAP
>>  	 */
>> -- 
>> 2.34.1
>> 
