Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB2FCC3ABD8
	for <intel-xe@archiver.kernel.org>; Fri, 16 May 2025 07:44:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67E5410E9D0;
	Fri, 16 May 2025 07:44:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jNz1IvB4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7468010E9CF
 for <intel-xe@lists.freedesktop.org>; Fri, 16 May 2025 07:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747381483; x=1778917483;
 h=date:from:to:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=svMdNWg4Cz6g56iHO+sDpMifG9RsYYXKXllRvNKgWE0=;
 b=jNz1IvB4XGqJ/9+SjjU0+b3KL0bOlcke31YXD5dxJKhmFWCHEUAqxTiq
 AvSlv3noXxdzeBFpY47/Fk6zNUaQ99wDc/r98jZKc0Wcb041gChRYSsz3
 83A8lXHKfGV2vBzmBu3ChwAV2TrJyE8Cm3/A0mbkTZZGSBRuQZI++SW96
 xI5/0xAOSQkh+QQnWBxk1m31yQMh0Bg1RZwkJQuGeS8nIY2w77i/K45bM
 vJNefN3fVBbv8wPjDZjKCO8BbVkkMFhyYADKE7bK+QD/J+yuV36HVyp7l
 5Xbkpw8eM8RDJ4xi62KigyA9Bd9WF+/2Au19mAYfkrhkrNHLxK+uHj+Tl w==;
X-CSE-ConnectionGUID: xc1eo0ocSUeFcXV6fmOqsw==
X-CSE-MsgGUID: c0tbvnvnRI6Axdu8wb/CnQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="49480569"
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; d="scan'208";a="49480569"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2025 00:44:43 -0700
X-CSE-ConnectionGUID: RglNwYuNQgW+MapnNZz6OQ==
X-CSE-MsgGUID: nsrG54h/SpG/o6iDGZy3Qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; d="scan'208";a="169551912"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2025 00:44:42 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 16 May 2025 00:44:41 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 16 May 2025 00:44:41 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.43) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 16 May 2025 00:44:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DohH7gVcJV8gXmSHLbLBZsdSSTpSqkxEDloBmVfS97KRmJAft9k17ZA3BMymf9EaQt/lTjyZOPPhc6uTLfbBAk/7YelIBBwx3WhT9KQw6DmNOz1etrUTLFqCrOj7TZ5QhjnSD8PNH3ydu6IkaZfqy4cJOnAHrveci7PWuj8lTWZWmnX+IyRPHjUn4Vsmvge0efUZZT82Cb4ntRiR/2ceUmC7CBPPHp96ULrU0vgTzwjBeZIdb9bsgJ1gXcrMxtTO6Uy7vgGDdKO6ipsG08lV9Ir8+zktPo3l1DAY21A1ygXtQV6Q5o5fzUHBGeFi0co2YIfgHyGboWVlr2kvpt1pFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dTZVmz+B4pkayMgPCuzMujIUvNxKfKaX7SkGBwz/D+E=;
 b=Opa9TKLu3EY7KOmSOHRbG1a4HOGg6VusXT0G8bRT4Uu9PoPjizcSYhokZxZOj0fyEcUcDC/CZx+DJbYCJkbBJQ1o4yk7k8HT4tKegvpisPBYNH3ODwOI66C/w3UobO3NH9tAyRZH9m2LcjFx7KgRGTuHGcJ0Am54nnjQuQGTur3Xp/hZGKojs3eljAa6yQSSJYDDIpS8AHbaLlA0eVxd3g16N88U3B9Wo+xzBPASr4++phPKE9H3v7fg9m8YS83+zR7RTnrt7cklUdFJxoQ4byK+3t7ycOxaCPxnBeJKmePrFzDaanNFX23Dg5QEjUfhAVIC44HJS1WcPgjCPC1Hhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by DM6PR11MB4674.namprd11.prod.outlook.com (2603:10b6:5:2a0::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.31; Fri, 16 May
 2025 07:44:37 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%5]) with mapi id 15.20.8722.027; Fri, 16 May 2025
 07:44:37 +0000
Date: Fri, 16 May 2025 09:44:34 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZ1bGw6IGZhaWx1cmUgZm9yIGRybS94ZS9w?=
 =?utf-8?Q?f=3A_Don't_allow_LME?= =?utf-8?Q?M?= provisioning if LMTT isn't
 available on the device (rev4)
Message-ID: <20250516074434.gczcrxaebk6bjmto@intel.com>
References: <20250513071321.700464-1-piotr.piorkowski@intel.com>
 <174720492117.77415.5003353411003470709@c664b1dc75d1>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <174720492117.77415.5003353411003470709@c664b1dc75d1>
X-ClientProxiedBy: VI1P189CA0027.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:802:2a::40) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|DM6PR11MB4674:EE_
X-MS-Office365-Filtering-Correlation-Id: faab5ffe-0cff-48bd-784a-08dd944d821c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|366016|376014|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZUJEYzNBeEs0WTJ3SExDUkdIdnBwVlZ6K21RVUxrRXFxUWVHOWk0bGtqNGFK?=
 =?utf-8?B?b3J3bHJ2Z3dEUy9pbHlSYThPZDVJcjQ3ajdJU3lLUlBpOVhtWU82ZVZEMGcw?=
 =?utf-8?B?ZyswWkRMa1l3UnhSZjJKcVZsUHN6MHFpMDZiWnFOYVRBNWJjQUMzVnJLMGVD?=
 =?utf-8?B?bGxuT2g0SHZuUkx0WldPVkpKT3U0OG1EVWMxU0p5bjdHYkhRbDVmOThzVkto?=
 =?utf-8?B?VzBvUk9OL0ZUODJkeVpNYS9uQy94Z3ZRODYyeFg4MXcrWHRlUExEWTlINktI?=
 =?utf-8?B?dE9ENkVxMUFnRWM5dW5qeGIrT3BqaFpGVWtaVjd5RmZrV29JZDhZZFRQNnJE?=
 =?utf-8?B?OG9LNEFIYStHejRXU1hzYjdWdm8xNkxRZGR2c1p6ZWZRTFhLOUsxNERiV3Z2?=
 =?utf-8?B?ZUt3SFhheThXdTNoaEU3bHJRMjB5MGJLbWdLeXpYMnREb1dIenZPcnpPZ1VW?=
 =?utf-8?B?MGMyM2p5cHdlWUdIUko0dlpIS2xUenhabDBIZEhBMUhLQlBVN1hxME04bFBL?=
 =?utf-8?B?bHkyWHB2MENtSks1RElsTUFmZm03V2lOVTcrZVZsSWZWbG0waFNTam5CeVdV?=
 =?utf-8?B?Y0dxNzV1SVJacE9lV2tiYkQxdVRjMFZ5Tlh5VVh0emE4THBHUDN5ZUFrWk5m?=
 =?utf-8?B?dDZscnZRMG02VHFGTEpVc1VZRWdiOGcvdEFnTU5BQitTVGI0M1piTERyZ2JU?=
 =?utf-8?B?bmlkdWU3N1VhSjQ5cHRwS0NyTXkwUTFXL0RGNnNPdnlFQnRVRHovYkNHRUpE?=
 =?utf-8?B?VEM3cSt1RUduSWNKb1hndFU4bVhldnFpZ1VoNEs4WVBuaG5mU1hYcW16QWNY?=
 =?utf-8?B?V3ZtYVRuZnpGZU1IUEYwQmNXRldpQ0JBeXNCY2M4WDNUMHora1RFTUgxTzFD?=
 =?utf-8?B?QTk0WVNZQ2h1a1JhTndvR0QrYTN5ZlFsNGlIdlFFaGUwY0kwKzFNZXl4Qzla?=
 =?utf-8?B?Sm9hZ1NzZ3Vod3lBMVl4eGZHUjJGNHlFcFNHVDA4MHVyam9MdFZ0Lzh5Rm1s?=
 =?utf-8?B?ZzJadkJJeVAyM1M5TnF4VlczWU9rUDZWSmh6Z2R6OUFTeFZ1WnY4eVd6NXJN?=
 =?utf-8?B?U1VIc2ZtQ25QOWZtSVlHZmMvRzVIZ1Fmd1FpMkxpNWszYUdjYTRDOGpZVjQz?=
 =?utf-8?B?WUE3ZGo3QmFyN0NzMzNiTVBJQ0FpUkowSkF1cjl1TlM4QUwvblVBeGxNc3FQ?=
 =?utf-8?B?Z0IyT2UweSttT2lrRHlHeHBwRzA4akpKRE5CZEdPSVdkQ2J5Mk1rZVZqZXFO?=
 =?utf-8?B?dTYweHdWWUVHZldlWE56ZUNINXprdTdrMERnOHBLTnRsUjBhaXV3bnVSUFds?=
 =?utf-8?B?WHF1aEtVWmlWNnp2RHoyRGc3WXZBRktaekZKQzNwRWZ1N25MVklpTktWK3R1?=
 =?utf-8?B?Z0oyYm9mN3RYZjdCbW9CcUFqUmhxbTd2WS9jdGRGRTlVWStXWmpLVFlHVGZu?=
 =?utf-8?B?Mm53ZENiWkZCMUozQmp6MHkzWDRTV2JnRUpKMmI2cmE2WTluUFZYMktncmk1?=
 =?utf-8?B?aXY1STNBUDErRlcyVDRVcUZZSW1idXlzMGNaaE1aUDRkWHVhUExER1kvYXpz?=
 =?utf-8?B?Y2JMdHh5bzBVMU5HZ3VpU1RtcitKL3JHTGtSWTJ2NVF6MzZVMkxXbVQxVnpW?=
 =?utf-8?B?cUpadGRwY3Z2Z0JKbHNoNnNXd08zMC9iMVJMNkV6ZTRJejhyMSs1ZWJSZEhy?=
 =?utf-8?B?L2d2NDc4My96VkdQREF5N2RBUmNLaDZvUS9YT3lBcU0veUpFSTQ0MERQYWtI?=
 =?utf-8?B?YmZnTXltSjV0dkJiaHdTbnJYWDJ4MGhRTlFHWGwrejRLMldxRHhMaDZHaEZo?=
 =?utf-8?Q?3/ijkId8PKpoQ9mOjtTsRXUPRNOWD+CkKnd3Y=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(13003099007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dnNFZXBEbDhOZXlXQVRMcFd3YUNQVWJtTU5wc2hBbXd4a2wwdWtWVGVhMlMx?=
 =?utf-8?B?cjRSZ1NML0YySURoS2pPKytmSkN5T0FDOW40bDZwc1ZrVWxlRGMyYi9IUlEx?=
 =?utf-8?B?bElTb0xVaVBzamptSDc0ZWpHaVhpMTBEUWFkb3czRmhYelpKN2I0TS9DN1JV?=
 =?utf-8?B?Y1AzS1ZLQTdVdlkveStDZGU2Z1BacGRjYkQrOGVFM3B2RWVORmJzdEVTRmFa?=
 =?utf-8?B?ZTZZYUpCQmt6RU8vUDdxYmNJL1JXVXYyVGM1ZTdtN2xrVWxGUmlWcVJZd2ZC?=
 =?utf-8?B?M3NoZFBncFIrQkVSTW9Nc29jbDU4VmdBUW54dHE2L2lLQVdRVEYwVUJxdk5Z?=
 =?utf-8?B?WGp4Y2t2WTlkWDc2OGRXTStCczBPTS8yL0w1Z2dFcWJrLzc1cVFQblZmWXFB?=
 =?utf-8?B?ZFhscFY0aThPMFlOV3VKK3gxMlN1dHIxY3JaZnBRaHRRUEtleWhCK0U5alZ3?=
 =?utf-8?B?S20ydWpLVExVcHFhNWw1RVRRM3A2UHAzM2l4VFJrQjh0VnQ2bjVqcUhZN3I2?=
 =?utf-8?B?NHpSL1VYQUtScGNidkV2Y0VSRGpWMC9Dc0RDKzh4ZDBDbEtJQ0R0SXpCeGdp?=
 =?utf-8?B?eTVDV0pKWUtaSmZpR1BVbmZsSE1Na09hNnJ6WVh5WXlpajNaMW93d2JhSnhM?=
 =?utf-8?B?VHV6TXVjY3I0dVhVQWZzWkJGY0ZKU3BlR2gvR2VUd3NpaVJWNFdUSGhGcWhE?=
 =?utf-8?B?M1VOKzhnQ295U3JNcTNEYkdDcUltaDNLZVpVd1NHc2ZVMWpYNmlsWFFYUkZs?=
 =?utf-8?B?VklyVXhCZ3JudmNPM1grd0FGcFR1Qk9mZGpMWnV2L3UxeHlJRVVTRkplZWJx?=
 =?utf-8?B?NDJSUkZWd3lCRTh5RkhXQlU4Wmc2eEdsdkM2MVM0Zkhsb0ZyMFduc2JJNWNI?=
 =?utf-8?B?TDNMbENlakQrYWFzMnp2RTNpVXlzS004bWpWbEY3UFBXSDhXNy9FM3VCNjdX?=
 =?utf-8?B?a2dlS0pOWnd6bXd4Z1Zqd3N0Ym53djJiQmFLdWRIemMydnlFTzlpeG8vTDRn?=
 =?utf-8?B?ZnpZczdLY1IxVDk5UjFJSkFSNEYvelFmK3dnNDNwaU1PV2F6RDk5bWdsekQz?=
 =?utf-8?B?T1l2VXlzT2luRFVHeVJuZXpESklxVlpacjcrSUxUMFFmWHZVR1djRWg5UHhr?=
 =?utf-8?B?VFk1bXZLVE5Cdk5lTkZjWEh2Z0pOQmQwT3B2UjRhWDdxY3RVR2VlQUhZRXpO?=
 =?utf-8?B?OFBHcHNBVGlKcjVSa3pLL0NwOGlFWGpKd05yRWRTWU1vVlRqV1E1a1Rxb0Iw?=
 =?utf-8?B?VVNZNlBTMURreTd6eFliVjltMFVobjRDb0ZnTGpnbkdFZnMrV2pjNUYvVXdJ?=
 =?utf-8?B?aUVDdVJzUFVXdlJhTlNyMUljQmtJQXFEelNEd21IOUtZNXpUeFdJUGhDNU1Q?=
 =?utf-8?B?OG5jSFg5NVVOKzlBQU03dWdNa3ZqbzFuM3A0UkpoRmRWN3BIa2NWTmVFcnlH?=
 =?utf-8?B?MlVqV0N5MTk5dGt3YURXcE15bDRuMXIvNE4yMVRVQ0pvUmh0SmZYRkhWaUJq?=
 =?utf-8?B?dTdSajkyNXlERnZPSU9CNTlKSXhNdzNNYmxIQi9rQ2trUDUyRmlBZ2pqUHlY?=
 =?utf-8?B?amh0dWMvTFgxb1hWTjBLQ1RsY2VoYkZ2a05jazBZeEVLc1pyRGx0bFBZTnh3?=
 =?utf-8?B?NGV1NmVPL000ZncrWk1teW43Nko3WEZUTU1LWW1MRFRiNjEreGZLdTFjL1pv?=
 =?utf-8?B?WE5zek1rNTllTFNIbG1pcWQzQngrQ2RuNzV0N25qeWFTQWtLM1ltdldkRVdI?=
 =?utf-8?B?U25uR0NybEY2anlham92TkUwRnhsa3JQc25KVGI3c09mNkJzRUI5N0YvR2R4?=
 =?utf-8?B?azQzZ05uNVRja09hU1AzSDZUK0IwUjhLNCtMWUt6QTNVYXpidTdIQ202YWo4?=
 =?utf-8?B?RDJzaGZnM0lRVFdCd0pLaGJkN1BuYmVVa0l1TXRqMFBlN1VrbENlZzZlYzA3?=
 =?utf-8?B?YmJMRk9zVzA2Qy9ZZU9VdEhKbXQvRi8rWUpFUTRha3JmS1liUTV1VW1ia2xu?=
 =?utf-8?B?aDJDdFB4Z25RVjZGbUF6dDFpZ0NkM215M0JocHZqU2F4RlFEWEsvaUhDbk9F?=
 =?utf-8?B?aGJhdi90bnNqMysyYVQ4anZrUDdLMmYzbTRmcDBmRWJOZkFveDFYQytrYytZ?=
 =?utf-8?B?eEY2aDdoUzNCKzNZVmxzcHp0M1ZrTTdQUk51OSsrRmpxeUxvOHArZlFBbzQ2?=
 =?utf-8?B?emc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: faab5ffe-0cff-48bd-784a-08dd944d821c
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2025 07:44:37.7112 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4TIh9KESrWRRkMQEA2qtQPqxlva8nTXZTdYqaDMpUMItEIryUMYPkOCO93uuxVugFdxOlqHADf83GRlZmyyP3nrFD+jeO0bzLZdhgXJ30S0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4674
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

Patchwork <patchwork@emeril.freedesktop.org> wrote on =C5=9Bro [2025-maj-14=
 06:42:01 +0000]:
> =3D=3D Series Details =3D=3D
>=20
> Series: drm/xe/pf: Don't allow LMEM provisioning if LMTT isn't available =
on the device (rev4)
> URL   : https://patchwork.freedesktop.org/series/146941/
> State : failure
>=20
> =3D=3D Summary =3D=3D
>=20
> CI Bug Log - changes from xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a7429=
7_FULL -> xe-pw-146941v4_FULL
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
>=20
> Summary
> -------
>=20
>   **WARNING**
>=20
>   Minor unknown changes coming with xe-pw-146941v4_FULL need to be verifi=
ed
>   manually.
>  =20
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-146941v4_FULL, please notify your bug team (I915-ci=
-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in=
 CI.
>=20
>  =20
>=20
> Participating hosts (4 -> 4)
> ------------------------------
>=20
>   No changes in participating hosts
>=20
> Possible new issues
> -------------------
>=20
>   Here are the unknown changes that may have been introduced in xe-pw-146=
941v4_FULL:
>=20
> ### IGT changes ###
>=20
> #### Warnings ####
>=20
>   * igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
>     - shard-dg2-set2:     [SKIP][1] ([Intel XE#4208]) -> [ABORT][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9d=
a3d8af23f7067f7f4e5a74297/shard-dg2-464/igt@xe_fault_injection@probe-fail-g=
uc-xe_guc_ct_send_recv.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-dg=
2-435/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html

<3> [99.633872] xe 0000:03:00.0: [drm] *ERROR* GT0: GuC PC query task state=
 failed: -EINVAL
<3> [99.633961] xe 0000:03:00.0: probe with driver xe failed with error -22
<3> [101.948396] xe 0000:03:00.0: [drm] *ERROR* GT0: TLB invalidation fence=
 timeout, seqno=3D10 recv=3D9
<3> [104.249618] xe 0000:03:00.0: [drm] *ERROR* GT0: TLB invalidation fence=
 timeout, seqno=3D11 recv=3D9
<7> [105.785883] xe 0000:00:02.0: [drm:intel_hdmi_detect [xe]] [CONNECTOR:2=
62:HDMI-A-1]
<7> [105.799054] xe 0000:00:02.0: [drm:xe_gt_resume [xe]] GT0: resuming
<7> [105.800260] xe 0000:00:02.0: [drm:xe_reg_sr_apply_mmio [xe]] GT0: Appl=
ying GT save-restore MMIOs
<7> [105.800761] xe 0000:00:02.0: [drm:xe_reg_sr_apply_mmio [xe]] GT0: REG[=
0x9424] =3D 0xfffffffc
<7> [105.801263] xe 0000:00:02.0: [drm:xe_reg_sr_apply_mmio [xe]] GT0: REG[=
0x9550] =3D 0x000003ff
<7> [105.801754] xe 0000:00:02.0: [drm:xe_reg_sr_apply_mmio [xe]] GT0: REG[=
0x1c3f10] =3D 0x00400000
<7> [105.802231] xe 0000:00:02.0: [drm:xe_reg_sr_apply_mmio [xe]] GT0: REG[=
0x1d3f10] =3D 0x00400000
<7> [105.802693] xe 0000:00:02.0: [drm:xe_wopcm_init [xe]] WOPCM: 2048K
<7> [105.803203] xe 0000:00:02.0: [drm:xe_wopcm_init [xe]] GuC WOPCM is alr=
eady locked [592K, 1420K)
<7> [105.806219] xe 0000:00:02.0: [drm:xe_guc_ads_populate [xe]] GT0: Updat=
ed ADS capture size 32768 (was 36864)
<7> [105.807237] xe 0000:00:02.0: [drm:__xe_guc_upload [xe]] GT0: load stil=
l in progress, timeouts =3D 0, freq =3D 1300MHz (req 1500MHz), status =3D 0=
x00000072 [0x39/00]
<7> [105.807642] xe 0000:00:02.0: [drm:__xe_guc_upload [xe]] GT0: load stil=
l in progress, timeouts =3D 0, freq =3D 1300MHz (req 1500MHz), status =3D 0=
x000000C0 [0x60/00]
<7> [105.808031] xe 0000:00:02.0: [drm:__xe_guc_upload [xe]] GT0: init took=
 0ms, freq =3D 1300MHz (req =3D 1500MHz), before =3D 1300MHz, status =3D 0x=
8002F0EC, timeouts =3D 0
<7> [105.808731] xe 0000:00:02.0: [drm:xe_guc_ct_enable [xe]] GT0: GuC CT c=
ommunication channel enabled
<5> [105.809275] FAULT_INJECTION: forcing a failure.
name fail_function, interval 0, probability 100, space 0, times -1
<3> [105.809521] xe 0000:00:02.0: [drm] *ERROR* GT0: GuC PC query task stat=
e failed: -EINVAL
<3> [105.809984] xe 0000:00:02.0: [drm] *ERROR* GT0: resume failed (-EINVAL=
)
<7> [105.810687] xe 0000:00:02.0: [drm:intel_power_well_enable [xe]] enabli=
ng always-on
<7> [105.816136] xe 0000:00:02.0: [drm:intel_hdmi_detect [xe]] [CONNECTOR:2=
72:HDMI-A-2]
<7> [105.821122] xe 0000:00:02.0: [drm:intel_dp_detect [xe]] [CONNECTOR:276=
:DP-1]
<7> [105.826171] xe 0000:00:02.0: [drm:intel_hdmi_detect [xe]] [CONNECTOR:2=
85:HDMI-A-3]
<7> [105.831135] xe 0000:00:02.0: [drm:intel_dp_detect [xe]] [CONNECTOR:289=
:DP-2]
<7> [105.836112] xe 0000:00:02.0: [drm:intel_hdmi_detect [xe]] [CONNECTOR:2=
97:HDMI-A-4]
<7> [105.841162] xe 0000:00:02.0: [drm:intel_hdmi_detect [xe]] [CONNECTOR:2=
62:HDMI-A-1]
<7> [105.846107] xe 0000:00:02.0: [drm:intel_hdmi_detect [xe]] [CONNECTOR:2=
72:HDMI-A-2]
<7> [105.851145] xe 0000:00:02.0: [drm:intel_dp_detect [xe]] [CONNECTOR:276=
:DP-1]
<7> [105.856149] xe 0000:00:02.0: [drm:intel_hdmi_detect [xe]] [CONNECTOR:2=
85:HDMI-A-3]
<7> [105.861107] xe 0000:00:02.0: [drm:intel_dp_detect [xe]] [CONNECTOR:289=
:DP-2]
<7> [105.866100] xe 0000:00:02.0: [drm:intel_hdmi_detect [xe]] [CONNECTOR:2=
97:HDMI-A-4]
<7> [105.871100] xe 0000:00:02.0: [drm:intel_power_well_disable [xe]] disab=
ling always-on
<3> [106.553149] xe 0000:03:00.0: [drm] *ERROR* GT0: TLB invalidation fence=
 timeout, seqno=3D12 recv=3D9
<7> [106.892746] xe 0000:00:02.0: [drm:xe_gt_suspend [xe]] GT0: suspending
<3> [108.856669] xe 0000:03:00.0: [drm] *ERROR* GT0: TLB invalidation fence=
 timeout, seqno=3D13 recv=3D9
<3> [111.160217] xe 0000:03:00.0: [drm] *ERROR* GT0: TLB invalidation fence=
 timeout, seqno=3D14 recv=3D9
<3> [113.463813] xe 0000:03:00.0: [drm] *ERROR* GT0: TLB invalidation fence=
 timeout, seqno=3D15 recv=3D9
<3> [115.767496] xe 0000:03:00.0: [drm] *ERROR* GT0: TLB invalidation fence=
 timeout, seqno=3D16 recv=3D9
<7> [116.023392] xe 0000:00:02.0: [drm:intel_hdmi_detect [xe]] [CONNECTOR:2=
62:HDMI-A-1]
<3> [118.071104] xe 0000:03:00.0: [drm] *ERROR* GT0: TLB invalidation fence=
 timeout, seqno=3D17 recv=3D9
<3> [120.374774] xe 0000:03:00.0: [drm] *ERROR* GT0: TLB invalidation fence=
 timeout, seqno=3D18 recv=3D9
<3> [122.678461] xe 0000:03:00.0: [drm] *ERROR* GT0: TLB invalidation fence=
 timeout, seqno=3D19 recv=3D9
<3> [124.982132] xe 0000:03:00.0: [drm] *ERROR* GT0: TLB invalidation fence=
 timeout, seqno=3D20 recv=3D9
<3> [127.285831] xe 0000:03:00.0: [drm] *ERROR* GT0: TLB invalidation fence=
 timeout, seqno=3D21 recv=3D9
<3> [129.589534] xe 0000:03:00.0: [drm] *ERROR* GT0: TLB invalidation fence=
 timeout, seqno=3D22 recv=3D9
<1> [129.598572] BUG: unable to handle page fault for address: ffffc901bc54=
0008
<1> [129.598593] #PF: supervisor read access in kernel mode
<1> [129.598606] #PF: error_code(0x0000) - not-present page
<6> [129.598619] PGD 100000067 P4D 100000067 PUD 0=20
<4> [129.598636] Oops: Oops: 0000 [#1] SMP NOPTI
<4> [129.598652] CPU: 9 UID: 0 PID: 4450 Comm: xe_fault_inject Tainted: G  =
   U              6.15.0-rc6-xe+ #1 PREEMPT(voluntary)=20
<4> [129.598675] Tainted: [U]=3DUSER
<4> [129.598683] Hardware name: Micro-Star International Co., Ltd. MS-7D25/=
PRO Z690-A DDR4(MS-7D25), BIOS 1.10 12/13/2021
<4> [129.598700] RIP: 0010:h2g_write+0xc9/0x840 [xe]
<4> [129.599049] Code: 89 df e8 ca 08 fd ff 45 0f b6 b7 e0 00 00 00 41 80 f=
e 01 0f 87 a7 d0 1e 00 41 83 e6 01 49 8b 87 d8 00 00 00 0f 84 15 02 00 00 <=
8b> 48 08 85 c9 0f 85 fe 04 00 00 48 89 df e8 94 08 fd ff 45 0f b6
<4> [129.599076] RSP: 0018:ffffc90007c87498 EFLAGS: 00010002
<4> [129.599089] RAX: ffffc901bc540000 RBX: ffff888110190000 RCX: 000000000=
0000000
<4> [129.599102] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 000000000=
0000000
<4> [129.599114] RBP: ffffc90007c87560 R08: 0000000000000000 R09: 000000000=
0000000
<4> [129.599126] R10: 0000000000000000 R11: 0000000000000000 R12: 000000000=
0000003
<4> [129.599138] R13: 00000000000001ff R14: 0000000000000001 R15: ffff88812=
4c913d0
<4> [129.599151] FS:  000074cf9d362940(0000) GS:ffff88890b396000(0000) knlG=
S:0000000000000000
<4> [129.599166] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
<4> [129.599178] CR2: ffffc901bc540008 CR3: 00000001915db000 CR4: 000000000=
0f52ef0
<4> [129.599192] PKRU: 55555554
<4> [129.599200] Call Trace:
<4> [129.599208]  <TASK>
<4> [129.599217]  ? lock_acquire+0xc4/0x2f0
<4> [129.599234]  ? __guc_ct_send_locked+0x127/0x1050 [xe]
<4> [129.599573]  __guc_ct_send_locked+0x17e/0x1050 [xe]
<4> [129.599912]  ? lock_acquire+0xc4/0x2f0
<4> [129.599926]  ? xe_device_assert_mem_access+0x1e/0x170 [xe]
<4> [129.600224]  ? lock_is_held_type+0xa3/0x130
<4> [129.600241]  guc_ct_send_locked+0x8b/0x6d0 [xe]
<4> [129.600536]  ? __mutex_lock+0xaa/0xed0
<4> [129.600547]  ? __mutex_lock+0x7c0/0xed0
<4> [129.600564]  xe_guc_ct_send_locked+0x19/0x60 [xe]
<4> [129.600843]  ? mutex_lock_nested+0x1b/0x30
<4> [129.600855]  send_tlb_invalidation+0xb4/0x450 [xe]
<4> [129.601124]  ? mark_held_locks+0x46/0x90
<4> [129.601139]  ? _raw_spin_unlock_irq+0x27/0x70
<4> [129.601154]  xe_gt_tlb_invalidation_ggtt+0x15e/0x2e0 [xe]
<4> [129.601414]  ? find_held_lock+0x31/0x90
<4> [129.601425]  ? ggtt_node_remove+0xbf/0x100 [xe]
<4> [129.601691]  xe_ggtt_invalidate+0x3a/0xb0 [xe]
<4> [129.601948]  ggtt_node_remove+0xe9/0x100 [xe]
<4> [129.602197]  xe_ggtt_node_remove+0x40/0xa0 [xe]
<4> [129.602375]  xe_ggtt_remove_bo+0x87/0x240 [xe]
<4> [129.602474]  ? _raw_write_unlock+0x22/0x50
<4> [129.602479]  ? drm_vma_offset_remove+0x65/0x80
<4> [129.602485]  xe_ttm_bo_destroy+0xe2/0x350 [xe]
<4> [129.602581]  ? lock_is_held_type+0xa3/0x130
<4> [129.602587]  ttm_bo_release+0x6d/0x330 [ttm]
<4> [129.602596]  ? lock_acquire+0xc4/0x2f0
<4> [129.602600]  ? find_held_lock+0x31/0x90
<4> [129.602605]  ttm_bo_put+0x3c/0x70 [ttm]
<4> [129.602613]  xe_gem_object_free+0x6c/0x80 [xe]
<4> [129.602708]  drm_gem_object_free+0x1a/0x40
<4> [129.602713]  xe_bo_put+0x196/0x230 [xe]
<4> [129.602807]  ? xe_bo_put+0x94/0x230 [xe]
<4> [129.602901]  __xe_bo_unpin_map_no_vm+0x49/0x70 [xe]
<4> [129.602995]  devm_action_release+0x12/0x30
<4> [129.603000]  release_nodes+0x3a/0x120
<4> [129.603004]  devres_release_all+0x96/0xd0
<4> [129.603010]  device_unbind_cleanup+0x12/0x80
<4> [129.603014]  really_probe+0x1ba/0x3c0
<4> [129.603018]  __driver_probe_device+0x8c/0x180
<4> [129.603023]  device_driver_attach+0x57/0xd0
<4> [129.603027]  bind_store+0x77/0xd0
<4> [129.603032]  drv_attr_store+0x21/0x50
<4> [129.603036]  sysfs_kf_write+0x4a/0x80
<4> [129.603041]  kernfs_fop_write_iter+0x166/0x220
<4> [129.603046]  vfs_write+0x27e/0x540
<4> [129.603053]  ksys_write+0x6f/0xf0
<4> [129.603058]  __x64_sys_write+0x19/0x30
<4> [129.603062]  x64_sys_call+0x2bf/0x2660
<4> [129.603067]  do_syscall_64+0x91/0xdd0
<4> [129.603071]  ? do_readlinkat.part.0+0xa6/0x170
<4> [129.603076]  ? trace_hardirqs_off+0x5a/0xd0
<4> [129.603082]  ? syscall_exit_to_user_mode+0x95/0x260
<4> [129.603087]  ? clear_bhb_loop+0x15/0x70
<4> [129.603091]  ? clear_bhb_loop+0x15/0x70
<4> [129.603095]  ? clear_bhb_loop+0x15/0x70
<4> [129.603099]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
<4> [129.603103] RIP: 0033:0x74cf9f51c574
<4> [129.603107] Code: c7 00 16 00 00 00 b8 ff ff ff ff c3 66 2e 0f 1f 84 0=
0 00 00 00 00 f3 0f 1e fa 80 3d d5 ea 0e 00 00 74 13 b8 01 00 00 00 0f 05 <=
48> 3d 00 f0 ff ff 77 54 c3 0f 1f 00 55 48 89 e5 48 83 ec 20 48 89
<4> [129.603116] RSP: 002b:00007fff9093b508 EFLAGS: 00000202 ORIG_RAX: 0000=
000000000001
<4> [129.603121] RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 000074cf9=
f51c574
<4> [129.603126] RDX: 000000000000000c RSI: 00007fff9093c980 RDI: 000000000=
0000007
<4> [129.603130] RBP: 000000000000000c R08: 0000000000000073 R09: 000000000=
0000000
<4> [129.603134] R10: 0000000000000000 R11: 0000000000000202 R12: 00007fff9=
093c980
<4> [129.603139] R13: 0000000000000007 R14: 000056f6f19b2bf8 R15: 000074cf9=
f984000
<4> [129.603146]  </TASK>
<4> [129.603148] Modules linked in: mei_gsc snd_hda_codec_hdmi snd_hda_code=
c_realtek snd_hda_codec_generic snd_hda_scodec_component xe drm_gpuvm drm_g=
pusvm drm_ttm_helper ttm gpu_sched drm_suballoc_helper drm_exec drm_buddy d=
rm_display_helper cec rc_core drm_kunit_helpers i2c_algo_bit kunit overlay =
intel_rapl_msr intel_rapl_common intel_uncore_frequency intel_uncore_freque=
ncy_common x86_pkg_temp_thermal intel_powerclamp coretemp kvm_intel cmdline=
part joydev spi_nor kvm mtd mei_hdcp ee1004 hid_generic mei_pxp wmi_bmof mx=
m_wmi irqbypass polyval_clmulni polyval_generic ghash_clmulni_intel binfmt_=
misc sha256_ssse3 snd_hda_intel sha1_ssse3 snd_intel_dspcfg aesni_intel snd=
_hda_codec crypto_simd cryptd snd_hda_core usbhid rapl video snd_hwdep hid =
snd_pcm intel_cstate igc snd_timer i2c_i801 mei_me i2c_mux snd spi_intel_pc=
i mei i2c_smbus soundcore spi_intel intel_pmc_core nls_iso8859_1 serial_mul=
ti_instantiate pmt_telemetry pmt_class intel_vsec wmi acpi_pad acpi_tad pin=
ctrl_alderlake dm_multipath msr nvme_fabrics fuse efi_pstore
<4> [129.603201]  nfnetlink ip_tables x_tables autofs4
<4> [129.603244] CR2: ffffc901bc540008
<4> [129.603248] ---[ end trace 0000000000000000 ]---
<4> [129.858650] RIP: 0010:h2g_write+0xc9/0x840 [xe]
<4> [129.858765] Code: 89 df e8 ca 08 fd ff 45 0f b6 b7 e0 00 00 00 41 80 f=
e 01 0f 87 a7 d0 1e 00 41 83 e6 01 49 8b 87 d8 00 00 00 0f 84 15 02 00 00 <=
8b> 48 08 85 c9 0f 85 fe 04 00 00 48 89 df e8 94 08 fd ff 45 0f b6
<4> [129.858774] RSP: 0018:ffffc90007c87498 EFLAGS: 00010002
<4> [129.858779] RAX: ffffc901bc540000 RBX: ffff888110190000 RCX: 000000000=
0000000
<4> [129.858784] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 000000000=
0000000
<4> [129.858788] RBP: ffffc90007c87560 R08: 0000000000000000 R09: 000000000=
0000000
<4> [129.858792] R10: 0000000000000000 R11: 0000000000000000 R12: 000000000=
0000003
<4> [129.858797] R13: 00000000000001ff R14: 0000000000000001 R15: ffff88812=
4c913d0
<4> [129.858801] FS:  000074cf9d362940(0000) GS:ffff88890b396000(0000) knlG=
S:0000000000000000
<4> [129.858806] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
<4> [129.858810] CR2: ffffc901bc540008 CR3: 00000001915db000 CR4: 000000000=
0f52ef0
<4> [129.858815] PKRU: 55555554
<6> [129.858818] note: xe_fault_inject[4450] exited with irqs disabled
<6> [129.858842] note: xe_fault_inject[4450] exited with preempt_count 1


Problem on a platform without SR-IOV. The problem is already known and is n=
ot related to my series.

Thanks,
Piotr

>=20
>  =20
> Known issues
> ------------
>=20
>   Here are the changes found in xe-pw-146941v4_FULL that come from known =
issues:
>=20
> ### IGT changes ###
>=20
> #### Issues hit ####
>=20
>   * igt@core_hotunplug@unplug-rescan:
>     - shard-bmg:          NOTRUN -> [SKIP][3] ([Intel XE#4963])
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-bm=
g-8/igt@core_hotunplug@unplug-rescan.html
>=20
>   * igt@fbdev@pan:
>     - shard-dg2-set2:     [PASS][4] -> [SKIP][5] ([Intel XE#2134])
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9d=
a3d8af23f7067f7f4e5a74297/shard-dg2-434/igt@fbdev@pan.html
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-dg=
2-464/igt@fbdev@pan.html
>=20
>   * igt@fbdev@unaligned-write:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][6] ([Intel XE#2134])
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-dg=
2-464/igt@fbdev@unaligned-write.html
>=20
>   * igt@intel_sysfs_debugfs@xe-sysfs-read-all-entries:
>     - shard-dg2-set2:     [PASS][7] -> [SKIP][8] ([Intel XE#4208] / [Inte=
l XE#4618])
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9d=
a3d8af23f7067f7f4e5a74297/shard-dg2-432/igt@intel_sysfs_debugfs@xe-sysfs-re=
ad-all-entries.html
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-dg=
2-464/igt@intel_sysfs_debugfs@xe-sysfs-read-all-entries.html
>=20
>   * igt@kms_async_flips@invalid-async-flip-atomic@pipe-c-hdmi-a-1:
>     - shard-adlp:         [PASS][9] -> [DMESG-WARN][10] ([Intel XE#4543])=
 +1 other test dmesg-warn
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9d=
a3d8af23f7067f7f4e5a74297/shard-adlp-1/igt@kms_async_flips@invalid-async-fl=
ip-atomic@pipe-c-hdmi-a-1.html
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-a=
dlp-9/igt@kms_async_flips@invalid-async-flip-atomic@pipe-c-hdmi-a-1.html
>=20
>   * igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][11] ([Intel XE#4208] / [i915#2=
575]) +38 other tests skip
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-d=
g2-434/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.htm=
l
>=20
>   * igt@kms_big_fb@4-tiled-64bpp-rotate-90:
>     - shard-adlp:         NOTRUN -> [SKIP][12] ([Intel XE#1124]) +2 other=
 tests skip
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-a=
dlp-8/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html
>=20
>   * igt@kms_big_fb@linear-16bpp-rotate-270:
>     - shard-adlp:         NOTRUN -> [SKIP][13] ([Intel XE#316]) +1 other =
test skip
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-a=
dlp-8/igt@kms_big_fb@linear-16bpp-rotate-270.html
>=20
>   * igt@kms_big_fb@linear-32bpp-rotate-270:
>     - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#2231] / [Intel =
XE#4996]) +5 other tests skip
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-b=
mg-8/igt@kms_big_fb@linear-32bpp-rotate-270.html
>=20
>   * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-fli=
p:
>     - shard-adlp:         [PASS][15] -> [DMESG-FAIL][16] ([Intel XE#4543]=
)
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9=
da3d8af23f7067f7f4e5a74297/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-strid=
e-64bpp-rotate-180-hflip-async-flip.html
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-a=
dlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-fli=
p.html
>=20
>   * igt@kms_big_fb@y-tiled-addfb:
>     - shard-lnl:          NOTRUN -> [SKIP][17] ([Intel XE#1467])
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-l=
nl-4/igt@kms_big_fb@y-tiled-addfb.html
>=20
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip=
:
>     - shard-lnl:          NOTRUN -> [SKIP][18] ([Intel XE#1124]) +1 other=
 test skip
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-l=
nl-4/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.=
html
>=20
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-fl=
ip:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][19] ([Intel XE#1124]) +2 other=
 tests skip
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-d=
g2-433/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-f=
lip.html
>=20
>   * igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:
>     - shard-adlp:         NOTRUN -> [SKIP][20] ([Intel XE#2191]) +1 other=
 test skip
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-a=
dlp-8/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html
>=20
>   * igt@kms_bw@linear-tiling-2-displays-3840x2160p:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][21] ([Intel XE#367]) +1 other =
test skip
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-d=
g2-434/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html
>     - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#367])
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-b=
mg-8/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html
>=20
>   * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][23] ([Intel XE#787]) +195 othe=
r tests skip
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-d=
g2-436/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.h=
tml
>=20
>   * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs:
>     - shard-dg2-set2:     [PASS][24] -> [SKIP][25] ([Intel XE#2351] / [In=
tel XE#4208]) +6 other tests skip
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9=
da3d8af23f7067f7f4e5a74297/shard-dg2-434/igt@kms_ccs@bad-rotation-90-4-tile=
d-dg2-rc-ccs.html
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-d=
g2-464/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html
>=20
>   * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2:
>     - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#2652] / [Intel =
XE#787]) +11 other tests skip
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-b=
mg-7/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2.html
>=20
>   * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc:
>     - shard-lnl:          NOTRUN -> [SKIP][27] ([Intel XE#2887]) +2 other=
 tests skip
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-l=
nl-4/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc.html
>=20
>   * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][28] ([Intel XE#787]) +14 other=
 tests skip
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-a=
dlp-8/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-1.h=
tml
>=20
>   * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][29] ([Intel XE#455] / [Intel X=
E#787]) +9 other tests skip
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-a=
dlp-8/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1.h=
tml
>=20
>   * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc:
>     - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#2887]) +1 other=
 test skip
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-b=
mg-8/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc.html
>=20
>   * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-=
4:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][31] ([Intel XE#455] / [Intel X=
E#787]) +31 other tests skip
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-d=
g2-435/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp=
-4.html
>=20
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
>     - shard-adlp:         NOTRUN -> [SKIP][32] ([Intel XE#3442])
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-a=
dlp-8/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
>=20
>   * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:
>     - shard-lnl:          NOTRUN -> [SKIP][33] ([Intel XE#3432])
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-l=
nl-4/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html
>=20
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][34] ([Intel XE#1727] / [=
Intel XE#3113] / [Intel XE#3124])
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-d=
g2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6.html
>=20
>   * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][35] ([Intel XE#2907])
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-d=
g2-436/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
>=20
>   * igt@kms_chamelium_color@ctm-red-to-blue:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][36] ([Intel XE#306])
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-d=
g2-436/igt@kms_chamelium_color@ctm-red-to-blue.html
>=20
>   * igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k:
>     - shard-lnl:          NOTRUN -> [SKIP][37] ([Intel XE#373]) +1 other =
test skip
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-l=
nl-4/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k.html
>=20
>   * igt@kms_chamelium_frames@vga-frame-dump:
>     - shard-adlp:         NOTRUN -> [SKIP][38] ([Intel XE#373]) +1 other =
test skip
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-a=
dlp-8/igt@kms_chamelium_frames@vga-frame-dump.html
>=20
>   * igt@kms_chamelium_hpd@vga-hpd-after-hibernate:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][39] ([Intel XE#373]) +1 other =
test skip
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-d=
g2-436/igt@kms_chamelium_hpd@vga-hpd-after-hibernate.html
>=20
>   * igt@kms_content_protection@atomic@pipe-a-dp-2:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][40] ([Intel XE#1178])
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-d=
g2-432/igt@kms_content_protection@atomic@pipe-a-dp-2.html
>=20
>   * igt@kms_content_protection@dp-mst-type-1:
>     - shard-adlp:         NOTRUN -> [SKIP][41] ([Intel XE#307])
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-a=
dlp-8/igt@kms_content_protection@dp-mst-type-1.html
>=20
>   * igt@kms_content_protection@lic-type-0@pipe-a-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][42] ([Intel XE#3304])
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-d=
g2-463/igt@kms_content_protection@lic-type-0@pipe-a-dp-4.html
>=20
>   * igt@kms_content_protection@srm@pipe-a-dp-2:
>     - shard-bmg:          NOTRUN -> [FAIL][43] ([Intel XE#1178]) +1 other=
 test fail
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-b=
mg-7/igt@kms_content_protection@srm@pipe-a-dp-2.html
>=20
>   * igt@kms_cursor_crc@cursor-offscreen-128x42:
>     - shard-lnl:          NOTRUN -> [SKIP][44] ([Intel XE#1424])
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-l=
nl-4/igt@kms_cursor_crc@cursor-offscreen-128x42.html
>=20
>   * igt@kms_cursor_crc@cursor-offscreen-512x512:
>     - shard-adlp:         NOTRUN -> [SKIP][45] ([Intel XE#308])
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-a=
dlp-8/igt@kms_cursor_crc@cursor-offscreen-512x512.html
>=20
>   * igt@kms_cursor_crc@cursor-sliding-128x42:
>     - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#2320])
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-b=
mg-8/igt@kms_cursor_crc@cursor-sliding-128x42.html
>=20
>   * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
>     - shard-bmg:          [PASS][47] -> [SKIP][48] ([Intel XE#2291]) +1 o=
ther test skip
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9=
da3d8af23f7067f7f4e5a74297/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-fli=
pb-atomic-transitions.html
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-b=
mg-4/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html
>=20
>   * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-siz=
e:
>     - shard-adlp:         NOTRUN -> [SKIP][49] ([Intel XE#309])
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-a=
dlp-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-siz=
e.html
>=20
>   * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][50] ([Intel XE#323])
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-d=
g2-434/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
>     - shard-bmg:          NOTRUN -> [SKIP][51] ([Intel XE#2286])
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-b=
mg-8/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
>=20
>   * igt@kms_dp_aux_dev:
>     - shard-bmg:          [PASS][52] -> [SKIP][53] ([Intel XE#3009])
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9=
da3d8af23f7067f7f4e5a74297/shard-bmg-3/igt@kms_dp_aux_dev.html
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-b=
mg-5/igt@kms_dp_aux_dev.html
>=20
>   * igt@kms_dp_link_training@non-uhbr-mst:
>     - shard-adlp:         NOTRUN -> [SKIP][54] ([Intel XE#4354])
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-a=
dlp-8/igt@kms_dp_link_training@non-uhbr-mst.html
>=20
>   * igt@kms_fbcon_fbt@psr-suspend:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][55] ([Intel XE#776])
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-d=
g2-436/igt@kms_fbcon_fbt@psr-suspend.html
>=20
>   * igt@kms_feature_discovery@display-2x:
>     - shard-lnl:          NOTRUN -> [SKIP][56] ([Intel XE#702])
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-l=
nl-4/igt@kms_feature_discovery@display-2x.html
>=20
>   * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:
>     - shard-bmg:          [PASS][57] -> [SKIP][58] ([Intel XE#2316]) +2 o=
ther tests skip
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9=
da3d8af23f7067f7f4e5a74297/shard-bmg-7/igt@kms_flip@2x-flip-vs-absolute-wf_=
vblank-interruptible.html
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-b=
mg-4/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html
>=20
>   * igt@kms_flip@2x-flip-vs-dpms-on-nop:
>     - shard-adlp:         NOTRUN -> [SKIP][59] ([Intel XE#310]) +3 other =
tests skip
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-a=
dlp-8/igt@kms_flip@2x-flip-vs-dpms-on-nop.html
>=20
>   * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a6-dp4:
>     - shard-dg2-set2:     [PASS][60] -> [FAIL][61] ([Intel XE#301]) +2 ot=
her tests fail
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9=
da3d8af23f7067f7f4e5a74297/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vb=
lank-interruptible@ac-hdmi-a6-dp4.html
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-d=
g2-434/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a6-dp4.=
html
>=20
>   * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:
>     - shard-bmg:          [PASS][62] -> [FAIL][63] ([Intel XE#3321]) +1 o=
ther test fail
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9=
da3d8af23f7067f7f4e5a74297/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vbla=
nk-interruptible@bd-dp2-hdmi-a3.html
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-b=
mg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.ht=
ml
>=20
>   * igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:
>     - shard-bmg:          NOTRUN -> [FAIL][64] ([Intel XE#3321]) +4 other=
 tests fail
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-b=
mg-2/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html
>=20
>   * igt@kms_flip@2x-flip-vs-rmfb-interruptible:
>     - shard-lnl:          NOTRUN -> [SKIP][65] ([Intel XE#1421]) +4 other=
 tests skip
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-l=
nl-4/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html
>=20
>   * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:
>     - shard-adlp:         [PASS][66] -> [FAIL][67] ([Intel XE#2882]) +2 o=
ther tests fail
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9=
da3d8af23f7067f7f4e5a74297/shard-adlp-1/igt@kms_flip@flip-vs-absolute-wf_vb=
lank-interruptible.html
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-a=
dlp-9/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html
>=20
>   * igt@kms_flip@flip-vs-expired-vblank@a-dp4:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][68] ([Intel XE#301] / [Intel X=
E#3321]) +2 other tests fail
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-d=
g2-436/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html
>=20
>   * igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][69] ([Intel XE#301]) +3 other =
tests fail
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-d=
g2-436/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html
>=20
>   * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:
>     - shard-dg2-set2:     [PASS][70] -> [SKIP][71] ([Intel XE#4208]) +179=
 other tests skip
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9=
da3d8af23f7067f7f4e5a74297/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp=
-4tile-to-64bpp-4tile-downscaling.html
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-d=
g2-464/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.=
html
>=20
>   * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscalin=
g:
>     - shard-lnl:          NOTRUN -> [SKIP][72] ([Intel XE#1401] / [Intel =
XE#1745])
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-l=
nl-4/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling=
.html
>=20
>   * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscalin=
g@pipe-a-default-mode:
>     - shard-lnl:          NOTRUN -> [SKIP][73] ([Intel XE#1401])
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-l=
nl-4/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling=
@pipe-a-default-mode.html
>=20
>   * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling:
>     - shard-lnl:          NOTRUN -> [SKIP][74] ([Intel XE#1397] / [Intel =
XE#1745])
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-l=
nl-4/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling.ht=
ml
>=20
>   * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@p=
ipe-a-default-mode:
>     - shard-lnl:          NOTRUN -> [SKIP][75] ([Intel XE#1397])
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-l=
nl-4/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pi=
pe-a-default-mode.html
>=20
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][76] ([Intel XE#455]) +9 other =
tests skip
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-d=
g2-433/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.=
html
>=20
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscal=
ing@pipe-a-valid-mode:
>     - shard-adlp:         NOTRUN -> [SKIP][77] ([Intel XE#455]) +8 other =
tests skip
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-a=
dlp-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscal=
ing@pipe-a-valid-mode.html
>=20
>   * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][78] ([Intel XE#651]) +10 other=
 tests skip
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-d=
g2-436/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff.html
>=20
>   * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt:
>     - shard-lnl:          NOTRUN -> [SKIP][79] ([Intel XE#651]) +1 other =
test skip
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-l=
nl-4/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt.html
>=20
>   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][80] ([Intel XE#2351] / [Intel =
XE#4208]) +22 other tests skip
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-d=
g2-464/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.=
html
>=20
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
>     - shard-adlp:         NOTRUN -> [SKIP][81] ([Intel XE#656]) +15 other=
 tests skip
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-a=
dlp-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.ht=
ml
>=20
>   * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-blt:
>     - shard-adlp:         NOTRUN -> [SKIP][82] ([Intel XE#651]) +4 other =
tests skip
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-a=
dlp-8/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-blt.h=
tml
>=20
>   * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-pgflip-blt:
>     - shard-bmg:          NOTRUN -> [SKIP][83] ([Intel XE#2311])
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-b=
mg-8/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-pgflip-blt.html
>=20
>   * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-move:
>     - shard-bmg:          NOTRUN -> [SKIP][84] ([Intel XE#2231] / [Intel =
XE#4954]) +1 other test skip
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-b=
mg-8/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-move.html
>=20
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-move:
>     - shard-lnl:          NOTRUN -> [SKIP][85] ([Intel XE#656]) +9 other =
tests skip
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-l=
nl-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-move.html
>=20
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-rte:
>     - shard-adlp:         NOTRUN -> [SKIP][86] ([Intel XE#653]) +2 other =
tests skip
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-a=
dlp-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-rte.html
>=20
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render=
:
>     - shard-bmg:          NOTRUN -> [SKIP][87] ([Intel XE#2231] / [Intel =
XE#4954] / [Intel XE#4996]) +7 other tests skip
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-b=
mg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.=
html
>=20
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][88] ([Intel XE#653]) +9 other =
tests skip
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-d=
g2-433/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt.html
>=20
>   * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:
>     - shard-bmg:          NOTRUN -> [SKIP][89] ([Intel XE#2313]) +1 other=
 test skip
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-b=
mg-8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.ht=
ml
>=20
>   * igt@kms_hdr@brightness-with-hdr:
>     - shard-lnl:          NOTRUN -> [SKIP][90] ([Intel XE#3374] / [Intel =
XE#3544])
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-l=
nl-4/igt@kms_hdr@brightness-with-hdr.html
>=20
>   * igt@kms_joiner@basic-force-big-joiner:
>     - shard-bmg:          [PASS][91] -> [SKIP][92] ([Intel XE#3012])
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9=
da3d8af23f7067f7f4e5a74297/shard-bmg-3/igt@kms_joiner@basic-force-big-joine=
r.html
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-b=
mg-5/igt@kms_joiner@basic-force-big-joiner.html
>=20
>   * igt@kms_plane@pixel-format-source-clamping:
>     - shard-adlp:         NOTRUN -> [INCOMPLETE][93] ([Intel XE#1035])
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-a=
dlp-8/igt@kms_plane@pixel-format-source-clamping.html
>=20
>   * igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-0:
>     - shard-adlp:         NOTRUN -> [WARN][94] ([Intel XE#2078]) +1 other=
 test warn
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-a=
dlp-8/igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-0.html
>=20
>   * igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][95] ([Intel XE#616]) +3 other =
tests fail
>    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-d=
g2-436/igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256.html
>=20
>   * igt@kms_plane_lowres@tiling-yf:
>     - shard-lnl:          NOTRUN -> [SKIP][96] ([Intel XE#599])
>    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-l=
nl-4/igt@kms_plane_lowres@tiling-yf.html
>=20
>   * igt@kms_plane_multiple@2x-tiling-none:
>     - shard-bmg:          [PASS][97] -> [SKIP][98] ([Intel XE#4596])
>    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9=
da3d8af23f7067f7f4e5a74297/shard-bmg-7/igt@kms_plane_multiple@2x-tiling-non=
e.html
>    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-b=
mg-4/igt@kms_plane_multiple@2x-tiling-none.html
>=20
>   * igt@kms_plane_multiple@tiling-y:
>     - shard-bmg:          NOTRUN -> [SKIP][99] ([Intel XE#5020])
>    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-b=
mg-8/igt@kms_plane_multiple@tiling-y.html
>     - shard-dg2-set2:     NOTRUN -> [SKIP][100] ([Intel XE#5020])
>    [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
dg2-434/igt@kms_plane_multiple@tiling-y.html
>=20
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe=
-b:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][101] ([Intel XE#2763]) +5 othe=
r tests skip
>    [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pi=
pe-b.html
>=20
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe=
-d:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][102] ([Intel XE#2763] / [Intel=
 XE#455]) +1 other test skip
>    [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pi=
pe-d.html
>=20
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a:
>     - shard-lnl:          NOTRUN -> [SKIP][103] ([Intel XE#2763]) +3 othe=
r tests skip
>    [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
lnl-4/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a.html
>=20
>   * igt@kms_plane_scaling@planes-upscale-factor-0-25:
>     - shard-dg2-set2:     [PASS][104] -> [SKIP][105] ([Intel XE#4208] / [=
i915#2575]) +79 other tests skip
>    [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-dg2-436/igt@kms_plane_scaling@planes-upsc=
ale-factor-0-25.html
>    [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
dg2-464/igt@kms_plane_scaling@planes-upscale-factor-0-25.html
>=20
>   * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5=
:
>     - shard-bmg:          NOTRUN -> [SKIP][106] ([Intel XE#2763]) +4 othe=
r tests skip
>    [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
bmg-8/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5=
.html
>=20
>   * igt@kms_pm_dc@dc6-dpms:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][107] ([Intel XE#908])
>    [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
dg2-436/igt@kms_pm_dc@dc6-dpms.html
>=20
>   * igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][108] ([Intel XE#1489]) +2 othe=
r tests skip
>    [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
dg2-434/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html
>=20
>   * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:
>     - shard-adlp:         NOTRUN -> [SKIP][109] ([Intel XE#1489])
>    [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
adlp-8/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html
>=20
>   * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf:
>     - shard-lnl:          NOTRUN -> [SKIP][110] ([Intel XE#2893])
>    [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
lnl-4/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf.html
>=20
>   * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:
>     - shard-bmg:          NOTRUN -> [SKIP][111] ([Intel XE#1489]) +1 othe=
r test skip
>    [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
bmg-8/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.ht=
ml
>=20
>   * igt@kms_psr2_su@frontbuffer-xrgb8888:
>     - shard-lnl:          NOTRUN -> [SKIP][112] ([Intel XE#1128])
>    [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
lnl-4/igt@kms_psr2_su@frontbuffer-xrgb8888.html
>=20
>   * igt@kms_psr@fbc-pr-primary-page-flip:
>     - shard-lnl:          NOTRUN -> [SKIP][113] ([Intel XE#1406])
>    [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
lnl-4/igt@kms_psr@fbc-pr-primary-page-flip.html
>=20
>   * igt@kms_psr@pr-primary-page-flip:
>     - shard-adlp:         NOTRUN -> [SKIP][114] ([Intel XE#2850] / [Intel=
 XE#929]) +6 other tests skip
>    [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
adlp-8/igt@kms_psr@pr-primary-page-flip.html
>=20
>   * igt@kms_psr@psr2-dpms:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][115] ([Intel XE#2850] / [Intel=
 XE#929]) +2 other tests skip
>    [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
dg2-433/igt@kms_psr@psr2-dpms.html
>=20
>   * igt@kms_rotation_crc@primary-rotation-90:
>     - shard-adlp:         NOTRUN -> [SKIP][116] ([Intel XE#3414])
>    [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
adlp-8/igt@kms_rotation_crc@primary-rotation-90.html
>=20
>   * igt@kms_rotation_crc@primary-x-tiled-reflect-x-0:
>     - shard-lnl:          NOTRUN -> [FAIL][117] ([Intel XE#4689])
>    [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
lnl-4/igt@kms_rotation_crc@primary-x-tiled-reflect-x-0.html
>=20
>   * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][118] ([Intel XE#3414]) +2 othe=
r tests skip
>    [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
dg2-436/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
>=20
>   * igt@kms_sequence@get-idle:
>     - shard-bmg:          NOTRUN -> [SKIP][119] ([Intel XE#4954] / [Intel=
 XE#4996]) +22 other tests skip
>    [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
bmg-8/igt@kms_sequence@get-idle.html
>=20
>   * igt@kms_setmode@basic@pipe-b-edp-1:
>     - shard-lnl:          [PASS][120] -> [FAIL][121] ([Intel XE#2883]) +2=
 other tests fail
>    [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-lnl-8/igt@kms_setmode@basic@pipe-b-edp-1.=
html
>    [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
lnl-8/igt@kms_setmode@basic@pipe-b-edp-1.html
>=20
>   * igt@kms_tiled_display@basic-test-pattern:
>     - shard-bmg:          NOTRUN -> [SKIP][122] ([Intel XE#2426])
>    [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
bmg-8/igt@kms_tiled_display@basic-test-pattern.html
>     - shard-dg2-set2:     NOTRUN -> [FAIL][123] ([Intel XE#1729])
>    [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
dg2-434/igt@kms_tiled_display@basic-test-pattern.html
>=20
>   * igt@kms_vrr@lobf:
>     - shard-lnl:          NOTRUN -> [SKIP][124] ([Intel XE#1499])
>    [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
lnl-4/igt@kms_vrr@lobf.html
>=20
>   * igt@xe_compute@ccs-mode-basic:
>     - shard-adlp:         NOTRUN -> [SKIP][125] ([Intel XE#1447]) +1 othe=
r test skip
>    [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
adlp-8/igt@xe_compute@ccs-mode-basic.html
>=20
>   * igt@xe_copy_basic@mem-copy-linear-0x369:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][126] ([Intel XE#1123])
>    [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
dg2-436/igt@xe_copy_basic@mem-copy-linear-0x369.html
>=20
>   * igt@xe_eudebug@basic-close:
>     - shard-lnl:          NOTRUN -> [SKIP][127] ([Intel XE#4837]) +3 othe=
r tests skip
>    [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
lnl-4/igt@xe_eudebug@basic-close.html
>=20
>   * igt@xe_eudebug@basic-vm-access-parameters-userptr-faultable:
>     - shard-adlp:         NOTRUN -> [SKIP][128] ([Intel XE#4837]) +3 othe=
r tests skip
>    [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
adlp-8/igt@xe_eudebug@basic-vm-access-parameters-userptr-faultable.html
>=20
>   * igt@xe_eudebug@basic-vm-bind-ufence:
>     - shard-bmg:          NOTRUN -> [SKIP][129] ([Intel XE#4837]) +1 othe=
r test skip
>    [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
bmg-8/igt@xe_eudebug@basic-vm-bind-ufence.html
>=20
>   * igt@xe_eudebug@multiple-sessions:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][130] ([Intel XE#4837]) +4 othe=
r tests skip
>    [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
dg2-436/igt@xe_eudebug@multiple-sessions.html
>=20
>   * igt@xe_eudebug_sriov@deny-sriov:
>     - shard-adlp:         NOTRUN -> [SKIP][131] ([Intel XE#4519])
>    [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
adlp-8/igt@xe_eudebug_sriov@deny-sriov.html
>=20
>   * igt@xe_evict@evict-large-multi-vm:
>     - shard-adlp:         NOTRUN -> [SKIP][132] ([Intel XE#261] / [Intel =
XE#688]) +1 other test skip
>    [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
adlp-8/igt@xe_evict@evict-large-multi-vm.html
>=20
>   * igt@xe_evict@evict-small:
>     - shard-lnl:          NOTRUN -> [SKIP][133] ([Intel XE#688])
>    [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
lnl-4/igt@xe_evict@evict-small.html
>=20
>   * igt@xe_evict_ccs@evict-overcommit-standalone-nofree-reopen:
>     - shard-adlp:         NOTRUN -> [SKIP][134] ([Intel XE#688])
>    [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
adlp-8/igt@xe_evict_ccs@evict-overcommit-standalone-nofree-reopen.html
>=20
>   * igt@xe_exec_balancer@twice-virtual-basic:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][135] ([Intel XE#4208]) +189 ot=
her tests skip
>    [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
dg2-464/igt@xe_exec_balancer@twice-virtual-basic.html
>=20
>   * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-r=
ace:
>     - shard-bmg:          NOTRUN -> [SKIP][136] ([Intel XE#2322])
>    [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
bmg-8/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-r=
ace.html
>=20
>   * igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:
>     - shard-adlp:         NOTRUN -> [SKIP][137] ([Intel XE#1392])
>    [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
adlp-8/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html
>=20
>   * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind:
>     - shard-dg2-set2:     [PASS][138] -> [SKIP][139] ([Intel XE#1392]) +2=
 other tests skip
>    [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-dg2-433/igt@xe_exec_basic@multigpu-once-b=
indexecqueue-userptr-rebind.html
>    [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
dg2-432/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind.html
>=20
>   * igt@xe_exec_basic@multigpu-once-null:
>     - shard-lnl:          NOTRUN -> [SKIP][140] ([Intel XE#1392]) +2 othe=
r tests skip
>    [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
lnl-4/igt@xe_exec_basic@multigpu-once-null.html
>=20
>   * igt@xe_exec_fault_mode@many-execqueues-invalid-fault:
>     - shard-adlp:         NOTRUN -> [SKIP][141] ([Intel XE#288]) +7 other=
 tests skip
>    [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
adlp-8/igt@xe_exec_fault_mode@many-execqueues-invalid-fault.html
>=20
>   * igt@xe_exec_fault_mode@once-rebind-prefetch:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][142] ([Intel XE#288]) +3 other=
 tests skip
>    [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
dg2-436/igt@xe_exec_fault_mode@once-rebind-prefetch.html
>=20
>   * igt@xe_exec_system_allocator@many-free:
>     - shard-bmg:          NOTRUN -> [SKIP][143] ([Intel XE#4996]) +17 oth=
er tests skip
>    [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
bmg-8/igt@xe_exec_system_allocator@many-free.html
>=20
>   * igt@xe_exec_system_allocator@many-mmap-new-huge-nomemset:
>     - shard-bmg:          NOTRUN -> [SKIP][144] ([Intel XE#4943]) +2 othe=
r tests skip
>    [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
bmg-8/igt@xe_exec_system_allocator@many-mmap-new-huge-nomemset.html
>=20
>   * igt@xe_exec_system_allocator@many-new-bo-map:
>     - shard-adlp:         NOTRUN -> [SKIP][145] ([Intel XE#4915]) +62 oth=
er tests skip
>    [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
adlp-8/igt@xe_exec_system_allocator@many-new-bo-map.html
>=20
>   * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-new-ra=
ce-nomemset:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][146] ([Intel XE#4915]) +47 oth=
er tests skip
>    [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
dg2-436/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-new-=
race-nomemset.html
>=20
>   * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-free-=
huge-nomemset:
>     - shard-lnl:          NOTRUN -> [SKIP][147] ([Intel XE#4943])
>    [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
lnl-4/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-free-=
huge-nomemset.html
>=20
>   * igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][148] ([Intel XE#5012])
>    [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
dg2-434/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html
>     - shard-bmg:          NOTRUN -> [FAIL][149] ([Intel XE#5012])
>    [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
bmg-8/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html
>=20
>   * igt@xe_gt_freq@freq_suspend:
>     - shard-lnl:          NOTRUN -> [SKIP][150] ([Intel XE#584])
>    [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
lnl-4/igt@xe_gt_freq@freq_suspend.html
>=20
>   * igt@xe_mmap@small-bar:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][151] ([Intel XE#512])
>    [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
dg2-436/igt@xe_mmap@small-bar.html
>=20
>   * igt@xe_mmap@vram:
>     - shard-adlp:         NOTRUN -> [SKIP][152] ([Intel XE#1008])
>    [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
adlp-8/igt@xe_mmap@vram.html
>=20
>   * igt@xe_module_load@force-load:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][153] ([Intel XE#378])
>    [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
dg2-433/igt@xe_module_load@force-load.html
>=20
>   * igt@xe_module_load@reload:
>     - shard-dg2-set2:     [PASS][154] -> [FAIL][155] ([Intel XE#4208])
>    [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-dg2-436/igt@xe_module_load@reload.html
>    [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
dg2-464/igt@xe_module_load@reload.html
>=20
>   * igt@xe_oa@closed-fd-and-unmapped-access:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][156] ([Intel XE#2541] / [Intel=
 XE#3573]) +1 other test skip
>    [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
dg2-433/igt@xe_oa@closed-fd-and-unmapped-access.html
>=20
>   * igt@xe_oa@non-privileged-access-vaddr:
>     - shard-adlp:         NOTRUN -> [SKIP][157] ([Intel XE#2541] / [Intel=
 XE#3573])
>    [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
adlp-8/igt@xe_oa@non-privileged-access-vaddr.html
>=20
>   * igt@xe_oa@syncs-syncobj-wait-cfg:
>     - shard-adlp:         NOTRUN -> [SKIP][158] ([Intel XE#2541] / [Intel=
 XE#3573] / [Intel XE#4501]) +1 other test skip
>    [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
adlp-8/igt@xe_oa@syncs-syncobj-wait-cfg.html
>=20
>   * igt@xe_oa@syncs-ufence-wait-cfg:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][159] ([Intel XE#2541] / [Intel=
 XE#3573] / [Intel XE#4501])
>    [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
dg2-436/igt@xe_oa@syncs-ufence-wait-cfg.html
>=20
>   * igt@xe_peer2peer@read:
>     - shard-adlp:         NOTRUN -> [SKIP][160] ([Intel XE#1061])
>    [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
adlp-8/igt@xe_peer2peer@read.html
>=20
>   * igt@xe_pm@d3cold-basic:
>     - shard-adlp:         NOTRUN -> [SKIP][161] ([Intel XE#2284] / [Intel=
 XE#366])
>    [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
adlp-8/igt@xe_pm@d3cold-basic.html
>=20
>   * igt@xe_pm@d3cold-mmap-vram:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][162] ([Intel XE#2284] / [Intel=
 XE#366])
>    [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
dg2-436/igt@xe_pm@d3cold-mmap-vram.html
>=20
>   * igt@xe_pm@s4-basic-exec:
>     - shard-lnl:          [PASS][163] -> [ABORT][164] ([Intel XE#1794])
>    [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-lnl-7/igt@xe_pm@s4-basic-exec.html
>    [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
lnl-2/igt@xe_pm@s4-basic-exec.html
>=20
>   * igt@xe_pxp@pxp-termination-key-update-post-suspend:
>     - shard-adlp:         NOTRUN -> [SKIP][165] ([Intel XE#4733])
>    [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
adlp-8/igt@xe_pxp@pxp-termination-key-update-post-suspend.html
>=20
>   * igt@xe_query@multigpu-query-gt-list:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][166] ([Intel XE#944])
>    [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
dg2-436/igt@xe_query@multigpu-query-gt-list.html
>=20
>   * igt@xe_query@multigpu-query-pxp-status:
>     - shard-adlp:         NOTRUN -> [SKIP][167] ([Intel XE#944])
>    [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
adlp-8/igt@xe_query@multigpu-query-pxp-status.html
>=20
>   * igt@xe_query@multigpu-query-topology:
>     - shard-lnl:          NOTRUN -> [SKIP][168] ([Intel XE#944])
>    [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
lnl-4/igt@xe_query@multigpu-query-topology.html
>=20
>   * igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][169] ([Intel XE#4130]) +1 othe=
r test skip
>    [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
dg2-433/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs=
.html
>=20
>  =20
> #### Possible fixes ####
>=20
>   * igt@fbdev@read:
>     - shard-dg2-set2:     [SKIP][170] ([Intel XE#2134]) -> [PASS][171] +2=
 other tests pass
>    [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-dg2-464/igt@fbdev@read.html
>    [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
dg2-463/igt@fbdev@read.html
>=20
>   * igt@kms_async_flips@alternate-sync-async-flip:
>     - shard-bmg:          [FAIL][172] ([Intel XE#827]) -> [PASS][173] +1 =
other test pass
>    [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-bmg-1/igt@kms_async_flips@alternate-sync-=
async-flip.html
>    [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
bmg-3/igt@kms_async_flips@alternate-sync-async-flip.html
>=20
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4:
>     - shard-dg2-set2:     [INCOMPLETE][174] ([Intel XE#3862]) -> [PASS][1=
75] +1 other test pass
>    [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4=
-tiled-dg2-mc-ccs@pipe-d-dp-4.html
>    [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
dg2-436/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html
>=20
>   * igt@kms_cursor_crc@cursor-sliding-64x64:
>     - shard-dg2-set2:     [SKIP][176] ([Intel XE#4208] / [i915#2575]) -> =
[PASS][177] +76 other tests pass
>    [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-dg2-464/igt@kms_cursor_crc@cursor-sliding=
-64x64.html
>    [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
dg2-435/igt@kms_cursor_crc@cursor-sliding-64x64.html
>=20
>   * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-siz=
e:
>     - shard-bmg:          [SKIP][178] ([Intel XE#2291]) -> [PASS][179] +3=
 other tests pass
>    [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-fl=
ipa-atomic-transitions-varying-size.html
>    [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-siz=
e.html
>=20
>   * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
>     - shard-bmg:          [SKIP][180] ([Intel XE#1340]) -> [PASS][181]
>    [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-bmg-6/igt@kms_dither@fb-8bpc-vs-panel-6bp=
c.html
>    [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
bmg-7/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
>=20
>   * igt@kms_dp_linktrain_fallback@dp-fallback:
>     - shard-bmg:          [SKIP][182] ([Intel XE#4294]) -> [PASS][183]
>    [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-bmg-5/igt@kms_dp_linktrain_fallback@dp-fa=
llback.html
>    [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
bmg-7/igt@kms_dp_linktrain_fallback@dp-fallback.html
>=20
>   * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-dp2-hdmi-a3:
>     - shard-bmg:          [FAIL][184] ([Intel XE#3321]) -> [PASS][185]
>    [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vbl=
ank-interruptible@cd-dp2-hdmi-a3.html
>    [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-dp2-hdmi-a3.h=
tml
>=20
>   * igt@kms_flip@2x-plain-flip-fb-recreate:
>     - shard-bmg:          [SKIP][186] ([Intel XE#2316]) -> [PASS][187] +4=
 other tests pass
>    [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recre=
ate.html
>    [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
bmg-3/igt@kms_flip@2x-plain-flip-fb-recreate.html
>=20
>   * igt@kms_flip@2x-plain-flip-interruptible:
>     - shard-bmg:          [INCOMPLETE][188] ([Intel XE#2049]) -> [PASS][1=
89] +1 other test pass
>    [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-bmg-7/igt@kms_flip@2x-plain-flip-interrup=
tible.html
>    [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
bmg-8/igt@kms_flip@2x-plain-flip-interruptible.html
>=20
>   * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:
>     - shard-lnl:          [FAIL][190] ([Intel XE#886]) -> [PASS][191] +1 =
other test pass
>    [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-lnl-1/igt@kms_flip@flip-vs-absolute-wf_vb=
lank-interruptible.html
>    [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
lnl-4/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html
>=20
>   * igt@kms_flip@flip-vs-expired-vblank@b-edp1:
>     - shard-lnl:          [FAIL][192] ([Intel XE#301]) -> [PASS][193]
>    [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank=
@b-edp1.html
>    [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
lnl-1/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html
>=20
>   * igt@kms_flip@flip-vs-suspend-interruptible:
>     - shard-adlp:         [DMESG-WARN][194] ([Intel XE#2953] / [Intel XE#=
4173]) -> [PASS][195] +1 other test pass
>    [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-adlp-1/igt@kms_flip@flip-vs-suspend-inter=
ruptible.html
>    [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
adlp-9/igt@kms_flip@flip-vs-suspend-interruptible.html
>=20
>   * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling:
>     - shard-dg2-set2:     [SKIP][196] ([Intel XE#2351] / [Intel XE#4208])=
 -> [PASS][197] +5 other tests pass
>    [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-dg2-464/igt@kms_flip_scaled_crc@flip-32bp=
p-xtile-to-64bpp-xtile-upscaling.html
>    [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling.h=
tml
>=20
>   * igt@kms_hdr@static-swap:
>     - shard-bmg:          [SKIP][198] ([Intel XE#1503]) -> [PASS][199]
>    [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-bmg-6/igt@kms_hdr@static-swap.html
>    [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
bmg-3/igt@kms_hdr@static-swap.html
>=20
>   * igt@kms_setmode@clone-exclusive-crtc:
>     - shard-bmg:          [SKIP][200] ([Intel XE#1435]) -> [PASS][201]
>    [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-bmg-6/igt@kms_setmode@clone-exclusive-crt=
c.html
>    [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
bmg-3/igt@kms_setmode@clone-exclusive-crtc.html
>=20
>   * igt@xe_create@create-invalid-size:
>     - shard-dg2-set2:     [SKIP][202] ([Intel XE#4208]) -> [PASS][203] +1=
62 other tests pass
>    [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-dg2-464/igt@xe_create@create-invalid-size=
.html
>    [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
dg2-433/igt@xe_create@create-invalid-size.html
>=20
>   * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap:
>     - shard-dg2-set2:     [SKIP][204] ([Intel XE#1392]) -> [PASS][205] +2=
 other tests pass
>    [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-dg2-432/igt@xe_exec_basic@multigpu-many-e=
xecqueues-many-vm-basic-defer-mmap.html
>    [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
dg2-434/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap=
.html
>=20
>   * igt@xe_exec_threads@threads-hang-userptr-rebind:
>     - shard-dg2-set2:     [DMESG-WARN][206] ([Intel XE#3876]) -> [PASS][2=
07]
>    [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-dg2-433/igt@xe_exec_threads@threads-hang-=
userptr-rebind.html
>    [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
dg2-432/igt@xe_exec_threads@threads-hang-userptr-rebind.html
>=20
>   * igt@xe_fault_injection@exec-queue-create-fail-xe_exec_queue_create:
>     - shard-dg2-set2:     [ABORT][208] -> [PASS][209]
>    [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-dg2-466/igt@xe_fault_injection@exec-queue=
-create-fail-xe_exec_queue_create.html
>    [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
dg2-433/igt@xe_fault_injection@exec-queue-create-fail-xe_exec_queue_create.=
html
>=20
>   * igt@xe_live_ktest@xe_bo:
>     - shard-dg2-set2:     [SKIP][210] ([Intel XE#2229] / [Intel XE#455]) =
-> [PASS][211] +1 other test pass
>    [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-dg2-464/igt@xe_live_ktest@xe_bo.html
>    [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
dg2-435/igt@xe_live_ktest@xe_bo.html
>=20
>   * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
>     - shard-dg2-set2:     [SKIP][212] ([Intel XE#2229]) -> [PASS][213]
>    [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-dg2-464/igt@xe_live_ktest@xe_bo@xe_ccs_mi=
grate_kunit.html
>    [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
dg2-435/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html
>=20
>   * igt@xe_module_load@load:
>     - shard-lnl:          ([PASS][214], [PASS][215], [PASS][216], [PASS][=
217], [PASS][218], [PASS][219], [PASS][220], [SKIP][221], [PASS][222], [PAS=
S][223], [PASS][224], [PASS][225], [PASS][226], [PASS][227], [PASS][228], [=
PASS][229], [PASS][230], [PASS][231], [PASS][232], [PASS][233], [PASS][234]=
, [PASS][235], [PASS][236], [PASS][237], [PASS][238], [PASS][239]) ([Intel =
XE#378]) -> ([PASS][240], [PASS][241], [PASS][242], [PASS][243], [PASS][244=
], [PASS][245], [PASS][246], [PASS][247], [PASS][248], [PASS][249], [PASS][=
250], [PASS][251], [PASS][252], [PASS][253], [PASS][254], [PASS][255], [PAS=
S][256], [PASS][257], [PASS][258], [PASS][259], [PASS][260], [PASS][261], [=
PASS][262], [PASS][263], [PASS][264])
>    [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-lnl-8/igt@xe_module_load@load.html
>    [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-lnl-6/igt@xe_module_load@load.html
>    [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-lnl-6/igt@xe_module_load@load.html
>    [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-lnl-6/igt@xe_module_load@load.html
>    [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-lnl-2/igt@xe_module_load@load.html
>    [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-lnl-3/igt@xe_module_load@load.html
>    [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-lnl-4/igt@xe_module_load@load.html
>    [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-lnl-7/igt@xe_module_load@load.html
>    [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-lnl-7/igt@xe_module_load@load.html
>    [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-lnl-7/igt@xe_module_load@load.html
>    [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-lnl-7/igt@xe_module_load@load.html
>    [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-lnl-5/igt@xe_module_load@load.html
>    [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-lnl-5/igt@xe_module_load@load.html
>    [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-lnl-2/igt@xe_module_load@load.html
>    [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-lnl-2/igt@xe_module_load@load.html
>    [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-lnl-1/igt@xe_module_load@load.html
>    [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-lnl-4/igt@xe_module_load@load.html
>    [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-lnl-8/igt@xe_module_load@load.html
>    [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-lnl-1/igt@xe_module_load@load.html
>    [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-lnl-1/igt@xe_module_load@load.html
>    [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-lnl-3/igt@xe_module_load@load.html
>    [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-lnl-3/igt@xe_module_load@load.html
>    [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-lnl-4/igt@xe_module_load@load.html
>    [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-lnl-8/igt@xe_module_load@load.html
>    [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-lnl-5/igt@xe_module_load@load.html
>    [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-lnl-7/igt@xe_module_load@load.html
>    [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
lnl-5/igt@xe_module_load@load.html
>    [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
lnl-7/igt@xe_module_load@load.html
>    [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
lnl-6/igt@xe_module_load@load.html
>    [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
lnl-3/igt@xe_module_load@load.html
>    [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
lnl-2/igt@xe_module_load@load.html
>    [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
lnl-6/igt@xe_module_load@load.html
>    [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
lnl-7/igt@xe_module_load@load.html
>    [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
lnl-2/igt@xe_module_load@load.html
>    [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
lnl-4/igt@xe_module_load@load.html
>    [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
lnl-4/igt@xe_module_load@load.html
>    [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
lnl-3/igt@xe_module_load@load.html
>    [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
lnl-8/igt@xe_module_load@load.html
>    [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
lnl-3/igt@xe_module_load@load.html
>    [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
lnl-1/igt@xe_module_load@load.html
>    [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
lnl-7/igt@xe_module_load@load.html
>    [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
lnl-7/igt@xe_module_load@load.html
>    [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
lnl-1/igt@xe_module_load@load.html
>    [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
lnl-1/igt@xe_module_load@load.html
>    [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
lnl-6/igt@xe_module_load@load.html
>    [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
lnl-2/igt@xe_module_load@load.html
>    [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
lnl-2/igt@xe_module_load@load.html
>    [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
lnl-8/igt@xe_module_load@load.html
>    [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
lnl-8/igt@xe_module_load@load.html
>    [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
lnl-5/igt@xe_module_load@load.html
>    [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
lnl-5/igt@xe_module_load@load.html
>=20
>   * igt@xe_module_load@reload-no-display:
>     - shard-dg2-set2:     [FAIL][265] ([Intel XE#4208]) -> [PASS][266]
>    [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-dg2-464/igt@xe_module_load@reload-no-disp=
lay.html
>    [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
dg2-466/igt@xe_module_load@reload-no-display.html
>=20
>   * igt@xe_pm@s4-d3hot-basic-exec:
>     - shard-adlp:         [ABORT][267] ([Intel XE#1794]) -> [PASS][268] +=
1 other test pass
>    [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-adlp-9/igt@xe_pm@s4-d3hot-basic-exec.html
>    [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
adlp-8/igt@xe_pm@s4-d3hot-basic-exec.html
>=20
>   * igt@xe_pm@s4-multiple-execs:
>     - shard-lnl:          [ABORT][269] ([Intel XE#1794]) -> [PASS][270]
>    [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-lnl-2/igt@xe_pm@s4-multiple-execs.html
>    [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
lnl-4/igt@xe_pm@s4-multiple-execs.html
>=20
>  =20
> #### Warnings ####
>=20
>   * igt@kms_async_flips@invalid-async-flip:
>     - shard-dg2-set2:     [SKIP][271] ([Intel XE#873]) -> [SKIP][272] ([I=
ntel XE#4208] / [i915#2575])
>    [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-dg2-435/igt@kms_async_flips@invalid-async=
-flip.html
>    [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
dg2-464/igt@kms_async_flips@invalid-async-flip.html
>=20
>   * igt@kms_big_fb@4-tiled-16bpp-rotate-270:
>     - shard-dg2-set2:     [SKIP][273] ([Intel XE#2351] / [Intel XE#4208])=
 -> [SKIP][274] ([Intel XE#316])
>    [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-dg2-464/igt@kms_big_fb@4-tiled-16bpp-rota=
te-270.html
>    [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
dg2-463/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html
>=20
>   * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
>     - shard-dg2-set2:     [SKIP][275] ([Intel XE#316]) -> [SKIP][276] ([I=
ntel XE#2351] / [Intel XE#4208])
>    [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-dg2-432/igt@kms_big_fb@4-tiled-8bpp-rotat=
e-90.html
>    [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
dg2-464/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html
>=20
>   * igt@kms_big_fb@linear-64bpp-rotate-90:
>     - shard-dg2-set2:     [SKIP][277] ([Intel XE#4208]) -> [SKIP][278] ([=
Intel XE#316]) +1 other test skip
>    [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-dg2-464/igt@kms_big_fb@linear-64bpp-rotat=
e-90.html
>    [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
dg2-466/igt@kms_big_fb@linear-64bpp-rotate-90.html
>=20
>   * igt@kms_big_fb@x-tiled-64bpp-rotate-270:
>     - shard-dg2-set2:     [SKIP][279] ([Intel XE#316]) -> [SKIP][280] ([I=
ntel XE#4208])
>    [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-dg2-432/igt@kms_big_fb@x-tiled-64bpp-rota=
te-270.html
>    [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
dg2-464/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html
>=20
>   * igt@kms_big_fb@y-tiled-32bpp-rotate-270:
>     - shard-dg2-set2:     [SKIP][281] ([Intel XE#1124]) -> [SKIP][282] ([=
Intel XE#2351] / [Intel XE#4208])
>    [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-dg2-434/igt@kms_big_fb@y-tiled-32bpp-rota=
te-270.html
>    [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
dg2-464/igt@kms_big_fb@y-tiled-32bpp-rotate-270.html
>=20
>   * igt@kms_big_fb@y-tiled-64bpp-rotate-270:
>     - shard-dg2-set2:     [SKIP][283] ([Intel XE#2351] / [Intel XE#4208])=
 -> [SKIP][284] ([Intel XE#1124]) +1 other test skip
>    [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-dg2-464/igt@kms_big_fb@y-tiled-64bpp-rota=
te-270.html
>    [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
dg2-463/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html
>=20
>   * igt@kms_big_fb@y-tiled-addfb:
>     - shard-dg2-set2:     [SKIP][285] ([Intel XE#2351] / [Intel XE#4208])=
 -> [SKIP][286] ([Intel XE#619])
>    [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-dg2-464/igt@kms_big_fb@y-tiled-addfb.html
>    [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
dg2-433/igt@kms_big_fb@y-tiled-addfb.html
>=20
>   * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
>     - shard-dg2-set2:     [SKIP][287] ([Intel XE#607]) -> [SKIP][288] ([I=
ntel XE#4208])
>    [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-dg2-436/igt@kms_big_fb@yf-tiled-addfb-siz=
e-offset-overflow.html
>    [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
dg2-464/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
>=20
>   * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
>     - shard-dg2-set2:     [SKIP][289] ([Intel XE#610]) -> [SKIP][290] ([I=
ntel XE#4208])
>    [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-dg2-435/igt@kms_big_fb@yf-tiled-addfb-siz=
e-overflow.html
>    [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
dg2-464/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
>=20
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip=
:
>     - shard-dg2-set2:     [SKIP][291] ([Intel XE#4208]) -> [SKIP][292] ([=
Intel XE#1124]) +5 other tests skip
>    [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-dg2-464/igt@kms_big_fb@yf-tiled-max-hw-st=
ride-32bpp-rotate-0-hflip-async-flip.html
>    [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
dg2-433/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-fl=
ip.html
>=20
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
>     - shard-dg2-set2:     [SKIP][293] ([Intel XE#1124]) -> [SKIP][294] ([=
Intel XE#4208]) +8 other tests skip
>    [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-st=
ride-64bpp-rotate-0-async-flip.html
>    [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
dg2-464/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.htm=
l
>=20
>   * igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:
>     - shard-dg2-set2:     [SKIP][295] ([Intel XE#2191]) -> [SKIP][296] ([=
Intel XE#4208] / [i915#2575])
>    [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-dg2-434/igt@kms_bw@connected-linear-tilin=
g-3-displays-2560x1440p.html
>    [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
dg2-464/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html
>=20
>   * igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
>     - shard-dg2-set2:     [SKIP][297] ([Intel XE#4208] / [i915#2575]) -> =
[SKIP][298] ([Intel XE#2191]) +1 other test skip
>    [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-dg2-464/igt@kms_bw@connected-linear-tilin=
g-4-displays-1920x1080p.html
>    [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
dg2-466/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html
>=20
>   * igt@kms_bw@linear-tiling-1-displays-1920x1080p:
>     - shard-dg2-set2:     [SKIP][299] ([Intel XE#4208] / [i915#2575]) -> =
[SKIP][300] ([Intel XE#367]) +1 other test skip
>    [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-dg2-464/igt@kms_bw@linear-tiling-1-displa=
ys-1920x1080p.html
>    [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
dg2-435/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html
>=20
>   * igt@kms_bw@linear-tiling-1-displays-2160x1440p:
>     - shard-dg2-set2:     [SKIP][301] ([Intel XE#367]) -> [SKIP][302] ([I=
ntel XE#4208] / [i915#2575]) +1 other test skip
>    [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-dg2-436/igt@kms_bw@linear-tiling-1-displa=
ys-2160x1440p.html
>    [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
dg2-464/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html
>=20
>   * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs:
>     - shard-dg2-set2:     [SKIP][303] ([Intel XE#455] / [Intel XE#787]) -=
> [SKIP][304] ([Intel XE#4208]) +10 other tests skip
>    [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-dg2-435/igt@kms_ccs@bad-aux-stride-y-tile=
d-gen12-rc-ccs.html
>    [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
dg2-464/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs.html
>=20
>   * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:
>     - shard-dg2-set2:     [SKIP][305] ([Intel XE#2907]) -> [SKIP][306] ([=
Intel XE#4208]) +1 other test skip
>    [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-dg2-463/igt@kms_ccs@crc-primary-basic-4-t=
iled-bmg-ccs.html
>    [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
dg2-464/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html
>=20
>   * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc:
>     - shard-dg2-set2:     [SKIP][307] ([Intel XE#2351] / [Intel XE#4208])=
 -> [SKIP][308] ([Intel XE#455] / [Intel XE#787]) +2 other tests skip
>    [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-dg2-464/igt@kms_ccs@crc-primary-rotation-=
180-4-tiled-mtl-rc-ccs-cc.html
>    [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
dg2-435/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc.html
>=20
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
>     - shard-dg2-set2:     [SKIP][309] ([Intel XE#4208]) -> [SKIP][310] ([=
Intel XE#2907])
>    [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-dg2-464/igt@kms_ccs@crc-sprite-planes-bas=
ic-4-tiled-lnl-ccs.html
>    [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
dg2-466/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html
>=20
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
>     - shard-dg2-set2:     [INCOMPLETE][311] ([Intel XE#1727] / [Intel XE#=
3113] / [Intel XE#4345]) -> [INCOMPLETE][312] ([Intel XE#1727] / [Intel XE#=
3113] / [Intel XE#3124])
>    [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-til=
ed-dg2-mc-ccs.html
>    [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
>=20
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
>     - shard-dg2-set2:     [INCOMPLETE][313] ([Intel XE#2705] / [Intel XE#=
4212]) -> [SKIP][314] ([Intel XE#4208])
>    [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-til=
ed-dg2-rc-ccs-cc.html
>    [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
>=20
>   * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs:
>     - shard-dg2-set2:     [SKIP][315] ([Intel XE#4208]) -> [SKIP][316] ([=
Intel XE#455] / [Intel XE#787]) +10 other tests skip
>    [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-til=
ed-mtl-rc-ccs.html
>    [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html
>=20
>   * igt@kms_ccs@random-ccs-data-yf-tiled-ccs:
>     - shard-dg2-set2:     [SKIP][317] ([Intel XE#455] / [Intel XE#787]) -=
> [SKIP][318] ([Intel XE#2351] / [Intel XE#4208])
>    [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-dg2-432/igt@kms_ccs@random-ccs-data-yf-ti=
led-ccs.html
>    [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
dg2-464/igt@kms_ccs@random-ccs-data-yf-tiled-ccs.html
>=20
>   * igt@kms_chamelium_color@ctm-limited-range:
>     - shard-dg2-set2:     [SKIP][319] ([Intel XE#4208] / [i915#2575]) -> =
[SKIP][320] ([Intel XE#306]) +1 other test skip
>    [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-dg2-464/igt@kms_chamelium_color@ctm-limit=
ed-range.html
>    [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
dg2-466/igt@kms_chamelium_color@ctm-limited-range.html
>=20
>   * igt@kms_chamelium_color@gamma:
>     - shard-dg2-set2:     [SKIP][321] ([Intel XE#306]) -> [SKIP][322] ([I=
ntel XE#4208] / [i915#2575]) +1 other test skip
>    [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-dg2-435/igt@kms_chamelium_color@gamma.htm=
l
>    [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
dg2-464/igt@kms_chamelium_color@gamma.html
>=20
>   * igt@kms_chamelium_edid@dp-edid-change-during-suspend:
>     - shard-dg2-set2:     [SKIP][323] ([Intel XE#373]) -> [SKIP][324] ([I=
ntel XE#4208] / [i915#2575]) +8 other tests skip
>    [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-dg2-432/igt@kms_chamelium_edid@dp-edid-ch=
ange-during-suspend.html
>    [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
dg2-464/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html
>=20
>   * igt@kms_chamelium_hpd@hdmi-hpd:
>     - shard-dg2-set2:     [SKIP][325] ([Intel XE#4208] / [i915#2575]) -> =
[SKIP][326] ([Intel XE#373]) +8 other tests skip
>    [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-dg2-464/igt@kms_chamelium_hpd@hdmi-hpd.ht=
ml
>    [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
dg2-463/igt@kms_chamelium_hpd@hdmi-hpd.html
>=20
>   * igt@kms_content_protection@atomic-dpms:
>     - shard-dg2-set2:     [INCOMPLETE][327] -> [SKIP][328] ([Intel XE#420=
8] / [i915#2575])
>    [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-dg2-435/igt@kms_content_protection@atomic=
-dpms.html
>    [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
dg2-464/igt@kms_content_protection@atomic-dpms.html
>=20
>   * igt@kms_content_protection@dp-mst-type-0:
>     - shard-dg2-set2:     [SKIP][329] ([Intel XE#307]) -> [SKIP][330] ([I=
ntel XE#4208] / [i915#2575])
>    [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-dg2-434/igt@kms_content_protection@dp-mst=
-type-0.html
>    [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
dg2-464/igt@kms_content_protection@dp-mst-type-0.html
>=20
>   * igt@kms_content_protection@lic-type-0:
>     - shard-dg2-set2:     [SKIP][331] ([Intel XE#4208] / [i915#2575]) -> =
[FAIL][332] ([Intel XE#1178])
>    [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-dg2-464/igt@kms_content_protection@lic-ty=
pe-0.html
>    [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
dg2-463/igt@kms_content_protection@lic-type-0.html
>=20
>   * igt@kms_content_protection@srm:
>     - shard-bmg:          [SKIP][333] ([Intel XE#2341]) -> [FAIL][334] ([=
Intel XE#1178]) +1 other test fail
>    [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-bmg-5/igt@kms_content_protection@srm.html
>    [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
bmg-7/igt@kms_content_protection@srm.html
>     - shard-dg2-set2:     [FAIL][335] ([Intel XE#1178]) -> [SKIP][336] ([=
Intel XE#4208] / [i915#2575])
>    [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-dg2-432/igt@kms_content_protection@srm.ht=
ml
>    [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
dg2-464/igt@kms_content_protection@srm.html
>=20
>   * igt@kms_cursor_crc@cursor-offscreen-512x170:
>     - shard-dg2-set2:     [SKIP][337] ([Intel XE#4208] / [i915#2575]) -> =
[SKIP][338] ([Intel XE#308]) +1 other test skip
>    [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-dg2-464/igt@kms_cursor_crc@cursor-offscre=
en-512x170.html
>    [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
dg2-466/igt@kms_cursor_crc@cursor-offscreen-512x170.html
>=20
>   * igt@kms_cursor_crc@cursor-onscreen-512x170:
>     - shard-dg2-set2:     [SKIP][339] ([Intel XE#308]) -> [SKIP][340] ([I=
ntel XE#4208] / [i915#2575]) +1 other test skip
>    [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-dg2-434/igt@kms_cursor_crc@cursor-onscree=
n-512x170.html
>    [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
dg2-464/igt@kms_cursor_crc@cursor-onscreen-512x170.html
>=20
>   * igt@kms_dp_link_training@uhbr-mst:
>     - shard-dg2-set2:     [SKIP][341] ([Intel XE#4208]) -> [SKIP][342] ([=
Intel XE#4356])
>    [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-dg2-464/igt@kms_dp_link_training@uhbr-mst=
.html
>    [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
dg2-463/igt@kms_dp_link_training@uhbr-mst.html
>=20
>   * igt@kms_dsc@dsc-with-bpc-formats:
>     - shard-dg2-set2:     [SKIP][343] ([Intel XE#455]) -> [SKIP][344] ([I=
ntel XE#2351] / [Intel XE#4208]) +1 other test skip
>    [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-dg2-436/igt@kms_dsc@dsc-with-bpc-formats.=
html
>    [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
dg2-464/igt@kms_dsc@dsc-with-bpc-formats.html
>=20
>   * igt@kms_feature_discovery@psr1:
>     - shard-dg2-set2:     [SKIP][345] ([Intel XE#4208] / [i915#2575]) -> =
[SKIP][346] ([Intel XE#1135])
>    [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-dg2-464/igt@kms_feature_discovery@psr1.ht=
ml
>    [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
dg2-466/igt@kms_feature_discovery@psr1.html
>=20
>   * igt@kms_feature_discovery@psr2:
>     - shard-dg2-set2:     [SKIP][347] ([Intel XE#1135]) -> [SKIP][348] ([=
Intel XE#4208] / [i915#2575])
>    [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-dg2-435/igt@kms_feature_discovery@psr2.ht=
ml
>    [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
dg2-464/igt@kms_feature_discovery@psr2.html
>=20
>   * igt@kms_flip@2x-flip-vs-expired-vblank:
>     - shard-bmg:          [SKIP][349] ([Intel XE#2316]) -> [FAIL][350] ([=
Intel XE#3321])
>    [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vbl=
ank.html
>    [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank.html
>=20
>   * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling=
:
>     - shard-dg2-set2:     [SKIP][351] ([Intel XE#455]) -> [SKIP][352] ([I=
ntel XE#4208]) +4 other tests skip
>    [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bp=
p-yftile-to-64bpp-yftile-downscaling.html
>    [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
dg2-464/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscali=
ng.html
>=20
>   * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscalin=
g:
>     - shard-dg2-set2:     [SKIP][353] ([Intel XE#4208]) -> [SKIP][354] ([=
Intel XE#455]) +2 other tests skip
>    [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-dg2-464/igt@kms_flip_scaled_crc@flip-32bp=
p-yftileccs-to-64bpp-yftile-upscaling.html
>    [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscal=
ing.html
>=20
>   * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling=
:
>     - shard-dg2-set2:     [SKIP][355] ([Intel XE#2351] / [Intel XE#4208])=
 -> [SKIP][356] ([Intel XE#455]) +1 other test skip
>    [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-dg2-464/igt@kms_flip_scaled_crc@flip-64bp=
p-yftile-to-16bpp-yftile-downscaling.html
>    [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
dg2-463/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscali=
ng.html
>=20
>   * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:
>     - shard-bmg:          [SKIP][357] ([Intel XE#2312]) -> [SKIP][358] ([=
Intel XE#2311]) +15 other tests skip
>    [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2=
p-primscrn-indfb-pgflip-blt.html
>    [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html
>=20
>   * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt:
>     - shard-bmg:          [SKIP][359] ([Intel XE#2311]) -> [SKIP][360] ([=
Intel XE#2312]) +6 other tests skip
>    [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2=
p-primscrn-shrfb-msflip-blt.html
>    [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt.html
>=20
>   * igt@kms_frontbuffer_tracking@drrs-suspend:
>     - shard-dg2-set2:     [SKIP][361] ([Intel XE#2351] / [Intel XE#4208])=
 -> [SKIP][362] ([Intel XE#651]) +9 other tests skip
>    [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs=
-suspend.html
>    [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
dg2-463/igt@kms_frontbuffer_tracking@drrs-suspend.html
>=20
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt:
>     - shard-bmg:          [SKIP][363] ([Intel XE#4141]) -> [SKIP][364] ([=
Intel XE#2312]) +4 other tests skip
>    [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p=
-primscrn-shrfb-pgflip-blt.html
>    [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html
>=20
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
>     - shard-bmg:          [SKIP][365] ([Intel XE#2312]) -> [SKIP][366] ([=
Intel XE#4141]) +5 other tests skip
>    [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p=
-scndscrn-spr-indfb-draw-render.html
>    [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.ht=
ml
>=20
>   * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-blt:
>     - shard-dg2-set2:     [SKIP][367] ([Intel XE#4208]) -> [SKIP][368] ([=
Intel XE#651]) +14 other tests skip
>    [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcd=
rrs-1p-offscren-pri-indfb-draw-blt.html
>    [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-blt=
.html
>=20
>   * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff:
>     - shard-dg2-set2:     [SKIP][369] ([Intel XE#651]) -> [SKIP][370] ([I=
ntel XE#2351] / [Intel XE#4208]) +7 other tests skip
>    [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcd=
rrs-1p-primscrn-spr-indfb-onoff.html
>    [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff.ht=
ml
>=20
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-plflip-blt:
>     - shard-dg2-set2:     [SKIP][371] ([Intel XE#651]) -> [SKIP][372] ([I=
ntel XE#4208]) +18 other tests skip
>    [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcd=
rrs-2p-scndscrn-shrfb-plflip-blt.html
>    [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-plflip-blt.h=
tml
>=20
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt:
>     - shard-dg2-set2:     [SKIP][373] ([Intel XE#4208]) -> [SKIP][374] ([=
Intel XE#653]) +17 other tests skip
>    [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcp=
sr-1p-primscrn-indfb-msflip-blt.html
>    [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt.ht=
ml
>=20
>   * igt@kms_frontbuffer_tracking@fbcpsr-slowdraw:
>     - shard-dg2-set2:     [SKIP][375] ([Intel XE#2351] / [Intel XE#4208])=
 -> [SKIP][376] ([Intel XE#653]) +7 other tests skip
>    [375]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcp=
sr-slowdraw.html
>    [376]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html
>=20
>   * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
>     - shard-dg2-set2:     [SKIP][377] ([Intel XE#653]) -> [SKIP][378] ([I=
ntel XE#2351] / [Intel XE#4208]) +8 other tests skip
>    [377]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcp=
sr-tiling-4.html
>    [378]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html
>=20
>   * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
>     - shard-dg2-set2:     [SKIP][379] ([Intel XE#2351] / [Intel XE#4208])=
 -> [SKIP][380] ([Intel XE#658])
>    [379]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcp=
sr-tiling-y.html
>    [380]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
>=20
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
>     - shard-bmg:          [SKIP][381] ([Intel XE#2313]) -> [SKIP][382] ([=
Intel XE#2312]) +7 other tests skip
>    [381]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p=
-primscrn-indfb-plflip-blt.html
>    [382]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
>=20
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:
>     - shard-bmg:          [SKIP][383] ([Intel XE#2312]) -> [SKIP][384] ([=
Intel XE#2313]) +15 other tests skip
>    [383]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p=
-primscrn-spr-indfb-fullscreen.html
>    [384]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
bmg-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.htm=
l
>=20
>   * igt@kms_frontbuffer_tracking@psr-rgb565-draw-blt:
>     - shard-dg2-set2:     [SKIP][385] ([Intel XE#653]) -> [SKIP][386] ([I=
ntel XE#4208]) +19 other tests skip
>    [385]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-=
rgb565-draw-blt.html
>    [386]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
dg2-464/igt@kms_frontbuffer_tracking@psr-rgb565-draw-blt.html
>=20
>   * igt@kms_getfb@getfb-reject-ccs:
>     - shard-dg2-set2:     [SKIP][387] ([Intel XE#605]) -> [SKIP][388] ([I=
ntel XE#4208] / [i915#2575])
>    [387]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-dg2-432/igt@kms_getfb@getfb-reject-ccs.ht=
ml
>    [388]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
dg2-464/igt@kms_getfb@getfb-reject-ccs.html
>=20
>   * igt@kms_hdr@brightness-with-hdr:
>     - shard-dg2-set2:     [SKIP][389] ([Intel XE#4208] / [i915#2575]) -> =
[SKIP][390] ([Intel XE#455]) +4 other tests skip
>    [389]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-dg2-464/igt@kms_hdr@brightness-with-hdr.h=
tml
>    [390]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
dg2-433/igt@kms_hdr@brightness-with-hdr.html
>     - shard-bmg:          [SKIP][391] ([Intel XE#3544]) -> [SKIP][392] ([=
Intel XE#3374] / [Intel XE#3544])
>    [391]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-bmg-1/igt@kms_hdr@brightness-with-hdr.htm=
l
>    [392]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
bmg-3/igt@kms_hdr@brightness-with-hdr.html
>=20
>   * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
>     - shard-dg2-set2:     [SKIP][393] ([Intel XE#356]) -> [SKIP][394] ([I=
ntel XE#4208] / [i915#2575])
>    [393]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-dg2-435/igt@kms_multipipe_modeset@basic-m=
ax-pipe-crc-check.html
>    [394]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
dg2-464/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
>=20
>   * igt@kms_pipe_stress@stress-xrgb8888-ytiled:
>     - shard-dg2-set2:     [SKIP][395] ([Intel XE#4208]) -> [SKIP][396] ([=
Intel XE#4359])
>    [395]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-dg2-464/igt@kms_pipe_stress@stress-xrgb88=
88-ytiled.html
>    [396]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
dg2-466/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html
>=20
>   * igt@kms_plane_multiple@2x-tiling-y:
>     - shard-bmg:          [SKIP][397] ([Intel XE#4596]) -> [SKIP][398] ([=
Intel XE#5021])
>    [397]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-y.=
html
>    [398]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
bmg-2/igt@kms_plane_multiple@2x-tiling-y.html
>=20
>   * igt@kms_plane_multiple@tiling-yf:
>     - shard-dg2-set2:     [SKIP][399] ([Intel XE#5020]) -> [SKIP][400] ([=
Intel XE#4208] / [i915#2575])
>    [399]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-dg2-435/igt@kms_plane_multiple@tiling-yf.=
html
>    [400]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
dg2-464/igt@kms_plane_multiple@tiling-yf.html
>=20
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25:
>     - shard-dg2-set2:     [SKIP][401] ([Intel XE#4208] / [i915#2575]) -> =
[SKIP][402] ([Intel XE#2763] / [Intel XE#455]) +1 other test skip
>    [401]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-dg2-464/igt@kms_plane_scaling@planes-down=
scale-factor-0-25.html
>    [402]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
dg2-433/igt@kms_plane_scaling@planes-downscale-factor-0-25.html
>=20
>   * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-2=
5:
>     - shard-dg2-set2:     [SKIP][403] ([Intel XE#2763] / [Intel XE#455]) =
-> [SKIP][404] ([Intel XE#4208] / [i915#2575])
>    [403]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-dg2-435/igt@kms_plane_scaling@planes-upsc=
ale-factor-0-25-downscale-factor-0-25.html
>    [404]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
dg2-464/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0=
-25.html
>=20
>   * igt@kms_pm_backlight@brightness-with-dpms:
>     - shard-dg2-set2:     [SKIP][405] ([Intel XE#4208]) -> [SKIP][406] ([=
Intel XE#2938])
>    [405]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-dg2-464/igt@kms_pm_backlight@brightness-w=
ith-dpms.html
>    [406]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
dg2-466/igt@kms_pm_backlight@brightness-with-dpms.html
>=20
>   * igt@kms_pm_backlight@fade:
>     - shard-dg2-set2:     [SKIP][407] ([Intel XE#4208]) -> [SKIP][408] ([=
Intel XE#870]) +1 other test skip
>    [407]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-dg2-464/igt@kms_pm_backlight@fade.html
>    [408]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
dg2-435/igt@kms_pm_backlight@fade.html
>=20
>   * igt@kms_pm_dc@dc5-psr:
>     - shard-dg2-set2:     [SKIP][409] ([Intel XE#1129]) -> [SKIP][410] ([=
Intel XE#4208])
>    [409]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-dg2-432/igt@kms_pm_dc@dc5-psr.html
>    [410]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
dg2-464/igt@kms_pm_dc@dc5-psr.html
>=20
>   * igt@kms_properties@get_properties-sanity-non-atomic:
>     - shard-dg2-set2:     [FAIL][411] ([Intel XE#5017]) -> [SKIP][412] ([=
Intel XE#4208] / [i915#2575])
>    [411]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-dg2-435/igt@kms_properties@get_properties=
-sanity-non-atomic.html
>    [412]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
dg2-464/igt@kms_properties@get_properties-sanity-non-atomic.html
>=20
>   * igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf:
>     - shard-dg2-set2:     [SKIP][413] ([Intel XE#1489]) -> [SKIP][414] ([=
Intel XE#4208]) +6 other tests skip
>    [413]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-dg2-435/igt@kms_psr2_sf@fbc-pr-cursor-pla=
ne-update-sf.html
>    [414]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
dg2-464/igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf.html
>=20
>   * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:
>     - shard-dg2-set2:     [SKIP][415] ([Intel XE#4208]) -> [SKIP][416] ([=
Intel XE#1489]) +5 other tests skip
>    [415]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-dg2-464/igt@kms_psr2_sf@psr2-cursor-plane=
-move-continuous-exceed-fully-sf.html
>    [416]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
dg2-466/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.h=
tml
>=20
>   * igt@kms_psr2_su@page_flip-p010:
>     - shard-dg2-set2:     [SKIP][417] ([Intel XE#1122]) -> [SKIP][418] ([=
Intel XE#4208])
>    [417]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-dg2-432/igt@kms_psr2_su@page_flip-p010.ht=
ml
>    [418]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
dg2-464/igt@kms_psr2_su@page_flip-p010.html
>=20
>   * igt@kms_psr2_su@page_flip-xrgb8888:
>     - shard-dg2-set2:     [SKIP][419] ([Intel XE#4208]) -> [SKIP][420] ([=
Intel XE#1122]) +1 other test skip
>    [419]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-dg2-464/igt@kms_psr2_su@page_flip-xrgb888=
8.html
>    [420]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
dg2-435/igt@kms_psr2_su@page_flip-xrgb8888.html
>=20
>   * igt@kms_psr@fbc-psr-sprite-plane-onoff:
>     - shard-dg2-set2:     [SKIP][421] ([Intel XE#2850] / [Intel XE#929]) =
-> [SKIP][422] ([Intel XE#2351] / [Intel XE#4208]) +4 other tests skip
>    [421]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-dg2-432/igt@kms_psr@fbc-psr-sprite-plane-=
onoff.html
>    [422]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
dg2-464/igt@kms_psr@fbc-psr-sprite-plane-onoff.html
>=20
>   * igt@kms_psr@fbc-psr2-sprite-plane-move:
>     - shard-dg2-set2:     [SKIP][423] ([Intel XE#2850] / [Intel XE#929]) =
-> [SKIP][424] ([Intel XE#4208]) +8 other tests skip
>    [423]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-dg2-432/igt@kms_psr@fbc-psr2-sprite-plane=
-move.html
>    [424]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
dg2-464/igt@kms_psr@fbc-psr2-sprite-plane-move.html
>=20
>   * igt@kms_psr@psr-dpms:
>     - shard-dg2-set2:     [SKIP][425] ([Intel XE#2351] / [Intel XE#4208])=
 -> [SKIP][426] ([Intel XE#2850] / [Intel XE#929]) +4 other tests skip
>    [425]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-dg2-464/igt@kms_psr@psr-dpms.html
>    [426]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
dg2-466/igt@kms_psr@psr-dpms.html
>=20
>   * igt@kms_psr@psr2-sprite-plane-move:
>     - shard-dg2-set2:     [SKIP][427] ([Intel XE#4208]) -> [SKIP][428] ([=
Intel XE#2850] / [Intel XE#929]) +9 other tests skip
>    [427]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-dg2-464/igt@kms_psr@psr2-sprite-plane-mov=
e.html
>    [428]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
dg2-466/igt@kms_psr@psr2-sprite-plane-move.html
>=20
>   * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
>     - shard-dg2-set2:     [SKIP][429] ([Intel XE#4208] / [i915#2575]) -> =
[SKIP][430] ([Intel XE#1127]) +1 other test skip
>    [429]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-dg2-464/igt@kms_rotation_crc@primary-y-ti=
led-reflect-x-180.html
>    [430]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
dg2-466/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
>=20
>   * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>     - shard-dg2-set2:     [SKIP][431] ([Intel XE#4208] / [i915#2575]) -> =
[SKIP][432] ([Intel XE#1500])
>    [431]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-dg2-464/igt@kms_tiled_display@basic-test-=
pattern-with-chamelium.html
>    [432]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
dg2-435/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
>=20
>   * igt@kms_vrr@flipline:
>     - shard-dg2-set2:     [SKIP][433] ([Intel XE#455]) -> [SKIP][434] ([I=
ntel XE#4208] / [i915#2575]) +9 other tests skip
>    [433]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-dg2-434/igt@kms_vrr@flipline.html
>    [434]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
dg2-464/igt@kms_vrr@flipline.html
>=20
>   * igt@kms_vrr@lobf:
>     - shard-dg2-set2:     [SKIP][435] ([Intel XE#4208] / [i915#2575]) -> =
[SKIP][436] ([Intel XE#2168])
>    [435]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-dg2-464/igt@kms_vrr@lobf.html
>    [436]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
dg2-433/igt@kms_vrr@lobf.html
>=20
>   * igt@kms_writeback@writeback-check-output:
>     - shard-dg2-set2:     [SKIP][437] ([Intel XE#756]) -> [SKIP][438] ([I=
ntel XE#4208] / [i915#2575])
>    [437]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-dg2-436/igt@kms_writeback@writeback-check=
-output.html
>    [438]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
dg2-464/igt@kms_writeback@writeback-check-output.html
>=20
>   * igt@kms_writeback@writeback-invalid-parameters:
>     - shard-dg2-set2:     [SKIP][439] ([Intel XE#4208] / [i915#2575]) -> =
[SKIP][440] ([Intel XE#756]) +1 other test skip
>    [439]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-dg2-464/igt@kms_writeback@writeback-inval=
id-parameters.html
>    [440]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
dg2-463/igt@kms_writeback@writeback-invalid-parameters.html
>=20
>   * igt@testdisplay:
>     - shard-dg2-set2:     [SKIP][441] ([Intel XE#4208]) -> [ABORT][442] (=
[Intel XE#2705])
>    [441]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-dg2-464/igt@testdisplay.html
>    [442]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
dg2-435/igt@testdisplay.html
>=20
>   * igt@xe_compute_preempt@compute-preempt:
>     - shard-dg2-set2:     [SKIP][443] ([Intel XE#1280] / [Intel XE#455]) =
-> [SKIP][444] ([Intel XE#4208]) +1 other test skip
>    [443]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-dg2-435/igt@xe_compute_preempt@compute-pr=
eempt.html
>    [444]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
dg2-464/igt@xe_compute_preempt@compute-preempt.html
>=20
>   * igt@xe_copy_basic@mem-copy-linear-0x3fff:
>     - shard-dg2-set2:     [SKIP][445] ([Intel XE#4208]) -> [SKIP][446] ([=
Intel XE#1123])
>    [445]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-dg2-464/igt@xe_copy_basic@mem-copy-linear=
-0x3fff.html
>    [446]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
dg2-466/igt@xe_copy_basic@mem-copy-linear-0x3fff.html
>=20
>   * igt@xe_copy_basic@mem-copy-linear-0xfd:
>     - shard-dg2-set2:     [SKIP][447] ([Intel XE#1123]) -> [SKIP][448] ([=
Intel XE#4208])
>    [447]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-dg2-434/igt@xe_copy_basic@mem-copy-linear=
-0xfd.html
>    [448]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
dg2-464/igt@xe_copy_basic@mem-copy-linear-0xfd.html
>=20
>   * igt@xe_copy_basic@mem-set-linear-0xfd:
>     - shard-dg2-set2:     [SKIP][449] ([Intel XE#4208]) -> [SKIP][450] ([=
Intel XE#1126])
>    [449]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-dg2-464/igt@xe_copy_basic@mem-set-linear-=
0xfd.html
>    [450]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
dg2-435/igt@xe_copy_basic@mem-set-linear-0xfd.html
>=20
>   * igt@xe_copy_basic@mem-set-linear-0xfffe:
>     - shard-dg2-set2:     [SKIP][451] ([Intel XE#1126]) -> [SKIP][452] ([=
Intel XE#4208])
>    [451]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-=
0xfffe.html
>    [452]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
dg2-464/igt@xe_copy_basic@mem-set-linear-0xfffe.html
>=20
>   * igt@xe_eu_stall@invalid-gt-id:
>     - shard-dg2-set2:     [SKIP][453] ([Intel XE#4208]) -> [SKIP][454] ([=
Intel XE#4497]) +1 other test skip
>    [453]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-dg2-464/igt@xe_eu_stall@invalid-gt-id.htm=
l
>    [454]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
dg2-463/igt@xe_eu_stall@invalid-gt-id.html
>=20
>   * igt@xe_eudebug@basic-close:
>     - shard-dg2-set2:     [SKIP][455] ([Intel XE#4208]) -> [SKIP][456] ([=
Intel XE#4837]) +15 other tests skip
>    [455]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-dg2-464/igt@xe_eudebug@basic-close.html
>    [456]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
dg2-433/igt@xe_eudebug@basic-close.html
>=20
>   * igt@xe_eudebug@basic-vm-access-userptr-faultable:
>     - shard-dg2-set2:     [SKIP][457] ([Intel XE#4837]) -> [SKIP][458] ([=
Intel XE#4208]) +14 other tests skip
>    [457]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-dg2-434/igt@xe_eudebug@basic-vm-access-us=
erptr-faultable.html
>    [458]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
dg2-464/igt@xe_eudebug@basic-vm-access-userptr-faultable.html
>=20
>   * igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind:
>     - shard-dg2-set2:     [SKIP][459] ([Intel XE#1392]) -> [SKIP][460] ([=
Intel XE#4208]) +1 other test skip
>    [459]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-dg2-432/igt@xe_exec_basic@multigpu-once-b=
indexecqueue-rebind.html
>    [460]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
dg2-464/igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind.html
>=20
>   * igt@xe_exec_fault_mode@once-bindexecqueue-imm:
>     - shard-dg2-set2:     [SKIP][461] ([Intel XE#288]) -> [SKIP][462] ([I=
ntel XE#4208]) +20 other tests skip
>    [461]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-dg2-432/igt@xe_exec_fault_mode@once-binde=
xecqueue-imm.html
>    [462]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
dg2-464/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html
>=20
>   * igt@xe_exec_fault_mode@twice-userptr-invalidate-race:
>     - shard-dg2-set2:     [SKIP][463] ([Intel XE#4208]) -> [SKIP][464] ([=
Intel XE#288]) +22 other tests skip
>    [463]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-dg2-464/igt@xe_exec_fault_mode@twice-user=
ptr-invalidate-race.html
>    [464]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
dg2-463/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html
>=20
>   * igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence:
>     - shard-dg2-set2:     [SKIP][465] ([Intel XE#2360]) -> [SKIP][466] ([=
Intel XE#4208])
>    [465]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-dg2-432/igt@xe_exec_mix_modes@exec-simple=
-batch-store-dma-fence.html
>    [466]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
dg2-464/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html
>=20
>   * igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-mlo=
ck-nomemset:
>     - shard-dg2-set2:     [SKIP][467] ([Intel XE#4208]) -> [SKIP][468] ([=
Intel XE#4915]) +157 other tests skip
>    [467]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-dg2-464/igt@xe_exec_system_allocator@thre=
ads-many-large-execqueues-malloc-mlock-nomemset.html
>    [468]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
dg2-435/igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-m=
lock-nomemset.html
>=20
>   * igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc:
>     - shard-dg2-set2:     [SKIP][469] ([Intel XE#4915]) -> [SKIP][470] ([=
Intel XE#4208]) +176 other tests skip
>    [469]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-dg2-434/igt@xe_exec_system_allocator@thre=
ads-shared-vm-many-large-malloc.html
>    [470]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
dg2-464/igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc.ht=
ml
>=20
>   * igt@xe_oa@buffer-size:
>     - shard-dg2-set2:     [SKIP][471] ([Intel XE#4208]) -> [SKIP][472] ([=
Intel XE#4501])
>    [471]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-dg2-464/igt@xe_oa@buffer-size.html
>    [472]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
dg2-463/igt@xe_oa@buffer-size.html
>=20
>   * igt@xe_oa@polling-small-buf:
>     - shard-dg2-set2:     [SKIP][473] ([Intel XE#2541] / [Intel XE#3573])=
 -> [SKIP][474] ([Intel XE#4208]) +3 other tests skip
>    [473]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-dg2-432/igt@xe_oa@polling-small-buf.html
>    [474]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
dg2-464/igt@xe_oa@polling-small-buf.html
>=20
>   * igt@xe_oa@syncs-syncobj-none:
>     - shard-dg2-set2:     [SKIP][475] ([Intel XE#4208]) -> [SKIP][476] ([=
Intel XE#2541] / [Intel XE#3573] / [Intel XE#4501])
>    [475]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-dg2-464/igt@xe_oa@syncs-syncobj-none.html
>    [476]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
dg2-463/igt@xe_oa@syncs-syncobj-none.html
>=20
>   * igt@xe_oa@syncs-ufence-wait:
>     - shard-dg2-set2:     [SKIP][477] ([Intel XE#2541] / [Intel XE#3573] =
/ [Intel XE#4501]) -> [SKIP][478] ([Intel XE#4208])
>    [477]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-dg2-434/igt@xe_oa@syncs-ufence-wait.html
>    [478]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
dg2-464/igt@xe_oa@syncs-ufence-wait.html
>=20
>   * igt@xe_oa@whitelisted-registers-userspace-config:
>     - shard-dg2-set2:     [SKIP][479] ([Intel XE#4208]) -> [SKIP][480] ([=
Intel XE#2541] / [Intel XE#3573]) +3 other tests skip
>    [479]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-dg2-464/igt@xe_oa@whitelisted-registers-u=
serspace-config.html
>    [480]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
dg2-433/igt@xe_oa@whitelisted-registers-userspace-config.html
>=20
>   * igt@xe_pat@display-vs-wb-transient:
>     - shard-dg2-set2:     [SKIP][481] ([Intel XE#1337]) -> [SKIP][482] ([=
Intel XE#4208])
>    [481]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-dg2-436/igt@xe_pat@display-vs-wb-transien=
t.html
>    [482]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
dg2-464/igt@xe_pat@display-vs-wb-transient.html
>=20
>   * igt@xe_pat@pat-index-xehpc:
>     - shard-dg2-set2:     [SKIP][483] ([Intel XE#2838] / [Intel XE#979]) =
-> [SKIP][484] ([Intel XE#4208])
>    [483]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-dg2-432/igt@xe_pat@pat-index-xehpc.html
>    [484]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
dg2-464/igt@xe_pat@pat-index-xehpc.html
>=20
>   * igt@xe_pm@d3cold-mmap-system:
>     - shard-dg2-set2:     [SKIP][485] ([Intel XE#2284] / [Intel XE#366]) =
-> [SKIP][486] ([Intel XE#4208])
>    [485]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-dg2-434/igt@xe_pm@d3cold-mmap-system.html
>    [486]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
dg2-464/igt@xe_pm@d3cold-mmap-system.html
>=20
>   * igt@xe_pm@s4-d3cold-basic-exec:
>     - shard-dg2-set2:     [SKIP][487] ([Intel XE#4208]) -> [SKIP][488] ([=
Intel XE#2284] / [Intel XE#366])
>    [487]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-dg2-464/igt@xe_pm@s4-d3cold-basic-exec.ht=
ml
>    [488]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
dg2-463/igt@xe_pm@s4-d3cold-basic-exec.html
>=20
>   * igt@xe_pmu@fn-engine-activity-sched-if-idle:
>     - shard-dg2-set2:     [SKIP][489] ([Intel XE#4650]) -> [SKIP][490] ([=
Intel XE#4208])
>    [489]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-dg2-436/igt@xe_pmu@fn-engine-activity-sch=
ed-if-idle.html
>    [490]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
dg2-464/igt@xe_pmu@fn-engine-activity-sched-if-idle.html
>=20
>   * igt@xe_pxp@display-black-pxp-fb:
>     - shard-dg2-set2:     [SKIP][491] ([Intel XE#4733]) -> [SKIP][492] ([=
Intel XE#4208]) +1 other test skip
>    [491]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-dg2-434/igt@xe_pxp@display-black-pxp-fb.h=
tml
>    [492]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
dg2-464/igt@xe_pxp@display-black-pxp-fb.html
>=20
>   * igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq:
>     - shard-dg2-set2:     [SKIP][493] ([Intel XE#4208]) -> [SKIP][494] ([=
Intel XE#4733]) +2 other tests skip
>    [493]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-dg2-464/igt@xe_pxp@pxp-stale-bo-bind-post=
-termination-irq.html
>    [494]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
dg2-463/igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq.html
>=20
>   * igt@xe_query@multigpu-query-engines:
>     - shard-dg2-set2:     [SKIP][495] ([Intel XE#4208]) -> [SKIP][496] ([=
Intel XE#944]) +1 other test skip
>    [495]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-dg2-464/igt@xe_query@multigpu-query-engin=
es.html
>    [496]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
dg2-435/igt@xe_query@multigpu-query-engines.html
>=20
>   * igt@xe_query@multigpu-query-invalid-cs-cycles:
>     - shard-dg2-set2:     [SKIP][497] ([Intel XE#944]) -> [SKIP][498] ([I=
ntel XE#4208]) +1 other test skip
>    [497]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-dg2-435/igt@xe_query@multigpu-query-inval=
id-cs-cycles.html
>    [498]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
dg2-464/igt@xe_query@multigpu-query-invalid-cs-cycles.html
>=20
>   * igt@xe_render_copy@render-stress-2-copies:
>     - shard-dg2-set2:     [SKIP][499] ([Intel XE#4814]) -> [SKIP][500] ([=
Intel XE#4208])
>    [499]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-dg2-432/igt@xe_render_copy@render-stress-=
2-copies.html
>    [500]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
dg2-464/igt@xe_render_copy@render-stress-2-copies.html
>=20
>   * igt@xe_spin_batch@spin-mem-copy:
>     - shard-dg2-set2:     [SKIP][501] ([Intel XE#4821]) -> [SKIP][502] ([=
Intel XE#4208])
>    [501]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-dg2-436/igt@xe_spin_batch@spin-mem-copy.h=
tml
>    [502]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
dg2-464/igt@xe_spin_batch@spin-mem-copy.html
>=20
>   * igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs=
:
>     - shard-dg2-set2:     [SKIP][503] ([Intel XE#4208]) -> [SKIP][504] ([=
Intel XE#4130])
>    [503]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-dg2-464/igt@xe_sriov_auto_provisioning@se=
lfconfig-reprovision-increase-numvfs.html
>    [504]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
dg2-466/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numv=
fs.html
>=20
>   * igt@xe_sriov_flr@flr-vf1-clear:
>     - shard-dg2-set2:     [SKIP][505] ([Intel XE#3342]) -> [SKIP][506] ([=
Intel XE#4208])
>    [505]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-dg2-434/igt@xe_sriov_flr@flr-vf1-clear.ht=
ml
>    [506]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
dg2-464/igt@xe_sriov_flr@flr-vf1-clear.html
>=20
>   * igt@xe_sriov_scheduling@equal-throughput:
>     - shard-dg2-set2:     [SKIP][507] ([Intel XE#4351]) -> [SKIP][508] ([=
Intel XE#4208])
>    [507]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c=
9da3d8af23f7067f7f4e5a74297/shard-dg2-463/igt@xe_sriov_scheduling@equal-thr=
oughput.html
>    [508]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/shard-=
dg2-464/igt@xe_sriov_scheduling@equal-throughput.html
>=20
>  =20
>   {name}: This element is suppressed. This means it is ignored when compu=
ting
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
>=20
>   [Intel XE#1008]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/10=
08
>   [Intel XE#1035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/10=
35
>   [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/10=
61
>   [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/11=
22
>   [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/11=
23
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/11=
24
>   [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/11=
26
>   [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/11=
27
>   [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/11=
28
>   [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/11=
29
>   [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/11=
35
>   [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/11=
78
>   [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/12=
80
>   [Intel XE#1337]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/13=
37
>   [Intel XE#1340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/13=
40
>   [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/13=
92
>   [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/13=
97
>   [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/14=
01
>   [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/14=
06
>   [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/14=
21
>   [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/14=
24
>   [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/14=
35
>   [Intel XE#1447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/14=
47
>   [Intel XE#1467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/14=
67
>   [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/14=
89
>   [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/14=
99
>   [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/15=
00
>   [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/15=
03
>   [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/17=
27
>   [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/17=
29
>   [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/17=
45
>   [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/17=
94
>   [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/20=
49
>   [Intel XE#2078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/20=
78
>   [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/21=
34
>   [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/21=
68
>   [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/21=
91
>   [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/22=
29
>   [Intel XE#2231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/22=
31
>   [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/22=
84
>   [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/22=
86
>   [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/22=
91
>   [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/23=
11
>   [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/23=
12
>   [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/23=
13
>   [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/23=
16
>   [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/23=
20
>   [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/23=
22
>   [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/23=
41
>   [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/23=
51
>   [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/23=
60
>   [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/24=
26
>   [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/25=
41
>   [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
>   [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/26=
52
>   [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/27=
05
>   [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/27=
63
>   [Intel XE#2838]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/28=
38
>   [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/28=
50
>   [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>   [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/28=
82
>   [Intel XE#2883]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/28=
83
>   [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/28=
87
>   [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/28=
93
>   [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/29=
07
>   [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/29=
38
>   [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/29=
53
>   [Intel XE#3009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/30=
09
>   [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
>   [Intel XE#3012]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/30=
12
>   [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
>   [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
>   [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
>   [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
>   [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
>   [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/31=
13
>   [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/31=
24
>   [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
>   [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
>   [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/33=
04
>   [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/33=
21
>   [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/33=
42
>   [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/33=
74
>   [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/34=
14
>   [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/34=
32
>   [Intel XE#3442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/34=
42
>   [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/35=
44
>   [Intel XE#356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/356
>   [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/35=
73
>   [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
>   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>   [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>   [Intel XE#3767]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/37=
67
>   [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
>   [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/38=
62
>   [Intel XE#3876]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/38=
76
>   [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/41=
30
>   [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/41=
41
>   [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/41=
73
>   [Intel XE#4208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/42=
08
>   [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/42=
12
>   [Intel XE#4294]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/42=
94
>   [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/43=
45
>   [Intel XE#4351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/43=
51
>   [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/43=
54
>   [Intel XE#4356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/43=
56
>   [Intel XE#4359]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/43=
59
>   [Intel XE#4497]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/44=
97
>   [Intel XE#4501]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/45=
01
>   [Intel XE#4519]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/45=
19
>   [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/45=
43
>   [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>   [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/45=
96
>   [Intel XE#4618]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/46=
18
>   [Intel XE#4650]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/46=
50
>   [Intel XE#4689]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/46=
89
>   [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/47=
33
>   [Intel XE#4814]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/48=
14
>   [Intel XE#4821]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/48=
21
>   [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/48=
37
>   [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/49=
15
>   [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/49=
43
>   [Intel XE#4954]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/49=
54
>   [Intel XE#4963]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/49=
63
>   [Intel XE#4996]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/49=
96
>   [Intel XE#5012]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/50=
12
>   [Intel XE#5017]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/50=
17
>   [Intel XE#5020]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/50=
20
>   [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/50=
21
>   [Intel XE#512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/512
>   [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
>   [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
>   [Intel XE#605]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/605
>   [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
>   [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
>   [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
>   [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
>   [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>   [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
>   [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>   [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
>   [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
>   [Intel XE#702]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/702
>   [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
>   [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
>   [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>   [Intel XE#827]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/827
>   [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
>   [Intel XE#873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/873
>   [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
>   [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
>   [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
>   [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
>   [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/25=
75
>=20
>=20
> Build changes
> -------------
>=20
>   * Linux: xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297 -> xe-pw-1469=
41v4
>=20
>   IGT_8362: 8362
>   xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297: dac27c03b365c9da3d8af=
23f7067f7f4e5a74297
>   xe-pw-146941v4: 146941v4
>=20
> =3D=3D Logs =3D=3D
>=20
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146=
941v4/index.html

--=20
