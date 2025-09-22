Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B284ECA100F
	for <intel-xe@archiver.kernel.org>; Mon, 22 Sep 2025 18:18:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78FE910E13B;
	Mon, 22 Sep 2025 18:18:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eQFyewnc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E62DC10E13B
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Sep 2025 18:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758565126; x=1790101126;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ofHioFqsxP5KFNxBxZPuHt6ah2DXjBs6rn9PwJ0NUDM=;
 b=eQFyewnc8by8fbglAxsFbLeoJiNvvSgJps1Fkpf3L/wzDxrhoaBFPoo2
 tuwEl6RGbpcf4M8lbTSzp4S6AiEweJnPRBRcaCuNEtiqepCFChmAtQVhi
 0RgZOFYTimH8UbW+v/jwhrV+tsTiguMdZJIN2VWQIkqxrv7QWP6qyZpxv
 gUc27ohWKDJC3AZOqxvCeEBu50dA+qXisiI7/Kp7QnQ9a0bMSLCtYsQ2b
 /qkjqcs+hEI+UxylucnEvi0QWgvqNgeIByMmNAGy53RPPgMfnJOSX6xmE
 W83+kH8+9LIQmfQHWzSqs4UHCtA+2TCh9KhCPYQbz4bLaY5aihPF0VRUJ A==;
X-CSE-ConnectionGUID: aU0bj6LJQumf9+ZdO2WMMw==
X-CSE-MsgGUID: ElC7b1naTquc7SDqoG9vgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="71080532"
X-IronPort-AV: E=Sophos;i="6.18,285,1751266800"; d="scan'208";a="71080532"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2025 11:18:46 -0700
X-CSE-ConnectionGUID: VLUUalMpTQCH3GFWUPw+Kg==
X-CSE-MsgGUID: Cjpc62R9Tq+Jfm/lLJB8ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,285,1751266800"; d="scan'208";a="176371304"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2025 11:18:46 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 22 Sep 2025 11:18:44 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 22 Sep 2025 11:18:44 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.47) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 22 Sep 2025 11:18:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PdqbLV32AHlZ53I3jjEt8/oF3swauAgBgY8z3a74lrV80GxHiqna2heFikXWT/65Z+EvOemQzMD8i3i8XgC7VXWnvfybYmodGEMTErurs3KQL/85REqiY5TmsLAXvH41Me7/BEihSN13styedMwM2x4gzhIE5mFhN9dYkcVeNDa9OAsFx++XjR0Y6OBBPeMXgfIGoVYAM1JMWUMQwIuMn5yuBOx9XNemhTfd3uaWFkCOxIpYy4BxdA38CVvAwgFDDhSyr/5F7g2Iyvr8sUSZWN574dhOKuBX5nrXs1gycdS+O8/MuDsGiaH57FcahyydN3WF+fD60YQUoIinO7Zerg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Fl51BJStzQDzoL6x8t3J28XBvv1c1r9puT6X7Yp40I=;
 b=R1yIQcwR9khOvtU0iavxr4ZlrEnzXdaqChGmUW5x0mG0nDKeYRHtd698DevGPkeAhlEJSX51zSxXmUppo3/sBBtTISd6fey4NqY8kC6BN/gj7gJcD8CEc4ZfRtaUYB4bEJgQunOcvKCi2Adp16fGn0kbg5WQwv+TpLBEDj4ycHeIcRCLPi73atmictpsqSnG8AZcrcHOfoEXOhDpoDsOg/xfu7pEP1oMgNEe3U130NvoG+M6Dx11RQdTw9zgs5Zb5Q4IJbMYw3MJSra6HImgfuC1OMX+7wkXsOk5VOcjuGxuRQs6Itxbaki6mu8QSCDKAMUZQaVaJ62GFEAYvfb2Sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MN6PR11MB8196.namprd11.prod.outlook.com (2603:10b6:208:47b::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.18; Mon, 22 Sep
 2025 18:18:41 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9137.018; Mon, 22 Sep 2025
 18:18:40 +0000
Date: Mon, 22 Sep 2025 11:18:38 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, John Harrison <John.C.Harrison@intel.com>
Subject: Re: [PATCH 4/4] drm/xe/guc: Increase wait timeout to 2sec after BUSY
 reply from GuC
Message-ID: <aNGS/jB1NqMBCCAj@lstrano-desk.jf.intel.com>
References: <20250918073002.15242-6-satyanarayana.k.v.p@intel.com>
 <20250918073002.15242-10-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250918073002.15242-10-satyanarayana.k.v.p@intel.com>
X-ClientProxiedBy: MW4PR04CA0268.namprd04.prod.outlook.com
 (2603:10b6:303:88::33) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MN6PR11MB8196:EE_
X-MS-Office365-Filtering-Correlation-Id: a26286ba-a497-466b-8833-08ddfa0474e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Z0ezujGT01nUrUx5W5bpugart0MD6U7fy0Es1La3c4DWS0BUVFUXK46sTVmW?=
 =?us-ascii?Q?4tIgdhMw7ImNvtF/5TIaN3yl91+4Ojd/UQbMBhdc9X6KZzKS+DRFlbzmg5kV?=
 =?us-ascii?Q?B6zNNETqmLprLhM/kiGCAGEi+vfde6nR8ehxSp5bm4UXEbRHHt3EIuMJxsqj?=
 =?us-ascii?Q?7G0B9R7U0Pwj0/fn25znll+YVEPxP76vt0l7VPKdcJtrDvmz48aNUt+LU7Kb?=
 =?us-ascii?Q?cXO/rqtIx9wyDC9UdSqrAJNmaxHkYGS71PQZiy6crN0Il0Bxi3mz8f3qLVIy?=
 =?us-ascii?Q?qcPeAHSwhKQNq2GEBDi243g113b0WvcRfPue4l6mRKuIEth/57MkJ9/WVoo+?=
 =?us-ascii?Q?SdbMndhX2xbqrOzUBzT0tRrF1GcKkS0Abn1DhX89A3+adv0lZnYIaCXos5tw?=
 =?us-ascii?Q?CEaf/DW6iZC9Ow8ZKjranB0viw7ShvcSSy+qDK+uw6JaQw0B8l+85msYpMMv?=
 =?us-ascii?Q?ESXxP3q+t5y1JhzSOhEfsUWYS0UiyjBJdyQfr1A2oQwz1K5AT7tRlYczWYe/?=
 =?us-ascii?Q?OqKjfiEns67K/euroxafgP0oNl25Rz/RPgYN3kygLkpfTdG9S0M8h2fyXIe7?=
 =?us-ascii?Q?AGb+6/ZB7LnvJ4mnNTrSbYbW+YBiO4qNMSDD08II/uE+66QfArdnX6sYvr0H?=
 =?us-ascii?Q?WsspPv1uZ8cHjxmz9sRJ/TbK/1jjeqN+5/4KMJM1p/2arHE2k+Ax05Qnjdwu?=
 =?us-ascii?Q?g9XJUxEU+OADftaT3GJJF/O/NmBqEaJoPZ+Y1u8CjsiinAXJnX8HHjJA7lkr?=
 =?us-ascii?Q?8eWm0jkxbQWYJ8mB08csuvYnKDJ0mN7jgxdDr6JmKCkfQT8iL07TJ4MiXdNY?=
 =?us-ascii?Q?+Ar6/gNEsjrNaLQQhg2GJev0FCm/ap2rrc7uT3e/TgUJfkvvsQnBnDDthkGy?=
 =?us-ascii?Q?A+lMC5ZGTDXjhC1NSDgixIdtDazTVkYqhVPFISf545IlsGfx8FmUsKq8E+YP?=
 =?us-ascii?Q?HBI/NAANxWadUEAr64N2i3cTBXapvMJEJnYPBRT+o21CVlz5qntGFr0UWtzb?=
 =?us-ascii?Q?03om2O9JCkeugUtY8n7lf97sUtFo4uPHpR1rXSrE99LEqVdSpe5Ttt1E4dj/?=
 =?us-ascii?Q?uTEvky8frJkRWHtXzt3ZrOK1Ch8zB+4zrSYA2shZv1zfotMVtaksxHyhcfsd?=
 =?us-ascii?Q?7bWCYFbbNEA9uVkATEQdqvVLLP4NmRhbZycn8MCiG3Yd4l6U/VMw6PKnSvTu?=
 =?us-ascii?Q?yJrj4SzP2b/ulepTit9/2x2Uu2XEHFLYsj2ploA5JCKDm4VCCpfffpbBvzRD?=
 =?us-ascii?Q?OVowK4FvGKPtV3IeOv7bi7f47eWgh24urlXyKj71ND6VnPx2AEJlrvtyANXZ?=
 =?us-ascii?Q?oo1c9hzBOMt+PxlAOjG1Vwo6SO1iDwyUlu89W+IW++T9DEf3c05Mj80ljyrh?=
 =?us-ascii?Q?hvwJdRgSA0ZW55ZCY/uw+8Nvm89MdC3aiEj3BVq2pYWrFVNwoTXkP7fZRfP2?=
 =?us-ascii?Q?f6tnlPmbf0k=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wpWsddCXecFas3OItVr5hDgaAU235IVGRSKLKgKUxbH3t0GLZkQSST3TCnET?=
 =?us-ascii?Q?JGQYA4fYgy/teTiywMjJ9HCo3oU6rVnvDOABR9+lktRALU0Ui09rEOUAN25a?=
 =?us-ascii?Q?LNk11T1Jedy6jG64xkWVZ/K4x2Z0Uxpg1S9wmKSi7c3HjpBOntQI7ZF39exP?=
 =?us-ascii?Q?a4+R+DhOPu2sS03fkGWTAO0O/GRtpjMR2hjcxaVXdGPWTm7GH+6gB/cbyOyS?=
 =?us-ascii?Q?5aY/uY153okbWMoGe5v+26j8hLeDdUytd7Ua45eBhQUgEoVKFzx0ibaJyiOk?=
 =?us-ascii?Q?H7CRHegtx1SOBxwG8tbJ+ftP36Ok+5sn14Oq1vX3K1qTGl1kT+ikm5to2CfZ?=
 =?us-ascii?Q?STvNpwHqrTGE4I8OGsg63KY19aNrCbY7V020+kTQO0ebw0wD45VCNj7G6so1?=
 =?us-ascii?Q?cJhS7omsglJ+6uCcbg44htq2nWFsR/M5F1N6tVAcLRcqgxuBNZXlV2gwyWnK?=
 =?us-ascii?Q?sckLU2jXLF+Xz6b7sij7MxM9SxWca4yC6JF+kaPI6iuyqo4NQxVqYIWRcksY?=
 =?us-ascii?Q?5KfFVBCwq5PQRv1XIza6EA1N3J+X68IF30lgvzW5+HQjtr39dwKcKDPY/A7W?=
 =?us-ascii?Q?sDuJyCPCpaui2+5Uz/OIkokXROPMIe0NoUQm2SoIh1GnuCeCJ0bhedOITD28?=
 =?us-ascii?Q?qi53kc210ur073wHOTcWb7qIfRV0kmJGJaRyZHKqtFUkT+c8urfKRYB04Fjv?=
 =?us-ascii?Q?ofIYays+t3ZpPS/1mfwBFdeBNcY6T1oynU9lKR8vL4VfEj0wmHUuJ3jMKwei?=
 =?us-ascii?Q?oRzLvHnCRfNVg9Klf6lBhrg/x56MWo/tGjU9avUNfAdkCAn3zLuDHnWzAG37?=
 =?us-ascii?Q?C0ws/FeIe8ti0jkm+0bumRqnENKHtrADvunfDn0dAb2yNpgsybwlvSjWBy1s?=
 =?us-ascii?Q?fP0lUTGsnj4m+KVMd84a7PDnKZvUYrW1KOgONTfFIy+TtK8bcA+QNnxamD/m?=
 =?us-ascii?Q?B7oJwuorg030kAYuCX3LmZW0j9rO/7o0se3N4dUF2Ft/bRNMYRBuxXiymmal?=
 =?us-ascii?Q?3cG/VAuG96t/AoS3jMTNkIxdBO2xuCTvG+b4oB67b1Z5EeREDg3xUllifFH/?=
 =?us-ascii?Q?vXBrK+mOSU6n73CLZo+DIR35PG95DkcUtXgFkil0G41gQR9mI4+pHHjPkmJj?=
 =?us-ascii?Q?S119HAHd0tbxudF7li314FQh3xUyGWjGSzcMpFukOPmyh7q3y/6z8/A5dfzV?=
 =?us-ascii?Q?AALkbGFo77nZ23zOb1he2dD8FCBc72cT/OdeXz4Ql18YCeL9RFOfhowuQwKJ?=
 =?us-ascii?Q?8ZBgdUI/XJv7vPqUSfOeMTcVxhXIRkDhlU7RMv5jfBvOREoaMZ6TnqmYeNBF?=
 =?us-ascii?Q?C3xdV9DPcVxSzORDSFZCYH3sy2YN/eK45OdFHV+Y0RB66YrBopwpC9bGom2L?=
 =?us-ascii?Q?KCjqI3s3cWnQZKLsAV0O+XMUguWVVNFfaSWZM8cc88hM7th9cMNcB0oGviwZ?=
 =?us-ascii?Q?vgXSwGeUfIGUBEj66AW743pZTdUgK965/J21HOV+SaSaCYzKMIqkPK8Hq6ZF?=
 =?us-ascii?Q?MK2m60jW7KY2o/hBVDWjTNZ8Rpcxr6aWmh9Hi+HCHxirki08f1jMFYyijAH9?=
 =?us-ascii?Q?C6RxcwFsUiPSvIfZ+oQDfQsTR8Cgrr5ie7Ei3FxdVyALQFR45elhEDNKa59c?=
 =?us-ascii?Q?Fg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a26286ba-a497-466b-8833-08ddfa0474e9
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2025 18:18:40.6367 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aNstlIyG1pElngIwR3BuLWT8+5eyC43cgFR9762kQQ08kpa6ujugOCPcH6/lLq9ZiLkedmSvdvT/q/Vqr0jaQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8196
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

On Thu, Sep 18, 2025 at 01:00:07PM +0530, Satyanarayana K V P wrote:
> Some VF2GUC actions may take longer to process. Increase default timeout
> after received BUSY indication to 2sec to cover all worst case scenarios.
> 

I think we need a little more detail which actions take more than 1s to
complete to get a full picture of the proper solution.

Matt

> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index e56c9c5c8845..1f67317907ac 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -1469,7 +1469,7 @@ int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
>  		BUILD_BUG_ON((GUC_HXG_TYPE_RESPONSE_SUCCESS ^ GUC_HXG_TYPE_RESPONSE_FAILURE) != 1);
>  
>  		ret = xe_mmio_wait32(mmio, reply_reg, resp_mask, resp_mask,
> -				     1000000, &header, false);
> +				     2000000, &header, false);
>  
>  		if (unlikely(FIELD_GET(GUC_HXG_MSG_0_ORIGIN, header) !=
>  			     GUC_HXG_ORIGIN_GUC))
> -- 
> 2.51.0
> 
