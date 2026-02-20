Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9DABC5B56A
	for <intel-xe@archiver.kernel.org>; Fri, 20 Feb 2026 21:07:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70EDF10E842;
	Fri, 20 Feb 2026 21:07:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EKW2CD3B";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F373310E842
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Feb 2026 21:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771621622; x=1803157622;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=GSleHSaHtIip1we2fuyVvbSOWe0ICipHXFkPKVv7agU=;
 b=EKW2CD3BteC22qfpNkDhwzbNIATubB1wh/2+FNWz/VYIsKEvlwD5Knw3
 oqBjUGHY1vfgwBCPSfxsLHRWgpk7GLnVUxPAAj5WF5uafXY6SkNb79x3b
 8caFA7SEiFS68zSY3sC8pBg0fSW1CYNiNhsONyPDqLDoa4F9oqh49QIgH
 xR1gRx3XSiFv6pcA5mMpwl0LcRzW7Sh7cwci3wG4NrBQrU3hTxe+zwP92
 sHdF5lACCwcZxgMudcPSChXAOp1HfqVGYmSiqxFX2gLcNzudN2uQGaVRI
 1LuIe3BPW4+dOOYCyVF7fDdUwRcahwFcBvhO+rtpa2RXQMII6/pot0K3y A==;
X-CSE-ConnectionGUID: k76BBPBsSu2LEb+4tLAktg==
X-CSE-MsgGUID: xq0KdsFPTHe3936DEYBu+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11707"; a="60293022"
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="60293022"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 13:07:02 -0800
X-CSE-ConnectionGUID: QTUf1jcERzqnx5m9lG7isg==
X-CSE-MsgGUID: xdDAbTI7QuuTvMLYBQFyOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="214192593"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 13:07:01 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 20 Feb 2026 13:07:01 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Fri, 20 Feb 2026 13:07:01 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.58) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 20 Feb 2026 13:07:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AUulVBkn48jdK8rvJkerI4aa/WwKMSpgW+LPhz7fDMewYYJQy0eZtmb4AaGFuQ7qE69nmYRLukBKDr2ni9bVb8yf9EYbrrnxjioTNagQoOTrKdQI1VCgGBPWS5QvdoNhRBntm06XNQweZ+IFNXiF8Q2pJf8OLbMKKEK8S8oxm4U6sOwlZrSrL4XRzeIPWNPnyihZp2KcBEFosKLX7fQnxEzrgylq3D5eHuidfYBl9c4l+NrBlh4rC+sP02zA51htLqTLG4K3nh+KXQdJyJlR5zc/pOeOmyu3Ptcupz2B4WHhdVh4/Y9MVciOVuog2lBX6yidFaGQUf9CHZ+e2W2XyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kTT9nWybVTLh/O0ByWkwiBg0+pFUz9e7kO17SLNodBY=;
 b=MhzyAyz9U+baJcBbv0m1/7HewegMccfaupu8fWZdZKBLGNaKDtaQ7VRFag3TOcYHqNzhnYjXNia2ygnWyiCMHNfzRjbw22hxAiJvS9oosJep2CGNBhWCnlj7Qest7OLSsfrBqv6mxJGDSRru/qdH6qayI+F8vL52Pi0Db4yEKH5RsBWd214NSAIEQKRXYyQkGAVl+CYzL1DqSTzyyrSHEGhjw3vLFytrE2FMKr1ou7PZwX2YzXJ4NQW+R9xhozSyr3OBObV+QxFFWrU37DAdfqexpa+06hyu8eV/uztOdB5yCI3HJ37vKtZmDKHbBq4fJ7XX9UCifCsVH3T1WbF/Sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by BL1PR11MB5224.namprd11.prod.outlook.com (2603:10b6:208:30a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.14; Fri, 20 Feb
 2026 21:06:58 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9632.015; Fri, 20 Feb 2026
 21:06:58 +0000
Date: Fri, 20 Feb 2026 13:06:56 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Stuart Summers
 <stuart.summers@intel.com>, Daniele Ceraolo Spurio
 <daniele.ceraolospurio@intel.com>
Subject: Re: [PATCH] drm/xe/guc: Skip access counter guc ads initialization
 for CRI
Message-ID: <20260220210656.GF4694@mdroper-desk1.amr.corp.intel.com>
References: <20260219041411.4129401-1-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260219041411.4129401-1-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: SJ0PR03CA0046.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::21) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|BL1PR11MB5224:EE_
X-MS-Office365-Filtering-Correlation-Id: 5944c1cc-b766-4d73-b7b8-08de70c3fbfe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?oFTu/JHb6he7ajXrTnkg6YUwuwEZWNybiYSYgTNQwnMFtDHK4VctpIyZFxeb?=
 =?us-ascii?Q?M2KgiAgLbVCP5tR08KhWVZ2wVEfaJGOZt2BprRgnEShBl8B7yrVzn8NNw9a6?=
 =?us-ascii?Q?PSoVykY0Kpciivm80MuB3weoC+ApLqNYoD62som0W70twXxADQ8AIcTwejLg?=
 =?us-ascii?Q?opkJ4Jmv/Dphnqg+wzLY/RgBUV4KvaLLigdlD61tDouCXC0GVjTC1HimQ/LU?=
 =?us-ascii?Q?xlxoSMXnI7NgpGxCTAzzzAt+3O/r8is1m5Ks/N4ajziflHWcifZfLfCJ44it?=
 =?us-ascii?Q?6h/US/btGHiUy0tbzeZ/yD92imFuUSNsKHJDYVoeyCzDhJs3vl/zFuRnql5y?=
 =?us-ascii?Q?nV/Swhkf/VFmqYTLYgvJgtttCUn3hs8TkTie9104nZ+nOvXuCiknxDXC8cvp?=
 =?us-ascii?Q?dNK10sd1He8GkCg/rmkThIQRDqsOB5xE0DY91OUBsudWVqS6aGT2gUuLWj6O?=
 =?us-ascii?Q?35svkanKu+9LjNdpiWakoDVXAHHy9GMFb23TDp0i/1xYkVTafT154xwZZ+9+?=
 =?us-ascii?Q?orugA0fEsCKtF4nPf7YUZL61rcOKz6Oqg4vsTZpMSufpuVRgFkekDIeMgCUK?=
 =?us-ascii?Q?QuaU/oGkewY0V+uCFsjm6LSgFdfACNFq3bEWgt5NzZ/M/m6z7X/N3D3yO80c?=
 =?us-ascii?Q?XQviBUfAEAW+e3Tfsd2JWSFYO78YdhK9BkuxTEBwafffHrM+X+eFwbHQKD5Y?=
 =?us-ascii?Q?xzcwT6aJyK7YGWmq+pc2MKMAmL7DYqpGy9GDZuY5zca76m/YReE/CbBCqJmz?=
 =?us-ascii?Q?Fw3JYKLFqhT3uZQPqCnI9ik2qsRKSZqREg+va3iFZ8obCDz9klCfMYW5lW9g?=
 =?us-ascii?Q?YU6Tn2tTPznD0MkUnBMKxWN9hGGSBcZNnFZRytnxMkdLyBLxaO5ZDtXQXd3J?=
 =?us-ascii?Q?M1tW2Qc1ipfxNfpqAIaACl+Rls3KxpMlTuvqzfLL6h+S2zTmJdkBDdWx7/dB?=
 =?us-ascii?Q?SoYtKOCsUBL+rJly6DtjDo8Uqs5/wTTztPi98IJU8RjEwgn56kydJRlymctT?=
 =?us-ascii?Q?4Esilstc5973+quIegoox6ThZWYkokA9JlNXpTI5JVgy6RnTa+DvFLixXtT6?=
 =?us-ascii?Q?edbp95nLU67PjQ07xnD5jDcPF4onEQM9tRFrmiIh/Dm92qTy+KRJ+1FhEM6L?=
 =?us-ascii?Q?9Bajeh6gu5ynv0lT/SsmVq8jANjHueRNTh+WY6P6gqdmeNrFVtNWrcopZvoy?=
 =?us-ascii?Q?f8gzPHoYKWSmoCkLGdoahVgfLXZUXo4rNfe8pPyOcp2v+NrUxKPQBSxaKGe7?=
 =?us-ascii?Q?78djE6MHAC36IHpCHovhyqGjB2YL8nIxJ11jiNbQxGFInRSaO0h8pgtr2nue?=
 =?us-ascii?Q?iC0d8vk2MCmQMlpyd93xKNDcsiSZNu4BG8RppbCXWd5ZJIWu8Lmv1ShtpYyA?=
 =?us-ascii?Q?m1pdDMZNxYHdnGXRQyL16WFPzcuSmdT4zsY0rKQ8aO5T4CIvTBjjXkg0yJjv?=
 =?us-ascii?Q?2C6PuqEUdKSlmE0f9EWmtEm32KLiPU3jxBHQbz00JR/QTy8M0TAYh1mkbb2Y?=
 =?us-ascii?Q?HRm458W7Gslz8oi3+wU04eNxgQRZ+D9USBK+xs+Y1KVgdNQ9C3cSaVSB0H0S?=
 =?us-ascii?Q?R3KBoRy/E9mBimuJcjE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?d0CtMhFBHApRQs3W5YkHvkoZqgO1+Nqh5b/Qyzq3d0knNT5enJB/A6pGU8V8?=
 =?us-ascii?Q?w2wJXsmAX/hllMnvy65d3lXkh6HCzUtKzfREqyFpBvitN/q92UXr+5FzKyH/?=
 =?us-ascii?Q?HCXf8otA3t5LdtuY6wP1q4JRX6L60RxNuoAfDddJQbZmaZHowOzkQ/suQl1N?=
 =?us-ascii?Q?bkGvYHUkueAoAXf8QRGhx+fmQlGYkGZmSxNobUZkgYDKmA/Y0JHzgTQ6FQnP?=
 =?us-ascii?Q?csQH7UFYVTKpL1AHuIRW9GM3S1HMZE6+pBbeMMbsKmsjuxaExAFKeEIvTiCu?=
 =?us-ascii?Q?Rx1lXE9hPHgu8RaOPqiwU6XqjQZScvA/5puVK0kp2vfwUe0c+ZPzg6AJj37p?=
 =?us-ascii?Q?7u6QWO2qUqeLkpGkt0SNEyt6Y5Yl2XPjb1Xawh2k4uweTzClm5iQW03BSzxV?=
 =?us-ascii?Q?bRon7y9AMiXxLRqh3mlRw8Pl7kzoAQI27L1SmbCFtDK2ZIJ3nqaUsLPXjQDd?=
 =?us-ascii?Q?1x6yGZWfazYrPzYLFZJT9RYYe6SHLTW415w5dNmIHAEp4BoQ+OBDpJ06KPmW?=
 =?us-ascii?Q?bB2gukXxWwbnDUbHd919ahqrMZlr0aOuk5Bc2ZkyoWldBbun4wohk76dgSLo?=
 =?us-ascii?Q?ccTwlMNWiTh/tmuEJAlwVBvEVDvKVD+3eePedyYJWbZOVQPSE8jO/D8jKYBC?=
 =?us-ascii?Q?gKG6lZvrFih8YVqhncdBpyBLLJHV+hrBx4it9qKqQVhXbNBMeIZ4Hjlz3zzn?=
 =?us-ascii?Q?Zj7svnpbR2DFLJwx6LXprjtP5D+WCsV+TrBHhLvipmbGCleYFVySjP9qkG2Y?=
 =?us-ascii?Q?WSEP20SfSX9B+eWWZkiukJDft1pmsbzjmMRMnOFunVOuluH1860XPqaoZYuz?=
 =?us-ascii?Q?2/NojqG971JAma27zxi3paq3XsCQ7JCurhyTqJtCHMwRFWez7xZZE28k3zHe?=
 =?us-ascii?Q?7qlHhi4Vw8vIxokCIJUnZIl2Hk/8Gnwq9Ma4J/cKDgY3/+JwN4v2pFrCvZ/9?=
 =?us-ascii?Q?7ZYsDHs6QCk7S8miL7cnutA0FJzedUYVJukW8y6wOnCMdIiGaG4E+DDDoHlN?=
 =?us-ascii?Q?Ns8VZCAXxU0LY8jpNuKeyW7Nt1Uwwiv7a/p1+S1z/BesNOcJiJwtBbqplqJg?=
 =?us-ascii?Q?7pXGtpNBwavsVUqYkI72TzlAoSXHMI2a3h0QYoAt/ZrrZjPcZU3hhQLhnayS?=
 =?us-ascii?Q?hrFV8akLY/iEO7nL6Z70y7LZZLzD5lxtgiM2RzCpUkdLylLiCYqoSyunoo7v?=
 =?us-ascii?Q?3BGoqGs1G4L41+YFucRaM/DvCulJzWwHfg6SRYUQaBJs0mf13gO1SLavw8Kx?=
 =?us-ascii?Q?7S6BSQMiw1uPbDUp7uhs+RPeGyJgxJS1p/d16jU/JYwhnQooOmXQc0crnTZE?=
 =?us-ascii?Q?AIUgwY8BmeZXJxtRrcYGozfFMG4vphOn1xUr1xwlJLslh4S21696d0alahiH?=
 =?us-ascii?Q?Zd3K3vjIL8xQKZRPWI6GSeTYJiCgb8twrg8oTgTzcxPvtbbiiMdsNG91xdNA?=
 =?us-ascii?Q?Ph3K1jo9ie/ZomFvIEoofRIrhtt0cn9xzyYiGC+7j+mEpkiy9mu/r1tx52uN?=
 =?us-ascii?Q?irgsBRQkMP/fKysNVYyhcjwn6KxVe7qMQgf4y39hjvtY/8YxOlx3Zb3e6xWT?=
 =?us-ascii?Q?aKf1HEqhtkI/N/TLDL2brSYmFmo7KWqW5Ki79XfAdY70rRFBVd/Pub2VkPVS?=
 =?us-ascii?Q?ntuM+YZvdPAqQPdDiopadlIl+aMPM3CTgGAl/HVvPs7khLqf76b0ZFUI69lW?=
 =?us-ascii?Q?n2m/wbOxW3g7IsHiqHrXSfz9ml0+0T514ZHsAQd+GkpRlwfq/V1gPUG09rXe?=
 =?us-ascii?Q?Z5pE9Kek5dRmcaJP4mTP7eQlThCN/tA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5944c1cc-b766-4d73-b7b8-08de70c3fbfe
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2026 21:06:58.3287 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5dmNLjkeq8JVdzHmSxLqxYXkCiUw2wdG1LFhCTrvj90gmPgpFmiXBupoKNzOVJmio7qR5CHM3cuNHd5lUjnb9CT8IY6LjqJbmD/crIpjsXI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5224
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

On Thu, Feb 19, 2026 at 09:44:11AM +0530, Himal Prasad Ghimiray wrote:
> The Crescent Island (CRI) platform does not support the ACCESS COUNTER.

A statement like this should be accompanied by a supporting bspec
trailer so that reviewers can confirm this, and other developers will
know how to check whether this limitation also impacts other platforms
in the future.

While the documentation isn't super explicit, I guess the "This bitfield
must be 0" note for the "page migration Q valid" field of
PAGE_MIGQ_ADDR_L (bspec 59323) is the source of this information?

> Skip writing parameters for this queue in guc_um_init_params(), leaving
> queue_params[2] zero-initialized to signal unavailability to the GuC.
> 
> The queue_params[] array layout is fixed by firmware ABI, so we
> maintain the structure with queues 0 and 1 (page fault request/response)
> always configured, and queue 2 conditionally skipped on CRI.
> 
> Cc: Stuart Summers <stuart.summers@intel.com>
> Suggested-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_ads.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
> index f4cbc030f4c8..51e142c8a4a5 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> @@ -818,6 +818,7 @@ static void guc_mmio_reg_state_init(struct xe_guc_ads *ads)
>  static void guc_um_init_params(struct xe_guc_ads *ads)
>  {
>  	u32 um_queue_offset = guc_ads_um_queues_offset(ads);
> +	struct xe_device *xe = ads_to_xe(ads);
>  	struct xe_guc *guc = ads_to_guc(ads);
>  	u64 base_dpa;
>  	u32 base_ggtt;
> @@ -830,6 +831,15 @@ static void guc_um_init_params(struct xe_guc_ads *ads)
>  	base_dpa = xe_bo_main_addr(ads->bo, PAGE_SIZE) + um_queue_offset;
>  
>  	for (i = 0; i < GUC_UM_HW_QUEUE_MAX; ++i) {
> +		/*
> +		 * CRI platform supports USM but not access counters.
> +		 * Skip ACCESS_COUNTER queue initialization for such platforms.
> +		 * TODO: Add .has_access_counter flag if more platforms need this.
> +		 */
> +		if (i == GUC_UM_HW_QUEUE_ACCESS_COUNTER &&
> +		    xe->info.platform == XE_CRESCENTISLAND)

Please go ahead and implement the TODO here now. Having a feature flag
in either the IP descriptor or device descriptor will ensure that we
look into this and set it appropriately when enabling new platforms/IPs
and so we won't have to remember to hunt down stray conditions like this
throughout the code.


Matt

> +			continue;
> +
>  		ads_blob_write(ads, um_init_params.queue_params[i].base_dpa,
>  			       with_dpa ? (base_dpa + (i * GUC_UM_QUEUE_SIZE)) : 0);
>  		ads_blob_write(ads, um_init_params.queue_params[i].base_ggtt_address,
> -- 
> 2.34.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
