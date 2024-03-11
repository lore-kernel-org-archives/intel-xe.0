Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31BCDC5475B
	for <intel-xe@archiver.kernel.org>; Mon, 11 Mar 2024 05:11:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7AAE10E0E6;
	Mon, 11 Mar 2024 05:11:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n3MTXx7P";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FECE10E0E6
 for <intel-xe@lists.freedesktop.org>; Mon, 11 Mar 2024 05:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710133903; x=1741669903;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=fZ5R4CMb3iD3h9pVkTQEmhnb3vMZBYSjWbuTbvF3bqU=;
 b=n3MTXx7PCJeUjFhbyFy2kDzukAU3H4mnjvLz7WPdMvOSb3Nfm4IE/yrL
 fc57BA4a4dMLQTg5wTLkA6PV42cSsKVBY4QskbhxLoTJD6r6wp4MaBe0T
 cjxoSVbVJMs/Zj/lja2IotJQfnskNMAsZuMqKKZtZ8RrLxNmDF2SdXTrY
 HuBGOVu5E4FJIsFsPq5H4/qeLMVt9f1SOcqytMwpvP7V9+saye7aC07pd
 MT7mwdJPyVLz0G4VjEhwmhnJ1/8tmaNF3v5r5+w9ka4EDprkOF0wOSUfe
 o9gM0pTkx2tCkcC8Og+myx+C2rvUmQb7OsPbCmapVrjIV4Q3M3XbQfr+r g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11009"; a="8598751"
X-IronPort-AV: E=Sophos;i="6.07,115,1708416000"; 
   d="scan'208";a="8598751"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2024 22:11:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,115,1708416000"; d="scan'208";a="11114354"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Mar 2024 22:11:42 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 10 Mar 2024 22:11:42 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Sun, 10 Mar 2024 22:11:42 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Sun, 10 Mar 2024 22:11:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M+vA9YWS1tzyUGiqje+UxLCBCV1qEqm1gdCjaMpcpmcODqv6a3/XPTZxc5E9kbqiwAbNdb5yJsAL/XWolLg/Q/ckqHhIrVyVGSYzXlO1Q6G0GDpAp+vLZQjAuRMqKJrlUJTwDPcD1awfa+Y6vByc20fuU+Nt/CZumdG0CYxOGlPRisrDPMqkqZQohL9KxzBvB/Vd5UsOtLYrW8uVCZcQ11nP70hJp2sWwp0in+MyRznN1VU9ubbSxZiwgsvBlsWNNqX/AI2BRotsptpAgHLP2PQKek1EKqExGd4BUhwvkP6QoPLIuPguBrQWXPQ/2GhiX4LeI2wFVrODncvGA1/EwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZkvjqC6hRanQtw9hl3tGU5Ew+eQ8/jrMuMTANovi9TI=;
 b=RT/SPUXU2r2PupRuRolBg/851d7vbFlefhuBrKUGgUCWyDJRYuaMFkfQgI0VXVShig5/7P8R+EvUMIqoE80Ok8aCDgqrZrQweslaFqBHMQCKOruhNU4pOk25+dsHApf1XlDE5zvv0pwE5RAVwBJtdFpKmypql8TwdrjOqHfwyX7sM5kwBhJx/glt/PUgqfxE6q3RXghgBLNBwgbs/C+8e8xwY+S1jk0/FpVQaIoc6L+kQPr6KeTD/LV9cHZtl/lnKu9lYK/uMdcV5riJLjUZ4z6zi4v+z6Dhq8MRjyKtGlHUNDydh49P19glZChXJuw6/OGPqeOgSRBJUFPH8xtVUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 SJ1PR11MB6131.namprd11.prod.outlook.com (2603:10b6:a03:45e::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7386.16; Mon, 11 Mar 2024 05:11:40 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::bf36:ca7c:bb6f:68a5]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::bf36:ca7c:bb6f:68a5%4]) with mapi id 15.20.7386.016; Mon, 11 Mar 2024
 05:11:39 +0000
Message-ID: <09edb54d-3245-49b7-aacf-e39b5ce3da92@intel.com>
Date: Mon, 11 Mar 2024 10:41:31 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] RFC drm/xe: check pcode init status only on root gt
 of root tile
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <aravind.iddamsetty@intel.com>, <badal.nilawar@intel.com>,
 <matthew.d.roper@intel.com>
References: <20240308085517.2030484-1-riana.tauro@intel.com>
 <20240308085517.2030484-2-riana.tauro@intel.com> <ZesirH8C1mDsC6If@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <ZesirH8C1mDsC6If@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BM1PR01CA0150.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:68::20) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|SJ1PR11MB6131:EE_
X-MS-Office365-Filtering-Correlation-Id: bb90d982-7ae0-456d-da22-08dc4189bbbb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /6RVNrnhyWBmGwRn1xPAbi55Y4A12SgmZY+WozbYYREOQ4Gyq8AW74dTrP5fKUVv6vbzJzpF4hlX1CW3vEKW/RNd5W6Yt9XfBUjq2XnjCmid9F7Su9rjwjb41++2dMHeI74FWjQmYUWXayMwcughxeD20zIrhO+qPfx43j1v5jCMEsTjcmPRBW8aSBdx7hmuDLrWKxA73ozCA1yt/AskevkeUB84Fok1hwyK5ncWf5Nb4mD7vieb86jsdImDRFAFknQRgGrN6Cjs3FLR/+kUnKGIb5tPLbr3BDIWmpP9S47x2YxzaXbvLOMDiZ9r504QacPvk8WssXz5AAZWeB/+40znSFP1Zjo2QOoR/LkHgs8vG+dpRYlWE6cJuvSZIDcMMBoWZwbLALoyIi9+MVXY/mdPfy3FEv4m8cNXEhUkMaqP5U1MiMGGcLyfubUq4/w9vVkjyTv049jiN3dzFlrJ5n6YdsRmUpS0fH7zQ36WK9Nj4Ht7MeDJRIHzc3vn7dILc5CpeQ3o4Av5L7Okt45VmciYAOSqgwMJ8rSfUrYZiodMLGIXq1MtzIAfLMj2RRPnjq07gOf9fTicTbTSikp0ZnUOo8wxGVfIuy8C96IKjk/xrFxghUb9PdONCplVFWWyoeRWevb3Oh1IhyTvTrR09jeZ9e7LjELShE7k7Qmj7uk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dURkMUVSQVFhamRVWmUwbDJiamJ3d0l0Qm05ampwNC9XQ3RKWW5SSUkrZ3VG?=
 =?utf-8?B?Vi9kaFMwb0M3ZGVHbnZRZ2FQRWlYaHBDR28rN3N5QzUrQ3VId3hKM3RlRml5?=
 =?utf-8?B?TU5ZS1ltRXFhcUtjelpNT0docGpsTi9uNG91Z1R0d2FRM3hCTjUwVEtWUVBk?=
 =?utf-8?B?MUpXM2ZpaE5zQVlEQ0s4bVJxV29xZ3A2STBnQUpNRUpHckpqaU9hWU1oVUh1?=
 =?utf-8?B?bG9hZlNsdHZGb282VythV0VvMEFwNm14Tm05T1FqR0doM2xFVnBPaUpZQ2NT?=
 =?utf-8?B?SUIwZ09lc1JMaGhkYXhiV1piVEN3ajUwbnV4QXR3U0NlcGR6YUZQV3R1bnF0?=
 =?utf-8?B?Z0ZOQUNIdlg5VU1DZkUrSHR6TjZ1d21xWFJHUkhTSm5ucjEvajRNTlVVa05t?=
 =?utf-8?B?dXREMG5vUFBpUmQrOGRPcWJHK293WS85bXJ4RFpZdHZyUUI4eUdPYUdRM2Na?=
 =?utf-8?B?NHh4NGtSN2NpVm1jQ2VtYm5QN0htNXp3ZXJUYWNBTmYwY1ZMa2JKNXhncTcr?=
 =?utf-8?B?aVlaOUZBT1RyOGdacFNJeitjeU54MGZLSEdXbjM4NDhSaUEySlRQRmt5eFZi?=
 =?utf-8?B?anVkRnkxMlEyb2x3SWJseU1BamtxN3EwbEZFRUNTQWhmTFA5SmtJZjByMFRG?=
 =?utf-8?B?aEFvYnhoZ2FJQWtaTWNpN0txWDlORXZwcHNGbTVWY3owL0tHZTFXZFFmVndq?=
 =?utf-8?B?dEF3aGtTY3NOdm5HM1RjZnM1eGFyTDEyM2FRQkIrd0V5VGM5VE9ZZkJtL051?=
 =?utf-8?B?ekZWd3lmbUdvajBSMmhiZ3Vna1M3MjVqbUF2b29obUU1TXoyMmJCREJ0aGZU?=
 =?utf-8?B?VGpwdllFcUN6WERHWGtWQzZuWkk4eVFVQ3NuSXIwOEo1QzlNdU4wODlrTXdT?=
 =?utf-8?B?aFVBZ1NrT2p6MnRoOUpBZVg2Y0NYZ0dJMzVEa0RWZC9MQlNJcy9mZ1BaWjIv?=
 =?utf-8?B?TnZZaDI1ck5FdHpEMlBXdVVqYWtNOWJPWjRhR0NTRjNDaDRZQk83aWtKNGxw?=
 =?utf-8?B?NUpGZFRETnFacS9ucFRmR1F6bUprbWVYTzFkTWxHTTFMU05TMXpVbVlCNDVy?=
 =?utf-8?B?T0dZa29MNTJzVGJEZ1lKSDVMWXA4QWdkaFRyZDBBNGNiNGRucXZRUUNWR1ND?=
 =?utf-8?B?SmFQM2N4eGROSVZON1ZNUHYwT2JlTThmeE9veGJtS2NjSDhZU1pzcFNZWkxL?=
 =?utf-8?B?SXY3TzlHYms1NnBtZmFWbmdOV0xYd0V5bGNMZVZpV0R0Q1NFdGhKOENjMUdJ?=
 =?utf-8?B?c3p6U2R3aXFGRy83WG5CVENtTzZPVEhqWjhjN05WUDFEUHZlc0tpZEZ4TzIx?=
 =?utf-8?B?NUVQOVFmRVdJdFRYbHNEeUYzcWtVczRoZ3R2UW5pSG5NdGFqNW5EQkdmck1p?=
 =?utf-8?B?UUVOYUs2alIzSWE1N1I2R080cjY4R1daWXRVRVAxOUNxRkhaR3RvV0NadUh4?=
 =?utf-8?B?ZEkxdXRES3J2cDFQV0Q2a2hnQlQ5UENMNTdwVHQrb3VUWXdveUxqS1JUeG8x?=
 =?utf-8?B?Q3dNa2FYc0hVSW94RUlJckpzcDhrZGxvY056WXNKZm5rVUllNTdnbUY0Y0NC?=
 =?utf-8?B?QVZ3YzNJVE5tMEhrbkVRNUo0NVF1bW1neXNXZ3NBa29YM3prU1B3V0tZcHFh?=
 =?utf-8?B?RHV2SUU0RWpjNnlmTUtsNWhRc05Ga05uOWx4bzdyWldOaTdtcit6c2FLcDRt?=
 =?utf-8?B?NHRFd0xwMVFyOWRXbEpKUlhaRnUzS3ZOdmVYUWViU0FXOGVkYUY1OU5BQXg5?=
 =?utf-8?B?eis3dk16MDRxSEU2blNvTS92eTJqYXhmbjB1MEJWeVF5ZGRCV3V2ZXdCaUdZ?=
 =?utf-8?B?ZWZSKytEQmE3aTJqekphR1JGa2xvK1grMGJBOXo0REsvY1pTWWJ4TXRCRU9w?=
 =?utf-8?B?Ynh5TDV6R2J6QlI3VE5XcGd6R0RqYisveFRsa3EvMDV3U3EwQW96QmRYOGpB?=
 =?utf-8?B?TU44SHlpVWpNenlNVVRydWJ2dDNFSy9xTVAzNXNsVll0NHJxaVg1YW1MR3N3?=
 =?utf-8?B?VEM4NHEzU2RyY0tqMFJobTJZdUdSWWpMamFDeHhheEVtWjUzRlZDenk4cTlx?=
 =?utf-8?B?Q0ptZmJOSDZnTVJCRnQwcXRJTXZiZUZFTGpGT01EWmpOa1FkaHA2S1gya2tZ?=
 =?utf-8?Q?LmP8QDxgurnoG5i1yjhlMcAwA?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bb90d982-7ae0-456d-da22-08dc4189bbbb
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2024 05:11:39.9441 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RwcWFuuTRhIuuaCEE6EHRlr3n2z6qcnqVFGLoEKR3swsKOe3xZGsg5veZok5bK2C/P2M/CE01HemEJIMygo9zw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6131
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

Hi Rodrigo

On 3/8/2024 8:07 PM, Rodrigo Vivi wrote:
> On Fri, Mar 08, 2024 at 02:25:16PM +0530, Riana Tauro wrote:
>> The root tile indicates the pcode initialization is complete
>> when all tiles have completed their initialization.
>> So the mailbox can be polled only on the root tile.
>> Check pcode init status only on root tile and move it to
>> device probe early as root tile is initialized there.
>> Also make similar changes in resume paths.
>>
>> v2: Add lock/unlocked version of pcode_mailbox_rw
>>      to allow pcode init to be called in device
>>      early probe (Rodrigo)
>>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_device.c | 21 +++++---
>>   drivers/gpu/drm/xe/xe_pcode.c  | 93 ++++++++++++++++++++--------------
>>   drivers/gpu/drm/xe/xe_pcode.h  |  3 +-
>>   drivers/gpu/drm/xe/xe_pm.c     | 16 +++---
>>   4 files changed, 78 insertions(+), 55 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>> index 919ad88f0495..83dd60f68566 100644
>> --- a/drivers/gpu/drm/xe/xe_device.c
>> +++ b/drivers/gpu/drm/xe/xe_device.c
>> @@ -413,8 +413,14 @@ static int xe_set_dma_info(struct xe_device *xe)
>>   	return err;
>>   }
>>   
>> -/*
>> - * Initialize MMIO resources that don't require any knowledge about tile count.
>> +/**
>> + * xe_device_probe_early: Device early probe
>> + * @xe: xe device instance
>> + *
>> + * Initialize MMIO resources that don't require any
>> + * knowledge about tile count. Also initialize pcode
>> + *
>> + * Return: 0 on success, error code on failure
>>    */
>>   int xe_device_probe_early(struct xe_device *xe)
>>   {
>> @@ -428,6 +434,10 @@ int xe_device_probe_early(struct xe_device *xe)
>>   	if (err)
>>   		return err;
>>   
>> +	err = xe_pcode_ready(xe_root_mmio_gt(xe), false);
> 
> my first thought here was that we should also put a comment on why
> it is okay to use only root tile. A simpler version of what you
> told in the commit message above.
> 
> But then, looking further below, I started asking myself about
> the names.
> 
> what about have a
> 
> xe_pcode_probe_early(xe)
> that calls xe_pcode_ready(xe, false);
> 
> and inside the xe_pcode_ready you do the xe_root_mmio_gt(xe).
> 
> and you use the bool to grab (or not) the lock inside xe_pcode_ready.
> 
> then xe_pcode_probe continue to be only the lock initialization
> although that could also be named xe_pcode_init.
> 
> And then on the resume paths you call xe_pcode_ready(xe, true).
> There on resume paths we also only need the root tile check.

> 
> But only some extra thoughts that I had now seeing the final patch,
> but since this already is a good movement towards our goal and is
> correct, if you add the code comment about the root-tile being
> enough, you can feel free to use:

I'll add the comment and the changes suggested. Thank you for the review

Thanks
Riana
> 
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> 
>> +	if (err)
>> +		return err;
>> +
>>   	return 0;
>>   }
>>   
>> @@ -506,11 +516,8 @@ int xe_device_probe(struct xe_device *xe)
>>   	if (err)
>>   		return err;
>>   
>> -	for_each_gt(gt, xe, id) {
>> -		err = xe_pcode_probe(gt);
>> -		if (err)
>> -			return err;
>> -	}
>> +	for_each_gt(gt, xe, id)
>> +		xe_pcode_probe(gt);
>>   
>>   	err = xe_display_init_noirq(xe);
>>   	if (err)
>> diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
>> index b324dc2a5deb..6c0009fcd2fe 100644
>> --- a/drivers/gpu/drm/xe/xe_pcode.c
>> +++ b/drivers/gpu/drm/xe/xe_pcode.c
>> @@ -43,8 +43,6 @@ static int pcode_mailbox_status(struct xe_gt *gt)
>>   		[PCODE_ERROR_MASK] = {-EPROTO, "Unknown"},
>>   	};
>>   
>> -	lockdep_assert_held(&gt->pcode.lock);
>> -
>>   	err = xe_mmio_read32(gt, PCODE_MAILBOX) & PCODE_ERROR_MASK;
>>   	if (err) {
>>   		drm_err(&gt_to_xe(gt)->drm, "PCODE Mailbox failed: %d %s", err,
>> @@ -55,17 +53,15 @@ static int pcode_mailbox_status(struct xe_gt *gt)
>>   	return 0;
>>   }
>>   
>> -static int pcode_mailbox_rw(struct xe_gt *gt, u32 mbox, u32 *data0, u32 *data1,
>> -			    unsigned int timeout_ms, bool return_data,
>> -			    bool atomic)
>> +static int __pcode_mailbox_rw(struct xe_gt *gt, u32 mbox, u32 *data0, u32 *data1,
>> +			      unsigned int timeout_ms, bool return_data,
>> +			      bool atomic)
>>   {
>>   	int err;
>>   
>>   	if (gt_to_xe(gt)->info.skip_pcode)
>>   		return 0;
>>   
>> -	lockdep_assert_held(&gt->pcode.lock);
>> -
>>   	if ((xe_mmio_read32(gt, PCODE_MAILBOX) & PCODE_READY) != 0)
>>   		return -EAGAIN;
>>   
>> @@ -87,6 +83,18 @@ static int pcode_mailbox_rw(struct xe_gt *gt, u32 mbox, u32 *data0, u32 *data1,
>>   	return pcode_mailbox_status(gt);
>>   }
>>   
>> +static int pcode_mailbox_rw(struct xe_gt *gt, u32 mbox, u32 *data0, u32 *data1,
>> +			    unsigned int timeout_ms, bool return_data,
>> +			    bool atomic)
>> +{
>> +	if (gt_to_xe(gt)->info.skip_pcode)
>> +		return 0;
>> +
>> +	lockdep_assert_held(&gt->pcode.lock);
>> +
>> +	return __pcode_mailbox_rw(gt, mbox, data0, data1, timeout_ms, return_data, atomic);
>> +}
>> +
>>   int xe_pcode_write_timeout(struct xe_gt *gt, u32 mbox, u32 data, int timeout)
>>   {
>>   	int err;
>> @@ -109,15 +117,19 @@ int xe_pcode_read(struct xe_gt *gt, u32 mbox, u32 *val, u32 *val1)
>>   	return err;
>>   }
>>   
>> -static int xe_pcode_try_request(struct xe_gt *gt, u32 mbox,
>> -				u32 request, u32 reply_mask, u32 reply,
>> -				u32 *status, bool atomic, int timeout_us)
>> +static int pcode_try_request(struct xe_gt *gt, u32 mbox,
>> +			     u32 request, u32 reply_mask, u32 reply,
>> +			     u32 *status, bool atomic, int timeout_us, bool locked)
>>   {
>>   	int slept, wait = 10;
>>   
>>   	for (slept = 0; slept < timeout_us; slept += wait) {
>> -		*status = pcode_mailbox_rw(gt, mbox, &request, NULL, 1, true,
>> -					   atomic);
>> +		if (locked)
>> +			*status = pcode_mailbox_rw(gt, mbox, &request, NULL, 1, true,
>> +						   atomic);
>> +		else
>> +			*status = __pcode_mailbox_rw(gt, mbox, &request, NULL, 1, true,
>> +						     atomic);
>>   		if ((*status == 0) && ((request & reply_mask) == reply))
>>   			return 0;
>>   
>> @@ -158,8 +170,8 @@ int xe_pcode_request(struct xe_gt *gt, u32 mbox, u32 request,
>>   
>>   	mutex_lock(&gt->pcode.lock);
>>   
>> -	ret = xe_pcode_try_request(gt, mbox, request, reply_mask, reply, &status,
>> -				   false, timeout_base_ms * 1000);
>> +	ret = pcode_try_request(gt, mbox, request, reply_mask, reply, &status,
>> +				false, timeout_base_ms * 1000, true);
>>   	if (!ret)
>>   		goto out;
>>   
>> @@ -177,8 +189,8 @@ int xe_pcode_request(struct xe_gt *gt, u32 mbox, u32 request,
>>   		"PCODE timeout, retrying with preemption disabled\n");
>>   	drm_WARN_ON_ONCE(&gt_to_xe(gt)->drm, timeout_base_ms > 1);
>>   	preempt_disable();
>> -	ret = xe_pcode_try_request(gt, mbox, request, reply_mask, reply, &status,
>> -				   true, timeout_base_ms * 1000);
>> +	ret = pcode_try_request(gt, mbox, request, reply_mask, reply, &status,
>> +				true, timeout_base_ms * 1000, true);
>>   	preempt_enable();
>>   
>>   out:
>> @@ -238,15 +250,16 @@ int xe_pcode_init_min_freq_table(struct xe_gt *gt, u32 min_gt_freq,
>>   }
>>   
>>   /**
>> - * xe_pcode_init - Ensure PCODE is initialized
>> + * xe_pcode_ready - Ensure PCODE is initialized
>>    * @gt: gt instance
>> + * @locked: true if lock held, false otherwise
>>    *
>> - * This function ensures that PCODE is properly initialized. To be called during
>> - * probe and resume paths.
>> + * This function ensures that PCODE is properly initialized. Can be called
>> + * without locks only in early probe.
>>    *
>>    * It returns 0 on success, and -error number on failure.
>>    */
>> -int xe_pcode_init(struct xe_gt *gt)
>> +int xe_pcode_ready(struct xe_gt *gt, bool locked)
>>   {
>>   	u32 status, request = DGFX_GET_INIT_STATUS;
>>   	int timeout_us = 180000000; /* 3 min */
>> @@ -258,12 +271,10 @@ int xe_pcode_init(struct xe_gt *gt)
>>   	if (!IS_DGFX(gt_to_xe(gt)))
>>   		return 0;
>>   
>> -	mutex_lock(&gt->pcode.lock);
>> -	ret = xe_pcode_try_request(gt, DGFX_PCODE_STATUS, request,
>> -				   DGFX_INIT_STATUS_COMPLETE,
>> -				   DGFX_INIT_STATUS_COMPLETE,
>> -				   &status, false, timeout_us);
>> -	mutex_unlock(&gt->pcode.lock);
>> +	ret = pcode_try_request(gt, DGFX_PCODE_STATUS, request,
>> +				DGFX_INIT_STATUS_COMPLETE,
>> +				DGFX_INIT_STATUS_COMPLETE,
>> +				&status, false, timeout_us, locked);
>>   
>>   	if (ret)
>>   		drm_err(&gt_to_xe(gt)->drm,
>> @@ -273,24 +284,32 @@ int xe_pcode_init(struct xe_gt *gt)
>>   }
>>   
>>   /**
>> - * xe_pcode_probe - Prepare xe_pcode and also ensure PCODE is initialized.
>> + * xe_pcode_init - initialize pcode
>>    * @gt: gt instance
>>    *
>> - * This function initializes the xe_pcode component, and when needed, it ensures
>> - * that PCODE has properly performed its initialization and it is really ready
>> - * to go. To be called once only during probe.
>> + * This function initializes pcode. Used in resume paths
>>    *
>>    * It returns 0 on success, and -error number on failure.
>>    */
>> -int xe_pcode_probe(struct xe_gt *gt)
>> +int xe_pcode_init(struct xe_gt *gt)
>>   {
>> -	drmm_mutex_init(&gt_to_xe(gt)->drm, &gt->pcode.lock);
>> +	int ret;
>>   
>> -	if (gt_to_xe(gt)->info.skip_pcode)
>> -		return 0;
>> +	mutex_lock(&gt->pcode.lock);
>> +	ret = xe_pcode_ready(gt, true);
>> +	mutex_unlock(&gt->pcode.lock);
>>   
>> -	if (!IS_DGFX(gt_to_xe(gt)))
>> -		return 0;
>> +	return ret;
>> +}
>>   
>> -	return xe_pcode_init(gt);
>> +/**
>> + * xe_pcode_probe - Prepare pcode component
>> + * @gt: gt instance
>> + *
>> + * This function initializes the xe_pcode component.
>> + * To be called once only during probe.
>> + */
>> +void xe_pcode_probe(struct xe_gt *gt)
>> +{
>> +	drmm_mutex_init(&gt_to_xe(gt)->drm, &gt->pcode.lock);
>>   }
>> diff --git a/drivers/gpu/drm/xe/xe_pcode.h b/drivers/gpu/drm/xe/xe_pcode.h
>> index 08cb1d047cba..e597dcc8ad9f 100644
>> --- a/drivers/gpu/drm/xe/xe_pcode.h
>> +++ b/drivers/gpu/drm/xe/xe_pcode.h
>> @@ -9,8 +9,9 @@
>>   #include <linux/types.h>
>>   struct xe_gt;
>>   
>> -int xe_pcode_probe(struct xe_gt *gt);
>> +void xe_pcode_probe(struct xe_gt *gt);
>>   int xe_pcode_init(struct xe_gt *gt);
>> +int xe_pcode_ready(struct xe_gt *gt, bool locked);
>>   int xe_pcode_init_min_freq_table(struct xe_gt *gt, u32 min_gt_freq,
>>   				 u32 max_gt_freq);
>>   int xe_pcode_read(struct xe_gt *gt, u32 mbox, u32 *val, u32 *val1);
>> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
>> index 9fbb6f6c598a..83c316254e43 100644
>> --- a/drivers/gpu/drm/xe/xe_pm.c
>> +++ b/drivers/gpu/drm/xe/xe_pm.c
>> @@ -121,11 +121,9 @@ int xe_pm_resume(struct xe_device *xe)
>>   	for_each_tile(tile, xe, id)
>>   		xe_wa_apply_tile_workarounds(tile);
>>   
>> -	for_each_gt(gt, xe, id) {
>> -		err = xe_pcode_init(gt);
>> -		if (err)
>> -			return err;
>> -	}
>> +	err = xe_pcode_init(xe_root_mmio_gt(xe));
>> +	if (err)
>> +		return err;
>>   
>>   	xe_display_pm_resume_early(xe);
>>   
>> @@ -374,11 +372,9 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>>   	xe->d3cold.power_lost = xe_guc_in_reset(&gt->uc.guc);
>>   
>>   	if (xe->d3cold.allowed && xe->d3cold.power_lost) {
>> -		for_each_gt(gt, xe, id) {
>> -			err = xe_pcode_init(gt);
>> -			if (err)
>> -				goto out;
>> -		}
>> +		err = xe_pcode_init(xe_root_mmio_gt(xe));
>> +		if (err)
>> +			goto out;
>>   
>>   		/*
>>   		 * This only restores pinned memory which is the memory
>> -- 
>> 2.40.0
>>
