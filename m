Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D888C27C79
	for <intel-xe@archiver.kernel.org>; Thu, 20 Jun 2024 19:21:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 200F110E2ED;
	Thu, 20 Jun 2024 19:21:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g64bqlyU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E279910E2B5
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Jun 2024 19:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718911299; x=1750447299;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=NQ+pFPCqsaT+KC7Sl4pcu3dv/uraCw1bEpCmYwWUcow=;
 b=g64bqlyU47IyJW6UY8cktBWhT1J8XSjATx9SGe3Tq3s7sZjFGoKpOzf2
 NvUyuBDJpt2pJE9n2oeE2Yo8XSMYMiAoKAfmbERMS1Or2GvzvdhNzYi/T
 BgwpYq8Ur3wcawRusd/4u0/yigBJSYecMht4xvABG6qFL9xmVo2vwxHzg
 pKFa4oePRHWMfDoyU3V3xRco4uZf0wLgXqlPgMNvvxQZaPTBErNtMdtpE
 UAIB++V2QcsQ2d++ia/y9EVj1JpYGqUeSDhmllMi5WjUgmYw6bhrygBoT
 CZhIZLuuIspTG8jdBGyq0Yaekqm1Fm5LoxW+cjYxCUoL5C3OsARr0CJ63 Q==;
X-CSE-ConnectionGUID: ImHB6o7yTVacV4V8+5fkmw==
X-CSE-MsgGUID: cFNjldJHSt2V7uRkHPmhDQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11109"; a="19697648"
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; d="scan'208";a="19697648"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2024 12:21:39 -0700
X-CSE-ConnectionGUID: jj65tjOgSlqFYgA/JNVJyA==
X-CSE-MsgGUID: nrwRyjUYSW6AvG60Dr7Zmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; d="scan'208";a="47534527"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Jun 2024 12:21:39 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 20 Jun 2024 12:21:38 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 20 Jun 2024 12:21:37 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 20 Jun 2024 12:21:37 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 20 Jun 2024 12:21:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jtuGYOjr2HbS4Py/3W5r23U8MWzRFpOKMjj62FNjephgfQ9kTfhaqNY2krIWGyGssiFvSxyVIXbkMqJb0Fs0t1L/YQemu+4jLmEa5ibBhmyiVWtN6PHqQ9/SNvgv6aVfieH/pF7g3SyFJUli6cIOzWHDCTtCa0Qgs1kG7i0qVgoFQgxv/o1ksRdl/srAdcMeac/HM+M2apHrn8/1bDl3Gl6i/R6DUl1eXR3NuaAXKdNlNv3nlnx5B9idcEhtOl+9rMggN96rtIO/AgcIGsXyosV0idvLtGKTdhV5i8h9CYgNEyZwRcLsk75Z/uck2pal4qv4w7CgEtmQzz+jfSkzuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9QMCx5PWdFX7vMyIlTo95iGho61/f0tXGxgq0ewzUgM=;
 b=NtfGvRBJjansvayZHzDMI+vhtg27DRgFpxu8fqTnqdHP39onAXeBLBCgh4/REZ/+8JkepJ+Cy/BnIX1e2AmTduyJGxVmpNv/RiNcBwwmQGQh3cYZcRvHMX0WcLRSBJKb4kUmA7gqLEH8hPm+lO/1H6V/56ojOORXc88vZp8uyooDf3+63RgiWF4NcM5ThOyYj7itX0Cvh+azsw0WqfMhzgXfv9ZrrUKIXa61qYFWLfCo76+LPXwrTv2aArYO7k1BNocvxHFbn/Jbb3XsvuOZbnvfZS0pkIHd2ycLGKcWnP8eyeE3Uawb1nZuqYZdqElqKbvarjj3gZ0c+SAE/090Tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ0PR11MB4944.namprd11.prod.outlook.com (2603:10b6:a03:2ae::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.21; Thu, 20 Jun
 2024 19:21:35 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.7677.033; Thu, 20 Jun 2024
 19:21:35 +0000
Date: Thu, 20 Jun 2024 19:20:58 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v4 4/7] drm/xe: Convert multiple bind ops into single job
Message-ID: <ZnSBGipsVqEW7Mkd@DUT025-TGLU.fm.intel.com>
References: <20240618171509.3336601-1-matthew.brost@intel.com>
 <20240618171509.3336601-5-matthew.brost@intel.com>
 <032aaef0-cc2a-4034-8e5b-7fc17532fb41@intel.com>
 <ZnR6YfLkJRFUWAgc@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZnR6YfLkJRFUWAgc@DUT025-TGLU.fm.intel.com>
X-ClientProxiedBy: BYAPR03CA0023.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::36) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ0PR11MB4944:EE_
X-MS-Office365-Filtering-Correlation-Id: f7b8bd9a-413f-477d-94f5-08dc915e3310
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|376011|366013|1800799021;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?QB5Ty03FYSVWaBEv6RewMqED/1u1YXHpRLnBnnKArcuoQaQw/3o4xGGHE2?=
 =?iso-8859-1?Q?chhOtbjEl/jr1amJXRS/+h2doujqcDrlocK3D22ecCeGPZtX3926eflbds?=
 =?iso-8859-1?Q?boHycDuRJYCNUCN3vNot4GEZG3V3FKDyQL1D2ZXEWbwYQoeugfGXQldUSC?=
 =?iso-8859-1?Q?yqAB4D7GkTEKJcEfXA8dIwsq+dIAD9iPJN+5SKqtIRjlEpaJbsqID1YB0h?=
 =?iso-8859-1?Q?JNIQXdFQhVPzxmz2t/Ga7pkAkgCJmJZRx+9P7ZfrHfXmCxs5IvXlZPS2td?=
 =?iso-8859-1?Q?EE2fqyd9QwH2+MXtABOvSwxH2OQkXdzbRYbyMkRDttsoYo8WXLrhH4zT51?=
 =?iso-8859-1?Q?Oeb2eRbXjjOyzUZg2qiTKl01SdT3x3EjRuzarpHBiJHn40NYBo8IJc8cQH?=
 =?iso-8859-1?Q?qnufyQKz5Zmyv6Ra0m68YW+8eBhiehd95ZKBRDNb6BpeUn+AQNnfN1x4D1?=
 =?iso-8859-1?Q?pw7kY0VOJNcPPuNljsu38/TclJAYTYoH7dxP4HK6gEuLYFrK6oDd1QT8qL?=
 =?iso-8859-1?Q?ywHvy5JCDH7IMJIBUxlT5nyNCcA2JzYDfbXkE7wiFurY3BpKZj2M0vij3t?=
 =?iso-8859-1?Q?qtHooqK0cUj9iiTPS9uomAHAlgZIft60lZH+hb4K53lPyYW6a1HQuBUWQP?=
 =?iso-8859-1?Q?6Js1TcPSERTWhe5A5rMZVHZtxrYy0XZaqUK10KdjbcJQUR7Oftx2ywFG9R?=
 =?iso-8859-1?Q?tiOSyGcq9c8S4YUexaW+LKzYYPR/SMB/p1ZN0Xj5oR72NK0Ij9W9SUj/7c?=
 =?iso-8859-1?Q?axrwQz7da/Xi4QyeDrQGcdxYaKo+8ib3ltZWL+FQTnrcDoLIqpk91TgifS?=
 =?iso-8859-1?Q?MxVlXOBaXJH2B5C/9IDSJFA1bYqJhmlWhq1CD9oOdVp+oPJM72eyQKn+5d?=
 =?iso-8859-1?Q?AJjLBcTvzWl5dv34xGBTDUWnjM/psaLfOX/EE6c9lI4njuuZGgHuqPhAdU?=
 =?iso-8859-1?Q?0gkv/sFYfMpDqh/MkLcnzGxuOC5z60f+tYvXC4nkJELcBhfYmqw4vpO0nN?=
 =?iso-8859-1?Q?b/BzZkiivnbTrZLGbjsxlJN0wmGafzN+XNcYBpl+cO0LA8CF+IvS2yyS2R?=
 =?iso-8859-1?Q?RPHfuCqm3Se9d/1JhxaoVWAhNAcdQ9GSlyPVvsHMP1Vc3kUbwfm3AXpJyZ?=
 =?iso-8859-1?Q?PqIETovgiafS9XV0UMoxttiWzdjAnmKc2qAuuY33o9xL9UBrLqJD7odpqA?=
 =?iso-8859-1?Q?xbitQ2tRP5tKDlrr3mbi1r0nhhW777uHEGEycRmG4ipER+9C3G4xMAlbJm?=
 =?iso-8859-1?Q?+CqGmHbA3oz4FPiPHzdQiEbtR7dy45G2BKE3BC6Tb4EzQavqM8bapx2MeC?=
 =?iso-8859-1?Q?tS/m?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(376011)(366013)(1800799021); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?/94zZUhbtf3FiKzYiDJzuiCPsGg0fpAQ2ojzSTnHybULPmP2zal4v1Cy0p?=
 =?iso-8859-1?Q?QkSE9ksqsW9rJFZWaOGwNfIoAX3RwExxnq/lez65Fk5lge9pEPJUFP6keB?=
 =?iso-8859-1?Q?Rrq9cl1FaO2bzBVp27v7HTGXhVc4682waEDeiwMnEnJLZngU36eNBkkTWQ?=
 =?iso-8859-1?Q?0nzNuAFZYCm0bIfqGpp8Gfac52skCByFA7dZ7nIygCNAUIj09fW7Up4TCu?=
 =?iso-8859-1?Q?RCbE8WRNu7cMNiSb/EDp7elBRybtBmmgHbuxbvon/EU1ePl5c1AITpJTmj?=
 =?iso-8859-1?Q?sfm1aES0HbYzEUZ9Kn3wZCouv/dKosEJmfgIF3W1jXpJY8xohbihpbjj4Z?=
 =?iso-8859-1?Q?pjZPFNS9TFFZW85hJoWn3h7vk9ivgPL9zUYCHUstHmw0SDl5L96f9H/fTF?=
 =?iso-8859-1?Q?jF5RNefDud2eySjlouv1Niilh4FNMvwrKBtxAeX6g5HVaTxMBEvb6SiZeR?=
 =?iso-8859-1?Q?lq0fMPFiuRrE1k6tE4bC5FG8J2duWFMLDnHncOOUwlPQZ3RL/XGaOWumUo?=
 =?iso-8859-1?Q?uAeKEI+zRdY4crC+vOZh+Zy2S/aPKSk/Nj8v3Cb7MtzGfGZMiqpfG6UpfD?=
 =?iso-8859-1?Q?naJ6UtNFaZj9rC9YC0vgbNAxbS4WXujZ4BK/A1v5xn1m1eRzsXz5FZZY9D?=
 =?iso-8859-1?Q?08USu7TPUlS7DgNJxO6nJ8H3R2TEbtPEEU1tROmh7/lbkQQ3yFGxcCa0S2?=
 =?iso-8859-1?Q?VLjF7MISG2DQwReLxfdMB09t/qGaBr3QeLrJzrW2In/wwihNEubxF+4ABn?=
 =?iso-8859-1?Q?Vkcr3VPEkj+Lt8aECm49gw1J/817ILQpRk2Hhl/4HUK+H8uebX37yEODYj?=
 =?iso-8859-1?Q?YTKTEnMS9q7rNBoUBP4k2Q/Ir9ZXXUEEXpyIbCbEVKIOLw+bIyNymvKa9J?=
 =?iso-8859-1?Q?tC35WATQklDRJKvvuGxC/XbloTrIy4V05c4bEYGRnQWZZITrphxprplp1e?=
 =?iso-8859-1?Q?itXYuXUDprOcquU38+q+hgpnr2ckoLCTrJbMdQTTNNicCMFHHKg0qq2EMA?=
 =?iso-8859-1?Q?+JJNSrsBORnf77WdG9QOVaACKGaM2/Cw79RY8I/XmmTEG20/HoupJX9WUZ?=
 =?iso-8859-1?Q?a14GLFYc8DN+LjkWOKzgwSq/tIHoghs1SDcRwLYRY6E5YytcHhMsmmB0uR?=
 =?iso-8859-1?Q?WXH9aq1EJah2ZQ8+yN+BOR8+qG+qKe8cuoBVtvA67XsDyB06752NFJNMCf?=
 =?iso-8859-1?Q?f16rW9ozpS0TYsemVBIe8Je7ZxiwU5ZZfUYRV89XKT8R4hNA+lPbeYnzly?=
 =?iso-8859-1?Q?Kk4+ilwXnD1oBkBWLRIv62ogZU79TdHdlNnXiGFpH0MCoMH2EPRRR3MQnP?=
 =?iso-8859-1?Q?KwZ+38bAUVqN0OorTOryrWI5RtAPKeqUgYVAgeUAxhIL38sYeXMnLR1zFQ?=
 =?iso-8859-1?Q?QIcePkvs8LJrSHHeTuSAaTWvFZT+xjXru7T0SXdC0VcFAoeKvYfljby4sW?=
 =?iso-8859-1?Q?+2jBxtV8zBSL9OcfZlBthtl9fs6Vc1pqWNGxJ+dZAljPRElv1riIcfzVB3?=
 =?iso-8859-1?Q?kyUkPmnvmdNoP0crhOpiwtJgh7yaXv/+PK50PuhAliCj1KfN9hvwkY0x++?=
 =?iso-8859-1?Q?oZjs7Aw2wWI7kNIIzVEbmI4aMxPFew+Q8WtrOkEGNRvxjr6xHmplxaWOdB?=
 =?iso-8859-1?Q?x8kt9u1xlJzykL1Gv5ZhNm+qYZEfYxj/XLS48RUz0yaxMeoLlzuJnAlg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f7b8bd9a-413f-477d-94f5-08dc915e3310
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2024 19:21:35.0994 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dc3GPvybXvX6WcUFYeDiKPM9aziUtClHjVIwZjfAHFkrptlhHqtzjsHek8E1vbqqx+Ac2UmSO8cg/KqRJ4EDLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4944
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

On Thu, Jun 20, 2024 at 06:52:17PM +0000, Matthew Brost wrote:
> On Thu, Jun 20, 2024 at 06:15:54PM +0100, Matthew Auld wrote:
> > Hi,
> > 
> > On 18/06/2024 18:15, Matthew Brost wrote:
> > > This aligns with the uAPI of an array of binds or single bind that
> > > results in multiple GPUVA ops to be considered a single atomic
> > > operations.
> > > 
> > > The implemenation is roughly:
> > > - xe_vma_ops is a list of xe_vma_op (GPUVA op)
> > > - each xe_vma_op resolves to 0-3 PT ops
> > > - xe_vma_ops creates a single job
> > > - if at any point during binding a failure occurs, xe_vma_ops contains
> > >    the information necessary unwind the PT and VMA (GPUVA) state
> > > 
> > > v2:
> > >   - add missing dma-resv slot reservation (CI, testing)
> > > v4:
> > >   - Fix TLB invalidation (Paulo)
> > >   - Add missing xe_sched_job_last_fence_add/test_dep check (Inspection)
> > > 
> > > Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > ---
> > >   drivers/gpu/drm/xe/xe_bo_types.h |    2 +
> > >   drivers/gpu/drm/xe/xe_migrate.c  |  296 ++++----
> > >   drivers/gpu/drm/xe/xe_migrate.h  |   32 +-
> > >   drivers/gpu/drm/xe/xe_pt.c       | 1112 +++++++++++++++++++-----------
> > >   drivers/gpu/drm/xe/xe_pt.h       |   14 +-
> > >   drivers/gpu/drm/xe/xe_pt_types.h |   36 +
> > >   drivers/gpu/drm/xe/xe_vm.c       |  519 +++-----------
> > >   drivers/gpu/drm/xe/xe_vm.h       |    2 +
> > >   drivers/gpu/drm/xe/xe_vm_types.h |   45 +-
> > >   9 files changed, 1035 insertions(+), 1023 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
> > > index 86422e113d39..02d68873558a 100644
> > > --- a/drivers/gpu/drm/xe/xe_bo_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_bo_types.h
> > > @@ -58,6 +58,8 @@ struct xe_bo {
> > >   #endif
> > >   	/** @freed: List node for delayed put. */
> > >   	struct llist_node freed;
> > > +	/** @update_index: Update index if PT BO */
> > > +	int update_index;
> > >   	/** @created: Whether the bo has passed initial creation */
> > >   	bool created;
> > > diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> > > index af62783d34ac..a1acd7d01243 100644
> > > --- a/drivers/gpu/drm/xe/xe_migrate.c
> > > +++ b/drivers/gpu/drm/xe/xe_migrate.c
> > > @@ -1125,6 +1125,7 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
> > >   }
> > >   static void write_pgtable(struct xe_tile *tile, struct xe_bb *bb, u64 ppgtt_ofs,
> > > +			  const struct xe_vm_pgtable_update_op *pt_op,
> > >   			  const struct xe_vm_pgtable_update *update,
> > >   			  struct xe_migrate_pt_update *pt_update)
> > >   {
> > > @@ -1159,8 +1160,12 @@ static void write_pgtable(struct xe_tile *tile, struct xe_bb *bb, u64 ppgtt_ofs,
> > >   		bb->cs[bb->len++] = MI_STORE_DATA_IMM | MI_SDI_NUM_QW(chunk);
> > >   		bb->cs[bb->len++] = lower_32_bits(addr);
> > >   		bb->cs[bb->len++] = upper_32_bits(addr);
> > > -		ops->populate(pt_update, tile, NULL, bb->cs + bb->len, ofs, chunk,
> > > -			      update);
> > > +		if (pt_op->bind)
> > > +			ops->populate(pt_update, tile, NULL, bb->cs + bb->len,
> > > +				      ofs, chunk, update);
> > > +		else
> > > +			ops->clear(pt_update, tile, NULL, bb->cs + bb->len,
> > > +				   ofs, chunk, update);
> > >   		bb->len += chunk * 2;
> > >   		ofs += chunk;
> > > @@ -1185,114 +1190,58 @@ struct migrate_test_params {
> > >   static struct dma_fence *
> > >   xe_migrate_update_pgtables_cpu(struct xe_migrate *m,
> > > -			       struct xe_vm *vm, struct xe_bo *bo,
> > > -			       const struct  xe_vm_pgtable_update *updates,
> > > -			       u32 num_updates, bool wait_vm,
> > >   			       struct xe_migrate_pt_update *pt_update)
> > >   {
> > >   	XE_TEST_DECLARE(struct migrate_test_params *test =
> > >   			to_migrate_test_params
> > >   			(xe_cur_kunit_priv(XE_TEST_LIVE_MIGRATE));)
> > >   	const struct xe_migrate_pt_update_ops *ops = pt_update->ops;
> > > -	struct dma_fence *fence;
> > > +	struct xe_vm *vm = pt_update->vops->vm;
> > > +	struct xe_vm_pgtable_update_ops *pt_update_ops =
> > > +		&pt_update->vops->pt_update_ops[pt_update->tile_id];
> > >   	int err;
> > > -	u32 i;
> > > +	u32 j, i;
> > 
> > ...
> > 
> > >   	if (XE_TEST_ONLY(test && test->force_gpu))
> > >   		return ERR_PTR(-ETIME);
> > > -	if (bo && !dma_resv_test_signaled(bo->ttm.base.resv,
> > > -					  DMA_RESV_USAGE_KERNEL))
> > > -		return ERR_PTR(-ETIME);
> > > -
> > > -	if (wait_vm && !dma_resv_test_signaled(xe_vm_resv(vm),
> > > -					       DMA_RESV_USAGE_BOOKKEEP))
> > > -		return ERR_PTR(-ETIME);
> > > -
> > >   	if (ops->pre_commit) {
> > >   		pt_update->job = NULL;
> > >   		err = ops->pre_commit(pt_update);
> > >   		if (err)
> > >   			return ERR_PTR(err);
> > >   	}
> > > -	for (i = 0; i < num_updates; i++) {
> > > -		const struct xe_vm_pgtable_update *update = &updates[i];
> > > -
> > > -		ops->populate(pt_update, m->tile, &update->pt_bo->vmap, NULL,
> > > -			      update->ofs, update->qwords, update);
> > > -	}
> > > -
> > > -	if (vm) {
> > > -		trace_xe_vm_cpu_bind(vm);
> > > -		xe_device_wmb(vm->xe);
> > > -	}
> > > -
> > > -	fence = dma_fence_get_stub();
> > > -
> > > -	return fence;
> > > -}
> > > -
> > > -static bool no_in_syncs(struct xe_vm *vm, struct xe_exec_queue *q,
> > > -			struct xe_sync_entry *syncs, u32 num_syncs)
> > > -{
> > > -	struct dma_fence *fence;
> > > -	int i;
> > > -	for (i = 0; i < num_syncs; i++) {
> > > -		fence = syncs[i].fence;
> > > -
> > > -		if (fence && !test_bit(DMA_FENCE_FLAG_SIGNALED_BIT,
> > > -				       &fence->flags))
> > > -			return false;
> > > -	}
> > > -	if (q) {
> > > -		fence = xe_exec_queue_last_fence_get(q, vm);
> > > -		if (!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags)) {
> > > -			dma_fence_put(fence);
> > > -			return false;
> > > +	for (j = 0; j < pt_update_ops->num_ops; ++j) {
> > > +		const struct xe_vm_pgtable_update_op *pt_op =
> > > +			&pt_update_ops->ops[j];
> > > +
> > > +		for (i = 0; i < pt_op->num_entries; i++) {
> > 
> > ...inverting i and j here?
> > 
> 
> Let me switch that.
> 
> > > +			const struct xe_vm_pgtable_update *update =
> > > +				&pt_op->entries[i];
> > > +
> > > +			if (pt_op->bind)
> > > +				ops->populate(pt_update, m->tile,
> > > +					      &update->pt_bo->vmap, NULL,
> > > +					      update->ofs, update->qwords,
> > > +					      update);
> > > +			else
> > > +				ops->clear(pt_update, m->tile,
> > > +					   &update->pt_bo->vmap, NULL,
> > > +					   update->ofs, update->qwords, update);
> > >   		}
> > > -		dma_fence_put(fence);
> > >   	}
> > > -	return true;
> > > +	trace_xe_vm_cpu_bind(vm);
> > > +	xe_device_wmb(vm->xe);
> > > +
> > > +	return dma_fence_get_stub();
> > >   }
> > > -/**
> > > - * xe_migrate_update_pgtables() - Pipelined page-table update
> > > - * @m: The migrate context.
> > > - * @vm: The vm we'll be updating.
> > > - * @bo: The bo whose dma-resv we will await before updating, or NULL if userptr.
> > > - * @q: The exec queue to be used for the update or NULL if the default
> > > - * migration engine is to be used.
> > > - * @updates: An array of update descriptors.
> > > - * @num_updates: Number of descriptors in @updates.
> > > - * @syncs: Array of xe_sync_entry to await before updating. Note that waits
> > > - * will block the engine timeline.
> > > - * @num_syncs: Number of entries in @syncs.
> > > - * @pt_update: Pointer to a struct xe_migrate_pt_update, which contains
> > > - * pointers to callback functions and, if subclassed, private arguments to
> > > - * those.
> > > - *
> > > - * Perform a pipelined page-table update. The update descriptors are typically
> > > - * built under the same lock critical section as a call to this function. If
> > > - * using the default engine for the updates, they will be performed in the
> > > - * order they grab the job_mutex. If different engines are used, external
> > > - * synchronization is needed for overlapping updates to maintain page-table
> > > - * consistency. Note that the meaing of "overlapping" is that the updates
> > > - * touch the same page-table, which might be a higher-level page-directory.
> > > - * If no pipelining is needed, then updates may be performed by the cpu.
> > > - *
> > > - * Return: A dma_fence that, when signaled, indicates the update completion.
> > > - */
> > > -struct dma_fence *
> > > -xe_migrate_update_pgtables(struct xe_migrate *m,
> > > -			   struct xe_vm *vm,
> > > -			   struct xe_bo *bo,
> > > -			   struct xe_exec_queue *q,
> > > -			   const struct xe_vm_pgtable_update *updates,
> > > -			   u32 num_updates,
> > > -			   struct xe_sync_entry *syncs, u32 num_syncs,
> > > -			   struct xe_migrate_pt_update *pt_update)
> > > +static struct dma_fence *
> > > +__xe_migrate_update_pgtables(struct xe_migrate *m,
> > > +			     struct xe_migrate_pt_update *pt_update,
> > > +			     struct xe_vm_pgtable_update_ops *pt_update_ops)
> > >   {
> > >   	const struct xe_migrate_pt_update_ops *ops = pt_update->ops;
> > >   	struct xe_tile *tile = m->tile;
> > > @@ -1301,59 +1250,45 @@ xe_migrate_update_pgtables(struct xe_migrate *m,
> > >   	struct xe_sched_job *job;
> > >   	struct dma_fence *fence;
> > >   	struct drm_suballoc *sa_bo = NULL;
> > > -	struct xe_vma *vma = pt_update->vma;
> > >   	struct xe_bb *bb;
> > > -	u32 i, batch_size, ppgtt_ofs, update_idx, page_ofs = 0;
> > > +	u32 i, j, batch_size = 0, ppgtt_ofs, update_idx, page_ofs = 0;
> > > +	u32 num_updates = 0, current_update = 0;
> > >   	u64 addr;
> > >   	int err = 0;
> > > -	bool usm = !q && xe->info.has_usm;
> > > -	bool first_munmap_rebind = vma &&
> > > -		vma->gpuva.flags & XE_VMA_FIRST_REBIND;
> > > -	struct xe_exec_queue *q_override = !q ? m->q : q;
> > > -	u16 pat_index = xe->pat.idx[XE_CACHE_WB];
> > > +	bool is_migrate = pt_update_ops->q == m->q;
> > > +	bool usm = is_migrate && xe->info.has_usm;
> > > -	/* Use the CPU if no in syncs and engine is idle */
> > > -	if (no_in_syncs(vm, q, syncs, num_syncs) && xe_exec_queue_is_idle(q_override)) {
> > > -		fence =  xe_migrate_update_pgtables_cpu(m, vm, bo, updates,
> > > -							num_updates,
> > > -							first_munmap_rebind,
> > > -							pt_update);
> > > -		if (!IS_ERR(fence) || fence == ERR_PTR(-EAGAIN))
> > > -			return fence;
> > > +	for (i = 0; i < pt_update_ops->num_ops; ++i) {
> > > +		struct xe_vm_pgtable_update_op *pt_op = &pt_update_ops->ops[i];
> > > +		struct xe_vm_pgtable_update *updates = pt_op->entries;
> > > +
> > > +		num_updates += pt_op->num_entries;
> > > +		for (j = 0; j < pt_op->num_entries; ++j) {
> > > +			u32 num_cmds = DIV_ROUND_UP(updates[j].qwords, 0x1ff);
> > > +
> > > +			/* align noop + MI_STORE_DATA_IMM cmd prefix */
> > > +			batch_size += 4 * num_cmds + updates[j].qwords * 2;
> > > +		}
> > >   	}
> > >   	/* fixed + PTE entries */
> > >   	if (IS_DGFX(xe))
> > > -		batch_size = 2;
> > > +		batch_size += 2;
> > >   	else
> > > -		batch_size = 6 + num_updates * 2;
> > > +		batch_size += 6 + num_updates * 2;
> > > -	for (i = 0; i < num_updates; i++) {
> > > -		u32 num_cmds = DIV_ROUND_UP(updates[i].qwords, MAX_PTE_PER_SDI);
> > > -
> > > -		/* align noop + MI_STORE_DATA_IMM cmd prefix */
> > > -		batch_size += 4 * num_cmds + updates[i].qwords * 2;
> > > -	}
> > > -
> > > -	/*
> > > -	 * XXX: Create temp bo to copy from, if batch_size becomes too big?
> > > -	 *
> > > -	 * Worst case: Sum(2 * (each lower level page size) + (top level page size))
> > > -	 * Should be reasonably bound..
> > > -	 */
> > > -	xe_tile_assert(tile, batch_size < SZ_128K);
> > 
> > Why do we drop this assert? I guess the batch size is potentially now much
> > larger, since we combine more stuff into single job? The pool is fixed size
> > and only 512K on igpu. Can userspace not hit the limit of that? It looks
> > like this would also trigger a warning in drm_suballoc_new():
> > 
> > 	if (WARN_ON_ONCE(size > sa_manager->size || !size))
> > 		return ERR_PTR(-EINVAL);
> > 
> > Do we need some more checking somewhere? Also maybe bump the pool size?
> > 
> 
> Yes, this is an issue which VK has hit in debug [1]. I think dropping
> the assert is correct as a user shouldn't be able to make an assert pop.
> We likely need to catch drm_suballoc_new error and convert it to an
> error code which user space interrupts as split the array of binds into
> a series bind IOCTLs with a single bind per IOCTL. Thomas and I had
> discussed the VM bind error codes a while back and one of returned error
> codes has this meaning. The error code lot work still needs to be done
> and was going to be staged as a follow up to this series. I will at
> least include the correct error code for this in the next rev of the
> series. 
> 
> Longterm this should be a non-issue as we should switch to CPU bind
> even if a job is used to complete the bind [2]. CPU binds have the
> benefit of lower latency vs scheduling a GPU job, fixing this potential
> issuei without involving user space, and GPU bind jobs not getting
> scheduled behind other GPU jobs on the copy engine.
> 
> [1] https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/799
> [2] https://patchwork.freedesktop.org/patch/582003/?series=125608&rev=5
> 

Additional I'll take an AR to write an IGT which triggers the error code
path of an arry of binds requiring a BB to larger to complete the bind.
This will be included in the post next post.

Matt 

> > > -
> > > -	bb = xe_bb_new(gt, batch_size, !q && xe->info.has_usm);
> > > +	bb = xe_bb_new(gt, batch_size, usm);
> > >   	if (IS_ERR(bb))
> > >   		return ERR_CAST(bb);
> > >   	/* For sysmem PTE's, need to map them in our hole.. */
> > >   	if (!IS_DGFX(xe)) {
> > >   		ppgtt_ofs = NUM_KERNEL_PDE - 1;
> > > -		if (q) {
> > > -			xe_tile_assert(tile, num_updates <= NUM_VMUSA_WRITES_PER_UNIT);
> > > +		if (!is_migrate) {
> > > +			u32 num_units = DIV_ROUND_UP(num_updates,
> > > +						     NUM_VMUSA_WRITES_PER_UNIT);
> > > -			sa_bo = drm_suballoc_new(&m->vm_update_sa, 1,
> > > +			sa_bo = drm_suballoc_new(&m->vm_update_sa, num_units,
> > >   						 GFP_KERNEL, true, 0);
> > >   			if (IS_ERR(sa_bo)) {
> > >   				err = PTR_ERR(sa_bo);
> > > @@ -1373,14 +1308,26 @@ xe_migrate_update_pgtables(struct xe_migrate *m,
> > >   		bb->cs[bb->len++] = ppgtt_ofs * XE_PAGE_SIZE + page_ofs;
> > >   		bb->cs[bb->len++] = 0; /* upper_32_bits */
> > > -		for (i = 0; i < num_updates; i++) {
> > > -			struct xe_bo *pt_bo = updates[i].pt_bo;
> > > +		for (i = 0; i < pt_update_ops->num_ops; ++i) {
> > > +			struct xe_vm_pgtable_update_op *pt_op =
> > > +				&pt_update_ops->ops[i];
> > > +			struct xe_vm_pgtable_update *updates = pt_op->entries;
> > > -			xe_tile_assert(tile, pt_bo->size == SZ_4K);
> > > +			for (j = 0; j < pt_op->num_entries; ++j, ++current_update) {
> > > +				struct xe_vm *vm = pt_update->vops->vm;
> > > +				struct xe_bo *pt_bo = updates[j].pt_bo;
> > > -			addr = vm->pt_ops->pte_encode_bo(pt_bo, 0, pat_index, 0);
> > > -			bb->cs[bb->len++] = lower_32_bits(addr);
> > > -			bb->cs[bb->len++] = upper_32_bits(addr);
> > > +				xe_tile_assert(tile, pt_bo->size == SZ_4K);
> > > +
> > > +				/* Map a PT at most once */
> > > +				if (pt_bo->update_index < 0)
> > > +					pt_bo->update_index = current_update;
> > > +
> > > +				addr = vm->pt_ops->pte_encode_bo(pt_bo, 0,
> > > +								 XE_CACHE_WB, 0);
> > > +				bb->cs[bb->len++] = lower_32_bits(addr);
> > > +				bb->cs[bb->len++] = upper_32_bits(addr);
> > > +			}
> > >   		}
> > >   		bb->cs[bb->len++] = MI_BATCH_BUFFER_END;
> > > @@ -1388,19 +1335,36 @@ xe_migrate_update_pgtables(struct xe_migrate *m,
> > >   		addr = xe_migrate_vm_addr(ppgtt_ofs, 0) +
> > >   			(page_ofs / sizeof(u64)) * XE_PAGE_SIZE;
> > > -		for (i = 0; i < num_updates; i++)
> > > -			write_pgtable(tile, bb, addr + i * XE_PAGE_SIZE,
> > > -				      &updates[i], pt_update);
> > > +		for (i = 0; i < pt_update_ops->num_ops; ++i) {
> > > +			struct xe_vm_pgtable_update_op *pt_op =
> > > +				&pt_update_ops->ops[i];
> > > +			struct xe_vm_pgtable_update *updates = pt_op->entries;
> > > +
> > > +			for (j = 0; j < pt_op->num_entries; ++j) {
> > > +				struct xe_bo *pt_bo = updates[j].pt_bo;
> > > +
> > > +				write_pgtable(tile, bb, addr +
> > > +					      pt_bo->update_index * XE_PAGE_SIZE,
> > > +					      pt_op, &updates[j], pt_update);
> > > +			}
> > > +		}
> > >   	} else {
> > >   		/* phys pages, no preamble required */
> > >   		bb->cs[bb->len++] = MI_BATCH_BUFFER_END;
> > >   		update_idx = bb->len;
> > > -		for (i = 0; i < num_updates; i++)
> > > -			write_pgtable(tile, bb, 0, &updates[i], pt_update);
> > > +		for (i = 0; i < pt_update_ops->num_ops; ++i) {
> > > +			struct xe_vm_pgtable_update_op *pt_op =
> > > +				&pt_update_ops->ops[i];
> > > +			struct xe_vm_pgtable_update *updates = pt_op->entries;
> > > +
> > > +			for (j = 0; j < pt_op->num_entries; ++j)
> > > +				write_pgtable(tile, bb, 0, pt_op, &updates[j],
> > > +					      pt_update);
> > > +		}
> > >   	}
> > > -	job = xe_bb_create_migration_job(q ?: m->q, bb,
> > > +	job = xe_bb_create_migration_job(pt_update_ops->q, bb,
> > >   					 xe_migrate_batch_base(m, usm),
> > >   					 update_idx);
> > >   	if (IS_ERR(job)) {
> > > @@ -1408,46 +1372,20 @@ xe_migrate_update_pgtables(struct xe_migrate *m,
> > >   		goto err_bb;
> > >   	}
> > > -	/* Wait on BO move */
> > > -	if (bo) {
> > > -		err = xe_sched_job_add_deps(job, bo->ttm.base.resv,
> > > -					    DMA_RESV_USAGE_KERNEL);
> > > -		if (err)
> > > -			goto err_job;
> > > -	}
> > > -
> > > -	/*
> > > -	 * Munmap style VM unbind, need to wait for all jobs to be complete /
> > > -	 * trigger preempts before moving forward
> > > -	 */
> > > -	if (first_munmap_rebind) {
> > > -		err = xe_sched_job_add_deps(job, xe_vm_resv(vm),
> > > -					    DMA_RESV_USAGE_BOOKKEEP);
> > > -		if (err)
> > > -			goto err_job;
> > > -	}
> > > -
> > > -	err = xe_sched_job_last_fence_add_dep(job, vm);
> > > -	for (i = 0; !err && i < num_syncs; i++)
> > > -		err = xe_sync_entry_add_deps(&syncs[i], job);
> > > -
> > > -	if (err)
> > > -		goto err_job;
> > > -
> > >   	if (ops->pre_commit) {
> > >   		pt_update->job = job;
> > >   		err = ops->pre_commit(pt_update);
> > >   		if (err)
> > >   			goto err_job;
> > >   	}
> > > -	if (!q)
> > > +	if (is_migrate)
> > >   		mutex_lock(&m->job_mutex);
> > >   	xe_sched_job_arm(job);
> > >   	fence = dma_fence_get(&job->drm.s_fence->finished);
> > >   	xe_sched_job_push(job);
> > > -	if (!q)
> > > +	if (is_migrate)
> > >   		mutex_unlock(&m->job_mutex);
> > >   	xe_bb_free(bb, fence);
> > > @@ -1464,6 +1402,38 @@ xe_migrate_update_pgtables(struct xe_migrate *m,
> > >   	return ERR_PTR(err);
> > >   }
> > > +/**
> > > + * xe_migrate_update_pgtables() - Pipelined page-table update
> > > + * @m: The migrate context.
> > > + * @pt_update: PT update arguments
> > > + *
> > > + * Perform a pipelined page-table update. The update descriptors are typically
> > > + * built under the same lock critical section as a call to this function. If
> > > + * using the default engine for the updates, they will be performed in the
> > > + * order they grab the job_mutex. If different engines are used, external
> > > + * synchronization is needed for overlapping updates to maintain page-table
> > > + * consistency. Note that the meaing of "overlapping" is that the updates
> > > + * touch the same page-table, which might be a higher-level page-directory.
> > > + * If no pipelining is needed, then updates may be performed by the cpu.
> > > + *
> > > + * Return: A dma_fence that, when signaled, indicates the update completion.
> > > + */
> > > +struct dma_fence *
> > > +xe_migrate_update_pgtables(struct xe_migrate *m,
> > > +			   struct xe_migrate_pt_update *pt_update)
> > > +
> > > +{
> > > +	struct xe_vm_pgtable_update_ops *pt_update_ops =
> > > +		&pt_update->vops->pt_update_ops[pt_update->tile_id];
> > > +	struct dma_fence *fence;
> > > +
> > > +	fence =  xe_migrate_update_pgtables_cpu(m, pt_update);
> > > +	if (!IS_ERR(fence))
> > > +		return fence;
> > 
> > Previously there was an EAGAIN check here to bail. It's fine to drop this?
> > 
> 
> Techincally no as __xe_migrate_update_pgtables will just return -EAGAIN
> anyways. -EAGAIN is returned in rare case if a userptr has been
> invalidaed on a faulting VM. For optimial coding, we should check this.
> I will add this back in.
> 
> > > +
> > > +	return __xe_migrate_update_pgtables(m, pt_update, pt_update_ops);
> > > +}
> > > +
> > >   /**
> > >    * xe_migrate_wait() - Complete all operations using the xe_migrate context
> > >    * @m: Migrate context to wait for.
> > > diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
> > > index a5bcaafe4a99..453e0ecf5034 100644
> > > --- a/drivers/gpu/drm/xe/xe_migrate.h
> > > +++ b/drivers/gpu/drm/xe/xe_migrate.h
> > > @@ -47,6 +47,24 @@ struct xe_migrate_pt_update_ops {
> > >   			 struct xe_tile *tile, struct iosys_map *map,
> > >   			 void *pos, u32 ofs, u32 num_qwords,
> > >   			 const struct xe_vm_pgtable_update *update);
> > > +	/**
> > > +	 * @clear: Clear a command buffer or page-table with ptes.
> > > +	 * @pt_update: Embeddable callback argument.
> > > +	 * @tile: The tile for the current operation.
> > > +	 * @map: struct iosys_map into the memory to be populated.
> > > +	 * @pos: If @map is NULL, map into the memory to be populated.
> > > +	 * @ofs: qword offset into @map, unused if @map is NULL.
> > > +	 * @num_qwords: Number of qwords to write.
> > > +	 * @update: Information about the PTEs to be inserted.
> > > +	 *
> > > +	 * This interface is intended to be used as a callback into the
> > > +	 * page-table system to populate command buffers or shared
> > > +	 * page-tables with PTEs.
> > > +	 */
> > > +	void (*clear)(struct xe_migrate_pt_update *pt_update,
> > > +		      struct xe_tile *tile, struct iosys_map *map,
> > > +		      void *pos, u32 ofs, u32 num_qwords,
> > > +		      const struct xe_vm_pgtable_update *update);
> > >   	/**
> > >   	 * @pre_commit: Callback to be called just before arming the
> > > @@ -67,14 +85,10 @@ struct xe_migrate_pt_update_ops {
> > >   struct xe_migrate_pt_update {
> > >   	/** @ops: Pointer to the struct xe_migrate_pt_update_ops callbacks */
> > >   	const struct xe_migrate_pt_update_ops *ops;
> > > -	/** @vma: The vma we're updating the pagetable for. */
> > > -	struct xe_vma *vma;
> > > +	/** @vops: VMA operations */
> > > +	struct xe_vma_ops *vops;
> > >   	/** @job: The job if a GPU page-table update. NULL otherwise */
> > >   	struct xe_sched_job *job;
> > > -	/** @start: Start of update for the range fence */
> > > -	u64 start;
> > > -	/** @last: Last of update for the range fence */
> > > -	u64 last;
> > >   	/** @tile_id: Tile ID of the update */
> > >   	u8 tile_id;
> > >   };
> > > @@ -96,12 +110,6 @@ struct xe_vm *xe_migrate_get_vm(struct xe_migrate *m);
> > >   struct dma_fence *
> > >   xe_migrate_update_pgtables(struct xe_migrate *m,
> > > -			   struct xe_vm *vm,
> > > -			   struct xe_bo *bo,
> > > -			   struct xe_exec_queue *q,
> > > -			   const struct xe_vm_pgtable_update *updates,
> > > -			   u32 num_updates,
> > > -			   struct xe_sync_entry *syncs, u32 num_syncs,
> > >   			   struct xe_migrate_pt_update *pt_update);
> > >   void xe_migrate_wait(struct xe_migrate *m);
> > > diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> > > index ade9e7a3a0ad..d6ce531f0fcd 100644
> > > --- a/drivers/gpu/drm/xe/xe_pt.c
> > > +++ b/drivers/gpu/drm/xe/xe_pt.c
> > > @@ -9,12 +9,15 @@
> > >   #include "xe_bo.h"
> > >   #include "xe_device.h"
> > >   #include "xe_drm_client.h"
> > > +#include "xe_exec_queue.h"
> > >   #include "xe_gt.h"
> > >   #include "xe_gt_tlb_invalidation.h"
> > >   #include "xe_migrate.h"
> > >   #include "xe_pt_types.h"
> > >   #include "xe_pt_walk.h"
> > >   #include "xe_res_cursor.h"
> > > +#include "xe_sched_job.h"
> > > +#include "xe_sync.h"
> > >   #include "xe_trace.h"
> > >   #include "xe_ttm_stolen_mgr.h"
> > >   #include "xe_vm.h"
> > > @@ -325,6 +328,7 @@ xe_pt_new_shared(struct xe_walk_update *wupd, struct xe_pt *parent,
> > >   	entry->pt = parent;
> > >   	entry->flags = 0;
> > >   	entry->qwords = 0;
> > > +	entry->pt_bo->update_index = -1;
> > >   	if (alloc_entries) {
> > >   		entry->pt_entries = kmalloc_array(XE_PDES,
> > > @@ -864,9 +868,7 @@ static void xe_pt_commit_locks_assert(struct xe_vma *vma)
> > >   	lockdep_assert_held(&vm->lock);
> > > -	if (xe_vma_is_userptr(vma))
> > > -		lockdep_assert_held_read(&vm->userptr.notifier_lock);
> > > -	else if (!xe_vma_is_null(vma))
> > > +	if (!xe_vma_is_userptr(vma) && !xe_vma_is_null(vma))
> > >   		dma_resv_assert_held(xe_vma_bo(vma)->ttm.base.resv);
> > >   	xe_vm_assert_held(vm);
> > > @@ -888,10 +890,8 @@ static void xe_pt_commit_bind(struct xe_vma *vma,
> > >   		if (!rebind)
> > >   			pt->num_live += entries[i].qwords;
> > > -		if (!pt->level) {
> > > -			kfree(entries[i].pt_entries);
> > > +		if (!pt->level)
> > >   			continue;
> > > -		}
> > >   		pt_dir = as_xe_pt_dir(pt);
> > >   		for (j = 0; j < entries[i].qwords; j++) {
> > > @@ -904,10 +904,18 @@ static void xe_pt_commit_bind(struct xe_vma *vma,
> > >   			pt_dir->children[j_] = &newpte->base;
> > >   		}
> > > -		kfree(entries[i].pt_entries);
> > >   	}
> > >   }
> > > +static void xe_pt_free_bind(struct xe_vm_pgtable_update *entries,
> > > +			    u32 num_entries)
> > > +{
> > > +	u32 i;
> > > +
> > > +	for (i = 0; i < num_entries; i++)
> > > +		kfree(entries[i].pt_entries);
> > > +}
> > > +
> > >   static int
> > >   xe_pt_prepare_bind(struct xe_tile *tile, struct xe_vma *vma,
> > >   		   struct xe_vm_pgtable_update *entries, u32 *num_entries)
> > > @@ -926,12 +934,13 @@ xe_pt_prepare_bind(struct xe_tile *tile, struct xe_vma *vma,
> > >   static void xe_vm_dbg_print_entries(struct xe_device *xe,
> > >   				    const struct xe_vm_pgtable_update *entries,
> > > -				    unsigned int num_entries)
> > > +				    unsigned int num_entries, bool bind)
> > >   #if (IS_ENABLED(CONFIG_DRM_XE_DEBUG_VM))
> > >   {
> > >   	unsigned int i;
> > > -	vm_dbg(&xe->drm, "%u entries to update\n", num_entries);
> > > +	vm_dbg(&xe->drm, "%s: %u entries to update\n", bind ? "bind" : "unbind",
> > > +	       num_entries);
> > >   	for (i = 0; i < num_entries; i++) {
> > >   		const struct xe_vm_pgtable_update *entry = &entries[i];
> > >   		struct xe_pt *xe_pt = entry->pt;
> > > @@ -952,66 +961,116 @@ static void xe_vm_dbg_print_entries(struct xe_device *xe,
> > >   {}
> > >   #endif
> > > -#ifdef CONFIG_DRM_XE_USERPTR_INVAL_INJECT
> > > -
> > > -static int xe_pt_userptr_inject_eagain(struct xe_userptr_vma *uvma)
> > > +static bool no_in_syncs(struct xe_sync_entry *syncs, u32 num_syncs)
> > >   {
> > > -	u32 divisor = uvma->userptr.divisor ? uvma->userptr.divisor : 2;
> > > -	static u32 count;
> > > +	int i;
> > > -	if (count++ % divisor == divisor - 1) {
> > > -		struct xe_vm *vm = xe_vma_vm(&uvma->vma);
> > > +	for (i = 0; i < num_syncs; i++) {
> > > +		struct dma_fence *fence = syncs[i].fence;
> > > -		uvma->userptr.divisor = divisor << 1;
> > > -		spin_lock(&vm->userptr.invalidated_lock);
> > > -		list_move_tail(&uvma->userptr.invalidate_link,
> > > -			       &vm->userptr.invalidated);
> > > -		spin_unlock(&vm->userptr.invalidated_lock);
> > > -		return true;
> > > +		if (fence && !test_bit(DMA_FENCE_FLAG_SIGNALED_BIT,
> > > +				       &fence->flags))
> > > +			return false;
> > >   	}
> > > -	return false;
> > > +	return true;
> > >   }
> > > -#else
> > > -
> > > -static bool xe_pt_userptr_inject_eagain(struct xe_userptr_vma *uvma)
> > > +static int vma_add_deps(struct xe_vma *vma, struct xe_sched_job *job)
> > >   {
> > > -	return false;
> > > +	struct xe_bo *bo = xe_vma_bo(vma);
> > > +
> > > +	xe_bo_assert_held(bo);
> > > +
> > > +	if (bo && !bo->vm) {
> > > +		if (!job) {
> > > +			if (!dma_resv_test_signaled(bo->ttm.base.resv,
> > > +						    DMA_RESV_USAGE_KERNEL))
> > > +				return -ETIME;
> > > +		} else {
> > > +			return xe_sched_job_add_deps(job, bo->ttm.base.resv,
> > > +						     DMA_RESV_USAGE_KERNEL);
> > > +		}
> > > +	}
> > > +
> > > +	return 0;
> > >   }
> > > -#endif
> > > +static int op_add_deps(struct xe_vm *vm, struct xe_vma_op *op,
> > > +		       struct xe_sched_job *job)
> > > +{
> > > +	int err = 0;
> > > -/**
> > > - * struct xe_pt_migrate_pt_update - Callback argument for pre-commit callbacks
> > > - * @base: Base we derive from.
> > > - * @bind: Whether this is a bind or an unbind operation. A bind operation
> > > - *        makes the pre-commit callback error with -EAGAIN if it detects a
> > > - *        pending invalidation.
> > > - * @locked: Whether the pre-commit callback locked the userptr notifier lock
> > > - *          and it needs unlocking.
> > > - */
> > > -struct xe_pt_migrate_pt_update {
> > > -	struct xe_migrate_pt_update base;
> > > -	bool bind;
> > > -	bool locked;
> > > -};
> > > +	switch (op->base.op) {
> > > +	case DRM_GPUVA_OP_MAP:
> > > +		if (!op->map.immediate && xe_vm_in_fault_mode(vm))
> > > +			break;
> > > +
> > > +		err = vma_add_deps(op->map.vma, job);
> > > +		break;
> > > +	case DRM_GPUVA_OP_REMAP:
> > > +		if (op->remap.prev)
> > > +			err = vma_add_deps(op->remap.prev, job);
> > > +		if (!err && op->remap.next)
> > > +			err = vma_add_deps(op->remap.next, job);
> > > +		break;
> > > +	case DRM_GPUVA_OP_UNMAP:
> > > +		break;
> > > +	case DRM_GPUVA_OP_PREFETCH:
> > > +		err = vma_add_deps(gpuva_to_vma(op->base.prefetch.va), job);
> > > +		break;
> > > +	default:
> > > +		drm_warn(&vm->xe->drm, "NOT POSSIBLE");
> > > +	}
> > > +
> > > +	return err;
> > > +}
> > > -/*
> > > - * This function adds the needed dependencies to a page-table update job
> > > - * to make sure racing jobs for separate bind engines don't race writing
> > > - * to the same page-table range, wreaking havoc. Initially use a single
> > > - * fence for the entire VM. An optimization would use smaller granularity.
> > > - */
> > >   static int xe_pt_vm_dependencies(struct xe_sched_job *job,
> > > -				 struct xe_range_fence_tree *rftree,
> > > -				 u64 start, u64 last)
> > > +				 struct xe_vm *vm,
> > > +				 struct xe_vma_ops *vops,
> > > +				 struct xe_vm_pgtable_update_ops *pt_update_ops,
> > > +				 struct xe_range_fence_tree *rftree)
> > >   {
> > >   	struct xe_range_fence *rtfence;
> > >   	struct dma_fence *fence;
> > > -	int err;
> > > +	struct xe_vma_op *op;
> > > +	int err = 0, i;
> > > -	rtfence = xe_range_fence_tree_first(rftree, start, last);
> > > +	xe_vm_assert_held(vm);
> > > +
> > > +	if (!job && !no_in_syncs(vops->syncs, vops->num_syncs))
> > > +		return -ETIME;
> > > +
> > > +	if (!job && !xe_exec_queue_is_idle(pt_update_ops->q))
> > > +		return -ETIME;
> > > +
> > > +	if (pt_update_ops->wait_vm_bookkeep) {
> > > +		if (!job) {
> > > +			if (!dma_resv_test_signaled(xe_vm_resv(vm),
> > > +						    DMA_RESV_USAGE_BOOKKEEP))
> > > +				return -ETIME;
> > > +		} else {
> > > +			err = xe_sched_job_add_deps(job, xe_vm_resv(vm),
> > > +						    DMA_RESV_USAGE_BOOKKEEP);
> > > +			if (err)
> > > +				return err;
> > > +		}
> > > +	} else if (pt_update_ops->wait_vm_kernel) {
> > > +		if (!job) {
> > > +			if (!dma_resv_test_signaled(xe_vm_resv(vm),
> > > +						    DMA_RESV_USAGE_KERNEL))
> > > +				return -ETIME;
> > > +		} else {
> > > +			err = xe_sched_job_add_deps(job, xe_vm_resv(vm),
> > > +						    DMA_RESV_USAGE_KERNEL);
> > > +			if (err)
> > > +				return err;
> > > +		}
> > > +	}
> > 
> > Could maybe reduce some duplication here? Maybe wait_vm + wait_vm_usage.
> > 
> 
> I should be able to add a helper with either DMA_RESV_USAGE_BOOKKEEP or
> DMA_RESV_USAGE_KERNEL passed in. Will add.
> 
> Matt
> 
> > <snip>
