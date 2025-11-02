Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6667CCFA02
	for <intel-xe@archiver.kernel.org>; Sun,  2 Nov 2025 16:53:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5729E10E111;
	Sun,  2 Nov 2025 16:53:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U1CQnTc5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D45CC10E111
 for <intel-xe@lists.freedesktop.org>; Sun,  2 Nov 2025 16:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762102437; x=1793638437;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=lJpcdiOwqsehcZAdL3LB9f0bFRpge6a0sQN7wGprmkE=;
 b=U1CQnTc5C4gCnS7zviOq4n0cmPPgnTkn+9gdzatHJZXZaIRMOTLh4Bx3
 hCueeuBXYwBJoQoTLIsRK4z7vUc+igJpIi1Zuqpdv+1zvdcQ/9lgzMgi3
 Nw9FWP+2aqhHI4vo+rbIossOxmaCtoSYTafvXLBsW/sSkQlugC6ub6QD9
 u5Xd3m+EbI4dTU9QniXQpwkgbtYoBHNKEyJYK4D3fzGLyeL58I8YeRXsg
 c8azEqQ2Sjx+DybX57gTi8qdX/JNX2PwETTXao+jSBd2etN4c8WVzcUvl
 p3jN6/JRmFjZ/SOXhPBVW84vZE5kAyPXkmSyTHBKjmufATf3xUdvIm+sC Q==;
X-CSE-ConnectionGUID: +zciuGS2TGi+k8U5hk+w0w==
X-CSE-MsgGUID: Le02BdtcShqnUAdzVmobYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11601"; a="75640530"
X-IronPort-AV: E=Sophos;i="6.19,274,1754982000"; d="scan'208";a="75640530"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2025 08:53:57 -0800
X-CSE-ConnectionGUID: ZmV4imhhQKeJLGXp1VxYOQ==
X-CSE-MsgGUID: wJu0ABPyTCOuh2hLzcy6OA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,274,1754982000"; d="scan'208";a="185958160"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2025 08:53:57 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sun, 2 Nov 2025 08:53:55 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Sun, 2 Nov 2025 08:53:55 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.8) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sun, 2 Nov 2025 08:53:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZYrNqFv6kAwu43aoSxnCcxHUiw7HVP8NK/S8j3aME4cUKVI+41VF3aRWqevq7JLZEmD5It+N60CjkCQXm8tGWjMjaS0Jrx+NRB9iPgLg4UrtqgkgfgMKzj/AILRAkRurP8IOI7Kr3bQ3GMCd9KeCIgajkY7j1XTGVDGlR2yVxP7H3IWsy3n0qSsGZepfW2XdFs8gCpZUCqX+ONrlgBrZlckwzhr6/op2tUMZAjPwT89VmpeC6FvipzcImu1UcLP1vrS5Ibh1qix0Jto3ZvVkZ3jN5KaNnYaZk3Lub5fmaOw/0JesEK35Uson/5ugNzgUlzKfk9hlYqlCciLT4G7RRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WlHMU2RkTBXQ0U1zuaITWYbU21h7aj5/4fxrZqaDeyc=;
 b=x2s3dvgT5o3MLu/Ond2hzwPq80JJ100A/7YonfEg0gIT7EVr3sNbZuRGLhYn7R/8m2ZPK44Ao4i2TI5gdN9fv/vgPIdIq/Z4IWynT1QknvNAPAqRmeqKV/mF+iHibLGtLmnBPFxnXCHKN4o41HTnuL0adIW9vC58gEDioY9tt9htEHBgpTc43NIdWCuIhSokzfHfYX5CnrNgT4o/uvF7hKAv1GMJNq4ZwhcQiE9MGaICbkhzjx8FaxkKVfp7Zdvkkc3MBo+YDuK7UvBx2XAA3Dd75GaB4VawdGhh3QeG0KyNeLARdx2MwcVF+C+xk/fY9KYDmbYLFFUIDd5fP0pBcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ5PPFF6F855567.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::861) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Sun, 2 Nov
 2025 16:53:54 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9253.017; Sun, 2 Nov 2025
 16:53:53 +0000
Date: Sun, 2 Nov 2025 08:53:51 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 06/16] drm/xe/multi_queue: Add exec_queue set_property
 ioctl support
Message-ID: <aQeMn+gtasdn80GO@lstrano-desk.jf.intel.com>
References: <20251031182936.1882062-1-niranjana.vishwanathapura@intel.com>
 <20251031182936.1882062-7-niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251031182936.1882062-7-niranjana.vishwanathapura@intel.com>
X-ClientProxiedBy: SJ0PR03CA0153.namprd03.prod.outlook.com
 (2603:10b6:a03:338::8) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ5PPFF6F855567:EE_
X-MS-Office365-Filtering-Correlation-Id: 75304936-2486-4190-ba5a-08de1a3067e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rsmiO+SpG155a6tbUbzSD2QSZk1xOQ7626x9TU6fWmGaZ7tOUBh0O/UsEkQb?=
 =?us-ascii?Q?H6EYtxr9MXoqPHubzrjWZFJfS5RbTHsSBlbkkxPA+I3SR1LqTQfU7a4NxEJK?=
 =?us-ascii?Q?eGaLDf84QwkPiU21Nnk3PpkgIqNZnOtDKOZKpJPzBv524deZanZifjKfMQyY?=
 =?us-ascii?Q?PwlxFtQqHm5eDnNvxi9Vxd8/dg3AhUjq4SwAP1B32H14zKIAN4+yw69cDeQb?=
 =?us-ascii?Q?g/zNLjCpgFndIx6P7wj80dCL7JcbvNQj6PHl5XkNarzkUOth5USdxI6QS5dH?=
 =?us-ascii?Q?U09QBCp2GiEMFMfnl4j9qeG+nepdzwBEPugZUkbhkgnJRlnnJcXYz4wcxm02?=
 =?us-ascii?Q?9I3i5rmW1eRCLbm/WqMUsAzTx95cOkocke/hkLQxiBf84b5evTopHi9VJZGN?=
 =?us-ascii?Q?zWTxaJnBl4MlnDpIs3N43ZmZamwicabj9LxIYGlC7Xwwi1450DyjUZA3T5je?=
 =?us-ascii?Q?Jx2HnUluMTuMxcoRwVFnyk0tSShFxSPR7iESEeXOvq3LVHs43UkPKRIyncNZ?=
 =?us-ascii?Q?YqNEHgGPYgvo9BExSrozQ5OQ2gm8WAU5+YVftz0OJngxMMUi+9QXgu2Py3S2?=
 =?us-ascii?Q?yet8X0o6plCkdZ7ht6zyoJ2kbm1ByGFSqYzG1eorNMa2RJNu/0OjbVjIKtuR?=
 =?us-ascii?Q?Zz3NTp76ILdYILz2JWRhbH8KUzfbJh4fYYYDNlCmQ0H+gCTANc87KZ2D13Vz?=
 =?us-ascii?Q?yaZt6Z4r0p+veBEY+crUsWlRWSCMR0kelIbGw4R51tRcIC/WB8lFq8Ryw15M?=
 =?us-ascii?Q?D5RbFPM0cyfDubsJcvVWOQtvp6LIWpR+ev4ddU3pnHB/JFo7pSSS+h6+VaQJ?=
 =?us-ascii?Q?5hAvhIuq3WjToNwiVfX8tubRCjmTcjObn0gyYY/Z+8mERttGHXB/yUYSWKnK?=
 =?us-ascii?Q?m5U6dmT/OTVebuKsbOViUZ+GvZUyXonAybxzBsOoKrx9w6GhO7Fdp60bfngb?=
 =?us-ascii?Q?WHNzhfrWDnjS78ehfu+o8vveT++s8noa1DoRze2U62jjDxTiM0siF1J9mgjT?=
 =?us-ascii?Q?vupzOqqIbsShM9x+7gKh0wTIjInoeY3h5z0i6Xuse8U401GGekFybHPWiIqz?=
 =?us-ascii?Q?T4OhU+qV20i7rihvVPlW8cGtE65L3kgJWYm0HL8EXC78v3vrVSs+mjcvU21R?=
 =?us-ascii?Q?dEl8bGylpA2gucJeTttlniY+d5Ccw0d9NAfSr/y5HU3ri5GsJNvDOW4W7rjP?=
 =?us-ascii?Q?scoMXQ55FnDuEhZsXPjLXbSLZNUEa8+ZM/Vwk7xVPo22noosUlYrbRrykkDp?=
 =?us-ascii?Q?xrXBQmGU/Sp4fdfi/D5M6hJWyMMBszRxR1INKYR1JvbzF9iAcGimh2/pQXkE?=
 =?us-ascii?Q?xjeKg0PIj5soXF2kYODgrl+O2Ikxe5enerq3VxP+J5fSWubveOQ4jK8stZaS?=
 =?us-ascii?Q?bdS5o6WgB27wlkSeiwYSXTxwhztPEtMqYDKxG3ePBs7NcBPphw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yA+ZS6VxLroE7GcTKXmEGRCySKJ3bHY5/N0qxNQfiacUhX4Gka4jhLi+0Oda?=
 =?us-ascii?Q?wMW+TZ+/q77cCz5NrLXTU+w2wOx/UBbijk7QGnb5aOOTxj09WHarCLeATTgh?=
 =?us-ascii?Q?UT9IPYmZfXTjCwcsJ5dfdy/0klw+bxN/4H0LSIAOpe7/YvVSFhiKrXfaW33F?=
 =?us-ascii?Q?06/cDim4hdOdA+vtIFl6pNpReGdzRlZ8YRxfLZy3LfkW1dwD+WSLqlmr2HNu?=
 =?us-ascii?Q?bi+fkIobFXoCJqnVMDTxN31w8mi/gyvyV5tQQP/5udj9tMO+HQnkA6Q5aBLJ?=
 =?us-ascii?Q?EX0pfkt7nejKOIwbK+XUfvOx6rH5+QnaqVk59+ujC8TMUupRc3HeC2lMxQTc?=
 =?us-ascii?Q?Ne7X7I9U89ckWJFf/pJ+IV4QHXbMalKDcfvosZuTLsNaBulc5Snjfc4ca0Wc?=
 =?us-ascii?Q?iP4BAi09QCGoIIU7NGzGnVkvjNXGzuxQNW+q1BTWPndceQ8DOmQTKNV1z15/?=
 =?us-ascii?Q?/JC1tHIhsAwTQdn/YmaSNL6Y8RDtI0VVJjx5IQ+mqEJbrdSh74hYfDGmtT80?=
 =?us-ascii?Q?o5Sww0iZPjAKjKkP7WYUHvJ1h9mw3O1vdYvT+8EeCPre2pFyyouoMSwUsSkp?=
 =?us-ascii?Q?R6hjafzohyrkck/CH3fsoJPDlxTzruMUNeGQZgbNAkx+IxT/ISdkj+diUBuw?=
 =?us-ascii?Q?7omAIVXdzwBEp4/1zSc1lN32fD9aA+jDE+bz+Bh2GTHf+m815pzVUpwzNUJz?=
 =?us-ascii?Q?rWe5kefTHdGYZme5M8gyE+n3lfwkOah0d7+ThXQn7ldTZ7hpW0ZU+llG/tIR?=
 =?us-ascii?Q?9OoJRN8cnLPWj0d0rhRBwCt+uf9cCoYKMlsKk0gn4iY9Elnf+xuVjeeHHHSD?=
 =?us-ascii?Q?S/YpIjT5hGM7DdANkh/HpRqld+ipHSpr7ucRvO5JKTUt7fFUPRDnsWTlBZz5?=
 =?us-ascii?Q?M3H49pnb949rkI4a0k8jnbQ1t1CI7iiK+K8bMuTR/v/Qcz4nT4X4R1k/JY47?=
 =?us-ascii?Q?/mZRxyHK3BrHrBfdsHFZqkX0Pha+auIvaZV9InVNaURznJFjzWNyWmFmZ06V?=
 =?us-ascii?Q?tbThORxK0IovFgeuvicKJe/VoA3KxZ3d+4c/f+QUoEefWs3TQZ3ZwkGSLwKj?=
 =?us-ascii?Q?dQf1nL/eUMinjvGOJ8JR6rXSA4hOFvA50WUmw3A7KhA/KWSyL/lEUeyHlKfl?=
 =?us-ascii?Q?QqJuObPFkXW5hNx+cOcQ+aROzn6G+5L9DP/VLE6KVyOWuIRHM9gKDWNYcwdq?=
 =?us-ascii?Q?pP96przkU9T7HODgp7x+8Yws4bSfMveVfn/3paN42KawjsHB5Ra7OQOTEylx?=
 =?us-ascii?Q?NDVtNrcEgeUE+ZXt1cch7yWr3f4JmBYTT8hIPoaSrt8BIlNzUevRGza6QMvL?=
 =?us-ascii?Q?xiL0RSUnankMyzL9VqAFybDzSvvpgJxIJyUV7NdPYWZ8NJhE+RuUUcnmP5As?=
 =?us-ascii?Q?VhLEIUOThLbe1mUMOQmV9MCwM1ZhmMBJ9Nn32t/R2c0yLSlJY6gysdIxpgxN?=
 =?us-ascii?Q?EyfGvRyA+byBuPj5/AobBDmXZfHYWV0IyEBjtTQZsznNxe6DQTlIN4ETVh6P?=
 =?us-ascii?Q?mYKz7Vujvndyvg+DCRyaYNOHRa6iveves7xhLXqRMn7NKi8Qn8YRbjf4JjaS?=
 =?us-ascii?Q?A9VC7sEs719KbFps+dA/0TEiYHpDF/OXpt9rJsRK9GoNTMYgcyvJ7yuf0yba?=
 =?us-ascii?Q?3g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 75304936-2486-4190-ba5a-08de1a3067e1
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2025 16:53:53.8805 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e6VPxVGCSadOc8R6TcmIMjlwfuQ3yWGb31hRhkTKZBVzgb77LZ1izNG4Tje/Bgi+r/FgheSpti+A/ZSlHVcdpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFF6F855567
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

On Fri, Oct 31, 2025 at 11:29:26AM -0700, Niranjana Vishwanathapura wrote:
> This patch adds support for exec_queue set_property ioctl.
> It is derived from the original work which is part of
> https://patchwork.freedesktop.org/series/112188/
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Pallavi Mishra <pallavi.mishra@intel.com>
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c     |  2 ++
>  drivers/gpu/drm/xe/xe_exec_queue.c | 31 ++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_exec_queue.h |  2 ++
>  include/uapi/drm/xe_drm.h          | 24 +++++++++++++++++++++++
>  4 files changed, 59 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 47f5391ad8e9..0b496676527a 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -208,6 +208,8 @@ static const struct drm_ioctl_desc xe_ioctls[] = {
>  	DRM_IOCTL_DEF_DRV(XE_MADVISE, xe_vm_madvise_ioctl, DRM_RENDER_ALLOW),
>  	DRM_IOCTL_DEF_DRV(XE_VM_QUERY_MEM_RANGE_ATTRS, xe_vm_query_vmas_attrs_ioctl,
>  			  DRM_RENDER_ALLOW),
> +	DRM_IOCTL_DEF_DRV(XE_EXEC_QUEUE_SET_PROPERTY, xe_exec_queue_set_property_ioctl,
> +			  DRM_RENDER_ALLOW),
>  };
>  
>  static long xe_drm_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 78b3a0e2ddd3..0264cab00fd4 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -747,6 +747,37 @@ static const xe_exec_queue_set_property_fn exec_queue_set_property_funcs[] = {
>  							exec_queue_set_multi_queue_priority,
>  };
>  
> +int xe_exec_queue_set_property_ioctl(struct drm_device *dev, void *data,
> +				     struct drm_file *file)
> +{
> +	struct xe_device *xe = to_xe_device(dev);
> +	struct xe_file *xef = to_xe_file(file);
> +	struct drm_xe_exec_queue_set_property *args = data;
> +	struct xe_exec_queue *q;
> +	int ret;
> +	u32 idx;
> +
> +	if (XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
> +		return -EINVAL;
> +
> +	q = xe_exec_queue_lookup(xef, args->exec_queue_id);
> +	if (XE_IOCTL_DBG(xe, !q))
> +		return -ENOENT;
> +

I didn't realize this was new code, so my comment here [1] about
dropping the check around
DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY is wrong, rather
pull that check into this patch. 

[1] https://patchwork.freedesktop.org/patch/684856/?series=156865&rev=1#comment_1257589

> +	idx = array_index_nospec(args->property,
> +				 ARRAY_SIZE(exec_queue_set_property_funcs));
> +	ret = exec_queue_set_property_funcs[idx](xe, q, args->value);
> +	if (XE_IOCTL_DBG(xe, ret))
> +		goto err_post_lookup;
> +
> +	xe_exec_queue_put(q);
> +	return 0;
> +
> + err_post_lookup:
> +	xe_exec_queue_put(q);
> +	return ret;
> +}
> +
>  static int exec_queue_user_ext_check(struct xe_exec_queue *q, u64 properties)
>  {
>  	u64 secondary_queue_valid_props = BIT_ULL(DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP) |
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h b/drivers/gpu/drm/xe/xe_exec_queue.h
> index 8cd6487018fa..61478b2e883b 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.h
> @@ -121,6 +121,8 @@ int xe_exec_queue_destroy_ioctl(struct drm_device *dev, void *data,
>  				struct drm_file *file);
>  int xe_exec_queue_get_property_ioctl(struct drm_device *dev, void *data,
>  				     struct drm_file *file);
> +int xe_exec_queue_set_property_ioctl(struct drm_device *dev, void *data,
> +				     struct drm_file *file);
>  enum xe_exec_queue_priority xe_exec_queue_device_get_max_priority(struct xe_device *xe);
>  
>  void xe_exec_queue_last_fence_put(struct xe_exec_queue *e, struct xe_vm *vm);
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 8ab44413646a..d72151163e77 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -106,6 +106,7 @@ extern "C" {
>  #define DRM_XE_OBSERVATION		0x0b
>  #define DRM_XE_MADVISE			0x0c
>  #define DRM_XE_VM_QUERY_MEM_RANGE_ATTRS	0x0d
> +#define DRM_XE_EXEC_QUEUE_SET_PROPERTY	0x0e
>  
>  /* Must be kept compact -- no holes */
>  
> @@ -123,6 +124,7 @@ extern "C" {
>  #define DRM_IOCTL_XE_OBSERVATION		DRM_IOW(DRM_COMMAND_BASE + DRM_XE_OBSERVATION, struct drm_xe_observation_param)
>  #define DRM_IOCTL_XE_MADVISE			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_MADVISE, struct drm_xe_madvise)
>  #define DRM_IOCTL_XE_VM_QUERY_MEM_RANGE_ATTRS	DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_VM_QUERY_MEM_RANGE_ATTRS, struct drm_xe_vm_query_mem_range_attr)
> +#define DRM_IOCTL_XE_EXEC_QUEUE_SET_PROPERTY	DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_SET_PROPERTY, struct drm_xe_exec_queue_set_property)
>  
>  /**
>   * DOC: Xe IOCTL Extensions
> @@ -2284,6 +2286,28 @@ struct drm_xe_vm_query_mem_range_attr {
>  
>  };
>  
> +/**
> + * struct drm_xe_exec_queue_set_property - exec queue set property
> + *
> + * Sets execution queue properties dynamically.

Mention which properties this IOCTL is valid for.

Matt

> + */
> +struct drm_xe_exec_queue_set_property {
> +	/** @extensions: Pointer to the first extension struct, if any */
> +	__u64 extensions;
> +
> +	/** @exec_queue_id: Exec queue ID */
> +	__u32 exec_queue_id;
> +
> +	/** @property: property to set */
> +	__u32 property;
> +
> +	/** @value: property value */
> +	__u64 value;
> +
> +	/** @reserved: Reserved */
> +	__u64 reserved[2];
> +};
> +
>  #if defined(__cplusplus)
>  }
>  #endif
> -- 
> 2.43.0
> 
