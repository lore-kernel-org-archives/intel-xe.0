Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EBC4CD98C6
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jun 2026 03:15:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 421C110EC79;
	Thu, 11 Jun 2026 03:15:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cuvrp2ZH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ACD510EC76
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jun 2026 03:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781147732; x=1812683732;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=AATRHBK6L+82ShjJpohZcPyGsBlu+45OPoD2WcGzunY=;
 b=cuvrp2ZHIM5FGapIGpU2O2KHCBmRJffWAY4kXc34u26zB3dso/Vcf70S
 f73GTlf7fIpT1vHiMYz22u/ZTKSdN4WYYvOac/Aw58+jB9UQ/B67kI8Xh
 fh8W5+t55sOmxc6chEn5FxpB+v3YlEqQwNGh6KIrLTt1gk6FPSciTlpty
 FD91IrkIXyDgGdcCNModQvNDwvSmeFrLSHGViCPNQlOTdkLBFODgrmuk+
 tLdWKPBka5iy8vKTD/owb/lGsHv+UXFXfy12rPKBujLrvwT5E34mo1SmS
 hoM/et1eSOVj6qqz3rxYLF0DRA5S660wj7S53yytieAUVB7LlK4KZo2ZR A==;
X-CSE-ConnectionGUID: BQTcmd2CSWWVkumsF5Ldxg==
X-CSE-MsgGUID: Lu2EFIEkTZqBc1xsRgsaLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="93343151"
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; d="scan'208";a="93343151"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2026 20:15:32 -0700
X-CSE-ConnectionGUID: Y4yfQce6T4CHT8vNg5DAKg==
X-CSE-MsgGUID: 8RcNKUJBRVakAKQs6qswHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; d="scan'208";a="251455821"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2026 20:15:31 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 10 Jun 2026 20:15:31 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 10 Jun 2026 20:15:31 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.27)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 10 Jun 2026 20:15:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tMOgMk9K30y9c8+ad5m+4qql7bLUeb06zj3RW46sqGjNLdX9jaeOyQZJTSr0ISP/6baKdzLKkJqla/L1vA8Z9t4BscAF8pTLOHummwzOq5wVbpmT5axdL+OJ6hkr7Fn6Oi79PHQdwdHpzKHUX5kqLq8VdVdZYI+guYHSDtGGHe02LUqYlU6sgpRAHBubF3vZhinBwai4zYpUyI4pH+cqJ0N6K6lIbh+B8zcSSVwAlEoS0qAMMCRc24Z5SKFU7EWOz8w+VDEhWVsCEsigOzY5jBPDkOF1/0IDbcKYHvojhGMcQsxjb3sd3AAc0NI1TJOmKs9MhZNHxYnM1y6mbbt7CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/oA+6zKGgQK1OyxGmaAL+MCHXtOwChxfXeoCAnBNeGQ=;
 b=y8tDmKiZU/vh6JAwnXCMb+2bTBAoBLJvPrd9PddglDkDp2uMGnpOr/vPZLgwo6YZatzJASnwmteZ95XAAGnU92NLtwx0tqjSL6q+h6sngEGpvNTsjt4phMy3F3fbKMEKhQ7ypG6+1beZHvZjWOg0LkmlyGOOu+rxDmOf4tRYrPcfStQI6OPM+OaCI6ZFKkn/EkgpEdW7MJM+jIQ/84qrTOTMqW1wXybZbdkLpWYhLDdS7tme9dwEXiuKDf6DAds9PQjJrwrvw51TeISYBY8ZLZfTPHvbjzyjd1GoZHV/4fc/ipcUwstL4fbSd5fBbkcmgBkGv6F98RR12/Rm93RR2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW3PR11MB4667.namprd11.prod.outlook.com (2603:10b6:303:53::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.17; Thu, 11 Jun
 2026 03:15:28 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0092.011; Thu, 11 Jun 2026
 03:15:28 +0000
Date: Wed, 10 Jun 2026 20:15:25 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Zongyao Bai <zongyao.bai@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <jia.yao@intel.com>
Subject: Re: [PATCH] drm/xe/forcewake: add delayed-release optimization
Message-ID: <aiooTTc2eP+uFqL1@gsse-cloud1.jf.intel.com>
References: <20260601213804.707256-1-zongyao.bai@intel.com>
 <aiom7bfet3CddhLq@gsse-cloud1.jf.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aiom7bfet3CddhLq@gsse-cloud1.jf.intel.com>
X-ClientProxiedBy: MW4PR03CA0034.namprd03.prod.outlook.com
 (2603:10b6:303:8e::9) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW3PR11MB4667:EE_
X-MS-Office365-Filtering-Correlation-Id: f1fe9a4f-0094-4b85-6b6e-08dec767aff4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|366016|1800799024|56012099006|4143699003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: pAGB8By77smaJ7qxeUKSsCryFsHBK8paOlv13GefajjZKhZQvYHy8jaiovS/SWMgx3v1KTi/bwCMsQKykQbJgexjHdnTJjBe8uzQO4SFrXTG7CRFULVpAr4z5x0ucFlEitbzjXhH6nx8AWra6rdsclds1ZnqKuxzSyaUAwONDwh4BYwsdsdYuh2Xqyr5lr3QwLblyKPaTrpkPKp5AFxqfgip8c1/wvSvgySmNRw7VAnuxg7csW3t3F9Z1kZuWmHOpi3H1VxkIgq3Do05SuIqVYduDinRmX4J4FxsaBg2MZzJza6Uqqy0q604lI2nxXdCBeYOf5aM5gD3Tc+Uq3hFsOx9A9KJeKXwJ8Z7iTrkaNVxjUvXcjLrLZXnSbSE7ubBV4gu5aCie46fcLtom13qtIXmb2Ku+pFHkJ6RxfeAm+rkXZ60OfVDnBJcqnHuuuMjQ2t+BZyH09PmY5CjUoNjF49UeWa0DPCwBSEayK1ogm8o4eTlOsgpvt0g2EYARquAuLZqFZQoMOP8z5Xgkxa+eyhyDJdKRXowa6EGN/jo+xuVRUzz5M4RqAnv2xEFLLKxdwBg0PzZOvGMexZyDtovIsKdg4NSN/lY/j0+RcVydFo6bWVOGQwZ2gciFKEI0qPPdXjgEMFItk2B2xGW2htrJyuKQ2PxtlhZsj9HN8GDYEySWTjLWrUlETaD9J7Vdi4m
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(56012099006)(4143699003)(11063799006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VTJycUdqVWZaaWdFblJmWnE2RkZLQlVvZDlWMCtsQlluSCs4UktUWFpMNjJL?=
 =?utf-8?B?SGx6UEF1RmhtVmdnVC9nRDBLSnlqWGJjaUthbFU4SXkzNVhlb0YzZU1BL2Jk?=
 =?utf-8?B?OTQ1akxuLzBHM3JneWpUdURLdzhNL3hJejBoNG1QMEozM3FWL2RQeDJJblAw?=
 =?utf-8?B?cDNJMDhqdTJzS0ZrKzQySlB5RmpLK3hvcWMrOXFrNnppaDJjUFBud0dpVFFM?=
 =?utf-8?B?azA1WmRzVFVWMCtxSkhmMnRpWVVTQktyaVJ1eEdWakVFcGtRdGttdjh3dFg4?=
 =?utf-8?B?S3dmb2hwRi9QRkpoSWUxamhjOWw0RUJjQjZzNHlXRVBhTUtocHNjOUFMbW1i?=
 =?utf-8?B?ZG5DN202MUZOcVRDd2dFSE5UOGwrcGFWWmUxMXRWdDMzc3lPS2VOZGVibU5i?=
 =?utf-8?B?QklFaFRRUnVBRmxwN0JRMTAzVzF4NnNYZjJkbE15MnVGcWhndVFJdUxaMnZs?=
 =?utf-8?B?UjBCTHdyZHZ3N3hHMjF2aXFGdkRaVzVzTTVDNWRjT1MrczJkTDdENG44WFFD?=
 =?utf-8?B?WE16UFRDRVpyMUVxMmMwT0djbEFTdFlZOVhMdmFtcWZzSzdGL2QvWG56bnpx?=
 =?utf-8?B?dnRYdFhFaXdRS1pYa2hEZjZmcUlYOTRSUm9IVWVjdmdLYXJXMGM0NkVYbDN2?=
 =?utf-8?B?Z3BFbCtMbHFGRlhaMDJyY2xnTTJLUFpiVlJxa2pQd3RoS2FmRUZCaDNMNElT?=
 =?utf-8?B?RGxIT21lNnAvdUw1aktpL1R4WnNqNWxVTGZOSDNJVXRpZFM0RVRDYjFBUmtL?=
 =?utf-8?B?TWJqNkd5MW1SRFBkNm1HZEJDWUVkVEZBcjRVeXE0eFF6VHdYZ0RiZjdySzBk?=
 =?utf-8?B?VXh2R2t3ckpUNzRaaWdWZXNTSHVMZ3Z1OXpzU0dUdjUxd1BzK0lCTU81NUZV?=
 =?utf-8?B?emJ4cVNkZFBjejJ2SVVPb21XUk5xbStLbThFRUlJVlVPbUgvME4xbWZNbGRo?=
 =?utf-8?B?QkxURURka2k1anh5c0NkempCOXFLbVNmT1hvOFdLN1JMNFhjTzNqeStINjhO?=
 =?utf-8?B?WTMzOW5ZODhIVytqVzUyaEU5cmtlTDlNTXU1MTEyQVNqeEFydW84dTg0NG4v?=
 =?utf-8?B?cE9mU1RrNkFsR3FvODRqRHo5YWtRSnhMbWdQdjd5aTBEamI2VEtrbUd4ck5t?=
 =?utf-8?B?dEVpcERmeVBRNUo2SzA5ZDBYdjZqamVBUmhFR3VwV3ZTVlZVSGNNUkNEOVEr?=
 =?utf-8?B?cmpNTXBPVHplVFJzdFZGSTJ3VUg2dDg5NEx6SFFnNUpPb21kc0F3WUlqajNG?=
 =?utf-8?B?UUZNUW5YZjNlUVJtY3RmaDZ1MFM5Zy9ORWo3RWZMdWh0SzRTMUNyczl2czdK?=
 =?utf-8?B?SVYrUGI4MDBtY09TUTN1VmJjdGNrU0lzckR5QnJ4THhJdGJMUnJzMDJacTJE?=
 =?utf-8?B?VHZoTHhaRW15c3F2RGFPTCtYRjB0OVBrT09kaEt0YU5IOWRuU1l1YUlzZTZ4?=
 =?utf-8?B?S2I3QXgvOUxXelFxTUNiaDA4bHc5OHRpemIveWt3MjdFbHdaV2RlMHpWYyti?=
 =?utf-8?B?QTNNTUkydW44aFNzdmh4VldoUzF2dWw2Z0tZVVRrZmFMbU1PajgrY1Jzeld3?=
 =?utf-8?B?VHBOOXJ3Qis3a0FSMW10eHo1UXpvQVRvZ3AwYUczeVpVeVZwSGU0Tmp0R3Nx?=
 =?utf-8?B?eTNYZktxNk5wYjRGRmhNMmJRSUJGREdya3VkUStxdmYvQm0rNzN3bk04TEU2?=
 =?utf-8?B?NWNJYnZJSmdDSkxnYzNIRURPaml0a2lTTnQ3YVNPWmx5TVJ1Sk1oditPM2xw?=
 =?utf-8?B?UEIzR2thWkpEWElqbDNkUWptTW5qejhjNExramk3VEZjSmtYL0FCc285ajhi?=
 =?utf-8?B?djJMVnVqZXZuWjhJdS9DcXB4NXNlRmovV3podGpBS3BnSlc5MkxBRU5iUlhK?=
 =?utf-8?B?QWdTcFBxUGtFeFBvUmVIb3AvZlhBMnV1c1Y3ZVdTYXQ2b2t1Z0xLd0Y5WE1z?=
 =?utf-8?B?R25lL2Y4OGR0My9BZWtWNnFYVlZhQ0pGeS9DZTJWNUR2M3VOMEdwOXVNR0JH?=
 =?utf-8?B?NEtGb2tqQzUzSFVpYVAxVjJkMnJzOTFndVpIZm5IaUR6S3NpVHBIZ1J4dnVK?=
 =?utf-8?B?T3MxR1R3MEFURW1OWUNoTElMVDc0M3VEbjk2bHdiVHVLVUs2ZEVZekRRalh2?=
 =?utf-8?B?clRDQW1SUlVLb1JJZCt2SmtTS2FhUkhXeGMvZkpNZWNhVnNta2dKelNRWGZi?=
 =?utf-8?B?T044RmVsR25QaEtFRlY2QmpCdFdsZ0pUdlQ1OUVNbFpwZFNjeUJvZFlyNXVy?=
 =?utf-8?B?Z005a0d0MjBvcEFGWHRQcVNnTHJrNktuaXVkTEV0MGZuV1VDclcwVHAzUXg5?=
 =?utf-8?B?a1J1a2pPaGt4dUZybFkyREtWRll2dXgwV29OME5sblhnL1YrNzFDWlBocXBI?=
 =?utf-8?Q?uQWr2gVSArBWloek=3D?=
X-Exchange-RoutingPolicyChecked: BcOh8GY0hm8HFexYJ9DmFUacx4txM7dBPjtBVMu78Rpyi2w2R38r9XijjQu/RBwo7qePLcGvRP8MrvKsXDtqEhg+LEEKDoTx+sdkeedwyMcIXQ/gyG/JCUcEmAERqVBRzsCxF6bIJU9DPGktLmuRQVo1kio5Twm/l2MK4IxiHQG8DclS2PNLclzUKFt+ywmkTj5o+TAnmuUs6JqeM85xLPYwIxNDJRfJoL4hF1wA/kom2JNq6GDnhBiP8cD32rAw0gjXEAoCRqJpO23sjWIeY+pysUJmejSSrx/SJrJlgS1jrB17gS1TPg3X6imAkvasOdU1PBFBvvrd+GB1RrP8oA==
X-MS-Exchange-CrossTenant-Network-Message-Id: f1fe9a4f-0094-4b85-6b6e-08dec767aff4
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 03:15:28.1680 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WhKFHSv9MIDvofza6TphciXVUoHZhouRAwwqSRkCxgCioxeNCgC5gRDKWzVRVoYTPY2k0ATeTevqDN0GTcj8Kw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4667
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

On Wed, Jun 10, 2026 at 08:09:33PM -0700, Matthew Brost wrote:

Ugh, I realized I replied to wrong version but I think most of comments
are still relavent to v2, so let's continue the discussion here.

Matt 

> On Mon, Jun 01, 2026 at 09:38:04PM +0000, Zongyao Bai wrote:
> > Add delayed-release optimization:
> >     - Add domain sleep 200us after xe_force_wake_put()
> >     - Skip MMIO wake in xe_force_wake_get() if domain still awake.
> > Reduces frequent wake/sleep cycles for back-to-back operations.
> > Examples of scenarios: zeDeviceGetGlobalTimestamps read by VTune, PTI
> > 
> 
> I think this concept makes sense, as MMIO read operations are relatively
> expensive in terms of time cost (perhaps ~5 µs). However, the downside
> is increased power usage.
> 
> Should we make delayed release an optional call—for example,
> xe_force_wake_put_delay—and only use it in specific critical paths? For
> instance, we could limit its use to paths tied to Level Zero calls like
> zeDeviceGetGlobalTimestamps.
> 
> This gets a bit tricky if xe_force_wake_put_delay is called and is not
> the last reference, followed by xe_force_wake_put being the final
> reference. However, it should be straightforward to track that an
> delayed put was requested and have the final xe_force_wake_put issue the
> delay.
> 
> > Signed-off-by: Zongyao Bai <zongyao.bai@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_force_wake.c       | 111 +++++++++++++++++------
> >  drivers/gpu/drm/xe/xe_force_wake.h       |   4 +-
> >  drivers/gpu/drm/xe/xe_force_wake_types.h |  11 +++
> >  drivers/gpu/drm/xe/xe_gt.c               |   4 +-
> >  4 files changed, 99 insertions(+), 31 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
> > index 197e2197bd0a..183a17fa6d68 100644
> > --- a/drivers/gpu/drm/xe/xe_force_wake.c
> > +++ b/drivers/gpu/drm/xe/xe_force_wake.c
> > @@ -6,15 +6,20 @@
> >  #include "xe_force_wake.h"
> >  
> >  #include <drm/drm_util.h>
> > +#include <linux/device.h>
> > +#include <linux/hrtimer.h>
> >  
> >  #include "regs/xe_gt_regs.h"
> >  #include "regs/xe_reg_defs.h"
> > +#include "xe_device.h"
> >  #include "xe_gt.h"
> >  #include "xe_gt_printk.h"
> >  #include "xe_mmio.h"
> > +#include "xe_pm.h"
> >  #include "xe_sriov.h"
> >  
> >  #define XE_FORCE_WAKE_ACK_TIMEOUT_MS	50
> > +#define XE_FORCE_WAKE_HOLD_DELAY_US	200
> 
> How did you choose this value? It seems like it should be something
> configurable via Kconfig or configfs.
> 
> >  
> >  static const char *str_wake_sleep(bool wake)
> >  {
> > @@ -27,6 +32,8 @@ static void mark_domain_initialized(struct xe_force_wake *fw,
> >  	fw->initialized_domains |= BIT(id);
> >  }
> >  
> > +static enum hrtimer_restart xe_force_wake_domain_timer(struct hrtimer *timer);
> > +
> >  static void init_domain(struct xe_force_wake *fw,
> >  			enum xe_force_wake_domain_id id,
> >  			struct xe_reg reg, struct xe_reg ack)
> > @@ -38,11 +45,29 @@ static void init_domain(struct xe_force_wake *fw,
> >  	domain->reg_ack = ack;
> >  	domain->val = FORCEWAKE_MT(FORCEWAKE_KERNEL);
> >  	domain->mask = FORCEWAKE_MT_MASK(FORCEWAKE_KERNEL);
> > +	domain->fw_back = fw;
> > +	hrtimer_setup(&domain->timer, xe_force_wake_domain_timer,
> > +		      CLOCK_MONOTONIC, HRTIMER_MODE_REL);
> >  
> >  	mark_domain_initialized(fw, id);
> >  }
> >  
> > -void xe_force_wake_init_gt(struct xe_gt *gt, struct xe_force_wake *fw)
> > +static void xe_force_wake_fini(void *arg)
> > +{
> > +	struct xe_force_wake *fw = arg;
> > +	struct xe_gt *gt = fw->gt;
> > +	struct xe_force_wake_domain *domain;
> > +	unsigned int tmp;
> > +
> > +	for_each_fw_domain(domain, fw, tmp) {
> > +		xe_gt_WARN(gt, domain->ref,
> > +			   "Forcewake domain %d still referenced (%u) at teardown\n",
> > +			   domain->id, domain->ref);
> 
> Is the warning above actually valid? It seems fairly normal for a fini
> to race with a delayed fw put. I would drop this.
> 
> > +		hrtimer_cancel(&domain->timer);
> > +	}
> > +}
> > +
> > +int xe_force_wake_init_gt(struct xe_gt *gt, struct xe_force_wake *fw)
> >  {
> >  	struct xe_device *xe = gt_to_xe(gt);
> >  
> > @@ -58,6 +83,8 @@ void xe_force_wake_init_gt(struct xe_gt *gt, struct xe_force_wake *fw)
> >  			    FORCEWAKE_GT,
> >  			    FORCEWAKE_ACK_GT);
> >  	}
> > +
> > +	return devm_add_action_or_reset(xe->drm.dev, xe_force_wake_fini, fw);
> >  }
> >  
> >  void xe_force_wake_init_engines(struct xe_gt *gt, struct xe_force_wake *fw)
> > @@ -142,10 +169,36 @@ static void domain_sleep(struct xe_gt *gt, struct xe_force_wake_domain *domain)
> >  	__domain_ctl(gt, domain, false);
> >  }
> >  
> > -static int domain_sleep_wait(struct xe_gt *gt,
> > -			     struct xe_force_wake_domain *domain)
> > +static enum hrtimer_restart xe_force_wake_domain_timer(struct hrtimer *timer)
> >  {
> > -	return __domain_wait(gt, domain, false);
> > +	struct xe_force_wake_domain *domain =
> > +		container_of(timer, struct xe_force_wake_domain, timer);
> > +	struct xe_force_wake *fw = domain->fw_back;
> > +	struct xe_gt *gt = fw->gt;
> > +	unsigned long flags;
> > +
> > +	xe_gt_assert(gt, !xe_pm_runtime_suspended(gt_to_xe(gt)));
> > +
> > +	spin_lock_irqsave(&fw->lock, flags);
> 
> I'd use guard(spinlock_irqsave) here rather manually unlock this.
> hrtimer_forward_now should be safe under fw->lock unless I'm missing
> something.
> 
> > +
> > +	if (!(fw->timer_domains & BIT(domain->id)) || domain->ref) {
> > +		spin_unlock_irqrestore(&fw->lock, flags);
> > +		return HRTIMER_NORESTART;
> > +	}
> > +	if (domain->timer_rearm) {
> > +		domain->timer_rearm = false;
> > +		spin_unlock_irqrestore(&fw->lock, flags);
> > +		hrtimer_forward_now(timer,
> > +				    ns_to_ktime(XE_FORCE_WAKE_HOLD_DELAY_US *
> > +						NSEC_PER_USEC));
> > +		return HRTIMER_RESTART;
> > +	}
> > +	fw->timer_domains &= ~BIT(domain->id);
> > +	domain_sleep(gt, domain);
> > +	fw->awake_domains &= ~BIT(domain->id);
> > +	spin_unlock_irqrestore(&fw->lock, flags);
> > +
> > +	return HRTIMER_NORESTART;
> >  }
> >  
> >  /**
> > @@ -187,8 +240,13 @@ unsigned int __must_check xe_force_wake_get(struct xe_force_wake *fw,
> >  	spin_lock_irqsave(&fw->lock, flags);
> >  	for_each_fw_domain_masked(domain, ref_rqst, fw, tmp) {
> >  		if (!domain->ref++) {
> > -			awake_rqst |= BIT(domain->id);
> > -			domain_wake(gt, domain);
> > +			if (fw->awake_domains & BIT(domain->id)) {
> > +				fw->timer_domains &= ~BIT(domain->id);
> > +				hrtimer_try_to_cancel(&domain->timer);
> > +			} else {
> > +				awake_rqst |= BIT(domain->id);
> > +				domain_wake(gt, domain);
> > +			}
> >  		}
> >  		ref_incr |= BIT(domain->id);
> >  	}
> > @@ -213,27 +271,25 @@ unsigned int __must_check xe_force_wake_get(struct xe_force_wake *fw,
> >  }
> >  
> >  /**
> > - * xe_force_wake_put - Decrement the refcount and put domain to sleep if refcount becomes 0
> > + * xe_force_wake_put - Decrement the refcount and arm the delayed-sleep timer
> >   * @fw: Pointer to the force wake structure
> >   * @fw_ref: return of xe_force_wake_get()
> >   *
> > - * This function reduces the reference counts for domains in fw_ref. If
> > - * refcount for any of the specified domain reaches 0, it puts the domain to sleep
> > - * and waits for acknowledgment for domain to sleep within 50 milisec timeout.
> > - * Warns in case of timeout of ack from domain.
> > + * This function reduces the reference counts for domains in fw_ref.  When a
> > + * domain's refcount reaches 0 the sleep request is not issued immediately;
> > + * instead a hrtimer is armed for XE_FORCE_WAKE_HOLD_DELAY_US so that a rapid
> > + * xe_force_wake_get() can reuse the still-awake domain at zero MMIO cost.  On
> > + * timer expiry, if the domain is still idle, the sleep request is written.
> > + * Mirroring i915's fw_domains_put(), the deferred sleep is fire-and-forget:
> > + * no sleep ACK is polled, since the next wake re-waits for the wake ACK.
> 
> Let's not mention the i915 in Xe code.
> 
> >   */
> >  void xe_force_wake_put(struct xe_force_wake *fw, unsigned int fw_ref)
> >  {
> >  	struct xe_gt *gt = fw->gt;
> >  	struct xe_force_wake_domain *domain;
> > -	unsigned int tmp, sleep = 0;
> > +	unsigned int tmp;
> >  	unsigned long flags;
> > -	int ack_fail = 0;
> >  
> > -	/*
> > -	 * Avoid unnecessary lock and unlock when the function is called
> > -	 * in error path of individual domains.
> > -	 */
> 
> Why delete this comment?
> 
> >  	if (!fw_ref)
> >  		return;
> >  
> > @@ -245,20 +301,19 @@ void xe_force_wake_put(struct xe_force_wake *fw, unsigned int fw_ref)
> >  		xe_gt_assert(gt, domain->ref);
> >  
> >  		if (!--domain->ref) {
> > -			sleep |= BIT(domain->id);
> > -			domain_sleep(gt, domain);
> > +			fw->timer_domains |= BIT(domain->id);
> > +			if (hrtimer_callback_running(&domain->timer)) {
> > +				domain->timer_rearm = true;
> > +			} else {
> > +				domain->timer_rearm = false;
> > +				hrtimer_start(&domain->timer,
> > +					      ns_to_ktime(XE_FORCE_WAKE_HOLD_DELAY_US *
> > +							  NSEC_PER_USEC),
> > +				      HRTIMER_MODE_REL);
> > +			}
> >  		}
> >  	}
> > -	for_each_fw_domain_masked(domain, sleep, fw, tmp) {
> > -		if (domain_sleep_wait(gt, domain) == 0)
> > -			fw->awake_domains &= ~BIT(domain->id);
> > -		else
> > -			ack_fail |= BIT(domain->id);
> > -	}
> >  	spin_unlock_irqrestore(&fw->lock, flags);
> > -
> > -	xe_gt_WARN(gt, ack_fail, "Forcewake domain%s %#x failed to acknowledge sleep request\n",
> > -		   str_plural(hweight_long(ack_fail)), ack_fail);
> 
> This deleted code for domain_sleep_wait / error probably needs to be in
> xe_force_wake_domain_timer.
> 
> >  }
> >  
> >  const char *xe_force_wake_domain_to_str(enum xe_force_wake_domain_id id)
> > diff --git a/drivers/gpu/drm/xe/xe_force_wake.h b/drivers/gpu/drm/xe/xe_force_wake.h
> > index e2721f205d6c..19679b923dca 100644
> > --- a/drivers/gpu/drm/xe/xe_force_wake.h
> > +++ b/drivers/gpu/drm/xe/xe_force_wake.h
> > @@ -11,8 +11,8 @@
> >  
> >  struct xe_gt;
> >  
> > -void xe_force_wake_init_gt(struct xe_gt *gt,
> > -			   struct xe_force_wake *fw);
> > +int xe_force_wake_init_gt(struct xe_gt *gt,
> > +			  struct xe_force_wake *fw);
> >  void xe_force_wake_init_engines(struct xe_gt *gt,
> >  				struct xe_force_wake *fw);
> >  unsigned int __must_check xe_force_wake_get(struct xe_force_wake *fw,
> > diff --git a/drivers/gpu/drm/xe/xe_force_wake_types.h b/drivers/gpu/drm/xe/xe_force_wake_types.h
> > index 14b7b86e801b..ee5675069fe0 100644
> > --- a/drivers/gpu/drm/xe/xe_force_wake_types.h
> > +++ b/drivers/gpu/drm/xe/xe_force_wake_types.h
> > @@ -6,6 +6,7 @@
> >  #ifndef _XE_FORCE_WAKE_TYPES_H_
> >  #define _XE_FORCE_WAKE_TYPES_H_
> >  
> > +#include <linux/hrtimer.h>
> >  #include <linux/mutex.h>
> >  #include <linux/types.h>
> >  
> > @@ -51,6 +52,8 @@ enum xe_force_wake_domains {
> >  	XE_FORCEWAKE_ALL	= BIT(XE_FW_DOMAIN_ID_COUNT)
> >  };
> >  
> > +struct xe_force_wake;
> > +
> >  /**
> >   * struct xe_force_wake_domain - Xe force wake power domain
> >   *
> > @@ -82,6 +85,12 @@ struct xe_force_wake_domain {
> >  	u32 mask;
> >  	/** @ref: domain reference */
> >  	u32 ref;
> > +	/** @timer_rearm: put() ran while callback was in-flight; callback must restart timer */
> 
> Protected fw_back->lock.
> 
> > +	bool timer_rearm;
> 
> In general, I’d reorganize the layout so that structs are at the top of
> xe_force_wake_domain, followed by u32 fields, and finally the bool
> fields.
> 
> > +	/** @timer: hrtimer for delayed sleep request */
> > +	struct hrtimer timer;
> > +	/** @fw_back: back pointer to parent xe_force_wake */
> > +	struct xe_force_wake *fw_back;
> >  };
> >  
> >  /**
> > @@ -101,6 +110,8 @@ struct xe_force_wake {
> >  	spinlock_t lock;
> >  	/** @awake_domains: mask of all domains awake */
> >  	unsigned int awake_domains;
> > +	/** @timer_domains: mask of domains with an outstanding delayed-sleep timer */
> > +	unsigned int timer_domains;
> >  	/** @initialized_domains: mask of all initialized domains */
> >  	unsigned int initialized_domains;
> >  	/** @domains: force wake domains */
> > diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> > index 783eb6d631b5..43a79698cd04 100644
> > --- a/drivers/gpu/drm/xe/xe_gt.c
> > +++ b/drivers/gpu/drm/xe/xe_gt.c
> > @@ -511,7 +511,9 @@ int xe_gt_init_early(struct xe_gt *gt)
> >  
> >  	xe_wa_process_gt_oob(gt);
> >  
> > -	xe_force_wake_init_gt(gt, gt_to_fw(gt));
> > +	err = xe_force_wake_init_gt(gt, gt_to_fw(gt));
> > +	if (err)
> > +		return err;
> 
> I'd add newline here.
> 
> Matt
> 
> >  	spin_lock_init(&gt->global_invl_lock);
> >  
> >  	err = xe_gt_tlb_inval_init_early(gt);
> > -- 
> > 2.43.0
> > 
