Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A976DCD8CB9
	for <intel-xe@archiver.kernel.org>; Wed, 10 Jun 2026 16:07:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 482EB10EAD9;
	Wed, 10 Jun 2026 16:07:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mcS6NpQ1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4122E10E4A6
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Jun 2026 16:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781107664; x=1812643664;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=b5HXGIDlrIFeZgMbwhjMET+i9GKF0kMO/S3hrrdqivg=;
 b=mcS6NpQ1EXqQxnRD36Nzbft55CdG70FfPBw4gYLgQQLUF43d64cM6CPa
 KTLFidZZ6Oun0auSUS2gX1ouUjKu9o5HwKAK+jZjcI88ve4P4cEFg/6sD
 1eGC33iFyUZCp2uBlURiHFBuXUc/8N4czNmjC103n9DuW6xEVXn1TLbt3
 DtR4+jDsHbKSEnyvudyIc/ypZCCqOqitPcBBwVfEVi9CttOSuYHOK3c6i
 6J+nyZD860nRJN5ibsk/hb5o+9IpgQu4Lyv0xxGoDT+A4vPIQfe7WEPGa
 ALMHu5jXnT+SaxvVbWPaWaPbEf3fhOQpoIUpHFCkQ/5nJE0TLphYvg0BW g==;
X-CSE-ConnectionGUID: 2phCr7f8RSyFfVHNpUnVdw==
X-CSE-MsgGUID: z0bhKarESrmMIOWFTUz5Rg==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="92225054"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; d="scan'208";a="92225054"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2026 09:07:44 -0700
X-CSE-ConnectionGUID: ziRZE1G9SwyNMvdnGb2f6g==
X-CSE-MsgGUID: nC29Pv21Qr22iq+K38/L8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; d="scan'208";a="246293446"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2026 09:07:43 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 10 Jun 2026 09:07:42 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 10 Jun 2026 09:07:42 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.38) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 10 Jun 2026 09:07:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y75CJnVt0yKJtShbOVEYk3fvHwLRZYuXlqMD2Du+t7RiZH93MSYOLeW1k/1Q52eLwLXS1idvH5mxN4RL51k4dPe7+1mL4/qYIzeOHbi0lbzxqOj5XY6cJRVCkd0O69ShKf/oTOvTM4249FbAjHSDFa/jMSrmDjf29WC+ieiVldQxML7hO7jh54GapzETs06HStWyFRKtX5u7EIDOQrh+dToz+xakUotgqbmmN4jQCAmcFzTuB2strbGuONan+YCD/8sfSc0L8MVjjUzKATrfmaZsAd9Uuby885IpXlPDK5HORnwBkXfvNMB7eCnC73ZFISa/ESnb97bkJZa2viF3QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iqIB+Dmr/3dXLRN7FOHNkElkViX25UbOC7vZNI+PbvY=;
 b=O09N1vXdt+oGoq1CGNgpLXJ/sqzrbAOH+UpYi5MQeKRwxPakTu7NZliDs0znoPbyZ6YWO6vBKax+yazhu+nfxPj5obPndZdEmORtMQKLGDwaxWXadpItFTjme9+tP+Cm9h4/xCv4MYgGAY4Vnz2kBwUDKVqTlYX7vmSctlt2/+nDm4fuD243YZ3jxSPQHTXqBaqqdIaD3HXii/tCbIAkeF3RLF7BmGA4H/FS/v9s63ELy3WJtjM1hs3LCAwOkWlnsNPuR6l8VH4HWnwQpikSqNMYilWWRvk2YTdSVckhdFuC2Xlm7eNRFfCmr7kSiFQY97NHqg1jzM2D0SYAw3b8ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH3PPF67C992ECC.namprd11.prod.outlook.com
 (2603:10b6:518:1::d28) by SA1PR11MB5874.namprd11.prod.outlook.com
 (2603:10b6:806:229::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Wed, 10 Jun
 2026 16:07:38 +0000
Received: from PH3PPF67C992ECC.namprd11.prod.outlook.com
 ([fe80::df23:9f79:b268:3bfe]) by PH3PPF67C992ECC.namprd11.prod.outlook.com
 ([fe80::df23:9f79:b268:3bfe%8]) with mapi id 15.21.0092.014; Wed, 10 Jun 2026
 16:07:38 +0000
Message-ID: <996399fd-df76-469c-b7fd-494c9485ecd1@intel.com>
Date: Wed, 10 Jun 2026 21:37:30 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe: fix job timeout recovery for unstarted jobs
 and kernel queues
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, <intel-xe@lists.freedesktop.org>
CC: Matthew Auld <matthew.auld@intel.com>, Matthew Brost
 <matthew.brost@intel.com>, Sanjay Yadav <sanjay.kumar.yadav@intel.com>
References: <20260610152548.404575-3-rodrigo.vivi@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20260610152548.404575-3-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0321.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:21a::19) To PH3PPF67C992ECC.namprd11.prod.outlook.com
 (2603:10b6:518:1::d28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH3PPF67C992ECC:EE_|SA1PR11MB5874:EE_
X-MS-Office365-Filtering-Correlation-Id: 8498c750-626d-4269-921a-08dec70a64a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|6133799003|18002099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: vzyumdQgOaYVUCkQKnKJproOQfSisZZdbPelihqDdOY6Q6j+PHz/jtUdIN9PyF877DMagaUjBmFMMIgshRdbkWpBZH9dYNDQ7vWe9CU2WsCo0+KS1ZBG/xnTMmTx1BOMYeJOhH9ZTymfX5xAnd+LhEZdAWO7TfRxt9scgx6Cof6I+LX/FPlR1vyHB3HpPnbG+68dyvJQKb4u7Peai4bdZglLMb4tKoLkBsl7Yqs9Gt8VtYZ4z2/Br7y1POi8quW91ZBoPBu9eGjsSVxPG03NMHy0HsGhUaVL1GTbI6/7qaz9LAHXtYHIZytAG9g+dTX7oIzDwRnz+tnbTWtukrN0fQxTC6k8VgO0g9Ehdy7SQglyWNDDaFucdg6a85MLIRNqkQcvp10F+ShaAYONEwNr8zaLuljmzyaDNcwkFJe5KH1puRkfgtShuGkSttJpDF1o7IsSnVQtex/rIpGNdWN6+MRnkcu5BeQhBCC/ZfuomTHOIyF7rBbR7CLxZmOTAUG0ew27Y7/oPrTm0VY0in2JWekhNjnPjZ2GEaqjk1evVpnLPCj+wzPo+ywH4EurDzM+3uWt6/U75QwtfpvrVDd/ILYALquC18KKnVOGQ4+MLnGQgv1ahssfZ8CU2B1RjLZcDo+5bRyK4V8RC1CnlwM7RKKedV2PxGaYwykYPy0UHxRoJCR96bNUt6KLhoh0npqp
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH3PPF67C992ECC.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(6133799003)(18002099003)(22082099003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?anBEdHJiVXVJMEZZYmZLQjZQMnplbTN6SzE4NWlxS016RG05angzNWtJK1lk?=
 =?utf-8?B?elM1VGJwZzVmWlJ6NmtIZDc3SjkyRVpDYUc0S0lTM2hJdVoxK1dteXoza0Z4?=
 =?utf-8?B?ODJFbUc1LzBWNGlqM0JpWmFLUVVsMjVycnEwYjNGU3I2Mk5aSzJ1OTBzckR6?=
 =?utf-8?B?TW9jcEFyUUQxTzAwZnV0K3A5SzdHTzc2dGtBTk9hZkV1OHdTUnA4bWc0UHNm?=
 =?utf-8?B?bjRuVXFyejl6Mlc5MzQ5NEFQZUZQY2JvR3VNNVJkYWVhVk93WHdvWENuWGc3?=
 =?utf-8?B?R0ZseHR1YjZFVFhzK2JRcnBtZm0xUUdkc1Q3Y0FSeEo2OGJXL3VhMFZPOEN4?=
 =?utf-8?B?Q3dlMjdRdnRpclF6bm1WVnZuYU9Uamgyb0REaGFRNFQ4aXhsUlZmZ00wczBC?=
 =?utf-8?B?NWg2ZE1tU0M2TzcrakVoQzhReENWczlKRzhZMmRnQVd2R0hPVnk2QWVWdm9Q?=
 =?utf-8?B?c1J1aFpGUFkzVDcyR2VOZkkxRUQ5czJYSGtacHBaMDllTnlLREs5cnMyWFVt?=
 =?utf-8?B?M25RMFhmZ3BnUkNhcHlyc2tuWCtaVWMzVCtYdzFNemNBME9zWjVjeHN0UHZJ?=
 =?utf-8?B?YS9TMCtraE1BWG9yVmhPdDBRNER2cEswYVhkQzk0OHRybTFSRTVIWHRadTJs?=
 =?utf-8?B?dWVRK0NGMjlKVzJJT29OZkhyK3h2TGgrMFc2encyTHhPSDNTd1Byd1E0SFpj?=
 =?utf-8?B?MkVETHo4eW9xOXhSVTAvNERDWkpwbXA3SUFXbGJZb3BQNVl6UzEySDAzc2pV?=
 =?utf-8?B?L3VPakNhandYNGROc1hlSEVVNjJORDYrNkd4S2ErbEhST2VSSHJyUzIyaTdX?=
 =?utf-8?B?OFUrZ3RsMzd0RytJY1V6dnA1Z2U4dGpVNDNxblVuVW9XUTBVMnEwem44Vm1R?=
 =?utf-8?B?em9Nd0pTQ0dNbC9GK3lScStrMG0vWHN3MmZRS2kzS0tMY0duR2pOUW5LdWtI?=
 =?utf-8?B?OE13ellwNGVTVFk3NzlzNTVIdkducHdIVVdFaUtheWtNckVIYUlyekl5RVZI?=
 =?utf-8?B?TTBJczVnTVdaZFNWUUFqdlI4Z3cyYTRxTlR6byttbVdaVTFNa3AwaDZUR2VI?=
 =?utf-8?B?bkN4QWFsVzdyc1JDd0ZRaDBhWDRqZnhFSnFqOEsxaUhkRmllS3piNHJMZC9H?=
 =?utf-8?B?LzJYLzFBT0cxZnllZ2ZUem5tV3JEOFNFc2tMVlh0SVVpVUlTZ2wxOUZMNy91?=
 =?utf-8?B?M3FSM2JIaU1pM1JrQ21mMXZsazlaNlNxR1k2MXB6Qjd3ekMzZUF0TU01Ti80?=
 =?utf-8?B?ZjcrSjdwVlJ0UzdhbG1JVkpMUzFrS2VRMGpReGNjZnhMUGVVZU50cmhWeUVk?=
 =?utf-8?B?bEpCaHNDaGtFNHlXZ1dNRkMwenFWd01pMW14cHdhc0ZQWHJ5b0E3YkFvWjBi?=
 =?utf-8?B?VGs2cnBCZUdCcTJQRUUvUHlWNEhCOGF6L0lpYjUyK204eHVzdmkzTHl2eHZN?=
 =?utf-8?B?SnlIcm1BMHRGRkZma2JlUkh6TVd0dVh5TXFEYnozVVdKRnIydytkb0MxenhE?=
 =?utf-8?B?cU1EQWxqLzUzcnNKNHNTTTJsSGVscDM1aHJIZzRIYmtyQW5SV0tVeDY3R21t?=
 =?utf-8?B?MkF5M3JyTkVkUkpNQUtzVzMxRFI5MmtWZ05sZ01iRWFIMjROZFpTZ0VWeGZh?=
 =?utf-8?B?YlMyb0FJSStGMnJxQURXMTViY2dLSDh3SE9GVkdvM1hwakxScUprbGRFbC94?=
 =?utf-8?B?cWZESmpNbWJHOUsxeHU5K0NYelgzVDFQOXdqZDl2SyswYTlOd2VwSEoyREM1?=
 =?utf-8?B?RGhncENkdW1Qd3pJYTVqVEtBZWIrY1pGVHVQWXhRQXRpMmVFaXo4R0F3V2tk?=
 =?utf-8?B?OUczSVkyVitPZDl5YjZzS3FSUGhYbUZVbEtYQlpPMENrcEpUcXRITkc1aUVu?=
 =?utf-8?B?cENNaUJoY3ZCSmpKUndhUUNXNHFNaUIvQ2RoM3AzMGlSUm9qbHM1SFVlUGYr?=
 =?utf-8?B?eU5nbGhERjgxUlB3YTJRbWFnU1orUVVaSXpSOG4wZEFIeFN4ZlA4a3hxNmtH?=
 =?utf-8?B?YXNxK05wSWxmYlBqZWpZdXJKQWFRTncvc3BCMFZPUXFsSzRrMnNXaFFFbFl3?=
 =?utf-8?B?eWI4QUV2OGFJcVptbFJNQ3NMMURKUzRlTmV1aEZlMFhGdnZFY0crMngrZmla?=
 =?utf-8?B?L2xpTEFkM01yaU9hQU5HZmJnWm51aGRqZjBiREhuMUFmcFFvOWlmQnM1NUFp?=
 =?utf-8?B?QW45Yk5NVjhaVWx6eE1TTTl2dzBObWFxcVVGYkJXOXJIS2ZjOHgyUW92enJa?=
 =?utf-8?B?Qkk5TEM1NlpCL1U4aDdSY2wrRkxZQmFhZWVYSEFQTXJOdnFuUHk1U2EvTGts?=
 =?utf-8?B?VitNOWhoeUZXd2p6OHlvd3VEY3B2ZlNmZ1Y1UzNERXJYV1kybmZaQmNRUlBG?=
 =?utf-8?Q?qzrfRmJoc0tN5sbg=3D?=
X-Exchange-RoutingPolicyChecked: rhTrGQ1BUbUiEn8mYcMcoCdClEUkNNF/v31iiyKrsGc8l+WiLm0EVzdjjYNkE2420OLkatPQ5t7txKUzB0QiIV7T+j/Qcj5eBcP3JvYiznFI8OF//We8QvYHf4d9+EZSvVxwymDnW+04ECym49slQJ5UT5H+UdMgWYlJXpjw8sUPUB1V3ufluUaWCtbcyRP89p9G7Jwq6+oku6qSJyLlxhzqgfvpB/YXtH91Ufk43bGU60//xIuv6tiLj4iQRXWD5I8a5NWkU4iZV7sUQa+Jw7Ok5DvZtY+bRZTsF7iHlLthc2Zi3OQwPltgbApy4hk71qRzJU5A8k3L0HmF1mTxVg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8498c750-626d-4269-921a-08dec70a64a9
X-MS-Exchange-CrossTenant-AuthSource: PH3PPF67C992ECC.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 16:07:38.6899 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y09YURQCtG2zCkx1B3FjbxmZDaI56aHU47dJMGN1koQa2CtQhLy9Joh4vgsXTw1InF58hSJtmTeVXLGO6U5Vwqb1r1JkQMM5veYgRDe36oE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5874
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



On 10-06-2026 20:55, Rodrigo Vivi wrote:
> A job that GuC never scheduled (never started) indicates a GuC
> scheduling failure; previously such jobs were silently errored out
> instead of triggering a GT reset to recover. Trigger a GT reset and
> resubmit them, but only when the queue was not already killed or banned:
> an unstarted job on an already banned queue is the ban working as
> intended and must neither clear the ban nor kick off a reset, otherwise
> a banned userspace queue could be resurrected and spam GT resets.
> 
> Kernel queues are always recovered this way and wedge the device once
> recovery attempts are exhausted, since kernel work must not silently
> fail. A started job that times out on a userspace VM bind queue stays
> banned rather than being reset and retried.
> 
> The queue is banned early in the timeout handler to signal the G2H
> scheduling-done handler so it wakes the disable-scheduling waiter;
> without it the waiter sleeps the full 5s timeout. When a reset is
> warranted the ban is cleared before rearming so that
> guc_exec_queue_start() can resubmit jobs after the GT reset - a
> still-banned queue would block resubmission and cause an infinite TDR
> loop. The already-banned case is gated out before this point via
> skip_timeout_check, so it is unaffected.
> 
> v2: (Himal) Do it for any queue type, not just kernel/migration
> v3: - (Sashiko and Sanjay): don't clear the ban / GT reset for already
>        killed/banned queues on unstarted-job timeout
>      - Update commit message
>      - (Matt) Add Fixes tag
> 
> Fixes: fe05cee4d953 ("drm/xe: Don't short circuit TDR on jobs not started")
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Assisted-by: GitHub-Copilot:claude-sonnet-4.6
> Assisted-by: GitHub-Copilot:claude-opus-4.8
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_guc_submit.c | 49 +++++++++++++++++++++---------
>   1 file changed, 35 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index b29cc08e6291..e82018445b7c 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -157,6 +157,11 @@ static void set_exec_queue_banned(struct xe_exec_queue *q)
>   	atomic_or(EXEC_QUEUE_STATE_BANNED, &q->guc->state);
>   }
>   
> +static void clear_exec_queue_banned(struct xe_exec_queue *q)
> +{
> +	atomic_andnot(EXEC_QUEUE_STATE_BANNED, &q->guc->state);
> +}
> +
>   static bool exec_queue_suspended(struct xe_exec_queue *q)
>   {
>   	return atomic_read(&q->guc->state) & EXEC_QUEUE_STATE_SUSPENDED;
> @@ -1363,7 +1368,8 @@ static bool check_timeout(struct xe_exec_queue *q, struct xe_sched_job *job)
>   			   xe_sched_job_seqno(job), xe_sched_job_lrc_seqno(job),
>   			   q->guc->id);
>   
> -		return xe_sched_invalidate_job(job, 2);
> +		/* GuC never scheduled this job - let the caller trigger a GT reset. */
> +		return true;
>   	}
>   
>   	ctx_timestamp = lower_32_bits(xe_lrc_timestamp(q->lrc[0]));
> @@ -1460,6 +1466,21 @@ static void disable_scheduling(struct xe_exec_queue *q, bool immediate)
>   			       G2H_LEN_DW_SCHED_CONTEXT_MODE_SET, 1);
>   }
>   
> +/*
> + * Recover via GT reset for a kernel queue, or for a GuC scheduling failure (job
> + * never started) on a queue that was not already killed or banned. An already
> + * banned queue must stay banned, so its unstarted jobs do not clear the ban or
> + * trigger a reset.
> + */
> +static bool timeout_needs_gt_reset(struct xe_exec_queue *q, struct xe_sched_job *job,
> +				   bool skip_timeout_check)
> +{
> +	if (q->flags & EXEC_QUEUE_FLAG_KERNEL)
> +		return true;
> +
> +	return !skip_timeout_check && !xe_sched_job_started(job);

Looks good.

Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

> +}
> +
>   static enum drm_gpu_sched_stat
>   guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>   {
> @@ -1608,19 +1629,19 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>   			       xe_sched_job_seqno(job), xe_sched_job_lrc_seqno(job),
>   			       q->guc->id, q->flags);
>   
> -	/*
> -	 * Kernel jobs should never fail, nor should VM jobs if they do
> -	 * somethings has gone wrong and the GT needs a reset
> -	 */
> -	xe_gt_WARN(q->gt, q->flags & EXEC_QUEUE_FLAG_KERNEL,
> -		   "Kernel-submitted job timed out\n");
> -	xe_gt_WARN(q->gt, q->flags & EXEC_QUEUE_FLAG_VM && !exec_queue_killed(q),
> -		   "VM job timed out on non-killed execqueue\n");
> -	if (!wedged && (q->flags & EXEC_QUEUE_FLAG_KERNEL ||
> -			(q->flags & EXEC_QUEUE_FLAG_VM && !exec_queue_killed(q)))) {
> -		if (!xe_sched_invalidate_job(job, 2)) {
> -			xe_gt_reset_async(q->gt);
> -			goto rearm;
> +	if (!wedged) {
> +		if (timeout_needs_gt_reset(q, job, skip_timeout_check)) {
> +			if (!xe_sched_invalidate_job(job, 2)) {
> +				clear_exec_queue_banned(q);
> +				xe_gt_reset_async(q->gt);
> +				goto rearm;
> +			}
> +			if (q->flags & EXEC_QUEUE_FLAG_KERNEL) {
> +				xe_gt_WARN(q->gt, true, "Kernel-submitted job timed out\n");
> +				xe_device_declare_wedged(gt_to_xe(q->gt));
> +			}
> +		} else if (q->flags & EXEC_QUEUE_FLAG_VM && !exec_queue_killed(q)) {
> +			xe_gt_WARN(q->gt, true, "VM job timed out on non-killed execqueue\n");
>   		}
>   	}
>   

