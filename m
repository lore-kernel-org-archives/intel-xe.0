Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 055A7CDD0FA
	for <intel-xe@archiver.kernel.org>; Tue, 22 Oct 2024 21:39:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6DE610E227;
	Tue, 22 Oct 2024 21:39:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K4UX73CW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A33910E227
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Oct 2024 21:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729633184; x=1761169184;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=azKVZSCBXF5eD7ZVthJB2qLjvETka/R+0PoE2Z5lZ0k=;
 b=K4UX73CWjFHfXhcSfKpgyg11FsTNl5Qs3SuB0asYMTlm9PPvRxCYJR4d
 +fw3lhYrNkdvy8cQ0F5hKFMUjkP4OueP77l0nZq8A0LI++q8+JmJdbHqo
 w84SS6n5KqpVY7EIY7VZ9ojW/7M7QoO8NW5DI64zkcPgQVm0ZBkOcnUw7
 1Uf8wOu17eWXAF+M1yv2XNpUe+JFnflCZkDB8ekC4krF7LE/X27Jwtfsl
 qwZXHdjRTE+Ri4er68WQ8ZNqhxKPVXQTrZRQIfTEFGdk+7ot6lzdK63IS
 mPBI2dUPc2EiFwEMBXNRD88O2IWrR5EaqMre/VM7/5pimHzw/9Qi4xiGC Q==;
X-CSE-ConnectionGUID: ovX2xG6FTYaOEXOv70CjUA==
X-CSE-MsgGUID: UYYAzcJvRyy6c6Ta8cxEIQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11233"; a="54600313"
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; d="scan'208";a="54600313"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2024 14:39:43 -0700
X-CSE-ConnectionGUID: QA7bN8YhRzCoMZ3KCCvOMg==
X-CSE-MsgGUID: HG47CvOPQomIQGou4HZVYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; d="scan'208";a="80811727"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Oct 2024 14:39:43 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 22 Oct 2024 14:39:42 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 22 Oct 2024 14:39:42 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.174)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 22 Oct 2024 14:39:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J7kk7Foy+Ed4x7eSLXux76GJa0vlHwKUuk/19tpwjQjgvo51DOKizAqnZT7/bfnCSW58nTCrPDVKox7HFUJSe5nJcLx+LReBpnP56KzkYjbXYPtbgHAN/m59WaQGmw2Tqtqs3ddus9MpW1pNVzg4svfLDzr7qPkB07h92cV3V93MY8VZc8iCxJZS4LJpQExNcMp8Ycvupt7vedDcHJ+0BiSQnMP0vKrtHPQRE8/+c/9r+xrq7DrJnmPm6c2vUDyQxQl6L6nIRLygfLomhl4L3279W+Wj0rO/C2vWoSsXh/MQgdi84+E/VAE1QjxolNOj2WYpxidwE+jFcB6Op56XeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YyanvSRdF2Qr723Zn3yh2bfWr2V33e3LKn0rT24FySU=;
 b=N8fau4T13M3FBzY4wNbYydbn2+ZTbki6828XnSa6n31LA7ylNRB1FtijMIi8zcVsnXusP9aDnHXT28HaJKl8gbzv/ABwkDMTlSTyJZCzu0x7+FzaAqoLRDPMIvvqWLTSs5kBD3IkqVl+dEej+iaj0YPKe+8OBjwx44ZU7/jBqu+QDregIuFdpBq5tZ+PqEv+992bSiTUI5yv1BhJptjer6l6u4ku4BLCJLzkgALQhaC2s2fisPhdkvuPVPFA7aIy9rNIr5RT9gT4V38PxCWUnnsJm4xBK1QUFQknJ9A7GLjPqnVvcrLs4DsxWzQqCZHI80L5nsDyDIybNI3c+RVowg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by SJ0PR11MB5198.namprd11.prod.outlook.com (2603:10b6:a03:2ad::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.16; Tue, 22 Oct
 2024 21:39:40 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%7]) with mapi id 15.20.8069.020; Tue, 22 Oct 2024
 21:39:40 +0000
Date: Tue, 22 Oct 2024 17:39:36 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Thomas Hellstrom
 <thomas.hellstrom@linux.intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>
Subject: Re: [RFC] drm/xe: Add separate Kconfig file for SR-IOV options
Message-ID: <ZxgbmDJv46s0pdp7@intel.com>
References: <20241021081242.1727-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241021081242.1727-1-michal.wajdeczko@intel.com>
X-ClientProxiedBy: MW3PR06CA0017.namprd06.prod.outlook.com
 (2603:10b6:303:2a::22) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|SJ0PR11MB5198:EE_
X-MS-Office365-Filtering-Correlation-Id: 48acdfdf-5160-449c-c129-08dcf2e20851
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?FA9XuUykBLEXkvXuBP02Vcor9X6L5oQxskP8zXSxIu69D8VzN6bU4cJHcgV/?=
 =?us-ascii?Q?yR1VUMPI88oMDmyuK2mN/R4PFjxBSu/sgpDZmumrkOXKemPsu4wvoFvSw3Ll?=
 =?us-ascii?Q?7DSXbAZzsDuwVdCGprp0fLXU2HhtmwhgLiDwmrcZIF3ZOqjoypQg2ZVq0BBO?=
 =?us-ascii?Q?KUybd2/zStWq2/9fmEDszfW5mQgGBl/6Rbcp2JvqyB9j1DpP95iu+/fhU0Zf?=
 =?us-ascii?Q?j2+FtEvFEjCAAG0wPv34HmdduUw6lYgrtSUyFu54uikmyVrmpKWltDcx6RQw?=
 =?us-ascii?Q?DS8V50jIqpjtp13exDvXxSubUvx12Bidr1h2E/2OvywbwynZQLNyB0q69id/?=
 =?us-ascii?Q?q1pSJ8IN6tcX4VmwT6IdsE5Mswah0TkkeKx1PJuEQG0u7eiftGP1jLR0498C?=
 =?us-ascii?Q?FvFmdEnidgIwZSlkZFi+HXvsmQgBPErEP1xv7UDzXMqKRVN45WrTaA1rnEQT?=
 =?us-ascii?Q?RqgJzc5HM+mBc2QaZRvVmQzenLzQxKmpq+Rv+K6z7COuoLrZc7BvjXYBimh5?=
 =?us-ascii?Q?bA5wESs3sQtPrYEFWx1finzEIJL4zh9N+6pVOK2XTaV5pBnEWhTvJthUdLrY?=
 =?us-ascii?Q?wrC1Jf30eedQrkgovZ+UxlBnJNUPydQTuEFi7WeABmVQyk+0Thrd/WxViMCv?=
 =?us-ascii?Q?ViebN7Areowgjb+ij0reTd0p7wJ+HGHMHpy67zvwzFMb1qOW5mGBVQbENC7c?=
 =?us-ascii?Q?wdjsm4KvqehX0pEITxhd/l7w83lOUbr/X6pEHfaAlhDRbItO7s6MevbatzRx?=
 =?us-ascii?Q?1uOyBXLTG4R7UrRiJO6juYLZhMC0IrXAY+vRx8PJSGB8Z6oJwFUW+0qDrFdG?=
 =?us-ascii?Q?ri+YSFDyv0BP3urZ5pCBRneFBSqiUcwbUI7su2MBjSK7NRonT8GLQgcdYFIU?=
 =?us-ascii?Q?oDtZrBX9lW26lX+tL9barZ0xzz8jkoiwj/14M5UJSJCMhGhQmE3lo4NDrqOa?=
 =?us-ascii?Q?7LMM/KniowtLQVZKao9n7vmlYNuG3QYHIZC46V0zHf1B6ITPSDwaLsXudqYJ?=
 =?us-ascii?Q?uusn1VzDgHBnEKnVc7/M8ph2LvdKJdsTymitdKbOaxIU2KxY/BunaRaGcSD2?=
 =?us-ascii?Q?eGjKOYeJc8uV5mCrzx50DjssxxAacnzKILU3f78pDsfQY6ddonPNrfPwGJLD?=
 =?us-ascii?Q?pzfbIr7wROBlDuypbvXE9bXpkjn9M1kEm1zd3yrI/Esmw5xf8L3ZtscHLNmO?=
 =?us-ascii?Q?nDFg2tVrpK3n7Q/YFInF05E0FvqWBpniFOor5P6M0AjLOXIJf0AqGrGixtNb?=
 =?us-ascii?Q?1NEJ1xikAapH3eWmHeLfR2I2bjTHPGXXdcb3wwJxmpqT2PW+0qsAXPAtimlI?=
 =?us-ascii?Q?CCuDmZjqGvAdKKmOGOfh0XHd?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tYGETxlhf5N/hL89ZC4zP30DWZ62V4STPyjOvpITo3oFePiLXuXTCig/LQUE?=
 =?us-ascii?Q?BsVNHYkP8VMtGC6gkYRN64jritisJS3oDTtpyP9dK6rIZC+djGd0C34R2V9l?=
 =?us-ascii?Q?3i0Z1mhHdojtq1kSuEPHEK/8G0IX6ECu0gGagbW0O+HxZ1nVc2XIOPs0sNc1?=
 =?us-ascii?Q?4Q8PuLBz0FW77QAT+1zRAQ3m298dFtqIzgRmIoCad1uagXnTy+IEbIhay4vN?=
 =?us-ascii?Q?vpRzhscxTC00UA0YC5vK7vwIhc0sCRtS1f2fO5q/UPMeD3H4DnudzxgoHd/A?=
 =?us-ascii?Q?9uA3Xw6Maa0+UqxpK5s9uyqvgbigZTsW0zyRNTdBrQMyK6lc4z5WYfjsG7yE?=
 =?us-ascii?Q?OmqS4EqZwz8SCJ/GN+vUIIKeHUFYWB12Zb1Rjfxz+ZUiOLV+0sZH4Oux9H7+?=
 =?us-ascii?Q?84yXrL6W1veuL1pgCInCCF4w2M5d0Bg1rqPPoL0iCExaWjo14C1yUNTFjfTn?=
 =?us-ascii?Q?3hOhVbpAJlMkW5p32OtA2RvwmQDY5BRWrYjJLH9oEBreKSCk1RPSK1T3JvPt?=
 =?us-ascii?Q?ggB8Wf7n++p94V9PmemaRzqDl/tPnzNYugrruFBweeS/AvXazSXtYrM3UUeK?=
 =?us-ascii?Q?U2R+0gXgnwCo7xeC1E7ciKjSo2eo8vtot7+y8/hu+tKZKaHty4voVruyRspK?=
 =?us-ascii?Q?A2QU/KOjpx/+P5hHiLLAuj1RagvMc92UI+J94KoBJCpiBJEyIe9j38+dyHsB?=
 =?us-ascii?Q?kUyLqD8X5HPLsDL4VRUsdgCVbbWtBrq03e2zriHi1SpwMsHTonuaLeokrSPH?=
 =?us-ascii?Q?hvnW5tostCuRIbVKKaOJuoMlD1B5SUIwtyQnZ23sPy9KiGffkxeh8R8Ddu/G?=
 =?us-ascii?Q?FROcthIp/ChKQso+vGzN5B+sjAWfuFtLbeyDUFMGpChzNEeOpKLDnrHnfhL6?=
 =?us-ascii?Q?qNbbmeW58T2LrpKHSt7Uffqr/b+7vk3zSD0HDPKgRdgX7hsjVIiBByBTb57n?=
 =?us-ascii?Q?w5BRkkW3cks26kpFVxkllr6A9VCtcdgt9JaTlXfSoaRln/uziMbCOU0vP4aY?=
 =?us-ascii?Q?t7IsnaKl66liI/556Id5CzahOfGt58TXYo1u0SY1tjLP1IO15gbwd3xKY1mI?=
 =?us-ascii?Q?OECAfEklGUpFcNJRfX24QEOSCQb4/4ePf6jaUjLviguJ82nQ3AMirts70M+b?=
 =?us-ascii?Q?rRwBG88vWToeQ9+su/h4quDiddeBawn6sQAumbh1wNFh+6+5jPKx3fcauMph?=
 =?us-ascii?Q?Du/0+7xtejV+0uZCeYyl8xBAhkTmVe5OG7io0baGaWTBuduO203kJhmmRXP9?=
 =?us-ascii?Q?AOGfeeeZtPiRc6lr0Cpwu6V7K2lvjSplyPWeE1HK9Irx+ltCxilPLa8Z21H6?=
 =?us-ascii?Q?DdS7QkO94CAEg173qsxwIV8rpzeuzGI74pF+rY/HxL6au2fyWnWBpbJS7xlw?=
 =?us-ascii?Q?ZTGAFDWXPHU66O4fvdcFYWboPeMvXAhhJicJOpXpczW+g1TLdx55B0vGmUTB?=
 =?us-ascii?Q?JXDWUjIIiqY/oYSHXnk7rWaphJyToUSPV0cadH0hFZmSQkU5aJiBLMlTgshq?=
 =?us-ascii?Q?pbd7lQSDfQ3Z8icCrN8kyCzCxf3oI5WHIui5OcAnf1zSE1HJ7Tlel6HEzRpt?=
 =?us-ascii?Q?gXEjMozGw5J/oL9yb+AvVEzaUvgaI3vut/6nkn3PMbIsRcWX/f2WMmYxc90P?=
 =?us-ascii?Q?jg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 48acdfdf-5160-449c-c129-08dcf2e20851
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2024 21:39:40.0756 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UhyapIqH03bShs2nZfn0y3UEmVFP8+qnDRLBTGvKVF0Qz61u01TsF+xqilvHSNoIILd5MerVXRjbfvVdt1x9Kw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5198
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

On Mon, Oct 21, 2024 at 10:12:42AM +0200, Michal Wajdeczko wrote:
> There are few SR-IOV config options that we want to define:
> 
>  - DRM_XE_SRIOV_VF to allow compile-out support for the SR-IOV
>    Virtual Function (VF)
>  - DRM_XE_SRIOV_PF to allow compile-out support for the SR-IOV
>    Physical Function (PF)
> 
> and for use by PF only:
> 
>  - DRM_XE_SRIOV_DEFAULT_SCHEDULING_[FLEXIBLE|FIXED|CUSTOM]
>    to select preferred scheduling method using either predefined
>    parameter values, or custom values
>  - DRM_XE_SRIOV_DEFAULT_PF_[EXEC_QUANTUM_MS|PREEMPT_TIMEOUT_US]
>    to define default execution quantum/preempt timeout for the PF
>  - DRM_XE_SRIOV_DEFAULT_VF_[EXEC_QUANTUM_MS|PREEMPT_TIMEOUT_US]
>    to define default execution quantum/preempt timeout for the VF
>  - DRM_XE_SRIOV_DEFAULT_POLICY_[SCHED_IF_IDLE|RESET_ENGINE]
>    to define default values for advanced scheduling policies
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Thomas Hellstrom <thomas.hellstrom@linux.intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  drivers/gpu/drm/xe/Kconfig       |   5 ++
>  drivers/gpu/drm/xe/Kconfig.sriov | 140 +++++++++++++++++++++++++++++++
>  2 files changed, 145 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/Kconfig.sriov
> 
> diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
> index bac96c0dd66e..cd68eda9ca79 100644
> --- a/drivers/gpu/drm/xe/Kconfig
> +++ b/drivers/gpu/drm/xe/Kconfig
> @@ -87,6 +87,11 @@ config DRM_XE_FORCE_PROBE
>  
>  	  Use "!*" to block the probe of the driver for all known devices.
>  
> +menu "SR-IOV Configuration"
> +depends on DRM_XE
> +source "drivers/gpu/drm/xe/Kconfig.sriov"
> +endmenu
> +
>  menu "drm/Xe Debugging"
>  depends on DRM_XE
>  depends on EXPERT
> diff --git a/drivers/gpu/drm/xe/Kconfig.sriov b/drivers/gpu/drm/xe/Kconfig.sriov

I'm totally okay with the idea of the separate sriov config. As long as the
options are only getting added when they start to be useful and not in advance
like this patch.

But also, I got scared of how many options you are planning here.
Mind about the exponential combination of validation and our CI
needing to have multiple different configs. Please let's try to
limit those to only the really needed ones.

Thanks,
Rodrigo.

> new file mode 100644
> index 000000000000..3bd3eee51e9f
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/Kconfig.sriov
> @@ -0,0 +1,140 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +config DRM_XE_SRIOV_VF
> +	bool
> +	prompt "Virtual Function (VF) support"
> +	default y
> +	help
> +	    Disable this option only if you want to compile out the SR-IOV VF support.
> +	    Without SR-IOV VF support, driver can still be used in native mode.
> +	    This option does not impact the support for the PF mode (if enabled).
> +
> +	    If in doubt, select "Y".
> +
> +config DRM_XE_SRIOV_PF
> +	bool
> +	prompt "Physical Function (PF) support" if PCI_IOV=y
> +	default PCI_IOV
> +	help
> +	    Disable this option only if you want to compile out the SR-IOV PF support.
> +	    Without SR-IOV PF support, driver can still be used in native mode.
> +	    This option does not impact the support for the VF mode (if enabled).
> +
> +	    If in doubt, select "Y".
> +
> +if DRM_XE_SRIOV_PF
> +
> +choice
> +	prompt "Default Scheduling Profile"
> +	default DRM_XE_SRIOV_DEFAULT_SCHEDULING_FLEXIBLE
> +	help
> +	    Select preferred scheduling profile to applied by default.
> +	    Choose "Flexible" if maximizing the GPU usage is preferred.
> +	    Choose "Fixed" if consitent VF execution time is required.
> +	    Choose "Custom" to define all scheduling parameters.
> +
> +	    If in doubt, select "Flexible".
> +
> +	config DRM_XE_SRIOV_DEFAULT_SCHEDULING_FLEXIBLE
> +		bool "Flexible"
> +		help
> +		    Use this config to prefer flexible scheduling method.
> +		    This config will predefine default scheduling parameters
> +		    to maximize the GPU usage that may cause some fluctuations
> +		    between VF execution slots.
> +
> +	config DRM_XE_SRIOV_DEFAULT_SCHEDULING_FIXED
> +		bool "Fixed"
> +		help
> +		    Use this config to prefer fixed scheduling method.
> +		    This config will predefine default scheduling parameters
> +		    in a such a way that all VFs execution time slots will
> +		    be consistent.
> +
> +	config DRM_XE_SRIOV_DEFAULT_SCHEDULING_CUSTOM
> +		bool "Custom"
> +		help
> +		    Use this config to define custom default scheduling parameters.
> +		    This config is mostly needed only if specific scheduling
> +		    parameters are required without involving any manual
> +		    provisioning over sysfs or debugfs interfaces.
> +
> +endchoice
> +
> +config DRM_XE_SRIOV_DEFAULT_PF_EXEC_QUANTUM_MS
> +	int
> +	range 0 100000
> +	prompt "Default PF execution quantum (ms)" if DRM_XE_SRIOV_DEFAULT_SCHEDULING_CUSTOM
> +	default 20 if DRM_XE_SRIOV_DEFAULT_SCHEDULING_FLEXIBLE
> +	default 20 if DRM_XE_SRIOV_DEFAULT_SCHEDULING_FIXED
> +	default 0 # unlimited
> +	help
> +	    Use this config to define default PF execution-quantum provisioning.
> +	    The value (in millisecond) indicates the amount of time the workloads
> +	    from the PF can run on the GPU.
> +	    Value 0 represents _infinity_ execution-quantum.
> +
> +config DRM_XE_SRIOV_DEFAULT_PF_PREEMPT_TIMEOUT_US
> +	int
> +	range 0 100000000
> +	prompt "Default PF preemption timeout (us)" if DRM_XE_SRIOV_DEFAULT_SCHEDULING_CUSTOM
> +	default 20000 if DRM_XE_SRIOV_DEFAULT_SCHEDULING_FLEXIBLE
> +	default 20000 if DRM_XE_SRIOV_DEFAULT_SCHEDULING_FIXED
> +	default 0 # unlimited
> +	help
> +	    Use this config to define default PF preemption timeout provisioning.
> +	    The value (in microseconds) indicates the amount of time the GPU scheduler
> +	    will wait for the PF workload (context) to yield to other VF.
> +	    Value 0 represents _infinity_ preemption timeout.
> +
> +config DRM_XE_SRIOV_DEFAULT_VF_EXEC_QUANTUM_MS
> +	int
> +	range 0 100000
> +	prompt "Default VF execution quantum (ms)" if DRM_XE_SRIOV_DEFAULT_SCHEDULING_CUSTOM
> +	default 32 if DRM_XE_SRIOV_DEFAULT_SCHEDULING_FLEXIBLE
> +	default 16 if DRM_XE_SRIOV_DEFAULT_SCHEDULING_FIXED
> +	default 0 # unlimited
> +	help
> +	    Use this config to define default VF execution-quantum provisioning.
> +	    The value (in millisecond) indicates the amount of time the workloads
> +	    from the VF can run on the GPU.
> +	    Value 0 represents _infinity_ execution-quantum.
> +
> +config DRM_XE_SRIOV_DEFAULT_VF_PREEMPT_TIMEOUT_US
> +	int
> +	range 0 100000000
> +	prompt "Default VF preemption timeout (us)" if DRM_XE_SRIOV_DEFAULT_SCHEDULING_CUSTOM
> +	default 32000 if DRM_XE_SRIOV_DEFAULT_SCHEDULING_FLEXIBLE
> +	default 16000 if DRM_XE_SRIOV_DEFAULT_SCHEDULING_FIXED
> +	default 0 # unlimited
> +	help
> +	    Use this config to define default VF preemption timeout provisioning.
> +	    The value (in microseconds) indicates the amount of time the GPU scheduler
> +	    will wait for the VF workload (context) to yield to other VF.
> +	    Value 0 represents _infinity_ preemption timeout.
> +
> +config DRM_XE_SRIOV_DEFAULT_POLICY_SCHED_IF_IDLE
> +	bool
> +	prompt "Default schedule-if-idle policy" if DRM_XE_SRIOV_DEFAULT_SCHEDULING_CUSTOM
> +	default y if DRM_XE_SRIOV_DEFAULT_SCHEDULING_FIXED
> +	default n
> +	help
> +	    Enable this config to turn on the strict scheduling policy by default.
> +	    When this policy is enabled, VFs that do not have work to submit are
> +	    still allocated a fixed execution time-slice to ensure all active VFs
> +	    execution is always consistent.
> +
> +	    If in doubt, say "N".
> +
> +config DRM_XE_SRIOV_DEFAULT_POLICY_RESET_ENGINE
> +	bool
> +	prompt "Default reset-engine policy" if DRM_XE_SRIOV_DEFAULT_SCHEDULING_CUSTOM && EXPERT
> +	default n
> +	help
> +	    Enable this config to turn on the engine reset policy by default.
> +	    When this policy is enabled, GPU engines will be reset by the GuC
> +	    on each VF switch to enforce cleanup of any stale HW register state.
> +
> +	    If in doubt, say "N".
> +
> +endif # DRM_XE_SRIOV_PF
> -- 
> 2.43.0
> 
