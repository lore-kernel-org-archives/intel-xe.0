Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFAE4E9B342
	for <intel-xe@archiver.kernel.org>; Mon,  2 Mar 2026 09:43:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B528310E472;
	Mon,  2 Mar 2026 09:43:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NuUZhc1m";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02D4110E472
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Mar 2026 09:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772444629; x=1803980629;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=JeOc7+J4VyYqD+afKNfi+smJJyiyN+h3OZY7m1EjNzk=;
 b=NuUZhc1mfSMBX7A7lcymiPgTNakQjMgF/vLSMY54qUrG40jamAwXrv0l
 kzS9N/qhoi2ZvU4Hc0DtyjvHX22pMyOlPU1cldn/IZkawrZ2bo0MB9rMp
 PNsJaeLcr4s7QvvA0RweyW2EtkX/QWBPR5utWuNrnR2FKHfpBDSoTBHg1
 qMnhwLYUGkZH7M6w6ncmAXwrgWStiIZ4Xe7Hb/1okKd3raBDvbXMUnwPU
 ehGSfs6x9mLvuPUGbyHzQMOFHEUhVq1mW7DdAv0Q4kpyHnzo/jjIyV7W+
 godLxevNfp37xsPzyp/zjd/WHk1DoSF0bfhomPa+ffeiV4Lwzn0rO5VQ4 w==;
X-CSE-ConnectionGUID: qngicSmPSBW7XslzRqV6zw==
X-CSE-MsgGUID: PyIp+zo2RF2k1g18HSohsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11716"; a="84540305"
X-IronPort-AV: E=Sophos;i="6.21,319,1763452800"; d="scan'208";a="84540305"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 01:43:49 -0800
X-CSE-ConnectionGUID: dNXAfUXiRr6mZerP5EfS6w==
X-CSE-MsgGUID: rYrWoo2qRtaui47FYK25/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,319,1763452800"; d="scan'208";a="222574608"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 01:43:49 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 2 Mar 2026 01:43:48 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 2 Mar 2026 01:43:48 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.49) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 2 Mar 2026 01:43:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ExllnJLKkK0uT+j+WCkciywlyPAdGNuLdzgP8CZprqHLhUfCqMpeoSceFvJyYCt5Dmw4bB5cR2yHpzAXO/FQKy+J2GUmBDeoxiykidraSpq0XA/xvoi4fLzMHv1xRHxOFssoW6MrdCAfM9SJDSVQbBot2QWFAvAVkTZoGXU2KnuPBSd2Vhfalh52dzvz2hj/EgrnKqCcYza3bSqAcJRUOZWo3dNViZN+f2H7FatvB7KfJh4b2y5ok1XgdGK4qOC51zkc9DlAZirix9zbHO8PBGvlCE4mlmdItFXN4rmNHQ36IUIL7efzOBXKNAsHEZv5qrcGT5zOoJWlxF27fYLltw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AAN5M+KXGF22pJ8ox1SxhK+P6bqXwOyf6yPP1dJnvmE=;
 b=bqxlpbemH3gCmWgC8ZyNGCKY4CXdJe2uydmKD0fTemqN/kIqIbUA304NX9dyi29chxUx4cO8OL3a4+AKhjIzVxFpcw5rNPcnYTceK6Cikw3fV1fjs1TGIOPKge1j+/4yuiuUWI/lgJFhKIeK8bl1cIJeTvfN/VK5/iI8tuHLTlmLzqI43vqswjlkPhtKDDiKVKv2yIDGU/Bax7yQsbhGQ6DbYUGTqwMKK5zkkpXLCIZvG2uA4j3E35Mohy/FjrC7PYgP7tDxxxIxy3TNKjV5KakbYZwPZnyXmiiNVmVege2NxmgzYhC+vhsy/stY2dWotRM2y4u9MZjb7cwpsBuQ8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by PH0PR11MB5879.namprd11.prod.outlook.com (2603:10b6:510:142::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Mon, 2 Mar
 2026 09:43:40 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::efd5:501b:c890:26b0]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::efd5:501b:c890:26b0%6]) with mapi id 15.20.9654.020; Mon, 2 Mar 2026
 09:43:39 +0000
Date: Mon, 2 Mar 2026 10:43:36 +0100
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/pf: Take pci_rescan_remove_lock mutex when
 disabling VFs
Message-ID: <20260302094336.tdcyzx6kqkthfp4v@intel.com>
References: <20260227214048.12649-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260227214048.12649-1-michal.wajdeczko@intel.com>
X-ClientProxiedBy: DBBPR09CA0037.eurprd09.prod.outlook.com
 (2603:10a6:10:d4::25) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|PH0PR11MB5879:EE_
X-MS-Office365-Filtering-Correlation-Id: eabb4529-62c7-43f9-78cf-08de78402eeb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: wCB5yD3KSX1OU7BzfiuRIzD+H/5Q81iUAtOm2lPXtJUpBLXL0YkQ8H+mnm/9pNzf84KfrEq4jvWpRxdy8oKgJ2Bngp3o2MCctUczBxDgD7IISxu6CGsJXxgTuIxeeIpahHvMP7LhDN8+Ou9/FXjrqQe9tmrBRJAk7ZWPfPwZlOTo2ae633SwQNjbFw4CR4/8ZTQM//XrpWiOLOh/Mj9zbtTwnBZAjiH1wl48qFTKCA6Svd8sgDi00KKh9YDUN9lIYA9febX/8pdyqG7PB/LqgmU/lDNVk9akFYASbQRYwa/ZvXJpNV/WisoqRmJgmvizgkX9z6rxM2Q7tAD6xXYyEqWxyCCtzok4LkFYOng6bHh5giGdCIY0bfn5awSwB75uzWOAH4/ilzwfDjsv0C7SUESzC73k6L2M+gYBamNqTCMv0jaAztb+24IcmTjsVEPwrcEnKwnvuTzGadEOYYkHbthUD/7nMjEiHrPjbPyTjd0JafVIvRsvtnV74VwpWHkuGTiaSkuQyRtn9VenPLRx4BCCJu85qKVI2NhHSp+vIJYqmN8Nr1+iUsPsw/o/kCoACspXtCUbS/FuElgPH/27oxivk3BCQm8lDDx3BjrqiQwkNfbfHwCzCjZFyqmA6W5oPyi/JOAOj3MFJu+iVwY/w+rrvaDp0WIjkSOFA0Mxv2SteD02fjNslrnFw5gB5cJ7XrzUeKEHb9PdA/oCVda80PTxqX5fzag49DjmCuustI8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RmZiT3Y3NWZSYUlhWkRGeEh6NkVhTGVQNXEzam04QkJteEk3WTc5UkJTeEMy?=
 =?utf-8?B?a0RiaHcxcUN2Z2ZiRXlDMTRzREVzUDRwWFNMU2hublZVR0p2TVRRVSt2bUxL?=
 =?utf-8?B?L1pIOVZaYThUd1NXSmMyczZVbWU4RzU2eTh0OE9ZbWhpU0VSVnRvTmxBMzhK?=
 =?utf-8?B?bXpDdGVTY25GcHd2S08yZGRxK1B1L1hzcmNRd3p0WXFYRGwwZkMzckV4Wmlo?=
 =?utf-8?B?UlBhNUh4amplRE13bVErY1k5VjVQdGlxdWhNYnFTTlBxcnFPcy9Zdk80RThr?=
 =?utf-8?B?T0FNYXFEdHBtWmhsVGh3aUlIYkpxM0RXYUYrd0o2cTFXOXFKM1ZHcUJkTXAy?=
 =?utf-8?B?Y1BydEQxL2VZVi9LbzFCdStFNTlmTUtoMWpJTTRxK0ljR2VqV21TZUR6bFJO?=
 =?utf-8?B?WFQ2V3BGeldnNjlwaVMvcU9haCt2dzIzYlI1Q2FkaGV3MGFMMUhnSmZHSkQ4?=
 =?utf-8?B?dzdCeDUwOXBrQkhBL1d1N29yOXhRbklENU5kaVVQdnRHck5PVmJXa0IrZ1RK?=
 =?utf-8?B?OEJOcGMvN3piTVRUTGVSNUpxcFdzUTE5bUtleS9PYWVxOXpheElzTmlWRWZV?=
 =?utf-8?B?VUlUR2IwSXcveWdLQjJjajYwa0ZvOW1QNy9LSWN2bUVjb0huaU10MzBqNXpn?=
 =?utf-8?B?RUpEQjlPaFIwQ0xHVUFmaHlNeGJoT09Hdlg1RU9rQ25TYUorN1Y4SHQ1eDJL?=
 =?utf-8?B?RU4waFFlRi9CN3A0R2lZSTZDM1VLMzh3RTMraW4rb1ZHbEUwRkk2Qm9jTm02?=
 =?utf-8?B?cyt0RDZQR0tDNmRkSkhCbWdKZnFyUk1XZ3JBM2NtUVc5TVEyelVwaGdPeTNr?=
 =?utf-8?B?MU5QY2UybGJnNklVaTJzSGhEN1JZdElZMGpXemY4SkVaQVhjVUg4WS91SjNO?=
 =?utf-8?B?U25pUkwrRUNxL2pCa3NvbDF6OW5FSTlwK1FPRVFpNHhrbUwrUk5OTmFYT1Mw?=
 =?utf-8?B?RHJwTzB1VDFmUjZZTHVzSzdXOTI0b2lBWS8yNXltQ3RVaHhsbjkxSHpweVcz?=
 =?utf-8?B?OW81cnUralEvWEF5T3g1dGtzUkVuRlg1YkUzMkUyYUZyaiszR1dXU2xHbnFK?=
 =?utf-8?B?UCtHRXFpSEd2bUZVYlJGUis3eUV4amJObU02Z3JYQXM2d1hFc21vLzEyOXkz?=
 =?utf-8?B?SjZ4UFJrZ1JvK0FvaHpwQ1BTNlMwdW5KWWJrRnU3QVBoZSt2SkFHWnAzNXhO?=
 =?utf-8?B?OEExSzAycEk4aXI2eE9iRkpIZkovSERsMUFSOGZ1RDFXTW9zTThUS2ZPZTRE?=
 =?utf-8?B?Ymp0cDg1My9DaFZUSzFCK1BFSVd5dEdhMGdtcXR0dks3bWpLUS9HZ3Z6M3l0?=
 =?utf-8?B?dkcwdU5LZHVEYkxiZDhOUVVZd1BDNTVrRjNncmJEaXNrM2hKY0ZyRnY5ZnZi?=
 =?utf-8?B?UU5GclRhUFBVL2kveW1RNEg4UE9kWFdQejZod2pRRXo4MWhoTW1lOGRVV3J6?=
 =?utf-8?B?dU9YdXB1ckR3azFtV1dsL2ZCU3d3VEFaUFBHdDYrN01zS3F4MW9ZNFJkZFlQ?=
 =?utf-8?B?NUpMaUlBUHVUdk9kN2NKVk44b1lBdFRaaWhhalpkSmphRTZJMmpXWlQ0WWVE?=
 =?utf-8?B?YXZzVTlTN09VWUdPbW9rQi9nMzEvWUlRNTRGVkVPcjJvQTdLTHFFbTFOYVdX?=
 =?utf-8?B?MmdTaCtHNHhsNkE3VTZHKy9ZV3ozRENIMUNnSWNGYjMvOUE4QkRDQTlYVlA0?=
 =?utf-8?B?VVEwU2dmem9xU0lReEhqR1YxUWQ2UnlLeUpiQlUyb2p0cUNRLy9LQVdOK3dx?=
 =?utf-8?B?bmRxVU9WSkZsYmF1cE5xcGNiVUNJWVpvbFhRaVhWNU50NCtKeGN3NDdXdlZU?=
 =?utf-8?B?blV0WGlXVXE0YmZQcTFLRnc2ZVdkdVRKYkpCL3RIS0V1SzZ3cGNiYUh4M1pG?=
 =?utf-8?B?MGhSZnJkYTZhcTd6NDRuaFQzZUUvNUlHV0dSUWwzWkViT2k0c1VKR1NKWXFo?=
 =?utf-8?B?cTY1OUVCYnl4Q3cxNW1tVDlHZnJ5ajRmR0VlQlhxRkduc3h2bkRZNW9RVW1K?=
 =?utf-8?B?dy91TFBvaEw1V2h4b2krT3IrZitFQ0JxUW96ZFY1UDZSeThFbXdnYnpBMC8r?=
 =?utf-8?B?c1dUQk1oUEpjL3RlbWx4RndxV0F4R05PWFk4WlNUUkZBQzEvTDJqNHJudkNm?=
 =?utf-8?B?aVhRWEJoUGR2RHlHL250MnV3T1VhZU91Q0VCcytVL1ZxdjJsN0xFVWRNbEIx?=
 =?utf-8?B?blAvVXJXMnE5a1Z5TGg1R01OSmJPUHU0cHZGWnpFR09DeFAyZ1hibml2WXdL?=
 =?utf-8?B?S3h2UWNZTVFsaDJLekRSUkNPN3RVTEhoYU9yKys2QldVazY2TXVQNDVsNzl2?=
 =?utf-8?B?dTh4WXk2RzBrWm9weTN1aVJXWExuQ2ZBYUxHajZvT05ScGM1clBqUkorb2dX?=
 =?utf-8?Q?QsON45ckeJF1CPuY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: eabb4529-62c7-43f9-78cf-08de78402eeb
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 09:43:39.4957 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uiUosuKu4HyEfsugLxfEwEM0QScyFNEqsHMNiKvIf28RvXAHNtBLSlwbDT1rsf7KBfP3YYPJxGHt+WOEHhWIWXi7sXC++pKNYRfOvdPp2Lw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5879
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on pią [2026-lut-27 22:40:47 +0100]:
> Since recent commit a5338e365c45 ("PCI/IOV: Fix race between SR-IOV
> enable/disable and hotplug") the driver pci_driver.sriov_configure
> hook is called with the mutex pci_rescan_remove_lock already taken.
> 
> As we are using this hook as-is during driver removal, we get:
> 
>  [ ] xe 0000:4d:00.0: [drm:xe_pci_sriov_configure [xe]] PF: disabling 1 VF
>  [ ] ------------[ cut here ]------------
>  [ ] debug_locks && !(lock_is_held(&(&pci_rescan_remove_lock)->dep_map) != 0)
>  [ ] WARNING: drivers/pci/remove.c:130 at pci_stop_and_remove_bus_device+0x4c/0x50, CPU#32: rmmod/6476
>  [ ] RIP: 0010:pci_stop_and_remove_bus_device+0x4c/0x50
>  [ ] Call Trace:
>  [ ]  <TASK>
>  [ ]  pci_iov_remove_virtfn+0xd1/0x140
>  [ ]  sriov_disable+0x42/0x100
>  [ ]  pci_disable_sriov+0x34/0x50
>  [ ]  xe_pci_sriov_configure+0x2d0/0x1150 [xe]
>  [ ]  xe_pci_remove+0x7c/0x190 [xe]
>  [ ]  pci_device_remove+0x41/0xb0
>  [ ]  device_remove+0x43/0x80
>  [ ]  device_release_driver_internal+0x215/0x280
>  [ ]  driver_detach+0x50/0xb0
>  [ ]  bus_remove_driver+0x86/0x120
>  [ ]  driver_unregister+0x2f/0x60
>  [ ]  pci_unregister_driver+0x22/0xc0
>  [ ]  xe_unregister_pci_driver+0x15/0x20 [xe]
>  [ ]  xe_exit+0x1f/0x34 [xe]
> 
> Fix that by taking a pci_rescan_remove_lock as it is now expected.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pci.c       |  2 +-
>  drivers/gpu/drm/xe/xe_pci_sriov.c | 20 ++++++++++++++++++++
>  2 files changed, 21 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 3ac99472d6dd..fb0abd768e67 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -1010,7 +1010,7 @@ static void xe_pci_remove(struct pci_dev *pdev)
>  	struct xe_device *xe = pdev_to_xe_device(pdev);
>  
>  	if (IS_SRIOV_PF(xe))
> -		xe_pci_sriov_configure(pdev, 0);
> +		xe_pci_sriov_disable_vfs(pdev);
>  
>  	if (xe_survivability_mode_is_boot_enabled(xe))
>  		return;
> diff --git a/drivers/gpu/drm/xe/xe_pci_sriov.c b/drivers/gpu/drm/xe/xe_pci_sriov.c
> index 3fd22034f03e..2a3fd3578ef2 100644
> --- a/drivers/gpu/drm/xe/xe_pci_sriov.c
> +++ b/drivers/gpu/drm/xe/xe_pci_sriov.c
> @@ -239,6 +239,26 @@ int xe_pci_sriov_configure(struct pci_dev *pdev, int num_vfs)
>  		return pf_disable_vfs(xe);
>  }
>  
> +/**
> + * xe_pci_sriov_disable_vfs() - Disable all VFs.
> + * @pdev: the PF's &pci_dev
> + *
> + * This is a simple wrapper around our function that implements the
> + * pci_driver.sriov_configure hook but also takes a required mutex.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_pci_sriov_disable_vfs(struct pci_dev *pdev)
> +{
> +	int ret;
> +
> +	pci_lock_rescan_remove();
> +	ret = xe_pci_sriov_configure(pdev, 0);
> +	pci_unlock_rescan_remove();
> +
> +	return ret;
> +}
> +
LGTM:
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>


>  /**
>   * xe_pci_sriov_get_vf_pdev() - Lookup the VF's PCI device using the VF identifier.
>   * @pdev: the PF's &pci_dev
> -- 
> 2.47.1
> 

-- 
