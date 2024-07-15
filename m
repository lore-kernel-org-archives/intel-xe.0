Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 359E2C3DA4B
	for <intel-xe@archiver.kernel.org>; Mon, 15 Jul 2024 20:07:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E276610E50F;
	Mon, 15 Jul 2024 20:07:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c9nAUMQi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97FE210E50F
 for <intel-xe@lists.freedesktop.org>; Mon, 15 Jul 2024 20:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721074030; x=1752610030;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=c7SvEjKZdxGHyUDQyymLHMFHbuD5Qbw0FWthKYKf25w=;
 b=c9nAUMQipEyHo4yMY6ymnLYqOSXAKu+g+AbWbG71s4T6sSlXCY5Y1wEG
 Bz2HknEGqkjTSIuEYKM/IKxvv+4Qgp0YVvIjPHHymaTnznyGc9mMGgDSY
 6dZh98Wb/ME9ymPKfDHk9pXlXPqu12g0lEVRXv5EsIVDNx9W/4Uzx6uLk
 fmMUMnXaxUN07BckAcseCp4MtopcNCtGFqPzjLnIpl7wIeWUqiuexi3VK
 KELrwIhZjSdGm/ucud1CRSE5cJPX/b7LZ224UzX7cIc+1E8dsBoul0760
 DUjXUAVma1I5S5HvHPbHZ8bQnl7voRfA1bTd87uNWjdVnJl0An+3vcqWL w==;
X-CSE-ConnectionGUID: 7o/8q42aSfefIFSYYkaRGQ==
X-CSE-MsgGUID: YqgOYXGBSRefFdPut88dfA==
X-IronPort-AV: E=McAfee;i="6700,10204,11134"; a="29627492"
X-IronPort-AV: E=Sophos;i="6.09,211,1716274800"; d="scan'208";a="29627492"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2024 13:07:10 -0700
X-CSE-ConnectionGUID: R/ZEAu/KR+2ew/nbEXjf/Q==
X-CSE-MsgGUID: H3aHVs27SDyfju7wsPmoJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,211,1716274800"; d="scan'208";a="50373348"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Jul 2024 13:07:11 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 15 Jul 2024 13:07:10 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 15 Jul 2024 13:07:10 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 15 Jul 2024 13:07:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NpQm/LxaG92Morf2WmO1/6PDj5cUNk+DswFB2gutaaHCR5oxByJ6+9N3IqE9thSGEDO5VTaa3gSycdLM43FaC7BHB2lMHSB3e/vRbGTlvWtgmLGZcoMMr6aC+tby4njhq3US9EG7iHQMR2gKoI5AmYYoxvroLDey/C5xs7mgAKtTbi5G5japEHbc26WfvGYD+Mv/2SMD9vkRohLCS8AWYvfcMXmCJdXnxLNR1O0mGWw84OEgGJP+X9N3ZtdsR/u3Ie3Z3V6n2Rw8B6taurxGZ3Jzy2frzpNiZl26JhjI8yjA3FArHBBuxXVTYKzPj+/JX7KpxNK7ewuajObVAZXzCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=clcdI8JlvVFp/N13kbhcKoaFA1s6uP1gb1+Fll5sb10=;
 b=Qyds0TAJoW5r6gxgA0AzXNhRuOcasjv0fQq5D+oKoLnM+884AYyzID4RQh9gQRTdFxcyVyuLfGtKtFrAkXHvl7KZGP8mwj88MouGR7XQjG0DuB+YDvb5pwS9Lp93KmrloFssV34Rs3bY8otXsYkGJmUkQc8esg8gDrpsds8nsZpbsRQrvHyzm0hoNAquY3SZ4xfpxGrIQqP4X/+B2Vr1KmVvQMwwdWaUZCJNhfif9zhQhRZaV2c3vcF4+hVf/GMGkHvl9tucGAdql3ila2TssrtBKUcirOnS7205v4OIS6Dc/62AyKoK1vC5W7JZyQj0FUimTTt+g5M3gITWZY/e5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by SJ0PR11MB6574.namprd11.prod.outlook.com (2603:10b6:a03:44e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.36; Mon, 15 Jul
 2024 20:06:56 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50%7]) with mapi id 15.20.7762.025; Mon, 15 Jul 2024
 20:06:56 +0000
Message-ID: <61d178c4-fd69-48dd-9548-84ad4458723c@intel.com>
Date: Mon, 15 Jul 2024 13:06:53 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 10/14] drm/xe/pxp: add a query for PXP status
To: "Souza, Jose" <jose.souza@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
References: <20240712212901.2684239-1-daniele.ceraolospurio@intel.com>
 <20240712212901.2684239-11-daniele.ceraolospurio@intel.com>
 <9da733063a97cdf30473f2f97382eed62eacf251.camel@intel.com>
 <7fea79c2-ce58-4238-a4ec-37f3fef5c3d9@intel.com>
 <128f7b2fc964aec983cc6ddbbe31b4f1a615552b.camel@intel.com>
 <21dcb721-bcf7-4b6a-a4a5-cd51bf26449d@intel.com>
 <df2ff9848263e09213a8b739cc74381b09c0d10e.camel@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <df2ff9848263e09213a8b739cc74381b09c0d10e.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR03CA0013.namprd03.prod.outlook.com
 (2603:10b6:303:8f::18) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|SJ0PR11MB6574:EE_
X-MS-Office365-Filtering-Correlation-Id: be78d199-9006-4b97-3b91-08dca509ad29
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZXFPSnVrR0ZMcHdpbVZpZWVaa2t3eUs1V05uZmllYjlac1piL0J2cjdGeFZo?=
 =?utf-8?B?VjM0VzgwVVBCV0FUK2o1VlhjZUIxTGZDVTFvY2ErK3Y1b2VBVWJ1dlVmQjgz?=
 =?utf-8?B?YnYxcFVTNzJBS3VYZzIvb2VoMGZOZmJ0UEUzanlKZ1UvSUxOSXQ0djh1Zi9N?=
 =?utf-8?B?WjdtbisxbSt1R0pPNlRTWkhLUXl4Vk5NSGVNRVNsRjFYeEtFeU1iNmFUQ0Ez?=
 =?utf-8?B?dVIxOGJkcGZ3Z0VaTDNPTTFPelJnYjVYb1UwYlNPdEpteVE0UTljUk45SGtv?=
 =?utf-8?B?K2pERDRzTG13cU5pUWFaRmFTNitOQlRXOTRwME5FbDNYZzF4ZURkNkpabjNC?=
 =?utf-8?B?VDBXRFhIL01hZWs1SlY4YStMczA0N0xoV2EreEZHOFVUQWl1dzJCeFBZUjEw?=
 =?utf-8?B?WU81ajVqVytKdG5lSlVRbVIxRnZkWnc5ZEs0MDl3NGxhb1BEenVyQVY5Syta?=
 =?utf-8?B?d3pYU2dUSUpyV2FqTHZRdjIzQUpENDdzRDlidk10bmRVS0x3VnprRXVlckhk?=
 =?utf-8?B?RVRFMjRkeGhrMlc2VlZBbUNwaEEwMS9aNGdoTys5eVBGOXlKemRUQW5DTzJp?=
 =?utf-8?B?YXFGaHVRQWQySGJzWGEyUVZLY0VaSGY5bEM0SlVJeTdrUlcrOXVoY0RQYjFu?=
 =?utf-8?B?RGxxSFhROWNDazl6NkFpVENJMlY0SnZ1M1ZwalFvQzNZTkRLQkRVWXExVVBW?=
 =?utf-8?B?UjJqTWNaTkF6ZE5jYTF5WTBITW05eXJkVFNwYi92OFdWb2dnSXg5dUZJRDB6?=
 =?utf-8?B?dG5vZWFTTFBaMkFIc2tEa0hzNkorMUlIcmNxWStINi9WOFFJSVo2YUR0a2dM?=
 =?utf-8?B?M3VzNDlBTk44dDZFY2x2QlVCYlJSeDF0MHQxRmwrUDV5UnRaaHN4MFVtRytL?=
 =?utf-8?B?VlA5eGU3bTNXUS9SUm1NWkhwdW5Md0RRcmFLQitDZXBIamxwdW5lVU9sbzRy?=
 =?utf-8?B?N2tlcTY0SlB6b3pWWEJJNTRvYktZQ3VZaHNhaVdzbWdRQzZ1cHh2T0NubnFP?=
 =?utf-8?B?cCsxTmxJSGhQeENXM1hSRjNKRERuQVcvRGxHWHQxZHZRVERFRWNVRnYxRkl4?=
 =?utf-8?B?K3NvK1hPSmdpTzk3bEtZZmhPYnI3YlN4bjVxcFdhTXRPS05hNlhRSzJQWXkx?=
 =?utf-8?B?WnBJVmd6azgwclYramZKeVdxVFRMZ2RLLzJ6VlFvekNCNHBGL09lTFFzcTJZ?=
 =?utf-8?B?SUhKeStkbWhiejVCa3ZncVJ5RHl0YVk4dXpqS3g5eGtNT3R1WlBkU0UrR2lw?=
 =?utf-8?B?UzdiTUJQdTFtY01rZEtjRnBOcjU3WUhVSFR6RkJKRitIbXhFUXBtVDVPdXFD?=
 =?utf-8?B?eEpqN2NvZi9pZE4ySFhjVHpSY0FJeGxWNHFOZ1JrNVJvVmNDUkFSOGVLM3Fj?=
 =?utf-8?B?aVN6bjd5SGR6NmVnandVRG52aFFkdVdnaDBQSEJ6bmxTeEFFK2dtSGhmU1NJ?=
 =?utf-8?B?MnFKQlFjdnNybkNmZVF2K1NvTm9tRkVLWVZsUnE3TWtydnZqUGVwUXUxWkUx?=
 =?utf-8?B?dTRHbUprdDdEaTBweDYySEc5Rk5rWTROZVg1cUZIbTBvT3AvZHdEMWg1SU5k?=
 =?utf-8?B?ZXQwVU9LNW8wSkJobVNBbHRvMk1JbkEzYnJqL0drV3ZKRWZvVkRoMmlMUmhI?=
 =?utf-8?B?SU5IVTMyVVFlYUI0WitSVUF1RmZieWdDUm9uVDV2Z2ltRi9MNGNnVldYZjVY?=
 =?utf-8?B?M2duc2RlTVBLMXBNemZwN3pXbHRqbVhlQVZWVkhpSzdGZjEwbjcxRHh5eVlG?=
 =?utf-8?B?cm5Lb0FSK0dHSjAxRlFnY1I0UDFqS0xqcTg2Q08vQkdOQksyQTRyaGhXMDVJ?=
 =?utf-8?B?VVBoc25XanlzVG1iYU90QT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cW45ZnFSNmhUbDl6bysvMEVNbHRwb3VkY1BxQllKSGRrYkQ0Um0wTjV3eHVX?=
 =?utf-8?B?UHRSd3V3YjljTXA5M2tFUFd1ZmQyaE93VURUcnRHSE1JQnFEMnd3bUsxVm54?=
 =?utf-8?B?MWZ3b212NnN3c3FJdDdVQkJrM1FYeXEvT3pxVEE2ZVJHNk5kcnY2V3V3Vy9j?=
 =?utf-8?B?UTdIN1JGM3Zuc1ZYN0Z6N1U1aDVlQTBaa25uS1hDMDRLTmNMNndPalBmaTR3?=
 =?utf-8?B?d0UyOVVqU0JicE1YSVZ5dnRZUk9YL0piZVcxZDNBc3VZYVovcGQvZSt4NEln?=
 =?utf-8?B?VGZIdDlYNnVzZnZxeWRHRHZMVHI0YlphLzUvSUpEczhhMDJ2SVN4NlRYcEsr?=
 =?utf-8?B?L21MWkZNUWNUQy9sK1RwbXNwSHN1aTgrYmc4RE9CVEowM3N4UmJwR1VHMGtC?=
 =?utf-8?B?SVBSVCs0cUNySmlVUC9rZEpYYWhza0dVSDcwaHd6QWtiUnZpOEVnSlBzeG1u?=
 =?utf-8?B?SXFuOWRtQzliOWdvV2JXQyt3b2NiQmFpOHRJR1Y0Y1FFQUE0cUlWT25JdDV4?=
 =?utf-8?B?WHZJZnYzVWhZY2lETk1EUzhlUGVhL2hxR2xMSmg4OWtZMWRPaXRPaDhGRWVS?=
 =?utf-8?B?c2lvT1plQnpOUFZIVVBPaGxtZG9VVWM3b005MGhCUXJFK2pvQU02aXB6azFk?=
 =?utf-8?B?Rno5bi9wWk1qTGtrT2M4Sjh1d2NJWE1Kb1BvbjFMU2tHU21HL0hpbUxnU1Yy?=
 =?utf-8?B?RUNMUFFwdGpVakM1RlBBWVdLbnV3c3VLU1phOFJ5TUFRVmlqK2szdDg1eFh1?=
 =?utf-8?B?VHFLeWJqUFJQbXBZUFQzL3dFTWg5M0RMNG5NdVhlMktEcnpxaktMejBnYThT?=
 =?utf-8?B?bytBbzFRc3hOL0pvQnI5b3ZZenlDNUNybEFtazl0TnQ5Vmw3czFMWXNjbmov?=
 =?utf-8?B?TkRrNVBTOHc1eGhySDA0M3p1bmNiN3diZGx3YThRMTVsTDV1SlljNDlrQitS?=
 =?utf-8?B?b3MvejVWRk5ZM3JuM29PcWtOZW5ZRzVYU2hGWjZidTVoaWVzcGc5ckFsWSt5?=
 =?utf-8?B?Wmw5dExhNGNRSHFQak9pWHgzQVVZdEJmTGFYUmh2a0xiWXRzUTBRNHZxTzlx?=
 =?utf-8?B?UVc5bkE2YU4zSmlkbnk4M2FYQUpTd3U5anBVZVJsL05yUklXQTBmUVFINGds?=
 =?utf-8?B?cmpvYlpMOFpVKzdpUW90QmMzVHJRVzExSVRWUFZLZEhZZEVueDcwYW9ScnJW?=
 =?utf-8?B?U2tDRUM4blFoWFB5UTQydEs3RzQrYmgrbmVhNm9xdUc5dUpuRmJ6ZDhEMDlW?=
 =?utf-8?B?RVlYVWtqVVMrWHk4ZHhvK05sV2Z3SU0xY1YwNTNZZzJaVzBEaDJ5WGFadnha?=
 =?utf-8?B?c2RBcDh4Qndxd1ZBc0h6NWh4cnV3cDJlM2tna2lWQnFEVVcxVVQ2Q2dCUmhv?=
 =?utf-8?B?eFFEQ0VmWFZnT0hjS1JhMzlWdVd3a2FaZzBHb0dEb0QwbHhsZ2JpRHJ6c1Qz?=
 =?utf-8?B?bFM2N3VBYUkwc2dsK2gvMCtEbTNhZkFKSWJ1VDBYU0h6K1RFWmF6QXJlMEk1?=
 =?utf-8?B?eWE1ME5URkN1VXZrVGFwMFdGbHNGZTMwYWhnZGJqUHc4eGZ1L1VIL3lIQmFn?=
 =?utf-8?B?SzljKzFpK0thK292bHliWFpESGZTUjk1Z1ZtZGlNdWs0Wi9rcENIelN5VERr?=
 =?utf-8?B?cGhhaTgrT2VCa2pCejJxMEg4NW44QlFBVzdUL0t1MVBsM3N6eVdqWm9iVUlV?=
 =?utf-8?B?OHcyS1l0Um1TY3RCUmJJUkk2N1ZxczJlSjByN0RxK3hxb0VXVURBc3dmR3hr?=
 =?utf-8?B?ekxQbEZHTXppOW5rbU1SZjVtQWZHSS9sdExvdEF0ZTFLTlg2WUpmMHJiZ3Fz?=
 =?utf-8?B?alNDMGZCeGxVYjFXOTdKSytnZGZoQkIzeGd5S0dRTk9IUGlJUkRWSGgxbU9J?=
 =?utf-8?B?VEw3YUcwNlRqYmd2RjZTbkhNU1NjbTFadnp1dWFJWlRzQjBmaDl6dzcySGFB?=
 =?utf-8?B?ZFdZV2FobnlRSzlWWm56OW5VdlJ2YzhCaUFxYTQzKzYraC9UZXdQS1N5a3gx?=
 =?utf-8?B?YTFRa0lHLys4Y0VHeUVIVjRCNzQxQldoN3hmVmV4VGhrYnpKUVJoWklFSWZr?=
 =?utf-8?B?eGRIaFZSSlZIMmp1L1F5Wi9rNmxPaFFnbUVrbjFKa204Ujh3Nk12UmpLMFVW?=
 =?utf-8?B?UUdxYjE3YUc5VkpFZ1JsS3FicXF4L1hINnZWVS9hRm9MSkRjVWRmcndSdW5p?=
 =?utf-8?B?QXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: be78d199-9006-4b97-3b91-08dca509ad29
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2024 20:06:55.9677 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3UrSe1bKRBD/ZZ67aKXkMBW1dwZxbvCEjgyc7bJp8RU7Q2zf9QWiBZ2o7I9PSB99li/6/mdPbSIO4t8es5VOhOEpzggnIwo/HRQfsvOiGnw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6574
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



On 7/15/2024 12:52 PM, Souza, Jose wrote:
> On Mon, 2024-07-15 at 12:38 -0700, Daniele Ceraolo Spurio wrote:
>> On 7/15/2024 11:41 AM, Souza, Jose wrote:
>>> On Mon, 2024-07-15 at 11:03 -0700, Daniele Ceraolo Spurio wrote:
>>>> On 7/15/2024 10:54 AM, Souza, Jose wrote:
>>>>> On Fri, 2024-07-12 at 14:28 -0700, Daniele Ceraolo Spurio wrote:
>>>>>> PXP prerequisites (SW proxy and HuC auth via GSC) are completed
>>>>>> asynchronously from driver load, which means that userspace can start
>>>>>> submitting before we're ready to start a PXP session. Therefore, we need
>>>>>> a query that userspace can use to check not only if PXP is supported by
>>>>>> also to wait until the prerequisites are done.
>>>>>>
>>>>>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>>>>>> ---
>>>>>>     drivers/gpu/drm/xe/xe_pxp.c   | 33 +++++++++++++++++++++++++++++++++
>>>>>>     drivers/gpu/drm/xe/xe_pxp.h   |  1 +
>>>>>>     drivers/gpu/drm/xe/xe_query.c | 33 +++++++++++++++++++++++++++++++++
>>>>>>     include/uapi/drm/xe_drm.h     | 28 ++++++++++++++++++++++++++++
>>>>>>     4 files changed, 95 insertions(+)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/xe/xe_pxp.c b/drivers/gpu/drm/xe/xe_pxp.c
>>>>>> index e979b47f155a..e39a47aeb050 100644
>>>>>> --- a/drivers/gpu/drm/xe/xe_pxp.c
>>>>>> +++ b/drivers/gpu/drm/xe/xe_pxp.c
>>>>>> @@ -60,6 +60,39 @@ static bool pxp_prerequisites_done(const struct xe_pxp *pxp)
>>>>>>     	return ready;
>>>>>>     }
>>>>>>     
>>>>>> +/**
>>>>>> + * xe_pxp_get_readiness_status - check whether PXP is ready for userspace use
>>>>>> + * @pxp: the xe_pxp pointer (can be NULL if PXP is disabled)
>>>>>> + *
>>>>>> + * This function is used for status query from userspace, so the returned value
>>>>>> + * follow the uapi (see drm_xe_query_pxp_status)
>>>>>> + *
>>>>>> + * Returns: 0 if PXP is not ready yet, 1 if it is ready, an errno value if PXP
>>>>>> + * is not supported/enabled or if something went wrong in the initialization of
>>>>>> + * the prerequisites.
>>>>>> + */
>>>>>> +int xe_pxp_get_readiness_status(struct xe_pxp *pxp)
>>>>>> +{
>>>>>> +	int ret = 0;
>>>>>> +
>>>>>> +	if (!xe_pxp_is_enabled(pxp))
>>>>>> +		return -ENODEV;
>>>>>> +
>>>>>> +	/* if the GSC or HuC FW are in an error state, PXP will never work */
>>>>>> +	if (xe_uc_fw_status_to_error(pxp->gt->uc.huc.fw.status) ||
>>>>>> +	    xe_uc_fw_status_to_error(pxp->gt->uc.gsc.fw.status))
>>>>>> +		return -EIO;
>>>>>> +
>>>>>> +	xe_pm_runtime_get(pxp->xe);
>>>>>> +
>>>>>> +	/* PXP requires both HuC loaded and GSC proxy initialized */
>>>>>> +	if (pxp_prerequisites_done(pxp))
>>>>>> +		ret = 1;
>>>>>> +
>>>>>> +	xe_pm_runtime_put(pxp->xe);
>>>>>> +	return ret;
>>>>>> +}
>>>>>> +
>>>>>>     static bool pxp_session_is_in_play(struct xe_pxp *pxp, u32 id)
>>>>>>     {
>>>>>>     	struct xe_gt *gt = pxp->gt;
>>>>>> diff --git a/drivers/gpu/drm/xe/xe_pxp.h b/drivers/gpu/drm/xe/xe_pxp.h
>>>>>> index 8f0a3a514fb8..b2aae4abdd0e 100644
>>>>>> --- a/drivers/gpu/drm/xe/xe_pxp.h
>>>>>> +++ b/drivers/gpu/drm/xe/xe_pxp.h
>>>>>> @@ -14,6 +14,7 @@ struct xe_pxp;
>>>>>>     
>>>>>>     bool xe_pxp_is_supported(const struct xe_device *xe);
>>>>>>     bool xe_pxp_is_enabled(const struct xe_pxp *pxp);
>>>>>> +int xe_pxp_get_readiness_status(struct xe_pxp *pxp);
>>>>>>     
>>>>>>     int xe_pxp_init(struct xe_device *xe);
>>>>>>     void xe_pxp_irq_handler(struct xe_device *xe, u16 iir);
>>>>>> diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
>>>>>> index 4e01df6b1b7a..5da9f403c2b9 100644
>>>>>> --- a/drivers/gpu/drm/xe/xe_query.c
>>>>>> +++ b/drivers/gpu/drm/xe/xe_query.c
>>>>>> @@ -22,6 +22,7 @@
>>>>>>     #include "xe_guc_hwconfig.h"
>>>>>>     #include "xe_macros.h"
>>>>>>     #include "xe_mmio.h"
>>>>>> +#include "xe_pxp.h"
>>>>>>     #include "xe_ttm_vram_mgr.h"
>>>>>>     
>>>>>>     static const u16 xe_to_user_engine_class[] = {
>>>>>> @@ -678,6 +679,37 @@ static int query_oa_units(struct xe_device *xe,
>>>>>>     	return ret ? -EFAULT : 0;
>>>>>>     }
>>>>>>     
>>>>>> +static int query_pxp_status(struct xe_device *xe, struct drm_xe_device_query *query)
>>>>>> +{
>>>>>> +	struct drm_xe_query_pxp_status __user *query_ptr = u64_to_user_ptr(query->data);
>>>>>> +	size_t size = sizeof(struct drm_xe_query_pxp_status);
>>>>>> +	struct drm_xe_query_pxp_status resp;
>>>>>> +	int ret;
>>>>>> +
>>>>>> +	if (query->size == 0) {
>>>>>> +		query->size = size;
>>>>>> +		return 0;
>>>>>> +	} else if (XE_IOCTL_DBG(xe, query->size != size)) {
>>>>>> +		return -EINVAL;
>>>>>> +	}
>>>>>> +
>>>>>> +	if (copy_from_user(&resp, query_ptr, size))
>>>>>> +		return -EFAULT;
>>>>>> +
>>>>>> +	ret = xe_pxp_get_readiness_status(xe->pxp);
>>>>>> +	if (ret < 0)
>>>>>> +		return ret;
>>>>>> +
>>>>>> +	resp.status = ret;
>>>>> when status is == 0? does it means that will always succeed? it just matter of time.
>>>> no, it just means the init is still in progress. It can still end up in
>>>> an error state if something goes wrong during the init (e.g. GSC proxy
>>>> init failure), although that's unlikely.
>>>>
>>>>> For i915 in some older kernel versions we had to create a gem_context with I915_CONTEXT_PARAM_PROTECTED_CONTENT set to verify for sure if supported or
>>>>> not.
>>>> This query is enough to confirm. That's true for i915 as well, the query
>>>> was added explicitly to avoid having to create a context just to check
>>>> for PXP.
>>> But as you said above, if status == 0 it could still fail, so UMD will still need create a exec_queue to verify because UMD needs to report to
>>> applications if protected stuff is supported or not as one of first steps of Vulkan API.
>> If you need the answer and the status is 0, you need to wait a bit an
>> then check again. There is no other safe way of knowing if PXP fully is
>> supported or not.
>> Note that we expect this to complete relatively quickly after driver
>> load; the init itself takes ~500ms, but since it is done in a worker
>> thread it can be delayed a bit if the system is busy. The only exception
>> is if the mei driver doesn't load, for which case the timeout is 10s,
>> but that should in theory never happen unless the HW is in a very bad
>> state or the mei driver is totally busted.
>>
>>>   From what I looked to the code, exec_queue will return EBUSY if UMD tries to create a exec_queue with DRM_XE_PXP_TYPE_HWDRM but
>>> pxp_prerequisites_done() is still returning false. Can't you make something block in KMD until PXP initialization is running? Maybe add a blocking
>>> parameter in the status uAPI?
>> I can't block the driver init given that GSC init can be slow and we
>> don't want to delay the whole driver load by 500ms or more.
> I mean not block driver init but block exec_queue_create or DRM_XE_DEVICE_QUERY_PXP_STATUS.
>
>> I could add a parameter to block the pxp_status query until the result
>> is certain, but is there any reason you can't do such a wait in
>> userspace? I think it's better to block in userspace when possible and
>> it should be relatively simple to implement, something like:
>>
>> while (time_ms < timeout_ms) {
>>           err = ioctl (<query pxp status>);
>>           if (err || pxp_status == 1)
>>                   break;
>>
>>           msleep(50);
>>           time_ms += 50;
>> }
> The problem of doing this in UMD is that we would need to wait up to 10s in all cases.
> KMD could do some checking like if mei is loaded then wait up to 500ms, if not ready after 500ms mark as not supported.

We actually can't do any extra checking inside KMD. I haven't found a 
way of figuring out if mei is working; the mei driver has a number of 
sub-components, one of which is the one we need, and I couldn't find any 
way to figure out if it's not up because we're still waiting for it to 
load or if something went wrong. The only thing we can do is timeout on 
it (more on this below).

>
> And from what I understood there is no timeout in pxp_prerequisites_done() so even after 10s it would still return 1, so the next application starting
> would need to wait again up to 10s.

There is a timeout on the GSC FW init and HuC auth, so the FW status 
will move to error if the init doesn't complete or something goes wrong. 
We check the FW status at the beginning of 
xe_pxp_get_readiness_status(), so  all calls from that point onward 
would return an error code. The status can only be 0 in the first 10s 
from driver load (which is the worst case and should never happen, in 
normal scenario it should resolve within 1s even if there is a problem), 
after that it'll either move to 1 or return an error.

>
>> I have something similar in the local IGT that I'm using for testing.
>>
>> Also note that the proposed behavior is basically the same as i915.
>> Apart from the defines, the only difference is that in i915 we wait for
>> a bit (250ms) on context creation, but if PXP is not ready within that
>> time we do return a try again later error. Relevant i915 snippet:
>>
>> ret = intel_pxp_get_readiness_status(pxp, PXP_READINESS_TIMEOUT);
>> if (ret < 0) {
>>           drm_dbg(&pxp->ctrl_gt->i915->drm, "PXP: tried but not-avail
>> (%d)", ret);
>>           return ret;
>> } else if (ret > 1) {
>>           return -EIO; /* per UAPI spec, user may retry later */
>> }
>>
>>>>>> +	resp.supported_session_types =
>>>>>> +		BIT(DRM_XE_PXP_TYPE_NONE) | BIT(DRM_XE_PXP_TYPE_HWDRM);
>>>>> Looks odd to me that you return DRM_XE_PXP_TYPE_NONE as supported...
>>>> I just added it in to have all values of the enum represented. I can
>>>> take it out no problem if you think it is clearer that way, I'll just
>>>> add a note in the interface doc that DRM_XE_PXP_TYPE_NONE is always
>>>> supported.
>>> Ah just notice that enum drm_xe_pxp_session_type is set in exec_queue. But still, if PXP is not supported/available this will fail, so I can't see a
>>> case were only DRM_XE_PXP_TYPE_NONE is returned.
>>> So I don't think you need to return it as supported.
>> ok, I'll update it.
>>
>> Daniele
>>
>>>
>>>> Daniele
>>>>
>>>>>> +
>>>>>> +	if (copy_to_user(query_ptr, &resp, size))
>>>>>> +		 return -EFAULT;
>>>>>> +
>>>>>> +	return 0;
>>>>>> +}
>>>>>> +
>>>>>>     static int (* const xe_query_funcs[])(struct xe_device *xe,
>>>>>>     				      struct drm_xe_device_query *query) = {
>>>>>>     	query_engines,
>>>>>> @@ -689,6 +721,7 @@ static int (* const xe_query_funcs[])(struct xe_device *xe,
>>>>>>     	query_engine_cycles,
>>>>>>     	query_uc_fw_version,
>>>>>>     	query_oa_units,
>>>>>> +	query_pxp_status,
>>>>>>     };
>>>>>>     
>>>>>>     int xe_query_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>>>>>> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>>>>>> index 631fdc2ed493..746bc16bd220 100644
>>>>>> --- a/include/uapi/drm/xe_drm.h
>>>>>> +++ b/include/uapi/drm/xe_drm.h
>>>>>> @@ -619,6 +619,32 @@ struct drm_xe_query_uc_fw_version {
>>>>>>     	__u64 reserved;
>>>>>>     };
>>>>>>     
>>>>>> +/**
>>>>>> + * struct drm_xe_query_pxp_status - query if PXP is ready
>>>>>> + *
>>>>>> + * If PXP is enabled and no fatal error as occurred, the status will be set to
>>>>>> + * one of the following values:
>>>>>> + * 0: PXP init still in progress
>>>>>> + * 1: PXP init complete
>>>>>> + *
>>>>>> + * The supported session type bitmask is based on the values in
>>>>>> + * enum drm_xe_pxp_session_type, including TYPE_NONE.
>>>>>> + *
>>>>>> + * If PXP is not enabled or something has gone wrong, the query will be failed
>>>>>> + * with one of the following error codes:
>>>>>> + * -ENODEV: PXP not supported or disabled;
>>>>>> + * -EIO: fatal error occurred during init, so PXP will never be enabled;
>>>>>> + * -EINVAL: incorrect value provided as part of the query;
>>>>>> + * -EFAULT: error copying the memory between kernel and userspace.
>>>>>> + */
>>>>>> +struct drm_xe_query_pxp_status {
>>>>>> +	/** @status: current PXP status */
>>>>>> +	__u32 status;
>>>>>> +
>>>>>> +	/** @supported_session_types: bitmask of supported PXP session types */
>>>>>> +	__u32 supported_session_types;
>>>>>> +};
>>>>>> +
>>>>>>     /**
>>>>>>      * struct drm_xe_device_query - Input of &DRM_IOCTL_XE_DEVICE_QUERY - main
>>>>>>      * structure to query device information
>>>>>> @@ -638,6 +664,7 @@ struct drm_xe_query_uc_fw_version {
>>>>>>      *    attributes.
>>>>>>      *  - %DRM_XE_DEVICE_QUERY_GT_TOPOLOGY
>>>>>>      *  - %DRM_XE_DEVICE_QUERY_ENGINE_CYCLES
>>>>>> + *  - %DRM_XE_DEVICE_QUERY_PXP_STATUS
>>>>>>      *
>>>>>>      * If size is set to 0, the driver fills it with the required size for
>>>>>>      * the requested type of data to query. If size is equal to the required
>>>>>> @@ -690,6 +717,7 @@ struct drm_xe_device_query {
>>>>>>     #define DRM_XE_DEVICE_QUERY_ENGINE_CYCLES	6
>>>>>>     #define DRM_XE_DEVICE_QUERY_UC_FW_VERSION	7
>>>>>>     #define DRM_XE_DEVICE_QUERY_OA_UNITS		8
>>>>>> +#define DRM_XE_DEVICE_QUERY_PXP_STATUS		9
>>>>>>     	/** @query: The type of data to query */
>>>>>>     	__u32 query;
>>>>>>     

