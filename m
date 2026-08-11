Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BE0DC5CFCF
	for <intel-xe@archiver.kernel.org>; Tue, 11 Aug 2026 09:04:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE83D10E240;
	Tue, 11 Aug 2026 09:04:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DXWz+4rL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D93CD10E240
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Aug 2026 09:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786439093; x=1817975093;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=OVF5P44hpOmVHD6essJgxV1OibL292nlwYbkLlOFD3M=;
 b=DXWz+4rLU2G7bxqd19dGbtiK3oV76YtCbDdc3w/+0HlCR4mqVw8oMijf
 99Zdd3RczEPPwcEwHdFnrgwRDZh4sMNg+FGcBvaVYJR/9hvIRAu8e/whA
 4fdh9w0FoTQ0P8M+fvP+Ah7LOtYFrteVLqXe+NDWRBPL99aGS82hLSw/u
 lmDi8QHiIlTzLX1U7UrcMIsMPrIchD6TPaFaOffQLmpJHOhIRecPsc0sW
 L8OUboMDSsrz/O3oNbMN+5HbEe3lkoh3hisyJV6JbCt3xMhNlUC7rcYdm
 o1CHLhH4PfVgiz1AY1ZU1qewIqS/tE+snAcKq0cuCHpI7JifFBLR4vIQz A==;
X-CSE-ConnectionGUID: 7rdCVPAHQQWfHCyxeHyd2A==
X-CSE-MsgGUID: ZWQ65tnHT5WxBtxEorr95w==
X-IronPort-AV: E=McAfee;i="6800,10657,11871"; a="90647300"
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; d="scan'208";a="90647300"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2026 02:04:52 -0700
X-CSE-ConnectionGUID: oz8v5bmqSFeNYK8KuXkimQ==
X-CSE-MsgGUID: VRNWfcXXQrOupYtnu4Eftg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; d="scan'208";a="301506329"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2026 02:04:51 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 11 Aug 2026 02:04:50 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 11 Aug 2026 02:04:50 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.1) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 11 Aug 2026 02:04:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=chkrqSWCRl87kS0TiiPjjmd415gg/DiG6H52sSOgGrDxrHIN+WdlcEmk+kUl+Y1hT8NP66LEBKzWoo46qtsFovEelQoL0ZD70RhxgtpxZ8HMYA0qv6Lu7FzynTQOWx5YRIQUEU7ukE5BeB07nivgZVOb0HnUy8ewGoavpFdK9t83752QHufBZoIejecP2xbyt9dpn856uA37/Ws5AZFGjOqRBvxQ5M4/FPRnMlmjC7C9r5okdcvgYtuHkCcuT9igytlzv01rnXr+uzwqLc7auoRBoNs5cUP9DxJmr6+C2FIR5iIJLU9yk8oGK+/k6n4Y7RZm7kl9PMqdmCu7dsx4GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iakK2LZHN1SHyDlm0qbwt59FXSMiQFIMD/K4pVvi4/c=;
 b=JfUbGW8MVGj5e3TCJqiLvQcoLD3oZLxMWXBCl86FbvajDIhgdrxRg04w9IrVvOuXXezBdFljkzdcuyRWIAA2bdaWQVtCnBBGNmBGDS8KHxBIYSJvF13jPMWPgUknvT8YGjb0HvCuqVvgM82REyyyrbBfkAfDO1MD3Mp5ijOpazxu7GDeMNvx1s/qy9VymEP4VzMdaj4giWKsn62W4TRHfHoyyZga7gpm1UwVA53uhuP3sx3CVmYWIxf9xZg+doCfE5J7IVauf/4hbsAMhTh76Y8C/xLkn6CEfn9CRLR25WnYYpha17NoWgioVQK551gGM5nzVE7pZw6xQSmjDjBpEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by IA1PR11MB6268.namprd11.prod.outlook.com (2603:10b6:208:3e4::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Tue, 11 Aug
 2026 09:04:48 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%6]) with mapi id 15.21.0292.024; Tue, 11 Aug 2026
 09:04:48 +0000
Message-ID: <554f0ebd-2689-4918-95a6-816881edcd1a@intel.com>
Date: Tue, 11 Aug 2026 11:04:43 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/6] drm/xe/vf: Add bounds checking for queried context
 and doorbell counts
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20260810101428.1009573-8-satyanarayana.k.v.p@intel.com>
 <20260810101428.1009573-11-satyanarayana.k.v.p@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260810101428.1009573-11-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0902CA0057.eurprd09.prod.outlook.com
 (2603:10a6:802:1::46) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|IA1PR11MB6268:EE_
X-MS-Office365-Filtering-Correlation-Id: 8824920d-5397-45cc-a55c-08def7879834
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|366016|18002099003|22082099003|56012099006|11063799006|3023799007|6133799003|10067099003|4143699003;
X-Microsoft-Antispam-Message-Info: BvZBpCPV6JiwwGexODFblVvKpR6W2mL8WVvOxllrAx70j1UPa37JED1WCePTq8Xu/qrcZMZEV4nv2p/PqZmD+e5fqGqVxR3QZ2qoetSNBCTJ3O8dV4/LUlWmRWc05ALWXu4ZvVXnz+4IZyRXFrS0pDEv9vwD5GtWBSxji2+hWoFSfhxps/ITkhIRqMgBBzEd/jrzN4vqKQaNfbWmG83iRzscdmW9CgDULu8cHnj3m5UJgYhUE3zOPGtTmcDBZNnrCfPJ9gjWtHOEVpBwNKtPT/6NZNL3xbFdU7fPLk45vUyIPAYohvFRy3Zv58XBrRkwDqEh6zZnrrzQ8vy5WK3BF2Y3kp8GqCMTvRyzXmra674PiwDud/N3ReuQw1qT4McW+PdRrerL/Fb7HHEpxNEdn+sCwTGSSxt9wFDjc/IXtak3S8zCllOr2FzCTLKJVze0ilA3lqUKI3OI5oHmfZa1Emp147OoKSmKr2HaOfrcjYcWNqnO/itV8FtJ0MKYbWqHrALCVbnJCm4h64NRd2Sj2moWl9lKR8CGrCUAAaDXAGqhtmjKnbikyaoKukwmPmf5nRFACFLdz6J3Tc0zz+BHdq48dehImsAbpxzpmsg2X6Lxb33qvBMbO9wQ5endU1AZwnaBvpsT6rI/ELyU5Ymdw6QxsNuzP9kAKiytFntZHxU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(18002099003)(22082099003)(56012099006)(11063799006)(3023799007)(6133799003)(10067099003)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dzlWbzhXZTZpOGsrWUlYK1V3NEc2dXUramV0Wmhod25FNVZmcUREQzNOdjVH?=
 =?utf-8?B?eGd1d2lZcG82V1VvZGxScC9xQmdWR2VtcGRiMnVjaDNtRGJKTGdnd2ZEY2lr?=
 =?utf-8?B?MjQ4dXR5SUlzOUdvRHdENGJmMHFSYVVPOWdQTlp2VndrQWdHU3NjSEFuUnEv?=
 =?utf-8?B?czBMU09SK2ZhQXkxaEYrdENUcElxRHh6YUdSWFdQZzBndmx0eEFuekR0UHRx?=
 =?utf-8?B?anhGbkN0Tk1CSGkzK2E5SWNGVUFnY0c5Y25kU0VEb1VJUGhVaVA3b2VqRUZr?=
 =?utf-8?B?ZUxHekhNMXJ2ZVpkeDRTamFRUDFnY2FFYkU0MXBKODBmZDFpYldXbXAyTjk5?=
 =?utf-8?B?N3orbUlJdEVXOU9mdUNGWGxHOVRySTdKUER6bzhkM2JISTljRzhoVkZYa1dY?=
 =?utf-8?B?NHJkZkloWTlwNi9QYnZRdkowNkdlWS9oQUN1U2RHQnQvd1ZrRk1BZDVXY3Ni?=
 =?utf-8?B?cWFoZ09Pdk1obERvZEkwNGZKb2Fvczk1SjNPTTlmZWxXYVJmUE04N05jRXdT?=
 =?utf-8?B?dnFZdWxnR2ZISzhkT1NISHdia0xHL1hXUHQyQnNER1ZUdmZ5YjB4aWwvd1Zq?=
 =?utf-8?B?Y3hjWkpmMlduMmsvenFhN1pXTm9heUl4VTNtZU9SeFBDRS9kYlp2ck9tUjd4?=
 =?utf-8?B?OXl6RkJjRE81ZVIzYUZ5UWJWRi8xY1pYc0x0bnVVTldLZXBDS3llaEo4emp4?=
 =?utf-8?B?cWsvQlgwTGRGSU9MbXQ2czZTcjdHRlVwbGFpbFpOQW1vQ2pVNktyamNLRFBY?=
 =?utf-8?B?ZUovL1k0dVhuZmV6VGtJeDVSSTJYOTgyVEFxSENZdEJ6UkdHVDVvSDNqdGpG?=
 =?utf-8?B?akNBUHBKNHkyUmJ0QjllaEdHTTFSUVhOc2pPRjZFNVNMN2FHK2w0S1pPT2VK?=
 =?utf-8?B?OTVMaGJIOVMzS3c4akNSMzI3UGUwcXgzcXY1MllyRnFmcEdjWURyTFZOZE82?=
 =?utf-8?B?VDRFRzZZM2g0aWVHZ0xVa0R0ZjNNbzJVb28wQktyYXFOQ1Nad2RMNTFxMCtm?=
 =?utf-8?B?aC9ESkE4NFRURGxwNjdaaXB0ampEOXBvZ3JmWElxYXVjRGVqQ0pYc2ZjQmdV?=
 =?utf-8?B?NmlSeEhSTVFzL2NkdUZMM29XNWl2NktJTGxINURBaVMySFIrQlpORGVMbEg3?=
 =?utf-8?B?dEVaSm9EaWhudWptYVZDTlFvVzd5YVNmQUJVdFU1b1lzcWxUblN5cDdMd2pn?=
 =?utf-8?B?cVZicGhNME1pK2ptOWtTK1RKWDlNdm5uRnN4U2tjWjFVdy96ZWx5VGxvaVVj?=
 =?utf-8?B?all3SGV6WGhQVUk1T3RYWEJFdlpvZU5FRmp5SHB5VXBHczdjMXkzeXBNOEls?=
 =?utf-8?B?dk5lWWhsMUhDZzZ1N3BPMys5N29SWW9BdHVHZzBOT244aXByYlg2WXdPdGdR?=
 =?utf-8?B?UlU5dzhveGxoNXRENzFXM29ob21HMWp4TUtrMHBLZ0VKQmIxK09FVEg4T3Bk?=
 =?utf-8?B?RmdidWtibEtCR05kcG10ODBJT1N4VzU5QmhXWEpOUlZXenV5c3NhWEhQNWRv?=
 =?utf-8?B?RnR0SkMyVVpZeHpxZ0dxUmJpRk9mcUM1ZUpUUHg1UlVwQzdQTTBaMHo2aE9M?=
 =?utf-8?B?bk01MUN0aTI1ZzhMaUVwcWZTSkUxaGFRcWs3SGdWd2I2MFlreDVBZFNhNi9h?=
 =?utf-8?B?ZDgzUE5ZdWViN0RyYzFxZGpLaEdSemkzNmFjZmZRL3hESS8yOE9DLzlha0ds?=
 =?utf-8?B?NVc1TDUycUJjaVNnd2RuaVZwRUxsNS9RSTd0ZTh6TmN5V05ERTJZRkFoaytw?=
 =?utf-8?B?TzhzZ1Jjdy9SbWVLODIwK3h5RVllY1lFbnpYQmtBN3l1VlpYQmsxU0JXUDA2?=
 =?utf-8?B?amU1ZnljRllDdmo4enJocXRJYmZBb3QzZmdvbVNuQnRSUFMvRUR4UnpOam9M?=
 =?utf-8?B?QTc0a2FYcmFSWXJDNWIwRUpVT1BDL3JlbWExaWttNWRyeE80VzNsZ2M1TUhR?=
 =?utf-8?B?TmVTZ1p2ME5DTC9XWEp4bjlZYnlmSVVNSUs5VzNCTkc1RzBFelhCRUMrYVg2?=
 =?utf-8?B?dk8zTjYxZjRjcWo2WnVuWkErMWpzS2UvQ05lUURBNDJvOFhUbVhNS1ZReURU?=
 =?utf-8?B?Q1hkK3ZJbHFUbjBvSFJpVXRrdjVaVVhHRDdwbDlBelNWc0wxSGVyZWQ2YTUz?=
 =?utf-8?B?SnR1OVhFL1d5UzVOMHZTZDZtK05Bb0ZlZUtPMis0ZXEvNjVOdzR1QXc5eko3?=
 =?utf-8?B?TnlHMEVLSklVTUJiaGN5ZTZvc2ExREZ6ak85Z2NwODJhTXZFODAvQXM3QzNa?=
 =?utf-8?B?UGozUlZMU2JDdysrd1pab3J6Z3pOaWZjUEVNVEVhU1BpUnhGSkpjNXNvR24r?=
 =?utf-8?B?L3FYKzQ2SnZNSSs2RElUQUgweEJsZm1HcGFwa1BlOGtjcDkvOCtaTnkzbTYx?=
 =?utf-8?Q?AvRAB55lQm0NVop8=3D?=
X-Exchange-RoutingPolicyChecked: DNOrbNlDNFUH8PkaKjP9crsDVaYQ71X8WG3AOJ3PXMXsyUrtOJOG5On9e3ACVqUyBtpjIw4PqfsI93RzQqNK+sODgjkP+BTPKq6hOJyj7I5uVHuIOB6NPs3mZNA9UOzw9l9GJ2dNuWC1si+mQ7T1cn3toOXWgYiHzPHCaRJNGnYUMVvZpUiwJ1Xlzp47aDBFmnypfE8PiBncFsuAB6T1Bvrcc8FKGsUMoWL+bVWK51Ih9UoCJDylyEuXEIm/pL6vINhKvgy2/GwZOQDHp0IJ5aSynno2XfBtpey8IRRojfOKKzhf43ByzD21YjtCs/7Vvnq/dhdnjMkh0jeLH5Uwyw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8824920d-5397-45cc-a55c-08def7879834
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 09:04:48.1294 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h0AET1P4N544/hFqbx+J/LVpz8GHTTKGsM7MfStfDC/LlSQ+RLp99Sy7/Gt+U4ddkR7vnQe2mLMmysPjNXWyBAZNCptx3eBrU59VDcJatT4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6268
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



On 8/10/2026 12:14 PM, Satyanarayana K V P wrote:
> Add explicit bounds checks for context and doorbells which can detect
> and reject invalid configuration data from a misconfigured or
> malfunctioning PF, preventing protocol violations and protecting VF
> initialization.
> 
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

> ---
> V4 -> V5:
> - Fixed review comments (Michal W).
> 
> V3 -> V4:
>  - New commit
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> index 339ea0d3344c..81d68fe5ad7c 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -15,6 +15,7 @@
>  #include "abi/guc_klvs_abi.h"
>  #include "abi/guc_relay_actions_abi.h"
>  #include "regs/xe_gt_regs.h"
> +#include "regs/xe_guc_regs.h"
>  
>  #include "xe_assert.h"
>  #include "xe_device.h"
> @@ -581,6 +582,11 @@ static int vf_get_ctxs_cfg(struct xe_gt *gt)
>  	if (unlikely(err))
>  		return err;
>  
> +	if (num_ctxs > GUC_ID_MAX) {
> +		xe_gt_sriov_err(gt, "Out of bound CTXs %u received\n", num_ctxs);
> +		return -EPROTO;
> +	}
> +
>  	if (config->num_ctxs && config->num_ctxs != num_ctxs) {
>  		xe_gt_sriov_err(gt, "Unexpected CTXs reassignment: %u != %u\n",
>  				num_ctxs, config->num_ctxs);
> @@ -607,6 +613,11 @@ static int vf_get_dbs_cfg(struct xe_gt *gt)
>  	if (unlikely(err))
>  		return err;
>  
> +	if (num_dbs > GUC_NUM_DOORBELLS) {
> +		xe_gt_sriov_err(gt, "Out of bound DBs %u received\n", num_dbs);
> +		return -EPROTO;
> +	}
> +
>  	if (config->num_dbs && config->num_dbs != num_dbs) {
>  		xe_gt_sriov_err(gt, "Unexpected DBs reassignment: %u != %u\n",
>  				num_dbs, config->num_dbs);

