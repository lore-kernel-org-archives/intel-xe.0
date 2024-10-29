Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D936FD3A68D
	for <intel-xe@archiver.kernel.org>; Tue, 29 Oct 2024 19:03:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95C4410E6E4;
	Tue, 29 Oct 2024 19:03:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XJgi3oQE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA4D910E6F3
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Oct 2024 19:03:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730228617; x=1761764617;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=KB/QovBSAilnKCcCJ/oO6K36ah9Xxq7tzh2lbuHPeX4=;
 b=XJgi3oQEXK77Gfmar/5I2itX2Xl8Tnb8SPEvB2RqZTnL1nQ1pZzqSrMM
 VxU/oDAFgcAUDB/6yJXbvQusmThjzIuuXmQLNJVQRhFSZDextRnQzFxWP
 OfunEp0IyrgEnQxqmDfyh9mODnWDztFlCvpwa4DMMouec/ESsWOz97Sk3
 0lyOvbScg081AIFo3q2+HO2zcWooP5SabQ7Wmzka6x/nwf8ehDAN1+/B3
 gxLwr59vhIvAq0VVh5U7ofuwGlCnUjx6srbTx4JkFVk2jCTj89xsSiljR
 2YvsruOcheFGuaO7C75JFPCV4xCA8cP+5Dir29vCH/qTfKJVGitFJ2qwf w==;
X-CSE-ConnectionGUID: c3N4yxMSRX2t9f2QGfIWiw==
X-CSE-MsgGUID: wgZkQrZjTvW40bcVpYMazw==
X-IronPort-AV: E=McAfee;i="6700,10204,11240"; a="33823046"
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; d="scan'208";a="33823046"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2024 12:03:25 -0700
X-CSE-ConnectionGUID: I+bj3jzoRa6leC/EBtNGEQ==
X-CSE-MsgGUID: 9J5RXk5NRymj9Ym8g3QpvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; d="scan'208";a="112867244"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Oct 2024 12:03:25 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 29 Oct 2024 12:03:24 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 29 Oct 2024 12:03:24 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.172)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 29 Oct 2024 12:03:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i4c8g9MKIpP+7xTgfwP0KTrOulj6dYNqaThxKb+NjMkXdZYx73S7cOyUC7UvUR7UppxIBAtfnIF5e92pmot1HScQHklxxkFVVfroTirVU+f1JzSsCU5CUv5NmufhL22Jvwbc/O7UxqtpSqKEaC3DJpHucqXRpWl9TsvtQFQolHqSHMyNpyPV6i7WNWq4wHsDLy014niGdT3RFUfgsFtt2ApbyE/F3IDl16T49QePDPTyPL0R3iBb5ydh/ng3Bu3L1B/lVGOLX84tHGoq5BAq0+o0ihj3UI1nCg8l0d7xNkqSqGKr8PX4nEfwMphbkavTmyx+AtZeM1EPKRHL0WF4dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WfrZcE/WZ+iCfE7knlS6QwpybXhIfr41WMQjyEws+M8=;
 b=PNViSjMHdicjb4KWsDHoJVqHovL2u1X+PG9NxKOWJr2EwBS7VmBb54Fv/nODlQVP5XuZ9wdOkYQZAtVIa9q6YzKgMWrlnbzRiyvxJK2T+xZTeun+6GWhaZfqdsqt/2w6rgO8oyWFmghxBFlzvQsSGMPutu5lyMuojxSOkuiz89ovvCXU44JIuqOWb1VLMPqeOjz9ZiDk3IHiRNg2McUU0po0+iMHQA/TBfXxWkGPQYxVq9rILqggPOeAHUUJF67mhUqbZsJOkurYTAYCRMP9LH1LXRN2DOrG14v0fD+tHEQddqpzZSx+dVWRSz345Yp7xotNXihwrvgP7MvbWhphqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by DS0PR11MB6448.namprd11.prod.outlook.com (2603:10b6:8:c3::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.32; Tue, 29 Oct
 2024 19:03:21 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.8093.018; Tue, 29 Oct 2024
 19:03:21 +0000
Date: Tue, 29 Oct 2024 12:03:14 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Jonathan Cavitt
 <jonathan.cavitt@intel.com>
Subject: Re: [PATCH 2/3] drm/xe: Accumulate exec queue timestamp on destroy
Message-ID: <ZyExclQaYO+Izyuj@orsosgc001>
References: <20241026170952.94670-2-lucas.demarchi@intel.com>
 <20241026170952.94670-4-lucas.demarchi@intel.com>
 <Zx/1BZ93nLSC1pFs@orsosgc001>
 <zdjmy5xxglhenvw72jto4oajnkuczyuetp2nnrgkfat77vhmnx@xq6fthganhf7>
 <ZyEbAH60kKHDyA/m@orsosgc001>
 <miao7b7igj35dgaaqea2li7vc722gxwjslnqklwqf34zavtsb6@dhj4cxfpmyoo>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <miao7b7igj35dgaaqea2li7vc722gxwjslnqklwqf34zavtsb6@dhj4cxfpmyoo>
X-ClientProxiedBy: MW4PR04CA0100.namprd04.prod.outlook.com
 (2603:10b6:303:83::15) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|DS0PR11MB6448:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f25d040-8832-4e5b-90a7-08dcf84c5ae0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q1V5MENVbmFjbUVXVGgwQWNOajh3OWgva21BU25QMnBlZ3RVWWxqZ1hwUUxn?=
 =?utf-8?B?ZkxnZGZpV3lCL00yQnpGM0c1d2hTVDZVRUZ1WmFaL285SGZsQWN1NGtNdjN6?=
 =?utf-8?B?Y2gyTExsU1BmUjFpMmJjbHJrKzh1NWw4M1ZHL3VkZFZyaWpEZFJYS2hvRGd4?=
 =?utf-8?B?SFVLTE52YmtXcy9uN2kwbkFjWEROMk95bGtUNXVZOE4rZlNiS1VQVjZybGRW?=
 =?utf-8?B?TzBKR0lKZVNuVTlKalUyQmpKbWVsWnRNOTk3MTFXLzViZzZzbCtvZW9lNXBS?=
 =?utf-8?B?ZEs5WDc5R1RZWWFleGxIQVdHOFdqdDF3TmZ0VFpzWHhoZE02MWZHWFl0Zm9v?=
 =?utf-8?B?K1NQT2V6L29pak1RVXFZRFdsbStrcDFpRGhZNWZhemdYbDlKTG1CQ0k4bW1m?=
 =?utf-8?B?ZWZmTFhkRTZrTWdHSVNTVGRXMzFzS0VhdjViNGlRd0lMdXBUTDJHSDdpa3hl?=
 =?utf-8?B?ZFAzbUtzOGs4RDRvd2d4UCtERE1VOGkyWWFmZHYrZmp2clNJZGE2UFJyN0pn?=
 =?utf-8?B?Y3cveDF2cnRGMk0vdkdJdFozU3VpSFpOMHFXMThwdG1rUmtuUXBaUnpXWW15?=
 =?utf-8?B?UklKdmdHTXIza3hmc0pzTWlFNWVTOC85T0JKOFIwV2YxeDlYTlNudnRWK3BE?=
 =?utf-8?B?YkJheEVlVk1FS0VrQ2hGM0wvUlZZdUsxWk1aMGtZazU2WGV2ZjNiTUMxNi9F?=
 =?utf-8?B?eFZvc1BOZ1BnUmZOdG9PcjlzbzZjZGkwTWJScllZRi9QaERPWUxMaW8vZ1Zm?=
 =?utf-8?B?UFI5YjBueGZ4YlEyTTZyc0VWSCtQZlZobVRtMWZ0bnFwSGI2RzZ3N0Z5RGF0?=
 =?utf-8?B?SklwUTRDV2ZzSU0zK3I5ODNZb1Fsb2MrdFUxK2ZGc2JYaFhJdXBuK0pXbkVz?=
 =?utf-8?B?NXdsVldPM3VLZUVSdkVhWHd0aXZyUE0rQUZwUEJoNlZPRTdGR2pqMFZsRCtF?=
 =?utf-8?B?aXBTcGZBMUg2VnVyaTBnTGtxM0VuaytDNm13Y0hjdUV1WVY4Q0tzeE1rcnJs?=
 =?utf-8?B?WEt6eng3VlF2T1dCNkFpSnJKL25YQWdCOEtvYzJqcnZGa0laQjhmT0dSdFpO?=
 =?utf-8?B?ZTBWYlZmcVkxekI0TFo1ZlV4U1JKRVRrcjBxVzV5RVBSUGxGYlcyRmlwN1Y3?=
 =?utf-8?B?RjhzSEljTjliUGo3VEswOFFHdmdqdjIyZGJuT0tJYjM1NTJhMDZPb1RQVm1l?=
 =?utf-8?B?RHR0ZjJzbFhQQUxDTUNXVXhaTW5adDdlK25OSnZmS0Q3NUZEdnE4S3ZIbjBY?=
 =?utf-8?B?cmtkUmRNa0k4UEhIWE54aE0wTnI3QkI2ZFZXL2x3VnJNL1NQUkVqRll4OHNI?=
 =?utf-8?B?TEdVTTVVZWJlVE0zTEpIa1JYRmdBWFJndTVOVlAzY2h1UzdTQVZHRXh6dlFH?=
 =?utf-8?B?S1dvTXhORCs0SW1sMUVmbmNPRElBemkrK3dSUzJrVFRnbFFKUHpxUUFWWGJL?=
 =?utf-8?B?R0NpbEVPU2d3ckI4eXJjeEVNYnJwTktlKzBsYUlMM2c2K28zcVB3SEVJZGl4?=
 =?utf-8?B?VGxEOHpGS21BYTZhWTh3ZkJHaVBVeFlieFhocjJRMFNWUEVsWi9KaURONzZv?=
 =?utf-8?B?ejNZcC80ZnppMXNOTDVQZktRdGVvYTdMb2w0TnRRNnNDTVRzVFpycGFEZDlH?=
 =?utf-8?B?RFNEQW5ncW5wK095cXYzOUFncE8rK0k1Qi9hWEpydFZpclA1Uk0zNllDem9k?=
 =?utf-8?Q?/i/wPPqm+h2/4tvgJRDt?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VFhjdHJ1YUQ4Z1puVXhLQVBEVktnbzF0Vzl0ZnF5cTlyS1E5cndwL25aQmVY?=
 =?utf-8?B?SHQvcWZweWhFczN0dzlhMVc5U2I5L2s2TUE2Mjl2Z0NzNVgxcFdSTkt4SzRS?=
 =?utf-8?B?eDhxNm1SUHZPdGNpckRxZHpSV2dTd2lCWmtBR3d1V2hJV0hZZ0pJSVluU1Vw?=
 =?utf-8?B?UGdmdzlpaUF6U1lmY0RzZmhvVk9rSjVzc2RXbjBzNEppcE8xSmE5QzR5NE5r?=
 =?utf-8?B?WDBlZ2pWcTNUZ21CZFdqUk5WeEtBZVpHRjMreWV3ajBkQjltYXFzWVkydTNQ?=
 =?utf-8?B?SHRhdnpoSm54USsrcUVGOHViVlJwUXBHNkcvTlVRZ2hGS0J1RnFDcEtqOGVH?=
 =?utf-8?B?Qm9FT2ZsMUN0UDluRm85cmJtWmU5Zm02MUd4dk1VRjVqRWl4MkI3ZGFFRGZG?=
 =?utf-8?B?VzRzNFVEdEVuallnQWlWaGIwV2VpTDdNNDZ4SGlNQ1UzTDI2WW5IeWJyL2RQ?=
 =?utf-8?B?SW85TUxvTWtzNEJCQjJKbnBoVXZRT09EcjExM2xXbzRSV3l0SStoZzVCOWhl?=
 =?utf-8?B?OU52dmZSTVRlVUhGNFY1RWpwK1dYZUk5c0s1clVzRWlFRHpBdWQ4NTcxOGlv?=
 =?utf-8?B?cWxmL1VYdklIb0hlaDJxUHk0clJLV2FkK2dNK1pheWROK0VGaEdvdGJJMGFh?=
 =?utf-8?B?LzhFUFVtcWg3THRjdDU4R2ZIME5pK3pvbm5VOU9PRSsvOHlrakZoTWtnT05S?=
 =?utf-8?B?MVYzMW03ejMrRFRvdjdNMEVqeXFUSHdvVUFmR1dWR3lhOVVhUkdjRTB5NGRt?=
 =?utf-8?B?Wm13Q2tRZ3lNL0dtRG5ZMmxtcCtjeG9vUm1FOUUyK1JkUjF4MVpkTHlrSlli?=
 =?utf-8?B?RTdabHB6UG90dzZoYkFzbmoxUWVDcEhSQlJvblA0M2RQaXc0enpHOGtHMTd2?=
 =?utf-8?B?UkxjdXBwTXJ1V0pSSlBPMVZNUlc3UTRlWlF3TENWajhPSTFMSzdZbHYyUmtx?=
 =?utf-8?B?MlAvQlQ4T3psYnd5Q281WURYMWVYdlMzSWlFdkNRUUFYSWM2NFV2VmtLblJ0?=
 =?utf-8?B?RTBsMDBGRUprZjNkSnpFdU9XU1FyVFI5OC9TSjgzN3AvL0djejlLWXhPQVli?=
 =?utf-8?B?aXhLSmlsSUl2Q0Fxc21kMnhhbHZGVjVrMmU5azZYQmROeUdibUZOek5KQms5?=
 =?utf-8?B?bEN3SWVRY1Q3R0h4MW13Z3FZR0MzR2JURWlxRE53QkFST1VzbjhYekZZbGgy?=
 =?utf-8?B?ekNJVmVvRnVoaVVnZ3pRMHNCT2RndVF6NzFNdFExUnFBTFpyMCtVZGZlbnhM?=
 =?utf-8?B?VWdVZnI4NWR2ZDhZTElXZmdmUGpKOVRjaFZaY1BjY1ZBQUFZVlArYVVpeTkr?=
 =?utf-8?B?SHFGdUc3Z0xFR3lteVJEcG1TSXZPZDRzN1NtWlkyT3R0SEJpaU80MGpFVUJr?=
 =?utf-8?B?TTZGeTlueWZsdXFucE5TNDFLNFJGZk9wZUlLNDBuaXBKL1F3WlhSWE0vaTNp?=
 =?utf-8?B?Y1BYN25hQ0RGTXZPV1J5T0tOY1lMd2p0SlNnZEVhVzFLOTV3VEdoN1NLMWMv?=
 =?utf-8?B?cmdVRERjRFlRUzMvYS9nVDVleGQzM1NSMjVtVU1NUnlyakozbmJTK28vQmc3?=
 =?utf-8?B?bEVKdEpHWTYvNzh2WUhuTm9kdTI1WCsyVlBBNXFoSXE5Zi9udmxhOXk0ZGdT?=
 =?utf-8?B?dmUwa21VcHN6TTRQdDZmZ2VHMU5QcWdWRVJkN0cwWWtmVWxxa3J4RG9iTzhE?=
 =?utf-8?B?WXNnazhpVDE1U01sclBaYXUvRTNiTGJOZnJkbm4vNUxrZk9BUHFWSlVPdG53?=
 =?utf-8?B?UXVRVkhxaEI4NXRER2Fzb0d2TTFZMzBCSy9uQkFPK3QrQ2lNT2xqU0w1Qjg1?=
 =?utf-8?B?RU4yRVpTc0hEamNRQlNIcURKY1MyOFlvNk5TTlRDT2FPaDZHSHZjNks4SnBv?=
 =?utf-8?B?OVA0anU2OVNYVDN6UXJwUE9pQ1ZxQXRjY2tqdVNFWXRGZ0RNc1QzUHlkNnNO?=
 =?utf-8?B?dERZQjRZbzIxZkw5VHlGYWhTLzdKRzc4Qk1YVXRQS1hodWluWHVvUmpVb1Na?=
 =?utf-8?B?TjgrVCtOeWcxQSsxTEpCaVZnTkQyVFF1eHZCclp1TTNLU3dmL08rWEpsbXpK?=
 =?utf-8?B?bUJSVlNRRGRQaE4zMWhVL1ZPc0hER0F0akptK0JBeFVTNXhkMDRtV2xvNGI3?=
 =?utf-8?B?SXNBLy9NS08xRi95L0ZVSWFsc2hzVFlEajEwRWVkMEExVDJoOVNwNVZCbVFl?=
 =?utf-8?Q?SLcEgmiIHI017LX0HDl6aws=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f25d040-8832-4e5b-90a7-08dcf84c5ae0
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2024 19:03:21.1737 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y/yR2iX7jzDCNi6tDqR3QI6SU+VW2amFMMVyRK05RLBNB4N05RFBHt7ZshS1nBp/hOFRHVMqLt2QgifOAgMGl4u6E1XOLquys5KlHFmRnXQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6448
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

On Tue, Oct 29, 2024 at 12:58:35PM -0500, Lucas De Marchi wrote:
>On Tue, Oct 29, 2024 at 10:27:28AM -0700, Umesh Nerlige Ramappa wrote:
>>On Mon, Oct 28, 2024 at 05:32:03PM -0500, Lucas De Marchi wrote:
>>>On Mon, Oct 28, 2024 at 01:33:09PM -0700, Umesh Nerlige Ramappa wrote:
>>>>On Sat, Oct 26, 2024 at 12:08:47PM -0500, Lucas De Marchi wrote:
>>>>>When the exec queue is destroyed, there's a race between a query to the
>>>>>fdinfo and the exec queue value being updated: after the destroy ioctl,
>>>>>if the fdinfo is queried before a call to guc_exec_queue_free_job(),
>>>>>the wrong utilization is reported: it's not accumulated on the query
>>>>>since the queue was removed from the array, and the value wasn't updated
>>>>>yet by the free_job().
>>>>>
>>>>>Explicitly accumulate the engine utilization so the right value is
>>>>>visible after the ioctl return.
>>>>>
>>>>>Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2667
>>>>>Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
>>>>>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>>>>---
>>>>>drivers/gpu/drm/xe/xe_exec_queue.c | 8 ++++++++
>>>>>1 file changed, 8 insertions(+)
>>>>>
>>>>>diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
>>>>>index d098d2dd1b2d..b15ca84b2422 100644
>>>>>--- a/drivers/gpu/drm/xe/xe_exec_queue.c
>>>>>++ b/drivers/gpu/drm/xe/xe_exec_quee.c
>>>>>@@ -829,6 +829,14 @@ int xe_exec_queue_destroy_ioctl(struct drm_device *dev, void *data,
>>>>>
>>>>>	xe_exec_queue_kill(q);
>>>>>
>>>>>+	/*
>>>>>+	 * After killing and destroying the exec queue, make sure userspace has
>>>>>+	 * an updated view of the run ticks, regardless if this was the last
>>>>>+	 * ref: since the exec queue is removed from xef->exec_queue.xa, a
>>>>>+	 * query to fdinfo after this returns could not account for this load.
>>>>>+	 */
>>>>>+	xe_exec_queue_update_run_ticks(q);
>>>>>+
>>>>
>>>>At this point we may/may-not have the updated LRC timestamp.
>>>>
>>>>fwiu, xe_exec_queue_kill() is an async call. It will queue a 
>>>>work that will disable guc scheduling on the context. Once guc 
>>>>notifies KMD that scheduling is disabled on this context, KMD 
>>>>knows for sure that the context has switched out and the lrc 
>>>>timestamp is updated for this
>>>
>>>ok. do you know what's that notification? Is it the cleanup that we
>>>process at __guc_exec_queue_process_msg_cleanup() ?  (which is where I'm
>>>moving the io read to in the other patch)
>>>
>>>>context. It may work well for contexts that switch frequently 
>>>>and may not work for contexts that seldom switch or never 
>>>>destroy their exec queue.
>>>
>>>why does it matter? it's only for contexts going away - for context that
>>>are scheduled out the sampling on fdinfo read covers it. Note that this
>>>call is not replacing other calls. If the exec queue is not destroyed,
>>>the other 2 places should still cover it.
>>>
>>>The problem with the case when the destroy ioctl is called is that q is
>>>removed from xef->exec_queue.xa, so the additional call in fdinfo-read stops
>>>working. It  then relies on the last job completing and being released before
>>>a read on the fdinfo. As CI shows, this is racy and fails in ~10% of
>>>the cases.
>>>
>>>On a remote system I got it was failing ~20% of the time
>>>
>>>>
>>>>I still believe calling it from job free is the right thing to 
>>>>do. As for the ~120 Hz updates, these are just memory updates, 
>>>>so not sure if it's a huge performance impact.
>>>
>>>it seems now you are commenting on the change in the other patch?
>>
>>sorry, I will try to be more clear here.
>>
>>patch 3/3:
>>
>>I missed the fact that the updates could be in VRAM, so moving the 
>>update out of job_free makes sense.
>>
>>Also since fdinfo query is expected to be frequent enough, adding 
>>the update to exec_queue_fini makes sense too.
>>
>>patch 2/3 (everything below)
>>
>>it's just the update in destroy_ioctl that I am not convinced about 
>>since the kill is async. Also you see another instance of failure 
>>already below.
>>
>>>
>>>I think it's pretty pointless to do the io access when nobody cares
>>>about that number. The user needs to be reading the fdinfo, probably
>>>through gputop or the like for the number to be meaningful. So why do we
>>>care about sampling it at a high frequency when nobody is looking? For
>>>real, non-CI use-cases it should be as good as before.  The difference
>>>is that instead of getting 120 updates of few cycles, we are getting
>>>just 1 with the amount of cycles that got used in the last sampling
>>>period.
>>>
>>>Looking at the traces we do get a few low-msec execution time for
>>>xe_lrc_update_timestamp(). Mind you, there's another race about updating
>>>u32 in xef in a non-atomic way and doing it that frequently just makes
>>>it more likely to happen. That still needs a separate fix.
>>>
>>>Goal of this series is to make this work:
>>>
>>>	$ for ((i=0; i < 100; i++)); do echo $i/100 >&2; if ! ./build/tests/xe_drm_fdinfo; then break; fi; done
>>>
>>>I was happy when sending this that it passed. But just double checking
>>>on another host, the issue is still there and I get this after 16
>>>iterations:
>>>
>>>Starting subtest: utilization-single-full-load-destroy-queue
>>>....
>>>(xe_drm_fdinfo:5997) DEBUG: vcs: spinner ended (timestamp=4818209)
>>>(xe_drm_fdinfo:5997) DEBUG: vcs: sample 1: cycles 9637999, total_cycles 19272820538
>>>(xe_drm_fdinfo:5997) DEBUG: vcs: sample 2: cycles 9637999, total_cycles 19277703269
>>>(xe_drm_fdinfo:5997) DEBUG: vcs: percent: 0.000000
>>>(xe_drm_fdinfo:5997) CRITICAL: Test assertion failure function check_results, file ../tests/intel/xe_drm_fdinfo.c:527:
>>>(xe_drm_fdinfo:5997) CRITICAL: Failed assertion: 95.0 < percent
>>>(xe_drm_fdinfo:5997) CRITICAL: error: 95.000000 >= 0.000000
>>>(xe_drm_fdinfo:5997) igt_core-INFO: Stack trace:
>>>(xe_drm_fdinfo:5997) igt_core-INFO:   #0 ../lib/igt_core.c:2051 __igt_fail_assert()
>>>(xe_drm_fdinfo:5997) igt_core-INFO:   #1 [check_results+0x204]
>>>(xe_drm_fdinfo:5997) igt_core-INFO:   #2 ../tests/intel/xe_drm_fdinfo.c:860 __igt_unique____real_main806()
>>>(xe_drm_fdinfo:5997) igt_core-INFO:   #3 ../tests/intel/xe_drm_fdinfo.c:806 main()
>>>(xe_drm_fdinfo:5997) igt_core-INFO:   #4 ../sysdeps/nptl/libc_start_call_main.h:74 __libc_start_call_main()
>>>(xe_drm_fdinfo:5997) igt_core-INFO:   #5 ../csu/libc-start.c:128 __libc_start_main@@GLIBC_2.34()
>>>(xe_drm_fdinfo:5997) igt_core-INFO:   #6 [_start+0x25]
>>>****  END  ****
>>>
>>>which makes me think it's probably related to the kill being async as
>>>you mentioned.
>>>
>>>I wonder if we should synchronize the call in the fdinfo read with the
>>>queues that are going away.
>>
>>Hmm, maybe.
>
>doing that it passes for me 62/100 running all
>xe_drm_fdinfo@utilization-* tests.
>
>The failure on run 63 is different  and I think it's another bug or
>race. This is what I'm testing with currently:
>
>diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>index a3e777ad281e3..eaee19efeadce 100644
>--- a/drivers/gpu/drm/xe/xe_device_types.h
>+++ b/drivers/gpu/drm/xe/xe_device_types.h
>@@ -614,6 +614,11 @@ struct xe_file {
>                 * does things while being held.
>                 */
>                struct mutex lock;
>+               /**
>+                * @exec_queue.pending_removal: items pending to be removed to
>+                * synchronize GPU state update with ongoing query.
>+                */
>+               atomic_t pending_removal;
>        } exec_queue;
>        /** @run_ticks: hw engine class run time in ticks for this drm client */
>diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
>index a9b0d640b2581..5f6347d12eec5 100644
>--- a/drivers/gpu/drm/xe/xe_drm_client.c
>+++ b/drivers/gpu/drm/xe/xe_drm_client.c
>@@ -327,6 +327,13 @@ static void show_run_ticks(struct drm_printer *p, struct drm_file *file)
>        if (!read_total_gpu_timestamp(xe, &gpu_timestamp))
>                goto fail_gpu_timestamp;
>+       /*
>+        * Wait for any exec queue going away: their cycles will get updated on
>+        * context switch out, so wait for that to happen
>+        */
>+        wait_var_event(&xef->exec_queue.pending_removal,
>+                       !atomic_read(&xef->exec_queue.pending_removal));
>+
>        xe_pm_runtime_put(xe);
>        for (class = 0; class < XE_ENGINE_CLASS_MAX; class++) {
>diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
>index fd0f3b3c9101d..58dd35beb15ad 100644
>--- a/drivers/gpu/drm/xe/xe_exec_queue.c
>+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
>@@ -262,8 +262,11 @@ void xe_exec_queue_fini(struct xe_exec_queue *q)
>        /*
>         * Before releasing our ref to lrc and xef, accumulate our run ticks
>+        * and wakeup any waiters.
>         */
>        xe_exec_queue_update_run_ticks(q);
>+       if (q->xef && atomic_dec_and_test(&q->xef->exec_queue.pending_removal))
>+               wake_up_var(&q->xef->exec_queue.pending_removal);
>        for (i = 0; i < q->width; ++i)
>                xe_lrc_put(q->lrc[i]);
>@@ -824,6 +827,7 @@ int xe_exec_queue_destroy_ioctl(struct drm_device *dev, void *data,
>            XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
>                return -EINVAL;
>+       atomic_inc(&xef->exec_queue.pending_removal);
>        mutex_lock(&xef->exec_queue.lock);
>        q = xa_erase(&xef->exec_queue.xa, args->exec_queue_id);
>        mutex_unlock(&xef->exec_queue.lock);
>
>
>Idea is that any process reading the fdinfo needs to wait on contexts
>going away via kill.
>

Yep. That should work for the synchronization.

Once you kick off the queue destruction, it could be a small while 
before the context is actually stopped by GuC, so run ticks will keep 
ticking until then, but you may have sampled gt_timestamp already. Maybe 
sample the gt timestamp after the wait is over... just thinking out 
loud.

Thanks,
Umesh

