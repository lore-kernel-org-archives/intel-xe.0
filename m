Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 655A0CF6493
	for <intel-xe@archiver.kernel.org>; Sat, 28 Sep 2024 02:39:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B02C10E02A;
	Sat, 28 Sep 2024 02:39:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dVp8nvpO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ACD410E02A
 for <intel-xe@lists.freedesktop.org>; Sat, 28 Sep 2024 02:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727491178; x=1759027178;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=iQKc84jKtTddGe6n059qXM/InuUAKpxWsC267MXSpJ4=;
 b=dVp8nvpOeWmWskJnmEmQdysg5d7VL/SuXMr04HrwAiun5TPFVf5k2eTC
 HKHn+bJJMVyH4SD5bnNil2vkU9AP/6pZ3FTXXOc1TLK5ZVM+f/Pn9eqU6
 plnyRXUf4EcIcMbUT1e5M+8u/TpOruTgUfnhH4rybqTDJCvi3FS9ZHeKI
 Foc3ZxpGxelOQP3jDOVTzbgrjZGNqNdpQPEny3DpV+z8uv1gOZgpOPzvG
 hPYeRedoTJogNTxHvgUDh3mLzLAO5vZE39ogoFQBKFzrfIEZ4NCz44gvd
 JDiJ+0W2Uuxlia8V1ERIAtfjAGcNt9PsoiuR7brm0nuuyCgfrWA7ZMXt8 g==;
X-CSE-ConnectionGUID: bRBQvtXcRdy3uTKMWwkQFA==
X-CSE-MsgGUID: yRvzjHJyRtyBMBELnRMeFw==
X-IronPort-AV: E=McAfee;i="6700,10204,11208"; a="26776997"
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; d="scan'208";a="26776997"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2024 19:39:37 -0700
X-CSE-ConnectionGUID: zQjobDZoTASVR3dvOCjQQA==
X-CSE-MsgGUID: TykZLZISTdCXJzjo2k2ClA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; d="scan'208";a="73014748"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Sep 2024 19:39:37 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 27 Sep 2024 19:39:36 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 27 Sep 2024 19:39:36 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 27 Sep 2024 19:39:36 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 27 Sep 2024 19:39:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WHejmY9+/O1D9cn4tWEXV+rYaFGNdoMjnq0p+tEMXlihYQiY2UKbWtZTeyW+p8+CYBbge0cfQ/B+IEO1Es5onXkDjP3vpg2/7/RXKyFMe+8/ow11rzZ31NK6Td04jKBXZGud2vBIrB4wAJYRtMPC1KiYSRNUIauk6klc3UsqYg3AhJKAb1DNxSAB+pMNHOSgkKl+bsf8VkfddXPSfwfRP9p8MS8YLfyuHA0qzjpdGE/iOR3Aiw2Teh94QbbbuGUG4aTJWu6WsTaNgwM9fvDLksnRE0kq5oKjftvcTDyJM3kxj1/zvh7BfFtfqh3Mpvekd7r/WHNIwsFuLRerfuE2nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qgb93BYxjNrYEG8dDRKmo1AceCPNDfbMGV+PAJSCnws=;
 b=fnu4OIKc82ClyWeot34j1BMaCy9sGeAJuDmxw7NKB2jkw8WoRjk2tRwpPVhXNEyE73nTw6wDqScik4u3odI8sHW02hSJ+0q80bZc/tbF/A0DHQEYMwxoo71QdGasJ8nbuygmLbs1JTkMSW5671MY1NbAHGB/igGkD+dcY4vtvy4yBc8l2IlsI20EN7sB71eSnxAHg6sx8BJe1hRYL0wUK6ZLZzXFU+xVcZ79+U7UeoVgDgldtxIHcArjMGZqyNCcUdttRHtbdABBHdAjtlMtos8Ssv45+j/zdTwQ9NO862cCYCDJGejj5JrkDSbUWQHksJrP8CS1RdH/7vQ9yJr8+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by BY1PR11MB7984.namprd11.prod.outlook.com (2603:10b6:a03:531::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.24; Sat, 28 Sep
 2024 02:39:33 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8005.024; Sat, 28 Sep 2024
 02:39:33 +0000
Date: Sat, 28 Sep 2024 02:39:30 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: John Harrison <john.c.harrison@intel.com>
CC: Matthew Auld <matthew.auld@intel.com>, <intel-xe@lists.freedesktop.org>,
 Nirmoy Das <nirmoy.das@intel.com>
Subject: Re: [PATCH] drm/xe/guc_submit: improve schedule disable error logging
Message-ID: <ZvdsYgIucgb/Jqqf@DUT025-TGLU.fm.intel.com>
References: <20240927133535.548793-2-matthew.auld@intel.com>
 <e2f109e3-d34c-4461-bfda-910965a14ce9@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <e2f109e3-d34c-4461-bfda-910965a14ce9@intel.com>
X-ClientProxiedBy: SJ0PR03CA0163.namprd03.prod.outlook.com
 (2603:10b6:a03:338::18) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|BY1PR11MB7984:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e752a43-9b1f-4318-4257-08dcdf66c950
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?qJOz2BnzbyEL/vxAxPG903MlVWwC3QoK6f7nZSVjlOj06LUZKzIC7ynamGNN?=
 =?us-ascii?Q?gptDmr9/RFXokE0rpkS9Cral3zKFXBlgYDbzvshLrMMqEVToVDucxvSWOe1r?=
 =?us-ascii?Q?ilFysTpCpqo7aoMSJ7H7sbVn09t4b2nKNe7CdhD5grkZcKUSD0oX23rsU5w4?=
 =?us-ascii?Q?FkaEbUFneVCpoBIK8NPFJDu5wMgIYEOl5e6+VirJ50ManzScxjanTn6+CZqo?=
 =?us-ascii?Q?j3LD74NDO4v8ELUKCHIWvXGTBePmsmrYcnL+mkHqmQKZ7xok6ZpylC5ZcNt+?=
 =?us-ascii?Q?hKZ1gJ2398iEHD92jg37NkdRPu+I4rCm/rXDfBZVjHjBWvcgMLrW5xQPNWjm?=
 =?us-ascii?Q?txphJypqaaRCv0jDwfWOBECdFunEhLv1UMSxrhy7Ra7VJ9uODK9pDVVn4JRe?=
 =?us-ascii?Q?2I9Qez/zcUmfnBKLXOTo2IYoF0qDYi2V9rdoTnCDyUQQ7Pa4BGE1BgXgfbPJ?=
 =?us-ascii?Q?dELCTmGghs/dKd1O0RnqSD6StcqlfRtB9LYPcw8kpMnYjtP7cDfQMFACCMjz?=
 =?us-ascii?Q?P8dnrK9JY764L6BPV/96trBhHj0XMSlQJyjLcr4bE3G5AXI1+tMJ0ptJpKKG?=
 =?us-ascii?Q?QIxSzD2j7ZR7NBU2ABNzpnAwi18DzopcbOElwVbAyrwAX1LYLQXw0jyCtsB6?=
 =?us-ascii?Q?MRs3VNrlRXAfMZj8mPCxW/V/dnJVSgzvL2nTXNnfHS0/WxIc/zPyx0RRnk0C?=
 =?us-ascii?Q?niC9vs9fRDw/h7X2bgvWrFKFv1yp0tPKljbiLdVUa3GRtWy+v3Y4iSZ79DmZ?=
 =?us-ascii?Q?3Is7oko4JyRH59WVnVmFyLo1BkSk0V1k+lVos2NW0LdgosHokTM6xOSInIKr?=
 =?us-ascii?Q?6o73++tezkZHlpwBgy6pUZXtAFAwfNzIhV6lohgJFI5zlqwpkiKQ70AaKFHf?=
 =?us-ascii?Q?FPLzjsS+NQe17KT0p58i6FK9QGQ7ohcsNTtGvn29DQokKmPA6bsWuhw+Mb/J?=
 =?us-ascii?Q?UAJxfnEkBpZnceB/PrxQApTSVxDHua96U/HAAR808n8Ila1fZKR4PDb/AMIe?=
 =?us-ascii?Q?funn1rlHC6jQ0WAEr2VmYvgbX5vo0fP/47l5Yq4dCMPd3JRQMAD4+x848PhR?=
 =?us-ascii?Q?E8RrZMxmSsaY4gnvKpcYXTWRGa0w7UXgVfvwlYZ4uQFwqbSbYDw6CSm6A6sI?=
 =?us-ascii?Q?eRJ4/l2hD3VWGuufheotiSfXZ1c1Cps9WBe140WLtCdM/rvYk9miXaRvxmDf?=
 =?us-ascii?Q?mrOijtvb8GKANWcoidGTrl1PFMyvZUz0LiUCFPCBytei0yrAkBUOclNHTlg?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BAciDxes0CER7ZcbZvmIoMhXvbjZY14bhnqQnYipqb2fRwf0AYQYrmM12YvP?=
 =?us-ascii?Q?y/MUDrjaWrhO88sB5smlr6dNq3rMSQbQ1XbQK17m8TeQooWxtdikTW8yxi9r?=
 =?us-ascii?Q?sVGO11aLb/fzevP5nnT/COpm+INNrLeln6jHpsOduf768yXRl62/9fkttaG2?=
 =?us-ascii?Q?svtxjmaW9qGh2VUNCjvXmz0/L9tDVWMyudUsAVDzMornsRlkmgwcpC95bQtR?=
 =?us-ascii?Q?5xVxHU5Vwe90uy9KDjDElbqA5O/dfScfnKg4v2GdWbwopJJ3cOA3vpDEFarJ?=
 =?us-ascii?Q?aW/+rxjZOhtcveteV4dVIv/8uWVZdQzsSAOn4KqzSzAdlKN+joBzemoxCkPX?=
 =?us-ascii?Q?g+ohky3jt47EY+Uvs7F7z/hFhdRseDnlzyr/IHeWPwiZwXecJJHeRrCgvnT5?=
 =?us-ascii?Q?272PI4LFkoiz9La36g5PYAlfRcrwwodYkdG/Pff0CelrNeNt962eN/ssefFV?=
 =?us-ascii?Q?Fpn6h1EhYBAJY1DBtlhioAUWP6eP1wiUiQtG+FcXN5Fbr30UVXDGkGA0NQPs?=
 =?us-ascii?Q?sSJvNRBbAfOh8Dv6LQYo3p9rTpIA+aaYiHCk5ENTGkz8aLILvbQzGKPlC9nd?=
 =?us-ascii?Q?xeCXuku+2AKkQlTKX/4VA4WpVblj31ZV8QNTcMPTCJqhbn4HKpV738kFjMPK?=
 =?us-ascii?Q?m4UviDGs2aJTdR63f+G7azSFjUI3x6wym7cQXwdBmHcpBpMFnGAdJC+I6kWE?=
 =?us-ascii?Q?eV9vRuReef0rQwJPJPorWa5V3BoVhw5HR3hsAHsd8b5fJR6gN9Kcnrsk+yae?=
 =?us-ascii?Q?uYkMTpuKwftMvokhG6cgeEASECIZEfaeEzAwYSu7RPyQYa91oIPXdk371hbH?=
 =?us-ascii?Q?byJbd0Cxi/Ly3ebOO1EsH+edKaZZDGADBLeoqyFoGEg8y6d7pzLWtc1PbJKy?=
 =?us-ascii?Q?z+vROQA0g/LwC9F96BwRTMcZPVG5y5senqHWKtNDp4mIiQtzVJqOx12i2DyK?=
 =?us-ascii?Q?3fKirM4f2RcXa4NtJimIc4279/hFMHVlhG8qFLheYaTSmk8g+LFkCEKMZIi2?=
 =?us-ascii?Q?1rAd7GXRVEUvPQUwWNl14r+lBh8TD49knSonWeRvVu+WFo1wxC13JKWbhp7f?=
 =?us-ascii?Q?sg+3SoY3TM+ExY8Ri3xS4BuY7k0QHKFA/+x2mO53w1nMi6uSUfXX7BCKL/mv?=
 =?us-ascii?Q?vrEFJNXSkH0NFb9yzibX3xE3Zlk2n4TTWjFXEZvzxXzaWA4mKhe3H9byrElx?=
 =?us-ascii?Q?gdHB7aZnWeQHvDTkN2+5jzQ6bQQBDbwAbFpJe4QMYhxSRv2oSq6ZFaKakV8r?=
 =?us-ascii?Q?wsSUMEgPeRV+UNdNeB6CpXSOgALHknhaAhpZBYst5czI13nZDfxMr5fX38bW?=
 =?us-ascii?Q?aMhJO3Ww0GV4qc1NGIDQHzcmPkQE1MZk9ANwRrABNqapmzNujRm3stc7PxfO?=
 =?us-ascii?Q?pjgL11sH7hwsJRQyfQGqmW7jUsD50rdcmIKja26IjzlGb9yE4+nHUG3r/a+H?=
 =?us-ascii?Q?S0jt9eZY06x6uyf1feHWfTNazyZYD1zAlxRdVuiesJC3BO1ZcJgYRBnO86KQ?=
 =?us-ascii?Q?J+lo/pRFAqERvpHDE2EB1jXColk5P7rZMy5qsoh0OV52HrPHYg7ibr46aKbB?=
 =?us-ascii?Q?YBViezBiOTszry9F72FMSWg3Y5K13pksZlJnM+viuOkezESCumOsC42oYwch?=
 =?us-ascii?Q?Jw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e752a43-9b1f-4318-4257-08dcdf66c950
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2024 02:39:33.7992 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: difoK2jZeXxCuFEeM0Ger0NTBVMyXiIJFB/ZBizATtnq4X1ZAHKYDrdw6Qmh9kdszZTCzoPTlbyomYhNeNFYzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB7984
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

On Fri, Sep 27, 2024 at 04:05:48PM -0700, John Harrison wrote:
> On 9/27/2024 06:35, Matthew Auld wrote:
> > A few things here. Make the two prints consistent (and distinct), print
> > the guc_id, and finally dump the CT queues. It should be possible to
> > spot the guc_id in the CT queue dump, and for example see that host side
> > has yet to process the response for the schedule disable, or see that
> > GuC is yet to send it, to help narrow things down if we trigger the
> > timeout.
> Where are you seeing these failures? Is there an understanding of why? Or is
> this patch basically a "we have no idea what is going on, so get better logs
> out of CI" type thing? In which case you really want is to generate a
> devcoredump (with my debug improvements patch set to include the GuC log and
> such like) and to get CI to give you the core dumps back.
> 

I missed the CT dump in this patch, yea that is a little suspect and
probably would be best to leave that to devcoredrmp. IIRC CI really
doesn't like spamming dmesg.

> And maybe this is related to the fix from Badal: "drm/xe/guc: In
> guc_ct_send_recv flush g2h worker if g2h resp times out"? We have seen
> problems where the worker is simply not getting to run before the timeout
> expires.
> 

I asked on Badal's patch but will ask here too. You have really seen
worker simply not getting run for 1 sec? That is big problem and points
to we really some large issue how we use work queues in Xe. I don't
think Badal's patch is the solution - we really need to root cause how
that is happening and if we have some architectural in Xe related to
work queues, fix them.

Matt

> John.
> 
> > 
> > References: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1638
> > Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Cc: Nirmoy Das <nirmoy.das@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_guc_submit.c | 17 ++++++++++++++---
> >   1 file changed, 14 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > index 80062e1d3f66..52ed7c0043f9 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > @@ -977,7 +977,12 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
> >   					 !exec_queue_pending_disable(q) ||
> >   					 guc_read_stopped(guc), HZ * 5);
> >   		if (!ret) {
> > -			drm_warn(&xe->drm, "Schedule disable failed to respond");
> > +			struct xe_gt *gt = guc_to_gt(guc);
> > +			struct drm_printer p = xe_gt_err_printer(gt);
> > +
> > +			xe_gt_warn(gt, "%s schedule disable failed to respond guc_id=%d",
> > +				   __func__, ge->id);
> > +			xe_guc_ct_print(&guc->ct, &p, false);
> >   			xe_sched_submission_start(sched);
> >   			xe_gt_reset_async(q->gt);
> >   			return;
> > @@ -1177,8 +1182,14 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> >   					 guc_read_stopped(guc), HZ * 5);
> >   		if (!ret || guc_read_stopped(guc)) {
> >   trigger_reset:
> > -			if (!ret)
> > -				xe_gt_warn(guc_to_gt(guc), "Schedule disable failed to respond");
> > +			if (!ret) {
> > +				struct xe_gt *gt = guc_to_gt(guc);
> > +				struct drm_printer p = xe_gt_err_printer(gt);
> > +
> > +				xe_gt_warn(gt, "%s schedule disable failed to respond guc_id=%d",
> > +					   __func__, q->guc->id);
> > +				xe_guc_ct_print(&guc->ct, &p, true);
> > +			}
> >   			set_exec_queue_extra_ref(q);
> >   			xe_exec_queue_get(q);	/* GT reset owns this */
> >   			set_exec_queue_banned(q);
> 
