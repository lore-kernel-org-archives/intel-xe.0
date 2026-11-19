Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED83E606A320
	for <intel-xe@archiver.kernel.org>; Thu, 19 Nov 2026 22:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=A3pd/tHu;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=OwL3u3IF
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB47B112735;
	Thu, 19 Nov 2026 22:36:31 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9590B11277A
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Nov 2026 22:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795127779; x=1826663779;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=t00R3aksLjVPWRKvJ5RUZ+WmQvq55nGSTA8Y+X2Afs0=;
 b=A3pd/tHu3Nffc0vHw0R/Wx2k6Tejf5qcwnmzYomKzDeNsGQgMRAVugHT
 FooSceRQYY9w+oBnpi5uWU6+dogR6mQ/EhhhOX0Qunk3/Ci3erSryAJ+o
 7q023NGa3rSY9etclElEY3fPtCIEXAoWRf4smIj3rA14oHNG20NYCFHGW
 dln8OQdcWLAPfAJq2rQSIpwTPYN29LOJHUFV3euAaGKvlhf7yQXu4qHbK
 PBllvH7zUe0beJnrHtZhjQLzad7aFV1GLZ2xHM+l04Dxi+BXNuFfl9OZx
 YkRRocQGSkfeHuSVGipJ/YHJmso9xoWoSt0c9ecSaE+S6vlAYBtm6SNy3 g==;
X-CSE-ConnectionGUID: zwlbE9FDRwCKIvHYJ7984w==
X-CSE-MsgGUID: NHt8LpFISl+dhN27ufBhuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="4029788"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="4029788"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 14:36:19 -0800
X-CSE-ConnectionGUID: 7aXg+CMCQ9ee3dUZRCV0mQ==
X-CSE-MsgGUID: X0Pz1Z96QGq0f8WQfDwdkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; d="scan'208";a="10443251"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 14:36:19 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 19 Nov 2026 14:36:18 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 19 Nov 2026 14:36:18 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.14) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 19 Nov 2026 14:36:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RfFxXPL4XInnPsEziq2t2K4COekzIx3lGsXvcc5vYa084SN066byUQK4OWaU0bsGBPxYl/s7DBGCA0nwzLG027nuPBdg+nZO2AP05Fq7RfviQFT/l8LzxyEcBVTiXB/43/lZoqG+8+q+LE9+AdCfG4IxGLSfOF1z2hjrDbyk6d2z+15O3VbLul8nNACRsX6KHooFRLmxCclHrdpkakYjkz7M1MXCvmbb9kK4zgXrGxpUfkCxDqDCRr16lEH5motuBDHwBbdh3DCLcYmFG7c0XZmb8BmdFT+qy0ScLbdiWGPbq8Ie+6XIwqlXfBydnlnGWo1SY78ZXA5hBwL2sqxOrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/+j6JX74h4iN+3sTcouk8gmYX+8e3VJI8Qlaorf5lfo=;
 b=eFOcq991ceSEVePP8Shm7x+aKX/JYlqn+x4QMcu7sEwsfkJ/cdfMGl8+ZB8+9IlCE44aQBC9oS/7ftiYxUSaJ9OvQXT+AAZmvhmsdZHzZJbbDCC3ewV038VKah8K6jZyqQ+vb2R0aAZVdWmuMft3/fmPz6YG7Vj2Y1HM1Z29dMoO0OsvuW9WdZaClPD4kB1ovvv/8UAdmLxStup1FZob1HdsQ1EJBY1bt2dTs0mBDwGDjWFlikOiS3F8kW8tgIySHzLOLuEFDVAOLe6SF+2rpBV01xARivA0VKwHz5HGoN+mr94/+N8gxuX5Xzo5nftsSD+1R/0sPtc/AktAKZ1Rfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/+j6JX74h4iN+3sTcouk8gmYX+8e3VJI8Qlaorf5lfo=;
 b=OwL3u3IFANM5gwCN461O6IDBZmEiBJH6ITquTBncU0bL8HMXG+BFkJgizLiQqFuQbcxWMZfVCxISvCDjx0ezgz0IMMQFAZ9B4rFxKQUaHNDB6+Ixf2x2ZIl+TRow/MD51mJCcHjxs2Mq7eyBZGuPlgTpMOxQykIG3DkerwjNdQY=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4787.namprd11.prod.outlook.com (2603:10b6:303:95::23)
 by SN7PR11MB7019.namprd11.prod.outlook.com (2603:10b6:806:2ae::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Thu, 19 Nov
 2026 22:36:06 +0000
Received: from CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd]) by CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd%4]) with mapi id 15.21.0615.013; Thu, 19 Nov 2026
 22:36:06 +0000
Date: Thu, 19 Nov 2026 14:36:04 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <shekhar.chauhan@intel.com>,
 <harish.chegondi@intel.com>
Subject: Re: [PATCH v8 4/8] drm/xe: Reject vm_ops->access on BO mappings of
 an unplugged device
Message-ID: <av951Pol7BED74zP@gsse-cloud1.jf.intel.com>
References: <20261119002737.3899877-10-umesh.nerlige.ramappa@intel.com>
 <20261119002737.3899877-14-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261119002737.3899877-14-umesh.nerlige.ramappa@intel.com>
X-ClientProxiedBy: MW4PR04CA0370.namprd04.prod.outlook.com
 (2603:10b6:303:81::15) To CO1PR11MB4787.namprd11.prod.outlook.com
 (2603:10b6:303:95::23)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4787:EE_|SN7PR11MB7019:EE_
X-MS-Office365-Filtering-Correlation-Id: e5c9ccdd-c97a-4e1a-1603-08df468d7fe6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|261022075727099003|261102123227099003|10067099003|11063799006|56012099006|261026140227099003|4143699003|261026121527099003|261022105027099003|261021121427099003|261021123027099003|261028144727099003|22082099003|18002099003|261009223027099003;
X-Microsoft-Antispam-Message-Info: rG1Qq/4TSztAehPV4+EyNb1KU77+q3e0xAPyy9owlwhV9SQaPAEqvZ0m3jzpaOUOikBM6etcOtzEB60E6jHe5SYVAPmW/JvxD9mmowMW4nnlylpEEli2o+UvvHLH5s0ATQSCW2UvhIGOJ6RHONZhYTuN2FH9S1OiLdB9FKGzI7mwdn1TJScmjSoV/sDBNszjMWgggJZistcc+Toulm/9aM/lX6MuG+0VZd7q6nD72rcSQ6x30KuQ7KZDZUigYU1y3p0khTIXMw7fFGWLpQ4R1AvGdmkTQyoVgyDGHKQDg2Yw+/wqUvpkrWVkCnZ3CzKVpqIptFbQxigpMWW39q6sJrYwgLerYqbgC57svE9qw5Q2wPbh69H2dst6AM5eAT3Hq+eA7OxYh/z5tAR1t36rxDCsQFmG1QZam1yeJM0PHYVS06krfrJGY0RDR+E2mGfJKUM33nOvMBPy+s60yQbyb3p1YDaczzSow0ZZxMgJCRgqXXpnCHECQlEyctUtLL/P8o5WHOn+nViu7BsJg2aX7CkNBi53/eGJWpy4yWfDmE9FBMWHyHUuwuZ17U1eL5kTBSSEFI+yKJ7KuIMAv0u8CoVWVU24noANLJ0ZJdnGU8+sHgCUn8X4aHZWruRR4LzYQ6qHadygAFiyr4yzIgubNdXqy0Z//1DBq/kFfb0e6/s=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4787.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(261022075727099003)(261102123227099003)(10067099003)(11063799006)(56012099006)(261026140227099003)(4143699003)(261026121527099003)(261022105027099003)(261021121427099003)(261021123027099003)(261028144727099003)(22082099003)(18002099003)(261009223027099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fdNx0Bz8iW7okNhnk/d/8hlIgW6OBsc7H7pp3MNMYbyQz4RCK3DA+0gZwmxH?=
 =?us-ascii?Q?YJQ1XxnWTMxpkQ3KZh08ebE62s1Nkk3Pj23bMM8mJLeeIOcw6ZwghptRyc0W?=
 =?us-ascii?Q?KejRMBUQWEecb0/Ed1XEqPKlrBjVRUBsyORUYkX8O1MbL7d49xERH0GWW0tT?=
 =?us-ascii?Q?byIB/8X1eoYzrl4RhVxC7i+gdgSEyoQvU7HuQ5lusWKxLCeiyYmUjNTaPsSR?=
 =?us-ascii?Q?s1vCGcb8IzM1FFpY9q7BIGiE4Ck7gziDhgMDAkIRxtqyviYYbQ/E4c2IEay5?=
 =?us-ascii?Q?P52/GcCG+N9TVA9vEgNFu9pGOuuJWq0WtMRU8bHPLvcibHxlyEq7+c1vUrRu?=
 =?us-ascii?Q?rEsPPi/pBOQjlW1elEyRxmbz3BUX49cNH5p/q92hRHGGop+ntD5wohcTNm36?=
 =?us-ascii?Q?GKUTqoMCxdE2GFIlHjS5Au9umahqUrRIUeE/ZyjK6vPygddja/hNadqc5IOR?=
 =?us-ascii?Q?MfCnGjM45UiiE9ObH3W4wkt8WF4APILt/kOJj/vEe4C/kIIzBmBl2169yW08?=
 =?us-ascii?Q?FTD93qeo/ytY2Mt1SOg98x+yLha9d1Zx3tYRyypk/nq/zvFqx9Vyj6s+0HCM?=
 =?us-ascii?Q?QLLuKPYX7y1q4lr/fwhuOspxS4Wxwe7se9O2/V/kRCFF/Pphv/EQGdl0Oe9/?=
 =?us-ascii?Q?c8fR1Bj8rFENt/Qjzivz+M3oKayBxP2yfi4yywZbcCaMnilf6arZ59qbolM+?=
 =?us-ascii?Q?JbWrAMSlMloQM07s27XvmIHkYrpC5MRzdX730KseaRg+mWxGPacNhnZG4HuH?=
 =?us-ascii?Q?H1Nev0VUHW8bQG/8yD2nZX1Czvj/FCGIiWk1eFNAwrrkN1J4HNdoOluCWCFC?=
 =?us-ascii?Q?m9sXknWseDGoDCZiXzlbNMQl22eaEqmdo2N9Hpmn+bajhgP21LaGMGk/Nv2w?=
 =?us-ascii?Q?xmAJAmLppJvUexElMEPr2win/iR/Y4mLlhHtKEO5xCQnOLZg9ywPvC64ECvh?=
 =?us-ascii?Q?Cfh5tQWb5qEeevs52KvSn5ddBD03tq4abtqOSE/kHARiPKJqIkRZabNkEHdh?=
 =?us-ascii?Q?TO5nmdu3Li4whREIS7JFxdt+aZKXzVUN/kCTceIdLtWtQPPoPJyQEs0EwjYJ?=
 =?us-ascii?Q?dNvYkxO+IA6YhND5XlNUZdqDjA716t4Apk+R0qbcJEY0kXvuWe+IiIkUmvrM?=
 =?us-ascii?Q?sYf2tvjXtwwSUdsI43wU+irVTgsRyDqr+KskTv446jGZDlEnfGzKY2X6YC+y?=
 =?us-ascii?Q?Ev8MFzStKGeCa12v2L0AO6q2bSGuMQWiqpXMkB49BPzKALDxTLoD+7GSsYh1?=
 =?us-ascii?Q?6XhH+GiAamRexlIYbztmLwnQeO3qBlRLZEXKiEmpOlQAHajT2Ci8XN844+X/?=
 =?us-ascii?Q?4Bd9XfgBmFncwFzxesqS2x4JypCBB7iVuyI6Dld9O23Ydq6sz1l4mxUEkIzp?=
 =?us-ascii?Q?aCviJLFZPZ7pzNbNbisU+5f2nj5OX5p88HYmm5e57p1MmOD4wf0/DsXYhXjc?=
 =?us-ascii?Q?OIRCfd4SyfFxAHlSxI6yZ+SOCG+ZpDo9+Skb8R4q7b1NvHCAS2HWHY5QbCdq?=
 =?us-ascii?Q?NZ68RNYgGe6XQ9wXZNdD9wLGbyD7hQvIo5qg273Cp5fqh6lTva+VWfELnH6R?=
 =?us-ascii?Q?JraIx1qyD6ZYJKLsxBR5ubt4Lw1nUrZxIzrYYpPPI1udOUmMxXa0VQcACcZY?=
 =?us-ascii?Q?FI6EEUI4aUM1te+vN+AmwftZgP/TIXhaBoaPkJAtXX3LIZ0eENSgEIwKulqX?=
 =?us-ascii?Q?3IopdWHLtCjTK5V41VCVt4Cd+20f+njn+f0yGhSlMaHabeCpW2Ol5V5vB9fK?=
 =?us-ascii?Q?Yy3LxH6DMw=3D=3D?=
X-Exchange-RoutingPolicyChecked: HULAO0xHzhljycUCHi9JA6w1chZhKOzdg1yHS46K4A13/DZBdXJxbEsLrFxJzg/483uGdgsULEQufJqZikqeYpAeHFTAd5tzdTaRP9lNVZes1yBKkIvW5Yvl9JzvkJKT2C25UeSJHVvBah50anga/BIvLnka0dcGyJ9QhZMmg1kvurxjKy3OTv+fagl5ARaVZXbA0msFf3dJ3Y9PopJ6KSaqr2YgZzJJwcPI8I8r4BDN/h7kqJGABNL/qw9I2dgY3R/mfP2JmL6ivYiUtBVoWXcL/R0U+iY9x9550m8bxJJhW6dh51d3D9ubobKpasTiPLCIcTNJogTUSFfM0Rp6Qw==
X-MS-Exchange-CrossTenant-Network-Message-Id: e5c9ccdd-c97a-4e1a-1603-08df468d7fe6
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4787.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 22:36:06.2269 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lW4/RTGtYMyUJhQtwgcyg9J4bNXmFuM9jRS5CY5Kizr4rDH0GFZorYKgLnFL/k3k3WCxpVBxg4Q3/4Z94/6FGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7019
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 18, 2026 at 04:27:42PM -0800, Umesh Nerlige Ramappa wrote:
> A userspace mapping of a BO can outlive the device, e.g. across unbind
> or a PCI slot reset. After drm_dev_unplug() the fault handler only
> installs a dummy page, but ptrace, /proc/<pid>/mem and
> process_vm_readv() can't use get_user_pages() on these VM_PFNMAP vmas
> and fall back to vm_ops->access(), i.e. xe_bo_vm_access().
> 
> xe_bo_vm_access() doesn't check whether the device is still there. For
> a BO in VRAM, xe_ttm_access_memory() then either goes through the VRAM
> iomap, which is unmapped on remove, or submits a migrate job after the
> GT has been torn down. This applies to GEM mmaps and to the OA buffer
> mmap of an OA stream that outlives the device.
> 
> Enter a drm_dev_enter() section in xe_bo_vm_access() and fail with
> -ENODEV once the device is unplugged, like xe_bo_cpu_fault() does.
> 
> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

I'd add a fixes tag as Sashiko suggests.

Patch looks correct though:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_bo.c | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 42a6aa1a2e4a..a74c38df2bdd 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -2345,9 +2345,20 @@ static int xe_bo_vm_access(struct vm_area_struct *vma, unsigned long addr,
>  	struct ttm_buffer_object *ttm_bo = vma->vm_private_data;
>  	struct xe_bo *bo = ttm_to_xe_bo(ttm_bo);
>  	struct xe_device *xe = xe_bo_device(bo);
> +	int idx, ret;
>  
> -	guard(xe_pm_runtime)(xe);
> -	return ttm_bo_vm_access(vma, addr, buf, len, write);
> +	/*
> +	 * A mapping can outlive the device. Once it's unplugged, VRAM is unmapped and the
> +	 * migrate engines are gone, so refuse access, like the fault handler does.
> +	 */
> +	if (!drm_dev_enter(&xe->drm, &idx))
> +		return -ENODEV;
> +
> +	scoped_guard(xe_pm_runtime, xe)
> +		ret = ttm_bo_vm_access(vma, addr, buf, len, write);
> +
> +	drm_dev_exit(idx);
> +	return ret;
>  }
>  
>  /**
> -- 
> 2.55.0
> 
