Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6149AE81A40
	for <intel-xe@archiver.kernel.org>; Mon, 16 Feb 2026 16:24:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1858B10E3C4;
	Mon, 16 Feb 2026 16:24:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jsiWdiTv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5CC610E3B8
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Feb 2026 16:24:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771259054; x=1802795054;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=MPMYBMLEz82pMQBu+vdkF4hJVOLYxUyY5yFa0aX7ee8=;
 b=jsiWdiTvkRUdKzmuwHM1chcWrfb6gotTebk1Z1el7C2hbM9V76x+jxq+
 Qhtnp1k6uPVQ9QpV+dWGZbhBzXJ0A/74VCL8s+6Qy+YMWA2SvFcTTwZoP
 9q+R5aRWuAtQDEgNNqPr/lFXx2r//Th13bJfIO82yXgJKEOx8HK1Bi89F
 aOdp0lBsvud96v4bJLxR9AWza08h/21ClhSH/Q8aFUg36Bfe9pSY/lItv
 ivcCzB9X8JKc7Qi5kIfDy2XJUonOZYt6iNUUXrbB3UMWfP9rA18RrnyP3
 nCENujghUQ7iGlR+JEIKEyd4nrEwo+lcc+DJQkFWk0DB63CiFKDiloNcd A==;
X-CSE-ConnectionGUID: Nq4flk2uRxaFzqPHf2gjYA==
X-CSE-MsgGUID: NQZiOjpXSr6KxCyjAYuO3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11703"; a="72334481"
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; d="scan'208";a="72334481"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2026 08:24:05 -0800
X-CSE-ConnectionGUID: 8hNb0WIgR2ud1D+lj6JgOQ==
X-CSE-MsgGUID: qOSlZpPJTBiOoBOx503O6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; d="scan'208";a="236669842"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2026 08:24:04 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 16 Feb 2026 08:24:04 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 16 Feb 2026 08:24:04 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.11)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 16 Feb 2026 08:24:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h5I5/hk9RR8a0p30G7I2kg/J+eSKyTwjUyqos47N8xwz5rz8etGR/0t8dSzLRgdp4mq3OFht2SjkhFXP3WQo4A6KIOycPVsjs25dmljdHozYrUpart3f2KcpzRXF8ILjKNMQZYypCLEqBb3JC2oN3d8GXW6ydXT8xm8xgWLv2Q1H7dlrRc5jVleM7Zf4sjuj+s/XlBiGVtJapNvVxPOMkjwUUa4/bN6p1Qo9pTNwf4GJHoxfHXY1FnfV5hHRUYaoDp7fHRna0fGmQKG3pCjO/9nBt/NqPSrAGU8VyFlYnFqNBl5J1Pnar1A/KHQ+0ZRao+mkUYp/StY2b0qAsbsDXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7CvcphREvInMBlH6aKatYxrsEoQFWxdqYAXPUTBv4sg=;
 b=eaPaSPpnFg6oe+ujf9CDorVUN1ZNqAbjJ9AJv00mEO5BdFA6nr3mbPtRFE6cYEaxxSYtmICiFUMYu8RCQNoru2CVmv3c3oAU+2Az1FNF2/ESqBqAMFZY8zUqnTxnZXwA3UwkgW1JrGVuLg8Hwc325tcoG1huv1omwZuPQu/ftW++XMIP3hkZXdPa6L6lMZIoDSlVhAkNryw9CJCQJy5KNwDODTvKELXQhqmyq2PD1mnGamnwDFpgCRZruHQd82jrDrcrSsDGIiNtyJb6ILauLaZ1SMWmBowK2pbbwESf4XoSdGDyKaQu5C9XKaVm9sz4MmpLRVIIru38EwwPxW4l3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by CH3PR11MB7896.namprd11.prod.outlook.com (2603:10b6:610:131::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Mon, 16 Feb
 2026 16:24:02 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::efd5:501b:c890:26b0]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::efd5:501b:c890:26b0%5]) with mapi id 15.20.9611.013; Mon, 16 Feb 2026
 16:24:02 +0000
Date: Mon, 16 Feb 2026 17:23:59 +0100
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 5/9] drm/xe/tests: Add KUnit tests for new VRAM fair
 provisioning
Message-ID: <20260216162359.e6qers42vsaf46oh@intel.com>
References: <20260215203323.595-1-michal.wajdeczko@intel.com>
 <20260215203323.595-6-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260215203323.595-6-michal.wajdeczko@intel.com>
X-ClientProxiedBy: VI1PR06CA0085.eurprd06.prod.outlook.com
 (2603:10a6:803:8c::14) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|CH3PR11MB7896:EE_
X-MS-Office365-Filtering-Correlation-Id: 375791c8-6fe3-4ab6-63f8-08de6d77cbd8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZEx5M0ZxMEhzYXNDblVsUWtOL2dBUVFYTmFoWmgwb3VxNTlKNDBsSGFmMitr?=
 =?utf-8?B?MmNQNGpLdEI2Qmc5OVdpRXAyaURnMUk0WTlZS25FOEZDaUowYXVWbU1RbG5a?=
 =?utf-8?B?ZTVGSWFXZXVIQnE5dVZVb08zSThGcCtSQmhRcTU5TEpwN0d4K0RES1ROZXNO?=
 =?utf-8?B?UmM5S1BtS1NOMzNqUmQzMTRQVStyZWZlWG5QWVREdGI3NHlRNFNQL1kvb0Fk?=
 =?utf-8?B?ZUVEaUswNlQ5bEdDanZ6SVZObDdhL29kN21BcW5kVytKcnFoMHdyVHhzRFlZ?=
 =?utf-8?B?V0dRUENlTXdVVlFSaVNZaTVRUEVITVhEcnpuYlpNSURzUk5Mckc1ZzBySUhk?=
 =?utf-8?B?R3ZnUE9IdEljNmtKbTUyYjc4dmYva1Q4Mzdzbkx5Q0hqdHJENGlNK2tCejVt?=
 =?utf-8?B?cWcwdGI3T3lORzJjMGtHbTVxWlV5M2F3ZThobmJOcENpRTVpaTJ3b1l6dWwz?=
 =?utf-8?B?dmZHQm1Yc1M3V244Sk03NmVmRERrRkQ2MStWTFlyWXZ1TDkxZFNoSDdXNEVW?=
 =?utf-8?B?MWt5dkNBOHhPWVU3LzVBSG5pQ0x3Z2JRRzUwNXl4Mzhod1hKTWM5VDVodmhY?=
 =?utf-8?B?SDJLaUx3VWpiWVl0VTNhLzFDallBTU0wcnlLY3c0enl3NHRkM0pSWFRIVXZC?=
 =?utf-8?B?cmZwVk1OMGJjdjYyMTdQUURYMWtLUFM5UDZPZXk0MEw1c0RGcXVyaHp5RFRU?=
 =?utf-8?B?aHMxSDVvSk0waFRNRjkzSUhKdXA2TW1YRDJ4bnFqOVR2NlpwTjRXQWZObWZu?=
 =?utf-8?B?eklzMitkZlNlWFNuY0RXZ3VUWkZ6N3dNVEVJaXVBQU5LK0o4Y2ZJUHp1WkZt?=
 =?utf-8?B?Mk1hVjUybUtSSG5uUmhJZ3ZYUXZyYk9PQzBoOW5iRWZ3U1c3azBQQm82OFFV?=
 =?utf-8?B?eDlYRXM5TjRybDluZzdPSWpkdHlHVTZEejNlaG5LR21BTVJGWEc3WHkwR3dT?=
 =?utf-8?B?K2FSK2pSMkRyeTFmYklRWFBhOElsY1hVVE9uR3BPdU1SOWlYcldVekExNXAw?=
 =?utf-8?B?NUxkZHh6MDJGU21ObmRXRENqbmowaS9yZ2dDTTVzOXpVbVh6MkRyVGtvZE9o?=
 =?utf-8?B?aXNyTEphWm1YQXVSMTg0cHR0cEd1RTZ1bldTazBWUkhGZHpZa0x3ZjFTY3dK?=
 =?utf-8?B?NllEa1ZzaDIyczQ5RDRqazhtM3FLeTN2bGJWQ2EyTlgvaXRYMTFES0tNRUhs?=
 =?utf-8?B?bWx4OU9OdjB2dGx3UzQ3eEpTeWxVTmtkNHlrNktYTFR2WmJQeWhPcWZyU2la?=
 =?utf-8?B?dmczR01xNFJ1SStLUGR0bGszRzUxU0JDMkhlQU5tQk5tMkVoakg0OGJmYWFh?=
 =?utf-8?B?cWdPOUtmUWZ1dVdEZXFrZWZ2bWRmdzhqbUEyZTg4WjFDeUdzSTUvRFMxYy9o?=
 =?utf-8?B?cFBTcGhhZStPWFhNM0tFZmlKNGdLR1BqSVc5amVPTkNPUWxucEhjVHVxanEy?=
 =?utf-8?B?dGtXYkVzMlBJblYzZ1gvQjAzaW56and1V1R4WnNvMC9zakNRWGdKZTY0eDhK?=
 =?utf-8?B?ZWZEZ2J6NW9yOUppRTM4UUZyL3lETVRyalEzaHJ6L3lTdG9lSDM1MDFCYkIz?=
 =?utf-8?B?aFhOc1h5Y3FLSTQ2cXFnOE1JVDFUNHNwamxCQURUTXR4cVpQTk9kZEhBYVVl?=
 =?utf-8?B?UmhKbURUdzJMeVJwYUZPeDBBUUJxT1RUeVdveGxnTTFBN0xkQ2xyWlhXMUhm?=
 =?utf-8?B?NzJ6WWljVnozT2plWlhVRGkzdDB4SjVnSVl3SGNSYkx4SEo3SVFBbUJqN0JQ?=
 =?utf-8?B?dXZjRWRxb3JpQUQ1RVNiOHRtM0VsTGRRZHNURHVWWXd2alNid05Pc1R2bThj?=
 =?utf-8?B?cXB5TG5pL2ZxWnc5NGRKbmxIVFFuVmk4azZKc1BhQjZmOUJqcVVUMktMQ3RP?=
 =?utf-8?B?SnJ3ZTNXZEhRcFFtV3VUSWd0V1dhV0lGdEkvbDZJNFFDT1RLVWE2S1BZclRU?=
 =?utf-8?B?Z01ES25XV0NFSTl4YVVyRE1vR1YwamVwZnFZQVpxcElBNHlUd1Q5QmorMjl5?=
 =?utf-8?B?WGFzSmxkazljWXJCUjhTMUJpVkVHVC8rK1J1UVQ2cU9INlVPOFNBZ054a2NM?=
 =?utf-8?B?MVNLYUxaeXlxNWlpdnFIWWpoSVZSUktVaXBocnNLSWo0Wkd3ZnRRS2xQemxy?=
 =?utf-8?Q?tTVs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UUZXeVJndXJxNzIybTR2NXI1WVhrYnNkQk5VeGhKUU9RcklOUGY2RHNvR1F0?=
 =?utf-8?B?NXVrVkxRWjdXM0E5TDU1OXRLbHFWNnRlOFUyL25PUC9NZVE1NWl3OTZTNnp4?=
 =?utf-8?B?czY4UHN6Y09WOU1XZmx0QUQvSEZhc3pjSHdzRnRBZGFwKzB5RVdWNmVnNVlK?=
 =?utf-8?B?dnp0Vk45bG94YnVoUzF3bHJJOWxvaldwRm4yRkd6RFlFdEJncTFpWW91Unhi?=
 =?utf-8?B?RVlraXlMTnBxaXgxNC9JREpFNFBKckt3QjdHVWNlc0c5dE5WK2EzTDZSNjZo?=
 =?utf-8?B?N3NjZWo2Q05NSzRHejN4ZTBudWYvUGx6YlFjeGpNK3NhYVhTWmVuRWdCSkJm?=
 =?utf-8?B?eDlOcE5RRlVTTWZ0cHhjVUxzWU5nNnJWQUxpZk9YTWY2SjlVMkt0SHNzelpK?=
 =?utf-8?B?QTYwaVVpWUd6M3RyQUpGK2x5S2dhUnFVK05ZenlZVDRqUDdoa2tIYzNVaGVh?=
 =?utf-8?B?eG1jSUZVMHZIeHdBRmt3eDZodklrTmRLZGxiL2I5SUN0WTl3REFvWEd1WDlM?=
 =?utf-8?B?MGtpaE0ycHFiZHNIZjJVUjhZSkxab0RWWkhFbGdPd3drdU95UmNxZkNZci90?=
 =?utf-8?B?SEcwM09qYVlDQkhQMnB4NnFrdWxpOTZUTGZ4TTE2NDNqS3duU0NRZ3NzQzhy?=
 =?utf-8?B?djhvRnl3M01jMktHaUhXcWVvZTdocEgvTkFqYkEyOXI5bXd0N2VlZk5HRHFl?=
 =?utf-8?B?ZlQxMmYrbCtRNVhOdTR2aDVRc0FlTktUTVJmcDhtK00wbHhacW5vcnNkby96?=
 =?utf-8?B?blFZSUtzYVFVVkpPOGxUMGZtR1NzcThTbmxNSHJtT2szZkYzUnZTQUR0aklz?=
 =?utf-8?B?WGRJZDVXbGRlNVlBQjEyZVhBU1d5emhXalVINmdHNjB0ZHJxTVNvRU15Q1VV?=
 =?utf-8?B?WFUrWFJNUEtwdWxkK2hleTJzNjB4VGV5eVp2eEI1eUxoZ0hIaUF4Ty9GTERj?=
 =?utf-8?B?cER4SCtSOWMvakE2RnZoWDBsYitHeE5BYVA3WExHQVFiVHE4aVFQSTdpRXcv?=
 =?utf-8?B?Zjk2cGJ6K0xFNVY3dXdlTDBRaVpTRGFQbExxMnVEaG10Z05YemRDQXRoTENj?=
 =?utf-8?B?Mmt3NmIwYklDQ084Ni9xVzhmN1pLYzM5RXZ4TStmblN1dlVWSXV0MUJDNFd0?=
 =?utf-8?B?dm51U0wvK2t3RnByUDdVdWwyOXhmKzhHNjMwODI3bGU5bVlXTmF2YkZoOThS?=
 =?utf-8?B?dWlGVFNCOGJrSmJiSlJ6b1FuUlFqQnNhQkhxNzVmM1Z0eS9PQlBVaXBqeHJT?=
 =?utf-8?B?VmZVaDY1bkZBZFUvZXE2eE42R3Q1aFphRVJUUDdZKzdadWJTaEhXZVFtUVp1?=
 =?utf-8?B?RElIOUVkMkVBR3hHNytVZ3Nac3hqeEp6bzlpdjVKbXoyUEE0TlNqcDVvNWlW?=
 =?utf-8?B?eGRkZjgvSUlYTmx5TVExNys4NDd5L28rbE9nRjcwQ2Z4ZmhIWFQyd3QrTWt1?=
 =?utf-8?B?RndPTVpiTzdIdHUzbFRxY3RBNm9pN0xEN0poOWRFWVhVZE5xc0JHZWJ6MDBY?=
 =?utf-8?B?OFFuRHhmWEVqY3M1a0pJUkd1R0VLc1VMUDdqU1g0eG95c0ZhdFRobFhxUHZr?=
 =?utf-8?B?MUlYaWlFelppbzF3dmlkVkxrWVZ4OGV1L2RnNnBpUk05aE1QRFF6SllZK25V?=
 =?utf-8?B?Si9WR0ZidUxBV1ZFWVFydmFTN0FUNVZpTjE2RHVmeXFJRjRLS3VBMnNtMCtC?=
 =?utf-8?B?WWNETjBHY3pDaUswaXBhaVZqanN1ak5PT2xveDVIOVdmUG44SmRpYTN2Z0U2?=
 =?utf-8?B?NGRYWGRGN20ySHB4eDlWa2w2M0U2dEpkQStwQlBFekY3b2xRanZENnpDWWkv?=
 =?utf-8?B?MmlOcEhKY09mNnQ0MHJXQy9BL1NlWFkzMytCVVZzQWdZQTVKQ3ZJTXFkTmVX?=
 =?utf-8?B?VzhPNVEyTS9EeFYyNFlNTWxZSU9kd2RRK0d4MFpqRnUvSnp1VW5kTkVFZmN1?=
 =?utf-8?B?ZVRneGVMM3lqNzFoelVuVGZoMk1mYWltQ3Z5NGg4UkVVcjJqK2VGcE5MTkpL?=
 =?utf-8?B?T0djcTV2TE1vL0xkRzU5U3dVZWx6RGR2YWtPbzBNdEJmd0NURXdUSlM2aFZ1?=
 =?utf-8?B?M29OS0w1SXBJVkd6M1E2TjhvRWYreCtZOGlod21YWXR3cThOdWs5WnM1MGZP?=
 =?utf-8?B?amR6MUR5ODlJdkpoQTBsdW1XNzR4N3FkZmFHeE9yLy9LNnZkYTNQT2JwYmM5?=
 =?utf-8?B?cjREZyszTDVPV1ZrVm9ybWZKU1JMd0lsR3hDcEVLWmFNOTh4VlZVK0dpckVM?=
 =?utf-8?B?TS9WdTNEZVFST0dHdDBJc1d4ckY5T3RFQnFIMEZpMGE5bDFTZ1ZtZUkvQSs0?=
 =?utf-8?B?MzhpMEVhZExjZzcvRlJJTTFhNTJkNGZGaEVQTHJvb3lBcEszRVBpZ0JXdEVM?=
 =?utf-8?Q?VaeouMBmMIhCMxdE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 375791c8-6fe3-4ab6-63f8-08de6d77cbd8
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2026 16:24:02.2785 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZJDjqXjPmCqQNEmA411KFfzAPhPPhkcdrbQFY25EMsiSkkxhytnOlcDerhwf8vmBFeYV1Cx6Qt/38+52MzGSioHkVwrirWYvreBZPrhPLPE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7896
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on nie [2026-lut-15 21:33:19 +0100]:
> Add basic test cases to check outcome of the fair VRAM provisioning
> for regular and admin-only PF mode.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  .../xe/tests/xe_gt_sriov_pf_config_kunit.c    | 90 ++++++++++++++++++-
>  1 file changed, 89 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c b/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c
> index 3889dc3e49ca..80e5065beb2c 100644
> --- a/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c
> +++ b/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c
> @@ -11,6 +11,7 @@
>  #include "xe_pci_test.h"
>  
>  #define TEST_MAX_VFS	63
> +#define TEST_VRAM	0x37a800000ull
>  
>  static void pf_set_admin_mode(struct xe_device *xe, bool enable)
>  {
> @@ -19,6 +20,17 @@ static void pf_set_admin_mode(struct xe_device *xe, bool enable)
>  	KUNIT_EXPECT_EQ(kunit_get_current_test(), enable, xe_sriov_pf_admin_only(xe));
>  }
>  
> +static void pf_set_usable_vram(struct xe_device *xe, u64 usable)
> +{
> +	struct xe_tile *tile = xe_device_get_root_tile(xe);
> +	struct kunit *test = kunit_get_current_test();
> +
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, tile);
> +	xe->mem.vram->usable_size = usable;
> +	tile->mem.vram->usable_size = usable;
> +	KUNIT_ASSERT_EQ(test, usable, xe_vram_region_usable_size(tile->mem.vram));
> +}
> +
>  static const void *num_vfs_gen_param(struct kunit *test, const void *prev, char *desc)
>  {
>  	unsigned long next = 1 + (unsigned long)prev;
> @@ -34,9 +46,11 @@ static int pf_gt_config_test_init(struct kunit *test)
>  {
>  	struct xe_pci_fake_data fake = {
>  		.sriov_mode = XE_SRIOV_MODE_PF,
> -		.platform = XE_TIGERLAKE, /* any random platform with SR-IOV */
> +		.platform = XE_BATTLEMAGE, /* any random DGFX platform with SR-IOV */
>  		.subplatform = XE_SUBPLATFORM_NONE,
> +		.graphics_verx100 = 2001,
>  	};
> +	struct xe_vram_region *vram;
>  	struct xe_device *xe;
>  	struct xe_gt *gt;
>  
> @@ -50,6 +64,13 @@ static int pf_gt_config_test_init(struct kunit *test)
>  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, gt);
>  	test->priv = gt;
>  
> +	/* pretend it has some VRAM */
> +	KUNIT_ASSERT_TRUE(test, IS_DGFX(xe));
> +	vram = kunit_kzalloc(test, sizeof(*vram), GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, vram);
> +	vram->usable_size = TEST_VRAM;
> +	xe->mem.vram = xe->tiles[0].mem.vram = vram;
> +
>  	/* pretend it can support up to 63 VFs */
>  	xe->sriov.pf.device_total_vfs = TEST_MAX_VFS;
>  	xe->sriov.pf.driver_max_vfs = TEST_MAX_VFS;
> @@ -189,13 +210,80 @@ static void fair_ggtt(struct kunit *test)
>  		KUNIT_ASSERT_EQ(test, SZ_2G, pf_profile_fair_ggtt(gt, num_vfs));
>  }
>  
> +static const u64 vram_sizes[] = {
> +	SZ_4G - SZ_512M,
> +	SZ_8G + SZ_4G - SZ_512M,
> +	SZ_16G - SZ_512M,
> +	SZ_32G - SZ_512M,
> +	SZ_64G - SZ_512M,
> +	TEST_VRAM,
> +};
> +
> +static void u64_param_get_desc(const u64 *p, char *desc)
> +{
> +	string_get_size(*p, 1, STRING_UNITS_2, desc, KUNIT_PARAM_DESC_SIZE);
> +}
> +
> +KUNIT_ARRAY_PARAM(vram_size, vram_sizes, u64_param_get_desc);
> +
> +static void fair_vram_1vf(struct kunit *test)
> +{
> +	const u64 usable = *(const u64 *)test->param_value;
> +	struct xe_gt *gt = test->priv;
> +	struct xe_device *xe = gt_to_xe(gt);
> +
> +	pf_set_admin_mode(xe, false);
> +	pf_set_usable_vram(xe, usable);
> +
> +	KUNIT_EXPECT_NE(test, 0, pf_profile_fair_lmem(gt, 1));
> +	KUNIT_EXPECT_GE(test, usable, pf_profile_fair_lmem(gt, 1));
> +	KUNIT_EXPECT_TRUE(test, is_power_of_2(pf_profile_fair_lmem(gt, 1)));
> +	KUNIT_EXPECT_GE(test, usable - pf_profile_fair_lmem(gt, 1), pf_profile_fair_lmem(gt, 1));
> +}
> +
> +static void fair_vram_1vf_admin_only(struct kunit *test)
> +{
> +	const u64 usable = *(const u64 *)test->param_value;
> +	struct xe_gt *gt = test->priv;
> +	struct xe_device *xe = gt_to_xe(gt);
> +
> +	pf_set_admin_mode(xe, true);
> +	pf_set_usable_vram(xe, usable);
> +
> +	KUNIT_EXPECT_NE(test, 0, pf_profile_fair_lmem(gt, 1));
> +	KUNIT_EXPECT_GE(test, usable, pf_profile_fair_lmem(gt, 1));
> +	KUNIT_EXPECT_LT(test, usable - pf_profile_fair_lmem(gt, 1), pf_profile_fair_lmem(gt, 1));
> +	KUNIT_EXPECT_TRUE(test, IS_ALIGNED(pf_profile_fair_lmem(gt, 1), SZ_1G));
> +}
> +
> +static void fair_vram(struct kunit *test)
> +{
> +	unsigned int num_vfs = (unsigned long)test->param_value;
> +	struct xe_gt *gt = test->priv;
> +	struct xe_device *xe = gt_to_xe(gt);
> +	u64 alignment = pf_get_lmem_alignment(gt);
> +	char size[10];
> +
> +	pf_set_admin_mode(xe, false);
> +
> +	string_get_size(pf_profile_fair_lmem(gt, num_vfs), 1, STRING_UNITS_2, size, sizeof(size));
> +	kunit_info(test, "fair %s %llx\n", size, pf_profile_fair_lmem(gt, num_vfs));
> +
> +	KUNIT_EXPECT_TRUE(test, is_power_of_2(pf_profile_fair_lmem(gt, num_vfs)));
> +	KUNIT_EXPECT_TRUE(test, IS_ALIGNED(pf_profile_fair_lmem(gt, num_vfs), alignment));
> +	KUNIT_EXPECT_GE(test, TEST_VRAM, num_vfs * pf_profile_fair_lmem(gt, num_vfs));
> +}
> +
>  static struct kunit_case pf_gt_config_test_cases[] = {
>  	KUNIT_CASE(fair_contexts_1vf),
>  	KUNIT_CASE(fair_doorbells_1vf),
>  	KUNIT_CASE(fair_ggtt_1vf),
> +	KUNIT_CASE_PARAM(fair_vram_1vf, vram_size_gen_params),
> +	KUNIT_CASE_PARAM(fair_vram_1vf_admin_only, vram_size_gen_params),
>  	KUNIT_CASE_PARAM(fair_contexts, num_vfs_gen_param),
>  	KUNIT_CASE_PARAM(fair_doorbells, num_vfs_gen_param),
>  	KUNIT_CASE_PARAM(fair_ggtt, num_vfs_gen_param),
> +	KUNIT_CASE_PARAM(fair_vram, num_vfs_gen_param),
>  	{}
>  };

LGTM:
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>

>  
> -- 
> 2.47.1
> 

-- 
