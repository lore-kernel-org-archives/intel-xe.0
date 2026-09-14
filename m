Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C2FEC88E64
	for <intel-xe@archiver.kernel.org>; Mon, 14 Sep 2026 11:13:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 044E410ED2A;
	Mon, 14 Sep 2026 11:13:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n9JcFn43";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1106C10E552
 for <intel-xe@lists.freedesktop.org>; Mon, 14 Sep 2026 11:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789384438; x=1820920438;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=dHXwYOeukZlqNpZEIHym4ZtFfN0aYIcfUpbUXdvkYlI=;
 b=n9JcFn43oOxLFEfBVSmf7cK+c6UDfC1eJ8w34uD45860NWTJSr5s3Lzp
 ZWXAawZmOoX+OGfzA98qVSh7GVlgP74OUtlqBKNigLMbEWsRvIY/dPQx9
 nJBf0C1VYwSSlv6nt7p+/LLAh6ARgUBqUDXlASVbflm8qRlvlqJW1AlwX
 yBDwS0b38RABut38pYKvnVWHheYOXDvpI/ZF1NzguYXSwajsWwM2OYj7Y
 /QqyOTzsiQJ1dlpqszZRyVnunMgDxB5FTtarOEoFuFVrt0z5YP06z/I7C
 inmZXR0GHw5mhzwT1oHmWgy9CKus+gltjbLU0wgkZEsh3xuREjxwtKl1t w==;
X-CSE-ConnectionGUID: MzWlYW7rSAiIGczOP95vEg==
X-CSE-MsgGUID: YPxVWhU0TMmdWEAdoBTzag==
X-IronPort-AV: E=McAfee;i="6800,10657,11904"; a="239896"
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="239896"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa115.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2026 04:13:58 -0700
X-CSE-ConnectionGUID: uW6kKWx5S/qfbxPWBcw0JA==
X-CSE-MsgGUID: /dOTH1jFTqa98hy4BL7Lqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; d="scan'208";a="272111282"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2026 04:13:58 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 14 Sep 2026 04:13:57 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 14 Sep 2026 04:13:57 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.48) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 14 Sep 2026 04:13:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YcJQ12pz3yBLf9kEFCp6J+qIzyVP7E8gfnBab6C84x9CL/65M+gJ+zwJ2g7gyZ/hV9xXIOuxklbXJe7Tn3MyR5fIhBdHOzvuqEx7EqAJ74NTX9ALx4QiioQCLkof4pcfDVuI8hhjzZLFfVSapsJxB/Q+YuAG70LMN4pqryTz1s4yEYMqllhaU5LoEuhfj7lKKiS5sSHdl0fu39e+9ZgnjtQfAPpF3d0QzPJNOVNM9kfsGJKcxg9N4GK8vRx0t+oqqjqNDsGOXMV/ZJo+7DftNc5IfniGXXwYPkvmH53VL9R9CbpfXSVlMdwehdZ2WWJMOMdvh8pGPZPFf5dZYFgafQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d9mb0hBtuYxR0m1Lbi8fi+GKlHUw2bucH0lkwP5AOqQ=;
 b=MXoNGe2TNqOy5Cc0ZPJ7qBIaUn7KO1eXaMG1GP5knSoFJePvnnXlk9Vw/kBs9ujG9o0xUMi6Bh6QvonTZZFHh1F0tmj3ZnrjhJowVSMOgskA3o04sT5KAv6T0VbiS3LxwtZzgLHKxdHDmzQtsDylueLLN43hsk5SAbBZJf89PZLAaT6evV4ZpL5zjI/8+m1sqfaVnQVEdRK9zZAPqrUEpgYIlHInAM3ECYocK+mzwj3q11C7KPTLHEChRZuNyEOYAu3e2XB2iyFd7qV6mqzgnYjWJ7I7kH7MtflqfkmPbx2jxfiO/U/KWeMuksT2YFBkqqm6CGp/aT3tYgBYVfM23Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB8132.namprd11.prod.outlook.com (2603:10b6:8:17e::13)
 by IA1PR11MB6347.namprd11.prod.outlook.com (2603:10b6:208:388::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 11:13:50 +0000
Received: from DM4PR11MB8132.namprd11.prod.outlook.com
 ([fe80::22f3:a01e:fb45:57ac]) by DM4PR11MB8132.namprd11.prod.outlook.com
 ([fe80::22f3:a01e:fb45:57ac%6]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 11:13:50 +0000
Date: Mon, 14 Sep 2026 13:13:46 +0200
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/pf: Refactor VF LMEM BAR resize helper function
Message-ID: <aqfWzp8sodOBE4Ch@nostramo>
References: <20260911182306.14973-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260911182306.14973-1-michal.wajdeczko@intel.com>
X-ClientProxiedBy: VI1PR08CA0224.eurprd08.prod.outlook.com
 (2603:10a6:802:15::33) To DM4PR11MB8132.namprd11.prod.outlook.com
 (2603:10b6:8:17e::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB8132:EE_|IA1PR11MB6347:EE_
X-MS-Office365-Filtering-Correlation-Id: 438e9dac-d469-4199-5a8e-08df125140d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|10067099003|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: PhvY77vbnvu2q501Cv4fvwa6iPPjE7VJ2TYD/HKMQR4g0IZ+HN6x6f91v7TuBUkDMnPgQggZaclh4qIQHap7ixLqvoSf3T3o+5yE5+DiYdQ9UfjuY4pj8eLR0bPu4tmDf0dKaF9DkG5r0sEjT9ccdX7bjBr/BZc1uI1BEWfHwz7X98gB5RHyBclskD6RcRKAtZzMsB0uEgA4U10AARFJzmkLAZMrMBQYw/I09bV4ycqXdgrveNPV93yx1p4RFtHiYus/NCOi32z0RN8vRGoWH8q4t4MgBRm2a2Cfgu2zBBmhDsd6Y+YuPpbnIdWel0sbG/p7lFh2l8X2bx9nMJMpQNGrcQV0Oy0tkOhPrh8gorTfwJebipT5j5lnNiAkCcCh7fO9rxD6HAocgZkiDU7cGXeYp505fL9k/5zs//ZuJFg3iMGgLnCHE7IZzDb1tEkvSN3nsebbjl+vIIuwBcf6m1CbdUYC6lml8mEqgzxr16/QYmf3sySnU6WY5XeJ4Xy81hzP+qL2yUnjQKpiyn7ibieVdu+TGdaDVLkkyY1azujWL5nzcjSE+j96NzGi/xT1lc0QNVV1wGzED67MEWv1kgom5Gp0gePpPwFz2lqevisIAkTBpoLjCbVJw1IpVhOfxIGQyMd5CqkSaeN6elRJEuWGcHoUp4NFO0iYKK1dELo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8132.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(10067099003)(22082099003)(18002099003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SWF5WHRnU3ZWNlpsZUg0ZWVsTGh6SVZVaVYrc09lMzR3VFgxSU51eVFpTzdh?=
 =?utf-8?B?SjZXangyOVNXbkVXenhxTk43dTFKVXRZOEJkZDlKQ1lWQSsyTWY3eUk3angz?=
 =?utf-8?B?U0g2bjE5WDF3Y2RET2VxRHR4V00yTXcvazFEL250NUI2RVBPUTVDWjI2UGRK?=
 =?utf-8?B?aXBZb1ozQXdsWU5IbHptOHJITmlqTWk1cVBUSHdyZ0M2elA3Yk1tRTBFcFhx?=
 =?utf-8?B?OGduaDRnRFRuUzBOeSsxalZFTDZoc04rUmppZk9jK1hIZ1BjaEoxZG0wS2dG?=
 =?utf-8?B?OExNeWttM3dNUmJnejUrU0VENWwzaVd5dXg3SkcyOGpOd2QxVk96UnRJQnZH?=
 =?utf-8?B?U0ZqMzRuU3dCZ2lndDVDNnVXUFA4dWJ4bTRFMnNPWnR4cVZEQ1JwVkhXU09r?=
 =?utf-8?B?bFF6YzFobWFQVmNHT3luWWcveXkrNU1UUG1DVjB6dk0wekhGSm9yL1g4R294?=
 =?utf-8?B?Q3MwWVIyZGZpNnJtVGlpZVlPSWZ5RE9DZ3VBZ2tLc2VVZEJGS3dmWFVENnU5?=
 =?utf-8?B?WFoxN3RBRytBSXhyZDhNaThoQzdOODFVVEdOQTNxV2krVFlhRmg5aDE4R1lw?=
 =?utf-8?B?Q3hMcEtJQlY5MWtrSVRTUEQyZ1I4dENsWTBWdkpmUk9hQVNiVXV5NWgzYVRq?=
 =?utf-8?B?ZWc5QWdGUE9DNHkrdDFPdEVkbzRWMGw5SHFIcUtlNFZmb3d2aDgrNko2YU5j?=
 =?utf-8?B?eTM1QXhyVDFjWjE5Y1VBeFVIdjdsQnZEVUwzL1RCbGhnLzZVMHdtRzNnaVVX?=
 =?utf-8?B?T0ZmQ2RWamZsaUp1OUtmbE9QOTBBSGp1SExVdUlqakZ5azJ1RTFUeDM5Sml3?=
 =?utf-8?B?Z2E2NXRrMmFNd3RjOEJNbTVxMlJhMlFSWjFSblBDNjl1bk5uaU0zdDBZQlM4?=
 =?utf-8?B?QUM4REUwTGc3REN0cWRraVFKc3NGT2YweDgyYjUrQWlyc014bWdBU2ZHa3RQ?=
 =?utf-8?B?VEc2MnBhQkZWMWxISVlmbXBDV20xN2RKS3RGYmYyeTRGVW5xV2E1dnZha1Mv?=
 =?utf-8?B?MW1yeFpxMEg5QlE3aUM5WFB1UjZRVVIreFV4ajFRWUdsbTh6TUduTnN6SUFa?=
 =?utf-8?B?NWlrOHdQWkN6b3pMVkhSSXh6VFdCa2c1bkZVaFlpd1ljTGxXeFh1a1ZJOStR?=
 =?utf-8?B?Z3NCaHZEQ3pteFh6c1BPR1lEYXRtUzVHSE9tSG03ZVFvbVJPWVNtQmU3RXFX?=
 =?utf-8?B?N1g1dWt4TzNrTEVQWWZjNDM1b3U1V3JxcmZML05KVGsrUVN5T2s5UFJQQXdV?=
 =?utf-8?B?YUFaL3UrbkR4ZXdmaDd0WGdNZ3oxSlpRV2w0VlB2TGZxVGtRcjA0L0RVdmZ6?=
 =?utf-8?B?Tnk0bWdxYXo3bEF3K1EwT3Q4am01Y09aT1NUVEZVT2NRNCt1L2ZPK01aKzk4?=
 =?utf-8?B?MTI1Y1BVdVdQSUw4R3lReDJ1RnZkUUNsRzBvRlVKYTdpTjBTOWl2WkN4SjBm?=
 =?utf-8?B?dFhQbGtPQmI3OXpBbzdyOXZZVi9hVGNjNHEzZW0wUllXcmdqSkk5ekFtbFRt?=
 =?utf-8?B?VmpBazczMUZiSnlPaU5PSExFNU5JN0lRRzIzR3VOQjVRcTJNUEVtTTdZc3kr?=
 =?utf-8?B?d2Y5bFhpYS9VckZkckRURFo4c0VqM3NzazJoRFZZTGEyT0VtVE1rZkdDSnFK?=
 =?utf-8?B?RkE5TnlKa0ozVG9mMkVyY2hiak0vN2RYM214Y0xyQkRDaEhkNVd4OTFaRzVH?=
 =?utf-8?B?WDhIU1I3OUplMzl0dTBuU2hhVGlHLzdZWVBqVnFyY2ZkK3lXNVdNVkk3Y1cx?=
 =?utf-8?B?YkxpelRVWUlTa0VrOW1jQTZ2blZJU0U4TktDSEZ3bXdFVGtjSEpmN01zc2pi?=
 =?utf-8?B?cGlMbUNDMHZVOGszc0RKYVBxdjByU3dxNTd0ZjBlSWFlaFFuZndVL202eGYy?=
 =?utf-8?B?ZzBsRDRkYWgzVTJUYWd2OGhMKzBWaVZnUk5qZlhRZnQwWW1FbzlyVHNhSXRz?=
 =?utf-8?B?cHl3SjJERHFVR0dQUnZxSm9kZCtvMStQbzVlWEFVSXFEZU1Cenh0N3lhTVU5?=
 =?utf-8?B?ZDJHbURBMGZXYSszblhCbXBJZkh4aElMMG1WbndEYm5QYmZMY3JhelAxS2xq?=
 =?utf-8?B?bXFnSDhWYmV4emN1VGJHSEpvL0grYTU2ZEZKemgvYTAvd3J5ZjJ1NWRiZXcz?=
 =?utf-8?B?WDFiMEE2TlAvL2d2VmpIS2VIS3dsS25jZlYxN2JHSWRBV2F3dDIxSHpNZXBm?=
 =?utf-8?B?WFN4ZWRyYWNUL0Zqak55NHF4NkNKbG9ORjJwUFFmQkhzNnJuRGx5NGZJSWp6?=
 =?utf-8?B?WXd6a3ZiRjdQV3B2MlVVTW1heUpKRi8yREFEb0JsdXF2QXQ1MWtYa0VMbTJ4?=
 =?utf-8?B?U1ZzVVB6TUtvZGhCQmJrcE5JczVDclE5NnJqekZpODd1Y0QrQTIrUjVkWEN5?=
 =?utf-8?Q?x//7ajNkrsfXIc4M=3D?=
X-Exchange-RoutingPolicyChecked: A9LqTbNzNy0XafeEfviw0EFP2E/cpIzS09n0HwDFVqd2U4ivdbHeQTNvEcDZ61NbQfVRo0k3wjUaexx2nzVOxve0V6L0b4D1X74esjUAnpoklcdR2WiR7TXbBQ3uhPxwzfU5VLnfMksnpjPFUU47BsxE579/UWQxYE3s2aPzQoxLYAvD0ej3GrzK/oBZcFxhjKcMTWU4F7IJVjrXUtqqgUZRU/aH+jgZ6WGrNb7nnnfqeKECQHQJezyePLekF6il3Wep2LJuoq5l1HN/UJ/hJ5TLxZZgJE18mQAt2v1AU9fvkOPkLaeEwM9v9E0unInouTNF7TL03AP0SfC5Xcw+Zg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 438e9dac-d469-4199-5a8e-08df125140d2
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8132.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 11:13:50.2403 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vq0Ton3PXMCixjRwTxNimTvZg4izEE+gz6LC3VhVAH/2K2HilqxY8FxSQEQcBlErI2ANSbxcAosIcxOQk0q4RRaUk0nRf9rKF7RzqwfVAnk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6347
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

On Fri, Sep 11, 2026 at 08:23:06PM +0200, Michal Wajdeczko wrote:
> Improve and move diagnostics messages to the helper function to
> keep the caller function tidy.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

Reviewed-by: Michał Winiarski <michal.winiarski@intel.com>

Thanks,
-Michał

> ---
>  drivers/gpu/drm/xe/xe_pci_sriov.c | 27 ++++++++++++++++++++-------
>  1 file changed, 20 insertions(+), 7 deletions(-)
