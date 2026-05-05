Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31B3BFF8855
	for <intel-xe@archiver.kernel.org>; Tue,  5 May 2026 17:58:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB7E610E13B;
	Tue,  5 May 2026 17:58:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qk+NEFXa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1DC010E13B
 for <intel-xe@lists.freedesktop.org>; Tue,  5 May 2026 17:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778003933; x=1809539933;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=tE4xFMz8SupwvPSxWLqZczec2hBOwYVi72dw9WQ+kPk=;
 b=Qk+NEFXaqEOFu6HogG782wIkcy/xCB8dHQNLGetW+U2YdpDMzmv3sPxd
 NNrDnmvKh5UVIkH6PoknX4/seZ00WZob9sfUBBkEo8rkkNwnEnKtC6qOc
 LM+1oaIz/qcgihwtEmKbA+Buru3BoG5Lzt7UkEdHZD0GQ2Ssr9Hc27C7r
 CEoTlqkTdSbhCcLkCn9DmDD0lgpAHTvF7PFIb9MA1qnP4Sk217GpTCogA
 RSaKQGEpuSdV3WzyjbLg8VlibjarvPl1nvETj5+L9mF5CfsMQWd71LGGf
 sXrCPxHz68YlZyzxZPBrR2adWhRkIn4/vsUhTzQC1wGvhJsHB6mLrNyVl g==;
X-CSE-ConnectionGUID: TDqOn3OiRwOlGywEKDiH4Q==
X-CSE-MsgGUID: xy0x/QNmRaiP5Mwb0LNLag==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="78596384"
X-IronPort-AV: E=Sophos;i="6.23,218,1770624000"; d="scan'208";a="78596384"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2026 10:58:52 -0700
X-CSE-ConnectionGUID: X6h+PxDKSCS6gQENUTZfpw==
X-CSE-MsgGUID: uWcP3LbbQAev0aB/bgNp4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,218,1770624000"; d="scan'208";a="259232081"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2026 10:58:51 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 5 May 2026 10:58:51 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 5 May 2026 10:58:51 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.42) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 5 May 2026 10:58:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lvGGEVSkTAmnRcOcghwvpxvONmad0lU2ECvnIhkV3wqx54dmiYQnnN9dqA0UgHpB6ayYIPQqn++xI6/SxkIJGqea/5WAuIB+hTxSfAiRuQY1rdfS0aRnqOeeb4MQowGg/HBm1OnvS144SFI1qNa97l4/poDf7gngBaG+YyDEALlHgiFRb4NZXBAjtcRSqCLSGTlN1EvaFb+vFYvE/IQzIqrBUrG6AwY61ZmEeMY7BuBmGQf6oX/KSP12w1XI7EBOO+12faD5264d0xhiLJdFlYQO8bIbx5nDHebOxXLEMGlup0+X8iL1XbjxWJfdoRQ0Bd3XfFAz23F63rCrylVeWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=taz3scHnP8O9OXnPeGPTP7RB+ems/1lE6hgeeyAmNls=;
 b=K/DiLcKfghSal3zuQ3CBOtvB9qyeOiRSgA/qfNrXNv5laPViFk20ryClpphC4pFj1TDhWJbEI3Tnj/4FfTEcODFuMY8skMTtqwbUPEoy1Sy0z83acG+PQ95WXR2fuibUWksP5ZFP0ODOnVgQslFqqMANSjtQ3QrCjcIQXq9PvX2UH8Y0Ps+CX1ghSkPtJJzpGB1OPsRgPtsWMONy6GSy99djuMkNC2aQqSwXY5njnzq5QwW7L7rSymW7Dnr7KiLpOVyCv2epSlMHITDbLH33zkGFeH9VSIOAY0oblS49/GiYaCXr3Fl08O0t900LI/Th852R9z0Jkrd81URJA4DD4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by DM4PR11MB6261.namprd11.prod.outlook.com (2603:10b6:8:a8::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 5 May
 2026 17:58:46 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057%4]) with mapi id 15.20.9870.023; Tue, 5 May 2026
 17:58:46 +0000
Date: Tue, 5 May 2026 10:58:42 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.brost@intel.com>,
 <stuart.summers@intel.com>
Subject: Re: [PATCH v2 9/9] drm/xe/multi_queue: Whitelist QUEUE_TIMESTAMP
 register
Message-ID: <afov0oVqTg0dnjD8@soc-5CG1426VCC.clients.intel.com>
References: <20260502005332.3135977-11-umesh.nerlige.ramappa@intel.com>
 <20260502005332.3135977-20-umesh.nerlige.ramappa@intel.com>
 <aflxOe7FHs7NJqzK@nvishwa1-desk>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <aflxOe7FHs7NJqzK@nvishwa1-desk>
X-ClientProxiedBy: MW4PR04CA0379.namprd04.prod.outlook.com
 (2603:10b6:303:81::24) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|DM4PR11MB6261:EE_
X-MS-Office365-Filtering-Correlation-Id: fcb67975-0fed-4af0-31e7-08deaacff408
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|56012099003|22082099003|18002099003; 
X-Microsoft-Antispam-Message-Info: eHl3oNpJXqRofWityHx1fgR2VUF89qVrMB4vsvQHEynxWd3Al9Qmbb3kwkt/HNudrFq7laqcDA9lB3PLsHfM81JlgFOtC0AZhTZ67Httdl8Q8etOx325r5IIbmgyFNvhv8k4L5b5Vaj4b+smrUVedISGeyTL5Nuw4VJhclR+WsQ3dU3tDuk63a1A1dp6MbVrxee5yl6AMHk2KfO3fbT5rFQPPU90C1Y7PJrGIvE9nrZGcYQWWGZm58Vd6/S/8iVuqdkOu+mtORkZ3EqMrNVVG12NWJ6EcdkP/NCdATtIMWjjShlCf0+w2fPtf+d/9/WxUn73eFF76mtwVsaDfpa+66cb+1i71SZFueG+k9JjNAVqqEABHcansxQSmdWHJ6RwFcpk8p2ixAWuN5ery90kK/lLfRAllfCIMm6ebqvBly2MKcd9vy8LP489NVW8iwMXG/H5b5BpiuotMZfLF4hYz1CHDQbMVy3Z8ow/aThmnrQlX5T2C0LxWsVig51j28qoLa8o/IZs423VMY7T0bZ+kbJaFRR6NrQ3Vo79MxXK0qvAm1MPyGTzvdL3CecFtV0KLhcIIaWe8adRp5fVyKqcdMrnad42R4grayC2POe3d6w4TPgU1T0cHS79Xr6n3Howodg42uWCjtpnpiiCNyDJloaBK+nY13309F3ilXSyvR9NdaTOtpouzk6BsSs+IHJm
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZTZ4ZjI3UXd5WWN3ZDU2ZTIzVVFOcmwxSDZ2aEl6MzlIL01DZkpZUzZ4Z3Y5?=
 =?utf-8?B?clFaQUJhMWRYVS8xU015QlBCSXBpYTVJTWU3ZGlENkFLdHFEY3djYldxOGRs?=
 =?utf-8?B?blIvOHVhcExSMmV2WkhpTnZkT2h4YTF1VzZydENIUWZTc3RKSnlwQStiMnpC?=
 =?utf-8?B?NUFxeU9paGlQeTZlSWZNa28ySU83b2ZxS1dUZVJTT2NIUFNESzgxbUxSRnFw?=
 =?utf-8?B?NXZuRmVJMFh2RTdqWllDVWpvb2Fva1FGRlc2Zm9SdzlOZUVxTS8weExabUND?=
 =?utf-8?B?OHNXNHE4REo0WDVpdjdXMGN4czdQaldSck1IWjRlRDE3Q1poVVNMTlJOUW83?=
 =?utf-8?B?R2hlb3VsVEI1SG1uMXlNUlgyWkF5MldVN3VMQXh0UTlQaDZBUU1PT0dWVkUx?=
 =?utf-8?B?c0MrYi9jdGtnYnJsc0cyeFZBb245WnRRSGRTdjNEZVkyOWhrY0JuN29BYWYy?=
 =?utf-8?B?dVYzc3pRMzhaSHVqcUhQQzdIR3Zkc3RUSFRRaXhLUUxsTXU0Q00vMkMrK2RF?=
 =?utf-8?B?OGRUMExEZFZKcnI5c2xBNUlwR1BweWxPNTYwQWNLazVILzVHZStRY1pkU1Jl?=
 =?utf-8?B?NzIvSkduMjZseHdCTXl3M2ZNTzBLdHNBRUsya3pnVjd4SzhMcXdBYnBWaGRm?=
 =?utf-8?B?ZHN0YVU2OVZCcFpBUjVjM01BNWhpM1ZCaWtUTE0yMk1VUGgrR1VTd2srMXh0?=
 =?utf-8?B?ODlDZzlubWxPbCtjWmRyc3IrY3luYXFLTHllamhIVWxnOTNsQlJJOHJRTDA4?=
 =?utf-8?B?ZHBjanhMaVBscU9oQWl0dUlHdlNKbk9OVk96NW1ibkRkUXdBVTN3bmJONzVz?=
 =?utf-8?B?T2ZqbjJReW5PSlJnTFNyM283dmt1UG1Oc3hqY2lSVlRYZlorZUlSRlFEdkRj?=
 =?utf-8?B?TWZJL0dUOVNZZHM2eXQ0UWV4QWtxTWU4L1BPVEU1VFl4TXRTeW1UM0F2bUZX?=
 =?utf-8?B?elBhUjlhV3YyajAxQWtwRE9wQjhDdGRncSt4R1NjK0tkdnk1QVV1TzgxWVNR?=
 =?utf-8?B?RmRlK3VjQ2kyR3VFODB0cFNkVmUwdlNJWFRMYjNYWGdES3l4b3BnV2ozYVNB?=
 =?utf-8?B?S0RjcDlTVy9pKzFVSUZVREtLcHZSMm1pTHR3dHBJZWxLdmtDQWdnN21HRTdU?=
 =?utf-8?B?ZGxxS2IyWHhkVXpqMlQ5SmZUaGw1WVhHdEdvaXErREFjYzlZY2FhVlVwUXZP?=
 =?utf-8?B?OWRySGRBMlBTQVVJUWhlMW91NlVrTnRQTlpiMk9ka0VlM1JKVmdnZU11UUtE?=
 =?utf-8?B?bkZ3MURZdldOTGVkbjAvdVUrdkYvTjFlOHFPWWZSYnVRT09Ia1lNOVBqdS90?=
 =?utf-8?B?cTl3ZjlkQTMrZEpJVHVTbnZna3F0Q0Nadm5Qam5JNnh1WDFndElHa2VMTHBW?=
 =?utf-8?B?cmdrRXAxdjVJQUsrWG1JaUpPV2g2VVhpYllud3NkQTMvSVZOMHM4RGtwUHNQ?=
 =?utf-8?B?YjlrRGc3MCtKNTIwL0lkNEg4YWc1MTYvWTV1NHJrZnFzeWVBSk5BOTFnK0Rl?=
 =?utf-8?B?Tll5TlIyd2grTU1KNklMT2VNWHdmTktTWWZiK1MxeGVmU0tXNEhMVThDaXVy?=
 =?utf-8?B?eGRTMytHVE0rcUJYZWRlelhBWWdGYXd6R0o5bWVOTkxRVi93N05CRklkNHVk?=
 =?utf-8?B?eVdIT3g5L1VXL1lUSk1ybmUxdGFTWWFHQTY0WlQ2QWhGNVBqcWNaeE5EL2Ev?=
 =?utf-8?B?UVVHejQxRXVtWjA5cnpEWU5xVnhZTlFIWEp0ZlJnY2Y3aHRRTDZPdFY0cXN5?=
 =?utf-8?B?RktzVDZyQWpNdm41TjcrRXNZYWFGMi93aVFTTks2cjIxQUtmUjIwR1hjaXkw?=
 =?utf-8?B?YWRxYmtWVklhWU1DeVBhRUd0TXNLRVlVYldtRTBwRlpXL3pGRklNTU8yd2R5?=
 =?utf-8?B?MkVxd2U0MGdYb0h1TCsyQTZiUmwrZ2xUdjB3Tit3V1NjczVoN0JqZlcwR3R2?=
 =?utf-8?B?b3RHaFpZdFJaUHp4RGRPVDgrdk94NERHMDl2RU5rdS9ISk9JbjlrVURoSlM2?=
 =?utf-8?B?OWtDOUxrS2cwQ1VDb2VhemFLdmt1K1ZvcnZrMnNnNHdBRmZFbUMxL29SQjNl?=
 =?utf-8?B?MVg3VjdEdFFnUkVIZUgwOGo1YzBQMXpyYTlPcmM1enhYZ3N2UWNwdWZSNzEv?=
 =?utf-8?B?Zjdsd0RYcXVCeTY1cDExVnA2MENsYVBIMSs1ZGE2ZlR0UjREMUh5T1dFTjJj?=
 =?utf-8?B?Tnlac3l1WXNRNnVMZHI4N0VmWkRxM3RHOXBSeDJwQUVJVG9mS1I4Z1hGajJJ?=
 =?utf-8?B?QkF5c1ZTdXkvdVZ4UUNsajVObFE3RXdNTFdvbmRBZTgxUitzTjRUbVVZeW9C?=
 =?utf-8?B?Z2d6ZStkeFhQQVl6Y2RuVFV2KzRqRDVtYndTYldlNlhzOGJaNjlNRFNNOHJI?=
 =?utf-8?Q?qW5PaePK5smLTyOlcn5E/sQ8M8ZjyUgHUR1u9?=
X-Exchange-RoutingPolicyChecked: Gy3d4p1ovwFMEYquM+y/nU9H6AxuePPwT44DDTpE3jf8S7KY+9q/sCPAIXbnSOgIXu6Jz6lPnNe8m5zZMXyzrT+o7Pq85aaCMUeMuRJKcwNso7S4CmZx9eidWLk6YRL5521gyoCE2RDXKBLj8leHA9YvxW/GbCUonerw6I6h6BASTkWlpVgSXI/acGd4t9nWX6RwwLGkhoClUroxFD6edbhcrIfZhSHNYpB3ENI2JlqP/OOSlzHEnTd+Ifp6HgWtzzxyrQ9ohK6OxbxhTeP4uaVIu0oJPCy0MSrjDrwAzHV0qym+BQm65YEI9RkDJGqNFWysWOlwUhK4Ie5Sc4geJQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: fcb67975-0fed-4af0-31e7-08deaacff408
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 17:58:46.5258 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bMttytfV0od51yzxRFTNqDuhTufEH0e02rKJm1GB3sz3RUR/OYSD9CeZwoTwCYXzOqZI+8Ra7Y9iVDTWSHYFar87X/CWyTa8Fk7r31fJQ0k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6261
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

On Mon, May 04, 2026 at 09:25:29PM -0700, Niranjana Vishwanathapura wrote:
>On Fri, May 01, 2026 at 05:53:42PM -0700, Umesh Nerlige Ramappa wrote:
>>In a multi-queue use case, when a job is running on the secondary queue,
>>the CTX_TIMESTAMP does not reflect the queues run ticks. Instead, we use
>>the QUEUE TIMESTAMP to check how long the job ran. For user space to see
>>the run ticks for a secondary queue, whitelist the QUEUE_TIMESTAMP
>>register.
>>
>>Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>>---
>>v2: Whitelist QUEUE_TIMESTAMP only for copy and compute engines (Niranjana)
>>---
>>drivers/gpu/drm/xe/xe_reg_whitelist.c | 14 ++++++++++++++
>>1 file changed, 14 insertions(+)
>>
>>diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.c b/drivers/gpu/drm/xe/xe_reg_whitelist.c
>>index 80577e4b7437..37d6ac720d5c 100644
>>--- a/drivers/gpu/drm/xe/xe_reg_whitelist.c
>>+++ b/drivers/gpu/drm/xe/xe_reg_whitelist.c
>>@@ -33,6 +33,14 @@ static bool match_has_mert(const struct xe_device *xe,
>>	return xe_device_has_mert((struct xe_device *)xe);
>>}
>>
>>+static bool match_multiq_class(const struct xe_device *xe,
>>+			       const struct xe_gt *gt,
>>+			       const struct xe_hw_engine *hwe)
>
>To be consistent, we have used 'multi_queue' as naming convention
>and avoided 'multiq'. It would be good to keep that consistency
>everywhere.

sure, will change that
>
>>+{
>>+	return hwe->class == XE_ENGINE_CLASS_COMPUTE ||
>>+	       hwe->class == XE_ENGINE_CLASS_COPY;
>
>We already have xe_exec_queue_supports_multi_queue() function which 
>does similar check. I think we need to abstract it out to a single
>function and use that instead of multiple places in code that
>determine whether a class supports multi-queue or not.

The whitelist is applied during engine init at driver load, so we don't 
have any exec queues yet. Instead, should we derive supported engines 
from xe_graphics_desc.multi_queue_engine_class_mask and check?

Umesh

>
>Niranjana
>
>>+}
>>+
>>static const struct xe_rtp_entry_sr register_whitelist[] = {
>>	{ XE_RTP_NAME("WaAllowPMDepthAndInvocationCountAccessFromUMD, 1408556865"),
>>	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1210), ENGINE_CLASS(RENDER)),
>>@@ -54,6 +62,12 @@ static const struct xe_rtp_entry_sr register_whitelist[] = {
>>				RING_FORCE_TO_NONPRIV_ACCESS_RD,
>>				XE_RTP_ACTION_FLAG(ENGINE_BASE)))
>>	},
>>+	{ XE_RTP_NAME("allow_read_queue_timestamp"),
>>+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3500, 3511), FUNC(match_multiq_class)),
>>+	  XE_RTP_ACTIONS(WHITELIST(RING_QUEUE_TIMESTAMP(0),
>>+				   RING_FORCE_TO_NONPRIV_ACCESS_RD,
>>+				   XE_RTP_ACTION_FLAG(ENGINE_BASE)))
>>+	},
>>	{ XE_RTP_NAME("16014440446"),
>>	  XE_RTP_RULES(PLATFORM(PVC)),
>>	  XE_RTP_ACTIONS(WHITELIST(XE_REG(0x4400),
>>-- 
>>2.43.0
>>
