Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF72EE6BF10
	for <intel-xe@archiver.kernel.org>; Fri, 30 Jan 2026 22:11:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7389010E1A2;
	Fri, 30 Jan 2026 22:11:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BMnXynH1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A74F410E1A2
 for <intel-xe@lists.freedesktop.org>; Fri, 30 Jan 2026 22:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769811090; x=1801347090;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=TVBmcvEldEsoBIR8H/vkjjoGDZxjUKNQXY8ngjmJTDs=;
 b=BMnXynH1QRK9kr3hmhmJUGgElOhClOWwT296gpxsQKY+sO6sSpoP6iCC
 5+EQ/fzQSlM2OCDUbZijVr60kcqgtEU/no9oBkbsa4X90vHLj/H71+o8H
 8PolQHyDWdAVHewh6siQcSctE1hT71qlEhzrJwKf2Sh3ScA0OHGVD3niI
 hW7qUU+ZwBIILSvSPX3liA0Agr4y1faT6ZCD9wI2zbSCG3Kro4Vofiqd4
 mT0tT1pOU2FHHzy9PnJnkMOiz5wlApC2HyT64zToEn2WnuEcVnE1rhShm
 QNod/91K5F3QMmFU85+Cf6cUK64Kf2hIfJ+kxRS5l98otG/31R+HlNI24 Q==;
X-CSE-ConnectionGUID: dcWyHwVQQSyzQYwrCBBVyA==
X-CSE-MsgGUID: 9Yg129g3Rrat4EuCobyeqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11687"; a="71045322"
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; d="scan'208";a="71045322"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 14:11:29 -0800
X-CSE-ConnectionGUID: EYBwZH/CSiGFlVYMpWldTw==
X-CSE-MsgGUID: 8fRL4dkMS4yzMEqlI+GolA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; d="scan'208";a="208873756"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 14:11:29 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 30 Jan 2026 14:11:28 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Fri, 30 Jan 2026 14:11:28 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.46) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 30 Jan 2026 14:11:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q4kY/X3EVJylpWP/dC7w5zy4Wgy477eHhmmhJuiqOafJhNP1U6J154NDcGudDnnEEV4xCzkIdMpvK5ZqF85f5GB6TUFCni+aGhzXhNj6ElyIe8LPnZbzvYXZKd0jjFTXURBo+9I9pLI4LN2jQkpepAHx0vt6c4HI1TBHFIsmqPxIX4Ogetdg7TXiEILtiO/eA++NkDe77Qh1nNFuzYTW6vMSKP0wFtohy0q9XdgYConHt/O8Dp19Qv6w2GkwC6NLB7Lw60pBpjwc0RVrqyISJyWXUgW8Chh3X5WwKIYfgTiLPt5ZmmvI6o3oJsGG7olyb5NJWTGZaK8XfJC+twzmYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FjHeqfCtPt7j5JV9Fg66yvxHXIKYdR1ollV0++pOoNw=;
 b=VMCrjtg8Iz+kxjT8B2z1Y8cnNHNEq3weGioDR+enKBcYhEGdlPMhd4BFRNrS0quX1bx57QXh6nRMaAKIboDKWHLMeNocsFleQm80o/eUT7Eai9Jz2GBLHz0WqNlqUiYSuWavFbc9bB87DDjERbYGCI5Ww9xYfXsIYEUDO76AUcL4MvkORn3KyB6LvPqrygj+VEVUZIG0a9TLWksel/k0kJzFuq+MGSDr6xWZFbhy8L/nPSQfCg2BCsU49YTisdi+HkT+Xv814CwAKPgxm15qLXUdz6pSSJrYNqrbeuMSlUFufD5IDP/6Lf0uFq/q7Yavr24HSMbhQ0mxxOR03SBubg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by IA0PR11MB8397.namprd11.prod.outlook.com (2603:10b6:208:48b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.11; Fri, 30 Jan
 2026 22:11:19 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%3]) with mapi id 15.20.9564.006; Fri, 30 Jan 2026
 22:11:19 +0000
Message-ID: <5952b75a-8298-4b5b-a5e5-9287b14fae4b@intel.com>
Date: Fri, 30 Jan 2026 23:11:15 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/pf: Fix the address range assert in ggtt_get_pte
 helper
To: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Adam Miszczak <adam.miszczak@linux.intel.com>
References: <20260130215624.556099-1-michal.winiarski@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260130215624.556099-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DB8PR04CA0026.eurprd04.prod.outlook.com
 (2603:10a6:10:110::36) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|IA0PR11MB8397:EE_
X-MS-Office365-Filtering-Correlation-Id: 81aa0777-58bd-401d-be20-08de604c7e83
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cEtYMUJaSno0SVgvWlFuZUtoRU0wVkNGUjZWQ1hVWUliRUNHdEtGandCSjE3?=
 =?utf-8?B?VmtCL3NCUDBwWHM1S08zRVhrZEV3YmJLdVFqVnU0eHZFK3FYbGtERzZPczBT?=
 =?utf-8?B?U2swZFdCYVplVGRSVmJ2VWtHRE4zSVp3SnoxdnczNlBNT0VFUUJTNktGU2da?=
 =?utf-8?B?UnpiMWwxc2VGSDViU1BmQWU3Y2VoREpXWVJPOXJUd0ZaaTEveHJFT1AxeFJn?=
 =?utf-8?B?ZnhEeTlRcmJJSWNQYzljc1o3OU5OUGNUNEF0YjJYQW1nS1ZRK0pnMWI3UGU3?=
 =?utf-8?B?eTdiQ0Zwa1JRTTlyYTY1eW83VlVPbWhiY0RCVm9IdCttM1B2THdUMHVYc0NI?=
 =?utf-8?B?YXo5aE9pMWlPL2Z2SkRNU3V1WjhlRE5VVkN5VkNRVWpIdXJzMzBINU5lUWcy?=
 =?utf-8?B?djlxUjFnNXFoSy8xUGgwUVlXSk4rdzhmUTF5QzNRcjMrL2dxaXAvVkt6aExt?=
 =?utf-8?B?OVQ3ZFNUdGZla3pGUW9WbE9qZFl1RG5obHNnN1hoK09TVnNqR0lZMTd1SG9i?=
 =?utf-8?B?Z05SM2s5RmRraE1VVjZvMUNuby9Ic1M2cU5Rb01UTkpSd2RVOXl2NVBIU0lK?=
 =?utf-8?B?eG9ybXhsOGRNNTdudkU5K0NUQm9GR2tsdVpzQUlhUXlRd3g4MmVKNWI1bkJm?=
 =?utf-8?B?MzEvNTJ2RlN1T0JnOVVBVHFtN2pXeTExZnpicDJ0YVhyWGptaEJBb1UzVDdr?=
 =?utf-8?B?Smp6MXdtVkhCci92cm1iVjhqa3VXOVZBaFMrTjBOOU04bzg3Q2JjTVg2Kzly?=
 =?utf-8?B?VTdaRFNRK0NXUytGTnJKTEhGdzBmekJXQi80Rmt5SzloSU0zbkVhaXkwRnhv?=
 =?utf-8?B?NTRvZVE2eTFVU0xmQnlQWVNLcGpLZnRRdVhOaktFNk0rOGhNUVRUS2RwT1c2?=
 =?utf-8?B?WlVncURkdG1tbnRwMEhsS3ZNMmpDc1ozVk5rNm5WNlpSVzJlYU8xc2Q1KytR?=
 =?utf-8?B?dktCT2dZMm9ONXcxU0dYbk5KZjNsUy9OYmJLeXhpbXhFTUI0ZCtmUXlvcldv?=
 =?utf-8?B?SUdVenpPN1hHcWlKelZSYXI5Z05MT0VIR1ozTTJIeXF1Q1NRK2x3NU8vcmlZ?=
 =?utf-8?B?MC9rQm1yK2dranhBSGQrVjZ3RTJXakx4S214ektkMXJ1bmJUTG9INktpK3M3?=
 =?utf-8?B?Ykp6N2xiVWwzd3IxY0FKbkVNbUI3VWJLK1M3eUM4ZlpEb1ZBaXo4UWQ3MGs0?=
 =?utf-8?B?a0tnLzI0c04wQ3h6aUcwSVhKYVR1amFsVzNtZHhBUDZ2WGZ2aFFMVUV0UGpP?=
 =?utf-8?B?ZmVVZ094dXFaZ2YrRnZjMFZxQUxScGlPWWY5WG42dFBMSnNCRDJ0c244MTZo?=
 =?utf-8?B?djduZHpxMjd6cC8xWVRFV25OVXlsQUd1SHA3TFdnMk1UbGcyZkhlVmRFQ0sy?=
 =?utf-8?B?TjlYWHB6T1k4bVNNWC9KNkp1ay9XTVVYRHk1aWdUOXZYRHRwMk5vVjJTTC9N?=
 =?utf-8?B?REtZR0pDS1kyU3BjTjUzU3ljbE9pdTErKzBpb3YwVkIxUWtBYTBXTVJsdnFu?=
 =?utf-8?B?TjJSNE4zTk13TENqbUtqMUhINExsdmU3ZUo1TVJ3NWhUd0FxcjA3WkZ0dVZU?=
 =?utf-8?B?QUMvNVFzUzdzWWhFTWIwN1ljRUxqdHFFdVdHSy9wTDR0c3dVZkFiN0pIR1RP?=
 =?utf-8?B?RE5XZ2hFUDhMcGQxVHp0M0FTZ2YzbVBoMzZaQmdNckRNeFdYeGJnaFVLWi9Z?=
 =?utf-8?B?aUIxa3pibGFhYWcvdExFZ2tRakZRQzA5ekFKV1NqakVQc0JuS003RCsvbmI4?=
 =?utf-8?B?WTRLWnVNSVFEMVlla2hSUEdZQUxvZXh2cWU4SGVxOGkyUThkT1ZUUGtFVVJX?=
 =?utf-8?B?OXNYMWY4cVJFS2svUExNV3BXK2drTW91YlRBTmVIMWFwUDRNODNYZVlVbjVB?=
 =?utf-8?B?aTZzOG9rdnFGRzJ1em1qeGFtREpTZHZVZjlIMTZ1cmQraUYrOUFLaW9WQzJH?=
 =?utf-8?B?Y0NCUStmZUxOTWZsMmdTWXpPcm8zOWRacDhJUEpwQWNuZmxSK1NJeVZ4UUZP?=
 =?utf-8?B?Q3hCWGR1QzFaZ1hodG13SWVvcTRGZVllT0hwcXNUVDAxSVpoSkcvVnAybWV6?=
 =?utf-8?B?OFhuempTQWpVS21tdExUb2d0VWlDMDRJaDVRSUw2VVp0NEZqbGF3Ym5MRVJj?=
 =?utf-8?Q?jGgI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZjNhZzNXRG9wa3diNGxWSjljYjFhWkM1cjh0WWhYU0VBZ21kdzk3ODZudUw1?=
 =?utf-8?B?elQrUmhEN0YraUQ4R1gxcE5RSnIvV0lQL3lPYitaTmxUVWFCV1kyVHA0SW10?=
 =?utf-8?B?anVXRHNiaFN0MWNURi92VDlJRzlkYlpBWHJXRVNONi9USWptYlhuOFAySWtZ?=
 =?utf-8?B?bW1PbnREbzV4bHgwa2FIUnczZ1cxOXdyMDc5YlhTbk5wa212bUcwdXk0TTZa?=
 =?utf-8?B?Q3lGTGtYRzZRSmdSVTNDVXQrOUxMQVpwaTJ3anhmQzE4NTlLRitMZTF2b1Np?=
 =?utf-8?B?NW0yQXgxTWNEOS93RmtJS29VZE95ejdRMW1SZkJMeXo2NWdtMHEwcHpNNE8w?=
 =?utf-8?B?SE1RNWFJTDhpeCtCcGJ1OW5VU2lYamMva3ZJeFh4ajFGT2pkWmFhVmVMSFZk?=
 =?utf-8?B?Yy81Tys3RnRaWVptbUQ1WkNncDNMc3ZWNlp4U21oeGxWaE5hZ29UNktqWXE0?=
 =?utf-8?B?OUR1dWlBempiY0lHaGhHVlZUQkxUMXF4eHJtd3VsUi81MFpGMFVjd3JDR2o2?=
 =?utf-8?B?TlU4NXU2Z1FCTFlPWHBCek9peWdBY1dDeWNPemllNDYzdlV4ZEVpVkR3b0d6?=
 =?utf-8?B?ZHFsWElpN1BVcEhMeGkwa05vZUlvQlRWUWhFSGRlazJKanM4NHJ0N1M1MEFm?=
 =?utf-8?B?TTdKN0NIUUNuOVFEWjRYYlBsN1E3WU1ZS0JIK2g4eWhQNERuOWNSMldtWVlP?=
 =?utf-8?B?ekxpR2tlcVErWU5JMW9TSExSRFE1N21FQTgxcTVaNFczemcxak00dHhxajNR?=
 =?utf-8?B?MHMxM3pXOUlOYUxJenFOdDJDSkdONkJ1M2FCOWFBQkhjVXRtOTRTb0RpblFZ?=
 =?utf-8?B?NEhxZjFjdG5taTF0c0JUb0cyMDQxTEZKYzNXazJOTnN0eXAyTDZKWFFRQUtk?=
 =?utf-8?B?bmxQRlBtMHlFYWdWdEozMytiOTFDdVQxZU9STHFkWEtneFJ6UlppRzJiZm5z?=
 =?utf-8?B?d00yOG10TGExTVd4UUg5WjY5cXBDaW5Gb0I2bXg2VTBSZVA0cjhxNFVOMmM5?=
 =?utf-8?B?dTBOclVNSG9nY01uQTlIZXlwM2dpV0dOYUh6ckYxUGVTc1BvZ3F5WlUzeVBS?=
 =?utf-8?B?NHY0OVBuNnM4TWxObUhRV2cwdE92bHBsYTRKUXNqK1FueTFvRjdURlloTG9m?=
 =?utf-8?B?aTVhVGdBbENDM3ZqR2RiNWp6MC83SnlDWWJhSlV6TGlpRE1qS2hhNVNhMTBu?=
 =?utf-8?B?U1p5eEFUZFZxdnp5M3pNdHUrWEpuL2x4bzU5aXBxQUhzNTNJRjljb1lrMGFG?=
 =?utf-8?B?SnhjbURPa2Z0ZkdlWFFCaFo0ZlZ5cTBsNUNneW04eHA5c0t4RzUxMnZweE1w?=
 =?utf-8?B?THkrSjZjb2Vmcll1LzZ1TWFlREg1TVIzakN5MkhGaStSVm9NcVkzeWRESVBE?=
 =?utf-8?B?Qmt0QU1jOFEwT3Y5SXVZbHZTdzg2TVF6WnhITjB6Wi9GV1V5L3NrM0hjWW14?=
 =?utf-8?B?RkFESGJRZW5KME96K0d0aGFXUm15b3Q4VmZ3cjRHeHQ4VUkycGNkbzdwdWgz?=
 =?utf-8?B?ZlJSWVFZVC9XVjBMUFVYT25QRG1rbFB6MUQ0WUNCOGxUZmZ4ejI5Yi90dWxW?=
 =?utf-8?B?cy9lYWQ3VHdTdjJqQmxnVFBwajBIY0NXalJiWTNRaUpVeHNFRStKUkdPdlZs?=
 =?utf-8?B?cGlKUjk4c0ZzN2R0a3VYQit3N0FpaStnVTM4TzdlTkZ6Y3A0SlRBb2VBbzlU?=
 =?utf-8?B?OFMvSWtHd0c0RTlPVHFsdG5iVm1NZThySUxxWDVNNjFqQ3VWUkJOQkM4SmdX?=
 =?utf-8?B?a28wWHh6a2NTaTJZaHgydmlsMnFTZUlhaTYxVGVNTmNUU1N2Rjh3NGJQN0RR?=
 =?utf-8?B?eWNxYjYrT3VuYVcyVVRwMnVISTN5amp3MWc2MmV1cyt6YTkrdk9kdWxEOEE2?=
 =?utf-8?B?MXcrL2p2RDJPK0ZOZWZUaWM0dUE3NVF6aHFFdXlIMnlLbTVDazNsZlRvajJr?=
 =?utf-8?B?TGFYRE9CdEQ4QjhnT0xQQVRHQ0JQRlRJYXZPVlRSYW9oeVhVT2l4NTRSMUIv?=
 =?utf-8?B?RFYyVU80NEdTUHk3M0NZaG4wb1JUMUU4M084T2VQYnhqNnBOaTJJSlNBWmdR?=
 =?utf-8?B?ak9KTnNFSlQvVzd6bUlDWlQ3dGwybEhEeW9raXY2OVNQYjQwdGx3dXNhK20r?=
 =?utf-8?B?cGJIVGRPd0R0R29KR1ZrQ3Z6VTdHamdPUTJObE9WRnlhYXZwamtid2RLRFNt?=
 =?utf-8?B?MkxRVk9vY2lWaFc5UGRoYVZ4QStzYW15eVZxa2g2WEVJNVFQUFFBSTJtMVJG?=
 =?utf-8?B?cGJ4NVFGM1lkSFZiYUtYZFB3Ni9GY0VWRVJHS0xEajNuaW1uS1BDZnVvZURY?=
 =?utf-8?B?WmpxQ1FOSXFuV1IzLytaZ3dOcVFOU1ltaStDaU5tbFpucEFDMC9hNEZBNllh?=
 =?utf-8?Q?kKADraIG56znEwl4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 81aa0777-58bd-401d-be20-08de604c7e83
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 22:11:19.2148 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UpzOK9pkmka/WrbaYWmvU9trMmfPv1XKUa/XpqRRsGH5iuXrE8/XMuQwIcy9tgcDss5eDrKwhRttqj62pstXQoUU4o8TNiu89pqhMbBlLhQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8397
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



On 1/30/2026 10:56 PM, Michał Winiarski wrote:
> The ggtt_get_pte helper used for saving VF GGTT incorrectly assumes that
> ggtt_size == ggtt_end.
> Fix it to avoid triggering spurious asserts if VF GGTT object lands in
> high GGTT range.

and now it matches assert in xe_ggtt_set_pte

> 
> Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

> --->  drivers/gpu/drm/xe/xe_ggtt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index 60665ad1415be..10bbf7a86b487 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -193,7 +193,7 @@ static void xe_ggtt_set_pte_and_flush(struct xe_ggtt *ggtt, u64 addr, u64 pte)
>  static u64 xe_ggtt_get_pte(struct xe_ggtt *ggtt, u64 addr)
>  {
>  	xe_tile_assert(ggtt->tile, !(addr & XE_PTE_MASK));
> -	xe_tile_assert(ggtt->tile, addr < ggtt->size);
> +	xe_tile_assert(ggtt->tile, addr < ggtt->start + ggtt->size);
>  
>  	return readq(&ggtt->gsm[addr >> XE_PTE_SHIFT]);
>  }

