Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82ADAC07CB1
	for <intel-xe@archiver.kernel.org>; Wed, 29 Nov 2023 15:23:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43ABD10E60E;
	Wed, 29 Nov 2023 15:23:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 439C610E615
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Nov 2023 15:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701271414; x=1732807414;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Q7ZABysqZJm/49dysSbiu7evaok8HIlRteadDl2GP64=;
 b=Tn8a8BZTzSrC9/77nhscTf1ywA6NxR2wCYoecxYqWacc3Aa+ovoAI9ke
 z716wtxIKjfKg7so5ecFQzDDpDxMHAmPNRskd4hhTeDsBss6JeS50lN3y
 nAWuRDk0QCDBj7/9I1Bpd9JWApqGTzu81ersZLje2YF9ThJX4CkDH0aSk
 kpWpPNTY5HMJm7XPspyx7vi/ZGNFybTD0/XwTdygzXwk/Y0KgczOIlKnj
 Cbtm/xWZXvOA7nWDrhChIjBUMTTFEnE3JENr7zH2+sCes5M9h7QRtq96X
 vUo/zJxrg8DYttkX7In2R6RlKKmeu7KunaReb0R9ZAz1Ij+Fl7TkkqgrH w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="6391932"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="6391932"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 07:23:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="803326207"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; d="scan'208";a="803326207"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Nov 2023 07:23:31 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 29 Nov 2023 07:23:32 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 29 Nov 2023 07:23:31 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 29 Nov 2023 07:23:31 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 29 Nov 2023 07:23:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QNoTWBgL9wy+w2hwfhSSTAqiirXRK7gHG64MEmfWlDpy0Phe4gVvqMSZxbQdz1Wxespa8bkoH6aHWrCEabTPRE8M4erYcc8wNjCOFJTek4RiZJnsf40f7Uk+r/XQAcG95G85RclNBt10g+3diGHPptJbeCr2+W6dMtbCX4jBi06S0HDMhCnP/kjU19B5H4Hv+ZVBc3FTugEiAkMufivUCRls0MIrTy9vRtLQA9hRG6GehvGsgQoTWqrrqkG3CXcnKMznVnHz+kR5WUMxOYijc4WVn7hRvtWKs/Gv0J6tu+kTDWq3q/ypWFl6ihrvIsf1IV9eR4hnBeZBzsx+ypvDZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8sRuVrgF+aknwXxU8cjIY4pYK7VutEcTIGunD3X+r1w=;
 b=M7A64YAhRuSO4mNk+bzpDIm+tuDKIg3pKAhQ4ot9Fsus9EqFO3vtk3inpoSx+2crOaN9Tg7Rmw1hJCY0SY47+OMalGD2a1sYmmELoNcooQ4fhI2s3EnMTWWpVa4oCqpNrHb/d5WqFIsHXStrvfRfYJHuXWfFIMDj57DLzv7LT42LH7N8Q5QvwqeL/PgesWLMs01b+F5mQ0rXv7WlrMw7YSg25xmirsL2ieWKOezRQK1tVYUkeyoiofSVbkDP7aMCPmntTRrPqxc9Rc2dcxuESDHuR54dqHEn2xYStjbzcsW8zWxNGd7XisL2DMKFdCove7azG8MLSo6v77WYnLS6Dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ0PR11MB4942.namprd11.prod.outlook.com (2603:10b6:a03:2ac::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.29; Wed, 29 Nov
 2023 15:23:29 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b%4]) with mapi id 15.20.7046.023; Wed, 29 Nov 2023
 15:23:29 +0000
Date: Wed, 29 Nov 2023 09:23:25 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Yang, Fei" <fei.yang@intel.com>
Message-ID: <etn2pzk3j6uiwi5afwprklhtd5642jfzrdlz3pxdb73ykg3xzk@m2dmlx4dh6ky>
References: <20231122204501.1353325-1-fei.yang@intel.com>
 <20231122204501.1353325-2-fei.yang@intel.com>
 <ymi5rgc3ba562kxellzosdndtlo23wwlsz75rrafxg6qfevmc4@owfjmqn5tesj>
 <2144662b-4c97-4101-b6fd-cb092b7713d4@intel.com>
 <BYAPR11MB2567D4E758801174BCF0904B9A83A@BYAPR11MB2567.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <BYAPR11MB2567D4E758801174BCF0904B9A83A@BYAPR11MB2567.namprd11.prod.outlook.com>
X-ClientProxiedBy: BYAPR11CA0069.namprd11.prod.outlook.com
 (2603:10b6:a03:80::46) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ0PR11MB4942:EE_
X-MS-Office365-Filtering-Correlation-Id: 3eccf46d-5703-4e5e-ec94-08dbf0ef23f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NWgWA7gE+xc/Mjzs+ya4c/HF9TAIqJ0MTTAVhn8POYTI8fGuKjmM7xbMOXQZT3zVzWhH0IUy65x1UPYbqvPyONpA7yS+mfWEVyi3XXcXuL59MxjX+jy+/IhlwOokQxfRAwim4wFsuSGFPLZ1MRbNQIZLI9bREJijBkK9+YyH31CCwZovLh96586cwQQ94fNqD5x5nAgonIuxYdzEP8gvs6QMJ0MFrlM8wxnl7V9TFxqMparrW63ku1Bl75tGKJysERdRhd5cvvHlaonQAfr9Y6kZQeFzCqgqaf/3zI/y+qEAorSqvmn74P2aKtfwOtF/WvyRI9V7NbWwnLl298YZ8FMSksVEUAoD9s1CG6DT7TQjaEsjzpsfJ7Z0WgehrWafGpcZymTkY5RegVyS1vTaKQmO7Cf6lH05K2pBdNPRG9qvNfkLNADGblT6OUv3x4iAetr7deZJcpSU/UmB2qq7rnCcpPPuN87wc0HDPlPQy1iZU53Th5XdGjsb3FnmOYuUVjREZwKP+cU6WTVHKXO0xscWgU/V1ymKzZiQ6iVTFneNZmFF758QFVf06bujGvutRFRWDPxDmbPymBZtxnDzto7YlhFjcKfvclPwqaGQrEdL78uxv/QA8nffU5AFlN/r
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(136003)(346002)(366004)(39860400002)(376002)(396003)(230273577357003)(230173577357003)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(38100700002)(2906002)(41300700001)(5660300002)(82960400001)(9686003)(6512007)(478600001)(6486002)(6666004)(107886003)(33716001)(53546011)(6506007)(86362001)(8676002)(6862004)(8936002)(4326008)(83380400001)(66556008)(6636002)(54906003)(66946007)(26005)(316002)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IhyeZflJxsTq4xlBEkk8m0ZOS5yG1JQB+D6GZiRJoM7sFz94szb8XIrbUr9y?=
 =?us-ascii?Q?geJC3p4S1z8dFQqQdVMvoasKKNw3Bl5p1FOlNtnXLIUW2CrjITaVccLsfgwR?=
 =?us-ascii?Q?hEgGOdZsoGon7e2nB0zfyoXa/RLBTD2V+gLQxRxP3GmKqZuGsfYhC+7EQWEQ?=
 =?us-ascii?Q?B5H+mdwPIS0pfD2IhNtY8Re/t3iPa/jqKgRAGOwcWzR3TEeKS2aHH356dLVL?=
 =?us-ascii?Q?yT9FipQ74G/eN3Aqr5DsVawKrb5qljB7Njj6XF2tNG4BQ81d/BnczrE/bm8D?=
 =?us-ascii?Q?pvgYLnu8oBgl/+yx+VBMKkkSM4yosRliNj6gYqfNIk5nDOgfEuQMDME+pyYG?=
 =?us-ascii?Q?c0MkyRmv+CW7Vb1GNzbPVm/gvHJbXdvOJ2jaCTKxbAf6dQenuz77ZQ+AOA7I?=
 =?us-ascii?Q?kyTUOCYr0FXv/PwzmD4Dz4vl2Mp7HlZ60xGLM+F1FZ2I1MI49QrmL+E6vrbq?=
 =?us-ascii?Q?h2Guvbqa47ctubuQaAgWCaEGoWfK5dYLy2yc+u7u3cHT4DzsBVOZbMxNCMWs?=
 =?us-ascii?Q?dORUiiyWk+pddG/5l4S+pv5VAMubHkCwJ7oCmTq3lpsiDhMyirkamnSQqZjR?=
 =?us-ascii?Q?4V3GvxCaRoBsFF+oKvrBStgNVZWBo03b/Ou6v7FIWIR1fqVxtwzLR6RbWwms?=
 =?us-ascii?Q?9QqMIxhEr+tfWqCpxkPiL3i6y2fzdfXig62V5YF2BrBgXNXTwdZUeXGmyz0f?=
 =?us-ascii?Q?4biKMOCPSWTGyK6fm8tr11p3ua/OCqgix+g8Vvy8I/uwHT2vM/yDfdxeHXQZ?=
 =?us-ascii?Q?oYLICstfr7t1JTIQ3feUP3w4/BSXBMvunNNrTVh9CHOujBk3qwk3ApgVTmMv?=
 =?us-ascii?Q?YhPtNJWiNn4sDtNu5kULId2Drhg8KQkZpTc8A22lw1lvinf1liaB8+QrXyhG?=
 =?us-ascii?Q?oeBXRqIznY21RE0GrQlikDd5aupDGZV4SHcFT27dqasrPPoUM7AOcYnJRC0K?=
 =?us-ascii?Q?l3mew/p+KTRhB/v9nuZd5lJMdbdNN15l/fV1qq6+MQgoqrtSbrMbJb5vxViC?=
 =?us-ascii?Q?Hy3i2+kqJF/4yUDZOLIq1GrBxsm056DTXLIn3fkzDQrOoR5s3F0gxV6q4zfK?=
 =?us-ascii?Q?SNpvx3YILdNrVLC9+nwSqVF0qHYQqgRGGOto5Ks2HmqZd3JG2K9Y4/e+tT7W?=
 =?us-ascii?Q?pLryFj9/N80GdS5WHtWkkHoCI00U/YMXme9X3tEqnDzOOycSU2Fu1t2yA8e0?=
 =?us-ascii?Q?zcHXsX7DZ+U4pq3ARzTBqr7jAHZDyakrtjhPPf5CBg6EBJwwPEW4cdK5vmaq?=
 =?us-ascii?Q?ESRheW4a1W4cE4b2rqkrdSrJ+B+DD7GYORF6pwGZpgK9FO4UVaKxH58hY6DW?=
 =?us-ascii?Q?zdq8X04o7m92DGwCNkrSylETs0663MZJR16DIHDj7wxVa0LsuHVEsXrQ3Dyg?=
 =?us-ascii?Q?t3ofMB6fcUiiMIDAQgJWqpHCXf/4ZT2t6XIViNZvI0u8gLHBBgeLU8U9tEWc?=
 =?us-ascii?Q?lzF3csmLMIiI+wzkJyyk8Kjzy9DSz+wdldzz1Hl/cpvDwa0hB6Rs/73OLBK2?=
 =?us-ascii?Q?6TN/vsLdrLUoVFkvL9ncpxA7hsRdJfuJ5YXsZL0Ne3IMTmAftn0tL/5jkFIR?=
 =?us-ascii?Q?Xb1/jH05L3VPtitkursmbiJh8GL3N4Cw95lZ+kGUDKIaOixVdpgBxfKpipjb?=
 =?us-ascii?Q?dg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3eccf46d-5703-4e5e-ec94-08dbf0ef23f9
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2023 15:23:29.5773 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qoZRkPflzZuD/UlZCXwvrEjmZPseN+0uAiyBMx2hIqOSUclBn7QC6ek5rsIPeaK3raGViLa09UQn2DTUNBfJ1jv9f9IskNgn+7kb8Re0E48=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4942
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/1] drm/xe: explicitly set GGTT access for
 GuC DMA
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
Cc: "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Nov 28, 2023 at 11:59:29PM -0600, Yang, Fei wrote:
>> On 11/27/2023 11:09 AM, Lucas De Marchi wrote:
>>> On Wed, Nov 22, 2023 at 12:45:01PM -0800, fei.yang@intel.com wrote:
>>>> From: Fei Yang <fei.yang@intel.com>
>>>>
>>>> Confirmed with hardware that setting GGTT memory access for GuC
>>>> firmware loading is correct for all platforms and required for new
>>>> platforms going forward.
>>>>
>>>> Signed-off-by: Fei Yang <fei.yang@intel.com>
>>>> ---
>>>> drivers/gpu/drm/xe/regs/xe_guc_regs.h | 1 +
>>>> drivers/gpu/drm/xe/xe_uc_fw.c         | 3 ++-
>>>> 2 files changed, 3 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/regs/xe_guc_regs.h
>>>> b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
>>>> index ba375fc51a87..92320bbc9d3d 100644
>>>> --- a/drivers/gpu/drm/xe/regs/xe_guc_regs.h
>>>> +++ b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
>>>> @@ -70,6 +70,7 @@
>>>> #define DMA_ADDR_1_HIGH                XE_REG(0xc30c) #define
>>>> DMA_ADDR_SPACE_MASK            REG_GENMASK(20, 16) #define
>>>> DMA_ADDRESS_SPACE_WOPCM REG_FIELD_PREP(DMA_ADDR_SPACE_MASK, 7)
>>>> +#define   DMA_ADDRESS_SPACE_GGTT REG_FIELD_PREP(DMA_ADDR_SPACE_MASK,
>>>> +8)
>>>> #define DMA_COPY_SIZE                XE_REG(0xc310) #define DMA_CTRL
>>>> XE_REG(0xc314) #define   HUC_UKERNEL                REG_BIT(9) diff
>>>> --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
>>>> index 3032c4f148d4..438ce51dd373 100644
>>>> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
>>>> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
>>>> @@ -629,7 +629,8 @@ static int uc_fw_xfer(struct xe_uc_fw *uc_fw, u32
>>>> offset, u32 dma_flags)
>>>>     /* Set the source address for the uCode */
>>>>     src_offset = uc_fw_ggtt_offset(uc_fw) + uc_fw->css_offset;
>>>>     xe_mmio_write32(gt, DMA_ADDR_0_LOW, lower_32_bits(src_offset));
>>>> -    xe_mmio_write32(gt, DMA_ADDR_0_HIGH, upper_32_bits(src_offset));
>>>
>>> not that this patch changes anything but this upper_32_bits() is a
>>> code smell. If uc_fw_ggtt_offset() can only return u32, why exactly we
>>> would try to get the upper 32 bits (and suppress the warning by doing
>>> 2x >> 16?). Humn... commit ee2dee81e484 ("drm/xe/huc: Extract version
>>> and binary offset from new HuC headers") extracted css_offset and now
>>> we are adding 2 u32. So maybe keep the upper_32_bits(), but move
>>> src_offset to
>>
>> This is still guaranteed to be a 32b number even after the sum, because
>> we're adding an offset within the GGTT-mapped object and therefore the
>> resulting value is still within the 32b address space.
>> AFAICT the reason we have upper_32_bits() calls in several places with
>> GGTT offsets is because of a quirk of the HW specs: when 48b PPGTT was
>> introduced back in gen8, all address fields in GT HW (not sure about the
>> display side) have been updated to 48b, even the ones where the address
>> was guaranteed to be GGTT and therefore 32b, and the specs have been
>> updated to always say "write the upper 16 bits in the HDW reg/field"
>> even if that is always guaranteed to be 0 for GGTT offsets. I'm guessing
>> the aim on the specs side was to be ready if the GGTT ever gets bigger
>> than 32b, so I think we should do the same in SW and proceed like you're
>> suggesting with moving the variable to be a u64.
>>
>> Daniele
>
>I agree we can define src_offset as u64, but that has to be a separate
>patch, right? Should I send that change together with this one in the
>same series, or this patch itself can be merged as is?

I'd consider that small enough to just have in the same commit with a
note to the commit message. But it's something you will get a different
answer depending who you ask or when you ask. So... Let me just apply
this as is.

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

and applied to drm-xe-next.

Thanks
Lucas De Marchi


>
>-Fei
>
>>> u64. That also matches what we have in i915. Before that commit, doing
>>> that write was basically always writting 0.
>>>
>>> With that,
>>>
>>>     Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>>
>>>
>>> +Daniele / +Matt Brost
>>>
>>> Lucas De Marchi
>>>
>>>> +    xe_mmio_write32(gt, DMA_ADDR_0_HIGH,
>>>> +            upper_32_bits(src_offset) | DMA_ADDRESS_SPACE_GGTT);
>>>>
>>>>     /* Set the DMA destination */
>>>>     xe_mmio_write32(gt, DMA_ADDR_1_LOW, offset);
>>>> --
>>>> 2.25.1
>>>>
