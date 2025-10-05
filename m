Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D44A3CAC5BB
	for <intel-xe@archiver.kernel.org>; Sun,  5 Oct 2025 06:50:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DF6A10E280;
	Sun,  5 Oct 2025 06:50:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P0FpRQOn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2613B10E0A1
 for <intel-xe@lists.freedesktop.org>; Sun,  5 Oct 2025 06:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759647004; x=1791183004;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=+BV5oQIvaHeng0zxSediVno6gq5/ymoJ+ZvwrUz1PzM=;
 b=P0FpRQOnrYCKdQz1fDbSGpCu7+SNT3lep66ISbOMhlo+I2uwujsiQA0d
 5mHqAVrrZnyWSOrhffYxz9ks6EE8gl9NeqmWLEllgfqKSdV6VNHKjSnnY
 csaCAtBu0PnRUG5GzBHZXsxzOIvlE2t5vtYpyR3F10qKBMteUKGlz+XfE
 F0SCyDRb3nD1ECN0z0xQ05OJB7YtQ3QuQyhN8y5U9jRxBft6rC9NeIcpS
 RXfCwwVEn7hgqFw55TnwwN6n8cHIda2qOqkfQ3oofUP9rgUfGUg09mS7b
 kniWzoCfxAxUaZhcDMEOxCy+vmWWMD647vO5TEwKmAw1HGlamK49VJArW A==;
X-CSE-ConnectionGUID: QowHE1DSQVewgnQYXzU9ZQ==
X-CSE-MsgGUID: F4S27VnOTVOJZlS6c+yahA==
X-IronPort-AV: E=McAfee;i="6800,10657,11572"; a="49412013"
X-IronPort-AV: E=Sophos;i="6.18,317,1751266800"; d="scan'208";a="49412013"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2025 23:50:04 -0700
X-CSE-ConnectionGUID: BoPexDW5TVyEI34HP8H5pw==
X-CSE-MsgGUID: cLfovi8gQN2rZJ/eShkjLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,317,1751266800"; d="scan'208";a="216718883"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2025 23:50:03 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 4 Oct 2025 23:50:02 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Sat, 4 Oct 2025 23:50:02 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.22) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 4 Oct 2025 23:50:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lAe2nn7uESL1ncyhLYOA+EYls/pqgdwilITbU3jN5OR6AkQVahHuV1/0Gd6tJQIwQDmVhRsEdlxRbu2cHu1vHz2SN+9Nr+znnXhb7upprQp2M60vCAl6OW7E6xeqys/gwKv2anrcIq9AuyDtH6Tccso6nAAUx7X2h8qo8710ZwrjFv/WFxHjaYM7cpGcONk/ZQwDzzNqCc8BYiNWzsmMGrKJqQPleIIVT1tawqDFoSSxNl0opGOmuUdL1Q4VBz/ipxLHAd4X8an7pecpA2/Psr9tnPaxtDh6Kll6RjxJgr8D1C/LihkB/c8yG7eKagGmP7cz2pOL3iEINM6j+HMCRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q8IaLJPtKyifP5GcOsXO/tTdPjTCgNOw5ipF4bKOhik=;
 b=jYxmbnJLAhdUkd9wVBj6skhbrDHJkpF0hmRAU9ZGB1lL6PGE/EqNoMuuAb9DEOui+d+IBTLcWT3VyblR0Yxw3kn0S+pVSipMShgmWwensCf0KRv0ZDlW5Lq3L3l79SvUfH/TF8bvP1y4L3I+w1qA1gPDOoTx7ayrQj4Bq8kGY7R3onHHpZfMx7//YcbiR4rKuGr+N+D/CQ0BM/cgHEmc2Ko2J3w2eSVhVFHvBYs/DKRkBjG8kONoIBKQiapUmtyCYMIJVyuQ19pVGobsJ2ZndgwbVywfFpI5H4t6STc7Kw+11y7uXTm238gID+UxME4TXz3Bd6GjDtd0bh+wRZPlYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA0PR11MB7861.namprd11.prod.outlook.com (2603:10b6:208:3de::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.18; Sun, 5 Oct
 2025 06:49:56 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9182.017; Sun, 5 Oct 2025
 06:49:55 +0000
Date: Sat, 4 Oct 2025 23:49:52 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v4 24/34] drm/xe/vf: Start CTs before resfix VF post
 migration recovery
Message-ID: <aOIVEF6cPfw+BH56@lstrano-desk.jf.intel.com>
References: <20251002055402.1865880-1-matthew.brost@intel.com>
 <20251002055402.1865880-25-matthew.brost@intel.com>
 <0cfeca19-dd2c-4cc4-8725-c7526fe0611f@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <0cfeca19-dd2c-4cc4-8725-c7526fe0611f@intel.com>
X-ClientProxiedBy: MW4PR04CA0265.namprd04.prod.outlook.com
 (2603:10b6:303:88::30) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA0PR11MB7861:EE_
X-MS-Office365-Filtering-Correlation-Id: 55be1a01-91e2-4da6-34f6-08de03db64b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?T7XohgJF5tgl4/RsYy3Tp0FIxmdzUmxJgcArFgKexFbLCKJ8Xn7iLDoJEmmH?=
 =?us-ascii?Q?xkH/wKuPe8jqZX8+u+qXDCxPUw0N8ICmP0UJlD13BslTWWPJbgKn4TyUMwIw?=
 =?us-ascii?Q?nxfoG9t6MsdgB3VFKk4Cinno4RgADgKINqmB9RrzBCpNd7FiaImvM8FzdapU?=
 =?us-ascii?Q?a9zNdOzNXIKrv2Mxkl/an3bbgISOOSjEctgy363jXbTC1ILzP9Vunu0e5uqY?=
 =?us-ascii?Q?brHhrKNOB8lzWmb705n70jWJpt6c344fz95ia+d2PFeCNTCYnHibsj5VCupe?=
 =?us-ascii?Q?7T4M4vtFLK39LfgRCNW4uqTlyYZgsrRSIq/jRf8hkibrHs+wZwIoV02acJqt?=
 =?us-ascii?Q?ZkDU9plVn40j9tmM20gGUR5e2DtZtKw4N0XFa4qcsNQ/8xQrvBIUsyJngQWf?=
 =?us-ascii?Q?iZou3jL0ZIFUAYFL7VW0AxjDp2p6wEKqDJb1caIE6nAvSbZeznCMAXIhVxEd?=
 =?us-ascii?Q?sILsbpeOKQerJCHby2fGSx+0jqorFjhdfAwhpHqG9CmVswD9cb5yBUkRaoeK?=
 =?us-ascii?Q?zR8BQezEuQvf62OcxWnEDwgBK8/nhO5hzdvcoNNgMv0KhrXe8OxeoRpAtxiV?=
 =?us-ascii?Q?kUFR7rKk6VmRhoFbcPJARBwsJa/mbzxyiX/pc5cxpCMkoFMGJuT1yoiUir4W?=
 =?us-ascii?Q?huMcSDxil44JE1T3VqodC7Tw59yaiMlFX4sYxN5faj2gOfeMMLe089NtBwjl?=
 =?us-ascii?Q?Z+1rQ08dwbZCD0twJrXfcslb6ISavr+thQdrASczaNDEQGZ7rmb9GWl2eePV?=
 =?us-ascii?Q?bHcijxpIY/SMrjGC1lXsp77/X2P6K0kO5m0QJ1posD8QFwf0eA3dPTVRGd7T?=
 =?us-ascii?Q?O0UVXJdq7mKiZUJv79opf9OUHMi39VnjdcOftCcmoruAvtcJcB0+nS6qtszc?=
 =?us-ascii?Q?2nEUn5wUR8nxm7WzXqZScaBT2bSJ1+ApiaxHFcjuACuhS7V3m7llFBBcWqF2?=
 =?us-ascii?Q?fXnsYJ6uY47eVssjoutQLvrjrrEinQO75v2TlllzhPlNxLW+DUsFZ+/HNkhP?=
 =?us-ascii?Q?fwleDEiMcTo4ieAxBG7X6iTiFSXF2LWp1Hk3LC0a6EVYXU+8Q5/XUQQyxndT?=
 =?us-ascii?Q?/JhjxYkRFLo4KqBCklQLF6DspNF0DACzPfDql+YRrNwprjj/Ueq/TJVRzOCv?=
 =?us-ascii?Q?lNiwaFxroiU4hgKJ1dVIhgF/PvHw1AtLaAcqr370Jc7kNMEmgolsidOByES4?=
 =?us-ascii?Q?T6YLjvEkyyDlQxD/8pR0YzEsz3WNmS4rpzzD+yDC+vImiHTZOPDVLI66H7F9?=
 =?us-ascii?Q?rUS6BcxMk+iba2y9fr8rqpkdKAQPx3dtBqBrEB6MFS5jc9T8MjhzXQM894Hz?=
 =?us-ascii?Q?2Gff9KP+FdXx/9lSzpnByicjOCpY6peoA6GC2VQjYbKdSW0fRIC8U8Xidy9C?=
 =?us-ascii?Q?nn7fD4vHWKzrVkUWPS6RfJ13sjnpO88wqif+j/z2Spz/JWgeZQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Dspn+fRrdpuOnazC/QjerP7vf8CYWZKRhu5yJ1Lw5ehMhM46mzLIzx1IHnIB?=
 =?us-ascii?Q?GknG/i85ytdt/Fglayp1p3vBeQjUC+1GeZ8fRy3d20sQoz32wi6FLpCM5vDd?=
 =?us-ascii?Q?6/O07G+ZSvZUS56Zz7WHtwVlCt/ez+bLImWbs2Ry1Oows5AJaiqa1OdCrft1?=
 =?us-ascii?Q?eunVaZ4KThuKUZbOWjhWwkstKdZUIOl5myg1VVWG1mtEGwVCwqBsc50P+d6G?=
 =?us-ascii?Q?4PvOCWG6KUNKdquZd+aQofxNRJ6eDqA9WpsUciDWizK9Z82nAWUN5i6KwhUL?=
 =?us-ascii?Q?X68JWLaxYtYIunWLqopJrnp9EhMsdAbwa/4he+16uucbNVVKaRbXQbyBHeFD?=
 =?us-ascii?Q?R6IhLBX+uisXU99xGoCuiP5zyHqPihIDlExbwtgAVL8qC1E6Etu8w1U8sl+5?=
 =?us-ascii?Q?/aBGeWQhIh3shd6u3NEloWjQ1/LwR8hjS+qpl1cy10LouebStOEkbEe4iixe?=
 =?us-ascii?Q?KmRG6qeoJ6arTGoC5ail7dJkm6P4bCmqhx5LWvOqXHmaE4Cn/7vqE5QFm+KZ?=
 =?us-ascii?Q?2Yhl2iRvOTdZnfCc54Nc+4GqkYpj2D9QI/tHTR7hqxP/ioDWiwhgQE6eNzkR?=
 =?us-ascii?Q?DnT3ut0F1TpUq9eS8XYmvq4stWCSWMGgEGFfED/3iUCa1tZeCqSWj5RQmJfA?=
 =?us-ascii?Q?DnNa1qj42dAUqL7mwW7ibXo7XYY4YxwdA4zfjNXdmCSgGsnBrqyqWTG8SuRH?=
 =?us-ascii?Q?DvC1ZUiRZwwoJbBUMpJkT+ATBLLUvSE5xRYsoFPhIJ5K0JPG29+2fZsSrfga?=
 =?us-ascii?Q?Sj0Fyf+KDr6WQ61JX5hLdbMMS2pqvRu+V1X6dg99FB13iCP9/e3SpXyeCiQ1?=
 =?us-ascii?Q?GY3d9IABz3AKwvbzvKP9Pd+8hQax05tHeie4EL+vtWy07RGQC3W6Ll/UFDJI?=
 =?us-ascii?Q?jFypxW6qR37e1FoFDmdEsX9PI+Nj2BOLalpOvX9nmHu3DML9y3rqP777cLkr?=
 =?us-ascii?Q?/7dzhP5dhYUaP900zPVyAtS6fl/TFoRtNs29g6oJxNv8fGE8Q4BqVUlSPHF7?=
 =?us-ascii?Q?Vu4Cuvd0AoGUol1651hFXUN6b+0CgmBesveBZp5Wz5rOHGuh74AY3nNppFT0?=
 =?us-ascii?Q?XQGyEjAnJ1089jFw4jZ1fCH19eCTKZyaL2kM8/wHT2/qv8pqaMaXN4nr/7u5?=
 =?us-ascii?Q?qwSdF5DqdwGfhNdi/C5W9n5SwBMOXBhF6RBHlOOToAFBZUX/rKmkr0PN1N4d?=
 =?us-ascii?Q?wVhskE+/EPIPfJuUJkpNXPsmFasUXUwYEA3QDHb8uaneVTZUlBCuZakwU2fZ?=
 =?us-ascii?Q?jCyaid6bHxVtIt7y5wvLRgHVreJVbV8db9KSQmWhUDUEk431TSRrIOdeCscR?=
 =?us-ascii?Q?8D4WM6pB1/WSLpIOQIJxIFMS2ov05M9x6HRhswhYkAUNVjqt3t5MCrRRRW2/?=
 =?us-ascii?Q?xoPvvdS+EFR84oCRs/JemVBEf4hjYEN5aePK8MnUmYDjprIYoccwd7cuPSxo?=
 =?us-ascii?Q?ho+IKRA3tPpNWYZaf3mnPU+rcr7HrwBYtaxe01iFAZqGG3wKRQNbcYe1KTvK?=
 =?us-ascii?Q?iih89zQe+P5R6pkpVvXisGx/O7iDmuWsQUssSNpK3oBzj/Jtxe8XKTakjMab?=
 =?us-ascii?Q?9EdRKLhOvlNCHBuvW3PjiRZLhDTg74zsQpo7tHroTHSeg+15+etx6f5awU1j?=
 =?us-ascii?Q?XA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 55be1a01-91e2-4da6-34f6-08de03db64b5
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2025 06:49:55.7777 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5CJfpQ2s9Ln7pKlorLhBWhR8Sd4v4C/XQiI/LbF1cUiilwGdK89kAYRb0fOUIQu9lKHrStgcyL0MX084W+4wrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7861
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

On Fri, Oct 03, 2025 at 05:10:12PM +0200, Michal Wajdeczko wrote:
> 
> 
> On 10/2/2025 7:53 AM, Matthew Brost wrote:
> > Before `resfix`, all CTs stuck in the H2G queue need to be squashed, as
> > they may contain stale or invalid data.
> > 
> > Starting the CTs clears all H2Gs in the queue. Any lost H2Gs are
> > resubmitted by the GuC submission state machine.
> > 
> > v3:
> >  - Don't mess with head / tail values (Michal)
> > v4:
> >  - Don't mess with broke (Michal)
> >  - Add CTB_H2G_BUFFER_OFFSET (Michal)
> 
> I guess those small fixes shall be done separately
> 

Are you suggesting I break this is different patch? Seems overkill and
not particularly how I want to spend my time. This was basically
unrelated nit of a suggestion to add CTB_H2G_BUFFER_OFFSET which I
absord, now further nit to break into different patch. This is a great
way to get to me just abandon this series.

> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_gt_sriov_vf.c |  7 +++
> >  drivers/gpu/drm/xe/xe_guc_ct.c      | 70 +++++++++++++++++++++--------
> >  drivers/gpu/drm/xe/xe_guc_ct.h      |  1 +
> >  3 files changed, 60 insertions(+), 18 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> > index c7bd1f6e9dca..55662b9a4f5b 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> > @@ -1137,6 +1137,11 @@ static int vf_post_migration_fixups(struct xe_gt *gt)
> >  	return 0;
> >  }
> >  
> > +static void vf_post_migration_rearm(struct xe_gt *gt)
> > +{
> > +	xe_guc_ct_restart(&gt->uc.guc.ct);
> > +}
> > +
> >  static void vf_post_migration_kickstart(struct xe_gt *gt)
> >  {
> >  	xe_guc_submit_unpause(&gt->uc.guc);
> > @@ -1188,6 +1193,8 @@ static void vf_post_migration_recovery(struct xe_gt *gt)
> >  	if (err)
> >  		goto fail;
> >  
> > +	vf_post_migration_rearm(gt);
> > +
> >  	err = vf_post_migration_notify_resfix_done(gt);
> >  	if (err && err != -EAGAIN)
> >  		goto fail;
> > diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> > index fd6e731c0395..92822d131612 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> > @@ -166,6 +166,7 @@ ct_to_xe(struct xe_guc_ct *ct)
> >   */
> >  
> >  #define CTB_DESC_SIZE		ALIGN(sizeof(struct guc_ct_buffer_desc), SZ_2K)
> > +#define CTB_H2G_BUFFER_OFFSET	(CTB_DESC_SIZE * 2)
> >  #define CTB_H2G_BUFFER_SIZE	(SZ_4K)
> >  #define CTB_G2H_BUFFER_SIZE	(SZ_128K)
> >  #define G2H_ROOM_BUFFER_SIZE	(CTB_G2H_BUFFER_SIZE / 2)
> > @@ -189,7 +190,7 @@ long xe_guc_ct_queue_proc_time_jiffies(struct xe_guc_ct *ct)
> >  
> >  static size_t guc_ct_size(void)
> >  {
> > -	return 2 * CTB_DESC_SIZE + CTB_H2G_BUFFER_SIZE +
> > +	return CTB_H2G_BUFFER_OFFSET + CTB_H2G_BUFFER_SIZE +
> >  		CTB_G2H_BUFFER_SIZE;
> >  }
> >  
> > @@ -330,7 +331,7 @@ static void guc_ct_ctb_h2g_init(struct xe_device *xe, struct guc_ctb *h2g,
> >  	h2g->desc = *map;
> >  	xe_map_memset(xe, &h2g->desc, 0, 0, sizeof(struct guc_ct_buffer_desc));
> >  
> > -	h2g->cmds = IOSYS_MAP_INIT_OFFSET(map, CTB_DESC_SIZE * 2);
> > +	h2g->cmds = IOSYS_MAP_INIT_OFFSET(map, CTB_H2G_BUFFER_OFFSET);
> >  }
> >  
> >  static void guc_ct_ctb_g2h_init(struct xe_device *xe, struct guc_ctb *g2h,
> > @@ -348,7 +349,7 @@ static void guc_ct_ctb_g2h_init(struct xe_device *xe, struct guc_ctb *g2h,
> >  	g2h->desc = IOSYS_MAP_INIT_OFFSET(map, CTB_DESC_SIZE);
> >  	xe_map_memset(xe, &g2h->desc, 0, 0, sizeof(struct guc_ct_buffer_desc));
> >  
> > -	g2h->cmds = IOSYS_MAP_INIT_OFFSET(map, CTB_DESC_SIZE * 2 +
> > +	g2h->cmds = IOSYS_MAP_INIT_OFFSET(map, CTB_H2G_BUFFER_OFFSET +
> >  					    CTB_H2G_BUFFER_SIZE);
> >  }
> >  
> > @@ -359,7 +360,7 @@ static int guc_ct_ctb_h2g_register(struct xe_guc_ct *ct)
> >  	int err;
> >  
> >  	desc_addr = xe_bo_ggtt_addr(ct->bo);
> > -	ctb_addr = xe_bo_ggtt_addr(ct->bo) + CTB_DESC_SIZE * 2;
> > +	ctb_addr = xe_bo_ggtt_addr(ct->bo) + CTB_H2G_BUFFER_OFFSET;
> >  	size = ct->ctbs.h2g.info.size * sizeof(u32);
> >  
> >  	err = xe_guc_self_cfg64(guc,
> > @@ -386,7 +387,7 @@ static int guc_ct_ctb_g2h_register(struct xe_guc_ct *ct)
> >  	int err;
> >  
> >  	desc_addr = xe_bo_ggtt_addr(ct->bo) + CTB_DESC_SIZE;
> > -	ctb_addr = xe_bo_ggtt_addr(ct->bo) + CTB_DESC_SIZE * 2 +
> > +	ctb_addr = xe_bo_ggtt_addr(ct->bo) + CTB_H2G_BUFFER_OFFSET +
> >  		CTB_H2G_BUFFER_SIZE;
> >  	size = ct->ctbs.g2h.info.size * sizeof(u32);
> >  
> > @@ -500,7 +501,7 @@ static void ct_exit_safe_mode(struct xe_guc_ct *ct)
> >  		xe_gt_dbg(ct_to_gt(ct), "GuC CT safe-mode disabled\n");
> >  }
> >  
> > -int xe_guc_ct_enable(struct xe_guc_ct *ct)
> > +static int __xe_guc_ct_start(struct xe_guc_ct *ct, bool needs_register)
> >  {
> >  	struct xe_device *xe = ct_to_xe(ct);
> >  	struct xe_gt *gt = ct_to_gt(ct);
> > @@ -508,21 +509,28 @@ int xe_guc_ct_enable(struct xe_guc_ct *ct)
> >  
> >  	xe_gt_assert(gt, !xe_guc_ct_enabled(ct));
> >  
> > -	xe_map_memset(xe, &ct->bo->vmap, 0, 0, xe_bo_size(ct->bo));
> > -	guc_ct_ctb_h2g_init(xe, &ct->ctbs.h2g, &ct->bo->vmap);
> > -	guc_ct_ctb_g2h_init(xe, &ct->ctbs.g2h, &ct->bo->vmap);
> > +	if (needs_register) {
> > +		xe_map_memset(xe, &ct->bo->vmap, 0, 0, xe_bo_size(ct->bo));
> > +		guc_ct_ctb_h2g_init(xe, &ct->ctbs.h2g, &ct->bo->vmap);
> > +		guc_ct_ctb_g2h_init(xe, &ct->ctbs.g2h, &ct->bo->vmap);
> >  
> > -	err = guc_ct_ctb_h2g_register(ct);
> > -	if (err)
> > -		goto err_out;
> > +		err = guc_ct_ctb_h2g_register(ct);
> > +		if (err)
> > +			goto err_out;
> >  
> > -	err = guc_ct_ctb_g2h_register(ct);
> > -	if (err)
> > -		goto err_out;
> > +		err = guc_ct_ctb_g2h_register(ct);
> > +		if (err)
> > +			goto err_out;
> >  
> > -	err = guc_ct_control_toggle(ct, true);
> > -	if (err)
> > -		goto err_out;
> > +		err = guc_ct_control_toggle(ct, true);
> > +		if (err)
> > +			goto err_out;
> > +	} else {
> > +		ct->ctbs.h2g.info.broken = false;
> > +		ct->ctbs.g2h.info.broken = false;
> > +		xe_map_memset(xe, &ct->bo->vmap, CTB_H2G_BUFFER_OFFSET, 0,
> > +			      CTB_H2G_BUFFER_SIZE);
> 
> nit: we may want to add some debug dump to see what H2G actually are about to be lost by this memset
> 
> this would also allow us to verify test scenarios which may assume something was not processed by the source GuC before VF pause
> 

The debug messages in [1] provide all information needed to reason which
code paths are being tested on VF recovery.

Matt

[1] https://patchwork.freedesktop.org/patch/677965/?series=154627&rev=4

> but we can do that as follow up
> 
> > +	}
> >  
> >  	guc_ct_change_state(ct, XE_GUC_CT_STATE_ENABLED);
> >  
> > @@ -554,6 +562,32 @@ int xe_guc_ct_enable(struct xe_guc_ct *ct)
> >  	return err;
> >  }
> >  
> > +/**
> > + * xe_guc_ct_restart() - Restart GuC CT
> > + * @ct: the &xe_guc_ct
> > + *
> > + * Restart GuC CT to an empty state without issuing a CT register MMIO command.
> > + *
> > + * Return: 0 on success, or a negative errno on failure.
> > + */
> > +int xe_guc_ct_restart(struct xe_guc_ct *ct)
> > +{
> > +	return __xe_guc_ct_start(ct, false);
> > +}
> > +
> > +/**
> > + * xe_guc_ct_enable() - Enable GuC CT
> > + * @ct: the &xe_guc_ct
> > + *
> > + * Enable GuC CT to an empty state and issue a CT register MMIO command.
> > + *
> > + * Return: 0 on success, or a negative errno on failure.
> > + */
> > +int xe_guc_ct_enable(struct xe_guc_ct *ct)
> > +{
> > +	return __xe_guc_ct_start(ct, true);
> > +}
> > +
> >  static void stop_g2h_handler(struct xe_guc_ct *ct)
> >  {
> >  	cancel_work_sync(&ct->g2h_worker);
> > diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
> > index 0a88f4e447fa..b1cba250c51c 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_ct.h
> > +++ b/drivers/gpu/drm/xe/xe_guc_ct.h
> > @@ -15,6 +15,7 @@ int xe_guc_ct_init_noalloc(struct xe_guc_ct *ct);
> >  int xe_guc_ct_init(struct xe_guc_ct *ct);
> >  int xe_guc_ct_init_post_hwconfig(struct xe_guc_ct *ct);
> >  int xe_guc_ct_enable(struct xe_guc_ct *ct);
> > +int xe_guc_ct_restart(struct xe_guc_ct *ct);
> >  void xe_guc_ct_disable(struct xe_guc_ct *ct);
> >  void xe_guc_ct_stop(struct xe_guc_ct *ct);
> >  void xe_guc_ct_flush_and_stop(struct xe_guc_ct *ct);
> 
> otherwise, lgtm
> 
