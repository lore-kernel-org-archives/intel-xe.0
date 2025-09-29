Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB997CAC5B0
	for <intel-xe@archiver.kernel.org>; Mon, 29 Sep 2025 17:03:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DDF610E05F;
	Mon, 29 Sep 2025 17:03:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T9NA6D4U";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3679810E05F
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Sep 2025 17:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759165429; x=1790701429;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=mIo/DO18XpfJ2SuuAZ6SRHBufmv2DxQr41/bkcbIgOY=;
 b=T9NA6D4UGfX5wzUvscbBlYCPBF/QcS0YC/htABjASEC9Z81EA3TGVzZj
 90pDbkjMTeJyFll9m7dpoZ6CXghMbbSSYCCVLfKCmpgpOaes+ALHFuDNg
 u4nvG6o2v6saWcu7UvEIeQIT+XKy+Iqxl1VgETWA+9ILn8m97H1Py9ZmM
 3l7y0OnV8loxgYhjPa/CAFE01EBiVqit9DC3zYjx7qiK/nuOTMWhOqTol
 JmYLEKBsX4+ITWTvi/EgqT3cEcxruYSSA9PlM9FKCPLv4xC2dWboPTo59
 pkuVAs/E+zvb6ILPFjlIjWYt0hzJao+N4pqoXhlpYz39ScfPuPFYyEJXB w==;
X-CSE-ConnectionGUID: 6NITcZqiTyqxNixNV+B94Q==
X-CSE-MsgGUID: lrleRzmjT5yDuKvgAFSyHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11568"; a="72515140"
X-IronPort-AV: E=Sophos;i="6.18,302,1751266800"; d="scan'208";a="72515140"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 10:03:49 -0700
X-CSE-ConnectionGUID: W/ihXN9GTZCd99zQAKetEQ==
X-CSE-MsgGUID: KqgE3ufBRHq9LsnxXH24Vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,302,1751266800"; d="scan'208";a="183470243"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 10:03:49 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 29 Sep 2025 10:03:48 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 29 Sep 2025 10:03:48 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.9) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 29 Sep 2025 10:03:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AUciu1Ff7vq5hlNVFJwUfWEsO94GjAHJBg67sHB+I6M+slC5j8rf0cfU+bQ3fCJqGUPfgbPPELnWy6W13tPjYjX9vZowF4uXJdI+sRf7qouUQgGrRYEwI13lytx+xMXY8ETJW1jo9fUTyKNaQj+WPA7nCyFQ6H4WcRkxNVdW5mwa/8H3OI98Hy2U1h05jmZWWs3hkmbyWoTlqnM+OYE+6e22qGgPwsHthf1TDg3l/dE8rKJwR1oc6PnlVBLoGETdduOo+l5gVMq3jDTQEROK/CRfgDP5jqgTfHtetcfqSUZI4Fb+/CWJJm8+3jNue+OUJq4pvfEtsounEDOC2o65bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1ZG7fvDDjiIMZMXJerny7JpP8VVoNbByGXN1g5iAK1I=;
 b=GauDVTFYtYBHfm061tzq0UvnArx1iVxiBLwLY3cl7fYPcdnqVIKBaHSYZ1NXX7a9YjvhbhI/kxqnb38shfmZzrsMwQYBckDrJt3mPrML4NtopHLxODIGFFTW67sxqU42jsNPXBuPj/QjalhM1hcb7annWWJspsYW64LpXhjVVVuwyIm0lVqavEK6Lmj4hJOj4Xa1lmh3DaMvHMm2HQYNRf3XxAcdnOuKYw6eZFcuLXzWd0PnSSyEVNLfythoeH4iyPPuoIO3Bd9bokmQV+NfIZBPm3l+0+WlpStxy0G9kqJe1luoj3L3Efpdg99zndrOI0eSKpwhC274zvmzHTfpDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SA1PR11MB7013.namprd11.prod.outlook.com (2603:10b6:806:2be::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.11; Mon, 29 Sep
 2025 17:03:43 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%5]) with mapi id 15.20.9160.015; Mon, 29 Sep 2025
 17:03:43 +0000
Date: Mon, 29 Sep 2025 10:03:40 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 18/22] drm/xe: Check that GT is not NULL before
 testing Wa_16023588340
Message-ID: <20250929170340.GE10167@mdroper-desk1.amr.corp.intel.com>
References: <20250925234628.2112163-24-matthew.d.roper@intel.com>
 <20250925234628.2112163-42-matthew.d.roper@intel.com>
 <SJ1PR11MB620413C8DFD9343F46B99C8C811EA@SJ1PR11MB6204.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <SJ1PR11MB620413C8DFD9343F46B99C8C811EA@SJ1PR11MB6204.namprd11.prod.outlook.com>
X-ClientProxiedBy: SJ0PR13CA0225.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::20) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SA1PR11MB7013:EE_
X-MS-Office365-Filtering-Correlation-Id: 10917f0a-b770-41f0-8fc8-08ddff7a24e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?sNITUfzOBXZjrDasQTgUezOqFAsUqRbSIuzp0YKuF16NdyRuXmItii7TEDWB?=
 =?us-ascii?Q?sKkVoMUTBadR8ogXEZv1A69/QRQCre/5WvBZLWyuPI/5VRWX8UiK4VxgC4UC?=
 =?us-ascii?Q?PqPuijBeUzeQo/dqX6ZUYojb9WK4BM7t2zCSeMWUyy/8ua6kIDzQ1UmCTxLu?=
 =?us-ascii?Q?jvuEG8VSVA3FYivnFYTexy10qVKui+w+GYnp2QviI5wEo5tP7NkfeoKuH1vf?=
 =?us-ascii?Q?MBFr2AVhZ8F0lfB2ZM/NtVb4B3vOcWTaaQEoWQDkePKshEqZK//+HfH2+MCN?=
 =?us-ascii?Q?KbYFcub8/FGIAVeLOdiv1Uy+TZlE2jdpi4xVtzr35PGZ4KdSRlbODXa6Zi88?=
 =?us-ascii?Q?ns7mSKJGuCBsUV5MiGlL2G9EBGTF/s2MNGhqzxurViBh0uBiwHyfhkODxKOP?=
 =?us-ascii?Q?lJyll+GWHdvg/F+w4AqlN9RvnfPwbuSP6ROXKkE05KbNQc1LAUBoSERCTLDc?=
 =?us-ascii?Q?te41eNDpsxR8+ya6dv6Q6D9Q9JTYF/kztspjSolP+Ga8V4KuGP7+SfoYNuFq?=
 =?us-ascii?Q?f+e/jiv2mMeVqFJqWqdrhCDZCtA9X2FJvyea8442OfHceh8Fz84iRLpeN9vT?=
 =?us-ascii?Q?hrg835JCj73n7uEJsUnF9comcDNRz1eGG2V3gDnYrHLu5Pd8ic4RVaT7WT4e?=
 =?us-ascii?Q?wlIADTGHk+biGBT7r4map51A/0ju1PMYmgPkYLHS0wKXUeNGuOPUbI0YEz8y?=
 =?us-ascii?Q?r9+nnfWwaWi3jjB/a82qHJ1nn8izNRfcJqfcjjMLe9eiZMg7kPPBvcvFIo00?=
 =?us-ascii?Q?jnLcxi02zzktsxe69YCImzqjQRSbZC01WDopwvxi3tYvvcwXPMOR3nCxNqk4?=
 =?us-ascii?Q?luTvwCRaVh+mszHCz2ACAVJJ8GrZQE2MJ5nY0XMrkiO30AKpxo9PN7cDLmk6?=
 =?us-ascii?Q?Z7jaC9lMz8Gu2mQDFc3XVMJYhzsesxL4y5g+/ZunzftPMPym7i0aZiALGo2Q?=
 =?us-ascii?Q?yv9KMLMipPZ/GImQ+/De0llKL6hpKdtL9qve8+krUtzpgskEUZSlzFCvswmb?=
 =?us-ascii?Q?Sa7eSqqCebjYDZWyggejdxgTkOrjuEdLGM/sknotZI1lVM4DqMzriLgm5MEY?=
 =?us-ascii?Q?PbXI31DPZBAf/WdsLu95unCR0/LtA2E16NEIsA0ea8KccxByxPUriS7+pwlg?=
 =?us-ascii?Q?T2uJzwsWrzyCty3u7vx834QKAMD9uZEPp5y5qaFyJfRa2a43oxIPQbNbN2Qt?=
 =?us-ascii?Q?joYJ94m/2JHwIBUeUSaWZMQw9XgNOe9zdd+aAXVEuNt1Bco5huT37ax401gX?=
 =?us-ascii?Q?lc2v1PsP575ktqgk8X/blcGYrX9ywpdRhLwH0zhDGwQf3Ws9CPWgmycldk+I?=
 =?us-ascii?Q?wDj5bwEk1u26ZkMGoNN6HOoUvLBYBmB7ymL9y6aD4/ihI58Yy0XiRpTjGYEW?=
 =?us-ascii?Q?xK+WZbTUitGQanY64vjii3ZxFBoiQSkUx+S66Gid/wcIPGXz6tJrv8ZlUMnk?=
 =?us-ascii?Q?+AFZWlV47m7RgUEeE5j4dFJVEEI4jGxV?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mXxvzWqVqWtn/mPAXKRNUnXJYuajzlqlgSxZ6qWCktW3RVCujPFL5j/bNovI?=
 =?us-ascii?Q?bdLCIBeOrJXsV+iz5o9QCZa1iD/glkYNaCW6FNqjDU2Ov/tC2KDl75VeD0id?=
 =?us-ascii?Q?pFx6fV7bdVbl1qC3QNZmhtgkA3rTOhMKEcGirlQxC2BQaKycibkthPGozvpv?=
 =?us-ascii?Q?HlcmbogsenvxWFs/Kxs7i4i81/WznKpyrYwRQQ4oaB2g1jNZWj2xDKpvbwO3?=
 =?us-ascii?Q?XDORmTsr/P54itUO4QRQHgrQzUOTFqvH3wqlRejQ6TIU5+99YDdi+H1jZ0Ox?=
 =?us-ascii?Q?tCjoyKf95Fy8XkJBP5IYRQxpj6NxKyS9lF2uy27m21g3F3IatTM2LKW9K8pi?=
 =?us-ascii?Q?3874g5UYF327bRaMbz/xJMtH2fSmLRcORRD/I7t/nengjRd8j/DZHSFpNWOC?=
 =?us-ascii?Q?8vFwJV/B8As2tOMU7FQU8rFbluQYGhZsxYPCiQ4ydN8yZvJ3VdQsIHnVvvaa?=
 =?us-ascii?Q?Hc/EIUD58vn3jea9qfqCeCP+IvbffWcokkDh9sY/ISM+1N1W931F9DplAMji?=
 =?us-ascii?Q?F9Lp4sePzE1wSXEy5RjPD0p8kuys0cc4e4NCetU4iqO9TaF3P62SlDlFlLEl?=
 =?us-ascii?Q?226wX87Htz7dkuwjJIXxzDuvtABSnhscIKkL50mQd8abx4Qvqcl7xd4mhBMI?=
 =?us-ascii?Q?fkkz1eXWSLl0gUx+In/413eJtpNypl44+co/inUhD4cP5AieDvB43RQCA9qH?=
 =?us-ascii?Q?jsfqM7Q+gwZXlsefMeSSNrjXvNKwcOpVsvaRUihExrbtz7JWnDIkBcKRAb2N?=
 =?us-ascii?Q?/gWk9XrcebzA+GcXexBXkdCrGZzCAYEK5oaUS7+7RcT731jpYFo1eFoS03v4?=
 =?us-ascii?Q?gbzrFwCDmg54R8X1coY/+Klx/ZSJLS3yTDTU/k1Z68H0ts+oNj+W/1eJ5uzu?=
 =?us-ascii?Q?uwEjekLbFiM7lI7B/Iohk82WBFHXDDIKXsXpN8anjUC5vNRO7egBAFEX3DDq?=
 =?us-ascii?Q?VQUcNJJ1kuVNZiDIAP5/defi37IIzEu1+InwwVX+KFn6ItAUx7LGLrchDqdW?=
 =?us-ascii?Q?dygMw37cO69KQcQ5Yh4a2jLkrDwFXe7Yc6pck1jUUc/6gpInLoGTm6+PezdI?=
 =?us-ascii?Q?A/4isq6iPmGP2XaJelYvDkJcnph7txqagwr66pIueSkEkSrDn5zOItZi6SzZ?=
 =?us-ascii?Q?3ZDKuYMJUXnNPr2nPteiuwuQe7q3S/a/RihlRO7sBUG1X/15mv4RUnB1cB3i?=
 =?us-ascii?Q?CryGB/py4pUqqwU+1/FWDLep43BNb3hysvdZ1AlSKLAVk2/4/5ln1lXKsuD6?=
 =?us-ascii?Q?7P7deJanPJ+UZ4qIXBt3bK2l1xgbGJKAmM9Ue8VaTr+78PSmKvB3zcQos6BS?=
 =?us-ascii?Q?Kip9gRGG5GPQgwyi3GFNp7JM9c9CqUMXvfSUJOpUlgOSzMgUQv9ewWSJaoqm?=
 =?us-ascii?Q?XCRkn4TnlEMcgyWNdwiEuVvnWqhSq3cAnzoko4Q0zWPyJMW4i12rQ9TZ2tug?=
 =?us-ascii?Q?hCD/RMIEl8xGjZvBWYdxcXYf8BkRQiDXOXwVHQVj16TQl2xKhC0NAU7Y8DjQ?=
 =?us-ascii?Q?ySGOw/xlja6d8kEA2LCuRYIoHWX5WHVkEz/D+RCALCSOtp0SnEiF2cgxzd3U?=
 =?us-ascii?Q?3D6OJmy5enfdB6/UARlaUD94nU7fePzv0TRE0wu+nPLQzh8yA7Z1vrc9VkT7?=
 =?us-ascii?Q?ZA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 10917f0a-b770-41f0-8fc8-08ddff7a24e7
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2025 17:03:43.5058 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JlHJ4g6mujPccHIugLsqfiF7wGbBjik2NYml3t+ANJetCQ2TTreIcexq+YAlXIi1mT5/Xyc7ndXXoDVJNfeWHqh/yDglfDQKFybMOwKKbNo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7013
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

On Thu, Sep 25, 2025 at 10:47:24PM -0700, Upadhyay, Tejas wrote:
> 
> 
> > -----Original Message-----
> > From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Matt
> > Roper
> > Sent: 26 September 2025 05:17
> > To: intel-xe@lists.freedesktop.org
> > Cc: Roper, Matthew D <matthew.d.roper@intel.com>
> > Subject: [PATCH v2 18/22] drm/xe: Check that GT is not NULL before testing
> > Wa_16023588340
> > 
> > If the primary GT is disabled, skip the check for this workaround (which only
> > applies to dgpu platforms where the primary GT cannot be NULL).
> > 
> > Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> > ---
> >  drivers/gpu/drm/xe/display/xe_display_wa.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/display/xe_display_wa.c
> > b/drivers/gpu/drm/xe/display/xe_display_wa.c
> > index 8ada1cbcb16c..2aa1b8c03411 100644
> > --- a/drivers/gpu/drm/xe/display/xe_display_wa.c
> > +++ b/drivers/gpu/drm/xe/display/xe_display_wa.c
> > @@ -13,6 +13,7 @@
> >  bool intel_display_needs_wa_16023588340(struct intel_display *display)  {
> >  	struct xe_device *xe = to_xe_device(display->drm);
> > +	struct xe_gt *wa_gt = xe_root_mmio_gt(xe);
> > 
> > -	return XE_GT_WA(xe_root_mmio_gt(xe), 16023588340);
> > +	return wa_gt && XE_GT_WA(wa_gt, 16023588340);
> 
> Should we add fixes?, anyways

No need for fixes since the current code is fine today (the GT is always
non-NULL).  This is just preparing for future changes that will allow it
to start being NULL.


Matt

> 
> Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> 
> >  }
> > --
> > 2.51.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
