Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C57CCDE00B
	for <intel-xe@archiver.kernel.org>; Thu, 25 Jun 2026 23:16:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7D1C10E2B4;
	Thu, 25 Jun 2026 23:16:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bEdseiW6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 503FC10E2B4
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Jun 2026 23:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782429400; x=1813965400;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=oQRMm0na5v+9MKC0AOyCRQuapgK442N8LpC4SoHh3dg=;
 b=bEdseiW6BBGCa7c5thYx5ou056KHl1bBzlX7aEl4gKvWDhFR33k8RB+p
 mLGIH/HEO1wFp0Ov4dB78TLF5CSZo8jzp7nQsSfEaj//XArNJ8lD0wQed
 KRsORrixNEz2EwQT4puLJ3Hth1KAf0lOpStHSXiKw1ZclOja5qPNjb5XP
 l4XNR0yBm4pLKgDilaTthFtjuVyCnDLn7EJBcvZeriH5MPV4erPRXlUoM
 WTDr0JdElUlzxxKvMAv+PPeRL6458UlAylFrP8H3XnnNC7SD9yIvv1pqF
 vUBMch8X6sqwhwb9nNi+dOduIPGpCJbA+s9t1D04q8BelAXSnLS6RYX8U w==;
X-CSE-ConnectionGUID: n25viZ3aT/CdMgM6cPvlfw==
X-CSE-MsgGUID: x/NWyjbAQPaEsgVFsAfgsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11828"; a="93877684"
X-IronPort-AV: E=Sophos;i="6.24,225,1774335600"; d="scan'208";a="93877684"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2026 16:16:40 -0700
X-CSE-ConnectionGUID: t1aq0AFkQ2OrWBxGmGt3Sw==
X-CSE-MsgGUID: n+cfp1pnSI6aoih7u6yyog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,225,1774335600"; d="scan'208";a="246692717"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2026 16:16:40 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 25 Jun 2026 16:16:39 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 25 Jun 2026 16:16:39 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.7) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 25 Jun 2026 16:16:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bxVM3xpJgt77jXQa37Iyy3ctGxzdqS6x/M1t2RfwWdO7F+M2OcIAv6BE/IVReOtAC3KgCoSYJtLX97cpEQ0780cID/DLaDbBGe/Dvkv9QIavT6KxPqnqOPV4yoiWlE+THl+TcONrwp/WREEtoAFkje/dmomyu8BxylfTfnERWhG+UB5T36DIiqD6y2Tm65tk4/0T//XvSbtmh9BWHy8/h6Qxm83DueM+VL0xaGYpMSLPFm2CyYpTC3/iJkVLb3wEc7ARKNxuU+0lNubH24KbIG6WggbW6w6l4YaoVUgwhICX4jG3LQhpcT56vbakgPA7lzLeO/eJLgTrV7HjetkBxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3LnJZ9Fzl9FWo02KQQDX8C+oa+K1a6oYXm9tS5LZqyw=;
 b=kDEnYJagQ/4mOSa8/CmqNz4AOSGuByrYgI5DD8+O3+CQA74eixh6+61tluvQ4GXRCLoNA86VN7c/OjKvhwaD6GEhvlSw88JVZhr3eAgA16lmv5FAIgv561K7YSFvcv/fTyUqVXbMR5CbVfQlmMjOja4Qtrc72Xs5K7vlK45FvjQRgdKk2n3QQPiqRlf0/+efMm6rG8oQloqMY+FYOf5JxUAARFP6llq86YCMFkFHcPTFd3MN50QpDQXeHEJDcOYRdoOeIReSBwq4SgIgsTaixRT5icmOFGZtWU0JXuGN6F/TGr5Wg2SyxBuygOj6Hh5RL+2tuPEvGwCrM50/mQruQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by DS4PPF267298081.namprd11.prod.outlook.com (2603:10b6:f:fc02::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.17; Thu, 25 Jun
 2026 23:16:36 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057%3]) with mapi id 15.21.0159.016; Thu, 25 Jun 2026
 23:16:36 +0000
Date: Thu, 25 Jun 2026 16:16:33 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 3/4] drm/xe/oa: Provide OA status through status ioctl
 for mmap interface
Message-ID: <aj220bc19LXLlsP1@soc-5CG1426VCC.clients.intel.com>
References: <20260617015422.226177-1-ashutosh.dixit@intel.com>
 <20260617015422.226177-4-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20260617015422.226177-4-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR03CA0347.namprd03.prod.outlook.com
 (2603:10b6:303:dc::22) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|DS4PPF267298081:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f158986-ef44-4d6f-a16e-08ded30fcd88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|366016|376014|18002099003|22082099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: UwpuhGDeW2ccT0fbs3vXuI6BXcCAl8ZUnFlur20yeQl6gbGKfxU+ZdaDkaCEUfG+icMUKIeEgmJ6+PHyETLWHslLL+C4jFGbldsasMjjl3JQVjq/3F0OY3Nkv0GVNCbKwpIY1J7wQc1Kh8zqqmt2xQ7vVrrscW49jbHQnjBGKcUbsMyY1zhGjnMHf+KnvRYDCxqXljOj9TMZuSnT5K1ZLWXFgXdm0e27snMq4TbUk6WWWe6hgfwP5D1YTazWONqIjDzAUt/AN+ifJDWh/ii4+LABPOs9IsO3q0QXkCq7UEXLEN8B+ggYvoGoQi0VjPLpqFOSna7NXWoVqgEfy7XuopRrSQpUc/Mf+dYN9BRVmjIc7HHXq3h9/YEwRiJi9RISbTcGcQ7Bns7ENLHJqyyPu4ddn8oaWKvUY7phW3XtSU8XTkjwYVSo9ctl/cNgiiGsbhl0LQK3SQwPwtwKXAMtpZ1GSkp1gZ898Z1SWl56bcb0K2JuXEGcnHDPCvlz99b3aIX1NmQDrMxsovWbiXsVFFVRsPiw7EzJ9OzrROE0BYn/6vmNJGlnay4F5qPJpsKrnRTu+cixFp2QtNpgrWf1hCR4EOye/Rsnzbd87ghgmLmTbyhhAYTbLVD6PkOLM8152kIsNm2kbS1/UVGXoA5NXOA8npvCp7PTb1sZJIc2q0Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(18002099003)(22082099003)(4143699003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T0VybFhqOXFOLy9RcUN1bXV1UlVTV0FxNjJvREt5Z0ZFeFhWeHM4YTFHQ1pH?=
 =?utf-8?B?VEh0a1RTYUxIbnYzUExjSExQd0ViWlhnME1PRnBjNkZWZlNpSVgyVWFGRWtG?=
 =?utf-8?B?QU9MVkZVeGFZd2pTem9vWFhrcHBFNzY2Y0hHMG5FcHVheDlpejVXbzZmd0J1?=
 =?utf-8?B?YUxwZGlKczlOK3crQ0NXTElJWGczMFFyOTFkK1N2cnJLU1RhUjQ0ZjRXRVJR?=
 =?utf-8?B?YU1LcytOdCsvM1dZNmM2TEtkTVBaanFqN1BYTlFLbytpTGNFQVpPbjFPU1dM?=
 =?utf-8?B?Q3NqbEdJT1EyR1RlZGcwZWhRQzVCR2Y3d0liRXBmTU5iNjRaUjVkMXRGTnRB?=
 =?utf-8?B?c2hDOVlQa2JmazVRc2NDL3dOcWU5TnR0Z0FXS3d5M3RaNFpPRGJLTHJhc1dp?=
 =?utf-8?B?UmkyaHUxZWhzMEU5c2xoWFZhMDhFbnJLaGhiUXp0UFlaeTd0ZUcyZms3UW03?=
 =?utf-8?B?d0Q2V3pWeWJuSnJqdmJsSDIwdDhoeGNsVGJDL1N4enRnOWQ0MGNKR1JZa04x?=
 =?utf-8?B?SWFzOUtia1JGc0FoQlltNEN2ZzA4WTJadTRCak05R0s4UEdHYlc2L2trQmhY?=
 =?utf-8?B?M1RKaEErcUdvMk1pV0tualVqd1ZFVGVLYmwzZFBhYmpZbVRFSzlVQkMxbnhp?=
 =?utf-8?B?MkdRR01raklUOUlFMzAvYVJUWUhwZWZQQWIwTmNDaWlOUE56UlNnUU8rRytR?=
 =?utf-8?B?VnVEcUNIM251K1FuWkkvYTZoNDB5Rk1iU2FBYWhZcjRZV0o2ZWZqUVlBQjUv?=
 =?utf-8?B?RVNic0V3YVpxMUtYTjV1cDQvak55UUIrclVKcUlqQTdWWlRZWHVFZGVSMGVP?=
 =?utf-8?B?NDZlZ3BJTXlHOENuNk0rMHFJVGd4UElnMThpcDFZWVRtRzB0MHZWak5qZVBq?=
 =?utf-8?B?U0Uxc3pldnNOSkVYd0lTS2F5Z2JTQjRFWXdBNU9NMnVET2NpWlZETWNHNTBt?=
 =?utf-8?B?R01JNjA0NHVOcmZxYTdyVmJwL3UvNFNxYjVsUiszZFFkclYycXhWeHJSdDBM?=
 =?utf-8?B?VS9YTGYvakc2S29mZHVveU93WXpLS29XSVRpaVZLSUd1SUJRcUhXSmd2REM0?=
 =?utf-8?B?WVJsVENMVWhvNGxYRW1NaVFhdVE4MnVZMWVDc2hJSmxiMjQvQldTRFF4dk9J?=
 =?utf-8?B?RjRMZkYrNDQxeVh4NFB3bk1ndWUvQ1puRS8xQURiVm5sQk9lYWZ1aDBqVGhV?=
 =?utf-8?B?dkJPTlQ4M0REMjZITTcvZGhKSW9DRDlnS0hwZVdyV0g2RHpTWDdPb01WSWdJ?=
 =?utf-8?B?Y0M0ZlZIV04yc0E1WEhZKzdEaFBjTnk4eWR4Y3pMcWs4aVVieVlKZE4zTzV3?=
 =?utf-8?B?T2MwY3JETmtzbThhRGZ0azNDTXdEZS93cHJEamYvYnBHWVlXd3M1NWlDY09I?=
 =?utf-8?B?MXpublVmV0dzN0J1THJrY2IxYkk5YTBYUkFFWHZyTFE1aXFCYXZIaFNBVFhy?=
 =?utf-8?B?QnhrZW8zV21mdXVQQWNBWjBrQkFzUHhYU3BtL0ovdEJudTZoQTNmeEkreW1u?=
 =?utf-8?B?WC94VlFkQWt5VFlrY1M3Q2JxakhDckVoYzI0RVF3U1g5TlFtU1BUNEdSR045?=
 =?utf-8?B?TnpobmEvRmRnWEkyTkZRZG1aWkNReWR2bVNXbmU1VDVaY2ZPUXozR015VVIy?=
 =?utf-8?B?Nm0vT3NzbzB0RW0zb3Q4WVF6RmdiUUV1aWkrdjIxQkhnQUNuWlpPSHdadEpB?=
 =?utf-8?B?bng3VFN2dUhiamxJZlZ4M3JTMDllTzJWcXVPTTJqbCtlN245M3FTYS9BY0FM?=
 =?utf-8?B?OUhSTjFhd0J2eVdCRXh2eHFTVXgvNjgzOERXTzV6bVBRLzNhSGlSaldpbms4?=
 =?utf-8?B?OTJvNy8rN2FqSElpaDdiTHZyMWxaR3dTaWVlQW05OE8yQU9aNDFFSmx0b25s?=
 =?utf-8?B?eTVTUVJoQlZIY01qZEFnYmpDcWVTbnFYVWplNmJMM1NnZzk4SDA2YnJDSS9w?=
 =?utf-8?B?clRTbzYzdVhLSXRBVkxhQ25VR0crQmZ4YUpXWE5KTk1wTzB2SkF2SnZvLzVs?=
 =?utf-8?B?WURSUTFVVno1RlZQYS9xeVlmOXdOMGJZMEJZMUJMQXFqQjNJMkRET0tXZmdS?=
 =?utf-8?B?VHFNT1Q0UCtxd3NBNWpvUnhqWm5zZGl1RzA5eXE4VnNsendUNjhqTFV1REhC?=
 =?utf-8?B?MDFDR2p6NmZPWjNpVDlaTFNvRDdLbkVNcEV0YmdvSWM1TkJjaHpJK0p2TFgz?=
 =?utf-8?B?dzR6Ym9xREdPZEZaUXlhZ2tIMi84MjRUT3haSDZKSG85czBpMjI5SkdjdWIv?=
 =?utf-8?B?eXBzVzVMaktqYmtFQWwyNExhRHBReXhYVEVYWUtuS1lnbHpNTy9ueFJIV3Zu?=
 =?utf-8?B?Z2ZLN2VQK0F1S01zTkRiZkdxMXpUTWV4MGdEQjY4bVNCbHVZeTZTaGoyY0tP?=
 =?utf-8?Q?Ut4T2mp3MTYPnZtw=3D?=
X-Exchange-RoutingPolicyChecked: GHxPJ3mwrSS6pPEy7F59Zmg8Cywg3uHIXle7dmm3oqOIKj/2d5j5SKcI0V1KO7UFuxVx3JUKn/d/rvvZbGBP1RfC/BHdt9WM2gTN3RvjaFmLnH5Rb5ZPCyzb6zQcf3t6tdSUFPFSDLKLJrSn1tQkEauEHmfOpUWnBeVk57Jsz3VB2IoS4nwqRvg3SZLD0NTy/qq9CTiiGswiw1Lf1K4SYpvBkM/J9zuBcDYD7en3ZLa1XlIqIiLKO30CZ0Fnbe6M6ECh23Ndumm0YE1rZjekn/a94sadXs7x4WgtIk+qj8CBr7AdPMXZ7tgL99sWDPSLbpPto2LQ80haRir6vmVofA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f158986-ef44-4d6f-a16e-08ded30fcd88
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2026 23:16:36.1472 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P5aw2xME48qSFaf5RnbA2dJYF4Kv1rb2xwgDT95hXT0m8M95Y8kU/u1xJ2UAX+2EDFkel/loAOet31FCHCe5az1Lyb0dgGG1GEkFLp2EXeU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF267298081
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

On Tue, Jun 16, 2026 at 06:54:21PM -0700, Ashutosh Dixit wrote:
>When only the OA mmap interface is in use, OA status can be provided
>through the status ioctl. This enables us to stop whitelisting the OA
>status register, thereby saving one nonpriv slot per OA unit.
>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>---
> drivers/gpu/drm/xe/xe_oa.c       | 7 +++++++
> drivers/gpu/drm/xe/xe_oa_types.h | 3 +++
> 2 files changed, 10 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
>index 9fbd21b0ef974..985be10855c33 100644
>--- a/drivers/gpu/drm/xe/xe_oa.c
>+++ b/drivers/gpu/drm/xe/xe_oa.c
>@@ -544,6 +544,7 @@ static int __xe_oa_read(struct xe_oa_stream *stream, char __user *buf,
> 	/* Only clear our bits to avoid side-effects */
> 	stream->oa_status = xe_mmio_rmw32(&stream->gt->mmio, __oa_regs(stream)->oa_status,
> 					  OASTATUS_RELEVANT_BITS, 0);
>+	stream->oa_status_read = true;
> 	/*
> 	 * Signal to userspace that there is non-zero OA status to read via
> 	 * @DRM_XE_OBSERVATION_IOCTL_STATUS observation stream fd ioctl
>@@ -1603,6 +1604,12 @@ static long xe_oa_status_locked(struct xe_oa_stream *stream, unsigned long arg)
> 	struct drm_xe_oa_stream_status status = {};
> 	void __user *uaddr = (void __user *)arg;
>
>+	/* Provide oa_status through the status ioctl, when only mmap() interface is used */
>+	if (!stream->oa_status_read)
>+		stream->oa_status = xe_mmio_rmw32(&stream->gt->mmio, __oa_regs(stream)->oa_status,
>+						  OASTATUS_RELEVANT_BITS, 0);
>+	stream->oa_status_read = false;
>+

This is asymmetric especially since we cannot control a user calling 
mmap and read from the same application. I would suggest that we avoid 
clearing the register status bits in _xe_oa_read.  read() will continue 
to return EIO until the status ioctl is called. In the status ioctl, we 
always read the latest value from the HW REG, return that and then clear 
the register bits.

Thanks,
Umesh

> 	/* Map from register to uapi bits */
> 	if (stream->oa_status & OASTATUS_REPORT_LOST)
> 		status.oa_status |= DRM_XE_OASTATUS_REPORT_LOST;
>diff --git a/drivers/gpu/drm/xe/xe_oa_types.h b/drivers/gpu/drm/xe/xe_oa_types.h
>index 3d9ec8490899c..a84456540a13c 100644
>--- a/drivers/gpu/drm/xe/xe_oa_types.h
>+++ b/drivers/gpu/drm/xe/xe_oa_types.h
>@@ -244,6 +244,9 @@ struct xe_oa_stream {
> 	/** @oa_status: temporary storage for oa_status register value */
> 	u32 oa_status;
>
>+	/** @oa_status_read: true when read() interface is used to read oa_status */
>+	bool oa_status_read;
>+
> 	/** @no_preempt: Whether preemption and timeslicing is disabled for stream exec_q */
> 	u32 no_preempt;
>
>-- 
>2.54.0
>
