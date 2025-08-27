Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEA62CA0EFF
	for <intel-xe@archiver.kernel.org>; Wed, 27 Aug 2025 20:31:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A2CD10E8B7;
	Wed, 27 Aug 2025 20:31:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LY9wmOSa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DDD910E8B7
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Aug 2025 20:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756326683; x=1787862683;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=l/9OZ/KvN+DvvYPv+d+XJiXYrT1TMZqxKLi/78E+QC4=;
 b=LY9wmOSaHGXDFNZfMtpTDiw7wcRC+18Yub4nXYrwP2HbeQSfNAnN+u1C
 7YJvg1FuqiLu6WW0gg4ldjb47IM1RdZtJkAirQSGGqFtMOZfEUoUkvK6a
 okcSuet48LcS5UjRgW15eR/65J2wAP5Y3giBC7AA4LQyef9ii6FgvPqW+
 f+vzUBFTnvT8e1vGjkj1YNM7eOTAEvsaADsRt6kgVPfkecmn37Dw8a9iu
 p/tgMfgM91mQNRrweXi6BFyJcVbHhFYpd2ge/sBAMlbTZv1DCuJ9975BS
 EwWFB4j5DE+85KUt43FjIFmjJBWohfYK9ccTFdxLE3ocDjmkeK+s0DvLc g==;
X-CSE-ConnectionGUID: Q9fSKsJdTYySVdHr4OcY2A==
X-CSE-MsgGUID: 5qF1Qe7ETryjnPUxUWstCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11535"; a="61220782"
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="61220782"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2025 13:31:19 -0700
X-CSE-ConnectionGUID: asRWUbc9QjyJXHEZjc0bjg==
X-CSE-MsgGUID: uCPx3pW3QgCn+hoVXHgyaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="169450568"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2025 13:31:20 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 27 Aug 2025 13:31:18 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 27 Aug 2025 13:31:18 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.60) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 27 Aug 2025 13:31:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uX0trd00SNcJiZfIgIRNh5ZYfizQjBSBdK+yzVSp8ubmjp1+qjaU0ArfHQz0HOOVtTFqV1KPj12su92/NeFq2aEBLi0QutzKBFU5ohmpWmy/JCKI396Zgp0zB7vhfvEPbxZApoH54mZQo52vhkQfs4yPx9cYDRnM4TdLEkXdXojWfxRUzR6D8lGrG4IcKQisyWHt/DPNE498bh19m7+QFCx7wUTUcwZD/eJ+szvKzeuxjF900jdnXxBWxEkEL94MHjqeMyP/sCmYKDvT0Q9TyBtVjUisSwKjU36WF3VolZPXCJhURIMwSsu0fE/xIGtFvPpMLmDP5zFtW1PrdjX5vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x4aTDv20pNsPjmlgcO5X6GKxeS7pQ7tf178H2DWF8OM=;
 b=vSoNCuN4Bzg3hsjp6+ZjETP/kRcnrLV9HphHld0MoLYyEmslNKvm0WIuhqujLFdOT1JuTJLFjNM8ZWaHM/Jq//aYTJEQipaGxUcNeTsyMUQpnpbvtgIeWN/ZYg96ESKLlzBbpfRWQEarVOgCqmJZRFKRAHlN9N/xZyKZHQn88k9VFgtnatM06jZmfYbB5hGZ9F3048ZUB22s2EYzGIYO5lhjudVmYi/ubb245A2o5tIGm3rRniZaZjipVggBOzePQJFsbQEe0ARip91ok1YleHTjlzIVRJWAjMIJQsW2ror9dwQiZTVdAUpQlDGEgEcQOkf3EmMYAbVjKJ60GDevcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by SA1PR11MB8473.namprd11.prod.outlook.com (2603:10b6:806:3a7::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Wed, 27 Aug
 2025 20:31:16 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%5]) with mapi id 15.20.9052.019; Wed, 27 Aug 2025
 20:31:16 +0000
Message-ID: <73fa9f6a-f560-470b-b353-060acf66712b@intel.com>
Date: Wed, 27 Aug 2025 22:31:11 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] drm/xe: Add error_injectable define
To: Jonathan Cavitt <jonathan.cavitt@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <saurabhg.gupta@intel.com>, <alex.zuo@intel.com>,
 <john.c.harrison@intel.com>, <matthew.brost@intel.com>
References: <20250827201405.116855-5-jonathan.cavitt@intel.com>
 <20250827201405.116855-6-jonathan.cavitt@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250827201405.116855-6-jonathan.cavitt@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR07CA0142.eurprd07.prod.outlook.com
 (2603:10a6:802:16::29) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|SA1PR11MB8473:EE_
X-MS-Office365-Filtering-Correlation-Id: 6acd679d-f67b-4e11-87ef-08dde5a8abf8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MHBDM3BNd05OSzE3VU9vRXlIbU95SkRJRnlkWjJNUUt0a09YS1piYitteW5M?=
 =?utf-8?B?Q1h0OTY5eiszNWYxUEZXNWVUOVJNWUFNb1dTemVUYmxjUzRJcENuMW1QeTRs?=
 =?utf-8?B?eUhwWWJFYUkyTlJZVzhpaDdjNmtyV25PV2RZdkpMTENCZXUzUzFJMmFETzJr?=
 =?utf-8?B?eHlNcVhRYXBHcmdyVHp5UzJoUDB4SWRhRjJYWG9xSndrcGgzdTdLRUorYlJG?=
 =?utf-8?B?MHdac3hNSFdlNGtFd1l1RGJIZDhWZHJyeUJHdHdKVFRxK2VpOUlOQ0VDcGhG?=
 =?utf-8?B?T3piaFZubU50NHcrcEhreXIvb0J0bU4zd3lyNlY1U21EQ2FyTWN2UmRsaVM2?=
 =?utf-8?B?cHM4SlhPZzE3aUVnb3d4OWxQTzlLL2JVZGR3MTlYdmo0MkpoN0Uzb2RkL2Qv?=
 =?utf-8?B?d2hTZktGSWlxYWsvL1Z3WFhJd2p3N1JLaHhSMTBOVkdFMFVHTlBaSVErWWU0?=
 =?utf-8?B?bDJEV3ZvU2RnTlVrUDkvZG43YW9yd1haZklmZmZFcXhTK0xSNkp6bG1lK2hN?=
 =?utf-8?B?S1BwS0tCYUlRVFJDRGFiZ21mT0VMTVZudmxtVkcvbTlIODljTDhKSUJoZCt5?=
 =?utf-8?B?YkJGRkVyM0tLK3gvbi8wQkZtY3RBUGdId2tnbU1uZDE3S3hHMm1rVzJwZU9X?=
 =?utf-8?B?eEt5VUJLb2dnZzZJYmFhaStxUU52MVphNWluMTVsSFRKaUE2M3FRanVKMFB1?=
 =?utf-8?B?eHpDYzVsai9Ic2Vpaks5L3RQdTdKNEJQSDh4U3pSM0FOWlJxaEV0WDlVMUdk?=
 =?utf-8?B?WVZBQURpYk43VXZLdVVxQ2xVZWI0WTdVWHQ2T2dJUGdrTE1qNFF0Sk1seVNV?=
 =?utf-8?B?SnBMZ2RwTlhTelNWZjRnbVlCNHR4SHd3Nm5ZdmZWVnRkbU9OWDhPdHViS01Q?=
 =?utf-8?B?aTRwRG9ZVHNPY2cvNm1acWlNbGc3RnJtbUhEbWlENlhZQVg1cGhpWWI2Ukl3?=
 =?utf-8?B?MDhmRUJJOWRLNEVkUHprM3AvL3VBWkhybUVGallERzNUQXgvL203NzJPQVFn?=
 =?utf-8?B?TFc1TDVPWmNKM1FIdjRKRnBSZlNyMWNPS1p5YUtPVTNBMW9kakxGMUJmczl6?=
 =?utf-8?B?UFNnRXBweUpTbEtXV1dCem5ydmh1M25LYjBBL05lSmVMY2c0ZU5LTzdLUkJM?=
 =?utf-8?B?dG9Hcm94SlRYSVVxL0hNejVsdzdIN1JXOTY1dnFaL3AxcUl6NGttWnRwZGdP?=
 =?utf-8?B?cVgzakduZTZlVUNJVTV5S1l6d0RsVmtUMmpicHNsQ2JOWmppelZMdHJOd1ZN?=
 =?utf-8?B?em1IWEg1ZGRqenhPcWpzQmVTTUFZSU5QcTU3Zmg1eks4d1FmNWxjTVJLRGo5?=
 =?utf-8?B?d2RMZWttVU5SVW93aUZaNlNmWFo2RlZadnRZS1g2UzhoZVZ5UndPV1ZJSGxF?=
 =?utf-8?B?YnFQTy8zb2E4RjdkSGxxVXJWMWVXRlAySHdoWjJSc01ibDdOV0krWU1KTU9k?=
 =?utf-8?B?ZXFNaWlQOStuSFBjQUx5cjhnd1pWcEI1MUplVDYzaDlzcUVKQkw0NWZseWk2?=
 =?utf-8?B?eTRsRG5HVFpvL09vRmJlWWcwNUlVYTE0WnA0c3JwUkJMN016YmthTjNhZUJR?=
 =?utf-8?B?aHNDOGlEZXY1R0RvR0tPZG4yOW1kU0o1UEI2Q0M5bC9uYmlpQkRVWUxpREQz?=
 =?utf-8?B?ZVVWaDNyeTl1ZHZZMmhOVU9aenJjemRuNVc1WGZrK0dHRHJNemt1N1k3ZWYy?=
 =?utf-8?B?RTUzRW1OZXFVQWtqRm00ejR4a2dyT3k1UjNhdEo3Q21xdGpoYXI4RDcxR1lW?=
 =?utf-8?B?ZFNuaUxkbXVlNkZWNXhLN2NPL29NclFNWjgxN0FSNTFoT3VaVi9YWiszM3FT?=
 =?utf-8?B?N0dGZWp0ekFEaGwyTWpvMmJjTjI5QWVDMkVLRC93R2oyZ1haNjBTcWwvM2VK?=
 =?utf-8?B?SnkvWHBMSUNNeXBoMlNWWGI2Z0x1NEpZdm5Hd2VGWGlNOHZSZTZRK3MzWCtG?=
 =?utf-8?Q?RAdybyMI/L4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V0lxWVdjRnpZTXhoVW1vNHdHR1E0RmdmVmJQQ2V1cEQxNHI4THhOL1ZNazdW?=
 =?utf-8?B?NVRjTGV5RE8xU0VUYTIwZy9kNnNWeVNuK2YxU3EwNzROWUVPSmhyTmhqZU50?=
 =?utf-8?B?bUxRcStHWEc3MnF5Wnl6WGxRU293Yno5NXdZQmcxZEEyNTdoVmFKeTAzVXFk?=
 =?utf-8?B?elRBemJYV1hkaXBNYnhyY0tXcHhIMXpvZSsyYUN6NFFxcnpnSldhMmVOV09r?=
 =?utf-8?B?YmtvaUhONTZpQnRIeW4xcmxja3Z0TUl5ZGw4SFd4bCtYNE4xZHhMN3hid0FZ?=
 =?utf-8?B?REhXWUdMVUhycVVRMklGeUJ5YnMyYkxFTUlJSXRva0xNWml3S1lmNlZNYyti?=
 =?utf-8?B?NFdsK2p1UEh0d29UQU1aR2VEaWtCdHFaQjMxWlcrTjJaSnZLdzlidlV5cnEw?=
 =?utf-8?B?VEkwejBIMWtEcEhZTGdaSnhZMHViWFNwSmJuQit0K2FxeUlLaXdzOU5tNmI4?=
 =?utf-8?B?RzExejFMMmN3cWdwNisyOCtnam14SkREK2dqems1MTJZcUNnRW4vNkttb0xN?=
 =?utf-8?B?dGxWSXB5bUpHbXpxamdBeVpnNC9lMDJxUGdnbVNiRDVjRnF0RkFmS3E2MWJp?=
 =?utf-8?B?dVpnYkR3TEo2b1lmUmhHcnVHZnZoYjJtbVhiN0x1QjdvcW1jWGtmZnVnWE9p?=
 =?utf-8?B?bSsxRDR5Rmd4VjUvb2pWdmpIQmdHT2pJdFpnemNTc1NZTVgvak5jUDRzWWda?=
 =?utf-8?B?Tkx3UlprZlZQVVJRMlU1L2MwWWNVYnRIdHluY2x0WEx4MkNyVlI2SFN6NTgr?=
 =?utf-8?B?dTRwQVBnMlNvVktmVEhEVCtZQkk3d3dobjBsNFRBT1pnTFlXNElPbk85VDlq?=
 =?utf-8?B?K1c4WWV1ZmFlZjAvMjgzNzRoVmFvMjVvZ3hRVUw4WVRCSGhkS1lzd1AzSUcy?=
 =?utf-8?B?VjZ6TGJCUWlPa25Ba1MxWm0xYjVRY256R0pTTnVmSzRuZlVIOXplOFRNMHk2?=
 =?utf-8?B?UTBJSXNmZjRLQU82cUdEOTNzVzltblRkQmZwYWZPckFJa3NYUWF0YUpqem5V?=
 =?utf-8?B?eHdWQXJoQjdNbGs3ZWwxSzFWYnlKdCtSU0JINlluL1FNdGJUUnRKVlArL1Yz?=
 =?utf-8?B?OExkR2dmMkRVWlpRUjlsai9DUndJK3J1ZjV0U1NtalNaVHJjcE9hZHI1aUVl?=
 =?utf-8?B?aVh2YmorRUYrVExLeDQ3RllNcWpYS2VPbk50RnJZcjlWTm5uRlVwM0xpK3dV?=
 =?utf-8?B?RTJrWUxPZG44RXo5cmpHbUZMb1VSZitORmgwdExnV01UWGdOSk0wb2lOZklP?=
 =?utf-8?B?amVyRU83ZWNWYUM5aGZCajRleGhMQ0NPWlMzTGcwbjdHNFNYRXhsUGxmZk1C?=
 =?utf-8?B?ZDVnUjVZVStDSHFBeFhMZFp4ZjV4aHdBR1JRUk5INVhxQWlIZDlvODRUenpD?=
 =?utf-8?B?ZDNER3UyL3g3K0UvTE9sd2F2VTh2bjJvVk96TS96Uzk1a0Mza2FjR09Demdn?=
 =?utf-8?B?bCt1SVFwUlEzdW9pTnM1aGdxQzM0WW14VnRDek8yOHorbDlCUkhLbXZiQ3VE?=
 =?utf-8?B?S3NueVh5dFhrV0ovUHdyQjg4VFNsL0JLaWxRekg4MFEyMzhBZ0pTRENyZzlW?=
 =?utf-8?B?RmtCSUJTU3JWbEk1ZUwxNlhsditDeFU2SmxEVWgxc01uY2pZSkFBM3N5RHBo?=
 =?utf-8?B?MTZzbVFXMXZRdzN4SWs5S0E2UklqUDBWOElQOVI4azBOd0YvV0orZUJ3SWNa?=
 =?utf-8?B?M203NnF3TGsrMnppNjNobW80T0RJTXcwNHB1NDk5QUVQNHcxd3VsMlh1d2tY?=
 =?utf-8?B?TWJ4SkFrNFp1VDMrZzBxK2NtVStjTjlseHNwdzhiMkFjbVVzalFXV1RUUmlo?=
 =?utf-8?B?QUh0WFl4b3REQ0xKZjBNRXJzWnJ2b3hPdWR1K3pOaUpwTjZxek5RNUZLU0xj?=
 =?utf-8?B?TFFHQnhwa0NZcjY0SExGQmFtSTNVOGJnTnhDS0JXMkMxaHV0QlNhcm9RQVI3?=
 =?utf-8?B?NitXenNPdnk1cEt3bm5WdXN2ZXlZcVcyeXlFcWJSUTNOQWZkT1hQQWplZU1V?=
 =?utf-8?B?WkNqenh1ckphb1hWOWNlOURhSHhScUVjdmM1RXFNVkVKWEZqNjMzOHNwTDkr?=
 =?utf-8?B?QmdUcnNZRjlqbU43aHlEbm9NS0Y5bGY2WklzUElnVzVDa2pIM01OMVdUNXdl?=
 =?utf-8?B?YVRadFRMdFpheXNqNnFYeFpReXUvRXByR0JzRlpXaTBFMkZodU9tWjAzZElx?=
 =?utf-8?B?ZVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6acd679d-f67b-4e11-87ef-08dde5a8abf8
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 20:31:16.0457 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HOWFSAzAHtZXw9pb8TLM8U4zp8Gb7RLuRXMii6RFUTkCsBqkHPUW/XwrM998gZK9GRUlvYvru3qvbULFRtugcN+p2rJCQkVZ9wNVaxzCJ7Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8473
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



On 8/27/2025 10:14 PM, Jonathan Cavitt wrote:
> Add a declaration for the function attribute "error_injectable", which
> appends noinline to functions tagged with ALLOW_ERROR_INJECTION only if
> CONFIG_FUNCTION_ERROR_INJECTION is enabled.
> 
> error_injectable is a function attribute that is applied to
> all functions that have ALLOW_ERROR_INJECTION enabled.  This
> is necessary to ensure the compiler doesn't optimize the
> target function into an inline function, as inline functions
> cannot be injected with faults.  Adding the noinline attribute
> prevents this issue, but it's not necessary to prevent inlining
> if error injection is disabled, so error_injectable is only set
> to noinline if error injection is enabled.
> 
> It's likely the case that not all functions with error
> injection enabled need this additional security, but to be safe
> (and for the sake of consistency), it's applied to all
> ALLOW_ERROR_INJECTION functions.
> 
> v2:
> - Move error_injectable from error-injection.h to xe_macros.h
>   (Michal)
> - Reformat function attribute application to minimize diff size (Brost)
> 
> v3: (Michal)
> - Improve explanation for error_injectable
> - Update Michal's name
> 
> Suggested-by: Matthew Brost <matthew.brost@intel.com>
> Suggested-by: John Harrison <john.c.harrison@intel.com>
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
...

> diff --git a/drivers/gpu/drm/xe/xe_macros.h b/drivers/gpu/drm/xe/xe_macros.h
> index 8a77c2423555..05dcc72fe318 100644
> --- a/drivers/gpu/drm/xe/xe_macros.h
> +++ b/drivers/gpu/drm/xe/xe_macros.h
> @@ -19,4 +19,25 @@
>  	cond__;								\
>  })
>  
> +/*
> + * error_injectable is a function attribute that is applied to
> + * all functions that have ALLOW_ERROR_INJECTION enabled.  This
> + * is necessary to ensure the compiler doesn't optimize the
> + * target function into an inline function, as inline functions
> + * cannot be injected with faults.  Adding the noinline attribute
> + * prevents this issue, but it's not necessary to prevent inlining
> + * if error injection is disabled, so error_injectable is only set
> + * to noinline if error injection is enabled.
> + *
> + * It's likely the case that not all functions with error
> + * injection enabled need this additional security, but to be safe
> + * (and for the sake of consistency), it's applied to all
> + * ALLOW_ERROR_INJECTION functions.
> + */

this could be simpler/shorter:

/*
 * This function attribute should be used by all functions which are
 * tagged as ALLOW_ERROR_INJECTION to ensure they will not be inlined
 * by the compiler which would actually prevent an error injection.
 *
 * XXX: there is no regular "xe" prefix as we hope to promote this.
 */

your long story can be just in the commit message

> +#ifdef CONFIG_FUNCTION_ERROR_INJECTION
> +#define error_injectable noinline
> +#else
> +#define error_injectable
> +#endif
> +
>  #endif
