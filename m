Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B019CA0EED
	for <intel-xe@archiver.kernel.org>; Thu, 28 Aug 2025 23:53:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A712A10EB03;
	Thu, 28 Aug 2025 23:53:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GpkWnW+f";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DF4B10EB03
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Aug 2025 23:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756425211; x=1787961211;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=CxJKBqQB+B3IVAUNQiF5SllY3ijPW6mtUpMNLlx+7fY=;
 b=GpkWnW+fMyApvVBwmBMae5pn/ZqUw52tIvQhRgQoCyxa5P023IgeM9hb
 z574d18wOjx59QCEMKWiTJyWLu4Xn4BHkaSw1fssMbWZHIZ7rz/l8Y9BG
 NomCiU123u9QCR0P64ZyBT0/tyj39qtGEvg2DcTvOH8zKQ/0vfODlTvvo
 3InwiP9KVwQ47J0AQPER0opbl7jIc+U1bbL+ROGESy5Iv0E8YqqUVcJVF
 g9J0r+gZfxIqX1YwlOOqtzeWxAHo4MtCQcV+e/BtJ5GmBYDe4/fg55p5D
 x1su8SZgROvGykDal+iK9J2R89UhwoG1kb6sr4lNkl1XfBa/9Mr2orJqx Q==;
X-CSE-ConnectionGUID: qLFSCPxtS2SKaEiZqWAtpg==
X-CSE-MsgGUID: Gx3gB6gVSqSuzu5nmV1Hyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11536"; a="58418859"
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="58418859"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 16:53:31 -0700
X-CSE-ConnectionGUID: XgB8JTXHSrKi35J3a4iRlg==
X-CSE-MsgGUID: LMzKcqmMRZGW34wGn1WDBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="169541893"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 16:53:32 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 28 Aug 2025 16:53:30 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 28 Aug 2025 16:53:30 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.87)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 28 Aug 2025 16:53:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tJyt7qk3JKTJbAb0QiXN68XvT1ZmHlPycVT2UgIYPAmOeyPcLnzFnHvMXtUfkUhFN6WFTIlPxYz/OSTDEHO1k5PgUIFqncOZswSXc8CACeL/eGodhEVuvP9ALtt9H6TT5cXjbYxchXaSgf5AkMcpG+7W5fnaqzkKWJ2c0RipDPkJYHFJwtvLItngv8BH7y5ZqDQZMYpeJt5pQFs/UdJPCHgTPMsMuxWuotTFdHjhwYgJNsjd/vwsPfVY6Ftja6c7DOGV072iaMjvI1ItD/3gdb9bmbVes1VOdd59jyC7wwKsLipagRIX/DacH9cLxR4l+FtLTugYzCm3c94qaVW7Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cfzGSvInmWY+jG9YZaMTTuS3VVfXgq7u3ecrHj1SZQo=;
 b=nrIpnptK1Opp+PrI5AIXJl965x6ocA9SSbJlNRgN6YZzRud/Y4tPbo3m8YQ2v+atsMtnNqbY97jF10h5YcOQFnMeIUg5NbUYoosSncSsDweLb2xDVjrMagnfkuYEVD38jKLLU+hxoZjNIi/lVjJj8ARwiFP4flDQntXftCniMI53bCECsNttlGxcXjCYWWCWNshkCWOgCm0zzKfBJ9DJJk5OqPquGvCSsybbMNXh6hImKo3PGa9D/SIgGjPZvvl0sdz92SjewVW588dqcqmg8UYKIfHxigPlH5bB8SHbBKuQIxyT16hlQjIPFqvU1Ck3pYcRjcoUdfZLZHl26YJjuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by SJ0PR11MB5867.namprd11.prod.outlook.com (2603:10b6:a03:42a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.18; Thu, 28 Aug
 2025 23:53:23 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%4]) with mapi id 15.20.9073.017; Thu, 28 Aug 2025
 23:53:23 +0000
Message-ID: <9a54432f-fa0f-4327-9e34-4f2a50ac5527@intel.com>
Date: Thu, 28 Aug 2025 19:53:21 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/guc: Update GuC log buffer type value
To: "Summers, Stuart" <stuart.summers@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>
References: <20250827215217.1030775-1-zhanjun.dong@intel.com>
 <658967b09cecdf0f20ad3547d4ab5ed3e016964d.camel@intel.com>
 <0b71e049-bdc7-4ece-a978-26e4f538efc6@intel.com>
 <e0db801f2d93ff682aa916990aee8c5840eb671b.camel@intel.com>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <e0db801f2d93ff682aa916990aee8c5840eb671b.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW3PR06CA0021.namprd06.prod.outlook.com
 (2603:10b6:303:2a::26) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|SJ0PR11MB5867:EE_
X-MS-Office365-Filtering-Correlation-Id: dcb6c227-fca3-4fc7-6f7f-08dde68e1306
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N1ZMdVIyRGhXSzBvYWNUZnhBY2k1QXNRV21KOHJXWlVLWlM4akZKSDNMZEdG?=
 =?utf-8?B?VVlkM1hLY3FUOVlETkdUSzFWZ0QyN3ZhVmN0Ui9xekJUWWxBZmt1TW1Cc3BV?=
 =?utf-8?B?SmU0V1kyelc2M3kzd2RHMXh4cDBuTlBpRS9lU3o2QnZhaWlBWVNVTVYxa2pv?=
 =?utf-8?B?YTRsSTdZYnN0YTdGa0tESzBiYlMyU01hMzhGUWZKeG5BaVU1M09KREdjYTlT?=
 =?utf-8?B?cTJQcmFLZ3RyY0lNNEhhb0FUb2ZuSTNwZGNnYUl2N1I1a1liRFhCM3cyTms2?=
 =?utf-8?B?OG5KajR2bmdOWGhweGdJenZmUXEwaXJQbHlZQXVYcDBkY2pqRFJrS0ovbnVj?=
 =?utf-8?B?QUN0eHByZTAzWmFaZVlrenBDRGwrR2lzVEE1TW1EV3lBWnFQT2dzOHo1ZGwr?=
 =?utf-8?B?ZkVBSEZ1aVJaa292aE03cTVjSXpGR3BzS1pRcDkxVXE4UytMRW5VSHFNNzRD?=
 =?utf-8?B?UFpXRU40L0FzbmorTUFjOTVENHhEem5BWHJHSVdSUnZzakMwa0kxNXpGbXBt?=
 =?utf-8?B?R3Nob3RlLyt0dWNCMFVXRW1QcHpZeVhKV1lzQUtHanMybW1CM2JVZjJ2Sncw?=
 =?utf-8?B?T1RYQlJSNHpkcUF4UTUrVFZjZFc1WDM3ODlhWmNsMlBUNGpFTEprcDI3S1pk?=
 =?utf-8?B?TTFwSHFLeEE1REpUNTVpa25NVjlPV3Z2UW1GRXFPc3VjNFhsRTJtLzIzK29j?=
 =?utf-8?B?N0l1ZGZTMWR2ZWNJQ2JBRXFxZjYxQTQzSW13UmxxZGxYOXp5WmF5VWVsSDdB?=
 =?utf-8?B?YUg0YkFKSHpBZE1mMS9OQmNmTlBnL0Nhcm9YOTZURzhMNmRRZFBGTmRiZ2dU?=
 =?utf-8?B?M1YxVFlzVGR0TG1pWklHa1YrZ1Z2ZVhDVmg4SSthd0pLa3dXdmNCRE9Eb2E2?=
 =?utf-8?B?WDBWd3VxNXdSNGRtRGp3aE9DdTM1ZWdOM1dOZlNYWXM2Qm04eEI4ZEJ0bFRx?=
 =?utf-8?B?SGxaamdPb2hvVFpLTFV1Z3hNNVlPcFM5SDkvZmZtY3NhcFBnSDROR3ZlTzhz?=
 =?utf-8?B?OUxkMnVIblZtejZnTUcxSHpXb01zZjVqV2k2bURZcTV0TlpIdXd3WC9BY1BY?=
 =?utf-8?B?UjVlQ3VWd3JHNjFPdis5aFVGOVA5cEpwelZKL25tMGhzYlZkM1lISUtIaG9t?=
 =?utf-8?B?NTNYM2VpbmdTNFRSUXJvWUFrZDBBalJkVUFXekxTd0dOUDNVUU8xQU5LNnRi?=
 =?utf-8?B?bkRJUkZYeXBXR3hQNnZhc0RSdVc3bHlZUStqWDFGZWUybHYwUURVczV2QU50?=
 =?utf-8?B?dkxXM0F6MFNjRGFOTFdrWlpYQmlSQjI0TUZ1ZjlIOFJXc1dMcG56ZFNDTEh3?=
 =?utf-8?B?ZHZHWkRWcXhYdCtQTXI4a2IvWGZmT3VDN2pOQWJFRWhEdU1ZMGdEVTJ5NTZv?=
 =?utf-8?B?aS9DdkxuSjkrUHJtYTd4UE5sbGhRRVhNREZGTGhXSDFGRlhCNGxpdnhybDVl?=
 =?utf-8?B?SFdjWGxNditaUUpBN0xEOGdaY3lReXJKSjZURE92MzZOWnd6a21jQ1Q4RWVQ?=
 =?utf-8?B?MUxaN1o1b3BTK3R1c3h5Y0tiNGtUOTZ3TjVYWktSL0s3dEVRWmQ1ZmtDZkVU?=
 =?utf-8?B?TFQ2N3JlVjRRdko4K0dDejQxVWg1WCthVnprb3JocW8wUUFHZzhUUG9BdUlq?=
 =?utf-8?B?Yk9nRTllNUJZREUyUCtBNTFNZnAvbXNqTHFUWkplMVI4M1BRQjZSYmFVY2FP?=
 =?utf-8?B?Y0RteEpkTDkyV0lhTElrR2pWMUNEYU9PN3pzSjdtUUZBRTZrWTUvVE1iUkxi?=
 =?utf-8?B?VXM1dDk3ZW93YVprZmVVVlV5T1pldnh4Tkx3NXNOQVhRWXBzS0ZBYnI5MHNt?=
 =?utf-8?B?WFJEVnFGMUNUQ1F1UkpkSVBuWlpHQkRzc2N1NlRlVUhzRlVaTHdrMEE5V1VY?=
 =?utf-8?B?cHphVXFRb0J3RFpGTElLUE5HQ0RwdmZoRlpabFFqbHo2Unc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?My9tYVFKdGhOemRHZ1c3SnM2eHVhYzEwQmNzQWg2NG4vVnBJQmpFMzFka2tY?=
 =?utf-8?B?QUhiZUpQVUdDdVMvTjM4eThqUGQ1TUs5MDkrd2Y3UWI5M2k2d3psZzM4bHlR?=
 =?utf-8?B?ZFRuaHU2c3NRdU55SnpHd2RBRCtwUk1HbjZXT0oxRFF4V1lkU2dMcFJJakxi?=
 =?utf-8?B?TGNLazQ0VzUwZzUrSHhNWElob0pVbnp5K1dSemUwQW93cFpmV1pCOSs1Y1c4?=
 =?utf-8?B?M29hdlhoQTFzemFnaFRMbkJTampVWis2Z202Y01QajA5MXRBeXkzeSttWHc1?=
 =?utf-8?B?L2xTdk15bTFLaHV3RzgrWS9DMlAwOGlYTzE4dGd5aFlPbG1MaXRKcnc4UEdo?=
 =?utf-8?B?ajlFQVhCalFxUjBCc1VZTjJRSTF5bEswRDBGTS8zUUIxSTF4cERtWGJ3dFc0?=
 =?utf-8?B?Q0FoQlFMMHNPOUJ6MXR2MXFWRzhkYzRvVzVlWC9EYVNVaFo2MlRWK2s3ci9D?=
 =?utf-8?B?S0FXbEZpVUZTQ0ZKZ0grWVB4SnZnVThOVDh1WklCb0RsMjJKZ29kemhER1Rp?=
 =?utf-8?B?MmpqNDV4STUwU2RlamRkQWNzekJzcFY5YkI2TkFOZmkxVVlWSHcydk5JTEgy?=
 =?utf-8?B?VVZRSzFEcVJTcXE1UzRDK3BXcGRQNTEyeWJDMVBjQVp3ZjFhalYzSWxRVWUw?=
 =?utf-8?B?bU9VcEtmTitXOFBjZXRqN0VZK05BbTFBbytDQ0FnQ0luSzhrMm5oSW9Dayt6?=
 =?utf-8?B?cnJHS2VqNXM1N3BtZkNYQWZNUWJpd1VLc1lOOXE5QW9VTHA4VThHRjZKQ2VD?=
 =?utf-8?B?QVh1TGxzOEdYbjdNV2loaGdJOUNJVFgrZmUyWGxZczdFaUJWNEFZc2dIYkJr?=
 =?utf-8?B?OURtbkV3ajJKVXd4ejg1WFJiREoxejRDRGV0eE8zS1RKUGlIL3JwNHcxYUsv?=
 =?utf-8?B?TzJ0Tm1xV0c4MjNubkMrWUZnTDVFRlVQSFVjS2FFRTZJVkVtSUJ4QlBIaWhy?=
 =?utf-8?B?REJBbVpFUng3YVd6aWc2dmVXRkgyK1h5TERtMXhrdEhDYlhOTUg2bVZEVnBC?=
 =?utf-8?B?QS9xZzU2M0JqQnB1cGliTHNsd1JCZ0lOOFI2RTlJZ3BMampzVXpzZVRxQkEy?=
 =?utf-8?B?NVZhSndoZkVydllSUGtQR1JzUTI4WTExbitwUW83R0ZnTTZUZmNpWGRnQVhZ?=
 =?utf-8?B?L3doOXBrMUg1eEtsZERFSDVTU1ArNmFlRkhoZzlJcDh0YnFoMWxEdFFGK2Zi?=
 =?utf-8?B?UkMzb1lCT2Z1TUxWaFNQQVJyRW1XNnBoM0xyQkhZSUxjalByVnZjWERUejRs?=
 =?utf-8?B?NitqeWtDc0lKUlZKeVA1M1E3N3dJM21ySmtINVUzMTlaOUxjcmdDNU9yU3FB?=
 =?utf-8?B?L0tXMWJGT3ZEbGFraE1tMWxHNUFuaHBuZ01IdmJKVklkNWFibGZyMUQ3bzh4?=
 =?utf-8?B?L0ZXQlFDeVpXakZqbWZKZEJ2RHM5b0FybnVlZ3orZXFtTGRINVZDbVJ3OC9m?=
 =?utf-8?B?WUdSQkhkZExYZVJMQ2dya0ttVE80K0RZN0tYclFvajUwVVdPMDBWbUxsdmRF?=
 =?utf-8?B?ZXMrZ2huWGRFV3dPNHJMeDErbVowMGplMVh5RVlSQWRUTEZ3Y1BRQWNDZXlJ?=
 =?utf-8?B?QnJQVkp0SlVGWUFyM1VVU2dDY3hwL21XbFdFVTBqWFIweS9kQzRpRSsrRnQy?=
 =?utf-8?B?eDg3dWZwWjV6YWc3eXhaMWlSSDMxbHAyeURuT1JWVUNXK3o2bkQrZGZMYkFD?=
 =?utf-8?B?LzlWS0IrQmJyQ0xSUDBSWjlFZ0JsQTgrMlpmRWFuMWpRc01nSEdGMTRDVEFN?=
 =?utf-8?B?L3VZZ2dMRGNDdHcrdWJJR01kM3ZRWXkxVEY2MFdISmpHUEhKMjd0czhHYStR?=
 =?utf-8?B?eUdHVlA2YlRGVm9Rc01RMTc0L3lEN3QxbVpwalRUL0kvZTRJS0w5YWJQalRP?=
 =?utf-8?B?c3FSZ1pXS0ZNRmhTR2I1UFRsb3IxYWNtNkE4RnVuNnlpWDRDb1ZvY1I3aGNT?=
 =?utf-8?B?eS9VVzVGR0xpc2w5SHhIbUZ6eHlybEdhcS9SWEtKcTd3YjZjNXBWWlpLbm5z?=
 =?utf-8?B?YUFrTjNMUUtVWnp4TlZ0Y3Rha3BGaUlNZ09RbThFblJNbEt6RUlmNGZUMWJh?=
 =?utf-8?B?TEUvSXJveS9Tek9nNUdaV0MwZWhkUDFhR3VMUjJnUzYvR3pZWnN2M1k0cDBE?=
 =?utf-8?B?dHUvc0hzM2lkMXlkTnI3OXZhWnQ3VmRLQnZBN2ZEUEE1MGtYWktYU1lKUGxK?=
 =?utf-8?B?TVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dcb6c227-fca3-4fc7-6f7f-08dde68e1306
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2025 23:53:23.7152 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ULszUKsAGluBU2wBQaNaex25X+O1vRxEFNpx4AVONPbEajteJQh2qYGm3tFLqSqgBDaIr9+VnpRWHbzIhqvJ2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5867
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



On 2025-08-28 5:53 p.m., Summers, Stuart wrote:
> On Thu, 2025-08-28 at 23:49 +0200, Michal Wajdeczko wrote:
>>
>>
>> On 8/28/2025 8:59 PM, Summers, Stuart wrote:
>>> On Wed, 2025-08-27 at 17:52 -0400, Zhanjun Dong wrote:
>>>> Update GuC log buffer type value, make buffer types equal to
>>>> guc_log_buffer_type in intel_guc_fwif.h.
>>>
>>> This is just to maintain consistency with i915? Can you add in the
>>> commit message that intel_guc_fwif.h is in the i915 driver?
>>
>> hmm, but looks like a FW definition (it's part of the ABI headers)
>> so IMO better reasoning should be:
>>
>> "to align with the GuC ABI specification"
> 
> Agreed.
Agreed, will follow this in next rev.>
>>
>>>
>>>>
>>>> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
>>>> ---
>>>>   drivers/gpu/drm/xe/abi/guc_log_abi.h | 2 +-
>>>>   drivers/gpu/drm/xe/xe_guc_log.c      | 2 +-
>>>>   2 files changed, 2 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/abi/guc_log_abi.h
>>>> b/drivers/gpu/drm/xe/abi/guc_log_abi.h
>>>> index 554630b7ccd9..b1819679fa35 100644
>>>> --- a/drivers/gpu/drm/xe/abi/guc_log_abi.h
>>>> +++ b/drivers/gpu/drm/xe/abi/guc_log_abi.h
>>>> @@ -10,8 +10,8 @@
>>>>   
>>>>   /* GuC logging buffer types */
>>>>   enum guc_log_buffer_type {
>>>> -       GUC_LOG_BUFFER_CRASH_DUMP,
>>>>          GUC_LOG_BUFFER_DEBUG,
>>>> +       GUC_LOG_BUFFER_CRASH_DUMP,
>>>>          GUC_LOG_BUFFER_CAPTURE,
>>>
>>> Can you move GUC_LOG_BUFFER_TYPE_MAX in here as the last enum also
>>> to
>>> align with i915?
>>
>> GuC spec does not specify MAX
>>
>> it's our implementation helper (so shouldn't be part of ABI)
> 
> Got it and makes sense. Should we move the MAX to one of the non-abi
> headers then?
Yes, MAX not defined in spec, meanwhile, we need a way to get the max 
value for that enum, the max should be placed as close as possible the 
the enum, otherwise it will be hard to read to let reader understand 
which one this MAX is for.

Regards,
Zhanjun Dong

> 
> Otherwise I agree with everything Michal said here.
> 
> Thanks,
> Stuart
> 
>>
>>>
>>>>   };
>>>>   
>>>> diff --git a/drivers/gpu/drm/xe/xe_guc_log.c
>>>> b/drivers/gpu/drm/xe/xe_guc_log.c
>>>> index c01ccb35dc75..470c83ead543 100644
>>>> --- a/drivers/gpu/drm/xe/xe_guc_log.c
>>>> +++ b/drivers/gpu/drm/xe/xe_guc_log.c
>>>> @@ -330,7 +330,7 @@ u32 xe_guc_get_log_buffer_offset(struct
>>>> xe_guc_log *log, enum guc_log_buffer_typ
>>>>          enum guc_log_buffer_type i;
>>>>          u32 offset = PAGE_SIZE;/* for the log_buffer_states */
>>>>   
>>>> -       for (i = GUC_LOG_BUFFER_CRASH_DUMP; i <
>>>> GUC_LOG_BUFFER_TYPE_MAX; ++i) {
>>>> +       for (i = 0; i < GUC_LOG_BUFFER_TYPE_MAX; ++i) {
>>>
>>> I see that i915 is going from i = GUC_LOG_BUFFER_DEBUG and not from
>>> 0.
>>> Should we do that here too?
>>
>> actually if "i" was defined as "enum" then we shouldn't use 0
>> nor TYPE_MAX (since it is also not part of the enum)
>>
>> maybe the implementation should look like:
>>
>>          offset = SZ_4K; // don't use PAGE_SIZE!
>>
>>          switch (type) {
>>          case GUC_LOG_BUFFER_CAPTURE:
>>                  offset +=
>> xe_guc_get_log_buffer_size(GUC_LOG_BUFFER_CRASH_DUMP);
>>                  fallthrough;
>>          case GUC_LOG_BUFFER_CRASH_DUMP:
>>                  offset +=
>> xe_guc_get_log_buffer_size(GUC_LOG_BUFFER_DEBUG);
>>                  fallthrough;
>>          case GUC_LOG_BUFFER_DEBUG:
>>                  break;
>>          }
>>
>>>
>>> Thanks,
>>> Stuart
>>>
>>>>                  if (i == type)
>>>>                          break;
>>>>                  offset += xe_guc_get_log_buffer_size(log, i);
>>>
>>
> 

