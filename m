Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D280C55838
	for <intel-xe@archiver.kernel.org>; Wed,  5 Aug 2026 02:08:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30A8B10E1A0;
	Wed,  5 Aug 2026 02:08:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jeAaqh3/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CF7D10E1A0
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Aug 2026 02:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785895698; x=1817431698;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=aWtyfeNkCUF5u8w7gKTYwSCiDpKAo7rAcURiKUlzonM=;
 b=jeAaqh3/1YRNxhS633b0s9HG5/dVUzMiNh13oOMicCv7+RWlIf3T5gCO
 GZori4GJ8FOFbo4OxrhOXliBbt36tx2WZxqu17X7H/0MCteZqaCQF0bdE
 bFO5lRaai6DFFCEwMRKrHrVcs2LqEFp/K3dcLMDpdxREkiTYAKKJzaN9k
 QOtROwaykkIH0jLuN6g9xahwCuKss2uMFgzyJirknGZBR+USO5tgH90SJ
 PAsZ0vzswV6XG/AJ0kxXYctDfODg1+KoajDIdIMl+4XQ9Ndo/DgGvLSpo
 3dP1xU17O0oA5VlxQB4ShOu/Gp19QjwrH/lAhzKkF6RJ3nhRDVKFz5yXo w==;
X-CSE-ConnectionGUID: tVOifOjJSUSk6je9yeUshQ==
X-CSE-MsgGUID: rmTCrGthQaaZXdpv2s1Kzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11865"; a="103996393"
X-IronPort-AV: E=Sophos;i="6.25,205,1779174000"; d="scan'208";a="103996393"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2026 19:08:15 -0700
X-CSE-ConnectionGUID: 9krH/uNQQ02rR7+MTDhFaw==
X-CSE-MsgGUID: hB2QSsyaTb2YwJfDTHy/bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,205,1779174000"; d="scan'208";a="262255292"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2026 19:08:15 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 4 Aug 2026 19:08:14 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 4 Aug 2026 19:08:14 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.0) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 4 Aug 2026 19:08:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m/XWwV5XPv8o7NXZUuNbUVogEWxdqozGKo+NGiwiSZgm0DbRtFQ0qcukiSN6JXGu4LtJetdU7czwqkrysamp4loQ1xcnjAw2RU0aQtvTqis2KMZfUr55jUK/+nLBl8JTQjrdFfU7kRZ1XGcMYS52e1W2xqvSp8SVqAlx526BqUS2nmvl2FxzgbFxtcEkD57cjggyWjZ5Apgs/44EYx7zIVGBRIaPTkM5l3EpiWcF9ACJd5MgrZz094tcbJqrrokl5JRVqdU/bq+zld42TYMK5fc7jeDczCaP/iUN1v8rwkS/D+rlGiKMh6qaR4SqN6wRtU99C8rPOfEtaQxC0y8uNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TzxfIFOrJtH0VJzArpGoUd5R9pe1EevpgbcjtLL6eE8=;
 b=NaDKQnb2t6N5yIP8zcO0vFQ/V0mdxYhzWzx3Lcf/UXttpvJBmhDrz2i2GATVhz+jkJd/4jWzhaJTf0iX+cacYGukulKxnKOlTBwQHYaSfVy1WQrxz7ENBpBJKXzYo5Ov6378q5o0NpBZJ0duMJUOgqRAJ4OZkeFP+vviBb+4jpAwlTleaZ+NWVwD+8/TQ7Gs3zHOlHkSClUxH3ln2IFq+hEL5SpoCmI7zQC4ULtOezdxVp1fPRHte4pB3fkvQCYmlxDm6vkmQgz8uLze7wToCo6W+tdcOB4Efj0jEQQ2Nm+/0ttdlqjvuOWNOGGzIgDR10jazhVnRy9Wbx8omX08sA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5073.namprd11.prod.outlook.com (2603:10b6:303:92::23)
 by SJ0PR11MB4864.namprd11.prod.outlook.com (2603:10b6:a03:2d4::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.15; Wed, 5 Aug
 2026 02:08:07 +0000
Received: from CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe]) by CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe%7]) with mapi id 15.21.0292.013; Wed, 5 Aug 2026
 02:08:07 +0000
Date: Tue, 4 Aug 2026 22:08:01 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Lin,
 Shuicheng" <shuicheng.lin@intel.com>, "Roper, Matthew D"
 <matthew.d.roper@intel.com>, "Brost, Matthew" <matthew.brost@intel.com>,
 "Wajdeczko, Michal" <michal.wajdeczko@intel.com>, "Nerlige Ramappa, Umesh"
 <umesh.nerlige.ramappa@intel.com>, "Ceraolo Spurio, Daniele"
 <daniele.ceraolospurio@intel.com>
Subject: Re: [PATCH 3/9] drm/xe: Add a new debug focused configfs group
Message-ID: <anKbATzRlRva4Bg_@intel.com>
References: <20260724202539.53850-11-stuart.summers@intel.com>
 <20260724202539.53850-14-stuart.summers@intel.com>
 <16435244665fade9cd1079386c572b0bb6edf4d7.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <16435244665fade9cd1079386c572b0bb6edf4d7.camel@intel.com>
X-ClientProxiedBy: BY3PR05CA0032.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::7) To CO1PR11MB5073.namprd11.prod.outlook.com
 (2603:10b6:303:92::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5073:EE_|SJ0PR11MB4864:EE_
X-MS-Office365-Filtering-Correlation-Id: 49769302-d46a-40bd-fb23-08def29663a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|11063799006|3023799007|56012099006|4143699003|22082099003|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info: q45AUxtpLkqgIezdrjxs365CX6cJNRMM/2lzyPrQqD/2kh+2pg3E+4nIPtazUhfUwtwszqPRmIc+mi/6OsJpRjorWG/ItlIm1+u+rdnP/U9yDaMT8OX0YXXDfI8rFYs7Hu71zNI7IeIMPRkj/1zUpfBS0YzcjSkwIEdhKsTQym7xJnBKmAWJe2ttYMWFZO7pCanq7Qy8DJyRGW32FiT2STkxez9ERDyA/GZULhIAuIOqQZHdi07D9idQmMVvcxrVvdPLjOXni+sUqprgRWec4wXEm8AhaIkxJEbLJPJHoC3AhL0MRNcHlRK+OEweuYVpX83K+ND4d5FxpqNB50sUf5Mj4Be/YdOSEhL64dpx5IaPDZEv86yTNiy203sNIp/XX11GblRGNWK38gDePODV7jaB1L3rv7qaM9LiJqH8SGquGImtM4A0v16n4eFyxAbLqqoI4uR2KMah+ofYr8n2E9HG9ZM1uybbyrM8Aijyfn8SRJVkGsk2Z9Zx7YrDhQivJrrHvMinWSLdq+BUvDsgJ4E92RL5wTR2FEDVgBOafO6lsRb2f0qE7KWpavj9ZOAYPvtmn86u8zrigRfJ5i9kqKffqEgMpO8NfcwSSnuiefg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5073.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(11063799006)(3023799007)(56012099006)(4143699003)(22082099003)(18002099003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?b9Xzu5kaZzekPlMK0Og5k2uy/g6XJ8zYOQbXvZIl8IkBWA4JMQq6rbmyQf?=
 =?iso-8859-1?Q?ZSZY74VXpKuBub4HYKo5iphBwwt9Ia7ty+94Z6MBPYeSnjWokoukDtm+tk?=
 =?iso-8859-1?Q?NJBTVGCuU3J/7AY9gHMyoPJGT2v4o3serglQMjh5olFK7uJkSstL0zf2EU?=
 =?iso-8859-1?Q?AQWJrbIfU/C8ulCBKCOwbJ1TP/Z6L0PHYbv2qfZwwVec7aByt0WLoIT5Z7?=
 =?iso-8859-1?Q?uRFzBhrQbJmNcaeiKJOHev3xMQ9GtCwAdy1SZ08n9WCJpOfupsQDkPrAE1?=
 =?iso-8859-1?Q?1aarFS7uufbPamgjZsq7UUXL6kZcg5eBFwIi4wbAiJFje2A8kvsw5xNLfi?=
 =?iso-8859-1?Q?m7SRQclU0RZ0BEfkM4Rtxsi65i24Qbkv7IAaRIir41T2vSADMUAfwe9/QD?=
 =?iso-8859-1?Q?yWiieJmxiZKsvkuFg05MjipLJ/dNXKEnnaBkumSZ21q/v3/QuM1h0poK+u?=
 =?iso-8859-1?Q?WJAxj92WI9QG37ufPM2fGMOeTiYFA//sWVdGEGoW9upmXh1mrcFAMHmCA3?=
 =?iso-8859-1?Q?auxxIEKV2LWwVoHczUomq7zu/K3/0gTuY7uUm2g9Jz1BdQUmgtAwgPPifw?=
 =?iso-8859-1?Q?sD8qN/8cZ+eRMd6ElVEaeTKtqZtUAdMRfqT80zozGpnxF0aZkLrhA8PGT3?=
 =?iso-8859-1?Q?pUU37BHlWRhTkoJwfT0RdGWwKT2FrAoUjUbaFBj7o9F5el/FQW4Wa1b9Dz?=
 =?iso-8859-1?Q?3i+YfIHXfIap0Wip34bofizKqBOFcmg6ocgHl4c554K+zoBmhgIQObhNK+?=
 =?iso-8859-1?Q?SHR8GccIkwM49NfdDiI2Co+R53bpjH3agANRxzZejgER5l3OeTSsWAHtZl?=
 =?iso-8859-1?Q?7tlsXnPSWLnv9LnJKXr1kJVKmLlhuWZfk7WChg5XVaKjT+XFVUIGdz/wv4?=
 =?iso-8859-1?Q?PtUX/uYc6UL/sh6jgRWxHtB9lxS/MvZLxsaTu6O2nud2VOVwxHQjNqZSTW?=
 =?iso-8859-1?Q?ucPFO23An8vYUlnykI7uCrx3V1dADkW4MIIYkrxCBRttdO9I6iasXf2hKx?=
 =?iso-8859-1?Q?pwleW0DGyu64IUW2ygg5pfl/fYgz3X0NVeeYFmHWJ1CoclSCiG4b9TyWSO?=
 =?iso-8859-1?Q?JrKaQRmTFUlqt6SGwv7AYK7Jhzu+h0XgWMZ9k4K9TNmmtqHH/nEEDWcDh+?=
 =?iso-8859-1?Q?r9Gcq8vNtiirSrqqz4/Slaq5+MMx6e5D2UgrXXFnXJc3V1rAbNuMVJ8yfO?=
 =?iso-8859-1?Q?vO/pXaFGWVzIdwCMBVG0zmBDzuqgs0oAKyflfNX6hD0yRCLTtmSqIbjt/C?=
 =?iso-8859-1?Q?SpUXN3Bj0mTB7MnFOuXPujq8RMJmEWe9UXoUcke6fClcCF7N14flNs40uH?=
 =?iso-8859-1?Q?A5IK+gWzHcqsU+V3JSBLWf5jiltTPp5Q2srMlp+40Rud9c3p+j+Ei4OpKE?=
 =?iso-8859-1?Q?W3xLd4NA0FWpKkx0RnzhlHqQ2Umq5AcPWidHDq8Fq30qaZT5GIsARw8xUu?=
 =?iso-8859-1?Q?aWvs7YZkqCX4HprsoB8sPXEWvc+qMJ/kpvDA20qWfu1kWxHAUAgdzPXEkR?=
 =?iso-8859-1?Q?S2zzozPxRmARbwZ8/yPHRUiYNSeYG99sX+EY6SmWDFTHlSlqNgdv6oawzs?=
 =?iso-8859-1?Q?ych+k1iqlZ7UCInBGGLsbvdk83fbDUU+azGxEiktvNQgGiwMk9xgwqPlhs?=
 =?iso-8859-1?Q?HS9C66NwE9EGKxrkDUNAdec23csIBsvMKNh63dCJaw/wzhtSLKgM2S/jDj?=
 =?iso-8859-1?Q?qjoH8Rs4pZgNCv8Iih1Gu1LoezPrX1f8JM6zaIDA6p6vk2l2QAmsqYWXP7?=
 =?iso-8859-1?Q?r0KQ94WJGsDTDvtiB823V8Je9Au0qhJxcb9VddlEZdNDgWuCmn/aY9ryia?=
 =?iso-8859-1?Q?jCsKChRS4A=3D=3D?=
X-Exchange-RoutingPolicyChecked: JA134HRUhcgbuY9rz8Gjo/bC+sa8QbDp8vLORTkZ6IooOtla/Xkg6lcJf06XmYj4lgoEB8mHtVm30XKV+thT1arRVmnlXzwkJE8hUFjXiQ5VGLh4RqJ9qHq9hyIbGrv8f4pJnXLa7MQ8C5eWurm69mXt9CNWKWbA0+s3J/lo0T4fE9KrqPIxjL7/MEm3GJT/IK9mK2Im93keCPZfUpduaxbyFcawedx9uWFzXL1S0H42o2CFEkJOxSpzmxig5JfroM0JhqDimrHtLdQuDniNzV9lFGxcVKw0NMKD+nXNJAa6k919LzOb9ZKrnBQr5zRa3obwLubJTwfiP6K+ll/Zqg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 49769302-d46a-40bd-fb23-08def29663a9
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5073.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 02:08:07.6769 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: orX32X4j0rTK2sIZKRnaRK+TTuYRFKh6EEG+yWxJxELsqZVUFrVtf0T29h9zL3bRHrI6hanLoLs+/TrbTmlP7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4864
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

On Mon, Aug 03, 2026 at 02:34:15PM -0400, Summers, Stuart wrote:
> On Fri, 2026-07-24 at 20:25 +0000, Stuart Summers wrote:
> > Add the skeleton code for a new debug specific configfs group.
> > Just add the structure for now. Actual debug content will be
> > added in a subsequent patch.
> > 
> > Signed-off-by: Stuart Summers <stuart.summers@intel.com>
> > Assisted-by: Copilot:claude-sonnet-4.6,claude-opus-4.7
> > ---
> >  drivers/gpu/drm/xe/Makefile            |  2 ++
> >  drivers/gpu/drm/xe/xe_configfs.c       |  5 +++++
> >  drivers/gpu/drm/xe/xe_configfs_debug.c | 14 ++++++++++++++
> >  drivers/gpu/drm/xe/xe_configfs_debug.h | 13 +++++++++++++
> >  drivers/gpu/drm/xe/xe_configfs_types.h |  3 +++
> >  5 files changed, 37 insertions(+)
> >  create mode 100644 drivers/gpu/drm/xe/xe_configfs_debug.c
> >  create mode 100644 drivers/gpu/drm/xe/xe_configfs_debug.h
> > 
> > diff --git a/drivers/gpu/drm/xe/Makefile
> > b/drivers/gpu/drm/xe/Makefile
> > index 67ada1d6c2fb..5765751781ae 100644
> > --- a/drivers/gpu/drm/xe/Makefile
> > +++ b/drivers/gpu/drm/xe/Makefile
> > @@ -162,6 +162,8 @@ xe-$(CONFIG_HWMON) += xe_hwmon.o
> >  
> >  xe-$(CONFIG_PERF_EVENTS) += xe_pmu.o
> >  xe-$(CONFIG_CONFIGFS_FS) += xe_configfs.o
> > +xe_debug_configfs_obj-$(CONFIG_DRM_XE_DEBUG) := xe_configfs_debug.o
> 
> @Rodrigo, in offline discussion today you had mentioned wanting this
> held under an EXPERIMENTAL kconfig. I see this is all under EXPERT
> right now (the whole CONFIG_DRM_XE_DEBUG infrastructure). Is this
> enough? Or we need to add a new kconfig explicitly under EXPERIMENTAL?

definitely enough

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

For the next patches, please take a look to Sashiko.
There seems to be some finds in some patches in this series that might
be worth to address.

The pre-existing ones can be addressed as follow ups.

https://sashiko.dev/#/patchset/20260724202539.53850-11-stuart.summers%40intel.com

Thanks,
Rodrigo.

> 
> Thanks,
> Stuart
> 
> > +xe-$(CONFIG_CONFIGFS_FS) += $(xe_debug_configfs_obj-y)
> >  
> >  # graphics virtualization (SR-IOV) support
> >  xe-y += \
> > diff --git a/drivers/gpu/drm/xe/xe_configfs.c
> > b/drivers/gpu/drm/xe/xe_configfs.c
> > index f8f9afe82488..4b92e3072d56 100644
> > --- a/drivers/gpu/drm/xe/xe_configfs.c
> > +++ b/drivers/gpu/drm/xe/xe_configfs.c
> > @@ -14,6 +14,7 @@
> >  
> >  #include "instructions/xe_mi_commands.h"
> >  #include "xe_configfs.h"
> > +#include "xe_configfs_debug.h"
> >  #include "xe_defaults.h"
> >  #include "xe_gt_types.h"
> >  #include "xe_module.h"
> > @@ -1233,6 +1234,10 @@ static struct config_group
> > *xe_config_make_device_group(struct config_group *gro
> >                 config_group_init_type_name(&dev->sriov, "sriov",
> > &xe_config_sriov_type);
> >                 configfs_add_default_group(&dev->sriov, &dev->group);
> >         }
> > +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
> > +       config_group_init_type_name(&dev->debug, "debug",
> > &xe_configfs_debug_type);
> > +       configfs_add_default_group(&dev->debug, &dev->group);
> > +#endif
> >  
> >         mutex_init(&dev->lock);
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_configfs_debug.c
> > b/drivers/gpu/drm/xe/xe_configfs_debug.c
> > new file mode 100644
> > index 000000000000..45617282cec5
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/xe_configfs_debug.c
> > @@ -0,0 +1,14 @@
> > +// SPDX-License-Identifier: MIT
> > +/*
> > + * Copyright © 2026 Intel Corporation
> > + */
> > +
> > +#include <linux/configfs.h>
> > +#include <linux/module.h>
> > +
> > +#include "xe_configfs_debug.h"
> > +#include "xe_configfs_types.h"
> > +
> > +const struct config_item_type xe_configfs_debug_type = {
> > +       .ct_owner       = THIS_MODULE,
> > +};
> > diff --git a/drivers/gpu/drm/xe/xe_configfs_debug.h
> > b/drivers/gpu/drm/xe/xe_configfs_debug.h
> > new file mode 100644
> > index 000000000000..5f938450aed2
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/xe_configfs_debug.h
> > @@ -0,0 +1,13 @@
> > +/* SPDX-License-Identifier: MIT */
> > +/*
> > + * Copyright © 2026 Intel Corporation
> > + */
> > +#ifndef _XE_CONFIGFS_DEBUG_H_
> > +#define _XE_CONFIGFS_DEBUG_H_
> > +
> > +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG) &&
> > IS_ENABLED(CONFIG_CONFIGFS_FS)
> > +struct config_item_type;
> > +extern const struct config_item_type xe_configfs_debug_type;
> > +#endif
> > +
> > +#endif /* _XE_CONFIGFS_DEBUG_H_ */
> > diff --git a/drivers/gpu/drm/xe/xe_configfs_types.h
> > b/drivers/gpu/drm/xe/xe_configfs_types.h
> > index 3be7d6160b4c..e22b9424f719 100644
> > --- a/drivers/gpu/drm/xe/xe_configfs_types.h
> > +++ b/drivers/gpu/drm/xe/xe_configfs_types.h
> > @@ -22,6 +22,9 @@ struct wa_bb {
> >  struct xe_config_group_device {
> >         struct config_group group;
> >         struct config_group sriov;
> > +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
> > +       struct config_group debug;
> > +#endif
> >  
> >         /*
> >          * Fields sorted by type (largest first) then name: struct
> > arrays,
> 
