Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6006C3271E
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jul 2024 17:30:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B558410E191;
	Mon,  8 Jul 2024 17:30:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N7NxnYtX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0B6D10E191
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Jul 2024 17:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720459828; x=1751995828;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=yhew/lucgSUTmXxKjs8DA/6NzMOV8Pc+04iN6av5uFg=;
 b=N7NxnYtXdfvdqAO6Y4MbAoSOFrQhLl8vNgi+8FdewDDinbyqhSmYoWEP
 e7BuQkzcX+TU10Y09tzxnk/IvN9TYQ2IeM2GK1U3zBtueugQw1tsKT/35
 mXV2jz0KtKCg/udvdH+U/MOHabA8HvMh/YTtJcIdSAdnH/+9W2ZrVFKF1
 HU3+xBBBCZwX6drFIn68obdS7ObVsOBxTOQr0ws+MW4EVfvgLJ9Ag76bm
 LGMgyLHLEUn6CubBt778RsKwCv3QdSMwTLeZic+8SA23udIV96q6g2MGI
 zx71w4FO7dpjyV3Zxravqnu25giWTRotjRviHSOp+cLKY6dGLGjXNLkke A==;
X-CSE-ConnectionGUID: QaF5RrHvTYyweNWTErK0mA==
X-CSE-MsgGUID: QChOg7YRQIC+LdDQiXtIFQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11127"; a="28278429"
X-IronPort-AV: E=Sophos;i="6.09,192,1716274800"; d="scan'208";a="28278429"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2024 10:30:27 -0700
X-CSE-ConnectionGUID: i5nQu53BSmCedddgRYAmUA==
X-CSE-MsgGUID: JfkaCFt0TqOARjE/zzyyLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,192,1716274800"; d="scan'208";a="47670176"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Jul 2024 10:30:26 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 8 Jul 2024 10:30:26 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 8 Jul 2024 10:30:26 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.172)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 8 Jul 2024 10:30:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jjjHAGBp9zKzqN4RxhB7a+9gz+PX1etCNGTBaC4t9pohI48QRhdkubyWrwL06lIYfjFnNCAim7KLtSU6ylySr53qohb7Z7zla/ME+jHO1K3Om3LU69YmOB/HEN9Oq9DAb7KMEBOA33Z+9ivxfPimu/UoR2augSubjgi1xWqsy8FqZ5h8Luzhm3bVdT2cC1wm6CGswz8BB1afKYEmYFlcmvOdOHlZfyn/9BQI8aRqbe8dwb4EHLWYXHtTeSJ6DpHMVYsM8HlXCjmEbj+03yVHe44PfHh66sKOnHVBfDPfKU0FO0lb0C4Nc61tvNTiiiYO4J8ELMPJEWWNqyJpbH2SRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2IDF3Z8dUsNQSKeQbK3/k5+1c+YSOLC7KOq9/Gjy33I=;
 b=iJOTC8SUiNWxO7jI/iMNrLh6O61dOul+f4hBJ8hhxXlykbBi2cCJOAgMc8KKDqzWO7gd11ZWmex/IVM0TqgIcDMPS6Y9LWjL/R2TCrwuwv1b4Ok0pqFQ9zWL+DGmEyetf/H5d49YJ4XC6pkB2W91d0iHLHc1IyS2E2rpgxN0LPXmAImCwROyIt+5116HKBqQuFM5ebJQaRWUMFejZ79qeisVcQhguOx0I2f1qmq+LtHgseOLsajY4PwbDgI3VdSjwjvcdqpngPk3+Vtn84P+N6bjJWENVpqsTo5ND6mjzJZQokhjQqJy2YpwJHasC+GewhruMUDxBoQl88yk3Ewm/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS0PR11MB6447.namprd11.prod.outlook.com (2603:10b6:8:c4::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.36; Mon, 8 Jul
 2024 17:30:22 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7741.033; Mon, 8 Jul 2024
 17:30:22 +0000
Date: Mon, 8 Jul 2024 12:30:19 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: Bommu Krishnaiah <krishnaiah.bommu@intel.com>,
 <intel-xe@lists.freedesktop.org>, Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH] drm/xe/xe2lpg: Extend workaround 14021402888
Message-ID: <vxgd7tn7r2p7k2penw5vozkmmxuhbmardzmuqzielljbdwkmgz@b7elr65a4sxu>
References: <20240703090754.1323647-1-krishnaiah.bommu@intel.com>
 <20240703135400.GA2905419@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240703135400.GA2905419@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: MW3PR06CA0020.namprd06.prod.outlook.com
 (2603:10b6:303:2a::25) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS0PR11MB6447:EE_
X-MS-Office365-Filtering-Correlation-Id: a7f20e2a-03c0-4cdc-f994-08dc9f73a566
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?aQGRmiFf5VK7j1DvNOxpIwVhD6tQRMf6PxRMceSOd+ZjOTFBoxzLq0MwCtek?=
 =?us-ascii?Q?C3G5NaoR6cZffLt/mmXZHa3qI3Bgi1drmWBVvdL9XGdissMVl+PvWnAHV3X+?=
 =?us-ascii?Q?KSwAKt5QSazWzhJbX7/ZtHcY57OGMMFGGZCKVWFSEb7C4czZ83u0z9TNe4up?=
 =?us-ascii?Q?6BW00yK2f/m8EHj1qBYf/gkgIPAxAEVVm7VKAnCeYyLrX490Ht+XG7Bc1LV6?=
 =?us-ascii?Q?SbdMuLKfNvcAlQkbZpm3JbYU7px2zUyOSpfgJT/986NdD0SrmJPWM9GhfrGY?=
 =?us-ascii?Q?fZLXqL6rd1pLP6WaMd8muj92dl+M5MZo1/MirAaRmSXdsyhVva1Oo5HLoRO1?=
 =?us-ascii?Q?8X3mEgEjGtvrGHdPAMrsYhWQJfRbWxmvjLCiU5u1IxrBdNnOlPrlwDABklLG?=
 =?us-ascii?Q?nDUMEufpr0/eAvX5CEHPkFm23NkPFsGv1OA5XVhJ1YhnK04LdOBHjRhN0BbX?=
 =?us-ascii?Q?HqlFIArP91ihlZD2lmFGumoJPoJfdtao+DEatMLQE73u8PhO9pAiiF44M5kr?=
 =?us-ascii?Q?vBebQHElswYuNc1NM/CpFBrlNKLgED6fUQ+ccvMzTw7HbcDiUlPsW1F9PAgR?=
 =?us-ascii?Q?IAVD7p2vtUqb3l00RkooNuuT3iCsTuxRqUfo2VBaA2ZCR8ELQ9utDjJwJjjx?=
 =?us-ascii?Q?N06BJyT1LKDbbReZI0dX3LCCbFnTEPvz+kvl73n597ZeqlupKgq78AURuTq6?=
 =?us-ascii?Q?Rb3cFsaNZ63AYZMRKistjyg7e/Wdyr+4FrNormG+94y0WYFcSBb7pSAoct8w?=
 =?us-ascii?Q?LQK98R1FKAF6RhXz65wjemZ20YzMRA/pNwRu5LYNii/mZAyhNaKMRlntbdka?=
 =?us-ascii?Q?8QxJVLhV5ZooD+SsmdV55PJ/+IoT6TO2y8ZdvdY1B/LlWRsH1fjXnhhnwwr+?=
 =?us-ascii?Q?I/sMNSBt70vU6/eb7dJbcV1zPOuRenFXpPZwBDRjr9V8chbF/dpvoRqxE39f?=
 =?us-ascii?Q?MSUecL4l61KEDDfRUmMpI8TcrKCBGpq4CeLXUbGrz4O8vWl5vIi3fXGHketQ?=
 =?us-ascii?Q?wGO6fspgODjRCLBRSdfitc/DRVPHq0M6zU1O7mOFtuPG6z9zA6Z0HMutkz00?=
 =?us-ascii?Q?UbVb32JJiV/dHU4003z59PKvZ9sPVyC53LMCGoXni2bhTdsMaeVZVcfIgNvg?=
 =?us-ascii?Q?QnZ+fHjgfPkbLFbHIIqYOARGPKO80b5I2FHVsYMldW9XO/0N4zrEhS2pLZEf?=
 =?us-ascii?Q?6m7/cQZ96pwWQH6UJKx58GbxkWTDRsf+Aaza8ONk8L0T1TDA0FLGALdZIP82?=
 =?us-ascii?Q?RXI/Zt3k61x+4UFuCnQn+L7uqYoAtUyk+JoNPNbclubzv+WIhnSac26LxkkM?=
 =?us-ascii?Q?Vh2PVt9hLkmFSFU1PYMReuAR1h80z0/AHhPmtZm+crZu5A=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JClQqXvWJ1zQlpUVqyceumSlzkDkCs/2kuNY6lQNN2nlv4ig62965G8tS9Ew?=
 =?us-ascii?Q?SwUymGjZi9trcJ7X8P9HZgCnYiAudjgKzNkVXSlIn3U+SDVoew2f2Na4npqP?=
 =?us-ascii?Q?6NIvpC/OmP1I5sKx+AhHvIMruzTLgdqPVW1wkbkoP4NqjoRn8sPpPpnslCMb?=
 =?us-ascii?Q?8nfDOCFkuEbnYt1jre8V/K6omddA/12xri7TyEQmCo7JVdOku/bUgSkMNuIU?=
 =?us-ascii?Q?YKizftAOFcXYFE5UcXa4RxIpKFGcqSBidNvZJ1Bqj206tHQTCI0J1X4e21YV?=
 =?us-ascii?Q?xP2C0Ga3lFRdcCQlo++PhhLtC7MH3atli/oQO0/FEF0jf1hcNNusdjW5i2Or?=
 =?us-ascii?Q?Zxi7YzvkCAlCPzceLo7OWF5LIKUMy9o16qCOUPIvIHWSL8lxRIyvf6KcvtTp?=
 =?us-ascii?Q?NyvKCeLcYXgsIYIJI3pN+ytqLjWAe8VG7GzLt/7ksu3fQJGyoLWca9GIvdja?=
 =?us-ascii?Q?H7cC1qEcS9O5nA3mQRLg9XmydaNliHL4W+Hax6p/o+CVokCz7m5rv2yd0Rvd?=
 =?us-ascii?Q?t1K1gfRlh23/1bnw8Bu95IqYlNXpsI5sSCVWiM/hIRXrx1VQNuCoGmOw2yfw?=
 =?us-ascii?Q?1HuwPubn646ruLlPUYZBqLFSTbI4OaE/tlRSzD/kR9LKuhnaRgcqrnJuogr5?=
 =?us-ascii?Q?gtus/nT67SupAoW6s9dVxErdlBBwVpw69TTyYrkFXl9UoCj9O4TMj+CRd1cA?=
 =?us-ascii?Q?P5tEl1UPbi0s4ZEDXma3LcyqrIIhWuqCaBLzf1+c92nD5SLTgTUSonNYiPzo?=
 =?us-ascii?Q?mDh33MFVXc2ELE1mCzNkZu9bB4DNGUuV8Z1FgfT5YQqVX6kDjIkNAFSZPaXn?=
 =?us-ascii?Q?4TuVqL6GqRDWhKZcWRzVpi4sVhaAYCsb5a8DZZvsKedtKF4ojb+Hdg8+Q7p7?=
 =?us-ascii?Q?U2ohjX223O4ytud4tCgHfJd+GfKjS8nGojlRpTs/yT5VdkeEm0iJqY0yn9+F?=
 =?us-ascii?Q?nYL87sgIu65Ap0RoSfgQC/A0z+mo0UavidyS9qY37AySVjGeSoPqQqRr0/vt?=
 =?us-ascii?Q?FmHvx2BkhOOGdEStF0ioe1vEczPD5TszWlZSct16aJULA5y6QeAu78EImy7d?=
 =?us-ascii?Q?h+KDJYOKEhiPEdrAWymrY9mXffA5Moh0ucw6T58LLN9FQGVjWlChRt6Jdn/Y?=
 =?us-ascii?Q?FKsyAY9xUvndyIPRoaHI+xK5mjmk2GZwsM6epJAsLyUZU6eXruIGMARHOdps?=
 =?us-ascii?Q?u8kuR75xmGX5Sd9KMJt4pHKukCfDWhQ7ooPRmZNWt8AR636xPdsGF1eFgjjB?=
 =?us-ascii?Q?93kdBBiFZNu7qn3G02DYmwMkELJZibysT6AXrDps4Us3yFlgqtUzxEEVtTub?=
 =?us-ascii?Q?0PK0wot7TPvPE/vzmplh69+YSXXZ5XuJ0DqsaNWUrVcgjyIK1FGcWDmdWRKw?=
 =?us-ascii?Q?pkoZugp+2GMMSGOOOw0Xb2o7EdijCQS5LUtWqhEPqwU2oLX2ng1K66zMihpH?=
 =?us-ascii?Q?FJpxIGPdalK88G5+FQ4C+9jHFXUebpey5/UjTmvjg3ZBDoSm7Mrt8nak9b1k?=
 =?us-ascii?Q?FwTG2SNj2tmTZqnu87T4JRyVA51weDqmK6UFIb85Wi/3HFF17fVxaNbFe/b1?=
 =?us-ascii?Q?3Tnt4HftUnvcXi1X/cNnULu/jhUzWTGdByLlCoxe+pKjtYzGCNkTiBnx8UpI?=
 =?us-ascii?Q?Ow=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a7f20e2a-03c0-4cdc-f994-08dc9f73a566
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2024 17:30:22.7681 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /Ax507CqB8VNwr7OVU3fFVLnJBasUuwu1nGUvll11C/we/OAlFl8Q6lcNYrV7KivjNu6ekt+kQKExUT1Yaa4o0pUiQU3gpJ0bvYkql86XgU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6447
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

On Wed, Jul 03, 2024 at 06:54:00AM GMT, Matt Roper wrote:
>On Wed, Jul 03, 2024 at 02:37:54PM +0530, Bommu Krishnaiah wrote:
>> workaround 14021402888 also applies to Xe2_LPG.
>> Replicate the existing entry to one specific for Xe2_LPG.
>>
>> Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
>> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
>> Cc: Matt Roper <matthew.d.roper@intel.com>
>> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>
>Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
>
>> ---
>>  drivers/gpu/drm/xe/xe_wa.c | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
>> index c7bf0862b231..91737d7a483d 100644
>> --- a/drivers/gpu/drm/xe/xe_wa.c
>> +++ b/drivers/gpu/drm/xe/xe_wa.c
>> @@ -486,6 +486,10 @@ static const struct xe_rtp_entry_sr engine_was[] = {
>>  	  XE_RTP_RULES(GRAPHICS_VERSION(2004), FUNC(xe_rtp_match_first_render_or_compute)),
>>  	  XE_RTP_ACTIONS(SET(TDL_TSL_CHICKEN, SLM_WMTP_RESTORE))
>>  	},
>> +	{ XE_RTP_NAME("14021402888"),
>> +	  XE_RTP_RULES(GRAPHICS_VERSION(2004), ENGINE_CLASS(RENDER)),
>> +	  XE_RTP_ACTIONS(SET(HALF_SLICE_CHICKEN7, CLEAR_OPTIMIZATION_DISABLE))

since the action is exactly the same as for GRAPHICS_VERSION(2001),
maybe we should prefer to a) add this one here, with an OR to also apply
in GRAPHICS_VERSION(2001) and then remove the one in the bottom of the
array that are 2001-only. Thoughts?

Lucas De Marchi



>> +	},
>>
>>  	/* Xe2_HPG */
>>
>> --
>> 2.25.1
>>
>
>-- 
>Matt Roper
>Graphics Software Engineer
>Linux GPU Platform Enablement
>Intel Corporation
