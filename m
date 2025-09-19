Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6FC0CAC59A
	for <intel-xe@archiver.kernel.org>; Fri, 19 Sep 2025 21:27:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87BD010EA9A;
	Fri, 19 Sep 2025 21:27:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OwC5AXkn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 870FE10EA9A
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Sep 2025 21:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758317233; x=1789853233;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ouel40lyOtPI//QEbuvFblBKtq/GsUJYcYISzmtoW4g=;
 b=OwC5AXknjod6wPXJj794TpK5fLG7QyNOMAeVLYT2F34HtOMX8rBLoiS8
 f/fq/byNKRBVU9+zfDrVFrcAl7dy4AfTIUq5v3zaChEAsLasye/46acq7
 VyIL3+UFx0vmo/sPiojKdITC93oSG5AaSxigvZEzTDG4uh3tTe+6FlMGO
 eKetxQHQyQtR907oYTGsF7T+vKzNOfhQXfGI0JDi9Ns5/BWuFWMhsB0KU
 US8j7VOEardDHZhtr64Ky+VEKAstr70kwfEwtLjuYV0yOAalZpvaJJ70O
 KrTd20YskMe3ZMvbYHk0L0s5BEw0o2RMQe2pz4f20JerHiFIjgUs0parV w==;
X-CSE-ConnectionGUID: NRYtFcepRQWd9AFV9lZm3A==
X-CSE-MsgGUID: uC0LrhwpRDCP8X5+c+THNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11558"; a="71296729"
X-IronPort-AV: E=Sophos;i="6.18,279,1751266800"; d="scan'208";a="71296729"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2025 14:27:13 -0700
X-CSE-ConnectionGUID: o8paLOGkS1qGvR4+d6OfTQ==
X-CSE-MsgGUID: VXtFSaNWR0+dSZfBc2yvOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,279,1751266800"; d="scan'208";a="176373030"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2025 14:27:13 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 19 Sep 2025 14:27:12 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Fri, 19 Sep 2025 14:27:12 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.28) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 19 Sep 2025 14:27:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g9/eCL8omn3OuoPpffyPa7wOwFi5fwtTXdV4pAxOaZtHMgIynngQWcF2eXXdArjei4JqXOfXxt/oLDgoWq2se9MlJKJ9SPrfI2hGGafwt5Qk9k7UOGR2GGQTQDKhKU2RYudrlpMRWOOdbC9ErkaYIgKUX2WEsmZW19ulsRd1CNKGn31L3suuqh3XwvlWN3TVJ4fCno2As1RfwjFtwUW/mIi6S9hys6MTEGBNey2jwvcfULz6rX7ciLHx2IAqsB562xCy1ohA0d7j1PB925RLEKhwCfQaQdJKvcceiTDqfisgCvt4cPXgC+0KoHMNGqj76YJ0ycGLZNIjPUfz04pIGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yv5A8Hww92F6cqcr1JYEfZH939j7EjFdkkQLp4A4nlg=;
 b=CzVBJfHA27YGvrA2kgcHCaMkTMm35ZP1hQwDFjY6anSgKjrO0y5f0Q5JLOrKugc/euzifZM21wm/kYChf/glVbhf2s1TSsH1YYuBMVVd0d1wAYkGyAVarypO32o5UQKknxKXmHCW0Ac0GVZmdR/fliVpmN65caGatpkLE0PGt0YshuemVQgPFU2IVpXaGfXEPx8BiMKFYcYev/T78hSda+vUHZuxTwq9e6fEJq9srvGR133dMDPGECYaveTsadnvls9zMOVPrmMjQi/Gc79zG3Mgfzv4/1OtOn/hmrf8Sou1X5o07DmK5x4ht5vuHWAZN+eGQ7e7nBCVZclPNtOAUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by IA4PR11MB9129.namprd11.prod.outlook.com (2603:10b6:208:55e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.21; Fri, 19 Sep
 2025 21:27:08 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9137.012; Fri, 19 Sep 2025
 21:27:08 +0000
Date: Fri, 19 Sep 2025 17:27:05 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/2] drm/xe/debugfs: Improve .show() helper for GT-based
 attributes
Message-ID: <aM3KqUnWloi38riK@intel.com>
References: <20250919160430.573-1-michal.wajdeczko@intel.com>
 <20250919160430.573-3-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250919160430.573-3-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR13CA0201.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::26) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|IA4PR11MB9129:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e295942-1845-4f82-bcf9-08ddf7c34976
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+7KYIDLi/tJm0RIwQ9Zxn8I4Kv+OjMm2QjCn/KncIAOOP2aW+fbQ3br7zl6H?=
 =?us-ascii?Q?fdRJRXeHMMV+2ov9AKDWdyIk8EbKy7w0HEDp+ahFBFA/38NglVwVv9IEAACT?=
 =?us-ascii?Q?4z0Oym/qjodyfccDrHI53asfS8/vmbU2z8HbBWuY0ulhu87hRE01n3xGfhTg?=
 =?us-ascii?Q?QmT21aQhfZvHraew1iaGU6Rz/iBO1zUZ83riuCDqqNQxV9SO0oS8yWR/TvoB?=
 =?us-ascii?Q?Xq2xDpdh2GNBSvZDhoJOEFSDCPMwiIoM6GC0qP6ia79qOTKgW899/cUd5L9E?=
 =?us-ascii?Q?T0xgiJCrV6hYMI/Twr5ScwfMExY8gkPOkEn6oIM0ImwFroQYdFmdZunrzwOs?=
 =?us-ascii?Q?uHq5DDGXNAFERL5BaIqAzwsduK83mFU0V+Ac2QyO7dwWp0utfCFnmWk+ic6E?=
 =?us-ascii?Q?517nSrwyAeFQGxjPjzTlSJvaHfo3hvsfMvyim1/kFELa63Pz5krs+oejkt0Y?=
 =?us-ascii?Q?ILShBpROgsrO97HVnDSdyzlgGshaEIOL3I+q9vtbCosojkHMJxsvZrJCEK15?=
 =?us-ascii?Q?IMPjTFl5b2nxXAUcmL+JaTwl2AxDtL+0ENCtxolVR7ISNgY3XtZEYy8s6sjO?=
 =?us-ascii?Q?aYxcAF3x023+ypb1cs3pE+wbmkuuUwpMn4kuVgzNS0+2FZljkAXIYV+YJ9Ek?=
 =?us-ascii?Q?8hEcHL8kYr3vWLdBlaP1k9rQ3Xlq8K9w8lQZ0msTpCq24gGTez6UkkHqssOX?=
 =?us-ascii?Q?YA21ze4PExGvU2u6nNumBSb3RnBRucgYozTUS0ZcTHJZ/XhDwRik4Oti4krt?=
 =?us-ascii?Q?BWWwlwvzzhZGdGd2Ul3ZfcnNnV2I79zmLovjjlT0Gm5BXP2TaP+KvK2ZIDDu?=
 =?us-ascii?Q?GOD4tQWbrrZv0sQpuLAYzMvK6fx3tAu+CnHqR0djvxg1Ql7nFYmAzkghLsLH?=
 =?us-ascii?Q?qH4iUN1XFOJMCWQlD+aJUvWAAIPkL4Lw+9mtc/N2KY+A9BMxaaYQk9u9ciRA?=
 =?us-ascii?Q?tuoOwzOgfTMjvGDB07YtQml+R48/FOX2eI6mvSkDDwg7mghU8SoO8ii1eC6R?=
 =?us-ascii?Q?kLAt1Si0DceLZyeNLw+bTr/oYUB4ysO0HAXun8FPjfk0R2JoIoZazP9RjD/L?=
 =?us-ascii?Q?vz+W83RK1/job6bFhN5xiLailo8CbxRsulkMfncVGozesuhSmJMhvx0dpKd1?=
 =?us-ascii?Q?hmxLYlLoWQA+WBsx/A7GoeD/it4fPZd6cTmDcfD4aZAnKhw/k+sHOecF1LZ9?=
 =?us-ascii?Q?JbwfQQLENxzI+wjjMrVKdUVWLuJZxPMkpOAOHaG4Hu6hCpn88Z8hHJH713oC?=
 =?us-ascii?Q?WaLpyQl2GiP7V8BygsEVOvQ+wP9u3yU/zE4egqATAQijRjiYdODuZ/EbmgaQ?=
 =?us-ascii?Q?dbSwDx7+NI3bJTgAiPHR4FQzbCx/2/5VjDfb4is2DLNDQTSG4oZflZzMQS7Y?=
 =?us-ascii?Q?lpnO5kdLNPfal+VwztJqwUq3B9D9fbkUpubtwjiI+k7ckz6jKH3O0rCg8J3Y?=
 =?us-ascii?Q?GPl5ZXcd9cA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UQ/Hp0z+kXS/7pmthL12ABKYAOPN0NhtmAoaj1Hh3VoLEdEEwWNamu8gvnrc?=
 =?us-ascii?Q?3rvyXoxiY+PdpECjjIZlM08i8JYQtKbIiMRkHj74FNkRhhJNMLLbegyciVny?=
 =?us-ascii?Q?hh5xcqUITn8zF8qvYRGcvxG2cOXvQtarvmZ671WrjAXsmYuxy/AJPwEHKnvT?=
 =?us-ascii?Q?BStExDPLL0u3TKcNh65VJMxLqblC4Klyb7S7Dwk6fbJpzyE6CWM9KKFsqAu0?=
 =?us-ascii?Q?J2EllFxLTGOUJopeF64Z1ldWTmVQL7a+vdwP4niHwkx7b5LpeNv5gq5fPGD+?=
 =?us-ascii?Q?C0UZjEjbkzqsZTVh5obLa+MrWQdKTv6VycnJPJfcbbbQWLJK01VX56etqoGW?=
 =?us-ascii?Q?UOR7RJ0SEeiPcOzTgg13URcNWmW9PKUulbGq9+kcw6WpIOozcxrA3e80crrn?=
 =?us-ascii?Q?q09g0bFczR4t83xR0lF7Q+ZC9lLC5UTVJPtagRX1DFg8NxcJfSE7byNFHKas?=
 =?us-ascii?Q?WyMcqrcES76e6ZCBWvbe/z/hPqba2PwmgK8nqovcWGoTpcrEVa8PKNnra1K9?=
 =?us-ascii?Q?lH1/ilNzJ1emAQVQdH8XXJ6G//Qy/S1fvS9aS/IXLTNlCqkZlOM0xY66OKiC?=
 =?us-ascii?Q?ShgzpftI0BWPhWVNKB0j0zmBZO2XZdqMSgdhwgvgYCII+HmcK2VI2lPsOT82?=
 =?us-ascii?Q?LpIeODAVkr+vaPvq8QVFRWtckuIohZxM4i/HmFPMnrzOrPPunfmO3l9g/63V?=
 =?us-ascii?Q?V3hLBCdsyz3qLeY8OGfWFcr7dxTeSVmum8w5S/g0lnOEj4044I7q3MS6CxgR?=
 =?us-ascii?Q?z7OdhBi0VWj6KwwkmwlHymEM9tVBFb7cjRaXP8qSs0+u+vNMPKpldL2ONluC?=
 =?us-ascii?Q?TtC8o+AgTKptLyGTyo7wsUTGxhbLXQ+ra2+bR/TKFId41mwFLAxId8tI39B7?=
 =?us-ascii?Q?eoLDKLfsVzUJ/lcXwAHkhrqlgqRhySQzv3Gy0VSwJBC71siAB9Wz0ISzB98C?=
 =?us-ascii?Q?lZ6zNwSc3+UDU9L/poBR2fGLfDci0KVZpV2o/K/ufzWwipmG0hJwE5IC3pcw?=
 =?us-ascii?Q?uMaFLcwXeb4ESZr+PteC8ecAONwsV4vIjUw+go4oyNxvzwyeapDkEsWmMUg2?=
 =?us-ascii?Q?u+BU8QsVVBAobw8dq/U5+4oJwhb6jLVlXR4+5CKfhUleG0sLOwxSAOImjp68?=
 =?us-ascii?Q?gSe7zPp+nTutOgNqe44CS8lo/f+ctEI/gIhTqESdO6TYlszBWcb3+MTv9RLV?=
 =?us-ascii?Q?It9oEI1OgOR1NnHAs+qBpIMpGjYujIwaVgb1W6l2sQ6rtWEnrGs/1URHe7Zd?=
 =?us-ascii?Q?1XiXroke/Vkjv+N5GyDATahLK9GDQqIddxKGusClCrpklC7Bwt/ZcpBR1ND4?=
 =?us-ascii?Q?j4i9/pDsNp1gDR/hEuCl07dQ4+2ElQdBjGl3TjnN9GJxpCD6hHcouweIopYH?=
 =?us-ascii?Q?1cbWcdM0ifmVfzZC0uQ71oI0L3o/GLO74XjTLwggzLheeMbenzsn71nB1972?=
 =?us-ascii?Q?EDbK3fnNc9O0A7iAv7qu90dRIR7H/b3wVdqgKZ8ABNUTPEUrt27ReI5ZP3bS?=
 =?us-ascii?Q?rgZGsxS1e1Tplth6kagwrbV3wY+oxmCyQulNUjBkdbip9LejogzuvNXmrwpO?=
 =?us-ascii?Q?tNG+pgQ+8lGTAvph6C6QMFl2UB7qZsKIW49xZHH8sGCwdK/i2Tw6HO5+BCs8?=
 =?us-ascii?Q?Pg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e295942-1845-4f82-bcf9-08ddf7c34976
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2025 21:27:08.2342 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oDs0kq95D2GaMRDrRGs8BTMBLCsrHBMZEjmOFcPykMYzdFLoRBmxdr0mHwwcJlDfdH1OkiU3WCKz2ZcjCiRZMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9129
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

On Fri, Sep 19, 2025 at 06:04:30PM +0200, Michal Wajdeczko wrote:
> Like we did for tile-based attributes, introduce separate show()
> helper that implicitly takes an RPM reference prior to the call
> to the actual print() function. This translates into some savings.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
> Here is a report from the scripts/bloat-o-meter:
> 
>   add/remove: 2/2 grow/shrink: 0/14 up/down: 114/-581 (-467)
>   Function                                     old     new   delta
>   xe_gt_debugfs_show_with_rpm                    -      98     +98
>   __pfx_xe_gt_debugfs_show_with_rpm              -      16     +16
>   __pfx_powergate_info                          16       -     -16
>   register_save_restore                        317     288     -29
>   vecs_default_lrc                              73      42     -31
>   vcs_default_lrc                               73      42     -31
>   rcs_default_lrc                               70      39     -31
>   ccs_default_lrc                               73      42     -31
>   bcs_default_lrc                               73      42     -31
>   hw_engines                                   179     145     -34
>   hwconfig                                      70      33     -37
>   workarounds                                   66      26     -40
>   tunings                                       66      26     -40
>   topology                                      66      26     -40
>   steering                                      66      26     -40
>   pat                                           66      26     -40
>   mocs                                          66      26     -40
>   powergate_info                                70       -     -70
>   Total: Before=2870434, After=2869967, chg -0.02%
> ---
>  drivers/gpu/drm/xe/xe_gt_debugfs.c | 116 +++++++++++------------------
>  drivers/gpu/drm/xe/xe_gt_debugfs.h |   1 +
>  2 files changed, 46 insertions(+), 71 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> index e4eba91cb83d..b9176d4398e1 100644
> --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> @@ -35,6 +35,11 @@
>  #include "xe_uc_debugfs.h"
>  #include "xe_wa.h"
>  
> +static struct xe_gt *node_to_gt(struct drm_info_node *node)
> +{
> +	return node->dent->d_parent->d_inode->i_private;
> +}
> +
>  /**
>   * xe_gt_debugfs_simple_show - A show callback for struct drm_info_list
>   * @m: the &seq_file
> @@ -77,8 +82,7 @@ int xe_gt_debugfs_simple_show(struct seq_file *m, void *data)
>  {
>  	struct drm_printer p = drm_seq_file_printer(m);
>  	struct drm_info_node *node = m->private;
> -	struct dentry *parent = node->dent->d_parent;
> -	struct xe_gt *gt = parent->d_inode->i_private;
> +	struct xe_gt *gt = node_to_gt(node);
>  	int (*print)(struct xe_gt *, struct drm_printer *) = node->info_ent->data;
>  
>  	if (WARN_ON(!print))
> @@ -87,15 +91,36 @@ int xe_gt_debugfs_simple_show(struct seq_file *m, void *data)
>  	return print(gt, &p);
>  }
>  
> +/**
> + * xe_gt_debugfs_show_with_rpm - A show callback for struct drm_info_list
> + * @m: the &seq_file
> + * @data: data used by the drm debugfs helpers
> + *
> + * Similar to xe_gt_debugfs_simple_show() but implicitly takes a RPM ref.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_gt_debugfs_show_with_rpm(struct seq_file *m, void *data)
> +{
> +	struct drm_info_node *node = m->private;
> +	struct xe_gt *gt = node_to_gt(node);
> +	struct xe_device *xe = gt_to_xe(gt);
> +	int ret;
> +
> +	xe_pm_runtime_get(xe);
> +	ret = xe_gt_debugfs_simple_show(m, data);
> +	xe_pm_runtime_put(xe);
> +
> +	return ret;
> +}
> +
>  static int hw_engines(struct xe_gt *gt, struct drm_printer *p)
>  {
> -	struct xe_device *xe = gt_to_xe(gt);
>  	struct xe_hw_engine *hwe;
>  	enum xe_hw_engine_id id;
>  	unsigned int fw_ref;
>  	int ret = 0;
>  
> -	xe_pm_runtime_get(xe);
>  	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>  	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL)) {
>  		ret = -ETIMEDOUT;
> @@ -107,37 +132,19 @@ static int hw_engines(struct xe_gt *gt, struct drm_printer *p)
>  
>  fw_put:
>  	xe_force_wake_put(gt_to_fw(gt), fw_ref);
> -	xe_pm_runtime_put(xe);
> -
> -	return ret;
> -}
> -
> -static int powergate_info(struct xe_gt *gt, struct drm_printer *p)

I believe this should be removed in a separate patch.
It confused me when the number of rpm removals and the number of
function changed below didn't match. 

> -{
> -	int ret;
> -
> -	xe_pm_runtime_get(gt_to_xe(gt));
> -	ret = xe_gt_idle_pg_print(gt, p);
> -	xe_pm_runtime_put(gt_to_xe(gt));
>  
>  	return ret;
>  }
>  
>  static int topology(struct xe_gt *gt, struct drm_printer *p)
>  {
> -	xe_pm_runtime_get(gt_to_xe(gt));
>  	xe_gt_topology_dump(gt, p);
> -	xe_pm_runtime_put(gt_to_xe(gt));
> -
>  	return 0;
>  }
>  
>  static int steering(struct xe_gt *gt, struct drm_printer *p)
>  {
> -	xe_pm_runtime_get(gt_to_xe(gt));
>  	xe_gt_mcr_steering_dump(gt, p);
> -	xe_pm_runtime_put(gt_to_xe(gt));
> -
>  	return 0;
>  }
>  
> @@ -146,8 +153,6 @@ static int register_save_restore(struct xe_gt *gt, struct drm_printer *p)
>  	struct xe_hw_engine *hwe;
>  	enum xe_hw_engine_id id;
>  
> -	xe_pm_runtime_get(gt_to_xe(gt));
> -
>  	xe_reg_sr_dump(&gt->reg_sr, p);
>  	drm_printf(p, "\n");
>  
> @@ -165,98 +170,66 @@ static int register_save_restore(struct xe_gt *gt, struct drm_printer *p)
>  	for_each_hw_engine(hwe, gt, id)
>  		xe_reg_whitelist_dump(&hwe->reg_whitelist, p);
>  
> -	xe_pm_runtime_put(gt_to_xe(gt));
> -
>  	return 0;
>  }
>  
>  static int workarounds(struct xe_gt *gt, struct drm_printer *p)
>  {
> -	xe_pm_runtime_get(gt_to_xe(gt));
>  	xe_wa_dump(gt, p);
> -	xe_pm_runtime_put(gt_to_xe(gt));
> -
>  	return 0;
>  }
>  
>  static int tunings(struct xe_gt *gt, struct drm_printer *p)
>  {
> -	xe_pm_runtime_get(gt_to_xe(gt));
>  	xe_tuning_dump(gt, p);
> -	xe_pm_runtime_put(gt_to_xe(gt));
> -
>  	return 0;
>  }
>  
>  static int pat(struct xe_gt *gt, struct drm_printer *p)
>  {
> -	xe_pm_runtime_get(gt_to_xe(gt));
>  	xe_pat_dump(gt, p);
> -	xe_pm_runtime_put(gt_to_xe(gt));
> -
>  	return 0;
>  }
>  
>  static int mocs(struct xe_gt *gt, struct drm_printer *p)
>  {
> -	xe_pm_runtime_get(gt_to_xe(gt));
>  	xe_mocs_dump(gt, p);
> -	xe_pm_runtime_put(gt_to_xe(gt));
> -
>  	return 0;
>  }
>  
>  static int rcs_default_lrc(struct xe_gt *gt, struct drm_printer *p)
>  {
> -	xe_pm_runtime_get(gt_to_xe(gt));
>  	xe_lrc_dump_default(p, gt, XE_ENGINE_CLASS_RENDER);
> -	xe_pm_runtime_put(gt_to_xe(gt));
> -
>  	return 0;
>  }
>  
>  static int ccs_default_lrc(struct xe_gt *gt, struct drm_printer *p)
>  {
> -	xe_pm_runtime_get(gt_to_xe(gt));
>  	xe_lrc_dump_default(p, gt, XE_ENGINE_CLASS_COMPUTE);
> -	xe_pm_runtime_put(gt_to_xe(gt));
> -
>  	return 0;
>  }
>  
>  static int bcs_default_lrc(struct xe_gt *gt, struct drm_printer *p)
>  {
> -	xe_pm_runtime_get(gt_to_xe(gt));
>  	xe_lrc_dump_default(p, gt, XE_ENGINE_CLASS_COPY);
> -	xe_pm_runtime_put(gt_to_xe(gt));
> -
>  	return 0;
>  }
>  
>  static int vcs_default_lrc(struct xe_gt *gt, struct drm_printer *p)
>  {
> -	xe_pm_runtime_get(gt_to_xe(gt));
>  	xe_lrc_dump_default(p, gt, XE_ENGINE_CLASS_VIDEO_DECODE);
> -	xe_pm_runtime_put(gt_to_xe(gt));
> -
>  	return 0;
>  }
>  
>  static int vecs_default_lrc(struct xe_gt *gt, struct drm_printer *p)
>  {
> -	xe_pm_runtime_get(gt_to_xe(gt));
>  	xe_lrc_dump_default(p, gt, XE_ENGINE_CLASS_VIDEO_ENHANCE);
> -	xe_pm_runtime_put(gt_to_xe(gt));
> -
>  	return 0;
>  }
>  
>  static int hwconfig(struct xe_gt *gt, struct drm_printer *p)
>  {
> -	xe_pm_runtime_get(gt_to_xe(gt));
>  	xe_guc_hwconfig_dump(&gt->uc.guc, p);
> -	xe_pm_runtime_put(gt_to_xe(gt));
> -
>  	return 0;
>  }
>  
> @@ -266,25 +239,26 @@ static int hwconfig(struct xe_gt *gt, struct drm_printer *p)
>   * - without access to the PF specific data
>   */
>  static const struct drm_info_list vf_safe_debugfs_list[] = {
> -	{"topology", .show = xe_gt_debugfs_simple_show, .data = topology},
> -	{"register-save-restore", .show = xe_gt_debugfs_simple_show, .data = register_save_restore},
> -	{"workarounds", .show = xe_gt_debugfs_simple_show, .data = workarounds},
> -	{"tunings", .show = xe_gt_debugfs_simple_show, .data = tunings},
> -	{"default_lrc_rcs", .show = xe_gt_debugfs_simple_show, .data = rcs_default_lrc},
> -	{"default_lrc_ccs", .show = xe_gt_debugfs_simple_show, .data = ccs_default_lrc},
> -	{"default_lrc_bcs", .show = xe_gt_debugfs_simple_show, .data = bcs_default_lrc},
> -	{"default_lrc_vcs", .show = xe_gt_debugfs_simple_show, .data = vcs_default_lrc},
> -	{"default_lrc_vecs", .show = xe_gt_debugfs_simple_show, .data = vecs_default_lrc},
> -	{"hwconfig", .show = xe_gt_debugfs_simple_show, .data = hwconfig},
> +	{ "topology", .show = xe_gt_debugfs_show_with_rpm, .data = topology },
> +	{ "register-save-restore",
> +		.show = xe_gt_debugfs_show_with_rpm, .data = register_save_restore },
> +	{ "workarounds", .show = xe_gt_debugfs_show_with_rpm, .data = workarounds },
> +	{ "tunings", .show = xe_gt_debugfs_show_with_rpm, .data = tunings },
> +	{ "default_lrc_rcs", .show = xe_gt_debugfs_show_with_rpm, .data = rcs_default_lrc },
> +	{ "default_lrc_ccs", .show = xe_gt_debugfs_show_with_rpm, .data = ccs_default_lrc },
> +	{ "default_lrc_bcs", .show = xe_gt_debugfs_show_with_rpm, .data = bcs_default_lrc },
> +	{ "default_lrc_vcs", .show = xe_gt_debugfs_show_with_rpm, .data = vcs_default_lrc },
> +	{ "default_lrc_vecs", .show = xe_gt_debugfs_show_with_rpm, .data = vecs_default_lrc },
> +	{ "hwconfig", .show = xe_gt_debugfs_show_with_rpm, .data = hwconfig },
>  };
>  
>  /* everything else should be added here */
>  static const struct drm_info_list pf_only_debugfs_list[] = {
> -	{"hw_engines", .show = xe_gt_debugfs_simple_show, .data = hw_engines},
> -	{"mocs", .show = xe_gt_debugfs_simple_show, .data = mocs},
> -	{"pat", .show = xe_gt_debugfs_simple_show, .data = pat},
> -	{"powergate_info", .show = xe_gt_debugfs_simple_show, .data = powergate_info},
> -	{"steering", .show = xe_gt_debugfs_simple_show, .data = steering},
> +	{ "hw_engines", .show = xe_gt_debugfs_show_with_rpm, .data = hw_engines },
> +	{ "mocs", .show = xe_gt_debugfs_show_with_rpm, .data = mocs },
> +	{ "pat", .show = xe_gt_debugfs_show_with_rpm, .data = pat },
> +	{ "powergate_info", .show = xe_gt_debugfs_show_with_rpm, .data = xe_gt_idle_pg_print },
> +	{ "steering", .show = xe_gt_debugfs_show_with_rpm, .data = steering },
>  };
>  
>  static ssize_t write_to_gt_call(const char __user *userbuf, size_t count, loff_t *ppos,
> diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.h b/drivers/gpu/drm/xe/xe_gt_debugfs.h
> index 05a6cc93c78c..32ee3264051b 100644
> --- a/drivers/gpu/drm/xe/xe_gt_debugfs.h
> +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.h
> @@ -11,5 +11,6 @@ struct xe_gt;
>  
>  void xe_gt_debugfs_register(struct xe_gt *gt);
>  int xe_gt_debugfs_simple_show(struct seq_file *m, void *data);
> +int xe_gt_debugfs_show_with_rpm(struct seq_file *m, void *data);
>  
>  #endif
> -- 
> 2.47.1
> 
