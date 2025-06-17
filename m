Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CBF7C71157
	for <intel-xe@archiver.kernel.org>; Tue, 17 Jun 2025 20:49:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB0E810E16B;
	Tue, 17 Jun 2025 20:49:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S0w1KGpG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8821510E16B
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Jun 2025 20:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750193385; x=1781729385;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Zgttu5cY5Tp5M5vtvHupdxHhgODA2XZhZjkE9ewvUcQ=;
 b=S0w1KGpGUM6bdbsUJ/KHHvI52RdxyYIdCxLeYkeeaNyB+uBiOQVjzjBL
 f9Bs814N2GR/FjsUZuO8C1PHJqT1SWBhSnLljazyarHGQTnwI9XJfirmQ
 RhAwn9NhECJmXE9KwFQy8J4DHVz42bhywAoJLP5MjmcRI8trAeqTmGcef
 qQUjKmWX97OBD+83rukLUnKL5MWNOzd55xEowOE8fwopIQpaK19CwxVpb
 6KktKqfM9ipPaRccFWwwF3D2nbWaTo1k6xpriavJHcj1a6/Hsl9sxqRJF
 ZPLM9FLqSxB6AsbkV6Ep6jbBHlCgHZUcBih21kzSsOtYqp+Oonk9M/yrq Q==;
X-CSE-ConnectionGUID: ledEV9cATyavo0kXI9RpQg==
X-CSE-MsgGUID: zd4Bq50LR0uMn3YprhmkQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="39995504"
X-IronPort-AV: E=Sophos;i="6.16,244,1744095600"; d="scan'208";a="39995504"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2025 13:49:45 -0700
X-CSE-ConnectionGUID: HbgB7DdrQUCB0r95r/3gpQ==
X-CSE-MsgGUID: lkK8Ql6wQRCqxaiqxDT2aA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,244,1744095600"; d="scan'208";a="153847407"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2025 13:49:45 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 17 Jun 2025 13:49:44 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 17 Jun 2025 13:49:44 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (40.107.102.80)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 17 Jun 2025 13:49:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DsjtCeTNPL4j/RZaH3pT9GamH+gmC9nJ20YorWhAlkdjA4SA2uuH3Aviv7iBGhD2V8mgELWHBkkHYTjn+WMWE+UtD0j5o6jMKIbtLJJAME/ek1svyGRzdwqt35GL4KiJalPjkPybhfb05yI2DXT9Y/8mms7ukvtWg55AHVd99WjoiFHkY/1k2HU3cUyZxs+jqivt63pHNpdd+3mfi5YU2G9br2HL09SxXjlM8eyRZUj8HZ2u7rNe1fTHMZlWn4fCJfZI7KAw5FR7m5r3Tid2WowUJV1cQ7+tPx6HllJFR+TENiqHjXKZE3+kSUV2Lap3PoBR6DCQofnWuBbCIp9aNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sI+U3u2f1cyOlNpqOadmXwGaHi/idGwJiFKmFB2b9/M=;
 b=rErmi4+07f8/JqaPDzvZTi7HQ9M6UEAMj6mZFE8ROensGAHK9L7FGIJQd4Ov7BBZz9+tTxVyQsMErfTf5z9Nz8LBQuXfDmShJZB6Jqdz5uCqSU7GhyCbWgXO4BmwQ4exm1inAbdOklAlEmEG+5935n2jws0qpQPzOi3ABtRiEIxHTIzvZ+HER5TbyHQkJg2r097bfJ6M823Sj0cSCH0iDTfj6iyGSJ5gDJtcItRYGIZVqJyjXFLP8AxNwYp1CrxB753xz1wnncpODRXFkjl9ec5Msz6jLS7JOYp3+wm0cCOKGiDfEFYtIxoOQMnJX1iAaPXJFMLkafj+U3GulZv2GA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by SA1PR11MB8840.namprd11.prod.outlook.com (2603:10b6:806:469::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Tue, 17 Jun
 2025 20:49:13 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%7]) with mapi id 15.20.8835.027; Tue, 17 Jun 2025
 20:49:13 +0000
Date: Tue, 17 Jun 2025 13:50:50 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v3 1/2] drm/xe: Add xe_vm_has_valid_gpu_mapping helper
Message-ID: <aFHVKsvVItiHxMKm@lstrano-desk.jf.intel.com>
References: <20250616063024.2059829-1-matthew.brost@intel.com>
 <20250616063024.2059829-2-matthew.brost@intel.com>
 <a5f37fef-4558-445d-94ce-4e9cc055f546@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a5f37fef-4558-445d-94ce-4e9cc055f546@intel.com>
X-ClientProxiedBy: MW4PR03CA0046.namprd03.prod.outlook.com
 (2603:10b6:303:8e::21) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|SA1PR11MB8840:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c55582d-31fd-4513-ba88-08ddade06b17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?OZFieIZplugNPv2lKj8/ryDDRdcxdx09Ubx0O/JnQl6AVlwfVa+Aiq3a+X?=
 =?iso-8859-1?Q?irxP6kOJVnrrHIAUpGgmowC2Er7XdjXoL2oV5LfT4OEFrURzJiFASPSCXw?=
 =?iso-8859-1?Q?OZIWaH/Bwl5eLgXDWpiTKMwXu/otUPW0BWOQcvu+rDNlqHngn1D70QE6eF?=
 =?iso-8859-1?Q?i0Gv4RO75E4/2+flOoGng+KTbMC6eELy7BGrGo/p66SSWIfgC/NlLTZeFy?=
 =?iso-8859-1?Q?EYBmlQJwjxciKq0MIHnY3+w35vp8L1/sk0iRrh7E61F7OxewINKMcVHeg1?=
 =?iso-8859-1?Q?iYhwFeQ1j39rfdLErZCfNs64WNOHUdLGg6kd8rwsBjqqvK/XNWKOekuTSE?=
 =?iso-8859-1?Q?n0HpOLsdx85/QM2psrm3ddxOHJVtmk4WD/CraQmH/9zqnmPegt9SnI544E?=
 =?iso-8859-1?Q?qE+uoR2VeDf67V8zANGaqA/Dmr0vtiZulzlpRu71auVJmWhnAs6JgrdMBT?=
 =?iso-8859-1?Q?4ofI4U+nmhSOCsKpj4E8pOArDJEKkB+nqLuolsL33VZMOV7hwKFyExGw0j?=
 =?iso-8859-1?Q?CXj7aYYTGC2Zre3XQ/ybXFt1fKCmde7H+W7lzrEG+l5dDH7yDDv4Pqmrdz?=
 =?iso-8859-1?Q?TzneXIcMz8l9H60nCg5M55gwjSEFB2uNxPjDRF973gOjDFzq6EpO4SYJxC?=
 =?iso-8859-1?Q?8Mh04XrptvBbk3gq/HMM9ixxJnQo4iyzaDlfFpOVkhwUmmxIz7NTuMoxvl?=
 =?iso-8859-1?Q?wfu5f1jtd7tJ7OawkcCuNqWbT6uXO6+cVlUm2rGTGyWYN7mXWNQWSQhjv1?=
 =?iso-8859-1?Q?iN/tbFvAOg3JcMZINVDurV/cbMXZnV6rae4MPNiGMB8o3dMkoCl9YdylGM?=
 =?iso-8859-1?Q?04AkzugmEqJcgv8K0uUGylG27cSrENyQgHlrQl2xWsrXvx9Z1XSFgtNo7O?=
 =?iso-8859-1?Q?QeKdR6X0Kmc8cwqcNQajP6kevqVhaAO1f3VRIpTdJn1jr3yNHILL6ekqu/?=
 =?iso-8859-1?Q?ae4B9mYRhfyTpqUfklfhV1VfvgFAGBMQP7SrsIl+M3Xfoga0MEQ1CffX9M?=
 =?iso-8859-1?Q?5ZvRuXs6w0SmtLKuEP9L0Bp7jcrZAV0503WirSYGvdScv1oNXIpkNoTFok?=
 =?iso-8859-1?Q?SrS2cCdRGFVHHQ3Eu5sG3kHDCPE9AtpWQHG5Cp2WbRXddS4oA2FO/SUDEE?=
 =?iso-8859-1?Q?pGQRDg2o+7qyVJ0XEHQoSfUldXzrwW4NFbgBEbH0wQPDEafJ1z6ICUmcl3?=
 =?iso-8859-1?Q?5qjjqTCcMmyNQ+wPqKf7M84sRUrhcLDIC2Pc16C12mhkEdwo6BQocdWlNk?=
 =?iso-8859-1?Q?H7Pm5FszNzfYkqN7uqm96imUT1fMDFzdfbMVVrRB2crtdZtG5whKBrPsJ3?=
 =?iso-8859-1?Q?Gzds5bQHv0BQ3V56twdkWmpd/D5TGFpUdinBLNpsPIqdWahO+n4Km2FWDo?=
 =?iso-8859-1?Q?tm22T+J3DLCxbyH4hZL8Rv4CA21KDWMxHEOldL7XrhYdWRhoACgVRwHR0h?=
 =?iso-8859-1?Q?PuetTUi3/8lBruoVGlSLAfy7lpcBsP4Hd1Leqi03NrOX/Htm7DlQ3PhXjP?=
 =?iso-8859-1?Q?s=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?GzE2LM6NPHBoed9IF0xhBQhhCWXTNpvAYr6O9ryG0AIz2F57q+encPzAvU?=
 =?iso-8859-1?Q?A2Ix9wbB8UscLQ5bMTiG3e8xxmglsw8gNnToipRwCaQll6LGhn4w3RN8Sv?=
 =?iso-8859-1?Q?870tSu64zrNHwZeKMBAE7saUMou2M/hUm40bmISPpm2ompUwTgg7R3LTaQ?=
 =?iso-8859-1?Q?m0Mq+SG0FHkMs+YUM4jCVs5kZbZiL8lxUf+KWI1TGqr2608/UhiH0+/q3J?=
 =?iso-8859-1?Q?8Ay9EG9r1I+iYa61sYEYuC5opUMk0juW1zQlPMSL8avtXRF04NvcCCirZJ?=
 =?iso-8859-1?Q?8IHk77YNivfk0e8ZUhY0wiIAjZl18E6A7rd02r64yPtRHB/EhmIxBWxAUc?=
 =?iso-8859-1?Q?0CUCxWROomrH0fapKj5Tq9gbNal+4PKtzuYTyckTdi23bBGGkd/a1lMqOM?=
 =?iso-8859-1?Q?yPEA/hi95SenQ92AHTc6GCfER2cyMF8to2p8Reh2qjJiTgrAdhKa8Y56z3?=
 =?iso-8859-1?Q?c9wQhQvFY4ZRdUKJkTAB5RWhsgSf/AfKzIQ9kHwXrkNhqsXTvE47AWh0mV?=
 =?iso-8859-1?Q?M0LFmdPpT9EF2xmnHwh64TdqmdzPsf9ztl/9cISOwH3zUtRmwOs45Oj6Mc?=
 =?iso-8859-1?Q?WxUAksYuRI9LA7SGkHnxrhd/MoLbH/B7fTKYinTktHxmBJm3GEMiIDUJSv?=
 =?iso-8859-1?Q?GcfmlqXOYBrFBUO/PR4N15plh+WsdgeFAcNSqGHLsnPyTojIA7nxOuzua4?=
 =?iso-8859-1?Q?UU5BSQXYsqA2fDv5ngsKqk5Zj1tKdWG9sk3z635CdRHRpAulyJzVu/Cn9K?=
 =?iso-8859-1?Q?FP5zJ/p2E58sJK/QE62dbgx99gGxTrJB3rku8d2rxfA0H0MKOWyVmzFN4A?=
 =?iso-8859-1?Q?i7KqlrWYI5PlvmOVRVrAY02Q8vzBdJMi9p8G1reTKneaolOblnWaZW+VoE?=
 =?iso-8859-1?Q?BEOgX4ZWZG3JdBnzT1ZeH+G1ngWD824H9EmSL3sXSbTHlw8khoI7Vt99a/?=
 =?iso-8859-1?Q?x0k9ot2zP4XJyeU9h/fTk5qOZlXr9ebU5wj6gmsRq9PKbn2VgDDFXlzRXs?=
 =?iso-8859-1?Q?X5OfsDUHkwq/N0oft0f55zjm6lQq0YZjR9PdO2a7N3oBTqc5oOBTJqnjA8?=
 =?iso-8859-1?Q?2rhtU2VXw+zpONXrF8i+47Eku62mk9urNvoFVngFu9tDYY3Hx4XhNp58Wf?=
 =?iso-8859-1?Q?fVSmVDXeRdNFqHKCYZedD/pL1fwBr9dU9g5/Tkf5XNbyI0BmeCvH53bm5q?=
 =?iso-8859-1?Q?UtR+u/tjfWiyUVBjEgWRflgGXzS6BMh1es4tn8tY0LoGHA7UmXdVtjOsuu?=
 =?iso-8859-1?Q?JSWBq9R1AnwhA3tgawveZIMp1tDc3716gj1BDhCMeVMWjh75kMkUUtJkW8?=
 =?iso-8859-1?Q?xhPuu6g5Ztqk+E4taJv61JLYEnX0lfX5PTm2XKKehTkwIy/DlPs2cjLYWY?=
 =?iso-8859-1?Q?hDr20M+48AakinaQmnYVZOp61HEDFjicPYDhM6sFsp2sKLEScXF++Cb6iF?=
 =?iso-8859-1?Q?CaRNdrim+CvfCUXn6i4caN+4RLcAGC6sMwXCts8TgwaduXXjJWhzakulxb?=
 =?iso-8859-1?Q?HfUzXrLR37JmvvFaaFIOqHQrOR3JLJBZ0y+uwDcsSrb5KF9KUxKMWLOOAd?=
 =?iso-8859-1?Q?cIjp7VAJogBNWh5nk+H9dhyvsBdgtB/9Sl0xLzrufqTPTVwACXrlwNY56u?=
 =?iso-8859-1?Q?Olq2v4G+kSflyu2Z5C16hLCfT0zTYvT35FwXN4dtaWHC2tgumrAc/+yQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c55582d-31fd-4513-ba88-08ddade06b17
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 20:49:13.8988 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ce+GluxKhKbYzrFanzGFMyxA25DbVcuh5Ls1unUsUK0LHYniPJ2aSmj8ZWjpDlk1QCob67gaDtgxcbsDiRlOLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8840
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

On Tue, Jun 17, 2025 at 11:11:40PM +0530, Ghimiray, Himal Prasad wrote:
> 
> 
> On 16-06-2025 12:00, Matthew Brost wrote:
> > Rather than having multiple READ_ONCE of the tile_* fields and comments
> > in code, use helper with kernel doc for single access point and clear
> > rules.
> > 
> > v3:
> >   - s/xe_vm_has_valid_gpu_pages/xe_vm_has_valid_gpu_mapping
> > 
> > Suggested-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_gt_pagefault.c |  9 ++-------
> >   drivers/gpu/drm/xe/xe_pt.c           |  6 +++---
> >   drivers/gpu/drm/xe/xe_svm.c          | 16 +++++++---------
> >   drivers/gpu/drm/xe/xe_vm.c           |  2 +-
> >   drivers/gpu/drm/xe/xe_vm.h           | 19 +++++++++++++++++++
> >   5 files changed, 32 insertions(+), 20 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > index e2d975b2fddb..3522865c67c9 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > @@ -69,15 +69,10 @@ static bool access_is_atomic(enum access_type access_type)
> >   static bool vma_is_valid(struct xe_tile *tile, struct xe_vma *vma)
> >   {
> > -	/*
> > -	 * Advisory only check whether the VMA currently has a valid mapping,
> > -	 * READ_ONCE pairs with WRITE_ONCE in xe_pt.c
> > -	 */
> > -	return BIT(tile->id) & READ_ONCE(vma->tile_present) &&
> > -		!(BIT(tile->id) & READ_ONCE(vma->tile_invalidated));
> > +	return xe_vm_has_valid_gpu_mapping(tile, vma->tile_present,
> > +					   vma->tile_invalidated);
> >   }
> > -
> >   static int xe_pf_begin(struct drm_exec *exec, struct xe_vma *vma,
> >   		       bool atomic, unsigned int id)
> >   {
> > diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> > index f39d5cc9f411..9c30111e8786 100644
> > --- a/drivers/gpu/drm/xe/xe_pt.c
> > +++ b/drivers/gpu/drm/xe/xe_pt.c
> > @@ -2196,7 +2196,7 @@ static void bind_op_commit(struct xe_vm *vm, struct xe_tile *tile,
> >   					   DMA_RESV_USAGE_KERNEL :
> >   					   DMA_RESV_USAGE_BOOKKEEP);
> >   	}
> > -	/* All WRITE_ONCE pair with READ_ONCE in xe_gt_pagefault.c */
> > +	/* All WRITE_ONCE pair with READ_ONCE in xe_vm_has_valid_gpu_mapping() */
> >   	WRITE_ONCE(vma->tile_present, vma->tile_present | BIT(tile->id));
> >   	if (invalidate_on_bind)
> >   		WRITE_ONCE(vma->tile_invalidated,
> > @@ -2255,7 +2255,7 @@ static void range_present_and_invalidated_tile(struct xe_vm *vm,
> >   					       struct xe_svm_range *range,
> >   					       u8 tile_id)
> >   {
> > -	/* WRITE_ONCE pairs with READ_ONCE in xe_svm.c */
> > +	/* All WRITE_ONCE pair with READ_ONCE in xe_vm_has_valid_gpu_mapping() */
> >   	lockdep_assert_held(&vm->svm.gpusvm.notifier_lock);
> > @@ -2324,7 +2324,7 @@ static void op_commit(struct xe_vm *vm,
> >   	}
> >   	case DRM_GPUVA_OP_DRIVER:
> >   	{
> > -		/* WRITE_ONCE pairs with READ_ONCE in xe_svm.c */
> > +		/* WRITE_ONCE pairs with READ_ONCE in xe_vm_has_valid_gpu_mapping() */
> >   		if (op->subop == XE_VMA_SUBOP_MAP_RANGE)
> >   			range_present_and_invalidated_tile(vm, op->map_range.range, tile->id);
> >   		else if (op->subop == XE_VMA_SUBOP_UNMAP_RANGE)
> > diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> > index 2fbbd6a604ea..26418e9bdff0 100644
> > --- a/drivers/gpu/drm/xe/xe_svm.c
> > +++ b/drivers/gpu/drm/xe/xe_svm.c
> > @@ -141,7 +141,10 @@ xe_svm_range_notifier_event_begin(struct xe_vm *vm, struct drm_gpusvm_range *r,
> >   	for_each_tile(tile, xe, id)
> >   		if (xe_pt_zap_ptes_range(tile, vm, range)) {
> >   			tile_mask |= BIT(id);
> > -			/* Pairs with READ_ONCE in xe_svm_range_is_valid */
> > +			/*
> > +			 * WRITE_ONCE pairs with READ_ONCE in
> > +			 * xe_vm_has_valid_gpu_mapping()
> > +			 */
> >   			WRITE_ONCE(range->tile_invalidated,
> >   				   range->tile_invalidated | BIT(id));
> >   		}
> > @@ -605,14 +608,9 @@ static bool xe_svm_range_is_valid(struct xe_svm_range *range,
> >   				  struct xe_tile *tile,
> >   				  bool devmem_only)
> >   {
> > -	/*
> > -	 * Advisory only check whether the range currently has a valid mapping,
> > -	 * READ_ONCE pairs with WRITE_ONCE in xe_pt.c,
> > -	 * xe_svm_range_notifier_event_begin
> > -	 */
> > -	return ((READ_ONCE(range->tile_present) &
> > -		 ~READ_ONCE(range->tile_invalidated)) & BIT(tile->id)) &&
> > -		(!devmem_only || xe_svm_range_in_vram(range));
> > +	return (xe_vm_has_valid_gpu_mapping(tile, range->tile_present,
> > +					    range->tile_invalidated) &&
> > +		(!devmem_only || xe_svm_range_in_vram(range)));
> >   }
> >   /** xe_svm_range_migrate_to_smem() - Move range pages from VRAM to SMEM
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index 6ef8c4dab647..04d1a43b81e3 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -3961,7 +3961,7 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
> >   	ret = xe_vm_range_tilemask_tlb_invalidation(xe_vma_vm(vma), xe_vma_start(vma),
> >   						    xe_vma_end(vma), tile_mask);
> > -	/* WRITE_ONCE pair with READ_ONCE in xe_gt_pagefault.c */
> > +	/* WRITE_ONCE pairs with READ_ONCE in xe_vm_has_valid_gpu_mapping() */
> >   	WRITE_ONCE(vma->tile_invalidated, vma->tile_mask);
> >   	return ret;
> > diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> > index acd3fd6c605b..cc332c4ebdf2 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.h
> > +++ b/drivers/gpu/drm/xe/xe_vm.h
> > @@ -375,6 +375,25 @@ static inline bool xe_vm_is_validating(struct xe_vm *vm)
> >   	return false;
> >   }
> > +/**
> > + * xe_vm_has_valid_gpu_mapping() - Advisory helper to check if VMA or SVM range has
> 
> Nit the helper is no more in use for VMA in Patch 2.
> 

vma_is_valid in patch uses the helper though.

Matt

> Rest all looks good to me.
> Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> 
> > + * a valid GPU mapping
> > + * @tile: The tile which the GPU mapping belongs to
> > + * @tile_present: Tile present mask
> > + * @tile_invalidated: Tile invalidated mask
> > + *
> > + * The READ_ONCEs pair with WRITE_ONCEs in either the TLB invalidation paths
> > + * (xe_vm.c, xe_svm.c) or the binding paths (xe_pt.c). These are not reliable
> > + * without the notifier lock in userptr or SVM cases, and not reliable without
> > + * the BO dma-resv lock in the BO case. As such, they should only be used in
> > + * opportunistic cases (e.g., skipping a page fault fix or not skipping a TLB
> > + * invalidation) where it is harmless.
> > + *
> > + * Return: True is there are valid GPU pages, False otherwise
> > + */
> > +#define xe_vm_has_valid_gpu_mapping(tile, tile_present, tile_invalidated)	\
> > +	((READ_ONCE(tile_present) & ~READ_ONCE(tile_invalidated)) & BIT(tile->id))
> > +
> >   #if IS_ENABLED(CONFIG_DRM_XE_USERPTR_INVAL_INJECT)
> >   void xe_vma_userptr_force_invalidate(struct xe_userptr_vma *uvma);
> >   #else
> 
> 
