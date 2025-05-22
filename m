Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2C63C54E65
	for <intel-xe@archiver.kernel.org>; Thu, 22 May 2025 19:01:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3F7110E7C2;
	Thu, 22 May 2025 19:01:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dSMXNlkJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3FE710E735
 for <intel-xe@lists.freedesktop.org>; Thu, 22 May 2025 19:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747940508; x=1779476508;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=XiSasl0iNEaOVqBuNZg85iergwRLF99VYOTpqiDiF6I=;
 b=dSMXNlkJBL27+Fwtb8M9lb5rpNgtTtsJMIDOY5s1/nt+vd8FmvYVLnq9
 GoML+nGEfHw0qiT9MBTX9m8ovuNWDakUPXBD8QIGNqsQ+YwkiF/F/INXj
 LDJiPJW52fd+E7I0F12F7xnfvwXOmoMcYks5nSbHALFHmKT+dYYM4IDwb
 zLFhh8EaoAWzyhJ5GECTf2IsEvubw6nKvvuu14+JuSqihqyAzWUgoRbbR
 39JUP4mXRcbH84n+5bX1KnbH/e4jDy1wjY8i6AC4ZHuo90OtyeYpjvom5
 5ho2cNU1Q5wVuCCaGsab6/PTmmIoUrTkl6UAVxKxEFf00ICaWW+7c8g06 Q==;
X-CSE-ConnectionGUID: pxb7mG9WQESsSeydUkijTQ==
X-CSE-MsgGUID: gVSN3xphTPKAmdIOLjc4vQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="53777176"
X-IronPort-AV: E=Sophos;i="6.15,306,1739865600"; d="scan'208";a="53777176"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2025 12:01:47 -0700
X-CSE-ConnectionGUID: 4MCcYDV4QFqq0h5sl5SVUA==
X-CSE-MsgGUID: 6kc6Lx1GQaScXV4lEY992g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,306,1739865600"; d="scan'208";a="144692586"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2025 12:01:47 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 22 May 2025 12:01:46 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 22 May 2025 12:01:46 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.67)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Thu, 22 May 2025 12:01:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JxM9RL1sCjXlJmuhnlo8kYz/0ZmGg+wXRLILfte86jHCrqb6sN+z0ZjJzH9QlAmT9ezk088AzgG0/qUd83Wi+meoGDx6r38I3R56OgGUmi4xxPgAOaipjF39Tju3wKVmJIu3jP0fll2m57TFxXj+v6QYxJa7L1vST9XP+5fWq0eMejU82S5661ehld5tc/5JiMg0ai+NZBwdhT+nF1rHfdq9bhsvQ6utq/D/BLHlSpsd3vlWug4+IxVyFhMUqHwm5zIu6QSUsaIOKO5Prn+F4OF15gYCRMY+hv24DurvDXNM+9C7zM4RcR8OeM9LusiXg8rnQvxcAmDrQOzWyx505A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lp/Z3hAejspnDV1xM9cm0gnc5akhJJaAC/TZG0HNRfI=;
 b=gxbalHqpA7UAYyJkJ9SEewG11UinD/xG5aylgSNqTDn4oEvSU9bB72n64YGZZhr+oInbDjDxWWy+wcrWfa1CLgC/U30W1FLuedUMardNypPXNBh3sB4xu3JOvTnqgqhtabY1Oi0RqSwi394ZP6aSbTPXgXvJ7ljQuIr4MIZWXEoyYmasygBe4l3lygSS/JIur9Yxaf/kU8nAt8kI1INHeH/8gKGaunlN8zF2CmThZFQBYRVWG4wvJg6HlGEfF7SwyTPz9hEldjvV2SxlnrZZnh5idfeVS9CGlZ/bN4yKzZh7IrcVpj1gsKJI+RAUzmFzz+UMMdxxKHMwNkP8rB6FYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DM4PR11MB7351.namprd11.prod.outlook.com (2603:10b6:8:104::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.20; Thu, 22 May
 2025 19:01:42 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%3]) with mapi id 15.20.8769.019; Thu, 22 May 2025
 19:01:41 +0000
Date: Thu, 22 May 2025 12:01:38 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Riana Tauro <riana.tauro@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v2] drm/xe: Add configfs to load with fewer engines
Message-ID: <20250522190138.GS6239@mdroper-desk1.amr.corp.intel.com>
References: <20250520-engine-mask-v2-1-46e76f935b35@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250520-engine-mask-v2-1-46e76f935b35@intel.com>
X-ClientProxiedBy: SJ0P220CA0010.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::14) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DM4PR11MB7351:EE_
X-MS-Office365-Filtering-Correlation-Id: 2271be44-8ee5-4c6f-85f4-08dd9963169b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?wF5ONHzeB+zBlOOoZy5KB6QTJpe39+7O0AkxsW3RXq+UYhcatbfKcpSRLX?=
 =?iso-8859-1?Q?/BP0DzVXqfsfYU1zr+qrD0f7ebrP+4ZVbxxNSXold3tfVzBjXyzKmJzFcY?=
 =?iso-8859-1?Q?bhm9ECTbJApBP6oAg2MdG84AYzXQD/N2a4qDjvE3pTXKJAIeY4WmcY91T0?=
 =?iso-8859-1?Q?H87T9siYtFPKIwxeM3tpUmgU00lXdTcOJZ4RuEZo9H3uYFai8rw4Nalt4X?=
 =?iso-8859-1?Q?u5niOMXI3rjlmdOiGhoWDbVXoRW9V7fZgUued18wrUdVC+YncQHMGZFYKH?=
 =?iso-8859-1?Q?STZWzcD19YeH00SlLKUWdjyB+gjIDus14n6tYaDaHKzWTiQOFzUBBRUvV5?=
 =?iso-8859-1?Q?XVMJNsNZp627F1GYQQ7lcG3asDJUDUCya3R9O8AkUr9fIW13vFePIIey9Q?=
 =?iso-8859-1?Q?pWI9p+2EUYqKTTR267b34GffKXZmNMbqp9i5v09KmIp1FjdFkHZJ3q+8Cg?=
 =?iso-8859-1?Q?Vd9dNAkF1hVzvQ+QGAdAGgtFKpsJC5m0FUu9ToOK3RJde2I2zGQdDEdBjm?=
 =?iso-8859-1?Q?8DwGrvH+PeKc+HXIbVNOgT9CX5viug7nZXeR6++inv7jFPUg3Mz704PMM+?=
 =?iso-8859-1?Q?jyDP1Tjix8pKi/8iexDuH4d1ZEb7fwCwlADE+pZbJoSCs6ik1VYGn+HNkH?=
 =?iso-8859-1?Q?vSmLb9TKg+89CNdKEzFX/cuRwy8WpdvU0hXX+GlBrk5byRu76/j59TSI9t?=
 =?iso-8859-1?Q?uTwR7H/OWF+TY4F5LBhGmiXiwNbKat5n5IioHFlHXmCHCLozeUc17VM3nX?=
 =?iso-8859-1?Q?1t2aOSlDnrqZ0Kix2VtiR4HM9V2+s8Esz/S4ZkHCsAiWljglZKFr7Z1zY8?=
 =?iso-8859-1?Q?BEYzlrUxiEOK+W+OM6LRHMTzMSBQxAX5xCjN0rQNKvm4AFDMQh2Vo6pUJj?=
 =?iso-8859-1?Q?DbCNW/hL40D2HtyMMYN1iHuBt0E35esvo0Hl7WfyUVza8X3NDwo6TREt66?=
 =?iso-8859-1?Q?CiS6cj9aXMzMiWp89QS3uKdVvj3x3Wz3uue5WGY9l0uD+rB+73PORDpQAa?=
 =?iso-8859-1?Q?S+skKp3SXsmGrVFSO2Slm09YyUQyKPc51iL+FimAOvB2yw/ozsbdHQyiVB?=
 =?iso-8859-1?Q?VHxhHGAcKpqnmuhd8+pX5KSyADw3q4ROyqpxkr+4Rc0lYhSjcWRKV9K6lE?=
 =?iso-8859-1?Q?3v8U6my43Ddft0ZQI6u8PPMNHInkge/9gyrg4mJDMPinByWLoluj2CHAgZ?=
 =?iso-8859-1?Q?gDautvwfv+aUhJBLkWiRdOJgGvfh/xempgfMmLzksG3cj9LTOV7kiZvqyc?=
 =?iso-8859-1?Q?CPUhHlVLDucrlQBdPuwbAJm+6SX7kKHNRJ3HsedeXge6Ok3AZ49DxfzNXF?=
 =?iso-8859-1?Q?phRzhPevf3+vZWuCtKtBcJ+Z2KPkKzx2MFe18upjvpWSDPUQ+fAVS2SeIl?=
 =?iso-8859-1?Q?CMetmOuYjzX5DGQ3v/MoNJeMHKUhSpGQMpg3tDHxc2s8nmTjdoIHc9MJVN?=
 =?iso-8859-1?Q?ksR2P5PVON5eIhSN?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?b/eWkYSh0iI5aad/s0yVeuVUyg6PEx4GuOseKSKqTJED12KNLXPPm21pux?=
 =?iso-8859-1?Q?bQPEp4U+Y83JgVSjxTNc2tDzA+V2mfsm9uBAIHwKwDZukwLFh2wWQaHPya?=
 =?iso-8859-1?Q?7UoME0HUPYPsCe1QV4jpeCrd7Mye/jZcUTp2OE9P98VlVsfQIf4jyQ255q?=
 =?iso-8859-1?Q?KXsCYmsXCfB2Mj2RtCHLzJcCqrVUaR36c+CCE2IaBWgRjOjmBHmHhxWkfw?=
 =?iso-8859-1?Q?JCqWAU7F/DAeX3V5n0cWuY3Aaar4TAkbtbYQ1xcI44n/MHOIkfs3iSLlyp?=
 =?iso-8859-1?Q?z+oJDNCow1Qwe8klH3vl0CNgeuUvVzK3ZkCsE+3KTuFEh907IhcxNkcNcS?=
 =?iso-8859-1?Q?SFgMAgrwjM4Yu7HCf+ZvTZUQpfmC05hYRrS1ZlEDHwGDwXKwKzlK7mNWzj?=
 =?iso-8859-1?Q?x6VaBayuDvitzhvOJQXuZGIy3X00oIgp77BaLHyJ/7Qh/OLy5VaX9i80f6?=
 =?iso-8859-1?Q?11O08HGsZ8y6Nau3WToc3lBmeb27g5BTNITTQ66703qwa+rzsMb3+dOAGO?=
 =?iso-8859-1?Q?Vmxqm2qL7h3hByIib5503fUj7bXnZm6AvKRRHlwy1H2PdCtZoVyi2Zkov6?=
 =?iso-8859-1?Q?AZQ5puBRDt4QnwPl21YXrurRYeGZRUQKPibc0i34uT2as2e7jaLOj/MFpP?=
 =?iso-8859-1?Q?XmmKSFJqxJVLVODhXB46XuaT0LvmW2/l31Id8nSM0x7vJtBQ8sjV6LAEaS?=
 =?iso-8859-1?Q?E9cJufGGje/ugdPMocoie78LS5copTm8peyRyXwm58+LDKnbab6uUph0rr?=
 =?iso-8859-1?Q?RPYVGAZumJ4B1AMjNWkPMxH/PqhQju0a3s04COAbtGozp5VBz8TwFfs5wa?=
 =?iso-8859-1?Q?F69Qld7wIlPMSdx1OAn1kkL+rSEIXykbsEFBZ8tKKECYmwu/S47pMulhwQ?=
 =?iso-8859-1?Q?kB+yVAcDvXsB8kTDuol7UnIRRKlm2j/YrxWIqwceyWVxxoWNGkuw3LC4uZ?=
 =?iso-8859-1?Q?S8yjNQLRryFWh74wbR2a7/eKt/TfwJHNFvDKJePuVyWgMefYAHmvrI5J3v?=
 =?iso-8859-1?Q?sbV9Q0Apcvv8Vp7yw91HolDCk7ikpb98XK2/UX0r2HDdOPhL6u27mH80Qk?=
 =?iso-8859-1?Q?7LbEKKenGAO68JpUx16J8lLEr6TQC+RiPzR70wiMgSdI8QtFmvx3l/UZy9?=
 =?iso-8859-1?Q?4CS1OR//PMsC7J8RPmbEW+rf75+83/dtXncbmYpodqE8XLerwAQTwc9OK/?=
 =?iso-8859-1?Q?nxqMOXd7bUVV1cHvmb20YoQ7d6dx4RL55NCAdUW7A6WErCynTq+kMJSFSk?=
 =?iso-8859-1?Q?Bx//x+aYPStEd1bxdrihwQKIic5kM1c4bVCkb+0iR5q/QOwK6+vT/TPu4L?=
 =?iso-8859-1?Q?OZPfqG0fDd7mk3ztHoiN53zvSQ3spV4HjeNlSR507//b3d1MLMxlKThOzS?=
 =?iso-8859-1?Q?KFEjhW7zc5LDlks/e31/+tGz52lNi7Obxs1fsQ8rgNzG4t8oB4UgJp6X1d?=
 =?iso-8859-1?Q?9IDFWfYbVYqQVzjtRguKMZvbPU84Caf4QVJsMTWtGLN9ze2YsFOcrrLkGL?=
 =?iso-8859-1?Q?NWD4vCES78bCY7/ksrzown2JwoMQS9dACT9IrDyxWwiK3cQ0n9LjWNB2SO?=
 =?iso-8859-1?Q?WMJJ9FDh5tW7yl1MRFZrdqJT8MRlkId0nxcdNo8GgWjmsTVmjVlzXR88aJ?=
 =?iso-8859-1?Q?JFRLpbRwZgR0shGNkgcOA2bRlGIGSAH+Otad31lWxUAm8VEaXgTcuOUw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2271be44-8ee5-4c6f-85f4-08dd9963169b
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 19:01:41.8313 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2PCXVGPpnsvWMfV8dHGPsralPJQxL2TE+sTKUozP7S8HT/bOtTPw8PKuVRjJ6PyXlFKBexQiBI9ByckjlYu3hAWc80D7+z9o7GHu9uUOgIg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7351
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

On Tue, May 20, 2025 at 02:28:58PM -0700, Lucas De Marchi wrote:
> Sometimes it's useful to load the driver with a smaller set of engines
> to allow more targeted debugging, particularly on early enabling. Add a
> file in configfs that allows enable only a set of engines.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
> Changes in v2:
> - Fix build with CONFIG_CONFIGFS_FS=n
> - Link to v1: https://lore.kernel.org/r/20250520-engine-mask-v1-1-ce6daf16d23b@intel.com
> ---
>  drivers/gpu/drm/xe/xe_configfs.c  | 133 ++++++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_configfs.h  |   2 +
>  drivers/gpu/drm/xe/xe_hw_engine.c |  20 ++++++
>  3 files changed, 155 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
> index cb9f175c89a1c..fb433503501c8 100644
> --- a/drivers/gpu/drm/xe/xe_configfs.c
> +++ b/drivers/gpu/drm/xe/xe_configfs.c
> @@ -3,14 +3,18 @@
>   * Copyright © 2025 Intel Corporation
>   */
>  
> +#include <linux/bitops.h>
>  #include <linux/configfs.h>
>  #include <linux/init.h>
>  #include <linux/module.h>
>  #include <linux/pci.h>
> +#include <linux/string.h>
>  
>  #include "xe_configfs.h"
>  #include "xe_module.h"
>  
> +#include "xe_hw_engine_types.h"
> +
>  /**
>   * DOC: Xe Configfs
>   *
> @@ -48,6 +52,23 @@
>   *	# echo 1 > /sys/kernel/config/xe/0000:03:00.0/survivability_mode
>   *	# echo 0000:03:00.0 > /sys/bus/pci/drivers/xe/bind  (Enters survivability mode if supported)
>   *
> + * Allowed engine:
> + * ---------------
> + *
> + * Allow only a set of engine(s) to be available - this is the equivalent of
> + * fusing engines off in software. Examples:
> + *
> + * Allow only one render and one copy engines, nothing else::
> + *
> + *	# echo 'rcs0,bcs0' > /sys/kernel/config/xe/0000:03:00.0/engine_allowed
> + *
> + * Allow only compute engines and first copy engine::
> + *
> + *	# echo 'ccs*,bcs0' > /sys/kernel/config/xe/0000:03:00.0/engine_allowed
> + *
> + * The requested configuration may not be supported by the platform and driver
> + * may fail to probe - intended for debugging purposes.
> + *
>   * Remove devices
>   * ==============
>   *
> @@ -60,6 +81,7 @@ struct xe_config_device {
>  	struct config_group group;
>  
>  	bool survivability_mode;
> +	u64 engine_allowed;
>  
>  	/* protects attributes */
>  	struct mutex lock;
> @@ -94,10 +116,95 @@ static ssize_t survivability_mode_store(struct config_item *item, const char *pa
>  	return len;
>  }
>  
> +static ssize_t engine_allowed_show(struct config_item *item, char *page)
> +{
> +	struct xe_config_device *dev = to_xe_config_device(item);
> +
> +	return sprintf(page, "%#llx\n", dev->engine_allowed);
> +}
> +
> +static bool lookup_engine_mask(const char *name, size_t namelen, u64 *mask)
> +{
> +	static const struct  {
> +		const char *cls;
> +		u64 mask;
> +	} map[] = {
> +		{ .cls = "rcs", .mask = XE_HW_ENGINE_RCS_MASK },
> +		{ .cls = "bcs", .mask = XE_HW_ENGINE_BCS_MASK },
> +		{ .cls = "vcs", .mask = XE_HW_ENGINE_VCS_MASK },
> +		{ .cls = "vecs", .mask = XE_HW_ENGINE_VECS_MASK },
> +		{ .cls = "ccs", .mask = XE_HW_ENGINE_CCS_MASK },

Is it intentional that this only controls userspace-accessible engines?
Would there ever be any value in disabling internal engines like the GSC
for testing purposes?

> +	};
> +	size_t i;
> +
> +	for (i = 0; i < ARRAY_SIZE(map); i++) {
> +		size_t clslen = strlen(map[i].cls);
> +		size_t numlen = namelen - clslen;
> +		char instancestr[4];
> +		u8 instance;
> +
> +		if (namelen < clslen + 1 || strncmp(name, map[i].cls, clslen))

Nitpick: "namelen <= clslen" seems like slightly more natural way to
write the first part of this condition?

> +			continue;
> +
> +		if (name[clslen] == '*' && numlen == 1) {
> +			*mask = map[i].mask;
> +			return true;
> +		}
> +
> +		if (numlen > sizeof(instancestr) - 1)
> +			return false;
> +
> +		memcpy(instancestr, name + clslen, numlen);
> +		instancestr[numlen] = '\0';
> +
> +		if (!kstrtou8(instancestr, 10, &instance)) {
> +			u16 bit = __ffs64(map[i].mask) + instance;
> +			u64 val;
> +
> +			if (bit > sizeof(val) * BITS_PER_BYTE)
> +				return false;

Would it be simpler to check that bit <= fls of the engine mask?  That
will both guarantee that it isn't past the end of a u64, and also that
it isn't overflowing into a bit for some other engine type.

> +
> +			val = BIT_ULL(bit);
> +			if ((val | map[i].mask) == map[i].mask) {
> +				*mask = val;
> +				return true;
> +			}
> +		}
> +
> +		return false;
> +	}
> +
> +	return false;
> +}
> +
> +static ssize_t engine_allowed_store(struct config_item *item, const char *page,
> +				    size_t len)
> +{
> +	struct xe_config_device *dev = to_xe_config_device(item);
> +	size_t namelen, p;
> +	u64 mask, val = 0;
> +
> +	for (p = 0; p < len; p += namelen + 1) {
> +		namelen = strcspn(page + p, ",\n");
> +		if (!lookup_engine_mask(page + p, namelen, &mask))
> +			return -EINVAL;
> +
> +		val |= mask;
> +	}
> +
> +	mutex_lock(&dev->lock);
> +	dev->engine_allowed = val;
> +	mutex_unlock(&dev->lock);
> +
> +	return len;
> +}
> +
>  CONFIGFS_ATTR(, survivability_mode);
> +CONFIGFS_ATTR(, engine_allowed);
>  
>  static struct configfs_attribute *xe_config_device_attrs[] = {
>  	&attr_survivability_mode,
> +	&attr_engine_allowed,
>  	NULL,
>  };
>  
> @@ -139,6 +246,9 @@ static struct config_group *xe_config_make_device_group(struct config_group *gro
>  	if (!dev)
>  		return ERR_PTR(-ENOMEM);
>  
> +	/* Default values */
> +	dev->engine_allowed = U64_MAX;
> +
>  	config_group_init_type_name(&dev->group, name, &xe_config_device_type);
>  
>  	mutex_init(&dev->lock);
> @@ -226,6 +336,29 @@ void xe_configfs_clear_survivability_mode(struct pci_dev *pdev)
>  	config_item_put(&dev->group.cg_item);
>  }
>  
> +/**
> + * xe_configfs_get_engine_allowed - get engine allowed mask from configfs
> + * @pdev: pci device
> + *
> + * Find the configfs group that belongs to the pci device and return
> + * the mask of engines allowed to be used.
> + *
> + * Return: engine mask with allowed engines
> + */
> +u64 xe_configfs_get_engine_allowed(struct pci_dev *pdev)
> +{
> +	struct xe_config_device *dev = configfs_find_group(pdev);
> +	u64 engine_allowed;
> +
> +	if (!dev)
> +		return U64_MAX;
> +
> +	engine_allowed = dev->engine_allowed;
> +	config_item_put(&dev->group.cg_item);
> +
> +	return engine_allowed;
> +}
> +
>  int __init xe_configfs_init(void)
>  {
>  	struct config_group *root = &xe_configfs.su_group;
> diff --git a/drivers/gpu/drm/xe/xe_configfs.h b/drivers/gpu/drm/xe/xe_configfs.h
> index d7d041ec26117..c80131f994a71 100644
> --- a/drivers/gpu/drm/xe/xe_configfs.h
> +++ b/drivers/gpu/drm/xe/xe_configfs.h
> @@ -14,11 +14,13 @@ int xe_configfs_init(void);
>  void xe_configfs_exit(void);
>  bool xe_configfs_get_survivability_mode(struct pci_dev *pdev);
>  void xe_configfs_clear_survivability_mode(struct pci_dev *pdev);
> +u64 xe_configfs_get_engine_allowed(struct pci_dev *pdev);
>  #else
>  static inline int xe_configfs_init(void) { return 0; };
>  static inline void xe_configfs_exit(void) {};
>  static inline bool xe_configfs_get_survivability_mode(struct pci_dev *pdev) { return false; };
>  static inline void xe_configfs_clear_survivability_mode(struct pci_dev *pdev) {};
> +static inline u64 xe_configfs_get_engine_allowed(struct pci_dev *pdev) { return U64_MAX; }
>  #endif
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index 93241fd0a4ba3..af750ed8c0f00 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -17,6 +17,7 @@
>  #include "regs/xe_irq_regs.h"
>  #include "xe_assert.h"
>  #include "xe_bo.h"
> +#include "xe_configfs.h"
>  #include "xe_device.h"
>  #include "xe_execlist.h"
>  #include "xe_force_wake.h"
> @@ -810,6 +811,24 @@ static void check_gsc_availability(struct xe_gt *gt)
>  	}
>  }
>  
> +static void check_sw_fuses(struct xe_gt *gt)
> +{
> +	struct xe_device *xe = gt_to_xe(gt);
> +	u64 sw_allowed = xe_configfs_get_engine_allowed(to_pci_dev(xe->drm.dev));
> +	enum xe_hw_engine_id id;
> +
> +	for (id = 0; id < XE_NUM_HW_ENGINES; ++id) {
> +		if (!(gt->info.engine_mask & BIT(id)))
> +			continue;
> +
> +		if (!(sw_allowed & BIT(id))) {
> +			gt->info.engine_mask &= ~BIT(id);
> +			drm_info(&xe->drm, "%s fused off (in sw)\n",

I'd avoid using the term 'fuse' here.  Maybe just "%s disabled via
configfs" would be more accurate and helpful.


Matt

> +				 engine_infos[id].name);
> +		}
> +	}
> +}
> +
>  int xe_hw_engines_init_early(struct xe_gt *gt)
>  {
>  	int i;
> @@ -818,6 +837,7 @@ int xe_hw_engines_init_early(struct xe_gt *gt)
>  	read_copy_fuses(gt);
>  	read_compute_fuses(gt);
>  	check_gsc_availability(gt);
> +	check_sw_fuses(gt);
>  
>  	BUILD_BUG_ON(XE_HW_ENGINE_PREEMPT_TIMEOUT < XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN);
>  	BUILD_BUG_ON(XE_HW_ENGINE_PREEMPT_TIMEOUT > XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX);
> 
> 
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
