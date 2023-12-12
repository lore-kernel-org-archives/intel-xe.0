Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA148C4332F
	for <intel-xe@archiver.kernel.org>; Tue, 12 Dec 2023 06:19:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7075610E0C2;
	Tue, 12 Dec 2023 06:19:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5924D10E0C2
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Dec 2023 06:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702361945; x=1733897945;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=52awDptUQ3rmq1ZiA88ojmrNama0pkfcUTQCiOGEmFk=;
 b=iVHEc/tVn2HgojLVIG9fergbsplnk+rVLgs3fzx/YajPHYl1VT5vENo9
 BAoN4m3uSTh20kZgqxfRuC4ovxS/Lm9jxRRYgwFVjwn7XSc+UiksfxdvB
 PypDQji5KLy89LEEYeNGJxcIzCFtRb5xOYXxri0z7KfHFChyQvl9XdCJz
 F1CatfxusOfgeFhLI0Q5+ZcJXhKz4v8g/wnT1Wu9I0Lsuq9ElPALVKmHs
 Y7CDc3c7jVq27noQf1/awZUeGi0y89bJ9xYoHKJJjWz591xg2dnlWUZKy
 fusYFjilFsAIJNXwmMjbWxivgF5tmHXBVGKlnAJ7G+9+fiAGNOx5Zf2Q5 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="8127740"
X-IronPort-AV: E=Sophos;i="6.04,269,1695711600"; 
   d="scan'208";a="8127740"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2023 22:19:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="807625909"
X-IronPort-AV: E=Sophos;i="6.04,269,1695711600"; d="scan'208";a="807625909"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Dec 2023 22:19:03 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 11 Dec 2023 22:19:02 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 11 Dec 2023 22:19:02 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 11 Dec 2023 22:19:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CVLlnjve/IDVn/154x0lbDV5XP2G+guGaXrF5GFrkVJ4Cv/+SIyWsj1rF0j3tHLoe0d/bT90VEko9AWwmkK79kM+7bsRv97dWBYuQt59aMrT1dLw/+eDNyPXRVC5ZZH3WRYjedWo6Oi2DxRzAoxYY34h5xgtVNjfzOJDjYOP6/LwxWKuWnloTNnO26L7lzO6m1REE2D2EXV+kp4sbyjIlyazuF6QmHOSPA9SlK+Oc302mx+/KJ6xXvB89FKnF/VVDqGxxQHHimrhOaMxNnwH8RNP7qjrXpYVP2bO7KoeFmlRofrIkfV6UemWMMZpvAD6fTmlmsneqa713O04qBT6GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eS533g38EdgH15nGUaWiyx1URdpKOs/YkcVtz2wSBh4=;
 b=eBif6N90lo+rKBsGyTdVO5/L5SEgU8lkuJ1yZDvWVZxfI3qzVoUTA4mpyYFkou1poF+7xtlNWMlu/Lf1jxFKouTZN0Lf7VzwOs6xWqVgUipSXZJd2fh8cqR/iRIzyadFFMiQ86Nm//Dtx8QlS8GYlMuuv9sdbyvZi2XOmF3oWi5pfVmPvMKl4pzdADd/QSTL+K/Y8aQjb/lj5nDvDsIW/cBPWYKypD0+aQzXEPns1LHrQJtwF22pO0ZickVvJspwZqQgNH76U33FU17L+D593gG8SdMN087hEYO1n9C4B1KC7tE2+ZmJcmQuJz363+oiJK9v12ocJb5ElfByIHAUEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CY8PR11MB7924.namprd11.prod.outlook.com (2603:10b6:930:7a::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.33; Tue, 12 Dec
 2023 06:19:00 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b%4]) with mapi id 15.20.7068.031; Tue, 12 Dec 2023
 06:19:00 +0000
Date: Tue, 12 Dec 2023 00:18:58 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH 1/2] fixup! fixup! drm/xe: Introduce a new DRM driver for
 Intel GPUs
Message-ID: <3dquhvnxk5xlmyei6374qmxnveshc62mh5vdemx62krqlqpacq@jrvgdlh6qzdc>
References: <20231212031907.1120896-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20231212031907.1120896-1-rodrigo.vivi@intel.com>
X-ClientProxiedBy: SJ0P220CA0007.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::15) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CY8PR11MB7924:EE_
X-MS-Office365-Filtering-Correlation-Id: 7219a049-5cfd-4fbf-e141-08dbfada3acf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9AuZWpCvbaI0CogVZr8zLZXhWtePmd78xUSnHOPR/YXO22r82w4ls9m+mB1Ca5YtCvESa1kS9FGmRspUm4ilUH55AKLmSOMSVU531kGPxqrBmNLuZpULh6KsCjUrC9i9F0BhMhFiP0aIwAXcXMRmUQH8GoRU/qVOG1su4g7+gycm7QNWiD35KnNTSHmawLRzMZ3qSnUmyIoZWrBkj/qN1UYymvYuLF+N6bHizw5MtRTLDESYWLVkZUm9d5gupCH5DWhXmS3mU/3NAIdc05g/6B4XmzPUf7alTg71SZP/v7hvOagpVUIBLRWH8LAGPqgNdDPWwuenifhWvEetdL8RMl0OIWhEzNWT5oGykvcW+nMmCssHM+Sl+ZrNL/lEQJWkfPMvIfQIndHmnF6C2y2Ly2n8aHwBnuw+AaM2vs3Z0oz429amswAnYTUsTgQOXqHwuJ478HeM+YUXvdGq8UFp2t5w9RaPwVbSvZrkzO5qh6fM8g780qVOKEUfHGE0FaIneyOKlP9xp2+X7Vg1aBt40zEfAdouK0+W89JNMbJEwF4IbUEUhIPZ0CAdZ2/y+fZ0
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(346002)(39860400002)(376002)(136003)(396003)(366004)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(66946007)(6636002)(66476007)(66556008)(82960400001)(86362001)(83380400001)(26005)(6506007)(6512007)(9686003)(6486002)(4744005)(2906002)(316002)(38100700002)(33716001)(478600001)(5660300002)(6862004)(4326008)(8676002)(41300700001)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+2tEtLhbnJZhNUuli04+26OyJeuz6HiS6BgNBa5giFBlmPuc24CZ4LFQQdbI?=
 =?us-ascii?Q?qTckRIkDWh6gUKq0VmaPZCcoJcWfvml/eWNjZKIUs6y2hiHCaiz0ipsjUzLp?=
 =?us-ascii?Q?3/bQV1qwKfw2+BAF89aKtOKmDRZsWJPZm50+8CQiC4ViMv6Kz2NNGaR6PYgE?=
 =?us-ascii?Q?+dLaDX+nRiz6vyNMa47qOLM7/+33VqkRI23wlAb1YG/m4hnBkouPr4Fhdw8Y?=
 =?us-ascii?Q?hfPE6oUcWW4JIa1wjNsMzSIQdqsyoTNsAeTlu/DjrLlexQb94arlQNL5wHnc?=
 =?us-ascii?Q?W/xdJZfMhv+bE6e6reYbbKw+wmZmXW8pZ5iq8iglmLlnOYXsf773Aqn5uTnL?=
 =?us-ascii?Q?HRvsLa95NLe/2f8W0HI5j9dqfamu3qBvhnxpyjcCvR+4CixrW0btW+aOW4y2?=
 =?us-ascii?Q?ig3sd7cLR3h//pK2Hzv+Rt/v3fJXwcPQXeOVNLq0GXNF48db138s4ZQfMMZQ?=
 =?us-ascii?Q?BjS9W0/7vY7jrtLm7zPNT2jO3HC9P1SWe1Q2eNPf4xFtIgUt/9oL6tT4Lke3?=
 =?us-ascii?Q?3P5wdNO398+CuLApSV3ANPfPA3U6P4jCmRVdbhn5JmXClMjelYwDeGexg+dn?=
 =?us-ascii?Q?/NNfE2Cbt1Em+MbMXSd0H5G61kFQeF0BWlSPUG+l6mYqG2VMGQhO4ENkz87l?=
 =?us-ascii?Q?2RZkhFr7zAXL7EFWgh9ueXgol1w9jEirAeuenww1M4HrXPpt2R+9rGPBD0GG?=
 =?us-ascii?Q?Q0Z7KL9sFsK7nk+R8GLdErDTyX5LSZIc2+4EPpnPNM7rP5fI0Fdjg+Yt01fj?=
 =?us-ascii?Q?qo58aNzRu9R8TjiN4G2JwN1Q58F5EBWUN7r9gpPx5CI1xFVUvupd4YMohvrM?=
 =?us-ascii?Q?rT+FOxdX0HN9GE0GRVjg5WrSVBQrVM+ERSjykAlY/G51xSEh1AqLxM9iP9qV?=
 =?us-ascii?Q?CEv+Negk1Os0fVOV3qXWAcNTKR0+woer2Ai31uXSsk6r+ILFk86yXHA4i0QQ?=
 =?us-ascii?Q?JCmyDhHU74BVXsCoT72JScO1wShItfr7XWNdBcNQU4Y+uMLJumwnySbd+JHS?=
 =?us-ascii?Q?2vxkC5Owx+lcbMjkJyT4MPdhbGZJlsd73D+QmLHZ1y4+K6OlixAlohBg9yzb?=
 =?us-ascii?Q?rUC/axuekTJ2pYDcvp48UB3EXVxsZUuD4H8tXW3YB7NYFa2AKzb8fnSsUd/V?=
 =?us-ascii?Q?E6KIDeUvz23QyrsOGmH4LGuWAUjjotVrBuQt1TAcpz38E2y+OQn49T34Ccwv?=
 =?us-ascii?Q?32t98U7XW5fdk1xLv7+Y+t8SgRoOQgsvhx8qJXf64TZGVKVsesReWaV9ohzj?=
 =?us-ascii?Q?GYd6qPVaHfweVLswUvnl0wIhpQB0VGOjqYcWHkS3OdO1bcte+5AREtcdewBG?=
 =?us-ascii?Q?1QXexgGT5K67BOGD+GlrRctAdpkC3WMc+raSJfzs9LKruxs/0P1qqvDfJI4M?=
 =?us-ascii?Q?AK650EWRwCpVP8zHMrlyiHINued4lUqi5smsXMuo+61Cy9fl2RA8Dd2MUzGg?=
 =?us-ascii?Q?v8ysc5BCx0iSpcIM/c4cWnt/mgLpMmlmfwserGT6WsG27lVa+axW8wzLesZN?=
 =?us-ascii?Q?mZ8Atsln/Mzyu77G4319r66R18byfNRznDut5y8DIerciK9i3tI95mFvITcB?=
 =?us-ascii?Q?Lk/vmzhqWyKdQHEHHkxWQbELVk1aQeZzc1zPF/bFCloNcyMcNB4Y0bgoSKI2?=
 =?us-ascii?Q?Gg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7219a049-5cfd-4fbf-e141-08dbfada3acf
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2023 06:19:00.0686 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MJticgXd44ViTMTrJpKRfBJxrN91xTQjceu3jYvn+YNeoDQ97jtqM1Gu6pA1yabzUJnSV7ojYTS3MuQFJ3gP/o6o0ahp+1Pk2OjfhX4d+jk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7924
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

On Mon, Dec 11, 2023 at 10:19:06PM -0500, Rodrigo Vivi wrote:
>---
> drivers/gpu/drm/xe/xe_pci.c | 1 -
> 1 file changed, 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>index 260e8a6034a7..9108e1d43c38 100644
>--- a/drivers/gpu/drm/xe/xe_pci.c
>+++ b/drivers/gpu/drm/xe/xe_pci.c
>@@ -375,7 +375,6 @@ static const struct pci_device_id pciidlist[] = {
> 	XE_DG1_IDS(INTEL_VGA_DEVICE, &dg1_desc),
> 	XE_ATS_M_IDS(INTEL_VGA_DEVICE, &ats_m_desc),
> 	XE_DG2_IDS(INTEL_VGA_DEVICE, &dg2_desc),
>-	XE_PVC_IDS(INTEL_VGA_DEVICE, &pvc_desc),

sorry for missing that in the previous review.

Since you are removing the only user, you will need a __maybe_unused in
pvc_desc, otherwise it fails to build with W=1. With that added (and
removed in the next fixup patch),

	Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks
Lucas De Marchi

> 	XE_MTL_IDS(INTEL_VGA_DEVICE, &mtl_desc),
> 	XE_LNL_IDS(INTEL_VGA_DEVICE, &lnl_desc),
> 	{ }
>-- 
>2.43.0
>
