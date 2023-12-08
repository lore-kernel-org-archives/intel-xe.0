Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51C5DC4167B
	for <intel-xe@archiver.kernel.org>; Fri,  8 Dec 2023 19:31:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A76110EB01;
	Fri,  8 Dec 2023 19:31:09 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E906E10EB01
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Dec 2023 19:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702063866; x=1733599866;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=HT9FhZQRhOpyYjBRICUDyVRjJUGF4vDOV/TPxU+kYic=;
 b=BXhSDbUYPdloXsFoE33Ww+xRTzM3v2wHSjC258suhx2KspQ/4jLc9Edi
 uwrqcILrEhFXR4pFzqnwm5xcw1hEAOvdYBshqk3Y3ECQzK+TG5KoY86wx
 0bKBkbBvwm7a/k0l3TAgpOsJDCPR2We5pLQxXUMjRv7L0DVR1wE6jD5gH
 AObRL8MdEY5EYNO46jObCdqGtHo4x8qvEWlnqvMSkmf5hdSsJw77ObeGX
 XersA8ZYqmRz47ZcMaUpilBBJIxXSy1PnwuShmahE9oxm6jMUePgZIpY/
 RSvtMN7G6gE6Di6q8cPRCIPEbuds/H/37G1qxjCqu8XHDrTLoGpXBGm+v Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="480646131"
X-IronPort-AV: E=Sophos;i="6.04,261,1695711600"; d="scan'208";a="480646131"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2023 11:31:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="772239337"
X-IronPort-AV: E=Sophos;i="6.04,261,1695711600"; d="scan'208";a="772239337"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Dec 2023 11:31:06 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 8 Dec 2023 11:31:05 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 8 Dec 2023 11:31:05 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 8 Dec 2023 11:31:05 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 8 Dec 2023 11:31:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FNj3iZuEVJR+qowEf1cIup9f4tDFSU1yRLwdNcMg2uly60oEbHY6qjMFZcASlszZnGnP7Xb2DklC7ks5SKm4n0OJ2JTIgvsyplykpoxj3pph3ms5tQj4arsXN+xPR62Q/9Shh75aJq9zIz5no9cZRZhElZ6W59b+EJtrsMjcUC0BF9TKmJROQ7geJkxFKC6VZAbS+j5KaBlTbmvMLdUO71lrc1noIhV7kOpQODfreldYkee1dWMs0q88raqNhQiuxQHf58lpa9+xeESYGbHyi5DgcEdziYo3YFmm5wD4vhOicLWV97VFimmb+leDhNKrmMulMWdxMv/qYcrxkl4LIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R2VqEHKx2hjE3sKjS1ZvP1lvKx9onCBXN5vq68JSX7A=;
 b=GhHDq9WpfiZRHv2h9FljzKzGHcWh2Xt1vvTE99F/zO3U5jyCoCD6zBPYlEt4sKrrLJyYD4H8oSlyhtUESzedc8ciz3j/VRCkObfIpwGKYYz1NQeaMouM2lbakqRtIaBvr5dGDmOh4GuaztP3365CBz0GdjuPX4wQP7ysaPyOqUNKyZyDVXvXQk/u1Zt7sr1WIEjEkbDu+nFEkDn5x5BWAR6yWjVfLiecVsEg0fx2Dv/sZG7+tZFG19BkoiHv2WzhcL33dbKWtWGoYXMmuC2aevYryIpazlfz099dAdfqj7I8BmYyKKztIv3u+q/KcucFUZlE2ZCGCedBjMaJVpejlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ0PR11MB5896.namprd11.prod.outlook.com (2603:10b6:a03:42c::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.27; Fri, 8 Dec
 2023 19:31:02 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda%4]) with mapi id 15.20.7068.028; Fri, 8 Dec 2023
 19:31:02 +0000
Date: Fri, 8 Dec 2023 12:30:03 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v2 1/2] drm/xe: Restrict huge PTEs to 1GiB
Message-ID: <ZXMMS7ozbgNwV+Iq@DUT025-TGLU.fm.intel.com>
References: <20231208112918.15411-1-thomas.hellstrom@linux.intel.com>
 <20231208112918.15411-2-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231208112918.15411-2-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: SJ0PR03CA0065.namprd03.prod.outlook.com
 (2603:10b6:a03:331::10) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ0PR11MB5896:EE_
X-MS-Office365-Filtering-Correlation-Id: 64886543-21e3-4fbe-7b56-08dbf824369e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FVHmurKTJjCE8l8IQDqsDV/B5rsGxyAf/A9SXS19BCfDe4B5aOAOwtSkShHF0Lvbbvh7G5I1SqmHj6SVzGQM84/cGUT/H72kZvcgAYoEU9UzR+c45rEI2o+EnWgZM6wdFHaymHQcMQ6kuhq9npDqfogF8J60jePRe6uERbGpZRx2+pmbeKvY4XPBzy68/JeJld55wgQ+fy6Ketv0gYX1ziSzEagZVeX98I+ZnOXRc0n9Efhw6A9d8iOUgSP6PkPAH0Q43I18fLyUIxpRxCfk1EH0qj0JvUmukc6/07DJ6kJX9NefJu0zjtlk/QJQMmKhjEpoENyMUHzaOZR5tK9U0bfEktS0Fn0TOpNm6DbAKen451MdwMaXXXNcOOKraUSyJGzFTmyFtuO/+QCfIu4Bzxx+FRvJPKKGKbdBorOxmskrX0Qw6pF2NqS3wB55ik3R7/DtWEKpWGYbrfqW4S3DiFulto9Z+d8re7r3qlAdXW3S0EGX74m/fEBe8mus3Bzd4LHA7KyW6dRoaxWrqEiA+DX4HpYHZOTFn6jiYPuKTCr5RYytsLMmVCdc9SGmM9A1KNMsETguhJaXMWayw5rlOh5b2HU+qCfKIG3z4gL94PaGN5bnRccKGgdAfG7JVwT1
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(396003)(376002)(136003)(346002)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(66556008)(8676002)(4326008)(66946007)(6916009)(66476007)(316002)(8936002)(6486002)(478600001)(5660300002)(41300700001)(2906002)(44832011)(86362001)(83380400001)(38100700002)(6512007)(6506007)(82960400001)(66574015)(26005)(14583001)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?/Vz6ySpyU7A683SRgExVs3/qwTwKHgV0/qTHpbjS1OoEl3Of1IJM5TcqsS?=
 =?iso-8859-1?Q?qhllGJNLvORkRAQxgrZhg2DsrCUP6min6v5JvqVWqNJP/E8eP7NDmTWiIz?=
 =?iso-8859-1?Q?9Z/t0OvcYEHtNu+MwqiVnYzDF2Qrc0CwdR5wRs6cnm+HTxKBnT5QZWvmlt?=
 =?iso-8859-1?Q?WlHhBoGC9hOsGTIxGF8DrVL9VeqScgWR2nvKp+0ViISOCf6F+7HM/lPKX+?=
 =?iso-8859-1?Q?Vi+Fs2nF9tnqREnJNw89MPEfXgRydc0DYTNIodMGu9LLrBz0lPP6AL3KdD?=
 =?iso-8859-1?Q?iwv3jYqtx1tNrUYcDCINTcmchkHOlbfH0dtE6oewp9j8S2M6dPs3fpLa2p?=
 =?iso-8859-1?Q?IJaBxgu9CGt0ozFxPAjHGoTUGUDnUEwybRXmSN9P4DMTjxPGIS57RZQWfb?=
 =?iso-8859-1?Q?d/CDQx4TTdDhR+sYNNLTYVfB0g0d8V5nld0IyG9ye30IjkENxqbSPgi+M2?=
 =?iso-8859-1?Q?T4Vj3k1FLJqsI3tayo60XkRIdWXO6QpPvck41xkScjV/8wJLOLUAclZU9u?=
 =?iso-8859-1?Q?6I6cqPNYrDuRZFrHi2TTM0DnDNCABv44NmsjuARl/ylpnSM3DpIk+FG00K?=
 =?iso-8859-1?Q?h7aFkSgf1560sV4CwZh3eFIQ6iwBOK3GX4xpRAZq8eloZOWa1EIObJtYeI?=
 =?iso-8859-1?Q?hQN20FQHGOtHNZg51p0Q5hgTRYN80ljvexo228iaW8MX/dFMubD65jAldi?=
 =?iso-8859-1?Q?+jew5ihxFkgMR+yEeox0dXuiog7KKmzTwuzVBuY4Ie9988J5aEBt9udoEP?=
 =?iso-8859-1?Q?ioRuM3tlzbeloDsYtSPGwrrTlIUZNczN95ZtPKqatiHHmwn3NIMCWbhcGi?=
 =?iso-8859-1?Q?0k+5wrl8Sk6tb3HE2pHG7VgpexjHPjtCbCaSIMyE/KceXCF9knTOiA+XcS?=
 =?iso-8859-1?Q?Nyb3bovY9DioO4M6Hfzk/FhlhFGk8fDUqR1RR4Qq+mAXnnUREksrP8ju3c?=
 =?iso-8859-1?Q?8CExip7WOqeho2MFCG3aYLzqOBbhXn7m24gxPchLUGODw6WYQ3782Rrn4V?=
 =?iso-8859-1?Q?fPWHMiW1oRz5pRAgzfYFv9NP0i4VJkqVeDirJBNGM3uBYmTtfssokHmOE7?=
 =?iso-8859-1?Q?cRuL0G6Z1oGbsJS8XphUYar5qROWu57ieOOzZbEZZQrpErwJJslXmuEAj8?=
 =?iso-8859-1?Q?QGF/TuKJX6WF6uQBGpajRGD/ITLQj9dqJqEMic5Qxqesabp8ErQYPGez+P?=
 =?iso-8859-1?Q?++8rbF3wWWmyBH7mVjTTnAqjkb+0h8Xxh+K+s5JRqOiq6ISGfR/OHq1n1D?=
 =?iso-8859-1?Q?WEC9k1a8a1rqjra0EF8M7G2od1zkaiewiVROFtp+XkLjQJ3MIF1aDIRvzl?=
 =?iso-8859-1?Q?9+AjipJTUDOfJtcbpUjUzxHqvdftjkYCiFLP20LqxfcB3Bz+zqPoei/9m7?=
 =?iso-8859-1?Q?eBvnAiGzp6k9VpjQvd1CDLs8abViA/TcLrQhDm0M3UkJDqwGdUOySrRHKD?=
 =?iso-8859-1?Q?OW9ot2ooTWmdXR9dJXv8v0QbmqkADzm+avd08scfb8/NxUdfYTUfdWLlFI?=
 =?iso-8859-1?Q?mPpsnia2RGHMJEXdqiwn1qCjM8jFsxHXvi99GQyc8d1AXm+LM/aUS+I72B?=
 =?iso-8859-1?Q?Y+ozU5qp4KMDO9yydInYrLQ0pJfvvlfudLS3cl3Md7GP+kI68zuGb/g2Kf?=
 =?iso-8859-1?Q?RxlNIpF4MqHg0g0UhxSYhJfdhg4MYFriv1XsZsJUHbUKkMGhmLWOGw3Q?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 64886543-21e3-4fbe-7b56-08dbf824369e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2023 19:31:02.4442 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HH9UTbhNAyqdrXSnmZNprbWdtqSyyo+jVFQsGYHsGitFAP5J0c3y56g4CyPdr5mORomMK/K1MWIX4rAOttsJxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5896
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Dec 08, 2023 at 12:29:17PM +0100, Thomas Hellström wrote:
> Add a define for the highest level for which we can encode a huge PTE,
> and use it for page-table building. Also update an assert that checks that
> we don't try to encode for larger sizes.
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pt.c | 3 +++
>  drivers/gpu/drm/xe/xe_pt.h | 3 +++
>  drivers/gpu/drm/xe/xe_vm.c | 2 +-
>  3 files changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index 35bd7940a571..699a255d75f5 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -430,6 +430,9 @@ static bool xe_pt_hugepte_possible(u64 addr, u64 next, unsigned int level,
>  {
>  	u64 size, dma;
>  
> +	if (level > MAX_HUGEPTE_LEVEL)
> +		return false;
> +
>  	/* Does the virtual range requested cover a huge pte? */
>  	if (!xe_pt_covers(addr, next, level, &xe_walk->base))
>  		return false;
> diff --git a/drivers/gpu/drm/xe/xe_pt.h b/drivers/gpu/drm/xe/xe_pt.h
> index d5460e58dbbf..ba2f3325c84d 100644
> --- a/drivers/gpu/drm/xe/xe_pt.h
> +++ b/drivers/gpu/drm/xe/xe_pt.h
> @@ -18,6 +18,9 @@ struct xe_tile;
>  struct xe_vm;
>  struct xe_vma;
>  
> +/* Largest huge pte is currently 1GiB. May become device dependent. */
> +#define MAX_HUGEPTE_LEVEL 2
> +

I thought devices with 57 bits of address space support 512GiB pages?

Anyways the patch does LGTM and comment seems to address that is can
change.

With that:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

>  #define xe_pt_write(xe, map, idx, data) \
>  	xe_map_wr(xe, map, (idx) * sizeof(u64), u64, data)
>  
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index e09050f16f07..f585cc7df071 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -1239,7 +1239,7 @@ static u64 pte_encode_pat_index(struct xe_device *xe, u16 pat_index,
>  
>  static u64 pte_encode_ps(u32 pt_level)
>  {
> -	XE_WARN_ON(pt_level > 2);
> +	XE_WARN_ON(pt_level > MAX_HUGEPTE_LEVEL);
>  
>  	if (pt_level == 1)
>  		return XE_PDE_PS_2M;
> -- 
> 2.42.0
> 
