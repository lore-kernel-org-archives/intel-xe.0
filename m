Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 058B6E7717F
	for <intel-xe@archiver.kernel.org>; Fri, 13 Dec 2024 20:46:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0F3610E104;
	Fri, 13 Dec 2024 20:46:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lEb6TyET";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3550810E104
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Dec 2024 20:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734122792; x=1765658792;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=fN3uq3OoNtRrrMXneOCAOmi0StnMCxbdcb8ugjmxDYo=;
 b=lEb6TyETZLi74poXdqvmlx7WElRg7EE2i3azkLHjy7VfYuEt8uO485Vx
 r2dKmOE1imfdl+16eSoDiA5kZBYO8A7mr9WJFLqWj9mwUcYAzhmmPbNlm
 iv4OJNWL750uT4Yc4CnbBnf790RLbG81bavrcme6jLDxyWGihK0A7LH7Y
 9arSOlhY4SOXOaCBmUJHoC54FbWHL3r2Rh/Oq3FnYO62Oamw+4thjEfxQ
 PdW7atcoRkB0rD2jTlQj2HACYTSnybJNvyFZYYSISCcpNTW8SNG3DIGDx
 l9sBAiARy2IWcVcB0CZ8RpN5B1NQXULgsVqsH4rHz1bzOoGPEpkMJ+7Tx A==;
X-CSE-ConnectionGUID: uUI8hQleRviKfDI2IqTVpg==
X-CSE-MsgGUID: uABUgx9LSEemtagJCbYxGA==
X-IronPort-AV: E=McAfee;i="6700,10204,11285"; a="45277828"
X-IronPort-AV: E=Sophos;i="6.12,232,1728975600"; d="scan'208";a="45277828"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2024 12:46:32 -0800
X-CSE-ConnectionGUID: uVx7pm6OQD2+W60HOW1PEw==
X-CSE-MsgGUID: eayan5b8TNe1tiPG7TxZMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,232,1728975600"; d="scan'208";a="96386998"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Dec 2024 12:46:30 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 13 Dec 2024 12:46:30 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 13 Dec 2024 12:46:30 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.49) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 13 Dec 2024 12:46:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JtJ33TFsJqebQD1TR2AjJkL1ANFIq65p2K8JiYZ0gQEycN6gMGXSxc16KrPDOasLkpsnDXRfrX1Wk7eKV+9FeZNk8JjIXTixfv6UviagiZlA75edeED/mKwUtPoF+MXhcmXf+UiWNu+Y2oMnQg8BYh/F7PR6lnmjBaPJk4wCSgwpL0sXDGuISprcAVGjeeRkFQk19fr8+mGkdqgwjiqRZ8eDJr9tY/Q40ZKnOdImoB21Xe7/yEQ8u4t1BK4kSxWmER145q5ycDX3UB5IfGutD5mhhilrtQKPEo7wx1gOFQSx+bHY6XauyAJlCkWozHhpg2aGV/SyAatyASWSfRkpaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fN3uq3OoNtRrrMXneOCAOmi0StnMCxbdcb8ugjmxDYo=;
 b=i40wKAjb5CUH6Hj7g8VIB90yqFrI/ZkJ75D+dWH1mVs/EJUDliU2FbCHJh5ZLGHucfSPjxMb0mJgCqZuz0kEGKso7MWxe4HBZ+qWfXZfNIkCxuFYGmplk4KqVq0zOdFSbNEigKIekq1hxjrdMQPHdKFMF1+fP4r0jQiFNgkzdwKgKbmzeVCOO22U9cFPBvi6TEo0AnjkKRuhdVHTmZmGRUiyHn9FkGUmK3f3uyFd9MhHVw/WG3BSkYDXjejRFJMTxbtlGCMNnFAKExx8KxwGuBBxPTU9w+RU2UCWGpPkAoHP6kBchyG7QWY8wsDK5cRugSYUU/kRDkuQM6lvrQYH3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by PH0PR11MB4997.namprd11.prod.outlook.com (2603:10b6:510:31::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.18; Fri, 13 Dec
 2024 20:46:28 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f5c2:eb59:d98c:e8ba]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f5c2:eb59:d98c:e8ba%7]) with mapi id 15.20.8251.015; Fri, 13 Dec 2024
 20:46:27 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "Harrison, John C" <john.c.harrison@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Vivi, 
 Rodrigo" <rodrigo.vivi@intel.com>, "Filipchuk, Julia"
 <julia.filipchuk@intel.com>, "thomas.hellstrom@linux.intel.com"
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH] Revert "drm/xe/devcoredump: Add ASCII85 dump helper
 function"
Thread-Topic: [PATCH] Revert "drm/xe/devcoredump: Add ASCII85 dump helper
 function"
Thread-Index: AQHbTWkcZhgIo/ttdkKNQ0lly9C4rLLkPnMAgAAI5oCAAAQoAIAABxGAgAAK0ICAAAWGgIAAAjQAgAAIA4CAAAOsgIAAItEAgAAMH4CAAAWYAA==
Date: Fri, 13 Dec 2024 20:46:27 +0000
Message-ID: <47321445a4ae95b0987f63ecb166f33da3db854c.camel@intel.com>
References: <20241213141252.1488109-1-rodrigo.vivi@intel.com>
 <t6j573cbepbjwiclv5ulewcapwqyf7np4bvdut6gjario6wmeq@sk3cxg6mnos7>
 <a49a74a0b2ac363691f26dddde60aae60461ccbb.camel@intel.com>
 <7cd068ff3630f40e31cd4d971ad794986b017ab5.camel@intel.com>
 <26263eveox7cc3dqfqezodcunjamqgd7wrotzwmbci2o2ia42v@kkc3kpaizsef>
 <11116b4e7978ad7b5dc91d25c1d0232c809912c6.camel@intel.com>
 <w6zmdulew6aqkrkmjme7bdjp6jkllhswpazppd3t5gqnpysg4j@alphmd6gcxcr>
 <74c5a108-c5aa-49e3-b841-ff7ca838fae0@intel.com>
 <29a8ead7e28a72f7d9498d1701932836d7c14981.camel@intel.com>
 <1b38e47f-15a7-4267-8b3d-0ffa9219710e@intel.com>
 <ed2b683f31dbb98521336b6f79029fc3b3718a21.camel@intel.com>
 <b42313d5-d6bf-4457-9557-37e4e8e096be@intel.com>
In-Reply-To: <b42313d5-d6bf-4457-9557-37e4e8e096be@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|PH0PR11MB4997:EE_
x-ms-office365-filtering-correlation-id: 429822d0-090e-4fac-878b-08dd1bb73762
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?NGg3SnNKV3ltYUR1QnN1OWFCSEp5N3l6QytEL0MweCs2azBnUTN4Z01aTnIx?=
 =?utf-8?B?S2o2UVhhcXpCVmdqdHlGMUpLTjRxdTJ3SUNJWHgxNlBiTVp5Q1NLYjBTWm40?=
 =?utf-8?B?WXl3TFRNMEEvWUg4WTNMRStndjQ5WkxOUWFwR3hhSmdWbHRURGE2QU85dXg5?=
 =?utf-8?B?ekludmdhd0E1YldxaFBHTTZ1cDl6clVvcUZrVUI4UDVvbFNVekVGZjlTQ1Bl?=
 =?utf-8?B?a2dYbVJCS0xRV3NaVFhPcXNFaE11Ly9ubFNuSi9uTlZORy9rUjZDM0VEWHZX?=
 =?utf-8?B?MmFZQ3p1VWJVSjdKY1kvQzVLK2twQXJZeGpvcnFyUklPcXNINFdGWHhHNURU?=
 =?utf-8?B?UnI2UmJkMW1tNkNUeU9OS0c3MlhuKzQ3MnJ1eXhDRE44aUVrSTMzeUkvMUhI?=
 =?utf-8?B?VXB3TVo2VE1aenlWMmFDdmZaLy9UVlRtckNHbWNzYVFEckk0Ui85N1NlSlFp?=
 =?utf-8?B?YkdZQjZ0dlpZMXFzcFFlK0tndXBjdmVpR1FhWmhhM2pCWFZGVjU2R3JMdzhW?=
 =?utf-8?B?MnFKeGgzRy9sejdvdERKY0dZL0VHdkEyZHRaQURBSGxvVlZucXhuQlZ5SFZk?=
 =?utf-8?B?RE92UElLVmgxbUZ5M3ZZYVQ5T0JPalgrYTNObEh0aVF0akFzZzFJcmZZY1Qw?=
 =?utf-8?B?S2dEb0tBbEVmVDZYTGdkeFJIdmxpZC9UM3VsWGN6bnIyMEpDbmZxMnZhUXkx?=
 =?utf-8?B?b0tCSDM5WmJvS3BMbUVzVm5hWVBWcUM1TkdGK25ybjdZc004TkYrQ0tySGRL?=
 =?utf-8?B?SnlEWGwrNVZCTDcvSlJ4UUtSZmpBZG9wTy9LaUZiZ2MvcHM0eDQzek9iVUUx?=
 =?utf-8?B?UEtEbVp2SGNudVJWRlA3aDV2bmpDZW1tV1ZjVUtMR1VWWWhTdG9rRlpId0Rs?=
 =?utf-8?B?cEYxVmdLbUpXQVArdENuWE1hQjFFZkwweWNIdno5R21DejNVeFErdWp2WmI4?=
 =?utf-8?B?RjV4VmhXK1pwYVRpRC83VUgwSkt2cDk5SUF5bm1xOXIxemdZOHlHcTNVVWxx?=
 =?utf-8?B?VEtRZDRTRWVNQUxCQ1Z2Zm1IQThPZUFjU3lWMWllQmdFNmxXQkhRbGxpVHVQ?=
 =?utf-8?B?TXRUVW4yUGxKZ2svOW9IN2dDbTVRTVd3VzF0NTFvZHcxSXdBOHJ6ZGtUWEN5?=
 =?utf-8?B?VFNIVWhPd3pWY3Z2bDRGelpUL1BLQkJKK2Rnc0VMNlg3bmtKcEllVzJ1Y1Na?=
 =?utf-8?B?WmdzbWtmZzFhR2pDYUthS3A1WS9xeXNJMGpON2p6UTJiUGtjY2dQNG95NFNl?=
 =?utf-8?B?MiswTktsV1pCcUt5NXdTN05BOW4xQjh3K05nZDJHaFRMWmRsOEtKMVBHbkMv?=
 =?utf-8?B?blFMQVNSeWhXWUlXQnY2TzdkR2YwenFqWFptZUtRVUhsOGxmdE9vbEpEYW1D?=
 =?utf-8?B?aGg4cDUvL0sydDFDTWRlazFseDAvUEdmemEwd2tRMUxiVUZBTDBWdXVXWmdG?=
 =?utf-8?B?S3dBdy9ZN0VVaElPc05USUZub0F3cm8xaGlOTzV3d2wzOHpjLy9OLy9rOGRG?=
 =?utf-8?B?ZkxNeHVaTmdwUEFvOEJmTEVkY28yQkdra0dRM3ZZYWlVWFlXQkdqb1NXWDhQ?=
 =?utf-8?B?RTYvelk1eC9HYnRNbS96YkNTakpLVVJSUnhGb3JacWlXYndvOWU2aXZtc0FN?=
 =?utf-8?B?R24wb2pqTlYrdzRqZUp5TUVubGpXWUdUZjlpc2gvMW5YcFUydDJVeFlKb0kr?=
 =?utf-8?B?Q1BHb1NnRmJtYUlWc1dIRkhpak82VElPUzFzMzQ0cis4QU9xbmMrWWV1Um9Q?=
 =?utf-8?B?RmJVUmVhYjhwd0pPanJLU2FSZDdrQ252VmlwTU1nRHlFZUFCRjZTRWhMeTN3?=
 =?utf-8?B?a1Q0a3JobXNrVXdDUEszODdGaXJXRmRhNGQwVjlESGVqWUZKNU5FTVZhTnFo?=
 =?utf-8?B?RDUrTk9SRk82d3J2d1JyaTB4NG5qRFFYYm4zZTMzOVFtVVE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?c3lub21kbmlTMGtDUE9lNHVub1RaYk9USWorOFovb3NQZWE3eGJIbGNTUXlG?=
 =?utf-8?B?VXVPcWFTZDRIOXBlYjVTVy9hK0xHUGFGQ1RmRGNuN3FRbndna28xNnBLWmJF?=
 =?utf-8?B?QXIzT0k0VmtlblRqd3JOZnlJVys3dW13QnR2M0UvaUJTYU9rWkl1Mmg0U1Jz?=
 =?utf-8?B?dFJ6cnVCa241b0pIM2FrS1FOMWp5WVNxUTBKNnZSVkdIZGp2dCt2UVcyb1c3?=
 =?utf-8?B?dEo2STc1YVkzZkRGcXczUmw2b3VkOHAyT3ZYUnVVODh5Q1hab1dLeFllektv?=
 =?utf-8?B?RWJna3VxYjdMbzhoVCtidGwzM2Rha0pJcXNKSFpLekVHb2hXVlQ2bmhPOVVR?=
 =?utf-8?B?cUs2K2lnUmFpa0NZV0E1NVN5dGREeE1Na0VWZUU4Ny9RdnYzdUxwRDFNUVlZ?=
 =?utf-8?B?SzlESVYzNXhFTFJUaEZET0g5Y0ZnbElxNDNDdkRibE5lRWM4WUhSRnVXM2xw?=
 =?utf-8?B?MmpsNDZxckU4b3kxVXFXOTVCMS8zZjZMZ1lmN3NGZ3hGK054RFZKTWQ3M2I2?=
 =?utf-8?B?akdzSUE4VnlNV1MzN0hTemZkZ0FIL3NRak03UE1UaUNYTHZ4N3A2VEJobHFE?=
 =?utf-8?B?MzlOOEVtVkgyMXVIc1JEOEdSNnc2MnFFaXFqSjhFZ3lOeXdPblQ4T1FSVDY4?=
 =?utf-8?B?YlowSVNtWW12TktFWXN5U0ZWV2lwcXB0Q3JtUXRMZktobXJ4VDZWclhZOVcx?=
 =?utf-8?B?VGNxM0hOKzBxMUFzdWVDQkJMNEFvbFhqcldmM1ZLMzI0cnNpZG9xeUFXaDBy?=
 =?utf-8?B?U2ROd1F3Qjg5RUd3MEtTc3dqMGs5cy9STDFHYTFLdk8rSmtnY2FPS2dReXlu?=
 =?utf-8?B?ZXkxZ21KbzlCUTRQbG9JbTRCQXJ2ckgwbnVpNTB5SkRVaEQ1RXFnZVFTYzBx?=
 =?utf-8?B?cnFGeUJ3ckJuMURpY0lJbzMvMFhENXR6TFBndHg1N2VNNU9uSnFHV2I0ODM2?=
 =?utf-8?B?SGpFRWc0T3NRS3U2eXgrcTRjWnAxVjJYdjg3WFJhaFZqelVNaEdHdlFJSzJ0?=
 =?utf-8?B?a0lURURKV0U1b2FEZDFJQ3BQODFDMDRQZUR4RUpvL0pLd0kyMy9uU3U0aU5v?=
 =?utf-8?B?NDhaa3Z5RVBEU1VNYndoaHkrZlcxajlva0xaV2pqS01XemdWdVpTMDNKUnlm?=
 =?utf-8?B?YjdNdC9BU0ZMSFhoVXRPdVJFUzZqNmszMi9iRXhSMEc4NTVUUVZ2b0NUZlBs?=
 =?utf-8?B?b0g1R2t0REYzRy9CYkVTaFBXN3pQa3JTdi9EYkcwZTM3T1BMYTlCOCsxTHlW?=
 =?utf-8?B?WStkaEpQY3VWOVI0c2d0WEJnajdDMnRBdlRZM2ZPLysvU2Zrd016MVZMWTNJ?=
 =?utf-8?B?Tlg1bXh5WVhIQzhVQ0V2OCt0Zyt6Q2pOZW8wM0ZLMlpJNHE4VFA5UCtSSkRX?=
 =?utf-8?B?emZPdldxWUdMWm9URnpUNjVuUGJlQm92dkZvQXN0cUpucUdrd3hFQ2IzdjRI?=
 =?utf-8?B?aCt5ZGlKQVZZR0kvM1VmbStjWVZrbVNwZFlIUDNUQzV1RGcxZDZPWjJTRUxl?=
 =?utf-8?B?bU4wT043bDhycng2TXhha3ZndDVMM1dwY2VIZmlvNVVRN01ETFliSUxycFIw?=
 =?utf-8?B?N3BESDhqV3N4cEVTbDVRbE5ydDd4aXNYeG5PbytPQWVxREtiR1JnQStocWJt?=
 =?utf-8?B?azJOdWt1RlpibG9KVncxZmZOeUlyZ29HQXpqU0M4MlFMWDJ6cHQ4bjhpK0Y2?=
 =?utf-8?B?c3p4S29icU5uY081QXRXcFpYbkwvejNXVmg4VExVY2dqei9NSllCaG96OXlr?=
 =?utf-8?B?UmxGS3FuNEtpdkFyS2hsY2xyMldZcFMxZ3dKYUZRN3VmckU2S29aV3JCYzRG?=
 =?utf-8?B?VzBPOTNQRkl2bUNQQVZDTHRRK2dhTnNQbnZXcjBzNnJTcHFJQmgvWXBBS1Qw?=
 =?utf-8?B?REo0czlEdzd1REZKdFY5OGZ0N0R5Mnh3b1Bzc05PTG1XTTZEZzVodUQ0SWdi?=
 =?utf-8?B?NHdtN2hUeWRvd2svcnByN2hzalE4Wk9iOXVVUkNLWCtjSWU0YkRMajlJM3ZO?=
 =?utf-8?B?d3B6NkNzeGkrbUhrQkdsckt5ZjR3dTlYb2hxUklnWUoxV0FERlMybHVDaEpv?=
 =?utf-8?B?dUg1ZnBJK0tPVy9BVGFrcE9wSlJRKzN2VUszNGJuSWV1bXJLc2gyUUtQcWNT?=
 =?utf-8?B?QUpvM2JaelNoVEg5MzRxYlUrMy9zcnl2VXRidTBMUkx4T2pwNmo3azJ6TjhM?=
 =?utf-8?B?NHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <91001C0ED886AD4BA32E0F5FB2DC49AD@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 429822d0-090e-4fac-878b-08dd1bb73762
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Dec 2024 20:46:27.8234 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: idCgQZSOxVpzYrQmmsCh37cAI95euG9qPYlAnlZHpXoRicAjg26Ehr7wQXOPvJ30a2P3J9nXpI2As+rN83erwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4997
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

T24gRnJpLCAyMDI0LTEyLTEzIGF0IDEyOjI2IC0wODAwLCBKb2huIEhhcnJpc29uIHdyb3RlOg0K
PiBPbiAxMi8xMy8yMDI0IDExOjQzLCBTb3V6YSwgSm9zZSB3cm90ZToNCj4gPiBPbiBGcmksIDIw
MjQtMTItMTMgYXQgMDk6MzggLTA4MDAsIEpvaG4gSGFycmlzb24gd3JvdGU6DQo+ID4gPiBPbiAx
Mi8xMy8yMDI0IDA5OjI1LCBTb3V6YSwgSm9zZSB3cm90ZToNCj4gPiA+ID4gT24gRnJpLCAyMDI0
LTEyLTEzIGF0IDA4OjU2IC0wODAwLCBKb2huIEhhcnJpc29uIHdyb3RlOg0KPiA+ID4gPiA+IE9u
IDEyLzEzLzIwMjQgMDg6NDgsIEx1Y2FzIERlIE1hcmNoaSB3cm90ZToNCj4gPiA+ID4gPiA+IE9u
IEZyaSwgRGVjIDEzLCAyMDI0IGF0IDA0OjI4OjU4UE0gKzAwMDAsIEpvc2UgU291emEgd3JvdGU6
DQo+ID4gPiA+ID4gPiA+IE9uIEZyaSwgMjAyNC0xMi0xMyBhdCAwOTo1MCAtMDYwMCwgTHVjYXMg
RGUgTWFyY2hpIHdyb3RlOg0KPiA+ID4gPiA+ID4gPiA+IE9uIEZyaSwgRGVjIDEzLCAyMDI0IGF0
IDAzOjI0OjU5UE0gKzAwMDAsIEpvc2UgU291emEgd3JvdGU6DQo+ID4gPiA+ID4gPiA+ID4gPiBP
biBGcmksIDIwMjQtMTItMTMgYXQgMDc6MTAgLTA4MDAsIEpvc8OpIFJvYmVydG8gZGUgU291emEg
d3JvdGU6DQo+ID4gPiA+ID4gPiA+ID4gPiA+IE9uIEZyaSwgMjAyNC0xMi0xMyBhdCAwODozOCAt
MDYwMCwgTHVjYXMgRGUgTWFyY2hpIHdyb3RlOg0KPiA+ID4gPiA+ID4gPiA+ID4gPiA+IE9uIEZy
aSwgRGVjIDEzLCAyMDI0IGF0IDA5OjEyOjUyQU0gLTA1MDAsIFJvZHJpZ28gVml2aSB3cm90ZToN
Cj4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+IFdlIGRvIG5vdCBicmVhayB1c2Vyc3BhY2UuDQo+ID4g
PiA+ID4gPiA+ID4gPiA+IFRoZXJlIGlzIG90aGVyIHBhdGNoIHRoYXQgYWxzbyBicmVha3MgTWVz
YSBwYXJzZXI6DQo+ID4gPiA+ID4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gPiA+ID4gPiBkcm0v
eGUvZGV2Y29yZWR1bXA6IEltcHJvdmUgc2VjdGlvbiBoZWFkaW5ncyBhbmQgYWRkIHRpbGUgaW5m
bw0KPiA+ID4gPiA+ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+IFRoaXMgcmV2
ZXJ0cyBjb21taXQgZWMxNDU1Y2U3ZTM1YTMxMjg5ZDJkYmMxMDcwYjk4MDUzODY5ODkyMS4NCj4g
PiA+ID4gPiA+ID4gPiA+ID4gPiBCdXQgd2UgaGF2ZSB1c2VycyBjYWxsaW5nIHRoaXMgZnVuY3Rp
b24uLi4uIHRoZSByZXZlcnQgaXMgbm90DQo+ID4gPiA+ID4gPiA+ID4gc28gc2ltcGxlLg0KPiA+
ID4gPiA+ID4gPiA+ID4gPiA+IEkgdGhpbmsgd2UgbmVlZCB0byByZXZlcnQgdGhlIGZ1bmN0aW9u
YWxpdHkgcmF0aGVyIHRoYW4NCj4gPiA+ID4gPiA+ID4gPiByZXZlcnRpbmcgYWxsDQo+ID4gPiA+
ID4gPiA+ID4gPiA+ID4gdGhlIHBhdGNoZXMsIG90aGVyd2lzZSBpdCB3aWxsIGNhdXNlIGEgbG90
IG9mIGhlYWRhY2hlcy4NCj4gPiA+ID4gPiA+ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+ID4gPiA+
ID4gPiBJIHByb3Bvc2Ugd2UgZ28gd2l0aDoNCj4gPiA+ID4gPiA+ID4gPiA+ID4gPiANCj4gPiA+
ID4gPiA+ID4gPiA+ID4gPiBhKSBkcm9wIHRoZSBcbiB0aGF0IGJyb2tlIG1lc2EgYW5kIG1lcmdl
IHRoYXQgd2l0aCBjYyBzdGFibGUuDQo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4g
PiA+ID4gPiA+ID4gYikgbW92ZSBiYWNrIHRoZSBlbnRyeSB0byB0aGUgcHJldmlvdXMgc2VjdGlv
biB0aGF0IGJyb2tlIG1lc2ENCj4gPiA+ID4gPiA+ID4gPiBhbmQgY2MNCj4gPiA+ID4gPiA+ID4g
PiA+ID4gPiAgIMKgwqDCoMKgIHN0YWJsZS4NCj4gPiA+ID4gPiA+ID4gPiA+ID4gPiANCj4gPiA+
ID4gPiA+ID4gPiA+ID4gPiAgIMKgwqDCoMKgIEpvc8OpLCB3b3VsZCBpdCBiZSBvayB0byBtZXJn
ZSBhIHBhdGNoIGluIG1lc2EgYW5kIHBvcnQgdGhhdA0KPiA+ID4gPiA+ID4gPiA+ID4gPiA+ICAg
wqDCoMKgwqAgdG8gbWVzYSBzdGFibGUgdGhhdCBzaW1wbHkgbG9va3MgYXQgMiBwb3NzaWJsZSBz
ZWN0aW9ucz8NCj4gPiA+ID4gPiA+ID4gPiBPciBldmVuDQo+ID4gPiA+ID4gPiA+ID4gPiA+ID4g
ICDCoMKgwqDCoCBkcm9wIHRoZSBzZWN0aW9uIGNoZWNrcy4uLiA/DQo+ID4gPiA+ID4gPiA+ID4g
PiBCdXQgaWYgWGUgS01EIGlzIHJldmVydGluZyB0aGUgcGF0Y2ggdGhhdCBjaGFuZ2VkIHRoZSBo
d2N0eA0KPiA+ID4gPiA+ID4gPiA+IHNlY3Rpb24gd2h5IHdvdWxkIE1lc2EgbmVlZCB0byBhbHNv
IHBhcnNlIHRoZSBuZXcoZnV0dXJlIHRvIGJlDQo+ID4gPiA+ID4gPiA+ID4gcmV2ZXJ0ZWQpIHNl
Y3Rpb24/DQo+ID4gPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiA+ID4gZmlyc3QgaXMgdG8gdW5k
byB0aGUgZGFtYWdlLCB3aXRoIDAgY2hhbmdlcyBpbiBtZXNhLiBXZSBkbyB0aGF0DQo+ID4gPiA+
ID4gPiA+ID4gZmlyc3QgYW5kDQo+ID4gPiA+ID4gPiA+ID4gKnRoZW4qIHdlIGFncmVlIG9uIHdo
YXQncyBwb3NzaWJsZSB0byBkbyB0byBhY2NvbW9kYXRlIHRoZSAyIHBhcnNlcnMgd2UNCj4gPiA+
ID4gPiA+ID4gPiBoYXZlLg0KPiA+ID4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gPiA+IElmIHdl
IGNhbiBnZXQgc29tZXRoaW5nIGluIG1lc2EgdG8gd29yayB0aGF0IGlzIGJhY2t3YXJkIGNvbXBh
dGlibGUNCj4gPiA+ID4gPiA+ID4gPiAoaS5lLiB0aGUNCj4gPiA+ID4gPiA+ID4gPiBjaGFuZ2Vk
IHBhcnNlciBpcyBhYmxlIHRvIHBhcnNlIGJvdGggYmVmb3JlIGFuZCBhZnRlciB0aGUga2VybmVs
DQo+ID4gPiA+ID4gPiA+ID4gY2hhbmdlKSwNCj4gPiA+ID4gPiA+ID4gPiB0aGVuIGl0IGNvdWxk
IGJlIGNvbnNpZGVyZWQgdG8gYSBtZXNhIHN0YWJsZSBhbmQgdGhlIGtlcm5lbCBzaWRlDQo+ID4g
PiA+ID4gPiA+ID4gY2hhbmdlZC4NCj4gPiA+ID4gPiA+ID4gT2theSwgcmVhc29uYWJsZSBwbGFu
LiBCdXQgdGhlIGFzY2lpODUgZW5jb2RlciB3aXRoIFxuIHdpbGwgbm90IGJlDQo+ID4gPiA+ID4g
PiA+IGJyb3VnaHQgYmFjayByaWdodD8NCj4gPiA+ID4gPiA+IG1heWJlIGxldCdzIGFncmVlIG9u
IGhvdyB0byBwb3NzaWJseSBicmluZyBpdCBiYWNrPyBJIHN1Z2dlc3RlZCB1c2luZyBhDQo+ID4g
PiA+ID4gPiBzcGFjZSBhcyBjb250aW51YXRpb24gbGluZSBjaGFyLiBUaGlzIHdheSB5b3UgY2Fu
IGp1c3QgY2hlY2sgdGhlIGxhc3QNCj4gPiA+ID4gPiA+IGNoYXINCj4gPiA+ID4gPiA+IHJldHVy
bmVkIGJ5IGdldGxpbmUoKSB5b3UgYXJlIGNhbGxpbmcgYW5kIHNlZSBpZiB5b3UgY2FuIGdvIGFo
ZWFkIGFuZA0KPiA+ID4gPiA+ID4gcHJvY2VlZCBvciBpZiB5b3Ugc3RpbGwgbmVlZCB0byBnZXQg
bW9yZSBkYXRhLiBOZWl0aGVyIHNwYWNlIG5vciBuZXdsaW5lDQo+ID4gPiA+ID4gPiBhcmUgcGFy
dCBvZiB0aGUgYXNjaWk4NSBjaGFyYWN0ZXIgc2V0LCBzbyBpdCdzIHNhZmUgYW5kIHlvdSBjYW4g
aGFuZGxlDQo+ID4gPiA+ID4gPiBjb250aW51YXRpb24gaW4gb25lIHBsYWNlIGluIHlvdXIgbG9v
cC4NCj4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gaWYgeW91IGFyZSBqdXN0IGlnbm9yaW5nIGFu
eSBhc2NpaTg1LCB0aGVuIEkgYmVsaWV2ZSBpdCdzIGV2ZW4gc2ltcGxlcjoNCj4gPiA+ID4gPiA+
IHlvdSBjaGVjayBzZWN0aW9ucyBhbmQga2V5cyB3aXRoIGEgc3BhY2Ugc2luY2UgYm90aCBrZXlz
IGFuZCBzZWN0aW9uDQo+ID4gPiA+ID4gPiB0aXRsZXMgY29udGFpbiBzcGFjZSwgd2hpY2ggaXMg
bm90IHBhcnQgb2YgdGhlIGFzY2lpODUgY2hhciBzZXQuDQo+ID4gPiA+ID4gPiANCj4gPiA+ID4g
PiA+IEx1Y2FzIERlIE1hcmNoaQ0KPiA+ID4gPiA+IFllcywgSSB3b3VsZCBzdHJvbmdseSBwcmVm
ZXIgdG8gdXNlIGxpbmUgd3JhcHBlZCBBU0NJSTg1IGRhdGEgZm9yIGFsbA0KPiA+ID4gPiA+IGJs
b2JzIGluIHRoZSBkZXZjb3JlZHVtcC4gSW5jbHVkaW5nIHRoaW5ncyBsaWtlIGJhdGNoIGJ1ZmZl
cnMgYW5kIG90aGVyDQo+ID4gPiA+ID4gVk0gZW50cmllcyB0aGF0IHRoZSBtZXNhIHRvb2wgaXMg
cHJlc3VtYWJseSB3YW50aW5nIHRvIGRlY29kZS4NCj4gPiA+ID4gPiANCj4gPiA+ID4gPiBJZiBh
ZGRpbmcgYSA8c3BhY2U+IGNoYXJhY3RlciB0byB0aGUgZW5kIG9mIGVhY2ggbGluZSBpcyBhbiBh
Y2NlcHRhYmxlDQo+ID4gPiA+ID4gZml4IHRoZW4gSSBoYXZlIG5vIHByb2JsZW1zIHdpdGggdGhh
dC4gQnV0IG5vdCBsaW5lIHdyYXBwaW5nIGF0IGFsbA0KPiA+ID4gPiA+IG1lYW5zIGhhdmluZyB0
byBjYXJyeSB0aGF0IGNoYW5nZSBhcyBhIG5vbi11cHN0cmVhbSBwYXRjaCBpbiBlaXRoZXIgdGhl
DQo+ID4gPiA+ID4gaW50ZXJuYWwgdHJlZSBvciBpbiBpbmRpdmlkdWFsIGRldmVsb3BlcidzIGxv
Y2FsIHRyZWVzLiBFaXRoZXIgdGhhdCBvcg0KPiA+ID4gPiA+IHdlIGp1c3QgY2Fubm90IGRlYnVn
IGEgbG90IG9mIGhhcmQgdG8gcmVwcm8gcHJvYmxlbXMuDQo+ID4gPiA+IENhbid0IFhlIEtNRCB1
c2UgdGhlIGxpbmUgd3JhcHBlZCB2ZXJzaW9uIG9mIEFTQ0lJODUgd2hlbiBwcmludGluZyB0byBk
bWVzZyBhbmQga2VlcCB0aGUgcmVndWxhciBlbmNvZGVyIHdoZW4gZGV2Y29yZWR1bXAgZmlsZSBp
cyByZWFkPw0KPiA+ID4gQXBwYXJlbnRseSBub3QuIEV2ZW4gd2hlbiBub3QgZGVsaWJlcmF0ZWx5
IGxpbmUgd3JhcHBpbmcgdGhlIG91dHB1dCwgSQ0KPiA+ID4gYW0gc3RpbGwgc2VlaW5nIGl0IGJl
aW5nIHdyYXBwZWQgd2hlbiBkdW1waW5nIHZlcnkgbGFyZ2UgYnVmZmVycyBzdWNoIGFzDQo+ID4g
PiB0aGUgR3VDIGxvZy4gSXQgbG9va3MgbGlrZSBzb21ldGhpbmcgaW4gYSBsb3dlciBsYXllciBp
cyBhbHNvIGZvcmNpbmcNCj4gPiA+IGxpbmUgd3JhcHBpbmcgb2Ygc3VwZXIgbG9uZyBsaW5lcy4g
U28gZWl0aGVyIHdlIGNhbid0IGFkZCBmdWxsIHNpemUgR3VDDQo+ID4gPiBsb2dzIHRvIHRoZSBk
ZXZjb3JlZHVtcCBvciB3ZSBuZWVkIHRvIHN1cHBvcnQgbGluZSB3cmFwcGVkIGRhdGEgaW4gdGhl
DQo+ID4gPiBtZXNhIHRvb2wuDQo+ID4gSXQgaXMgcHJvYmFibHkgc29tZSBpbXBsZW1lbnRhdGlv
biBkZXRhaWwgb2YgX19kcm1fcHJpbnRmbl9jb3JlZHVtcCgpLiBUaGF0IGNvdWxkIGJlIHJlcGxh
Y2VkIHRvIHNvbWV0aGluZyBsaWtlIGk5MTUgZXJyb3IgZHVtcCB3cml0ZSBmdW5jdGlvbnMgdG8g
bm90DQo+ID4gaGF2ZSBhbnkgbGltaXQgYXQgbGVhc3Qgd2hlbiB0aGUgdGFyZ2V0IGlzIGEgZmls
ZSBkZXNjcmlwdG9yLCBmb3IgZG1lc2cgeW91IGFyZSBmcmVlIHRvIGFkZCBhbnkgbGluZSB3cmFw
cGluZy4NCj4gUmF0aGVyIHRoYW4gcmUtd3JpdGluZyB0aGUgZW50aXJlIGRybSBwcmludGVyIGlu
ZnJhc3RydWN0dXJlLCBjb3VsZCB3ZSANCj4gbm90IGp1c3QgdXBkYXRlIHRoZSBtZXNhIGRlY29k
ZXIgdG9vbD8NCj4gDQo+IE5vdGUgdGhhdCB0aGUgZXhpc3RpbmcgVk0gZHVtcHMgYXJlIHVzaW5n
IHRoZSBzYW1lIGRybV9wdXRzIHByaW50ZXIgDQo+IGZ1bmN0aW9uLiBTbyBpZiBhIHZlcnkgbGFy
Z2UgdXNlciBidWZmZXIgd2FzIGluY2x1ZGVkIGluIHRoZSBkdW1wLCBpdCANCj4gc2VlbXMgbGlr
ZSB0aGF0IHdvdWxkIGFsc28gYnJlYWsgdGhlIG1lc2EgcGFyc2VyLiBBbmQgdGhhdCBpcyBub3Qg
DQo+IHNvbWV0aGluZyB1bmRlciB0aGUgY29udHJvbCBvZiB0aGUgS01ELg0KDQpCb3RoIHRvIG1l
IGxvb2tzIGxpa2UgYSBYZSBLTUQgaXNzdWUuDQoNCkEgZWFzaWVyIG9wdGlvbiBpcyB3cml0ZSBh
IGRybV9wcmludF9hc2NpaTg1X2Jsb2IoZHJtX3ByaW50ZXIgKnAsIHU4ICpkYXRhLCBzaXplX3Qg
bGVuKSB0aGF0IGRpcmVjdGx5IHdyaXRlcyB0byBkcm1fcHJpbnRfaXRlcmF0b3IuZGF0YS4NCg0K
PiANCj4gSm9obi4NCj4gDQo+ID4gDQo+ID4gPiBKb2huLg0KPiA+ID4gDQo+ID4gPiA+ID4gSm9o
bi4NCj4gPiA+ID4gPiANCj4gDQoNCg==
