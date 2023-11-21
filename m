Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2D11C61D90
	for <intel-xe@archiver.kernel.org>; Tue, 21 Nov 2023 16:08:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 324F310E501;
	Tue, 21 Nov 2023 16:08:20 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5452F10E501
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Nov 2023 16:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700582898; x=1732118898;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=+4hfL3Na6ARSVD5Gyzx5K6OcooJguyflTT3+09PkVkY=;
 b=lZ1NRRLyfmTNK0BVuAhgvgise1fUN2j3XUc0Usu3xSNEQ0p7mpsQt7hx
 0/+dEO1sttbC393Vl/F7p4e9ROu6DKywoEdMP/lz0jAarhSSz26sz8pVW
 flUHVztKnCtm2feJLUpMcN+OStnvUdu7vY2z+Szlv15qxjJ/iUSQ1SiaC
 WyFA7uQxG9z4V0FjXebB9nL8ct58jTuXheXfCOdxxJsp/UZtLGnmOD3Rt
 7y3DCCyS/mr7nHY55xSCOiPI8NM2PDAnkF4FWczoXG05eySCvqzYcGrrx
 rBsE6b6OWxvoZhxbeBpNf7oY3nA6LMFd+VP5PWtF11Tc3oYC2sAp8xfj1 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="478073686"
X-IronPort-AV: E=Sophos;i="6.04,216,1695711600"; d="scan'208";a="478073686"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2023 08:08:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="910495284"
X-IronPort-AV: E=Sophos;i="6.04,216,1695711600"; d="scan'208";a="910495284"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Nov 2023 08:08:03 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 21 Nov 2023 08:08:03 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 21 Nov 2023 08:08:03 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 21 Nov 2023 08:08:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aJOUGON58rs9+CdfUEG8jO+m1pjr1BTZaB2RZy5hMjJze41wrNIf/GOLwbE7GSIh0V/NyrqYGAcdCzCqx5sC6z7AdtrC/DEopAEwTprr/0VkohRe/1C+3x0ysZHgcZspAc46/iov0AeDNz4+xYyaTkqSc8X8X/GNlD5kcTbl6NYC3hZer/3Lt/p+h165u//sdPnWZ/xFUdiqkRdjLPmfbQqkKJyX60m8JiPcwylzSoz/mtOQ0pG01dnIcsatdkEYPY3QrpJ8wQY1UPTAxfpSTKbxreyUnr0mIKJwGJwACs3ApS76FOAPzN98dgIgFkx/xTDKnvi/az0UD2ahLMk8wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F6x0ysVn0QzCnwxY+ZWOMsv0VQzV7Yqh82XBCTOvPCs=;
 b=hEu7RHEpVrrTHC9ctou+iUXQVKqh+cdLvSwdcfSWEV747QEF+7SHUvO+dW2KovYcmvHuUtfGTtFAbJ9YbpbfEnsOCOnvTOvhifOscW8/Mj0B2rSkX7ixLuNNtqfY3IeSwD92GCQf+KaoWymAvdOtE4KsfDe6OzYwt5Z9EpK868RA1IPs1Udy7qLV9ZANmRQDWHUiIyrv/GuCIP8QswvgHh5FXb1eIGFELUMw4Abl11XCcVo2cVJiL8dUpD8Uoe+0CuR3H47yBK2FK8O378CI2uehchngNXfpc3MxcaedCCS8ErvWkVE6BK3RW2LnFyA+CJAGcvcn8vw6C+P4BDz9Cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 IA1PR11MB7753.namprd11.prod.outlook.com (2603:10b6:208:421::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.28; Tue, 21 Nov
 2023 16:08:00 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::d5b4:6e20:2de9:ebb1]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::d5b4:6e20:2de9:ebb1%6]) with mapi id 15.20.7002.028; Tue, 21 Nov 2023
 16:08:00 +0000
Date: Tue, 21 Nov 2023 17:07:57 +0100
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Message-ID: <4jrwioyviedfxxyr6noz3nxxfixe5oiglmnyne6bemfao6rqpa@asrrrrivveg3>
References: <20231114130231.2299661-1-michal.winiarski@intel.com>
 <20231114130231.2299661-21-michal.winiarski@intel.com>
 <ZVTfK2Z3xUND4DZA@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZVTfK2Z3xUND4DZA@DUT025-TGLU.fm.intel.com>
X-ClientProxiedBy: WA2P291CA0003.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::7) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|IA1PR11MB7753:EE_
X-MS-Office365-Filtering-Correlation-Id: ce8f08a4-34d0-41c4-a036-08dbeaac08ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0n04EOScJC4l0G4P2j4zxM4cbi3Xhmm3Rdweccnik3tN0L3K1prgKJJLwSV6dOHOsK3fy6vPPOSd0w5scq/8esfKCTfUKgcxF36LBwvKMFgJruNZmfilocmu3b9mqAeXURMrZa3lP4nBBmDcYV0vRMgVZnhxRobC3Ej7VqqayXhR9cMgr4sKYr9W/3wiwdR+1xjMyxbNLJHpEhMb9boICCMvSYctuEqe+No7dUbCoBP830KYOtc/BYs9NjSbVZwwbWPM12glZF38Mso6oHBggSkMP4uyxdJoAXRgmOtXkdzOhZ1PODU8R/CjtHIXULi1JzI+sQZU+nKkqmyPCoaj9iFtbSHw/2sJ4QiFk1/oF4oueidtsI9eo2aOgvCrfdY3gnLO/nelwO40W9DRAAwJdVQ82q9TtIfkWrZkBvA+S20XCYsGxWgByWyJJro33g2Mdm4E51ISDLINak9m3hdE07ri0z4BxfAi9o76DRe4zXpnWdeIuAa7antVbQX5HFgTIfnCkwA3LxJYEZuseS29y7TgLp0XMiLmNnwVf4/iBvglef/vryKU+qoQEVqzva20W4xGNB/jE/wcxqpHAzggMG1t8xsHu8E/w/2tzuzx4sg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(346002)(136003)(376002)(39860400002)(396003)(366004)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(83380400001)(9686003)(26005)(6512007)(33716001)(2906002)(8936002)(4326008)(6862004)(8676002)(38100700002)(41300700001)(5660300002)(478600001)(6506007)(6486002)(6666004)(6636002)(54906003)(316002)(66476007)(66946007)(66556008)(82960400001)(86362001)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZVZBWWhIUWZOZmtMSThiK3ZZZVVNQlR4WnltRElsV2QrUFFXQmM0SjJRek5B?=
 =?utf-8?B?WWVWWkxiV2NreHprY1lWcXRtR1JHQ3orUXlYMzNrK2dkWWJTUlZ5T0pGakY1?=
 =?utf-8?B?LytGWHNlTFFzZHNEamlDcVJmdmZtOHdjM2ZUckwrWERxWXJmS3ovWU1KNHNv?=
 =?utf-8?B?bmxvUEZybG5KOVBYQjJnV1Z4N1pKTWIwN0FrakZHMFVuZWVPVTUwL0s3K1VR?=
 =?utf-8?B?azlxRitoN2ZqdGJOcW9PdTk1V0xsK2JzSmJCeStsQXhtQnZrYjFyS1dVZ2dR?=
 =?utf-8?B?WStSKzhmd2dvbitnUFpBeDdxK1BqVVV0b09sbEVXRmQ1UlM5empNOVNhMVpz?=
 =?utf-8?B?NVdiQUVCclpHdXdCMFFKZzVxYXk1MFlSeHk5RldjQVZPS3N4dE9oMUJlUURH?=
 =?utf-8?B?QnFJTkhlSHJxWjVQUzQzOUhaMmg5dnExNVFueWNJWXk3N0c0NmRISHExaWZj?=
 =?utf-8?B?MFM2VFFubVhDSlpSR2daRW1aVElsS0VhL2RrUVNuU1ZSTW1xRFlTOGJCNWZP?=
 =?utf-8?B?KzMvcGxVR2VFdzgveTQzYW9lWG4yRy8rNnF2dEovYS9vSk5YaTVLQzh4WFVs?=
 =?utf-8?B?Kzk0VW1WUHQ0MWNsTTROZUJ1YWtYSFg1cWR0RGplUWQ0d09YSi9VQTJIZjhX?=
 =?utf-8?B?dm1tUDMyampQZWRUSzl1NythSmtyQ2xWOGFqVnUvMUZreEFObUc0UStPRG93?=
 =?utf-8?B?NUVra1FtUEJUMk03eUFtWXd1WHVUQkxBS2NKTDRyNkJkOW9oZmtxTmlqTmtq?=
 =?utf-8?B?bjFNVW9IaTVwNENFdXRYcjlYcFE5QUVBSkl2TXEyVWFVaGM2ZTNJZm1NS05q?=
 =?utf-8?B?RVNtSktQVGFobjF0SER4TGxTVUJUd0Q2WnFkQWl0S3dkVlJZSHR2eXM4dkIw?=
 =?utf-8?B?RlJNb0tNNmxsc2dlMHNkNCsyUEJ5b0IyOFVHL01HWGMrMlZGQ1hkY3lNeVBM?=
 =?utf-8?B?cDJWN3lNcDhrNzZMcEdDVzhlZ2tSZFFnVXVwMEFLMjNoUXA1bXNMSmZpUTds?=
 =?utf-8?B?T0RDaDBDWHdXTjF3N2xQY1JqaFNPTm5ORWpJOEFVajRoVm5pSS9wN0NGYzlO?=
 =?utf-8?B?ak5hZDRIanhrcVBDWklyRXQvaFN6M1VVM05FdXJGNWQxQ1BRbnZMTVd1Mzd1?=
 =?utf-8?B?S3JqVVd2ZW03RUhsM0NYVHgyMysvTEovZ2crdExPWGpkUm9veGJZSmpYWFJx?=
 =?utf-8?B?anBCMGx2MVR1QU5SdVFTV0FWRi9CU3BmYklvWDlSNlpmSVhBNnUyVmRodmJW?=
 =?utf-8?B?RVV3Q3p3YVpRT0dobmlwaS9MOVU0SGh1ZTdITXNNendxazhzMFN5WmhmTWFp?=
 =?utf-8?B?R3hDUVA5UTVyMXJNOGxmUlJqZkFyaUlmSVJ3R0NncmtmcEJ3blZVQURBbmVW?=
 =?utf-8?B?QWhHM0hiWjF3U01lVTcxTFY0MzRBSnd0b010Y2lpTU5xZ0N5bTdqajVqbVFm?=
 =?utf-8?B?eUpFelhZMVMvQlhobkQ5SWFLa3VWN0JIZ3I4T0dxZmF3VnFMemJpSlpMSWx0?=
 =?utf-8?B?c0dXOXZkYkoyTkRob0kzVmxpMlVkS0VJYTJOL00yZ1Ztd1VhTHJ2TnNWZjlh?=
 =?utf-8?B?TGs1RjVmd2ljUUcyTWgzZGVZKzRUU29xeWRBblo0UjFUS2VMdjdLMi9nczhs?=
 =?utf-8?B?R0RpR09nMllUMVNqRDkrYzlXZFlFdXZlOGh2YXowVVdUMUtwTjhOeDFFZ3po?=
 =?utf-8?B?ZEdhT3lHN3pVcEpzdHZ5QlB5REYrZXpRWGt0SVgzTyt0V3FsMnFWVCtZQktm?=
 =?utf-8?B?eVlDM1BqcTVDWTFvYk03eWxmNlo0WWpNRVZ5RkFUU0grSTZabkhlak53MVcy?=
 =?utf-8?B?VEsvRTNpVTY1VE1IUEJWdlBrZUg1V0srb1JsbDUzN3RlMTVyMHk3RHJHMTFD?=
 =?utf-8?B?RTVEK0hjUVljeHcycFNWYi9iZllJYzl1WVNNSytRNmlxc3ZISThMMXQrOEtC?=
 =?utf-8?B?SFhweE5Kbk9UZFJYUENwNlpzQ1d6Uy9zK2txUlRPNlpxcmgyeW1COEk0WlEz?=
 =?utf-8?B?TS9TQkhIN1NQbDBwRDhrNTIyR0t0NmNVV2dUWkRkdGdOUllIdHdtWkNCNVhJ?=
 =?utf-8?B?T3FPUExEaG1zNGxoK1NRektESExVcFc4ay9XVzFSOUU1NEtQalJQVlpzSXVI?=
 =?utf-8?B?Y2Z3dklwL0tZdm5xZlJKWGp4NTFuWnhTZUYyUDVwalk1VDBLalR0YjN0bmNa?=
 =?utf-8?B?elE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ce8f08a4-34d0-41c4-a036-08dbeaac08ac
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2023 16:08:00.5444 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3Gf1iEmzunNjZsIsp7ff+e52XrfpKDMoeErH5q0mWQ5ebaz9iAeRp9nT+pqHkSNJtJCVyQ23y4s4dKnN7E+bhWpKzgstdhd2ck5LILZ2qFA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7753
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 20/20] drm/xe: Initialize GuC earlier
 during probe
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
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Nov 15, 2023 at 03:09:31PM +0000, Matthew Brost wrote:
> On Tue, Nov 14, 2023 at 02:02:31PM +0100, Michał Winiarski wrote:
> > SR-IOV VF has limited access to MMIO registers. Fortunately, it is able
> > to access a curated subset that is needed to initialize the driver by
> > communicating with SR-IOV PF using GuC CT.
> > Initialize GuC earlier in order to keep the unified probe ordering
> > between VF and PF modes.
> > 
> > Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_device.c | 11 +++++++++++
> >  drivers/gpu/drm/xe/xe_gt.c     | 16 ++++------------
> >  drivers/gpu/drm/xe/xe_guc.c    | 15 ++++++++++-----
> >  drivers/gpu/drm/xe/xe_uc.c     | 35 ++++++++++++++++++++++++++--------
> >  4 files changed, 52 insertions(+), 25 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> > index 531aca74e8eb4..ecbf1effecc41 100644
> > --- a/drivers/gpu/drm/xe/xe_device.c
> > +++ b/drivers/gpu/drm/xe/xe_device.c
> > @@ -32,6 +32,7 @@
> >  #include "xe_pat.h"
> >  #include "xe_pcode.h"
> >  #include "xe_pm.h"
> > +#include "xe_uc.h"
> >  #include "xe_query.h"
> >  #include "xe_tile.h"
> >  #include "xe_ttm_stolen_mgr.h"
> > @@ -414,6 +415,16 @@ int xe_device_probe(struct xe_device *xe)
> >  			return err;
> >  	}
> >  
> > +	for_each_gt(gt, xe, id) {
> > +		err = xe_uc_init(&gt->uc);
> > +		if (err)
> > +			return err;
> > +
> > +		err = xe_uc_init_hwconfig(&gt->uc);
> > +		if (err)
> > +			return err;
> > +	}
> > +
> 
> I think this should be a GT level function rather touching the UC layer
> here. Also maybe combine xe_force_wake_init_gt & xe_ggtt_init_early into
> this new function too if it makes sense.
> 
> Also a comment of why this located wouldn't hurt either.
> 
> Other than these nits the patch itslef makes sense to me.
> 
> Matt

I'll introduce xe_gt_init_hwconfig for uc_init / uc_init_hwconfig.

Combining other things (forcewake / ggtt) into it is problematic and
doesn't really make sense to me.
GGTT is per-tile, while forcewake needs to be initialized for all GTs
(for TLB invalidation purpose) before doing GGTT mappings (which uc_init
is going to do), so we can't easily handle it in a single for_each_gt
loop.

Thanks,
-Michał

> 
> >  	err = drmm_add_action_or_reset(&xe->drm, xe_driver_flr_fini, xe);
> >  	if (err)
> >  		return err;
> > diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> > index 73665e4e66f22..bee661e1f164a 100644
> > --- a/drivers/gpu/drm/xe/xe_gt.c
> > +++ b/drivers/gpu/drm/xe/xe_gt.c
> > @@ -344,14 +344,6 @@ static int gt_fw_domain_init(struct xe_gt *gt)
> >  			goto err_force_wake;
> >  	}
> >  
> > -	err = xe_uc_init(&gt->uc);
> > -	if (err)
> > -		goto err_force_wake;
> > -
> > -	err = xe_uc_init_hwconfig(&gt->uc);
> > -	if (err)
> > -		goto err_force_wake;
> > -
> >  	xe_gt_idle_sysfs_init(&gt->gtidle);
> >  
> >  	/* XXX: Fake that we pull the engine mask from hwconfig blob */
> > @@ -415,10 +407,6 @@ static int all_fw_domain_init(struct xe_gt *gt)
> >  	if (err)
> >  		goto err_force_wake;
> >  
> > -	err = xe_uc_init_post_hwconfig(&gt->uc);
> > -	if (err)
> > -		goto err_force_wake;
> > -
> >  	if (!xe_gt_is_media_type(gt)) {
> >  		/*
> >  		 * USM has its only SA pool to non-block behind user operations
> > @@ -442,6 +430,10 @@ static int all_fw_domain_init(struct xe_gt *gt)
> >  		}
> >  	}
> >  
> > +	err = xe_uc_init_post_hwconfig(&gt->uc);
> > +	if (err)
> > +		goto err_force_wake;
> > +
> >  	err = xe_uc_init_hw(&gt->uc);
> >  	if (err)
> >  		goto err_force_wake;
> > diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> > index e04b04be32b7d..895bcc24ae2c8 100644
> > --- a/drivers/gpu/drm/xe/xe_guc.c
> > +++ b/drivers/gpu/drm/xe/xe_guc.c
> > @@ -572,26 +572,31 @@ static int __xe_guc_upload(struct xe_guc *guc)
> >   */
> >  int xe_guc_min_load_for_hwconfig(struct xe_guc *guc)
> >  {
> > +	struct xe_gt *gt = guc_to_gt(guc);
> >  	int ret;
> >  
> >  	xe_guc_ads_populate_minimal(&guc->ads);
> >  
> > +	ret = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> > +	if (ret)
> > +		return ret;
> > +
> >  	/* Raise GT freq to speed up HuC/GuC load */
> >  	xe_guc_pc_init_early(&guc->pc);
> >  
> >  	ret = __xe_guc_upload(guc);
> >  	if (ret)
> > -		return ret;
> > +		goto out;
> >  
> >  	ret = xe_guc_hwconfig_init(guc);
> >  	if (ret)
> > -		return ret;
> > +		goto out;
> >  
> >  	ret = xe_guc_enable_communication(guc);
> > -	if (ret)
> > -		return ret;
> > +out:
> > +	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
> >  
> > -	return 0;
> > +	return ret;
> >  }
> >  
> >  int xe_guc_upload(struct xe_guc *guc)
> > diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
> > index 13e76e6805ca1..069207a7f2f21 100644
> > --- a/drivers/gpu/drm/xe/xe_uc.c
> > +++ b/drivers/gpu/drm/xe/xe_uc.c
> > @@ -29,8 +29,16 @@ uc_to_xe(struct xe_uc *uc)
> >  /* Should be called once at driver load only */
> >  int xe_uc_init(struct xe_uc *uc)
> >  {
> > +	struct xe_device *xe = uc_to_xe(uc);
> > +	struct xe_gt *gt = uc_to_gt(uc);
> >  	int ret;
> >  
> > +	xe_device_mem_access_get(xe);
> > +
> > +	ret = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> > +	if (ret)
> > +		goto err;
> > +
> >  	/*
> >  	 * We call the GuC/HuC init functions even if GuC submission is off to
> >  	 * correctly move our tracking of the FW state to "disabled".
> > @@ -38,26 +46,36 @@ int xe_uc_init(struct xe_uc *uc)
> >  
> >  	ret = xe_guc_init(&uc->guc);
> >  	if (ret)
> > -		goto err;
> > +		goto err_fw;
> >  
> >  	ret = xe_huc_init(&uc->huc);
> >  	if (ret)
> > -		goto err;
> > +		goto err_fw;
> >  
> >  	if (!xe_device_uc_enabled(uc_to_xe(uc)))
> > -		return 0;
> > +		goto out;
> > +
> >  
> >  	ret = xe_wopcm_init(&uc->wopcm);
> >  	if (ret)
> > -		goto err;
> > +		goto err_fw;
> >  
> >  	ret = xe_guc_submit_init(&uc->guc);
> >  	if (ret)
> > -		goto err;
> > +		goto err_fw;
> > +
> > +out:
> > +	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
> > +
> > +	xe_device_mem_access_put(xe);
> >  
> >  	return 0;
> >  
> > +err_fw:
> > +	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
> >  err:
> > +	xe_device_mem_access_put(xe);
> > +
> >  	return ret;
> >  }
> >  
> > @@ -117,17 +135,18 @@ int xe_uc_sanitize_reset(struct xe_uc *uc)
> >   */
> >  int xe_uc_init_hwconfig(struct xe_uc *uc)
> >  {
> > +	struct xe_device *xe = uc_to_xe(uc);
> >  	int ret;
> >  
> >  	/* GuC submission not enabled, nothing to do */
> >  	if (!xe_device_uc_enabled(uc_to_xe(uc)))
> >  		return 0;
> >  
> > +	xe_device_mem_access_get(xe);
> >  	ret = xe_guc_min_load_for_hwconfig(&uc->guc);
> > -	if (ret)
> > -		return ret;
> > +	xe_device_mem_access_put(xe);
> >  
> > -	return 0;
> > +	return ret;
> >  }
> >  
> >  /*
> > -- 
> > 2.42.1
> > 
