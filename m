Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6E03EC1112
	for <intel-xe@archiver.kernel.org>; Mon, 23 Feb 2026 17:05:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D02210E2F9;
	Mon, 23 Feb 2026 17:05:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k59JOXtI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F03A10E402
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Feb 2026 17:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771866340; x=1803402340;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=EnMjbSU596NCyI+HoQB46SOd5X+CRmg1cJlH9yRkDMo=;
 b=k59JOXtIeH+oCnScjkYnJVKpsZRdbtJvQFCRpM5AZ52vXyVEv8Hu4N/R
 h/LGAu3qt7+lewsOQuxMRsTc/WVPcbsAAguvSWxti5DwSHDd0mYv3fvSY
 cvJD2hA3g5PRgUycTA1ob4wORi3uX8uf77Vlbtj1hFE2E2x6+1fcTR2/H
 +v9vs6Xa0vTR5UEDbDKMO9EVS1G3ZIL1yp6Ca9BtWi/ccGs2nNoF36Awe
 YCdOor/n1wc81zJGRD/gw+Wnknb79zYcmNxkW5cs7J3YtOdqZDuAmtTVR
 ebmO62STl2tOTiUugIzCta4RVy6fnZ+ldWXD5K7EVK17OYeUmGvrCrioZ w==;
X-CSE-ConnectionGUID: AfrRyFs3Q7W13XxSukrFIA==
X-CSE-MsgGUID: MfNY5RInSBOK94JEDIVk4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="84318996"
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="84318996"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 09:05:40 -0800
X-CSE-ConnectionGUID: 9qDLZu9LRI2cye9k9ZDXLA==
X-CSE-MsgGUID: 7ST9asELRySZ+9cxbzNpPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="220176963"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 09:05:39 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 09:05:38 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 23 Feb 2026 09:05:38 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.24) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 09:05:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H9sraQi8Zjb7rykaXB0eHZuhsQuCqwiHpPaiDd7l6r5WjS8kUP927PHhun1b4C449NZqyS6kUiw9+21Z36GZ9zE+zDP1l7A6qj4g22CggPNns8XGfmCQ9nR3O5pFJmBOJ2JTRSQtM3Cp+E2WSbWTd+1mi/c7KUz9gZoy4rSDPlWUUNvufHB1htVaFJ97CYke2WTP/Um6XHFQ/CIo3lQTYH/Mm2MHFHGnFKleztNtdt9sLbDCo7yST5riySebZVPiOKsQ4BPu6TBjCiVY5+rgScQP13y5jZCgV86Wkt/7NAt65d7PPEAhUTyJQdf8NbUw62I5EmIsxGFnkuUMZcmWRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OxLdo0VyhzGMIdbvegP7d2V4rIJgPZ0zqpNitU4QjM0=;
 b=WVFsG8e2sAc6S8bBGCEN0Xe/S8wKlRLWRcZbQKRvCTxjN5Q2dhvooqR/pnCzxzprVgjlKCpZNkTm40Ar+b8ygLL3geQzNHZCGNTXgJ81jfYZZzYgoOnK8PJMWBVbelOHIvQXZl90NtPDz5Uu+7yn8DWW7FXkMrENCfWKxeWBuPl44WInmDXWWv4jiDsilygtR0M0iiO2q5QD0SlE4FIeDrHloTZMjpQCIKMHPsmDW/etEBs6grIv3fUInccN6Iwv+pGg9f/ZCsz63nlNvSNDfuvUEUbzdX7En2BL1dwLCXaApc5bw580Vnirh14mVTAyp/SAcwKHtMIZGENVMSkPWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA4PR11MB9034.namprd11.prod.outlook.com (2603:10b6:208:567::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Mon, 23 Feb
 2026 17:05:36 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%6]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 17:05:36 +0000
Date: Mon, 23 Feb 2026 09:05:33 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Shuicheng Lin <shuicheng.lin@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/2] drm/xe/guc: Refine CT queue checks and log formatting
Message-ID: <aZyI3Z9MTuwDCl2q@lstrano-desk.jf.intel.com>
References: <20260223162350.3205364-4-shuicheng.lin@intel.com>
 <20260223162350.3205364-6-shuicheng.lin@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260223162350.3205364-6-shuicheng.lin@intel.com>
X-ClientProxiedBy: MW4PR03CA0337.namprd03.prod.outlook.com
 (2603:10b6:303:dc::12) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA4PR11MB9034:EE_
X-MS-Office365-Filtering-Correlation-Id: 7beb88a2-769a-438a-910c-08de72fdc340
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?pzhQXcQDIhca/cl4jO+Uu69zMgxlrgacY09cZpJZ3ckRimGQXxME461zW7il?=
 =?us-ascii?Q?geQ7UzCTHLWzR6hpWrgCJx81rULgFmI3rZBRns3Gy44GbjKCozI7Y+V28T+v?=
 =?us-ascii?Q?ajnp6pXSkQZYecUH4+mcd1PfE2ZH5kubWs+lywINTSr3exrgjKBVF0WnuEDY?=
 =?us-ascii?Q?F/sgsJ7EL9VP7Vpyc16F6PAfADFMiXxboUjY8YSsAuq7u1g1CU9r+W41o7cX?=
 =?us-ascii?Q?MA8nQBZfrAkNg8gNfrnOyDlWYA5Ck+P2/xxpkp74iFTjhbKMd3jC0QzHwoHd?=
 =?us-ascii?Q?PMeIlmdPcMEeKJHmBBIlpygrPyrJrOJ7Vzfs0IpJ//4yzfMRWA1ZjUNWSX+w?=
 =?us-ascii?Q?70+2B0T3fVic9xvCgvUHqwwygwf6Zp24il67VbYdfVEOd8HLveSo6EajcbwR?=
 =?us-ascii?Q?lobhd9MdjfJ7iUs9nWUQ4TM3fhX5tEWZf2a6oCQeSpwRb3uO3EJfs0V/0Jxr?=
 =?us-ascii?Q?/sbojvxYUaaLpAfnqGwsaEvvw1tFP6g4kmqCU1icCVH37VeRReJbNGygLGpT?=
 =?us-ascii?Q?iT8ON/HFZ/ulT4oQQRbG+OzBtIfqdDy7BMnEi5/ztG0DmkX6Y6IR3uPPdlY2?=
 =?us-ascii?Q?gzd+0zbXN/i1Y5FdnfuLpaFDJKpaBlFMgNdcxJj0sss7er268DpRBsovcKAV?=
 =?us-ascii?Q?X6no8NtZ/3kt/VAcWJoHeaawNXrZHFBDoHS3ACYqTKsUwGDhaxjDvb7pvhYS?=
 =?us-ascii?Q?pb6bj+jwy5hoTOUuPmSd1bxhejRZ8H0xfYtog95NapTzmUK3cX0zkpJTUtY5?=
 =?us-ascii?Q?0HawvZNKYLDPAsfvlC/2ILSzldG/qpAMw+QVavAo8q6HWb9XlcXvfN4X2Lpz?=
 =?us-ascii?Q?XuppH7YFgTkInl5Rn84rx8kw793l8Zxcx15X6igXUqTEogsl4AY5/n4N2qds?=
 =?us-ascii?Q?uvZ8Hj2GazCoibiQh5SVaTT5YYHQtbT74lt0P8+3JXypqRlWeI9wbjgFb9KR?=
 =?us-ascii?Q?5PH8XR3b8aeOAdzqXkoqYiBGwe+9/usc/DPqqTTV/WA+XM4LAdd3jLLRBM08?=
 =?us-ascii?Q?8IRZKU5jcMstsmZ/iUJ86iGYg5sSRp58EguSN1oucxic5pNUh5u0vPOe7xQJ?=
 =?us-ascii?Q?QNyQSwmHXLShrKtq1H54fJrMsMV5IjFqIOXAGFKFaACXl947AOMzdjWDUrB+?=
 =?us-ascii?Q?VpZgLl2L0a+3E9MuJdLbqAySDO1otrtfh3BDB7KyxKuo7K9Lp4PiZEe2iOFW?=
 =?us-ascii?Q?oH5dBC3uouXdaN3UXEH/uVP0sRNdpXaYLME+Q9Aa1cXemuedy/6ojE2XfZzg?=
 =?us-ascii?Q?W6I2L9hNkyDfU/wb+KYCDoz7t6M29+qLnmbi3SXbESFWiDcjPQvtcStepWQT?=
 =?us-ascii?Q?JtK+qyyWS1VoMIvp9iWbbvsxs3xrQ+0chhJ3Nj9rXW9uIgqzgPRPQRrcNjUP?=
 =?us-ascii?Q?NebqKzkj1goWietyjFprxc1KPxmL3oOKo6+V27AhjOTmGJHQLiCSUeygQC4X?=
 =?us-ascii?Q?kSEc/GeC/UHoFY0cEttCth7MZgLoyI3iXxTZMOLJv8XpzefuUl2azY1iWiYP?=
 =?us-ascii?Q?tKHsKNsEd3xgey9dpxtAIyjLlwjX+8qYjCH3+hmQWH/4brWP6SNzcD62rjyW?=
 =?us-ascii?Q?I9bWUdTuWiwl/GGd+58=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3OV8VmgFRtlCskcbuPKIyY5uqevo/86lC9ThQlr483zv6nKX/c9z1mSaigC6?=
 =?us-ascii?Q?voZq2rtLky3ztWTAjK+ueYP96GV+UG2mS3+ipSC/iNAejN0edn+04nrQS+Sj?=
 =?us-ascii?Q?72F/RuPxC8Xi/MsWFInRtmukmu9XAivubaWSEiyXfnWyibrXJtC3O61qKzcD?=
 =?us-ascii?Q?D73Fh9dUnntUuZI2vrrZglDBZb2vlFRuvF2We+b0u9b9152k0/qzAf/zyno+?=
 =?us-ascii?Q?AAHb9Qs9D0djnpSyE7fJ/GIzPyR+oYen4aZZahyIA/Bi1kafVpgu0RnG9/Ve?=
 =?us-ascii?Q?9GXttKXzKs9T/gKuR4mZBE3CtUI2I1+fvVGv3x/4UnkCVGqqIipWUDZfyVVv?=
 =?us-ascii?Q?P/HlggN9qcbbqYkCAFgnJ3HaXDrSxbcswTnDszg6XqRaTFUtCYsXka9r0I1l?=
 =?us-ascii?Q?33FUlmzBee9BonOmXNe/1cPAQzx54JKF3ZLZ3c9PaYR8BdmK9AA3n4yZPXt0?=
 =?us-ascii?Q?eN5eALkmYPWeOE0VEtvU4biK5u1ahi6JZsEZW7HexMr+Y6HPsvK8mzwfoIs5?=
 =?us-ascii?Q?ExYEcPPLPkeHmmRVphEqMMLIS253XAzAAO3OgBfzsSCtJCRQJD/un6gMufZ2?=
 =?us-ascii?Q?/ZiWXEubLm5aiSvwlD6tuextxOExo1hMz0viaUo2yzIs03mV3RtjIK3kbVZC?=
 =?us-ascii?Q?nYNCs+4nVovDNIJOzH0TcDh8CpSS2eZez5C+TmcPEZ1LEbRno0nX3pgbscdx?=
 =?us-ascii?Q?yRwIDvu476S6zbuZMpGemLnVqIkx++SmWt8cL2zVk0OuXMbzyMWreNDpukyn?=
 =?us-ascii?Q?mi/K9fKPznKb+rV4clH7N86DdLYHGjUNgR0WPY9gQQR/1utXBVyKuLEi18aT?=
 =?us-ascii?Q?HPZeZuaTJd+eAw4SNLo27hoI9vD8ijgUZ3z/k8sawoyMtfcaW5pTjb+wYcwR?=
 =?us-ascii?Q?WaXir7wCxj0DFJDAAvRYfoLpKp9xIN59hp8QmgdRcCyawVhhJV4r6u006Gvf?=
 =?us-ascii?Q?DpBcHHuUUuJDOu/iQQHmJ52LclxIzDZc35RdblVpItbpBDPLsVyyLm9830By?=
 =?us-ascii?Q?RqBYviX2fyIHp2RFjrR0ZeKJBIdynlVDkszF3Deb2n7YB5CPmKBtImBqEAri?=
 =?us-ascii?Q?eSyVGesHR9XYqJAWIsrvUdEg00MAkZUSp82hZXNHKPNJKFZTMtI8iW12AbYH?=
 =?us-ascii?Q?UMB9KfB04vHf+8BRG3kcVAskyeDD4vDmBkcW8Ebk8sWey0w5CrO8dIYNm8pP?=
 =?us-ascii?Q?YQnWgTEhBpC0J7Zt/OLrYsf6ZkyWB2wAN4gy8VryJJJXqR04gcKHyySSyb+z?=
 =?us-ascii?Q?qULVcST5EK8XNBK/VfjJIB4p6nEiDNslDHvqiR49zMd299BQzc5Rl8rx5kAf?=
 =?us-ascii?Q?WTHskgndaFZVFBxKCiSI0lmIdJBN3zl7HQsrk7Rsxgokv/zucKRFG+K431Gd?=
 =?us-ascii?Q?JTq1EO1geza/+Y1sksZKLr+pnkkjuCbpDUB3lrq0kHZ998SNw/b9roFS6VKY?=
 =?us-ascii?Q?KZK1db3I3VVnEJtviMNBV+V2ipOxLhSBBbBDs6F42+pMIM7J7KSnTsTJjAiV?=
 =?us-ascii?Q?tteg/mZE7/Izyz2TGvjGi208GSqUfIcQlsV67+XSPXTDto+m4uFuMGxmL35z?=
 =?us-ascii?Q?qeVRmu6j2J9j6c0Ya7jdioP//O5yW2q800WXKR2SMO5EXBxkfTr2biwTNAag?=
 =?us-ascii?Q?ZeWlJtIYYnnayOf0TrUpaIJcIO4ULXzNqgpjBzfyB7MwaDInsO0vwt3TQ9aA?=
 =?us-ascii?Q?J+Lq/gsajG+Ze/975PLP1xKricb2XDROb3nI3ANXzNzJHUYAbLCfiXwFyJNb?=
 =?us-ascii?Q?o9ZJpyL9tnAsel1y5ddgwr3qEFqX+Oc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7beb88a2-769a-438a-910c-08de72fdc340
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 17:05:36.2514 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wdFRvbyvWxcfTxO/pmwv5Zpzyo8ywOsZKCcyU2Ileh8w9ZLZN1lOi1BeNSCm6f8l4/hxAhYYWH7D0O48KMKGdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9034
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

On Mon, Feb 23, 2026 at 04:23:53PM +0000, Shuicheng Lin wrote:
> Fix three code-level cleanups in xe_guc_ct.c:
> 
> - Use SZ_4K for the queue size alignment assertion in
>   xe_guc_ct_queue_proc_time_jiffies().
> - Drop an unused local variable in guc_ct_send_wait_for_retry().
> - Add missing trailing newlines in CT error/warn log messages.
> 

Typically we try to break stuff into smaller patches but I'm fine with
single patch of one line fixes in this case. I can't say no one else
complain though.

Anyways everything in this patch LGTM:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> These changes keep behavior unchanged while improving correctness checks
> and log formatting.
> 
> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_ct.c | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index 1c37813d2ccd..d0f0586121bc 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -275,7 +275,7 @@ static bool g2h_fence_needs_alloc(struct g2h_fence *g2h_fence)
>   */
>  long xe_guc_ct_queue_proc_time_jiffies(struct xe_guc_ct *ct)
>  {
> -	BUILD_BUG_ON(!IS_ALIGNED(CTB_H2G_BUFFER_SIZE, SZ_4));
> +	BUILD_BUG_ON(!IS_ALIGNED(CTB_H2G_BUFFER_SIZE, SZ_4K));
>  	return (CTB_H2G_BUFFER_SIZE / SZ_4K) * HZ;
>  }
>  
> @@ -1126,7 +1126,6 @@ static bool guc_ct_send_wait_for_retry(struct xe_guc_ct *ct, u32 len,
>  						 len + GUC_CTB_HDR_LEN);
>  		*sleep_total_ms += xe_sleep_exponential_ms(sleep_period_ms, 64);
>  	} else {
> -		struct xe_device *xe = ct_to_xe(ct);
>  		struct guc_ctb *g2h = &ct->ctbs.g2h;
>  		int ret;
>  
> @@ -1148,7 +1147,7 @@ static bool guc_ct_send_wait_for_retry(struct xe_guc_ct *ct, u32 len,
>  		ret = dequeue_one_g2h(ct);
>  		if (ret < 0) {
>  			if (ret != -ECANCELED)
> -				xe_gt_err(ct_to_gt(ct), "CTB receive failed (%pe)",
> +				xe_gt_err(ct_to_gt(ct), "CTB receive failed (%pe)\n",
>  					  ERR_PTR(ret));
>  			return false;
>  		}
> @@ -1324,7 +1323,7 @@ static int guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
>  	 */
>  	mutex_lock(&ct->lock);
>  	if (!ret) {
> -		xe_gt_err(gt, "Timed out wait for G2H, fence %u, action %04x, done %s",
> +		xe_gt_err(gt, "Timed out wait for G2H, fence %u, action %04x, done %s\n",
>  			  g2h_fence.seqno, action[0], str_yes_no(g2h_fence.done));
>  		xa_erase(&ct->fence_lookup, g2h_fence.seqno);
>  		mutex_unlock(&ct->lock);
> @@ -1834,7 +1833,7 @@ static void g2h_fast_path(struct xe_guc_ct *ct, u32 *msg, u32 len)
>  		ret = xe_guc_tlb_inval_done_handler(guc, payload, adj_len);
>  		break;
>  	default:
> -		xe_gt_warn(gt, "NOT_POSSIBLE");
> +		xe_gt_warn(gt, "NOT_POSSIBLE\n");
>  	}
>  
>  	if (ret) {
> @@ -1937,7 +1936,7 @@ static void receive_g2h(struct xe_guc_ct *ct)
>  		mutex_unlock(&ct->lock);
>  
>  		if (unlikely(ret == -EPROTO || ret == -EOPNOTSUPP)) {
> -			xe_gt_err(ct_to_gt(ct), "CT dequeue failed: %d", ret);
> +			xe_gt_err(ct_to_gt(ct), "CT dequeue failed: %d\n", ret);
>  			CT_DEAD(ct, NULL, G2H_RECV);
>  			kick_reset(ct);
>  		}
> -- 
> 2.50.1
> 
