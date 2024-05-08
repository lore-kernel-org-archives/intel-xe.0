Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3372C19F4F
	for <intel-xe@archiver.kernel.org>; Wed,  8 May 2024 13:07:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6D3D10FD5D;
	Wed,  8 May 2024 13:07:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PdW1zs9o";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7300810FD5D
 for <intel-xe@lists.freedesktop.org>; Wed,  8 May 2024 13:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715173622; x=1746709622;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=8V50LDjAcIvr/Jcw+iB7ef+ioyiT0OJlGgeGijxD6OE=;
 b=PdW1zs9ouuQerwtWmaEP/3UDRG2j2R+X6pWlP4mmreInQT3L/nTINC6T
 WDi1rsw3lNN3DKMjKekBuF/WL7Ri6HxhHcRDNcvGElG4564sv6GGmADuP
 JOhr7DM5WgtnCGDOBBP7wiRAqFGEPxAm1h4UOxQBFwcihOr1infcMAUqF
 lFhzxmamG03Ts4+vfZ8xli0VVjgp0JhGvqVBMOR64DUGBAm+lY2qb5GRL
 EyqddfRTfl5r8YCYJSBWXqekJOsgZCbfg2RyB6hXOZiuNGLJtsdJyfn6g
 +7yxw/BzZpNfuAqIrRwYqgk5WhWIiIVEmKXFdyXh6z3WszlXT2rakEzKp w==;
X-CSE-ConnectionGUID: Gyh4nw9pRS2nCFViodZ8Zg==
X-CSE-MsgGUID: viYhWtfoS/6iHcDuF5Qx5w==
X-IronPort-AV: E=McAfee;i="6600,9927,11066"; a="10898998"
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; d="scan'208";a="10898998"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 06:07:01 -0700
X-CSE-ConnectionGUID: sDxDwOSjQWyWnnIjUBIjnA==
X-CSE-MsgGUID: ORjCa6yIQ76/tdARY3HG0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; d="scan'208";a="28749705"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 May 2024 06:07:01 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 8 May 2024 06:07:00 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 8 May 2024 06:06:59 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 8 May 2024 06:06:59 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 8 May 2024 06:06:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RX8BVhyBTvgW/hjqsUWo25f/49BJ3xll7TyDTSyc9TElOD8zNwbzrt3JR9s0rT85VAvioNzyc7chYDfuJTLGbK6avZ7sygLiDPU6Ya9lFK3zx9r4kt243zEyRLArnA21TnR0hd+emyNE3ln2bLxQH+s+lNX4XBMUMUuAHixWxqjiFtzoEAHUxcUEl2yjNdtL0gw2/gL7l0qjFYi/RYS73JulpKkiCI+QIO1cUnH+aqc1nWNujxsTyzJNuhxVb+lmJkGM/pukgQz8GNlzFOsb5wCi9hLa3Pwvs2CPlYYgLqChaoblPn2qCRvRLSzqSgOTcDd0XLhcwR7ezaDFzJ2Iqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UHNRwIx7+j7NIIe4IBIfLox2idD6GBmH/SFQkfVjkyk=;
 b=ocn3tFaM8Zzeg8g1IHiLqOduOgKHR5l7kT7Z4RL/ep4VtppA0q1fp5N9AkqPF5t+GFcdZMPpDa5loeNNtC0P5A8ENq/FHBUvX4zzztMp4DGj9Y4E1LkZQs9+t2dXZN/7XQGZiE6GcdNGToEno2+3R1F4Y0B6nppHfx65qOx0Mr8C1O6PB56quFIhGbrni4+8j4RTR9IuZRqh9+A2gRk/+LDW9ehWAakcqCbm2S31qQLt+TUtSgIB7hfvmN8u5+1GCcb3D7STV0bYfWIFq0B7sdagAl3Jw/ypkrY18Q4+LSKYgUPw0S9h+/CO+uWiQj0epEI6rY/OC7+sjzUwAzho0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB8250.namprd11.prod.outlook.com (2603:10b6:510:1a8::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.43; Wed, 8 May
 2024 13:06:55 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.7544.041; Wed, 8 May 2024
 13:06:55 +0000
Date: Wed, 8 May 2024 08:06:52 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matthew Brost <matthew.brost@intel.com>, 
 Tejas Upadhyay <tejas.upadhyay@intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>
Subject: Re: [PATCH] drm/xe: Modify minimum of various scheduler timeout to 0
Message-ID: <27iutedmzaotadr7fhnqhvy6naydrsqstgarjmqa4ltmlsowix@bn7n2shccrgd>
References: <20240506133447.3143994-1-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240506133447.3143994-1-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: MW4PR04CA0129.namprd04.prod.outlook.com
 (2603:10b6:303:84::14) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB8250:EE_
X-MS-Office365-Filtering-Correlation-Id: ea92ee8a-d296-4e5b-91fe-08dc6f5fbc0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?sntgwpz1bbzia02zP3/92unLe2lq2MClQ16XknPw/P4xGtMHGHrcSsmEignE?=
 =?us-ascii?Q?E8JqKmTj0KLCbTAzjNOtB5hjLoqCBWD/bzpwozF5j0ENsIhKUFIvT6bhDSZS?=
 =?us-ascii?Q?xGMkgbNSuQmE7knt1KGLYEfU8B34TI64FEqu9R2v1VvXjJWnVF8fhbBvL9I4?=
 =?us-ascii?Q?WOoH3E2LIsuupM2mPFnOVQYGPYr+ZrPW1wbLx26nOAajFxj+cLZ5Uyi/ZpCA?=
 =?us-ascii?Q?o3XkNRgOvvLnrkhBr3PAQaDCtDbK2r7NBHCBDmO8fXbl7CKOoHKWlMtrwPrh?=
 =?us-ascii?Q?GQVv+NM+ZRjRa8SOPmIB5bpWOcnvgWH4w/7h48m9uAgp52jegtfvu3tes0Dr?=
 =?us-ascii?Q?Pt864sLTnrPQuhBf43fGAIJHj7lKt7AgMGMtypxeVqrnOxd47uwyAV/tKFBF?=
 =?us-ascii?Q?NxC7GGhvw3Z42nxCD5TlqP1nVnCNdn/CQ4T6kehUI1pDvSp1T3Ll2NakeVkF?=
 =?us-ascii?Q?KvREdLmqhgEBEQFljGwl9w+bgd+r6HvzReyvq9EQKbUfr9PoI82l57XN4Eyq?=
 =?us-ascii?Q?DwYwC469LGoIByYorxBZlvkaOgfKfsTFIO8tlGN+yABuWjMehi1vXi5G38Jf?=
 =?us-ascii?Q?Gxoqqp+IFS8xn5wcJ6q58QvybaqKiozY12XgSYhkXt7ix8GaRr8IIiw8ojig?=
 =?us-ascii?Q?aKT/s6bURy5oGtVe7t/3Y0eS05Izdjn4XkTucoxoE860pyfTfteQplEoyglS?=
 =?us-ascii?Q?3TVtXNfWEkasJ8IsWv+KO3DKHtm7KtXfJ68H9iRehNsiCGr1WqwPwQjbOVlh?=
 =?us-ascii?Q?Z2FYNVrAowt/HYVbInyN8TQZUlo1Y+aJWiHMCLEd1BoEGO2/Vq1HGBh6e5qW?=
 =?us-ascii?Q?1MhQDlhRmZTMVBc/4ej52wKTXpXZdYT6oAGd8PqB1NMkXYh/JTyL5YBzSdwL?=
 =?us-ascii?Q?V+CcR6P2PT/u0L3rIPgX6KSicH/lf9XXwrUoZlguEKOwmc2X/V9w/mY89I2m?=
 =?us-ascii?Q?HJxiW1dSeCnF5ESlRbqlY7FK9NZo6AOJ056/S1axXXJoi2OYmIwpxYH7KhWt?=
 =?us-ascii?Q?T12fcUPXuclaq3C6GpPCxXxV//LBtqOZIfM+85Ho8lWdWrTF0AfV3jCtYAf7?=
 =?us-ascii?Q?MGe9Yg4tr5cpfdEYtytLFYPQJuTaroQvefXfBs0pI+KjtxFDWMbYj8hxW8Uq?=
 =?us-ascii?Q?8ZT7FXxbqjnxOcmYd0tllPTHIf4f6CzwVsyjq2gSyDL8Ad+pqQQm1VPlm9H4?=
 =?us-ascii?Q?QpqYzjTS53GgYdgJDHpBSKAfNRM3f2ohgA90Q9AlLqscwC3NAkb/2M/XhdWa?=
 =?us-ascii?Q?nKLYl83mbFJHOvsdsINcJJLXw72lRBGqQ20mF9zU9A=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8fhzKUb0r6g8ToxtvEY6XmBppAYwYeKK0ktRwEP/asa3sQ+Rn4tiYjjYhuSp?=
 =?us-ascii?Q?2JdpRDtpFwE451oJEq5kn9ZcAH076igSG0QnHFQf1KHiUDpk6xQ0HD7Fp6gL?=
 =?us-ascii?Q?3IuEFav0GK/bgevBbIHHDVmsIu6QcBpE0Kmeqx2l8gqZxn4vUqu3RGX/4Hto?=
 =?us-ascii?Q?oSihe1GuHn5PTTpptJb9ZdL+kmMXY9p+k/l9pl6Lrdl3qz57T8UqiaUYGwSF?=
 =?us-ascii?Q?OBcLLTEQoeiAYv82pOnBTCs8uvA02VpbdkgaKDNaue9EVN8FDKJmR/u+XvrG?=
 =?us-ascii?Q?/0c89S/iuYAktK1Kl83LVYrojZN3JmYN3rAlx3pfK7mU3cxn/KShBe5c0wav?=
 =?us-ascii?Q?cayi+p56H0b6qVkTUykk42Q1G9VwlVOThCClyIQAwpqepno9hTXF+yWPNkgq?=
 =?us-ascii?Q?xJxplb0GlkB5xDB4XFR5kZkRE/gjRaKRx5s6oyUWdNaEX5GFMjtiN9wckGsM?=
 =?us-ascii?Q?yVRlAY0entWZXdeHNMVAmfu/Zs3wfumgWJmHEAr6skIIy4TE5lpV6xnGnZZ8?=
 =?us-ascii?Q?CWThGCqJ62aUH1+bfzg3p9QQkadX0+lJAaBAA9FjtgInl0WywCVehtZJf+2+?=
 =?us-ascii?Q?WdcPCi3k7WifFa8JBmNkWJa+3LrTAvGHOvw1NgJ3qYI0zCrqBE4cSHzC+c8R?=
 =?us-ascii?Q?ZAbA51Ig1mJVhfL5bV1dNdqxO79G0DZLPGJKK0lBostRQ8S3A93A/cKtQBwm?=
 =?us-ascii?Q?TajcaDloI7MMu7dDqR/RsOLTo370Yzax00b3UetT4hLEOMm8Hwi7mp4oe7Z5?=
 =?us-ascii?Q?HGbXUciWxuC7bG+3NYUxTD3zejKwOHUobXrx1kBUJm+MtjE/NoM5cFnGY3dU?=
 =?us-ascii?Q?v3DyACBGPgbhToNP2N0Rk/dtNKpPn+pxI2fGGivHc4lrf5LM093ZCYSDdbGG?=
 =?us-ascii?Q?gmm+zN2GN9/KPc39OA3wmDrBYcjx4nAV01Qy6jDN+AXUXgctuVyGmZPzbncO?=
 =?us-ascii?Q?bB0rlP5bNubINGman496o5+u2f67kySoPHOfD1DoTrwwbxWvF84xEC3bTBe4?=
 =?us-ascii?Q?Cc7sGJCuCEC8HZtd13eUsY7HTg5cvd3qCDnjGznjhDmwXcADM839ncJeObKM?=
 =?us-ascii?Q?i1mwiuFPJDGuNMNKoVcEbMGaPLMZOFQyxeEFDZKcnat9gjVyIGaYonNkvVaF?=
 =?us-ascii?Q?CMrXBWNMdslApesuU/MR3Dni39k6CmhbD83h9/0+Q0KqQB1lZw4bWTk9xe03?=
 =?us-ascii?Q?Y4MZ+GjR+0fxXCOlVHTEG6PJziZlCg1Yan6cjOywCXHA8cV/y2Jl0cEltVGp?=
 =?us-ascii?Q?5c3l5sJZ3sjewbvTOCd5S1sEXhgrKUjzlQfy5UukZL+89mU8ibEBz59vys06?=
 =?us-ascii?Q?ByHkfSX9GRRZ31sisGDKELbQRhbRLouQtYi4JQaGG1ALwdYzw0DEggnEhEMz?=
 =?us-ascii?Q?c7TojxS1GLR3f4t6DrjMJocwNFPCQBq9WoibxQllaAVzSB5gv+g6kWDjGEbe?=
 =?us-ascii?Q?6xjTzhcZcrrNUhR2aQssgd6dJL3B0MmF0V8WBIWjm9oICFj9rMdwhARkCW8A?=
 =?us-ascii?Q?q5y8/p2kZiHY1owg1xn5lp+04eKYG1joIs6KqadvL+JF2l0vx/4oOyJ+NY9R?=
 =?us-ascii?Q?18HPA4JVZFQgGUWqQSdfOWAp2w3ts/+c/gFhUDufkIg/Ufm+eSaPOTyzmQAh?=
 =?us-ascii?Q?Ag=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ea92ee8a-d296-4e5b-91fe-08dc6f5fbc0e
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2024 13:06:54.9631 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PGwtxtHUfyZbkoxVPVVf4092W7t0yEvoaEQq9V077LrIvQ2T6QNFao1vDOLpTFzFVSHDIxARzr8xFrzQC9yQrrRlzMLRIyi0HrL/zu15Us8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8250
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

On Mon, May 06, 2024 at 07:04:47PM GMT, Himal Prasad Ghimiray wrote:
>Remove the min/max configs and change minimum values of preemption and
>timeslice to 0. The sysman teams must deactivate preemption and
>timeslice to assess exclusivity mode. They depend on configuring
>timeslice_duration_us and preempt_timeout_us to 0, ensuring these
>values are set at their minimum.

nack for now, based on this explanation. See below.

>
>Cc: Matthew Brost <matthew.brost@intel.com>
>Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
>Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
>Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>---
> drivers/gpu/drm/xe/Kconfig.profile | 38 ------------------------------
> drivers/gpu/drm/xe/xe_hw_engine.h  | 28 ++--------------------
> 2 files changed, 2 insertions(+), 64 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/Kconfig.profile b/drivers/gpu/drm/xe/Kconfig.profile
>index ba17a25e8db3..9bf7adb45eea 100644
>--- a/drivers/gpu/drm/xe/Kconfig.profile
>+++ b/drivers/gpu/drm/xe/Kconfig.profile
>@@ -1,27 +1,3 @@
>-config DRM_XE_JOB_TIMEOUT_MAX
>-	int "Default max job timeout (ms)"
>-	default 10000 # milliseconds
>-	help
>-	  Configures the default max job timeout after which job will
>-	  be forcefully taken away from scheduler.
>-config DRM_XE_JOB_TIMEOUT_MIN
>-	int "Default min job timeout (ms)"
>-	default 1 # milliseconds
>-	help
>-	  Configures the default min job timeout after which job will
>-	  be forcefully taken away from scheduler.
>-config DRM_XE_TIMESLICE_MAX
>-	int "Default max timeslice duration (us)"
>-	default 10000000 # microseconds
>-	help
>-	  Configures the default max timeslice duration between multiple
>-	  contexts by guc scheduling.
>-config DRM_XE_TIMESLICE_MIN
>-	int "Default min timeslice duration (us)"
>-	default 1 # microseconds
>-	help
>-	  Configures the default min timeslice duration between multiple
>-	  contexts by guc scheduling.
> config DRM_XE_PREEMPT_TIMEOUT
> 	int "Preempt timeout (us, jiffy granularity)"
> 	default 640000 # microseconds
>@@ -30,20 +6,6 @@ config DRM_XE_PREEMPT_TIMEOUT
> 	  when submitting a new context. If the current context does not hit
> 	  an arbitration point and yield to HW before the timer expires, the
> 	  HW will be reset to allow the more important context to execute.
>-config DRM_XE_PREEMPT_TIMEOUT_MAX
>-	int "Default max preempt timeout (us)"
>-	default 10000000 # microseconds
>-	help
>-	  Configures the default max preempt timeout after which context
>-	  will be forcefully taken away and higher priority context will
>-	  run.
>-config DRM_XE_PREEMPT_TIMEOUT_MIN
>-	int "Default min preempt timeout (us)"
>-	default 1 # microseconds
>-	help
>-	  Configures the default min preempt timeout after which context
>-	  will be forcefully taken away and higher priority context will
>-	  run.
> config DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT
> 	bool "Default configuration of limitation on scheduler timeout"
> 	default y
>diff --git a/drivers/gpu/drm/xe/xe_hw_engine.h b/drivers/gpu/drm/xe/xe_hw_engine.h
>index 71968ee2f600..803555c601ec 100644
>--- a/drivers/gpu/drm/xe/xe_hw_engine.h
>+++ b/drivers/gpu/drm/xe/xe_hw_engine.h
>@@ -10,41 +10,17 @@
>
> struct drm_printer;
>
>-#ifdef CONFIG_DRM_XE_JOB_TIMEOUT_MIN
>-#define XE_HW_ENGINE_JOB_TIMEOUT_MIN CONFIG_DRM_XE_JOB_TIMEOUT_MIN
>-#else
> #define XE_HW_ENGINE_JOB_TIMEOUT_MIN 1
>-#endif
>-#ifdef CONFIG_DRM_XE_JOB_TIMEOUT_MAX
>-#define XE_HW_ENGINE_JOB_TIMEOUT_MAX CONFIG_DRM_XE_JOB_TIMEOUT_MAX
>-#else
> #define XE_HW_ENGINE_JOB_TIMEOUT_MAX (10 * 1000)

previously one could configure a kernel with a different max.
And now it's hardcoded. How is this better and related to the
motivation in the commit message?

is this commit doing 2 different things?

1) Removing the _MAX from config since nobody is or should change that
2) Modify the min value to 0... That seems weird as basically there is
    no minimum.

I'd like to hear Matt Brost's opinion on that.

Lucas De Marchi

>-#endif
>-#ifdef CONFIG_DRM_XE_TIMESLICE_MIN
>-#define XE_HW_ENGINE_TIMESLICE_MIN CONFIG_DRM_XE_TIMESLICE_MIN
>-#else
>-#define XE_HW_ENGINE_TIMESLICE_MIN 1
>-#endif
>-#ifdef CONFIG_DRM_XE_TIMESLICE_MAX
>-#define XE_HW_ENGINE_TIMESLICE_MAX CONFIG_DRM_XE_TIMESLICE_MAX
>-#else
>+#define XE_HW_ENGINE_TIMESLICE_MIN 0
> #define XE_HW_ENGINE_TIMESLICE_MAX (10 * 1000 * 1000)
>-#endif
> #ifdef CONFIG_DRM_XE_PREEMPT_TIMEOUT
> #define XE_HW_ENGINE_PREEMPT_TIMEOUT CONFIG_DRM_XE_PREEMPT_TIMEOUT
> #else
> #define XE_HW_ENGINE_PREEMPT_TIMEOUT (640 * 1000)
> #endif
>-#ifdef CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN
>-#define XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN
>-#else
>-#define XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN 1
>-#endif
>-#ifdef CONFIG_DRM_XE_PREEMPT_TIMEOUT_MAX
>-#define XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX CONFIG_DRM_XE_PREEMPT_TIMEOUT_MAX
>-#else
>+#define XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN 0
> #define XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX (10 * 1000 * 1000)
>-#endif
>
> int xe_hw_engines_init_early(struct xe_gt *gt);
> int xe_hw_engines_init(struct xe_gt *gt);
>-- 
>2.25.1
>
