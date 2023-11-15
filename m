Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 344F7C2BB3F
	for <intel-xe@archiver.kernel.org>; Wed, 15 Nov 2023 22:34:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5F0810E295;
	Wed, 15 Nov 2023 22:34:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B90710E295
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Nov 2023 22:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700087686; x=1731623686;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=8El73+fzZ82Op2keLMPBautUJTMrFIgEnFwroS+ZqI8=;
 b=Bh1dhLKqrrg743vfjfqCetpo+cuEZsQzaVEofIZj9Djl9IDdfDhffahO
 3dsqGpfyp+jCeMT1KOv9AGxXqfcSBHZ2yMQOYfdN2394Jf2rOB4JqEGl8
 nrbPECwglY2KWkr+1T8AJR3M65E8PObCD36QJU9yiEnKnpuzUu98tOyuc
 ox8dkq6ONwHply7MLLq3lN7syZOwG8ZwDKxXTxY9LCMWSbrvQAtrZwdQ6
 RAdsK2ZQkxF6TDWTxfYh6SBlIN2/lEYEvgIbO3U2zcVBBH/ATW4p2GKsZ
 ZjHEwwCR9gqIZ/GSoEwkJO/8xfcIWMGQpYcRX6ktt8XSDx1IpighSfd9f A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="4090235"
X-IronPort-AV: E=Sophos;i="6.03,306,1694761200"; 
   d="scan'208";a="4090235"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2023 14:34:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="831069277"
X-IronPort-AV: E=Sophos;i="6.03,306,1694761200"; d="scan'208";a="831069277"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Nov 2023 14:34:45 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 15 Nov 2023 14:34:44 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 15 Nov 2023 14:34:42 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 15 Nov 2023 14:34:42 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 15 Nov 2023 14:34:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T8oTSahLgAZ+ssUO5c4SRoR8PwdygMRpjGlac19xBao3jQy89UzqLF/U/4Ma5Cm2dMWITJimMZA27C5NXngVLieC4T6Nmj/axTPYJbzNBYM4Ph3NXfRk8K+0Gn7xGjxsvZYSr99GIcI0vxYwBDqcswo5LripBI/2SgSP+niCDRawkIPBBU3CjCsBlhx1MPavvXM9uFumix0YdVfXX25gfScoElmD766u57IX+lUbddwRQjZVGG0cQDD37q8rv30QaRy5q6y6IHPw6DokvAXMhaALpIw7wmnrfDXUuHYahSNEJIO8QxrKNIzno53WPpEs/24u3VDCltYF6rXjLnUPpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O2O9CyqOE5SifW0MqEoL4Cn59VfpUZUQTPrR87/D0Ew=;
 b=GXgkM6r9MZCcqsZiL6/uIlbtY1Btvdc8bCh9H+XEdgRbTzin8IbXFw+Ekw9t0KEUUpW7Sv1SejVhc58zgLfm+LFv2w/ZSQZ+zKl71u7ZvTIDIa3w0oeLNaZ1Dazf4zDV15t0rJkAbYS39v7mTBwkohds/xLTouyYL44t9LHxe/5gQQyDpVI65svvCQo4E/yAGx0fkoalVFbhYFZAE1rzq/OfZd+1jdy3ztwh24x6wEMsqmOIzLvuncF3UmDM0YDESAXS2E30adLY7n97t4rkXuk3K5LY8xcl6Y31qKAd889iubcGXmH+c3FDjWlFfXDok1fw5ILNlBp/NEZNDwWZ3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by CH3PR11MB8344.namprd11.prod.outlook.com (2603:10b6:610:17f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.29; Wed, 15 Nov
 2023 22:34:37 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0%7]) with mapi id 15.20.7002.015; Wed, 15 Nov 2023
 22:34:37 +0000
Date: Wed, 15 Nov 2023 14:34:34 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
Message-ID: <20231115223434.GS1327160@mdroper-desk1.amr.corp.intel.com>
References: <20231114130231.2299661-1-michal.winiarski@intel.com>
 <20231114130231.2299661-16-michal.winiarski@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231114130231.2299661-16-michal.winiarski@intel.com>
X-ClientProxiedBy: BYAPR01CA0025.prod.exchangelabs.com (2603:10b6:a02:80::38)
 To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|CH3PR11MB8344:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f1824c7-9b90-4b92-ed2a-08dbe62b0c46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VtFe9LE+1O3UaFCC6io4KhQcWuUBIcNGt94jRGQVu4cqzslVKfTbPhnYJjypyMr1Zvg0WViP64O2qoYkhru/68KzsryndPZqjBWYU9K7wLLmEqGoGJh8+9z64/RyUT/9GiyvJH4tyjH3bSW+YN9h9tNoDwiMdX5V43w4xbX4fUWGn5DKyeMd+uywy92ucktQybPcBHYLmQTWX5R6NBPu9Fr7Xfgp0gk2iT84C+6E160xJSjoCVqOs751oFlo5tNoPiiR3rcmZ0kmICJS/g5DCsA+IWUYrV8tpjJlff2ulF2y49KaFfGiSBN14q3wFt9rDxOveUi7PFdMKenDWGtLtXHa5Rj1lSzx+lDDCwyijwYmuvIGzHDbA1ceyzi3IqrEcxJEdzY1RSFiwd/b8cKunWEe/Kr/p02E+lJZlqZOZtbAYo5bVivZJYsUqRXLDa8TUfGiEuGbYcO0Z9NY95aeZWtmyDOXV6gMSaup4OGmT11eQciLXf3w4/XATmjX6hckQxJaGTSlJ4Tv/3a2oyuqMKhLfBfY9SjxkxfhFCWJVZHVB6iyA/F4MRKNKfvdpKdU
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(366004)(346002)(396003)(136003)(39860400002)(230922051799003)(1800799009)(64100799003)(186009)(451199024)(6512007)(6506007)(86362001)(66946007)(66556008)(66476007)(54906003)(33656002)(6636002)(82960400001)(38100700002)(8936002)(83380400001)(26005)(316002)(6486002)(6666004)(2906002)(41300700001)(1076003)(478600001)(8676002)(6862004)(5660300002)(4326008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WTBaZXpnMUw1alFvNEdvc01KZTd5WEl6enFWUThGajM0MHZuWWo4Ky9oUC82?=
 =?utf-8?B?b0NhZUtVZ0l0UmxEY0Uwd1VFbEdlaVVuODJKc25udjhrQUpFSFA5bitqVjFX?=
 =?utf-8?B?RW01RzBBM1V2d0Z0S1FXajlxZTBHaHpYTW11T3VJc2hVZHZESGFsZFJMcjFh?=
 =?utf-8?B?NkMzdk5CcitHVnU3S1BXSE5SeHV1aWVHaW15bjNSWVFWaE5ZMlN6NTlGMHI5?=
 =?utf-8?B?SWJFbElKUCtDSG1TMmhNZWZhSHRHZWd1emdvNGQxZ0V3YzdENVlmU3piVWcz?=
 =?utf-8?B?dG9WcmxKcDEycXJpZTAvMmtxNGJBRTV2UitXbG9MR2pPVXN2WEsyMlBUclho?=
 =?utf-8?B?eTY5Y2U5L2pIR0VYcjdsTFFmNkhDSVgvRjVqNk96UzE2Mkt3ZnJRVEh3cXl1?=
 =?utf-8?B?T0hTOURuVzZoODJWaW0zQ3EwTEthK0FwMnJVK2U1U2R1ZU9HRFlwODA0RDFI?=
 =?utf-8?B?cHh3NUd0M1NteEFUazJhSzNkTlBHVzRaOEhZbVllNFFPOTJSYis1Q1RxeWRX?=
 =?utf-8?B?bXkyWWJwWHpFVVNqUHMyTTQwRDhZcHZMYWJ6R0dMSU1Hc0daaEIxakoxTFFF?=
 =?utf-8?B?MFpJQnkwblBIUDlIM0h5cmEvWjExcEFwdFQvU2NmeXUyUlNNTW9Lb3Z0UWZ5?=
 =?utf-8?B?V3hrcStoN01XSnNqelFWRnQ2UjdEZFh3Vk9FUTZHVThmbGhJVDR4TmlwdVlr?=
 =?utf-8?B?aVJ6cjdrRGE4K0g2eVBSb0dMZDB4eXNjaFdoWTdabFVCTWp2bVBzcVAvT1FD?=
 =?utf-8?B?QkMwd2NKVmUwdVlVZGlzVUphTnZrdk1tckpEZktzdWpHMnBhYTNEckNyQ0pS?=
 =?utf-8?B?L3IxVEFiT2c4cSs2Z3hPUGVMT1Z0TE1vVmp5UzQ1ekZwelBvcTl5M3NQdHIy?=
 =?utf-8?B?b0hkUWNxb05xeEdEOCtLS2dIUTI2OEMzWjk0NEhHSFlZei83Z0ZoYzBvY1JD?=
 =?utf-8?B?N0k0TjFHRURxN1dVNkFHYjFoSzZ2OXRMYmhCUTdBSENPWEtyZ0dhQTl5WG9F?=
 =?utf-8?B?OURIcmxvNTA4cGIwcjlPWlRramUrRmY0eDl2R3VhUU5INmZGYXh0emdHY3Nq?=
 =?utf-8?B?MFdwTitwZnkrTTI1a1h3SGJ5TUMrc3Z0ODg0TTU5WEcrUGdGbjJmUFBNWlY3?=
 =?utf-8?B?aGZHUDB1ZWVESVdoY0Fhb0FuTE0rMFk2SmFFam9BcGJIenR4cCtHYVZXTlk3?=
 =?utf-8?B?Zzc2dXl0WGpjQkFyT2lJSnFrdll6K3ZtMWVDeWZkYVFnclFlbnRmSlhEYmMz?=
 =?utf-8?B?eThJcDJmM2RERDJtZWVDTmJ5b3FmenBNbFFuTm5FbTg3dFBuNmhReXVQa0Z1?=
 =?utf-8?B?RmVBMm04bFVvRm1lMGdURHhSS3IzYkV6ZFQ4UXRWNFMzeDlML2VoM3huR3JH?=
 =?utf-8?B?RjVGS0JSVWZJaWNwMXZ0RmZiTTZMaWpiYTB4UHZteTlCSWgxZU8ySjR5YXNS?=
 =?utf-8?B?a1NvZ2JNekpmMm5seHBqb1BEazJweTBWZ080VFFzc3RLVVhJbmZlK1o1a3J0?=
 =?utf-8?B?VlBPMGd5SmhzSXNJOC96TWhEa0IrcG1NSDNnRy91M2w5UkVzaW5mZXlmNGph?=
 =?utf-8?B?THQyQ292bFhTVkVUYld2M0QvenhUV2pCQmVkUDZpSUVNNVVraXpGQkJKcDZ4?=
 =?utf-8?B?ZEMzSFlycHY2eDV0TFk0Ym5EOUVpM0JZd2ZmZW5MMERWcE92MGVJOFJrWjBr?=
 =?utf-8?B?bHUxWTg2U2VOb3c4dTdSOXAzR3k1ZkxuT0laSy9VOG0wbnhQbkJ5N09aMmFH?=
 =?utf-8?B?Um1WVFNocFRtVmlJWHFhcWlmRWRwVTNxU1l0Nm14TmxsWWUxVDJoem9GWmJu?=
 =?utf-8?B?NnM2cUIxWXJGa080YVBIY2U1ZG9iN08zNlZWUlpvbUc3QkpMNVlwcVA4UTUv?=
 =?utf-8?B?T1dobEZ3bXM3OVpQcTh5dGJ6SklSN2ErSGhXNWZUdWNrWFBXWGpPbWxPc0tM?=
 =?utf-8?B?WFhLTzJCVTZSREd1R29qUHFGamoybzlzdnNBbUdQMVk3UjBiZDZzRm9lT1NS?=
 =?utf-8?B?RFVxQTFJU1VXUXV5cmV0U3ExZXFoYnl6TEpmSFJ6LzBJcXA5TkVkRnhFa1pK?=
 =?utf-8?B?Mi9ScWlFQ3RFR0w5dGRmSjdsa21CaXkydFRpcDZEZFl6VmFISlZkTFJhUmg2?=
 =?utf-8?B?MWJ0RjM2QS85bHZtYmkvTEJXNjJYb0tkbVBYUmxvaTJTRmtHYkF3MFhJR1R3?=
 =?utf-8?B?Znc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f1824c7-9b90-4b92-ed2a-08dbe62b0c46
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2023 22:34:37.2474 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VnuJVJ1sB3omCR5vs8Fj+PXiCw74JwUt7TPIUrVv8xt8DKU4IFUWTM//dsnXG9fJnhrn5l2P9CpA/iNc4qpyhJshi6xE5RCGdjm78CVYGoE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8344
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 15/20] drm/xe/uc: Store firmware binary in
 system-memory backed BO
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Nov 14, 2023 at 02:02:26PM +0100, Michał Winiarski wrote:
> The firmware loading for GuC is about to be moved, and will happen much
> earlier in the probe process, when local-memory is not yet available.
> While this has the potential to make the firmware loading process
> slower, this is only happening during probe and full device reset.
> Since both are not hot-paths - store all UC-like firmware in system
> memory.
> 
> Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_uc_fw.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
> index df46751fb5959..b04dd7d034d83 100644
> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
> @@ -636,8 +636,6 @@ static int uc_fw_copy(struct xe_uc_fw *uc_fw, const void *data, size_t size, u32
>  int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
>  {
>  	const struct firmware *fw = NULL;
> -	struct xe_gt *gt = uc_fw_to_gt(uc_fw);
> -	struct xe_tile *tile = gt_to_tile(gt);
>  	int err;
>  
>  	err = uc_fw_request(uc_fw, &fw);
> @@ -649,7 +647,7 @@ int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
>  		return 0;
>  
>  	err = uc_fw_copy(uc_fw, fw->data, fw->size,
> -			 XE_BO_CREATE_VRAM_IF_DGFX(tile) | XE_BO_CREATE_GGTT_BIT);
> +			 XE_BO_CREATE_SYSTEM_BIT | XE_BO_CREATE_GGTT_BIT);
>  
>  	uc_fw_release(fw);
>  
> -- 
> 2.42.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
