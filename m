Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 347FBC4345F
	for <intel-xe@archiver.kernel.org>; Fri, 19 Apr 2024 19:34:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC535112020;
	Fri, 19 Apr 2024 19:34:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RQbVExwe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B44411201C
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Apr 2024 19:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713555289; x=1745091289;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=gCv+ClsNtFPto8HId0bsmMNLVAlDBKXP48VfMaDCk4Y=;
 b=RQbVExwelSwuLKmpjW0XJe1SSoIdrCfFUnLyATLVyb9sFIAiPWKLd+0Q
 cg681eQTNWVje1mJ5nqqlXZH3GyPza77mYn4ILgrTzrTJXzIoH7k+NOs9
 A97LoucKycIr6gMnhXVVHjyyZlMN5EYgdvJSqTUCbE/LqtiGa/BR63PIG
 VGwAgwdKtshkLriIDpsIWIIVi/N2AWGrPp82I39KS6lC322niDPjZXtdB
 6QY0vWp8aPcfT6Hw09YBGWkuZNu1q0MUn54RNi+k6oh6uYheBE+AB0b3d
 mzHcLvHjfNT8clstrZulWVmoDz7weekB5a19Yp6LJMKcwBpOnmm4vo793 A==;
X-CSE-ConnectionGUID: nED869rDS32Yl6owy74RjQ==
X-CSE-MsgGUID: W45p3vPCQtyUU9c/ThINyg==
X-IronPort-AV: E=McAfee;i="6600,9927,11049"; a="12956025"
X-IronPort-AV: E=Sophos;i="6.07,214,1708416000"; d="scan'208";a="12956025"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2024 12:34:46 -0700
X-CSE-ConnectionGUID: kZLJxIw5RuO0Vw0HSYYgBA==
X-CSE-MsgGUID: gwV/7BrNQeyyj4G/JuKgfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,214,1708416000"; d="scan'208";a="54635034"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Apr 2024 12:34:41 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 19 Apr 2024 12:34:40 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 19 Apr 2024 12:34:40 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 19 Apr 2024 12:34:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hYJLUmULNDeydc3zSqFYTx2a70ltJESrCAaH7KysOEske8vCrkFGPGuxurPO1xhb9rs4HpTDxvmXIxckRZpovl5OwNvdFOGka4W9bgn8PivwjZwot7fN/ecE1kPzOFFkoi8wmymPn7fccV43gVdrYwW5+CUpYgajj5v2SjNM0sxgV9Oeka+acZnueE8chCLDsXBMsGFqxd4Y/0gdWC721/ihbSGqhsqHxfG/arxGfP6oME9kcCiYXCAV+JTQiyWoy3PiMrEMz5OHYeRqfahEK8wWKstTO1x7qwkxNvXJSHTgcEzLO0F2z9oLwsLNX96nPPVIge053LVRHGMKemOZYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BldiJ/iPv2hi3so9lGzmpfu7f/RKA8kA090ViDYpl04=;
 b=nKd9oM0JseZUpOdTGDHhQp5B2kdr8Neig9XloGrLomjH/sdRXiff7dKfhJ+DFNVrhKgT1zhXxuoCXMjVQ5h8UFkppbhV4O9MMIb13YiaO92DuFBjMVsyY6oRSQVgK7PlOQn1ov4d39qj/9/vh7cnM8zRgrrZdZBlKGckSeFw+vgS9jtAK6ef88IqnIRg6SPJcCiwQX9E0xvw0uqTrwQ0wTH6DlWxP73G66txJwxjCKgj2kEOD2GCGWv+WMcQoZR0pRW1mrwqTHYCIYja0PNv23JjgbtiAQcLzZuWy+fWPgHOJCoOIBlxfHu1Ri3avnzbQaYmHxM+fkJ+2G8CDRsjrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW4PR11MB7101.namprd11.prod.outlook.com (2603:10b6:303:219::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.16; Fri, 19 Apr
 2024 19:34:38 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7472.027; Fri, 19 Apr 2024
 19:34:38 +0000
Date: Fri, 19 Apr 2024 19:34:22 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: "Zeng, Oak" <oak.zeng@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 10/13] drm/xe: Move ufence check to op_lock
Message-ID: <ZiLHPspHtQeEuAst@DUT025-TGLU.fm.intel.com>
References: <20240410054056.478023-1-matthew.brost@intel.com>
 <20240410054056.478023-11-matthew.brost@intel.com>
 <SA1PR11MB69910F19616829F8DF7F83AC920D2@SA1PR11MB6991.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <SA1PR11MB69910F19616829F8DF7F83AC920D2@SA1PR11MB6991.namprd11.prod.outlook.com>
X-ClientProxiedBy: SJ0PR13CA0003.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::8) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW4PR11MB7101:EE_
X-MS-Office365-Filtering-Correlation-Id: d5f33000-c9f3-4d50-17c4-08dc60a7c089
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?54c62JHoE18VohiNMchYTbmS2QRnPYAfnyBL1j8+ruizgGTahTPDxUml5q/g?=
 =?us-ascii?Q?ZO/+IaVJpUcNY15/Yz4L1vycKefX1TztkdyENycp5c49nByA9+MvkYVV29qV?=
 =?us-ascii?Q?AZ3RGG4qSMEIhCGS8g9PpEkJOp51Plof1VTWdC96wSfyeEkNPWPuSuQGoRyD?=
 =?us-ascii?Q?d56Pm5/FN3aTSVOGb40EDIUQg2e2PHNWem6leRZYVigfkoDridmfR6QuvAGK?=
 =?us-ascii?Q?Rjp2B+VKZVA59D8dLDvfkYQUuspCwNm3OAGivLP/f3/htjYt83MDXkiJ7RaT?=
 =?us-ascii?Q?MFWe2eF/ifky2Z8KVesyq/yAuRjtfXHexUszlN0yoftjZn7rBv9yh9abw7LL?=
 =?us-ascii?Q?/iLGU6QA5vSRXpU5NlIM3bS5D+bisI2l15H2XxHJ+zvxj9whUYN+ANOhWIr/?=
 =?us-ascii?Q?hqWG7dwTodP908xLTstiJ+Z6JUbmYpEKN9m3oxsYwmZ229j+yq2mp9KEE2sU?=
 =?us-ascii?Q?vfyB3W/skJ95Qjhcy3Ry7IbI4GwyzuFPmWKwySPapyE2+5ZWH0gNFW5g+9E3?=
 =?us-ascii?Q?ZCVaTtWUOZe+6TJLu4TfCvdHdu12B1yV2IUCuk7oJxRIQXkUyD87L5hx6Kgg?=
 =?us-ascii?Q?cz77fFWrZ38mCNMjcJpVgI4YfecaFc9aSkKVe10x4vstDe+k2Xcao+Gz+Bc2?=
 =?us-ascii?Q?aJfaxpxRqbIga3uTrmzPwxYYQlk9dY9fbpDDcVFgUb5nsZMQZZ7upYrsLocR?=
 =?us-ascii?Q?sCfiIoS9Uw5MpVndQcgKbOBdT/MkeOE/FQaaGtpN741rm67/gNxmCQ4tBb2U?=
 =?us-ascii?Q?uTb5+9pvTh9HYfzoWbduEQvhWaHysuX9yRYE0NYK2VQGqqdjPkklFLPlOz+K?=
 =?us-ascii?Q?diEFDuFgTtjWKYWX6uIRp5SDbmfC8rmWEd5jAmpjtsQ9OQio/ZFFR35bpjXx?=
 =?us-ascii?Q?AHdkTEfqtkPmrABaRkW5MU5XLZsumXZlAAcUiYWwUFwoNGzAbva5AyoxIgbg?=
 =?us-ascii?Q?/8tjrWVjEaDlbGbhQpJDjRdwK7O2VxfROUVJaxHaQLJAJXDMQB3GcpFfRX9e?=
 =?us-ascii?Q?RWQFqnIMUdijEoOXFO8sUVmmcD7VrnadvZctSNgBYyGmXnT85RwVgp06XcXf?=
 =?us-ascii?Q?903LjUKGS9cJuA9xAp74k39Utf8+Zw4U2NVNX2oP0bDzZVcrcoZG9pSpi3Vv?=
 =?us-ascii?Q?S85ea5SuWTC3MZMf4pyOLrz3bYhoYuWDfB//QEwvBvK4obFK0uRuYHjd+4dH?=
 =?us-ascii?Q?IBxaYLiXL/E9uOsIY2TvqahmR/PTztCkv9gxtVT1dzzecT/PXWGZ4dnO1FZ+?=
 =?us-ascii?Q?U1ouVbYFMtou4BjpiaHFgTFbH8c6PJooX6+GvoTOGQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fHCJkf2paafXK/Z67NAGxrDQOk5OFsTDigfMsE2O1gTZxwifogH3IBEqKidS?=
 =?us-ascii?Q?EN1IIJuT7DQyt4fJioGJSVvro0c7ckEzQk5AOYLlHaotr89wrojPglZh7rGM?=
 =?us-ascii?Q?y0MneLD+74Aw8zJF/OjYLcEypapyT3gFKeHIRHuJ7bwfq049N5QI1cUmbdRm?=
 =?us-ascii?Q?18Wvqe4veT6J1gZlzDG9FykUUrH6E3hj9SdOofYqWl8Omk9Vi76JCQ8+PqsD?=
 =?us-ascii?Q?1PXERRzOrNtwibYTYwhYo5J2Ms7VoXQunwMRca8vJjYwL0lJcSl62baU+58D?=
 =?us-ascii?Q?DPDQjxi6EFvU2XWAIeFYLdh0PmJkH1BnjsdsNnCW6o30gPUU07GXraxGcBTx?=
 =?us-ascii?Q?HQJzPDnjA7gKRZ2pzpYQWoJJnH0Uk5xmKYXrZOuIShD4bc29DC7b2jRTxT9e?=
 =?us-ascii?Q?D9SAOqqa4MZuSX5izAmk+OX8ZjOy7h43N6C9CE/WO/LzDo4u4zKqltfykUwo?=
 =?us-ascii?Q?iJox3gRpFfK1OVJGMivGci32TXci+REQpKJMenAjvdSQyrn+eko9RN38KkhS?=
 =?us-ascii?Q?FjzU+xKR0iqoFP4/Ro2wUOSZOD+20KxQXNpu1NyaIZ953uTzU/zrEIuZOSga?=
 =?us-ascii?Q?dBXXXHWr/4kJwbZ+U7O2lvSSVThOo0zTDY/azB8dQ6G058Aop76ScwbSk6ty?=
 =?us-ascii?Q?GO+BGMtuTW+67mFsqZ2EiB+CljpC5xBjVpbfcDzsrb2YMFx2/80g6FdK4vsn?=
 =?us-ascii?Q?jrLJ75oFCUFVTxFA44KAFA/qMXSuMMHsnmv3gJi/sWGRCGLIHyDSuaYWUeka?=
 =?us-ascii?Q?8R06cqr4HBe/W1kEOYZl/nO/2hZw1HfhPdEYM58aya/xKReaxUg+jKtuqa0I?=
 =?us-ascii?Q?6D2Bm3KY8hTlRejG1dVwBrQXBkgPZLwGuJza2l65bCbnnjreEG5/36MK/3Vv?=
 =?us-ascii?Q?mF6n8WJXUxZtd9NxbyLguVkepYvoS6yj/U2mrcQnLhY5bZXGP5F4AzX7NTAD?=
 =?us-ascii?Q?4kEfpXnEZQ9tVHQmiyjqci255eh1clF6SOpr3pnH9ncClLjPSkjm/yTpHYMp?=
 =?us-ascii?Q?sck8KDtlhsy0+eMDercrGJ9vk6HyL3gisNE8u8hLsJ0ORS5aN0bvVSjDl0xS?=
 =?us-ascii?Q?7sdEb59mQefA+a4gIeieozLKtnUA5OShcBc/4wqqDEb2OIKoS9X5zbt6hTU+?=
 =?us-ascii?Q?7z/Q8IMNqtaRQyD6cnDkqIm+jUuTmiuFdK1fGlhh51b7ermceHq9NQbuRA4E?=
 =?us-ascii?Q?IXWCkNtVsLuE1OA8jT55LtmzAaO0xm0DX2YyX/AhRPnfWq2YdSf48ihYWs/O?=
 =?us-ascii?Q?aqmKGc83ksx9/+hiOyU/6xJMEfPwSiWngNZ+iCf19FaCauQbqp9Imssm0ZwZ?=
 =?us-ascii?Q?D+qdoyNlrhoXA5C7jEKFJCaHjecEcXuyqVYRL3GglI+Mx0kdmthr0dNjNvYB?=
 =?us-ascii?Q?fz9487QrOUOq8gbFV7GSzvOiAHn6Nu68P3+lR1T2dALSv0ADDGsOYhjo2UHv?=
 =?us-ascii?Q?XSM2ul5K7k5hncHWDwdP6AIpiCO4+VSrNDW4ZsmbV/23bfD30dU8cz4MEpA1?=
 =?us-ascii?Q?6CU9ZwL/9sMz3WkJF9thxSJlJzazYnvWGRv87OaT2yNMSshaRBBP/AXdEi2b?=
 =?us-ascii?Q?kdFGfcFAEW8afP4AMX99Rh+QMttzPssFwliG/6yZ+759L3Op+MNeQRUuXWAS?=
 =?us-ascii?Q?JA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d5f33000-c9f3-4d50-17c4-08dc60a7c089
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2024 19:34:38.6939 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2Nk64lFJ1oGAHK81ybslJnKSpSlcaF2IYTwAebXd4ytwwji1iYDaxU0Qi5ol7ghgIvBxKjQ/EACSY/NdsJ34RQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7101
X-OriginatorOrg: intel.com
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

On Fri, Apr 19, 2024 at 08:56:57AM -0600, Zeng, Oak wrote:
> There is a typo in the commit message. Other that patch looks good.
> 

Noticed that sending it. Will fix in next rev.

Matt

> Reviewed-by: Oak Zeng <oak.zeng@intel.com>
> 
> > -----Original Message-----
> > From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of
> > Matthew Brost
> > Sent: Wednesday, April 10, 2024 1:41 AM
> > To: intel-xe@lists.freedesktop.org
> > Cc: Brost, Matthew <matthew.brost@intel.com>
> > Subject: [PATCH 10/13] drm/xe: Move ufence check to op_lock
> > 
> > Rather than checking for an unsignaled ufence ay
> 
> At
> 
> Oak
> 
> 
>  unbind time, check for
> > this during the op_lock function. This will help with the transition to
> > job 1 per VM bind IOCTL.
> > 
> > v2:
> >  - Rebase
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_vm.c | 33 +++++++++++++++++++++++----------
> >  1 file changed, 23 insertions(+), 10 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index 97384c77f662..0319e70577fe 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -1755,16 +1755,6 @@ xe_vm_unbind_vma(struct xe_vma *vma, struct
> > xe_exec_queue *q,
> > 
> >  	trace_xe_vma_unbind(vma);
> > 
> > -	if (vma->ufence) {
> > -		struct xe_user_fence * const f = vma->ufence;
> > -
> > -		if (!xe_sync_ufence_get_status(f))
> > -			return ERR_PTR(-EBUSY);
> > -
> > -		vma->ufence = NULL;
> > -		xe_sync_ufence_put(f);
> > -	}
> > -
> >  	if (number_tiles > 1) {
> >  		fences = kmalloc_array(number_tiles, sizeof(*fences),
> >  				       GFP_KERNEL);
> > @@ -2819,6 +2809,21 @@ static int vma_lock_and_validate(struct drm_exec
> > *exec, struct xe_vma *vma,
> >  	return err;
> >  }
> > 
> > +static int check_ufence(struct xe_vma *vma)
> > +{
> > +	if (vma->ufence) {
> > +		struct xe_user_fence * const f = vma->ufence;
> > +
> > +		if (!xe_sync_ufence_get_status(f))
> > +			return -EBUSY;
> > +
> > +		vma->ufence = NULL;
> > +		xe_sync_ufence_put(f);
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> >  static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
> >  			    struct xe_vma_op *op)
> >  {
> > @@ -2830,6 +2835,10 @@ static int op_lock_and_prep(struct drm_exec
> > *exec, struct xe_vm *vm,
> >  					    !xe_vm_in_fault_mode(vm));
> >  		break;
> >  	case DRM_GPUVA_OP_REMAP:
> > +		err = check_ufence(gpuva_to_vma(op->base.remap.unmap-
> > >va));
> > +		if (err)
> > +			break;
> > +
> >  		err = vma_lock_and_validate(exec,
> >  					    gpuva_to_vma(op-
> > >base.remap.unmap->va),
> >  					    false);
> > @@ -2839,6 +2848,10 @@ static int op_lock_and_prep(struct drm_exec
> > *exec, struct xe_vm *vm,
> >  			err = vma_lock_and_validate(exec, op->remap.next,
> > true);
> >  		break;
> >  	case DRM_GPUVA_OP_UNMAP:
> > +		err = check_ufence(gpuva_to_vma(op->base.unmap.va));
> > +		if (err)
> > +			break;
> > +
> >  		err = vma_lock_and_validate(exec,
> >  					    gpuva_to_vma(op-
> > >base.unmap.va),
> >  					    false);
> > --
> > 2.34.1
> 
