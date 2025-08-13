Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A19E1CA0EE0
	for <intel-xe@archiver.kernel.org>; Wed, 13 Aug 2025 15:17:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 509B910E0F3;
	Wed, 13 Aug 2025 15:17:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aEQY49bM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8138710E0F3
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Aug 2025 15:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755098264; x=1786634264;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=zW3vzQ/iLUqRJSq67Yt6LCieKOhENYwl0ijR8TkjdcA=;
 b=aEQY49bMGTN241e9tSziEABIES0m4/w8dnZgM2NfNG31NDIruJn6fK3Q
 UXRF2+4yA7TygwrpNh/fLoyu62OJps2fiT6Uw0kUB8h1Nf+ekW1Ceaqi7
 rlzySwLvmXQnTnyhAz85IBjIoEXpZHk5y9dY66MTdfkslAnOkIDXRBDuL
 PPidpczc+HhqLc1O/e4OfS85rvY21WCVmLi/HQ9GKrxaijULS4TKaYHuH
 iZtrbdnz7lL1aftOXwL9zl9+XYfvDx+XJEVMsM4ygEav+zFfZ/Qh1hxOx
 N8q0zthpfztXdIl+nEvvED5x1yu60pYdF6yG1h4bU8dNOus9dUThdEIaY Q==;
X-CSE-ConnectionGUID: Ria34ejCQbuCmPVNBSeyAg==
X-CSE-MsgGUID: TUU7jByHSk6hHdjCPwGU5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="67999852"
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; d="scan'208";a="67999852"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2025 08:17:43 -0700
X-CSE-ConnectionGUID: 3teD6criRBauK5Tf8cKRTA==
X-CSE-MsgGUID: TormVr54ReakepZMVDhPEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; d="scan'208";a="170707413"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2025 08:17:43 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 13 Aug 2025 08:17:42 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 13 Aug 2025 08:17:42 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.80)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 13 Aug 2025 08:17:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FOLVC3QGdNEs9CvFCU5L47bbATkPcBOP2Nu/Uw7zso6z6TGExA99zZMa6Ojo4p/+TYhFNcOAzBpS8nOks396mrPYzJjBg9Q2DeNCsJYuqRAN0M8Grt1gkuAExsNs3GTtpZ4hQjWOe3dUKXfyCNUAPafhgl0yo5zyKCzrqmYLhki91Y3wSW956Mr+eTHFGdzUffwI9rxE+7b2vhih+1owGIHxxb3VW7k1PLThg3P9COw1iiL3Zsczbh2JuS5XNzv6QgRMu2QM6tBe/dH9mxdIVLti3iUv97UJqhJs+BSpONFckOdGLaAdNGgg43IMPZb8gn2s0LYKi+y9h2Z7t6Zayw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7klT+A3wdnDI76na2Lh1ZzDcwahBpf+O1LF0YAMu0hY=;
 b=R2sAxDS2c+jk3o3aRKmQ7lDdK4HaLx/e6j2asfwrHPe8ne4l7wjM5V0muxLxuUxmfJ41zQPjgSbj869Qed1r4SbUrAmBTc7L0duLtX/KT4jQUaN0J5By2JWJHY+1d2BqQ1DnUq0WBTU+KOQg0BDw7a4j43awCOOQLAOoZpg3kLxufJXyQy5krnZ8Ou4MV+D+/VWI2QyYAskiui8LxEerGUWDlDzxpWJcFZu1KdAmQ5tyuf5STGOVLWsjIQTzNLnSGx0qR1+lXUpmlAjbH1DDZwqwE2B/CyCu5PJsyUqe2lsL+/3ygC+V3JLWRw3yhQHvbPl580qnP0tpg0T+vgMNZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA1PR11MB6218.namprd11.prod.outlook.com (2603:10b6:208:3ea::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.23; Wed, 13 Aug
 2025 15:17:33 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9031.014; Wed, 13 Aug 2025
 15:17:33 +0000
Date: Wed, 13 Aug 2025 08:17:30 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Jani Nikula <jani.nikula@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Matthew Auld
 <matthew.auld@intel.com>
Subject: Re: [PATCH 01/15] drm/xe/vm: Don't use a pin the vm_resv during
 validation
Message-ID: <aJysihjLy7Pl1r+5@lstrano-desk.jf.intel.com>
References: <20250813105121.5945-1-thomas.hellstrom@linux.intel.com>
 <20250813105121.5945-2-thomas.hellstrom@linux.intel.com>
 <aJyhGXq6JEKuPs81@lstrano-desk.jf.intel.com>
 <e6e365e23e1cd02e242c221e91b687e9ac97731b.camel@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e6e365e23e1cd02e242c221e91b687e9ac97731b.camel@linux.intel.com>
X-ClientProxiedBy: BY3PR03CA0015.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::20) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA1PR11MB6218:EE_
X-MS-Office365-Filtering-Correlation-Id: e8a0a9a2-a435-4a37-0e0a-08ddda7c86b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?p8+eAJMrlubxI5RstjtYbH6+zJ8P9Jou79gIc6tXBN9LkmssD6f0wkhixV?=
 =?iso-8859-1?Q?wVZkMmEP3f/ZNNCJHrtcVPdstz/TGcRVejYyq1d+NJLxk9jsD6nImcSaNg?=
 =?iso-8859-1?Q?Z/GmDaKJZYZAlURWRv4Mwpd0qO8ZSN9SxU8uxt1tvzshiiavg2XgKPAvj+?=
 =?iso-8859-1?Q?V2T0v8OnmmIkTjbmN2XHwsOd0EVdvA1nOK+if5LPWUHyJ2J6pUU8sGIgyE?=
 =?iso-8859-1?Q?63ah6fZFhMRosLOYjBbpDftAwWWJwKyX0eJz5wsnpSS11zM+DUJ8sDsbpa?=
 =?iso-8859-1?Q?husQb+43uAJVgtxwlSLt7AqEMkzmpJWH+/39vqaTetF0sVUY9CnnXtQtv7?=
 =?iso-8859-1?Q?YEcTmEcZh/6kxsUphwxZiKN/W8mHmrcQ9i0VVDK224qLu6taS9ZS8wcZ6I?=
 =?iso-8859-1?Q?rziEcZxFsFzTZGyKTfnBJRAaUEkramm3IOXKAN2kwYZ/J9cp3NIrOV9Alo?=
 =?iso-8859-1?Q?Mr7z/AIWQE0Rv9ueHq2Z5fSsJUVDuW+APWJMm91dn7pqVIU9ASSo78+Xam?=
 =?iso-8859-1?Q?MCMAjtmQh9m3KRjRAItY+G/YGCnQqEm9s+TLcQJrq6TP/VM+fe3hUdCfZ7?=
 =?iso-8859-1?Q?q3u6HCdGRMNseYbjySmvo2vN/vkm6YgWWfnAS5rIJuTWooT7/HbcAds4b8?=
 =?iso-8859-1?Q?5OlJZ3D9i2EZRExIuUoaENsg0D0C1TO7YnEcfsLXpbXPoYOnvltIYPnlT4?=
 =?iso-8859-1?Q?EuoSABRZll53cIAbKy56e+z6wpJs7iiYRPSAwpdAJmXLhYCaqCn88vfY2Z?=
 =?iso-8859-1?Q?DwfiIB9EtuFsiq51qp/jYnh8ePwJAZxgyA2VfwlSSyZmZyx4G5E44q1b9x?=
 =?iso-8859-1?Q?WQ4zU3+B8IuNTXXhtgnztqeN7Qynnc2IYe09Ccc89QlDNoMjCjbX2bUiPZ?=
 =?iso-8859-1?Q?zzeBmwEEZoBbsmlGqktGWVOlJeEU4r3WefcNhuMfdsNZcVnsVsEYY0CcUS?=
 =?iso-8859-1?Q?3l+yn/6TMO5VSdhEtd3gXGoBdKHt53af9xc7s9jaR0qyk5M80zpImbkW1n?=
 =?iso-8859-1?Q?6r8P0ZLqPxLpufHSvzJpneTtQMIrBJCrxFxQSgxhDzkp8G1G6WrZrGd4sS?=
 =?iso-8859-1?Q?zgBTIFe53znPrqOm0nnLDLUhGXyMuDujEYJd8w1t4xZ2KOuMSBL1R+3+wm?=
 =?iso-8859-1?Q?Glxj2DP89QAYRLcuXzDVBcifEKHRizXgC2FJ2V/zApBWP39reHd/Omb8JO?=
 =?iso-8859-1?Q?eUk/FUubANBpge45XvD2la8jo8bKAiKpoII0XXu7pDorZqo6ylhzV6WpWl?=
 =?iso-8859-1?Q?dZZIybaSr18OpdV9ejw7X8VDacFwE0e50t6MQz+52V4Tls3wSCS535ryg/?=
 =?iso-8859-1?Q?s5TmqDp3rT1WnM1JNXtkTGT/HWJ3BAPEnYfPJbcLXZkeBOf64tNoupi1Ot?=
 =?iso-8859-1?Q?1YqMuDaSILjN7oIOvTSkGYnYr7FFf6D0lAmjbenQ9xmmqr2L9LvnrPhNwl?=
 =?iso-8859-1?Q?Y6yo8YVRpINylZpHazZl6oYLHp0AOuTXaadjAhPul3RD3pyhadvxyO3NSx?=
 =?iso-8859-1?Q?U=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?RGpZPGfgvo1vM/YOhBXT1lkjcI+tdEcNF5X72gVq8Uc9Focxb+IevRaflx?=
 =?iso-8859-1?Q?+ZcNo4Vt/fZb8RRI2UQi33aa3lfi09qNAiGHoBhbu2Qx9DIBGQfPHul/Qy?=
 =?iso-8859-1?Q?7nxIKfZcm2gDlRg4fNj04rELfQcbb8JnFuNsQoj9EvLZFGITmdX6KY0TLK?=
 =?iso-8859-1?Q?mbfW0z+c/wIBV7VuwnGSf7y5V89XDK48XkqHz1ONCURQp9DFGeefttveHD?=
 =?iso-8859-1?Q?yVevE2IUG8xqhuYPheehOVL6E3VosR6EdMuCWwQRdlEsF8ns0lpvW8Qn7X?=
 =?iso-8859-1?Q?DtueSGkqDM413VX7HMrTLSTFwYWbP+nP+Dcn0OVXw69oO2dDA1v4BjgfX6?=
 =?iso-8859-1?Q?0eJK/FujVcGEIdXmq3M9dpPVXhCO5ZN0JdSAcYOGfUUBsAsNfSvVMPaA0K?=
 =?iso-8859-1?Q?xW4Vt+k4eLFWRaSVoEFJiANrM2Sr2hx3OoBEyHRAQMACXunGh049Wa3DpD?=
 =?iso-8859-1?Q?kWC6fzpcHVk4qv+TtSW3vdFDqeVyF5O4h/XdSRKu7jDV6+YVnuuElBzmjS?=
 =?iso-8859-1?Q?scXnZ/lhpl3Hg8Q6h/MZY7x/8PbMwGtIX0iNVKx8Ydq4bBNCmTbVWbMdew?=
 =?iso-8859-1?Q?1Qqy9BjhLl5wZ8pMrf3/eo5+RNEVE94MtwT9eROdc7fFewDkYX3GJgrqG2?=
 =?iso-8859-1?Q?wpDCJoXgGGuLrEMes8IjGrSwmRn0hta8OKkdBFQFhmPoeXeC7oT9N9b3Za?=
 =?iso-8859-1?Q?lG/L1vWoOS2menwUF12tTjPv/EJWqvUIyQBJCz2B5zcZYkUXkBW9SRH91I?=
 =?iso-8859-1?Q?8VuVAoRNFmIbQZJPTqtOWg/O8ssgKYhF2yeCXesmLslbHAujZiLl/iq5AH?=
 =?iso-8859-1?Q?SYlFBMn2Fth2n2jDg6al4eCrpJ+54uNCjfGDi8pPVkxk90Y2gXaLqbPFWI?=
 =?iso-8859-1?Q?yT1vYKU4kcpQ43DI/8UFzyKx2HhHvIiw6LOSU32l1/5BVFeYx0Qex3XqSb?=
 =?iso-8859-1?Q?rFxd1NNRFuW390EB8l967XDmA/bsXp5pTTRIFcZaFKAH4E37Cp0eWtmkUw?=
 =?iso-8859-1?Q?6Auef3Hi2WzCxQSLNZ7GuJ54YBOOTRUKttpOPyaGbXOYJ18+h1eRjXfimo?=
 =?iso-8859-1?Q?tCyoYbOi4bhqRoLsoURlKnQL3kszDuoNQkGUrA9byRppKvqP/r5fWVzoSh?=
 =?iso-8859-1?Q?KgdW9lVNVpqas2B5YiiyW0S/J2daGPQhx6yWennjpsDflzKe5+sY9OprXJ?=
 =?iso-8859-1?Q?60mdqP3IT0URMG+4mhBtQV8fn9NsjC+bnugA3JuaOqNvWBi8kRj6Yfwki2?=
 =?iso-8859-1?Q?M/7Ta4Zo1CVVh/fvfQMRMfWUnt+2w8bURZPJWA6lK84fW7OE1cORmur8W9?=
 =?iso-8859-1?Q?zmb8y8xEDkJ4Ar/vGiAKZes42plDlGm4VB94yf/X+sYttMVaFyBSQiVvmz?=
 =?iso-8859-1?Q?hUUlYjzXSYtEIHJ5G8Up+rzO5W7ZHKzlEbyHP3Cbn1UZqCQh0rLVwvCF5I?=
 =?iso-8859-1?Q?8lX+SXyH/7cGO1FyWLR39bYWZTLeMYJPGbcYjocu6sBHg9DKU8JswKEj3y?=
 =?iso-8859-1?Q?90900heTV8Jfr0Psyqk6cDbtno2JoPFEDKuguGsugsV/4SO+10w9qhBTx6?=
 =?iso-8859-1?Q?qMsxk1oy2xvOoFdd5fsA1uwggHUi/olftCbywK3HMTdCfcclZD6guiVLqi?=
 =?iso-8859-1?Q?LAA9s8Y/rehz8bG+XlBsml1k45fRQEuTMQ3z6A2+AfwD9HgEuxLqIrkg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e8a0a9a2-a435-4a37-0e0a-08ddda7c86b0
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2025 15:17:33.0555 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IFWDkHILHj6CYxc+kKcDcSzCXqND5Wf85owXxxuUjYKLRrchK1T2+ehApD97GzkKxcwLV9bDSnlzrTN/EWL0dA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6218
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

On Wed, Aug 13, 2025 at 04:33:01PM +0200, Thomas Hellström wrote:
> On Wed, 2025-08-13 at 07:28 -0700, Matthew Brost wrote:
> > On Wed, Aug 13, 2025 at 12:51:07PM +0200, Thomas Hellström wrote:
> > > The pinning has the odd side-effect that unlocking *any* resv
> > > during validation triggers an "unlocking pinned lock" warning.
> > > 
> > 
> > So this is a cross process thing then - right? e.g., Process A pins a
> > dma-resv lock, Process B unlock a dma-resv lock and boom lockdep
> > warning? Just want to make sure I am understandinf the problem
> > correctly.
> 
> No, my understanding is that this is a single process thing.
> We lock the vm, pin it, lock a bo for eviction, perhaps using the same
> ww_mutex_ctx, unlock the evicted bo => bang.
> 

Ah, ok. Got it, makes sense how this can occuring within a single
process if eviction is triggered.

> It might be that the locks need to be locked using the same ww_mutex
> context, but not sure.
>

I'd guess lockdep_pin_lock operates on a lockdep class, all dma-resv use
the same class which creates this issue.

At any rate, this extra assert isn't really needed so I don't see an
issue removing this.

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> /Thomas
> 
> 
> > 
> > Matt 
> > 
> > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > Fixes: 9d5558649f68 ("drm/xe: Rework eviction rejection of bound
> > > external bos")
> > > Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_bo.c |  5 ++---
> > >  drivers/gpu/drm/xe/xe_vm.h | 15 ++-------------
> > >  2 files changed, 4 insertions(+), 16 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_bo.c
> > > b/drivers/gpu/drm/xe/xe_bo.c
> > > index 6fea39842e1e..11eaf3b06766 100644
> > > --- a/drivers/gpu/drm/xe/xe_bo.c
> > > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > > @@ -2468,7 +2468,6 @@ int xe_bo_validate(struct xe_bo *bo, struct
> > > xe_vm *vm, bool allow_res_evict)
> > >  		.no_wait_gpu = false,
> > >  		.gfp_retry_mayfail = true,
> > >  	};
> > > -	struct pin_cookie cookie;
> > >  	int ret;
> > >  
> > >  	if (vm) {
> > > @@ -2479,10 +2478,10 @@ int xe_bo_validate(struct xe_bo *bo, struct
> > > xe_vm *vm, bool allow_res_evict)
> > >  		ctx.resv = xe_vm_resv(vm);
> > >  	}
> > >  
> > > -	cookie = xe_vm_set_validating(vm, allow_res_evict);
> > > +	xe_vm_set_validating(vm, allow_res_evict);
> > >  	trace_xe_bo_validate(bo);
> > >  	ret = ttm_bo_validate(&bo->ttm, &bo->placement, &ctx);
> > > -	xe_vm_clear_validating(vm, allow_res_evict, cookie);
> > > +	xe_vm_clear_validating(vm, allow_res_evict);
> > >  
> > >  	return ret;
> > >  }
> > > diff --git a/drivers/gpu/drm/xe/xe_vm.h
> > > b/drivers/gpu/drm/xe/xe_vm.h
> > > index 2f213737c7e5..2ecb417c19a2 100644
> > > --- a/drivers/gpu/drm/xe/xe_vm.h
> > > +++ b/drivers/gpu/drm/xe/xe_vm.h
> > > @@ -315,22 +315,14 @@ void xe_vm_snapshot_free(struct
> > > xe_vm_snapshot *snap);
> > >   * Register this task as currently making bos resident for the vm.
> > > Intended
> > >   * to avoid eviction by the same task of shared bos bound to the
> > > vm.
> > >   * Call with the vm's resv lock held.
> > > - *
> > > - * Return: A pin cookie that should be used for
> > > xe_vm_clear_validating().
> > >   */
> > > -static inline struct pin_cookie xe_vm_set_validating(struct xe_vm
> > > *vm,
> > > -						     bool
> > > allow_res_evict)
> > > +static inline void xe_vm_set_validating(struct xe_vm *vm, bool
> > > allow_res_evict)
> > >  {
> > > -	struct pin_cookie cookie = {};
> > > -
> > >  	if (vm && !allow_res_evict) {
> > >  		xe_vm_assert_held(vm);
> > > -		cookie = lockdep_pin_lock(&xe_vm_resv(vm)-
> > > >lock.base);
> > >  		/* Pairs with READ_ONCE in xe_vm_is_validating()
> > > */
> > >  		WRITE_ONCE(vm->validating, current);
> > >  	}
> > > -
> > > -	return cookie;
> > >  }
> > >  
> > >  /**
> > > @@ -338,17 +330,14 @@ static inline struct pin_cookie
> > > xe_vm_set_validating(struct xe_vm *vm,
> > >   * @vm: Pointer to the vm or NULL
> > >   * @allow_res_evict: Eviction from @vm was allowed. Must be set to
> > > the same
> > >   * value as for xe_vm_set_validation().
> > > - * @cookie: Cookie obtained from xe_vm_set_validating().
> > >   *
> > >   * Register this task as currently making bos resident for the vm.
> > > Intended
> > >   * to avoid eviction by the same task of shared bos bound to the
> > > vm.
> > >   * Call with the vm's resv lock held.
> > >   */
> > > -static inline void xe_vm_clear_validating(struct xe_vm *vm, bool
> > > allow_res_evict,
> > > -					  struct pin_cookie
> > > cookie)
> > > +static inline void xe_vm_clear_validating(struct xe_vm *vm, bool
> > > allow_res_evict)
> > >  {
> > >  	if (vm && !allow_res_evict) {
> > > -		lockdep_unpin_lock(&xe_vm_resv(vm)->lock.base,
> > > cookie);
> > >  		/* Pairs with READ_ONCE in xe_vm_is_validating()
> > > */
> > >  		WRITE_ONCE(vm->validating, NULL);
> > >  	}
> > > -- 
> > > 2.50.1
> > > 
> 
