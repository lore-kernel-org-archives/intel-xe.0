Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BA66C3DA49
	for <intel-xe@archiver.kernel.org>; Thu, 18 Jul 2024 19:24:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 246D110EADB;
	Thu, 18 Jul 2024 19:24:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NtJU/zeJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53DBD10EADB
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Jul 2024 19:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721330671; x=1752866671;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=/Y8F5iSn81VcGm919uMq201UPcE0/7ROoKxrxzotj9Q=;
 b=NtJU/zeJJNpY+nwu0l7ZMy/ab9OVWHmjBZklVKbPJKFAMnWx+glXLAHr
 PuHCXA172+5VstTwppPdLjU/DOEjn+CMOK/oWch7CBv6TrwrHLXaxcCSi
 BWjttr19hwBRQRS9sc6aN9NfaydrXhKSbabdUpg1zpy7ZHO7I9fK28QQ2
 /DuEGCQmtOKCxvzIjtLFDLoqm04pdrh3FqruzBRoAkpfu1YPCdy52wtA+
 D8nmPgefpgEUXSPtGB5o7S1ckGe6Gax2a/Y8yKERkUCjtG+LR8wz/Rmea
 7I1d0r37wIpMCdTuzxlAbYcB6F5qZ9lQlnjge/Olaxv3bqb3eYfHaXFdt g==;
X-CSE-ConnectionGUID: bZaODojtQpmciICf4VUk7A==
X-CSE-MsgGUID: Dk5if29zRnSgPiME2iuU1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11137"; a="29498099"
X-IronPort-AV: E=Sophos;i="6.09,218,1716274800"; d="scan'208";a="29498099"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2024 12:24:30 -0700
X-CSE-ConnectionGUID: QJ21mQjyR1efP4hhP7jnwA==
X-CSE-MsgGUID: 4od88hEJTBSyp9gBGZzftw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,218,1716274800"; d="scan'208";a="55735913"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Jul 2024 12:24:30 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 18 Jul 2024 12:24:29 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 18 Jul 2024 12:24:29 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 18 Jul 2024 12:24:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vIajrXmtp91utIA0mYKiaaBRmHO2sctcHKG7JkgIwmyacFQ+575wVFuDnWLl0+j0b621I4xwHE1DYyagG/2s4wrdLxBuyc/wuGFKL+qYCh5Jvw9LUJe/XVmpGE9rSVkOW+drmN2UFqaTrNee2mgejINTbUZRGJTkn1ZusFA0udcEN/t0ZskYHxRy9JeQQIDcoGbHpTKGopc3Md3yHT8SimT1NybkpBkALyHE1O0j+Xv/GXecprFYLSjL9dICioQe8EL9zJkrtAQwg052ECz4xbxTBrUYWX3tMlYkQutnpZO23k4LeP0AWZ+YKXEkHtCQpbjM2KNxljT3daHtzO2t2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rGbJh9oX97SvpPZ/Q5TPlAfFHooaimV5HVaxjcRjakI=;
 b=c86nCFQWkx3yYuDjRTtdzYUMRxifjhEDyShf4//HnubtReWtU2Vj5CGcqPAJd2dBvouOxk011Qik5RUgsttZzbkXvI1onuY8rTENi0SvhX7T8fmdpk5bKXIpE2DDXcOrJqmN4v8S4hfx+z/OKm3hRaVplncrWMGx/SHCsGuQcQOcE8jS9qdyWEf+R/O3r+Vs9akPq1QKNfWsgPA03zI37Xzi5UC9SaYXhhvy6dLw+upva7rhIgZ4q1PriyVSL5RHHP3S/PKNDYM8dEeNuBQc9z26fjCoyRlGzkYPg7qzW+O4RY7vV4XTQa3yfG16EO877KvCtq2Dw8djqKFl1u2WRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA2PR11MB4777.namprd11.prod.outlook.com (2603:10b6:806:115::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.19; Thu, 18 Jul
 2024 19:24:27 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.7784.017; Thu, 18 Jul 2024
 19:24:26 +0000
Date: Thu, 18 Jul 2024 14:24:22 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 2/4] drm/xe: Add ref counting for xe_file
Message-ID: <ehtyihgztfx7gewvipdazeml7eo7x2t5facavydakz7tkx4zea@6w4uv3jzo22i>
References: <20240709002835.3372618-1-umesh.nerlige.ramappa@intel.com>
 <20240709002835.3372618-3-umesh.nerlige.ramappa@intel.com>
 <Zo2gjQmp3ISF0fbo@DUT025-TGLU.fm.intel.com>
 <lp4tdx4qyguivat3q26d7yut3nxveqeakfnc4d5epe7lklmma3@uhs6eqhizoqi>
 <ZpllrlkHgzUsnFOH@orsosgc001>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <ZpllrlkHgzUsnFOH@orsosgc001>
X-ClientProxiedBy: MW4P221CA0015.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::20) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA2PR11MB4777:EE_
X-MS-Office365-Filtering-Correlation-Id: 32ea744a-12a2-44a7-ad4d-08dca75f3cf6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?V8BuxMyCO1GDnN1HLQqYg+95loZNfpVVvtnBLGhb9v704tVv7OdBcqXqxthu?=
 =?us-ascii?Q?bZqcSlTTgnGhikCIWPWbHXac0ThdG5nOLnydjMllpLM9oLInhS0QvmLw3zE5?=
 =?us-ascii?Q?fV1tI4r9YT3kr52T8UIo7hD8Avuu3WvNhq3e83QOJrmxXFsdAHwUtqKAiWjk?=
 =?us-ascii?Q?s0LkDoAFOERjqsDlfD1vZ5lNXewMbS/QSaC3il0z7OfCCgWt9JOIf4Pk0VM9?=
 =?us-ascii?Q?AVVi1jb1cKe81N3sJPM5kBNSuBswgWa7HXjHgt/fSJ89X//DeYqLWsT9NFkW?=
 =?us-ascii?Q?/2thgAaS+aZ0qiHhSCmiZr+qm+SXh7MI8U1UGfV8SrhNfCUHN9ZTsS9/gMUY?=
 =?us-ascii?Q?1Hs7B5jIGaInAOGKT4A4IpB5RnU7nqL7702fL2EU0TpR5csfCiq+JX/fx/OY?=
 =?us-ascii?Q?qfhgwLND4HQKk7u2BghsIj4rXrN7Jkb8CZQ+rvU3OxaYf2jPcwvlY8OnHp7X?=
 =?us-ascii?Q?ty1mDiJFXFDxEXOltoQwJASZalePOYTTasCgTIkytKIYySJIN+mW1UEDDWpH?=
 =?us-ascii?Q?yKAZClh36WptJnYvYzVjIoLYaWXIUmU/165yOCsFI4Wgj5LjpJuARNoBeFkR?=
 =?us-ascii?Q?yFiXvIN25JEqV096mXX4fGkJyCZTcJSKjpyKI5E4NIg17wIBV4E9B0CUkj3A?=
 =?us-ascii?Q?PXSsRUOLytCWaW5rOCCySPU0clFt1ZxLAtvRhINQM2Dbqbt+Jk8s+/YeAxJ5?=
 =?us-ascii?Q?Oh7fJaOsTvfC8vYa7sbAxpPRA/SQt8qu/Uz+i84UGt6EMPTYxfBT9oVhT/9r?=
 =?us-ascii?Q?nHJYA9evifX3kl+8vjH5uL7VBTkP2yQnI9l3vMjyBhCYIAI9ToJtBHzyRSYf?=
 =?us-ascii?Q?+wx1L7XaYmbg/qdzYSPP/67ltNR2IuTA4O1SmWVk5FkoLCjKV5tmJdmVOUNC?=
 =?us-ascii?Q?Xf2lhMfRSa1lVM3TuphrxNdM2ekzbuKnJhBd9oTHmbc9mUQMue0sNTO1//8i?=
 =?us-ascii?Q?4v+vhPc8lxwj86kTKTRHB7m8fGQUp7xSacQ1c4rHozPyGI17TJNKQIu4qQy4?=
 =?us-ascii?Q?qH50xyxzA2PDy36CSzgMcjiGXaUrlNXLRDkr1uZLyTtf+MwcqEP7YZ1jgeDx?=
 =?us-ascii?Q?9enUcT//qV7Xz7suYJvwpiIk7xD6jWW/CwpqdwEikrjK6ZWWPEqnjo2jC1h4?=
 =?us-ascii?Q?psB7INqC6tU0gvaLBXnoAA6ekLIvtCVsz/m5MVjX+BQouQf9w8AxI3b0W8Pw?=
 =?us-ascii?Q?DUU6RP8sT4iTx07yhFqZgzJ+WHexC5n3hoVXrKp5DWe9F+BnksSsw6aH59Mq?=
 =?us-ascii?Q?IzPptdPYq9Itac+LXsMKG0MUe3ooGosrVKx7INBZYay7+lT+l14CdERub2a6?=
 =?us-ascii?Q?bJI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KQD0ounIhWfnAA4R6hhE0M1G1kbe2W8CkLt0Lcsk8rpAKGcZOwGFZQSIGGWH?=
 =?us-ascii?Q?FeS3uX9IC2MI1lzd9CEkcazx7pmnTdn3qj7WRtkcimb477hA4+ezmG+eZ1ou?=
 =?us-ascii?Q?1h9EKNxJiSPaP6P59fj4pU/8aSq1rPcgaed7rj2H/QGJydfIXhxfGPJtgy3A?=
 =?us-ascii?Q?EyyLf5gy0HEiisC0Z4DkoIFvv+MTOWKWbaEzVng59FowrtioIsoTtD9geAMJ?=
 =?us-ascii?Q?+fcLxt1D2gGoXzA7GnWbBBKSf0PVneS9miYTgfgAQyF0EdP0aUzaXCh1qMDd?=
 =?us-ascii?Q?rEMHMxb5epC2O4JylmiZvJKv5eYenxdPHs6SciL8PHVzRGJzUQGKeNZUOb6m?=
 =?us-ascii?Q?5iQT77Je0OEyfgjombGS9xR5v1FSw4YQRFtMAGXsnZBGzydywNsc46xxjLV3?=
 =?us-ascii?Q?0JFQnlP5aXJ+7u3KZSA9ickKp7QD5podJQqjgXmk704vhHq/BMapHjEaiLrb?=
 =?us-ascii?Q?xRfzQ6x+HsY6O8K9EbuJhKmoRLGGosFAZ2sjLd2wnvax04F+GWIzLDoqfOs4?=
 =?us-ascii?Q?ZIcriIw1Ns6GGJSjsj58RKeAy7moxIJ6CzxL/6cQ9ES3wUGreOhb+IzcLih+?=
 =?us-ascii?Q?iUTnzNcipYvRiMl1HuHCFE50xP1Org70a7EqNwB31kUB+0trCXoDAo/iAb99?=
 =?us-ascii?Q?MziH6XVV2dkA/gZsjP3hhDOxCQyoQLTzmx2jldWn5/Q6z+z1/SgZ7giKRaDm?=
 =?us-ascii?Q?ljdt9we8Da/N7iUA66Ib7ajJ3FqpG7nxdKhj5eIe73UnmRY0ZOIYAgu1FlNu?=
 =?us-ascii?Q?2VIXOu8b4AvJOE5yGUg/t+BczMNlMYx6rgaIzDspcbf4FO6V5/ws0Ggl4tk+?=
 =?us-ascii?Q?C1nVrltTzgv2c9KQfdvFc2TIDoQCdibFc9n8bS6WoJ6p0KWD/Mf0/Boi7cOe?=
 =?us-ascii?Q?8ZNRPsnlJw2k/km7+RcqOoAN500CyoQ0OdaSCg23EV9UbBp5F3OxSgjFkYVU?=
 =?us-ascii?Q?zNmGRNrLK3TwWc4r7PahRU2+NGHEGhuLxBOyYR4vMiCbx1yb/oumKMKEdvg+?=
 =?us-ascii?Q?tBhb0wK1ZxHNEZnTpDM4YXmcqJS52Y/xD7AGLU2IsJMarIGpJs3wAo8TvpuU?=
 =?us-ascii?Q?dZZxbcS+F+w8v68Y1RzhflJoB2vKCVwy/Cyaw85BqCEXLiNiY0GB3j1CDfzX?=
 =?us-ascii?Q?pOrdN83fgnZQOeGtUNt6un2MO9y1w4wSdCZ8h6kCtaJ8JItZIrusFde6Z8so?=
 =?us-ascii?Q?elNOADI2VxwsPct58whHYCrEvi8tPn6iR2bOdMWQ3cAmgOywcWxswva3GwRE?=
 =?us-ascii?Q?0OQCfrcuUjhr0dSbyEQ8vNd1N8xsIZStLxNjG9wyHbOoXBAk5VSws3hxTQqN?=
 =?us-ascii?Q?XPUxPDVwdm5cg2dbySLFCumrAHPXUOeFqMpRXQf8cSs8VxLCyFOAbFcRbVvd?=
 =?us-ascii?Q?AUEtfsJIElafwSjhdCPsGlqb+MjI7JoZlG31Tvt0JeiGbgSyj0sUtM2oqRzL?=
 =?us-ascii?Q?W5JCgmdcmFA2r3bzyDmjfH0Qje0o7SJURKmzlzrhHa3rN9F3QtED5FGKEAgb?=
 =?us-ascii?Q?7aPrCAWLmxzrdtBBLX0hP5jOfguMsYKf6ebaCQr1H2UsMMo1qHNaqXLF6X0Q?=
 =?us-ascii?Q?ugs/X9U8qt3B98trOl56XSin6tudT/u1ktXxT8kQW4yvxY6IRM+5wZB4WzqF?=
 =?us-ascii?Q?pg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 32ea744a-12a2-44a7-ad4d-08dca75f3cf6
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2024 19:24:26.8948 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7ky/ZTO2978t6Z/9WB5t3l/IS1q0fzBuJRoljQ814KFOUzEl4YfmQjAlWyXTe/9o+HCKnNNBe0X8GFCz8RY+nbditPzNjMbwQK3wt9/xQSA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4777
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

On Thu, Jul 18, 2024 at 11:57:50AM GMT, Umesh Nerlige Ramappa wrote:
>On Thu, Jul 18, 2024 at 08:01:14AM -0500, Lucas De Marchi wrote:
>>On Tue, Jul 09, 2024 at 08:41:49PM GMT, Matthew Brost wrote:
>>>On Mon, Jul 08, 2024 at 05:28:33PM -0700, Umesh Nerlige Ramappa wrote:
>>>>Add ref counting for xe_file.
>>>>
>>>>v2:
>>>>- Add kernel doc for exported functions (Matt)
>>>>- Instead of xe_file_destroy, export the get/put helpers (Lucas)
>>>
>>>Won't get into this bikeshed here.
>>
>>in the previous version I also pointed at other alternatives that would
>>allow the inlining you were talking about. Anyway, as we said we may
>>want to make the pattern uniform across the driver later
>>
>>>
>>>>
>>>>Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>>>>---
>>>>drivers/gpu/drm/xe/xe_device.c       | 31 ++++++++++++++++++++++++++--
>>>>drivers/gpu/drm/xe/xe_device.h       |  3 +++
>>>>drivers/gpu/drm/xe/xe_device_types.h |  3 +++
>>>>3 files changed, 35 insertions(+), 2 deletions(-)
>>>>
>>>>diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>>>>index c5464ad5d908..61dc0a37a4d0 100644
>>>>--- a/drivers/gpu/drm/xe/xe_device.c
>>>>+++ b/drivers/gpu/drm/xe/xe_device.c
>>>>@@ -90,11 +90,14 @@ static int xe_file_open(struct drm_device *dev, struct drm_file *file)
>>>>	spin_unlock(&xe->clients.lock);
>>>>
>>>>	file->driver_priv = xef;
>>>>+	kref_init(&xef->refcount);
>>>>+
>>>>	return 0;
>>>>}
>>>>
>>>>-static void xe_file_destroy(struct xe_file *xef)
>>>>+static void xe_file_destroy(struct kref *ref)
>>>>{
>>>>+	struct xe_file *xef = container_of(ref, struct xe_file, refcount);
>>>>	struct xe_device *xe = xef->xe;
>>>>
>>>>	xa_destroy(&xef->exec_queue.xa);
>>>>@@ -110,6 +113,30 @@ static void xe_file_destroy(struct xe_file *xef)
>>>>	kfree(xef);
>>>>}
>>>>
>>>>+/**
>>>>+ * xe_file_get: Take a reference to the xe file object
>>>
>>>s/xe_file_get/xe_file_get()
>>>
>>>>+ * @xef: Pointer to the xe file
>>>>+ *
>>>>+ * Anyone making a copy of xef must take a reference to the xe file
>>>
>>>s/'Anyone making a copy'/'Anyone with a pointer'
>>>
>>>>+ * object using this call.
>>>
>>>
>>>Returns: xe file pointer
>>>
>>>>+ */
>>>>+struct xe_file *xe_file_get(struct xe_file *xef)
>>>>+{
>>>>+	kref_get(&xef->refcount);
>>>>+	return xef;
>>>>+}
>>>>+
>>>>+/**
>>>>+ * xe_file_put: Drop a reference to the xe file object
>>>
>>>s/xe_file_put/xe_file_put()
>>>
>>>With the nits fixed:
>>>Reviewed-by: Matthew Brost <matthew.brost@intel.com>
>>
>>agreed with the comments, but the kernel-doc ones don't appear
>>correct... we document the functions like
>>
>>/**
>>* xe_file_put - Drop a reference to the xe file object
>>* @ .... arguments
>>*
>>* ... additional doc
>>*
>>* Returns: ...
>>*/
>
>Again, this is not consistent across Xe. I see some files following 
>what Lucas mentioned and others following this link (like Matt's 
>suggestion):
>
>https://docs.kernel.org/doc-guide/kernel-doc.html#function-documentation
>
>I will follow the format in the link above and hope that we 
>standardize that across Xe.

yeah, that's the most autoritative one. Note that it also uses "Return:"
rather than "Returns:"

Lucas De Marchi
