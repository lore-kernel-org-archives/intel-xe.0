Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CF97C5AD69
	for <intel-xe@archiver.kernel.org>; Fri, 20 Feb 2026 20:12:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FFAC10E839;
	Fri, 20 Feb 2026 20:12:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JpqohlJA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5894C10E839
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Feb 2026 20:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771618359; x=1803154359;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Ke3x+CSr4nB8JvSvqg4JfASb1peXj1iB7XDAiW4OZSw=;
 b=JpqohlJALIM5NAzht5Eh1XivoiNjC/XdCnzddbNez510USMHv3NFkK3w
 UpJAck/UueuGk15uEcZ6S9EIK96shV4ULfm1+lVQ3aUzVYem/BXhMkX1V
 Kz2Q1mvtrGu+lxO4J5U+SVHBVRxEPJghWIkvit0DeP8zr9KJwGJOrKWj6
 NlidYTAL4KPh6wQZTeUrF2NXjWiHo72vrbts8cZoYmIWCqJpn2YYu8KoS
 hY/CwGOlQ3uRkKPdcteuG5tZ5Ew8cjutlLGfKzCrYnDVjc64g8FSJKh6q
 Yms0XqrEZx5T/7gi+m3niY/pVWwfX74TVfhcXkzMig7zdosebCvl3BWge Q==;
X-CSE-ConnectionGUID: WK/GYBjhRDyjFInsUbwsqA==
X-CSE-MsgGUID: tUMAF2wCT8ODY61D5xbeeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11707"; a="71922114"
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="71922114"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 12:12:39 -0800
X-CSE-ConnectionGUID: anBFo/MhTOePFgTz43XiFA==
X-CSE-MsgGUID: 4NRVIDXMSce45IMr6o9RGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="213030882"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 12:12:39 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 20 Feb 2026 12:12:38 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Fri, 20 Feb 2026 12:12:38 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.35) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 20 Feb 2026 12:12:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tKDXMB0trkYYtKYSn29mRsExdC5aYZPLF9MxhmDztbsAyv6IzRpXd5Z8hP3w5PEAvQSEa4CWWhJ0ZfdKcksHY3kzcTtcY09dvZtjQalRf6xp9eeTdfXIrh4Rom2jgVx914KOqW9SQZBzNtR4xFIMeRTjIa4U5vgeE4T9nWkP0dLeENEdIjUGfRXVAW9Oh95+PXC86WPmmaAYSiuWxCb1TezXKeMGGCDnASXYdnH0zbQh5I3SH4diB6h6ghlpkmJMF7y58aXgfGy95+uXr14/kQvlUl1i0VTZcMvgLqnoPiH1Y2snOQ+O1mII31taJ8mawgRyuhVs4n5qOXZsmsePSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X9oC0Em4XKMd+GMUpOwQi5+Vf/rNJaAcWD/NGNGorqI=;
 b=mCIhS3XU6qL8rYqH8sDW6FMlvUAc3mJYtQZq7gnn0/ZDZiZsFZlfV+xp84s38bq87IOchZByLQk6cJUwkxpnrtIkIdLZnkP2jNl7gekTnkeIq8cDNeaZfjn2EG1d/1U6AX8k6aab0ppdQfjnqh9JwKdmD4sxT2cG4cLxxQfP4mR15nWejOqtR2pVihOcp/KpR+fxtEarsTLDVnri8RLCvc6njM1lcvdMxp9PyUUibmHdOAI6u1E4Z2wjv9FnkRThmoeCQHO4cxU3StgapfpMtK8O/Ye9nYwYtqwHYIgBZsbCMqpddNmXFvyk6TwKOJ6xCi7q+ps9ZP5QAw/o4YgY7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ0PR11MB6575.namprd11.prod.outlook.com (2603:10b6:a03:477::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Fri, 20 Feb
 2026 20:12:34 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%6]) with mapi id 15.20.9632.015; Fri, 20 Feb 2026
 20:12:34 +0000
Date: Fri, 20 Feb 2026 12:12:32 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Arvind Yadav <arvind.yadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>,
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [RFC 3/7] drm/xe/svm: Clear CPU_AUTORESET_ACTIVE on first GPU
 fault
Message-ID: <aZjAMO2aGh8cHbYg@lstrano-desk.jf.intel.com>
References: <20260219091312.796749-1-arvind.yadav@intel.com>
 <20260219091312.796749-4-arvind.yadav@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260219091312.796749-4-arvind.yadav@intel.com>
X-ClientProxiedBy: SJ0PR13CA0164.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::19) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ0PR11MB6575:EE_
X-MS-Office365-Filtering-Correlation-Id: 32856ae0-3261-4faa-6646-08de70bc62a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bCsvVzhHVTdWYWlQdUY3d0l4WDhuTE85cDVZOXVjbEZhdWh6bzRYWWFzanZP?=
 =?utf-8?B?N2xEYlBKS3J5YlYzOWh4YnlpK1JjbVk0ckVadDN4eE4yemNpYmd5bkl4d1JJ?=
 =?utf-8?B?VEs3VVZRZHR4R1NvOW02UGJ3bjJRY0tKbXlnMkZtL0JibWxST3ptd2pKdDZt?=
 =?utf-8?B?THBrbDVtQ0hDdXpxN0d0cHhNcDM3Mms5QWpVQlNjbVNzRlJxeUcrcENsU04z?=
 =?utf-8?B?SXJaMldDYUd4WDdBcXB6TGl3L0grK3dmaVRxTzBHQ09PZDZGRG1DQkxQejFR?=
 =?utf-8?B?NHZvMkcwU0MyK3g1VVVRV3paMDVEOFVrZEwrb3pGa1hYeVlYRnloSVNBZm1P?=
 =?utf-8?B?SHc1NlQ3M2NVQlp0RkY4bExYYXVIUnpwZXFTdG1LOWxJcHVScFdJMGN4M1VL?=
 =?utf-8?B?eWdsNXhqVEQ0RWZQRElVV0ZKT0pYd2V1bzF4N1hhTHhrM0FKSTZKcFpIM1FX?=
 =?utf-8?B?V0huSGxzWXhCSzdIK2xqVWV2RDJGZEhqTnFSSVZ1NkdhOTQ1ZTR0U1dRVVZU?=
 =?utf-8?B?RnV4eFpDZmw2by9UQkRUcWVGMHVBaVNFUWgwNG91Y0hFSjhFM2U1TEpZeVNi?=
 =?utf-8?B?UEN1ZVdlSDVzMFBJR3pWT1RWQ3NmQzdqMTBvYkkrWnBFSTRUWk9oUjBxL05s?=
 =?utf-8?B?UmhBWWNJTHBZSDMxVWZGd1JseHhGcWJOajhsM1ZrRjNReW0rM042c0pyUXZP?=
 =?utf-8?B?NEFzK2JoZWo0Qk9wSnd0THFVVVZ0cEtVMUhGSGxDY29RUG9yQVU2dklUNlQv?=
 =?utf-8?B?aDdwZmlFWUFFeTFoL2E1QTdnS1B4c3QydHFhdVRWczZOSmd4NnEvWVFqc01B?=
 =?utf-8?B?eG5tejNGeTBOQU8yMUtTUVprU3gyWlpDTm9oSUVMZW10TG4vRWptZXdBYUQ2?=
 =?utf-8?B?VVZvbnE4bmpqbkhOcWM3ZVQ1ZkhHeXdHWWhBYUJ3dDNSM29SdUNpdWVwYXdK?=
 =?utf-8?B?VTEvZnM1WW1uMXVuNm16OWxzNEd2MXliaHRPYTU5QThGSUhYNXRXVmVIZmJS?=
 =?utf-8?B?dXRxeWREZkxEejlaTWVWendrSDMrVCs1WCt6cG1ISlZOSTdpVFB1L3RTNHhU?=
 =?utf-8?B?SkYvT21kdnU3OFRwM3dKYzNWSXo1WUtEdE92MS9EZ0F4OHVXTWNGUi9tQThD?=
 =?utf-8?B?OGhQTFVWRzJUMXRCelJVdVM0eGovN1hNOXBRTzdpTzBlNTRXSXdrMUNlMlJ2?=
 =?utf-8?B?NVNFNm5laVAyNE9XeFd4V29hSzFpRUNuMkVNM2QvL0RNbnkySmRWWEJYR2R0?=
 =?utf-8?B?d1RSVFluNWVtOWMwVmk5TTl5Q3o5ekJ0QlZ4QzA5Y091WkIyNWhEclQwbWRD?=
 =?utf-8?B?NTc5ZFdZMmZTRU03SXJXSjdTakdIQnVuN0doeWxLTDBqbFluNFUraExSa2lI?=
 =?utf-8?B?eUU5SnYzaDdsQWRBeUl2YVQ4dE96VlpzRjNaTHNESHlKR1hJaTVmN0N5cWti?=
 =?utf-8?B?SUo4clRsbURzRXlmQlpWOE9yZDZwSStBUkU0U0hNWkF4T3poYmtucGlRVml0?=
 =?utf-8?B?NXBpQzdHblhwTFlHc2ZKelFYQ0pzS3VxQVoxRmxJTXBYYk1qSzR3ZFJUOUJx?=
 =?utf-8?B?UXNkR1ZOcEFxS1JMQlJpSWRRaThBOW9SYnRZbm1pSU9rNkUycjFyc1VmVVlS?=
 =?utf-8?B?dkd4OTZHNHMxZG9YeW95VC9QTjBvcEdWd1c1TkFOZzRXYUxyTWZvOVR4SUJx?=
 =?utf-8?B?eVR4MkRRNDhxd3RtZnd2K0IyWXB5UEtwcWpPOVdodHJJaHp4ekN6cHQ4MENE?=
 =?utf-8?B?SnNOeXF4ajdNVHhRTWFncjk2SXJCbXNaTW43NnRiSkQxb2JZcUsrVDVQdTVy?=
 =?utf-8?B?MHphR1V4YXl5RjNDa0hDVGgwWTh2SXlUMDY4YUVvTlFCT1dkd2pjU3VlR3Yv?=
 =?utf-8?B?cnd5c21RMGdXSEhPcDlmNmdEYTFVSStpZFJTV0ZKVUlwM1JNbVY0d2EwTURE?=
 =?utf-8?B?OGZndlJ4RFFSVWJyakRVMDlMbFA0bXZ5ZVh5QnVXa0pYSzVwVWtqT1FVdDNl?=
 =?utf-8?B?WWJiL1BrallFblh5WU1iSTVGK1dMbmh5VGduN3gzbkJUeENpT0ZLeVZBZDFW?=
 =?utf-8?Q?8seTjv?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MGxhY1RiYkpIRzM1TTNUNmNXS0t2T1kzZm41cmJkVDl4VlpTQUZwUUx2U0Ux?=
 =?utf-8?B?cXZOdHM2Ri82c1kxaWtqbW1yUUVZZ0VUTEZBM0w0NGVJQ3hXRXBicEludnVU?=
 =?utf-8?B?c1VjZ0hkS3djZUtXaGY4cWVyR3k1V3VReUsrQTl2OUhhRlVDenlqY2cyekRv?=
 =?utf-8?B?WEdkRVQzZ3d3dTBnWGhMMWRoaEFlUmgwWll2NHcyRWg4Q0w2Ymg4VDUzY01x?=
 =?utf-8?B?eDQ1TXV0dzBaUnNLbW9lbHNNTHhNQzVHenJjbUxwR2VBUmVWMnhoMHdhWTV1?=
 =?utf-8?B?SWhvTjc0M3JkTXhFQXBPeVBNT1huMGhIdkt3ZlpGVU9rWFp0L2h5ME1QRzFT?=
 =?utf-8?B?dkpSeTNISVA3K3ZUMGRFdUxvZDVCZmYxRVNJcG5sVXZjWERKMHRsY0k4Smdq?=
 =?utf-8?B?TE85blFKTWp4VkpjUHYwYU1COXB2WmhncmIrSytRUWVvOXZPTDEwSEVXUDBQ?=
 =?utf-8?B?M280N3dUQ1hDRnRJOENSZVE0NFpFZ0tSM21qcDNISm5CZGZJWnZ0U3hFN3RQ?=
 =?utf-8?B?cWhxQ0pZaHFVa28zKy9LeGJFYUFtR0RvYmY4bCsrRExUTU1TdUJWZWdKK2pr?=
 =?utf-8?B?cUw3ZExVZE9EZVp1NmY3UVhNT1NpN3YyUHRZdkR5eGVpejFTOEJDeEdLcGdR?=
 =?utf-8?B?S2lxVUV0T2FJK2ltcEYrdEk5YXR5UlVKODc4cnBDRWc3TkNpZkVCV2NWbVVH?=
 =?utf-8?B?V0VZWDRuQkFVaXBNMWlHanBNRU1iS0xFek9WRzMzbm1qaWF2bnJIWjVqdFBJ?=
 =?utf-8?B?QmlvRUtQQjFsM0xOR0dPanlObHhpZEJQQkc2VmlVSTlOVjN1NnFXdGhidVo3?=
 =?utf-8?B?SUlBdStHUjc5SEhEeVJXTVNKWEp5MjNJN3RNSmV3c095aUlGK3h1WjJvS254?=
 =?utf-8?B?aXNRK1VWMGs2ZmcrTmhsUXo5dTNESEFYdUVDVzN6NVdsNjk5Ni92ZW12MFdx?=
 =?utf-8?B?Y2NzNTVLRjlzQ0lJM2RZSHZmTFRYUldRd3orSGI4cVM1MGlCKzQwaUVoM0Rm?=
 =?utf-8?B?UGMwaWl5eTAvOHNrcThHWGhuRlY5Vi8yaUJ3QmRzaWgwc0o1WXA2Z2dXV09S?=
 =?utf-8?B?cW83MWNwNXdsZm5peHFJOUwvRUhsMVptdE9NeUxuK3NpQklnNy9ZRDBPL25Y?=
 =?utf-8?B?VFd5OXpTYWE3eEVFYyt2cXM5QmJUeHdnc202S1JTOWNRWkVhVmhhaFlCd01x?=
 =?utf-8?B?L3ZoSUtzSVRvZTR0MHQ0aXg5eVJkeUN5TWlWQjY3SmNPa3REdms2L3JLenlT?=
 =?utf-8?B?NWJrMThLbDRidUNqRm5aOTdtOUs5eWlxUG96cVhlU3Z2aThVR2NNZGxQMGVt?=
 =?utf-8?B?d2IwVE1LSFA1cEZpU0VFenkySVNEaFNXUGpMWFhJTTNWRERaVjFjemVnNXBB?=
 =?utf-8?B?QVR5NWF4Wm0rWWhFbXFmT08yYmQyS0RjN3E0RkFNdUJhVUFOaXljeTdVdjJU?=
 =?utf-8?B?OHFwaDFmVk5RSW0zcjZDUUJTQ2ZqRGtrdHY3eXpuR0JVOE9BN1hVKy9lVnRh?=
 =?utf-8?B?NGl1Y05XT3FwbjNheW9yaTcvWlhBbXlwRnZ6aXVpQ1JhZkxJSW91bjM5QlNH?=
 =?utf-8?B?WEJFVmxrMk5tNWtmVHhnclB3QitMNWxFODNKY0M2OFlKWTZkVW5RYVVoWHg0?=
 =?utf-8?B?K0x3TC91ZnowWks4L2VtZFUwbElWRFpyNXc1V1gvSUtYOEN1eEFzMkRtdnhM?=
 =?utf-8?B?R0RkNGludVh2RkxQd3hkRytmcjV5anBsN0NCMDRJK20vbnp3TCtiZkd2U0k5?=
 =?utf-8?B?MjNQUnlPTDBuTXF2UFhsdTgxYmJTTGZNMUtmNW5iL3RPdE85QW5ZcGtURHEx?=
 =?utf-8?B?eEVzckxySFdqK3NuVGlWeUZQK3BTL3ZJMkxQcU5BQkFBZzZIcldyL1RQUkZI?=
 =?utf-8?B?Yk9GTGdvWTN4aGx3cGhYalRRL3JEK3NUeUhmUmhaUk9zNlB4UndxQUd6L1h4?=
 =?utf-8?B?cUt0WUpCM1FnaDdYbTFuNlRGOWVYUWJkdHZ1dGp3WUxPQnczOFRybm9IWXN1?=
 =?utf-8?B?YTBvVFdRTERTR3BESzdOaFNaR3ZEdkpKRWY4VjlvZkFTbVJxSGRRcUI2bHFw?=
 =?utf-8?B?YXp2THBMb0w1dW96eGoyTlJxcUFFOGJvZnNRSEdyNjVIT3lQY250d0crSUtu?=
 =?utf-8?B?c2kxeDVITitZOUtZaWVCTmJxUndGR01KWDhwVGpGeE5YZXlUNG11QlgxNzdV?=
 =?utf-8?B?aXdkclArdEVZT0FyK3FCZnRSalQvY0RxeXFrUWZ1blhkVXMyRE1BcTloOElj?=
 =?utf-8?B?bmJzUVgvVFE0ckdFcEk1ZEtoc1pyc2ZaNlhaL3FyU1dwWFczQmxFUkt3TUhQ?=
 =?utf-8?B?MGZlVWlNQUd4QzhlYUZ6RnRFQVd1a2wzOGphNnpXaEZJQWZ5amhXWHVPZ2xt?=
 =?utf-8?Q?b3mZ6/EzabkFn6Ow=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 32856ae0-3261-4faa-6646-08de70bc62a0
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2026 20:12:34.5570 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u8ap7lXZ9ES9MxJIyC25kFFedBmwdJFglcvWiKKyY34T7BpgYu5xCqlr61mNNy3sM3BVTpaTl/WXK/dALmp3ow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6575
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

On Thu, Feb 19, 2026 at 02:43:08PM +0530, Arvind Yadav wrote:
> Clear XE_VMA_CPU_AUTORESET_ACTIVE before installing GPU PTEs for CPU
> address mirror VMAs.
> 
> This marks the one-way transition from CPU-only to GPU-touched so munmap
> handling can switch from the MADVISE autoreset notifier to the existing
> SVM notifier.
> 
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_svm.c | 10 ++++++++++
>  drivers/gpu/drm/xe/xe_vm.h  | 11 +++++++++++
>  2 files changed, 21 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index cda3bf7e2418..b9dbbb245779 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -1209,6 +1209,9 @@ static int __xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>  	lockdep_assert_held_write(&vm->lock);
>  	xe_assert(vm->xe, xe_vma_is_cpu_addr_mirror(vma));
>  
> +	/* Invariant: CPU_AUTORESET_ACTIVE cleared before reaching here. */
> +	WARN_ON_ONCE(xe_vma_has_cpu_autoreset_active(vma));
> +
>  	xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_PAGEFAULT_COUNT, 1);
>  
>  retry:
> @@ -1360,6 +1363,13 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>  			    bool atomic)
>  {
>  	int need_vram, ret;
> +
> +	lockdep_assert_held_write(&vm->lock);
> +
> +	/* Transition CPU-only -> GPU-touched before installing PTEs. */
> +	if (xe_vma_has_cpu_autoreset_active(vma))
> +		xe_vma_gpu_touch(vma);

I don’t think this will work going forward. I plan on making the fault
handler run under vm->lock in read mode [1], and VMA state will only be
allowed to be modified under the lockdep constraints in [2], which are
vm->lock in write mode or vm->lock in read mode plus the garbage
collector lock. Maybe this is fine for now, and we can rework it once
[1] and [2] land—most likely by taking the garbage collector mutex
introduced in [1] before touching this VMA’s flags.

Another issue is what happens if we don’t want to taint the VMA unless
we actually fault in a range. It is valid to not find a range to fault
in if this is a prefetch, as that fault just gets suppressed on the
device. So at a minimum, this needs to be moved to where the function
returns zero (i.e., by the out label).

[1] https://gitlab.freedesktop.org/mbrost/xe-kernel-driver-svn-perf-6-15-2025/-/commit/08fa2b95800583e804a91caf477f9c30b3440a33#33e7d2d9323cd529c8d587d9d3801e353439d783_181_179
[2] https://gitlab.freedesktop.org/mbrost/xe-kernel-driver-svn-perf-6-15-2025/-/commit/08fa2b95800583e804a91caf477f9c30b3440a33#71bf077daec46f3ebd785235e8ecc786681aff99_1112_1128


> +
>  retry:
>  	need_vram = xe_vma_need_vram_for_atomic(vm->xe, vma, atomic);
>  	if (need_vram < 0)
> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> index 7bf400f068ce..3dc549550c91 100644
> --- a/drivers/gpu/drm/xe/xe_vm.h
> +++ b/drivers/gpu/drm/xe/xe_vm.h
> @@ -423,4 +423,15 @@ static inline struct drm_exec *xe_vm_validation_exec(struct xe_vm *vm)
>  	((READ_ONCE(tile_present) & ~READ_ONCE(tile_invalidated)) & BIT((tile)->id))
>  
>  void xe_vma_mem_attr_copy(struct xe_vma_mem_attr *to, struct xe_vma_mem_attr *from);
> +
> +/**
> + * xe_vma_gpu_touch() - Mark VMA as GPU-touched
> + * @vma: VMA to mark
> + *
> + * Clear XE_VMA_CPU_AUTORESET_ACTIVE. Must be done before first GPU PTE install.
> + */
> +static inline void xe_vma_gpu_touch(struct xe_vma *vma)
> +{
> +	vma->gpuva.flags &= ~XE_VMA_CPU_AUTORESET_ACTIVE;

Thinking out loud — not strictly related to your series, but I think we
should route all accesses to vma->gpuva.flags through helpers with
lockdep annotations to prove we aren’t violating the rules I mentioned
above (right now this would just require vm->lock in write mode).

Perhaps when I post [1] and [2], I can clean all of that up, or if you
want to transition all access to vma->gpuva.flags to helpers (e.g.,
xe_vma_write_flags(vma, mask), xe_vma_read_flags(vma, mask),
xe_vma_clear_flags(vma, mask)), I wouldn’t complain.

Matt

> +}
>  #endif
> -- 
> 2.43.0
> 
