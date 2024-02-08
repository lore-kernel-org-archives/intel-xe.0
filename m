Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE12EC48260
	for <intel-xe@archiver.kernel.org>; Thu,  8 Feb 2024 18:06:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C92510E9B6;
	Thu,  8 Feb 2024 18:06:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A6JZ1BaN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C152910E9B8
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Feb 2024 18:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707415577; x=1738951577;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=aRtN7PC8HrXmF/n+D0zkJEi4xHOmsE8RpGB1cI9nX7s=;
 b=A6JZ1BaNHHtt0FBu+icFtkCUWSOIarOFZjhygc8rVIKcGdkGO8RmqZHT
 UknnqVzq2I9cdDTpy9TZxceJ861A51oR1ygY+MbgYuV6Q0WJuySMVQbsz
 6eAYOENEejlPdvr14EHiDICmCETjdchxxZWMnngqg0j1TDApGw1iTNqCA
 EkjrvDSyalPMi3EwZGXMXIgSXNgUjGUjB7c4sQDr7OL+z1ELwMHgDsvV1
 xtf8w5CSA+SwoZpubCdbfIKWjYmVofXco23wGewEPGLq6KzC5Y7+RypNV
 PKEag7YkrFa9txSVuhm+rF6pObADLNy94G/Fuo6FaE0RxcVtJRiuT1V3W Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="436415778"
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; d="scan'208";a="436415778"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2024 10:06:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; 
   d="scan'208";a="2094097"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Feb 2024 10:06:12 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 8 Feb 2024 10:06:11 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 8 Feb 2024 10:06:11 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 8 Feb 2024 10:06:11 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 8 Feb 2024 10:06:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=goCjLp/MIgpu9FlKf6xkYQcivsMUDieKurEh2vSgZvuJon5kHhaNodk69xeYNEkZEzOyK/Qfk4rD3kGdwf9tSX5wVAmpeg3Zri3p7Feueem0gBUe8jrK/F35LVg067MP9q+NPCikxOryRE6z6d30/NT2X5X5SM5Ud1JAvd1DZHddIwE2T9N+4pE1gco+64bpFWGk6A5YTrBj8rp61DewkA5nTx2j6GSNcbLE3Fgm8klsIPp6SAw6SzLVK5orj5Ng7DWdg5U5OoG7uBP72jIa6L0LiSYA/8lmGn7TYKydqqRs4Q/3KnygXKd8kSsn+BVGy77NrbnEMdc/yQwUIJptHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3OdGePnFW+tuiJwYcznRj2RYm51a2IAyPdlF1FwGxgE=;
 b=FEr7gBHWF7nGQH9SX2iyajotNDQQyWocEwNT8QCwUwTizAMJDN0ZmDm0OeIZQsHyuyGQswIbP5jyvMWuBrwnrGB3NBSIrbLDklTSdQ5x6d69hMXDRQtm3H7YJnV14FC5IrJi1Zkg+Gq1prjh7YSrRsqnxDCJIoJyKn3yfeOxZwRwASIiAU09g6hhHpM/vg+0YbXrp4+bpFPA5wQE2YJDThsIIlK93hEHejCLyz1gyNNmiQ1vyumJ/GbSTW1fAk4OLoyMHEKvYtOGC6MJyLbpptqpS/lZ6X2B60QWodIIJknUZwTFaRlG4nuacODB4L+oxxEUIpIG9fFnObjVFHOhgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by BL1PR11MB5224.namprd11.prod.outlook.com (2603:10b6:208:30a::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.24; Thu, 8 Feb
 2024 18:06:09 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::c590:37b4:ad48:cd0f]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::c590:37b4:ad48:cd0f%3]) with mapi id 15.20.7249.038; Thu, 8 Feb 2024
 18:06:08 +0000
Message-ID: <860fc584-567b-45a8-a889-9de9a4b73d54@intel.com>
Date: Thu, 8 Feb 2024 10:06:05 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe: Add uAPI to query GuC firmware submission
 version
Content-Language: en-GB
To: =?UTF-8?Q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Francois Dugast <francois.dugast@intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>
References: <20240207181412.96548-1-jose.souza@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20240207181412.96548-1-jose.souza@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0265.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::30) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|BL1PR11MB5224:EE_
X-MS-Office365-Filtering-Correlation-Id: 52205f75-6495-4335-6f26-08dc28d0a044
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QZbYCXdI4pH0j277ZyTeGhNSMFbEl1P7bar6C5w+5+4gIOa7QM+i7WUQwZe1m3k0M3r17z6QW92rmcJS/q4+qi77VA0AMXCm9RAO9KPPfRWem3SFaTRaXKnkBW7MzvMDbSpFfK1GqOrMSvO1/rFmszgCO44MV1Gn9vKTUXScJIYn6eT4eDRcbVPBFh/ydjhU8RUa3cT7274Hs8kVhDKUuCBrt7y7wTwhOMZpOqpOTX5v9jSQpTCeGYcD6yp9oKNRfGvCNlV4PMRbn91Jkj3ocn01dKaOJHegcETFHRY47TxmIcznKzQnLbhvndQxLksGumAUdX9svCyy31AaV1+AShNEKAcSfge8FDtqUbLF/rs4OqLSA80gqcEOJcAeZZNMzEYzClK8DsRD+mGnVeGBS27IE8AXAGj58KbP1YEnApN1kJyX+/3uFFqwwSLOqzHa2G77cJCaz3vN33deyd7tjMjJedlk+6asXYh4jW3rUipEXfdhGIQb1j7i1PMDPjFY/99GpsDag8EfZuWFzhXNRCyfGOdPBg1Dr5YpXzPE4ai4aCqeSetMCYmlSzJs5wwHots94WnF5TxxdPYBbA3ofA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(136003)(376002)(396003)(39860400002)(346002)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(82960400001)(83380400001)(31696002)(86362001)(107886003)(54906003)(38100700002)(966005)(6486002)(478600001)(26005)(316002)(6666004)(66476007)(66556008)(66946007)(2616005)(53546011)(6506007)(6512007)(36756003)(41300700001)(5660300002)(8936002)(4326008)(8676002)(2906002)(31686004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aUREeG4rVmZiUFhwdHgwbmpPSGlQSUJYNXpvYXpMZmFMdWRWRzRCVnpSWmJN?=
 =?utf-8?B?Mnh4cGF0ZU5ubWh4R2ZJeHd3WTFhVFY3b2hJSzhSQVZheEtjbCt4RDBodkli?=
 =?utf-8?B?QlNic1dyTklrOGgxcVhaOEJBeWppSWVJdWxVVWs2SDh2Y2ZJWlRsOFBIenlm?=
 =?utf-8?B?QnRWb0wrZS9GUzJheDFIOHBGbmFBWGYzcWhHV3hVTmg3SUhkZzUxUjR3VEZI?=
 =?utf-8?B?YnVSVWVDaGlONnVadTBnd2JFaDhXcVFwWmNkb0tpV29zWC8xU3RmMkppbE01?=
 =?utf-8?B?SUovK2NDdEdkRVp3ZU94cUlrUkFSWnYwRDZkUDdmRWJmVGwyWDh2NThxR1BK?=
 =?utf-8?B?Rnd2YVhYS2xXWW5hT2xSWFRPV25nd3J4N1FpeiswNzVoamlrSzhWbWlhMktY?=
 =?utf-8?B?eG8wMmhrQ1dybU5kV3g2R1RzNlhrczQzTkp3QUw4YmxteW5UY3Vna044VmMx?=
 =?utf-8?B?RmZycTF6NDNvMm91ZjFJWE8vYXFkTHVydmZDZkxDSUFsMHNZM3dlREo5dnA1?=
 =?utf-8?B?Uy94dHpTd1dLTHJtQ3NTdmpOOWhsUkwvekFwSXZ1Y1pUTWU5bWF4S0k2ek1G?=
 =?utf-8?B?a2oxQ1hXbXpjbUtYQitzdFo3WWpyUTEyZnhsK1pmMXVVYUFrU2R3NlgyU3dS?=
 =?utf-8?B?VCtWMWFZd29xdjZrUVVZcUVnN0hYM3V3YTFCdnpjVWt4NkFKeCtUa2Vpd29T?=
 =?utf-8?B?Uk14MmxJRWR2dWQ1TGM5UTM4bnV0bmZ1SEhaSlU5eVhUTnVzV0p1ZXltSFcv?=
 =?utf-8?B?ZlBuZFNNM09CWkQ3WjFNVHNjV3JSbHQ1UHFmYUllK1E1TlVNcHIvTGRrYWhK?=
 =?utf-8?B?MmhWSHFscUVGOGxXOWVmS0RTTjRDK1YrdXlNdmtCRHVEWEhGTHgvbVhYM2hH?=
 =?utf-8?B?OVh5TTBOTlFMeFN0WVJGSms4M2drU21WVHEydkZwaFdDdVduTmVuV1QvY0V5?=
 =?utf-8?B?aW5nOERYcWM1NHc4TE9mdkpSbUhpdUczd0tLa2tZMkEyNXVEUVVYRkRHc0N0?=
 =?utf-8?B?Z09wSHdQTWlDSE84MHJtZGNEeDFTaDNndldMWEd0aTdCNUIrZUNZQ0QvZ1N2?=
 =?utf-8?B?ZDZWMWpjQm9kMTVhOGFVMnlMV2JWMXYzWmdtUGZoT24xR3dybW5CTy9Udnox?=
 =?utf-8?B?bDRmSXpqREpwMUhsVTNYSG9TV3ZZeXhYZUlEbWI0dWVkTWNieWRrOTkvTnMr?=
 =?utf-8?B?WnJQVVdWUDFTR3UrS2FIZGJQbzU0OHZoVlpGVTE0RWRmQTBIUmVjbGErY3lZ?=
 =?utf-8?B?QWF2OTN0V2RmK05XNm0wcFB1YklxTmdIRXdkL0NNK2NqNjlSOUx1MnNNazh1?=
 =?utf-8?B?ckx6U1FZZXVRK1c1dk9zL3VqbVY1aFBDMkE2WEJoWkJ1UGcxaC8xNld5Q2pN?=
 =?utf-8?B?Qld5SkR6NHFENC9LRDVCNWU2U05yTisxbVhBYXVpR1gxR0ZsRXIvQ2I1MEtV?=
 =?utf-8?B?YkpyNDd1ekxVMHJ1b1oxZ0JMZDRwSXlUaFNCRW1FMDB0ZEpQMVNBKzBSd2xB?=
 =?utf-8?B?NEVvZi9DTDRFdzFTU3NmWmxUY29vRzN0aFR4MW15NEpXcUZOVEpaVmQ5OTJt?=
 =?utf-8?B?aE1oRU5wVkp3dXpFZHdINE1POGxxS0t4VE5PaWk2NzZYWTVhMm10WHlBMXh0?=
 =?utf-8?B?VzJXbWxtSnd1SGVNL25wdUdQdGFhcFcxRlU1bDlqM2Z2S0JSN01jSURlNGNs?=
 =?utf-8?B?bTZrVFVpKy9QMFdnZ0VRelRlWHpqUmxyUlVwY1JlWEdiVExyY2FHWGg4bzg1?=
 =?utf-8?B?OGhFeE5EeThmOU1lZ3c4Y2sxRTN2SEI1ZFRheEJKYVJzcW9QVUZjdE5MbGZU?=
 =?utf-8?B?WE5LalFQUHJDelBxbmUwQ1h0c3BTdDZGUUQvYkJ6VDhsbHZHMnAwZzJ4M3F4?=
 =?utf-8?B?aEtsMHFkak9BU01xK0lrc0ZsdTRHWi9FM1lzQmVhMnJGTEF1MHpjc21ucThu?=
 =?utf-8?B?eCtIallId1krNVFMZkRBVnpRVGRxRm5RUitwVGFZcUh4U2ltT2JlcWVVbWY1?=
 =?utf-8?B?aXgxeEIxaUV3U0QvVkgyV01hd0E0V0JXZFRhb29JN0VNaVh5Wksrc29ZWnVo?=
 =?utf-8?B?c2x2K1EyK0lWODlMbTY0MENBTFA1NnVXZXp2dVlUc1A5VjBsTHBKZzhFcXhT?=
 =?utf-8?B?Mlp4NVdFaUFSZ3pvcG1ETmxaZmlla012bTZuN3VZNGl0b00wSC95S2NveEpB?=
 =?utf-8?B?V0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 52205f75-6495-4335-6f26-08dc28d0a044
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2024 18:06:08.8513 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BzjhV/5SQSTF1cuh6uSVbUCHQvzs2UChyem0hzeKZnGtvQDC0bCPo8BuglEc2T39bNgLWnzvtvQR+zDkdyRZGjCwH67IvZ1ncNsYKDquY5Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5224
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

On 2/7/2024 10:14, José Roberto de Souza wrote:
> Due to a bug in GuC firmware, Mesa can't enable by default the usage of
> compute engines in DG2 and newer.
>
> A new GuC firmware fixed the issue but until now there was no way
> for Mesa to know if KMD was running with the fixed GuC version or not,
> so this uAPI is required.
>
> It may be expanded in future to query other firmware versions too.
>
> This is querying XE_UC_FW_VER_COMPATIBILITY/submission version because
> that is also supported by VFs, while XE_UC_FW_VER_RELEASE don't.
>
> i915 uAPI: https://patchwork.freedesktop.org/series/129627/
> Mesa usage: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/25233
>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> Cc: Francois Dugast <francois.dugast@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_query.c | 44 +++++++++++++++++++++++++++++++++++
>   include/uapi/drm/xe_drm.h     | 31 ++++++++++++++++++++++++
>   2 files changed, 75 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
> index 4f1ab91dbec58..a912ba58eeb8a 100644
> --- a/drivers/gpu/drm/xe/xe_query.c
> +++ b/drivers/gpu/drm/xe/xe_query.c
> @@ -516,6 +516,49 @@ static int query_gt_topology(struct xe_device *xe,
>   	return 0;
>   }
>   
> +static int
> +query_uc_fw_version(struct xe_device *xe, struct drm_xe_device_query *query)
> +{
> +	struct drm_xe_query_uc_fw_version __user *query_ptr = u64_to_user_ptr(query->data);
> +	size_t size = sizeof(struct drm_xe_query_uc_fw_version);
> +	struct drm_xe_query_uc_fw_version resp;
> +	struct xe_uc_fw_version *version = NULL;
> +
> +	if (query->size == 0) {
> +		query->size = size;
> +		return 0;
> +	} else if (XE_IOCTL_DBG(xe, query->size != size)) {
> +		return -EINVAL;
> +	}
> +
> +	if (copy_from_user(&resp, query_ptr, size))
> +		return -EFAULT;
> +
> +	if (XE_IOCTL_DBG(xe, resp.pad || resp.pad2 || resp.reserved))
> +		return -EINVAL;
Should this not also verify the version fields are zero filled on entry?

> +
> +	switch (resp.uc_type) {
> +	case XE_QUERY_UC_TYPE_GUC_SUBMISSION: {
> +		struct xe_guc *guc = &xe->tiles[0].primary_gt->uc.guc;
> +
> +		version = &guc->fw.versions.found[XE_UC_FW_VER_COMPATIBILITY];
> +		break;
> +	}
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	resp.major_ver = version->major;
> +	resp.minor_ver = version->minor;
> +	resp.patch_ver = version->patch;
> +	resp.branch_ver = 0;
> +
> +	if (copy_to_user(query_ptr, &resp, size))
> +		return -EFAULT;
> +
> +	return 0;
> +}
> +
>   static int (* const xe_query_funcs[])(struct xe_device *xe,
>   				      struct drm_xe_device_query *query) = {
>   	query_engines,
> @@ -525,6 +568,7 @@ static int (* const xe_query_funcs[])(struct xe_device *xe,
>   	query_hwconfig,
>   	query_gt_topology,
>   	query_engine_cycles,
> +	query_uc_fw_version,
>   };
>   
>   int xe_query_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 50bbea0992d9c..52a69a6f327e0 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -574,6 +574,36 @@ struct drm_xe_query_engine_cycles {
>   	__u64 cpu_delta;
>   };
>   
> +/**
> + * struct drm_xe_query_uc_fw_version - query a micro-controller firmware version
> + *
> + * Given a uc_type this will return the major, minor, patch and branch version
> + * of the micro-controller firmware.
> + */
> +struct drm_xe_query_uc_fw_version {
> +	/** @uc: The micro-controller type to query firmware version */
> +#define XE_QUERY_UC_TYPE_GUC_SUBMISSION 0
> +	__u16 uc_type;
> +
> +	/** @pad: MBZ */
> +	__u16 pad;
> +
> +	/* @major_ver: major uc fw version */
> +	__u32 major_ver;
> +	/* @minor_ver: minor uc fw version */
> +	__u32 minor_ver;
> +	/* @patch_ver: patch uc fw version */
> +	__u32 patch_ver;
> +	/* @branch_ver: branch uc fw version */
> +	__u32 branch_ver;
The branch component should be first rather than last (earlier 
assignment order should really have branch first as well for 
consistency). If the branch has changed, that trumps everything else. It 
is a full reset of major/minor/patch back to 1.0.0.

John.

> +
> +	/** @pad2: MBZ */
> +	__u32 pad2;
> +
> +	/** @reserved: Reserved */
> +	__u64 reserved;
> +};
> +
>   /**
>    * struct drm_xe_device_query - Input of &DRM_IOCTL_XE_DEVICE_QUERY - main
>    * structure to query device information
> @@ -643,6 +673,7 @@ struct drm_xe_device_query {
>   #define DRM_XE_DEVICE_QUERY_HWCONFIG		4
>   #define DRM_XE_DEVICE_QUERY_GT_TOPOLOGY		5
>   #define DRM_XE_DEVICE_QUERY_ENGINE_CYCLES	6
> +#define DRM_XE_DEVICE_QUERY_UC_FW_VERSION	7
>   	/** @query: The type of data to query */
>   	__u32 query;
>   

