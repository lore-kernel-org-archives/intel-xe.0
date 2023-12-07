Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 673ADC4167B
	for <intel-xe@archiver.kernel.org>; Thu,  7 Dec 2023 18:33:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C78F10E054;
	Thu,  7 Dec 2023 18:33:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0666B10E054
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Dec 2023 18:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701974020; x=1733510020;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=+ag0JkAW/UjGh0oBparTFSJriqcP0CzfSRwdTghI/bw=;
 b=Yn25xNsRyRjXgrftXXiXTucixO1PjeGfK3u/lFOctIEyeXMfvfOc9XN/
 hE1FUCdZz7gylWJT3EIX65UyIcyyDrevGqvoWNdmt284Euo027MSShN8K
 k5hfvtz5LAU1JdpBaueGLPppfxNPUsSTtAC95g/r6F/Y0PCa/MgQcX/vt
 lKIuM7d9wnbHrlgdHddZgbjqkvH6d4V1FnC2jKs37Mb2JUCV+7Dh2oLzT
 dj1kRaInyJI7PHaJmY+cbJbCJ8qTAT7jJ/fHvaJfxwbLxqIlxTFHzc9yN
 90LCBeUuFDUqBoa52lLfI726yU9T5srbXkWzA3FceCUE8TcVeMEBFiD4u A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="1150871"
X-IronPort-AV: E=Sophos;i="6.04,258,1695711600"; 
   d="scan'208";a="1150871"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 10:33:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="842302762"
X-IronPort-AV: E=Sophos;i="6.04,258,1695711600"; d="scan'208";a="842302762"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Dec 2023 10:33:39 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Dec 2023 10:33:38 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 7 Dec 2023 10:33:38 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 7 Dec 2023 10:33:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kBKvc8SljCxX1cGrGUlE6sQZl1SdUmzYS39qTMTiOLUT6HimT4H9E3EZ8cHndy4ZTPz9Hf4XNO3ScXvhdf3s7TMkKMims3luSfmIBRQEwWagc/fFswuD8Hg2jr03UXWH+KuD6oQQSVXtUcLZYhM1HEgNiU/uknyNWLeHaBtdbMGgpQKlahdIbjNT9WkCY86E5kCGpM9x2c6KuZrbBvtRrwGDaQirvLqrqG/GtNBp8g9IgYX7+o7ieNcXKb3MxxuZxQZQ6NHVMniYRsiLzyZQWndkKbA/1/3EcjaBQtXZFvpkC9T/t2yOvHdZUnc6FRKSHLV5X+wUdlzS2vdEuFIUQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dmJBslT8jvEopEes6bYruNU695ceFCLuGVGsrrFJUjQ=;
 b=aK/tQ/+eWnWUw5NBjMqMc0WNRHWmmcfnA7To3/k0altsW16SmD4WRnPbOJWcb7y/oUUk5EafJ3RcRL+kTAvmp4Ab8a87nlHifAo177RdMEpLLBRtcwlK1BR07d/LucN5Ch5OlctMYav8mAdyZ2+F/7nCfVWDpwpk5erwj0MFnhDAioxNDLmkTLmwTKJfUj65k5WtZOXw7xZCZChbkG8hZpiGgDAXu88cwO0RuE93oICut83YtTtfFKTYX1lGMhJrRWv/loxKf2YRYjR3UzcMJXGVUD2iLpYBYubOnd+9+NrSjzpZjLZjWmKxdAfmkOEEs7Ygl5H0S4UIrk12/RRX6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SN7PR11MB7066.namprd11.prod.outlook.com (2603:10b6:806:299::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.27; Thu, 7 Dec
 2023 18:33:36 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b%4]) with mapi id 15.20.7046.033; Thu, 7 Dec 2023
 18:33:36 +0000
Date: Thu, 7 Dec 2023 12:33:34 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH] drm/xe/xe2: Add workaround 16020183090
Message-ID: <ybbmlszm37mx6zuu5w6krsne6y3smj2lzzx37hllk2s4f47g5v@d5uiae2mforu>
References: <20231207175117.2334022-1-lucas.demarchi@intel.com>
 <20231207182355.GA5757@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20231207182355.GA5757@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: BYAPR06CA0034.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::47) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SN7PR11MB7066:EE_
X-MS-Office365-Filtering-Correlation-Id: 843af0a6-90a4-43bc-0f13-08dbf7530610
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: a3PqG3TCIwWmGkpl5p73tkiM/TClf+bN2pjR55f0p44HLr2LsTpgmwCoeJU811YqY/o1E5J9Wi3bT/BnJiQg2ah4k+hRiopOrr4mBhPXnADfa4vyyJSuJ/nlbUQhMgMFee1dWNdWYxGmmWeHtBVlaU1StKSOqRddK7qXpE49k2xVHVbXKkQvqKFrE4W4oUiNPc9VsGR8rHX47USGy/EckRdqcX7Hmpc0gyaP1rqNR8uETP0E0uaxWOS0AKQ9RohfRMJMh3lQ4eqKXkKfDS6Pdpyd3YoRUFgxHYHe1O9/PATs2Oa2cG+sJK8QKbES5+b4YYtZsppPBXqASPH2GXxZEIuUsv+iXJNlL2swv1kbdKg9yl1sgQ/t/ux6MwUqlSkTf1XyCroTTVMOljQZUX1Ov4uYUxG39bLplub1FcqZysIc+qrOPz7JLoTwNAlg3cUakfhengAgNZjXruHndOJTVaqdoxDe7iVC5KGTUMW8cXA5EHisJoLV11fOr+CPQzEiClry0y0OoiOUQqyUoI54T0pWjxF0/HvA42p4w8FEuxjngCQGfLx6RR/IZq1Ol9Es
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(136003)(396003)(39860400002)(376002)(366004)(346002)(230922051799003)(1800799012)(64100799003)(186009)(451199024)(8936002)(6862004)(8676002)(4326008)(33716001)(83380400001)(478600001)(66476007)(66556008)(66946007)(316002)(6486002)(107886003)(26005)(9686003)(2906002)(6512007)(6506007)(41300700001)(86362001)(38100700002)(6636002)(82960400001)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9XNtekq9FiGxN4SJVnIrRLXjrN54ytFGxkJF6s0HVlXkcLY0wsF1UpO/dfCr?=
 =?us-ascii?Q?YbWjIJlssqHX/l63nTyq4iGNwABJncCC4DNxEdJicrd0jKbZVyiqKJzEu9ZC?=
 =?us-ascii?Q?Zh2/L6q+yac0wQWr2Fh7Nc0PqB/80+ab9s3myoQ02/XxftdGsa7+ydvLYe3C?=
 =?us-ascii?Q?KL7xKHktsZKw5oVXiS0HwAosuVr5nNeqgVJVnL+xm6ObmV3VO4oFgA0JIK14?=
 =?us-ascii?Q?+ZSSU4POTBrvnxyTubUhGYdNiuFeiyB1h8LSLDwtLuxZfcWGcWsHBMn2uZn4?=
 =?us-ascii?Q?FyLuqmdbnf1gAhYkrD6rfHYsPg7tmMpnzl3p2H85UBG6s7Ufvct+eCsUxwKQ?=
 =?us-ascii?Q?+BfQxyxkuJ/8WwwVChr9p4KWOSPXX3qFiDMd67UbYHIZEMFfhJOZH00dwIkK?=
 =?us-ascii?Q?0b99SEX/h+tKyFcM/2cuijkdDveXrATQGoaeV+eBUZCmSKPNzj9WPL2SOQJ6?=
 =?us-ascii?Q?48b40nI0QH3otRtDJSBDcpzue4+kCu8utpQz0PyMTNfkZKDKjfXej4VGcf6t?=
 =?us-ascii?Q?Qr3lgAdd6/PKicUBk9HYm5chUp/n4p3q2yjS7J/weFHmoHDdbyPmU+EPtE91?=
 =?us-ascii?Q?/t6NfnoLztOTJnpUjA4susUm25IfAC3PVgtO2+/ng66smRROB4FqMIU9JiVj?=
 =?us-ascii?Q?4rdZDMfMIBO+R1B9jtNFfCdAGiQ1J76sUJb8B4B6D+Em8l/uakRujx3uAAP2?=
 =?us-ascii?Q?MHIeaM+rSKe60JG1+d02KcGG/fyauX285uqMIIze6zz0Krv3j6mhGhSaP/px?=
 =?us-ascii?Q?tw6gturjSWfAoD3VgtZUCQzN+HwgP/oOsQ7YGgE6fJGTMcp+P3hBdIqSWVFt?=
 =?us-ascii?Q?s6PJOwhI/0XvTS0GLU5ZrVxDWNA+NUnSi3aR2to/i0BXVvQMeyYtMX9EENAv?=
 =?us-ascii?Q?Q0NjP+d0zldKGPxF++AEPsu/LuDKU0R3c11Ti7D+BKGnJBb0xZKVa7elAF2S?=
 =?us-ascii?Q?73knEqKTbZ5K53Gi6CTnv00RPzdopOZafaanFMa8jnIITgGjTvTuTSkepXLy?=
 =?us-ascii?Q?4CfYloOQkqOjvFBUZj/mYn9lg4rpv/wnepnVr5Y2ysJpcW4cmiuNhNfbq7ih?=
 =?us-ascii?Q?zHb6QpkVedDD+pkoERAP7Q9NX8hhaqMIvgfdG5lhX6dPqnHh3GjdPD3jrH2F?=
 =?us-ascii?Q?BSxgbY472bHxVIfBZUcDTYF1f74McEFe9pLuOungL2iJk6dauMgQ7/XzvHgf?=
 =?us-ascii?Q?zQaA+nhXJOw6xBVEF+stC/FfZW9RDnpyCZxetN4IpNZm5EXUeKkKgpaBg+LI?=
 =?us-ascii?Q?mK4tMYc6uQmydtLeYNDmjupcMkaXgDArz1nlU6gmu2ZB3XNq1yKlnr1GnlCi?=
 =?us-ascii?Q?yx40dr+IEZHU2z+sR6enXZ3ALIq+Ig1WcUG/rbR15yQezD4SEErr1XV+gPFf?=
 =?us-ascii?Q?V4qNB+b6ThSAcbPWHzAbPee3FEhM9VVoxIoBi3Zi9ShoDjnwB//cgdhZHHEB?=
 =?us-ascii?Q?pWDcN1oxxL5qg2AGdr4NK2JpMJ4tRmLXB/R9RHZbtjck9Pz6hFaYwwOWyj85?=
 =?us-ascii?Q?3cY/mkBF2BfkVfuhClww7ml1F7vP44iouUvjpPmB6uQVEC1FAOx23A5pPitQ?=
 =?us-ascii?Q?ANzcG7LOOFF6MXYtL8K875pzB7Pi3KypnDZrl6F26KN8XbwYi6ZFf679pHO0?=
 =?us-ascii?Q?cA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 843af0a6-90a4-43bc-0f13-08dbf7530610
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2023 18:33:36.0746 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tlyRM+3i/g03nyn+O2MUUmXETFDHzQT0dBXmiC5B5tWcMHsC/Pu734Yx+DILj12OIm3zncyKzubm6MTRBlMMc73x51P/P4F2720b90id5dQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7066
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

On Thu, Dec 07, 2023 at 10:23:55AM -0800, Matt Roper wrote:
>On Thu, Dec 07, 2023 at 09:51:17AM -0800, Lucas De Marchi wrote:
>> Graphics version 20.04, used in Lunar Lake, needs WA 16020183090 for
>> steppings A*. Set ENABLE_SEMAPHORE_POLL_BIT in INSTPM(RENDER_RING_BASE)
>> and whitelist CSBE_DEBUG_STATUS for userspace to be able to use it
>> and complement the workaround.
>>
>> Cc: Haridhar Kalvala <haridhar.kalvala@intel.com>
>> Cc: Matt Roper <matthew.d.roper@intel.com>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  drivers/gpu/drm/xe/regs/xe_engine_regs.h | 4 ++++
>>  drivers/gpu/drm/xe/xe_reg_whitelist.c    | 8 ++++++++
>>  drivers/gpu/drm/xe/xe_wa.c               | 5 +++++
>>  3 files changed, 17 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
>> index 3942db268b01..93d83ceba873 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
>> @@ -46,6 +46,9 @@
>>  #define RING_EMR(base)				XE_REG((base) + 0xb4)
>>  #define RING_ESR(base)				XE_REG((base) + 0xb8)
>>
>> +#define INSTPM(base)				XE_REG((base) + 0xc0, XE_REG_OPTION_MASKED)
>> +#define   ENABLE_SEMAPHORE_POLL_BIT		REG_BIT(13)
>> +
>>  #define RING_CMD_CCTL(base)			XE_REG((base) + 0xc4, XE_REG_OPTION_MASKED)
>>
>>  #define CSFE_CHICKEN1_REG(base)			XE_REG((base) + 0xd4, XE_REG_OPTION_MASKED)
>> @@ -92,6 +95,7 @@
>>  #define   TAIL_ADDR				0x001FFFF8
>>
>>  #define RING_CTX_TIMESTAMP(base)		XE_REG((base) + 0x3a8)
>> +#define CSBE_DEBUG_STATUS(base)			XE_REG((base) + 0x3fc)
>>
>>  #define RING_FORCE_TO_NONPRIV(base, i)		XE_REG(((base) + 0x4d0) + (i) * 4)
>>  #define   RING_FORCE_TO_NONPRIV_DENY		REG_BIT(30)
>> diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.c b/drivers/gpu/drm/xe/xe_reg_whitelist.c
>> index e66ae1bdaf9c..3fa2ece7d228 100644
>> --- a/drivers/gpu/drm/xe/xe_reg_whitelist.c
>> +++ b/drivers/gpu/drm/xe/xe_reg_whitelist.c
>> @@ -7,9 +7,11 @@
>>
>>  #include "regs/xe_engine_regs.h"
>>  #include "regs/xe_gt_regs.h"
>> +#include "regs/xe_regs.h"
>>  #include "xe_gt_types.h"
>>  #include "xe_platform_types.h"
>>  #include "xe_rtp.h"
>> +#include "xe_step.h"
>>
>>  #undef XE_REG_MCR
>>  #define XE_REG_MCR(...)     XE_REG(__VA_ARGS__, .mcr = 1)
>> @@ -56,6 +58,12 @@ static const struct xe_rtp_entry_sr register_whitelist[] = {
>>  				   RING_FORCE_TO_NONPRIV_DENY,
>>  				   XE_RTP_ACTION_FLAG(ENGINE_BASE)))
>>  	},
>> +	{ XE_RTP_NAME("16020183090"),
>> +	  XE_RTP_RULES(GRAPHICS_VERSION(2004), GRAPHICS_STEP(A0, B0),
>> +		       ENGINE_CLASS(RENDER)),
>> +	  XE_RTP_ACTIONS(WHITELIST(CSBE_DEBUG_STATUS(RENDER_RING_BASE), 0))
>
>For the userspace steps of this workaround, it sounds like they only
>really need RO access to this register rather than RW.  Should we use
>RING_FORCE_TO_NONPRIV_ACCESS_RD?  I guess it doesn't really matter too
>much since the register itself is RO so even if userspace tries to write
>to it nothing should happen.
>
>Up to you whether it's worth explicitly flagging it RO here or not;
>either way,
>
>Reviewed-by: Matt Roper <matthew.d.roper@intel.com>


eventually this is going away since it's A* stepping only and there's
no harm the way it is as you said, so I think I will leave it like that.


thanks
Lucas De Marchi

>
>> +	},
>> +
>>  	{}
>>  };
>>
>> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
>> index 23f1285135b8..f3326825bef5 100644
>> --- a/drivers/gpu/drm/xe/xe_wa.c
>> +++ b/drivers/gpu/drm/xe/xe_wa.c
>> @@ -737,6 +737,11 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
>>  	  XE_RTP_RULES(GRAPHICS_VERSION(2004), ENGINE_CLASS(RENDER)),
>>  	  XE_RTP_ACTIONS(SET(XEHP_PSS_CHICKEN, FLSH_IGNORES_PSD))
>>  	},
>> +	{ XE_RTP_NAME("16020183090"),
>> +	  XE_RTP_RULES(GRAPHICS_VERSION(2004), GRAPHICS_STEP(A0, B0),
>> +		       ENGINE_CLASS(RENDER)),
>> +	  XE_RTP_ACTIONS(SET(INSTPM(RENDER_RING_BASE), ENABLE_SEMAPHORE_POLL_BIT))
>> +	},
>>
>>  	{}
>>  };
>> --
>> 2.40.1
>>
>
>-- 
>Matt Roper
>Graphics Software Engineer
>Linux GPU Platform Enablement
>Intel Corporation
