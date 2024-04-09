Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E4CAC67861
	for <intel-xe@archiver.kernel.org>; Tue,  9 Apr 2024 17:52:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D4EE10E104;
	Tue,  9 Apr 2024 17:52:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z1gJhcZi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50AE110E0CC
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Apr 2024 17:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712685160; x=1744221160;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=uYXQ8Hl5KbtyxdP8eGd+E/pf+4qh5uHAbs47JmImS58=;
 b=Z1gJhcZicmLEnJPwbBlSQEG1qq2VGRlce6q9VhpSUf6t5QgLBHW74+tx
 Iabty3d481LT1PF8/FyySLAtk817BpeN47DdGV+93iqZ+ZzcZyQxdeah6
 /xf+SFPeunptut0en45JyNG0Pb2ABFhFaT8yVJZOsR569v7ucv2uyoqS5
 c1ROXZm061LkEUzWsmnV/03Xz8y+CQCAYSkMYx9eCOmG0EoFRBaLLRlLN
 zPfT45LQlGW0aFZMG2+2j0rGYP5FT/2xZ3AjzafjlhGYGfbfSMEBa2hGf
 9Fkau9TsjlLDSR3w0x4GivIF5/l7PyMcB25AMeab49e0via7VTIgwIcef Q==;
X-CSE-ConnectionGUID: sGSMePXYQICqmZROEkguqQ==
X-CSE-MsgGUID: FnWBEbW0QFCicGabG2Mmfg==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="25458683"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="25458683"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 10:52:40 -0700
X-CSE-ConnectionGUID: dcZXiU6gSGWnEy/Df6LXQw==
X-CSE-MsgGUID: Q5+OmzosSIWXuW/cQigfGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="20734874"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Apr 2024 10:52:40 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 9 Apr 2024 10:52:39 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 9 Apr 2024 10:52:39 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.171)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 9 Apr 2024 10:52:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bebAqS32uO5ZALf0Dah5IUDQtMMo8sOqu78k2goTa3yID0EYWC7/Y8vwgC6Gr3jXrBuYMmVutWQicjbroPNsn5Nym4XoXQDyAwC3wZDygV3ULQiGLAmB0KWQG4EJHosW295+1mDduzfgAWnWBpkIKIVRo7RboXg7+wUixhYGyjqwtYeOorVE3vp7sFFDt+pcXdaQF+vD95wJGKSnN7PPntZ9ClW0JKlTLGXmOmZbotFBNgZ55L2BjWD8abOov2GGRGMQKkiqBz3N1NpNqZ9PJFlhlFk8THQp6dGrUi4ctNzAFGgDYPw1BF6FwWWQwneNn8iXZWGG07argllMUIDE5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5yecrJD34d385r05qld/S6tOfIiufQIuLYIPcClsYdM=;
 b=QAEe7X7hk0lmVyZ7yJ4WjWwAv+7zf7AMvk0ay1DIRmzuTsrrvSMbKbqLs394/+OBGYR38/QkF2rOuycWilFpwzirmD8a3n7a6l+ZidqKCnizoBn+Lo//OkX94jJBVnbs3dtUWpR7ZL2gRW6VGMfEHQgXyLWdSQesGmJ+JTjxioAv9YzQqjSTYERDy3nnciJM0FI2Ml4Pjvf5phQxTWHLGdg98tY1iRGr9GdF9ZWFaju5XTJ+bs6+Pwda+72/8IbE6bIWfZUqU7/+NeQDHlml874yzwyCEoq0rfH0JAePMkC7Hy+f/9KccP9VED2lrtMLLYGoa9LJzZrfET/RiQAo2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA0PR11MB4702.namprd11.prod.outlook.com (2603:10b6:806:92::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.26; Tue, 9 Apr
 2024 17:52:37 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7452.019; Tue, 9 Apr 2024
 17:52:37 +0000
Date: Tue, 9 Apr 2024 12:52:34 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Karthik Poosa <karthik.poosa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v7 3/4] drm/xe/hwmon: Update xe_hwmon_process_reg
Message-ID: <2rghstrxzerqq74k2papk3nwafptzsfzgli7ceyf4shstmejy6@n4efergznjwb>
References: <20240405130127.1392426-1-karthik.poosa@intel.com>
 <20240405130127.1392426-4-karthik.poosa@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240405130127.1392426-4-karthik.poosa@intel.com>
X-ClientProxiedBy: SJ0PR13CA0143.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::28) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA0PR11MB4702:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CQ6mvJmzZagMP9FLbW4/Afh3n0QiZIRtqgIvr4sgXpR6cbHGWGtVWHAuUsIDSKFWJSwbQ+pmFptvb+oDEe816Xd1vHcPfFbJSy0JIIxgbGzIrF2nW9mPtySjz0GAugXfAwhCkXUiEAj/tJ4FV7Z2XDE0CKCyZ9Te8uATkd7ffvG5NHmfyu2gwr6TLekSU7UpMTEVe8vzyvUfQJ8GcYintFsh5PV9fzECB7UbP6yu6LZ8zkIw8AgX76X/PWCtzQcMZqM1UMU2S8Jtwhg1P+obn/xgjPOU1EH7lDKlKyUUXR4q44UmecV5J6Ys9818+ZY+KFJnShwrjkpxZ4noYr86mYoCsQuJXSaQZ1OIXQ1Vpq8xWoi6WgIqh42i7woafP8Ps0UF7J8CEppjBylmY8dxjbEa4vsx5BpDyh+itt37nUnn9BqgqMGFaziq79hrmHl8pdf7REPLeq8vx71XIyEfuzJudJl6Br/aaUaaCK3PsyqszgkMGNBsgYuxeC7efrf4IrK9EGpUS0L+kWdS2uL3wiH4OmY6l7pbstakpBqacbPLvdKm88GX85PNinq3q3E7Dnupnsi5bJrcHZg6o1Ix6gwc09pb4kYUvgXeGSWXT1z4FU7L5Bbs3zEGW9Ua23P4XQt6OL3sdnDgscAqQMXKZUvrevLrYWd6A/A1ZhZCyXk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qkxQ31fvj/oLtvv10ZpmFKsmDY/eEjwLNF8YpMTANBAJ7DterrCBx/wkYizx?=
 =?us-ascii?Q?cNWdE2pVQvkIscuUFd+sgWaYBrKpgIy7Cqe+8ks+4McZ9ILDfaiDS1iTJu//?=
 =?us-ascii?Q?h89qtFMyNCE/cVF5GW4vQAROUmVS1cwyZrugCp5GT4WIQpL+aNxmVc4+XnHv?=
 =?us-ascii?Q?HWs/vuqnVvWS1falZaTvVrVB2YvTFVbfch+lIVDQbnhNT8rOiqS7mORaSRUa?=
 =?us-ascii?Q?Yk423fDX86m5NJzXgRceNKoGgoLcmQubeyMeMZMupX311soE5VTt3IvtOQnj?=
 =?us-ascii?Q?Yz5VY7Oa0MtE9RA2A4k97aNLQM3nxQDSk0ekv1h4qV1K0Y+nJA/rFPbY816s?=
 =?us-ascii?Q?50gk2U2i+lzZbd6V/DJ5ZyVcfbvrwdRWLXlupcpkMdDE1gUIshNWUEUx4Bk1?=
 =?us-ascii?Q?uYzLrd+Dd0PxiOYL2omGvldM/WSEGswMlBh7LecM11koMckWjVqo/LCHeB5K?=
 =?us-ascii?Q?aOwr4XZSNU8Awqybhos3AQEp66bFWhjepiSaKe+KTWoG2wJbZ6/ZEPnIbF6i?=
 =?us-ascii?Q?Ouo4pBDdcoCdDdw9vSdEk/gcYkQHzD/KAv7hD+hwbdzzEbFmk4pSSYoG39O4?=
 =?us-ascii?Q?nEWdV0kZvXBDJ3vQJMFnqy+otndYHj85zVlZqS9A1MwGPQF18TlThDAV0X1C?=
 =?us-ascii?Q?j86AGBe5X3EsocUY/L8RYMvWIQwwbfFM1LsIeEMzD6pW1fI4M0mm8JgqjMyC?=
 =?us-ascii?Q?hWwCcDublTNGflMcm1OlQrovHKsp7z4MPJXy+caD0P6nH304GiyyHTttMguu?=
 =?us-ascii?Q?JipoeTHunZR33XGRxw6lYoFHKBP8p5A0j+XB9J9zYkdF7va4qHlJIUK3gygw?=
 =?us-ascii?Q?pZ6okudEhKoDjxWDKaVAPGdIzqJRgfFdohtxnsba6NSPMKzbgz25kYnnQviW?=
 =?us-ascii?Q?eb7B2PNk/BWLZ9HBhZ0SWe0l+Xt2a4YyzWQhQB7Ob2ulwO5mRsreOIuTGcyu?=
 =?us-ascii?Q?L1XXXGTiO62yxJkNggZUh2LeKEx92PnLpVOyyq/veR8r8SuneYU7G5CbABan?=
 =?us-ascii?Q?0tDiCTsItEeGFP8IxhfWVQFZCUXQYwcMAfxXtr0cUpqneA98GywyCWTmMZWk?=
 =?us-ascii?Q?WOLhOo/yBY0oDw1fk168FzK/iI/hE8QtCxQiE8tQli/jclBUO2xcSxasgQdm?=
 =?us-ascii?Q?JF7A/WTXB37e2adS5IT7rTtTbFHOeCcZe1XSbf9hfX+gzHm+SeF0ngZcCxDx?=
 =?us-ascii?Q?Kba6IZTFMYepvnrPVXm8GU285HAg7vhMK9bVG2EB5k+oIOh4N4stAZTXA4i5?=
 =?us-ascii?Q?opqONHYGnz/a00I+vuZvVBgXMZZ78vT+YBW9GSOlXrkPzN2NXe7s9LYLtCqU?=
 =?us-ascii?Q?/aL3p2I3nTV3iM1n43Q93/PeHkJ5JCLRDW2dDV/gXDKdFiknbIOlMyyx5Gj/?=
 =?us-ascii?Q?wsKUuwAh0nlrfaBXdTvY2CDZLNuK8ym9bRd7AQQWYUBCdKmRRJw8y9wCLsNX?=
 =?us-ascii?Q?KDRVvqC2LqmxCcPsyQYAVHb2tzs+uSP9prVscd9ouEEkg4fZnDgSP/zAtqbq?=
 =?us-ascii?Q?SIR/6CcrThnwq289xOwvWydnpPxu4yCDvCGFvOkv1Vaqie5UIJ2WEt61Dgeh?=
 =?us-ascii?Q?Y1y9REE01NbQ0Xv+DKzSRrxOWXf/AVDaXpMHv5C5XIFK5CmWfMkHto1IcJl+?=
 =?us-ascii?Q?Ww=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fd8035ef-4297-42d2-8195-08dc58bdd7b9
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2024 17:52:37.3429 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wv24mmJx7HEdmpDsYOlAUhO+2wMiQTPZ0fdUve3uRuXQCftNAMbxS5XYRZq5jySbLWrcJxVpKWkeb26lCmyKcdt7lT34OWkSNxPl3wr2VIg=
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

On Fri, Apr 05, 2024 at 06:31:26PM +0530, Karthik Poosa wrote:
>Return u64 from xe_hwmon_process_reg, instead of a void return.
>u64* input pointer not needed with this change.
>
>With this caller can directly assign return value to a variable without
>need of explicit initialization and pass by reference.
>
>v2:
> - Fix checkpatch warnings.
>
>v3:
> - Rebase
> - Removed unncessary break statements.
>
>Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
>Suggested-by: Lucas De Marchi <lucas.demarchi@intel.com>
>Cc: Badal Nilawar <badal.nilawar@intel.com>

Applied the other patches.  This one I'm putting on hold to think about.

I'm not sure the approach in that hwmon in general is good with the
xe_hwmon_get_reg() + xe_hwmon_process_reg(). It seems it's even taking
some pm refs when it doesn't need (to decide if attribute is visible).

Lucas De Marchi
