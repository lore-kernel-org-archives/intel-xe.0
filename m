Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B285C35274
	for <intel-xe@archiver.kernel.org>; Fri, 15 Dec 2023 14:33:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC18E10EA47;
	Fri, 15 Dec 2023 14:32:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 341B010EA42
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Dec 2023 14:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702650778; x=1734186778;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=OTu7IBaoBuzrbd95pVPLaASAKzGT6TAh9MNBPe278tw=;
 b=i2iXpdxcVr0GsCPSbWKpHZtEDDImFFls52dlzS0IVB4QogfvG0KE9cBL
 Ia8gk1IKyeKDkv7iV6XIoRx1hpe3tKoPl8z1yqLfkHXI1SsRkQbuF5fNN
 ByFwy9Wq13O4P6PQXDYCX4o3Y8y6x8Zw206PNFWVqBJJlYxmD3B3ZOUXj
 mlUuucGrXabet0ITf3bz8nqnT1Fgr5bpXxDjupJ4QRYURPEEKm8fNQwe8
 uKAgxUY8Ny6QwF5Uf3v2iOnDbGBihnoqoBMq4pdppxd7uwEvT3r1Hx7uL
 avl214a/bF7VQyqWtOQFHeIAm4ql5bGIVXlEZTJSABuaEL3/prB95nN4P w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="394156118"
X-IronPort-AV: E=Sophos;i="6.04,278,1695711600"; d="scan'208";a="394156118"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2023 06:32:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="750950882"
X-IronPort-AV: E=Sophos;i="6.04,278,1695711600"; d="scan'208";a="750950882"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Dec 2023 06:32:50 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 15 Dec 2023 06:32:44 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 15 Dec 2023 06:32:42 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 15 Dec 2023 06:32:42 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 15 Dec 2023 06:32:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k9Lv9ofxtV6lZ7/oTOCkmqM3HdYldKJtebsYxgwcbMEXYvDGK3D8+UKXT7lYtup7goR2LG2Atu+5G5GI0vLThL804p/f99M9+28boAME72ZlSyjwmvkdrs8ss3L/EV8W0HZxrjRghpKqEp7M3/LreGoy4ZGQl9iyrG9y65mm5MIifi7EmL/nPAtpHFdsYFhIfDTv2zMtkLH/D4X9SVRPzeGaybl2p7xhzE+E54JXwrt+NpwFjX5oe/eD6CdEKONPNk3VDPMEvHZWbrFErUFoeTgguxhDY0tvuR82Cl67UryxsC7ao3iGjTG5R2nzVY9i+AAcBmuvDZRgkJMfTPYfHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hv5aMO2Xz9Z6Hf19fXTyDNkrF2eG3cjP9t54+ALfWPg=;
 b=lPeeDMsiZPYY/IEKeqHR2oW4R1Gd6gnhEOqiYik2+MVZIifjH7P7LzkJ5aoJAikC+1JWjxjo2DBcWPJsIoAlWp1ieFsTTKENz35J+exoep6wSchG+XdXHA7E7/STqRjMywT9pJPYotAWVAesdKy+tS86v4d+/928bEQYjx8BtO+t/jwcCEbUPyAy2XHU/JWc4JRWK3E6ouJ0bseUsbrloQd/X+nD+IBPZoezF30E9+0QuuhNlrI/p50UdaYQ4SsIm8yyqFF7W5N+m3vwKNkSN6cv+UQSQ6u/bISFsA/+tY9YpYJ23AMTDAVGyyytYGg0ymBXgBqzcpid8C/Y/ppHEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH8PR11MB8038.namprd11.prod.outlook.com (2603:10b6:510:25e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.28; Fri, 15 Dec
 2023 14:32:40 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7091.032; Fri, 15 Dec 2023
 14:32:39 +0000
Date: Fri, 15 Dec 2023 09:32:36 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH 3/3] drm/xe: Enable W=1 warnings by default
Message-ID: <ZXxjhJvm6QQSOGEo@intel.com>
References: <20231214213954.3223263-1-lucas.demarchi@intel.com>
 <20231214213954.3223263-3-lucas.demarchi@intel.com>
 <ZXuiTCekgfRNBlKO@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZXuiTCekgfRNBlKO@intel.com>
X-ClientProxiedBy: SJ0PR03CA0228.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::23) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH8PR11MB8038:EE_
X-MS-Office365-Filtering-Correlation-Id: 954992c6-d247-4f96-7da7-08dbfd7ab05e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qk33S6I1jTcBqCBjKU3YegqRDi6G+dgSb7iZorEyvznADANLedsoBAt06NQC+lxOcLob/pEkxb718a+aAMpMSc9Bj0O2Df4/bH7iOLuyXPNeBCF50W1i5VuGrPGCN/oRGpEvQlmYq9pFLkfOaLPPLZTU3Bccr7VkUIzFX7jKbX4Ns5WRRvNPS1+vqbOEtlAjm0EnAGEMCPAvSbkGqMAfApWZwgcGvEeLEZxHQnQoIvN6+XM3Kfw3Ex2Kk+g8JE0wi5/KvD080OMQc2Tl67XO/x3QmP7WkNfgB3krHQUDcmxTPM9oPfukN43I8JnurjfYauUhwVEVcPVT7V2SfCWBEwiiWNubaPgony7p8kuyZJ+BiIoR/qQ+trAY7rGY5wTcQEowII1lI2BcV4Gdcqy4/R7mKtvIpbf97Qgn18trGtAl6zxJfp7v6JC5ynp4SR4oaBhzn96bh6a1Svp0vOKsk8HuyyEQ4QCT18rvV2MB6kLNjUAKcMCBZGH7JaIsKL0OChIxtLpfulxiurFlIlHOefXkwVy+UKmfa3Qs5ufOaW5PELTrSEtr3tnfUW9UoUltbISF/r/Nc70QbXEc3W7NsXWkYo0aRfxngex0h2sgSvk28/GJ8zKRW2npd09QaG/B
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(366004)(136003)(39860400002)(396003)(230173577357003)(230922051799003)(230273577357003)(186009)(451199024)(64100799003)(1800799012)(2616005)(26005)(6506007)(6512007)(83380400001)(44832011)(5660300002)(8936002)(41300700001)(2906002)(6666004)(478600001)(6862004)(8676002)(66946007)(6636002)(66476007)(316002)(4326008)(66556008)(6486002)(37006003)(86362001)(82960400001)(38100700002)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M0htTVBxRzhhZnJkVWUrKzZBaDh3R3VxWGl5YnNTTFQrbDkzRWJabDZMSUpO?=
 =?utf-8?B?em9SV0djYy9XM0kzbGFNWHRMOWdUbGQyMHl4QUR6TWo2Z1NOK3h2SjNFbzFQ?=
 =?utf-8?B?Z2c0YmJtMHhFd3o2Mm1sd1Q5N2hqdzl5RW1KTXJPRUNSaUVpYys5MmpOdGNE?=
 =?utf-8?B?cWFoS2x4UHFYWnNVVzVSdVNCUHNtN2hkdHlJMGczTjlMMEVyUjlFTXp3Z3Bv?=
 =?utf-8?B?ZlE5aFg0UUFvUkphazNleU1CY2NYSXQ5bnJpSXpPUHQ5VDdaWHB0TWZKc3hO?=
 =?utf-8?B?eXRGTkh3MDgyUzdieG5BVXE0cHRBdVpJNWJUNUVZQWphYUltU3J6bkRIUW1R?=
 =?utf-8?B?VHBRSFNKdlk0WXJKdWtpWHFEN0ZMNi9SQWx2UU01akZQS3R6RnJ3OCtaamdO?=
 =?utf-8?B?di82SjA1bThxMlJOMmxYSXY1TVlSNXMrUG8walNPMlNyOUtZNytkVUpIU2N2?=
 =?utf-8?B?ZFIxN2ZWWlE5eXVOZFNhZHN0WWJadGhBVU9MaDZES0o5VlVuWmNHYXVKTEc1?=
 =?utf-8?B?bzFiMm03cTRJcG5NMXpaYXJPZzhReDNoZGtONEZMWnJaRDRsVFVVT1VSVUt0?=
 =?utf-8?B?QThVYThjTEZ6aWVrZWhFUUVqSWlUYlB6Qzd4ZGhEc2FJYU5NcVZUM2ZvWlYy?=
 =?utf-8?B?WlZqM2lOeHQvMkZVZHpTWk1HQ21LbXJzTVRUb3dlYWNOUGJWNWpkY0V5a1Ux?=
 =?utf-8?B?VzdCLzZlTSt5NjB3K0hJNFJUR2RsdkhJWHk3WHVDQk5CTjZJNDFjN0JlRk0z?=
 =?utf-8?B?TjFYYldUL2tzMENUZ25Yd0NudVVvZ3hoUXkzRUo1YXNwWTJOY2w3ZXJtTCtU?=
 =?utf-8?B?Um8zUkRUbFlORTR4dzE2ZUgvYWozU1oycnUxK1NYQ3VyeGNxYVF2YWhrT2FF?=
 =?utf-8?B?Q3Flb2lHVHBYQmFhbTlDRk8xZDdhdzIybHlsclFWZHhsa0s2V2wyUjdJUVVl?=
 =?utf-8?B?S1VsZFQzdVkvYWVWMVJmQTcvVnhjMnNrZjQwMkxVWm1oVHMwUXE5bXN4bmlK?=
 =?utf-8?B?V0ttYzcxVmRIM1N5VU5RYXFZZTQ3eWJZa3oyUFlZRGZsYnlWU1V1VXNyaHRX?=
 =?utf-8?B?RVFrTnQxQjJXMGQyMEFZUzBNbGExMkgzNUd1T0xtVWhpUVpiYXNIamRrSGpK?=
 =?utf-8?B?QUxuVzdRcndqNzY4akp2REJRQUR6ZmsvU04rMVBOc00ranVrN1ZjMldLaFU3?=
 =?utf-8?B?eWlMakVMU1ZFaUFRNVNBNnM2NmcwNytlOUhZNHRoaFFXR1c3c1pnN0hpTVkw?=
 =?utf-8?B?ZjlpL05SSlltSDlTd2VwYTBETmcyUGd2eXdsUG9CSi9sejlmSDRMeEtMSE5C?=
 =?utf-8?B?T3FQbkdVSGhIUDM3TFE4VVZ5YmlHTFYyWUlNMXZqSGUzeWtvZDhrOUdBZzhr?=
 =?utf-8?B?M0pSdXhndTBtenIvT2RYdzAvOWdhUTk5MW5iTnk2ZVA3QTNyV3FwVTJ6Y3N1?=
 =?utf-8?B?QzB3cS9aQkNhd1JIcFhZbGNWOUN6NUdRQWlIREF4aWswZHlxMzhhNVJhdEhp?=
 =?utf-8?B?dXJ3YUlHZlJlZ3lGYmpnL0tPZ0k2MEplN1F2VVpVOVBrRm52Qmh4NnBlNmtt?=
 =?utf-8?B?WmkwQU1WM2ZZZllRazZ5R3M1cE9vRU1uZmtpUkhQR3Bya2ZndTU5TkRQZXFl?=
 =?utf-8?B?emp2eGx3Unh5ZngzWjdHNUJhWkRTelZlSHkwbVUvdGN1MFdvUlE5WjdqWEtC?=
 =?utf-8?B?VjI0aXF4RWM3eDNRc0dZWHJraEVIQktpVHlobEo0N0l6OWJyTHhYbGVMOU91?=
 =?utf-8?B?bDBDNm9JTGJCTzBTOFpDcjZZNmQ3cm9ZUHJNbmF3bG9KWUp0UHZ3SHFQaXFV?=
 =?utf-8?B?cU1VZUJlS1JHMmhtR29KQnE1TThyOXp5MUw4aTh5ckNtaFk1bWlRTVhrUnN4?=
 =?utf-8?B?TS9RdnhEaXhTYVJLM3NZMGlzMmdSQkxGMGVKV2Rka01WN29BU1UyMjFqTGFo?=
 =?utf-8?B?eVM1dUVWZE1WUDlJMXErVTFjN0RldGEyd3lRTmlicWpEeHYwZEZCN053T2k3?=
 =?utf-8?B?aGJmWUVTK3RtWTU0RWx0cUlodXhOTUxEd2lxV3pzTk5vQ2FNcWNsV05vb2xz?=
 =?utf-8?B?NzFBV3F2N2dzQnVzRHJDRlhiUlZ2VnEvdVAxaHZmSHlBdXJIbVFzam4vUFRT?=
 =?utf-8?B?Uy9XRW13aFkwK1BSQTI1NVNrdUxpaHArdkY5SXNNc2tVOGZSQ2xOdFJLK1BJ?=
 =?utf-8?B?R2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 954992c6-d247-4f96-7da7-08dbfd7ab05e
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2023 14:32:39.4196 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kgaY9tOucjeM7NCBvT/aIBh+1OFYRP3OgxlyIOhHd5SjberYdysSyxlsXX0kdceO+v7Qy5VmbmGVwiZjTVr6wA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8038
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Dec 14, 2023 at 07:48:12PM -0500, Rodrigo Vivi wrote:
> On Thu, Dec 14, 2023 at 01:39:54PM -0800, Lucas De Marchi wrote:
> > Like done in commit 2250c7ead8ad ("drm/i915: enable W=1 warnings by default")
> > for i915, enable W=1 warnings by default in xe.
> 
> I'm afraid we might have one more case before we can enable it:
> 
> drivers/gpu/drm/xe/display/ext/i915_utils.c:18:5: warning: no previous prototype for ‘__i915_inject_probe_error’ [-Wmissing-prototypes]
>    18 | int __i915_inject_probe_error(struct drm_i915_private *i915, int err,
>       |     ^~~~~~~~~~~~~~~~~~~~~~~~~

nevermind. please ignore this. it was a local failure because was not building
everything.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
on the series.

> 
> > 
> > Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> > ---
> >  drivers/gpu/drm/xe/Makefile | 47 ++++++++++++++++++++++---------------
> >  1 file changed, 28 insertions(+), 19 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> > index f4ae063a7005..6790c049d89e 100644
> > --- a/drivers/gpu/drm/xe/Makefile
> > +++ b/drivers/gpu/drm/xe/Makefile
> > @@ -3,25 +3,34 @@
> >  # Makefile for the drm device driver.  This driver provides support for the
> >  # Direct Rendering Infrastructure (DRI) in XFree86 4.1.0 and higher.
> >  
> > -# Add a set of useful warning flags and enable -Werror for CI to prevent
> > -# trivial mistakes from creeping in. We have to do this piecemeal as we reject
> > -# any patch that isn't warning clean, so turning on -Wall -Wextra (or W=1) we
> > -# need to filter out dubious warnings.  Still it is our interest
> > -# to keep running locally with W=1 C=1 until we are completely clean.
> > -#
> > -# Note the danger in using -Wall -Wextra is that when CI updates gcc we
> > -# will most likely get a sudden build breakage... Hopefully we will fix
> > -# new warnings before CI updates!
> > -subdir-ccflags-y := -Wall -Wextra
> > -subdir-ccflags-y += $(call cc-disable-warning, unused-parameter)
> > -subdir-ccflags-y += $(call cc-disable-warning, type-limits)
> > -subdir-ccflags-y += $(call cc-disable-warning, missing-field-initializers)
> > -subdir-ccflags-y += $(call cc-disable-warning, unused-but-set-variable)
> > -# clang warnings
> > -subdir-ccflags-y += $(call cc-disable-warning, sign-compare)
> > -subdir-ccflags-y += $(call cc-disable-warning, sometimes-uninitialized)
> > -subdir-ccflags-y += $(call cc-disable-warning, initializer-overrides)
> > -subdir-ccflags-y += $(call cc-disable-warning, frame-address)
> > +# Unconditionally enable W=1 warnings locally
> > +# --- begin copy-paste W=1 warnings from scripts/Makefile.extrawarn
> > +subdir-ccflags-y += -Wextra -Wunused -Wno-unused-parameter
> > +subdir-ccflags-y += -Wmissing-declarations
> > +subdir-ccflags-y += $(call cc-option, -Wrestrict)
> > +subdir-ccflags-y += -Wmissing-format-attribute
> > +subdir-ccflags-y += -Wmissing-prototypes
> > +subdir-ccflags-y += -Wold-style-definition
> > +subdir-ccflags-y += -Wmissing-include-dirs
> > +subdir-ccflags-y += $(call cc-option, -Wunused-but-set-variable)
> > +subdir-ccflags-y += $(call cc-option, -Wunused-const-variable)
> > +subdir-ccflags-y += $(call cc-option, -Wpacked-not-aligned)
> > +subdir-ccflags-y += $(call cc-option, -Wformat-overflow)
> > +subdir-ccflags-y += $(call cc-option, -Wformat-truncation)
> > +subdir-ccflags-y += $(call cc-option, -Wstringop-overflow)
> > +subdir-ccflags-y += $(call cc-option, -Wstringop-truncation)
> > +# The following turn off the warnings enabled by -Wextra
> > +ifeq ($(findstring 2, $(KBUILD_EXTRA_WARN)),)
> > +subdir-ccflags-y += -Wno-missing-field-initializers
> > +subdir-ccflags-y += -Wno-type-limits
> > +subdir-ccflags-y += -Wno-shift-negative-value
> > +endif
> > +ifeq ($(findstring 3, $(KBUILD_EXTRA_WARN)),)
> > +subdir-ccflags-y += -Wno-sign-compare
> > +endif
> > +# --- end copy-paste
> > +
> > +# Enable -Werror in CI and development
> >  subdir-ccflags-$(CONFIG_DRM_XE_WERROR) += -Werror
> >  
> >  subdir-ccflags-y += -I$(obj) -I$(srctree)/$(src)
> > -- 
> > 2.40.1
> > 
