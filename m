Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24A4ECD342F
	for <intel-xe@archiver.kernel.org>; Fri,  8 May 2026 09:24:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7ECB10E4B9;
	Fri,  8 May 2026 09:24:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XwPp0T14";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 470D510E2F0
 for <intel-xe@lists.freedesktop.org>; Fri,  8 May 2026 09:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778232283; x=1809768283;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=OuJ1uM2Od47qoSYQGkA9eIZwBlDtNH1riy3acM5bMw4=;
 b=XwPp0T14Z4ju6pSauIjE/IfzEqsryeNkr+TR7aqRQUS8DTh9iovrATWS
 oidQ2CwbJCBdElFWOmR8wPYhLFzs9gdCWRwodPSSEdDe/EaDv73VrGgiE
 qFGdpZKm/50dn1eYGNiNiIoNmepuZZE6ddSYWxuZYTEqEr354jLQZfcAd
 DLodZXssumYdyw8XUYvGFOKkpnncDQZ8jM6pPsrlZKMl8gg0eO35kCDTh
 hf3cczxOwenz+uBq/eYpbc1mRsiNqR95uteHdObr1nb7iyq9S2zRK9HE0
 3o9h2PCLCDyxJRP1kj/dhDTUqxNar40OkgfDUdRcWZBoyvawTDgv8rT/i A==;
X-CSE-ConnectionGUID: JAsYuLx4TNOWvCecsnU1yQ==
X-CSE-MsgGUID: d+zbQqneQ6GhS3TdrenUQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="79051293"
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; d="scan'208";a="79051293"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2026 02:24:42 -0700
X-CSE-ConnectionGUID: 8s4dNPqwREu1IkSj0/n68g==
X-CSE-MsgGUID: pfoGMK0CTsyI3ut4GCMtOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; d="scan'208";a="241691856"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2026 02:24:39 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 8 May 2026 02:24:37 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 8 May 2026 02:24:37 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.17) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 8 May 2026 02:24:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PTIajWkk42Fna91koE2d/h1SacEaydGJglcufcm2RY7ysdgiMWvcrDNjWUYo9fDJAb11MK8TVB1aQSH9N6pQb6udxvzoVqzKRQYUnoTwxxjRqYRLUYZOsMNFp+Enk9/T9n0/cURKvBswffUXBaV9yRrHH1mt7KPNElxRKEtzt8GQdP3ZhNuYknbkkeg3G/LG/joQegn4HWQKdx8preBSpqZ5cxDgdmRHJswwNfEGSFJMO9nuaVJBdvkkdvMt+yWA6XrwoDJfFMibgLliXXAIopidy8VZTw2IXs2FFD23/rsu+oWw6hDdQcA2p9vWvyTS2Rr9lyVFgA8ROcs4if1eVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mITTUcE3dzpiPZTv+WmTyFlCC+5DH3qt9C/QrLhdCPo=;
 b=cxCNtgqVR6s/I/Qo/U1AOEzL1WajEWQKddqyxg1slZp9+626o+9LpIxAdGeOErrf/HtlPwA6jfRtHL2x2vEAniZmIZcM86k/NLCD5El9B1l1P8f40i947JoQtHCx3kMUc7iji9nVSAZc+fFY8YfuWKoGlW3zlTDWD/F0BwZ3ZaXnY2U4jdFnk5fUrIcliowjFuba+eb/3T1IV+Ko4oWeqYfQ7tSFKZhyiwkZvquRIAYObCW6hEYIYXshQ5rji7vYnXUdK9o2FFkexnl2T1VRUudyKsrAiW4Or7s5lUCHTRNWhnfgEyitB30cHlDTuF+81TFbfgsqil/qCSKK+7cs9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB5900.namprd11.prod.outlook.com (2603:10b6:806:238::21)
 by CH3PR11MB8343.namprd11.prod.outlook.com (2603:10b6:610:180::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.16; Fri, 8 May
 2026 09:24:29 +0000
Received: from SA1PR11MB5900.namprd11.prod.outlook.com
 ([fe80::d294:7b1f:a7a2:e803]) by SA1PR11MB5900.namprd11.prod.outlook.com
 ([fe80::d294:7b1f:a7a2:e803%7]) with mapi id 15.20.9891.019; Fri, 8 May 2026
 09:24:27 +0000
Message-ID: <8c6eb092-b0c3-4364-b053-6749e4c0c36d@intel.com>
Date: Fri, 8 May 2026 11:24:21 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 11/12] drm/xe: batch CT pagefault acks with periodic
 flush
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <stuart.summers@intel.com>, <arvind.yadav@intel.com>,
 <himal.prasad.ghimiray@intel.com>, <thomas.hellstrom@linux.intel.com>,
 <francois.dugast@intel.com>
References: <20260226042834.2963245-1-matthew.brost@intel.com>
 <20260226042834.2963245-12-matthew.brost@intel.com>
Content-Language: en-US
From: Maciej Patelczyk <maciej.patelczyk@intel.com>
In-Reply-To: <20260226042834.2963245-12-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DUZPR01CA0077.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46a::15) To SA1PR11MB5900.namprd11.prod.outlook.com
 (2603:10b6:806:238::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB5900:EE_|CH3PR11MB8343:EE_
X-MS-Office365-Filtering-Correlation-Id: c611f018-6455-4384-9571-08deace399de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|56012099003|18002099003|22082099003; 
X-Microsoft-Antispam-Message-Info: xnhUiYBAlJ0uz765yFrWAnNeYCmpXkcrSr9Yq5xzLmGyBelhcR7LZglp2/8eCG2WfcvggyU7xdJc9Z1hfKsiypm9fYQn9qKU3ROef9y1dkkY26jR/1h7lqf3ZnqDVfrEs363gyUuggdtf50r7cMgkKhQGKGfoPEKhuSWyOwF14vBM4lF7TwM4NkX4yWKFN8qBbDFUhABrGsnRgZKnI/n0HVdRRfP+5wgC+nVlwNd+fvsqSGa+lbzgzSuZEW6C2mnK9xfCHb/+YYtipe12WlCqlu9dEbyLRGlDJ9qSKvFT/P2xKsUVY7Wu6qHyyXzH7OtRNyWlDcfvhTDxyquBzC0bJcP1davivNejK9vsGsIhIjALXoi+7PJZNOekkfAuZwiwXrybFKkCnVhZSdRObCoqNEHT0bjJqlZkApYQqwhJtdXttqeajAHPX35g2O+7pm+NOjXFz56eJ3a4yIwoWHBgGCQjmAIRRsYTzQsxnvsF/q5sJMf/O7bP2epOnRyCJXs18OaHzTtvttu3yeXWAV3oX/ME7CUWxan+RS6jpmDFxdwviqz/OUuhXn37F37RQGWFHX+4aD4xUaV3jGKdwF1UecujpY9T+4YIZb1W68mVPCyRUVWftkRzPTvbM0Ou2Ow94XbubXu5mWto9nyfu4osh93juCJWXVRC/ho78NOE3ur91PmTR5nO4gjTUHLFO5O
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB5900.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SjIxKzU0MnFuMVFIdittOS9Ka3g3SVF2Tkh6MlZ3akxjd0JjdmIyTVM2aFJS?=
 =?utf-8?B?dzZ5ZmF5aCtRaXcvZjZEaklQcGdVUGdjVFp3b0JvaXBZa0wzd0MyaEc1VWow?=
 =?utf-8?B?SVNnR0F3VHoxc3hSelZUVXF4VHhYbEN2QTYzWEdwS2ttdmtUamdoNVQwQlh3?=
 =?utf-8?B?SDR3amRkVkFQaWJtVlorR1hSb2VzYkk1MjBiTnBJUlBDcTZ4RDkzZVhhUmhY?=
 =?utf-8?B?R2hLY1YyT25kKytQUmhFVWxXMFcvaGY3N1ZpeG4vMm4wVW9xbi9LcG50SHhI?=
 =?utf-8?B?bFhodVVURmduRVEvK3FRZXJSN1NoL0piZFY4TW9GZlZadG9HMmpzRFM0dmxJ?=
 =?utf-8?B?VlpyMzNBei9IcXZYdEh2RS9Tdmo0Qnpwc1NoTCtyKzZxb3RpMzJNcGdlVkVz?=
 =?utf-8?B?czdMS1VRbTZVY0k5aGd6OFViMnN1a1o5SGRtUG9KSmVWa1U3OXJlSnREU3NG?=
 =?utf-8?B?NXFXczlDSGpGUlhTWHJSRU0yRGlkM1R0SFVQOEZIUG4ySUp5UWFqZEttek5O?=
 =?utf-8?B?aSs0QURQOWNTaDJGWGpnOHlUVThGbzFCTG0wcXpIZ3JaQ2FjS3lDMm51UytU?=
 =?utf-8?B?UHdoS2R3V3NCY1hmZTZMVm9XRzM0ckp6N0NndXVCMXkwYllROWwzSnUwdzVC?=
 =?utf-8?B?Qk05bzM3M0Zyd01MSmZCWnlNd0NVNm56OHBXT3A2SWpIOG9xQ1VuN29HRUp0?=
 =?utf-8?B?VEpROWlTd1RBTlhKbHhZaUdvQmlQTnJaSGVvMy9jTjN1c2Q4RWFTOU1QNjJY?=
 =?utf-8?B?alBIMDNKL2dvOVN1a29PTmswVjFXZWZpSVJVVzA0UHo4Z3hxR2FnTkF3K3Ba?=
 =?utf-8?B?ZE9UUlZzekpYVUloVExDZXZoK2xPaWdETFdOYWtaUkRTdTJjNGxzUmxjMk5C?=
 =?utf-8?B?NGpLYTNGd0xDUHVTK3RYanQwRVRiNVZ2QzNpSlVlV2lGcnVLVmVuRXFZWWNQ?=
 =?utf-8?B?b0xqUnFwWWwrUFVXKzhKTEdNOENoUjY1K1d3L1pnL0xKUGxNcTFKY1F4TFZT?=
 =?utf-8?B?eSszZFFIV3pISEpLZWZUaFBlRUNNZERsNEdFdmF5RktFeWpHaWpiU2Vac1ZJ?=
 =?utf-8?B?YWFBOGdKdmlGcVhPRmRhVGk3N28wWUl3UU5HMzVBMVpFV05VUGFueGkyRjg4?=
 =?utf-8?B?Q0NUTEhxNC9vaVJtdnE1aUdsNkFoYnpJNlp5c3dXakVVajU1dndpK1RWNnZh?=
 =?utf-8?B?V2FiUWdsRkpuNkVncjNiNWJCQmJrdU9ZMUUraW5PSU5aK2RnRVlkdTREdU9G?=
 =?utf-8?B?NVZQRDd4eE41dnJ1RW96cWRtUExTUmxKczRVK3BtenhPZ2lndmFyN2RYM0xU?=
 =?utf-8?B?NWVWZlp1Y0NYL0prWVFHNGlXallzWWNUc3NpYkhZbThyUHZkbjFKcEtsYUVh?=
 =?utf-8?B?ejRFMFhIc1pwdGZnQkxnTEFIb2pMVUhuNlRzeHlsZVB5eWlkYmZaTXdzanh1?=
 =?utf-8?B?Q1g3UlF4am4weXpENDdsb1M1b1Q2NE9iVDF1Z1lubU1aYTBEWGNRa01Ma29w?=
 =?utf-8?B?Ty9obEtnZ1Z2T3p1TWh2TW90ODcrdFAzaW04eXJSNFI2V1M2VFRtSjN6dVJy?=
 =?utf-8?B?OW1idlpyUnpIYTlFTnJtOFFnbG52L2hNU2VjMVY0SjZFSG85Zjd6dXc4eUNC?=
 =?utf-8?B?Z2ppQVdZL3pVK1QzZVBaV2ZXbCthYmp2OXUrQVlIRGI0dGU3VnVlUkRiNzlx?=
 =?utf-8?B?N0NGaEVac0xlb0UzU3M1ZGYwTi9xaUhTRVBVS1J0V2xpL1Fkak8zbjNoM1RT?=
 =?utf-8?B?VElwS1FKREFXaExUbS82QzFFSHZMRjhtVTczUkl2czFyZWpORm5NcHlRbXF1?=
 =?utf-8?B?ZEt0WElDb1RkNjIxd29KdVNxc29VblVQZzRkMGFTeVdoR2tPRFMwSHc5SzZ6?=
 =?utf-8?B?c0RwTkFXZnFPdjFGNzF0OHplRGliN1U0c2VCVkh4NHVSS3ZQRlA1cTYwa0Uv?=
 =?utf-8?B?ZHZiVHZrZy83OG53c0V4ek1hS003ejFJR25PTDd6eXZWS0h1U1o4S0xveGdT?=
 =?utf-8?B?R0g3cUlwd0tnSnMzdjBqNU9JM2o2VndtL3dWZHRDOFV1M0FWdzFpUDVaR0dq?=
 =?utf-8?B?emdFQTgzdWQrZmVHTEVqakw0amx6Z25wNFJKVklQd0dZQTIvNzhrN3pMU1JM?=
 =?utf-8?B?V3BWQ3A3OEI1YnFqcWNNZGV3SXZnZE04dHRjWXFmR0lNRVBGUkpoWDNFTTRy?=
 =?utf-8?B?NUxVNHRFdzM3K3JIVENkZmM2RkZrSUN4M2czc0hkRllEZFNhNXVDbFp5VDhv?=
 =?utf-8?B?STBVN2RrUjJKeUZWYkxJM3dmMDJUVzdiRkgxdDNDVjg1SDhlOXo5bzQ0TFZr?=
 =?utf-8?B?aFl1ZllwSklkM2JxL1ZTTzNUNVMzNmNTRjRheXlNWGp5dEdjV25VeGZvQVRl?=
 =?utf-8?Q?NrXu81sXd6pFiJ6I=3D?=
X-Exchange-RoutingPolicyChecked: Oq5x79kJRmDdtM7nQ1awtOOXKOuDu5uSwIckzzn/ZRTA3RGpEZn8J9Hcoz/O3j1I3ZRzMjLbM/30qk2r3+IEVq6Td5QAUlb7Mnu5qJdV5zk+UrTLNj7+mCBHB9umgksUEoRKC4IYqKDf2F8OAG4MOJniFHF5GS0vlGe4vakIj/hxt9mGd6kmyOcgtzxaxZ/I3sIftdfkK/sDhvuy3AJzCFCM/DholydDpfv3PRHDm4aeF3uMK+VYH/bZ6szmL9nO3rfWY3hfSLMNi72ue+tjPA2igpMlJZ1vr4am+5O+CVBCCt3CxCf7V0rBka7vrrX3MqmehDehC7VUY8uHs+glLQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: c611f018-6455-4384-9571-08deace399de
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB5900.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2026 09:24:27.3890 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KjSRBoUd1XoKw+yXxKHuuorJR0LjNQzaiOWJ4QiWCGZf4M4x1LuAROSxEvJPOtfAFmafKo1as6DvMK4FUFOhQFcwgTtn38c8Ga7q4Uqr6sU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8343
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

On 26/02/2026 05:28, Matthew Brost wrote:

> Pagefault storms can generate long chains of acknowledgments back to the
> GuC. Sending each ack as a full CT submission forces a barrier,
> descriptor update and doorbell per fault.
>
> Extend xe_guc_ct_send_locked() with a “write-only” mode that copies the
> message into the H2G ring but defers publishing the descriptor and
> ringing the doorbell. Add xe_guc_ct_send_flush() to publish pending
> writes and notify GuC once per batch. Wire this into the pagefault
> producer via new ack_fault_begin/ack_fault_end callbacks and CT lock
> wrappers.
>
> To avoid excessive flush latency while still amortizing MMIO costs, use
> a simple periodic flush heuristic for GuC pagefault acks: batch most
> acks as write-only and force a publish at a fixed interval (e.g., every
> 16th ack), with a final flush at end-of-batch.
>
> Also increase the H2G CTB size to 16K to better absorb bursts.
>
> Assistent-by: Chat-GPT # Documentation
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Interesting addition to chaining.
> ---
>   drivers/gpu/drm/xe/xe_guc_ct.c          | 94 +++++++++++++++++++------
>   drivers/gpu/drm/xe/xe_guc_ct.h          | 35 ++++++++-
>   drivers/gpu/drm/xe/xe_guc_pagefault.c   | 28 +++++++-
>   drivers/gpu/drm/xe/xe_guc_types.h       |  6 ++
>   drivers/gpu/drm/xe/xe_pagefault.c       | 12 +++-
>   drivers/gpu/drm/xe/xe_pagefault_types.h | 14 ++++
>   6 files changed, 164 insertions(+), 25 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index 3a262d3af8cf..5a126e19c53e 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -255,7 +255,7 @@ static bool g2h_fence_needs_alloc(struct g2h_fence *g2h_fence)
>   
>   #define CTB_DESC_SIZE		ALIGN(sizeof(struct guc_ct_buffer_desc), SZ_2K)
>   #define CTB_H2G_BUFFER_OFFSET	(CTB_DESC_SIZE * 2)
> -#define CTB_H2G_BUFFER_SIZE	(SZ_4K)
> +#define CTB_H2G_BUFFER_SIZE	(SZ_16K)
>   #define CTB_H2G_BUFFER_DWORDS	(CTB_H2G_BUFFER_SIZE / sizeof(u32))
>   #define CTB_G2H_BUFFER_SIZE	(SZ_128K)
>   #define CTB_G2H_BUFFER_DWORDS	(CTB_G2H_BUFFER_SIZE / sizeof(u32))
> @@ -912,7 +912,7 @@ static bool vf_action_can_safely_fail(struct xe_device *xe, u32 action)
>   #define H2G_CT_HEADERS (GUC_CTB_HDR_LEN + 1) /* one DW CTB header and one DW HxG header */
>   
>   static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
> -		     u32 ct_fence_value, bool want_response)
> +		     u32 ct_fence_value, bool want_response, bool write_only)
>   {
>   	struct xe_device *xe = ct_to_xe(ct);
>   	struct xe_gt *gt = ct_to_gt(ct);
> @@ -936,15 +936,8 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
>   	}
>   
>   	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG)) {
> -		u32 desc_tail = desc_read(xe, h2g, tail);
>   		u32 desc_head = desc_read(xe, h2g, head);
>   
> -		if (tail != desc_tail) {
> -			desc_write(xe, h2g, status, desc_status | GUC_CTB_STATUS_MISMATCH);
> -			xe_gt_err(gt, "CT write: tail was modified %u != %u\n", desc_tail, tail);
> -			goto corrupted;
> -		}
> -
>   		if (tail > h2g->info.size) {
>   			desc_write(xe, h2g, status, desc_status | GUC_CTB_STATUS_OVERFLOW);
>   			xe_gt_err(gt, "CT write: tail out of range: %u vs %u\n",
> @@ -966,7 +959,8 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
>   			      (h2g->info.size - tail) * sizeof(u32));
>   		h2g_reserve_space(ct, (h2g->info.size - tail));
>   		h2g->info.tail = 0;
> -		desc_write(xe, h2g, tail, h2g->info.tail);
> +		if (!write_only)
> +			desc_write(xe, h2g, tail, h2g->info.tail);
>   
>   		return -EAGAIN;
>   	}
> @@ -997,14 +991,15 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
>   	/* Write H2G ensuring visible before descriptor update */
>   	xe_map_memcpy_to(xe, &map, 0, cmd, H2G_CT_HEADERS * sizeof(u32));
>   	xe_map_memcpy_to(xe, &map, H2G_CT_HEADERS * sizeof(u32), action, len * sizeof(u32));
> -	xe_device_wmb(xe);
> -
>   	/* Update local copies */
>   	h2g->info.tail = (tail + full_len) % h2g->info.size;
>   	h2g_reserve_space(ct, full_len);
>   
>   	/* Update descriptor */
> -	desc_write(xe, h2g, tail, h2g->info.tail);
> +	if (!write_only) {
> +		xe_device_wmb(xe);
> +		desc_write(xe, h2g, tail, h2g->info.tail);
> +	}
>   
>   	trace_xe_guc_ctb_h2g(xe, gt->info.id, *(action - 1), full_len,
>   			     desc_read(xe, h2g, head), h2g->info.tail);
> @@ -1018,7 +1013,7 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
>   
>   static int __guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action,
>   				u32 len, u32 g2h_len, u32 num_g2h,
> -				struct g2h_fence *g2h_fence)
> +				struct g2h_fence *g2h_fence, bool write_only)
>   {
>   	struct xe_gt *gt = ct_to_gt(ct);
>   	u16 seqno;
> @@ -1073,7 +1068,7 @@ static int __guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action,
>   	if (unlikely(ret))
>   		goto out_unlock;
>   
> -	ret = h2g_write(ct, action, len, seqno, !!g2h_fence);
> +	ret = h2g_write(ct, action, len, seqno, !!g2h_fence, write_only);
>   	if (unlikely(ret)) {
>   		if (ret == -EAGAIN)
>   			goto retry;
> @@ -1081,7 +1076,8 @@ static int __guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action,
>   	}
>   
>   	__g2h_reserve_space(ct, g2h_len, num_g2h);
> -	xe_guc_notify(ct_to_guc(ct));
> +	if (!write_only)
> +		xe_guc_notify(ct_to_guc(ct));
>   out_unlock:
>   	if (g2h_len)
>   		spin_unlock_irq(&ct->fast_lock);
> @@ -1157,7 +1153,7 @@ static bool guc_ct_send_wait_for_retry(struct xe_guc_ct *ct, u32 len,
>   
>   static int guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action, u32 len,
>   			      u32 g2h_len, u32 num_g2h,
> -			      struct g2h_fence *g2h_fence)
> +			      struct g2h_fence *g2h_fence, bool write_only)
>   {
>   	struct xe_gt *gt = ct_to_gt(ct);
>   	unsigned int sleep_period_ms = 1;
> @@ -1170,9 +1166,11 @@ static int guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action, u32 len,
>   
>   try_again:
>   	ret = __guc_ct_send_locked(ct, action, len, g2h_len, num_g2h,
> -				   g2h_fence);
> +				   g2h_fence, write_only);
>   
>   	if (unlikely(ret == -EBUSY)) {
> +		if (write_only)
> +			xe_guc_ct_send_flush(ct);


Just to check if the 'if' is correct here. So flush is for 'write_only' 
only when got -EBUSY.


>   		if (!guc_ct_send_wait_for_retry(ct, len, g2h_len, g2h_fence,
>   						&sleep_period_ms, &sleep_total_ms))
>   			goto broken;
> @@ -1196,7 +1194,8 @@ static int guc_ct_send(struct xe_guc_ct *ct, const u32 *action, u32 len,
>   	xe_gt_assert(ct_to_gt(ct), !g2h_len || !g2h_fence);
>   
>   	mutex_lock(&ct->lock);
> -	ret = guc_ct_send_locked(ct, action, len, g2h_len, num_g2h, g2h_fence);
> +	ret = guc_ct_send_locked(ct, action, len, g2h_len, num_g2h, g2h_fence,
> +				 false);
>   	mutex_unlock(&ct->lock);
>   
>   	return ret;
> @@ -1214,25 +1213,76 @@ int xe_guc_ct_send(struct xe_guc_ct *ct, const u32 *action, u32 len,
>   	return ret;
>   }
>   
> +/**
> + * xe_guc_ct_send_locked() - submit a GuC CT H2G message with CT lock held
> + * @ct: GuC CT object
> + * @action: payload dwords (HxG header dword is expected at @action[-1])
> + * @len: number of payload dwords in @action
> + * @write_only: defer publishing/doorbell for batching
> + *
> + * Sends a single H2G message to the GuC CT buffer while the caller already
> + * holds @ct->lock.
> + *
> + * If @write_only is false, the function completes the submission immediately:
> + * it makes the payload visible to the device, updates the H2G descriptor and
> + * rings the GuC doorbell.
> + *
> + * If @write_only is true, the message payload is copied into the H2G ring and
> + * the software tail is advanced, but the descriptor update and doorbell are
> + * deferred so multiple messages can be batched. In this mode, the caller must
> + * eventually call xe_guc_ct_send_flush() (still holding @ct->lock) to publish
> + * the descriptor and notify the GuC. On internal retry paths (-EBUSY), the
> + * implementation may force a flush to ensure forward progress.
> + *
> + * Return: 0 on success, negative errno on failure.
> + *
> + * Locking:
> + *   Must be called with @ct->lock held.
> + */
>   int xe_guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action, u32 len,
> -			  u32 g2h_len, u32 num_g2h)
> +			  bool write_only)
>   {
>   	int ret;
>   
> -	ret = guc_ct_send_locked(ct, action, len, g2h_len, num_g2h, NULL);
> +	ret = guc_ct_send_locked(ct, action, len, 0, 0, NULL, write_only);
>   	if (ret == -EDEADLK)
>   		kick_reset(ct);
>   
>   	return ret;
>   }
>   
> +/**
> + * xe_guc_ct_send_flush() - flush pending GuC CT H2G writes
> + * @ct: GuC CT instance
> + *
> + * Some callers batch multiple H2G writes using xe_guc_ct_send_locked() in
> + * "write-only" mode (i.e., queue the message payloads but defer ringing the
> + * doorbell / updating the CT descriptor). This helper completes the submission
> + * by ensuring the payload writes are visible to the device, updating the H2G
> + * descriptor, and ringing the GuC CT doorbell.
> + *
> + * Locking:
> + *   Must be called with @ct->lock held.
> + */
> +void xe_guc_ct_send_flush(struct xe_guc_ct *ct)
> +{
> +	struct xe_device *xe = ct_to_xe(ct);
> +	struct guc_ctb *h2g = &ct->ctbs.h2g;
> +
> +	lockdep_assert_held(&ct->lock);
> +
> +	xe_device_wmb(xe);
> +	desc_write(xe, h2g, tail, h2g->info.tail);
> +	xe_guc_notify(ct_to_guc(ct));
> +}
> +
>   int xe_guc_ct_send_g2h_handler(struct xe_guc_ct *ct, const u32 *action, u32 len)
>   {
>   	int ret;
>   
>   	lockdep_assert_held(&ct->lock);
>   
> -	ret = guc_ct_send_locked(ct, action, len, 0, 0, NULL);
> +	ret = guc_ct_send_locked(ct, action, len, 0, 0, NULL, false);
>   	if (ret == -EDEADLK)
>   		kick_reset(ct);
>   
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
> index 767365a33dee..2db4dded6b96 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.h
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.h
> @@ -54,7 +54,7 @@ static inline void xe_guc_ct_irq_handler(struct xe_guc_ct *ct)
>   int xe_guc_ct_send(struct xe_guc_ct *ct, const u32 *action, u32 len,
>   		   u32 g2h_len, u32 num_g2h);
>   int xe_guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action, u32 len,
> -			  u32 g2h_len, u32 num_g2h);
> +			  bool write_only);
>   int xe_guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
>   			u32 *response_buffer);
>   static inline int
> @@ -62,6 +62,7 @@ xe_guc_ct_send_block(struct xe_guc_ct *ct, const u32 *action, u32 len)
>   {
>   	return xe_guc_ct_send_recv(ct, action, len, NULL);
>   }
> +void xe_guc_ct_send_flush(struct xe_guc_ct *ct);
>   
>   /* This is only version of the send CT you can call from a G2H handler */
>   int xe_guc_ct_send_g2h_handler(struct xe_guc_ct *ct, const u32 *action,
> @@ -87,4 +88,36 @@ static inline void xe_guc_ct_wake_waiters(struct xe_guc_ct *ct)
>   	wake_up_all(&ct->wq);
>   }
>   
> +/**
> + * xe_guc_ct_lock() - take the GuC CT mutex
> + * @ct: GuC CT object
> + *
> + * Wrapper around mutex_lock(&ct->lock) for cases where CT operations need to be
> + * performed from contexts that want an explicit "CT locked" pair without
> + * exporting the lock itself.
> + *
> + * Return/Locking:
> + *   Acquires @ct->lock.
> + */
> +static inline void xe_guc_ct_lock(struct xe_guc_ct *ct)
> +__acquires(&ct->lock)
> +{
> +	mutex_lock(&ct->lock);
> +}
> +
> +/**
> + * xe_guc_ct_unlock() - release the GuC CT mutex
> + * @ct: GuC CT object
> + *
> + * Counterpart to xe_guc_ct_lock().
> + *
> + * Locking:
> + *   Releases @ct->lock.
> + */
> +static inline void xe_guc_ct_unlock(struct xe_guc_ct *ct)
> +__releases(&ct->lock)
> +{
> +	mutex_unlock(&ct->lock);
> +}
> +
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_guc_pagefault.c b/drivers/gpu/drm/xe/xe_guc_pagefault.c
> index 2470faf3d5d8..cee653bf463b 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pagefault.c
> @@ -10,6 +10,19 @@
>   #include "xe_pagefault.h"
>   #include "xe_pagefault_types.h"
>   
> +#define XE_GUC_PAGEFAULT_FLUSH_PERIOD	BIT(4)	/* Sixteen */
> +
> +static void guc_ack_fault_begin(void *private)
> +{
> +	struct xe_guc *guc = private;
> +
> +	xe_guc_ct_lock(&guc->ct);
> +
> +	/* Ack the 2th, then 18th, etc... */
> +	guc->pagefault_ack_counter =
> +		XE_GUC_PAGEFAULT_FLUSH_PERIOD - 2;
> +}
> +
>   static void guc_ack_fault(struct xe_pagefault *pf, int err)
>   {
>   	u32 vfid = FIELD_GET(PFD_VFID, pf->producer.msg[2]);
> @@ -36,12 +49,25 @@ static void guc_ack_fault(struct xe_pagefault *pf, int err)
>   		FIELD_PREP(PFR_PDATA, pdata),
>   	};
>   	struct xe_guc *guc = pf->producer.private;
> +	bool write_only = guc->pagefault_ack_counter++ &
> +		(XE_GUC_PAGEFAULT_FLUSH_PERIOD - 1);
> +
> +	xe_guc_ct_send_locked(&guc->ct, action, ARRAY_SIZE(action),
> +			      write_only);
> +}
> +
> +static void guc_ack_fault_end(void *private)
> +{
> +	struct xe_guc *guc = private;
>   
> -	xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action), 0, 0);
Maybe
if (!((guc->pagefault_ack_counter -1) & (XE_GUC_PAGEFAULT_FLUSH_PERIOD - 
1)))
> +	xe_guc_ct_send_flush(&guc->ct);
Not to wake up GuC without new ACK where the last one was !write_only.
> +	xe_guc_ct_unlock(&guc->ct);
>   }
>   
>   static const struct xe_pagefault_ops guc_pagefault_ops = {
> +	.ack_fault_begin = guc_ack_fault_begin,
>   	.ack_fault = guc_ack_fault,
> +	.ack_fault_end = guc_ack_fault_end,
>   };
>   
>   /**
> diff --git a/drivers/gpu/drm/xe/xe_guc_types.h b/drivers/gpu/drm/xe/xe_guc_types.h
> index c7b9642b41ba..2996e5903ccb 100644
> --- a/drivers/gpu/drm/xe/xe_guc_types.h
> +++ b/drivers/gpu/drm/xe/xe_guc_types.h
> @@ -124,6 +124,12 @@ struct xe_guc {
>   	struct xe_reg notify_reg;
>   	/** @params: Control params for fw initialization */
>   	u32 params[GUC_CTL_MAX_DWORDS];
> +
> +	/**
> +	 * @pagefault_ack_counter: Counter to determine when periodically ack
> +	 * pagefaults in a batch.
> +	 */
> +	u32 pagefault_ack_counter;
>   };
>   
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
> index 2cfda29321c9..d252a8c9d88c 100644
> --- a/drivers/gpu/drm/xe/xe_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_pagefault.c
> @@ -425,6 +425,10 @@ static bool xe_pagefault_cache_hit(struct xe_pagefault_queue *pf_queue,
>   			xe_assert(xe, pf_work->cache.pf->consumer.alloc_state ==
>   				  XE_PAGEFAULT_ALLOC_STATE_ACTIVE);
>   
> +			if (pf->producer.private !=
> +			    pf_work->cache.pf->producer.private)
> +				continue;
> +
>   			xe_gt_stats_incr(pf->gt,
>   					 XE_GT_STATS_ID_CHAIN_PAGEFAULT_COUNT,
>   					 1);
> @@ -559,6 +563,8 @@ static void xe_pagefault_queue_work(struct work_struct *w)
>   
>   
>   	while (xe_pagefault_queue_pop(pf_queue, &pf, pf_work->id)) {
> +		const struct xe_pagefault_ops *ops = pf->producer.ops;
> +		void *private = pf->producer.private;
>   		struct xe_gt *gt = pf->gt;
>   		u32 asid = pf->consumer.asid;
>   		int err = 0;
> @@ -599,6 +605,7 @@ static void xe_pagefault_queue_work(struct work_struct *w)
>   			  XE_PAGEFAULT_ALLOC_STATE_ACTIVE);
>   		xe_assert(xe, pf == pf_work->cache.pf);
>   
> +		ops->ack_fault_begin(private);
>   		while (pf) {
>   			struct xe_pagefault *next;
>   
> @@ -606,8 +613,10 @@ static void xe_pagefault_queue_work(struct work_struct *w)
>   				  XE_PAGEFAULT_ALLOC_STATE_CHAINED ||
>   				  pf->consumer.alloc_state ==
>   				  XE_PAGEFAULT_ALLOC_STATE_ACTIVE);
> +			xe_assert(xe, ops == pf->producer.ops);
> +			xe_assert(xe, gt == pf->gt);
>   
> -			pf->producer.ops->ack_fault(pf, err);
> +			ops->ack_fault(pf, err);
>   
>   			if (pf->consumer.alloc_state ==
>   			    XE_PAGEFAULT_ALLOC_STATE_ACTIVE)
> @@ -635,6 +644,7 @@ static void xe_pagefault_queue_work(struct work_struct *w)
>   				pf = xe_pagefault_queue_requeue(pf_queue, pf,
>   								gt);
>   		}
> +		ops->ack_fault_end(private);

For every chain, the worker proceeds, every 16-th pagefault will update 
the GuC and at the end additional update.


>   
>   		if (time_after(jiffies, threshold)) {
>   			queue_work(xe->usm.pf_wq, w);
> diff --git a/drivers/gpu/drm/xe/xe_pagefault_types.h b/drivers/gpu/drm/xe/xe_pagefault_types.h
> index 57cb292105d7..bc8f582b4e03 100644
> --- a/drivers/gpu/drm/xe/xe_pagefault_types.h
> +++ b/drivers/gpu/drm/xe/xe_pagefault_types.h
> @@ -33,6 +33,13 @@ enum xe_pagefault_type {
>   
>   /** struct xe_pagefault_ops - Xe pagefault ops (producer) */
>   struct xe_pagefault_ops {
> +	/**
> +	 * @ack_fault_begin: Ack fault begin
> +	 * @private: producer private data
> +	 *
> +	 * Page fault producer begins acknowledgment from the consumer.
> +	 */
> +	void (*ack_fault_begin)(void *private);
>   	/**
>   	 * @ack_fault: Ack fault
>   	 * @pf: Page fault
> @@ -42,6 +49,13 @@ struct xe_pagefault_ops {
>   	 * sends the result to the HW/FW interface.
>   	 */
>   	void (*ack_fault)(struct xe_pagefault *pf, int err);
> +	/**
> +	 * @ack_fault_end: Ack fault end
> +	 * @private: producer private data
> +	 *
> +	 * Page fault producer ends acknowledgment from the consumer.
> +	 */
> +	void (*ack_fault_end)(void *private);
>   };
>   
>   /**

In the end, each chain will result with GuC update. In case of long 
chains the updates are every 16th ACK.


Maciej

