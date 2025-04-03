Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 690F3C3600C
	for <intel-xe@archiver.kernel.org>; Thu,  3 Apr 2025 15:17:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2695C10E279;
	Thu,  3 Apr 2025 15:17:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lrN5B7tj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F49C10E275
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Apr 2025 15:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743693447; x=1775229447;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=xBoBLsp3Jpi0n27LraO2UAlhWpJv/HP4pZE4VnFBNNY=;
 b=lrN5B7tjgatgWHda3eEp4epAcB4CjL2B/Yd0EL71Xe4xlB6rbEfQz7Zx
 gmgP4J7YBQoSjkBf+HPNLEHZkxDeM6G+QQ2NNKFfjn5+x8k/r4otsoIrk
 pg2JSNfq8I9hwAYvPsZE9dGooAOoLDXLgz+9pQa5HOYNkU8oT0RboVzi8
 NXynCkSYrC0Qq8aIIfALt3EUo9/rkrpUv2jDxEWMRyFO85zRb+bjeV4FG
 e5sFpN2MVRy4vt1pKJfHzMMqBRTWE8J61DxKqIVARupxeXg2Nu9llbndW
 aM6pdG99N0AIvtt1kNNn9etrJ5cDHJEaUXix2kEbsaWIZa88ULym+sFb8 A==;
X-CSE-ConnectionGUID: I6AQ81LGTxWkj+07oo5uwQ==
X-CSE-MsgGUID: UHmLUZ8zQR2LTGdcm6qY2g==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="44823686"
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; d="scan'208";a="44823686"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 08:17:26 -0700
X-CSE-ConnectionGUID: tcrbKiSwSZS7oHXRRmNzqg==
X-CSE-MsgGUID: 3aJOj9t5QkSYJcilDcsW7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; d="scan'208";a="132165199"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Apr 2025 08:17:25 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 3 Apr 2025 08:17:25 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 3 Apr 2025 08:17:25 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 3 Apr 2025 08:17:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tc6Laa6RIISILbhMJH64rQoHLB9th5CmFiK7+yGPl/xxEZm/wBmDBd8azY4fu4WqAjqIxaX3Z9h5Mv4TwHzDyMVy5kTxaS1EpugRtsMjRuhZEsxa6TocPNxMCqcbHLLG8L/zj0C0QmkWDHHj2Tj5zXl+/j29uL0kerWfsVOkQNyC9HrFNEbZ3VVNxqAsEAH7L3TbsrgumbnxX5GMYnOlDPuutfRYTpH8yWVNWBTHsMXOuCUosq5zK4ylo8skoNexggJmHxpSeO8kMccXroFp4M+baDxvZ1MkFLNYpzl6kTHWiSoLRfFQmCsmazFAQc5po/SX0q/a0KgqyI1HBhPx0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1YNbIW8aunsbsX5fOFqD30HQYArY08j9h11M4a6r948=;
 b=TtMLSYfT/YeK00GqlsZQw2L2zESlRr/7HOt9c4c0/6F8Q+FgukSyrwiX/9n49IxjXLS6pf8/OucRhSizdbnIV0LP7D2B88BdX08CepShOpnsxmuFXykTxPNR6kBF0M6tK+iGCo8bJr3Tzd+yxkukkZISy7nm6yHnX+RO72wvHL+cJxdwrAYUuEGctYZMhGv85nlMcO3Ko999a2wMd0C5tsU28cVRrLEDY6D0eEWorSQvfEeKCZe9Weu25gnYBza7ua2cOxoFZl9FwX3Sddy0UQB3riHRdw22MQM52Os3JFk6kXqwk3SlK81Oq2jCEJOBLHcxeeK25pIVLj6CZtgpHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 SJ2PR11MB7456.namprd11.prod.outlook.com (2603:10b6:a03:4cd::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.47; Thu, 3 Apr
 2025 15:17:08 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::cec1:b76:724f:592e]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::cec1:b76:724f:592e%6]) with mapi id 15.20.8583.041; Thu, 3 Apr 2025
 15:17:08 +0000
Message-ID: <0b7b846b-f39d-49ef-9afa-56d818a0e69d@intel.com>
Date: Thu, 3 Apr 2025 17:17:04 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/xe/vf: Don't update GuC reset policy when
 changing wedged mode
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20250403094141.25941-1-lukasz.laguna@intel.com>
 <20250403094141.25941-3-lukasz.laguna@intel.com>
 <285deebb-2cd0-4a85-84ce-35d4514cd793@intel.com>
Content-Language: en-US
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
In-Reply-To: <285deebb-2cd0-4a85-84ce-35d4514cd793@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA1P291CA0010.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::10) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5488:EE_|SJ2PR11MB7456:EE_
X-MS-Office365-Filtering-Correlation-Id: 80c632fe-47d8-4409-2033-08dd72c29964
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TGN0SHdhbkh0TU5uOUI3RGo5bUd0K1BJZXFMUDNORVNsWUdVM2FwWEJDeGU2?=
 =?utf-8?B?R2htbTdpUW1haDVnb1VKVGdMYmJIYkNwY3BscXZkMTZXR3U1S1NhNDkwRmFM?=
 =?utf-8?B?REFodW11d05vWU9MMVlQMVlnUVM0bkdUZ1hZZHB5L2lsRVBZY3EzbWdhZk4y?=
 =?utf-8?B?UEI3TTAyZWZDNVBodUZsMUczMGEwaW12UGtidE9iU2s3YS90NXpkV2tiMUlm?=
 =?utf-8?B?WkJBNW5scCt2T3h3M0xESk9UTktZd1pjNExUbHNIbFRENTErU3NzTFlqTnk0?=
 =?utf-8?B?cEtnVjFQUldOVHRpeVp3dCszZHczR0hwaGxNaUo4VS9qczNnb0g3SnVEY1Aw?=
 =?utf-8?B?YmRjam55bklabEhqT0lWUC9BaXF5bFcwb0crSDNraW1uY2srYlpXazhYS1g5?=
 =?utf-8?B?azEvTnh5TWNRbkt2Rmk4RmZLRFdCWmpBaU9lc2kyZjJGa2xXWmVNc3pzSm55?=
 =?utf-8?B?ZVdwSjI0S0lUdzN0S1U2cVFBTkdzcDRnRjJta2NjT1d2TzlBZHN0MlNncFcv?=
 =?utf-8?B?OG4zakE4YXB2YXJHVXh6cGNpVmZBRmw3U3FWeHZtYTByeXhObWpzTStiaFVR?=
 =?utf-8?B?RnJzdVhWOC9lUW5WSDdORGUvTllaVU5maTBUOE1ncEU5NFdIdm8vZWhSVWRD?=
 =?utf-8?B?Q3hTNmtCK01jelluOFBsSG4zN2JBTXdTRnRtOWlJeFQvN1JEUkZrQ2VVTkdl?=
 =?utf-8?B?aVg4ZGpVVXJvMlgwS0ltWnQ3TnpyR21KL256ZjljOEZ6a3JpZWlsZzRyd3Jr?=
 =?utf-8?B?L1I5aGRyS25SNTFOS2t4VWNGaDgya3c2aUl2RGk1ZExGSFFnZ2I2YXB3V3Vy?=
 =?utf-8?B?NjZUSzZSckxxWlNTKzhJZ2sxQnc4MXNDVHduK20yWExHVkJlQ29DVUcvNS81?=
 =?utf-8?B?RElRL3lJQ1lTL2JGK1R2V0Q2c084RWZTNVY0SnZnY2w2cnBrQ24xcDNMMVNz?=
 =?utf-8?B?Wm1Nb2JFbmlURVZUdXJoVzRyMDdUNFl3aWoxTWs2cWZuVVJkc2NYbXRTVHdu?=
 =?utf-8?B?WHRKTnRxcVhYVDRQVFBqQkZYV0lLZFN0bGRFbkcrVjdVK0gyWWdXQS9QUnlT?=
 =?utf-8?B?V3FRNFowYXk2Mjk4TFNBSFQ4TTQ4WloxckcvSDM2bHNSOWMyUzcwTWFXdGt6?=
 =?utf-8?B?M2trRlNLeWtJcVRNZnNTcFpySHFRaU1lRWRTMkVLdlprRXhyWjRsQ0VOSzE1?=
 =?utf-8?B?SXQ2SWhYRlY3MHYzOU01d3NPRUZFNUMxNnVzQ2QyRDVrVjBDWDBuY2dOTTN0?=
 =?utf-8?B?SDV3dXczdUlkZldpMVI1Q3ZqdUdCODZIWkZDR2xVb0xQbzMzZDNpVldaREY5?=
 =?utf-8?B?MGdjMWpNV2JZMDhHNS82VVZuS3p5MHhZeVJ5bkJOaFRNdmZWUTlnRWQ2Uy9m?=
 =?utf-8?B?KzdSQXU0Njd5WllBSjA5VHJkMlFrQ21uaFN3b293WXFaV0pMcThlVlZmR2FE?=
 =?utf-8?B?NU4zdjBlcXBhMVpzMlArcllINmVaL0RNU3ZMWkRaMkR1RDdjRXJJL0JhbUZz?=
 =?utf-8?B?dk9GNG02UHV2YWxOY00zV25pYlpwUEJoQldjRGtHREpkN2haQjNLRGpKbitV?=
 =?utf-8?B?Q25HU3BwZVBsMEZKSjdWMHJFWE1NOVR6blVPbUlRR01FdWR2bTNMaTJRK3Rq?=
 =?utf-8?B?MTJLUDJkcm5aWDJyTFlQNUhFTlRoUyszMnlXNm1GQ28yWHd3b2phK0Z1azlG?=
 =?utf-8?B?L3pEekZzcE1BMlpyVVMwTm1ZYXdGS25PUHFwQ3YvSzZBNExoNkN1UWVhOHdD?=
 =?utf-8?B?VHBseHd6MGV1WEtvMEpEcTdNUExVbnVRMFNvcjFSMWZEZEMzblU4SkpaaUJm?=
 =?utf-8?B?cE51NFo0ZTZaYUUrQXQzU0gwdDlBeDhXQlJiSURMcUs0Ti8xTk5aVlRaclIx?=
 =?utf-8?B?Sk4xTk4rd1RVYjljSCtGdW9jbmFsRmluZUZudHkxdENNcGRkakNUK1MxS3ZO?=
 =?utf-8?Q?TJYAi6cmA0Y=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aEVIci9jdi9nOTVWRVVHVHljVVVueXJvT1cxVlp4MURmdk5pbkdqOFhZUWFy?=
 =?utf-8?B?cUZuejhUSU5KYVBRUnNnM2ppdExwOGZ0blU5ZWo3cmJhUmxwR1hLSCs4aisw?=
 =?utf-8?B?NEtvb1lBTDJGZ2Rnd21aMnFOaWhPaDlmVkdQbmV3b2g4cUhOb016ZTlGWUc5?=
 =?utf-8?B?S2hyck1CcTFoRjd2Y0F2ZTE1YXpEWEgyMHpPN1dadWNibkt4WTFXUnR0cU4x?=
 =?utf-8?B?bjAyRmRtb202ek1JYmRZM0d0SHZHY1l4cHhETDV2ejdDUFVkbVJvZ0JReVZj?=
 =?utf-8?B?Ym1Dd0ZocnVoYnhuWjVFcHN2M3d2ZXVwWGNoSC9tYm9ZSlE3STJ6VzlRYVZH?=
 =?utf-8?B?K0RlT3o5THRKeVFjcWVoQzNQaHJVODFGNGJmYTB4T3k2MVozSHg1Ujd0cTE3?=
 =?utf-8?B?ZmxwWUFKaU1WZWFINjNYdzRHRW9TcXEvdHNkeFZibThhVENPb2ZrNTFjTUlU?=
 =?utf-8?B?WXJIblRBUENtMWZMcmpzWU9hZE5YbUYxS01vMUcrS2hrM2ZMWURiUUFPWjg5?=
 =?utf-8?B?RUw0WTNnWFFVZTBac0JWQnd0OTVTUzh6ckxNZUY2UmtFc0JPZUVkU25IUWJz?=
 =?utf-8?B?aVNjWDkxM2ZFejk3alZlNUtWc3Q5cGRUY1RqYUN3ZjkwOXFwdXlGK2ZIRHUx?=
 =?utf-8?B?MWlpTkRzTUVFanpNSFJJcmVIT0pGcDRCdVFYeXZDMERlV0h0aXUyaHU0V0pz?=
 =?utf-8?B?a2lNRGg5YWZURHlHdW5NQW8wU0dPM1VPVVpzRnJyL0l6K1lSamtsQWdTOUFL?=
 =?utf-8?B?cGVqVUFTMTRNcmEvMWF5bWhtZUI2V3FkUEN4UDlpbG8wTUtXdzczQm4yZno3?=
 =?utf-8?B?bkdjczA2QjRybmFpL2FDb080KzZPemYvOUQvcFBMUXRlN0JyR09zeExLOFZC?=
 =?utf-8?B?anpLME1sUi9TUXVPVG1FUEJMd0FFWkd3K0VscGdnN2MwNFRjMGJ6TFhTb3Qy?=
 =?utf-8?B?WlFlcXorZ1BYQ3AySkpzZ2k3NEZDN05kL1k5Nld6alJBVVlzRXY2VnpXVXM0?=
 =?utf-8?B?NFJuSExxSC9mQVpZT0tLU1FwZzBLSWlDTzJKc1hGdDlRaGtiSHJyUCsrZzVK?=
 =?utf-8?B?VmVKbGpVRC9rT1BvMVJpcUZrWXVrWFZsRzdkU2M4Q0FVd2tXQXJyNWxWRzJh?=
 =?utf-8?B?ZTBLemxiR2ZPUXo3SGN4QkhOYy9rTDBkTE5uQWxXUENvZkhMc0haMzM1T2l4?=
 =?utf-8?B?eVk2ZDdzcmFSclVWbGExY200ZjJWWHNIQ1FxY1ZjZitrSDd0aFQ1dXM0ZWlT?=
 =?utf-8?B?S0Q3b2ludEl6Nm01MmhydFhIZnVRU2lJRjk4dC8rY2JCc3dJRXg5NC80SktW?=
 =?utf-8?B?WXVJSm5Ka2ZCU1ZUK09GbFlUUncveThTNEZQSmR2MHFxK29BUjQvSDdLNFF1?=
 =?utf-8?B?d3RQOFhwcjBuRmpHekwvRndtUXZPY0RMcmxpdWQ3Qno2NFlrSlhEZDRiSDE0?=
 =?utf-8?B?bGhtUVdsT1FKZGY3TjVJanJ6eVovRUo2a3JFNVRwb1RHeDQ1VWVVdVplTzl6?=
 =?utf-8?B?NXQ2aDFlaXNqbnRBSWxyVVRqYjJRTmxpRjNSS0RpWEZMTCtnUmthVmZqK1NX?=
 =?utf-8?B?Q09NZCsrTkIvbXNnQ1phZkxCOTdJWnlmbG9jTE5GMzhmNTBpUVJ3NXF6ZDFH?=
 =?utf-8?B?TjdCdDY3SFBBNFZxVUx5eWkwQ3FlVDVPUjNhbE54Vkc1S2hHQVkrRWJ0N2FL?=
 =?utf-8?B?cFJJaGZHd3h3MnFYdjZCNmx0OW1rQ1BudFJtOTdIT3RtTHBZZHVWWnY2QmRI?=
 =?utf-8?B?Q2xDbzU5dmtCKzJiSVNvQVBqRmRMQTJML3c0aHk3MnZuUzErcVJQOHdKU0h0?=
 =?utf-8?B?c3pkcVZ4Y0QyeTRQUEEwSEpRUmZSemRPRmkvMWtmcE4zTFdIajRCYkcrOWEy?=
 =?utf-8?B?RExvSTRPbkFiVlpvQ3NEWm5YaXl6cm5lZkx6ZkhDYXMzK1kwTitJb1Q1NUNi?=
 =?utf-8?B?WllKeUJBQ0o0U1dQaEFleVhCQmdPUzk4NTcwYUFQK2lKeW5HMkNjTEZDWXFY?=
 =?utf-8?B?aUVxQWJkRjNUN2lpMGNqZEVmYUt2Ukl3T2VGd0tWUXZnclE5eHNUcWU0eFA0?=
 =?utf-8?B?ODJVZFVmSEs1Qm9oUmtjOTJraGZHdDBoQnFrN2FQZ3pTbDN5L25TMDFNaGxV?=
 =?utf-8?B?aEh6SHdRUTgvN2JubENPQkdjUzRsN2VCekhxUk5SMXhoMVQ4cEFMb2Z1THpX?=
 =?utf-8?B?MGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 80c632fe-47d8-4409-2033-08dd72c29964
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2025 15:17:08.1871 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x+ia9P0Ty8E7IM3wbMwGoZn41jHGtfqGy2eVWSEK2x2L3TTBcQDnosDe9clPWprbDFzXD3ogc8rg/OKkngSnQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7456
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


On 4/3/2025 13:05, Michal Wajdeczko wrote:
>
> On 03.04.2025 11:41, Lukasz Laguna wrote:
>> Prevent the VF from attempting to update the GuC reset policy when
>> changing the wedged mode, as this operation is not supported for VFs.
>>
>> Log a message to indicate that GuC may still cause engine reset even
>> with wedged_mode=2.
>>
>> Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_debugfs.c | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
>> index d0503959a8ed..062668d02365 100644
>> --- a/drivers/gpu/drm/xe/xe_debugfs.c
>> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
>> @@ -171,6 +171,11 @@ static ssize_t wedged_mode_set(struct file *f, const char __user *ubuf,
>>   
>>   	xe->wedged.mode = wedged_mode;
>>   
>> +	if (IS_SRIOV_VF(xe)) {
>> +		drm_info_once(&xe->drm, "VF can't change GuC's engine reset policy. GuC may still cause engine reset even with wedged_mode=2\n");
> never use drm_info_once() logs for places where multiple different
> devices can be reached, as then doing something similar on next device
> there will be no trace at all

ok

>
> also should we change xe->wedged.mode if it is N/A for VF?

We can't change engine reset policy, but I wouldn't say that wedged.mode 
is N/A for VFs.

We can still disable it (mode=0), or use mode=2 to easily wedge device 
with simple exec timeout in order to e.g. validate whether driver 
behavior in case of wedged device is correct (all IOCTLs are blocked 
until rebind).

> btw, what is our approach if someone on the PF already set some policy
> on GuC will not do engine reset? or it is n/a after a VF switch?

It's global policy - engine resets will be disabled for PF and VFs, and 
that's something I would expect.

>> +		return size;
> shouldn't we return -EPERM instead?

I returned size on purpose, as it's expected that VF is not able to 
change reset policy. Still, informed user that GuC may cause engine 
resets even in mode=2. I can add extra info, that if needed, engine 
resets needs to be disabled by PF.

>
>> +	}
>> +
>>   	xe_pm_runtime_get(xe);
>>   	for_each_gt(gt, xe, id) {
>>   		ret = xe_guc_ads_scheduler_policy_toggle_reset(&gt->uc.guc.ads);
