Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EE3EC5478C
	for <intel-xe@archiver.kernel.org>; Thu, 22 Feb 2024 19:35:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2705C10EA50;
	Thu, 22 Feb 2024 19:35:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Rh6ukmdp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7770A10EA4C
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Feb 2024 19:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708630553; x=1740166553;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=9MaiEiYCj9KJZvGm/XdXbpdbrSeNw6GZzy0y+6uCjVQ=;
 b=Rh6ukmdpyC0TqLK9uZNsNwn0WKbIHuo1mNDGG93PW3dXCxBfbS5kKRjo
 LTF5WHAmMh6POVyDKTxqLcTPQpET/VyTx57EDRE1Zda7j9Ykdk3gkqWKX
 5Z9zPrhWQqNUApTTkOsKUVUnVu5WUSWrM08wVz8bPcRJlHj8Zt6IMNBvV
 lEeu8UxD39Mn6oJlFXvkT5nqnxdeGHQBfIXLOm8wmpSUTC2QQ7pknjLpt
 qWSCQJOwkorsXakKLTvBPUN5KiMlXCICdZjzk+sBn0B4GRuaz/GnPTSIj
 EPOBx40vJQpt91UUjV1XICVXLbG0JzVEj/GONmq8xumvC6EvSq0dCANP7 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="3039599"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="3039599"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2024 11:35:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="913576399"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; d="scan'208";a="913576399"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Feb 2024 11:35:51 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 22 Feb 2024 11:35:51 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 22 Feb 2024 11:35:50 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 22 Feb 2024 11:35:50 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 22 Feb 2024 11:35:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nZ37EPzzNdD1L0zVeKvwNQUJS2RDNav9u3uKC/x2lLgN4uI2YDXVZX0R6FFb988qn1cvPDv7Rx8GOmpi0t4TD5Q1gTehMiU5jw/LIHST8tM2kcsAT2DH6oJd09DcHOEZGgRYq0maj2ojjSfbve2EZzpYUZI21eUIG/gvDZWY3jp7yGPGy0tasUsqt+3va+MSacUVSaovpIMAllLQd5YE2xYLLpAFr+iEaJlejjDJ040Cyk9cFpuaL6+7SI/6yc8EaBuE55LCaJkdCAwQDmtRI5HtMCooH76VgLra9/NAzvhlCwpsQT2dzJBeAO/yS3hLLay3PKSabPduGatDBSosLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yv5W0u5vt+TQzLZX1DYJk4e6/UXSKyxU8pu4/J0kQEs=;
 b=W2YLZ/EpnLdcsJBOfcqzX9FESRWpKa1RmQXx6hNcjsiTu1a+4n+TgCVEhG+JGt32PuKzHOgWPM9YmOKMPh7CAOUZM18cueJo763IONZKDAmXmtPHdYxE44EKvHUF9gFPzwgM7EDxl5vFYOsCcsjsU76h+y4jRQacJAc2bWprcLTeeQJzzOY+hD1CV5P191kqBfX4IxwJD/yO4WGU5wga3peH080IIq8xCHjxf8qMuJO02/N/jeADiFUSn7dlnCmThWDt/u4U6KQTEvw71d2TxQNrAsx2bY/PfResph2MkGJPNt22wILyBQAvdGH0KGWNib9L/9mTQbzunJQrm2GVpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by MN0PR11MB6277.namprd11.prod.outlook.com (2603:10b6:208:3c3::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.21; Thu, 22 Feb
 2024 19:35:48 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::6c14:55af:8583:6ba7]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::6c14:55af:8583:6ba7%7]) with mapi id 15.20.7339.009; Thu, 22 Feb 2024
 19:35:48 +0000
Date: Thu, 22 Feb 2024 13:35:45 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 John Harrison <John.C.Harrison@intel.com>
Subject: Re: [PATCH xe-for-CI 0/2] Update PVC GuC FW
Message-ID: <kugaafjv2aufzn5vabk2bnnyrqfnus5o7zw43x5ajck45vtqkw@aox65fnllsms>
References: <20240222190606.724747-1-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240222190606.724747-1-daniele.ceraolospurio@intel.com>
X-ClientProxiedBy: SJ0PR03CA0188.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::13) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|MN0PR11MB6277:EE_
X-MS-Office365-Filtering-Correlation-Id: 2003d974-18ee-483e-96df-08dc33dd7868
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YNtt70v2PcMjUr306IsUD//ndDg0+czWFykA2fseH0BtmwhPSBzorGEPfdrMI2JUs+o+D/AmR5aC0ReZTHy6LsrMvtCHCJWkT//jgKQLmih8hyp8bQqQ0XP/juRooh75Mv/3ekAwSSOLDw2F0GO9NmuOXEEJR0ls5i/JnpTGrf9b92y92zT9JMcdBcgtow8raEwzuP4vqemQRQLIMM4ZQVebl44o2rBFT3ARf0Caz7hCPXtibjLmTT96N5vAtZCmarG3SlEzpTN/CQio7LjWqvh0JblwMEQdAfUJvQ6PsssWalLGYV1pDhQyZrEVUvi4/6nJ6rrYPwOiLWNjgIHBSSxs98+Ehf6hKBtVEP3L6oKZy9pTw9vPBgvEsoh7AiWEZ6yCy7bBzPkBQeL8SRmdm7wgdmWQ6pnlhkUzgFS5f2B5Wr0h+ZXsX9HZNVqERRJ/uYYOFwtcGHrK4ppKuwBdXFroxsEQIuVLeA22blzx6Ea7cwG6yy1AOw2qr9NvTLal9U173dbBZODqXjBuU28v6jpL58ft70v1WfkP2clzitw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hHXDjPa+r+TzTdySlIJlw8qspZvCwqVdNOQOHo9ikqC0ZEZVznoDHqhlovvJ?=
 =?us-ascii?Q?d58wII4H/ZSUX2Aab+S0zgcFAX9iNnR/imIl8GoM8bizZYiXUltvgDAI074I?=
 =?us-ascii?Q?MiZnxtgV4Y5x62SBBbKYeVeNKBcJB4bX7PE2RiZn6N1MU13lNZseV5jNk0wn?=
 =?us-ascii?Q?NspdL3bLzJDpl00ZZYeNcXT66N0cdeO2bILO1lnn64zwYUkIe4t7L/3Jud3w?=
 =?us-ascii?Q?MknZme/NlyYDPuY7CYGFwFofVbC13NRDpBNe4PtrhvsYjtB54AmwVpml7wpr?=
 =?us-ascii?Q?eDQNBVFnd/gXbvxs2pfLv/lcHEgbO/XYSS4j2OrPZxADZ7+SZE3V8QbO9i9v?=
 =?us-ascii?Q?WLvT+w9P7IEjUdIhzcNv985RHcj9s6A3JaM5o5eUjSu1H9eizyQhRf5dWmqE?=
 =?us-ascii?Q?Cfy+L8HKnTWJYTAOrEewRcyePMzOa9oUOEkYsI+jZCnoNYJhilLnuRd+uvKy?=
 =?us-ascii?Q?Ytgv9TXhNNM/CurUbr2NRZ7CycD4gJ6aeM3kZYRu0/k/UDq1JVIPPYxkI2wD?=
 =?us-ascii?Q?+ACn2Dy7q4McYwx92GpyzqXsrmm3VLuoj++MVmhtg+V6VPkN+EgN2TOdZf20?=
 =?us-ascii?Q?icCCzPcSgHFMA06AO9AqqdBs85IVi6FTjci2MsnfuuuuUEYMDQsFiDPNdoHz?=
 =?us-ascii?Q?cF90To+nXoQIFkg76KFdnS7MckopIMT+ffb2XRJLe0krGxtnZMdIT3f74TeL?=
 =?us-ascii?Q?lmF/Srbg1uPj/+BE+xYSO5AcyiWUYKnzSqvAwngArN7tJbdbeZvgUYAlp9tB?=
 =?us-ascii?Q?/kO4/H2GJtNwv67zvcMbBWN2wD0hjSwuvVbTBKZwdPR8ipkBvAhjZSfX6p44?=
 =?us-ascii?Q?JupL1A1AHa2AgtNQkX6xLTxZIh163LcCIU05ohUb+VMKF0EEDd6R3OiPomRc?=
 =?us-ascii?Q?I6pSmHzTtYDAWOi+6/4eifbL8sdSq7pt+UjaKbtIPMVP30J4evY/NCkxQHaQ?=
 =?us-ascii?Q?866JQMC/trVUHovkNhL151CMlmfzXWNBxMexO0weocHhiPItkguNeL+2OpFf?=
 =?us-ascii?Q?Gfx0EOB7Kmu8yzrDLWEiCVWpBrbK3CEcSo1b6g48nDuRuIu2DgprNWM5hI98?=
 =?us-ascii?Q?Ufj/LlXQlK5J6Gy3rAjcY5vLvdaD63tJGJ2wNg7wCKNgjvwz0VCjoGgm6jb+?=
 =?us-ascii?Q?NFehLl2q5sZX/vKIH4aRRqTYtNK4i3rEB6NDu8yJzC1pMdNl0PNmxlWUcA1U?=
 =?us-ascii?Q?1D1DADqvHr5ApquoSNTm47TGrvrfjGB2Hf0VXLa5PoPfB1eNhRxas9vwjAj/?=
 =?us-ascii?Q?W1xDPxLV+YDMjU0So+9+T3rFFN9KdQWZV6FFoKtBidlArjuP0kCz4+2YZerX?=
 =?us-ascii?Q?2H+NeVvJf6MLBfKkP5R6bdWueAbzs/TdyNR1H9QBhHtSMg4HmSuOdh7fNmUJ?=
 =?us-ascii?Q?mmA4t63xK5VB/OHDDhwxNbuu+Bt57h4yG94C78QdvlAaU/42vtbi90OHilnC?=
 =?us-ascii?Q?L1uQeztPx/uQCii9d/HKcJDNmeNqWOAbYxhWG1bWtA/Lfzo/hMZQPLPVyjxa?=
 =?us-ascii?Q?UdGtFpq1/PFgHvxGRY8EZGUucyF9ddikCtfjPLilodFOPGdQKgJHdy6qIvwF?=
 =?us-ascii?Q?Q/vv68lHPa/fk2c5PJMs0+QZmZd33Zfw/pLsxEYRj0L7SZcSWlGokpuV45Tf?=
 =?us-ascii?Q?2A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2003d974-18ee-483e-96df-08dc33dd7868
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2024 19:35:48.1745 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O3g+uxkyMjx1BeFIH+Cb4V9K7eW+U7BqYIGJjkb5n/sok6wGzJV87UF9A0hZ2K0ovIkUPWGgeG4BkZQaltEMaAxLsoPhYmwebiORL+bLhlE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6277
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

On Thu, Feb 22, 2024 at 11:06:04AM -0800, Daniele Ceraolo Spurio wrote:
>Move from 70.9 to the newer 70.20. Since this is targeted to the CI
>branch, we can drop the existing commit and replace it with a newer
>version instead of adding a new patch on top with the update. The
>dropping is represented here with a revert, but a merge time it'll be
>converted to an actual commit removal.
>
>Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>Cc: John Harrison <John.C.Harrison@Intel.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>

Acked-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks
Lucas De Marchi

>
>Daniele Ceraolo Spurio (2):
>  Revert "drm/xe/guc: define PVC FW"
>  drm/xe/guc: define PVC FW
>
> drivers/gpu/drm/xe/xe_uc_fw.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>-- 
>2.43.0
>
