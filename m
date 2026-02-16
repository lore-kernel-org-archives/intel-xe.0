Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76E32E81A3F
	for <intel-xe@archiver.kernel.org>; Mon, 16 Feb 2026 16:36:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35B2810E3BC;
	Mon, 16 Feb 2026 16:36:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L07SL4i6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8699C10E094
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Feb 2026 16:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771259776; x=1802795776;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=RmDUTCPdiYfrwrVQguapzZPA9gTh/4zKLM+kuokt0ek=;
 b=L07SL4i6aXpPDmowntPWjuVnlVBFoxa7V2h3khAfMlVC9RLaWo8DShvV
 rxGtc5wXwpRIqgfY8HeFjYgPcpbhztg4VnTRUt7SYsVnFVK5/pzp8/Mp7
 EDmfQGDIUMn6EIOTpp+Hoo4T/1rAWlRqqVD0+JrWpi/4nAxxa7U9bjK3n
 dMjjC8HKiH9RpSDvEwlrP8X/IJsO2LLFke/o3X8MZPX1ZJHzLfkcce+0W
 eu3ccvnJo1QDH7pu4z6AEl46WVAuAQbr28sjT63ryZqmuOL0ksJMMCyhn
 leXrQFEhRqqG7fkvDCpe+L2G1i7KBvN27ye0SfduOcr9o65+HOXun6lL5 A==;
X-CSE-ConnectionGUID: FGfXsvdaTdahtdrMdMUbHQ==
X-CSE-MsgGUID: QCjJZfwsQOayUD/jNRgu1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11703"; a="72240841"
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; d="scan'208";a="72240841"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2026 08:36:16 -0800
X-CSE-ConnectionGUID: FImEwjJlRq2qCXUYcB4RiA==
X-CSE-MsgGUID: 6qPek/VhQFSnsOCNZzkMwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; d="scan'208";a="212960374"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2026 08:36:16 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 16 Feb 2026 08:36:15 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 16 Feb 2026 08:36:15 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.0) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 16 Feb 2026 08:36:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ca/xhpjEqq9HODjelxMu1nxJsuLT9QMfHTv4VavaXYLS0J51qL4TazgzCCSiEsJdnzMvy1iwjbf2pKa6Knu4Lq8LWMGsxkrFEmfVBmho1Ii8/6nGBc9famHyn15M6uA2/3lyVMSOkB6DNo4+S5DpW5xsNZ54+Bn6xa+xVL+5dM9VQSnvTs9TbxLyTeW16F6+t+GOUBvk3GdEMPuQqZEFxO3KBf7wqqadC2QXC9sYw/b8wpwtLG0V7lDAfcihqbzFkjvhM6yADvaV++WXL7a/9SFS3mc0wIkZ7BwD22jn4IS2zAZCcDxt7dCp5xGjL1D6K/GyLbAG9OgjHqjMc+z59Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rnndVYmlQCJIKVn9oNUiIAA4X6Eh7/f1zGo2jxvBOWU=;
 b=bDFxslyuNcLBnGJYv1WqbjgrqfBLCTG+XlepHdqX84kAvT1Y+9rUtlgKJTyJ0j1xlOno/4inHuMYqRzimyry7lCkcMKlSgBSU453rU4prl0Uy+ZUaQx8DFM9aMmyHoJH2vKC4ect4VrxynAvgSGx0/bU4E1MqylXYHwU3lcL0FNbUlneFXnO+RGf0PgGwBSS60b3a8dLuKVMI0kug/Tn0hwCaKcRRIE72RCCbQ4+Ep3fbbRi4JXRQP2ATmmRlYw74mVnzw8mc/JeHaOBBiFg0TudnauD9XhUDNcOgWw97vnXjlgMMeL5DJn60F5dtrGHIkitUdFX7LCVPan2z5vGYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by BN9PR11MB5243.namprd11.prod.outlook.com (2603:10b6:408:134::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Mon, 16 Feb
 2026 16:36:13 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::efd5:501b:c890:26b0]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::efd5:501b:c890:26b0%5]) with mapi id 15.20.9611.013; Mon, 16 Feb 2026
 16:36:13 +0000
Date: Mon, 16 Feb 2026 17:36:09 +0100
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 7/9] drm/xe/pf: Prefer guard(mutex) when doing fair LMEM
 provisioning
Message-ID: <20260216163609.4uv2lr7v3lyaqqie@intel.com>
References: <20260215203323.595-1-michal.wajdeczko@intel.com>
 <20260215203323.595-8-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260215203323.595-8-michal.wajdeczko@intel.com>
X-ClientProxiedBy: VI1PR04CA0100.eurprd04.prod.outlook.com
 (2603:10a6:803:64::35) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|BN9PR11MB5243:EE_
X-MS-Office365-Filtering-Correlation-Id: bd12a15a-f8df-472d-272d-08de6d797f5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TlVqMENyc3d3ZEQ4UVZuSW5vVnl0R3lGYkx0c0F0SWRlNEFLQjVFU1dBWGVq?=
 =?utf-8?B?eHMyMmNRcWV2YjlQVDNwcFNOYzNSRjM3NUhBd1NHdU1YSm5OYWl2eDhIcWhH?=
 =?utf-8?B?RG1kSnFSc015SlJMTDhPQjNUZ1VYbkR2c3kvSG0rZHBHOGdXQjNialpnb1kz?=
 =?utf-8?B?REVLeUtIcEt3SVl4VXVCZW8wdFNSajIyd2pkU01KampnVlFjSnZxMmJUMC9o?=
 =?utf-8?B?V3dLMTNSYVBvVXRSV0tVZ1pjWFJqNEpxNHNCQ0R2TG9DcHlDUm1IMUpKSVg0?=
 =?utf-8?B?bWVvd3hDMFVpUTZRNENwQm91UUN2UUp1ZzZkUzNVeWZ4TGZ4T2FyWC8rb20y?=
 =?utf-8?B?bHRNR3JoQ3VKWDAwUnJkLzZxNWl2c1FwWFBwRGRMUDJXNzdYY1JTN1FZb1Vn?=
 =?utf-8?B?OVIwYjI2enhocGpqc1Q4UllDb1lNeUhuWGhCWlZrMmtuRTI4a1BhdlNWcDVi?=
 =?utf-8?B?VmJtNE8vU0xKcU0reEhsdE5PM2ExdXZydDl5MVQvc1VoYmxmTzNGd0p2TzhP?=
 =?utf-8?B?RTIyNXMxdHNoUFdOZVhOSzVTNmNvbGtTL1EvdzluZWdmQXdTNThwcHBDMHI0?=
 =?utf-8?B?bkRieGdaeWxqNmZDRC9JNkI2bjZpRURXUk1oOU1zWU9yZUNleGtHYWNpZjZq?=
 =?utf-8?B?RmtCTmxIV0JlRXpZckZoOHNGWHFKY2huUmZ1S2xmQ0F3a2ZKczlxN1lmZVdh?=
 =?utf-8?B?ejlITkNiZnNWRzhxb2R0SDAvVlhtWEQxZlB6TU5JWU9tTTBGTTRTTUtsSkVZ?=
 =?utf-8?B?Tm4xU0FtZWdOQ05mNkNaUXpMYUxiUjJieTh4TnRWeng1QTVqT0luTW5SeG5z?=
 =?utf-8?B?RW03b2hWdlh4ZWY4bTZXYnlJbHN5Ry9kdFJNMHNRQmgwQjNEVkdKZXN3NGtu?=
 =?utf-8?B?OEkydWpNbiszSTVBMnJNVUFmcURGQmVsK24xbVhYOThIajNMbjU4WlRFRFE2?=
 =?utf-8?B?NDh5QXowR1BsUzJ4NDBOZHVheEZXSjhnREcvbUx1RnJuNEhKYTJTeVpBVFlp?=
 =?utf-8?B?QXV4UWl0aTRKUDRWNnpoTzlJc3ViMVB0ZzBXbnpDb21FeWZCK3lFaUFvUVlt?=
 =?utf-8?B?V3ZZTjNIS0RBd3B6T3B6M3FLOE1rWnFaNlduVWJVdkpqREJTQmZzRDFWb0RO?=
 =?utf-8?B?cGtBdEEva0ZpOTZmN3E3SFoxTStENk5EZWM0cm05TXN2KzZ1QXpsZVc1Q0Zk?=
 =?utf-8?B?bkZDQmtlMVZIODJZSVBodXBNSjRSWnlha3VOcUo4VzMvOXQrb29XdmtjNFhJ?=
 =?utf-8?B?T2srRXlFMTZ4eFVXWDR1VjJ3OGozU2doaG1SWWRRRGdITDZHR3NDYWhaeXFh?=
 =?utf-8?B?b3JOdEtMVWg2bGZ6TEJvWERYRjRITlU2eXZZTXd6YWFabGZlSDFPYmM3Q1dM?=
 =?utf-8?B?VTdpVERhb3J1YnBNYVIxaTRkd3B2aUIvQ2I2eWE2UE9VUUFtYUh2UFRVZ0R0?=
 =?utf-8?B?eFVSQ1FFOUROQituZHYwZDI1dkxtb0UzLzduVWlnQVFzYjhRcllIc3FvM3Y1?=
 =?utf-8?B?aEV5emV0SVZzeFFqT05lQWJhVVIvSG5GZktNQlBDa0R3d0ZVODFIVVh2TmJY?=
 =?utf-8?B?azdsamdtaGRIblhpQmpKZ3l2cWNmcmQvdzhnMzNtYW9kdlJhK3RZOUZuMU1Z?=
 =?utf-8?B?dUdCaGI1MHp6b2dUUzFqczVYcGUxaTRUcVRiQzV0LzRpTGxFeW04TTFrdUxV?=
 =?utf-8?B?eWtoSTRwUkd0MWVGRnVIUDZDNG9HVkRYOFRHODdIWXZQZlpBTTFNc25oR0RS?=
 =?utf-8?B?NDBHMGpQTENBY1hXTjl2Sm9sUkhaQ2I2dURiSFJjbnI4cTlpR0dTOGlnNmhp?=
 =?utf-8?B?WXJNVU5xWjFQb1k1bXF1NXYzUTl1ak56aGxpQWc3ZVl5Q2JjY3ZXejFDMHpE?=
 =?utf-8?B?bmtRMGJxdGw4dnRBZHRLaFZ3ZzRHUDA3dGhLOEdXYnlXYVh0UWVGTldtTy9N?=
 =?utf-8?B?UjJuYjkxeWFzb3hvYU9KQUlWQlVOalVLZXRudHF6UzA2T0QzZytibFJBUzBi?=
 =?utf-8?B?aTB6b1BudkhoYTZSN0UvNWJzYUxWOElRc0F4WCt4bUV1dERmSXAxb09BemtG?=
 =?utf-8?B?MmVUWmhoTEszSWxZV3pWT1RWbk5LVjhkZTBhczlES3lkbFlwZUY3dlhMaVJ5?=
 =?utf-8?Q?RhBs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z093eGpqVk9qdmJ2d2krWHEzOVVZSE9rbmlSN2RGZXJEWVJ6ZlJSQUJ5c0l6?=
 =?utf-8?B?Z1pJNnltTjd4d0o2SlRnVjNsR005YmxCNjcyeWZPZWRER29mWHh6TnlxUExW?=
 =?utf-8?B?bFA1dHBSZm14SVdKMFhZbzI3bDdTbDJzMmFtdmhZOGNSZzZ4aVdVTVVxQTBQ?=
 =?utf-8?B?eW9MQVNidTZHd1V5bmJ2Wldua3J4eXFEODNkbUcvUURkUkpBejRsemhQMjJP?=
 =?utf-8?B?UFJaQmxuN1kzcG1ybzZ5MCtxQURxWXZaWEU1dERZVUkrSGdLQmlaL3Z5NFNr?=
 =?utf-8?B?VVBJaFdleGFVQ1FpQ3ZnQ3F3aXFPcEp5bUk1RlAzV0xqNktWZE5sVVhIYlNZ?=
 =?utf-8?B?Wnl5NnNKMEdYaVpuOUp0U1NvM3oxMWV0ejFaY2UvREg4NHlFQnJOMmFJVEFk?=
 =?utf-8?B?RG5HODVlemhLeWdYUUU1OHQwcHhYVDNOQzcyL1BiaWdLRTQrV05GYm1FUllr?=
 =?utf-8?B?Q2ZSSzVHUCtpWEZiQ25TVWNVYUhtN1Z0N0dzOUVpcEE1Zy9oVmNxV1FWakpR?=
 =?utf-8?B?RUI1UnlUa25zcU5lMVNnWHJJVUV3SDBySmY2U1ZmTkFzYmVjV29XUTJ5Umlh?=
 =?utf-8?B?Z1psbVl6cmg3Z09OSXIyNDFsajloRTdiTFJZVU1WTWFURU5hTTB6RVdXUFZI?=
 =?utf-8?B?N0dyZlJnNzh0N09SSTQxbEFYd2w4QVN4Y2FQRXlXbVdKZU5vODRqUSt5N2ho?=
 =?utf-8?B?U1VmVE9adGRGT2Vtc0NHK2ZnVWFLeThIclJ2MERqL1FsYWt6R1JHbDgwUGdv?=
 =?utf-8?B?Q2YyRUVwODVFY29wNkZEUkZUbHpRWWQ5VHVTSTdUZlUvaDhLZm9JM2FOc2Mw?=
 =?utf-8?B?b0VKajNTN2hLaFpmNytRM0JXSE9kcW82RmdSeXdkVERjcGYzb3JobThYcmcw?=
 =?utf-8?B?eklUVmxLeE9JbUM4cGhDcklpd29BRm8wcEZCWTE5ajF5Zkx6ai9ua0pXbzBY?=
 =?utf-8?B?djZMWTlwVDdZbjN6OE5hR1ltVlhhZnF3ckRlN0MxbUY0R1k3Y2lVL1lFWVRu?=
 =?utf-8?B?ZVFYQVpYbHNzYTl5aTVsRVZhLzZ1dVVDZ1BZSkliWnNpdHdtSGVNK28xNitJ?=
 =?utf-8?B?S05mZzdCOVJaSVdXall6ZTBBS0xIdzJpVWxXV2lQdTRCQVJIWCszdXZ2YWVL?=
 =?utf-8?B?aWp2d2IrWCtjZU1zalVaRWIrVDNZRDRaL0ViQjhFUEl6MnpOeVNhRnRST2VK?=
 =?utf-8?B?N0VVZUlDd2oySTNIL3ZuN3pPTnQvOWZ1UE9FTDVQbFprZ3JZR1greUxsVVlL?=
 =?utf-8?B?VmFlRDBiUmljemN5cTlvaVYxU2NZVDZlMGRlZFBOZ2dLVWF6cERibWFlUGdT?=
 =?utf-8?B?UFMyT2VXNWF2SkdsZ0hoUGJzZTlJYjNTS0VaaCtPSjhXNjNKNFVlci9IVDl1?=
 =?utf-8?B?VWp4T2hPQTdtbzFTQ2VMMDhVeFQ3UHlBS0NiWFBLSm1WckZDb0V5alA4VzRC?=
 =?utf-8?B?WnN5cU8yTk5KcVE0NzdrUzhYOVRTT2NRMkdtYUNPYWdpRmRYZkJHaTI5b1Ez?=
 =?utf-8?B?cHlKT3VOclJOUjBqQjdQSCtvekh5RS95SHBpd3VJS1BYYldBMVVLdk9laHVW?=
 =?utf-8?B?LytseVJNSXdPZlhVNDZJYmNuck9EaXNxNVJWVk5nWjNIQjdoRTFHbWtJVnlh?=
 =?utf-8?B?ZTFiQVNTTmxSMWZsb0lnSzM5bE1pcndNay9zNGdWYWNKRzlCWmN3bHhhWlJB?=
 =?utf-8?B?Qi9Oekdhb3pvSGVWVks0QUlLa2xUclovTzJEWVVIM1kzWGNlN1podWZVRDBm?=
 =?utf-8?B?cm9DL3FFb29abGM1TUYyN0NHTXdNUnFzUnhSZFdGVnFNc3VsOEt2UDh4TDFv?=
 =?utf-8?B?SHZ3cXNFMXFSaHlJZDQ5TUxOclBsSlpucjBvRVAwVTltWktaK3VMZ0ZvZ244?=
 =?utf-8?B?aWVkRm10ZjhlSS92Nlp1VUlKTjN6ZFFuUHhsc2RpTTUwbys0aVJjbjN3azQ1?=
 =?utf-8?B?MmhRcTRyaHVmZTdEZ0hHSGUwUnlnZFNtaWt4SlF5UEpCOE0zOVNJaHdMSmc4?=
 =?utf-8?B?MC9hUEV1VlFOMmhWTmczZVI1em9jcHFMWGxEWmpxeStuNi9UR0RtbHlHcjFo?=
 =?utf-8?B?WkZXVklzU3VrTVFJTkN2d0lJb3FjSUVTTHQxaVd2blZWV21lS0R4TGI4OTJh?=
 =?utf-8?B?TUZhSXVxZnlRVlQ0UWo2S3Jza2lwTm5WbzJibG5xUDVIbFRuby9wRDFVaGIr?=
 =?utf-8?B?L0RtaVhDZFdkTldsZk9ON0tOaVIvRTA1UEtkYnJ3RXIySzd4NTdaZlVUcXE3?=
 =?utf-8?B?UWdtWmNxQjB2Uk1IdG4rSXFoU3RiL1I4SDNxR3k1L1Y3Tk00cDZRU05ITHNV?=
 =?utf-8?B?empzY1lrc0IrNHBjTFVDckR3YnpzR1dsMjV6M2ozSCtNb0s2OHA1TE04QTha?=
 =?utf-8?Q?3UWFe6WY91Loj3PI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bd12a15a-f8df-472d-272d-08de6d797f5e
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2026 16:36:12.9789 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AsgCRWOoP6j9JiEO6vW7Jm6y6XfZFYryGOokVo+sOy6SDWvGHhVTqCepGZt6WMRZ+ogb5ptazGeFrdAXw9r3eXQXe8OiePBy+jVoZ6S86qI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5243
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on nie [2026-lut-15 21:33:21 +0100]:
> We will add more code there and with guard() it will easier to
> avoid mistakes in unlocking.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> index 43041af81518..1a9f3b85526c 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> @@ -1962,10 +1962,9 @@ int xe_gt_sriov_pf_config_set_fair_lmem(struct xe_gt *gt, unsigned int vfid,
>  	if (!xe_device_has_lmtt(gt_to_xe(gt)))
>  		return 0;
>  
> -	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
> +	guard(mutex)(xe_gt_sriov_pf_master_mutex(gt));
> +
>  	fair = pf_estimate_fair_lmem(gt, num_vfs);
> -	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
> -
>  	if (!fair)
>  		return -ENOSPC;
>  
> @@ -1975,7 +1974,7 @@ int xe_gt_sriov_pf_config_set_fair_lmem(struct xe_gt *gt, unsigned int vfid,
>  		xe_gt_sriov_info(gt, "Using non-profile provisioning (%s %llu vs %llu)\n",
>  				 "VRAM", fair, profile);
>  
> -	return xe_gt_sriov_pf_config_bulk_set_lmem(gt, vfid, num_vfs, fair);
> +	return xe_gt_sriov_pf_config_bulk_set_lmem_locked(gt, vfid, num_vfs, fair);
>  }
>  
>  /**



LGTM:
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>



> -- 
> 2.47.1
> 

-- 
