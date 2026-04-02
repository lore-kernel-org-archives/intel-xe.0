Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32944D39421
	for <intel-xe@archiver.kernel.org>; Thu,  2 Apr 2026 13:18:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1F6910E090;
	Thu,  2 Apr 2026 13:18:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ex89jvOu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0634D10E090
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Apr 2026 13:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775135911; x=1806671911;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=nyhazjhbaNA3I3I7klGfbU7jrdoVmx5OLrczaZg7XnI=;
 b=Ex89jvOuvOchRf3lG/l9MiDj0UrJfl7my/FHwcumAanwX6qDvcgSeqcW
 s3L2jLRqxXuMT5vXGr4l2t2U3NzFbknGE2kNXVkMCqKjQVyca7rK/ZHXI
 xwVf0TkddXLoz292sTUcy3XkAqayObmyPYqa21nkutQ0REJ61lKzefzSP
 lWpIowVw0gqSMn2vu9QMuiI4POvJCXjcBl7cjCniWNPajA9H+tWj6ZXyM
 QRff7tnqMUPDKuffu2VObHW56aOsxLW3FZpGVBCO4X/LyjF6q4wc6Tv/k
 gU87cZpOmZp+7Ycm4sKszaS/lL4FOhptLrKjaDJzbNE2Lvo7AtApI7C9E w==;
X-CSE-ConnectionGUID: PB5b3n0fSJuksOc/rcOByQ==
X-CSE-MsgGUID: I862eloVTbGlEjrLx1R4Bw==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="93585899"
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; d="scan'208";a="93585899"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 06:18:31 -0700
X-CSE-ConnectionGUID: ab3gjWltToOckPZ6GtAciQ==
X-CSE-MsgGUID: EC+U2qqfTda0I+zWE7A11A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; d="scan'208";a="222121851"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 06:18:30 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 2 Apr 2026 06:18:30 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 2 Apr 2026 06:18:30 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.55) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 2 Apr 2026 06:18:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qxb8gZi/wlFepuvcaut8RQP+5LXho7iz4RG5tnyxq+VunI7R/7IfG4WCo9gL476zONuWWFXMUZni22KX2hwyq3Uc7RBXkXuGSYVjVA7wIovGp2PjOHzq5zpE7BggF8+ZH5klHStJxXir9pamy9Qq1mSqr0AKstKMD9MckMSSHDETtF5cgnnJa7CruiXAGS+2cPTNUmcu92areySnThLmbv5cRo6yGk9FLN9xjBaoFGwT9DIyxyE+eEneou9VXhj7EtiAjogWaVQKup0sbFgfT6IsQQwKbu7oj8aFVhbYc/bgjduR5bNiObS/YIWh/p+IS0HwTQJQNf3Ncml916ZL4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EoqwELpwTYDXuivBSN6e7dlw7U8OkVQ6gGHKsHoQGHw=;
 b=KQCY3tMOBbrkYyXCOZYDVyErCZS28ZCtvJADZASj7cFmU2s7GG0lVpZq8RcfnBKPTPn/ingjN2yz08WwMQXtxNZCt6gnMGX5feT8m5hPIw6ON8MNmwezyER3W3NmIVv1UulufT9ljk8DFXlVWfxxYaFjzbK0XJ6fW/9bKVvfbLEN3lfy9m2fXilRvVUWwkmQqsyiTJ+kiOoS+XK/nl5mdQzmJbirYHkeQjkMm4d3NrqhCapa4t0kRvzJDW+ff1MzuBNF9hIf80dUXcx3VGcphdjLp/6YrFgL4WqwBGFiptc7XUTbRk+nB+WoqVttHQXXGMH8U9Tu9lnj+OE+SyEBlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by PH3PPFBA2AA2BA3.namprd11.prod.outlook.com (2603:10b6:518:1::d46)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Thu, 2 Apr
 2026 13:18:26 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%5]) with mapi id 15.20.9769.017; Thu, 2 Apr 2026
 13:18:26 +0000
Date: Thu, 2 Apr 2026 15:18:22 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 07/13] drm/xe/pf: Encode scheduling priority KLV if needed
Message-ID: <20260402131822.rkkqbkxtrt6bfw5f@intel.com>
References: <20260330204046.567-1-michal.wajdeczko@intel.com>
 <20260330204046.567-8-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260330204046.567-8-michal.wajdeczko@intel.com>
X-ClientProxiedBy: VI1PR10CA0088.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:803:28::17) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|PH3PPFBA2AA2BA3:EE_
X-MS-Office365-Filtering-Correlation-Id: 5bad59b4-4ed8-4e26-4af8-08de90ba52fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|22082099003|56012099003|18002099003; 
X-Microsoft-Antispam-Message-Info: EEYD5yG3o2pWx3m9ub+S6k3ccN6hh0w8PJykrZOmLvg7wcUkOawjVmwQQVDDdyNpMIeUUfGy2XBg5N7YEHijObSI+OJ2JSqyk63BAWn0XwZx5V6dzAykY7RyJhrpvpfbaAzK5QFy4bo0jpUg2yyb61B0SNKCM+hfDSLpsibdznmi2WAy7A5xD8npUrVGzJh+ZTyUH2Ylo/qPaH9BAK3rR7c27iT0zDYzhGkTdh/SeeooVTjJfIUzhDv/gDqPzr/9VEGVRzVxtvW9z+D8livjTu5dUaB0EE7vmwhbpQYsEF6NoO15Mir9XUPOcOcAHCbcYDnqVZS3WMg5AAjvVb47S3+Wg29wece0w3w85So32xyVxjzhFSmH8q1+pR89mBxkXyuDy92FwR+A4TOvfTQ/wqvXny5OxHca67YBzpL6LwdpSvaCF4cwXw2Bn7nzXta3AFa1TJlWJktLWNutvKv/9a16srqMXzwKCCSPBfvyGJcDRlQMprJaElKrEYBV1e5sGkJpAYjMaIemBfTwj59QTQvpLS4uSnN7TBofXUfXc/YSKrbQMPtFnzmf5Lods4GoROxJTS1w0v/U+XGXqC4BUCNYp10yQkfq7GWNZNPtEERHZbugwO+l4ZCKCmNfCIP3i68kNUkWINv9Tr/feqQhNVZkneQQqRSN31cT0JTBbboTr5wjywlrrG+en+tgSrjGKio47yJE93ZIHjhaIvlDbD6NmetARf/F/S2mqhlvzzE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?THBrQ0dlcnVYVnBVS1BOZXhaNDh4dTJOaTJxcHhUdGdGc2FkQURDTDdDdEt6?=
 =?utf-8?B?d2xpZzNIZHJ6cStjRU5lNldBdG9mMURFU2lTMzEzNkRFSzBlZXFXK1l1eHd6?=
 =?utf-8?B?UW9KL0ZTRTE3TWs5ekhsRHlYSkRNTUMyQ0lqQ3EzNGM4cityMmtHdUIxTEU5?=
 =?utf-8?B?eVhRN2Y4c0FTODFiVWlLYVBhNGdmd081M3phcSs0cEVPQzNXTlVVd3M4M0F4?=
 =?utf-8?B?TG14ZHJEdjhTd2hKbHJic1BlcUIvVUEzZnFFbGFNUVNlNkR2R0hxZThLbzF2?=
 =?utf-8?B?enJuYUtvSVIzc3phcXYwM2ZPUGtEQ2sreUpzTzdxQUI4a1JBaDJMUGRKYzBj?=
 =?utf-8?B?VmlxZSsvRjROekNiWGtMTHd6SC9QdnlQV0FiMzdHZGQ2MUh2TjdIR2QzcGFV?=
 =?utf-8?B?TXRhSHdaS29zaVVkMGtXL0p6VGFtYjRSNFVyT0VvRVNObUdjeTFYcHdkVHhC?=
 =?utf-8?B?WW8zbEM1ZHBlMGNhTSsrdVJoaXRkbXJZVDU0dzRIM2psMm5NeUVBT1hpcldt?=
 =?utf-8?B?NXVJMWpoOTBDUVFCOWlyVzcrYWRKSzd6ZURDMWJvM2VwUjcwWGdhSGNVRUc2?=
 =?utf-8?B?WkgrSjYySExzVVNMRFU2M1pvR3lJejF2RHhZdkpSandqSldVc0hSS2pzN1Bs?=
 =?utf-8?B?ZnJRZTV4NUUrSTJBcjNCc2NYMWlNZUtPa0RxMm8yMHJ2dHU0NTgydXdoZDVp?=
 =?utf-8?B?NmJDdkEraGdxbFFxcVlKWjIrZU9WYzZvTGhyVnNza1BvdFFmazBrMis0K29W?=
 =?utf-8?B?cDEwUVRPczRFL0dQUHV6T0wrdnZJUm5NUEZaQUdVcVUyNHg1NG1UeEdzbzhy?=
 =?utf-8?B?dGY0bThwRlBQbkw2VWRSa3dHOG5zYXJwSW1oeDMrZStidHh6dnpRRlpBQTJx?=
 =?utf-8?B?SU9aR2R2TDErZk93TnZuSUUwQ1hhT1FZUVk4OWJWVFN6SGV2UHZ0ajlBZTYz?=
 =?utf-8?B?bHBwS1hzS1RaUllrcStqZkZQTkdiQ2Zab1pwZ0d1Z0gzeVlBWjh1L0g4UXJs?=
 =?utf-8?B?U2FuV1RBSGtQL1E4SjVWcGhEemlPRDJUUG56d0FtZGdUT1Jlekt0d05RaFBL?=
 =?utf-8?B?SVJUVWM4R1FtbDRZeDQzdFNOM1k4VWRFeHpqYWFoM243dGdUQVAvYzZ3QVRp?=
 =?utf-8?B?b2xYdGVSWVQvN2dtcmgzYXMybmo4OXNJc3FJQjFTN0xyTlA0Ujk5cTRwZzhK?=
 =?utf-8?B?bWNxK0E4ZU9ZTlY1NzVOeHpjYXAwRmpCZGlGQi8zb0lZWGpydkRmd3FKYmlY?=
 =?utf-8?B?V2tYL2xFcXpKcXZiUWpPQzhPU3V0T1NodEpPZllaT3hqN0N3MVpsVjlnSW9Q?=
 =?utf-8?B?c1AxYXo1QVhIbE4wbkVmc3RkMFV5SklvbG9XNjF0UTYwVGxUQjRmL0IraWZN?=
 =?utf-8?B?TURNelMxekx1K3dROWlSU2c0bjdrSjNMRnoraEhtcEx4QlpoQ2R0T2dkM0t1?=
 =?utf-8?B?ZC9FR3BnN1phZTg2bVZNVlZ4TDBGcDBsMDRad0ZGZmQwRXNLK2NTZDIxaEpK?=
 =?utf-8?B?c2JUUnpDUExUZ1U3K1dBQktBMEVQNXdMODRuNzlzdytDeEU4ZnJYVEtoQzRX?=
 =?utf-8?B?YWVOMUQ2Y0orenVlNFlXeXJIQU5mdDJ1TzdIeWdJM21LTFFZa2NJc3ZVR0NG?=
 =?utf-8?B?Y04yR00wZjRxWDRqaUtxbmZ5RmJiSHRwNTFaYUpBUWtLNVFSN25id2hRWjBk?=
 =?utf-8?B?UWdabUFoTHNVSWh3d1hnNXAyVUhVR3I4M3BreldmbGlRT3FXOE02OFBXNWtL?=
 =?utf-8?B?WHNyeFNzcXFWYTVVOTcvanNzUStZcmFzNStqRlZweEg1TkkwSjh6aHBQbDVy?=
 =?utf-8?B?djJCcmZFelRyeEo2bDJwT2ZyZUZKTnVFWWl5Ulk4cGhjQjgzdXZ5YVZTVFUy?=
 =?utf-8?B?R0pIRWMwY1g4aVRONWVpRDYxb0xvWVdiS2VORGlhbCttV0doaTFsOGtHZ3Nr?=
 =?utf-8?B?Y1ZkVjgzRjNOd1JXMGlFZ2pVbU9JQzQyQzAya1hHYVFYR1AxdHlEQnFWV0R6?=
 =?utf-8?B?RkJ1c3JXMjNJWC9zYXVIcGU4QXlaa1hPSlJzYVcvTXVIV1Z2b0RpZWtLZEpW?=
 =?utf-8?B?alhmTHpIMXltUGlrM0I3U3pXcDAzS2pndmZ5TTF5VkxUNERnOXEwaVpSdktZ?=
 =?utf-8?B?bkNzREtOQ1lQZTcrNUpBV0dRNDdkc0hPYk1RTStDa3lra0dLZk5sZTRkOXVQ?=
 =?utf-8?B?UXRRN1lNNFpkellGMzR5TUNMR3M0UkRkQUJ2VStzcGRiRXAxRmJGR3BEakUx?=
 =?utf-8?B?dnlIQnBZd3BNTE45RVpubjN6SnFkYmRueG1ERVo2WFhHNW82WkNQeGQyMy9x?=
 =?utf-8?B?VmdjMjgzTTQ4ckZLY1pwMzgzdVdnQ2Q2b2loc3hESVhyZ2pjTW9abWNPQ2ZE?=
 =?utf-8?Q?GObcQr8tmW7cpts8=3D?=
X-Exchange-RoutingPolicyChecked: Xmp7DC7pmSh8u8bb01o3V9uGMXYPpRzs7pK9Im/LxRMtbF6oXuKp6dSxbooYv8jAjl9kVkvUh4Y+CFp7SRCHXx2FVU+xQRPEez/6c6zueA0n4X7Egc3qHzsmhnhH5RU4F/cPbl/pwnBLKT+onrl0f7sXOaSkk0CP3f65mo9F8vkjYuQU2Px9HX8z4mxjaXhMwfsjGLkBN/8eHO2e4eZwIXOO/XwbHUuk/thhpsto7W45M6CcseZX88OkipS+u1lu1bHPFj5R+FcwGDxIW7XI4yRQYas9qNILDRQU16GibbCk0MCsbSsBRhZV7W+WcsAp5LK2sSwL9SRT5dDlPMTetg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bad59b4-4ed8-4e26-4af8-08de90ba52fd
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2026 13:18:26.5683 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sHCFaOz39d5R7ewPAURmnc+fyS6WP/pZSzQB5n7sZdEiYDDlD1c2V+OI711mBJ2TGpmLufC4yBJAAgncWAHv9rS6RwKN9rH0g2uaGNR5jf8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFBA2AA2BA3
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on pon [2026-mar-30 22:40:38 +0200]:
> After a reset we missed to reprovision VFs scheduling priority config.
> But as of today, the GuC firmware allows to change scheduling priority
> using config SCHED_PRIORITY KLV only for the PF and configuration of
> all VFs relies on the previously applied value of the SCHED_IF_IDLE
> policy. Use this policy value to check and decide whether we need to
> encode VF priority KLV while reprovisioning this VF.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 12 +++++++++++
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c | 25 ++++++++++++++++------
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h |  1 +
>  3 files changed, 31 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> index e1c028176eb8..b05034d3fdf2 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> @@ -285,6 +285,13 @@ static u32 encode_config_ggtt(u32 *cfg, const struct xe_gt_sriov_config *config,
>  	return encode_ggtt(cfg, xe_ggtt_node_addr(node), xe_ggtt_node_size(node), details);
>  }
>  
> +static bool custom_sched_priority(struct xe_gt *gt, u32 priority)
> +{
> +	return xe_gt_sriov_pf_policy_get_sched_if_idle_locked(gt) ?
> +		priority != GUC_SCHED_PRIORITY_NORMAL :
> +		priority != GUC_SCHED_PRIORITY_LOW;
> +}
> +
>  static u32 encode_config_sched(struct xe_gt *gt, u32 *cfg, u32 n,
>  			       const struct xe_gt_sriov_config *config)
>  {
> @@ -313,6 +320,11 @@ static u32 encode_config_sched(struct xe_gt *gt, u32 *cfg, u32 n,
>  		cfg[n++] = config->preempt_timeout[0];
>  	}
>  
> +	if (custom_sched_priority(gt, config->sched_priority)) {
> +		cfg[n++] = PREP_GUC_KLV_TAG(VF_CFG_SCHED_PRIORITY);
> +		cfg[n++] = config->sched_priority;
> +	}
> +
>  	return n;
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
> index 0007ed7e0d38..63e6326d45f8 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
> @@ -223,6 +223,22 @@ int xe_gt_sriov_pf_policy_set_sched_if_idle(struct xe_gt *gt, bool enable)
>  	return 0;
>  }
>  
> +/**
> + * xe_gt_sriov_pf_policy_get_sched_if_idle_locked() - Retrieve value of 'sched_if_idle' policy.
> + * @gt: the &xe_gt where to read the policy from
> + *
> + * This function can only be called on PF.
> + *
> + * Return: last value of 'sched_if_idle' policy applied.
> + */
> +bool xe_gt_sriov_pf_policy_get_sched_if_idle_locked(struct xe_gt *gt)
> +{
> +	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
> +	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
> +
> +	return gt->sriov.pf.policy.guc.sched_if_idle;
> +}
> +
>  /**
>   * xe_gt_sriov_pf_policy_get_sched_if_idle - Retrieve value of 'sched_if_idle' policy.
>   * @gt: the &xe_gt where to read the policy from
> @@ -233,15 +249,10 @@ int xe_gt_sriov_pf_policy_set_sched_if_idle(struct xe_gt *gt, bool enable)
>   */
>  bool xe_gt_sriov_pf_policy_get_sched_if_idle(struct xe_gt *gt)
>  {
> -	bool enable;
> -
>  	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
> +	guard(mutex)(xe_gt_sriov_pf_master_mutex(gt));
>  
> -	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
> -	enable = gt->sriov.pf.policy.guc.sched_if_idle;
> -	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
> -
> -	return enable;
> +	return xe_gt_sriov_pf_policy_get_sched_if_idle_locked(gt);
>  }
>  
>  static int pf_provision_reset_engine(struct xe_gt *gt, bool enable)
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h
> index c9d4c4aaaf5d..f437dc1f5e90 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h
> @@ -15,6 +15,7 @@ struct xe_gt;
>  
>  int xe_gt_sriov_pf_policy_set_sched_if_idle(struct xe_gt *gt, bool enable);
>  bool xe_gt_sriov_pf_policy_get_sched_if_idle(struct xe_gt *gt);
> +bool xe_gt_sriov_pf_policy_get_sched_if_idle_locked(struct xe_gt *gt);
>  int xe_gt_sriov_pf_policy_set_reset_engine(struct xe_gt *gt, bool enable);
>  bool xe_gt_sriov_pf_policy_get_reset_engine(struct xe_gt *gt);
>  int xe_gt_sriov_pf_policy_set_sample_period(struct xe_gt *gt, u32 value);


LGTM:
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>

> -- 
> 2.47.1
> 

-- 
