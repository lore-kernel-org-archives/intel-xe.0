Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53375CF3963
	for <intel-xe@archiver.kernel.org>; Thu, 19 Sep 2024 19:06:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1351910E00D;
	Thu, 19 Sep 2024 19:06:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b0Blv5PV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56B3F10E00D
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Sep 2024 19:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726772786; x=1758308786;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=FHhv9eXMHkYGwmRHg4MA0Kf/n/HBV/jDz5WaxX+oBe0=;
 b=b0Blv5PVYVCR6Y2YLZR6nN+KN/hudfUOGKILPjblLaG4c1N9jl7qVnKN
 S/zXZ6GfWCkJgXIoxrlP6Y9XKd5F57tEDzwzcf3ssVNEP+gYECLUzAHBf
 DwBYlEKzYb6FHknTfKwJ/vN0jrFZQUfMy/8+//WKSCAvzm2VLvTTha7u0
 8li3jmzicYTXr86537VB3jzEfq3xbzmJbqabgbyspDDMm1qdcnsoZfipl
 NdzOGTs/geJudPajebMF2fXU3SVsRgwu78w/TNVzHTf7GdofsGIvrZLzR
 7N4C6vylhtYGcWEwIJ7F3dun9/1TvlNTOG+P9hIfcvHHwflfFVfld7fyH Q==;
X-CSE-ConnectionGUID: yhpjxvkGRbGBgyIJ8lQwVg==
X-CSE-MsgGUID: AfAATurtRvunTEh1DCsUKg==
X-IronPort-AV: E=McAfee;i="6700,10204,11200"; a="25583613"
X-IronPort-AV: E=Sophos;i="6.10,242,1719903600"; d="scan'208";a="25583613"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2024 12:06:25 -0700
X-CSE-ConnectionGUID: 0GTJz9oYQT+Th33vodrCCA==
X-CSE-MsgGUID: oYQVsqDJR8ureFCxK0QJ+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,242,1719903600"; d="scan'208";a="74392202"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Sep 2024 12:06:25 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 19 Sep 2024 12:06:24 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 19 Sep 2024 12:06:24 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 19 Sep 2024 12:06:24 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 19 Sep 2024 12:06:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UIclyBEk7QWsaB+R7FrGEDDIiUq0d/yW2ZrZNlOzib1gnszSuM7XQnZoCbQpcHTqyKyTQRCp5LGFh6hBrGZgnJoHmEg38E07jwudQgXIW3dmyY0ZeJ9Uw2jlA4xNR6F5wB5e4hvhcfk4LXFk+OxqyYBFCe/m8sA/L8ibimdmYTtgtydRc4l5kNWBhuVJezySztCcdJzEkvs+BUwdQO2JLw8wlCo/UpyLaF60k3nCpsFPyujHHh01kldki3yN8GGTIeT3GC9LEwQOiB82bIWX7BQgIv7NDiQ920PTYWp59inpM31VO/dRjsb+I5p0ED+lBMyy6NVghGm3LyIe32GdMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7uc0OYRcLQzn5NQYDebQQ1kHOwSlxezDpksMMgnxQrM=;
 b=Vk5CeCHYn3i3oa6qjFg8DeMHh4TX5jCfUGFtc13T2Y3prQGTDbSsO22UXH7c7Rt6xVrEqh2pQgsm7fsmfFrJ3QdB1cBulBCd2S9squKuYJ8Bh08aiMIZrbOfxTdprfvjPgXjJrcFd7x30O+jwEkShTsP32HciZCk7vJ1za55KxVaidkf0+zYcExEHbmC3jh5QrAZKR+l+D5l/tGbFemNE/Uc+INLysxHHXbi48KbtrOaBbGcZsTZUkwDui6Wo151DtCQr0mVmph8AtGyCnKSLGQm+MWcw2waCM1fsjyvP7jKTCcaUN2AC9evF5ntciH0xK4smEGM92gHT6vYA0zIaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB8069.namprd11.prod.outlook.com (2603:10b6:8:12c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.16; Thu, 19 Sep
 2024 19:06:14 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.7982.012; Thu, 19 Sep 2024
 19:06:14 +0000
Date: Thu, 19 Sep 2024 19:04:34 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Oak Zeng <oak.zeng@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/debugfs: Display gpuva info in debugfs
Message-ID: <Zux1wg6yBemL+bD6@DUT025-TGLU.fm.intel.com>
References: <20240918164545.3955824-1-oak.zeng@intel.com>
 <Zux1IqkPO2JgwVF9@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Zux1IqkPO2JgwVF9@DUT025-TGLU.fm.intel.com>
X-ClientProxiedBy: SJ0PR03CA0175.namprd03.prod.outlook.com
 (2603:10b6:a03:338::30) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB8069:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f26f5f3-833b-4389-772a-08dcd8de222c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/1Hk6fhgoB/cPPQjhmUmsNmgy0YQVGe4O1y3jspPMYLSZkRyYMZLqgws5GkZ?=
 =?us-ascii?Q?6M7yszOBlv9CCIFa8TSDOAedSOdCL+KW+KvHmGHHoZAuoKB7Gn4yYKmkUrtm?=
 =?us-ascii?Q?ZyJGUXeN9uNUIc20bOJJBq3Zqp6WZ9x42v9klsuihT1m3e/NtbFZ0ODjQ0ZR?=
 =?us-ascii?Q?eFUKZ0uWjtB6W+EB9WbQT4ehtqemIYKF33dFuDNuTLPTJtHoNzLa4KmWaeXG?=
 =?us-ascii?Q?QVPg+9O3VxAqUGG5cnszZzE+zsxSLDQJRZUgXM9tOrnBhy8oEiI44Vx+vqM9?=
 =?us-ascii?Q?oTqrj/qspa86MowdIeNm5VH4SscWZjSYqCwtptEpwlmDVgEhgW5OqDCoxaAo?=
 =?us-ascii?Q?fPdGIQCxSfRdB4zg6YAR9gAf5dZd+z3ZuEfyKo0MAGXGSIu9HTIUxUOOdZ9R?=
 =?us-ascii?Q?oaHtklYwyXRH/eXVLfopkju2MT9cwZX7dbrKS72rwnyJ/K0WvMR49NAcxorb?=
 =?us-ascii?Q?NNzUnWZTqZpVdxEMa0jf34cgHEuW1uxJ1rWFNJFhbjkdn/SmsfMg3DJobXUJ?=
 =?us-ascii?Q?vjne5UrX9sK2p3zDiRwUQEY/1bImpZz/EEfNJpeLR6F1M+2Iz/R/2Dme03m+?=
 =?us-ascii?Q?JUv7tFuCIKDEhyxBJwSQq02lAqlpnqMpVi7yP0hKNMU68MiFyISRAzfNYrFH?=
 =?us-ascii?Q?t7LDTWg9LWgWLaRaqWGo+EieqDXQU6dKURnus0isCSKVBEaU5XcjL7/sJFSn?=
 =?us-ascii?Q?ZpNXx+I4eN8joR0XKO3Xd8dSaaxlaXa0JtwOzDTvSatUSJ8aD8rIeYMgqsS1?=
 =?us-ascii?Q?2eC5b2lH1bOTCVt+64QLqSR5hRdpmFNcncx0ktG1XaJGEg3uqV6Z8jKIPclq?=
 =?us-ascii?Q?8si98RlcO6cERBIjBv64i0l/F9UvUTDttVrfEvlKen/VVksmDNK1tWXu2xhi?=
 =?us-ascii?Q?qKhrk9OtYY+Pjl5+Fi2fGXd4EkT3c2MpfYLwt53tbFnhdzjks37TM1NtIgSM?=
 =?us-ascii?Q?9JduVKOv/RPwYaklSlnHCdawjuiXUNOom5yfSv2TH97m1oDfDcVbVEVZkFj5?=
 =?us-ascii?Q?YkhQczlfw2W2Egn3RdTXhVf9i+IzNPYFw6G/R+pqnlTf/U0bhILzdiB0LINF?=
 =?us-ascii?Q?eOfgb6FXuAHtN1yDv/P9HQGl45wdL455+j1sganOBrwHotNZjtcnrzVCuwW4?=
 =?us-ascii?Q?2t546KVrDwgNm5Tpeaqk5NwJQA1yAQcuPWlellnGHINNuzSUasv46PZ1OS8P?=
 =?us-ascii?Q?vBU8LYqXsWXJESkl+hb3Z8/9GKHTvM9uDV+1SIzMZY8NlEhv3jpH6NVvLHBJ?=
 =?us-ascii?Q?/hojoNAvDdRqu+CWwI75T9Z3j4k45OqPyjsOI6njGRJ/RVYVEUInURwhlHuR?=
 =?us-ascii?Q?TqOJoK0xOxPHhgcZvogF3G0mZPJMsp51y3gI9WZ3O3sZ+g=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ick1+YaAan5hdsEerUhsmZdoFoWJD8MXyzdOJXJhl9oS9hauit9j72U8z3uG?=
 =?us-ascii?Q?TFoFxkLIB4ahHfRhREHBEfU4bj+fS7HsSXgObqCTQwaKSh0Dgk/jmgbc55nU?=
 =?us-ascii?Q?z/IzN4gycxDnaTL1AccC6tmfrE3VaQLzboXNnxChqxRe/A0EsHe5qHR+1LQ7?=
 =?us-ascii?Q?6NzePyTjIOtU6Xym3ktXgIiqpRpuqKsod6OqW+DLyg4Kj41YTQN4p6XYNthc?=
 =?us-ascii?Q?Y0cPHd2RjgcmWXeMuNabjBMcllIH61InmwNDHiiQXK7G8BugQCq3/oMMTvtL?=
 =?us-ascii?Q?LU5hiuKKl9pYa+/NBZKAc7qCKxEbEMVl0owNMPCE2sOatJY0kY0u4VDFaOso?=
 =?us-ascii?Q?UOMtEz9AHzXeNAgZHtAEYIcvd7rMGzhnK0Nrvq8YncCzg2I0GV+DLJVOjkLb?=
 =?us-ascii?Q?YpaangQgziIS09M6AOFWXb304A38cYAno2nWEpp1ylI7c4YdgGXfcg3jcl+p?=
 =?us-ascii?Q?FM5SG/3n7fz3o6fvqKGaJB3O3hGK8SLOFATScAHl/fAwj75klhlAgLiWJfvU?=
 =?us-ascii?Q?Rn4ZjqpWUDbJwQ5eIC2s/tpDES+OsmORbQRYw21o3AQIgS3U/Qkn1JvBGdxT?=
 =?us-ascii?Q?hDSU/eEcjG2MGf/dERHm1PUgFlLZj4CodDS+2P+ritwoqH7gkVnI65TGDrMg?=
 =?us-ascii?Q?s8sRCFLBdBj23P+Q5UeIoiv0MrnjE15iQUeI++wly14jxr7lN4kkKO4eDQwh?=
 =?us-ascii?Q?ICo/OYfkZsFcAK7vk8mV6M572JSkZSO+HwVdfDFEK+KGbOztjVqfu8SJaxdE?=
 =?us-ascii?Q?Vzc+Af+g2ByC25Uzp6SOSg+ViA2prVLzHEfsELg9E6vgKBzeR66nqMnK6HwD?=
 =?us-ascii?Q?L1dfjQkd11QK722xMuwwMt0cqzg1IiOXRy1QjcXF120OHwuqtnBSOZ48FZ7J?=
 =?us-ascii?Q?fOuGouZE6RdJuRLOL8U1UglL/j5ZiAA3njdLFNuB22KsMoYP8xaEYfCqZsN6?=
 =?us-ascii?Q?6/IXQoBcf7KYpBpjAniUhKnfkLWxN3BXuP/uwRlCPn9ceELeYLqaa2poQEme?=
 =?us-ascii?Q?0D6pkvuyvJCCg19tLATltR0flWq1OWpUOwcHRpo0UDXDd+nVgZmz8HmKK7WS?=
 =?us-ascii?Q?rWD+GekyCkDogemuCPh96c4D+sNNErWfzHmQJqokMg9pYHu4iDL6cL7ZdkVQ?=
 =?us-ascii?Q?G3v2rPUbGJab7qKKDvBAZ5SpGVvF7Jh+lElYpjfsaXuUMPvFEChB2BoIIqCT?=
 =?us-ascii?Q?Hezxiprnz5UkVfpiBo63YlnF207/sjCUll1QGuPOh9AlJK3swj5CsaNND858?=
 =?us-ascii?Q?VaIX+LsJiWe+3o/Zm/ICKNB6BcwSWpTIAZL1VlsmMfCtkuhAuzreZX6+52ms?=
 =?us-ascii?Q?fai8z1bbkgVIdfhkiC6QlLr/naW4eZxe4cx8U+SyClysgLzraVZJ/lT1/gkQ?=
 =?us-ascii?Q?HwjXU7WCaVT7ebGF+vd9tNO/zayQ4PNEWFJaCCPPiQXGiLsyLkNlFJ9HiSPH?=
 =?us-ascii?Q?ZoFLZy7kfbQi6qemurKJwL/JSNWN5eZ8m834GDyxa+1jdpi2cEJ6bK23nBzw?=
 =?us-ascii?Q?ASZu2D6ZMgth/qsTXc4gqYpnRev/jz9zmKVGNoMMI199nu2P0S7pSO2VpqF2?=
 =?us-ascii?Q?4z/t6pfmYU+nkgNEoxmA24xq1Y6Ov5KYYmra8WCslQ1McTNyAXEu+kTJEdCh?=
 =?us-ascii?Q?Hw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f26f5f3-833b-4389-772a-08dcd8de222c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2024 19:06:14.8316 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I7JtSL6uIiN+DMm/PVgHmLH2qNakC2d5/ZkD4nKKCM3BB1HQhNiSWd2FljMiLVjZKK76WAsQ5GTs0bKOnrmOug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8069
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

On Thu, Sep 19, 2024 at 07:01:54PM +0000, Matthew Brost wrote:

Ugh, typos. Need to proof read better. Fixed below.

> On Wed, Sep 18, 2024 at 12:45:45PM -0400, Oak Zeng wrote:
> > Add debugfs entry to display all the gpuva that is bound to the
> > device. This is done by walking all the VMs created for each device
> > process, and display va information of each VM. This is useful for
> > gpuvm debugging. With this change, user can display gpuva info
> > as below:
> > 
> > root@DUT7279PVC:/home/gta# cat /sys/kernel/debug/dri/0/gpuvas
> > Process "your process name" GPU VA space
> > DRM GPU VA space (Xe VM) [0x0000000000000000;0x0200000000000000]
> > Kernel reserved node [0x0000000000000000;0x0000000000000000]
> > 
> >  VAs | start              | range              | end                | object             | object offset
> > -------------------------------------------------------------------------------------------------------------
> >      | 0x0000000000000000 | 0x00007ffff5db7000 | 0x00007ffff5db7000 | 0x0000000000000000 | 0x0000000000000000
> >      | 0x00007ffff5db7000 | 0x0000000000001000 | 0x00007ffff5db8000 | 0x0000000000000000 | 0x00007ffff5db7000
> >      | 0x00007ffff5db8000 | 0x00ff80000a248000 | 0x0100000000000000 | 0x0000000000000000 | 0x0000000000000000
> > 
> 
> This looks useful. We may even want to extend wedged mode to switch the
> VM to a state where this is available after a hang which causes a wedge
> as this could useful. Can be done in a follow up later.
> 
> > Signed-off-by: Oak Zeng <oak.zeng@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_debugfs.c | 44 +++++++++++++++++++++++++++++++++
> >  1 file changed, 44 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
> > index 1011e5d281fa..0c7bee1c2a8d 100644
> > --- a/drivers/gpu/drm/xe/xe_debugfs.c
> > +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> > @@ -9,6 +9,7 @@
> >  #include <linux/string_helpers.h>
> >  
> >  #include <drm/drm_debugfs.h>
> > +#include <drm/drm_drv.h>
> >  
> >  #include "xe_bo.h"
> >  #include "xe_device.h"
> > @@ -84,9 +85,52 @@ static int sriov_info(struct seq_file *m, void *data)
> >  	return 0;
> >  }
> >  
> > +static int show_vm_gpuvas(struct xe_vm *vm, struct seq_file *m)
> > +{
> > +	int ret;
> > +
> > +	mutex_lock(&vm->snap_mutex);
> > +	ret = drm_debugfs_gpuva_info(m, &vm->gpuvm);
> > +	mutex_unlock(&vm->snap_mutex);
> > +
> > +	return ret;
> > +}
> > +
> > +static int show_each_vm(struct seq_file *m, void *arg)
> > +{
> > +	struct drm_info_node *node = (struct drm_info_node *)m->private;
> > +	struct xe_device *xe = node_to_xe(node);
> > +	struct drm_device *dev = &xe->drm;
> > +	struct drm_file *file;
> > +	struct xe_file *xef;
> > +	int (*show)(struct xe_vm *, struct seq_file *) = node->info_ent->data;
> > +	struct xe_vm *vm;
> > +	unsigned long idx;
> > +	int ret = 0;
> > +
> > +	mutex_lock(&dev->filelist_mutex);
> > +	list_for_each_entry(file, &dev->filelist, lhead) {
> > +		xef = (struct xe_file *)file->driver_priv;
> > +		seq_printf(m, "Process %s GPU VA space\n", xef->process_name);
> > +		mutex_lock(&xef->vm.lock);
> > +		xa_for_each(&xef->vm.xa, idx, vm) {
> 
> Kinda a nit but I've said this in a few other places - the xef->vm.lock
> read usage isn't right here. This look protects the xarray lookup and

s/read usage/usage

a/This look protects/This lock protects

> ref to VM and nothing else. It is not designed to do anything else -
> e.g. holding the lock then calling another function.
> 
> With that this loop should look like this.
> 
> mutex_lock(&xef->vm.lock);
> xa_for_each(&xef->vm.xa, idx, vm) {
> 	xe_vm_get(vm);
> 	mutex_unlock(&xef->vm.lock);
> 
> 	/* Do something */
> 	
> 	mutex_lock(&xef->vm.lock);
> 	xe_vm_put(vm);

xe_vm_put(vm);
mutex_lock(&xef->vm.lock);

Matt

> }
> mutex_unlock(&xef->vm.lock);
> 
> This avoids unintentionally creating locking chains, in this case
> xef->vm.lock -> snap_mutex. We should strive to only create well defined
> changes of locking. Once we start unintentionally creating locking
> chains it hard to unwind in a driver.
> 
> Likewise I suspect we really shouldn't be holding dev->filelist_mutex
> and doing things underneath it. Fixing that would likely require
> converting &dev->filelist to an xarray or writing an iterator with a
> hitch though so is a bit of a larger change. Looking at the usage of
> this lock, I'd say this is kinda abusing this lock too and I don't think
> anyone in the community would be all that happy about its usage here.
> I'd lean towards we need to properly fix this, or alternatively maybe
> just maintain a per device storage of all the VMs.
> 
> Matt
> 
> > +			ret = show(vm, m);
> > +			if (ret < 0)
> > +				break;
> > +
> > +			seq_puts(m, "\n");
> > +		}
> > +		mutex_unlock(&xef->vm.lock);
> > +	}
> > +	mutex_unlock(&dev->filelist_mutex);
> > +
> > +	return ret;
> > +}
> > +
> >  static const struct drm_info_list debugfs_list[] = {
> >  	{"info", info, 0},
> >  	{ .name = "sriov_info", .show = sriov_info, },
> > +	DRM_DEBUGFS_GPUVA_INFO(show_each_vm, show_vm_gpuvas),
> >  };
> >  
> >  static int forcewake_open(struct inode *inode, struct file *file)
> > -- 
> > 2.26.3
> > 
