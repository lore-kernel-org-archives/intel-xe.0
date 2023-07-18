Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39494EB64DC
	for <intel-xe@archiver.kernel.org>; Tue, 18 Jul 2023 18:38:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DA7410E074;
	Tue, 18 Jul 2023 18:38:54 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D609310E074
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Jul 2023 18:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689705532; x=1721241532;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=RIkx8Xh9s9pT75EwGP1ASGLP0JWr6Z0EP4j6RAcvs7g=;
 b=J7NFHcKp9NHc+4qKzgmphCgBmtJY27pGyQgmAxLwYpb+O4vbIS+ZJ38S
 hbxfeGBFAIFdG5FYybQ82ivj7dLqF6LS8e5MrewQH4Ry66P2nh5wAGDcl
 YQ87Ty3D0+jTffdMdSw7Yl/LkkbUAVnHAc9nJ+MJS+FW4dlv6zNmKhkGl
 EDY966kkntOaHlASGKJmbPN2i2VzHdsfYPcH5k8L/5LAs1j2yF/Flz/Wl
 CPVbDxbdivK44mQA5JsSrGzxvAtn+GXFNNHhWVeIkt+vNIdPDJhzt/I/5
 C2tpl1Yh1tyuKTtrh1IXN5/7lHgFEXFmd2oCLI5RJRc0E9nPwDGkVI5XF Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="346584891"
X-IronPort-AV: E=Sophos;i="6.01,214,1684825200"; d="scan'208";a="346584891"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2023 11:38:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="1054409711"
X-IronPort-AV: E=Sophos;i="6.01,214,1684825200"; d="scan'208";a="1054409711"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga005.fm.intel.com with ESMTP; 18 Jul 2023 11:38:51 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 18 Jul 2023 11:38:51 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 18 Jul 2023 11:38:51 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.174)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 18 Jul 2023 11:38:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nTlmC4qkM5dzlVX9oljUyUfqfs9KxLyD3Z8Dv5g2OWZkjW32Gf5JCp2bVFabdgf9ea8JcVRD6bGVbc68QEUCCj95GNVhbJWvwU408aJVq+85mmf8rpzgUN+ZfJikZWLpbRM7qAdjvrXtEj++yglxYr2vDRfVrXJHhzFFu/DCw1WjaqiT+t9Df+o2O0xJMFfrcbb8FaTHVvuqXxU3I+8AWe/lUhPKInlcWc9/YgPtdI44KmztExJz2Uu2ANBhC4BSr43dyPhUnpsb/9qcEiTXpJr5Iml5mAMCgEoskzpaR6PxTTN7n87mNYxVxkv7d+FTELoOPt4HD84XFFPGP7ET3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IXUBqx9YD1mqjJUqJOiCJFj4lKu37sHofmQAg8U1tME=;
 b=d/TrL9XVU2WxMet040yybiqQtzt9/B13+PUuRfDyQK+EoFSnfFqv5FvAh+XwA/cKlSMlDsTzQ7a1TfoOXARpY5WcgtIDKnTWWgpsIpSIe+QL5BouFa8qQvQNZiWbekZWvRIJyKKspMSOHIeLVs7ZGn6S23mUQ+qbIGWphSdqJfa/f19pEtgzheflv7nM5STwyr7PMiHXiP/VKx77g80vhPWbpxQ15q5vfD7kqbUJE5UQUWo8D72rgUJQJ/VeEST2b/LypuCoK8zlDPfYwdvtBZs4zlhd8cemOg0hQrKDmBX1Qb2uTOM5mEFkAfo+WHgC+/L33aAXn/fjOkTleivSPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB5983.namprd11.prod.outlook.com (2603:10b6:510:1e2::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.31; Tue, 18 Jul
 2023 18:38:47 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::3294:2cf2:e022:7164]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::3294:2cf2:e022:7164%7]) with mapi id 15.20.6588.031; Tue, 18 Jul 2023
 18:38:47 +0000
Date: Tue, 18 Jul 2023 15:38:42 -0300
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Message-ID: <2dcxt7scbxezye5yzhj7yumv7dbqjh7zrdlgkzjy2dgvtvtfd3@nxcif3ene3oh>
References: <20230717193746.7-1-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230717193746.7-1-francois.dugast@intel.com>
X-ClientProxiedBy: SJ0PR05CA0055.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::30) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB5983:EE_
X-MS-Office365-Filtering-Correlation-Id: a954af60-4d66-46ba-6415-08db87be388a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ftukFrCYPps5PzgsTPC8upmhf7bddbauOdD1LaKD9vQINyF+muHTP6JqhK9FBJiExOh3PEgEWyNNMQDqutXtXoJciDlQGYwddb4GKXTOd9tHZNCu9zfmI/A693t3xoOUQy1RkWFJCaZchWy1FLOLfLRGmI7Uasr8wJ784Y8Uhi2O6IREjwzSEgYdObvx2SJ9K753UhHw+DGmKN0KXF14rFZ4P3bajia0+vb+O8bjBRdEaZl6WXDUAbhfN7Iy0rgijiSSysbr1wnwG/1ET+8U6dCtIQket8rGNskJXUQtZjPmXnJfBEwrBbog9erbSdjGOajzrWvmWuGCMJTs2bphTde0Cbj4KNWQ7My6s6QfdE7vnzPYIdwLDEpoQoJh94SqvnuBQAfa3z+e/QnhAN5c2w3ID2kcpp/Ka1DDaOzge9oZ4Hg+sS/UxbtzkJ27WgyvESY7/YG/7lNhwrLZ720xYnhweZAy/QKAUkxTA49/ecTM4jK37QUp3HdS66TLZP/n9iP9Fc7LEcFUoOXCwC3O/PfHL3OJ7rXK78mi9eEiOktMCCz0UGc43P4g8glaLdi6
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(39860400002)(346002)(376002)(396003)(136003)(366004)(451199021)(2906002)(33716001)(6512007)(38100700002)(82960400001)(9686003)(186003)(6506007)(26005)(5660300002)(6862004)(86362001)(8676002)(4326008)(478600001)(6666004)(6486002)(316002)(66946007)(6636002)(8936002)(66476007)(41300700001)(66556008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ngTZ6gY6F2PKhXPGoNryEbqcG7JV1lYVAe+SVRj7HFEFXrxYgDwTyUyC+UYi?=
 =?us-ascii?Q?mJV+tp80vQH5bTfy+NyLoKcUtmv4XDoILb7GT6OM57q4/1NujS1ccJobxi24?=
 =?us-ascii?Q?aqj4rP63BeAsA3BhMwOlGzVdnYCZbY+68qgud9Vh+Nizeyzedua0hOQoS7pa?=
 =?us-ascii?Q?g0YFxgwnlIq8IE1WrDgAGAM41PRw4gHoVrOHiZscBL3iAxz0EqCh/iB+jdBO?=
 =?us-ascii?Q?u/aopCzhGJoJJrsqK4XF4sCw4d/n90nItLq7+eM4ULIM7uSu63NlDBwWjELF?=
 =?us-ascii?Q?OoYFBDJaeKZ0o0uvpr7VM7ZYvcYZFfLL0vwWYqYB76vY9UuDNQoXg2GvWyAb?=
 =?us-ascii?Q?CtACaFDupUhvaT3HEov+ySWpanif3EMHyflSESNN4+m0HkmzL6r2JH14Bp/3?=
 =?us-ascii?Q?/lCL9RPrtDJUdEKCpvRvtoYGPgPcuRYgIyPFF+qkAkVZBjbW4ut22BhRsQdv?=
 =?us-ascii?Q?t4HCCSRBX7P3WaXm+hOJXjSDIBV1vgVg36uu6Qr7AbG40B8Y3z7ECI9Ez4GB?=
 =?us-ascii?Q?Ofr+HDKVS3s1QPUbZ0Kj6FjG6MeRxkKHt39DIXFyuCSv0o4//Uh7v52DSOrx?=
 =?us-ascii?Q?1SOr+NM862YPahcKM75oHY6GdVtv5g07Z6oaGLtxWEoev5yFvSwwNobXbCeu?=
 =?us-ascii?Q?kHnEbTYHgGvRqFHdl42AO7R1+4Kfya1EC3BjREASkOb3rXIi29n/UqapLS8B?=
 =?us-ascii?Q?0Q4nhWIuLXJTDB3ghcIJGycmxGBkX/ZvlpIuk9NftPd16HxC1GTGT4WU/9g1?=
 =?us-ascii?Q?T++agiOK3SXEOUK+EXUWuAYQc1PUisbPkwcgdmcDnueUlPxWAgXB3sDljJkA?=
 =?us-ascii?Q?j7x4/sQKfBwNe6y/elM7m7CuKRxl9U0/HmB4vFQSGaJQiqsooALBNADXIKGx?=
 =?us-ascii?Q?/QRturTs2+16W46kg/K1OoXQh8HnJTBqRX8wYqWj0g/z6bFDpbEuoRXTh7f8?=
 =?us-ascii?Q?jXqeYH19+Br4jI7bdZND3WPDPBzYAhnDA8ZYAHkyPmEJAmTzXD/T89qUA0zf?=
 =?us-ascii?Q?CFPRYOWMzRuUWJBp/FHwGad3vq18UEtIFnBtDWywmMNRzJb9ZYywRAiROt0E?=
 =?us-ascii?Q?zOIX/vZWAKIeVg0KKilCcEjuXjY520q62lBrZBHujOpb1I1l+V95vOuAp1tO?=
 =?us-ascii?Q?7GRCDs/kDuPLYnmivXKevLIjiE2bNxba8UmRTdbKxJPlEetIRheZFuIiuNoZ?=
 =?us-ascii?Q?+XfiV23a4rAJeDGo4Tt+2Z+CH+FThkYo/ZjVTV6Mq6Bt8SgLzbZOrayl5p6/?=
 =?us-ascii?Q?ZyvjeuzfYAcnqx9p4S4mNelzb+KwLAPBnbDCPf5fRrt7AuvwGWPiD56wtnFX?=
 =?us-ascii?Q?qbZjcTomo13g0tHfyHsjt0/1Jl8LgQy2VYL2q7o+XKYgZMp2rTUB8KtryjJ0?=
 =?us-ascii?Q?IDSve1XR5SqypQLNosfOEMn6662z/HJMlKh90mip3vfwKz8D7/Sb8QCxAOgy?=
 =?us-ascii?Q?rPxqcQBLDfvWA5GMqCNJKTGLLXjc1eWomhi6WF51eCL+9jTKjjo0dx878zSV?=
 =?us-ascii?Q?mDP+4QR2UvguclNcfnbzb0QUsC5iJIA+tHQGsnfBo376J3cdqIBA4oH3btGc?=
 =?us-ascii?Q?2D+PZEhJHWi84Pjr+3Adsaod150k64m8FPvHxhg00iUZE4ADXUFMeujUOKr/?=
 =?us-ascii?Q?xw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a954af60-4d66-46ba-6415-08db87be388a
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2023 18:38:46.9471 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FOdI6TbrSiSC0S14Xz80s8YK709D4ZQnu3aA5wt+Erg8KjyCO+TAZ2Miy1ffbRtT9hRl6cCD13aImwPj1uHJ8uuCQ/OJPajBti1mYSD+/bE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5983
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Cleanup style warnings
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

On Mon, Jul 17, 2023 at 07:37:46PM +0000, Francois Dugast wrote:
>diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>index f16de5ec0586..aeeac05bb8bb 100644
>--- a/drivers/gpu/drm/xe/xe_vm.c
>+++ b/drivers/gpu/drm/xe/xe_vm.c
>@@ -2105,16 +2105,20 @@ static int vm_bind_ioctl_lookup_vma(struct xe_vm *vm, struct xe_bo *bo,
> 	case XE_VM_BIND_OP_PREFETCH:
> 		vma = xe_vm_find_overlapping_vma(vm, addr, range);
> 		if (XE_IOCTL_DBG(xe, !vma))
>-			return -ENODATA;	/* Not an actual error, IOCTL
>-						   cleans up returns and 0 */
>+			return -ENODATA;	/*
>+						 * Not an actual error, IOCTL
>+						 * cleans up returns and 0
>+						 */

I think this  change and the one below makes it even more unreadable.
It'd be much better to just bring the comment at their usual place, just
before what it's commenting on

  	case XE_VM_BIND_OP_PREFETCH:
  		vma = xe_vm_find_overlapping_vma(vm, addr, range);
  		if (XE_IOCTL_DBG(xe, !vma))
			/* Not an actual error: IOCTL cleans up the return */
			return -ENODATA;

Lucas De Marchi

> 		if (XE_IOCTL_DBG(xe, (xe_vma_start(vma) != addr ||
> 				      xe_vma_end(vma) != addr + range) && !async))
> 			return -EINVAL;
> 		break;
> 	case XE_VM_BIND_OP_UNMAP_ALL:
> 		if (XE_IOCTL_DBG(xe, list_empty(&bo->ttm.base.gpuva.list)))
>-			return -ENODATA;	/* Not an actual error, IOCTL
>-						   cleans up returns and 0 */
>+			return -ENODATA;	/*
>+						 * Not an actual error, IOCTL
>+						 * cleans up returns and 0
>+						 */
> 		break;
> 	default:
> 		XE_BUG_ON("NOT POSSIBLE");
