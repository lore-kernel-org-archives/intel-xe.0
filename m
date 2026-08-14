Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6FADC5CFC1
	for <intel-xe@archiver.kernel.org>; Fri, 14 Aug 2026 21:21:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8365310F707;
	Fri, 14 Aug 2026 21:21:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a2tr3nuu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83F6A10F707
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Aug 2026 21:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786742500; x=1818278500;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=T8rsgUUA0rjU1zTtkUm7626CLSH6O0t9pKDr1mUBwXU=;
 b=a2tr3nuuFIjsA0FJBZajJmJ6f2JuA3QzqGuZTmi51DS3WwWIAQa2Phir
 1aXJJ4N+cor0D3MVCimgwxnom9UgVIAy35egsxXnsP1g9pBjAkvsb7VGO
 D958g8r5eKEVeZC4lFpazcl7MPCPUwNAptrOwyc676vg3I3zsBrZe00f8
 l+DV5/b36uGoqz20e7MYQ937i3OHWPukTAaIBJVfwIVW62wPXinZYPYSZ
 cLw4y2IslZYOJmQ4yAyEDVWDAfg66Gits7SNPiLV/iH20KjbVoxeWCqn9
 OBBnwiEnrVhu2nChisRrropKSu8VBhvvM3Blme7LdrIUIqv2v+BE4Ueeg A==;
X-CSE-ConnectionGUID: jVEVy3zmQGOsDbDAXOGABw==
X-CSE-MsgGUID: 6bamoVb1QkCSDM5yvcnxjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11875"; a="74856061"
X-IronPort-AV: E=Sophos;i="6.25,224,1779174000"; d="scan'208";a="74856061"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2026 14:21:37 -0700
X-CSE-ConnectionGUID: IMZRJdAUTOuOC7sHdqACRQ==
X-CSE-MsgGUID: eQy7FeH8TjK0jvSkBxVpOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,224,1779174000"; d="scan'208";a="294251780"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2026 14:21:38 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 14 Aug 2026 14:21:37 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Fri, 14 Aug 2026 14:21:37 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.49) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 14 Aug 2026 14:21:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AzzufO+iG+hmsoanBMkSAGXYduchMvO8wsgIJcfKL6WBKjcthRzSslGLj8mfbV0cyexMtbRKWC4QlsMJCWKRQHSKyu54adZkwcZKHQJADKqj0JxwGn/Cth7A42dFNWbNZUQQEpKP41XGGeJRr2edO1kejmJylJgaR84ApWVteT0tC2AkRV4E8J+okmSzAwAaH1fzeYZ0PxXwPEgFTajzP3jDedZ2eJ6TsdoPqwWJHJWhC2q/edrvY+gXoit4gdsv1xiw/wcXoLjqJgtptpVPwkxo7qdtQDGjl1fB9+OAEtW1o//yZ5i/V+GU9Z/YJancMjWFOupP6Yx+CJsFZTC0xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KxURuYQLeNWx2WyH2KVN2FYv5p9h6Jdsbo+xAEH1NTg=;
 b=i9/MTi1/AFLLxQd3ZAax8TMW2nIAcAa9rK7uU/m5dGMZjbh4pDzEuWbk+vG/1QKNu/w3zID1V2OOB6jfsFJDupC/q1m13w0QvEaJbHIoLC75rXWalP/CebDTBT4BmL3damTh7Ad+GsbyA7Tdg1u0YRZbKQwgdPRLBC2DI0mp575UCQtuG1ZVbZJyu8iE6lU9GRJcFixbW8N11nZn/HiH9g9IlbP8Dp351y+uaNCTx10Dff4+blaNUgilKJaqaTrshQvjI1PZ9O6TSbl4xO6yMdGF5JnIgVu6YJ2iwqr+Q2kUEKlQf8bsIBBm6U4qaAwTl36nWZLNIbqH2WhOtDw3Tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by DS7PR11MB7887.namprd11.prod.outlook.com (2603:10b6:8:e2::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.16; Fri, 14 Aug
 2026 21:21:35 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057%3]) with mapi id 15.21.0315.014; Fri, 14 Aug 2026
 21:21:35 +0000
Date: Fri, 14 Aug 2026 14:21:31 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: "Anoop, Vijay" <anoop.c.vijay@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <badal.nilawar@intel.com>,
 <rodrigo.vivi@intel.com>, <aravind.iddamsetty@intel.com>,
 <riana.tauro@intel.com>, <anshuman.gupta@intel.com>,
 <matthew.d.roper@intel.com>, <michael.j.ruhl@intel.com>,
 <paul.e.luse@intel.com>, <mohamed.mansoor.v@intel.com>, <kam.nasim@intel.com>
Subject: Re: [PATCH v7 1/2] drm/xe/sysctrl: Add helper to query application
 status
Message-ID: <an+G21kQjK+AUI9K@soc-5CG1426VCC.clients.intel.com>
References: <20260814095306.2482289-4-anoop.c.vijay@intel.com>
 <20260814095306.2482289-5-anoop.c.vijay@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20260814095306.2482289-5-anoop.c.vijay@intel.com>
X-ClientProxiedBy: MW4PR03CA0290.namprd03.prod.outlook.com
 (2603:10b6:303:b5::25) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|DS7PR11MB7887:EE_
X-MS-Office365-Filtering-Correlation-Id: 0162a891-234c-4fc0-b361-08defa4a04af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|1800799024|3023799007|56012099006|6133799003|10067099003|11063799006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: f5UsREg+Ke1MZPH9xLbSxfwuTnNPs5qXCHoc9T7AN91HIBDVO+ffaZAzagH/acN9sap3Fx6Nc2fAv0eIwek7H+cixkNig34iDZJa0ylrY4APs3/SR9lG7t3KUXidMvzEVeFqNb2Af+Agg7GSuxJwix54j1zoryXhw0T5V6Kxlezbi0F3cW5YG3STjOr94fuZRtyp/xNVeAfCalg/wsTlJT/aP6ktVquHQ4uTQ4S8B3VZCP1VoEO7umlCvsIBIJcZxXF/6l5k/JfhQdBUZrjiTKA/9g3Qys0RIGeo6pFJpBkIWECCpmDpX204IlMRvuv+BfwG34timWmTd9CzNLII/ySWTwkoYDBrpX72jstTgh0U7jwb6b4j4oNPjXTm0iVd8v83NoD8vXyEtYyIyftjpUCeJSwUlE+Xxp40bE6IzeAKK24XdpxTroN4Ln/xmf1XS6MfVjMhSBEoxGD6GOAmheujlTNqAP+ZPfSTBXnbDRH4EOjRCCzZFqc8ATWSEEo24kSFpDlf81HgkUutsEwwhr2Q6IP5z8sYdRBQ8jKT5ncefQT2SlM0T0IsVMJFWoSmzA2RbQ+JKjza0Xf7hm3E0SSb5FKUjiFGFkpRvzDtA9UimwhTXhj6Z201dwOXVpKPR8ek7Qo9mSJh70+4vLFwH/J+asiECp0MDa47QdGllHc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(3023799007)(56012099006)(6133799003)(10067099003)(11063799006)(4143699003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a1ljNkJBb1dISFZuR1JNYkRTZElFeEhIRUdIVFhXNXcxNmRzTDZqcURWdGU4?=
 =?utf-8?B?cUhhdTNwYVc4UVhuekdzWFZHRGdSVHA5MHI4Znd5VXpSem5rZ3cxQWVHQkhh?=
 =?utf-8?B?RllMQlEvUUZhaTZZK1djZ2ZvQnBxTHpvVUpybE0xbzgyQko4emhsTlRNVC85?=
 =?utf-8?B?dDlHWVFKZG91MStvT0FNeEdjTnY5RUFtNE00VXRaU245bVg2OU40dmRqekQz?=
 =?utf-8?B?MmMzWXk2VnppSFp3dWdvK2ZaNUJwNm5lS0p1SDd6dGlKQnFxTnpFR0NMand6?=
 =?utf-8?B?TEU0aUR1YjRwUlprdHd0OU1tdFRiejNVTXlZOUFiZTNUdTF2NjB6eldpL2VT?=
 =?utf-8?B?cUErZ2tEWUJvU0pDNG1qNDZ5Rm5rSFR4OGNlVnJVUk1rdGRyREkrYUROZk00?=
 =?utf-8?B?aUVPOTljV2NTMlR4SzFwOVFhTjBjWWdyODNmMjR1OFhhOWEyWWk1SXpKbzF1?=
 =?utf-8?B?ays4T1BwbkFMd1QxbFVNcGtjVVV2N0t4RzN4ckxpRlVpRTYvRTdzWGI4SGN3?=
 =?utf-8?B?ZU1lL1plSExsTHU0dnJkT3drcEREalhuWjFhVldzcVJyRHNUZlIwVDlFN2pq?=
 =?utf-8?B?cDFJM1JiSWxEcEVFcG5KOE54UFBiRUdHOGpoOVFjUUkvZjRQZmo5NndaTGRh?=
 =?utf-8?B?ZllmZzRRNERwejJ1eFUxTTFqdis5SEVYVzMvb3ZncHkzY3l3MTlwOVhUNTRB?=
 =?utf-8?B?M29rR1EzRW1lRXViaWxHdTByTEhYOHl0STFnSUlSZVh4T1ZNZVFiNTM4MFY1?=
 =?utf-8?B?UjVwM3BIM253dDczSEM0Y3ZNTC9nQTNFOEdkVUllNnRLWTJaRTJ1U09vR0Q1?=
 =?utf-8?B?eDFsWnBtMlVlUnlFK01IRFh2TEdHWnRqc1k1dVJjVTRVRktSTHYrbmc0QTlK?=
 =?utf-8?B?S1JjSTNZcU1hemt1OTNRdVk3dU0rcmVMKzRCNWI0TEFQcWJCNHgrYmQvRG9N?=
 =?utf-8?B?TDhmc3pEVTJLSXpuMUNjWjB5WHVFaERrYmdtQ21nQWxLMnZRdVFPY3dmVWZL?=
 =?utf-8?B?cWQrd0FocHlqRVRvM0NhZTQyZjRpUlBjb3V4LzROYXRQWTJSM1pNWFZYN1ox?=
 =?utf-8?B?a2psTDJmRHJCT1ZTVG9HcWhqRGNrbitFYWdyS1BlOFJPemU0YThJYXBicHA0?=
 =?utf-8?B?ZDUwR0dzYUpHSWwwUUVteTRXUUdJZmdwUDVyQk5FMjJVOUJ2ZFFEMUw0cVBV?=
 =?utf-8?B?d0ZRd2gydUlXZE9ITjA4bWludWcza2pSOVpnMzZRMlhSSit6RVNZTnJWN3VC?=
 =?utf-8?B?RlJRcGNTQWEvSmlLSjFQdk1vU0dNUTIwbWpmNlVGZDR5ejBaUW1RTW15TFVi?=
 =?utf-8?B?VDhpWnhNQ01rMm8yUSt2ZTBFSHpOTUZzVFNMeFBaNW9mVUs0N2pETzNFbmh5?=
 =?utf-8?B?WmIvT3pKb0RrZWtNZlozQXYvMlJmampnM0owc0luQUZNaDBjVGxqc0lKRjRW?=
 =?utf-8?B?eHNBRHo3R25PY3NhQTRxV3d1SXJEcy8yNWpzSTdZY0FEV1VINGw1YWhWV1F6?=
 =?utf-8?B?MklCOXBuZGd0bklZSDdVS3ZiWnIybHhCWTJMQVduVCtHV3JBREx4bFJoMXlx?=
 =?utf-8?B?eWFwZ3R1ZzIvZmEwb0I3cjBNYmE2K1paR0pnYXBlT2lwSzNiSUtweFJtYWJT?=
 =?utf-8?B?S3ZhZEhTQmtpUmNYK24zWkVjSmZaZVUrNXkzc25SQlh4YW96OFR1MG0vUmVC?=
 =?utf-8?B?V2NiYjN5WWh3OUlvRjRmQlhlNVF2Q2c0YlFUNUxPd251UnNmRWJRa0ZEdm1m?=
 =?utf-8?B?TnVEUVROYklpcDUvUXVSZVRXQkpGczkrVVp4WW5mOFNWV1FtVFJEMG9tNGtj?=
 =?utf-8?B?SjFaSVhZd3NtL3lCVUhhd1pNT0V1bmFPUUV2akdHVTJRRGVwUFNsZWJQRGlQ?=
 =?utf-8?B?V1R0dHZHcHRqT0pFN2tVY3lhTjIyR2JnWTZUWmVaL2VPbjBiZ1gvOUI3SHU5?=
 =?utf-8?B?TUwxTmozL2Z0SHhOQ29ZemtnTVI3VmtqUWdLeHB3VjlCSytWV1RIWXc5R3VQ?=
 =?utf-8?B?amprVURPV0FIRHY2YzJZZzBFTy9qV3JjNE95aFhuMDZVUndGbHJmRVhTcUho?=
 =?utf-8?B?eVZuN0JIdDJSSUV2VFZpRGErYWFMUGNRRUlyZFlGWEhGRUNaSXk0QWYyU1hV?=
 =?utf-8?B?bjNkS3VsWlJWWnRBMmxxcWI3QWxaeVUwck1IU3FlVGwwNlhRdXppZlVBUlhB?=
 =?utf-8?B?UXJwRnVWNUx1enpsSHhmcTJDVGI4TzJJVDZ0Z0JxUVdObVhyNXhLQ2ZJcVc3?=
 =?utf-8?B?Yks1Ky8wWTN2VWpaWmxnMW9UOGtLWFJCTElCbUxXem1KQ2tyYk01bHh0bGJY?=
 =?utf-8?B?cUEvS2ZVMWVMa0tUcWozUFhVSkVUcXRsWW9QdjB1UzA0eEIyQWRVLzJSV0xo?=
 =?utf-8?Q?14KSOW1LMqSrmyccj0v4QadsgkwMkrgkpC5op?=
X-Exchange-RoutingPolicyChecked: dktuxYPQZcG8WV8EJa9GdoOAdq1zQUSnhlM4bacDtF5wf+NXAc3e/sAa0V1H5VySC823YsFVexnvJy3ioQFXAK36nkezCKUZn0wkUXmelou/eAHhfbAilDbIP6+n8RXId0rbxMkzYNm36j5asLBzYAI89i91odp4L6w9BoAn4yD4usFzDq03uvuMY59mb6iqmX52VM7f2U6mdiHCNiGHBkDKccTI/GJLD/lH0lsmRy+PhKzqh5aEiKHgN8YBbkUK4BjZCrVbOi0GNm5eFT6E3BuW2Sa58GGQ6WrjUjlLdiue7sJQzKiGQNR2Bt63rvzhJ4rEKrCOOJI1IChNyPzneg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0162a891-234c-4fc0-b361-08defa4a04af
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 21:21:34.8690 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: viA0vYZio1QZEohhRNIk/2743Jf2EtqCtuZr4FBMSMf5+LkO2efZn4JC2rmVBg4B7kqRFD3v2oSJ18+Lq1MqdWNXI5mLzJeqx9lRJjjJvNs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7887
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

On Fri, Aug 14, 2026 at 02:53:06AM -0700, Anoop, Vijay wrote:
>From: Anoop Vijay <anoop.c.vijay@intel.com>
>
>Add xe_sysctrl_check_app_status() to query the state of a System
>Controller application using get_app_status_by_id mailbox command.
>
>The helper maps xe_sysctrl_app_id values to firmware application
>IDs and returns the reported application state. Add a convenience
>wrapper to check diag firmware application readiness.
>
>Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>
>---
>v2: (Badal)
>- Return SysCtrl firmware application states instead of errno for
>  application lifecycle conditions
>
>v3: (Riana, Badal)
>- Replace string-based app identifiers with enum xe_sysctrl_app_id
>- Use get_app_status_by_id (opcode 0x05)
>- Move mailbox definitions to xe_sysctrl_mailbox_types.h
>- Return enum xe_sysctrl_fw_status consistently
>- Map communication failures to COMM_FAILURE
>- Add INITIALIZED state and status helpers
>- Fix Diagnostics typo
>
>v4: (Anshuman)
>- Make xe_sysctrl_check_app_status() internal
>- Remove unused app identifier
>
>v5: (Anshuman)
>- Rename OOBMSM status helper to use xe_sysctrl_* prefix
>- Remove xe_is_diag_fw_ready() helper
>
>v6: (Riana)
>- Use xe_sysctrl_create_command() helper instead of manual FIELD_PREP
>  header packing
>- Rename xe_sysctrl_get_app_status_by_id_{req,resp} to shorter names
>- Use hex constant for application ID
>- Move oCode application readiness helper to a separate patch
>- Add xe_sysctrl_is_diag_fw_ready() helper.
>
>v7: (Umesh)
>- Clarify xe_sysctrl_is_diag_fw_ready() comment for sysctrl-less platforms
>- Move XE_SYSCTRL_APP_RESP_* flags and enum xe_sysctrl_app_id to xe_sysctrl.c
>---
> drivers/gpu/drm/xe/xe_sysctrl.c               | 80 +++++++++++++++++++
> drivers/gpu/drm/xe/xe_sysctrl.h               |  1 +
> drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h | 47 +++++++++++
> 3 files changed, 128 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_sysctrl.c b/drivers/gpu/drm/xe/xe_sysctrl.c
>index 1db20be8158b..c53a26af3189 100644
>--- a/drivers/gpu/drm/xe/xe_sysctrl.c
>+++ b/drivers/gpu/drm/xe/xe_sysctrl.c
>@@ -13,9 +13,11 @@
> #include "xe_device.h"
> #include "xe_mmio.h"
> #include "xe_pm.h"
>+#include "xe_printk.h"
> #include "xe_soc_remapper.h"
> #include "xe_sysctrl.h"
> #include "xe_sysctrl_mailbox.h"
>+#include "xe_sysctrl_mailbox_types.h"
> #include "xe_sysctrl_types.h"
>
> /**
>@@ -29,6 +31,20 @@
>  * This module provides initialization and support code for interacting
>  * with System Controller through the mailbox interface.
>  */
>+
>+/* Application status flags reported in xe_sysctrl_app_status_resp.flags */
>+#define XE_SYSCTRL_APP_RESP_VALID	BIT(0)
>+#define XE_SYSCTRL_APP_RESP_BOOTED	BIT(1)
>+#define XE_SYSCTRL_APP_RESP_INITIALIZED	BIT(2)
>+
>+/*
>+ * Known System Controller application identifiers, keyed by firmware
>+ * application ID.
>+ */
>+enum xe_sysctrl_app_id {
>+	XE_SYSCTRL_APP_DIAG	= 0x0D,
>+};
>+
> static void sysctrl_fini(void *arg)
> {
> 	struct xe_device *xe = arg;
>@@ -130,3 +146,67 @@ void xe_sysctrl_pm_resume(struct xe_device *xe)
>
> 	xe_sysctrl_mailbox_init(sc);
> }
>+
>+static enum xe_sysctrl_fw_status
>+xe_sysctrl_check_app_status(struct xe_device *xe, enum xe_sysctrl_app_id app_id)
>+{
>+	struct xe_sysctrl_app_status_req req = {};
>+	struct xe_sysctrl_app_status_resp resp = {};
>+	struct xe_sysctrl_mailbox_command cmd = {};
>+	size_t out_len = 0;
>+	u32 flags;
>+	int ret;
>+
>+	if (!xe->info.has_sysctrl)
>+		return XE_SYSCTRL_FIRMWARE_APP_NOTSUPP;
>+
>+	req.app_id = (u8)app_id;
>+
>+	xe_sysctrl_create_command(&cmd, XE_SYSCTRL_GROUP_CORE, XE_SYSCTRL_CMD_GET_APP_STATUS_BY_ID,
>+				  &req, sizeof(req), &resp, sizeof(resp));
>+
>+	ret = xe_sysctrl_send_command(&xe->sc, &cmd, &out_len);
>+	if (ret)
>+		return XE_SYSCTRL_FIRMWARE_COMM_FAILURE;
>+
>+	if (out_len != sizeof(resp)) {
>+		xe_err(xe, "sysctrl: unexpected get app status response length %zu (expected %zu)\n",
>+		       out_len, sizeof(resp));
>+		return XE_SYSCTRL_FIRMWARE_COMM_FAILURE;
>+	}
>+
>+	flags = resp.flags;
>+
>+	if (!(flags & XE_SYSCTRL_APP_RESP_VALID))
>+		return XE_SYSCTRL_FIRMWARE_APP_INVALID;
>+
>+	if (!(flags & XE_SYSCTRL_APP_RESP_BOOTED))
>+		return XE_SYSCTRL_FIRMWARE_APP_NOT_LOADED;
>+
>+	if (!(flags & XE_SYSCTRL_APP_RESP_INITIALIZED))
>+		return XE_SYSCTRL_FIRMWARE_APP_BOOTED;
>+
>+	return XE_SYSCTRL_FIRMWARE_APP_INITIALIZED;
>+}
>+
>+/**
>+ * xe_sysctrl_is_diag_fw_ready() - Check if diag firmware is fully initialized
>+ * @xe: xe device instance
>+ *
>+ * Returns true if diag firmware has reached the initialized state, indicating
>+ * it is ready to handle requests. On platforms without System Controller
>+ * support there is no System Controller mailbox to gate on, so diag firmware
>+ * readiness is not tracked through this path; the function unconditionally
>+ * returns true so callers are not blocked by this check on such platforms.

I am still not clear how the caller will handle the 2 scenarios - (1) SC 
is present, but diag app is not initialized vs (2) SC and mailbox are 
not available and hence Diag App is not supported. The caller will just 
see true in both cases.

Instead I would see this as 2 helpers:

xe_sysctrl_is_diag_fw_supported() that returns
status == XE_SYSCTRL_FIRMWARE_APP_NOTSUPP;

and

xe_sysctrl_is_diag_fw_ready() that returns
status == XE_SYSCTRL_FIRMWARE_APP_INITIALIZED;

That would be clearer to the caller.

Thanks,
Umesh


>+ *
>+ * Return: true if diag firmware is initialized, or if System Controller is
>+ * not present on this platform; false otherwise
>+ */
>+bool xe_sysctrl_is_diag_fw_ready(struct xe_device *xe)
>+{
>+	enum xe_sysctrl_fw_status status =
>+		xe_sysctrl_check_app_status(xe, XE_SYSCTRL_APP_DIAG);
>+
>+	return status == XE_SYSCTRL_FIRMWARE_APP_INITIALIZED ||
>+	       status == XE_SYSCTRL_FIRMWARE_APP_NOTSUPP;
>+}
>diff --git a/drivers/gpu/drm/xe/xe_sysctrl.h b/drivers/gpu/drm/xe/xe_sysctrl.h
>index 090dffb6d55f..8dc576796890 100644
>--- a/drivers/gpu/drm/xe/xe_sysctrl.h
>+++ b/drivers/gpu/drm/xe/xe_sysctrl.h
>@@ -20,5 +20,6 @@ void xe_sysctrl_event(struct xe_sysctrl *sc);
> int xe_sysctrl_init(struct xe_device *xe);
> void xe_sysctrl_irq_handler(struct xe_device *xe, u32 master_ctl);
> void xe_sysctrl_pm_resume(struct xe_device *xe);
>+bool xe_sysctrl_is_diag_fw_ready(struct xe_device *xe);
>
> #endif
>diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>index d0341538ad05..f1e4253fda4b 100644
>--- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>+++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>@@ -14,9 +14,11 @@
>  * enum xe_sysctrl_group - System Controller command groups
>  *
>  * @XE_SYSCTRL_GROUP_GFSP: GFSP group
>+ * @XE_SYSCTRL_GROUP_CORE: Core group
>  */
> enum xe_sysctrl_group {
> 	XE_SYSCTRL_GROUP_GFSP			= 0x01,
>+	XE_SYSCTRL_GROUP_CORE			= 0xFF,
> };
>
> /**
>@@ -38,6 +40,51 @@ enum xe_sysctrl_gfsp_cmd {
> 	XE_SYSCTRL_CMD_SET_HEALTH		= 0x0C,
> };
>
>+/**
>+ * enum xe_sysctrl_core_cmd - Commands supported by Core group
>+ *
>+ * @XE_SYSCTRL_CMD_GET_APP_STATUS_BY_ID: Retrieve application status by ID
>+ */
>+enum xe_sysctrl_core_cmd {
>+	XE_SYSCTRL_CMD_GET_APP_STATUS_BY_ID		= 0x05,
>+};
>+
>+/**
>+ * struct xe_sysctrl_app_status_req - Get application status request
>+ *
>+ * @app_id: Application ID for which to retrieve status
>+ */
>+struct xe_sysctrl_app_status_req {
>+	u8 app_id;
>+} __packed;
>+
>+/**
>+ * struct xe_sysctrl_app_status_resp - Get application status response
>+ * @flags: Application status flags interpreted by xe_sysctrl_check_app_status()
>+ */
>+struct xe_sysctrl_app_status_resp {
>+	u32 flags;
>+} __packed;
>+
>+/**
>+ * enum xe_sysctrl_fw_status - System Controller firmware application lifecycle states
>+ *
>+ * @XE_SYSCTRL_FIRMWARE_APP_INVALID: app_id is not recognized by firmware
>+ * @XE_SYSCTRL_FIRMWARE_APP_NOT_LOADED: application is known but has not yet booted
>+ * @XE_SYSCTRL_FIRMWARE_APP_BOOTED: boot sequence completed, post-boot init pending
>+ * @XE_SYSCTRL_FIRMWARE_APP_INITIALIZED: application fully operational
>+ * @XE_SYSCTRL_FIRMWARE_APP_NOTSUPP: System Controller not available on this device
>+ * @XE_SYSCTRL_FIRMWARE_COMM_FAILURE: communication with System Controller firmware failed
>+ */
>+enum xe_sysctrl_fw_status {
>+	XE_SYSCTRL_FIRMWARE_APP_INVALID,
>+	XE_SYSCTRL_FIRMWARE_APP_NOT_LOADED,
>+	XE_SYSCTRL_FIRMWARE_APP_BOOTED,
>+	XE_SYSCTRL_FIRMWARE_APP_INITIALIZED,
>+	XE_SYSCTRL_FIRMWARE_APP_NOTSUPP,
>+	XE_SYSCTRL_FIRMWARE_COMM_FAILURE,
>+};
>+
> /**
>  * struct xe_sysctrl_mailbox_command - System Controller mailbox command
>  */
>-- 
>2.43.0
>
