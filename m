Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65083C53200
	for <intel-xe@archiver.kernel.org>; Wed, 29 Jul 2026 19:05:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF9D110E069;
	Wed, 29 Jul 2026 19:05:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bhf6AdHa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FCBE10E069
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Jul 2026 19:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785351923; x=1816887923;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=c0KTPl7zEzji4yJz9vAUi0w8qc0u9GMeatz8258JUcc=;
 b=bhf6AdHataqartGz1s2V7zY+etjDk/Ty9sq8cl+CtG5rHQsfV0wX1cEh
 ZEkedOr48XF/igNl4k8Hcbfml9e5isJoJerZFt7yD91UgcIYJf4dOK0Es
 gIVsQ9tI+6J/ZDOpgewwrIQXHxPiJ4thPtuHBfXBDU8eBKF9WR+IWTt+B
 dzd6DvmmT/vZxa69v6LAMBcnBF+fWOSQxo6q/CKzUL86FH9WhU99/rQV2
 QHDy1Sw/Snj5k818p6UUn9f6ZotwrqX5FUGUJug7ioOh0/7VFmrpleF93
 Hvt3ekttmF0oU7AKD/kgXc0P4i47lKfE/ehspqH9vjscvUrCpGlnVL5MR A==;
X-CSE-ConnectionGUID: 1gAMjCa/SFCCSMfEOvAWGQ==
X-CSE-MsgGUID: ITrAx2IiSi6e1z8n1+W6rQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="85983498"
X-IronPort-AV: E=Sophos;i="6.25,193,1779174000"; d="scan'208";a="85983498"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 12:05:22 -0700
X-CSE-ConnectionGUID: b83D9U2KSzSWQiaSTDNABg==
X-CSE-MsgGUID: XaMdxUeNRAed6bPsqsFhVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,193,1779174000"; d="scan'208";a="253757820"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 12:05:17 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 29 Jul 2026 12:05:16 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 29 Jul 2026 12:05:16 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.55) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 29 Jul 2026 12:05:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PdQS8iwrE660bdnRuaLN9nsZ67AvDwA5j1zI1Nk78uuflhleH5Jitpbb7QSHc0LKCDd1U+g6w4eKwhahHo8QE6UnNrsxHGZQan2JMV/UoOLCaM6n8z6U8QUNMtq8D1UqTj8vOzd+fN49WP3JAfqYqtQFwM7RPEObyPDrk/SvfMyIubxbrfmStPXZ0vqxJeW4H9Sgo3u+Ff2HtP083aKGtm59ZygLTLXO84QeW+B/zEVsX+IqApeLGBZXQmhu0otBLOaJHXHigS7XeCEJ41S8UzAtLg05VHdVoHaP143jwcH4q+VuzzOeh5nTxLz307A6d3rakB9BZ2MkwuUekdXtXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f2ybvusCuId0dszRBf50++k5OUjBGrAjwbmeBfZGp0o=;
 b=KcSj/m3ll+K/tZwS4ZGpNzv5KeNGFnMj4Sj1sma6pkBk8kjiStAa7xNGceFY5mMlx1rPTbueYyZSFNM2lo8jnGdcAgVMS7opeai7n+0Sc+tJBNG1r43e/t6bzO2NO9Reao6TZeqkMZ4rDATQ7eyWxcDvfK/D+CyYJg5tPnwh/s+sAWzNFjf7Jq/BxGkWWKANIzi93TutlV2YyMG2+b35+Ye+z9XcpBz3ptj/JRZNwlCDomsdh0f3YLaTDXqPg7eN+C0637lqrQKtlpDTiqPduCRz5/wTYnAOw/X7Meh4VZm1r7qVxfLfA+gPql59o+NegTfunt9Jr7gQ2PVTJ/fmbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4979.namprd11.prod.outlook.com (2603:10b6:303:99::16)
 by SA0PR11MB4733.namprd11.prod.outlook.com (2603:10b6:806:9a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.13; Wed, 29 Jul
 2026 19:05:15 +0000
Received: from CO1PR11MB4979.namprd11.prod.outlook.com
 ([fe80::ed0a:e4ab:fde6:edcc]) by CO1PR11MB4979.namprd11.prod.outlook.com
 ([fe80::ed0a:e4ab:fde6:edcc%2]) with mapi id 15.21.0270.009; Wed, 29 Jul 2026
 19:05:14 +0000
Message-ID: <11b5ae5e-9dff-4cd8-afd7-0ee9779e0d58@intel.com>
Date: Wed, 29 Jul 2026 12:05:13 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm/xe/pxp: add termination on resume
To: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "Filipchuk, Julia"
 <julia.filipchuk@intel.com>
References: <20260720222757.3876338-2-daniele.ceraolospurio@intel.com>
 <022017a6c1e93847a36867b4fbec508da15711a5.camel@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <022017a6c1e93847a36867b4fbec508da15711a5.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0228.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::23) To CO1PR11MB4979.namprd11.prod.outlook.com
 (2603:10b6:303:99::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4979:EE_|SA0PR11MB4733:EE_
X-MS-Office365-Filtering-Correlation-Id: a9c031cc-6d18-4326-17c5-08deeda4522c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|1800799024|376014|6133799003|4143699003|56012099006|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: y5y/gjK8VYfbb+ioKiFb8eip/6v2jx+2Kk6/1TD0zo/QE/PK6ps6aGuCK+3jVmklYG3qC2s7ddwZiLjQ4auWfIyq4NR+EQO/LkXlbIknB+PqREV8LJQrLe1n0LP3P7OvXXkNx1nUcL76JMSekb6nL/H0EoWk6W22VHdH43lopldV6qFKNEMuPnAg2SoInxw7xOKaQjWlGWPEGaTlYiHZZuurDpDif2nujQ8PZRmrq1jr2OgFh+wYsyI2DEjroh+mozYj6sapQ1X/lDFGdc6UOPuLzcvA+athwrewXi4ohJ3iLW0LN1UUiinG3aVW6W+EmQmlGecpEubC/624O6SgdqYtwvh03Gt9dzG0e21NxFI2Z6MWlneSY6C9pl22a8Ave3ppt3UCiI44YzdcYtKwBVQ+PXR67gA0NfC9kW0MNIlyfHdD4N/0nn3+Z9VY4I++UgTFUE8ecb+/TMboHSj57FKgkerzJen0ghozX7I1ZJyrfrSEbQHhYs4BzNY3cRFrYE96JGNzWjqrYwctqTsK8N1hHhX0wXP9qakF+O6V78/lZPObXLOLZ/AUmmsxiG3HeeMfDbqYATb9/EzErdU07W2OcIqOXUQW7FEW5SJ75pr/1cvT6e6oKGNxwS42Dx4Vwu/Xg+cdrGQhJIi5Mpi2Vv2rlcduHNneHO/4K5pIY1g=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(6133799003)(4143699003)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b21MSnFNbDFKQk1Ob2diTTNLaUZIZlM4QTNCbi81cHROZS9tR3FETTlMWFQz?=
 =?utf-8?B?VFJuTXNnZ0ZONVdxeTBDeng0YkowYXVUVUJrQncycEpIU3ZGL1NCVXlma3VR?=
 =?utf-8?B?Qmc2Y1c0T1FyUTJaOHZoRFk3bGN1OGFmLzhEOHg1TU43V0NrVGMzMmJBWEcx?=
 =?utf-8?B?R1ZMMTI1Uy9yZTFnUS8xS2JIb3lDN2ViYk1qaENkTkxoWmJQWHpiQzhIWkd4?=
 =?utf-8?B?N1lPblowVzBEWWFsN3FqeThUUWthTlc5c2QxWjZodDVIeDJZQU5nN1JiRW5i?=
 =?utf-8?B?bERTckNtZ3ptNTZydXpzclVKSFlqUFZFb09MMW8xcldzdDAvcUdEcXY2NFdB?=
 =?utf-8?B?cDBnREo4OHFodUFnNVlOREJWTDJtWnlFOE1ibFVVZ0JOalp6TFA1Ykw5ZjRv?=
 =?utf-8?B?V3B4QjVYVnVPaVAxN1NpZllpTG9wT2YybDNBMlloQUVoQ2JIOUNOcWNhNmNq?=
 =?utf-8?B?M01TVG45dTJaUG85N0EvR29vNEVveGdGNnRWbElEd1l1Yi9KUUZ4cDNRUUN1?=
 =?utf-8?B?cm1BRXhCVks1NDJHdzF1Z1Zxays0ZzFHNVZQS2JHeVBDSXM3cTh1VzFnVS9N?=
 =?utf-8?B?d1lmT2h4RHFKZGdsTUpITHUyRUNSTGtVQklmdXZHcDdROVE2TmZCZStBTmFO?=
 =?utf-8?B?bVhZeVRWZzFrbWNaU3IxVHJKRHdteEw1MGJvUXA0TmNNdWczcy9BaTE3NE1n?=
 =?utf-8?B?OGRpZFF3SG8vNmlVRU02RkRrSEZuLzNKc09haW5aUHNadUJ4R0tISXVBQTZF?=
 =?utf-8?B?YVdJZDVoRHh2OVRIekNFSksyMklCNmg0OU8yWnZRTkNpK2Z6V0s4bVJuSnA1?=
 =?utf-8?B?UW9LaUpMWHNMVzRtakJYZkJSUFRpTXQyMHREZGczYjhyZk9ZaUtFSTliL2dk?=
 =?utf-8?B?Slp0Y3VyMFNlSU1Wa08xQmlaaDh2ZzUzd0RxZFc2MWd2dmE5SlJFYUZYdjRr?=
 =?utf-8?B?RHlRaTNmbERURldsWUR4ZTJNOHBKYkNNcXlYQmZ5YzJId1h5MU1vYjhBWGlX?=
 =?utf-8?B?MmZUcWc0Yi9Xc1lkY0xDREtQQ3hhdFFCZ1JvYTV3ZmxpZlhobElHenIrT0pn?=
 =?utf-8?B?WjNWelUxem5OSXp2eG0zV01xbEsrVkZuNmJvUTJhTkhTMU5KMHhQOS84OGtz?=
 =?utf-8?B?dW0rQW9nMEF0a2Nwc0FrWDZ6eXpiTEVxTGhHa0FlU3NBc0VMTTRqbjREcFJx?=
 =?utf-8?B?eTdYbWN2a0NUVTFSREhPZ1Y0cTRXWitNUmJjNnJudkQ4ZEgveExXSGJFTXVL?=
 =?utf-8?B?THl2bU1IYllEMU1CQjhxS2lZallzcytwYXpOd2FSK0Q5WEZOUlNYalI5UWtr?=
 =?utf-8?B?NGhTU1JPaDU3Qk9jUHNLYVFtOVB2MGI3UjVzRE9pcVNwb1ppWmh1SDdxb3c1?=
 =?utf-8?B?a2NydlM5S2tudnRVOGlSaGtKTllwOFVvL1lDMU5OMHRpaHhuaU5jc2VrOGtI?=
 =?utf-8?B?SmxibE0vS1NjdUpydEJQQUxVK2dld3Zva2wvcnJTd3BTL2J0UzM0NnZHMU5z?=
 =?utf-8?B?NU5IWnpNdVo1OE9takV1RzVkNGkrWTZibzN0Wm5INkFsT1JZOVlDbnNEQkVp?=
 =?utf-8?B?UjBOWERxTUZVRjB6TkhLRW15YUhLdHZxSVhWem9YYlJXU1JLaEZUN0xVTlB5?=
 =?utf-8?B?MytXODdtT2hmNHJWSk9MRDRSZjVqTFZtWVVuaE5BcW1ibHlFdjE4dFdBRWhT?=
 =?utf-8?B?Q3loN2hVRlJpYkVqdVp3WXVaekR5YXo1S2Z0akJKU0xydkhhbTV5WFlLY21B?=
 =?utf-8?B?UzdrZGlYOVViUTl4ZkZSRS93Tkd0VFgrYUExM3k5Uk00K0xNYWY0QW05WkhP?=
 =?utf-8?B?Q0ZSaStNb0VZM3VoVnpKenZUYnB6VzJucm1HTHhZSGp0a1J5bkZmY3c4aEhi?=
 =?utf-8?B?M0RuV0RBNnNXRFQ3NExYL0dQWVEyekxRenBNbnZsaWZDNW9UTVBYdWpMc3hO?=
 =?utf-8?B?eVg3c0lHZCtmY1FoTWZacnhxOVlLMWdoOFoxQUNRcUlpQlF6UEVXZ0ViU3hO?=
 =?utf-8?B?ajl6d3hDcHZyMWhIM0haZWZBbHEycFd3VE5VOE9wK0d4akZ3YTZHNEkxai9z?=
 =?utf-8?B?OSt4aVk5bUY2MG5PUW5lVCthdllrZ2E5ZzJzby8vcnIraWx2MDFWaUxoTDlk?=
 =?utf-8?B?NW94Vk1EK3lpNUpQQlFLazlsMHdEYmpnRFVHRHhWOThtUHJOV21QYzhsWjVU?=
 =?utf-8?B?dTMzaWRaS2ZQVlZubEpmdCszUVlleU03R1hVMnFiMUdVQ2tBd2dRaVZTcStC?=
 =?utf-8?B?L2didjluOCsrWXdxWlJ3UHNGazltcjVFRlMya0Juamc3UGRtUXNuWU1jUXRT?=
 =?utf-8?B?K1hzRlRPcEhMVjNzclp5NSt0eVlTb3dnMHlBM2t1ZVBiWXJvaUxwS3k5TzhB?=
 =?utf-8?Q?3TUTXYiqvUajod7E=3D?=
X-Exchange-RoutingPolicyChecked: X4vkZEvpCtQpaZNNUQF9zE0kbT8nNn7CdXUHiD0PAm3QQ8GOMArJ3Y75wBkst9qFQdtsuNnipKz+uEmfCFY/24HoRiWgId8MyRTZmV3bxK3wSWkMaaedpA+YUY0P3EQdFG8TC1g+tjiPhlGK+ameMGYUl/m6gVgjP3TPxwDJS6dMBgx5sJuS0mFPXuPS6/0mDpOtqNhcMCnTijucBxB6gdiMHwbBRSTBEN+CbqfrS68PpSGYoVGhTKYNNfGN48Yyx9TxMolx7FWlMFKjGXyZrKFhB08uXCeJJpnUNnybg/CR4xtVDOK1lVX9r8UmAOVvO9h132JFuLxPVMETxT9MoA==
X-MS-Exchange-CrossTenant-Network-Message-Id: a9c031cc-6d18-4326-17c5-08deeda4522c
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 19:05:14.9104 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rXy+gGMZK3NQRZSclZISuBJv6rtpmcPfDFObziaRwAcWW9cTJc/apHryPZ2LJbN/mdNo9Rhwh6N079p4iSxUWn2SJ5OZcYorAtBdB+VIygU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4733
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



On 7/28/2026 5:01 PM, Teres Alexis, Alan Previn wrote:
> On Mon, 2026-07-20 at 15:27 -0700, Daniele Ceraolo Spurio wrote:
>> Suspend/resume causes the PXP keys to become invalid, but doesn't
>> actually kill the session. The driver also doesn't explicitly kill and
>> re-start the session until a new PXP request comes in, which means that
>> the "zombie" session can potentially stick around if there are no new
>> requests from userspace. While this is not an issue for PXP, HDCP has a
>> new behavior starting on PTL where a communication is sent to GSC if a
>> session is active at suspend time (even if it doesn't have a valid key),
>> which can lead to delays in the suspend flow if we suspend while the
>> zombie session is still active.
>> To avoid this, we can trigger a termination on resume and kill the
>> zombie session immediately, instead of delaying the termination to the
>>
> [snip]
>> diff --git a/drivers/gpu/drm/xe/xe_pxp.c b/drivers/gpu/drm/xe/xe_pxp.c
>> index fea3d8ceeddb..2fef274a585e 100644
>> --- a/drivers/gpu/drm/xe/xe_pxp.c
>> +++ b/drivers/gpu/drm/xe/xe_pxp.c
>> @@ -8,6 +8,8 @@
>>   #include <drm/drm_managed.h>
>>   #include <uapi/drm/xe_drm.h>
>>   
>> +#include <linux/device.h>
>> +
>>   #include "xe_bo.h"
>>   #include "xe_bo_types.h"
>>   #include "xe_device_types.h"
>> @@ -174,16 +176,9 @@ static void mark_termination_in_progress(struct xe_pxp *pxp)
>>    pxp->status = XE_PXP_TERMINATION_IN_PROGRESS;
>>   }
>>   
>> -static void pxp_terminate(struct xe_pxp *pxp)
>> +static bool pxp_prep_for_termination(struct xe_pxp *pxp)
>>   {
>> - int ret = 0;
>> - struct xe_device *xe = pxp->xe;
>> -
>> - if (!wait_for_completion_timeout(&pxp->activation,
>> - msecs_to_jiffies(PXP_ACTIVATION_TIMEOUT_MS)))
>> - drm_err(&xe->drm, "failed to wait for PXP start before termination\n");
>> -
>> - mutex_lock(&pxp->mutex);
>> + lockdep_assert_held(&pxp->mutex);
>>   
>>    if (pxp->status == XE_PXP_ACTIVE)
>>    pxp->key_instance++;
>> @@ -192,10 +187,8 @@ static void pxp_terminate(struct xe_pxp *pxp)
>>    * we'll mark the status as needing termination on resume, so no need to
>>    * emit a termination now.
>>    */
>> - if (pxp->status == XE_PXP_SUSPENDED) {
>> - mutex_unlock(&pxp->mutex);
>> - return;
>> - }
>> + if (pxp->status == XE_PXP_SUSPENDED)
>> + return false;
> alan: in xe_pxp_pm_resume, we assert "pxp->status == XE_PXP_SUSPENDED" before calling
> prep_for_termination... this assertion will mostly be true (i.e. we did successfully

I then also change the state to XE_PXP_NEEDS_TERMINATION before calling 
prep_for_termination, so for the resume case that if condition is always 
false.

> go into suspend before executing the resume code). In that case, above check will always
> return false (i.e. the worker will not get fired). i am only guessing, but perhaps
> above check (from original pxp_terminate) was meant to deal with the case of an incoming
> termination IRQ while we are in the midst of suspending? (i.e. we just defer the termination
> code). But for terminate-prep, i guess we should not check this? would just removing this work
> fine since this patch adds "PXP_TERMINATION_REQUEST_ON_RESUME" into pxp->events.pending
> and you handle this in the event-worker now (i.e. if it is a HW IRQ, u drop it if we
> just started suspending and proceed with the new suspend-prep->resume-actual termination.

I could split the check out from the prep_for_termination and only have 
in the !hw_only path in the termination worker, but I liked the idea of 
having all the checks in the same place, even if one of them is 
meaningless for the resume case.

Daniele

> [snip]
>
>

