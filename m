Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BFFDFF8875
	for <intel-xe@archiver.kernel.org>; Wed, 29 Apr 2026 18:27:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D6DC10E00D;
	Wed, 29 Apr 2026 18:27:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AUYwfiOM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88FF810E00D
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Apr 2026 18:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777487273; x=1809023273;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=9FqLqslhUKcvk6/doEAbUJpttIF7brol6a6x4V0353k=;
 b=AUYwfiOMV9ThmRkabGnFDAfLnW+osWnJC+IbQBn7XZgy9cL0gj+QwfCC
 FOH5B0JmUnHIujt7hHy6MVfeuMNoI9w5zc10nN+Nx+3S/pzZJSEo/ytLv
 E0Y8VwROfXf9qPszrtORwNuEBlxoerkg77ugihsWJpDprqtQ1nc/cYPWi
 hL8+X0hcxueRRcvp4KbC/fs2JlnB+NpyIID9pfLou1wnyakqcpHEse5zl
 tuXW7j8MWio/IO6EOs1GsGh0xatBvgF8ku/RfGNkA65R3FCQqh9tKcAfi
 pzgxI7Cbvu18igVcDQsAxdC4JBjBDZkLbiv61skHXMwudKydxUWwjKtPs Q==;
X-CSE-ConnectionGUID: 6yIfZmqGT8SVYQGDx0AQrQ==
X-CSE-MsgGUID: GmK8kxexQY2poR9EYakkzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="89517020"
X-IronPort-AV: E=Sophos;i="6.23,206,1770624000"; d="scan'208";a="89517020"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2026 11:27:53 -0700
X-CSE-ConnectionGUID: TjH5DXRvRk2caUxms9s2cQ==
X-CSE-MsgGUID: SOv1sqqES7yknjOFGKErBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,206,1770624000"; d="scan'208";a="234372311"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2026 11:27:53 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 29 Apr 2026 11:27:52 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 29 Apr 2026 11:27:52 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.13) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 29 Apr 2026 11:27:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lRknD8EOF2qcTf+ayQubT2lpspwtS+x17rkl3SC6K9a5qKBF+caNkpe57Zz/IuS1E6E38bHn8zTOs24hvZkaWPBDk09jPEY0uknvuZ5nQlz/RbyKnSwcOa1SQ5UrA57/OTl0ROF3rXTxfQ2z9Lq+9MfzmtBVKx9TaHfn8nLeOxOYzFjiSB9uC+rcDo0UumswG+jqVjSiD+POICSsWFLHTgAaWUpzBGgLC84fi3aM0Kkqk0QEemnXjNXb93sd092AjWmkvhQZFSqGO4B6M4jZd+EM1tsniHPMw+740Vh+Co1yVQ6nfLEuCy/8nQxXvDMvc2GwDtqXbHykGMcKC9x5uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3ADJ8DJ2H5SjrXuxDsT/8ZCiiDupmVY96KjOMhuOg8Y=;
 b=JJCmRCQnt/ZgyExsgrFQN7BKd1TA4Fo/XnUFBDSYLAfFUr+plZI89SI2jfxGgLiXkUHP5NBB2DF7K4k6K0l9w+om9oVyQJNiYI8isvRf9e3gcj73x40zve79lX+R7LorEz/1he4bt8NfXtwLwG8/iVOJP3fEih2Gqenmrqgh/hNsix3cbNGbXjdhAAj3ECGZc/N+3zQpEzjIafqXor/5B0xrmGGQQQMLBzHotV47qF9ZjeqiDGW90mFkTWK1rRyJjjk3M+8HAqe2vTVzDrwNsztjJpPAvEqRp6Z4pyApgANGzMJGCuULs/IxRPdZfr0Qt6HRsXJ1nuRRdUCLliZTMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by MW4PR11MB6812.namprd11.prod.outlook.com (2603:10b6:303:1ee::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.18; Wed, 29 Apr
 2026 18:27:43 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a%5]) with mapi id 15.20.9870.016; Wed, 29 Apr 2026
 18:27:43 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: "Lin, Shuicheng" <shuicheng.lin@intel.com>, "Roper, Matthew D"
 <matthew.d.roper@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH v2] drm/xe/hdcp: Add NULL check for media_gt in
 intel_hdcp_gsc_check_status()
In-Reply-To: <87mrylajn2.fsf@intel.com>
References: <20260416-check-for-null-media_gt-in-intel_hdcp_gsc_check_status-v2-1-9adb9fd3b621@intel.com>
 <20260416193733.GG755471@mdroper-desk1.amr.corp.intel.com>
 <DM4PR11MB54568743003BC9EF6F00FBF6EA202@DM4PR11MB5456.namprd11.prod.outlook.com>
 <87mrylajn2.fsf@intel.com>
Date: Wed, 29 Apr 2026 15:27:37 -0300
Message-ID: <87jytpaag6.fsf@intel.com>
Content-Type: text/plain
X-ClientProxiedBy: BYAPR07CA0108.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::49) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|MW4PR11MB6812:EE_
X-MS-Office365-Filtering-Correlation-Id: faf4a58a-5cb3-4384-0fd1-08dea61d0070
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|18002099003|56012099003|22082099003; 
X-Microsoft-Antispam-Message-Info: Wq6UnOyv2axCWPMbKhPTdHitDcw484RyUbWGUJ7KNiDbRunGawgGCJUbEaCnw+w1cCCAJKTYS8PUml0d9j1hwVETeio9XJ0j7Dhj1Btr427o0jEF9yF/RPjhsFSsYRURAPc21+CLsIoOnbMBxpwCNi8EaK9IlTiZCykechxX4gVmxekoSZ+IoSrAYTDuBfmoJxhLGN6AiZK9VaYzjh1tpOBmpM4dUtuYMoy6iYLUsQr9sfkSx9RoLMIuJEG6F0H4Kap559qOCoWD/6BI+YTEmiew/8FyneKvGaRimR3Y9KlCB0pJedrzh6PWHA/H/w5W8GJQQARUvAhhRJKg2NPsRXHoia0N2V22jGLxyD1ALRli67cKMEzwaZIP5RIO+1/PCtU1XAwYd+z3UWaekpuYJo0SV3kKEOPn3oHUsjAztwFsC2HSAhEJC056DUPXzEPj65SZPaULIyXOUtVeIky/nC8mNxxqRJomyF0x2WvYWWs2HQex4bsXmi57SsQL1kkwbVZxYOxXu+8ljfa78KBl7KKwfPhQA+n7R/IwxzVLbYXuh1fAR7vVHL4FonGp6XPrtQC9XjTvOcsDb0kGKJvxZIRkxkebuDHb2QhZ3pIfZdmxSea33rwwfjT8sS9mW5qUl0e/I3VZWXTSBWTQD6sZm5l5ItmQxlaM1jIqWc8aF2Y4U+dd6Px3WAHAUiDZCr3B
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(56012099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?a6TA8WGPfbbxfnkRPbhXhF7rxtl0DT6NbCMXpyegKLEQmHu6D+Z1yhPgJSa+?=
 =?us-ascii?Q?D9kBFS3OcIjjN9KrVZnptc6wHPZC774UdodV/i/c+CPpyiuZWczuz7eYq+9X?=
 =?us-ascii?Q?jUdfr3/WJbGcAWT0R4w07+W7hTQF8MHjKjBVd3y+B/tdIOQZcBOG7iD9tg/J?=
 =?us-ascii?Q?ZQrjd0YEJEF47HI8Zp9Uhk8ndzM69GUCwnU2OrQJw5PSDireLxLQSGrxXyQG?=
 =?us-ascii?Q?QbYyh8SRBDNQkYH5KvY/N6hnxOqevn5OMcIRHB+Fq0OTAmZ10Uf/N9ODHNlB?=
 =?us-ascii?Q?rxcAd9R9z5ZNZAb831bAfSBtaY8bQFplnT9E+hlFCALHm4kyKu8cVtCyMz+h?=
 =?us-ascii?Q?PqV6T/hIiMmCtT/fhzMja+huPOr+3B2R2TRGcPzrWuoCVyxJtgeAFUE4yUZr?=
 =?us-ascii?Q?T0HmZsk4AZj8ermIIL2wUMAYhh0e+cItdrWMx5Sol7AsDzyf5ZJYC5LXWIfM?=
 =?us-ascii?Q?SjN1npkYqrG8e/MUtbeS+kL3WuPj0YcFhACeYUmLHWXyTDDbzPo38ZvlzfwJ?=
 =?us-ascii?Q?Vi69J1hKSAfKXJygY4abtspLfXAoYUPTRfv9iXfu5e7mqymQChumDFZ+BhZY?=
 =?us-ascii?Q?39894DynxwVi+waUy4W8tM896zQPm+JydwiTsWORiSQBnGjuMlWgRhz9dMAr?=
 =?us-ascii?Q?iRRjOA8sdtcNMqa9JRQ8GIpPksHwPwN11eKMm8POr/dR2bLTryAY2odKwCa9?=
 =?us-ascii?Q?sr2Cz6yDDbyrZt0KJDCxYwf+dq2+D5xIw0EyEdfxRAypoyesnbn8y4x1YGjq?=
 =?us-ascii?Q?EX4ZOj2QxjyKGRYy64PfhjkKaAK94t3KrbqqX5ZZATRaGTxir4EFJTNOCI9n?=
 =?us-ascii?Q?dV8cPQgguMzFcBUuqdSsuL5Sgo/17hxYV4dCLoozp9e8XjrbHn0t2L//fMlK?=
 =?us-ascii?Q?qEYVnkxXQYxIDSNDOtZKTeZJ/kPUqaIhbr8qYYfxINptrWLPJe6/wRusn5Py?=
 =?us-ascii?Q?GewxKIXRc/bPKT3PvKo7faN9lwYYbJkBKpOorWgMfOhCYGodGsqw9UT7DYv7?=
 =?us-ascii?Q?/akul6CWSch9n6+LlxQLRxUZy1WJSWAJbQP6G3O/wfX/KDpkeUbqvqsmq5cd?=
 =?us-ascii?Q?9Gjs/XILaPxtvcG7To7xVeEMIwgyAW3GzaNunc6A4fkyNJ9X5b11LBFYBtNF?=
 =?us-ascii?Q?t+qz+5x+UnpUQQ02V2xU3pJu0wruwyi3v4My51m7kinBfRY+DHWWZQRuEdXA?=
 =?us-ascii?Q?Wlw6CBwkoJTqi+JCoCwH1NG15fjuNNWSHDl1sg9ktCAD1RjX4e4+EmUtDkuy?=
 =?us-ascii?Q?LO2wdqxEL7nwhvkwXaW9VQVbqjSrWxxlkbMzuoLtS64DCm8s9eBBrxdoWvkR?=
 =?us-ascii?Q?PvDhVfXGpy3vk3L3geaEzL+yMut4sPPV8V4D70I+hOyB/VbtrZIxOBEVHK7r?=
 =?us-ascii?Q?ULNLOaeu9r/aFtfe2UwFf9iOUTxGD3XcspnoWHCGZdaaVIUuT9R+Y/1iaY+L?=
 =?us-ascii?Q?LVClbOJAkWB9eeEcUHMaIsKfbLMNZm/9nu5C4LibfZZyCzbLXwFY6k8SGx6s?=
 =?us-ascii?Q?tz1W19Gpfess1wqWIPvM65LEmHPJBYwXgDjnm6Mr98I25xkXNx0PYxKbumjq?=
 =?us-ascii?Q?ODc1Al8RRfz57Iofygyt4zwo0FVH0AzQZ7IRyaP6sWopIODXc8Jr9w6zp/eQ?=
 =?us-ascii?Q?kM+3eFu303vOSSkTvqvzorXdHi2LIVLnED9hnVkkbbu2fKIWwhw/xIV+dDs+?=
 =?us-ascii?Q?Z8WrQR3walXcqo+S8yLoIXu3U/xxz0tXqNGw2NKayYhXwpT7uqp5F0G5CjWs?=
 =?us-ascii?Q?xkBrK67phg=3D=3D?=
X-Exchange-RoutingPolicyChecked: Mp7jcIcFWsODWHM28KUAjvlki0cMhs5txari2KuztqqiwUOueYEQMyBny9Y6rl4CLh0w5eHKJAi36tA+HwWRkCn5vpN/ClxAuUqNqnIsOlAleTnjAMYnMj+OctTo1ycf4ZtGbOWaLhRdvWBc0VXd9FHDcLh3Ujyo7UfuK1TJ7lJCXpd9PDSI8YapveTh+RFHHIIaFdTZ/hegYLuxhTifLtXyxSGxfYmdCO2ha9p2XewZ+wuD87QaP4J6nHoafUXd5zI80ZGCaipojK/cWrtWmI1MnNsK1gqrB7YmEqI8ceNGBJMAxJt5uFw0a8nRRIffdV5WF6llOSZXV3lM/SVnFw==
X-MS-Exchange-CrossTenant-Network-Message-Id: faf4a58a-5cb3-4384-0fd1-08dea61d0070
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 18:27:42.9855 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vXF+UYnnp3iOKdFsRenQLw6Kq3EMIrV3fsdvWdivLKQ3s4r/u1B8AuKz4Gv31E35icRoaxayja+8gkQ0wTZkaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6812
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

Gustavo Sousa <gustavo.sousa@intel.com> writes:

> "Lin, Shuicheng" <shuicheng.lin@intel.com> writes:
>
>> On Thu, Apr 16, 2026 12:38 PM Matthew Roper wrote:
>>> On Thu, Apr 16, 2026 at 03:17:19PM -0300, Gustavo Sousa wrote:
>>> > When media GT is disabled via configfs, there is no allocation for
>>> > media_gt, which is kept as NULL.  In such scenario,
>>> > intel_hdcp_gsc_check_status() results in a kernel pagefault error due
>>> > to &gt->uc.gsc being evaluated as an invalid memory address.
>>> >
>>> > Fix that by introducing a NULL check on media_gt and bailing out early
>>> > if so.
>>> >
>>> > While at it, also drop the NULL check for gsc, since it can't be NULL
>>> > if media_gt is not NULL.
>>> >
>>> > v2:
>>> >   - Get address for gsc only after checking that gt is not NULL.
>>> >     (Shuicheng)
>>> >   - Drop the NULL check for gsc. (Shuicheng)
>>> >
>>> > Cc: Shuicheng Lin <shuicheng.lin@intel.com>
>>> > Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
>>> 
>>> We should probably also have
>>> 
>>> Fixes: 4af50beb4e0f ("drm/xe: Use gsc_proxy_init_done to check proxy
>>> status")
>>> Cc: <stable@vger.kernel.org> # v6.10+
>>> 
>>> too?  Or I guess we could make the argument that there don't seem to be any
>>> real devices without the media GT, so it only became possible to trigger this
>>> once we added configfs support for manually disabling GTs?
>>> In that case,
>>> 
>>> Fixes: 7abd69278bb5 ("drm/xe/configfs: Add attribute to disable GT types")
>>> Cc: <stable@vger.kernel.org> # v6.19+
>>> 
>>> minimizes the number of kernel versions this would be backported to.
>>
>> Is it possible that we have future platform that does not have media gt, and be supported with old kernel?
>> For that case, it should be supported with dkms, so this Fixes tag should not affect. Is it right?
>> So, I prefer this Fixes tag.
>>
>> LGTM.
>> Reviewed-by: Shuicheng Lin <shuicheng.lin@intel.com>
>
> Yeah, I guess it is safer to use the first proposed Fixes tag.  I'll use
> that one when applying.

Pushed to drm-xe-next. Thanks Shuicheng and Matt for the review.

--
Gustavo Sousa

>
> --
> Gustavo Sousa
>
>>
>>> 
>>> 
>>> Anyway, the change itself is
>>> 
>>> Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
>>> 
>>> > ---
>>> > Changes in v2:
>>> > - EDITME: describe what is new in this series revision.
>>> > - EDITME: use bulletpoints and terse descriptions.
>>> > - Link to v1:
>>> > https://patch.msgid.link/20260302-check-for-null-media_gt-in-intel_hdc
>>> > p_gsc_check_status-v1-1-163d5f826b30@intel.com
>>> > ---
>>> >  drivers/gpu/drm/xe/display/xe_hdcp_gsc.c | 12 ++++++++++--
>>> >  1 file changed, 10 insertions(+), 2 deletions(-)
>>> >
>>> > diff --git a/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
>>> > b/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
>>> > index 29c72aa4b0d2..33494b86205d 100644
>>> > --- a/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
>>> > +++ b/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
>>> > @@ -37,9 +37,17 @@ static bool intel_hdcp_gsc_check_status(struct
>>> drm_device *drm)
>>> >  	struct xe_device *xe = to_xe_device(drm);
>>> >  	struct xe_tile *tile = xe_device_get_root_tile(xe);
>>> >  	struct xe_gt *gt = tile->media_gt;
>>> > -	struct xe_gsc *gsc = &gt->uc.gsc;
>>> > +	struct xe_gsc *gsc;
>>> > +
>>> > +	if (!gt) {
>>> > +		drm_dbg_kms(&xe->drm,
>>> > +			    "not checking GSC status for HDCP2.x: media GT not
>>> present or disabled\n");
>>> > +		return false;
>>> > +	}
>>> > +
>>> > +	gsc = &gt->uc.gsc;
>>> >
>>> > -	if (!gsc || !xe_uc_fw_is_available(&gsc->fw)) {
>>> > +	if (!xe_uc_fw_is_available(&gsc->fw)) {
>>> >  		drm_dbg_kms(&xe->drm,
>>> >  			    "GSC Components not ready for HDCP2.x\n");
>>> >  		return false;
>>> >
>>> > ---
>>> > base-commit: 9ac7dca8d82a4e6d9806ac6c991f0777338833bb
>>> > change-id:
>>> > 20260302-check-for-null-media_gt-in-intel_hdcp_gsc_check_status-
>>> 071898
>>> > b8a402
>>> >
>>> > Best regards,
>>> > --
>>> > Gustavo Sousa <gustavo.sousa@intel.com>
>>> >
>>> 
>>> --
>>> Matt Roper
>>> Graphics Software Engineer
>>> Linux GPU Platform Enablement
>>> Intel Corporation
