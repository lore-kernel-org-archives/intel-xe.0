Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0A80C47DAF
	for <intel-xe@archiver.kernel.org>; Thu, 18 Jan 2024 18:16:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76E2A10E8BE;
	Thu, 18 Jan 2024 18:16:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FD7E10E8BE
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Jan 2024 18:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705601801; x=1737137801;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=wgvJbFhMHNtIQIKL/bXnDZaY/+Dpk/kV6CAJl+cjh08=;
 b=cmARjQdcmdT/t2sRAxYOPKnxlwKku+NkCFSXUWut2Bpj6TDFYiFFcebe
 jLAlT7E8kAa2j8AnmUyKeRSE8IFDEJwetOelSHOBUUQP5Wk+aN57W/1gb
 ENatSuo7+p1InglNCs1VoIML9djwekZOiu2u2P2nj3xdjLGrBeGKUJ7Iy
 bxhqUDOTXieNyYmxU3OqDUL5eUYmc2zMV1QkiTe8o1YiPkoPSRQASy1ym
 RfUhJjB7Y87Zm9pL6hu7xmTfKBrWD26FWFrSxlrLsWVLXljATdNL/RV+s
 IAQlDNjVLXIxMI0dfGH6TvkTBvIfAvtiw14V2HzGj5+22ov7XmmZOyAvT A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="13887344"
X-IronPort-AV: E=Sophos;i="6.05,203,1701158400"; d="scan'208";a="13887344"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2024 10:16:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="734338613"
X-IronPort-AV: E=Sophos;i="6.05,203,1701158400"; d="scan'208";a="734338613"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Jan 2024 10:16:34 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 18 Jan 2024 10:16:32 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 18 Jan 2024 10:16:31 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 18 Jan 2024 10:16:31 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 18 Jan 2024 10:16:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eRoE62Mn665ojp14k0KBOPIvmQe+T4mZ3+xzAlZ/xn9W7zaSYfMLaNNj7/1gruDfLrv2jtIYGvU7FCoLdXWliAYTBzauBYFmWEvHzeXjfIY+m3PXDJtaFCayZfKOoEx5hlEE1vnjRPVEa4P0G+P2PScHUSAZ5SW3EbH3iDaZI84OOl3C/7cnB9kSE6B8Os6q8zJsj/Bdjox21Kz4si0QSPxBO6SXrpgsUlksiwdiUEJXMhmL+OUh2cP9trFEx+iplYJE4Bm82uDGeJfRszxCxC57ZxmPAefPsgR83lfe9FbluwxxHGR/ElEDddFSHkCf2pJ3SQoJVLd/zvLhjY7RoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wssCOJfVxq+ZiKSJakUsdaEsJMBTuspP0eXCiVumJwk=;
 b=IoGEJuRNNIQYsn/ds14mBS2rKcnmw8Kw4JxN89Hd4bJ/odxKvvO9DTMNxeTuAVGbypURc8iUxgzkPg7ACfZl5PPQlqVIDBeK1XMNWNkqjzS9eGxOZ2VTDwENCh0cIFf8Bok7wntxpL9b/bEfqv+/1yXdVAQo22xwJOV1zYnK/d70YGNe97Y+beM1MSBQ2dcR+zNS0SpNLATcdLsAENL2fN6n46ar0vjfDva4tvpRFB1RWpBfXRFehyKJvdNt+GdupXv0Piwe3wWTW0PpvnankTp1cJecwhdDrmR6oqtHxIFpR0/7e+WJGbuObKngCjq7NoQ+XiGDwONnUyIkhVoQkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB6401.namprd11.prod.outlook.com (2603:10b6:510:1fb::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.29; Thu, 18 Jan
 2024 18:16:29 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954%7]) with mapi id 15.20.7202.020; Thu, 18 Jan 2024
 18:16:29 +0000
Date: Thu, 18 Jan 2024 12:16:27 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: Re: [PATCH] drm/xe: Do not flood dmesg with guc log
Message-ID: <osoxittwh6wna5rq3awbvzddqp6dsggbxg5xrfgcmft3bcut6x@y4vfqvgb4kw5>
References: <20240117204059.345143-1-rodrigo.vivi@intel.com>
 <ztv76j5a2333n3sdl3h6nuulqcdscqcosambxe62rydprzpepz@mitp3w4jgb2o>
 <Zak2LTfFOPRulNje@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <Zak2LTfFOPRulNje@intel.com>
X-ClientProxiedBy: BYAPR07CA0061.namprd07.prod.outlook.com
 (2603:10b6:a03:60::38) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB6401:EE_
X-MS-Office365-Filtering-Correlation-Id: f56d3fea-8f46-405f-c946-08dc1851976d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3HVVQ86W+TWXJI+Ce2x3kBfjH8pMTS6EMdycyc6lMKeVRIFo//wtgGo3E/WnOO8H4PXuUK6cBoAdYe34iAqh1IVEGrImWMMUxNvDBjmaj0+zpNO+fV+/qtAZupDKwsbP9EWvVurRIQQUHxHs0vqDBpNr0ERqk2h8ThtTyCUelsiKUJEYtQnhLZT3VAMaN93L7BaamAXEfkHTPpHstNNdqxgi+EVqyduW1Sat2WlZEJQDVGlqqc/3VEtdDEjCnLHpgAS5DjFtRK5QLUTkULB1Anr1l29t9l2/R/BVbAT0T0IoGG1IC+vo5UYSeMIIbLLItubFas9M3leA3HjIBALnOQ1MHa3YMCDriCK4EtL5WKoTwwA/5cGi1u3w1HSrcjvXqzeDjtcCXcnUomzYFAv//FTVKT+VceDFmz8WltO3kDS723duNiHoWvyrSdcx96/w1vbcsxxcIeiUqrHntZ8DV12fYDoQvtT02q5geusH0CuD8nehArfd28Bhxge7goYIgz8beNk7g2KgbHNuUgVy6GYT73rjITl9xca+ELDzB4tHTViFlr5ZoEorP22pIRg+
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(39860400002)(376002)(346002)(136003)(396003)(366004)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(33716001)(2906002)(26005)(41300700001)(83380400001)(86362001)(66476007)(82960400001)(66556008)(316002)(6862004)(4326008)(478600001)(38100700002)(8676002)(6636002)(66946007)(6486002)(6512007)(6506007)(8936002)(9686003)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oiF0FTPyJu7kSULawUhkP1IvD1NuWHCIfdH+U2u/lhirbD9y+79pHS8EGtZQ?=
 =?us-ascii?Q?XqjWZ/ymMx8p7xk0ANeBYsyuc1aYPJjGBw4+dgKO86clSfYwz7akKtcEGUKY?=
 =?us-ascii?Q?zHqp/XKyiy27EZk1cGMbnkmehTaPRwSXNgOyICHOapUlXHPNSVy73OcdbtDJ?=
 =?us-ascii?Q?GvUL6oiKnOf7neEORD9joKfda9A9VLJkq2qBuHidbsT/Q9V+3Cv9bdpaaAYq?=
 =?us-ascii?Q?pLtC2JVo10eQc3U8NqEQcHXNepWTQnej3opniIueP/O7mJuwlhWMrSaFjTJ3?=
 =?us-ascii?Q?p0LeQE8BD3tVs4aqY3JnPGOKci4qLpX37S/EhCUG1AGfnCPmZE/b9U3xy920?=
 =?us-ascii?Q?I3jQyK0l4p+O7/sNgHQA3m3+H+XHT5Frutxxe9nuUrZFc+JbGMAOiH0391oN?=
 =?us-ascii?Q?3VjW2QJ9N4BaovYpqEi/S0KOvuaxDwUzP2Vgz4BnyY+CL/HeyJbs156I2mEn?=
 =?us-ascii?Q?eZxINo5nU5P+7pyTizvxLrEp/jheyhhUN9GyDZXtzQ3KBkLVD3xWyXgarVq1?=
 =?us-ascii?Q?RWYbJcW+yTaGY1yyyLw20e+jtRx5RZGHcXh/uI1bSX3bdZ5WjMQawe6MuXLa?=
 =?us-ascii?Q?07z8bhAOdFlrmvinEnjv9BolQqhl/UCaB3dJrxnHoxU7VofFIXY1PEwf4CBF?=
 =?us-ascii?Q?rYDHNh4REJRBcoR0YI4QgIeB60mKt7o72GNsKSktv+XogewT0h67c5QSw5o2?=
 =?us-ascii?Q?73VWvsbiemUitXf1gbPwGu4eJ4qlNZXExZp2t1WoB3B6mpCMeeOOcXUfDfiC?=
 =?us-ascii?Q?oZRrZZUNFhGTqgg58RZIXrfOPEzzY3aQC36YGnXsQ4gEXUySnQOxJHCM21ky?=
 =?us-ascii?Q?7MHykG3uchHoeKhB54NIu/WtkIm+EwzOOJYePO6kQ8ZiGiunAtS+WDF+g3S6?=
 =?us-ascii?Q?en+By9AFalI+M5DCQ/gVG45fnwATSBie4zOjWMEwh8TGmb25KYkkTm5PErL7?=
 =?us-ascii?Q?DPR1rq0+qQKFwLxFzdA0JlroIz9yORB8NLDPj9ytG9Pgrp/laykJTfA3F2a4?=
 =?us-ascii?Q?NPvTqBJkCFVso3nFg19h+hQ001sGHarnVucm16CRP/ysduUsEfgTtUD7Moro?=
 =?us-ascii?Q?Nae5Zpiv9+dBKPok1T1QRMORJn+KUzXkMJry/2LFZd+vYlQem+hstHOe0MVR?=
 =?us-ascii?Q?irKfM4Lva/bX5tehvtkwWB70Y315dn4Uki179T5oUrU54T5zqeBpINbhe4VG?=
 =?us-ascii?Q?hL3lucVAksPndTWBpVUVC9SnfZQzhr/2qkAJuz6K6/exRAQQkJ9GP8gEo3+P?=
 =?us-ascii?Q?VwWUS8h+fmCs5+vdzf7L4KTSOFeib9iNPLlq43J03kloM/jVJ1fPPMduXqKE?=
 =?us-ascii?Q?LEtAylb8m20beUay673ed8pGaNgao2dutEqnu0pqpTHMFDGMvGNQI6lMVKwU?=
 =?us-ascii?Q?XMsppuDb5QX6wgIEbvuBy0moSpJeZPgnZe6heq46iPrpSpNdfzFGAFn5CC/q?=
 =?us-ascii?Q?AjkQt/xqJBlbwhyOJilTNPBDjZkIpG2Lz4UH7HDlrZnSh22bianZ0tfO0+o+?=
 =?us-ascii?Q?MWNvr5c3Tt4nhUG/NahQJFNVkL1DDJ0i+q2Fp54VnrkuXVPDVACeb8KzAm5b?=
 =?us-ascii?Q?XLU1eSShzK7EBF5UoZLxkKazVU+HJsUiXXVAlNXi6dVdWt/tO0pHg0nsQ9Yn?=
 =?us-ascii?Q?Cw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f56d3fea-8f46-405f-c946-08dc1851976d
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2024 18:16:29.3294 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wHL7AMpTXltk5xozS08BW3cwW/3dRy2T19E1Cmsh8geDKBaPxq80aOJns1ft1qIh5ofveRLTT4aY7VbYQxcNNrN/UdlDHtLRL7GX18ELxkY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6401
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

On Thu, Jan 18, 2024 at 09:31:09AM -0500, Rodrigo Vivi wrote:
>On Wed, Jan 17, 2024 at 05:42:00PM -0600, Lucas De Marchi wrote:
>> On Wed, Jan 17, 2024 at 03:40:59PM -0500, Rodrigo Vivi wrote:
>> > This information is already present at
>> > /sys/kernel/debug/dri/0/gt0/uc/guc_log if needed.
>>
>> but is it persisted if we couldn't load guc?
>
>well, it was there here with the same content that was spit to dmesg.
>Maybe just because I got this after a resume?

not sure. I remember past debugs I had to rely on the guc log being
relayed to to kernel log when debugging issues on the golden LRC
submission. Honestly I don't remember if that was with i915 or xe. 

commit 4bc3a34f1237 ("drm/xe: Dump GuC log to dmesg on load / auth failure")
seems to be the one adding it before drm-xe-next creation, but maybe
we just didn't have a better alternative at the time.

>
>If so I would still prefer to make that persistent instead
>of the flooded dmesg that gets really messed up and hard
>to navigate to find the real useful information of the
>failures.

that would be my preference too. If it works, I'm fine with that. At
least the end user should never be exposed to that amount of info we
print.

could we add the guc log to a devcoredump if we failed earlier?

Lucas De Marchi

>
>>
>> >
>> > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> > ---
>> > drivers/gpu/drm/xe/xe_guc.c | 1 -
>> > 1 file changed, 1 deletion(-)
>> >
>> > diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>> > index 235d27b17ff99..2a71348c5deda 100644
>> > --- a/drivers/gpu/drm/xe/xe_guc.c
>> > +++ b/drivers/gpu/drm/xe/xe_guc.c
>> > @@ -466,7 +466,6 @@ static int guc_wait_ucode(struct xe_guc *guc)
>> > 			ret = -ENXIO;
>> > 		}
>> >
>>
>> trailing newline above
>
>not actually a newline, but I can remove that extra line there
>while removing this.
>Wonder if I also should remove the spaces between the if/else
>above this block as well... The "style" there looked strange,
>but I decided to not touch.
>
>>
>> Lucas De Marchi
>>
>> > -		xe_guc_log_print(&guc->log, &p);
>> > 	} else {
>> > 		drm_dbg(&xe->drm, "GuC successfully loaded");
>> > 	}
>> > --
>> > 2.43.0
>> >
