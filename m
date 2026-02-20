Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6124AC54FD4
	for <intel-xe@archiver.kernel.org>; Fri, 20 Feb 2026 08:23:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E070B10E79A;
	Fri, 20 Feb 2026 08:23:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Np7guSzZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B56410E79A
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Feb 2026 08:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771575781; x=1803111781;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=PFET/4R/0JPDc82ClUmo+h7EdJbzc/OFslFI7Y6vGe0=;
 b=Np7guSzZklx4nf/PLveXpZUMtTokJc8br5jUfI1IzKVbUjcFBNivB4QN
 tfo6rIEerMXYZLdl71tQblQg/mNzDc/L35WLTgTrfQ9+NWiYC3I98gmfp
 n6lKUnczhXqDJ1RFr1YbHo52lj7dXjSoNIYXu2oIeaofk+3d81TLSlPg1
 hrsajfUliJ3bRjn9BfWhKj7PjsCdxLqY3R2F68XjQunGLD7k1X8wKGNj+
 FHRLOYcUxOvPcwTho2I3UbrOjSaCAsnfvL+1TXeRcB3byHksybyLwqXV+
 pkirGRaBm0VvPZU1kg/c8fpSKrVmGnQF2K8ICc02bWoHCBjU+PO9Rmv1l Q==;
X-CSE-ConnectionGUID: g8zhXgQQSVGnDOJ3oYh9oQ==
X-CSE-MsgGUID: XGIKU6/NQF6fTxVPv4Ufuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="76531581"
X-IronPort-AV: E=Sophos;i="6.21,301,1763452800"; d="scan'208";a="76531581"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 00:22:34 -0800
X-CSE-ConnectionGUID: EydaxaZ/TtuLnp7hT7B6wg==
X-CSE-MsgGUID: DaTV0xugSKO40JEYVZVbuA==
X-ExtLoop1: 1
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 00:22:34 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 20 Feb 2026 00:22:34 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Fri, 20 Feb 2026 00:22:34 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.1) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 20 Feb 2026 00:22:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ojXS8do8ZKn0r2LXx4t8PiVlk3eOBiWbIfauu4E26YZhcrID40mfkJEOUPVUFJUbqtHNNjuMIpXrYLDXXStpcNZAmJJLeHPaT8Hey5OqU9rIVYw+8CHLMtKesK95Vtg32Gp0iSBOsDDLrUtC/gvq5G/qg6XtLhwG5Ri4wWY4mSqb07QFBQBfvsYaILepxL5RlgGvFBKn9pUfDObXNhBs0bs+rFX6b6jSUF54CqzXyaxahGHyWy/hUYJ1OMQiB8JUSGCHDr83ah9YLuBs1Xqtfsj3HgSoXBqvR/gBjb1IFJmoP8+ZhwHLicRHt11ofyYVoW9QKRLK7BFgm+eje+Ieng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ub5iYuX4Lv/mxhZSe6mw5OLNerArHerwT21OO23i3/E=;
 b=uadXLldrnmxB5vrt0N4HwMyjgSULe2xjG46CB708YFq9MXF4UxXHBubU2rWfFPuAaSGnqG2hoX9Y757hmJTRqJS6To85VfsmfzErwC3rsLQ9AAoFFwN9YMpTUE5WztrKTRh1OPnjYk+ArsOeD0qVGAAqc6JwG4ivei/o8ctwGSdbeVkVDRkEQeKiUwgl/08SkaNVkpwAh0hllRiM0nch7grafNB33bJsmotVE6rZZMqzzHb4U0lHAAcrwJHaY74SgWDMP+lrZoSeq+obAbUmAiYpW6l1fDZooihzvh3YZrxfs3ndXrTOp1Ml4cGB4j1xpd2GExb2t8rYkonAgTaFIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by CO1PR11MB5201.namprd11.prod.outlook.com (2603:10b6:303:95::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Fri, 20 Feb
 2026 08:22:26 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::efd5:501b:c890:26b0]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::efd5:501b:c890:26b0%5]) with mapi id 15.20.9632.015; Fri, 20 Feb 2026
 08:22:26 +0000
Date: Fri, 20 Feb 2026 09:22:22 +0100
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 01/10] drm/xe/pf: Expose LMTT page size
Message-ID: <20260220082222.ppefcfjsr4a2spuq@intel.com>
References: <20260218205553.3561-1-michal.wajdeczko@intel.com>
 <20260218205553.3561-2-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260218205553.3561-2-michal.wajdeczko@intel.com>
X-ClientProxiedBy: TL0P290CA0002.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:5::10) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|CO1PR11MB5201:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c712549-4c87-42ef-4e3b-08de70592e4b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MXAzY0t0VGJtYWVoZm01MEJtb1lPaUg2aGt2Q1E4V0dUcE5wd3MxTXdES0Z6?=
 =?utf-8?B?b1kxU2ovazFXbnlUZTNjNW5POCtjN0Zjb0Fld2VmampKWFU2YXZBb0J5bG1L?=
 =?utf-8?B?VUQrVVo0QlJLZkxEZ1JSOFc1U1ZibXNIdEJDRm5RbjF6WFlRbTc5VjAxbkJW?=
 =?utf-8?B?c2htZDlxYUdKNFpWRllzekpTMGRlNk1YdFdwZkYzOFk5N3JJZWRqWVFqWjdI?=
 =?utf-8?B?aFQzVC9XbjRFdTd1WUZmcFlud2tkS04zazh6QjdDejg2QlBJUGpCZzlCanZQ?=
 =?utf-8?B?Vm9idHl5cTg0RzJUN3FNbGdIZXFhd1RjVXZuektvME45TXN6ekhUMVc4RTBX?=
 =?utf-8?B?WTB5aitHM1dSVHlBZ3NUSU4xYUZ4MmxaRmkxdlZiTE1YMFVrY1djZ2FySFJw?=
 =?utf-8?B?aTRIYUxHUDUzTklnY2ZzM3FKNlEvQ3lCNUJEaVlDWXNEcjVHdVNwSm04dUZm?=
 =?utf-8?B?S2tScU5LVTc3dFpINnZQcHZTT1FIZUN0SFJ1MFpjUDJvc1RVR28wbFdqdUFJ?=
 =?utf-8?B?WjVwUTJqT2x0U1JzOWRib0tycjVBQTV6RGZCQmFUZlIwT0NKd1VVWmQ1K2Rp?=
 =?utf-8?B?WVcxUURkRkovb0cvaWNMNDVsb3M2MEkrMTl2RGlHYzIxL2dzamhRSG5XOTFy?=
 =?utf-8?B?aHBCcDV1TUpURDd3QkYwWXh4ZzNuVUNOTmI4UFh1QmxmWEwvYlY0eFV4ZzVh?=
 =?utf-8?B?Y2d1YUdYQjNrUTYvR205SEJYZ3RLRUloVnRrSWZCTTYyc2QzdnZJbkZRQ2hi?=
 =?utf-8?B?a0RBTjV5dkE2V2l4MGVKYytrS211Yno2cGVhcGFyekx6UW1Ma1FzR01PRmN1?=
 =?utf-8?B?ZVdEaWtyWDkxNDNSeDIrUURxMkVOcUJFS3UzYUJydytQNnJCQk5wbkx5dDRs?=
 =?utf-8?B?YVlBR1VPMTlPK2IvYmQzekdKVy9QMDVDWnlnQW02RytzOXZpMERhWG85SjNR?=
 =?utf-8?B?a0VBdWN1YTVHR3Z5WDNvZHBEUXl3c0ozU1M1V09YQVozbmM2dkc5SXVNMkR2?=
 =?utf-8?B?RUdYc09XTUxlbWh3QThKUDZuRnN2WDliYld5UjZkRUZZTldnNHRjMHNTeWtY?=
 =?utf-8?B?eFNmcGhmU3JaZUxQbjlkdStiYkRKcC9rT0t3RFUvSjIvOThyQ3FVY2NFZGhV?=
 =?utf-8?B?MEtnTU1tTDFIZFZ5T3JZMm1xNlJ4TmRmejNUQ3pnTWg0MCtybXFpaWdCcDhG?=
 =?utf-8?B?aS92bXdvSHlLalRoVGg2OGtVZ2xWN0ZUTlRkRGFtSDNjQW53RG5RNGswbEdK?=
 =?utf-8?B?OWNIWjYyTlpUNUdKRjdCSmdxUVBQc1FNakFXdnQ3NXB5Ujdzc3c3NnBUNVJ4?=
 =?utf-8?B?dXBlSEM3Y1ovSnB2RTNXaTh6Zk9RMEJha1RFdkZON3lPM254YmdJOWhkM0dy?=
 =?utf-8?B?aG83WDlNNnY2TE1wSTEyaU1RTXk4aUltbTJrazUwaExZZzlXUHRCU0FiR0FI?=
 =?utf-8?B?cHNzUXF2bk1TcHV0M09WNURFZWVRR3JycEhFajVDVlFXbWphYVFDMlNNejZY?=
 =?utf-8?B?S2hwMWZWQ0dubk41ek1QZS9GNHBualNZREZLY3NkNGFUTG1SMlZkMnY5QUF3?=
 =?utf-8?B?TStGdEUvbjM4dEZvOVFOQnVvVXpyK0NCTnd1aklVL0lERzdTNDEvZUQ1Uncz?=
 =?utf-8?B?Y25nNk5oRG1BOHM0alJmV24zRHZsd1hvbEM4T1RXd2IyakJPWTZyc1FuTzgw?=
 =?utf-8?B?NTdEMTBmbkMwRXVxbGRBWWlyclZBeFZmU2ZqY2NycjBMTWVMTm9RZlovWTNV?=
 =?utf-8?B?Q3dtMjJnYVl4OExSR0hGTHpzZUY2M3NZNTlPMHB0UVJKb0RXQ1lSZDZGNDNj?=
 =?utf-8?B?cVhDdktDdHk0SmpWYjA4YjJhWnRjeklnaGp4bi8rc3ZvK2JNOXlNcnFxUUlQ?=
 =?utf-8?B?dk5PaElXOHc0Q3VZMVg3RW9sUG1sS1dCRkZiTDhPM2UvdVJZems5eXA1QkxY?=
 =?utf-8?B?Rys1U2YydzlDcWwxZjVNTFY5M2FNbktncXJYNFN1bkZ3QkEwUENkZ3Bybzgv?=
 =?utf-8?B?ZEMwNXdqV2lZanpyS2w5cDlINlZjUUNBNjBWRnJqak1JNjFLZXN2cDA3U2pl?=
 =?utf-8?B?TjB6R1J0ckRxWHBqcmd4R2c3NWlsK3llckxnNEYxYlN2YTAyUEVKbFlucno5?=
 =?utf-8?Q?VqM8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ckw2NS9uKzZQSWwwcElMQnNxbDRKVGM4bm93VXg5cFhJb3o2NFp2S3loUE9i?=
 =?utf-8?B?V3NHdlJoRG5FVnNSUzA4SGVLQnFjaWk0WnRqMEdDeUluRGRHT2NLYTdvMEc3?=
 =?utf-8?B?NUZOeVV2RzhXR1phYVUwdnJOLzhGMWtLVlgvUDJXVHU5UGpIYzA5MjJ6Y1Vy?=
 =?utf-8?B?aUNSWEkyV0xCcys0NnpObGpvVEdnNXIyVU5IekpvakV4QmYvN1pHM3JUd1pI?=
 =?utf-8?B?MCtyanRqbU1qVEJaazhJQXk1TVpzanFMZGs2cldSTWFKM0VvQ0lMOEllNGY1?=
 =?utf-8?B?SWdoMzMvRk5JZDFrSUtKS3g5ZTF3R3dJYkdXZ0J2bHBkU05OVHF0azM0c1l2?=
 =?utf-8?B?UUpIOVAyb203ckhiYlVqTjNYd2xhbTZ1V0U2UG5XUm96QXgycTl3RUlyNzBi?=
 =?utf-8?B?aGRxUFMzc3BhYlhaVjU1ejhJTjFQaXlLdXBOUEJpVUFwaW1YazRQNElNRHlr?=
 =?utf-8?B?WTNrMXVuOWsyVW9XZ3c3NUJqZ1Q3U2NlZzdlNS9rT0UyUTFFL1FtWE9NZStL?=
 =?utf-8?B?R0ZUSjVKaVhRRUhZZHp3bzJMZTZBY2M5MUxNQnFGQzd0N1RySW8xQXRiU0VQ?=
 =?utf-8?B?OU1ONlpiQlRnZ1BXUXEwWDcweG81K0s0YUh1S09MSXEyU2kwWm9qbllYRURx?=
 =?utf-8?B?UDc0LzB1VEdock5Mam9tdlh3SzBtdXllMW1hMkFXbm9lM2xsazYyYVJKblFh?=
 =?utf-8?B?OHoxVlJkMFk3RkRaUE95WTUzMVd6N1BUaWpKSWJzVHlYd05QQ2h0U3M4cmM1?=
 =?utf-8?B?NzZDWFdHV29zZ1pwY0lvblExdGJrOVdhd1VQOVRheTlpQ3Bmd3BmOFFXemFE?=
 =?utf-8?B?QzRZNVMxVWZxY0lxSkxPci9XVXBoelRKZGEzckozbWVtOHViUlk3eks2ZDNC?=
 =?utf-8?B?MTRoRVFyalY4VE9wZXN1eTV6eTgwUERrVDlNSUtkUVoxRG45ckpJd2YxM0Q2?=
 =?utf-8?B?WUZJb1ZBeEV4SnRUUHBzQ0FVRXRYditXVVh3UEJ6UGx2VVQ0ZkcvNEZDaFkw?=
 =?utf-8?B?UXdpWG4wT215N0FnR2pKRjI3NFRsOXloSS9iVWJQWjhFQlh6NGFzQnhaU0Vi?=
 =?utf-8?B?MWFraWJ3bUhnWnVrNVB4ekxydk9PL2ttVmwvdkx0NXE2S2F6K2kvc0JWaGRQ?=
 =?utf-8?B?VXA0U2hhZ0gxNHFWb1J4a3Bib0dSQ1BMbWFJLytHOVJ6Q1N4ZFdTZzlGZ29k?=
 =?utf-8?B?SFo3MlhLWDFVVENuKzNMUjlWSmJZWFh0MTQ0OXBGQUtJdnUrTDljQTZ3NXE0?=
 =?utf-8?B?SHRjTTFRKytLbmFtRXlaWUFKWHIvVFR5ZFpsbHI2eWJVZ2xoUzZWM3pDRmlv?=
 =?utf-8?B?RG5JS1l3MEVSdW85aG5VY1I3b21wZURKYTlDbFh5aHBZR2xDVjBpUHdUMDFJ?=
 =?utf-8?B?a1gzWkZ2bHVHT2ZwbG40LzFYZnIxRTNDbjhBREp3L0JwN1hTU2YraXJiS2Fs?=
 =?utf-8?B?MUFldkx1N1N6UjNPSHVocGFVMGlpRVhEcXh4T3FSRjFmWjRxVCtOd0ZMYjNR?=
 =?utf-8?B?MUxGSlVidVVpNjZNbFJnVDRrclhUeEcyMXpoRnFGc2ZOWWx4b3pOTTNHUXQ4?=
 =?utf-8?B?aWVZcUVVMTA5NjBaR0FXb2VQN0NpcDVaSjBmZlJJQTRsNW9yWktReHduclJo?=
 =?utf-8?B?UjNwYUFyNExKVEZsYXVDL1lFNXFmVUVxTi9HSVhWMEJSTmFhL3AzZE5ycmV6?=
 =?utf-8?B?YkpRVFZxa2F2b2E5TE5MNERUSTV4R0lYSXVWeWNoTnB0aTZveFJLd28rekV4?=
 =?utf-8?B?KzNMQmYxUHlnV1dYSU5jaTU0ODFDNXNWTjJDKzNEWkZuemZid21LY2hKUWVp?=
 =?utf-8?B?UHNSV0hhZzl2NlR2VHVDbjYwZWVGbHVpWExxdVlSMWF1U29FaEJ5dkFEaWl4?=
 =?utf-8?B?SVRocVNVcnNpNEplKzdRR3VCcS9uTnZuNjJNMlZlV2EzQVRpZWNCYW5USmky?=
 =?utf-8?B?LzlPVENqOFUxRnJ2U2c3TDhGSmZuVVJFSmtqNmxXOEZvV0FIQkduellzS1lX?=
 =?utf-8?B?UkFpalNHM3UyR2RsRUpKak03Y0JrMUNBMmR0NU1RVXE2WDAxZnIySDVyd3Nn?=
 =?utf-8?B?a2paNWRhS05udzcwRFd1L0Q4dlBZVTNLK1FqU2NZYXdHRkxDa2dQTXVpZ3p0?=
 =?utf-8?B?R1luaEtiZ3hKNkVoUWZYclh4aTZXWGdkM1BVWGhHTlJUODhOdGNtQUJmNlo1?=
 =?utf-8?B?N29JRmt4MDhMajN5bUlzclFKbVE4WTJDSGp2c2dXSlhESWNNUlNrK05UKzdI?=
 =?utf-8?B?dmFaYlgyb3h0TnJIVUVlQVBvSzNxTld6c0FXMk14VmxxclNyR0xGVDBwdUlD?=
 =?utf-8?B?eDJ1aHBXcXlBL2xVRTVHL1hiQjhHeUVIV3ZPYU1ia05PTzhEVEtJRUtablZK?=
 =?utf-8?Q?7ACczQB1YwmKHkTE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c712549-4c87-42ef-4e3b-08de70592e4b
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2026 08:22:26.6385 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 051FIaVO3urTvFKcZ3hRZ3JcylJ002tAnIT5kMnv68odP6VgDYXseX/j0E25lr4sn/hIMsu71QBvEPoFt7wM0zCNerbNWMJ+Lvs+XJmlKP0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5201
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on śro [2026-lut-18 21:55:43 +0100]:
> The underlying LMTT implementation already provides the info about
> the page size it is using.  There is no need to have a separate
> helper function that is making assumption about the required size.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c |  3 +--
>  drivers/gpu/drm/xe/xe_lmtt.c               | 17 +++++++++++++++++
>  drivers/gpu/drm/xe/xe_lmtt.h               |  1 +
>  3 files changed, 19 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> index 888193e1d2c5..e06baf12e108 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> @@ -1451,8 +1451,7 @@ int xe_gt_sriov_pf_config_set_fair_dbs(struct xe_gt *gt, unsigned int vfid,
>  
>  static u64 pf_get_lmem_alignment(struct xe_gt *gt)
>  {
> -	/* this might be platform dependent */
> -	return SZ_2M;
> +	return xe_lmtt_page_size(&gt->tile->sriov.pf.lmtt);
>  }
>  
>  static u64 pf_get_min_spare_lmem(struct xe_gt *gt)
> diff --git a/drivers/gpu/drm/xe/xe_lmtt.c b/drivers/gpu/drm/xe/xe_lmtt.c
> index 2077e1ef8b43..b583e0f20183 100644
> --- a/drivers/gpu/drm/xe/xe_lmtt.c
> +++ b/drivers/gpu/drm/xe/xe_lmtt.c
> @@ -57,6 +57,23 @@ static u64 lmtt_page_size(struct xe_lmtt *lmtt)
>  	return BIT_ULL(lmtt->ops->lmtt_pte_shift(0));
>  }
>  
> +/**
> + * xe_lmtt_page_size() - Get LMTT page size.
> + * @lmtt: the &xe_lmtt
> + *
> + * This function shall be called only by PF.
> + *
> + * Return: LMTT page size.
> + */
> +u64 xe_lmtt_page_size(struct xe_lmtt *lmtt)
> +{
> +	lmtt_assert(lmtt, IS_SRIOV_PF(lmtt_to_xe(lmtt)));
> +	lmtt_assert(lmtt, xe_device_has_lmtt(lmtt_to_xe(lmtt)));
> +	lmtt_assert(lmtt, lmtt->ops);
> +
> +	return lmtt_page_size(lmtt);
> +}
> +
>  static struct xe_lmtt_pt *lmtt_pt_alloc(struct xe_lmtt *lmtt, unsigned int level)
>  {
>  	unsigned int num_entries = level ? lmtt->ops->lmtt_pte_num(level) : 0;
> diff --git a/drivers/gpu/drm/xe/xe_lmtt.h b/drivers/gpu/drm/xe/xe_lmtt.h
> index 75a234fbf367..8fa387b38c52 100644
> --- a/drivers/gpu/drm/xe/xe_lmtt.h
> +++ b/drivers/gpu/drm/xe/xe_lmtt.h
> @@ -20,6 +20,7 @@ int xe_lmtt_prepare_pages(struct xe_lmtt *lmtt, unsigned int vfid, u64 range);
>  int xe_lmtt_populate_pages(struct xe_lmtt *lmtt, unsigned int vfid, struct xe_bo *bo, u64 offset);
>  void xe_lmtt_drop_pages(struct xe_lmtt *lmtt, unsigned int vfid);
>  u64 xe_lmtt_estimate_pt_size(struct xe_lmtt *lmtt, u64 size);
> +u64 xe_lmtt_page_size(struct xe_lmtt *lmtt);
>  #else
>  static inline int xe_lmtt_init(struct xe_lmtt *lmtt) { return 0; }
>  static inline void xe_lmtt_init_hw(struct xe_lmtt *lmtt) { }
> -- 

LGTM:
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>

> 2.47.1
> 

-- 
