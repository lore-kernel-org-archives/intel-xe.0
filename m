Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D77FC28B2F
	for <intel-xe@archiver.kernel.org>; Fri, 14 Mar 2025 07:24:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 012EB10E2EC;
	Fri, 14 Mar 2025 07:24:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Bv5SIkAa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1195B10E2EC
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Mar 2025 07:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741937086; x=1773473086;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=4jvQP4uUio5h9eCQgp3MYd/quWz2stO9WrsGI5TGuD0=;
 b=Bv5SIkAaGm/YMZjNzO46t3l/NCWSIVSN0tV5fJ59d0dMRqim8Z8BsqRR
 AU0b9eIrXs+VpEAMmPqPhN55Xmt+7keQTrJBp/chvkuHmdbBYBqlyHKo5
 612cHMYLc/fdKoMdWE8ka6MATqth6YRBu7X9vdA0wmIHpwLaE+G1z8bTV
 klaf7PSJN7VWnm7Ze/ij/fV7CupjwoSTpMIoLNXzLUD3oDDez4TSc0qca
 x2R0NidZgesnJd3eJ4m99dXjRNDk+FhDU8pITpTe7g8opAJlsAKtR3iuG
 bIGpVY/L6G2xU/uw6VDTAiOn/5kSmaoZleY0Lk7zP4jQP+6rj9cCIwGh/ Q==;
X-CSE-ConnectionGUID: Kgrj7uWMQSaiRsRY336Hgg==
X-CSE-MsgGUID: gylAbjdYRXeTP0PHNOkVWg==
X-IronPort-AV: E=McAfee;i="6700,10204,11372"; a="43206710"
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; d="scan'208";a="43206710"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2025 00:24:46 -0700
X-CSE-ConnectionGUID: cmY12+CIQ4qm7jgf7tLIEA==
X-CSE-MsgGUID: gmC6N8oLTc6dEYTWfWZM0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; d="scan'208";a="121185029"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2025 00:24:45 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Fri, 14 Mar 2025 00:24:44 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 14 Mar 2025 00:24:44 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 14 Mar 2025 00:24:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lCroNyPrm/WtuapoyY3EptTNRL2nVd++Pat5Oo/EkXx3rRgkcXWX4nCVDvZi1SfrJ71qh4zo/+de2edKE3KqasJHq7oZE4mkuUcS173ZQlQGb7y3szArhEZhCQI9iTnr7wQxAKxnHu4oA4vUG6VnIRiBQKms95c4JJTPEw6nmZPSiFfjSK06drhji6VECwmuw3WgSJhYelCG/olc719v2Xp24mNDNH3drarvm8NYItpUEZLYCTbJdzFt/wyZAXMdIv1dVk712XCUAC5PG3cKXQl0OjYyXiyxulcPQeFNxg7bszUm9gKzO21XfndtyUEpQy2NYlXW1jMDVOlwdxipjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xPksrEXfcVG1mBbCuhHecPQNo/feVPgeDMY9EmWLL+o=;
 b=RBU8Y9/WG6/6m2zejXCGNcXu3S5oGM2E0zcida9dMWKKjvJvk09S7lHNhTkxW1cLy4N4fwEgFGB5pnf5qDdSDz5vMBVpfjlgm6ZsHHAXb3bZb1lzkTQX2SstRaX6shScvnl8ERGxzKurdAUpOU0T9hguXNJAXGG1I4Lk3tkeuVhePpyRprE+i3wwF+DjD0Ww1FkLMXQ4+QDmpT3SyzyvKs3xOjKKKt/dZIKoLPsp4N+Wp8I13mWI80NzHB7IU/Vaji0BbZ+knLrWKkojhBAJ7wLk5iG23IKbIinidvWERsYnrL1hO2CI80Eb3LJIU5Jxc34I3/Qw1SdSZmS1LCmf5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 PH7PR11MB5819.namprd11.prod.outlook.com (2603:10b6:510:13b::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8511.27; Fri, 14 Mar 2025 07:24:29 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%6]) with mapi id 15.20.8511.026; Fri, 14 Mar 2025
 07:24:29 +0000
Message-ID: <9e3f18b3-eed1-47f2-9bde-5e3b65c5bda3@intel.com>
Date: Fri, 14 Mar 2025 12:54:21 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] RFC drm/xe: Add configfs to enable survivability mode
To: Lucas De Marchi <lucas.demarchi@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>
CC: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <matthew.d.roper@intel.com>
References: <20250307142446.1790715-1-riana.tauro@intel.com>
 <20250307142446.1790715-2-riana.tauro@intel.com>
 <6d82e345-aef5-4629-b7e2-4b9281d919ea@linux.intel.com>
 <8e2ecdef-8709-4b9a-a79d-21da5429ee24@intel.com> <Z9LxNEDuyjBFhUuA@intel.com>
 <ubetnx73lqskmhdruqg4z4jqurc6ixydul6k7qijzltsstk2fr@eh4lkbd5x3je>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <ubetnx73lqskmhdruqg4z4jqurc6ixydul6k7qijzltsstk2fr@eh4lkbd5x3je>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA1PR01CA0156.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::26) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|PH7PR11MB5819:EE_
X-MS-Office365-Filtering-Correlation-Id: bdc1de9e-11ac-4b93-7db7-08dd62c941ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TGlxRUIvNVZWdEZ6UkJXbDB6eFl2MEw0M2NLbGdUUEovdDdBTDN0VlI1Ukp5?=
 =?utf-8?B?RVljaGtqcWY0MW5WNjJBNTVRWFo1bXB1c3JmN1Y0MlNyeU1ESHlFUTVneDdY?=
 =?utf-8?B?Q1FhdWJBTmpNREtiTy9vTVdiT2psZkFNWThrUDRjZlRYdW5Oc0R0WkVLZWxj?=
 =?utf-8?B?WmhCTnBXTnVxd1Z2QU1OaTJGbTZCTUs5cGg3NmZpQkxEMXlFcUZNVG9Oa0t4?=
 =?utf-8?B?NkdFbWlkaXVCM0ZEaS9pZ0VGWjJjUFRxd0NIRFhYM05scXJ6K1JTdnQ3UHVU?=
 =?utf-8?B?dnc0NmVGaXZwV0Z3M0wwVU44UGNVYjkxNDg3OUt2Q1d0N0dwNFJpZkdLbmpG?=
 =?utf-8?B?anJRMzRuUUs2eTBLdXpyY0NSUGsrQmppZVIxZDhmczNtV0UzOUxvczdDWGVG?=
 =?utf-8?B?Q2NOekU5SWljUkJSNVNTVks3YTFldDhjakZOdXYrOW5PTStSaXJZZDcxRE5l?=
 =?utf-8?B?eUlaRTJNTG16WC9BaERwTkoxZGdwWldvVHhDM0hDRkFKT2wrdlc2ZmtTeDZM?=
 =?utf-8?B?ZExNVWQ2MmtZc2dxN1hnWTdVWjZINnBRbFRUL1VONWFXaDN2WGFVYk1zOUtU?=
 =?utf-8?B?M2g2V2ttanc2eFVLcWNBOUpwNlhYaFQwYjRLbUEwazZNTWc2T1h3b3h4TW9N?=
 =?utf-8?B?U09Ua3VFOSt0YmowY0dMR2JXOHA2Z0lSdndyT0puOTN3WmpMYlNKOEZoWFpx?=
 =?utf-8?B?eUJrdEsvUEZlbzJwaXB1enVqTFhoN3cxSkJBek9CYkRiOXEyb1JFWXRvTXdW?=
 =?utf-8?B?N0RkQ3JnTGNtWkJyR0xGUC9hWDBvRW1CaitRWFYzUGsvSmp3R1hZSG0yeFhJ?=
 =?utf-8?B?aDQrNE4wNGJNY25va1JqbDhzbElCdFdxQ0w3MUl0R2h4bGNUSUkyRlN4Ykhy?=
 =?utf-8?B?Uk0zLzlrZHBXWVEyUjVCVFVvR0U2NEFvNTNIQWRTcTNNV2tJbmRjVW5TNFB5?=
 =?utf-8?B?Y2tRQzNCMnFPMUs1QUdQamtHWURnK0VqUFNkMTMxWHZpTzlyOVREVWZQZGtQ?=
 =?utf-8?B?Y0Y5NHNMWXpRZW41VER6cXlvcW9YTjdKd2RJQnRSRDYzUXFIT2IyNmFza1lN?=
 =?utf-8?B?WHhHeHVkZGNnTTNDcmJqQ0QzeXFKMkxKOTJXbnhsM0pnZlp4Ym93dVVoMS9I?=
 =?utf-8?B?TVZaNVgxbHU5UGtFUXBWdExpeU9lR1ozNlc4aXdhejd2MHAzeVBnYjR1akli?=
 =?utf-8?B?d1V4LzltT1JXSUN0enl2UlRPUlFydG1sWGRIcnpRSDhYU3J3eHRxMzNUR2d1?=
 =?utf-8?B?NkF5VjNqVFBUR0g5aXBPa3NPbjhTczJmdmkxUE96dGV4c3pqZ0VTKzhmNzFS?=
 =?utf-8?B?NjRYcmNyb0Q1YXZFVk5WTDFoVDh0Q2g4U2dac1FLSFA0d1F5NkprN2NmaTlL?=
 =?utf-8?B?VzFRYkp6bUVHZFVHb2tOVTBnQXI5RTVlZGwwZEF2MTlNdVJOVFhLS29LTGwx?=
 =?utf-8?B?NVkzUHlCbkxESUMvb2JvU0N5dUJIR0M4WlJJeTRmU2hQYlVKazhCazNVdUdx?=
 =?utf-8?B?ZnErbXI5ZC91bENBbVZETUNNS2pzSDNzMXI4UmJRZms3Qmh4VzA0OG5lMEU4?=
 =?utf-8?B?LzZraEdSMkN5MWtNR1VuazBEejFRZlBkck9JSEJFQTFtclNBNk85c2tKaGZ6?=
 =?utf-8?B?cXNyVG9lMFhMQjhIdit2NTFOUjdpL0hXeXJEdFpIVnNDOGRIQzVXR0tkd1hv?=
 =?utf-8?B?VWJWaWRZc1NCdmkyaWRrZ0pWeGxNVUNHaldwTDhHNU1HMEdoVkRhd3FCRCtS?=
 =?utf-8?B?cVhyNWU1WGs3OTZ5R0E0NXFmaWxwaDRXbnNLaEd1Uml4Wm5yQm1XNGkzakFj?=
 =?utf-8?B?VURtL3NUL09adUJ6QnB2WHJaNzV6b3FXN3Qyb3ppYWFvQkl3ejYvRUFqTDlY?=
 =?utf-8?Q?bjeYTunJp+g8b?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q2o4LzZ3SUo1TE94ZE43UlJvSmZOTlp0aXFwcUVUUm40QzhWOUE1VXFqdEN4?=
 =?utf-8?B?RDE4M2VrSGpwYllnb2VnbkxVbVUxSjNBQkMvUzBiRWhKR0FVMTBwOWpDdktT?=
 =?utf-8?B?NmhWcGxnNzY5cVBxU3hJaWYyKysrR3dBcXNyd2JqWDhRR3N0S1lRS0Nia3hv?=
 =?utf-8?B?RzFqcGx4cTV1aEg5YjJ5NThWajUyVkNmRzFacWduSEplRWVsRTI4QXVzVW1M?=
 =?utf-8?B?RGVYcjNTUDZvQXJySzNxWGNKU0pCZjZwOXRpcWMrdHZ3UzVIcE5CYlJFTEpj?=
 =?utf-8?B?Q014UXZMY0l4ZmREY1c5Vk52Sk9lekJUaGJUUExSZFpNZ0hINTJJTWxXQy85?=
 =?utf-8?B?YUhFVCtzU0poUlZld2ZBVG8zdFpjSGVQcTZBeHRwV2lQUzRwYy82MVF3Tm9k?=
 =?utf-8?B?YjN3Q2dJVk9LZWlkNWQvV2dPM2NJL0wwNGUyL0gvVGdSempudVRHVTR0QUJr?=
 =?utf-8?B?dHpNajg1WTFBZDN4eVRSazdFN3hIYmdpRFNFSjhScjJkZE9zaHR6QXBxOFJj?=
 =?utf-8?B?RmZQdXF0OXByLzk5SVYrUDF6TEZ5eTFFMTZSUWVONkVLRWdpdjdsQ3V4RjJW?=
 =?utf-8?B?S0lzZ3dPbEdSWGFNQk1zcFRTTnpzQVdCWlcvSGx3YlhhOXRBdUNBelQ4dDhu?=
 =?utf-8?B?aU1RaTVQcXM1L0cyVXRTWUNkMEJ1UVg4RCtnb2ZjZGh3ajRZM1UzeHNMV3Yv?=
 =?utf-8?B?VU4vTzUvRXlrMVFBOUQ5M1VScWpNQ0YwajE3R082bTRHVGlzSG4vNng3RlBX?=
 =?utf-8?B?bDl1RUg1Mml6cVZ1Y3pyeWFjVi9oWmdCaWo3RGg3Wk00dzB1OXRDbUIxUE5K?=
 =?utf-8?B?Zm5udVAwVWxKeFA1cGU0eUoxSlVQNitna0lJNS9DL0RFWm5rZDlIc2Nxb3Nn?=
 =?utf-8?B?SnhpQ21OS2IzNWJ6MFU2T2M2bXZrMS9IdWhsdXJyNzZ2VllQQkF1RlRSRDIy?=
 =?utf-8?B?MG9aM2JrTlpOdTdWZldHUHVKbUxRbEIvTDR6dVpvSFdMcUZEL0doTTI0Qmpv?=
 =?utf-8?B?U2o2UXdDciszbW1mMlBHL0ZKc0w0c1YvUTlsMFZPNFVwem9oWXI4TFMvVUhU?=
 =?utf-8?B?U0dnTWpoQjhLOWxjWm5PdURmdlZTUk9rdllyZnkrRmppd2ZFZkt6dmcwNlpx?=
 =?utf-8?B?N1ZhOEpQSUVDYzNLeUd1aEp2d0pOT29NSDdTOTdwanNtTFlSNGFYWkU3d0Mr?=
 =?utf-8?B?bnZTQjdidGtKZldkL01jbGtpQmE2NzFtTWV3SG44WS8zOW1RZS90MXVjMkNp?=
 =?utf-8?B?MDk1UzUzYnVnQ3NRRnh1US9aRUNvdmtzUGdzN0Rtd2d3RW9VRHJNM21aZmJJ?=
 =?utf-8?B?SFlwTlprN0Rqc1hjODcxZUNDQ0VUbzc1Skt2amNDK3lPNFU3UXd3c1hJRTd2?=
 =?utf-8?B?d1M4MFVZYTJtRmxsS1FENnpUZDJnMEFOZXp1YWtXeW13MTJrVFc0THQrZlJn?=
 =?utf-8?B?TXc0U0M2K3lCcDNOblptWlVkTXh1ZXcxWnkxU0FpMkxjdHI5emZEa2ZhR1ZM?=
 =?utf-8?B?QjRFYmxpclZoMU16VEJMcnJ2M3JxZjFYU1N4T1oxRmxNMU8vSHhCclNtZzFv?=
 =?utf-8?B?MFh4dXhrbUpyMEpTR3d6dVVIam1vUDArSzFwNFNUTnBUQWNYQjdOc0dVRkx5?=
 =?utf-8?B?OFJScjdjWCswNzRscVF5ZWpJRjdZZnJqVGRlUi9ibXhoR3FPOThNWUR3TmF3?=
 =?utf-8?B?ZUQvT1ExdDlDQk4xQ2tSamp5dHZtWkFTKytFd0xibytKc1g0TjVQQ1hldjUw?=
 =?utf-8?B?OHNGMkd3VjB2THB4WWRETVpkMzFQOHhjTmw0Z3V5OEhwb0Y5aHg0MlVvVS80?=
 =?utf-8?B?eGhyVURGUy9ZSy8xSkpPU3lzN05naDZKRTVvVEVNeVArWkQ0S2h3WXhjU2hX?=
 =?utf-8?B?M3lEbjlBSVBPS2tNQk1mcnpvZGs2Z25WUkVtQ2tHVWFETHFDQ25nSllaM0hv?=
 =?utf-8?B?c1VkYm5WbUx3bVpQaUNmV3BsZUU2Mm5GQlFzWUlmUHdpeE5EMmFzaWY3b0VI?=
 =?utf-8?B?bklRcGpsQTgwQ09vQk1zemhEZ3lvV0kyVWc2QlBuZ2RoM1c0cG9NZlp0eW5s?=
 =?utf-8?B?S1cyOENWVUdhY2tCRFJDK3VtRCt4ZzJVMEVqdjdldEtVWDlscXA5eGtiOTV4?=
 =?utf-8?Q?COd8HE3Z2gZHSF3fhZIpXHxAz?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bdc1de9e-11ac-4b93-7db7-08dd62c941ba
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2025 07:24:29.1022 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5Z1NZoFQVIshJZoMEU4Zpfbr7QBZQ9r4hSKErUbNDKWuZif5TjhkrjzFM1yrdyc7lktgUMm+zNgLRd2IGrvk1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5819
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



On 3/14/2025 1:22 AM, Lucas De Marchi wrote:
> On Thu, Mar 13, 2025 at 10:52:36AM -0400, Rodrigo Vivi wrote:
>> On Thu, Mar 13, 2025 at 11:48:41AM +0530, Riana Tauro wrote:
>>> Hi Aravind
>>>
>>> On 3/10/2025 12:44 PM, Aravind Iddamsetty wrote:
>>> >
>>> > On 07-03-2025 19:54, Riana Tauro wrote:
>>> >
>>> > Hi Riana,
>>> >
>>> > I do think we can achieve the same functionality with module param and
>>> > we needn't reload the driver
>>> > if we are doing unbind, Since the driver will be loaded event after
>>> > unbind we can modify the module param
>>>
>>> tried this.  We can modify the module param using sysfs and bind 
>>> similar to
>>> configfs.
>>>
>>> If we want to configure any other attributes or move existing module 
>>> params
>>> to device specific then adding configfs seems better.
>>>
>>> @Rodrigo thoughts?
>>
>> Yeap, if we make the param write-able and document that it is only 
>> checked
>> at probe we could indeed use the flow
>>
>> echo <bdf> > /sys/../xe/unbind
>> echo <bdf> > /sys/../xe/param/survivability_mode
>> echo <bdf> > /sys/../xe/bind
>>
>> and accomplish the same.
>>
>> on the good side:
>>
>> So, this is the future prof case. Because if we start seeing cases where
>> the device fails at boot without the FW request for the survivability 
>> mode
>> we might be forced to have a parameter anyway. :/
> 
> With parameters we have these possibilities:
> 
> 1) driver is already loaded:
> 
>      echo <bdf> > /sys/../xe/unbind
>      echo <bdf> > /sys/module/xe/parameters/survivability_mode
>      echo <bdf> > /sys/../xe/bind
> 
> 2) driver is not loaded
> 
>      # put all device in survivability mode
>      modprobe xe survivability_mode=
> 
> 3) driver not loaded, and only one device in this mode
> 
>      echo 0 > /sys/bus/pci/drivers_autoprobe
>      modprobe xe
>      echo <bdf> > /sys/module/xe/parameters/survivability_mode
>      echo <bdf> > /sys/../xe/bind
> 
> With configfs we have these possibilities:
> 
> a) driver is already loaded:
> 
>      echo <bdf> > /sys/../xe/unbind
>      mkdir /sys/kernel/config/xe/0000:03:00.0
>      echo 1 > /sys/kernel/config/xe/0000:03:00.0/survivability_mode
>      echo <bdf> > /sys/../xe/bind
> 
> b) driver is not loaded
> 
>      # no equivalent option for "all devices in survivability mode"
>      # other than repeating (c) for each since the option is per
>      # device not per module
> 
> c) driver not loaded, and only one device in this mode
> 
>      echo 0 > /sys/bus/pci/drivers_autoprobe
>      modprobe xe
>      mkdir /sys/kernel/config/xe/0000:03:00.0
>      echo 1 > /sys/kernel/config/xe/0000:03:00.0/survivability_mode
>      echo <bdf> > /sys/../xe/bind
> 
>>
>> on the bad side:
>>
>> But we were actually aiming to reduce the parameters that we have
>> because that was getting indiscriminately used and even recommended by 
>> some
>> distros' doc and wikis.
>>
>> Another problem with the write-able param is that people might expect to
>>
>> echo <bdf> > /sys/../xe/param/survivability_mode
>>
>> and immediately get the device in the survivability_mode for that device.
>> Then we are going to get questions and bug reports that this is not 
>> working.
>>
>> But well, perhaps documenting the flow properly in the param description
>> might solve this concern.
>>
>> Lucas, Thomas, thoughts?
> 
> Let me add here that we will have to extend configuration to more
> things. The one I will work once this configfs lands (or even before it)
> is to allow developers to add WAs (or we could say
> register-save-restore) dynamically so it's much easier to
> try/error/recover. For that my plan is something like this:
> 
>      echo 0 > /sys/bus/pci/drivers_autoprobe
>      modprobe xe
>      mkdir /sys/kernel/config/xe/0000:03:00.0
>      cat gt-wa.txt > /sys/kernel/config/xe/0000:03:00.0/gt_wa
>      cat engine-wa.txt > /sys/kernel/config/xe/0000:03:00.0/engine_wa
>      echo <bdf> > /sys/../xe/bind
> 
> And cleanup my kmod "frontend" protoype to make it simpler[1]:
> 
> i) no additional configuration:
> 
>      kmod bind --device 0000:03:00.0 xe
> 
> ii) with configuration stored somewhere:
> 
>      kmod bind --device 0000:03:00.0 \
>          --config <path-to-config-dir|path-to-config-tarball> \
>          xe
> 
> iii) with configuration in the command line:
> 
>      kmod bind --device 0000:03:00.0 \
>          --config-kv survivability_mode:1 \
>          xe
> 
> So, I think the configfs approach is more future proof. For a simple
> switch/panic-button like survivability_mode I wouldn't oppose to have it
> as a module parameter though. Maybe make the module param read-only
> and if per-device support is desired, then handle only via configfs?
yeah survivability mode is per device. Since there is a plan to extend 
configfs for other attributes will go ahead with configfs.

Thank you all for the inputs.

Thanks
Riana

> 
> Lucas De Marchi
> 
> [1] Typing here without much thought on the actual interface - my
>      prototype hardcodes it for pci, but the kmod command would
>      probably have to consider other buses too.
> 
>>
>>>
>>> Thanks
>>> Riana
>>> > and once we bind the device back it can check if the BDF belongs to 
>>> this
>>> > driver instance and configure the mode accordingly.
>>> >
>>> > Thanks,
>>> > Aravind.
>>> > > Registers a configfs subsystem called 'xe' to userspace. The user 
>>> can
>>> > > use this to modify exposed attributes.
>>> > >
>>> > > Add survivability mode attribute (config/xe/survivability_mode) 
>>> to the
>>> > > subsystem to allow the user to specify the card that should enter
>>> > > survivability mode.
>>> > >
>>> > > Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>>> > > ---
>>> > >   drivers/gpu/drm/xe/Makefile      |  1 +
>>> > >   drivers/gpu/drm/xe/xe_configfs.c | 95 +++++++++++++++++++++++++ 
>>> +++++++
>>> > >   drivers/gpu/drm/xe/xe_configfs.h | 12 ++++
>>> > >   drivers/gpu/drm/xe/xe_module.c   |  5 ++
>>> > >   drivers/gpu/drm/xe/xe_module.h   |  1 +
>>> > >   5 files changed, 114 insertions(+)
>>> > >   create mode 100644 drivers/gpu/drm/xe/xe_configfs.c
>>> > >   create mode 100644 drivers/gpu/drm/xe/xe_configfs.h
>>> > >
>>> > > diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/ 
>>> Makefile
>>> > > index 9699b08585f7..3f8c87292cee 100644
>>> > > --- a/drivers/gpu/drm/xe/Makefile
>>> > > +++ b/drivers/gpu/drm/xe/Makefile
>>> > > @@ -28,6 +28,7 @@ $(obj)/generated/%_wa_oob.c $(obj)/generated/ 
>>> %_wa_oob.h: $(obj)/xe_gen_wa_oob \
>>> > >   xe-y += xe_bb.o \
>>> > >       xe_bo.o \
>>> > >       xe_bo_evict.o \
>>> > > +    xe_configfs.o \
>>> > >       xe_devcoredump.o \
>>> > >       xe_device.o \
>>> > >       xe_device_sysfs.o \
>>> > > diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/ 
>>> xe/xe_configfs.c
>>> > > new file mode 100644
>>> > > index 000000000000..8c5f248e466d
>>> > > --- /dev/null
>>> > > +++ b/drivers/gpu/drm/xe/xe_configfs.c
>>> > > @@ -0,0 +1,95 @@
>>> > > +// SPDX-License-Identifier: MIT
>>> > > +/*
>>> > > + * Copyright © 2025 Intel Corporation
>>> > > + */
>>> > > +
>>> > > +#include <linux/configfs.h>
>>> > > +#include <linux/init.h>
>>> > > +#include <linux/module.h>
>>> > > +
>>> > > +#include "xe_configfs.h"
>>> > > +#include "xe_module.h"
>>> > > +
>>> > > +/**
>>> > > + * DOC: Xe Configfs
>>> > > + *
>>> > > + * XE KMD registers a configfs subsystem called 'xe'to userspace 
>>> that allows users to modify
>>> > > + * the exposed attributes.
>>> > > + *
>>> > > + * Attributes:
>>> > > + *
>>> > > + * config/xe/survivability_mode : Write only attribute that 
>>> allows user to specify the PCI address
>>> > > + *                  of the card that has to enter survivability 
>>> mode
>>> > > + */
>>> > > +
>>> > > +void xe_configfs_clear_survivability_mode(void)
>>> > > +{
>>> > > +    kfree(xe_modparam.survivability_mode);
>>> > > +    xe_modparam.survivability_mode = NULL;
>>> > > +}
>>> > > +
>>> > > +static ssize_t survivability_mode_store(struct config_item 
>>> *item, const char *page, size_t len)
>>> > > +{
>>> > > +    char *survivability_mode;
>>> > > +    int ret;
>>> > > +    unsigned int domain, bus, slot, function;
>>> > > +
>>> > > +    ret = sscanf(page, "%04x:%02x:%02x.%x", &domain, &bus, 
>>> &slot, &function);
>>> > > +    if (ret != 4)
>>> > > +        return -EINVAL;
>>> > > +
>>> > > +    survivability_mode = kstrdup(page, GFP_KERNEL);
>>> > > +    if (!survivability_mode)
>>> > > +        return -ENOMEM;
>>> > > +
>>> > > +    xe_configfs_clear_survivability_mode();
>>> > > +    xe_modparam.survivability_mode = survivability_mode;
>>> > > +
>>> > > +    return len;
>>> > > +}
>>> > > +
>>> > > +CONFIGFS_ATTR_WO(, survivability_mode);
>>> > > +
>>> > > +static struct configfs_attribute *xe_configfs_attrs[] = {
>>> > > +    &attr_survivability_mode,
>>> > > +    NULL,
>>> > > +};
>>> > > +
>>> > > +static const struct config_item_type xe_config_type = {
>>> > > +    .ct_attrs    = xe_configfs_attrs,
>>> > > +    .ct_owner    = THIS_MODULE,
>>> > > +};
>>> > > +
>>> > > +static struct configfs_subsystem xe_config_subsys = {
>>> > > +    .su_group = {
>>> > > +        .cg_item = {
>>> > > +            .ci_namebuf = "xe",
>>> > > +            .ci_type = &xe_config_type,
>>> > > +        },
>>> > > +    },
>>> > > +};
>>> > > +
>>> > > +int __init xe_configfs_init(void)
>>> > > +{
>>> > > +    int ret;
>>> > > +
>>> > > +    config_group_init(&xe_config_subsys.su_group);
>>> > > +    mutex_init(&xe_config_subsys.su_mutex);
>>> > > +    ret = configfs_register_subsystem(&xe_config_subsys);
>>> > > +    if (ret) {
>>> > > +        pr_err("Error %d while registering subsystem %s\n",
>>> > > +               ret, xe_config_subsys.su_group.cg_item.ci_namebuf);
>>> > > +        mutex_destroy(&xe_config_subsys.su_mutex);
>>> > > +        return ret;
>>> > > +    }
>>> > > +
>>> > > +    return 0;
>>> > > +}
>>> > > +
>>> > > +void __exit xe_configfs_exit(void)
>>> > > +{
>>> > > +    xe_configfs_clear_survivability_mode();
>>> > > +    configfs_unregister_subsystem(&xe_config_subsys);
>>> > > +    mutex_destroy(&xe_config_subsys.su_mutex);
>>> > > +}
>>> > > +
>>> > > diff --git a/drivers/gpu/drm/xe/xe_configfs.h b/drivers/gpu/drm/ 
>>> xe/xe_configfs.h
>>> > > new file mode 100644
>>> > > index 000000000000..491629a2ca53
>>> > > --- /dev/null
>>> > > +++ b/drivers/gpu/drm/xe/xe_configfs.h
>>> > > @@ -0,0 +1,12 @@
>>> > > +/* SPDX-License-Identifier: MIT */
>>> > > +/*
>>> > > + * Copyright © 2025 Intel Corporation
>>> > > + */
>>> > > +#ifndef _XE_CONFIGFS_H_
>>> > > +#define _XE_CONFIGFS_H_
>>> > > +
>>> > > +int xe_configfs_init(void);
>>> > > +void xe_configfs_exit(void);
>>> > > +void xe_configfs_clear_survivability_mode(void);
>>> > > +
>>> > > +#endif
>>> > > diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/ 
>>> xe_module.c
>>> > > index 475acdba2b55..15b3cf22193c 100644
>>> > > --- a/drivers/gpu/drm/xe/xe_module.c
>>> > > +++ b/drivers/gpu/drm/xe/xe_module.c
>>> > > @@ -11,6 +11,7 @@
>>> > >   #include <drm/drm_module.h>
>>> > >   #include "xe_drv.h"
>>> > > +#include "xe_configfs.h"
>>> > >   #include "xe_hw_fence.h"
>>> > >   #include "xe_pci.h"
>>> > >   #include "xe_pm.h"
>>> > > @@ -91,6 +92,10 @@ static const struct init_funcs init_funcs[] = {
>>> > >       {
>>> > >           .init = xe_check_nomodeset,
>>> > >       },
>>> > > +    {
>>> > > +        .init = xe_configfs_init,
>>> > > +        .exit = xe_configfs_exit,
>>> > > +    },
>>> > >       {
>>> > >           .init = xe_hw_fence_module_init,
>>> > >           .exit = xe_hw_fence_module_exit,
>>> > > diff --git a/drivers/gpu/drm/xe/xe_module.h b/drivers/gpu/drm/xe/ 
>>> xe_module.h
>>> > > index 84339e509c80..c238dbee6bc7 100644
>>> > > --- a/drivers/gpu/drm/xe/xe_module.h
>>> > > +++ b/drivers/gpu/drm/xe/xe_module.h
>>> > > @@ -24,6 +24,7 @@ struct xe_modparam {
>>> > >   #endif
>>> > >       int wedged_mode;
>>> > >       u32 svm_notifier_size;
>>> > > +    char *survivability_mode;
>>> > >   };
>>> > >   extern struct xe_modparam xe_modparam;
>>>

