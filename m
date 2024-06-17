Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D721CC2BA1A
	for <intel-xe@archiver.kernel.org>; Mon, 17 Jun 2024 18:01:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EA0C10E494;
	Mon, 17 Jun 2024 18:01:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="grr3qnj+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68D6C10E494
 for <intel-xe@lists.freedesktop.org>; Mon, 17 Jun 2024 18:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718647264; x=1750183264;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=FV3RhGtv1AT7IWobuKfYo9dIPrlGb9kOzPe1zQmbW08=;
 b=grr3qnj+qDfMGfAx47IhrLI3fNC+AMVOIQxTsq+TAwqj0kTtG+BGxb8N
 W3bGOYee/kpIBCoTSK7W4fzzaHg6BFdGQJC2hR+Znkxvtlz38blalVYSR
 +TcfIzzjoVxESeQKCK7omjaQL8vz6SDt65mFcUVXVunl66ac++E+HB45r
 3+/sXiED7NzqCF6T0bxJlsyX7WtKoiS4sUM2UOdIfQtpuM8TY6bIdkbsy
 Ri/5pfRBRPSZaI8vqv4R75sEW69RRymN1/17Z5YDKHsZKxori8xofVfBk
 khwZhDiSje1B7wUhvy7pQYK+zK1Eau65e9GO8JxQ4YyrICc1T8y1sXtNc w==;
X-CSE-ConnectionGUID: KNtH4B/PSU6pjNkUDZEXCw==
X-CSE-MsgGUID: immxol/oR7SjaPs1nnlVaw==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="26903112"
X-IronPort-AV: E=Sophos;i="6.08,245,1712646000"; d="scan'208";a="26903112"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 11:01:04 -0700
X-CSE-ConnectionGUID: m1tNkW0qRpS60HcCXaZ5Fg==
X-CSE-MsgGUID: C+K28UH6TdGVbNKlEgGNXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,245,1712646000"; d="scan'208";a="78737295"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Jun 2024 11:01:04 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 17 Jun 2024 11:01:03 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 17 Jun 2024 11:01:03 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 17 Jun 2024 11:01:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jJaWwOulOn+HqFmhdvHptJXVFjGBDJm85IFUjHuFF2utFOJb0Uypiiys7MFUHzZBWmvQAH/DC4X9a8kIYi1UvT8FeVN7rEt2TbTPywIXuxvauEpTgeYPmbgLH3xOXsMkmjbNPw/ENC08AU3kgeIyDgA9QL5LDnvyh03mX854g++bBEWkJH7rM5EAj/Ax+t955SwXYgImMlqirWo8V6FDkEPqaxqbuZXIk8h3at7OpnMushN+rC4hDyZElmMTcKIDc3uwrQ69/5Q5+5jZppi1B9Pz+ONBWcOihZ582FHQAWHJAPa/7F+jFkbe/Atvw7fvkDfzrXfdqXP2HE6Zuql3Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=auX+lCGBCNG+XkT6v8YiKxY0948FCd9jxgg3R/7Fm3c=;
 b=oHRDyzqMExKBzi/P/auSZOt7gNSrYY4YxCG/IOgV5rWUovN53QFNsD+SBMaps2YGxAqhgrxd+Iw74eGyC5UBE3JOQ46RZKayL4BE1CwVYbiFmTTzBjfp4/uMFd+avxWbH3GR5O8RuyN5gfte94A56LJIc2jmMWo/f56t+SjUp7wQkJCO982R1mlIOOmeDKsDBdqtVOOB8ZLMYScTnsZzhs4BVuGuvla+0PLG0jYhvNlEB1+2AryqjF854T3vLrU4gVSxbnRDxfwCG3jjah5MHbm9OLGDduDx/KSsf7manDnqihPKmpCt513CgnRuZWvG1/EH2Ap9wGuoOxNG5IwswQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB2859.namprd11.prod.outlook.com (2603:10b6:5:c9::14) by
 CH3PR11MB7865.namprd11.prod.outlook.com (2603:10b6:610:128::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30; Mon, 17 Jun
 2024 18:01:00 +0000
Received: from DM6PR11MB2859.namprd11.prod.outlook.com
 ([fe80::4063:4fec:bf76:f095]) by DM6PR11MB2859.namprd11.prod.outlook.com
 ([fe80::4063:4fec:bf76:f095%3]) with mapi id 15.20.7677.030; Mon, 17 Jun 2024
 18:01:00 +0000
Date: Mon, 17 Jun 2024 14:00:55 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>, Thomas
 =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>, Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [RFC 0/3] FW guard class
Message-ID: <ZnB51-d3XtwUfPfT@intel.com>
References: <20240617143430.641-1-michal.wajdeczko@intel.com>
 <ZnBxSFpuGjc9c9KJ@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZnBxSFpuGjc9c9KJ@DUT025-TGLU.fm.intel.com>
X-ClientProxiedBy: BY3PR10CA0012.namprd10.prod.outlook.com
 (2603:10b6:a03:255::17) To DM6PR11MB2859.namprd11.prod.outlook.com
 (2603:10b6:5:c9::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2859:EE_|CH3PR11MB7865:EE_
X-MS-Office365-Filtering-Correlation-Id: c580c258-ea05-4ba4-66d1-08dc8ef7721c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|376011|1800799021|366013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?G5As9157lmVlap7Cgt9Q1JtoUa5aukivjBIAqoQv7M6ul+bbDOS76+y1tENE?=
 =?us-ascii?Q?U8iTsqjmAZ7jy6U1PiVltBwQA7bJ/6C0dm5fc/mvMKxGH9J1SJVwh/ryYZOS?=
 =?us-ascii?Q?Lq3JOVtTUcGxnKulufPNg70uTq6kE9b1blUi2T6A0Br+ErYTDzybjDWtHogy?=
 =?us-ascii?Q?wqcHCc0TfLoH1x4BGbH5iAhA1qkZPVDO065YdfSdf4MLL3wbNHFg2gGNlxPQ?=
 =?us-ascii?Q?xYsNIQb3A32m/G/y61GxpjUxoIhf4mLtQrs2qxs4UubX6QEfBwWJdBldmYeY?=
 =?us-ascii?Q?lQDArNAA6kXBFba5OTejf8m971YzoRWx/7Qs7aHUhEmLt4PLqPDPFtxxJ2P4?=
 =?us-ascii?Q?ykx67RpkTtWZG/HI8TYeRcBe2YZSyZ2kMTHC597AEmaC55eSXxh0ZaqQI7OE?=
 =?us-ascii?Q?RcKWjNQW26vgKmM7IEkW9H+AieKFeN4RLZUFWXld31Gqzcevo88DsNMvKDfe?=
 =?us-ascii?Q?1NkVl60Wf7ciV2f3ijg2uZYr4AAGpqiyZzBnCW8zcIbbdMSQxzbH6eyQICwX?=
 =?us-ascii?Q?tkXdbyjz41LQT/LWGO4+egCZ1xbxpS+wuVuexoOMJPGcqAlC9Xx8smGk0vDU?=
 =?us-ascii?Q?xbIaAA8dsSIAdijFoOViNsixijO8VdRoeI4c9qR8CnCWMLA3t09m6jQrV3gv?=
 =?us-ascii?Q?g3IfQ3IOd7ABEbAF00QexaArnUA5eh8nYCj6Lo9erBSXs7IdIiTbn+sGM9Tb?=
 =?us-ascii?Q?HRsCaiXl1FUp1a9IMLGWB3gSJrT7vPcAwT5q0YYk6byUN0UFlQvpMu0Rtusp?=
 =?us-ascii?Q?DRQOZ9J0v3Brri4XGPAEg4grtJn5Okf+fNqUaBBH+nIy85/u7CDgg93MG87D?=
 =?us-ascii?Q?QS0nx4siEKSHeEfgoAVnYGh+djSpkriCwWP+wW2JIA2OCXrdGLjggKAmpAsg?=
 =?us-ascii?Q?0+4UUN2Jg9E0UN82Kzl/yWtPKlZJIaG5IwuzT5uVSTAMHZhpkoZmtGUlNYeM?=
 =?us-ascii?Q?tIsjBrg1DJDhOmT0zVpKH3xOJDzxChuTLI0TZX3ffoipylNgLjxIJj/Npigg?=
 =?us-ascii?Q?7zqCqbnEACTFzkGJhYzz7iZNATePxHHtQC7o05zF3Y47p9l+CJWwaxU07gOx?=
 =?us-ascii?Q?GCX4L0+S7Z80Kz6PvpozmtUpbMe/8f/+upYFCMTd5K3yuEXQbIw+YD9E/N3C?=
 =?us-ascii?Q?TcgnEuRKR7P8JAUQttZA+cPgEC9KVgsSM9sIPpiOcvWoN/Pb9D8WlBwxpQOB?=
 =?us-ascii?Q?XU+2X9aHZhlITVTehYixb2cLuGyspobjBvHis+dtL069BPa4MZ0wbzhEJs+A?=
 =?us-ascii?Q?HvAp9SMzggAwRuyJGhEoystt0P3DH2yHua8Ox76rtBuwAdxg46X/JTGAPoFm?=
 =?us-ascii?Q?QQpgK5H6MSai9mChmEbCwncj?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(376011)(1800799021)(366013); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rVRMhLsbOoTvRjSsS0db3sTrfbxVAdkF540ZIwrKhg/JesFN05xtZOOQTaMa?=
 =?us-ascii?Q?ijwJnhlXWUDUe3xtvur9vaoe+BJtnTSbtQPPInY9TIsuJrGld5R2vbROCbD4?=
 =?us-ascii?Q?hH5JBGLIBaEEEZjX/KPpHmi/g5qxIYKGxHiZZ2d3mY/0pk6vj7jcd3NOk1kH?=
 =?us-ascii?Q?kyIKgOqU99GZMzCde3CqNGKm6uhNHO/y/qAaVzmyCX8EMrhraxfRbx9hNjGu?=
 =?us-ascii?Q?/HM4d1252gAFMrR1aebvDTAVLb8nt9p51CvHLeqIL5oKP549NUzQ1U9icG9Z?=
 =?us-ascii?Q?5R3BNPXuMeMQ3I+qzKtptH3FV9cVCX9nfCCDGsX2LcRVvM2w4qsJHHSeIXq2?=
 =?us-ascii?Q?Jis0UBl1pjg9J+SZLKv6qHNb1NxsgV0Cc6iesF87wPhViSra57eQmzQhQTl0?=
 =?us-ascii?Q?TbWyjFXPxp/Vt/iByImzAToOkKaiMDFH6hs0c9FJ3MPClmhcu20A56jd7fhP?=
 =?us-ascii?Q?kdwJ25v7t4tBf/48RXRvXsiyb4QAiBgSgXbFRp7SyvyE6UEAZOz2WHXmOxrA?=
 =?us-ascii?Q?NVv5XCtAm4cfJSQNwEDhwePgly7fE7GcGEm4qWyC7qFGPDM8l/Nu/qVhQdcL?=
 =?us-ascii?Q?bRzrhH8+QquZtorni/IZRMhw8Ulrx9GZQ6ITxy6diPtVTai5bm+iLv/6opLA?=
 =?us-ascii?Q?Bjyvsm/Vd54QhNyMdmxFBaapT2Mbs7oivILB9gvqeudD6bABU+F14HMV8O9L?=
 =?us-ascii?Q?YTiF4JdiwkxHA2IOE4EfLO8xfKZIPkmqk85GJL/3VPPlY/9xsB2RUB3d0+LF?=
 =?us-ascii?Q?7Nmm9KTEtspshZ9YyRrXkJhAWTaE9P3u95gz8kdBWXlLNkQY/2VNGx2W8PfC?=
 =?us-ascii?Q?OalDrT1WnDYDtXYbsVOTNauNoIzba5BB9aIbY40fWHCdv6wpGDaSdpIC55wb?=
 =?us-ascii?Q?vVc9uhu8XhOwrPVMxJFV/oYlQrBxDjWWg9pdKgodpfLwXgIC641Z0WxuS+o1?=
 =?us-ascii?Q?4ynsanF5TMSFm8VO+lNty5EW67eCI/MPXz3ya0zNI2+92xMJs/m0Krp9oPtl?=
 =?us-ascii?Q?iJohVo50zlgNL0CNmdWf/H47KKMs3iRSiFlLHtXs+UAfGMSaZ9xiFVt06SCQ?=
 =?us-ascii?Q?9UxUrnHSJrW1sGw89oHb3YhrdG+O2Dx39wQ4OW6tj1PlIZIdYNgW6Fh/FPPr?=
 =?us-ascii?Q?p0XGrc7b/F0NjzbJmKS7U2apvv0fYVxS3cekMN0UOrU4pUEDZ/rPCrlJJcJO?=
 =?us-ascii?Q?p9XJhwfHttGhBB80s5GzHRW6MfdbKR3qEciwwnmoLgIcJdzhY9pfgMaCnI7h?=
 =?us-ascii?Q?er0YHngEHX6bgqS9kbOeUNgfoqxa0DbsDe9nn5HD0RPvrowyTOxUtgCG6h+H?=
 =?us-ascii?Q?ILajZohsUoNZY4PwdSkPWzRi26/ddpnt8/cpeHegyYjPWCKGz6efbNqcLy43?=
 =?us-ascii?Q?nbo02ywoxN95INnHxVuWA7mHSbdi4UsUW5hKFUMJgWYHzetllyN5cwOneJZB?=
 =?us-ascii?Q?qWRD+nM04qx+96KSuPGZJ6Zv494c6p63cJhyEjl6kWce25uIhzXwdRxhjSBI?=
 =?us-ascii?Q?h0K93KvIFsSRtwkoN+4b/fl8Zx4/jllblyJvKY8LallzUEehy0PGPPJyXo/G?=
 =?us-ascii?Q?wv2bcsaqXJLCPnYIDxzmxXWhHFT3Ad5DYOv8njlH?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c580c258-ea05-4ba4-66d1-08dc8ef7721c
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2024 18:01:00.5061 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oUiuUZrMXocSeg5b8+AkSj4jIs/+/kG381QTnfUVv39bu5k35xX5DkrUZG6dsRK4298plUFyWazzwA/75z41Tg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7865
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

On Mon, Jun 17, 2024 at 05:24:24PM +0000, Matthew Brost wrote:
> On Mon, Jun 17, 2024 at 04:34:27PM +0200, Michal Wajdeczko wrote:
> > There is support for 'classes' with constructor and destructor
> > semantics that can be used for any scope-based resource management,
> > like device force-wake management.
> > 
> > Add necessary definitions explicitly, since existing macros from
> > linux/cleanup.h can't deal with our specific requirements yet.
> > 
> > This should allow us to use:
> > 
> > 	scoped_guard(xe_fw, fw, XE_FW_GT)
> > 		foo();
> > or
> > 	CLASS(xe_fw, var)(fw, XE_FW_GT);
> > 
> > without any concern of leaking the force-wake references.
> > 
> > Note: this is preliminary code as right now it's unclear how to
> > correctly handle errors from the force-wake functions.
> > 
> 
> I'm personally don't like this at all. IMO it obfuscate the code with
> little real benefit. This is just an opinion though, others opinions may
> differ from mine.

Well, on the positive side, it is not adding a driver only thing like
i915's with_runtime_pm() macro.

But I'm also not sure if I like the overall idea anyway:

- I don't like adding C++isms in a pure C code. Specially something not
so standard and common that will decrease the ramp-up time for newcomers.
- It looks like and extra overhead on the object creation destruction.
- It looks not flexible for handling different cases... like forcewake for
instance where we might want to ignore the ack timeout in some cases.

> 
> Matt
> 
> > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > 
> > Michal Wajdeczko (3):
> >   drm/xe: Introduce force-wake guard class
> >   drm/xe: Use new FW guard in xe_mocs.c
> >   drm/xe: Use new FW guard in xe_pat.c
> > 
> >  drivers/gpu/drm/xe/xe_force_wake.h       | 48 +++++++++++++++++++
> >  drivers/gpu/drm/xe/xe_force_wake_types.h | 12 +++++
> >  drivers/gpu/drm/xe/xe_mocs.c             | 12 +----
> >  drivers/gpu/drm/xe/xe_pat.c              | 60 ++++++++----------------
> >  4 files changed, 82 insertions(+), 50 deletions(-)
> > 
> > -- 
> > 2.43.0
> > 
