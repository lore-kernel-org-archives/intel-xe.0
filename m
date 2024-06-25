Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88B64C2BBCA
	for <intel-xe@archiver.kernel.org>; Tue, 25 Jun 2024 22:02:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20ABB10E250;
	Tue, 25 Jun 2024 22:02:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NKfGegEJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8184110E250
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Jun 2024 22:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719352921; x=1750888921;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=5Cc9vUQEbgp74eg+uC8TV1dz7v+w6l0sszM+UfEtzng=;
 b=NKfGegEJdJinoCiX+ifHV6yqQApZGfK532EyfUR4xt0G0+yWu+HnqRpg
 qDj5lH63ZQ4yj8Xsc0alIToS8YnccJ5So4vUESfhQGJX/xnOp8+QWbySN
 +w2UVlMMbmmee0IOEWTfGJAKC62NPbxPVEb0CdAspib9NcXwu2/FD4Xmh
 Mfnf2zGFKQ5YJBIBtBnIizYryWZGHm5mP1HZSZtBSLNeAEKJn+6wZJIIm
 esQSEeVuzyvVslBsCb5g4vedFiXgA0Bqk65ko96Ic+j7/xhs498SgFiZA
 oGs84j4rBXHztCjtwLInG9bmGMsrNjiO1sp9BwQpZnk/KFvFiul1Qx8a3 g==;
X-CSE-ConnectionGUID: UieuRQx3TCWlPICHGJzU/g==
X-CSE-MsgGUID: Gz06mmBHTA6LSzl50s7ZGw==
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="16151854"
X-IronPort-AV: E=Sophos;i="6.08,265,1712646000"; d="scan'208";a="16151854"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2024 15:02:00 -0700
X-CSE-ConnectionGUID: CZazgcFRQE22XHTC2WD/IA==
X-CSE-MsgGUID: jHZHpi7mTTGLi6Velscgfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,265,1712646000"; d="scan'208";a="48703816"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Jun 2024 15:02:00 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 25 Jun 2024 15:01:59 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 25 Jun 2024 15:01:58 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 25 Jun 2024 15:01:58 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 25 Jun 2024 15:01:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gVYoT4AgWQv7mCKEJFttGDn/GRo8Yq8cHJ3wzNQJduaoUYaDOlxT/2Cok/qyxftR/PO5wIZ9XMJAvaR06VxHydu+ZsP76IhNUcdCslJQD10rIFj1lXsAfucCMzk8VoJF3hu6J0zTR22iuKuWSPwydKgjC80sDom1OTkf9QN4Yrl64Bj7fhKWCyq0lYmlAXg3Dn8sb7KZZInnvqc/mCiMGBqOoPd9KxG1K+MzleZHfSTt9FbjYCrBOVH0LEJVHS1OndljW2Flu3SmPBM0Fnmb3DuzBFOXTsfm8bwllKSu5Oewhi+OV1K3XZUSys4g6BpodNKcLCpeyPCyP5CF4LL24Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PSQBuGRec+dhFUedR0BxNuu9qA5U++n9mIyhYBmhphM=;
 b=ZuCRPhWqKfvz5z06GHKKvYgkBb1y2kS9yXzqBBpF5KlaViC3UU7k7EZ8fNwXeElg0KVUz49vBDp+4m7OvOM2EsBvzCaCNVTTZCt1xsMZ7UGToXFeMowCCyPlG8hdk8oe7b9Xe4804FbsdtBLC41eSlkKNRwDXYYRw1Aaao9u6dIYl8ozfazoYfzJbckmhWF/f25dy52gU464I65jd0Ob2z54PDn7SAzUkZnL+JMC09t6CyUrcJeInSWmXgSkPMPCMvMOcC42VqbydXjLt50LQlavtIWNkxPfdbjNYSrKTgpm4zvIPsQIvJTGrmw5l0e4cuPhIV4hEhpT+wVGX+6x/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by MN0PR11MB6033.namprd11.prod.outlook.com (2603:10b6:208:374::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.28; Tue, 25 Jun
 2024 22:01:56 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%4]) with mapi id 15.20.7698.025; Tue, 25 Jun 2024
 22:01:56 +0000
Date: Tue, 25 Jun 2024 22:01:16 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: Ashutosh Dixit <ashutosh.dixit@intel.com>,
 <intel-xe@lists.freedesktop.org>, Lionel Landwerlin
 <lionel.g.landwerlin@intel.com>, Jose Souza <jose.souza@intel.com>
Subject: Re: [PATCH 2/3] drm/xe: Exec queue op's to enable/disable preemption
 and timeslicing
Message-ID: <Zns+LDMVXrBp04nU@DUT025-TGLU.fm.intel.com>
References: <20240625201518.766925-1-ashutosh.dixit@intel.com>
 <20240625201518.766925-3-ashutosh.dixit@intel.com>
 <Zns9O4SNJ5YIilUR@orsosgc001>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Zns9O4SNJ5YIilUR@orsosgc001>
X-ClientProxiedBy: SJ0PR13CA0109.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::24) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|MN0PR11MB6033:EE_
X-MS-Office365-Filtering-Correlation-Id: 5babc0b5-e129-47ab-71a3-08dc95626e03
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230038|1800799022|366014|376012;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?BsVd3ye9xGlyDHWltqHcSBMG9Sy8NWmBH/RxmBDU1TcuSlP1ABxW6S4JA7Wo?=
 =?us-ascii?Q?4YXTXlEygeXB6IGqsQegabdp6NEoncKRGmEFO+139YaAnvW9tjwWxWTdGtjK?=
 =?us-ascii?Q?tySSYt7Xp+V4iJoRpQpfYIl5fSrTRZLt4X233W1S62UbwS/9bg6Qfbeuc3x8?=
 =?us-ascii?Q?UcFLQ6akEK1Ds3s7Zx87jkuB7u+5ZEZl9LcTwyuddGuUx06Bt/zBamSzPF1d?=
 =?us-ascii?Q?3nZdF/6dZdOBukrwMP0WARlQ5yHJRFhAe6X9nuNUPVR81FTKIYvxLNsHtppa?=
 =?us-ascii?Q?Bt/hq1BvVGVBgQJEd0gbXk/eBVmiDwy44oyXulFL3jXDVnziCuUa6HgiALov?=
 =?us-ascii?Q?AndJBs5s8mkOsR6Aq/tXVZY9BIt/Ss9k+mrzSQKrNw7M03bibd6PZ+Z0t2hF?=
 =?us-ascii?Q?dzBJupfsEk0lgsPEDCQrLuoR3R4ItBRETR3zdRrZDZkNAXEOPzBeS7tn1/4b?=
 =?us-ascii?Q?RAOdxTUh2B/chrgDyvyxGsA2mzIypLA5V4xjja3xbp+Kef50zXZdfMuHReJv?=
 =?us-ascii?Q?BdE+J68o/N6/LW+07UFsEfTWImw0dUDcx1s9O73ZSrHdq8eZt//2jLqTy/Bk?=
 =?us-ascii?Q?9YyVfDBpEY2tNoz5OnbNf4whcSZPzGX570G7KQRAV+0WqRPYHnwzfK6RrY4O?=
 =?us-ascii?Q?fcZtcvI4UUwgnyqPlwkRQDTqn1Nl1qi7vB5qoyMOTHBqJKSscSe1enkYZEHx?=
 =?us-ascii?Q?Y89XVj2QMEv4SNaw7N7c/1ngY7nfYLjepTqODftrX1OZYAnJGvdQ/HFi48UY?=
 =?us-ascii?Q?izCK04nMJjT3txt65AYgcYrC/YkpIrKTSf3YuUIjVvaKQFQ0VAaJ9WtWKNbg?=
 =?us-ascii?Q?RGbH8y4JUgVeuqCvnlbbjrosNpD0ExVnI1EzRAP+j3RNwz2zhWao9fbrbk+H?=
 =?us-ascii?Q?kaab2KN9OfS88HBV7Jo6L12olMzLyp4pilb3h/xU7/H44DGPzEsZnte/HV1f?=
 =?us-ascii?Q?3gvi6NuGD+vS4jCoiViN5uyGNdpIVcny01dlcge+TxmzZAxIDYOjynPc0owi?=
 =?us-ascii?Q?iv9F30i2hw56xREdarewDOyBUXiPP8S+DeP1WD7TkT83OTG+kUj+nEMNlubr?=
 =?us-ascii?Q?XMB3rIJTLOob4Ww96tblGl2Jh7kOc4LyRRbkdIlZHYhkdQVqw7kZQCpNwKYY?=
 =?us-ascii?Q?7ghUAYSHLovRiVDdy9Rd9fBBvYBj5r0uXH2g/okQFhg31Jys2vCW4hxHhmVI?=
 =?us-ascii?Q?fxwvILLmQplmi+eMexYgkB+5bBnT/T04dpQ3U2iLZ4+DqOzwnzSb4gen2VIC?=
 =?us-ascii?Q?N+XOPrcxU01eJVI411U5bgodkS58EW7GQ/ujuWwjHC36iFgOUsdVzZPdvRlg?=
 =?us-ascii?Q?bX9Hx/2bXzpOCHyQ1al3memA?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230038)(1800799022)(366014)(376012); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9K16gYx+Dj3Vf7HBQlDYau4eZN68lN/S9KMoCtarhf+mvFPZ6+T0owtbqfGn?=
 =?us-ascii?Q?1i671uaWI41tEMm7h3Ova/ZeyJ2umR/+5EhWeKTluU2UUaipRe8uchb7iTON?=
 =?us-ascii?Q?nXQJU8txYBVbd6ugf0LfknxulILHxvHcnheO7Lo23WprHy3tt7/x6xIaTtRp?=
 =?us-ascii?Q?Umwb5pKqd45dpijYH9hnJ5Z7z23AobpasvWNQEL6jJZSL440R9Q2AIYyrEQz?=
 =?us-ascii?Q?LUs6vSryYbCUWFQkUj5lBOlBroA5swA7ehisaIXlvWq4/uZeGyN84XRzcY12?=
 =?us-ascii?Q?L4bbVPhJh1IIMz+4Z8WDUsAKOxw6oVNmUcPP+mtR4M45LcmFXi9T+t/gTM8w?=
 =?us-ascii?Q?Paat5hiuRx9nEw6gnBCgVdMnqVH3VDFFZIyTVXCUXzDuF4A+2+9VH27VvOzk?=
 =?us-ascii?Q?2n3YjkiFXnEC+3MW5ZEqY+v2BMoSbYNiPzfcH3cYJLWXRCsNX4i0XyhKHpwE?=
 =?us-ascii?Q?jiVVRTjC3kVmf++kC7eLyFdtYrlGEKwIeobTfXYjOQjgrRqRURZZb0oXTFJK?=
 =?us-ascii?Q?9oumVEyQmHqyuzDjsHCX7NbavzBCrKQLbVSeO/jpDLJWVQmiTyNiPMZ3N8sQ?=
 =?us-ascii?Q?1IA2g0shpu+w6viNiA5aQsV+HW7BuKXlrnKHO7F4cb7xyvofQoZO9nwHcXSE?=
 =?us-ascii?Q?MwN295m5dIHlzmK8Cwou6jJj0vJQNBsupNY10sodoQ6Xjn8wFiIOHuZ6Q3OH?=
 =?us-ascii?Q?wxhDHz2G8OtXidcl6TtheRK9LXLU86vsFlPsSrc8Chj4YZ5ZKvhKPErHnrlE?=
 =?us-ascii?Q?tJvoZtPP0Bq/A2L5DP9t36nRyx0eRHFyxv7zMQ+vtLzI/JES/jR0mdQ84iNr?=
 =?us-ascii?Q?EXe7we5vrAxKLgSEibbjwtkgJKLiPGSTX1fOK9zSUWZCGwSFjI4OQfkS6C03?=
 =?us-ascii?Q?i973FGx3izQSuoSvf5UJ6e/bLQTpqY+enskhbSIW13XoAXxJufH+7FTStbTL?=
 =?us-ascii?Q?ZxXbxEtOy8ZlcSY1HW7Z8E39WQlDARTNbEnMwchdwJb3EgVecmeuHjc52Gf6?=
 =?us-ascii?Q?2siccLjr61p2HRFL5E5P16/nwgqwx4jefvM0KwDFLDe+InWMdrYHufZGbsYm?=
 =?us-ascii?Q?pKMlnKJbWwpMWxx9iAVNj9zZlb2Wfj6CusiXhwcT1+t/N1Fb/a3olBYweuYl?=
 =?us-ascii?Q?PIZrRx+adjisQofmc+2NVQAmBa0vD7SDzPFdQTov3GZ24dMsDyf2lj799L2x?=
 =?us-ascii?Q?IKq4UEVXNIqkltsLJrM2gYd2BDLmNF287Wy+WZW1DwBLCnO8ZcLLoFNSFVJE?=
 =?us-ascii?Q?KXOk6h3j00mnH+x61ICfQS6mTAiB9Wt7I/CS/i/wCUn7zL/GhE1TB8Ys1AXz?=
 =?us-ascii?Q?G4ztAyZrod6fhZi4blYWNl+p74VlU1bAgkX0qK8kfLAwLpZIhK/UU+Y5OrDt?=
 =?us-ascii?Q?X6VZoN7Ml/XSAu2d34e7hkhQbpdARRonUd2C11fxKz3gC9XcClxXKo6USuGf?=
 =?us-ascii?Q?FN5yVVaMtg6yFoSbZzIzmfhVFNecGqbTXgF2cT/FLLfARIM+gYLgg6d9Ns+R?=
 =?us-ascii?Q?tbLDxDCcwtp/ckwzQUuQ12+ALCUt9NZ3Pkm2196tyL2XsS9XJ7L4BpkhSP5/?=
 =?us-ascii?Q?whyPRcjmEJ3qqDtwmUANihcRawwEhs5A63I/cd/Lo5PcwjgGfsc/OzPtY0Yl?=
 =?us-ascii?Q?Lg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5babc0b5-e129-47ab-71a3-08dc95626e03
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2024 22:01:56.5960 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YVCPdqQfsrKP+lfcyD1llTENl5/aWqekKInWya2RUYwyfamMvYXbN7e/d7i7p7i4uPXq7WWMWFgpOVXE8KUEhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6033
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

On Tue, Jun 25, 2024 at 02:57:15PM -0700, Umesh Nerlige Ramappa wrote:
> On Tue, Jun 25, 2024 at 01:15:17PM -0700, Ashutosh Dixit wrote:
> > Introduce set_no_preempt and clear_no_preempt exec queue ops.
> > set_no_preempt allows an exec queue to run uninterrupted (without
> > preemption or timeslicing). clear_no_preempt re-enables preemption and
> > timeslicing. The functionality is used in OA in the next patch.
> > 
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> > ---
> > drivers/gpu/drm/xe/xe_exec_queue_types.h |  4 +++
> > drivers/gpu/drm/xe/xe_execlist.c         | 14 ++++++++
> > drivers/gpu/drm/xe/xe_guc_submit.c       | 45 ++++++++++++++++++++++++
> > 3 files changed, 63 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > index 201588ec33c3..8d64c2277e96 100644
> > --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > @@ -164,6 +164,10 @@ struct xe_exec_queue_ops {
> > 	int (*set_timeslice)(struct xe_exec_queue *q, u32 timeslice_us);
> > 	/** @set_preempt_timeout: Set preemption timeout for exec queue */
> > 	int (*set_preempt_timeout)(struct xe_exec_queue *q, u32 preempt_timeout_us);
> > +	/** @set_no_preempt: Disable preemption and timeslicing for exec queue */
> > +	int (*set_no_preempt)(struct xe_exec_queue *q);
> > +	/** @clear_no_preempt: Re-enable preemption and timeslicing for exec queue */
> > +	int (*clear_no_preempt)(struct xe_exec_queue *q);
> > 	/**
> > 	 * @suspend: Suspend exec queue from executing, allowed to be called
> > 	 * multiple times in a row before resume with the caveat that
> > diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
> > index db906117db6d..04a2c7e86019 100644
> > --- a/drivers/gpu/drm/xe/xe_execlist.c
> > +++ b/drivers/gpu/drm/xe/xe_execlist.c
> > @@ -416,6 +416,18 @@ static int execlist_exec_queue_set_preempt_timeout(struct xe_exec_queue *q,
> > 	return 0;
> > }
> > 
> > +static int execlist_exec_queue_set_no_preempt(struct xe_exec_queue *q)
> > +{
> > +	/* NIY */
> > +	return 0;
> > +}
> > +
> > +static int execlist_exec_queue_clear_no_preempt(struct xe_exec_queue *q)
> > +{
> > +	/* NIY */
> > +	return 0;
> > +}
> > +
> > static int execlist_exec_queue_suspend(struct xe_exec_queue *q)
> > {
> > 	/* NIY */
> > @@ -446,6 +458,8 @@ static const struct xe_exec_queue_ops execlist_exec_queue_ops = {
> > 	.set_priority = execlist_exec_queue_set_priority,
> > 	.set_timeslice = execlist_exec_queue_set_timeslice,
> > 	.set_preempt_timeout = execlist_exec_queue_set_preempt_timeout,
> > +	.set_no_preempt = execlist_exec_queue_set_no_preempt,
> > +	.clear_no_preempt = execlist_exec_queue_clear_no_preempt,
> > 	.suspend = execlist_exec_queue_suspend,
> > 	.suspend_wait = execlist_exec_queue_suspend_wait,
> > 	.resume = execlist_exec_queue_resume,
> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > index 373447758a60..3fd5523baf0f 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > @@ -1548,6 +1548,49 @@ static int guc_exec_queue_set_preempt_timeout(struct xe_exec_queue *q,
> > 	return 0;
> > }
> > 
> > +static int guc_exec_queue_set_no_preempt(struct xe_exec_queue *q)
> > +{
> > +	struct xe_sched_msg *msg;
> > +
> > +	if ((!q->sched_props.preempt_timeout_us && !q->sched_props.timeslice_us) ||
> > +	    exec_queue_killed_or_banned_or_wedged(q))
> > +		return 0;
> > +
> > +	msg = kmalloc(sizeof(*msg), GFP_KERNEL);
> > +	if (!msg)
> > +		return -ENOMEM;
> > +
> > +	/* Setting values to 0 will disable preemption and timeslicing */
> > +	q->sched_props.preempt_timeout_us = 0;
> > +	q->sched_props.timeslice_us = 0;
> > +
> > +	guc_exec_queue_add_msg(q, msg, SET_SCHED_PROPS);
> > +
> > +	return 0;
> > +}
> > +
> > +static int guc_exec_queue_clear_no_preempt(struct xe_exec_queue *q)
> > +{
> > +	struct xe_sched_msg *msg;
> > +
> > +	if ((q->sched_props.preempt_timeout_us ==
> > +	    q->hwe->eclass->sched_props.preempt_timeout_us &&
> > +	    q->sched_props.timeslice_us == q->hwe->eclass->sched_props.timeslice_us) ||
> > +	    exec_queue_killed_or_banned_or_wedged(q))
> > +		return 0;
> > +
> > +	msg = kmalloc(sizeof(*msg), GFP_KERNEL);
> > +	if (!msg)
> > +		return -ENOMEM;
> > +
> > +	q->sched_props.preempt_timeout_us = q->hwe->eclass->sched_props.preempt_timeout_us;
> > +	q->sched_props.timeslice_us = q->hwe->eclass->sched_props.timeslice_us;
> > +
> > +	guc_exec_queue_add_msg(q, msg, SET_SCHED_PROPS);
> > +
> > +	return 0;
> > +}
> 
> Why not just use the .set_timeslice and .set_preempt_timeout hooks instead
> of defining a new one to do both?
> 
> Also how do you check if this operation succeeeded? Is there a response from
> GuC indicating success?
> 

Umesh's thinking seems correct. 

Just use the existing set_timeslice & set_preempt_timeout hooks with 0
for disable and q->hwe->eclass->sched_props.timeslice_us for enable.

Matt

> Thanks,
> Umesh
> 
> > +
> > static int guc_exec_queue_suspend(struct xe_exec_queue *q)
> > {
> > 	struct xe_sched_msg *msg = q->guc->static_msgs + STATIC_MSG_SUSPEND;
> > @@ -1598,6 +1641,8 @@ static const struct xe_exec_queue_ops guc_exec_queue_ops = {
> > 	.set_priority = guc_exec_queue_set_priority,
> > 	.set_timeslice = guc_exec_queue_set_timeslice,
> > 	.set_preempt_timeout = guc_exec_queue_set_preempt_timeout,
> > +	.set_no_preempt = guc_exec_queue_set_no_preempt,
> > +	.clear_no_preempt = guc_exec_queue_clear_no_preempt,
> > 	.suspend = guc_exec_queue_suspend,
> > 	.suspend_wait = guc_exec_queue_suspend_wait,
> > 	.resume = guc_exec_queue_resume,
> > -- 
> > 2.41.0
> > 
