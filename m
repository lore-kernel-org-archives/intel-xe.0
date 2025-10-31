Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC4A4CCF9F8
	for <intel-xe@archiver.kernel.org>; Fri, 31 Oct 2025 16:17:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8710C10EBEE;
	Fri, 31 Oct 2025 16:17:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="huO9sZKE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EDF310EBEE
 for <intel-xe@lists.freedesktop.org>; Fri, 31 Oct 2025 16:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761927429; x=1793463429;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ojw6pXkcC/kXx92/nF6d2TEzeaNeoI88hYdZv0nWwZA=;
 b=huO9sZKE8t85CjdmmW4MH+gXzyID6BxTUDwDEsj3E4nbDyQYA9V4nfRX
 VFIXSizEVUdwJsYud65hXvhqVSAqusC7DfRmK0iKvpXhCFR53wKWHROUO
 YnoQIrwI3zReBzjaagPyRBKXr4/M3K0dbF4kRUd6i5oTuHk+0wZapkUKt
 n+ZwL84c5TEOtkKJv5l6+TOc5XNpXHpYpBSbu/US4o8hGrR2SM0kJXeCf
 hFQV8EQHrmfk0qGuq8DqNJun2pIpMexXj69OzC3qymQ7UuWK8Y7HyFExb
 /NAp4SOkJtXS3rFTFYIoNfbavc3JcKXySEYFms82iKikZ+hU1G7zblXpV A==;
X-CSE-ConnectionGUID: x4bgtOs4Reem+SaKlMIDLA==
X-CSE-MsgGUID: EPRLwGU1TS6QFcmSCMxpmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11599"; a="64009401"
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; d="scan'208";a="64009401"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 09:17:08 -0700
X-CSE-ConnectionGUID: 6iEMH51GSKuLXN0Dgz2V2A==
X-CSE-MsgGUID: Xl0aO8fDTx+0YZ+jd4yCyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; d="scan'208";a="186208899"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 09:17:08 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 31 Oct 2025 09:17:07 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 31 Oct 2025 09:17:07 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.45) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 31 Oct 2025 09:17:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bzwinWEsOH52FFsCom1dsJryvy/rGYhI59DHsAv8K3Kg2ovTqqwdXYU2xoB9haLG341uFSA1U1wvdKpEum8CV3QZz8v0RlAFrps/ne256K7nHjmqErp9kl1S6cgMlXCQDpZE8jDqzrznxDNufjSGIsHvC/gh+sXSCzVhGiPj/kHSQV/WxH22wGzKntoZ2TPWsCJct2PBDiboNs6zMdEMzoc0WN+Jout+D+jfw9kfGODpijMwEwBSXvv3ZY2dHzJPznUf3tyiPsZAT1exJ5TvUJjGOvZ/T3B23lT57/bOlSYtdR/XN8v3uWEBiUxYRT57+wugRDPZnVgqMmw0xaStRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ScwFEARKYtFdAEmzVzuJjTtIU0Md7xfbZ2ieu7D+pi0=;
 b=anjZogV1La7aRxKbky2H2q5f6jNlHnsyOk8tiCigC3suZndi2jDnWVynBokdYs+XzC8dMipYtdbDRgNnVAkQMB1i4mQs2Sk+R3hQ6VkswC5lRZhBnfuTvwggNESJzD1V7+7h/N1Bgm9AtF6mj7QgJSgaVd4eqUdVgiJRTbF5pT5z0JA2Xdl/ZW/GPN0m5TdQjLLXj+dj95Lmkst9PO8f6k5DNWaJ/qBQ3EfMRBw6aElbMYHrd7dQgRjCVYYS2cnWBEAQVYxbBB84lQoNY6pQ0FE6L6r8X1SwV2pAyOVi1eMJGsJm4U3NAOPFOT5eeIMNtN/JZABsQIiYwqCt+f7/lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MW4PR11MB6910.namprd11.prod.outlook.com (2603:10b6:303:225::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.12; Fri, 31 Oct
 2025 16:17:05 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9275.013; Fri, 31 Oct 2025
 16:17:05 +0000
Date: Fri, 31 Oct 2025 11:17:02 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 1/2] drm/xe/gt: Synchronize GT reset with device unbind
Message-ID: <dfzjptjbgrawrl4evjyubgtqc6uag3sj7ntxkjrxp3f7ssyzsv@a5zdt4oqvhgl>
References: <20251030151122.3021436-4-balasubramani.vivekanandan@intel.com>
 <20251030151122.3021436-5-balasubramani.vivekanandan@intel.com>
 <aQTYJbU0qtl1CMYw@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <aQTYJbU0qtl1CMYw@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: SJ0PR13CA0166.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::21) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MW4PR11MB6910:EE_
X-MS-Office365-Filtering-Correlation-Id: ba860287-7fa0-4780-646a-08de1898ee77
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?W+OGpNxKsJAAQqKuA7dqyqfqONA+dzEEcZCXD6UbVjImLnaaTOYelyKcG0fA?=
 =?us-ascii?Q?BNDtatTG2xb/pQ1adPuZ28eMAiUe3PvlDo0XT23JQG+ycaV11Mr6gh/UK8Aj?=
 =?us-ascii?Q?cvAouTJntf+4cHXvuR67x6MNI7HUjNgrMUpy8EUkAipbq3cQbhB9QKNt9BJX?=
 =?us-ascii?Q?CuaE9GpOLgjiCkC1Ca9nL2blmPPjz8f5+CWivG81z87vs8rXeNatfVuOjM5y?=
 =?us-ascii?Q?k81yn1q4BkPNkgyAAu4ifxRVg71nr7Tqz+FdjqM6jB3PvVsgNgNS8Iqyd/zK?=
 =?us-ascii?Q?xgB2tVTRA+WZ9szr/f8kh3x3spOj+Xr3xEW3AFugGbMgVcQjNOk2tILyHNwU?=
 =?us-ascii?Q?yFzZaWxfWB2Hg5Z/AXdk9cyXXZwHcFDpn3iNXYD1OJQ1eL4ePbdPnXrtMaMJ?=
 =?us-ascii?Q?1L6cjvRHe5D2bPjkLTYidxHSzfX56V4ThJObhqYxPAb73vHxO+/5kOvhBYxD?=
 =?us-ascii?Q?ZhEWgpssC2IpimHH9VbqF7lk1qsb45zcRthwsoUYZKv2ag4NKPnBMmXwPx2H?=
 =?us-ascii?Q?A3F+kAeDJ8hnagO7rQmq5HL1qIF16qzHnRA/ZyzCjbOQIBvQiBYbuT1tktFY?=
 =?us-ascii?Q?in1aYWVZSWzDGFqFeOzjvOi5/isYM2r4+r+CGFO7DCvYDRxm9qFToDePdhxS?=
 =?us-ascii?Q?QG2uGkYSXPlvApXmk8RSKUYN5OQf82Fw3MlI614VU0ExDT4P28GhyPgZjuHV?=
 =?us-ascii?Q?GDlvC3zguuqPJ0BqqgAtJ57rN1XvE1esZ+Gn57o0/Imf6M6LIDww4HciU781?=
 =?us-ascii?Q?PDXsGB2t9eh/6Bcb7O6HW9WocMpKU6f5kJ/EeotVMGQ2uNdgIX7/oRiu+BgP?=
 =?us-ascii?Q?zIgZ3pma1XSFTDyIBYUmhA0Y9PQpWc3FZm3Gl/HjgeEOn8Mt73/DZICcmUiG?=
 =?us-ascii?Q?HZ+lDCcCU94qVGi6XjLipBGEbKqYEfup8gMAthzGuvcBI6lx0Bh3jsMnb39b?=
 =?us-ascii?Q?NQeyr6YRQ95Cv6OgppuoeKrh2TAPWUoVnmZiOAuy6YaiBvFOX4D5ylOBGgP/?=
 =?us-ascii?Q?Rutk/Gee8/va/u9RAoUAuv3vhh+cUCnSl0n4PwHsTVoY6vngtnBQLgpYDzip?=
 =?us-ascii?Q?pNNvjme30qmlgwBBxRZncX/qMP7duUcWJk7vm2xH6+ytLo/+UxAxL4zjqI4v?=
 =?us-ascii?Q?75HtRX8sVVdK8/lV1x4NDuRd7/kXIoo8QoJAHvjgaMV5E+pfhn7YyyLMlIfA?=
 =?us-ascii?Q?EMTbCd09EFID0+SW3j2ohICOx1J8k0PfJS/CxQ1jVknIBtc3LiKWJET28SnV?=
 =?us-ascii?Q?Giqwy/tOf6z3zDxqTiXCOtwwsLXyZFa6JAcHu0VEyeeFyMopuijoo858RSXL?=
 =?us-ascii?Q?G0K5TP03nEPk3cn3+IgfgUepVy/49CJe7jpbyiWbuniFuu+m3JpY3MW1Xrkj?=
 =?us-ascii?Q?nnTrwYHeUA3p0f4fcnSUQhP/xNcuN1iLQH6JhooxJM2KNfuhoQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Sz4C1spZDmzmnlx5pKu1AFCol43tHb4zIslZSZBXYQ7/aIepaSHj9/F88WuU?=
 =?us-ascii?Q?GhHOvKhWAxEUy1iH+vrFZxQ9aXxgihtGipXcy2iibIw1szaM+myocxxYHGo3?=
 =?us-ascii?Q?yp2dgChlHLx2AUrHhvkF4Ytlj1n6pqtcZYZk+PkjxOh/imtmMhbvGD2iixkD?=
 =?us-ascii?Q?l9UO+KWT8do1ZhKfwDn19l5+/Kg+AsseEWijrIK47hZO9WMK39rExTyoXp38?=
 =?us-ascii?Q?qH7r3Iz0We2q578YFmtLzO3NuWfMkW8yOQXwakUwe1r3RnKKIeKvSKwTLwha?=
 =?us-ascii?Q?qLo5Y1p3d2RvqT9cr5sgphvhMg1NbJ7YBAUcDLnjI8mSyT2L1mWjhcWhILmM?=
 =?us-ascii?Q?eQu1y0rNPgsSgVF8QnAbC2s0iTFoYkSFAGk9JhRymc2m49a7xi7NDnhzoy2T?=
 =?us-ascii?Q?aGoPgMgvDnm8+13Z66S2H4tCc3aBrJHpsnnKduCCey5TWlJVsO1FHk/B8vb4?=
 =?us-ascii?Q?It82LHh4wh0MSWBP+Hm/WQYn8emvwXK8tfJ+Al0p6bWHBIsvFVFhHVDni5SU?=
 =?us-ascii?Q?owFE7sM2+JBhRBJtSHWW+6uUtANIHr/RYp3c32je3kycs0MQUtHzneWnWqK1?=
 =?us-ascii?Q?/aThPzbWZH+5te1Yn0tgJsDGrvBj87LtVp3TVsDzukD/fIQL0xqFGxFB7YoZ?=
 =?us-ascii?Q?UW9YDYaFu/Y4OQVGAvjgmYcGnp/eUMqPGFla/fsk/sDMVOwf2GvTzuJK9n7d?=
 =?us-ascii?Q?Ozqf/9ZhpLsu2d8UXIZEg58ObO5k2frsVGlCaLpGhfE9VPJJItxLYMypbCPo?=
 =?us-ascii?Q?RdgwXo+/G18K+tyk1y3kPCGgPM0z7Q6XWYX2bkYvgljh9vLxYZCtNB0wrmPF?=
 =?us-ascii?Q?FKJWoKsmdtiYlBIWFHOyHWIicwYzzEKczIH1b7CebMpNyaopmT3JdxYlKzbJ?=
 =?us-ascii?Q?G9wop7rB/sGg4uXjGVNIBJHLonmeNrSdoOeYfeWPxFgZsdxmfe3dTZjZV/Pm?=
 =?us-ascii?Q?1MhNfXzHPSCu5d0xPS6OTwZ13f/kr/NLDb/accV+hbi9uYfnnKKb58w0Si4l?=
 =?us-ascii?Q?hmPOq/ZRok5Knttcg7BP6Hr6UyY4lElslUCfh97Vao7w+7H0zkMIcr+Fz50x?=
 =?us-ascii?Q?pKG+rhM2iYWAeD0khYxOObSWCosLFoN2cc/mxQ5QI/4ulJqH/uYDOdyWoJIP?=
 =?us-ascii?Q?CkTS5eIItTTF9VSWaE1jqO+UsznzqqBg8BYOnRsYCK3LAevcUVzuXG3Fzo/j?=
 =?us-ascii?Q?/DX3tY9oTY5BgDxMTF1Xg4O9iFK+XwcrnE4deiEmjoMb4gK6jM35LdtNXb8O?=
 =?us-ascii?Q?tbesWZti3PIhpTG3sahNNLq0WflzgCrYI16WzYU62Nx+ejkFzHHxKeKZZvGd?=
 =?us-ascii?Q?sdUeB4lVceL12OJoapYQ6Hxj/bEn0x/BRUeOgu6LL8PruADhPNHiIjRw3SQV?=
 =?us-ascii?Q?tfgW0HyIkEUJaVzJfD906TDflj0i92l000BPafu3i40LmLKDR0vU9C014lLm?=
 =?us-ascii?Q?+OGASOyB2tjQaDtEp/LthdYdL6gj8nYBRShE/jmbXmtfLIFq2HGGBk/qLcRO?=
 =?us-ascii?Q?8aFOVlBBT1o6NKSD0SV8tNUtYmnP+PAiHaMZg7cAD1WnbI8qHdtHLijD8CeS?=
 =?us-ascii?Q?jyGDV12mzmg7mqJZ2nGS+7eJukSXisBIISYXX561VXJdhEQorf/BZHRDIACt?=
 =?us-ascii?Q?Bw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ba860287-7fa0-4780-646a-08de1898ee77
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2025 16:17:04.9794 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tZikAglY6yRrAmCoJAQeFul6PuKdEPv8qvktnLrrsBxBij2qNi+pshgVp708/Zg2rtVZ3TH2ZXGNGdmegD8RZpXqi3ye5wB8M+D9xQuB6bo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6910
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

On Fri, Oct 31, 2025 at 08:39:17AM -0700, Matthew Brost wrote:
>On Thu, Oct 30, 2025 at 08:41:24PM +0530, Balasubramani Vivekanandan wrote:
>> When unbinding wait for any GT reset in progress to complete. Unbinding
>> will release the mmio mapping but mmio operations are performed during
>> GT reset causing Kernel panic.
>>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
>> ---
>> v2:
>>  - Use the managed resource release function to wait for GT reset during
>>    unbind (Lucas)
>> ---
>>  drivers/gpu/drm/xe/xe_gt.c | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>> index 89808b33d0a8..d0f8c40bc51e 100644
>> --- a/drivers/gpu/drm/xe/xe_gt.c
>> +++ b/drivers/gpu/drm/xe/xe_gt.c
>> @@ -607,6 +607,8 @@ static void xe_gt_fini(void *arg)
>>  	struct xe_gt *gt = arg;
>>  	int i;
>>
>> +	disable_work_sync(&gt->reset.worker);
>
>We recently made a change [1] so if GT reset worker is queued it holds a PM ref.
>
>So if disable_work_sync returns true [2], I think a PM ref needs to be dropped here.
>
>Matt
>
>[1] https://patchwork.freedesktop.org/patch/682622/?series=156292&rev=1
>[2] https://elixir.bootlin.com/linux/v6.17.6/source/kernel/workqueue.c#L4471

yep, it looks like there are 2 v2 of this series. I replied that
yesterday in the other thread:

https://lore.kernel.org/all/faewe43nslu62dt5donrrddkbzspnwicrsrm3llwp4xg4tdq7l@zxc7u6vd5ceh

Lucas De Marchi

>
>>
>>  	for (i = 0; i < XE_ENGINE_CLASS_MAX; ++i)
>>  		xe_hw_fence_irq_finish(&gt->fence_irq[i]);
>>
>> --
>> 2.43.0
>>
