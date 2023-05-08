Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAF2AC77B7C
	for <intel-xe@archiver.kernel.org>; Mon,  8 May 2023 01:11:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 754AF10E08F;
	Mon,  8 May 2023 01:11:27 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1120310E08F
 for <intel-xe@lists.freedesktop.org>; Mon,  8 May 2023 01:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683508286; x=1715044286;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=a4HLw6GoMc1uu3NGrFAs6hpIho2B0s07/Ublew5PW6o=;
 b=DicBdYR/9rSjbkiumFt5PHkL2CKWeSTw+BvNuN/mbLkXSjbdgoHhijk0
 2bS0D2vNG+oRRzG+zTatsj90OWRt+N3OWfmPaUpzPyMdrswSCG0DPcXar
 TGxIADep3yHhQbUn0+mb73BN19U6yCwdKTtsrlsf18040FyuiiHcaTO0b
 dYrrADsev/aTtvSosTKxcGh5bOV1YpC0xjY0aZmhLamAXMSTf4EK5amng
 O1FVI0YFJDMw2nwSXElbToCy1p76rn0xlHaM+iu9xtYzFZXklZO6evJZ+
 TNi9OFKvsTNltRsR5ZRyfuwNg+lFbu2G6uIexwJBxCnQCwM26Pjs0GW/i Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10703"; a="349558411"
X-IronPort-AV: E=Sophos;i="5.99,258,1677571200"; d="scan'208";a="349558411"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2023 18:11:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10703"; a="698325783"
X-IronPort-AV: E=Sophos;i="5.99,258,1677571200"; d="scan'208";a="698325783"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga002.jf.intel.com with ESMTP; 07 May 2023 18:11:24 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Sun, 7 May 2023 18:11:24 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Sun, 7 May 2023 18:11:24 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Sun, 7 May 2023 18:11:24 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.170)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Sun, 7 May 2023 18:11:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HC9xx3y4JtqU8cPVKBcdnmRZb65yWgmJ390ABnpFcxTORWFxIB0ShXtEf6B/UKznvgTZ0MNkbTxpJrLLldlZ3zKum76afoUfC5FjqDA/YcIv71JSVJKYhtrudi3QyVLhUJWnsr+zrPEbamk2osHuNE3eF1dy2CClGuIQEww35KPuFFmf2zZY3XavWsFNHr3dd7xuO/vLQNEnya+Z0FsvFAqpsjtYuFWW3i8o3XVO5NEauZjAEfYyOKbUa5l0UXkEqXCMEOEF4Q70apwsJkmzf1Kt70WtX4Vau0v/yuX0dZ1KNUiQIJVa7YtqBIwijYTW5MG/0swFOkVO308J3onozg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t4aLav669ZwpN6BpovCIpNodhQE+1o5paoPlFLKDdMo=;
 b=GCPwG6LCLIzI7NMcQFnJaZtvFW3mK/SMrcnl0xXu7oYwVGtYIIT7ReVJveTjimqsusjkWICCAGzDCQ/vWQeEiqfONw3PD0V0myNfBIlNfl4Hc8OcxZjL32JS2qe3fOdOhTGRUB17Y5Ig1aZdaeZzyFaQbIoEFfjbwKhGDKmDjHXmRdpUjNm6Nia8viy+/myH64Vww52pS9h2ei3FAIeTp+1KoSJbCrDtjKAL7JCupLAPEAsPHNrXRhW1Rx1uyWzl1V1YrYAOhTQUMJYQM5L9x7tEWZ1lPvJQqm6CfyEPvpiivJZn0EIin2GCwIlO1q1L+NKZ0WYvCJxR4PyUssVFzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA0PR11MB7283.namprd11.prod.outlook.com (2603:10b6:208:439::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Mon, 8 May
 2023 01:11:22 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e%4]) with mapi id 15.20.6363.032; Mon, 8 May 2023
 01:11:22 +0000
Date: Mon, 8 May 2023 01:10:48 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@kernel.org>
Message-ID: <ZFhMGOBuFUznJPk1@DUT025-TGLU.fm.intel.com>
References: <20230502001727.3211096-1-matthew.brost@intel.com>
 <20230502001727.3211096-11-matthew.brost@intel.com>
 <ZFVQfRnwEAOFiosk@rdvivi-mobl4>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZFVQfRnwEAOFiosk@rdvivi-mobl4>
X-ClientProxiedBy: SJ0PR13CA0188.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::13) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA0PR11MB7283:EE_
X-MS-Office365-Filtering-Correlation-Id: 234990f3-6384-49a5-cecd-08db4f612322
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MD2h1MuBJvMenaHgozIP+msX82nxL2Ts3ux9eY6za+Y2mbPKiu6qmTjx4zgvs5bHDSFYcBD3I2Op/TB/0Jdy3kSAJuhOYQcQqQzoDMnIBULXLmEFN47nFqjDLb9eDC95ljRJCi10/SpGrl3yHeGnmCyCB622P//VNfQTjrrGUudSITY4+nfeotqx/HfTotSVnStZbormtyKOl7Wi0VHDfkMesBXvvSIQDczOBaZ1KUvZzeXjhuyI09lOKdsDwLHmdy1LFurDPRzUm354J3wZxzQIVAMgWpS0zdQHUh9arRCPVLwsdfp1WI6a8cfLB8e4Dps13XqSKrogvB84XuewEki5J4obZ80Ysj7B5/G1sMC5qE3GUWgLS4Xaf/AKKBMWV+OhRJqJe80/B9QbTTB3HORWT0xsH6EXQ5WmJhPWQdBqvLntaWWC6rLw8ASY1w3AJXJDETFOcTMV3y2Kec3upP7dR6cGEZCmm+6alOdFhC13mQVIaEzClC+kfhfdgikBoeJozVbmIJe5sWI7S0NCUC6v/JDsz4AbnFQdaJQnR8+/w/vNGzjINqaIOuckRC4S
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(136003)(39860400002)(376002)(346002)(396003)(451199021)(83380400001)(478600001)(6486002)(6666004)(6512007)(6506007)(26005)(186003)(44832011)(2906002)(38100700002)(66476007)(66556008)(66946007)(6916009)(82960400001)(4326008)(41300700001)(5660300002)(8676002)(8936002)(86362001)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?e1sBnnwW75b/45Gh3qYq1Fmx59pKf/iVKgKf5SQzmLpxnBJ6rHtnlY+s6gJU?=
 =?us-ascii?Q?aRKDmqvXEmz5tfMHrDcmntNcHLF3jK53AKIwfExmGWQBCuR8XO594WX8ICe0?=
 =?us-ascii?Q?8mVsOHlrPcJmW4gRvO4XTjmWVMcA4sOT1NufcvGnpCvPAqSC3xyDm05m76Ip?=
 =?us-ascii?Q?g41bWfgVVyRSlX5rV3FtN/8fMjQSGTtRjsoHQRMej5plWcU0ablqgrXsr9pv?=
 =?us-ascii?Q?IaT2h0eMGllHlvupMviHV3IZf9+rxt239lCiAV/mlVoL7QiT4chYbSztRmw/?=
 =?us-ascii?Q?X5D5keF5fQS/rxqEz8zagTHwzXdfp09146q780Z4UoHkgxiNPg3wWimksq1U?=
 =?us-ascii?Q?BYAkjffa/3DD70DDACI/80kLsHMElbRZph+1iOMwYwcwp4WcPSjtDsCKUhVP?=
 =?us-ascii?Q?Ma8La61Po6JzPwyl6QlAMxxjHetV4QwMmL1EMbKzf9vl4bnhaBb1mwn6oZrg?=
 =?us-ascii?Q?SDxwc4J7ZeYDgOGnoTH00LNtGtgbGwpnmASCg9U/tBfDa9QvXjKtDKpjKgTb?=
 =?us-ascii?Q?XzEBBLoZtdxENLkVP70DnOunQDAmF9rOOxeChSTzpMkVe5/kaq+Dj4TanwO0?=
 =?us-ascii?Q?BCas3Kk1gelbwbTxaOVwnuCMR6uAECUlIWp1O0ASRUKfbazH4zD4WG/RPnD8?=
 =?us-ascii?Q?i04mRtQqUPUsrWxB9G/l83jJr1IqMFEI8YKB4gSYJgF56xoLIP8ZEY4RldV2?=
 =?us-ascii?Q?eH5GNHbj/XAUA0xtfckNxLxthauZ1I8W+Ti1QjtRtcrgezvsLODqQbbVJJ2w?=
 =?us-ascii?Q?hGNJ5o2gq7WgDt+oUCw9Q49IMmlxPOmlVvCrxypUVoHokGQwZQ9X3ab+NGvd?=
 =?us-ascii?Q?UX1/AHiez/SjvCiMvpP4H2rMllweTBWq9u708YU0Q+dWUg3fHuzdDDOeDROb?=
 =?us-ascii?Q?wCH4bMRHbN6vaSiOD4JVDMs/ezJP0/ADJrIjLUzM9S4/N0ypr4TtK27xIkDx?=
 =?us-ascii?Q?etqJyGKue2VXGExh58VZ4vvgKFJVrq1fAqhgU6+bO+ZhP/HbNx1HfqVY2A3S?=
 =?us-ascii?Q?FregYNqcAEBvYuW334q4El5EwCSionflsR+OD81TUL6JDZk8PxcBiA3Qt6QH?=
 =?us-ascii?Q?SH36NRlBw3u9EyeX/Zm3OkCbSWF1P8sgbf5kBRCSvCfAqY0LCwTv2UX0XhUr?=
 =?us-ascii?Q?RLDYbrKUXjCYEfHHBSO4bKKEq6S4QOu0fLKVk8ZNKCuPesbUJ8sRI2TLUTaa?=
 =?us-ascii?Q?xZ7qcsuERzxbBdjB4YzpsOTqSsc0bVOMkCrWaqZKBY4dGchWX3X1S5dT0KP/?=
 =?us-ascii?Q?+c1pxVi/arsNgfvxE7UbfK9UNAFaJ7B+CD4hUhM1IIBeUMpjsRbItmbbEtbg?=
 =?us-ascii?Q?BQhRZPpHqKYBky64TDDNnZz8L0CtzloLgqVXRT7M0hJIp4iKa2HigaI4jgr9?=
 =?us-ascii?Q?ZKh5BcJO/CVEqsJ4JP/EEE7Eu0laYkXe7nXeyeyu42WI6g8wccgcTtZ7JHGi?=
 =?us-ascii?Q?A7ReBjxifdZMpOv+uiR2HBoRPMUlgDIoIqR+TgX0IYWV9iurciF9gN9Ixhbb?=
 =?us-ascii?Q?cTHvY2BMDB6iezg4AcxQekmG80NHjloR85YLpE4AdVBzFe1sjxGwVC72RZHr?=
 =?us-ascii?Q?Paf8LcjZ0P7CVYe3Vr5tGb5BARjYDNtj6ajl/lUpjPmv9/6+Vf/sINu5kMeC?=
 =?us-ascii?Q?6w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 234990f3-6384-49a5-cecd-08db4f612322
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2023 01:11:22.4330 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a8fAmE/V4Zpgq4DX3Whd7Hjta+GO0QPZdKMqWtADr1jiAwbNRMVXBLbz8s/oi5De/QYsfnyCUH0jSfUEP7yKQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7283
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 10/31] drm/xe/guc: Return the lower part
 of blocking H2G message
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

On Fri, May 05, 2023 at 02:52:45PM -0400, Rodrigo Vivi wrote:
> On Mon, May 01, 2023 at 05:17:06PM -0700, Matthew Brost wrote:
> > The upper layers may need this data, an example of this is allocating
> > DIST doorbell.
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_guc_ct.c | 6 +++++-
> >  drivers/gpu/drm/xe/xe_guc_pc.c | 6 ++++--
> >  drivers/gpu/drm/xe/xe_huc.c    | 2 +-
> >  3 files changed, 10 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> > index 6abf1dee95af..60b69fcfac9f 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> > @@ -25,6 +25,7 @@
> >  struct g2h_fence {
> >  	u32 *response_buffer;
> >  	u32 seqno;
> > +	u32 status;
> >  	u16 response_len;
> >  	u16 error;
> >  	u16 hint;
> > @@ -727,7 +728,7 @@ static int guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
> >  		ret = -EIO;
> >  	}
> >  
> > -	return ret > 0 ? 0 : ret;
> > +	return ret > 0 ? g2h_fence.status : ret;
> 
> The problem I see here is how the upper level could differentiate
> between and error and a status.
> 

g2h_fence.status is 16 (can't be negative), so 0 or greater is a good
return.

> should we convert the functions to have an &status argument passed in?
>

I like it the way it is but don't really care either way. I'll change
this if you like.

Matt 

> >  }
> >  
> >  int xe_guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
> > @@ -793,6 +794,9 @@ static int parse_g2h_response(struct xe_guc_ct *ct, u32 *msg, u32 len)
> >  		g2h_fence->response_len = response_len;
> >  		memcpy(g2h_fence->response_buffer, msg + GUC_CTB_MSG_MIN_LEN,
> >  		       response_len * sizeof(u32));
> > +	} else {
> > +		g2h_fence->status =
> > +			FIELD_GET(GUC_HXG_RESPONSE_MSG_0_DATA0, msg[1]);
> >  	}
> >  
> >  	g2h_release_space(ct, GUC_CTB_HXG_MSG_MAX_LEN);
> > diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> > index 72d460d5323b..3d2ea723a4a7 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> > @@ -204,11 +204,13 @@ static int pc_action_query_task_state(struct xe_guc_pc *pc)
> >  
> >  	/* Blocking here to ensure the results are ready before reading them */
> >  	ret = xe_guc_ct_send_block(ct, action, ARRAY_SIZE(action));
> > -	if (ret)
> > +	if (ret < 0) {
> >  		drm_err(&pc_to_xe(pc)->drm,
> >  			"GuC PC query task state failed: %pe", ERR_PTR(ret));
> > +		return ret;
> > +	}
> >  
> > -	return ret;
> > +	return 0;
> >  }
> >  
> >  static int pc_action_set_param(struct xe_guc_pc *pc, u8 id, u32 value)
> > diff --git a/drivers/gpu/drm/xe/xe_huc.c b/drivers/gpu/drm/xe/xe_huc.c
> > index 55dcaab34ea4..9c48c3075410 100644
> > --- a/drivers/gpu/drm/xe/xe_huc.c
> > +++ b/drivers/gpu/drm/xe/xe_huc.c
> > @@ -39,7 +39,7 @@ int xe_huc_init(struct xe_huc *huc)
> >  
> >  	huc->fw.type = XE_UC_FW_TYPE_HUC;
> >  	ret = xe_uc_fw_init(&huc->fw);
> > -	if (ret)
> > +	if (ret < 0)
> >  		goto out;
> >  
> >  	xe_uc_fw_change_status(&huc->fw, XE_UC_FIRMWARE_LOADABLE);
> > -- 
> > 2.34.1
> > 
