Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A424C3ABB2
	for <intel-xe@archiver.kernel.org>; Wed, 28 May 2025 16:26:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 082BB10E65C;
	Wed, 28 May 2025 16:26:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ob/R4llH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7372F10E5F7
 for <intel-xe@lists.freedesktop.org>; Wed, 28 May 2025 16:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748449563; x=1779985563;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=YuiCtPY733KJmW3+g+uDMrJ+efLPnTtABZ3D7rCGehY=;
 b=Ob/R4llHTJwXIHEgh32HSCkH5Wzf5iPoqD3r4k0WkJLnXWoHbe1EQn0w
 X8NSmHimqg23nmAi3LipovuvkhLvIiZvPzGPUuXTaTzv2moYPJc+LOgnJ
 h4bAvk1CTmChzry+p1DLduLBkryekX3PZlkb+9aNHey7qNQdm6uVzSmrt
 IwkKvoRnUkWXHQkgF9Q3gmyLbM5moLQYqVAa2lJ8QlG378EWXkhLwQHA1
 cRT6l2i+9UImN3mklruiES9b153RddeAjs6ZRh4k4hDjF1hi1tVEStR0x
 MU30p96nHffn1JyYaw2aryeTKpcyY0HcAZRdsBk4+75u9rgkGt+6wXEEI w==;
X-CSE-ConnectionGUID: hG6wMtzySoGJ8L7gyW6iUw==
X-CSE-MsgGUID: i3jedlQCQHaMk3nSlVhnpg==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="61117171"
X-IronPort-AV: E=Sophos;i="6.15,321,1739865600"; d="scan'208";a="61117171"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 09:26:03 -0700
X-CSE-ConnectionGUID: Etj23YoyQh6J0QammK4geA==
X-CSE-MsgGUID: uPhLux2LR7KeHLabqV3DMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,321,1739865600"; d="scan'208";a="147170522"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 09:26:03 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 28 May 2025 09:26:02 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 28 May 2025 09:26:02 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.68) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Wed, 28 May 2025 09:26:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PpsquHs6JRGmGxNEE/AO7CB/gkmDa32XinN+BNNUplJL8y0FM0FxOejLuxoDYyspoov5+NmD1usN4EWzeZ29j2IsnepxrnqS9/3vKligC1xMizqCBFnYTMvuWkDzSHpEh4QZFCbg0o0uDliqLXIAMIkwhGgi5sNJw/Prq6UL2YirsZnC+jzbaig/Rk5JpS73Rw1RDnAZcpMWQmP7DOVpqU1BXAuzSWX4KBcN1h2tjfwp+kixDvkkAjVZQe4v5h+bwI7t1oWORKOfyLM8bJn4DUG4DE2Cv1XgKWB8ciHKfogd2BMPo4Ry5drjL4fk0kS1mEZjqheQ7r5C9Zl9s9NLag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=arTnlY6VhprVLuc6JonYjIW1zEGN0ssVh8qGwD/RnUI=;
 b=jbMmSiQC2NUb1qmeNGTdjxLA1HEt08tXrPwYQl4EZGsYiwMCSyzyxFDV3eKc3iKPSy0HgwJx97p6LIBunUxzw4BK8Uw++9AWlF9emb8NBqq2IQLoXa7k/prGVND3K0udL/gtAcB+MhWkkWbxKeBXg6Jb0ImgkDIM8B9OxaRwG2ICAfDnJpQVB18l3SftDeHLHHjuJNBmcOFh8OVJL5wx0P+tczoeLIts/VGwM+Hn6AY6OxZTEYMnRkPLyrQN4rCkOiC/cdpE3kg4kLwox8/h3ex3yZgpkvkWBbMHA0zJ/CL1xviWmu0lW+WQCv54WX0sNnIw7UK0ePYKDVZdbctnmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA3PR11MB7583.namprd11.prod.outlook.com (2603:10b6:806:306::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.26; Wed, 28 May
 2025 16:25:32 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8769.021; Wed, 28 May 2025
 16:25:32 +0000
Date: Wed, 28 May 2025 09:27:03 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v3 02/19] drm/xe/uapi: Add madvise interface
Message-ID: <aDc5V0GqhhIzD2Gh@lstrano-desk.jf.intel.com>
References: <20250527164003.1068118-1-himal.prasad.ghimiray@intel.com>
 <20250527164003.1068118-3-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250527164003.1068118-3-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: MW4P223CA0023.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::28) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA3PR11MB7583:EE_
X-MS-Office365-Filtering-Correlation-Id: 25047fb0-553d-474c-dab6-08dd9e0444b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3QW5aqaCfsUzdTZal2HK5SBOkbIjnnyyicRIxUt2NxUw/yUpOQotzM27yiEi?=
 =?us-ascii?Q?saUpCjJlicM73OtfdQkskjvJVGaKAI3N0JeIR1YAvLa6dBLSuQgjnKa/ATB/?=
 =?us-ascii?Q?MDWEcS3+QayV33Wj8MOPb6tkK6xgAIToI3/WtZ2hpTLB5tQcz0GYpTVwChsW?=
 =?us-ascii?Q?pfAMandW4mo+UdJk5Q1H1k9FB8/ndTDPFuLxuli3JIWvbeUn5Q8xT+yxCcEj?=
 =?us-ascii?Q?djMdOPQaQB+Dg+d0my31uPuZCUMQpq9iCE2wif8UcpeIpXusHeTtxGe2dMi0?=
 =?us-ascii?Q?TgQs1HwvVtQdYwpUGCGpGQd4wbcBYFuIUb/s+vVHoqqKnVV6woS3C9XF4+DN?=
 =?us-ascii?Q?HJV3y62QZBZbvKXRUCfSsHcHQWrBhZvn3FakzFTGos+lAL+dFT8r3SEzZcZU?=
 =?us-ascii?Q?G7vDdPTvbN4Iwv6AmAC46axjfuAhsqIf+YisU3zwtS1souuZyqMBC7qcmYVd?=
 =?us-ascii?Q?PJpi1Dlgi9ONsaAoNQpZRgoTjtZqdzsQv3Os5GMWDwYFH/m8IjKfBSrlw7ly?=
 =?us-ascii?Q?iHhYvd3UEjfwejn+EfKint8kUJmkt2UjKR9WKTfLfd0nxtiGtYSj/6RZVqWS?=
 =?us-ascii?Q?eULTpRaCSxoEGbtjwPjgTqYVbiP8YChw6tD3S/PdPsRmL4WGu0EvnPhrSjKT?=
 =?us-ascii?Q?4D8uypw4NUclwOl0LikSujkMw+LezPXt419n1gm+0vKy1XD7Ja3boqyJB6rO?=
 =?us-ascii?Q?aYWT9M45BCmujaJY4aN2yG6CmlwRcrOYQcZ46RnUmmAgsn07XUNIy2mYkZ41?=
 =?us-ascii?Q?5m+kD3CDswRKPh1XKncg1dD9GjaqB0HbobwedDhnqOZSS7q/OLRMFZIE9JSV?=
 =?us-ascii?Q?kZ87G1kvT6THnJmraoI+PyqaDcCP3HjjokYpcTMjU/rH+YgMxzlTLePGmymT?=
 =?us-ascii?Q?WuSHs3i6BJHCevsaI3cpom3AH/I66y0R01oiudU8NWQ9bx4+AO9mP+FfmUNj?=
 =?us-ascii?Q?Po5XXWsIhdvLVImUBpO0QI7bzF2dE8W5JAX14RMgyoQcMCc6X9zX5ADblMC7?=
 =?us-ascii?Q?mbYmt49/+QwXa2Emg9hf+KXlg2iRa32GF1hhD1RcicvxhRvbPPsjMxTiR/gB?=
 =?us-ascii?Q?28+Yla3dO9l/nAha1csHyV5N6mmXRjWd7dn+9xmYYkfPWkyZ0tw43/SxmhTp?=
 =?us-ascii?Q?NktkeI21yoDx+IvOKGNONonx6coQ/XTH9c7CohuKMaYlE7aOSXLw9uvFLMnW?=
 =?us-ascii?Q?psEv6W7E3GfF7TqQHHQVt8BA3dl2D6r+xhWw2quxMv13hFtdVUvteR2bj1dJ?=
 =?us-ascii?Q?/rh5omBWVrY5/Dhl65B19CG+dJo/cQysyBqKtSF9wU2FkgsgW4q6K0CsJ8Kx?=
 =?us-ascii?Q?IqH7HmVel2+j4qGn/azhYTjxLocIl7hsZCKnmmIx7Ou20piPszmctSoPJIVa?=
 =?us-ascii?Q?gT562ClJ9BdwRAV+9HeWmZOOSRPuVpUNdAXRbA3HrFIeTe8JtToy0Zwv/KID?=
 =?us-ascii?Q?fsjaTwhSh+s=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QKyIz2JG0hOuM8LXzgWBERp0scxE+s0oqQFY9++z2ZojLifutguUqLXgdIVD?=
 =?us-ascii?Q?qOCWdDDkMualnt2l5MgHhv5+r3IJjsS0JAewThjbr5KIjj6ZBPNkc82cPaop?=
 =?us-ascii?Q?qe2o2FZQTr25ovceO8OO6wDRxCMhJ02mQLB9Z7xHYBaMiU9t1jodIGK0x7Ej?=
 =?us-ascii?Q?uXIE6jLPqPToWp14wiRrm5DQg89lVmzJafmO6LWbfjvGoUSfNtTt4TquEIMt?=
 =?us-ascii?Q?dNsD1ZOpDdjninTLEUS0nt8+jGS5XbYVxL9fYbjq+e+UZstmvJRXO/SWicJ6?=
 =?us-ascii?Q?k1lQimo7rgTwnsZEchjcemw2f/B+YhUdEAJHJu+q0EXcZ3hQDmw2VBKMjK1n?=
 =?us-ascii?Q?rQpcwG0046lKn/snnwYOueSAiPTK/RIyfL9o1BSvzu8frZ4OBqx5uHOSVtfx?=
 =?us-ascii?Q?V+6aA014tMSZgAc0sjiJTM7NKYFRaFFC2CkxZb9oC2ysQBuT+xumjuEMjOEG?=
 =?us-ascii?Q?C1JSlFvzYGSF96XNvmgMCUQMCompXlvGw1ZsYC0wXaajBvaaDONTYFhUxRci?=
 =?us-ascii?Q?lNxHOq7DLFE8AikOABWH4SrdQRpGEbNMWYluwRCA0Cmd8H2UON9slFFmw+/Y?=
 =?us-ascii?Q?IxlS0o61EaBpaj0cK0woqCpemvPvYVyBRUcFDWIQ+du0XinNQ29ctfBv+ptn?=
 =?us-ascii?Q?9dqqC7Fer00NhCCSza2ARYy6k+rOf0YeYjy0GYaLekBI/Iygq7sLVjcMpIiG?=
 =?us-ascii?Q?md+JucsC5Z7F7bBJl2zMxN+qRWrsTp1VXizRgkWZXvA3RYn/K+xH/8LKYa9c?=
 =?us-ascii?Q?ULIT7P8CBuEEDbTLY6RkFu8an/CK6n/damgNMZvHkSnxeKohKZdodnEtBYP8?=
 =?us-ascii?Q?e2a2owLmAiNrxvYtNvZ+e4DPxYdsCP3j8SnKe+zDexQYE0jtRhYNmW5MtEB8?=
 =?us-ascii?Q?8V1gyEzMzL3ZLDyAWk3XWS7oCXX6zEE44Du5tAs6zgQznddJbY8KEFogZYEc?=
 =?us-ascii?Q?l2vXxYIoBrPBuSELpVQlKq5RBAvmz6yE2EiydMaG679DmVOv/VJutQqt82hN?=
 =?us-ascii?Q?TaWCm/R6rAdPb05N5E8f8oPKkZeKq1U1ndFLD3yRrACSsayO3seGTfNdWrOv?=
 =?us-ascii?Q?WfvHrlZ5wdyv7KI4E+HGLIlMLb8SWrVbBQUkCsad0iIFjwBGLbljotPZHxvr?=
 =?us-ascii?Q?4K5GVB8reDz8QKdNPHjNoNMBf2ukloUZ3UpHE1ibMqp1uFBhKiUdtkxSbN92?=
 =?us-ascii?Q?GPKTUIR073UU2/IlCCkp5XwEggSnCiLv8+n0aAxUO7QE48LhPBL2KDob6b4c?=
 =?us-ascii?Q?OL9pgHLRcAuXBV2rrztZDKx4J9yboOL7yaYjFoeBRQrbSBK8HG+I1s18PumG?=
 =?us-ascii?Q?pIK1sHo1Z6u+Ll5Tkbn40wTNO5o3+2Ph+djBels8rcX6a+mO0810TYSR1Bbj?=
 =?us-ascii?Q?qtQK3+O9pNK+5xQti8sAcVnEHKucBqYSVaSMXldmjv5RjXnPqCXo5qr/mnNm?=
 =?us-ascii?Q?l9syk7Cza+z/bgxbibgEN0pMST0hMwAlTRbzan57rkn2c6pLBhrvmH/U+fEj?=
 =?us-ascii?Q?R9c/fjAao6TKc22FasrGZenQeO1cm8/wKlNuYbujyQlQpuUYrU47B7psRrQc?=
 =?us-ascii?Q?PZ5jaWkyZjILrEMcooRNzn4fJ/cwGThBp/2qazJgGx+wJpW/WV0fohlXgVup?=
 =?us-ascii?Q?fA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 25047fb0-553d-474c-dab6-08dd9e0444b3
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2025 16:25:32.7567 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g4KVKKyoX6fWpSz7HbU8AP1wqYtKsB9Y1xRNJwLiX8oDBXIIOFQI3sIvTpmfQp7PbpSvoyt7VIhvChYWxz6aPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7583
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

On Tue, May 27, 2025 at 10:09:46PM +0530, Himal Prasad Ghimiray wrote:
> This commit introduces a new madvise interface to support
> driver-specific ioctl operations. The madvise interface allows for more
> efficient memory management by providing hints to the driver about the
> expected memory usage and pte update policy for gpuvma.
> 

A bunch of nits, but uAPI itself LGTM. Let's see if we can get an ack
from Thomas on this too. 

> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  include/uapi/drm/xe_drm.h | 97 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 97 insertions(+)
> 
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 9c08738c3b91..e0d75226a724 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -81,6 +81,7 @@ extern "C" {
>   *  - &DRM_IOCTL_XE_EXEC
>   *  - &DRM_IOCTL_XE_WAIT_USER_FENCE
>   *  - &DRM_IOCTL_XE_OBSERVATION
> + *  - &DRM_IOCTL_XE_MADVISE
>   */
>  
>  /*
> @@ -102,6 +103,7 @@ extern "C" {
>  #define DRM_XE_EXEC			0x09
>  #define DRM_XE_WAIT_USER_FENCE		0x0a
>  #define DRM_XE_OBSERVATION		0x0b
> +#define DRM_XE_MADVISE			0x0c
>  
>  /* Must be kept compact -- no holes */
>  
> @@ -117,6 +119,7 @@ extern "C" {
>  #define DRM_IOCTL_XE_EXEC			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC, struct drm_xe_exec)
>  #define DRM_IOCTL_XE_WAIT_USER_FENCE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT_USER_FENCE, struct drm_xe_wait_user_fence)
>  #define DRM_IOCTL_XE_OBSERVATION		DRM_IOW(DRM_COMMAND_BASE + DRM_XE_OBSERVATION, struct drm_xe_observation_param)
> +#define DRM_IOCTL_XE_MADVISE			DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_MADVISE, struct drm_xe_madvise)
>  
>  /**
>   * DOC: Xe IOCTL Extensions
> @@ -1965,6 +1968,100 @@ struct drm_xe_query_eu_stall {
>  	__u64 sampling_rates[];
>  };
>  

Structure kernel doc. I think here is where tou describe the defines too.

> +struct drm_xe_madvise_ops {
> +	/** @start: start of the virtual address range */
> +	__u64 start;
> +
> +	/** @size: size of the virtual address range */
> +	__u64 range;
> +
> +#define DRM_XE_VMA_ATTR_PREFERRED_LOC	0
> +#define DRM_XE_VMA_ATTR_ATOMIC		1
> +#define DRM_XE_VMA_ATTR_PAT		2
> +#define DRM_XE_VMA_ATTR_PURGEABLE_STATE	3
> +	/** @type: type of attribute */
> +	__u32 type;
> +
> +	/** @pad: MBZ */
> +	__u32 pad;
> +
> +	union {

Structure kernel doc. Maybe the DRM_XE_VMA_ATOMIC_* are documented here.

> +		struct {
> +#define DRM_XE_VMA_ATOMIC_UNDEFINED	0
> +#define DRM_XE_VMA_ATOMIC_DEVICE	1
> +#define DRM_XE_VMA_ATOMIC_GLOBAL	2
> +#define DRM_XE_VMA_ATOMIC_CPU		3
> +		/** @val: value of atomic operation*/

Weird alignment.

s/val/atomic.val/

> +			__u32 val;
> +
> +		/** @reserved: Reserved */

Weird alignment.

s/reserved/atomic.reserved/

> +			__u32 reserved;
> +		} atomic;
> +

Structure kernel doc. Maybe DRM_XE_VMA_PURGEABLE_STATE_* are documented
here.

Basically same comments as above on the below structures too, not going
to type out.

> +		struct {
> +#define DRM_XE_VMA_PURGEABLE_STATE_WILLNEED	0
> +#define DRM_XE_VMA_PURGEABLE_STATE_DONTNEED	1
> +#define DRM_XE_VMA_PURGEABLE_STATE_PURGED	2
> +		/** @val: value for DRM_XE_VMA_ATTR_PURGEABLE_STATE */
> +			__u32 val;
> +
> +		/** @reserved: Reserved */
> +			__u32 reserved;
> +		} purge_state_val;
> +
> +		struct {
> +			/** @pat_index */
> +			__u32 val;
> +
> +			/** @reserved: Reserved */
> +			__u32 reserved;
> +		} pat_index;

#define DRM_XE_PREFERRED_LOC_DEFAULT_SYSTEM	-1

> +#define DRM_XE_PREFERRED_LOC_DEFAULT_DEVMEM_FD 0

s/DRM_XE_PREFERRED_LOC_DEFAULT_DEVMEM_FD/DRM_XE_PREFERRED_LOC_DEFAULT_DEVICE ?

> +		/** @preferred_mem_loc: preferred memory location */
> +		struct {
> +			__u32 devmem_fd;
> +
> +#define MIGRATE_ALL_PAGES 0
> +#define MIGRATE_ONLY_SYSTEM_PAGES 1

s/MIGRATE_/DRM_XE_MIGRATE_/

> +			__u32 migration_policy;
> +		} preferred_mem_loc;
> +	};
> +
> +	/** @reserved: Reserved */
> +	__u64 reserved[2];
> +};
> +
> +/**
> + * struct drm_xe_madvise - Input of &DRM_IOCTL_XE_MADVISE
> + *
> + * Set memory attributes to a virtual address range

Maybe include a code example?

Matt

> + */
> +struct drm_xe_madvise {
> +	/** @extensions: Pointer to the first extension struct, if any */
> +	__u64 extensions;
> +
> +	/** @vm_id: vm_id of the virtual range */
> +	__u32 vm_id;
> +
> +	/** @num_ops: number of madvises in ioctl */
> +	__u32 num_ops;
> +
> +	union {
> +		/** @ops: used if num_ops == 1 */
> +		struct drm_xe_madvise_ops ops;
> +
> +		/**
> +		 * @vector_of_ops: userptr to array of struct
> +		 * drm_xe_vm_madvise_op if num_ops > 1
> +		 */
> +		__u64 vector_of_ops;
> +	};
> +
> +	/** @reserved: Reserved */
> +	__u64 reserved[2];
> +
> +};
> +
>  #if defined(__cplusplus)
>  }
>  #endif
> -- 
> 2.34.1
> 
