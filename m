Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1326CCA470
	for <intel-xe@archiver.kernel.org>; Tue, 30 Sep 2025 23:04:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80A6C10E144;
	Tue, 30 Sep 2025 23:04:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LD9v2eAq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0BC410E0C6
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Sep 2025 23:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759273487; x=1790809487;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=qO4BcxYOYaG2hN5ruSKpIDMmrb+q9r1qWUEXYui3w68=;
 b=LD9v2eAquhovzPHgn5z2bv9dyEQP+IuEbZgqTN4iwd8klQ/T3JKPQ6+M
 6l7PYk9IF5JMi2bO/Qb4VYFEj6mSeEjBOKO+HDlqlnHDekqnPLIB2HRKk
 6jPFv2jr28QizwsfttbyGQ/ujlqdNzHkNslEjao7bNaUkb1URhmqoNxwt
 7wz2FqiQm14AsYtHEybCQfuYvh9Si4820k8v00E72rGycAMwHG5vDUixw
 rNJRdPsf2aUjOUAeGeLLBwnBpe/eux9zxspOHPXNcIMPzNUlMhHpfPeM0
 rIk0zfGUObUkiqpGCMwl3s6Wku14mIBU1LPYy+4yCZv48xqdz0Z0OUlyQ g==;
X-CSE-ConnectionGUID: eoD/nTq4TDmymPB2dH25GQ==
X-CSE-MsgGUID: Rnn+Gu5oQO+6yTxa2x5Kqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="78964616"
X-IronPort-AV: E=Sophos;i="6.18,305,1751266800"; d="scan'208";a="78964616"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 16:04:47 -0700
X-CSE-ConnectionGUID: VO5bmVlzSw6HI6St79MFMw==
X-CSE-MsgGUID: kkmcG4QpQ4qgV0lGQkB/Mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,305,1751266800"; d="scan'208";a="179042147"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 16:04:46 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 30 Sep 2025 16:04:45 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 30 Sep 2025 16:04:45 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.56) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 30 Sep 2025 16:04:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RRjTWzu4NfEVGpEB4vGZttKe2wRl1JszNzkXWhr8JJMbaWOjYA0aOVSpbT4wETSbANdRRtWNkO/AwgMQY0h3Q07pFmqb266vbF1Yy7dmOZjE9Eakre4n3j014MD1S849iKHz54ygrsbSmzoqs8bot8x8g2wLjvda6XDLzDGDZCGBG0RkCn+0AKeOCcRi5Qfyi3v3+0v7ECJnDQr33BzOmmg2kfCwHT6uLqSBpOoDjZ9oOsYyEpNeryhVKtfEwYJZXF9p68njgx5FthbdH+5tqK7pdkyC0O/2t86abE0GXo+RGrcudSyD24LheCLSQCXEmhKGarybsXWzafWeMeb1+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kgV1vEuUEN5c+q25trAsvsFCRANSVQXzvm3UDwLFAR4=;
 b=mChqrzfyL4NGAiJUmR/15JIS2aMztZ16ANW5g7WJEUdfm05aQ2IP3pWR+NlWFA95c6/uTsU/TrvLzxfNR0vUVPsGkQ0zQl4lNbB/1+I0939eOaxOxu2v3b0ijttXY3KvkhAgLdOL7B4jMfYXTUayK4NAAoRVqOmB3QPMlQbntPujKgNq0UPvTTHAYHUvA1x404OQl4Sjv+1QPBxfUcsc65bONNdeX3sGMYUUSNxIABgSQ5Vda0Pt3BzQ+fDnVpqNELvdsUVEft7blboYT6VQ+aqqBPRzbCjlPSVfQubdGrSxxwMPFrZw2YeiKtPYj4/2jcWWV6BLHVWS6ICvekvqSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY8PR11MB7193.namprd11.prod.outlook.com (2603:10b6:930:91::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Tue, 30 Sep
 2025 23:04:42 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9160.014; Tue, 30 Sep 2025
 23:04:42 +0000
Date: Tue, 30 Sep 2025 16:04:40 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/doc: Add documentation for Execution Queues
Message-ID: <aNxiCCqXnCi4pPUL@lstrano-desk.jf.intel.com>
References: <20250930015901.411468-2-niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250930015901.411468-2-niranjana.vishwanathapura@intel.com>
X-ClientProxiedBy: MW4P222CA0029.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::34) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY8PR11MB7193:EE_
X-MS-Office365-Filtering-Correlation-Id: 31704397-e0fb-4c1f-7a76-08de0075bd7b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/lbeqyQidOuC0/HNm86V7x3mu86HczcdvKnNk546KgcYbRr7HcQT2EWuEP/k?=
 =?us-ascii?Q?gOJBRhQuKecR/UO9r6AWX6pQMqUu+G9zE+JpO4KlJD9d6R26WEMfFvBf5D24?=
 =?us-ascii?Q?3dZBICI7Mb4kcfuNiQ+/S27PnvEf6IElZn0IRZ3daSzn1lmZbDIlmflA3H5o?=
 =?us-ascii?Q?0lyhlUjIQBZrCBOOlVwaMfQsWk//73PIx0yoeKazDhVYlGxzBCdq8Lu7Mgot?=
 =?us-ascii?Q?slsa8J1rNrjRLE8JGbi/UIfUy8myMIGT6p15467XA7wrnsfouDXt09U2IO2B?=
 =?us-ascii?Q?CWTjZ3YJhZCdMU4rQHXCi1aPBBoTonPSMhTYAR+TGFxSIaVaE4SRl6j7vl3R?=
 =?us-ascii?Q?67aM/f4LQRBvlm12oIyyoc18SxoSliH3GKh4VH85tUCYGQwp80YP6/XWpdkT?=
 =?us-ascii?Q?ul0S6z9dYFNhEr8y8ShBMT5ANRhkZbGuCfk1VCh7xxNYezBG9IZFPohRe+Gg?=
 =?us-ascii?Q?UunESb5HvG+l0mL5e8eSatnTqil4akbQROraPuSjxEI+4KIEysijwxFqAKVD?=
 =?us-ascii?Q?AxrEYf4tHRSp/CkSXEVNVQ1BI/n0971LC1bb3NAmrH0LxvZD7mVmiAU7azTv?=
 =?us-ascii?Q?PAWD4Z21YQqlmotTth9MBLV0iPvy9Uh330ifBuxOV6kMFYzmVAlffNAvuN9s?=
 =?us-ascii?Q?UmAd8x0oV99HLnBE2jcthH1fs73fHFlQCQp6BInuMBD9skG2Yp1C1L0JdoW3?=
 =?us-ascii?Q?NVb8l4+p2nlEXpkTcEsj/WAMYdsBCNV30YCaAtMbtIOBdeEQNlLGeNuSaOal?=
 =?us-ascii?Q?2CSD4M4w3oftW/iUHSrNZprpBZwB4yqq1nU7YLEK0ggp6eZw9d99lZK/IOtS?=
 =?us-ascii?Q?7iKesFJMCA3RPabzwa0E4KO8UfOXOVcvluMyMHhACmPt1FLcmMdXj8ybL/rQ?=
 =?us-ascii?Q?oNrIXfYZVp6aIip8rSGAZ8YZJe+9RA/1G+Ds6oPxdrzZMdB+UqSOub+iS+Cy?=
 =?us-ascii?Q?9zW0fn1OP0pLJnmzmlYQCrCFhHjiW6Ndzobkmbb0ZZgiXqVYad/7MNgDFE6k?=
 =?us-ascii?Q?gs5A1k+3RwsFL+wZ/Df1Chrt6CTGF7/oSJU4VvP46JpBrg0r54uRiVas7SXg?=
 =?us-ascii?Q?UJdXgFixmVxuM1ZfspEUQkVHPzFYCnAukNh08OaZiRgnnFhZtBlV9IAOv9Vv?=
 =?us-ascii?Q?88qT5+R+4DzWMRXidNsASbmNLgh2UQuoJISCSjUydlUiAVjQKCTgwt38MqNd?=
 =?us-ascii?Q?MD4nLoIhiLtAIfd/ceTZWQtPSEaAR0fIqDJPVZPMq+PNGol1QZqRmM9xxNp/?=
 =?us-ascii?Q?Qzofs1/bmaJyxhV60SL6A/oW1MpY0kHIafjxbjbNKQogmQiXXLJBElDL5GDK?=
 =?us-ascii?Q?gATfzTJBZZfTU2VtulJVws3Q26L5hHc6S8fFRayTc1xZtNUd1pQSbcNmZIw7?=
 =?us-ascii?Q?24W7u4bpAoZA0b+jJjpCUU8sl/J/Ds0XLVbrdH8ELMyd5ul288xO17ikd7J4?=
 =?us-ascii?Q?CpTKRdVzNBfIRIMydy0jOCiPj8wX1EDJ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1xrpljO8ebX7A/nocUHdUASVL5rNNAnq7tgNoF+k1h99mH3sQrEzw5TIPh/e?=
 =?us-ascii?Q?qm5Qd1wsfYxe/8XGBfsddjLvg6aTMXF3NTtmqcIBp9FUXQhCZuC7e0+Llmf6?=
 =?us-ascii?Q?vNZr21x9J1TqAF0TN8qea6iKjmL9I2fLwKgX9g2vxv0sjEuBNN0FTuTlzkXq?=
 =?us-ascii?Q?e12grAFlHJeobjktfmKj2Jjus9ZgKG3gkUXU2QJ/SJEWYGmVv+54rxX+ZZz+?=
 =?us-ascii?Q?P9mowh+R/5acVIBN5e+/9IMgLcJ/dPPFysNfsKJNxo+Goou2GUBzED+j/BmD?=
 =?us-ascii?Q?8AbhCmI8se9mctMaWFJ+wcLx3JF0zDrz3ZRT0FgBJDB4+eXVkaPfbsc8lt7M?=
 =?us-ascii?Q?tU3PwXyzqSZtsxGLKiaokZ3SSXx9XD3hCfyT7/y9pJHlB4UaSCfznqCzkIh2?=
 =?us-ascii?Q?O3RKKJ1dzDxBPSDDwbg6WBpUcoapPKuyXp7Hjm0ejdo2qgbJhjTDVKb7+dUS?=
 =?us-ascii?Q?qGc3aObuCUz/3m0GEckLRUEJ6TEQRmm1iMWRYm1cCLzG1jhap7ChDJvImaa4?=
 =?us-ascii?Q?zjY7RUABV6BPLtNeITgA5HO54+RjIPOGp3P5gpHYtP/ClaJAvFA8ywj97epk?=
 =?us-ascii?Q?PJH8G+E/k1pjUgOd5L608y7gEiUMwgzEMqqPePXVs1bp0LK/SVpjs2UJU+se?=
 =?us-ascii?Q?gGl9OJH7FRzldiQNy4wc8U0lWKgRCV4jSqO5OCc10y0U7DlFbjJIaD4hU4R/?=
 =?us-ascii?Q?V//oIGt1ItX6epocOAqzBevZPbmk4jwKPQ8WZwxOgUjR6AgNSlNz7n02j14u?=
 =?us-ascii?Q?K92JDZT06+fmN0AQjJJu0mKA0b0AfKLV4RjaGOiwiMroXAzNm6mwyiT7Ft6X?=
 =?us-ascii?Q?PO77o/SMdBYbWtU95dgMRL7ga5xlct94dj9id13XS0Nevvtc77xabDB+3Tne?=
 =?us-ascii?Q?mQUBtSKZRTkdAEDAgwpyx2IU1ofewqFNYPhVN8ADKarQKOB0ctYeAYATy0WV?=
 =?us-ascii?Q?1n8L/IFoG7ONk0Tgnh4+0M33mIZvSE705J29O7D9nX5OK9IRYkOKX0bOtF05?=
 =?us-ascii?Q?1lIKJDAdwFpNLbolgAL4CijPZIOw4iFC38rHr3qMn0wqPsp7C/0DTIf6yyaL?=
 =?us-ascii?Q?HVHwQBOxdVnSdjW7jVOyIznx3SEIJQuuO7s3hIJ8NhRnLKea0KbJsgHE2P+t?=
 =?us-ascii?Q?Jzt70wyUBu3vynwrhLfNsM4X5IzynWB6NniOlMTJ7r9a+D5qqDEF/jMmoejE?=
 =?us-ascii?Q?cPYnZyoRLtASSlbmlngyIqO2D0QTrxmSVmmrLf5/9pHZR9FoR1uASY1qIPy+?=
 =?us-ascii?Q?fZm1lNUagGRab5TdimNZLSe6k3zvtuT8VHmdG7ds5Y8YJvy/We7YRKvJVRXW?=
 =?us-ascii?Q?FTXWTsT4cwFzY/Td5TfLS0LboOF8FAne6E7yOcsRf7BKvWvaAREkNAFq0qEt?=
 =?us-ascii?Q?JbiqpWL+6zUogLdL8huO81U0ckSW/CeBIsHSCrSGFDY6r7+BbHDWF2danuv9?=
 =?us-ascii?Q?arfhhSiXKCrnbm/gchRvNF+I3/E7EQQlnhkdLLoQr/SrIMJArcih2tTEHbIV?=
 =?us-ascii?Q?ZmOYMCl+dl3KMf5TroU8swQGAa8E+0EQO/TtGg+dtMxR91ZlWkUNLvasOjNN?=
 =?us-ascii?Q?1hcD1pf3r0Inqgut4UUM4OrUX0dgDut5VcMmNNPErP7smQVZBJ+HbS3TPsTz?=
 =?us-ascii?Q?Nw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 31704397-e0fb-4c1f-7a76-08de0075bd7b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2025 23:04:42.5756 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2cefwEDdLwPMSEUShDMpWGGKiKSk4iHWLnIOL4ee6KE2kVzYxX9ql1+XhK4rqHp06iKWKQK5al+QMYFQrTuyiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7193
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

On Mon, Sep 29, 2025 at 06:59:02PM -0700, Niranjana Vishwanathapura wrote:
> Add documentation for Xe Execution Queues and add xe_exec_queue.rst
> file.
> 
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> ---
>  Documentation/gpu/xe/index.rst         |  1 +
>  Documentation/gpu/xe/xe_exec_queue.rst | 20 ++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_exec_queue.c     | 11 +++++++++++
>  3 files changed, 32 insertions(+)
>  create mode 100644 Documentation/gpu/xe/xe_exec_queue.rst
> 
> diff --git a/Documentation/gpu/xe/index.rst b/Documentation/gpu/xe/index.rst
> index 88b22fad880e..bc432c95d1a3 100644
> --- a/Documentation/gpu/xe/index.rst
> +++ b/Documentation/gpu/xe/index.rst
> @@ -14,6 +14,7 @@ DG2, etc is provided to prototype the driver.
>     xe_mm
>     xe_map
>     xe_migrate
> +   xe_exec_queue
>     xe_cs
>     xe_pm
>     xe_gt_freq
> diff --git a/Documentation/gpu/xe/xe_exec_queue.rst b/Documentation/gpu/xe/xe_exec_queue.rst
> new file mode 100644
> index 000000000000..6877a154d771
> --- /dev/null
> +++ b/Documentation/gpu/xe/xe_exec_queue.rst
> @@ -0,0 +1,20 @@
> +.. SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +
> +================
> +Execution Queue
> +================
> +
> +.. kernel-doc:: drivers/gpu/drm/xe/xe_exec_queue.c
> +   :doc: Execution Queue
> +
> +Internal API
> +============
> +
> +.. kernel-doc:: drivers/gpu/drm/xe/xe_exec_queue_types.h
> +   :internal:
> +
> +.. kernel-doc:: drivers/gpu/drm/xe/xe_exec_queue.h
> +   :internal:
> +
> +.. kernel-doc:: drivers/gpu/drm/xe/xe_exec_queue.c
> +   :internal:
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 37b2b93b73d6..60e8b575db2c 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -28,6 +28,17 @@
>  #include "xe_vm.h"
>  #include "xe_pxp.h"
>  
> +/**
> + * DOC: Execution Queue
> + *
> + * An Execution queue is an interface for the HW context of execution.
> + * The user creates an execution queue, submits the GPU jobs through those
> + * queues and in the end destroys them.
> + *
> + * Execution queues can also be created by XeKMD itself for driver internal
> + * operations like object migration etc.

I don't want to nit pick this too much as better than the current state,
but a bit about how it reference counts related to VMs / LRCs might be
good and a bit about how this layer sits above the submission backend
which should be able opaquly handle different backends might be a good
idea too.

Either way:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> + */
> +
>  enum xe_exec_queue_sched_prop {
>  	XE_EXEC_QUEUE_JOB_TIMEOUT = 0,
>  	XE_EXEC_QUEUE_TIMESLICE = 1,
> -- 
> 2.43.0
> 
