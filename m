Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC158CAC583
	for <intel-xe@archiver.kernel.org>; Tue,  9 Sep 2025 14:02:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90C0B10E78D;
	Tue,  9 Sep 2025 14:02:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fhsK9PRI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EBE410E797
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Sep 2025 14:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757426520; x=1788962520;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=PSWMOcmCT+xmpeQIgngroGJEYbX7tIawCxIwet4kwzU=;
 b=fhsK9PRIFquNnPCBTI3UgsKXxxzBV0xwpuV8uhM50GxY7DPogjs2Y3Mk
 QG0FGrA/szZ8o6hQvfHU/ke0XzlHYs1Uk2m2lJf3yF4p7kW8IRL3RSCh8
 R/dpwzpo5HbjDLKQ7lvCeoDl84lL/WAWKM26YjXRuYy1eLKzYVtqcam+s
 HWOD7NpmaiQS3Vi//iOMfSKp/FxKN0n+B8xfafz/hV8cn2XydlteN0j56
 1u2jcPfkdIlQqktemgJ+FEN9FpY1XSL4t4Gywti9nKFjDNIrc+L7MIniz
 DsvLhYhxmb2AjuzNBFaLkDpC126lTz4s11+2BUpRcULHDxxTfUSfWOGkV Q==;
X-CSE-ConnectionGUID: Cpm71FJ1R2GtAhXabBp/7g==
X-CSE-MsgGUID: IpInt9QUT46jZhSsglO1ww==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="59637746"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="59637746"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 07:02:00 -0700
X-CSE-ConnectionGUID: co/MpGg5RBCa4AqduHZcPQ==
X-CSE-MsgGUID: gDAa6od5SB+8vnoUGvzVkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; d="scan'208";a="172685056"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 07:01:59 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 9 Sep 2025 07:01:58 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 9 Sep 2025 07:01:58 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.52) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 9 Sep 2025 07:01:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fHJYgavc7q1HEHnteIk5qLfhXSpJTXRw2frx8y90FY+pr4GCCNts7vmOZhp37DRqcxr/iqd7f5cKrMkb/iuemvchYGT0Q8EYmPNIh8NoifrrZQnqRD4WkBasgyL+38DFpoAfbht4mb3ml23bcdJOUOQQnj+pklYmCYFLckfJsHIUzAHjuKB54GhQH2tHvw2F5AqdwCi4apg2/cot+h+4NTDksOVFwJHjdL57RSK385tQIs7fk0wEiTKVAG1jUJ/CT+rCR+0NUEUNqyhqgNwZgdDQlxIvdcbqOijPoI3uKPfab4xishfj76gSxMZ7AKZygOIe3TkYrOPxFbgQPSZF3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v3q660dR5hOmIWsBuCFWYDLVg8VfTt9n9eYlVPrfmXw=;
 b=JAlyGPGrVXFjHphVlRCrt6g4o3zgRMnhb94MYbsnIRK9kfpTq4gFCalJuK8CECOeL+dk+MFJ8NPMp4uoNUdi5g9PTavdibYWE3u8nwlEZLqdZ1fwXIouDRHdVSiszC9Rg3cc4FTnEiYPqvCQkvvuRgI37ofI/f4u51wQqkGd/7xBBonxMZ1SHh16bWPxnDSeKjkYXGNZBxL7SfHu6AW/5RsIz7lybmBbgaD0b3k41yFXEMmrQV2psrJanZaWbSFQSTRowIgYX3OGBDN6w1XuqDftEqx2GXfVdJniH4Vm5rpHWRwfuuGHhy/voUFzRSinlosaYW1o5VONIbQ4mGmOLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by PH7PR11MB8501.namprd11.prod.outlook.com (2603:10b6:510:308::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Tue, 9 Sep
 2025 14:01:20 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9094.021; Tue, 9 Sep 2025
 14:01:20 +0000
Date: Tue, 9 Sep 2025 10:01:17 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: Lucas De Marchi <lucas.demarchi@intel.com>,
 <intel-xe@lists.freedesktop.org>, Thomas Hellstrom
 <thomas.hellstrom@intel.com>
Subject: Re: [PATCH 5/7] drm/xe: Define verbose debug macros
Message-ID: <aMAzLSQuB75QzxDt@intel.com>
References: <20250903213712.6364-1-michal.wajdeczko@intel.com>
 <20250903213712.6364-6-michal.wajdeczko@intel.com>
 <z5gfl545upuwn2eg4didegof4xdj55rxmo4g65tswpbijgqykj@omcamj3erznn>
 <da185812-efc4-4085-832a-3e10b6bc68a5@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <da185812-efc4-4085-832a-3e10b6bc68a5@intel.com>
X-ClientProxiedBy: BY5PR04CA0023.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::33) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|PH7PR11MB8501:EE_
X-MS-Office365-Filtering-Correlation-Id: c2317649-99c8-4b09-05a8-08ddefa95a94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?XUlxfKYrUFSuEdCw0AArQpl1x3oEfHL5YZ7o+e/fFEuz6wHNnW/WrU6UXy?=
 =?iso-8859-1?Q?oiQ9jQbUTtm9h5jDAWtQk3W0CKrSaUfCmXqeAkZHwHIL/ofJUH5W0B9q64?=
 =?iso-8859-1?Q?Br1UXX38dHvzCLWp0Lo0Y4dL2IMlW0KUGzn/5O4HyiTP2TVqOqfdzeRyMZ?=
 =?iso-8859-1?Q?bOwWyWfbc5Jb77Q/5IhxSIxXAcf5zPONiTblUwJgdwBvhpXXVR4oearSI2?=
 =?iso-8859-1?Q?ZnqfJ4JvEcIFokerSyrrUgZ5dtxCJt0NqXXp3eY7zJRu7CpFUvumnf06dB?=
 =?iso-8859-1?Q?GVnJ6YvLhOxRip/LCRUg2K4nm4+bCQ0qgW4VnRCrTkjhB4wzw078dfPBEz?=
 =?iso-8859-1?Q?sVrlXYKJkGJjkXg73ekANWLm/06yAhrgpRhKH7Zx2uLNqZCU+zUJDPEMgn?=
 =?iso-8859-1?Q?0awPblXK+nSAJ1zi53QdRXkmnkpG27fIxEyhwtjWZPmTZAief/m4rWXuXc?=
 =?iso-8859-1?Q?R8DnYF7XTEu4A8CYepJDzuNU13HICpEn4mnMs0Txy4IY8BNcs6gsQdmWq3?=
 =?iso-8859-1?Q?LWJTW78MnptwCFWrAaT4mqeBoI2Xl9dhNFwYNQI8DzIomjNDteovydbBn5?=
 =?iso-8859-1?Q?Kfr+0vHEcc2mxDyOWQxSPwhV2CJ4GY+1JMbXHkyW32QYBmzkmDaF7wEwKX?=
 =?iso-8859-1?Q?v+nPqQM772pCOHFFmtx9xX30TgIxXcDbPB66oP+ZOudzhnKHixexetPfPM?=
 =?iso-8859-1?Q?pT+1zmAt5jUEFmrY5NEALmJoE+F8DMy40VToKXwMopCkMU02c+gmzHGitD?=
 =?iso-8859-1?Q?RuHGsBuotsg5q3sgStoqLENomODsVRQeG6WA/c0WR/Gnrl9zbbILDG+oK6?=
 =?iso-8859-1?Q?kvNaKeLQpCc/FdNFFGVO2fy8HD+Fa+SGMyoUH7BEztOETyQZSQudFZsrmT?=
 =?iso-8859-1?Q?oLqvWTTfOcVMgx4ZZtqLVM14OX8MeTbmwBxODjtT0IYSBFQyYFWClG8qHS?=
 =?iso-8859-1?Q?q8k7Idelh7LVpoREAc9piFfOf33MAYcoABuxo1DvCsyZjEx4r/8j9NkOfq?=
 =?iso-8859-1?Q?yUmhMUPVwP/Br1c9LzaEBYgObazGkXIvd2c1n0s4GkmEtEiqeidF6ReSDl?=
 =?iso-8859-1?Q?jtVDAf4Uv6xnMRaEwGi/xso5yAlPU/afTX0wLWa2ibblbkcRqJ0F3JBAqr?=
 =?iso-8859-1?Q?+KWD8mw/XhyJTVGPQ6iaXxDn4Z1ihm18aMDc45qBiXB/MFQHs+pHDWNPAZ?=
 =?iso-8859-1?Q?JHQTsVyRlbGbdZQYOryod4wyThqB7B0r0/L5dVQbq079k1+9yxnLDWUoRg?=
 =?iso-8859-1?Q?lELr7DTCSeQpEc1RIzHVjfMuJJXwdQZQdWvEy+zNe61yiazaa6XqZ7h5/E?=
 =?iso-8859-1?Q?2ZgDkLzpwC3p+jS1x/u5aYUtMAISMThCEN8Xf1yLqD8PcYAMSzrZ7Q4o0m?=
 =?iso-8859-1?Q?BDJKLQSMEaPvrJ44fOgVGx+NDTEjQ5Bu1bncK7ODZKOC9ycIKWhFGWwWWe?=
 =?iso-8859-1?Q?ZO4y5xduYO6rJj8LXvBqI3dk520kUT9XDnXDS8SQ+xu5DKbgo95aP71QmE?=
 =?iso-8859-1?Q?I=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?02QEUbYej9pExV8jifRfLjXnAW0lG9QjCnT3H4vgNDybfW+2feXJjzLbtq?=
 =?iso-8859-1?Q?0AAATiHpZR2aszNEqXw2QGtMCKSYEDztUZ2/1BbfV7llKC9UjAGpEbXVUA?=
 =?iso-8859-1?Q?eLYWXuhP0PkuEzUFAYVoHkBNUTIGckjRUtUq75DKdc4z3lCtYsHw71batW?=
 =?iso-8859-1?Q?1Jib5WjQVEN2OuCB2TVT8RTGATnE5vdYjUluoDkvK+L1e57oXGAcXJo8rK?=
 =?iso-8859-1?Q?tH/rta2IEOGi6q2ZKuHpPyr3MiQCGVXJPMzg8Yu22QOiLcTWf+5EnhsNy3?=
 =?iso-8859-1?Q?8Mb3X8DrIdyBo/IArlz9w3y3Moq3cuEX1X0eYEm2ySEHQXqcL7km9Cj0Oq?=
 =?iso-8859-1?Q?l0VkR5VWTjO2Jt8/fBzLptqBe0MrBTV+dbIFbByq4RHZ1refRHo6j7o1cX?=
 =?iso-8859-1?Q?UfXQYBShlsO6nNA3rR8JbhdzGtDpNxcObfzT0OI4bW3r37c3IQ2INL1AdM?=
 =?iso-8859-1?Q?d4kFGOQOlOc0SKrpjjEXuh52TnyhKnjBQvbtlJHg50LcThpyV9iXPp51Pm?=
 =?iso-8859-1?Q?uaPK8Pk2g0qnsv90mv6c/WrtEKuVmnih3s8HwJOHGGLoYie8to0njzkmMW?=
 =?iso-8859-1?Q?tJ21qBZpurlIf0/jdnNQvDU7F4Mz7v//QkjwGcoIx0oCrSFZKsu5q32w5d?=
 =?iso-8859-1?Q?+RR40I/9iuPWxAJ1RGXC6x6LsEmLQUCjMsdBDI/l3kPsJTJtzEyDy0yEgO?=
 =?iso-8859-1?Q?kzSJvxzDzWpY7L+8fBGAsR3GcX0ap1X9uv946mV9O8/Gk7QoQsub86niKA?=
 =?iso-8859-1?Q?ShX+mPwOdHtSiBl9D7Nw1oiDc6FDtEm83ek7COPVDXjpCS1lhqaZ8fHaG9?=
 =?iso-8859-1?Q?QcwH/vs/UD8hBevcge22Ig1GQ5JwxJ6CfW72MD4Ru0m1ViTmb9Q+5LVLvU?=
 =?iso-8859-1?Q?0ji2S/TaIF8DSa4QKorYVzRcM5e8PVQ3WcvxNsbxRmhiN1eSFACuGwVBwJ?=
 =?iso-8859-1?Q?lfsXgqRpMk+FqJhBvhp7JbNDyU0hYtXZ9HiJ/Y953Mlq2thFacLMbTnWsD?=
 =?iso-8859-1?Q?55ggmLMSxrLx4u9mEOIirKsOwS8qOX3+LI6U4f7Xs+pE5BfvG5URH5rtlY?=
 =?iso-8859-1?Q?sWnA1g3dAuoo/wMmFhX0w2Wp/h8GrNR4yx6i/wDjhsKozkifRcGJ/TsExX?=
 =?iso-8859-1?Q?HVK7e09r1JiTXyf/2IEMo1CiecIg0pqm7c95BeDXwX/JlC7SEmAtNNJN/G?=
 =?iso-8859-1?Q?/bl173WHHka9Bb01+gSYU3OJ6qA7e3Vfo16LXrQq35H+2usOH/tCdp4uzW?=
 =?iso-8859-1?Q?ITOF/EvvvryZayZmaP4rPl/FHa3qqGVtLTHDQFLuHlUersqPn1M8NVIpA3?=
 =?iso-8859-1?Q?YBRLchMAgZJQmk/wG//1TCuzh6Qd/tl/Hbqmo3mLMRpTM7KEIEoG5HRXrG?=
 =?iso-8859-1?Q?0ZTyEvm+qhsgu273OaVGbnhgCZp/nTdta9TibSLtuMDE9b8lzxI+cv/zMt?=
 =?iso-8859-1?Q?I6ZnTywbED73JGBxr6CikMe0IKibLZ6m1vXusTcxeMBKcQP1zolanao8Mk?=
 =?iso-8859-1?Q?yTpGqNcGUGjMcv9lbhOUYfSGSSPoRA6fx7pmtaOn+hUXwst2T8xlYdDUVH?=
 =?iso-8859-1?Q?8BxYRu/HmSCf/nCT2enewhIp76utfjyMIu8IxhycEsHLLSQAxlJxYDULi+?=
 =?iso-8859-1?Q?pyI/QutU5ekOL3yUEY/j7BjsPEYATlcGT4MyX9AOWOHjTwyP3DRykGaw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c2317649-99c8-4b09-05a8-08ddefa95a94
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2025 14:01:20.6881 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lRzt2rIlzZ4CRG454AVCXdPb/lC9+SX9C4o6ym/Pm7B71/EylgQNlOvmmlSPpLcTOOKJtg7YJ27kV1CFff3OAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8501
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

On Thu, Sep 04, 2025 at 12:19:33AM +0200, Michal Wajdeczko wrote:
> 
> 
> On 9/4/2025 12:06 AM, Lucas De Marchi wrote:
> > On Wed, Sep 03, 2025 at 11:36:10PM +0200, Michal Wajdeczko wrote:
> >> We might want to add (and in some cases already have) some debug
> >> level messages that are too verbose and need to be guarded by the
> >> CONFIG_DRM_XE_DEBUG. To simplify that define verbose variant of
> >> our printk debug macros that will be compiled out on non-debug
> >> builds, in same way like we already did with xe_asserts() macros.
> > 
> > thinking out loud... aren't we going too overboard with this?
> > Looking at other places in the kernel we have pr_debug() and that's
> > awesome as we can simply enable it via dyndbg when we want, with the
> > granularity that matters for the issue we are looking at.
> 
> even if some dbg logs are disabled by default and not printing
> anything until explicitly enabled by dyndbg or drm.debug flags,
> they still add some code/text to the driver footprint.
> 
> and this patch just allows to add more logs for debug builds
> and strip them in production where we know no one will use them
> 
> but still, this is just a proposal

I'm honestly on the fence here... I like the end result of the log messages
with gt and tile very clear. But I don't like the macros very much and
would be totally in favor of some conversion over the pr_debug to follow
the rest of the kernel and avoid the NIH, like i915_utils...

> 
> > 
> > Lucas De Marchi
> > 
> >>
> >> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> >> ---
> >> drivers/gpu/drm/xe/xe_gt_printk.h   | 6 ++++++
> >> drivers/gpu/drm/xe/xe_printk.h      | 6 ++++++
> >> drivers/gpu/drm/xe/xe_tile_printk.h | 6 ++++++
> >> 3 files changed, 18 insertions(+)
> >>
> >> diff --git a/drivers/gpu/drm/xe/xe_gt_printk.h b/drivers/gpu/drm/xe/xe_gt_printk.h
> >> index 8dc4217ddb4e..69c4553d0f80 100644
> >> --- a/drivers/gpu/drm/xe/xe_gt_printk.h
> >> +++ b/drivers/gpu/drm/xe/xe_gt_printk.h
> >> @@ -35,6 +35,12 @@
> >> #define xe_gt_dbg(_gt, _fmt, ...) \
> >>     xe_gt_printk((_gt), dbg, _fmt, ##__VA_ARGS__)
> >>
> >> +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
> >> +#define xe_gt_dbg_verbose        xe_gt_dbg
> >> +#else
> >> +#define xe_gt_dbg_verbose(_gt, ...)    typecheck(struct xe_gt *, (_gt))
> >> +#endif
> >> +
> >> #define xe_gt_WARN_type(_gt, _type, _condition, _fmt, ...) \
> >>     xe_tile_WARN##_type((_gt)->tile, _condition, _fmt, ## __VA_ARGS__)
> >>
> >> diff --git a/drivers/gpu/drm/xe/xe_printk.h b/drivers/gpu/drm/xe/xe_printk.h
> >> index 691d3611b889..9ffa26c869da 100644
> >> --- a/drivers/gpu/drm/xe/xe_printk.h
> >> +++ b/drivers/gpu/drm/xe/xe_printk.h
> >> @@ -36,6 +36,12 @@
> >> #define xe_dbg(_xe, _fmt, ...) \
> >>     xe_printk((_xe), dbg, _fmt, ##__VA_ARGS__)
> >>
> >> +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
> >> +#define xe_dbg_verbose            xe_dbg
> >> +#else
> >> +#define xe_dbg_verbose(_xe, ...)    typecheck(struct xe_device *, (_xe))
> >> +#endif
> >> +
> >> #define xe_WARN_type(_xe, _type, _condition, _fmt, ...) \
> >>     drm_WARN##_type(&(_xe)->drm, _condition, _fmt, ## __VA_ARGS__)
> >>
> >> diff --git a/drivers/gpu/drm/xe/xe_tile_printk.h b/drivers/gpu/drm/xe/xe_tile_printk.h
> >> index ed951cdb08cb..33ebfd9722d3 100644
> >> --- a/drivers/gpu/drm/xe/xe_tile_printk.h
> >> +++ b/drivers/gpu/drm/xe/xe_tile_printk.h
> >> @@ -34,6 +34,12 @@
> >> #define xe_tile_dbg(_tile, _fmt, ...) \
> >>     xe_tile_printk((_tile), dbg, _fmt, ##__VA_ARGS__)
> >>
> >> +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
> >> +#define xe_tile_dbg_verbose        xe_tile_dbg
> >> +#else
> >> +#define xe_tile_dbg_verbose(_tile, ...)    typecheck(struct xe_tile *, (_tile))
> >> +#endif
> >> +
> >> #define xe_tile_WARN_type(_tile, _type, _condition, _fmt, ...) \
> >>     xe_WARN##_type((_tile)->xe, _condition, _fmt, ## __VA_ARGS__)
> >>
> >> -- 
> >> 2.47.1
> >>
> 
