Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60271C44515
	for <intel-xe@archiver.kernel.org>; Mon, 20 Jul 2026 19:00:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CDFC10E107;
	Mon, 20 Jul 2026 19:00:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TYbWuXSs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDC9210E04B;
 Mon, 20 Jul 2026 19:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784574018; x=1816110018;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ckE+ecgQYw3IciVEtXg5B31BxrS6JR4246Q7JohlEA8=;
 b=TYbWuXSsjs+TOPcsVK9lXCwNbS9lbO+aX6+mjtsPVNu8OlkNkOyGH77f
 BK+w2w5RHl2ibiBiyOmutfn3F8Z0RV+rImNnkDO6TQbeGiqhW4twDjV9Q
 B4Je8AO9EUiiuT0PIFrgrBHOKNVeHQfbT316jgpPWjQeioZh5ZZNx8ffy
 7qJmFgLNNS5zwAr6nY8rLae9pdbxKY47gyoTQ+rPwtDzZeU3ROjCXKuw8
 lpDpbvwe+T1ZaGObm1T8NB8vc2bKXx/zD4LAK0whNghBnBibMM1dGRrXP
 YEI8YXEhzPoUsUvpovmeknbhNLfFiAF7+mJtcOqjomL6UPy/9v8lXnlq+ A==;
X-CSE-ConnectionGUID: T+WZGxmOQBC7lJzTROLyAQ==
X-CSE-MsgGUID: 0oYepJduRn+0Oxx8X9iWrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11852"; a="110716775"
X-IronPort-AV: E=Sophos;i="6.25,175,1779174000"; d="scan'208";a="110716775"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2026 12:00:17 -0700
X-CSE-ConnectionGUID: mpK3+pFlQ+OxKu/YnsSrnQ==
X-CSE-MsgGUID: OH2VhBRFRgypj7YS/E1WKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,175,1779174000"; d="scan'208";a="261332434"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2026 12:00:17 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 20 Jul 2026 12:00:17 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Mon, 20 Jul 2026 12:00:17 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.41) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 20 Jul 2026 12:00:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fxfrh+s6PTnHFD0Rd1vE5b8JcMMowG4pbJKwqmcfQw96jdeo+BrjkMYyj+ujpGkhV11HMQecRva9/fMdWaxZsY8AfA0T519/4Bw61jbqx1A95X3IAdRHCUPdqCUL98br3ZkpBimpK55WAuU8YDNzmljCxxjOE2SBhiK4le7COanh4qDjfgyBoLBQ/DnitoKgmZfLdXdssy8vOZ015BnquHDN8J+lm1bCOQqztwX0zK8dWEt3wsKkUNvFKyxPfGqHfmEIuQhftSO6PDbIVwNa3KV8F5grJTmqyDT+lYOGHEQlDzEbMO7oHk7iVuP6fmrBZRqaskKxWacVuARAgg1kLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ms+Zl6l21bITw0B3Mrv0vLvanyX/F4m/vOF6CLt6Q9I=;
 b=cU6Z1i1yeM7W1rQxPb7q+5OFUclGj9UD692uE79IWtVnjPAiOy9XpsmAEgx1Fpgk97HS1MPYt0QxDLeZ1u/qlHF7dCdWGPemEPAk2yZ6HkoVLJ+WTfbiDkcyaWc/e3fGKFyjnInbOVIcxpPxs3o6gtC2wZzkyT8Imxb+PC+K8P6GSeQvBDjGfe9E62MAoahrESMp4YU3qHLtZPMBcIBW/5tHF463j08godK1U6L1ALBb/+/QQE05muJSL3+UGJXrmxSuy459GJhIRv4W1Aa/WMiZEpVOlB12lFlXI8CU4nh9cy7PmGaiauhBNYp/hWWDIYx7ONx3pf0+wWxWIJS5qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW6PR11MB8338.namprd11.prod.outlook.com (2603:10b6:303:247::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Mon, 20 Jul
 2026 19:00:10 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0223.017; Mon, 20 Jul 2026
 19:00:10 +0000
Date: Mon, 20 Jul 2026 12:00:07 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Maarten Lankhorst <dev@lankhorst.se>
CC: <intel-xe@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 09/11] drm/xe: Raise gt frequency slightly earlier.
Message-ID: <al5wN5Oj7eR9JYVb@gsse-cloud1.jf.intel.com>
References: <20260720161451.384968-13-dev@lankhorst.se>
 <20260720161451.384968-22-dev@lankhorst.se>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260720161451.384968-22-dev@lankhorst.se>
X-ClientProxiedBy: MW4PR04CA0091.namprd04.prod.outlook.com
 (2603:10b6:303:83::6) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW6PR11MB8338:EE_
X-MS-Office365-Filtering-Correlation-Id: bc4c6953-5a1a-468a-c919-08dee6911f15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|11063799006|10067099003|4143699003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: NeAddU497gxPaMAXeC60xjlLKveK7vK/4r8uy8femDQBqsG+EZEvqeMpXcnoQ6h92A8Xoumm1F386hVS+7wpCPs/FsGuEIDCXF3+W8mTAOp3tp53teDHcKq9zMt5YM/1M8CoJBom+AcJjM0m1xxmNMPnhiEHBmnU7zC5LIh8RFGv5iX2BBkFltfYeuWdXOsWk6KSmMIr2qJVHvGqKYpP2NUbp2Z6kennj8P4NEVPN7EV53OfEw3MyYd5uqZiK7lH8UgZNGe31UcJS/1MUqgL2h+mnN/KO3iQSxWOhdAf8CLSXvz5h/TcV65ghSuduuQPyMBujlnvIF/eWtVoPsBzs4c++vv0UfgC79M6ihZswUYUGIFgy9dVh+rtMOWDU8kxBMnB6wqSzY08L0CB0BJBE66VvoV/PTfYCLIXtKeQrrpCRzpmDXprtc0Hv4rC8UY+JR0XO/XGAWAf/mEF7pZ5Icp3Xhnevr3cCU95NeikL+vua3BA1afXoM3QN2utDhe6+vYscJwdOMB4wnDz/3HPVIBK1BN7FfPqPEAG0waFAbKPpy5ow8nU0tlvIPZ5h8ha7sJMPcaR6u4/8Zv+fXK9kxki/ltJ2tbE8ygSWGzj/+GLU7KijnJsvBt4ZCq+wLU8hV8Lp95qmH2kVAVrlf3pFz9XtQ7cfZ9Ks9imkFfSfd8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(11063799006)(10067099003)(4143699003)(56012099006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xjZ6h+Y0ZFXnwDnchJuJEGBLp+AE0MaD66vi6+IDXgvBJN0R5CN+SeTPhczJ?=
 =?us-ascii?Q?Zwghp6IzuwinbQI9kjChE3xTla6z+j+eUF8X7ujtZ/moob0+OK1CBrarWWxH?=
 =?us-ascii?Q?dISqn6xuJo7Rq6SysvuWg8LlghoapbGHqKFny0NirvgenwaSwpD+x6TbEh8M?=
 =?us-ascii?Q?loSdIhdiydZUuwix6QRwbny/gETa0t7OtDwhu4sNZLDHEzffHjGNAxTS1vzG?=
 =?us-ascii?Q?Tho0kZgqBjbahD7+IyfbtcqebRJPzXqJ6+0WIMBHOhu7GYupGtpCdj9GX5iH?=
 =?us-ascii?Q?6GX+AlzKIy2wygO1aCxTM78KmwZJ7Dr6ImW7ijI70GJ/5eDuZdY31ZCjEmeX?=
 =?us-ascii?Q?A5Ml8pgkdTwHge3LltdXmwaMNXFgPx4//0XNdcojJ7ue3B1QfkqUkLX1Hd+T?=
 =?us-ascii?Q?piiQC9ZSqc/4Wjh4nMcO8Dkun2BNXhlD1a3Cs96eLiqI+dWE4DhVudedK/Bl?=
 =?us-ascii?Q?zYFFIgqIMayn+Vrcl/FTENP2lVhZ/coXIbiy75Ar7aRJAQcLFFnLcugtd5SL?=
 =?us-ascii?Q?cJFvjNMWd+K/+q+JOIjfip655oR7BBI2K5Ok9NuxHuA1OwoTnAqReC1LLMIp?=
 =?us-ascii?Q?g5WIZ6Grzlmcn7nrlT9hDBzySpBbqM+jnBQsgKKZdAE5FUwZ18eVC9K6S78m?=
 =?us-ascii?Q?tW9Y+ei7Ze96LvBLxEQYDiNHYU4mGyW9NRbhw6zomXUIz+q1W/rSrcabtneS?=
 =?us-ascii?Q?8CcKExFPRfQ3ErGybGs0YtriyZM0BCo/niUkUMtFRObHnVREjwn6kk6lW5SS?=
 =?us-ascii?Q?2R+csDhUI2xXUfAvWBeVmCJCmfaJyrFuCsqIfr2se6JkQYo4/WO9zP0B+Xsv?=
 =?us-ascii?Q?U+L8mdcX7ntuvkFWyMvkiSOMYUsvNMsmAAodxL80cDVFfFkJTChr260IKY7k?=
 =?us-ascii?Q?FNpecljLoRkmv4274oEcteTSWDhNpsEis8ztrDOfq7MHgyqt5Ds3LucBAdhx?=
 =?us-ascii?Q?SK0JyGaQylUAdmq6j9Vh6+yP7G+U7PDy/r6R8Hg6a6Vc8wJipn7Y8gt2+qrl?=
 =?us-ascii?Q?zWhie2QL76qHIpWGAidaRnFGdbRkFBSCsPtyPP6vYzk6UJNeOmykwAcPYxW/?=
 =?us-ascii?Q?/iTRHDSu5/0as/zAGpUIllfvRunsE9l+Fkm+lx5ioLDlZfvdw3KzhTSYKNMl?=
 =?us-ascii?Q?Q3GomvTzZ3pD+dZ/miIsiP43HHJTysy/QFWlqBzcIYFHFRp8Hq0Oadx8Pci5?=
 =?us-ascii?Q?SZ5fPadekJht9f+ixbLZZmzTVxTS0TkFlEUgFniT9tbcC1iRphvw8NiJzKYM?=
 =?us-ascii?Q?H8Sl5O9Hs+HUQ16Ot7JlEm/u/wnDbr+ha10fbMnkO/7KEYAb5cNwwtFMIjm4?=
 =?us-ascii?Q?M9Gyf/hnghgOrd4N6uE6j6FeBvUX8hN34KZuymJ67/n8npF5fZ3rFiqf2J/6?=
 =?us-ascii?Q?2cnbchrO1mhWnVRsefIz27+vfuU2GZaHIuec73IVOIx+pieOEMbYI9TDfLqA?=
 =?us-ascii?Q?mB+unZXS5iHUzAWz1Zc56JEwlNJwZRnpCZni4z/gsaSZ+B3B7DEmXlD5Ahsa?=
 =?us-ascii?Q?5+VK7SDQf43a0tIN1KXUDQ4fpMBuCN286x4Gv6eymgdQB+WH8fKHMRlnu6sn?=
 =?us-ascii?Q?DmjWPasgKGvjZyTRkzmhqema/YILnI6a6E97D9Hf76A5zZ+qjEebyb6Dw1N4?=
 =?us-ascii?Q?6sQ8Zer9glG9omH5tHkAT6GSZzD2Q39Roi3qCo+TCU967gaFQz15N4IYkLAy?=
 =?us-ascii?Q?Br7WJQT+gyZsPurEerfZuBLc4tIWsZr5E2lzX82msIRNsztAWoaIEgAODXRP?=
 =?us-ascii?Q?A2HQmjRlTA=3D=3D?=
X-Exchange-RoutingPolicyChecked: jMyAYCCOpnO0uwVzTAmXQlTsp1Krxluy8LrsBedk0MREZtp/WjCn/5e1Mr3Sa0UHJT/UXVVPwMyEauFJt42WapyAndE01uFHv+0FiacT9A2MSviaMaVs5Fkr64ffDlXLHi34K4j6mkale7YjFoGAFEs3dgFrWSnixPJTu9/35SagznFyqkEaSJdvGhg8AG3V31PpMdurSyUnDqgzJEAVTLeS69qo+fxOZ7XTP4GTf52l+rYfQ402X+87rknHOPjdZnW0qBCshVLdKys2X/5wjuMikj3koDAO8UmodOIxWSkJC1oWh1fAvK5OZfXhL5OMQXhtL4cDC3Iobu5L+4/aww==
X-MS-Exchange-CrossTenant-Network-Message-Id: bc4c6953-5a1a-468a-c919-08dee6911f15
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 19:00:10.2667 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IeyjYUY9p1SjnkoT31dHTxL/EwcGE0DFjJ0Z1/AqPeHNaisxeL3X2DnS20hTOLMmDrXVV0XvqzccJOO3OTHWqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8338
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

On Mon, Jul 20, 2026 at 06:15:01PM +0200, Maarten Lankhorst wrote:
> Move raising the gt frequency to before display_register, so the
> blit that's potentially performed to copy stolen memory to system
> memory will run at full speed.
> 
> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_device.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 4eed9a251e65b..e6c4e1358a614 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -1077,6 +1077,9 @@ int xe_device_probe(struct xe_device *xe)
>  	if (err)
>  		return err;
>  
> +	for_each_gt(gt, xe, id)
> +		xe_gt_sanitize_freq(gt);
> +
>  	xe_display_register(xe);
>  
>  	err = xe_oa_register(xe);
> @@ -1101,9 +1104,6 @@ int xe_device_probe(struct xe_device *xe)
>  	if (err)
>  		goto err_unregister_display;
>  
> -	for_each_gt(gt, xe, id)
> -		xe_gt_sanitize_freq(gt);
> -
>  	xe_vsec_init(xe);
>  
>  	err = xe_sriov_init_late(xe);
> -- 
> 2.53.0
> 
