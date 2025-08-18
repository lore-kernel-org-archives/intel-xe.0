Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED0A5CA0ED1
	for <intel-xe@archiver.kernel.org>; Mon, 18 Aug 2025 15:58:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1C8810E494;
	Mon, 18 Aug 2025 15:58:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TI4EUQOm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 075BC10E494
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Aug 2025 15:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755532722; x=1787068722;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=WHtAifhAasvIlRMWstvxkLbtUXWqKm9nVlLGVeMMKQI=;
 b=TI4EUQOmStGy8TUR0qj6+V3wWNdh80J+cVM041iZ0BFp3v3wONdvphzx
 QiFFEx/7XOzzwqBR3Vms1hyamUFlCLOAbLwSvK3e0c6OQpNO5CNJSK+Cu
 EDMPMhnGqHGdkHkYRtvw2gMEOSEAkrsZ/ndDVJviMO9ygsCTi5JxfNdhf
 +GrU8O+J7R14RcPI2ahKeFjp9lXNwEij4LCmUlBZMNjjo4Xcz6UXhoGTb
 vfRehynJXM5cOrm0dNMHeUQAOqRgA6BjwdIOlwPdG1BwTAZy2fpNvNn7L
 l1WK5J4QaUdIPl/LneW0XlAOsYUBbFlIsXZlfByN9UpxdKy9/8Q51o/PH w==;
X-CSE-ConnectionGUID: 1vRTwOVASgK67GPIRnkTCw==
X-CSE-MsgGUID: yx2vPii+RRiDFrCg8/mzLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="57865531"
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; d="scan'208";a="57865531"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2025 08:58:42 -0700
X-CSE-ConnectionGUID: wZp8XDnERuGJqMrW7S7uBA==
X-CSE-MsgGUID: SMI+pPjtSuOytE1u9g68KQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; d="scan'208";a="171845343"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2025 08:58:41 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 18 Aug 2025 08:58:40 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 18 Aug 2025 08:58:40 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.58)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 18 Aug 2025 08:58:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YZHFx03zscYny+AjvFxIOhoKhE5xf6720cbnMj2DxMqeRS41J/kLmxgCBTagPWuPVKGW3micwf/rVvnk3RKWvm70zXwU8yYUFQiqZV7ledtBciBOjUDnpDkc1ch7MGU+pcwo7tVOqw2wXE9GJx48vxbRCMrOKW+uip5d1al9W8rytrdtteOr9q5qNGy457jODQl03roqhhPD5glDMs3ftpeM7sqfxM3yt6Qwc+oEIXbCtTgN9K6d3xFg3YRhl3DGasfl8oDUhhuYvzynXoT97hiF2rqlJGgtzoETAFs1K3CuaU9+v/o+EoPKPAFXoQlhTl/c/8JG33bXE7oCCu2S7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QeTjeZ1mfSb0gJL9u2OTXy1t7ewvl0t0DcZZSQS43z8=;
 b=cBwKvoeEnE+RcUi0PaICcRYQBLrk5h1guxJxGW/z+RuxgscmiKwOGraJ51Yd1oeCwEe4mpfAYrrkeifbttcN5d3MrfbgUe9PVSs91JXs/OgAlVuxi8c0JPQVEul3DLWYYy3LDgr/R5M0ccKxTne317S7vXa8uEUH1PRjMkF2C6wf9FDBb3lYoevi+8hykwhxYuVonHjPWToJLSsER0ngGwC0QU2lRXlVrmyOWWfMOX0Um01EEoaYi2XnntZqwFAvwC4HwQOxgmbm9csn+1KuCZB5/v3qBuJHST4ENEK9zBFEyuqgGdZKZYCbI/9TmfdtISO+ULOa+KTqun4QstwbTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB7595.namprd11.prod.outlook.com (2603:10b6:510:27a::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Mon, 18 Aug
 2025 15:58:38 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9031.023; Mon, 18 Aug 2025
 15:58:38 +0000
Date: Mon, 18 Aug 2025 10:58:34 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/6] drm/xe/kunit: Update struct xe_pci_fake_data step
 declarations
Message-ID: <eo6jrxbk744dww4dmtkgn2gxh5x7ihmooyjsnrmoeejjg73gze@y2l2hekopksh>
References: <20250801181350.180780-1-michal.wajdeczko@intel.com>
 <20250801181350.180780-2-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250801181350.180780-2-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BY3PR04CA0011.namprd04.prod.outlook.com
 (2603:10b6:a03:217::16) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB7595:EE_
X-MS-Office365-Filtering-Correlation-Id: 81466ff5-533d-4776-5d61-08ddde701847
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?1/Hm3CMd/NtuNW9T1wlzErpp5b2Ul23mI8Uo0/huoE9HRyOjKXJQvwr/QOuz?=
 =?us-ascii?Q?x2AgWOF3njh00iRqwynb3f4KpDilVX36c6ngQF/sHopMHCWgt6NufmpeIMx/?=
 =?us-ascii?Q?hNGaFRmI5JpaKxpGPaPRJuNtWablkliavyjNTI50xGF00RVxE2M7C2zurRNA?=
 =?us-ascii?Q?BmTjs3u1l0cDl6IQumCSqDfEpGfh3EIuOOCXmU6aza3TQH9pPy2xh40GsVuZ?=
 =?us-ascii?Q?4xpPAIealnSDJcZxpl9+1eiavEdUCuxZU7X3rYRmZDX0Y+xIwAii5GyL0IeE?=
 =?us-ascii?Q?VEQE9Pld+qhRizB95sDmL3aHRKJCCMgjIzqyRkHNT3IbVQgUkyekofadidy4?=
 =?us-ascii?Q?2v2B/M5jJKq2VbzXPLHhniBMTsXpiLvhZKrPW/OhywJXqbcgshtYPbYRzAPJ?=
 =?us-ascii?Q?1q0DGMFY/NNb2i3QRgWh+4w65gtMkDXMjyEa6H+u8vzp45N148l/YsW7Zkso?=
 =?us-ascii?Q?gKJS2E0n7iNWF502UPA9AIlNQ5QLQ2ueDaS6GWDoy50l6UP5KLjIpZBG+pCE?=
 =?us-ascii?Q?a4+88ceHpbmZf2aWAvX97Omy/FYgtzmDvI8Gd0RDymKvCb7PNdAXRz+GSFXy?=
 =?us-ascii?Q?3gLhAm4NVmXk4o5fQhRdK1RhvSPFb3u+x7gzZvb1pakzzsoi2Ne/CpbQDkLu?=
 =?us-ascii?Q?P0p7u44tnau3qws8IhCK/Y14qbpzgMwkqtTdgI/EZmq2eQgmVqkzp9Zce/3r?=
 =?us-ascii?Q?4Vr6nd5Q0SdclU023n/t6kGNv8yvZKSuQxpmVpFdiIEuYvTtt33cbkV7r9yP?=
 =?us-ascii?Q?WEwKmXFpmz2V5NMvFSz8iQwOI0PYo7POPFdRfrmELTeLn80/BAvrzAKm99Cw?=
 =?us-ascii?Q?rSq19od9oby1XZY/pYLmx7y4BuDI9pRtYxRSzUw5E/QwJTtd14/ACv0eGjko?=
 =?us-ascii?Q?KWEgXJ/34BC5hBjzIS54n3VbEeQxn+u2mwzPkNeXy3Vwpo3eaHltiQHTt+jY?=
 =?us-ascii?Q?ZrXmPnc0Obe1WBsLCkE4/WgIOSFQURBlgfQNTzy1tX4vgk1Mj6SjX4+mCOJ3?=
 =?us-ascii?Q?mhbkI7vVAeGExgGVt4QQ2XGCh3qJ5ymwxz6gO2mxbXuON6Msr1WlI+Crkjwt?=
 =?us-ascii?Q?au+ET7pjdabGsodIkwEXvhmD1/SGXRICc5Z4801y0ts6r7tq0iCnxdCk9Jwq?=
 =?us-ascii?Q?dLUvZFxKASOvoNiaAGalbHwyzre10vqgSJoDbJlkdF3Vt/giUocZ5UFGVqqj?=
 =?us-ascii?Q?aMIECRVNaE6hJOkhrkVgNtAgEaCLw5P9lsSS57uqkaUakXUsVCQwL+jRRIUk?=
 =?us-ascii?Q?1eeI98j/3Gb/rRYTMtzOLOD5t7riVt02AQ6wYtnwcsFO9/NO+lfUUAkY7C7Y?=
 =?us-ascii?Q?QEQUFmTIwTKSZ3qEhPpklc3QMx1WpSlVgSuXeNsYXwhZUKCYX9g0iLC2Z8ZT?=
 =?us-ascii?Q?0F1TfSJiN1HiBP7Z3wJ8O1mY8r8x5UUC686cDP6/mdOWf1jwxVDBYCW4UHL2?=
 =?us-ascii?Q?UOwBKyOR6hk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6doE/q5owYc7b9ZVOYDyPZ2S/asNckrFcAbHoucWw5zjBm0woPi0ajcl2X9J?=
 =?us-ascii?Q?d5Ccq8yGIySeGiPEi9BLdINmtVuBbi7CXOKbxLBLxpdkfA/Rw3LrOng4ShXr?=
 =?us-ascii?Q?7KWxxr9HqLGxh5NW8fLZjQIp067j7Sri4SgWXZ1Woi32t3UqsWOQSp7owA59?=
 =?us-ascii?Q?jGRw1ktAADJwaHxGejziER6F6wJ9dCSHuLtRMZbi0pgZDg9QZkt5GrYGGxAZ?=
 =?us-ascii?Q?h3lHcC3kfTRCn8p3WDO/YaEsluyu27xV0FScjXspM39AM+CDsniruvxS8KOb?=
 =?us-ascii?Q?Z/e1hrhFPfwY6fGaRoJ/fkvRzD0X0Cc8NdM7O827ZJdx0UOFK2wq9rh7kt6m?=
 =?us-ascii?Q?rftDxApzNoB7MLj8DQ5chNaesbEMugRxORwkwz9JfSqttNDEJ4JmJCvdx+eA?=
 =?us-ascii?Q?o+qlJo2Zme6NC+iJH1nAurre/FLRfp+/s1K/OPrHr7EAA0AJn938G/OlcYYW?=
 =?us-ascii?Q?VM88K0dOrM66MbMCXZ4s+dbfvU1FxNTFpCfP97+1l3kZEmRNZSuM9sazlwNl?=
 =?us-ascii?Q?e6LGDTFFjZbyVYlNdEtxwVie1ItCv7Jq2mfdykxrunC0wmq4BswLff9kFiCl?=
 =?us-ascii?Q?TzD169cRINuTK2isXJZtG1woK1iLzBELBOz23qecK5bpqPJZPrJgqtB5+W4+?=
 =?us-ascii?Q?OU1lcGwWPhWx2tTNM4YkAMoQ2Ry2qMPWAnQJKnuSsEqIIgfR4lPk7c90m5ld?=
 =?us-ascii?Q?rNkx6eRUj2igaXGI5apEYiev4OKQgMdFhegKgVUYElgfwXSuvllRtqoiVQYf?=
 =?us-ascii?Q?rxEOz+cN8b8q1UI/wCRf9SzJXUnuXsRn4mJttcZSxJwLV0I7KRC0q4ihhint?=
 =?us-ascii?Q?pbcaa87/TJVcPvmi20Wif2dKP7+mtCB6pq+mJxZI3qnfVZOe+cHcEa4TB2QD?=
 =?us-ascii?Q?2Nk+cqbqcYWbN8k6pdXM/d33fXdFv+zcUDMMepvdOZDnRLhPG+nAGQaZ7VD7?=
 =?us-ascii?Q?CEiw5mrCx8kNL7IyGgEL4+UISoDYas3W/CY/1zkTq8oHMHmcFliZHjCUtzO7?=
 =?us-ascii?Q?oX9/B3M2Mj4/VJ8bFV5v5ALljJnwGW5EJG0LCNXQJuViiE5GKa2hnAA6oeY4?=
 =?us-ascii?Q?fmkCRy8JoLVOm4hUN6F0JTCnvYt0/xAvAcCH7fSNtHEOucN0AWofdJSEJEJP?=
 =?us-ascii?Q?2WSKdEBjOkIlch5FBVbBpuGuiOCV9vm5PCYck1ZOFw/upaNTWA5e3VlHvlNg?=
 =?us-ascii?Q?cWRfYKfG3q/jEK9aObUsksTxjxw5pFJMpFibnXf8K4SWpInjanbxnfuYKL/u?=
 =?us-ascii?Q?/pcgu2uaxsVTwBKlrxIgEWqAtCtxyd10QwEAwU5yNSRNBRcYndGZ0RsBsSbb?=
 =?us-ascii?Q?EnSnwg1LKvE17+/RSnGH+1KskdFxq+08WZsAVUOamfiYYdAZLv71a+Q9XvtL?=
 =?us-ascii?Q?TDkqJhUkqZ0bxSf6hgS4wrAoXi+U/m8bKagUUJl7N9em6wDz7TVtxOj2ndnD?=
 =?us-ascii?Q?Le3mOtr/uJ1oDqcHFgH3u+zBIlft/KmQDougNJm4kLQ6hvEzFcdzuQgZbz1H?=
 =?us-ascii?Q?TrdZVxvn4s2TvXag7CrquHy2QKWvuY8H0pWzUFEii2orpfGR65kROKLgoEMT?=
 =?us-ascii?Q?kjA8Bu6NVRWduVU+W7Bmsi2qNJ/zUHQM3LqOXJWiUbovMvJnxdf8uPhysEiL?=
 =?us-ascii?Q?9w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 81466ff5-533d-4776-5d61-08ddde701847
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2025 15:58:38.4001 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e42V+HMyXR9jlNygAkLniL7Sn9j2HtpTop34+UOj/9zpDXDq9Pn0rEQvSSBYUnibgJzQi5MNBxJcE2ND0kr7b9z0sFcrGZEDho4sbW8lqFo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7595
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

On Fri, Aug 01, 2025 at 08:13:45PM +0200, Michal Wajdeczko wrote:
>The struct xe_pci_fake_data has fields that specify graphics and
>media stepping of the fake PCI device used during KUnit testing.
>
>Change definitions of those separate step fields and use existing
>struct xe_step_info definition that already have required fields.
>
>Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>---
> drivers/gpu/drm/xe/tests/xe_pci.c      | 4 ++--
> drivers/gpu/drm/xe/tests/xe_pci_test.h | 4 ++--
> drivers/gpu/drm/xe/tests/xe_wa_test.c  | 6 ++++--
> 3 files changed, 8 insertions(+), 6 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/tests/xe_pci.c b/drivers/gpu/drm/xe/tests/xe_pci.c
>index 9c715e59f030..81bc86647499 100644
>--- a/drivers/gpu/drm/xe/tests/xe_pci.c
>+++ b/drivers/gpu/drm/xe/tests/xe_pci.c
>@@ -94,10 +94,10 @@ static void fake_read_gmdid(struct xe_device *xe, enum xe_gmdid_type type,
>
> 	if (type == GMDID_MEDIA) {
> 		*ver = data->media_verx100;
>-		*revid = xe_step_to_gmdid(data->media_step);
>+		*revid = xe_step_to_gmdid(data->step.media);
> 	} else {
> 		*ver = data->graphics_verx100;
>-		*revid = xe_step_to_gmdid(data->graphics_step);
>+		*revid = xe_step_to_gmdid(data->step.graphics);
> 	}
> }
>
>diff --git a/drivers/gpu/drm/xe/tests/xe_pci_test.h b/drivers/gpu/drm/xe/tests/xe_pci_test.h
>index ce4d2b86b778..32452bd65bff 100644
>--- a/drivers/gpu/drm/xe/tests/xe_pci_test.h
>+++ b/drivers/gpu/drm/xe/tests/xe_pci_test.h
>@@ -10,6 +10,7 @@
>
> #include "xe_platform_types.h"
> #include "xe_sriov_types.h"
>+#include "xe_step_types.h"
>
> struct xe_device;
>
>@@ -17,10 +18,9 @@ struct xe_pci_fake_data {
> 	enum xe_sriov_mode sriov_mode;
> 	enum xe_platform platform;
> 	enum xe_subplatform subplatform;
>+	struct xe_step_info step;
> 	u32 graphics_verx100;
> 	u32 media_verx100;
>-	u32 graphics_step;
>-	u32 media_step;
> };
>
> int xe_pci_fake_device_init(struct xe_device *xe);
>diff --git a/drivers/gpu/drm/xe/tests/xe_wa_test.c b/drivers/gpu/drm/xe/tests/xe_wa_test.c
>index c96d1fe34151..a97d42b72d44 100644
>--- a/drivers/gpu/drm/xe/tests/xe_wa_test.c
>+++ b/drivers/gpu/drm/xe/tests/xe_wa_test.c
>@@ -92,8 +92,10 @@ static int xe_wa_test_init(struct kunit *test)
> 		.subplatform = param->subplatform,
> 		.graphics_verx100 = param->graphics_verx100,
> 		.media_verx100 = param->media_verx100,
>-		.graphics_step = param->step.graphics,
>-		.media_step = param->step.media,
>+		.step = {
>+			.graphics = param->step.graphics,
>+			.media = param->step.media,
>+		},

could simply be

	.step = param->step

to avoid needing to update it in future? Anyway,


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>


Lucas De Marchi

> 	};
> 	struct xe_device *xe;
> 	struct device *dev;
>-- 
>2.47.1
>
