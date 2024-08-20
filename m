Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53559C3DA4A
	for <intel-xe@archiver.kernel.org>; Tue, 20 Aug 2024 20:42:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12D1310E448;
	Tue, 20 Aug 2024 20:42:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S0abX2C/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 692D410E366
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Aug 2024 20:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724186566; x=1755722566;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=DlpZypf2gkMfGOVtcJ4t7+tRarV3qXv5XgWss3vpsx0=;
 b=S0abX2C/dgJmLF63Ov9t5HXGabTpkK3NuL1XQlDjwJmm/5QyMCw4+7q/
 dCb6s8Xqi+Ae4Hmax3pubEB7pC2KWCLRBZMsvlkO6PCsDieH9SMBU9ZGG
 qVlU/kxjgXI45ItLrmWbR0chNUM1eu4hGFqns5iS656+3+F22UYjQCHZ/
 lMc4+1GXV8fZbbEtAVTVNUlscajKQNJbcgqU7m3rYwFJuM2sAW04HlX8H
 OLG9NxbbY+ckrXytfjEVkX3xpP3KpE7iHm79/vF1aNA/q/5fWrrccCRuU
 wSnF1tWHCnL3IfJxaXRzLPkDa7nYHSQZ0S9RpDkfDKj53w1z4e6mQ6N/z A==;
X-CSE-ConnectionGUID: opowsu23TY2bqT8B/e/AOQ==
X-CSE-MsgGUID: GjSuy4RiSRi0kISCjMlw2g==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="33904737"
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; d="scan'208";a="33904737"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 13:42:46 -0700
X-CSE-ConnectionGUID: KcvvKzNCTdiqy1MiBNajeQ==
X-CSE-MsgGUID: QdhNw1LnSnq19FmeBFtntg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; d="scan'208";a="91579812"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Aug 2024 13:42:46 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 20 Aug 2024 13:42:45 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 20 Aug 2024 13:42:45 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.174)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 20 Aug 2024 13:42:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SpbJ9579R/5tY7k2HQ+ZBblofz/bjZT5eWe2qOkOMfaj4PCQGja2+Wzrl38PaPghAnUzWF5zLQQil7ycdGrI4QW4cHPGtVJoHJHeu6d16+1mokEpGxmU24vteJgmNO09mjQhdcCUZvzhRNxfj3v4bZw4LuVbdsv7yZJC22ePqGvjh/CUJh/VlaoQSaY/NDGE1SPWJZ2uO1uQkCc3BE4wSw8FzpYPXRnTMPw4MH12q3izyDkxm30mZ8bWEDOW6AfVSk4IN3NM5KB3SeIE7EZx4vlcMzZAMb46AokP9/E/nGpZcP/YNnbY51sZ8on3L4L0vT/qR9oEgtimtrkgco+F8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PQn1f0FIODArwehhVpwGWfEytaUddQtg1N3zfL2Uwdg=;
 b=MIWszp126IxpGQQvsV8cK1XWrKrtloeqCFekYCwUXYNOK1rjdLwKYdF/sblZdUZtRzxAbGBDVY8KcGGpxuHn96iedFeH/wIl8BUtBte9vaNbNPUJqT3+UsoVg1ggje5C0CDgK9t3PlbASf0au5YpnkcwUaNZPGuKADEqSOHyfWomzHjB8gK+mFB1ylRsZ8fmMn3tAh6i4NZmY7YzIPpNgCxjnVWauXuI2D0zNSGrhnvvfa+f19Vk9ur304Q8hxtrE3kQ6aOvOJCeDtJoxf/Hagr8a3ZRN+ezk8uteewhQiAY7yQ84+0lJCG4YolTG9eUpHxJd63zpI6qgScwGa50jA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CH3PR11MB8188.namprd11.prod.outlook.com (2603:10b6:610:15e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.20; Tue, 20 Aug
 2024 20:42:37 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7875.023; Tue, 20 Aug 2024
 20:42:37 +0000
Date: Tue, 20 Aug 2024 15:42:35 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 5/6] drm/xe: Move HuC init before GuC init
Message-ID: <gbqo3m4judjcvi3zfq263xgwfzcvxvcibaws2b4h4ahxm6pchr@ur6r4uf2ndx6>
References: <20240820172958.1095143-1-matthew.brost@intel.com>
 <20240820172958.1095143-6-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240820172958.1095143-6-matthew.brost@intel.com>
X-ClientProxiedBy: MW4PR04CA0117.namprd04.prod.outlook.com
 (2603:10b6:303:83::32) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CH3PR11MB8188:EE_
X-MS-Office365-Filtering-Correlation-Id: cf587f7e-f786-45c9-7cc1-08dcc158a095
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?f4Bs1eLbUk0wnhmA16fXYlZnV/H6KL8JJil9TADQbZfDF9pK/PY8ajmKjTJo?=
 =?us-ascii?Q?WgsQdZeecRX/ImbjFr75fJKDx4nNQCDgWxAxLTiK5hnzLYY9dEPCb4XzIH3v?=
 =?us-ascii?Q?dJEP+qYmnfG0SY3GxEVLTeXJ8imBR4f2YboLymMtmCFwf++Dyf5fOz5pmFPP?=
 =?us-ascii?Q?Fs+l9d+JG4cCWCzKRdr3yuQucXUlASzBVTMuyUfXd1+iALd7oeX8HehR5wrl?=
 =?us-ascii?Q?hKOuPSc/Tr+7shI+1FsM1kkgNXmJrQyNLXheNr+rWWIh7VHYWvNr6zgQ9Ras?=
 =?us-ascii?Q?9nWdSIP8KInkgnOyXfncUareiDYOfIkCNMMEQqbmnpdcdIWU6vuQEXJywYJo?=
 =?us-ascii?Q?F791dQW5R7FtfCB9bphi3BFM7kedbCJOBgPFvZQY89QsFDW40czWejwPqd94?=
 =?us-ascii?Q?/E8kKbInAcrmMIhZYpR7GC+J4wyTHhdWIZZN3uXOdHMcbjdZfzVDvol+b9iA?=
 =?us-ascii?Q?HS5NCb+Uzl8FUi8T6x4OwGSS/ezqgLWUfqJ3PZNrdTj+J+2Ni/HUoCQ7QzHo?=
 =?us-ascii?Q?AOCgWHIpq0d8rnBnfznk9oZUm9qodM0mMV92LNZmxMg6rBo/arskONUdYQ05?=
 =?us-ascii?Q?MQlK1OGrnDTnr1xJBFbfb6dp1AmmYArQchH4D9agZCE+Yxz0jkBu6+3BylzI?=
 =?us-ascii?Q?H1r4nMubY1qYymymTGUDdCexgk8BYVsmRjyIzVLLD6kTLhR9e3ilB51SghDZ?=
 =?us-ascii?Q?uTh7rAm1py+5zGc/s+cD6BmyWD5A3cojVnwoRW4GkkyesPZyD4enw0OjnNw+?=
 =?us-ascii?Q?LxMMcdlv5vr3MeM94k3YXcfBJA3mHKFJZVTNDa6qgQKnZlRqDxSHas16IHpG?=
 =?us-ascii?Q?4qce9d24N6uVn1ayyuUnI0LNXemdE04qmBOeuOZs9kygCUBjqG30RdxhWMbP?=
 =?us-ascii?Q?Bb5dduvPIrAvrd/sXTgZSNVIC8SWygQ3XLoqPqi6G12juMM5FLXbs8kh5b8Z?=
 =?us-ascii?Q?KUrYFStODIutMvuaVRTVuNa1FgmcOuH3xGD21hJjQXwYFNQOmjy8xZim/tcR?=
 =?us-ascii?Q?Fj9jFDx2PqaZQUmHx7c6oq2MxQfdESjl2PpZPt8H5TsAJbnGSZqKEpX+3go7?=
 =?us-ascii?Q?bEvjAn0A6flrNWlnMY1HDiT07speFyncmrCXR7qyN3UPYR8D7D581TjP4vMN?=
 =?us-ascii?Q?Dhcel+/6/J6rGDBJuefJZyCY1UfhfThOswnnurEQqVXNTKbkfrcPwhEMQbcU?=
 =?us-ascii?Q?RmLIxfmFryYMFXkwnOqNJEfeBL4HmXxFAeP/cqcqI0+ldlfM5dbjTbhqKMG3?=
 =?us-ascii?Q?uGTJQAWHB6Mc/TZ36DYOeHSUhlZkK0eNuvIt6AhjsPbu2d0yURB3WhLWF2uQ?=
 =?us-ascii?Q?po/1fHTjU78h9YGJsIjFhcFZw/7oP5oomxvjPYlqwecL0w=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zaA0Yx6cs5QprdSPgJMUqSvrsorn3eQIxJQcSgCV46nQrs1iJOaZgp4zzV22?=
 =?us-ascii?Q?RiJBkqsyD3txoU+Fg2XxTxIYpDRqeSXur6PcN/wwlqBoTsDfix+EMKwiHYLS?=
 =?us-ascii?Q?540QJbwC/WsL8grsYweqGY00hZ3bikxvyx3BmmZUUq4Zp4FP6ejSCcMz2Msw?=
 =?us-ascii?Q?Ec/E44nVDJSjRb3sQ2h4LyOFVwRoFwMzYx945YT9p08dlrGbySmO2ryfU1wW?=
 =?us-ascii?Q?Gmt5jPpp5LLnztV+OFwv5clzeiLIqv9OuTIavReqRjfuGsf9s8BoX31ROEZh?=
 =?us-ascii?Q?cLJ54YQig7HEQpuDF0peQ7d9pXbBZ2WzFOkArS6oVnjtQxt47MLTDpuJAmz/?=
 =?us-ascii?Q?JvRFu+/Rwcg3F/jh2njQNWI8tFGZG9WIe0f8+hEf29Ygenuq0QePeEw7ECwI?=
 =?us-ascii?Q?oHQrbEX/XBQOqa2I9iWJoirZ1KPBuXQkhumvcBkpGTwRGVpaRgNZoUsCBfk4?=
 =?us-ascii?Q?0ekeYdJdwStLZfhGO36o7Gkj1vsnMIEcNdn3eTWHhdCUEMeLCTAB5ALO6TYN?=
 =?us-ascii?Q?hjXNa88ouvNaf0LRMaP9MoH9EhnWBg9CdhYaEJD3VpY1KGjVaPrt4TcwIOgr?=
 =?us-ascii?Q?eDEsKaaDO0Zi1u0R3s3KRikmZN/RAMY/LfWeYu2qik6ihEbgf0BJF8/IHxIX?=
 =?us-ascii?Q?2TAH2qwkh+eJ+o4du0KuSa//VdIhfej10wRM696NceOwcQ73lWMm49ZiCf66?=
 =?us-ascii?Q?EsCokYoyBk0u77/pxkvrd1DXUurHTUzi4bs0ODcrbbxlQVeuaeHazuMR4QJs?=
 =?us-ascii?Q?+9xp95EWZ+YVoernp2FgYjGc3c4uO8otxzjLoobT7yOv6XcbwJL7a6o7ULpv?=
 =?us-ascii?Q?KgjGs60b7kUnuzNUX5r9sE1xlTozp8pt2m6UBP0+tQKwtbsJl3p16JKoi9rU?=
 =?us-ascii?Q?K3cGETYbN4SDu6o5uhkV0YeIc1BzuAZc+d4JXQTXjSL5tFLctNMt7uDLWsjf?=
 =?us-ascii?Q?qYtdFIqdJSpG0YNS/3O7ywiDNpwif24zI2uuRzvsa+FubtZO/vqphb24l0YL?=
 =?us-ascii?Q?6uOQYSlwrq8GCX9FmtQoejsIY4JTg5+hHhUyiCSTxyuXDCgWnHbxxLku2dM3?=
 =?us-ascii?Q?SGRYT0tmZfgHcIsXfKE4ZOB05GMm00Y9KwprZCj8MDEfqAnN/3Uwfq5HjfcH?=
 =?us-ascii?Q?7BHW259Gr4bk+PQMxBnbyovc3S88cx/iXRZ9snWdQAo8iZdf0Ucjv6h9yBXq?=
 =?us-ascii?Q?j4+z4rXdIqW8LSW7y4kMrEawxLUSdt8nZ1grevavxRF/Isl+XE3+/P0dOfr4?=
 =?us-ascii?Q?cOF4AltBMaVZn8NNCpkdD3mq6Yk3zmXS/YTnRrYaE+RcGDU45GmT7u5jYwWL?=
 =?us-ascii?Q?WceWBvdHDrX+SuSL7mB9pVo2r2TNnY2EoqxxgvxjrOe7qjSHsCdMVx3yQmj3?=
 =?us-ascii?Q?7p3b9cTkU9AO6MIQ2Kwv2Wkp0KVn2M3EvMPthNIO4QgkbeIsuavF0ez3ru4k?=
 =?us-ascii?Q?NVz6Rdk5JL03c8cKrlHDl9mZF5eigpTCgnowAy1mdBGASQV7vt0UzKjea2IM?=
 =?us-ascii?Q?Y1zRUyPMbGTeKDT08ZymptqaqWRjz5dlRaBr7Mhx2pUJA31vs65nbj9mtQTA?=
 =?us-ascii?Q?POSuKCdP+mkaqfS6DZMa10fjggpStGLhAo9tsJGPB/EeA3KsuZWrmlgqHtAZ?=
 =?us-ascii?Q?zw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cf587f7e-f786-45c9-7cc1-08dcc158a095
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2024 20:42:37.7148 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V8r+3NeIimypEZwvIt6ILJbPrVpZP1IsPDMLrzW0MkmHr+ewD72SwSjCXGBqvIgvoVF8DoGyLX0ErV1Io4hSgc/LTe3FfD5Y7VYj1Hfuuc0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8188
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

On Tue, Aug 20, 2024 at 10:29:57AM GMT, Matthew Brost wrote:
>The GuC fini, also fini the HuC so move HuC init first.

AFAIU this is about

guc_fini_hw()
   xe_uc_fini_hw()
     xe_uc_sanitize_reset()
       xe_uc_sanitize()
         xe_huc_sanitize()
	xe_guc_sanitize()


but why exactly do we do that layering? Shouldn't xe_uc_init()
be the one adding an action to xe_uc_fini_hw() or let each of the
uc to sanitize itself?

>
>Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>---
> drivers/gpu/drm/xe/xe_uc.c | 8 ++++----
> 1 file changed, 4 insertions(+), 4 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
>index 0d073a9987c2..5b7d6f44a7de 100644
>--- a/drivers/gpu/drm/xe/xe_uc.c
>+++ b/drivers/gpu/drm/xe/xe_uc.c
>@@ -36,6 +36,10 @@ int xe_uc_init(struct xe_uc *uc)
> {
> 	int ret;
>
>+	ret = xe_huc_init(&uc->huc);
>+	if (ret)
>+		goto err;
>+

if we are keeping this patch, then the comment below should be on top,
or maybe even on top of the function.

Lucas De Marchi

> 	/*
> 	 * We call the GuC/HuC/GSC init functions even if GuC submission is off
> 	 * to correctly move our tracking of the FW state to "disabled".
>@@ -44,10 +48,6 @@ int xe_uc_init(struct xe_uc *uc)
> 	if (ret)
> 		goto err;
>
>-	ret = xe_huc_init(&uc->huc);
>-	if (ret)
>-		goto err;
>-
> 	ret = xe_gsc_init(&uc->gsc);
> 	if (ret)
> 		goto err;
>-- 
>2.34.1
>
