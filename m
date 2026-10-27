Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB37D606A31A
	for <intel-xe@archiver.kernel.org>; Tue, 27 Oct 2026 04:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=T+5Xzg9m
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A06710E1F1;
	Tue, 27 Oct 2026 04:24:40 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C759110E1F1
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Oct 2026 04:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793075075; x=1824611075;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=sgS5W1ON9eEWYgEArhdf+9TU19FyI7EgO+ae6MEGxJo=;
 b=T+5Xzg9mxVhZdWpecyt7MCj+JfAsvXxOpIOR28bwsSgJUnozEN6XlS1j
 InctR1E9z8vkci1t4kujgG6jUOxo3vherZ9+Lb+jkFcci9MLjDXak3lq/
 A2GicLVlc5WO/Z3A3KNNHMshVdupDKXdWjN0fuBnLryoIbx/fyfCPOdHG
 Rp2fcp1se+ZMfhjarrq8X+PfIJ4sojqfR/AVEh4ZiXcaeK1PnbDElyrn4
 KBDcNEDXbKFQvWEz0WV0tb8nhUJQbvFAtoCT7moGb3UPR1jEgkZDmSX3E
 FsKwtI/rXHRT/trDVSJXBswOVR95E9cjLnB9eF127JYZOKkP+A9Q8s7i1 w==;
X-CSE-ConnectionGUID: 6yya5ez6SQWburQizrhvsQ==
X-CSE-MsgGUID: 6kFlFDEIRD6cCAG+1quZ6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1780874"
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; d="scan'208,217";a="1780874"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2026 21:24:35 -0700
X-CSE-ConnectionGUID: iF6NYlhAR/yd316UEKMpJg==
X-CSE-MsgGUID: G+JwSfOhQn2B4Lu5I8hkuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; d="scan'208,217";a="4453555"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2026 21:24:35 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 26 Oct 2026 21:24:33 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Mon, 26 Oct 2026 21:24:33 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.35) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 26 Oct 2026 21:24:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FxCO7InGVvSyRpXEBIHth5BTm9Dodzfz9sM0T/cfwuLgqGOGa4P92qeKKIE0nrhmNDtbT2UJy/TH8JI6pIzc3a7Qc4G1hEdTVXnzBDlUUwDBDSQUdi0HgRDadUtOiPJqlywKYKfo92yxUrYOBgikHCniTOmOjF6OZSZhWksTmI3tad0h1vzNQk6MnGAwNpOYulRAUF4vO+FkVhwkf8tLGYPYn18JF0XzgD6KmG+gLyZaN/v5xgfWemitOUK1E2Nterp7z9NJsMIwBoS+rTnjceD6hAccQROtKpwm/2QTvxlSU9BL0dIHmegZ2R7Hcs8lFnqq/C45le9Z8ffYfo+McA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ze8RhKhuI1HThQ/IXp+bEDm8KcgpU/rynU/k8SRPZPA=;
 b=eAiBOsEWsrdpkvvXrbo6GccO62LdvsOkdAYvK7rs94m+tNahJA/2R/MwR6B/+Pvepb6X/AiaMC+vGsbZQpmowA5l5siP7Nz5E+nRTlBwsCRKdcVijOXWE8VGjmn3vEacyXigeuW9ordV13HvnENGAVaf5DlkuFjJoKZxV4UfAGhJszRn7Gi2UomMKk6AJZ5pmuq0iJt6i0XWMnOe713JBSBHtzaFobgcQ2hI1HAsVY4iiwAoHnJ4wa44fT7QCfIT9U7e34oF4hZnA8u311OSc+A8geid6gdHHywQOF9pgjqQqlxqC56uKoRTqN50ZxRuyErWNQiY2POgYFpC9xQUdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV0PR11MB9792.namprd11.prod.outlook.com (2603:10b6:408:385::5)
 by PH8PR11MB8258.namprd11.prod.outlook.com (2603:10b6:510:1c1::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 04:22:06 +0000
Received: from LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8]) by LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8%5]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 04:21:54 +0000
Content-Type: multipart/alternative;
 boundary="------------n02uf0TJz2F0qaCO25xggHNf"
Message-ID: <f983ccf6-e29f-485d-8f46-0b94ee252fb6@intel.com>
Date: Tue, 27 Oct 2026 09:51:44 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 06/13] drm/xe/cper: Emit cper record to trace buf
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <rodrigo.vivi@intel.com>, <daniele.ceraolospurio@intel.com>,
 <riana.tauro@intel.com>, <mallesh.koujalagi@intel.com>,
 <aravind.iddamsetty@intel.com>, <himal.prasad.ghimiray@intel.com>,
 <arvind.yadav@intel.com>, <syed.abdul.muqthyar.ahmed@intel.com>,
 <nitin.r.gote@intel.com>
References: <20261023043422.681260-15-badal.nilawar@intel.com>
 <20261023043422.681260-21-badal.nilawar@intel.com>
 <at9HoRyZmOwUYiyK@black.igk.intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <at9HoRyZmOwUYiyK@black.igk.intel.com>
X-ClientProxiedBy: MA5PR01CA0050.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d6::10) To LV0PR11MB9792.namprd11.prod.outlook.com
 (2603:10b6:408:385::5)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV0PR11MB9792:EE_|PH8PR11MB8258:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b110039-02c8-4d5b-bb9a-08df33e1d4be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|23010399003|8096899003|11063799006|4143699003|56012099006|261021121427099003|261022113327099003|261022105027099003|261009223027099003|10067099003|22082099003|18002099003|6133799003|261026140227099003|3023799007;
X-Microsoft-Antispam-Message-Info: pUCgrc0DR/BTmkbxb+fwllp1Sj4mN44G35Zq8cBB06q2fubjxGiRzMtzqdEPJrswYAfPLqW5K1C7DHnYhJokCc2ze2f+niTMvFwh+u0F6AvICVZhkMnkUjU+FsSPCJwAT4+AMH07wIqrGtwjsZ+XPB+F/Aa6jJ6gW6ffvfr5DOlWMhK8rrN7cv80uVdz8dCh+/clvbTNh5CRnFs9oiFNkhUxJrGj/mZnOfhz7NKbn7pORlYilL9TRq9S6xJshmhCrsjUVaW/SrFahC3VhLqIF7BRsEnVMaDLqKXlVYQFHvOy006DH3Sj5amCzc1Q+Gka78FpasDbeNXaatxbAK8+47MOaa3WAo8zdvPaqosd2LfgZAa4+ujHZkIKdUU6OyGaGgXoZAebomC0Vy9n/25AjoE2X4flKy7aHF9aaEmbD+qfZEvJargqQHhrgvipPhDEU2VMoHH0jnuA9ZAu+pJx1MiU+c2RaGFMlp0d6KiViLWJlSUYwKfT3r611rIGF3BG7fpshnIaOPoyFpeCPD4KQOZwzpIvIWDEuboFq8dKK+joPYuTwlA2kKF/5ERtoRnIsqg1u8iEP2WyWQK10ojNAPsNgloGED2x8SSiFNbSoHWgeuHCga3b9K3VlkDYPh5+wFYi+aybC4nvXMNAUi4aR/ZgMkJLkN7MtNzFQWZmXs0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV0PR11MB9792.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(8096899003)(11063799006)(4143699003)(56012099006)(261021121427099003)(261022113327099003)(261022105027099003)(261009223027099003)(10067099003)(22082099003)(18002099003)(6133799003)(261026140227099003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VlRjdUVRQlR0cEpUYkN3dnVMQ3VqQkJuMDRLRnBEc0dua21aRmNhUGZJWU9k?=
 =?utf-8?B?Z3NwTVprUEk5YzdUbVMrMFQyM1ZyNVZYVjdvamhxTktEbHR1aU9vSnc5UjYw?=
 =?utf-8?B?UXBseTVqVXNadDBKM2ZZT3JnNkM4WU9Tdkp5T3BocTdmVjBTSldhejlMUVBS?=
 =?utf-8?B?UXE0bnlaZkVsZzhvS09JMlRxZzUyUlJ0eWJwcE00djBZOWhHRmE1bUo2SlA0?=
 =?utf-8?B?UmZIOEplaTdIcjlDQ0hnNEliZWIyNWNWWEdxaGlTWlFyWi9mZDFRNy9VTGRu?=
 =?utf-8?B?S05pSG0yV21KT0FlNUpLOTZiTmZKY25jeEM0dGtuTUlzQTdQSXlzQ24wUEtC?=
 =?utf-8?B?L2hteGpCY0lLMklFZGRFUVpia3hCa2sxRFRrdWFPaDdQRG9wL3gyNFF5alZz?=
 =?utf-8?B?WEMxRjY3T04zenF5ZW9KTlAyWHlXVC80U3R0M3BDYmU2bVdXMHRTODJuRXFm?=
 =?utf-8?B?blRodGRMVXA2VlFYV1dDOXg4Tk1meWxraVQ0allqM05OQXNKUGpHSzU2Vm5I?=
 =?utf-8?B?c3BFRUlMbmgzYTM0a1JRQ3ZPV3UrTjhWQzkrellrWDBpSzI3dEtaaWJ4Zkxo?=
 =?utf-8?B?a3VCaVdXYzhuYVlMWG9DU0VMRkoxRnltblpmOWVGMXZDVzBWRGFMNzJSOW0z?=
 =?utf-8?B?a3YvbElCZ2tBMDVrZDN2Q2o5Y1p3RUlpR3hCS2FZenJTSHRRczROdW5CbDdL?=
 =?utf-8?B?aHFDTE5naGVhL2dxZk9TQmJ0WitOK3Zrb1FwZmExUXNRby9pM3kzWjlmNXhZ?=
 =?utf-8?B?SGZIcnVpVFBobjNtMXp0RnB6YzhEMFFhenYvSnhXZXU4TEpuN2FtbUkzZ2hV?=
 =?utf-8?B?T0hQRTY4akhheS96ZHpzVjF2TCtweWw5MEJlelVtcklRYmhhcm8yUG9VMWlF?=
 =?utf-8?B?d3RmdTNLM21TOWlEUndIcFpRTzB2cnF2S1ZyMW5pUGFwV3pyK0NVVFlpNGZk?=
 =?utf-8?B?bjRMRUhiZ1ZhY3RycXdPMUUyZWdRblFNQlpKMGxiQUw0aDlLMXBPNGJZN3Zv?=
 =?utf-8?B?K1hEWmpnVWxwbWQ2VVpsRGphMDdKdGh3UExsT3V3eWNkRjRNZzczT29tQ1hw?=
 =?utf-8?B?S3QyOEc1c2VXeWNpUDN2ZGJORi9hVUhYbmFWeUZPYlFGbjhJME5HdytyeFZ2?=
 =?utf-8?B?dGtSbXhQQ043dkxlM1Myczl5dXpkdWxCa1lPOFFtakkxOW5Ma1ZQSVA2L1Iz?=
 =?utf-8?B?OG44cmhvYmo3ZUNGeVhlOUluREhRdENkVUVxTitXUHppdHpjdTNSS2NERUtR?=
 =?utf-8?B?M3c3OXFKTm1KSWx6dmNTdDg3Z1dYNTlRWUk3cFlLclc2RksrcUZYYzA3VFRK?=
 =?utf-8?B?aHRBVEFsUHJFVjVGeUpUZWk0NFd2V2JrUHNTYUxxSHV0aXVGU0Z3NTRCZmtp?=
 =?utf-8?B?bUh2bFRUejdoVEtpbDhVei8rbUFuVWJWWnYzank1N0c0Ny90KzdTUDVnWitX?=
 =?utf-8?B?ck1rcnYyZHNVRWlIbXQ3NlZ0eGwxMW1LOFJwWHNQOUpDODcxRkhBcCtZVUkx?=
 =?utf-8?B?Tlg2ejNVTVFFZWFaN0VaU3RKS2hGOWg1MFVHTWZLQjNuVW01RVV2VTRqYVBI?=
 =?utf-8?B?T1ZUTXZGTTVzQlUyZUlEVkhIcTJ1NkZHY2s2RDZyNDdpZEVlditFcU14Vncv?=
 =?utf-8?B?Q1daVnVGR0JLNVRYazJJclFKUlYyUTUzYnc5VUdoVTgyanlsRXJJVmRpU0FX?=
 =?utf-8?B?anFPQUErNXFOL1lKakhVWGFYelgwZGFsMXE5NUExUjBxWk5NQm1WRmprSGM1?=
 =?utf-8?B?a1dHODB0b3JiSE9XcEcrNE9aQnpoYWJ1TXlwM2xlZThMeitOZk5lUTN3dkE1?=
 =?utf-8?B?d3lLWDNheVk2Nkc1d1FBZ3FjVmxqa3hPUFRSRFpuQnEwbGR0V3RtZ1ZLL0hC?=
 =?utf-8?B?MThaQ0VkYWw1d2J6K1c2eDhxRHUxamZrQVUvVGFQTHBnWElFeWhqb0FtQUd6?=
 =?utf-8?B?M2wzaFBmL1FoMkVmSHU4UHd2SFJtTEQwYlVrRnZxU295ZGJ6OHJ4WXQzQ3pC?=
 =?utf-8?B?dkNTUVY1NzVZZDU4VVRZU0FpQnJLZGRtbDhlQ0NSeVV0S043N0oxbElUcVQv?=
 =?utf-8?B?RXhVckNJVTBselQ1ZmdYVFd0UGdpTVdiUjlnVUtJZ0VuWllyVEpLd3RHMjla?=
 =?utf-8?B?cUNrRldHNk1DbHM4OFIrUHFNMFl4N0N1U3BNdEJXRk01Sm9Ha0Era0lTMWFk?=
 =?utf-8?B?elVJOXhWbHVBYnMvN2tzVWNmR0V6eHVuN05LNnJZQ0IwTTBaN3RsQXNrU0Rr?=
 =?utf-8?B?dThmcHZJM05IZTF4MFprY3lqT3ZUd2VpazgyNEhFN3NMb0JiRHZpQzhDQ1lR?=
 =?utf-8?B?RjlHcXhZWVcwdkNGUWJoVzVOOWRyN1JWbHQyWWgxSllOZmplM21ndz09?=
X-Exchange-RoutingPolicyChecked: c6Bu0+KuJE9TH3RHISPsPHrkrT/ZrIDT0Qwc4f9dJhbHj9o3tNtxlbuJ57pZNKc3jXQAyetvcRKkoH/dgfmlv2KHXaQfJcfO/oKGlKaRJLecXspNRt5jBZVo+V5+eJn4JXnTTlCchKrikoXSQ0hlBU39Bft/Q5ycAWMnLiVDj60F4aSpfgs07V0pOkI0lzfKWilbD9JWw4F9Ik0FcHcE5Q7snww91KB458+7L9fluJDRxm9VbiZd7B8hjmDsS6z1wTqOrGUPWYIDlnwtkDfaD1UZQqPNUNq5uegZqPEYJvshQW2U+1G67JwxE9/WCXb9pe8wd1SBPwQrUeqds0b/NQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b110039-02c8-4d5b-bb9a-08df33e1d4be
X-MS-Exchange-CrossTenant-AuthSource: LV0PR11MB9792.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 04:21:54.0615 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q9dTS0dDZwoODPdyY1XsvZn/TxmwtgH0yliTp3pb10TBQuRv6pOobNxgyyzUReAX9d5PCFPmq/c/e0CO2G1dMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8258
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-4.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--------------n02uf0TJz2F0qaCO25xggHNf
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 26-10-2026 17:59, Raag Jadav wrote:
> On Fri, Oct 23, 2026 at 10:04:28AM +0530, Badal Nilawar wrote:
>> Add the xe_error_cper tracepoint and emit each assembled CPER record
>> through it. Besides the raw record, the event carries the device name,
>> platform ID, FRU ID, severity and the Intel error section header, so
>> tools can pick up the records from the trace buffer.
> ...
>
>> + * Example trace output::
>> + *
>> + *   xe_error_cper: dev=0000:03:00.0 severity=2
>> + *     platform_id=9046afe5-9041-5124-8614-92550d9e9da6
>> + *     fru_id=91befe38-2f61-3d7b-0000-000000000000
>> + *     intel_err_hdr_raw=
> 'intel_hdr_raw'

The specs uses intel_err_hdr_raw in the example trace output, so I kept 
the same naming here for consistency.

Thanks,

Badal

>
>> + *       01 02 00 18 00 00 00 01 00 00 00 00 64 77 51 14 ...
>> + *     cper_len=1772
>> + *     cper_raw=
>> + *       43 50 45 52 00 01 ff ff ff ff 01 00 02 00 00 00 ...
> ...
>
>> +	    TP_printk("dev=%s severity=%d platform_id=%pUl fru_id=%pUl intel_err_hdr_raw=%s cper_len=%u cper_raw=%s",
> Ditto.
>
> Raag
>
>> +		      __get_str(dev), __entry->sev,
>> +		      __entry->platform_id, __entry->fru_id,
>> +		      __print_hex(__entry->ihdr_raw,
>> +				  sizeof(struct xe_cper_intel_hdr)),
>> +		      __entry->cper_len,
>> +		      __print_hex(__get_dynamic_array(cper),
>> +				  __entry->cper_len))
--------------n02uf0TJz2F0qaCO25xggHNf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 26-10-2026 17:59, Raag Jadav wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:at9HoRyZmOwUYiyK@black.igk.intel.com">
      <pre wrap="" class="moz-quote-pre">On Fri, Oct 23, 2026 at 10:04:28AM +0530, Badal Nilawar wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Add the xe_error_cper tracepoint and emit each assembled CPER record
through it. Besides the raw record, the event carries the device name,
platform ID, FRU ID, severity and the Intel error section header, so
tools can pick up the records from the trace buffer.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
...

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+ * Example trace output::
+ *
+ *   xe_error_cper: dev=0000:03:00.0 severity=2
+ *     platform_id=9046afe5-9041-5124-8614-92550d9e9da6
+ *     fru_id=91befe38-2f61-3d7b-0000-000000000000
+ *     intel_err_hdr_raw=
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
'intel_hdr_raw'</pre>
    </blockquote>
    <p>
      <style>a {
    text-decoration: none;
    color: #464feb;
}tr th, tr td {
    border: 1px solid #e6e6e6;
}tr th {
    background-color: #f5f5f5;
}</style>The specs uses intel_err_hdr_raw in the example trace output,
      so I kept the same naming here for consistency.&nbsp;</p>
    <p>Thanks,</p>
    <p>Badal</p>
    <blockquote type="cite" cite="mid:at9HoRyZmOwUYiyK@black.igk.intel.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+ *       01 02 00 18 00 00 00 01 00 00 00 00 64 77 51 14 ...
+ *     cper_len=1772
+ *     cper_raw=
+ *       43 50 45 52 00 01 ff ff ff ff 01 00 02 00 00 00 ...
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
...

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+	    TP_printk(&quot;dev=%s severity=%d platform_id=%pUl fru_id=%pUl intel_err_hdr_raw=%s cper_len=%u cper_raw=%s&quot;,
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Ditto.

Raag

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+		      __get_str(dev), __entry-&gt;sev,
+		      __entry-&gt;platform_id, __entry-&gt;fru_id,
+		      __print_hex(__entry-&gt;ihdr_raw,
+				  sizeof(struct xe_cper_intel_hdr)),
+		      __entry-&gt;cper_len,
+		      __print_hex(__get_dynamic_array(cper),
+				  __entry-&gt;cper_len))
</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------n02uf0TJz2F0qaCO25xggHNf--
