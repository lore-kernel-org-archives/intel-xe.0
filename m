Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97FD2E6BF39
	for <intel-xe@archiver.kernel.org>; Fri, 30 Jan 2026 21:08:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46EB310E106;
	Fri, 30 Jan 2026 21:08:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VLxJelzi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B38F10E106
 for <intel-xe@lists.freedesktop.org>; Fri, 30 Jan 2026 21:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769807337; x=1801343337;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=fA8XwFTx6oEf28zZtCIgm5WTURQhzJUuukWtWJLekzQ=;
 b=VLxJelzizN60vta+O3pqtNfcMZH5hO0OOxWaMA18QODZe4NqNENBAqMi
 QylS3VSNeqEUHx/NHedVmpGtCDnwrhYjcUGXUbKm8OCgWAclZQob54/KS
 qiFi4UsJv+0zRikYVAdSe6V997XT7cUDnraFKZNS/BjGrdbVSlkYGIVQu
 2br4ZB3B3wDqvvmqtmJrAcOZ5o3p7CJRPoD+p4kP/91m2nonjO1oxpIIf
 Km0MchkRc4sxdtVeXELXtf+MhWGrH1IJixDjhFz5M8NWYqAq+bvZPF5m8
 /kbtxFYv2KPrAsxjE9j2T1O1M909TeQNpbOLB6QveTblepDxx4gaJDctZ A==;
X-CSE-ConnectionGUID: ya6j3L8FSuyYkImMib14OQ==
X-CSE-MsgGUID: dJ+gpI5qSwmc0K8WQaBuvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11687"; a="70973097"
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; d="scan'208";a="70973097"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 13:08:56 -0800
X-CSE-ConnectionGUID: HOfySvg4Tp2v8dhCas6A3g==
X-CSE-MsgGUID: DxV1holeTGuowo43+43pkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; d="scan'208";a="209054448"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 13:08:57 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 30 Jan 2026 13:08:56 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Fri, 30 Jan 2026 13:08:56 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.4) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 30 Jan 2026 13:08:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vHLOv0MAUR+nhEwhrDO35O0pEw8KhseZbvBs7NP/Xo/7CMqtWIc08Ra8gmr9SnyoOtzu5BdXBFlejbK7/WBNCIkbA7VnCiRVrF9ZWxQe8NQIeWqNo/RqIN41ZylpxY2nGRRNcQSvMILHtPrOOvuIt4K8r3ltakrMkuT6742b0/g3e6CktDgbteIYtw1lhZbIdAgSQBZzgl8VbLaVJHVMQA7OFN/WFmSuyun0Bq5z/L8svIapmNKWizfa/i7bRip9r6wIYFw8F38pB1jC0KRbirKt055DQ+c31i/zgjF2Cb7uOrPSvgSl6cXZ69wD2ieoGzh/hnmowIaErk0xGMbXMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ao/1c4qlEy5bzasa6/XO0qLOzc68REsN6N4uAwpQoNE=;
 b=i565XOJewKvpefMGecQZBMMG1sGvCoqV1st++DnEMeKuQUKpUu8DfCTre0t8kX9gximDLsSGAMC1vRmDin3BRp7W2OWLr5O7Q2kLzCKkV6YkOAUZI7MeQP4/avNRLyQmAKk0WUfh79JbfGX11DVbFivZxAIW6ezj6OBBwaK1C24ZZu1EvIQ9j181vH+OVJFGYFR8/cT7JzW+LCTaEELUFsZZwPtK0jHDY28sO6m8sYMj3QrqKvoiMqvFe4oiqjF1eKL13fIcbryu9DOHiokGyr0EPnoTXZZptq2fbZqqVJebsDGiYnQECKYCAkLZzvP1E7u6mbgnOhGju2RKDWPubg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by DM4PR11MB7352.namprd11.prod.outlook.com (2603:10b6:8:103::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Fri, 30 Jan
 2026 21:08:54 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d%5]) with mapi id 15.20.9564.010; Fri, 30 Jan 2026
 21:08:54 +0000
Date: Fri, 30 Jan 2026 16:08:51 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Lin, Shuicheng" <shuicheng.lin@intel.com>
CC: "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/pf: Fix typo in function kernel-doc
Message-ID: <aX0d4-Krwwit9kWj@intel.com>
References: <20251217150702.2669-1-michal.wajdeczko@intel.com>
 <aULnG7jGU0RwR0Hp@intel.com>
 <DM4PR11MB5456623FF9658D6D85BAC5DBEA9EA@DM4PR11MB5456.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <DM4PR11MB5456623FF9658D6D85BAC5DBEA9EA@DM4PR11MB5456.namprd11.prod.outlook.com>
X-ClientProxiedBy: BY5PR03CA0027.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::37) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|DM4PR11MB7352:EE_
X-MS-Office365-Filtering-Correlation-Id: e1f6eed2-6c86-4d83-48af-08de6043c644
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Fpu9jyJ49p9pv7OJYkiQ+6efU0i5jl06YHYr1ev7feinawKp4ye4CoAb0lSE?=
 =?us-ascii?Q?djWh2EDYu3zLhvacEaJM4EgFUgA0hkb9AJ1O7vVAZ3R809SMTPYt7zS85rSV?=
 =?us-ascii?Q?UM2nGBDWk3ShJIniJqN3RNbF/dtbhTXtkfdABpqsNw6cbR21SKhvre0Y6Awa?=
 =?us-ascii?Q?c9rGxCpeEcJOZlx5rYvM9l1ixWVENC/uYb75ogr0YTHtsQ7LLiGFw9WD+VuV?=
 =?us-ascii?Q?uqfw0t+ZCm/1XWh8WVjNvAYOzQ168LTNodynzl/Jy1ykUy9NOMiJbnrcbSs6?=
 =?us-ascii?Q?cqj3WnZnQ1UOaIkKqtvuoIrD5Htcl68ct+vm6IpNJot9GVXbmnnbnS8u6prM?=
 =?us-ascii?Q?ZKG0S2dtE03wnRl+aeX2Gu+gXWcVj6qTCkJfLMR2FRDCPHSjwqKm2xlaVQGe?=
 =?us-ascii?Q?1s+FKBaRirZRQKBfQUJxKzDU/TtEH/tbm/SSZtv2iFqNZzlswOl60ZnoMMRb?=
 =?us-ascii?Q?4EyPvVpMP4l2HziHxWYDD3L9O/FT3qDGiWphUsO7wO1pJNUVvtekGLsA0vou?=
 =?us-ascii?Q?wtqKfGX5zlFvDV2x1rbCoXMOkeWTdvAelnbJbdqhKtCJHuh7/VSXyw2xexjC?=
 =?us-ascii?Q?MhPR+/seRccYm4RIjTuGKoSjNVTR/J4mXqKXCics29sob6xg9URn21SuuJpC?=
 =?us-ascii?Q?LMbiOx384t6UpRygzuKX02lrXcUnKrQRZsmkiaE/ReHNv1uR7qUGkYbLbJQW?=
 =?us-ascii?Q?fEu6oK2QTQVR6hsrrBTrGFIhCbhkTAOkUouLcZx2HWeWOZNFMi51PcLzGWCU?=
 =?us-ascii?Q?o11GHwz3FFOCRxVky5p5s/gQ9CbK5IjHndQ94gCg6NT7+KlUpf+0yOCMBNxk?=
 =?us-ascii?Q?ajcazmjMOOKLltH5CuQfY3R7DNkKa49c+4vLF9fub93s914OTNomjyGbexbT?=
 =?us-ascii?Q?ajEF2cx4cO6IeHy0jV7sd1VRvrjGxBxZFDPE7Dm8NAtZZA3dPi0ldsYzxnpE?=
 =?us-ascii?Q?YmdOAK2+AEB9uBBm4jd3EfGxqydH7PW8HPZwiQ15ZDNql63AZV5tTNVcl44z?=
 =?us-ascii?Q?Wfx5ceW/deZFVkFv0rTDcvFoksCMpk+N2x3UNdS+WDgPTl28wJFupM9OJU7F?=
 =?us-ascii?Q?ZOmJJQNrjseuIu/2+UY4kvjQx4aZixhdWYAq5psW80QPhmDC+rDd2Mg+8amP?=
 =?us-ascii?Q?duB/0J9bunJEfaIqM8I6RmWyTHAMEuRoaBujnQizy21WoMRBhhCJHRZjr+EM?=
 =?us-ascii?Q?2J11IXY9rchZW0EphYfKY/0ef/KzKuZk2bPqLNJn8XrCzig2TkP72eB9zkAR?=
 =?us-ascii?Q?OD+19g+GFViLJyFSX/MQHNHp498V1K+Ll2Vwg54ehrrg+aofIxqrGf0IoNhQ?=
 =?us-ascii?Q?DSnr4dlqem2snGzbNa7M5J/af7Ie6zT1Rxff3qmJeYKxuNzrQ1d9gARuOsm9?=
 =?us-ascii?Q?6rbuzmgmlcxtHW82Ur7uPeqdZ5VG+Ux4RcN2bWkRuOn0xVIZvqTXVufx+Hbc?=
 =?us-ascii?Q?0dnlZB/7MtjybjqwsIHIK/jk/aeI5W13S22aDfV/CLZ7dwypQWDAja3iS2cC?=
 =?us-ascii?Q?npr56DJu7o2T1mwnsouDSc01oNjieSyHP3VQiGhc6h+6hZwLmgryQ6eqsgOl?=
 =?us-ascii?Q?TBtKurU/0dzoYQi15XI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gJZls2agMzYD2+KQ00zAlFeoOSSbvUzEBmqXLYQXZ1GfQ+WUXRrEKV7TIkE9?=
 =?us-ascii?Q?MMLDX3KXan6jM6rEWgWpWf4scDIKC4stpl8/NzFoCn6uzA5ZUaoIuEjFmgUe?=
 =?us-ascii?Q?y4fbg253di+X5VTVWoLFYszsNaN6OsaWpR/J/R6kb7aOTTq4SHgUvgG+YKvn?=
 =?us-ascii?Q?cepAFG0Y4fHdKNfAJSCXD4ukIkypGYq4IE0qJVNXoHmNG/SXfbaelhkTb2bP?=
 =?us-ascii?Q?7hFt3BrrdlnWF+v22LOzJ9Fpy5AGqoNxoUQ518s/Fwd/JCMabMRgbMwLOHkL?=
 =?us-ascii?Q?yrQUtL+3ZGrYp9A1lVHZGPCBD1EWwkWkLHQL4nq4SiQd+aTtFoH6Q4xhNb/v?=
 =?us-ascii?Q?dcqJ9EWP4rys8yXQm87T7qoTzLeSConm/kl6uIoo7Ud7phIdSgLg2iPuFuXk?=
 =?us-ascii?Q?x571+EtGQOkVbrZmTvrVH45wXJIY2l6DdgBCwuJt0frIdvTutyh9v3ljoLk4?=
 =?us-ascii?Q?eud6jHi+HFsceOvOQf+2d6VASRkGx8SBTYdDCjetiq3xRs7zer7zu+uF30vH?=
 =?us-ascii?Q?MN/lbeap0fudBcS66CnUoiPGq3h1E8uIBf2QreziXLg8vG1u7be5ffgw5dh+?=
 =?us-ascii?Q?YPY8sVLZBrOOmHNbhqBJK2Dt/W4kZSyXv6BmYFshg46fdi+g6h4yYO1rroS6?=
 =?us-ascii?Q?v63/bCLRppF5AcMT8wfRuJX5A1aCpk3stZ4UwM8aUWSbnc3iR5K4usZrION8?=
 =?us-ascii?Q?Exfq95DMJvQprEuIllvGcdiRtI1lAEuxRnHFd+UCN8wCH+W3uSGkpzE4PHsJ?=
 =?us-ascii?Q?0tpIbkfXZWI7SqHhJOTEcI8t1Iz36Z1djWW5nsYQQ/e9+9Mb8O/E0h2DNbiu?=
 =?us-ascii?Q?g1O0rjvmF2O/NGQ4k7p+hVh3qL0HO7CvNlACPHoiTk8Hl9XYA/0cFJUa2BRc?=
 =?us-ascii?Q?CcIm4mUvSko4ICSu7NsM1GfM9iw1RSfO7j6n5696kHA2loO1+1C8xtOUF4XO?=
 =?us-ascii?Q?FGs3/345s+pGXJjWvu2gKsLbDgk/bWgG+vcSOrqV666eEZsY4XTJvsdzdn8D?=
 =?us-ascii?Q?29bqkMPIH7zfypeBmKDcBe62pZh3uT/yczIZaZUP2uRBAggF2CUelxAsmmpc?=
 =?us-ascii?Q?UGrt0vFmxwJQkSgwbt7DR1SfoMV1eI5sNVknK31On21Gdaj3kzOHtECI/iW6?=
 =?us-ascii?Q?F7gWzRG2/3YoI79Mx4p5P8/wm/ORKx0zObTBc2HkVpJNypIl7wLvV2Ea9Z6D?=
 =?us-ascii?Q?RUPwoqtAHENeUX8gFw6v5cDLGBMw6fS9yvcpAevDHjifEX/nkixaq3VXxjc0?=
 =?us-ascii?Q?hefjVVHJf2XRxunu6scgu0cekrOncUxJJc3rPTkQ8G2Oq3wtzT4mI2UzFAH8?=
 =?us-ascii?Q?9/GagnLRNEthOhES/2qQWytGzg6bfn4q/4r9zl8Zt9RbAsxpIZ3ywoJb8LFt?=
 =?us-ascii?Q?537RqSQGJ9UK2fxwPZhNB6JnsCYXZCJA3p3wS017NEB2kdCa5p0WoqBK8cUW?=
 =?us-ascii?Q?ZXJgKETEKFJWmC1LpI/fJa6NH5m3wJtRER9on5DIft8Pxfig4Nc+c+wsXaZ/?=
 =?us-ascii?Q?ZUvcBbrnfRP9migP2jz19ruH1ckBeMkX3m+wgQ6Zq7t2NBTEN1qD4khj0bwA?=
 =?us-ascii?Q?XbVsmf4gse5RYosiVzKR5efy9+aApbXgrLTwxodiZV0M6taEYtpzvSHjguJ3?=
 =?us-ascii?Q?tx4UdyO6EqdPowRsScEUOV9mrDB/9VJaOOCxDhnliAqTgRDiY2LiIawWgfu3?=
 =?us-ascii?Q?d+Gsyu4rDZQFwv3AiTWU3JZcznvjckYrkTRsN4g2WjKBGCwsAQVyXxV36eNw?=
 =?us-ascii?Q?UMg9BLKgdw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e1f6eed2-6c86-4d83-48af-08de6043c644
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 21:08:54.0750 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fLqNvQql9yY71fyTQ+glkJDhIrv87LBF0vgKA6az7Q/MJ+6/Q4MA6p38S5UBGOehhhpDZquiBAcYHhbDFROXgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7352
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

On Thu, Jan 29, 2026 at 04:55:25PM +0000, Lin, Shuicheng wrote:
> On Wed, Dec 17, 2025 9:24 AM Rodrigo Vivi wrote:
> > On Wed, Dec 17, 2025 at 04:07:02PM +0100, Michal Wajdeczko wrote:
> > > The function name is missing an underscore, which results in:
> > 
> > I'm glad you wrote this. I was looking to the patch first without been able to
> > spot the difference! o.O
> > 
> > Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> 
> It seems this patch is missed to be merged. I don't see it in the latest xe kernel.

Thanks for the heads up. Pushed to drm-xe-next now.

> LGTM.
> Reviewed-by: Shuicheng Lin <shuicheng.lin@intel.com>
> 
> > 
> > >
> > >   Warning: ../drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c:1261
> > >   This comment starts with '/**', but isn't a kernel-doc comment.
> > >   Refer to Documentation/doc-guide/kernel-doc.rst
> > >   * xe_gt_sriov_pf_control_trigger restore_vf() - Start ...
> > >
> > > Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> > > b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> > > index bf48b05797de..5cb705c7ee7a 100644
> > > --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> > > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> > > @@ -1259,7 +1259,7 @@ int
> > > xe_gt_sriov_pf_control_process_restore_data(struct xe_gt *gt, unsigned
> > > int v  }
> > >
> > >  /**
> > > - * xe_gt_sriov_pf_control_trigger restore_vf() - Start an SR-IOV VF
> > migration data restore sequence.
> > > + * xe_gt_sriov_pf_control_trigger_restore_vf() - Start an SR-IOV VF
> > migration data restore sequence.
> > >   * @gt: the &xe_gt
> > >   * @vfid: the VF identifier
> > >   *
> > > --
> > > 2.47.1
> > >
