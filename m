Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDA21C55172
	for <intel-xe@archiver.kernel.org>; Tue,  4 Aug 2026 08:31:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F32710E8F5;
	Tue,  4 Aug 2026 08:31:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fEYHV6Rs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D833310E90A
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Aug 2026 08:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785832314; x=1817368314;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=KNlZkjLI/Qr7Mc/LKDdCdkfUgFwMiIYX3wvbDCKyMfE=;
 b=fEYHV6RsIu96GzxPEQnavK3hSl1vX0ODKpoY39HekY+6A0k7+/oZHjfe
 41lTKz2WvdXAFbSMVOc4dvNIB0rtx43Mha7hrgtJWirzpYhd9VVSqlvrW
 iMMnciGOFhqsq2IY1oYzS0iczsVvkU2+8ODUqtGIR/hex4rbt5TGJe9v5
 vXXlBw6Dc6WV14Vu7MSxwpBIAMjVeLpiCqfgp9ruZJPtTLvsBQ0D2L/wx
 2yC/U13BzlwyHbo/6tn2t/7QvoRhJC5AM+k0D+Ccy4qdBMNQuJPW+RtLq
 qbgBQwjjbO5OyX2RwUoAcJCYh73aezosIBhQsM5JQBUGsyaK7GvDIdsIk A==;
X-CSE-ConnectionGUID: 3vTD2c/iQcyOE65dkXHFpw==
X-CSE-MsgGUID: 3xdPIRodRLGznpRY/8Rhng==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="103916171"
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; d="scan'208";a="103916171"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2026 01:31:49 -0700
X-CSE-ConnectionGUID: iyDKH/1GTq+fDqd0KBXhkQ==
X-CSE-MsgGUID: dI9CGfmkToCj0p9Fbrj51w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; d="scan'208";a="255154089"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2026 01:31:33 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 4 Aug 2026 01:31:32 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 4 Aug 2026 01:31:32 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.14) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 4 Aug 2026 01:31:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iOT+RHER8yGC7uRPXr0sJa0kYEp5Z4Lk5j3nEW5AGVBT2q3OmMclHPO+c4TYL2nvJ3E0o6PDGrw/79mMRbGiAJm/8BThBKu10IwmPCKtZOaxnQtQL7moqwzLHSCSqV+2QDrqvx+VVCrd6n4syQIamewjd7eZ/D9DYQsP23VBuIgeImWZbjj5J1jEpZ/aiHv4wANd8PMrhTPUrRMsWgbwJmiA9VHTxVC1f/t3yDI+1pnHse1y5ws3X8sD5LJMvTTb2fsprzmnAzmH2kZ1OQlW96IlKbJegXofRO6Ahz0TjWJuXwNYGYWcwWxIQen6rP67xPpopITHpRKeUoXVQFve+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PTLx4Wfe0Sp6qAE82UxxeHcd7vtoW9tS//d5ZQg7Ukc=;
 b=oJfCfaWq+ZYZhYexkefGfKsO+NYU03mIRWIz2BiZ22etq9zOOay/2qUCFrazMUxREL/+QiDgsWlOt813FYQ3cax1AOAlKYK+BZJy0YfpR3+qFSzpp4jWYx70wURayCAzttE54oalXl2P36/Qa1NhTyFG+8Om8n3qKRHYhyS4NnD+LOsjGnzn9PBY413S/QckFmlmMjBjL+MYBVY4uTQYDgjkf6pAMj4trm/Q1r1eqa/SrBuudts/HYgLVc3ATjfpOIEbYT1DopE7u9Az5f7LZaIbnrG6Ou74btIACbLY6RATUvQe6lcB5euhBwwEJA4W+1b/1NG8dtrd2Il4U/eU2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 IA4PR11MB9058.namprd11.prod.outlook.com (2603:10b6:208:56e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.17; Tue, 4 Aug
 2026 08:31:25 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%4]) with mapi id 15.21.0270.017; Tue, 4 Aug 2026
 08:31:24 +0000
Message-ID: <75f2a523-ac6d-4470-a87a-33d9ccc07540@intel.com>
Date: Tue, 4 Aug 2026 14:01:16 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] drm/xe/ras: Fix invalid health error code
To: Raag Jadav <raag.jadav@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.d.roper@intel.com>,
 <soham.purkait@intel.com>
References: <20260804051214.1202957-1-raag.jadav@intel.com>
 <2cd81d12-a37e-47ad-a213-79a470ab7ad2@intel.com>
 <7514b3a7-ee80-4f1b-a2b2-aff3ea522ead@intel.com>
 <anGdtkV0o2JS_fxy@black.igk.intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <anGdtkV0o2JS_fxy@black.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0149.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d7::19) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|IA4PR11MB9058:EE_
X-MS-Office365-Filtering-Correlation-Id: 2304877a-82fe-484e-2153-08def202c51c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|376014|1800799024|11063799006|4143699003|56012099006|10067099003|3023799007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: mPEMdoJ33RRLUqGRxQcolRDkUigJqICUsYrTr/L3Kwkw/FdmxpZot/GhKapZfBpQvBiQ2uqfZtjPIN+/zBChNgksPG3Ybb3zXByRXNPi47x1Z3S7uruZNE+S93+FkGZUy31AjViyv4PorTiXNItUagicQVCP21xMrhdA+1P34xuFAcyKf7HvSRYJ7n4yiJGbHU5VDGgiG0kdOCBnpb6w/emkSdkVyyDnkUWi7vUqVGwtQ+LiUVZ9peVxna6SibWtOSJpDigsL2BaDXT6ySJ7+QfxfQOAgUB1wKo3Oon7UNvtKbXLa5TDnM5RBo7B70i28L5uvgUKpmnxXnDflbTk61NGLe74v1XLWQgTFW5EOl13s7+rYySoLY0oaueCkll5ODQYWYjjn9mX1kPdeBuGmJwNBPZzxZRvtEy7MLJT0COktz9isSIWEeWibOYa+bY2tuIFX8h11E9bJoAyFdyJDgOC8Toi6CC34Q7jmMWRf5EFFVeSFXUwxm5voBiAZHG8rok6p2rvw91toGjPiiJAhgNvTYgWCNBAxXdeI33gzc9Ob7tPtdrGho2sYg7KuTU+65flBhoDG0SaPQ2V2bTyLXE/EM9MX1Ev0tG7Yo4vPUzq487wxFf1wza/b7j/V9HfkZ4dlnC2r1kutvvD6WIO5lVjl+Xch3TzQ2JCGnfmNIA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(11063799006)(4143699003)(56012099006)(10067099003)(3023799007)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SVErNTV5dThQSW0rWnVBdHdXYmhSMDZSVTNRcWU2N3VNRGFiY2xxdW1jSzlN?=
 =?utf-8?B?VXhaVzFORGFWSm1xQzkzRGpvOHFQRTNjYURsUGhMZ0FEMTd6UGtQcFFIUkdB?=
 =?utf-8?B?c3hqN2cvWjRWakpBTCtvNXUxSkZmU0xkTDhnTjNTUmRJSzJDTlZyciszVk50?=
 =?utf-8?B?TTFDdU9NQWROMndWeUxCUldBalVMdGEvZUp2M2doc3JKaU55UklMdnZyV2pr?=
 =?utf-8?B?enQxMmFGMVRCekppaUdUMmJGZHpVZFg2OE5hcFlEdWdqWnBSY2lVZVhQRzhT?=
 =?utf-8?B?OCt3cDk3UkQyeXovZHBCVmR0eE5qekFhdmJvV3RaU0ZXam9vUWRtVkx2MTVX?=
 =?utf-8?B?THRuM0owQUhwdnJFTjdITkxUMWNoRE1pSmV3cnVIZEZRdWtxRGFQK0dzQVlS?=
 =?utf-8?B?MUpGWUtBTXJWeHJwMGZyNHBKaHU4bDNVV2dIRUxZdlVKRHdiYWxkS0NJQjlm?=
 =?utf-8?B?YWNVMkZxRVl2N3E4TFVIdUpvVlZwVkpJamZkcjBnTG1YMzFOYUpKcC9yMWxI?=
 =?utf-8?B?Q1FLTW13K1BmTUljQ2ZCK0N3K2dRbnBBM3haV3c0UzcwSmVJbGJpaUV6T1hG?=
 =?utf-8?B?MGJUOTFnSUZHTUZ2Ti9vd1dNOW5vZzZBUUlEdU1ZNWpKc0RyVVM1a05aK09D?=
 =?utf-8?B?alY5SVpQblNmdkV0WVlRamw3VWQwY3lTUWxiZDhpbjVhdkg3clljOUVjYnpl?=
 =?utf-8?B?M0JNQWVEbTZVQ2o0QVA4cjVwR3ZULzhtSFk4NmFobkdIa2Noc0o5aW85SEJH?=
 =?utf-8?B?bm9GbU94aWViSm5aVGliZHlvWVEyMk5nVnlEd1FkS2JjK1lsNWpTdE1wLzlU?=
 =?utf-8?B?a1lzck1DSlpoOVh6WE04aTg0a3RIem8vMDdiR3NXbmtmUTZEeW1hV04vY0RG?=
 =?utf-8?B?SjFsNXI3U2RhbEJBWThiZFNSaHJkRzk0L2w2cWxBM1oyVjUvRnY5WjgxZ0t6?=
 =?utf-8?B?WDU4NHRicG1sdWFJdk0vV0RWb29BVFUrNU9HN3k5VzNxYzJiTjNJS0tBNTRy?=
 =?utf-8?B?SkxJNTRLNDNKaGhEUUtaUno1YlZQT1pxb1JsR3NqRHJ4WEpuVEpySkJUSVdy?=
 =?utf-8?B?dVFrckcwakp2Z2ZuM2t3N0NHUER6M0Uyc1BncllXenQyYnlpcUhuOWZ0Ukox?=
 =?utf-8?B?RXdJRXlPN05vTnZjc052cHREZ3RvOXNKYXI5dWpMdTZkQ2QyZ0dDQXduanIv?=
 =?utf-8?B?VGRXYzh0WjVtdjhQRG1jczdmcGVLQkV3bWN6K2tZRk9ZWUEveXpGK0xQWVl0?=
 =?utf-8?B?SElxNXFQOWk1U1NFVng5MHJUckdEVURITG84V0luNHlkaHAvK0VsTnVaYWNm?=
 =?utf-8?B?dkwyaHJIdHFSM1JOV0JoMWxUWkNFQlpzZGpmNkVUbkxYNDF1V1ZadG9Gb1A2?=
 =?utf-8?B?clc2TFkzNnNadnE2SVdZaFpoUSt6M0pKVnNiL0s5ZWxub3hnOVl2ZHBGbmZ5?=
 =?utf-8?B?dnNCUENoeTBZNmFGbnFoYlNtejJvWGxtclFuK1Q5eTdrb0JiSmF1VWRhSmw3?=
 =?utf-8?B?MzYwUE9hcmJvcnpSRU5ZVlBKMTBXRzFWN2VLdUUrRWp0WnpkMUF6NGtKdDZ4?=
 =?utf-8?B?dFdZc1M3aEZuRFQ1R2hoWW1rSWhEc0NET3U4OWhaUGV3N1B0Y1JBeFEra3My?=
 =?utf-8?B?NjBkQjVhUktjUWxPenZEVWxsdTZ5TnQrYzdVdGpxOWI3WFR4OUpWZnl3cmUv?=
 =?utf-8?B?KzlQWVNHMWNGOXJQbk0ySEM1bFhlTkY2UWNIenRpU0pCWStJL1hJb1puU2FX?=
 =?utf-8?B?UTYyOWsybDE1ekFybjFrYUVKeEU2ZHE3aVlqL1laQzRKVVYxWHFqNzlFb1pi?=
 =?utf-8?B?QmpuS2UxaTNXeGZ1anRxS05hUlJ1TnZKallEaDY5SVVoNGpacjZ6K0tvUi9S?=
 =?utf-8?B?Qko3ZlVZRUdqbTJkblQ3THRNV2xzS0RZK2RpYm1qSDEzZmJHZ2pDTUxDR3Qr?=
 =?utf-8?B?QnFQSlNCL3pTSjgySE16ZGRLRVo3WDMvVG0yMm1NYmd6NDZPcytYT1l4QTZH?=
 =?utf-8?B?QlBIT2pIUXVhUDBPOHY2QVRPc1VTcUtsT2VaOEg3blQ2WFdHRHhxcWY5WlZv?=
 =?utf-8?B?ak9pMUtkUUovMjYxQmU0NFNWTXNLV091REpGWjQrNVNoU0xETjRFcVJuR3hR?=
 =?utf-8?B?QmR5L29zQTZaMUNQRWhLU1ZiMitDdC82VGwrNEFhOVVaU3lqU1hyZlE2RS9i?=
 =?utf-8?B?ZjVCU25qSW9LbnlZRjBJUVlRVXZEN2JHeEY1SVFOeHhsWW01dHhoczNaUlo2?=
 =?utf-8?B?OUUvNE9WYk9Hc2M5N09SeDlGME1SblRMZDcreHdKMnhNR1JPaUIwM0lwTFVR?=
 =?utf-8?B?YWVWb0FKc1BOZW1ZVytoWjdHR2FCZFExUlZadmtQcEkwdjJZRGNmdz09?=
X-Exchange-RoutingPolicyChecked: CNSO5bRvHml9vyYw3/VQaK+scmDnleTwvmCUAFqcME7/zzNpVaxA2/q5HE9OqKkpFDH30HaFt7zRiPPUR11dC7xAxSWN1nlJyQZ86kAdhFc7JEA/wGz3UHqO5tO6FDOPI/5fysPgmaB+NdlzcOeCJ6xjycnyBgFO0mCFYMCoBAoXnb6JVo2NI9T+ei2gwzqkC1oN5cSz748u9xWY5H/EON8pDu+E1U12nrkElb+m3rGfEjZvtghI/Pz1HgFqOtrURMo/zj5SvhpaiKCGudvRX0QdtJXp2yQzmKjI8QU7yTr8eGTG8dA6R6MAQmZ5Tel5F/n2xRS42Bcg8Ot/Nczx9g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2304877a-82fe-484e-2153-08def202c51c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 08:31:24.7254 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Auetzb6CAtYqUCxI/24t3GF7jyrUsS/OigsQ9QL/W84ymjMQjHK8JRpCo51/WDVzpoWXG2G9EMRt4t7HXS5H4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9058
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


On 04-08-2026 13:37, Raag Jadav wrote:
> On Tue, Aug 04, 2026 at 08:56:12AM +0200, Michal Wajdeczko wrote:
>> On 8/4/2026 8:36 AM, Tauro, Riana wrote:
>>> On 04-08-2026 10:42, Raag Jadav wrote:
>>>> We use -EBADMSG for corrupted responses from sysctrl. Fix the error code.
>>> Let's keep it -EIO as it's more appropriate for sysctrl errors and consistent than
>>>
>>> #define    EBADMSG        74    /* Not a data message */
> The response size is valid, it's just the contents are corrupted. Similar
> to what we did with commit 948eee331bef ("drm/xe/ras: Validate sysctrl
> response") and more consistent here.
>
>> btw, inside GuC CTB code we use
>>
>> 	-EPIPE		// for corrupted message/channel
>> 	-EPROTO		// for unexpected content in the message
> We have a bunch of these as a response status, check ras_status_to_errno().
> The one proposed here is for the values deemed acceptable as per spec.
>
>> as -EIO is too generic
> Agree.

Using -EIO consistently for system controller errors allows easier 
debugging for
sysctrl commands.  When any sysctrl ops fail we know it's not RAS layer.
The only other error code we see is directly from firmware status.

This is my thought. I will leave it upto you

>
> Raag
>
>>>> Fixes: 53a7115f9862 ("drm/xe/xe_ras: Add RAS GPU health indicator")
>>>> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
>>>> ---
>>>>    drivers/gpu/drm/xe/xe_ras.c | 4 ++--
>>>>    1 file changed, 2 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
>>>> index f7af4da8172c..bdad0621ae12 100644
>>>> --- a/drivers/gpu/drm/xe/xe_ras.c
>>>> +++ b/drivers/gpu/drm/xe/xe_ras.c
>>>> @@ -700,7 +700,7 @@ static ssize_t gpu_health_show(struct device *dev, struct device_attribute *attr
>>>>        if (response.health >= XE_RAS_HEALTH_MAX) {
>>>>            xe_err(xe, "sysctrl: invalid health state %u\n",
>>>>                   response.health);
>>>> -        return -EIO;
>>>> +        return -EBADMSG;
>>>>        }
>>>>          health = gpu_health_states[response.health];
>>>> @@ -753,7 +753,7 @@ static ssize_t gpu_health_store(struct device *dev, struct device_attribute *att
>>>>        if (response.health >= XE_RAS_HEALTH_MAX) {
>>>>            xe_err(xe, "sysctrl: invalid health state %u\n",
>>>>                   response.health);
>>>> -        return -EIO;
>>>> +        return -EBADMSG;
>>>>        }
>>>>          health = gpu_health_states[response.health];
