Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 918CCC19F32
	for <intel-xe@archiver.kernel.org>; Thu,  6 Mar 2025 02:10:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B97910E8B6;
	Thu,  6 Mar 2025 02:10:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DmRAgjdi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B772410E8B6
 for <Intel-Xe@lists.freedesktop.org>; Thu,  6 Mar 2025 02:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741227014; x=1772763014;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=4fpStu8FDuh/qG9xpqNHEftf/eN4cnWRSMSriGQpIGw=;
 b=DmRAgjdiNZYJcXUb8ljKzDPuRvh4EIjA3xsnsHfc0NprXhCN/u7XR8If
 OE7RAEKqvSKokD2iLKbdosfrL7ch+RqnebXjxQkM/2nEeu/ztckU6oJj5
 y/1+vTLdrFuCukRcPGi9bw4/qHlVzVUsgKXXChKcgWZaengBcSS+FAEt6
 6nvGlEHT8O78iHNxVM9ZvhgURKMUruJaLNAPmzYpXSt1VaHp6XN3aLu7m
 ZnX05gB/M8R9gfrd8CfddfREULxgXs8UVkl0IIzrML/PE2jXKzOAf0MzO
 8QcvFdXh4zrjVqSBQkJpJjCrmbMYFJqQ8reLJ+DaTQ8F2W75un2RM8wgw w==;
X-CSE-ConnectionGUID: 8oHkcXt8Qj6LrjXAZGEZKw==
X-CSE-MsgGUID: VHZb5jArSL+hoRVSXhHTaw==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="45028148"
X-IronPort-AV: E=Sophos;i="6.14,224,1736841600"; d="scan'208";a="45028148"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 18:10:14 -0800
X-CSE-ConnectionGUID: bMeEAqyNTcK19Ey44B1YrQ==
X-CSE-MsgGUID: LMkxsnqLQFmVHZq3x2SHfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="156091679"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Mar 2025 18:10:14 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 5 Mar 2025 18:10:13 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 5 Mar 2025 18:10:13 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 5 Mar 2025 18:10:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O0EDft9mY2Z678VXHZkZ3pPvv7S3hQWgHkaoIT/fJ2o3eYQ3a22uc54RoCtIRHUPu88t9n8L7YFqZYXiFlU2oWK6JDEGpBv0gSdXs4rX4iUnOCL7tEcZ0EJ0tJLjZcuR7FGqqNjGxOm1kdPWDfMgT/VvMo0+8ukG9GhCsWdl0RNfvHxweKkZei0UCidbrZYZfq43yj0CmXqibUGlzLGoKMpT+58p9zpYP3hKgG1VCBRzLriK9geO+/3Yao+OD4Red8e/LPMYmOglWP1re7IYV4uHDWdTcEV/o1fxbquGyV/Wh237uoTk2VL8khg6q2fNKbrP37icKLU6abHFjI/7Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oeK75z5VXTnaYYCgAGSe6PSmme+FP1ujJSv/a05R3rA=;
 b=JpTfPTlGogAqRE/yOvG33b05IkNLOP5ne5NzWk8tcMOMwNXJ7t1mdyubm36gARb9FVzYElsgwAYEDoRx24ktuaq/GzflOisWlgAIHpTodO2XYGk/sk1cu29aru/rX6dZgY2Sp0ZAhScFIsRtyasN9QAY8DUfydHN4j3KIHYWM9l2hN47oaFzb+QPKb4x7VFRDLelwowRNDZXSFdukpbcgG76DPH+QWaVrr9rIhNp1ZOwBKrIiEZTl+1CJIaVUDMrruhfMyFjXQGN0ImkVh4ALMNdtn841Dwzul45Zb1SyOZu9BGEhcAS+25/uInJpql8cQ/+Tylbqt5LOigtPbk5Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CH0PR11MB5235.namprd11.prod.outlook.com (2603:10b6:610:e2::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.16; Thu, 6 Mar
 2025 02:09:56 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%3]) with mapi id 15.20.8511.017; Thu, 6 Mar 2025
 02:09:55 +0000
Date: Wed, 5 Mar 2025 20:09:51 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <John.C.Harrison@intel.com>
CC: <Intel-Xe@lists.freedesktop.org>, Jonathan Cavitt
 <jonathan.cavitt@intel.com>
Subject: Re: [PATCH v2 4/7] drm/xe/uc: Add support for different firmware
 files on each GT
Message-ID: <5wioz5xihgf4dq7krmohwancinsjmnqsangtsvhjre26yzqz27@q5jnum5lvo6f>
References: <20250303195215.1046192-1-John.C.Harrison@Intel.com>
 <20250303195215.1046192-5-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250303195215.1046192-5-John.C.Harrison@Intel.com>
X-ClientProxiedBy: MW4P222CA0014.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::19) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CH0PR11MB5235:EE_
X-MS-Office365-Filtering-Correlation-Id: 4412f152-d9f3-4742-8564-08dd5c53fd04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Ke0IxJi93pfWbXZn4umTQws52eOkUU26Ec58eeIR66H79pn8sxX6YQlyFwft?=
 =?us-ascii?Q?ee06XfsL+xt7C9Dhoomi20LHo0DbhWXUS9h7YIBwewHwM8TFnXiaR9ea8506?=
 =?us-ascii?Q?+FfP/85XvLDSSRwPTwehGYJb8SpQ9sQYuPezh/iyforoM/MmKWynQv6ETA++?=
 =?us-ascii?Q?fwa4gkAaujaB75bMh5tAV8OVaE5BA2rdpR8TAs5pndR+Qm+YgI0cjCLqUuOn?=
 =?us-ascii?Q?eJymghvqohXofxN9NuQLZIN3xskoNqwmwsfKNYuIFHnn+nz2gnRWMt+48+St?=
 =?us-ascii?Q?W4nlnpzmNU22Dt62l25vCpHxHwRZVMFZx32TMiB/I5P5HUTb6/Yz7Z3jk+ko?=
 =?us-ascii?Q?QkioukUq37bxtFRKqfxV+iTJPiM+4BL2t7szVDBfDAz6XYR9aeRd6USsaJZ2?=
 =?us-ascii?Q?xTlXQV7qELepWj1wu8DMRQvlD+SGJh7u9IK8SmvX+XAVngCker7kn/aSloS/?=
 =?us-ascii?Q?/Hlq9/7y3ZTDoQS//NgInzWyp0/1P1fl1L2TlIBXZHK0zN/t3Oha2O3QVoVa?=
 =?us-ascii?Q?N6lSMQ5ZW04veTCsr9XqGw4Kim79AgPLtPlQciZNJQSYlekEaLQKGDjK3LUD?=
 =?us-ascii?Q?nKCJcW9lHIeXidyBGHP4SNeKYp53/OWE+hmli3fOnWZUcQX1nmFKIz+jWFH5?=
 =?us-ascii?Q?+N1o7/TU/FVwJOm2gvlQNndbVVJPu/g5bfnHKOqRSJ9/6v7cLCYJVzxspQZt?=
 =?us-ascii?Q?86BCu/YZUmOA9A4LIC2Ca2xlxgjs6DJGIKYsSRMG+CBw6NNyelBJ098poCnR?=
 =?us-ascii?Q?TW5nfDlTYoZUsbiyIW52GYeRsV8B7nSUJeDqCO6xF5HYIp8EraEUkh1I19M4?=
 =?us-ascii?Q?Ff8igd/3f4J79Yl0V3j1zS3zakVNwYXy6fYy0rHNL2es/2f+Tr0MH2Mbep4k?=
 =?us-ascii?Q?Y4NkeXXqDAJuJVatPe5HBmI2fl555BDYzKJsUhqpPcGsFk14EJ7hKLqK6vVB?=
 =?us-ascii?Q?BOY0f1ooNXi7ZNiGuzXNV5Qd453pdoDezQjmvkHbSweZCRnw1ZlHmxYfOPd5?=
 =?us-ascii?Q?g7e4iZGdTIFuRrCBY8qJPg/n/lrtlNlRvhW/75XsSWq4smn4FKGJOXKKfC22?=
 =?us-ascii?Q?vL//XFgK5LhSvqNiA7zBPa1XdFWRJ6jc0/EkyfDof359v2/i32dvHMcLpKYG?=
 =?us-ascii?Q?Gj/L21AtTGOlNwr0QDxyuN0Rq052U9zLzsluWhlP0m0cV9MgSTSr+fR/Q3Sw?=
 =?us-ascii?Q?dWIkljAdMMCfAQU3BeJ72HcjqaoGJycTRWDzoYJ28yRV07xf+Qo4Bp//THdW?=
 =?us-ascii?Q?D3hMPx1nthjJvnKj99QaG4GkVCZfVpiP7PqH36ahZ/EkndfgWIm5es49hvTN?=
 =?us-ascii?Q?PwaRSJ2SgFJDETfq6X3ODeqgctIeT42djh8nJHb7xVtnrQXKzl2LY4J/ERjH?=
 =?us-ascii?Q?5wI7Dmp//0meKljwv0PXthiORHxL?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9RaeEzNzKZ6FNEb5+SYBxrVaz4Gip5Q7OnJ+sZUOQ3sUAhPI5Dr5oHtjetSO?=
 =?us-ascii?Q?GZHpBC88D0oiJ5rne2+GjZSHtUYDwOOWRWGUvNquupONvumYmFhCLa4OsZ3n?=
 =?us-ascii?Q?DLnCtJ4hg4ei3fc+dKXhW01dRVGEosFfYHCFdNqzZvgaVr0Svd8fgOHvqwxp?=
 =?us-ascii?Q?RdOF40Cd+1G3bv/LN9wnXfrPFjIcNMhwSRcZZUfQOnZ24Lx9h96yIHpFVVG1?=
 =?us-ascii?Q?s60knb3G6po97EE6E0vd8P4gU6ppKySifcDoFBm0zS1upOkVxjlQkKB5BMVh?=
 =?us-ascii?Q?N8+OfoOPNy9W4S4s9XcvW8B7eGou0/r7Zbn5Iub1uCibBKPRgeea724/P291?=
 =?us-ascii?Q?6IGQ6z34EfcgVNExfZz6CD5vkJokEd/giKlAoh+nv9pNlpqEgAkJroVHU7MG?=
 =?us-ascii?Q?euajCuFVDiSE2zLuWTLb6Q24XmtONie/mH8tNpaM0xMcbG0p2ioxB/ukJIHw?=
 =?us-ascii?Q?DxLe3PkBXKTLaL/DqbB6+vqmTqDhnNR7WIgh7YyKfK3HHHONc0z70aDBJSrB?=
 =?us-ascii?Q?7sAu4ubTSTf/EpOhwl2uHQ3WzkRwWNskykXERXxLgdWZkHLCrvUSMrPw0gdY?=
 =?us-ascii?Q?j97z6uYcekERVHryrwzsei+Lbv5edYpP3hjpM3qtoYz82YxFN9gVtkK1Uk5g?=
 =?us-ascii?Q?SMJqDNgYg1yWlN4KQLMCXWyY1/Uo1LLHpcIU4r0YFbNPLiOlNPQgnTpvH4Rw?=
 =?us-ascii?Q?TfTuQjFZNP7Zn2beYKIKkl3HTF2SuK/G7rHXEdrrB2+aRi/9LzrGxNTWXIQ5?=
 =?us-ascii?Q?EuGd6CIMAXq751CRUaM+6nh5yJckg9A4zk/BWREQXmi2P+iKlvghVuDpX8Ri?=
 =?us-ascii?Q?CmpqSYo1zd5xDOjJ0pKUlGpQVws/a3q7JyLzCjerUhVGwuJvfTsQOGIlJXR3?=
 =?us-ascii?Q?2OA4cdMyakSGUYSrg0lbkBbQ0id7LubeELdUE5MUD5tzcmDmHe8Yxj5894o4?=
 =?us-ascii?Q?2KU1WOInvujgvv/G4Kqkx7V/pEf2tHU6yKfmbzpE9g6H2FNY/iH1JG/IfGlK?=
 =?us-ascii?Q?WzeCOGp0+PvFyj5Q4Wp0PEKfMbyxD1dXSqAVFPQ6h7fmAvoDBzmQi+GLkMEA?=
 =?us-ascii?Q?kLkr0e41+2aBohCgu0Bdkx5U1eeZzBvH9hdPjJ3/l+ytJxRJCD9TyVVWJSkb?=
 =?us-ascii?Q?H4yE/RZkZdc5DFnHCFYCFtpQbrOoqs9phNxp7siyqhJYi0p/2o2YHki9jhBk?=
 =?us-ascii?Q?5mWjXbS312FtHMybcIPlfL5EqEabTUI9AWxjoLuLbWGcVpTzinG+F9/ltEzf?=
 =?us-ascii?Q?oLxBDo2SYDoJl/EoTUTrn0YawIS1S5TSAAD53jwEgY4OrtcMZeoBj0Wc+EVQ?=
 =?us-ascii?Q?PZs5MALci3qxJDvbV8tC05tFh4bgSSnx6AI4R5JFA7MVBS4o98zlHQCz05pC?=
 =?us-ascii?Q?Jos6rZ4MR0dXY1TZ2I8zAsc5zZLDEBTiDgnIT86K3CTRglWikfdFEs7dhZwe?=
 =?us-ascii?Q?uxRX7q4RkEsIgv60ej11Nbmc6QQJj4RcMtQrrf7zDf3UVSfofu+jxGCNUSRL?=
 =?us-ascii?Q?2MpmBUtZMamKqF5z+7JmIW1Bhd0z+2ko9WE44ys5WfzOy3yGcz4+G5QSFtlA?=
 =?us-ascii?Q?3VBsldfrS3h0aK9nnRmEoN8yRYOZbVKPyrY2jGm0Zi6LDPDd0Sr1PCudeZcH?=
 =?us-ascii?Q?eQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4412f152-d9f3-4742-8564-08dd5c53fd04
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 02:09:55.8741 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ukI+bDGywTSJiII0WeAQzJqK6f133U4uIhg0Ga1dawuVah99SmX+MqWxdl8fUa6Duf7/qieXODLeIHEsg412KE++ITO/mzdsnId6kvai0CE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5235
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

On Mon, Mar 03, 2025 at 11:52:12AM -0800, John.C.Harrison@Intel.com wrote:
>From: John Harrison <John.C.Harrison@Intel.com>
>
>The different GTs on a device can be very different. So add support
>for being able to load a GuC firmware image that is tailored to the
>specific GT type.

Suggest to reword this to take into account that this is not true
for the platforms today, but it may be in future.

>
>Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
>---
> drivers/gpu/drm/xe/xe_uc_fw.c | 67 +++++++++++++++++++++--------------
> 1 file changed, 40 insertions(+), 27 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
>index fb0eda3d5682..748863b75adf 100644
>--- a/drivers/gpu/drm/xe/xe_uc_fw.c
>+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
>@@ -98,6 +98,7 @@ struct uc_fw_entry {
> 		u16 minor;
> 		u16 patch;
> 		bool full_ver_required;
>+		const char *gt_type;
> 	};
> };
>
>@@ -107,16 +108,16 @@ struct fw_blobs_by_type {
> };
>
> #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)			\
>-	fw_def(BATTLEMAGE,	major_ver(xe,	guc,	bmg,	70, 29, 2))	\
>-	fw_def(LUNARLAKE,	major_ver(xe,	guc,	lnl,	70, 29, 2))	\
>-	fw_def(METEORLAKE,	major_ver(i915,	guc,	mtl,	70, 29, 2))	\
>-	fw_def(DG2,		major_ver(i915,	guc,	dg2,	70, 29, 2))	\
>-	fw_def(DG1,		major_ver(i915,	guc,	dg1,	70, 29, 2))	\
>-	fw_def(ALDERLAKE_N,	major_ver(i915,	guc,	tgl,	70, 29, 2))	\
>-	fw_def(ALDERLAKE_P,	major_ver(i915,	guc,	adlp,	70, 29, 2))	\
>-	fw_def(ALDERLAKE_S,	major_ver(i915,	guc,	tgl,	70, 29, 2))	\
>-	fw_def(ROCKETLAKE,	major_ver(i915,	guc,	tgl,	70, 29, 2))	\
>-	fw_def(TIGERLAKE,	major_ver(i915,	guc,	tgl,	70, 29, 2))
>+	fw_def(BATTLEMAGE,	major_ver(xe,	guc,	bmg,	70, 29, 2, ""))	\

There are a few things I dislike here and I've been pondering if we
merge it as is or if we improve it. I don't want to rush this in for
6.15 as there is no need to.

1) Keeping this ugly empty string repeated for every single platform.
Particularly because it's no descriptive of what it really is. Alas,
adding a "g" later is also a bit cryptic

2) The media type depending on the name like this. Note that the first
field is about the platform match.

3) This hidden behavior coded below that if type **starts with** "g"
it's for main gt, if it starts with "m" it's for media.

4) pahole is not very happy with the new uc_fw_entry. We can do better.

With that in mind, i'd propose this instead, using BMG and LNL just for
example:

#define ANY_GT	XE_GT_TYPE_UNINITIALIZED

	fw_def(BATTLEMAGE, XE_GT_TYPE_MAIN,	major_ver(xe,	guc,	bmg_g,	70, 29, 2)	\
	fw_def(BATTLEMAGE, XE_GT_TYPE_MEDIA,	major_ver(xe,	guc,	bmg_m,	70, 29, 1)	\
	fw_def(LUNARLAKE,  ANY_GT,		major_ver(xe,	guc,	lnl,	70, 29, 2)	\



>+	fw_def(LUNARLAKE,	major_ver(xe,	guc,	lnl,	70, 29, 2, ""))	\
>+	fw_def(METEORLAKE,	major_ver(i915,	guc,	mtl,	70, 29, 2, ""))	\
>+	fw_def(DG2,		major_ver(i915,	guc,	dg2,	70, 29, 2, ""))	\
>+	fw_def(DG1,		major_ver(i915,	guc,	dg1,	70, 29, 2, ""))	\
>+	fw_def(ALDERLAKE_N,	major_ver(i915,	guc,	tgl,	70, 29, 2, ""))	\
>+	fw_def(ALDERLAKE_P,	major_ver(i915,	guc,	adlp,	70, 29, 2, ""))	\
>+	fw_def(ALDERLAKE_S,	major_ver(i915,	guc,	tgl,	70, 29, 2, ""))	\
>+	fw_def(ROCKETLAKE,	major_ver(i915,	guc,	tgl,	70, 29, 2, ""))	\
>+	fw_def(TIGERLAKE,	major_ver(i915,	guc,	tgl,	70, 29, 2, ""))
>
> #define XE_HUC_FIRMWARE_DEFS(fw_def, mmp_ver, no_ver)		\
> 	fw_def(BATTLEMAGE,	no_ver(xe,	huc,		bmg))		\
>@@ -133,30 +134,30 @@ struct fw_blobs_by_type {
> 	fw_def(LUNARLAKE,	major_ver(xe,	gsc,	lnl,	104, 1, 0)) \
> 	fw_def(METEORLAKE,	major_ver(i915,	gsc,	mtl,	102, 1, 0))
>
>-#define MAKE_FW_PATH(dir__, uc__, shortname__, version__)			\
>-	__stringify(dir__) "/" __stringify(shortname__) "_" __stringify(uc__) version__ ".bin"
>+#define MAKE_FW_PATH(dir__, uc__, shortname__, type__, version__)			\
>+	__stringify(dir__) "/" __stringify(shortname__) type__ "_" __stringify(uc__) version__ ".bin"
>
>-#define fw_filename_mmp_ver(dir_, uc_, shortname_, a, b, c)			\
>-	MAKE_FW_PATH(dir_, uc_, shortname_, "_" __stringify(a ## . ## b ## . ## c))
>-#define fw_filename_major_ver(dir_, uc_, shortname_, a, b, c)			\
>-	MAKE_FW_PATH(dir_, uc_, shortname_, "_" __stringify(a))
>+#define fw_filename_mmp_ver(dir_, uc_, shortname_, a, b, c, t)			\
>+	MAKE_FW_PATH(dir_, uc_, shortname_, t, "_" __stringify(a ## . ## b ## . ## c))
>+#define fw_filename_major_ver(dir_, uc_, shortname_, a, b, c, t)		\
>+	MAKE_FW_PATH(dir_, uc_, shortname_, t, "_" __stringify(a))
> #define fw_filename_no_ver(dir_, uc_, shortname_)				\
>-	MAKE_FW_PATH(dir_, uc_, shortname_, "")
>+	MAKE_FW_PATH(dir_, uc_, shortname_, "", "")
> #define fw_filename_gsc(dir_, uc_, shortname_, a, b, c)				\
>-	MAKE_FW_PATH(dir_, uc_, shortname_, "_" __stringify(b))
>-
>-#define uc_fw_entry_mmp_ver(dir_, uc_, shortname_, a, b, c)			\
>-	{ fw_filename_mmp_ver(dir_, uc_, shortname_, a, b, c),			\
>-	  a, b, c, true }
>-#define uc_fw_entry_major_ver(dir_, uc_, shortname_, a, b, c)			\
>-	{ fw_filename_major_ver(dir_, uc_, shortname_, a, b, c),		\
>-	  a, b, c }
>+	MAKE_FW_PATH(dir_, uc_, shortname_, "", "_" __stringify(b))
>+
>+#define uc_fw_entry_mmp_ver(dir_, uc_, shortname_, a, b, c, t)			\
>+	{ fw_filename_mmp_ver(dir_, uc_, shortname_, a, b, c, t),		\
>+	  a, b, c, true, t }
>+#define uc_fw_entry_major_ver(dir_, uc_, shortname_, a, b, c, t)		\
>+	{ fw_filename_major_ver(dir_, uc_, shortname_, a, b, c, t),		\
>+	  a, b, c, false, t }
> #define uc_fw_entry_no_ver(dir_, uc_, shortname_)				\
> 	{ fw_filename_no_ver(dir_, uc_, shortname_),				\
>-	  0, 0 }
>+	  0, 0, 0, false, "" }
> #define uc_fw_entry_gsc(dir_, uc_, shortname_, a, b, c)				\
> 	{ fw_filename_gsc(dir_, uc_, shortname_, a, b, c),			\
>-	  a, b, c }
>+	  a, b, c, false, "" }

..
                                                                                  
#define XE_UC_FW_ENTRY(platform__, gt_type__, entry__)                          \
         {                                                                       \
                 .platform = XE_ ## platform__,                                  \
		.gt_type = gt_type__, 						\
                 entry__,                                                        \
         },
>
> /* All blobs need to be declared via MODULE_FIRMWARE() */
> #define XE_UC_MODULE_FIRMWARE(platform__, fw_filename)				\
>@@ -224,6 +225,7 @@ uc_fw_auto_select(struct xe_device *xe, struct xe_uc_fw *uc_fw)
> 	};
> 	static const struct uc_fw_entry *entries;
> 	enum xe_platform p = xe->info.platform;
>+	struct xe_gt *gt = uc_fw_to_gt(uc_fw);
> 	u32 count;
> 	int i;
>
>@@ -231,8 +233,19 @@ uc_fw_auto_select(struct xe_device *xe, struct xe_uc_fw *uc_fw)
> 	entries = blobs_all[uc_fw->type].entries;
> 	count = blobs_all[uc_fw->type].count;
>
>+	xe_gt_assert(gt, (gt->info.type == XE_GT_TYPE_MAIN) || (gt->info.type == XE_GT_TYPE_MEDIA));

then remove the assert.

>+
> 	for (i = 0; i < count && p <= entries[i].platform; i++) {
> 		if (p == entries[i].platform) {
>+			if (entries[i].gt_type[0]) {
>+				if (gt->info.type == XE_GT_TYPE_MAIN &&
>+				    (entries[i].gt_type[0] != 'g'))
>+					continue;
>+				if (gt->info.type == XE_GT_TYPE_MEDIA &&
>+				    (entries[i].gt_type[0] != 'm'))
>+					continue;
>+			}
>+

and this becomes:

  	for (i = 0; i < count && p <= entries[i].platform; i++) {
  		if (p != entries[i].platform)
			continue;

		if (entries[i].gt_type != ANY_GT &&
		    gt->info.type != entries[i].gt_type)
		    	continue;

  		uc_fw->path = entries[i].path;
  		uc_fw->versions.wanted.major = entries[i].major;
  		uc_fw->versions.wanted.minor = entries[i].minor;
		...
	}

Lucas De Marchi

>-- 
>2.47.0
>
