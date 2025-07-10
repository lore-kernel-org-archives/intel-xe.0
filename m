Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ADD5C83F17
	for <intel-xe@archiver.kernel.org>; Thu, 10 Jul 2025 22:15:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 013C110E237;
	Thu, 10 Jul 2025 22:15:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EWhprm3G";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E30210E237
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Jul 2025 22:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752185713; x=1783721713;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=LqVwd4PJiErH59zsdFebbhduY9FwBUqRvD5r1PjbfNY=;
 b=EWhprm3G3pWoa+hHjlVrC0cvi0mn9aRUB8+iQ8gc7hAab6D3twzjsufw
 ZYgL88JoUoyZ0DKbN1324PRqDjxJFUNIqp0UDBA/ISOE4LhMpbKYc0cb9
 oyKjCxwWxuRPsOrur74E8SncOtKzMZoZQRrd3WUqQYrG9pyVspuFfFcZC
 q5F4SmPXwCtmBqz7kLkzw3rFMtONXtmF1IK++lG5f0+jPFX68N1BoFN7p
 TW1MVPOz7cJMfVFYcueofJWaViDteoCgQYWdwfXYLCK2AnfF1bxDvQ9aq
 HPoPBIpZEeAc/ctQgvx7leQnyePut9DhFXFrcQPZaQmc1K/2URI8UjtCE A==;
X-CSE-ConnectionGUID: A35xiiOTQBas07+HTZqqTg==
X-CSE-MsgGUID: RuJ63cWeRxm7hmc8MsOWBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11490"; a="42113565"
X-IronPort-AV: E=Sophos;i="6.16,301,1744095600"; d="scan'208";a="42113565"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 15:15:13 -0700
X-CSE-ConnectionGUID: m+7NuB6HRFm4JdNDPyvf8A==
X-CSE-MsgGUID: khqfqWtCSx27xVCnLkO8qQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,301,1744095600"; d="scan'208";a="161769753"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 15:15:13 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 10 Jul 2025 15:15:12 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 10 Jul 2025 15:15:12 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (40.107.100.85)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 10 Jul 2025 15:15:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qbai6IvUZamgzBQeSzcfj7bLdSQ4uSPlxr0wJ/R/Sx+fLCdO24rwKlQkorrGaAgIfEabZv/RJVAqs7USkiwdPvTmaK08IGmcprV8kaPmAX09zAXfizkhslrrYUvVad3a2LHACmJuDbY1cIyjUA38D1NEmrA5S9o9DsTTkxD/yo8nl0rooplIbUBR3T0Z38py7grZODNQusD1Rq8WwQnTVTl5LZDPZANZLmVxNGfHdmg+jJfwhA7aVZZmSvSm141btpi6dKYg5rVzQNqAU5gLgmAEBMfHnUpSqFfCEjNvGcqm+nt4U2fDytwfiP0xxa6eEwKm+VoKkUqJcr/iyVMMjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=smGPqoPlMlebtV8GacViexD1Tu3VDKAapmsbatah8ag=;
 b=f3VO7ZFvEfVPLMftPUNrR/c2rDTN7HW6ouIb7+hYBaJ9NW4W+k7P601VsxycDOkRB5YdPlKz2sg2yTuV8qX+NvcZcQYyHsDVEZCgeohnH4JkorGdZzpcU5qfMIT074hOhoqsgpyRvghNSwlDUDRbAXeiDTd/9feDFqVGAXGjh2EA4yMo5Y6OlYQGRDmFnvF8cavzMTzY/sYZYHv4AX8Y/TopKD5Pf9ig+QPf7Cgesxyn5sumOh407NwCqS9o/92shWOftMogN2zo6z+qW9xjDQ8cJxk/06KXpR3iPcmJFSbyjuZw8H2SxSA9pUGUInceU3TFGC4XjkY/WbFSY0MhUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by IA4PR11MB9395.namprd11.prod.outlook.com (2603:10b6:208:55f::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.25; Thu, 10 Jul
 2025 22:14:29 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%4]) with mapi id 15.20.8857.020; Thu, 10 Jul 2025
 22:14:28 +0000
Date: Thu, 10 Jul 2025 17:14:26 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Atwood <matthew.s.atwood@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>,
 <matthew.d.roper@intel.com>
Subject: Re: [PATCH v6 2/6] drm/xe: add xe_device_wa infrastructure
Message-ID: <qu6eihdmnpjotsmbqr7gfusb2gtw4rqtyoaglzecmui7s6gqb7@uv4jzehn6dho>
References: <20250709221605.172516-1-matthew.s.atwood@intel.com>
 <20250709221605.172516-3-matthew.s.atwood@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250709221605.172516-3-matthew.s.atwood@intel.com>
X-ClientProxiedBy: BY5PR16CA0024.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::37) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|IA4PR11MB9395:EE_
X-MS-Office365-Filtering-Correlation-Id: 8629a41a-64bb-445d-b159-08ddbfff235a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?DowaRssiHcAMaGlvexhj/k9veMlyBiSKMWDzeH2DXeQkiBTawWOkrQq+Dp2y?=
 =?us-ascii?Q?a1cCh1nKxgF5BHtVlQDZ1YHmerzWfkImVgq9bVTtPATejcQZOhC9byu1z1KS?=
 =?us-ascii?Q?qqoYPoF5jmn//GPo5HquUG4sycvkLixNFQc8GDZTZI9VBqS3itzRUga0kNYA?=
 =?us-ascii?Q?ucAzvKZpBh9kjIEluh/Kav8OcyhcbbOuOR4Xlwj+k0EwzF1ME2pYOBdXeRwW?=
 =?us-ascii?Q?pKuCaZCmbnmO3stXuIjcRSn8WEffvETT7qD0NNY+GeLozTwpA/B/7VsFguRT?=
 =?us-ascii?Q?P5JZSeYhFirOJtbAMBrO57zbJtkE9If8arG0gigRA/IxWIV2lr7O/XKg8voa?=
 =?us-ascii?Q?6OADQW3gsNBeo3u4VisIgxRwAgraTbAKZVGeL5Tzrqdo/dF8HBvir1uxSc23?=
 =?us-ascii?Q?gTXQWKrTv75JQr1iHAROtTDfLTPGk9ENHPYaBZWisAd1G23d9IbQYjhteRZB?=
 =?us-ascii?Q?4s6m88s2ZcLCxmBCIaJ3nQfPHmCN0yWHs7ccLRqJpdklJ4lP7OepL6M8UVhz?=
 =?us-ascii?Q?THluAJQZ4CO9yOjymCz9WpA822TdOM/xr9JqGhQ3Kv2LAIfHzMJ8c8p6BQXn?=
 =?us-ascii?Q?X8FDM6chg464vKbu7qOhsU6149+jTyccvzDT4bVdVpAiToFQWHCv5nldySbC?=
 =?us-ascii?Q?P4Sa9YnakZfeLNv/BBLVDzj4el7I0DJCJTP7IWrh+iNlWSUSqVrrpOJtNKEf?=
 =?us-ascii?Q?bMyeN+fYhTERcMwPGPjKL4njwvQWdEaEUiyXtDGdiE3lu/5AHSjAqCdRAww5?=
 =?us-ascii?Q?RZWyfGM5Jlm9/iV+zAKhuLlYQz+H71ADSHbE4i6BVaVok9/0WutZ2aTNiWgn?=
 =?us-ascii?Q?PxOI2Rucf7HX69a3U3vhLU4JNXobCCaaCWbXXlpPMdOX+lC6rm/7Q0iakGF/?=
 =?us-ascii?Q?t/inn8ZLfv3kmdPDUoQtEY2wMt7RQmew3+iFdfRAkvkxfGqTIsZAhkfFMlO8?=
 =?us-ascii?Q?3NlrkRsR4L+wMZmpkQ2jLoS1OkCnHpfxWxFitIYMRctLpnJpDe4yuE/fq5iT?=
 =?us-ascii?Q?NnDoDh2V9jaozrSjq0hZId17uRMeLNoxEQXfxNR6kmIv2VRXbxhh1mzmk8JA?=
 =?us-ascii?Q?/dwvjNXPuxQX0JN8QcHOQhacjx9HJKlIhwlLZFkUnaGhZGiJXRfWzeCmKLNi?=
 =?us-ascii?Q?VQEZpN1dkKhRRfe56KDMHHEt2xC47xivoCQqCUO83zSHMV/qvzjWByOibS6e?=
 =?us-ascii?Q?TeVSn3QDDyS5gXgkGTf3H/rzLov57heGAq2/95YWODA76TEz+eSCVwekUXNc?=
 =?us-ascii?Q?dyDgKCOvXAUno2oR3wxCGreWHIAtreGCdxpB7w5I5EEwWKLoB+OjAQ0lEFkp?=
 =?us-ascii?Q?lI7JLYwn6zaXoe+ahhpiUpMWItEi4CI0CxIWw6+rZFFas/7qo9rTzRtdhkpB?=
 =?us-ascii?Q?L+u4ysofc86uEeztfYWIbOQOjNpYHf5BQJNWGDj6Y/CTthW8vA94sI542dTZ?=
 =?us-ascii?Q?BE56+Kw1S5Y=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JDZJRs7iVKAf7MkKjuZHwIlUlE+EHuZf8tV+sp3AFOqNaHhrWptUpukPfiK3?=
 =?us-ascii?Q?jpMVhAHgyN7fZ4ZU4qKz2au6oItN+jIMKBeNJs3pqKWRD+OlCYZArHmd+tXV?=
 =?us-ascii?Q?pbkxchyBqcNAZp6yfsiwhEFlvE1nUBLnUIW5JwNqNrLeCW3pkVQiT5BQ6ZEV?=
 =?us-ascii?Q?hLBRhKsunbNKhyLoypgoNxrvwIquTqHum8O21DfylqDADJDyEW6NwGOeWlmW?=
 =?us-ascii?Q?ibrv35puiAd/y457rFreJMCnARGC8XajwKaJdqG1yAbYj/mdAbMlX+RbwF3p?=
 =?us-ascii?Q?f3VsE9wpv/JQPQeNViNycvQsnTUbe1E6kk77iZW0S59WdGOSEYsJqz2FVORt?=
 =?us-ascii?Q?APj5iINUoEBn3ZcLwzb3x3KMkGr6Q+KRnhc8A1aJ0ijia8qgzxa1TnKfTUqj?=
 =?us-ascii?Q?umLrZBdUr6yBSglZSYRLKW1qGOmqiUBW6cS5es09SarU2J3NG9qW0Rr2azRv?=
 =?us-ascii?Q?NaQiaPOGCHPXXjnrhBPAHj7YW9y9EnZpzYK62Xl7YQ9Uu8nseJfOKlbQVO53?=
 =?us-ascii?Q?r3Asd9zY2V+HK1DxlgVW6JClVkWp3HhQGdHCvs+La7xtmYjbiPu6Thx+Gsxa?=
 =?us-ascii?Q?2oMfnKu45Bp7MnJQzRFuCTkSFoxfdr1HLTmVvvxw3or/XiMGAcPyFqUIfy7W?=
 =?us-ascii?Q?lquECsqcpJd543ygCb+uukEQWmI5YQJR2xhD55gQKPBN+bwOHuw/o6m3sIQe?=
 =?us-ascii?Q?CbWv82+JJCa1VyWJJwL3kp81mw/7HQ7/f+61RcFDv2eboGx2IP69dh04j5+k?=
 =?us-ascii?Q?fEMwc2Xwr7jv6ZN5YYn60vTOflbsvKTBFphzCM6oqHmEJWCFtNOdtOIzRRus?=
 =?us-ascii?Q?HDPHI6oc1LkpfOqBLuCbgG3ZYLcd7lqYA/hBTMKjplntaJtnVdaLOsLPL6BH?=
 =?us-ascii?Q?AgqJRDubToNsdULTmi/p7XZSFvF/5Nt19wUbi0qzkbHt5GF6doOCDzxiDV8+?=
 =?us-ascii?Q?HB4dq8nhgYk2KCso6FNAEiscBbBE0jZGzkjNQ4IbTq4U32YUlsoo2GoSfI3y?=
 =?us-ascii?Q?wpgD94E3rSESqbJAgWgzlmik1FPAMTXRebnl+M0EZheApnrrQbcjDtU1vJ0X?=
 =?us-ascii?Q?BXpuAs57TZBZw2pTyVTDAYPTxSPsI5Fp4IZnN3Bvap1lmTMrCVgbBf9+TkT+?=
 =?us-ascii?Q?HDNFok6+uqHsZdWunQ98r46LlZ1PNlvwtP+r03CxjcpELWLtVyNBFy8b+OuM?=
 =?us-ascii?Q?IazZz5XNqxdusTjpHKtPKtZ/3J+33WDmRx7PIVjRE9x36GOGBxLZUrIoaqvm?=
 =?us-ascii?Q?Xv/YtPGud27YBFh2IUtqB+rxNYF+d43rVrD99emeiOfuxR67/+Vj7IyMgnup?=
 =?us-ascii?Q?+8tuM8xiI5HYi91UdNzNeVWLZzZg56EggvkOsHWvfkQuaokx4Uf9FNFew5Tk?=
 =?us-ascii?Q?r7WoKQHGq9W3ZI39rcc5HLku3PVSOCHIhr8qO0CU/LahKOChTm5gjJpPHHjP?=
 =?us-ascii?Q?f/thikDh468wrBEutYOHM2qF4PV4ArPKK0yfUOLpI9v6tlL5SChDI+db6Dv4?=
 =?us-ascii?Q?c/JKIwgtSBddjcviDTm+nweDNLgDFjPlFQqx83jojq/iwFq/9l6Ol6ooP6Jo?=
 =?us-ascii?Q?B03BFjJW+KXTKOfdsBrO/YYDpH/Bp/nG1B20dZEARRaR61oLdwwPIExORK7b?=
 =?us-ascii?Q?OA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8629a41a-64bb-445d-b159-08ddbfff235a
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2025 22:14:28.8925 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BfNUjvcqT+VQCpywxkixkZna4SHIy1o0fo6n45lkQDBnDtpoFuWi+lMp0HqbeFc7GiobBLjFvkmH2HiPYXnKgojIuXlP5LMIGpylkJLvD0A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9395
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

On Wed, Jul 09, 2025 at 03:16:01PM -0700, Matt Atwood wrote:
>There are some workarounds that must be appplied before gt init,
>wa_15015404425 for example. Instead of sprinking them conditionally
>throughout the driver as we did for i915 generate an oob.rules file
>reusing the RTP infrastructure to make these easier to track.
>
>v2: rename xe_soc_wa to xe_device_wa
>v5: derive prefix from argument rather than hard coding the values.
>v6: split out xe_gen-wa_oob changes
>
>Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
>---
> drivers/gpu/drm/xe/Makefile               | 9 ++++++++-
> drivers/gpu/drm/xe/xe_device_wa_oob.rules | 0
> 2 files changed, 8 insertions(+), 1 deletion(-)
> create mode 100644 drivers/gpu/drm/xe/xe_device_wa_oob.rules
>
>diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>index 1d97e5b63f4e..42fce65bc110 100644
>--- a/drivers/gpu/drm/xe/Makefile
>+++ b/drivers/gpu/drm/xe/Makefile
>@@ -21,6 +21,13 @@ $(obj)/generated/%_wa_oob.c $(obj)/generated/%_wa_oob.h: $(obj)/xe_gen_wa_oob \
> 		 $(src)/xe_wa_oob.rules
> 	$(call cmd,wa_oob)
>
>+generated_device_oob := $(obj)/generated/xe_device_wa_oob.c $(obj)/generated/xe_device_wa_oob.h
>+quiet_cmd_device_wa_oob = GEN	$(notdir $(generated_device_oob))
>+      cmd_device_wa_oob = mkdir -p $(@D); $^ $(generated_device_oob)
>+$(obj)/generated/%_device_wa_oob.c $(obj)/generated/%_device_wa_oob.h: $(obj)/xe_gen_wa_oob \
>+		 $(src)/xe_device_wa_oob.rules
>+	$(call cmd,device_wa_oob)

we can almost make a common rule for anything using xe_gen_wa_oob, but
the fact we are using a multi-target rule prevents Makefile to expanding
to all targets :-/. If we find a way, we can improve it on top and
reduce the boiler plate.


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks
Lucas De Marchi

>+
> # Please keep these build lists sorted!
>
> # core driver code
>@@ -340,4 +347,4 @@ $(obj)/%.hdrtest: $(src)/%.h FORCE
> 	$(call if_changed_dep,hdrtest)
>
> uses_generated_oob := $(addprefix $(obj)/, $(xe-y))
>-$(uses_generated_oob): $(obj)/generated/xe_wa_oob.h
>+$(uses_generated_oob): $(obj)/generated/xe_wa_oob.h $(obj)/generated/xe_device_wa_oob.h
>diff --git a/drivers/gpu/drm/xe/xe_device_wa_oob.rules b/drivers/gpu/drm/xe/xe_device_wa_oob.rules
>new file mode 100644
>index 000000000000..e69de29bb2d1
>-- 
>2.49.0
>
