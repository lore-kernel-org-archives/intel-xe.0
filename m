Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7CE9D1CDAB
	for <intel-xe@archiver.kernel.org>; Thu,  4 Dec 2025 01:20:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79AA410E19C;
	Thu,  4 Dec 2025 01:20:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FSfP9EnT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3847210E19C
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Dec 2025 01:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764811243; x=1796347243;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=vTh2umppSnz7SL6NaQ+g502XyRZ3e9t2NQ+jor9v16A=;
 b=FSfP9EnTOuqZi2c4FcJ8IM1IlublG8VDTRO0K0x7bdoHWa5kS1Zwn4uK
 SAjF/hYcRBe6aoATUrhYdnHg7weKf+xd51Kc+sUH7U6bjS1GnRKKobTB6
 znkqve2OKOoEhi3ZYmo0FeUu9kpNdy0Xpxk2TPuk2+ns3dDLLNbPgUSmX
 OXRkewj36VLXyLVPLRGZhnia7f4AusLqTeiHNCTrgoHSURsTsYhvkEAdj
 T6247zMTfejhPMzls2s97Gi2yywLMUPhlr5oNMby9e36BNNIG9Ieqcm8C
 rBf/SRK//moDUlL18rU2nHCUm6N8K8kdufJLSU8kuMXW5JL7s0Qfy5O6Y A==;
X-CSE-ConnectionGUID: YEZqGBkySt+vzSK2I4JgSw==
X-CSE-MsgGUID: Y+2q5cTmRnWCVgcpPEbbDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="78292227"
X-IronPort-AV: E=Sophos;i="6.20,247,1758610800"; d="scan'208";a="78292227"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2025 17:20:42 -0800
X-CSE-ConnectionGUID: mkRsS//+R4ynoxD8fjSyvQ==
X-CSE-MsgGUID: +0kCVr5BQHeM+irwAb1QFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,247,1758610800"; d="scan'208";a="194131487"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2025 17:20:42 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 3 Dec 2025 17:20:40 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 3 Dec 2025 17:20:40 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.58) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 3 Dec 2025 17:20:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uRkipW6kkvddeZbcJr8M9EpZ01/6B715J0wiM7wryQCkQrdydmZc+o+Ly5n9kj2amkXMKp4Q0EWBW8eS4/qHB9FymYtagQIfCZYwP6jW44WyJHhQ9JL5ntZHlqD/oCkUt5vudHYaTOXsp0ew6fSovdRwACmXcNrT0heelA46y9HMh6jXIC9AOs5K9lin7f4T+1Ibzdyb0jow03HjpDSE6CRB/BMYKGSeO7pzoi1WUD20dZw25cjhuHdaOl2Pa0AcxeKpFE3JyeSBIzN7xOtNN7EmNpC3H0+y1TInkR5wB8AzEym0wzITVHLeeFPaXdjaeVKNIF8a5HxR9YMpLMUZow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UL16T+k7GdWyCESaK74qzoKcj4yba77YghPFiqYiNLY=;
 b=vRkpfgWBlJu1eBzn9PzTBqmLfsUTNAz/vcwV9pKNBb6TDBbWPc5KFxnxRAWK5DJlIV9HkSRbfsHcWNeQvXtS4NpAUGKGr024wcalF+sEvg/EBJlmsB6Bm/c65sZ1u/qYbUPkiaBzcO2g1E7Wp418odIuL6DV4pbKn82jfqzPZH/F2VoX869KfhlB+tjKaJcwl1BZ9vPzZwBPrJCU2jNWdaENnN/QcqS1OjzO5VMnUoXzwDadS6rc5pGWbbgbES9ufbMHPkbZk/nj5qcyWXhu2ckkGQWKXUq3A5k4jF0wekI3A893tbBuCXlFf/QHxIDPPoBZHrxozTVD6Ry7QYyd2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY8PR11MB7873.namprd11.prod.outlook.com (2603:10b6:930:79::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Thu, 4 Dec
 2025 01:20:33 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9388.003; Thu, 4 Dec 2025
 01:20:33 +0000
Date: Wed, 3 Dec 2025 17:20:31 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: "Nguyen, Brian3" <brian3.nguyen@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Upadhyay, Tejas" <tejas.upadhyay@intel.com>, "Lin, Shuicheng"
 <shuicheng.lin@intel.com>, "Summers, Stuart" <stuart.summers@intel.com>,
 "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>
Subject: Re: [PATCH v2 08/11] drm/xe: Prep page reclaim in tlb inval job
Message-ID: <aTDh3/SkCvIgj3yg@lstrano-desk.jf.intel.com>
References: <20251126230201.3782788-13-brian3.nguyen@intel.com>
 <20251126230201.3782788-21-brian3.nguyen@intel.com>
 <aTDEIK/L+Qc4faWw@lstrano-desk.jf.intel.com>
 <SA1PR11MB8839E3FBDEFCCF05D27F757BAAA6A@SA1PR11MB8839.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <SA1PR11MB8839E3FBDEFCCF05D27F757BAAA6A@SA1PR11MB8839.namprd11.prod.outlook.com>
X-ClientProxiedBy: MW4PR04CA0257.namprd04.prod.outlook.com
 (2603:10b6:303:88::22) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY8PR11MB7873:EE_
X-MS-Office365-Filtering-Correlation-Id: 131aacac-b254-4bdc-0360-08de32d35250
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?7S9/Ug+bYRBzWqt0BWUt6rl7bBoDrmQAvoLphJhU/jPVTpYNQ0DBJ8JqV8Cz?=
 =?us-ascii?Q?Ga9dyxRgkERJEXJ6Af+TgModXk3q0VL7EnLPWPmSHs/DAnQ0SdMsqVv9jCYO?=
 =?us-ascii?Q?LY95MG5XW6TX/Uy2ijIUWVZVCePbRAfkJ510lcTMJwzPbnEYgJz2myzTvsRG?=
 =?us-ascii?Q?h9cMY+vLjns9dLwAVOtM6K6AvkSM5dKBkGyNivlHn1L8QJgF31Y5KfDUgwMh?=
 =?us-ascii?Q?uGKK4VhjZd4B90hz9AIZYK9Ki58VBi16mrsKiNFKy/8GZmJgy5sCcIPujS6I?=
 =?us-ascii?Q?4/KGvs9PPvT4pS3tmAe8iSkqjWtFm5oiR0607UPA82RxMSBorC9FVhCFkOLR?=
 =?us-ascii?Q?DPuxYX9ElmA5JXBIJ0PA24YQBVkMnW/DAwYhhdFIYu5G3/mUHziKgM75nmv0?=
 =?us-ascii?Q?dR0FIkB7QEJ0IEUEd1n7+0eG2x1tOsGHHoY3e/JhRe4jalXmfh5yBml6FsTZ?=
 =?us-ascii?Q?IBghy1vR9g+h1fNtSi9z/vxJxZ2wedMbDbcSsw527fBroZjgBvdDQ1OEXOgb?=
 =?us-ascii?Q?E2+v79ZfJ7m4TFNVHgO99cjR/lR4itCQVi+Au8aEHFgG/ICAah3aw9sX7d2v?=
 =?us-ascii?Q?VAKkpGHNjIKNOOLcVm8klzPBQASxoPekDD1+KyfkDozmreAKGGXyd19kcxet?=
 =?us-ascii?Q?UbK+k2na4i5rP2eP5kq94bXCF1M3+q+7gOXB9AGIudQxumcG/7RelUJHQLxT?=
 =?us-ascii?Q?kNUSRGkH8vkgcPDglP8V2WknNBDkuV6Zj34cbXaH6YANBaRs+BchXti6zv/c?=
 =?us-ascii?Q?REzf/sonrO2eR2Y/M1CCnMmmdQ6Z/V9M/+AOvcw3rVBgSB/CUBu+Cqi99jV2?=
 =?us-ascii?Q?YK9OXKxGmVQ4Ew6ptummoqRiJkqjUxJo07w9Q+OWNQe/Fi2/tLg/cwtQjCzf?=
 =?us-ascii?Q?6VS1XtyM9sTLedhaXnoC6QkwNRUKftaYbc6Mk7tDInXEOf6iOaQFbkSSiJY+?=
 =?us-ascii?Q?cX+3HtUNU0s5BsCvehwdVjigwHinifT43JviH+BdcS8Wz8/DBCu1k12b2lve?=
 =?us-ascii?Q?z57YZ6axeL+XPccscvrlfsVIaHcBKDreKrKD2P1Rz7lQpNFl9F6mspwFiDK/?=
 =?us-ascii?Q?MAzNiq4WkmRWGnowQ8/Y7htbBq9eMHjF3KUFJ9SJjvzbxU3yuW1hwQqs/9ml?=
 =?us-ascii?Q?mXb8KxtrqXY1Bp5wQp9Rpj6lvnd4UWWR2/Jirb4Q6fXxU9K+9QjSntpSzptO?=
 =?us-ascii?Q?9rXTCFS8epHQXICFp8BzL5avEF75QOrb6ZaCqj2BLVwbvoSZTpSq3x9wsCvD?=
 =?us-ascii?Q?kUqaXUBQsB29VpMorsSsdqLUiQlxzM0xi1S7+A9hpBjOZZzyJqtBT0a9Qv3z?=
 =?us-ascii?Q?8dNPJE9RzRnoojPYgJOLRhM5SkHG37rAlq+kv2QUXTzWJNrsye5Dtr9PuS+q?=
 =?us-ascii?Q?pO7KZ0aDxDy3xVbM9iziiyVVZqINq2nzGh1bCcLupthcsTCx/gct5CYFNoYN?=
 =?us-ascii?Q?hlZvoLkJ/fIOw2Z1Cpq/bMDAEXISrgTY?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5EpDvFAtbyJyYr0Sy+U91XlQcxaBiIysVJzfoS8B8K7KO8cltuFTMEy7PMaR?=
 =?us-ascii?Q?b/PKtf2V6aqJL+wG2Zh8YKC43uaKVttEuqdCjYTKA3lBWL9x1C4kbqbv5a7H?=
 =?us-ascii?Q?ZpBZS+4cJkxagyg1kjHGuHb5I5mGdefqrgWdKIhpE3Wwsx9YZF+g4HB76/JY?=
 =?us-ascii?Q?HDRtLxLvik1pMRmK3/PPbQr5rqd0jOBvBT6qOPkApdrNAb1gRC9uztiD3G9+?=
 =?us-ascii?Q?7Rm08DvWxWvT6i89DmznqDcOdyZlf92iGB9h0TbftZqcEPL9gSibUrPa/Dcd?=
 =?us-ascii?Q?zpROXg9tOnG8Z3vP6gt24R2Srq/hjtebEkBKwoX443t0IjwZyQqE0lUqBzB9?=
 =?us-ascii?Q?E5DuAVo71N3/xwHobB28Q5p2z2sDdABcdA+xCKz2fm6txiSV1reuGmY8qyih?=
 =?us-ascii?Q?ufzzsa5iL8EL7Pjgr2IjziMUhfoelVklNDqvl2xNRvrzIpWI6NhREcpMgd4Y?=
 =?us-ascii?Q?h/wJcqqhbVRAEA2vX2Go6yURcJ0bUrAoxua9uEADrphvIOBNIwYLnQaXNPy9?=
 =?us-ascii?Q?2cgSXwIkLRXpj0gMgCQ+WzV8eBoh6Lz5AA29sXFl4HhO5acI4DLNzK1xm2NP?=
 =?us-ascii?Q?TDcgfGCqIDMy6Y1lAyncz/O3sbVhtqUdwJ52MkxVWXf/oojf5xTq19tswnwR?=
 =?us-ascii?Q?nR7AmHPeqrppCwfWgminjm806N3fDN5YZvEGpANKMab2awbxRfEALpGg7Wsx?=
 =?us-ascii?Q?CC0Nuk0NLgFqNkwmxQVh8o1wkCmkMl9mC6Ya7JBH4yc6VXAwSFlIZHmqKczL?=
 =?us-ascii?Q?S0AtbHFHgyVFNu8tQijK0h77FsFCPdE2qRYlSlE/2BQf/BMBQg6vuaBcOZom?=
 =?us-ascii?Q?Eep20Pi2G0u3r0d5JKSPSODSnP1yyyXGLy+FhOOapCJaUcf4LXlyPVwATKdh?=
 =?us-ascii?Q?Prui1hXHGhQAOEWVp8i04WeEq+L611fFQP+4sXyG/9Aqp5MoL/kv6/ScUkCb?=
 =?us-ascii?Q?OSKsB1OC8N2xobTfRShlx0OdPyrXJqrhuA4SrYF4GZuoCfMoAdLF7RseGEpJ?=
 =?us-ascii?Q?rxmdPcsc9AmJ5Ff6zzvijnhoRG+aMvRHYxgCofmmIAATnxIva5CzcPmvhuPB?=
 =?us-ascii?Q?4APZs9o8CM/+L3ZUyOOZcC9oWYp7B8mWWvMhi1tJ0Z9BkMB4RcbsRBHaeTdy?=
 =?us-ascii?Q?T9V9GVbnYw+YFx19KHFekgzoDqZCAJhKEEf0LqDewMpaHWRKpTyabifz6v1U?=
 =?us-ascii?Q?l9tXzOMa9nVDBTeZnaGA4gN5kb/nRW/tWOK5OU3Mm58UzAk789R3lSOVExzW?=
 =?us-ascii?Q?gY3+JFCb771+l4VkXnLiyddIStUg/J7hecTwOdUbAeAhaEcMUmNcsF/yAG62?=
 =?us-ascii?Q?aw/8l4fTNZXATCto4qFbsPbe05WiLXhW3pWknAgcrP/MS9wOM6+8/JTSGZV1?=
 =?us-ascii?Q?Sl7tTJA5ICtkBCiRw60B3uirVPcxWJBOCEBeFVMyvlwa6Dyur48pnRN1xH5I?=
 =?us-ascii?Q?KgwZYduGe8ZTldjoJVTbwnXIKBaH5ROUKzP5D8gy4HxNKu6neK6QYhqiGYoB?=
 =?us-ascii?Q?d3SNedKgBhZjGO8D8zsjJnOTRGOQ0U5zbXAGphzbamqUwB9nD2WI4BwB/hPy?=
 =?us-ascii?Q?kl/U53NCLz+tVLXKJa61Zpv/NPkiplMlTATYUzgXZsdiUyIk/IYIOqGi2y84?=
 =?us-ascii?Q?Bg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 131aacac-b254-4bdc-0360-08de32d35250
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 01:20:33.4726 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Sg0qdYu3f32bSxGkAADCx5P2MmsY/ZwJsriayzKxpHcGsY+V6Bg2143tdKa/OC4o0gzsY7hnEFjgGnCmHLLhqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7873
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

On Wed, Dec 03, 2025 at 05:22:10PM -0700, Nguyen, Brian3 wrote:
> On Wednesday, December 3, 2025 3:14 PM, Matthew Brost wrote:
> > On Thu, Nov 27, 2025 at 07:02:09AM +0800, Brian Nguyen wrote:
> > > Use page reclaim list as indicator if page reclaim action is desired
> > > and pass it to tlb inval fence to handle.
> > >
> > > Job will need to maintain its own embedded copy to ensure lifetime of
> > > PRL exist until job has run.
> > >
> > > v2:
> > >  - Use xe variant of WARN_ON (Michal)
> > >
> > > Signed-off-by: Brian Nguyen <brian3.nguyen@intel.com>
> > > Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_pt.c            |  6 ++++++
> > >  drivers/gpu/drm/xe/xe_tlb_inval_job.c | 26 ++++++++++++++++++++++++++
> > > drivers/gpu/drm/xe/xe_tlb_inval_job.h |  4 ++++
> > >  3 files changed, 36 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> > > index 347b111dc097..833d6762dd8d 100644
> > > --- a/drivers/gpu/drm/xe/xe_pt.c
> > > +++ b/drivers/gpu/drm/xe/xe_pt.c
> > > @@ -2498,6 +2498,12 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
> > >  			goto kill_vm_tile1;
> > >  		}
> > >  		update.ijob = ijob;
> > > +		if (pt_update_ops->prl.num_entries != XE_PAGE_RECLAIM_INVALID_LIST) {
> > > +			xe_tlb_inval_job_add_page_reclaim(ijob, &pt_update_ops->prl);
> > > +			/* Release ref from alloc, job will now handle it */
> > > +			xe_page_reclaim_entries_put(pt_update_ops->prl.entries);
> > > +			pt_update_ops->prl.entries = NULL;
> > > +		}
> > 
> > Do we not need to do this on the media-GT? Or is issuing PRL a single GuC sufficient?
> > 
> > Everything else looks good.
> > 
> 
> It should be sufficient per tile. KMD will request GuC FW per tile and afterwards GuC FW will
> issue Page Reclamation to all the primary XeTLBs, for GT and media within the tile.
> 
> However, I realize that this means we should be disabling PPC flush for media TLB invalidation
> otherwise, it will conflict and do a PPC flush anyway. Will have to rework some of the logic
> to handle this if so... Taking another look at this.

Yes, that's a good catch and would've missed this part. Now I'm
wondering if on upstream devices if flushing the PPC cache on both
primary GT and media GT is really neeeded. If not, this might be small
perf win.

Matt

> 
> Brian
> 
> > Matt
> > 
> > >
> > >  		if (tile->media_gt) {
> > >  			dep_scheduler = to_dep_scheduler(q, tile->media_gt); diff --git
> > > a/drivers/gpu/drm/xe/xe_tlb_inval_job.c
> > > b/drivers/gpu/drm/xe/xe_tlb_inval_job.c
> > > index dbd3171fff12..2185f42b9644 100644
> > > --- a/drivers/gpu/drm/xe/xe_tlb_inval_job.c
> > > +++ b/drivers/gpu/drm/xe/xe_tlb_inval_job.c
> > > @@ -7,7 +7,9 @@
> > >  #include "xe_dep_job_types.h"
> > >  #include "xe_dep_scheduler.h"
> > >  #include "xe_exec_queue.h"
> > > +#include "xe_gt_printk.h"
> > >  #include "xe_gt_types.h"
> > > +#include "xe_page_reclaim.h"
> > >  #include "xe_tlb_inval.h"
> > >  #include "xe_tlb_inval_job.h"
> > >  #include "xe_migrate.h"
> > > @@ -116,6 +118,7 @@ xe_tlb_inval_job_create(struct xe_exec_queue *q, struct xe_tlb_inval *tlb_inval,
> > >  	job->start = start;
> > >  	job->end = end;
> > >  	job->fence_armed = false;
> > > +	xe_page_reclaim_list_init(&job->prl);
> > >  	job->dep.ops = &dep_job_ops;
> > >  	job->type = type;
> > >  	kref_init(&job->refcount);
> > > @@ -149,6 +152,25 @@ xe_tlb_inval_job_create(struct xe_exec_queue *q, struct xe_tlb_inval *tlb_inval,
> > >  	return ERR_PTR(err);
> > >  }
> > >
> > > +/**
> > > + * xe_tlb_inval_job_add_page_reclaim() - Embed PRL into a TLB job
> > > + * @job: TLB invalidation job that may trigger reclamation
> > > + * @prl: Page reclaim list populated during unbind
> > > + *
> > > + * Copies @prl into the job and takes an extra reference to the entry
> > > +page so
> > > + * ownership can transfer to the TLB fence when the job is pushed.
> > > + */
> > > +void xe_tlb_inval_job_add_page_reclaim(struct xe_tlb_inval_job *job,
> > > +				       struct xe_page_reclaim_list *prl) {
> > > +	struct xe_device *xe = gt_to_xe(job->q->gt);
> > > +
> > > +	xe_gt_WARN_ON(job->q->gt, !xe->info.has_page_reclaim_hw_assist);
> > > +	job->prl = *prl;
> > > +	/* Pair with put after bo creation */
> > > +	xe_page_reclaim_entries_get(job->prl.entries);
> > > +}
> > > +
> > >  static void xe_tlb_inval_job_destroy(struct kref *ref)  {
> > >  	struct xe_tlb_inval_job *job = container_of(ref, typeof(*job), @@
> > > -159,6 +181,10 @@ static void xe_tlb_inval_job_destroy(struct kref *ref)
> > >  	struct xe_device *xe = gt_to_xe(q->gt);
> > >  	struct xe_vm *vm = job->vm;
> > >
> > > +	/* BO creation retains a copy (if used), so no longer needed */
> > > +	if (job->prl.entries)
> > > +		xe_page_reclaim_entries_put(job->prl.entries);
> > > +
> > >  	if (!job->fence_armed)
> > >  		kfree(ifence);
> > >  	else
> > > diff --git a/drivers/gpu/drm/xe/xe_tlb_inval_job.h
> > > b/drivers/gpu/drm/xe/xe_tlb_inval_job.h
> > > index 4d6df1a6c6ca..03d6e21cd611 100644
> > > --- a/drivers/gpu/drm/xe/xe_tlb_inval_job.h
> > > +++ b/drivers/gpu/drm/xe/xe_tlb_inval_job.h
> > > @@ -12,6 +12,7 @@ struct dma_fence;
> > >  struct xe_dep_scheduler;
> > >  struct xe_exec_queue;
> > >  struct xe_migrate;
> > > +struct xe_page_reclaim_list;
> > >  struct xe_tlb_inval;
> > >  struct xe_tlb_inval_job;
> > >  struct xe_vm;
> > > @@ -21,6 +22,9 @@ xe_tlb_inval_job_create(struct xe_exec_queue *q, struct xe_tlb_inval *tlb_inval,
> > >  			struct xe_dep_scheduler *dep_scheduler,
> > >  			struct xe_vm *vm, u64 start, u64 end, int type);
> > >
> > > +void xe_tlb_inval_job_add_page_reclaim(struct xe_tlb_inval_job *job,
> > > +				       struct xe_page_reclaim_list *prl);
> > > +
> > >  int xe_tlb_inval_job_alloc_dep(struct xe_tlb_inval_job *job);
> > >
> > >  struct dma_fence *xe_tlb_inval_job_push(struct xe_tlb_inval_job *job,
> > > --
> > > 2.52.0
> > >
