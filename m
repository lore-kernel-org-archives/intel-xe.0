Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D9F4C624A4
	for <intel-xe@archiver.kernel.org>; Mon, 31 Aug 2026 13:58:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D95B10E8E8;
	Mon, 31 Aug 2026 13:58:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EURODSkW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACE2D10E2AC
 for <intel-xe@lists.freedesktop.org>; Mon, 31 Aug 2026 13:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788184713; x=1819720713;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=YqzhmD97moef9f9OcoUsLAS1QMPFB9jyBIOeYSRulR4=;
 b=EURODSkWZQbtQbwAtkmdkmEOYl7jMwyCpZsadxTNVqqr1j/3m++9Vrb6
 q4yPaoAtiJbKINMxudcRZ2eKrGBr9KTlo3i7+MWC8qpTxo1srWLZfzD+x
 yuk2F0/gS4h8efD8IcA3kxySrrVSf9kwZMmWlzCXzxOG/j8fQREca2KgA
 ZO/lmyaiEN1KLWbWXhZfi7h3eqt8QXJsPFO/19GQk1SeqXeHGw04JqZJM
 OHgfiNmS5UWiHG3y67G9Fq51KdVByEQHqXRTLbSJZ/LgqoU1UhYBrYU5D
 FgsyY0ZaYx7x1D1/pnFga/V3f4Khk1olCrNPDObt4lmXpzUDE6It/Qlm8 g==;
X-CSE-ConnectionGUID: cKweDRcXQqCi0GldTquo7g==
X-CSE-MsgGUID: B0aWqkQ6TrOM4qhLpVgd5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="92279921"
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; d="scan'208";a="92279921"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2026 06:58:33 -0700
X-CSE-ConnectionGUID: EC53iTr7T5a/Gh0ojt0ztQ==
X-CSE-MsgGUID: tb+xvXraRZqDE1dNaUsf4w==
X-ExtLoop1: 1
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2026 06:58:32 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 31 Aug 2026 06:58:31 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 31 Aug 2026 06:58:31 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.14) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 31 Aug 2026 06:58:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fDjX2KebqWdKajkEDpTV0BqNZ0ngwfhHLYAGAqsgtqVZ3bdfpt6pwm74nUeTjFDzHh7Qgm5eZmxuRWjWYAmVlyZOOrFPSujsET4aqLQwzFJSxgCMiBB6pj1j1PzGqSD5C28AOpMF7vgXU6RnLnzDOJUXTfPvOSYXDj0CS9FDidc28hxU1K/KLukTFgjwQdz/gM6W98a03/ZgFzFWqDITOA06WmqNz8fXjChCVIhZmcABumKgkBXdpc31O3obmkmaido+Pba8ivg+k4AogIBKuaqcHJOLoNMlEcu/vTe00S+QHQZOAAHjmQNe/dfXixDFi/DMw9QDylMJKk5rIfpnwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xkaRicJDKUuLFtWXoUdF9NTVscXPVmM+swXtSMvd6Vc=;
 b=c5+o5xlATLKEn5jGZyj5poMnSaGf4bUCetE6Sm+qiATtUJ5RHosQIbTS5usmXXzuU+J/lwfE+qezrmuJVJ5JEa2+x4P+zgzwTnrJOlmBccDIsLWmD2qu+zZSBE6hHahPGcBdNfPvHdExMjtfktoWwTZ3EYVpQzqbRKl8noEIzlu15+NJRsROSqbOsY3oyposhziRrutK0zSwpsoZNvBFsDmFPDu0acw7wJ6BUDxNowmzJUZ1PpQGGZk35qrVgQVaDv3wvC1C0W9vCx+ku08CV38Nm20BfVmxXkIOa6RsbaBxXEvRlyERCHS9IcUEEUCFLYMksRgabitZD6hZmo7mjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7187.namprd11.prod.outlook.com (2603:10b6:208:441::12)
 by MW3PR11MB4763.namprd11.prod.outlook.com (2603:10b6:303:2c::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 13:58:23 +0000
Received: from IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565]) by IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565%4]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 13:58:23 +0000
Date: Mon, 31 Aug 2026 09:58:18 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: "Tauro, Riana" <riana.tauro@intel.com>, "Poosa, Karthik"
 <karthik.poosa@intel.com>, <intel-xe@lists.freedesktop.org>,
 <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <sk.anirban@intel.com>, <mallesh.koujalagi@intel.com>,
 <soham.purkait@intel.com>
Subject: Re: [PATCH 2/2] drm/xe/hwmon: Increase timeout for mailbox power
 limits
Message-ID: <apWIek2rVOLgbTre@intel.com>
References: <20260729171546.3368457-1-karthik.poosa@intel.com>
 <20260729171546.3368457-3-karthik.poosa@intel.com>
 <ad776a91-9b0a-4a72-8b05-8890a7b5a4cd@intel.com>
 <2c61329e-a7d0-4524-b585-5d10fd970ffe@intel.com>
 <dc04b171-55dd-4a9d-9ba6-fb3960582e33@intel.com>
 <apUwOZpuO1kOhyVs@black.igk.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <apUwOZpuO1kOhyVs@black.igk.intel.com>
X-ClientProxiedBy: SJ0PR05CA0041.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::16) To IA0PR11MB7187.namprd11.prod.outlook.com
 (2603:10b6:208:441::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7187:EE_|MW3PR11MB4763:EE_
X-MS-Office365-Filtering-Correlation-Id: ffb46f57-40fd-46dc-16bd-08df0767ebba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|4143699003|10067099003|11063799006|18002099003|22082099003|3023799007|56012099006;
X-Microsoft-Antispam-Message-Info: cNc7x0AfNj3iiOdIJYrqF8onaqwriBaG1HVKCiBrkzDqIZeBr8Ugo8bnAbkpU6PvVGwHDfWojhDw/B3/DCKliryNgLMn0E43Wboj9Q8sltDU+XehzMZj+vPUHlESlwik92KxS/PPZ5rfXOtDwUU6FUA1/kiAm7qvV1M9iqV1ufeu5Rp8KnRjxWWrirvhiaKwIKosVlmTvwGD+39LOZ9fUV91ffezCMkSWvM69kIlqLytaX/RsGf0A09zNQazZZALB+VB/crAj/tVTZucPQFVLOBcHV7Lt97qnYJo+Qo7wls4kdJuwbo5VzdJLKjd82TKirGv+beUrpJon7e+LfK7roMRoj39p22w22k1GDpDJzKfOl1oF5pqQSLXIWJY7WNRIVGqkJPGEIURnyY7ajTd4mqVVdmiqKw6TUMeRdq3HuKDQ9AzZps4I1x0zqrCWo2777dAajly3GEcyy22UbaUIRjiC1MEipyzQNDJ/7ZABoNJbg31TTfJqKg0Dk5vGxG4YuoASzD6F5oizsRcX5pfvZcpVZ381C9Cw4J+PvsWnYVb9hNwdPot/NEsManj/xwjzkVbqSfg/CkXKlJmKtDCtGFeOoVWbPVNwCmtPLZHGGfBL02+wPa5G0feTiZUv/k3bG0Q+Jg8kmy8SvyZYSlU216I1THTXSKhyArVpzwtKMA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7187.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(4143699003)(10067099003)(11063799006)(18002099003)(22082099003)(3023799007)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+IAImdOgics3pSQ+hiGfcftMR/2rrztiIULdxuuklB/rrLX+7YWnYTYkkJ+o?=
 =?us-ascii?Q?nnv2wixh0KvR2PtlUpezGKkVu484xHQdfapxepxYnV6enb1wT3iuYsin7bCK?=
 =?us-ascii?Q?mJNL3Jhp6n4k7JP+kk5WAOZPpexOGYT0MAdcDMrt0LdqVFiPLYMp4P899eQc?=
 =?us-ascii?Q?/QBlpeTCa9r0eZfmr0bhskGh0u788vpVoOOrW9VUVSE+KyMBGQsvRbgZuIUK?=
 =?us-ascii?Q?Ce/DLkW+ZCyTktGZXKF5G77EOqsIMrAQ1laWm5ytgON3uXOwnH+wo7enrA/O?=
 =?us-ascii?Q?j8DQil2S8GUPS3jOKqUIPyD7qY17IXKm7fVku2/dVPZL4elVo2bpAzC3jcxq?=
 =?us-ascii?Q?4dFxANxaWJIk2XCESuK1XubiZoGwp8FYlA9fODEbmJLGfWbXgzBD68V8st/D?=
 =?us-ascii?Q?J1+532iyotuUa/lCgJ1I04QObC4ZVqcD5Hh3H0xjHWT7BSboXDMJv2U586Pd?=
 =?us-ascii?Q?62AI3p5yYA71hsuuB73NMulbXVj5TApTNgYcB2Lo0lAEEirohwNhxRxl5sLq?=
 =?us-ascii?Q?C13wiUqPfVlTCqlMzDQsBvaTh1BGK5HRzFpns27/xCIH39vho1og3jDXZ5G5?=
 =?us-ascii?Q?SRaeQT971A2x1vq3EOmKc9H5x+WiMN/VahooxjTCbajaCrmgU1uaQCXoXqFH?=
 =?us-ascii?Q?QnQkAe3ZIM2/fFtmWnfxHAeDO+7SaDHKLjg8Yf+hfgRQXxt71CgvQwvJ9IQw?=
 =?us-ascii?Q?M0E++JkAUhJ0pdzM/CWqRk+rDz/YllCDwFTQZpWQPY/pUyAlh78qlBzy1keO?=
 =?us-ascii?Q?afFhGfUPz6IaMWtvGH5L6juUtecLMNDV680zlcIj4EtTZ2zN4Tx8w7h3G8JF?=
 =?us-ascii?Q?FbGlqzusouiMrqh0O85DAeC0FF/g2SU9MmWZ+qTgupPffHlILY8C2+CNfqvW?=
 =?us-ascii?Q?uqHVWWprZRhWr0jP/3E/1eOSVH0885z+znfqQp52G1EqPFAmKv42Cbs/944r?=
 =?us-ascii?Q?JZtdot8Bq3SAHJwapTFSgCDgVIamQkqHOzmpdehiyVcdK6xbJcMg773zJl46?=
 =?us-ascii?Q?CJZTi9n4YRZHYMB47pn5NDRa1YWtasmOR9bg8fGy2j1cKfzFvXiNC82sah6X?=
 =?us-ascii?Q?B5ONe/b3IR7Pq5F8XSiCgK/s1XcG8gpfM51SCZ3tcJzPMPeIP9rb4S4y1rBT?=
 =?us-ascii?Q?GfryCU5LmOhZKtUIPQWZkH2MZN43z0mhZoYqLIp3uhMUvZ6/yiXybuZIjY8K?=
 =?us-ascii?Q?R7Bp/Sjt02WaQh0HxiQCG4Wl/47kKu+0x9yQzpQXGg/FfR44/uXzzEJxiT7e?=
 =?us-ascii?Q?9MqaSGVxYCq+9xDDDsD/h0ZRklZT/WWzCS7TH1kthHg/RDRl5JF7sTJ8eFIs?=
 =?us-ascii?Q?0J4DD+tvbIr2ZeaTlaErMbenfbkAsxG+hT/Y6cIjggwO3LBNgAgPLv25BRtY?=
 =?us-ascii?Q?06XiVPyjLUUZ90SJi9+NoCx0x6m1d4CMP0BOb0FLdAhgXuQ1zvIMEv3nb0Bc?=
 =?us-ascii?Q?eXkTSiEdU9yNCTfH6ObopaWQVe71v7e4WOpJzRv+NRW07ZnzBmDHW0DDtIsf?=
 =?us-ascii?Q?45ljMKbsPeJ5JUpHhXnUwve4SfOXqpssmrKRk7WxvYYOD437gpX0qYdbKW+A?=
 =?us-ascii?Q?qiSWRJXmGeLMkjU/SiTtro2S6VeZ8bUNvOfzOQYBe4aiZCu5S0Odj00LP4k1?=
 =?us-ascii?Q?CkpJlRwcOou5rvP1wDrrVWBpXndWJDMfVCJ81XnQKZc7CyRfjufj09hFtrrg?=
 =?us-ascii?Q?f39EV8V+NhOqyBxMTeJMg3Y2qlXBZv0Td69eYArCH+mfg+PCU+KGr5Jfktqv?=
 =?us-ascii?Q?hCzDLXHDbw=3D=3D?=
X-Exchange-RoutingPolicyChecked: jPSUpVz8E2BegWNEWVMCa8QoTaTrR8A4NYiBADpCmvqOTo6w0NQHbv0OBaQqVg68d0y+UX0RtK8dFZ/lBK7QJPBfzAYFSH2s/GXYOtxpicin9dwndVsJRVX+Me0sz+NrtXiVUVfKG8b3POFCMHACzPioNbLtSrcRsZdFZ4tMjZxEpHd1VqVOsPbMogdXrBqjzgyJDaN8I6H/DS37H/Mkkd0dNQNtie4gEh41S9Qvlr0GkzV0Cj1vXjO4dBsNInqrpBFz4TO105ek1jJJFI0fCnGiMdejjflzchRnFMUTfT9z3Oa91KdIq62bE+lBCW39yont3UaT9dEkQYYPx2yd5A==
X-MS-Exchange-CrossTenant-Network-Message-Id: ffb46f57-40fd-46dc-16bd-08df0767ebba
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7187.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 13:58:23.0851 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Uj21xXt7qwKP3tQ5eahuWhsQHL5ZpaG6PPGSlzIHZcocu+eqZKEHnmwklquj/4wpLCUzgNPhpFBbQshRUySIhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4763
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

On Mon, Aug 31, 2026 at 09:41:45AM +0200, Raag Jadav wrote:
> On Mon, Aug 31, 2026 at 12:39:50PM +0530, Tauro, Riana wrote:
> > On 31-08-2026 12:24, Poosa, Karthik wrote:
> > > On 31-08-2026 10:59, Tauro, Riana wrote:
> > > > On 29-07-2026 22:45, Karthik Poosa wrote:
> > > > > Mailbox power limit operations can occasionally take longer than the
> > > > > current 1 ms timeout, causing sporadic failures.
> 
> Why?
> 
> > > > > Increase the timeout to 10 ms and rename PL_WRITE_MBX_TIMEOUT_MS to
> > > > > PL_MBX_TIMEOUT_MS to better reflect its usage.
> > > > 
> > > > Why is the timeout applicable only for power and not the other
> > > > attribute reads?
> > > 
> > > Because the timeout is seen only with mailbox power limit commands only,
> > > default 1ms timeout wasn't enough here.
> > 
> > Any reason why this is not seen for the other reads?
> 
> +1, these things should be coming from a hard spec with valid technical
> justification and not some random email asking us to do so.

Well, you have such high expectations :)
Sometimes we have to live with the empirical... while we hunt other teams asking
them to do their job correctly, of course...

Interestingly enough, I just found in some of the many spread pcode docs:

driver_to_pcode_mailbox_spec.html#mailbox-response-time

"""
Mailbox response time
Mailbox response timeout shoudl be set to 10ms as worst case.
"""

Perhaps we should simply change the default to 10ms.

> 
> Raag
