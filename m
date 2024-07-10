Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27FE7C3DA42
	for <intel-xe@archiver.kernel.org>; Wed, 10 Jul 2024 15:00:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED31A10E80C;
	Wed, 10 Jul 2024 15:00:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OccF1UHY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1851210E80C
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Jul 2024 15:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720623607; x=1752159607;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=HdFVxigXcF7ktps9SWwzYyAuZUeXbV65M+ldaSxphpg=;
 b=OccF1UHYavjeUrpVKLRCPlOZ+fsSarWLi9nXGsuXEErvpDp4bjurZwtg
 HtPvE06m8b0u6Gq4Dvehxhqj6aKJgQx095SF5aBLEDI5pvVaQqHxsiZGm
 9nFDyT/TPfHPG54F30w1h8dQoYHCX1r20EaZEf4P2O6Na7/jcBeq5j0gV
 16V6p2TRxhD/AecLygRZkYYAuBD7vWmNYxnzqQCavTzLS6nlQdz37tOHJ
 pyk7Xh77k7yyKd/wZIUmX+daMGFyakVL16k4r7bL8oSwaPVhsdhWamAfG
 XOpOb/1rAM+Scxm02k7aflWE1wXQAE9WK37mO7kUrpk3QXHmVX65rTPrb w==;
X-CSE-ConnectionGUID: aKTYsfwMRC+zGrL5gRY/eQ==
X-CSE-MsgGUID: w8NM2qxfS7K/+WAzdhLvCA==
X-IronPort-AV: E=McAfee;i="6700,10204,11129"; a="35485889"
X-IronPort-AV: E=Sophos;i="6.09,198,1716274800"; d="scan'208";a="35485889"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2024 08:00:06 -0700
X-CSE-ConnectionGUID: xdvEdoPzTMisJh+gSvMSKA==
X-CSE-MsgGUID: mpT1TydNRQunuDhJNoAe5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,198,1716274800"; d="scan'208";a="52547305"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Jul 2024 08:00:06 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 10 Jul 2024 08:00:05 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 10 Jul 2024 08:00:05 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 10 Jul 2024 08:00:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CgHx+WvDXtwAAVj8kY/ReGbEsvM29ox1YtSxdD0wDjYJKiwyRKtpl8BllXbT4FNvqDyk7bqjQUo2ngC1jHrG0DtJb6rHz/az0DUDKGUBvI/gLDAIcKkqZ75nO0LuQl91IuZfpSIjp1W8ZX+MaKFtVJyKich0R3OygoKrvipy+WvgiMcJzMQn2ip0pCUwoO2vnG9THheUHUKz28v0DQ++2Ec57WECkwikTr1W50ikfd0+9QVmxDmkF2YSiad1YdILrRDpBo1oDSaQSfI2/7Cjp0wa1d2t+YhyVeT7JATwH7cf31Ewa+iurj9fFziqSvDKJG/RHoBS26MUKHo/T2WCoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UCNPMJPe+wRIbXqWS+17bdGk0GYkkpkg/tIouUhPLHM=;
 b=CtwuAkfc7UXXDwfIX+Pp8scF6jiDyDdh2xrqCD3kZ+4GX7dWUgSKarpHEpmw7RFdB5+JEfpTvbBCouQnee7uuxxalDUuAuWN2yPLcN/sWbe90gamQdXUcHIJ13hDXf1MNMLcUMO6FVxSixCAuqhonsNi+vHsTdeBATr/tZDwuFS14lI8FwLAKaFUr78/2+wZVJynVb/f7pFMXMvu1gqHH+FaE3oXogkZdUg05T1wppvnGGVBDXUWyjm9mEkm5CjP5ElJZQZAV6Efv5A5WAz9S1w4tNIwJfgrsoUYVJWgGafJmvjNSuw1WadVy3h/Lg2N0W2BrP2KuOa3qFnn3GADnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ0PR11MB6719.namprd11.prod.outlook.com (2603:10b6:a03:478::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Wed, 10 Jul
 2024 14:59:52 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7741.033; Wed, 10 Jul 2024
 14:59:52 +0000
Date: Wed, 10 Jul 2024 09:59:55 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <jose.souza@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, <fei.yang@intel.com>, Ashutosh Dixit
 <ashutosh.dixit@intel.com>
Subject: Re: [PATCH] drm/xe/uapi: Expose EU width via topology query
Message-ID: <llboo4x7ihtit737wa23qmws4n7q5szvuvhxlakkvr4hhxshuc@gpbsxzfgrosw>
References: <20240710055440.1985620-1-lucas.demarchi@intel.com>
 <20240710145238.GD2905419@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240710145238.GD2905419@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: MW4PR03CA0134.namprd03.prod.outlook.com
 (2603:10b6:303:8c::19) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ0PR11MB6719:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a07bc72-90c4-4108-64bf-08dca0f0f3bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|27256017;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Dn+nRan8ikCmXsUP/DdBWhxYwU8sF/6wGgyLotsc7MfMA5AcTps2AG9LoHsK?=
 =?us-ascii?Q?XlGcCzvLCZFvYwbKRSoFC0fBBSoDL15y2VPoNC22NVEbxG/8myPFtjlMHOqi?=
 =?us-ascii?Q?BuzflpEhs9JcrK4v5YQbufH/49YT4GQzsHkbaYYkV6VJ8g2D4roAnf0Yd/HN?=
 =?us-ascii?Q?LI9gg7zD4WW8Mgu9MZ+gddTvxKlkFdTpHCiUJCVkUYo5vIOozOOKK+3jzNfr?=
 =?us-ascii?Q?whNiumG8UAFauiysFdr59FcPu20ioeK/yI/tMnjEjLgwSsYL/h84GczBoZiV?=
 =?us-ascii?Q?J57Nz9AUS+AgOGRqkA6Bx5asFHVh6UghcEKGqDxO2rq1FZajKYGC+XODn/S/?=
 =?us-ascii?Q?NihxNrNTKsWwY/UzkWrrVxnLCqMeX4H9StBegDO7i6uLhXDnuWY2814G6/pu?=
 =?us-ascii?Q?tk65extdSECbLSEdqFxeGWlw+vID3CFT7smo7k7fAy2ZLzhjIEOct32uz5GK?=
 =?us-ascii?Q?UQfiKnpJDGlv2HFfc7oSZMaLc7ivodFLIaz7IXcgNU8w/R52k0mnEA4AyJ2e?=
 =?us-ascii?Q?TfeSGMM/NbTueunjKVIFKkJZ2v6F04qq2HDAjl1CWeUYeQqwFsJ4Fh683304?=
 =?us-ascii?Q?7vm8NogqP9e0J9td2JYfbS/xOtSBMa0UVIr+K5y3Gfr4nHd35iQNKc7NH1+c?=
 =?us-ascii?Q?KCd+kaD0tOrkYvYWX/gyeDqk+t8PBe2pDxWcRTn0Rize2R4shSNKP9zySup3?=
 =?us-ascii?Q?28xoNxBv0qAV5JKS69CPICNxrpRpb/ITMuYi1ruE8wci2szOZg4b/unP7QHK?=
 =?us-ascii?Q?LVt+b1btyZ2CSH6dOjHpzuTsuoTrHTBA0thBRnGfT7yLMpTMzqQZHzO4oHCa?=
 =?us-ascii?Q?Nf1RC5dgW1JhW+vug7lIkCmejz1E4mMdUWOAhJrd3yx0zzr1BVjlNmuaKGJH?=
 =?us-ascii?Q?QR5uNmjF17xHG8zRgmsZW4XFNRYI5qAIhjV75CAW9Fg316GD5xzKJK9clcYc?=
 =?us-ascii?Q?A9RNZnvD/ri37rtFM1V1TS8oP13xiMkuyaWiDGzk0y1BwqI7KXhPKxKmEXd7?=
 =?us-ascii?Q?TWWVvVDor3IixPI9z+i9/luowJbO9bjKwKURW2XeQC7QocYzTNaYe2gIbjqA?=
 =?us-ascii?Q?bmOSn9QFPe+8UkKCfvPQQJBe+SDHARI7n2Rv4Wyz4OOH6EySiB1mLA8OMdV9?=
 =?us-ascii?Q?/MWEDF6p7qD9zWXcpg19LmfHuyvLNv8U1SouVVn+gTL5DbBpiA7oXaq/rhWF?=
 =?us-ascii?Q?uzYukj94mys2CYubX7U6BuszuURmtulxZPY1fmrTCRt8s8wg2yK1aJOEdFSO?=
 =?us-ascii?Q?Ui1NNeRNnypYZ2SPlvdPKVc4ZFEgTSfri1WUU+V5GzpIXuS9+c6do0TspJFx?=
 =?us-ascii?Q?Qv8L+BcWDOdD2gRQVOjBTaHMy80+f9ZdS1Dh3YAPQ+s09xUjIntFJ069pq/U?=
 =?us-ascii?Q?FVbXAoqtUC7qW/zjDIumR6f8GbOzQBOSrzhcWL0F2QU51/qLnA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(27256017); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ys2NmuQMIC/ABLEHiGsayKuSo1oi2RyX5R/nFPTCAzeqk9sJ0nqAedLH3cOP?=
 =?us-ascii?Q?/LdAVdpe7iqdcaYuJREZ9DY1gzktGv4JoLU97FSagbHgDZK6uqlpPJ6SMIMg?=
 =?us-ascii?Q?CChxRalA5KLEup2J2ANjnpUSYPsNeVPi8GlHBj/mGHKz6u1YV8jwqmz/3gN8?=
 =?us-ascii?Q?qNQ5yySs+vVX+9s4K/u2oH/txsqLxfRWS1jpiwGsHtvrKbgsld5nmslyBDUR?=
 =?us-ascii?Q?IfQQotqUUmqHfU61UYHU5LIhd0iwNUnrukaptOL9C9iG0v5Cwi9LSVmSuKUd?=
 =?us-ascii?Q?bXUMZnw8dAoL3/S9Y9dZqAF/eoPAAnFWaZzAWfmO0zjFbu9MK5t9qnSe6ztF?=
 =?us-ascii?Q?2Kaad0/MUkZZ2a3z0WAmsjkmj3HKTaZxbvBiVbHWKjM0pCKQ7BbF6GVhJles?=
 =?us-ascii?Q?/4++TAiaMXHgGOnYQZmEBjv+64V/InAMoXwBRTtqDcXCk9jX6GQg5BEKRMJo?=
 =?us-ascii?Q?547gNW5K3eIYisyazU0InSUOrhRkZJgLDAAB6vTxuAL5Ix51LojcdDVpjEH1?=
 =?us-ascii?Q?D1Tx2q+ue6Gm0WY8V8qfTsmIdDTLw366NGZkMo7OJSj0Mt+vHx9UBqsOBwrC?=
 =?us-ascii?Q?8IX9hxdQlVql4OaHzVlCQWY6bLzf8GD7sKMiYCI74OvUQLUEgu1gT+0aIWse?=
 =?us-ascii?Q?Rv5FoASK4LVC0cP6Vn1gVe9MZiq22gnX/YIcmIa8JDMAbq5o6V6I2Y7Qbbei?=
 =?us-ascii?Q?lfRJDIS95MmLtsuD1a9fWuXowH16qEp6OHKNJVJzlDqEf7A5LungavYbqtii?=
 =?us-ascii?Q?PMxw/NfUc8NeNAahTs0/aZ1KsSQbVv8V+W3HbIj8nrnVPpYCVsOwybjmIokY?=
 =?us-ascii?Q?FnUFKNuoBt92qNZprASdsED00Xipb6O/5qf/dFzB4vh8b7WbruvdHSckFrdL?=
 =?us-ascii?Q?z7XQaFACtTU98f/9dDxnboWV8QVKkRAY1mZeJDDKxbFFiGa1bLfp5wKOkMpj?=
 =?us-ascii?Q?/LQHKQwOkTeV0JPMdaqs2SiChR4JVkZCt33gakLARumNmz4WOct5yHLCcWiG?=
 =?us-ascii?Q?adRZ4ZbSGIhrO18vh/EpJ78gIUXZ9Oxst4tjvK/2BLYmCiCmJeCTm0cpY3mF?=
 =?us-ascii?Q?QjuP3PuW/Wihk7evIkuwoi2lCLTn8vXuMmnfiaxAVpD2cmak5jtoh91MBsmx?=
 =?us-ascii?Q?a3X3oNc83tgdRDqpqQLewQR88ICbmPUVmR/RJuHxR3zQX4X2bCr+uo22assI?=
 =?us-ascii?Q?Kfl/FJSht3nMgV1T7JLV0hwAu0pxGvHCDvw5FaozsxxFXTg59adDsQ/OxCdj?=
 =?us-ascii?Q?OvZEGcjx3eb9YoZPpoMXDiGobZrYygBqfAakFaa2YzCeRlUWiFFv8aTTGK+W?=
 =?us-ascii?Q?CsXN4Cnls0N56LZSnuN/lfUGY8V6PPC5YewqwPAvfcygrA6r+bcxGCYwzkb5?=
 =?us-ascii?Q?97Mo021A5LE1nmXzbUaQXYXufpArkCFgSbRQ0T5FgUi2jLWDmK6Wb0wsjzmH?=
 =?us-ascii?Q?Y2OA0gaUeGpJH9b29VIRW4BNOcKrVkfb+uz/68VLJfF4sIbkLHCxOqcpP/QE?=
 =?us-ascii?Q?ZJNjy5ya4VmgaGBgs+eBPUm63zQup6W4mN45TksU4w6wtOzobxLwnoAvwMmu?=
 =?us-ascii?Q?SoxdKasayHMtLzbFtZ8c2/TrrCTQHgG5e1Nmf2w+vjmh7d7vujHuv9z6AAj5?=
 =?us-ascii?Q?Zg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a07bc72-90c4-4108-64bf-08dca0f0f3bd
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2024 14:59:52.3396 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PGTVRUElr4JuceSErBjogMBxJE/nYatMp+61QaltaCSJtq7VfNAnc+z0cDYdanC2R9MbhDT239sKBI8HRgNtNUctcRAhFISnOFmib+B5+S8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6719
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

On Wed, Jul 10, 2024 at 07:52:38AM GMT, Matt Roper wrote:
>On Tue, Jul 09, 2024 at 10:53:54PM -0700, Lucas De Marchi wrote:
>> PVC, Xe2 and later platforms have a 16 wide EU. We were implicitly
>> reporting for PVC the number of 16-wide EUs without giving userspace any
>> hint that they were different than for other platforms. Xe2 and later
>> also have 16-wide, but in those case the reported number would
>> correspond to the 8-wide count.
>>
>> Add a new item to the topology that aims to clarify what the EU_PER_DSS
>> mask means. This new item uses mask[] as a single u8 value. Xe2 and
>> later platforms start returning the number of SIMD16 EUs.
>
>So it looks like your patch is adding a new standalone "EU type" item to
>the list of masks returned by the query.  I.e.,
>
>        - DRM_XE_TOPO_DSS_GEOMETRY = ...
>        - DRM_XE_TOPO_DSS_COMPUTE = ...
>        - DRM_XE_TOPO_DSS_EU_PER_DSS = ...
>        - DRM_XE_TOPO_EU_WIDTH = {0, 1}
>
>I think it would be more natural if we just didn't include
>DRM_XE_TOPO_DSS_EU_PER_DSS in the list of masks returned on new
>platforms, but instead added a new type of mask that would be returned
>on the newer platforms.  I.e.,
>
>   Old Xe1 platforms receive from query:
>        - DRM_XE_TOPO_DSS_GEOMETRY = ...
>        - DRM_XE_TOPO_DSS_COMPUTE = ...
>        - DRM_XE_TOPO_DSS_EU_PER_DSS = ...
>
>   New Xe2 platforms receive from query:
>        - DRM_XE_TOPO_DSS_GEOMETRY = ...
>        - DRM_XE_TOPO_DSS_COMPUTE = ...
>        - DRM_XE_TOPO_DSS_SIMD16_EU_PER_DSS = ...

yeah, I like this and wouldn't be an abuse of the field "mask[]" like
I'm doing here.

Should we document that the query may not have all the items?

thanks
Lucas De Marchi
