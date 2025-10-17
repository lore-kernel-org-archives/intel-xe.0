Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C86BECCD199
	for <intel-xe@archiver.kernel.org>; Fri, 17 Oct 2025 15:31:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8981910EC61;
	Fri, 17 Oct 2025 15:31:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cU7acGTO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDA0F10EC52
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Oct 2025 15:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760715090; x=1792251090;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=YhZBAvsEhqlZjL99nMq4uvqNwsVkR+cJbvtjSKYro3U=;
 b=cU7acGTOBXwwg+UbhC2QbhEpaeBoU2I63ViWChB/gUX8kxZIihsQxsWm
 N6JbPM/38/qKc733puysU25os/34hxNwPPfYxLdAwaZp/83y8bti8f6mv
 urwTh/Sd7IaWvhWkuM/JXGcg7nIL2IjLzyD8n8QPZNVnTeHPe720wtvLB
 N5KZxGDcwvKIlR7k5SmjY8TGP6RWyBN4XytrWGBSqTvGAxdXEaOvw+uTp
 KpxTcOpfKLu6OVMDZNYc+txZtVefSZrs40h0loYsXuUKzJka8lZ/5jCTp
 ElVvCGT2REIKQ6NQ7Levsip5JIwx5qA9yDTYXc2XFSlET/U3d4UihGu+y A==;
X-CSE-ConnectionGUID: yfosqFvDSAuNKTlAD/fL+Q==
X-CSE-MsgGUID: 4HNxfaQaQiqV1kvQ5QNrIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11585"; a="66789806"
X-IronPort-AV: E=Sophos;i="6.19,236,1754982000"; d="scan'208,217";a="66789806"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2025 08:31:29 -0700
X-CSE-ConnectionGUID: TX9AS+6AT66Wb4sEKYjgZQ==
X-CSE-MsgGUID: bpAAEp45SJ2Iio3p72Vobw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,236,1754982000"; 
 d="scan'208,217";a="219916536"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2025 08:31:30 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 17 Oct 2025 08:31:28 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 17 Oct 2025 08:31:28 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.53) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 17 Oct 2025 08:31:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uuxQ51WSnHcyCSBIlIVOhPNbvGxfSW9Pv5ofVCWJ4kQJNOTBqukUPtA/ELKywLVnQOD5EcLHmx4u4Y/nAYAva9bbsYdlOAVHXJqCPEH04d0Afw4Atsh9D7RAlkWRtPZHvSOYhG1nFFOik+saw+8lzSdSTLiWKONX5DZ06HGpEALixC/NcJjhiwCRSgUT8Mbwlw3FTIiQZQs6qkQGr89ZrGKQqN314LNJf8rb2MIj4LNX22xamOe9h6oiU4IK8zLQ+/UqsUnhXGNU8o20AeOKZLJsKrS8srnm3wd/ESzMfWz2sWNWL+MD5+BWtW7D7ee+/VN2D0oKaSgsCPwJM874nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T1dAK8Qhgt6d4tmQ6ruMJ2mGnurvoNiGgSnY4Olis7s=;
 b=d2nfcuYjEPh45u8ke324A5AHnuoe0qTHyPhI77dN+qspbZNXbjtqP/CoPQGP54k/hne2DIkBN/+snIPbvtJUG22g2AjcjvZlEJB4GDEwonsjNA+3YsvRasDtW91ric5+k4qYT5mmb/I5M2HyHtyPMFqI7nPv1C7ZjVe0Hw1dQ1UtK0r6K3jnsHJoikOv9ijnkHRly1CS/fGH+Ao12w0E2EN02JJYNGOJmRBgiq2ahC/d6wH3R3SJcRja4qk5ia5AzauCBoTCoVw6mDDxOGjL0OZeJmYwCSZRJRjbi15StSqPBq0vVOFO5WZQAic5LACDfFYjiscoyhmLYubSnt4L9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9226.namprd11.prod.outlook.com (2603:10b6:208:574::13)
 by CY5PR11MB6463.namprd11.prod.outlook.com (2603:10b6:930:31::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.13; Fri, 17 Oct
 2025 15:31:26 +0000
Received: from IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09]) by IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09%6]) with mapi id 15.20.9228.010; Fri, 17 Oct 2025
 15:31:26 +0000
Content-Type: multipart/alternative;
 boundary="------------e1PoYq6kRaPPRQTqhNbs749I"
Message-ID: <a705eb88-0795-41b8-becb-cc41e2479785@intel.com>
Date: Fri, 17 Oct 2025 17:31:21 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/5] drm/xe/vf: Fix GuC FW check for VF migration
 support
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, Matthew Brost
 <matthew.brost@intel.com>, Satyanarayana K V P
 <satyanarayana.k.v.p@intel.com>
References: <20251016120511.856792-1-tomasz.lis@intel.com>
 <20251016120511.856792-3-tomasz.lis@intel.com>
 <ddf9bf4a-f7f3-4a1a-908f-2b8dd6d066da@intel.com>
Content-Language: en-US
From: "Lis, Tomasz" <tomasz.lis@intel.com>
In-Reply-To: <ddf9bf4a-f7f3-4a1a-908f-2b8dd6d066da@intel.com>
X-ClientProxiedBy: VI1P189CA0013.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:802:2a::26) To IA3PR11MB9226.namprd11.prod.outlook.com
 (2603:10b6:208:574::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9226:EE_|CY5PR11MB6463:EE_
X-MS-Office365-Filtering-Correlation-Id: ade6e744-6b27-46ff-1959-08de0d923c1a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|13003099007|8096899003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L3ppaTRWQTl0ZnVxV0FvNkJyTEtBRzJLZEN3WnFpYWxDTHF0STczajh5djd1?=
 =?utf-8?B?VndPcUFtNUhUcDBqSWVrK3dZbUFuQWdEdjZSRU10TkVDRnR1VnhvRUU2RUdj?=
 =?utf-8?B?b29oVUE5WG5DdXpvRDlEaHlCWnMvYU1NRTErT1JlOHl4R2ZjSTAwM3UyU0cx?=
 =?utf-8?B?RzNEZVFWTEFTZDVBOFV2Q3pheDM3NE9Ic2hyK0lXWXpOMGpzdVU3eTh2Skpn?=
 =?utf-8?B?YUhoNTBEeldnWU1IY3lKd2Z0SWdEbU40eVVKczRNWHI0aGloOGhvV3dXSFd5?=
 =?utf-8?B?N3BDSUlpSnNJM2loamNKY0UzT3BNZVZheUV0dXpBQXNQS1VMMVBIeXJBVTgr?=
 =?utf-8?B?ZSt5NmhLNUdOV1VXMHhHdzZ1a3FDdExUcmhzWEFwQ3ZhY2pySmszZUxwcnpp?=
 =?utf-8?B?Z0hOZE56bURjVldvMDRhNXh3Nm1wTjM4a0pvYURHSkI2M09Sd3JLZ2w4Mk9I?=
 =?utf-8?B?UHI4MXBTN2d4czlPNy9MakUyU1BGOVgyQi9jcFNJSFVJeGszTGtPa1RHUUhG?=
 =?utf-8?B?R2RBRUIxdkxzaEJ5UFF5S0dkQXhFNkdoRDB6U0ZiSTBhYllIZW5TdnVTcFFq?=
 =?utf-8?B?dkk4VGp3K0gxNUxyNUxPWXNNNy9sTFBvTnIvczFLYTJ5VVpMZ2w0c0NpamFN?=
 =?utf-8?B?b3lhLzRDVDVKeVhCUk5xMjF1cVhyTHA0dy9oQ0oyem56RGExYktUVHJ4V3Jw?=
 =?utf-8?B?bEtkcWp4Z011SkJOc3lRWmpibjltOFJ4cStpSTM5SGdrMlY0aGw0ZVRDaWc5?=
 =?utf-8?B?TDE3NjRGQ1podGdNQkFVTmlyQ0dZQTJGd1o4ZkhGVGRTNE80VG1XZE9NaG0r?=
 =?utf-8?B?N1FESXU2dnEvM05CTWJUQlN0QmtNclNFV254MzNzQTdWWFgzRE9odWx1eGFV?=
 =?utf-8?B?cEUzdjZMRmVxeE5Jbm5hYlphamRQNGMzajhRY2RHN09oMWM0ODNjd1NYZVlN?=
 =?utf-8?B?d0VJSlVQR1pwZE1xS2Z2NllYUEIzUTFadzV4N2RaWTJGZ01nM3U4dVZoOEEx?=
 =?utf-8?B?TXNiMkwyaXlxWEtocmFPbkNQcnR3QlNNM2g4U0prRUFsTnFTeThEd3VhbWJ0?=
 =?utf-8?B?cHJydTZMQmdkVFVSSHBSN2dwS2dSNVJSK0tKY0F1YjNEZXhPSFBnRXo0V0RZ?=
 =?utf-8?B?ejN6L01qTkpnUHVrb3N1NmF3cm95cDJYVlRhR2tlNDVDVzZ1RGMxcXB2ZjZP?=
 =?utf-8?B?d1U0UXRFcjNDMG91YWJlYm1RWXB5Z0d0Tjltblo0eElpbEoxOG1WOUFVMjc4?=
 =?utf-8?B?Tm1mQVdxRDFmQnpZYXl3Vmd4c1ViSWxJMHlYTlhkOWROS0RnRDYydGEvMXFE?=
 =?utf-8?B?U04vOXovSGloSlBob2VBdHhYVTdxZGVLZmFITlk4TTkyWHBvS0dES2UzQXZh?=
 =?utf-8?B?RVV6M2s5WDR3UUVQa05KcU1neFR6MzgwTmYvYmloc2RUMXNtTWh6ako0cXJQ?=
 =?utf-8?B?L2FPdGJ6bFJBMmNHN1VTT1lKUStDVGtRK1Q4bkFaZldhRi9ZTnEzZThTMUJs?=
 =?utf-8?B?TkQrTW10emdOd0doK3o4MnNLTXBneDROcDhML1ZBVWhzajRVVWZEWEJIL2NI?=
 =?utf-8?B?NFpXTFdIVjNlOHUvNW1laHhNLzNzRm1mQ1dNdGNNRk83YytuSUtibHhabDIr?=
 =?utf-8?B?cXNGanBNL21OSXp3dnBQRFNzZG9OM1FyL1pCOU8xMjkrSHN1T2pOS0RlVzZP?=
 =?utf-8?B?bDlYYjk0cC9SNkl3NXUvZ3UyM0QxeDNFMm5vUnhuZlRaN2dYQmZ1eWd3VlpM?=
 =?utf-8?B?RlZLcVRHUTFVcUNwTGk4RlZLVno4dlZ5WlE2NWNYMjZ1ZmgyMVVZN2hnVXE2?=
 =?utf-8?B?ZmkvMmN0MXZuT2dyeDJBWVpsOVhDd0dOUWVCbkIxNnJLemZqMzU1UHpUcFBI?=
 =?utf-8?B?OUJYUWZ6RE9LSXJZVThXMVFlOU9wTThvSmtRWUVUTnNnYUE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9226.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(13003099007)(8096899003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MWZxbWc4REc2YzZJSm9HS0REQ2taSWNtWUhEY3M4RjdWOW1LWjA4QlhJU2Fu?=
 =?utf-8?B?anNxRU43Tk9NOW9Cdkk3UEN4QUZWMXRDaGJveExUVTljK1BmRlhJYjNjdk42?=
 =?utf-8?B?K1dRdndKdTVQSTNpZllZUk5jaDIrM2hqeUdtTHBCMnA3QU1acEhremk5YVFR?=
 =?utf-8?B?M1B1Tmd3bmNGOWJEcVpWbzJpZndaaEdxbE1Nam53L0c1aXVrK2ZPbTBxRXZQ?=
 =?utf-8?B?b1BDMFRZSnNEZ05BQW9tYi9ubHVsQlowZEpvakxXWHB1bzdaamVDVGdQTVZX?=
 =?utf-8?B?dTZnNklmd2VjMllCRWhXZ0h6RmlHYzZyVndaL1pVVUV6S0s2NmZxWFYrK3Ri?=
 =?utf-8?B?TTVmL2lmTjdtcFQ2ejZXS0ZwYTh4UnZVYkllMG5xdkFYVkxFZklUd2c5RXVU?=
 =?utf-8?B?Y2ZrQkVQRkxzdzV5K3NUeUlEN3hTMzR0M0xlbm1HTDJyemx0endjVUhxcU44?=
 =?utf-8?B?aEswcVB2cjFMeUtFekJYam80Q1JvSFdnd1NwaXZjS2p3TnFBcFNwaXNtbXgx?=
 =?utf-8?B?TDRDdnpXdHo5V2xwUXY3enpIZlBFeTNocUs5aTFBSTIybVdXT3ZtUkRZWmU2?=
 =?utf-8?B?aTloZDh0VXJWNExscGNLMHZvNzRaV2ljeXQzcTJCY0xlMldtWVVzalN2Q0d4?=
 =?utf-8?B?N2k1eGwwSWdsa3VtcVRUNWU4Q2JFQ211UWlTVXRVZnByRmU1OEU2Zk95OWNt?=
 =?utf-8?B?NEtVdk02eG9vMVIyeS9ZUXd1dnMyWlI5ZEdXcC9kN1B6R3dkSHoveCtiSERl?=
 =?utf-8?B?c1p5dHJJNmdYcmlSYzE4OHhZN3RsM1cyWjhUejRuMlRzZ0tEVS9HMmN0a3FP?=
 =?utf-8?B?M25aRGZYTzVSejIvemV2TnpmaXA4Y0dOcDI3a3d2UlVuckdCeHhGTkt5WTNn?=
 =?utf-8?B?RmR5NU5YYkxtTXRobkllT0txZFVUMG43bzNCSHVRWkxvNGZ0dlhPK0xycCty?=
 =?utf-8?B?UHNTSmlkNHVqY05xNENqamZJK0d3MXRPQjVZV0NyNVdMUmpIc2dYQUhXMFlt?=
 =?utf-8?B?TmNDMnBUUjlSYVJUTkt0MWY4Z2Vvd3Z1SWExd3RpMFNnRFhGRXNsT3Q3Sm5Y?=
 =?utf-8?B?bndZbUNuREJhanBXcEJGVFVuU3NjSEpvcDJwY3NNMkI1TFVGQ3IxL2pkS2tG?=
 =?utf-8?B?TzNIVkRWZWtGRFpUeWhhSjhPNFl1N3pjVDdSWnQ5OUlVczBYaHI2cTNKeDhk?=
 =?utf-8?B?SjFieXNlbFFSdUY5TDBWS2RsMHZrNWI2OFNLajAzNXNQMHFNNi9FL2RMMzJ1?=
 =?utf-8?B?OWt3SUZmRVE4N1Z6MUt6YUg4dUVybGdnV2JvaDIzQTU4ODJWNkJobjQ2Rmxp?=
 =?utf-8?B?UDArRzhGRkVyVldpNElkOTgzczBpZnRtRUdPdkM2cE40Mlg5R2FKT016NFZz?=
 =?utf-8?B?bXphTjQ4dE8zTmFOWUJCbGg1enRXL2o4UStwOFEzK3gyQ3loVkFzU0l4dGs1?=
 =?utf-8?B?VWsrbEZpT0VYSnFTMG1uN0xIOHpPMVB6Q2E2VHZOZ1FiS1B4T0NsVFlpS2ly?=
 =?utf-8?B?NzdVcmJaaHF0RTloWE5hT1FlVG1TQkNEbEVOZkVrWWhaNUpKeWlSblIwWFpK?=
 =?utf-8?B?cGdNMFZBdVBaemhyM1F6d0wxdkdNUFpZYUM3RmtXL3VrZ3A0a0ZYRVJteDZS?=
 =?utf-8?B?b01DeHNEVXVyb2J0cGt2bTN5VzZ5WWMyQjg3d0hZL0x5Tk95eVdEY2NvTFNR?=
 =?utf-8?B?blpESTU0OXM4dzl0QUNWVWtDSC85d2VLWU00dkFkSk05eVhLNDFlLzBES2NN?=
 =?utf-8?B?KzRQTlBUVGF1eTZ2Nmp4a2gzTEt4N04yYTNTR3NxWkVpZWM2THBJa3dmc201?=
 =?utf-8?B?by94RU9ONUE0U0ZjLzVMdUFNNEJZZ0VjWEk1NmpvbGNGSDFQM0ZUUHd2UlJ5?=
 =?utf-8?B?a0NRM2ZIU0tDc1ppZGFVMllmVWVKMUhTV0xmeEw2cy9mVWZsRlNiN2xiT1VU?=
 =?utf-8?B?NVE5YjBwNDNiRHcybWV0T2tyVUszYVBheEtndURtZHAzUlZrWlE1M3VzYWoy?=
 =?utf-8?B?aFN5MmdlMDd1UEcvUWRRdG9IZ1dZMDNYQWJHaXY2elJhdDBSbUVBRjF6K20w?=
 =?utf-8?B?YXpWenNUa1JZeFhyN2UvZUtwbWQxUHp0dGJLeVpMdEJaWFRVcTJVcDBZdHEy?=
 =?utf-8?Q?aU7j3jNINnuN9BVSrTks2gRKb?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ade6e744-6b27-46ff-1959-08de0d923c1a
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9226.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2025 15:31:26.0091 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LqqKYJX9Gagb4NdcwBts3sqSaCxJiLOJLRoGdC5f/CldXwv8ZqmOuVfA+DfYO1fyjPBTU3EP4lX9ps72W6TcWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6463
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

--------------e1PoYq6kRaPPRQTqhNbs749I
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 10/16/2025 11:55 PM, Michal Wajdeczko wrote:
>
> On 10/16/2025 2:05 PM, Tomasz Lis wrote:
>> The check was done before GuC ABI version could be acquired.
>> Comparing only to zeros provides very stable results, though
>> not the ones expected.
> instead of above sentence, better say that this was triggering:
>
> <4> [174.830604] xe 0000:00:02.1: [drm] Assertion `gt->sriov.vf.guc_version.major` failed!
> ...
ok.
>
>
>> This change dislodged part of the VF migration support check
>> and moved it to after GuC handshake.
> and describe your changes in imperative mood
>
> [1]https://docs.kernel.org/process/submitting-patches.html#describe-your-changes
will do.
>
>> v2: Use xe_sriov_vf_ccs_migration_bb_needed()
> you can keep change log under ---
ack.
>
>> Tested-by: Matthew Brost<matthew.brost@intel.com>
> I guess above was true for # rev1
ack.
>
>> Closes:https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/6349
>> Fixes: be5590c384f3 ("drm/xe/vf: Enable CCS save/restore only on supported GUC versions")
>> Signed-off-by: Tomasz Lis<tomasz.lis@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 41 +++++++++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_gt_sriov_vf.h |  1 +
>>   drivers/gpu/drm/xe/xe_guc.c         |  2 ++
>>   drivers/gpu/drm/xe/xe_sriov_vf.c    | 10 -------
>>   4 files changed, 44 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>> index 46518e629ba3..34c68de6e2f3 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>> @@ -314,6 +314,47 @@ static int guc_action_vf_notify_resfix_done(struct xe_guc *guc)
>>   	return ret > 0 ? -EPROTO : ret;
>>   }
>>   
>> +static void vf_disable_migration(struct xe_gt *gt, const char *fmt, ...)
>> +{
>> +	struct xe_device *xe = gt_to_xe(gt);
>> +	struct va_format vaf;
>> +	va_list va_args;
>> +
>> +	xe_gt_assert(gt, IS_SRIOV_VF(xe));
>> +
>> +	va_start(va_args, fmt);
>> +	vaf.fmt = fmt;
>> +	vaf.va  = &va_args;
>> +	xe_gt_sriov_notice(gt, "migration disabled: %pV\n", &vaf);
>> +	va_end(va_args);
>> +
>> +	xe->sriov.vf.migration.enabled = false;
> this looks like a layer violation
>
> and we already have a function that wraps that at the device level
>
> maybe just promote device-level vf_disable_migration(xe,...) from xe_sriov_vf.c
> and call it from this gt-level place ?
>
> hmm, but see below [2]
>
>> +}
>> +
>> +/**
>> + * xe_gt_sriov_vf_guc_check_migration_support - Check for disable migration due to GuC.
>> + * @gt: the &xe_gt struct instance linked to target GuC
>> + *
>> + * Performs late disable of VF migration feature in case GuC FW cannot support it.
>> + */
>> +void xe_gt_sriov_vf_guc_check_migration_support(struct xe_gt *gt)
>> +{
>> +	struct xe_device *xe = gt_to_xe(gt);
>> +
>> +	if (!xe_sriov_vf_migration_supported(xe))
>> +		return;
>> +
>> +	if (xe_sriov_vf_ccs_migration_bb_needed(xe)) {
>> +		struct xe_uc_fw_version guc_version;
>> +
>> +		xe_gt_sriov_vf_guc_versions(gt, NULL, &guc_version);
>> +		if (MAKE_GUC_VER_STRUCT(guc_version) < MAKE_GUC_VER(1, 23, 0))
>> +			return vf_disable_migration(gt,
>> +				"CCS migration requires GuC ABI >= 1.23 but only %u.%u found",
>> +				guc_version.major, guc_version.minor);
> since we split migration checks from one place,
> this CCS GuC ABI condition shall be placed in sriov_vf_ccs.c subcomponent
will move.
>
>> +	}
>> +}
>> +
>>   /**
>>    * vf_notify_resfix_done - Notify GuC about resource fixups apply completed.
>>    * @gt: the &xe_gt struct instance linked to target GuC
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
>> index af40276790fa..60a3b9b05b20 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
>> @@ -26,6 +26,7 @@ void xe_gt_sriov_vf_migrated_event_handler(struct xe_gt *gt);
>>   int xe_gt_sriov_vf_init_early(struct xe_gt *gt);
>>   int xe_gt_sriov_vf_init(struct xe_gt *gt);
>>   bool xe_gt_sriov_vf_recovery_pending(struct xe_gt *gt);
>> +void xe_gt_sriov_vf_guc_check_migration_support(struct xe_gt *gt);
>>   
>>   u32 xe_gt_sriov_vf_gmdid(struct xe_gt *gt);
>>   u16 xe_gt_sriov_vf_guc_ids(struct xe_gt *gt);
>> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>> index d94490979adc..3c4e64233b3a 100644
>> --- a/drivers/gpu/drm/xe/xe_guc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>> @@ -713,6 +713,8 @@ static int vf_guc_init_noalloc(struct xe_guc *guc)
>>   	if (err)
>>   		return err;
>>   
>> +	xe_gt_sriov_vf_guc_check_migration_support(gt);
>> +
> [2] so this is now going through these layers:
>
> guc_vf    vf_guc_init_noalloc
> gt_vf       xe_gt_sriov_vf_guc_check_migration_support
> xe_vf         xe_sriov_vf_migration_supported
> xe_vf_ccs     xe_sriov_vf_ccs_migration_bb_needed
> gt_vf         xe_gt_sriov_vf_guc_versions
> gt_vf         vf_disable_migration
> xe_vf           xe->sriov.vf.migration.enabled
>
> so maybe better leave this VF GuC init as-is and just make "late" checks
> in xe_device_probe either in xe_sriov_init_late
>
> xe        xe_sriov_init_late
> xe_vf       xe_sriov_vf_init_late
> xe_vf         xe_sriov_vf_migration_supported
> xe_vf_ccs     xe_sriov_vf_ccs_init_late
> xe_vf_ccs     xe_sriov_vf_ccs_migration_bb_needed
> gt_vf           xe_gt_sriov_vf_guc_versions
> xe_vf         vf_disable_migration
>
> or after for_each_gt/xe_gt_init_early loop
>
> xe        xe_device_probe
> xe_vf       xe_sriov_vf_check_migration
> xe_vf         xe_sriov_vf_migration_supported
> xe_vf_ccs     xe_sriov_vf_ccs_init_late
> xe_vf_ccs     xe_sriov_vf_ccs_migration_bb_needed
> gt_vf           xe_gt_sriov_vf_guc_versions
> xe_vf         vf_disable_migration
>
> or just make it as part of the xe_sriov_vf_ccs_init()
> since before that point CCS migration is not working either

The check can be done later than where I put it; but it needs to be 
before IRQs are enabled. Both kinds of these are enabled in `xe_gt_init()`:

MEMIRQs in 
gt_init_with_gt_forcewake->xe_uc_init->xe_guc_enable_communication

MMIO IRQs in gt_init_with_gt_forcewake->xe_irq_enable_hwe


The `xe_sriov_vf_ccs_init` is currently called after `xe_gt_init`. I'm 
not completely sure if this is correct placement .. it might be, if 
there are no CCS metadata set at that point.

GuC should have no problem assisting to migration without CCS metadata 
transfer, so that placement could be ok.

But that's definitely too late for figuring out whether we support 
migration at all.

So this eliminates the `xe_sriov_vf_init_late` and 
`xe_sriov_vf_ccs_init` options.

For the 2nd option - this can be done. But does it really make sense to 
put a single-platform workaround check directly in `xe_device_probe`?

I can do this - if you consider this option acceptable. Though 
personally I see no reason for trying to rip it out of 
`xe_gt_init_early`. It can be easily turned from per-gt check to single 
GT check (by checking only the primary GuC which will actually be 
responsible for scheduling the CCS save/restore BB execution), but that 
gives an option rather than a reason.

Any place between `xe_gt_init_early()` and `xe_gt_init()` is ok for me.


>
>>   	err = xe_gt_sriov_vf_query_config(gt);
>>   	if (err)
>>   		return err;
>> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
>> index 911d5720917b..5fb042c05112 100644
>> --- a/drivers/gpu/drm/xe/xe_sriov_vf.c
>> +++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
>> @@ -163,16 +163,6 @@ static void vf_migration_init_early(struct xe_device *xe)
>>   		return vf_disable_migration(xe, "requires gfx version >= 20, but only %u found",
>>   					    GRAPHICS_VER(xe));
>>   
>> -	if (!IS_DGFX(xe)) {
>> -		struct xe_uc_fw_version guc_version;
>> -
>> -		xe_gt_sriov_vf_guc_versions(xe_device_get_gt(xe, 0), NULL, &guc_version);
>> -		if (MAKE_GUC_VER_STRUCT(guc_version) < MAKE_GUC_VER(1, 23, 0))
>> -			return vf_disable_migration(xe,
>> -						    "CCS migration requires GuC ABI >= 1.23 but only %u.%u found",
>> -						    guc_version.major, guc_version.minor);
>> -	}
>> -
>>   	xe->sriov.vf.migration.enabled = true;
>>   	xe_sriov_dbg(xe, "migration support enabled\n");
> this would be non-reliable, as we might still disable migration later on
>
> so we should either remove it completely (assuming its "enabled" until explicitly disabled)
> or reverse the logic and use this flag instead:
>
> 	xe->sriov.vf.migration.disabled

will remove, it doesn't make sense here.

-Tomasz

>
>>   }
--------------e1PoYq6kRaPPRQTqhNbs749I
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 10/16/2025 11:55 PM, Michal
      Wajdeczko wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:ddf9bf4a-f7f3-4a1a-908f-2b8dd6d066da@intel.com">
      <pre wrap="" class="moz-quote-pre">

On 10/16/2025 2:05 PM, Tomasz Lis wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">The check was done before GuC ABI version could be acquired.
Comparing only to zeros provides very stable results, though
not the ones expected.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
instead of above sentence, better say that this was triggering:

&lt;4&gt; [174.830604] xe 0000:00:02.1: [drm] Assertion `gt-&gt;sriov.vf.guc_version.major` failed!
...</pre>
    </blockquote>
    ok.
    <blockquote type="cite" cite="mid:ddf9bf4a-f7f3-4a1a-908f-2b8dd6d066da@intel.com">
      <pre wrap="" class="moz-quote-pre">


</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">
This change dislodged part of the VF migration support check
and moved it to after GuC handshake.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
and describe your changes in imperative mood

[1] <a class="moz-txt-link-freetext" href="https://docs.kernel.org/process/submitting-patches.html#describe-your-changes">https://docs.kernel.org/process/submitting-patches.html#describe-your-changes</a></pre>
    </blockquote>
    will do.
    <blockquote type="cite" cite="mid:ddf9bf4a-f7f3-4a1a-908f-2b8dd6d066da@intel.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">
v2: Use xe_sriov_vf_ccs_migration_bb_needed()
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
you can keep change log under ---</pre>
    </blockquote>
    ack.
    <blockquote type="cite" cite="mid:ddf9bf4a-f7f3-4a1a-908f-2b8dd6d066da@intel.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">
Tested-by: Matthew Brost <a class="moz-txt-link-rfc2396E" href="mailto:matthew.brost@intel.com">&lt;matthew.brost@intel.com&gt;</a>
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
I guess above was true for # rev1</pre>
    </blockquote>
    ack.
    <blockquote type="cite" cite="mid:ddf9bf4a-f7f3-4a1a-908f-2b8dd6d066da@intel.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Closes: <a class="moz-txt-link-freetext" href="https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/6349">https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/6349</a>
Fixes: be5590c384f3 (&quot;drm/xe/vf: Enable CCS save/restore only on supported GUC versions&quot;)
Signed-off-by: Tomasz Lis <a class="moz-txt-link-rfc2396E" href="mailto:tomasz.lis@intel.com">&lt;tomasz.lis@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 41 +++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_vf.h |  1 +
 drivers/gpu/drm/xe/xe_guc.c         |  2 ++
 drivers/gpu/drm/xe/xe_sriov_vf.c    | 10 -------
 4 files changed, 44 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index 46518e629ba3..34c68de6e2f3 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -314,6 +314,47 @@ static int guc_action_vf_notify_resfix_done(struct xe_guc *guc)
 	return ret &gt; 0 ? -EPROTO : ret;
 }
 
+static void vf_disable_migration(struct xe_gt *gt, const char *fmt, ...)
+{
+	struct xe_device *xe = gt_to_xe(gt);
+	struct va_format vaf;
+	va_list va_args;
+
+	xe_gt_assert(gt, IS_SRIOV_VF(xe));
+
+	va_start(va_args, fmt);
+	vaf.fmt = fmt;
+	vaf.va  = &amp;va_args;
+	xe_gt_sriov_notice(gt, &quot;migration disabled: %pV\n&quot;, &amp;vaf);
+	va_end(va_args);
+
+	xe-&gt;sriov.vf.migration.enabled = false;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
this looks like a layer violation

and we already have a function that wraps that at the device level

maybe just promote device-level vf_disable_migration(xe,...) from xe_sriov_vf.c
and call it from this gt-level place ?

hmm, but see below [2]

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+}
+
+/**
+ * xe_gt_sriov_vf_guc_check_migration_support - Check for disable migration due to GuC.
+ * @gt: the &amp;xe_gt struct instance linked to target GuC
+ *
+ * Performs late disable of VF migration feature in case GuC FW cannot support it.
+ */
+void xe_gt_sriov_vf_guc_check_migration_support(struct xe_gt *gt)
+{
+	struct xe_device *xe = gt_to_xe(gt);
+
+	if (!xe_sriov_vf_migration_supported(xe))
+		return;
+
+	if (xe_sriov_vf_ccs_migration_bb_needed(xe)) {
+		struct xe_uc_fw_version guc_version;
+
+		xe_gt_sriov_vf_guc_versions(gt, NULL, &amp;guc_version);
+		if (MAKE_GUC_VER_STRUCT(guc_version) &lt; MAKE_GUC_VER(1, 23, 0))
+			return vf_disable_migration(gt,
+				&quot;CCS migration requires GuC ABI &gt;= 1.23 but only %u.%u found&quot;,
+				guc_version.major, guc_version.minor);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
since we split migration checks from one place,
this CCS GuC ABI condition shall be placed in sriov_vf_ccs.c subcomponent</pre>
    </blockquote>
    will move.
    <blockquote type="cite" cite="mid:ddf9bf4a-f7f3-4a1a-908f-2b8dd6d066da@intel.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+	}
+}
+
 /**
  * vf_notify_resfix_done - Notify GuC about resource fixups apply completed.
  * @gt: the &amp;xe_gt struct instance linked to target GuC
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
index af40276790fa..60a3b9b05b20 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
@@ -26,6 +26,7 @@ void xe_gt_sriov_vf_migrated_event_handler(struct xe_gt *gt);
 int xe_gt_sriov_vf_init_early(struct xe_gt *gt);
 int xe_gt_sriov_vf_init(struct xe_gt *gt);
 bool xe_gt_sriov_vf_recovery_pending(struct xe_gt *gt);
+void xe_gt_sriov_vf_guc_check_migration_support(struct xe_gt *gt);
 
 u32 xe_gt_sriov_vf_gmdid(struct xe_gt *gt);
 u16 xe_gt_sriov_vf_guc_ids(struct xe_gt *gt);
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index d94490979adc..3c4e64233b3a 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -713,6 +713,8 @@ static int vf_guc_init_noalloc(struct xe_guc *guc)
 	if (err)
 		return err;
 
+	xe_gt_sriov_vf_guc_check_migration_support(gt);
+
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
[2] so this is now going through these layers:

guc_vf    vf_guc_init_noalloc
gt_vf       xe_gt_sriov_vf_guc_check_migration_support
xe_vf         xe_sriov_vf_migration_supported
xe_vf_ccs     xe_sriov_vf_ccs_migration_bb_needed
gt_vf         xe_gt_sriov_vf_guc_versions
gt_vf         vf_disable_migration
xe_vf           xe-&gt;sriov.vf.migration.enabled

so maybe better leave this VF GuC init as-is and just make &quot;late&quot; checks
in xe_device_probe either in xe_sriov_init_late

xe        xe_sriov_init_late
xe_vf       xe_sriov_vf_init_late
xe_vf         xe_sriov_vf_migration_supported
xe_vf_ccs     xe_sriov_vf_ccs_init_late
xe_vf_ccs     xe_sriov_vf_ccs_migration_bb_needed
gt_vf           xe_gt_sriov_vf_guc_versions
xe_vf         vf_disable_migration

or after for_each_gt/xe_gt_init_early loop

xe        xe_device_probe
xe_vf       xe_sriov_vf_check_migration
xe_vf         xe_sriov_vf_migration_supported
xe_vf_ccs     xe_sriov_vf_ccs_init_late
xe_vf_ccs     xe_sriov_vf_ccs_migration_bb_needed
gt_vf           xe_gt_sriov_vf_guc_versions
xe_vf         vf_disable_migration

or just make it as part of the xe_sriov_vf_ccs_init()
since before that point CCS migration is not working either</pre>
    </blockquote>
    <p>The check can be done later than where I put it; but it needs to
      be before IRQs are enabled. Both kinds of these are enabled in
      `xe_gt_init()`:</p>
    <p>MEMIRQs in
      gt_init_with_gt_forcewake-&gt;xe_uc_init-&gt;xe_guc_enable_communication</p>
    <p>MMIO IRQs in gt_init_with_gt_forcewake-&gt;xe_irq_enable_hwe</p>
    <p><br>
    </p>
    <p>The `xe_sriov_vf_ccs_init` is currently called after `xe_gt_init`.
      I'm not completely sure if this is correct placement .. it might
      be, if there are no CCS metadata set at that point.</p>
    <p>GuC should have no problem assisting to migration without CCS
      metadata transfer, so that placement could be ok.</p>
    <p>But that's definitely too late for figuring out whether we
      support migration at all.</p>
    <p>So this eliminates the `<span style="white-space: pre-wrap">xe_sriov_vf_init_late` and `</span><span style="white-space: pre-wrap">xe_sriov_vf_ccs_init` <span style="white-space: pre-wrap">options.</span></span></p>
    <p><span style="white-space: pre-wrap"><span style="white-space: pre-wrap">
</span></span></p>
    <p><span style="white-space: pre-wrap"><span style="white-space: pre-wrap">For the 2nd option - this can be done. But does it really make sense to put a single-platform workaround check directly in `</span></span><span style="white-space: pre-wrap">xe_device_probe`?</span></p>
    <p><span style="white-space: pre-wrap">I can do this - if you consider this option acceptable. Though personally I see no reason for trying to rip it out of `</span><span style="white-space: pre-wrap">xe_gt_init_early`. It can be easily turned from per-gt check to single GT check (by checking only the primary GuC which will actually be responsible for scheduling the CCS save/restore BB execution), but that gives an option rather than a reason.</span></p>
    <p><span style="white-space: pre-wrap">Any place between </span><span style="white-space: pre-wrap">`xe_gt_init_early()` and `</span>xe_gt_init()`
      is ok for me.</p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:ddf9bf4a-f7f3-4a1a-908f-2b8dd6d066da@intel.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre"> 	err = xe_gt_sriov_vf_query_config(gt);
 	if (err)
 		return err;
diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
index 911d5720917b..5fb042c05112 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
@@ -163,16 +163,6 @@ static void vf_migration_init_early(struct xe_device *xe)
 		return vf_disable_migration(xe, &quot;requires gfx version &gt;= 20, but only %u found&quot;,
 					    GRAPHICS_VER(xe));
 
-	if (!IS_DGFX(xe)) {
-		struct xe_uc_fw_version guc_version;
-
-		xe_gt_sriov_vf_guc_versions(xe_device_get_gt(xe, 0), NULL, &amp;guc_version);
-		if (MAKE_GUC_VER_STRUCT(guc_version) &lt; MAKE_GUC_VER(1, 23, 0))
-			return vf_disable_migration(xe,
-						    &quot;CCS migration requires GuC ABI &gt;= 1.23 but only %u.%u found&quot;,
-						    guc_version.major, guc_version.minor);
-	}
-
 	xe-&gt;sriov.vf.migration.enabled = true;
 	xe_sriov_dbg(xe, &quot;migration support enabled\n&quot;);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
this would be non-reliable, as we might still disable migration later on

so we should either remove it completely (assuming its &quot;enabled&quot; until explicitly disabled)
or reverse the logic and use this flag instead:

	xe-&gt;sriov.vf.migration.disabled</pre>
    </blockquote>
    <p>will remove, it doesn't make sense here.</p>
    <p>-Tomasz</p>
    <blockquote type="cite" cite="mid:ddf9bf4a-f7f3-4a1a-908f-2b8dd6d066da@intel.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre"> }
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
</pre>
    </blockquote>
  </body>
</html>

--------------e1PoYq6kRaPPRQTqhNbs749I--
