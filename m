Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD676C44512
	for <intel-xe@archiver.kernel.org>; Thu, 16 Jul 2026 18:34:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84E4910E3AA;
	Thu, 16 Jul 2026 18:34:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SHKtt8G+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EF9410E3AA
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Jul 2026 18:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784226870; x=1815762870;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=w8bNDbXNEv81qie4JpyY6EDMlb4ltJ7iQj/zYwpbwh8=;
 b=SHKtt8G+9bN/1TNXy5Z+z0iOi0XJpv0QHq7eGjQcBHzWX2JgYI2/uGZf
 9Zomsytnr9K9EGZuL/JsF1WDTaI81KvJZnlML/ix2/ELmjUji7aWLHyac
 WwVof8qtJLE9TggO/nJdrnfI5TTYiK+b4vL5V/YqczCTYzqleDq1VkDhb
 acP86sJfKjuaXIQu0n8tupOYSxMgxzP2EcIy5zrkYqQFixn7zO6ADwHmH
 6/UrmIhBgQ5OaiU/flAjq8BJebH0sidflJ5Y+pDXfVgvPFuA1V5AIO3rg
 CmYt/JP66P7oFQ1FT0dfQ8XKumaJUh0fbQWxjp5VrMcFdfoe1PywKfuOm Q==;
X-CSE-ConnectionGUID: 9+mHLshuQbKefBE/1nXZ2Q==
X-CSE-MsgGUID: ypoOUmt0Qxm3t0uKgbsBPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11848"; a="88724788"
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; d="scan'208";a="88724788"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 11:34:30 -0700
X-CSE-ConnectionGUID: 7IvCdCRrQRKhrxJkPdtpNQ==
X-CSE-MsgGUID: 1wynMhTBQeW5b33YTnce0A==
X-ExtLoop1: 1
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 11:34:30 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 16 Jul 2026 11:34:29 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Thu, 16 Jul 2026 11:34:29 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.65) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 16 Jul 2026 11:34:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AClbGcAAgmaeJrZrNAW0ZbhqB05YTNavnTkPnxkgI9Z4WmXmmItPQwobdQaAQM1PjKZaZVy/bzPoRC5TDqDq9MQIo/XtEWNmTCVS3PA+Q26/CFgnjkc00au6BV+nhoKQnz4OAaVAbuiMk6x2DkgQOoH4ZONIo9X6Cd36d5q975TPoxJOO7FSAPGHeg5h0UbyS1wykkqWwkic7gjdnq5hGEi3hqbnYZJYkjHHqfGPOKiU8zk5NxLMpkZhXNKxaEt9layRpLFXQ5E/jcumh51qh5MfdXLNf046rCOVOmR2F2yCjGA18YSKxjuP6KFdTyqgytk8M+9TXjI0jj+v6nqs/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dwiS/EKdIQfdx1qQlfo8x2KvK7OExOwe/cu91HdDki8=;
 b=w/W6d+6ZijzxR72eSylJngmLSWEUdtYYqsyDITvHQa4OrVWVTSe9Q5mDG/oXqc/QWZLTy43h1mwflAIozAr+bYXA64JDL2VR5kvpWWB91RH1m1VpuUB5O0yJNrT/pIWQlNh+Vh1cP2NJ5lOppxtN9XWmn0Qfv/a0/Amu4ZIAEuCj0iimLrcwvZfwDgllz459l99BvizSXMp0ja8fOg5WgLNnRSeKnVZzMCxdRXmh78KQzM1AArtpE4HIWBQC0u0UDMEM6evF63y9BmckYBnekOWd2nxtEkbeu4NLk/p9i1QK6Q+NziCX+b/xm8uENHx9QQqRfPCeE2i21/lcPvvX6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by DM4PR11MB7277.namprd11.prod.outlook.com (2603:10b6:8:10b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Thu, 16 Jul
 2026 18:34:26 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%4]) with mapi id 15.21.0223.008; Thu, 16 Jul 2026
 18:34:26 +0000
Date: Thu, 16 Jul 2026 11:34:23 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH, v2] drm/xe: Reject PXP usage on multi-queue exec queues
Message-ID: <alkkL8yVe7pstMLm@nvishwa1-desk>
References: <3fe42f29f4216bf9e7de4dbf582ace608e6d30eb.1783971737.git.jagmeet.randhawa@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <3fe42f29f4216bf9e7de4dbf582ace608e6d30eb.1783971737.git.jagmeet.randhawa@intel.com>
X-ClientProxiedBy: SJ0PR05CA0179.namprd05.prod.outlook.com
 (2603:10b6:a03:339::34) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|DM4PR11MB7277:EE_
X-MS-Office365-Filtering-Correlation-Id: 7db1a596-f29d-4c72-3027-08dee368dd4e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|1800799024|10067099003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: +v+vds0Fcbb4deOCPFC/PfOCsw1jNdw8M09GjGEIpAgMNDcnWJjr4li9UvkuvfidhbDOfTMxjPG4zapgcPRgqmThMIoBoKOUmm3SjcuanhGYEJyymjWu8idpqsKb538lgp6ReJ+bH4zgGm6+2NeaG8ysJHtiotziZxss9kSYI6hC0oe6qoP6r7i1FoUD1WmlYC0IeYVABoeL/H2+eKQTgOlfo3u8qVIE2qFqZ1YNa7sdRb6YuIDftuVbvoOnSzGSd4aV8mRTseIeAtBAzkDoznJHflzonNk/dRIjCEK1aiXDrCrgqbkBEqte0mnGgeqTsDGJKS9M+Hmm5sKx43L3ZMKf5Gj/AmMZzg6cq5WSfH21xXgsRq6Jl2bv3PmHF+U0D1s9tuFthoFUohtf2cOwOtxL9wx4zzkGoT605rLy4PDV5X5hU6Aq6kUTbVzkayN1PNRpjmFgpNJO75mCKUhqOEaEkQRqQ98wMpe0lOjeemNAvkVzud/fOl/K3shtlmIo/+QQ0gdSkVfJB8rmLKVKZ7JPcrdjUeoTKMF/LrnVHppSG2L17XarD6DQPNV7AUzQ7wZ9mt9ei9qrl3E4g+Ijatv8P+6legF2g6rmKXIEC1T3OM8zA/Yiq+kitCK/JdfVjASj0vVC8OoAWFqxHRdSJ16Ymm3vNWq/qLe/8YEeB9s=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/VyPEtHd4GGTDk7ovfpCHHX5utr5KCh5uKHAuWfLOdiMHMa3o/OeFSr4I1l7?=
 =?us-ascii?Q?TCgu+c9f+ke+/Zsq3Bnj57MiNeU+e7s3qptIhv409JXk2nNTSV+t7Ws+5bJp?=
 =?us-ascii?Q?69yhRR5KP135zv6NRdLBNFSo9U4q5L14jdWGCM8HcJubDIqgGeCPf16hmjlj?=
 =?us-ascii?Q?HpJJnHomuPULaEmW6nGp0uRxnpOWN4ni1xqgejqk72KtPUezPNpSpQOLSzez?=
 =?us-ascii?Q?k0txLIRxIWPbD+CQy/bGO2row1byJ++gxVR8nlVYd/fOAB7nJ1PK8XJ+Y8tj?=
 =?us-ascii?Q?PT/lKRCc+Ib1OoiYcqlQ9z7ywdDo2531rsipN1Lw/nx/dOGNcW1OloTOuDvG?=
 =?us-ascii?Q?gBtrHstea6iWg+EbuY3+4aQsd1O4/xuwU12AjmPNZOQXkphBGbKr52+HVXU6?=
 =?us-ascii?Q?zOZdl4eeFdNKFxwBqM/DF0gwiTODQ5Sb/P52hLoFltazBvt7b8iVNR+pMUrq?=
 =?us-ascii?Q?mJVKIuaAcvU6wOy029WUZFjcDIYy9v6M1COONxy3TNvcSWe/XpoSg1bjr1Wc?=
 =?us-ascii?Q?p3O9fBJCGn4hcJvO5GgQsncew00VnYLZXrZU1E5NravekB+QNzku7K60P5am?=
 =?us-ascii?Q?Pkh0EK66ejlBXa2XhwSrA8jQu4qtYNPv8pFI5PgjtaW9so3tJkITpwvHs9Bs?=
 =?us-ascii?Q?NP4cIeS4R6fMHwYYc3oedMuzgJQS7pDtED+T/NARLFUe4KPrdtmQXiO03JtC?=
 =?us-ascii?Q?SFnZWBkdGw2DmxKA2u3XKCm9ru41x8pLgbdcMxlbwi9zBJcVBaGu4UJvyaAV?=
 =?us-ascii?Q?HN2F+FnBz8VlZpN5CdbbAui5eO9Csqt+xu+VlCAQOwp00UDH2gpg9LkF9FpE?=
 =?us-ascii?Q?tnVWOyS2SEi8DKnNqc2q9HEEko0ai3VbULwGP16UwMD4vDguWCejgixPsI7s?=
 =?us-ascii?Q?ZLtpFyOFYG6+dzwHmX6Xa4m7gfpaGVgmTDCGPYNg3woNhOm+67RHXGJ8bvXW?=
 =?us-ascii?Q?Dg1cYdGvdtSSjS8CZ/+1BRl5v9lhQLoI7SrRhDHQlFv0SERz60SY1mqN1BWG?=
 =?us-ascii?Q?rjlzeZ3YYnpP6qskyfhg3rxBYDavJeEO7xJcsiGPOs/HYlHo062hGO7V+g32?=
 =?us-ascii?Q?V4cGUMrI0aSVX/B5A0k/s+EFXOLpTYItAtAP+rhUq5eQ/edRlgQTS2X/3XA6?=
 =?us-ascii?Q?hqamuKCar1YiJd2Haq2wYj9dmittoaTZQTQrLgYWFIe9+ZXP7YYzsVerud7D?=
 =?us-ascii?Q?izVixbGsKyyuf6O2OIqXYNWbnVP36Hs21cVpn4YiQ4bjzsDfmfpDlqjTGyTC?=
 =?us-ascii?Q?bNUFO+bSQf3F4SzfSu8j4byYa5qyLalvrgmPL7w0bIhYprevowYIVpintkTn?=
 =?us-ascii?Q?zwfHtA2xdd8nxCUrkkg1aCwKtwXYlq749FhrPJhvjwwoB9csV/gJ1C6S0xvc?=
 =?us-ascii?Q?qhYjY16UHhxy4pTSbzlbMknpSC8I+GFgNB+EMYhQsnYkbLWfaE49KFtc11vZ?=
 =?us-ascii?Q?nWt+fpByWjYMHG1G4r/qr+fvsOeoZjxSteK39suLBti0S47bzBzFFnR+Vw06?=
 =?us-ascii?Q?8icdMgw5BhsglDXAZ2EQi412OLQe5gwgVwstR1Qh9z5ihsknDai6NHqMvcoh?=
 =?us-ascii?Q?huH4yWPCirmr1gyijw7ss/cH17Y6mHQkipBZnXYVH36r7ymv1xWJlg1Pl85B?=
 =?us-ascii?Q?nd+bRdRWOTs7VbRHbVdzxvfHNumyHNQgJm40GyCk3xSqAnmHCnz5rfzg/r4N?=
 =?us-ascii?Q?83wZTUgmSqNe44eLeEISLW6kIEEC2sG+VgRM7J2ZWJQzhfBdnrBDPudYZMHr?=
 =?us-ascii?Q?X7Mxh4SXQmpQce5PZlKRLdULHQtbS68sJj8d5K8WE4KntrCidGk/?=
X-Exchange-RoutingPolicyChecked: qU2NNYR4N4Fw8TqrDacKR0lbKWNpVEkvSyoQqrB6dw7Edmoxz7OKk7QGaDbKyShdcGVLgFb1fCPEJwmAmOMHhI+tb9To3yOQ+radImtEineFIL8aF0unbyUG8A8iuEJ80nuUugJiaG+D04l/c8gdKaMePaNvyiN8Caqw5YO5Ps6X1I2GNRGOiSOf1WRf3/XssRwQlcF1hHVVzPsGz+vV3hha6KRP26XnT0kehxgYRxgkeh4F9TWkMSe9e0d/JDQLWspTmsoE3xIVCm126WB/AjZEN5jTD+DrxbAPGiEj/HTWgUDWPmt9vBQmkAdoAqpOULN2Y9PtxS+IDfUTAHJkaQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7db1a596-f29d-4c72-3027-08dee368dd4e
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 18:34:26.3438 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZZ6K1bLFe6s5ECQNznHlo9J1Z3Ke6YS2MojH+QK4tOEymfrWJnIUfdLuzWA+8tgvFB0KR8DlFRMsaVcuurHZ8SYs1oPhxMN5Jz6tr3Esgj8eHcMfreWZeG0L90qVZ+4f
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7277
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

On Tue, Jul 14, 2026 at 03:44:49AM +0800, Jagmeet Randhawa wrote:

Use 'drm/xe/multi_queue:' in the commit title as it is multi-queue related.

>HWDRM is currently the only supported PXP type, and it is display
>related, so it cannot be combined with multi-queue exec queue groups.
>Reject exec queue creation that requests both multi-queue and PXP,
>returning -EINVAL.
>
>The secondary queue path already rejects any PXP property, so this
>adds the missing check for the multi-queue primary,
>which would otherwise allow the combination.
>
>Validated with igt@xe_exec_multi_queue@sanity, which exercises both
>the PXP-unsupported (-ENODEV) and PXP-supported (-EINVAL) paths.
>

Requires 'v2: <changes done in v2>' required.
It is fine this time thoguh.

Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

>Signed-off-by: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
>---
> drivers/gpu/drm/xe/xe_exec_queue.c | 11 +++++++++++
> 1 file changed, 11 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
>index 1b5ca3ce578a..ea8546b67e6e 100644
>--- a/drivers/gpu/drm/xe/xe_exec_queue.c
>+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
>@@ -1056,6 +1056,7 @@ int xe_exec_queue_set_property_ioctl(struct drm_device *dev, void *data,
>
> static int exec_queue_user_ext_check(struct xe_exec_queue *q, u64 properties)
> {
>+	struct xe_device *xe = gt_to_xe(q->gt);
> 	u64 secondary_queue_valid_props = BIT_ULL(DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP) |
> 				  BIT_ULL(DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY);
>
>@@ -1067,6 +1068,16 @@ static int exec_queue_user_ext_check(struct xe_exec_queue *q, u64 properties)
> 	    properties & ~secondary_queue_valid_props)
> 		return -EINVAL;
>
>+	/*
>+	 * HWDRM is the only supported PXP type today. It is display related and
>+	 * hence can't work with multi-queue. Reject the combination. The secondary
>+	 * queue path above already rejects any PXP property, so this also covers
>+	 * the multi-queue primary which would otherwise allow it.
>+	 */
>+	if (XE_IOCTL_DBG(xe, (properties & BIT_ULL(DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP)) &&
>+				(properties & BIT_ULL(DRM_XE_EXEC_QUEUE_SET_PROPERTY_PXP_TYPE))))
>+		return -EINVAL;
>+
> 	return 0;
> }
>
>-- 
>2.53.0
>
