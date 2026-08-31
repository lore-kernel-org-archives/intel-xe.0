Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C86BC61DFD
	for <intel-xe@archiver.kernel.org>; Mon, 31 Aug 2026 19:10:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AEB110E410;
	Mon, 31 Aug 2026 19:10:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zn4IaWQi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76F7D10EAAF
 for <intel-xe@lists.freedesktop.org>; Mon, 31 Aug 2026 19:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788203430; x=1819739430;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=8cn/IEy1DtjUi6W8L+HngpfE4q7IZUGii10W4GKeALc=;
 b=Zn4IaWQiQDAtSE3xu5183ei6kzBMzLzoBtidh+ZT5R2IBo7oQ1If59+H
 L6H6G3f9k+JAxr6lStW3iJu6fLQRtph09/ulObQ93zK4/FQxUaFI+ymuV
 qBavqejuTKw6ITs0S260mc6jLx7WF6EZlpqY2tAvUwtjImJl4HLZdIhIP
 ffPoZGt6GN5Q1OV5uJspKx3+1wbt61GsICRqtvjAKcxVtSvmrcNvGYK6Y
 hWTkDVn/PgJBfgH1cUdwIbgOSj+EVzeY7VzrNZtSvOJZpzNBAe15VsPuH
 HDc1Gf4tsVGquSA5LkuNwsbEiFZrQbIspqB9adjIwpj/0NSi5Nbk8dEVN Q==;
X-CSE-ConnectionGUID: LAwortd/Sp+ClkwDyoJNbQ==
X-CSE-MsgGUID: yl1HYsjcSByrOQkY0/IIxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11892"; a="87754173"
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; d="scan'208";a="87754173"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2026 12:10:30 -0700
X-CSE-ConnectionGUID: xM+nk4BOTBO7EbuBrRFBHw==
X-CSE-MsgGUID: NyP2mYibS7S7CddD27ziiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; d="scan'208";a="293713982"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2026 12:10:30 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 31 Aug 2026 12:10:29 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 31 Aug 2026 12:10:29 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.69)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 31 Aug 2026 12:10:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TR+4U7m3H3jTVms2FfuT2plWonBacj5ikDJaDqmIAeyS24lp7Pycu1mv7BXQBkX+G0SDXDiDRfPIZs+E27gS7sodJzufXHb+1ysB4D0MewqkDglt3CkcMJjPZdntiqFNX0zx1m5L2NqQcIF9+c/npe4SgW/C2FCYBn950P36rIPjnlb1nMPv7AFy7FEm/ybY/Cz7F6nG24MQ+t+WysQUY35xZtpLRZcM9jH/i0+FyO/A3uNd3tJrm8gU/0GPHV2EXrkbphzzQ3b3iWO8k/cbE1UF4kWOeHm8e/ADT2ytMFeB/jT874wPZlrL68TRX38SGOPSkVs5DwfYc379smeVEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eyRvMM79wRFpewUebBKbmAqJ/EFxk45/r0EE/Vp0HY0=;
 b=BByA8rhlEClvyYkTDPcZq3f8mxrMAtZPnHZ2n2nutMLrEzcXdqJZfkgVEZgXlmZOq+8o1tw8fxN/qtILSLXgNSEQQo7RIdCHfM1l0vvdCryYeF3nvLlRf6OQvXJ7Hqmc8A3WaBVFand8auV2qtlh6ZUAfZHuB08/yoZ20ieNSJiAWEpjdMa98LJ2Ky5FV/Mgkz5pjOVqGbNIh+48CJGNvy+Tx1tMuJE+4eGtBbILkvRYk8jxIdymoR74Lu058VrgkL4b61KhuKJ3ThiwH96wdfcy+sspCdYqA1P35iTGkqW8LiOadarQXohpo+p6F5t4dUeLBXUyZMivoMZdsmOpsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7207.namprd11.prod.outlook.com (2603:10b6:8:111::18)
 by SN7PR11MB6704.namprd11.prod.outlook.com (2603:10b6:806:267::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.12; Mon, 31 Aug
 2026 19:10:26 +0000
Received: from DM4PR11MB7207.namprd11.prod.outlook.com
 ([fe80::7806:5aac:a263:2653]) by DM4PR11MB7207.namprd11.prod.outlook.com
 ([fe80::7806:5aac:a263:2653%6]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 19:10:26 +0000
Date: Mon, 31 Aug 2026 21:10:15 +0200
From: Jan Maslak <jan.maslak@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.brost@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <rodrigo.vivi@intel.com>, "Christoph
 Manszewski" <christoph.manszewski@intel.com>
Subject: Re: [PATCH v2 1/4] drm/xe/xe_migrate: Align MEM_COPY pitch with
 destination address
Message-ID: <apXRlzqZUhTys7Av@ART-DEV-395>
References: <20260622103449.3335928-1-jan.maslak@intel.com>
 <20260622103449.3335928-2-jan.maslak@intel.com>
 <5ac2b122-bb4c-4c32-b7e3-c9f9c42a42b0@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <5ac2b122-bb4c-4c32-b7e3-c9f9c42a42b0@intel.com>
X-ClientProxiedBy: VIUP296CA0064.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:337::7) To DM4PR11MB7207.namprd11.prod.outlook.com
 (2603:10b6:8:111::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7207:EE_|SN7PR11MB6704:EE_
X-MS-Office365-Filtering-Correlation-Id: 3cdada8b-9cb8-4eb2-99d1-08df079383be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|23010399003|1800799024|56012099006|6133799003|10067099003|4143699003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: aV6MhTm6/xI0vM6eXwf84wPSn73G+sFxS+YKxQEC4HEiTZwC1hPkte9uLTiBf4fV63PPQdlA1mFpPQV0GTOM/OO2kIZMNxWM7fU1r7ee15Bl+JW5sULi1UsAW9RBrJUJDjUuXoSc1lrhjsREpukbPl9Gh+xR3t2Rt+SqNCsyrBJTUXGHmRuqoxKRrgqrvGgO7g19pUeXm+rbdX6Enn18Stbx3yXOqDjlEC35kEzxsLk5ufV1czat1nepyH6oLi+ZdCH9qCzpQGOYPp860JhDddbDEJOYbrn8Iy5pO+311Kn7sW/053qDTaD1Vfxrz3txkk275X/VXOmANHRU0mYnqq+qGhJhDTsEHZrG+8EgXDaTT56GH6NMRsPgl6Z30rBK2q4tZNh2huhYQKlZ6XG6OAtGC/O2oGcqMvt+lR8sKbQNgwlUXmo8L1uqGZH4WOVGAo/0oIEBHXAQPs+sEeUQy8KdZ/PPPnK6hrfaxoW/oBCtOC958brE/UZaPzen6kvsNdpLYDP+BRSYRwcO/uqkntzgBeHAKRoGkuJyGytNy4nBLS6Yep1Jgld667ziwCF+y//aXDS6uGr+47GzGEVk0kxNPONOPXsEOE8gA4OzyoTBPTXYAu210hzbQ5EvHsAIKaeMqPDTqDPuBUXGtqhHzmJ7YSYYDkNklSu42ZJ94iM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(56012099006)(6133799003)(10067099003)(4143699003)(11063799006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9IdawMYMVhDIqbrqGrYBzwzM/CMNbJfiMN8x3S6Y0VbbEzeYKUFL1oeAB4A0?=
 =?us-ascii?Q?3sT8L80nWZgvaUI8YD89MuqXFzfVmzuxrrKsXEwx1AZ0fEC4CIIFNL51v1ER?=
 =?us-ascii?Q?etmMNLHBpMORMmhP/ofiWeqwT+4rVoG9Vh5hd9BZvo0XWl86H5flH2IIgALJ?=
 =?us-ascii?Q?Yl74o+iwstbSY0E38QjWYVPjykVPzHxBQvMsJnEXxcylXhTYwCZjlXPbaL5d?=
 =?us-ascii?Q?nb4YQ+HRFrhK5sB9Sa7/4nScdxEUqUK+Jmj7zFvXkXLj4/vO2lbH6Wyk99+y?=
 =?us-ascii?Q?LWQ7Fgvj3DXfTgqJkz9DgCLtzFjpHWWjRp5oV0e0v+ow2FcVQe2htkqYp8GC?=
 =?us-ascii?Q?NCdjskIb2hX48J7wt1jb1Ep05uc0bNlQGnBRnymUMa9D89U4WAtl+iLf/pLs?=
 =?us-ascii?Q?b6YNQY8vhjHy3KiBznVvLbni7YcIyS/NrONwfQs3O31mlS3PO71B+SF2chxR?=
 =?us-ascii?Q?rms2jL/412Eyo603uG3GuIfAdeY47tbw3e0EoieecFU+L///ENUrzhKRoCmu?=
 =?us-ascii?Q?bMvEJHR9o2qoIj3UYQVWpV92qpVaqBzkVDRSfgwPGuXwL7OU/XI8JvmDu1fa?=
 =?us-ascii?Q?xrdBqffc9MF6ENUCD1woYQ5flrFox21D58E8sAZv1NdPl9qTROfohYb+s8jR?=
 =?us-ascii?Q?5/5fl5tUn8n9ElrpzYRW7pDw1QKrTq0uB2iyjkZJrDgU3pfKVL7sHzl+bsyc?=
 =?us-ascii?Q?MyqBtW24t0S60Jt0KuGJgdT0JLaANTclVcrCiz7o6NUD8jtn8RO2fW5Bc9gm?=
 =?us-ascii?Q?beKknuTkeuGMgTCfO1lIh2fyJdpJRlkhwRptCe8FBApTfB7QPkoBA7LlaoA0?=
 =?us-ascii?Q?VpbXSsKWcT9Ook50oHbFXmnSqAwBVFkUBa9Wcj5BlX9ZfLpxXm3k+S0Iddnk?=
 =?us-ascii?Q?8NEQloPbsYjpm9ARalzOTfKI7L5Gdr7+bue1hLKE3ZJFjiBCOSYeTBpJv/UE?=
 =?us-ascii?Q?9w5gNIY0OwgsKPUFYMmzGY4/VxqW2d3AiXXjj01G0BIUs7JFTT04iqif0huV?=
 =?us-ascii?Q?cZJt+gc0l2fYCOGz0GNKptbqcC0xpF6Q0/MJ7ZP9kUB0sfCGXj9YQMBsSq0h?=
 =?us-ascii?Q?WuT7gn6JxR+AkbmLKt13BNWMsqociBnI3ocSL6EtTIaNUDmr96paRSjPIwdf?=
 =?us-ascii?Q?XOq5We3zckhw+iO2yA50CKW6IC4gb5eC0XXi97iQPl+2P+ml5LkRF48abhhi?=
 =?us-ascii?Q?Gvlm6zGD9EIYMoCPv04NFIsJqIIQ39Al2pYG99ZYB2UMYbtj4eWokYq58dTj?=
 =?us-ascii?Q?dSuKk7m2X/1mE72auSp7/CgbwQ42xaMh1GHWiiCWU7ubO7hLfmtEYrpid9tr?=
 =?us-ascii?Q?rIfFF+9psClI44M6NQbze0tIXhARTwQ68HLb6JmeIoflQs1NNiOe+UbodXz1?=
 =?us-ascii?Q?M1EfIK4NmoDCXqK0j4bgiD8ZRIIcnW+l5jRMSFTLLOVBnu2VcgYGVE/y6Hde?=
 =?us-ascii?Q?wkyy3PASGIUFIka/MBBomTGoRjCfdukHEHKqOBzdgUA6xvltUHcl7iJ9F6wW?=
 =?us-ascii?Q?JJ89yiN01O6G1uJxA75a7H3P7xC89bM9JZLwHIi2Wh9+0eh8rpbKtLzymznc?=
 =?us-ascii?Q?YZEjceokDFgr84UQeaQrUb+D6uNP1mlzFqqVK7QB3yo8MTzztYoHssXxOin1?=
 =?us-ascii?Q?HSzbpPX1mUECq5myGW49CTKDLAT6hq8KlSf6KiWdy7Lmlkgjb6OiFPsBhFOk?=
 =?us-ascii?Q?ta9YT+ZcD5kUH8uMpec12WHzz5UgLP93nyb+ofrrE/J0wWKHGlYDRhuWKqMU?=
 =?us-ascii?Q?HoxPFlGHwQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: RM7XJhLtY/PLpTk5lBkcdniHn6+M7UmK9NSJv/TRoMgIzS/28jXzvUx1hIdsfcuZsMWSUQQ5DoK+2dOBQgiN/YXGKU1QI/Vja9z8HLE577yujJz6LfG9kU+fWWAO9uFvw+f6gImSFE1N/nin+9if5JoizpTS7QaLIeJXpJjG+mLtZQ+/Zllt6pdMqcrQsL/SmiQGypLMJQoy9AI++B3zVVC6L0OBHR+I1dYfhzRm4MEmhXWNy2EcgAVMI1fMcSYvVQHi0bU42fZ4ySxJ1RJ0tEH7lSn9ykkQPxjTrxOU5mElEFoYh1DqfrQAOLfa/gu3GGMOGWsU+CcmK0oB0BprOg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cdada8b-9cb8-4eb2-99d1-08df079383be
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 19:10:26.3705 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: caNzt/jK/8L1idLUyZmIjB5lpMPoJgXI3rXfhgYG5gG+rYhpzPwv8MXBfULeFIfaezm3NMdS1+4/kd+OUUAu7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6704
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

On Mon, Aug 17, 2026 at 05:39:29PM +0100, Matthew Auld wrote:
> On 22/06/2026 11:34, Jan Maslak wrote:
> > From: Christoph Manszewski <christoph.manszewski@intel.com>
> > 
> > MEM_COPY_CMD can corrupt memory when MATRIX_COPY mode uses a pitch that
> > is not aligned to the destination address.
> > 
> > Fix this by incorporating the destination address into the pitch
> > selection so the chosen pitch is aligned to both the copy length and the
> > destination address.
> 
> Should we play it safe and apply this to the src addr also, even if it
> appears to work without? The spec doesn't explicitly state that the dst
> needed this special treatment, but if it does then I would think src would
> be the same?
 
I characterized MEM_COPY across many configurations, including cases where
only the source address was misaligned. Source-address alignment did not
appear to affect the behavior: the corruption required a sufficiently tall
matrix copy and a destination address not aligned to the pitch.
Unfortunately, the specification does not document this restriction.

Since including the source address could unnecessarily reduce the selected
pitch, I'd prefer to keep the workaround limited to the condition we
observed, unless you see another reason to handle both.

