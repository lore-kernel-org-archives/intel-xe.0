Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BE15C4707C
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jan 2024 23:14:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D3F010E14A;
	Fri, 12 Jan 2024 23:14:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DADD210E149
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Jan 2024 23:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705101239; x=1736637239;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=5uISa8bJz+8TUJcRlcd81DPi9xuGol5yUJ4lMj834sk=;
 b=oGswK6BmiKdTaX2744PVuSkgvZt4ZOZ69QZzYrdLa9bvUdYsaFBa7PvC
 JQpExg6b4nEAGEwOmqv8sA5rykfRS/1j1w2dvxcPOftOSGQXYp5YvVI1b
 kqaxwTMNX4JeZYuwwiSCaxvcNSOG1Ll3G8+RclMCDDvEgzYjKrUhf3zod
 H4qkDfITBjQkybhftlXxacn+EgBZL3H8gvl3gSyMA5S4glpIqdgFLdR2K
 rzY4b5MRU/D+8ij4s6naS/m0csZMIJZYEBmkWxSgwc5NMCXiSqdPyMG/f
 1qbECbKRUDI4D4deYdnD4hNIcJSFv4aLkyZKaruCqEMi8kCGukoieXWPB Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10951"; a="463590214"
X-IronPort-AV: E=Sophos;i="6.04,191,1695711600"; d="scan'208";a="463590214"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2024 15:13:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,191,1695711600"; d="scan'208";a="25156069"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Jan 2024 15:13:58 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 12 Jan 2024 15:13:57 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 12 Jan 2024 15:13:57 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 12 Jan 2024 15:13:57 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 12 Jan 2024 15:13:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lhFFtV2q31OkW+CaDWnCnPjoME0AMILd/wL5bScZZp7csaMC9wa455EQlQqs8+oSBgiUCUic4v7bJpybJ9MY7PC/CtZ9tihYOt452OcahNTy2k2+2n21kiyPKl2IvZLbDYeg3AmHywHbQvrOXJXOQvI4Or/7/auAA5Z7xuibYcTIsJ1UAKrrbC8bKy51VW/7wzqdNd1jYVhgjNsvPpkw1iHcV9DEB3T//+K0vU7vkDyp8GljS8QJfpTysOX0dsLo2JbIdDaDrWcdRrakz3cRSvHNpgDVUlDR7Tdx34qhCYspUcPjf6mLGTMYB19ZjCwDuCiIUuzxWYjWLO+pJZ935Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kx/iiMphlJuY7nsiASbSExUclQi/FoeTWcHU/+HtBVg=;
 b=UdGRS15oyYLvYzvCXxbFkcIKBdMBC1E4IRXgFKF7dOyfXG6/Nlanooh1M6QrWMoNAus8vy9Rk8FjiuhEhhr2+9NPzy7W4nz7HAhulMa1v4k95mn3nVCiWt1a86N2wumSIZQg9jnUC3xFFapU/AV4purJkepJL3BYX+ksoF7rfsl79JJesbybG02EtdK+dlpXmHy3BhC4CkCsrYGzYv9sOJSxJD0C55HNwQKhqcxil158TSa62+HJihA0W/qbOdO6hpXkcIXq+YXiOrqO/noPRc+UpQ3nvBjOiExffWGhwhd7rYTcSt+m35nuQgAA7SNMxbnq7ElS0825dMRKbhYdzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SN7PR11MB8283.namprd11.prod.outlook.com (2603:10b6:806:26c::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.18; Fri, 12 Jan
 2024 23:13:55 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda%4]) with mapi id 15.20.7181.019; Fri, 12 Jan 2024
 23:13:55 +0000
Date: Fri, 12 Jan 2024 23:12:36 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [PATCH 2/2] drm/xe/guc: Add kernel-doc for xe_guc_ct_send_recv()
Message-ID: <ZaHHZNtB4ZEvMWJi@DUT025-TGLU.fm.intel.com>
References: <20240112102554.761-1-michal.wajdeczko@intel.com>
 <20240112102554.761-2-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240112102554.761-2-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR13CA0016.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::21) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SN7PR11MB8283:EE_
X-MS-Office365-Filtering-Correlation-Id: 989caa4e-4aba-497f-52ec-08dc13c425d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: P+SJjXysyJOV5X9N8s+ftoKPSqu0wI/y7zcMM5FTJwn1KyWIOg1ueEYLokcIS4K2VhElt7/UQklpZUELdHekpoaj2DRDXgRXF654Jjmo394+h8kbwsSGlmGCNcMecjtPL60elBQRNmfQMhdXVtmxUEUrBCi0PzTqTMag6k/HqwxUHWNn9a/A0tKdL3HvplRfoyWcoVnDi/liUYjnN4JyeUDLJWc+rMMlluUa1Q9sx3rSf0e/612R06ry/r0jyaBLB2MJasdGsJsHfgxNuMKAzKYL7VX+iNUy/+JiquJoEBqfsyThCaT0s8X0LBusRD3XPjVA8bk/j6qA25sCFI8NBORfawOEm8AOiQuCR2jl9P2pAnEXrkl71ARoOe0zU07pC0Dnkko46uwVqvWmpZioWW7T0KyGlGahH5yIwNostNMevkIhVV02S+vSDGkBeUDVo9hvjVWd3IH7kU2ugBtxXsnqYx9lVI9hitJNvzm0UCDZ+34jPdvjoI3wtnzMVafE9JDxTXpLiLuBD43b/0fHF2sjSy9/Yz8p67jEd6k+yV46UPqQ0eQOhfRoHHVapE9l
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(396003)(39860400002)(346002)(136003)(376002)(230922051799003)(186009)(64100799003)(1800799012)(451199024)(6506007)(8676002)(44832011)(66899024)(5660300002)(6862004)(38100700002)(8936002)(4326008)(2906002)(6512007)(41300700001)(83380400001)(316002)(86362001)(82960400001)(66946007)(66476007)(6666004)(478600001)(6486002)(6636002)(66556008)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8IKENZ4+d/e8YemBUpsvVf9ETUqouSwpUju6d1AzE+05/Vgg34jeDowrId4m?=
 =?us-ascii?Q?0eMMeQ6jkEt3TPZaATDDZ7OHzCHZB6rU8y/B/oqB9OvY2JyVUnCNL+qvMWXg?=
 =?us-ascii?Q?VjVpJ+GrOl0JH4xjzcQf4VoVifrFlR/LCoPbLtcjbuxwFUipD+D45KYsYioY?=
 =?us-ascii?Q?1ZMRlqXqokPrlmwPSSQGPAmWhG0gqdEAOZSNe0psXwLP66BEPuLjAgqw6+fN?=
 =?us-ascii?Q?Zd4oAm+isIUm+fG8XuDX65e2rdE07h3MqQJFgyUYr8FIu5vcr5+BWRwL4LmY?=
 =?us-ascii?Q?vqt6G0BgAx7SNc+com5PUd/iOwqeVeR3Pa9HkxdJjHDz7k5Tyc5H2pCTIBtp?=
 =?us-ascii?Q?9KO5WtbnWcbxnfePwvvlirsC1d3wqJnNkie12PXVu17/8cVk4rGughfR2Qj1?=
 =?us-ascii?Q?QkOo7Ky9RLA9cyf2Gd5s5tqU8lmAIJNdpvIuYzwBydimjTHyF5OsRqAOjskv?=
 =?us-ascii?Q?pM8SjiY7GHr/xcXoLKmr4SGSGrN7o8J11YWsNv7qznA02HMI7mFdC7eD8Tfy?=
 =?us-ascii?Q?sdvfK+g0pOg2BPwL1PaAbPzObrV8nwbhnT4r5intD22cZGtWi84n8Wh9qmIP?=
 =?us-ascii?Q?WsGtf6T2JElgcqg/3OaWgvRi5rud6OGKfeYznFB8fazh2UuNQsvTcnIxxKaj?=
 =?us-ascii?Q?opx/b8GDxdvA+qesBNrIdkJe4TCbvODFxeyBFwMl/thJhbpBK3Ouh3twdeYd?=
 =?us-ascii?Q?Wg+7k0qQBQH9IzS01Vhkxv0Ptuu/2yke/iy0QST4gN54vMQSYjJFZWRQEVcN?=
 =?us-ascii?Q?fdDLPXhSVPOfBLlQ9toQi931NJmf7ui92Wrk1fH5elujmnaBBiH6FlOAR4nZ?=
 =?us-ascii?Q?jpX8lMxU8SShg5YyN0KsF+/K/KGpZOKlVbP8tUlCj8Umz0XgjMlFvZ8+Tx6l?=
 =?us-ascii?Q?R+L7oHkOG6KY1ZKPSKFj8wuHFs8R1ZsBR/ah+Lmt1jIplZRa+Y3kzSYvf35h?=
 =?us-ascii?Q?mv0hQzO6CL9+ideNiTVPosbr90cVXEWKRQV7+cwKC4qsR0Wp038y9v9KFwIy?=
 =?us-ascii?Q?CPdd15djMyhbSdMYAvHtxh6SJMIZ2jh3Zbrb8Baayf5yywVu0KfuuY71LBkP?=
 =?us-ascii?Q?2U9ZRNfwkH1Si8ISVh3bBurol/6APzPg4Vc5H4E+cWcpt6zUKhsHU8gMkbA/?=
 =?us-ascii?Q?G+HZ/1AzX835Ib1AiacjwUjPwUzGfvmJMSoRr7nhROyMtpQwhB1zLEbFIYKM?=
 =?us-ascii?Q?I2gl+GSh+PYuW9p5+QTJy+LX6gatOrohlbSJ0ZrKyo2SdeVpTN1jKdgGks9g?=
 =?us-ascii?Q?1XHtojd2Gpbq+uZsf1Sch5MDPLKslXDff1GNMSilVMePCHGlaB3De7/ZF+xL?=
 =?us-ascii?Q?I/6xJQewzc1t4R9GZshdW6+ItS3W2l8TqgBKXmecQjWDXHySAzMFbfU8sDbF?=
 =?us-ascii?Q?Whr3vbHt42kdxU1KR9/mkyxQEz+q7HIx749ErJ87CjX9o7nUwt0HcQ+SHvdS?=
 =?us-ascii?Q?bKiAOwW5F+44Ra3XLJ5OgAkuE+dhsHGXB48Ydagv0uBQobwFz0U/JZifulBC?=
 =?us-ascii?Q?wOH9lOBtcy1rbKjiyx4RnBKHoNNvERrRV+mWiZTTP1ozU28hpGa5VdhvKFRE?=
 =?us-ascii?Q?448tshhv4g+3/OzToJkkaydu3MVGt1VwQv1k0bBZn7dech3ZuShYhlE12+d9?=
 =?us-ascii?Q?ew=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 989caa4e-4aba-497f-52ec-08dc13c425d5
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2024 23:13:55.0289 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: awxSkBlCk/jt8E8sNDMnWKdHqi1Y+BhzSOIF0quGBfxavM7kOJU4dCrWspF9hLKTwdcxZeSRlhWLf481uY3+AQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8283
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

On Fri, Jan 12, 2024 at 11:25:54AM +0100, Michal Wajdeczko wrote:
> The communication with the GuC firmware is crucial for the driver
> but unfortunately it has limited documentation.  Add initial

The first sentence doesn't seem necessary.

> documentation for recently updated xe_guc_ct_send_recv().
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_ct.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index 4ae1a0cd9537..ee5d99456aeb 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -785,6 +785,24 @@ static int guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
>  	return ret > 0 ? response_buffer ? g2h_fence.response_len : g2h_fence.response_data : ret;
>  }
>  
> +/**
> + * xe_guc_ct_send_recv - Send and receive HXG to the GuC
> + * @ct: the &xe_guc_ct
> + * @action: the dword array with `HXG Request`_ message (can't be NULL)

What's the deal with the _ trailing everwhere? Is this kernel doc link thing?

Matt

> + * @len: length of the `HXG Request`_ message (in dwords, can't be 0)
> + * @response_buffer: placeholder for the `HXG Response`_ message (can be NULL)
> + *
> + * Send a `HXG Request`_ message to the GuC over CT communication channel and
> + * blocks until GuC replies with a `HXG Response`_ message.
> + *
> + * For non-blocking communication with GuC use xe_guc_ct_send().
> + *
> + * Note: The size of &response_buffer must be at least GUC_CTB_MAX_DWORDS_.
> + *
> + * Return: response length (in dwords) if &response_buffer was not NULL, or
> + *         DATA0 from `HXG Response`_ if &response_buffer was NULL, or
> + *         a negative error code on failure.
> + */
>  int xe_guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
>  			u32 *response_buffer)
>  {
> -- 
> 2.25.1
> 
