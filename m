Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31C47C0218A
	for <intel-xe@archiver.kernel.org>; Thu, 30 Jan 2025 17:40:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0F4C10E9B3;
	Thu, 30 Jan 2025 17:40:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jHwdJCDK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D22E10E385
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Jan 2025 17:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738258830; x=1769794830;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=fXqIizUNjkYLLlOMhoav5/bS+2KHMxlN2/MpqtRYrYk=;
 b=jHwdJCDKUansYRHUo/40Y7tpss3N5UDHxL+CeMVjvHH1Mm5xOmuT38Ea
 dO/EwlfLhQvwc4ssfiKOj/MSvLR7cgZqW5w2e7Z3wqIcFmoi1jctLTUu3
 j4u4+11nZ9qvoPsYxLy+p5Ty9gjNFYIdhcr03Er5KmGLeZcB2uafTAvNd
 bBupTcWAtNqv6EoSBNfRlsqiLcNoHZsJAj7hHhT8+sxyIyTr0bqiUBD3A
 T1YRN7Q6D4kFmUt1pwqH63unherHp+m5yW9ujybpQmJV4sorDIdYDdjhQ
 kpWdKiXWccsXdyaYIm0gYLKU5WqbqY7rIzlLb5RYvwPU1L1xDy/0cvSQT w==;
X-CSE-ConnectionGUID: 8X24JvkWRhagFwsfo1+Pgw==
X-CSE-MsgGUID: 4H+6n05qT2K5f4rZK1FX6Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11331"; a="49409629"
X-IronPort-AV: E=Sophos;i="6.13,246,1732608000"; d="scan'208";a="49409629"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2025 09:40:28 -0800
X-CSE-ConnectionGUID: TYj73kAgTQylHW1H57/s3A==
X-CSE-MsgGUID: NK7pGg7AQT+Ir6+kmRW5bA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,246,1732608000"; d="scan'208";a="109964596"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Jan 2025 09:40:28 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 30 Jan 2025 09:40:27 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 30 Jan 2025 09:40:27 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.45) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 30 Jan 2025 09:40:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y9GgcvhF8e3448pOMlwnY/7Qq6YhmnB5M1IIzXnn9juScKfIExqS2lK0Vjeiyaa77i0Z9KYRm5FVOk7ec9aCdfe3dip3NZel3/u/+KrFjtPyGM+rJri2DuMc2NaQTcCFawTdHL3HNSDkMkVL7K8CO5ne2sb5jiTwrbsGKBrsBMNoGm9vKVO7lMcLL9T5ATYBF4RWrT901uldQm2QadM98ssBsM9a57Kx0WzWToj95O0EVfDOaO46J//2+OTuQB2YoDWBYBk2Vmx7mwhgxahMLvyxc8OTTqQvnMJe9VcSA2Rmc+nuNDlYwyviXcLuAExAwmmPtuzIcoVQb09avKY0+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HQg26YlTMUbO0nj9HTCSQdRqaP1UMRl86soEMkMoBjM=;
 b=srDjqjX73jYJamyZ2axOfAZCoXFxFLtwfMsBdrlYmTa8+p2embAb3YqhhdBS9fZpPa/fRpzJ812rNLmLbAphah+BLGFvK78TDcrBM69e10KQTf71yuuKi42sVAj7Agm1zy1WHfaOSa3MnfzRbQYfsu1QwoVCXT9dX6jfvY6u2ZmCKuJOx1FFq8xdXf5oA8HuHNTaLqde09OH3vn7mMX649mvVGZQl2Mhd77fhgg51+ITIDIDerFfDU41/kebBv2i7zXgdwYD1CRcXjXb93zF/7JmjLGrQQdNtCL8PT6+o6FIWol1eZWW6AloZjgCIy63eRbE+wArxU89QSdV4qcD6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by CH3PR11MB7842.namprd11.prod.outlook.com (2603:10b6:610:128::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.23; Thu, 30 Jan
 2025 17:40:23 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%3]) with mapi id 15.20.8398.014; Thu, 30 Jan 2025
 17:40:23 +0000
Date: Thu, 30 Jan 2025 09:40:21 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <lucas.demarchi@intel.com>, <vinay.belgaumkar@intel.com>,
 <soham.purkait@intel.com>, <john.c.harrison@intel.com>
Subject: Re: [PATCH v4 5/8] drm/xe/guc: Bump minimum required GuC version to
 v70.36.0
Message-ID: <Z5u5hT1+wg4KSDrL@orsosgc001>
References: <20250129101653.1976699-1-riana.tauro@intel.com>
 <20250129101653.1976699-6-riana.tauro@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250129101653.1976699-6-riana.tauro@intel.com>
X-ClientProxiedBy: MW4PR03CA0261.namprd03.prod.outlook.com
 (2603:10b6:303:b4::26) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|CH3PR11MB7842:EE_
X-MS-Office365-Filtering-Correlation-Id: 12e638e4-178f-49b6-3923-08dd41552cbc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R3pjY2prKzhFWmxvR2kwZ2Q5NnVmd0Z0KzcrMnptbFJOZXk1L09VVkNldnlz?=
 =?utf-8?B?WVlXdytieHdadEM1RE02emR6RlBjQnUvRzdySUxRcXo0Qlc2WXVIK3Y5ZEha?=
 =?utf-8?B?aWFVVzZESkgxNTEzQjlZWlg5emhFbitKTzBmYkUvcnZRblhrSGd0TCtzak1o?=
 =?utf-8?B?SlR0OXVGSnlRcWZMTUx2SDFKVTJoWk1GMTVyTkw4Wm55UmxPdmh4MHNabE9n?=
 =?utf-8?B?eDBFV09zZHdxRWM3eUVPRElLSG5MSUI1MHowbkJUQkU4L0k0SmtKM3dEbGpH?=
 =?utf-8?B?Wk5oaFUwSEtMYlEvSXNEMTlyZXJaaGRiRFRaa3lDUUIwQUd4STF2Mm5UQXM0?=
 =?utf-8?B?MTJWNURYUWlOd1RQc3VCOUJEaDFZTkZIdVZ4UFhBVjc2K1JGbnBMWlZVSzFD?=
 =?utf-8?B?Q3NBampnZWVjWXRBc2xOM01zenJjMmZGQjlVUmhaVU5xSmpMUWQybURPZDF3?=
 =?utf-8?B?ejE1N1o2T2lqWmNvMFVtNHZqS3drR3NHOUE3K2d2UVFKT2lXdW82NDJsNDlz?=
 =?utf-8?B?dVdzU1IveFlhNDE1eXpNeVc5TndVdWpvaTJ3RGtrSnplMlR5TDBPV1l3SjdR?=
 =?utf-8?B?cDVuQ3ZMWWZZWnQwSjFNOE5oQ1pXMVBCTEE4WFo2cE5tSmh3NkJENW0zM01Y?=
 =?utf-8?B?dnczaEVNL1JhdmxMVnBUbHdOS2VXaGxqWWViangxZHVoa205SGFwODhHYjZ1?=
 =?utf-8?B?WVA4bnNxdDNUczlabC9yVGQ0WVM1M3Z1OXo4aGpFdU94Z1RzTjBsell6NFRC?=
 =?utf-8?B?YmQ4VHV1R2kzRXM2TERFWDVHb3BaK1Y1QWxRNjF0UlRTVUVzNWhBMjQ5Nis3?=
 =?utf-8?B?RXplQTk2RGJHcHNmMWt0bGo0Z2EzNVM4L1p3KzFIajlIb0FObmJua0Ryc0FZ?=
 =?utf-8?B?NW0vRjZCaE95bzdlN0huSlRNQ0ZjaVEyV1dhbnlFYzk3Sk1XM2RvVlRwNmxQ?=
 =?utf-8?B?QStSWnZFc1Y1dmIyY0UxSGJaZzhWdUd6Qk4reFlCZVlEYnFuUmFtNXh5U1I2?=
 =?utf-8?B?Q0xPR0dBeTNPS1FmNjIwcExOYjYyWEhPQU5EV244VXdDdFE3TjVyK2VVcEd5?=
 =?utf-8?B?OFNWeVp0Mm0xSW01VTMzUXRWclJ4VDJYdjFUbVBsclFXdnJKeVJvQnFxN25m?=
 =?utf-8?B?VUdPZERTUy9oK3dxNnVvMWphME4vclJyU09rS2pqWk83OEVheWRjMEl1VXVT?=
 =?utf-8?B?eXl2ckY5SUpDZWFpRE1jTENXV2t4V2VrdFVTTEtOZ3pJbG5RdlYvRlZXRU5v?=
 =?utf-8?B?bjRyQnQzTEdod3dJUUpqTmxoNVQ5eEI2ckM5T2JVYzBnc3MzOHVvc0lMZTQ4?=
 =?utf-8?B?Q20rRm1ZcUFQSnBTVkN1cEl4N2dUM3hOWVBvdWJsbi81dzlydzR1ZWhUWGZr?=
 =?utf-8?B?UGJ5U0o0QkVnV3dvNW9yclhlb29QbWEwUFBST09vbHczZEJCdmhNUEJmYnZH?=
 =?utf-8?B?TXVCbm5yWUdmdVBlNm1TZkZqcXFBR0J6d2ptdUxQeDE1NFhpV29sUmNIQXpC?=
 =?utf-8?B?ZE9PR3h3NWwrSjVFYlJ2bHhhL2dkU3lVaWE1cUh4RzZsZ0thZzJLZ1BVMDhB?=
 =?utf-8?B?ZDd6RTBQcE04akVYZkNkbmd5MTgwL1c5RzYySHR4TzdZdm5NcWlCSlM0TGI1?=
 =?utf-8?B?L0dYTytsMzVKazJIN1R1blh0U3hZUFE1QUJacmFyR3hSaTFwYUJmZ3ZpUVN4?=
 =?utf-8?B?WGxKajF4eUpmUDdNcUZVdWU2SEpvdUdHbDZNdHlkMFMvSjExV2kzS0F6bU80?=
 =?utf-8?B?NGdnWkxoQ0VGQ2lneUYwcERVNTFsSjBaWkNkZVk1SnhyMFhSenlQd0lYYTdt?=
 =?utf-8?B?T2hiQmxvSDhSMmNMOExBNU1ZSThXbzVXYmFBbkRLcXFHMmoxcU5pRDM4NDU5?=
 =?utf-8?Q?uiAGrrF16Aib7?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?akx4LzUzaGRad2JFY1lZZWFIUG9POXJpVDRTKzVNYit2RHFrR0JsTldyYVpz?=
 =?utf-8?B?RUNsc0FGVHVqYjZYOTZ2T0pEV1VNeUJsTVBDelR3eHkxYTY3bWhDSis5MTBI?=
 =?utf-8?B?OEZXZit1S0F6aExiNlJRZDBUMGFYSWhubkpJZzU1TmduWDgwVVBrY1NpRmtJ?=
 =?utf-8?B?d3RvUnFjcmJaeTV2Sm1STTgzZUtIVGM1MUIxemlTREtqdGVQQWp5KzBWVDBO?=
 =?utf-8?B?Q1VsMDBKajc4a2ZQdThtaEIzalN2TU91SGtsZUk0Z2VYNzVYNC9rVENMRzBp?=
 =?utf-8?B?OS9zVURSUzN1R2VBU2pCSWxoQWlOZ1BtMW5MSlI1ekpNc3o3VHdBTlVOd2F2?=
 =?utf-8?B?OStGTFZ5M1NkWVVweWllWllTWE03VXU4UkNXdGRuSVJjcXR5cGk5dUozOTRU?=
 =?utf-8?B?dzVCYW1xa0NiVEdGa0Vkb2poMWZoSUs4MUp5UnMwQnEvdTRIdWoxOFQxNXZS?=
 =?utf-8?B?Ym5CQUZwNzFUV1kvZDB6UEwyTmQ2MFA2NElsYjNEL0FEbkw5OUFJRkV3Qzhi?=
 =?utf-8?B?V1R3VkNxSWpqVHJLYU1wUS9aN3lhTEh5TXNHNjQ0QTVWMys2bjRES0ErSW55?=
 =?utf-8?B?bjJMNEZocFRuTGdhZkVCWEsxVmRNZHlNTUl5UEVaNEpxeHRxTGNQeGxhdWFh?=
 =?utf-8?B?b2RYam82Ty9NMmEwcTY1S1JPMy9CWEc4UUpzRUZMdDBLaE1naDZlUEZqY0xM?=
 =?utf-8?B?Q05acTJ3YndhWjk2UkRmbS95dWtxL2lFL2JlS25la3pRdExOWUMyU2ZiTzBE?=
 =?utf-8?B?THBRRmt1dFltKzhlN2dHbk1ZblR6MWdzYVpneGVnbXBmNys1ZVZPdjJvY2R2?=
 =?utf-8?B?TFhUdFpjK0QwUkFTOWxSN2UwcnQ4L2NwemtrYkVjUCsxaGdwUC9iV1FmRkhy?=
 =?utf-8?B?dUhiVkFZTzA3WWYyejN0WUtLdjJ1a2YvN2xVajNhRWwrbjNteHhORlpGdmly?=
 =?utf-8?B?S0lwQ1lnZUl3cTZTa2tIWHMwNkhheDh0cSt3V1lhVnhzQXdpQ3ZRUXV3N2kv?=
 =?utf-8?B?bnpPblVZbHhoekR4NTQ4SnlNUWhoRGlJUk5CYVFPQzdySk9RMHJxeEVkbXhD?=
 =?utf-8?B?Q2FVYTlWb0l4WGVLcCt1OEtEVnVCUnh3MVFFUGlUeXA1bjhPWFlkWlR0V3ox?=
 =?utf-8?B?dkVaOXlUWFVJMGJXUE5uUU1QeW1oTUk4azgrYWJUVXdRZENOMm5rWXhPQk9i?=
 =?utf-8?B?TThsRFNMcThobFhPL0RoWlliZ1daMjNtVXdKcHFta2Fjc1lGbEdqRTV2UlR1?=
 =?utf-8?B?QWpLMXluUDlYYTVYVjBxZk1HaVVWazVPSjlXblZ5aUV4cVpMdndmb1FLM1VU?=
 =?utf-8?B?cnlaZnoxdUpaajYwT0VzY2tJSm5LOTRzRHB1TWlaMzlFbXU0MnRETmplUVA2?=
 =?utf-8?B?N3k1S29oS21NamRkWXp3cDYwZzdacS84d2FsU2E1SFF3bjdUMk8yYkZ6WjdB?=
 =?utf-8?B?OUJSbVhuL1dqUDJjemVLa0EzYmJKZFVCMFUyNm5hRStjVUR0cUg2cFU4VEpn?=
 =?utf-8?B?Rlc5aXRpdE9NUjFmY21pUVhhUE5kZzY2bTdjOEVhY1ZTQkpmOHBqeTNLWFlv?=
 =?utf-8?B?Z2JEYTZoWkpoWlB1SUVRRGNHNTVtZnVGaGY2RmhKQzRwOVlrVjBic25DUkZ0?=
 =?utf-8?B?L01UVmRHelVBbXViWEtGQkRPeTRsOGpEN1dSVGpuVG90UXFOSEF2Z2NIMnFh?=
 =?utf-8?B?aGcweThUTVJLVTAzSnNmbUs1TkpWYk0rWUh2SVUwcy9rY3lnazgrU2pxQ3N4?=
 =?utf-8?B?Q3JaNFhVTGZpd2ZDWlhQRUJhZHB5LzhIN01Za21mYlZvb3FydEZFL1FXVGpO?=
 =?utf-8?B?dWx0VVQwdDUxNEV1VlFJb1lWS0lZTkJJN29LOWVGcG1YcUp0azE0T1JwV0lp?=
 =?utf-8?B?djMxYWtsSG5yMHo3UUpXdFJvSjdta2ZxYWJ3QllnR0c5TEV6MjBwdFY1NzVO?=
 =?utf-8?B?UkZCTlhtSzVhY2NQNUltd0N2LzdPSHVObVJhOXJtTTdWTXk3SXBzS3BKUTlQ?=
 =?utf-8?B?MmJXVWdiZVUrdnE3N05FeWJaRXRCVVo5NEwrekYxRStUNGlUUmt4MW9jL2J5?=
 =?utf-8?B?SElMUU9yMDJFMWJBdmxuT1FtdHdGKzdVR1VQdWZrMUFNbVpnMXloSXBHazJr?=
 =?utf-8?B?UW5KNzhiS25xR3M1ODlCRG96dVlSU1Z2M1BmS0pQZ2U5OWVvcFFXMXJLZkta?=
 =?utf-8?Q?nYwHxWMsWepK/UlaE0og5LA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 12e638e4-178f-49b6-3923-08dd41552cbc
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2025 17:40:23.7395 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2ThSOpoScfeDKrsZHFi/bOV78H1ub5ls8YDSUWoPWdOrEG+CYWcUaPiN2qUHzDp+A3kBJrQp7v8L4EE0KuZmAu+/BtF+nTj/Wc9D2vpOfRI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7842
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

On Wed, Jan 29, 2025 at 03:46:48PM +0530, Riana Tauro wrote:
>The VF API version for this release is 1.17.1
>
>Bump the minimum required version to v70.36.0 to support
>engine activity.

+ John, since he mentioned offline that some platforms require a 
specific version here.

Regards,
Umesh

>
>Suggested-by: John Harrison <John.C.Harrison@Intel.com>
>Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>---
> drivers/gpu/drm/xe/xe_uc_fw.c | 28 ++++++++++++++--------------
> 1 file changed, 14 insertions(+), 14 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
>index 18e06ee9e23f..d9ff285c5d1d 100644
>--- a/drivers/gpu/drm/xe/xe_uc_fw.c
>+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
>@@ -108,17 +108,17 @@ struct fw_blobs_by_type {
>
> #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)			\
> 	fw_def(PANTHERLAKE,	mmp_ver(xe,	guc,	ptl,	70, 38, 1))	\
>-	fw_def(BATTLEMAGE,	major_ver(xe,	guc,	bmg,	70, 29, 2))	\
>-	fw_def(LUNARLAKE,	major_ver(xe,	guc,	lnl,	70, 29, 2))	\
>-	fw_def(METEORLAKE,	major_ver(i915,	guc,	mtl,	70, 29, 2))	\
>-	fw_def(PVC,		mmp_ver(xe,	guc,	pvc,	70, 29, 2))	\
>-	fw_def(DG2,		major_ver(i915,	guc,	dg2,	70, 29, 2))	\
>-	fw_def(DG1,		major_ver(i915,	guc,	dg1,	70, 29, 2))	\
>-	fw_def(ALDERLAKE_N,	major_ver(i915,	guc,	tgl,	70, 29, 2))	\
>-	fw_def(ALDERLAKE_P,	major_ver(i915,	guc,	adlp,	70, 29, 2))	\
>-	fw_def(ALDERLAKE_S,	major_ver(i915,	guc,	tgl,	70, 29, 2))	\
>-	fw_def(ROCKETLAKE,	major_ver(i915,	guc,	tgl,	70, 29, 2))	\
>-	fw_def(TIGERLAKE,	major_ver(i915,	guc,	tgl,	70, 29, 2))
>+	fw_def(BATTLEMAGE,	major_ver(xe,	guc,	bmg,	70, 36, 0))	\
>+	fw_def(LUNARLAKE,	major_ver(xe,	guc,	lnl,	70, 36, 0))	\
>+	fw_def(METEORLAKE,	major_ver(i915,	guc,	mtl,	70, 36, 0))	\
>+	fw_def(PVC,		mmp_ver(xe,	guc,	pvc,	70, 36, 0))	\
>+	fw_def(DG2,		major_ver(i915,	guc,	dg2,	70, 36, 0))	\
>+	fw_def(DG1,		major_ver(i915,	guc,	dg1,	70, 36, 0))	\
>+	fw_def(ALDERLAKE_N,	major_ver(i915,	guc,	tgl,	70, 36, 0))	\
>+	fw_def(ALDERLAKE_P,	major_ver(i915,	guc,	adlp,	70, 36, 0))	\
>+	fw_def(ALDERLAKE_S,	major_ver(i915,	guc,	tgl,	70, 36, 0))	\
>+	fw_def(ROCKETLAKE,	major_ver(i915,	guc,	tgl,	70, 36, 0))	\
>+	fw_def(TIGERLAKE,	major_ver(i915,	guc,	tgl,	70, 36, 0))
>
> #define XE_HUC_FIRMWARE_DEFS(fw_def, mmp_ver, no_ver)		\
> 	fw_def(PANTHERLAKE,	mmp_ver(xe,	huc,		ptl, 10, 2, 1))	\
>@@ -320,9 +320,9 @@ static int guc_read_css_info(struct xe_uc_fw *uc_fw, struct uc_css_header *css)
>
> 	xe_gt_assert(gt, uc_fw->type == XE_UC_FW_TYPE_GUC);
>
>-	/* We don't support GuC releases older than 70.29.2 */
>-	if (MAKE_GUC_VER_STRUCT(*release) < MAKE_GUC_VER(70, 29, 2)) {
>-		xe_gt_err(gt, "Unsupported GuC v%u.%u.%u! v70.29.2 or newer is required\n",
>+	/* We don't support GuC releases older than 70.36.0 */
>+	if (MAKE_GUC_VER_STRUCT(*release) < MAKE_GUC_VER(70, 36, 0)) {
>+		xe_gt_err(gt, "Unsupported GuC v%u.%u.%u! v70.36.0 or newer is required\n",
> 			  release->major, release->minor, release->patch);
> 		return -EINVAL;
> 	}
>-- 
>2.47.1
>
