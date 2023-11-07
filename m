Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BC37C4332F
	for <intel-xe@archiver.kernel.org>; Tue,  7 Nov 2023 23:20:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4486310E15F;
	Tue,  7 Nov 2023 23:20:27 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8907510E15F
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Nov 2023 23:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699399224; x=1730935224;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=BnYfzBelBhJIEN9CHiHssHcDkx2ry337zgZurguFMEU=;
 b=ZDQMnnN1oq5hBlLA+yN19osskLJ7OCbJrDnfvp9RccDG1Oc3Bu1hrNF6
 /PNyBvJx9SPNl7ZXAkEoPQOsVYRDqHAWXUmTlhCkb662NiJDNsOS/b/KD
 Fk64FfZUvpyMYWMu5W8uiZP9DZPPqabCJwcG2hVrDw1QP0co0BryendU6
 H3fAir+zC6RQ/wKObV3DdXz6BJE5S45/9V3T4fTT2YvkJuc0C7WmbXAGM
 B4PyOLoarkoS9uHIgJqvZujl82b/iTrL3o/j6V9TnoP/zN62wGuWKUMMF
 SbzZO34DY7z42bOIvwwIKBRkyLrJLH+WjRhKWsfTySwXxI53c+Cz73LRE g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="420750710"
X-IronPort-AV: E=Sophos;i="6.03,284,1694761200"; d="scan'208";a="420750710"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2023 15:20:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,284,1694761200"; d="scan'208";a="10996427"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Nov 2023 15:20:24 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 7 Nov 2023 15:20:23 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 7 Nov 2023 15:20:23 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 7 Nov 2023 15:20:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lj+FoDSL4f96rB8jX6ERoA78IZn7NxiMH0mbftyliKS9OfmeQhY0jUoeYJsdr6xGW3WgwYAfxv46CCqogu4CaYo2Wa389A4g2U9F20npJAc6klAGNtRpugvgLaOo8off1+pti1oFcrPGwG+9N76W9fmS+u6ZzpDogmR3vN/Qm3pKtY6U2TPBCdmkL4XNcBGU5aRzdwC1nwnYDh2bNd1zxqD0bBCBKbjjoh79zedxI6LhSbWgc1rh6yO4mpjUbL3pMTaCEEIjzu7/TZRwSABZQaBpoPRIBFlZxS1dzRi9zmz5aku6S4egFs0c7pv4stn0dClUqSDUPY6DjSQHKUFHXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LqTKcBrnXpli0Hn5cIO67pO7rvtelKaMMwgIhzz5vus=;
 b=GF3nsNloZCfZvaOKm8MbcBvItXrsItQ02nJqZDmmUfoYjFRBd2dv16oi85uwPNB2I3NLjo2wEZlLohVOdScbiIb0RKM+l6qFh7Rgae41e3wEyFv5QvDM7uNao9OHuG6PR+Rb7xMAjADcBEHn6URYe8cjBWjmYQ+CvFOHFcL5vaOGPEfXIaTozlowHtZTv6Jq/m54OwVj4kks+eIF5OdOrzG2wLC4uXNclndfum9r0MCYiTy3xqb3kAYb9PDBQO2k+qUw7Qth6vs3GGxhkxuO8/PiweOnWIv+W4686GIorHc2meQRR62QmoaNzheLdrnc6alFvE+J0uTxDepcgK9VzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by SN7PR11MB7568.namprd11.prod.outlook.com (2603:10b6:806:34e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Tue, 7 Nov
 2023 23:20:20 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::de08:93ac:5940:ec54]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::de08:93ac:5940:ec54%4]) with mapi id 15.20.6954.029; Tue, 7 Nov 2023
 23:20:20 +0000
Message-ID: <7493cfb1-ee66-4752-9410-9876e0c02b8a@intel.com>
Date: Tue, 7 Nov 2023 15:20:18 -0800
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20231027222928.1981633-1-daniele.ceraolospurio@intel.com>
 <20231027222928.1981633-4-daniele.ceraolospurio@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20231027222928.1981633-4-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0250.namprd03.prod.outlook.com
 (2603:10b6:303:b4::15) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|SN7PR11MB7568:EE_
X-MS-Office365-Filtering-Correlation-Id: bf382404-6381-4382-f08e-08dbdfe81c2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +h38p0+3iixSAs/5gy107uNK/rDZmx0nF3VfWrlxLcLJ21hMgHFmg1ZN9wmz7rrG0O01hJBgZF9lipT1/4YjwW8Jc+F7ILt1z3ax+HzigPccH0jLUSxyZnYikRQ3M35tlXq1HUt+NgV50dgPCu9C/trGLUOxCoI1ZqNck4U+VK3MhOodHVqDyp5hN3v/LT4ICNrwvDCIQ479Tkl6lIp2fmVg/tWIiqyYhSRf50VsERS9P9S5SL9AL1eQQDvonRE+LhllZ2MTwRzXeqGYMh+tOV/kYt+jKyd/U/He07GK+voBIY+Vzzr5bbFW+bTqVfoWBkUUydDyyOFL62cyRJqxrylXRqflMw1RTnwN65heeT5C8Dcm66dEApVHMiW1b1E3cSyLoTBYBKH/WQVNShL3oaZyTX7c8HxGRCjILOWJ54ezhn+sUSHAeR8I5WMCRXh0/hrtN6f9aZWNNwNtHyC73t13/uvvzckphMqUdtDvedFrixQ+5J2wZoLb7JgfdZcER9TvyGiElByquxjveeWh8DAmiz4+kpRKV9buxmbL2/WKzqgMoBS0aU8eIpnitaEf/KChxD2vwOHa4TCk0rHTy7EL7EQ66AtgQGEW4QyIYJZqbruxSbMPubwKJkDPBkOSC60aCBDIwRNgGU4mCeQeZg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(376002)(396003)(346002)(39860400002)(366004)(230922051799003)(186009)(1800799009)(451199024)(64100799003)(31686004)(2616005)(53546011)(6512007)(6486002)(6506007)(478600001)(41300700001)(2906002)(38100700002)(36756003)(86362001)(82960400001)(31696002)(66476007)(30864003)(5660300002)(83380400001)(66556008)(66946007)(26005)(107886003)(8676002)(8936002)(4326008)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RXlHeEpFY1JiVDBMdUU0Y0ZSLzJBNjJYSVFHbzBQV0svY0lQR2k3NGdxd2po?=
 =?utf-8?B?M3NGT2tiWDBVRnlLbUhrSUU0NVpaOEg5ek84ZVlDODF2YW1FSUFkRVdwT2xo?=
 =?utf-8?B?bDhKc1dKLzIwV0NSUkI0N281SHRTYzAxWVg4NU1XWDNETDRHdjdDQUN4ckhz?=
 =?utf-8?B?Z1llTHhuYWVDYnF6cGFqMnhYUmxBR3FwR0ZHVFA3VzNOQ3ZOemlVbFFJVVFO?=
 =?utf-8?B?cks5SjhwYmI4ZHlTSFB4bEZlMWN2ZXlIeEY4RTlhbjFIZkdEQSs5ZWVQZXZt?=
 =?utf-8?B?UEwzYTZmV2ZVVEhQTUcyTG50T0pLL1Q5U0ZmSGt6dUpNN2dpNHpOOTRYTEJn?=
 =?utf-8?B?MUtjMlBHakhwbEdSR2NaNVhjdkxBa1prNWR2bkwxcVpkYnRPditCY1hKT2tq?=
 =?utf-8?B?MFZRVDZpN01CT1kreDBPdGJrVUNYRGM3OHNrRXA5YVZIT3pjYXdTaTlSVWVz?=
 =?utf-8?B?azFIRWtJUStvK3RRUGxhelFDb2NNQXFpc2Rrcjg2Vlh6R0tGVlY4N3NvcnRY?=
 =?utf-8?B?YnQxVWxiZXpyL2lsVlhPR1BHdnUxbnR2VUw4RmVjMFpobU1jM2YxcHlRRUJz?=
 =?utf-8?B?bnI0TEVXdDN5Vm9mYnRMSDBxdmo5bU96NmJ4eERMcWFFaHV1MFZua05BYWNO?=
 =?utf-8?B?NUJ3YnAxakF5RVZQU0VUNUpPV05JMnVtSnV4dm05M3owemNzdFQxZlFpckxV?=
 =?utf-8?B?SGxRV00xQUN4aHkvQ1hIZmtocUV3OFU4VW03RUl3akJuaXVWbFlLNE5LWitG?=
 =?utf-8?B?R2lIQTRET2lTV1FnTklPQnA0T2FNazd3M2VmNFQrVUxIc1hDa0x2RXdvMnY1?=
 =?utf-8?B?NGZUaVI3UWdpcFdsaVJFOGFkK3MrSHVNMXVQUUdpZmRkN3ZPa01yTnNyMHVT?=
 =?utf-8?B?NTc3eFY0TkJEdDlsTkNqandtWnJUWVVlMlU5MkQ5LzhNN01LNGNkaXBFV3RE?=
 =?utf-8?B?clVMSTNqQUkvUjRWY0IzVFMwTVhIMjRmeVI0NFhYL2lHdVBBZWNTeFpPS2VG?=
 =?utf-8?B?R05XcGRueEMzaDcyaUJOdmJXQXJySUVhTlNNSW9xWll3MFJGTFF3V1Erem5R?=
 =?utf-8?B?TXhjU2JwalBjVTgwb2tySXVuTmNmaFprNmJObytMUFlkL0l4dFdrU0VHT21E?=
 =?utf-8?B?Z0FVaTBacTFVeGRVUXdoUElQOHYwQzVSTHFNZzY2SlBRekpObmdrb3pJU0RS?=
 =?utf-8?B?clh2S2x2UHVVc3phRXdTeFVsTTZqU3NyNDlLZmxXdjNkS0gyMCtDcDhrbDFF?=
 =?utf-8?B?c0hNb1JaNFQyc3h2dCtlS3ptUlc4YkRFUlpRTktmbytzY1F5VFB1R2Vodkli?=
 =?utf-8?B?L0RxcTJjWWh2TXVURS9sbHhtc1VQUmwrejJPNzFGeUM2bGo1NXRCZ2lYYlN2?=
 =?utf-8?B?U28yT1VHOG13UDhtazJZVEoydTRmVU1hUWFCT0d0MXBOa3Z0MnVPQVNpS0Rk?=
 =?utf-8?B?c1lYWG9rWFlpeHdSRkVJSzJUUHdVMTVRVCtocEtKcUNlQnVvWUhaSGUzZGwv?=
 =?utf-8?B?MXNlWUFFK2ZsOEtnbjhGTHZPdkt5WkFtWXFDN21aUUZ3dnh1MWtvM28zZW44?=
 =?utf-8?B?UVNOMXE5cTQ0WFVqMUt5eUJmRFJEUzl4Nno4WlhtLzN1QVhVOU0vWlBIQWly?=
 =?utf-8?B?ME5jQU0wRlpkNWZya29mMFgwMWhzR0ZxakdncndObjdpaElRbTNYVy9LN3RM?=
 =?utf-8?B?TlVWdXN5YlErSkNFRmR1aDdua1IxNXZaLzdrbWsvQ2JDQXhraXNjR3FCNTBI?=
 =?utf-8?B?L2s5QmdwL2hhK0lneDFITXpuWVQ5aEFvdWdWWXpabS8wRDJOUGtoR1ZWMFh2?=
 =?utf-8?B?UXhjS0RDVGFqR2NjU2licDJLclRKKzlLU1ZneGxSZHk4dGVPR3pjRkNIV0NR?=
 =?utf-8?B?VWRuSldjTUs3ODBncDRQRXI2VDlKT3hKcGhXeUJ6VWRDcXdMTUNaSFNrWlBx?=
 =?utf-8?B?bGYrSjN6ejJ1NFY5THdBZDF6QXdFKzd4TWR4bGU5YVJ1a2kyK01iWnVPdFdU?=
 =?utf-8?B?TXR3K0I2L3lUVkEyQmlsT2hPSHhMVVJ6RGlOUGdSMklvUy9IaGh4d3Npa1Mz?=
 =?utf-8?B?U3ZwbnkwcWV2UDViTDRuTmx4UmJIekNOSkc0OXhMVEFWaTdJNm1CajdZbGJr?=
 =?utf-8?B?SFhKaFA4UzJZRGdwcHBjNE5EeU5Kd00yZXR5d0lQQ2xMVUJkdW43K1QvVE1n?=
 =?utf-8?B?bVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bf382404-6381-4382-f08e-08dbdfe81c2b
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2023 23:20:20.2435 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7GuI8XRls4AE3bgA1DqVWl15CY228YvW0SLuh51HSa+pFP+fz1GZXZOmo9rzfnG/zxhY0LtOhCfRpze7YB2Hnx58s4gY5eMfkTxPTNu4EaA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7568
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 03/12] drm/xe/uc: Rework uC version tracking
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

On 10/27/2023 15:29, Daniele Ceraolo Spurio wrote:
> The GSC firmware, support for which is coming soon for Xe, has both a
> release version (updated on every release) and a compatibility version
> (update only on interface changes). The GuC has something similar, with
> a global release version and a submission version (which is also known
> as the VF compatibility version). The main difference is that for the
> GuC we still want to check the driver requirement against the release
> version, while for the GSC we'll need to check against the compatibility
> version.
> Instead of special casing the GSC, this patch reworks the FW logic so
> that we store both versions at the uc_fw level for all binaries and we
> allow checking against either of the versions. Initially, we'll use it
> to support GSC, but the logic could be re-used to allow VFs to check
> against the GuC compatibility version.
> Note that the GSC version has 4 numbers (major, minor, hotfix, build),
> so support for that has been added as part of the rework and will be
> used in follow-up patches.
>
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_guc_types.h   |   9 --
>   drivers/gpu/drm/xe/xe_uc_fw.c       | 141 +++++++++++++++++-----------
>   drivers/gpu/drm/xe/xe_uc_fw_types.h |  35 +++++--
>   3 files changed, 110 insertions(+), 75 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_guc_types.h b/drivers/gpu/drm/xe/xe_guc_types.h
> index a5e58917a499..343cc39ce5bc 100644
> --- a/drivers/gpu/drm/xe/xe_guc_types.h
> +++ b/drivers/gpu/drm/xe/xe_guc_types.h
> @@ -52,15 +52,6 @@ struct xe_guc {
>   			/** @seqno: suspend fences seqno */
>   			u32 seqno;
>   		} suspend;
> -		/** @version: submission version */
> -		struct {
> -			/** @major: major version of GuC submission */
> -			u32 major;
> -			/** @minor: minor version of GuC submission */
> -			u32 minor;
> -			/** @patch: patch version of GuC submission */
> -			u32 patch;
> -		} version;
>   		/** @enabled: submission is enabled */
>   		bool enabled;
>   	} submission_state;
> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
> index 91d4a2272ee7..1f7dac394a1d 100644
> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
> @@ -204,9 +204,12 @@ uc_fw_auto_select(struct xe_device *xe, struct xe_uc_fw *uc_fw)
>   	for (i = 0; i < count && p <= entries[i].platform; i++) {
>   		if (p == entries[i].platform) {
>   			uc_fw->path = entries[i].path;
> -			uc_fw->major_ver_wanted = entries[i].major;
> -			uc_fw->minor_ver_wanted = entries[i].minor;
> +			uc_fw->versions.wanted.major = entries[i].major;
> +			uc_fw->versions.wanted.minor = entries[i].minor;
>   			uc_fw->full_ver_required = entries[i].full_ver_required;
> +
> +			/* compatibility version checking coming soon */
> +			uc_fw->versions.wanted_type = XE_UC_FW_VER_RELEASE;
>   			break;
>   		}
>   	}
> @@ -273,32 +276,30 @@ static void uc_fw_fini(struct drm_device *drm, void *arg)
>   static void guc_read_css_info(struct xe_uc_fw *uc_fw, struct uc_css_header *css)
>   {
>   	struct xe_gt *gt = uc_fw_to_gt(uc_fw);
> -	struct xe_guc *guc = &gt->uc.guc;
> +	struct xe_uc_fw_version *release = &uc_fw->versions.found[XE_UC_FW_VER_RELEASE];
> +	struct xe_uc_fw_version *compatibility = &uc_fw->versions.found[XE_UC_FW_VER_COMPATIBILITY];
>   
>   	xe_gt_assert(gt, uc_fw->type == XE_UC_FW_TYPE_GUC);
> -	xe_gt_assert(gt, uc_fw->major_ver_found >= 70);
> +	xe_gt_assert(gt, release->major >= 70);
>   
> -	if (uc_fw->major_ver_found > 70 || uc_fw->minor_ver_found >= 6) {
> +	if (release->major > 70 || release->minor >= 6) {
>   		/* v70.6.0 adds CSS header support */
> -		guc->submission_state.version.major =
> -			FIELD_GET(CSS_SW_VERSION_UC_MAJOR,
> -				  css->submission_version);
> -		guc->submission_state.version.minor =
> -			FIELD_GET(CSS_SW_VERSION_UC_MINOR,
> -				  css->submission_version);
> -		guc->submission_state.version.patch =
> -			FIELD_GET(CSS_SW_VERSION_UC_PATCH,
> -				  css->submission_version);
> -	} else if (uc_fw->minor_ver_found >= 3) {
> +		compatibility->major = FIELD_GET(CSS_SW_VERSION_UC_MAJOR,
> +						 css->submission_version);
> +		compatibility->minor = FIELD_GET(CSS_SW_VERSION_UC_MINOR,
> +						 css->submission_version);
> +		compatibility->patch = FIELD_GET(CSS_SW_VERSION_UC_PATCH,
> +						 css->submission_version);
> +	} else if (release->minor >= 3) {
>   		/* v70.3.0 introduced v1.1.0 */
> -		guc->submission_state.version.major = 1;
> -		guc->submission_state.version.minor = 1;
> -		guc->submission_state.version.patch = 0;
> +		compatibility->major = 1;
> +		compatibility->minor = 1;
> +		compatibility->patch = 0;
>   	} else {
>   		/* v70.0.0 introduced v1.0.0 */
> -		guc->submission_state.version.major = 1;
> -		guc->submission_state.version.minor = 0;
> -		guc->submission_state.version.patch = 0;
> +		compatibility->major = 1;
> +		compatibility->minor = 0;
> +		compatibility->patch = 0;
>   	}
As per comment on previous patch, this all needs to be removed. There is 
no need or reason to carry this legacy support in Xe.

Otherwise it all looks good.

John.


>   
>   	uc_fw->private_data_size = css->private_data_size;
> @@ -307,30 +308,31 @@ static void guc_read_css_info(struct xe_uc_fw *uc_fw, struct uc_css_header *css)
>   static int uc_fw_check_version_requirements(struct xe_uc_fw *uc_fw)
>   {
>   	struct xe_device *xe = uc_fw_to_xe(uc_fw);
> +	struct xe_uc_fw_version *wanted = &uc_fw->versions.wanted;
> +	struct xe_uc_fw_version *found = &uc_fw->versions.found[uc_fw->versions.wanted_type];
>   
>   	/* Driver has no requirement on any version, any is good. */
> -	if (!uc_fw->major_ver_wanted)
> +	if (!wanted->major)
>   		return 0;
>   
>   	/*
>   	 * If full version is required, both major and minor should match.
>   	 * Otherwise, at least the major version.
>   	 */
> -	if (uc_fw->major_ver_wanted != uc_fw->major_ver_found ||
> -	    (uc_fw->full_ver_required &&
> -	     uc_fw->minor_ver_wanted != uc_fw->minor_ver_found)) {
> +	if (wanted->major != found->major ||
> +	    (uc_fw->full_ver_required && wanted->minor != found->minor)) {
>   		drm_notice(&xe->drm, "%s firmware %s: unexpected version: %u.%u != %u.%u\n",
>   			   xe_uc_fw_type_repr(uc_fw->type), uc_fw->path,
> -			   uc_fw->major_ver_found, uc_fw->minor_ver_found,
> -			   uc_fw->major_ver_wanted, uc_fw->minor_ver_wanted);
> +			   found->major, found->minor,
> +			   wanted->major, wanted->minor);
>   		goto fail;
>   	}
>   
> -	if (uc_fw->minor_ver_wanted > uc_fw->minor_ver_found) {
> +	if (wanted->minor > found->minor) {
>   		drm_notice(&xe->drm, "%s firmware (%u.%u) is recommended, but only (%u.%u) was found in %s\n",
>   			   xe_uc_fw_type_repr(uc_fw->type),
> -			   uc_fw->major_ver_wanted, uc_fw->minor_ver_wanted,
> -			   uc_fw->major_ver_found, uc_fw->minor_ver_found,
> +			   wanted->major, wanted->minor,
> +			   found->major, found->minor,
>   			   uc_fw->path);
>   		drm_info(&xe->drm, "Consider updating your linux-firmware pkg or downloading from %s\n",
>   			 XE_UC_FIRMWARE_URL);
> @@ -349,6 +351,7 @@ static int uc_fw_check_version_requirements(struct xe_uc_fw *uc_fw)
>   static int parse_css_header(struct xe_uc_fw *uc_fw, const void *fw_data, size_t fw_size)
>   {
>   	struct xe_device *xe = uc_fw_to_xe(uc_fw);
> +	struct xe_uc_fw_version *release = &uc_fw->versions.found[XE_UC_FW_VER_RELEASE];
>   	struct uc_css_header *css;
>   	size_t size;
>   
> @@ -390,12 +393,9 @@ static int parse_css_header(struct xe_uc_fw *uc_fw, const void *fw_data, size_t
>   	}
>   
>   	/* Get version numbers from the CSS header */
> -	uc_fw->major_ver_found = FIELD_GET(CSS_SW_VERSION_UC_MAJOR,
> -					   css->sw_version);
> -	uc_fw->minor_ver_found = FIELD_GET(CSS_SW_VERSION_UC_MINOR,
> -					   css->sw_version);
> -	uc_fw->patch_ver_found = FIELD_GET(CSS_SW_VERSION_UC_PATCH,
> -					   css->sw_version);
> +	release->major = FIELD_GET(CSS_SW_VERSION_UC_MAJOR, css->sw_version);
> +	release->minor = FIELD_GET(CSS_SW_VERSION_UC_MINOR, css->sw_version);
> +	release->patch = FIELD_GET(CSS_SW_VERSION_UC_PATCH, css->sw_version);
>   
>   	if (uc_fw->type == XE_UC_FW_TYPE_GUC)
>   		guc_read_css_info(uc_fw, css);
> @@ -431,6 +431,7 @@ static int parse_cpd_header(struct xe_uc_fw *uc_fw, const void *data, size_t siz
>   	struct xe_gt *gt = uc_fw_to_gt(uc_fw);
>   	struct xe_device *xe = gt_to_xe(gt);
>   	const struct gsc_cpd_header_v2 *header = data;
> +	struct xe_uc_fw_version *release = &uc_fw->versions.found[XE_UC_FW_VER_RELEASE];
>   	const struct gsc_manifest_header *manifest;
>   	size_t min_size = sizeof(*header);
>   	u32 offset;
> @@ -468,9 +469,9 @@ static int parse_cpd_header(struct xe_uc_fw *uc_fw, const void *data, size_t siz
>   
>   	manifest = data + offset;
>   
> -	uc_fw->major_ver_found = manifest->fw_version.major;
> -	uc_fw->minor_ver_found = manifest->fw_version.minor;
> -	uc_fw->patch_ver_found = manifest->fw_version.hotfix;
> +	release->major = manifest->fw_version.major;
> +	release->minor = manifest->fw_version.minor;
> +	release->patch = manifest->fw_version.hotfix;
>   
>   	/* then optionally look for the css header */
>   	if (css_entry) {
> @@ -524,12 +525,25 @@ static int parse_headers(struct xe_uc_fw *uc_fw, const struct firmware *fw)
>   	return 0;
>   }
>   
> +#define print_uc_fw_version(p_, version_, prefix_, ...) \
> +do { \
> +	struct xe_uc_fw_version *ver_ = (version_); \
> +	if (ver_->build) \
> +		drm_printf(p_, prefix_ " version %u.%u.%u.%u\n", ##__VA_ARGS__, \
> +			   ver_->major, ver_->minor, \
> +			   ver_->patch, ver_->build); \
> +	else \
> +		drm_printf(p_, prefix_ " version %u.%u.%u\n", ##__VA_ARGS__, \
> +			  ver_->major, ver_->minor, ver_->patch); \
> +} while(0);
> +
>   int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
>   {
>   	struct xe_device *xe = uc_fw_to_xe(uc_fw);
>   	struct xe_gt *gt = uc_fw_to_gt(uc_fw);
>   	struct xe_tile *tile = gt_to_tile(gt);
>   	struct device *dev = xe->drm.dev;
> +	struct drm_printer p = drm_info_printer(dev);
>   	const struct firmware *fw = NULL;
>   	struct xe_bo *obj;
>   	int err;
> @@ -567,9 +581,10 @@ int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
>   	if (err)
>   		goto fail;
>   
> -	drm_info(&xe->drm, "Using %s firmware from %s version %u.%u.%u\n",
> -		 xe_uc_fw_type_repr(uc_fw->type), uc_fw->path,
> -		 uc_fw->major_ver_found, uc_fw->minor_ver_found, uc_fw->patch_ver_found);
> +	print_uc_fw_version(&p,
> +			    &uc_fw->versions.found[XE_UC_FW_VER_RELEASE],
> +			    "Using %s firmware from %s",
> +			    xe_uc_fw_type_repr(uc_fw->type), uc_fw->path);
>   
>   	err = uc_fw_check_version_requirements(uc_fw);
>   	if (err)
> @@ -686,26 +701,40 @@ int xe_uc_fw_upload(struct xe_uc_fw *uc_fw, u32 offset, u32 dma_flags)
>   	return err;
>   }
>   
> +static const char *version_type_repr(enum xe_uc_fw_version_types type)
> +{
> +	switch (type) {
> +	case XE_UC_FW_VER_RELEASE:
> +		return "release";
> +	case XE_UC_FW_VER_COMPATIBILITY:
> +		return "compatibility";
> +	default:
> +		return "Unknown version type";
> +	}
> +}
>   
>   void xe_uc_fw_print(struct xe_uc_fw *uc_fw, struct drm_printer *p)
>   {
> +	int i;
> +
>   	drm_printf(p, "%s firmware: %s\n",
>   		   xe_uc_fw_type_repr(uc_fw->type), uc_fw->path);
>   	drm_printf(p, "\tstatus: %s\n",
>   		   xe_uc_fw_status_repr(uc_fw->status));
> -	drm_printf(p, "\tversion: wanted %u.%u, found %u.%u.%u\n",
> -		   uc_fw->major_ver_wanted, uc_fw->minor_ver_wanted,
> -		   uc_fw->major_ver_found, uc_fw->minor_ver_found, uc_fw->patch_ver_found);
> -	drm_printf(p, "\tuCode: %u bytes\n", uc_fw->ucode_size);
> -	drm_printf(p, "\tRSA: %u bytes\n", uc_fw->rsa_size);
> -
> -	if (uc_fw->type == XE_UC_FW_TYPE_GUC) {
> -		struct xe_gt *gt = uc_fw_to_gt(uc_fw);
> -		struct xe_guc *guc = &gt->uc.guc;
> -
> -		drm_printf(p, "\tSubmit version: %u.%u.%u\n",
> -			   guc->submission_state.version.major,
> -			   guc->submission_state.version.minor,
> -			   guc->submission_state.version.patch);
> +
> +	print_uc_fw_version(p, &uc_fw->versions.wanted, "\twanted %s",
> +			    version_type_repr(uc_fw->versions.wanted_type));
> +
> +	for (i = 0; i < XE_UC_FW_VER_TYPE_COUNT; i++) {
> +		struct xe_uc_fw_version *ver = &uc_fw->versions.found[i];
> +
> +		if (ver->major)
> +			print_uc_fw_version(p, ver, "\tfound %s",
> +					    version_type_repr(i));
>   	}
> +
> +	if (uc_fw->ucode_size)
> +		drm_printf(p, "\tuCode: %u bytes\n", uc_fw->ucode_size);
> +	if (uc_fw->rsa_size)
> +		drm_printf(p, "\tRSA: %u bytes\n", uc_fw->rsa_size);
>   }
> diff --git a/drivers/gpu/drm/xe/xe_uc_fw_types.h b/drivers/gpu/drm/xe/xe_uc_fw_types.h
> index 1650599303c8..e4774c560e67 100644
> --- a/drivers/gpu/drm/xe/xe_uc_fw_types.h
> +++ b/drivers/gpu/drm/xe/xe_uc_fw_types.h
> @@ -59,6 +59,22 @@ enum xe_uc_fw_type {
>   };
>   #define XE_UC_FW_NUM_TYPES 2
>   
> +/**
> + * struct xe_uc_fw_version - Version for XE micro controller firmware
> + */
> +struct xe_uc_fw_version {
> +	u16 major;
> +	u16 minor;
> +	u16 patch;
> +	u16 build;
> +};
> +
> +enum xe_uc_fw_version_types {
> +	XE_UC_FW_VER_RELEASE,
> +	XE_UC_FW_VER_COMPATIBILITY,
> +	XE_UC_FW_VER_TYPE_COUNT
> +};
> +
>   /**
>    * struct xe_uc_fw - XE micro controller firmware
>    */
> @@ -98,16 +114,15 @@ struct xe_uc_fw {
>   	 * version required per platform.
>   	 */
>   
> -	/** @major_ver_wanted: major firmware version wanted by platform */
> -	u16 major_ver_wanted;
> -	/** @minor_ver_wanted: minor firmware version wanted by platform */
> -	u16 minor_ver_wanted;
> -	/** @major_ver_found: major version found in firmware blob */
> -	u16 major_ver_found;
> -	/** @minor_ver_found: major version found in firmware blob */
> -	u16 minor_ver_found;
> -	/** @patch_ver_found: patch version found in firmware blob */
> -	u16 patch_ver_found;
> +	/** @versions: FW versions wanted and found */
> +	struct {
> +		/** @wanted: firmware version wanted by platform */
> +		struct xe_uc_fw_version wanted;
> +		/** @wanted_type: type of firmware version wanted (release vs compatibility) */
> +		enum xe_uc_fw_version_types wanted_type;
> +		/** @found: fw versions found in firmware blob */
> +		struct xe_uc_fw_version found[XE_UC_FW_VER_TYPE_COUNT];
> +	} versions;
>   
>   	/** @rsa_size: RSA size */
>   	u32 rsa_size;

