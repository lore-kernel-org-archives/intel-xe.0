Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E340CC67861
	for <intel-xe@archiver.kernel.org>; Mon,  8 Apr 2024 06:02:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EE2F10ECB1;
	Mon,  8 Apr 2024 06:02:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DcVOGagu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54A3310ECCA
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Apr 2024 06:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712556169; x=1744092169;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=2CrRMNIfweWf7oRHF4Dp8Iy8MXZocFK2OlfZDhfvD/M=;
 b=DcVOGaguzrPMMfNNoTtvTSOpw9fnyPnmMTnJHIMrVm/1XxMMRF7cfAju
 WodfRqDprAD1C+fZWmSZy4sjHwV50Lgr7nRtIMSi/Ql2Pdo2aBlfJPE17
 CJptia7Z/yqihwBhAt7AbiyWH6+XYa2CNXQVErRwxu2CLVE+dxd/tlGZR
 WpB2HKq96Hye+l2Y1ReOc7iqKg0H8B4/m35vld9/KYsXVG/nEpqH9AFz8
 Fv2u9XwGQ0tSu01CjQha7cZFCTVIOFueLze62BFyKwhHZKhpm5APhtSlz
 LBhcPC6nAu+pNpen6vJ6x3us77mcxVpVn+5kcTIxyecMj91tS36+TgLuI Q==;
X-CSE-ConnectionGUID: waKq+xkdQpaqZlg1FpTzNg==
X-CSE-MsgGUID: YXOKuyLKTFi61cjA1eHNLg==
X-IronPort-AV: E=McAfee;i="6600,9927,11037"; a="19186785"
X-IronPort-AV: E=Sophos;i="6.07,186,1708416000"; d="scan'208";a="19186785"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2024 23:02:39 -0700
X-CSE-ConnectionGUID: Jp7bqr38TP6um6VbShxH6w==
X-CSE-MsgGUID: udPG2rwsQqakSfNBRS25Dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,186,1708416000"; d="scan'208";a="19862641"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Apr 2024 23:02:39 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 7 Apr 2024 23:02:39 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Sun, 7 Apr 2024 23:02:39 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Sun, 7 Apr 2024 23:02:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l/CWQww779i7lGeLkZzGRKLHQiu4vFhjdJaBVmE/JtTqdGkVAT1w54QkHUJO12TOvEoaKBFEvpocuHIEXH6ZiGGAYVq9yaQ0WJocTmM77496c0wt2APbH4LxVJJ31lIDdGsrL8lF4hNZnsJwOCDq7SziHvdU4ny4KTRF49K+vNW1ZNnyPeiIT4qSusRKbXZsCJ6+ahjiNmnry9NOWPWE+r0LSolufaSWgqJa8PVvsowzHhm3gVFEJA2x1MhwHDZ2c7JnXMyolcoGxs7Uw2XHQ9bm4Rlku2goRv6v+zQk+S6kwVPLifBet50yTKz4KSACOKPoL730+sscZ7mQ5paETQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BoJdmZjoPV3q11P5aCsxNH9SnRVT2uWnWtGcTMDkObA=;
 b=RJuacxDRoOC14xDznKtHGYhntphS8jmdFS4GlR5w6bRfOtwJxORXb7BgcOhrR5J+ZxqpByCZ7+57aqe6Sia4NS5QtZGfZ9IrYFu9soBWNY+01qtMN8fZu41L+Q8hY0JaCWJ3dBORcq+NXZlm6cozDG+WoBY3sT0b+hlPIKbcpnYI9LvnjF5nWqKkplwx6XTgcT/sxkWffpkDAHM1u1Ol3zn2WbPjn9emFmtPzae9f07W2fmJ4lVZ7CyWHf3QjlGFFsduroGA2HU3DmftHNzDG3yW9lZO07F9ToNflFJX+zs0C+drEQZbhj0zXlPLNnok3logOCO9ZQwUh1HZt3DbVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by CO1PR11MB5090.namprd11.prod.outlook.com (2603:10b6:303:96::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.22; Mon, 8 Apr
 2024 06:02:37 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::8664:8749:8357:f11a]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::8664:8749:8357:f11a%7]) with mapi id 15.20.7452.019; Mon, 8 Apr 2024
 06:02:37 +0000
Message-ID: <8e6d7f1f-716d-43fb-87ec-537d87570fcd@intel.com>
Date: Mon, 8 Apr 2024 11:32:32 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] drm/xe/vf: Don't try to program MOCS if VF
To: <intel-xe@lists.freedesktop.org>
References: <20240405133936.891-1-michal.wajdeczko@intel.com>
 <20240405133936.891-3-michal.wajdeczko@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20240405133936.891-3-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0081.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:23::26) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|CO1PR11MB5090:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5DaOBsCd2fJNEplbHaufD3EWJxSeU8vlicmAQ7gREayGAZwib2atjzoTsg+ohROd3YDLznXDpgatv1Ed0D4MVKXq7PG+xAemkB7ockW2GCh5qR03yFlnFBzSoWeR6uqttLZ3vXk/qIw1q+l2pt9R4BZSnWu0PjCHPmGU0qyw2Blupph6WsrvynusSAQUphIsNS3oJylpQ/J98poSm8AV8S1dZRjgCvUo5EqITXu8PgWq2w55ek/vUL8bCum1cbozK7zC+BvzCQZfjPossF5tJDn9LVrZ48ZWAxsqAkPeoOltQXiFLcDTw7xdYfVyUdi3xdS566so5fL6208qEzcCvfmLzpx3Bxid3aQ48krXaxdmSLBmDD5sqxX8qG6K76KsxzzIDQri0GaMhZpJVPMDwiic8Rh1YR0+u6cJ4DYnXkAspx3BQ+lif537GkvaRpmSYed321TNK9NquALQ2oabo/Use7xp8Lw2VNyqRUY6zQVZRnOgJn71OBdyYebyzRDbQKsYVdt/95HOebFhtybUFOp9MP0RM7MjkWAjwsjKo8lIAm4yXESu85Rmh0dqnjsX14ikEcAh1KZbWImyB8fbz85kqQB8nM+kdoS/G0KRo6E8WtkLlu5FNnDMSFke90eKmIwPknEnCPgXmj5AG+awLJSKyMPzk5aGwKQacJYZUkA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VVlnL2hqRnBKc1FsUlpBRFllZFY2NUFrS3NkT1UvMjhtdnd2cFRlMHhBOXpM?=
 =?utf-8?B?YTVranREaVVGekVQbUsxRmZMcDArL3hEZGFSMjgrK2I5WjQ0YnFLZEFtQ21E?=
 =?utf-8?B?UnVOc3c4ay9BVUpYUlBxQmF1MVdyMHJoSFkyN29MMEgzbnhWa0tWSzUva29o?=
 =?utf-8?B?dXcrNDVZbXloQmEzRmE4RU9SN2ZmRkNrQmkvLzJ6aDJLSTJoS1ZBZFhOUy9k?=
 =?utf-8?B?bmMxdSt0cW5mQmttYjVweC91UlhzQXNib2MyajMwUkpac1hOTVRMaWJJb2hC?=
 =?utf-8?B?OStyLzkyV3VMa0U0WjhMWlNVbDNkd1d1SzVRZzQwaG95TUJ1bkZVYzhqeFJo?=
 =?utf-8?B?WDV4OEFyUGlXYm9TUUppNWpabC9aT0g1Sk53a1I1VHltOHRpZThjd29pTndt?=
 =?utf-8?B?Ynh3V0VUbW9mbVJNS2huUGVMdFJCbnV3UGQ0aEtqdzF2eDVrQzFwMXdNcVZO?=
 =?utf-8?B?c0d0U056cEl4ZmpUTURrTnBDQnJiQWhyN2o2aXQ3TWhSZWdPWEx2NjJUaFlO?=
 =?utf-8?B?REQ0QkVCQnJvS2IwZU1Dbnh3MjVNTDhmK3FvRy9xcEZuOGhTdHdEOHQ3cC95?=
 =?utf-8?B?N2hsTUNqem1XQW1BeGRPdmFrYU0rT3A0SDN3b2pQQU9zSU1sNUdZOWIrbEdx?=
 =?utf-8?B?SjFBdWFWcy9RSy9kLytFODVGUXdPL3BMajY0U25rQjRZcXp4SmUvQk9QazYv?=
 =?utf-8?B?NFlRK2RicHh1eWM0NG0vdkcyRW5SZjN5N3djb2lwYi9yVXRXK1oxN1kxaktO?=
 =?utf-8?B?VXUrdHF1ZUowQldaQWJ1S210cCs4OGlWNVd5NWxPNFNRdFJkVWpYU2lIeUNY?=
 =?utf-8?B?RVVjdjZERDUvNjh5WllpU1FYTE5IMXArS3FkUzBOY3dQQjNNdUsxVUY3aUdQ?=
 =?utf-8?B?WFBmRjlSUmFJZVFYdDlaUnIyYXNsRmRkNktXQjUrUHA0aWwzOEt5K0JHbS9y?=
 =?utf-8?B?NkoxTjlOOFIzMXFoZHJJcUd2UFozcFZqUm9ST2w2M1BQK2p2ZExBSzNnelYw?=
 =?utf-8?B?YzJ6VEwyUStQcWZ6dENlU3U5TWJhWVczTkdGenpsVXlCdkpvaXVBdG9SQ3N1?=
 =?utf-8?B?dGk5L0grNWpWQ2ZxNHpKOFhjd2Rpd0Y3N0I0dlNZdXR2RG9veU5Zbzg1ZFRo?=
 =?utf-8?B?alN0OE1MWjZmWitoY2pqbGZQenNFaVQyeEJxaWs4U2RFeUMrSjBDcXN2RmtQ?=
 =?utf-8?B?cjRxSGNnQVVIcUkyYnZBV29iVnlMR2QvSlZHSHRrSkpENWpPTXNQRW5DQ1Ez?=
 =?utf-8?B?MDltMjMybVB2WFlTQWtDY2ZockxtRWF1REJ5S1VGR3dWUUh5WTcxblprWnNE?=
 =?utf-8?B?Z2pVLzVtL1Q1TnJxSnluY2p0bmRVaU13eHpOMHVXY1E1Um81dWtnN0h4RytL?=
 =?utf-8?B?YXU2OE5WK1h4Z1J4UDdwYWJaWS9vU04wWWVDWWxpOUlMV3dYTjRVc205N2g2?=
 =?utf-8?B?dlpqSUtJenl5dERYNG9yNklVVmpaR0ttQ1ljUUxxN2NVRTJtU1g4U2diVDdL?=
 =?utf-8?B?dWhWUmtVeVRWZEtXYksxM1RFdWdBcTMrWTJRaFc0WStJU3luSXh2V1UwWVJN?=
 =?utf-8?B?bGdBeVVnTFFyVERYZ2JuQXVwQm1JQnIvMmFCakRzNGVnSE9FYjVlUzlUNEpJ?=
 =?utf-8?B?RlBTNFhDZDc3Z0lnQnZjeklIM1ZOYlBNUEk1bW5qdGgwcTdxZk00MlFxeExZ?=
 =?utf-8?B?WnczN0NZSTVva0xtQU00ZVJGc244WGEvamJ1dC9WSndlcDJQcHNNY05KWnVW?=
 =?utf-8?B?SExiUk5oQmtQNGlQR05rN05MTWZGcjFjQW4zeVdtWGo3bC9COVBva2xFT1lP?=
 =?utf-8?B?T3lWb2VNZktHVU1mdmJENU0yWjdlcEM2UGZmb3FKTG1mdjZjMnRtZ0JzYW80?=
 =?utf-8?B?UkptMjVXbFNXeDM2MHIyaFl5dVIzNXNIbWtoOVVHaHJXaTFqU3Iyc3hWaGdS?=
 =?utf-8?B?emJCRkk0Vjl5WEUrQlV6ajlNMU96S0pOQ3ZReW9ERWNDeFBDN0phMVJWc21O?=
 =?utf-8?B?d25OZGpoSlkxMDArZkg3cUpJaEJHVGR3aWkxb21SbDgwOEcwY1B2UmVrc1M2?=
 =?utf-8?B?Zkl1dm1Bc0YyNHJQS2MzK0hiNHhmd3FSdlVVa09ESExFdVlSU1poa0grZ3hG?=
 =?utf-8?B?Nlo5eDBvaGFmTVdJa1orT0l0c0EzcThPY2NTOE9SQURPRDg2QnpWay9LeGVt?=
 =?utf-8?B?NHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 502a52fd-6d59-4b3d-65e7-08dc57917da9
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2024 06:02:37.3038 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YD3/6Xv30mXqwwdoR1xX6rtXrfYvrwN3D550bq5GR4WHOfJnXyUv4E2LYHM9+2xlDNjsRRDjeZlzg/Ht4Wx5WqphyEyzWRZwuydwshM3Z9M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5090
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


On 05-04-2024 19:09, Michal Wajdeczko wrote:
> VFs drivers don't have access to MOCS registers. It is a PF driver
> responsibility to program MOCS according to the HW team guidelines.
>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_mocs.c | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_mocs.c b/drivers/gpu/drm/xe/xe_mocs.c
> index bff659d20062..d16fa64da881 100644
> --- a/drivers/gpu/drm/xe/xe_mocs.c
> +++ b/drivers/gpu/drm/xe/xe_mocs.c
> @@ -568,6 +568,9 @@ void xe_mocs_init(struct xe_gt *gt)
>   	flags = get_mocs_settings(gt_to_xe(gt), &table);
>   	mocs_dbg(gt, "flag:0x%x\n", flags);
>   
> +	if (IS_SRIOV_VF(gt_to_xe(gt)))
> +		return;
> +

LGTM.

Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

>   	if (flags & HAS_GLOBAL_MOCS)
>   		__init_mocs_table(gt, &table);
>   	if (flags & HAS_LNCF_MOCS)
