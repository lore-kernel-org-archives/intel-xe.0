Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50D09E7718F
	for <intel-xe@archiver.kernel.org>; Wed,  1 Jan 2025 13:25:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFADE10E05D;
	Wed,  1 Jan 2025 13:25:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BfyADw/w";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C45BF10E05D
 for <intel-xe@lists.freedesktop.org>; Wed,  1 Jan 2025 13:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1735737955; x=1767273955;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=O4XVS9kqxmNdfEkA47hUPyNcKcEqoQ9n16YYjiKIE8o=;
 b=BfyADw/wds3gkQUmes79kV2UhtzqzpCDES0IrloGUW+t5hvciunKU2K3
 HztuiY+Gdk2aCGvHisysnW1EEOSC+pMcaegNacnagFB9iHlyJ2rVi0+bM
 64VgcSGhjRDiLJ+0Vb9qgq0KcPCEoVjlUcSlTsLMax2H/QSgGmB0/UjGb
 zIAejtw6cnwa/6TEDC64eFQkGMU3+ofQHbwnnbKqVLINc2QKitsSBQY7w
 xIH48NhwtlyTcLTSLx6uVhR8V3j5JWqrE14rpYsLuUbJLjCfrMcyq8ghl
 kbz1L7Hfw5nItXqAFBBswdYurr3+lBzoxKr0nR+i9vGxBDDrWy9IO4zW1 Q==;
X-CSE-ConnectionGUID: d1OVIpd0TiiYgGX2shQHXw==
X-CSE-MsgGUID: gvSSz6nwQS6KAOqo1GeP/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11302"; a="35875940"
X-IronPort-AV: E=Sophos;i="6.12,282,1728975600"; d="scan'208";a="35875940"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jan 2025 05:25:54 -0800
X-CSE-ConnectionGUID: OqSxrWGqRAWs3rkpxyH7rA==
X-CSE-MsgGUID: 4aOUv3tcRk+eB79+eR/HBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="102116782"
Received: from ldmartin-desk2.corp.intel.com (HELO ldmartin-desk2)
 ([10.125.109.191])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jan 2025 05:25:54 -0800
Date: Wed, 1 Jan 2025 07:25:48 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>, 
 intel-xe@lists.freedesktop.org, Gustavo Sousa <gustavo.sousa@intel.com>, 
 Radhakrishna Sripada <radhakrishna.sripada@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, stable@vger.kernel.org
Subject: Re: [PATCH] drm/xe/tracing: Fix a potential TP_printk UAF
Message-ID: <niinok4526kq3m4ethzcesfbd62jdd5x43yjefpdtarxa4xakq@scwsd6ukojph>
References: <20241223134250.14345-1-thomas.hellstrom@linux.intel.com>
 <Z2mFePfn73Fugmrf@lstrano-desk.jf.intel.com>
 <de948e6d024abe0bbd5ac30087471c02dff0dc09.camel@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <de948e6d024abe0bbd5ac30087471c02dff0dc09.camel@linux.intel.com>
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

On Mon, Dec 23, 2024 at 05:33:10PM +0100, Thomas Hellström wrote:
>On Mon, 2024-12-23 at 07:44 -0800, Matthew Brost wrote:
>> On Mon, Dec 23, 2024 at 02:42:50PM +0100, Thomas Hellström wrote:
>> > The commit
>> > afd2627f727b ("tracing: Check "%s" dereference via the field and
>> > not the TP_printk format")
>> > exposes potential UAFs in the xe_bo_move trace event.
>> >
>> > Fix those by avoiding dereferencing the
>> > xe_mem_type_to_name[] array at TP_printk time.
>> >
>> > Since some code refactoring has taken place, explicit backporting
>> > may
>> > be needed for kernels older than 6.10.
>> >
>> > Fixes: e46d3f813abd ("drm/xe/trace: Extract bo, vm, vma traces")
>> > Cc: Gustavo Sousa <gustavo.sousa@intel.com>
>> > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> > Cc: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
>> > Cc: Matt Roper <matthew.d.roper@intel.com>
>> > Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
>> > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> > Cc: intel-xe@lists.freedesktop.org
>> > Cc: <stable@vger.kernel.org> # v6.11+
>> > Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> > ---
>> >  drivers/gpu/drm/xe/xe_trace_bo.h | 12 ++++++------
>> >  1 file changed, 6 insertions(+), 6 deletions(-)
>> >
>> > diff --git a/drivers/gpu/drm/xe/xe_trace_bo.h
>> > b/drivers/gpu/drm/xe/xe_trace_bo.h
>> > index 1762dd30ba6d..ea50fee50c7d 100644
>> > --- a/drivers/gpu/drm/xe/xe_trace_bo.h
>> > +++ b/drivers/gpu/drm/xe/xe_trace_bo.h
>> > @@ -60,8 +60,8 @@ TRACE_EVENT(xe_bo_move,
>> >  	    TP_STRUCT__entry(
>> >  		     __field(struct xe_bo *, bo)
>> >  		     __field(size_t, size)
>> > -		     __field(u32, new_placement)
>> > -		     __field(u32, old_placement)
>> > +		     __string(new_placement_name,
>> > xe_mem_type_to_name[new_placement])
>> > +		     __string(old_placement_name,
>> > xe_mem_type_to_name[old_placement])
>> >  		     __string(device_id, __dev_name_bo(bo))
>> >  		     __field(bool, move_lacks_source)
>> >  			),
>> > @@ -69,15 +69,15 @@ TRACE_EVENT(xe_bo_move,
>> >  	    TP_fast_assign(
>> >  		   __entry->bo      = bo;
>> >  		   __entry->size = bo->size;
>> > -		   __entry->new_placement = new_placement;
>> > -		   __entry->old_placement = old_placement;
>> > +		   __assign_str(new_placement_name);
>> > +		   __assign_str(old_placement_name);
>> >  		   __assign_str(device_id);
>> >  		   __entry->move_lacks_source = move_lacks_source;
>> >  		   ),
>> >  	    TP_printk("move_lacks_source:%s, migrate object %p
>> > [size %zu] from %s to %s device_id:%s",
>> >  		      __entry->move_lacks_source ? "yes" : "no",
>> > __entry->bo, __entry->size,
>> > -		      xe_mem_type_to_name[__entry->old_placement],
>> > -		      xe_mem_type_to_name[__entry->new_placement],
>> > __get_str(device_id))
>>
>> So is this the UAF? i.e., The Xe module unloads and
>> xe_mem_type_to_name
>> is gone?
>
>I would imagine that's the intention of the warning. However removing
>the xe_module seems to empty the trace buffer of xe_bo_move events.
>Whether there is a race in that process or whether the TP_printk check
>can't distinguish between module local addresses and other addresses is
>hard to tell. In any case, it looks like we need to comply with the
>warning here (I suspect CI refuses to run otherwise), and since it only
>appears to trigger on the xe module load on my system, it's unlikely
>that mentioned commit will be reverted.

it's actually a false positive from afd2627f727b. See explanation
by Steve at https://lore.kernel.org/all/20241230141329.5f698715@batman.local.home/
the fix later on

Lucas De Marchi


>
>
>>
>> I noticed that xe_mem_type_to_name is not static, it likely should
>> be.
>> Would that help here?
>
>No, doesn't help unfortunately.
>
>/Thomas
>
>
>
>>
>> Matt
>>
>> > +		      __get_str(old_placement_name),
>> > +		      __get_str(new_placement_name),
>> > __get_str(device_id))
>> >  );
>> >  
>> >  DECLARE_EVENT_CLASS(xe_vma,
>> > --
>> > 2.47.1
>> >
>
