Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B5BCC25B75
	for <intel-xe@archiver.kernel.org>; Fri, 31 May 2024 16:16:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C59710E033;
	Fri, 31 May 2024 16:16:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nb75Y2Vm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52ABB10E033
 for <intel-xe@lists.freedesktop.org>; Fri, 31 May 2024 16:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717172164; x=1748708164;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=pNWeUg5FYoxxJZCK8M5eGR7ZvObLnn2uz/kqXMlojj0=;
 b=nb75Y2Vm29F0qiN5bBweI/h5FchtFialTKr1G9BkRxEx5F0ty4mNYpOx
 GrlqBBi83AfakxmVXXtnVsYY1t2cW+vI+4xW8PKBB0qQ7/hBbsmulQp3b
 9A85tj3U6wAGv/blbxlH0WR/3tpmgU/qT60hqsVVYjCpbRczw11h4rez5
 Mi2gPpu2awIhdPiTbfVBUWsKz0OwNWa/1N74W+wKPRrq1sBkuSdPrKGU5
 ukCakrTxURgIASLn6xuHk3TjYrdy2k5ZvP8mfHEtHpemT/KP1ge5jO5YX
 Mw/SxcbX2boi8Uu+q7/bkNjgVLabnWZm+cpS+mhrr4YXY+8awB/xAUyHk A==;
X-CSE-ConnectionGUID: Prlps7dBTgaaHpPWfQERVQ==
X-CSE-MsgGUID: EzlzVA//SD+3AeapYgTnJw==
X-IronPort-AV: E=McAfee;i="6600,9927,11089"; a="13672717"
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; d="scan'208";a="13672717"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2024 09:16:04 -0700
X-CSE-ConnectionGUID: twx/Fsn2T4iHBpCXrFAihQ==
X-CSE-MsgGUID: copynBn7T8GNumJp1d5IwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; d="scan'208";a="40654182"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 May 2024 09:16:04 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 31 May 2024 09:16:03 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 31 May 2024 09:16:02 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 31 May 2024 09:16:02 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 31 May 2024 09:16:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fMY4oYxnTh6Yyq1XrnzVCUdZmHdqYXeedDwSrZWQYs2CrfnIqlIGJC0+sMPL3cmRWPwh4EjxAwejcHPlhLfcbnedrn04g8gD29PQRWS3nTDR4qwzk++Us50Q/DW5FpIMKQjpgzZX0FfgAtBV8nJ6byCp7ZDYp29JroEZL5k03Xuql82NEbwRnU0yfeCQeeyTBeghzNYbd2fF6RNZthF1lxLjkz1IxIPJ3QpjuDt9pHl/Zv4nZa+lTXL3lG1GLKPsGDrxF4CMKrFiVbDqRQSEwyPGPsPIL3Hpx7VBFnKZ+wGFOXWfjtM/2sFihyZX29726waspadjsoygSyiH/CyxmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M2MKKWcSDuI1ZkNCa+CxaE3wWhDMW/4lo0FxjVUzt4Q=;
 b=TSnvdDoWjKrqMgX7pwu4i4QtNxV0fnHe0OjSnW9A06IQidCl4Za1wrhq5cQggWc+y5EPv77FYEzWDg2+KAPnNRS3tQ2BWCqSUgQJfRSuo9WdjFDgnMZCGQD4NJPMkBNDxxQOCTRMlJk+FiKOfuOxFjW5AQAjb3GxbjTD0bvp86DH5dQKgtLX3B0w+7OsqEZlGyNV90+N8d7ENAHchXPqk+sOBNavpV9ubBUxN04k4hvGVNRgjXm7JzBCSiPDxZsm9BCDE5r59QFZ3sAMuAWXZHDhFtH362KAXip2YVkUFawGXJqMIiqHyA+h/0f6hxfkWOdpLgXyQL06CgeV9aFOCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7SPRMB0092.namprd11.prod.outlook.com (2603:10b6:510:2b1::6)
 by MN2PR11MB4711.namprd11.prod.outlook.com (2603:10b6:208:24e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.22; Fri, 31 May
 2024 16:16:00 +0000
Received: from PH7SPRMB0092.namprd11.prod.outlook.com
 ([fe80::2ad4:4a5:b333:6ff7]) by PH7SPRMB0092.namprd11.prod.outlook.com
 ([fe80::2ad4:4a5:b333:6ff7%2]) with mapi id 15.20.7633.018; Fri, 31 May 2024
 16:16:00 +0000
Date: Fri, 31 May 2024 16:15:31 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Paulo Zanoni <paulo.r.zanoni@intel.com>, 
 Francois Dugast <francois.dugast@intel.com>, Thomas
 =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH] drm/xe: Fix missing runtime outer protection for
 ggtt_remove_node
Message-ID: <Zln3o08O5Oz+SwQ3@DUT025-TGLU.fm.intel.com>
References: <20240531160205.206604-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240531160205.206604-1-rodrigo.vivi@intel.com>
X-ClientProxiedBy: BY5PR17CA0006.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::19) To PH7SPRMB0092.namprd11.prod.outlook.com
 (2603:10b6:510:2b1::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7SPRMB0092:EE_|MN2PR11MB4711:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e4efbd1-066d-4dd2-dd77-08dc818cf5da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?hXQd+KpoXwov8AceFd6anEEBVdvETuUAmqQ54TmOrNVmcWMj5jmCNy4E1x?=
 =?iso-8859-1?Q?ljx+lkO1UZb8Z9E3PkpBq9/FyZ7uqk6NIJz3+cdw6t6EemJunG6/KlT3+k?=
 =?iso-8859-1?Q?LnSJNqXY7B7xqhHUfEhzTsht6vqVa5qOkLEg2R++nUKT2AJfi3kdsLV4Eb?=
 =?iso-8859-1?Q?4abtp+yV0g4R7xsTqom6vgbZkOhSvKajLRm3rnx2+V7cLkK3KGNt1ec5aJ?=
 =?iso-8859-1?Q?a3wqbg0VLg3KeEQx+Gv8QROAFk+oadY3QRMlaVJrXNNLJeGZUgSv1httzE?=
 =?iso-8859-1?Q?W4Wdngquq3X8QUiFgz0t0LZNFjWZ3yIWL51ljyhUz5G+4ySUURg09XPz83?=
 =?iso-8859-1?Q?x/WC47VaRJqK9sRCdppaFGzjDo2fglDQwNnjdhS6cnl9TDoZ6TNBFzFQ7g?=
 =?iso-8859-1?Q?QdeNd20PDq08Wnu6tfL/3CwMd6fZcz4XxWgo2rO73nGEEk8aXfAw+Wu695?=
 =?iso-8859-1?Q?rA1AJXiq/NT6uPC7dnU/WD4qEygHOWsZTZR2F1ZLKbhIyo/u7aOxG4oRmT?=
 =?iso-8859-1?Q?dbuglxOTHJnF7Te1f7v8XpstQJRh2SVtcx020EyGU2bJy7ajKG4O+COm7W?=
 =?iso-8859-1?Q?gkP5Lic3T357ca/A2gWvmK373lY5Bv05Zld4wHW/V4b+tgjbVBp+edlAql?=
 =?iso-8859-1?Q?HGWw5BP0xwSRY7dvI01H+ePac2jIuQwSYi4reUTqrJrPQ5Qutj+VUUbyEf?=
 =?iso-8859-1?Q?pZPHHByt8bTDI5kRSa3+9U5g5FRAhXNXH/MqZ5SlIaCpcrvZMlL/fruUeK?=
 =?iso-8859-1?Q?S9HRrasMJK5HhLDKG4w/v9tLM2WWfpcyqQ4DHGCAaT2aFTZsR6T7chAip/?=
 =?iso-8859-1?Q?tq4akn5sq10/ZhWnhM1rupwRHsAy6nGNqN4cx9QJGBv8od8YYyAhDbbmCW?=
 =?iso-8859-1?Q?ZbTJMzYqUKBMCMZ7mZpK3b44HcDJOMzh02ydI4LLzehljhSG1kUAD11j86?=
 =?iso-8859-1?Q?1DkA739q9juxsS3iaFgLtt4FHddHqkb/HCL7GJUEucDpwQkkuMrg0h44fL?=
 =?iso-8859-1?Q?lJao6nDIF2zyaux7iYwJ+EiihUca/L9fc0QGS7Niv7zRifpzeqWLIXzNVc?=
 =?iso-8859-1?Q?lm4bsVBZuiJGj4SsM5dzVLealU3O3kbISFlEDiwDXcyLhmF2gWUyMmG9Et?=
 =?iso-8859-1?Q?6jQnjezEFcW2q0ExgiJnkvO4FvxeKMk9wqJd8ffsQ1KB1hlNZrnrHs2ngw?=
 =?iso-8859-1?Q?Qj9SW9j4eBS5aBgpfppy38LHyj4rkpfXgZJhUAFqTXGVjqbT2cRPQfnJRG?=
 =?iso-8859-1?Q?JMch9IQrESMk9PsRiLMXwLwsH45Ablly+9nPoT044=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7SPRMB0092.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?fyfV0wwbW60NOfG+32ZcfXmvjSaHfm0Hrm+hxlj5kSugGdQfYcba8mR9bE?=
 =?iso-8859-1?Q?qCjAxBHTU8cay+cJshxH8Km/JLnyHm5kuHa72wlrCisZhFMYMxOSyR7Fye?=
 =?iso-8859-1?Q?GezHY+glKlWh6edipva/DWCCsQTdRjKn7jgcArjzNW4Nx61r4gqAboP3A0?=
 =?iso-8859-1?Q?2qYo+VIknLVyYyvc39GZJubxW8Oju2BF0r57Utnw1+t44SG6vSb6bQzOlc?=
 =?iso-8859-1?Q?q1e3lur3i6YtDj2kGydtnaiO+DEaTTGbWdLUhT0bKHUVB4gaO4fruPhlfk?=
 =?iso-8859-1?Q?L+dDoD1O11eRo8ISjMcrGyIO994yyKO1GsZaDKe57y7cmSMkWOumUQpFyQ?=
 =?iso-8859-1?Q?RbF7UMYogiRasA19ivEvKHC567h+N1WYRrmyFNb3J59tg/Nj1i3eKJw8mb?=
 =?iso-8859-1?Q?sHAJuHGgrWVS43Vozn+RaHHY2MzEwHqhjDm6C/zS0o5vH9n4BApj5UJEtq?=
 =?iso-8859-1?Q?qo5PG01pZq+/HUME7H54O50ctLLsLFoAlJ8K4FBlIdCCvEQFSYR8L3SW74?=
 =?iso-8859-1?Q?fTrmn772tHxaVU40uno0rwIOgS9L+GSzvWvf4//s2DfFDss/XpSvL6Ygoe?=
 =?iso-8859-1?Q?ATPXxdBBz6AAuTY+kgUTNDo1qa4zzBisXzXSYLL+YgB1GqeSBrsHQc1oKL?=
 =?iso-8859-1?Q?3mePk5Hdiq87BXn4lfNMYsm/49ZZ4qvT1A1Lk6TzCvlaMPDdu5lPqipfSp?=
 =?iso-8859-1?Q?0H5krFzV0szPdn6jJHoV31dUKIYmvHLLUF3iqt2WmoZFy/OBOqCS6CStOU?=
 =?iso-8859-1?Q?tP2St1g/dgmZgAT9VvyU753OBwGafbFXsTVcxWhEqa1v/e0CMQz4Aa5M/e?=
 =?iso-8859-1?Q?r4u+pKUuZW+MIOkPmrOn6peaZ2Dh5J7ofdKwIbWM6pGw1P4ZzX0G3ecYOp?=
 =?iso-8859-1?Q?A+piTJ40WN6Zl2ew14yFWGrMcu4pKygmAqokcowT2rNZi3jYeqVC+rP2a5?=
 =?iso-8859-1?Q?a4kGVk853eGhBO1FAhlFul52Rb83Yk/dci+VvJJ4M6BC6GB6Msqef9uyQK?=
 =?iso-8859-1?Q?f7Lyets/yxhm/+9bJBk+aGqYTfVKaSB4up3Q4KtRb95YdB4VD/8gdHMJxc?=
 =?iso-8859-1?Q?sV9GMwhQKshKzfASxGkj1HO/3hK8Js+ocruxlm3pRpAxs/P2Rf10dDyy78?=
 =?iso-8859-1?Q?7bKFLI4cfNpJcoMFU0OTE+dQXwzQzb2wDN/y2gNH42GDJyrtvzTh4frJDa?=
 =?iso-8859-1?Q?h/XDCy2xQ9CAzquVv6QPWBnrJjEVWt/DcZJ5G+owvZrz/cgWzC9RZE98dI?=
 =?iso-8859-1?Q?Ij0Tvk9/oq8AoJDb+GeSAAKMCJ0Zi1s45ONdjvphAC22rEYjNPxP6FaW7p?=
 =?iso-8859-1?Q?0tLmClbUpYSIMz/ABCUD0Aew04lfBF18MjTWEi/qV+7ay9vWXqFyYBajEU?=
 =?iso-8859-1?Q?h3F+gfBKY1sv8BOdCq4OkdINNvy+HQUcoYua4b04xwJ4WO8avxUuYGJUSZ?=
 =?iso-8859-1?Q?VqXGgQyNj0KqyMQaPQQ3+QBB3bx/CawYF1eJ5jmSy/STnL2nnrPWI7GFNC?=
 =?iso-8859-1?Q?P3VznxILx59+DK18T0k3pSNCvYkL+Y8A2ClNeVUviqsyOYCFjTDBsaEy3f?=
 =?iso-8859-1?Q?uE29WKP4qI0mEScUJIEf12qUATP8C16ypa8XJF+CAWGrisJaPNqjpm/Ngt?=
 =?iso-8859-1?Q?sGcBorM+Gbl1yAkjzGojLwHKNw6cJLGzJTpMlZhkA9p2mzthoCkXCiEg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e4efbd1-066d-4dd2-dd77-08dc818cf5da
X-MS-Exchange-CrossTenant-AuthSource: PH7SPRMB0092.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2024 16:16:00.0990 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RuMGEVK0goHDGuUKlcKWhZu/Yjig9CSx0ZICLCHkALtiBrEM8SWK1dBIfg/OhJ05P1iN15VIZF+djQZR9sxjiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4711
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

On Fri, May 31, 2024 at 12:02:05PM -0400, Rodrigo Vivi wrote:
> Defer the ggtt node removal to a thread if runtime_pm is not active.
> 
> The ggtt node removal can be called from multiple places, including
> places where we cannot protect with outer callers and places we are
> within other locks. So, try to grab the runtime reference if the
> device is already active, otherwise defer the removal to a separate
> thread from where we are sure we can wake the device up.
> 
> Cc: Paulo Zanoni <paulo.r.zanoni@intel.com>
> Cc: Francois Dugast <francois.dugast@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_ggtt.c | 56 ++++++++++++++++++++++++++++++++----
>  1 file changed, 51 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index b01a670fecb8..d63bf1a744b5 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -443,16 +443,14 @@ int xe_ggtt_insert_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
>  	return __xe_ggtt_insert_bo_at(ggtt, bo, 0, U64_MAX);
>  }
>  
> -void xe_ggtt_remove_node(struct xe_ggtt *ggtt, struct drm_mm_node *node,
> -			 bool invalidate)
> +static void ggtt_remove_node(struct xe_ggtt *ggtt, struct drm_mm_node *node,
> +			     bool invalidate)
>  {
>  	struct xe_device *xe = tile_to_xe(ggtt->tile);
>  	bool bound;
>  	int idx;
>  
>  	bound = drm_dev_enter(&xe->drm, &idx);
> -	if (bound)
> -		xe_pm_runtime_get_noresume(xe);
>  
>  	mutex_lock(&ggtt->lock);
>  	if (bound)
> @@ -467,10 +465,58 @@ void xe_ggtt_remove_node(struct xe_ggtt *ggtt, struct drm_mm_node *node,
>  	if (invalidate)
>  		xe_ggtt_invalidate(ggtt);
>  
> -	xe_pm_runtime_put(xe);
>  	drm_dev_exit(idx);
>  }
>  
> +struct remove_node_work {
> +	struct work_struct work;
> +	struct xe_ggtt *ggtt;
> +	struct drm_mm_node *node;
> +	bool invalidate;
> +};
> +
> +static void ggtt_remove_node_work_func(struct work_struct *work)
> +{
> +	struct remove_node_work *remove_node = container_of(work, struct remove_node_work, work);
> +	struct xe_device *xe = tile_to_xe(remove_node->ggtt->tile);
> +
> +	xe_pm_runtime_get(xe);
> +	ggtt_remove_node(remove_node->ggtt, remove_node->node, remove_node->invalidate);
> +	xe_pm_runtime_put(xe);
> +
> +	kfree(remove_node);
> +}
> +
> +static void ggtt_queue_remove_node(struct xe_ggtt *ggtt, struct drm_mm_node *node,
> +				   bool invalidate)
> +{
> +	struct remove_node_work *remove_node;
> +
> +	remove_node = kmalloc(sizeof(*remove_node), GFP_KERNEL);

Are we sure this code cannot be in an atomic context or in the path of a
dma-fence? If either of the former is true, then we cannot allocate
memory here. Alternatively, we could use GFP_ATOMIC or preallocate
'remove_node_work' as part of the initial GGTT node allocation. The
latter requires a bit more memory, but GGTT allocations are heavyweight
objects, and using a bit more memory seems fine to me. Also if we do the
later, maybe just add the node to a list and kick a dedicated work item
which process all nodes on the list.

> +	if (!remove_node)
> +		return;
> +
> +	INIT_WORK(&remove_node->work, ggtt_remove_node_work_func);
> +	remove_node->ggtt = ggtt;
> +	remove_node->node = node;
> +	remove_node->invalidate = invalidate;
> +
> +	queue_work(system_unbound_wq, &remove_node->work);

I think we need to be careful with system wq usage. Recently we have had
two bugs [1][2] exposed in 6.9 in which we deadlocked by using system
wqs. I think it is likely safer to use a driver dedicated queue here.

Other than these questions, design of patch (try grabbing a PM, if we
can't defer to worker) LGTM.

Matt

[1] https://patchwork.freedesktop.org/series/133210/
[2] https://patchwork.freedesktop.org/patch/586095/?series=131904&rev=1

> +}
> +
> +void xe_ggtt_remove_node(struct xe_ggtt *ggtt, struct drm_mm_node *node,
> +			 bool invalidate)
> +{
> +	struct xe_device *xe = tile_to_xe(ggtt->tile);
> +
> +	if (xe_pm_runtime_get_if_active(xe)) {
> +		ggtt_remove_node(ggtt, node, invalidate);
> +		xe_pm_runtime_put(xe);
> +	} else {
> +		ggtt_queue_remove_node(ggtt, node, invalidate);
> +	}
> +}
> +
>  void xe_ggtt_remove_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
>  {
>  	if (XE_WARN_ON(!bo->ggtt_node.size))
> -- 
> 2.45.1
> 
