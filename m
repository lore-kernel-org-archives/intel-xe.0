Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 343D9CF8860
	for <intel-xe@archiver.kernel.org>; Fri,  4 Oct 2024 22:26:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F08B910E00D;
	Fri,  4 Oct 2024 22:26:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HJtnYhkj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76AAF10E00D
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Oct 2024 22:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728080760; x=1759616760;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=Uu/sNqVPekgPI5F3LLoVkwRwoUtQE4LumkjWUasS7RE=;
 b=HJtnYhkjyCMHYx5ngvgOJUnlIZYMZ/IFfdT5FP1Bmo+Vjx5m74mKmIRc
 NY58wTSOtja5YMYzHgYVxoFCpQAaCuMbTY8FrlzcVleydkZfQbb1/g05P
 XFTHa+Pq97UGrMu9kJRjiSSbEYNZ1u3WubgEeDZiUhijsHQbjDuatSYEg
 PPQFaMH8/4nuaDwy9zWysFNE6AybSmdWoPOCfgDQEu/Mr+p28JOKHWDDO
 OOr48j68irFEiaNo6JDuZth26Kubx6SbSFOD9MmhOEDoNxC1v/uy40Hda
 7G7UVSdl+T0dlEQ1e2yaD/wRgVLPhloBJJKGGR3lt/Q/ntq6clw3ULb+G A==;
X-CSE-ConnectionGUID: lwV131PEQYCl5QbaT7EJ4g==
X-CSE-MsgGUID: aY8ZVL7bSp+AeeZxBiUE0w==
X-IronPort-AV: E=McAfee;i="6700,10204,11215"; a="31111419"
X-IronPort-AV: E=Sophos;i="6.11,178,1725346800"; d="scan'208";a="31111419"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2024 15:26:00 -0700
X-CSE-ConnectionGUID: 5BCxHw4KSGunUi/auieluA==
X-CSE-MsgGUID: jMoJZY5FS6C54f5Z/KC4kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,178,1725346800"; d="scan'208";a="79408151"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Oct 2024 15:26:00 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 4 Oct 2024 15:25:59 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 4 Oct 2024 15:25:59 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 4 Oct 2024 15:25:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LMwLM0VvIi7r1UkmVzN8QdoTXyMENsn5mnTDBCD4iTn6HCGZf+gLSn+9+sAh4EFfhsuuKFNH6xUlUfY3co1T1eISP0G9yw2hEUwuivWObPC7GCiL/hahxJodPceUvL2fXbPbKAqdgP/wGQcJ+Wm9viR5AKF8uCDfVo9nWDMVHKPyQpH+MMLEFKYw77ZovSluFmF1Ae1yfgSHvNL0io5nM7685uYf9WmJvsWCUaoOyBqcJ67Q4r1ImVExNbJUVK5pe1dYUmqszVvmH2TmtrDDYth8irDtAZ+ppz9Bh1u1hqVtVsVO7bgLYY9eUP8FCY6Ghlfode2MDkmvlBr2KFV/yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zr1JSPe3iat+OSMarB94gFjdrhmq+4F/QlHFtBCX2M4=;
 b=M21cECOOw33hg7ESu/Vg1Bfb+LN2/5ZKBOCPVUFYFJUiWgsWkGfkpra3IxJLxHuPwtJH5sSxH6tv6H/0FpsR45Z24qRc4kY5lFuhWMBsIsu1RBjuBQd0RokNgpiT85vYyOwJwrIVIpjfMw/TjnLW5JFr9M3TxTpCeLLal59jINh0tEhTCpSrKt0Ir6vvei8eVO7cY223EdMuX2ev8OBHWdxoebrX1n3rvp83sHD9y76hllm1xNzgiKnqreFpr+z/6qkwpFE1m+HRTb+C1bSnQwhvMuNHDcVjpM4UW/v5HbM8JELTFBw7uY64DFLoPXlZxohQS8DeAhmVsQceCuESww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by BY1PR11MB8077.namprd11.prod.outlook.com (2603:10b6:a03:527::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.18; Fri, 4 Oct
 2024 22:25:51 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%5]) with mapi id 15.20.8026.017; Fri, 4 Oct 2024
 22:25:51 +0000
Message-ID: <5aad84d8-b884-4f34-9f79-d4403916f304@intel.com>
Date: Fri, 4 Oct 2024 15:25:48 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/12] drm/xe/pxp: Add VCS inline termination support
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20240816190024.2176976-1-daniele.ceraolospurio@intel.com>
 <20240816190024.2176976-4-daniele.ceraolospurio@intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20240816190024.2176976-4-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR03CA0131.namprd03.prod.outlook.com
 (2603:10b6:303:8c::16) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|BY1PR11MB8077:EE_
X-MS-Office365-Filtering-Correlation-Id: 97880ee8-2d3d-45a1-b650-08dce4c380f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RGUydExzdnRYUVVmM1lYUXk4SyszbVc0dUdockJZN1ZiWVpMdmluVHBSNWp4?=
 =?utf-8?B?Sk9OOHJLRm5GUTVQSXNxS1RVa240dmNDYXhkOCs3cEdDRjNPWFVvZTlnWVdl?=
 =?utf-8?B?TWhocmh4d0s0UUVzQ2c1R1RlK09EMVdsazl4TXBuVE1Ha0NlS1B5Z1Axcmhy?=
 =?utf-8?B?NDc0T2g3dnNsdWx4Yjd2QW92MHJWdDFyOWE4MU5wRjlkT1NTeU1YdWpTRENO?=
 =?utf-8?B?dmI5Q0RWWENBem5aUldQd2MrSElaYkxOZllXeUhRbmJGT3VsbjB5RDdwVzVF?=
 =?utf-8?B?VXdHbFZOTlB1Q3dMay9DOU5sVHlzV2VyTnFBbm8zMVdQQjlpYzBBZ01QbzJV?=
 =?utf-8?B?Y0p2WTV0Q0pEUm9YTnB5K2VvVGNjeTNOem1QajFNUHRVc2dYTGVKQnArazdw?=
 =?utf-8?B?R1Y5TVZFRXp4QUN3QlRhdGlKNGVBdlZLS3pFdm5qUDhIa3plVk1RaHllRzI3?=
 =?utf-8?B?dFRjNklWUEhLU3dzMGpUQzg1MlNGc1dPajFNQW9aY29XRWdrWHRvbnpsVFA4?=
 =?utf-8?B?eUdWZFFKWTdjYXY1ay93eElmd0o1SUNrcXBoSnJteUxkSEJ3U2owVkdDODhX?=
 =?utf-8?B?c29vZ1pMNzN1UWRDelUyN0ltS3NXcUFiZWFLaVNRTmw0dVFJdk9jQS9MeEtF?=
 =?utf-8?B?OE5LdFEvTzd5YlpROHJMR1VRK00vUElNTTJXREVnYXdDS1RENkNDUE1iaUcw?=
 =?utf-8?B?YmxXd0d2WVBYQjBaai9lc0ZFS3NJSHBGRmxOUGYvdFJhUVJDZFRTcmF5aWpa?=
 =?utf-8?B?UzEyWVYxV2dsNi92aHZwaDcwRlFwZm5LRC9FQS9xd1BIbTFRbXh1Nm0rb0RL?=
 =?utf-8?B?d1E5cTFScXM1bTVlNDRhYnVKeVdZd01WQlNzSGdrd2I1NDRoZHpveElsdXhB?=
 =?utf-8?B?alVsZEpRSUNVYUZyYy9tdDhKZWdvQjVSZHFtZitjRWwxUVEwenFwRnM4eWFJ?=
 =?utf-8?B?VXBPeDAyQ1JNNHkvZXVBL2c0QWdWWUxlb2RmYWRaWFM1SDlMWk5SdlhOU1Y1?=
 =?utf-8?B?UVg5dnhEbmVBMWNVM3JhVmRkUkFwVFdGc0o3Ty9yMHpVSTJ4ZUpHcWREUm8z?=
 =?utf-8?B?Tll6aXlWakVDNGFuZldCOG5ZSUNubzI2bWt1WkZaZG1XQlc2dUxhenFHY1Ni?=
 =?utf-8?B?RGVFMHZDejNCZVo1OGUrbkd2YnhTVEFzMStlUmswTm9GOGhOeUtRODY2ZHFv?=
 =?utf-8?B?Z0JNQmtTdXVYSDBoUTN5Z2VHUGk1YmFhZUtVZVc4VXNQT3VLZDZsdXVnekFO?=
 =?utf-8?B?dnljVFdqUWoyU0dSYXV1MGVKWVpRSW1pc2hTTGl1VGp6Vld1eW5PcUJTR0hD?=
 =?utf-8?B?TEJBU094Sk4weXR6b2N0QTAvdWYxaTZHeTE1TXU1UEFla05IK0VpNDBFTVo5?=
 =?utf-8?B?bWppY21vYjQ4K2tQbFBDWjhjd05QdldWL0xaTWc4YkRSRS9rNU1PcHowSFlY?=
 =?utf-8?B?LzZuZmkzNElqVkpXWkpjNnp1T2U4VVUvb1BITUFFQXdYbksyZHBraWd4bGZI?=
 =?utf-8?B?RXpiRmRrTlBYZTE3ZTI0d05VNmFLVHpaSGRtS0xyYjJPb0pqT2VSNDg0M3BB?=
 =?utf-8?B?Qm03MGdFZWoxNFFzZ1ZhWkovbmNQSVN1TUFNdHZRenpNL2FxdS9VbkU4THN1?=
 =?utf-8?B?ODF6b3FFMm9ZL2JQcHM2VVNFZ3h6c2JkZUJndXQvSTNhTE9COHhEczFFZGJX?=
 =?utf-8?B?SDl0WEUvU0lsMGx5dlZiQjA4SVNUZ2hyRXdLL04wbHJRWVQyWUI2ZXRBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a0R6clVESjhjbTR0NWpmL0t6bko0YUh6SlVkSjVTQTRZRTYyUUVkd01EWGVS?=
 =?utf-8?B?V1o2M0oxNmJrMDdSWnQxU1REWndRTlZGcDR0d3E3aVZQMTh5R3d4aEwya3NR?=
 =?utf-8?B?VVA2b0xEUTFzcEVpOERqUFcrMU1SUEt0dm54a3gwd0VkY3BEdjRMSjNEZk41?=
 =?utf-8?B?ZEVxRTN0bFJyZFNGVklxMEhvaStETWNwNmpOODUwbzcrNlhNMkgxbm5tdU4z?=
 =?utf-8?B?YXRYT2dVcjNmVXVTaFEwNWdTYnZlazRBQ1VOcHFudWFxeVc4TUwydHg2NnpI?=
 =?utf-8?B?V2hRaVB5TVdFYmFQSExtUVMxUE5hdWxacWJQd2FqQWc3dUJqZ0VFdFZERzFr?=
 =?utf-8?B?VlVLVVpCczZ5WSsrQ0tiZWx0R1dUaG81bnJDY1BKQy9jNWprT2JTWXhuTGoy?=
 =?utf-8?B?WC83Rk1vVDlLYS9BNFlGM2F5a1drcjJrV3pXbU1ZTnF5Q1lUWFNKQy9zaWhK?=
 =?utf-8?B?UzZZYytvV3JvQWE3VDEyWXZwTlUyQ2RZVlVKckxFS0YrOURZVnBIOHJVcDRW?=
 =?utf-8?B?Zm1VNS9wYmUwRDQ1TXNnZ2FkcjhUbFNZcUg2bHF5Sk1ITDB4VXM3eVRoRVBI?=
 =?utf-8?B?Qm01N1U2UHNZenhYa0FYd3Q0YXduTjl3Q0xDbTl0bkI1ckczaGc4RWpUZGR6?=
 =?utf-8?B?dlhtdytWNThOMm9nTFh1T1RJMVRaSnJJYk4zdXNMY1ZFQ2dTQ0x4VlY0V1FG?=
 =?utf-8?B?cFI5MHpyTXllZXE0MkJqZDZMekwzZnJtVW9IUGx1NWpJdjZablJNbXI3aXhO?=
 =?utf-8?B?cGF5RlpjSDk5NGhHNDk1WUlwYWV2R1JHU0JBVmRVMEQ0ZkZiNUZmdy94aXdT?=
 =?utf-8?B?TEdKYkdWMmJEdUphMk44ekFHL0o5R3AvcW1sc2ZycFNFZnpGS29qMzFsSmZO?=
 =?utf-8?B?a2VGOFdoMUJuaXJuMkJXUmZnOWd5T3NJV0FPWmpCREhuYXVjRk5lUzJJSXZ5?=
 =?utf-8?B?RkRFZWduZGpHYmt2SXVRZGdCcHYxdEpYUk5JV1d5bndoTE5zaEp4ZG9ZRktn?=
 =?utf-8?B?cENsaG01Vk12b3lLU3JZRnl4Z3FsUDlDZG9zNEwvMTdZbjVPWmtNajZxcE5n?=
 =?utf-8?B?TU9mbDYvMlQvYitmQ3ZtbVhDQlRhL1RQQ1pzbUwyS1oxVzA3QUFDSWt2eXlC?=
 =?utf-8?B?TnJXaVJUUVFjVjBjNUI5MlNOMjdhNlh3YWJPdVF2bTE4OUltL3ZsMDcyS1pB?=
 =?utf-8?B?SWVNcnZ4UEYyOTltNGFtazhGQlUzd2lVMmYrSnNwUnpNK0hBT2E3Sk4zZzND?=
 =?utf-8?B?cFRvcDZpUDFvTWFRbDQwam1IclN0b2RsMXBxN2VXSUJVN3M5eWttZFdmQTRJ?=
 =?utf-8?B?VHVuRVRnRTU4Wk1GMlRpZlFjUTF2SDJPWCtpVkRIZmpUWHNQRzRYd3lJUXNK?=
 =?utf-8?B?Wm9GVlVnNGtuYjkwYTIvUzJpYkczWVkzVWJueUlwTzczZzZmOGJxck5DRWxi?=
 =?utf-8?B?MHBtb2VmUndDRDRCMUY5VnFYdGpDcmJNY3hRK2QzOGJ1a3ptZmJQSWUyc1px?=
 =?utf-8?B?YU11QU9IRzN4Q0tZYWdIZG8wYlpNN3Bka3N6bUQyS1NZYVVPVDQ0YW9QNkFw?=
 =?utf-8?B?aHNKM0FkNlpJb1c0TEptdndxNXRiVnhSL3ZzcENnMGhIek0rZ3lpeWd1RlRU?=
 =?utf-8?B?K0gvN29PNlJIdWs5Qzl5a1N6VEVYT3ZPdnJWcGR5anVPdytUelZMaWVUaks5?=
 =?utf-8?B?ZU1ER1dqeVNicjE3TDRJbFVPVllDdjNuUUlGTmhIRTlQQU85aitXMko0QlJK?=
 =?utf-8?B?RUdWYk5yUldZVWM2UDNQa0Zsb0VwU01OOXlPWkV5VUJ3RUxoM1h0dDd2d3pq?=
 =?utf-8?B?N3dPS3dSNU9UNlhXMzlOWHdmU3l1enBrdktDYUVzK2M1U0hvb1hEb0FwdFVG?=
 =?utf-8?B?SUVMZVQxdHJneE5iMktrSk1GZEJvOHB4dWNVc3VCZTd0Q0pyMjNwQkVrbXJs?=
 =?utf-8?B?WEp3OGlsREtma1ZTdVRSYUQ5N3M2bVg4V3I0c2U4MU1EZzdDUUJncjJqOE9j?=
 =?utf-8?B?RW02THI1dERsN2JVMFo3cHNySlBGa2YyODRaZGZYUWwxNEhmOHhaMXdKOWRn?=
 =?utf-8?B?U0xJaVcrNlVsUzNZTFl5cnR2azJuWWUrd1gybXRhaFFXdkt6ZE9ZK2lLZFI2?=
 =?utf-8?B?NmhpNElxQXZOQTBYSVZMcE1TRzdHbzZZSFZyQnNhbDJDeFRjZ1JWR1liSDZi?=
 =?utf-8?B?Wnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 97880ee8-2d3d-45a1-b650-08dce4c380f6
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2024 22:25:51.4704 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1h9QGLfs6hn28bVTuhLjbrBdui6WzDzqPVfpS/psm0s/hYc87Sb8kYp4TpWI0yIhYJwAQIEYUE0V67GcQg9uIHF8hZSUnQjDe+ZzRqYhyH0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB8077
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

On 8/16/2024 12:00, Daniele Ceraolo Spurio wrote:
> The key termination is done with a specific submission to the VCS
> engine.
>
> Note that this patch is meant to be squashed with the follow-up patches
> that implement the other pieces of the termination flow. It is separate
> for now for ease of review.
>
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> ---
>   .../gpu/drm/xe/instructions/xe_instr_defs.h   |   1 +
>   .../gpu/drm/xe/instructions/xe_mfx_commands.h |  29 +++++
>   .../gpu/drm/xe/instructions/xe_mi_commands.h  |   5 +
>   drivers/gpu/drm/xe/xe_lrc.h                   |   3 +-
>   drivers/gpu/drm/xe/xe_pxp_submit.c            | 108 ++++++++++++++++++
>   drivers/gpu/drm/xe/xe_pxp_submit.h            |   2 +
>   drivers/gpu/drm/xe/xe_ring_ops.c              |   4 +-
>   7 files changed, 149 insertions(+), 3 deletions(-)
>   create mode 100644 drivers/gpu/drm/xe/instructions/xe_mfx_commands.h
>
> diff --git a/drivers/gpu/drm/xe/instructions/xe_instr_defs.h b/drivers/gpu/drm/xe/instructions/xe_instr_defs.h
> index fd2ce7ace510..e559969468c4 100644
> --- a/drivers/gpu/drm/xe/instructions/xe_instr_defs.h
> +++ b/drivers/gpu/drm/xe/instructions/xe_instr_defs.h
> @@ -16,6 +16,7 @@
>   #define XE_INSTR_CMD_TYPE		GENMASK(31, 29)
>   #define   XE_INSTR_MI			REG_FIELD_PREP(XE_INSTR_CMD_TYPE, 0x0)
>   #define   XE_INSTR_GSC			REG_FIELD_PREP(XE_INSTR_CMD_TYPE, 0x2)
> +#define   XE_INSTR_VIDEOPIPE		REG_FIELD_PREP(XE_INSTR_CMD_TYPE, 0x3)
>   #define   XE_INSTR_GFXPIPE		REG_FIELD_PREP(XE_INSTR_CMD_TYPE, 0x3)
>   #define   XE_INSTR_GFX_STATE		REG_FIELD_PREP(XE_INSTR_CMD_TYPE, 0x4)
>   
> diff --git a/drivers/gpu/drm/xe/instructions/xe_mfx_commands.h b/drivers/gpu/drm/xe/instructions/xe_mfx_commands.h
> new file mode 100644
> index 000000000000..686ca3b1d9e8
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/instructions/xe_mfx_commands.h
> @@ -0,0 +1,29 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +#ifndef _XE_MFX_COMMANDS_H_
> +#define _XE_MFX_COMMANDS_H_
> +
> +#include "instructions/xe_instr_defs.h"
> +
> +#define MFX_CMD_SUBTYPE		REG_GENMASK(28, 27) /* A.K.A cmd pipe */
> +#define MFX_CMD_OPCODE		REG_GENMASK(26, 24)
> +#define MFX_CMD_SUB_OPCODE	REG_GENMASK(23, 16)
> +#define MFX_FLAGS_AND_LEN	REG_GENMASK(15, 0)
> +
> +#define XE_MFX_INSTR(subtype, op, sub_op, flags) \
> +	(XE_INSTR_VIDEOPIPE | \
> +	 REG_FIELD_PREP(MFX_CMD_SUBTYPE, subtype) | \
> +	 REG_FIELD_PREP(MFX_CMD_OPCODE, op) | \
> +	 REG_FIELD_PREP(MFX_CMD_SUB_OPCODE, sub_op) | \
> +	 REG_FIELD_PREP(MFX_FLAGS_AND_LEN, flags))
> +
> +#define MFX_WAIT				XE_MFX_INSTR(1, 0, 0, 0)
> +#define MFX_WAIT_DW0_PXP_SYNC_CONTROL_FLAG	REG_BIT(9)
> +#define MFX_WAIT_DW0_MFX_SYNC_CONTROL_FLAG	REG_BIT(8)
> +
> +#define CRYPTO_KEY_EXCHANGE			XE_MFX_INSTR(2, 6, 9, 0)
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
> index 10ec2920d31b..167fb0f742de 100644
> --- a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
> +++ b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
> @@ -48,6 +48,7 @@
>   #define   MI_LRI_LEN(x)			(((x) & 0xff) + 1)
>   
>   #define MI_FLUSH_DW			__MI_INSTR(0x26)
> +#define   MI_FLUSH_DW_PROTECTED_MEM_EN	REG_BIT(22)
>   #define   MI_FLUSH_DW_STORE_INDEX	REG_BIT(21)
>   #define   MI_INVALIDATE_TLB		REG_BIT(18)
>   #define   MI_FLUSH_DW_CCS		REG_BIT(16)
> @@ -66,4 +67,8 @@
>   
>   #define MI_BATCH_BUFFER_START		__MI_INSTR(0x31)
>   
> +#define MI_SET_APPID			__MI_INSTR(0x0e)
> +#define MI_SET_APPID_SESSION_ID_MASK	REG_GENMASK(6, 0)
> +#define MI_SET_APPID_SESSION_ID(x)	REG_FIELD_PREP(MI_SET_APPID_SESSION_ID_MASK, x)
> +
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
> index c24542e89318..d411c3fbcbc6 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.h
> +++ b/drivers/gpu/drm/xe/xe_lrc.h
> @@ -20,7 +20,8 @@ struct xe_lrc;
>   struct xe_lrc_snapshot;
>   struct xe_vm;
>   
> -#define LRC_PPHWSP_SCRATCH_ADDR (0x34 * 4)
> +#define LRC_PPHWSP_FLUSH_INVAL_SCRATCH_ADDR (0x34 * 4)
> +#define LRC_PPHWSP_PXP_INVAL_SCRATCH_ADDR (0x40 * 4)
>   
>   struct xe_lrc *xe_lrc_create(struct xe_hw_engine *hwe, struct xe_vm *vm,
>   			     u32 ring_size);
> diff --git a/drivers/gpu/drm/xe/xe_pxp_submit.c b/drivers/gpu/drm/xe/xe_pxp_submit.c
> index b777b0765c8a..3b69dcc0a00f 100644
> --- a/drivers/gpu/drm/xe/xe_pxp_submit.c
> +++ b/drivers/gpu/drm/xe/xe_pxp_submit.c
> @@ -6,14 +6,20 @@
>   #include "xe_pxp_submit.h"
>   
>   #include <drm/xe_drm.h>
> +#include <linux/delay.h>
>   
>   #include "xe_device_types.h"
> +#include "xe_bb.h"
>   #include "xe_bo.h"
>   #include "xe_exec_queue.h"
>   #include "xe_gsc_submit.h"
>   #include "xe_gt.h"
> +#include "xe_lrc.h"
>   #include "xe_pxp_types.h"
> +#include "xe_sched_job.h"
>   #include "xe_vm.h"
> +#include "instructions/xe_mfx_commands.h"
> +#include "instructions/xe_mi_commands.h"
>   #include "regs/xe_gt_regs.h"
>   
>   /*
> @@ -199,3 +205,105 @@ void xe_pxp_destroy_execution_resources(struct xe_pxp *pxp)
>   	destroy_vcs_execution_resources(pxp);
>   }
>   
> +#define emit_cmd(xe_, map_, offset_, val_) \
> +	xe_map_wr(xe_, map_, (offset_) * sizeof(u32), u32, val_)
> +
> +/* stall until prior PXP and MFX/HCP/HUC objects are cmopleted */
completed

> +#define MFX_WAIT_PXP (MFX_WAIT | \
> +		      MFX_WAIT_DW0_PXP_SYNC_CONTROL_FLAG | \
> +		      MFX_WAIT_DW0_MFX_SYNC_CONTROL_FLAG)
Why define an XE_MFX_INSTR macro that takes a flags word only to 
manually OR the flags in outside of the macro?

> +static u32 pxp_emit_wait(struct xe_device *xe, struct iosys_map *batch, u32 offset)
> +{
> +	/* wait for cmds to go through */
> +	emit_cmd(xe, batch, offset++, MFX_WAIT_PXP);
> +	emit_cmd(xe, batch, offset++, 0);
This zero is just padding to ensure 64bit alignment of future instructions?

> +
> +	return offset;
> +}
> +
> +static u32 pxp_emit_session_selection(struct xe_device *xe, struct iosys_map *batch,
> +				      u32 offset, u32 idx)
> +{
> +	offset = pxp_emit_wait(xe, batch, offset);
> +
> +	/* pxp off */
> +	emit_cmd(xe, batch, offset++, MI_FLUSH_DW | MI_FLUSH_IMM_DW);
> +	emit_cmd(xe, batch, offset++, 0);
> +	emit_cmd(xe, batch, offset++, 0);
> +	emit_cmd(xe, batch, offset++, 0);
> +
> +	/* select session */
> +	emit_cmd(xe, batch, offset++, MI_SET_APPID | MI_SET_APPID_SESSION_ID(idx));
> +	emit_cmd(xe, batch, offset++, MFX_WAIT_PXP);
Seems odd to define a helper function to emit this instruction and then 
only use it for some instances.

> +
> +	/* pxp on */
> +	emit_cmd(xe, batch, offset++, MI_FLUSH_DW |
> +				      MI_FLUSH_DW_PROTECTED_MEM_EN |
> +				      MI_FLUSH_DW_OP_STOREDW | MI_FLUSH_DW_STORE_INDEX |
> +				      MI_FLUSH_IMM_DW);
> +	emit_cmd(xe, batch, offset++, LRC_PPHWSP_PXP_INVAL_SCRATCH_ADDR |
> +				      MI_FLUSH_DW_USE_GTT);
> +	emit_cmd(xe, batch, offset++, 0);
> +	emit_cmd(xe, batch, offset++, 0);
> +
> +	offset = pxp_emit_wait(xe, batch, offset);
> +
> +	return offset;
> +}
> +
> +static u32 pxp_emit_inline_termination(struct xe_device *xe,
> +				       struct iosys_map *batch, u32 offset)
> +{
> +	/* session inline termination */
> +	emit_cmd(xe, batch, offset++, CRYPTO_KEY_EXCHANGE);
> +	emit_cmd(xe, batch, offset++, 0);
> +
> +	return offset;
> +}
> +
> +static u32 pxp_emit_session_termination(struct xe_device *xe, struct iosys_map *batch,
> +					u32 offset, u32 idx)
> +{
> +	offset = pxp_emit_session_selection(xe, batch, offset, idx);
> +	offset = pxp_emit_inline_termination(xe, batch, offset);
> +
> +	return offset;
> +}
> +
> +/**
> + * xe_pxp_submit_session_termination - submits a PXP inline termination
> + * @pxp: the xe_pxp structure
> + * @id: the session to terminate
> + *
> + * Emit an inline termination via the VCS engine to terminate a session.
> + *
> + * Returns 0 if the submission is successful, an errno value otherwise.
> + */
> +int xe_pxp_submit_session_termination(struct xe_pxp *pxp, u32 id)
> +{
> +	struct xe_sched_job *job;
> +	struct dma_fence *fence;
> +	long timeout;
> +	u32 offset = 0;
> +	u64 addr = xe_bo_ggtt_addr(pxp->vcs_exec.bo);
> +
> +	offset = pxp_emit_session_termination(pxp->xe, &pxp->vcs_exec.bo->vmap, offset, id);
> +	offset = pxp_emit_wait(pxp->xe, &pxp->vcs_exec.bo->vmap, offset);
> +	emit_cmd(pxp->xe, &pxp->vcs_exec.bo->vmap, offset, MI_BATCH_BUFFER_END);
> +
> +	job =  xe_sched_job_create(pxp->vcs_exec.q, &addr);
Double space

> +	if (IS_ERR(job))
> +		return PTR_ERR(job);
> +
> +	xe_sched_job_arm(job);
> +	fence = dma_fence_get(&job->drm.s_fence->finished);
> +	xe_sched_job_push(job);
> +
> +	timeout = dma_fence_wait_timeout(fence, false, HZ);
> +
> +	dma_fence_put(fence);
> +	if (timeout <= 0)
> +		return -EAGAIN;
Does it not matter what the error was? Why/how would this fail in a way 
that needs to be re-tried?

Although looking at the later patches, the return value from this 
function is just treated as a pass/fail bool anyway. So why bother 
munging it at all?

John.

> +
> +	return 0;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_pxp_submit.h b/drivers/gpu/drm/xe/xe_pxp_submit.h
> index 1a971fadc081..4ee8c0acfed9 100644
> --- a/drivers/gpu/drm/xe/xe_pxp_submit.h
> +++ b/drivers/gpu/drm/xe/xe_pxp_submit.h
> @@ -13,4 +13,6 @@ struct xe_pxp;
>   int xe_pxp_allocate_execution_resources(struct xe_pxp *pxp);
>   void xe_pxp_destroy_execution_resources(struct xe_pxp *pxp);
>   
> +int xe_pxp_submit_session_termination(struct xe_pxp *pxp, u32 id);
> +
>   #endif /* __XE_PXP_SUBMIT_H__ */
> diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
> index 0be4f489d3e1..a4b5a0f68a32 100644
> --- a/drivers/gpu/drm/xe/xe_ring_ops.c
> +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
> @@ -118,7 +118,7 @@ static int emit_flush_invalidate(u32 flag, u32 *dw, int i)
>   	dw[i++] |= MI_INVALIDATE_TLB | MI_FLUSH_DW_OP_STOREDW | MI_FLUSH_IMM_DW |
>   		MI_FLUSH_DW_STORE_INDEX;
>   
> -	dw[i++] = LRC_PPHWSP_SCRATCH_ADDR | MI_FLUSH_DW_USE_GTT;
> +	dw[i++] = LRC_PPHWSP_FLUSH_INVAL_SCRATCH_ADDR | MI_FLUSH_DW_USE_GTT;
>   	dw[i++] = 0;
>   	dw[i++] = ~0U;
>   
> @@ -156,7 +156,7 @@ static int emit_pipe_invalidate(u32 mask_flags, bool invalidate_tlb, u32 *dw,
>   
>   	flags &= ~mask_flags;
>   
> -	return emit_pipe_control(dw, i, 0, flags, LRC_PPHWSP_SCRATCH_ADDR, 0);
> +	return emit_pipe_control(dw, i, 0, flags, LRC_PPHWSP_FLUSH_INVAL_SCRATCH_ADDR, 0);
>   }
>   
>   static int emit_store_imm_ppgtt_posted(u64 addr, u64 value,

