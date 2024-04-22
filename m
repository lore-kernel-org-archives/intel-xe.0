Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D6A2C07C79
	for <intel-xe@archiver.kernel.org>; Mon, 22 Apr 2024 16:43:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 193231120AF;
	Mon, 22 Apr 2024 16:43:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F45hZ05u";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1AF41120AF
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Apr 2024 16:43:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713804199; x=1745340199;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=WS7/utHs2AiujYJoeVTcs6mhjZ3zY4CsvzM7+Z9+RUo=;
 b=F45hZ05u+zkeWZfuVWcDDFz1o0nIuyr06BnWEADWj7wADZ6Tco89+h0J
 KDLxg/miPeG418czcMD1Rd7CNrDdJHlAweizWaPabFcIvnLqWeJthX7WX
 oOBbgpwJwfLK6qRGscxFUIgVbf6ETjC8drK0cSBFvgk5mdGo5eW94fsv7
 qQ4e842WUtvRPneapIMhKJIDi4pJNm4hS3zAYLmJ28+nuVcs3mThunW9z
 JFVd3eg7Q0zPzIyPGiJR5J/f6YSi3RRsnmdMHgdQU3UK/isbbpmPGVWLs
 dabmZCMdPcFBaaMP9tkU63DQkJdGiyl17Jm6/yRrzIkqAfH4XgndnxXfi g==;
X-CSE-ConnectionGUID: QoY63D1QQfe4ywpiWzBcqg==
X-CSE-MsgGUID: e0FT3z9vSci/vOnVTE7tkA==
X-IronPort-AV: E=McAfee;i="6600,9927,11052"; a="9269752"
X-IronPort-AV: E=Sophos;i="6.07,221,1708416000"; 
   d="scan'208";a="9269752"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2024 09:43:18 -0700
X-CSE-ConnectionGUID: 6WXJGszFSyy5BGXXfwZ28A==
X-CSE-MsgGUID: gs0FOHqrSQaDGj7RRHiy1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,221,1708416000"; d="scan'208";a="24126620"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Apr 2024 09:43:17 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 22 Apr 2024 09:43:16 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 22 Apr 2024 09:43:16 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 22 Apr 2024 09:43:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hRaakg9oo7jQs+LCphcoyUMXvns4vBJE79yib5P8A2+J4BEDl/tKcGHw594N+/eM+15FSIWT+zORef1S2ihI5dY5P/MJtaQe/Hi/EzUV3PZA3UBkUzbLDvmxFN4oQMTuP97GBcjLaU5Wzp/aDfrFZNFgv/IICcroXp+kt9FSQgGfd/DKQHTW2xt75FGrWgk7n2qzKiTxkB/hoeFV0/CZiswoh09Osiznd9s6mR1SsyJdgLB1EdXBBwgujimZNk47MyLSUTugPWuOyGy83FaEc7CF6kVyHYt3plDJXmngLbxUn6CmUh5fnpgsDOtQVevROjdgkLIGozVJNYdoLCIQrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EXVc0+37nMN5Igj/kyYB9Jqjreq4a0nyaXWxxx03hGM=;
 b=gA7Q3V0zMSVnk64UHfb4c4SSo8iGuUOwjFOIUWL13VHMTiEgQT3oju6w2WX0ggYpGLAe8pVipvQpFfRcWX3dljJgmLiriqX8rUnksxKOQfYw2j+oyDGIBhi6Pmp4/Bh3pZ2YbGHoFZo4Jo4EtocA5mzITrHucpJm8RoqmB5TLW4/dgAWYbKW7gWtn9Lgx3/lwfTXeh3z4bZxgveZVj3e3MzjwafDDV+kQ2Z16HZUXBwOO9EFIv4tlewpZIVZB8HD/71CWkJl3X0REcWrRfsYUw675A8rY0fd+Klm33NGHk+xB1mvZnj83Pvz1EfDc0+2cPFe+e4KtCngbM3oNwIuuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by SA1PR11MB8427.namprd11.prod.outlook.com (2603:10b6:806:373::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.20; Mon, 22 Apr
 2024 16:43:14 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::b867:cbf6:e190:6eb]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::b867:cbf6:e190:6eb%5]) with mapi id 15.20.7519.018; Mon, 22 Apr 2024
 16:43:13 +0000
Date: Mon, 22 Apr 2024 18:43:11 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/3] drm/xe/pf: Expose SR-IOV VFs configuration over
 debugfs
Message-ID: <20240422164311.laruvdr2jlyz6rsg@intel.com>
References: <20240418203442.226-1-michal.wajdeczko@intel.com>
 <20240418203442.226-2-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240418203442.226-2-michal.wajdeczko@intel.com>
X-ClientProxiedBy: MI1P293CA0001.ITAP293.PROD.OUTLOOK.COM (2603:10a6:290:2::8)
 To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|SA1PR11MB8427:EE_
X-MS-Office365-Filtering-Correlation-Id: b44ecb6b-37bf-41bf-29ef-08dc62eb4d77
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U0J6TGZHRHhSekRUWUl5VXhZdWQyM1BWSC9CaGpKMVBuWW1OK3FFQmNaU3FX?=
 =?utf-8?B?WDdXMHNMU1QwRnFOK1FiREgvS2lpL01JaHIvcXVTMWJsS0prZXZEeVNxdThQ?=
 =?utf-8?B?a1phYWRNTGluU0U3YVREbGtXU3gxcllMaXVmTjFhRFpLRFNSUEJkbjlBclQr?=
 =?utf-8?B?MzQrZHgvbk8rS3FrcXBwZnIyYmJUTy90YUFOblJXY2FxTHgxZGZYbzRjWkFD?=
 =?utf-8?B?ZmZUYzVkQm1udFVzSko3SDBFVHRwSVB0ZGtqWDR5cDkxQitoK1JVTEQ3YURI?=
 =?utf-8?B?bFl5T0V5Y1k0Z1BpaDNVbWlXNFhhNGR0U2xiSURtL3k0T2E5Z3FzS0ZxZ3Fp?=
 =?utf-8?B?Q3EvTWtVVS96OTVsdWlrdEQ3VFNJOU9WODRwM2QzYzNaR3BTcnhyb1dZNGhZ?=
 =?utf-8?B?NFBIcWs4QjJBcE5teERyem5sL0wvWkZOVnh3RkRkblQzYlgxallIZkl1RzBz?=
 =?utf-8?B?TkVndk5SSHJYU1ZUc0QrckthVFUrZ3QyS040eHVjYnovNm5sRXdNd2ZyYkxH?=
 =?utf-8?B?cFo3UmxrK3duVWFFQ3MrcWVjQU90RUpEa1A3T1VXS0NCQkllM3lVYkQyc296?=
 =?utf-8?B?V1NQS2Y2STd3K0NNTEZteldYWXQrSDBpL05Wck5EZ1ExbmlVQXZsUEV3NXNl?=
 =?utf-8?B?cVV4UzlPUE1wQlN6VHhkbkJKZXJTRlFmSnorT3kycFJ4T3N1dkxPS2JzdlFV?=
 =?utf-8?B?TzRXcEp4Z2ZvWDgwR3NoelVVVnUyVlAzUU9qaTkyUnh1MFp0dmpJWHkrVFM2?=
 =?utf-8?B?UFVPd3FDMlNyQ2hsTnVqS0FhS2h1OGF0NmhoQ21vcTBYbDlFRDhBeEdzZXNj?=
 =?utf-8?B?TmVycFpaV252TzVSUk5BZnVQNzZ1NUtybjVobTVZSFVrdjNsQ0RVZG1vT3Fw?=
 =?utf-8?B?eUFzQ2tDVHNDTXNVcjNhSVJ6UVVYK0d2SEtVT01VME9DY0E1Q2xXeUpWOUNZ?=
 =?utf-8?B?eUt5RTBzYmRZNGQycHgwVkNiQ29vYk1BdkJ3V1M5N2Y4MzdTUndDdDRqNUdx?=
 =?utf-8?B?cFVLVFdpb0hTeWMvNEhVeGtuZUpXeXVGSDI3MkxGdlNaZittL1N4RldVQ1pL?=
 =?utf-8?B?MkJKaW01U1NJazMxb1IvOUVnZTZHSVBqWU85dTM4RE5ERDdRdTJVeGFtQkYx?=
 =?utf-8?B?MVRqZllQRUw5eEhJaWtEMDFNVU9hd3p2SkFuKzBSdXNESGQzTDArdmlEekI1?=
 =?utf-8?B?bnNJcWtEdU5qK0hyTmtFZmtoRHdtbmp3NFhLRU9hVC9hbjJSNVViT0pyRlJN?=
 =?utf-8?B?T0tHR25kTFkvNWVhK2pBQkpwdTNDZUl4cG9NZStqWkRmSkloZi81bGhOWlR4?=
 =?utf-8?B?UC9DQ0N4RkZ5S2pmV3N6N05TSUo2ank3cldhOFlZMmhNZ3YrRTBHTVBWUE02?=
 =?utf-8?B?QW82aU5wU3R0dGRqSVFyQ2JLeXc2RGhRT0pnQTVhYlFxVGtTVElMZ1A2bUcx?=
 =?utf-8?B?MTJkTWs2TWU5NGNZK0R0cE9Geld4VDMwV2RHYXBuZlo4TFc3anA5eFFwOTEz?=
 =?utf-8?B?U281dm9xd2pNaytQRjAvV2pTU1RmNEtCc203K2k3OWtiVDdpbldvVExiZFp2?=
 =?utf-8?B?YzQrNGlaN1dSb0FBMjJkL1NsSTJxZnlIekpOYldOamsvRFBIdUxwSG9Ra205?=
 =?utf-8?B?KzhNZ1Y0c09RdFBodEF6SlJ1bWtaRU9wOTVvaVVKY0RYU1JSbE9Sa3lZQWZZ?=
 =?utf-8?B?R0JWT2lnVEUvVUdzUGhjOG5MRTlKdTlwd0YzYmtXZVArZkNPWTZlSUF3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eUU3OGdVZWljbng2TCtTNkJZMXNOUitKQmkxMFZRM1FiU3pOelhWWGhVaDh4?=
 =?utf-8?B?b2orOVR4VzdvNm5QeWRVd3kvUHExNVBpL1pYVnh2WFRQWW8wQnZsbVhwUE9E?=
 =?utf-8?B?YTBGblVZZ1drSHdyQTRWRzFDMkR5WXlNWnpHK0VyWXZYYnZIU0ppOEFPYVNO?=
 =?utf-8?B?YlhlL1pCK0NFU1hPQWxzQzRMbXBoWUNBbHVtM3IwdGRtckxTeXUrZXlJZExi?=
 =?utf-8?B?YzVvYUp5TE1qcWZ2eHFhd1NRYTNhcFBWc3VmbHZiV3YzbGd3aUtWWkZpdkZI?=
 =?utf-8?B?MDFwV3AyckVNaVpsZE1KQmJxakpWVDUxVDRpajhtcmFjSWp4TnNDKzJrTUtw?=
 =?utf-8?B?dEVoM3NkRGFKOVNTeHVYSUtIZC8vSGl0aFN2YU85MGxLT1VDc3U2S09KNFIx?=
 =?utf-8?B?TjIva2NIZ0tzS3VEVVMyQzJzT25nSlFGZzlBNzduNVBZaVpzZis3aDVicWRq?=
 =?utf-8?B?WHNhNzhodVg1UHZ0ZWpjSDFTd3NyRzljQVdtYVVwbVU3Tkh5R2RDZkVEYXNv?=
 =?utf-8?B?ZXlUT2dWRUQ1cUtXUWc2ZFNtdlFLblVFdE1hWGQ2ZWJ4aXR1YVJkMXNkcDhm?=
 =?utf-8?B?aC9OYVY0eWttNG05Yk8yK1EvMjNPNWJaQ0xBem9GZzFYYnlvZ1Z0Zk9kc0dQ?=
 =?utf-8?B?VGI5cGJrRXoxL1ZTclpNTGtFZXhKWENnQy9VOHZtbUNJNEtYL25JM2x3Z1RG?=
 =?utf-8?B?THA1WTdOVHhLRzVQRUdmZzFsSzNQekFBVzZnNGNBYnQwUnJ4OHVaekJ1ME51?=
 =?utf-8?B?VnoyMm82TlVEZjFyRHNuRWcvdDBTclhobGMwNU9EbzhUdnFsYVVuRlpmdkNR?=
 =?utf-8?B?bjc2TExhMFFuZHZ2RnA3M2lLMFQ1Q2g2aTB1WmdzaWMzOFBZa1hLZ1VvN1J3?=
 =?utf-8?B?eGR3d1h1anczVXVkL24rMW5qa1ppbWRDaklMV1Z0QWlDakRxQkcxelhlQlJj?=
 =?utf-8?B?THFRb3JZSUJ3SUk1ZU5JdTZxeDNrQ1RSUWlJd2t0Zm1NQ0xIRlE0MkdubGtL?=
 =?utf-8?B?cmN2UzVZcy9qSWRURThwUTBsVGpoKzZlcXAydndTait2ZFlVSGtxREVvaGJz?=
 =?utf-8?B?eU5BWENNanBCK3dRSldKSjBoUUhTVmtnbEsveVBjVUQ4OTN6ZGR6MXp6U3A4?=
 =?utf-8?B?NWdVcmtMcmdFYzJIeVk0b3d6cGlIWTA3dkcwcWpJWldJSnh4bFAxQXQ2TUQx?=
 =?utf-8?B?QVF6cXVDODRoTFhsWGkwYjBRTnZNbHg1dnd2WFRoUkM3eElBeDc3Y0hnUFB4?=
 =?utf-8?B?RWNiQVh5eVd1K0ZzL3BZTzliSlNjMktNdmtwTTJld1FTdkNSZncyVzlQYmIr?=
 =?utf-8?B?SUsyZlFQMUo5TzVJZkQrczRyMi9FdW1UZ1RaaDNYQ2tzWHRpWmRUOWc4Unh5?=
 =?utf-8?B?cjhvSjZpTkJGWUs5N2o1TWpvL0hwWUVhV3RjRjY5VjYwdm1sb2U2SXNyOUZY?=
 =?utf-8?B?T25uQWRrYm4wWjhydkQvNzVoUUNkOCtnRndvRkgvMlNTYnNUd1BIYit0bFIy?=
 =?utf-8?B?cHROVk9JV1ZzSk1kdTJJanF1QXBlNVYwSUVOV1lHNElDWUZFNEFQOEpQOUVj?=
 =?utf-8?B?NUMzbE1yOGZ4Vy9ibUVmcHdvb2pWb1V3YzhYUi94bFZIRm85Wi9MOXMvSEtI?=
 =?utf-8?B?UzFWdmZVYjlWL2VGL0hDaDlrYlB3d3crN0ZSa2I3Y1daZHVSeUhpNGZoYko1?=
 =?utf-8?B?M0R0TTltcjZOd3k0NW1RVEU0SGxvMVBJSml1cFlTbEdaVm1kU3dpMmVldEo0?=
 =?utf-8?B?aVQ0cWV0Y1FIVGJYY2ExdzRXeXRkZytla0drOEVVZmp3V043V1QwejFJcE10?=
 =?utf-8?B?a1BBMEE1dkVqQlNibEUzVUN3a1RxRm5xK0ZCMmM1UE80Sk01YXVBQjNIYitG?=
 =?utf-8?B?REczTUxRcjhMQktqdUp0a3BubnI0ZHRuejhkd1kzUjRKcXh6WU1IQmFXTlN1?=
 =?utf-8?B?NENHVFFtaVRBUnR4UVg0aG0xYS9Oa1ZCVEhacVllaUJ4WC9GejJqZnVHSXVG?=
 =?utf-8?B?YzJmVncraDlPckU3ditUSXU2SGtmMVhDZWZRcVc5cDBBWXE2VTdQRHZTZlFR?=
 =?utf-8?B?VW4yWHJrWXB2cFJDbEpkQk1JdGhyaldNeEJhaXk1d3RMWVNWNGs3T1VNNjdj?=
 =?utf-8?B?NjFNcGs4ZitJK1RMTmNpbkRDWnlLdlBSaEQ4MDR5MXJhNU1VdTlhQWdaK3hr?=
 =?utf-8?B?N3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b44ecb6b-37bf-41bf-29ef-08dc62eb4d77
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2024 16:43:13.9040 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8MPHcWv+lJLNJCfLtE3FU0wwdgxYIhiXe+qU0MJaLSDL0b/lA9v6p7OBW/JZOf56NRYyVaoo0ezgCos6XQR7d/jNApQ4Q7LJtPMsZn1VDZ0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8427
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on czw [2024-kwi-18 22:34:40 +0200]:
> We already have functions to configure VF resources and to print
> actual provisioning details. Expose this functionality in debugfs
> to allow experiment with different settings or inspect details in
> case of unexpected issues with the provisioning.
> 
> As debugfs attributes are per-VF, we use parent d_inode->i_private
> to store VFID, similarly how we did for per-GT attributes.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/Makefile                 |   1 +
>  drivers/gpu/drm/xe/xe_gt_debugfs.c          |   5 +
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c | 203 ++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.h |  18 ++
>  4 files changed, 227 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
>  create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 8321ec4f9b46..94107b1bf2a4 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -163,6 +163,7 @@ xe-$(CONFIG_PCI_IOV) += \
>  	xe_gt_sriov_pf.o \
>  	xe_gt_sriov_pf_config.o \
>  	xe_gt_sriov_pf_control.o \
> +	xe_gt_sriov_pf_debugfs.o \
>  	xe_gt_sriov_pf_policy.o \
>  	xe_lmtt.o \
>  	xe_lmtt_2l.o \
> diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> index ff7f4cf52fa9..599aed47f2ba 100644
> --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> @@ -13,6 +13,7 @@
>  #include "xe_ggtt.h"
>  #include "xe_gt.h"
>  #include "xe_gt_mcr.h"
> +#include "xe_gt_sriov_pf_debugfs.h"
>  #include "xe_gt_topology.h"
>  #include "xe_hw_engine.h"
>  #include "xe_lrc.h"
> @@ -21,6 +22,7 @@
>  #include "xe_pm.h"
>  #include "xe_reg_sr.h"
>  #include "xe_reg_whitelist.h"
> +#include "xe_sriov.h"
>  #include "xe_uc_debugfs.h"
>  #include "xe_wa.h"
>  
> @@ -288,4 +290,7 @@ void xe_gt_debugfs_register(struct xe_gt *gt)
>  				 root, minor);
>  
>  	xe_uc_debugfs_register(&gt->uc, root);
> +
> +	if (IS_SRIOV_PF(xe))
> +		xe_gt_sriov_pf_debugfs_register(gt, root);
>  }
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
> new file mode 100644
> index 000000000000..32ce98698690
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
> @@ -0,0 +1,203 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2023-2024 Intel Corporation
> + */
> +
> +#include <linux/debugfs.h>
> +
> +#include <drm/drm_print.h>
> +#include <drm/drm_debugfs.h>
> +
> +#include "xe_bo.h"
> +#include "xe_debugfs.h"
> +#include "xe_device.h"
> +#include "xe_gt.h"
> +#include "xe_gt_debugfs.h"
> +#include "xe_gt_sriov_pf_config.h"
> +#include "xe_gt_sriov_pf_debugfs.h"
> +#include "xe_gt_sriov_pf_helpers.h"
> +#include "xe_pm.h"
> +
> +/*
> + *      /sys/kernel/debug/dri/0/
> + *      ├── gt0		# d_inode->i_private = gt
> + *      │   ├── pf	# d_inode->i_private = gt
> + *      │   ├── vf1	# d_inode->i_private = VFID(1)
> + *      :   :
> + *      │   ├── vfN	# d_inode->i_private = VFID(N)
> + */
> +
> +static void *extract_priv(struct dentry *d)
> +{
> +	return d->d_inode->i_private;
> +}
> +
> +static struct xe_gt *extract_gt(struct dentry *d)
> +{
> +	return extract_priv(d->d_parent);
> +}
> +
> +static unsigned int extract_vfid(struct dentry *d)
> +{
> +	return extract_priv(d) == extract_gt(d) ? PFID : (uintptr_t)extract_priv(d);
> +}
> +
> +/*
> + *      /sys/kernel/debug/dri/0/
> + *      ├── gt0
> + *      │   ├── pf
> + *      │   │   ├── ggtt_available
> + *      │   │   ├── ggtt_provisioned
> + *      │   │   ├── contexts_provisioned
> + *      │   │   ├── doorbells_provisioned
> + */
> +
> +static const struct drm_info_list pf_info[] = {
> +	{
> +		"ggtt_available",
> +		.show = xe_gt_debugfs_simple_show,
> +		.data = xe_gt_sriov_pf_config_print_available_ggtt,
> +	},
> +	{
> +		"ggtt_provisioned",
> +		.show = xe_gt_debugfs_simple_show,
> +		.data = xe_gt_sriov_pf_config_print_ggtt,
> +	},
> +	{
> +		"contexts_provisioned",
> +		.show = xe_gt_debugfs_simple_show,
> +		.data = xe_gt_sriov_pf_config_print_ctxs,
> +	},
> +	{
> +		"doorbells_provisioned",
> +		.show = xe_gt_debugfs_simple_show,
> +		.data = xe_gt_sriov_pf_config_print_dbs,
> +	},
> +};
> +
> +/*
> + *      /sys/kernel/debug/dri/0/
> + *      ├── gt0
> + *      │   ├── pf
> + *      │   │   ├── ggtt_spare
> + *      │   │   ├── lmem_spare
> + *      │   │   ├── doorbells_spare
> + *      │   │   ├── contexts_spare
> + *      │   │   ├── exec_quantum_ms
> + *      │   │   ├── preempt_timeout_us
> + *      │   ├── vf1
> + *      │   │   ├── ggtt_quota
> + *      │   │   ├── lmem_quota
> + *      │   │   ├── doorbells_quota
> + *      │   │   ├── contexts_quota
> + *      │   │   ├── exec_quantum_ms
> + *      │   │   ├── preempt_timeout_us
> + */
> +
> +#define DEFINE_SRIOV_GT_CONFIG_DEBUGFS_ATTRIBUTE(CONFIG, TYPE, FORMAT)		\


NIT: Is this FORMAT parameter necessary, since you use the same fmt everywhere ?
Do you plan to extend this still in the future ?

> +										\
> +static int CONFIG##_set(void *data, u64 val)					\
> +{										\
> +	struct xe_gt *gt = extract_gt(data);					\
> +	unsigned int vfid = extract_vfid(data);					\
> +	struct xe_device *xe = gt_to_xe(gt);					\
> +	int err;								\
> +										\
> +	if (val > (TYPE)~0ull)							\
> +		return -EOVERFLOW;						\
> +										\
> +	xe_pm_runtime_get(xe);							\
> +	err = xe_gt_sriov_pf_config_set_##CONFIG(gt, vfid, val);		\
> +	xe_pm_runtime_put(xe);							\
> +										\
> +	return err;								\
> +}										\
> +										\
> +static int CONFIG##_get(void *data, u64 *val)					\
> +{										\
> +	struct xe_gt *gt = extract_gt(data);					\
> +	unsigned int vfid = extract_vfid(data);					\
> +										\
> +	*val = xe_gt_sriov_pf_config_get_##CONFIG(gt, vfid);			\
> +	return 0;								\
> +}										\
> +										\
> +DEFINE_DEBUGFS_ATTRIBUTE(CONFIG##_fops, CONFIG##_get, CONFIG##_set, FORMAT)
> +
> +DEFINE_SRIOV_GT_CONFIG_DEBUGFS_ATTRIBUTE(ggtt, u64, "%llu\n");
> +DEFINE_SRIOV_GT_CONFIG_DEBUGFS_ATTRIBUTE(lmem, u64, "%llu\n");
> +DEFINE_SRIOV_GT_CONFIG_DEBUGFS_ATTRIBUTE(ctxs, u32, "%llu\n");
> +DEFINE_SRIOV_GT_CONFIG_DEBUGFS_ATTRIBUTE(dbs, u32, "%llu\n");
> +DEFINE_SRIOV_GT_CONFIG_DEBUGFS_ATTRIBUTE(exec_quantum, u32, "%llu\n");
> +DEFINE_SRIOV_GT_CONFIG_DEBUGFS_ATTRIBUTE(preempt_timeout, u32, "%llu\n");
> +
> +static void pf_add_config_attrs(struct xe_gt *gt, struct dentry *parent, unsigned int vfid)
> +{
> +	xe_gt_assert(gt, gt == extract_gt(parent));
> +	xe_gt_assert(gt, vfid == extract_vfid(parent));
> +
> +	if (!xe_gt_is_media_type(gt)) {
> +		debugfs_create_file_unsafe(vfid ? "ggtt_quota" : "ggtt_spare",
> +					   0644, parent, parent, &ggtt_fops);
> +		if (IS_DGFX(gt_to_xe(gt)))
> +			debugfs_create_file_unsafe(vfid ? "lmem_quota" : "lmem_spare",
> +						   0644, parent, parent, &lmem_fops);
> +	}
> +	debugfs_create_file_unsafe(vfid ? "doorbells_quota" : "doorbells_spare",
> +				   0644, parent, parent, &dbs_fops);
> +	debugfs_create_file_unsafe(vfid ? "contexts_quota" : "contexts_spare",
> +				   0644, parent, parent, &ctxs_fops);
> +	debugfs_create_file_unsafe("exec_quantum_ms", 0644, parent, parent,
> +				   &exec_quantum_fops);
> +	debugfs_create_file_unsafe("preempt_timeout_us", 0644, parent, parent,
> +				   &preempt_timeout_fops);
> +}
> +
> +/**
> + * xe_gt_sriov_pf_debugfs_register - Register SR-IOV PF specific entries in GT debugfs.
> + * @gt: the &xe_gt to register
> + * @root: the &dentry that represents the GT directory
> + *
> + * Register SR-IOV PF entries that are GT related and must be shown under GT debugfs.
> + */
> +void xe_gt_sriov_pf_debugfs_register(struct xe_gt *gt, struct dentry *root)
> +{
> +	struct xe_device *xe = gt_to_xe(gt);
> +	struct drm_minor *minor = xe->drm.primary;
> +	int n, totalvfs = xe_sriov_pf_get_totalvfs(xe);
> +	struct dentry *pfdentry;
> +	struct dentry *vfdentry;
> +	char buf[14]; /* should be enough up to "vf%u\0" for 2^32 - 1 */
> +
> +	xe_gt_assert(gt, IS_SRIOV_PF(xe));
> +	xe_gt_assert(gt, root->d_inode->i_private == gt);
> +
> +	/*
> +	 *      /sys/kernel/debug/dri/0/
> +	 *      ├── gt0
> +	 *      │   ├── pf
> +	 */
> +	pfdentry = debugfs_create_dir("pf", root);
> +	if (IS_ERR(pfdentry))
> +		return;
> +	pfdentry->d_inode->i_private = gt;
> +
> +	drm_debugfs_create_files(pf_info, ARRAY_SIZE(pf_info), pfdentry, minor);
> +	pf_add_config_attrs(gt, pfdentry, PFID);
> +
> +	for (n = 1; n <= totalvfs; n++) {
> +		/*
> +		 *      /sys/kernel/debug/dri/0/
> +		 *      ├── gt0
> +		 *      │   ├── vf1
> +		 *      │   ├── vf2
> +		 */
> +		snprintf(buf, sizeof(buf), "vf%u", n);
> +		vfdentry = debugfs_create_dir(buf, root);
> +		if (IS_ERR(vfdentry))
> +			break;
> +		vfdentry->d_inode->i_private = (void *)(uintptr_t)n;
> +
> +		pf_add_config_attrs(gt, vfdentry, VFID(n));
> +	}
> +}
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.h
> new file mode 100644
> index 000000000000..038cc8ddc244
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.h
> @@ -0,0 +1,18 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023-2024 Intel Corporation
> + */
> +
> +#ifndef _XE_GT_SRIOV_PF_DEBUGFS_H_
> +#define _XE_GT_SRIOV_PF_DEBUGFS_H_
> +
> +struct xe_gt;
> +struct dentry;
> +
> +#ifdef CONFIG_PCI_IOV
> +void xe_gt_sriov_pf_debugfs_register(struct xe_gt *gt, struct dentry *root);
> +#else
> +static inline void xe_gt_sriov_pf_debugfs_register(struct xe_gt *gt, struct dentry *root) { }
> +#endif
> +
> +#endif

One comment above,
The code looks ok:
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>

> -- 
> 2.43.0
> 

-- 
