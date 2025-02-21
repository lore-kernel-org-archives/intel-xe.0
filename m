Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF4F6C021AA
	for <intel-xe@archiver.kernel.org>; Fri, 21 Feb 2025 06:27:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A358B10EA23;
	Fri, 21 Feb 2025 06:27:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BNjiDf0r";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B56210EA23
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Feb 2025 06:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740119239; x=1771655239;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=+Xni7rFu9NQlGnoAQrx3yOzDA6W+2ENgpg+bz8Cncw0=;
 b=BNjiDf0rVOQwmfR7xl1QT4QKTJ0Sfv+O/cjFHTOzjv/fz4ovJ48yaXKf
 b0Q0V4xERQE7mVDy6hTkejEP+r4lcp+f8KLlrldV/QqLODxEaXacGTtt6
 4gjlCiRghDQhcDME4f4eG5afeWA9iD9Mf7ZN9NvYwyHzwfWKW6m6WaGfi
 3Sn5jL3aNMbAtg/VHTQoylG9f2My/65QE/9+6M1SRgLAs/j1dbXtgcxND
 OWBZ2taGQl8iRTyCP1sAAFhnCd72I1Hcdh/6luxnIXzM/arCiUqXW13aL
 gThkT2KA+n2H34NaY1a1hbx4sqNTXPD9MBfRVE27fEiL2El/iadYMJFRL g==;
X-CSE-ConnectionGUID: TRK35alJTEKHlXIRAdGTzA==
X-CSE-MsgGUID: 02p//+VzTsKLv5ig/AYtMA==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="40155357"
X-IronPort-AV: E=Sophos;i="6.13,303,1732608000"; d="scan'208";a="40155357"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 22:27:17 -0800
X-CSE-ConnectionGUID: SzIHaPvbTkmP+tpiDcaj6A==
X-CSE-MsgGUID: Idx/hPbYS/O5nZYX9X5qpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,303,1732608000"; d="scan'208";a="138499522"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Feb 2025 22:27:16 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 20 Feb 2025 22:27:16 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 20 Feb 2025 22:27:16 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 20 Feb 2025 22:27:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GCcrRGJL0YAgSeQxLlcnP8gff5L0vElhFXHznIqWH3trcIaszh1E6RyS9PL8zkUw56MjChu0eI/rUuJ2Z2tuIzCRVkUhaYTDe+qMuA3arSl9MsNm3q3c4akI6fwgOj8KGTXcgBjqa7EOQG3UZOGY4jNGWicQTm8jgWy9EYDKwH8KeH809/HfQ/Ht2/itiPqBfLw7ciQfrgFU7pw8UcqSOgZxwUC+fmSocTzeW0uZRQYPqDp1pfjfEXzUMWyjm7Oz/003qKaeRu0YY/ySZAvve9JNTHdqbM4H1BbQ1OsCvrExy5sJYqWkbZgqNdE1l6qSGO04VUBXgNeETRn+gAZZYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Bzw5d8j6sVHPlIPb6U8DFDNvqghlT/3A+mYp5Ti570=;
 b=Z3L2qXpbGwezLA/A2ZRcN1OQJqnhbtO1by4lAQo4UoOpDbRKJgTEeYc5I2luLfYkEwGP+2nU0AzgiI9CEBFreO2RSH6w+Ixua+Fv2BKtsFLkb0KgOBV4BbfP6A4bGGwwIcM1lfed4mr/mHPCN6+1IkFxockHap4XZEqBsKU962ZkA6pxcyDIGyXToEy5mOpyC8P4k1hIGNgZm2Tlt+1BeePoCRbJld9LS9ptaU6qwpK+MQ0FIWcWVcP1xvG2ljJ1OdoXGMftoLK65g1eT/+eiCOgb5OdxPnb5FY4bgvE401Cu9rRwKqIf552sbpJPj5mqffQQCD9nuX6EBkNG8mNvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH0PR11MB7659.namprd11.prod.outlook.com (2603:10b6:510:28e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.15; Fri, 21 Feb
 2025 06:26:59 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%3]) with mapi id 15.20.8466.013; Fri, 21 Feb 2025
 06:26:59 +0000
Date: Fri, 21 Feb 2025 00:26:56 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: Riana Tauro <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>,
 <anshuman.gupta@intel.com>, <vinay.belgaumkar@intel.com>,
 <soham.purkait@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, "Himal
 Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH v7 5/5] drm/xe/xe_pmu: Acquire forcewake on event init
 for engine events
Message-ID: <3isbafrfmgy7bi2vqjq4ixecuhugqk7o7tzdlsib3wx5wtfku4@g34iofqphcxs>
References: <20250214100819.798544-1-riana.tauro@intel.com>
 <20250214100819.798544-6-riana.tauro@intel.com>
 <tkee4kttili63cqcpreoc6wqz3r6depkmixt34ctilypa5rb46@ddqsv44zsvi3>
 <Z7fTX2X1qrdcv0fb@orsosgc001>
 <bsmgo4sti6ue46ocarjt3qltjke64ln4gf3vol2novnbw57goo@iihu3gswpjnx>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <bsmgo4sti6ue46ocarjt3qltjke64ln4gf3vol2novnbw57goo@iihu3gswpjnx>
X-ClientProxiedBy: MW4PR04CA0155.namprd04.prod.outlook.com
 (2603:10b6:303:85::10) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH0PR11MB7659:EE_
X-MS-Office365-Filtering-Correlation-Id: daf41aa1-2dd3-41d3-b3a5-08dd5240bf2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xLP80k6lT8xjQrc9WwO1Y4O4qqdPROGyzBSXTwmkAkIAgX5QIZ5QuNXiRzgu?=
 =?us-ascii?Q?b1wFe9uFBf1O7f2eAAYn5wFz43LDzv3vtHs1ND+CC1DXAyY/1XxX8VUDms+l?=
 =?us-ascii?Q?KjaI2pc06WjeWafJXlciKlP3hNawlkeMusxKgTRyKxemONjVlERt8N9+u+0y?=
 =?us-ascii?Q?ke2Nhiiz8zLFrfJM3Tlrmh5IMC8200OKBlgSWVYqZu3wtL/TApjGLORpW78j?=
 =?us-ascii?Q?EHa956KNTCEynNkyUbEldhrTTvh2f26/LI52REJ+hVkzEY1npl58/avJqyvp?=
 =?us-ascii?Q?Gp9g8/edLCIRkzZ+3cgNQMz8DarWkFJ1uEN7erXjmaNfCod+B/I6ZDYAmbik?=
 =?us-ascii?Q?WlMrwtOg8YhtKbtvaBIPZhnDMIcd4P+B0TdBdUdHeMSRwkjV9us88DDubad3?=
 =?us-ascii?Q?JX+814aCUZIaZz1bZTo2c0YvW/aXpMbUrBMpwxfjnVIppkaYeVooh63tyE7U?=
 =?us-ascii?Q?qJr7GHBZ1Uy8SjNLgGXlD0EJ4FJe4pZphlBbPl8gt7Xn06XUTBZyHx8hY5IU?=
 =?us-ascii?Q?DoRvP3AgoK8NSg371oVYx+HOpO+4+QSJIH4rJ05xEqN/HEnXztAWPsDIdvyo?=
 =?us-ascii?Q?twi+yMg0UrJCcEEPWSdwVl1wTMo6Ffjmcbo8ArQEcuxGXTXRmQBatkMZGxof?=
 =?us-ascii?Q?nq5/ZEIdQG0QltIzlXLxVqUSq4tifuebd4P3JiAj8muykVXovRB4pT05Jir5?=
 =?us-ascii?Q?dPR0YeJb6OxXASpaCgTznPNqrACKpc0loL9JUVCiMMZEGidPdgocgt+PZU75?=
 =?us-ascii?Q?W8FFK4q+mAppc46oGr7pMC2tqa3ySwGqrKWErXYohLS25PK/Z1ft0tNWjtFT?=
 =?us-ascii?Q?ERnixeYmLwcDzpJlFeMlHIwbPMgo/nIi3rTZL4+C/aTv43AixClLOwTAzfVL?=
 =?us-ascii?Q?Ypo/lL7UiITd7B/4/GD0n5WjnrHYPEDC/9vtdaOnV2zCBUQg92gaNkCCnq9V?=
 =?us-ascii?Q?RVSEsSEzywxG+PJfV+pB6MvU2DEWfWs4aroyFgL8YbtnyrgastbUOE5ytt7N?=
 =?us-ascii?Q?AEukRtKRcLmt/NI3N4O9RcseyJ/B2oFLMBBoIEDJFfMLDxSXJGkLF0OF+Kaq?=
 =?us-ascii?Q?AJKigsvRCpS+lJO/lQmnx3O2/191y/7SCDXYfu6vFUmLIbqRynFiyweDIRsR?=
 =?us-ascii?Q?4PAWq3XKnSqNBk2Qyvun3JZhJO5t7wv+P6xM1qPliPUoJFpMAL+UN2c0VhlB?=
 =?us-ascii?Q?9zEEdT43QmNZsQuvNaviNzRmeckkImvUES0w4hwNBEXQ0srrGoESCjtwQCe6?=
 =?us-ascii?Q?akpSz3Qp9V2DppUOE79UsEeFYRs3banniTCFVYhqCODY12V0i4tzMQ5PCPuq?=
 =?us-ascii?Q?osYj1OfUf96nE8WhX6NmeXBZ7vS/CvY6+xAnN6/QbSp937dBmHVgqTB2G1ES?=
 =?us-ascii?Q?dTelaGOC0zl0ub6IloLNZKRUPVoL?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UvriNG6QB4Vr+kbc+BoGN76GqnbGTSgVoJs+vbESU1V7gLZ61SHt/LlUAR4f?=
 =?us-ascii?Q?NnsP6RnzONSa6j/bdXOmN3C37PY+LkPC7Kgcsljv8tgmjgKxZJ99op3RtiaZ?=
 =?us-ascii?Q?SaDdXF0V4UZfv1dFR1fZtKc9GA7jamyFLeVKK4erEvThI8166jWyQXIz2A7Y?=
 =?us-ascii?Q?g6EU/uF5thhEIuK4l5kCpqBb79mDVcGSEexf1d7lZyfRBSr/bQwjI44rPCWz?=
 =?us-ascii?Q?x+lciW206rLZXiJKNB0r+jX9wlQVHkjIeC928H6d4bL0UqeBss5pk1oe3K/c?=
 =?us-ascii?Q?0vlgbuBx8JN+d8zk36SBHMDiUsSdQoQwvwT/v/qQEXlXuhDdQ/vboQ48ESN8?=
 =?us-ascii?Q?IR/TLKl7P05S6YTeD43FPvYnBkWkRU4v4A6hEYQVVoujbECZaMI/KqE3FPt3?=
 =?us-ascii?Q?1UXfltyVNM+d/Cq5JBiKMg8IML81JKIxLc9e1lHm+eOo2uq2tGgw6e1tmS1X?=
 =?us-ascii?Q?wzj8tDbLk0aJstXL0L1nOrL2MyUOdCg005FMXqu/bEODTvUpImhJPhJMw/iV?=
 =?us-ascii?Q?9qq1Fj/06/RAbn1SNFcabqadYXIpo7WFWDqTGqHLcyFBmgmrv6g3sKxW9WZt?=
 =?us-ascii?Q?bdL85LJeAy/59wtqtCpJ9gsVwoL9VkG+g0S+HZmSrg63R8k06XcJgbosoyfK?=
 =?us-ascii?Q?DWOlIBcWLunJ7Iilhfk0lWX4kO9eIBA6QdTYUf6T+v5ye2UjYidubKik5PJ6?=
 =?us-ascii?Q?dHiXVhX9sDm3ioQm3MF0G2+dxtdaXuwIpH3lCuRkUYFKH78E/IP3yORbcuhV?=
 =?us-ascii?Q?vwEi3+3O1ndKT+/hrXc0p6nwk37+kxYrfg8FpfpXpUUk5IaVrmZKzAVBVhf3?=
 =?us-ascii?Q?xR4PAYET08izMq0MLRrgNerO45ylez4Ceuust4udIVFxHGZ9Y+vfq/Hfg7qf?=
 =?us-ascii?Q?i8jCXNioGAmFyRPhkCRKK7KGQCSJg+PHsE12g+ATLmlaSKm7TuZoX4fS4whx?=
 =?us-ascii?Q?ZliyhMad0AJ3eVBUq8XR9XRL9zuYyNr6+MIJVB84MLF5+lsqoe7LycrH3HPz?=
 =?us-ascii?Q?Bm1UvK33a3hQ0D/Qy5AuMAYUPUO/nMvF3yLBlgQ2663/x20f01HdjibjP2qs?=
 =?us-ascii?Q?8kfH2ihuR65dlo/XAoZLYYod4+5xWDgbVl4oS/KUsS9yHpus/LNixSoAx2Sf?=
 =?us-ascii?Q?FxQ/neJUZ7QObiLSy8GVzehtyfo+d9wWJ43NV1igxF2NtP7H2ogOih4P76/t?=
 =?us-ascii?Q?MaPRT9ZccytSlRE4HMhQ1hrFFRJSI3nqWm4EC8ESBYIcXxi+YyJdkk+2GT6t?=
 =?us-ascii?Q?fBBaWlTrSBcztPliJ2gs3R0NUO/edoU92VmdIOZEfiws6+/LM4FaakNiCMdy?=
 =?us-ascii?Q?wYAoARQsveQaTs12ItqcDTIRgWjW6yO9KakU7z4WzhoypPie0AsnIGvAwQxL?=
 =?us-ascii?Q?iZHu7TfbTxQ4emMm0HK9+dfkwbzSioZC+qWqsDDVvCYGleebDDQO6LHQIr76?=
 =?us-ascii?Q?cGbf5QsLHYyTaGIy4gsNSnpMHw4ZyPqP7ey8X0PjZD6UUglRVuWp9jaCBrYU?=
 =?us-ascii?Q?WbMhChIiXUhq3jT69EbglFFW5amiuHVnsFg5OpQkLNLvd+YiI4OvW7+CTqdX?=
 =?us-ascii?Q?DKCcUF7MNShlgONfuCCgBLfDZYubDB7y+L/aRYbAO8DZYg9Pb5MR8QC11sZw?=
 =?us-ascii?Q?pA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: daf41aa1-2dd3-41d3-b3a5-08dd5240bf2f
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2025 06:26:59.7421 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 84vU9OKOQGZmUnqVoJMegEtwsx4S8K7ozwlxyvDfYEUSWhVlf+c6isi/UfArZef653ZUkBfvvWRxXPyH7y4zfVcALOexO3oUGj8W7FlEKG8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7659
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

On Thu, Feb 20, 2025 at 10:45:46PM -0600, Lucas De Marchi wrote:
>On Thu, Feb 20, 2025 at 05:14:07PM -0800, Umesh Nerlige Ramappa wrote:
>>On Thu, Feb 20, 2025 at 03:46:55PM -0600, Lucas De Marchi wrote:
>>>On Fri, Feb 14, 2025 at 03:38:13PM +0530, Riana Tauro wrote:
>>>>When the engine events are created, acquire GT forcewake to read gpm
>>>>timestamp required for the events and release on event destroy. This
>>>>cannot be done during read due to the raw spinlock held my pmu.
>>>>
>>>>v2: remove forcewake counting (Umesh)
>>>>v3: remove extra space (Umesh)
>>>>
>>>>Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>>>Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>>>>Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>>>>Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>>>>---
>>>>drivers/gpu/drm/xe/xe_pmu.c       | 52 +++++++++++++++++++++++++++++--
>>>>drivers/gpu/drm/xe/xe_pmu_types.h |  4 +++
>>>>2 files changed, 54 insertions(+), 2 deletions(-)
>>>>
>>>>diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
>>>>index dc89fa6d0ec5..67693d642f5a 100644
>>>>--- a/drivers/gpu/drm/xe/xe_pmu.c
>>>>+++ b/drivers/gpu/drm/xe/xe_pmu.c
>>>>@@ -7,6 +7,7 @@
>>>>#include <linux/device.h>
>>>>
>>>>#include "xe_device.h"
>>>>+#include "xe_force_wake.h"
>>>>#include "xe_gt_idle.h"
>>>>#include "xe_guc_engine_activity.h"
>>>>#include "xe_hw_engine.h"
>>>>@@ -102,6 +103,37 @@ static struct xe_hw_engine *event_to_hwe(struct perf_event *event)
>>>>	return hwe;
>>>>}
>>>>
>>>>+static bool is_engine_event(u64 config)
>>>>+{
>>>>+	unsigned int event_id = config_to_event_id(config);
>>>>+
>>>>+	return (event_id == XE_PMU_EVENT_ENGINE_TOTAL_TICKS ||
>>>>+		event_id == XE_PMU_EVENT_ENGINE_ACTIVE_TICKS);
>>>>+}
>>>>+
>>>>+static bool event_gt_forcewake(struct perf_event *event)
>>>>+{
>>>>+	struct xe_device *xe = container_of(event->pmu, typeof(*xe), pmu.base);
>>>>+	u64 config = event->attr.config;
>>>>+	struct xe_pmu *pmu = &xe->pmu;
>>>>+	struct xe_gt *gt;
>>>>+	unsigned int fw_ref;
>>>>+
>>>>+	if (!is_engine_event(config))
>>>>+		return true;
>>>>+
>>>>+	gt = xe_device_get_gt(xe, config_to_gt_id(config));
>>>>+
>>>>+	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>>>>+	if (!fw_ref)
>>>>+		return false;
>>>>+
>>>>+	if (!pmu->fw_ref)
>>>>+		pmu->fw_ref = fw_ref;
>>>
>>>how this shared fw_ref is supposed to work for multiple
>>>perf_event_open()?
>>
>>Agree, not ideal, but I don't see an issue. This forcewake is only 
>>being taken for engine-* events and the domain is always XE_FW_GT. 
>>Looking at xe_force_wake_get(), I see that it returns a mask of 
>>domains enabled. In this case, it would be the XE_FW_GT. The return 
>>value is just stored so that the corresponding event destroy can put 
>>the forcewake.
>>
>>>
>>>fd1 = perf_event_open( ... gt=0 ...);
>>>
>>>	event_get_forcewake()
>>>		pmu->fw_ref = xe_force_wake_get()
>>>
>>>fd2 = perf_event_open( ... gt=1 ...);
>>>
>>>	event_get_forcewake()
>>>		// get the forcewake, but don't save the ref
>>>
>>>forcewake for gt1 is never put.
>>
>>pmu->fw_ref should be identical for all events taking this forcewake.
>>
>>>
>>>
>>>Or even multiple perf_event_open() for the same gt: we will not handle
>>>the count correctly.
>>
>>The count is actually handled in domain->ref in the forcewake 
>>implementation and note that forcewake is always taken for every 
>>engine event that is being initialized and hence always being put 
>>for every event that is destroyed. This code is not refcounting 
>>that.
>
>so... we never set pmu->fw_ref back to 0 and any event destroy will try to
>put the force wake? That seems a different bug that avoids the bug I
>was thinking about.

try calling perf stat multiple times and you end up with this:

cat  /sys/kernel/debug/dri/0/info | grep "force wake"
gt0 force wake -1
gt1 force wake 0
cat  /sys/kernel/debug/dri/0/info | grep "force wake"
gt0 force wake -2
gt1 force wake 0

and

[ 1614.778054] RIP: 0010:xe_force_wake_put+0xab6/0x1430 [xe]
[ 1614.778370] Code: ff 41 53 8b 85 f8 fe ff ff 50 ff b5 f0 fe ff ff 44 8b 8d e8 fe ff ff 4c 8b 85 d8 fe ff ff 48 8b 95 d0 fe ff ff e8 4a c3 27 df <0f> 0b 4c 89 e2 48 83 c4 60 48 b8 00 00 00 00 00 fc ff df 48 c1
  ea
[ 1614.778381] RSP: 0018:ffff88812cb2f7d0 EFLAGS: 00010046
[ 1614.778395] RAX: 0000000000000000 RBX: ffff888138b000d0 RCX: 0000000000000000
[ 1614.778405] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
[ 1614.778413] RBP: ffff88812cb2f968 R08: 0000000000000000 R09: 0000000000000000
[ 1614.778421] R10: 0000000000000000 R11: 0000000000000000 R12: ffff888138b000e4
[ 1614.778429] R13: 0000000000000001 R14: ffff888138b000d0 R15: 00000000ffffffff
[ 1614.778438] FS:  00007a9b757acd40(0000) GS:ffff8883f0e00000(0000) knlGS:0000000000000000
[ 1614.778447] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 1614.778456] CR2: 00007fcac269d5e0 CR3: 000000012a8ee003 CR4: 0000000000f72ef0
[ 1614.778464] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[ 1614.778472] DR3: 0000000000000000 DR6: 00000000ffff07f0 DR7: 0000000000000400
[ 1614.778480] PKRU: 55555554
[ 1614.778488] Call Trace:
[ 1614.778496]  <TASK>
[ 1614.778506]  ? show_regs+0x6c/0x80
[ 1614.778528]  ? __warn+0xd2/0x2e0
[ 1614.778545]  ? xe_force_wake_put+0xab6/0x1430 [xe]
[ 1614.778867]  ? report_bug+0x282/0x2f0
[ 1614.778892]  ? handle_bug+0x6e/0xc0
[ 1614.778906]  ? exc_invalid_op+0x18/0x50
[ 1614.778919]  ? asm_exc_invalid_op+0x1b/0x20
[ 1614.778953]  ? xe_force_wake_put+0xab6/0x1430 [xe]
[ 1614.779318]  ? __pfx_xe_force_wake_put+0x10/0x10 [xe]
[ 1614.779650]  xe_pmu_event_destroy+0x143/0x240 [xe]


>
>>
>>>
>>>In summary I think this fw ref needs to be per event... an easy way to do
>>>that is to use the event->pmu_private field, to be populated on init...
>>
>>I am not opposed to that since that makes it future proof so that we 
>>can indeed have events taking different forcewake domains, but let 
>>me know if I missed something here since I think this alone should 
>>still work.
>>
>>>
>>>>+
>>>>+	return true;
>>>>+}
>>>>+
>>>>static bool event_supported(struct xe_pmu *pmu, unsigned int gt,
>>>>			    unsigned int id)
>>>>{
>>>>@@ -144,6 +176,13 @@ static bool event_param_valid(struct perf_event *event)
>>>>static void xe_pmu_event_destroy(struct perf_event *event)
>>>>{
>>>>	struct xe_device *xe = container_of(event->pmu, typeof(*xe), pmu.base);
>>>>+	struct xe_pmu *pmu = &xe->pmu;
>>>>+	struct xe_gt *gt;
>>>>+
>>>>+	if (pmu->fw_ref) {
>>>>+		gt = xe_device_get_gt(xe, config_to_gt_id(event->attr.config));
>>>>+		xe_force_wake_put(gt_to_fw(gt), pmu->fw_ref);
>>>>+	}
>>>>
>>>>	drm_WARN_ON(&xe->drm, event->parent);
>>>>	xe_pm_runtime_put(xe);
>>>>@@ -183,18 +222,27 @@ static int xe_pmu_event_init(struct perf_event *event)
>>>>	if (!event->parent) {
>>>>		drm_dev_get(&xe->drm);
>>>>		xe_pm_runtime_get(xe);
>>>>+		if (!event_gt_forcewake(event)) {
>>>
>>>if you group an engine vs non-engine counter, this won't work I think.
>>>Can we test it?
>>
>>When you group events, init is called for each event. From the Xe 
>>PMU implementation perspective, grouping shouldn't be any different.
>
>the event->parent is a shortcut to do this only once per group, but then you
>can't look inside the event to decide if you need to take the forcewake or
>not because it may be true for one event and false for another. Try
>creating the events with the group leader being a non-engine event.
>AFAICS the forcewake will not be taken.... something like (typed here
>without testing):
>
>perf stat  -I1000 -e '{xe_0000_00_02.0/gt-c6-residency/,xe_0000_00_02.0/engine-active-ticks/}'

it seems like I mixed up here. Neither of these will have parent
set - afaics that would be the case for events inherited from one task
to another which is not the case here.

Lucas De Marchi

>
>Lucas De Marchi
>
>>
>>Regards,
>>Umesh
>>
>>>
>>>Lucas De Marchi
>>>
>>>>+			xe_pm_runtime_put(xe);
>>>>+			drm_dev_put(&xe->drm);
>>>>+			return -EINVAL;
>>>>+		}
>>>>		event->destroy = xe_pmu_event_destroy;
>>>>	}
>>>>
>>>>	return 0;
>>>>}
>>>>
>>>>-static u64 read_engine_events(struct xe_gt *gt, struct perf_event *event)
>>>>+static u64 read_engine_events(struct xe_gt *gt, struct perf_event *event, u64 prev)
>>>>{
>>>>	struct xe_device *xe = gt_to_xe(gt);
>>>>+	struct xe_pmu *pmu = &xe->pmu;
>>>>	struct xe_hw_engine *hwe;
>>>>	u64 val = 0;
>>>>
>>>>+	if (!pmu->fw_ref)
>>>>+		return prev;
>>>>+
>>>>	hwe = event_to_hwe(event);
>>>>	if (!hwe)
>>>>		drm_warn(&xe->drm, "unknown engine\n");
>>>>@@ -218,7 +266,7 @@ static u64 __xe_pmu_event_read(struct perf_event *event, u64 prev)
>>>>		return xe_gt_idle_residency_msec(&gt->gtidle);
>>>>	case XE_PMU_EVENT_ENGINE_ACTIVE_TICKS:
>>>>	case XE_PMU_EVENT_ENGINE_TOTAL_TICKS:
>>>>-		return read_engine_events(gt, event);
>>>>+		return read_engine_events(gt, event, prev);
>>>>	}
>>>>
>>>>	return 0;
>>>>diff --git a/drivers/gpu/drm/xe/xe_pmu_types.h b/drivers/gpu/drm/xe/xe_pmu_types.h
>>>>index f5ba4d56622c..07c4e592106e 100644
>>>>--- a/drivers/gpu/drm/xe/xe_pmu_types.h
>>>>+++ b/drivers/gpu/drm/xe/xe_pmu_types.h
>>>>@@ -30,6 +30,10 @@ struct xe_pmu {
>>>>	 * @name: Name as registered with perf core.
>>>>	 */
>>>>	const char *name;
>>>>+	/**
>>>>+	 * @fw_ref: force_wake ref
>>>>+	 */
>>>>+	unsigned int fw_ref;
>>>>	/**
>>>>	 * @supported_events: Bitmap of supported events, indexed by event id
>>>>	 */
>>>>-- 
>>>>2.47.1
>>>>
