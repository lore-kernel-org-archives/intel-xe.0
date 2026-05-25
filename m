Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7797FCD5BC7
	for <intel-xe@archiver.kernel.org>; Mon, 25 May 2026 06:39:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24E6110E0A6;
	Mon, 25 May 2026 06:39:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TnG1Rp+3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A625710E0A6
 for <intel-xe@lists.freedesktop.org>; Mon, 25 May 2026 06:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779691182; x=1811227182;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/pe2IUS85xug1W4Xzgrw6Nl20Ns9JPyRR/yRkFgRrCU=;
 b=TnG1Rp+30eUufuK+gcyPtdYglCnUgdUQThYU6tWGtzIw6EIaQAwLfMIf
 kyNRi/3l9eNOsb1jDg4Tw2fnSPOe2CMwL1w0iHlHIDk5HbiOcFYo3xqYJ
 cfF0vXZAJ6xXoCD6C7gzoMPRcJ/JarNcMjvKyY7SIFaSowr9meJ8dSSXg
 MVZOFcYGhGGc1TQ7zMIDdAh+MFNMPeGPz2wyyCWFzV6JoJ70C8t7jPzZq
 v1tMOPOyh4SlYbAh3LVVchyAzfLyc9cvcJoQqV5jn2sTL/svL1+7XjKcD
 QdEjMN9QKTxzManCjTm01fUTy7C6Tn9nGaT9alLJ4Iw/0U5q9gUN/hyh0 Q==;
X-CSE-ConnectionGUID: lmbhIQaVTAax/HUP/uQikw==
X-CSE-MsgGUID: UT9S1X9gSfmBLvREkghjcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11796"; a="91199786"
X-IronPort-AV: E=Sophos;i="6.24,167,1774335600"; d="scan'208";a="91199786"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2026 23:39:41 -0700
X-CSE-ConnectionGUID: ezILUT+DRG24CD2T1wpCaQ==
X-CSE-MsgGUID: mDJPMT4OTXOgCY2CH5mgZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,167,1774335600"; d="scan'208";a="241703072"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2026 23:39:40 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 24 May 2026 23:39:39 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sun, 24 May 2026 23:39:39 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.16) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 24 May 2026 23:39:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dElMWz4R4ZRehBzxxKtTTEl+K4HjVaDeeTDwrGrQVIoanfjoT+RB9AYe1SuOHuK9unS65aGgScBANEVcPCh7XD8ShJfgfpLAwmVt51T6okMepGCQAvrPdnBaYFncX7zH1V9xfZ+cEJfbFYWLQXpoLmAE/2G2+RZWMMnItsl5seUeRKgUweVt946Whh+MbgLWnfcwZjXQ87VOfoLf/FhY+vlL5cmAu5WJyKaAFbLkC50ezpDiBEZciZmb/mMybE2nxhXMoLlYkDoO4z1fsEViulEROP+E4l6rk5FMrt9zri2PnfClV2ySCiF0wnelb+IBuXMGDbYOYGE2IiD/UUzW1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L0xqLshXH8wfEOO1qGQi50cn6Auil+Xh7IxtgB0BN/M=;
 b=WehBMpyneKI9nVP1fjIWub6jc3jG5qrT152jKqoNTMU2Mk2XV6tWbM1Wf4K5UVE5f8huB7yCj37ElBoFMOtiB9viIDKexjRAFFcu6nl2/XIqmq6nwJ0oRwjaAoAOZZs75ziKkLXeVwElwz2htEzMHBDIr0FM2lVZnPsmUZbKRQepD9bEJp91JXb9gpSeIWcAlBiKijYiWPEPexWpmsC0zzJxwBV650lkJgH/V/etApF1pbpD6VwTLHTMYOWUa4cxjXHfuTfO7sL7F9U8nohQAY75/joG4mjDpf9LjDQn63NcygdokVp2twe+SNuw3miO8LPTgI8zxMFkMqFk9imp0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 CY8PR11MB6820.namprd11.prod.outlook.com (2603:10b6:930:60::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.20; Mon, 25 May 2026 06:39:36 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%6]) with mapi id 15.21.0048.019; Mon, 25 May 2026
 06:39:36 +0000
Message-ID: <0c159ede-7e31-4575-a5c4-df8bdf36f5b1@intel.com>
Date: Mon, 25 May 2026 12:09:27 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 05/14] drm/xe: Skip device access during PCI error
 recovery
To: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <badal.nilawar@intel.com>,
 <raag.jadav@intel.com>, <ravi.kishore.koppuravuri@intel.com>,
 <soham.purkait@intel.com>, Matthew Brost <matthew.brost@intel.com>, "Himal
 Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20260511172908.1122252-16-riana.tauro@intel.com>
 <20260511172908.1122252-21-riana.tauro@intel.com>
 <c109d874-8b3f-4e22-bb8d-7c86c75ebb18@intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <c109d874-8b3f-4e22-bb8d-7c86c75ebb18@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0155.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1ac::7) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|CY8PR11MB6820:EE_
X-MS-Office365-Filtering-Correlation-Id: 56c07c89-e9a6-42e9-6a56-08deba286372
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|5023799004|11063799006|6133799003|4143699003|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: 6t9a2FfoZ9IEuUMBRelZPk9MjuKNGOeuONAuB0fcpTeYH/sgFfPZMw5uSPKLcPIm4D9ggUiRl9esQEBHwWCt61IZu5722kpCRq4q0gR3fQ+anhvBkR5qQ49+J8MtagsV2AXu/79ov/j0GksdcTBjOP25qI8M04dAXD838ZG7SkPfMjUMMQSnF41zwAGQtPMUkD6ylhPK9i4vBM5PRc/GaKjA2VDynwoFiD2Eao8IDknpwMwfJfFQrZ8vP3IoMmUapryabcdIuzx4oT676uXQssZPXgiA/GsuBojTk5Cwz0hBfu0VOtcN7g6J5JeSkjQsijEypdbzq6Mi+fyEabNYXqMa9/iUyGX56OVKcCaY+WTlDBKiwuruLbgIR5HJDdF7kyPDe5Vwsdvmd8iLkfgMLSQuKV8PddhWov0NJDkzpcXAolZJHRc/aQ7VNjW0PRABwjqOzvw9tdPBqSKXmRGdKYYubTFHkekZKxEzPUKt9UHm5fD6ZWkWk1UJSPZ+J0OSjSL6reZ/74hf3+TQhhGICHY4GWOSgt33Jx4JaEkIlyA9AjsnHYS6mc41rRFJtA3jTsd9Erbo3gQKbYWIx/LcfMgOMFE67OLgxRDFfEKdblO+wZ9O0Rwwp0orrrPsRVnrtgUc0d7UcPnmKiXGAdKSmPrdtzGJ63KuDmvBptzy0Z32At5VgBAfKFsS2j8wbPzg
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(5023799004)(11063799006)(6133799003)(4143699003)(18002099003)(56012099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UzdRRElYc1BLTTIzY1o4ZVY4ZnhFblk1aXhZeitPeW9ORW5mN3RXVmpMaUFv?=
 =?utf-8?B?OGgyTXo2RW01VTljL200cXg1d05rdlFQNXRzUjlvb20xWHdqeU94YWhuUW96?=
 =?utf-8?B?anA0a25qM0FBSjlGeEVNMWpKOW9ic05lWEhmTlArMmxUUzI0eTdsOHhlWENp?=
 =?utf-8?B?bFZ3UXl6Qk5WWS8yMk1JUG51ckFubGo0b1ZCTnpBS2QrRGhNbFZXMGRLaGhy?=
 =?utf-8?B?bzdVL2hISTB2bXJXd0d5ZDhzSnAwQTJGUjZRS1gyN0sxOEoyQ0xpaW96bjRT?=
 =?utf-8?B?cFcveW5aclRwSzNwZml4cFhUTWpCUkc4TXN1dWl2eDJyVDd0dnhHOENNZDZ1?=
 =?utf-8?B?RkN5STBncDNUWkt5RnlXdlpyT0hwTVIyL2d4TnYvYmdPNDh0YURGdXZ3QjBi?=
 =?utf-8?B?NGRDMkVUK3AvQWdDZGpkU3dkWDBoZ2R4bnhreThqUEVvalpLYWlhL0hiN2hx?=
 =?utf-8?B?STFNZXpDbmlXaC9EeWozeFg4YXBQZ2VZNHcrcXBrbWxJekY2WFVZVElYbG5T?=
 =?utf-8?B?UC9PSDl2c0V0eXN6dnR6VkNoZEVURXZEZ3YrRmh5a0VWekt6Y2pFclNreWFU?=
 =?utf-8?B?L0llRUVkRHBUc2trcWxPNGlXQjVjTG41dUhGTW42WHlBRFJ0YkpobWRGS2M0?=
 =?utf-8?B?bE1nZm9UcnlFT3FNS1AzUG9KMzQrTXJPRVVJS3NVSWgxWGdqcXBwR2UwWS9S?=
 =?utf-8?B?UWpZbzhyUGs3WWZnSjZiVHZOem9DZVFwcnFuVERVK3Z1d0tKTUg5T0NCQWIv?=
 =?utf-8?B?YWFRR1VQcHhQaitOL050WWVRTWV6eW83cEpRYjJpRUpmZndzbWZUaHBxbE9F?=
 =?utf-8?B?ckdjSXhSZ1JMNStKemxNY0duOHdwcVMyT3o5WCtXQzJwUTRCY1ByYUlQaWtX?=
 =?utf-8?B?NGJ2SmMxUCttWWJIWnczWExBd3lQL21ObkNyRllrTXdtWDRSQ3kvWllxYXRn?=
 =?utf-8?B?SDI3TStTRm9aUFZhRUlnUm5XVERHNTRvZFAxeUs4TUF1TGt0OW9LY3N6RGtj?=
 =?utf-8?B?TGk0LzAvTjBhdnc3QjJoclo1TS9lSWFxRlp5aGNhdHdTZm5zUndVU29UVXFj?=
 =?utf-8?B?aC9UWEFZKzZtN2xwd3h4SUlOOGRvSFNDUzcvK1FNVitINlZCUFdNSnJaSGQ1?=
 =?utf-8?B?UjllK08xRTEzajg5RVF5c0x6WWNMSkk2NDgzRjVrR1cxSjRtWitIWlhkdWdl?=
 =?utf-8?B?MTZDS0owSWNQSk9PcjZaWnRYc25HYjl6WVE1bWZPMWpPcFpTTzVkZ0lic0FE?=
 =?utf-8?B?ZUZpYmlTTjROU0l5bjVtTHVEVGVVdVRmQkhCTmhJS2tqakNuZjk1N21TZjZG?=
 =?utf-8?B?YlRsYXBmWUVieW1vakVZUTUrMk9MRnVqVFVxQkFTNmVaODFhMkVSalZwWUhY?=
 =?utf-8?B?aUVvTzJYNmhXS3ZwcDMxMzgyWDBhRnprKytRMWRhTWoyRUlMRnAwTEt1ZXhy?=
 =?utf-8?B?NWJNSHBXT0lTMmJybzN3VmNMVUl4REFvVWRNUTZ1OHdIYms3SU5mS284S29k?=
 =?utf-8?B?T0kxQ2RTVW5zZk4xSmNTZlJ0VmRLejBwRFQ2MEx2bWNLV1RpbkIzNXFFTVZz?=
 =?utf-8?B?YkMwU3dJYjdHQS8xWGpLUU1CRWdsWjZ1dW9LbmdnSHNQMkdDT29KSHpPMEZ4?=
 =?utf-8?B?b3pVVDRjUTBUQkYrTW9xUVBWMGowbitGcUsrb0xEWnNHVGUyOUpZbVdtSUpZ?=
 =?utf-8?B?Qk1rMURLaTZrLzV5WmM3QnRSV29EbE9DY2JXSlh3U01ic2Nyb0ViSlo3ZERn?=
 =?utf-8?B?YUV4TWFFQ2pwMEphQ3NrS2puYjJ4Uks0QkJFOENlbzJ0bEU2MDFjZDRSalF4?=
 =?utf-8?B?R0ROZGtJc1BhbDVaVVA0Y1JkTWdKeHdxbEEvbXM4dWY1R0dOQVZFNDd6YWZH?=
 =?utf-8?B?cU1kbkYxMlcvUDdDM2ZYYndFTzROM0xpbUh6ZzVqakFYdDM4Yk83VTVVZm9Y?=
 =?utf-8?B?L1ZSSFJDMEdwMVNDOW9lTEZjSjBnaGZQUmtTeWw1WjhpL2ZSUFN0S2lPL3cr?=
 =?utf-8?B?QWJOTEZncUFmMG5YbFhhUlBqTDYvalFlZDdyWk1VNFVoWkJzSmYrS0VvNlNM?=
 =?utf-8?B?UEJISStlMnVKeHcwNkZodndIejA5V0UyRU1tUHlBU2tMNk5rYmkxcEFVZFFa?=
 =?utf-8?B?Yjd4U25zWWhCVG5BcTRVU1djcXBha3UraWkwVXNoUWRxZUVpYnYvSG9QS0tM?=
 =?utf-8?B?YUZJRjEvN3dkbHNjQWdMbmgyelpXcjR6dHV4aC9CRDZySCtQVGx5SFRQR2or?=
 =?utf-8?B?VTUrY3JPSXNIbUw4dGdRQ0pNdGZrWEUxMk9mNzBFYXhRSzFPL21CZDNDWlNp?=
 =?utf-8?B?UTMreWVsOTJZR05KNWhLaFA0UWtya2hIRW5vNHEycTQ0Q3Z1L29aZz09?=
X-Exchange-RoutingPolicyChecked: S/uaBRJzrxfnRIKFzHLBnuKnMycpMyGihjil8EaywR6q91mdpcBr7YA6/t6mhYtNB/q84Szvjr7512LLbFJ5NUcoLdb01pAZ+moPYUWNtJ+OPC469lPKBWSie12npMgtG2oSeyInVrAjod3hrd4SsAvAbmS9yEGylmLk3FizwlRImPwk0aOr+JCZzTGACYYI0HouPJOMdvkVCwZVVd6EeJdIxwPT7VgZMxE5k2U9N+CLcp3uBCbfKvRfsowmemxPLcraqm+IAHTcQ4K2bYF0gDuE3HR/6U+5YIYoACTobk4owyWjHGGuFyLbaA6/OP6tWA8UYFA0E5u5VYetN+OJ/Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 56c07c89-e9a6-42e9-6a56-08deba286372
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2026 06:39:36.6039 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nio9eOGIk4ss24a5R3Q81Zohyow4FRsXQCcaWWetFvF7/XSqKxvgdd4ZnH+WfJ2E3WEiu9UF8QjGiTehdoi8BQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6820
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


On 5/18/2026 2:22 PM, Mallesh, Koujalagi wrote:
>
> Hi Riana,
>
> On 11-05-2026 10:59 pm, Riana Tauro wrote:
>> When a fatal error occurs and the error_detected callback is
>> invoked the device is inaccessible. The error_detected callback
>> wedges the device causing the jobs to timeout.
>>
>> The timedout handler acquires forcewake to dump devcoredump and
>> triggers a GT reset. Since the device is inacessible this causes
>> errors. Skip all mmio accesses and gt reset when the device
>> is in reset.
>>
>> Cc: Matthew Brost<matthew.brost@intel.com>
>> Cc: Himal Prasad Ghimiray<himal.prasad.ghimiray@intel.com>
>> Signed-off-by: Riana Tauro<riana.tauro@intel.com>
>
> Please fix Typo in commit message (inaccessible)
>

sure.

>> ---
>> v2: add check in worker (Mallesh)
>>
>> v3: add in_reset calls (Raag)
>>      rename in_recovery to in_reset
>> ---
>>   drivers/gpu/drm/xe/xe_device.h       | 15 +++++++++++++++
>>   drivers/gpu/drm/xe/xe_device_types.h |  3 +++
>>   drivers/gpu/drm/xe/xe_gt.c           | 14 +++++++++++---
>>   drivers/gpu/drm/xe/xe_guc_submit.c   |  9 +++++----
>>   drivers/gpu/drm/xe/xe_pci_error.c    |  2 ++
>>   5 files changed, 36 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
>> index 355d69dc8f54..765e90f4220f 100644
>> --- a/drivers/gpu/drm/xe/xe_device.h
>> +++ b/drivers/gpu/drm/xe/xe_device.h
>> @@ -181,6 +181,21 @@ static inline bool xe_device_has_mert(const struct xe_device *xe)
>>   	return xe->info.has_mert;
>>   }
>>   
>> +static inline bool xe_device_is_in_reset(struct xe_device *xe)
>> +{
>> +	return atomic_read(&xe->in_reset);
>> +}
>> +
>> +static inline void xe_device_set_in_reset(struct xe_device *xe)
>> +{
>> +	atomic_set(&xe->in_reset, 1);
>> +}
>> +
>> +static inline void xe_device_clear_in_reset(struct xe_device *xe)
>> +{
>> +	atomic_set(&xe->in_reset, 0);
>> +}
>> +
>>   u32 xe_device_ccs_bytes(struct xe_device *xe, u64 size);
>>   
>>   void xe_device_snapshot_print(struct xe_device *xe, struct drm_printer *p);
>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>> index ff47d233e8e8..65006491c378 100644
>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>> @@ -480,6 +480,9 @@ struct xe_device {
>>   	/** @needs_flr_on_fini: requests function-reset on fini */
>>   	bool needs_flr_on_fini;
>>   
>> +	/** @in_reset: Indicates if device is in reset */
>> +	atomic_t in_reset;
>> +
>>   	/** @wedged: Struct to control Wedged States and mode */
>>   	struct {
>>   		/** @wedged.flag: Xe device faced a critical error and is now blocked. */
>> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>> index cdc678d1ae1f..7b547cf7de52 100644
>> --- a/drivers/gpu/drm/xe/xe_gt.c
>> +++ b/drivers/gpu/drm/xe/xe_gt.c
>> @@ -917,6 +917,9 @@ static void gt_reset_worker(struct work_struct *w)
>>   	if (xe_device_wedged(gt_to_xe(gt)))
>>   		goto err_pm_put;
>>   
>> +	if (xe_device_is_in_reset(gt_to_xe(gt)))
>> +		goto err_pm_put;
>> +
>>   	/* We only support GT resets with GuC submission */
>>   	if (!xe_device_uc_enabled(gt_to_xe(gt)))
>>   		goto err_pm_put;
>> @@ -977,18 +980,23 @@ static void gt_reset_worker(struct work_struct *w)
>>   
>>   void xe_gt_reset_async(struct xe_gt *gt)
>>   {
>> -	xe_gt_info(gt, "trying reset from %ps\n", __builtin_return_address(0));
>> +	struct xe_device *xe = gt_to_xe(gt);
>> +
>> +	if (xe_device_is_in_reset(xe))
>> +		return;
>>   
>>   	/* Don't do a reset while one is already in flight */
>>   	if (!xe_fault_inject_gt_reset() && xe_uc_reset_prepare(&gt->uc))
>>   		return;
>>   
>> +	xe_gt_info(gt, "trying reset from %ps\n", __builtin_return_address(0));
>> +
>>   	xe_gt_info(gt, "reset queued\n");
> Can you combine it.

okay

>>   
>>   	/* Pair with put in gt_reset_worker() if work is enqueued */
>> -	xe_pm_runtime_get_noresume(gt_to_xe(gt));
>> +	xe_pm_runtime_get_noresume(xe);
>>   	if (!queue_work(gt->ordered_wq, &gt->reset.worker))
>> -		xe_pm_runtime_put(gt_to_xe(gt));
>> +		xe_pm_runtime_put(xe);
>>   }
>>   
>>   void xe_gt_suspend_prepare(struct xe_gt *gt)
>> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>> index b1222b42174c..288ca26f31cf 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>> @@ -1522,7 +1522,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>>   	 * If devcoredump not captured and GuC capture for the job is not ready
>>   	 * do manual capture first and decide later if we need to use it
>>   	 */
>> -	if (!exec_queue_killed(q) && !xe->devcoredump.captured &&
>> +	if (!xe_device_is_in_reset(xe) && !exec_queue_killed(q) && !xe->devcoredump.captured &&
>>   	    !xe_guc_capture_get_matching_and_lock(q)) {
>>   		/* take force wake before engine register manual capture */
>>   		CLASS(xe_force_wake, fw_ref)(gt_to_fw(q->gt), XE_FORCEWAKE_ALL);
>> @@ -1544,8 +1544,8 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>>   	set_exec_queue_banned(q);
>>   
>>   	/* Kick job / queue off hardware */
>> -	if (!wedged && (exec_queue_enabled(primary) ||
>> -			exec_queue_pending_disable(primary))) {
>> +	if (!xe_device_is_in_reset(xe) && !wedged &&
>> +	    (exec_queue_enabled(primary) || exec_queue_pending_disable(primary))) {
>>   		int ret;
>>   
>>   		if (exec_queue_reset(primary))
>> @@ -1613,7 +1613,8 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>>   
>>   	trace_xe_sched_job_timedout(job);
>>   
>> -	if (!exec_queue_killed(q))
>> +	/* Do not access device if in reset */
>> +	if (!xe_device_is_in_reset(xe) && !exec_queue_killed(q))
>>   		xe_devcoredump(q, job,
>>   			       "Timedout job - seqno=%u, lrc_seqno=%u, guc_id=%d, flags=0x%lx",
>>   			       xe_sched_job_seqno(job), xe_sched_job_lrc_seqno(job),
>> diff --git a/drivers/gpu/drm/xe/xe_pci_error.c b/drivers/gpu/drm/xe/xe_pci_error.c
>> index b392014ff1f6..7d8c36bec7ae 100644
>> --- a/drivers/gpu/drm/xe/xe_pci_error.c
>> +++ b/drivers/gpu/drm/xe/xe_pci_error.c
>> @@ -22,6 +22,7 @@ static void xe_pci_error_handling(struct pci_dev *pdev)
>>   	 * Wedge the device to prevent userspace access but don't send the event yet.
>>   	 * Runtime PM ref is taken by PCI core for the duration of error handling.
>>   	 */
>> +	xe_device_set_in_reset(xe);
>>   	atomic_set(&xe->wedged.flag, 1);
>>   
>>   	for_each_gt(gt, xe, id)
>> @@ -84,6 +85,7 @@ static pci_ers_result_t xe_pci_error_slot_reset(struct pci_dev *pdev)
>>   	 * TODO: optimize by re-initializing only the hardware state and re-creating
>>   	 * kernel BOs.
>>   	 */
>> +	xe_device_clear_in_reset(xe);
>
> Why we need to clear in_reset flag here? After probe it's set to zero 
> right.
>

Actually Not required. Added just for symmetry to indicate reset is complete

Thanks
Riana

> Thanks,
>
> -/Mallesh
>
>>   	pdev->driver->remove(pdev);
>>   	devres_release_group(&pdev->dev, xe->devres_group_id);
>>   
