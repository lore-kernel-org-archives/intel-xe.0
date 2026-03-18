Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0230810775E6
	for <intel-xe@archiver.kernel.org>; Wed, 18 Mar 2026 16:19:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3DEC10E00B;
	Wed, 18 Mar 2026 16:19:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IHK6wNI9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C120E10E00B
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Mar 2026 16:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773850772; x=1805386772;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=nF/4NqgcZ7KTI7dVuJODARL3nrTMzwob9LRCNL4YCJs=;
 b=IHK6wNI9HWzso5Xu2apviTA8KNKdjFBy3sfZiHxtCtKzmeTr+8D1B3kv
 me+eEWsM2okNqprhIInUKSD4DTH2cY5BbSuzkh7jKx6jwhqhj7ti6ymCA
 8v3PlQ9OSOUws+M71VnbVaYThfyvSj8hLalp6JI4kGLvPcGKKVEYa5NXI
 dINgkuMtP96AbYVb5lbPnmJYEjEUbRRm4xxxZleEy/Q5uFNWfqVxLhIDI
 B/MpGGb/lEya0UY4x8p8M7DOQ9yIuClUwI+I0lO73IHqjEonfoRYUmCLK
 2kVsYvYQo7y6U8GsUDBRwbxO6raeU30/esJw+88AokdIr4AKnKshtsDAZ Q==;
X-CSE-ConnectionGUID: 77a6thygTSq0QRHMJXnfyw==
X-CSE-MsgGUID: 1VPGEtYlRXqNwm6+JSLN7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="74987870"
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; d="scan'208";a="74987870"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2026 09:19:32 -0700
X-CSE-ConnectionGUID: Z6DkFqAOQNOtrnQYBawASA==
X-CSE-MsgGUID: lJxWDDK6SKKAH8RusdTuwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; d="scan'208";a="227367512"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2026 09:19:31 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 18 Mar 2026 09:19:30 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 18 Mar 2026 09:19:30 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.46) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 18 Mar 2026 09:19:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aIs81yPnzvmI+MfpiVweugKj4jDh/lCfraOkjDmGh0ereTADVRolmMTQ5YkkaRMZ5RHl1FxCgFOtsaippb0j93J6GtuptIh7IuMx0LwQO/kaZ0M5fUqGLOnEUvYN012lZnNuZYghNvpMKUNOW0Su/peTCbmP/RIwKsJkx8hZWnsZ0DzcCuWrLHuv6hmZu3YqEtCF2UtxYwgWtP9nHHqEPOBG0/cPriGOJLY+R9NN3QeLeZtNMuM6Jzz5vqdvcVkUBV7pv43GCdV+UK8f0a2wFTYd5pm7jPz7JTCh5x+ym4wBUVIPGz6TNV4buT2dFIyDL1KZUWPmtplg0P/NFs8qkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3L+M+gu5Y2xLHS7yXHMKc/s/Trb/LZo29csxTW1WAWs=;
 b=ekz/PKFLm7w7V3AQTdMDZ61z2N0MGFP4Ew49bi+NJFcjiKuTD/ak64Z+ogLLj7n+6ainYnuFkrFqc3vh/W3aSfIOpvN2S1wYAVoMgX/buLPH5eAN9GLsN7pjiV2GWk84oSbBU6OOdyvhqulkMF9swP6vi8a3B1zOsN7HQIAzfd7dUKT2zekhLW/wuBcZlmLvScLGKdD9F3hUez92xs4RVSZ5/wXexA5SNnns471bM4oaXy5XEGusDW1m7cCi0u0UjPQN7FDZ5g0/PyI3eWwDpcJZpdv6Wvk0LF2l1eqmBNhfI9ubhsVkKvIqlKbGBMMCX+l6wJcBAHkr5ALKkh9F3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by IA0PR11MB7752.namprd11.prod.outlook.com (2603:10b6:208:442::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Wed, 18 Mar
 2026 16:19:28 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057%3]) with mapi id 15.20.9723.014; Wed, 18 Mar 2026
 16:19:28 +0000
Date: Wed, 18 Mar 2026 21:49:19 +0530
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: "Anoop, Vijay" <anoop.c.vijay@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <badal.nilawar@intel.com>,
 <rodrigo.vivi@intel.com>, <aravind.iddamsetty@intel.com>,
 <riana.tauro@intel.com>, <anshuman.gupta@intel.com>,
 <matthew.d.roper@intel.com>, <michael.j.ruhl@intel.com>,
 <paul.e.luse@intel.com>, <mohamed.mansoor.v@intel.com>, <kam.nasim@intel.com>
Subject: Re: [PATCH v10 1/7] drm/xe/xe_sysctrl: Add System Controller types
 and device integration
Message-ID: <abrQh7xFVqy1pYPe@soc-5CG1426VCC.clients.intel.com>
References: <20260313143303.2441609-9-anoop.c.vijay@intel.com>
 <20260313143303.2441609-10-anoop.c.vijay@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260313143303.2441609-10-anoop.c.vijay@intel.com>
X-ClientProxiedBy: BY5PR16CA0006.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::19) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|IA0PR11MB7752:EE_
X-MS-Office365-Filtering-Correlation-Id: 34ee4ef0-ef21-4145-3f38-08de850a2081
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|18002099003|56012099003|22082099003; 
X-Microsoft-Antispam-Message-Info: 7lyf9y/EuntTjxR1AVBNXvGJf5Fx9vFcxs6vmu5GddH5u+fZ406qfaHONjVxvqrqHVKNvB0xcH/qcCNV/uYnuRG2uLWfSTAA9exu51x7tjK13gt1pROBXZUMTfLAk42nvKvyhx1sPUyZQQjpVxph3EIWrTnzWsAyYIntzzMEfKm1p8PANBqw982sQ+oBRGAmTJ5PVveUTSkbavI4knoGFlh5dznbcbjFNcV+uBHIh+Mre8x5ZnA/B/t+QddHu09UxXLmIXsMqVJ3X6W/sc0Qa1+3w/ly7pDpPm7nbDBRt2zKSo2inBXzWyojhBqyyws9XecK9vMj/Ea0WL1XZJpw1nVZSkVkx5AydNPv43ixjL0HPXgym3UMwSQINliw2+IKeFQtMh7znTOhOnuu3X9gZYrmw2Qjr+Iz2ki0TJMhRIc3qbwlUpcG0O15kY7eWfY2cqVbcgwf6l54j/zqQhxweueWvyqbAksOS+y7NT382ptVZ0WvyVgZqVbW7dqVJ/Ven1fBbHzYKv8gJp2SOzTUYFbjF3hwxnqOCl8mNbsPju615cXYalNb/OS/kwFFClVY7OlJdK3/RRfh63+d6HJL5tPreJBYSBl9qzYbYEZxGIMZDTIbbqBpakdE0cGb+Mg12WZfirNdxHVL89pCliV7pIL2QZ0+PuBKU/veg/wrSrd7cWE+etx4JTXrkXvLNMBhvIR2GN6X0s5ktJgBAIWX4szI/O1ZoA3XA3Ek6XSTi0c=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(18002099003)(56012099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a1pwZm1FRVJ1T3lneW45dFczNUJFTURXcW00cW9kQ1pBVFlMY0pQT1FMTmpT?=
 =?utf-8?B?YnpBS2dkWno1eVpnMzEwTWNsYlpjRVZ0dGVKVnljWjRtbVJRTjdkU3loRFlh?=
 =?utf-8?B?MjhEQ01vbzhReGNIWmh2MWl5Q09lN3ZodlY3U3FEREhGYVFRNVBWMUNkTXN2?=
 =?utf-8?B?bGZyQ2U0TGp1aGswNUZHdU5JeGxpVmxWV0FTYnZEQURBYnRnOTFuWmNERFIz?=
 =?utf-8?B?R29jclh0V2djQ1dLUE1teFVzNVVhY2ZnbDBmeVhzaFRiZ09XRk8vUzcxZHRJ?=
 =?utf-8?B?NjFhaWVYV0oyYWpoVE1nUGl5Q1VPOWRYRmdBejVCSmo0Y3dBRzNYaGpxWjRV?=
 =?utf-8?B?NC9DOW05QUhIcUN0RitveGFxR0ZsK1Rhd3U0V0NkYlhtZC8xSVgwajYzOGtx?=
 =?utf-8?B?VU1ISFV6aG9zbnNvRkFVQVB6TWUrSG9BUHdreDJQZGNYL0h1cUlnQmtzejJm?=
 =?utf-8?B?MzNGOUJ1OTIzZ01meE0rNFVBY2Y4b000ZTFOS2hGZ1I0K3M2ZDErdStPcS9p?=
 =?utf-8?B?eVBuTU8vcnlPQW9sY2RmYzQzOUF5Zi9qMUlVUEEvLzNFRHI3RjFyOXU2K0d6?=
 =?utf-8?B?S1pxK1hxSzBrZE1wUFpKNTUyemQvcWVVZ1dDYmh6MlMwbDN1UWtjcndLc3Yv?=
 =?utf-8?B?Z0hwYWx4NE9RK2w5RW9MNWNuZ0JSWWFISkRCVDJIaHplYWllWmNJQWZtQVRT?=
 =?utf-8?B?NkMvRkhJajlvT0M0cWVYdHo3REtGS0xwMHRwUDBBZm1ra1FFUmRpOFlSL0Jh?=
 =?utf-8?B?Q0R1b3dob0l3MWthTE1NK0VmNGVERlRlTDNGMTB1eUxnM01ITGY4UG9jSGFl?=
 =?utf-8?B?eWNHMW1qTFU3ejhKMnJEMU05aERaVC9NNHRTYUU4NFBLWUpKY1pjY2lYMGFz?=
 =?utf-8?B?MXJwZWY2ZGw2cndjd2VXVkZTdGJ1VXpmVUxrNStiaTlGQmwzSmZtNVdXclFC?=
 =?utf-8?B?dGcrUUszdG1pbUtQS29vb0lHM2NnSXV6U1VXNlY4MEc5bjZPSWVoZ0ZGenh5?=
 =?utf-8?B?K0hVeHFqZC81VHJSK2xMTk1LNndVTmx5emY2QlBxSUs5cUVkUStDMGdIU3VR?=
 =?utf-8?B?VldZTHA0TGhPK0J0cXRkdG9iTERNVTZWY3M3RVZJZ294TVluTlgvK2FDdG42?=
 =?utf-8?B?K3UzUFhXcWFVTHBac25iZmRDM2NQOEVMd1lsek5YZVhDbGI0ekg3c0wvcEJE?=
 =?utf-8?B?THFIQ1M5WXRaaEJCZXVmTHJNM0RIdm9sL1lnRnBxVlBnUjFDb0MvUGxVNVo4?=
 =?utf-8?B?QUZ2T2IrODllVVVEcmtUb1pYRU9UL3N5c01VWFYwaU5KM3N6TUFKbXB5eDFS?=
 =?utf-8?B?NFR3WkIwUzFRaWtBR3gwSzVlSXJrY2xQdEczV2NQWnFONFhzVUhjUW5SbDE1?=
 =?utf-8?B?YjNwQnZNUFVTZHNPZGhrL054QjBlNmZMRlp0UFZ4NkdKaFdSWWtqSTEwdzhq?=
 =?utf-8?B?cVFoUVNsV0FlSHRsaVdra1dTendxZzVVTG9FYU5ycEVYSDBVaUltUllLd3U3?=
 =?utf-8?B?cFRzVkQ2QnoxaTZZZzd6QmNNWU81clRzMktVeHhtY2hLVnl2NFhOb3Fqc00r?=
 =?utf-8?B?WVVXYndCeTJLWEVZN0Z0c2xpSHRBOGY3ZWtrTExhcW1sdGJ4TjkrSzBaODB4?=
 =?utf-8?B?VktMUitvdVZRRW1Jb1c4L3pqRjhUQTZJaHp5b2ovdHpFR3RWWS92cGZRem5X?=
 =?utf-8?B?YUlJb0xmdzFzd3F6dWZQa1VqbTJER28rdzl1VWt5c0hHdHNqcTNOYkx6UTlw?=
 =?utf-8?B?QTFXRVIyVUVLWS9HU1hmL1FNRHI4ZXBYQWVORVh0NWdPdlFkaXpqRi94MFF4?=
 =?utf-8?B?M3N2OG1QMzJKc2FMY0hySmV2bFFOZ1dQWVlKNDFvZVJtbFVheVlWTGpydUV1?=
 =?utf-8?B?NHJxMHp6VUFGS1Vpa0dFQ3RqRzF0MzJJeUhGa2s1cVBXK2xFOUpGOHJJUXR4?=
 =?utf-8?B?Wm1DZ1BWWEV4WVQxeWdnbEJhWTVGN29ma0VBczVOdzNQR0tDY3ZiRXdub0Z4?=
 =?utf-8?B?QUxPY1NBNUVjaVFFT0FraUtCTkNEc3F6ZlpwU056Y2lHOGcxejB1UnZqaXIz?=
 =?utf-8?B?TmpyUWwwSTYxaFJDNmJOSXEvemJJSjNjWDJBQjNUNGhIQU52dTIrM2M3MU9z?=
 =?utf-8?B?aU5ZY09TdHQyTGUzZFNwb1J3TWM2QnVBMkk2VERFTyt1WnZHTU5kWEVwdGpv?=
 =?utf-8?B?QkxFMUY1NWRSaGRxR0Ntc0NuUVRwM1lFVTEyZENIV1JTVVpKQXdvelVGUjl5?=
 =?utf-8?B?TFBZM2xEZEdrTElVYndIU2cxOW9TYnRXRU0xTnhHT0ZrbEx6UjE5MGVHY1Jz?=
 =?utf-8?B?THROZllteG1obm1OUFErUVJqQjRHOXczTURINVVHOGV0RndURkE0bWtnSkpO?=
 =?utf-8?Q?92MKy683qZT2eVd875wrgzPw5ClA0fqF88Azg?=
X-Exchange-RoutingPolicyChecked: LoSsIthepzZGP78pk/+ypM4xp2vEOfyCtvHBPs9qI7nOiZmH5TN80vpTi0e+mbffCYRnEcn/5k2DMYTgEmB/4wB8Mx7A2mx3vgcQ52E2IkYMuu8D5TJX3Ln2xCWoKN8Qrj2Vj/eyemTE2KoG4oQwXJT7HSFClXKk8VH/WQlWkMw/9G5n251940ACfghQy7TmocGzuEqCnwPJWuErXUOlv8IP0IQJWkE2yaMJBDtSwX9iDgy6X2wOd2q09+TghB9Fzg34H8ogF1eDeg1fTBdk2rIQbQiWpW/FcKkIxeN6hr2qsu1AR0zbnEpW+XQeLid0a0aP+JvawlPsbQBIO4pwuQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 34ee4ef0-ef21-4145-3f38-08de850a2081
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2026 16:19:27.9163 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: omnkD1OI6SILCWOFYSXWImphDsuv/eQlF3Fc3F/6ezgeppOGH5d83mK5qpSHEK8wTS422KLubAigx7so6oZPDVrLSAU6FjaQqy8fksMVcUo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7752
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

On Fri, Mar 13, 2026 at 07:33:04AM -0700, Anoop, Vijay wrote:
>From: Anoop Vijay <anoop.c.vijay@intel.com>
>
>Add foundational type definitions for System Controller (sysctrl) support
>and integrate them into the xe_device structure. Introduce a capability
>flag in device descriptor and runtime information to record sysctrl
>presence on supported platforms.
>
>System Controller is a separate firmware-managed entity responsible for
>selected platform-level control and coordination tasks on Intel Xe3p
>discrete GPU platforms. The driver communicates with it via a mailbox
>interface for delegated operations.
>
>This commit introduces core data structures required for sysctrl support,
>including MMIO region definitions, a command mutex, and state tracking
>required for mailbox communication.
>
>No functional changes. This patch provides preparatory infrastructure
>for System Controller support.

IMO, this ^ sentence can be dropped.

With that this is

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

>
> Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>
>
>Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>
>---
>v4: (Matt, Mike)
>- Add domain-specific MMIO accessor
>- Change phase_bit type from u32 to bool
>
>v6: (Matt)
>- Add mailbox protocol constants
>
>v8: (Matt, Michal)
>- Reordered patches for logical flow
>
>v9: (Matt)
>- Extended commit message to explain System Controller and purpose of
>  `has_sysctrl` flag
>---
> drivers/gpu/drm/xe/xe_device_types.h  |  6 +++++
> drivers/gpu/drm/xe/xe_pci_types.h     |  1 +
> drivers/gpu/drm/xe/xe_sysctrl_types.h | 32 +++++++++++++++++++++++++++
> 3 files changed, 39 insertions(+)
> create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_types.h
>
>diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>index 615218d775b1..150c76b2acaf 100644
>--- a/drivers/gpu/drm/xe/xe_device_types.h
>+++ b/drivers/gpu/drm/xe/xe_device_types.h
>@@ -27,6 +27,7 @@
> #include "xe_sriov_vf_ccs_types.h"
> #include "xe_step_types.h"
> #include "xe_survivability_mode_types.h"
>+#include "xe_sysctrl_types.h"
> #include "xe_tile_types.h"
> #include "xe_validation.h"
>
>@@ -196,6 +197,8 @@ struct xe_device {
> 		u8 has_soc_remapper_telem:1;
> 		/** @info.has_sriov: Supports SR-IOV */
> 		u8 has_sriov:1;
>+		/** @info.has_sysctrl: Supports System Controller */
>+		u8 has_sysctrl:1;
> 		/** @info.has_usm: Device has unified shared memory support */
> 		u8 has_usm:1;
> 		/** @info.has_64bit_timestamp: Device supports 64-bit timestamps */
>@@ -508,6 +511,9 @@ struct xe_device {
> 	/** @i2c: I2C host controller */
> 	struct xe_i2c *i2c;
>
>+	/** @sc: System Controller */
>+	struct xe_sysctrl sc;
>+
> 	/** @atomic_svm_timeslice_ms: Atomic SVM fault timeslice MS */
> 	u32 atomic_svm_timeslice_ms;
>
>diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
>index 8eee4fb1c57c..08386c5eca27 100644
>--- a/drivers/gpu/drm/xe/xe_pci_types.h
>+++ b/drivers/gpu/drm/xe/xe_pci_types.h
>@@ -57,6 +57,7 @@ struct xe_device_desc {
> 	u8 has_soc_remapper_sysctrl:1;
> 	u8 has_soc_remapper_telem:1;
> 	u8 has_sriov:1;
>+	u8 has_sysctrl:1;
> 	u8 needs_scratch:1;
> 	u8 skip_guc_pc:1;
> 	u8 skip_mtcfg:1;
>diff --git a/drivers/gpu/drm/xe/xe_sysctrl_types.h b/drivers/gpu/drm/xe/xe_sysctrl_types.h
>new file mode 100644
>index 000000000000..8217f6befe70
>--- /dev/null
>+++ b/drivers/gpu/drm/xe/xe_sysctrl_types.h
>@@ -0,0 +1,32 @@
>+/* SPDX-License-Identifier: MIT */
>+/*
>+ * Copyright © 2026 Intel Corporation
>+ */
>+
>+#ifndef _XE_SYSCTRL_TYPES_H_
>+#define _XE_SYSCTRL_TYPES_H_
>+
>+#include <linux/mutex.h>
>+#include <linux/types.h>
>+
>+struct xe_mmio;
>+
>+/**
>+ * struct xe_sysctrl - System Controller driver context
>+ *
>+ * This structure maintains the runtime state for System Controller
>+ * communication. All fields are initialized during xe_sysctrl_init()
>+ * and protected appropriately for concurrent access.
>+ */
>+struct xe_sysctrl {
>+	/** @mmio: MMIO region for system control registers */
>+	struct xe_mmio *mmio;
>+
>+	/** @cmd_lock: Mutex protecting mailbox command operations */
>+	struct mutex cmd_lock;
>+
>+	/** @phase_bit: Message boundary phase toggle bit (0 or 1) */
>+	bool phase_bit;
>+};
>+
>+#endif
>-- 
>2.43.0
>
