Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6084FCF8857
	for <intel-xe@archiver.kernel.org>; Fri,  4 Oct 2024 20:30:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2950810E9C5;
	Fri,  4 Oct 2024 20:30:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lAn18Qg8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F91C10E9C5
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Oct 2024 20:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728073855; x=1759609855;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ZuJHmfMBpAPVA8emPiN/vDCkH1rG/+yqAxjpuxhkmnY=;
 b=lAn18Qg8DfyqWlMV2KYfxdrLX8oUovCgcSCQq3x3mQvnyLpdGugjExYA
 TjAN9igjmA2RKqcmD7zo7bRXCHKJl1Uf6v2qqoF/N689L/ql3RaSEfTKY
 BHV6TUSW018PL8MDZrJJteegsqq7f5vMm07lNulHDkDuDcgBL7pVW1Tde
 Jtwb7V7BRpdFd62CxHSU2y7gxfIvJaUzHrvAzgfuGm5vGqA02uDpkLMki
 FopSUP3nPcqqx0KJJYWHnhOj4cP1N/dgl2mzEsu+LI03t7tu9S8pMqAGE
 +Y4K9mg4OOxyu+rdb4SQoHmz99fwS+OtYLnuH4V+JE4zlm68PHgQyyptJ Q==;
X-CSE-ConnectionGUID: NCP6U9ICQAOSFZi8r6+OWg==
X-CSE-MsgGUID: LngIA4pAT+CD1EHwZRAWvQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11215"; a="49838523"
X-IronPort-AV: E=Sophos;i="6.11,178,1725346800"; d="scan'208";a="49838523"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2024 13:30:54 -0700
X-CSE-ConnectionGUID: c4czEu/oS0yXOrzRjI/+AA==
X-CSE-MsgGUID: vMY6GCrxQAGLwaUxfvVs9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,178,1725346800"; d="scan'208";a="74937015"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Oct 2024 13:30:54 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 4 Oct 2024 13:30:54 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 4 Oct 2024 13:30:53 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 4 Oct 2024 13:30:53 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.174)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 4 Oct 2024 13:30:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wmcP3thQeRN5P0fiv1B/+HS4sR0eEe97AGqzEgN4H5Vc3TbM8ZkaY8UJZq3V9BYqXJWCw4iW7MfCytUj5LJeaKufmzngRdMki/Glg2+oI0reNU/xz1NmKJTFIC/EgiM++Pej8ejB1tjSkqgZOfIULlkdceiNYy2/wKMe60DSBA5qWw92MWiOnj/JjdZIzuIly7QVA4HkYczEAgMmH61x0yW+vdj03LbRdsr9AALJuLwRVNQE2xyExTrTYaRXBViHTTSi2TUPeJVHIgpxCT6tRsKG80E8hJvYwi6H9USQ0IcEEY4vPh0Uxig0tXL+vI41XRG4tKSDrY9ALwNnc17lTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+zlndjZC6gTs1LQTfFh4ug1y/LXRqGRfctLwbeFJY/o=;
 b=ZFJAaMG9qTFkVS2O31JOG1Dpa7higY+Y6qgMsyN6cA/rTUx/FYfKKcz220MZpq2t2Hv9bSi4AadBpgbpaHJo5bdgP9T0yU6Cn4yXAKyA6H0ZKUsdKJDL5TO/f6R0k0RBj+gHUbKLURvkPRilyMXclDvBKh0R2xWtw1jk81giLNBjBRVpRERODrCpwt8dgOlzYcnQedYWWh1JcRaHNu7pCe55wMPUzOvzt3AOA941AqboUL73katCIVU38zSEJFORQ74+n/ZUoQTgFE4yVv6dpvK8iQtY5XDG0iAtVGbHJjNMK71NTPbXV/Qalr6lwyu1tTA+GmVGUOqiF3ekXMu5hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by SJ0PR11MB5133.namprd11.prod.outlook.com (2603:10b6:a03:2ac::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.18; Fri, 4 Oct
 2024 20:30:50 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%5]) with mapi id 15.20.8026.017; Fri, 4 Oct 2024
 20:30:50 +0000
Message-ID: <051cab8c-7c8b-494a-97cd-58952920815d@intel.com>
Date: Fri, 4 Oct 2024 13:30:47 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/12] drm/xe/pxp: Allocate PXP execution resources
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Matthew Brost <matthew.brost@intel.com>, =?UTF-8?Q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>
References: <20240816190024.2176976-1-daniele.ceraolospurio@intel.com>
 <20240816190024.2176976-3-daniele.ceraolospurio@intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20240816190024.2176976-3-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR03CA0309.namprd03.prod.outlook.com
 (2603:10b6:303:dd::14) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|SJ0PR11MB5133:EE_
X-MS-Office365-Filtering-Correlation-Id: 824f0d1b-0f43-4ed3-0df0-08dce4b36f9b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cTA5dEFidE1PM0YwMnRxUG42MEcxMnNDTEdDa1JwSDRUckdJbFBDbTRQV3Bx?=
 =?utf-8?B?VzJHTGhMblVUZU5Gc2U3UWtoTVI0cGNGM3R6VVp6UlBUcFhMZU1RQ0M2STRq?=
 =?utf-8?B?MDRURVdCMEJROHJISFlGb2Zlb0p3NVBJc292dzRHTXRRckpRTXBURGg2cDl1?=
 =?utf-8?B?Ni94ZHpHOERyT0RVQzVmaUcvTFNJVGNINzNvZ0h6SWJnVHNBYXY4U0YzeXl4?=
 =?utf-8?B?clFOTk56dWNxTnBxNlNLWnJZNFRpUmV0dkQ1Zm4yZjk1bmJ3L1ZTSWJ3M2to?=
 =?utf-8?B?Vnh2UkpUUCtyZ2xzVll0SU1wWVlCYnVwdDUzUmJFSHNNZjhodGtTZnFDR2Rs?=
 =?utf-8?B?QStvL1BKckhDSzg0REZZMm9tNEpNR3lDbTNDWDRGYWVYNWJzSW5xN1JxT200?=
 =?utf-8?B?NjY1KzY5NjFoOWFncm8vcVRvMEV5OVU3TFI3dk5JaURUczZNRjF5QzVaMXZs?=
 =?utf-8?B?MWhpbGlyVHFaNzBYT0h6L2RiMU04M3YzY2dzNkx3eWhsSCtSTmY1aVJpNG9K?=
 =?utf-8?B?OHN2NkFzTHZybkhTaW0xOWJ2NkxuT3ZVakVsd1hMcU1ZRHJpZmNrTkEzYVV2?=
 =?utf-8?B?V3ZZT1ZlWG5mdnMzVGRxMlF0SDlXK0R0ZU1Uejk2MUt4KzJtNDBaQUhWc0c0?=
 =?utf-8?B?am1PRExBQ1ZsUGxNQnc3RWRKcWVySTVuU0M4VTNKTzltUHpkbUdQdFZ3LzUv?=
 =?utf-8?B?UmJIN2N6djFaOElpVGdLUGo4N2xzbmt2ODNKbmFrb3NuU2dzYmRJQmxBT3RL?=
 =?utf-8?B?Q3dGcndyYjhmc0hmTjlwdHNQTkU5eCtRR1lWbWk0TmhCQ2dtakpkR2VjbDdX?=
 =?utf-8?B?dXpkaTkxNzk1UnQyQVN6c1JnRTFwdC9mdTBEZ29XbXE4VEZtOG5DSHI2STEw?=
 =?utf-8?B?S3l4ZXJYTVZwcVd2cDVQcmFoWVhEdWdpQzVNbXlJNUxROHEwMENRSTFiUVlV?=
 =?utf-8?B?SjlBTXU3N0dwSHovMmpzUElWdHV1U3FUb2FJYzR5SkR0MVROWnZpUFZNS1oy?=
 =?utf-8?B?ZFRxVXFGZ0w1Q3JMQUR6cWt6NDRYUjU3bkdlNGtvOFlOcGZEUW15YjlYZXN1?=
 =?utf-8?B?TXpVeUh0UklNVzFSekRBcWxiUUxnYWJIQjBOZFE4VlBrbTJkWThIU1I1OUlt?=
 =?utf-8?B?ZjFBSFpkaGJqdE9mbXdHd2hkM2k3c0JVL0hIbHhidHdNRVlrWVQzMlc5S0Ux?=
 =?utf-8?B?Si9zQkE0NU9vb0cxdVRNaUY4Q1FjUVJuVlJZT2N6SllwdFlTVnUxOWVqR0JV?=
 =?utf-8?B?aE9xN3lQRTZpNHhrUHdEN2xZZXlmQVQ3RnVDOHZCenRHUXNTWFZ4NXRudkNI?=
 =?utf-8?B?S2o4NzZTcWtPUThQelRVa0pPNTRpR3gzZFlPYnlIeGE0ZkdVZEZhRWZYZUU5?=
 =?utf-8?B?TDFTMnpyemNNWDlPTGFyT1VXYlFIeDlUOE52V1Uwa1MrNW1pZXVqa0tjQ0ZN?=
 =?utf-8?B?c216U3Nxblp3Z2FHaTJHMTZ1dmk4cVlCMWJjTXJ6WTBRNWZPeUp4WUpuUXR3?=
 =?utf-8?B?ZDlueDJ4SFpLYlpabEtPTnVDaVdmRjBta2NEeWZUK1pRYzgvMnlmQkZXbkVL?=
 =?utf-8?B?R3Rlc2QyaGgwbm51c1p2ak9ZTFgrQWVFeCtyb3RCM0tIUlFPeHhVTmFtS0xZ?=
 =?utf-8?B?YTI5bVRNVnJEcWtOTE8zRzVReWpudkZ1dXdMTXFaSDZBK0ZPQ3U1UTRqTFp6?=
 =?utf-8?B?VU9MTzN2VnBhTzM0K0NhTWt2am0zTUxrMkVPM2xEUUsrbThZNEdUT25RPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MngwVUVtc1lNNWFPa2ptRkswc0VyS01wR3pvRmJmaWx6eE1BUUJTMUhjYjN3?=
 =?utf-8?B?K1Y5UWVleTRHM0ZBUDY5L0NwSWRyc0VtVjVCZHpWeUlRMjFHS3hHaGZtNXB0?=
 =?utf-8?B?Rm52eEw3b0dEVllXUnRTM3FwSTVTc2NjcmxjMHJERHVhQWFsWEc0QitrdFFY?=
 =?utf-8?B?R0VMT1llSmRBbUZ5SkpQeU0wck1VdURUY21Md0ozcDVRR2lISUxIUkk5RVpJ?=
 =?utf-8?B?S3hHZEIvK2p0d0NJMkVrSmwwR1pUR09rekNTcVRpR2FVS2hLWWRyNEtKN0pO?=
 =?utf-8?B?U3hEK0NBT05hdGpPZzdYRG1Kdlh0ZlNmcm5PT2duMmU1ME4wM0t1c1ZkY1VQ?=
 =?utf-8?B?em5YNEoxYklqVGtYS09xbG1VcnA4anhvR2ZxTTVRRTVyMnVwc05UZ1JXQVM1?=
 =?utf-8?B?N1lUaWVkUGswcWdCa3ZOTXBMVzBpZU5pUUI3amcrSndaczlSSTRqUm5wWi9F?=
 =?utf-8?B?TmFtOGx3N2VBUkRsUjdOL0lpQTRsaTY0ZmR2UjQzUnFRdFl3ZHRVeWZxRGF4?=
 =?utf-8?B?cjJ3blA1TUhKVGhhcmFXOUk5M3NwMUJIWFVSRjc2NWRtV2VHOHFXQm9YVVZ0?=
 =?utf-8?B?ZCs0QnNSOGFzdHFYMUdGS1hxbE5jZUVlK1B0RGdXZzN4ckJVQzZLeGdTUXR3?=
 =?utf-8?B?dm4xYWp4alh3N2hVS3VjZ0FOTUhWRzRva3lrZHV2YmNqaE1HYXIzbVovS2V0?=
 =?utf-8?B?OHpGZmFRRWduVUNhSWRPRG9GVXdzeGkyb1JXWkpFSzBwcXcwbld2TzZseHZ4?=
 =?utf-8?B?cDF6VUhxd2dxOXhhZTduUWFtbnhPWis2RFZlZWhYRjZYYmtTblVGTGtUMGhs?=
 =?utf-8?B?dXFEUStCRmthWUJuOUo1V0VNZERmb1dPVkJVNE94QUExM1BzL2M3V3hYOHpk?=
 =?utf-8?B?a3ZicThZdjV3Rkx4TjJVamh3Tk83enY0Wm1XazBmSTBaQzNrQzZydkRyVkV0?=
 =?utf-8?B?Nk9kUC9IL2k4RERaVjVteGdZQWs5Y0xSVGd6TDAyWE5FMzVDUkI1RXhTalho?=
 =?utf-8?B?c2pCWCs3eG9xS1puUG1YSHlQZ2xiT3p4b3ZzNnpZWEQ3T0pkaHF3ZkxLYk1M?=
 =?utf-8?B?YVBHZUFQdGRVcmxidmRJaWlHbFdmdzhPa1BGdHdlSkhNc0FiRzg2N2thVTVV?=
 =?utf-8?B?RWZzWHlrM2JveUtjTnZGZnc2djQ0Q0x0R01zOGNPR1A1cEZIcXEwWW50aWc4?=
 =?utf-8?B?TFJkTkdrV1lCV1lNUXQ2MndBSE4reXY2UUl0aDVDZE10bEt1dkVPaVJNTGZh?=
 =?utf-8?B?RUdtQVJxZTRvT0VrdnM0cHkxejhKeXFMWkZaWkxMOWdiN01jRVNxc3d3cHA0?=
 =?utf-8?B?RFh1QWw2dWlxbENPZllJWXBsdWp5aTByNHg3MTFvL0djc2ZPN0JxZGNqTzV6?=
 =?utf-8?B?VE1PQmFyTkdtaEtMazRsQlBUS212NjBra3h2QlhXdEdhT0YwVHZsRVh5STFw?=
 =?utf-8?B?S0VBSG10MzRHU2xuWG5rZ254VTlKNkJtU2FzN2tQZy9RYkFKaDdhdG5Od0xp?=
 =?utf-8?B?aE50V3ZWVGdOemZyNEw2OFIrZEk2REtMZTJaV0ZycnFHVzlyakxoeGZubW5N?=
 =?utf-8?B?SC9Id2psSWtPb0FjMGR6ekhFNzJVUWtSOGZ4K2ZxMUVITDdDTzRyaDM4eWRZ?=
 =?utf-8?B?NG5OMzQybWJaZ1VvQVJVbUxia2xGaHFac2JFczBIT0ora3ZXVDFSZVhDa0N5?=
 =?utf-8?B?djVvckljU08yTFQ0eVRIcWVJT0RkUFhZSVA4dzB6TG5LNktnQ091ZitSQndD?=
 =?utf-8?B?dHRxRkFDMVJ0U1lzZDR3Y3NRS0Vqd3lhZ0E1b1k1dXZNL0pLWXBhYnR6RjhE?=
 =?utf-8?B?L0JpQ2RlakxFSDlab0d4cGJRY0ZRcTVkSk1OTUc3c1hMcVZVR0RnN1AzbUN3?=
 =?utf-8?B?cFdpS2JqUHJhSEtIZ2g2UGxZTnRsa1lNZThwaEJ1MXEzQSt1VUpHcEF6N3I2?=
 =?utf-8?B?OXlvU0ZoL1MvdVdDd0hVaHp1WTErQUFMTkE1MGVRVWE3Vis5U04wMWcvbmht?=
 =?utf-8?B?ejk4aWVELzBPcnBCVkd4a3FLKzVJZHp5NkdzWkFzbmFsdm0zNTMvamhCR1Qx?=
 =?utf-8?B?MU5SQ21VbTVZV2dESHFEZTBqTE5vbnRlZjhrVUhvNDFSZWVTOHNiMWJZU1FY?=
 =?utf-8?B?L0FLbTBZNnIvcVFZY2JpQ25DdExxQXNSL1dMMFhha3RoeHV5ZXlTQTlFK2RI?=
 =?utf-8?B?TFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 824f0d1b-0f43-4ed3-0df0-08dce4b36f9b
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2024 20:30:50.5022 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LndSemA/xfO/i4+4JwtA3cp+A7QpWpv4Z5vB9xY4z95hmRs9BdrNbl2LNIuYIq1EbyEHYa5nh6IqA+zKaeFrE8NIpj6+CbMVs5Vp4uPREtc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5133
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

On 8/16/2024 12:00, Daniele Ceraolo Spurio wrote:
> PXP requires submissions to the HW for the following operations
>
> 1) Key invalidation, done via the VCS engine
> 2) Communication with the GSC FW for session management, done via the
>     GSCCS.
>
> Key invalidation submissions are serialized (only 1 termination can be
> serviced at a given time) and done via GGTT, so we can allocate a simple
> BO and a kernel queue for it.
>
> Submission for session management are tied to a PXP client (identified
Submissions are or submission is

> by a unique host_session_id); from the GSC POV this is a user-accessible
> construct, so all related submission must be done via PPGTT. The driver
> does not currently support PPGTT submission from within the kernek, so
kernel

> to add this support, the following changes have been included:
>
> - a new type of kernel-owned VM (marked as GSC), required to ensure we
>    don't set the device in no-fault mode when we initialize PXP and to
>    mark the different lock usage with lockdep.
> - a new function to map a BO into a VM from within the kernel.
>
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>   drivers/gpu/drm/xe/Makefile                   |   1 +
>   drivers/gpu/drm/xe/abi/gsc_pxp_commands_abi.h |   7 +
>   drivers/gpu/drm/xe/xe_exec_queue.c            |   3 +
>   drivers/gpu/drm/xe/xe_pxp.c                   |  25 ++-
>   drivers/gpu/drm/xe/xe_pxp_submit.c            | 201 ++++++++++++++++++
>   drivers/gpu/drm/xe/xe_pxp_submit.h            |  16 ++
>   drivers/gpu/drm/xe/xe_pxp_types.h             |  46 ++++
>   drivers/gpu/drm/xe/xe_vm.c                    | 124 ++++++++++-
>   drivers/gpu/drm/xe/xe_vm.h                    |   6 +
>   drivers/gpu/drm/xe/xe_vm_types.h              |   1 +
>   10 files changed, 418 insertions(+), 12 deletions(-)
>   create mode 100644 drivers/gpu/drm/xe/xe_pxp_submit.c
>   create mode 100644 drivers/gpu/drm/xe/xe_pxp_submit.h
>
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 9e007e59de83..a508b9166b88 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -84,6 +84,7 @@ xe-y += xe_bb.o \
>   	xe_pt.o \
>   	xe_pt_walk.o \
>   	xe_pxp.o \
> +	xe_pxp_submit.o \
>   	xe_query.o \
>   	xe_range_fence.o \
>   	xe_reg_sr.o \
> diff --git a/drivers/gpu/drm/xe/abi/gsc_pxp_commands_abi.h b/drivers/gpu/drm/xe/abi/gsc_pxp_commands_abi.h
> index 57520809e48d..f3c4cf10ba20 100644
> --- a/drivers/gpu/drm/xe/abi/gsc_pxp_commands_abi.h
> +++ b/drivers/gpu/drm/xe/abi/gsc_pxp_commands_abi.h
> @@ -6,6 +6,7 @@
>   #ifndef _ABI_GSC_PXP_COMMANDS_ABI_H
>   #define _ABI_GSC_PXP_COMMANDS_ABI_H
>   
> +#include <linux/sizes.h>
>   #include <linux/types.h>
>   
>   /* Heci client ID for PXP commands */
> @@ -13,6 +14,12 @@
>   
>   #define PXP_APIVER(x, y) (((x) & 0xFFFF) << 16 | ((y) & 0xFFFF))
>   
> +/*
> + * A PXP sub-section in an HECI packet can be up to 64K big in each direction.
> + * This does not include the top-level GSC header.
> + */
> +#define PXP_MAX_PACKET_SIZE SZ_64K
> +
>   /*
>    * there are a lot of status codes for PXP, but we only define the cross-API
>    * common ones that we actually can handle in the kernel driver. Other failure
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 7d170d37fdbe..e98e8794eddf 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -148,6 +148,9 @@ struct xe_exec_queue *xe_exec_queue_create(struct xe_device *xe, struct xe_vm *v
>   	struct xe_exec_queue *q;
>   	int err;
>   
> +	/* VMs for GSCCS queues (and only those) must have the XE_VM_FLAG_GSC flag */
> +	xe_assert(xe, !vm || (!!(vm->flags & XE_VM_FLAG_GSC) == !!(hwe->engine_id == XE_HW_ENGINE_GSCCS0)));
> +
>   	q = __xe_exec_queue_alloc(xe, vm, logical_mask, width, hwe, flags,
>   				  extensions);
>   	if (IS_ERR(q))
> diff --git a/drivers/gpu/drm/xe/xe_pxp.c b/drivers/gpu/drm/xe/xe_pxp.c
> index f974f74be1d5..56bb7d927c07 100644
> --- a/drivers/gpu/drm/xe/xe_pxp.c
> +++ b/drivers/gpu/drm/xe/xe_pxp.c
> @@ -12,6 +12,7 @@
>   #include "xe_gt.h"
>   #include "xe_gt_types.h"
>   #include "xe_mmio.h"
> +#include "xe_pxp_submit.h"
>   #include "xe_pxp_types.h"
>   #include "xe_uc_fw.h"
>   #include "regs/xe_pxp_regs.h"
> @@ -50,6 +51,20 @@ static int kcr_pxp_enable(const struct xe_pxp *pxp)
>   	return kcr_pxp_set_status(pxp, true);
>   }
>   
> +static int kcr_pxp_disable(const struct xe_pxp *pxp)
> +{
> +	return kcr_pxp_set_status(pxp, false);
> +}
> +
> +static void pxp_fini(void *arg)
> +{
> +	struct xe_pxp *pxp = arg;
> +
> +	xe_pxp_destroy_execution_resources(pxp);
> +
> +	/* no need to explicitly disable KCR since we're going to do an FLR */
> +}
> +
>   /**
>    * xe_pxp_init - initialize PXP support
>    * @xe: the xe_device structure
> @@ -97,7 +112,15 @@ int xe_pxp_init(struct xe_device *xe)
>   	if (err)
>   		return err;
>   
> +	err = xe_pxp_allocate_execution_resources(pxp);
> +	if (err)
> +		goto kcr_disable;
> +
>   	xe->pxp = pxp;
>   
> -	return 0;
> +	return devm_add_action_or_reset(xe->drm.dev, pxp_fini, pxp);
> +
> +kcr_disable:
> +	kcr_pxp_disable(pxp);
> +	return err;
Again, this will leak the pxp object until the driver is unloaded.

>   }
> diff --git a/drivers/gpu/drm/xe/xe_pxp_submit.c b/drivers/gpu/drm/xe/xe_pxp_submit.c
> new file mode 100644
> index 000000000000..b777b0765c8a
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_pxp_submit.c
> @@ -0,0 +1,201 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright(c) 2024 Intel Corporation.
> + */
> +
> +#include "xe_pxp_submit.h"
> +
> +#include <drm/xe_drm.h>
> +
> +#include "xe_device_types.h"
> +#include "xe_bo.h"
> +#include "xe_exec_queue.h"
> +#include "xe_gsc_submit.h"
> +#include "xe_gt.h"
> +#include "xe_pxp_types.h"
> +#include "xe_vm.h"
> +#include "regs/xe_gt_regs.h"
> +
> +/*
> + * The VCS is used for kernel-owned GGTT submissions to issue key termination.
> + * Terminations are serialized, so we only need a single queue and a single
> + * batch.
> + */
> +static int allocate_vcs_execution_resources(struct xe_pxp *pxp)
> +{
> +	struct xe_gt *gt = pxp->gt;
> +	struct xe_device *xe = pxp->xe;
> +	struct xe_tile *tile = gt_to_tile(gt);
> +	struct xe_hw_engine *hwe;
> +	struct xe_exec_queue *q;
> +	struct xe_bo *bo;
> +	int err;
> +
> +	hwe = xe_gt_hw_engine(gt, XE_ENGINE_CLASS_VIDEO_DECODE, 0, true);
> +	if (!hwe)
> +		return -ENODEV;
> +
> +	q = xe_exec_queue_create(xe, NULL, BIT(hwe->logical_instance), 1, hwe,
> +				 EXEC_QUEUE_FLAG_KERNEL | EXEC_QUEUE_FLAG_PERMANENT, 0);
> +	if (IS_ERR(q))
> +		return PTR_ERR(q);
> +
> +	/*
> +	 * Each termination is 16 DWORDS, so 4K is enough to contain a
> +	 * termination for each sessions.
> +	 */
> +	bo = xe_bo_create_pin_map(xe, tile, 0, SZ_4K, ttm_bo_type_kernel,
> +				  XE_BO_FLAG_SYSTEM | XE_BO_FLAG_PINNED | XE_BO_FLAG_GGTT);
> +	if (IS_ERR(bo)) {
> +		err = PTR_ERR(bo);
> +		goto out_queue;
> +	}
> +
> +	pxp->vcs_exec.q = q;
> +	pxp->vcs_exec.bo = bo;
> +
> +	return 0;
> +
> +out_queue:
> +	xe_exec_queue_put(q);
> +	return err;
> +}
> +
> +static void destroy_vcs_execution_resources(struct xe_pxp *pxp)
> +{
> +	if (pxp->vcs_exec.bo)
> +		xe_bo_unpin_map_no_vm(pxp->vcs_exec.bo);
> +
> +	if (pxp->vcs_exec.q)
> +		xe_exec_queue_put(pxp->vcs_exec.q);
> +}
> +
> +#define PXP_BB_SIZE		XE_PAGE_SIZE
> +static int allocate_gsc_client_resources(struct xe_gt *gt,
> +					 struct xe_pxp_gsc_client_resources *gsc_res,
> +					 size_t inout_size)
> +{
> +	struct xe_tile *tile = gt_to_tile(gt);
> +	struct xe_device *xe = tile_to_xe(tile);
> +	struct xe_hw_engine *hwe;
> +	struct xe_vm *vm;
> +	struct xe_bo *bo;
> +	struct xe_exec_queue *q;
> +	struct dma_fence *fence;
> +	long timeout;
> +	int err = 0;
> +
> +	hwe = xe_gt_hw_engine(gt, XE_ENGINE_CLASS_OTHER, OTHER_GSC_INSTANCE, false);
> +
> +	/* we shouldn't reach here if the GSC engine is not available */
> +	xe_assert(xe, hwe);
> +
> +	/* PXP instructions must be issued from PPGTT */
> +	vm = xe_vm_create(xe, XE_VM_FLAG_GSC);
> +	if (IS_ERR(vm))
> +		return PTR_ERR(vm);
> +
> +	/* We allocate a single object for the batch and the in/out memory */
> +	xe_vm_lock(vm, false);
> +	bo = xe_bo_create_pin_map(xe, tile, vm, PXP_BB_SIZE + inout_size * 2,
> +				  ttm_bo_type_kernel,
> +				  XE_BO_FLAG_SYSTEM | XE_BO_FLAG_PINNED | XE_BO_FLAG_NEEDS_UC);
> +	xe_vm_unlock(vm);
> +	if (IS_ERR(bo)) {
> +		err = PTR_ERR(bo);
> +		goto vm_out;
> +	}
> +
> +	fence = xe_vm_bind_bo(vm, bo, NULL, 0, XE_CACHE_WB);
> +	if (IS_ERR(fence)) {
> +		err = PTR_ERR(fence);
> +		goto bo_out;
> +	}
> +
> +	timeout = dma_fence_wait_timeout(fence, false, HZ);
> +	dma_fence_put(fence);
> +	if (timeout <= 0) {
> +		err = timeout ?: -ETIME;
> +		goto bo_out;
> +	}
> +
> +	q = xe_exec_queue_create(xe, vm, BIT(hwe->logical_instance), 1, hwe,
> +				 EXEC_QUEUE_FLAG_KERNEL |
> +				 EXEC_QUEUE_FLAG_PERMANENT, 0);
> +	if (IS_ERR(q)) {
> +		err = PTR_ERR(q);
> +		goto bo_out;
> +	}
> +
> +	gsc_res->vm = vm;
> +	gsc_res->bo = bo;
> +	gsc_res->inout_size = inout_size;
> +	gsc_res->batch = IOSYS_MAP_INIT_OFFSET(&bo->vmap, 0);
> +	gsc_res->msg_in = IOSYS_MAP_INIT_OFFSET(&bo->vmap, PXP_BB_SIZE);
> +	gsc_res->msg_out = IOSYS_MAP_INIT_OFFSET(&bo->vmap, PXP_BB_SIZE + inout_size);
> +	gsc_res->q = q;
> +
> +	/* initialize host-session-handle (for all Xe-to-gsc-firmware PXP cmds) */
> +	gsc_res->host_session_handle = xe_gsc_create_host_session_id();
> +
> +	return 0;
> +
> +bo_out:
> +	xe_bo_unpin_map_no_vm(bo);
> +vm_out:
> +	xe_vm_close_and_put(vm);
> +
> +	return err;
> +}
> +
> +static void destroy_gsc_client_resources(struct xe_pxp_gsc_client_resources *gsc_res)
> +{
> +	if (!gsc_res->q)
> +		return;
> +
> +	xe_exec_queue_put(gsc_res->q);
> +	xe_bo_unpin_map_no_vm(gsc_res->bo);
> +	xe_vm_close_and_put(gsc_res->vm);
> +}
> +
> +/**
> + * xe_pxp_allocate_execution_resources - Allocate PXP submission objects
> + * @pxp: the xe_pxp structure
> + *
> + * Allocates exec_queues objects for VCS and GSCCS submission. The GSCCS
> + * submissions are done via PPGTT, so this function allocates a VM for it and
> + * maps the object into it.
> + *
> + * Returns 0 if the allocation and mapping is successful, an errno value
> + * otherwise.
> + */
> +int xe_pxp_allocate_execution_resources(struct xe_pxp *pxp)
> +{
> +	int err;
> +
> +	err = allocate_vcs_execution_resources(pxp);
> +	if (err)
> +		return err;
> +
> +	/*
> +	 * PXP commands can require a lot of BO space (see PXP_MAX_PACKET_SIZE),
> +	 * but we currently only support a subset of commands that are small
> +	 * (< 20 dwords), so a single page is enough for now.
> +	 */
> +	err = allocate_gsc_client_resources(pxp->gt, &pxp->gsc_res, XE_PAGE_SIZE);
> +	if (err)
> +		goto destroy_vcs_context;
> +
> +	return 0;
> +
> +destroy_vcs_context:
> +	destroy_vcs_execution_resources(pxp);
> +	return err;
> +}
> +
> +void xe_pxp_destroy_execution_resources(struct xe_pxp *pxp)
> +{
> +	destroy_gsc_client_resources(&pxp->gsc_res);
> +	destroy_vcs_execution_resources(pxp);
> +}
> +
> diff --git a/drivers/gpu/drm/xe/xe_pxp_submit.h b/drivers/gpu/drm/xe/xe_pxp_submit.h
> new file mode 100644
> index 000000000000..1a971fadc081
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_pxp_submit.h
> @@ -0,0 +1,16 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright(c) 2024, Intel Corporation. All rights reserved.
> + */
> +
> +#ifndef __XE_PXP_SUBMIT_H__
> +#define __XE_PXP_SUBMIT_H__
> +
> +#include <linux/types.h>
Also not necessary?

> +
> +struct xe_pxp;
> +
> +int xe_pxp_allocate_execution_resources(struct xe_pxp *pxp);
> +void xe_pxp_destroy_execution_resources(struct xe_pxp *pxp);
> +
> +#endif /* __XE_PXP_SUBMIT_H__ */
> diff --git a/drivers/gpu/drm/xe/xe_pxp_types.h b/drivers/gpu/drm/xe/xe_pxp_types.h
> index 3a141021972a..3463caaad101 100644
> --- a/drivers/gpu/drm/xe/xe_pxp_types.h
> +++ b/drivers/gpu/drm/xe/xe_pxp_types.h
> @@ -6,10 +6,45 @@
>   #ifndef __XE_PXP_TYPES_H__
>   #define __XE_PXP_TYPES_H__
>   
> +#include <linux/iosys-map.h>
>   #include <linux/types.h>
>   
> +struct xe_bo;
> +struct xe_exec_queue;
>   struct xe_device;
>   struct xe_gt;
> +struct xe_vm;
> +
> +/**
> + * struct xe_pxp_gsc_client_resources - resources for GSC submission by a PXP
> + * client. The GSC FW supports multiple GSC client active at the same time.
> + */
> +struct xe_pxp_gsc_client_resources {
> +	/**
> +	 * @host_session_handle: handle used to identify the client in messages
> +	 * sent to the GSC firmware.
> +	 */
> +	u64 host_session_handle;
> +	/** @vm: VM used for PXP submissions to the GSCCS */
> +	struct xe_vm *vm;
> +	/** @q: GSCCS exec queue for PXP submissions */
> +	struct xe_exec_queue *q;
> +
> +	/**
> +	 * @bo: BO used for submissions to the GSCCS and GSC FW. It includes
> +	 * space for the GSCCS batch and the input/output buffers read/written
> +	 * by the FW
> +	 */
> +	struct xe_bo *bo;
> +	/** @inout_size: size of the msg_in and msg_out sections */
Maybe 'size of each of the in/out sections individually' or something to 
remove ambiguity about this being the total size of the two combined 
(which is how I would read it).

> +	u32 inout_size;
> +	/** @batch: iosys_map to the batch memory within the BO */
> +	struct iosys_map batch;
> +	/** @msg_in: iosys_map to the input memory within the BO */
> +	struct iosys_map msg_in;
> +	/** @msg_out: iosys_map to the output memory within the BO */
> +	struct iosys_map msg_out;
> +};
>   
>   /**
>    * struct xe_pxp - pxp state
> @@ -23,6 +58,17 @@ struct xe_pxp {
>   	 * (VDBOX, KCR and GSC)
>   	 */
>   	struct xe_gt *gt;
> +
> +	/** @vcs_exec: kernel-owned objects for PXP submissions to the VCS */
> +	struct {
> +		/** @vcs_exec.q: kernel-owned VCS exec queue used for PXP terminations */
> +		struct xe_exec_queue *q;
> +		/** @vcs_exec.bo: BO used for submissions to the VCS */
> +		struct xe_bo *bo;
> +	} vcs_exec;
> +
> +	/** @gsc_exec: kernel-owned objects for PXP submissions to the GSCCS */
> +	struct xe_pxp_gsc_client_resources gsc_res;
>   };
>   
>   #endif /* __XE_PXP_TYPES_H__ */
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 6dd76f77b504..56f105797ae6 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -1381,6 +1381,15 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
>   	struct xe_tile *tile;
>   	u8 id;
>   
> +	/*
> +	 * All GSC VMs are owned by the kernel and can also only be used on
> +	 * the GSCCS. We don't want a kernel-owned VM to put the device in
> +	 * either fault or not fault mode, so we need to exclude the GSC VMs
> +	 * from that count; this is only safe if we ensure that all GSC VMs are
> +	 * non-faulting.
> +	 */
> +	xe_assert(xe, !((flags & XE_VM_FLAG_GSC) && (flags & XE_VM_FLAG_FAULT_MODE)));
> +
>   	vm = kzalloc(sizeof(*vm), GFP_KERNEL);
>   	if (!vm)
>   		return ERR_PTR(-ENOMEM);
> @@ -1391,7 +1400,21 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
>   
>   	vm->flags = flags;
>   
> -	init_rwsem(&vm->lock);
> +	/**
> +	 * GSC VMs are kernel-owned, only used for PXP ops and can be
> +	 * manipulated under the PXP mutex. However, the PXP mutex can be taken
Is that 'can be (but don't have to be) manipulated' or 'can only be 
manipulated'?

> +	 * under a user-VM lock when the PXP session is started at exec_queue
> +	 * creation time. Those are different VMs and therefore there is no risk
> +	 * of deadlock, but we need to tell lockdep that this is the case or it
> +	 * will print a warning.
> +	 */
> +	if (flags & XE_VM_FLAG_GSC) {
> +		static struct lock_class_key gsc_vm_key;
> +
> +		__init_rwsem(&vm->lock, "gsc_vm", &gsc_vm_key);
> +	} else {
> +		init_rwsem(&vm->lock);
> +	}
>   	mutex_init(&vm->snap_mutex);
>   
>   	INIT_LIST_HEAD(&vm->rebind_list);
> @@ -1510,7 +1533,7 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
>   	mutex_lock(&xe->usm.lock);
>   	if (flags & XE_VM_FLAG_FAULT_MODE)
>   		xe->usm.num_vm_in_fault_mode++;
> -	else if (!(flags & XE_VM_FLAG_MIGRATION))
> +	else if (!(flags & (XE_VM_FLAG_MIGRATION | XE_VM_FLAG_GSC)))
>   		xe->usm.num_vm_in_non_fault_mode++;
>   	mutex_unlock(&xe->usm.lock);
>   
> @@ -2694,11 +2717,10 @@ static void vm_bind_ioctl_ops_fini(struct xe_vm *vm, struct xe_vma_ops *vops,
>   	for (i = 0; i < vops->num_syncs; i++)
>   		xe_sync_entry_signal(vops->syncs + i, fence);
>   	xe_exec_queue_last_fence_set(wait_exec_queue, vm, fence);
> -	dma_fence_put(fence);
>   }
>   
> -static int vm_bind_ioctl_ops_execute(struct xe_vm *vm,
> -				     struct xe_vma_ops *vops)
> +static struct dma_fence *vm_bind_ioctl_ops_execute(struct xe_vm *vm,
> +						   struct xe_vma_ops *vops)
Rather than changing the internals, is it not possible to just call 
xe_exec_queue_last_fence_get() after vm_bind_ioctl_ops_execute has returned?

>   {
>   	struct drm_exec exec;
>   	struct dma_fence *fence;
> @@ -2711,21 +2733,21 @@ static int vm_bind_ioctl_ops_execute(struct xe_vm *vm,
>   	drm_exec_until_all_locked(&exec) {
>   		err = vm_bind_ioctl_ops_lock_and_prep(&exec, vm, vops);
>   		drm_exec_retry_on_contention(&exec);
> -		if (err)
> +		if (err) {
> +			fence = ERR_PTR(err);
>   			goto unlock;
> +		}
>   
>   		fence = ops_execute(vm, vops);
> -		if (IS_ERR(fence)) {
> -			err = PTR_ERR(fence);
> +		if (IS_ERR(fence))
>   			goto unlock;
> -		}
>   
>   		vm_bind_ioctl_ops_fini(vm, vops, fence);
>   	}
>   
>   unlock:
>   	drm_exec_fini(&exec);
> -	return err;
> +	return fence;
>   }
>   
>   #define SUPPORTED_FLAGS_STUB  \
> @@ -2946,6 +2968,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>   	struct xe_sync_entry *syncs = NULL;
>   	struct drm_xe_vm_bind_op *bind_ops;
>   	struct xe_vma_ops vops;
> +	struct dma_fence *fence;
>   	int err;
>   	int i;
>   
> @@ -3108,7 +3131,11 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>   	if (err)
>   		goto unwind_ops;
>   
> -	err = vm_bind_ioctl_ops_execute(vm, &vops);
> +	fence = vm_bind_ioctl_ops_execute(vm, &vops);
> +	if (IS_ERR(fence))
> +		err = PTR_ERR(fence);
> +	else
> +		dma_fence_put(fence);
There isn't a new fence get in vm_bind_ioctl_ops_execute(). The change 
in return value is the only difference in behaviour. So why is an extra 
put required?

>   
>   unwind_ops:
>   	if (err && err != -ENODATA)
> @@ -3142,6 +3169,81 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>   	return err;
>   }
>   
> +/**
> + * xe_vm_bind_bo - bind a kernel BO to a VM
> + * @vm: VM to bind the BO to
> + * @bo: BO to bind
> + * @q: exec queue to use for the bind (optional)
> + * @addr: address at which to bind the BO
> + * @cache_lvl: PAT cache level to use
> + *
> + * Execute a VM bind map operation on a kernel-owned BO to bind it into a
> + * kernel-owned VM.
> + *
> + * Returns a dma_fence to track the binding completion if the job to do so was
> + * successfully submitted, an error pointer otherwise.
> + */
> +struct dma_fence *xe_vm_bind_bo(struct xe_vm *vm, struct xe_bo *bo,
> +				struct xe_exec_queue *q, u64 addr,
> +				enum xe_cache_level cache_lvl)
Should this have '_kernel_' in the name given the description of 
kernel-owned BO to kernel-owned VM?

John.

> +{
> +	struct xe_vma_ops vops;
> +	struct drm_gpuva_ops *ops = NULL;
> +	struct dma_fence *fence;
> +	int err;
> +
> +	xe_bo_get(bo);
> +	xe_vm_get(vm);
> +	if (q)
> +		xe_exec_queue_get(q);
> +
> +	down_write(&vm->lock);
> +
> +	xe_vma_ops_init(&vops, vm, q, NULL, 0);
> +
> +	ops = vm_bind_ioctl_ops_create(vm, bo, 0, addr, bo->size,
> +				       DRM_XE_VM_BIND_OP_MAP, 0, 0,
> +				       vm->xe->pat.idx[cache_lvl]);
> +	if (IS_ERR(ops)) {
> +		err = PTR_ERR(ops);
> +		goto release_vm_lock;
> +	}
> +
> +	err = vm_bind_ioctl_ops_parse(vm, ops, &vops);
> +	if (err)
> +		goto release_vm_lock;
> +
> +	xe_assert(vm->xe, !list_empty(&vops.list));
> +
> +	err = xe_vma_ops_alloc(&vops, false);
> +	if (err)
> +		goto unwind_ops;
> +
> +	fence = vm_bind_ioctl_ops_execute(vm, &vops);
> +	if (IS_ERR(fence))
> +		err = PTR_ERR(fence);
> +
> +unwind_ops:
> +	if (err && err != -ENODATA)
> +		vm_bind_ioctl_ops_unwind(vm, &ops, 1);
> +
> +	xe_vma_ops_fini(&vops);
> +	drm_gpuva_ops_free(&vm->gpuvm, ops);
> +
> +release_vm_lock:
> +	up_write(&vm->lock);
> +
> +	if (q)
> +		xe_exec_queue_put(q);
> +	xe_vm_put(vm);
> +	xe_bo_put(bo);
> +
> +	if (err)
> +		fence = ERR_PTR(err);
> +
> +	return fence;
> +}
> +
>   /**
>    * xe_vm_lock() - Lock the vm's dma_resv object
>    * @vm: The struct xe_vm whose lock is to be locked
> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> index c864dba35e1d..bfc19e8113c3 100644
> --- a/drivers/gpu/drm/xe/xe_vm.h
> +++ b/drivers/gpu/drm/xe/xe_vm.h
> @@ -19,6 +19,8 @@ struct drm_file;
>   struct ttm_buffer_object;
>   struct ttm_validate_buffer;
>   
> +struct dma_fence;
> +
>   struct xe_exec_queue;
>   struct xe_file;
>   struct xe_sync_entry;
> @@ -248,6 +250,10 @@ int xe_vm_lock_vma(struct drm_exec *exec, struct xe_vma *vma);
>   int xe_vm_validate_rebind(struct xe_vm *vm, struct drm_exec *exec,
>   			  unsigned int num_fences);
>   
> +struct dma_fence *xe_vm_bind_bo(struct xe_vm *vm, struct xe_bo *bo,
> +				struct xe_exec_queue *q, u64 addr,
> +				enum xe_cache_level cache_lvl);
> +
>   /**
>    * xe_vm_resv() - Return's the vm's reservation object
>    * @vm: The vm
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> index 7f9a303e51d8..52467b9b5348 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -164,6 +164,7 @@ struct xe_vm {
>   #define XE_VM_FLAG_BANNED		BIT(5)
>   #define XE_VM_FLAG_TILE_ID(flags)	FIELD_GET(GENMASK(7, 6), flags)
>   #define XE_VM_FLAG_SET_TILE_ID(tile)	FIELD_PREP(GENMASK(7, 6), (tile)->id)
> +#define XE_VM_FLAG_GSC			BIT(8)
>   	unsigned long flags;
>   
>   	/** @composite_fence_ctx: context composite fence */

