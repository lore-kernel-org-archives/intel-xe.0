Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6B0DD2FED9
	for <intel-xe@archiver.kernel.org>; Tue, 27 Jan 2026 19:58:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7345010E5BE;
	Tue, 27 Jan 2026 19:58:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KUzeWdfY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D27010E5BE
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Jan 2026 19:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769543882; x=1801079882;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=V2UcPUKmAtTh1zK+igNsatK6LAgt4oXsdOsRPsOmaNo=;
 b=KUzeWdfYdenU0zx0a0iczTFPRxkyePUSPY3rSOks9Jd1/esbBW9h3S7T
 e+6cp7qksK5E8jp8HsPSy4Uh78M/CzCHyTAkGPV0ewQgRWpIF92WSDhgc
 E1j7AdLaqIxJ69rm4eDXUP5Csqa5KLv0J+WLV8qXHI7vWscfXtISBY+PQ
 EcCx84W17Iq/oWGw8d934/N6ZYKpoQr4sE5VDTVhyZ/fKZWy2ilv7b71U
 tNTWafyCSfedyLbBSNMw92vq+kydK0DJpfTirjaHNocgNS4dFT59wwLwy
 RY+0SHH1Fxn7G7gkjysLxyGxoxgPqmx2fVmGH/gqRuK+5nDt0hDhAKwI+ Q==;
X-CSE-ConnectionGUID: XGv4yvoFT7GxeQkE+PWJEw==
X-CSE-MsgGUID: Nxq/2b4TTXa7VFJaALYnaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="70916678"
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="70916678"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 11:58:02 -0800
X-CSE-ConnectionGUID: WQqXQEAxSsKxOt3ETRcPoQ==
X-CSE-MsgGUID: +m0zrRiAQECf51zhGlqChw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="208300347"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 11:58:01 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 27 Jan 2026 11:58:01 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 27 Jan 2026 11:58:01 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.36) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 27 Jan 2026 11:58:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VOPqhRqLoQRD9SIcKms0WV26rSiTwbYULttJmFp5DiqiVr/Hnl5Vs+8/wTnvPMsko0tGrdH/Nj6wDZ3saX4CYRiGhjjnyGFxA1e1pKEmrJlSfo025Cqk+SQVhm1+qOgyaNzQxL/XX2l5qzeRg0dYvXsIiv2L2uReUu5ii8L2VM7QIyCQ1yCgY0lAgz0VXSLpFKyyQpEhAB1tOzlvyXOnIMAsRloURezzmmxfEKjmQr0pQ/hczgtVMZ1ODHgPQhIZRLOb9h26u29325N8Sc0FhsgqOi+uEsTTJxc3rq93P8JJji0ugsgonVX0h+UXpUsWYnoclJDoLDpJwZCoQRg+aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wilcx70VVAz9YbpUtJSctJCN61UDsG5H2qDC5cXHWeg=;
 b=v3VHggAJhq02HQCr0H+t8LaPk8T9AkeS+8HJqEtuFr7yGUKmZxhvgbxqmC+Qo+wkWzDeVeAzcLuEjViJ2wfuam8kX+y2/Ew1atgMlF0GH2N9GeYaiYvhBHKdGPSH7hBUXhnFAFwspJakYibDU8TYRQwgyP63bcWXZm0Ogh2ijUxVcP3/TfdV0d5Di7GvZ5aoXROhoaQkiTVqUuRoJkP4Ppb21iEN/PF0fJl+/fr6Lhh2HRK3tkia6AyW0LJ7mz5gGwiSvFFbWS1l5QbCGN/XFrT5NQFN/tWuKtWJXwCzuXOM54gASFuv2laqq/6UAu5NRXGn8fOKGQ8jBv1yLgcrUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM4PR11MB7280.namprd11.prod.outlook.com (2603:10b6:8:108::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Tue, 27 Jan
 2026 19:57:57 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%6]) with mapi id 15.20.9542.010; Tue, 27 Jan 2026
 19:57:55 +0000
Date: Tue, 27 Jan 2026 11:57:52 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 6/6] drm/xe/guc: Allow second H2G retry on FLR
Message-ID: <aXkYwAvuU20HKZJ8@lstrano-desk.jf.intel.com>
References: <20260127193727.601-1-michal.wajdeczko@intel.com>
 <20260127193727.601-7-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260127193727.601-7-michal.wajdeczko@intel.com>
X-ClientProxiedBy: MW4PR03CA0026.namprd03.prod.outlook.com
 (2603:10b6:303:8f::31) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM4PR11MB7280:EE_
X-MS-Office365-Filtering-Correlation-Id: 6437c9ff-87bd-4788-f272-08de5dde5c59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rv8BW7HOO4Efj4jkC/72tE1SmTyJVoDbvlrqAT23KPnj4lwVgzidxp1nDdRP?=
 =?us-ascii?Q?+LWkzA3RnxqC0yLPO7XU1rNK1Zvd3nGWOKhlICd2C/1z+MtF/herZH5eoMQx?=
 =?us-ascii?Q?t6oUGlwXeD8NtzCZC5RW3OJz+EuGvKXOMfKtElrHWvfIyLRyfS9mbb6yxGXB?=
 =?us-ascii?Q?1EO7jmyILahykkbXiywk0EwQr5vvMPBMyym4Oe8kdDWOk1FhdekZSAlIW+Ng?=
 =?us-ascii?Q?qTlVMr3GJq5uHUjvcidj6jgr/UAQImauvlVHsTs6oEjmqJQu4MxESwlHoQ+Y?=
 =?us-ascii?Q?Xqa67V4Cgi4TMKiaUMMh5WRahIrG0tL5n/zXhxETMMfvC+UcFd9EMtyHPYNb?=
 =?us-ascii?Q?w0KjpSc6jgyaWXSCNoUpHRs/Xcn0b2H7BfWbadZuokv8ZsBf9l1qO2EHrNjX?=
 =?us-ascii?Q?k6qD+h3G6+vU20MhDDWFE4zE0M+H7i/n0UkMgwJpcICKN4ht+V6BsHelMtzA?=
 =?us-ascii?Q?AtnBhWK1jbf5/fFkGHkqBQBJMHICSNGQHWoJoCe/BYGJ4qpz7lNYDc97I5JD?=
 =?us-ascii?Q?6tsUEVh7MGy0W9ZTZMQuZhesYEJE+oUxsLndhDLYz3T9RPaLB9BOgHU4DDsr?=
 =?us-ascii?Q?ogPmiPQkUCJbGNHaWvq1NtxXC8Up0Af9fggWZXzuhD92samDEuLhoAHIc7sQ?=
 =?us-ascii?Q?KCvxZtBcY3BXOmbPTPVOnCaHtLCKxgpHHITS8zO6KPHq36GepTx+iw7yT8Or?=
 =?us-ascii?Q?UDb6ai5zNa/GZpQv/ZPVQaGY1QHBEzrzW5A16qIYXfI2r+uu/c7LppoVSraw?=
 =?us-ascii?Q?Mfk3/Y0m6oMWtiZoW1HTVKRKZMdXW2oNLYBd99WumSTcImXzMSkLs91Be7JG?=
 =?us-ascii?Q?1M04JNUzRHtnlLAkjmiTtwbowfMT1xG0vylephwrlNa7lxeuSrWtVkdO7Rl0?=
 =?us-ascii?Q?GGtYmN8IvojEtsz+U3cqphiXEEFfADmtpuRf59WIpMkug+F5vu/A4dt1gGXR?=
 =?us-ascii?Q?+8VCYdEOP9UhC8ZO339RpRqCVpK+hhpfSj0ZFcbRXhY5P02BcyWa3mW/pQUs?=
 =?us-ascii?Q?t2ED3PPsELYATpMsNK+5wUxGqGrZKMR+/CEDKGGWix2K8DN7vWI/AhH8Nquy?=
 =?us-ascii?Q?spCJZ0XjKEvPTBrGind+c2DK7fFOIPZEqnL47/wulUO2Az7OW3/awa7aIDpU?=
 =?us-ascii?Q?njJoVGm8gGN0wgfsOU+WoC4P2dj6oPqU1scTC+pypWjmBeGG0+phpXOp9WRC?=
 =?us-ascii?Q?y7o/Rr+3kAasyi2wB7f+bLVGtI7uI9a0iTnnwWdaVdJSOwiqFnlPJIRSjg7M?=
 =?us-ascii?Q?z30lvm+lGT52XQy/km575+pIaoNT+wVe4F/b3ZYZ70KfPlc7SqDsGqUfTDWw?=
 =?us-ascii?Q?xp2Q0OyRjIZ0c88QWSh2CQRqchQGLbEEFbty2loJ3kLhkx4uFv6gH6jbVy3J?=
 =?us-ascii?Q?/jkzHdZIVxAE3Ep3jsLp6p1yINlwYptenZD7PTxWff2m5mAP4DsPiD2k2G52?=
 =?us-ascii?Q?k+bfyD8Mutg3n3hwICpETjjqlWNW/IveVvdQappLS2U59Mv7DLRtBKTl4twE?=
 =?us-ascii?Q?hB41Rf/Yx9NIBT41bPcNEypcogpNhVztn18RjzoRgPS2fh6hAv0bVTJxxI+u?=
 =?us-ascii?Q?l2B+V/SAmAOPIj3T0ag=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yQddPw3vfnq0bz8pN8ifm4V0Pw9PdTyDD4JcVjiAQcd/T1CCu8SHuBTgfA8p?=
 =?us-ascii?Q?YNV7d9YBj4r/pJAxNRnEuY8YoylOKNvLQbqDXMcptmrfaEZsKEVulMidXBkF?=
 =?us-ascii?Q?EHs7XWRm56Kl0SFxW0opN1ZnbIVHrK8sVzlyvXjFD0xtbZ1XiViCbTrYGRuh?=
 =?us-ascii?Q?5jA5KJ4p6VIybmqDCSr43iOuKTfL2l4WRiLGSawPH0xNLKTcQ7xusNu11DZh?=
 =?us-ascii?Q?U1bb0hEyJM387fXpY4gX1eROXQF5Nmlt3dVbMF2GrJu0uSpjVcNIJOPXXTOY?=
 =?us-ascii?Q?BXHVurL8LnK2hIeAbms45s8BTcD7RIG/1CIJPLq727AdwpzagkLP47Jw8b8O?=
 =?us-ascii?Q?uuMDf87jHRkbocnnXtTYdDa7+MLZT34bOTVGTMHcOPLdfO6OIdGTg21/KWOb?=
 =?us-ascii?Q?fHCXxUpijvGGrwWzVfrjqy9Z1HaHv5ziebpMhFijfaQdGKMfA/5DiPJORWTv?=
 =?us-ascii?Q?+MdRQY5kO1BqWEzYQyFe1Bp16vcMiRGL3wb2Zp5an4+GOU4z7DcbDKF+6LoZ?=
 =?us-ascii?Q?ejNSE4nYQ0bbUbqWYKdTfznczQg6N59ruInp6niKTReo7mnPGGTNj/D8lcte?=
 =?us-ascii?Q?q0yVcWbrTZmZ4C8FjInkgfNjrKne+ZXstT4mos7Pz1bwqx8hN+cpGKZeXUtz?=
 =?us-ascii?Q?XT/YFQqVyUldytN8Re0H4R3OHDCkxeGsvCfLbGd+3mOaUzkefp7siyx9Gfau?=
 =?us-ascii?Q?AKCWNa9+uTvE2Hfsf7EBVlo/BLzDgWWCe1W71NRk7ddh9CezVISLkmYdixUb?=
 =?us-ascii?Q?dw//RN8SJVK3TZ8MXPS37JbSfU5wVi4fe/G2R0NzlqUHw2jfRYsdIfTKL1Cl?=
 =?us-ascii?Q?Ce2EoUcfzKRSDoW1oqMEN02Qf3JiDV8YIT3WvIln7arFHTyYYA307l2cW74+?=
 =?us-ascii?Q?5h6b4lyib4QLndbeaZNIACJbMMOHrqiN8as2EXQy5xUcQEgEs9vuN7xaD6I9?=
 =?us-ascii?Q?VRrLBs2hbiAa32RF0Fqv/w8rFhYvVRwy5p1nL1vJZzKjJymjL7S1er1zc4OQ?=
 =?us-ascii?Q?+bpNORGEIWbEDbMP7GYxxIssOx16kXCul2VrY7a/f4Q9W5HU7vqOmliOFYYV?=
 =?us-ascii?Q?Wl3p831JEfRSMznJ/gsxQpCvlRmqNm6jpd+F3tAo0dGcRiv1oWIZVm9i2+oZ?=
 =?us-ascii?Q?Z/O56BGPkkthxqWG6kgrySSuMS7d2L9TA+R9fhfGOV4sKcNMRWq6FbaT9puk?=
 =?us-ascii?Q?P480K3q2KuuHg26fj0jXHhh0jnPu1rXXTdhiLUN3jpgVPs1bXINEdScqFI/+?=
 =?us-ascii?Q?v74fFNNSxf8bdc+QRU5IK0+wZpKSyN40c50xUmlrt5ceoGfIpA1KAHvAaPWo?=
 =?us-ascii?Q?DoJKB+LbnvXSSB6oq3gJeft42axDC0hWkRkppghgIjvJQLQvRnRFD0TD2D3E?=
 =?us-ascii?Q?qZxfdWugD748WFWOI3aFkxUdQkvjAkZ7stvSIWx6VgVmDb0GGjEd/N96KSVG?=
 =?us-ascii?Q?BQN4YQx+6cmuz0vav9qPRIKgqzcpCS0fSY7d3ltAvztbdwP+7wpqWN6q5+rl?=
 =?us-ascii?Q?3gIXcM8QlOKqMkB61g38KCdrp0NBt1PJyi2ZPf34hbsY9YOkb0b1ci6HdO2L?=
 =?us-ascii?Q?+E5LfXU1RljLxjR1bhT91HZnYUlqZP1vAKfjlkqbe0IhLSvwCLkJxu9dmoOy?=
 =?us-ascii?Q?7FtnEj/17AEH051XR1aWMBDn2SxzOW3WGIxo6fD4zuS3dCdVyDC+j9b7vAm0?=
 =?us-ascii?Q?msdcaks9WlSVcXCFUNTJh2YwKQN+jqqnIxZX8+HWoN+4UKT40VdhGjOUQpiA?=
 =?us-ascii?Q?Wc6GyMVXRIZqt1iB5bs89wT5YZdSfsM=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6437c9ff-87bd-4788-f272-08de5dde5c59
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 19:57:54.9275 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PlciOyOk2hbqrqJdWg23GYTHFYulkMW7J1P6S5tusXPUi+l7MkdGHx2z8pZY7/EWul3kIzBUcFFImFFTu2YuAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7280
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

On Tue, Jan 27, 2026 at 08:37:26PM +0100, Michal Wajdeczko wrote:
> During VF FLR the scratch registers could be cleared both by the
> GuC and by the PF driver. Allow to retry more times once we find
> out that the HXG header was cleared and wait at least 256ms before
> resending the same message again to the GuC.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
> v2: rebased
> ---
>  drivers/gpu/drm/xe/xe_guc.c | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 231844bce1e0..70ce1d7aec21 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -1389,6 +1389,9 @@ int xe_guc_auth_huc(struct xe_guc *guc, u32 rsa_addr)
>  	return xe_guc_ct_send_block(&guc->ct, action, ARRAY_SIZE(action));
>  }
>  
> +#define MAX_RETRIES_ON_FLR	2
> +#define MIN_SLEEP_MS_ON_FLR	256
> +
>  int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
>  			  u32 len, u32 *response_buf)
>  {
> @@ -1399,7 +1402,7 @@ int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
>  		MED_VF_SW_FLAG(0) : VF_SW_FLAG(0);
>  	const u32 LAST_INDEX = VF_SW_FLAG_COUNT - 1;
>  	unsigned int sleep_period_ms = 1;
> -	bool lost = false;
> +	unsigned int lost = 0;
>  	u32 header;
>  	int ret;
>  	int i;
> @@ -1435,9 +1438,14 @@ int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
>  			     50000, &header, false);
>  	if (ret) {
>  		/* scratch registers might be cleared during FLR, try once more */
> -		if (!header && !lost) {
> +		if (!header) {
> +			if (++lost > MAX_RETRIES_ON_FLR) {
> +				xe_gt_err(gt, "GuC mmio request %#x: lost, too many retries %u\n",
> +					  request[0], lost);
> +				return -ENOLINK;
> +			}
>  			xe_gt_dbg(gt, "GuC mmio request %#x: lost, trying again\n", request[0]);
> -			lost = true;
> +			xe_sleep_relaxed_ms(MIN_SLEEP_MS_ON_FLR);
>  			goto retry;
>  		}
>  timeout:
> -- 
> 2.47.1
> 
