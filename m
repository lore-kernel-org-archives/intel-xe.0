Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98B6E606A31A
	for <intel-xe@archiver.kernel.org>; Mon, 23 Nov 2026 11:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dD4plnlx
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F65A10ECDE;
	Mon, 23 Nov 2026 11:11:09 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94DDB10ECDE
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Nov 2026 11:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795432263; x=1826968263;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=RIE+yhwjayhI8biUHEDiMxI5VBF3zhqUzDFvewtJiMM=;
 b=dD4plnlx6Z1oGosfH3PTdnVNNaFRaD7IJeFSw0rryYsaQxcuhNtyt3Mk
 YqK11foDr8cisqtBw+xJ4AH8J9cfnitXpdNR4pe64Cx/Opsarwy4FTxCT
 +muXpmZHiBd8oekzXUeb0GrBfwe6ehoWruOu+R1h0pIoOROMUkYy3N3oW
 ijRxt8HiKgcYXCy1mGQGqqCn8jaHcyN1tm8FMiGkD6kGo2/F76pWsE+JF
 07y+t5oZsqWZ8hhBFuGeKDNNM4rhC626jbxo7sEHt4njtYMPbWhX9UUIS
 SaWSjTOt4Leir1HujtMM0AVwmHatUO/x4M0Z47UxtCOAB0DoJL3+vOvHe A==;
X-CSE-ConnectionGUID: LhA6vnpNTNu6yeCDXfsDsA==
X-CSE-MsgGUID: pE0XkRfSQd2cFSkV66rU8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4128592"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4128592"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 03:11:02 -0800
X-CSE-ConnectionGUID: FAwJGIf1SuigjblWWjFbMQ==
X-CSE-MsgGUID: a+YCYPiiRRqkW1X/IM9UXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; d="scan'208";a="11370765"
Received: from soc-5cg43972f8.clients.intel.com (HELO [172.28.182.154])
 ([172.28.182.154])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 03:11:01 -0800
Message-ID: <a69ca4d0-1ebb-4dbe-a56b-30d6765e7ac6@linux.intel.com>
Date: Mon, 23 Nov 2026 12:10:59 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] drm/xe/pf: Extract VFs enabling revert helper
To: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>,
 intel-xe@lists.freedesktop.org
References: <20261123094607.3300722-1-piotr.piorkowski@intel.com>
 <20261123094607.3300722-2-piotr.piorkowski@intel.com>
 <429660af-db1d-4593-a5a1-54066cf85b3a@intel.com>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <429660af-db1d-4593-a5a1-54066cf85b3a@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 11/23/2026 11:42 AM, K V P, Satyanarayana wrote:
>
> On 23-Nov-26 3:16 PM, Piórkowski, Piotr wrote:
>> From: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>
>> Both the error path of the pf_enable_vfs() and the pf_disable_vfs()
>> are releasing the same set of resources acquired during VFs enabling:
>> VF VRAM BAR size, VFs provisioning, extra runtime PM reference and
>> the VFs enabling guard. Extract this common code into a helper.
>>
>> Note that in pf_disable_vfs() the VF VRAM BAR will now be resized
>> back after the PF reprovisioning and VFs reset, but since at this
>> point the VFs are already disabled, this should not matter.
>>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_pci_sriov.c | 28 +++++++++++++++-------------
>>   1 file changed, 15 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_pci_sriov.c 
>> b/drivers/gpu/drm/xe/xe_pci_sriov.c
>> index 31abcee55211..6c839eff0db8 100644
>> --- a/drivers/gpu/drm/xe/xe_pci_sriov.c
>> +++ b/drivers/gpu/drm/xe/xe_pci_sriov.c
>> @@ -125,6 +125,18 @@ static void pf_finish_vfs_enabling(struct 
>> xe_device *xe)
>>       xe_sriov_pf_disarm_guard(xe, &xe->sriov.pf.guard_vfs_enabling, 
>> false, NULL);
>>   }
>>   +static void pf_enable_vfs_revert(struct xe_device *xe, int num_vfs)
>> +{
>> +    pf_resize_vf_vram_bar(xe, xe->sriov.pf.device_total_vfs);
>> +
>> +    xe_sriov_pf_unprovision_vfs(xe, num_vfs);
>> +
>> +    /* Release additional PM reference obtained in pf_enable_vfs() */
>> +    xe_pm_runtime_put(xe);
>> +
>> +    pf_finish_vfs_enabling(xe);
>> +}
>> +
>>   static int pf_enable_vfs(struct xe_device *xe, int num_vfs)
>>   {
>>       struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>> @@ -151,7 +163,7 @@ static int pf_enable_vfs(struct xe_device *xe, 
>> int num_vfs)
>>        * With PF being in D0 state, all VFs will also behave as in D0 
>> state.
>>        * This will also keep GuC alive with all VFs' configurations.
>>        *
>> -     * We will release this additional PM reference in 
>> pf_disable_vfs().
>> +     * We will release this additional PM reference in 
>> pf_enable_vfs_revert().
>>        */
>>       xe_pm_runtime_get_noresume(xe);
>>   @@ -177,10 +189,7 @@ static int pf_enable_vfs(struct xe_device *xe, 
>> int num_vfs)
>>       return num_vfs;
>>     failed:
>> -    pf_resize_vf_vram_bar(xe, xe->sriov.pf.device_total_vfs);
>> -    xe_sriov_pf_unprovision_vfs(xe, num_vfs);
>> -    xe_pm_runtime_put(xe);
>> -    pf_finish_vfs_enabling(xe);
>> +    pf_enable_vfs_revert(xe, num_vfs);
>>   out:
>>       xe_sriov_notice(xe, "Failed to enable %u VF%s (%pe)\n",
>>               num_vfs, str_plural(num_vfs), ERR_PTR(err));
>> @@ -205,18 +214,11 @@ static int pf_disable_vfs(struct xe_device *xe)
>>         pci_disable_sriov(pdev);
>>   -    pf_resize_vf_vram_bar(xe, xe->sriov.pf.device_total_vfs);
>> -
>>       xe_sriov_pf_reprovision_default(xe);
>>         pf_reset_vfs(xe, num_vfs);
>>   -    xe_sriov_pf_unprovision_vfs(xe, num_vfs);
>> -
>> -    /* not needed anymore - see pf_enable_vfs() */
>> -    xe_pm_runtime_put(xe);
>> -
>> -    pf_finish_vfs_enabling(xe);
>> +    pf_enable_vfs_revert(xe, num_vfs);
>
> This new function name looks good when reverting in the error case 
> while enabling VFs, but does not sound good while disabling VFs.
>
> How about using pf_clean_vfs() which can be safely used for both cases?
>
> -Satya.

With 2/2 this becomes a prepare/commit/revert triplet, so the _revert
name seems to fit, also in the disable path. Just my 2c.

>
>>         xe_sriov_info(xe, "Disabled %u VF%s\n", num_vfs, 
>> str_plural(num_vfs));
>>       return 0;
