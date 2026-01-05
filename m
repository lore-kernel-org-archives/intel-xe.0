Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1663BC79F9E
	for <intel-xe@archiver.kernel.org>; Mon,  5 Jan 2026 15:45:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB5E210E461;
	Mon,  5 Jan 2026 15:45:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eDO3Z6eb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96E8F10E461
 for <intel-xe@lists.freedesktop.org>; Mon,  5 Jan 2026 15:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767627957; x=1799163957;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=TOgYshNwVbD4lNpaHlgyDnHLy3rI32C0LAxxVqSFZHk=;
 b=eDO3Z6eb0Mi7e4iNkXfZTkf9ccsSlobvTS5wDK/YoUfXlxMxtamWeFaI
 4PlqMKoPb2HJNOLppOM8jceiIyZtocXKJ4Guxqxdb4FRiI15QUIr7iIY5
 TlJLxrCQ2YCH1NCOvaokHNOOTNaNrlXPUCRtvJwDocaG7dBRYse8mpsG1
 vOaNMdQ9fpdGkL9pZsPrDn2OcdVelCdkbtGm/Rwh+2JOfNesetmGYWN6H
 vQ9TEsa+99sDmq0b2N+mGnEsNSkY1odsSYljGz4fPYtsXCqNQsJ3xfIlX
 CpvufUIW2o5ojfeWMyEI9o9bCv1Em29Kqp/tXaldrcGtfdX7y0xDh+Nyq A==;
X-CSE-ConnectionGUID: TE09snh7QAWmuyCCVQLdVA==
X-CSE-MsgGUID: Tev7OQLZQoCHSBrkEktgSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11662"; a="68898311"
X-IronPort-AV: E=Sophos;i="6.21,203,1763452800"; d="scan'208";a="68898311"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2026 07:45:56 -0800
X-CSE-ConnectionGUID: do2eTkQOTpeCkS6hxlM0KQ==
X-CSE-MsgGUID: 61WKPE+JSReh6ieAA1AajA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,203,1763452800"; d="scan'208";a="233555961"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2026 07:45:56 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 5 Jan 2026 07:45:55 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 5 Jan 2026 07:45:55 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.5) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 5 Jan 2026 07:45:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TtbuS3qBQnlesWzZa9FkHdDFGMp6xBIahhXYn4fx9gsLFussS9E7FEOcheuFU0nd4lQaKZdmNC7Nqa9ruPyAcZzH6plt8yhEK1NE8yS32yAaRl0Zl9uTsdQX+oVYgRqbjPhi+6BrjVP3XgJT8DI5XrMTyujLcyVi8DhAa8Mup5/m6VUs94fuw/94eu53m90pfbIH5ipmzNE7UFEyrq+HOYYKTHGaXLk/Mt3g7TxqLl/bHMHW/y+6/3BASJIdwzZzcuqhRxM7H38SMyaJ9FGMcw+FAPAE1U9BMtLzhm8/oGO8cJfr/tTNzcTn2rwFRf7sjp8MBN02UJNriQOlK1MBHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SO+Ih7QHbmcSYJK38yIObBmNIVOuxu0o7DUtnVrmb04=;
 b=UFFo02BZLh2BYS8S/LK9I+hM3hFaT4POb7DBguqZ0BufBayoLzHFhHkhBfsMIWIhE4HlZyBJPGSdmk97ONlLMz8Z6D1nVrNyGuYZa7t8uZZKmShuNCamCHB4m4yvv4aTz/xTdiESxze6nxdWb+XQX/RTd90yjadsLOoBZkUppEc8uoGYdokhLRj6mMxAlRHH0oLuJzETOtkR3j7CjACroZ9tyHZP9dGnEECw/Hi+vpEQL+0kRYYyQJQUjUw8ln7ZL3K6rZIV6i+3g7AxBYDkxTZ5N8mHRRtxVtU6A19NU2GPf/yuo9wIcZPEpn3kifWHfhsZGeXxE6QEtQ5tl2jaug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SJ1PR11MB6130.namprd11.prod.outlook.com (2603:10b6:a03:45f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Mon, 5 Jan
 2026 15:45:51 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.20.9478.004; Mon, 5 Jan 2026
 15:45:50 +0000
Date: Mon, 5 Jan 2026 07:45:47 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Raag Jadav <raag.jadav@intel.com>
Subject: Re: =?utf-8?B?4pyTIFhlLkNJLkZ1bGw6IHN1Y2Nl?= =?utf-8?Q?ss?= for
 drm/xe/i2c: Force polling mode in survivability (rev2)
Message-ID: <20260105154547.GL1180203@mdroper-desk1.amr.corp.intel.com>
References: <20260105080750.16605-1-raag.jadav@intel.com>
 <176760898079.125419.2875201445136931873@a3b018990fe9>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <176760898079.125419.2875201445136931873@a3b018990fe9>
X-ClientProxiedBy: SJ0PR03CA0268.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::33) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SJ1PR11MB6130:EE_
X-MS-Office365-Filtering-Correlation-Id: c779135b-2316-4b29-2ac7-08de4c718022
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?d3aLG9XVZ6utwg8dkJsSUQClYihhpgU1KYPNQ6x/ZrJ5uWUUd0orHEUgjX+W?=
 =?us-ascii?Q?sDNPINRFtC8Ft/V5C7er5GtlulGOFkXiss498c19K4SpGDzsOuc22xnhVgBv?=
 =?us-ascii?Q?F0G9FGvACnETXnMK/17t5pJFt2ISB7Cnjy2CaurvIuw9tRbuWl3sRBLYW1KQ?=
 =?us-ascii?Q?ryfLfKMDx5N2JhXaNDA5GewnyOM9M915wTKSv80/zeemypJv74HjrP+PFtt+?=
 =?us-ascii?Q?dojUkfp26ek/PyZNR6kMW8Xvf/r2Lp/PGgxgJ9dMpoQ7iqQOnjHKAjPOVcUG?=
 =?us-ascii?Q?3kYM8GkpLRMVPdVF+XE3htqJPcHHVq4NbF+IWzrpvfI1wu6INnMKBZs1r0Qu?=
 =?us-ascii?Q?uqPL5ZdnemDu8y3wU1ALLMbbu2o+IEQFGgUnLon0bFlIf9I87QhKH6O9AwS2?=
 =?us-ascii?Q?aGPPf/gvtlZOAvpmoHxsriWhKLt3IqU7nDsdRrFe2ogCpXjfTBmIWAVZY1x3?=
 =?us-ascii?Q?lL524K9HL+YzvxXbFOtitWUOP8DXoaxFph+H7nhokpfFQooR5lmvGpTHUJFp?=
 =?us-ascii?Q?Mq5IsONac5PR8Z6YDg3rHWu6Sl+WYWxU6TlPBCYIA7JoS6zkM74AGmDxCPgK?=
 =?us-ascii?Q?NDsiKm9Amu+81Nr3N4XJPi7Gqg6WqsPOTy+xCu6RIct3SB1uGGRjVZZ01/uq?=
 =?us-ascii?Q?1Qj1yPz1UBk4p6piy9bBlUWvScX2nBMMTk7zPA4Ceyni9lOVVC/RUgYsj6+9?=
 =?us-ascii?Q?vjbatx9pkCUu5Hn7wzzPiInyq7JMszaHjC4Yc80CAMj82BPzAjFcvtOII9hU?=
 =?us-ascii?Q?DWxLd8p+C5KPtBNbAsA+zrfdzPnOj9jVaTeGWOoS6P23CBPb4s6wZGYvapZM?=
 =?us-ascii?Q?Jq8GqOvEaR1H11wX1WSfGLeKY7BpZ+mDuf8qMxBW1FHJsADgwCcG1THEFMvO?=
 =?us-ascii?Q?ujew6QlYu07Q2egDVFjOjTZ6VMkz+YRYD1LbaUUwIJM5UAcCg5CECpuNYUW6?=
 =?us-ascii?Q?UQME9MjZ5J6DKOTTJZaNXvPieDWO+upzDGqaAr5ou77BbcLGkm2yA2lZPeuH?=
 =?us-ascii?Q?qW91qxzzCa+8+c1jmwbY9UVu3ZzovrzolavCwYfwSFlzSfOStNrn0ExXgZYo?=
 =?us-ascii?Q?FS5B0VNvQsfsNJczjzF84dNg3fUtkxcmftqD9n2S9FLxhpS4Bb8ngldG7s3I?=
 =?us-ascii?Q?QbUwMb+uWC9s/Y60PrcZXB75sNNeEbqzhXIOQKvYE8U0FNTf9hega1hLYFAX?=
 =?us-ascii?Q?UxutbrlMqtyl7ZRpgdVnddkuAUqtaLZEUvayiIdWf4KTnI++q9eP9rOLmnBA?=
 =?us-ascii?Q?3ci78cw6iDMy+yTAb/YGDpc6X5OL6Sy17J7Oc0qJq+0B8cqHx2+jKr5FwVIi?=
 =?us-ascii?Q?oBsBO/S4T/88M/RFIzf/0HBvqX7+AWKhUaPhxeYl11CEZjEIT8Skxz40l79h?=
 =?us-ascii?Q?1vW4yYa9ZNVmUC4HQ4eq+3e9bVdFfp05GxgZQ5+rQ+e1FVZ+1w=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4s+/CWRZqdswm5u8n9oMhRRiMjLIcdd5+iveu1iKxBhG0/tlN7nzoJDAz8el?=
 =?us-ascii?Q?Y/TpKPcQOq0lTPQfngj3ujNM1zsQzw7M2wiHjI1Fj94U5uY3Y9xw9o7kxDtE?=
 =?us-ascii?Q?zhCZCkBycdnrbx+g6xUmb+jtuu4sim14iMGj6yQjmp0pz3WuQzqL1WHMF9Fc?=
 =?us-ascii?Q?h0Hv4XItKYN5Y9LqVoa79vcqFG14WHvWsI5y2CE11dnbuotzR54s2qnmCNLh?=
 =?us-ascii?Q?oBYhaMHawywZ+me+x1nI9OI0PCPCcgGv8AMAHm6ZD2/twSouGtpTndqVOQYC?=
 =?us-ascii?Q?II7ZCePnh2pew82MfEBxXiG8dWr0fYBu7qjmCiXgX72VcSCBf4K6xOhMqQc1?=
 =?us-ascii?Q?oTuPX7eME/mwQiwjAfBj19bVdN+STY7HQOht9ybje6UgHTfQ9g/z8MeBTKMN?=
 =?us-ascii?Q?I9LAl4aTI0A/Jo0C0J3B5s2wRENXs8+DzHx/+cuPeQf+zEhOopv2HDuR3Y3k?=
 =?us-ascii?Q?q+o1LCw0qExEakqxstU8+XT5h20QaA1/R9e7+ctdkQWPQkQLMd6XFaN1w6he?=
 =?us-ascii?Q?Pb07cyEm230HdNJH2CsJjOMduFWTbLmSpGM+tnq7mIatwFqd+adbeVwXm21o?=
 =?us-ascii?Q?Slvp23S99/nxkU4J0lVijmDD5YkkqLGC0VMLef0tsk9XMfWGLYcd0Ioyq146?=
 =?us-ascii?Q?iPA60AYAAm6oK8weYWHPJ+XghMZb1eC5I9i+kAogKaCAfEICUr97PXwA5qD7?=
 =?us-ascii?Q?n3+EVbsdaEVXdcXEh+/EisdxdMksBZkbij9OI28x6k24nWaLnZwtfJ31Om0J?=
 =?us-ascii?Q?LsMGEly1B3HKhz8Lbl/pTObWmPMtf4BhQ01h8QzI/wCSZHO5jbJ+gtcvHshU?=
 =?us-ascii?Q?nXNpCctoi2dcJC71MCV5A0t6S14SksQRTef/AIr/jzGpVE2I3FGybIz70Eop?=
 =?us-ascii?Q?tlDfeuoQDj+i3Lo2G1HEsUR9FHJiKFYQCTGQZun8qbBia0OAgAuhqAFph2D2?=
 =?us-ascii?Q?3aPdN+xz9GHOvFu8IuuXhQkn2fdDDqjSGez8ShAEy6RDdQSsK4IDD52oiNl7?=
 =?us-ascii?Q?sOtLUgec+7B4zzOSrai7kyoy0wP9rx0nlQkoSlJK+vPivyxjQ9QZTrM7k9eN?=
 =?us-ascii?Q?g+E2jz3/i65vGQreoesFHqnHfG4vuMII6Vnhxq7h0W9zhMlIDz4JrVB/u3MU?=
 =?us-ascii?Q?aPmsD+l7WU+aiXztOLlaNnLqWhrvo98zwF5FZ/b1NGhMnmg3ZvxEcnpYfKNz?=
 =?us-ascii?Q?ObefLi10xH9mv7DVmOF2AcPTASlWmrvMVN0G/gmSx6wTWy06aaGWfZX7iRSO?=
 =?us-ascii?Q?LyqTSamjzeO+NvZzhkopwGAYaWaANi4cl6xO9N9TGmzgulAhV/ds7V6luXnQ?=
 =?us-ascii?Q?iADxJ27LwvjKLQRjaRQUFcyk6Ah1li6V3nJMvlMguLxHDQ9oVmMSUk6X2UaO?=
 =?us-ascii?Q?BxwBdv0cJWao4K+t8CNdKv2SHDehaHk+5msprm14rvLhFl5Tu/a2bKaa5N0O?=
 =?us-ascii?Q?5BM9DjYlrDeqwVYE6LSa3K5SxmY4e8a5gN48GwluGNycQnZ+BoNXyeMeSvr/?=
 =?us-ascii?Q?i1ZM0sApEXR02PW3LhVHTBtmMLjP4gv5ldx6XFeogoe8dSv+chj7sQxyv+5t?=
 =?us-ascii?Q?/ciYT6PuiCjuDkkTrsw3o7AuhYlCb5rDiZaECaUNocTPR4ByqZ+GVoHIkLoa?=
 =?us-ascii?Q?wovXFQSAhAngj5lJbeisISInKZ1WQ6gIXsJMIVt1IzZqsZhIaBg8yTIbEcvO?=
 =?us-ascii?Q?bwffSBNzBApHGd6kY3UfjWkZ7rODQaeLHvks3sLQ3nNBWCFYCxxa+L7ncjMs?=
 =?us-ascii?Q?I013smEhjMgs4eJqO9swqWBR9PF3kZg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c779135b-2316-4b29-2ac7-08de4c718022
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2026 15:45:50.6627 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 21PB28jtZGCC9YL0kE1wIBL3eMQ29yNBOS4OWxjNflaHMJDNFhwE4k67V7fERYopdAnZyblznMOuxxZBoZLpjA5jaZt7jgMkcMd9VvxSegw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6130
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

On Mon, Jan 05, 2026 at 10:29:40AM -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe/i2c: Force polling mode in survivability (rev2)
> URL   : https://patchwork.freedesktop.org/series/158824/
> State : success
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-4327-211191d88d04debf5ad0e283336efb73e5e8a7ab_FULL -> xe-pw-158824v2_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **SUCCESS**
> 
>   No regressions found.

Applied to drm-xe-next.  Thanks for the patch and review.


Matt

> 
>   
> 
> Participating hosts (2 -> 2)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-158824v2_FULL that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@intel_hwmon@hwmon-write:
>     - shard-bmg:          NOTRUN -> [FAIL][1] ([Intel XE#4665])
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158824v2/shard-bmg-1/igt@intel_hwmon@hwmon-write.html
> 
>   * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
>     - shard-lnl:          NOTRUN -> [SKIP][2] ([Intel XE#3157])
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158824v2/shard-lnl-8/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1:
>     - shard-lnl:          [PASS][3] -> [FAIL][4] ([Intel XE#6054]) +3 other tests fail
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4327-211191d88d04debf5ad0e283336efb73e5e8a7ab/shard-lnl-5/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158824v2/shard-lnl-3/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1.html
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
>     - shard-bmg:          NOTRUN -> [SKIP][5] ([Intel XE#2370])
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158824v2/shard-bmg-8/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
> 
>   * igt@kms_atomic_transition@plane-all-transition-nonblocking:
>     - shard-bmg:          NOTRUN -> [ABORT][6] ([Intel XE#5545]) +1 other test abort
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158824v2/shard-bmg-2/igt@kms_atomic_transition@plane-all-transition-nonblocking.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
>     - shard-lnl:          NOTRUN -> [SKIP][7] ([Intel XE#1407])
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158824v2/shard-lnl-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
> 
>   * igt@kms_big_fb@linear-32bpp-rotate-270:
>     - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#2327]) +3 other tests skip
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158824v2/shard-bmg-1/igt@kms_big_fb@linear-32bpp-rotate-270.html
> 
>   * igt@kms_big_fb@y-tiled-addfb-size-overflow:
>     - shard-lnl:          NOTRUN -> [SKIP][9] ([Intel XE#1428])
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158824v2/shard-lnl-8/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
>     - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#610])
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158824v2/shard-bmg-10/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
> 
>   * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
>     - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#1124]) +11 other tests skip
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158824v2/shard-bmg-8/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html
> 
>   * igt@kms_big_fb@yf-tiled-addfb:
>     - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#2328])
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158824v2/shard-bmg-3/igt@kms_big_fb@yf-tiled-addfb.html
> 
>   * igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:
>     - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#2314] / [Intel XE#2894])
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158824v2/shard-bmg-1/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html
> 
>   * igt@kms_bw@linear-tiling-3-displays-1920x1080p:
>     - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#367]) +2 other tests skip
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158824v2/shard-bmg-10/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html
> 
>   * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs:
>     - shard-lnl:          NOTRUN -> [SKIP][15] ([Intel XE#2887]) +2 other tests skip
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158824v2/shard-lnl-8/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs.html
> 
>   * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:
>     - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#2887]) +16 other tests skip
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158824v2/shard-bmg-9/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-c-dp-2:
>     - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#2652] / [Intel XE#787]) +17 other tests skip
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158824v2/shard-bmg-10/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-c-dp-2.html
> 
>   * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:
>     - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#3432]) +2 other tests skip
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158824v2/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html
> 
>   * igt@kms_cdclk@mode-transition:
>     - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#2724])
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158824v2/shard-bmg-9/igt@kms_cdclk@mode-transition.html
> 
>   * igt@kms_chamelium_color@ctm-max:
>     - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#2325]) +1 other test skip
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158824v2/shard-bmg-2/igt@kms_chamelium_color@ctm-max.html
> 
>   * igt@kms_chamelium_color@gamma:
>     - shard-lnl:          NOTRUN -> [SKIP][21] ([Intel XE#306])
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158824v2/shard-lnl-2/igt@kms_chamelium_color@gamma.html
> 
>   * igt@kms_chamelium_frames@hdmi-frame-dump:
>     - shard-lnl:          NOTRUN -> [SKIP][22] ([Intel XE#373])
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158824v2/shard-lnl-5/igt@kms_chamelium_frames@hdmi-frame-dump.html
> 
>   * igt@kms_chamelium_hpd@hdmi-hpd-fast:
>     - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#2252]) +11 other tests skip
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158824v2/shard-bmg-3/igt@kms_chamelium_hpd@hdmi-hpd-fast.html
> 
>   * igt@kms_content_protection@content-type-change:
>     - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#2341]) +1 other test skip
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158824v2/shard-bmg-3/igt@kms_content_protection@content-type-change.html
> 
>   * igt@kms_content_protection@dp-mst-type-1:
>     - shard-lnl:          NOTRUN -> [SKIP][25] ([Intel XE#307])
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158824v2/shard-lnl-1/igt@kms_content_protection@dp-mst-type-1.html
> 
>   * igt@kms_content_protection@legacy:
>     - shard-bmg:          NOTRUN -> [FAIL][26] ([Intel XE#1178]) +3 other tests fail
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158824v2/shard-bmg-7/igt@kms_content_protection@legacy.html
> 
>   * igt@kms_content_protection@uevent:
>     - shard-lnl:          NOTRUN -> [SKIP][27] ([Intel XE#3278])
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158824v2/shard-lnl-8/igt@kms_content_protection@uevent.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-512x170:
>     - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#2321]) +1 other test skip
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158824v2/shard-bmg-9/igt@kms_cursor_crc@cursor-offscreen-512x170.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-32x10:
>     - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#2320]) +4 other tests skip
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158824v2/shard-bmg-7/igt@kms_cursor_crc@cursor-onscreen-32x10.html
> 
>   * igt@kms_cursor_crc@cursor-random-512x512:
>     - shard-lnl:          NOTRUN -> [SKIP][30] ([Intel XE#2321])
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158824v2/shard-lnl-3/igt@kms_cursor_crc@cursor-random-512x512.html
> 
>   * igt@kms_cursor_crc@cursor-rapid-movement-32x10:
>     - shard-lnl:          NOTRUN -> [SKIP][31] ([Intel XE#1424]) +1 other test skip
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158824v2/shard-lnl-5/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
>     - shard-lnl:          NOTRUN -> [SKIP][32] ([Intel XE#309])
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158824v2/shard-lnl-7/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
> 
>   * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
>     - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#2286])
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158824v2/shard-bmg-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
> 
>   * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
>     - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#1508])
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158824v2/shard-bmg-10/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
> 
>   * igt@kms_dirtyfb@fbc-dirtyfb-ioctl:
>     - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#4210])
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158824v2/shard-bmg-8/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html
> 
>   * igt@kms_dsc@dsc-with-bpc-formats:
>     - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#2244]) +2 other tests skip
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158824v2/shard-bmg-3/igt@kms_dsc@dsc-with-bpc-formats.html
> 
>   * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:
>     - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#4422])
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158824v2/shard-bmg-7/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html
> 
>   * igt@kms_fbcon_fbt@fbc-suspend:
>     - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#4156])
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158824v2/shard-bmg-7/igt@kms_fbcon_fbt@fbc-suspend.html
> 
>   * igt@kms_feature_discovery@psr2:
>     - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#2374])
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158824v2/shard-bmg-3/igt@kms_feature_discovery@psr2.html
> 
>   * igt@kms_flip@2x-nonexisting-fb:
>     - shard-lnl:          NOTRUN -> [SKIP][40] ([Intel XE#1421])
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158824v2/shard-lnl-4/igt@kms_flip@2x-nonexisting-fb.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
>     - shard-lnl:          [PASS][41] -> [FAIL][42] ([Intel XE#301]) +1 other test fail
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4327-211191d88d04debf5ad0e283336efb73e5e8a7ab/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158824v2/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
>     - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#2293] / [Intel XE#2380]) +8 other tests skip
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158824v2/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:
>     - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#2293]) +8 other tests skip
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158824v2/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt:
>     - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#4141]) +13 other tests skip
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158824v2/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt:
>     - shard-lnl:          NOTRUN -> [SKIP][46] ([Intel XE#656]) +2 other tests skip
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158824v2/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render:
>     - shard-bmg:          NOTRUN -> [SKIP][47] ([Intel XE#2311]) +37 other tests skip
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158824v2/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
>     - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#2352]) +1 other test skip
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158824v2/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
> 
>   * igt@kms_frontbuffer_tracking@plane-fbc-rte:
>     - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#2350])
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158824v2/shard-bmg-3/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
>     - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#2313]) +41 other tests skip
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158824v2/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
> 
>   * igt@kms_hdr@invalid-hdr:
>     - shard-bmg:          NOTRUN -> [SKIP][51] ([Intel XE#1503])
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158824v2/shard-bmg-10/igt@kms_hdr@invalid-hdr.html
> 
>   * igt@kms_hdr@invalid-metadata-sizes:
>     - shard-bmg:          [PASS][52] -> [ABORT][53] ([Intel XE#6740]) +1 other test abort
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4327-211191d88d04debf5ad0e283336efb73e5e8a7ab/shard-bmg-1/igt@kms_hdr@invalid-metadata-sizes.html
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158824v2/shard-bmg-9/igt@kms_hdr@invalid-metadata-sizes.html
> 
>   * igt@kms_joiner@basic-max-non-joiner:
>     - shard-bmg:          NOTRUN -> [SKIP][54] ([Intel XE#4298])
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158824v2/shard-bmg-10/igt@kms_joiner@basic-max-non-joiner.html
> 
>   * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
>     - shard-bmg:          NOTRUN -> [SKIP][55] ([Intel XE#2925])
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158824v2/shard-bmg-3/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html
> 
>   * igt@kms_plane_multiple@tiling-y:
>     - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#5020])
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158824v2/shard-bmg-1/igt@kms_plane_multiple@tiling-y.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-a:
>     - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#6886]) +4 other tests skip
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158824v2/shard-bmg-10/igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-a.html
> 
>   * igt@kms_pm_backlight@bad-brightness:
>     - shard-bmg:          NOTRUN -> [SKIP][58] ([Intel XE#870]) +1 other test skip
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158824v2/shard-bmg-8/igt@kms_pm_backlight@bad-brightness.html
> 
>   * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
>     - shard-bmg:          NOTRUN -> [SKIP][59] ([Intel XE#1439] / [Intel XE#836])
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158824v2/shard-bmg-7/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
> 
>   * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:
>     - shard-bmg:          NOTRUN -> [SKIP][60] ([Intel XE#1406] / [Intel XE#1489]) +4 other tests skip
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158824v2/shard-bmg-1/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html
> 
>   * igt@kms_psr2_su@page_flip-nv12:
>     - shard-lnl:          NOTRUN -> [SKIP][61] ([Intel XE#1128] / [Intel XE#1406])
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158824v2/shard-lnl-5/igt@kms_psr2_su@page_flip-nv12.html
>     - shard-bmg:          NOTRUN -> [SKIP][62] ([Intel XE#1406] / [Intel XE#2387])
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158824v2/shard-bmg-1/igt@kms_psr2_su@page_flip-nv12.html
> 
>   * igt@kms_psr@fbc-pr-sprite-plane-onoff:
>     - shard-lnl:          NOTRUN -> [SKIP][63] ([Intel XE#1406])
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158824v2/shard-lnl-2/igt@kms_psr@fbc-pr-sprite-plane-onoff.html
> 
>   * igt@kms_psr@psr2-primary-page-flip:
>     - shard-bmg:          NOTRUN -> [SKIP][64] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) +17 other tests skip
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158824v2/shard-bmg-3/igt@kms_psr@psr2-primary-page-flip.html
> 
>   * igt@kms_psr@psr2-primary-render:
>     - shard-bmg:          NOTRUN -> [SKIP][65] ([Intel XE#1406] / [Intel XE#2234])
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158824v2/shard-bmg-1/igt@kms_psr@psr2-primary-render.html
> 
>   * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
>     - shard-bmg:          NOTRUN -> [SKIP][66] ([Intel XE#1406] / [Intel XE#2414])
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158824v2/shard-bmg-10/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
> 
>   * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
>     - shard-bmg:          NOTRUN -> [SKIP][67] ([Intel XE#2330])
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158824v2/shard-bmg-2/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
>     - shard-bmg:          NOTRUN -> [SKIP][68] ([Intel XE#3414] / [Intel XE#3904]) +1 other test skip
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158824v2/shard-bmg-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html
> 
>   * igt@kms_setmode@basic-clone-single-crtc:
>     - shard-bmg:          NOTRUN -> [SKIP][69] ([Intel XE#1435]) +1 other test skip
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158824v2/shard-bmg-10/igt@kms_setmode@basic-clone-single-crtc.html
> 
>   * igt@kms_sharpness_filter@invalid-filter-with-plane:
>     - shard-bmg:          NOTRUN -> [SKIP][70] ([Intel XE#6503]) +4 other tests skip
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158824v2/shard-bmg-7/igt@kms_sharpness_filter@invalid-filter-with-plane.html
> 
>   * igt@kms_tiled_display@basic-test-pattern:
>     - shard-bmg:          NOTRUN -> [SKIP][71] ([Intel XE#2426])
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158824v2/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern.html
> 
>   * igt@kms_vrr@cmrr:
>     - shard-bmg:          NOTRUN -> [SKIP][72] ([Intel XE#2168])
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158824v2/shard-bmg-10/igt@kms_vrr@cmrr.html
> 
>   * igt@kms_vrr@flip-basic-fastset:
>     - shard-bmg:          NOTRUN -> [SKIP][73] ([Intel XE#1499])
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158824v2/shard-bmg-3/igt@kms_vrr@flip-basic-fastset.html
> 
>   * igt@xe_compute_preempt@compute-preempt-many-vram:
>     - shard-lnl:          NOTRUN -> [SKIP][74] ([Intel XE#5191])
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158824v2/shard-lnl-3/igt@xe_compute_preempt@compute-preempt-many-vram.html
> 
>   * igt@xe_eudebug@connect-user:
>     - shard-bmg:          NOTRUN -> [SKIP][75] ([Intel XE#4837]) +8 other tests skip
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158824v2/shard-bmg-2/igt@xe_eudebug@connect-user.html
> 
>   * igt@xe_eudebug_online@pagefault-write-stress:
>     - shard-lnl:          NOTRUN -> [SKIP][76] ([Intel XE#6665])
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158824v2/shard-lnl-1/igt@xe_eudebug_online@pagefault-write-stress.html
> 
>   * igt@xe_eudebug_online@resume-dss:
>     - shard-lnl:          NOTRUN -> [SKIP][77] ([Intel XE#4837] / [Intel XE#6665]) +1 other test skip
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158824v2/shard-lnl-2/igt@xe_eudebug_online@resume-dss.html
> 
>   * igt@xe_eudebug_online@set-breakpoint-faultable:
>     - shard-bmg:          NOTRUN -> [SKIP][78] ([Intel XE#4837] / [Intel XE#6665]) +7 other tests skip
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158824v2/shard-bmg-2/igt@xe_eudebug_online@set-breakpoint-faultable.html
> 
>   * igt@xe_evict@evict-beng-mixed-many-threads-small:
>     - shard-bmg:          [PASS][79] -> [INCOMPLETE][80] ([Intel XE#6321])
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4327-211191d88d04debf5ad0e283336efb73e5e8a7ab/shard-bmg-9/igt@xe_evict@evict-beng-mixed-many-threads-small.html
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158824v2/shard-bmg-9/igt@xe_evict@evict-beng-mixed-many-threads-small.html
> 
>   * igt@xe_evict@evict-beng-small-external-cm:
>     - shard-lnl:          NOTRUN -> [SKIP][81] ([Intel XE#688])
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158824v2/shard-lnl-1/igt@xe_evict@evict-beng-small-external-cm.html
> 
>   * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind:
>     - shard-bmg:          NOTRUN -> [SKIP][82] ([Intel XE#2322]) +10 other tests skip
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158824v2/shard-bmg-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind.html
> 
>   * igt@xe_exec_basic@multigpu-once-null-defer-bind:
>     - shard-lnl:          NOTRUN -> [SKIP][83] ([Intel XE#1392])
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158824v2/shard-lnl-5/igt@xe_exec_basic@multigpu-once-null-defer-bind.html
> 
>   * igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-priority:
>     - shard-lnl:          NOTRUN -> [SKIP][84] ([Intel XE#6874]) +2 other tests skip
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158824v2/shard-lnl-1/igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-priority.html
> 
>   * igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-dyn-priority-smem:
>     - shard-bmg:          NOTRUN -> [SKIP][85] ([Intel XE#6874]) +34 other tests skip
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158824v2/shard-bmg-9/igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-dyn-priority-smem.html
> 
>   * igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma:
>     - shard-lnl:          [PASS][86] -> [FAIL][87] ([Intel XE#5625])
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4327-211191d88d04debf5ad0e283336efb73e5e8a7ab/shard-lnl-5/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158824v2/shard-lnl-1/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html
> 
>   * igt@xe_exec_system_allocator@process-many-mmap-free-huge:
>     - shard-bmg:          NOTRUN -> [SKIP][88] ([Intel XE#4943]) +17 other tests skip
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158824v2/shard-bmg-10/igt@xe_exec_system_allocator@process-many-mmap-free-huge.html
> 
>   * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-huge-nomemset:
>     - shard-lnl:          NOTRUN -> [SKIP][89] ([Intel XE#4943]) +3 other tests skip
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158824v2/shard-lnl-4/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-huge-nomemset.html
> 
>   * igt@xe_exec_system_allocator@twice-large-malloc-prefetch-madvise:
>     - shard-lnl:          NOTRUN -> [WARN][90] ([Intel XE#5786])
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158824v2/shard-lnl-1/igt@xe_exec_system_allocator@twice-large-malloc-prefetch-madvise.html
> 
>   * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
>     - shard-bmg:          NOTRUN -> [SKIP][91] ([Intel XE#2229])
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158824v2/shard-bmg-3/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html
> 
>   * igt@xe_live_ktest@xe_eudebug:
>     - shard-bmg:          NOTRUN -> [SKIP][92] ([Intel XE#2833])
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158824v2/shard-bmg-10/igt@xe_live_ktest@xe_eudebug.html
> 
>   * igt@xe_pat@pat-index-xelpg:
>     - shard-bmg:          NOTRUN -> [SKIP][93] ([Intel XE#2236])
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158824v2/shard-bmg-8/igt@xe_pat@pat-index-xelpg.html
> 
>   * igt@xe_peer2peer@write:
>     - shard-bmg:          NOTRUN -> [SKIP][94] ([Intel XE#2427] / [Intel XE#6953]) +1 other test skip
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158824v2/shard-bmg-9/igt@xe_peer2peer@write.html
> 
>   * igt@xe_pm@d3cold-mmap-system:
>     - shard-bmg:          NOTRUN -> [SKIP][95] ([Intel XE#2284])
>    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158824v2/shard-bmg-10/igt@xe_pm@d3cold-mmap-system.html
> 
>   * igt@xe_pmu@engine-activity-accuracy-50:
>     - shard-lnl:          [PASS][96] -> [FAIL][97] ([Intel XE#6251]) +1 other test fail
>    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4327-211191d88d04debf5ad0e283336efb73e5e8a7ab/shard-lnl-2/igt@xe_pmu@engine-activity-accuracy-50.html
>    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158824v2/shard-lnl-8/igt@xe_pmu@engine-activity-accuracy-50.html
> 
>   * igt@xe_pxp@display-pxp-fb:
>     - shard-bmg:          NOTRUN -> [SKIP][98] ([Intel XE#4733]) +4 other tests skip
>    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158824v2/shard-bmg-10/igt@xe_pxp@display-pxp-fb.html
> 
>   * igt@xe_query@multigpu-query-mem-usage:
>     - shard-bmg:          NOTRUN -> [SKIP][99] ([Intel XE#944]) +1 other test skip
>    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158824v2/shard-bmg-10/igt@xe_query@multigpu-query-mem-usage.html
> 
>   * igt@xe_sriov_flr@flr-vf1-clear:
>     - shard-bmg:          [PASS][100] -> [FAIL][101] ([Intel XE#6569])
>    [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4327-211191d88d04debf5ad0e283336efb73e5e8a7ab/shard-bmg-10/igt@xe_sriov_flr@flr-vf1-clear.html
>    [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158824v2/shard-bmg-3/igt@xe_sriov_flr@flr-vf1-clear.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events-linear:
>     - shard-lnl:          [FAIL][102] ([Intel XE#5993]) -> [PASS][103] +3 other tests pass
>    [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4327-211191d88d04debf5ad0e283336efb73e5e8a7ab/shard-lnl-7/igt@kms_async_flips@async-flip-with-page-flip-events-linear.html
>    [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158824v2/shard-lnl-4/igt@kms_async_flips@async-flip-with-page-flip-events-linear.html
> 
>   * igt@kms_hdr@bpc-switch-suspend:
>     - shard-bmg:          [ABORT][104] ([Intel XE#6740]) -> [PASS][105] +1 other test pass
>    [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4327-211191d88d04debf5ad0e283336efb73e5e8a7ab/shard-bmg-7/igt@kms_hdr@bpc-switch-suspend.html
>    [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158824v2/shard-bmg-10/igt@kms_hdr@bpc-switch-suspend.html
> 
>   * igt@kms_pm_dc@dc6-psr:
>     - shard-lnl:          [FAIL][106] ([Intel XE#718]) -> [PASS][107] +1 other test pass
>    [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4327-211191d88d04debf5ad0e283336efb73e5e8a7ab/shard-lnl-7/igt@kms_pm_dc@dc6-psr.html
>    [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158824v2/shard-lnl-4/igt@kms_pm_dc@dc6-psr.html
> 
>   * igt@kms_setmode@basic@pipe-b-edp-1:
>     - shard-lnl:          [FAIL][108] ([Intel XE#6361]) -> [PASS][109] +2 other tests pass
>    [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4327-211191d88d04debf5ad0e283336efb73e5e8a7ab/shard-lnl-4/igt@kms_setmode@basic@pipe-b-edp-1.html
>    [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158824v2/shard-lnl-2/igt@kms_setmode@basic@pipe-b-edp-1.html
> 
>   * igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:
>     - shard-lnl:          [FAIL][110] ([Intel XE#2142]) -> [PASS][111] +1 other test pass
>    [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4327-211191d88d04debf5ad0e283336efb73e5e8a7ab/shard-lnl-1/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html
>    [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158824v2/shard-lnl-1/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html
> 
>   * igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_video_enhance0:
>     - shard-lnl:          [FAIL][112] ([Intel XE#6251]) -> [PASS][113]
>    [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4327-211191d88d04debf5ad0e283336efb73e5e8a7ab/shard-lnl-7/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_video_enhance0.html
>    [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158824v2/shard-lnl-2/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_video_enhance0.html
> 
>   * igt@xe_sriov_vram@vf-access-after-resize-up:
>     - shard-bmg:          [FAIL][114] ([Intel XE#5937]) -> [PASS][115]
>    [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4327-211191d88d04debf5ad0e283336efb73e5e8a7ab/shard-bmg-3/igt@xe_sriov_vram@vf-access-after-resize-up.html
>    [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158824v2/shard-bmg-3/igt@xe_sriov_vram@vf-access-after-resize-up.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_hdr@brightness-with-hdr:
>     - shard-bmg:          [SKIP][116] ([Intel XE#3544]) -> [SKIP][117] ([Intel XE#3374] / [Intel XE#3544])
>    [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4327-211191d88d04debf5ad0e283336efb73e5e8a7ab/shard-bmg-9/igt@kms_hdr@brightness-with-hdr.html
>    [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158824v2/shard-bmg-1/igt@kms_hdr@brightness-with-hdr.html
> 
>   
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
>   [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
>   [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
>   [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
>   [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
>   [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
>   [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
>   [Intel XE#1428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1428
>   [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
>   [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
>   [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>   [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
>   [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
>   [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
>   [Intel XE#2142]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2142
>   [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
>   [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
>   [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
>   [Intel XE#2236]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236
>   [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
>   [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
>   [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
>   [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
>   [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
>   [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
>   [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
>   [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
>   [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
>   [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
>   [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
>   [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
>   [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
>   [Intel XE#2328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328
>   [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
>   [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
>   [Intel XE#2350]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2350
>   [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
>   [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
>   [Intel XE#2374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374
>   [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
>   [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
>   [Intel XE#2414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414
>   [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
>   [Intel XE#2427]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427
>   [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
>   [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
>   [Intel XE#2833]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2833
>   [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
>   [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
>   [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
>   [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
>   [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
>   [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
>   [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
>   [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
>   [Intel XE#3157]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3157
>   [Intel XE#3278]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278
>   [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
>   [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
>   [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
>   [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
>   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>   [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>   [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
>   [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
>   [Intel XE#4156]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156
>   [Intel XE#4210]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4210
>   [Intel XE#4298]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4298
>   [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
>   [Intel XE#4665]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4665
>   [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
>   [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
>   [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
>   [Intel XE#5020]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
>   [Intel XE#5191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5191
>   [Intel XE#5545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545
>   [Intel XE#5625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625
>   [Intel XE#5786]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5786
>   [Intel XE#5937]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5937
>   [Intel XE#5993]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5993
>   [Intel XE#6054]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6054
>   [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
>   [Intel XE#6251]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6251
>   [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
>   [Intel XE#6361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6361
>   [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
>   [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>   [Intel XE#6569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569
>   [Intel XE#6665]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665
>   [Intel XE#6740]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6740
>   [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
>   [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
>   [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
>   [Intel XE#6953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6953
>   [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
>   [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>   [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
>   [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
> 
> 
> Build changes
> -------------
> 
>   * IGT: IGT_8681 -> IGT_8682
>   * Linux: xe-4327-211191d88d04debf5ad0e283336efb73e5e8a7ab -> xe-pw-158824v2
> 
>   IGT_8681: c49f35440873244aa86e778007ed2dcbe5bf0ecb @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   IGT_8682: 8682
>   xe-4327-211191d88d04debf5ad0e283336efb73e5e8a7ab: 211191d88d04debf5ad0e283336efb73e5e8a7ab
>   xe-pw-158824v2: 158824v2
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158824v2/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
