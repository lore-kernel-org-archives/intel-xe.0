Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 107B6C83F1B
	for <intel-xe@archiver.kernel.org>; Fri, 11 Jul 2025 15:02:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB9C910E2A7;
	Fri, 11 Jul 2025 15:02:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GSVJKsKh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A4F410E2BF
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Jul 2025 15:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752246161; x=1783782161;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=OlUMBYQV6pbjNPTXCOFVkKYwIQ34cPzPGBnje3mf8tI=;
 b=GSVJKsKhoZIRYOfobYgNdHlfnQYTHrsTr1AQCQZrClS7zWGCuepR551v
 iA8G8pHZlvfQG+EIYMd8C/X2SVZUizgxxMGpVDXZxJY+TZtwWkpLCSBkh
 +j9JHEl8iE7hr5wWKzNB5H8TKpmX1vlk+FGhxtqwYNz8ndMwsod5SSAJj
 v9UW+YLMsOc8q1F62sseXjeW+W0rpG7Q8BCRmWiK7fP58sFYEY8/Mr/BT
 2EE/dtJbR+bdIrMVf3S3cZ3BDH7Zy7lRH0EzX+il/JWDmFbSdu/Q55a+7
 XjirpGDf17EOXps02KEPn9VuPpr9oYKYopL6Hb1B4HtkB/+dvTAXnuntv w==;
X-CSE-ConnectionGUID: KybbDUxRQVepdDaKouw+pw==
X-CSE-MsgGUID: jRLwf+nbT12j6x66vnLkSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="54704568"
X-IronPort-AV: E=Sophos;i="6.16,303,1744095600"; d="scan'208";a="54704568"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2025 08:02:41 -0700
X-CSE-ConnectionGUID: dMVnrkO/RQapnWJXWdZDxQ==
X-CSE-MsgGUID: skWT7iakR4Se5oiuWaSYVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,303,1744095600"; d="scan'208";a="162072125"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2025 08:02:41 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 11 Jul 2025 08:02:39 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 11 Jul 2025 08:02:39 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (40.107.95.71) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 11 Jul 2025 08:02:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XoQabFjVxW8ios6QAAxGTBKQWUwMtQ+oKZyAe64PPglvCT0d8xQQHK/vIEYZmSz8wN6+5zbQEZ+LkjVIfOgZeNXf3hSdzD9WbQBl9ENueDJcAKDqTRUcwLmw+ebUFtTYSpD4zsY7Ge8F3YI5QCnwy14lf50SRbnCmqlCfbiR2yalSqFsr+J9jePdPTxdFTkLGqSSghtMmn8zdeY0MIlbY/xfGh7jSlLnGEArxKBeLv2TeErxsKhBgEvVfgz90ovnXWMIN3Dcm+lx+hx2UsGsNvyKWCXGQxF5fk1l0Tsw5cl/LsNjyj5A3LWE3rwytN3IufClPGWcIB36eUSVbh/eOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OlUMBYQV6pbjNPTXCOFVkKYwIQ34cPzPGBnje3mf8tI=;
 b=HaRri3ylAK0ZQqOpTo8LZqg3GTonDA/pKSXj3VLmK4BFxOYx7QV4lZAAKYj9WnlT92/CRTt8WpO054XYXYCfSNxYqYvGu3cAXmzpD8iv+1AgKCwgj/M0QwdxyU7E0+0ZeZXUNyg681rduiePiEwhodZAWRYZ3ylsLcbiy0XvcbzgooD6I6d3L8vldoT9SNxcBPQHkaR2ZNIYTVrE0b4RUeKv7XTnNDjxoxM8PtxwFGi+NIEqbK7J+FSa+caJqrg2UJR8OwmTUgBaJGr4J2LO022ECWbaGnleWG/kLIwIrD9dPUBbkfee35bedOzevwlhYUBEcTttMeqjMuCAwtmkBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 SA2PR11MB5003.namprd11.prod.outlook.com (2603:10b6:806:11e::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8901.29; Fri, 11 Jul 2025 15:02:36 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%3]) with mapi id 15.20.8922.025; Fri, 11 Jul 2025
 15:02:36 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "K V P, 
 Satyanarayana" <satyanarayana.k.v.p@intel.com>
CC: "Brost, Matthew" <matthew.brost@intel.com>, "Wajdeczko, Michal"
 <Michal.Wajdeczko@intel.com>, "Auld, Matthew" <matthew.auld@intel.com>
Subject: Re: [PATCH] drm/xe: Improve VF provision stability with fault
 injection
Thread-Topic: [PATCH] drm/xe: Improve VF provision stability with fault
 injection
Thread-Index: AQHb8lrUCZ/oL5bxFE+Pw9toD/8LlLQtBPWA
Date: Fri, 11 Jul 2025 15:02:36 +0000
Message-ID: <bee9b61fc61a2eabfa2baa3e182b2c6744355b2b.camel@intel.com>
References: <20250711115135.1113303-1-satyanarayana.k.v.p@intel.com>
In-Reply-To: <20250711115135.1113303-1-satyanarayana.k.v.p@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|SA2PR11MB5003:EE_
x-ms-office365-filtering-correlation-id: 4e4250d8-5deb-4a20-554b-08ddc08bf8fd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?cUNLWGxNcHNwYXJlZWtIQitMelJ1WHc3OVFnR2dPWEVTRW9hL0pKZ2lXSGlM?=
 =?utf-8?B?L2Y1NTUwdHJLaXV4RHkrT1BCaXpnWE9MeGFpRVlDSGwrektBc0sySUZFUy9v?=
 =?utf-8?B?Z2taTUN4NmhaNld5QlZaSUlQbHI4WGxEaTlFWjJWblNDdFhRVHE0UjlvaWtX?=
 =?utf-8?B?OWtMKzA3aEF1UUxhWndocGxXaU96UlVQdi9TM0JvdFpYNGkrdElWZ1VvQ1JZ?=
 =?utf-8?B?Rk56U1FndlA4K1owc2VWak9IcDlSSm5LQ3NCUk5XSnU1MC9BVmNyMVIydjZy?=
 =?utf-8?B?bXFlUmxhMENlbDEyWUhSM2ZTNDBVaUY1RlBPUkZRYmJoQmJHemFkZ1dvVE9S?=
 =?utf-8?B?Q2hvU0J2R2pBallmQ0tsM1VKZGREOXc1OC9jdi96TnVmMlRuZWxOOFJmeGxm?=
 =?utf-8?B?OW9YUGhhU04ySDA3dXJHdjJTVmJTVlJRY21ZMmExLzZ3MGF3TXgrWVVNOWhS?=
 =?utf-8?B?OVRYeWdwaXBjczNNVHEveXlXVWR6SkRsQkE3SGFGeEZiYWx2bzBTdTNlRWk3?=
 =?utf-8?B?eVBBMEtwbENpVFNxNEhCYS8zOTBFVlhkTkorbm5TcXlubzUvUjdIU3BtZC9I?=
 =?utf-8?B?MS96cUtuNURweUhRR1hzSHovTEhsaUlZS1ZWR2xBZ05wUUY5ZHdjS0h4VUxI?=
 =?utf-8?B?SnhrQzFnSnhxbC9nbTBUUU5pdG1pUkw3ZnBHOUp1cm9OOHNGcW5OV1RiSy9W?=
 =?utf-8?B?RFlkWUFabjdYbVdjUkpoOWFTUXRIbUFpY1RMcUtiQkttdXQwUkFiNHozUnYr?=
 =?utf-8?B?d091ZWt3ZzhDUmVGUVdFdUdIQm9ZV1ljMkZrMVRxa053NkRQUThQRy9aVUJP?=
 =?utf-8?B?UWpkNHRJNVE1a2VtaW41OTZCbDkzRzhRbHAyOWJKdlZCNTRjNDljRlFJQmdH?=
 =?utf-8?B?ZEtqNzdISmNjemFVQ2d3cjE4V2NWbDErOGpXQm12Vy84bEdLaFlocXdvcis4?=
 =?utf-8?B?Z1VydEprNU5lTEpLSW1oZitVT1FZMXphTkcyVGtWcmd5dzMxdHNZTEQyNVdr?=
 =?utf-8?B?SjNRZFVZeG94NFJzdmM1cjk1cDQrRHZNTk1laStSTEttUUZhNHJKNTlKRG5M?=
 =?utf-8?B?S0NGK1dXNzNoWnlERDRRT2ljSDQyMG9obzcxSU9mTU85WWpNNmZwSVA4endF?=
 =?utf-8?B?aFdJNjZTWXRBcStERlRWKzFYZlRCWGFybi9hTDc5and3c0pEU0lvUzdsS0Qw?=
 =?utf-8?B?aEJoRW5zemFBaE4xS3VLTGUrSC91cEsrcWlJOFZCSTlMaW4vdWRCZFFGZGIv?=
 =?utf-8?B?NDZmNlhNblFhbGlpdjk1dHJVeFVUVm5zNjNWV2ltQndJalNFL0RmaXg3azdE?=
 =?utf-8?B?VDcvdjU3Z1ZLWGtvTmxtc1VWNjBGMW9CR09CVnY4YjFQNUM0Y0pZbmZ0T29n?=
 =?utf-8?B?RmpyNVFRQlZTYzlZUGh3eDhyWUNzSTgvaWpPWDRDNzV5eGNZcTNNYllieEcz?=
 =?utf-8?B?c1FrMUtHMHFjMW92WnhiQXorNTU4Mmg1U1hkQmVPVmMwWVMveEliREtML0tK?=
 =?utf-8?B?eHd3YWV4NkowZVBIcHNDODRrdkcrdDBDMFJiSE9WSVhtbVJkeFY4VnJacGVw?=
 =?utf-8?B?RElrYjhDdmNpV1crZnBoaVpndW5vVkE0cUJ2L2Z6NlZ5Z1FYdzlYNHdjNi93?=
 =?utf-8?B?Z2VTQzJzOWhMVzZJeXpGTjZEMTk5TGRUTFhNL0JtcDBMWHZzdjZPcXdrQ2RL?=
 =?utf-8?B?WE4zd1B1UU52bGR6K2VRMGhJb0JlblhMWEZuWkdmSWY3elZvV2w4SGlrc3d2?=
 =?utf-8?B?dkxWeW1RbzJjcXZqVVJ1UGZ2TC9menFZM25ER3NYLzRtSjhDL1JvUS9RRHho?=
 =?utf-8?B?TCtPUjYyTzJML3BaaWt0Znp5WGZtODdBWXpwSS91UHErK2VRMG9hZUFIbEMr?=
 =?utf-8?B?Rjk4enZQdTVzTk96dGkzTmdoRmFZY2dDSWNZcEdBeGNqTVJYOEFkWVU2d3Nz?=
 =?utf-8?B?QjBDT3Z6QThNbW51K0lUZ1ZITTN3TGtFMTJKdU9hNHdQWXdacGNOMDd6cmtN?=
 =?utf-8?Q?S9MV5bWOCfWZIVOl2sG+UbaAGJJF3g=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YVVZd2hEWS9GT0FVRTVsQkoxUmlNQ0Y5Q1A1MkwvUjAyaldtaVBjeUlWaUxS?=
 =?utf-8?B?WDFIekVzdW1kZmkvMG1UTzBXNmJNTmdheGw0SEFSNlBmd25FZVZSNzRYcm5Z?=
 =?utf-8?B?WHZ5VjVMWUNjZkNwaHU5Rks2clJNckQwTzFQN0RiQjJ3bzFqVWRvRmlpUXp0?=
 =?utf-8?B?aStnUEg1R1dMYnc3UE90cElpdzZqd25UeStnd00yelJmcUFsMXdadlJtZUs3?=
 =?utf-8?B?c1Z3MTZtdWFPTTNDZ1BTdGZkbFlwN0svUXhXSnZ5Wng2ZVBSdjJOaWdWM2pY?=
 =?utf-8?B?Rm1aMk1BRk54aDRmZ21HZitBaWdUQkFpUU9CYnVySkxsL1JyaDNjYmZqdUwx?=
 =?utf-8?B?RUxtQjVJYUVOeFhsQVhXYXpWQXE3NDlCcHdITERxZEtmekJLQmZGM3hMaU5D?=
 =?utf-8?B?L3paaTdoa1A1RllaNE9kdkJ3TnFCSTJpNHVkdTkyVUhsQ05pVllEQjJOdHU1?=
 =?utf-8?B?OHQ2RG5CRjZUZStENHRKcC9lT3JKQXJSNnRQbENBdmdIalR1QW56eFlVQ0U0?=
 =?utf-8?B?a3BnMk4rN3Q3Z2pVNHpQUytTMVdqYXdGejZkWDd0b0xYVExhU2s2cktEQ1Rz?=
 =?utf-8?B?b2oyRUh6YnN2T0d0azh1cW16Z0tWQkJSUitrR0FNYlRYS05lSS9SRGgvUkpM?=
 =?utf-8?B?d0R5Vjl6UlFNeXUzK0VldkJmU3ltQk90Q25GQTJOQVNFVm1UUlpzS3daY0R0?=
 =?utf-8?B?QzE3ZEFyRExuRXc0Z2FZSUExOFZTcnhYbXJLdkRrTFg0ejBoMFFIemtsbGxh?=
 =?utf-8?B?aVRUZUMzbEZxOGVQaTNUV1NoWlVMMm5DWWczbjdveFhNV1puTmNpYW0wR2dk?=
 =?utf-8?B?QkxzeUlQOEhNUTdyMVVQNkJ6akhmcHZpclRGdFdOQUFMeGdFLyszV08zVmJu?=
 =?utf-8?B?RzV3Q1l6c3Z0a3BzLzk2dE1vVk81dnNrQUVMNkFNUzlRenNUVnNua1NsVWI0?=
 =?utf-8?B?MDZEdjQ0S28zRVYzTzZkVU4wUTVDaU11RXozMHlVS21zRE5GOTk1QVNVaXlz?=
 =?utf-8?B?aEMwS0s0QUxyYzNZVUVYTXZVMWgwc0FyVEhvWUM5VitHdTR1a2Y0NGk4V3g0?=
 =?utf-8?B?RWYyalhBT2dUZ2NVQk1POTdoWTk3c3Z5Wnh2NUg0c1dqZmdPd0ZzL2NLNmUx?=
 =?utf-8?B?dDJhZDREbVliNmlxR3lpR3o2Z0duam5EUzU4MVN2dS9lNWZHWXY2MzdpakZn?=
 =?utf-8?B?RVZ6TEM4SjNSV2hzYVc4bEFsMDZhZ0VqVWY4ZDBYdEUxWGh4MkVpencyZzZU?=
 =?utf-8?B?Vmd0ZVU3N3JNYTMra0tzcmF5aG5YMmFPTzdnWjRyR1pyVmlrUmdBOVp1ZTNU?=
 =?utf-8?B?c3pzYkJHeDAraWEvZHdUKzIzd085YitpS1FxRjgrUko1c2cwRjFjYTExSVQ5?=
 =?utf-8?B?cHlVTW0ra1NpUzQvMEpIU1JkTVdJRHV6N2k4M2NmRDBxR0ZyNURoM2tTSklC?=
 =?utf-8?B?RVdpb2FnMk5NSlM5TVJBaiswMVNDdlRIMWRPNWhPNXozWlJUT0E1ZzhHMlBY?=
 =?utf-8?B?UjhOR2FSN045QXJaMStua3NMZElZSmVGaENFNzAyMUFCNUVwOTNLNXo5MTIx?=
 =?utf-8?B?QWVlT1ZtWDB3NGJxNGRoUWxoUU94QzIxem83TnM0ZlRUR3p4b1JTN3BodWll?=
 =?utf-8?B?M2lwbk81U0QzeFd4NVpkZytmRWRRTk1Ea213b2NHUXhCWVZXR3krbkpXY2NK?=
 =?utf-8?B?ck5ZUDV3KzFObG5tZUp4MElHUUFoOEJTTCtKZnpyNVczWE10enZ6RlJ1VnJu?=
 =?utf-8?B?TjVYT3lranNVdjR3dUJRWXRvV1hYZE1qWWhEVU1QU2tQOGc1NWZEbXZSSC9X?=
 =?utf-8?B?Tm1MY1BXQkRXMHpkVDJIakxuM0dNQytnQ1p4TFpQM240UFVnQktuS2U0TDl5?=
 =?utf-8?B?MS9wZ1JWSk9rRzcrR0ZHK29oclpKamJsamlnNVUvVzlWek5QNUpiNGIvMElx?=
 =?utf-8?B?anJGQWpNR3N5TnorS0Jma1JtUURjSUltUmwvSi9YQ1hDODdFVFlGckV0RGIy?=
 =?utf-8?B?SDg0QzVoenMxSE9kTC9qK2RTdlJZRGRvVmtLT0NWTTdXZWlpbHVRSXdjaUNE?=
 =?utf-8?B?YWJlM0JXSXZSb05abDlsRDBPQ2dqNjAwSk9nMXRuOUVScGxQc2preUVDWHJZ?=
 =?utf-8?B?UlpHdWd3czB3UFFOanptSVl3eTZ6QkFVTlpLMHdlN0RXSUQvWnV2Qk9GYk53?=
 =?utf-8?B?NGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <063857A743E86442AC2E758E7473103A@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e4250d8-5deb-4a20-554b-08ddc08bf8fd
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jul 2025 15:02:36.6546 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8be8Oexgxw9sixzCkLsNEGGc9aTxnAL19SBpYl6UAIAW21bipIKql4TtL8noojGpN5/Skj9NBWuT7dvb/nt+o9KLp/sYXZWeUWaOrFor6No=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5003
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

T24gRnJpLCAyMDI1LTA3LTExIGF0IDExOjUxICswMDAwLCBTYXR5YW5hcmF5YW5hIEsgViBQIHdy
b3RlOgo+IEluIHVubGlrZWx5IGV2ZW50LCBkdWUgdG8gUEYgbWFsZnVuY3Rpb24gb3IgbWlzY29u
ZmlndXJhdGlvbiwgVkYgbWF5Cj4gcmVjZWl2ZSBpbmNvbXBsZXRlIG9yIGludmFsaWQgY29uZmln
dXJhdGlvbiBhbmQgaXQgbXVzdCBiZSBwcmVwYXJlZAo+IHRvIGhhbmRsZSBzdWNoIGNhc2VzIHdp
dGhvdXQgY2F1c2luZyBhIGNyYXNoLgo+IAo+IFdoZW4gc2ltdWxhdGluZyBlcnJvcnMgd2l0aCB0
aGUga2VybmVsJ3MgZmF1bHQgaW5qZWN0aW9uIGZyYW1ld29yaywKPiBjcmFzaGVzCj4gd2VyZSBv
YnNlcnZlZCBkdXJpbmcgZGV2aWNlIHVuYmluZC4gVGhlc2UgY3Jhc2hlcyB3ZXJlIHByaW1hcmls
eSBkdWUKPiB0byB0aGUKPiB1c2Ugb2YgdGhlIFhFX0JPX0ZMQUdfR0dUVF9JTlZBTElEQVRFIGZs
YWcgd2hlbiBjcmVhdGluZyBidWZmZXIKPiBvYmplY3RzLgo+IAo+IFRoZSBHR1RUIGlzIGludmFs
aWRhdGVkIHVzaW5nIENUQiwgd2hpY2ggaXMgYWxsb2NhdGVkIHdpdGggdGhlCj4gWEVfQk9fRkxB
R19HR1RUX0lOVkFMSURBVEUgZmxhZy4gSG93ZXZlciwgdGhlIGJ1ZmZlciBvYmplY3QgZm9yIENU
Qgo+IGlzCj4gZnJlZWQgYmVmb3JlIEdHVFQgaW52YWxpZGF0aW9uIGNvbXBsZXRlcywgbGVhZGlu
ZyB0byBjcmFzaGVzLgo+IAo+IFNpbWlsYXJseSwgZm9yIGJ1ZmZlciBvYmplY3RzIGFsbG9jYXRl
ZCBpbiBtZW1pcnFfYWxsb2NfcGFnZXMoKSBhbmQKPiBfX3hlX3NhX2JvX21hbmFnZXJfaW5pdCgp
LCB0aGUgQ1RCIGlzIGFscmVhZHkgZnJlZWQgYnkgdGhlIHRpbWUgR0dUVAo+IGludmFsaWRhdGlv
biBvY2N1cnMsIHJlc3VsdGluZyBpbiBzeXN0ZW0gY3Jhc2hlcy4KPiAKPiBUbyBwcmV2ZW50IHRo
ZXNlIGlzc3VlcywgdGhlIFhFX0JPX0ZMQUdfR0dUVF9JTlZBTElEQVRFIGZsYWcgaXMgbm8KPiBs
b25nZXIKPiB1c2VkIHdoZW4gY3JlYXRpbmcgYnVmZmVyIG9iamVjdHMgaW4gbWVtaXJxX2FsbG9j
X3BhZ2VzKCksCj4gX194ZV9zYV9ib19tYW5hZ2VyX2luaXQoKSBhbmQgeGVfZ3VjX2N0X2luaXQo
KS4KCk9rIHNvIHRoZSBpZGVhIGhlcmUgaXMgdGhhdCB0aGVzZSBhbGxvY2F0aW9ucyBhcmUgaGFw
cGVuaW5nIG9uY2UgZHVyaW5nCmRyaXZlciBsb2FkIChvciBhZnRlciByZXNldCkgYW5kIG5vdCBh
Z2FpbiB1bnRpbCB0aGUgQk8gaXMgY29tcGxldGVseQpkZS1hbGxvY2F0ZWQvcmUtYWxsb2NhdGVk
IGFuZCBzbyB3ZSBkb24ndCBuZWVkIHRvIGFjdHVhbGx5IGlzc3VlIGFuCmludmFsaWRhdGlvbiBz
aW5jZSB3ZSBhbHdheXMgYWxsb2NhdGUgdGhlIGJ1ZmZlciBmcm9tIHNjcmF0Y2ggd2hpY2gKd291
bGQgcHJlc3VtYWJseSBmbHVzaCB0aGUgVExCcyBhdCB0aGF0IHRpbWU/IElzIHRoYXQgcmlnaHQ/
CgpIb25lc3RseSB0aGlzIGZlZWxzIHJpc2t5IHRvIG1lLiBXaHkgY2FuJ3Qgd2UganVzdCBjaGVj
ayB0aGF0IHRoZQpidWZmZXIgaXMgc3RpbGwgYWxpdmUgd2hlbiBkb2luZyB0aGUgaW52YWxpZGF0
aW9uIGFuZCBpZiBub3QsIHNraXAgaXQ/ClRoYXQgd2F5IHdlIGFyZW4ndCBicmVha2luZyBleGlz
dGluZyBmdW5jdGlvbmFsaXR5IGFuZCBzdGlsbCBoYW5kbGluZwp0aGUgZXJyb3IgY2FzZS4KClRo
YW5rcywKU3R1YXJ0Cgo+IAo+IFNpZ25lZC1vZmYtYnk6IFNhdHlhbmFyYXlhbmEgSyBWIFAgPHNh
dHlhbmFyYXlhbmEuay52LnBAaW50ZWwuY29tPgo+IENjOiBNaWNoYWwgV2FqZGVjemtvIDxtaWNo
YWwud2FqZGVjemtvQGludGVsLmNvbT4KPiBDYzogTWF0dGhldyBCcm9zdCA8bWF0dGhldy5icm9z
dEBpbnRlbC5jb20+Cj4gQ2M6IE1hdHRoZXcgQXVsZCA8bWF0dGhldy5hdWxkQGludGVsLmNvbT4K
PiAtLS0KPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfY3QuYyB8IDEgLQo+IMKgZHJpdmVy
cy9ncHUvZHJtL3hlL3hlX21lbWlycS5jIHwgMSAtCj4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVf
c2EuY8KgwqDCoMKgIHwgMSAtCj4gwqAzIGZpbGVzIGNoYW5nZWQsIDMgZGVsZXRpb25zKC0pCj4g
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfY3QuYwo+IGIvZHJpdmVy
cy9ncHUvZHJtL3hlL3hlX2d1Y19jdC5jCj4gaW5kZXggMjNlOGMxNTUwMjVlLi5mMzIxMDM4MTFk
MDAgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19jdC5jCj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19jdC5jCj4gQEAgLTI1OCw3ICsyNTgsNiBAQCBpbnQg
eGVfZ3VjX2N0X2luaXQoc3RydWN0IHhlX2d1Y19jdCAqY3QpCj4gwqDCoMKgwqDCoMKgwqDCoGJv
ID0geGVfbWFuYWdlZF9ib19jcmVhdGVfcGluX21hcCh4ZSwgdGlsZSwgZ3VjX2N0X3NpemUoKSwK
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFhFX0JPX0ZMQUdfU1lTVEVNIHwKPiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIFhFX0JPX0ZMQUdfR0dUVCB8Cj4gLcKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIFhFX0JPX0ZMQUdfR0dUVF9JTlZBTElEQVRFCj4gfAo+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAKPiBYRV9CT19GTEFHX1BJTk5FRF9OT1JFU1RPUkUpOwo+IMKgwqDCoMKgwqDCoMKg
wqBpZiAoSVNfRVJSKGJvKSkKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldHVy
biBQVFJfRVJSKGJvKTsKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX21lbWly
cS5jCj4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfbWVtaXJxLmMKPiBpbmRleCA0OWM0NWVjM2U4
M2MuLjY3OGI3OGY0MjEzMiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfbWVt
aXJxLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfbWVtaXJxLmMKPiBAQCAtMTgwLDcg
KzE4MCw2IEBAIHN0YXRpYyBpbnQgbWVtaXJxX2FsbG9jX3BhZ2VzKHN0cnVjdCB4ZV9tZW1pcnEK
PiAqbWVtaXJxKQo+IMKgwqDCoMKgwqDCoMKgwqBibyA9IHhlX21hbmFnZWRfYm9fY3JlYXRlX3Bp
bl9tYXAoeGUsIHRpbGUsIGJvX3NpemUsCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBYRV9C
T19GTEFHX1NZU1RFTSB8Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBYRV9CT19GTEFHX0dH
VFQgfAo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBYRV9CT19GTEFHX0dHVFRfSU5WQUxJREFU
RQo+IHwKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFhFX0JPX0ZMQUdfTkVFRFNfVUMgfAo+
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAKPiBYRV9CT19GTEFHX05FRURTX0NQVV9BQ0NFU1Mp
Owo+IMKgwqDCoMKgwqDCoMKgwqBpZiAoSVNfRVJSKGJvKSkgewo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0veGUveGVfc2EuYyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9zYS5jCj4gaW5k
ZXggMWQ0M2UxODNjYTIxLi5lMTFlZDBhMWVkMTMgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX3NhLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfc2EuYwo+IEBAIC02
MCw3ICs2MCw2IEBAIHN0cnVjdCB4ZV9zYV9tYW5hZ2VyCj4gKl9feGVfc2FfYm9fbWFuYWdlcl9p
bml0KHN0cnVjdCB4ZV90aWxlICp0aWxlLCB1MzIgc2l6ZSwgdTMKPiDCoMKgwqDCoMKgwqDCoMKg
Ym8gPSB4ZV9tYW5hZ2VkX2JvX2NyZWF0ZV9waW5fbWFwKHhlLCB0aWxlLCBzaXplLAo+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAKPiBYRV9CT19GTEFHX1ZSQU1fSUZfREdGWCh0aWxlKSB8Cj4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBYRV9CT19GTEFHX0dHVFQgfAo+IC3CoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBYRV9CT19GTEFHX0dHVFRfSU5WQUxJREFURQo+IHwKPiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgCj4gWEVfQk9fRkxBR19QSU5ORURfTk9SRVNUT1JFKTsKPiDCoMKgwqDC
oMKgwqDCoMKgaWYgKElTX0VSUihibykpIHsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoGRybV9lcnIoJnhlLT5kcm0sICJGYWlsZWQgdG8gcHJlcGFyZSAldUtpQiBCTyBmb3IgU0EK
PiBtYW5hZ2VyICglcGUpXG4iLAoK
