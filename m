Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D2B6E8304F
	for <intel-xe@archiver.kernel.org>; Tue,  3 Feb 2026 20:02:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D9C410E761;
	Tue,  3 Feb 2026 20:02:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hqq8C6iJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F285210E761
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Feb 2026 20:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770148942; x=1801684942;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=sUb5Y8ACSgwijBUebiiHBWvBdqHwWzVwXZcrKv8IVRs=;
 b=hqq8C6iJk5EXhYZCh2UyjTis6U3tPhRivSwXWcOvp3/yETzj0cAOatiz
 caXtPVcs+r8ebGM7T002xzmMFp/bC4Dm5C+5RuUjY7R9tYwV6iNjzPQyS
 9ZFUqmGi/YL5xcpREO4Ba6EKs4aGJpufaQ1tvAfS7C9sxfxRNBM8gTKCr
 XqwGbwxU7lJDnCHPHHUZoq5I+7rxU9nOSPoptOU2x6CTImsgBnDBLCa5x
 ftLD5pXhwkJtUrThxhu25mvNtxUadZtj7AwCgnSFC81hPfxomA5IqH3pK
 UkJipotvAWpY/G0PjKvSDEhhqCcS/joH8JT0ghQ81ZDSASLp6nTKBo8qY A==;
X-CSE-ConnectionGUID: HV7gM0ZlTA2w2NbnhfVuPA==
X-CSE-MsgGUID: GzndFrBySHagaLT+CbGmlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="71310150"
X-IronPort-AV: E=Sophos;i="6.21,271,1763452800"; d="scan'208";a="71310150"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2026 12:02:22 -0800
X-CSE-ConnectionGUID: X7X17xiXRI2Wvyqdz1T3NA==
X-CSE-MsgGUID: ULDHRTPuQva0TftJHPCyoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,271,1763452800"; d="scan'208";a="209224045"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2026 12:02:22 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 3 Feb 2026 12:02:21 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 3 Feb 2026 12:02:21 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.59) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 3 Feb 2026 12:02:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N6aqzNWm/zseAgGV/Z776KK7YvJ3iAdB6cIn2KB4Dtp7zQK6+MlADzIvuyCotHMYva/hCFlhFIK3UHlgMfPnhgALuFfNDm7ILVMP5/JIePsWmay8AIHzR46kfUYIKb6WTyV56gBOeDofsYlwClKNGWyXtKbXZePgzzxHEskkDo5ayUJ/LUuDXTMFtFZXkkkngOTA9uqDjiQlbs45sFUQGO2hQgD0jIZ+TOwou6QVfte4yeNl/l55yltrLO/UP6q++elSxQ4Oby3XAIGV2jRYB+VezWeuGNZYmanvYIe5fFJuwAbcC1KlWpIFK6AitwHLd8ayw2tIPBLG/JbhFFbcAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GxGcbP7IxkVTP+csZRyVUkqN2fJrYtoF8BIXQXhwZWE=;
 b=w9NpCy4N3ibnpuy+lqoP8ZS5sm1g53dfbak0PE54gQIVzh+e2LkTcpFAa8zFB63PBmEOoQBX/VJ/5zbZmhRcZtUbELs4zppyUwepq7tagn9Iyyy8YyYFPv8s3ydhexV/n5IJ88C6TgGtrxYq6pkpAXiQYLFKXQo0d11GUII1MjEQBX3AkmYVYMg5OTJFw2MAizNJBLO47AHJ9ZRg4Z52eB42xOcFleTLsQuif5KhOgcTZpuZitkj1fruT0YVB+p/rX4Waut9zGAyfQdVtMOvHlp2sLi15ohIGE7s8Ytwzqsdf2lrxA+liAtDNTxzviRJ1TPioZJSFjRevfSBKKK46A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by DS7PR11MB8782.namprd11.prod.outlook.com (2603:10b6:8:253::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 20:02:08 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d%5]) with mapi id 15.20.9564.016; Tue, 3 Feb 2026
 20:02:08 +0000
Date: Tue, 3 Feb 2026 15:02:05 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Karthik Poosa <karthik.poosa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>
Subject: Re: [PATCH] drm/xe/pm: Disable D3Cold for BMG only on specific
 platforms
Message-ID: <aYJUPUhGFMwSlajP@intel.com>
References: <20260123173238.1642383-1-karthik.poosa@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260123173238.1642383-1-karthik.poosa@intel.com>
X-ClientProxiedBy: BY1P220CA0010.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::12) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|DS7PR11MB8782:EE_
X-MS-Office365-Filtering-Correlation-Id: dd09cbee-41fd-4b50-e9b4-08de635f1c5c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?qX3lZjbiJUHeEoPMGxrVS2nTBK/BHBj+hp1l9Pxk0sbaBb9kXH7VpQvwiUwK?=
 =?us-ascii?Q?cvk6w7/PNy65i3gj1B7uQwyJE4YRntLucl+EENqHJL3d8HrNq8n5cTAZ0FZ0?=
 =?us-ascii?Q?fdeZEgScsKdNywm/khuhHRm96hfXucSFz2LXS/hkecF1FzMgQ6EjNj0ToeU2?=
 =?us-ascii?Q?dnXFTJTqVIzcc66XumKRuyrNnUL107eUup3191WCXEIhYAhPkzwX9taaXXKr?=
 =?us-ascii?Q?2LVdu568zmc5jHuvH/k4qTGK7ovZ4TYxxGCzFf1WYhWdxAVrzykG4ikF4ptC?=
 =?us-ascii?Q?DCsBepuq/un+V6B4dpvSAitqrMhduAorsWd6tIV03O0mwV6uC7Ar+xRaby6M?=
 =?us-ascii?Q?3kboQ3xs94R4HYkCiTK688/fXUM3zhxNP+cEgN7eEQiTI8xSVAoYdu7cJrFB?=
 =?us-ascii?Q?CDlGFqBPbxiM8o6TAYDTaLtTcchw9frmUMFQctYyQ7vn/G/HIYMBiA+A1aD7?=
 =?us-ascii?Q?KmCjRd7S+vaw8/9BvVOQ/8lQ6pXVuqBoKzU804Nn9byaOhqhOKB/Evopbjtc?=
 =?us-ascii?Q?eFuqfQz69VCLDm/BrAnUiFGkqSiK4CWvS/lZB1BYwf9uV6k2y5Hv8Ina3Rrf?=
 =?us-ascii?Q?gs9mzlvNlizn5PJlDwemWXNTbVlCoVHbEIMiWG8vRS/qwjmm2MMn77RJ4/oL?=
 =?us-ascii?Q?X0EV8HX1rO3fSKKzeG2MV/493kyRqcztNhT0fnQT2WQbDurEdEGa2i3avtuQ?=
 =?us-ascii?Q?1EQiGvMR3kdkUy6xprn7XaA1mZtT3M75V/KYxXypfKI8B/Gtgi72MlHXcKWA?=
 =?us-ascii?Q?uLqCmE505B/l71wXflxADPZDUTQGV5ETg0fuZX0gShXiNaXqIxrUJhQCETOE?=
 =?us-ascii?Q?yweGCOxX2KoMYSmL0q8yI/DxmlCi9wKwLG9TfQ3cwFJTR1FmXYjMcMjdrDcm?=
 =?us-ascii?Q?jFXRPM66ZE3ztkYUdTLHkfiZQ6WKPR5Fmctt6jNjWKA+TTANiQQleOhlSCi9?=
 =?us-ascii?Q?eEuJGbgI3kRpb/Yt2dW7UAUQ6Pz4OiuAY82pmcoEzNBCQfXcGy0yETpT6jCS?=
 =?us-ascii?Q?0dSmjPv2/CcLW4B+Vv+2b0r+HkcANJchqHXKHcUYRfLWZhZ0pb8obbKAbtzY?=
 =?us-ascii?Q?VOQkAjnHAOM4txt+QUQfKq5hBkkR+4bbu6XHK75fXSRmN6FYkNDMmYfgwvUo?=
 =?us-ascii?Q?3hxufdwEigIvySLaQvUOvDkqwRkbjivzLbo0zdhW0eD/r3Cqhyl+dzx3Oh/+?=
 =?us-ascii?Q?7CL6Ev2n6O1qAgPRCFqqahudZPpeEKsHG5Qcm7EkPm5IVn3ZrSL9B43jC1cW?=
 =?us-ascii?Q?ak4tXdx1dFnVwPMy7D5X/6iFdbhFmLknCxWkGlgrGYgrURYj0jlyMax1MZNv?=
 =?us-ascii?Q?0ATHCVfjALzWx/r68mXTKFR0rmlP0nhaJVUObMGjPUN4Bwag052TtpbKj4Sw?=
 =?us-ascii?Q?c8uwTykO8vCdNhEG8wIJCLRlL9eYj4MfqLFziSG9kF9iorUMMLiaPxK+i8BD?=
 =?us-ascii?Q?l9S7Yh4JYOsrDKstOdQcmZR6jTZwClDn2ySlu9wiNLHsnplazFA1xN4yKgI6?=
 =?us-ascii?Q?jcytuAWAtdvpxUQrdKk6dfOgASrIQbqa7PVXNbtFQyHOFP4TSg4rqEYEb6rS?=
 =?us-ascii?Q?p8fJyVODYEa/ENFpHXg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?D3ubUWtb44HfUNHUWzPh6NDwW6WvenQttCJX6z3f0bPmMA00tEjwb16Bk0sh?=
 =?us-ascii?Q?yCoInqsUSPOuUEgtABXz+WRGl50/K79job0zkOtTnKfDMgRXYDhdLo+gPCrQ?=
 =?us-ascii?Q?iUXgTk+avg+0EAvq62zpWl9nScL5KLlkQSo1NqycaepK8BLrvQ7djeWlbtIv?=
 =?us-ascii?Q?dHwXGqm/EqobUbTTZmAodAE/5tuS38ozuskb6HWhuu3rUgZKHfZwnb5h0dE6?=
 =?us-ascii?Q?Zfz5XZswGobDnVlcnRVfjCDIRqEFxQFZk7Hgo4kK0dAcHzGfMvqVrn8vwAS0?=
 =?us-ascii?Q?ou9mMXchpGerqLzF939AgMiEn4q7teX8ufOhSBnXa4qs1mkEU8sAfjwWmF5d?=
 =?us-ascii?Q?s7SZUIhfMe19YcI4mn+Sqgu8660KvTior3NoJiMw2/C7sg3B2a/aejvVpix1?=
 =?us-ascii?Q?aCB330hvvK+RsbyfU7jhZ58V7RUENvvWWRql2HknfUjHwwGvXritP4PRGzrV?=
 =?us-ascii?Q?ZjeW7Li/4BHdy9Y2U9UL8ZdOAtW6v6qbKPwabaW/dBLQkWbl4tbd5phWrPot?=
 =?us-ascii?Q?oa4GxR59072DUOZGiB4J/lIdIV6K0rkrfzpJvsc7zyldBIwy60N1HFPiDlm+?=
 =?us-ascii?Q?oP1OSPapF9unx+nuS3IHJQWewRW+aNlSYrUuk+5QHf8Y5EpgBOINElGipHti?=
 =?us-ascii?Q?KbiK7CZmR5te9D2tZX+kd1HyCagCirCA7YVoj4UZsyVy9/l3rHAYgZRBLv8U?=
 =?us-ascii?Q?3w4TSVCHtWFbNnO8XaykrdmjJfG6mLfIkk2l1U859yAWJMSLdyCuTYEQ6YZb?=
 =?us-ascii?Q?I53sRMpvhQaJD7pK4jvWTpD//RlcScSGNDrFPNZDUl93ENu7Z/jDIokkc2QG?=
 =?us-ascii?Q?pHwv9Rl22JhpbuQPqF6Y9IDQHFJ9eABv0OJ9iFF3Nmt8BL8qvg3eKEMrX38r?=
 =?us-ascii?Q?VdGWppUEs7VTPmfYQUCZq3/O8AagUA7nV26FLkYVPR2fZJ0A7p3LElits5BM?=
 =?us-ascii?Q?UFub0ALdohz53XPPNFB22rKcMZCNMLupD8/Mc4J+YDquQ+LZOThRDE30WhWv?=
 =?us-ascii?Q?mzWASXCG6gizvyiBgKKhsFqg29UVpixTK6oVoT76RJTH4SzXSxFSC9uBVA+m?=
 =?us-ascii?Q?AfLqVKQP5w+BQJBXeR7CkCSeJPUjtUUr6pm4x7qaL8B6WAgke6kYLCwn0wM9?=
 =?us-ascii?Q?nwceVxVo8KERvK3nmK79hgm8u0fC3dAD/CJQdLkiKgnkuQbX9f9Hzf/lqACL?=
 =?us-ascii?Q?Y3NJdPMTMUQE6Vl038XJ7obxSB7nxmcebyn+fUWrTmzSB7/oNshSsbcXYLdX?=
 =?us-ascii?Q?rtXatrGBt1SaDq+4CRVHlNbTC6sjOqwEvDwQ+dOnaBb2vSyMBKfcIgNApkVE?=
 =?us-ascii?Q?bvMBRxTf9a6HicrVSM2I2OuVmz9Lbbc+K8FVKmk0voWKb8vuqUNgL8f3X3b3?=
 =?us-ascii?Q?kVzF3Y7xZhb51f14F5GKUAOKwAsggm7XPo2n6maKMSL5Wmn87GBCJlFTZ7YD?=
 =?us-ascii?Q?32D4xPj7eFM8V9Gqh/JJHFciIPzS50HIu64CnFTP19p7csygH6ERlbC8B7gd?=
 =?us-ascii?Q?MO1hpT0hXguA2dWHnShjHRSHPLEpE8hcsahJZ+6R/P1WYV4eDSQ6ncPntlBv?=
 =?us-ascii?Q?QUKno3p2446h8SFLgVCtWx9dhxLOj5mgR/zyRyDwHEfdJZFTsOtPwh/fr1mo?=
 =?us-ascii?Q?/UwM88Uu5IRb2Uusad8GEDXmrBGqc+oP5jY7F+1BuBMOZ/k2p4H9KXT4o4yN?=
 =?us-ascii?Q?K9oqV/JtrT0aQDPDL1kNakmJvINNkjY29Nb+izZUXmvWP8zu3WKYTK/VNmpF?=
 =?us-ascii?Q?nqg2cBJ6fw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dd09cbee-41fd-4b50-e9b4-08de635f1c5c
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 20:02:08.4473 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XNEhp+KXQTUdU+OBemd61gwxMyxTlJQOtz+KhjPg7kZlupZUXhmUZ/qb8blBRexyGyHqB6E/fY1rpPwVCOEncA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB8782
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

On Fri, Jan 23, 2026 at 11:02:38PM +0530, Karthik Poosa wrote:
> Restrict D3Cold disablement for BMG to unsupported NUC platforms,
> instead of disabling it on all platforms.
> 
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> Fixes: 3e331a6715ee ("drm/xe/pm: Temporarily disable D3Cold on BMG")


Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

and pushing it right now...

> ---
>  drivers/gpu/drm/xe/xe_pm.c | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index 559cf5490ac0..01185f10a883 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -8,6 +8,7 @@
>  #include <linux/fault-inject.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/suspend.h>
> +#include <linux/dmi.h>
>  
>  #include <drm/drm_managed.h>
>  #include <drm/ttm/ttm_placement.h>
> @@ -366,9 +367,15 @@ ALLOW_ERROR_INJECTION(xe_pm_init_early, ERRNO); /* See xe_pci_probe() */
>  
>  static u32 vram_threshold_value(struct xe_device *xe)
>  {
> -	/* FIXME: D3Cold temporarily disabled by default on BMG */
> -	if (xe->info.platform == XE_BATTLEMAGE)
> -		return 0;
> +	if (xe->info.platform == XE_BATTLEMAGE) {
> +		const char *product_name;
> +
> +		product_name = dmi_get_system_info(DMI_PRODUCT_NAME);
> +		if (product_name && strstr(product_name, "NUC13RNG")) {
> +			drm_warn(&xe->drm, "BMG + D3Cold not supported on this platform\n");
> +			return 0;
> +		}
> +	}
>  
>  	return DEFAULT_VRAM_THRESHOLD;
>  }
> -- 
> 2.25.1
> 
