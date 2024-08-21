Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D87DC52D7C
	for <intel-xe@archiver.kernel.org>; Wed, 21 Aug 2024 19:39:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C65510E6B1;
	Wed, 21 Aug 2024 19:39:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VT0Txbkk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4989310E6BB
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Aug 2024 19:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724269155; x=1755805155;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=VMe9au8n3q25DyhcBe6C9u3gvdJXfbXiak1pzTo4b20=;
 b=VT0Txbkk9juPonAGAeWF1ZtqvjNyP013wxDrOuEkWe9Deo69c5/N7xcp
 iGGfgYkxeFndUiQxU/yKdf5F3tdzjluGyqzMhgtGPumwj797GylTS20Pf
 8bLd94E01OV4VqRJA5dn0EuJwzfiF6w120r+V+ecwrYarf+FwNrYkzWFD
 wmO7BRAvD99fldtuhkJ5i0dSoHhu6730z76VO3GZyTJAa90iQBhj0aXFL
 HUuDnjquQTCNIXBJgQQrSzscWQHtd1OODJy1poUr/6GPnMV9MvFBAfbml
 RmlG2sT6WZ6LVJfQ+lglJkn6tkgwM8sH+meDvAy73gMIIJ+F4MCpxzoPe Q==;
X-CSE-ConnectionGUID: EHKsn6p9QTydnhVtRkQRBg==
X-CSE-MsgGUID: 06mARVQcTVyqdRU1oeDQeg==
X-IronPort-AV: E=McAfee;i="6700,10204,11171"; a="48048152"
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; d="scan'208";a="48048152"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2024 12:39:15 -0700
X-CSE-ConnectionGUID: 5x9PI8POQRy06j4EAZgJHw==
X-CSE-MsgGUID: KcthZg34QUuOtveM1ob74A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; d="scan'208";a="61191382"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Aug 2024 12:39:15 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 21 Aug 2024 12:39:14 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 21 Aug 2024 12:39:14 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 21 Aug 2024 12:39:14 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.42) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 21 Aug 2024 12:39:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yCnV/QmUFrrmZmLoHKqEX76Wtq80XEB+jZ8mMEiVXLn3pSZwT6K1qsA/esGOs41ynxWYva4dCDRG1d+KYIS/X7vcZPzyhFu3/27Zpa4nX2BPNxdfgzT3UMlyz7vBtdbCANiAeIrK21Jstp10XV6w3Z8prvie9pTY4+e4bgVOCovcO/sS3sWp2+Q61e5/hXKOMQ00uiPsJe8zt25GSDSFHGz1l3Z5RZ7nHMKkwdzQnSP1ISNroYVn4ijXbLwHCU0XXpdaVc2rFyeeWMKvdx1QRlMP5EauBMK0aIH5bAVFumkauxFEG2XAWSTzweFaH1LlqSWoDntYyf6WtcIGRj111w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CQQv7zOw1oeKgZ3MvbNueK5Q94B7nm4Z94VYgdaEn68=;
 b=WLqXH2KbBNXZWwbkI6qPajrvsXZjhQ68bMILEZjr5nB9u48p0woei8TjovRWPOQfV2WP6xlPO5c0I4m2ToEUQ/gbQNeWwRpUI85/VixI2t3DLEhdFP2NaM+RChDai4iv1cX2QWis3KC+Q45GmLSnVHfuITmOuWHqejnGeb7Vql1JQ3DBGrLchSiHudMw6Ya5PWEAfkZhADkDfOwsLurHU8QMXoiVS22WccPGY6EAUlAeaYRcrezIstFPMp2LfVKLiAzwIev8FhHAP0fj/DEmpEAxfQpv/4/P6fWYEI7TJBEhowIvT1igZKLhsanFRvDYzHBlI/mYbaPh6yrqnMDQ1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by PH0PR11MB4790.namprd11.prod.outlook.com (2603:10b6:510:40::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.16; Wed, 21 Aug
 2024 19:39:11 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7875.019; Wed, 21 Aug 2024
 19:39:11 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: <lucas.demarchi@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Matthew
 Auld <matthew.auld@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>, 
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH 11/12] drm/xe: Make xe_ggtt_node struct independent
Date: Wed, 21 Aug 2024 15:38:41 -0400
Message-ID: <20240821193842.352557-11-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240821193842.352557-1-rodrigo.vivi@intel.com>
References: <20240821193842.352557-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DS7PR06CA0023.namprd06.prod.outlook.com
 (2603:10b6:8:2a::14) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|PH0PR11MB4790:EE_
X-MS-Office365-Filtering-Correlation-Id: dcd2f219-b655-4f2f-5a21-08dcc218ee2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?HG+oHwutN5tCUfpzMaaTKwdzcFHTVtjpvpuCKrsMWk4DSZDhVHXlpqr6giNL?=
 =?us-ascii?Q?iSls/5+pLyJqD+rxb4D4lHWqWSWjczwPHKw+7TBkHFzLPJeMRtpTmfxVw49x?=
 =?us-ascii?Q?AeulTCUFxFTtpVuKf/TrQv8ElQO0TKOclztxDG1gacBtZvBg5PPqx3cad02G?=
 =?us-ascii?Q?i/+PKG+u4OgIkDZ+bwEKhs+wQq9QdWZpeccK9uAfrzx3VnZ6tuZwL1pztOQF?=
 =?us-ascii?Q?ZmtIbzc9FaQkV4DIlJf6kvQhnkTpl8vDpxvn+uJTPQoJw/On/ojXqjuL6agZ?=
 =?us-ascii?Q?EhDIrhxCfDj//uvZ+jpyhoBcwbKoTi8AdUogadRM/xKhihzeeDURyXYyTiqi?=
 =?us-ascii?Q?nlaT9Cvhcik/7Hgf3YYdRDuAYB7d3cZUNuSzGIhmAVj5LTZHART5e+KBM8Fg?=
 =?us-ascii?Q?a7APg4G4bdCzbyehJjP6z4mhx3wLcP0BEqlrZ7xZYpwNBopmWpMRyxk/pIL9?=
 =?us-ascii?Q?F/AN743gIDAZJFOtqqPKEJ8uCLKJo+h/TOfMz6KNZds8oVjxMrSVvkF5hZ52?=
 =?us-ascii?Q?tMeZhAPIbanoR4B8ysOXcR8EidHlAtnijXW9icmVI2X/wFJLIbmBFOvcvdv6?=
 =?us-ascii?Q?KuT+bVFFDrFHjXD43IBAFj+wyQdj7m+fYLJqabg+O+NCqdiUe26hpClXb6o6?=
 =?us-ascii?Q?mkaA4g61REIOYWsvbB7hi0lRtWBVrbKA4c09LuE/kMTdpJQLSW22+cSC1KT/?=
 =?us-ascii?Q?GS7Wl5O7jJgV4jX9roWCny6iJ7UpC4Gfre8RUXee7ER5/A3IovwMJgQgti0r?=
 =?us-ascii?Q?EfukcEQRfdWAkB4/e++dECxAZ4H/987awdXxOr7fDWpb2znQXLDpcpM4PwyV?=
 =?us-ascii?Q?t5ZHJyx7hyQRZn7dlt9FwYIPIJ70D0vKk42UMRCoOHKM66ADYS3VG9gLyHlq?=
 =?us-ascii?Q?Kbtzeif2Tlqo/CFRQQoFoGQmTS0jOw6VZPrYRCYW+clrEh0/NIqHmeYCtyb1?=
 =?us-ascii?Q?NtmyrAjLvHJW5BT4Lxk2A+2l5dFi8fwMzjNgWkEV38mXphIj2F5REFoOa7ss?=
 =?us-ascii?Q?R4PkMQqGkR5M4RDAYX0hHhjsajtY50HC2DXsLEt1XmHTN2e+RUkVBGjAzm4n?=
 =?us-ascii?Q?roldiCaF21ae/h2UStqRluyKDoWOXebdpDq5m108sBUKAyxFsLfyUq3WRD7I?=
 =?us-ascii?Q?3Wy3fAdxbP5dYsAwYEbjjn7s9FdWIjeVZhlzYIOonK1MjU/ks3hnoy0xSVhY?=
 =?us-ascii?Q?8PGrm0DWeldlqGNvAsYdfkLToFXTefbhmqa5bWJkrTQg2xnXGEMJ2/Arc5/U?=
 =?us-ascii?Q?vCuo9BcStNHb00KusPr5If40eZ8FRSlpMqYr92pNLm8S9nAqDhFuRJdtBAkU?=
 =?us-ascii?Q?P7JKf0eQ5z7jI8Hx+Avr3vqVNLQsACNC2FWVctfqoajznQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jaXLbNzRa6fz+yLJKmFM2sp1Qm61DsIjr+EUKoaU8c8nVBAskpTk5gL1bgn+?=
 =?us-ascii?Q?GBHOwDfU8H1dx1aVO4yTpA5aSSE2aQl9VN8V7ezJ0dPLMMDPnZyFEGo9L81Q?=
 =?us-ascii?Q?FAHn1W67sekAFrlrYB08sbhnOOj7fC2E9CE2WPvnMq/IVf64qt4wbWE6dZQ2?=
 =?us-ascii?Q?HlvkhGIQKETxRg8nwT2BRMpykVHCuZibxz9Ffg0ZCQ1RjSXGrQAVhNA4VgBe?=
 =?us-ascii?Q?NcmzDndgJSbqopFID4PrXYAzFARKBW8yuTvv2on4iH22P/rsfVcXgLrgu25p?=
 =?us-ascii?Q?jcdbluWpSKC1v4OcL3g/vlZWUo9AOI70Zj1LC5XkBFzj51DiSHJ1oe8yfMRs?=
 =?us-ascii?Q?jj77CGZtPlDTs2m9CSsGNLJ233HiEWxyUbkuTj8uKw9frwPUFhm6PIoqpA4T?=
 =?us-ascii?Q?NNPszFCO5a9OXa031AwbibrE6plxX6GNIVHfGFeRPXG1r5Im6gLWqukMkDbd?=
 =?us-ascii?Q?KooE/sbdh2PbVAw/bXvM19hMCj7HUy/EwSzSTKkg4qB0+Hb3Re1AxZkFDvBo?=
 =?us-ascii?Q?kppYOpOYLrXTQ5E7b7zu0V+ELeCsx2joperu4PlaWDLoO4fly+vd2DCfUUb5?=
 =?us-ascii?Q?0/M8hIDntjpPnztE3+QfvvvpqzwNPFHLwvG6lxyH4Db3WF5SmDvwlAFzj7KY?=
 =?us-ascii?Q?//YqG8mRNNg+ZBMNWzhT+Ajooaz2MwI8dSVHYB/gCCHfqVoOh0ZHl16oyx3j?=
 =?us-ascii?Q?Gq51PvGWyAFVZfSzPrCh6Y0hv5lJXsXKN4MG6nRJfQWrSFUocDL/SzwS6SzH?=
 =?us-ascii?Q?rKqLUOGX1uDpMppZa8jH4WJL9eOm/8IPlLYh3aWYBTouFokBLSb+3U6fX4X7?=
 =?us-ascii?Q?AxGigMwzcTRkpqGbdDPtNxRzr4PWK6jJrulzhSKPl3LKsdpfQZ0IYa6jUBlp?=
 =?us-ascii?Q?aUArgurWatOhEGtanhJZQE60+pbxHbFWMgDnb6bFOzv3j3V12QfBBspZynS9?=
 =?us-ascii?Q?sK3eDYDCXKc4fGB4C0v75z9S/BWEintL+4kJz5D17QfcxpO5tytKt0OKLCkI?=
 =?us-ascii?Q?P/vcRH0QKrmfrt3pnzw5d46RlMRnKYL8sysKBNrS6hCSzcpkdGDiPM1dewm1?=
 =?us-ascii?Q?YL2jlsZ+WJiN2L+3Hfj1JfgbhAc45WAsgwvvxtlXxNXZu2NUYvaTKzQBfJ6Z?=
 =?us-ascii?Q?ZRY7Mp2HCzmy4a7UZDsEZnOGId8Mu7Vk40fbDYDeJ4RHCYOl22oUJ2AIsbFl?=
 =?us-ascii?Q?phOa1ZFt3bj8Muz4M5xDMJkS83Yz1lCC4HZIYVcTYj/drdj7W9m3o0zzL99q?=
 =?us-ascii?Q?XH2QQaieR9MLiWA2PTvRAYxzYluKvv4rFmeT/8m8Z6SR6SRsffUh4Ii/ZyLE?=
 =?us-ascii?Q?RzbrJxTl5xiJEaP9+y+2Hi4uWXCn9pZjKH244KfmWP4l8mD8dt8KMyjWRtko?=
 =?us-ascii?Q?StzszHfMGedgMFzs7iZFIZvGqeaaWT2gTUIpdZNkNN6jbq7BoDVqAiZt+Kdu?=
 =?us-ascii?Q?RQzI+w6Mswc1Ud3zfNJ5o7KdYQK1DypahwgOIdjb7PU/SkkWv/dxSvDUXz/w?=
 =?us-ascii?Q?2MROpm+MdoerDvn4WeX2GiDN5cPn86/Mk0jPqUhHurZWHOTuOfN9y1RhRBsv?=
 =?us-ascii?Q?KcKpS9H6hWZPjlvV7zNEaAhWXYBodzroeeNCsT0+Fv8PI5W5xNOTYlJkFrWd?=
 =?us-ascii?Q?xw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dcd2f219-b655-4f2f-5a21-08dcc218ee2e
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2024 19:39:11.4470 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nHfvNx2gPexiTkQCWAEnRRu3tSG47qr8h0qX55veOw2tQDxTEEhuuQSKUV074Bs9aPq0gqCQRS1KL69ZqaeaUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4790
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

In some rare cases, the drm_mm node cannot be removed synchronously
due to runtime PM conditions. In this situation, the node removal will
be delegated to a workqueue that will be able to wake up the device
before removing the node.

However, in this situation, the lifetime of the xe_ggtt_node cannot
be restricted to the lifetime of the parent object. So, this patch
introduces the infrastructure so the xe_ggtt_node struct can be
allocated in advance and freed when needed.

By having the ggtt backpointer, it also ensure that the init function
is always called before any attempt to insert or reserve the node
in the GGTT.

v2: s/xe_ggtt_node_force_fini/xe_ggtt_node_fini and use it
    internaly (Brost)
v3: - Use GF_NOFS for node allocation (CI)
    - Avoid ggtt argument, now that we have it inside the node (Lucas)
    - Fix some missed fini cases (CI)
v4: - Fix SRIOV critical case where config->ggtt_region was
      lost (Michal)
    - Avoid ggtt argument also on removal (missed case on v3) (Michal)
    - Remove useless checks (Michal)
    - Return 0 instead of negative errno on a u32 addr. (Michal)
    - s/xe_ggtt_assign/xe_ggtt_node_assign for coherence, while we
      are touching it (Michal)
v5: - Fix VFs' ggtt_balloon

Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 .../gpu/drm/xe/compat-i915-headers/i915_vma.h |   4 +-
 drivers/gpu/drm/xe/display/xe_fb_pin.c        |  39 +++--
 drivers/gpu/drm/xe/xe_bo.c                    |   2 +-
 drivers/gpu/drm/xe/xe_bo.h                    |   9 +-
 drivers/gpu/drm/xe/xe_bo_types.h              |   2 +-
 drivers/gpu/drm/xe/xe_device_types.h          |   2 +-
 drivers/gpu/drm/xe/xe_ggtt.c                  | 140 +++++++++++++-----
 drivers/gpu/drm/xe/xe_ggtt.h                  |  17 +--
 drivers/gpu/drm/xe/xe_ggtt_types.h            |   8 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    |  47 +++---
 .../gpu/drm/xe/xe_gt_sriov_pf_config_types.h  |   2 +-
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c           |  46 +++---
 12 files changed, 214 insertions(+), 104 deletions(-)

diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_vma.h b/drivers/gpu/drm/xe/compat-i915-headers/i915_vma.h
index 3028ac1ba72f..bdae8392e125 100644
--- a/drivers/gpu/drm/xe/compat-i915-headers/i915_vma.h
+++ b/drivers/gpu/drm/xe/compat-i915-headers/i915_vma.h
@@ -20,7 +20,7 @@ struct xe_bo;
 
 struct i915_vma {
 	struct xe_bo *bo, *dpt;
-	struct xe_ggtt_node node;
+	struct xe_ggtt_node *node;
 };
 
 #define i915_ggtt_clear_scanout(bo) do { } while (0)
@@ -29,7 +29,7 @@ struct i915_vma {
 
 static inline u32 i915_ggtt_offset(const struct i915_vma *vma)
 {
-	return vma->node.base.start;
+	return vma->node->base.start;
 }
 
 #endif
diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index de4930b67a29..d650c5ac41a4 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -204,20 +204,28 @@ static int __xe_pin_fb_vma_ggtt(const struct intel_framebuffer *fb,
 	if (xe_bo_is_vram(bo) && ggtt->flags & XE_GGTT_FLAGS_64K)
 		align = max_t(u32, align, SZ_64K);
 
-	if (bo->ggtt_node.base.size && view->type == I915_GTT_VIEW_NORMAL) {
+	if (bo->ggtt_node && view->type == I915_GTT_VIEW_NORMAL) {
 		vma->node = bo->ggtt_node;
 	} else if (view->type == I915_GTT_VIEW_NORMAL) {
 		u32 x, size = bo->ttm.base.size;
 
-		ret = xe_ggtt_node_insert_locked(ggtt, &vma->node, size, align, 0);
-		if (ret)
+		vma->node = xe_ggtt_node_init(ggtt);
+		if (IS_ERR(vma->node)) {
+			ret = PTR_ERR(vma->node);
 			goto out_unlock;
+		}
+
+		ret = xe_ggtt_node_insert_locked(vma->node, size, align, 0);
+		if (ret) {
+			xe_ggtt_node_fini(vma->node);
+			goto out_unlock;
+		}
 
 		for (x = 0; x < size; x += XE_PAGE_SIZE) {
 			u64 pte = ggtt->pt_ops->pte_encode_bo(bo, x,
 							      xe->pat.idx[XE_CACHE_NONE]);
 
-			ggtt->pt_ops->ggtt_set_pte(ggtt, vma->node.base.start + x, pte);
+			ggtt->pt_ops->ggtt_set_pte(ggtt, vma->node->base.start + x, pte);
 		}
 	} else {
 		u32 i, ggtt_ofs;
@@ -226,11 +234,19 @@ static int __xe_pin_fb_vma_ggtt(const struct intel_framebuffer *fb,
 		/* display seems to use tiles instead of bytes here, so convert it back.. */
 		u32 size = intel_rotation_info_size(rot_info) * XE_PAGE_SIZE;
 
-		ret = xe_ggtt_node_insert_locked(ggtt, &vma->node, size, align, 0);
-		if (ret)
+		vma->node = xe_ggtt_node_init(ggtt);
+		if (IS_ERR(vma->node)) {
+			ret = PTR_ERR(vma->node);
+			goto out_unlock;
+		}
+
+		ret = xe_ggtt_node_insert_locked(vma->node, size, align, 0);
+		if (ret) {
+			xe_ggtt_node_fini(vma->node);
 			goto out_unlock;
+		}
 
-		ggtt_ofs = vma->node.base.start;
+		ggtt_ofs = vma->node->base.start;
 
 		for (i = 0; i < ARRAY_SIZE(rot_info->plane); i++)
 			write_ggtt_rotated(bo, ggtt, &ggtt_ofs,
@@ -318,14 +334,11 @@ static struct i915_vma *__xe_pin_fb_vma(const struct intel_framebuffer *fb,
 
 static void __xe_unpin_fb_vma(struct i915_vma *vma)
 {
-	struct xe_device *xe = to_xe_device(vma->bo->ttm.base.dev);
-	struct xe_ggtt *ggtt = xe_device_get_root_tile(xe)->mem.ggtt;
-
 	if (vma->dpt)
 		xe_bo_unpin_map_no_vm(vma->dpt);
-	else if (!xe_ggtt_node_allocated(&vma->bo->ggtt_node) ||
-		 vma->bo->ggtt_node.base.start != vma->node.base.start)
-		xe_ggtt_node_remove(ggtt, &vma->node, false);
+	else if (!xe_ggtt_node_allocated(vma->bo->ggtt_node) ||
+		 vma->bo->ggtt_node->base.start != vma->node->base.start)
+		xe_ggtt_node_remove(vma->node, false);
 
 	ttm_bo_reserve(&vma->bo->ttm, false, false, NULL);
 	ttm_bo_unpin(&vma->bo->ttm);
diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 1faef9903b87..cbe7bf098970 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1120,7 +1120,7 @@ static void xe_ttm_bo_destroy(struct ttm_buffer_object *ttm_bo)
 
 	xe_assert(xe, list_empty(&ttm_bo->base.gpuva.list));
 
-	if (bo->ggtt_node.base.size)
+	if (bo->ggtt_node && bo->ggtt_node->base.size)
 		xe_ggtt_remove_bo(bo->tile->mem.ggtt, bo);
 
 #ifdef CONFIG_PROC_FS
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 9904b410be37..dbfb3209615d 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -194,9 +194,12 @@ xe_bo_main_addr(struct xe_bo *bo, size_t page_size)
 static inline u32
 xe_bo_ggtt_addr(struct xe_bo *bo)
 {
-	XE_WARN_ON(bo->ggtt_node.base.size > bo->size);
-	XE_WARN_ON(bo->ggtt_node.base.start + bo->ggtt_node.base.size > (1ull << 32));
-	return bo->ggtt_node.base.start;
+	if (XE_WARN_ON(!bo->ggtt_node))
+		return 0;
+
+	XE_WARN_ON(bo->ggtt_node->base.size > bo->size);
+	XE_WARN_ON(bo->ggtt_node->base.start + bo->ggtt_node->base.size > (1ull << 32));
+	return bo->ggtt_node->base.start;
 }
 
 int xe_bo_vmap(struct xe_bo *bo);
diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
index 4b1de9f5be00..2ed558ac2264 100644
--- a/drivers/gpu/drm/xe/xe_bo_types.h
+++ b/drivers/gpu/drm/xe/xe_bo_types.h
@@ -40,7 +40,7 @@ struct xe_bo {
 	/** @placement: current placement for this BO */
 	struct ttm_placement placement;
 	/** @ggtt_node: GGTT node if this BO is mapped in the GGTT */
-	struct xe_ggtt_node ggtt_node;
+	struct xe_ggtt_node *ggtt_node;
 	/** @vmap: iosys map of this buffer */
 	struct iosys_map vmap;
 	/** @ttm_kmap: TTM bo kmap object for internal use only. Keep off. */
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index f6810e73da1f..4ecd620921a3 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -204,7 +204,7 @@ struct xe_tile {
 			struct xe_memirq memirq;
 
 			/** @sriov.vf.ggtt_balloon: GGTT regions excluded from use. */
-			struct xe_ggtt_node ggtt_balloon[2];
+			struct xe_ggtt_node *ggtt_balloon[2];
 		} vf;
 	} sriov;
 
diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index d21474715bdb..58d7cad2425b 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -348,7 +348,6 @@ static void xe_ggtt_dump_node(struct xe_ggtt *ggtt,
 
 /**
  * xe_ggtt_node_insert_balloon - prevent allocation of specified GGTT addresses
- * @ggtt: the &xe_ggtt where we want to make reservation
  * @node: the &xe_ggtt_node to hold reserved GGTT node
  * @start: the starting GGTT address of the reserved region
  * @end: then end GGTT address of the reserved region
@@ -357,8 +356,9 @@ static void xe_ggtt_dump_node(struct xe_ggtt *ggtt,
  *
  * Return: 0 on success or a negative error code on failure.
  */
-int xe_ggtt_node_insert_balloon(struct xe_ggtt *ggtt, struct xe_ggtt_node *node, u64 start, u64 end)
+int xe_ggtt_node_insert_balloon(struct xe_ggtt_node *node, u64 start, u64 end)
 {
+	struct xe_ggtt *ggtt = node->ggtt;
 	int err;
 
 	xe_tile_assert(ggtt->tile, start < end);
@@ -385,77 +385,124 @@ int xe_ggtt_node_insert_balloon(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
 
 /**
  * xe_ggtt_node_remove_balloon - release a reserved GGTT region
- * @ggtt: the &xe_ggtt where reserved node belongs
  * @node: the &xe_ggtt_node with reserved GGTT region
  *
  * See xe_ggtt_node_insert_balloon() for details.
  */
-void xe_ggtt_node_remove_balloon(struct xe_ggtt *ggtt, struct xe_ggtt_node *node)
+void xe_ggtt_node_remove_balloon(struct xe_ggtt_node *node)
 {
-	if (!drm_mm_node_allocated(&node->base))
+	if (!node || !node->ggtt)
 		return;
 
-	xe_ggtt_dump_node(ggtt, &node->base, "remove-balloon");
+	if (!drm_mm_node_allocated(&node->base))
+		goto free_node;
 
-	mutex_lock(&ggtt->lock);
+	xe_ggtt_dump_node(node->ggtt, &node->base, "remove-balloon");
+
+	mutex_lock(&node->ggtt->lock);
 	drm_mm_remove_node(&node->base);
-	mutex_unlock(&ggtt->lock);
+	mutex_unlock(&node->ggtt->lock);
+
+free_node:
+	xe_ggtt_node_fini(node);
 }
 
 /**
  * xe_ggtt_node_insert_locked - Locked version to insert a &xe_ggtt_node into the GGTT
- * @ggtt: the &xe_ggtt where node will be inserted
  * @node: the &xe_ggtt_node to be inserted
  * @size: size of the node
  * @align: alignment constrain of the node
  * @mm_flags: flags to control the node behavior
  *
+ * It cannot be called without first having called xe_ggtt_init() once.
  * To be used in cases where ggtt->lock is already taken.
  *
  * Return: 0 on success or a negative error code on failure.
  */
-int xe_ggtt_node_insert_locked(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
+int xe_ggtt_node_insert_locked(struct xe_ggtt_node *node,
 			       u32 size, u32 align, u32 mm_flags)
 {
-	return drm_mm_insert_node_generic(&ggtt->mm, &node->base, size, align, 0,
+	return drm_mm_insert_node_generic(&node->ggtt->mm, &node->base, size, align, 0,
 					  mm_flags);
 }
 
 /**
  * xe_ggtt_node_insert - Insert a &xe_ggtt_node into the GGTT
- * @ggtt: the &xe_ggtt where node will be inserted
  * @node: the &xe_ggtt_node to be inserted
  * @size: size of the node
  * @align: alignment constrain of the node
  *
+ * It cannot be called without first having called xe_ggtt_init() once.
+ *
  * Return: 0 on success or a negative error code on failure.
  */
-int xe_ggtt_node_insert(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
-			u32 size, u32 align)
+int xe_ggtt_node_insert(struct xe_ggtt_node *node, u32 size, u32 align)
 {
 	int ret;
 
-	mutex_lock(&ggtt->lock);
-	ret = xe_ggtt_node_insert_locked(ggtt, node, size,
-					 align, DRM_MM_INSERT_HIGH);
-	mutex_unlock(&ggtt->lock);
+	if (!node || !node->ggtt)
+		return -ENOENT;
+
+	mutex_lock(&node->ggtt->lock);
+	ret = xe_ggtt_node_insert_locked(node, size, align,
+					 DRM_MM_INSERT_HIGH);
+	mutex_unlock(&node->ggtt->lock);
 
 	return ret;
 }
 
+/**
+ * xe_ggtt_node_init - Initialize %xe_ggtt_node struct
+ * @ggtt: the &xe_ggtt where the new node will later be inserted/reserved.
+ *
+ * This function will allocated the struct %xe_ggtt_node and return it's pointer.
+ * This struct will then be freed after the node removal upon xe_ggtt_node_remove()
+ * or xe_ggtt_node_remove_balloon().
+ * Having %xe_ggtt_node struct allocated doesn't mean that the node is already allocated
+ * in GGTT. Only the xe_ggtt_node_insert(), xe_ggtt_node_insert_locked(),
+ * xe_ggtt_node_insert_balloon() will ensure the node is inserted or reserved in GGTT.
+ *
+ * Return: A pointer to %xe_ggtt_node struct on success. An ERR_PTR otherwise.
+ **/
+struct xe_ggtt_node *xe_ggtt_node_init(struct xe_ggtt *ggtt)
+{
+	struct xe_ggtt_node *node = kzalloc(sizeof(*node), GFP_NOFS);
+
+	if (!node)
+		return ERR_PTR(-ENOMEM);
+
+	node->ggtt = ggtt;
+	return node;
+}
+
+/**
+ * xe_ggtt_node_fini - Forcebly finalize %xe_ggtt_node struct
+ * @node: the &xe_ggtt_node to be freed
+ *
+ * If anything went wrong with either xe_ggtt_node_insert(), xe_ggtt_node_insert_locked(),
+ * or xe_ggtt_node_insert_balloon(); and this @node is not going to be reused, then,
+ * this function needs to be called to free the %xe_ggtt_node struct
+ **/
+void xe_ggtt_node_fini(struct xe_ggtt_node *node)
+{
+	kfree(node);
+}
+
 /**
  * xe_ggtt_node_remove - Remove a &xe_ggtt_node from the GGTT
- * @ggtt: the &xe_ggtt where node will be removed
  * @node: the &xe_ggtt_node to be removed
  * @invalidate: if node needs invalidation upon removal
  */
-void xe_ggtt_node_remove(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
-			 bool invalidate)
+void xe_ggtt_node_remove(struct xe_ggtt_node *node, bool invalidate)
 {
+	struct xe_ggtt *ggtt = node->ggtt;
 	struct xe_device *xe = tile_to_xe(ggtt->tile);
 	bool bound;
 	int idx;
 
+	if (!node || !node->ggtt)
+		return;
+
 	bound = drm_dev_enter(&xe->drm, &idx);
 	if (bound)
 		xe_pm_runtime_get_noresume(xe);
@@ -468,23 +515,29 @@ void xe_ggtt_node_remove(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
 	mutex_unlock(&ggtt->lock);
 
 	if (!bound)
-		return;
+		goto free_node;
 
 	if (invalidate)
 		xe_ggtt_invalidate(ggtt);
 
 	xe_pm_runtime_put(xe);
 	drm_dev_exit(idx);
+
+free_node:
+	xe_ggtt_node_fini(node);
 }
 
 /**
- * xe_ggtt_node_allocated - Check if node is allocated
+ * xe_ggtt_node_allocated - Check if node is allocated in GGTT
  * @node: the &xe_ggtt_node to be inspected
  *
  * Return: True if allocated, False otherwise.
  */
 bool xe_ggtt_node_allocated(const struct xe_ggtt_node *node)
 {
+	if (!node || !node->ggtt)
+		return false;
+
 	return drm_mm_node_allocated(&node->base);
 }
 
@@ -497,9 +550,14 @@ void xe_ggtt_map_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
 {
 	u16 cache_mode = bo->flags & XE_BO_FLAG_NEEDS_UC ? XE_CACHE_NONE : XE_CACHE_WB;
 	u16 pat_index = tile_to_xe(ggtt->tile)->pat.idx[cache_mode];
-	u64 start = bo->ggtt_node.base.start;
+	u64 start;
 	u64 offset, pte;
 
+	if (XE_WARN_ON(!bo->ggtt_node))
+		return;
+
+	start = bo->ggtt_node->base.start;
+
 	for (offset = 0; offset < bo->size; offset += XE_PAGE_SIZE) {
 		pte = ggtt->pt_ops->pte_encode_bo(bo, offset, pat_index);
 		ggtt->pt_ops->ggtt_set_pte(ggtt, start + offset, pte);
@@ -515,9 +573,9 @@ static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
 	if (xe_bo_is_vram(bo) && ggtt->flags & XE_GGTT_FLAGS_64K)
 		alignment = SZ_64K;
 
-	if (XE_WARN_ON(bo->ggtt_node.base.size)) {
+	if (XE_WARN_ON(bo->ggtt_node)) {
 		/* Someone's already inserted this BO in the GGTT */
-		xe_tile_assert(ggtt->tile, bo->ggtt_node.base.size == bo->size);
+		xe_tile_assert(ggtt->tile, bo->ggtt_node->base.size == bo->size);
 		return 0;
 	}
 
@@ -526,15 +584,26 @@ static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
 		return err;
 
 	xe_pm_runtime_get_noresume(tile_to_xe(ggtt->tile));
+
+	bo->ggtt_node = xe_ggtt_node_init(ggtt);
+	if (IS_ERR(bo->ggtt_node)) {
+		err = PTR_ERR(bo->ggtt_node);
+		goto out;
+	}
+
 	mutex_lock(&ggtt->lock);
-	err = drm_mm_insert_node_in_range(&ggtt->mm, &bo->ggtt_node.base, bo->size,
+	err = drm_mm_insert_node_in_range(&ggtt->mm, &bo->ggtt_node->base, bo->size,
 					  alignment, 0, start, end, 0);
-	if (!err)
+	if (err)
+		xe_ggtt_node_fini(bo->ggtt_node);
+	else
 		xe_ggtt_map_bo(ggtt, bo);
 	mutex_unlock(&ggtt->lock);
 
 	if (!err && bo->flags & XE_BO_FLAG_GGTT_INVALIDATE)
 		xe_ggtt_invalidate(ggtt);
+
+out:
 	xe_pm_runtime_put(tile_to_xe(ggtt->tile));
 
 	return err;
@@ -574,13 +643,13 @@ int xe_ggtt_insert_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
  */
 void xe_ggtt_remove_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
 {
-	if (XE_WARN_ON(!bo->ggtt_node.base.size))
+	if (XE_WARN_ON(!bo->ggtt_node))
 		return;
 
 	/* This BO is not currently in the GGTT */
-	xe_tile_assert(ggtt->tile, bo->ggtt_node.base.size == bo->size);
+	xe_tile_assert(ggtt->tile, bo->ggtt_node->base.size == bo->size);
 
-	xe_ggtt_node_remove(ggtt, &bo->ggtt_node,
+	xe_ggtt_node_remove(bo->ggtt_node,
 			    bo->flags & XE_BO_FLAG_GGTT_INVALIDATE);
 }
 
@@ -647,7 +716,6 @@ static void xe_ggtt_assign_locked(struct xe_ggtt *ggtt, const struct drm_mm_node
 
 /**
  * xe_ggtt_assign - assign a GGTT region to the VF
- * @ggtt: the &xe_ggtt where the node belongs
  * @node: the &xe_ggtt_node to update
  * @vfid: the VF identifier
  *
@@ -655,11 +723,11 @@ static void xe_ggtt_assign_locked(struct xe_ggtt *ggtt, const struct drm_mm_node
  * In addition to PTE's VFID bits 11:2 also PRESENT bit 0 is set as on some
  * platforms VFs can't modify that either.
  */
-void xe_ggtt_assign(struct xe_ggtt *ggtt, const struct xe_ggtt_node *node, u16 vfid)
+void xe_ggtt_assign(const struct xe_ggtt_node *node, u16 vfid)
 {
-	mutex_lock(&ggtt->lock);
-	xe_ggtt_assign_locked(ggtt, &node->base, vfid);
-	mutex_unlock(&ggtt->lock);
+	mutex_lock(&node->ggtt->lock);
+	xe_ggtt_assign_locked(node->ggtt, &node->base, vfid);
+	mutex_unlock(&node->ggtt->lock);
 }
 #endif
 
diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
index e258a4f381b4..27e7d67de004 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.h
+++ b/drivers/gpu/drm/xe/xe_ggtt.h
@@ -13,17 +13,16 @@ struct drm_printer;
 int xe_ggtt_init_early(struct xe_ggtt *ggtt);
 int xe_ggtt_init(struct xe_ggtt *ggtt);
 
-int xe_ggtt_node_insert_balloon(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
+struct xe_ggtt_node *xe_ggtt_node_init(struct xe_ggtt *ggtt);
+void xe_ggtt_node_fini(struct xe_ggtt_node *node);
+int xe_ggtt_node_insert_balloon(struct xe_ggtt_node *node,
 				u64 start, u64 size);
-void xe_ggtt_node_remove_balloon(struct xe_ggtt *ggtt, struct xe_ggtt_node *node);
+void xe_ggtt_node_remove_balloon(struct xe_ggtt_node *node);
 
-int xe_ggtt_node_insert(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
-			u32 size, u32 align);
-int xe_ggtt_node_insert_locked(struct xe_ggtt *ggtt,
-			       struct xe_ggtt_node *node,
+int xe_ggtt_node_insert(struct xe_ggtt_node *node, u32 size, u32 align);
+int xe_ggtt_node_insert_locked(struct xe_ggtt_node *node,
 			       u32 size, u32 align, u32 mm_flags);
-void xe_ggtt_node_remove(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
-			 bool invalidate);
+void xe_ggtt_node_remove(struct xe_ggtt_node *node, bool invalidate);
 bool xe_ggtt_node_allocated(const struct xe_ggtt_node *node);
 void xe_ggtt_map_bo(struct xe_ggtt *ggtt, struct xe_bo *bo);
 int xe_ggtt_insert_bo(struct xe_ggtt *ggtt, struct xe_bo *bo);
@@ -36,7 +35,7 @@ int xe_ggtt_dump(struct xe_ggtt *ggtt, struct drm_printer *p);
 u64 xe_ggtt_print_holes(struct xe_ggtt *ggtt, u64 alignment, struct drm_printer *p);
 
 #ifdef CONFIG_PCI_IOV
-void xe_ggtt_assign(struct xe_ggtt *ggtt, const struct xe_ggtt_node *node, u16 vfid);
+void xe_ggtt_assign(const struct xe_ggtt_node *node, u16 vfid);
 #endif
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_ggtt_types.h b/drivers/gpu/drm/xe/xe_ggtt_types.h
index af312a7d1031..0e8822ae13fc 100644
--- a/drivers/gpu/drm/xe/xe_ggtt_types.h
+++ b/drivers/gpu/drm/xe/xe_ggtt_types.h
@@ -50,9 +50,15 @@ struct xe_ggtt {
 };
 
 /**
- * struct xe_ggtt_node - A node in GGTT
+ * struct xe_ggtt_node - A node in GGTT.
+ *
+ * This struct needs to be initialized (only-once) with xe_ggtt_node_init() before any node
+ * insertion, reservation, or 'ballooning'.
+ * It will, then, be finalized by either xe_ggtt_node_remove() or xe_ggtt_node_deballoon().
  */
 struct xe_ggtt_node {
+	/** @ggtt: Back pointer to xe_ggtt where this region will be inserted at */
+	struct xe_ggtt *ggtt;
 	/** @base: A drm_mm_node */
 	struct drm_mm_node base;
 };
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index e133594cc6bd..c8835d9eead6 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -232,14 +232,14 @@ static u32 encode_config_ggtt(u32 *cfg, const struct xe_gt_sriov_config *config)
 {
 	u32 n = 0;
 
-	if (xe_ggtt_node_allocated(&config->ggtt_region)) {
+	if (xe_ggtt_node_allocated(config->ggtt_region)) {
 		cfg[n++] = PREP_GUC_KLV_TAG(VF_CFG_GGTT_START);
-		cfg[n++] = lower_32_bits(config->ggtt_region.base.start);
-		cfg[n++] = upper_32_bits(config->ggtt_region.base.start);
+		cfg[n++] = lower_32_bits(config->ggtt_region->base.start);
+		cfg[n++] = upper_32_bits(config->ggtt_region->base.start);
 
 		cfg[n++] = PREP_GUC_KLV_TAG(VF_CFG_GGTT_SIZE);
-		cfg[n++] = lower_32_bits(config->ggtt_region.base.size);
-		cfg[n++] = upper_32_bits(config->ggtt_region.base.size);
+		cfg[n++] = lower_32_bits(config->ggtt_region->base.size);
+		cfg[n++] = upper_32_bits(config->ggtt_region->base.size);
 	}
 
 	return n;
@@ -371,27 +371,26 @@ static int pf_distribute_config_ggtt(struct xe_tile *tile, unsigned int vfid, u6
 
 static void pf_release_ggtt(struct xe_tile *tile, struct xe_ggtt_node *node)
 {
-	struct xe_ggtt *ggtt = tile->mem.ggtt;
-
 	if (xe_ggtt_node_allocated(node)) {
 		/*
 		 * explicit GGTT PTE assignment to the PF using xe_ggtt_assign()
 		 * is redundant, as PTE will be implicitly re-assigned to PF by
 		 * the xe_ggtt_clear() called by below xe_ggtt_remove_node().
 		 */
-		xe_ggtt_node_remove(ggtt, node, false);
+		xe_ggtt_node_remove(node, false);
 	}
 }
 
 static void pf_release_vf_config_ggtt(struct xe_gt *gt, struct xe_gt_sriov_config *config)
 {
-	pf_release_ggtt(gt_to_tile(gt), &config->ggtt_region);
+	pf_release_ggtt(gt_to_tile(gt), config->ggtt_region);
+	config->ggtt_region = NULL;
 }
 
 static int pf_provision_vf_ggtt(struct xe_gt *gt, unsigned int vfid, u64 size)
 {
 	struct xe_gt_sriov_config *config = pf_pick_vf_config(gt, vfid);
-	struct xe_ggtt_node *node = &config->ggtt_region;
+	struct xe_ggtt_node *node = config->ggtt_region;
 	struct xe_tile *tile = gt_to_tile(gt);
 	struct xe_ggtt *ggtt = tile->mem.ggtt;
 	u64 alignment = pf_get_ggtt_alignment(gt);
@@ -415,25 +414,33 @@ static int pf_provision_vf_ggtt(struct xe_gt *gt, unsigned int vfid, u64 size)
 	if (!size)
 		return 0;
 
-	err = xe_ggtt_node_insert(ggtt, node, size, alignment);
+	node = xe_ggtt_node_init(ggtt);
+	if (IS_ERR(node))
+		return PTR_ERR(node);
+
+	err = xe_ggtt_node_insert(node, size, alignment);
 	if (unlikely(err))
-		return err;
+		goto err;
 
-	xe_ggtt_assign(ggtt, node, vfid);
+	xe_ggtt_assign(node, vfid);
 	xe_gt_sriov_dbg_verbose(gt, "VF%u assigned GGTT %llx-%llx\n",
 				vfid, node->base.start, node->base.start + node->base.size - 1);
 
 	err = pf_distribute_config_ggtt(gt->tile, vfid, node->base.start, node->base.size);
 	if (unlikely(err))
-		return err;
+		goto err;
 
+	config->ggtt_region = node;
 	return 0;
+err:
+	xe_ggtt_node_fini(node);
+	return err;
 }
 
 static u64 pf_get_vf_config_ggtt(struct xe_gt *gt, unsigned int vfid)
 {
 	struct xe_gt_sriov_config *config = pf_pick_vf_config(gt, vfid);
-	struct xe_ggtt_node *node = &config->ggtt_region;
+	struct xe_ggtt_node *node = config->ggtt_region;
 
 	xe_gt_assert(gt, !xe_gt_is_media_type(gt));
 	return xe_ggtt_node_allocated(node) ? node->base.size : 0;
@@ -2006,13 +2013,15 @@ int xe_gt_sriov_pf_config_print_ggtt(struct xe_gt *gt, struct drm_printer *p)
 
 	for (n = 1; n <= total_vfs; n++) {
 		config = &gt->sriov.pf.vfs[n].config;
-		if (!xe_ggtt_node_allocated(&config->ggtt_region))
+		if (!xe_ggtt_node_allocated(config->ggtt_region))
 			continue;
 
-		string_get_size(config->ggtt_region.base.size, 1, STRING_UNITS_2, buf, sizeof(buf));
+		string_get_size(config->ggtt_region->base.size, 1, STRING_UNITS_2,
+				buf, sizeof(buf));
 		drm_printf(p, "VF%u:\t%#0llx-%#llx\t(%s)\n",
-			   n, config->ggtt_region.base.start,
-			   config->ggtt_region.base.start + config->ggtt_region.base.size - 1, buf);
+			   n, config->ggtt_region->base.start,
+			   config->ggtt_region->base.start + config->ggtt_region->base.size - 1,
+			   buf);
 	}
 
 	return 0;
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config_types.h
index a73d9a4b9e64..2d3b73d78f14 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config_types.h
@@ -18,7 +18,7 @@ struct xe_bo;
  */
 struct xe_gt_sriov_config {
 	/** @ggtt_region: GGTT region assigned to the VF. */
-	struct xe_ggtt_node ggtt_region;
+	struct xe_ggtt_node *ggtt_region;
 	/** @lmem_obj: LMEM allocation for use by the VF. */
 	struct xe_bo *lmem_obj;
 	/** @num_ctxs: number of GuC contexts IDs.  */
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index 39ff4e7f902e..4ebc82e607af 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -495,6 +495,25 @@ u64 xe_gt_sriov_vf_lmem(struct xe_gt *gt)
 	return gt->sriov.vf.self_config.lmem_size;
 }
 
+static struct xe_ggtt_node *
+vf_balloon_ggtt_node(struct xe_ggtt *ggtt, u64 start, u64 end)
+{
+	struct xe_ggtt_node *node;
+	int err;
+
+	node = xe_ggtt_node_init(ggtt);
+	if (IS_ERR(node))
+		return node;
+
+	err = xe_ggtt_node_insert_balloon(node, start, end);
+	if (err) {
+		xe_ggtt_node_fini(node);
+		return ERR_PTR(err);
+	}
+
+	return node;
+}
+
 static int vf_balloon_ggtt(struct xe_gt *gt)
 {
 	struct xe_gt_sriov_vf_selfconfig *config = &gt->sriov.vf.self_config;
@@ -502,7 +521,6 @@ static int vf_balloon_ggtt(struct xe_gt *gt)
 	struct xe_ggtt *ggtt = tile->mem.ggtt;
 	struct xe_device *xe = gt_to_xe(gt);
 	u64 start, end;
-	int err;
 
 	xe_gt_assert(gt, IS_SRIOV_VF(xe));
 	xe_gt_assert(gt, !xe_gt_is_media_type(gt));
@@ -528,37 +546,31 @@ static int vf_balloon_ggtt(struct xe_gt *gt)
 	start = xe_wopcm_size(xe);
 	end = config->ggtt_base;
 	if (end != start) {
-		err = xe_ggtt_node_insert_balloon(ggtt, &tile->sriov.vf.ggtt_balloon[0],
-						  start, end);
-		if (err)
-			goto failed;
+		tile->sriov.vf.ggtt_balloon[0] = vf_balloon_ggtt_node(ggtt, start, end);
+		if (IS_ERR(tile->sriov.vf.ggtt_balloon[0]))
+			return PTR_ERR(tile->sriov.vf.ggtt_balloon[0]);
 	}
 
 	start = config->ggtt_base + config->ggtt_size;
 	end = GUC_GGTT_TOP;
 	if (end != start) {
-		err = xe_ggtt_node_insert_balloon(ggtt, &tile->sriov.vf.ggtt_balloon[1],
-						  start, end);
-		if (err)
-			goto deballoon;
+		tile->sriov.vf.ggtt_balloon[1] = vf_balloon_ggtt_node(ggtt, start, end);
+		if (IS_ERR(tile->sriov.vf.ggtt_balloon[1])) {
+			xe_ggtt_node_remove_balloon(tile->sriov.vf.ggtt_balloon[0]);
+			return PTR_ERR(tile->sriov.vf.ggtt_balloon[1]);
+		}
 	}
 
 	return 0;
-
-deballoon:
-	xe_ggtt_node_remove_balloon(ggtt, &tile->sriov.vf.ggtt_balloon[0]);
-failed:
-	return err;
 }
 
 static void deballoon_ggtt(struct drm_device *drm, void *arg)
 {
 	struct xe_tile *tile = arg;
-	struct xe_ggtt *ggtt = tile->mem.ggtt;
 
 	xe_tile_assert(tile, IS_SRIOV_VF(tile_to_xe(tile)));
-	xe_ggtt_node_remove_balloon(ggtt, &tile->sriov.vf.ggtt_balloon[1]);
-	xe_ggtt_node_remove_balloon(ggtt, &tile->sriov.vf.ggtt_balloon[0]);
+	xe_ggtt_node_remove_balloon(tile->sriov.vf.ggtt_balloon[1]);
+	xe_ggtt_node_remove_balloon(tile->sriov.vf.ggtt_balloon[0]);
 }
 
 /**
-- 
2.46.0

