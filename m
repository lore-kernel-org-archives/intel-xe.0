Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53D73CA1012
	for <intel-xe@archiver.kernel.org>; Wed,  3 Sep 2025 22:19:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16D0410E953;
	Wed,  3 Sep 2025 22:19:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P9SFZ6va";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E5AE10E953
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Sep 2025 22:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756937979; x=1788473979;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=TY1ZJbwdbgLA/ZeQDGPXg/bpjSSaAPymSt2GkO9AwiI=;
 b=P9SFZ6va2oD9c4JZU0vYjMauRq2SUu9Vmw8eSx2d33vCy7LgIHIIbnqo
 NXpyJ/ZAg32UnAvt/LQJFmmTya3cPwyXUFVj1nJL7EqN/0n1IGdoY5y5N
 Z9IgLAePODck7URorC2f7TzU4FAPkc8x/cMEl0lN5BEWGi/5iVnCgVWS7
 IM9IKwh5odhW2IIJDsRLZtBBsP+CXsOFOZuIlb9WM05P8+F6kNTmkKaWq
 lBBZkWqMZ6NqM3fzhWIxFZoNGLuoVtNVWX6nIaSjLycHvn6PYm1dWxQtJ
 kFFue9/l9+bWxVae1hUaAfJMw9g+7vcVSqB5kNa/9U7/8set2jmaaqai8 g==;
X-CSE-ConnectionGUID: uhcbJH3HS+OqDzpOOGPB6w==
X-CSE-MsgGUID: oJsz68B0THqQ7hJsbnF/yQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11542"; a="58299646"
X-IronPort-AV: E=Sophos;i="6.18,236,1751266800"; d="scan'208";a="58299646"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2025 15:19:39 -0700
X-CSE-ConnectionGUID: OWZWKbxMTYyKIFsSJ586Aw==
X-CSE-MsgGUID: haDktXv/RA6ccniC3fF2EA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,236,1751266800"; d="scan'208";a="175852196"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2025 15:19:38 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 3 Sep 2025 15:19:38 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 3 Sep 2025 15:19:38 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.87) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 3 Sep 2025 15:19:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tKyeyGey6V+4BxcG33dIAg4mUxry7lK6s8yBCUVMyxRLfwpESx2pyjdX4EKeDrwKSWpo1nWDdxgdbArJyUN3HULm6IIHyj8Cz0AzHU2RbunpYmZa+8gPRLzjBsu8BMrFZlRtv/crttV1QcsdHQ+zo9+QacsznCxRSWtD6rXGGL25n/SC+Xk7eMn9gJcztfzZMRBadaE+8pqoNk+fjx6qmU/PodSwIg1ZAGp3lgZad8qIsjiXjeJqLMlEvBT+Qbd6McfOtFZMXw591g8w9/vaEOkJANpUy8q9c5IgghEZcVgKGf0FE7YDdJzS2LYAHDU1pYbgTJsP5hJtljPtfll3LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2ME2FX9ZoGC5RPiJoRuef696FVXWYQZImQRIxCpClt4=;
 b=bcUPePA5fSNXFNT94u00n+TAyWt8eq7R2BjLJuvrO35LFfNcN18SmbbP4CG3YkaYt3NPtk9LKuScEeaSyufI320+4rdNJfjXe5ciSoTlul8V2aQpUQX5NEPgXSk1Y59iLvj1RkA4mQxLPl67Pw7yrhqRIVLkjcDREHTLey92TtpeeoR/gbeYc/Rdd/qoc+aeLBsOmHdrkby+vpIkVM2UUy278cRr+hsSY/VBIipTV6aYemIXcSC6xKLcNd0aJ/yptK0KzNPLiWSi2q29QESe0nRYMOk2qL00HFjuEOb5kOSyFlsmVSlISVsLMyjmwLqiw/gsfytUdVLZx4gDc9dlTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by LV3PR11MB8725.namprd11.prod.outlook.com (2603:10b6:408:21e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Wed, 3 Sep
 2025 22:19:35 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%5]) with mapi id 15.20.9073.026; Wed, 3 Sep 2025
 22:19:35 +0000
Message-ID: <da185812-efc4-4085-832a-3e10b6bc68a5@intel.com>
Date: Thu, 4 Sep 2025 00:19:33 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/7] drm/xe: Define verbose debug macros
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Thomas Hellstrom <thomas.hellstrom@intel.com>
References: <20250903213712.6364-1-michal.wajdeczko@intel.com>
 <20250903213712.6364-6-michal.wajdeczko@intel.com>
 <z5gfl545upuwn2eg4didegof4xdj55rxmo4g65tswpbijgqykj@omcamj3erznn>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <z5gfl545upuwn2eg4didegof4xdj55rxmo4g65tswpbijgqykj@omcamj3erznn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR07CA0303.eurprd07.prod.outlook.com
 (2603:10a6:800:130::31) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|LV3PR11MB8725:EE_
X-MS-Office365-Filtering-Correlation-Id: 12066163-89c9-4c73-deb5-08ddeb37f711
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R3VKUTlVdFYrVG8rVjFkY0hJeGxUQ1p2V3UyeDM1VUNpMzh5Uy9PbkxOa0JF?=
 =?utf-8?B?d2hOQzE1WVpiSnZsZWJPWXBsR2o0cERweWVPSnViTk4vVEpEYTZicDRrdGlM?=
 =?utf-8?B?WEJwSElXZHBndkhWV2hEWnhOVVE1Wkp5cWVlM1k1cnhmNVZCSWFkdG5QMkg4?=
 =?utf-8?B?aXJmWDQxMGZNdnF3Tjh4UnhWODRHR01QWjZxNGdTZHRteHNNc05QT25jdGNh?=
 =?utf-8?B?RTBLNWZ5SUNRVDBJanU0YmNhQmgxZ3BtWVVUWnlmTEpTTkEybC9OT3Zaemkw?=
 =?utf-8?B?RGZsZXdXOHJPK0JIaUFoT0tkNG14clhad2E1QzBHazROWVF5MDRKT3lteTA3?=
 =?utf-8?B?V0xLenFXVjdGb0NhT3NFOHZVWStsclBKOU1KSVpvTnh2QUhFSjZWWEFFTzVr?=
 =?utf-8?B?SlRvY0Jsc3d0VVBhZTNHSUxkd1VCM0pZMjZlbmRxUTF1Vkh4bkNBQncxU3ZX?=
 =?utf-8?B?cDZMU2tEb000QU43M09UVEV5R1VOTkxDUEpvZjdWU3dqOVRQOXdLUlJjRlo4?=
 =?utf-8?B?azdpLy9ZTXc5aThqeDFLS3FWUFdxbzhNdVQrbjlobW9wSDJ0ZDlkcDArZ3NE?=
 =?utf-8?B?ZXRIdmU3QkZlQ0FDamg3QXoyNWtYcitIaG9mQmJteWxRSUFJRlBWV2xvTG9y?=
 =?utf-8?B?bkREVHo5YUJqTG8xWVNHM3ZRVGNMamJiRmJPdHovQ0l6Mk9jbXY4UW5GUXV3?=
 =?utf-8?B?ZStmSEFLT0RWa2E5bzh6WFYzTVlUVzduQU5aWHVjYTF6dnQ0ZTd6NkJPeFpT?=
 =?utf-8?B?VmpFNU04QjhPMUpuTFc0L1h6eXdkV3U5Qms1cGorbVhENWpETVhmK3A4Y3Nh?=
 =?utf-8?B?RWdZOS8vODgzb29oNTRwMVBqR2ZQVEN6Qk9RbmVoZ3pDQURDZXhXclZ2RzZE?=
 =?utf-8?B?UnVJd1hIbWtHY2lxbHF4UVNuenlUY2c0WjNTYWltVzFtbkd0Mm1iUS93cHA3?=
 =?utf-8?B?b3grVlBka3FVTTkvWk9oOXhEN2ZaMTFsOU4vaWwyUzBOak52anBLKzZzVjM0?=
 =?utf-8?B?UlphQk55TU9BMzY1YXIzYjBOaFVCckljV1VmQS9hRURBb1FXMTRRbStUaTNF?=
 =?utf-8?B?WWV2RnQzOGwweW5ySituVmVxQWZyRVRqTG1jbFZCTnhqalU3NkFCaDA3a01X?=
 =?utf-8?B?L0xiTDNJMXhZQlVIcm1RbXVrY1owSmtVVGY0eEcxeXVEdFY4R241b21lL1po?=
 =?utf-8?B?QjYzejJ5R0J5bzg1dTdmVkpvSkdBV3hwcHU4UXlvRm0xdFlyblNsbzNOcjl2?=
 =?utf-8?B?b2F0WmdFN3A5MGN2VnBxNU1kcXlOandEOFJSZDVNRWszVUJMWkdpbmRGSlpk?=
 =?utf-8?B?L29CZ0FKNUZGTWcwSXBoczBzYXUxWkdKRmRma3g0ZlI2ZnpEdWdqMW5sdTN2?=
 =?utf-8?B?N3lQdTBCNjFBZEtZNXdjL3hEdlVVVVNLY3ByWmtNM3JRWVIycHVTNmlhTUJT?=
 =?utf-8?B?bTRlcC9aV0E5TklYUTNYaHZGMy9KT3RRRDNtcFZ5UkcrRFRHT2hLODV0cVVP?=
 =?utf-8?B?SkEzU3N5YmJoN0ZsUGM0eUZDOXcyUDZGVUtta0FuQzA1dTZQTEY4Wno2RDRT?=
 =?utf-8?B?WDRxVmtIaVNKVlltekVhZ2dlWktGVVpreGl5MkhHQ24wTkFRSFIyR0xpaloz?=
 =?utf-8?B?UXBPQlB4S3l6NkZLKzFRT0kxSVI3bXlIOE0yd0pLWEpXMmduc3J3UmdSY1cy?=
 =?utf-8?B?VTVCU0hWNnZQcXZiQ201elYzcGhSYjR4SzhmVzVQWThNRWdqWkN0N2hFY1hx?=
 =?utf-8?B?dWRIejlGNnlaTHNuR0hiS1I2VmZFM2x3eVRPVlFRcTZIQjZ4M3JDemhDRklu?=
 =?utf-8?B?NTZoMUFuOUZHcm5GTzQ1bFdOQXRDZ0JadFZWdGlTby9rbG9ZNTQxaTFLKzlo?=
 =?utf-8?B?bXU1c3NGS2huVzRVVENqRVd4VE1SQ2YvOWlnV2Q4b0RVYWNGOFhud3pQcUR5?=
 =?utf-8?Q?3hxxUsaC1Bo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?blI4dWhLQmZwWnRpTTIxd3BBd1hwTE5PbWtHZGRyK2hKa3hrRnFLbXZLazI2?=
 =?utf-8?B?T3V4SGgzRVRCbWNWZVl1MjBlZTNUQUxuVFhzVy8rQjIyMjEwL1lnNEgxRmlZ?=
 =?utf-8?B?V29idnJLMjZjN0R1TlQ2YVpDM0Z1UGJRNitjdTByS1hTeUxKbjFMYzRQQ3lO?=
 =?utf-8?B?MG1sSXJ1QmRiUlE4QTd3U2NPRmVQUnJHQnhpSmd0eHAxbU1zbTlYeERNQXJG?=
 =?utf-8?B?eFJTeE1oRzBPdktBejZkenFjbkM1K1JrQ2xJRS9yajNCd0EzUURtSkg4UDM4?=
 =?utf-8?B?M0crN2ZNays4alRFTnliVDlSQk8ranMybGFlZmFDcmd5SUtiN0JuMVRoZmxD?=
 =?utf-8?B?c3VlYllLVXd3MkZXdW1TTnB4ZnVSUUt3VmpaN3Z1Qy9PQS9ackF4ekt6dXRI?=
 =?utf-8?B?T29yYkR6aWxkWCtheHZMeDl1cEUrejh5TTRzVHVFRzIxN0FoMTZibURvK2th?=
 =?utf-8?B?Rm11ZEI5OG9ZRCtTT3RISHN0QWI5bHh5b1JJajRRMjljVnRtV0xFOFlCNjNV?=
 =?utf-8?B?dE4rMnFUTDdqMXZVMDUxa095c3oxYzU3QzA2aElGS2lTSEd3Rm5RcVFQVWVj?=
 =?utf-8?B?OEIyN3dnTVk2KzA5V1F5YlpBenpoWk5FNjRqUGN2anhUZmVZM2JvYkRCU3VQ?=
 =?utf-8?B?WTVnV3dTS3pJaDh3REtkeWd2UVRlalNoSjN4SXhaaFZWUTdGOXdtL0QrUDFt?=
 =?utf-8?B?dWY3Wncyd0RVVWN2OThPVWF5UHZKa3pIOFlUZEJMV1BBV2FMODNMZkQyNHRv?=
 =?utf-8?B?cTh4Nm9YNHZmRFArVnlHKzYwZFZhc2F1cDlJcFRPNCtwSGozRVZpdmk4U2NV?=
 =?utf-8?B?d1JyWmdmay9pazhKclU0NmpCV2dMYW5BRDJNUVBZU3RySUszWmJDUnZmbHJv?=
 =?utf-8?B?ZzZkWEtod1NGcVA0K0ZHWmc0U3JoZUtRdlhnQXB4YXJMRHhYK3VtVFg1MnNp?=
 =?utf-8?B?bnArMm1JRlh6Z2VEaHNvMHFLOXhjcDJNaU1oVUw0OWZ5YzI1clpSRUl1bXNn?=
 =?utf-8?B?UFhoa1N1dks4U0oyZnhJYy9yRTZwZW1lZ3I4RmcrL2dkWG94dk0vRm50b3VH?=
 =?utf-8?B?bUlHRGlLV0x6NzR6M1BZbjlTU1YzYytuekhPd3BqU2Q4TThuT3Jac0k4NFZX?=
 =?utf-8?B?aFJ1dVQ1V25qcllxTjc4R2lZb3NsbktPN01zVkFvSDRpUzNWcngyeXAzdEpM?=
 =?utf-8?B?MkZuNGNacnYzOVRWcTVHNXNNZ2NydWFZMzEyY3RLaDh1dCtjaU4xcFUwVVBv?=
 =?utf-8?B?dWQzUFVibGFBd2hTVkh4dmhMMzlBSHhtZHBCb1k3bFFDcmZabmtuVUE2bU9J?=
 =?utf-8?B?V0owN0F2VG84b3UzcWhnZURkUzhqMzZvOHN5eUFtTnI3bmhTekxvL0JBRC8x?=
 =?utf-8?B?V2lUeFU0Mi81Tkw2bHNzYTArQS9adTB4TUt6dzdCWEZSQkwwWThyTEVOZy9P?=
 =?utf-8?B?TTZXd3dDL0hydzdnM3JLWThMWlpsdVZ2UTBzQXY1b3hxRTJBdkp5OEdZT1F5?=
 =?utf-8?B?UU9pUlRxcDJPTnhXbm81ZldUbmI2UGE4THJEQUltY2UyaUNUcGk3SFF0bU10?=
 =?utf-8?B?L3hpVVlmeU5VZkx0T0JtdEVlcUVzeSt3TDkrVVNoRFRnSkdJRHRQdTdhYXZ5?=
 =?utf-8?B?U2ZzNUNPK3VFOHlDZzNtR1hwTnRNMGRNamdoRXJTNXhLc09aZjJUQk5HVkpx?=
 =?utf-8?B?NHZnM3plSFlwL3p0WTBHMHIvWWY0MmxpVnJCQy96cXRXa3Jzb0ZtVTUrTTdN?=
 =?utf-8?B?ei9HMG9IaTV2TU9TNmNITWEwM09QTDVnQ3JOMThvdGFQb0lwbjhyS0VQa1ho?=
 =?utf-8?B?ejMvdmNuR2V1V3BXdldpNEVQRHp6NFN3SVFwWnJySmdEMW1MRzA1UGdDOFNR?=
 =?utf-8?B?UGp4NTBZdmlhcEFNV3dLSjRtYnB2M0I5bGtHTEZ6akdOa0NudElscUkyWm1j?=
 =?utf-8?B?U0RtbnZYYmIzMjJQMzVsKzd1K0E4WjNtMjZjM1lQQjd5QzZyejl1TnQwdC9y?=
 =?utf-8?B?M1lPaVM4MDYyWVovaThRa2NJL0RCdDUxcVpRMm5WUkVCTDJQeFcwSStFNTBo?=
 =?utf-8?B?dDJ2ZVFYMjRGRExESnNXU3pIblJwQ1NQdDFFYTJzczhWVUsyRnp4aDEraU1i?=
 =?utf-8?B?dlkzd3Uxb0ovejRMcGtZK1ZjZlZpcWxydmFZaTAyc1c5OWNWK3JwK2VISzVI?=
 =?utf-8?B?R3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 12066163-89c9-4c73-deb5-08ddeb37f711
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2025 22:19:35.8371 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1/HWTyvVRXUELmJPlMF5Q3flAD4UKS4gF+2v9SutzMA7KLyUG7ui4mMMXiqAoVBfGi9Deg1VdulMNwI+xVvnazd2yt3mRtNdFkuyh44I3Rk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8725
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



On 9/4/2025 12:06 AM, Lucas De Marchi wrote:
> On Wed, Sep 03, 2025 at 11:36:10PM +0200, Michal Wajdeczko wrote:
>> We might want to add (and in some cases already have) some debug
>> level messages that are too verbose and need to be guarded by the
>> CONFIG_DRM_XE_DEBUG. To simplify that define verbose variant of
>> our printk debug macros that will be compiled out on non-debug
>> builds, in same way like we already did with xe_asserts() macros.
> 
> thinking out loud... aren't we going too overboard with this?
> Looking at other places in the kernel we have pr_debug() and that's
> awesome as we can simply enable it via dyndbg when we want, with the
> granularity that matters for the issue we are looking at.

even if some dbg logs are disabled by default and not printing
anything until explicitly enabled by dyndbg or drm.debug flags,
they still add some code/text to the driver footprint.

and this patch just allows to add more logs for debug builds
and strip them in production where we know no one will use them

but still, this is just a proposal

> 
> Lucas De Marchi
> 
>>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> ---
>> drivers/gpu/drm/xe/xe_gt_printk.h   | 6 ++++++
>> drivers/gpu/drm/xe/xe_printk.h      | 6 ++++++
>> drivers/gpu/drm/xe/xe_tile_printk.h | 6 ++++++
>> 3 files changed, 18 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt_printk.h b/drivers/gpu/drm/xe/xe_gt_printk.h
>> index 8dc4217ddb4e..69c4553d0f80 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_printk.h
>> +++ b/drivers/gpu/drm/xe/xe_gt_printk.h
>> @@ -35,6 +35,12 @@
>> #define xe_gt_dbg(_gt, _fmt, ...) \
>>     xe_gt_printk((_gt), dbg, _fmt, ##__VA_ARGS__)
>>
>> +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
>> +#define xe_gt_dbg_verbose        xe_gt_dbg
>> +#else
>> +#define xe_gt_dbg_verbose(_gt, ...)    typecheck(struct xe_gt *, (_gt))
>> +#endif
>> +
>> #define xe_gt_WARN_type(_gt, _type, _condition, _fmt, ...) \
>>     xe_tile_WARN##_type((_gt)->tile, _condition, _fmt, ## __VA_ARGS__)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_printk.h b/drivers/gpu/drm/xe/xe_printk.h
>> index 691d3611b889..9ffa26c869da 100644
>> --- a/drivers/gpu/drm/xe/xe_printk.h
>> +++ b/drivers/gpu/drm/xe/xe_printk.h
>> @@ -36,6 +36,12 @@
>> #define xe_dbg(_xe, _fmt, ...) \
>>     xe_printk((_xe), dbg, _fmt, ##__VA_ARGS__)
>>
>> +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
>> +#define xe_dbg_verbose            xe_dbg
>> +#else
>> +#define xe_dbg_verbose(_xe, ...)    typecheck(struct xe_device *, (_xe))
>> +#endif
>> +
>> #define xe_WARN_type(_xe, _type, _condition, _fmt, ...) \
>>     drm_WARN##_type(&(_xe)->drm, _condition, _fmt, ## __VA_ARGS__)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_tile_printk.h b/drivers/gpu/drm/xe/xe_tile_printk.h
>> index ed951cdb08cb..33ebfd9722d3 100644
>> --- a/drivers/gpu/drm/xe/xe_tile_printk.h
>> +++ b/drivers/gpu/drm/xe/xe_tile_printk.h
>> @@ -34,6 +34,12 @@
>> #define xe_tile_dbg(_tile, _fmt, ...) \
>>     xe_tile_printk((_tile), dbg, _fmt, ##__VA_ARGS__)
>>
>> +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
>> +#define xe_tile_dbg_verbose        xe_tile_dbg
>> +#else
>> +#define xe_tile_dbg_verbose(_tile, ...)    typecheck(struct xe_tile *, (_tile))
>> +#endif
>> +
>> #define xe_tile_WARN_type(_tile, _type, _condition, _fmt, ...) \
>>     xe_WARN##_type((_tile)->xe, _condition, _fmt, ## __VA_ARGS__)
>>
>> -- 
>> 2.47.1
>>

