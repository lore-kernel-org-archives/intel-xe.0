Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4DC2C4829A
	for <intel-xe@archiver.kernel.org>; Wed, 14 Feb 2024 02:20:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8742B10E273;
	Wed, 14 Feb 2024 02:20:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Et48Jfd5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9113210E273
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Feb 2024 02:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707877202; x=1739413202;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=IW2v06kLGjo4kbygzFnxBvfqjiHQUqcBGQR7R5QjjFI=;
 b=Et48Jfd5JCmperHE6/8/7ISQyQ9bkxIPeWb8MVqcd8q8JhgGsRaQeVhc
 W0uChci50LGIxpg6d2intOnvpbU/NJ4ish/DDKoHWOen5ZUAtRkvgcOPy
 PC8BtnyAP5WqIVI+pN/hYFkCejXUXOcbah8XGSUZ0bY8bLCfSjI7logvY
 JKZaco5mf5xgU8ZjDoKpmdZpDyxfaSc9y0ZTYPVBoJrIKzgW+67Eyjhrn
 gWeJbpocz+vey1dYfztH8KyVWpNdJI68Atl24Xh+Cd45XzBJCVyXbr6/Z
 c7jokhivskl2piH3YyiwIZS4kU0ae7zZHG1kD7/FFDo0Lcp7qqZy/coAP g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="396347905"
X-IronPort-AV: E=Sophos;i="6.06,158,1705392000"; d="scan'208";a="396347905"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2024 18:20:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="911975742"
X-IronPort-AV: E=Sophos;i="6.06,158,1705392000"; d="scan'208";a="911975742"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Feb 2024 18:20:00 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 13 Feb 2024 18:20:01 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 13 Feb 2024 18:20:01 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 13 Feb 2024 18:20:01 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 13 Feb 2024 18:19:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C5R7hYNjFfzniM1utdBCqYVketqHyJi4lbKjoTNvQHRzGZ70hj55jPfyk0QtL/TXJMjN7OVLpEWcZOx3RUEhiH5By4ZhN8s9Ixd5SZKdV5EtQFrD5eNn9Hp/FWYZpAG+36bKEnh2UyEbnOJirRiNAvmfJeqgK/tkbQpp7Y6Rt/Fike2uj5DShS9vGAHL3oPV28TWKCtHqtk1RAKVLfPGGOSuEk0B+/XvwwZIuTgZy9s9L9Gc18ioBCMqnPI/0hZAbUYwMOjQ5A5mdlwgvXgthMNNPbGK3P3orYREzF/R9NPbiCSkBgIvTSlmkB8S79yJR5AwJzRaNSPRFnJfFQSxUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RWFWxROklbMb/oab2/3+4hxrSopIYZkFpfHBdehUkY4=;
 b=jX3u0AbU2h4v3JDKyeVqxSPUKoZwlnpnas7VxyqiIXG0wJLkYTjZ3ghxr+DK6egm4xkQX6cCG/MPLekYdNDFcYAB6sZfhVer/0XNy5CAi9rKnNtORayz9QfH0Wo9q4NzYo0KafpOVE0EtQ819wIl6WoWkusW6rmFPVf/6B/GMhY8aYDI1DTSS3QA74iplXqtpcsrwS1Bz3ayW0LAyT3wc2AiV08w+9yILLSaRe2FX5LvSY+MPtsRla/S+vsJZWQ2D9humjowRK6vNjnkP7IZgIDIApcD0+xescRLMbeXjI7eV3GsK2fm8tn3IRVXKobv9VgtaIsBPaCEoorVy4D+0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by PH0PR11MB5160.namprd11.prod.outlook.com (2603:10b6:510:3e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.35; Wed, 14 Feb
 2024 02:19:49 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::c590:37b4:ad48:cd0f]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::c590:37b4:ad48:cd0f%3]) with mapi id 15.20.7292.026; Wed, 14 Feb 2024
 02:19:49 +0000
Message-ID: <a97bec64-28dd-421e-a54d-71bb2aabcf33@intel.com>
Date: Tue, 13 Feb 2024 18:19:46 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] drm/xe: Add uAPI to query GuC firmware submission
 version
Content-Language: en-GB
To: =?UTF-8?Q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Francois Dugast <francois.dugast@intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>
References: <20240208183539.185095-1-jose.souza@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20240208183539.185095-1-jose.souza@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR03CA0009.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::22) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|PH0PR11MB5160:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e13ad05-39ff-4918-3969-08dc2d036bb5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xHHRxR0lvJpnm8r2IeYyiNHYRE/PKnntd3EgUtz5AyHlr9Kd/V1bRcf8u2NcbCBOZXIfCPZ9iT4OFwpD+Pjas+swvfi4eDEkzZuAS8+owuBlNim4nEInJ72/WPhEZquUZmCnh+raSA3qfMtw8MAP2hoVLnsG83fJWM6sHAeOXIemZ3wVH3oYxfn7A4JgWQ8HdmB4bHSw1QkeYTPSh/RetxBHQaeV9IV1eyb0uG83Y8y5hvn0MLBFeG5bOn/+T2IgttmvhIjZ9up6pkoHmz0ouTqJAOjy6gTpgCIW0cZt4+veWdUHh7M8WdiiLP7nmOCV/tCZ558m+DmYKXcloCC6Pf1UbWCFtrBYcktC1M22pNzWipSAlbGLl+pwLMOFWr5noJQWwNFdoDMcz/5D6sJ3Z0m1gHd0osfoePsStJAeDM0gCxxcV+C/h9uDuGFPRtZqlhqNXY3AwM/IDv1/KtAZHIf+9DjPzhUJJxzbtTS5jtJuAi17tXwE173TdyEYJtDgNcY3H2ZkOOOT87nb2WW+s61E6433ra5/RpTtBahsFhA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(396003)(366004)(346002)(376002)(136003)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(6512007)(6486002)(478600001)(41300700001)(31686004)(966005)(5660300002)(4326008)(2906002)(8676002)(6666004)(8936002)(66946007)(53546011)(6506007)(66476007)(316002)(54906003)(66556008)(2616005)(83380400001)(31696002)(86362001)(107886003)(26005)(82960400001)(36756003)(38100700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Vmw2VjNleWNZK3pkWnNJWDhNMHhDMFNvL1VrSmhzRlRYNGtkTEJnR3VJZnRq?=
 =?utf-8?B?VDF0MWJyNFl3ZTc1cWpkM1BVbzErTWZCcmFuK1Izbmh2VStZNkJUZFFhLy9X?=
 =?utf-8?B?SW5OWWpsUnIzZnNmT2FGclZJNHE5QXVWS2RmZGN5NHNyV0RNNmtwRTFnVnRI?=
 =?utf-8?B?eG5GME1NZ1V4dGJwZnhLOEhXRFdPZTk1SmhKOHMvMjJvLzk4K3VwQmNiNUFT?=
 =?utf-8?B?NTBaN2hBQURNbkUwWFdoR0VJUEV4RnVySk5hNE9KaVVxRTBtOHhDcVVHeDJz?=
 =?utf-8?B?UlJBY1lBbXJMcVFUTVUvelg2TlFrNkliME43QmI0NU5Ua2JlRlFVRUs2RU1J?=
 =?utf-8?B?eFJLSDd4QmVmTGJWcE1zZzJSdVZRU0FYTDNTeklQcU94c1BreXdBaVEwc2hq?=
 =?utf-8?B?ZFlzV3dkN2ZTeERsa2wrMlFqUGsvcisxd1dzWGxQZ29SdUpwSkoxajYxMnVu?=
 =?utf-8?B?RXJFVzRxeGg2bFRmQzg4NzZBL1hXdHVYNFppUWxhdy94K3UwaFQ0MzcyNGtp?=
 =?utf-8?B?OWVHZlVJcTNlWWdmR3c1M3lPYURUU0pVMzBveFVHaS9LU21wN2Fab3RCWDdV?=
 =?utf-8?B?bWtRZ3Q1VGlFam5IV0pkZWVleHdEbVZsWGp0SHQ5RGVOYi9lbU1FVWFjL1k1?=
 =?utf-8?B?d1J0dXZ2YjFNc1YvNDZiakpCNHVtbWsyZWJBUlRXUHFrVm51Qms3S0tobURI?=
 =?utf-8?B?V0JLYmdEbHlzWSswdjd5Q3h1L2VXcWpmTjRmc3pxMytaKzU0TndVSUhuWmg2?=
 =?utf-8?B?SmJMS3dzbm16YWVlcWlGNno0YllZVmNJWGpPKzFnR0V6eXRmUTc5RHArSkhw?=
 =?utf-8?B?eFBSa29YeDNrOFBSWURka3NtT2I5M2ZqeDZFem53K3FzdERyeWhxS216eFNs?=
 =?utf-8?B?djU1RjRlTndJclF0OW9XV1ZUek9SVG4yN3kxbVpEbThCRDM3bFNKK1k2YzlG?=
 =?utf-8?B?QXZuaGxtNmV4K0hYb0pwVFVFdGNWWWtSamxtMXFIWm1TRnVGUFk0ZzZkNDJL?=
 =?utf-8?B?UXhndGZJWDNtQ0QxYm9OM3VuU0RHMTM0dlFzTHdoS3ZDeFhMQlVqcWl0Kytu?=
 =?utf-8?B?QWhoakhyaFVhWmhyaXZSVWpieTdCQWFvVENDY1pGcHdXeGRldVFmNVFXaCtt?=
 =?utf-8?B?SGg0UC8vTTVTUTBwZmJUcmpUV05EcTZkeWxTbWx3ZjlzeVg2dWgvK0JZZXhp?=
 =?utf-8?B?UEV6dUFsUU1XZTdsb0wxU2poY01UKzlIZlVXeTBoZkJxMTJUL0VMVXA4aXlK?=
 =?utf-8?B?TE9vQXdJYi8zQmZua29sOXVMOHlaU3pmaS9YUFptWUZ2SUVxT3l3WlBKVjl4?=
 =?utf-8?B?YzZZQVdhK05HRHdMeDBWU1NIdjRqcnJMUFRQYU9LV3EyWWJyR1I2QnlGYzcy?=
 =?utf-8?B?RHc2YnBRamNoQWFXUDIyRXBtL0JyVHp0cHByRnJNN3dtaU1sTnpUdkpYTUk2?=
 =?utf-8?B?R01mU1NwODBLWDc0WE9ISFQ0cE1ZMnFVckQzNUtDOWwwL1Rsdm1JTGd5N1Fu?=
 =?utf-8?B?SG5OTDZBUFVMbklNcmhQVmY2a2lJMlg3emcrNngwdGJ2SG9nemcraXRyMkZw?=
 =?utf-8?B?MG5kRFpuQk9RZ1cwdDlha1g2YWJEWEVJeFdqT2RrUjR2U3hxQVpaSXFscDlo?=
 =?utf-8?B?RWMxMkszR1hCMWJDQzNiVzRYNnRpTXJkLzZFZ2djZDkrS2J4WGZuTFgvNyti?=
 =?utf-8?B?emhmK3V3VkNnRzlxaWR2ZVpKOUVnMXdkTk44Z1JTVytYTDR6elpxa1RsTWtW?=
 =?utf-8?B?TWdLYXZFQ2FrRmNJVUFQdnNKb29DbktHS2NxZ0tXMUhsVmRVOXhseE5EZ3Zl?=
 =?utf-8?B?dmx1dHo1a2JNNk5OUnZhbStzc2k3OCtXNUgwNXE5TGNaSmxxbnZpcE04NlNS?=
 =?utf-8?B?ZHJNUEFLNWxaZzB2TzB0QWNEK1NCSFNudWJxeEQwT3RQb0t1ZjVINm5NYnhI?=
 =?utf-8?B?K2FZR1FOaVRmaVJGWkgrMXhJR3FVMHpqSHpFdUhuV29jZ0hLMmtVOG1zWm9P?=
 =?utf-8?B?WHVvWTREN2EybUZqUkF5Z1duT20rZWFMUXh4RXRveUt1L3dYYXFCY2ZVMXZq?=
 =?utf-8?B?Q2h2aUNURjdEMnBOWWJCazRBSlJud2UzbFJCQ2IxV2FkME5YMnBvc3I0SlVh?=
 =?utf-8?B?SU1SMEk5dm53U096dzJEY2luYUE1Nkx4WXpoSWlFeXNqcEkycWo1Z3JVaDB2?=
 =?utf-8?B?Rmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e13ad05-39ff-4918-3969-08dc2d036bb5
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2024 02:19:49.6368 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M8mT37gnLb1ZqRV5+19dMP4CCwU1L2rKoa0/Rw/AQF87DBt+DJfCvfQ0MeJFcp6Vb0aszr9TjhCLIvMRaNnZCquajYUe8SQiTem0OMyC0Mk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5160
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

On 2/8/2024 10:35, José Roberto de Souza wrote:
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
> v2:
> - fixed drm_xe_query_uc_fw_version documentation
> - moved branch_ver as the first version number
>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> Cc: Francois Dugast <francois.dugast@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

> ---
>   drivers/gpu/drm/xe/xe_query.c | 44 +++++++++++++++++++++++++++++++++++
>   include/uapi/drm/xe_drm.h     | 31 ++++++++++++++++++++++++
>   2 files changed, 75 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
> index 4f1ab91dbec58..92bb06c0586eb 100644
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
> +	resp.branch_ver = 0;
> +	resp.major_ver = version->major;
> +	resp.minor_ver = version->minor;
> +	resp.patch_ver = version->patch;
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
> index 50bbea0992d9c..0819959a52227 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -574,6 +574,36 @@ struct drm_xe_query_engine_cycles {
>   	__u64 cpu_delta;
>   };
>   
> +/**
> + * struct drm_xe_query_uc_fw_version - query a micro-controller firmware version
> + *
> + * Given a uc_type this will return the branch, major, minor and patch version
> + * of the micro-controller firmware.
> + */
> +struct drm_xe_query_uc_fw_version {
> +	/** @uc_type: The micro-controller type to query firmware version */
> +#define XE_QUERY_UC_TYPE_GUC_SUBMISSION 0
> +	__u16 uc_type;
> +
> +	/** @pad: MBZ */
> +	__u16 pad;
> +
> +	/** @branch_ver: branch uc fw version */
> +	__u32 branch_ver;
> +	/** @major_ver: major uc fw version */
> +	__u32 major_ver;
> +	/** @minor_ver: minor uc fw version */
> +	__u32 minor_ver;
> +	/** @patch_ver: patch uc fw version */
> +	__u32 patch_ver;
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

