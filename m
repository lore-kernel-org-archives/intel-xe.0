Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 937FDFC6177
	for <intel-xe@archiver.kernel.org>; Fri, 13 Sep 2024 20:16:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51FE210ED7A;
	Fri, 13 Sep 2024 20:16:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ds5oqPYL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BDA210ED7A
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Sep 2024 20:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726258558; x=1757794558;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=WCrOYBky2bVttTB1oqHZPUkqfxK04jdTfZMAyMJCOhY=;
 b=ds5oqPYLWWJU5axZr7mGV8M+ICTOZlQ+YvUCY789xgDphhWtNhWwZlAR
 HfK2MQ/UnmKx+5Kr7+p9o5NE+Ico4161BVGVvboVOX6bmuvLsDxmjUCHR
 idockE0CBtn4Ch/OMmj3ydkd+hoAZ4/hgMnpcGHT95PxWxG7hYYahDyDX
 dYs+mk/Y8O56nrN7LonNuFWKaGAtlCQq/hfLjKLRkoy6WKyas/MXOq6S7
 3obdGu4gZ388jXK5em1QGV/tOasdUEw4+N123+VdMTVfETdhZjeH+gHCQ
 xhRertVu5Hy3ZzInFn6ZfetAFtBv1KTQehZLrL2bX4C0XFdbbF8aXAxXX g==;
X-CSE-ConnectionGUID: RF5EWwGlSC2lO2bz99/e5w==
X-CSE-MsgGUID: r3hFm/aMTj2DSIGqEKGBww==
X-IronPort-AV: E=McAfee;i="6700,10204,11194"; a="28957007"
X-IronPort-AV: E=Sophos;i="6.10,227,1719903600"; d="scan'208";a="28957007"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2024 13:15:58 -0700
X-CSE-ConnectionGUID: in4rv4UGR7WJTplWWTlNFA==
X-CSE-MsgGUID: amLDaeuuRra/Ol9F5pS3OA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,227,1719903600"; d="scan'208";a="99032666"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Sep 2024 13:15:58 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 13 Sep 2024 13:15:57 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 13 Sep 2024 13:15:57 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 13 Sep 2024 13:15:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eaLg946ju14uYvtlqx4g1Bs+GbsTzMzb3j5kfCeaeJnRDvoXOrY3BdZLGLiQffHfaw1bDbAPo+kmUp5mJl5d8r2y9gt5Mb7MM4z/CreyxW3CkxjjLSPUpKs13fJj72denYvKWtDiPjOBsBAMLccmWFtdaWj6T+qz/uk62wZ6UIxDQvwmE12icTfWV7faVvRo1b9zh5qDv5hOeS0dGvcZ+A9NYLBA2my2+q3BcVAO0jLD3d/sfRrAL8kDhnTeGJulD8QPH0HgBdMiJWAGsxyLFNbFWD0WzEVGuUosLoQlgjnS6D96mZ8O1B3UZKWxtb9tPq6FTiL73E+KIA67drWI7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=INeIaZBXwuueKA5Qucoz0KsVJrm/OKCePxvJycy7MWc=;
 b=gDXMpAUiwoo5ah4LdR49dqgNPfks4ptww9jvkqE9g3AKzEpt9aALLVCRXVsMp37sQGpeARa+kSQhRR527IIIuzVzJjW9FI2cysayhT52Q7oU0WnHwjyx3BJG8WKUGHB6aCXqXBu+7E4C4EHdSW8hbqQgbzOlSCMIGNZqcVZgrulH1lQBEaal5szJCe9T7dB7vTpLb5V0fFRzH99vGI77G0UeKP3LLrARj5ltFtqBwqY9jZlyqlsBZj4PPAPEL6MgQlmV5HkP2WVars/XUl1Rxf2EIhoWAUi7xwMUVOG8gDfGI1wyuCQytcCWM6IVtDATcpyXmfU6Oi/fe45PiXoCkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB2859.namprd11.prod.outlook.com (2603:10b6:5:c9::14) by
 SA0PR11MB4702.namprd11.prod.outlook.com (2603:10b6:806:92::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7962.18; Fri, 13 Sep 2024 20:15:54 +0000
Received: from DM6PR11MB2859.namprd11.prod.outlook.com
 ([fe80::4063:4fec:bf76:f095]) by DM6PR11MB2859.namprd11.prod.outlook.com
 ([fe80::4063:4fec:bf76:f095%7]) with mapi id 15.20.7939.022; Fri, 13 Sep 2024
 20:15:54 +0000
Date: Fri, 13 Sep 2024 16:15:49 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Matthew Brost <matthew.brost@intel.com>
Subject: Re: [RFC v1] drm/xe: Use fault injection infrastructure to find
 issues at probe time
Message-ID: <ZuSdddkrFZgCDkqt@intel.com>
References: <20240913143305.2262927-1-francois.dugast@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240913143305.2262927-1-francois.dugast@intel.com>
X-ClientProxiedBy: MW4PR03CA0139.namprd03.prod.outlook.com
 (2603:10b6:303:8c::24) To DM6PR11MB2859.namprd11.prod.outlook.com
 (2603:10b6:5:c9::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2859:EE_|SA0PR11MB4702:EE_
X-MS-Office365-Filtering-Correlation-Id: 48aca5a7-b161-4663-9e7a-08dcd430dd8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?bVPgj+e7YrqxvDbP/1n1K/N5fJUsLSG0o8B3LAcFEx72VFX67FzS7ePpFb?=
 =?iso-8859-1?Q?dE5YRhA2U2AjK3nMJ8l7sNbBpozEHkpTGEOHGdoGm034ftoiVeItF8JB3s?=
 =?iso-8859-1?Q?a1agjK17bjd9nEPlj282NkuWPNN0WCknNp1JI9qk3SjakeY3NKGNBexJql?=
 =?iso-8859-1?Q?wSy5fAGzzMwOtTqmfB0O2jHQhuInwezOf223Pe7Qeg+1qPjWoYtrr6xJIO?=
 =?iso-8859-1?Q?iHYlBd9xpBCFa2ptcb1irZBdu8FpZjAF6q+jeWG11dNbXnWHvjGox9iNrh?=
 =?iso-8859-1?Q?15QTxz3cZnLxh78eERTJl9Q3W9xhwaMTthzlTAnwmADTiJZpPdYbgSqwrl?=
 =?iso-8859-1?Q?tfdYoXpzBjrNXzPq3d4vDoSj+o7sDYbsQaBxg2cTTZZxLqRWX3+uR837YT?=
 =?iso-8859-1?Q?AL2hUIAlfitji1uFKwCuBb/adcVEtxWiQ61qEDwi3pxxEc0bdPMpmfO12U?=
 =?iso-8859-1?Q?47sbJuNdyXhCmPZ28ekTDd/cSM2vl0R+Oow0Ok4iyDFeDnK+zTyif0pOwS?=
 =?iso-8859-1?Q?Pfxd464gtecnD7XEwIGeRmGPaxvdmRJjhp9uUD420tEpgkPO/socjHl/CG?=
 =?iso-8859-1?Q?a4bY5Seq3I6IZx7xbm7mfiSVlDloHRyjWrs5RMM7740yIH7R/5Ko4xecU7?=
 =?iso-8859-1?Q?m9elehDQmUkjnwTdWSbBeZdFEOCSJfjBKMby9tBtF3uPQmn0ZkhZ6G+0hm?=
 =?iso-8859-1?Q?PDUWRUWSvHJOdu977HcGktkuDLyekdOqnD1npqcd0tamZvVwLa2cwzNUwQ?=
 =?iso-8859-1?Q?OHpRZ26MYfemT9sjcmgcANh9/TZBuzdmibEbkBDH5GGcR8gI0F/nfzusSU?=
 =?iso-8859-1?Q?5sAWXX4fZ6Idjhg16CDYWMpTMex0X0UefOJ3H/BqsHG4Ru95qiW107gmo0?=
 =?iso-8859-1?Q?fUedqrqGDuxUFEd9wrus5bfDGjCZtSst/6iZw4LP7m7Irk2MIYzzyd2rNS?=
 =?iso-8859-1?Q?L+sBQk+A95cRlitzIbh0v7JpNEJKfM1yx8isau+iJQVGArc6VN17/exTBg?=
 =?iso-8859-1?Q?mj2tiNgmJ33ZSygK272lqbjjd0zFBLAH3J6AgAlPgKKxxpEoMcQqwW5hee?=
 =?iso-8859-1?Q?sPA+D3ZKuZJnAQUf08s/DRIUjfozae5xoyRylzSqY27HCH/C5yMErHXwy2?=
 =?iso-8859-1?Q?8NsSABYOfAIEnnOIqXW0uG0Yl+jB8IFgHVu+B9YETquf7Tmek18WpIeSrL?=
 =?iso-8859-1?Q?uyyMv6Br4eWyZWnirbfn86bwDpJ/o0ePaC+VjVY99dp5uQEjaIzwI+676Y?=
 =?iso-8859-1?Q?JaCLCnEhAE880z8k1AboQoL98V6TvGAkRoBsDekdsXA/JGh95vM6jEm2UK?=
 =?iso-8859-1?Q?dQkgKQPW5a3Dmb8K/rqjJ5qkqNj+AuMLvruPCrYvyBZOptM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Jv6R9zMrGagmky4IfT4dvIYMqupuiCj0RciS+a4CY77mY578eLSaFJljZH?=
 =?iso-8859-1?Q?W81n75GTtLaaDdPhHNeB2MjxfdAiwbvI6I/iR9UOhJ21zdNmf1W50fFLUE?=
 =?iso-8859-1?Q?cMoxagdej3ORedjxd2Nb/6y9Yzmx/ww3ay3mncR17/nwWdV2Y3acn7HBIh?=
 =?iso-8859-1?Q?bHcl2JUNNrHdrUKNBArprUhR6pU9ArWFayO9LEh1Hczdc08NnJYUthqgdE?=
 =?iso-8859-1?Q?qIP+r+EDWzceX+lGTBV6GsKR3T8dAHzAveYfByGZ08i9YLSz0ZR4bWHhEV?=
 =?iso-8859-1?Q?kWA4aqX94pzlVtcIhku87KxVswfXil43irFhCiDtQGzxxO4zXXi2RBGFfC?=
 =?iso-8859-1?Q?iyq5r67SMFFXQ71nHf10Xflq+w9qf2nppgwda8QCqBeeyRvKfw1nEYXzO/?=
 =?iso-8859-1?Q?Sn48+ETp8VuA/+JzaV5e+WR9IXjrZC3mnC78ZlA0zao/t9NWm0Ro4qmDXE?=
 =?iso-8859-1?Q?8JU0yyj2oPWg7YWuwROe4AWbFYcjB0CgLpIQenEuGBvQ9OFyMS8MZNnn76?=
 =?iso-8859-1?Q?dbNFWaivYLhCHJrvHIMb+HUYgsyN+leZyZCg+RdWu9vg+BvHC+RyoN/ynP?=
 =?iso-8859-1?Q?dj/fOylqbKnC5spFSZ/vjjJeKatNigXiq9iY9nYdgwTh9Xjo6P9VZrfBts?=
 =?iso-8859-1?Q?jeeYTwDp4Ars1wQDLyG3OyQM4d4pCwD2JSFJ4hmAzTbDTII4/DbUdowkKh?=
 =?iso-8859-1?Q?0x1uYPIT3r3ZS5qLo0KZB5ijqbPvHe07zcAnwQrExWzDGIlJsxndFUOv1r?=
 =?iso-8859-1?Q?JTkNjeLvdYIBNMDvScoYlWwyMu17zeQ8G+ffstaFHomvg11AguMfJvlCl+?=
 =?iso-8859-1?Q?5JZHTXpEYSmjash8aNzMsITOAI2Q4Hh8I/Dpg6bqR4fBcXyg176ZBEVGMo?=
 =?iso-8859-1?Q?hOL4oWqZLrpONnxoWaysQYNAFo2umCSpFXbytBbZnroO3COvg3C0bYRotq?=
 =?iso-8859-1?Q?C8Os9JRqyiBdSJN6eJKSIDgsfTByXqN2YzefySqhy9XVQX3FHy6voS3vYB?=
 =?iso-8859-1?Q?G3BKE0yk25gZgbVHvr4HhOcbWcHag6LjdYorg1SpCKa5naBs0QLIX+goO6?=
 =?iso-8859-1?Q?qiSVK43XwGCvnRbF1fEbGbRLpTq9Ngiw+O7QDW6NVNRgiM7+U1et3Q7OzE?=
 =?iso-8859-1?Q?3hebS8WWHNTkls9WTk/9a9hNwbN9BYqAmiaZRKqJ76l0DeLGPv04dcQcLX?=
 =?iso-8859-1?Q?OD0C0pS69xqEt7Vvrd779X4Q9rGztpti4+xZSClvpaT61Pb/U0pcY0SENl?=
 =?iso-8859-1?Q?6BeaqSP1GXJWkR9PwVn4cBDVIGevih4gOylMXjx1EBVTelKnh5F6ewZdTz?=
 =?iso-8859-1?Q?nNtwjPZKzPKyOStl4VwmepLE3SoEDasuq1Ri+66FSqRinbr0fgzm+UCUCy?=
 =?iso-8859-1?Q?6ubGh/k03baAWZ2UrrbY0VeWjgCCn0iQvIsfiGdpPJRDyNo5tHzky3Y7wM?=
 =?iso-8859-1?Q?v8oIrAmYUJ0GudKTbxgTpPL8io+eleuurZgcSrdN1smVgM5gsALZtjkAUV?=
 =?iso-8859-1?Q?+35BY6yfxNyz3m68VYmcPKLaHu/9uigBtAjaQy3DwmFh7cY2sU1kQltpNH?=
 =?iso-8859-1?Q?4c+pUx8BLc/fhz0BjrpwlX3OszoFUNDV56dNBfq3gm6tuE2gs710p8oysX?=
 =?iso-8859-1?Q?T5qDhu85BmrXW5ipGbmtY4QapwoHQCIGyYb9dsmyJhdGBKyJXO8ixSTg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 48aca5a7-b161-4663-9e7a-08dcd430dd8e
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2024 20:15:54.8345 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pm4oMb07bmwZu75FJ+a5wvWOdHHYGh4OBV330CltOTWs9Esd2Bp/rGhXBZi9XvYOLn5Sm2wldv91CZ/r8WULjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4702
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

On Fri, Sep 13, 2024 at 04:33:05PM +0200, Francois Dugast wrote:
> This RFC is a rework of https://patchwork.freedesktop.org/series/137314/
> but instead of importing custom macros from i915, it makes use of the
> standard kernel fault injection infrastructure, see fault-injection.rst.
> 
> In particular, it leverages error injectable functions with the macro
> ALLOW_ERROR_INJECTION(). This macro requires minimal code changes to the
> faulting function, if it meets the injectable functions requirements:
> fault-injection.html#requirements-for-the-error-injectable-functions
> 
> Unfortunately this is not the case in most of the injection points of the
> original series, so a wrapper is added if needed. Only a few examples are
> shown in this RFC to discuss the proper pattern to apply.
> 
> The return code of the functions using ALLOW_ERROR_INJECTION() can be
> conditionnally modified at runtime by tuning some debugfs entries. This
> requires CONFIG_FUNCTION_ERROR_INJECTION (among others).
> 
> One way to use fault injection at probe time by making each of those
> functions fail one at a time is:
> 
>     FAILTYPE=fail_function
>     DEVICE="0000:00:08.0" # depends on the system
>     ERRNO=-12 # -ENOMEM, other value might be needed depending on error handling
> 
>     echo N > /sys/kernel/debug/$FAILTYPE/task-filter
>     echo 100 > /sys/kernel/debug/$FAILTYPE/probability
>     echo 0 > /sys/kernel/debug/$FAILTYPE/interval
>     echo -1 > /sys/kernel/debug/$FAILTYPE/times
>     echo 0 > /sys/kernel/debug/$FAILTYPE/space
>     echo 1 > /sys/kernel/debug/$FAILTYPE/verbose
> 
>     modprobe xe
>     echo $DEVICE > /sys/bus/pci/drivers/xe/unbind
> 
>     grep -oP "^.* \[xe\]" /sys/kernel/debug/$FAILTYPE/injectable | cut -d ' ' -f 1 | while read -r FUNCTION ; do
>         echo "Injecting fault in $FUNCTION"
>         echo "" > /sys/kernel/debug/$FAILTYPE/inject
>         echo $FUNCTION > /sys/kernel/debug/$FAILTYPE/inject
>         printf %#x $ERRNO > /sys/kernel/debug/$FAILTYPE/$FUNCTION/retval
>         echo $DEVICE > /sys/bus/pci/drivers/xe/bind
>     done
> 
>     rmmod xe
> 
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c | 37 +++++++++++++++++++++++++++++++---
>  drivers/gpu/drm/xe/xe_tile.c   | 18 +++++++++++++++++
>  drivers/gpu/drm/xe/xe_wopcm.c  |  3 +++
>  3 files changed, 55 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 4d3c794f134c..2db62aa45b39 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -6,6 +6,7 @@
>  #include "xe_device.h"
>  
>  #include <linux/delay.h>
> +#include <linux/fault-inject.h>
>  #include <linux/units.h>
>  
>  #include <drm/drm_aperture.h>
> @@ -300,6 +301,37 @@ static void xe_device_destroy(struct drm_device *dev, void *dummy)
>  	ttm_device_fini(&xe->ttm);
>  }
>  
> +/* Wrapper for fault injection */
> +static noinline int device_create_ttm_device_init(struct xe_device *xe)
> +{
> +	/*
> +	 * In case of error injection, the flow is modified because ttm_device_init()
> +	 * executes (likely without error) but the return code is overridden in any
> +	 * case to indicate an error in ttm_device_init(), which likely did not
> +	 * occur.
> +	 */
> +	return ttm_device_init(&xe->ttm, &xe_ttm_funcs, xe->drm.dev,
> +			       xe->drm.anon_inode->i_mapping,
> +			       xe->drm.vma_offset_manager, false, false);
> +
> +	/*
> +	 * The alternative below would also change the flow because in case of error
> +	 * injection, ttm_device_init() would not be executed at all.
> +	 *
> +	 * int err = device_create_ttm_device_init_inject_fault();
> +	 * if (err)
> +	 *	return err;
> +	 * return ttm_device_init(&xe->ttm, &xe_ttm_funcs, xe->drm.dev,
> +	 *		       xe->drm.anon_inode->i_mapping,
> +	 *		       xe->drm.vma_offset_manager, false, false);
> +	 *
> +	 * ...
> +	 * static noinline int device_create_ttm_device_init_inject_fault() { return 0; }
> +	 * ALLOW_ERROR_INJECTION(device_create_ttm_device_init_inject_fault, ERRNO);
> +	 */
> +}
> +ALLOW_ERROR_INJECTION(device_create_ttm_device_init, ERRNO);
> +
>  struct xe_device *xe_device_create(struct pci_dev *pdev,
>  				   const struct pci_device_id *ent)
>  {
> @@ -316,9 +348,7 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
>  	if (IS_ERR(xe))
>  		return xe;
>  
> -	err = ttm_device_init(&xe->ttm, &xe_ttm_funcs, xe->drm.dev,
> -			      xe->drm.anon_inode->i_mapping,
> -			      xe->drm.vma_offset_manager, false, false);
> +	err = device_create_ttm_device_init(xe);

I believe the function name could be simplified to xe_device_init_ttm...

>  	if (WARN_ON(err))
>  		goto err;
>  
> @@ -550,6 +580,7 @@ static int wait_for_lmem_ready(struct xe_device *xe)
>  
>  	return 0;
>  }
> +ALLOW_ERROR_INJECTION(wait_for_lmem_ready, ERRNO);

I liked how simple that is....

>  
>  static void update_device_info(struct xe_device *xe)
>  {
> diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
> index dda5268507d8..22c0a42af9c2 100644
> --- a/drivers/gpu/drm/xe/xe_tile.c
> +++ b/drivers/gpu/drm/xe/xe_tile.c
> @@ -3,6 +3,8 @@
>   * Copyright © 2023 Intel Corporation
>   */
>  
> +#include <linux/fault-inject.h>
> +
>  #include <drm/drm_managed.h>
>  
>  #include "xe_device.h"
> @@ -99,6 +101,12 @@ static int xe_tile_alloc(struct xe_tile *tile)
>  	return 0;
>  }
>  
> +static noinline int tile_init_early_inject_fault(void)
> +{
> +	return 0;
> +}
> +ALLOW_ERROR_INJECTION(tile_init_early_inject_fault, ERRNO);
> +
>  /**
>   * xe_tile_init_early - Initialize the tile and primary GT
>   * @tile: Tile to initialize
> @@ -117,6 +125,16 @@ int xe_tile_init_early(struct xe_tile *tile, struct xe_device *xe, u8 id)
>  	tile->xe = xe;
>  	tile->id = id;
>  
> +	/*
> +	 * The flow is modified because xe_tile_init_early() fails before the
> +	 * first possible error, from xe_tile_alloc(). It is does not match the
> +	 * 2nd requirement of
> +	 * fault-injection.html#requirements-for-the-error-injectable-functions
> +	 */

I'm afraid I didn't understand this.

and the name could perhaps start with fault_inject?!

or maybe:

xe_fault_inject_tile_init_early();

> +	err = tile_init_early_inject_fault();
> +	if (err)
> +		return err;
> +
>  	err = xe_tile_alloc(tile);
>  	if (err)
>  		return err;
> diff --git a/drivers/gpu/drm/xe/xe_wopcm.c b/drivers/gpu/drm/xe/xe_wopcm.c
> index 93c82825d896..88a201122a22 100644
> --- a/drivers/gpu/drm/xe/xe_wopcm.c
> +++ b/drivers/gpu/drm/xe/xe_wopcm.c
> @@ -5,6 +5,8 @@
>  
>  #include "xe_wopcm.h"
>  
> +#include <linux/fault-inject.h>
> +
>  #include "regs/xe_guc_regs.h"
>  #include "xe_device.h"
>  #include "xe_force_wake.h"
> @@ -268,3 +270,4 @@ int xe_wopcm_init(struct xe_wopcm *wopcm)
>  
>  	return ret;
>  }
> +ALLOW_ERROR_INJECTION(xe_wopcm_init, ERRNO);
> -- 
> 2.43.0
> 
