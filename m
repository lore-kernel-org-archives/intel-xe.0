Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D30A6EB64D9
	for <intel-xe@archiver.kernel.org>; Tue,  4 Jul 2023 18:34:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EB2710E31A;
	Tue,  4 Jul 2023 18:34:54 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB7CA10E318
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Jul 2023 18:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688495691; x=1720031691;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=fT7iDa/JKGs/FJ421ReE8gaqiHvbXybyNMpgDmFGg4o=;
 b=QdA/V9c0MDZAQog2UdaxTGub3VMaBxfTbZ6emDU1GfGrTQbzy6i+4JvS
 j2PlZ+5vWa7In63rrAEVXtEOrpN4BjrqSNkJ53ik3wBrbIHV1uVm8JVEI
 6hZDS62Qaag9rXGV8clLnA5799kaTOeCr74RnodyY25ZPjjP2lvsCpfNV
 HFkkNKCF4+zTz/ZEkbr0I1s/hpIW21KC5FWB/j6Z0lGpeGq/vdc0xfs88
 n/vqoOuVF5WWdNZueU/86io65S5EQGIPonlXxm/ipf5oTei/NzK03CsAh
 nowTpM/NR/uhFG985QTgZo63K5dImu0rG0+XbsbqVZ8DQxKdLvKVUAWVi A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10761"; a="362039185"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200"; d="scan'208";a="362039185"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2023 11:34:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10761"; a="754128054"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200"; d="scan'208";a="754128054"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga001.jf.intel.com with ESMTP; 04 Jul 2023 11:34:50 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 4 Jul 2023 11:34:50 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 4 Jul 2023 11:34:49 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 4 Jul 2023 11:34:49 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.172)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 4 Jul 2023 11:34:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G8x0uvQ5i8TSTeMKHZgNrSjNsSmwyphYdjmyV3p/FEr6YbLsq2DmkZ2z7PQvAsqBtA+wtzD5fh7OinD3yy+fAqfCIsviZlIXbEZ9tRKlatN3PRxsubJnJ9/8G7L9biGf/pGf1frvMSwmw90jD8daqPbPsXksu7tZu9O50uknE440wX/6NT8bbuEGDSJg1U1EiYa/p6AIElDrmwn2dU3uooGEf0e2635Ltt3scTWv1QUlvRazflOnBYzhnN+cF6VEZP0FD8ANlUdGVujjqHzmC+4241PDPAY9qvUqsb7Db+8Z1d6I8VJF4jlZif8iPykKzjxK1Tenal4ov83pvHeG2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VnsxvcbjYwNUFOgDBJUmJjyNJ5VHw78NSeECrsW/kE8=;
 b=Tj2BALdwXxKahAtv7ecEGZeuvfnRZo3NHXqHN8Q/Dg1dl3UZexLmj8czq5Zs3ftJdnRgcelxfuqV4PWvUbxSP0iYxTMb+Ymx7vAPzpJp5NJ5SyiMiOpg0Uz4mN3raXvW5ycMuZrthchhxGL5AYVvI7fuTcRYl2NxG8WFahkPhlQumxfvbqYJ1tLzUhURpxaS8DqbyAAkCk8O0yOHcQGC+s1LzW7IPzmb1lHbqtnuy8s9t4WxC1ZIFgv9ZZKvq83Bx+dvsgt6w5jaoWLXKAz8qtWL+WdbL+U3xi+V7j0pbKA6Hba2NxAEgCttmbVp8DU3DWByhsMi28Ee5+Pw+Hhmrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH0PR11MB4902.namprd11.prod.outlook.com (2603:10b6:510:37::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Tue, 4 Jul
 2023 18:34:43 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::bc0:ef1e:892a:e49f]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::bc0:ef1e:892a:e49f%5]) with mapi id 15.20.6565.016; Tue, 4 Jul 2023
 18:34:42 +0000
Date: Tue, 4 Jul 2023 15:34:38 -0300
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Message-ID: <fwjbrac6jhsblf7j2lse5aanfy6u3hrnvmdgre23vv5thg4ado@q56irt4sfhdg>
X-Patchwork-Hint: comment
References: <20230704153243.2489821-1-jani.nikula@intel.com>
 <20230704153243.2489821-3-jani.nikula@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230704153243.2489821-3-jani.nikula@intel.com>
X-ClientProxiedBy: BYAPR06CA0046.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::23) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH0PR11MB4902:EE_
X-MS-Office365-Filtering-Correlation-Id: ec7ad03a-7947-4fbe-1783-08db7cbd5531
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XbH7AraMa8GGd9SDbCHCmiJbQI1KPtHgXx/K5lrVolOuUut1aqoWSEZNzitjEdLnlmecq0KIERH2Erg0um4SnxkQoxjDb88xY+MdqYGJ6PpICTa1tDu8LBFyZf3Tb3IUX7g1LnBS487DIEs6Z8snq6ITpiFF0CQ8RXiIV/gO62RAoAUDbMVqpnbCVqJ90pXwJOVLk9bbowUYaflI1isHAVwiytFRmkuq8WeR0ShvxGbAzB5nsp1ajg9Ai4CPUbl2fia4lToqsA+MjvW0GPIxMro+WBmGqNK6AAgIHPKWxEr/5IGnCkkOOplQkqEVRKrifBfU6Wb7rkBou5Kc6oimacWNZsRI3C+kfg53NqWoQpwBI2D5Kx+U4zVdRu22Pyve7Oof281XA7urGODkN6Z23ytdLx/+/4j1jOgv9wYLBq/JpR3IBX4YE7IX6Jy75YT+YWH4Q9rFcKtoUNZUDR1NLCfQy6fE+UBgLkU2WQ0PHmOxubtjICr/j3MxKtRKEwGsiryv+8GO+8m0e24FH75xTBtKyVQ4ZE6HDiMFcMADicg5YI6LjZLKAo67qXMf6rMD
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(39860400002)(346002)(396003)(136003)(376002)(366004)(451199021)(4744005)(2906002)(8676002)(41300700001)(5660300002)(6862004)(8936002)(33716001)(86362001)(6666004)(82960400001)(478600001)(186003)(26005)(9686003)(6506007)(6512007)(6486002)(66946007)(66556008)(316002)(66476007)(4326008)(38100700002)(6636002)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cvqJUtYLtqyf2eqryHxdGZ3cvgG/z4QK1jcpEzJrL8O09FATm/eqjPzElwiH?=
 =?us-ascii?Q?o1aPi5RIAku79Qfz/CGxQvOzG2QAPzx0HGhn50FPwbgEuDqiupsoGXeXG8E5?=
 =?us-ascii?Q?yloC/wiF4y+2ZK+VDg3E6GRED2MYkWsHnXx4+ffaT5EXjS0xVmNky6nc+Lnx?=
 =?us-ascii?Q?FEamJIgorGBSDIQHdDZXJhCDMWARP7y177lJ9NOHVFHSuyClVU3ut4S5BEGY?=
 =?us-ascii?Q?1VBBTbvAqg67WHiVxohT6rkHgBXkLD+1TMLSllBJ50P+8AHHuhi6b8+sygmP?=
 =?us-ascii?Q?KYWtlVjMD+noQA5ao4MrBMYdhmZ3DZPnsjLLnmJ4KCfbJTAkOBxt1JdPLTp3?=
 =?us-ascii?Q?+UZqa30OttA4QQUKm6qCCQzcLBmMPbdgY8Xs+Ze3zhCHFyLdSOtJKOcRQU6b?=
 =?us-ascii?Q?e5pqiUKpP0nEKSg8trbD04TC1V1SMSHglRn5KnJKGqmfSiaBncVMDpcAlnDz?=
 =?us-ascii?Q?TIMPIZZY+TVhGpJPt2PjoICWKZU1m3AOxN2KhAsihlu/O2wnnaz1LcbdOYhe?=
 =?us-ascii?Q?VU6fRyf0vgL+79YY//Ztl8z/TxhoZqCe4JjqF9/xFXAvc6lQy62dzbG7Ni0h?=
 =?us-ascii?Q?3c5lx5n2bI2VUCVaHgaNitPvJmPfTF1hxQ+xqBkFInyJrNCShl200XDnbPVG?=
 =?us-ascii?Q?Gs88uID3IzLPdz4a4JT3IQtjVFB/Te6FwDpBnN2VCF5l8KfqrDzVZwd76MaJ?=
 =?us-ascii?Q?q8i5bhkr3nrbRctX/152phL8r3txznohAgMloCvyto+Y7uaPOQZKDsGItFBK?=
 =?us-ascii?Q?wUipv1YtFxufEkRLvKdLLuVcXs/4fpLWZ3tz4ZRFHfTJ8kAd5s5U7HDCPD1O?=
 =?us-ascii?Q?OFPZW0rhDR+3Q99TwpLQbEuBA3P8+ZW22N+nNDJQIg8UMCHT6dIroUHe30rX?=
 =?us-ascii?Q?HFYNTmCRU+0YDoGxjvHK+rmjM1cJlu6hf1mUCjcX86hrZotnt3r9KzjKVVKS?=
 =?us-ascii?Q?dH1T6pLCxAXHEQ3UypXqAHwqva5ONSncRzbap6mrLJSl/dNLOsMAbzCHa12q?=
 =?us-ascii?Q?Teno+M0/pXY5mpc4AECbwbyoe/GkTFfWR7MgUyKjCLG02xZ/2pjbsF8oYUS5?=
 =?us-ascii?Q?7+nea+C8zQVDlUZtykYlxdjPsdbWSxadqSP32SVfjGo0ckd+uyshhqS42UxB?=
 =?us-ascii?Q?rMOyQGVGAoSeT5te0uIyHe6M72mb4QIuMvzG9aXetjdCSYxPlHfT2NI0bLvM?=
 =?us-ascii?Q?kgM7HmRxI45Y/ulu3Fgu9lUdVqTSVNcsbnZb7wyIGAYCRRJo8C7ogFanURE1?=
 =?us-ascii?Q?MOC7u1pdfrGcjgPaSYqnl9WFXzuZXwAcAdhOq4+PraaTB/1EDh6xqBRF1oXP?=
 =?us-ascii?Q?47WbTiN/bnjKEPNuPDMvjBkjcogeSMDEEK+NqV2sA7e+nJ7vkRE3TEGKegqJ?=
 =?us-ascii?Q?g6vq4R+aTmck+bOTRabjx6dx/qVo2uzkQKvvKkzIccu40phMmkORoxhaOLQI?=
 =?us-ascii?Q?iizc1TozgMP0lILqSP32f8xwDNq/9dzbr/bBKygBzcOPxjnGDZRHU8RG0o2s?=
 =?us-ascii?Q?ou2C8y5zOe2xMuiUuSeVf5EyyqnnvyjshUq+YjM7Mz+uhJIaesMRoiqepVHw?=
 =?us-ascii?Q?KA4mNw85YOEj6XC5XTY8r0i/j+jKmmIFf9w9Nz5jwSk9DSzDiLUJNkVmQ+P0?=
 =?us-ascii?Q?tg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ec7ad03a-7947-4fbe-1783-08db7cbd5531
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2023 18:34:42.6944 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FFiqKb+oO4H2Zz/bSiuqTQcvP/+uYM7/4smk3d/kV14dGyyaPqID79QHAoM0V80NdiV/z34DZVLYaHCstcbjZApjW1CtOXpujFZfiAiEa/8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4902
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/4] drm/xe/mmio: add xe_mmio_read16()
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Jul 04, 2023 at 06:32:41PM +0300, Jani Nikula wrote:
>Little by little, make stuff feature complete.
>
>Signed-off-by: Jani Nikula <jani.nikula@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>---
> drivers/gpu/drm/xe/xe_mmio.h | 10 ++++++++++
> 1 file changed, 10 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
>index 3c547d78afba..4953a9a3f1fb 100644
>--- a/drivers/gpu/drm/xe/xe_mmio.h
>+++ b/drivers/gpu/drm/xe/xe_mmio.h
>@@ -31,6 +31,16 @@ static inline u8 xe_mmio_read8(struct xe_gt *gt, struct xe_reg reg)
> 	return readb(tile->mmio.regs + reg.addr);
> }
>
>+static inline u16 xe_mmio_read16(struct xe_gt *gt, struct xe_reg reg)
>+{
>+	struct xe_tile *tile = gt_to_tile(gt);
>+
>+	if (reg.addr < gt->mmio.adj_limit)
>+		reg.addr += gt->mmio.adj_offset;
>+
>+	return readw(tile->mmio.regs + reg.addr);
>+}
>+
> static inline void xe_mmio_write32(struct xe_gt *gt,
> 				   struct xe_reg reg, u32 val)
> {
>-- 
>2.39.2
>
