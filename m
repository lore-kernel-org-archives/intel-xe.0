Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49885C46CD2
	for <intel-xe@archiver.kernel.org>; Wed, 24 Jan 2024 22:38:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 065C210EC8A;
	Wed, 24 Jan 2024 22:38:56 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D619D10EC8A
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Jan 2024 22:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706135935; x=1737671935;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=AGXkEjZg75FnrGiU6Y4ae0LsImT4HEp1OCXEuF17WNg=;
 b=DrPbzskhbYXTJ1fqvnz9nlD6qUDES99vmsoioWiLZ1ODrdvnRksFlSwu
 IKxbzQ72gAYh7RaAtmrWi044C2rdSM5IJV++PcfyOgIeeoFIm+tQhH4rO
 XDMxPDp9NHSInzmvhBNTn4ywN3pi4I08G3tX5wWDkWJ3HhYmc4YzfiMq4
 U0OXu1PLnAwKox7uyPJEl4P3M9k3xQXlRcWKgfDgQZfCAIQULBr5UvUHO
 vFLuligo5oSkfsYcf8aeOvgBmOrHLDfZSmvucr8RVS13UCIwfs6mLRPLh
 RTelptxk0WRaRT41AxZYMKgHwr4Hrer4phpq5oMxVhawj3XLoWddlAo95 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="9376081"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="9376081"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2024 14:38:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="2200696"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Jan 2024 14:38:28 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 24 Jan 2024 14:38:26 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 24 Jan 2024 14:38:26 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 24 Jan 2024 14:38:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mAbsS9hzqZYLXL3wYyBcyBEj0pgD+EbdRmvGFhuCih9l0jYdtLlK0v59cT4vrctmF5C5t6a/CoRhfETFO+z57eYRamLHAvYwcoTH4Vq0bsJM5Bcsgcg8Lv5a2xTDZur7YLjxb5oMhJFE5x1U7vzLS1/lvO4/Aq5ryj766dgRKOT4zRbTR7n+rIkoVwpHl9doN540c+nvexNZRnSW2CAcYx7SpP92snttlSzSBBrZi7XffUNi+qU4ObXsQ9lSyMEcQck8MZAm63GtplCI1SgRdYVN47EASMLUSXFMD9HF3cUT1l+QfRN+trnfSLQLOk9y1lYF4vgzmp4P4xFjzjdgmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AGXkEjZg75FnrGiU6Y4ae0LsImT4HEp1OCXEuF17WNg=;
 b=HhRYIzrsnSsp2gvulZTF1lHCfBDyf32+kAqVRRB+yWogcFpRP2WXmhZ1SqZa+4QpCvl+k/6ebpuftK070bP0zgaT65RPZiWX8ewE28sBYHQ9sW33b618/6xbbBnWQb1eBGCvRC+1K3xdWGxRhAU2RBf8URTj9kiHTH0PxVKIy5p/s5B9G4LBGVKsfi9ROooUtTsX8NU6hVz0Nhns0Vr6m29LgpzhEmLJYCEsJxLOwHgYV0tDcYEvhPlTv8Ob5pwjr5CYmKgsSMd2LsavRzbhC41otbne1P/YnYs1YTCHa4IrLxzROnQPKmJQah5kzy7wj97+szdvqO3kT+l0hN9XfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CH3PR11MB8660.namprd11.prod.outlook.com (2603:10b6:610:1ce::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.34; Wed, 24 Jan
 2024 22:38:25 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954%7]) with mapi id 15.20.7202.035; Wed, 24 Jan 2024
 22:38:25 +0000
Date: Wed, 24 Jan 2024 16:38:21 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: Re: [PATCH] drm/xe: don't build debugfs files when
 CONFIG_DEBUG_FS=n
Message-ID: <ghjqhtnovyd6ss62m5lk4ivgdbhdapf3dp4aeb7z3o3nfo4euu@tvupokmgqrvo>
References: <20240124090515.3363901-1-jani.nikula@intel.com>
 <ee182014-8dc8-40dc-bbdb-bbd90c7783c3@infradead.org>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <ee182014-8dc8-40dc-bbdb-bbd90c7783c3@infradead.org>
X-ClientProxiedBy: BYAPR08CA0026.namprd08.prod.outlook.com
 (2603:10b6:a03:100::39) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CH3PR11MB8660:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a1f3401-7972-43e1-51dd-08dc1d2d2d43
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Y9cn82oCD6rrDNQhZnCy7OCbF7Ctq9HzL+AVtd4NJrInI2CxdAqELVzUJxcrGiwITTp563BwTWIacVhDRWjzLEzIrN/BqEJJbdinRu0geSWL2xr1aPglHydFRrPDYPlRALn22PaKLzW27fvJwiZgpEVe4iPKiv5cQvMfhZPSn5dgV09sv53yag3ONKUfFEwnbyuBGE4IAdUNtLx997U0SgQVWFe01V2m2LuDP5fyMQCGAE4fk5zG3JacD5KPhatojPQdJkWNw8Y9cMp8/fqqtkgqRAklEU9iIRkId7g1BNoIz/QFr9kc/iiyRL3gBlYdkWSR19OZA7agnblBDQrul6qj6dO7KBz9aHhhj2J7UMBaK76xQc5LNUndmyFNkTdoQWmhgkHi+5YKj5NHNjZYobYIx9IIJQ+W+Kv0qFUrA9q4Xrty8yj1/xi2xSvYEG8SeNQTSyQTxrXJBfOPRbYqJIGAE1hEgg9VLMlH+O3YqCCt7sdqIHx/wFgWFIF38hLfijuhYBrWL8Xe0JnYxBvmQH/17YCCViVFk+WAbzZJf6ZaVNHHkbK52TYL5a4lDPhy3y4+lue3L0RzUOarLtN/CxE5iRFnGeXfw5aAjyCAXCs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(346002)(39860400002)(136003)(366004)(396003)(376002)(230922051799003)(64100799003)(451199024)(186009)(1800799012)(41300700001)(33716001)(38100700002)(82960400001)(8936002)(8676002)(66556008)(6506007)(6666004)(2906002)(5660300002)(4326008)(4744005)(86362001)(9686003)(6916009)(26005)(316002)(6512007)(478600001)(66476007)(6486002)(966005)(66946007)(83380400001)(27256008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EHxyZre4V/Rb5/yw95+G5M80DOiA//HlLJFCaYQR6b0+a4xXYwAj8bTIqNQD?=
 =?us-ascii?Q?z7T7zPU5+7oihdglfiSK7E4W9Bg4VYUVruupbw8XwZ8tSSdXV9fqj5uYr1Qe?=
 =?us-ascii?Q?toaGXDC7m4dcVtv0EF5Q+k9lJA9yZ8j7JXjb6FQ9FeDtAkaanVAoA57Nl7VP?=
 =?us-ascii?Q?MgBzFuWd+mklN5HK9TsfsarFvMZtxiQyi2WE1SCayXiV0ft5wwp2Ucb7l35e?=
 =?us-ascii?Q?/QSAtHSXD2Jwjhd4BeJk0vWm5Faz83/bDhtITjAhTOidHy4X4owUhZRsvtBV?=
 =?us-ascii?Q?kSZsJGbKwgJB25WMDOvBt2Q6bjvJn5+JEB386eiTbwrnsPbCn7yOM40JN6GK?=
 =?us-ascii?Q?itSyRqSYVO07o/GbtaepMQ18aqZWeKVouRm4B3OexoVYLE0K7o7TmM8/qJoR?=
 =?us-ascii?Q?IawlxtoxWEiPeUidxQh8n6W/RjLGNPlAIrm8uXwH22qIbB3fgP0J8RDsh5Ty?=
 =?us-ascii?Q?HRtbFHbdC0Fr31/YF/Wl+AyEic6nXKH+Aim58k3ygrgBviP69+pHuG6Uyq0t?=
 =?us-ascii?Q?BdzzsBEsXHLRpFXBjfcB4ApGadufCnj9qBR7fHgkW3NiS4aN9jhl+Q0Ir97K?=
 =?us-ascii?Q?F+sI9JgwCYHWEWnd6MHLvcdHLfupm+4+Yt+vJrItMF+Im/ztsGaD5t+yXkdo?=
 =?us-ascii?Q?7CBxFs3//ubXdypDW5BqHIsKXySOawK4n7BdZgtT4tPWF2K6ZoodchahYJXH?=
 =?us-ascii?Q?uw2dWZcbaAUeHSKz3cLKB04D0k9/7FdQ9w2gxtDer72UrTwHsK5mCALq/y9a?=
 =?us-ascii?Q?LU0LO5u59kVyb7nF9l23J1Eydz8E42PT+XXb/iYwmNurCUWwWZ9ll0nbhmA6?=
 =?us-ascii?Q?P+f2y8VOm91YI7qwRuuSOyKssm2bhVsoxPU82fTf+NNukr9SDD3JhElXDSnM?=
 =?us-ascii?Q?e9qhhJihM5o+ZRsexAc1u6662+ARb3C+0gRSTKnHNX0KLsUWfBXteO2IZiWf?=
 =?us-ascii?Q?uimvFmNukQQcMziphAc2txazxsnc0/rbLLqL1ob+nqL6oHND93kwWyp8fDP2?=
 =?us-ascii?Q?x4fbMXopsg9DHiddSjkajXTQn8WFQiNEk90xEohPAom7oJy2lvOmkUaWY9mC?=
 =?us-ascii?Q?BFRsZ+hMKM+wO5/x0aTYDNhyCAdOeT9URNwIkrpNoBJZiE3cELzX3fVcHU2W?=
 =?us-ascii?Q?YBxfBFO0iBOzKxMb8R9DBrjcKYxHrJ5PLv48cOiGDcpFh0ErpOxoOA9IDkXl?=
 =?us-ascii?Q?7zCCMBB2AQ9y2PQRPTu/bDnHOr5+3zM7Oe9T+5VZ3T9D3i7c2PXna6KGrfZ5?=
 =?us-ascii?Q?z2PwDEozdjZtDjxT3K9BNs5E9O8wmCeNCFTpmnZZG4c56hfROlr8QmI65fHF?=
 =?us-ascii?Q?W8d35V0V2fpuyx/IfUDo5yQZtxW/S2lFPhNKJ4ggfMYiFrZRgjA67U6SAdWx?=
 =?us-ascii?Q?esvtRvrcJO0c9Dg+ID9uaj46Q6jG+0NRPpfbUVWJhSF4r88ELeTqfMz1U9tg?=
 =?us-ascii?Q?FN6ZyZsTo37ysANBag0w5RBVxs44400GfnZXsJPXYKlATXvwcpbzslFZUPj0?=
 =?us-ascii?Q?5P7eWdArj+IXDk+AMK2ID7araGbfpNRgjTUFOM78YCh2I64tXzn4xkSH2E44?=
 =?us-ascii?Q?Ih0YNkrcIRrk3oKjX2PPDgtY+VUGASEshN7a/HAeTAYKrj+Yg7TqRqtCR3ij?=
 =?us-ascii?Q?Nw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a1f3401-7972-43e1-51dd-08dc1d2d2d43
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2024 22:38:25.1622 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6iuyCWLM5tQOFPKmoejmsVC2hQKX4RsbrIkMzg2IHCjUkq1ITowh0+D1yn40sBbeAtYBqgc+JvIaUfDE4Bj9yB5YVPBxtp63f0+ZNPFJdtg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8660
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
Cc: Jani Nikula <jani.nikula@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Jan 24, 2024 at 01:35:23PM -0800, Randy Dunlap wrote:
>
>
>On 1/24/24 01:05, Jani Nikula wrote:
>> If we unconditionally build the debugfs files, we'll get both the static
>> inline stubs from the headers and the real functions for
>> CONFIG_DEBUG_FS=n. Avoid building the debugfs files with that config.
>>
>> Reported-by: Randy Dunlap <rdunlap@infradead.org>
>> Closes: https://lore.kernel.org/r/152521f9-119f-4c61-b467-3e91f4aecb1a@infradead.org
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>
>Tested-by: Randy Dunlap <rdunlap@infradead.org> # build-tested
>Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
>
>Thanks.

Applied to drm-xe-next. Thanks for the patch, test and review.

Lucas De Marchi
