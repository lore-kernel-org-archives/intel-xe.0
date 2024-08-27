Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A0B2C54731
	for <intel-xe@archiver.kernel.org>; Tue, 27 Aug 2024 16:24:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA25410E0AA;
	Tue, 27 Aug 2024 16:24:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZOW3vviP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FDA110E0AA
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Aug 2024 16:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724775877; x=1756311877;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=53Snsa/JjMAb4v2PDP0f8hVBPIAEduIiW0Cm1tgH1Lw=;
 b=ZOW3vviP0w5d42p2iDd+b9Omu9e+u9JSjoVmCzPfL6nzyGwzFBwQzAiW
 vw4xGx/mzZdQ3jTl/O6Wi2xfcr/8k1MkQ9nnK1iIpOTEaclDI3OiDHfhn
 5rfUFK3L/efz6Md5j47l9yagjxJYR7dakO2QaO2nIXKPz1KW6q58a4pI8
 wDuleqIARox8SWLFWfxENWQCjdJyg0UYG+ruCokM4XpVvTSGxgDIe6rbx
 o/myrHul9gIV4/ehUd4uq2FotYI8yHwI0Jg9UKtmi3T23mKVm/S0PvmD8
 oO7p5I8II4r+QOK6mJ5ErxpDCLBMaXvDh/sRH0epySSZ8xa/SX2ElfqPf g==;
X-CSE-ConnectionGUID: 4pEhpVkQRliOeJDD58X7DA==
X-CSE-MsgGUID: WTDxHCHlQOO8yXctQexf+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="26166887"
X-IronPort-AV: E=Sophos;i="6.10,180,1719903600"; d="scan'208";a="26166887"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2024 09:24:37 -0700
X-CSE-ConnectionGUID: pdEP5xsTTUiKTMUIZ9Bvdw==
X-CSE-MsgGUID: vSn84ZUGRg2tgp53deEN4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,180,1719903600"; d="scan'208";a="100427129"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Aug 2024 09:24:37 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 27 Aug 2024 09:24:36 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 27 Aug 2024 09:24:35 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 27 Aug 2024 09:24:35 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.172)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 27 Aug 2024 09:24:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bjO9SV22+KEXGErtqbIRXKTcXgVqvrevVGptR3ybEBk5J/E2bO/IUT6YjoIRFaSTtK3hMs3h20Fub9VHmjERoTcMbZqHGwHEoiUXUG3ultSNSTgt8FdZZDKirHlVEatwixYgBPK02qxP/9y5sGwUZBiAjXwqzK/wLpoQiwaTLzlQyo6CJJmwm0/Ojvk3WoApByv5giuScRyhx0kjUOfgarz3yrdOCNZZUIeuhdTPQPZQlek2fT9MhnccaLRFNmCv4CMlaQmS16Xv7y5uqlJZtbXHxaRo77GIBTfYdEIcPzkc0hlyRnDIqwQZVPWGbcO6LOHhq7jSALZmLFvQApgmwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=53Snsa/JjMAb4v2PDP0f8hVBPIAEduIiW0Cm1tgH1Lw=;
 b=ceya7xj0HPRacf7OVIp1cFrcAOq0c/UUVm+/He6031TBfJot3s3q75jET3p5TxfedimFBgSDVm34DCDJSgpDhPAAzfXxHVQnLSYImoifCFolqT1XfhVc3w/whAeR9liAGa7WOzNL/j2a2cxJzWJGrbhT9pPNQmYb6tW4/3vxK1z/BgV3fQWRsZ/UVgJP14aCC7f+7cUsovZ8ohXLBTYLCMVhy4snU4dxvJRi1NvVofeso7paUG6cYsHmQegTl2gPYWRUiRZShC2YmDbcqeeomTs+NQsav9yxk7r94E2QIrYGrkjSOVlIKotQ9ExU7X/zA0aVoPn0qS85bW7aii/Ddw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MW5PR11MB5882.namprd11.prod.outlook.com (2603:10b6:303:19e::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.26; Tue, 27 Aug
 2024 16:24:33 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7897.021; Tue, 27 Aug 2024
 16:24:33 +0000
Date: Tue, 27 Aug 2024 11:24:30 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH] drm/xe/lnl: Drop force_probe requirement
Message-ID: <bxumsofnajyemfjleros26mkhs5y5zbz2vbmk7lwar5v5hie23@5kybvy3umbqk>
References: <20240822224615.793540-1-lucas.demarchi@intel.com>
 <172473996201.1677393.11744348549360173487.b4-ty@intel.com>
 <877cc21k3q.fsf@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <877cc21k3q.fsf@intel.com>
X-ClientProxiedBy: MW4PR03CA0120.namprd03.prod.outlook.com
 (2603:10b6:303:b7::35) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MW5PR11MB5882:EE_
X-MS-Office365-Filtering-Correlation-Id: 02270324-3f91-4b30-29d0-08dcc6b4bbef
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?8c0znKbeP1dTMjbLYWcGYiqZuW16q7nPVDHVW33RVpV9kOeMFanXbZYX0Db3?=
 =?us-ascii?Q?VfOAgf0KkdklkoLiIwpBZe5kuf+w7zKPDvyg8ztGsygJtXlsRZRG9Wy2aPdg?=
 =?us-ascii?Q?Jus9OniXg5iJT9dqshVJTHrWFH/2yNYSObHirgz8xvk1w1Oo9Kaznd850oAJ?=
 =?us-ascii?Q?Lgy6D/jimSAOlZ50cCMjE/YqIkIxnpTpbySE3UbHyQZSrfea2sGoLNFjIo6I?=
 =?us-ascii?Q?odRyubmV54o95HSH84AktRXAwDZNkvbJ8yfTCNdFE+y67SEzvrHr7xJ72WfT?=
 =?us-ascii?Q?HnK2BSBoOo3OV9gO1nJ6iwhFslnwaqlqAp7WA4439eTK8sFM/blyBEoCkerk?=
 =?us-ascii?Q?gZTOIcW+86d6iDCLVhm574TbtUoU9oZfoTmqmj8z6XWxSHH/xt70Te2IWmES?=
 =?us-ascii?Q?iLbXvrKo59MHRnfaSH31pcYvc1f8M2GB8d/KqDaxZ7hBR8R5CFakdAkuO87w?=
 =?us-ascii?Q?WOKsiX120kETXHmfPScie6O6uoPTMy0OJuZffC56PiLew4jQyYc0Qo01Pnme?=
 =?us-ascii?Q?si+redATBVGQShrubVnx6UsoBa/p5nFR6xsVZ3b60NI+uRwrUShXdKcqgizi?=
 =?us-ascii?Q?WNsKyI7QI9wR5Fkjrlids7H+o2ZFfQOg5qbYV4w8+loNbbFCLma/CaP1ZZPM?=
 =?us-ascii?Q?4xCUyqZXifyr5w2hFPdraKVqTmKUzWhbFp6AqA/A/FIk5emF8QMkdYPNFAy9?=
 =?us-ascii?Q?2EFcH72RV4tNOl+UAzAmpcOPFrHdWS1cmrpJ47rNzWYRhY/JX6yvcBj0qPJz?=
 =?us-ascii?Q?0g3OnjEbo8h2gErquVR/Nl1Fqe48FCIbJtcWuhUYGfln4ljIhiLBegi6z67V?=
 =?us-ascii?Q?EmcPv1VEI1sGLl/lTJlpV1ewJa+Sknzrsy8v0ZiW7Eg3NCDAOjW4IQGynqpO?=
 =?us-ascii?Q?EOCHBGbr8blY0DVhmajr37NqgbcbS7oCkLjgH3NpDuMFmImkRCTzUbxLLccW?=
 =?us-ascii?Q?gyIC+WYwhfr+AOeiQzoNQkt3FBPsi1UUGmiCW3IJUUXsfHklRxcufqPHXrA/?=
 =?us-ascii?Q?8pZPqjbcPW/fks0EF+CMQCUokYmKX3X0cHLw/tdQdOqs8BPzTnqxyPyWVAui?=
 =?us-ascii?Q?8eUvvXyDUGC6XMEsiIRvGM4QJwN8CvmJ5kQetU7SAH19pSM/knHUdf7cc2ch?=
 =?us-ascii?Q?nMXNa4+J0kRM6b/5g/+rIb88gIY9oY3NOoD5YZRhAyt8YSkM38opSaFaUHJI?=
 =?us-ascii?Q?5uxlTvxU7R7ZvpcOv6zegU1HKn9BGYRIKChdpmQmUtOYfwuA+NhAT99aUSUw?=
 =?us-ascii?Q?Tf5XZxdd85gqKamJJR2F7nfG9PkvBwFRh8L9Ep56q4Xjjc9j3o4etckvgUFJ?=
 =?us-ascii?Q?uhIOj2O82slu/+A13ersU4s8UK3kR3R1sxMMlltzTy+9wA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/ib2KqKc0iOFlAagoCCd3EzJkw089Bj+3/fuwbawr+CbL6JgFN+blHMsuKpG?=
 =?us-ascii?Q?+pGt1TYC+QDyBYyrdmKZ+pp5gd0SIPzNGhCl5UbzoXWG0FXEqPwWtYu/stj7?=
 =?us-ascii?Q?5J5HOjvXMLMBERjNLKgVoqQHCm2HrVfKXoe2tKJH6JEkSIz3zP17ZflsIbJ6?=
 =?us-ascii?Q?sWt6mQUGfA9l6oCgibFFEqENI15bZnAKM0Mg0ym7BEAo2nNPqY5qVgsClmiE?=
 =?us-ascii?Q?FXnSqX7WGHIAntGDBrNbaXJHGzZlG8KMwT5S4TSOJV+HVdMAMrfRhMmE0pOG?=
 =?us-ascii?Q?oa96FSH1gVvlb7QHnqTiSADIqq2/qVPYfKYNazPVIjf27TxxBrA22KOYxbZz?=
 =?us-ascii?Q?N96GXHMKcf7Qd4pI52N9mNLZk+57enSUUFnKnmzOn90f68xtuyCsxOrijrWQ?=
 =?us-ascii?Q?nI6GW9sqvGQanL2RfEFj+A907W/gcavPs+xn2W9OHmk5t+UJgn08ssYykMMb?=
 =?us-ascii?Q?De+1XEsoWTSmyoPCEIPRYUghY2JMv1e84K/DDuu3JAlmh7MutYZ8HoNlEPwf?=
 =?us-ascii?Q?cdEr6M1KVvd/s69OG5bCYTckG2G2Zpdf287EXARhTNf+RiarL5zzw9KsOpI/?=
 =?us-ascii?Q?bJsJCW5WzW8cuq0nQycX5QTgb6alUs1QQxYEKAh1/7M+5kwahlBYHRe0X1ir?=
 =?us-ascii?Q?S64cf6Yu4TGdXV42/p7Q1jUb3EErcsOiooy9NCSjyj78dMhECHXrI7lUAODC?=
 =?us-ascii?Q?IQTeZKcLXZYGZP2eGwEPZkj5ErNor76BgqCBD52RTahp1abfwX0qlvvRmYF0?=
 =?us-ascii?Q?li98Cdh5GCpV7fEA9pjIvqnEjKOpZfkVHk6Vsk86LF2U3PHBH8Y+38fr9seI?=
 =?us-ascii?Q?nNQDIGnxzwxbDkWFdZsFDaavJIHw9WPyhsWjgRLuHH5JmBfdflecoEQ1Tvdl?=
 =?us-ascii?Q?pzCP9pRSaLwod+R/E9e5Ey5LLu1vQLI/SI6l0m8SPsAZ5KGwk8zGBC3w0NHZ?=
 =?us-ascii?Q?gkrxj25+WoNWxxmpMWe2+nPb18pazhfZlffaMxUPEVbhaOCs6WEo58dJcCE1?=
 =?us-ascii?Q?ZMYXMGy0n1mN9MkVOIWyn1Vdu1IWc+b+ODLqqJE/8KyD+8qcEhjSmuXXEtN3?=
 =?us-ascii?Q?mey6A5OZS0wcyQk3KdubXIkQNvWx6SLBPpjQlqJ6Fe/SbddB3gow7+U+batC?=
 =?us-ascii?Q?G78ncSm2xxKBOeblFFLtKBwBV631f9vyCYUrLU8Bg0NfKzP7VcnlLfYJYhiA?=
 =?us-ascii?Q?rRVrG/veowgaX7DjcDWd4TLUVYqk9x3WUqczYPPb5TybNOE/QAhDOXf4HiH1?=
 =?us-ascii?Q?6btm2r3Ia7VvDFrOzeYUICYbJsTokUL2yWNQU+NZuk9vcNIWihW7VwvS3wVd?=
 =?us-ascii?Q?jmQElL+lLCn4ue+5umgLQ4xApU+eO4eHumnV6GhyBgOumi+c9WOuWqxiAm2I?=
 =?us-ascii?Q?GSRD8ld2w+sR2bHD8UEDoXZC/a5IcAyr6WqiTY9dtV/a0c5XCDKNE0z9QwSc?=
 =?us-ascii?Q?hIJF5/ZMLNnfKBhWrJj6kvUs6prx10Hw+5AOT+jRD/TL2oOaJTqA8pLaOUIi?=
 =?us-ascii?Q?Wh/MKvwDB+/E/JuKFR5h/l95Q4RkMWOFm5M/8dIfM2eGp/ivZ1kTo5yYkDbh?=
 =?us-ascii?Q?kPQs7DyTLPZxZN5tz3lg4qfsFtZq1nTamYH9leRYaJCwVO78S97OukuGeJIv?=
 =?us-ascii?Q?Pw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 02270324-3f91-4b30-29d0-08dcc6b4bbef
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2024 16:24:33.0096 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UdYULmUgfyWpcY0CVLNGD4fL3tDilQo+CzggWacieiVvzf7mtoIKSZnI9RZkhpj8Z5dhQohOVOKuEX+HcVrGy4mvTO/+k/hIFIRjNhTGjDM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5882
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

On Tue, Aug 27, 2024 at 10:49:13AM GMT, Jani Nikula wrote:
>On Mon, 26 Aug 2024, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
>> On Thu, 22 Aug 2024 15:46:15 -0700, Lucas De Marchi wrote:
>>> Lunar Lake has been usable for a while in a desktop setup. Bugs are
>>> sporadically showing up in CI, but being promptly fixed. Nothing very
>>> concerning.
>>>
>>> All the uapi changes related to fundamental platform usage have been
>>> finalized.
>>>
>>> [...]
>>
>> Applied, thanks for the reviews.
>
>The patch and commit message are all business, but this does mark the
>first platform actually supported by the xe driver! Yay!

you scared me replying to this after I merged :-D. Yeah, really nice
having the first platform officially supported.

Also heads up that we should be even more diligent on marking the fixes
going forward. If there isn't a good commit to tag as `Fixes:`, let's
make sure we are at least Cc'ing stable. I noticed in this cycle we
weren't bothering much with WAs and some are really needed for platform
stability.

thanks
Lucas De Marchi
