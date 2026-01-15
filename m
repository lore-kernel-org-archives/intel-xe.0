Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 368D7D44C71
	for <intel-xe@archiver.kernel.org>; Thu, 15 Jan 2026 16:10:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC74310E188;
	Thu, 15 Jan 2026 16:10:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g4EveWGq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5F0E10E188
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Jan 2026 16:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768493447; x=1800029447;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=V5HyUPG+dgeXkuVuBKIBlBwdGb134Urg+tPzScuhalU=;
 b=g4EveWGqa7NI8pjGiOHQ/cGk4W4Vh4RLTJbQEtfemCiYrW4frKSDtn8M
 s3KNvbAe3R1y7TqAq5rCRvlYzs5R3mxOUO7zh5XNXbhfeCsp8f+5X7AzQ
 VUU3yB15L2ov+9tV3w81USfPpx0/jStm2F1YDAr22MQGQF3yyKA2czr6G
 ky04IUukKCLr6oerYSmR7BRvhkkD6LbPBDrO3+FxzWwJcbGl8lrydXUTF
 1PYIcCsiF5A4gXiHvb495UTfa6R89b2n3cXKZQNtA9O7+b8FzMCPKlUzn
 hKJoQS2TZAlAjE2N1rk/IjVj9JZTS1VxfxJKmO6fUveucsDiqYK9S0E4D A==;
X-CSE-ConnectionGUID: xapkg/ziThi2kdjkOCIjGw==
X-CSE-MsgGUID: rzBAJ6CXQ42eo7G4Z2kWuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="69968488"
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; d="scan'208";a="69968488"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2026 08:10:46 -0800
X-CSE-ConnectionGUID: u3455BKQTC6+W/6xUrGYVw==
X-CSE-MsgGUID: tK/qGY4tSbSagflJYQP+Pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; d="scan'208";a="209848302"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2026 08:10:44 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 15 Jan 2026 08:10:44 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 15 Jan 2026 08:10:44 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.36) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 15 Jan 2026 08:10:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fHCvnJoz12yevItiX/6v2TMPEiiL52xXc3BZM5AOTsJDbmWv5zBc1WUwBWvTY0By5+6nQebTWT3AUWisx8ggxpWOe9QTzbt3xRZFBWoOQLKWKALh7GLS1IOWn/1igcAhzrGuTSYP2Aj+hrtaOWhdBSmTjZ0SNQKZDeQuHJuE5Ip1szEZNQrsnWktN+NOEl4d5rDQRf4pAsUrZd2w0VtC+TF6JJGEPmd65DPN1eDbnBmIGsO90VV1GYzW4BBSJw+bcMnvkoEk6s1kqc4lMbzFKFaw3B7jSTSoBQ+jgd/3OOfOHByKOyW7p8N3vOG9jYzcRM6MVKyynJ9pfd9WabGD7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V5HyUPG+dgeXkuVuBKIBlBwdGb134Urg+tPzScuhalU=;
 b=SPKID0sB1phDs/j3ZAVtRakJaeRw8gFu1fi1mX/kVznYxy+pojcrWaZIqJV6diQwu7s3+7P5yuT5gCnZa+eWwxBw6eksg5E9p6p4v/4wqq+iD6DQogBHiY8QtLnv0j2gGHxrv1g9ks5LDHLOh3A1z+HYRrXfhoTT3YCV4FG9fHB3h2ES2St3X4mkBixCO3QrvB8MBZynu7dXpoYKNiS5BFxbh29GAbmJsuw/JqhZ959TCH9L+elTX25E0hPhtzFWDHs2Osr+KpTYKEhlzQwoDrXa7sOfPKOeBnIAtnFMmPlCURcvbUlSSTtVAWfXiqrJdc6Ne/QtMcawSmQBB9lTCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6418.namprd11.prod.outlook.com (2603:10b6:208:3aa::18)
 by CY5PR11MB6367.namprd11.prod.outlook.com (2603:10b6:930:39::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Thu, 15 Jan
 2026 16:10:39 +0000
Received: from IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::b831:13bc:a1c9:2628]) by IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::b831:13bc:a1c9:2628%4]) with mapi id 15.20.9520.005; Thu, 15 Jan 2026
 16:10:39 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: "Vijay, Anoop C" <anoop.c.vijay@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Nerlige Ramappa, Umesh" <umesh.nerlige.ramappa@intel.com>, "Nilawar,
 Badal" <badal.nilawar@intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>, "Tauro, Riana"
 <riana.tauro@intel.com>, "Gupta, Anshuman" <anshuman.gupta@intel.com>,
 "Roper, Matthew D" <matthew.d.roper@intel.com>, "Luse, Paul E"
 <paul.e.luse@intel.com>, "V, Mohamed Mansoor" <mohamed.mansoor.v@intel.com>,
 "Nasim, Kam" <kam.nasim@intel.com>
Subject: RE: [PATCH v3 2/6] drm/xe/sysctrl: Add System Controller types and
 structures
Thread-Topic: [PATCH v3 2/6] drm/xe/sysctrl: Add System Controller types and
 structures
Thread-Index: AQHcgJdMReDpq3bdtkatVyzLXapdc7VTcNsA
Date: Thu, 15 Jan 2026 16:10:39 +0000
Message-ID: <IA1PR11MB6418F3CB5C97371BAFF549A8C18CA@IA1PR11MB6418.namprd11.prod.outlook.com>
References: <20260108120548.1015154-8-anoop.c.vijay@intel.com>
 <20260108120548.1015154-10-anoop.c.vijay@intel.com>
In-Reply-To: <20260108120548.1015154-10-anoop.c.vijay@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6418:EE_|CY5PR11MB6367:EE_
x-ms-office365-filtering-correlation-id: 756b72a4-dc74-44f5-227a-08de5450a033
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?utf-8?B?NlNWRlZHNzMwcytUS3ladEN3aE1LeUhnd0ovTEYzYUpDaTBvSUJGaC8zSXRW?=
 =?utf-8?B?ZlZJdFM5dzNRYjltNGRrbFVBVk1SM2ZoU3RMbDlGOEJoeEdnS2NDL1djNzho?=
 =?utf-8?B?eS9pYjRra25zZWV2d2hJdk5QZld6L3hIYU9nM0hNRTZ5bW11UFNIM0Nncklk?=
 =?utf-8?B?NHdqWkNrZm1mMU1xZ0R0YzF5U1VyRWdRdmdwVHVibFJ3bmdyTVNOV1RVdVN2?=
 =?utf-8?B?TUZNcVRnVGVDM1gyQ01MSlBmRjE0bGhUSmk1T0tHTml1dUh2ckpqdlk3a2NI?=
 =?utf-8?B?YnlGN0NXM3hBZGI5V1JrblRpQ0YvbTUwZy9RRzc1ZTdqdlRPNEowUnB6SlJZ?=
 =?utf-8?B?cXV0Y2lkL0hTRzlUenFyRVY2QXlGeStRc3RmNDF2N0NlakZSYnM4TGxRS29K?=
 =?utf-8?B?Ukh5RVYxZTVYUG9UOHFEOUE5Q3lKeEU2R3dSWkQ3b29Uank1QndONW51Nm1h?=
 =?utf-8?B?Z0tibmxHTXhtb2IzNFFOSFJ3dmhONnJpWFlOZjBlZnFiS3YvMHlMdk45MWNh?=
 =?utf-8?B?Q1F6QzB2MWQ2cmVybUthak45QVpZbjFJei9FQm45bndWV0tQSTFOOW8rZnVq?=
 =?utf-8?B?YjRVdndXaFI0c2lOY0JlbDEyY0x0RXlEV2dzNWRUckRVSkQ4b3AxSVo1S01h?=
 =?utf-8?B?L1lFQTRvanQ4RXc3MkVFSGY4L1Vsbm5iTjErNUhhS0E2MWd0M2Y4QW5jYjVI?=
 =?utf-8?B?MFJJSGpPVjRWZ2xPZ1ZZTnlKOUwrVG9TdUw4anVyeXFaajNyUHZ6MVlUNnRH?=
 =?utf-8?B?NWZhM003YVJZSXdLdjc1N1FZc2FHNXVhL3c2VzlUYVdac3hOV2NOVUM0WnNu?=
 =?utf-8?B?TE03UWVWM3FaLzFleTEvMWMvZ0Q3WWQvUUl0MDhueFBtc2dYcFE2UVU5ZFFR?=
 =?utf-8?B?NjdKRTdvUHpCSFNUUFp4OWxzZk1RcDFzV1pKeVJsZGY3QWxYaUkrMVJ6ZnFD?=
 =?utf-8?B?QWNtZUo4L3grMmt3RWdXd0xDNTcwOG1zVDR4a2hPekpNQi9tR1dldDlXcVFI?=
 =?utf-8?B?WU1Xc3M2WGQydG5iRnk1aE55eXhvRjhYM0hPeGovRXJVNXE4d3FMcjZMSzdv?=
 =?utf-8?B?bVk0YW1HNTlnK3JESkRucnRiWVk0b2hBRUtXellkalhNYWt0R0ZLSzVMSXZ3?=
 =?utf-8?B?MGxWZGJYb1grSFE4b3VFK3ZDa2xoUnVpeEVRRTBVSnVBaDBtTDV0dUI3OEEv?=
 =?utf-8?B?dzUvQldKVVQ4VEkxWkpCRHdneDV2M280bndndXlvVWZ1bktTS1AvbGRJL2l1?=
 =?utf-8?B?SEkwZ0lyeXR3QzZ4UldkL1ZnWGNGckpDbnpQVjRBbkdFSE1EL013aWRUbXJr?=
 =?utf-8?B?enMxYnVPQjBtdkdqenkrbGZMa0pEejNKRTdpQ2JITDV5QUxWT0d5Ym5NZ3B5?=
 =?utf-8?B?Ykp4bUVqK0JmWCsxWS9yZzRSc1lyTXA5VG9oMjN1bnFDL1pOM0RiZDVmYjFZ?=
 =?utf-8?B?UzFPNTFXNHlRRnlxc2ZOOU4vUVpCN0I0eWcwMXRuUG1nOWl0bUFsSFdxWnVL?=
 =?utf-8?B?ZzNVa0V1Q0czUWVWMDdlSU95MFVCeUtZWWNOUnV6RGsxS3VZODhtWXI0NU5Y?=
 =?utf-8?B?eU5GRE9wVlBOTWsxRitNYUFxdGxQQUhLV0ozS1MxeFdpOGs0b3dERFRpZ3RH?=
 =?utf-8?B?cHlmVWcwRW1Pd2lGZktRS29nTUlYUXM4ZFY1cUxoVHBxdnBYTmpSUkNvM2FL?=
 =?utf-8?B?L0lldTdXMDVoYXkxbStFTUl2b2p3cGlmV2FZV3Y3Sm1RaDlQZHhkN3c4TGw4?=
 =?utf-8?B?R08yL2VCQlFvMjVkMWNsM0tjOXhZU01ZQlNmazZwYXZodGx0VkZEaWw2Q25r?=
 =?utf-8?B?OFRXelZReEEyZTd2K3FNdVVUMDFCVUZLMHdtZ1hTckFTamRveXFVWEZDOFpH?=
 =?utf-8?B?WFRVL0tRU25QdnlkYm8raTY1RGtid2FDYm1GdGRFTmpRakxKN2liRFhxSCtG?=
 =?utf-8?B?N3IwRWVKWnVTWEtiYjVxbUpOdldTaDhzR3NqWW5SMjJHNW9GVHdub3g2Q0hj?=
 =?utf-8?B?OHR6RW1TczlNMEFnSmQ1UFJkbm5zUHVvNlFDdlhpSWdnUFJ1RmYvZDg4ZHh2?=
 =?utf-8?B?NW80azJ3L0xXeDllM0N4ZzVQZXdRTEJEeDQyQUlzSW5vdnBSaWFybnVzMkhV?=
 =?utf-8?B?TkFWSzNLWm9CajhwcC94bmVhbHZkVW1Oci9DRmZEUkdLa2NFT3dwd0V3MFI3?=
 =?utf-8?Q?/f4jj/42CRoJjYcZfPsQECg=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6418.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WVlRWGxGb2dSdDJBRVJ0a1hoQWE2Rm5HN1BtUEJ2dGRZRTdJejBRdy9HZWtw?=
 =?utf-8?B?L3pYOXAxWEFLQXgxRVBic29ITzMzMUE0RlByR0pZQysxVEZHdHlkWjNIQy83?=
 =?utf-8?B?Sk5vQTZxdUZwUlpqK1R4ZXlKeUIwcEdQZWpYN2JJY1djMVczOVBZdFdoWW1L?=
 =?utf-8?B?Q2s2djAwOWtIZk1GbmZQdVgyUHNmbjR4cjdQcER2Sk9zSnpGMVhRWlNDaEV0?=
 =?utf-8?B?TUVOdi9meXZQYm0rTSs2WTNqVi9YRStKdEVNbThlTXQ5T1ZpQ2c4TERCNjFW?=
 =?utf-8?B?aDN0NnVYOFlQTDZGMFBtb0dqSzA0TU9YRnZXQmhYTEVyOUhHODBScE9yRUN6?=
 =?utf-8?B?K25hVDFuQjRMUWtDZk1nSU9BazBaM2JQUHhReE1CTG9wNGc2VHlJVElDcXFT?=
 =?utf-8?B?ODRmTFBvbFpvT3BSMkJPTXhXVVo3eXR6dHZ1OFpjOGVTNzJROGEvenpxaE1l?=
 =?utf-8?B?bmk0ZmJNb250QnUvRm9xRmVxWlRqRitOb21MbFVYcklPaTR5aWhiYWlqbTVj?=
 =?utf-8?B?ZElGeHpYYUFoZzE5Z3Q4R21GNU51R0NGVFM5UjZVNHBOTEs0d3dCb0k3Q1do?=
 =?utf-8?B?NFFxOHd2U3h0cVZjbURSY2NxTEIxRXRDV0JBWWdDRTB5RWs4MXpKV0RSakZF?=
 =?utf-8?B?ZFhQaGlVUnVhMjI4YnNLZTVwdkNnL0VwNTBaWFZUNGRvbmVUNXRHb29mUys4?=
 =?utf-8?B?VE9YNVQ5c0VYVThsc0U5aGFFT0dTZFFBR1cwYUJqWGQ1VUtBOFNieXhETWpW?=
 =?utf-8?B?MU1kVnN0Y0RNcXhKWGcwTFQxR1Rxclh1eGlZMGhkM2VOdjYzbnB0blV6TmYz?=
 =?utf-8?B?RDhGajFxV296MENQdEpLdTlnK2RmaUNQNkdJY01abTVBM2tseldiclZaejlz?=
 =?utf-8?B?aXoxZ3JIRFBNeHpiaW5kSjZzMnJvcER0cXBEdktIaCtYRVhmREZoS20wQ25L?=
 =?utf-8?B?VWdhWHpoQWNnbXlSY21tNjlwM0xuME0vL0VsVTNFeVJxSEkrVXAxZW5FME15?=
 =?utf-8?B?dTNlZ1FMMWYyOUk0QmVXcEFxWVErOGJ5eDZOd1h4NTBTSWNoM1pwSGhUYjNi?=
 =?utf-8?B?Ymc5S3dUZFhRQnl0cDhKSlJzVkQya3FmZGdITHpPYkFnS2FHWW1RMFdvZEps?=
 =?utf-8?B?N1ZXYXdvUVZHNVdVKzZtQlJheXBCU1pseE5RamtZTlFwWUVJSmE4Y0FPQ3Q5?=
 =?utf-8?B?UW9yeUh5RlVzNHU3OWhUaVFlaDRQY0R5LzFodVFLWC9VUDR1Z1J1bnV2L3E5?=
 =?utf-8?B?ekxlK3NUT0lmbVFpeVdWSTJCR3NTRzBtYkl3UUgrdzNBY1M1czVJb1FnMkJY?=
 =?utf-8?B?NDJpWS9kQ04rRlk1aHNyUVVHMk1rRnNaSkJZRWF1U0lEczhXUEpFeElYMGpF?=
 =?utf-8?B?eHJkb1B6RkxPcGl3eWUzY3I4bmduMEluV0YrT0wrQVg3YVhZY1daUFdHeHhs?=
 =?utf-8?B?REpUTlZhU2gzK0JjRjRkdVMzMjRoMVdiaUNjMUlZL3FtR29aWmUreEpCM0xD?=
 =?utf-8?B?UzZLbUgvNlM1ZTZma0lKUm02Y0E5WTZlQWtKMkdKcUVvRWhmUHhPRVduT2xm?=
 =?utf-8?B?eWtzeUYrTjZiYkhlZjhoTEYzWEt2Mkp0eHBWaWM2VEQ0MllNTnl0d09URjc2?=
 =?utf-8?B?NzJrRk1Za2pqMzg0RDMvS1JjQ3pRVzgwdkI2cDJVNG84UmpLeWhmdmk3dVpD?=
 =?utf-8?B?cm9tYUE2OXBSM3NZdE9udHUrbW5RSEZCT2trNTQyNFhQMi95Y2ZEQkszUGFj?=
 =?utf-8?B?NFIyRHF6RDFjTGJOeW5Ya2Q5VEEvL2xsQTYwNDhvRXFzQWEya2d2eStqeGlG?=
 =?utf-8?B?b3kySFFla0NvVU5Rb2pnV1JxSUEwc1ZuY0FHc0FJbkh2OWNrWGlUU0ttekRB?=
 =?utf-8?B?UHkxMlUvZUdETC9aM1hxM3RKeVZzWmVBc0VCV3A5cDJraXZrWmt2U3RWU0Ey?=
 =?utf-8?B?OHBBL1pmQXlCTFFiQkR3bktZRHpCVTE3OXI1YUo3enc0eFpQaWkyWml6amFp?=
 =?utf-8?B?ZFByUmw1c0wwL01iWDUzaU5wTHNtR3pRNENVNVVLR1hWRzZSV1hKV3Bwb1lh?=
 =?utf-8?B?WEF5UHhSQ0lteFN4Vm9KS0VlY2RmdFZSSTRlWC9Kbi9LWjloTjhYbkFKalAv?=
 =?utf-8?B?UHl6SXBER3RFUEMxbHEwTWhVek9oblhGK2JyWnh4UkJ1dDRmTWFidGY1WWlW?=
 =?utf-8?B?UXRTMEVLN1JyQ1RNN1dyTE9sTWU2a2VBcHEzL3M1cU8yZGJHNnBHNGVTemxy?=
 =?utf-8?B?ZXRVdDR4TVNSUHZpL2tUL0ppdUF4OVBXY2Q5Z2JUMnhJeXRXY1hBc2pqVkd1?=
 =?utf-8?B?UVRiRHFZRm1aUXNRdWowTDYxbHc3OFI4YkJJb0lmZHZnT3N2Vm9sUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6418.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 756b72a4-dc74-44f5-227a-08de5450a033
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jan 2026 16:10:39.4294 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gVaM4yBOih/IAZ8SZfvWS8CW3Oc55Kh9CS9btoQVosHI3HpFZrs/MKTUwrReK8VTYAMfU96yAAGf/ZITCpTpXCXYcfOuPdLgCKWP4AE9ilk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6367
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

DQoNCj4tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPkZyb206IFZpamF5LCBBbm9vcCBDIDxh
bm9vcC5jLnZpamF5QGludGVsLmNvbT4NCj5TZW50OiBUaHVyc2RheSwgSmFudWFyeSA4LCAyMDI2
IDc6MDYgQU0NCj5UbzogaW50ZWwteGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+Q2M6IE5lcmxp
Z2UgUmFtYXBwYSwgVW1lc2ggPHVtZXNoLm5lcmxpZ2UucmFtYXBwYUBpbnRlbC5jb20+OyBOaWxh
d2FyLA0KPkJhZGFsIDxiYWRhbC5uaWxhd2FyQGludGVsLmNvbT47IFZpdmksIFJvZHJpZ28gPHJv
ZHJpZ28udml2aUBpbnRlbC5jb20+Ow0KPklkZGFtc2V0dHksIEFyYXZpbmQgPGFyYXZpbmQuaWRk
YW1zZXR0eUBpbnRlbC5jb20+OyBUYXVybywgUmlhbmENCj48cmlhbmEudGF1cm9AaW50ZWwuY29t
PjsgR3VwdGEsIEFuc2h1bWFuIDxhbnNodW1hbi5ndXB0YUBpbnRlbC5jb20+Ow0KPlJvcGVyLCBN
YXR0aGV3IEQgPG1hdHRoZXcuZC5yb3BlckBpbnRlbC5jb20+OyBSdWhsLCBNaWNoYWVsIEoNCj48
bWljaGFlbC5qLnJ1aGxAaW50ZWwuY29tPjsgTHVzZSwgUGF1bCBFIDxwYXVsLmUubHVzZUBpbnRl
bC5jb20+OyBWLCBNb2hhbWVkDQo+TWFuc29vciA8bW9oYW1lZC5tYW5zb29yLnZAaW50ZWwuY29t
PjsgTmFzaW0sIEthbQ0KPjxrYW0ubmFzaW1AaW50ZWwuY29tPjsgVmlqYXksIEFub29wIEMgPGFu
b29wLmMudmlqYXlAaW50ZWwuY29tPg0KPlN1YmplY3Q6IFtQQVRDSCB2MyAyLzZdIGRybS94ZS9z
eXNjdHJsOiBBZGQgU3lzdGVtIENvbnRyb2xsZXIgdHlwZXMgYW5kDQo+c3RydWN0dXJlcw0KPg0K
PkZyb206IEFub29wIFZpamF5IDxhbm9vcC5jLnZpamF5QGludGVsLmNvbT4NCj4NCj5BZGQgdHlw
ZSBkZWZpbml0aW9ucyBhbmQgaGVhZGVyIGRlY2xhcmF0aW9ucyBmb3IgU3lzdGVtDQo+Q29udHJv
bGxlciBtYWlsYm94IGNvbW11bmljYXRpb24gcHJvdG9jb2wuDQo+DQo+U2lnbmVkLW9mZi1ieTog
QW5vb3AgVmlqYXkgPGFub29wLmMudmlqYXlAaW50ZWwuY29tPg0KPi0tLQ0KPiBkcml2ZXJzL2dw
dS9kcm0veGUveGVfc3lzY3RybF9tYWlsYm94LmggICAgICAgfCAzNSArKysrKysrKysrKysrKysr
KysNCj4gZHJpdmVycy9ncHUvZHJtL3hlL3hlX3N5c2N0cmxfbWFpbGJveF90eXBlcy5oIHwgMzYg
KysrKysrKysrKysrKysrKysrKw0KPiBkcml2ZXJzL2dwdS9kcm0veGUveGVfc3lzY3RybF90eXBl
cy5oICAgICAgICAgfCAyMyArKysrKysrKysrKysNCj4gMyBmaWxlcyBjaGFuZ2VkLCA5NCBpbnNl
cnRpb25zKCspDQo+IGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0veGUveGVfc3lz
Y3RybF9tYWlsYm94LmgNCj4gY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS94ZS94
ZV9zeXNjdHJsX21haWxib3hfdHlwZXMuaA0KPiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9n
cHUvZHJtL3hlL3hlX3N5c2N0cmxfdHlwZXMuaA0KPg0KPmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0veGUveGVfc3lzY3RybF9tYWlsYm94LmgNCj5iL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9z
eXNjdHJsX21haWxib3guaA0KPm5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+aW5kZXggMDAwMDAwMDAw
MDAwLi43NTBiNzUyOGJhYjINCj4tLS0gL2Rldi9udWxsDQo+KysrIGIvZHJpdmVycy9ncHUvZHJt
L3hlL3hlX3N5c2N0cmxfbWFpbGJveC5oDQo+QEAgLTAsMCArMSwzNSBAQA0KPisvKiBTUERYLUxp
Y2Vuc2UtSWRlbnRpZmllcjogTUlUICovDQo+Ky8qDQo+KyAqIENvcHlyaWdodCDCqSAyMDI2IElu
dGVsIENvcnBvcmF0aW9uDQo+KyAqLw0KPisNCj4rI2lmbmRlZiBfX1hFX1NZU0NUUkxfTUFJTEJP
WF9IX18NCj4rI2RlZmluZSBfX1hFX1NZU0NUUkxfTUFJTEJPWF9IX18NCj4rDQo+KyNpbmNsdWRl
IDxsaW51eC9iaXRmaWVsZC5oPg0KPisjaW5jbHVkZSA8bGludXgvdHlwZXMuaD4NCj4rDQo+K3N0
cnVjdCB4ZV9zeXNjdHJsOw0KPitzdHJ1Y3QgeGVfZGV2aWNlOw0KPitzdHJ1Y3QgeGVfc3lzY3Ry
bF9tYWlsYm94X2NvbW1hbmQ7DQo+Kw0KPisjZGVmaW5lIEFQUF9IRFJfR1JPVVBfSURfTUFTSwkJ
R0VOTUFTSyg3LCAwKQ0KPisjZGVmaW5lIEFQUF9IRFJfQ09NTUFORF9NQVNLCQlHRU5NQVNLKDE1
LCA4KQ0KPisjZGVmaW5lIEFQUF9IRFJfVkVSU0lPTl9NQVNLCQlHRU5NQVNLKDIzLCAxNikNCj4r
I2RlZmluZSBBUFBfSERSX1JFU0VSVkVEX01BU0sJCUdFTk1BU0soMzEsIDI0KQ0KPisNCj4rI2Rl
ZmluZSBYRV9TWVNDVFJMX0FQUF9IRFJfR1JPVVBfSUQoaGRyKSBcDQo+KwlGSUVMRF9HRVQoQVBQ
X0hEUl9HUk9VUF9JRF9NQVNLLCBsZTMyX3RvX2NwdSgoaGRyKS0+ZGF0YSkpDQo+Kw0KPisjZGVm
aW5lIFhFX1NZU0NUUkxfQVBQX0hEUl9DT01NQU5EKGhkcikgXA0KPisJRklFTERfR0VUKEFQUF9I
RFJfQ09NTUFORF9NQVNLLCBsZTMyX3RvX2NwdSgoaGRyKS0+ZGF0YSkpDQo+Kw0KPisjZGVmaW5l
IFhFX1NZU0NUUkxfQVBQX0hEUl9WRVJTSU9OKGhkcikgXA0KPisJRklFTERfR0VUKEFQUF9IRFJf
VkVSU0lPTl9NQVNLLCBsZTMyX3RvX2NwdSgoaGRyKS0+ZGF0YSkpDQo+Kw0KPit2b2lkIHhlX3N5
c2N0cmxfbWFpbGJveF9pbml0KHN0cnVjdCB4ZV9zeXNjdHJsICpzYyk7DQo+K2ludCB4ZV9zeXNj
dHJsX3NlbmRfY29tbWFuZChzdHJ1Y3QgeGVfZGV2aWNlICp4ZSwNCj4rCQkJICAgIHN0cnVjdCB4
ZV9zeXNjdHJsX21haWxib3hfY29tbWFuZCAqY21kLA0KPisJCQkgICAgc2l6ZV90ICpyZGF0YV9s
ZW4pOw0KPisNCj4rI2VuZGlmIC8qIF9fWEVfU1lTQ1RSTF9NQUlMQk9YX0hfXyAqLw0KPmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfc3lzY3RybF9tYWlsYm94X3R5cGVzLmgNCj5i
L2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9zeXNjdHJsX21haWxib3hfdHlwZXMuaA0KPm5ldyBmaWxl
IG1vZGUgMTAwNjQ0DQo+aW5kZXggMDAwMDAwMDAwMDAwLi4xZjMxNWFkMWI5OTYNCj4tLS0gL2Rl
di9udWxsDQo+KysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3N5c2N0cmxfbWFpbGJveF90eXBl
cy5oDQo+QEAgLTAsMCArMSwzNiBAQA0KPisvKiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogTUlU
ICovDQo+Ky8qDQo+KyAqIENvcHlyaWdodCDCqSAyMDI2IEludGVsIENvcnBvcmF0aW9uDQo+KyAq
Lw0KPisNCj4rI2lmbmRlZiBfX1hFX1NZU0NUUkxfTUFJTEJPWF9UWVBFU19IX18NCj4rI2RlZmlu
ZSBfX1hFX1NZU0NUUkxfTUFJTEJPWF9UWVBFU19IX18NCj4rDQo+KyNpbmNsdWRlIDxsaW51eC90
eXBlcy5oPg0KPisNCj4rc3RydWN0IHhlX3N5c2N0cmxfbWFpbGJveF9ta2hpX21zZ19oZHIgew0K
PisJX19sZTMyIGRhdGE7DQo+K30gX19wYWNrZWQ7DQo+Kw0KPitzdHJ1Y3QgeGVfc3lzY3RybF9t
YWlsYm94X2FwcF9tc2dfaGRyIHsNCj4rCV9fbGUzMiBkYXRhOw0KPit9IF9fcGFja2VkOw0KPisN
Cj4rc3RydWN0IHhlX3N5c2N0cmxfbWFpbGJveF9jb21tYW5kIHsNCj4rCS8qKiBAaGVhZGVyOiBB
cHBsaWNhdGlvbiBtZXNzYWdlIGhlYWRlciBjb250YWluaW5nIGNvbW1hbmQNCj5pbmZvcm1hdGlv
biAqLw0KPisJc3RydWN0IHhlX3N5c2N0cmxfbWFpbGJveF9hcHBfbXNnX2hkciBoZWFkZXI7DQo+
Kw0KPisJLyoqIEBkYXRhX2luOiBQb2ludGVyIHRvIGlucHV0IHBheWxvYWQgZGF0YSAoY2FuIGJl
IE5VTEwgaWYgbm8gaW5wdXQNCj5kYXRhKSAqLw0KPisJdm9pZCAqZGF0YV9pbjsNCj4rDQo+Kwkv
KiogQGRhdGFfaW5fbGVuOiBTaXplIG9mIGlucHV0IHBheWxvYWQgaW4gYnl0ZXMgKDAgaWYgbm8g
aW5wdXQgZGF0YSkgKi8NCj4rCXNpemVfdCBkYXRhX2luX2xlbjsNCj4rDQo+KwkvKiogQGRhdGFf
b3V0OiBQb2ludGVyIHRvIG91dHB1dCBidWZmZXIgZm9yIHJlc3BvbnNlIGRhdGEgKGNhbiBiZQ0K
Pk5VTEwgaWYgbm8gcmVzcG9uc2UpICovDQo+Kwl2b2lkICpkYXRhX291dDsNCj4rDQo+KwkvKiog
QGRhdGFfb3V0X2xlbjogU2l6ZSBvZiBvdXRwdXQgYnVmZmVyIGluIGJ5dGVzICgwIGlmIG5vIHJl
c3BvbnNlDQo+ZXhwZWN0ZWQpICovDQo+KwlzaXplX3QgZGF0YV9vdXRfbGVuOw0KPit9Ow0KPisN
Cj4rI2VuZGlmIC8qIF9fWEVfU1lTQ1RSTF9NQUlMQk9YX1RZUEVTX0hfXyAqLw0KPmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfc3lzY3RybF90eXBlcy5oDQo+Yi9kcml2ZXJzL2dw
dS9kcm0veGUveGVfc3lzY3RybF90eXBlcy5oDQo+bmV3IGZpbGUgbW9kZSAxMDA2NDQNCj5pbmRl
eCAwMDAwMDAwMDAwMDAuLjg4YTM0OTY3Njg4Yg0KPi0tLSAvZGV2L251bGwNCj4rKysgYi9kcml2
ZXJzL2dwdS9kcm0veGUveGVfc3lzY3RybF90eXBlcy5oDQo+QEAgLTAsMCArMSwyMyBAQA0KPisv
KiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogTUlUICovDQo+Ky8qDQo+KyAqIENvcHlyaWdodCDC
qSAyMDI2IEludGVsIENvcnBvcmF0aW9uDQo+KyAqLw0KPisNCj4rI2lmbmRlZiBfWEVfU1lTQ1RS
TF9UWVBFU19IXw0KPisjZGVmaW5lIF9YRV9TWVNDVFJMX1RZUEVTX0hfDQo+Kw0KPisjaW5jbHVk
ZSA8bGludXgvbXV0ZXguaD4NCj4rI2luY2x1ZGUgPGxpbnV4L3R5cGVzLmg+DQo+Kw0KPisvKioN
Cj4rICogc3RydWN0IHhlX3N5c2N0cmwgLSBTeXN0ZW0gQ29udHJvbGxlciBkcml2ZXIgY29udGV4
dA0KPisgKi8NCj4rc3RydWN0IHhlX3N5c2N0cmwgew0KPisJLyoqIEBjbWRfbG9jazogTXV0ZXgg
cHJvdGVjdGluZyBtYWlsYm94IGNvbW1hbmQgb3BlcmF0aW9ucyAqLw0KPisJc3RydWN0IG11dGV4
IGNtZF9sb2NrOw0KPisNCj4rCS8qKiBAcGhhc2VfYml0OiBNS0hJIG1lc3NhZ2UgYm91bmRhcnkg
cGhhc2UgdG9nZ2xlIGJpdCAqLw0KPisJdTMyIHBoYXNlX2JpdDsNCg0KQSAzMiBiaXQgcGhhc2Vf
Yml0PyANCg0KSSBhc3N1bWUgdGhhdCB0aGlzIGhhcyBzb21lIG1lYW5pbmcgaW4gdGhlIE1LSEkg
cHJvdG9jb2w/ICBDYW4gdGhpcyBiZQ0KZXhwYW5kZWQgYSBiaXQuICBQaGFzZSBpbXBsaWVzIG1v
cmUgdGhhbiBvbi9vZmYuLi4gaXMgdGhpcyBkaWZmZXJlbnQgc3RhdGVzPw0KSWYgc28sIHdoeSBp
cyBpdCBvbmx5IGEgYml0Pw0KDQpNDQoNCj4rfTsNCj4rDQo+KyNlbmRpZiAvKiBfWEVfU1lTQ1RS
TF9UWVBFU19IXyAqLw0KPi0tDQo+Mi40My4wDQoNCg==
