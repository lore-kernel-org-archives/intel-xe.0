Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1A8F60B1F20
	for <intel-xe@archiver.kernel.org>; Mon, 19 Oct 2026 15:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZJO5MQVf
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F80410E9D4;
	Mon, 19 Oct 2026 15:26:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A394910E9D4
 for <intel-xe@lists.freedesktop.org>; Mon, 19 Oct 2026 15:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792423564; x=1823959564;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=m/LYFxqVPmZ9YUCEqpOZVsNFrFi+DP4m11Hq50fbcq0=;
 b=ZJO5MQVfwav2gmYDXSTMICyOUt2kMTS9AEr9pnCLSa+E9cmTc84OY/iI
 xIMYggdbvqHy9DtMfdJkipOlnTuvbVrwy5eu+Mz9MGLZPG1Kntj4P3mwk
 3+sSo1A2wgGReZsYaWmA7mzZoQGpnurtocHl4EdR6/1DBaEvWLean/VFW
 WHmfCdzzqTpDYUlH+cAESSlacGoSfWjfrn8jMMq8dRyfXTGoZXUXzCIT/
 jV8mV7g5wq5CfInKiS2EGjONS8CDecu/AWam8+wVtSwgJ7V37cOwPntZN
 tGjH2pqIeKmUFk3XvxfX/haG0ENoNB0Cs7q4v4edpK+ExfCjuSYH2HRsK w==;
X-CSE-ConnectionGUID: dDv3cCkTS2u6CrJXP5taTQ==
X-CSE-MsgGUID: +Y2B6/bJQFi2rIDSQ/8vYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1214616"
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="1214616"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2026 08:26:04 -0700
X-CSE-ConnectionGUID: 1cS/w1MdRUWmR1usKY3x1w==
X-CSE-MsgGUID: /oX/GJIoTfy4m+bd+IQfnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="2440452"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2026 08:26:05 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 19 Oct 2026 08:26:03 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Mon, 19 Oct 2026 08:26:03 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.65)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 19 Oct 2026 08:26:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pSSJ0jx4O0VcirU8cQDl7aK9XUU4ow6mF2PI0QuD0Vc1IPVG0kGidC4k2eu3B0ZUIJCL2LrLZqL20tdKpKrvIkBkaGgx3j3bVxDYCqzZQwLDMff7LoXEAgUTeUVTzal/ZYhwO0rb82M96okRHZBC6UGVOlQmusdz4PG7c7jrJDiPKPdDJOQOmXDvZTbkAczxMFot2WJT998XtbauOsHayW9NsUE8K4R8xJIaNW9iTlORCe/8NMggWj9hfv4sleQJkj4FI2LcOamXVIey8oX3x1FF9/5utfLS2p99u8XF//LKEvQZKc2MaYUzUCvwTmnqdegm3f48YEp9whiv92Y+8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sXM0XMaptkLMAItYqbXJBBbn4MDJFOywcmH6xCSdO0c=;
 b=IChurOeLpV+9SoGKtS3u+pgwjWf+Ey7T6P/HLgkTwUb1QuuZYEvGaanc/m3tHkE9XJ9JWOG84tnsk5I6PGhOOWbxIU+GgUEqqA4yc2GbMefJFko1pVWdG/+VHw+OHiBah1FSMfYX1mBkXZtFkDTW/9eMvRRs6u1n7uIZ7oGuSo89CNE8SPUdCnrxAy1QBDaXwZXaylX8N0UxoSHpxyEFvoNLmd/pebZhoM0dXC8c2dKraPVWGCTjbgJZwad6oC2Vhqgoqb5jDn6dp6tJrt4oqkbAyIsMJffDQBXt++vcSKvDcX8Ao9vg+2e+j3chfZfpcrKNzfN41qW9/61VjS1JuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH7PR11MB6649.namprd11.prod.outlook.com (2603:10b6:510:1a7::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Mon, 19 Oct
 2026 15:26:01 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%6]) with mapi id 15.21.0522.017; Mon, 19 Oct 2026
 15:26:01 +0000
Date: Mon, 19 Oct 2026 08:25:59 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, <intel-xe@lists.freedesktop.org>,
 kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] drm/xe: Fix build with DRM_XE=y and CONFIGFS_FS=m
Message-ID: <20261019152559.GE1329272@mdroper-desk1>
References: <20261016191838.GH578251@mdroper-desk1>
 <20261016193254.3042071-2-rodrigo.vivi@intel.com>
 <9411b525240f8b79c2d828a887d1679518374689@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <9411b525240f8b79c2d828a887d1679518374689@intel.com>
X-ClientProxiedBy: SJ0PR05CA0024.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::29) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH7PR11MB6649:EE_
X-MS-Office365-Filtering-Correlation-Id: 43e5d40d-0f8b-4a9b-2fd9-08df2df5484f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|376014|11063799006|4143699003|56012099006|261009223027099003|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: DGcEyFgk/o3lSGZ/P75f13HnmCerzpHHlXDrHrgyOCVOL5z7Sx1Vn1EXPSlCZ6F9KTk0FE2BmZuYNQIiiSCVSeIqcOUT4tB8JQ6E/yOUYnShFuwlGeYB0EleZGwDjm8Nzejg/fqzVcFBrkzgeElrW1zlBU2qzzslfaLKAiDHYqRd0+4JofJp1iD04DILgoFmK01gtPOZH44xS1sEbp482NBDwvAN+L5iC+WZe5u44ZlXBhJvPx3NBAqxUuvi3dUqwz67zBDsX2pXEI2giikpHNp5SW/wyQj0Vr3eUpSpWWOJO0geAu1emud9y3ytyZkD4epQCvFnTWUCg5n9yzE1xFWnrU1n1UwVupNIOlmRMJUs5EBjtPwIxFXgwf22dte7ksc7D905rW3eWvzH8s5tVUxJhQJiabqBw696kKzfvhrfbMEXsuOvoJH7DAYM0eyISEvhTnASLxEM8qwS9I+kbjseZlmhhNgpT6+d+50i7pwi/BZVZhYEqHJDNdooBaJ4LAEv03KdLjjT7xionH7felrwtkmkElenlCinNc2Aa1rxeLemb9c+dUo9MiDQ0/CgnSOQZ+D7jTeVeYT4x+MmII3vq9m5kUA2z4jnzZvZM4I96MIfxtLdtbYKMmu5KgVm
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(11063799006)(4143699003)(56012099006)(261009223027099003)(10067099003)(22082099003)(18002099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/FoDH2qSN+pTMKcgzNU0gaqYc40WJK4pl9qrFZCr0V0e5YMJn+JxEPSxouwJ?=
 =?us-ascii?Q?sYloKuPZqCmjPnKvfC3jvZZizuNLRfjAN+oS7ulEimH52JZf/Sg7qNwWg/vu?=
 =?us-ascii?Q?ycgzq4mHn0u+6oDlAEgZrl4E0kVxDE5h43nfreRSgF2dLzTD9RNCZKZIar9S?=
 =?us-ascii?Q?y21ZifdTmnZJHif9C5X5vpDHbqbD9ZwiwjnpDub7F/EXRSVmTpXSUejp+QGJ?=
 =?us-ascii?Q?Rpm/HCOCIj0euK/aiTlWJQOoCRBCDweoTg4af2R+x1Mydw7Ms933JF36lLxC?=
 =?us-ascii?Q?CiEtKBXtACFbPHCCifIFlOYvoYmtMcYG/FB4Jsfxam7ilR26eOJzHowgqbNW?=
 =?us-ascii?Q?2OGjZo7h7UdvFqZKS6MzeGkP5LSXF0X051d5b5gcQOEZ9viME7mCg7fKPHso?=
 =?us-ascii?Q?LwkQ0OoNL/mDqQWzw3kMhpktYI8I3wFAPg+zhWnKwtw6VBx6kEEiLDp60Ivm?=
 =?us-ascii?Q?9j383pA7I5HJ9oISycDOrmX4mmpD44UPSVevrja0CSAUY8UWzZ3HT5ycvSBi?=
 =?us-ascii?Q?HtoW11pzd+G9BfeNTYJz/k9Qsaghrj3Og3ccjLUy4Ne69x6+ntf2+EzU/bhp?=
 =?us-ascii?Q?y08TFqKEqzduT/RRftbIX9pc74/aF3EQw8F77Kp7KHTQgtQ6+2R4ecrA1Cfz?=
 =?us-ascii?Q?sftCPdaAF6kmlcs/Ki+GgvsqYiEn1fW1V1kB3TfrbXhqfXrLt8/8th0YEibJ?=
 =?us-ascii?Q?MeNadyx3AzO4U2aYJbVYHccnfzWi8j0GDCbg9D2b4tpNsI6d6z1O7WQyVzxF?=
 =?us-ascii?Q?y2h+sR7/+P8YVZSgwEA09X9WwA5KVXzJKS0NTyvua55qDeq+IxDd/COk5bDd?=
 =?us-ascii?Q?zHYe/OI6JECtpC7Y/O0HNL/yAVnSBkQ3ktTKadywdbY5guES2PISBBl/FKF5?=
 =?us-ascii?Q?GBA95g+j4AI+iLeMrLOR2+2wgGULlsZdUWQgjaf4gCtb2KWyPDtKbuyqqzfV?=
 =?us-ascii?Q?kNkAZC91Z1rRA49SUilxERM2qMsNRIvwW1iVG/U24Arv2bRLqU933cfFQsGa?=
 =?us-ascii?Q?tedp+S0RpZCuvHLhoq9DdGdjrFfrJoLDQXP0g/6rqQHkysnGw+C7vQwgZJ0Y?=
 =?us-ascii?Q?twTS3iPCAvE/Ul/vGUW6tRNgimzS5wDluZYdEHjPURippffTowkjaBbNJKVm?=
 =?us-ascii?Q?RGaKlcFZZbSfYN8FwuLiiEnjmvxPzffB7Elg9oTal5QW9G1LM54kMpdlHS89?=
 =?us-ascii?Q?uaIgKps/64UVjSCcIlog0iEdxlS+49FTyJVZKOkUmxgayL2Tarb8+UN/4KJq?=
 =?us-ascii?Q?s9GqpB1pATVbmFy5/6cdgcb4DI1qz/F1Ky4Fc9fwUtkcHtoEqK16APS5DLNz?=
 =?us-ascii?Q?CyWNDlUfrlSckld207criekui1lJXpB0Cv7EGcGW+nvTxagv0iD+fRD/dTk7?=
 =?us-ascii?Q?gcNqmX9F7cNoyuZks+aelSzVYTIx7jWA+cR1smxfC198ntERBofTlS4UY41h?=
 =?us-ascii?Q?/w96C+hFkrEycm8H1Hwv8sj91/QonGAgyvM3Q9Q1AaATBzmTrm4Xzo7B5zjA?=
 =?us-ascii?Q?SpJU3HxMdH2P/DYuFp41bVKJQazxKvjbTQeIzr5HU57t2W7f6ivIvF+W3mNl?=
 =?us-ascii?Q?DN5Vtrb99I9FyFmMb6vSt392GnB5VbyrmKy+AtgOLnaEi10R5F0fE57z4fea?=
 =?us-ascii?Q?zW1I7Vja1goFEPlBJ4EB6fWaPobhu2ufOCmeJuj4XnkDLMiWJMVT4auOamkk?=
 =?us-ascii?Q?pBJywC1cvOVAzjjCvQNp6BDC3MTnMpYyPKaRBpxzR0V7yZsvvu8U5l0yLj5t?=
 =?us-ascii?Q?I3uFB3SxIKJnScQTnMMuRTTftbznEJg=3D?=
X-Exchange-RoutingPolicyChecked: yBDKaXtTlytcbg5e8KZmu39RV/Xvje/FV5KS9/ykfJGY62Cc9T6tUesQlkouxBg8u/zQoVwUI0ZcrbuzLS03wcYrO6xy0MwFWxXflnOweRxEO7QREcIL99BN9FMwV99c7/vsNENOZOplG1Bh92cBm2i0M4AJzzscGbItgLKW4x1DfMpoZqNxjppHpY+28mF/VDTUeTBqh64X8iUIUhjc1HH2Cj7IEMj8N5+mQDaASoWBrmnsHfG9M3f8ew7hvC6efEQcZI3j8VGFZRSNEBuVtV4HqRK8dmGUl4pyzkLxM8bLpO7kH+43i57R48SfkEP6Q+nWAU7788lQ/nmh4dzwEg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 43e5d40d-0f8b-4a9b-2fd9-08df2df5484f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2026 15:26:01.4551 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qw8OXjSnowmQAZR9LVihl4jtzFDVXiTPQA2vh3DDkiQseHMw6E6H/FSWp1YEbfRpa2EAritBlu3MVP5nHXO7gjpZfOI6Kq9DcDzBSCk97ls=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6649
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
	RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Oct 19, 2026 at 06:21:29PM +0300, Jani Nikula wrote:
> On Fri, 16 Oct 2026, Rodrigo Vivi <rodrigo.vivi@intel.com> wrote:
> > When xe is built-in but configfs is a module, xe_configfs.o is not
> > linked into xe, while IS_ENABLED(CONFIG_CONFIGFS_FS) in xe_configfs.h
> > still exposes the real declarations, leading to undefined references.
> >
> > Use IS_REACHABLE() so this case falls back to the stubs, the same as
> > CONFIGFS_FS=n.
> 
> I think using IS_REACHABLE() is almost always a mistake. It's a hack to
> avoid link errors when something in a module needs something that is
> built-in. It's a combo that should be handled at Kconfig level, not at
> build level.

But isn't this situation exactly the case that it's intended for?  Xe
doesn't "need" configfs, but will use it if it's present and usable.  In
cases where configfs is built as a module, then it will not be usable by
any built-in driver (including Xe), and that's perfectly fine; we just
treat that the same as the 'n' case.


Matt

> 
> BR,
> Jani.
> 
> 
> >
> > Fixes: 16280ded45fb ("drm/xe: Add configfs to enable survivability mode")
> > Reported-by: kernel test robot <lkp@intel.com>
> > Closes: https://lore.kernel.org/oe-kbuild-all/202610160935.Qk4ZxBxY-lkp@intel.com/
> > Suggested-by: Matt Roper <matthew.d.roper@intel.com>
> > Assisted-by: LLM
> > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_configfs.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_configfs.h b/drivers/gpu/drm/xe/xe_configfs.h
> > index 10a00d6bbf8f..327b648944ff 100644
> > --- a/drivers/gpu/drm/xe/xe_configfs.h
> > +++ b/drivers/gpu/drm/xe/xe_configfs.h
> > @@ -14,7 +14,7 @@
> >  
> >  struct pci_dev;
> >  
> > -#if IS_ENABLED(CONFIG_CONFIGFS_FS)
> > +#if IS_REACHABLE(CONFIG_CONFIGFS_FS)
> >  int xe_configfs_init(void);
> >  void xe_configfs_exit(void);
> >  void xe_configfs_check_device(struct pci_dev *pdev);
> 
> -- 
> Jani Nikula, Intel

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
