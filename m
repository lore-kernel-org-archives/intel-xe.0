Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFD7ECEFC2A
	for <intel-xe@archiver.kernel.org>; Tue,  8 Oct 2024 16:28:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75CFA10E590;
	Tue,  8 Oct 2024 16:28:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FJgkXMID";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C71810E58F
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Oct 2024 16:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728404889; x=1759940889;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=CzIjxCzv8vJL3MvAGLaKIB/4+FOzsapoDal9FcUnsek=;
 b=FJgkXMIDKDXmWgc6Yfrq4hD0tcCdMs4tMJ8ZMpjz9DQS+90+RpeoVzMX
 uhnD3dTqFP68g13RXElitOchB4J0B2aWXNFjrNkgxM1tJfz/YNf/X4I8a
 hHeSu6G3Y3cxS+ZU75qHmR3S+UPoi4AF3aDIUagPL83p3be3PLqCpFkjO
 otC0cTwBWcnIOMlytvVSv7g7ACV+ie5t3vvO8d6a49BotJVTXPdMgJ44L
 SHvY9b5/acYP0lhJ7Z1iLjWodNapbftzrWzOlOmhq6ycgJ1TIsvBviOWM
 u5hrq6G59zhPuyNkRApHOVSsbly2UN7mPO0MhxKSiWBcy1urqR2jW5pgL w==;
X-CSE-ConnectionGUID: VnEfrIJZQH2ARWR1laPdWA==
X-CSE-MsgGUID: 0zhJEnx7QRqi1DDlVXHZkg==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="27433836"
X-IronPort-AV: E=Sophos;i="6.11,187,1725346800"; d="scan'208";a="27433836"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2024 09:28:09 -0700
X-CSE-ConnectionGUID: dDYMxfq/QlCBK1Bgzlh7bw==
X-CSE-MsgGUID: SqIUblItRWesOe4rCFTitw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,187,1725346800"; d="scan'208";a="76312223"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Oct 2024 09:28:09 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 8 Oct 2024 09:27:44 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 8 Oct 2024 09:26:49 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 8 Oct 2024 09:26:49 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.172)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 8 Oct 2024 09:26:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eC8Dm6Ie/M08M5/hq7mFttHAHRmA4vJdV2XG3+8QF9PiU7tqf0GfZkd8GWTyzYJTEiVsS78pWJtKVgd3DyaBru+IgHtyT5RtB+saxMrN0k9PzzztHNLjN7qtF1c/GC6BY4c9bG1V1eNVEidRMhdWRwWbPbkpfArYRD47pu2YMaM+fdFSIPLjw288DfS4NZcqREtUsgcqZqwgSC7Ko/ZCAjAK4r8GDgEJDWoU2FfkM3PqVnmzFOsSGB6RMHeh+mbVAy0wtFhFhvCdaNyvTM7CxvvGc5mgjr3XNpZCDLf+5qenrTtWmzuJecZ0BwHq8qv0/WsB7SdfJaIx7T8B5W5+lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G1i1KFskO8A5KixzSmlo3fU6C/GYyQ1ZVeSPQOl5KAA=;
 b=fFxzueYSFpOAYGxcc+9kLiPZb6R48ybSG48jYdz1unWBxlh2Tya0vA6nUTRhrqWwLHHbrp1Zjia7kSDwIvX5uE42LtHZiFQHivvu+qXtSKfqi2nUrSqArPTkrw3UDKMRjjH793bfFksNiouRs+YdPi4mKr85ccZlmzhUEDm8agKHZXQKauhLtA8njOZ2xiproBpPS55XmAMeXLhG3rTa2PiWhPz8xpzxfVBFD524WVK6cyNdzlsX4f+sloKvcTLYLnGxrdobI0FUhBC9t3Q5qqRlXPhE9Wi1g5t8ZdbumGW4MKRwcPA877hSDuvVlyWOQ5mFl/e3rGrQpeWTSMRHyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by BL1PR11MB5977.namprd11.prod.outlook.com (2603:10b6:208:384::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.23; Tue, 8 Oct
 2024 16:26:36 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.8026.020; Tue, 8 Oct 2024
 16:26:36 +0000
Date: Tue, 8 Oct 2024 09:26:32 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Matt Atwood <matthew.s.atwood@intel.com>
Subject: Re: =?utf-8?B?4pyXIENJLkZVTEw=?= =?utf-8?Q?=3A?= failure for Add Xe3
 and Panther Lake support (rev3)
Message-ID: <20241008162632.GI4891@mdroper-desk1.amr.corp.intel.com>
References: <20241008013509.61233-1-matthew.s.atwood@intel.com>
 <172838166388.1202952.77452989886652623@2413ebb6fbb6>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <172838166388.1202952.77452989886652623@2413ebb6fbb6>
X-ClientProxiedBy: SJ0PR03CA0370.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::15) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|BL1PR11MB5977:EE_
X-MS-Office365-Filtering-Correlation-Id: 88aa9769-e017-4932-72cc-08dce7b5faf6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?tUSR4awlSb/BNjyhxI8ehIHp36Rg0V9ClDZHE7L3N0JqfhzUgfqwnY7ePN/Z?=
 =?us-ascii?Q?39L3DZOyjgBfVVqlQwmXCOtCuDikmejdFE6aN47imBiznIj9KOkyA+mr8Scd?=
 =?us-ascii?Q?ep1myYp20R/iYGAm0gK0oirYpltdtqnoayKMNVGgsgL+rcS0sNG1QnY/q26f?=
 =?us-ascii?Q?eaJGKMk6cqgYbIp7U+yHQ3141y+J6JL444twSOkPJlbbNWIj9HuYIsqagj3w?=
 =?us-ascii?Q?eTPJ0yegeNFieF/5udLA+P6a+oL/KUotgwz7PNP8JvL51PlcA2iHTg4RtQcY?=
 =?us-ascii?Q?Yyk/cijOS1XOasFtr3OhmZ5bXqFTHRBrbFU8ox+OCQtVGCVwFS4+axyeGqK3?=
 =?us-ascii?Q?8FnWJYTEm9iF0PUXv7zjmR8gr76nmhay1Yj2HfGbrV8e67s3HaVa+80vi7Hr?=
 =?us-ascii?Q?y6/2XW5JJ43PNsGqQyG72lJrj8H2oVRWsg4ltr7L3ycdk5c52y9l+QwCbTku?=
 =?us-ascii?Q?at2w0Qm/WdE1VKuY5ej77G9D5pThw92RUAeBSEDBgY2WtIbebai5irvmJxXG?=
 =?us-ascii?Q?FyoHcWC5eWURRVKyrOFlHZccbI+a1QHBjWDLn1amqYoPNnlH5CWyWB1B0csW?=
 =?us-ascii?Q?/TEJ38D7nCvXUVUxdjmAxKQRMyetsFOUutCw4g7BbTCUUC/x1CJC0L361OeC?=
 =?us-ascii?Q?XFVJY8mkd13v35Cxe96Rczvok6e+tz06821CtomKZPRVtUjipg7PFawKShWQ?=
 =?us-ascii?Q?Y9ibsXZFJiGiVgLA0DAxfAuhljMl+X2DvmLrBDQKDr36G6R3r1L44rj0uxtQ?=
 =?us-ascii?Q?Yp5esgwq9iZ2CCU2MW/+1a0gZ7t3dYBA+CRk9Xo4Iwdyt6YR1EwLHNoPSCSU?=
 =?us-ascii?Q?ipIkbWK4Vn7z8tR7peJEnQrPE0AeAX0Uffs0vPzKRTASfAJHUBEO8azv7KDB?=
 =?us-ascii?Q?l4olId+qwuWw2fgHCkkfqt/3BUAzd4J9NeDv33G5UgICUh29ZXQmtioBos/W?=
 =?us-ascii?Q?ye4r6hW0jyH2FwKsrVw/875fXSOKBQhb4HxToAdRGP+arLYeGOG3n+uvaUGn?=
 =?us-ascii?Q?nTpnhdqq8tjGM+6WNNDZ/tDYqQG66PjIZNiuMXZSbVMtRvXUOyF6NwGdDLoL?=
 =?us-ascii?Q?u3V3lon2iDu233PhXu0eiBxkzje2y/AAIlCkpcS9PNPA9xLItXgwjAzeXyVD?=
 =?us-ascii?Q?uM5aZwRwugFh4bb6BkZ3vd+tBuJ5KZt7ohkd8zJSyoZmaBTzhFtzDdf+/Hdn?=
 =?us-ascii?Q?0nEO0RS0GiZEe2c+5CRnLiBQD5dCvrp4hu4BCFUVVUG8tSXTZejeXM0uVXQ?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cmoFgwK+utbRE1WwrUAjsyACvhEJASBV2SMm+CwKHpaDfVgN0VSYYPKdXd8R?=
 =?us-ascii?Q?/lqJBKfpPmhjNwxZe1W0EtJCmChOmyqMhF5ge9C4tLUfJygfvQ4knYwGMjmy?=
 =?us-ascii?Q?hgV0HcAlJ2DhhN1Ld8A1KG22yp3u6UPX7m9+Vm5WSrlHXVpF9k0REf/OkZND?=
 =?us-ascii?Q?8aetmlRCzzamaEg0ZpqHVjfc134jWqa4IljVd3xPsKYcOE0bo91FPGBR3zjo?=
 =?us-ascii?Q?xkejgjIvLJN+oEwZicvUOyF1NdXpTvJbmMcq6C5bdSaJWNG4qmmRMZHPkqbd?=
 =?us-ascii?Q?8Qw428dRhpIxdNXnIHqs0vZxtXkGYXE4fVPftkrspbrJYPCMbBXyCzMhz6Vb?=
 =?us-ascii?Q?AMJclWxU9EoFtAVfEtcpXeDK4CYnldspzWph7bKJEDkPIjKKwDxa/AL8ZwU2?=
 =?us-ascii?Q?X3VXc1lwjzPFd2X4pXMmd1fYruRGeDB58o+YrWlMOtaXHnxbfeaUesgMmWUG?=
 =?us-ascii?Q?hc/WxttvjvBBYrhC87HAX0x3u/AFfO0xvnCD++rJa4WQqLJ6BBIZIuSdPDrc?=
 =?us-ascii?Q?1+CE+YLxuKYvJUgWW+z7SIGu9fIh1SI7Nuh0x/RxFCynj6jui9Ps/jDiRNL1?=
 =?us-ascii?Q?LDC+zMm6zIMppHSMA1EUEz9eFjLgNdZ6vO6Oj+agWBRsFfQfmRb/UBk0t2VV?=
 =?us-ascii?Q?ir7kjlU0nQnX17eGazP49xFW64FGtwV7n8L46p7R7AWnjLE7RKpBgJjaoSiy?=
 =?us-ascii?Q?EWlTLmO7J+9q0/h68W+o9s+UBhJLufyf8jKXNasP1W+99Aeb+9xqtKPP0Ilw?=
 =?us-ascii?Q?3Q35PZHq0uSI/ZlydvrZAR7iryXjhavXvLYfUpwmVr1kh15KF8vYRw7ZXIPU?=
 =?us-ascii?Q?4TJWeoP2x5kJW5vjdG7DyadpHgPMVOzlvYIp5sPvZXeuLToY/a3lauQkzlwq?=
 =?us-ascii?Q?tQ9YiLh+2R7mMZ2+MH5OnpAHhCeA5/3UHVMY6rkEh5v2LKkwXqVqt/fgRng2?=
 =?us-ascii?Q?m0C9vl6RkE41jdc7AMmNIXrufgkAxZ8klLU8JWDzsi6zThHiWP8ToS4jhOtj?=
 =?us-ascii?Q?0QUyffscVYkOCNrGjiX/D8Jpryk0v+nSaxMnpYftDx7j1apnhaq2ReknSMXU?=
 =?us-ascii?Q?OKPEbL9zogJzS8/YAQZUUurq4jus6qRruSpQpN9vtdkpi97a9pTaDl0JCsh8?=
 =?us-ascii?Q?UQK0HOuMGfWtH5E3G5Odlp14UVnUSuPwsSU3LW3c9ruwmZKThMskPnfI8ZIX?=
 =?us-ascii?Q?yRIKPgX+KVfQnBo39PEpPdWxd4tq2hF07rByQO6znQXzdfRDYIOF23n3ERjO?=
 =?us-ascii?Q?oOBtese/Fwlgr+z0J1vBug59wbHZR5RAJHZR8X8xvID3NLyyw41e6vWfsllf?=
 =?us-ascii?Q?QsVPhFaRvk353suJQ9+Nr5a4kne8y0Cxwa4UFFD4xm1BabsJ6NMkzfMYPATR?=
 =?us-ascii?Q?TuWo+2Ex5EKD7VwR8O8B1VT7+gInJyqBBxf6mlaUNtlzZz44T8cEhopHP036?=
 =?us-ascii?Q?vruq2N1ZVuRDEEx9A9kOoCs58UHibjupZl9b+qLIRXJFpgbhqX0BATyL2N/+?=
 =?us-ascii?Q?DxdDJj5HbSX0RZr2UeXge9iCaP63iG8f4jOcNKElI75TLVYvSnBUyH/7Jl63?=
 =?us-ascii?Q?31EJXXGLUaTETOlZOBh6ANNgb9zbMd5rqhrXEpXvPBzOwfhjgL+HCpQuLqpr?=
 =?us-ascii?Q?OQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 88aa9769-e017-4932-72cc-08dce7b5faf6
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2024 16:26:36.7587 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L3YjPiQPIKxqQgb10OQfGoxqiAFl7VbsEdX6TBlCK1xVuFxfXwIOUJmLwNUak4gIZS7DZF+r8J8WfwZBRhe6BupqYEFXHkwBGDFFwm37gxI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5977
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

On Tue, Oct 08, 2024 at 10:01:03AM -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: Add Xe3 and Panther Lake support (rev3)
> URL   : https://patchwork.freedesktop.org/series/138349/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-2020-e11d55841ddeeb378c8850fca72eb6a270aafd79_full -> xe-pw-138349v3_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-138349v3_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-138349v3_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (4 -> 4)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in xe-pw-138349v3_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75:
>     - shard-adlp:         [PASS][1] -> [DMESG-WARN][2] +1 other test dmesg-warn
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2020-e11d55841ddeeb378c8850fca72eb6a270aafd79/shard-adlp-3/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v3/shard-adlp-4/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html

This series is GT-only and does not touch display, so the ADL display
timeouts here are preexisting issues.

> 
>   * igt@xe_ccs@suspend-resume@tile4-compressed-compfmt0-system-system:
>     - shard-lnl:          [PASS][3] -> [DMESG-WARN][4] +2 other tests dmesg-warn
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2020-e11d55841ddeeb378c8850fca72eb6a270aafd79/shard-lnl-2/igt@xe_ccs@suspend-resume@tile4-compressed-compfmt0-system-system.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v3/shard-lnl-1/igt@xe_ccs@suspend-resume@tile4-compressed-compfmt0-system-system.html

This is a warning from the intel_idle driver, unrelated to Xe.  Not
caused by this patch series.


Patches 1-2 and 4-6 are applied to drm-xe-next with some minor commit
message typos corrected.  Thanks for the patches and reviews.  Patch #3
still needs work, but it can be fixed and applied later since it's
independent of the rest of the work here.


Matt

> 
>   
> #### Suppressed ####
> 
>   The following results come from untrusted machines, tests, or statuses.
>   They do not affect the overall result.
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a3:
>     - {shard-bmg}:        [PASS][5] -> [FAIL][6]
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2020-e11d55841ddeeb378c8850fca72eb6a270aafd79/shard-bmg-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a3.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v3/shard-bmg-7/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a3.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-138349v3_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
>     - shard-lnl:          NOTRUN -> [SKIP][7] ([Intel XE#1466])
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v3/shard-lnl-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
> 
>   * igt@kms_atomic_transition@modeset-transition-nonblocking-fencing@1x-outputs:
>     - shard-lnl:          [PASS][8] -> [FAIL][9] ([Intel XE#1701]) +1 other test fail
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2020-e11d55841ddeeb378c8850fca72eb6a270aafd79/shard-lnl-4/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing@1x-outputs.html
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v3/shard-lnl-5/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing@1x-outputs.html
> 
>   * igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     [PASS][10] -> [FAIL][11] ([Intel XE#1426]) +1 other test fail
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2020-e11d55841ddeeb378c8850fca72eb6a270aafd79/shard-dg2-434/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-6.html
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v3/shard-dg2-434/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_big_fb@linear-8bpp-rotate-270:
>     - shard-lnl:          NOTRUN -> [SKIP][12] ([Intel XE#1407]) +1 other test skip
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v3/shard-lnl-2/igt@kms_big_fb@linear-8bpp-rotate-270.html
> 
>   * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
>     - shard-lnl:          NOTRUN -> [SKIP][13] ([Intel XE#1124]) +6 other tests skip
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v3/shard-lnl-2/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html
> 
>   * igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:
>     - shard-lnl:          NOTRUN -> [SKIP][14] ([Intel XE#1512])
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v3/shard-lnl-2/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html
> 
>   * igt@kms_bw@linear-tiling-3-displays-2160x1440p:
>     - shard-lnl:          NOTRUN -> [SKIP][15] ([Intel XE#367])
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v3/shard-lnl-4/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs:
>     - shard-lnl:          NOTRUN -> [SKIP][16] ([Intel XE#2887]) +9 other tests skip
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v3/shard-lnl-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs.html
> 
>   * igt@kms_chamelium_color@ctm-max:
>     - shard-lnl:          NOTRUN -> [SKIP][17] ([Intel XE#306]) +1 other test skip
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v3/shard-lnl-2/igt@kms_chamelium_color@ctm-max.html
> 
>   * igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:
>     - shard-lnl:          NOTRUN -> [SKIP][18] ([Intel XE#373]) +4 other tests skip
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v3/shard-lnl-4/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html
> 
>   * igt@kms_content_protection@content-type-change:
>     - shard-lnl:          NOTRUN -> [SKIP][19] ([Intel XE#599]) +1 other test skip
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v3/shard-lnl-2/igt@kms_content_protection@content-type-change.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-512x512:
>     - shard-lnl:          NOTRUN -> [SKIP][20] ([Intel XE#2321])
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v3/shard-lnl-4/igt@kms_cursor_crc@cursor-offscreen-512x512.html
> 
>   * igt@kms_cursor_crc@cursor-rapid-movement-128x42:
>     - shard-lnl:          NOTRUN -> [SKIP][21] ([Intel XE#1424]) +1 other test skip
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v3/shard-lnl-3/igt@kms_cursor_crc@cursor-rapid-movement-128x42.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
>     - shard-lnl:          NOTRUN -> [SKIP][22] ([Intel XE#309]) +3 other tests skip
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v3/shard-lnl-4/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor-varying-size:
>     - shard-lnl:          [PASS][23] -> [FAIL][24] ([Intel XE#1475])
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2020-e11d55841ddeeb378c8850fca72eb6a270aafd79/shard-lnl-5/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v3/shard-lnl-2/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html
> 
>   * igt@kms_feature_discovery@display-2x:
>     - shard-lnl:          NOTRUN -> [SKIP][25] ([Intel XE#702])
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v3/shard-lnl-3/igt@kms_feature_discovery@display-2x.html
> 
>   * igt@kms_flip@2x-flip-vs-suspend:
>     - shard-lnl:          NOTRUN -> [SKIP][26] ([Intel XE#1421]) +5 other tests skip
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v3/shard-lnl-3/igt@kms_flip@2x-flip-vs-suspend.html
> 
>   * igt@kms_flip@blocking-wf_vblank:
>     - shard-lnl:          [PASS][27] -> [FAIL][28] ([Intel XE#886]) +7 other tests fail
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2020-e11d55841ddeeb378c8850fca72eb6a270aafd79/shard-lnl-6/igt@kms_flip@blocking-wf_vblank.html
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v3/shard-lnl-7/igt@kms_flip@blocking-wf_vblank.html
> 
>   * igt@kms_flip@flip-vs-absolute-wf_vblank:
>     - shard-lnl:          NOTRUN -> [FAIL][29] ([Intel XE#886]) +1 other test fail
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v3/shard-lnl-2/igt@kms_flip@flip-vs-absolute-wf_vblank.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:
>     - shard-lnl:          NOTRUN -> [SKIP][30] ([Intel XE#1401] / [Intel XE#1745]) +1 other test skip
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v3/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-default-mode:
>     - shard-lnl:          NOTRUN -> [SKIP][31] ([Intel XE#1401]) +1 other test skip
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v3/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-default-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling:
>     - shard-lnl:          NOTRUN -> [SKIP][32] ([Intel XE#1397] / [Intel XE#1745])
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v3/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-default-mode:
>     - shard-lnl:          NOTRUN -> [SKIP][33] ([Intel XE#1397])
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v3/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-default-mode.html
> 
>   * igt@kms_flip_tiling@flip-change-tiling:
>     - shard-adlp:         [PASS][34] -> [FAIL][35] ([Intel XE#1874]) +2 other tests fail
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2020-e11d55841ddeeb378c8850fca72eb6a270aafd79/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling.html
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v3/shard-adlp-3/igt@kms_flip_tiling@flip-change-tiling.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-blt:
>     - shard-lnl:          NOTRUN -> [SKIP][36] ([Intel XE#651]) +4 other tests skip
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v3/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
>     - shard-lnl:          NOTRUN -> [SKIP][37] ([Intel XE#1469])
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v3/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-render:
>     - shard-lnl:          NOTRUN -> [SKIP][38] ([Intel XE#656]) +23 other tests skip
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v3/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-render.html
> 
>   * igt@kms_hdr@static-toggle:
>     - shard-lnl:          NOTRUN -> [SKIP][39] ([Intel XE#1503] / [Intel XE#599])
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v3/shard-lnl-3/igt@kms_hdr@static-toggle.html
> 
>   * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
>     - shard-lnl:          NOTRUN -> [SKIP][40] ([Intel XE#356])
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v3/shard-lnl-3/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
> 
>   * igt@kms_pipe_crc_basic@disable-crc-after-crtc@pipe-b-edp-1:
>     - shard-lnl:          [PASS][41] -> [DMESG-WARN][42] ([Intel XE#2055]) +1 other test dmesg-warn
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2020-e11d55841ddeeb378c8850fca72eb6a270aafd79/shard-lnl-3/igt@kms_pipe_crc_basic@disable-crc-after-crtc@pipe-b-edp-1.html
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v3/shard-lnl-5/igt@kms_pipe_crc_basic@disable-crc-after-crtc@pipe-b-edp-1.html
> 
>   * igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3:
>     - shard-lnl:          [PASS][43] -> [DMESG-WARN][44] ([Intel XE#324]) +6 other tests dmesg-warn
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2020-e11d55841ddeeb378c8850fca72eb6a270aafd79/shard-lnl-7/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3.html
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v3/shard-lnl-6/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3.html
> 
>   * igt@kms_plane@plane-position-hole@pipe-a-plane-4:
>     - shard-lnl:          [PASS][45] -> [DMESG-FAIL][46] ([Intel XE#324]) +1 other test dmesg-fail
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2020-e11d55841ddeeb378c8850fca72eb6a270aafd79/shard-lnl-7/igt@kms_plane@plane-position-hole@pipe-a-plane-4.html
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v3/shard-lnl-3/igt@kms_plane@plane-position-hole@pipe-a-plane-4.html
> 
>   * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25:
>     - shard-lnl:          NOTRUN -> [SKIP][47] ([Intel XE#2763]) +7 other tests skip
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v3/shard-lnl-3/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html
> 
>   * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf:
>     - shard-lnl:          NOTRUN -> [SKIP][48] ([Intel XE#2893]) +1 other test skip
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v3/shard-lnl-2/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf.html
> 
>   * igt@kms_psr2_su@frontbuffer-xrgb8888:
>     - shard-lnl:          NOTRUN -> [SKIP][49] ([Intel XE#1128]) +1 other test skip
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v3/shard-lnl-2/igt@kms_psr2_su@frontbuffer-xrgb8888.html
> 
>   * igt@kms_psr@fbc-psr-primary-page-flip@edp-1:
>     - shard-lnl:          [PASS][50] -> [FAIL][51] ([Intel XE#2948]) +3 other tests fail
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2020-e11d55841ddeeb378c8850fca72eb6a270aafd79/shard-lnl-5/igt@kms_psr@fbc-psr-primary-page-flip@edp-1.html
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v3/shard-lnl-2/igt@kms_psr@fbc-psr-primary-page-flip@edp-1.html
> 
>   * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
>     - shard-lnl:          NOTRUN -> [SKIP][52] ([Intel XE#1127])
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v3/shard-lnl-3/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
>     - shard-lnl:          NOTRUN -> [SKIP][53] ([Intel XE#1437])
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v3/shard-lnl-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
> 
>   * igt@kms_vblank@accuracy-idle:
>     - shard-lnl:          [PASS][54] -> [FAIL][55] ([Intel XE#1523]) +1 other test fail
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2020-e11d55841ddeeb378c8850fca72eb6a270aafd79/shard-lnl-3/igt@kms_vblank@accuracy-idle.html
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v3/shard-lnl-8/igt@kms_vblank@accuracy-idle.html
> 
>   * igt@kms_writeback@writeback-check-output-xrgb2101010:
>     - shard-lnl:          NOTRUN -> [SKIP][56] ([Intel XE#756])
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v3/shard-lnl-4/igt@kms_writeback@writeback-check-output-xrgb2101010.html
> 
>   * igt@xe_eudebug_online@resume-one:
>     - shard-lnl:          NOTRUN -> [SKIP][57] ([Intel XE#2905]) +2 other tests skip
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v3/shard-lnl-3/igt@xe_eudebug_online@resume-one.html
> 
>   * igt@xe_evict@evict-large-multi-vm:
>     - shard-lnl:          NOTRUN -> [SKIP][58] ([Intel XE#688]) +9 other tests skip
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v3/shard-lnl-3/igt@xe_evict@evict-large-multi-vm.html
> 
>   * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind:
>     - shard-lnl:          NOTRUN -> [SKIP][59] ([Intel XE#1392]) +4 other tests skip
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v3/shard-lnl-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind.html
> 
>   * igt@xe_pat@pat-index-xehpc:
>     - shard-lnl:          NOTRUN -> [SKIP][60] ([Intel XE#1420] / [Intel XE#2838])
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v3/shard-lnl-3/igt@xe_pat@pat-index-xehpc.html
> 
>   * igt@xe_query@multigpu-query-config:
>     - shard-lnl:          NOTRUN -> [SKIP][61] ([Intel XE#944]) +1 other test skip
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v3/shard-lnl-3/igt@xe_query@multigpu-query-config.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@kms_async_flips@alternate-sync-async-flip:
>     - shard-adlp:         [DMESG-FAIL][62] ([Intel XE#1033] / [Intel XE#1727] / [Intel XE#324]) -> [PASS][63] +1 other test pass
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2020-e11d55841ddeeb378c8850fca72eb6a270aafd79/shard-adlp-9/igt@kms_async_flips@alternate-sync-async-flip.html
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v3/shard-adlp-9/igt@kms_async_flips@alternate-sync-async-flip.html
>     - {shard-bmg}:        [FAIL][64] ([Intel XE#827]) -> [PASS][65] +1 other test pass
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2020-e11d55841ddeeb378c8850fca72eb6a270aafd79/shard-bmg-5/igt@kms_async_flips@alternate-sync-async-flip.html
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v3/shard-bmg-7/igt@kms_async_flips@alternate-sync-async-flip.html
> 
>   * igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1:
>     - shard-adlp:         [DMESG-FAIL][66] ([Intel XE#1033] / [Intel XE#1727]) -> [PASS][67]
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2020-e11d55841ddeeb378c8850fca72eb6a270aafd79/shard-adlp-9/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1.html
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v3/shard-adlp-9/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1.html
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
>     - shard-lnl:          [FAIL][68] ([Intel XE#1475]) -> [PASS][69]
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2020-e11d55841ddeeb378c8850fca72eb6a270aafd79/shard-lnl-6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v3/shard-lnl-1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
> 
>   * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3:
>     - {shard-bmg}:        [FAIL][70] ([Intel XE#301]) -> [PASS][71] +1 other test pass
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2020-e11d55841ddeeb378c8850fca72eb6a270aafd79/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.html
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v3/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.html
> 
>   * igt@kms_flip@basic-flip-vs-wf_vblank:
>     - shard-lnl:          [FAIL][72] ([Intel XE#886]) -> [PASS][73] +5 other tests pass
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2020-e11d55841ddeeb378c8850fca72eb6a270aafd79/shard-lnl-6/igt@kms_flip@basic-flip-vs-wf_vblank.html
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v3/shard-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp2:
>     - {shard-bmg}:        [FAIL][74] -> [PASS][75] +1 other test pass
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2020-e11d55841ddeeb378c8850fca72eb6a270aafd79/shard-bmg-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp2.html
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v3/shard-bmg-7/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp2.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6:
>     - shard-dg2-set2:     [FAIL][76] ([Intel XE#301]) -> [PASS][77] +5 other tests pass
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2020-e11d55841ddeeb378c8850fca72eb6a270aafd79/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v3/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a6:
>     - shard-dg2-set2:     [FAIL][78] -> [PASS][79]
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2020-e11d55841ddeeb378c8850fca72eb6a270aafd79/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a6.html
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v3/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a6.html
> 
>   * igt@kms_plane@plane-position-covered@pipe-a-plane-1:
>     - shard-lnl:          [DMESG-FAIL][80] ([Intel XE#324]) -> [PASS][81] +1 other test pass
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2020-e11d55841ddeeb378c8850fca72eb6a270aafd79/shard-lnl-6/igt@kms_plane@plane-position-covered@pipe-a-plane-1.html
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v3/shard-lnl-7/igt@kms_plane@plane-position-covered@pipe-a-plane-1.html
> 
>   * igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-6-size-64:
>     - shard-dg2-set2:     [FAIL][82] ([Intel XE#616]) -> [PASS][83] +1 other test pass
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2020-e11d55841ddeeb378c8850fca72eb6a270aafd79/shard-dg2-466/igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-6-size-64.html
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v3/shard-dg2-432/igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-6-size-64.html
> 
>   * igt@kms_pm_rpm@universal-planes:
>     - shard-lnl:          [DMESG-WARN][84] ([Intel XE#1620] / [Intel XE#2042]) -> [PASS][85]
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2020-e11d55841ddeeb378c8850fca72eb6a270aafd79/shard-lnl-1/igt@kms_pm_rpm@universal-planes.html
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v3/shard-lnl-4/igt@kms_pm_rpm@universal-planes.html
> 
>   * igt@kms_pm_rpm@universal-planes@plane-77:
>     - shard-lnl:          [DMESG-WARN][86] ([Intel XE#1620]) -> [PASS][87]
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2020-e11d55841ddeeb378c8850fca72eb6a270aafd79/shard-lnl-1/igt@kms_pm_rpm@universal-planes@plane-77.html
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v3/shard-lnl-4/igt@kms_pm_rpm@universal-planes@plane-77.html
> 
>   * igt@kms_psr@psr-sprite-plane-move:
>     - shard-lnl:          [FAIL][88] -> [PASS][89] +3 other tests pass
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2020-e11d55841ddeeb378c8850fca72eb6a270aafd79/shard-lnl-4/igt@kms_psr@psr-sprite-plane-move.html
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v3/shard-lnl-6/igt@kms_psr@psr-sprite-plane-move.html
> 
>   * igt@kms_vrr@cmrr@pipe-a-edp-1:
>     - shard-lnl:          [FAIL][90] ([Intel XE#2159]) -> [PASS][91] +1 other test pass
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2020-e11d55841ddeeb378c8850fca72eb6a270aafd79/shard-lnl-3/igt@kms_vrr@cmrr@pipe-a-edp-1.html
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v3/shard-lnl-8/igt@kms_vrr@cmrr@pipe-a-edp-1.html
> 
>   * igt@xe_evict@evict-beng-mixed-many-threads-small:
>     - {shard-bmg}:        [TIMEOUT][92] ([Intel XE#1473]) -> [PASS][93]
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2020-e11d55841ddeeb378c8850fca72eb6a270aafd79/shard-bmg-8/igt@xe_evict@evict-beng-mixed-many-threads-small.html
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v3/shard-bmg-2/igt@xe_evict@evict-beng-mixed-many-threads-small.html
> 
>   * igt@xe_pm@s2idle-vm-bind-prefetch:
>     - shard-lnl:          [INCOMPLETE][94] ([Intel XE#1616] / [Intel XE#2699]) -> [PASS][95]
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2020-e11d55841ddeeb378c8850fca72eb6a270aafd79/shard-lnl-2/igt@xe_pm@s2idle-vm-bind-prefetch.html
>    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v3/shard-lnl-3/igt@xe_pm@s2idle-vm-bind-prefetch.html
> 
>   * igt@xe_pm@s4-vm-bind-userptr:
>     - shard-lnl:          [ABORT][96] ([Intel XE#1794]) -> [PASS][97]
>    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2020-e11d55841ddeeb378c8850fca72eb6a270aafd79/shard-lnl-2/igt@xe_pm@s4-vm-bind-userptr.html
>    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v3/shard-lnl-1/igt@xe_pm@s4-vm-bind-userptr.html
> 
>   * igt@xe_vm@large-userptr-misaligned-binds-134217728:
>     - shard-lnl:          [INCOMPLETE][98] -> [PASS][99]
>    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2020-e11d55841ddeeb378c8850fca72eb6a270aafd79/shard-lnl-1/igt@xe_vm@large-userptr-misaligned-binds-134217728.html
>    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v3/shard-lnl-4/igt@xe_vm@large-userptr-misaligned-binds-134217728.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
>     - shard-adlp:         [DMESG-FAIL][100] ([Intel XE#324]) -> [FAIL][101] ([Intel XE#1231]) +2 other tests fail
>    [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2020-e11d55841ddeeb378c8850fca72eb6a270aafd79/shard-adlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
>    [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v3/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
> 
>   * igt@kms_plane@plane-position-covered:
>     - shard-lnl:          [DMESG-FAIL][102] ([Intel XE#324]) -> [DMESG-WARN][103] ([Intel XE#324])
>    [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2020-e11d55841ddeeb378c8850fca72eb6a270aafd79/shard-lnl-6/igt@kms_plane@plane-position-covered.html
>    [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v3/shard-lnl-7/igt@kms_plane@plane-position-covered.html
> 
>   * igt@kms_tiled_display@basic-test-pattern:
>     - shard-dg2-set2:     [SKIP][104] ([Intel XE#362]) -> [FAIL][105] ([Intel XE#1729])
>    [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2020-e11d55841ddeeb378c8850fca72eb6a270aafd79/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html
>    [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v3/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
>   [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
>   [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
>   [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
>   [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
>   [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
>   [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
>   [Intel XE#1420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420
>   [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
>   [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
>   [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
>   [Intel XE#1437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437
>   [Intel XE#1466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1466
>   [Intel XE#1469]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469
>   [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
>   [Intel XE#1475]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475
>   [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
>   [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
>   [Intel XE#1523]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1523
>   [Intel XE#1616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1616
>   [Intel XE#1620]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620
>   [Intel XE#1701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701
>   [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
>   [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
>   [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
>   [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
>   [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
>   [Intel XE#2042]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2042
>   [Intel XE#2055]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2055
>   [Intel XE#2159]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2159
>   [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
>   [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
>   [Intel XE#2472]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472
>   [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
>   [Intel XE#2699]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2699
>   [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
>   [Intel XE#2838]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838
>   [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
>   [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
>   [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
>   [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
>   [Intel XE#2948]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2948
>   [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
>   [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
>   [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
>   [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
>   [Intel XE#356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/356
>   [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
>   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>   [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>   [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
>   [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
>   [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>   [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>   [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
>   [Intel XE#702]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/702
>   [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
>   [Intel XE#827]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/827
>   [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-2020-e11d55841ddeeb378c8850fca72eb6a270aafd79 -> xe-pw-138349v3
> 
>   IGT_8054: 3f627b7fd48c6ab324ceaa80dd8cf0131292bf63 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-2020-e11d55841ddeeb378c8850fca72eb6a270aafd79: e11d55841ddeeb378c8850fca72eb6a270aafd79
>   xe-pw-138349v3: 138349v3
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138349v3/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
