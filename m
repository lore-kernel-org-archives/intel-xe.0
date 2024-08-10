Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A826C3DA4A
	for <intel-xe@archiver.kernel.org>; Sat, 10 Aug 2024 04:19:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5B2710E10C;
	Sat, 10 Aug 2024 04:19:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZhgzZKUH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E26AC10E10C
 for <intel-xe@lists.freedesktop.org>; Sat, 10 Aug 2024 04:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723263547; x=1754799547;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=3EZ0LWDGU80CzfX2JHaXjMMpJQNFrQ3zn+H3R/+25nc=;
 b=ZhgzZKUHQgCLv2eEbtjUzo5Mkbz+mmgRPScYhVLyTF/tSwcEB2H5VnMH
 09IaspMgogMSkbgCzgIbbMFkYe6p/SxqpDJREf9Ev+KEwTA+iuZ3MY2v1
 9GQ6VF46MEQbBVpcV/qJ5C0F5aB/JmsIlymc0Ick8mk74/Q+BZ/5pIA9Z
 fA6nTZjPKouAXSmNA9Vr2fSHjEKWKzDlIs9FQiwtLurFNNN4XhH98fip1
 HDkGpIexh53m9mkzRzI5EjCJO1nwX3z6/XhzSQM9/dW9UQI/AvL/lSmGe
 gID0FWCWa838mz2VDmcam41y0u2efHd6q8zZmAogcispOMGhREGFHvC9j A==;
X-CSE-ConnectionGUID: /yoBdw0NQzGyoTXFwkD7iQ==
X-CSE-MsgGUID: qOLsfPUNQrKuSxVwZ0mnUA==
X-IronPort-AV: E=McAfee;i="6700,10204,11159"; a="24351947"
X-IronPort-AV: E=Sophos;i="6.09,278,1716274800"; d="scan'208";a="24351947"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 21:19:06 -0700
X-CSE-ConnectionGUID: WzrlUAQ6ToujACMGIw4O2Q==
X-CSE-MsgGUID: 7n1RlhiATIKpUYasJAuQ5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,278,1716274800"; d="scan'208";a="80979032"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Aug 2024 21:19:06 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 9 Aug 2024 21:19:05 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 9 Aug 2024 21:19:05 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.45) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 9 Aug 2024 21:19:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fPiI8nqjKqlAtj6H/cTP9KWqXqsweaXE95zqWJNQ8u0NfaEzOx8Y30unqlqT9VyCe9zuAhNlHSxD0FxrjlvslcS1zlynjl+Wuub2sGy9A9LD0ZWDPq3qMNVbKf5sE9wrhBhH4gjAxTbmh5aMFZFGQ35+NUfqbgw4yj95/wz3JkQqRv+YxnHJPMY3/dA6ha84wTMZBdJ8BzTsTd5LMKM2ix+vIpVT4j+3JNPkkDP5ljxxxs7dDoJxsqq0OMNap9dXLp9/mEV87K1tyjaNqQ4bFuBXG2jO2f34Ob9P//cy0InTGwnLy7RdRCS9O1vfWCk2QHZQIST6lZ2NPjygPFERZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NrE6equSl7TweaIUYHUp/GiwODnMVpxKsduJayocvZU=;
 b=Zr/b5jDW4kraHrhcihkD6ipAiAUnqJ7NN0ALfgUNwlm0GZyvwXBg5d2YbhWYPLk9eoMJoXkfmRNsLkt+711cc8l+jSDd34bb0uIn2MhcpRDNAWIauFEy5q3R3V2ppWZ4zMA8u2m6K5+6Hejr/S4Fft+OBwI1nN0ZcGEAXh2Z3TNOluR6UlSnK6kD6TsQ3pVrxe+XTIrwb1gOLA8VNeMAN3YrZBcISL1/g3gfWGR7VyyRX0h4RzzlWqOmtaP8z8sgOFql7Q8+gLgVHPeIlqwnJ+boeeLyAbkcwYnZ+QonaAed7/QznZ/9LQXaPdcYl/8sAQ+CkvNrFZ7KqUhAsx2uMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CH0PR11MB5268.namprd11.prod.outlook.com (2603:10b6:610:e3::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.32; Sat, 10 Aug
 2024 04:19:03 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7828.023; Sat, 10 Aug 2024
 04:19:03 +0000
Date: Fri, 9 Aug 2024 23:19:03 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Fix tile fini sequence
Message-ID: <sfcfecve5hlhtjlwywgthomszazszvzkuoqjyj5jn63zxhfuar@q5uzjkchpwys>
References: <20240809232830.3302251-1-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240809232830.3302251-1-matthew.brost@intel.com>
X-ClientProxiedBy: MW4PR03CA0235.namprd03.prod.outlook.com
 (2603:10b6:303:b9::30) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CH0PR11MB5268:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d7bba2c-3eae-4c82-a999-08dcb8f39105
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?06x7I5P7qe59rQbraNjGcCnAmhgY0D2p+yN+hVDijnzElZB7vO8T4C7/hkyI?=
 =?us-ascii?Q?UaeS2kq5xL/ibLGW/AurCvIBOCTl+yfuJVB9GEGad78M92/TvHeKYwLeKmC7?=
 =?us-ascii?Q?L3zSVset/wTnbPkdF/qhN4ZKbr1lsYXR7+xW0koR/Zqo3VWOjQ5jc7vkpK+Q?=
 =?us-ascii?Q?TYYvfrOhkzEBnOcCK0exSrhbeJCUYluwGNabHG5qFRs6lVKtx+0n365KYEPU?=
 =?us-ascii?Q?XW3jbrmleiJfbmuGAOXFLFsY530PL9ZkV/B6yXAdRa9jkSc+uIHJwMMApYrQ?=
 =?us-ascii?Q?rnLgsPOlsCLtucTxeKUYCIfA73G+NL2KOLGCArsgAydBY/o/L0w0utRQgMhu?=
 =?us-ascii?Q?83Zm/VO92KjPBmyQpj1rIv0gk9bm08YfTDABTh7bdYRtEimf4JEjNY5Doxl+?=
 =?us-ascii?Q?JHbc+hVVsnAWnQc0PrMXxOHZR88REvDWjlwK73OEAsGfqaGiyFHTOGHXsbku?=
 =?us-ascii?Q?mkpGqySJ+MyS2mMvQ+87hTtCvvLsgwCDv3N73C8mjPLNLO6DpYTbYS5nLNUH?=
 =?us-ascii?Q?tx+71U4t2421HJlVQhYKAnIT0f0jYB+7xDCOR3BgyxOuokEpO0dNTIZ8OS6o?=
 =?us-ascii?Q?0tSI7Th0LHG0yt5tLTC9gYM2VNjxSp0pwChhkMwpowSMCDlJwjv5JnVU+qh3?=
 =?us-ascii?Q?M4Eoezy0TgAbft8KUzbYvSYX1hXSkRxRR+D3dQY1Z49jzYdFyOxCwNzb0HdS?=
 =?us-ascii?Q?DKtmQQvGVY3tOKU7i6bwSOUsJnm26oO6kfxcMi/O31wkeuctar1n/N5oVIay?=
 =?us-ascii?Q?4+/m4ey3wquZEEZadRo4E76fAB9akko2HfkBatV1iixE5D8eRorqMkClCrtW?=
 =?us-ascii?Q?pq3YsFxruIBLSj6Ux4GQDzSWs21ScQqQuWMX/iWLp6wkJc0OY+1zMZRazpjz?=
 =?us-ascii?Q?FfvRU/NPc1RvqsbP0GR9Kr89WeyL1mHZ7mZN8PkLxCK7EBHwSGBdofqqsy1e?=
 =?us-ascii?Q?pnNdU5wVIxB1o13f0ebUZ4bjRq5pWBd2NUZxH7eC1a99lKSY+UtkJCCJ763o?=
 =?us-ascii?Q?VR2FijhUkmwjGQRvDhCmiFib+3+M55GqJfz2DtPNm7usa2jYODOUB7V75d77?=
 =?us-ascii?Q?Z1gy9eLLWk4QB3uGW/iCjYRCYFgbpVaF+ESkynUSUf51upF9ooqor0TPiBwf?=
 =?us-ascii?Q?hXf4LCyp49dgUsjQlgzyyHz3yTEdVM9H+L0ZUs6BVpn/ly9BsNam/BTt4zHo?=
 =?us-ascii?Q?NPNcjJ1fsawuQSY8lLugH2n1dDsbErR+h0A212R7eQCC06rN4QgovQOYOGSY?=
 =?us-ascii?Q?P8vRxyamB4IieVlXoWiWKtKjL6yGjYekfEFyJC1VtbRnxz+vBWQ+XrAlReSW?=
 =?us-ascii?Q?g2ZPMH7uDLYYDuAvIPkrlXhnLdYBS257W9TvWwuI+/VYig=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oZygxJ92OPe5zfoWnT+aejvI25AxMlpSRV+9TuvvzpyjKJYy3MXut4+nEzzI?=
 =?us-ascii?Q?/c7GS35VddXlxlC8gp6xqZd8eUUQYQuzE+aP/PwcKPwZ4HulTcBKu6KoDIZK?=
 =?us-ascii?Q?q3IwWZGxkQ5sHAxXdmv9isOwmGP5nQFEkj1ZhCSwCiCXY6cHcK4h8YzsKS3N?=
 =?us-ascii?Q?eIVJmC5tKdc8tzRvrsdAJQfHZh0VigFWf5XzmMuRmaxdY2kB00WmtnohDcdI?=
 =?us-ascii?Q?vAnXkfzicNTcE8nS1MoAKRcmlC6IP4wt2BIMpo4z5cddwCAqFdW0CClgJxgA?=
 =?us-ascii?Q?krSAUaKcvEP7iFaGTkcPFF+ngwpeE8c2xEiknO2ZNk+vzVTu5dp9gL2GjM2L?=
 =?us-ascii?Q?n7APsmXUEVZoW9Jah+jEcR0WWkmTBNKFrVWj0R44YNMkN/+xEePi5i7qqeun?=
 =?us-ascii?Q?8S7SzXdJl6CP6eg07ZXOqA786vSLUp8MMY5V0uQWZD2plj+2S4Vr/P77tI2k?=
 =?us-ascii?Q?P+hvZoKBxa5UmoAlj52tmZLIbH/78A2pb+t9lqg3nAhEMldb2dHFuzetvuQJ?=
 =?us-ascii?Q?Ayydliu96dpkQeDHAkO4SooGU8kNaM09C6FSFEnKFQvTUXeZcqnBz9h2U/Mf?=
 =?us-ascii?Q?kf7akZDLKVnfDeSrBFe7F93lp/OwdmA1zzg+xv1Gm4a6bPC945anCIlgAbc4?=
 =?us-ascii?Q?titHnBWzB6O1eNnHdQzUw5hIvWnlCuH4a09I1CCgEA1zsZ5tvQYR8n3vUWuw?=
 =?us-ascii?Q?nK6P5Ji4ZAFLg//rTUCNGyhmVNJaEUJbs2wcJL2wUIp65RN8nOWhi7lj6bDt?=
 =?us-ascii?Q?T8O5449fP+DwLrpwQsKlJTaMpykBS4B4LZ0FYbyaYFG959nbL4kMeqxE8gfM?=
 =?us-ascii?Q?1jbW9nbxji1TDNaWGgqZ7tH0cr+SPhCjfn4drgInOPLcJZOC/0H5FX8tmgmJ?=
 =?us-ascii?Q?NEAwyxwwJ3EFrHAgjiTWIwWOQXHNXfCKO8UuTYc0LbwQH7plBl8Noi57SDi3?=
 =?us-ascii?Q?5UHc4ackq8xRJ+7dNzzZabjS4BQq9NpE9VqJYXakq/EW2gxDebFBx5CZrhwL?=
 =?us-ascii?Q?qSXcUwOUUq8O221bFQAS1mwcqTIeu61ahhnt2nHy5+/Ii6T+UfhvqQYPYLDs?=
 =?us-ascii?Q?+yrsqYsmDIyFbQcq9/3W4XAIskUDdeMcGKHp0Q1Jm9rlmS6/v3w5TRuNFTpb?=
 =?us-ascii?Q?G+WfHPpWHIB8r3j5pnTdJxVF/oVhC1SyXP9EpSSl1nIfm3K8YsMw4IsjB7bQ?=
 =?us-ascii?Q?FVMZNHQWuawMgAayoS+FTkhAjGN8h2ebztFDMkrWItYAEKgp6LhOt7kSXoPk?=
 =?us-ascii?Q?jmHhdl7FJ/B73AshZYkiTbzIGpg+Hy7V81mo9r0NPHy1U74zvpb4xXeHtgvl?=
 =?us-ascii?Q?dCyAR4J0nQnOIuLF+o42HHDCC9ZIxAeeGGl50kReYPrShxRLuBFClSV/DnCR?=
 =?us-ascii?Q?mBYzqYIQ7uPbJ82ediw/ujuFZ2nXwHrSwBi9kAlmzRXDUKxaY+hISb8r2f89?=
 =?us-ascii?Q?OaXXgo7pQBm6HeoGzn/LW7nB4o0cM2mERqO2NrTSQlf1KA1d4eafLVZ3Xm+I?=
 =?us-ascii?Q?LIVIAINstuRNpHMyLjiKqtjRSLQq9MtyOxN7d7Cj1Lu2dHvR2H1NapbwB0ec?=
 =?us-ascii?Q?cm1Hi/sdrKDYZ25lfG1Z+BEGxH4WMz2BS4GYvuktOfMqcGp+1hLnaOVLPevl?=
 =?us-ascii?Q?gg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d7bba2c-3eae-4c82-a999-08dcb8f39105
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2024 04:19:03.1040 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TZU9oufP/9g7hzh0NGyZSKFIglkNt2K1YoAUtu0h04m9MyJtlIFy5jBvu1yD/IFmQ0lDXRQkd5sbU268GgrwFTAzi2pwHVRoHDc6k2CZQB4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5268
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

On Fri, Aug 09, 2024 at 04:28:30PM GMT, Matthew Brost wrote:
>Only set tile->mmio.regs to NULL if not the root tile in tile_fini. The
>root tile mmio regs is setup ealier in MMIO init thus it should be set
>to NULL in mmio_fini.
>
>Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
>Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

I think we eventually have to fix this split as this cross init/fini is
odd. But the fix here balances the init/fini and is a good one.

thanks
Lucas De Marchi

>---
> drivers/gpu/drm/xe/xe_mmio.c | 5 ++++-
> 1 file changed, 4 insertions(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
>index bdcc7282385c..f5bdb540e823 100644
>--- a/drivers/gpu/drm/xe/xe_mmio.c
>+++ b/drivers/gpu/drm/xe/xe_mmio.c
>@@ -30,7 +30,8 @@ static void tiles_fini(void *arg)
> 	int id;
>
> 	for_each_tile(tile, xe, id)
>-		tile->mmio.regs = NULL;
>+		if (tile != xe_device_get_root_tile(xe))
>+			tile->mmio.regs = NULL;
> }
>
> /*
>@@ -146,9 +147,11 @@ int xe_mmio_probe_tiles(struct xe_device *xe)
> static void mmio_fini(void *arg)
> {
> 	struct xe_device *xe = arg;
>+	struct xe_tile *root_tile = xe_device_get_root_tile(xe);
>
> 	pci_iounmap(to_pci_dev(xe->drm.dev), xe->mmio.regs);
> 	xe->mmio.regs = NULL;
>+	root_tile->mmio.regs = NULL;
> }
>
> int xe_mmio_init(struct xe_device *xe)
>-- 
>2.34.1
>
