Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E484FC3DA42
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jul 2024 13:26:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9619C10EAFA;
	Wed, 17 Jul 2024 13:26:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GLyFOQwk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13B8710EAFA
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jul 2024 13:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721222763; x=1752758763;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=KaCLRfzTgBsd9eF+T9clGHgAmBWHhDPnXrh/roZqabQ=;
 b=GLyFOQwkHvyvaexInhVxTP1M6KbgubNvhgkM07Bd3u9DKPsukWh9CyXp
 hY12gnTk9qIQrmOmBi2Mopttq7kfxhYYMcEs8J3sgdGEIiD/qmJQkOAfK
 tHuPgYm4WeDq4CmSIoTFeOgjX79UjGhvINIphOq1+MD6/Gj1Kk4zLZQAV
 smzuocRj/1eP67eZlLv/IujOeaeL5v30FrTbJW8RCdhNNPFSdH8AYalui
 K3KxQycmA0LLQ4hL7PiLuV3FMR6nG1QjuTolRSma3CWNmBX1S0htuQIvZ
 5mqxO8G5RVUrsxd5n2xkw73gfXGS85zzG/wEyBWws8vSYAc6QEeb0VoYK A==;
X-CSE-ConnectionGUID: 48UPRBTiRku7AHrRK5HaNg==
X-CSE-MsgGUID: iJv7MlXNSd69u3BJVBuOOA==
X-IronPort-AV: E=McAfee;i="6700,10204,11136"; a="18680338"
X-IronPort-AV: E=Sophos;i="6.09,214,1716274800"; d="scan'208";a="18680338"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2024 06:26:02 -0700
X-CSE-ConnectionGUID: KwqrcPkUTbyWbT8gRRhpuQ==
X-CSE-MsgGUID: CH4mK3U5SZaSHrJ1DyDcmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,214,1716274800"; d="scan'208";a="50183707"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Jul 2024 06:26:02 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 17 Jul 2024 06:26:00 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 17 Jul 2024 06:26:00 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 17 Jul 2024 06:26:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UMrQncpuwOVIgBh7j6hsTLSCEVLVtOOl38KNzijwkVjqzrYHNEz6pXIk6ixXEFN7fxZAcUxm8o/mn1Jl6SlT1fBXYHqtYwCt/1MImK+PY83QBGOCl1lCl6Mm+ojR+m8gDaw8Z/0G+UK+ps0k9t4X/vSnIaAT+c3nVSzWoJDAaYEdM6ay2J15B7WJ2bxYL5oncqDh8ln0WkK6/V7IdaviV0lXBnaxiyuUkTC/J98bWzdMrFvjaey5Y7H6xLtGrqo7AIx39PzPussspKqY2zMIJ0kpQVhTrxxwwz2xFszsq+zgsMLTosQO/xJqldLpzB54CF0M7Itt/pGoTdpR/C1OnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pONXQW2HhRiXw7htBBVQPLpj3Cf5usC34UtMKhjxF5I=;
 b=MlLsWkn1HFVGmmkIWpjX4CeT4XYTpVHEP5EzzOdWN5UhYkU1Fe44kotq4qF70+r+FL/qCIkgTZ2nBF7r9ocVUalxLDe0+Z1s3o6vy5i+bp6VR2HZK6thIOcQrbPLHnp/m4gldsFzaEdQFYq1hDb66PMnajdwY721HqK0UHndCCisdCoonFW1+zVVAFkn3k7pY9pbsW8xqT6oIZy5cA+RfnT6Mr9nS5S+No0toEHeVV9ymjEeVazAyQajK78/Q4+Ac3pvyKVLLZwy9Kr+d9BLpAs5AAYnos1L5v/wTInmN86f5SvoH4jvlhJdLJPiAim82DQbGoYD5pUfNynZi0ol0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by BL3PR11MB6337.namprd11.prod.outlook.com (2603:10b6:208:3b1::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.23; Wed, 17 Jul
 2024 13:25:58 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.7762.032; Wed, 17 Jul 2024
 13:25:57 +0000
Date: Wed, 17 Jul 2024 13:25:07 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Nirmoy Das <nirmoy.das@linux.intel.com>
CC: Nirmoy Das <nirmoy.das@intel.com>, <intel-xe@lists.freedesktop.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH] drm/xe/pm: Add trace for pm functions
Message-ID: <ZpfGMyHDReGmvwrP@DUT025-TGLU.fm.intel.com>
References: <20240717112908.14394-1-nirmoy.das@intel.com>
 <Zpe7ydKbfUkBpSGG@DUT025-TGLU.fm.intel.com>
 <3ba40443-12cf-444a-b2b1-1d858f3e8294@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3ba40443-12cf-444a-b2b1-1d858f3e8294@linux.intel.com>
X-ClientProxiedBy: SJ0PR03CA0139.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::24) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|BL3PR11MB6337:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a615804-c0bc-4224-fb06-08dca663fe2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?eE3OsHClt7xwvWLkFVpbhaVJ7EhDwxdYLzLTnqQJVQzaOSy99tnR0VH5gI?=
 =?iso-8859-1?Q?KFJGE7Hr58bcr6vBbAiH7X9NsqiuDkWOWZQddiOB6NSXAqb9gmQv9p6Es5?=
 =?iso-8859-1?Q?5t59T4dAvcqiTOvRr7EaBhkbYg7ecxNISm99Z+XkjRSjxR1aTLoA3nG2OX?=
 =?iso-8859-1?Q?pjE+MrrYHNLXx1lkFeaOAoqrFDyFqNEM7j8xMjJNhP1RncId6132oQestA?=
 =?iso-8859-1?Q?S3be9yxvQIt++sCtQJIfJ5ASsl8OkJfxxJiyj3o0hcMGTEdVBW+XTFiBYl?=
 =?iso-8859-1?Q?u5cabOrgomz1M35jaqOfQBELocLJW+td6Vxyt8Yr+JxAj/EUEKhfZ7wq2l?=
 =?iso-8859-1?Q?yqm0H2GfG5nz/fKFWp7jkVGYrezxA5h8JVTlr5qMiHwXkL3eX9J6gBp71r?=
 =?iso-8859-1?Q?iiDvi2sfv+6u2qPxcn4p6tZRTa+NubudBK0zXfXPtTahKHMzErAXoUYBqh?=
 =?iso-8859-1?Q?AevPds6VJUD2GHroO0edl2lvCO+guijqgNjIrMx8DDEKtu2W20uQK6K3IB?=
 =?iso-8859-1?Q?b2/O4xIeMXxdpR6iNQANQ/ROM93dR+D8eiSgMsqX6mRkPcp09KnmBiiHz5?=
 =?iso-8859-1?Q?/M2PUoPAThmxTdFnr3llJKAGfaf8YFCiIutz2ZhsQh1+kN/4FoZXod8nVz?=
 =?iso-8859-1?Q?WWm7kDw4lm2eobCt0zKhqO4WbIWbIAIwZJE99CWOcArEGmzupJwWx++P+t?=
 =?iso-8859-1?Q?217Ze48X5OZNiGvT2108ifuk0EM9+nAJfhD58c9MEMS4CmYah36OkNdcqr?=
 =?iso-8859-1?Q?4svhq7XbVJcQe9xXTDRYS1gk4qU2qEoXkwtsnmdL3mFaRKtXaEOAqZgxdg?=
 =?iso-8859-1?Q?eQqkAhwUOKvKHF7KGpNJxuyAEHhxNmmWYQLsiaE4mBaP3vEjh1o+lB53PS?=
 =?iso-8859-1?Q?Zsna2Z/j6cUVuvzNdLTYa9ae+1kK9FmID5B4sgXuPP/EcN2J5w1jUvfJzl?=
 =?iso-8859-1?Q?EU/GoL6QqmTZz/Jr63JU0gqhOsjNDzFKkyKvBMjditIwOv2eXVm+ObkOw6?=
 =?iso-8859-1?Q?+htJDB8JR2hQ5LDVHxN9caA8J9dgN/21mSsbOmKUq8PDH+XqGNFBwUuLMO?=
 =?iso-8859-1?Q?zoCQDAsLP1GG4eC9uHXhSEo25mGAbdft54ANkgVmajwHFEWM7oHIfc/V3n?=
 =?iso-8859-1?Q?jFkvzSf+rzOIFBLmDcfw6a4w+aCaNA7Jx107QtMU8ARzLy4Z6GUEcBYIpl?=
 =?iso-8859-1?Q?vcBtOI2vxTT83gjZLC8Jf0tC9zDBgOfyDenjQJtpcerM4dZoayK+67n1sn?=
 =?iso-8859-1?Q?9yYy/3Zo1Wtpr4Lp7Cq5y2R9jVVdWYOnpJ5l9yIcIrJcsUAjEC1B86Vp2o?=
 =?iso-8859-1?Q?v0EBQAIa524oLSStJdmoPprbj1AzFX2W0FPnOK0bOcrUIZa5xqpNFygLtF?=
 =?iso-8859-1?Q?lWzBGdN9e/PmfDi1grMWwfTrjXZZlvIg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?gjMnT/uMIzBl3MWj4T2JsmSmOdVBtqojQA+Fw/JbpDMuuacLS0RKvt8IIJ?=
 =?iso-8859-1?Q?O+uk7eD6gd/3dI//LxpGbp62Giew+Bqdj4oZyDMK1wQjAYi7azk7UYoLyY?=
 =?iso-8859-1?Q?r5mlArw27PWFwAvftbGQmtWC+QyfBlFzCaHjLzR8lkprMQ5N4dvs2prJi7?=
 =?iso-8859-1?Q?cVUikh2/DZrzRDlGLL7raBRZouqk2WPPGyN2g5gQ14mZy29KaEjasYvg8m?=
 =?iso-8859-1?Q?pDmPmZArhwICQ+2YedBlwWRjzf8J7xmyckpEpYwqF1L4Tnx/AHOSn3V1wp?=
 =?iso-8859-1?Q?q2ygc5BUClagBzkLk+W+HIyjEvsDplaLSe5azHwYkmAVlGWoTwUBk9V9H3?=
 =?iso-8859-1?Q?6jaIsGI1keusbsudk/a1qW7cumSlCYeiT9SUhuioo4vJ4EBfj8a3fdFwlY?=
 =?iso-8859-1?Q?sil19G4kQkrU/EsjUvCgRPpnfBJCHFoRb+UijQQf48I+2Jzzdl7WdkjDP/?=
 =?iso-8859-1?Q?AxAQe6T2CHtGmhrW7O5FfFzIHmAFtxV1o1WbK9sq3wqa0ua06c8ud2H+bX?=
 =?iso-8859-1?Q?+c+eAsMkM1eefmE6RXPphluN143mgRj1YTiu7wo+70kbSDtVp1lR1zJQ2n?=
 =?iso-8859-1?Q?FMWbt8RHzqB3QeBKaMksqVoRdOiXDbRd0Zh/zHjHb6HQd1wWYbgS3gt/OL?=
 =?iso-8859-1?Q?B5klcsySSnIfTLeAXvG6bxdBrfHLBqk59bM8ek8sp1cdNh/DVpcvDb2iGN?=
 =?iso-8859-1?Q?zjtOAKy4TjDIDEyvsAlt3E6wJ5VwCRvQQTdgwjeZ1gv+apd40IMIjPfzGB?=
 =?iso-8859-1?Q?dslHZolkGIhZA9EBljdgfFuX3FLA2R1BmV1FDf7EKGEy6yxj3EvnRA8RKm?=
 =?iso-8859-1?Q?9TF8DoJffajxZtTS7fEP/xDLY+3SjOxLOQ5xb1+JJLPXtI6u4ocgH0xnwm?=
 =?iso-8859-1?Q?zdM/XqhmH3U8QNvFo4DBYco+DuJUv6Wym32ibqDpfUqwCJAvNUhZ3q72Zh?=
 =?iso-8859-1?Q?cbLHd3xG2X/+6HWUchtzDB9FpKkbo1yQIqrCblVPnBJIrjnpyb658OUCVo?=
 =?iso-8859-1?Q?8oM3PMM0bmKOjdw1TxHtukN6stABxNDaOVx6N4SQ1EP0ac7c0/jMoIItwx?=
 =?iso-8859-1?Q?aMbF25HbCkBvv0i9ZHdBj8H3tp2kdwUCkDIZYY25aGTkEfhJMPwhNxcHRW?=
 =?iso-8859-1?Q?WbyR9KrfXYtTTAXOS0rI6479JrLQxktPchxe/nL/NGMvx63BulLOKvrY56?=
 =?iso-8859-1?Q?o5yHWGruenT8JoUQg4IjsQNfOA17VhKELxJm5u8AxBrAZAa17bxn+7JdsG?=
 =?iso-8859-1?Q?A2+3UTUqIfI1EQW0OktLO4V7akrHZxrSdTb54jvMF3qs/205eHi2hHwq8T?=
 =?iso-8859-1?Q?ktM+hLCW4/Id7vqRg24WcNvRfYL9DBSJaQN8zTTobMEfwcNCVOq74uLUpa?=
 =?iso-8859-1?Q?+R/CB7I9/NyCb48gXE+Jao76BMW4WqBkE1VS7eWAB8Lq8J5qhLGKJ3CCF7?=
 =?iso-8859-1?Q?BPKOgDDe9WL/htPZFgzMSTgPVSIynC9btSmgKWNzk1rPAkXIByL/zuOwKN?=
 =?iso-8859-1?Q?6ETHcDN9NlMfpIgn33mfA/ognKyD03n54z7WBjEgoE/LY7xfrnSUY3gvBt?=
 =?iso-8859-1?Q?LL2j/UWM4qE6OW5nwsZ3pnIPd6SvzivO+C3pIp4rMXNeheLa13hZvXFybc?=
 =?iso-8859-1?Q?eBLxdr65ksVHl7H9eSVpMKlsvO5UjjoQUU2VU/qKejJwRvpVibXv4lww?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a615804-c0bc-4224-fb06-08dca663fe2d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2024 13:25:57.7298 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SYgtHQtCDYIHzcMOavLdHzt1S59YAigKOE40N+Xuu1sAyh9XUhpf3uY5p5s1+5PdBVyI0BQx8UrjBj0H8Ci5BA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6337
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

On Wed, Jul 17, 2024 at 03:08:02PM +0200, Nirmoy Das wrote:
> 
> On 7/17/2024 2:40 PM, Matthew Brost wrote:
> > On Wed, Jul 17, 2024 at 01:29:08PM +0200, Nirmoy Das wrote:
> > > Add trace for xe pm function for better debuggability.
> > > 
> > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> > > ---
> > > Example Output:
> > >            <idle>-0       [004] d.h2.  3821.138392: xe_pm_runtime_put: dev=0000:00:02.0 caller_function=xe_guc_ct_fast_path+0x2e4/0x430 [xe]
> > >     kworker/u32:0-53314   [001] .....  3821.138411: xe_pm_runtime_put: dev=0000:00:02.0 caller_function=receive_g2h+0x2cc/0x350 [xe]
> > >            <idle>-0       [004] d.h2.  3821.138439: xe_pm_runtime_put: dev=0000:00:02.0 caller_function=xe_guc_ct_fast_path+0x2e4/0x430 [xe]
> > >     kworker/u32:0-53314   [001] .....  3821.138443: xe_pm_runtime_put: dev=0000:00:02.0 caller_function=receive_g2h+0x2cc/0x350 [xe]
> > >       kworker/0:1-9       [000] .....  3821.138474: xe_pm_runtime_put: dev=0000:00:02.0 caller_function=xe_ggtt_remove_node+0x1f6/0x280 [xe]
> > >       kworker/0:1-9       [000] .....  3821.138495: xe_pm_runtime_put: dev=0000:00:02.0 caller_function=__guc_exec_queue_fini_async+0x1b3/0x350 [xe]
> > >       kworker/0:0-21730   [000] .....  3821.138503: xe_pm_runtime_put: dev=0000:00:02.0 caller_function=xe_ggtt_remove_node+0x1f6/0x280 [xe]
> > >       kworker/0:0-21730   [000] .....  3821.138540: xe_pm_runtime_put: dev=0000:00:02.0 caller_function=__guc_exec_queue_fini_async+0x1b3/0x350 [xe]
> > Looks very helpful, I didn't know exactly how to get caller function in
> > output like this, cool.
> > 
> > >     kworker/u33:0-25711   [002] .....  3821.138601: xe_vm_free: dev=0000:00:02.0, vm=ffff88811185a000, asid=0x00004
> > >       kworker/1:6-21907   [001] .....  3822.308942: xe_pm_runtime_suspend: dev=0000:00:02.0 caller_function=xe_pci_runtime_suspend+0x3f/0x120 [xe]
> > >       kworker/1:6-21907   [001] .....  3822.309550: xe_exec_queue_stop: dev=0000:00:02.0, 3:0x2, gt=0, width=1, guc_id=0, guc_state=0x0, flags=0x13
> > > 
> > >   drivers/gpu/drm/xe/xe_pm.c    |  7 ++++++
> > >   drivers/gpu/drm/xe/xe_trace.h | 47 +++++++++++++++++++++++++++++++++++
> > >   2 files changed, 54 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> > > index de3b5df65e48..a38452ccf033 100644
> > > --- a/drivers/gpu/drm/xe/xe_pm.c
> > > +++ b/drivers/gpu/drm/xe/xe_pm.c
> > > @@ -20,6 +20,7 @@
> > >   #include "xe_guc.h"
> > >   #include "xe_irq.h"
> > >   #include "xe_pcode.h"
> > > +#include "xe_trace.h"
> > >   #include "xe_wa.h"
> > >   /**
> > > @@ -87,6 +88,7 @@ int xe_pm_suspend(struct xe_device *xe)
> > >   	int err;
> > >   	drm_dbg(&xe->drm, "Suspending device\n");
> > > +	trace_xe_pm_suspend(xe, __builtin_return_address(0));
> > >   	for_each_gt(gt, xe, id)
> > >   		xe_gt_suspend_prepare(gt);
> > > @@ -131,6 +133,7 @@ int xe_pm_resume(struct xe_device *xe)
> > >   	int err;
> > >   	drm_dbg(&xe->drm, "Resuming device\n");
> > > +	trace_xe_pm_resume(xe, __builtin_return_address(0));
> > >   	for_each_tile(tile, xe, id)
> > >   		xe_wa_apply_tile_workarounds(tile);
> > > @@ -326,6 +329,7 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
> > >   	u8 id;
> > >   	int err = 0;
> > > +	trace_xe_pm_runtime_suspend(xe, __builtin_return_address(0));
> > >   	/* Disable access_ongoing asserts and prevent recursive pm calls */
> > >   	xe_pm_write_callback_task(xe, current);
> > > @@ -399,6 +403,7 @@ int xe_pm_runtime_resume(struct xe_device *xe)
> > >   	u8 id;
> > >   	int err = 0;
> > > +	trace_xe_pm_runtime_resume(xe, __builtin_return_address(0));
> > >   	/* Disable access_ongoing asserts and prevent recursive pm calls */
> > >   	xe_pm_write_callback_task(xe, current);
> > > @@ -463,6 +468,7 @@ static void pm_runtime_lockdep_prime(void)
> > >    */
> > >   void xe_pm_runtime_get(struct xe_device *xe)
> > >   {
> > > +	trace_xe_pm_runtime_get(xe, __builtin_return_address(0));
> > >   	pm_runtime_get_noresume(xe->drm.dev);
> > >   	if (xe_pm_read_callback_task(xe) == current)
> > > @@ -478,6 +484,7 @@ void xe_pm_runtime_get(struct xe_device *xe)
> > >    */
> > >   void xe_pm_runtime_put(struct xe_device *xe)
> > >   {
> > > +	trace_xe_pm_runtime_put(xe, __builtin_return_address(0));
> > >   	if (xe_pm_read_callback_task(xe) == current) {
> > >   		pm_runtime_put_noidle(xe->drm.dev);
> > >   	} else {
> > > diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
> > > index baba14fb1e32..73fe28f92d48 100644
> > > --- a/drivers/gpu/drm/xe/xe_trace.h
> > > +++ b/drivers/gpu/drm/xe/xe_trace.h
> > > @@ -369,6 +369,53 @@ TRACE_EVENT(xe_reg_rw,
> > >   		  (u32)(__entry->val >> 32))
> > >   );
> > > +DECLARE_EVENT_CLASS(xe_pm_runtime,
> > > +		    TP_PROTO(struct xe_device *xe, void *caller),
> > > +		    TP_ARGS(xe, caller),
> > > +
> > > +		    TP_STRUCT__entry(
> > > +			     __string(dev, __dev_name_xe(xe))
> > > +			     __field(void *, caller)
> > > +			     ),
> > > +
> > > +		    TP_fast_assign(
> > > +			   __assign_str(dev);
> > > +			   __entry->caller = caller;
> > Does it work drop the 'void *caller' argument and do this?
> > 
> > __entry->caller = __builtin_return_address(0);
> > 
> > Unsure if that will produce the correct output though but worth checking
> > on.
> 
> I tried that 1st but  it didn't go well:
> 
> xe_exec_store-86116   [001] .....  9013.365684: xe_pm_runtime_put:
> dev=0000:00:02.0 caller_function=xe_pm_runtime_put+0x1b1/0x300 [xe]
> xe_exec_store-86116   [001] .....  9013.365745: xe_pm_runtime_get_ioctl:
> dev=0000:00:02.0 caller_function=xe_pm_runtime_get_ioctl+0x194/0x240 [xe]
> 

Ah, yes. That makes sense. Looks good as is then.

Matt

> > 
> > > +			   ),
> > > +
> > > +		    TP_printk("dev=%s caller_function=%pS", __get_str(dev), __entry->caller)
> > > +);
> > > +
> > > +DEFINE_EVENT(xe_pm_runtime, xe_pm_runtime_get,
> > > +		TP_PROTO(struct xe_device *xe, void *caller),
> > > +		TP_ARGS(xe, caller)
> > > +);
> > > +
> > > +DEFINE_EVENT(xe_pm_runtime, xe_pm_runtime_put,
> > > +	     TP_PROTO(struct xe_device *xe, void *caller),
> > > +	     TP_ARGS(xe, caller)
> > Nit the alignment looks off here.
> > 
> > > +);
> > > +
> > > +DEFINE_EVENT(xe_pm_runtime, xe_pm_resume,
> > > +		TP_PROTO(struct xe_device *xe, void *caller),
> > > +		TP_ARGS(xe, caller)
> > > +);
> > > +
> > > +DEFINE_EVENT(xe_pm_runtime, xe_pm_suspend,
> > > +		TP_PROTO(struct xe_device *xe, void *caller),
> > > +		TP_ARGS(xe, caller)
> > > +);
> > > +
> > > +DEFINE_EVENT(xe_pm_runtime, xe_pm_runtime_resume,
> > > +		TP_PROTO(struct xe_device *xe, void *caller),
> > > +		TP_ARGS(xe, caller)
> > > +);
> > > +
> > > +DEFINE_EVENT(xe_pm_runtime, xe_pm_runtime_suspend,
> > > +	     TP_PROTO(struct xe_device *xe, void *caller),
> > > +	     TP_ARGS(xe, caller)
> > Nit the alignment looks off here.
> > 
> > Also a few other look off in patchworks too, double check on all of
> > these.
> 
> 
> I accidentally used vim's auto indent on  portion of code and even ignored
> checkpatch's warning thinking
> 
> it must be because of existing tracing code. I will resend soon.
> 
> 
> Regards,
> 
> Nirmoy
> 
> > Matt
> > 
> > > +);
> > > +
> > >   #endif
> > >   /* This part must be outside protection */
> > > -- 
> > > 2.42.0
> > > 
