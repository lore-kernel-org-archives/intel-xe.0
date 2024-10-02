Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69B7DCEACF3
	for <intel-xe@archiver.kernel.org>; Wed,  2 Oct 2024 19:34:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34A7D10E436;
	Wed,  2 Oct 2024 19:34:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YKMGfTtY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CBBE10E436
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Oct 2024 19:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727897674; x=1759433674;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=A1RLm389EFdnHRyVIenvr+9SBQsuj0M/zjfem4ZOHkE=;
 b=YKMGfTtYrnoSyx+lv07IPLgUllII/MGzHLihGCsaY5FWSRudd8dlGP6x
 PWLwR6xNtwhuJC1gDdfFxnyEMphgdqD3V5MhY6njKlY1037q4jTI29J8d
 LPua8i1ChaPpdanPyi0X5MVo4YcgNRrw/E+dVbyCjYF4V7pe9DglbCDv3
 uUWE4DJhEYKpoDjFu4PEtYo3ihi90xDlPSuf9Nj15fwnRWEjd1gly1czv
 Nm4spUnIxD/CdgMRPjfa2syOOHykp8KjsEUqRuvhkmGvFEyt19B2Ka9Ps
 qUSrrrfvXD7EAwtnCa/ixlp8p2XbqFA7xTNi/cKA5+FWhAHP2d7YGB2Dt A==;
X-CSE-ConnectionGUID: QzbotZ8zQEqkF9O3um3lwQ==
X-CSE-MsgGUID: YTCpanxdSnSNS/WOH1ENJg==
X-IronPort-AV: E=McAfee;i="6700,10204,11213"; a="52482686"
X-IronPort-AV: E=Sophos;i="6.11,172,1725346800"; d="scan'208";a="52482686"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2024 12:34:33 -0700
X-CSE-ConnectionGUID: 1THpZS8VShyTC/wnnVePBg==
X-CSE-MsgGUID: u8aWZuD2S2+aBHD1zUYjZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,172,1725346800"; d="scan'208";a="74221521"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Oct 2024 12:34:34 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 2 Oct 2024 12:34:33 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 2 Oct 2024 12:34:32 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 2 Oct 2024 12:34:32 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.48) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 2 Oct 2024 12:34:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W/wZbUI945XgV9thmA6vJF7kfrNKVZVsEK9XtU5yk2oY9JESwOi/B332rNI5hCIrDNsVvL6OgUD5SvO+uJ/SNrx95r8RtRhQJXU1sa9j1GWVPUKKz+VokJLS27wN+uQ9oW4UH8QdgC2SSfOoqwebndtgoDdtzKxjWcsbPRXBJ1DkwJh936//8md0UB/4OHH4DF+MT0CPNtZwl9n1UpN9Aao1KqT79+hyezL0NoduAMWZkeUfJlcOEqq3s9vgwmArmEml13FDlyuSJYGx41Jw36IPmNjvEFZLJMoMKEdbnIA/E7y8CmUGC0pK1Zb7fGR4UbKSB34QmFqHBVwXQluMnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RkkXlulHyTvzIcq2/3913K+BnQZzv4zQbsoTxIEDAYU=;
 b=kaiX/XjnAm5vjsyqBzM7aVde6wokH/svJuiKt9U4lTmihlab2z/yIxxvinC64rZgRoKWbbF+++fMmO+9n7crr3FcXZjIgE5G/mFd7uUdoov1xKtH7NKH1DEARSqyVsg7kuqdPXiC0iskCzFMvMQLF8DTzNwLs3JHLTF+mHTLVhtg+q9Pv2pe1Es53IuSLLXip5muEKYhqjF58gMaPt6uS+ROZRtcdz2dudbtRavOIYhZn0AUj2aKjyhB3wKVLsToQenRSJREdvlpZZnWY3ba3Y53Kokg/OW0YM1j/lJB35cZa7oKj6rsBlRVqCWP+b+vm0hHWeR5C1IsdGC/lmdm9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by BL3PR11MB6337.namprd11.prod.outlook.com (2603:10b6:208:3b1::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.16; Wed, 2 Oct
 2024 19:34:30 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%4]) with mapi id 15.20.8005.024; Wed, 2 Oct 2024
 19:34:30 +0000
Date: Wed, 2 Oct 2024 15:34:23 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Matthew Brost <matthew.brost@intel.com>, "Michal
 Wajdeczko" <michal.wajdeczko@intel.com>, Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v4] drm/xe: Use fault injection infrastructure to find
 issues at probe time
Message-ID: <Zv2gP6cqeraKJEJY@intel.com>
References: <20240927151207.399354-1-francois.dugast@intel.com>
 <ZvbtcCe7ZuW_GzP3@intel.com> <ZvcAGXqFzE3Dm1Gg@fdugast-desk>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZvcAGXqFzE3Dm1Gg@fdugast-desk>
X-ClientProxiedBy: MW4P220CA0028.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:303:115::33) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|BL3PR11MB6337:EE_
X-MS-Office365-Filtering-Correlation-Id: 0532a094-ac32-4363-b7b8-08dce31939d8
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?Ezyv0quMXvUOcfi1B6Y49C0RpHUtevGRGvMAIRGX8xYaefzzJ5mqssjxxP?=
 =?iso-8859-1?Q?+10n69phOreW3z6qHT7Km4VV/HjE/X+GeaiQewKMBO6elwVMO+EVleIM0C?=
 =?iso-8859-1?Q?47lTV7qM5L2D1uiBspHIJluIk/3X6+OEifMArTWwEU/HvwC77h77lMM7Tk?=
 =?iso-8859-1?Q?4WnFf/p60SoML/2vuMhHnzUSvxIEtLr4OoTx4y577DqyNunplR/Ha3WU0a?=
 =?iso-8859-1?Q?asSd8Uxa/HtyE+TXOqSLR0VRuF+b36M9c8SJCxliz9hiQ2nwxteBa3zvRl?=
 =?iso-8859-1?Q?MG9F76aRR0ZL1a/qhObR/z2bmsK4YpZqGYcoH/s9eXkL+GQ7HT3M/mjp1n?=
 =?iso-8859-1?Q?W39GxPHZe015wZqMEpkZ11XmW95lWg9DG6BQPJeC9MG0UchKFq+CfJaiO+?=
 =?iso-8859-1?Q?iTd9Rn5DirnVCK6v4Y2be6eIvPIyiFf/KQnNxbp8ToDvYiPF+Ywrt7xag4?=
 =?iso-8859-1?Q?2cV4VCUdwLCZf/r1xZcTi6kE26y0CJ/znQQ2TyFLGQnOpUFmBv/ECNrE+V?=
 =?iso-8859-1?Q?AmJEpZXwiIQ+VHUWJuxgQFC1GW8OdvNuIOWWjQ1OKsuiXM7dxuulYG4fr6?=
 =?iso-8859-1?Q?geOwexBYTYXK5RCvrveJRfpcgssEBXm4M9s92u0mRzxtQ/xxOoRFJQgquU?=
 =?iso-8859-1?Q?vIjLBCrOaBBc6an+j9oZR7o7zE//8DiyTJBhSQhsnOoJUeDhmn9KjCZ4BK?=
 =?iso-8859-1?Q?IBtgSnaLfIECAngf2D3OcCY9kgbNIbGmRUPEUN3VnMxz3XnYUn0l/oaRAH?=
 =?iso-8859-1?Q?jXngVNTC7SkkXVUX09/IFthAbsl3yxFtnyP2zUEuVRZIGFIv6gHcRh/rbt?=
 =?iso-8859-1?Q?eBpUbA/YNVKOEsVwMJ8dSaZU3UIdRZM1CCBf6kZa1n3O31Adpp67HYO8bu?=
 =?iso-8859-1?Q?SSzpd0V0fndPUvqzWHakL4Tf4QSro5c2cSrnCZr+vvFNU+xde4gZOyeTTV?=
 =?iso-8859-1?Q?S4U7HkiybIqMEc3qb1CSUlTqfG5/9SGR8v4YA5JERGAX2N0AnxktCgY72a?=
 =?iso-8859-1?Q?zQddKIiqYtVOXGk/mfFrqJ6SEBG+U2M4KZD80tWGW6VhpnIohy8lLCzXfD?=
 =?iso-8859-1?Q?d2yiQm4xUS1JVsm/U3m7aPWRRnW0hQHP0MK/GOj2betXhgeZa5szTBDG5q?=
 =?iso-8859-1?Q?sbI1aM9McG2WxSLqz//7qv24nKNWVGmLqhBXMqb5Rfs278jqKb5+aV9N7e?=
 =?iso-8859-1?Q?vkZjudnuVRwHCOOwyY0+9E391ncw88b/0FPiu20y3DTEqTjugPmkDm5OpZ?=
 =?iso-8859-1?Q?bKnZmhhCn7KTUYrHrSxoYJUL6TMkOia02KWecFt8Qzr3Funqa5hLTze7a9?=
 =?iso-8859-1?Q?INJZi7+yUhQrJpQw8AmO3CDr+A=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?zVmM5SpRHlKT8+J/FjBUWabs3jPzjUt+U7mO/d/8m6/iL2PdynIbs9Q9ZI?=
 =?iso-8859-1?Q?8AOyca4w7fOHe6TFA5A8kkgGtyV27vqydC6n5eQYnFE6IyupHbeTxfdaN+?=
 =?iso-8859-1?Q?iqVyuZXrI1ajbRXfhNp247EKNJkphd/5cexLoWO/98LoPlrkoodV3H5Ffx?=
 =?iso-8859-1?Q?PAsJHnv+bL3AZOfmsdushx7xApF0x38xyQk3ko3EJt+Jd4V8kf2HwK8wBC?=
 =?iso-8859-1?Q?V30we9Fq7LiVlW9FwpHy+FwnGDgkqkYnbgXcn6nhnSQ6WPRi7OEBBj5k0K?=
 =?iso-8859-1?Q?4kdXRGt4rd0iNaxgJ4HBMozOPNsxlO0diHN4BzFvCfaHKAPgGjIqCDusPu?=
 =?iso-8859-1?Q?2UzYvoD+9j8CROFFo/fXqi9Di+DX/trmfinIkd2DKzmWgPJpiqKW5nz1Jc?=
 =?iso-8859-1?Q?/kdujV/A0QGReXPt/Kb74QlR6RMB9eZcxKq0bDuonKTUU0KXmDTjgNxSOa?=
 =?iso-8859-1?Q?4GIsjwLITF2JVGJhgRjte38SoN2vpBMBVMX5Qks+3/D+VCjQIP3LfVC0Cc?=
 =?iso-8859-1?Q?ARUXaqosPTWXxrlxq6uYAl8cTrOjdNZ6ZTGwJU/f9xdZqVDr9+BMPFANWX?=
 =?iso-8859-1?Q?xPSBk2jC/5MTMQAvRcB5phSRNQY0BOOxMph1AifkQx5IkCvcn3RX8Q0mP4?=
 =?iso-8859-1?Q?+rw57JgQZPpozan4GhaNqZUO7snde7S191c+urVMVUhdsUdmdQU1tcSxcK?=
 =?iso-8859-1?Q?7lvliTGhI8sDTLgqGtUSf3v8wFVCBBzsT0NyM2VGeMX4GOArdfAux+5KxM?=
 =?iso-8859-1?Q?kDk1HJoIUzHlgvGrQBQ99ShjhCTJhmHjBmtkTltIavX3Rb8bdXstmVg8yg?=
 =?iso-8859-1?Q?uuZR+0B+989BczCaqY1Ii0J+IE+wQScZLSI1/TIgicJ/CDpFjY1otOahK4?=
 =?iso-8859-1?Q?bBzN/W1JET0a33T62daALOjnrpG1UN9OECJrIJBcEzVLpfKM7sUG1hRgMH?=
 =?iso-8859-1?Q?FrPvW4J9/+gEyEUsPbpaDfGoHlpO4lidOKHxanR4vBEbn+yjxbHkWRnTBf?=
 =?iso-8859-1?Q?cg9Eb76UbsF+BelLiwEAIhcjm33592R6631cTY38Rrh1iegcVptmQB9J+X?=
 =?iso-8859-1?Q?6LuRhAjkgDkYX75zLV0TtnA6RQun0xRMTJ8v8BkMfs5hEQlbLcdhaJiddD?=
 =?iso-8859-1?Q?fXoYzMT2WwWfusb/heH4GdHzMhkep8+zAVGxJHJeo2Ppvg8BQ88Pu+lGRW?=
 =?iso-8859-1?Q?snQDK2aX2VFowhlDiAXe6NRBMaA/t/CORh10pCz9QfVZ5Iflzk+duHH+dM?=
 =?iso-8859-1?Q?Nb5rDM+vK20q+FMWICcPUXV4DZWMrKhNvPKOyseUjCjMb4Nw/KGfYmRgzW?=
 =?iso-8859-1?Q?Q3qZPrpgXZmoMjWe8fFfHpKiC3gKhlRmEOs7LbFuvOGjZo7ZtgnLZBR1V0?=
 =?iso-8859-1?Q?KWSWwt/VhMpMTqhLSwd/lqdKnYXNa3i1PzfsAL1vR2PxaIpMx6e0iH2ySy?=
 =?iso-8859-1?Q?AurKdgIGYAdSYkBUJwBqYM6EpZTmev4Hhw6eJlO4Upyk1gatCNMUMQhGKI?=
 =?iso-8859-1?Q?5we3i/iXKCuqqWBiHDZ6b2rJN91HD6NEZoivVZUK7EUxAJ3GCN8GgP3WE+?=
 =?iso-8859-1?Q?zgBfQczgMsLBni2DE71ejIwxaXaOey+mj30FVk4CPksznkxgmcBR1SWCzw?=
 =?iso-8859-1?Q?++IsAAISGb8H2fS2ET/3U9HkOBE52U9YvEtMQjHn25/04fRe/itkYgFQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0532a094-ac32-4363-b7b8-08dce31939d8
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2024 19:34:29.9969 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fg7kaOCYqLCjQDO4Wn8CxeMJ2vtsMmTmsJgCehKwhm2qJbVl8GyxwA1Fna+kOMAqQa1yE7ObBAXjY23HsA/yEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6337
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

On Fri, Sep 27, 2024 at 08:57:29PM +0200, Francois Dugast wrote:
> On Fri, Sep 27, 2024 at 01:37:52PM -0400, Rodrigo Vivi wrote:
> > On Fri, Sep 27, 2024 at 05:12:06PM +0200, Francois Dugast wrote:
> > > The kernel fault injection infrastructure is used to test proper error
> > > handling during probe. The return code of the functions using
> > > ALLOW_ERROR_INJECTION() can be conditionnally modified at runtime by
> > > tuning some debugfs entries. This requires CONFIG_FUNCTION_ERROR_INJECTION
> > > (among others).
> > > 
> > > One way to use fault injection at probe time by making each of those
> > > functions fail one at a time is:
> > > 
> > >     FAILTYPE=fail_function
> > >     DEVICE="0000:00:08.0" # depends on the system
> > >     ERRNO=-12 # -ENOMEM, can depend on the function
> > > 
> > >     echo N > /sys/kernel/debug/$FAILTYPE/task-filter
> > >     echo 100 > /sys/kernel/debug/$FAILTYPE/probability
> > >     echo 0 > /sys/kernel/debug/$FAILTYPE/interval
> > >     echo -1 > /sys/kernel/debug/$FAILTYPE/times
> > >     echo 0 > /sys/kernel/debug/$FAILTYPE/space
> > >     echo 1 > /sys/kernel/debug/$FAILTYPE/verbose
> > > 
> > >     modprobe xe
> > >     echo $DEVICE > /sys/bus/pci/drivers/xe/unbind
> > > 
> > >     grep -oP "^.* \[xe\]" /sys/kernel/debug/$FAILTYPE/injectable | \
> > >     cut -d ' ' -f 1 | while read -r FUNCTION ; do
> > >         echo "Injecting fault in $FUNCTION"
> > >         echo "" > /sys/kernel/debug/$FAILTYPE/inject
> > >         echo $FUNCTION > /sys/kernel/debug/$FAILTYPE/inject
> > >         printf %#x $ERRNO > /sys/kernel/debug/$FAILTYPE/$FUNCTION/retval
> > >         echo $DEVICE > /sys/bus/pci/drivers/xe/bind
> > >     done
> > > 
> > >     rmmod xe
> > > 
> > > It will also be integrated into IGT for systematic execution by CI.
> > > 
> > > v2: Wrappers are not needed in the cases covered by this patch, so
> > >     remove them and use ALLOW_ERROR_INJECTION() directly.
> > > 
> > > v3: Document the use of fault injection at probe time in xe_pci_probe
> > >     and refer to it where ALLOW_ERROR_INJECTION() is used.
> > 
> > I now have a feeling that we could have a xe_fault_injection component,
> > that would be the only one including linux/fault-inject.h, the only
> > place where these wrappers would be declared and everything documented.
> 
> The intention here is actually to avoid adding a driver-specific layer as
> was done in i915. There is no wrapper anymore with this version (and the
> previous one), only direct uses of the ALLOW_ERROR_INJECTION() macro, so I
> am not sure what a xe_fault_injection component would contain besides an
> "#include <linux/fault-inject.h>".

My thought was not exactly a new layer. Just a centralization point.
Like xe_wa_oob.rules is just a centralization of the implemented workarounds.

But this can be done in a extra step if needed. No strong feelings here.

Regarding the code itself it looks right.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> 
> > 
> > I feel that /* See xe_pci_probe() */ everywhere is a bit too much as
> > weel...
> 
> This is an attempt to centralize thorough explanations and refer to it as
> suggested by Jani. I believe documenting it around xe_pci_probe() makes
> sense for the case of the fault injections brought by this patch because
> they are only relevant for the execution of that function, during probe.
> 
> The approach and documentation would likely look a bit different when we
> extend the use of fault injection in the driver to test error paths and
> unwinding in the IOCTLs. Also, in that case we might need wrappers as in
> the first version of this patch.
> 
> Francois
> 
> > 
> > > 
> > > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> > > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > > Cc: Jani Nikula <jani.nikula@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_device.c    |  3 +++
> > >  drivers/gpu/drm/xe/xe_ggtt.c      |  2 ++
> > >  drivers/gpu/drm/xe/xe_guc_ads.c   |  3 +++
> > >  drivers/gpu/drm/xe/xe_guc_ct.c    |  2 ++
> > >  drivers/gpu/drm/xe/xe_guc_log.c   |  3 +++
> > >  drivers/gpu/drm/xe/xe_guc_relay.c |  2 ++
> > >  drivers/gpu/drm/xe/xe_pci.c       | 19 +++++++++++++++++++
> > >  drivers/gpu/drm/xe/xe_pm.c        |  2 ++
> > >  drivers/gpu/drm/xe/xe_sriov.c     |  3 +++
> > >  drivers/gpu/drm/xe/xe_tile.c      |  3 +++
> > >  drivers/gpu/drm/xe/xe_uc_fw.c     |  2 ++
> > >  drivers/gpu/drm/xe/xe_wa.c        |  2 ++
> > >  drivers/gpu/drm/xe/xe_wopcm.c     |  3 +++
> > >  13 files changed, 49 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> > > index 8e9b551c7033..ad70a1bdd476 100644
> > > --- a/drivers/gpu/drm/xe/xe_device.c
> > > +++ b/drivers/gpu/drm/xe/xe_device.c
> > > @@ -6,6 +6,7 @@
> > >  #include "xe_device.h"
> > >  
> > >  #include <linux/delay.h>
> > > +#include <linux/fault-inject.h>
> > >  #include <linux/units.h>
> > >  
> > >  #include <drm/drm_aperture.h>
> > > @@ -382,6 +383,7 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
> > >  err:
> > >  	return ERR_PTR(err);
> > >  }
> > > +ALLOW_ERROR_INJECTION(xe_device_create, ERRNO); /* See xe_pci_probe() */
> > >  
> > >  static bool xe_driver_flr_disabled(struct xe_device *xe)
> > >  {
> > > @@ -550,6 +552,7 @@ static int wait_for_lmem_ready(struct xe_device *xe)
> > >  
> > >  	return 0;
> > >  }
> > > +ALLOW_ERROR_INJECTION(wait_for_lmem_ready, ERRNO); /* See xe_pci_probe() */
> > >  
> > >  static void update_device_info(struct xe_device *xe)
> > >  {
> > > diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> > > index f68af56c3f86..47bfd9d2635d 100644
> > > --- a/drivers/gpu/drm/xe/xe_ggtt.c
> > > +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> > > @@ -5,6 +5,7 @@
> > >  
> > >  #include "xe_ggtt.h"
> > >  
> > > +#include <linux/fault-inject.h>
> > >  #include <linux/io-64-nonatomic-lo-hi.h>
> > >  #include <linux/sizes.h>
> > >  
> > > @@ -264,6 +265,7 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
> > >  
> > >  	return 0;
> > >  }
> > > +ALLOW_ERROR_INJECTION(xe_ggtt_init_early, ERRNO); /* See xe_pci_probe() */
> > >  
> > >  static void xe_ggtt_invalidate(struct xe_ggtt *ggtt);
> > >  
> > > diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
> > > index 66d4e5e95abd..04485461aa20 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> > > +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> > > @@ -5,6 +5,8 @@
> > >  
> > >  #include "xe_guc_ads.h"
> > >  
> > > +#include <linux/fault-inject.h>
> > > +
> > >  #include <drm/drm_managed.h>
> > >  
> > >  #include <generated/xe_wa_oob.h>
> > > @@ -418,6 +420,7 @@ int xe_guc_ads_init(struct xe_guc_ads *ads)
> > >  
> > >  	return 0;
> > >  }
> > > +ALLOW_ERROR_INJECTION(xe_guc_ads_init, ERRNO); /* See xe_pci_probe() */
> > >  
> > >  /**
> > >   * xe_guc_ads_init_post_hwconfig - initialize ADS post hwconfig load
> > > diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> > > index 4b95f75b1546..816dc897e29f 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> > > +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> > > @@ -8,6 +8,7 @@
> > >  #include <linux/bitfield.h>
> > >  #include <linux/circ_buf.h>
> > >  #include <linux/delay.h>
> > > +#include <linux/fault-inject.h>
> > >  
> > >  #include <kunit/static_stub.h>
> > >  
> > > @@ -209,6 +210,7 @@ int xe_guc_ct_init(struct xe_guc_ct *ct)
> > >  	ct->state = XE_GUC_CT_STATE_DISABLED;
> > >  	return 0;
> > >  }
> > > +ALLOW_ERROR_INJECTION(xe_guc_ct_init, ERRNO); /* See xe_pci_probe() */
> > >  
> > >  #define desc_read(xe_, guc_ctb__, field_)			\
> > >  	xe_map_rd_field(xe_, &guc_ctb__->desc, 0,		\
> > > diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
> > > index a37ee3419428..651543721ce5 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc_log.c
> > > +++ b/drivers/gpu/drm/xe/xe_guc_log.c
> > > @@ -5,6 +5,8 @@
> > >  
> > >  #include "xe_guc_log.h"
> > >  
> > > +#include <linux/fault-inject.h>
> > > +
> > >  #include <drm/drm_managed.h>
> > >  
> > >  #include "xe_bo.h"
> > > @@ -96,3 +98,4 @@ int xe_guc_log_init(struct xe_guc_log *log)
> > >  
> > >  	return 0;
> > >  }
> > > +ALLOW_ERROR_INJECTION(xe_guc_log_init, ERRNO); /* See xe_pci_probe() */
> > > diff --git a/drivers/gpu/drm/xe/xe_guc_relay.c b/drivers/gpu/drm/xe/xe_guc_relay.c
> > > index ade6162dc259..8f62de026724 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc_relay.c
> > > +++ b/drivers/gpu/drm/xe/xe_guc_relay.c
> > > @@ -5,6 +5,7 @@
> > >  
> > >  #include <linux/bitfield.h>
> > >  #include <linux/delay.h>
> > > +#include <linux/fault-inject.h>
> > >  
> > >  #include <drm/drm_managed.h>
> > >  
> > > @@ -355,6 +356,7 @@ int xe_guc_relay_init(struct xe_guc_relay *relay)
> > >  
> > >  	return drmm_add_action_or_reset(&xe->drm, __fini_relay, relay);
> > >  }
> > > +ALLOW_ERROR_INJECTION(xe_guc_relay_init, ERRNO); /* See xe_pci_probe() */
> > >  
> > >  static u32 to_relay_error(int err)
> > >  {
> > > diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> > > index 41445245a287..7ffee06fab13 100644
> > > --- a/drivers/gpu/drm/xe/xe_pci.c
> > > +++ b/drivers/gpu/drm/xe/xe_pci.c
> > > @@ -770,6 +770,25 @@ static void xe_pci_remove(struct pci_dev *pdev)
> > >  	pci_set_drvdata(pdev, NULL);
> > >  }
> > >  
> > > +/*
> > > + * Probe the PCI device, initialize various parts of the driver.
> > > + *
> > > + * Fault injection is used to test the error paths of some initialization
> > > + * functions called either directly from xe_pci_probe() or indirectly for
> > > + * example through xe_device_probe(). Those functions use the kernel fault
> > > + * injection capabilities infrastructure, see
> > > + * Documentation/fault-injection/fault-injection.rst for details. The macro
> > > + * ALLOW_ERROR_INJECTION() is used to conditionally skip function execution
> > > + * at runtime and use a provided return value. The first requirement for
> > > + * error injectable functions is proper handling of the error code by the
> > > + * caller for recovery, which is always the case here. The second
> > > + * requirement is that no state is changed before the first error return.
> > > + * It is not strictly fullfilled for all initialization functions using the
> > > + * ALLOW_ERROR_INJECTION() macro but this is acceptable because for those
> > > + * error cases at probe time, the error code is simply propagated up by the
> > > + * caller. Therefore there is no consequence on those specific callers when
> > > + * function error injection skips the whole function.
> > > + */
> > >  static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
> > >  {
> > >  	const struct xe_device_desc *desc = (const void *)ent->driver_data;
> > > diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> > > index 33eb039053e4..40f7c844ed44 100644
> > > --- a/drivers/gpu/drm/xe/xe_pm.c
> > > +++ b/drivers/gpu/drm/xe/xe_pm.c
> > > @@ -5,6 +5,7 @@
> > >  
> > >  #include "xe_pm.h"
> > >  
> > > +#include <linux/fault-inject.h>
> > >  #include <linux/pm_runtime.h>
> > >  
> > >  #include <drm/drm_managed.h>
> > > @@ -263,6 +264,7 @@ int xe_pm_init_early(struct xe_device *xe)
> > >  
> > >  	return 0;
> > >  }
> > > +ALLOW_ERROR_INJECTION(xe_pm_init_early, ERRNO); /* See xe_pci_probe() */
> > >  
> > >  /**
> > >   * xe_pm_init - Initialize Xe Power Management
> > > diff --git a/drivers/gpu/drm/xe/xe_sriov.c b/drivers/gpu/drm/xe/xe_sriov.c
> > > index 69a066ef20c0..ef10782af656 100644
> > > --- a/drivers/gpu/drm/xe/xe_sriov.c
> > > +++ b/drivers/gpu/drm/xe/xe_sriov.c
> > > @@ -3,6 +3,8 @@
> > >   * Copyright © 2023 Intel Corporation
> > >   */
> > >  
> > > +#include <linux/fault-inject.h>
> > > +
> > >  #include <drm/drm_managed.h>
> > >  
> > >  #include "regs/xe_regs.h"
> > > @@ -119,6 +121,7 @@ int xe_sriov_init(struct xe_device *xe)
> > >  
> > >  	return drmm_add_action_or_reset(&xe->drm, fini_sriov, xe);
> > >  }
> > > +ALLOW_ERROR_INJECTION(xe_sriov_init, ERRNO); /* See xe_pci_probe() */
> > >  
> > >  /**
> > >   * xe_sriov_print_info - Print basic SR-IOV information.
> > > diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
> > > index dda5268507d8..07cf7cfe4abd 100644
> > > --- a/drivers/gpu/drm/xe/xe_tile.c
> > > +++ b/drivers/gpu/drm/xe/xe_tile.c
> > > @@ -3,6 +3,8 @@
> > >   * Copyright © 2023 Intel Corporation
> > >   */
> > >  
> > > +#include <linux/fault-inject.h>
> > > +
> > >  #include <drm/drm_managed.h>
> > >  
> > >  #include "xe_device.h"
> > > @@ -129,6 +131,7 @@ int xe_tile_init_early(struct xe_tile *tile, struct xe_device *xe, u8 id)
> > >  
> > >  	return 0;
> > >  }
> > > +ALLOW_ERROR_INJECTION(xe_tile_init_early, ERRNO); /* See xe_pci_probe() */
> > >  
> > >  static int tile_ttm_mgr_init(struct xe_tile *tile)
> > >  {
> > > diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
> > > index eab9456e051f..087fb96f707e 100644
> > > --- a/drivers/gpu/drm/xe/xe_uc_fw.c
> > > +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
> > > @@ -4,6 +4,7 @@
> > >   */
> > >  
> > >  #include <linux/bitfield.h>
> > > +#include <linux/fault-inject.h>
> > >  #include <linux/firmware.h>
> > >  
> > >  #include <drm/drm_managed.h>
> > > @@ -797,6 +798,7 @@ int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
> > >  
> > >  	return err;
> > >  }
> > > +ALLOW_ERROR_INJECTION(xe_uc_fw_init, ERRNO); /* See xe_pci_probe() */
> > >  
> > >  static u32 uc_fw_ggtt_offset(struct xe_uc_fw *uc_fw)
> > >  {
> > > diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> > > index 22c148b1e996..94ea76b098ed 100644
> > > --- a/drivers/gpu/drm/xe/xe_wa.c
> > > +++ b/drivers/gpu/drm/xe/xe_wa.c
> > > @@ -8,6 +8,7 @@
> > >  #include <drm/drm_managed.h>
> > >  #include <kunit/visibility.h>
> > >  #include <linux/compiler_types.h>
> > > +#include <linux/fault-inject.h>
> > >  
> > >  #include <generated/xe_wa_oob.h>
> > >  
> > > @@ -850,6 +851,7 @@ int xe_wa_init(struct xe_gt *gt)
> > >  
> > >  	return 0;
> > >  }
> > > +ALLOW_ERROR_INJECTION(xe_wa_init, ERRNO); /* See xe_pci_probe() */
> > >  
> > >  void xe_wa_dump(struct xe_gt *gt, struct drm_printer *p)
> > >  {
> > > diff --git a/drivers/gpu/drm/xe/xe_wopcm.c b/drivers/gpu/drm/xe/xe_wopcm.c
> > > index 93c82825d896..ada0d0aa6b74 100644
> > > --- a/drivers/gpu/drm/xe/xe_wopcm.c
> > > +++ b/drivers/gpu/drm/xe/xe_wopcm.c
> > > @@ -5,6 +5,8 @@
> > >  
> > >  #include "xe_wopcm.h"
> > >  
> > > +#include <linux/fault-inject.h>
> > > +
> > >  #include "regs/xe_guc_regs.h"
> > >  #include "xe_device.h"
> > >  #include "xe_force_wake.h"
> > > @@ -268,3 +270,4 @@ int xe_wopcm_init(struct xe_wopcm *wopcm)
> > >  
> > >  	return ret;
> > >  }
> > > +ALLOW_ERROR_INJECTION(xe_wopcm_init, ERRNO); /* See xe_pci_probe() */
> > > -- 
> > > 2.43.0
> > > 
