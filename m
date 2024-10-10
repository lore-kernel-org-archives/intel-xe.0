Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82D20CFC5EB
	for <intel-xe@archiver.kernel.org>; Thu, 10 Oct 2024 18:28:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 331E810E9BB;
	Thu, 10 Oct 2024 18:28:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OPvC30wP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56DF310E9B6
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Oct 2024 18:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728584928; x=1760120928;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=aSWTO1CBNK89VzY5KBgNe3j52Z+AAZmyCgBcLNFAQG8=;
 b=OPvC30wPxwbMQy7jiAwsT8aOiA7sm6luWObtbwjQL3381L+8GeYEn6WD
 ur85ZapHCLu7sLCT4XMXmdpdtGXADlXseV+cEUkEW+KS8z8gb3rDMKx7o
 zgwA9l4GpbC+hj7Any1PSVv5MKhaLj4r7zTfP+Od9aLRgkrENPxkICNEJ
 IbnCeGTcLZDTtLs64RK7vOCI1pTG2NpDXm325f0cUlFh8PEZIzhjwgO/k
 zoxWFWaljoxnbWBoHUmdmoIamt+LPtMknZYK5tfTKajxutu0mDG5OZ6d9
 s7X4IHuCU/OKbCPzF42yCRqSrh13fT8cXcPTeFXhw5T0ryWT2QiPvvlli Q==;
X-CSE-ConnectionGUID: grNuMho/TfyHBZqfc9tTjw==
X-CSE-MsgGUID: kR8sfqlhTzuCzS95/7E/wQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11221"; a="28106182"
X-IronPort-AV: E=Sophos;i="6.11,193,1725346800"; d="scan'208";a="28106182"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2024 11:28:48 -0700
X-CSE-ConnectionGUID: vU5jLXLhRYaCF/ybnGXwmA==
X-CSE-MsgGUID: rxvqsomLTU2lwhDJ9TDxIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,193,1725346800"; d="scan'208";a="107396396"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Oct 2024 11:28:48 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 10 Oct 2024 11:28:47 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 10 Oct 2024 11:28:47 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 10 Oct 2024 11:28:47 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.46) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 10 Oct 2024 11:28:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lES+cvV1zBLrsrHJ4J/EMwgMHGqUkddg2NOQSzr2bPyRQb2ZzMCS7Z+uOAlwAvqpM+w0ZDHoWtEVDy7/WR1EKIu2+GkexiXoPoroYYvtWtj9hf5jYi8j+nTzaM8lJ4BrUte2nOOfi2HR+OsQLviGpdNAh2SkkW4O2pFDCrRcykKedb0uS4dQRVSXoOOaEvDH89n/dgKQ0FKTZ2E09G1kNOUUIZZ5hz9KJ7xO46m2p1bdnF+8WoImumeRKpVkV3R+cgyxy0Ef5jx5EQXBpdLT89mpyyzbGTZcx4XvXSbC/12KsAT3/WCZQuxUwfLYTGI3AvG4XBV2S4ys8mmnFTm9Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7bKmbWDipsRypssR6Hh8qCCffXNgCvUNLQdg8VL9RU0=;
 b=PNQO+OIhATLutb5RtZ7Or0XFVThybfBbE1TkSmvLSBXFg46DlxA7yb/4rA/ZuqXgUNuL/efQT7LgwQPU1p/lY7P8uvy63yOZoRwBhONn07++xvX0KYCIfMpGloRyYBhvdM8HoQ4bJhAvi0RNLNAImQEkjgD4G6aCgj8TjSsFjPQPNlB0z+FZpNwHiB2WrZqapFkUkmy6jafab9QNZSer3PiM53ahUG0B39eUA4oe4laeE4yBK9vk3/6uE/pHiZV99U08gHhmQdGJanMu11CswamAeh7S2zvF753kqQIbnoC57MCPkBsko1Vv2dUZV85N/+fkboDSyFWLkZwe/OYFMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SN7PR11MB7439.namprd11.prod.outlook.com (2603:10b6:806:343::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.26; Thu, 10 Oct
 2024 18:28:44 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8026.020; Thu, 10 Oct 2024
 18:28:44 +0000
Date: Thu, 10 Oct 2024 13:28:38 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Umesh Nerlige Ramappa
 <umesh.nerlige.ramappa@intel.com>, Szymon Morek <szymon.morek@intel.com>
Subject: Re: [PATCH 1/3] drm/xe/query: Increase timestamp width
Message-ID: <atdj7r65fwpafp5osauwrnyzmnlyor73yvmgvn36kvnvxzpame@7osi6yxt2qtt>
References: <20241010034847.389734-1-lucas.demarchi@intel.com>
 <kramaztywikxqhtzc5e3o27w7u4eannpkjocejdgvu5siatgea@6nb5lkrgur3u>
 <20241010171051.GX5725@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20241010171051.GX5725@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: MW4PR04CA0182.namprd04.prod.outlook.com
 (2603:10b6:303:86::7) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SN7PR11MB7439:EE_
X-MS-Office365-Filtering-Correlation-Id: 97c39e38-3161-47e0-25ef-08dce9595f8f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?aMrhH7nS4y/iEzIsmEJuZ0LK7vQs+rxq0KitoDAWdcj5o044iVK7zYHsWea2?=
 =?us-ascii?Q?F5CULnWk+1u8pmE9VQ00Wkj8oX/uydpuDWcE25VJQKB3g8Dkvs7KwvHhLnSB?=
 =?us-ascii?Q?IVL4Eoz7nDHfp1WRF12VJQkhOmoTx1yHHBD4+v7LI+kAVTi6jBBIoDcxu76d?=
 =?us-ascii?Q?cvpX+bW7jCVzp2pYNBpeKPxEEMG/erp7XvIzxGq8ttI0QwcRhBeApjepdELe?=
 =?us-ascii?Q?5s69bOzM3lhdar868N6G4hQQ4OPlglfUTEpsLv+aYUMzaRGVWMeRWJfmZWq9?=
 =?us-ascii?Q?7PfvnVtK2Sh5uVJUu7YST3UbD8wKhhJB1XBGFdNQ6s2o6pRmFR42EuFuq/1C?=
 =?us-ascii?Q?/BUaeTY0deR4Y/jcNf1dKa67xqQh2zQu+USAVQ2c2Pxq8/0iFghdoWxTLKmN?=
 =?us-ascii?Q?2ipCsxx0s0VZLv/I4x9gihg7MFXMIFjSQ18k+EzA5VPaMD44btYyFwXVwUp9?=
 =?us-ascii?Q?gYAkGH7Wdn1c3EkvjFvregfm9DOSbIROfXYLY+ZT6IJJZPewA3GeV2viPjTG?=
 =?us-ascii?Q?J22U10sjPqddh3zstWBlsXd59lBaMUu/Hb7J6TtH0DLBudZfngfbKxd6Bz1S?=
 =?us-ascii?Q?FdZrUSXdb+zzIpP1AUMOoC8zdzzWbPWSttRhUcgWltHVyjbabQ/sIXAn6YOX?=
 =?us-ascii?Q?uw0gMzvPTGEoRSi0AWldb60juTdAS1kzK+6Y7aPQ7t4rFnShlMgDbTloAe85?=
 =?us-ascii?Q?uIaQn6F0I4jj8iyOtL2A3MR/x1E1KBeoIJEj8uk5GyqQv8Gwc6xlE2cwFU7d?=
 =?us-ascii?Q?7b3xQvp5qn3jrKk7eS4kPJX16wiwTfCrO6US7Z/nhegVaCf6N291gNHZhwAb?=
 =?us-ascii?Q?BwdwvKbBSEyCRcz+Wt1OAZyPf0/xxp3fCI2qt6zcNxWLadkhtKHnTY42GDlH?=
 =?us-ascii?Q?JEfwlzVMJMgw4Ryv08t1Eo0JsfJva1e0Nuo41a1Cy8P3JNqpnIj8pPyfZVU2?=
 =?us-ascii?Q?p7GrKtoXftnVnXnVwFtEeVEZjClHEbSQGPS4ot1nLMOBJqe1VN8tDwGx/xcT?=
 =?us-ascii?Q?CW7gd+c+15sadzZe0Gnt4tyUp9IhHWmt4XJwPtuC15JWGiHG0kPI0x5K5C2Z?=
 =?us-ascii?Q?4fOUfCrlvuLtOlXo9PMjNRsjP5ECxg/WSZrCQtzv0rqIfw3xK47Ns/SzKP6p?=
 =?us-ascii?Q?5hK5g06j9RHlRsf7jeZp7s7iRrC0KYmSXfr3SSwbgUSvvqZiDCSGbqRP+tNN?=
 =?us-ascii?Q?PqXHL6WHrRl+CrT+qlOpI5R+2tr9yanrgSSz922ixLzjTK6Rc12rFov+ygBQ?=
 =?us-ascii?Q?Rgv11CPOglypb8/41k548CCiFW/Tbc4VUEDEdSQAMQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Nm4SD7Lbj9eOrMTfAGiKFLwELN+olBfS7/Fi7uEWrIK2plIdpklLoyUS5oMd?=
 =?us-ascii?Q?hLgRqd4hE2BdBHSzSupTQtC0ecSUGnGN7WJ5aL0/yIc6mvWmvVcZupQGgDzC?=
 =?us-ascii?Q?GhGOxb2qnIhFtmV+4COCYGS3qAX3cy1lrzufvc3gmCce1WnZ/dBbDQzHgMlm?=
 =?us-ascii?Q?uaXJZS5L9GoOpYKk7F5R7F0Xy1Y3YZNazzHbJ52geCjI9iOBShANxDVJg79E?=
 =?us-ascii?Q?bpIoWZ+VJzda/JiSuhh4x8OMsnaeyjL1E4Es6VkwAQ3zfhxPx5JCtHXYk+CJ?=
 =?us-ascii?Q?2yXvxxd53NBL8/nTWLMKYaIbilvSM9vuuZtZOJHPPwa3wiwGX5KFs3QPtt9C?=
 =?us-ascii?Q?H6Oc4YAGxJFcmWnNtuH1xRpLi8PKkUauLKIIbXVTPtfuHpuX8NsHh4aAWYO9?=
 =?us-ascii?Q?otgSVHhQAG8gCP9YC6qNKIoWO+Y1rk+yrMmUq0fFy+Q22kCaZhwtXi1D+1ZS?=
 =?us-ascii?Q?CukZLQW0UTxdEDnGnw+FHOShWHQTwFtssIluYnJLA2xqwDUacXd2egVKH1z+?=
 =?us-ascii?Q?e822E1WqN5YYzcvk63WPwl4zAhf4YtssyNyWce0DWlPAURSu7B4wlbQEuoaY?=
 =?us-ascii?Q?qpM+UPi3ov9sMVrXLOOeBJrGOKtBWeSpDijQ1/ksUaHLgr8wrdQ+/XZ9ja2B?=
 =?us-ascii?Q?aJAC94TibPgDOfKnl2FV1sS8NqD+kbvKbTiaF7BcIVdPrDA1tL3Vwwr5Ri+I?=
 =?us-ascii?Q?oaR5HaxHeXc1scmPiDaySFcTWrlm81EppzUCQX7/HXLsLeHA7HVgRfEF8ZrP?=
 =?us-ascii?Q?7FWsvlIBDCOMNtkRGIxEt6ijDnaYCWxkwTuX4N7yiAvyrsCvXzIxI68toVYr?=
 =?us-ascii?Q?mgnWvvg8EP0Zad8BSAWv4ioba3quP6IjcENJQgiZ5R9c1dd3K397pNiuP7wN?=
 =?us-ascii?Q?deluc3IYjebF2WsaMW99erG9p5aqFvtNssX3TUsCMNDc+ID+Tc7111fog8u3?=
 =?us-ascii?Q?zNi64cX1q19jXRBAbnDsq9sYy7oduWu34WaYvIQzEGYDHCl8Z/WgiStT3kJn?=
 =?us-ascii?Q?cmMo5eG7yopQL9KIc5Op8YhoDuWWAXzq6M9i92Do8BFfP4QJV/vJTuar/get?=
 =?us-ascii?Q?F2S7Orp0jpJBIkt5Q69p7kwneRoIZio6aPoCSYt4noJYYBzk/PnMi5aord7t?=
 =?us-ascii?Q?fHFgHys2YJ4MwqhKumVgnyTbqv5+0C2IfYep7flyD/hoAiELcn6JrDozCtta?=
 =?us-ascii?Q?Pqe7TaUNFfpqJiLJUQa8QPT9EYlWK0lNUiHwzGGMgESivehy5gVFo+fICDGW?=
 =?us-ascii?Q?Gbn6fgvd5AKg1FJvQXKgxDHvs9iTtK9tYFa5CP46Z7Ib+wQyboqh9CfIJhy1?=
 =?us-ascii?Q?Ig0gq2J0Zf0jlSV1ltV2Vk/im/C55S3VOhZrk+4I9L8LEWzTxGxcrULFJqBA?=
 =?us-ascii?Q?kG3vVlDufjqGfY85fKRT4GwohRsfZYZrHg72AKt6ko2cZkr3jDzpk8RfAeM8?=
 =?us-ascii?Q?Mk1yB/1l3UoZwOalUsUzLySs+OPnD5+p6Lb3P5B/9F+teBF9hjw9dMJ4GpCg?=
 =?us-ascii?Q?AEFG6ivuLUgOnbaCvyhIHIgU5upaHNL1tqjnzR4dP0xTpsewrl7mGlRM1F9T?=
 =?us-ascii?Q?eSvmhOioLtcFINwbsttff4TXzex8tUpqpF8VTOLyHPdqAv0l9MTbAWlaPTAh?=
 =?us-ascii?Q?2Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 97c39e38-3161-47e0-25ef-08dce9595f8f
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2024 18:28:44.6130 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hLrzqYwaBhiP+1+A9XsVDgyr6Oooti0BXOjzZPJ9JD/oa2NrmFtOV5UfZYxq45kC3t/zP2NL56z2526LB0OoZMdmqOfw/Q5b7e8+vTr0ZA4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7439
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

On Thu, Oct 10, 2024 at 10:10:51AM -0700, Matt Roper wrote:
>On Wed, Oct 09, 2024 at 11:08:12PM -0500, Lucas De Marchi wrote:
>> On Wed, Oct 09, 2024 at 08:48:45PM -0700, Lucas De Marchi wrote:
>> > Starting with Xe2 the timestamp is a full 64 bit counter, contrary to
>> > the 36 bit that was available before. Although 36 should be sufficient
>> > for any reasonable delta calculation (for Xe2, of about 30min), it's
>> > surprising to userspace to get sommething truncated. Also if the
>> > timestamp being compared to is coming from the GPU and the application
>> > is not careful enough to apply the width there, a delta calculation
>> > would be wrong.
>> >
>> > Extend it to full 64-bits for non-media engines starting with Xe2.
>> >
>> > Bspec: 60411
>> > Cc: Szymon Morek <szymon.morek@intel.com>
>> > Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> > ---
>> > drivers/gpu/drm/xe/xe_query.c | 6 +++++-
>> > 1 file changed, 5 insertions(+), 1 deletion(-)
>> >
>> > diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
>> > index 158629971eab3..a1f4cc25bea68 100644
>> > --- a/drivers/gpu/drm/xe/xe_query.c
>> > +++ b/drivers/gpu/drm/xe/xe_query.c
>> > @@ -164,7 +164,11 @@ query_engine_cycles(struct xe_device *xe,
>> > 			  cpu_clock);
>> >
>> > 	xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>> > -	resp.width = 36;
>> > +
>> > +	if (!xe_gt_is_media_type(gt) && GRAPHICS_VER(xe) >= 20)
>>
>> I sent this to follow the spec to the letter, but I'm thinking the spec
>> is not tagged correctly here.... the counter is the same, replicated to
>> all engines. It doesn't make sense to be different in the media gt.
>
>Yeah, when REMOVEDBY() tags are used against a top-level IP family
>(top-level Xe2 in this case) rather than a specific release, the bspec
>output often gets confused and leaves behind some stray markings like
>"XE2_M" that aren't actually true.  I don't think those marks are
>actually used so they don't have the proper IP inheritance rules
>defined, which is why they still show up where they shouldn't.
>
>tldr:  I think the 64-bit width here should apply to both the primary
>and media GT from Xe2 onward.

thanks for confirming.  Another thing, should we mask the value to the
width or just rely on reserved fields returning 0?

one problem with relying on them to be 0 is that we could end up returning
more bits read from the HW than we report in the width. Example from LNL
without this patch:

(xe_query:5738) DEBUG: [1] cpu_ts before 4549113780840, reg read time 2694
(xe_query:5738) DEBUG: [1] engine_ts 87847861517, freq 19200000 Hz, width 36
(xe_query:5738) DEBUG: [2] cpu_ts before 4549113801981, reg read time 2615
(xe_query:5738) DEBUG: [2] engine_ts 87847861922, freq 19200000 Hz, width 36
(xe_query:5738) DEBUG: delta_cpu[21141], delta_cs[21093]
(xe_query:5738) DEBUG: delta_delta 48

That is not a problem anymore after this patch since we went straight
from 36 to 64 and all the previous platforms do return 0 on those bits.
So maybe just leave this alone. Agreed?

thanks
Lucas De Marchi
