Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37808E9A02C
	for <intel-xe@archiver.kernel.org>; Wed, 18 Feb 2026 00:22:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEFC910E54B;
	Wed, 18 Feb 2026 00:22:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iZOxVHaL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 122ED10E54B
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Feb 2026 00:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771374150; x=1802910150;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=GE51wP09IvF+VDaheEbqULtYDIpioILwFg855jyolsQ=;
 b=iZOxVHaLWvVZOXyRDM1416rhSPLwzQ276MJwcBFCQSlew53OLHGxpc7Z
 Iwan79uDg17Y5ubBoqnqRH7NApzH3DUFVg8sKUeFkcrh4h1OFzpbnqnhq
 NVleSPT7YSFVmGrQgbhSI5cme8uS32VzpzDKFsMD1NnNglNosWrayZ9Y6
 fQrDQrMre1ydwgoeOu000alkh3rgI7qRjlWkmzc1CjoBV3GEkgU9XrNTL
 ICmg5KZcIjV32Sk6mpyBVbd8imvZkRlR8AILQD8hzZhUSMzoyFdQ04BEk
 JrS1AilI4PKubMKRAoJTiEu3RZcgdStespenDCc5d0kSAFlD8I0rCXgtb Q==;
X-CSE-ConnectionGUID: iRQjWCNSTk+CEI/Jp/EQMg==
X-CSE-MsgGUID: IpSHcel5TJCmwguZjEDSbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11704"; a="72500027"
X-IronPort-AV: E=Sophos;i="6.21,297,1763452800"; d="scan'208";a="72500027"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2026 16:22:29 -0800
X-CSE-ConnectionGUID: Hs0TgwilSCyY0KBJIw2FTw==
X-CSE-MsgGUID: ksFxkG5mR3+QE6yCwwEZ5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,297,1763452800"; d="scan'208";a="213892771"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2026 16:22:29 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 17 Feb 2026 16:22:28 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 17 Feb 2026 16:22:28 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.19) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 17 Feb 2026 16:22:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CNLvtfWjZ5gCu3wf3q4lvDNvt6mpnLJIu8+qUXN5pWuX1IeDvM+f0zh3Z515lDy6JMUCHbUFNJzPRCujUA4azcbOSaAhQtbgGI/9TJtv20j4NmMsQG2pLk0xbKu2HaVH7HK+vDkzVXQnf0o1Fb1AlfBcf0wK90Izz0lOP2gHawVmsFAtereQUjgil2sUS2EdtjQK2ODXWLCBsSNySD/+zzkjPCcYpSeYJvxwxwNU0G+TskbmG65D9N4GLx4VyVMVp4LP6gMIqfZhPlxEmhdV5CX5rLsmV/q7VI6cl5zTHPHHJqkj/QXYGxeUtFD4fqfy7GbZces9MxANam5D8l9iPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0E7JluBgwYFwQeAX0bUgvrrmJeuEhFqbgG7Q61FksJ4=;
 b=P3ochNnCrb61gnIlrD72UqWjh6Ci/l0HXAz6GInY2+TXO7VtTaMB51DWyH6wnu3adFRmXnkegcCbk6T+jcWZrh1T2ZmogmntEUY15Kv5GyNGv1+AfBtfpaTLc6wzn1JyGeQmjRysaeWD7kbfg6XreXu51u6Mqm3JRZip68Xx/DkOlgJKOQh9U12MUdw/He7JMT4nAYQZ5i736BZOcJG0j/rxHnLkxHmJXxzxu1aq+k+jW/bA4hHETCsajwi8bt9VTn9qbwUSVKgU1+B8uszmYX/aF6V2+bEHpze6S549R3eQ0YpMXeirrnrA3GATObEeTeT+U2d4SFELezArbtO2Ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by IA3PR11MB9375.namprd11.prod.outlook.com (2603:10b6:208:575::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Wed, 18 Feb
 2026 00:22:20 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d%5]) with mapi id 15.20.9611.013; Wed, 18 Feb 2026
 00:22:20 +0000
Date: Tue, 17 Feb 2026 19:22:16 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: Karthik Poosa <karthik.poosa@intel.com>, <intel-xe@lists.freedesktop.org>, 
 <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>
Subject: Re: [PATCH] drm/xe/hwmon: Prevent unintended VRAM channel creation
Message-ID: <aZUGOMoImgbW5W_w@intel.com>
References: <20260206081655.2115439-1-karthik.poosa@intel.com>
 <aYxlMOmslu34lfqD@black.igk.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aYxlMOmslu34lfqD@black.igk.intel.com>
X-ClientProxiedBy: SJ0PR05CA0181.namprd05.prod.outlook.com
 (2603:10b6:a03:330::6) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|IA3PR11MB9375:EE_
X-MS-Office365-Filtering-Correlation-Id: 03d91464-3e1d-4c8c-d74f-08de6e83c77d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/wEZIlG+eJDteeVMnyr14KGxNRmNo9z7e7MiyK5Es9vum7ID89+q+7Wp3KL+?=
 =?us-ascii?Q?i/su5m0ePFa/1mfUT1YiF9pn7Od8NCbc/qw5QGameWtO4kin1Af9CKyoJzYA?=
 =?us-ascii?Q?5clsFNSGgrCwPuT6YX458kdlcNvgCRUbd9/pJ3VJyLx5bQ6Ntcv+btCTAJiL?=
 =?us-ascii?Q?ZgnEJDJ7nwddTOmfIb1oYkZVyKgjDnh9PINrQRk0pInBUhGugos1ikt4x4GW?=
 =?us-ascii?Q?ugh4Mqlk5+kNjORvuVE566l/3aCxrI3gfntClprQZVyxb9Tl+zsbr4b2TaZY?=
 =?us-ascii?Q?BqM8Xn1cA8M7wtjELmO1XfnN4peA5gabHy3+WLZECtceu0L/g5StlJMhUvNX?=
 =?us-ascii?Q?KvxObQgKkyLbFT6/A/nCi02J/P+kotQRnvNu+tMQxrGdfx2DaiY/5Ru0azlR?=
 =?us-ascii?Q?gMQ1wohv7BvnGdgZiSBf9nuJrBG43o5lQDqT6OhxHdbQqXJ2M/ZqJRVGeaJu?=
 =?us-ascii?Q?0eg/XxzDeEdMjgJFBp/J3ZLflf5z7IfOdclbVT4S3RYClRIaATsapwCTkElA?=
 =?us-ascii?Q?kzE1e5FWApQyYnOy6kYDX1LYppyTSgi2piJjPXehBqEMVxNTmDOv2kuzxx/N?=
 =?us-ascii?Q?weICoowLetdZGggSIU1PS/YPbOAkbLnC/vSqg4ftGZliFzDxWSHYxaYetCAv?=
 =?us-ascii?Q?N3u9B1u0AqJbcp6xCrSYF5Fp5LMJ9RBhEJx5jZ+q9evqvMOyHI/K/2wuoPAJ?=
 =?us-ascii?Q?C3XbGexuxtWTgDUadmuIpwpqkPZAcSqHtBjRc58Xi4KNP9TonNG00/Fg7+es?=
 =?us-ascii?Q?UHe040kDJ0yy6mnvDBKKGq6k/6Cxo8j87NYYCIydK1Y8zu1SrAQBcMqRdGJ5?=
 =?us-ascii?Q?L26jGl4C+vFbK2hdzdecSTaXvctFNlYihhI/bcBc38RlD2ZKSBUxanIvfDL9?=
 =?us-ascii?Q?QpoVwzoi1+TW4cE+U6zejL+npHltBQr9emrUaZl/8LVRxJBG4b5Ow+8OpRtE?=
 =?us-ascii?Q?w5q6RYLWkeNjeFh5qnQnBVzQPqm+KPzG9xXm9KDCasi7MGs2T0LvDPU9NZ2h?=
 =?us-ascii?Q?otk8yupU6NO1C/k+ltS8ar56emN5fDcscI1Zv3T4FGdftIvG9EBkSFDoxhqg?=
 =?us-ascii?Q?zDdXKTeLg6PsVu11T/xy9qzimrOwALTakuLGr5jAvw+G1NNpdoHsGv7fBof5?=
 =?us-ascii?Q?QVTNPp1TsyjEFkpYRHxJXRSp/MCve7lHttorLw3tJuoyr+7jqdmTUHRRC5WU?=
 =?us-ascii?Q?S7LWwWyptN3W0EawIb5umR9vIzZIDEzJ5VLsRhc3imYB9aipOU2p9y6dodKM?=
 =?us-ascii?Q?uwfNHgR954QPxZ2NM9bnK8DsWB8zI2iktY4Fl4p7TB7pYw0h0c15p2vifHsj?=
 =?us-ascii?Q?IfuZcmfhmPUEB4G9VTUqZ3yh2UVqb3ooyp1KUCygAVJFIsbK8TyMOusnyJT/?=
 =?us-ascii?Q?2W8MZQimC4rVEuM3bu4HoNuLZDpCHNSv4L2ytQ0jdbXp/6yY4nTz4pUdMCyB?=
 =?us-ascii?Q?VG2FGCd81C63d3hDOilj2faRVaJSE6kINROntEyWqHDRrvilXflFL3kArSQe?=
 =?us-ascii?Q?o0conw6T72eJHi/NCH/3nvgPvbZEMBYhakkKrck6+kcOovJvJ9raxBGbp+CR?=
 =?us-ascii?Q?N4WZVFKSSmJNU7Kb/8o=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wQEqe3T7nyms9eyvYpEVBlQH7j/lnDspwo8J6xSDLwqaubSmTStHJMroAJG/?=
 =?us-ascii?Q?9Dg66NW93Jn+lcBYKei2Y2acTh1jLktbriq3di+8r4uGJ1EWwJX4nRXv6q1H?=
 =?us-ascii?Q?r51XIh0ryb9zqwVjJZzATGDnEA2Ok8FXx5phjjKw4iVnlx67r74e02vnpZuP?=
 =?us-ascii?Q?9xUCNTCOo+d6IgAgVwSzXp2b+SlDYRG2t/b6z9Q5a6o3X6ge8Sj3f36JxD9J?=
 =?us-ascii?Q?U6ucq1+qBBGG6R4ms1MUqNQHBptkmKv8m/atTHMQpEGsTCJHqUWZ2kit3ukz?=
 =?us-ascii?Q?X/M1Pe3nA5K1I4hxKFYCCMUDX4q5Ud4z0HjiE0f7kKTncOjEV6s1oPiNT4Kv?=
 =?us-ascii?Q?1KuJLFRttP/dcFnbD36qcTmmPoEDVSHeqc76ki312hyj5+gCDdae3ZzP8aHM?=
 =?us-ascii?Q?3ZHi+gn5PbD7UJtx1i9xf37DB9E394ovQyW6YDzojOgem/upISw4wXGwEPSH?=
 =?us-ascii?Q?ghWKd5jC0TsuaIdt5UWvWtkG645N0xegOSzlg7/CnXiBWgxu4/b8v2WywYxc?=
 =?us-ascii?Q?FhxP87iaAwYuuSl7c49A/AkBd7kCGh1xPOcErsJ/fM6It1TS/BOlXEM6juvt?=
 =?us-ascii?Q?AUUrxbnKLsPaIQvKkbX2ESLdPTkbTl8WCZi1nN95y2PK794gnDxzxgV16SKQ?=
 =?us-ascii?Q?fYC8py708Hh9C9rKbV+EJx5ojd0TtiaU2RF1W3wYKHrwKmKEnFbjv/222Yjg?=
 =?us-ascii?Q?09eiF6REr1oV1Yz4fqQ84rtGpdUDFx/9ItHIpfzD9EG9Tyi8ZhkRwmiAqfDj?=
 =?us-ascii?Q?pH9tf8CZ+BS72D5fakqihYaDcSrnRDkahPL+HSvWn1mqJ9gEV37wuERSmdjB?=
 =?us-ascii?Q?yhdZ6t56G7cAhabV0KgP0ZrqwQBL5vqnnGfzfiFeMmcVD/jNxk/Aw4h2h0qX?=
 =?us-ascii?Q?sar5N+WXKLTgbWf/FDRWp5tjyBGnkKwBa5JnzSjnoLi9G6kmF+f6dpFV9/M+?=
 =?us-ascii?Q?MaTJmWhGOhveQmmXsf7cM2jnkKDgktcshBL1mqikU2Gz7jW9JYTnGuvElG76?=
 =?us-ascii?Q?fWRqRH11PTVaFzPX4CQxqGgKpBLfrlRwKHNMmNt3AynzAtf2kd5G3x+QMXFy?=
 =?us-ascii?Q?FQxSIsDzmDsRYZ7Y6Im7xtyC4V0v7nlnSeg+oICt/STDpltoRt28EO0mL2QK?=
 =?us-ascii?Q?K12OhyE+HURo/Exj0wg1OSyji0nhLnOe8niDSXUpvbYVe8W6JdbqAZqzOle0?=
 =?us-ascii?Q?sp9KWva04nrpBJPge+qOS+f05QhD+5Nn4MLqQWBgkOi0rDVURW/ahYPVr9H7?=
 =?us-ascii?Q?D8vA02Osfk05ElRPSoHROEATybxSbou+UNElHgyW9vAxFyM1uKYj3CDHFq/c?=
 =?us-ascii?Q?Jxu0jGfyX8v2P0GTC8T936gwTv07fIEDrK9subXQeXOUdUgD4ifW/79XPApg?=
 =?us-ascii?Q?7DWnaWyvOp1nac7FXhxAbhUHRkQsEoqY4urDB86DI5vr0zxix+rzikHuWPk8?=
 =?us-ascii?Q?pSlIZ3+1brRII7yhen35tx+/+BkYL59A/e3T0I5Z+cq7IoCc/QTElOTg3dzn?=
 =?us-ascii?Q?uqZk5PGzyyf48QhvkPx5AnIARGVamp1mLwhVtlveuzVYIzAg2/RTLXl5589N?=
 =?us-ascii?Q?c0VtqiZ4aEIsnJjH7yefsw1BYlQzNUGNbg9M5RmayDE1T0bdFYNz6j1UrOWR?=
 =?us-ascii?Q?Fl3iVJ86/qTkfoEHyXPQBGujWcMskWfnRa4TmD7Trdk53al2oD/JAtcOZfmO?=
 =?us-ascii?Q?gnLeTBynkU5ksK/OjzsXT+Ia+0i3mCLTzw6Y2EW25woaL7JwDee0LrBIOokC?=
 =?us-ascii?Q?BoSmZRlThQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 03d91464-3e1d-4c8c-d74f-08de6e83c77d
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 00:22:20.2474 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IAIIfjjKujAgQFhfsZE8YCMQMhs1NZMrKbaDqj3F5hDhm+qnYazYR8nZ77dweXatVe5qUL6JWEKE2ndjaPvVjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9375
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

On Wed, Feb 11, 2026 at 12:17:04PM +0100, Raag Jadav wrote:
> On Fri, Feb 06, 2026 at 01:46:55PM +0530, Karthik Poosa wrote:
> > Remove the unnecessary VRAM channel entry introduced in xe_hwmon_channel.
> > Without this, adding any new hwmon channel causes extra VRAM channel
> > to appear. This remained unnoticed earlier because VRAM was the
> > final xe hwmon channel.
> > 
> > v2: Use MAX_VRAM_CHANNELS with in_range() instead of
> >     CHANNEL_VRAM_N_MAX. (Raag)
> > 
> > Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> > Fixes: 49a498338417 ("drm/xe/hwmon: Expose individual VRAM channel temperature")
> 
> Fixes tag usually goes first, but perhaps it can be re-ordered while
> applying. In any case,

done and pushed, thank you both

> 
> Reviewed-by: Raag Jadav <raag.jadav@intel.com>
> 
> > ---
> >  drivers/gpu/drm/xe/xe_hwmon.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> > index baf277955b33..0fd4d4f1014a 100644
> > --- a/drivers/gpu/drm/xe/xe_hwmon.c
> > +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> > @@ -48,7 +48,7 @@ enum xe_hwmon_channel {
> >  	CHANNEL_MCTRL,
> >  	CHANNEL_PCIE,
> >  	CHANNEL_VRAM_N,
> > -	CHANNEL_VRAM_N_MAX = CHANNEL_VRAM_N + MAX_VRAM_CHANNELS,
> > +	CHANNEL_VRAM_N_MAX = CHANNEL_VRAM_N + MAX_VRAM_CHANNELS - 1,
> >  	CHANNEL_MAX,
> >  };
> >  
> > @@ -264,7 +264,7 @@ static struct xe_reg xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg
> >  				return BMG_PACKAGE_TEMPERATURE;
> >  			else if (channel == CHANNEL_VRAM)
> >  				return BMG_VRAM_TEMPERATURE;
> > -			else if (in_range(channel, CHANNEL_VRAM_N, CHANNEL_VRAM_N_MAX))
> > +			else if (in_range(channel, CHANNEL_VRAM_N, MAX_VRAM_CHANNELS))
> >  				return BMG_VRAM_TEMPERATURE_N(channel - CHANNEL_VRAM_N);
> >  		} else if (xe->info.platform == XE_DG2) {
> >  			if (channel == CHANNEL_PKG)
> > @@ -1427,7 +1427,7 @@ static int xe_hwmon_read_label(struct device *dev,
> >  			*str = "mctrl";
> >  		else if (channel == CHANNEL_PCIE)
> >  			*str = "pcie";
> > -		else if (in_range(channel, CHANNEL_VRAM_N, CHANNEL_VRAM_N_MAX))
> > +		else if (in_range(channel, CHANNEL_VRAM_N, MAX_VRAM_CHANNELS))
> >  			*str = hwmon->temp.vram_label[channel - CHANNEL_VRAM_N];
> >  		return 0;
> >  	case hwmon_power:
> > -- 
> > 2.25.1
> > 
