Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FF08C47077
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jan 2024 16:43:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1955B10E7D0;
	Thu, 11 Jan 2024 16:43:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F23C10E7D0
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jan 2024 16:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704991408; x=1736527408;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=tTsJRFkGoX+t4jObAhaE28Ln6CV2yG/ifFTtkOZaW30=;
 b=eMnn+SaI3oLMqPKgEsDRXgTSz2p7KzKJhS5yyoLPEZ5DHVjaJgh641S8
 UjH5eHnWgNnZAcQADndDmkwfc4yxt0Ka7zi1W1El027PiCQvIwYFDeGO9
 6vakH4/qTNUQO/bD0CS+tecH68Jh7btE6dhrY+JRtoaZJ/7Pvp0X/FZIX
 bNC6N0qHW5HWUsDX5pJ81JOgL4eMSBZfLTZEilKpjy5XpOB7ufbpHFfEl
 DPcLKHEBBLrf/jAtXCitNb6tr18DsJ2NviEvL0l7jS/Zmotb0iF+QdAKb
 e0YAn7KN5Qhrh3AcHrOIHbSEEvqYhz3tmAa0X0qSxlYdpi07UFsInIXPS Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10950"; a="389350260"
X-IronPort-AV: E=Sophos;i="6.04,186,1695711600"; d="scan'208";a="389350260"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2024 08:42:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10950"; a="816776794"
X-IronPort-AV: E=Sophos;i="6.04,186,1695711600"; d="scan'208";a="816776794"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Jan 2024 08:42:06 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 11 Jan 2024 08:42:05 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 11 Jan 2024 08:42:05 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 11 Jan 2024 08:42:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F213TaaeUj0pb7FJ/ByOKuUwpOqI01h6Svht52DMTYAPTj19S8gUu+4Eoy1K6/H0iSb9t5le67i4ExaFzuUQYVSgr+NIl5qfLVl32IVbbU4NmD56w2UjGD/Y4zAKmXk+h7KF0g4uzDGTUQWnHvSHEadLSlvBo9HqdcaMd48bkok9z4XD9FbbGfUV09S5wiZZIQ8VPt5RM64xBzFB4F5T2h+V/7eVakvN1TjsoWEKUVYTXJroTFms1YcyUIGletkyNf//ynazhD8xP5u+Oeo6G5MrTBltwbs4Y8J46AkqJp4Cvne1YERZUcjMHx2eSga6M/r2LlS70tspXCVCakE9rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mo7dbQPqpLqRy9k74s2keNDjQfC7pI+OKsdkKE2jVIE=;
 b=dxxT4SLFV8jgio4C8jrd57rqcYSjH+h6vsgLMHJ1lNuXqVOmzI69De/rKVFsIZ0xeGCYU6XFzgs1SOjKPYzYbIIcaeUANXfQjGdXs0qicjo+uBGZ6Cv+138PnWRH2NBHL5Lg63DlChBPYLyzluJHAgq6F1rcnCzHAAvwW2Ahp14BhEcj3R9vsH8WRIbm2eUj2C8rTVORo6dfsRbQU0wqwnf6NwmIGEnZNbpTtw2yyu9GRsw7GpAwUNpSx08GU58WCxyQdA0fp3BwiYvbgLtB13fopaKOvsGSwp6pYjDo25UarocTBFbjhIjW402eeLqJuBMu4gw2fdsNibIMAXcZbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM4PR11MB5390.namprd11.prod.outlook.com (2603:10b6:5:395::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.21; Thu, 11 Jan
 2024 16:42:02 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda%4]) with mapi id 15.20.7181.019; Thu, 11 Jan 2024
 16:42:02 +0000
Date: Thu, 11 Jan 2024 16:40:45 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [PATCH] drm/xe/guc: Return CTB response length
Message-ID: <ZaAaDeAOPqbS7Tg6@DUT025-TGLU.fm.intel.com>
References: <20240111152724.497-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240111152724.497-1-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BY3PR05CA0037.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::12) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM4PR11MB5390:EE_
X-MS-Office365-Filtering-Correlation-Id: 63118dbc-4389-4ff7-1834-08dc12c43cb1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /pclsNNp85XwFCPXO3rDJ/VDh1hksXOcJaeaENWp9xXvpG1Pzr5MP03aDBZfeGPQxetsx6BPf/K7fLDfcAVmuF3gH161MM+dScHf0mSdaJOj7MLPfqUrUWOPEHeSDN//SDh0TUEtvyznTzzQc3LWWH0FUDszK1sKdZ+CdN3du81Efw1LwYoE7LS8XGL0qTAdiLV0k82UmKEZbOGmmS8YyPL3LrW6MIZeE5/C5jMUdDBU6hocifdlCc2vpdev7bRwE7b4t+9PuRC2YASBySLsQPW+k+dsP3AFaiDWKlcD9NV6oFnF26qU2t+wIWqX0DWXkC8Ur4qGAOcQSDMXUrbVPRwLS16RkzNmvUQV0I682pujZGgq/4CoZtmRw9HV/ZQ4hkEsdkdyPLti3QmXhGuulMS8zB+O9iCvgR6A/msDq1CqlOJKaogMvlHRzvOg57Q3oaXCoRMha/cxmB1zY1zZzUfxQ50S3TNvQVnMFJh3BtuYFCYX/7e4zEfNiAUWLDRTKI1FgnvTgzypu4TFgdMH18cYagW+GEgM8AifTd+0InY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(376002)(346002)(39860400002)(396003)(366004)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(26005)(6666004)(6512007)(38100700002)(6486002)(6506007)(966005)(478600001)(2906002)(66556008)(83380400001)(5660300002)(4326008)(6636002)(44832011)(66476007)(316002)(6862004)(8676002)(8936002)(66946007)(86362001)(82960400001)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NQV5QXsuvwo03AmIuRUx6ZboH5dSnaeU4IJkgSrGTESDNkxM+T8lJSE1DVoi?=
 =?us-ascii?Q?cfB5DQfeOQODOX3OaBia6IHGa4CzVZM40EgCGIYSqBP4R2ynFCJfN2Q564Vt?=
 =?us-ascii?Q?u83BJTRJXfHrdlEZY1/eHhybnGDC5M4L3r7VvWKG0Fmy2Tb4ewrV+WzoUG7W?=
 =?us-ascii?Q?WSote3p62Ryza7r8Lh1w+YM3SQbbt2e0G08AYAL9JdJ0zkY1t76KvMGT4YMc?=
 =?us-ascii?Q?3byM+GlSaoLPrkLj4NwOAIgkxKnOO45/JV+pUfXqNfOK/3/dgp8ECfaziJVt?=
 =?us-ascii?Q?bj6whv47jWDihDdhqma+p4UDixm0K9Ocvp+bUkMI0uEKKMvw/3VAEgnzKtLQ?=
 =?us-ascii?Q?9pEqoAgIYBmY1ImjPEhcMwtKEfKwr72Vj0KSxIoG48ZdstzxRhwcOpx9BVAR?=
 =?us-ascii?Q?9KIWzI/puiHNE4y7JVaboFlVvfET8cr6Zb+LzjpyGIANKfJ4OH069iwaIJbx?=
 =?us-ascii?Q?VleZF+W3Q5qayeeAP6jCzmH1octgljS/MPt+pm42QZNO9Ke+g+Lf4je+ZNXV?=
 =?us-ascii?Q?zDfxGXTZ8pxKqi6lWDJt5B0bJj5h5n8ngLEmImRIeWNrgyzXT+wl+or8M6kn?=
 =?us-ascii?Q?4F8FDOtpT3gcOlI8ZnzKiNl5VWDQySAhVQbWBOCe0/EfSMA1cw75Uj9Jmc9r?=
 =?us-ascii?Q?sFO5jDwMKHpDTvOJCIE/a54lk7LFmNmw/G0GZ5k4nUkVSpAIwwf//JDvoXLd?=
 =?us-ascii?Q?FE2sdpHqYw3OLE8eJc+BzeMVSYaVBaUTA+S4sEesWKexvZVCB45j0EDApnhF?=
 =?us-ascii?Q?BCb3dCzBAHJX1/2JhuyAbagA5/kgQ7Mu2fC7HOHjglQXfYfJztQlHws6RVT8?=
 =?us-ascii?Q?LmDuIPXKrTkcupGNqlnMOV7T3xtPeeKinoUEHzsuGrdyLRBK1Js/x0s/BNHi?=
 =?us-ascii?Q?9d7mNl/kTuCvWSdIPupHdX49pnBiMqaK5n3W6zskFT/xjqxt99IxHLe1hRDm?=
 =?us-ascii?Q?dQ/frv47qtynnN7M4AWa3n9IDQgdaRNVTwpNv+sBk3mDF53oMvN2F9v5juHe?=
 =?us-ascii?Q?DHUbLJkuP7p+CyrjBgCZNYduoj+4JnoYRawafLT4eMCgl+aHN0XmG+ugFwA8?=
 =?us-ascii?Q?4D4yZh8mKtvZmNssYcOOo1ii+EnUex6fyrUTWmU7De/rPqWOOtf6hMgpsjqi?=
 =?us-ascii?Q?fkTKuZe4V8YeTrSfCdK6qAAK4ynBTFYlmlxrxuraYc8FVCImfEzW8icieUC9?=
 =?us-ascii?Q?bCsCelPN8ZdoHz6WZQ2Lycrg5CDN/JOS+rDyoyWfmn6lQEpLyR5za4VOVGy7?=
 =?us-ascii?Q?gkqvuEx/eXpQNtwg4lkAuAte2exRPPSVtsH5oBt53X+0EnoPOiOh2H/duPni?=
 =?us-ascii?Q?EE5Scp8wX3Aap/BOndbWLjypW5ofMrSjzAjvUaUP6cY5py3npVgk9/ZVAMAJ?=
 =?us-ascii?Q?VdQHS9NLiL/5lx+BodPSN+FGra50Vw4HkAZpnv0X3JPoOvxuEurLUVLm7Ij0?=
 =?us-ascii?Q?tXr7scBDQsTl645HUyJO46wRWG1n4FUSvXZHZNibO7Wls8lmLEMWcdoYpUjl?=
 =?us-ascii?Q?mdblwWyRxWKfjHp+8oPT/mF8QhX2/RdUNl0x9KRV6sejGbaDH3Dzx2UoXa+Y?=
 =?us-ascii?Q?zIUBf5dJfqMxGN0oq6KAGPvvzJn7BErvEz/HMEyz4Y3wr1QuGZoYvDbLwE4s?=
 =?us-ascii?Q?pA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 63118dbc-4389-4ff7-1834-08dc12c43cb1
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2024 16:42:02.2455 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LoX/0a90cQD4UuzMMu8ACVT6pTHOXJTNVg8r1CZ5UivhAmnsi5GKVD2Axwoaoty5sdUCPDSxfLjskYPT7cPKCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5390
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

On Thu, Jan 11, 2024 at 04:27:24PM +0100, Michal Wajdeczko wrote:
> Not all CTB responses from the GuC are fixed size and we need to
> pass response length to the caller, if there was a response_buffer.
> Easiest solution is to return it as positive value from all
> xe_guc_ct_send_recv() functions.  The CTB response length is always
> between 1 and 254 (ie. GUC_HXG_MSG_MIN_LEN and GUC_CTB_MAX_DWORDS
> - GUC_HXG_MSG_MIN_LEN).
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

I has purposed a different usage of the return value [1].

Perhaps we just have response len as a pass by ref argument?

Matt

[1] https://patchwork.freedesktop.org/patch/541762/?series=119096&rev=1

> ---
>  drivers/gpu/drm/xe/xe_guc_ct.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index c29f095aa1b9..d490a4d42c01 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -780,7 +780,7 @@ static int guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
>  		ret = -EIO;
>  	}
>  
> -	return ret > 0 ? 0 : ret;
> +	return ret > 0 ? response_buffer ? g2h_fence.response_len : 0 : ret;
>  }
>  
>  int xe_guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
> 
> base-commit: 79184e72263e91528195db01783148435c7e4fad
> -- 
> 2.25.1
> 
