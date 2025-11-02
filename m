Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81F72CCF9E3
	for <intel-xe@archiver.kernel.org>; Sun,  2 Nov 2025 18:29:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EDC110E002;
	Sun,  2 Nov 2025 18:29:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V7rFBstD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDFF510E002
 for <intel-xe@lists.freedesktop.org>; Sun,  2 Nov 2025 18:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762108179; x=1793644179;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=c03eOVU2PECWjgHZrG7xV8HFCnySO6O158x/wyaYr0o=;
 b=V7rFBstDk/dB7m1uFH7KFGv62JTOVgBSxZuwi8nJMW7gXWyRuRaRyWAg
 bDNQkPBfe23JAhuhrWNV+ccL0A/Qo2luzLQL1TOdYhFoRF9wxBBZ9BsxE
 eZ/e/b8JYZnIRzxivrtvg0mRUBhUNI3l3SahEVQOZxjiTrd33xGN7VXH9
 EpYmVhp6BOMCrzywLxWhxkjqBtfJahInH9rwRfmXJIk6XeO7uDpgiiLim
 EUKoXsbmySw21R9qc6V+GIKgAmJKwEB/P3LEPSF37oOuhNRr9XH/C9mmV
 v/cMxyG7DawOM+7qfHLexu5z0yiuxBxeBBMXyJE0mpXc+HlTUsOyy7/Al w==;
X-CSE-ConnectionGUID: 00sQk+IsRUyMtiejFci4tQ==
X-CSE-MsgGUID: Xz382qTySau9ctrGKg+kTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11601"; a="66809884"
X-IronPort-AV: E=Sophos;i="6.19,274,1754982000"; d="scan'208";a="66809884"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2025 10:29:38 -0800
X-CSE-ConnectionGUID: 3/w2b2ZXSRCIqyjsrcgSjw==
X-CSE-MsgGUID: lrLPy5mwRjOpBtDqCWI68g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,274,1754982000"; d="scan'208";a="186567101"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2025 10:29:39 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sun, 2 Nov 2025 10:29:38 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Sun, 2 Nov 2025 10:29:38 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.3) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sun, 2 Nov 2025 10:29:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CtRrh0ngxjXGolkFudv4N8zkt7/k8SN3zAGPGdLMZOnHpUOvFNyo3RaJiuv+4AuUOc7NMeuMjQewidus7AN09fSLLNSy/3yt0sM2nv0ZJTMAqkvS3swc3tdKaki1ahjyHKbYALtTa+QwD/3WOgjBJtlz0SITOVuPwbhVbBfXp+Xx3rM26APItObP+Sw8x86an+wrokKjGzdb3W2k7Vdpz0xVsbmxBzTiepIJjuiREWLWWPYCBhJ5GbRa0kI2+isjpm3RQ6pPQ7uEMJsCj39eIA2i5mLath6vsCVc+6HvMAQxoqFvJEVOQxBkc3XweaaSpFEBxKqzC/X6uPzgQfVzDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Irb7OiRUwtrE+ZGfge7DvL7kUes3vK6DVw8LQlhqQSc=;
 b=XQlBv/g3SeXHJlhld4rt+HeCs25UWOcCZxXskwEjdtYvUQLpOB724Rl8QMeea13HETbSVMmSYq0U5/ESprTwJbn4yiprpsiwV4IsU7rwChQN6MgCD5sgZSUZzY5IfqiaKV4kXTrKNWXdXYFG+nSupIKxmU2KNtbuZdKQ546OSIbwAe+xYUA6K3KPhFvwdtFYLOjkjiWPL5COoDyN9bYjZfZeNxDWcrn+Rh2hwGFNzmUy3mrE4ShAffYXtdw35FRP7djCi/w01V3ZBqpVwrzcRIfkj51KSP9o4DTZkoQ+OdCp1wuGLYBI+UZCy68nmMnCUIEZ4IOASy2zZQG5Tvuc4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by PH0PR11MB5061.namprd11.prod.outlook.com (2603:10b6:510:3c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Sun, 2 Nov
 2025 18:29:35 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5%5]) with mapi id 15.20.9275.011; Sun, 2 Nov 2025
 18:29:35 +0000
Date: Sun, 2 Nov 2025 10:29:32 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 11/16] drm/xe/multi_queue: Handle CGP context error
Message-ID: <aQejDCgeUTRRIsTD@lstrano-desk.jf.intel.com>
References: <20251031182936.1882062-1-niranjana.vishwanathapura@intel.com>
 <20251031182936.1882062-12-niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251031182936.1882062-12-niranjana.vishwanathapura@intel.com>
X-ClientProxiedBy: BYAPR06CA0026.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::39) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|PH0PR11MB5061:EE_
X-MS-Office365-Filtering-Correlation-Id: 1448ce47-f3f8-4110-995a-08de1a3dc639
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?U4yBAH7FM75eWH9OmWQhnm01VLPLmSqIKsW4tthJtnFJ5TDi8nFxutCqPZ5k?=
 =?us-ascii?Q?JQs0sxG0nG7/mlwiLJg8V7Xkhnn/5CfexfiKuJDE5V9FnBYuCu7NwjwraJpM?=
 =?us-ascii?Q?DROOlMfOYY4n2yY1V9xjDq0LwJtKUzaC0/FaQkxKTkLMwlp6v4Xz2Cl7OGL/?=
 =?us-ascii?Q?WFWSKuVRH3W3NqZy1Lmz5xcLj7OhimybCrjMj1VG3yuR+vH44IC2VPOZh5rA?=
 =?us-ascii?Q?1KzufmGWC04wEw6xWwpU30XukW1T0DCKbSofbqqw/gjXnPrFZNvf1RMT6iKV?=
 =?us-ascii?Q?HZZlFdT7/OMsQcx1i8bXeuutl79uF59+Q7A8bngrdsq1sJMRr9A3Yk+rHEQC?=
 =?us-ascii?Q?C+SU+lW0LWORuD/evzEOfHSDricnbmyyK0WVg/E2JULSGUcgrRKFpfi5AKuM?=
 =?us-ascii?Q?y3B9vjMrTZ3gMWFlAe3xirdZZCmO10ft1hZd+3dvI5LjACw1CM1eb/ZtER/6?=
 =?us-ascii?Q?ugDnmWe20VchGh4suFm/doW5gmqcvO5czPWsjBocERTJqfspqYWOx2qM+Yzl?=
 =?us-ascii?Q?7djLUjcartQkjgcVvp/G/2TFcWd6qqXi880uIyUQpSvrDB2W2lzWBo8KS3Vu?=
 =?us-ascii?Q?IN6vy5de5Qw/SzIAdfYK1ggPwunXjIrO9PGMlh1lBtXjK8XJAFsTX6RtXUbb?=
 =?us-ascii?Q?/DtICIYG8mJNOGxvhy78ZyPXBRxyl1Xo+JjxHcplr9BdTE2WQ82v24F5MB0a?=
 =?us-ascii?Q?/N5ZRGJAQRCvAeUKTzz97yhNTOXqLn6aWDZTYHLPQp2p2g59LeyklXFhui6j?=
 =?us-ascii?Q?vyS3n4NArZjWKJ4DUFSsemeUZsNfGpZljvtn5/58GZXcqLEhl/S08JRHTipQ?=
 =?us-ascii?Q?BGfCnlCbEc6+cSrFXlZhEYS0uz0NVahTZNsA14WENUGQi8kUTQPUMY1Df6AH?=
 =?us-ascii?Q?kU8VRGRwWlz+l8gb0HY01xV9Q5Zr8EbHSczU/Ku5xVWu5hh50VhC2YiBA10D?=
 =?us-ascii?Q?/Uk1Z1sDI44nJ9gt5JkIsqw+VYLkJ9DzRW/serOihu2Bo94TmEqUqwB6AW4s?=
 =?us-ascii?Q?wb+UBYOj0NNO+vHVOBKi1ahgBaVsOEncy8Fa/Bl+Kb6L+6BXGLwKdrbHeE3B?=
 =?us-ascii?Q?zBXUQBlxr3k3dRIgi+cdCziJx19VPZ1vBqVaSGXJlZ/cDPwmOm/bMaTvPKvG?=
 =?us-ascii?Q?wJuULafATpWqomHrsL34kZIyualGC+JmnNMbdRILSDKcDqTz0u8YfOfEmUYw?=
 =?us-ascii?Q?g51AxJgRNuLfd/lv2/DIIhs9l9rhAogi99mLXTnRFaqfft19D52xpwE8B2rQ?=
 =?us-ascii?Q?CbZS7n1mkqP2royWctMjKn83ZzGPMI1eDNhBwVEC33t3C4WNk+lD2RxWEQwH?=
 =?us-ascii?Q?fXpLqOD1+cSwyjS7dvqDmmsROp28AYnlXnXSboKaLppBAopfb2Z6AsO73bK4?=
 =?us-ascii?Q?NZzqOZSeQjdr1TEb7ZK4pxU0b9uzjkSUHUKNZe/hwagksEfkqJXmcl2xvrkA?=
 =?us-ascii?Q?f+LdOaDX4+TWC0iSX9mi4h3rHBRmusCq?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FV28b0DAT1/FCmA73JO09CmLAzMJ45iDDwgqItE9sT9vZGyen0bvix+u3RIp?=
 =?us-ascii?Q?aOaMsSpznmqRIFeqcHloG9ONosJacSrGr0WRWc7DO2SycPA8QkJ9sVRjkwt8?=
 =?us-ascii?Q?XcnZdGx335idGQbhSTadBr5xDgEPebmaK16rxsN3GP2M8jc+cHdLyijgJvTP?=
 =?us-ascii?Q?rBUCTlMkX63eaQfEPMbdgI9gbuHlXYZcBG0YQ+qn8Z8NECS7hxF7jvP/D6lM?=
 =?us-ascii?Q?6s7wbgG6GVgDSJTTWVSUgkg71d3jKvrnmiNdAHzyMs+ehaDjA4zzJfvBXcx8?=
 =?us-ascii?Q?92CcyutHl2p18ZUBzmThyE7E0gfLMGGTNkX/SkAdL4wqCkDfMNfyhu7EUP1j?=
 =?us-ascii?Q?wDwHifMAQmADRmHCfCjEUK7u1xz5dzen+qdwSy12CDTZvpOOEnpJBgA2h0+t?=
 =?us-ascii?Q?KuAFJgDXS6yY1dTyIB0G8e9kPzepcD661eAbS026Pm2//K5Mls0oTRULxroF?=
 =?us-ascii?Q?Qt/QOUhoOuRBY+0YwA2lob4DQig0mCCmYoXNLf/Z0V6n7/uumPWMaERJA14p?=
 =?us-ascii?Q?5ZRwIbyk3qfy6PVLZxIMGZFZ4I6YSkRXzGHqmFsjepl6SDN49kSMAoj2nvf6?=
 =?us-ascii?Q?FPLqg5PZ+031MOCYX87UIshv1dl+tCGnoEZEVlYeuSqp1To1yaYpV6/dAYs9?=
 =?us-ascii?Q?CUEI6GQHxcHZzyQLZo8uGY3C+lR1tNd2mljq7nNOy40/f1yR0mfL9jVORTX5?=
 =?us-ascii?Q?Ffxz0vJRqB/zkDs/tyvZf7Ps4XZE6DaNwg7qTJv6es32V3ywUzT9mtgmtY5m?=
 =?us-ascii?Q?6LxGksQkwDz6Ekxy4uGOL2fTfJOV/uC2mBKdrRKnvHEf4NgjCT4flGWMsCwF?=
 =?us-ascii?Q?mx0Lt+Xkw1NlNUqdJlSpO2QxED69q+CdbZnN5+cnQ5vgzoB3KhlZlGPbCzX4?=
 =?us-ascii?Q?GgTzoHT8Jk2uIFefi9yWlLC2OtW4gj6EVWuCXIYIYWM5Svyf5drhuvGrqLDt?=
 =?us-ascii?Q?fWwiVEY8MeYGCLiOHx9EZ+WtVQPSR2TQK4W1G+u8jWdrxEQZeyPQxzV0eJ/A?=
 =?us-ascii?Q?OYMK+3b0bba6p6xuPsrRsK8heD66+j0ihA3tZVtRov2mDeXRwjRPsy9ZgInI?=
 =?us-ascii?Q?UWsHdlG9BmYBSFgmVMj47FJpEKXcG2uItICSmJSv8oo7WUkuOyeZHUnXOmNr?=
 =?us-ascii?Q?p7vbJXfeorrzdpGsPSNdL0KK+FydO7OR0bCJR2Df1wfpIPZrNPB0P1LE+vI9?=
 =?us-ascii?Q?vVFmcFj6gHdecbsu+XF8yC4Kwq3UFlKyT3szs2HA+rnYkYkaVIMOfoDdIbLg?=
 =?us-ascii?Q?RokavTH2D36u0SRzaxOFCeuhXOVUttQoy1vgsbyJuZf4cb6rvKtJr/IFx8xd?=
 =?us-ascii?Q?ZT1ZwgKFM5Xul+Z/ikFsLE1UG/wWGwnuSO3/VS3Tz4SqOaMe9gvzLLu6cy1i?=
 =?us-ascii?Q?N9qzGujd0PsvyjS/r0MKavUg7xYidxWRWds0b/mS0CKN8b8oeY6yUDJ8BGWC?=
 =?us-ascii?Q?/cJTKG4xMHQo9Ce3aE9LSSJoY4GuwWIW9MllpmCPN3150hSS8mKYrDfvXTxS?=
 =?us-ascii?Q?u4RR96HgcTk2cit+VJOe/zYW3tGEXI/OblgIyC0bZsPDHoKHyt0HLPmrAsWe?=
 =?us-ascii?Q?r0nWKH8y2OA2Q0F2bU7Z/BVub5YwimY/19BEMQHbIe8Nurq7CbVJFJ6YhSMF?=
 =?us-ascii?Q?Bw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1448ce47-f3f8-4110-995a-08de1a3dc639
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2025 18:29:35.5616 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TD+nNT5loHlgkIJuwzDtikQkl7U51jRiVexhHzhwDFUJ5+VTEPd7dkDNJs5Dd/A5braTpqJbTSo2Ap32ueJF4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5061
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

On Fri, Oct 31, 2025 at 11:29:31AM -0700, Niranjana Vishwanathapura wrote:
> Trigger multi-queue context cleanup upon CGP context error
> notification from GuC.
> 
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> ---
>  drivers/gpu/drm/xe/abi/guc_actions_abi.h |  1 +
>  drivers/gpu/drm/xe/xe_guc_ct.c           |  4 +++
>  drivers/gpu/drm/xe/xe_guc_submit.c       | 33 ++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_guc_submit.h       |  2 ++
>  drivers/gpu/drm/xe/xe_trace.h            |  5 ++++
>  5 files changed, 45 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/abi/guc_actions_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
> index 3e9fbed9cda6..8af3691626bf 100644
> --- a/drivers/gpu/drm/xe/abi/guc_actions_abi.h
> +++ b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
> @@ -142,6 +142,7 @@ enum xe_guc_action {
>  	XE_GUC_ACTION_REGISTER_CONTEXT_MULTI_QUEUE = 0x4602,
>  	XE_GUC_ACTION_MULTI_QUEUE_CONTEXT_CGP_SYNC = 0x4603,
>  	XE_GUC_ACTION_NOTIFY_MULTI_QUEUE_CONTEXT_CGP_SYNC_DONE = 0x4604,
> +	XE_GUC_ACTION_NOTIFY_MULTI_QUEUE_CGP_CONTEXT_ERROR = 0x4605,
>  	XE_GUC_ACTION_CLIENT_SOFT_RESET = 0x5507,
>  	XE_GUC_ACTION_SET_ENG_UTIL_BUFF = 0x550A,
>  	XE_GUC_ACTION_SET_DEVICE_ENGINE_ACTIVITY_BUFFER = 0x550C,
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index 48b5006eb080..d0e19af0b4d2 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -1574,6 +1574,10 @@ static int process_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
>  	case XE_GUC_ACTION_NOTIFY_MULTI_QUEUE_CONTEXT_CGP_SYNC_DONE:
>  		ret = xe_guc_exec_queue_cgp_sync_done_handler(guc, payload, adj_len);
>  		break;
> +	case XE_GUC_ACTION_NOTIFY_MULTI_QUEUE_CGP_CONTEXT_ERROR:
> +		ret = xe_guc_exec_queue_cgp_context_error_handler(guc, payload,
> +								  adj_len);
> +		break;
>  	default:
>  		xe_gt_err(gt, "unexpected G2H action 0x%04x\n", action);
>  	}
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 87c13feb2cef..605352145d76 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -48,6 +48,8 @@
>  #include "xe_vm.h"
>  #include "xe_bo.h"
>  
> +#define XE_GUC_EXEC_QUEUE_CGP_CONTEXT_ERROR_LEN		6
> +
>  static struct xe_guc *
>  exec_queue_to_guc(struct xe_exec_queue *q)
>  {
> @@ -3001,6 +3003,37 @@ int xe_guc_exec_queue_reset_failure_handler(struct xe_guc *guc, u32 *msg, u32 le
>  	return 0;
>  }
>  
> +int xe_guc_exec_queue_cgp_context_error_handler(struct xe_guc *guc, u32 *msg,
> +						u32 len)
> +{
> +	struct xe_gt *gt = guc_to_gt(guc);
> +	struct xe_device *xe = guc_to_xe(guc);
> +	struct xe_exec_queue *q;
> +	u32 guc_id = msg[2];
> +
> +	if (unlikely(len != XE_GUC_EXEC_QUEUE_CGP_CONTEXT_ERROR_LEN)) {
> +		drm_err(&xe->drm, "Invalid length %u", len);
> +		return -EPROTO;
> +	}
> +
> +	q = g2h_exec_queue_lookup(guc, guc_id);
> +	if (unlikely(!q))
> +		return -EPROTO;
> +
> +	xe_gt_dbg(gt,
> +		  "CGP context error: region=%s err=0x%x, context=0x%x LRCA=0x%x:0x%x SgId=0x%x",
> +		  msg[0] & 1 ? "uc" : "kmd", msg[1], msg[2], msg[4], msg[3], msg[5]);
> +
> +	trace_xe_exec_queue_cgp_context_error(q);
> +
> +	/* Treat the same as engine reset */
> +	set_exec_queue_reset(q);
> +	if (!exec_queue_banned(q) && !exec_queue_check_timeout(q))

I don't think you need the exec_queue_check_timeout check.

Otherwise LGTM.

Matt

> +		xe_guc_exec_queue_trigger_cleanup(q);
> +
> +	return 0;
> +}
> +
>  /**
>   * xe_guc_exec_queue_cgp_sync_done_handler - CGP synchronization done handler
>   * @guc: guc
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h b/drivers/gpu/drm/xe/xe_guc_submit.h
> index abfa94bce391..01b013a90b1b 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.h
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.h
> @@ -35,6 +35,8 @@ int xe_guc_exec_queue_memory_cat_error_handler(struct xe_guc *guc, u32 *msg,
>  int xe_guc_exec_queue_reset_failure_handler(struct xe_guc *guc, u32 *msg, u32 len);
>  int xe_guc_error_capture_handler(struct xe_guc *guc, u32 *msg, u32 len);
>  int xe_guc_exec_queue_cgp_sync_done_handler(struct xe_guc *guc, u32 *msg, u32 len);
> +int xe_guc_exec_queue_cgp_context_error_handler(struct xe_guc *guc, u32 *msg,
> +						u32 len);
>  
>  struct xe_guc_submit_exec_queue_snapshot *
>  xe_guc_exec_queue_snapshot_capture(struct xe_exec_queue *q);
> diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
> index 79a97b086cb2..c9d0748dae9d 100644
> --- a/drivers/gpu/drm/xe/xe_trace.h
> +++ b/drivers/gpu/drm/xe/xe_trace.h
> @@ -172,6 +172,11 @@ DEFINE_EVENT(xe_exec_queue, xe_exec_queue_memory_cat_error,
>  	     TP_ARGS(q)
>  );
>  
> +DEFINE_EVENT(xe_exec_queue, xe_exec_queue_cgp_context_error,
> +	     TP_PROTO(struct xe_exec_queue *q),
> +	     TP_ARGS(q)
> +);
> +
>  DEFINE_EVENT(xe_exec_queue, xe_exec_queue_stop,
>  	     TP_PROTO(struct xe_exec_queue *q),
>  	     TP_ARGS(q)
> -- 
> 2.43.0
> 
