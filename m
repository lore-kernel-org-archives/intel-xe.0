Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B27DC83F1A
	for <intel-xe@archiver.kernel.org>; Fri, 11 Jul 2025 05:47:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD42710E25D;
	Fri, 11 Jul 2025 05:47:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X4W0U3T7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3601310E25D
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Jul 2025 05:47:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752212829; x=1783748829;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=dT/lkqK7gLvtWYQWG1dGHBdHE6ULlWfVR/4HiCBvnCQ=;
 b=X4W0U3T7szMja+kSwavo9D21Msj7LGVKGqVb8gYcrW8Sei0Xa4wY+oGf
 uLbxRUQHvf7r+JjuxyvDgFsKzc5OP4Gm8yJ+poyBOQdvXQ13CJ12jru2r
 gxcPIdX9N6rIStigOn2WDz9q5T1fa5giMtC2W4diUhd6QebYAUhvRNcw9
 VNf/gxCyFcYn6xQTUv+i+KyDrxzXtxA1jcVEyVBQHtsC+YekJxQaICP+0
 R9PODAYkmzlFiktZNVJlusGzDctlYwr4sGgJeZ6y3ChccsLoDR5r3fzhc
 nO0hqdaMFoEIBcYhTWV8jTJ1ESc/1d4Q1mo+Yane9/8bGbfAcPaH+WF4h w==;
X-CSE-ConnectionGUID: 87H+Gs8xQ/CKEhOsVlqskQ==
X-CSE-MsgGUID: JV/cjZ81TRq6T2BR0TYseQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11490"; a="54360616"
X-IronPort-AV: E=Sophos;i="6.16,302,1744095600"; d="scan'208";a="54360616"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 22:47:08 -0700
X-CSE-ConnectionGUID: +8T660gZSySlG8bCkSjdKg==
X-CSE-MsgGUID: 6r9ocryUSnSu8SkFPk0Zpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,302,1744095600"; d="scan'208";a="187269714"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 22:47:07 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 10 Jul 2025 22:47:06 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 10 Jul 2025 22:47:06 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.49)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 10 Jul 2025 22:47:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DtABuoOQ5rUY6DUO8iycSOOx63c8WZnfi8ITf1Oa2ioJLkHNOuYfl2hG72Ck3YGVpIymjCQ8GI4JQS7zWla5AFEsSIZWA9isMqszuhpq93jL46ZHNpxMC5C97coAvJ/favAedcd0xnOu9mV3B3XKEyeVYpXHvskhmUZGFGwHMETPEW5gy7lAliQqNPuJUJafOw5mOi8LOg4oQKVx+I14Z81qK8E99SWqlnQ74PBa1kVLGcGB+sJhbcSg4yNcBI1H4fU1pKU29/tmpy1rJgqHWEy60vP+D1rjrIKFN/sl/aQRTl0sL2HPs6k2/Sjm/Z9gUZRyN/uKTfhK1gXypwCCIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=loFO5guze+onMKtNlPN8RXkjhTRrgxOcTZmY73cgaa4=;
 b=C7HB0OgDsq7MbTBiMdH25Qnk5urCzAKlg9XujlOotvmLalZGDNwvLcY91H3NHl3tjg71ewzehdUE9XxVAlLMQ4WAF7OCSgB4x1zo79koDFZTYetdm2WnujEdwwWd2634mircERLpAfaejLAnlmpBv4oiqO+cyVcF4mDc/wnTgzY8Lp5zcvJhVHOP88/SHgRBiS9jGu3CTL2XYKwHHlME2u3Pe8mJMDVqvEyhGwJahNeqj9RZVxemgDWiBGocpKdRDawYVFPyfr7rmGwCi4wNGM5b50T6kFLxJonWMOlMBTT8yMW4RNIf8A6KS59BarjVRAZ4MiCVUYIqc0qeswtu0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 SJ2PR11MB7548.namprd11.prod.outlook.com (2603:10b6:a03:4cb::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.22; Fri, 11 Jul
 2025 05:46:23 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%6]) with mapi id 15.20.8901.024; Fri, 11 Jul 2025
 05:46:23 +0000
Message-ID: <f4f6d2d3-7cf6-471d-b4cf-bdee6aa3284c@intel.com>
Date: Fri, 11 Jul 2025 11:16:15 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 8/9] drm/xe/xe_hw_error: Handle CSC Firmware reported
 Hardware errors
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <rodrigo.vivi@intel.com>, <lucas.demarchi@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <raag.jadav@intel.com>,
 <frank.scarbrough@intel.com>, <sk.anirban@intel.com>
References: <20250709112024.1053710-1-riana.tauro@intel.com>
 <20250709112024.1053710-9-riana.tauro@intel.com>
 <aHBcfIp4FzeivAdB@unerlige-desk.amr.corp.intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <aHBcfIp4FzeivAdB@unerlige-desk.amr.corp.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0P287CA0012.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::11) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|SJ2PR11MB7548:EE_
X-MS-Office365-Filtering-Correlation-Id: e67d6552-8ff2-4485-1871-08ddc03e449d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VkkvaHc1RnFBcDdac2ZHMUR5aGYwYUtIeVBmTTJHQjNoeHRRS0dzejJOUGo5?=
 =?utf-8?B?bUhidFo3SzlMK2htTEt0TjdiN2RHS2hRL2h1Wi9iS1dlZzZsQUFQcy9KdExR?=
 =?utf-8?B?bE1mbytFUjREOFdSWXIvY3QrcllQRFF4YXN0L2phK2FqMmM5ZVdlUDlvTG9Q?=
 =?utf-8?B?YVVnTm5GOFRsdFN1RUlmWnh1N3k0bG0yZ0tndytsQWVTYUlFQ092dEs0UGVp?=
 =?utf-8?B?OFArME5zcElNTTF3aXQrY29EQmpFV1NpVCs1T0hJbm9KbGMvcjIzNzl0TGln?=
 =?utf-8?B?aHdRd3piUVlNNFlKeENiQzU0WVdnRmFGVktDRlZnTVdjYlZ5RVQzMzYxeXRy?=
 =?utf-8?B?bk9rZEtrZm8vRkRYeDc2VmpYcmcyWHNPTlkzR2JtSXhPdzFmaGh2V0xRRXY1?=
 =?utf-8?B?SUVrNFNWNlVhQlp3VWdZSmRHM1RqUHhCMzh3TjFXRFQxTisydXJNeC9SWlox?=
 =?utf-8?B?SHpkaWM5T2ZUNjF1KzdvcE5hTVlyMkM4RGFTUTFEdEt4L0hPUDZnZU9WOVhB?=
 =?utf-8?B?KzlNK09QeUFaY0c2d0E5UDBLZ2gwTDlhY1lsZHlQeGpNZ0JTWkNRYWlyZWx5?=
 =?utf-8?B?Y1dlUWpHdmNPRTdXaUNJSGMzSmY4NXZNdk9lTnJnejZFMFRqM0FaSHFpUjl4?=
 =?utf-8?B?N1FGczhrclNhOXBabVluMTJmTEZOVVJzeEhFcndiNHltaUY4T1NTeGJxc2Zi?=
 =?utf-8?B?MnNpSXJ1MTZUMTZ3ckMzNy9zU2tBaG5qMWtrZjd1OGxiOEVVbmFGVHh4U0Fq?=
 =?utf-8?B?dUpvQmIzNDhScXBaVjFhZXNBdWlkTExZRzZaRG11QTZjalo4bVBnU0ZCR3NL?=
 =?utf-8?B?YitzU2xKSmlkb2QzVDA3dmF4bTg4L1QvbHNrQkxqaTlMS3I4ZFA5ZXB4ZGRk?=
 =?utf-8?B?Q0V6aTUyc0UrVzZ6dWh5VHZkT3RGUnovQTRaOGxCOUdaS05CdkhUbWpEMko4?=
 =?utf-8?B?YUtjSTNtM0FaMzdUYlVaZXRqYVpxWXJHd3pIY0YxczBHVW9mcUZQYnJmMnQ5?=
 =?utf-8?B?aHFDbUZLOHkzLzFGYVZ6Q0JQSXNza010NkduaENFRXR5aDJoYWtCMjhYYi9M?=
 =?utf-8?B?K2dnYktTdGZLM0xlN3ErZWhRQWxlZlZiWEliOVUvYk92OG9uRVEvY2wwWHJk?=
 =?utf-8?B?UDFmb25JdEVNU3F2TDIvcTNSbjZaamlmS0lkOW9SV1RaK0NJOWQ2VFNDN3Nn?=
 =?utf-8?B?cHZwZHppV01SeDB1cmpCZlFUM1M3TmFwL1R5NVF1bWNkczQ4N2dtVkdObEQ3?=
 =?utf-8?B?WFhjT1RycXdwZDBPVUE3aENsbGhxQnlIaW5JTTd6dVg2MU5oYU01NDIva2Nn?=
 =?utf-8?B?dEtSZ1JqQjhtMXRvcXBzR2ZMa1ZYL1NuVm1BSlFjTDJxZjlJL0pKQ2FLMDly?=
 =?utf-8?B?ZE9Manc1TC96WnJXbEVtK1VvaG56ajNUaWN5aGVJSVRxajFBSkNDdXMxRHlB?=
 =?utf-8?B?TWNSV24xeno0NzVkWEZOSnNLNXF4Z2xQV2hvRUVHcUhUODg5akJ4S045NnhE?=
 =?utf-8?B?aDZBR3J4aXpCbnRvSDdsaFU2L2hqRTJZWU43ZTdXcnlZNHZiUytEVklpT3Ix?=
 =?utf-8?B?eE15RkNIa1NYOXJOOThPSG5RN2ZGQlVQbmE2VXkyU3hwbG5WM3EwRENnY2lu?=
 =?utf-8?B?NXpOVSt5K1VPbUlBWVVRVksxZndyNXJFWEE1ZzMwQVVZbDZISXN2dE1TaDhy?=
 =?utf-8?B?cFM5dUxtOVpxVDJZMzA4WEE5RXE4SXhJcEF5bXpwbTV6YVYrNHZVWCsxRU9o?=
 =?utf-8?B?Z1M3Y1BHQ1luWm5VOVR2RkpYWUlZaE9PRWh6Z2Q2cC9oSkFhb0krbVRRdit2?=
 =?utf-8?B?aGRJcERTTDVvZXRBcHg1WFFsMjZESWFrak0xbURqSlpjcmxnd0JBWmRtR3Q3?=
 =?utf-8?B?YjJxTFUrSDVKSUp0U2haMS8vZE5mcWN6cW92TWNpd053Zmc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NjBoSHNxSnJhRGhPV0FSWElraXl2c3poQ29OdE5kV3JERXFNRm12dmRxclls?=
 =?utf-8?B?K290RFBleDBsRGYxa0ZGcmJ2b1pxa0lYRkZJSmFGU01vVUtjUmlIQzA4eEQy?=
 =?utf-8?B?TnAxTGx2eTNnYXV4Rmx2QnpLZDhJQ1E3Z041bVdHUnFJaUtsenc2MlJLMEpN?=
 =?utf-8?B?MTh1WHZudXRvOUdXMW5tVk1zOFdYQmlVZmtVVmxwdThwNEdOSXNxQVc5eGFx?=
 =?utf-8?B?QUhVa0pjWVhvNlduSGdOOE42cEwvY1lzOVZhTlUzNk9OV3Q2UnRYWlhWbVkr?=
 =?utf-8?B?UVFqNk5LQjRHMGVZeXQzL21BTnNRRk45NkFDcGVtT2xsZjVYeFBHUmpERU95?=
 =?utf-8?B?TGs2N0p2WlJEV0dRSjNaVUpXTHBvaUIySlhTaHVuVjlUOUNIaVlxRENtTmRR?=
 =?utf-8?B?Y2ZJQVNFejhwRDR3NUtDcldUbkdWZ2tTUlBaZXYzOVFGckJvY3VWSkZDSldV?=
 =?utf-8?B?TjlIUENITVYxb2k2OWlFR1phQ1drMDBDdHNtWmxkck1lWmthbS9IOGpzNE5n?=
 =?utf-8?B?Rk1uT0hMWUdmelluWUM4V1FmNURSMDdxOVhiRnc1RVpJcVZNdzdRK2VjSEZH?=
 =?utf-8?B?RjgzQzZRRkphRjV1cGp0SnpQZDFDZGhnSW14ZTRVdjNBRjhHNitYUDhqcTlL?=
 =?utf-8?B?TTNmRkdhZzRBcVJMSVdGZHIwVk5QdWJEbDFWWHA5bmlYaTJwcU9jb2F0RkdF?=
 =?utf-8?B?L1lkQ2tybGErSTVrQ3pPcEF0emdDaHFWeWlJT3RVYWRXNmFaV2h3TXZjMjFj?=
 =?utf-8?B?Qm5FU0s4V2U2SHN5T3NpWTRpckZOZlR5M1VDU2QvVGRkMkhaZVdic05XdUVl?=
 =?utf-8?B?NVNnYVhuV1pkYWlEMm92ZHY5UFpibk1OdnFQRDNjSmJGdmhEN2haaVkyV2Q0?=
 =?utf-8?B?YVBGeVZiNVU0cnAwS2R6U2Ewd0ZqRFpMNTdnb1R1dldocWx3MmgraUU3b1J2?=
 =?utf-8?B?L0cvdU5LN3hjK2tLbE5rZGlOVTBpSVV4Tml6ejJITTRrVmF5S0hZckhjQjBy?=
 =?utf-8?B?ZDdmdDgzM0pydFo5WmFMVXdBRDh5V0hlR25nS29lUDJGZERhSy9uUFhZQUlV?=
 =?utf-8?B?SkQ1T0VaUlJHcng2eDU0Q0pVamxaNmV3WXcxMUVvN0R1aS9Ib21tKzJHSkx5?=
 =?utf-8?B?S2JaTVRiSFNtYnpIYWRaRUJuM0pzOHBHMUhKOXdoSXk2WWVhNXFHajBWc0tO?=
 =?utf-8?B?WG5YYkhKbEQ5UmFlQnlqOU9ick9qeVNyMThtN2I3cFBEQTRWMW9FQmVhMHpJ?=
 =?utf-8?B?LzhZZFlmczRvVHliUjNJcDQwelVkLzFtclBIT0Fqb0k5QWJFSWgxeG1qWDN5?=
 =?utf-8?B?MGdYbmcvTWpHeFUvREFTZHRYOHVMei91a1dZcGd2eTV1WlEwMHlqbGRiVWxK?=
 =?utf-8?B?d1lTSWUySVNTNjRGK095Y1dHbjlzU0ZKUHpqaTRDbW94L3Rsd2lkMTJHVk51?=
 =?utf-8?B?eWZNNExUbyswNHlaM1JwM1R1UTBGS3d6V1B6L2pRaWNkS3ppKzBXQzB3b0Iw?=
 =?utf-8?B?K01naGZBKzV2TWl6UjludUtoRjFkL3prRy9GMnQ3Z1NKYVlseXU3VG1QVGdi?=
 =?utf-8?B?RmJYclp0SktTTDNtdnp1RWpxZERaRHVrMVFETjNSY29oTUFiMnErVCtnMjdh?=
 =?utf-8?B?WlgrUkNDZEkvYWtPNllqVFRzWkx0WW1Kd1dPR3I1b2YyNXJzaW84WjJ4M0ts?=
 =?utf-8?B?cDFWa3pJY2lYQTFXem5MUk1EYWZIS1J3ejZ6cGE4Tk9KcHdyV1FLSW9qYWJD?=
 =?utf-8?B?cXN1RjNIMUR2elRrbllOLzV0MWNCaDByTHlsNHVwQUREcDVVQkk3czBxZmpH?=
 =?utf-8?B?eHY1UFIxVXV0dnZXeU5UYU5SOS9nY2JXRzZXTnowU2kyQ3VQMS9Eek1BRlZa?=
 =?utf-8?B?ZkU2Z3F2QmxoUDZzdkQ3VlBtMW5wVjg0QmRyMzFqcnF4Mm9CVDlqK0VaOHdX?=
 =?utf-8?B?NTBqK1NHWlM2d2VRZEdqOER2ejRoUmhlZW5YZ3BTakRKN2VJc09DUlo1WkVs?=
 =?utf-8?B?TmxuL29yTmZ0RHN5dGkzaGNOY1VPdExucmcwZUxSSFNHeEErQmdkYkZKM2RO?=
 =?utf-8?B?UkJrMzhNenJuUmh1UlpOeFQ3SXlGcGcwbk1zWFpqQXVlWXo4endBYzVhU1Vo?=
 =?utf-8?Q?6/BE86KDZoYabrdt+tsRwJ87q?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e67d6552-8ff2-4485-1871-08ddc03e449d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2025 05:46:23.1793 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lsQkumMPHmW+2R64FUBwb1oUYzGKG6AGHQgVyaJo0ce8H4BY0BgM1XAB91KwTYoVqmD8AQ5hE/WGMzyMKsZ5Pg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7548
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

Hi Umesh

On 7/11/2025 6:06 AM, Umesh Nerlige Ramappa wrote:
> On Wed, Jul 09, 2025 at 04:50:20PM +0530, Riana Tauro wrote:
>> Add support to handle CSC firmware reported errors. When CSC firmware
>> errors are encoutered, a error interrupt is received by the GFX device as
>> a MSI interrupt.
>>
>> Device Source control registers indicates the source of the error as CSC
>> The HEC error status register indicates that the error is firmware 
>> reported
>> Depending on the type of error, the error cause is written to the HEC
>> Firmware error register.
>>
>> On encountering such CSC firmware errors, the graphics device is
>> non-recoverable from driver context. The only way to recover from these
>> errors is firmware flash. The device is then wedged and userspace is
>> notified with a drm uevent
>>
>> v2: use vendor recovery method with
>>    runtime survivability (Christian, Rodrigo, Raag)
>>
>> v3: move declare wedged to runtime survivability mode (Rodrigo)
>>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>> drivers/gpu/drm/xe/regs/xe_gsc_regs.h      |  2 +
>> drivers/gpu/drm/xe/regs/xe_hw_error_regs.h |  7 ++-
>> drivers/gpu/drm/xe/xe_device_types.h       |  3 +
>> drivers/gpu/drm/xe/xe_hw_error.c           | 68 +++++++++++++++++++++-
>> 4 files changed, 78 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/regs/xe_gsc_regs.h b/drivers/gpu/drm/ 
>> xe/regs/xe_gsc_regs.h
>> index 9b66cc972a63..180be82672ab 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_gsc_regs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_gsc_regs.h
>> @@ -13,6 +13,8 @@
>>
>> /* Definitions of GSC H/W registers, bits, etc */
>>
>> +#define BMG_GSC_HECI1_BASE    0x373000
>> +
>> #define MTL_GSC_HECI1_BASE    0x00116000
>> #define MTL_GSC_HECI2_BASE    0x00117000
>>
>> diff --git a/drivers/gpu/drm/xe/regs/xe_hw_error_regs.h b/drivers/gpu/ 
>> drm/xe/regs/xe_hw_error_regs.h
>> index ed9b81fb28a0..c146b9ef44eb 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_hw_error_regs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_hw_error_regs.h
>> @@ -6,10 +6,15 @@
>> #ifndef _XE_HW_ERROR_REGS_H_
>> #define _XE_HW_ERROR_REGS_H_
>>
>> +#define HEC_UNCORR_ERR_STATUS(base)                    XE_REG((base) 
>> + 0x118)
>> +#define    UNCORR_FW_REPORTED_ERR                      BIT(6)
>> +
>> +#define HEC_UNCORR_FW_ERR_DW0(base)                    XE_REG((base) 
>> + 0x124)
>> +
>> #define DEV_ERR_STAT_NONFATAL            0x100178
>> #define DEV_ERR_STAT_CORRECTABLE        0x10017c
>> #define DEV_ERR_STAT_REG(x)            XE_REG(_PICK_EVEN((x), \
>>                                   DEV_ERR_STAT_CORRECTABLE, \
>>                                   DEV_ERR_STAT_NONFATAL))
>> -
>> +#define   XE_CSC_ERROR                BIT(17)
>> #endif
>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/ 
>> xe/xe_device_types.h
>> index ca300338e8c2..283d5c88758e 100644
>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>> @@ -241,6 +241,9 @@ struct xe_tile {
>>     /** @memirq: Memory Based Interrupts. */
>>     struct xe_memirq memirq;
>>
>> +    /** @csc_hw_error_work: worker to report CSC HW errors */
>> +    struct work_struct csc_hw_error_work;
>> +
>>     /** @pcode: tile's PCODE */
>>     struct {
>>         /** @pcode.lock: protecting tile's PCODE mailbox data */
>> diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/ 
>> xe_hw_error.c
>> index 0f2590839900..7cc9b8a7fa1a 100644
>> --- a/drivers/gpu/drm/xe/xe_hw_error.c
>> +++ b/drivers/gpu/drm/xe/xe_hw_error.c
>> @@ -3,12 +3,16 @@
>>  * Copyright © 2025 Intel Corporation
>>  */
>>
>> +#include "regs/xe_gsc_regs.h"
>> #include "regs/xe_hw_error_regs.h"
>> #include "regs/xe_irq_regs.h"
>>
>> #include "xe_device.h"
>> #include "xe_hw_error.h"
>> #include "xe_mmio.h"
>> +#include "xe_survivability_mode.h"
>> +
>> +#define  HEC_UNCORR_FW_ERR_BITS 4
>>
>> /* Error categories reported by hardware */
>> enum hardware_error {
>> @@ -18,6 +22,13 @@ enum hardware_error {
>>     HARDWARE_ERROR_MAX,
>> };
>>
>> +static const char * const hec_uncorrected_fw_errors[] = {
>> +    "Fatal",
>> +    "CSE Disabled",
>> +    "FD Corruption",
>> +    "Data Corruption"
>> +};
>> +
>> static const char *hw_error_to_str(const enum hardware_error hw_err)
>> {
>>     switch (hw_err) {
>> @@ -32,6 +43,56 @@ static const char *hw_error_to_str(const enum 
>> hardware_error hw_err)
>>     }
>> }
>>
>> +static void csc_hw_error_work(struct work_struct *work)
>> +{
>> +    struct xe_tile *tile = container_of(work, typeof(*tile), 
>> csc_hw_error_work);
>> +    struct xe_device *xe = tile_to_xe(tile);
>> +    int ret;
>> +
>> +    ret = xe_survivability_mode_runtime_enable(xe);
> 
> xe_survivability_mode_runtime_enable() returns if it's not BMG, not dgfx 
> etc., so does it make sense to not even queue the work if those 
> conditions are not met?

CSC work is only scheduled for BMG in the below handler.
The bit is not present in prior platforms
> 
>> +    if (ret)
>> +        drm_err(&xe->drm, "Failed to enable runtime survivability 
>> mode\n");
>> +}
>> +
>> +static void csc_hw_error_handler(struct xe_tile *tile, const enum 
>> hardware_error hw_err)
>> +{
>> +    const char *hw_err_str = hw_error_to_str(hw_err);
>> +    struct xe_device *xe = tile_to_xe(tile);
>> +    struct xe_mmio *mmio = &tile->mmio;
>> +    u32 base, err_bit, err_src;
>> +    unsigned long fw_err;
>> +
>> +    if (xe->info.platform != XE_BATTLEMAGE)
>> +        return;
>> +
>> +    /* Not supported in BMG */
>> +    if (hw_err == HARDWARE_ERROR_CORRECTABLE)
>> +        return;
>> +
>> +    base = BMG_GSC_HECI1_BASE;
>> +    lockdep_assert_held(&xe->irq.lock);
>> +    err_src = xe_mmio_read32(mmio, HEC_UNCORR_ERR_STATUS(base));
>> +    if (!err_src) {
>> +        drm_err_ratelimited(&xe->drm, HW_ERR "Tile%d reported 
>> HEC_ERR_STATUS_%s blank\n",
>> +                    tile->id, hw_err_str);
>> +        return;
>> +    }
>> +
>> +    if (err_src & UNCORR_FW_REPORTED_ERR) {
>> +        fw_err = xe_mmio_read32(mmio, HEC_UNCORR_FW_ERR_DW0(base));
>> +        for_each_set_bit(err_bit, &fw_err, HEC_UNCORR_FW_ERR_BITS) {
>> +            drm_err_ratelimited(&xe->drm, HW_ERR
>> +                        "%s: HEC Uncorrected FW %s error reported, 
>> bit[%d] is set\n",
>> +                         hw_err_str, hec_uncorrected_fw_errors[err_bit],
>> +                         err_bit);
>> +
>> +            schedule_work(&tile->csc_hw_error_work);
>> +        }
>> +    }
>> +
>> +    xe_mmio_write32(mmio, HEC_UNCORR_ERR_STATUS(base), err_src);
>> +}
>> +
>> static void hw_error_source_handler(struct xe_tile *tile, const enum 
>> hardware_error hw_err)
>> {
>>     const char *hw_err_str = hw_error_to_str(hw_err);
>> @@ -50,7 +111,8 @@ static void hw_error_source_handler(struct xe_tile 
>> *tile, const enum hardware_er
>>         goto unlock;
>>     }
>>
>> -    /* TODO: Process errrors per source */
>> +    if (err_src & XE_CSC_ERROR)
>> +        csc_hw_error_handler(tile, hw_err);
>>
>>     xe_mmio_write32(&tile->mmio, DEV_ERR_STAT_REG(hw_err), err_src);
>>
>> @@ -101,8 +163,12 @@ static void process_hw_errors(struct xe_device *xe)
>>  */
>> void xe_hw_error_init(struct xe_device *xe)
>> {
>> +    struct xe_tile *tile = xe_device_get_root_tile(xe);
>> +
>>     if (!IS_DGFX(xe) || IS_SRIOV_VF(xe))
>>         return;
>>
>> +    INIT_WORK(&tile->csc_hw_error_work, csc_hw_error_work);
> 
> Same here, why have a worker if it's not BMG?
> 
> Also, reiterating a previous comment in another patch - if the feature 
> can be defined as a has_ struct member in the pci/gt info that could 
> streamline the checks.

This is only initialization. The queueing is done in the handler.
If it is supported from a particular platform then it seems unnecessary.
Should i add a function instead?

Thanks,
Riana

> 
> Thanks,
> Umesh
> 
>> +
>>     process_hw_errors(xe);
>> }
>> -- 
>> 2.47.1
>>


