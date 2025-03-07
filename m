Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0458DC19F32
	for <intel-xe@archiver.kernel.org>; Fri,  7 Mar 2025 14:33:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF12A10E0E0;
	Fri,  7 Mar 2025 14:33:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hoLjvSkR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2042E10E0E0
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Mar 2025 14:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741358026; x=1772894026;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=MvW50KimZHsJE/nUm3XWc96B06OZzLIjBdigQ6YMyJw=;
 b=hoLjvSkREODWrpeV5mq3CU+giXcP5DADV0idgdGJN+hRMwup30ZK5tsX
 77RtmwSs+BAC/M4I/BticsbwyZTPRSy+Z9xozYZRDtKTt75PMkwDl+5+3
 dNAgAI0Gfrt9V4SXhd5viu5ZZbRHlLwUow+qCOm3e+PbKnPU9LTssYORI
 xpmwL8orB3jvJaHP7iXY8/fnH5U2OMCnn+rBA+r5ZdeLEBawSwwl+3O7u
 RTjLRYmKGVrRXehtf5kzJjY98r7eEFcl/NM3OYEJFW1+gPRMIN6lGNGMA
 leKG1PAH5FFWld77kmrek3bUsDt4DbHY4M3yFzu7IDq8ak3aekPxcWX/s Q==;
X-CSE-ConnectionGUID: Qnfp6QOsR0Omk2z4VCbOyw==
X-CSE-MsgGUID: MSJtcFoMRe2rsfLELoeIDQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="53795818"
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; d="scan'208";a="53795818"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2025 06:33:41 -0800
X-CSE-ConnectionGUID: ZMUb+ngFS+ybfoUaniDV2A==
X-CSE-MsgGUID: IFbmVcENS4alWDucuB1kNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; d="scan'208";a="150130211"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2025 06:33:41 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 7 Mar 2025 06:33:40 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 7 Mar 2025 06:33:40 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 7 Mar 2025 06:33:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jMoqKbydOh4I0Dwns9RhkPFyBN0P9Mwma/gsGmqfSkzEpGw/fOvsuYJ7jZHAKrSsTWFpmjHyYV1boDa/GxxllFcFKXN65pnPCi5mpuheZzdLaIPR4mLeYb1nkxau96iWQw4VmYrNzhJXrCm0ilQ4v2OeFvY+YjkYzmAMpfQDnz23iARysKe4ACzzu95Bwj7b25Oy42TOG0I3PDwRDn0yZVlNpUJGCxnER+GZzqTsuJhUolNP+KK0RpEJ8Efau9uUgeyznnkVgcaq3fgK0H3DO5ntya6YrvdtcwIPDJR/l+2GsG1WzkXHG/jY7hdEZvalqD2YsigjL6CiKFMTIiAIGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hmvxGPa4n2lHc8b3X/nY+iFpQpxKDfrzkVEgsJ7XfNo=;
 b=lDLkYIgkmhznUSOQ7WWl6V+DFdMKk4mL5esBA6q5EH/OGRqSHjyzZXEz8C1tgQC3x8B7cp7xcIobHOn2AI0sGAiEUHBFjMFGtDoO7/GfG3dEgHOYagFfCjQqMImsTDGptTkgMObRt09NI8yaKRN7eiUCp4iQwFDJADm9l4hGI8l2qGQtDhFbHr53DwaNazPQ07R2uhFHtJtbAX2oD0jdIR6qZZ3rgR/LxDubiUwryvHuXBCabdHDqYX3RUiHYPZsgrM8nvo26ueqjXxd0QH2Vn6bX+eLUdd5t8YipVMyKb4UUCvlOkD+/iM5JwhkByeeVWZj3YucCehD9p0Z3tlu5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by IA1PR11MB6321.namprd11.prod.outlook.com (2603:10b6:208:38b::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.19; Fri, 7 Mar
 2025 14:33:09 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%4]) with mapi id 15.20.8511.020; Fri, 7 Mar 2025
 14:33:09 +0000
Date: Fri, 7 Mar 2025 09:33:05 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: <lucas.demarchi@intel.com>, <matthew.d.roper@intel.com>,
 <andi.shyti@linux.intel.com>, <intel-xe@lists.freedesktop.org>,
 <anshuman.gupta@intel.com>, <riana.tauro@intel.com>,
 <badal.nilawar@intel.com>, <karthik.poosa@intel.com>,
 <aravind.iddamsetty@linux.intel.com>
Subject: Re: [PATCH v2] drm/xe/hwmon: expose fan speed
Message-ID: <Z8sDoWxu0dUEpAQ-@intel.com>
References: <20250307125112.575242-1-raag.jadav@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250307125112.575242-1-raag.jadav@intel.com>
X-ClientProxiedBy: MW2PR16CA0035.namprd16.prod.outlook.com (2603:10b6:907::48)
 To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|IA1PR11MB6321:EE_
X-MS-Office365-Filtering-Correlation-Id: 81a95eb4-842f-4c6a-3967-08dd5d84fb5a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+YIaPwcnZUhWPkbYCiEfSuAK17Ws6snfDMcNscHaeiE/llSmR3gR+JOzM84E?=
 =?us-ascii?Q?R+pHr6lq9ZiTJk9Beu7o8vTcGddKpQ3nMtkucflffW608INX3KxzdaxAiMb2?=
 =?us-ascii?Q?qD6WpGeuhiHXL2z0G8hKlQ9A8xnwI4lpn5TZflYhxGvssMpf4/f37iR5l/rY?=
 =?us-ascii?Q?b6Ckx8maNgNUJNG2dLBnWfTy8ig2H3U3c/ze65C1aA++NKCJzq5z+uXjVau/?=
 =?us-ascii?Q?4ALj/yA/Y7H7XaOpJi4/nBakqHysjWMb0u+a5NYCjhlXUIGKygm5pn3iypJP?=
 =?us-ascii?Q?97LAiN861SZUFKpP+uxLLsf/M8oUWp+AeGOk0ALIocfroSkoc6j5Qov3X/8Y?=
 =?us-ascii?Q?jSx+BVMUE41Mzt11pDbN0Nr4/SmWhfuPveYbNEFywLTy/8s2th5EMZ5s0CWh?=
 =?us-ascii?Q?608YsJdbHTKIgt5MpgoPHY6YJkt5WaM7N6GjxNNLmTLiOJj+s+gZ5k0PamSj?=
 =?us-ascii?Q?dbDg0DWFIJcLZAWJTRkoAdfSoNq5MUsp84jkAT+MHNPI3vP6k7upu9MDyg0Q?=
 =?us-ascii?Q?UaDqKdEFqyIDnkiOruuDhR1oWJ7jYzxXQzCeluv0hkOxLOqxlkgIICC0/fuo?=
 =?us-ascii?Q?lZCl/cPtUyYq+HFwIKnrCIDd1NdGNZilUlXGXImKUENy+I14fken6Zwp8A3d?=
 =?us-ascii?Q?I/rNoL7sfUUzBVv52qpUvNhdbwVPz8t3pDng+el3cauk4zs5hj7o0gxhT1CB?=
 =?us-ascii?Q?PhUnJsxI3azAJmLyDEak6WfX5zKFoOHkTDlezj6Dwnw1+UhtV+sgciFoze/e?=
 =?us-ascii?Q?7BlFtPGybtFubxzWfflHe1cOe1NIALuH1sYZJUFpevVL7HttnYZHtITmCV87?=
 =?us-ascii?Q?EhWwqh7tMH7t8Td84rjKmM4EEvZRMPe3e6Wz/h77QdZrgqDsz7Be5qlwTefQ?=
 =?us-ascii?Q?bXc98sB4dqVnLcRwJL0MeriPDim8bFY3QYVYYhrjTErui5OPDG2eFUrMq0QW?=
 =?us-ascii?Q?jCprH7YfvvNKPXqdlj2ZMM01FS8hp36UC7ERIVsjWW/qJrCpLxypPVHMh+w9?=
 =?us-ascii?Q?kZXY+mabjYYOb8AmABm+mxNhdEWy0mI24bhcYTnliMT+vEb/RQY2mwdf99ex?=
 =?us-ascii?Q?vIj5ru3OGYG5cg1VSGPQqIUgE+UI3bBN8nDjdRAaHLf142HMimBBv8aYON8l?=
 =?us-ascii?Q?SZpF0ph3nZ/eqXotmV6LkxB8g7VRGmCI2APYyHuKO33K6pfdOdrsFgoq3ecy?=
 =?us-ascii?Q?CBjHfvn88kH2jVLORBQsd39k8oWSR4Fqe5j0se8kIT28W5BxIOd52NtmQ2rE?=
 =?us-ascii?Q?fDFodO2ta/HHw244Ie4QOK8ld2zmWy8cKxLalLhluRp+TP6ULntJd5RR7pby?=
 =?us-ascii?Q?QqcWeOamhmbWKFSExBpKVgk2XwJTgQRPGwUaqGws+COd+pqstBRhFtkzR7pG?=
 =?us-ascii?Q?KmubC+uzCHPiCVgnEwJGDqflrDlE?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HTM2p2M5py6XzTepjo2YUzfGGOpZOwn4V1g7jtIhrlSijQevWIkbr9CZbgaU?=
 =?us-ascii?Q?qISnafEu03T8O7Ry7/UIud7oTkz4JQuYAZioRwT8FlNjLqzZLgoZJOu+Twdy?=
 =?us-ascii?Q?A614B1ExnN6S/FsuN9O3y4ti7kgvvuSiFf7OsMlm3Oe32rJWuhcXnr5Yn8CM?=
 =?us-ascii?Q?eLSll8RiElHN5AiXMmH5emySgwFnMtPRcceNQZ2FOyhnENkoq0qTEdX6zbpE?=
 =?us-ascii?Q?dSM027Kg9UVk5lLhuUkII3LhcTZjk395CG1Dl5Wr6gLhsZP42gQ/PyDQK2e+?=
 =?us-ascii?Q?IBfkzESNlb/SwBk0D1FI14lt6fugjJykpzBaD0U/Kl2f6AZoyuDiMKFomBss?=
 =?us-ascii?Q?AVfvJfl+l/gXKSL9BFAWEYWHUJx2mbb4TnUFJ0dHFsbda0w5h0qhjWEPsPHX?=
 =?us-ascii?Q?Opn2xvVqIJd40lo/FZuyL3grCx0ItOVHSZ0TRiip4C1aMIgWohQG++iVLHgW?=
 =?us-ascii?Q?mwwNLKwrVZjW8AaJ+LVo7wwj7MjfGTb9KSlRFfJxCAGVnWboM6JFkSPmFas2?=
 =?us-ascii?Q?tqgiA0JmNEjPDHFJPpXCgmqbVikb7b7NiSYqaFknSdQFDVNr3VWb/a4q7Hyc?=
 =?us-ascii?Q?r3H6QN9n6fK2XNnkyU9HtzmiyUiAR5MOjBmBjT9TrnCm8pjtPSaOLOpEz3ea?=
 =?us-ascii?Q?p+RWAm/JBF30zTqBGe2+Wk1KNN/5YAdGLiEcEZbb6cEQ+imNOp7YrnxY5qdu?=
 =?us-ascii?Q?zji0th3aCau0XJ9vrBlQahKnZ9Y9hhOws5elOKWgHk2fS6DB+hEYy4eoWEM4?=
 =?us-ascii?Q?6OdgkRfs2ZDsiQDtv3oDLF/Oh4d/F1EISv94cEvW31SCbTI6/T1WLRCsnMST?=
 =?us-ascii?Q?BE5GLO+nbpD5XrEs4WmIHh4Duv8TYfdj+jjSC5QBK7rBVGAXp/JX7OVE3Wuz?=
 =?us-ascii?Q?MM7hMMi+Cy8icuu3Z07PJJ7AcTJmlyYAzUwbqbErUTABEgJAMsOxIUaivQcV?=
 =?us-ascii?Q?WWJ9gcPO2d6+xzWpgAENq+FGy9KE+cLDCPPiRcsmSyG/bftK/5Ps2ZAE+tEK?=
 =?us-ascii?Q?Udaw8vKx95DwI7jcjlg6F4AiWJ+meewAn9O5lkBUJLquf2OTegnJiT9YgVOp?=
 =?us-ascii?Q?8nKmMWqBBkMgj/m3lcVjcUPTW7F7xvU+i/t9u5NN0qGZYbUnlmsC+5gvmNyR?=
 =?us-ascii?Q?Z/EzbbwcUcXhLbJF3mgI7Cp4yohpxHMOub2ZOePhlIJ0diFzuGi1tjdb3I7a?=
 =?us-ascii?Q?3xB0YDnF3lDiUetxlkKFTsgeyNA/YUY7fcTHkaXIBXofmazFyRj2FE3xW6YQ?=
 =?us-ascii?Q?kKv2zfOoUMAAd5cFGqkDtFjXefXATgzVCWPWKxeKwKsilht3QQTCTiG/pkbu?=
 =?us-ascii?Q?WNyPonffMVAl56cYh/Cb8LqkcYRC8P/B8Se97vc5ZIGZ3Qm3CcPzwIIxth5/?=
 =?us-ascii?Q?bLA1EwUU7CkcSgdnJ44QXqCRduFRuWwGxptAa68abvtbLKS1CeLq+ZsABH/w?=
 =?us-ascii?Q?F70fIev0UoXKOb5PFlkV3iC8T84ZrCUFrGlk4RYUSMfoA3LuZSPi+oFbgef0?=
 =?us-ascii?Q?epkdSv200/oVxpSIvy4W9nm8PHIBIGKR84B8lJlQhis9HT7/shTzmPzb+fzz?=
 =?us-ascii?Q?p+8NuDx0uyLaazWO4fsuwGwM0pAf+zdYUTJPsQWFJd7KLxbqK6yrksCyRA4G?=
 =?us-ascii?Q?uQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 81a95eb4-842f-4c6a-3967-08dd5d84fb5a
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2025 14:33:09.2621 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y0GppqzLXOsHXmeAA+1lLPgCQ1rr5eLlfaxMPSd67pgAyOnPpy4EuUB2KDdDKGRLoMtclRH8X5A4VfiZBlCUMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6321
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

On Fri, Mar 07, 2025 at 06:21:12PM +0530, Raag Jadav wrote:
> Add hwmon support for fan1_input, fan2_input and fan3_input attributes,
> which will expose fan speed of respective channels in RPM when supported
> by hardware. With this in place we can monitor fan speed using lm-sensors
> tool.
> 
> v2: Rely on platform checks instead of mailbox error (Aravind, Rodrigo)
> 
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
> ---
>  .../ABI/testing/sysfs-driver-intel-xe-hwmon   |  24 ++++
>  drivers/gpu/drm/xe/regs/xe_pcode_regs.h       |   3 +
>  drivers/gpu/drm/xe/xe_hwmon.c                 | 129 +++++++++++++++++-
>  drivers/gpu/drm/xe/xe_pcode_api.h             |   3 +
>  4 files changed, 158 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> index 9bce281314df..adbb9bce15a5 100644
> --- a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> +++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> @@ -124,3 +124,27 @@ Contact:	intel-xe@lists.freedesktop.org
>  Description:	RO. VRAM temperature in millidegree Celsius.
>  
>  		Only supported for particular Intel Xe graphics platforms.
> +
> +What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/fan1_input
> +Date:		March 2025
> +KernelVersion:	6.14
> +Contact:	intel-xe@lists.freedesktop.org
> +Description:	RO. Fan 1 speed in RPM.
> +
> +		Only supported for particular Intel Xe graphics platforms.
> +
> +What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/fan2_input
> +Date:		March 2025
> +KernelVersion:	6.14
> +Contact:	intel-xe@lists.freedesktop.org
> +Description:	RO. Fan 2 speed in RPM.
> +
> +		Only supported for particular Intel Xe graphics platforms.
> +
> +What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/fan3_input
> +Date:		March 2025
> +KernelVersion:	6.14
> +Contact:	intel-xe@lists.freedesktop.org
> +Description:	RO. Fan 3 speed in RPM.
> +
> +		Only supported for particular Intel Xe graphics platforms.
> diff --git a/drivers/gpu/drm/xe/regs/xe_pcode_regs.h b/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
> index 8846eb9ce2a4..c7d5d782e3f9 100644
> --- a/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
> @@ -21,6 +21,9 @@
>  #define BMG_PACKAGE_POWER_SKU			XE_REG(0x138098)
>  #define BMG_PACKAGE_POWER_SKU_UNIT		XE_REG(0x1380dc)
>  #define BMG_PACKAGE_ENERGY_STATUS		XE_REG(0x138120)
> +#define BMG_FAN_1_SPEED				XE_REG(0x138140)
> +#define BMG_FAN_2_SPEED				XE_REG(0x138170)
> +#define BMG_FAN_3_SPEED				XE_REG(0x1381a0)
>  #define BMG_VRAM_TEMPERATURE			XE_REG(0x1382c0)
>  #define BMG_PACKAGE_TEMPERATURE			XE_REG(0x138434)
>  #define BMG_PACKAGE_RAPL_LIMIT			XE_REG(0x138440)
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index 48d80ffdf7bb..c52a2bfd770e 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -5,6 +5,7 @@
>  
>  #include <linux/hwmon-sysfs.h>
>  #include <linux/hwmon.h>
> +#include <linux/jiffies.h>
>  #include <linux/types.h>
>  #include <linux/units.h>
>  
> @@ -27,6 +28,7 @@ enum xe_hwmon_reg {
>  	REG_PKG_POWER_SKU_UNIT,
>  	REG_GT_PERF_STATUS,
>  	REG_PKG_ENERGY_STATUS,
> +	REG_FAN_SPEED,
>  };
>  
>  enum xe_hwmon_reg_operation {
> @@ -42,6 +44,13 @@ enum xe_hwmon_channel {
>  	CHANNEL_MAX,
>  };
>  
> +enum xe_fan_channel {
> +	FAN_1,
> +	FAN_2,
> +	FAN_3,
> +	FAN_MAX,
> +};
> +
>  /*
>   * SF_* - scale factors for particular quantities according to hwmon spec.
>   */
> @@ -61,6 +70,16 @@ struct xe_hwmon_energy_info {
>  	long accum_energy;
>  };
>  
> +/**
> + * struct xe_hwmon_fan_info - to cache previous fan reading
> + */
> +struct xe_hwmon_fan_info {
> +	/** @reg_val_prev: previous fan reg val */
> +	u32 reg_val_prev;
> +	/** @time_prev: previous timestamp */
> +	u64 time_prev;
> +};
> +
>  /**
>   * struct xe_hwmon - xe hwmon data structure
>   */
> @@ -79,6 +98,8 @@ struct xe_hwmon {
>  	int scl_shift_time;
>  	/** @ei: Energy info for energyN_input */
>  	struct xe_hwmon_energy_info ei[CHANNEL_MAX];
> +	/** @fi: Fan info for fanN_input */
> +	struct xe_hwmon_fan_info fi[FAN_MAX];
>  };
>  
>  static struct xe_reg xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg hwmon_reg,
> @@ -144,6 +165,16 @@ static struct xe_reg xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg
>  			return PCU_CR_PACKAGE_ENERGY_STATUS;
>  		}
>  		break;
> +	case REG_FAN_SPEED:
> +		if (xe->info.platform == XE_BATTLEMAGE || xe->info.platform == XE_DG2) {

we should probably have a has_fan_control flag in the platform definition struct so you
don't need to do platform checks here and it gets easier when we need to add new platforms.

> +			if (channel == FAN_1)
> +				return BMG_FAN_1_SPEED;
> +			else if (channel == FAN_2)
> +				return BMG_FAN_2_SPEED;
> +			else if (channel == FAN_3)
> +				return BMG_FAN_3_SPEED;
> +		}
> +		break;
>  	default:
>  		drm_warn(&xe->drm, "Unknown xe hwmon reg id: %d\n", hwmon_reg);
>  		break;
> @@ -454,6 +485,7 @@ static const struct hwmon_channel_info * const hwmon_info[] = {
>  	HWMON_CHANNEL_INFO(curr, HWMON_C_LABEL, HWMON_C_CRIT | HWMON_C_LABEL),
>  	HWMON_CHANNEL_INFO(in, HWMON_I_INPUT | HWMON_I_LABEL, HWMON_I_INPUT | HWMON_I_LABEL),
>  	HWMON_CHANNEL_INFO(energy, HWMON_E_INPUT | HWMON_E_LABEL, HWMON_E_INPUT | HWMON_E_LABEL),
> +	HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT, HWMON_F_INPUT, HWMON_F_INPUT),

here as well... I believe we should not expose the fan files if !has_fan_control

>  	NULL
>  };
>  
> @@ -480,6 +512,24 @@ static int xe_hwmon_pcode_write_i1(const struct xe_hwmon *hwmon, u32 uval)
>  			      (uval & POWER_SETUP_I1_DATA_MASK));
>  }
>  
> +static int xe_hwmon_pcode_read_num_fans(const struct xe_hwmon *hwmon, u32 *uval)
> +{
> +	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
> +
> +	/* Platforms that don't return correct value */
> +	if (hwmon->xe->info.platform == XE_DG2) {
> +		*uval = 2;
> +		return 0;
> +	}
> +
> +	/* Avoid Illegal Subcommand error */
> +	if (hwmon->xe->info.platform != XE_BATTLEMAGE)
> +		return -ENXIO;

perhaps if the file is not exposed you don't even need this check here...
but if needed even when fan file is not exposed, then you use the
has_fan_control flag instead of the the platform checks here as well.

> +
> +	return xe_pcode_read(root_tile, PCODE_MBOX(FAN_SPEED_CONTROL,
> +			     FSC_READ_NUM_FANS, 0), uval, NULL);
> +}
> +
>  static int xe_hwmon_power_curr_crit_read(struct xe_hwmon *hwmon, int channel,
>  					 long *value, u32 scale_factor)
>  {
> @@ -705,6 +755,72 @@ xe_hwmon_energy_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
>  	}
>  }
>  
> +static umode_t
> +xe_hwmon_fan_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
> +{
> +	u32 uval;
> +
> +	switch (attr) {
> +	case hwmon_fan_input:
> +		if (xe_hwmon_pcode_read_num_fans(hwmon, &uval))
> +			return 0;
> +
> +		return channel < uval ? 0444 : 0;
> +	default:
> +		return 0;
> +	}
> +}
> +
> +static int
> +xe_hwmon_fan_input_read(struct xe_hwmon *hwmon, int channel, long *val)
> +{
> +	struct xe_mmio *mmio = xe_root_tile_mmio(hwmon->xe);
> +	struct xe_hwmon_fan_info *fi = &hwmon->fi[channel];
> +	u64 rotations, time_now, time;
> +	u32 reg_val;
> +	int ret = 0;
> +
> +	mutex_lock(&hwmon->hwmon_lock);
> +
> +	reg_val = xe_mmio_read32(mmio, xe_hwmon_get_reg(hwmon, REG_FAN_SPEED, channel));
> +	time_now = get_jiffies_64();
> +
> +	/*
> +	 * HW register value is accumulated count of pulses from PWM fan with the scale
> +	 * of 2 pulses per rotation.
> +	 */
> +	rotations = (reg_val - fi->reg_val_prev) / 2;
> +
> +	time = jiffies_delta_to_msecs(time_now - fi->time_prev);
> +	if (unlikely(!time)) {
> +		ret = -EAGAIN;
> +		goto unlock;
> +	}
> +
> +	/*
> +	 * Calculate fan speed in RPM by time averaging two subsequent readings in minutes.
> +	 * RPM = number of rotations * msecs per minute / time in msecs
> +	 */
> +	*val = DIV_ROUND_UP_ULL(rotations * (MSEC_PER_SEC * 60), time);
> +
> +	fi->reg_val_prev = reg_val;
> +	fi->time_prev = time_now;
> +unlock:
> +	mutex_unlock(&hwmon->hwmon_lock);
> +	return ret;
> +}
> +
> +static int
> +xe_hwmon_fan_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
> +{
> +	switch (attr) {
> +	case hwmon_fan_input:
> +		return xe_hwmon_fan_input_read(hwmon, channel, val);
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
>  static umode_t
>  xe_hwmon_is_visible(const void *drvdata, enum hwmon_sensor_types type,
>  		    u32 attr, int channel)
> @@ -730,6 +846,9 @@ xe_hwmon_is_visible(const void *drvdata, enum hwmon_sensor_types type,
>  	case hwmon_energy:
>  		ret = xe_hwmon_energy_is_visible(hwmon, attr, channel);
>  		break;
> +	case hwmon_fan:
> +		ret = xe_hwmon_fan_is_visible(hwmon, attr, channel);
> +		break;
>  	default:
>  		ret = 0;
>  		break;
> @@ -765,6 +884,9 @@ xe_hwmon_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
>  	case hwmon_energy:
>  		ret = xe_hwmon_energy_read(hwmon, attr, channel, val);
>  		break;
> +	case hwmon_fan:
> +		ret = xe_hwmon_fan_read(hwmon, attr, channel, val);
> +		break;
>  	default:
>  		ret = -EOPNOTSUPP;
>  		break;
> @@ -842,7 +964,7 @@ static void
>  xe_hwmon_get_preregistration_info(struct xe_hwmon *hwmon)
>  {
>  	struct xe_mmio *mmio = xe_root_tile_mmio(hwmon->xe);
> -	long energy;
> +	long energy, fan_speed;
>  	u64 val_sku_unit = 0;
>  	int channel;
>  	struct xe_reg pkg_power_sku_unit;
> @@ -866,6 +988,11 @@ xe_hwmon_get_preregistration_info(struct xe_hwmon *hwmon)
>  	for (channel = 0; channel < CHANNEL_MAX; channel++)
>  		if (xe_hwmon_is_visible(hwmon, hwmon_energy, hwmon_energy_input, channel))
>  			xe_hwmon_energy_get(hwmon, channel, &energy);
> +
> +	/* Initialize 'struct xe_hwmon_fan_info' with initial fan register reading. */
> +	for (channel = 0; channel < FAN_MAX; channel++)
> +		if (xe_hwmon_is_visible(hwmon, hwmon_fan, hwmon_fan_input, channel))
> +			xe_hwmon_fan_input_read(hwmon, channel, &fan_speed);
>  }
>  
>  static void xe_hwmon_mutex_destroy(void *arg)
> diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
> index 2bae9afdbd35..e622ae17f08d 100644
> --- a/drivers/gpu/drm/xe/xe_pcode_api.h
> +++ b/drivers/gpu/drm/xe/xe_pcode_api.h
> @@ -49,6 +49,9 @@
>  /* Domain IDs (param2) */
>  #define     PCODE_MBOX_DOMAIN_HBM		0x2
>  
> +#define   FAN_SPEED_CONTROL			0x7D
> +#define     FSC_READ_NUM_FANS			0x4
> +
>  #define PCODE_SCRATCH(x)		XE_REG(0x138320 + ((x) * 4))
>  /* PCODE_SCRATCH0 */
>  #define   AUXINFO_REG_OFFSET		REG_GENMASK(17, 15)
> -- 
> 2.34.1
> 
