Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81BFFCCF9E5
	for <intel-xe@archiver.kernel.org>; Mon, 27 Oct 2025 20:59:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4377910E156;
	Mon, 27 Oct 2025 20:59:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X05CjfWy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 954EC10E04D
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Oct 2025 20:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761598741; x=1793134741;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=NlgVv2CKba4Z0TdcD+7UVdY+FSGjAUIRyQ/wOG0UvhY=;
 b=X05CjfWymrhGxZUUqQMwwnBVxSU2OnMi0wyJoR+dd0FISZkgOrsAMQqK
 G+a/7MwrgRdVjm7CXqfXYXATfXXRsPhAsNXI/mPA8d6IhwYgf3h8dCTux
 Qd88fB3MehoijuTf7RDFyFg7aXfO0IfLDqJkj/5/FPo3GV34Ez9+7Dgt2
 OMoonqhbJU8kP/ZF4ueQ0lnTnI4CnsRXU4Bj/SHRc6a4yOR+sf3EKomRP
 DrWvJ51BsT5iWeOGvg9pUthF51QiAt0SCEdYKgF7t0frS7WcecE4mvDlI
 H2hXorT7YdrGxI8oJd2yFol+zRNnQeR+Hi5rpQC6JB41C0NPjycN8If0t A==;
X-CSE-ConnectionGUID: ZfYr3vG7TGSiQ4HKw6YSnQ==
X-CSE-MsgGUID: P5CHaqjETImnmnP0RNDCZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63617913"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="63617913"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 13:59:01 -0700
X-CSE-ConnectionGUID: hgqpvRDDQfGTUu9KwZOYJg==
X-CSE-MsgGUID: EXwbDEQaSImVUfQQm6xKsw==
X-ExtLoop1: 1
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 13:59:00 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 13:58:59 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 27 Oct 2025 13:58:59 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.6) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 13:58:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=myXcZwL0QI92iyAgPQHv61IKV8FuMn1SdbQFvqukNnzfl+1pe7bM6W3qLT3OGHnAoNJiU9xBM9pBDm3bRK4ci3aCkGCLlShBiYAG4MPxNpucarLIJizCkacNKkTQ9lp4GCd/V85geDGEVelQh/OI3fLMzg2VH4whzQs2yood4hF4n8z0HGX5HDDtTmqToBo8FCcQnfltOGRz1Lbb+Z4Icwdt/Se0p1cagMfpb2/Q3Ei58LyfTUVfQZ5VUssDYH0HrdCqzlpf4nPS5UU/mfIaIw5A2jwoudWuexyGDXSkyqha1jNA2OmzvaIK2y2BxR1O4xCpVpyG0rX5k6KDlV9h2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E+yEmqS3b9JxHTwq9AWXA0Qki7XBuIa6xUe1GRh1+B4=;
 b=rqMeus9D61WeFHk6Lfl67lq9zGtTTZKRFSKBaLsWwnP2xCV0gB3Dfa7OzZI1YmARRA+1+Sv2Y6VNYnEu/O+QnLmpAsgwdlONOo+WF7ee7ffQSnXRPXjuZHRAPTd2438zly4cdEtT37Wg5gqoJx66bq6VvtbzJb6EOoJ6g6mNEcU4hnBif/VDNZf90OwClz6LJlgFqkdjuxsJUf9mjzWMNkeS+e5w+uwdfrbFU3nPCK1/8PMEEnLgeQrLkgX2LbsOA1Z1rBZqyXH5KQpwNMe9C6OCZutcw0vZYsmZzcXAPZo7DXWa1Mbj1+kYxkshmo7Ad/gvHHXa7QFdMIXoVnbFdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA3PR11MB7655.namprd11.prod.outlook.com (2603:10b6:806:307::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Mon, 27 Oct
 2025 20:58:57 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 20:58:57 +0000
Date: Mon, 27 Oct 2025 15:58:54 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: Michal Wajdeczko <michal.wajdeczko@intel.com>, Thomas
 =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 13/14] drm/xe/pf: Allow to stop and reset VF using sysfs
Message-ID: <t5ltwjbskg4c7yhld3anhz4rhmxuc3mjoaymoz6jese2zrox4j@ekssjctvmk4f>
References: <20251020182414.576-1-michal.wajdeczko@intel.com>
 <20251020182414.576-14-michal.wajdeczko@intel.com>
 <aPvYy5EH7KOYlqen@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aPvYy5EH7KOYlqen@intel.com>
X-ClientProxiedBy: SJ0PR03CA0187.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::12) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA3PR11MB7655:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d24b393-4de0-4a96-3505-08de159ba52a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dytXbUlnTUZROWNsK2REUm5peDl0ejFiSENIckNOVW5WVjYya2lsOUJiQS9Y?=
 =?utf-8?B?cHNqTWxPbFB4WVljclJzTHM1VzBJMGUvOHFXK0trYng1dDV4Wlh1SFJGNzR1?=
 =?utf-8?B?YW8vMUFHNVVISlhiRFVRL3JIRklKVHRrTFlPeVJoNUZKN3IyaU9Tc2lhSTB6?=
 =?utf-8?B?NnBSeWVKTDVhRC96OTU5ZkFQT0oyNzB4RFIyUXNBM2w0ZDVKMldhRFNrK0Fo?=
 =?utf-8?B?ditNaGVwLzAxUjV2UWtIamljZ25RZm1GODFQVzQyZG90VEROdktSRHQ5WEY1?=
 =?utf-8?B?cWtvN2VvcG5RaVVyaEFGYStROU5NaFEyQUxQQ3ZNek5BOFdIMFhlcDVRRUhM?=
 =?utf-8?B?WGhvd0dCRGxBSms4WnEzeFF2NlNTZTZIaGJvWHEvRjFtbVhNdXlDdm9CaW5u?=
 =?utf-8?B?Um5vakdodjRhS3hPWjY1VEV4ckxZWVdEUnBOellKWkJncHBsY3VlWEM3NHRO?=
 =?utf-8?B?STNvMlk1Q0U2a0kyWFhaQ0ZKWm5PdVFOYXUxWG9IU01BT2V1NGF4dUpXWktM?=
 =?utf-8?B?ZWZmRHczdnNvYUVrVkxodC9ZOFZnb0VuZjhrcStTZEl5RjFQUlFzZERZcVlP?=
 =?utf-8?B?SllzR2tHb3RoMEFnMXo0bjBKWUQ1S3dxZFBVdTEyWVhCeDQwRjkzRkY0QnZu?=
 =?utf-8?B?SmplRStNTkU5Nms4RHl5L0tvUWt4UnZDbHB4ZHhkdzNvbm81OFpGOTRoSjNI?=
 =?utf-8?B?K0FtWFJtdm1iRTBTOXlqQVFVc1BKT3hjckUwNlJqMk9qdFRMWnhPRUFXd1NL?=
 =?utf-8?B?K3c4Z1ZMMWhQcEIzYnRIK0J2OVk0cW5mejFxOFFjKzFHb2VibGZSTkZLZXlL?=
 =?utf-8?B?cldGajg5YnpZQ2owemxUK2twUVZ1SGxnUERwYkoxUXhNKzBxZmhxQnhkQXlK?=
 =?utf-8?B?bUthWnNpNWtCTTgwVmJJTXpLWXVVYmMrUStwYlpVTi9lZGptdmZaejFCbFhm?=
 =?utf-8?B?ZW5ZRVhHUm1oYTN6eEJ6cmtJelZobE5hVUF0T0gzRFo0R1FHVUtGWk1icUkw?=
 =?utf-8?B?N0s3MXgzelNaR3BteFMrNkJoZnRmZGpZazd0ajhXK2hTdkowWWJaZU9HSWF1?=
 =?utf-8?B?MVlwQzRLelpJMS80SjhNL3lFckV1OTBLbjZUekZROGhsQ2kwcXRPR1ZhM3VD?=
 =?utf-8?B?QXh6b3VvaFFTWFBKQ0c1ajZWejRONnJtZGxDRFc4TkdyY2FLTkZIVWQ0UXNZ?=
 =?utf-8?B?bjlrZ3BQWmFRL3k1TXQ4bnRweG1FVlhuTnB6SGlnQXFNS1lPNFJzYnJMRlR0?=
 =?utf-8?B?WWgzMWsyOE80WEswcGs0aW1kNzlXajh0UUlzTElLL0tuY0Z0d3BiRHFjeGhR?=
 =?utf-8?B?TWhOS1RkRjVzRHpSMlFjdEN2YUd3ZUFWN2lZUXpIQVZHZWcwVzJVQ3ZGTXhz?=
 =?utf-8?B?QVFIeHkyclpmb2tnOFlTVXlkbkl6MW1FV2hNT0FaTjdNcHVkZ0dnSDNsaTVN?=
 =?utf-8?B?Tzc0OVlWV2lSTTR4K2Q2aFlVM2tuZW50aTlzeTUwNWFVa0V1dGM1SG9XN3g2?=
 =?utf-8?B?UTIvRWttZXRpc1hZV0RTMHdFM0VBM1VTVmR0NlM4RU5HUXlHOS9nSGhjUmV4?=
 =?utf-8?B?K0p4Tm16ZTIwaHZIY1N5ZmVBcmxLNFhGRllMaHYvdmkvMzVsMWROREFYYnlM?=
 =?utf-8?B?eWpaTHE2cEdFWmwra3V1WHViU3hDMVAzUk5RdWlFcndZUG81WmhmWjI0UGNZ?=
 =?utf-8?B?N1pYZDl2cTJuRVBFZVhqVzNNRERaR2w5N2g4UTJ2UVRidi81UzFmSi85MHg0?=
 =?utf-8?B?ajkyTi94ZzFWQ2VyU3VaemVwNU9xWk16RW9Hdk42S1kzUDZmQTZaZVpCV2p0?=
 =?utf-8?B?TnkxdE00OE9BVWJEaUt5eDU5VWxEYWRRQVR2RFJkQm5neFVQd2dNdytvWlFG?=
 =?utf-8?B?MnF0RUVheldPUVFUSkdxSWZsUEEvNTZydmVjMWR2M0psaUU3N0k5eDUrV0RP?=
 =?utf-8?Q?xb2UzbpkAtjLb0LX16RnORrf/Suu+roj?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b0J3Z1puVzlvZGJKWjcybjkxTDgyK0FrSXFvK05HMWUzVnhpVXEwUlB1dGJI?=
 =?utf-8?B?V1crVmZKbjFlM01GN3hxT3V2SVh5S1FlbGJhODFoend3V0FvZjN5YmorSm4z?=
 =?utf-8?B?aHoxdEdkdUUrbmVJbFlyZFA0UXFjNzhTOWlySzllRlRFQng3cmRvM01LcU41?=
 =?utf-8?B?RVB3akpLUXVrUU5hRXlReS9yMHdxaW12cTZpRjNOVnZ0VHAxcmlpZEZxa2Zt?=
 =?utf-8?B?aXhiYklKVDVOOFRoTVVjeFlsOHR0MmVLSHRaSWVkc044MHcweS9DT0t6R0hS?=
 =?utf-8?B?VUlyZGRZRDh2cHpmVDMzMkV4eE1pQ1AvVU5haFVxVDFmanpTMXQwU0o1MWQx?=
 =?utf-8?B?VTVjN1BIWDkvK2poeGNpalk3b3hXU1pwbnFhd2lJS3JqZ3FuRTlzY0tsZ1dT?=
 =?utf-8?B?T1poVHE2ODdBNEt5d1NabUwrNnpQYTEyb1h3MU4rWTZiMjl1bzc1U0xiS3ov?=
 =?utf-8?B?bFJTWTRWdm9BTmI0QlA1M0FHVXVHTXc3Y2ZnOGlzTWlUeUdPZGZlMjdEWmE0?=
 =?utf-8?B?YS8wbThpQVVPM2xYTG9iRnZyMDE2bnE5blZGQ1lCbHhFbE5MZFNJeGVCc0hV?=
 =?utf-8?B?b1U0TUdWeU11YzArT1grdVFnc2daTEx5YmwwWVkvdlNpS3RrYmRmMzJsNWFZ?=
 =?utf-8?B?WmtMMVVBWWt4UzlROHhRN3JwaUx3YmlGN0Q2aSt3M2hnSkNmQXNhblFyUjZU?=
 =?utf-8?B?cmM2QWllNEVxRjR6cUNEL29aRGd5NnJJM1AzN1grbjZYMTNmdHFyTXl1ODF1?=
 =?utf-8?B?d204N0diYWc5a2pmOFlpcTF4Z0g0MDhGTW9kK09jS2pTZ2N1UUhiVGloZm0v?=
 =?utf-8?B?VjllUjQ4Njh0RGhNd3dEb2Rpd3IzZnlhelNZc2NwQmRDTmtHTy9TQ1Y1Ykps?=
 =?utf-8?B?L2RpMzRXcVRQMkh3aDdHWkxlL1Y2cERCditrcHV3QU9OTllFbERoUGhRcER3?=
 =?utf-8?B?MUoxNzlpUlJ3RFBQSk1Ob0hPWnhSL1pVZXY2WkNRSnp2dHQzL0k2YzFOTjFV?=
 =?utf-8?B?cWh4U0JqVGQ1Zlg0VXBiZVdEdks0YXhBZml2Z05GVkhhbnJwNS9xTUdyN055?=
 =?utf-8?B?QmVVdVVBL3dMMDRZNFhNaFBCU3I0UjZTWjlzN3pBQW1aTWR5ZldEZ0wyTlM0?=
 =?utf-8?B?bEhNbjJkSHhXOGRaWjhOanJuU3JXWThDdDBZUVlRbjhzVzZzRXFRTkFaaXZW?=
 =?utf-8?B?NE9PdnUrNzhZWFJxNzBmMjV5K2ZMNWJwZ1lwTjdDN0pBUUEzWFRVenJmK05u?=
 =?utf-8?B?ck9PdURPaFFua0pzQ1Q0bmlsaEJUYXFJdFlRd0RHNW9ZUWtmc1hja250eHhh?=
 =?utf-8?B?QU51MGpQaXEvOXBuYVJqWnFkNmxhOU9jZ1hmWHpRVGxhUVdZZGxVWEdPeUQy?=
 =?utf-8?B?bXM3VXBCbng0OHl2aGxNbjJuRlA5QUVKZ1JUZThRM0Vjc2hSZDFWUUM2dnJx?=
 =?utf-8?B?eWZLSVRnT0d3R256ZFU5ajNMTnBVb0NVZGg4ZzdKZlcxWk94bHN2aFo3VkRN?=
 =?utf-8?B?Nmw4N3krRFJrc0x4VDBPWjdZeGdYUXkxVENkYjhMTlFWWm9aZm9YZjdkWGFv?=
 =?utf-8?B?clllYmhOVEhNS3NQckFNM2p3YzhUN0VmTkZ3QU1TK0o0YTVPSTh1Si8rREtI?=
 =?utf-8?B?YzZrTjBIaUpSZGtyOUJYK0YrZDcxcnlYeC90QVlRV2RaQldnMFdNanY3N3lK?=
 =?utf-8?B?Vm5MZnl1NEF2ampmcHNpODY1ciswZlpHdjEzQm9LaE9Tb21QWTNOMGRPcVRJ?=
 =?utf-8?B?Nml6aXkxTDVxamUxQlM0WWoxeCtKVU9qdTNpUFc3MHpOQzBNTHV0WkpuOG53?=
 =?utf-8?B?SlV5V2NXc0gybkJTSWQ2N0t4YkpOV0hmUlU4eGxSLy9rUmpMaUpoTFM1Wjd5?=
 =?utf-8?B?c3dvcmprUjVCOVYrbzcvZ0poOFRqODRSa3dTaHVhSkhZbVNUUitSNk8rSVdq?=
 =?utf-8?B?bTlrVWxhNjVLNFBwOHpHeUZ4cGtuc1l5Rmp6M3BmV0FrT2UySUNhY1JtNk85?=
 =?utf-8?B?YmxENVV6OHp4dnNTUUVrMnRVWTZzMzBiZlNmUXZyejlFci95NSsxTmJibW9x?=
 =?utf-8?B?WklPZTJLankzZ2FpUVJVaWlxdUgwQ0tCbFVsMGpOcmJYcFU3VjFYREQwTWlj?=
 =?utf-8?B?M3ZpcmxRcFFKZ1NxWFZTL0hKdS9RL0FHSlE0NmJ5QkxuR08xb3lzRDgxMW9R?=
 =?utf-8?B?K3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d24b393-4de0-4a96-3505-08de159ba52a
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 20:58:57.0238 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GnMpI52S5K8cLuDiZVXEsQVFu80TbJuVWeeogTxF11r3XlBtXc8miMqI6EEnnXITjnbgw/Us+WJtNnUxTN0v5OBSdkGRX68P/N7rqruZ08g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7655
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

On Fri, Oct 24, 2025 at 03:51:39PM -0400, Rodrigo Vivi wrote:
>On Mon, Oct 20, 2025 at 08:24:13PM +0200, Michal Wajdeczko wrote:
>> It is expected that VFs activity will be monitored and in some
>> cases admin might want to silence specific VF without killing
>> the VM where it was attached.
>>
>> Add write-only attributes to control GuC scheduling at VF level.
>>
>>   /sys/bus/pci/drivers/xe/BDF/
>>   ├── sriov_admin/
>>       ├── vf1/
>>       │   ├── reset		[WO] bool
>
>This reset is the only thing in this series that I'm not 100% comfortable.
>in the device symlink you already have the reset that does the right thing.

is it really the same thing? This will end up doing a
xe_sriov_pf_control_reset_vf() and I don't see it being done  via pci
subsystem.

>
>If I understood correctly this one here has the same behavior, but with
>slightly different path... bypassing the pci subsystem.
>
>I understand that your goal is to have it near the stop since you have to
>stop and then reset. But It is still a bit strange.
>
>If you get our only PF FLR supported case, we do need to unbind the driver
>before echo 1 > /sys/../device/reset  and still the unbind is not a file
>near the the reset.
>
>So we can perhaps live without this double reset here.
>
>Although not a big blocker from my side....
>
>Lucas, Thomas, thoughts?

for a sysadmin what would be the alternative? This?

	echo 1 > /sys/bus/pci/drivers/xe/<BDF>/sriov_admin/vf1/stop
	echo 1 > /sys/bus/pci/drivers/xe/<BDF>/sriov_admin/vf1/device/reset

If it's the same thing (which I'm not sure, see above), then I'd drop
the reset attribute here and rely on the device symlink we are creating
in the previous patch.

Lucas De Marchi

>
>>       │   └── stop		[WO] bool
>>       ├── vf2/
>>       │   ├── reset		[WO] bool
>>       │   └── stop		[WO] bool
>>
>> Writing "1" or "y" (or whatever is recognized by the strtobool()
>> function) to these files will trigger the change of the VF state
>> to STOP (GuC will stop servicing the VF) or back to READY (GuC
>> will start servicing this VF again but after completing the full
>> sequence of the software initiated VF FLR).
>>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c | 52 ++++++++++++++++++++++++++
>>  1 file changed, 52 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c b/drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c
>> index c68acf6cd34f..f872013313c1 100644
>> --- a/drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c
>> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c
>> @@ -13,6 +13,7 @@
>>  #include "xe_pm.h"
>>  #include "xe_sriov.h"
>>  #include "xe_sriov_pf.h"
>> +#include "xe_sriov_pf_control.h"
>>  #include "xe_sriov_pf_helpers.h"
>>  #include "xe_sriov_pf_provision.h"
>>  #include "xe_sriov_pf_sysfs.h"
>> @@ -52,6 +53,8 @@ static int emit_choice(char *buf, int choice, const char * const *array, size_t
>>   *     ├── vf1/
>>   *     │   ├── ...
>>   *     │   ├── device -> ../../../BDF.1
>> + *     │   ├── reset
>> + *     │   ├── stop
>>   *     │   └── profile
>>   *     │       ├── exec_quantum_ms
>>   *     │       ├── preempt_timeout_us
>> @@ -291,8 +294,57 @@ static const struct attribute_group profile_vf_attr_group = {
>>  	.is_visible = profile_vf_attr_is_visible,
>>  };
>>
>> +#define DEFINE_SIMPLE_CONTROL_SRIOV_VF_ATTR(NAME)					\
>> +											\
>> +static ssize_t xe_sriov_vf_attr_##NAME##_store(struct xe_device *xe, unsigned int vfid,	\
>> +					       const char *buf, size_t count)		\
>> +{											\
>> +	bool yes;									\
>> +	int err;									\
>> +											\
>> +	if (!vfid)									\
>> +		return -EPERM;								\
>> +											\
>> +	err = kstrtobool(buf, &yes);							\
>> +	if (err)									\
>> +		return err;								\
>> +	if (!yes)									\
>> +		return count;								\
>> +											\
>> +	err = xe_sriov_pf_control_##NAME##_vf(xe, vfid);				\
>> +	return err ?: count;								\
>> +}											\
>> +											\
>> +static XE_SRIOV_VF_ATTR_WO(NAME)
>> +
>> +DEFINE_SIMPLE_CONTROL_SRIOV_VF_ATTR(stop);
>> +DEFINE_SIMPLE_CONTROL_SRIOV_VF_ATTR(reset);
>> +
>> +static struct attribute *control_vf_attrs[] = {
>> +	&xe_sriov_vf_attr_stop.attr,
>> +	&xe_sriov_vf_attr_reset.attr,
>> +	NULL
>> +};
>> +
>> +static umode_t control_vf_attr_is_visible(struct kobject *kobj,
>> +					  struct attribute *attr, int index)
>> +{
>> +	struct xe_sriov_kobj *vkobj = to_xe_sriov_kobj(kobj);
>> +
>> +	if (vkobj->vfid == PFID)
>> +		return 0;
>> +
>> +	return attr->mode;
>> +}
>> +
>> +static const struct attribute_group control_vf_attr_group = {
>> +	.attrs = control_vf_attrs,
>> +	.is_visible = control_vf_attr_is_visible,
>> +};
>> +
>>  static const struct attribute_group *xe_sriov_vf_attr_groups[] = {
>>  	&profile_vf_attr_group,
>> +	&control_vf_attr_group,
>>  	NULL
>>  };
>>
>> --
>> 2.47.1
>>
