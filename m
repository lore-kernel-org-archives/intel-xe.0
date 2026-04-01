Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4CB710F9318
	for <intel-xe@archiver.kernel.org>; Wed,  1 Apr 2026 02:30:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7065F10E146;
	Wed,  1 Apr 2026 02:30:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kljzdDAb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CAC510E146
 for <intel-xe@lists.freedesktop.org>; Wed,  1 Apr 2026 02:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775010636; x=1806546636;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=49i6JKyE9jlQJ+mM3b2R3D7cfbV+4B3xGdXXtQOXonI=;
 b=kljzdDAbwGuEgRxeOSt6s9nLXZLvfNBNOZ45vIhulXIBkFLpO2ldwBkm
 yfYk5Adc8AJjmzbosZ4jm5C/dv5HmG8/+6L93mvFzDEBwHX8OEdBZ42N3
 myN8giPRmO9nd4lskQ08bwaB8ivJHABRfSmlDa5fKN/ITqpJpvY3TiTLT
 ILzt6WhlTaReZYuEjx4gBmvubK/RiQaBcOpz0QMJhEWz7SXLIQn+uPl84
 xJ8PEIJtOZbksYeMnUPX87GZURZ6wcqqRYEYsVfPBVgZ/yFezwIJhXA/o
 kcOl5kPXxBEoqMIK5HaWpOAY/8NiLWdTy5gH92J5yhubOF+TPSjPzpzH6 g==;
X-CSE-ConnectionGUID: G3gbA0h6RPSaBYtqO2TVGA==
X-CSE-MsgGUID: MIkkw5UjS+ul4bwmJkLNjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="75925672"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="75925672"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2026 19:30:35 -0700
X-CSE-ConnectionGUID: 7bCHEEzzTOi35ucpzdDXVA==
X-CSE-MsgGUID: 6DyPF0zlQImikkujG8VAQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="231477675"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2026 19:30:34 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 31 Mar 2026 19:30:33 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 31 Mar 2026 19:30:33 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.3) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 31 Mar 2026 19:30:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=avWguivvELfYkd4UcwJL8jfAvABtbGxuJKIaWqfCJHebJrpsw1EyfB/H7NdDaY9+IjUTMVqY4a1Ef02uz8exOIl3WoeA9cMxmUXHslqEWXFz9qE6crZUgU7IUJB4Rh7UVrqFx7wmF+cPg3NrDgBv6R/eDIdENOCvMXi41RQ2aGHKAMpL0Ab3D6ZTREMKMyFKvEhjaxG0AmeLZZik9czL/f39wjrj7CwjccwuYdcE+z5oRo1lj01LYpxtZPCPTcx+YstyamN4a+bSeaqoxemTSX6rwy9G0/Kaf+jqjTuNoVDzbUDHu/iMNpYPo4dJxXAf7rmcdO5Pfb/QQ7Xk1fzi9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5oVoN0hMQZforOuGQ9wOSwPswfdBGeLk/01fPE35dKY=;
 b=ciHMELf9QgpnNeJQoTTTTNMYIpd8LfGON7H0mwdIOewR+GjReMpb69ug9jFVdpZe3UMFKIqHWgZp+RtcyrrM5nbJgt3QCBls+1tQW2f3KtjOXR5cltNgRONORqaaY1N6/+ZoQ3BD3YXNImmKOEXtV7u7ih0U2EqkGPCAyaI7wulNt4stdUHf6mzXVks87k3OcV6++CYE6kMc59MW1ByJCGLFfo7YKPdpBReUqjRFiq+9uiRWKSk9Y2IFQbAnRQwqB/Wg3oNQK+N2UziuKLrhwOy5xyUZTCgU+N02B7HLznapnERpCj63F5xNbzcUNU5+bS3xvR6u8ZI6586y5Hg71Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by IA1PR11MB6097.namprd11.prod.outlook.com (2603:10b6:208:3d7::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Wed, 1 Apr
 2026 02:30:28 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5%7]) with mapi id 15.20.9769.014; Wed, 1 Apr 2026
 02:30:28 +0000
Date: Tue, 31 Mar 2026 19:30:25 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <saurabhg.gupta@intel.com>,
 <alex.zuo@intel.com>, <matthew.auld@intel.com>
Subject: Re: [PATCH v2] drm/xe/vm: Add missing pad and extensions check
Message-ID: <acyDQeDm3fom3Sr4@gsse-cloud1.jf.intel.com>
References: <20260331181216.37775-2-jonathan.cavitt@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260331181216.37775-2-jonathan.cavitt@intel.com>
X-ClientProxiedBy: MW4PR03CA0229.namprd03.prod.outlook.com
 (2603:10b6:303:b9::24) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|IA1PR11MB6097:EE_
X-MS-Office365-Filtering-Correlation-Id: b8232270-78ed-4f0d-5707-08de8f96a376
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|22082099003|18002099003|56012099003; 
X-Microsoft-Antispam-Message-Info: /saqprCSaCSjGVPwkBxX6EqaqBTKHDKFCyQleiNN1TH2Kahe6IkwIkdl2+4SFS/O44pATfjD38b8V/dXaXSXgRlAefsL5w/jriU9YwUEJ/e9g6YZ0k4YIEeauXtL+4zP0md4DWq7wr2jxqyMsXsp8nPABKfBstTGYJBhpSeqx0K/puDqVhwU+TZCpW3Xlp/Ms+nlReKUUwnnHOU/5snjMGvBrAXtuv3XfvE8pCNIgjbc1TlPriy8eVw2oR6Nou+WFvXbHjhdYq/D0yEpJ2eFtvrwSLo2u8mtHkP37Q0AGgIv0VOV5qkwKVSmU5SdP8oyT15BwXwW/r4B1NBqOclKFkNKXUlUjl4aj1GKvoXKsAiEBCnFKeXjCEmr0fqPccOYOP0bDN5a/LJEMqXmj/6ra3AMK9k9ZsviyzKZXElywQkbatDLrsUV4gyKZxgRl3tUMOqI8feLrvfqyBYgBMyYHbbaEnePblqt58h2wIOuLf9+fsBVsbjA1Wuc9RG/2glBJogA3MerJg8uVouKEzP2GqgZ36LLH2lungAlOmOa/NGolfOm3iE+Vpe41rNzui1Uh+2Mtvit1JyLkfZL24NJilnzc/65xSP9Uiub2f0LxlhZzOK1x1iverzEYvOks+R1WIF8ur0aKEtlThKV/S37W/S62Ytz0OV80wwCyvKIWa7ypDggGQmZLY/0bSOeIxj040eDQiiIRlLqJTwRL9mAG/Em2anPrsEZzpgez2JKPVM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nZuttPW1OUzucCDYTY2iTOSdkKsvmHQzZuUH775hOdHsd0bUp2pBi+o3YlSb?=
 =?us-ascii?Q?3PgppoSqmVc9tc+UeN7EDvOOKfB3YwjN9k/M1SXRbfKItVxMKOgoQYuS4Hg6?=
 =?us-ascii?Q?nozbxZhKaxbbikhUKdTnz/GN7mQaxCJH3kmCqqR3d5RJREQ4CYVmU1LTps3q?=
 =?us-ascii?Q?svR3RR1cpL8g5SbGnM9abge0kYWx59vPpJufGoWvCBXh7jeYCMur2YsQ8H+9?=
 =?us-ascii?Q?XzPnEfLlSEADOO6v+JVsljsJN44TosvXIIblgnopsGHw3COEYPU5Rh5lVj0s?=
 =?us-ascii?Q?JVrCLBX+DxxPT9D085T4TO+dznB3nMX5DAa7EhYlzear0uncMXK0c60ehe1j?=
 =?us-ascii?Q?AoUNxm8Q2O0JjmltFdr6TEQtJ41CvA+WzuXQeESNwgIajPtQcIQLcE5hvlVD?=
 =?us-ascii?Q?6QmqeFMYTMUktkVWwEHgnZJh3ezogjN1RLU1y2rCpZXj80wjTR5dGBbI+KGW?=
 =?us-ascii?Q?QgC0dMaOBkVPQ6aqQUrkAVPWA2CpZ7HB1kAFg0DMKlXNcvRYE49G80TOmVif?=
 =?us-ascii?Q?rzLhSjQNu2FgDE97hxI4IbfJx9KX2YUtVzVsh9kpXjM2wmHkxZjnXHmX5Y7B?=
 =?us-ascii?Q?OmjvLg28FwbiwVLSnlYYFw4HX6SHRInSJZwxlhYU6S1Ah/F978KYR1g9Hm3V?=
 =?us-ascii?Q?pF0fbeD/IMMGPXpUXAxtHOBn4qWHNmG/JM5WUFcJUevhY2j6lYF/DJDPEYiZ?=
 =?us-ascii?Q?JqZOAxkoLMJqk/fxSqx+LB+NscWCuh3NZMIINJON8ca7fiXldiYAsLYyb3G5?=
 =?us-ascii?Q?XEU0uO2GW765799rprHiFvCHD0mKUNC+7Z8y96eDqtmgA/C6q0PKdsbXJyGH?=
 =?us-ascii?Q?JxYbhFs5KCzideqzOXDOuv1ylNxsZDnv9J+2UGaN3qaCIk5AgqBMyQLB+bJ0?=
 =?us-ascii?Q?qp266deQ832c0OrI+miQVOnFZ4ruGCEuFIT7PxcZakrI9ssBmV86HfERqwZa?=
 =?us-ascii?Q?qll12FXeRJpI9fSpQrSmD0RNDmsHGasyGl0bebxjiIzNwv4Mn9MlbFL0zlRb?=
 =?us-ascii?Q?dCLUvsYq7jprLEQDon5IMfdxDuot7M79lzhsccNTHS92WSEK3TPiIfbwaCAH?=
 =?us-ascii?Q?uyUU/IkOlVhzB8q+d6dMd4JqW3z2oeNggpOVO5npMvt7swiQ5ESwwrabzvWp?=
 =?us-ascii?Q?a1T+qBrKxdYwJysIcGyC2kNM4nig4UEhal0rNAGDzVtEwr9SiDx2/x/I3+Ps?=
 =?us-ascii?Q?R5LWwctGvKF5XBgKG97Ymp9sp7wHCze691wtSImlNrY+BZfBId8FEYuTXeYs?=
 =?us-ascii?Q?So08j/CwL47ZJzOtm8wL3OuN7oir7M7qPCwsv7faUAtiHo8ncRXMFtz2RwIt?=
 =?us-ascii?Q?kSPlat2Oyozqwcp5VwoGDQhNz5gGe/8Gv9esBAoXIvPglRQ+SOdsoxONnTeN?=
 =?us-ascii?Q?lQEjRFEXVb0DCidcPXGJSTuxwzIKigERYqBuiHm7KYQcHV7gaQ1uRcN2Ukwx?=
 =?us-ascii?Q?EJ84Yr7FbFzUV6ZVYutGfgnciwxTUeTDoK6PZltMr25FAot9TyjhlzCMfN39?=
 =?us-ascii?Q?w/TFopdmm7IOrGDSZEBDlAShOxwDmTrK8b+v0Jf8ynakzoW5vyiDzHl1uaXY?=
 =?us-ascii?Q?frHcZjOWmWXpG+xvabakTu8WaTCSW2KMjFtAXcWWAd31w2ZYBezxEekAHZpb?=
 =?us-ascii?Q?Yk5CrOWHML4Xq+flzwAgI5AHt6j3bcc0IdJBtiFmkp8tHtjFiS4H5SkpK47v?=
 =?us-ascii?Q?sB3wDMNoj+p3CBpNo4mujaEHeWnTB1DpGMvp5XOdn7jbo94nd3iFoB7qc6py?=
 =?us-ascii?Q?8oAxxJEJPg=3D=3D?=
X-Exchange-RoutingPolicyChecked: mbyOCo5lVRaxusv0oAbseu8blwEMMAKkYV20ZThl6jbX0nfW61zXgKrnTohPXyA8aSrlxBOLRr2VqIhxuSV9zAkbUBZ4bcQYRnbvi++EFhGuuMACKkEN8/OWOBEDWkV8/23UVAg94TSwmmkSpRNEWUqw84USPpfyuRH0a0khJJB5J9M6QCJOWXY3wHZF/rrUnw9NSEF2ZfOJvJoQ2lwOkLDbM7pfTMs8HpQc0t6gJ997GMy80qIwX+DVjsp0kOd5DfwggTcROSc7VOi3PF4MRn9v5ZxFwCgW8/Em38EPNYwELPEDJdv/XXLq+fvyvHYKiRD+XkcmgJiAm3MPCFcbJA==
X-MS-Exchange-CrossTenant-Network-Message-Id: b8232270-78ed-4f0d-5707-08de8f96a376
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2026 02:30:28.5641 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z92WH5/Dej5XDIow15PuvCIuV/d8Yma9axRnLLc78AAvZncVy/cbVNpk3rVfbz35VlHh2P9I6eLAeydUMFTeIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6097
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

On Tue, Mar 31, 2026 at 06:12:17PM +0000, Jonathan Cavitt wrote:
> Add missing pad and extensions check to xe_vm_get_property_ioctl
> 
> v2:
> - Combine with other check (Auld)
> 
> Fixes: 50c577eab051 ("drm/xe/xe_vm: Implement xe_vm_get_property_ioctl")
> Suggested-by: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_vm.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 56e2db50bb36..1720205c09ca 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -4156,7 +4156,8 @@ int xe_vm_get_property_ioctl(struct drm_device *drm, void *data,
>  	int ret = 0;
>  
>  	if (XE_IOCTL_DBG(xe, (args->reserved[0] || args->reserved[1] ||
> -			      args->reserved[2])))
> +			      args->reserved[2] || args->extensions ||
> +			      args->pad)))
>  		return -EINVAL;
>  
>  	vm = xe_vm_lookup(xef, args->vm_id);
> -- 
> 2.43.0
> 
