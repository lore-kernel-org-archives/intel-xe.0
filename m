Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBAF5C55838
	for <intel-xe@archiver.kernel.org>; Wed,  5 Aug 2026 01:07:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77E4210EC3C;
	Wed,  5 Aug 2026 01:07:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C4d96fte";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2D8410EC3C
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Aug 2026 01:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785892075; x=1817428075;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=bj7B/cUW8Ir7cCZ1VcpgzCMEDDf84b/CJUvcp+tcS0o=;
 b=C4d96ftewtqW7yf02iWSZvjZsSB+Ec0d0a259AJ5XgABeG/Nyt9h8Zyy
 puj3fX2cK7dvP1XCDFTuO0KfuCD28cZvVVOcTVhh1GfDEceyeAWleA2UE
 hZouSFb32mFyQE94VD88K6kM5yCHjb/xAlFh/SzsROs1wnK3O4E/eLFX/
 iWNfdnqLqG8VjifLNcsemJoXQIlHKk7OR90CqSQt9/wvE1fPE/SmHX3xu
 l64LljLpnG6Zaj4eaGcKv88LvFmOBIG90Mw49QJduHeUZiwW7XyHs55nn
 5MXLmnu3O7A4vpseHWzKrNPhljkAOCXpFFGXfejl261FbjuLwAAPcjCY1 Q==;
X-CSE-ConnectionGUID: J/qFWwi+R9aC0weuIThOOQ==
X-CSE-MsgGUID: WMTr1SksRNW4IqebMbR01g==
X-IronPort-AV: E=McAfee;i="6800,10657,11865"; a="103860353"
X-IronPort-AV: E=Sophos;i="6.25,205,1779174000"; d="scan'208";a="103860353"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2026 18:07:53 -0700
X-CSE-ConnectionGUID: zIQGtnerTWi4P8N1gy+7wQ==
X-CSE-MsgGUID: 4b/1DBG0RJSPfUDN8kRFeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,205,1779174000"; d="scan'208";a="261724071"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2026 18:07:53 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 4 Aug 2026 18:07:52 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 4 Aug 2026 18:07:52 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.1) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 4 Aug 2026 18:07:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PB7XLYiUilHKEvTh76jSqW5zcPcarrOthXoPSXyXfqnuCP1LW8+MU+GDD7xeKr7Tod4AunxxxfblVC8pwI8+TtRNki+0z/68H7dCWvLkOwcIF+CMBEdX+TP4AbA1VQsx3csWbhZ0BSTjWkTUzBji3ZKQgKrGDraVh+hdWc0drE/WOosLrVS3I5qepew3kXXdrXY9ISXGe9sZSe9w136i8QpDxHB3gKbYxwYEt20CuafKhwYvJ15IXph3zNz+RH5VYEgkrDtiqDbpCBbhflffsdN7gvz+EEiWG1BNj7LoHDncHCJS7jRwBoO10AIBCvQY+q3wuQ9mpSr0Ziztv88B8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WOTqpFPioIfI0zfZUKmwC9bT9xx95HAhuS28Amx6bfc=;
 b=CJyH5QZczCS0JRr1lYVYfQrvJ1Pm2HW65wCWPCc0yuDMC6zRiprA2VBT4i27nfkj9fFIvkH2GMUD+D1EnlGZz5+ND4lasKYR5XnGROxZbtysk5XRLJ47zioGH3AnYpEeTBERGFWpzv6Dkb6hIaBnszuLm5RTrhfvsG/V9mblk3zX3rUyPEdLEozczUFUeR8GiB3GfGSZfHgv09x8YLbENaPvQq0oZ1bTv2Az02+G6tPO/Sy8bNlwXpyjTjGYOv0b9zThZksBDXO9NKftQGsGuN3j6Qy1ALyYt4AboizebkZN8wj7BdNUt/yUz77EwRv+Y82miQ4iNKaNnl0c2DLy4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5073.namprd11.prod.outlook.com (2603:10b6:303:92::23)
 by PH0PR11MB9610.namprd11.prod.outlook.com (2603:10b6:510:3b0::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.17; Wed, 5 Aug
 2026 01:07:49 +0000
Received: from CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe]) by CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe%7]) with mapi id 15.21.0292.013; Wed, 5 Aug 2026
 01:07:49 +0000
Date: Tue, 4 Aug 2026 21:07:44 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Zhanjun Dong <zhanjun.dong@intel.com>, "Souza, Jose" <jose.souza@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <julia.filipchuk@intel.com>,
 <matthew.brost@intel.com>
Subject: Re: [PATCH v7 2/2] drm/xe/guc: Compress GuC log and CTB dump with zstd
Message-ID: <anKM4GH-zVs3u6ez@intel.com>
References: <20260731155411.496975-1-zhanjun.dong@intel.com>
 <20260731155411.496975-3-zhanjun.dong@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260731155411.496975-3-zhanjun.dong@intel.com>
X-ClientProxiedBy: SJ0PR13CA0178.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::33) To CO1PR11MB5073.namprd11.prod.outlook.com
 (2603:10b6:303:92::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5073:EE_|PH0PR11MB9610:EE_
X-MS-Office365-Filtering-Correlation-Id: bc6904b8-c836-4e10-24ee-08def28df706
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|1800799024|3023799007|6133799003|10067099003|11063799006|5023799004|56012099006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: ZzqVojhHDnEqmwyQq4mzz/KnTN/iDjkG75QBHFtoDNBuLfy+8Q82BnZbhhLeSe6XMzGS5Rdid+2Vf0OGajxNSy4dsFAFB5Tn1+kcc9SebMdUzBvhVL50Z6ONcST6rkU0p+ZvSHop9yytzlddB0GdS0TAbOwcx9mP4m98AED4X83w4WsgkWumdKB5AodDqLR5jj6+pg/soJjJi+LG8ZKL7Wn7k0fwmtDC6rVgvRUCAnygM03qBX/aWGfd/Nr2Rz+/NvApwVEBvU+TjFzUYb8Olq+/W1bc57J4Mt2aBTOeAVmridP6ePl6QLkyvRgU6Hf7urkZCQAZmSlv/J0btH87hqawj83I1b5ihGIWHVTZk9qj9vw+/1v92H668K97doIFuH4apBCU2LiMceBz0Woki7TzamAYbynYqYRnPvL3/lFsUKNgu/02Urdn1sYRSsoL0g9OEiXZOM42c2wPq+1RjBfXchmsprjElfw6+Dn7tpPO9YG9K1z8FVz8zv14UI5Vge7EdpJLsI6VJ8EKQUn8iQ+Bn/iuLMBjfFkSSB+8cBYWjHCyEK8yYEuYyAsLo8mGQfugcvmTaOT+jfD0FhAXM7+zS6KkWBr2bs9tMqf3rhICMWpJ/CDsKKVJc+UQBSOjXeI2Y+Kf0TnIJDnlo4bY7r6XAh7Yf4+CcakoZ7kwIz8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5073.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(3023799007)(6133799003)(10067099003)(11063799006)(5023799004)(56012099006)(4143699003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?EQzQiVFWlh7JQC69tLKHcbBpodOdGjcfzhYVnN5OpZaLVVIj7Ja0eOhnm/?=
 =?iso-8859-1?Q?pDHV1yGCAM734f/f4/J6OUY7MCm0kqR1UOLT/qmZeeur2CCI1SyfZgyhcy?=
 =?iso-8859-1?Q?GuFNvalRKYhLKeCx96dnKimjuYkfdF+l/DDOJSZdPpLgInYgp8LUSKVIwX?=
 =?iso-8859-1?Q?N017boDhySxyH99sENvQ0FSVOD4KgywK/k63OmTZ/CcEma/N5NM1Az7pz8?=
 =?iso-8859-1?Q?NP4aots0o7mBBj5OjEVn9Wd5Rrbuzasp2Ce/wzXOwx3H1V0j8gYhWEDI9n?=
 =?iso-8859-1?Q?x+qppc6WaU1D1jH8Rm08SZp44MW7ZOxdr2H6JhhgTjcQKZqgRUH6r5oFBo?=
 =?iso-8859-1?Q?E7whiMvrpA4BIzf1mMrlQsM6DR0Pu8wkfGFLIsgacuTBTQRtMvqUU0eJ52?=
 =?iso-8859-1?Q?S2oTokUuB/4SRX3ka+l/38zzdCUKe7mjm/Vv3iNklM3yhZRmOuxRW+jxq9?=
 =?iso-8859-1?Q?YHLsBQOvNI7Ykb4QqFGY7vUB9qo5/aS5/rvYzBr0dC330QFZTn7SCMPVrl?=
 =?iso-8859-1?Q?5CODYGMvGTaFKcDcc49r2VCj42b4OBfdNcvVzcrPuvPss+tcJMRADzEdzt?=
 =?iso-8859-1?Q?MGP+TSj6YJF3k6/kvh1kLmBSQkyfZ+SRAPoAkj1qWwsTlcTbZ0NSTpj/vr?=
 =?iso-8859-1?Q?0Z8OVp25xnHXRsqyDBm8ZHgWfh03vwCycFRAtgjSkSBZ/xd1WR4QhpG0Py?=
 =?iso-8859-1?Q?cHJ3F12++bcDtQuQtXBMkyXqPWjAnrxF0CqUorfLbY9VmUbacqAxgZ3dd2?=
 =?iso-8859-1?Q?Goq3bvyxaaOlrFoNIKQpFDSUxnFd8VUPWppUSF4KEL6PRnanKmx04gho8C?=
 =?iso-8859-1?Q?SDJ5pE2XD6f9COE+P9ZLr7U3tHafghNN6Cf5bcWMfw9ezvnGPFgUJps4Fd?=
 =?iso-8859-1?Q?LqmbfZCWk0ZpVRDlsssxasgPWhhB1k1p5IC5R8qB3ISfVYXRsddWJ5TNyR?=
 =?iso-8859-1?Q?awaQ5bfQUsYS1Fi8wYLpSP7ShSZgTsLVd7jdTAEvNTuiGJDSNaJKXic024?=
 =?iso-8859-1?Q?+PakLOjvQOwnrW+XI4iYv60JdnBx/bx6roqAiziZl+oWGDmRP4KgCNAtwl?=
 =?iso-8859-1?Q?FdUp+jazccYfd6LtZYKIXciGKG1LPvimBdZC2ArIR8dMF9Tl0lroBFErHx?=
 =?iso-8859-1?Q?tKN7H5M6ohT+gfjI9m2qgRTSwH6LTuAfXnS8GfniZNIVjsoRoPiNvP9R1W?=
 =?iso-8859-1?Q?GPzi9QTRYD4lMMn8bRv+hSez/SdMjNRGL5XAc8FQat+XVgyxWRa9Yvzv/4?=
 =?iso-8859-1?Q?mmYMF5UrQTVb0XEYxl6rtTilB0DEnIwUUuJOR0JQ6QwAb9RwdnQV9jEb/N?=
 =?iso-8859-1?Q?MRlV1b9yjtMA6x5OGXMk1GoRvJq+ce6YVShcms2b33EPoMLF3kFvZh+lkS?=
 =?iso-8859-1?Q?nrFfO0ElZUqmXStn0+7ZRmlNHvLaZYuJRHdVk7QjcqLaLNQ+3XFb1Gj7Vr?=
 =?iso-8859-1?Q?vW/f4zUSBz2quavZFimVgDBn/yAU4Xhh+xxBAXfGwMCMrcw5PbPv6okgqp?=
 =?iso-8859-1?Q?VTLdoibSh+ggaqz2YtZy2AZ2aRa4z1yq9o+CryJ3ZK0FZiVz1+FuxtJdUx?=
 =?iso-8859-1?Q?fElxuhm6B5gTRug1LkAISGQ1+jJi8RqGoWMKhtmNKJfdQ6HbsIDmCixT2w?=
 =?iso-8859-1?Q?2XZNtOhURGNFLg0pU+mOpAiUNlCso5Hq2sXnTuVb+Y9qXByB4hezNQt6As?=
 =?iso-8859-1?Q?kBqK7wvMpgfhdmBC540DPw9qDzPXBjd9mV4F3V1qSwTli7kp+Dvx9L7ebI?=
 =?iso-8859-1?Q?8La3ugtFvprouZTAvwtHdOPgwAR6DxA1kGPijRoUzJ0+7jPXqw0BStJbIE?=
 =?iso-8859-1?Q?l0hh9DqC/Q=3D=3D?=
X-Exchange-RoutingPolicyChecked: B8A5usjy+fOgwPBzI5T6ORGcAK7uV/UOkWJX7iojLUl5mu1E7jMAi1UQtHX6z9BNSXf1u8yictirEPGhSGCNq/9IkwyMmeXli5EMEHojnZ3iDdiLpJbQl70fTTlj1/QM6KaGKeTabraSpikqVdUCk1mw9m5WDZsVL2mftGDD44C7EeXvFf3dmJr0TBZWiD0ka78JApzuJ0t1EFn2CpfA/9hadtUb8kS4K4AzXh8J+Qqs9ieIRLaKGZCX4m6/Cu8Ky0NQUlonePGKCbets7Joj7Cd38OQs5a7WK0ka9bNy9BZ2A+upKFUdtZgd9KaEh0xP6bcKtF9Yz7jRXJDRiWF3A==
X-MS-Exchange-CrossTenant-Network-Message-Id: bc6904b8-c836-4e10-24ee-08def28df706
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5073.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 01:07:49.3263 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X7636ckJDg3GVy7h7UhdkCiFFhVCz98UILIHs5kBHKtzwy5jVpNGcIDuZQWMf2EGDGhZ8yCs6SjhbFja0Cqkkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB9610
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

On Fri, Jul 31, 2026 at 11:54:11AM -0400, Zhanjun Dong wrote:
> With the default settings, the GuC log is several megabytes in size.
> Printing the entire log is time-consuming.

I'm not sure printing is the right/good wording here to be honest.

Stepping back a bit, is opening the file with uncompressed log time
consuming?
But then if you need to see the GuC log don't you have to go there
decompress and then open anyway?

What is actually the problem in the regular handling of GuC log?

> In debugging scenarios,
> printing the GuC log to dmesg while forwarding the dmesg output to a

Okay, kernel buf log was not made for that. This is an abuse anyway.

> serial console can take several minutes. It can also exhaust the storage
> allocated to CI logs.

But well, I understand the need. In some machines where the bug happened
perhaps the serial is the only output we can collect before the
machine is completely dead. This is why the GuC logs from dmesg was
never completely removed, but only hidden behind a config flag.

But well, if this is the problematic case, why can't we compress only when
we are spitting that to the kernel buf log? And leave devcoredump as is?

> Follow i915's approach and compress the GuC dump
> data to address these issues.

2 wrong don't make 1 right!

> 
> Replace the raw ascii85 dumps of GuC log snapshots with a
> zstd-compressed ascii85 stream and reuse the same helper for CTB
> snapshot output.
> 
> Use zstd streaming with the default compression level of 3 and an
> estimated source size of 0 so the compression workspace stays bounded
> even for multi-megabyte logs.
> 
> Add a new Kconfig option DRM_XE_COMPRESS_DUMP to control whether
> GuC log and CTB dumps are compressed with ZSTD. This allows users to
> choose between reduced dump sizes and lower memory usage.
> 
> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>

Cc: José Roberto de Souza <jose.souza@intel.com>

Jose, would this break the mesa decode tool or it is transparent
to that?

For Mesa use case, compressed GuC log works?

> ---
>  drivers/gpu/drm/xe/Kconfig          |  15 +++
>  drivers/gpu/drm/xe/xe_devcoredump.c |   4 +-
>  drivers/gpu/drm/xe/xe_guc_ct.c      |  19 ++--
>  drivers/gpu/drm/xe/xe_guc_ct.h      |   4 +-
>  drivers/gpu/drm/xe/xe_guc_log.c     | 161 +++++++++++++++++++++++++---
>  drivers/gpu/drm/xe/xe_guc_log.h     |   9 +-
>  6 files changed, 183 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
> index 4d7dcaff2b91..18a682a44b31 100644
> --- a/drivers/gpu/drm/xe/Kconfig
> +++ b/drivers/gpu/drm/xe/Kconfig
> @@ -33,6 +33,7 @@ config DRM_XE
>  	select ACPI_WMI if X86 && ACPI
>  	select SYNC_FILE
>  	select CRC32
> +	select ZSTD_COMPRESS if DRM_XE_COMPRESS_DUMP
>  	select SND_HDA_I915 if SND_HDA_CORE
>  	select CEC_CORE if CEC_NOTIFIER
>  	select VMAP_PFN
> @@ -101,6 +102,20 @@ config DRM_XE_PAGEMAP
>  
>  	  If in doubt say "Y".
>  
> +config DRM_XE_COMPRESS_DUMP
> +	bool "Enable ZSTD compression for error dumps"
> +	depends on DRM_XE
> +	default y
> +	help
> +	  Enable this option to compress GuC log and CTB dumps with ZSTD
> +	  compression. This can significantly reduce the size of error dumps
> +	  but requires additional memory for compression workspace.
> +
> +	  Disable this option if you want to save memory or prefer uncompressed
> +	  error dumps for debugging.
> +
> +	  If in doubt say "Y".
> +
>  config DRM_XE_FORCE_PROBE
>  	string "Force probe xe for selected Intel hardware IDs"
>  	depends on DRM_XE
> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
> index 5f2b90b18f97..27473c25aad2 100644
> --- a/drivers/gpu/drm/xe/xe_devcoredump.c
> +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
> @@ -115,9 +115,9 @@ static ssize_t __xe_devcoredump_read(char *buffer, ssize_t count,
>  	drm_printf(&p, "\tTile: %d\n", ss->gt->tile->id);
>  
>  	drm_puts(&p, "\n**** GuC Log ****\n");
> -	xe_guc_log_snapshot_print(ss->guc.log, &p);
> +	xe_guc_log_snapshot_print(ss->guc.log, &p, ss->gt);
>  	drm_puts(&p, "\n**** GuC CT ****\n");
> -	xe_guc_ct_snapshot_print(ss->guc.ct, &p);
> +	xe_guc_ct_snapshot_print(ss->guc.ct, &p, ss->gt);
>  
>  	drm_puts(&p, "\n**** Contexts ****\n");
>  	xe_guc_exec_queue_snapshot_print(ss->ge, &p);
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index fe70c0fd85c5..19314184798c 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -2135,11 +2135,12 @@ struct xe_guc_ct_snapshot *xe_guc_ct_snapshot_capture(struct xe_guc_ct *ct)
>   * xe_guc_ct_snapshot_print - Print out a given GuC CT snapshot.
>   * @snapshot: GuC CT snapshot object.
>   * @p: drm_printer where it will be printed out.
> + * @gt: GT structure for error reporting
>   *
>   * This function prints out a given GuC CT snapshot object.
>   */
>  void xe_guc_ct_snapshot_print(struct xe_guc_ct_snapshot *snapshot,
> -			      struct drm_printer *p)
> +			      struct drm_printer *p, struct xe_gt *gt)
>  {
>  	if (!snapshot)
>  		return;
> @@ -2153,11 +2154,10 @@ void xe_guc_ct_snapshot_print(struct xe_guc_ct_snapshot *snapshot,
>  		drm_printf(p, "\tg2h outstanding: %d\n",
>  			   snapshot->g2h_outstanding);
>  
> -		if (snapshot->ctb) {
> -			drm_printf(p, "[CTB].length: 0x%zx\n", snapshot->ctb_size);
> -			xe_print_blob_ascii85(p, "[CTB].data", '\n',
> -					      snapshot->ctb, 0, snapshot->ctb_size);
> -		}
> +		if (snapshot->ctb)
> +			xe_guc_print_blob(gt, p, "[CTB]", "[CTB].data",
> +					  &snapshot->ctb, 1,
> +					  snapshot->ctb_size, snapshot->ctb_size);
>  	} else {
>  		drm_puts(p, "CT disabled\n");
>  	}
> @@ -2191,9 +2191,10 @@ void xe_guc_ct_snapshot_free(struct xe_guc_ct_snapshot *snapshot)
>  void xe_guc_ct_print(struct xe_guc_ct *ct, struct drm_printer *p, bool want_ctb)
>  {
>  	struct xe_guc_ct_snapshot *snapshot;
> +	struct xe_gt *gt = ct_to_gt(ct);
>  
>  	snapshot = guc_ct_snapshot_capture(ct, false, want_ctb);
> -	xe_guc_ct_snapshot_print(snapshot, p);
> +	xe_guc_ct_snapshot_print(snapshot, p, gt);
>  	xe_guc_ct_snapshot_free(snapshot);
>  }
>  
> @@ -2291,10 +2292,10 @@ static void ct_dead_print(struct xe_dead_ct *dead)
>  	drm_printf(&lp, "\tTile: %d\n", gt->tile->id);
>  
>  	drm_puts(&lp, "**** GuC Log ****\n");
> -	xe_guc_log_snapshot_print(dead->snapshot_log, &lp);
> +	xe_guc_log_snapshot_print(dead->snapshot_log, &lp, gt);
>  
>  	drm_puts(&lp, "**** GuC CT ****\n");
> -	xe_guc_ct_snapshot_print(dead->snapshot_ct, &lp);
> +	xe_guc_ct_snapshot_print(dead->snapshot_ct, &lp, gt);
>  
>  	drm_puts(&lp, "Done.\n");
>  }
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
> index 767365a33dee..2005d1a0cd6c 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.h
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.h
> @@ -10,6 +10,7 @@
>  
>  struct drm_printer;
>  struct xe_device;
> +struct xe_gt;
>  
>  int xe_guc_ct_init_noalloc(struct xe_guc_ct *ct);
>  int xe_guc_ct_init(struct xe_guc_ct *ct);
> @@ -24,7 +25,8 @@ void xe_guc_ct_flush_and_stop(struct xe_guc_ct *ct);
>  void xe_guc_ct_fast_path(struct xe_guc_ct *ct);
>  
>  struct xe_guc_ct_snapshot *xe_guc_ct_snapshot_capture(struct xe_guc_ct *ct);
> -void xe_guc_ct_snapshot_print(struct xe_guc_ct_snapshot *snapshot, struct drm_printer *p);
> +void xe_guc_ct_snapshot_print(struct xe_guc_ct_snapshot *snapshot, struct drm_printer *p,
> +			      struct xe_gt *gt);
>  void xe_guc_ct_snapshot_free(struct xe_guc_ct_snapshot *snapshot);
>  void xe_guc_ct_print(struct xe_guc_ct *ct, struct drm_printer *p, bool want_ctb);
>  
> diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
> index 538d4df0f7aa..aaeb0f76af30 100644
> --- a/drivers/gpu/drm/xe/xe_guc_log.c
> +++ b/drivers/gpu/drm/xe/xe_guc_log.c
> @@ -6,6 +6,9 @@
>  #include "xe_guc_log.h"
>  
>  #include <linux/fault-inject.h>
> +#if IS_ENABLED(CONFIG_DRM_XE_COMPRESS_DUMP)
> +#include <linux/zstd.h>
> +#endif
>  
>  #include <linux/utsname.h>
>  #include <drm/drm_managed.h>
> @@ -225,16 +228,148 @@ struct xe_guc_log_snapshot *xe_guc_log_snapshot_capture(struct xe_guc_log *log,
>  	return snapshot;
>  }
>  
> +#if IS_ENABLED(CONFIG_DRM_XE_COMPRESS_DUMP)
> +static void xe_guc_print_blob_compressed(struct xe_gt *gt, struct drm_printer *p,
> +					 const char *length_label, const char *data_label,
> +					 void **chunks, int num_chunks,
> +					 size_t chunk_size, size_t total_size)
> +{
> +	zstd_parameters params;
> +	zstd_cstream *cstream;
> +	zstd_out_buffer outbuf;
> +	size_t wksp_size, dst_size;
> +	size_t remain, ret;
> +	void *wksp = NULL;
> +	char *dst = NULL;
> +	int i;
> +
> +	/*
> +	 * Pass 0 as estimated_src_size to use zstd level-3 defaults
> +	 * (windowLog=18, 256KB window). Passing the full total_size would
> +	 * cause zstd to inflate windowLog proportionally (e.g. windowLog=24
> +	 * for a 19MB log), making the workspace tens of MB.  With 0, the
> +	 * workspace stays ~1.5MB, well within kmalloc limits.
> +	 */
> +	params = zstd_get_params(3, 0);
> +
> +	wksp_size = zstd_cstream_workspace_bound(&params.cParams);
> +	wksp = kvzalloc(wksp_size, GFP_KERNEL);
> +	if (!wksp)
> +		goto err;
> +
> +	dst_size = zstd_compress_bound(total_size);
> +	dst = kvzalloc(dst_size, GFP_KERNEL);
> +	if (!dst)
> +		goto err;
> +
> +	cstream = zstd_init_cstream(&params, 0, wksp, wksp_size);
> +	if (!cstream) {
> +		xe_gt_err(gt, "failed to init zstd cstream\n");
> +		goto err;
> +	}
> +
> +	outbuf.dst = dst;
> +	outbuf.size = dst_size;
> +	outbuf.pos = 0;
> +
> +	remain = total_size;
> +	for (i = 0; i < num_chunks && remain; i++) {
> +		size_t size = min(chunk_size, remain);
> +		zstd_in_buffer inbuf = { .src = chunks[i], .size = size, .pos = 0 };
> +
> +		while (inbuf.pos < inbuf.size) {
> +			ret = zstd_compress_stream(cstream, &outbuf, &inbuf);
> +			if (ZSTD_isError(ret)) {
> +				xe_gt_err(gt, "zstd_compress_stream failed: %s\n",
> +					  ZSTD_getErrorName(ret));
> +				goto err;
> +			}
> +		}
> +		remain -= size;
> +	}
> +
> +	do {
> +		ret = zstd_end_stream(cstream, &outbuf);
> +		if (ZSTD_isError(ret)) {
> +			xe_gt_err(gt, "zstd_end_stream failed: %s\n",
> +				  ZSTD_getErrorName(ret));
> +			goto err;
> +		}
> +	} while (ret > 0 && outbuf.pos < outbuf.size);
> +
> +	drm_printf(p, "%s.length: 0x%zx -> 0x%zx Algo: ZSTD\n",
> +		   length_label, total_size, outbuf.pos);
> +	xe_print_blob_ascii85(p, data_label, '\n', dst, 0,
> +			      DIV_ROUND_UP(outbuf.pos, sizeof(u32)) * sizeof(u32));
> +	goto out;
> +
> +err:
> +	drm_printf(p, "%s.length: 0x%zx Algo: ERROR (compression failed)\n",
> +		   length_label, total_size);
> +out:
> +	kvfree(dst);
> +	kvfree(wksp);
> +}
> +#endif
> +
>  /**
> - * xe_guc_log_snapshot_print - dump a previously saved copy of the GuC log to some useful location
> - * @snapshot: a snapshot of the GuC log
> - * @p: the printer object to output to
> + * xe_guc_print_blob - Print binary data (compressed or uncompressed) as ascii85
> + * @gt: GT structure for error reporting
> + * @p: drm_printer for output
> + * @length_label: label prefix for the length/metadata line (e.g. "[LOG]" or "[CTB]")
> + * @data_label: label for the ascii85 blob (e.g. "[LOG].data" or "[CTB].data")
> + * @chunks: array of pointers to source data chunks
> + * @num_chunks: number of elements in @chunks
> + * @chunk_size: nominal size of each chunk; the last chunk may hold fewer valid bytes
> + * @total_size: total uncompressed byte count across all chunks
> + *
> + * If CONFIG_DRM_XE_COMPRESS_DUMP is enabled, compresses @total_size bytes using
> + * zstd level-3 streaming compression and prints the result via @p using ascii85
> + * encoding. Otherwise, directly prints the uncompressed data.
> + * On failure the function returns without printing the data blob.
>   */
> -void xe_guc_log_snapshot_print(struct xe_guc_log_snapshot *snapshot, struct drm_printer *p)
> +void xe_guc_print_blob(struct xe_gt *gt __maybe_unused, struct drm_printer *p,
> +		       const char *length_label, const char *data_label,
> +		       void **chunks, int num_chunks,
> +		       size_t chunk_size, size_t total_size)
>  {
> +#if IS_ENABLED(CONFIG_DRM_XE_COMPRESS_DUMP)
> +	xe_guc_print_blob_compressed(gt, p, length_label, data_label,
> +				     chunks, num_chunks, chunk_size, total_size);
> +#else
>  	size_t remain;
>  	int i;
>  
> +	drm_printf(p, "%s.length: 0x%zx Algo: RAW\n", length_label, total_size);
> +
> +	/*
> +	 * Print each chunk directly without merging into a single buffer.
> +	 * xe_print_blob_ascii85() supports multiple calls - use suffix=0
> +	 * for all but the last chunk to omit the newline between chunks.
> +	 */
> +	remain = total_size;
> +	for (i = 0; i < num_chunks && remain; i++) {
> +		size_t size = min(chunk_size, remain);
> +		const char *prefix = i ? NULL : data_label;
> +		/* Add suffix only on the last chunk */
> +		char suffix = (remain == size) ? '\n' : 0;
> +
> +		xe_print_blob_ascii85(p, prefix, suffix, chunks[i], 0,
> +				      DIV_ROUND_UP(size, sizeof(u32)) * sizeof(u32));
> +		remain -= size;
> +	}
> +#endif
> +}
> +
> +/**
> + * xe_guc_log_snapshot_print - dump a previously saved copy of the GuC log to some useful location
> + * @snapshot: a snapshot of the GuC log
> + * @p: the printer object to output to
> + * @gt: GT structure of the GuC log
> + */
> +void xe_guc_log_snapshot_print(struct xe_guc_log_snapshot *snapshot, struct drm_printer *p,
> +			       struct xe_gt *gt)
> +{
>  	if (!snapshot) {
>  		drm_printf(p, "GuC log snapshot not allocated!\n");
>  		return;
> @@ -248,16 +383,9 @@ void xe_guc_log_snapshot_print(struct xe_guc_log_snapshot *snapshot, struct drm_
>  	drm_printf(p, "GuC timestamp: 0x%08llX [%llu]\n", snapshot->stamp, snapshot->stamp);
>  	drm_printf(p, "Log level: %u\n", snapshot->level);
>  
> -	drm_printf(p, "[LOG].length: 0x%zx\n", snapshot->size);
> -	remain = snapshot->size;
> -	for (i = 0; i < snapshot->num_chunks; i++) {
> -		size_t size = min(GUC_LOG_CHUNK_SIZE, remain);
> -		const char *prefix = i ? NULL : "[LOG].data";
> -		char suffix = i == snapshot->num_chunks - 1 ? '\n' : 0;
> -
> -		xe_print_blob_ascii85(p, prefix, suffix, snapshot->copy[i], 0, size);
> -		remain -= size;
> -	}
> +	xe_guc_print_blob(gt, p, "[LOG]", "[LOG].data",
> +			  snapshot->copy, snapshot->num_chunks,
> +			  GUC_LOG_CHUNK_SIZE, snapshot->size);
>  }
>  
>  static inline void lfd_output_binary(struct drm_printer *p, char *buf, int buf_size)
> @@ -598,12 +726,13 @@ void xe_guc_log_print_dmesg(struct xe_guc_log *log)
>  void xe_guc_log_print(struct xe_guc_log *log, struct drm_printer *p)
>  {
>  	struct xe_guc_log_snapshot *snapshot;
> +	struct xe_gt *gt = log_to_gt(log);
>  
>  	drm_printf(p, "**** GuC Log ****\n");
>  
>  	snapshot = xe_guc_log_snapshot_capture(log, false);
> -	drm_printf(p, "CS reference clock: %u\n", log_to_gt(log)->info.reference_clock);
> -	xe_guc_log_snapshot_print(snapshot, p);
> +	drm_printf(p, "CS reference clock: %u\n", gt->info.reference_clock);
> +	xe_guc_log_snapshot_print(snapshot, p, gt);
>  	xe_guc_log_snapshot_free(snapshot);
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_guc_log.h b/drivers/gpu/drm/xe/xe_guc_log.h
> index 4649a260755e..3e97647ee8b5 100644
> --- a/drivers/gpu/drm/xe/xe_guc_log.h
> +++ b/drivers/gpu/drm/xe/xe_guc_log.h
> @@ -11,6 +11,7 @@
>  
>  struct drm_printer;
>  struct xe_device;
> +struct xe_gt;
>  
>  #if IS_ENABLED(CONFIG_DRM_XE_DEBUG_GUC)
>  #define XE_GUC_LOG_EVENT_DATA_BUFFER_SIZE	SZ_16M
> @@ -59,7 +60,13 @@ void xe_guc_log_print(struct xe_guc_log *log, struct drm_printer *p);
>  void xe_guc_log_print_lfd(struct xe_guc_log *log, struct drm_printer *p);
>  void xe_guc_log_print_dmesg(struct xe_guc_log *log);
>  struct xe_guc_log_snapshot *xe_guc_log_snapshot_capture(struct xe_guc_log *log, bool atomic);
> -void xe_guc_log_snapshot_print(struct xe_guc_log_snapshot *snapshot, struct drm_printer *p);
> +
> +void xe_guc_print_blob(struct xe_gt *gt, struct drm_printer *p, const char *length_label,
> +		       const char *data_label, void **chunks, int num_chunks,
> +		       size_t chunk_size, size_t total_size);
> +
> +void xe_guc_log_snapshot_print(struct xe_guc_log_snapshot *snapshot, struct drm_printer *p,
> +			       struct xe_gt *gt);
>  void xe_guc_log_snapshot_free(struct xe_guc_log_snapshot *snapshot);
>  
>  static inline u32
> -- 
> 2.34.1
> 
