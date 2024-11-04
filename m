Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44D35D1BDF4
	for <intel-xe@archiver.kernel.org>; Mon,  4 Nov 2024 20:59:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D4D010E4CF;
	Mon,  4 Nov 2024 20:59:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nBHvfkVt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A63C210E4C5
 for <intel-xe@lists.freedesktop.org>; Mon,  4 Nov 2024 20:59:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730753989; x=1762289989;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Dh0zJjwdPeEaKs077SjNl5ZtX8iY9/SyGZw5TRMxAUw=;
 b=nBHvfkVtzcSTP1ZctmBv407ioVMFGGHtmLSKO63PqrasCK2ryY7Jj8tD
 krBgBenqqvt+ymtFGSpBZjCJBmwIJWVCQDcfjidfQpDU55GbUGbsPd+Va
 R9npJTT0jSVUmnIO0uEdIaJ5vj4JU1UXZj7Kbt5Eb4eOL/dz1LBWGQ7ty
 otWhAkHdCh0c6dNdlRZ48jf18N3gMGrDoe4899O9nvTCCVAVNBtxbkOBT
 N1CDopGHzAi3MoD/vnuB95STsL/KoLwBNPadXXAbGsCf/BO8oEHzlObxz
 L4ZY6JBrXFj9PQHf1GEUX7jkKqDtjvQyTS/DUuf1nuf1JyQf+U6Rbfk3J Q==;
X-CSE-ConnectionGUID: pfpUWFe6QAKAkapXBBgERQ==
X-CSE-MsgGUID: OZ3/SCoVQ+ivMPkM4pnOkQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11246"; a="18092983"
X-IronPort-AV: E=Sophos;i="6.11,258,1725346800"; d="scan'208";a="18092983"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2024 12:59:48 -0800
X-CSE-ConnectionGUID: Q/NruEpsRX+Y25RHCW28ow==
X-CSE-MsgGUID: 8XmmnITQRzmV512rivhdkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,258,1725346800"; d="scan'208";a="83888788"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa008.fm.intel.com with ESMTP; 04 Nov 2024 12:59:47 -0800
Received: from [10.246.2.9] (mwajdecz-MOBL.ger.corp.intel.com [10.246.2.9])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 540FB28794;
 Mon,  4 Nov 2024 20:59:45 +0000 (GMT)
Message-ID: <4b55bbc6-87f1-4ede-9bf8-961d25a42878@intel.com>
Date: Mon, 4 Nov 2024 21:59:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/5] drm/xe/vf: Document SRIOV VF restore flow
To: "Lis, Tomasz" <tomasz.lis@intel.com>, intel-xe@lists.freedesktop.org
Cc: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>
References: <20241029193956.1043614-1-tomasz.lis@intel.com>
 <20241029193956.1043614-3-tomasz.lis@intel.com>
 <36cdd46a-0105-4a59-b78d-3968be1f43de@intel.com>
 <93405f27-bc0e-4c48-97d7-d972bc1ee8e2@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <93405f27-bc0e-4c48-97d7-d972bc1ee8e2@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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



On 04.11.2024 19:46, Lis, Tomasz wrote:
> 
> On 03.11.2024 22:21, Michal Wajdeczko wrote:
>>
>> On 29.10.2024 20:39, Tomasz Lis wrote:
>>> This adds a documentation chapter, containing high level flow
>>> of VF restore procedure.
>>>
>>> Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/xe_sriov_vf.h | 93 ++++++++++++++++++++++++++++++++
>>>   1 file changed, 93 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.h b/drivers/gpu/drm/xe/
>>> xe_sriov_vf.h
>>> index 7b8622cff2b7..22683dd643f8 100644
>>> --- a/drivers/gpu/drm/xe/xe_sriov_vf.h
>>> +++ b/drivers/gpu/drm/xe/xe_sriov_vf.h
>>> @@ -8,6 +8,99 @@
>>>     struct xe_device;
>>>   +/**
>>> + * DOC: VF restore procedure in PF KMD and VF KMD
>>> + *
>>> + * Restoring previously saved state of a VF is one of core features of
>>> + * SR-IOV. All major VM Management applications allow saving and
>>> restoring
>>> + * the VM state, and doing that to a VM which uses SRIOV VF as one of
>>> + * the accessible devices requires support from KMD on both PF and
>>> VF side.
>>> + * VMM initiates all required operations through VFIO module, which
>>> then
>>> + * translates them into PF KMD calls. This description will focus on
>>> these
>>> + * calls, leaving out the module which initiates these steps (VFIO).
>>> + *
>>> + * In order to start the restore procedure, GuC needs to keep the VF in
>>> + * proper state. The PF driver can ensure VF entered this state by
>>> + * performing Function Level Reset on said VF. The FLR procedure
>>> ends with
>>> + * GuC sending message `GUC_PF_NOTIFY_VF_FLR_DONE`, and then the actual
>>> + * restore can begin.
>> hmm, I would do some rewording here, as it's not that VF_FLR_DONE
>> message is a prerequisite for the restore flow, it's that VF must be in
>> VF_READY state, which will be once the VF is successfully provisioned.
>>
>> The FLR is required only if the VF was previously used.
> Will do. Though for what I understand, creation of a VF includes a FLR
> as well.

not really, VFs FLR are triggered on demand _after_ they were enabled

>>
>>> + *
>>> + * During VF Restore, state of several resources is restored. These may
>>> + * include local memory content (system memory is restored by VMM
>>> itself),
>>> + * values of MMIO registers, stateless compression metadata and others.
>>> + * The final resource which also needs restoring is state of the VF
>>> + * submission maintained within GuC. For that,
>>> `GUC_PF_OPCODE_VF_RESTORE`
>>> + * message is used, with reference to the state blob to be consumed by
>>> + * GuC.
>>> + *
>>> + * Next, when VFIO is asked to set the VM into running state, the PF
>>> driver
>>> + * sends `GUC_PF_TRIGGER_VF_RESUME` to GuC. When sent after restore,
>>> this
>>> + * changes VF state within GuC to `VF_RESFIX_BLOCKED` rather than the
>>> + * usual `VF_RUNNING`. At this point GuC triggers an interrupt to
>>> inform
>>> + * the VF KMD within the VM that it was migrated.
>>> + *
>>> + * As soon as Virtual GPU of the VM starts, the VF driver within
>>> receives
>>> + * the MIGRATED interrupt and schedules post-migration recovery worker.
>>> + * That worker queries GuC for new provisioning (using MMIO
>>> communication),
>>> + * and applies fixups to any non-virtualized resources used by the VF.
>>> + *
>>> + * When the VF driver is ready to continue operation on the newly
>>> connected
>>> + * hardware, it sends `VF2GUC_NOTIFY_RESFIX_DONE` which causes it to
>>> + * enter the long awaited `VF_RUNNING` state, and therefore start
>>> handling
>>> + * CTB messages and scheduling workloads from the VF::
>>> + *
>> nit: maybe this would look little nicer with leading lines like:
> 
> no, it's not a matter of nice look. The lines start thin if the
> component does not currently participate in the execution.
> 
> Since it's not a proper diagram and just simplified ASCII art, we do not
> start the flow correctly with an actor initiating everything. So
> starting the lines thin would misrepresent the flow.

starting diagram in the middle of the flow is also incorrect

> 
>>
>>> + *      PF                            
>>> GuC                              VF
>>             |                               |
>>> + *     [ ]                            
>>> [ ]                              |
>>> + *     [ ] GUC_PF_NOTIFY_VF_FLR_DONE  
>>> [ ]                              |
>> nit: this label should be aligned to the right, closer to GuC
> this is a "return" label. These labels are bound to the position of arrow.

FLR_DONE is still a separate G2H EVENT, not a return RESPONSE G2H that
would justify the 'return' label

>>
>>> + *     [ ] <---------------------------
>>> [ ]                              |
>> but IMO the whole diagram should start here, as it's about the restore
>> flow, not the FLR flow (which is just a prerequisite, like a VF
>> re-provisioning, that also must happen before the restore)
>>
>> if you really want to include prerequisite steps in diagram then maybe
>> do it like this:
>>
>>            PF                             GuC
>>             |                               |
>>            [ ] VF provisioning/FLR          |
>>            [ ] --------------------------> [ ]
>>            [ ]                             [ ]--- VF_READY
>>            [ ]                             [ ]<---|
>>             |                               |
> 
> This is not ok because provisioning would need return arrow, it's not a
> one-way notify.

it was just an example ;)

> 
> Will just delete.

+1

> 
>>
>>
>>> + *     [ ]                              |
>>>                                |
>>> + *     [ ] PF loads resources from the  |
>>>                                |
>>> + *     [ ]------- saved image supplied  |
>>>                                |
>>> + *     [ ]      |                       |
>>>                                |
>>> + *     [ ] <-----                       |
>>>                                |
>>> + *     [ ]                              |
>>>                                |
>>> + *     [ ] GUC_PF_OPCODE_VF_RESTORE     |
>>>                                |
>>> + *     [ ]--------------------------->
>>> [ ]                              |
>>> + *     [ ]                             [ ]  GuC loads contexts and
>>> CTB  |
>>> + *     [ ]                             [ ]------- state from
>>> image      |
>> maybe also say that GuC moves VF to VF_RESFIX_PAUSED state?
> 
> The documentation is to explain kernel workings, not GuC states. So I
> don't really like putting all the GuC states here, especially because
> KMD doesn't even track all of them.

but you already included other GuC states in diagram, so just be consistent

> 
> ..But it does make sense at this point, especially because I will have
> to add VF_READY_PAUSED as well. So, will add.

+1

> 
>>
>>> + *     [ ]                             [ ]      |
>>>                        |
>>> + *     [ ] success                     [ ] <-----
>>>                        |
>>> + *     [ ] <---------------------------
>>> [ ]                              |
>>> + *     [ ]                              |
>>>                                |
>>> + *     [ ] GUC_PF_TRIGGER_VF_RESUME     |
>>>                                |
>>> + *     [ ]--------------------------->
>>> [ ]                              |
>>> + *     [ ]                             [ ]  GuC sets new VF state
>>> to    |
>>> + *     [ ]                             [ ]-------
>>> VF_RESFIX_BLOCKED     |
>>> + *     [ ]                             [ ]      |
>>>                        |
>>> + *     [ ]                             [ ] <-----
>>>                        |
>>> + *     [ ]                            
>>> [ ]                              |
>>> + *     [ ]                             [ ]
>>> GUC_INTR_SW_INT_0            |
>>> + *     [ ] success                    
>>> [ ]---------------------------> [ ]
>>> + *     [ ] <---------------------------
>>> [ ]                             [ ]
>>> + *      |                               |     
>>> VF2GUC_QUERY_SINGLE_KLV [ ]
>>> + *      |                              [ ]
>>> <---------------------------[ ]
>>> + *      |                             
>>> [ ]                             [ ]
>>> + *      |                              [ ]        new VF
>>> provisioning  [ ]
>>> + *      |                             
>>> [ ]---------------------------> [ ]
>>> + *      |                               |
>>>                               [ ]
>>> + *      |                               |       VF driver applies
>>> post [ ]
>>> + *      |                               |      migration fixups
>>> -------[ ]
>>> + *      |                               |                       |
>>>       [ ]
>>> + *      |                               |                      
>>> -----> [ ]
>>> + *      |                               |
>>>                               [ ]
>>> + *      |                               |   
>>> VF2GUC_NOTIFY_RESFIX_DONE [ ]
>>> + *      |                              [ ]
>>> <---------------------------[ ]
>>> + *      |                             
>>> [ ]                             [ ]
>>> + *      |                              [ ]  GuC sets new VF state
>>> to   [ ]
>>> + *      |                              [ ]-------
>>> VF_READY             [ ]
>> this should say VF_RUNNING state
> 
> ack
> 
> -Tomasz
> 
>>> + *      |                              [ ]      |
>>>                       [ ]
>>> + *      |                              [ ] <-----
>>>                       [ ]
>>> + *      |                              [ ]                    
>>> success [ ]
>>> + *      |                             
>>> [ ]---------------------------> [ ]
>>> + *      |                               |
>>>                                |
>>> + *      |                               |
>>>                                |
>>> + */
>>> +
>>>   void xe_sriov_vf_init_early(struct xe_device *xe);
>>>   void xe_sriov_vf_start_migration_recovery(struct xe_device *xe);
>>>   

