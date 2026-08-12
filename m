Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 614BBC5AD5A
	for <intel-xe@archiver.kernel.org>; Wed, 12 Aug 2026 11:34:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF8F310EE9A;
	Wed, 12 Aug 2026 11:34:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QVMQAqDI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7346110EE9A
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Aug 2026 11:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786534455; x=1818070455;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=c+GRtKtzFhQpwKyFRudzc1GJo7OykHvzbBI5m33mHvA=;
 b=QVMQAqDIWayc3RfONR1cFjDz45divUAcOQc4deG+XzYWd4Hj7YGA0Vam
 MbOs6WWjZyUjGhABDFBnMxs4veZuH4B+PsglprN8lcqsK+Fj6a2IthM4s
 GKGy1lttI5RkDllIuRXJm4HW4f+KQ3o+6pJJ/um5JFFwC/bNXZ0edf64b
 fpq/kB5kbseSwcBhN5FpnA52++RMc9cIZq5t0pvDEmJYDO8Qs0hkpKxSg
 z8/DQwRy6CSwSQd93NHGJDu9ACYmpyKGlCLPAwEEx+Sha8Ubfqf3D/yay
 QTmbXlg3qa3KVMKM0NBvby76yO+040DIMiaQ1jUr/kX0qWSgHc7tYB7OR A==;
X-CSE-ConnectionGUID: 58j2nohyTLuBOUpkhN1nQw==
X-CSE-MsgGUID: Bgb9z2BZSF+B2YX9C7JdaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="87097778"
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208,217";a="87097778"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 04:33:50 -0700
X-CSE-ConnectionGUID: hJHY4W23SVa4DyLcbz/PtA==
X-CSE-MsgGUID: bxxhVsxRR6yPyhNiRpbYfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; 
 d="scan'208,217";a="262314821"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 04:33:51 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 12 Aug 2026 04:33:49 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 12 Aug 2026 04:33:49 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.4) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 12 Aug 2026 04:33:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AF+Q8ZJUQEO9S8Fw8Y20iOXSlaLwD52UEQ1FYyzli3aWp9FCyHByG1EAX6Zrka+FD3uJ2VUicRGkm5ytx2Yp37TjMjNWa1g9EMDakpuffszZG2X/G3fis+J1zbmCK/2gsKM6dhRA69aHMBD3ksc/qU2/FJGv15VayXNQJseLufuLpQxBjivHCOXhvp9PyceVXG3ZdixMV5vVtbd547UXYa5N2vRG+HM9R/UgiWkVQg9itK80/tH7tLhrbA6BVM4xTbKgRSc4JJIqKBSc1Tk3svDEmmxokAAOSItWEB31vu+gENctpQ890algdtq4+KorNKT64iRe3/es49UpEEMkEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O1DPeqgBlcz58MgnJNTSVt8w8PlLE8iQajuaeGttrXo=;
 b=cCqZ2i78/VTqIREEq4eXQbts9BqSxKmLOqxAsNqwxdbivWg77NBxGbUv4HBBDPGX4A5d2TsjAgkpK+EGhv2DDo3I7dbZLHzNQh3Deft01gKFYBO/LKfQET0HqcX7dtzj2qO9eQRnrKFxRwKE1MdUkhtkfC1oe9wLaZGXm81OMfJAO5kPT42jgjHWjPTg0l2usVLa8j5IRMuBlfboOQyZxYBsYZr9GCkcXMj9Ssgt2fsIJ21k6/RKJQ5oxcDeoVECP3RE1x+5nIa+U3xakuWsPptZtj9cpKnIqQt0wNw09VYIh8aYT9uIlBsJ5A+c8GaKThasSBbCOgg74BQCt8JE6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by SN7PR11MB7665.namprd11.prod.outlook.com (2603:10b6:806:340::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.13; Wed, 12 Aug
 2026 11:33:43 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%5]) with mapi id 15.21.0292.024; Wed, 12 Aug 2026
 11:33:43 +0000
Content-Type: multipart/alternative;
 boundary="------------ovHmvaccVANSpRQxeYJxu5CH"
Message-ID: <7f4f5cef-ae7d-4224-b008-331f10f21cb6@intel.com>
Date: Wed, 12 Aug 2026 17:03:35 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 15/23] drm/xe/tests: Add kunit tests for xe_any
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20260730152121.576-1-michal.wajdeczko@intel.com>
 <20260730152121.576-16-michal.wajdeczko@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <20260730152121.576-16-michal.wajdeczko@intel.com>
X-ClientProxiedBy: MA0PR01CA0016.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::23) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|SN7PR11MB7665:EE_
X-MS-Office365-Filtering-Correlation-Id: fed1bacf-989c-4021-394c-08def865904d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|56012099006|11063799006|10067099003|4143699003|8096899003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: J3Z+tmPLJSr0f0oYH/A9IMLpQVYlF1SxIB2WRKpFrhC9jdyEjw3MjcwObdVccW2F148AhID7GN4MrOYzTnUxW9wc3cT8KbwG2hF9xP3DxDVcnvyoMykzDUmF3cKmtZghAu3WeEcYvao/sSbCYbcv1Vss6hbv7CXFszl1LrbH+iMHOv3o3DuA9F9bWMB+TCUwWojfZ3uZJYB83oxRr5N4Ytdo7Rx8lPA6W1ee8w9bJGXqHv/KtWksgROP4QBVFGrEHfqmACTL03LFD8jRC09kbnM0HsxGUMUJSSOFxV2SAloBUdtQXQeIeW5WY9s087rXzMshm8X6IShI8d53fwSkDwZJr485EjCnAfYN44vFiBD8b/ol7zEBABaNmKn5psv3C7ooAqRgjI1hHKuGWX16eezOAhbHyWAS1iBQpUBwyO5Qr26tkAIX+iW4+sgjpfWoJjoIINch+KAh/eOWF59IfAVEcnwXrxZBUVsqNYqOkqkBdUudrg0Nbk/0uw4JGhqt1wtNRsvO7Q92LfGzD3unnciBKVGNJ0iSU8M2F8Ou+nOg19PzlC+ezmI8wB4swtgkX9mCV5a8NVbHRx1nKP437XbuBOi0GkX8Q23mkuWoFgImZw3eRk6lbGTM/sY5sL3z6o2PRlhF7LpIO9jMeqqfg6wxMEsnTtcUJZ22Fb9YM/Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(56012099006)(11063799006)(10067099003)(4143699003)(8096899003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dVozZ3U3RG9sYUxJcDBTeDM0Z2gxTm9BaC9MM2cxK25wcDRPNTFXUFRnZ0wv?=
 =?utf-8?B?Q244dytPK2NOelNnVU5jOXFxRm93RXE3anJpV29jdVdZWURrbzU4V2trbnZi?=
 =?utf-8?B?MkFhSTBxUDd4VnBqWGFYZ0xac1lYRWF6UzlWUVpLU3paZVVNMVA5WnVlY1k3?=
 =?utf-8?B?TFdGNGpTSVFGcEIwcTZNTkFaMjFuWEtTUlhhSi9ZVzBLZVY5TWRNWUpELzV1?=
 =?utf-8?B?MzR5WWNjM1pjM2J5eTQrQmRKSHF3L0NkQUkrMDlCVE53cjZRT0ZBUGhqZFFE?=
 =?utf-8?B?dmJsZFd4TXVHV3AvMXkwMis0SDd0VVV6c2Z0UC9udm1DQkc0dUJ5NWUxZFdB?=
 =?utf-8?B?S3p3VEVGQ2VrbFdhSkt4ZFAwRHNTdmxxb2lRcXRXSmxWMStwRmlzZklOZ05C?=
 =?utf-8?B?VkQ0RGJxRjZwNzg1b3d1U3hmVFNxUVljU3VNS2FwdGJ0bnlvMW12eE9WQ1hs?=
 =?utf-8?B?UlZLOTBIWXZPMWwydHAybVZkQjQ2TzNqaDNWeXpuZDR0c2I0c0x5TEg2TmR4?=
 =?utf-8?B?L0RwMytWVU5YMGxlU2hlSjZVQ0xoSzgyZDFQMHMzS08vdUs3bmxBUUdPcmI5?=
 =?utf-8?B?a1liVjZiWGFzQUFoZnkydXQza2ZrNy94eUtaU2ZmUG9ZZUVVTHl1MG9YWU1E?=
 =?utf-8?B?SzhTK2NNdXBlUWh3RWRFVGN5ZFBTaUttVW9IUmswMXhaNWxBbDVSMzJEZ25j?=
 =?utf-8?B?bmhPOVpZejJRaVgxRWFDMk9oWllqZlZWWkM1dzM2S1lxdHhqTi9Nd2VYNWE0?=
 =?utf-8?B?ZmhmWUwxMWtJV1A2S256OVdPRS9mQ1E5L1gvaEp6K2xYb1dSclYvekg4Vk44?=
 =?utf-8?B?ZUVXRTVFdTdEaTcxM3dOVHc4VHVpWjFvRE5UTHdYajUyQ0tXUm9YT0M4QStE?=
 =?utf-8?B?QUwxaEhaNEdGUDFRRENraXpLUitVYmoreDdiSFlpaGN2RklmV2JuUHdCQjdK?=
 =?utf-8?B?aURZWE9WQXU2RDcydlV2cEZNRHo5K1VuM04rK0xxQWNPUDd2YWpPT1hhZnJs?=
 =?utf-8?B?Y3RNb3d2ZGVoSUVUU1NmelJERnJCSGZXZW8vMndvTXFuTTdiVncranBDNGlv?=
 =?utf-8?B?a3NwVzd5Q0pBalAxUGsvcGpIejlsZ3Z2OExMQlFCaUVkMWFkNi9FZ0JNYTM4?=
 =?utf-8?B?NkhwSDlsTml3S1RwbXFabWNHWnR5bnc1TmVCNFQyN2Q5UkNycmJXUkFxVktW?=
 =?utf-8?B?a1NtK3Qvb2k0U2lvNVM4ekhidzcxcGxRVXdPcDN0NjYrVmJ3YkRwaVo4VkRh?=
 =?utf-8?B?dzlTQzRZTlEwOWJKTkxRRWRFejBJZERvTkRRQlh6VnVaMEVSVE8vamJGWUZG?=
 =?utf-8?B?T1JJZmlZRDRjOUxZVkZUK3NBWkJqZ2hBNldRSTRhSnp4VklkZ3EwU0hUaVYv?=
 =?utf-8?B?d3M0ZTV1TzNodnNldDNzWkoxRHF4MGozcElJc0dab3JjTjZjcXFyb3Q3ZGRn?=
 =?utf-8?B?NWt4R3dGcDI5TjlYUkhsYTBkTGRMK1lZakNrZFo5RVA4MHcwekFEWUs2cXhW?=
 =?utf-8?B?WUlLRU9mbE1aSlFMR1VQUDc0NkdUcU1NUHFIZXpuYmQrWWdjTXpnK21TSFYw?=
 =?utf-8?B?cFo5eDIrS0hpb3BOdEJqVkdDYTE2KytTQlI0TU4wZ1BES2hvVFdQSWxIN1Qy?=
 =?utf-8?B?aGpqYjdMN1B1SHZSUk95RE9hbldkNTJGS3djODZZaGlyTzFxTVpVTmI0dTZ1?=
 =?utf-8?B?cXJMRFJGNWVYWER4NkZvRDU1eit4eEJCQmk2aENIRksxUXNiWjRXTTNkU05F?=
 =?utf-8?B?TU5tTVIrQ24vM2VtVWUrNUVWeDFzMnFWNXFVbzdHb1ExREVwYVRhZXJ1SnNQ?=
 =?utf-8?B?Q3dKN2NMbUdrRytXQkhDSmxKbW1NRDljTTNmd1F5c3phb09yTmhTdWxMY0xz?=
 =?utf-8?B?UGlxV1hVUVZmYTcrYzhmSUtaUVIzc0VvWmxIOGp4eTV2ZlNVZnIrRi9WeDdu?=
 =?utf-8?B?NkRtOHc1SHpaMFhJbkhabW1VQXRhSjV2T3ZiU0dJdEtaZE9JVVEyQm1xSEpT?=
 =?utf-8?B?Q1h0ZGZCQ2pKUGhRZ050d1VDSUZwQXByM3VUZUtsV09tek9FUUh0cEQ1b2Rs?=
 =?utf-8?B?dnBWdlE0VTRvcEZybWE4Nnh0M2NRSlNGdlNxMHFWbzdlWW42VGY2eTB6Tmdk?=
 =?utf-8?B?b2g3SlVlZnB6azVyOEFSZzR4bVI3L2ZiNkRZT1MweVhHUEVKSHBjOThURkkv?=
 =?utf-8?B?d20zSGtpcW84ajUyRzlxSi8zdlhXbzFKMHVmV3BpYlV0RnlkbWZQTlVVbGJR?=
 =?utf-8?B?U3A5TjN4SkxtWmFKZjd5eU1mQWEwdWlCQTdnWXZoRStNOUk4eHRNLzh2dG9F?=
 =?utf-8?B?cG1OUDd2eFc2dUFzZ3FFVm0rS3NPeHZPTUpVNTRLeGorOGJVVjV1Z20vUUti?=
 =?utf-8?Q?AV0blmY/gmrMC7q0=3D?=
X-Exchange-RoutingPolicyChecked: AS47IiPJW6uflLmAn3Ywq7cfG3r3zdtj/KxWje0jTVRewuZ5QgDEjKHAhdUL5AvMyOKs/ACYE11pknvyJerecfrFUOieE80JxU0dLhWj3Q3up1FBNrjQ6rj6PlXSZpF023ZLVfczI/VRIFpBVSNmZmZBFi+Xjdd08Myayahj24hleQjzOJWzMyEKbyqOPs41KrcExeJdU6Boi+wQ4ZTGNgHhX/FzQuhvkQsD1Pay9+3u6SkAoJGazH48JBqnlv8g+4aRE54Ca92yGi7tRNNFew1MF1+at4mY5/fiiHKWhUdLeZxXYMHlHZYxesIACVjyj400p6FFSWOra9ifnSz6ag==
X-MS-Exchange-CrossTenant-Network-Message-Id: fed1bacf-989c-4021-394c-08def865904d
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 11:33:43.3972 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b2yMOy4X75MwqaLwInxFpBIRMqy6Byv0IVLlQ6juGOe65bZd9EksYwrFeML659jK0INqRrJ8X7W/Llgdb3oIpCB4v3jQtLq9CaM7jK4Vt5M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7665
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

--------------ovHmvaccVANSpRQxeYJxu5CH
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 30-07-2026 08:51 pm, Michal Wajdeczko wrote:
> Add simple sanity tests for all xe_any macros to make sure they
> are working as expected.
>
> Signed-off-by: Michal Wajdeczko<michal.wajdeczko@intel.com>
> ---
>   drivers/gpu/drm/xe/tests/Makefile       |   1 +
>   drivers/gpu/drm/xe/tests/xe_any_kunit.c | 188 ++++++++++++++++++++++++
>   2 files changed, 189 insertions(+)
>   create mode 100644 drivers/gpu/drm/xe/tests/xe_any_kunit.c
>
> diff --git a/drivers/gpu/drm/xe/tests/Makefile b/drivers/gpu/drm/xe/tests/Makefile
> index f7aa47f11a36..0b809a252cfa 100644
> --- a/drivers/gpu/drm/xe/tests/Makefile
> +++ b/drivers/gpu/drm/xe/tests/Makefile
> @@ -7,6 +7,7 @@ xe_live_test-y = xe_live_test_mod.o
>   # Normal kunit tests
>   obj-$(CONFIG_DRM_XE_KUNIT_TEST) += xe_test.o
>   xe_test-y = xe_test_mod.o \
> +	xe_any_kunit.o \
>   	xe_args_test.o \
>   	xe_pci_test.o \
>   	xe_rtp_tables_test.o \
> diff --git a/drivers/gpu/drm/xe/tests/xe_any_kunit.c b/drivers/gpu/drm/xe/tests/xe_any_kunit.c
> new file mode 100644
> index 000000000000..02540d3b5357
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/tests/xe_any_kunit.c
> @@ -0,0 +1,188 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#include <kunit/test.h>
> +
> +#include "tests/xe_kunit_helpers.h"
> +#include "tests/xe_pci_test.h"
> +#include "xe_any.h"
> +#include "xe_device.h"
> +
> +static void test_to_xe(struct kunit *test)
> +{
> +	struct xe_device *xe = test->priv;
> +	struct xe_tile *tile = xe_device_get_root_tile(xe);
> +	struct xe_gt *gt = tile->primary_gt;
> +	struct device *dev = xe->drm.dev;
> +	struct pci_dev *pdev = to_pci_dev(dev);
> +	const struct xe_device *cxe = xe;
> +	const struct xe_tile *ctile = tile;
> +	const struct xe_gt *cgt = gt;
> +
> +	KUNIT_EXPECT_PTR_EQ(test, xe, xe_any_to_xe(xe));
> +	KUNIT_EXPECT_PTR_EQ(test, xe, xe_any_to_xe(tile));
> +	KUNIT_EXPECT_PTR_EQ(test, xe, xe_any_to_xe(gt));
> +	KUNIT_EXPECT_PTR_EQ(test, xe, xe_any_to_xe(dev));
> +	KUNIT_EXPECT_PTR_EQ(test, xe, xe_any_to_xe(pdev));

Please add struct drm_device *drm = &xe->drm; as well

> +
> +	KUNIT_EXPECT_PTR_EQ(test, cxe, xe_any_to_xe(cxe));
> +	KUNIT_EXPECT_PTR_EQ(test, cxe, xe_any_to_xe(ctile));
> +	KUNIT_EXPECT_PTR_EQ(test, cxe, xe_any_to_xe(cgt));
> +}
> +
> +static void test_to_pdev(struct kunit *test)
> +{
> +	struct xe_device *xe = test->priv;
> +	struct xe_tile *tile = xe_device_get_root_tile(xe);
> +	struct xe_gt *gt = tile->primary_gt;
> +	struct device *dev = xe->drm.dev;
> +	struct pci_dev *pdev = to_pci_dev(dev);
> +
> +	KUNIT_EXPECT_PTR_EQ(test, pdev, xe_any_to_pdev(xe));
> +	KUNIT_EXPECT_PTR_EQ(test, pdev, xe_any_to_pdev(tile));
> +	KUNIT_EXPECT_PTR_EQ(test, pdev, xe_any_to_pdev(gt));
> +	KUNIT_EXPECT_PTR_EQ(test, pdev, xe_any_to_pdev(dev));
> +	KUNIT_EXPECT_PTR_EQ(test, pdev, xe_any_to_pdev(pdev));
> +
> +	/* mimic early probe stage */
> +	dev_set_drvdata(xe->drm.dev, NULL);
> +	KUNIT_EXPECT_PTR_EQ(test, pdev, xe_any_to_pdev(dev));
> +	KUNIT_EXPECT_PTR_EQ(test, pdev, xe_any_to_pdev(pdev));
> +}
> +
> +static void test_to_dev(struct kunit *test)
> +{
> +	struct xe_device *xe = test->priv;
> +	struct xe_tile *tile = xe_device_get_root_tile(xe);
> +	struct xe_gt *gt = tile->primary_gt;
> +	struct device *dev = xe->drm.dev;
> +	struct pci_dev *pdev = to_pci_dev(dev);
> +
> +	KUNIT_EXPECT_PTR_EQ(test, dev, xe_any_to_dev(xe));
> +	KUNIT_EXPECT_PTR_EQ(test, dev, xe_any_to_dev(tile));
> +	KUNIT_EXPECT_PTR_EQ(test, dev, xe_any_to_dev(gt));
> +	KUNIT_EXPECT_PTR_EQ(test, dev, xe_any_to_dev(dev));
> +	KUNIT_EXPECT_PTR_EQ(test, dev, xe_any_to_dev(pdev));
> +
> +	/* mimic early probe stage */
> +	dev_set_drvdata(xe->drm.dev, NULL);
> +	KUNIT_EXPECT_PTR_EQ(test, dev, xe_any_to_dev(dev));
> +	KUNIT_EXPECT_PTR_EQ(test, dev, xe_any_to_dev(pdev));
> +}
> +
> +static void test_to_drm(struct kunit *test)
> +{
> +	struct xe_device *xe = test->priv;
> +	struct drm_device *drm = &xe->drm;
> +	struct xe_tile *tile = xe_device_get_root_tile(xe);
> +	struct xe_gt *gt = tile->primary_gt;
> +	struct device *dev = xe->drm.dev;
> +	struct pci_dev *pdev = to_pci_dev(dev);
> +
> +	KUNIT_EXPECT_PTR_EQ(test, drm, xe_any_to_drm(xe));
> +	KUNIT_EXPECT_PTR_EQ(test, drm, xe_any_to_drm(drm));
> +	KUNIT_EXPECT_PTR_EQ(test, drm, xe_any_to_drm(tile));
> +	KUNIT_EXPECT_PTR_EQ(test, drm, xe_any_to_drm(gt));
> +	KUNIT_EXPECT_PTR_EQ(test, drm, xe_any_to_drm(dev));
> +	KUNIT_EXPECT_PTR_EQ(test, drm, xe_any_to_drm(pdev));
> +}
> +

Add test_if_pdev as well to check xe_any_if_pdev.

After updating those changes

Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>

> +static void test_if_xe(struct kunit *test)
> +{
> +	struct xe_device *xe = test->priv;
> +	struct drm_device *drm = &xe->drm;
> +	struct xe_tile *tile = xe_device_get_root_tile(xe);
> +	struct xe_gt *gt = tile->primary_gt;
> +	struct device *dev = xe->drm.dev;
> +	struct pci_dev *pdev = to_pci_dev(dev);
> +
> +	KUNIT_EXPECT_TRUE(test, xe && drm && tile && gt && dev && pdev);
> +	KUNIT_EXPECT_PTR_EQ(test, xe, xe_any_if_xe(xe));
> +	KUNIT_EXPECT_NULL(test, xe_any_if_xe(drm));
> +	KUNIT_EXPECT_NULL(test, xe_any_if_xe(tile));
> +	KUNIT_EXPECT_NULL(test, xe_any_if_xe(gt));
> +	KUNIT_EXPECT_NULL(test, xe_any_if_xe(dev));
> +	KUNIT_EXPECT_NULL(test, xe_any_if_xe(pdev));
> +}
> +
> +static void test_if_tile(struct kunit *test)
> +{
> +	struct xe_device *xe = test->priv;
> +	struct drm_device *drm = &xe->drm;
> +	struct xe_tile *tile = xe_device_get_root_tile(xe);
> +	struct xe_gt *gt = tile->primary_gt;
> +	struct device *dev = xe->drm.dev;
> +	struct pci_dev *pdev = to_pci_dev(dev);
> +
> +	KUNIT_EXPECT_TRUE(test, xe && drm && tile && gt && dev && pdev);
> +	KUNIT_EXPECT_NULL(test, xe_any_if_tile(xe));
> +	KUNIT_EXPECT_NULL(test, xe_any_if_tile(drm));
> +	KUNIT_EXPECT_PTR_EQ(test, tile, xe_any_if_tile(tile));
> +	KUNIT_EXPECT_NULL(test, xe_any_if_tile(gt));
> +	KUNIT_EXPECT_NULL(test, xe_any_if_tile(dev));
> +	KUNIT_EXPECT_NULL(test, xe_any_if_tile(pdev));
> +}
> +
> +static void test_if_gt(struct kunit *test)
> +{
> +	struct xe_device *xe = test->priv;
> +	struct drm_device *drm = &xe->drm;
> +	struct xe_tile *tile = xe_device_get_root_tile(xe);
> +	struct xe_gt *gt = tile->primary_gt;
> +	struct device *dev = xe->drm.dev;
> +	struct pci_dev *pdev = to_pci_dev(dev);
> +
> +	KUNIT_EXPECT_TRUE(test, xe && drm && tile && gt && dev && pdev);
> +	KUNIT_EXPECT_NULL(test, xe_any_if_gt(xe));
> +	KUNIT_EXPECT_NULL(test, xe_any_if_gt(drm));
> +	KUNIT_EXPECT_NULL(test, xe_any_if_gt(tile));
> +	KUNIT_EXPECT_PTR_EQ(test, gt, xe_any_if_gt(gt));
> +	KUNIT_EXPECT_NULL(test, xe_any_if_gt(dev));
> +	KUNIT_EXPECT_NULL(test, xe_any_if_gt(pdev));
> +}
> +
> +static void test_to_id(struct kunit *test)
> +{
> +	struct xe_device *xe = test->priv;
> +	struct xe_tile *tile = xe_device_get_root_tile(xe);
> +	struct xe_gt *gt = tile->primary_gt;
> +	struct device *dev = xe->drm.dev;
> +	struct pci_dev *pdev = to_pci_dev(dev);
> +	const struct xe_device *cxe = xe;
> +	const struct xe_tile *ctile = tile;
> +	const struct xe_gt *cgt = gt;
> +
> +	tile->id = 1;
> +	gt->info.id = 2;
> +
> +	KUNIT_EXPECT_EQ(test, 0, xe_any_id(xe));
> +	KUNIT_EXPECT_EQ(test, 1, xe_any_id(tile));
> +	KUNIT_EXPECT_EQ(test, 2, xe_any_id(gt));
> +	KUNIT_EXPECT_EQ(test, 0, xe_any_id(dev));
> +	KUNIT_EXPECT_EQ(test, 0, xe_any_id(pdev));
> +	KUNIT_EXPECT_EQ(test, 0, xe_any_id(cxe));
> +	KUNIT_EXPECT_EQ(test, 1, xe_any_id(ctile));
> +	KUNIT_EXPECT_EQ(test, 2, xe_any_id(cgt));
> +}
> +
> +static struct kunit_case xe_any_tests[] = {
> +	KUNIT_CASE(test_to_xe),
> +	KUNIT_CASE(test_to_dev),
> +	KUNIT_CASE(test_to_pdev),
> +	KUNIT_CASE(test_to_drm),
> +	KUNIT_CASE(test_if_xe),
> +	KUNIT_CASE(test_if_tile),
> +	KUNIT_CASE(test_if_gt),
> +	KUNIT_CASE(test_to_id),
> +	{}
> +};
> +
> +static struct kunit_suite xe_any_test_suite = {
> +	.name = "xe_any",
> +	.test_cases = xe_any_tests,
> +	.init = xe_kunit_helper_xe_device_test_init,
> +};
> +
> +kunit_test_suite(xe_any_test_suite);
--------------ovHmvaccVANSpRQxeYJxu5CH
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 30-07-2026 08:51 pm, Michal
      Wajdeczko wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20260730152121.576-16-michal.wajdeczko@intel.com">
      <pre wrap="" class="moz-quote-pre">Add simple sanity tests for all xe_any macros to make sure they
are working as expected.

Signed-off-by: Michal Wajdeczko <a class="moz-txt-link-rfc2396E" href="mailto:michal.wajdeczko@intel.com">&lt;michal.wajdeczko@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/tests/Makefile       |   1 +
 drivers/gpu/drm/xe/tests/xe_any_kunit.c | 188 ++++++++++++++++++++++++
 2 files changed, 189 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/tests/xe_any_kunit.c

diff --git a/drivers/gpu/drm/xe/tests/Makefile b/drivers/gpu/drm/xe/tests/Makefile
index f7aa47f11a36..0b809a252cfa 100644
--- a/drivers/gpu/drm/xe/tests/Makefile
+++ b/drivers/gpu/drm/xe/tests/Makefile
@@ -7,6 +7,7 @@ xe_live_test-y = xe_live_test_mod.o
 # Normal kunit tests
 obj-$(CONFIG_DRM_XE_KUNIT_TEST) += xe_test.o
 xe_test-y = xe_test_mod.o \
+	xe_any_kunit.o \
 	xe_args_test.o \
 	xe_pci_test.o \
 	xe_rtp_tables_test.o \
diff --git a/drivers/gpu/drm/xe/tests/xe_any_kunit.c b/drivers/gpu/drm/xe/tests/xe_any_kunit.c
new file mode 100644
index 000000000000..02540d3b5357
--- /dev/null
+++ b/drivers/gpu/drm/xe/tests/xe_any_kunit.c
@@ -0,0 +1,188 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#include &lt;kunit/test.h&gt;
+
+#include &quot;tests/xe_kunit_helpers.h&quot;
+#include &quot;tests/xe_pci_test.h&quot;
+#include &quot;xe_any.h&quot;
+#include &quot;xe_device.h&quot;
+
+static void test_to_xe(struct kunit *test)
+{
+	struct xe_device *xe = test-&gt;priv;
+	struct xe_tile *tile = xe_device_get_root_tile(xe);
+	struct xe_gt *gt = tile-&gt;primary_gt;
+	struct device *dev = xe-&gt;drm.dev;
+	struct pci_dev *pdev = to_pci_dev(dev);
+	const struct xe_device *cxe = xe;
+	const struct xe_tile *ctile = tile;
+	const struct xe_gt *cgt = gt;
+
+	KUNIT_EXPECT_PTR_EQ(test, xe, xe_any_to_xe(xe));
+	KUNIT_EXPECT_PTR_EQ(test, xe, xe_any_to_xe(tile));
+	KUNIT_EXPECT_PTR_EQ(test, xe, xe_any_to_xe(gt));
+	KUNIT_EXPECT_PTR_EQ(test, xe, xe_any_to_xe(dev));
+	KUNIT_EXPECT_PTR_EQ(test, xe, xe_any_to_xe(pdev));</pre>
    </blockquote>
    <p>Please add&nbsp;<span style="white-space: pre-wrap">struct drm_device *drm = &amp;xe-&gt;drm; </span>as
      well&nbsp;</p>
    <blockquote type="cite" cite="mid:20260730152121.576-16-michal.wajdeczko@intel.com">
      <pre wrap="" class="moz-quote-pre">
+
+	KUNIT_EXPECT_PTR_EQ(test, cxe, xe_any_to_xe(cxe));
+	KUNIT_EXPECT_PTR_EQ(test, cxe, xe_any_to_xe(ctile));
+	KUNIT_EXPECT_PTR_EQ(test, cxe, xe_any_to_xe(cgt));
+}
+
+static void test_to_pdev(struct kunit *test)
+{
+	struct xe_device *xe = test-&gt;priv;
+	struct xe_tile *tile = xe_device_get_root_tile(xe);
+	struct xe_gt *gt = tile-&gt;primary_gt;
+	struct device *dev = xe-&gt;drm.dev;
+	struct pci_dev *pdev = to_pci_dev(dev);
+
+	KUNIT_EXPECT_PTR_EQ(test, pdev, xe_any_to_pdev(xe));
+	KUNIT_EXPECT_PTR_EQ(test, pdev, xe_any_to_pdev(tile));
+	KUNIT_EXPECT_PTR_EQ(test, pdev, xe_any_to_pdev(gt));
+	KUNIT_EXPECT_PTR_EQ(test, pdev, xe_any_to_pdev(dev));
+	KUNIT_EXPECT_PTR_EQ(test, pdev, xe_any_to_pdev(pdev));
+
+	/* mimic early probe stage */
+	dev_set_drvdata(xe-&gt;drm.dev, NULL);
+	KUNIT_EXPECT_PTR_EQ(test, pdev, xe_any_to_pdev(dev));
+	KUNIT_EXPECT_PTR_EQ(test, pdev, xe_any_to_pdev(pdev));
+}
+
+static void test_to_dev(struct kunit *test)
+{
+	struct xe_device *xe = test-&gt;priv;
+	struct xe_tile *tile = xe_device_get_root_tile(xe);
+	struct xe_gt *gt = tile-&gt;primary_gt;
+	struct device *dev = xe-&gt;drm.dev;
+	struct pci_dev *pdev = to_pci_dev(dev);
+
+	KUNIT_EXPECT_PTR_EQ(test, dev, xe_any_to_dev(xe));
+	KUNIT_EXPECT_PTR_EQ(test, dev, xe_any_to_dev(tile));
+	KUNIT_EXPECT_PTR_EQ(test, dev, xe_any_to_dev(gt));
+	KUNIT_EXPECT_PTR_EQ(test, dev, xe_any_to_dev(dev));
+	KUNIT_EXPECT_PTR_EQ(test, dev, xe_any_to_dev(pdev));
+
+	/* mimic early probe stage */
+	dev_set_drvdata(xe-&gt;drm.dev, NULL);
+	KUNIT_EXPECT_PTR_EQ(test, dev, xe_any_to_dev(dev));
+	KUNIT_EXPECT_PTR_EQ(test, dev, xe_any_to_dev(pdev));
+}
+
+static void test_to_drm(struct kunit *test)
+{
+	struct xe_device *xe = test-&gt;priv;
+	struct drm_device *drm = &amp;xe-&gt;drm;
+	struct xe_tile *tile = xe_device_get_root_tile(xe);
+	struct xe_gt *gt = tile-&gt;primary_gt;
+	struct device *dev = xe-&gt;drm.dev;
+	struct pci_dev *pdev = to_pci_dev(dev);
+
+	KUNIT_EXPECT_PTR_EQ(test, drm, xe_any_to_drm(xe));
+	KUNIT_EXPECT_PTR_EQ(test, drm, xe_any_to_drm(drm));
+	KUNIT_EXPECT_PTR_EQ(test, drm, xe_any_to_drm(tile));
+	KUNIT_EXPECT_PTR_EQ(test, drm, xe_any_to_drm(gt));
+	KUNIT_EXPECT_PTR_EQ(test, drm, xe_any_to_drm(dev));
+	KUNIT_EXPECT_PTR_EQ(test, drm, xe_any_to_drm(pdev));
+}
+</pre>
    </blockquote>
    <p>Add test_if_pdev as well to check xe_any_if_pdev.</p>
    <p>After updating those changes</p>
    <p>Reviewed-by: Mallesh Koujalagi
      <a class="moz-txt-link-rfc2396E" href="mailto:mallesh.koujalagi@intel.com">&lt;mallesh.koujalagi@intel.com&gt;</a></p>
    <blockquote type="cite" cite="mid:20260730152121.576-16-michal.wajdeczko@intel.com">
      <pre wrap="" class="moz-quote-pre">
+static void test_if_xe(struct kunit *test)
+{
+	struct xe_device *xe = test-&gt;priv;
+	struct drm_device *drm = &amp;xe-&gt;drm;
+	struct xe_tile *tile = xe_device_get_root_tile(xe);
+	struct xe_gt *gt = tile-&gt;primary_gt;
+	struct device *dev = xe-&gt;drm.dev;
+	struct pci_dev *pdev = to_pci_dev(dev);
+
+	KUNIT_EXPECT_TRUE(test, xe &amp;&amp; drm &amp;&amp; tile &amp;&amp; gt &amp;&amp; dev &amp;&amp; pdev);
+	KUNIT_EXPECT_PTR_EQ(test, xe, xe_any_if_xe(xe));
+	KUNIT_EXPECT_NULL(test, xe_any_if_xe(drm));
+	KUNIT_EXPECT_NULL(test, xe_any_if_xe(tile));
+	KUNIT_EXPECT_NULL(test, xe_any_if_xe(gt));
+	KUNIT_EXPECT_NULL(test, xe_any_if_xe(dev));
+	KUNIT_EXPECT_NULL(test, xe_any_if_xe(pdev));
+}
+
+static void test_if_tile(struct kunit *test)
+{
+	struct xe_device *xe = test-&gt;priv;
+	struct drm_device *drm = &amp;xe-&gt;drm;
+	struct xe_tile *tile = xe_device_get_root_tile(xe);
+	struct xe_gt *gt = tile-&gt;primary_gt;
+	struct device *dev = xe-&gt;drm.dev;
+	struct pci_dev *pdev = to_pci_dev(dev);
+
+	KUNIT_EXPECT_TRUE(test, xe &amp;&amp; drm &amp;&amp; tile &amp;&amp; gt &amp;&amp; dev &amp;&amp; pdev);
+	KUNIT_EXPECT_NULL(test, xe_any_if_tile(xe));
+	KUNIT_EXPECT_NULL(test, xe_any_if_tile(drm));
+	KUNIT_EXPECT_PTR_EQ(test, tile, xe_any_if_tile(tile));
+	KUNIT_EXPECT_NULL(test, xe_any_if_tile(gt));
+	KUNIT_EXPECT_NULL(test, xe_any_if_tile(dev));
+	KUNIT_EXPECT_NULL(test, xe_any_if_tile(pdev));
+}
+
+static void test_if_gt(struct kunit *test)
+{
+	struct xe_device *xe = test-&gt;priv;
+	struct drm_device *drm = &amp;xe-&gt;drm;
+	struct xe_tile *tile = xe_device_get_root_tile(xe);
+	struct xe_gt *gt = tile-&gt;primary_gt;
+	struct device *dev = xe-&gt;drm.dev;
+	struct pci_dev *pdev = to_pci_dev(dev);
+
+	KUNIT_EXPECT_TRUE(test, xe &amp;&amp; drm &amp;&amp; tile &amp;&amp; gt &amp;&amp; dev &amp;&amp; pdev);
+	KUNIT_EXPECT_NULL(test, xe_any_if_gt(xe));
+	KUNIT_EXPECT_NULL(test, xe_any_if_gt(drm));
+	KUNIT_EXPECT_NULL(test, xe_any_if_gt(tile));
+	KUNIT_EXPECT_PTR_EQ(test, gt, xe_any_if_gt(gt));
+	KUNIT_EXPECT_NULL(test, xe_any_if_gt(dev));
+	KUNIT_EXPECT_NULL(test, xe_any_if_gt(pdev));
+}
+
+static void test_to_id(struct kunit *test)
+{
+	struct xe_device *xe = test-&gt;priv;
+	struct xe_tile *tile = xe_device_get_root_tile(xe);
+	struct xe_gt *gt = tile-&gt;primary_gt;
+	struct device *dev = xe-&gt;drm.dev;
+	struct pci_dev *pdev = to_pci_dev(dev);
+	const struct xe_device *cxe = xe;
+	const struct xe_tile *ctile = tile;
+	const struct xe_gt *cgt = gt;
+
+	tile-&gt;id = 1;
+	gt-&gt;info.id = 2;
+
+	KUNIT_EXPECT_EQ(test, 0, xe_any_id(xe));
+	KUNIT_EXPECT_EQ(test, 1, xe_any_id(tile));
+	KUNIT_EXPECT_EQ(test, 2, xe_any_id(gt));
+	KUNIT_EXPECT_EQ(test, 0, xe_any_id(dev));
+	KUNIT_EXPECT_EQ(test, 0, xe_any_id(pdev));
+	KUNIT_EXPECT_EQ(test, 0, xe_any_id(cxe));
+	KUNIT_EXPECT_EQ(test, 1, xe_any_id(ctile));
+	KUNIT_EXPECT_EQ(test, 2, xe_any_id(cgt));
+}
+
+static struct kunit_case xe_any_tests[] = {
+	KUNIT_CASE(test_to_xe),
+	KUNIT_CASE(test_to_dev),
+	KUNIT_CASE(test_to_pdev),
+	KUNIT_CASE(test_to_drm),
+	KUNIT_CASE(test_if_xe),
+	KUNIT_CASE(test_if_tile),
+	KUNIT_CASE(test_if_gt),
+	KUNIT_CASE(test_to_id),
+	{}
+};
+
+static struct kunit_suite xe_any_test_suite = {
+	.name = &quot;xe_any&quot;,
+	.test_cases = xe_any_tests,
+	.init = xe_kunit_helper_xe_device_test_init,
+};
+
+kunit_test_suite(xe_any_test_suite);
</pre>
    </blockquote>
  </body>
</html>

--------------ovHmvaccVANSpRQxeYJxu5CH--
