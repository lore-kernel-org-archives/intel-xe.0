Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F36FDC54E67
	for <intel-xe@archiver.kernel.org>; Fri, 15 Mar 2024 13:55:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98D8111224E;
	Fri, 15 Mar 2024 13:55:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lQEdLO36";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5079211224E
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Mar 2024 13:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710510900; x=1742046900;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=51/A2B5xDXqVbY4UZUBfOmg9dMk/14Ihil9VVYf7g28=;
 b=lQEdLO369P/0oeAlv101OzavRJybBYabEKGweJCowWXkvuM24wzmgdus
 0bJVRXSWfuXekCB5Bdfb2qgN3eaBS1sFD2ieMjgh29QGeIdRZVHo5tR6z
 vNr5hO32bJ43S51QYYdmu8HnzmRIcqcx5AdkwMlaDch59Cgv9FVkXkCyH
 veF/3gMnXaW6GjGxbf7vh5nNQ1eA3T9NXobo3QKrx40L11iWOI1Bm64MS
 tSeLq9i5MwnSvNCI73vI2d28ZcvZ5iiOzIwjjQZBrSQjH36nSiGfcbQiF
 8LOuabUYmCVFDhMttTi2TzH5/UmZDO9j/xkoEslDiN96zOt2ahFWtm4ZZ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="5237885"
X-IronPort-AV: E=Sophos;i="6.07,128,1708416000"; 
   d="scan'208";a="5237885"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2024 06:54:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,128,1708416000"; d="scan'208";a="12629632"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Mar 2024 06:54:54 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 15 Mar 2024 06:54:53 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 15 Mar 2024 06:54:53 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 15 Mar 2024 06:54:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nYOSR/CmTZuBp+KszZtbfucMIRbjnoxNxtLN0CDZfQOBwbXgeSbiAGfNO+yttAiqv872OgUuDBjV0TGA9iEk+0wdQu7f87k29UFlZ5kGPr2eS3LB1Pbn1vivYETWjH+Gyu/4jooIdbn8hV9jBS+t9yq+tls7xMpwSyF1A2aSMckw95V1tSc34kyfI3omMGU7bNF/fPZz6U6sg8vXVBBGzIlFxEwZiMurqaYPWovj0NsA3n881tdTTUJg01X4pAu2HOdsRzIU6xOAgDePHvwdtGmzoQQkh+7GB8jKjQKSKeZp/7py75QCfxwCexPPhjYomttSQppJSvvJwZojg27oBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kuuOhRZQO3eyID/EMTbmuKMcbfaTHJUnF6pyag4LsCc=;
 b=hYDcRpjPBi24PBwjJBeRBfT4s7gnVPIO+D2R0nDqFwxRAIB72OmxXNXNgj4FmmSNmaht3s1at0DXyeoSsEWpuP0mgg5xpREXTTu8xnZpc/UZfu/U9ho/tcbQF1n7d59KKKrbfmdq+0YukZB3/cyBggY6J+P05IdkAeAtP4ah60UMtwigsSjzhELL2W50N1X6Dnozvnn3DWCkUgVU+a78oUYw+moBJ439Qv72L3PsadeQ7qxvrn6yZu65INA+nk8g2wcYPXAx9nNKsFbEOwv/S3Fi4z2ucY2A8cmvt4/zqBj4WnbyU2ORlpgdcCkjsvoXIw1A6G36qTAvLJNcx3K1WQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DS0PR11MB8070.namprd11.prod.outlook.com (2603:10b6:8:12d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.18; Fri, 15 Mar
 2024 13:54:51 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189%4]) with mapi id 15.20.7386.017; Fri, 15 Mar 2024
 13:54:51 +0000
Date: Fri, 15 Mar 2024 09:54:47 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/3] drm/xe: declare busted upon GuC load failure
Message-ID: <ZfRTJyRVlXbtocIq@intel.com>
References: <20240315010317.193756-1-rodrigo.vivi@intel.com>
 <20240315010317.193756-2-rodrigo.vivi@intel.com>
 <6961d753-007f-48ad-b70d-1add093ae61a@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <6961d753-007f-48ad-b70d-1add093ae61a@intel.com>
X-ClientProxiedBy: BYAPR08CA0067.namprd08.prod.outlook.com
 (2603:10b6:a03:117::44) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DS0PR11MB8070:EE_
X-MS-Office365-Filtering-Correlation-Id: a3cd5858-d5aa-4063-4b33-08dc44f77c0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4YUNq4PPm6sifoC3KeFYUA+LEHcSYXUCsWduxxHk7qXxIPl2h/JOzeRySM/3pbzI1fZnuigzyPFzQwGJCgDuEq29ylNBr4m+3peDWAGMCyfoW+5rVSFjkcpNL7+fZBYGfZ4vro9Ot1ViA6FFkfv1RR35M1lwzInfWANs1v18qd6GTqDf1oOX8bTF8inycAuEVx1UaVIbtemXoupim+tQKaygRbDOtBbr4XUOqKsn05TtLa87NxIeB5o/6rcXD5rIAWJGdm2KjflMNt+py3sMZVi6k/YbeDgKTTd0YQvb5156IeyABlzTv59pR9WYsYo/181KRGQTFt9ZoBAzwnPRSN6bUsy1ZvfWjIe5F/Dc4DWK8osuQXy3RR0x6qYpdQrJPMTZc9Wwtav0PfeLEQz6GYs2lHKrCGW8noAy8dlq7b511xEWIFBKyY4acv+qqlEhn5M3nEAdtFTEzLB6FenWVW27H3S0bKkpFtU5lC/Hz632bMiitrAhCvT0OHmZfNEUDHvCDaCGuseMyIcpi1QufhajEPjbUuKQAaGYINqKZT4HRLMuLnO9ExfHCFolX26yVnUNbWTGnbrlBaxG2TaOkeuWtkvlmMa4Vvb8eBW0af9PcelawrwB4kPerpKr0Zs08yupUn9DcFCGy9gN7/IK//ExZF6wquEERCdsfzxIBqk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tPUCYr9sZ5vQYkzNc0aWTOCEO0S57d9kOK9nqSFZ3Fzcz+54tkQyKPjoIU6D?=
 =?us-ascii?Q?JsSEq+Sz5MaaJECex4xO+dApRIpO3OJMLWZ195vKxYMh2GLYjZTdy5ZjotSf?=
 =?us-ascii?Q?8aqZXjpMo9yqKvNAEhnojSPW9ZWswoMSTniI3+cbCH0HHOVh78rYRSRWA6xE?=
 =?us-ascii?Q?Pttqfz6aMjETCl82+/Qs2mPYtYxgg9b41p8jmQ3MFqP6OmoKYxxbOJ3Y/RFp?=
 =?us-ascii?Q?CS87YMDNuWxUmcpXdg0kRfGMtWqTDOJtOhkH0WcYa3hT4AfTb6ncs7E+Ayiu?=
 =?us-ascii?Q?pzA83o4ZRexcUvmnXgisMBzNgxub8nAkKvOKjEvt0j6R/r9lQsP84vddCAaN?=
 =?us-ascii?Q?iYDR7jfyuRR+FPhgoJpqo8wHzJ/kGjzYmTQFakK7/xMalRuGDCjaAi4c9xUE?=
 =?us-ascii?Q?ADiQ0zs+f0BTFfvd/5j6gyok+EIeB5IzUEUW17+NkLAZzL5PcwuM3EQU5Aq1?=
 =?us-ascii?Q?uYzrceiVf5gH4Z0+MGPzTZAAFtosEgloE9GlWui2ncUySM8eEry+2uZFPpt7?=
 =?us-ascii?Q?POLpoiwB2xFELlqhxo67QKUFBANVGHjC0E1RSHgaE6qukhWby/jb83R7yLsG?=
 =?us-ascii?Q?lGFCpUmUhRAHBrUTTuEUTIeNw79KS7VyR4savkAXi6nVZk5zMJ/6cWKGdSZv?=
 =?us-ascii?Q?1cCmWOJJF9zwRrqSQUmNuCevP+mR5thwkEThSvZTAxp45gpGst73CAAMtJ8J?=
 =?us-ascii?Q?V3o6XWCO6lEe6XT+WJ1LZ+T0zXMcBSy4EIsNkpFycfVS0W14PXtRVtvOTpgJ?=
 =?us-ascii?Q?G+5LrpfUF7/VnQdJjQgDsQfdkbQEjF4wkYMGSn3eJnWu8pxEuLjGENDqk932?=
 =?us-ascii?Q?VFHNx5pWgZLbM39m6SFxOTBB4b5PxVHETJC35vP642YN2BT3nciSVR6dcjE8?=
 =?us-ascii?Q?cLVS9t4kJMuOtAFEiC46JO+sSv0U81U3OOFgEIStL7wWWISc7pMRcAEXI4hj?=
 =?us-ascii?Q?OOSRTgWq7wfGoLgNqlhc+FaZf+4hGX5j8iCdxK1Am60BpIBVb7cXqwGuBv7H?=
 =?us-ascii?Q?ZMf8V3cJleQmxQsF2wGlztrASvX1U6Ur/YQQ9whp9SvEerDK8L0FISp4KqPN?=
 =?us-ascii?Q?kPTofwEBQOnrZ7ZMKwoVG5S7af7bDEqeYnTyaaczPp5F49MsGdD0ovg4cW9m?=
 =?us-ascii?Q?goubaCRN455ajUmWl6ymXBxsLnS7EJzCLCVMHWhPBj7XnsHpawGVty4TCMj1?=
 =?us-ascii?Q?m4SV9gi8RjV0CtcRVUxqodgTu3mWdohV9mYKePZwMi2ZDqkcpwcyvokXpfLO?=
 =?us-ascii?Q?O94UoQ2m1VGn8dau4jyYWpmnTdrbVUxzIIFo9WMoVcZHL5FPLh/YLUp7Ui6c?=
 =?us-ascii?Q?WGi87XxS+dpTVrbDPrb3kJsTMkATFF4xg8a64i87Lvo1AZdw+0hAzugpVgzR?=
 =?us-ascii?Q?ZCAOkHKW464ecfNNEfyn53AwztIzv2hb0rpE7H56wzgYR3Zp4Km/e35NKWf+?=
 =?us-ascii?Q?vovH3TZrBnQ1eBPap8D74dHXWHPlJzprXBSuLpY7APq0I/59uHCGRx7UVWdt?=
 =?us-ascii?Q?fs/vRcrWascrj13e4X6VhLSw/OkTOBSdrKNJzYgwtDGUV1Lx5CIKNErOZHO5?=
 =?us-ascii?Q?z6WJGCI0Q8bl8gvQNjueCNFX8HpQ9kLxfgzL4RbLX5NuekJc91oaaIItL9Co?=
 =?us-ascii?Q?CQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a3cd5858-d5aa-4063-4b33-08dc44f77c0c
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2024 13:54:51.1980 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qgf9E7w0PsHmn583zIJb2Z3oWpjb8ls8NIQySNnHuicNZTmW/2G6jNijoLVDoJS8TN02sePATFqJr1g4bWj4lw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8070
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

On Fri, Mar 15, 2024 at 04:46:16PM +0530, Ghimiray, Himal Prasad wrote:
> 
> On 15-03-2024 06:33, Rodrigo Vivi wrote:
> > Let's block the device upon any GuC load failure.
> > But let's continue with the probe so guc logs can be read
> > from the debugfs.
> > 
> > v2: - s/wedged/busted
> >      - do not block probe or we lose guc_logs in debugfs (Matt)
> > 
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_guc.c | 41 ++++++++++++++++---------------------
> >   1 file changed, 18 insertions(+), 23 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> > index caa86ccbe9e7..85edaaa734a5 100644
> > --- a/drivers/gpu/drm/xe/xe_guc.c
> > +++ b/drivers/gpu/drm/xe/xe_guc.c
> > @@ -461,7 +461,7 @@ static int guc_xfer_rsa(struct xe_guc *guc)
> >   	return 0;
> >   }
> > -static int guc_wait_ucode(struct xe_guc *guc)
> > +static void guc_wait_ucode(struct xe_guc *guc)
> >   {
> >   	struct xe_device *xe = guc_to_xe(guc);
> >   	u32 status;
> > @@ -491,31 +491,28 @@ static int guc_wait_ucode(struct xe_guc *guc)
> >   	if (ret) {
> >   		struct drm_device *drm = &xe->drm;
> > -		drm_info(drm, "GuC load failed: status = 0x%08X\n", status);
> > -		drm_info(drm, "GuC load failed: status: Reset = %d, BootROM = 0x%02X, UKernel = 0x%02X, MIA = 0x%02X, Auth = 0x%02X\n",
> > -			 REG_FIELD_GET(GS_MIA_IN_RESET, status),
> > -			 REG_FIELD_GET(GS_BOOTROM_MASK, status),
> > -			 REG_FIELD_GET(GS_UKERNEL_MASK, status),
> > -			 REG_FIELD_GET(GS_MIA_MASK, status),
> > -			 REG_FIELD_GET(GS_AUTH_STATUS_MASK, status));
> > -
> > -		if ((status & GS_BOOTROM_MASK) == GS_BOOTROM_RSA_FAILED) {
> > -			drm_info(drm, "GuC firmware signature verification failed\n");
> > -			ret = -ENOEXEC;
> > -		}
> > +		drm_err(drm, "GuC load failed: status = 0x%08X\n", status);
> > +		drm_err(drm, "GuC load failed: status: Reset = %d, BootROM = 0x%02X, UKernel = 0x%02X, MIA = 0x%02X, Auth = 0x%02X\n",
> > +			REG_FIELD_GET(GS_MIA_IN_RESET, status),
> > +			REG_FIELD_GET(GS_BOOTROM_MASK, status),
> > +			REG_FIELD_GET(GS_UKERNEL_MASK, status),
> > +			REG_FIELD_GET(GS_MIA_MASK, status),
> > +			REG_FIELD_GET(GS_AUTH_STATUS_MASK, status));
> > +
> > +		if ((status & GS_BOOTROM_MASK) == GS_BOOTROM_RSA_FAILED)
> > +			drm_err(drm, "GuC firmware signature verification failed\n");
> >   		if (REG_FIELD_GET(GS_UKERNEL_MASK, status) ==
> >   		    XE_GUC_LOAD_STATUS_EXCEPTION) {
> > -			drm_info(drm, "GuC firmware exception. EIP: %#x\n",
> > -				 xe_mmio_read32(guc_to_gt(guc),
> > -						SOFT_SCRATCH(13)));
> > -			ret = -ENXIO;
> > +			drm_err(drm, "GuC firmware exception. EIP: %#x\n",
> > +				xe_mmio_read32(guc_to_gt(guc),
> > +					       SOFT_SCRATCH(13)));
> >   		}
> > +
> > +		xe_device_declare_busted(xe);
> >   	} else {
> >   		drm_dbg(&xe->drm, "GuC successfully loaded");
> >   	}
> > -
> > -	return ret;
> >   }
> >   static int __xe_guc_upload(struct xe_guc *guc)
> > @@ -545,16 +542,14 @@ static int __xe_guc_upload(struct xe_guc *guc)
> >   		goto out;
> >   	/* Wait for authentication */
> > -	ret = guc_wait_ucode(guc);
> > -	if (ret)
> > -		goto out;
> > +	guc_wait_ucode(guc);
> >   	xe_uc_fw_change_status(&guc->fw, XE_UC_FIRMWARE_RUNNING);
> >   	return 0;
> >   out:
> >   	xe_uc_fw_change_status(&guc->fw, XE_UC_FIRMWARE_LOAD_FAIL);
> > -	return 0	/* FIXME: ret, don't want to stop load currently */;
> 
> This label is used for other failures too apart from guc_wait_ucode.

I'm afraid I didn't find those here... perhaps I missunderstood the 'label'
you mentioned.

my grep for returs with this comment failed

> 
> Dont we want to ignore ret and return 0 those failures too ?

anyway, perhaps that could be a follow up clean up?

> 
> 
> BR
> 
> Himal Ghimiray
> 
> > +	return ret;
> >   }
> >   /**
