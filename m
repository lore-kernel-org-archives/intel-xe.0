Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC53CCAC5AC
	for <intel-xe@archiver.kernel.org>; Tue, 23 Sep 2025 17:35:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B207E10E675;
	Tue, 23 Sep 2025 17:35:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Uu0oVeKQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45ED010E675
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Sep 2025 17:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758648935; x=1790184935;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=eqYynzm1tm7fHwoQCyhGNi8EdgD8IcVZHO9t6sfVDj8=;
 b=Uu0oVeKQQFWbQaGd2TVthSnx/p5MzZOwf/ajv+MZO33CXQUaJDsrZ9iu
 OBmq070fq/5fxhQ9HdeLRyb3WLLhB6DXAdK1UxeNDI2eHAOXEBde+iMrD
 t9JDhEn9Kffa0rGUa7PahgCcUVGgyoEuK9lC/WO9EWpaZuWUZobMgdtn5
 C0Yg0Mx9XfUFm1imoJJNT3iXqQzpJwkYR54/w4mxRBjojDBYawKOxjUx7
 JJ08npRFy4Fm8c81C7R1KL9Gv/VuD7aJmH9MUw3TkJA3eiAJ8dfDrOF9y
 PYWuL8AzUhGuYENl3uA2Z+OJO+IRorKPhoW6vZ1t/SLQ0OdsHCt5oZZjq A==;
X-CSE-ConnectionGUID: zy+JMos1Q1ms2MBl5+vfug==
X-CSE-MsgGUID: 3vwMtNyfT+GwdA627RFwEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="78542084"
X-IronPort-AV: E=Sophos;i="6.18,288,1751266800"; d="scan'208";a="78542084"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2025 10:35:35 -0700
X-CSE-ConnectionGUID: GDAej0g2SfCUcfxj9ECKyQ==
X-CSE-MsgGUID: sG7KRow/QL6t1V7PPobtjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,288,1751266800"; d="scan'208";a="177610913"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2025 10:35:35 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 23 Sep 2025 10:35:33 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 23 Sep 2025 10:35:33 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.39) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 23 Sep 2025 10:35:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K2dTdrgalqe+WxfvnJaQziD2g3+DAOwsSXFXnAzrpc0zHtzS6JBjoDgtPwgPmFxHvcb9Em7h5EU9ayR0ZPjxGX/q2isayVT74Y+5NmBIxArqL+2/pH89KeZhIhdIy9SvQX21jhKevyHFMpnI00VkxFdHIUpNyBKb/g9j12XkPNRhFgBIjl5UXIK9c6b+q4u/1ihysNJCw7Vz5rcQ+9Ns7OW9pwWqEI4nIJBfgYGLcfVgGa8v/0o0fr8d3rGvgoIKGnsAAdBpGeqBtHMbKBv2SiNpAkmSftp0QDZF1OZgEk2HkMWhd/4iaCwlEvNmto6sdFMWDyE8Nicr9ZLwlCWkog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NO2o02L8F/GJNQkRAiViVq814P782R8Q5xMUTI78vFQ=;
 b=gKO6bbSV5xAsbyy8pBwhEuMa14ToRmXptq+y2JrHmTX3Zz7u8r+zSp5bWZs4aVFo1yquf4pJ2F/uCHOmcERd1ySjICLW3mYmGzfWZBPS2cRGCWPyEJp+Oi2hmGNtWMMZi6qdjUWgQzbNiSLyKzSYabHmebrYBvuDgpduL2lT6xfENB95VyQThwOKJYi3TxJb2WaM6E0AVqEmAKsuXVtwjSn9BAoJs99pFqeJ8twrfXN9YRAivgycsFM+yiNRqa6Cj6oAS7L53uI5ZPZ+NyzLA6gQZ4Tdmv2nIVWsMnYaGWag85fsZVH50oELiYgAyaKNgmgxTxIhIyODwP34dMWXCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS4PPFE99BD3AEE.namprd11.prod.outlook.com (2603:10b6:f:fc02::5d)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.23; Tue, 23 Sep
 2025 17:35:30 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9137.018; Tue, 23 Sep 2025
 17:35:30 +0000
Date: Tue, 23 Sep 2025 10:35:27 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Nitin Gote <nitin.r.gote@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>,
 <thomas.hellstrom@intel.com>
Subject: Re: [PATCH v1 1/5] drm/xe: add VM_BIND DECOMPRESS uapi flag
Message-ID: <aNLaXyrV/gP8eUBn@lstrano-desk.jf.intel.com>
References: <20250918142529.608432-1-nitin.r.gote@intel.com>
 <20250918142529.608432-2-nitin.r.gote@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250918142529.608432-2-nitin.r.gote@intel.com>
X-ClientProxiedBy: MW4PR04CA0199.namprd04.prod.outlook.com
 (2603:10b6:303:86::24) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS4PPFE99BD3AEE:EE_
X-MS-Office365-Filtering-Correlation-Id: e8c0a1a5-6e53-4ae0-97d2-08ddfac79729
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?7q3aGjhsEE7p7GpehhjudVpxIMMVyysj+eiHPqDjSpeFejT7e95S0UQ1v2ow?=
 =?us-ascii?Q?JJmzplfz2OHwAsTiEsDVNIjp7TYFvTG51CXn6r7Sm9hzv73qikoiFuM7V+pg?=
 =?us-ascii?Q?nTJBpXn5kZPbYmb6Rk53NCyv+aJmiy7u1viBvP6NLSF0sVeLsjsjcgiqD/t5?=
 =?us-ascii?Q?QPY1HFPz0d8CVcuu0y7WZndLxHx+MHyCuBaC1lqfR4M4tZhJcUwcyzRdA7Ve?=
 =?us-ascii?Q?T+JZbw5H7gzqWU3yhRwRgby6awCa/kjDwBiq9KXevhS5lg0QXM1g/ZmfZaBK?=
 =?us-ascii?Q?+Vp8uTSQf+l5rMZhbiKjtDTngPSY+KHDsw7j/SLk29XUtHe5Qktuo14YFFca?=
 =?us-ascii?Q?x+Pe/fBAAWJR5ue5QDji09dukO1L2Qzke0r+9KFMijUO3/rAG3ef+nhuLr8M?=
 =?us-ascii?Q?yaFb2N9WwTQgJPzhbPM5EoVaJ6nM1r8T9GukWPFxY+LLrsSXnKlJYb5cTFko?=
 =?us-ascii?Q?ObR0D9IPqfLuHREAM3DHJJz/Qwy/DTSN9TZCLa7GUSXd6YNwjtGhwdSoy9d+?=
 =?us-ascii?Q?9b7aZQ2Bn29jyQ6qSVCASDa/lvJpptOWvdVNVtiCFE7nEfr0qYtlFGaUECG6?=
 =?us-ascii?Q?f5csdAC/11g0zWrBZPdaGEfIEIwYmh91nHUGe+Pf5qXi/eDYxJKGc2w9ite1?=
 =?us-ascii?Q?9yX8c3vLHCrbQ6LBFk5OEjzGFheFilnKwCcfqnNypkG0Sv750GR8g0anX231?=
 =?us-ascii?Q?qtHhx8K3X6NRB0AMgUPgSHoWErNtLUi/WJtc7LLIqknh9mBaXAVX63dBqHk4?=
 =?us-ascii?Q?Ax9Kjt2G6aW5ywBsUfKmyGfPBEqCXPcRjQKzc2eILGdHol39atKrTqI0qAsv?=
 =?us-ascii?Q?3X24wgCkdOjbSZCs2FP/Q03Fhjo1ouhu4SL3lR9GJaeVq7AvI0H4TujnS+Sd?=
 =?us-ascii?Q?LK6pzcYbnkaBVhLMy91nsHjZVM1xuQswyPfnaW4uCAqCc0+v6+qKDm29Agvv?=
 =?us-ascii?Q?vZ+wrwFY5zhXUwGw0ED/fncwDQuO5q2V0oquH+5Iwso+pDeS3rj29Du7BEFL?=
 =?us-ascii?Q?ukF5vo1Zxx2VPKaiNLWEDKYAkqKADuaOjKG4tL5JXPzDrEpPVtVTBOG7zJKi?=
 =?us-ascii?Q?HKnxyezTn3cpS0CvNMsOpzFp1elzZzflkoftfsaJtOme3NFVhQKKZ5S+o2eK?=
 =?us-ascii?Q?rD5EqZxZXnEuG4F1jQBOzeJAj+krdlRmC9go84rUiglIceEFTm9ANxpBOJLr?=
 =?us-ascii?Q?dFRvJIq/4eNWb43WJixvcMCHJgX/6tgYyYne9txzun96dMpEPxxUyXHnIrbB?=
 =?us-ascii?Q?+CJVObjOONkt7mSClgDCXHcP+2BYB6dgIxy08QEuVVDUvkg1Je8Shjplt1aw?=
 =?us-ascii?Q?g7zXamqEXTvyQnAw/u1l84SW2JY63UJZ+na7iU039aihRWIRPjkKKD/Pt84A?=
 =?us-ascii?Q?VzM9jisMgVi4d5kEkueWPwDOjOHsBczdkzcEr7UtQu/cqXqf+7JdvKhJR2jQ?=
 =?us-ascii?Q?ZTyiySgCE6E=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?w2cKI/b19CC4ui4tVFvUzQjVwCyKKRcYFSyx/BcDbT2WajO+fmA/1V+Q53Gz?=
 =?us-ascii?Q?A1Nmi/oFGf157vDKLnCOpV92suVlXiJx0x8jGV45mATuVz297N4FcGzLYHxR?=
 =?us-ascii?Q?xvUnOvbxCyW8/GSoh1NFiyxhQVbwJqhM7y3fXXTaUsUhYY3ldlTiD6vIWyp1?=
 =?us-ascii?Q?6lv5rxslydL8zNwEx2ZnleUstjC94kzuZ/rwXn6vykUxKvMT20Bf2VWgtBRv?=
 =?us-ascii?Q?4qbJuilSCYyPZyp/pvx39EdFkhb6Dd7msdjcIj9+H6TzcnikcoiQtJhybNil?=
 =?us-ascii?Q?5CDsXQq5ssQltcKNiA/JkOe02yzTQ/VDkbJhXzU843fltUTvdydCsLFQ5OUD?=
 =?us-ascii?Q?yWaiLoUqc+ASOfuY6ewtP/9D08bcH0oBqev+2JTEQKlKCACnZqMuQG5Y1Zqq?=
 =?us-ascii?Q?8MNSxzy37NLZ+kUuNwTiHauVTyynyWANfnusce17qFRYYuRo5WUpIe714BK5?=
 =?us-ascii?Q?B+JJa4daIsuxer5f1GOSbWLdcCXRDXcSDcpbyPqDG1ITxb20GTUZeZg0k3Wu?=
 =?us-ascii?Q?LgkcPKfdauj8TBX92E/0GVYWGdsKCvE+E99yb4C6x1HC7E5cqxehiwFx97vE?=
 =?us-ascii?Q?TbjRQxaX970MM7HLEXdh0/rUFze+x5kcAmfmvEBag8v+/5YofAEgLWimUNu0?=
 =?us-ascii?Q?p3vGvd9w6Qf6amdeyi7eEmeGtwo16+gpcoj6tLMr+CjPM98AyUMjcrpSmC1u?=
 =?us-ascii?Q?a6pZ2egoOWNMeFFjZi76UacfwMBBdpDAgj+NjF1z/mVpiSiBj8RIdGxs5EIU?=
 =?us-ascii?Q?PTaPzF6ZeBx0mtlayHduYiYzWzzOPcQG+oCF9Xphs2yMOkBUpSk1+3iU7zeL?=
 =?us-ascii?Q?MK0d5Cd/b7kYr/k81lsvSuZKY0K2r7U4kt0VkUF29EpPwG4vppjmLJEuqW+r?=
 =?us-ascii?Q?1tiDYqXH8mEPZwZgJB7ARPS0KiQLFPEZ8I0lZ9G3oLl0jpIEDLj5pEExzZxg?=
 =?us-ascii?Q?E2SBZ6iiEXUrk1nsnak7KwQEdF6FCYFFCemdPOFcBJ9aexTcXCdO5rnWLeV+?=
 =?us-ascii?Q?vZyqFfBI/Yq2KzGwD22KJogX/6zoMdU/cMj3d8k06zfBn8eTOFJavNsjWSDk?=
 =?us-ascii?Q?gyDFpNr/Igflv8Gp3egEcEZZA+/zZtTz/SEcbBPCnOTLuJyVN5v/YoulEJ0S?=
 =?us-ascii?Q?WEQBgBM8UsoMWomO9VVkK80HPhztchocxjxf0YCf9yUU7dOjnTiQsK92U2DG?=
 =?us-ascii?Q?oTxEx5I+yMk3NyP59UJm5hv1PISqH7mNMfJNlC1MvfkwU5NokzRhhvqUoU1L?=
 =?us-ascii?Q?Sk7OL44wwqt1VJWc4w9qanhkF51EbZy2WQDeUhg7a9OJ7iZZbT+5r1JsHNM3?=
 =?us-ascii?Q?bL6+Yp6SvLegyvtPKTjXMstaX2tzP9UeylzEIBk03hZ/gt64eEVV94EMJj6d?=
 =?us-ascii?Q?qzYYlcE9+kPV0JJBAlEUcGcgJxBUcMuiQN4Y24cydDDzmwWcwgE/DWrTaype?=
 =?us-ascii?Q?/7AzR3vo/vaRO4DAU7CHU9nDjwx9TNg9BL2c6SxmgM60z9AwLG/1+A/eQ1ws?=
 =?us-ascii?Q?BtD7AfqZBrL+8q/ZVFSaF4z0jKmPjxQ9XDt8vNmAnhkZrnsSgS0rDgUqxMkY?=
 =?us-ascii?Q?EfTCTF8cyFxTkbMZAedL4Txt1Lw2DTwO76vd8wRPwLZqXMmYoEE11wxT2dVc?=
 =?us-ascii?Q?5Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e8c0a1a5-6e53-4ae0-97d2-08ddfac79729
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2025 17:35:29.9875 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lKOe2YHGmebTXMb9+qDE39YvP8OZZz8Nv0pIDfD0A3Q9YsMU1OblbstP7Moh+fN0JxbRLK8nw/pKDG92PQhGLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFE99BD3AEE
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

On Thu, Sep 18, 2025 at 07:55:25PM +0530, Nitin Gote wrote:
> Add DRM_XE_VM_BIND_FLAG_DECOMPRESS to the userspace API so callers
> can request GPU-side decompression on VM_BIND.
> 
> This flag is used by subsequent driver changes to trigger scheduling of
> GPU work that resolves compressed VRAM pages into an uncompressed PAT
> VM mapping.
> 
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
> ---
>  include/uapi/drm/xe_drm.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 40ff19f52a8d..6b652a6968a0 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -1119,6 +1119,7 @@ struct drm_xe_vm_bind_op {
>  #define DRM_XE_VM_BIND_FLAG_DUMPABLE	(1 << 3)
>  #define DRM_XE_VM_BIND_FLAG_CHECK_PXP	(1 << 4)
>  #define DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR	(1 << 5)
> +#define DRM_XE_VM_BIND_FLAG_DECOMPRESS	(1 << 6)

You need kernel doc explaining what this does and the semantics (i.e.,
where this flag is valid).

Matt

>  	/** @flags: Bind flags */
>  	__u32 flags;
>  
> -- 
> 2.25.1
> 
