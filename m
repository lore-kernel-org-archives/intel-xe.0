Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60B19C3DA4A
	for <intel-xe@archiver.kernel.org>; Mon, 29 Jul 2024 19:30:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 284DD10E343;
	Mon, 29 Jul 2024 19:30:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RPRhUSNp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D54E210E343
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Jul 2024 19:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722281444; x=1753817444;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=RXXOFKWha55v+kRbKZBpMSAGO7aXqzCSjUkikEhHLX4=;
 b=RPRhUSNp4iF7FVjpUKVTctfkgJxUi9xOFNLaRCM/V+STQ+ta97/2r8Sz
 Rzln+jazl76GLsEUt/mf4RbhZDgHUsbS4SrtMW+ERvVNqNjHUi6j/SSQb
 w68VpqjegVnHntCSGb4FuibwTiOr8BZJNCbjOYoolT0gymHY+Yf4KnaGW
 8/r7n2uFpfEn7TQKDh8Fcg/LvhR6A7tyRnPykSyRmW75EzLR0ugjXhB0I
 171M/t7HtnXDv6CdC8Zr7UrLcoItG04bqayqEXJjOSkg/CS1w90JMywk+
 HDJr++MfEQmcHjD0VdbQIbUIfOtgDaghHp74yrTSuKTyg/3zzKg2fg4kC g==;
X-CSE-ConnectionGUID: eSf/5z4SRnuCGV2kXU5Tdg==
X-CSE-MsgGUID: d3cJuHLBR3uo1jN746qtSw==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="19944311"
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; d="scan'208";a="19944311"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 12:30:43 -0700
X-CSE-ConnectionGUID: Uxx1+OfdRzyTyZJhTNg91A==
X-CSE-MsgGUID: APphfk6SRVqdhZj8zCf/FA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; d="scan'208";a="58397744"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Jul 2024 12:30:43 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 29 Jul 2024 12:30:42 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 29 Jul 2024 12:30:42 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 29 Jul 2024 12:30:42 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.46) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 29 Jul 2024 12:30:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SwIaPZBRnWC/74l7WI1BOwjGB/1CqfFJExylDBhhbesqzcCzubkLGRc6F5Wr8A9U4j3oYoXCUctpT5JnGRdBGelT/PQLrN+9vUzPDj5/ZJ5i6OSp1jnxkJ06fHmpjw3EtNm6pZc691UeyT8jWgVjmPwoIcQq6JQpLBttjYiOcHrDkKDoZ0kVpyUgePFU6/+Zh/fHMih3eySVIANR3c0S9YUoV69KtAtDC74qm38+xYQbWGEnIa0zu0sUTSbTPX6JfVMEdinf/rr4q9smssB8QDyDpIM0DmN1NVJ/2uNdj1+VG/5iI+VlWX/QepHL05iKzW2HiJZVQ8eFYunOA4++/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OOE9LCqTw5dh7c/g4jXZdchsgAusBN5kRQp93p6X1DI=;
 b=zDuwSYTS6orQOFRO21xh4V8tKjvg/C1dxsV+1okgKNxy7sZy1XPhEknSS/Vee9o3x805useIfpXPww2j0wk2FuNL3HqyRnG/wkrOcmhsSa26kZXlDr4iWrr4zJyWhU9R0VWr1EEoX6vNdTziTYZymTTIvtRKuv9LwwsFUTHDCQmgJcT986Zan97XcJBPQH794fh8Oa2CFY7eeFPfbUH6+LmVNCt6fU1oeC5dm26ro/ne+hENCn5y8GY8IU7gY0J4Z03Bz7n9kh+lXqU4EJE7q7lKHwp6DPf2gen9XgydYZCK3/NsPk2b1AXLWWPEVK3xgkSoizpj2iPh9+ZiCCUFGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by IA0PR11MB7839.namprd11.prod.outlook.com (2603:10b6:208:408::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.28; Mon, 29 Jul
 2024 19:30:35 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.7807.026; Mon, 29 Jul 2024
 19:30:34 +0000
Date: Mon, 29 Jul 2024 12:30:31 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
CC: "Jahagirdar, Akshata" <akshata.jahagirdar@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/1] drm/xe/xe2: Introduce performance changes
Message-ID: <20240729193031.GB2685051@mdroper-desk1.amr.corp.intel.com>
References: <cover.1722060742.git.akshata.jahagirdar@intel.com>
 <ca8c3c9a5dc3c822d403d8fcce3861ffdc47fb3f.1722060742.git.akshata.jahagirdar@intel.com>
 <SJ1PR11MB6204B4A759AAD5A4B4EA5D3481B72@SJ1PR11MB6204.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <SJ1PR11MB6204B4A759AAD5A4B4EA5D3481B72@SJ1PR11MB6204.namprd11.prod.outlook.com>
X-ClientProxiedBy: BYAPR03CA0033.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::46) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|IA0PR11MB7839:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ae85edd-4eff-4330-7e55-08dcb004eaca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?bAIuA9rFLEWqayJ1aZsSp6DJjTEzgZ371W7GbxBel+XoDH8WhuD8T9zjJxpt?=
 =?us-ascii?Q?olDSplskBwYV4EIVPUhbokUr3oSIZrMZ+0ImpiIeVhAqP/OnOyiiQZoj4mWq?=
 =?us-ascii?Q?SKdHZhpv3p3patKXuavx2zN6C50HCghX5wKB6iu/HkoiUasUjdPdk2Ub5w5V?=
 =?us-ascii?Q?WeYgkXShs/KNDVSgEhCwBrER179odpuc7IICPziKMSCJ7fO/C/A9VBSHH8y7?=
 =?us-ascii?Q?hYilk6362557tgA+Bf3xUzFHInAZPDcH+7vWKjIKP+XzIxEaMLIlGkXhaMc3?=
 =?us-ascii?Q?cRgkuXY5aNOm1kT3v59+Gp/lAkcHGT9Eb20ur/VggxFbEbW69I0TQq5N2Qjj?=
 =?us-ascii?Q?pc7EQMIHLTxfGAGeJi0Pn0FPtXVdaUbCbDscf9J6BsOWJAuAJ3RfKW979GYa?=
 =?us-ascii?Q?x4dgkGnibJvJbnV6tiFAX55XIKy3X+IqswdZgz77jNLqlFQh0T0WqxW/xIxV?=
 =?us-ascii?Q?sjtHW8Xphl1cbv4XI7Uv54UMaBHMLQ9KsR7bYiWNph1BJyb2r6WoWiVygkZj?=
 =?us-ascii?Q?pfgfm1gYmtZxNn/MwaD2WizUFmLwtCYPt/gxVceqHzK8nUiKxTQn5XqtKavy?=
 =?us-ascii?Q?PhzUoHD8lBasfcLiDxu4B75bL/np1tDaF1f3tLirxyChTgXMds6ziIrhHBUa?=
 =?us-ascii?Q?lenlpBELRlzIjabcBpMwP2GNO1m1+ZYCGkEdCH2jP40vytiAxMrDVT0+wKLe?=
 =?us-ascii?Q?M9pW87GOXHa5ZMrK5DGp2GFcFVecAio5upriurP6OAwy4dUTasXSM3W01gd1?=
 =?us-ascii?Q?VH6u4ZT85MFR2//njbHZLDLMG6t9bpH+8LsZBrjL7HH+e2/8b9NSUYovzn/G?=
 =?us-ascii?Q?z+UGjNQm5Wv5SLLmnJE+yDPgULEynT/5A7GhgJNLs7gs9dbvgvcCycPCPzDz?=
 =?us-ascii?Q?lFKaEUCTzqhaCCxJjWbvkMvfreIkzYDN7jmNS88nZQa0l2W21R1/ShBICkqN?=
 =?us-ascii?Q?xvYcVdwUcPzGUJeHjNekIOuHAVveSWdU77eC1Kxtu9VuOyX42ilB2Z6Okttg?=
 =?us-ascii?Q?GwKd6GqRPacyh9ShF3S4hVT9Cir6e6DxbQbRxo9nFUpKa9sN28/zaZpoPfzW?=
 =?us-ascii?Q?DSv+FzxQThsEmncDY0GcKKTgza3YdprTy9UzL0gvZO/qEiMyA9gRt/LkdU8m?=
 =?us-ascii?Q?Vx8edJryao/4mUmHwdELoZ4ZfcKlNSSQBTsK/J12xEtdLdK50m5fJzTWzZSh?=
 =?us-ascii?Q?12ElvXQ1zlVWNJjag/dOq1bLhyIi7l+a9Rn3lL46LjdReOt/6tgvzo7BrcFu?=
 =?us-ascii?Q?6Bt9TQEo36wJGwIMUCjlsVVw2vIj7zL8EJOK1m2Q7+7FFZXXr3kssk78o+Ml?=
 =?us-ascii?Q?pi/8FA7BX1DuA1quzogZxF4oB9ufkiPjUl4qm0XMbD1eEw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aIXNpDV8vvV1hsz4xMh8wHHu3JCBBpVOfXjHBt+iGzNOHutsGSTur/azDwNX?=
 =?us-ascii?Q?vnvG4cX6k+8e6Y+9zojGoIamriwAevMagFyMUq1wzpCjDn7TCsh81BhqfJxb?=
 =?us-ascii?Q?4rOl0m7A/Y9UsTzNhraLStQV76Qv8WM86SfhY583rN7A1clxuJs6UY7DlJ5y?=
 =?us-ascii?Q?wDjeKlgZ0zDrEE8B7SgkXylA8PPNjccAGnfaQNk2ld8s5fdgxC+BtQFhZcGY?=
 =?us-ascii?Q?eroZvRmjuz0T/TGybxuaec91nCeaLiTOv3l1QzfVi9IWr1XHqerLqek1Vwaj?=
 =?us-ascii?Q?uhJl0oBeQ+rfvovLeU1ZdJcWHB9CBNgFjtCNlC+wm+aIDtZW9L3Kxi/WDqOb?=
 =?us-ascii?Q?YcC1Lxxj2wXmsu63a8AsSA9B4yWCakWgWgcs9PdlcVF8iY2PGo9uzQwnmM3H?=
 =?us-ascii?Q?0s/a4V6qX4ogHMy+C1DBh4DylAv1cFXpqjJ1ac0/FK/NQtz5E6MdUWbunP5r?=
 =?us-ascii?Q?umIoSHnogzQlo3j8AHX4unTktsrFvwssnZqK2wDm74nE8OSHahSWRs9Nb75f?=
 =?us-ascii?Q?vtVuQRrlfDkF4afL91Sl8CZnBNt3ZeI39XvrgoW0gS/NHlRAZGKcQMfh+jVJ?=
 =?us-ascii?Q?pRS4cMaBBJmEVV4hoCueSdG1oNt/OpFCxiBsafT6Fgig1Svz+MaDICXZ95P2?=
 =?us-ascii?Q?e0qYTIlbhJPA2rxdldOnMgENooYz3n0wdoP9ZPD/8BgwXV4pfVT9ixkzhWBT?=
 =?us-ascii?Q?iN/Qrsd+Zn6bjmviC4TIW4wkKSZqe5d/OH8JdPEFCat+N0JUF8GCyhASxt+P?=
 =?us-ascii?Q?JB5TTFaREGalHE5jFDg0EEmq7P4MKGHK8WZKsm5RGbPRLwdbz55EYtyEQYJp?=
 =?us-ascii?Q?+7UKyNVSgCd3JEKioRzbwvIgV5/z8+jqX27tceh6xrgcDeP4HfoSsDEV0Bqy?=
 =?us-ascii?Q?Wtie1v/BMkgxr9HptghYyzpLt1/QveGlerRBkI9NkifZ3a8SQrUXjHr51gxr?=
 =?us-ascii?Q?8X3ez6xrQbF03fDPA3tIONNgFCLr2XsAMgLtV1mjenJldUQqDhZ0G2nuFV5v?=
 =?us-ascii?Q?EgyhdtZ+wKD0rKalLkq6TetqdyJZhUgyvRx9oxtKPSAbGCQXK6UT48ys72wB?=
 =?us-ascii?Q?8KFyQctZ7poJcNcKds3I5+eukf7gHsUk8kyDIt4Uaw0HsyJ99TrhMssoNyjv?=
 =?us-ascii?Q?SOoPA1JTqV1Iifc2qyt1jV6plMdC4vZSiCJPdTCJc5frslA+W8uLerbdTaRW?=
 =?us-ascii?Q?zDkBAw0tCEo1vHN/qhjvWauAXWJsTpFwZbmmUZYVxc697tFiNraMlPo3YcCX?=
 =?us-ascii?Q?23bQTidGfphbt8qObW7x3x2k+h2vD25NGe8A8M4j/bD4uxey8ZcaH+UIEdTe?=
 =?us-ascii?Q?SamKOpRtjcokUWN5axpyrqX6WtWFbknWlagKTPEFA4GvtGuxZngvf2hnAVzV?=
 =?us-ascii?Q?RgovrKjuKFYddJ2cg7U2XN2fAn8r80ujU108kUX7CxVlTq1aegcQUPbHHTEw?=
 =?us-ascii?Q?h7i0RP8bVStZuCXzqR3EXe+qwAZfq5qx4Hofe70CU6gCyUeQNoUxutJKxj+D?=
 =?us-ascii?Q?/SeRmIdF8hvZ6NUOsjfpBOjf3sIkoUGbnEnlwmqzWTBSLGd8AYyapXHi2ctI?=
 =?us-ascii?Q?Q8OJnyQY287qbOkLM8GSrEifpRm8Ykq3Gt3NaVcZ+XDUiV6UvgKx2kMCLSHH?=
 =?us-ascii?Q?tw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ae85edd-4eff-4330-7e55-08dcb004eaca
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2024 19:30:34.6265 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rSn30z9UN1Hmxopvl7Wzad5E49hlKQHKurUk5j3HroxtBSlunKCiIevn9Ib+Tugyn39wU2MY4sRyAiJL+ZI2m+f68AyLofdu57MR4IeTrwY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7839
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

On Mon, Jul 29, 2024 at 05:25:47AM -0700, Upadhyay, Tejas wrote:
> 
> 
> > -----Original Message-----
> > From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Akshata
> > Jahagirdar
> > Sent: Saturday, July 27, 2024 11:50 AM
> > To: intel-xe@lists.freedesktop.org
> > Cc: Roper, Matthew D <matthew.d.roper@intel.com>; Jahagirdar, Akshata
> > <akshata.jahagirdar@intel.com>
> > Subject: [PATCH 1/1] drm/xe/xe2: Introduce performance changes
> > 
> > Add Compression Performance Improvement Changes in Xe2
> > 
> > Bspec: 70559, 59928, 59927, 59251

The bspec line should generally be down with the other trailers (e.g.,
immediately before your s-o-b trailer), not floating up here on its own.
Also, the main bspec reference we really want on a patch like this is
page 72161, since that's where the official performance settings are
documented and that's the reference we use for driver changes.

> > 
> > v2: Rebase
> > 
> > Signed-off-by: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
> > ---
> >  drivers/gpu/drm/xe/regs/xe_gt_regs.h | 10 ++++++++++
> >  drivers/gpu/drm/xe/xe_tuning.c       | 13 +++++++++++++
> >  2 files changed, 23 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > index 8a94a94d2267..28f13362a3df 100644
> > --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > @@ -80,6 +80,9 @@
> >  #define   LE_CACHEABILITY_MASK			REG_GENMASK(1, 0)
> >  #define   LE_CACHEABILITY(value)
> > 	REG_FIELD_PREP(LE_CACHEABILITY_MASK, value)
> > 
> > +#define STATELESS_COMPRESSION_CTRL
> > 	XE_REG_MCR(0x4148)
> > +#define UNIFIED_COMPRESSION_FORMAT		REG_GENMASK(3, 0)
> > +
> >  #define XE2_GAMREQSTRM_CTRL			XE_REG(0x4194)
> >  #define   CG_DIS_CNTLBUS			REG_BIT(6)
> > 
> > @@ -192,6 +195,7 @@
> >  #define GSCPSMI_BASE				XE_REG(0x880c)
> > 
> >  #define CCCHKNREG1				XE_REG_MCR(0x8828)
> > +#define COMPOVFDIS				REG_BIT(25)
> 
> Is this present on BMG? I could not see. Please help if I am missing something.
> 
> >  #define   ENCOMPPERFFIX				REG_BIT(18)
> > 
> >  /* Fuse readout registers for GT */
> > @@ -366,6 +370,12 @@
> >  #define XEHP_L3NODEARBCFG			XE_REG_MCR(0xb0b4)
> >  #define   XEHP_LNESPARE				REG_BIT(19)
> > 
> > +#define L3SQCREG2				XE_REG_MCR(0xb104)
> > +#define MEMRDNONCOMPOVRFETCHDIS			REG_BIT(26)
> > +#define COMPMEMRD256BOVRFETCHEN			REG_BIT(20)
> > +#define MEMRDOVRFETCHDIS			REG_BIT(17)
> > +#define	MEMRD256BOVRFETCHEN			REG_BIT(14)
> > +
> 
> Please check if indentation is correct here.

As Tejas noted, the indication is off here, and also in a few other
places.  Defines of register names have a single space between the
"#define" and the register name.  Defines of fields/bits inside a
register should have two extra (three total) spaces between the
"#define" and the field name.

> 
> >  #define L3SQCREG3				XE_REG_MCR(0xb108)
> >  #define   COMPPWOVERFETCHEN			REG_BIT(28)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tuning.c
> > index d4e6fa918942..f338be24f859 100644
> > --- a/drivers/gpu/drm/xe/xe_tuning.c
> > +++ b/drivers/gpu/drm/xe/xe_tuning.c
> > @@ -45,6 +45,19 @@ static const struct xe_rtp_entry_sr gt_tunings[] = {
> >  	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001,
> > XE_RTP_END_VERSION_UNDEFINED)),
> >  	  XE_RTP_ACTIONS(SET(L3SQCREG3, COMPPWOVERFETCHEN))
> >  	},
> > +	{ XE_RTP_NAME("Tuning: Change Stateless Compression Control
> > register default to R8 (0x0)"),
> > +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001,
> > XE_RTP_END_VERSION_UNDEFINED)),
> > +	  XE_RTP_ACTIONS(CLR(STATELESS_COMPRESSION_CTRL,
> > UNIFIED_COMPRESSION_FORMAT))
> > +	},

This setting isn't documented in the bspec.  We should hold off on this
one until/unless it becomes part of the documented recommendations in
the spec.  You might want to ping the internal ticket where these
settings were first mentioned, to see whether this setting was
intentionally skipped in the bspec update that just landed, or whether
this was an oversight.

> > +	{ XE_RTP_NAME("Tuning: L2 Overfetch Compressible Only"),
> > +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001,
> > XE_RTP_END_VERSION_UNDEFINED)),
> > +	  XE_RTP_ACTIONS(SET(L3SQCREG2,
> > COMPMEMRD256BOVRFETCHEN),
> > +			 CLR(L3SQCREG2,
> > +			     MEMRD256BOVRFETCHEN |
> > +			     MEMRDOVRFETCHDIS |
> > +			     MEMRDNONCOMPOVRFETCHDIS),

We generally don't bother (re-)setting bits that already have the proper
hardware default value.  In this case, bits 17 and 26 are already
initialized to 0 by the hardware, so it isn't really necessary to
forcefully clear them again.

> > +			 CLR(CCCHKNREG1, COMPOVFDIS))

Same here; this bit is already 0 so we don't really need to reprogram
it.


Matt

> > +	},
> >  	{}
> >  };
> > 
> > --
> > 2.34.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
