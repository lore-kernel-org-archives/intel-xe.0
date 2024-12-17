Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B496E77184
	for <intel-xe@archiver.kernel.org>; Tue, 17 Dec 2024 23:39:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBF7F10E0E2;
	Tue, 17 Dec 2024 23:39:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EaIvwaJh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F72810E0E2
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Dec 2024 23:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734478755; x=1766014755;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Eq2n4NQMZJ23uAiDs7K+oJxBhHk3fVOSfwl3l671D6c=;
 b=EaIvwaJhMPKAYf1SEo2k/p5KAHy30eZ/txtXzKlml//17rsT1AeOMP5v
 VUZXKwb9X7jmSqh8s39DKMDs5X/PpRKZXdNSP5aIVwFu8ba/AOPeQ9ik0
 eXp9CPJ2ZpiZUsmKCpD5NETfA5u+7d2m2+SqJLM2TeYWNR7gqeJZK0anS
 R6MPbdLwuBEDon0+S2AEPAckg+Jt+PSJ8wFTNz6jpKqH5/JXo6+v4goQu
 c4hrdQuNv6jbtSEP/npWz/+4U7k1urbx6v7geWZhrTmsvSUztmir+TbEG
 y7adwG0mpEHIW9v2ddHZNYOmZ6oX5Gsvnr753poFdEqzzYSmJynlhWcsJ g==;
X-CSE-ConnectionGUID: rdcgk42IRK2OVv1dw7ezpA==
X-CSE-MsgGUID: 21yZKhxwSIqWqppLnEtGIw==
X-IronPort-AV: E=McAfee;i="6700,10204,11289"; a="35080156"
X-IronPort-AV: E=Sophos;i="6.12,243,1728975600"; d="scan'208";a="35080156"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 15:39:15 -0800
X-CSE-ConnectionGUID: ZpjsAbjYS9uwfDDeDZtYAA==
X-CSE-MsgGUID: dccI1ojTQHmf0/nYf7Eo1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="102759972"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Dec 2024 15:39:14 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 17 Dec 2024 15:39:14 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 17 Dec 2024 15:39:14 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 17 Dec 2024 15:39:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YZWsvIscnLbQgrgGw8olIWnWZQc4W9Dvk8uMmtmJGAXGuq2GYJ216jcFjZYQ42evb8oLtAnDzTJHz+VSS4mNxp3aHp4ARau6AGmm2ZzsfsSSkuiZghd8LUeu/uPW7cx1ZN/addkoRztWa56lX1C1xZ/WrPdgDPAAQzvsRVZnmsEt2PYm4F74y+YtA9k4xQdhHEe1W7kKhSgCK5LT+jIA0DEUf+VG7tINBWbizR1cLvrFhokp6E7bPzYmY7fNiw9kz8Z/EVOrZDRz8huVBZTkafSSzmduyXYTt7MS3K5+1Ny7lB8NtGhTuEQ/rZ9mqKVfZGaJemOIOjkK/X7uIH0GaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PZqvxvk9ai60TN+cyXTc4Apf6mhucJOqEwwHJEz2yN0=;
 b=kZHul2AzukzCCIMT9aDHMImfvxPp3lkRxL/nRh5m/bZTa3fQEb2mpSJGI+uT3ggvr3A1u9kI/TfPglXGQDwUl+g9LmGJdZo7XHnbAV8JeXh5jUMaSRRe4MADw0KA9T+QxlF0TudfEXjZSm9YszAAs4HzawdL90W6B5ckcwUVEn0EBmmSTmrEgqv1vokOFMImX1P9aiyY2GCh2ERJ9IYHviVIQLppQ/zr8RIfF1tzjCiWdLeJz1YTJPAL6E+Mzki2EnlkzeNlYY2DXhASmRiixu9NoOM60zwiO36aLFN/AK4vZiilaw3RBaJ1B7tKtkoS3+bZiF1IJ7PLvA7Uc61ZyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY8PR11MB7170.namprd11.prod.outlook.com (2603:10b6:930:91::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.22; Tue, 17 Dec
 2024 23:38:58 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8251.015; Tue, 17 Dec 2024
 23:38:58 +0000
Date: Tue, 17 Dec 2024 15:39:42 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: =?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Force write completion of MI_STORE_DATA_IMM
Message-ID: <Z2ILvmX9y87iFvZP@lstrano-desk.jf.intel.com>
References: <20241217160732.46280-1-jose.souza@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241217160732.46280-1-jose.souza@intel.com>
X-ClientProxiedBy: MW2PR16CA0013.namprd16.prod.outlook.com (2603:10b6:907::26)
 To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY8PR11MB7170:EE_
X-MS-Office365-Filtering-Correlation-Id: 353ba33a-24ea-4ee2-911e-08dd1ef3fa95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?cbrM3HhHeT5qkpYC7X2ZYzn9JfKiTilq6jk5XzMtZ0iZO2X9cl9sl+UrfH?=
 =?iso-8859-1?Q?ft8lYNv8oE2kctc0uoQQFVGsKO3NzpAJuJLr4cuuo+wJiOD+u0rOWmmyTF?=
 =?iso-8859-1?Q?78mrL1hX1ky79UvA4lncMaR461gB97Sq94AoebPO+mmEdnpcrOe5Uyf+tw?=
 =?iso-8859-1?Q?mSpHYMU0kFPfEPRNVMRT+yzDKBHp5vuCdR/xNC/ugAdDrgfSdmv108MNZY?=
 =?iso-8859-1?Q?ZR8Eb7MM0L+bPOmo1oTQUmD3SxGLksA+SMiU4bzAW06WfHpVKS3ETBS0De?=
 =?iso-8859-1?Q?NMlH2WY60L6KjAe8d7V3F5Z61c0YT5WHGDjnHqklDihONF3hwol84Vnk0R?=
 =?iso-8859-1?Q?sIKSKSyEAY3hSfkeKhuuVpL61CuZAE/U+kEBZx/Gg6jtR/pU4ShZCeI9/X?=
 =?iso-8859-1?Q?QptIpwCAa0LRUsdr+fJQFk+Pg4IFcm5cvom1hG+blR62Bw86zRZKWfGWZU?=
 =?iso-8859-1?Q?HdD9bXwZ9QiE2jFNenM7HPmYUDZ14h968twxYt+bTDdY/j1BZXjfNGrNjs?=
 =?iso-8859-1?Q?EhDtmhvUD4NUmhn3ZrhZFgfLkW75I2FEMk7Cu/b59RW6yKjlGwcUkvyOhx?=
 =?iso-8859-1?Q?9QZxX4JaU5idvhEOlQk7beFHwTZaviouti6mEcZn1Q4JgCth8kSm6XzMIg?=
 =?iso-8859-1?Q?3EKlh8ysAOhe25cH+5OGJG6j51FpL9VwFoMOWUAyo5o4kUd8oUzqLIxMyV?=
 =?iso-8859-1?Q?pr04PKoh7OOy42Hl9jSBFvG3z3PTwbMBHUG9v/ZNuOkRckP0PC/a98EhFI?=
 =?iso-8859-1?Q?B7icQYTy6ye3o3yCZ3p0uLeZ5HsY90RDTjQ1dUg12sMH29LE/iYpbPy/5w?=
 =?iso-8859-1?Q?ghosEvX09wTp7yN4U3Z72f3KvM3sUE0rwcwVKoPahtapsFd+5CZ4MqI0id?=
 =?iso-8859-1?Q?2FNh+LHk8SDBsJt+L14yNxwwUmdUg2wPL8I2rJ8iCJY8ggjnHeip9uBi4E?=
 =?iso-8859-1?Q?ROFx1W0gD/iD1LS1yTqJ/TpkRjx8sEYxkM3FOUVJniwsEaudWk9XqB5vt9?=
 =?iso-8859-1?Q?ujBu/tADKCF0yguY1fINne/l0ESmqyvnDgXB3Tzt2AMz5UeRh+b3Fp37Gx?=
 =?iso-8859-1?Q?pOcUl1HTQg2BLBa3hGF5DuKSQUkPE17HuXf5Q1PctYo/5NKnGoTUdwHcWo?=
 =?iso-8859-1?Q?Bkniov14L1xFuuXWB938J9aQK44A2uj/q/rLAIOiHJx5Yfmd0HhVJTkxDr?=
 =?iso-8859-1?Q?NBwE8mERAyOAzbbONVd+RjEXvQbFW1oYgzHjuHJZ5LscBIbWbeVQhbcZ2G?=
 =?iso-8859-1?Q?/rRy56+cGkL7pnm+0ZUAUEIuwViXsb7RSdgXKycrr1xdUtWNdnzcnw4mT0?=
 =?iso-8859-1?Q?bD/VWVTyGFM9IVFT1Rib/DusEvGO0jQmCDXM+nly4buSGnLpqQ8I0SFmph?=
 =?iso-8859-1?Q?URV6tNnvNMd8pniJ534l50vYQd3Ia3gEsndF4gu33IFd7LKB8GHdKaujyq?=
 =?iso-8859-1?Q?nkc4DCtMcBLEav6f?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?DWo7mhBmY4VhSloaxbkB2CA8ivCa9PWqBXAHxFtkBKHqLQMdSmF+cPth53?=
 =?iso-8859-1?Q?U5DeA8IX97yOxuYp+hm6iWESyfM+WvjOpgUb/9Ds4SJH589kJBrVl1xAxE?=
 =?iso-8859-1?Q?eJA84LB4XrsmP+aI/6XHYGYvU1YIl68cM7PVzzcrdcqjQSR3dd2F23l/Iu?=
 =?iso-8859-1?Q?WDio1ZWqrXHMXVGBU4Vyh9H8ndXC3hP41wTNcVW9hLJ5noW5N8wtZmGsra?=
 =?iso-8859-1?Q?luqxvVOgTNFaXPKN1eZag3mmT/KnfirgK+lchXgEV9o5s5sGijz2tPRJSH?=
 =?iso-8859-1?Q?c/ldVcT2/DXuocEFJ7wBlf4YLEss5HtzLpRYD0iyVlSS9gpmqiN52EN85r?=
 =?iso-8859-1?Q?UDr5m9QYNiIyyprD94BHpoZ8Lxh4K5ZDpB2iT9B6GAfJp5oqR38pqea/u6?=
 =?iso-8859-1?Q?xjYC29r0akni8H8SaNgmHvukjuzql6tWd1AblBrQqpnD0FjRmZH5/h0TDD?=
 =?iso-8859-1?Q?usFNboe1OIwwsST/g0iTjmY0LpWsA0D5no3yhkGzrlDnLFi1DfFPX4odAC?=
 =?iso-8859-1?Q?RbWz6fOsbB1AM2kCNbDY1xZevpv+Q5GH830yikrhMRIMYmrXm8aHVw5FWc?=
 =?iso-8859-1?Q?Xswbnc03xpsU/qTPlfn1nV7zr3m+cNMmq0C6F6IsC6h/OSxVEiEIGJxWYx?=
 =?iso-8859-1?Q?QARk/LYn8r7hcer1klBpEqhfl8moQ9UFuGYV2apj30VN3/xTGzJ8uREuRN?=
 =?iso-8859-1?Q?6y4XWLI7Z59+hhF/rigARcpXY9q2cqlAWw7s7rwGtnPtOBx/T395/NS58t?=
 =?iso-8859-1?Q?OUfdpuxcJNa72hQDKkKoWEpRCIBz/jjN0F81Kr6fzZVbESk/DAZpZmCQ5Z?=
 =?iso-8859-1?Q?OYuIJ41T9SFQejkT7lFGArZDIy8Mok/LJdgGjJh2/y725SZBh9CiX3e5m8?=
 =?iso-8859-1?Q?0PymBPWTPMnPtRjIxovU6ss73vSovWQJo7AGBpkSuSiAKnxvuOS4MX1oAn?=
 =?iso-8859-1?Q?gNlry/aD2k1ulqt3ekHYcSQei2vZbdXFC1i7IBhMAGh73mpXVoqVngXB9P?=
 =?iso-8859-1?Q?67ENj9f2eQ8Kp77iGcgjCItOOm0IGTcYHXH3+/MrBAZHFU7zR3d3aA4MiA?=
 =?iso-8859-1?Q?JG4jYNc4qLWvr1Z99VrVxBSYMWkKGkEiHjBj4go5d/fIdUsymAun1Dc79c?=
 =?iso-8859-1?Q?uNT7WlE9Qarlfs63ZR3TO/pjbfqyzRzuN6VXtzbZuXyyaYuZRUCHV2bNDT?=
 =?iso-8859-1?Q?HsmWlaNR9yk0oUeVbcI4qXiTWKKe/wTGoUvqUi8Z3y1rkTeT6AlHCcIS53?=
 =?iso-8859-1?Q?diT575mceB5f2ha8RrQNLM1JnXmTktZPsHro5a9HnOHnWZ7atBmMj+MSiM?=
 =?iso-8859-1?Q?ET5Y0p5nJNd94PQ0+J1Jx97n6qIqtjTyRV+YS87C7NorxYd8YwGPCmkXPo?=
 =?iso-8859-1?Q?CvdNHNDkQklEkAtld0z3z954IMYQ+YRwKjO0cA/RC+2eu3HqtxT3Yo7L6S?=
 =?iso-8859-1?Q?oKh/2jwSr1wNNR1x+kg2s3RsTcPdF7rmOOcxl3R4Be4zxKIWS+DzwpmCMm?=
 =?iso-8859-1?Q?2MV3bhxoHrK7hOV1bBvkyPwEMTXzAoTlZckcgL/1JyHb0rZhr3iJauadoV?=
 =?iso-8859-1?Q?OkPKWfsjXgKGoY0tMP9GGhBS9r0RcbtS4ykmQ/iY0GJRvOBxCes+xYvg24?=
 =?iso-8859-1?Q?htF1c6Lyj7Q/hVDgTTQZhZnj9b+p4S7zITyb7SeJM01Vq0hPawCksU9g?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 353ba33a-24ea-4ee2-911e-08dd1ef3fa95
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2024 23:38:58.7981 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7DfF8K6nLLFxx0/zW3L8Nno+IIVslJu3vX1z5fkaTxRgF8zRjH1l2DykbWtH/k+x9nN1Arlo8+UrqvXLYm4W3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7170
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

On Tue, Dec 17, 2024 at 08:07:32AM -0800, José Roberto de Souza wrote:
> With Force write completion unset there is no guarantees of when the
> write will be globally visible what is not the behavior wanted.
> 

Do we want this backported? If so, maybe add a fixes?

Matt

> Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
> ---
>  drivers/gpu/drm/xe/instructions/xe_mi_commands.h | 13 +++++++------
>  drivers/gpu/drm/xe/xe_migrate.c                  | 11 ++++++++---
>  drivers/gpu/drm/xe/xe_oa.c                       |  4 +++-
>  drivers/gpu/drm/xe/xe_ring_ops.c                 |  6 ++++--
>  4 files changed, 22 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
> index 10ec2920d31b3..f4ee910f09432 100644
> --- a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
> +++ b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
> @@ -33,12 +33,13 @@
>  #define MI_TOPOLOGY_FILTER		__MI_INSTR(0xD)
>  #define MI_FORCE_WAKEUP			__MI_INSTR(0x1D)
>  
> -#define MI_STORE_DATA_IMM		__MI_INSTR(0x20)
> -#define   MI_SDI_GGTT			REG_BIT(22)
> -#define   MI_SDI_LEN_DW			GENMASK(9, 0)
> -#define   MI_SDI_NUM_DW(x)		REG_FIELD_PREP(MI_SDI_LEN_DW, (x) + 3 - 2)
> -#define   MI_SDI_NUM_QW(x)		(REG_FIELD_PREP(MI_SDI_LEN_DW, 2 * (x) + 3 - 2) | \
> -					 REG_BIT(21))
> +#define MI_STORE_DATA_IMM			__MI_INSTR(0x20)
> +#define   MI_SDI_GGTT				REG_BIT(22)
> +#define   MI_FORCE_WRITE_COMPLETION_CHECK	REG_BIT(10)
> +#define   MI_SDI_LEN_DW				GENMASK(9, 0)
> +#define   MI_SDI_NUM_DW(x)			REG_FIELD_PREP(MI_SDI_LEN_DW, (x) + 3 - 2)
> +#define   MI_SDI_NUM_QW(x)			(REG_FIELD_PREP(MI_SDI_LEN_DW, 2 * (x) + 3 - 2) | \
> +						 REG_BIT(21))
>  
>  #define MI_LOAD_REGISTER_IMM		__MI_INSTR(0x22)
>  #define   MI_LRI_LRM_CS_MMIO		REG_BIT(19)
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index 1b97d90aaddaf..8b32fad678782 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -581,7 +581,9 @@ static void emit_pte(struct xe_migrate *m,
>  	while (ptes) {
>  		u32 chunk = min(MAX_PTE_PER_SDI, ptes);
>  
> -		bb->cs[bb->len++] = MI_STORE_DATA_IMM | MI_SDI_NUM_QW(chunk);
> +		bb->cs[bb->len++] = MI_STORE_DATA_IMM |
> +				    MI_FORCE_WRITE_COMPLETION_CHECK |
> +				    MI_SDI_NUM_QW(chunk);
>  		bb->cs[bb->len++] = ofs;
>  		bb->cs[bb->len++] = 0;
>  
> @@ -1223,7 +1225,9 @@ static void write_pgtable(struct xe_tile *tile, struct xe_bb *bb, u64 ppgtt_ofs,
>  		if (!(bb->len & 1))
>  			bb->cs[bb->len++] = MI_NOOP;
>  
> -		bb->cs[bb->len++] = MI_STORE_DATA_IMM | MI_SDI_NUM_QW(chunk);
> +		bb->cs[bb->len++] = MI_STORE_DATA_IMM |
> +				    MI_FORCE_WRITE_COMPLETION_CHECK |
> +				    MI_SDI_NUM_QW(chunk);
>  		bb->cs[bb->len++] = lower_32_bits(addr);
>  		bb->cs[bb->len++] = upper_32_bits(addr);
>  		if (pt_op->bind)
> @@ -1388,7 +1392,8 @@ __xe_migrate_update_pgtables(struct xe_migrate *m,
>  			u32 idx = 0;
>  
>  			bb->cs[bb->len++] = MI_STORE_DATA_IMM |
> -				MI_SDI_NUM_QW(chunk);
> +					    MI_FORCE_WRITE_COMPLETION_CHECK |
> +					    MI_SDI_NUM_QW(chunk);
>  			bb->cs[bb->len++] = ofs;
>  			bb->cs[bb->len++] = 0; /* upper_32_bits */
>  
> diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
> index 56bf375a9d4bc..ae94490b0eac8 100644
> --- a/drivers/gpu/drm/xe/xe_oa.c
> +++ b/drivers/gpu/drm/xe/xe_oa.c
> @@ -690,7 +690,9 @@ static void xe_oa_store_flex(struct xe_oa_stream *stream, struct xe_lrc *lrc,
>  	u32 offset = xe_bo_ggtt_addr(lrc->bo);
>  
>  	do {
> -		bb->cs[bb->len++] = MI_STORE_DATA_IMM | MI_SDI_GGTT | MI_SDI_NUM_DW(1);
> +		bb->cs[bb->len++] = MI_STORE_DATA_IMM | MI_SDI_GGTT |
> +				    MI_FORCE_WRITE_COMPLETION_CHECK |
> +				    MI_SDI_NUM_DW(1);
>  		bb->cs[bb->len++] = offset + flex->offset * sizeof(u32);
>  		bb->cs[bb->len++] = 0;
>  		bb->cs[bb->len++] = flex->value;
> diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
> index 0be4f489d3e12..3a75a08b6be92 100644
> --- a/drivers/gpu/drm/xe/xe_ring_ops.c
> +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
> @@ -72,7 +72,8 @@ static int emit_user_interrupt(u32 *dw, int i)
>  
>  static int emit_store_imm_ggtt(u32 addr, u32 value, u32 *dw, int i)
>  {
> -	dw[i++] = MI_STORE_DATA_IMM | MI_SDI_GGTT | MI_SDI_NUM_DW(1);
> +	dw[i++] = MI_STORE_DATA_IMM | MI_SDI_GGTT |
> +		  MI_FORCE_WRITE_COMPLETION_CHECK | MI_SDI_NUM_DW(1);
>  	dw[i++] = addr;
>  	dw[i++] = 0;
>  	dw[i++] = value;
> @@ -162,7 +163,8 @@ static int emit_pipe_invalidate(u32 mask_flags, bool invalidate_tlb, u32 *dw,
>  static int emit_store_imm_ppgtt_posted(u64 addr, u64 value,
>  				       u32 *dw, int i)
>  {
> -	dw[i++] = MI_STORE_DATA_IMM | MI_SDI_NUM_QW(1);
> +	dw[i++] = MI_STORE_DATA_IMM | MI_FORCE_WRITE_COMPLETION_CHECK |
> +		  MI_SDI_NUM_QW(1);
>  	dw[i++] = lower_32_bits(addr);
>  	dw[i++] = upper_32_bits(addr);
>  	dw[i++] = lower_32_bits(value);
> -- 
> 2.47.1
> 
