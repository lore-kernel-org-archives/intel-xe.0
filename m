Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51F4AC3DA4A
	for <intel-xe@archiver.kernel.org>; Thu,  8 Aug 2024 05:35:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 191AA10E63F;
	Thu,  8 Aug 2024 05:35:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gxgK22KU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 650E210E63F
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Aug 2024 05:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723095301; x=1754631301;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=7g9GzD9a3Ril1l3lEVedG6t8ApiiNTW6T7OsaXUFD+Q=;
 b=gxgK22KU8y3dx1hQLrlxyQWdplkGk4gj3+JnDaMG+2d1a6EUOuXPpdDI
 BFEIRuj9CEtfrv7Uj+dJyWOALGMEJNysChvafmKBoP1wClJMoBqrbXHYb
 sC9hkjM2XxWjnKcDY55aZfM0v4A8Y2xXAv5qJtKOD0WLJcMImBR4zYpaY
 HveUQHNTa2vCP6qthRAMcb0kbQTnb4LSxjaFd1onQ4sLFgwpkKN7xvFYG
 /9f6eAMLBYPE8ga/OeC5KBLYCJi/MUG8oHeb4uTU/M8PdNTazo/JUS+HP
 uFfIs227IorFv6Nj+QvDA5TQblwAyj4DQawsm+1Y5HiPV0YN2xek2bGjy Q==;
X-CSE-ConnectionGUID: Oajwc329Q0OEQP2joFWiqg==
X-CSE-MsgGUID: gbKyqbTjRq6C/zsUUknNLQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11157"; a="21350455"
X-IronPort-AV: E=Sophos;i="6.09,272,1716274800"; d="scan'208";a="21350455"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2024 22:35:01 -0700
X-CSE-ConnectionGUID: Fde//KYzRD2jgUZFDGyCrQ==
X-CSE-MsgGUID: 38JrRmEIQHWSJKNEFrUTCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,272,1716274800"; d="scan'208";a="61755377"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Aug 2024 22:35:00 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 7 Aug 2024 22:34:59 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 7 Aug 2024 22:34:59 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 7 Aug 2024 22:34:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D4+GKVGr7F98XhEPFuA2Bb+RPQGO4lJGpKpCZPthE2va8kLsfQX5Vmr3IZA5P8olyvroPz7pPPIjXbTE8MrPdus3LvfZlhzkdelLudSWxOPYfdtbNRIwqPsGUI+7g0QkoQ67cFgP881Cwob2Yvttx355yPfmk1xwtWAYkz2qdEfHK7WkVZLLVw5l8cl0fBNMIzhz2ENUhqW+BT1QUu0EY+1Y8Gh91T0UlVhRotNQaVDVah849IcTkc3O5AY0/vDU7tPwtwq/PbFX1pdPblJliUNQSXbRKWAoDqRCYgERZF4h8PEVkdy+9w2QeCdmDn5/606+gCh5POkaz5eHYDXuuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=igxW2f8LS/5nKdDApENiCzB/USpyORZQmc2e7Kiq4+0=;
 b=LFP1bpbOKbgDgmzfqGfF2+BERx21MQdWSX48zRAgOxJ/60o6cdXeWdvVjWXIEa1a/2BIMaDcO1V/JA+kKLeje7bSop/nA/6mOqzF6xU/Oc4WSDEZyJ73tHyzH+yHjwSYw4a7colGg18IXwfwbwErxCFTrLBvItSfsDO7O8LGudlrgI19/g2yE0GjhkYQY8Rb8OhakxEqSUkILRSKepPy/p7VnjfP+/v+tsiQcAeOaRVxxWhhHfp+GthyqkOOCMZEBVkNHap2lFo83x4qbphpsAGNupwXwdMxnZbZSEvx9bc78EU0LfhA95IcmC849p7DDPzS+iPZI2cMyHHleQqUBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 MN2PR11MB4600.namprd11.prod.outlook.com (2603:10b6:208:26e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.29; Thu, 8 Aug
 2024 05:34:56 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::a255:8030:603f:7245]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::a255:8030:603f:7245%5]) with mapi id 15.20.7828.023; Thu, 8 Aug 2024
 05:34:56 +0000
Message-ID: <3d093184-f53a-44a5-926f-0a552ec154b3@intel.com>
Date: Thu, 8 Aug 2024 11:04:47 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/2] drm/xe: remove GuC reload in D3Hot path
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <matthew.brost@intel.com>, <karthik.poosa@intel.com>
References: <20240807134050.2048114-1-riana.tauro@intel.com>
 <20240807134050.2048114-3-riana.tauro@intel.com>
 <c4hemi6eshos64d6qxfux6wosyktw76thvzbwgvi26rbhbvvgr@3jkem2ozvclg>
 <ZrO0C82SU8r0tT7F@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <ZrO0C82SU8r0tT7F@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0P287CA0001.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::6) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|MN2PR11MB4600:EE_
X-MS-Office365-Filtering-Correlation-Id: 024fbb1b-9933-49de-dee6-08dcb76bd65f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Tktkd2NjaENzUHI1aFNTaTF2SkxmNEVSNElCdWc4Tzc1RTdIWUJEc3kzSW1v?=
 =?utf-8?B?dnBUYUZNNGtGV0VWTytNZVB4ZU9mWHRYQldSK25TWnFoRGpZV2dNdUxtbTc5?=
 =?utf-8?B?K1J0VUIrYWErZTVST2RPaFI0WTFyWjNua2RiVU9TQkxlUklQamxQTFZvYnB4?=
 =?utf-8?B?c3RncmlRaEFMbnlhaTNIWUJ4UGZNeW1YNzY3YzdnVmkwVC82TCtlQW9NS2Jy?=
 =?utf-8?B?Wm5hUzdQdmd3WHBzejcrQ0p6M1hQRWMzTGlOWURUQzFIenhVTnZycGZBTzZr?=
 =?utf-8?B?RHdqZklOS3djV25Od3BtRXZaVHBndHo0RWpITEl3VlRuaitrZVFGQTI0SzAy?=
 =?utf-8?B?Y2V2cmJ1clJ0SzI4TkhCNUdJUnFVQTV6K3JGOGtCRndOM2F3bmswQVRyeXdw?=
 =?utf-8?B?OE11akczek1TWmlvWE5sWC9IbXFwaGRkQkVLbTcvSldEU01pdjREdFJhT0lP?=
 =?utf-8?B?bWlWZEo2ekt2QU4veDBnS2ZTRXpDbDg5dHdpUVdPV0RPWmVNYk8rRjNrNkxS?=
 =?utf-8?B?QUJjRjlTcWcvb1JMbFdmUDhUU1JwMnBFT0hFdG9tYkdySnlRSEFiTkdBaERn?=
 =?utf-8?B?RnFnWHZkek94L3plM1BZNzdlMzdCbGkxU2t6UmpEcG1uUTVocUdMdENFUWlH?=
 =?utf-8?B?NEhldTljM2Z1UGoxMnp3TG1UYS84aFZ5d1R1elg1VXc0K0ZuZTZ6OGhvSnhs?=
 =?utf-8?B?dCttbTNMSFR4ZmNVeHA0ODNxQ2NJVDFHdDQ3a2JUNGIvTHZOdjJuWDdVcWc2?=
 =?utf-8?B?RW9ZbndQajd4Qm1wcGY2Q3FoamUxWUdpNlloZnZtbmJuTmEzSHcyWk8xRkZw?=
 =?utf-8?B?Ym94TGtFVmNEWFNrVUxpMUZmVGg1VTlJendoeWtXblE5MHNDVkdoWmhxTEZy?=
 =?utf-8?B?dFRpSWlBYnN6MWlPcTJtRzZ5b0hIMW5VSmN5b2dNT2JPS3duTHhyYXRsYlF4?=
 =?utf-8?B?enBLU1dyNDd4bWVFWHFHUFVVc25LdjBKUlBQaXZld0dqRGsvUGdvWUJWSGlW?=
 =?utf-8?B?YTRkRHNLUkFpQUJLTnkxZWJ1cGxhWGZmRFdMc3llNFZsT1VWNXErOEdFTGRE?=
 =?utf-8?B?Mis0SHAxQ1JSZ2ZCNXR6ZjNaS1EvU1c3OWxpenpHTy9nRG9BdXZCM3F3L0xr?=
 =?utf-8?B?UHRiVUlyNmM5REsranhVQnEzK2lkYTJtM0VKYm9wWjhDUFRHS2ZYeXE3Tmk1?=
 =?utf-8?B?SzhNZ2NrVEhlNlVmRGUydnB4bmxOZm9CNVFFYkFQeDRqSjY4QWJEUFpJUTN2?=
 =?utf-8?B?am9URzJ2ZldPYmZzZVJqMGdWYmQra0Q4RHZmQlZvZVQxQlNMcGFFR0IyZkJt?=
 =?utf-8?B?T0ZxYXo4eUtuSXg5NGtWcldlNmR6WXRjbVBpYVFsWHU3YVJZcW5wS1RqVDJk?=
 =?utf-8?B?VmpQTjVKQ1VKYURaNDZSUS84WXluTWZaZGNOTjUvVytsQXNXQ1J1ekhOVHRS?=
 =?utf-8?B?d3NVZFh2bi8vQnVERmlCVTB6TmtESlIwRFJCb2dadjVBTWoxWlNiUW5Qblhq?=
 =?utf-8?B?Q3VwZUFZL25lMVVlMFMrS09wZFQ5Ny9jWHN5a0hFTmZpbTdHdlFmdWcyeGVz?=
 =?utf-8?B?bkJBb1RqdDN2TEorOXhMUmNBU053dE45SVZqNTgrUjZ6VTlhYTVmVkc2ZVk5?=
 =?utf-8?B?UEVLS05aeHhuMTdkUVJPTGFxanlBUmcvZm8rTDJabGVHNG5HUjF4NW04aXc2?=
 =?utf-8?B?b2s1KzYyazNYTlZLSlNHQUpRUnkzMHh6VXZqOEVWUDFyQ25CbDdoNjgzeDRZ?=
 =?utf-8?B?RkVhWGl0cDNQM3ZPdkN6MGVGUGdGOCtPNldLSXd2SGtjMWtxNzYrcXRYRkJM?=
 =?utf-8?B?ZDE1eTZDTGErOWdtV2Nrdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N1o0YXh6aEFKRitoejlPQXFhRXRsN3VqZlVYaXJpUmowaGExVVVQTVJBd3pB?=
 =?utf-8?B?djEzcStKL0dweFNWdUtXNmZKSVdpcWNKbWVoK1ZyNExuWnE5THlqVDBNVWJN?=
 =?utf-8?B?UTVSM0FIS3Q4eXVYSUVTNEdyUlN6VEkxT09TdEFEQjJENXJJcVkyZUk3anpY?=
 =?utf-8?B?dDFQTEFmUnhQVUFPeWVsaGx2REhCbVEydkdncjV0QjFvWHMzbVlIS3NSdndD?=
 =?utf-8?B?K2t1dWFVYldTUVJOVlZXTnlWdDgvZ1N0MEZBZ2dSOTRuMFNxZndITEZZY01J?=
 =?utf-8?B?eTMzWXlvWFhYVGwvSnlEbkRJeUdkY25xSllob1dMMFMreXlyZW9lSzMzZWEv?=
 =?utf-8?B?VjBMUkdrNjFWSmxBRGFwVkZ0MHJmalRDNG11NlZVMzRLWlJ6MWlxbzdNQyt6?=
 =?utf-8?B?NHZENnJuQUExY1lLQUhoQ0Y4Y2UzSkNZZDJJeXg2VlJPYUdsSUY1SS93YVg1?=
 =?utf-8?B?RCtLL0JKNng2NG1SWndRK3hic2VQVFRvc0FsaW5ETFQyN2dSSGlWZ0ZZOWND?=
 =?utf-8?B?b3RkVEl4NldLYkVHdytsUjNmZTdha1FWOTB3VVExeFlyMnY0WGg4eHJzYUZq?=
 =?utf-8?B?ZkdkYlNhcE9vdUlab2pUeXhyTnBFak1EYlZwQUhJUGJDODFyZVo0ZEtNakVG?=
 =?utf-8?B?RGhTVklEajNMR3kzREVnbllzcXRua3VZNjRDamdQM01qbEZ2c1JFQW91V2l5?=
 =?utf-8?B?OW5jNUdzTFR5REE4bFVuSkw5S0piSFAwMHZncDNHbDhCVjlHZEFYc1ZzN0Jy?=
 =?utf-8?B?Z3E5MzRMdTNROVlYa000SDRPZjg1WGNDMXNpZmlBdy9tTzMyZUQ2azZveVg4?=
 =?utf-8?B?MEt1Tkp3VDZIQnJKSWdoUTNpYkcxYTZmWkIwM21lNXlROFN1WjFOVXJRcXRn?=
 =?utf-8?B?YldRbFpVUlVhSFRpMFZob3gxMWNhLzRsZU9LUFBVNWY2eFhjL3JSSDBrRmJa?=
 =?utf-8?B?NHZ4Vks3aXBXRk1iQ3BYenRkcWJBZ1lkZnptMnBWVXhSTHdJT0YzYXVrMGgv?=
 =?utf-8?B?ZVIxQ0VqekRvdU9sSUxRRWYweEVxVEdxc0YzbDE5Ym5sS3lWS1hiVDRHNFlt?=
 =?utf-8?B?RGpIYmJyT2s0TlpnMGRPWWVhb1B4eDRHc1o2dit5amp3MG1TTlBpK2M3Tnlw?=
 =?utf-8?B?K3FUVGY5WS9jL2tXT3J3VzJGeGVxL2lEeWkveHNoYS9uZVNYRVJnUzJDUEFN?=
 =?utf-8?B?MVB6K2ZHV1NLc1NKejY5SFRTYlNPZ1JsdmYzYUpyNWdBbmh3RTRtZXhnOEh2?=
 =?utf-8?B?T2QzTDNVNGk2ZklHREF6czIxU3VqZmJ4c2w3Y05LT3p6b0pjVGhUbERPM2JJ?=
 =?utf-8?B?UGZTODFaSHIwRkJqdHl3UGJmVjM3ZHpQNkljd09YQlREcWN1WlBNb1N0WXhG?=
 =?utf-8?B?MGlVRWFsNTR4dWIrTXJOcHZ6R2hyaTEzWGFobGViTHRieXgra2VIOEhzVEJ1?=
 =?utf-8?B?QXUyeFE4a1N1aVExM1pXQjU0a0VkM0NkRGlWSVdUdmNFZjBwQVBxVEx6eFNI?=
 =?utf-8?B?YWdsR2RIcXNUNmo3cVgya2dmNkRKMldsQ1NmbHZDYlJqZkhwK0JZQmJYdGUy?=
 =?utf-8?B?K01MYkpKR3pWdGQ5OTAzYndtcHJwa3BZSGxKT2Zhc1FWMEVEais4dVdTdEZv?=
 =?utf-8?B?ck9FUHQwS0RKV3VNbXAyaFhJUFVQQlRIWEpINDJmaEVLWVEvWE1JYmx6U1Fx?=
 =?utf-8?B?N3hLMVd4dmFNQkh5OFRrRUhXWVo5SUVUcVYwRnVFL2Zlb20vR2pmZGJqdkN2?=
 =?utf-8?B?aEQyL3B4cVFQS3F6d3N6VXVQcWZtNkVDbnpYNjR4c3IyUi92T240TzB4SWhm?=
 =?utf-8?B?NU1heTArOGI1S1ovd2dOTHJjTnBzdnJPNDArQjBOS2paTFkvNDhScVhscmVM?=
 =?utf-8?B?R3RGZ1BQU1RtTVFlclVmWm1LbVVBUGZuaFZCNlA1NCthajRnOXJ3Y1VGK1JS?=
 =?utf-8?B?ZUh4ZTVVOHJKNkZhSEJPb1h2d2orcS9OUlZRNm5BaXZEQXFyZlk1WVo1MUgv?=
 =?utf-8?B?dXhRV0RXVVdHSjBEUlFweU13YXNmcFZCRkJTVGhYRVhxSFRBazF3aXpobE1K?=
 =?utf-8?B?R0tQekFpaFJhRmptYkVreTd0ZUdXSFpaVFFBUWkvLytBVkRnZDkrZDdOTFhU?=
 =?utf-8?Q?Ix6RKA34TvVtUiMPkHxvMY18n?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 024fbb1b-9933-49de-dee6-08dcb76bd65f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2024 05:34:56.7181 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2oVyVO/Zp5quYywHiJBC8bIMUn+oBsCk3ZQJa2aCF/5sWFwfoqh64sOkVOUfHdLT9I6WgEv0Rj+ATH/ZqGZxAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4600
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



On 8/7/2024 11:21 PM, Rodrigo Vivi wrote:
> On Wed, Aug 07, 2024 at 09:59:27AM -0500, Lucas De Marchi wrote:
>> On Wed, Aug 07, 2024 at 07:10:50PM GMT, Riana Tauro wrote:
>>> Currently GuC is reloaded for both runtime resume and system resume.
>>> For D3hot <-> D0 transitions no power is lost during suspend so GuC reload
>>> is not necessary.
>>>
>>> Remove GuC reload from D3Hot path and only enable/disable CTB
>>> communication.
>>>
>>> v2: rebase
>>>
>>> v3: fix commit message
>>>     add kernel-doc for gt suspend and resume methods
>>>     fix comment
>>>     do not split register and enable calls of CT (Michal)
>>>
>>> v4: fix commit message
>>>     fix comment (Karthik)
>>>     split patches
>>>     correct kernel-doc (Rodrigo)
>>>
>>> v5: do not expose internal function of CT layer (Michal)
>>>     remove wait for outstanding g2h as it will be always zero,
>>>     use assert instead (Matthew Brost)
>>>     use runtime suspend and runtime resume pair for CT layer
>>>     (Michal / Matthew Brost)
>>>
>>> v6: use xe_gt_WARN_ON instead of xe_gt_assert (Michal)
>>>     assert and queue handler if g2h head and tail are
>>>     not equal (Matthew Brost)
>>>
>>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>>> ---
>>> drivers/gpu/drm/xe/xe_gt.c     | 33 +++++++++++++++++++++++++++----
>>> drivers/gpu/drm/xe/xe_gt.h     |  4 ++--
>>> drivers/gpu/drm/xe/xe_guc.c    | 30 ++++++++++++++++++++++++++++
>>> drivers/gpu/drm/xe/xe_guc.h    |  2 ++
>>> drivers/gpu/drm/xe/xe_guc_ct.c | 36 ++++++++++++++++++++++++++++++++++
>>> drivers/gpu/drm/xe/xe_guc_ct.h |  3 +++
>>> drivers/gpu/drm/xe/xe_pm.c     |  8 ++++----
>>> drivers/gpu/drm/xe/xe_uc.c     | 28 ++++++++++++++++++++++++++
>>> drivers/gpu/drm/xe/xe_uc.h     |  2 ++
>>> 9 files changed, 136 insertions(+), 10 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>>> index 58895ed22f6e..e0b13dc7663b 100644
>>> --- a/drivers/gpu/drm/xe/xe_gt.c
>>> +++ b/drivers/gpu/drm/xe/xe_gt.c
>>> @@ -831,8 +831,16 @@ void xe_gt_suspend_prepare(struct xe_gt *gt)
>>> 	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
>>> }
>>>
>>> -int xe_gt_suspend(struct xe_gt *gt)
>>> +/**
>>> + * xe_gt_suspend - GT suspend helper
>>> + * @gt: GT object
>>> + * @runtime: true if this is from runtime suspend
>>> + *
>>> + * Return: 0 on success, negative error code otherwise.
>>> + */
>>> +int xe_gt_suspend(struct xe_gt *gt, bool runtime)
>>> {
>>> +	struct xe_device *xe = gt_to_xe(gt);
>>> 	int err;
>>>
>>> 	xe_gt_dbg(gt, "suspending\n");
>>> @@ -842,7 +850,11 @@ int xe_gt_suspend(struct xe_gt *gt)
>>> 	if (err)
>>> 		goto err_msg;
>>>
>>> -	err = xe_uc_suspend(&gt->uc);
>>> +	if (runtime && !xe->d3cold.allowed)
>>> +		err = xe_uc_runtime_suspend(&gt->uc);
>>> +	else
>>> +		err = xe_uc_suspend(&gt->uc);
>>> +
>>> 	if (err)
>>> 		goto err_force_wake;
>>>
>>> @@ -881,8 +893,16 @@ int xe_gt_sanitize_freq(struct xe_gt *gt)
>>> 	return ret;
>>> }
>>>
>>> -int xe_gt_resume(struct xe_gt *gt)
>>> +/**
>>> + * xe_gt_resume - GT resume helper
>>> + * @gt: GT object
>>> + * @runtime: true if called on runtime resume
>>
>> ugh... I find these boolean args way to ugly and error prone. Why can't
>> the path we are on simply call the 2 functions and we use a composing
>> style rather than "do this", "and that", "and that other thing", "and
>> that other too"?
> 
> My bad on that. I'm sorry Riana.
> 
>> This only leads to dead code in the long run as we
>> later realize "oh, nobody call this function with false as argument
>> anymore".  And to hard to use APIs as now the caller ends up with
> 
> indeed
> 
>>
>> xe_gt_do_foo(gt, true, false, true, true) without any indication of what
>> those things are for the caller.
> 
> yeap!
> 
>> A less ugly alternative (but IMO still not ideal) is to use the
>> "flags approach", since then at least the caller is passing something
>> understandable rather than true/false.  But I think we should usually
>> use 2 separate functions and call them where appropriate.
> 
> I totally agree!
> 
This series uses booleans in two places

	int xe_gt_suspend/resume(struct xe_gt *gt, bool runtime)
	int xe_guc_enable_communication(struct xe_guc *guc, bool register_ctb)

During the earlier versions, there were review comments to avoid code 
duplication since all the code remains same except for one function. So 
wanted to get consensus

If functions are split, there will be code duplication. Even after  the 
split, we still need to call xe_uc_suspend if d3cold is allowed. 
@Rodrigo @Lucas is this okay?

System suspend (Resume also will follow similar pattern)

/xe_pm_suspend
| xe_gt_suspend
| |
| | xe_uc_suspend
| | xe_gt_idle_disable_pg
| | ...
| |

Runtime suspend : D3Hot/D3cold

/xe_pm_runtime_suspend
| xe_gt_runtime_suspend
| |
| | if (d3cold_allowed)
| | |    xe_uc_suspend
| | |else
| | |
| | |   xe_uc_runtime_suspend
| | xe_gt_idle_disable_pg
| | ...
| |



@Michal for the CTB registering, you suggested to reduce duplication of 
code. With Lucas comments to avoid boolean variables, there will be 
duplication of the irq code.
Is that fine or should i use flag instead of boolean?

For registering/ resuming CT

xe_guc_enable_communication
| guc_enable_irq
| xe_guc_ct_enable
| guc_handle_mmio_msg

xe_uc_runtime_resume
| xe_guc_runtime_resume
| | guc_enable_irq
| | xe_guc_ct_runtime_resume


Thanks,
Riana
>>
>> Lucas De Marchi
>>
>>
>>> + *
>>> + * Return: 0 on success, negative error code otherwise.
>>> + */
>>> +int xe_gt_resume(struct xe_gt *gt, bool runtime)
>>> {
>>> +	struct xe_device *xe = gt_to_xe(gt);
>>> 	int err;
>>>
>>> 	xe_gt_dbg(gt, "resuming\n");
>>> @@ -890,7 +910,12 @@ int xe_gt_resume(struct xe_gt *gt)
>>> 	if (err)
>>> 		goto err_msg;
>>>
>>> -	err = do_gt_restart(gt);
>>> +	/* GuC is still alive at D3hot, no need to reload it */
>>> +	if (runtime && !xe->d3cold.allowed)
>>> +		xe_uc_runtime_resume(&gt->uc);
>>> +	else
>>> +		err = do_gt_restart(gt);
>>> +
>>> 	if (err)
>>> 		goto err_force_wake;
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
>>> index 8b1a5027dcf2..21f27ca23b67 100644
>>> --- a/drivers/gpu/drm/xe/xe_gt.h
>>> +++ b/drivers/gpu/drm/xe/xe_gt.h
>>> @@ -53,8 +53,8 @@ int xe_gt_record_default_lrcs(struct xe_gt *gt);
>>> void xe_gt_record_user_engines(struct xe_gt *gt);
>>>
>>> void xe_gt_suspend_prepare(struct xe_gt *gt);
>>> -int xe_gt_suspend(struct xe_gt *gt);
>>> -int xe_gt_resume(struct xe_gt *gt);
>>> +int xe_gt_suspend(struct xe_gt *gt, bool runtime);
>>> +int xe_gt_resume(struct xe_gt *gt, bool runtime);
>>> void xe_gt_reset_async(struct xe_gt *gt);
>>> void xe_gt_sanitize(struct xe_gt *gt);
>>> int xe_gt_sanitize_freq(struct xe_gt *gt);
>>> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>>> index 85b88532e23f..6758b02dad58 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc.c
>>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>>> @@ -883,6 +883,8 @@ int xe_guc_enable_communication(struct xe_guc *guc, bool register_ctb)
>>> 		err = xe_guc_ct_enable(&guc->ct);
>>> 		if (err)
>>> 			return err;
>>> +	} else {
>>> +		xe_guc_ct_runtime_resume(&guc->ct);
>>> 	}
>>>
>>> 	guc_handle_mmio_msg(guc);
>>> @@ -1112,6 +1114,34 @@ void xe_guc_sanitize(struct xe_guc *guc)
>>> 	guc->submission_state.enabled = false;
>>> }
>>>
>>> +/**
>>> + * xe_guc_runtime_suspend - GuC runtime suspend
>>> + * @guc: GuC object
>>> + *
>>> + * Return: 0 on success, negative error code otherwise.
>>> + */
>>> +int xe_guc_runtime_suspend(struct xe_guc *guc)
>>> +{
>>> +	return xe_guc_ct_runtime_suspend(&guc->ct);
>>> +}
>>> +
>>> +/**
>>> + * xe_guc_runtime_resume - GuC runtime resume
>>> + * @guc: GuC object
>>> + *
>>> + * This function enables GuC CTB communication
>>> + */
>>> +void xe_guc_runtime_resume(struct xe_guc *guc)
>>> +{
>>> +	/*
>>> +	 * Power is not lost when in D3Hot state,
>>> +	 * hence it is not necessary to reload GuC
>>> +	 * everytime. Only enable interrupts and
>>> +	 * CTB communication during resume
>>> +	 */
>>> +	xe_guc_enable_communication(guc, false);
>>> +}
>>> +
>>> int xe_guc_reset_prepare(struct xe_guc *guc)
>>> {
>>> 	return xe_guc_submit_reset_prepare(guc);
>>> diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
>>> index 5fcf6f6ef964..56359047d185 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc.h
>>> +++ b/drivers/gpu/drm/xe/xe_guc.h
>>> @@ -32,6 +32,8 @@ int xe_guc_upload(struct xe_guc *guc);
>>> int xe_guc_min_load_for_hwconfig(struct xe_guc *guc);
>>> int xe_guc_enable_communication(struct xe_guc *guc, bool register_ctb);
>>> int xe_guc_suspend(struct xe_guc *guc);
>>> +int xe_guc_runtime_suspend(struct xe_guc *guc);
>>> +void xe_guc_runtime_resume(struct xe_guc *guc);
>>> void xe_guc_notify(struct xe_guc *guc);
>>> int xe_guc_auth_huc(struct xe_guc *guc, u32 rsa_addr);
>>> int xe_guc_mmio_send(struct xe_guc *guc, const u32 *request, u32 len);
>>> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
>>> index beeeb120d1fc..41bdb9437634 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
>>> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
>>> @@ -419,6 +419,42 @@ int xe_guc_ct_enable(struct xe_guc_ct *ct)
>>> 	return err;
>>> }
>>>
>>> +/**
>>> + * xe_guc_ct_runtime_resume- GuC CT runtime resume
>>> + * @ct: the &xe_guc_ct
>>> + *
>>> + * Mark GuC CT as enabled on runtime resume
>>> + */
>>> +void xe_guc_ct_runtime_resume(struct xe_guc_ct *ct)
>>> +{
>>> +	struct guc_ctb *g2h = &ct->ctbs.g2h;
>>> +
>>> +	xe_guc_ct_set_state(ct, XE_GUC_CT_STATE_ENABLED);
>>> +
>>> +	/* Assert if g2h head and tail are unequal and queue g2h handler */
>>> +	if (xe_gt_WARN_ON(ct_to_gt(ct), desc_read(ct_to_xe(ct), g2h, tail) != g2h->info.head))
>>> +		queue_work(ct->g2h_wq, &ct->g2h_worker);
>>> +}
>>> +
>>> +/**
>>> + * xe_guc_ct_runtime_suspend- GuC CT runtime suspend
>>> + * @ct: the &xe_guc_ct
>>> + *
>>> + * Mark GuC CT as disabled on runtime suspend
>>> + *
>>> + * Return: 0 on success, negative error code otherwise
>>> + */
>>> +int xe_guc_ct_runtime_suspend(struct xe_guc_ct *ct)
>>> +{
>>> +	/* Assert if there are any outstanding g2h and abort suspend */
>>> +	if (xe_gt_WARN_ON(ct_to_gt(ct), ct->g2h_outstanding))
>>> +		return -EBUSY;
>>> +
>>> +	xe_guc_ct_disable(ct);
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> static void stop_g2h_handler(struct xe_guc_ct *ct)
>>> {
>>> 	cancel_work_sync(&ct->g2h_worker);
>>> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
>>> index 190202fce2d0..0cf9d77feb35 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc_ct.h
>>> +++ b/drivers/gpu/drm/xe/xe_guc_ct.h
>>> @@ -16,6 +16,9 @@ void xe_guc_ct_disable(struct xe_guc_ct *ct);
>>> void xe_guc_ct_stop(struct xe_guc_ct *ct);
>>> void xe_guc_ct_fast_path(struct xe_guc_ct *ct);
>>>
>>> +void xe_guc_ct_runtime_resume(struct xe_guc_ct *ct);
>>> +int xe_guc_ct_runtime_suspend(struct xe_guc_ct *ct);
>>> +
>>> struct xe_guc_ct_snapshot *
>>> xe_guc_ct_snapshot_capture(struct xe_guc_ct *ct, bool atomic);
>>> void xe_guc_ct_snapshot_print(struct xe_guc_ct_snapshot *snapshot,
>>> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
>>> index 9f3c14fd9f33..c73a728a7450 100644
>>> --- a/drivers/gpu/drm/xe/xe_pm.c
>>> +++ b/drivers/gpu/drm/xe/xe_pm.c
>>> @@ -101,7 +101,7 @@ int xe_pm_suspend(struct xe_device *xe)
>>> 	xe_display_pm_suspend(xe, false);
>>>
>>> 	for_each_gt(gt, xe, id) {
>>> -		err = xe_gt_suspend(gt);
>>> +		err = xe_gt_suspend(gt, false);
>>> 		if (err) {
>>> 			xe_display_pm_resume(xe, false);
>>> 			goto err;
>>> @@ -157,7 +157,7 @@ int xe_pm_resume(struct xe_device *xe)
>>> 	xe_display_pm_resume(xe, false);
>>>
>>> 	for_each_gt(gt, xe, id)
>>> -		xe_gt_resume(gt);
>>> +		xe_gt_resume(gt, false);
>>>
>>> 	err = xe_bo_restore_user(xe);
>>> 	if (err)
>>> @@ -374,7 +374,7 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
>>> 	}
>>>
>>> 	for_each_gt(gt, xe, id) {
>>> -		err = xe_gt_suspend(gt);
>>> +		err = xe_gt_suspend(gt, true);
>>> 		if (err)
>>> 			goto out;
>>> 	}
>>> @@ -428,7 +428,7 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>>> 	xe_irq_resume(xe);
>>>
>>> 	for_each_gt(gt, xe, id)
>>> -		xe_gt_resume(gt);
>>> +		xe_gt_resume(gt, true);
>>>
>>> 	if (xe->d3cold.allowed) {
>>> 		xe_display_pm_resume(xe, true);
>>> diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
>>> index fa98e9f22631..8e535153cc62 100644
>>> --- a/drivers/gpu/drm/xe/xe_uc.c
>>> +++ b/drivers/gpu/drm/xe/xe_uc.c
>>> @@ -288,6 +288,34 @@ int xe_uc_suspend(struct xe_uc *uc)
>>> 	return xe_guc_suspend(&uc->guc);
>>> }
>>>
>>> +/**
>>> + * xe_uc_runtime_suspend - uC runtime suspend
>>> + * @uc: uC object
>>> + *
>>> + * Return: 0 on success, negative error code otherwise
>>> + */
>>> +int xe_uc_runtime_suspend(struct xe_uc *uc)
>>> +{
>>> +	if (!xe_device_uc_enabled(uc_to_xe(uc)))
>>> +		return 0;
>>> +
>>> +	return xe_guc_runtime_suspend(&uc->guc);
>>> +}
>>> +
>>> +/**
>>> + * xe_uc_runtime_resume - uC runtime resume
>>> + * @uc: uC object
>>> + *
>>> + * Called while resuming from D3Hot
>>> + */
>>> +void xe_uc_runtime_resume(struct xe_uc *uc)
>>> +{
>>> +	if (!xe_device_uc_enabled(uc_to_xe(uc)))
>>> +		return;
>>> +
>>> +	xe_guc_runtime_resume(&uc->guc);
>>> +}
>>> +
>>> /**
>>>   * xe_uc_remove() - Clean up the UC structures before driver removal
>>>   * @uc: the UC object
>>> diff --git a/drivers/gpu/drm/xe/xe_uc.h b/drivers/gpu/drm/xe/xe_uc.h
>>> index 506517c11333..1e223d67086a 100644
>>> --- a/drivers/gpu/drm/xe/xe_uc.h
>>> +++ b/drivers/gpu/drm/xe/xe_uc.h
>>> @@ -15,6 +15,8 @@ int xe_uc_init_hw(struct xe_uc *uc);
>>> int xe_uc_fini_hw(struct xe_uc *uc);
>>> void xe_uc_gucrc_disable(struct xe_uc *uc);
>>> int xe_uc_reset_prepare(struct xe_uc *uc);
>>> +int xe_uc_runtime_suspend(struct xe_uc *uc);
>>> +void xe_uc_runtime_resume(struct xe_uc *uc);
>>> void xe_uc_stop_prepare(struct xe_uc *uc);
>>> void xe_uc_stop(struct xe_uc *uc);
>>> int xe_uc_start(struct xe_uc *uc);
>>> -- 
>>> 2.40.0
>>>
