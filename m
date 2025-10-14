Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADE2DCCD184
	for <intel-xe@archiver.kernel.org>; Tue, 14 Oct 2025 19:11:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5226010E140;
	Tue, 14 Oct 2025 19:11:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kqRH1EwW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D13510E140
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Oct 2025 19:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760469105; x=1792005105;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=YiE22w3PfaSVXlxyXzR9qhrpHrsm6sE0HmatAhxjngM=;
 b=kqRH1EwWSdq4mhklbaX/I+cwCaA+wQcTz77VrQmUzpPGwZ71wymxwGDB
 6PjGTAmJLDalcFhgwLH8gdV8Yj6vkJXSzJ5b7aI2jfAoaV2es3YBQbnP5
 9/dTIjbP4pMS+2+a6fXjADEFugUK0ma9AH0hqXcctvsQ+qs8HhmdYIy14
 BTxdvocUqsY1q8zgB8yOxgyByuu+KbtVuxhuZVC8MQn684hkojWn9qcxR
 biTtgiKf/aTAJWNxV4IfU41I/dOhZC5KgCYG0tgm4rO4g/MzIfyuZBlzC
 fA1lF+nzvOWBhJ8LMqIpaZmEr+qtnccGJgs/dM666RMw+IPnnKWUAX1Eg w==;
X-CSE-ConnectionGUID: 8Y8+/35oRl2eaLRdodJLsg==
X-CSE-MsgGUID: 6Eq0ppEvQKyJzCy1CQ1k9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="62671436"
X-IronPort-AV: E=Sophos;i="6.19,229,1754982000"; d="scan'208";a="62671436"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 12:11:44 -0700
X-CSE-ConnectionGUID: aWV91TanR6GXOBW7g2xiIg==
X-CSE-MsgGUID: XtL5JSjsStqG3RMIwemnZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,229,1754982000"; d="scan'208";a="187059897"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 12:11:45 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 14 Oct 2025 12:11:43 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 14 Oct 2025 12:11:43 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.44) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 14 Oct 2025 12:11:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vuiUjzi028VjwsUqcwnZ88tPWFEstEndYYv7IPIWkTROUFLzh+IuGv4AX7Iu+37+aJZhZQRBTGbfnz3R08WXqWz4Xr6wXqEPEMqF2/fCW/lXuL3mKNqKfliq3f6tbgt7vRZAxaSNDURPDs1luFK8M6dQyu+SLuONTcAIvEIy2rni6s7ra4jjDIgkx07LCUIL0AQlKhPxxpvaLfO18EBe4D5phmc2qfQE9QMp2oOSRRxUvdth+A8yMjmdjVXKduewd2GemkkxH1iB08llovLoEGM9howZeNb7jYe65cTeHOkNyQpXgkjYZHc64RSHT+Hd/Ee4ZgFt7L9DZ1aPzYVGGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OK5rdOdXpdkQNdv63FwjBU65nWWOP8hJExkwgcMqOtQ=;
 b=yrGM8G8RpEuYXk85TJwwn6NX/REKPGXtPqMHxHIr2sInHmJK9gs1yluZJHN3CfysGyxOMIpQI5dCDTc5NkSlAR6V0MJrJIIYy2jqLl0820EzIy4rzC+VjBn+Q2F5rWdUbmxfeEOvL+MjjLhtf4LgB0TurvguQxWr7la0LEI+36EDueahLzBb3Mudn06grTpB+IMMys71DAPacguzKnJXtSkMcrGl+C6D1FGoEVgDXa339tw6yjN7do0dfIeUPYNOynwlwTA1CqdEr4rrh812bqX6p7QWPXUGGp3+jmxyxlXRbQ6cWiZ+pIlfQQaS7BCCxXKxOqwoTxym7sX9zeQ80A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by IA1PR11MB9495.namprd11.prod.outlook.com (2603:10b6:208:59f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.13; Tue, 14 Oct
 2025 19:11:42 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.20.9228.009; Tue, 14 Oct 2025
 19:11:41 +0000
Date: Tue, 14 Oct 2025 12:11:39 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Shekhar Chauhan
 <shekhar.chauhan@intel.com>, Balasubramani Vivekanandan
 <balasubramani.vivekanandan@intel.com>, Tejas Upadhyay
 <tejas.upadhyay@intel.com>, Harish Chegondi <harish.chegondi@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: Re: [PATCH 23/23] drm/xe/xe3p: Add xe3p EU stall data format
Message-ID: <20251014191139.GA5409@mdroper-desk1.amr.corp.intel.com>
References: <20251013-xe3p-v1-0-bfb74f038215@intel.com>
 <20251013-xe3p-v1-23-bfb74f038215@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251013-xe3p-v1-23-bfb74f038215@intel.com>
X-ClientProxiedBy: SJ0PR03CA0110.namprd03.prod.outlook.com
 (2603:10b6:a03:333::25) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|IA1PR11MB9495:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d7bd405-856d-4d47-35d0-08de0b558214
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?YH3zQoitQoeXTR2Yxl6xZA3Eib29eCyDEuTSPj23z+mmnfE/8GXsQnEVh1fF?=
 =?us-ascii?Q?+hqmVsxuSDTP7ttEqsIKMnfQ9CV3vM3gv6aB1kNYxCuihOcdhMw0Exh4FCrq?=
 =?us-ascii?Q?+MEts8iE24K3SNZpbLaYwvMVe4H2a9ZioykooWlt3C7C+/GY1wa34fHiV6Su?=
 =?us-ascii?Q?sjUVappxJ5Bd7rMyijUQKzAPPq+ejNCT7DU9w9MCjcqkhhNUXztnQssNVANe?=
 =?us-ascii?Q?P1mIfIhi6CGu7KYmrlYR24C/nbtR+tDMAjRnGIJd35wOIU5OoVQwQoIIBXVX?=
 =?us-ascii?Q?rdotJTGxq391bS10iQqWDv92xPrOrsOHyyjGbyDdImVG9yCJpn/t18DvNhO8?=
 =?us-ascii?Q?vQ7+l7o00Q3fvvp0KGTdiEj2CDU24wbVU7f7/8wj3lWXXGM6Gd2Jao0KS0Nj?=
 =?us-ascii?Q?d6q3Q3O1SJGs+Z1qLw8EJVuQ7twrlrsWhb7xA5vzi/7N6+rhJnn6EB/TEpIj?=
 =?us-ascii?Q?dbPT5AH9+2rwUmr7q0nzXDTB/eiOaZJvZCecO4ugDf0CT8ODor1xOIto1eiM?=
 =?us-ascii?Q?hVvd4D112xX4EFnsPCx8iyyj5yDrX3LfjqVfZSIeeNy/XGlUSvc6uGJQX2BA?=
 =?us-ascii?Q?Tuagxu5odLBAUD3wgQ/w7PqfahdNnU9w9FY1etvpUPIVwH6+AE188tpnM9DI?=
 =?us-ascii?Q?4ukcS01QUvSQuhjpgBNcdfiBSrkwfQZu1ySoYeBdjZIwMRIwccesKKqr8RNA?=
 =?us-ascii?Q?WsFowyE1F2g445Gc1iuLCDKnuYG8FqGEUH5QXUxE73lJFcz4nTA58UqUSacX?=
 =?us-ascii?Q?N3k6KmblfLANwAbxEDL5KmB8P3vcaFtImqq4koTQq+kzlsHALPu7SxiYZGDf?=
 =?us-ascii?Q?0vV3BhlS8cVwiCGAT1U5owInkf0lUhOttemaQgcmV+T8z+KJ2fKO2lsn1cLG?=
 =?us-ascii?Q?3e3XmTCJ/Eb5qZ6wjl98SsX6x9LWb6KEsmKc52dwC/1E7xfpAw4Qaga/nZuj?=
 =?us-ascii?Q?2FmdKsOyaPWv5T98q005BLVo6ArZy+ayB5+x90F+1iQ58R4Z8xVcNIyvCAUk?=
 =?us-ascii?Q?ZCHvo8b0O5AUG9mft+Fq8U6SRYc7dJdGG7e4ixEuJmXA8JaaqAmj3/dkzyrv?=
 =?us-ascii?Q?2tBRDmK+I4G4ZsjR8YvI9+McIp5tdB+qCtaqUNUGYjOaE1Q1aRA2N/2I9qPr?=
 =?us-ascii?Q?BhAOhUfKu/Ld+g/geXfvVZLYlnZif9LPD2UICKJTvrQOrjh123r2nWux/CxH?=
 =?us-ascii?Q?huM7KCKlLbc3GVPA9sytrG5CntSq4FRiam5rXPqfd55yTKmZsJxtTJVx0tlF?=
 =?us-ascii?Q?TBt096dEmTJSbBSYy4oWd2Dp9rvpDku9K6oe7X94QmTaFd2dGfV3HSkykwzq?=
 =?us-ascii?Q?2uTpw6ORfm0taE91QDSbvhztPwkXp12NpHiFRocHV/uZjK46FRS2ClyoZP/2?=
 =?us-ascii?Q?Mb24mXIvZkO/PJtBzZiCFZttz3fTYkWzi0j+ynJjsqTIZkL1yK9v/oueKxcW?=
 =?us-ascii?Q?eNxkjytk8sq9jkW3cNWgIshpdhR9rlVG?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?it0h0Odmc2suS9kiLTvoZUorVg5WKopqtS5qgHzaBK0zcT3FRx77084+uvdY?=
 =?us-ascii?Q?M63mMBjVcsqvtP/zjYTY+UQsnYQBAAJBMVT//MmZa31Q9Et2VULWVW0+Ko9I?=
 =?us-ascii?Q?hg0oSIVKxsKB/ga81UFVWqlnZ/rc+ahSu1T9B5CsGu96P2NFLZWgdmf70qs0?=
 =?us-ascii?Q?cFtkxN4h8QQDI1yBnOPgH/hEknOk5TYDc7A0SoeCS+4qm/HO3uPPLn0CZpPZ?=
 =?us-ascii?Q?PfJztaK3YKqj/3TXP/hSZufeDrUsVtrna74V9Bb1iNG63u1ZRaFsOtwZxu7l?=
 =?us-ascii?Q?YtB24iE7swpnJZRNju5+Ari8d1Tlrek1aFrTALKrjaW0osTRCyDFB4kWS/P9?=
 =?us-ascii?Q?cZPJLE8yixLffO1jTnD4pDPypxR3zQIrqvYXzkfWmiArj4mr/P/NMgW0NvLl?=
 =?us-ascii?Q?egha9PaWxraERJt6o0sieFDXYy7f8UIyfath6zTzuthuSgIk93C8mA7mIL+u?=
 =?us-ascii?Q?L1z75okx6v62tj3/roHBXmkeyuvJBM3dIM1t1EIXg9gtT4B44Nq5Iw7Ds9Ra?=
 =?us-ascii?Q?VBHZxERaz9IpWtjRO1Z8vdRwGwa88MiTikdc++g8px4NDp+SgKDRoDtJoGik?=
 =?us-ascii?Q?qOM12WoaPFzsRfQ8Rr0RLmsIldrsXAsCLJ+/UtDuXT5Ft9AtARQwyd8GqXk2?=
 =?us-ascii?Q?g1fTveazOiSTteSY0NQq57cwCvW3g037p7vGF0eO0vXeuRwcfdHruQoKeMzS?=
 =?us-ascii?Q?GKhBYURqCu2xDlh76OVMlVVE9xlnSsM6dZPMGDzl5Tdnar0FzT/FK1KJEpOx?=
 =?us-ascii?Q?CFQu5AtONRi5QZmwbtp17hYFVJ03nO+1ubUXvVfDvVSphTSRAb2xgwOv0mBQ?=
 =?us-ascii?Q?fmtrPQpFnmzjqdDFFyxYgVJxusWS2xGvIMPrYKKJrWjMnCVlAZKl0g5OeqSm?=
 =?us-ascii?Q?unVMrKZvdqjQCE88CSSSMr2M5sgqimA9240YqEEAdghfQZ1hFB4YfHMUV2ki?=
 =?us-ascii?Q?b2AdmLHR/PIEfZyb7OnI8hpFOBFNVTJuQNPXPU8GSYR3m/5HT96b+/US/E2Q?=
 =?us-ascii?Q?K8KYHssRtXLENkYlvRh+ZCM5jgYFYygj8dmzjxbhh4PtEM6+SBZkG8/wClUg?=
 =?us-ascii?Q?r2XVY/uhX41zAZgQbTI+exB7oUJaRIp4px/VoqGC9MxWcgBYKd+zBwk4HAva?=
 =?us-ascii?Q?7R+m2fDPu1rLxamWgicnhV0DPkpFhVClPDAp7cf3zw/aml5YP44Bt9QArAP1?=
 =?us-ascii?Q?H7Pf8pQLM16dnAaI+6Dwj58PL05/p8Ni01OlmwzKlOxY2tCiD0Hdtptv1IEJ?=
 =?us-ascii?Q?6voeR+VY33Yv26bpHQTlZa3VJpH3uz5HpD3m+0+KXjt/dQFXslE+J4LRQnjT?=
 =?us-ascii?Q?KPM+BS2PqfoEJCF9yVjUMtogS59Hp7p5+4/jH87mf0ePvv/hN7CCxDjNQ59g?=
 =?us-ascii?Q?76iE9CcTwIZt1D4PK9GWo+bqtCvY102wbjZiF5PKJXtRK95LqhFShv5ZC+31?=
 =?us-ascii?Q?Gg3RQvxNKj0PD1Aw9TUQEP4+sod8fEf7PiUIb1ThRGzz5+bj8Q+fmjEvRyTI?=
 =?us-ascii?Q?UHbbordw7tBSRMhGJ7bYrJvR3l7z1anqoXz0AehplLIJMRCoQSFtfmGVpkpM?=
 =?us-ascii?Q?qFORluCvk9kcTfo23+lX4dTYtheD64N8nmvnohyyHwcgqdBmeCsYsRBMGWze?=
 =?us-ascii?Q?gA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d7bd405-856d-4d47-35d0-08de0b558214
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 19:11:41.7528 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f4yGlRPGzgTFazjSvnJibjbt+7mpJnA/LgI8CBZ9FKgLaGHSb/73ge6NQ7IJS7lPwZYYS22JXv3+wx/Fx73XzDmOD1mP9cwyPJBtb3Rv8Yc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB9495
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

On Mon, Oct 13, 2025 at 08:24:55PM -0700, Lucas De Marchi wrote:
> From: Harish Chegondi <harish.chegondi@intel.com>
> 
> Starting with Xe3p, IP address in EU stall data is increases to 61 bits.

As far as I can see, the EU stall format isn't documented anywhere in
the bspec (which seems like a major oversight!) but the early
architecture document related to this change seems to indicate that a
full 64-bit IP was supposed to be written by hardware now

        "Bit filed[sic] 0-28 is now 0-63"

Your structure is only using 61 bits (which definitely makes sense if
the addresses are aligned since the lowest three bits would always be
0's); is there somewhere other than the bspec or architecture document
that we should be looking at to confirm this?

If you've been working directly with the hardware architects on this
feature, please poke them about documenting this clearly in the bspec
(with proper tagging by IP/platform) so that we can verify this is
handled correctly and also notice if/when the format changes again on
future platforms.


Matt

> 
> Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
> Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_eu_stall.c | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_eu_stall.c b/drivers/gpu/drm/xe/xe_eu_stall.c
> index f5cfdf29fde34..2bc6b593ff172 100644
> --- a/drivers/gpu/drm/xe/xe_eu_stall.c
> +++ b/drivers/gpu/drm/xe/xe_eu_stall.c
> @@ -124,6 +124,27 @@ struct xe_eu_stall_data_xe2 {
>  	__u64 unused[6];
>  } __packed;
>  
> +/*
> + * EU stall data format for Xe3p arch GPUs.
> + */
> +struct xe_eu_stall_data_xe3p {
> +	__u64 ip_addr:61;	  /* Bits 0  to 60  */
> +	__u64 tdr_count:8;	  /* Bits 61 to 68  */
> +	__u64 other_count:8;	  /* Bits 69 to 76  */
> +	__u64 control_count:8;	  /* Bits 77 to 84  */
> +	__u64 pipestall_count:8;  /* Bits 85 to 92  */
> +	__u64 send_count:8;	  /* Bits 93 to 100 */
> +	__u64 dist_acc_count:8;   /* Bits 101 to 108 */
> +	__u64 sbid_count:8;	  /* Bits 109 to 116 */
> +	__u64 sync_count:8;	  /* Bits 117 to 124 */
> +	__u64 inst_fetch_count:8; /* Bits 125 to 132 */
> +	__u64 active_count:8;	  /* Bits 133 to 140 */
> +	__u64 ex_id:3;		  /* Bits 141 to 143 */
> +	__u64 end_flag:1;	  /* Bit  144 */
> +	__u64 unused_bits:47;
> +	__u64 unused[5];
> +} __packed;
> +
>  const u64 eu_stall_sampling_rates[] = {251, 251 * 2, 251 * 3, 251 * 4, 251 * 5, 251 * 6, 251 * 7};
>  
>  /**
> @@ -169,6 +190,8 @@ size_t xe_eu_stall_data_record_size(struct xe_device *xe)
>  
>  	if (xe->info.platform == XE_PVC)
>  		record_size = sizeof(struct xe_eu_stall_data_pvc);
> +	else if (GRAPHICS_VER(xe) >= 35)
> +		record_size = sizeof(struct xe_eu_stall_data_xe3p);
>  	else if (GRAPHICS_VER(xe) >= 20)
>  		record_size = sizeof(struct xe_eu_stall_data_xe2);
>  
> 
> -- 
> 2.51.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
