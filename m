Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5042AC36008
	for <intel-xe@archiver.kernel.org>; Tue,  1 Apr 2025 03:26:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA86E10E033;
	Tue,  1 Apr 2025 03:26:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aImB9UAf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C3EE10E033
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Apr 2025 03:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743477975; x=1775013975;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=A1TjsGS94bMJsCUkOdHMfrwo4y4CMmFtbjtOSj2vXK0=;
 b=aImB9UAfFLbooUPoUplgJoLZhkEdmmjaWAi8QZHoyULOcyVgwG3IAHdP
 3FWWvWRJ5UQQiG5hTukWJNqlZALMYZNtifgVOGT1Omuas23OU5c7FOM2i
 DKulLyy2wyMGKDg7Ocg/OEPc5j16YfYTEBnZWN2IcM2MBjyHC+lUn2ahO
 V9RWFsE07CYbCq/OzZ0YvaAv6gNPMU+XgHENYS2fHY0UVMS/uVpPaFWRp
 I4St7r27EaCZ6ucyehQaD3PcyalD6Yw1J5dVVaToztqq11xNQc1V0QO3s
 yBGMxi1N4aA5MqHehG7nWV6PwgaAJvGaNAV7onOea56DW9wwj9IMs1Uc+ w==;
X-CSE-ConnectionGUID: JtiCrxaZSc+jOoGkIK/9tw==
X-CSE-MsgGUID: DjYTT7DSQVKBo69/qEphXA==
X-IronPort-AV: E=McAfee;i="6700,10204,11390"; a="44495810"
X-IronPort-AV: E=Sophos;i="6.14,292,1736841600"; d="scan'208";a="44495810"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2025 20:26:09 -0700
X-CSE-ConnectionGUID: 9pgxL9iNSt+ae6A0nc8mSA==
X-CSE-MsgGUID: FEK4zlORQHe0Hsc5wIfH5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,292,1736841600"; d="scan'208";a="130976975"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2025 20:26:08 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Mon, 31 Mar 2025 20:26:07 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 31 Mar 2025 20:26:07 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.171)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 31 Mar 2025 20:26:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j94OWqzCPUt9zktE6dyvTsfLjtEb/LVfxTS7B0dGwlgvbpLRxnVGIQA0CnA0yG700UY+B62VSX74TClCPnGXUJBD/Mmm/E+nDJ6c18fJ6ShPM8zquYZO1iAGGR6abPAtCK3UdYvQ6Yf7ZwZj4gByOVJNnQbRJjd+h0hCb8mt8d1SbRNoQNL0AZh2kyk/2xTrmY1ZfYb0b3MR/NcOr+0IKJGoGdN73bYFuJ9TqEB74dFlVH8tVkt6msIzq4icQCBwfO3Q69FH02oxO+S6L/zHtLmyZDkxFYzrXRzWJPlZscIhL5agxhm62AIXUEJz2Wu90lqztJaET8P3C7hTfgAg2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=te0aqPMXDszICbvTj4d3dsH+BIaBq9E+C2e8IVeaqdo=;
 b=HZ6kqZ+QU9/2Deblv5UTlpwbQPXszIY0PZ/BgJZRZyP+4vcr5qEsG30Pq9oLKW0AtursjOYezK2hXmghxwDhkcpCu/luaHTh6VUGJJibyfXG1m8UWYHLb0DGTJcrwnVjo4K+xQbfDlSd4WYdYRriGzulPbymAb9wIqgWd2QTFTueZATO5vsqjNj8ks2Z7DRqRZZs/Hxa953vLsEcUhE1gv0gThHq9qXs5z+eG7Ay3lmjJ+8lX9TPay4hvD2WQTxt6lU+Zej3n25PhvDUqZ+pBQ8CbB2/Gq6R9hCsIE/NVJjPwbqi1993g2knRI0mKxSarZKBIwpixWCxf/C/k4oFPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ1PR11MB6273.namprd11.prod.outlook.com (2603:10b6:a03:458::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Tue, 1 Apr
 2025 03:26:04 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%3]) with mapi id 15.20.8534.045; Tue, 1 Apr 2025
 03:26:04 +0000
Date: Mon, 31 Mar 2025 22:25:58 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <rodrigo.vivi@intel.com>, <matthew.d.roper@intel.com>,
 <aravind.iddamsetty@linux.intel.com>
Subject: Re: [PATCH 2/2] drm/xe: Enable configfs support for survivability mode
Message-ID: <q2ay4f47m2iw5bs6mt7w32jmqqiuvouhok4xgi2xvlivw6ize5@34fzx5s5l5mz>
References: <20250327064204.459968-1-riana.tauro@intel.com>
 <20250327064204.459968-3-riana.tauro@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250327064204.459968-3-riana.tauro@intel.com>
X-ClientProxiedBy: MW2PR2101CA0007.namprd21.prod.outlook.com
 (2603:10b6:302:1::20) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ1PR11MB6273:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ce4bd4f-a2ed-4eba-338a-08dd70cceefe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?CGYhW9CjVLUmCDd9B7W3JRSGQxSsNyMIg51bmWhqwcSf8Fq0bWZwdDZSyhGb?=
 =?us-ascii?Q?pFVTP1nVV4iO1GIXL2tg/w/KrpTo0tqXZ/M2DdHPd3abIH7/KNAHpfdYj6TJ?=
 =?us-ascii?Q?pCrjPNNVjkygAHsGAuC1PDckF3RlObfvf7QD7EpU017woTFCTofDaaBXFwA/?=
 =?us-ascii?Q?PjnScYIz33jeKCqofn0QRnv25yii+AwlmO76n/puCIv11wcYNlmXF7RisYJA?=
 =?us-ascii?Q?6e0naAgAOx9V2EFrSSytOzh0k0JZrD04wzRWzBd971xHd7qxPJX91B+M5wFb?=
 =?us-ascii?Q?70HkhcoUcqv5dny31Fkc8E1GnEbehHYld0/XvpsEW1b6QcfdUH6Q59lEwAxs?=
 =?us-ascii?Q?hifqZtoPOSDRZfnt+1vIMAv3ozh56bSAsVX6Ey3PS/bzslYOighm5LbcScp4?=
 =?us-ascii?Q?yBviggh1W+5KyWh2zg1XwMSE3PCZRdwsV3Q+rW/EaK4T1qtUq8BJ8NJJHEFr?=
 =?us-ascii?Q?oOA8Vgy7t2p/sT07BSAUWAIZgJMYFugehY82Zh7obkbO0YLvUyxnghr9xQi2?=
 =?us-ascii?Q?M/ijjsFPCxcC38RDZf8apNWPtUkl4YXX3tD0H63H98pnGVdsDzQY8nzu596T?=
 =?us-ascii?Q?KFmxMMNMzDY6v0wSchGRQmGj9D5bQ/Lpf/6ssSduF6eC8M/TPTzDkdr03lkk?=
 =?us-ascii?Q?dDzGTBMMPWWQZLkLoCwbAfgYMUmCB8Z4cbg+73FOeGchF37LXazwA6ULJ6aP?=
 =?us-ascii?Q?O4cFsrRkVYx4moPwD1MopS9juhvKaCmezAm+U3/1J3gERkUH5Eupf/4uIZJn?=
 =?us-ascii?Q?qFNziy+TpJq8Yi+cCHyTblZZtleNbLUMZoSO864LzO3CTEMfPTX7trerxV20?=
 =?us-ascii?Q?X7iJ2aO3LmXKPbij/Yz5VP8nv7Bkv4lY83tcB4nUFfipKfNlgZ6ve4nIg/ZS?=
 =?us-ascii?Q?QJvz8eTMejyRmEt0Dxq048hGoKmVxAqQI6p7evUpkGVoybGNasRb+b1Vrpwq?=
 =?us-ascii?Q?3xMrXju02Q7qerF30NSkWvHDP0yLJJRj1M++7fCNOmFVVr+kmJ+E/FXg4QTH?=
 =?us-ascii?Q?mNHniyfkS0jZ6rXgLRsVu7ROOPuJL1AxPhAso65/EVx7X9twiew0TpEST76z?=
 =?us-ascii?Q?EoFztevFRu88hTD0mB82DOnCSVdHzUl6HiSUe6dtItO5MU4czmv+xbz6KqDR?=
 =?us-ascii?Q?tucANXSrXCsHLrbTJCKmWmK6+13R3LQUgXK2OwAXWYg0HFWE8ddg3gP2SeZy?=
 =?us-ascii?Q?PEoSBNxnZLlNc6stvstt22+A4TheT/Pi7os2P2Bv5n6Fcw2MJ7M4nt/R4zbV?=
 =?us-ascii?Q?p/1/lhWtc18pGmDCwjU3CFYkTEOYdAst03BmTXllH6x+qZAFb0g0L5HVO/YW?=
 =?us-ascii?Q?yfvk6D+PR3qfIzOaHCN6mHP4LEvYq0qkB/jEOaxGHOLgt2psV+UT9IFaqLMd?=
 =?us-ascii?Q?EturkJxy+h5h2TF7bNYuNHmjinfd?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uoyHqhga22K0BcU6i7bBsGZqp/IXMuhSj7Od+q+Fu4RnwoSXuFiuZylm9Ry4?=
 =?us-ascii?Q?Nk2joNgTLPIZxL5tjUtqDP14rT/C/KBInJErOebg8wdXkbBnxmjkKz9tkbuN?=
 =?us-ascii?Q?hrFsWLf7of+ZDO/gyz/X2atuKaeayWNmpBjJAhXlh8kXoVAbMAp89bf78dS+?=
 =?us-ascii?Q?2B0nTbIKEmEbzYjimOIj7yULXnpT6TNfUy0I3LS1X1DvSsNqAKV5r0WVkzri?=
 =?us-ascii?Q?9Ye39/xqDOKrsdAStRYsNU99RtTuElf7sH4Qp3ykm4wwHXHxctc1JEyO23q6?=
 =?us-ascii?Q?LDOI+xos93T4a8zksgx1wrjKQOiDdFcyll0VxNQ0+/1IOHOTGMofvCy8m5Pl?=
 =?us-ascii?Q?tSN1Ix0IPr76OYLCkQo7+fkyL3mOEQ76b6SYdQzOfR9NAuR59hq2aDEQKc1u?=
 =?us-ascii?Q?OOQ1V0mhlY7+NQZmadlo5Dt5wWwS5t1cXWQIZfIxLXwUT2ELEGUGraT9kBFo?=
 =?us-ascii?Q?BoZDCE8mHQZn7jJu68IKIeVzHTRTJPBdZsqfnQxoYD0k7KUTljw+mJiRDwJx?=
 =?us-ascii?Q?bHhUb+XfdR+Y71yX2LGgoC1uRIwmXo4Jrjm/axUSgPI9dt7C/gMfezOxCAuT?=
 =?us-ascii?Q?DOahcJjEHHUpTwT4uYQnhPYVfTsNJkLDbYHRGDyuMDBusV1o/udDbKVL4suW?=
 =?us-ascii?Q?qMRh7+vzioN+Qzi1SRZ0p5cgnPolF6PNtFUSjrth13pZdwWswxjD3wJwtcCR?=
 =?us-ascii?Q?Y8CEz+4I1Qx1kzvxgeVD40qGQbOWoDuAqB2ixJU3IJltlZPqfcNADoF/Fazb?=
 =?us-ascii?Q?PMNcjlNX7rLeRP7Gah7Zt8+yPYDAlOUJEfN/HToLmhjJkOrMbxlMSv3FzEiY?=
 =?us-ascii?Q?aE89BWpU+duA6U8XkDj0IBpTX48ffkc/yuNqQJBnuawNKERMqwzX5vEgvHe3?=
 =?us-ascii?Q?8RLt7aut5dAsXRp4NUJHaHNUHW1WyOC7Hu/4wyiQ+TyKe9AsRfxmTJHOguVn?=
 =?us-ascii?Q?wzC8PR+1XEPJtPtYOelR64wqLlQxXKGF/FPQc4y1z1wENd3XX/d2MV+c4Wi1?=
 =?us-ascii?Q?LmlyxW4WYyJsxg6zjfuvUEnfpZGHn3J5EW3v3XP65Tb30QEhXspGPlTM/Rwx?=
 =?us-ascii?Q?OwbBbP3IvcIoNr/eMg98ELwLIMGeFpQvgDf6Rzk3nfbM5Cf1cmX9srdWCIn7?=
 =?us-ascii?Q?DpYarXoyIDL46DCNsv0vVNeNjMAxNcl4dCA1g5MMISIW8f3erImGlu5iJKMy?=
 =?us-ascii?Q?e192h++VYAEQu+6NW7nYhZDNOdbI9Uq4+A0UskNGGjWR45CCyKNTif5gpmVv?=
 =?us-ascii?Q?IFo5ex9oE8oBf1V9XLTe5YOuQsVLWZgmXFzEUVpuzImjRjuCxJLfhCCNZLcC?=
 =?us-ascii?Q?Zf31DCaqxeY45QqvhX/LAXgqObbgAlrGy+KTViMCjDvvDzJfYitxeIndaKmN?=
 =?us-ascii?Q?pAa3i6mGLZk2vF9IrLNmhrpbQeJsE2wrwICjoDnFkzgTYZrNpKxTdvCDNkNw?=
 =?us-ascii?Q?QLKUKEjo9xA5xLN6bOzoMlx4SsiH/PDs6vr1oj1dakBzkbFpzRyA+0AG9oAf?=
 =?us-ascii?Q?hXtiOX91g5+IxB/JK54vShOv4SlyIgqVt4q6dz2NEQTFnzxmWG3gv24B+D/j?=
 =?us-ascii?Q?4SqJm4wQuR607dPGZls/4k+kY9ODUXgXh2rNemUAnhQkDE9olF5Uoqr/sU9b?=
 =?us-ascii?Q?ew=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ce4bd4f-a2ed-4eba-338a-08dd70cceefe
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2025 03:26:04.3827 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lq8OY6glQPFLK9VJE92VEoMNXtzHRNOYIQ+nIgJONMreMLKgCxuDIEd6SoWdCPrMceeus4lLkt5lWM1lkW7ByQlfSc+FeBFLMa6CONuAHUo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6273
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

On Thu, Mar 27, 2025 at 12:12:02PM +0530, Riana Tauro wrote:
>Enable survivability mode if supported and configfs attribute is set.
>Enabing survivability mode manually is useful in cases where pcode does
>not detect failure, validation and for IFR (in-field-repair).
>
>To set configfs survivability mode attribute for a device
>
>mkdir /config/xe/0000:03:00.0
>echo 0000:03:00.0 > /sys/bus/pci/drivers/xe/unbind
>echo 1 > /config/xe/0000:03:00.0/survivability_mode
>echo 0000:03:00.0 > /sys/bus/pci/drivers/xe/bind
>
>The card enters survivability mode if supported

this part is repeated in commit 1 and 2. You could leave the generic
part with survivability_mode as the example in commit 1. Here you just
mentioned setting survivability_mode to 1.

>
>Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>---
> drivers/gpu/drm/xe/xe_configfs.c           | 62 ++++++++++++++++++++++
> drivers/gpu/drm/xe/xe_configfs.h           |  7 ++-
> drivers/gpu/drm/xe/xe_device.c             |  2 +-
> drivers/gpu/drm/xe/xe_pci.c                | 19 ++++---
> drivers/gpu/drm/xe/xe_survivability_mode.c | 39 ++++++++++----
> drivers/gpu/drm/xe/xe_survivability_mode.h |  2 +-
> 6 files changed, 109 insertions(+), 22 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
>index 59e1bc4c5f76..57234904c061 100644
>--- a/drivers/gpu/drm/xe/xe_configfs.c
>+++ b/drivers/gpu/drm/xe/xe_configfs.c
>@@ -151,6 +151,68 @@ static struct configfs_subsystem xe_configfs = {
> 	},
> };
>
>+static struct xe_config_device *configfs_find_group(struct pci_dev *pdev)
>+{
>+	struct config_item *item;
>+	char name[64];
>+
>+	snprintf(name, sizeof(name), "%04x:%02x:%02x.%x", pci_domain_nr(pdev->bus),
>+		 pdev->bus->number, PCI_SLOT(pdev->devfn), PCI_FUNC(pdev->devfn));
>+
>+	mutex_lock(&xe_configfs.su_mutex);
>+	item = config_group_find_item(&xe_configfs.su_group, name);
>+	mutex_unlock(&xe_configfs.su_mutex);
>+
>+	if (!item)
>+		return NULL;
>+
>+	return to_xe_config_device(item);
>+}
>+
>+/**
>+ * xe_configfs_get_survivability_mode - get configfs survivability mode attribute
>+ * @pdev: pci device
>+ *
>+ * find the configfs group that belongs to the pci device and return
>+ * the survivability mode attribute
>+ *
>+ * Return: survivability mode if config group is found, false otherwise
>+ */
>+bool xe_configfs_get_survivability_mode(struct pci_dev *pdev)
>+{
>+	struct xe_config_device *dev = configfs_find_group(pdev);
>+	bool mode;
>+
>+	if (!dev)
>+		return false;
>+
>+	mode = dev->survivability_mode;
>+	config_item_put(&dev->group.cg_item);
>+
>+	return mode;
>+}
>+
>+/**
>+ * xe_configfs_clear_survivability_mode - clear configfs survivability mode attribute
>+ * @pdev: pci device
>+ *
>+ * find the configfs group that belongs to the pci device and clear survivability
>+ * mode attribute
>+ */
>+void xe_configfs_clear_survivability_mode(struct pci_dev *pdev)
>+{
>+	struct xe_config_device *dev = configfs_find_group(pdev);
>+
>+	if (!dev)
>+		return;
>+
>+	mutex_lock(&dev->lock);
>+	dev->survivability_mode = 0;
>+	mutex_unlock(&dev->lock);
>+
>+	config_item_put(&dev->group.cg_item);
>+}
>+
> int __init xe_configfs_init(void)
> {
> 	struct config_group *root = &xe_configfs.su_group;
>diff --git a/drivers/gpu/drm/xe/xe_configfs.h b/drivers/gpu/drm/xe/xe_configfs.h
>index 2c30be9a2c7e..6e8c5ccaf202 100644
>--- a/drivers/gpu/drm/xe/xe_configfs.h
>+++ b/drivers/gpu/drm/xe/xe_configfs.h
>@@ -5,7 +5,12 @@
> #ifndef _XE_CONFIGFS_H_
> #define _XE_CONFIGFS_H_
>
>+#include <linux/types.h>
>+
>+struct pci_dev;
>+
> int xe_configfs_init(void);
> void xe_configfs_exit(void);
>-
>+bool xe_configfs_get_survivability_mode(struct pci_dev *pdev);
>+void xe_configfs_clear_survivability_mode(struct pci_dev *pdev);
> #endif
>diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>index 1ffb7d1f6be6..f4e59577ddc0 100644
>--- a/drivers/gpu/drm/xe/xe_device.c
>+++ b/drivers/gpu/drm/xe/xe_device.c
>@@ -712,7 +712,7 @@ int xe_device_probe_early(struct xe_device *xe)
> 	sriov_update_device_info(xe);
>
> 	err = xe_pcode_probe_early(xe);
>-	if (err) {
>+	if (err || xe_survivability_mode_requested(xe)) {
> 		int save_err = err;
>
> 		/*
>diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>index da384acf731f..bcacfa78afd1 100644
>--- a/drivers/gpu/drm/xe/xe_pci.c
>+++ b/drivers/gpu/drm/xe/xe_pci.c
>@@ -812,18 +812,17 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
> 		return err;
>
> 	err = xe_device_probe_early(xe);
>-	if (err) {
>-		/*
>-		 * In Boot Survivability mode, no drm card is exposed and driver
>-		 * is loaded with bare minimum to allow for firmware to be
>-		 * flashed through mei. If early probe failed, but it managed to
>-		 * enable survivability mode, return success.
>-		 */
>-		if (xe_survivability_mode_is_enabled(xe))
>-			return 0;
>+	/*
>+	 * In Boot Survivability mode, no drm card is exposed and driver
>+	 * is loaded with bare minimum to allow for firmware to be
>+	 * flashed through mei. Return success, if survivability mode
>+	 * is enabled due to pcode failure or configfs being set
>+	 */
>+	if (xe_survivability_mode_is_enabled(xe))
>+		return 0;
>
>+	if (err)
> 		return err;
>-	}
>
> 	err = xe_info_init(xe, desc);
> 	if (err)
>diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
>index cb813b337fd3..ed6599c5b85d 100644
>--- a/drivers/gpu/drm/xe/xe_survivability_mode.c
>+++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
>@@ -10,6 +10,7 @@
> #include <linux/pci.h>
> #include <linux/sysfs.h>
>
>+#include "xe_configfs.h"
> #include "xe_device.h"
> #include "xe_gt.h"
> #include "xe_heci_gsc.h"
>@@ -28,8 +29,12 @@
>  * This is implemented by loading the driver with bare minimum (no drm card) to allow the firmware
>  * to be flashed through mei and collect telemetry. The driver's probe flow is modified
>  * such that it enters survivability mode when pcode initialization is incomplete and boot status
>- * denotes a failure. The driver then  populates the survivability_mode PCI sysfs indicating
>- * survivability mode and provides additional information required for debug
>+ * denotes a failure. Survivability mode can also be enabled manually by setting the

I think this should start a new paragraph.

>+ * survivability_mode attribute of the device in xe configfs. This is useful in cases where pcode
>+ * does not detect failure, IFR (in-field-repair) use cases where the repair can be performed for
>+ * a single GPU card without impacting the usage of other cards in the same node and for validation.

I'm missing a verb in in this phrase

>+ * The driver then populates the survivability_mode PCI sysfs indicating survivability mode and
>+ * provides additional information required for debug
>  *
>  * KMD exposes below admin-only readable sysfs in survivability mode
>  *
>@@ -42,6 +47,15 @@
>  *			      Overflow Information   - Provides history of previous failures
>  *			      Auxiliary Information  - Certain failures may have information in
>  *						       addition to postcode information
>+ *
>+ * Enable survivability mode through configfs
>+ *
>+ * Create device directory	: mkdir /config/xe/0000:03:00.0
>+ * Unbind			: echo 0000:03:00.0 > /sys/bus/pci/drivers/xe/unbind
>+ * Enable survivability mode	: echo 1 > /config/xe/0000:03:00.0/survivability_mode
>+ * Bind				: echo 0000:03:00.0 > /sys/bus/pci/drivers/xe/bind

ditto about alignment and unbind.

I didn't check how the html gets rendered though.

>+ *
>+ * The card enters survivability mode if supported
>  */
>
> static u32 aux_history_offset(u32 reg_value)
>@@ -133,6 +147,7 @@ static void xe_survivability_mode_fini(void *arg)
> 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> 	struct device *dev = &pdev->dev;
>
>+	xe_configfs_clear_survivability_mode(pdev);
> 	sysfs_remove_file(&dev->kobj, &dev_attr_survivability_mode.attr);
> }
>
>@@ -186,24 +201,30 @@ bool xe_survivability_mode_is_enabled(struct xe_device *xe)
> 	return xe->survivability.mode;
> }
>
>-/*
>- * survivability_mode_requested - check if it's possible to enable
>- * survivability mode and that was requested by firmware
>+/**
>+ * xe_survivability_mode_requested - check if it's possible to enable survivability
>+ *				     mode that was requested by firmware or userspace
>+ * @xe: xe device instance
>  *
>- * This function reads the boot status from Pcode.
>+ * This function reads configfs and  boot status from Pcode.
>  *
>  * Return: true if platform support is available and boot status indicates
>- * failure, false otherwise.
>+ * failure or if survivability mode is requested, false otherwise.
>  */
>-static bool survivability_mode_requested(struct xe_device *xe)
>+bool xe_survivability_mode_requested(struct xe_device *xe)
> {
> 	struct xe_survivability *survivability = &xe->survivability;
> 	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
>+	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> 	u32 data;
>
> 	if (!IS_DGFX(xe) || xe->info.platform < XE_BATTLEMAGE || IS_SRIOV_VF(xe))
> 		return false;
>
>+	/* Enable survivability mode if set via configfs */
>+	if (xe_configfs_get_survivability_mode(pdev))
>+		return true;
>+
> 	data = xe_mmio_read32(mmio, PCODE_SCRATCH(0));
> 	survivability->boot_status = REG_FIELD_GET(BOOT_STATUS, data);
>
>@@ -226,7 +247,7 @@ int xe_survivability_mode_enable(struct xe_device *xe)
> 	struct xe_survivability_info *info;
> 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>
>-	if (!survivability_mode_requested(xe))
>+	if (!xe_survivability_mode_requested(xe))
> 		return 0;
>
> 	survivability->size = MAX_SCRATCH_MMIO;
>diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.h b/drivers/gpu/drm/xe/xe_survivability_mode.h
>index d7e64885570d..70eaf56fb3bb 100644
>--- a/drivers/gpu/drm/xe/xe_survivability_mode.h
>+++ b/drivers/gpu/drm/xe/xe_survivability_mode.h
>@@ -12,5 +12,5 @@ struct xe_device;
>
> int xe_survivability_mode_enable(struct xe_device *xe);
> bool xe_survivability_mode_is_enabled(struct xe_device *xe);
>-
>+bool xe_survivability_mode_requested(struct xe_device *xe);

keep empty line here and probably use _is_requested to be similar to the
enabled case.

Just a few nits.. From my tests today it appears to be working fine on
BMG. Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks
Lucas De Marchi

> #endif /* _XE_SURVIVABILITY_MODE_H_ */
>-- 
>2.47.1
>
