Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 200DAC3DA45
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jul 2024 19:37:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E474E10EB62;
	Thu, 11 Jul 2024 19:37:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d/DqB2oe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3ADC10EB62
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jul 2024 19:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720726621; x=1752262621;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=X4TDT0K0q5T+XAWL2BOxYBELlNcsRq9pzNlUfei7JNA=;
 b=d/DqB2oeuxO8viKYfZXF2y9Yy1UuKrqkQYrVLM0IKQEbtv2DqAvGxSL6
 P5VwxVJBgN6PZgVJSrHybS7xFWhrwnkV6ui4dEYa5VkIbOyUqcol8M2dX
 npTrR0FdFIrow7UHbmOfiLZLYzLYYMoNI2X6kAV1xCj3LC+jO4kX/J5U5
 1InqAJhKdIUUlzombDci4xdYRvpoYxHHo4NcaB+Jc0XKlOZT4EJECVJE2
 d1BkU6QriBUPlxDlKgoJEbaQ3zLR4hO98HDtl1Fu51fgij2d4DoSjEgjc
 OFN5/KSef5ih/e06DqI1i8xad6dm40m/AQZ5gW3OAA9om/gHWu27CQ05h Q==;
X-CSE-ConnectionGUID: yQ89fEFHS+iPO9ziNdAlTA==
X-CSE-MsgGUID: OTArxZghR66h0VbWv+LdZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11130"; a="28742122"
X-IronPort-AV: E=Sophos;i="6.09,201,1716274800"; d="scan'208";a="28742122"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2024 12:37:01 -0700
X-CSE-ConnectionGUID: N41ACzydQ1mLPRqh5waSow==
X-CSE-MsgGUID: lUjLd933TrCuMi5B2rxLfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,201,1716274800"; d="scan'208";a="79364491"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Jul 2024 12:37:01 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 11 Jul 2024 12:37:00 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 11 Jul 2024 12:37:00 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 11 Jul 2024 12:37:00 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.46) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 11 Jul 2024 12:36:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DyEdpurytMb1w7OYCkjxblnNT48exT+cXZ/T5Xd8ZEb7VRmD8hE7CEEI5Of85kyqQ95wJpiy2EB8tbLd0/2tdAGo+4SpgW6/MMy32vBqD9bGCiOlWhs+29fzUtK61EW2AD0aELCFQdedIvRfO4+2TF6Gp1Qo39b3nKmz8qVon1U3kNhoA1xMI7ZfOQsSZlbQFIzVO//0+BLLQMAqJn+O37HZwB3P1bHqmeXRQ9qUI0/9VrIQ3fZI895TtT922gDpENsVj6CLvSSDVsa3c1ROXLSZQHBxb5fTG2fJFrvsMT+Sd6CdENblxu/JJGeVjKJT1paH6ox22rjCHqkcNoa1sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X4TDT0K0q5T+XAWL2BOxYBELlNcsRq9pzNlUfei7JNA=;
 b=VqX75LrZvwoqT57HDaMnGwKRivqeVOtI3vkg6LPcF1d3dZrZufErBJrbMD7vKSpvECmXlBf8pvyvXa+wMtfqUKJtgAqs9GhOnRBJwpIbTDulYEE4AC/XO4JP10UVRlgoEbVZqYYoNKGDjykvjc1b4nlaW4XvPAgjR4nb4AvheLBdyKJF8QG9QZQdlcYpcyqqdUWrlHHbz8r6omIQ9+3a/yAdJleMh32FT53JKehrfmDVrEuNtUBAiao83/EZsxHv/CZS8aGJAcCMGHJcgqi1WjmjHn/S4aDudfhckHQRkVRCMHsBi3QZP6D8/eCe/Lbs0nM8ZYjDck2ePZFogNsFpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 DS0PR11MB7765.namprd11.prod.outlook.com (2603:10b6:8:130::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7741.35; Thu, 11 Jul 2024 19:36:52 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%3]) with mapi id 15.20.7741.033; Thu, 11 Jul 2024
 19:36:52 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Brost, 
 Matthew" <matthew.brost@intel.com>, "Harrison, John C"
 <john.c.harrison@intel.com>, "Welty, Brian" <brian.welty@intel.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
Subject: Re: [PATCH 2/2] drm/xe: Use topology to determine page fault queue
 size
Thread-Topic: [PATCH 2/2] drm/xe: Use topology to determine page fault queue
 size
Thread-Index: AQHa07jzhpN8KWpffE6NMbwash0ktLHx1o4AgAAVVwA=
Date: Thu, 11 Jul 2024 19:36:52 +0000
Message-ID: <98388c1957ac379b3ac4fd7f27bc445f7ae7a8ca.camel@intel.com>
References: <cover.1720718987.git.stuart.summers@intel.com>
 <02abbc0c383839ba2fe89bd3e8cfb5735e20d49f.1720718987.git.stuart.summers@intel.com>
 <CH0PR11MB544480166880B0EE2194EFD1E5A52@CH0PR11MB5444.namprd11.prod.outlook.com>
In-Reply-To: <CH0PR11MB544480166880B0EE2194EFD1E5A52@CH0PR11MB5444.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|DS0PR11MB7765:EE_
x-ms-office365-filtering-correlation-id: e0a0fa88-f260-49d6-28dd-08dca1e0d0c6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?Z3RsYjdBZ3dxTjNvWXVCWFZqZFhpQytzWjRwREt3TG1HeEVsd0tvNnBCUnhJ?=
 =?utf-8?B?QjU1cVduSm5qbkZlWWdPVmZWNUp6cUZvQW1qcmlXTVBBc2wraE50VG5GcEVa?=
 =?utf-8?B?WG9vN1FqNUJkaTljS3RRR3BsMWprY0Vhd0N5eGZBYkZKT1dwMlBRZjhGWXNw?=
 =?utf-8?B?SDgzeDFmSFJ4NmJUQnk1TlNTU2pTSTVVRWY2UzRhRzRVVjFmQ09SMzB6RXh2?=
 =?utf-8?B?S2ZDbDc2WVRRbkpseUp1UVlDUkZUaEFzMnRNVGJPY1NWVStteHA0Yk1XTHdY?=
 =?utf-8?B?WDJMV25VZFBuZGJ0MGJzOXpWVmE4c0ovdS9QZEZZT3lHV0Q4ZFQwazY5Z3BQ?=
 =?utf-8?B?T09vQTJNUSt5bU5VZncvWFYvdEFmQVl4QTRHbGh3ZDZsV2VoZDlyK0xrOWxy?=
 =?utf-8?B?Vm9nbCtmdlRwRFlOT3A0enRaYTR3SnV0MFJqVWJNa2w3YWpOZUQ2SmFPcEpZ?=
 =?utf-8?B?enpPZ1NHczErZ2xpVktJTTRsV3VJemV1aFNieGpvUVoreUpLTjFvNTlZU2FW?=
 =?utf-8?B?RWEySDdQeXpLRXBleTdocjdzNm5UR1pjdzFjK3NXSkFxUmlKV0FKL2N3dVRv?=
 =?utf-8?B?RmNGY1lsd1NpZnBkb1NNbTJwUUhGbm9HbUFIc2VKclhoR1lTSGl2OTgrTkNV?=
 =?utf-8?B?R0tHYmFiSkdPUWNmVWc3MFdmcitPejlGdXZQZ0wxazk5djlVbFFxWEcvMnhB?=
 =?utf-8?B?aXFwMFQ1bjN4UHFJbVVxZXVTT09qL011ZGVLWDB5aHY0T3pncGxDTFVnTUE4?=
 =?utf-8?B?NkJhQjZWajhyUWVOekpKbHNvY3E3UkpQT1h6R09mc2RIdi9MNVFrWkYraUNM?=
 =?utf-8?B?SnhWVkd5SGh3NDBCODJNcmQrc0kwUWZKWlhpWDJ0RElUSm9paG1BcWFTaFk0?=
 =?utf-8?B?TFNpcytJejgvRjdqZ3VhQThocDZlZmhqNnNvTktXc3VqYzc0WDVLSTU2Q1dK?=
 =?utf-8?B?VS9vVnI0VTlQWndSdDEyakNWU2VGOVBYZ0d5NTZSQnV1amROdDhuZitaellk?=
 =?utf-8?B?cW9lc2FMbVU0VE1hOEJrenIwUXJjQ2RUaWJpcWZrSktEcStKcmRNK3dYNy81?=
 =?utf-8?B?SFZBSllWdXpuQmtFVjJOQlc4VERzRkV4dk81RWc2Q1N1R2o3NmRENENIT2J1?=
 =?utf-8?B?TTA1UHRxVzA4QzN0S1RsOXpJaVpTTFdPajJMazJMa3NhQmdVKzlVMCtuRGJq?=
 =?utf-8?B?NXZ6Q0xZZXJaT01ZMGlNNnRmUmZ6ZE9SdkFzZDFRb3BMWVpTMzVpamZkajcy?=
 =?utf-8?B?SUo1YXZGTURSVUxVTGRSUnc1SFNBWlRqSlMvWGcyVSt5ZWYxNWFsOGMza2Fi?=
 =?utf-8?B?SkNnRW5SazlDSVhBeWxxUkNLREw5VVM5Rkc3dVZPQkNZejE5YzZlWGRMYndw?=
 =?utf-8?B?WUdvVUg2SFg4U0VxR3dKM1hUa2JIS1oxcU9hTmxYdUpVZlpnR1ZHWU4wNlBl?=
 =?utf-8?B?U0FzbElPVlpvVWtjd3dWQzBRZFMxTU9ySndoak1hczNxOXZwS3M5WVRDeHls?=
 =?utf-8?B?Tkh2cGhMbHBtVlZJN1FjekNTaFN3b0JMeStSUk5xNmdFVDFJT0hWc1RsWHJ4?=
 =?utf-8?B?a0ltR2FKZVZqM2JkUlkvZ3RTR3RqQ3NkWHJ2aWpUNkRKUmpoRU1QNWJGSHph?=
 =?utf-8?B?M1BVcXhRWWdWckJHOEFuU01VRmRyTUk2K3JHWFBlSWdQeWtsaDRxZGE5aVA2?=
 =?utf-8?B?Wi96UTRRV0lkSWFXUHpUZ0ZkTCsyS1ZJMnRDNXkrUUI1NEgvZ0JVUVhGTUc5?=
 =?utf-8?B?UWpmRGkvb1U2dTZGY0NYYTduaDlPOHRoVTVTSzVJM0ZvVHNVUlRaMGQ0ZlZN?=
 =?utf-8?B?eENISVFUcnIxclU5R2R0eEFwRklLWFp3MUV4cHh5dnlPZ3RWYnNValN5bEVO?=
 =?utf-8?B?a0NSaTBJLzN6YjEwRU1nQXI3dDhIbUxZZU90a1VHNktaamc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bDltZE4vVk90N1ZQcnE3ZnZZanlDOXFvZllQOEdhcHhzZnVHRjFuSEsxMTd4?=
 =?utf-8?B?S3NCNWFRTkxudjJPSjRJSGgzcGtYeW5jNCsrL3N0OHd1cllHbDVNd3pTVnBE?=
 =?utf-8?B?N3FENFVjaDB1b3MwaHZWdGtVSytnQnZzOElFWmJRRG04SmE0MC9WWHFFeVh0?=
 =?utf-8?B?SENobHg5YWpQWk8xY0dLTGNvODByQ0pKMUFrZVQ0S251LzBHckkrZ0ZLRGZK?=
 =?utf-8?B?TEV6RDFsOExhaWpZVm9pSFlqN0IxUm91VmR4NjN3czZxbjZLUHNYTnJuYmhs?=
 =?utf-8?B?dSt0aWlSM25mWE1DeXdSNGgvbzRUOW1uMEVjL2w1L1JxTml4QlpveE5jb2U1?=
 =?utf-8?B?Q2w1ZFhmc0tka2s3QjlJTll1MTdodGJpRkluOVk0blBvSDhFb25YK2Q3MVlk?=
 =?utf-8?B?cUhxdWRadm8xNVRqNldoYUVyY2daREtGUjNtbzBnVHd4WDUvZmxVdy9EYmx3?=
 =?utf-8?B?cWh5QkQvaHArekJLbWova2tQaGFOZk8vSlNWK0FuMS95THlXRC9ZK0FNR3lF?=
 =?utf-8?B?bk9GTS8wLzBFSWF6aTBUWURyclQ1Wm5xeC9LOVpvekwvRW5yOFovdHJ5Qkp4?=
 =?utf-8?B?LzRkeWVaNW0rdWxOc1lGdDNNMlVFNHJQSklkaURTSTBFaktnR0tUQ1hEZnc0?=
 =?utf-8?B?OVNDWnR4cTdqYklibW9zZml3WnJVd0o1cWYvVE9DUU5RRk1oWnJwOTdmVDll?=
 =?utf-8?B?TVd5NmptZE90NHJBZExXdjIyVWQ1Qk1Qek5SNTdtMjJjMXBXOHRTTVFEanpl?=
 =?utf-8?B?REhUY0c1M2JtNnVwK3JuREhwYVJRM3hRdStyQmhNMWVmOXVmYjRzMXJ3cHZ3?=
 =?utf-8?B?WkNnd0lmYVVSV3BsSjUzVTJ3U0ZDV2NXU3g4SU1qUS9lRlFTckFKLytRYzFS?=
 =?utf-8?B?NXgyTHMvQzR2cFM3WXpMVTIyRWZNbFhQVWRJeWVjU1MzbUtmY25MTi9raXlI?=
 =?utf-8?B?WlBmdjNHbkhkRmNKVk05SXZRRlpjNElubW1wdjMwc1R4cUVvYTVPYS9FRXFK?=
 =?utf-8?B?VFJYNUh2MEJFYnFiRFJxd3I1S0xZcGZGNjJBbEpGRGwvL2F1NzhaL1NCaHZV?=
 =?utf-8?B?NG43clB6SU1KZjhyVThiQ25uSVZzeE93VzNtQkNJZFVOT0lqVnBLTytVYVhs?=
 =?utf-8?B?SFRET1ZUZEk3NE5kd21OKysyRjBPNDNBYUpicStxNDh5dkp0SU5GWjhxWTVO?=
 =?utf-8?B?R1p3YVpQOEF6TnQyRU8xdkhRUzVocnU5WXhLcy9USS80NFF0ZS9aVlR1M1hD?=
 =?utf-8?B?YmVnQUwxaU1GOTduK0hFc0hNTkxiQzN4cDJ3M3hvM3FOd3hURzIxcU5FUmRC?=
 =?utf-8?B?L1NGK2EwbG92UkU4LzZyU040SHRSWGQ4bTVIK3JNVDRnYmNaOGczak1JRnBt?=
 =?utf-8?B?WUVxZDFFVjlHOWhxRlEwbXlmcXJxak1NN0d1MTZiaitlelU4NlZRUkhOUmQw?=
 =?utf-8?B?MXU2QmZ2REVFRkZjcFZQTWlMUnRETkxjNUNzYWFVOTdlQlNZSmZvZFZsV1hD?=
 =?utf-8?B?OVk4QnQ1bjY5QjRZZy95MEFwMWNVUHpFZDBtcjNYTHFWN3FuU0Vyb2ZCOVRC?=
 =?utf-8?B?VHRobjNGQ0VFUDVJbmx2QTlnVjdGaWNnSjBXTFQwRVFhaHpIYm12eGZvWGtl?=
 =?utf-8?B?MHJlZS96dW95emY5dzlIc3lsYzB0akpLV2hhU21VMzlhZjY1d1ZxQzlIZTRh?=
 =?utf-8?B?Y3JYNnRrKzJ0d1BndDIvL0diQ0JmdGw5KzV4MDRDckRvUm9HU0NySW9xQUZa?=
 =?utf-8?B?UzBBaE5WTGhLWFhqeEcxZDZmY2VxS3ludlpid1dkdGZ2TnZRVitEMmNsdUtK?=
 =?utf-8?B?U2xKZ3k4Qm1Cc3ViOUN4d2FPN2ZEWW94Z01oT3llRlFZVzhLekh2enJyNngy?=
 =?utf-8?B?VnlHVlVOV3Q0YVVkWG0zNEtRODdNNk02MzB1a2dXQk1DRlNGMXV3R0JJY2RI?=
 =?utf-8?B?dUlWeTY1ZmdkTzVBUk9MNUxMZ1l6V1dkSWhaZk5NSDBnYVp3UUNpU1JzS1p2?=
 =?utf-8?B?cU1UZ1ErVUdFVDBWUCt0SVEvck9GUHZaS0JjeFljNTNYa1haaWdVc0JhcFpB?=
 =?utf-8?B?bEIxWXkwRjdYK3lzNlBYcytBcWZRZHo3WlRody84SDRSSG03K3FKQjJaNUhx?=
 =?utf-8?B?aUljeVNnMW1lK2tVekJLcWhtUEc1WlBrd2FZa3VmbVFXY3FkVlhLT3R0bFRs?=
 =?utf-8?B?SXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <54DE8A1F0E596D4094F57BF9368C66EF@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0a0fa88-f260-49d6-28dd-08dca1e0d0c6
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jul 2024 19:36:52.6994 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zqkPfEPsc/NZFHdEtbpwiRxdFHY0VNjUoT06E7TMxuQwSNac7GAyDbOy77RQZWvdzSXX4HIANBq7zlV7Mre1QPbAfX5umCjpi6VsPg0RQds=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7765
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

T24gVGh1LCAyMDI0LTA3LTExIGF0IDE4OjIwICswMDAwLCBDYXZpdHQsIEpvbmF0aGFuIHdyb3Rl
Ogo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4gRnJvbTogSW50ZWwteGUgPGludGVsLXhl
LWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YKPiBTdHVhcnQgU3Vt
bWVycwo+IFNlbnQ6IFRodXJzZGF5LCBKdWx5IDExLCAyMDI0IDEwOjM2IEFNCj4gQ2M6IEJyb3N0
LCBNYXR0aGV3IDxtYXR0aGV3LmJyb3N0QGludGVsLmNvbT47IEhhcnJpc29uLCBKb2huIEMKPiA8
am9obi5jLmhhcnJpc29uQGludGVsLmNvbT47IFdlbHR5LCBCcmlhbiA8YnJpYW4ud2VsdHlAaW50
ZWwuY29tPjsKPiBpbnRlbC14ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IFZpdmksIFJvZHJpZ28K
PiA8cm9kcmlnby52aXZpQGludGVsLmNvbT47IFN1bW1lcnMsIFN0dWFydCA8c3R1YXJ0LnN1bW1l
cnNAaW50ZWwuY29tPgo+IFN1YmplY3Q6IFtQQVRDSCAyLzJdIGRybS94ZTogVXNlIHRvcG9sb2d5
IHRvIGRldGVybWluZSBwYWdlIGZhdWx0Cj4gcXVldWUgc2l6ZQo+ID4gCj4gPiBDdXJyZW50bHkg
dGhlIHBhZ2UgZmF1bHQgcXVldWUgc2l6ZSBpcyBoYXJkIGNvZGVkLiBIb3dldmVyCj4gPiB0aGUg
aGFyZHdhcmUgc3VwcG9ydHMgZmF1bHRpbmcgZm9yIGVhY2ggRVUgYW5kIGVhY2ggQ1MuCj4gPiBG
b3Igc29tZSBhcHBsaWNhdGlvbnMgcnVubmluZyBvbiBoYXJkd2FyZSB3aXRoIGEgbGFyZ2UKPiA+
IG51bWJlciBvZiBFVXMgYW5kIENTcywgdGhpcyBjYW4gcmVzdWx0IGluIGFuIG92ZXJmbG93IG9m
Cj4gPiB0aGUgcGFnZSBmYXVsdCBxdWV1ZS4KPiA+IAo+ID4gQWRkIGEgc21hbGwgY2FsY3VsYXRp
b24gdG8gZGV0ZXJtaW5lIHRoZSBwYWdlIGZhdWx0IHF1ZXVlCj4gPiBzaXplIGJhc2VkIG9uIHRo
ZSBudW1iZXIgb2YgRVVzIGFuZCBDU3MgaW4gdGhlIHBsYXRmb3JtIGFzCj4gPiBkZXRtaW5lZCBi
eSBmdXNlcy4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogU3R1YXJ0IFN1bW1lcnMgPHN0dWFydC5z
dW1tZXJzQGludGVsLmNvbT4KPiA+IC0tLQo+ID4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfZ3Rf
cGFnZWZhdWx0LmMgfCA1NCArKysrKysrKysrKysrKysrKysrKystLS0KPiA+IC0tLS0KPiA+IMKg
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0X3R5cGVzLmjCoMKgwqDCoCB8wqAgOSArKystLQo+ID4g
wqAyIGZpbGVzIGNoYW5nZWQsIDQ5IGluc2VydGlvbnMoKyksIDE0IGRlbGV0aW9ucygtKQo+ID4g
Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0X3BhZ2VmYXVsdC5jCj4g
PiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndF9wYWdlZmF1bHQuYwo+ID4gaW5kZXggYjJhN2Zh
NTViZDE4Li42YmZjNjBjMDI3NGEgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUv
eGVfZ3RfcGFnZWZhdWx0LmMKPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndF9wYWdl
ZmF1bHQuYwo+ID4gQEAgLTI4Nyw3ICsyODcsNyBAQCBzdGF0aWMgYm9vbCBnZXRfcGFnZWZhdWx0
KHN0cnVjdCBwZl9xdWV1ZQo+ID4gKnBmX3F1ZXVlLCBzdHJ1Y3QgcGFnZWZhdWx0ICpwZikKPiA+
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoFBGRF9WSVJU
VUFMX0FERFJfTE9fU0hJRlQ7Cj4gPiDCoAo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqBwZl9xdWV1ZS0+dGFpbCA9IChwZl9xdWV1ZS0+dGFpbCArIFBGX01TR19MRU5fRFcpICUK
PiA+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgUEZfUVVF
VUVfTlVNX0RXOwo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqBwZl9xdWV1ZS0+cGZfcXVldWVfbnVtX2R3Owo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqByZXQgPSB0cnVlOwo+ID4gwqDCoMKgwqDCoMKgwqDCoH0KPiA+IMKgwqDCoMKg
wqDCoMKgwqBzcGluX3VubG9ja19pcnEoJnBmX3F1ZXVlLT5sb2NrKTsKPiA+IEBAIC0yOTksNyAr
Mjk5LDggQEAgc3RhdGljIGJvb2wgcGZfcXVldWVfZnVsbChzdHJ1Y3QgcGZfcXVldWUKPiA+ICpw
Zl9xdWV1ZSkKPiA+IMKgewo+ID4gwqDCoMKgwqDCoMKgwqDCoGxvY2tkZXBfYXNzZXJ0X2hlbGQo
JnBmX3F1ZXVlLT5sb2NrKTsKPiA+IMKgCj4gPiAtwqDCoMKgwqDCoMKgwqByZXR1cm4gQ0lSQ19T
UEFDRShwZl9xdWV1ZS0+aGVhZCwgcGZfcXVldWUtPnRhaWwsCj4gPiBQRl9RVUVVRV9OVU1fRFcp
IDw9Cj4gPiArwqDCoMKgwqDCoMKgwqByZXR1cm4gQ0lSQ19TUEFDRShwZl9xdWV1ZS0+aGVhZCwg
cGZfcXVldWUtPnRhaWwsCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHBmX3F1ZXVlLT5wZl9xdWV1ZV9udW1fZHcpIDw9Cj4gPiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoFBGX01TR19MRU5fRFc7Cj4gPiDCoH0KPiA+IMKgCj4gPiBA
QCAtMzEyLDIyICszMTMsMjMgQEAgaW50IHhlX2d1Y19wYWdlZmF1bHRfaGFuZGxlcihzdHJ1Y3Qg
eGVfZ3VjCj4gPiAqZ3VjLCB1MzIgKm1zZywgdTMyIGxlbikKPiA+IMKgwqDCoMKgwqDCoMKgwqB1
MzIgYXNpZDsKPiA+IMKgwqDCoMKgwqDCoMKgwqBib29sIGZ1bGw7Cj4gPiDCoAo+ID4gLcKgwqDC
oMKgwqDCoMKgLyoKPiA+IC3CoMKgwqDCoMKgwqDCoCAqIFRoZSBiZWxvdyBsb2dpYyBkb2Vzbid0
IHdvcmsgdW5sZXNzIFBGX1FVRVVFX05VTV9EVyAlCj4gPiBQRl9NU0dfTEVOX0RXID09IDAKPiA+
IC3CoMKgwqDCoMKgwqDCoCAqLwo+ID4gLcKgwqDCoMKgwqDCoMKgQlVJTERfQlVHX09OKFBGX1FV
RVVFX05VTV9EVyAlIFBGX01TR19MRU5fRFcpOwo+ID4gLQo+ID4gwqDCoMKgwqDCoMKgwqDCoGlm
ICh1bmxpa2VseShsZW4gIT0gUEZfTVNHX0xFTl9EVykpCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoHJldHVybiAtRVBST1RPOwo+ID4gwqAKPiA+IMKgwqDCoMKgwqDCoMKgwqBh
c2lkID0gRklFTERfR0VUKFBGRF9BU0lELCBtc2dbMV0pOwo+ID4gwqDCoMKgwqDCoMKgwqDCoHBm
X3F1ZXVlID0gZ3QtPnVzbS5wZl9xdWV1ZSArIChhc2lkICUgTlVNX1BGX1FVRVVFKTsKPiA+IMKg
Cj4gPiArwqDCoMKgwqDCoMKgwqAvKgo+ID4gK8KgwqDCoMKgwqDCoMKgICogVGhlIGJlbG93IGxv
Z2ljIGRvZXNuJ3Qgd29yayB1bmxlc3MgUEZfUVVFVUVfTlVNX0RXICUKPiA+IFBGX01TR19MRU5f
RFcgPT0gMAo+IAo+IFBGX1FVRVVFX05VTV9EVyB3YXMgcmVtb3ZlZCBpbiB0aGlzIHBhdGNoLsKg
IEkgdGhpbmsgaXQgd291bGQgYmUgbW9yZQo+IGFjY3VyYXRlIHRvIHNheToKPiAKPiAvKgo+IMKg
KiBUaGUgYmVsb3cgbG9naWMgZG9lc24ndCB3b3JrIHVubGVzcyB0aGUgbnVtYmVyIG9mIGR3b3Jk
cyBpbiB0aGUKPiDCoCogcGFnZWZhdWx0IHF1ZXVlIGlzIGEgbXVsdGlwbGUgb2YgdGhlIHBhZ2Vm
YXVsdCBtZXNzYWdlIGxlbmd0aC4KClRoYW5rcyBKb25hdGhhbiBhbmQgbWFrZXMgc2Vuc2UgdG8g
bWUuIEknbGwgY2xlYW4gdGhpcyB1cCBpbiB0aGUgbmV4dApyZXZpc2lvbi4KCi1TdHVhcnQKCj4g
wqAqLwo+IAo+IEJ1dCB0aGlzIGlzIGp1c3QgYSBuaXRwaWNrLgo+IFJldmlld2VkLWJ5OiBKb25h
dGhhbiBDYXZpdHQgPGpvbmF0aGFuLmNhdml0dEBpbnRlbC5jb20+Cj4gLUpvbmF0aGFuIENhdml0
dAo+IAo+ID4gK8KgwqDCoMKgwqDCoMKgICovCj4gPiArwqDCoMKgwqDCoMKgwqB4ZV9ndF9hc3Nl
cnQoZ3QsICEocGZfcXVldWUtPnBmX3F1ZXVlX251bV9kdyAlCj4gPiBQRl9NU0dfTEVOX0RXKSk7
Cj4gPiArCj4gPiDCoMKgwqDCoMKgwqDCoMKgc3Bpbl9sb2NrX2lycXNhdmUoJnBmX3F1ZXVlLT5s
b2NrLCBmbGFncyk7Cj4gPiDCoMKgwqDCoMKgwqDCoMKgZnVsbCA9IHBmX3F1ZXVlX2Z1bGwocGZf
cXVldWUpOwo+ID4gwqDCoMKgwqDCoMKgwqDCoGlmICghZnVsbCkgewo+ID4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqBtZW1jcHkocGZfcXVldWUtPmRhdGEgKyBwZl9xdWV1ZS0+aGVh
ZCwgbXNnLCBsZW4gKgo+ID4gc2l6ZW9mKHUzMikpOwo+ID4gLcKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoHBmX3F1ZXVlLT5oZWFkID0gKHBmX3F1ZXVlLT5oZWFkICsgbGVuKSAlCj4gPiBQ
Rl9RVUVVRV9OVU1fRFc7Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcGZfcXVl
dWUtPmhlYWQgPSAocGZfcXVldWUtPmhlYWQgKyBsZW4pICUKPiA+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcGZfcXVldWUtPnBmX3F1ZXVlX251bV9kdzsK
PiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcXVldWVfd29yayhndC0+dXNtLnBm
X3dxLCAmcGZfcXVldWUtPndvcmtlcik7Cj4gPiDCoMKgwqDCoMKgwqDCoMKgfSBlbHNlIHsKPiA+
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZHJtX3dhcm4oJnhlLT5kcm0sICJQRiBR
dWV1ZSBmdWxsLCBzaG91bGRuJ3QgYmUKPiA+IHBvc3NpYmxlIik7Cj4gPiBAQCAtMzg2LDI2ICsz
ODgsNTQgQEAgc3RhdGljIHZvaWQgcGFnZWZhdWx0X2Zpbmkodm9pZCAqYXJnKQo+ID4gwqB7Cj4g
PiDCoMKgwqDCoMKgwqDCoMKgc3RydWN0IHhlX2d0ICpndCA9IGFyZzsKPiA+IMKgwqDCoMKgwqDC
oMKgwqBzdHJ1Y3QgeGVfZGV2aWNlICp4ZSA9IGd0X3RvX3hlKGd0KTsKPiA+ICvCoMKgwqDCoMKg
wqDCoGludCBpOwo+ID4gwqAKPiA+IMKgwqDCoMKgwqDCoMKgwqBpZiAoIXhlLT5pbmZvLmhhc191
c20pCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldHVybjsKPiA+IMKgCj4g
PiDCoMKgwqDCoMKgwqDCoMKgZGVzdHJveV93b3JrcXVldWUoZ3QtPnVzbS5hY2Nfd3EpOwo+ID4g
wqDCoMKgwqDCoMKgwqDCoGRlc3Ryb3lfd29ya3F1ZXVlKGd0LT51c20ucGZfd3EpOwo+ID4gKwo+
ID4gK8KgwqDCoMKgwqDCoMKgZm9yIChpID0gMDsgaSA8IE5VTV9QRl9RVUVVRTsgKytpKQo+ID4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGtmcmVlKGd0LT51c20ucGZfcXVldWVbaV0u
ZGF0YSk7Cj4gPiArfQo+ID4gKwo+ID4gK3N0YXRpYyBpbnQgeGVfYWxsb2NfcGZfcXVldWUoc3Ry
dWN0IHhlX2d0ICpndCwgc3RydWN0IHBmX3F1ZXVlCj4gPiAqcGZfcXVldWUpCj4gPiArewo+ID4g
K8KgwqDCoMKgwqDCoMKgeGVfZHNzX21hc2tfdCBhbGxfZHNzOwo+ID4gK8KgwqDCoMKgwqDCoMKg
aW50IG51bV9kc3MsIG51bV9ldXM7Cj4gPiArCj4gPiArwqDCoMKgwqDCoMKgwqBiaXRtYXBfb3Io
YWxsX2RzcywgZ3QtPmZ1c2VfdG9wby5nX2Rzc19tYXNrLCBndC0KPiA+ID5mdXNlX3RvcG8uY19k
c3NfbWFzaywKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBYRV9NQVhfRFNT
X0ZVU0VfQklUUyk7Cj4gPiArCj4gPiArwqDCoMKgwqDCoMKgwqBudW1fZHNzID0gYml0bWFwX3dl
aWdodChhbGxfZHNzLCBYRV9NQVhfRFNTX0ZVU0VfQklUUyk7Cj4gPiArwqDCoMKgwqDCoMKgwqBu
dW1fZXVzID0gYml0bWFwX3dlaWdodChndC0+ZnVzZV90b3BvLmV1X21hc2tfcGVyX2RzcywKPiA+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoFhFX01BWF9FVV9GVVNFX0JJVFMpICogbnVtX2RzczsKPiA+ICsKPiA+ICvCoMKgwqDC
oMKgwqDCoC8qIHVzZXIgY2FuIGlzc3VlIHNlcGFyYXRlIHBhZ2UgZmF1bHRzIHBlciBFVSBhbmQg
cGVyIENTICovCj4gPiArwqDCoMKgwqDCoMKgwqBwZl9xdWV1ZS0+cGZfcXVldWVfbnVtX2R3ID0K
PiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAobnVtX2V1cyArIFhFX05VTV9IV19F
TkdJTkVTKSAqIFBGX01TR19MRU5fRFc7Cj4gPiArCj4gPiArwqDCoMKgwqDCoMKgwqBwZl9xdWV1
ZS0+Z3QgPSBndDsKPiA+ICvCoMKgwqDCoMKgwqDCoHBmX3F1ZXVlLT5kYXRhID0ga3phbGxvYyhw
Zl9xdWV1ZS0+cGZfcXVldWVfbnVtX2R3LAo+ID4gR0ZQX0tFUk5FTCk7Cj4gPiArwqDCoMKgwqDC
oMKgwqBzcGluX2xvY2tfaW5pdCgmcGZfcXVldWUtPmxvY2spOwo+ID4gK8KgwqDCoMKgwqDCoMKg
SU5JVF9XT1JLKCZwZl9xdWV1ZS0+d29ya2VyLCBwZl9xdWV1ZV93b3JrX2Z1bmMpOwo+ID4gKwo+
ID4gK8KgwqDCoMKgwqDCoMKgcmV0dXJuIDA7Cj4gPiDCoH0KPiA+IMKgCj4gPiDCoGludCB4ZV9n
dF9wYWdlZmF1bHRfaW5pdChzdHJ1Y3QgeGVfZ3QgKmd0KQo+ID4gwqB7Cj4gPiDCoMKgwqDCoMKg
wqDCoMKgc3RydWN0IHhlX2RldmljZSAqeGUgPSBndF90b194ZShndCk7Cj4gPiAtwqDCoMKgwqDC
oMKgwqBpbnQgaTsKPiA+ICvCoMKgwqDCoMKgwqDCoGludCBpLCByZXQgPSAwOwo+ID4gwqAKPiA+
IMKgwqDCoMKgwqDCoMKgwqBpZiAoIXhlLT5pbmZvLmhhc191c20pCj4gPiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoHJldHVybiAwOwo+ID4gwqAKPiA+IMKgwqDCoMKgwqDCoMKgwqBm
b3IgKGkgPSAwOyBpIDwgTlVNX1BGX1FVRVVFOyArK2kpIHsKPiA+IC3CoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqBndC0+dXNtLnBmX3F1ZXVlW2ldLmd0ID0gZ3Q7Cj4gPiAtwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgc3Bpbl9sb2NrX2luaXQoJmd0LT51c20ucGZfcXVldWVbaV0u
bG9jayk7Cj4gPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgSU5JVF9XT1JLKCZndC0+
dXNtLnBmX3F1ZXVlW2ldLndvcmtlciwKPiA+IHBmX3F1ZXVlX3dvcmtfZnVuYyk7Cj4gPiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0ID0geGVfYWxsb2NfcGZfcXVldWUoZ3QsICZn
dC0+dXNtLnBmX3F1ZXVlW2ldKTsKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBp
ZiAocmV0KQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqByZXR1cm4gcmV0Owo+ID4gwqDCoMKgwqDCoMKgwqDCoH0KPiA+IMKgwqDCoMKgwqDCoMKgwqBm
b3IgKGkgPSAwOyBpIDwgTlVNX0FDQ19RVUVVRTsgKytpKSB7Cj4gPiDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoGd0LT51c20uYWNjX3F1ZXVlW2ldLmd0ID0gZ3Q7Cj4gPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0X3R5cGVzLmgKPiA+IGIvZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX2d0X3R5cGVzLmgKPiA+IGluZGV4IDM4YTBkMGUxNzhjOC4uMjYzYTYwNGI3NmI3
IDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0X3R5cGVzLmgKPiA+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndF90eXBlcy5oCj4gPiBAQCAtMjMzLDkgKzIzMywx
NCBAQCBzdHJ1Y3QgeGVfZ3Qgewo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBz
dHJ1Y3QgcGZfcXVldWUgewo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgLyoqIEB1c20ucGZfcXVldWUuZ3Q6IGJhY2sgcG9pbnRlciB0byBHVCAqLwo+
ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgc3RydWN0
IHhlX2d0ICpndDsKPiA+IC0jZGVmaW5lIFBGX1FVRVVFX05VTV9EV8KgwqDCoMKgwqDCoMKgwqAx
MjgKPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoC8q
KiBAdXNtLnBmX3F1ZXVlLmRhdGE6IGRhdGEgaW4gdGhlIHBhZ2UKPiA+IGZhdWx0IHF1ZXVlICov
Cj4gPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHUzMiBk
YXRhW1BGX1FVRVVFX05VTV9EV107Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoHUzMiAqZGF0YTsKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgLyoqCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCAqIEB1c20ucGZfcXVldWVfbnVtX2R3OiBudW1iZXIgb2YgRFdP
UkRTCj4gPiBpbiB0aGUgcGFnZQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgKiBmYXVsdCBxdWV1ZS4gRHluYW1pY2FsbHkgY2FsY3VsYXRlZAo+ID4g
YmFzZWQgb24gdGhlIG51bWJlcgo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgKiBvZiBjb21wdXRlIHJlc291cmNlcyBhdmFpbGFibGUuCj4gPiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqLwo+ID4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB1MzIgcGZfcXVldWVfbnVt
X2R3Owo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
LyoqCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
KiBAdXNtLnBmX3F1ZXVlLnRhaWw6IHRhaWwgcG9pbnRlciBpbiBEV3MKPiA+IGZvciBwYWdlIGZh
dWx0IHF1ZXVlLAo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgICogbW92ZWQgYnkgd29ya2VyIHdoaWNoIHByb2Nlc3NlcyBmYXVsdHMKPiA+IChjb25z
dW1lcikuCj4gPiAtLSAKPiA+IDIuMzQuMQo+ID4gCj4gPiAKCg==
