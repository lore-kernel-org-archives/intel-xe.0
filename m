Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DB63C02183
	for <intel-xe@archiver.kernel.org>; Fri, 17 Jan 2025 00:02:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2D2C10E0F3;
	Fri, 17 Jan 2025 00:02:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LtfZfnlT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B364B10E0F3
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Jan 2025 00:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737072175; x=1768608175;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=oCxVod1rLgq8o3306O5KJiZBpzeDjwr8IIgtCE4UbrQ=;
 b=LtfZfnlTZnTENlILTbSNXYDR5u+PhOl8MWXFSYm8bWtMPXsiZcoxny63
 1jgDM6rHCsuz0G3TFFlaKq0g5Mo8/LQDlYwOSzv/mw2mRlbb3dprTCeC1
 NAHmFLti58nWzGAFqPqZc/uxo9LlAEybgP8U9a2ghvFXhV3w7FZ1w0zxl
 NLgIqaiUye2RccoK4tptpnRNVRdUA3/7xqpB7WNYLgJRJFbcEcnpyaz+u
 tk0nR1I6L8XGoYsXiwsHjFx2i05YSd/FUOLNVG9MkFWaSFUiBde/3Io6Y
 y7g9acaOHa9pQkMKAMFZDz52m964Ixt6pXZhhg8wMiVDQVqa4Ss2d3oHZ Q==;
X-CSE-ConnectionGUID: KrbOAwJ0T66zq0ZoHXFfuw==
X-CSE-MsgGUID: uAEzfZjgRHKhsx1uZ5/4Ow==
X-IronPort-AV: E=McAfee;i="6700,10204,11317"; a="54898025"
X-IronPort-AV: E=Sophos;i="6.13,210,1732608000"; d="scan'208";a="54898025"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2025 16:02:53 -0800
X-CSE-ConnectionGUID: VjaT16SvRd2xQZRhvR0P8Q==
X-CSE-MsgGUID: DqA3Bt5nRYq60LQEGFnsAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,210,1732608000"; d="scan'208";a="105427059"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Jan 2025 16:02:50 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 16 Jan 2025 16:02:49 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 16 Jan 2025 16:02:49 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 16 Jan 2025 16:02:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mKBwCwv1VaNagejJJ91HTJseGbK+j1sF06zrGQLMfE9sgXUgJh+d0d5BwSNHmBTNH1SGjAFTYJMVQHkrJofwEloppBd+lY791EEVnl20CRZ88/H3SXP1fuWixvSW53A3I7AHdUOmdOnMO7A3ONE3oew/J4bAXovnOx0IQRy7rln5cV62TptuXry55PxzAPrqNP/ohTwbo/jZUsHA5TsJkWaqu3bONIh+tMGsCHkoQdCSZkciCSNWn3YKHFryaz02FbaX10KIYKXsL6Wzl/onm/verXVHFwzbOsP1decEkSRmHiTZbmff76p4xNz6BFw3bWxL5/O4kIpDnVnAks6D9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gEYOVUcidGFrqc3S0F2M4Wtp21WDZiwLWNWAM2sVQO8=;
 b=Z2Sszz0O9qjPD04f7keZCkMXLHP2LsS/OlXVanmNFiss1pUiLK/0O20Zgo1wcl4DtWNNj6TN4OmsM9IKxlfdZkwbx9BJylTi/mb6Y8wgdmui7QqV+p+M1xHifV5kE41CX0ZsfWgsIZQqtoFsiK5cgL7BngmyO33+OQGSjjQi+EO76CL5lPZkg5eck2LYYYRGm3wQJ6vRXHnXiPWBtm8kvMyWcKkekmy7UkrDwe0zu6rw3cK76hM28orZk2kJdeJsQbs5HiAxnVqkxjJHVlhhEb+AY0wE8FJwqTmGbtZqYKe1bXoZykoosalzwauCl6VnJN24Kbp2VgZe/avUY6w0Iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DM6PR11MB4564.namprd11.prod.outlook.com (2603:10b6:5:2a0::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.16; Fri, 17 Jan
 2025 00:02:46 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%4]) with mapi id 15.20.8356.010; Fri, 17 Jan 2025
 00:02:45 +0000
Date: Thu, 16 Jan 2025 16:02:43 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Pottumuttu, Sai Teja" <sai.teja.pottumuttu@intel.com>
Subject: Re: [PATCH 1/2] drm/xe: Refactor dma_mask_size
Message-ID: <20250117000243.GJ5109@mdroper-desk1.amr.corp.intel.com>
References: <20250116125447.4025927-1-sai.teja.pottumuttu@intel.com>
 <20250116125447.4025927-2-sai.teja.pottumuttu@intel.com>
 <a5b305a50c5b0b2b29557be65d6b3fee6c734bd9.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a5b305a50c5b0b2b29557be65d6b3fee6c734bd9.camel@intel.com>
X-ClientProxiedBy: BY5PR04CA0011.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::21) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DM6PR11MB4564:EE_
X-MS-Office365-Filtering-Correlation-Id: 0441d0c5-33b3-431e-4fa0-08dd368a4584
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?lcO6EBseYBkdAyWEIKJrEb/JvGx8ROwwQahrRFskm4m6JTJLvRlSj2/eAJ?=
 =?iso-8859-1?Q?Z3ciDZCRfr6cn0K9C6BQfN6+ljgLEELNzZLZ9hY1NR6o38AKzb+z7leSb5?=
 =?iso-8859-1?Q?1HDYhKRy0m7RgZGdCfoSE0Xx48Rx065SVLD9CaGeqTZZ3+uYz9xJDaxRwp?=
 =?iso-8859-1?Q?U4bM0RYGU9kQ3cYoXd7j4I0hkqk0L96iZbzYzwNSIVRfFRG9gResjlbY2X?=
 =?iso-8859-1?Q?veHe52hfNGd3eS6Id9kNTKpXNuEHNXHfEAbaglO/yDAi6cr5mpG8WH+S9D?=
 =?iso-8859-1?Q?FhI1Ey7zY3LMHaJsFtXbO6gR5ELyqcSqRrKv3MG+JPmkhACp+MGjagS0oi?=
 =?iso-8859-1?Q?dMe0+2NC5QFeem1PusN5SbxdxPdMqMGeH2sPpxjwVTza7rkVMEpCsEUXFB?=
 =?iso-8859-1?Q?+ok1hcjl/GKglx2d/JE6FX2JdSuDQlcx3Oa1b720U8S/qtMbmw52M5K/8j?=
 =?iso-8859-1?Q?iODOEKai89fLGh7JU8up3gpMn+h+fbBJ6wqvNvNg5J3Cn/7LKwzwXceN4+?=
 =?iso-8859-1?Q?embzOFfxqRtGhLGfITYNw9w7Pqvx2kUdVK1nywoDurXjAgjSTV9sjz/xg1?=
 =?iso-8859-1?Q?pwhmKDFy7W9G9SAowGKaz+zX9CbsHE+d6DtCTQZqdwI5QugHTmwnPJVpQ7?=
 =?iso-8859-1?Q?ShgZWOh+qjLs9mf3O8TLxKin2/+hWUEUgCSpSi7fyodzGFOTBBBbZkEGl2?=
 =?iso-8859-1?Q?OSyodw25vP3iicDcRB9vW2edwLIiLsC/d+txbTVJU824rexmD5N9W2fOca?=
 =?iso-8859-1?Q?PrB/zbp1PUuSREufginnIywU79LV/DCKNDqKfEr0bjcdKdqEnHcpPahaPI?=
 =?iso-8859-1?Q?e0W1Jgcwir957qGvFgac85ym6Q4vIkL19RzQekOg3b+jk0owTu47NgEgMU?=
 =?iso-8859-1?Q?kAcxRi6uS6kVMoDQWgbw+7wof6/eriLW6tiGjuh3wV9XTzxA0t/bSMPJZB?=
 =?iso-8859-1?Q?LDY6ezVK8nUU5K/L9pIZcMZhwS0WgP+0PSmrnMPKcJk1lWIVH1oXujCJng?=
 =?iso-8859-1?Q?LDWPRWcJuTNU8TLmuoCWFnn3vJYOS/UsrCJ6lhFW8HTAQZHkpa/7JNOD+0?=
 =?iso-8859-1?Q?8z3H3WtRBxuEbh8Vbx8XyzIQtmWNTRMOFscrmSdBbZtaURtEipRBIgCwzj?=
 =?iso-8859-1?Q?jh+CoxZ+GwepNxG2DBMinpwmzgUgS7IKkiiW32MQ9AU9KfgsEGU0A6m2N/?=
 =?iso-8859-1?Q?RDDK8q/esEsgUAsLx9TfYAZ5R654ls7ykz3g6JOLDdcYTEEUY/xdFZcffs?=
 =?iso-8859-1?Q?1gXhCbBMm1sp7rKHkW/EHA7Vz9C2rlzgEXkvI2RfS4pNXGRsG7qmNFulAW?=
 =?iso-8859-1?Q?bhI99Tzy+yrMZUsP6uIeyyAEhzlS3s0CGIt0oueBy+Kfd3w4VCmScmnXtG?=
 =?iso-8859-1?Q?N3CnanuC2ZLQOaeefh7VDW9DaReEl4yK6zG33QTw1UAREDL8T6vvzJG1Wb?=
 =?iso-8859-1?Q?XJcuKIBlrX9HIWta?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?4ybQc54JfTvSQm9117FMzXfsM5Ku6zFPwN3Lfr6RTAYGH3OETWoV28hsQe?=
 =?iso-8859-1?Q?neInde7h2D61pw2Q95Z4tbfD38YZ3Zk85Ko9wiE+X4v1C0b8Nb1dnNKqkq?=
 =?iso-8859-1?Q?V2tuna6diEXubLtPi1oQMl497C2oAzOfPQdaiyeaCljRtDo0OaIkCb7VPX?=
 =?iso-8859-1?Q?nMfe6Cnzrr399QjVvk+XXUgQBuDnfvC2seCP8nTkmes+vIFrMS3e+sXyB6?=
 =?iso-8859-1?Q?NwJLcnuQP3VuyZYEfi95nntFVFQgGcIYfKVzT5RIGwuxD8WWlycI21UI3A?=
 =?iso-8859-1?Q?jZy/rXfRFiuCjpsRJoICDkpfwP+QhtXqyS4pz/JH0BpeD7O1xRdU+Hm1oS?=
 =?iso-8859-1?Q?w6rjycEvg/gzC3xAffedkLWGusX5gZsJJdT4vhO4I/xs18WVjGZz/fwj4U?=
 =?iso-8859-1?Q?xMus2P/w9jQoC3EEnnWzmTXxddqkB59yjoggrg+XoWWWxZ1b1QUpUq08Eo?=
 =?iso-8859-1?Q?6D74EA0mFD4+eOSx3uJ/vsjSSDbhcoNB8bfwzTxOT7mCjT+kiMJ+FwHDfY?=
 =?iso-8859-1?Q?4x+f2Xy8cz4PqQT56DQe+EG9EHjrCFdxbsPI61+x/Tu1FUoCc9uIhYB0jO?=
 =?iso-8859-1?Q?vdVT3P6zWpOw/eguCWdKcMKeF/yhzjBYX5uexaDgVQOMiXG4Wu+RI5pPMk?=
 =?iso-8859-1?Q?j3US41MLSRiYtOUEbURbeOLpCLJu9Doca+1CE54bQ5yoi2QlsSgGBS/O6Z?=
 =?iso-8859-1?Q?BH515TY1HvwZOYUAPJqxzr7Sg0YDzRfbZWqISfOkB69M5SZ5s2ClARmQXS?=
 =?iso-8859-1?Q?Rn+I+XjL3RCU1rKlHmUWD8xSzfCaUGTz8E5acOdfraQVjpNHdG6L45d3pm?=
 =?iso-8859-1?Q?LMnv1ttpgGnF0sprcwbGvby42U/SVsAvVgmDU3t/1ddBOtn9NiNYvGFzHE?=
 =?iso-8859-1?Q?yxwsjei4MGLvgjdBWjf593gcQM569ejrxZrJzl2qFiJlxcrRWhSQF0PRc/?=
 =?iso-8859-1?Q?9P1QKqIJ5KRtb1ooXc8q2SXdq1VFZTfdZj+ZCcZiIRjZQg80UD46ywxfJm?=
 =?iso-8859-1?Q?XII4gc6dppslhRReWNhnHRjSJZGdgz5Y7YA9f2+GLvxDgV/jBaK4MPGAwN?=
 =?iso-8859-1?Q?xCl1SX86qX7NRUQQ6KbJz7GkHPiCeKvnct+3EVc5dhlteiIfLxus+cBTyG?=
 =?iso-8859-1?Q?p8nP6YkgU36X7fZ8HtFL36IF4kKUB/Bj3VSdmyrjktIcJ+xkb6LBUvVp/y?=
 =?iso-8859-1?Q?1EkFygX/+rXNV5mqL3wqyT4h8+zaaZ4rceX+cJZXYZ/QKB7eSlUFJBUkd9?=
 =?iso-8859-1?Q?RK9PhyNafH7/Na50d3eQIK1BRrncnyOBLc7LIuEZnoBrAlxaY/KRldki+7?=
 =?iso-8859-1?Q?z5TKwV56/dtGPLGo20bqcP0b4bqXnf0FRBMsypwHEuO0BgYay/bc0sBjXg?=
 =?iso-8859-1?Q?XRBAU+BAkoL6U1M6ieCqjJD9UFt6I7/i0//oI6sYn/EtcjwdXKSbOmWESP?=
 =?iso-8859-1?Q?qW7ULl4MFnG5Yk5S5NdQA+Kmor6BPzAzH0jmPNIiiGdunvGwlZ4cjeYBiO?=
 =?iso-8859-1?Q?USXxS2E4rHUPJpDr4nLcPtYHO/qQMR1LQFXdmB96Z4IZkeqJWtOQpy4xQU?=
 =?iso-8859-1?Q?dnUPip8HTwlM4vYL2iCFOuTMfLaeG64XLwB1wb1pnZnapM/zQO7Occq9uI?=
 =?iso-8859-1?Q?4kJvyucEyPAAEVrrrpK4MqayCB7d9ZM6Qt8KiHAv6cZIh8++jUoU9n0w?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0441d0c5-33b3-431e-4fa0-08dd368a4584
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2025 00:02:45.7805 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zaCumL1iGoHlog0u8UFDPFs344h3ECIlZc3qK6215BCmRBfMHYcRfbA3rBT953odYlTunHaHkIlEPH9qT8vD1054pEm+1MsAMr+PcYKyetQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4564
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

On Thu, Jan 16, 2025 at 11:10:22AM -0800, Summers, Stuart wrote:
> On Thu, 2025-01-16 at 18:24 +0530, Sai Teja Pottumuttu wrote:
> > dma_mask_size is more related to the platform than the GT IP. Thus
> > move it to platform descriptors.
> 
> Can you give some more reasoning for why you think this needs to
> change? The phys address bits are specific to the graphics IP
> typically. Are you expecting this to be different for different
> platform SKUs?

I don't know if I agree with that.  The graphics version (as read from
the GT's GMD_ID register) is really concerned with the stuff inside the
primary GT, not the GPU as a whole.  The physical address size is more
related to the platform itself, and concepts like the GTT that live
outside the GT at the tile level.  So in my mind this seems like a
correct refactor from a design perspective, even if it's not super
critical to anything today.

I don't know if we'll ever actually try to do it, but there have been
suggestions in the past that it might be useful to be able to load the
driver with the primary GT uninitialized/untouched on an igpu[*] (e.g.,
if you have defective hardware/firmware and don't want to touch the
graphics, but still want to use display + media).  It would definitely
require a fair amount of driver work to make that possible, but patches
like this would be an important step since we'd have a graphics version
of 0.0 when running in such a mode.  The media and display IP would
still be using the GTT, and we should be able to determine the
characteristics of the address spaces from the platform itself rather
than relying on inspection of the primary GT.

[*] Doing this on a dgpu would be significantly harder than an igpu
    since we generally want to use the BCS engines inside the primary GT
    for vram fills/copies.


Matt

> 
> Thanks,
> Stuart
> 
> > 
> > Signed-off-by: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_pci.c       | 22 ++++++++++++++++------
> >  drivers/gpu/drm/xe/xe_pci_types.h |  1 -
> >  2 files changed, 16 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_pci.c
> > b/drivers/gpu/drm/xe/xe_pci.c
> > index 48d1c81d441e..f59c1acae23f 100644
> > --- a/drivers/gpu/drm/xe/xe_pci.c
> > +++ b/drivers/gpu/drm/xe/xe_pci.c
> > @@ -54,6 +54,8 @@ struct xe_device_desc {
> >  
> >         enum xe_platform platform;
> >  
> > +       u8 dma_mask_size;
> > +
> >         u8 require_force_probe:1;
> >         u8 is_dgfx:1;
> >  
> > @@ -83,7 +85,6 @@ static const struct xe_graphics_desc graphics_xelp
> > = {
> >  
> >         .hw_engine_mask = BIT(XE_HW_ENGINE_RCS0) |
> > BIT(XE_HW_ENGINE_BCS0),
> >  
> > -       .dma_mask_size = 39,
> >         .va_bits = 48,
> >         .vm_max_level = 3,
> >  };
> > @@ -95,14 +96,12 @@ static const struct xe_graphics_desc
> > graphics_xelpp = {
> >  
> >         .hw_engine_mask = BIT(XE_HW_ENGINE_RCS0) |
> > BIT(XE_HW_ENGINE_BCS0),
> >  
> > -       .dma_mask_size = 39,
> >         .va_bits = 48,
> >         .vm_max_level = 3,
> >  };
> >  
> >  #define XE_HP_FEATURES \
> >         .has_range_tlb_invalidation = true, \
> > -       .dma_mask_size = 46, \
> >         .va_bits = 48, \
> >         .vm_max_level = 3
> >  
> > @@ -137,7 +136,6 @@ static const struct xe_graphics_desc
> > graphics_xehpc = {
> >                 BIT(XE_HW_ENGINE_CCS2) | BIT(XE_HW_ENGINE_CCS3),
> >  
> >         XE_HP_FEATURES,
> > -       .dma_mask_size = 52,
> >         .max_remote_tiles = 1,
> >         .va_bits = 57,
> >         .vm_max_level = 4,
> > @@ -158,7 +156,6 @@ static const struct xe_graphics_desc
> > graphics_xelpg = {
> >  };
> >  
> >  #define XE2_GFX_FEATURES \
> > -       .dma_mask_size = 46, \
> >         .has_asid = 1, \
> >         .has_atomic_enable_pte_bit = 1, \
> >         .has_flat_ccs = 1, \
> > @@ -218,6 +215,7 @@ static const struct xe_device_desc tgl_desc = {
> >         .graphics = &graphics_xelp,
> >         .media = &media_xem,
> >         PLATFORM(TIGERLAKE),
> > +       .dma_mask_size = 39,
> >         .has_display = true,
> >         .has_llc = true,
> >         .require_force_probe = true,
> > @@ -227,6 +225,7 @@ static const struct xe_device_desc rkl_desc = {
> >         .graphics = &graphics_xelp,
> >         .media = &media_xem,
> >         PLATFORM(ROCKETLAKE),
> > +       .dma_mask_size = 39,
> >         .has_display = true,
> >         .has_llc = true,
> >         .require_force_probe = true,
> > @@ -238,6 +237,7 @@ static const struct xe_device_desc adl_s_desc = {
> >         .graphics = &graphics_xelp,
> >         .media = &media_xem,
> >         PLATFORM(ALDERLAKE_S),
> > +       .dma_mask_size = 39,
> >         .has_display = true,
> >         .has_llc = true,
> >         .require_force_probe = true,
> > @@ -253,6 +253,7 @@ static const struct xe_device_desc adl_p_desc = {
> >         .graphics = &graphics_xelp,
> >         .media = &media_xem,
> >         PLATFORM(ALDERLAKE_P),
> > +       .dma_mask_size = 39,
> >         .has_display = true,
> >         .has_llc = true,
> >         .require_force_probe = true,
> > @@ -266,6 +267,7 @@ static const struct xe_device_desc adl_n_desc = {
> >         .graphics = &graphics_xelp,
> >         .media = &media_xem,
> >         PLATFORM(ALDERLAKE_N),
> > +       .dma_mask_size = 39,
> >         .has_display = true,
> >         .has_llc = true,
> >         .require_force_probe = true,
> > @@ -279,6 +281,7 @@ static const struct xe_device_desc dg1_desc = {
> >         .media = &media_xem,
> >         DGFX_FEATURES,
> >         PLATFORM(DG1),
> > +       .dma_mask_size = 39,
> >         .has_display = true,
> >         .has_heci_gscfi = 1,
> >         .require_force_probe = true,
> > @@ -302,6 +305,7 @@ static const u16 dg2_g12_ids[] = {
> > INTEL_DG2_G12_IDS(NOP), 0 };
> >  static const struct xe_device_desc ats_m_desc = {
> >         .graphics = &graphics_xehpg,
> >         .media = &media_xehpm,
> > +       .dma_mask_size = 46,
> >         .require_force_probe = true,
> >  
> >         DG2_FEATURES,
> > @@ -311,6 +315,7 @@ static const struct xe_device_desc ats_m_desc = {
> >  static const struct xe_device_desc dg2_desc = {
> >         .graphics = &graphics_xehpg,
> >         .media = &media_xehpm,
> > +       .dma_mask_size = 46,
> >         .require_force_probe = true,
> >  
> >         DG2_FEATURES,
> > @@ -321,6 +326,7 @@ static const __maybe_unused struct xe_device_desc
> > pvc_desc = {
> >         .graphics = &graphics_xehpc,
> >         DGFX_FEATURES,
> >         PLATFORM(PVC),
> > +       .dma_mask_size = 52,
> >         .has_display = false,
> >         .has_heci_gscfi = 1,
> >         .require_force_probe = true,
> > @@ -330,23 +336,27 @@ static const struct xe_device_desc mtl_desc = {
> >         /* .graphics and .media determined via GMD_ID */
> >         .require_force_probe = true,
> >         PLATFORM(METEORLAKE),
> > +       .dma_mask_size = 46,
> >         .has_display = true,
> >  };
> >  
> >  static const struct xe_device_desc lnl_desc = {
> >         PLATFORM(LUNARLAKE),
> > +       .dma_mask_size = 46,
> >         .has_display = true,
> >  };
> >  
> >  static const struct xe_device_desc bmg_desc = {
> >         DGFX_FEATURES,
> >         PLATFORM(BATTLEMAGE),
> > +       .dma_mask_size = 46,
> >         .has_display = true,
> >         .has_heci_cscfi = 1,
> >  };
> >  
> >  static const struct xe_device_desc ptl_desc = {
> >         PLATFORM(PANTHERLAKE),
> > +       .dma_mask_size = 46,
> >         .has_display = true,
> >         .require_force_probe = true,
> >  };
> > @@ -612,6 +622,7 @@ static int xe_info_init_early(struct xe_device
> > *xe,
> >         xe->info.subplatform = subplatform_desc ?
> >                 subplatform_desc->subplatform : XE_SUBPLATFORM_NONE;
> >  
> > +       xe->info.dma_mask_size = desc->dma_mask_size;
> >         xe->info.is_dgfx = desc->is_dgfx;
> >         xe->info.has_heci_gscfi = desc->has_heci_gscfi;
> >         xe->info.has_heci_cscfi = desc->has_heci_cscfi;
> > @@ -676,7 +687,6 @@ static int xe_info_init(struct xe_device *xe,
> >         xe->info.graphics_name = graphics_desc->name;
> >         xe->info.media_name = media_desc ? media_desc->name : "none";
> >  
> > -       xe->info.dma_mask_size = graphics_desc->dma_mask_size;
> >         xe->info.vram_flags = graphics_desc->vram_flags;
> >         xe->info.va_bits = graphics_desc->va_bits;
> >         xe->info.vm_max_level = graphics_desc->vm_max_level;
> > diff --git a/drivers/gpu/drm/xe/xe_pci_types.h
> > b/drivers/gpu/drm/xe/xe_pci_types.h
> > index 873efec5cdee..7437415a54d5 100644
> > --- a/drivers/gpu/drm/xe/xe_pci_types.h
> > +++ b/drivers/gpu/drm/xe/xe_pci_types.h
> > @@ -13,7 +13,6 @@ struct xe_graphics_desc {
> >         u8 ver;
> >         u8 rel;
> >  
> > -       u8 dma_mask_size;       /* available DMA address bits */
> >         u8 va_bits;
> >         u8 vm_max_level;
> >         u8 vram_flags;
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
