Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0E15C19F32
	for <intel-xe@archiver.kernel.org>; Fri,  7 Mar 2025 20:37:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B4ED10E192;
	Fri,  7 Mar 2025 20:37:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Uo/m7TcE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C50910EC36
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Mar 2025 20:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741379825; x=1772915825;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=68G7xjs4qakFjww/admdp+BXzqhe99FBptrqifENmxQ=;
 b=Uo/m7TcEBvXkGMEKUpHC8afDachZvy8kAfhFruLCNnbcS5ZW5WBS9vAE
 PrtnqugD1wqkyBDi/l09MRoqR/NqJYBogPe4U20nLnvHsIG8aqvHRwALH
 6ZWs7C8EQKCGh4HSqulSK/P9emIlveEPKE50DnhflYLdq8za4IGB5bRxd
 VSMDE1l7wrjuwWb3AoGDY68H/4pnkiJMffmDzPuzzFgOjXaKZw1RzgIAK
 3BUuwuNx8gnZdRs8SW5a6hou5MP0PhI0yK1PhK9Yekj59NHLT4VJP2TCR
 ZYsSNfv8xy+z+uYwibFhbmn7yjRPRwBtae+nuZ3zvVE0SqIPv3YmB2PMu A==;
X-CSE-ConnectionGUID: x4NtCdirRRq4Y6sDvWn+cg==
X-CSE-MsgGUID: i5NylYV4TYqWYNwNwPveKA==
X-IronPort-AV: E=McAfee;i="6700,10204,11366"; a="59844795"
X-IronPort-AV: E=Sophos;i="6.14,230,1736841600"; d="scan'208";a="59844795"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2025 12:37:04 -0800
X-CSE-ConnectionGUID: ZDuKxipkTxC2WIGGn5ekKg==
X-CSE-MsgGUID: /AXcrqZNTkCWtmp46DYseA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,230,1736841600"; d="scan'208";a="124506181"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2025 12:37:03 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Fri, 7 Mar 2025 12:37:02 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 7 Mar 2025 12:37:02 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 7 Mar 2025 12:37:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KE5JzkJQ7W3NT7ObH5UUjJZaEDz4MiykS4DLByBynhWL8NDvjbYRfvB9hwR6empOcPY+//7S61zxjCqCPftsiEjhhJMQXkgKGynb5cPPRvOusHJbjxHjbn28grI/xLeoxdv7Vow7O+VvpPjCM7Qbb0OGHJd7nyY8c+d7v/hvWvdYD0StMO1QPbYJbkhp486yasRxo+8jUbzcVgqMTQaEYIQs+7Nr0gw2rBSBkZFZBg+U4Ay9EuzwJKrAmroQt+jMXiJCURjfGe/CRIKDYCMGfk+GXIXsLTY730EtViiilVdlRflVTHTgh+mTSZYwQNgxT5feZuhBKcR0BX5jc8pJKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zSG1jllyPREPIWGTMSzkUlSqPxfPRKHl5I3Du74MmXI=;
 b=dynuDvzbxPSfVmryaIAO3tF1AA7bMmBIFB111rCgtyYskKjolOHNUcnEFvX9AblStWPKFAmJDrkk4r4+D0s86Cx+Fri0vOg6Qeo+UbmfSMy7M2Br+56kRX4Iob85VDx3CTv0IV9hvZ0oTIiFEdguccfPmeamYtoq15zBGgr66BhHCHHyLYyzhzVM+MRJJR2IwzHrI9VdwOpqXqgRf6N/3531b8S01wfzT7vCv1lQTIOlH2t0UOKTDfAIAiu2cC+scydQ8mSwxSP8dPZ+ITig/Rl2GYjD1Ive7dbKjuXu9Cys/DHvqMR/Zp6T2a+MXnVrZlwFfCWQArEN1w0Yeu4TSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by CY5PR11MB6235.namprd11.prod.outlook.com (2603:10b6:930:24::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.19; Fri, 7 Mar
 2025 20:36:59 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%4]) with mapi id 15.20.8511.020; Fri, 7 Mar 2025
 20:36:59 +0000
Date: Fri, 7 Mar 2025 15:36:55 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: <lucas.demarchi@intel.com>, <matthew.d.roper@intel.com>,
 <andi.shyti@linux.intel.com>, <intel-xe@lists.freedesktop.org>,
 <anshuman.gupta@intel.com>, <riana.tauro@intel.com>,
 <badal.nilawar@intel.com>, <karthik.poosa@intel.com>,
 <aravind.iddamsetty@linux.intel.com>
Subject: Re: [PATCH v2] drm/xe/hwmon: expose fan speed
Message-ID: <Z8tY5wVKF1wZcwVn@intel.com>
References: <20250307125112.575242-1-raag.jadav@intel.com>
 <Z8sDoWxu0dUEpAQ-@intel.com> <Z8szvNhAaAsN0IjJ@black.fi.intel.com>
 <Z8s18CcpHN5O6Ysr@black.fi.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Z8s18CcpHN5O6Ysr@black.fi.intel.com>
X-ClientProxiedBy: MW4PR03CA0038.namprd03.prod.outlook.com
 (2603:10b6:303:8e::13) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|CY5PR11MB6235:EE_
X-MS-Office365-Filtering-Correlation-Id: ae18b2c4-88cb-437f-50ec-08dd5db7cf52
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?K0TTMtITZpwJtOKVIK5ym27mwTetVdnj9sbG5/5Mz0wNQD55vwDXcF/n7VXM?=
 =?us-ascii?Q?uDQQGwWPYSalsKUvyHLwkPwgPoHOzfn8kRPu65CMidVv7glsOq6HzNb9/6SG?=
 =?us-ascii?Q?KTV8d5XvcBHcOZC8KWi7PyA9k0iSsNd0YNNh+9djSoTX7OGyJ7YcQHb6jQKg?=
 =?us-ascii?Q?SZX6YEfuWt4vIOZ7DaSPwwp0+ZMgfG764IZUs/LZeT/muGoX4T5JD7AQ99v+?=
 =?us-ascii?Q?sa6wP0BgqDS4w9y5EEg1NlblNtWp8xCWiHgBUNmZHm2wxJlWFV2UO7S3+szw?=
 =?us-ascii?Q?5OFrUhdhv8WZiOi8dgPIB5iN71o92LlBGS2jVTtPXaQpvYe7RPjaT96CuA2r?=
 =?us-ascii?Q?/o0+YMhVCfpmLzCYShGu6cWMppkuLezYSB8TVUJQI2OfRdyKb5pSPB0ws8tb?=
 =?us-ascii?Q?L9uuQzvpdNZC89Vh8ejOkQ5O0deOPyn57sHlerrpZ8AjnaZfqcpjXnbpdwkc?=
 =?us-ascii?Q?w/hQ8vfp5UxQbF5Js6gdg0ij/TbLMe5G2eLm4ZMq9L9TIogqjY1RjNgGz/cw?=
 =?us-ascii?Q?PmXxtGvBs0d6HVGSGE0M5HwMr7tXsahxwxcKT4A2Y59VTjeDlktMHDGgfdG3?=
 =?us-ascii?Q?q763qY86Z3bFR09HaGjGWABxIt05Dgalt1g53GJ3tO5VbRFH6Z/tYErVOkZs?=
 =?us-ascii?Q?emHFjPfk/X+/Ockr7NIyASfHcQc+QV7HwJVfU+35jc0uRDY2upaEUMMCv6f/?=
 =?us-ascii?Q?hHLdgr7Qia7bJvBmQw3JNUwimkdKsbrWEs02h2NtzvLGFk7Y459e0SvxKoDm?=
 =?us-ascii?Q?Mbjrxp5FXxNM7zoNwfPHyjRcsz1xX2ELz3rKbNa9lDjXA0CpEZ7sQL7ifWz9?=
 =?us-ascii?Q?cx9w6X/Vq2pZrOT6SVmo43n2EaZNkjbEgh6Nhqf4/M84vPggzHeBLLYToMqg?=
 =?us-ascii?Q?DrBzjph9//VYtomNHv2AAwEH794fKkG+GGNgodxPvteseUfzRBFWT7/oe1GY?=
 =?us-ascii?Q?R5tSeDrOu8Qpt1KEOmTyVmETYaaY5nu1v2YdyUs1v5yreMs2lljiL49jILH3?=
 =?us-ascii?Q?lYI/mdlzh7mgOrU5bOc/UP6PpfhXddOihIHa4+5V4gZDVQ7HzQjdd598RFww?=
 =?us-ascii?Q?Rgp3P1hC3tLobS7JepmhZObGXNTd3wjxHiFPicwHL9Dh4WSeG6EJSWc3tBTQ?=
 =?us-ascii?Q?5ZnyzpKRocrI1PH+m4uFCFOPkqPwgRMLPO+ppio1G6CL5ZAqYy8DyxmlW/mM?=
 =?us-ascii?Q?gp9qClQoMY8iOFhRmejMQFNbla6UuBaVNAJJwNiBsUgGfEX07ros/ETBdzeO?=
 =?us-ascii?Q?B4fOs7xp4YYWonVQXh8tjvG4ICkZaIhjqN2XOUWGQAwT5K8CHydT47eRj3tf?=
 =?us-ascii?Q?lfijlXkWw0+MLEnDCqvKw5YIXezjWR2rOSnt01XartNI7lRp+8/TvBa3llLy?=
 =?us-ascii?Q?kD6aoZpQ4NxRt6YYSCypTSJkzkPr?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WiJxKBSxU/TJR+Njzv4glC0W3xXWVGD3GnroEBf8tuuLnPIvweqH6kSi+SE7?=
 =?us-ascii?Q?gprTkrxBspilQXkpn5t0K7T1wkuJhK3ITgE+jzJOwUm+JUoLuJd/QAFi4hTB?=
 =?us-ascii?Q?Ue49sYqRs85+LVv0ty1woozaAt4pWoyx0jiL9GEZ2AnAlWQZ1tBMG8bBNA8h?=
 =?us-ascii?Q?a1Tk+/0Ov+wYWmZQf76qypygWr4W/lgQfZfVPui9TrLUy1YPtRPasCOy/wAJ?=
 =?us-ascii?Q?uBKfABWBC5qzb34lMsrhuW07wDCj+OjicjTEcDgOPE40ufO/Kf8W0WK2/4dY?=
 =?us-ascii?Q?SkMpf3Ca6h3dPEwPEvU0hd6X233o4KAlqNUzmKfONQk9/4Zu4pVgBF2JLVZ+?=
 =?us-ascii?Q?JgnQTjRxl1ZUIA+hCyUJUlCP7tk8ac8BV+Gqo2mIhgW4Q2utXP24+Gq0PARs?=
 =?us-ascii?Q?aZ/BahBPWmVpMrZnebzc6si9y8oF9CrpOGHm6cgt/S0XdblRkKBIj26huLIa?=
 =?us-ascii?Q?TUg8T2n5HeOYknLqPN8lHaClmFAKUqZCUgtkSelK/YIC1IfFMB2MAbDzPIUD?=
 =?us-ascii?Q?rU/SslY3pKsFsuMtefh92Sj66XEWCqKrdZS+IqTa/I3ck0/SNNCFZvLMjx8M?=
 =?us-ascii?Q?ONnf/gXWJRRKl3OsIzwMUA4wzxKTTho4m74pNwjx/r2nkcmJqUGqI3n6EmcM?=
 =?us-ascii?Q?PwKdgZhj36DTbWI12dgazHXN1Sav5W6/Na3bRfBIUw+HGE/IvE7YPbJ8yhTc?=
 =?us-ascii?Q?amtHIZiARXTHtsDifWeoHWBJ0IFMSDTUTLTpg9d60cau2e9NL79FIxXOqByW?=
 =?us-ascii?Q?vJIGP47rI1k+evyiVM69jdnHDU4JBT6aaHFxb58acLn9GM1QtTVwxWK+gWGk?=
 =?us-ascii?Q?6DlxlKI/Wqs4BLRJScLlVwiuSlupR9aap+cnwbpQd249bekjfj3Aft3+gz+2?=
 =?us-ascii?Q?a8O5C7fjPajxVTCLzn7tFdvQj09eUcTIvU6Bc28KP3u0AmEeyLs1HHu0jqMI?=
 =?us-ascii?Q?TNDQYkGuPWMoFNyv6AsfplN06yYUXq20oKFO34EKD0+z1GDkys5ps7pH7dWL?=
 =?us-ascii?Q?PIWdBwhpAgAclszoVtvBJ1GiuUOjQR50OLUsWuG4bT5Y2sOe+1cFlDYPhjyu?=
 =?us-ascii?Q?kpfCrNvOO+IYtsUJZcc+Dj3RLSN0GYQUXP3hSbpqklnFhD5UME60QDbcLDPm?=
 =?us-ascii?Q?EgZM3bi551zLkSV9qRfgt4vOvXASt3umXw4mvTQC++Yv4Cv7GRT2oh+NR7Eo?=
 =?us-ascii?Q?MiGd8ze7Oh1PtAw1YPa7eH9U0IOzF17Zm8PVeHu+VZ4UPGqYoG2pGTrE22Ch?=
 =?us-ascii?Q?CRoJXhGB1t9zO8Ddp60NilHlbkK3uIt7b96iu9ri90CT5QqrVXEVwph6Qp8J?=
 =?us-ascii?Q?znDg38SLeac1mmEqwa2jVbhT4PrR6iIKOLaLjNaOOmLXhHnv1EOH3Fi1XDPm?=
 =?us-ascii?Q?HXuT4uzElQc7GwRS8p04KJnlAaPsWI/tJ0h/mR0EDm/fIsdBtKnR0/N7tFZT?=
 =?us-ascii?Q?aSdUXLrWUkoCJCqWXIwY1w8GvWgpwkKVeOWBoq3JxTIkWSf7VEDoWheX572R?=
 =?us-ascii?Q?NwR485NOcnzVc5KGOPwCRFPjf6TSpz0zJXDXckO1u/1ANRyQL7jIIQxrgSn/?=
 =?us-ascii?Q?i8hzjG2R8am95H8Ego5eeDzyNxp1W2en9cmhKB+iZ9ZbKscx7TAlSbnjYBi5?=
 =?us-ascii?Q?Jg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ae18b2c4-88cb-437f-50ec-08dd5db7cf52
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2025 20:36:59.7771 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UeZOucgXn1nsDuHOPho05lU1/2c07MnYCIg+x/hrZaMHsjyWsQEJEeg5WNy1AjuAE2b3nF2U2bf7/JMLXYaKlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6235
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

On Fri, Mar 07, 2025 at 08:07:44PM +0200, Raag Jadav wrote:
> On Fri, Mar 07, 2025 at 07:58:26PM +0200, Raag Jadav wrote:
> > On Fri, Mar 07, 2025 at 09:33:05AM -0500, Rodrigo Vivi wrote:
> > > On Fri, Mar 07, 2025 at 06:21:12PM +0530, Raag Jadav wrote:
> > 
> > ...
> > 
> > > > +	case REG_FAN_SPEED:
> > > > +		if (xe->info.platform == XE_BATTLEMAGE || xe->info.platform == XE_DG2) {
> > > 
> > > we should probably have a has_fan_control flag in the platform definition struct so you
> > > don't need to do platform checks here and it gets easier when we need to add new platforms.
> > 
> > My experience with struct level flags has mostly been with high stakes
> > features which require maintaining a state (usually atomic), and I'm not
> > sure if fan control is worth having one of them.
> 
> I know it's always taken on a lighter note in drm but we might never
> know the cost of it overtime.
> 
> https://lore.kernel.org/netdev/20231129072756.3684495-1-lixiaoyan@google.com/

We are talking about a 1-bit flag here, that is not passed over network.

Please check xe_pci_types.h

My experience with enabling new platforms is that you will end up forgetting
to cover all the if else of the previous ones and end up invalid memory
access on the new platform and realize that too late.

We try to limit the platform check for a very specific case where that
case is on that platform only and wont be extended to future platforms.

Otherwise we tend to use the graphics_ver >= X.X if we know the future
will consider this a legacy feature.

But in cases like this where the intermidiate version doesn't have the
feature and in the future we might have platforms with and without this
feature, then has_flag:1 it is.

> 
> Raag
