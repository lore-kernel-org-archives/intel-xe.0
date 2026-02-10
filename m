Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 227B7EA3F18
	for <intel-xe@archiver.kernel.org>; Tue, 10 Feb 2026 22:24:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C244410E120;
	Tue, 10 Feb 2026 22:24:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gnOeClf1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C38F810E120
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Feb 2026 22:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770762272; x=1802298272;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=D3NBMrat44g4IUhsRIVDYZi9UoQoSYMvSDwlLQef/lU=;
 b=gnOeClf179e/OFWtXaKBL3sZPusU5Y9Z9ptIpvjGSOqqzM/KTWgIlyhb
 JssOYgso9iLptHu6p3ZcZT7tBsD+DaARAaO0gVhx/FgE1OTRd0dtvzxvK
 VOwdZDlSMyXJn2Khrb8CYqOXyXlIrD7b2PWa1MPYi1VQfwS2FmuOM0dEX
 RCiXyRVVGhS7WYbmL4lMGS4+29zbbxfc6Fc3w9+xyF05D3EEika5A5erh
 IgpGqEVH/Mnepe/sNAlzX1909blxeg9VR2ihwKhu7CbP3iZtC5PZDHN9Z
 RhfFrbWtR+h1tbOM4V4zLmmG3n5cbrhG9+4SMH3vpxGtUSo1ygJWT1P0L g==;
X-CSE-ConnectionGUID: OZKvNCN5RR6yM3xLPSvneA==
X-CSE-MsgGUID: IDn5Pil7QTiyK9/AuoihTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="71796878"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="71796878"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2026 14:24:32 -0800
X-CSE-ConnectionGUID: LilDFW/rS1iAtBhoQHW/aw==
X-CSE-MsgGUID: JWjL4hcJSEG49CQxJXt0WA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="216561102"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2026 14:24:32 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 10 Feb 2026 14:24:31 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 10 Feb 2026 14:24:31 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.39) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 10 Feb 2026 14:24:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WmBx95FyaHoYTCHmryfB73/DPY8hid/dHgyuW08b+VtVSAfBeQlpjPlDEU5mzZK37VPHaWN1xnqOR1Sxog8nyC76Hy4YjqrQD0MvvbP3WwPTPLEWPC2KX/1ROCHyD/5qRL9j8FD2Iq/y87F2vV55ht17x1Kn8A2XaIlsTwK5dUN26V/5PU3LAKbkGd64kxO3Mh+vLHbt/gJlLXOl/MUjSNOKuHWXZgzOv8OKm3REcbFpHhmKVHhF7yJJIXtrgGYE5tPVvyn+RiyogXLLFCLgIPzhX7jaB2QsMmtcNE08VzVGY93AQBh5TrTnUMvv7znIHoKugGERIlYLVSFLDFUizA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=esFwVymfM6Gn/dEK214PhPlPlHm2Imxha+B9h7xKFRA=;
 b=svh4vFLmdclqDw5WypTyvSvqtNJxvTxoefjP2ndgXhqfs54RbqzehSDZXwLt17usDWlNgr2wGjc/TrQ7FXHQGw9OuFQQJH/d5zZCPqiD3HXD26Q+Yiog/YG79Xo6pR5AIDKM0T19tTYe6TUXP/r9xh7XeOqTU5e+TaVnoWEz7sqKm2XRdokjl+d0UkZ+qyPJHESXFobRANI0ibbQKd0y3uwaNYr7we45h2ru4+303Q1hzBMUIwR6liYXLFxpuD7zctFS1HhVR2Z52YCGcUrG72RHO4xg6iNqQb4Vg4TNFYBNgX54WZx3BQ7eKH8RMp5yVXPgb8mcUWcKciYtB4kM8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by CY8PR11MB7267.namprd11.prod.outlook.com (2603:10b6:930:9a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.17; Tue, 10 Feb
 2026 22:24:27 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9587.017; Tue, 10 Feb 2026
 22:24:27 +0000
Date: Tue, 10 Feb 2026 14:24:25 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 4/6] drm/xe/rtp: Extract rule_match_item()
Message-ID: <20260210222425.GH4694@mdroper-desk1.amr.corp.intel.com>
References: <20260114-rtp-rule-parser-v1-0-fa9029586bff@intel.com>
 <20260114-rtp-rule-parser-v1-4-fa9029586bff@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260114-rtp-rule-parser-v1-4-fa9029586bff@intel.com>
X-ClientProxiedBy: BY5PR17CA0071.namprd17.prod.outlook.com
 (2603:10b6:a03:167::48) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|CY8PR11MB7267:EE_
X-MS-Office365-Filtering-Correlation-Id: 96141af3-e12a-4a6b-30a2-08de68f326d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?GBzx2kvcTLoQPpRkmPHHD5gdVjnNOZ8U9LAH2GMp6aawWw7TcKX4sArP9kcM?=
 =?us-ascii?Q?yBIegXL2NDro5IuOflPE9oajyP9oDNgEC9oPTG9r+tc38SesYL8TdVKjf7Ig?=
 =?us-ascii?Q?7ad9F06KoNKoCTEWCi/RR/CcWO9w8vl7ita5U7fFIlVyfSkh4DlR9z0IIy6i?=
 =?us-ascii?Q?V87B5vUdCvoij5hp3FQZ+BCvY0+UB4PTTH00owjP4hZ5Ng/KV2dmTrb44o1z?=
 =?us-ascii?Q?VHbuBa+gXOd+bshSnS7WTPtRyeFzvAtJ3+1asAS4BaVfnZLG6Hcvh3ENdfCI?=
 =?us-ascii?Q?Xx3Zu8JYmr0RkUVaGY7WpAqFS6/uceYlsHbT9oEcmTAtgBtHHcpysXV1SEpG?=
 =?us-ascii?Q?4JVdjYMc9sPOuAfe44HAEUzY5XccCIIQT96nTVScL62Cbg559JEk4KUIQKn3?=
 =?us-ascii?Q?L4hCInAXT2XqTjvCo+UGzXYpJzzZ0gs2TfUwaRP3db+DPmIhG+G0ujIysQYR?=
 =?us-ascii?Q?bYX6bZM/P+X5GiyT95zxCIaR52Q7pqvXu3PgxJN8ADGULnWA8FC2qlxgHQIN?=
 =?us-ascii?Q?NvcT1olKnUtyvQnx6SFwIXFx621FmHqUWct2QOj/BVzAW4GmpIh6ya4ojhO1?=
 =?us-ascii?Q?3STiUTLTGVyBAHVhdK7BnZka01NNc2qIy/fiNxC5ZT/yjsghHwkkgNvE51m6?=
 =?us-ascii?Q?sLTzaXPGoL3OLdVLqpUDNkjDEDmTS5qACslc/C4jdLbVdvpIUOBYHQlLXTCf?=
 =?us-ascii?Q?6HQokQF5/4YqXWJ2OYX1NkyMgm7CLBrjW6RbbsqrkQO6OuqD7FGhfhm8pqEY?=
 =?us-ascii?Q?8kZAtB1mOyDnVR0ZbS4EFijLe264CyTK6ioT1NaA/hRfqQO6gbg8yZpySGD2?=
 =?us-ascii?Q?3O27/0SV7aNNRDhLfF6mwc+RcLGS7j0m/SPhF8pkGyxACbivTzD2sbSAMti9?=
 =?us-ascii?Q?bDHvVqaCPzLyzRrUunTFZDDHdQLjtkVWCcKMsKDOzMvNbvubuI+kOiHyZ5W0?=
 =?us-ascii?Q?+JUCIbwss3mgTFRov+OYVTetNwiGBfgHLCOCjkYCfPZvAz+bswBzqKPn6eBB?=
 =?us-ascii?Q?OA04FWSjC8opfrx63NgLOl1cqVA6L3yvQ7tbWqUjU7vZbmiEOyeBYnSK8irx?=
 =?us-ascii?Q?uOqWvV7Zo4CN8S8hD8aXFM6jw7nXzfi4z/jbpULGHbHDC6Nso4Bb5XtW04gv?=
 =?us-ascii?Q?NTPx8iJ2AEc7gSfAcaj9tbPXi/pK3RBq/G2XU/puzdtqe7FQpyWI9vOTue8i?=
 =?us-ascii?Q?jaehuS4J7D+m9EzyZw9mphsKwek6FH5r5HwGfs/v9Wxas9NOCGvw6MxCcLv2?=
 =?us-ascii?Q?zfmC6P1R3N7fO0UCu1Iuf2AL4WDXNnJgFhv6F//jb4UhcoPXZUUTNg6owFwL?=
 =?us-ascii?Q?T2LjL85vcwtflw2OE4nyIpvaKY4XjqZHv19o6xlcTfRCEA8X5W/iXjl4dO9I?=
 =?us-ascii?Q?drkA9hvATA+dl6rx8PReh0kkYKymm4qLEpikdakb09Dqq5SOxcabreLD3H0p?=
 =?us-ascii?Q?u7Q2fmrpm2MCSbkT1Xqp9HGP7Sn2XmVYJFvXvEGjOlmCPk4F3iQ69Qcr0cVp?=
 =?us-ascii?Q?H1vuZhDkQX/X/8+Qoi5p96mF7n59ESPDGEUgoA+Xh9CiPZvjyI9PMiX3f2Rw?=
 =?us-ascii?Q?dyTA0nQnoULmKG6DY34=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2b7eDKsk5dToqYJRuCBEN0GX7i80FSjSwbdozSddjEy72ShukNFiRy+fXYij?=
 =?us-ascii?Q?nx3setIhM1beEr4rrgqbOwa9FCRvbjuuDOjLa/ZHHv1JYiP7MQwpjOJ95bvT?=
 =?us-ascii?Q?yJPM4Mbd82CAgMWOdIkFI8nb22gioAt7wXTEPXl0U2ixB4j374Y8lXRIpbLF?=
 =?us-ascii?Q?0s15XrvKouPDu5680S7Tq1rOnalw+m+uocK4Zz/vs+feZSJU3/i5h+h/7aar?=
 =?us-ascii?Q?j9zA8wZhQyYB4Z8Vh3S+HJQG/wSLl19clB9hpfz4h/T6yo0VFzsZvmOXYjYC?=
 =?us-ascii?Q?oPazW0EBVMoTGih5rqGN7PrTm7YKo5wRgMniGqAJhEWUrmn6fweQ/S3K3xkX?=
 =?us-ascii?Q?TFW+iat8jHL5pMeuYaQtrAWiOppvv2jNY6VlEtIzr+CS1mVz427UsfkakVqy?=
 =?us-ascii?Q?S/Ye2otZI/8qNWJMKPZ+bCCj/n6rHz1xjlmp72vf/AR9PkOFj/2Ohyb2HGVz?=
 =?us-ascii?Q?DCB6gg+BrgplIAxssUIUMmBCQts5ECzIdU0jX/sUA4yIA/9ilUpmhJHCSKws?=
 =?us-ascii?Q?8CoToQQCbOa677NKx7n1myfvecV0l9S67ffe8cv28v5SJdb79/DgVmM8R9u6?=
 =?us-ascii?Q?9px5a9CihtKMHh0wm2KPNMifCij7TG6egYtp+Bf3qxSdAcXkpx902KG8KhsL?=
 =?us-ascii?Q?PTjC2FsZPZ1C/lbtr3uwagzw8d3cajc6QHzxfnb1dXPAA7nZ3NTSg2vF9EzQ?=
 =?us-ascii?Q?erfIVoFCRfFsN3lI7kzQ72Bjwx7wKMMjf9BNq0ah530PITDF8ncHgfSj7+Io?=
 =?us-ascii?Q?ucyr9Vv+BBbPqZpLWAUTQImS9Av48NwefprXUUhhVUfwwtdy1NW3kTER8Mgr?=
 =?us-ascii?Q?Tj5mT6tJc0HcwPPLNS0j5iR4jfOxBd5bi6Z37fSTpmsfRzcqguBiL3Txk4OQ?=
 =?us-ascii?Q?OfNOB4S5fPf5d7FKCExdpv+2KjYysFjfmiB+fG39WSGEkvOuYZH/1iEwafs/?=
 =?us-ascii?Q?neUI1qqJsinlI+yuuVUb+T0mILVaFeTIYV/8iLwxJJ4u3kNZ5URoGpHOLaj6?=
 =?us-ascii?Q?npyVTQX/xAIvmrAKzY64VsNo1aK1oq7lXbNTBpAKuib7cDkVRJFg7EGJ+f0i?=
 =?us-ascii?Q?BQsrGrbzLXZhPUrXmoldpmeOuQi1cUbwPOCZNJcs0oJeSKwaLtUggydA5Tbm?=
 =?us-ascii?Q?DikZVfFzPmn7PUJ51PWvKNKr2DWlrt+hjxiZPlX54Ms9nrGauzzkfAOJlg0t?=
 =?us-ascii?Q?u6KPxeFD68YIqvKMrTPoOS2Jc7xYK5L42XlEtbXz2H0YG5BA5fOK+/hT/iPv?=
 =?us-ascii?Q?UOJOQWHUXdx5+5t9iTNa2A30K0SXso0RyNZXN/gGdvz5B3zhwvgCpoWgSzhh?=
 =?us-ascii?Q?5xv9uI1DsqvmApB8U+1L0LTUHCcSsEEJJj/x1EA6+AL8nf2vsGBaRkb3o+S3?=
 =?us-ascii?Q?qvScrSyAzRYGX2tz/FZ/xy1gNgIf5uGoRwPNuU+yvmpvlSKH6pgSNrFxV9vi?=
 =?us-ascii?Q?rlX1eoMw7eA4/6+x7VKihtyMAR0teX/7kcVBKX0vTAi6kDC3gXCseyq68grm?=
 =?us-ascii?Q?v/fg/IodvCIelR/7f8srTzN+m0pBspYtLuRgT7TiQ00xYxX9WiYLNZclVmCy?=
 =?us-ascii?Q?njY2QhNUwBwW+e4tBwasQ+tM8Pg6WcHs5rkGxBua0VGFnn0THNtteF4+6o8i?=
 =?us-ascii?Q?H2ScePZRe1DBdhiKbCnJ2ARoxMAYYws6MG+8xPigux3n1NtpRAVG+/ZtJUl/?=
 =?us-ascii?Q?/L2/xg/hiRyWmbIgV4xgail+ryFiXOh5S0IXljzlQ7hfhSrdH4m8GFXu7r/+?=
 =?us-ascii?Q?LFEDOSae0ui2tDhcFLd7rVdJQwrcoUM=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 96141af3-e12a-4a6b-30a2-08de68f326d2
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 22:24:27.2922 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2k0GmwQLRiW1p/5pStjKAheYf8kSh5QEt7/hijN+T9nM9WoOSfnndrYclrckmEx647/zmVhL4p/J7ecw7aNDfTrWVFLViyGwNRo6peuQaBk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7267
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

On Wed, Jan 14, 2026 at 07:49:54PM -0300, Gustavo Sousa wrote:
> The currently logic in rule_matches() mixes individual rule matching
> with the logic necessary for handling OR operations.  Let's simplify
> rule_matches() to focus on the latter by extracting individual rule
> matching into a separate function called rule_match_item().
> 
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_rtp.c | 205 +++++++++++++++++++-------------------------
>  1 file changed, 88 insertions(+), 117 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
> index e0bed5ac1369..dabc2e74e2ce 100644
> --- a/drivers/gpu/drm/xe/xe_rtp.c
> +++ b/drivers/gpu/drm/xe/xe_rtp.c
> @@ -30,6 +30,90 @@ static bool has_samedia(const struct xe_device *xe)
>  	return xe->info.media_verx100 >= 1300;
>  }
>  
> +static bool rule_match_item(const struct xe_device *xe,
> +			    struct xe_gt *gt,
> +			    struct xe_hw_engine *hwe,
> +			    const struct xe_rtp_rule *r)
> +{
> +	switch (r->match_type) {
> +	case XE_RTP_MATCH_PLATFORM:
> +		return xe->info.platform == r->platform;
> +	case XE_RTP_MATCH_SUBPLATFORM:
> +		return xe->info.platform == r->platform &&
> +			xe->info.subplatform == r->subplatform;
> +	case XE_RTP_MATCH_GRAPHICS_VERSION:
> +		if (drm_WARN_ON(&xe->drm, !gt))
> +			return false;
> +
> +		return xe->info.graphics_verx100 == r->ver_start &&
> +			(!has_samedia(xe) || !xe_gt_is_media_type(gt));
> +	case XE_RTP_MATCH_GRAPHICS_VERSION_RANGE:
> +		if (drm_WARN_ON(&xe->drm, !gt))
> +			return false;
> +
> +		return xe->info.graphics_verx100 >= r->ver_start &&
> +			xe->info.graphics_verx100 <= r->ver_end &&
> +			(!has_samedia(xe) || !xe_gt_is_media_type(gt));
> +	case XE_RTP_MATCH_GRAPHICS_VERSION_ANY_GT:
> +		if (drm_WARN_ON(&xe->drm, !gt))
> +			return false;
> +
> +		return xe->info.graphics_verx100 == r->ver_start;
> +	case XE_RTP_MATCH_GRAPHICS_STEP:
> +		if (drm_WARN_ON(&xe->drm, !gt))
> +			return false;
> +
> +		return xe->info.step.graphics >= r->step_start &&
> +			xe->info.step.graphics < r->step_end &&
> +			(!has_samedia(xe) || !xe_gt_is_media_type(gt));
> +	case XE_RTP_MATCH_MEDIA_VERSION:
> +		if (drm_WARN_ON(&xe->drm, !gt))
> +			return false;
> +
> +		return xe->info.media_verx100 == r->ver_start &&
> +			(!has_samedia(xe) || xe_gt_is_media_type(gt));
> +	case XE_RTP_MATCH_MEDIA_VERSION_RANGE:
> +		if (drm_WARN_ON(&xe->drm, !gt))
> +			return false;
> +
> +		return xe->info.media_verx100 >= r->ver_start &&
> +			xe->info.media_verx100 <= r->ver_end &&
> +			(!has_samedia(xe) || xe_gt_is_media_type(gt));
> +	case XE_RTP_MATCH_MEDIA_STEP:
> +		if (drm_WARN_ON(&xe->drm, !gt))
> +			return false;
> +
> +		return xe->info.step.media >= r->step_start &&
> +			xe->info.step.media < r->step_end &&
> +			(!has_samedia(xe) || xe_gt_is_media_type(gt));
> +	case XE_RTP_MATCH_MEDIA_VERSION_ANY_GT:
> +		if (drm_WARN_ON(&xe->drm, !gt))
> +			return false;
> +
> +		return xe->info.media_verx100 == r->ver_start;
> +	case XE_RTP_MATCH_INTEGRATED:
> +		return !xe->info.is_dgfx;
> +	case XE_RTP_MATCH_DISCRETE:
> +		return xe->info.is_dgfx;
> +	case XE_RTP_MATCH_ENGINE_CLASS:
> +		if (drm_WARN_ON(&xe->drm, !hwe))
> +			return false;
> +
> +		return hwe->class == r->engine_class;
> +	case XE_RTP_MATCH_NOT_ENGINE_CLASS:
> +		if (drm_WARN_ON(&xe->drm, !hwe))
> +			return false;
> +
> +		return hwe->class != r->engine_class;
> +	case XE_RTP_MATCH_FUNC:
> +		return r->match_func(xe, gt, hwe);
> +	default:
> +		drm_warn(&xe->drm, "Invalid RTP match %u\n",
> +			 r->match_type);
> +		return false;
> +	}
> +}
> +
>  static bool rule_matches_with_err(const struct xe_device *xe,
>  				  struct xe_gt *gt,
>  				  struct xe_hw_engine *hwe,
> @@ -39,133 +123,22 @@ static bool rule_matches_with_err(const struct xe_device *xe,
>  {
>  	const struct xe_rtp_rule *r;
>  	unsigned int i, rcount = 0;
> -	bool match;
>  
>  	if (err)
>  		*err = 0;
>  
>  	for (r = rules, i = 0; i < n_rules; r = &rules[++i]) {
> -		switch (r->match_type) {
> -		case XE_RTP_MATCH_OR:
> +		if (r->match_type == XE_RTP_MATCH_OR)
>  			/*
>  			 * This is only reached if a complete set of
>  			 * rules passed or none were evaluated. For both cases,
>  			 * shortcut the other rules and return the proper value.
>  			 */
>  			goto done;
> -		case XE_RTP_MATCH_PLATFORM:
> -			match = xe->info.platform == r->platform;
> -			break;
> -		case XE_RTP_MATCH_SUBPLATFORM:
> -			match = xe->info.platform == r->platform &&
> -				xe->info.subplatform == r->subplatform;
> -			break;
> -		case XE_RTP_MATCH_GRAPHICS_VERSION:
> -			if (drm_WARN_ON(&xe->drm, !gt)) {
> -				match = false;
> -				break;
> -			}
> -
> -			match = xe->info.graphics_verx100 == r->ver_start &&
> -				(!has_samedia(xe) || !xe_gt_is_media_type(gt));
> -			break;
> -		case XE_RTP_MATCH_GRAPHICS_VERSION_RANGE:
> -			if (drm_WARN_ON(&xe->drm, !gt)) {
> -				match = false;
> -				break;
> -			}
> -
> -			match = xe->info.graphics_verx100 >= r->ver_start &&
> -				xe->info.graphics_verx100 <= r->ver_end &&
> -				(!has_samedia(xe) || !xe_gt_is_media_type(gt));
> -			break;
> -		case XE_RTP_MATCH_GRAPHICS_VERSION_ANY_GT:
> -			if (drm_WARN_ON(&xe->drm, !gt)) {
> -				match = false;
> -				break;
> -			}
> -
> -			match = xe->info.graphics_verx100 == r->ver_start;
> -			break;
> -		case XE_RTP_MATCH_GRAPHICS_STEP:
> -			if (drm_WARN_ON(&xe->drm, !gt)) {
> -				match = false;
> -				break;
> -			}
> -
> -			match = xe->info.step.graphics >= r->step_start &&
> -				xe->info.step.graphics < r->step_end &&
> -				(!has_samedia(xe) || !xe_gt_is_media_type(gt));
> -			break;
> -		case XE_RTP_MATCH_MEDIA_VERSION:
> -			if (drm_WARN_ON(&xe->drm, !gt)) {
> -				match = false;
> -				break;
> -			}
> -
> -			match = xe->info.media_verx100 == r->ver_start &&
> -				(!has_samedia(xe) || xe_gt_is_media_type(gt));
> -			break;
> -		case XE_RTP_MATCH_MEDIA_VERSION_RANGE:
> -			if (drm_WARN_ON(&xe->drm, !gt)) {
> -				match = false;
> -				break;
> -			}
> -
> -			match = xe->info.media_verx100 >= r->ver_start &&
> -				xe->info.media_verx100 <= r->ver_end &&
> -				(!has_samedia(xe) || xe_gt_is_media_type(gt));
> -			break;
> -		case XE_RTP_MATCH_MEDIA_STEP:
> -			if (drm_WARN_ON(&xe->drm, !gt)) {
> -				match = false;
> -				break;
> -			}
> -
> -			match = xe->info.step.media >= r->step_start &&
> -				xe->info.step.media < r->step_end &&
> -				(!has_samedia(xe) || xe_gt_is_media_type(gt));
> -			break;
> -		case XE_RTP_MATCH_MEDIA_VERSION_ANY_GT:
> -			if (drm_WARN_ON(&xe->drm, !gt)) {
> -				match = false;
> -				break;
> -			}
> -
> -			match = xe->info.media_verx100 == r->ver_start;
> -			break;
> -		case XE_RTP_MATCH_INTEGRATED:
> -			match = !xe->info.is_dgfx;
> -			break;
> -		case XE_RTP_MATCH_DISCRETE:
> -			match = xe->info.is_dgfx;
> -			break;
> -		case XE_RTP_MATCH_ENGINE_CLASS:
> -			if (drm_WARN_ON(&xe->drm, !hwe)) {
> -				match = false;
> -				break;
> -			}
> -
> -			match = hwe->class == r->engine_class;
> -			break;
> -		case XE_RTP_MATCH_NOT_ENGINE_CLASS:
> -			if (drm_WARN_ON(&xe->drm, !hwe)) {
> -				match = false;
> -				break;
> -			}
> -
> -			match = hwe->class != r->engine_class;
> -			break;
> -		case XE_RTP_MATCH_FUNC:
> -			match = r->match_func(xe, gt, hwe);
> -			break;
> -		default:
> -			drm_warn(&xe->drm, "Invalid RTP match %u\n",
> -				 r->match_type);
> -			match = false;
> -		}
>  
> -		if (!match) {
> +		if (rule_match_item(xe, gt, hwe, r)) {
> +			rcount++;
> +		} else {
>  			/*
>  			 * Advance rules until we find XE_RTP_MATCH_OR to check
>  			 * if there's another set of conditions to check
> @@ -177,8 +150,6 @@ static bool rule_matches_with_err(const struct xe_device *xe,
>  				return false;
>  
>  			rcount = 0;
> -		} else {
> -			rcount++;
>  		}
>  	}
>  
> 
> -- 
> 2.52.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
