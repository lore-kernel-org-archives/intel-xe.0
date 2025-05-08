Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AFDFC3ABC5
	for <intel-xe@archiver.kernel.org>; Thu,  8 May 2025 21:59:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AD5810E21B;
	Thu,  8 May 2025 21:59:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zh+XcGra";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6A5110E21B
 for <intel-xe@lists.freedesktop.org>; Thu,  8 May 2025 21:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746741555; x=1778277555;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=fgFLuxV/7eY96EZulL47e04pct0/qlA4UHICGe5c8pA=;
 b=Zh+XcGrauw3PDo8Ca7ug+h6lszgjCF4BlCy97jZ3zdKtQFHrydQhWWr4
 fScBjOTIoeqiIQRcGPhJkKJjiRi5sWO17B5O2TBoc1v8STSjcUFJRRQcj
 N5dPx6NWfH2mIVjm4CHyIVJQ6RnPnrQR0kho6vLHo71ypvWU71RKseNBZ
 TGQqcfaKQHq4Dxl8UKDVlnebweHfT6RCTaXcK3JtrKEQ6fSVl41to/dNE
 D6qMONFLQPbPo2uFDC5pAgJrqAMeAUM2Tn+KGsTyJjGOfle/1fEL8PQOa
 q2ofFxmvfcgpIMOYmFEmyDluw4IICqOdRFrVh+XGvPaoMs7gEM4z/rcoL A==;
X-CSE-ConnectionGUID: mM+ssi3zSiCj6EbEHEGN5Q==
X-CSE-MsgGUID: s+WQ73+ZSmGk/QzHlNfl1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="59183514"
X-IronPort-AV: E=Sophos;i="6.15,273,1739865600"; d="scan'208";a="59183514"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2025 14:59:13 -0700
X-CSE-ConnectionGUID: VIuSua3mSr+rB8WUOYFyrA==
X-CSE-MsgGUID: +Lc1c2F9RRadwh7hHRVjhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,273,1739865600"; d="scan'208";a="167361751"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2025 14:59:12 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 8 May 2025 14:59:11 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 8 May 2025 14:59:11 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 8 May 2025 14:59:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pPjp8TBbFg8OdLvcMKLDg6am9Jz9h04vFAX7hBzFZi+sRnHtEcIrNJYN4WFjO27K5OylNNPE3Mj1uPrKUIAbeCn5Fx78VmenxYSYxdRd6NstobJdqWLB0jhCP49c9HTgDXXB6iHgfoQ/8eY7LkyNKS/IXhk9k9K9vl+K8lKry6vKZkhmrt5bhaednSacDlVnMz4axu5xKu6E7UE6FsveSclNp4dhbJtBAJwZJiGdcnjZlpO1Izr6J0lDvtWXybG4Up5OsouaBh8ao4oL4OnkFTCoq/Ch3VILvb4DjQ9SY2xNugI3rwLKuugIbTL31tK3BMf9k88Pmwwvkx7B2IdMAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TE+/WkrWRW3N1CmO+QIrGmH6VGbSx27nM0OhuI9XZuA=;
 b=qFNzL+paKn22B51HBsUt6dk0qT7/0EQ70abUg6SnkZ9Nb7tqQ48hhZrFT/BHg073woiq1yxKRdJnKY4oylHGoqbMpF1jb/vrJ4rOhF857zZSgNwpoVYfGexOwPx5c8vaO6WOPquQGtlo8qhbD5567rn3i8sDSMASfQWoKCUNulVRA8UGmR0m8xVfbjJJ+YETCplkT4vRbCukhV6y/CjQfTtvFr3fOYHm/NgGt+LYTp8JIl3RvO1Cy/cGtLYmxdYcjvowAMqeCWyrPZYVRkisUrYQoZrWQi09gmEfFDvGZSAo4Sms+ZvqmZM/7BRW3zpVS1s9ySRnAFEKtb/N/27X2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW4PR11MB7101.namprd11.prod.outlook.com (2603:10b6:303:219::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.23; Thu, 8 May
 2025 21:58:41 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8699.026; Thu, 8 May 2025
 21:58:41 +0000
Date: Thu, 8 May 2025 15:00:06 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Do not print engine reset message on a killed
 queue
Message-ID: <aB0pZmcGVFHSRb6y@lstrano-desk.jf.intel.com>
References: <20250508190920.1343610-1-matthew.brost@intel.com>
 <CH0PR11MB5444B702AA6676DCAAD5BA49E58BA@CH0PR11MB5444.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CH0PR11MB5444B702AA6676DCAAD5BA49E58BA@CH0PR11MB5444.namprd11.prod.outlook.com>
X-ClientProxiedBy: MW4PR04CA0185.namprd04.prod.outlook.com
 (2603:10b6:303:86::10) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW4PR11MB7101:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c8a0459-3a66-4fe5-23b1-08dd8e7b7e94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?wZkr0iJD1ZgPidGsHid+K45FVCAQPipo9CAmbBQtUnxxLpyk0SVqzwjk5xV5?=
 =?us-ascii?Q?3yaYXT87jD6+B9WD1ak4+rOCHGCRQl2JZKPJj1qrAwobMg6IiKstdCtdnfG0?=
 =?us-ascii?Q?BKWpuFEy8WyYVaUqG9fdZ7se2FcaL51ErWBQ5WFW7Y+eOg0GwE0MuBzH7lXU?=
 =?us-ascii?Q?KEcHxIqjuXKhDEEjhWxCSQlFQiIEzQfAdZNl+FrTZsX8AMJe0AmLXlPDeqsz?=
 =?us-ascii?Q?vPobRFzHg/rQTXxWLzmh3D2KwpILKxEbUkqZEpMq6vMvw45XjpvGrCJRHHhY?=
 =?us-ascii?Q?qRBclWS4d1QTZjFWkRNcjL1tRdpK8HKzD/XpmsYtX0esMxALDLrLQMkJPOyN?=
 =?us-ascii?Q?ey7+I47YMwoNRReA8W7eUDbrV67Ofi8xWiO4kKppqwaeGwtAQYe/1BBjXMx2?=
 =?us-ascii?Q?/0SHXyk59I2rCejEFXSEQu44tSpRSSbyZvyxy79itj4bCWijfXIiCSv4twD7?=
 =?us-ascii?Q?rGMj4Nsw+f7/8D05fukGAZVYopb4OCG7NhwoqKD1gcH65mttNcPoXSajXYAe?=
 =?us-ascii?Q?6xGAgCmGhf+xiAgskGlCG0aWB1YDoh5LNxa/hE8QwrcqNVyImZbi/WC/yRMp?=
 =?us-ascii?Q?Heq4d8MNSWI5voh0nzTJTUABewWzjOAwBUNig1yWjpoLqkVIbrk64VwQHoax?=
 =?us-ascii?Q?ZNHH5iBuXTXx0L/3AbytzcOpbKAJ/bGV9CQ47g08nLOX3cKDnbtAPoR3ybUt?=
 =?us-ascii?Q?TE2e0ZysVsTowQIMjGg7CE54bpNRY/eLPZbgk9+BXWNNYEaMrAUFIYDXAASn?=
 =?us-ascii?Q?qy8QrUCcj4DgxLSQu44nA2YMZVJCN+Vw1C8D4Jgu10zCz97cLfxiUdwQ7VKn?=
 =?us-ascii?Q?gePy+RDEBZ+IYOX7oiQ8SigC8mZCUqx29Nj2Gx/y0NfxXaqTm0TZQ9kZeP9d?=
 =?us-ascii?Q?lFx5coWhwoJicYjzMQThmD/wqmTyWCQ0KVmmQ2bv0qi/qpfffWfwmKJkDaV4?=
 =?us-ascii?Q?etKTCTerXIp7dkicF+/kE7CUsBMORxvEqZ4AJTpa8vexQJTzeN5kYJMmW9m+?=
 =?us-ascii?Q?5OnOY/eGf27qIbcSiznUnkcVDM8KhuxhrNeKRUNBgdx+8+wImnLRDEbkW0Lp?=
 =?us-ascii?Q?h8ksumbWuBnjE4cjUmwPCjCdA+pcKyAiEio/u5CNsdZbIAwcbDtaiS23wyHO?=
 =?us-ascii?Q?Epbx9VgXs4LKxLQKas0o32QbbeB4NadOVH9B1iu3WX1D+F5MwkcmlaNJJugs?=
 =?us-ascii?Q?vB+Jf6v2wKB9T5yuXB26O4jCs1nCFlyitP2TTNgN/GLb7sxB6ZbrhtZCRupy?=
 =?us-ascii?Q?pWF/oMpKR9aAKmp4H/8p3fwNe3IkzNXvpHILjYXtqcNruQvtiSDnsTvbdNDL?=
 =?us-ascii?Q?wvh87DG7mY94cs1d9+VVyHUyNcPv7clZ+og7KGxiINNC91qBNE6Kw7ZSSbsL?=
 =?us-ascii?Q?AMWgbtY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?livP2Ap/LDqIML77sSirO7uTHqGFNW/cSRbz5E7t/KLezGjYxVO/MTlT37qO?=
 =?us-ascii?Q?dDKq+cfnM8DfAl+EhRA6SQPIFHo9krsWlT8p/TYpSc60dau5HJNSnRoRACEM?=
 =?us-ascii?Q?zMVDlHH754KYeJy5w4z5abqEFWrmuY/bHJKGQPZGOP8sN/f1sNCKw5tK+Uvc?=
 =?us-ascii?Q?rMXYIz1BFGgRqrAfs7y3M07lMW2cGQUlbzRjLmSmex+YQWkhl6GoOSyd3FYk?=
 =?us-ascii?Q?xRBwnwmTfRukpKqpM952rLOdhWi6PWbPtoAxK1gUtvD0IqJaPwKsMyyTLNI3?=
 =?us-ascii?Q?wJU4xY6TUOqMMphrLlBlN6/vzcmfGh1vCK9zmojnq/QwKMR54340U0YLdzYN?=
 =?us-ascii?Q?V8U+9/hqJJcn6vb9CwezgAeUnlZQv1SGRwxwNpdps2VoVE80ictfGnl9Nnij?=
 =?us-ascii?Q?rBs1fZjcDQKyOa8H4wRO+JxASLzgSgzy0aW3A6o/8UYHbWcq53Kg4QL/7QVu?=
 =?us-ascii?Q?I6pJnKiNtbwUzZJSe0xn7bVhcqME0zdFHlcLOMgkZ7p4cH+QclmPSYevtKYU?=
 =?us-ascii?Q?6c6+YYGh064SZNNo+z81fPlGB8SXl0MZP8QCmq0vdIOSRn2lCucOx4RwBx9j?=
 =?us-ascii?Q?1wOBxJLUe7EMBt+sLBnkuBGtqIsI8m+xGgQlIjLa56GmSif1C8MUvkcYJop8?=
 =?us-ascii?Q?VcNCR+HmG2x6yeVgnTmxlJG0ydK22BFOlaDlDT5gXTHRav0i6y313L9TvYS2?=
 =?us-ascii?Q?NaKkyQZpOppAzCVvYNldLAJHWD0+EoLruPG3/cUZO+aMAzrbIxD7V5dY3c6T?=
 =?us-ascii?Q?aEzypH5Vt6/bGv7XEn6ATTYxj9z6ruW+kvvuvtr/BYU6TDWBxu3ls9mz9l1v?=
 =?us-ascii?Q?GBX1ZYriMAVa7uGt1pEA4dkpAeh9VDWNlAWrZTOOaiBnyQMzA4AeanacT41l?=
 =?us-ascii?Q?JculXChRM46Mlz+Y2FI4wviVyOHFdNs83mbfJKM8ORSAJXMInZVqQDZFPRLi?=
 =?us-ascii?Q?kjNgduvASlziaOz+jp4JMHEQ4YZDj3QLQBcRdbtBhYrIqfoxGdqygLvHnfEa?=
 =?us-ascii?Q?oTeR9VsMgGMVWoj2GxNNqdHSsNATGvWOdklqqWZ2D7h9Mhm6Ek3XwSzp+slz?=
 =?us-ascii?Q?vcuZnFq7YyiYVzEdbRi3dDE8yPd9aUBQEuDogNh7woTBVDRE2GsjVtEaUeVa?=
 =?us-ascii?Q?A5W/M/4U8d/+Hp+/7nag+7MXMk/r4a+/Y3zfms83pdfTdrmMWjuY7a0QCRMW?=
 =?us-ascii?Q?4z8BKbZKIXRKqUQCJiSv+1WND2B6K6c0ZZprCs5S4LV5lwNYTBzKdVDyZPiy?=
 =?us-ascii?Q?PvR/XJlGfxc44+fjGGxnEeV6B5r80rjxNI+CyEXnURIhzZxJ5HZFNXveVAZS?=
 =?us-ascii?Q?XKBskHsJfQS05InaOOSHY14R2T+p87AcRtb67TpvmlN8OTkx6jk2BuzPY6+t?=
 =?us-ascii?Q?OOBJ1cBKMY4Wd13uxX01SBLvNsON4GBVahBNcT94GZQWPQES5iC4j6DNxHT9?=
 =?us-ascii?Q?3kKpM616kDAgEJpwhESGOXmp2RPAH6519w2VA/8rakw4sQhfCSSnJ/ulnQqC?=
 =?us-ascii?Q?aGZVdc+HfzzBOBj59IDrehNCgLRQPDmnKdykT4vK7dNwKu4D/EXCNN6WO6m5?=
 =?us-ascii?Q?bLiXxIuRZ4rJTecbz6Fn2K/Vcn8aYz1968fsb6oWMFpziINz+Je/Am0q8lR9?=
 =?us-ascii?Q?vw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c8a0459-3a66-4fe5-23b1-08dd8e7b7e94
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2025 21:58:41.3590 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tJ2tyqUCtWMx4Nouliq9t5YRRBvrQLVLcbiFzV8WwQ1WgfxPFrTeGh1tOe267csMIAdJsVRS3zdStHLLscCcSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7101
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

On Thu, May 08, 2025 at 03:36:40PM -0600, Cavitt, Jonathan wrote:
> -----Original Message-----
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Matthew Brost
> Sent: Thursday, May 8, 2025 12:09 PM
> To: intel-xe@lists.freedesktop.org
> Subject: [PATCH] drm/xe: Do not print engine reset message on a killed queue
> > 
> > When an app is ctrl-c (killed) any queues running on the GPU have their
> > preemption timeout set to the minimum value and scheduling is disabled.
> > If the queue has something active on the GPU it is very likely for the
> > GuC will trigger an engine reset resulting in the engine reset message
> > being printed when this is fully expected. Do not print the engine reset
> > message on queues which have been killed.
> > 
> > Reported-by: Paulo Zanoni <paulo.r.zanoni@intel.com>
> > Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/4904
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_guc_submit.c | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > index 369be36f7dc5..efff462ddd75 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > @@ -2005,8 +2005,9 @@ int xe_guc_exec_queue_reset_handler(struct xe_guc *guc, u32 *msg, u32 len)
> >  	if (unlikely(!q))
> >  		return -EPROTO;
> >  
> > -	xe_gt_info(gt, "Engine reset: engine_class=%s, logical_mask: 0x%x, guc_id=%d",
> > -		   xe_hw_engine_class_to_str(q->class), q->logical_mask, guc_id);
> > +	if (!exec_queue_killed(q))
> > +		xe_gt_info(gt, "Engine reset: engine_class=%s, logical_mask: 0x%x, guc_id=%d",
> > +			   xe_hw_engine_class_to_str(q->class), q->logical_mask, guc_id);
> >  
> >  	trace_xe_exec_queue_reset(q);
> 
> Hmm... what does this trace do, again?  I can't find the declaration of this function in the code for some reason.

Yea, those generated by macros in xe_trace.h so grep is not going to
help you there. These show in /sys/kernel/debug/tracing/trace if
enabled.

> If it's also in charge of printing additional debug data, then we should probably shove it into the above if statement as well.

I think we still want the trace as these really show us everything going
in the KMD. Here we don't want to spam dmesg with can expected user
event but the trace which captures everything should have it.

Matt

> If not, or if there's other reasons why it needs to be run every time the exec queue reset handler function is executed, then:
> Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> -Jonathan Cavitt
> 
> >  
> > -- 
> > 2.34.1
> > 
> > 
