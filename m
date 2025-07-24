Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15AD3C83F1A
	for <intel-xe@archiver.kernel.org>; Thu, 24 Jul 2025 15:17:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA58610E08F;
	Thu, 24 Jul 2025 15:17:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m4fFa2tH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01B3C10E08F
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Jul 2025 15:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753370264; x=1784906264;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=T8gVzTTK+3nNdGePlDn4WqqjGmpV4YKVbZcL8VtasV0=;
 b=m4fFa2tH/5LW3eQabvIgn9r1LXLhaM1QuUZdcmGYDnVK6xXYQImfmLkl
 VeFSkQB+FKf9y7y1kb7mTivb9p0BB107+EgvWI+OKadkOEHM5caBCpgMa
 Rkc/pGpCPnVckJYtCGSGuHHDO2Fpf2RuHG+v5Nm3+bGRl89KDNf3XUYq0
 1Qta2/cjsFy7V7fXo1b41wb9ps18yoVuZ02o9nlzmYA9ViiOeuv2kZkh1
 Otn2jxOyDmodqYlpc3EzvyrSjzBv+uoewyOYIhoTbVkpRjy1sVVM9wPxm
 lMN5czyybBYuPvKuMrxszKW7afyGpEP4uqoXyaTyKl9G2ZpWXh11fXhLh A==;
X-CSE-ConnectionGUID: 7oAhW2C7SbSkRKO3neYzgw==
X-CSE-MsgGUID: IdBoA70VQWKmiHUxDerKeg==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="55564127"
X-IronPort-AV: E=Sophos;i="6.16,337,1744095600"; d="scan'208";a="55564127"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2025 08:17:24 -0700
X-CSE-ConnectionGUID: XvvEKdzfSoCebQ9yc3Hf9w==
X-CSE-MsgGUID: AzqrK6xDRtudC7aIOrBjwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,337,1744095600"; d="scan'208";a="165832533"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2025 08:17:23 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 24 Jul 2025 08:17:23 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Thu, 24 Jul 2025 08:17:23 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.46)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 24 Jul 2025 08:17:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=onIRPJXpMN56v24R+Cq6d5+kHaHUipqd5wNHEG89uAych/iUoYKS2NOlGvKJ94wsOXLjbxHOycj4Edxqe0ImwPOveAuljME6Pa3MI3/PKdovO6DDuYXgP9uBw1+pkDnc3yIIEmj3G5zuYc6wV9AzkcCW6iJyijjQPWrqBNyKrwsuXRpW0uRIOLTZdROuXBm2mT45tF509kVggNSngVdAdZaH9bfo+qjL3iL9BaSFs2bj/YLia/i51HRbwbP25fOMcRPNXMgmqu2xwIOkMQITDQgpfP8bfNW6W3+oeJ/ufU3nV1m/2KsF/HesjmHESB1y6jiCFl1zdGD1UuyZJzh0tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0IA23fSiAl2l2vPMHXNPfHtNH9FF2AVg8ePUX0KSJOQ=;
 b=pUXUMjBm3ZwTYM1RJnw74z32vcnY3DCMxFUbKgqEH2FthjiPI6xLCM5lSkHHMu/R5+x/9vN//Lp1D/sTrU8oVizt1Xo5w2pGphh/aUNSY+PTms7n7I95GqYsbNh0qhtJdXOZE+uNZULnqnjWASxOo/7ctEJKLmeAsqjZ7nlOrtpV0ele7/onLkNtagLp3TnsAZBJTJrJjP8fZvDPfturIq2WAVVb0O3Emirj4/e1Mrl55DDKyb33ySMmS5cOcDznvAmZrMg6B8gkF8Fwhutw6OqGjWWiuf5Ly4EmZo1lICFFiL1ItNIShCFmaatiBYyx2j3m/8mV/mwph5lHEjxZIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by BL1PR11MB5317.namprd11.prod.outlook.com (2603:10b6:208:309::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Thu, 24 Jul
 2025 15:17:21 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8964.021; Thu, 24 Jul 2025
 15:17:21 +0000
Date: Thu, 24 Jul 2025 12:17:15 -0300
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v3 4/6] drm/xe/configfs: Check if device was preconfigured
Message-ID: <sihlqt7y2k33ay4pi23ziltr7lfprbujyxyhloozeoqvpvkewx@jikbnw2so6ac>
References: <20250722141059.30707-1-michal.wajdeczko@intel.com>
 <20250722141059.30707-5-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250722141059.30707-5-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR13CA0109.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::24) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|BL1PR11MB5317:EE_
X-MS-Office365-Filtering-Correlation-Id: edfb0172-a305-49da-c643-08ddcac52f3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?bPJwqXnljeCAFeCnx++ELowCtDswH9DDhTXrEIvtQjqKCG6NNHxFKd+ubqkq?=
 =?us-ascii?Q?jMysL9Ja7fSAwheW4iYQq2htj2ryEyEncmFNdsc6ZNkhOJzJ2FJjmm1SnT/z?=
 =?us-ascii?Q?ffXB50F+JNFMqheZNXvkcVIHGVKsiaBna7sFC/r3UxtJOL2YUhpXI1ydfSs9?=
 =?us-ascii?Q?vGF2P5DYJIgM/grJl4/KcRlLvKfEw7NNG4iD3pebSXqT7Ba4szCdgEh5skjP?=
 =?us-ascii?Q?OH1UXkdEzN7G8B5TK/Fm5Up5USDWq3z/Ia5qvi4aqI8NQmnkyYFKhrlB+dKt?=
 =?us-ascii?Q?LJpJRhbsyxNFuX7QYo60Q+ehPeOWGCFT+8B94E7xdhnZ0vWedwu7zdQpoqMD?=
 =?us-ascii?Q?7qOYoHpWk68J3wSHYmf7G5Y0Jo2TpuiQFfIkbhw4EJL7C7tCCGjAaeH2E3dV?=
 =?us-ascii?Q?wfKGmeKuprRC9YHnddPt/BGaqqaD5pQ/UhwJGD+xeOMQD6kdyZEO646EAYXB?=
 =?us-ascii?Q?fqDyJGZrNCDThHnVJxXcK1/XuOmHGJxq37sfRKsZMIr3uvv+lv2uFIqEHGgJ?=
 =?us-ascii?Q?RbYIH0WiG1rQHP78edy2d1/YAxpOwepA6hXjF4oAtFyLuP3wfKrJj8pZCt1I?=
 =?us-ascii?Q?R/v0Fl61ZEMiXgrNMbKnzV909O75DPZa5it7aM9sN70WtceiUxj85nXnRUX3?=
 =?us-ascii?Q?uAuagWVCmVT6gR3+IqAIF9l91y52eFjUHIxS/UodE+tJRbbiHa74Qqz0RBHo?=
 =?us-ascii?Q?1H0lNEkJkezLTV0p6TPidKMInmXIwQyKq4lYXyPn2s0LuqY4inCUW9zQo9Vw?=
 =?us-ascii?Q?B3JE1aikmcmSIAmt9IPiFxGztFrwQTAx3Oin9hfVteZb7EtRpgecRVt95Pc+?=
 =?us-ascii?Q?veJY+qoTc7ymQAq8XCCI9fTgLcjYFayAUb8Ef1OZS5Il10jd6P5ltQwCUOKG?=
 =?us-ascii?Q?B9PPMWE4DMDCtAbZ99yKrmJHNyFGFJiTTP8NkrAXI3IDBRp1PyxC/EAWOzOR?=
 =?us-ascii?Q?ySQuNKWP0WZeZY9s4kDcL6+MaKnei3OLp+QqqFLjBDWskAwQmAmMEN4j4SFe?=
 =?us-ascii?Q?yxqK0q/yLrEF+8Vk2AbhKDR2atAJbBOccx4lo8P9KyGim9gwQixVMMpoefVO?=
 =?us-ascii?Q?bZRH7nYVTuLr/31WWi/ZtE0VOufV672HzqGdT99b94ygAVh8mHjsT5gA8qfW?=
 =?us-ascii?Q?4UxmqUWhunZwqeRgW1EE3tAXDE4qMlg72iXD/OPRSp4vZXhul5Z6esZ0h5vL?=
 =?us-ascii?Q?+UxMHt+469iINxDcsBkftaixMMdLmO11Xw86mA5eIwbRJ/QZqEKFBs6VT4Id?=
 =?us-ascii?Q?gJZaZIeljMs3cci7NnDlCaa7OtNq0Zk8pHLBctziFiwI9iJsS/5RF3kPKQg0?=
 =?us-ascii?Q?hsU1NFSw0uFezG5v0LXfnY6fnccN0AiuL5IFOTgISmfecAP2A5JFNE8v5mwR?=
 =?us-ascii?Q?UPVmBB0/U+TJ3bBWqhJSAc/yELUn7aECjxCtWXbEVGk2tNg9GiNT4svxihKT?=
 =?us-ascii?Q?QalGQ0qlBDg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yWS1ReIDoF3518hFAs7Tgs/xRPATfflaExuK4x8cXIVWrXFqJwklzKGhowLV?=
 =?us-ascii?Q?8mfpFCdqBW4VcYnqv21Flp7hwVu0lolgW/DUqIXaKAfFpf/vDil1iczpTZoO?=
 =?us-ascii?Q?KHEEfiJPuPePpa8mpYsaqj3HDUjJ2H/E7XYkDEDG+llf6xS8378IxP7n+FEt?=
 =?us-ascii?Q?puQgLeWIYXzd3jEdKxA2Q1qPblY05xSWrf3ptP6vtgE+AqilZ4szOtKhISHR?=
 =?us-ascii?Q?8Lqi6p4LOGFtm20C4f2tU7/k+t/zklT08pg3r5hhcFW9cZAwf41Usqvzz84U?=
 =?us-ascii?Q?/+U0iVtpj6v4K47et5/ljCqC9D8Dv3TrYoAJ1wMWherfzsmSLYqgxLZb801i?=
 =?us-ascii?Q?2KnAq+BdxMzHp20yJ4SC7nes57D5QjWDOZ7K3ZDof6rqN5m9dTjMqOyJ23jM?=
 =?us-ascii?Q?aSTwlKKVNbP5S0fsjWRsIuTqZEkFPJlAjpqHeigspArFSIhgO9QxMjYwwEWu?=
 =?us-ascii?Q?i7v1F+GJaotvKkYJkDN/j8G7nLh2NisSv6U0CD1GVQeSB+HERna5r2BljrZa?=
 =?us-ascii?Q?9xMRIF+uoBqorqMNyY8ssYT3kmUpp3s/M8WkJpS4pxlfsv8uI/NQD0TpJxZL?=
 =?us-ascii?Q?eKHqxXY1XQm49MDYFR2FchZsZWsYWxZkwB/OrSQrfgBf3OV/6fUeEYMzX2k5?=
 =?us-ascii?Q?COx3GLmRQf6Y60F75O0Shfe2Tr+FmszNef6DgBbsnhKwHchPwHU0y1zmMHwu?=
 =?us-ascii?Q?uWrROHTKbcJEfNHXVHaWNgP4KIGuxUGjL2wGe889p+BOIHc7vwiKCYz0uaEf?=
 =?us-ascii?Q?53Dz2Bq93MA0mPhuvGt3IsTbnA/QLFemh03hgkOpuOdtMfFYEVSr32AqtJb5?=
 =?us-ascii?Q?uTBWMn0mAYikh7ngYAR/TZO5o1iINc7W8Fi6Bc65McUSpHXE4D8iGEVCPoAj?=
 =?us-ascii?Q?xGtH2GdA78U28KVD5WMPznhwYwv8Euk8gxTdLm3coKUTBePAaDSTDNBObnUv?=
 =?us-ascii?Q?sFUvjbssRxhX3YX0wB4DImUrL/BEZ2JhUAnQqpLDePceSEIVv1MUVc/C5qQQ?=
 =?us-ascii?Q?hetW7AXEi5JI52POMM+RmtR/dCmzROdiQagmt02d5WyqPmU1bnvGjw7LiC/l?=
 =?us-ascii?Q?b+Aoer2PHOAVIbun4C1p157QpnMmZ+vFgV9FYSFOb0IA4wKJuWyzCmJg4YTB?=
 =?us-ascii?Q?2IDXCTewPgR9MpxJ29laziWiOLmIXHTM2FLV4JNHZIgHWUzvXInIrBn8we+7?=
 =?us-ascii?Q?dnI6p0IEjM62e+f1zm1EeVfLQYk+oMcZhwNHuwQNmGBQ66XQsdnqxEk0a14y?=
 =?us-ascii?Q?h13qnSf5SAAgNNcZkCtfQflfxIFvno34HTtIrmalFKYSTjR2dxU46LvkhPpi?=
 =?us-ascii?Q?9Ok5W4WfoGtacqC5/mdACLuTs2CC568vZYSCRudtA+ELuCMvHljD+i0yCC4I?=
 =?us-ascii?Q?jrsD/rswpviGfcwnY+jblmNxYBrmaEF46a69YYVzpaFAsz+YKgJtSfhjn73H?=
 =?us-ascii?Q?8psmuPYbXhgTcWasOkLPXpDPqq0FQe03frlbTNkEZtUZopG+gu21h60VG/2p?=
 =?us-ascii?Q?jZftATE0Psg/gXONWFp9IjYh+EFm022yb/YkdX8ewtbputNu4GjKNZeiUvp7?=
 =?us-ascii?Q?S2W+9CfAXfzVt/0QLQpQoGzQWknqmwUkH54chKIif8rz3eqTCCypO/2llJRf?=
 =?us-ascii?Q?zw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: edfb0172-a305-49da-c643-08ddcac52f3e
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2025 15:17:21.0279 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 51lcO8l54B//3HwmF+/C2qnjAEQtIGIKyYuPh3LMveIIx74/D/pyMQKY8VbPxoDJUU6bkalFwCidKa8bXmab97ZXAvnuPHw15d6k4DJhrng=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5317
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

On Tue, Jul 22, 2025 at 04:10:57PM +0200, Michal Wajdeczko wrote:
>Since device configuration using configfs could be prepared long
>time prior the driver load, add a debug log whether the current
>device driver probe is using custom or default settings.
>
>Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>---
> drivers/gpu/drm/xe/xe_configfs.c | 35 ++++++++++++++++++++++++++++++--
> drivers/gpu/drm/xe/xe_configfs.h |  2 ++
> drivers/gpu/drm/xe/xe_pci.c      |  3 +++
> 3 files changed, 38 insertions(+), 2 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
>index 36e2b45b305f..f83e8e9f070f 100644
>--- a/drivers/gpu/drm/xe/xe_configfs.c
>+++ b/drivers/gpu/drm/xe/xe_configfs.c
>@@ -118,6 +118,17 @@ static struct xe_config_device *to_xe_config_device(struct config_item *item)
> 	return container_of(to_config_group(item), struct xe_config_device, group);
> }
>
>+static void xe_config_set_defaults(struct xe_config_device *dev)
>+{
>+	dev->engines_allowed = U64_MAX;
>+	dev->survivability_mode = false;
>+}

other places here follow the file prefix, xe_configfs. I think mixing
both is confusing.

>+
>+static bool xe_config_is_default(const struct xe_config_device *dev)
>+{
>+	return dev->engines_allowed == U64_MAX && !dev->survivability_mode;

maybe have something like below would be more maintainable? We may need
to move the attribute values to an inner struct or just set the
defaults very early.

At least aligning the variables would be good. On a first read I missed
you were checking the 2 vars.

static const struct xe_config_device defaults = {
	.engines_allowed = U64_MAX,
};

static void set_defaults(struct xe_config_device *dev)
{
	*dev = defaults;
}

static bool is_default(const struct xe_config_device *dev)
{
	/*
	 * If a new attribute is added, there should be also a check for
	 * default. Assert it's not forgotten
	 */
	static_assert(ARRAY_SIZE(xe_config_device_attrs) == 3);

	return dev->engines_allowed != defaults.engines_allowed &&
	       dev->survivability_mode != defaults.survivability_mode;
}


>+}
>+
> static ssize_t survivability_mode_show(struct config_item *item, char *page)
> {
> 	struct xe_config_device *dev = to_xe_config_device(item);
>@@ -281,8 +292,7 @@ static struct config_group *xe_config_make_device_group(struct config_group *gro
> 	if (!dev)
> 		return ERR_PTR(-ENOMEM);
>
>-	/* Default values */
>-	dev->engines_allowed = U64_MAX;
>+	xe_config_set_defaults(dev);

yeah, if we keep it here I think we don't need to an inner struct.

>
> 	config_group_init_type_name(&dev->group, name, &xe_config_device_type);
>
>@@ -323,6 +333,27 @@ static struct xe_config_device *configfs_find_group(struct pci_dev *pdev)
> 	return to_xe_config_device(item);
> }
>
>+/**
>+ * xe_configfs_check_device() - Test if device was configured by configfs
>+ * @pdev: the &pci_dev device to test
>+ *
>+ * Try to find the configfs group that belongs to the specified pci device
>+ * and print a diagnostic message if found.
>+ *
>+ * Return: true if config group is found, false otherwise
>+ */
>+bool xe_configfs_check_device(struct pci_dev *pdev)
>+{
>+	struct xe_config_device *cfg = configfs_find_group(pdev);
>+
>+	if (!cfg)
>+		return false;
>+
>+	pci_dbg(pdev, "found %s settings in configfs\n",
>+		xe_config_is_default(cfg) ? "default" : "custom");
>+	return true;

return could be void.

Lucas De Marchi

>+}
>+
> /**
>  * xe_configfs_get_survivability_mode - get configfs survivability mode attribute
>  * @pdev: pci device
>diff --git a/drivers/gpu/drm/xe/xe_configfs.h b/drivers/gpu/drm/xe/xe_configfs.h
>index fb8764008089..cdccf1f9b716 100644
>--- a/drivers/gpu/drm/xe/xe_configfs.h
>+++ b/drivers/gpu/drm/xe/xe_configfs.h
>@@ -13,12 +13,14 @@ struct pci_dev;
> #if IS_ENABLED(CONFIG_CONFIGFS_FS)
> int xe_configfs_init(void);
> void xe_configfs_exit(void);
>+bool xe_configfs_check_device(struct pci_dev *pdev);
> bool xe_configfs_get_survivability_mode(struct pci_dev *pdev);
> void xe_configfs_clear_survivability_mode(struct pci_dev *pdev);
> u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev);
> #else
> static inline int xe_configfs_init(void) { return 0; }
> static inline void xe_configfs_exit(void) { }
>+static inline bool xe_configfs_check_device(struct pci_dev *pdev) { return false; }
> static inline bool xe_configfs_get_survivability_mode(struct pci_dev *pdev) { return false; }
> static inline void xe_configfs_clear_survivability_mode(struct pci_dev *pdev) { }
> static inline u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev) { return U64_MAX; }
>diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>index f4ea13527945..322dc52c4a0b 100644
>--- a/drivers/gpu/drm/xe/xe_pci.c
>+++ b/drivers/gpu/drm/xe/xe_pci.c
>@@ -17,6 +17,7 @@
>
> #include "display/xe_display.h"
> #include "regs/xe_gt_regs.h"
>+#include "xe_configfs.h"
> #include "xe_device.h"
> #include "xe_drv.h"
> #include "xe_gt.h"
>@@ -770,6 +771,8 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
> 	struct xe_device *xe;
> 	int err;
>
>+	xe_configfs_check_device(pdev);
>+
> 	if (desc->require_force_probe && !id_forced(pdev->device)) {
> 		dev_info(&pdev->dev,
> 			 "Your graphics device %04x is not officially supported\n"
>-- 
>2.47.1
>
