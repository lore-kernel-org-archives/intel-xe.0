Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD5A3F9D0D6
	for <intel-xe@archiver.kernel.org>; Tue, 14 Apr 2026 15:28:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AEDB10E2E5;
	Tue, 14 Apr 2026 15:28:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dhW5TZNt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6970A10E2E5
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Apr 2026 15:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776180491; x=1807716491;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=3Gfb+D0t83m/hO39fa2ynJYK/fm8/LynPSN+dd3Ti4g=;
 b=dhW5TZNtNVAbA8dJVIGYwDzWLvaD59TT2+fOZl1jP6jlm+sfAV5S7xto
 oy3j91Ieoq/G1LULlzAhfcJh20uX+3PXY7vttLIAShSHukeBqg7o8SMDT
 qWsJ93mbLadYHrX4Ob1ogt8gOd9oGCP2YCG812r8drwQl6l53CQ2eIZwZ
 ccplq0bmSfMbFH8eQ9KzxdwNQjZ6BTrDOiidUcytCt6eJtoX23ezyjwT8
 GGcnhbMH+Bi9JIq+yyNtDaeUISN/WM3emjVTaVE1qQV5dXP8qesbEHDzn
 lYBjROCDJAkfLNuwsneSqQZEn6sP97FHtVb7XrrVYxw5MDmLRB0Nn2Ygy w==;
X-CSE-ConnectionGUID: JtYLfS8IRESAJCeUwPiplQ==
X-CSE-MsgGUID: EthluyNBS6aHN8r0UXN8Gg==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="79727775"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="79727775"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 08:28:11 -0700
X-CSE-ConnectionGUID: dFiWddnNT9W6vIhFiC7uXA==
X-CSE-MsgGUID: N6yV5HbfRYmxfytuokn3tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="229994808"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 08:28:11 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 14 Apr 2026 08:28:10 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 14 Apr 2026 08:28:10 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.70) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 14 Apr 2026 08:28:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a4GxNvucPFUM80Hb14gUuSmhu2vtjOdde1oLNlsBBJxnL9EZR5bD+JpcoyNw2ejX55LefIYlX9CTofyb0gdWolrE/zLaXGD9TOHwx82x0WJk2TGBNbl6RMooOltKZ03P1OGYhyoNoOFpvTJyhkiDkw/jjD5rgi7Qc28kCDbUTZcdZb89qejHqo49XbiwitX15PhkNu8wvk7mgOSUkzrwvQXk+b4x0/1L0pY7eQZelfbdC9VHPA1Ih+f1vCp2etWdDIh2cfC5XhYQ7r/MwLb1HHehx0BZkTj3awyS4Qm0AiDXmAhvbcL1D5K1nbMlWl7qQsYn3Z2w+tAvv4ufKui3iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SI/hehOVzXXWFk9I6IZV0VqcGwtaIJjFQwhMWgapF3g=;
 b=VUb0K/UtcexmmU+72wiBN9X2XmXiclTQfU0UaCFSf1vSKQIHLR8zlheL616FEiCx5dSAfpPM7rgofUho0BMN+muyVoEC/9v16QErktpnPjAfyMDg8ZZmzDnItLPFWQL67dmEUFCfEKBk98h9yZ9FVf0dpSbQWKYuhX/fgV+w6yn4Numz8JvE8Jn//2JMK4jVXNmPMluwBuUgby1vED7rxIawurQ/qf+ScgByigRTeINc+QxHhE78Vvwqscl5OLo76RkVk+L5mS7HnrbuJmldZ/SnHdALrBdyzrzpLXg50Aew8YWLVupIoSdBfyzoZGjAjFzqXVIje+aUEhvDDC3HZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by PH7PR11MB5886.namprd11.prod.outlook.com (2603:10b6:510:135::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Tue, 14 Apr
 2026 15:28:07 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a%3]) with mapi id 15.20.9769.046; Tue, 14 Apr 2026
 15:28:07 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>, <intel-xe@lists.freedesktop.org>
CC: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: Re: [PATCH 0/3] drm/xe/rtp: OA register whitelist fixes
In-Reply-To: <20260414035244.741342-1-ashutosh.dixit@intel.com>
References: <20260414035244.741342-1-ashutosh.dixit@intel.com>
Date: Tue, 14 Apr 2026 12:28:03 -0300
Message-ID: <87se8xwoho.fsf@intel.com>
Content-Type: text/plain
X-ClientProxiedBy: BY1P220CA0017.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5c3::6) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|PH7PR11MB5886:EE_
X-MS-Office365-Filtering-Correlation-Id: f8fb53da-5e11-4c47-aa7a-08de9a3a6d86
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|56012099003|22082099003|18002099003; 
X-Microsoft-Antispam-Message-Info: x5flQtFjtC6v4MW88Agk2KgDxnzT3120bGRMMGrPsH23C9UObn8SaeNdpFz1TWmilQfqh8+Wwg1A0roARJuXNIifTwoBMGEXLn7SYVvEtnxCHTqLhhOCftGVmib3/1ZXpnVYhYxISrIu0OLIirZ5ym/W9OS2ia/paogACoTiUp57IAL3KmMdj0oAuVXAwJzuRNHJK4iURYYwzqVpJLvHkJNiMOw2zG8LhcThbB0eQbQ/YSfpLqhmxaeSrn0xGMSdn0Za49Jj7RtbmjSANmZn0+vR8E2FtjluEXxNqYAbHTSY3FqlMbzIs4WpLNnJ5D7VwREWcv6tEFQ9bSasJVXrAIkfUU01jKNov9BHiw4EMzgpLq9uylNI6gRyZgtihNv1qy3j7fHLXaNilVh1Zloh6J+lKyBHjMW2n4LSIouW6G2I7TI2KXPxDR+mPk2FTrQ5l0n+N9lfLoD6YMra7jPZYMQNPZgMBGe2i94h0VhP7Q+4UAyuVBmgN4b/P3EwNNoe7W7PAwUl8BvnE6/4STesUYDvTKZcK6PgbuCgfuyKsU/f1pyaLlu2iOTupKRj2Jb8uguiXoWM5FmQyRDfqYCy3AHvQ3mFpLSaqzG+8vVSzKROLYW4S+/3bRR0Zxd1q6sBNwRQfzuBcMtA1ZMnT8gADnKpUbd1QAyVveaIV7qCfRCel6ZE0kmlCj0nsGC5/xFseL1Cy6mQUDYJs1bVjzXia9iN3yQNLTzZz9MukafZWIY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?l12Lv4EwvImMUam0hDE+Hg6c13dTjfmuijGC8OE4QusRIHsbqudfivsb+pOk?=
 =?us-ascii?Q?NbWP3SG+qpS1sH1gQcSwT+BAAnU2qhSjn9JOHtSGm04riruKM3yL1QQV0Ae1?=
 =?us-ascii?Q?3NLwyqaOSsKP0Rvi7BV+AL4gl4k+jxbnlh5xlweQD3gVRfrf+OIeSGOAoXJW?=
 =?us-ascii?Q?KPrLD+aTv0zhEf84jH8QQtCoLAoLbJOX8toS7mKmFTOY8aN0epQsydA3COgS?=
 =?us-ascii?Q?Au2kQf6IJAGjPatvhYI9MolHDW6SO0gxEvc3KjBlwBgWeH1aHXFoTdfhQhv8?=
 =?us-ascii?Q?3eRLHD4opU9fQTLNInG8gB465wPXXJfhfGhLtzbKClmDfglnuPIu6PRZE1gU?=
 =?us-ascii?Q?lR2En5d3/wQ4lzVnxyeOOcG+za5vZnxB/rLTOTU5Fqgmu+8Pv2rMwomaUYUQ?=
 =?us-ascii?Q?8lA8V6ewwDsIVn/nF/c76p47jmuOcV3K1w2JZGJKWjgMOAeS09JOEemXqs9V?=
 =?us-ascii?Q?8t3vSvG0JrZENQfbQ9tKCLpl6X6igh4iPdZ3Rynj9EryCEuAZMaTfJU58P6n?=
 =?us-ascii?Q?yxVm86VG9Mk3KENmpURqazlQ6G1KKAkY7D7HoIjWIcH0HcN0x8QDCwzbjsYv?=
 =?us-ascii?Q?IOoCy/L9N+pl/7w5SSovvqekOia3xjAh+fMx1PIA2/zebxweBfhAs+9keCvh?=
 =?us-ascii?Q?wfkm6kZJW9XLBHLF6ep9N1IyZQZzaIbIWTbZXHhDpdLVPw24nndhSbDQfeM2?=
 =?us-ascii?Q?bukEkMz6H7jmkKr69T1V+B5GTj+F9M7wWhkK03nuqGrR4GjHkAQy67Kw4T6O?=
 =?us-ascii?Q?+t4xttBkptvrlUHrxpwUaJgsTPcDTkbTn1+37KLpir0/T9YJJygFbsj2ZoLA?=
 =?us-ascii?Q?9Ga5wf3nI9OuRsbMs+SbR7JS4RDHEy5q+LkrN7xzwSRm81frTQBYaP1oLOWA?=
 =?us-ascii?Q?Oh6bv5QX9xgf0M/NaMj3HgKO4R8eWsNXBDdqmW8kD3fvJ/XmYkx8AuanrAJZ?=
 =?us-ascii?Q?Bgapg1nOJDtoLqoK5GVLP85vsB0IuCNL7YpKpLfR9UYSGmYYvNi5yG8BnOYz?=
 =?us-ascii?Q?M/6VFxaGV8K8YApZ+0VPd6G1HoJb/lDwZQbKY1C6ftB5TavwxIapT1ezVbiV?=
 =?us-ascii?Q?MhAOuu/O+YO1uPd0bVAoz+GpVAdzkLnadAvQiTMRNrI8YHgozlp7pVnv5WXO?=
 =?us-ascii?Q?oGJyZ31L76uublh8vV6A1Nr8SvFcl9v0vi7ejk4g+Tu0tBlFVJPDYK2WaMG/?=
 =?us-ascii?Q?ExqIfvjXN3pvNTiUEk9QSN//HDFQSoi7DXZlPB21pBUx85jQ0M6CPZ9c3es5?=
 =?us-ascii?Q?mrknEvvQ64BxlKo+WobMBwCGGeo3FcFtDxmhHWaatILFC/EwgwAqwPBVQW4J?=
 =?us-ascii?Q?D6WuncGXPxfdgiinZZBB81J1iksw9SCM8ZrSZptUWiOa4V9XHw8JBGt4MrlI?=
 =?us-ascii?Q?EIAJWccSVwycAgg9onk3A4xd/sWZ9VoxNiCyPKidHuZqYuNbPCUU8PW71NyW?=
 =?us-ascii?Q?NWrdwT2Id3nxAOPTo8tpQJs3eeyKTeGCMplsvYYnyJ1RCq5UocD8CcCSmYPg?=
 =?us-ascii?Q?9ASchGVynV+iN996ULSiVwOecBWNj07j1Y6D+K/6RfvsFeiONGW8kSXfF/H1?=
 =?us-ascii?Q?wtplX8JjkD5CGPGFXvuSko2PN/IJDrAg/MwoXlJIzGgfjhXaEz2HakYKPeg1?=
 =?us-ascii?Q?f/Nj4elH5eff0TXEkJLOa/WpBEqcEeXAeWUTqcvxVF8ukw14QTL60TPSU+61?=
 =?us-ascii?Q?jTMkQabBVckMMmjzBULjQXz3WZFBMblSHEUqw7909n7nFUr5ZlHcoUJxuCzu?=
 =?us-ascii?Q?bs5oOQWQXQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: mJRu/ui7r4CTu5ClytBu8VgA4GxECI9xZeJ0c1PenXmPZIJS8a/1Z8WWUOlHlbk8/aYxgAKKw//GOzdigEjH40wX1SUhlahgG/GaR2PHpL6QoAFUkGCYhXkaE07pQ1wQ9JQphSYIlmSOVy6m3XSkceZIY0ruB6r0S8PPA9r2JFEmkhO5EDmEFP5R2XkTLgZttioN82fLvd5/GiUi1ruoS+JtRTDNbAivIFxhQ93PTfUFm3k8KBa4y5WR7mwg1z3nX4faAICsYulQ3OvCRmITpLYGQYRNfYX9aOOMkI+WiCxZQKPhfZiG/CYQY7Zv/loxsajeAwOnVkVqwBSmRsQY0w==
X-MS-Exchange-CrossTenant-Network-Message-Id: f8fb53da-5e11-4c47-aa7a-08de9a3a6d86
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2026 15:28:07.1647 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i8TwyVhN12SVsWJP/HJcWa/sCDeA6Ddn4ngoHPkMhi2PjTtU2kTX5cPoo7U8RwvTiB6vgUL6YLN9aluiWObfig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5886
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

Ashutosh Dixit <ashutosh.dixit@intel.com> writes:

> Ashutosh Dixit (3):
>   drm/xe/rtp: Don't whitelist OA status registers
>   drm/xe/rtp: Don't whitelist OA head pointer registers
>   drm/xe/rtp: Fix offset alignment for MERT WHITELIST_OA_MERT_MMIO_TRG

Drive-by comment: These patches aren't really changing RTP processing or
infrastructure.  Maybe using "drm/xe/oa" as subject prefix would be more
appropriate?

--
Gustavo Sousa

>
>  drivers/gpu/drm/xe/xe_reg_whitelist.c | 12 ++++--------
>  1 file changed, 4 insertions(+), 8 deletions(-)
>
> -- 
> 2.48.1
