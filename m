Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F16C2CEB2C2
	for <intel-xe@archiver.kernel.org>; Mon, 30 Sep 2024 21:26:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADB5510E134;
	Mon, 30 Sep 2024 21:26:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ctUbQHfp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 875D010E134
 for <intel-xe@lists.freedesktop.org>; Mon, 30 Sep 2024 21:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727731599; x=1759267599;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=kLzJ6oavFeECudD2ra3fGoAsWRouNC9sCXwXW7i44/k=;
 b=ctUbQHfpCZRotvzFde/xSrQa/eh+u0mZfzGG2KOeZ4o5toRsv8FfwuMK
 lECEBvxziXiJpe+5dZQnDkrBg7CYR4JVib6NPNlSLJxhTIO4Sa9LWCpd7
 xkmeK42NKbTIz3OuAad1oLpu6KoEx+KHzhp489XOIAGQjyG0s4QT5JlNG
 Sv5fYEozelTfDny3sDmKalTXvX4NzwqnQA06SUtiLPKLovcJMMq1cX5DP
 a1MeBvtf/uF9Goy40edz6SahktZzou+iw7pQSWWBYo/D370MvlTjyz0TN
 PajgXUVBrV6H8H0AVAv92pL43CLxc/E/1jZcZeSuIIUT1kTitjsclFTcv Q==;
X-CSE-ConnectionGUID: N8Eh2Y0HSfeStbQreWB+4Q==
X-CSE-MsgGUID: BUWg+rgRR5KLI7PP8RKV1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="26969644"
X-IronPort-AV: E=Sophos;i="6.11,166,1725346800"; d="scan'208";a="26969644"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 14:26:39 -0700
X-CSE-ConnectionGUID: puQqQEqdS5e6vT0EKWvvEA==
X-CSE-MsgGUID: /WdTWnNsQE+yDzfKOdRNjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,166,1725346800"; d="scan'208";a="78404777"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Sep 2024 14:26:36 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 30 Sep 2024 14:26:35 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 30 Sep 2024 14:26:34 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 30 Sep 2024 14:26:34 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.176)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 30 Sep 2024 14:26:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d/SM0jviN4U5dOXgqTH/HoRK8QN6dQCW5WFWwjTmybE0jIC/9WXe5EwmettdqL8nZgmbjuy3jFjTJfBmgaBq0iIyFzAGKyNFg+5fhvvxmoh+E6Q+zUIcb8nmg76hwuP4sCjpjFiQwFh2Whg0svUA4oUBUOMAaG70XtDSETt+NUoFI1NDYO8QQ38obj7z3dnPyxT/qpztcUdA0+QpjgMOuVrFfpp5+leblnL9Tjskc2ZG+Dz9UKKDhAkecxEmhPZ8c8dIfWtCxqjsqZLDlpeQ2LLOPOg4NyQiO2PHI4EawxwarlQSPDDl5Sj8nMFVniZEZ2i9cnpFbYXpSXVEkuMjcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P2L8KSvh1i8neSyYuupheAbcLUMpir96zL8COAzz1XI=;
 b=mbVsFDoZje3m0mbPGPn+seD3sjRSkC2i8lkdFamzhDB910JCEZe0dTsDet44SvLo6L0qpMQ5OP5WwPe2kIfhU/bFBoNaE16ANN8XKh2hNhThw+7ySgM+4iM72ymh9MQh1Ue1jzt6s1UPL3urzgpzg9MIPixNDf/x6bh/3lPEty5QWYsN8xDyN4cl41G/d8z64zwlgyVUNj27rAguAo16CNfnDvlNzb9QudA2nwrOTe4jOEoKnZgTgBUnJlPJT2c4EBg+CAXR9pp1qgYf7nO/yr3orckxC+Z71/MNNkmpSRaUgQC1K1D6asiX3g3WDvrVADk38aH9ZaWkU4P/+5u2Ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH8PR11MB6928.namprd11.prod.outlook.com (2603:10b6:510:224::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.26; Mon, 30 Sep
 2024 21:26:32 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.8005.024; Mon, 30 Sep 2024
 21:26:31 +0000
Date: Mon, 30 Sep 2024 14:26:29 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: <apoorva.singh@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH] drm/xe: Check return values of functions in
 xe_gt_shutdown()
Message-ID: <20240930212629.GB4891@mdroper-desk1.amr.corp.intel.com>
References: <20240926110026.407383-1-apoorva.singh@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240926110026.407383-1-apoorva.singh@intel.com>
X-ClientProxiedBy: SJ0P220CA0011.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::31) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH8PR11MB6928:EE_
X-MS-Office365-Filtering-Correlation-Id: 97968a1c-a052-4733-0ad4-08dce1968d99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Hjfi8+eoEZzR/PwNZHZ7Blfts8Jd3mEtWvXRJFtOFkYyFnfKRmYg2M722Gjw?=
 =?us-ascii?Q?1Xpvc7WB9KPMluzhV8Vl67rqP//EYdQYg2AsIqNpjMUEFCPM3fYGtCVKSO4N?=
 =?us-ascii?Q?xuNx8Fi4YbQm2zSBEztZAJ9YqOBGh0G9kqrA2YkictKEoIw6r9vaU9JFN0i3?=
 =?us-ascii?Q?7J0jq0Cw6L4i69v6K7DfCRd5OQwjv5EhgZnR3GCNv2FoTykZ8sZLY5leKxjt?=
 =?us-ascii?Q?R3xEB2EzQHOLzgv298BmqCIw/msSpNQMMJAEgMthv4uD0avbGv46V7cVImeY?=
 =?us-ascii?Q?yimQ2qH+urkhQkMlW5dWjh/TO0x026454u/4bRURDgynsFgWNS2x+lk4rWWT?=
 =?us-ascii?Q?HiskQrXlzttIo6i2UBmKl6J9hGITaf2HVM341odzLrN8jLlSOMdgR4VBqzVi?=
 =?us-ascii?Q?BCSS2utJ2W5GPPuvGZt3lzv4cv6N99sXb/xkvyTPetvy7YzqI1PFzoSXIVmk?=
 =?us-ascii?Q?HS8oU6ZbaAxBWPKJjUvEBmsl7ORlCy3RcYqk2/yvU+jq4MA5vA9bWh8MuhTK?=
 =?us-ascii?Q?hPLQ03g/C+QWBbMbG+ZV7AOkdfAO+J6pIdWxnZPcbNGJ8hmTU19wTCPZUX7A?=
 =?us-ascii?Q?8Furb48x3lbAatUlm3xVZcGDuuHr34LU0Sf2Hu/D4xyqppMcjqHqOJkOuaoO?=
 =?us-ascii?Q?LHngMRe6rKMnCXfBHN7JY/c++Xb6d+MVneIOZbrhf7JQSlITPPay1gMqEgn8?=
 =?us-ascii?Q?Xn4G/qtdO1StNCPKQ/c9fFN/2C9DY9cDoO1TGb9REXqBgMLmqQntueVfk/10?=
 =?us-ascii?Q?eW3iojDobpv0qI6LsrmStP9g/X9GTuTcTrLwUhpCWnd4nKfRPEzxG0ZlY+OW?=
 =?us-ascii?Q?Q4c8IOq/oIZippHFnM13Hg/idcwy2EBFMc/4tWnEOSzObcifC6cTgC5e07jK?=
 =?us-ascii?Q?XUIg5aRjwEUAC3ADVrNaRRIi4if2DF4yq8zjBMagRXgcSQeEBxkhzT87UxYh?=
 =?us-ascii?Q?+kwIClEGZYMMm0ce2ofMCwG0XzmW9DbulfVBxAZbf286fzPXa0S3k0928bLv?=
 =?us-ascii?Q?15uKyZx/Z5n81q1k57HkIAbN3OH/drI3zubuWIiwRE96xkitQrpO1vxZLowv?=
 =?us-ascii?Q?TJ1NK4h56StGEB4a/JCIQIHwCFewX1/g+bnJuLmfV2xv/tCHyqSDIuLS7aQo?=
 =?us-ascii?Q?fkTcK4bmQyPXIIQ8CHlh8pizhqXhHOzqLxWP6AMh+X5PSPaPhFY6PtVogL9e?=
 =?us-ascii?Q?MOG2yvThoIHfOItWm2U6gZU98hU0k6O1TeE5RqYbWY2yw6YJ/zlZZsbi+oqa?=
 =?us-ascii?Q?RnnamZ2dEp+mtmGtSf54rKlRCBFpbprLJkwXCnxUlb1Gvjde+obPG32KyxE0?=
 =?us-ascii?Q?2vB3xXTr2fDoqt6Dds9ebo1OPKS8iks0rlDUgXjuvJUyVQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JqZzLXlng/S8+x/TClgKbo44emy9OsCLDo7QscIi8sCr/rSlYzMdRIiQhgia?=
 =?us-ascii?Q?rvWsrK4uuIlEIlRrFBHO6W/5nNowlCiWhCghXDEel7zNV7Cm35g1fULWCElS?=
 =?us-ascii?Q?slg/Qmgz0++arkEM7/S1McUFbiGwoV6lcPQHDbIwyPxy5MUluQpABi6kFvve?=
 =?us-ascii?Q?Ezn6DZBLN5EelsudX/nwk/VP5LaR1mtyA+QzURe9+snQwljjzlPz1zpoHREH?=
 =?us-ascii?Q?wQ8Rq4jCURb+5FW+9lj9dYpzlMxt1TwVtHQ9vMOFvgxBITfTDaJACyfHTjU3?=
 =?us-ascii?Q?I6tJBdGDIcOV4QSSaB5G/KqIs1jQ3b2CwIsUh7xXOxrBlxSdOZFCqkVfWs6P?=
 =?us-ascii?Q?qJbUAOERlLnsX6zrK8aGb3WOQWI7q9KDxg2vhyvUFrOe3095CEN1jKv9//g8?=
 =?us-ascii?Q?kZ+cA5Pq7Rz52HxIid1eCKFXuLyWit+L7wfZESqgMxXkaGIabznMJiXwFiA+?=
 =?us-ascii?Q?jE5xnD5syuBvFVANZ7EjE8Vf2vOJFI99R+6Peo5HErqTFpnmTiPwvRyhSNW5?=
 =?us-ascii?Q?kPudnMvzUZUV3KQma4QwhGuoIzv6UlVX6ZtLYSyyAcnPwEnsSaCTLqMeb1PA?=
 =?us-ascii?Q?vkb9lSYXTPQO+vyqWWEfns3Df7rcgRZztNo+WW3FVJ30FWTid9auHzz2sgFp?=
 =?us-ascii?Q?ffK1EWLJRcgb2mz4WI1bmQ2E4igBra0C4XgJLRtqUxHybT/j8iuLfQOMsgW+?=
 =?us-ascii?Q?ppeg3ejqy6pKjGJ5CKizPjfvMcL/6zgOE9MmpO4QXtBiYXwT+FwFiZhmHefL?=
 =?us-ascii?Q?PoSS2/q4+ufZy9C+IWyNnuVWYf1OrqdWF6l5+KEJxhKBO+f4LaEmbGGxNbq4?=
 =?us-ascii?Q?tlHqCQL2lcIJbE2S1C0MdHBfQvXx1fbvlRm8Sp0aVdhgxhLOgKifm9l8yTjU?=
 =?us-ascii?Q?TOs6hKq62t9lGfdkFx9qwUU2iodP88V7rN6dnbRafo+usIfRfWTYdmXnGA5B?=
 =?us-ascii?Q?6xaCn/2mxPQ1VyM7Oyi5DvtELTVb1cTToz5yeD383X1GFYTn0Y55dPgg1NAW?=
 =?us-ascii?Q?1gptkw76ojJBepBnsfmi84xdhxRrymfI/2hF9VQIGrt1TriQpG0Ila51Uemc?=
 =?us-ascii?Q?q1ziJ2Wk2KJdW3h3EobhBXnEYOXEz2XP4c5Hsxoeuoohr7G0ebdj42FPX9bR?=
 =?us-ascii?Q?xqGeleOVRy3/xfDvtXv0KuJgD1B8A9Rib+u4qwRryiC45K9e9nbEL1am/PKl?=
 =?us-ascii?Q?Ykjb3wLGKm3shwfKfZWg+P3bs1JPMd2vkfLg34HTW3YDAWo1lfA7W/2VezkG?=
 =?us-ascii?Q?/8bcO9Xd+LO12TZ+WjpmEmJNKxrYEtuv++Zmt9ehtfEJHT3LrWPpaJzS5dQl?=
 =?us-ascii?Q?3Rzy4HmJe7MdqzoZPSxlxO7eScgHV941vmBgBigt/w5ZVOeOACaOI1MfpIv0?=
 =?us-ascii?Q?aqD+e0Dj2I+Cc22iEmpQob8/xQ+dypeOVaajzm0Tu7P62HkCoCN0+aMHu6Vl?=
 =?us-ascii?Q?1FryeN3GrwE2e25wF2ynzOVJzh2v3uwTJQOxMJVaXyEnvB00g8sA3ygoQK+5?=
 =?us-ascii?Q?lEYjnkJLVw32yqsQG97PUcU1U1o0Cpf9XhkbCPX2mnWSIkoZ9zCVz/ULpfy+?=
 =?us-ascii?Q?RrdKrBKz8jYq6/RBzKIyw7vERpnI/DTiHWHqvTHw52QhcTszJUHwMLU7/GGg?=
 =?us-ascii?Q?MA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 97968a1c-a052-4733-0ad4-08dce1968d99
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2024 21:26:31.8256 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sT3KwJJuXTuiw8ZWlsra7Xvip8UdgnS2gDvqNuTxEi8HBwAT/DS6hT9erMMJxW7v4M9mjRxky5bo+owOK4QpYaYs92Pwqtk7eDWTuXrfKpw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6928
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

On Thu, Sep 26, 2024 at 04:30:26PM +0530, apoorva.singh@intel.com wrote:
> From: Apoorva Singh <apoorva.singh@intel.com>
> 
> Check the return values of the functions xe_force_wake_get()
> and xe_force_wake_put() to prevent mistakenly treating them as
> void returns.

But the patch below isn't actually checking them in any meaningful way.
It's just printing a (redundant) message in dmesg and then blindly
moving forward without actually acting upon the failure in a sensible
way.  We already printed a message in __domain_wait() (at notice level;
you could potentially boost the severity of those messages if you want).

If we truly failed to grab forcewake for the GT domain, then our attempt
to trigger a reset via the GDRST register is also going to fail.  If
we're going to check the return value here, then the expectation is that
we'd actually take a meaningful action (e.g., wedging the GT since in
this case we appear to have lost our ability to talk to the hardware).
Some heavier action like a user-initiated FLR is probably going to be
necessary to get things working again, and just adding a xe_gt_WARN
doesn't really do anything meaningful.

Just adding extra WARN messages doesn't seem to help anything here.


Matt

> 
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Signed-off-by: Apoorva Singh <apoorva.singh@intel.com>
> Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 274737417b0f..317640554310 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -890,9 +890,12 @@ int xe_gt_suspend(struct xe_gt *gt)
>  
>  void xe_gt_shutdown(struct xe_gt *gt)
>  {
> -	xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> +	int err;
> +	err = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> +	xe_gt_WARN(gt, err, "Acknowledgment for domain awake timedout");
>  	do_gt_reset(gt);
> -	xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> +	err = xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> +	xe_gt_WARN(gt, err, "Acknowledgment for domain sleep timedout");
>  }
>  
>  /**
> -- 
> 2.34.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
