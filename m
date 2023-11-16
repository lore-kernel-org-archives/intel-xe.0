Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74D28C197A0
	for <intel-xe@archiver.kernel.org>; Thu, 16 Nov 2023 16:38:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 222F110E63B;
	Thu, 16 Nov 2023 16:38:40 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B62C10E63B
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Nov 2023 16:38:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700152719; x=1731688719;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=K5pH2JYsOho7UWRK4XhUtJTFhdT4zRkAholpfNtYyCA=;
 b=Y2GpcEl2NU+J4Os60iR3KqAUxonp1+jsruZd751RhlWeD9CTWwMurgWp
 9Oxb0Ii9+bTKOUtiNja3tLRW1cqulEeV6JjsKmOIQPcyU97DtQ/l5SizR
 gQg0fxeghmtjtQDRKHDCuRrEnj9IVLW41WwdlGS1/ef9hCsvKduzJ/L2Y
 4aEO0CyFlUsCsbVOfyUQ+AxJZiXZFzGkcz6Kve83p/tOqjUVBtYh9CSBO
 onsgfaw/LcpCVEVs83tNw3W7nzl+ZUOk3tdrCaoh+wnUTtfcJg/bdR76m
 1TAAQJpoPz7IAduJTmffCR/KzvFaXPhliQCaEvqyytaoE8QfFzBq6efUV g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="455417142"
X-IronPort-AV: E=Sophos;i="6.04,204,1695711600"; d="scan'208";a="455417142"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2023 08:37:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="758888484"
X-IronPort-AV: E=Sophos;i="6.04,204,1695711600"; d="scan'208";a="758888484"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Nov 2023 08:37:55 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 16 Nov 2023 08:37:55 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 16 Nov 2023 08:37:54 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 16 Nov 2023 08:37:54 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 16 Nov 2023 08:37:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V9PdZm+F8lTfcMz9clHwz4Dm4gtat8h0ajEKpfWXMC/h90RN4tOKu1JdGhySS1qL/vDc1ShyKs6TBGzszTEg03MdI1vr++l637TRXRmcYErqdzbhlY+NDaQGm10g/8si5tdDqFNWFbS4RAkAldmPzvfDp0148seCe4EbmqIhI4QigSVlKSKqrWOJ04d/8nQJI2Q2Y+Z62SSF2dDSoFfRbNVXMufb3+/GVuGhD4g9oPhOGmX6lp0M1sYJuwHue1dzUgRCiYSSpFefyRr3IO04a5rXjTaluk6oySvbiaKuyuOhB6ZxdLfhA9gm9pJ84sSKKd0aneSIJRqUbHIwFhEh7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YOsZOh3+FhJNk50OP62+P79vL7oUOS0K7E6QxclI7VY=;
 b=iqPqqx9Ch0PbNAokyJrh16tOgnt+F8L+UhhAVCH3YBRoy19yUEuYZQwK42mkfAIZaQ+dL4G3oDhoe34ysYDntBTDxRcl4nMXss3dhTd1zALf2mdmS4XB7Zlk2Tt35eR27mXUC1kXHLEb7l1SrxGCR2EGrMNa/7x26o0qNbKvYh0AxA8Ah/xRiyBkinkNVSQIJD+11sGvnA1FfdzLJbDORdooQNPy7k+Puowj3DA8PV1IRxg8Z0BShVwq4DnpnuLNDnES1zBkVfUKUrKPvxj+Yj/VbSPmA/HraMTo5isfe+kmleu1mPaBsNeSAOSF2rd4nsO8nmSptpfPgIp8xZbZHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CH3PR11MB8465.namprd11.prod.outlook.com (2603:10b6:610:1bc::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.29; Thu, 16 Nov
 2023 16:37:51 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::1c7b:3943:33a5:aa9]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::1c7b:3943:33a5:aa9%3]) with mapi id 15.20.6977.033; Thu, 16 Nov 2023
 16:37:51 +0000
Date: Thu, 16 Nov 2023 09:36:31 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Message-ID: <ZVXin+3VAGkegHGZ@DUT025-TGLU.fm.intel.com>
References: <20231115234043.2518971-1-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231115234043.2518971-1-daniele.ceraolospurio@intel.com>
X-ClientProxiedBy: BYAPR07CA0024.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::37) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CH3PR11MB8465:EE_
X-MS-Office365-Filtering-Correlation-Id: 57ea4cb0-7e4a-4bba-2cb1-08dbe6c25f9b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FtmnLjFKpxVjL1Nd96/6K68ITPHDtLZkLgVcJfV8V2j0T1Hv1QkgY5EsFNOdvGWaDEd1ew1TJGssnMsPe4PVr66w/FPRYn7UvyN9NJP9q5Gs0GnDLMkFg3Ej7eDza2wnUYO1RFAxlPGk/KSomL5b69hejtGSLBDOBeQtuEBG4wwaOfW268nE/2y9HWokO8pZCNRn8++SthMA/yiztbLTyurS/Deg3crzFDfP1kEfj4pATRKWJzbu1XNCNat1V6xVxIWrmVgvhKGWiHTuCYui3IA/2VS80UA42tA/FM4YGdIsgxizS2hk3DpUpiRaFVcrAtM/JGTO7WU2aJI5/MqC4m8Grp6VkaEXQaXKzvrSJZ5g+wnYOH7zdGqlTXzScbkFXL23NoYSGjBDQ/abmxvHHmoZl32LNM+mFMov2xvvFnQw96IzvWG7IcdBPbWkV4azpfXjDm4STuJVnOfNphDoZYqZNiKnLKbY2N+6z9lEgS5u79MVW/5m/Dvfn/iYPyjCRQc/6giZ+7ITpZbnCHpyiVmr4S8ialKc777zanrO/wJN2gtCESSZKEYWA/t0NNC4ZW7vnziWN7bQ5Bu3VkCZTTf+uNWRs4GnMCYPvf/fMYQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(376002)(346002)(366004)(136003)(39860400002)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(44832011)(6862004)(6666004)(8936002)(6506007)(6486002)(478600001)(4326008)(8676002)(6512007)(5660300002)(107886003)(316002)(66556008)(66946007)(54906003)(6636002)(66476007)(41300700001)(2906002)(38100700002)(82960400001)(26005)(15650500001)(86362001)(83380400001)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IuSwjM5xndqIkrqQe4bQiF9EIny/EWwNkfNPSAa65mzMceG75atOqdINwiK4?=
 =?us-ascii?Q?kS4DL62XDTMrTWQpgSXM1gGIxfPq+w9gwGvNPqifqeWdOBhq4TVe0J2JNLme?=
 =?us-ascii?Q?lB3YHRlPXn8olOEwUB8boEO6Xvdiv6O1DFQQ4ARgFlU/3oSFGniSNhSieIt1?=
 =?us-ascii?Q?hvI+0T/rCT6eSp3PlwMVkHfGZqA1MWjbQQmxSM5Ru4N+f955jy1n8D14NF7Z?=
 =?us-ascii?Q?7Dtyu7LFh/nSU34kQafVpHjo9XzmpaS9zrszHJJfW+GwlMn0y2HNp+WQA9la?=
 =?us-ascii?Q?ZP8d998Q1f4Yk3dfhpcaxyX0e5eGJDfAf+d0mO8Wj0uTON+W97ih6hd7bQeo?=
 =?us-ascii?Q?jtyjLNhQrzcMYL4vLJSEcTe3MYiwtgcCNX2IsSHwRjIO7Tx/KML/eQ4dSTcS?=
 =?us-ascii?Q?gMy3/B38fSRVUn8uOJIX4uEnlDGo1PSVarq+ICpXT82pm7g/LX11y79ur/UL?=
 =?us-ascii?Q?vPuS59e/tcSV8U6ZewJts5+HyEESdItWPLIR+PZ67NxXvpskR4pX0Dvi2giY?=
 =?us-ascii?Q?ahVpfOBtInWMCVCmbJ3kF9z7kw9gCAcKcxJl6WXgEvFDHHUmCbw2kyKWLuVP?=
 =?us-ascii?Q?OgO6bgPrRzenTJHN4yNbj7I1HQRhEbUkzDlrRgKhes2swgT9Kw/UwK18QpPF?=
 =?us-ascii?Q?odHD6ZuFVOu8kU917voV7csFeg5qqldBBWvH0trh9fMJ91af5xogfLaUSXP5?=
 =?us-ascii?Q?D6qr3pzQycMnFnckSHdkRaHUypujTg7H0r5NbudUNDcwmWOnmMiTsD2ynQFh?=
 =?us-ascii?Q?safAqQ+xASzYT2+qfWvjEayDe/ldvOPQRel5PCqnGFceOYKVsvkkPBrWxPVk?=
 =?us-ascii?Q?2m9u6PkZt+syqub01iBCfjrg7ZXCtEpvCTCKEieW2DMns9WyV7KfK5xVAAqH?=
 =?us-ascii?Q?jBTyutkMbbeoj1hZQPR0+opjw1P64rHCH4EOievDdkdYsRXvdiOhcmFRj36n?=
 =?us-ascii?Q?zK6q8W+IxsJX353gUvMf7xIXX8hTWQj61DAGhEQO0H7LE7sstgohAEBl2A5z?=
 =?us-ascii?Q?8Ejkd2TsW62NSyxueN7SvKCq8KBoCtiw1WID1WitPLxO/HFs/KSncYhWFZd/?=
 =?us-ascii?Q?nhxI/0mGUHSqu1O+ZD62BYAUuZy9V9COKFzgho4XUDwZxZabCF6mUPWvXp8u?=
 =?us-ascii?Q?dTgzmS3VXcSajmHyII8aCl8lgszurx+3D82ifJgTynMIKBdDe+DS+U+w8EIA?=
 =?us-ascii?Q?ZcvkFwNuTZvFvxZhd7MXpIa1YwymObyODlrPAq1k0bQxIBWecgP4F2xJp47C?=
 =?us-ascii?Q?QPYLx6NEqODEsRIG19pkAc+WuPkYNzMHm2lp0IOlx5kuwjbwL3jX7WHfTlAh?=
 =?us-ascii?Q?nmgsT79kNVLqreNyJW8WH0I+ZK34DFK7KFlGyLpX8uz8/7xfqTydxVlwebiw?=
 =?us-ascii?Q?XE6EOae4xXsalK8uxjDeaHSh6GZZybIGJ1o/M49CopcGZJE64v9gra+kLc35?=
 =?us-ascii?Q?5P14Sa5VYRNUFrtkUOHIVPm0Lku8pGlBwlAjXm6MxUUA72ABk+/cBnMwjxiz?=
 =?us-ascii?Q?G1J9HKCnjoaiCjTMC2ysVBY0T1m5opRWrH75kpdONX26jLZeFG2zekLEBftp?=
 =?us-ascii?Q?1Ejif9+V9vQvgDf2V36Xg/Mvpk3CnXwIr/Ru3ck2jTcfZVuCAFjutQvRelY/?=
 =?us-ascii?Q?9g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 57ea4cb0-7e4a-4bba-2cb1-08dbe6c25f9b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2023 16:37:50.6588 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5OB3reg83+B4+JtdPtFOS31J7Eqaptfq75Vsv0nUeQ4QruvGT7w4kW2ny85wOfy/ahxKlqnQe15XfilvFp9unA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8465
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe/guc: Use FAST_REQUEST for
 non-blocking H2G messages
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Nov 15, 2023 at 03:40:43PM -0800, Daniele Ceraolo Spurio wrote:
> We're currently sending non-blocking H2G messages using the EVENT type,
> which suppresses all CTB protocol replies from the GuC, including the
> failure cases. This might cause errors to slip through and manifest as
> unexpected behavior (e.g. a context state might not be what the driver
> thinks it is because the state change command was silently rejected by
> the GuC). To avoid this kind of problems, we can use the FAST_REQUEST
> type instead, which suppresses the reply only on success; this way we
> still get the advantage of not having to wait for an ack from the GuC
> (i.e. the H2G is still non-blocking) while still detecting errors.
> Since we don't track the non-blocking messages, we don't exactly know
> which one of them failed and therefore can't attempt to recover and need
> to escalate to GT reset instead.
> 
> Note that FAST_REQUEST failures are NOT expected and are usually a sign
> that the H2G was either malformed or requested an illegal operation.
> 
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
> 
> In the testing I did locally I didn't see any failure responses, but I
> didn't run the full CI suite. If failure responses do come out from the
> CI runs, I'll try to fix them before merging this patch.
> 
>  drivers/gpu/drm/xe/abi/guc_messages_abi.h |  1 +
>  drivers/gpu/drm/xe/xe_guc_ct.c            | 28 +++++++++++++++++++++--
>  drivers/gpu/drm/xe/xe_guc_ct_types.h      |  2 +-
>  3 files changed, 28 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/abi/guc_messages_abi.h b/drivers/gpu/drm/xe/abi/guc_messages_abi.h
> index 3d199016cf88..e517e2a740d2 100644
> --- a/drivers/gpu/drm/xe/abi/guc_messages_abi.h
> +++ b/drivers/gpu/drm/xe/abi/guc_messages_abi.h
> @@ -46,6 +46,7 @@
>  #define GUC_HXG_MSG_0_TYPE			(0x7 << 28)
>  #define   GUC_HXG_TYPE_REQUEST			0u
>  #define   GUC_HXG_TYPE_EVENT			1u
> +#define   GUC_HXG_TYPE_FAST_REQUEST		2u
>  #define   GUC_HXG_TYPE_NO_RESPONSE_BUSY		3u
>  #define   GUC_HXG_TYPE_NO_RESPONSE_RETRY	5u
>  #define   GUC_HXG_TYPE_RESPONSE_FAILURE		6u
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index a84e111bb36a..81d727b72709 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -448,7 +448,7 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
>  				   GUC_HXG_EVENT_MSG_0_DATA0, action[0]);
>  	} else {
>  		cmd[1] =
> -			FIELD_PREP(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_EVENT) |
> +			FIELD_PREP(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_FAST_REQUEST) |
>  			FIELD_PREP(GUC_HXG_EVENT_MSG_0_ACTION |
>  				   GUC_HXG_EVENT_MSG_0_DATA0, action[0]);
>  	}
> @@ -505,7 +505,11 @@ static int __guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action,
>  		if (g2h_fence_needs_alloc(g2h_fence)) {
>  			void *ptr;
>  
> -			g2h_fence->seqno = (ct->fence_seqno++ & 0xffff);
> +			/* we reserve fence 0 to indicate unset */
> +			g2h_fence->seqno = ct->fence_seqno++;
> +			if (unlikely(!g2h_fence->seqno))
> +				g2h_fence->seqno = ct->fence_seqno++;

Good cleanup but looks unrelated this patch.

> +
>  			ptr = xa_store(&ct->fence_lookup,
>  				       g2h_fence->seqno,
>  				       g2h_fence, GFP_ATOMIC);
> @@ -792,6 +796,26 @@ static int parse_g2h_response(struct xe_guc_ct *ct, u32 *msg, u32 len)
>  	u32 type = FIELD_GET(GUC_HXG_MSG_0_TYPE, msg[1]);
>  	struct g2h_fence *g2h_fence;
>  
> +	/*
> +	 * FAST_REQUEST messages don't have a fence and therefore are
> +	 * not tracked in ct->fence_lookup. Note that those messages should
> +	 * never fail, so if we do get an error back it means we're likely
> +	 * doing an illegal operation and the GuC is rejecting it. Since we
> +	 * don't know which action failed and therefore can't attempt to
> +	 * recover, we need to escalate the failure to trigger a reset.
> +	 */
> +	if (!fence) {
> +		if (type == GUC_HXG_TYPE_RESPONSE_FAILURE)
> +			drm_err(&xe->drm, "FAST_REQUEST H2G failed! e=0x%x, h=%u\n",
> +				FIELD_GET(GUC_HXG_FAILURE_MSG_0_ERROR, msg[1]),
> +				FIELD_GET(GUC_HXG_FAILURE_MSG_0_HINT, msg[1]));
> +		else
> +			drm_err(&xe->drm, "unexpected response %u for FAST_REQUEST H2G!\n",
> +				type);
> +
> +		return -EPROTO;
> +	}
> +

Was this intentional to before the lockdep assert? I'd put this new code after the lockdep assert.

Matt

>  	lockdep_assert_held(&ct->lock);
>  
>  	g2h_fence = xa_erase(&ct->fence_lookup, fence);
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct_types.h b/drivers/gpu/drm/xe/xe_guc_ct_types.h
> index d814d4ee3fc6..62f98dcaeaf1 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct_types.h
> +++ b/drivers/gpu/drm/xe/xe_guc_ct_types.h
> @@ -99,7 +99,7 @@ struct xe_guc_ct {
>  	/** @enabled: CT enabled */
>  	bool enabled;
>  	/** @fence_seqno: G2H fence seqno - 16 bits used by CT */
> -	u32 fence_seqno;
> +	u16 fence_seqno;
>  	/** @fence_lookup: G2H fence lookup */
>  	struct xarray fence_lookup;
>  	/** @wq: wait queue used for reliable CT sends and freeing G2H credits */
> -- 
> 2.41.0
> 
