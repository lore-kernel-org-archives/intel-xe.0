Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 619CBCDB474
	for <intel-xe@archiver.kernel.org>; Fri, 20 Oct 2023 17:44:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10C2F10E0FB;
	Fri, 20 Oct 2023 17:44:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1ED8110E0FB
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Oct 2023 17:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697823870; x=1729359870;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=igf6Xi6SAwBS3dYhn9pjg9IyE9e6Cp8n7dFXvFI/1Yo=;
 b=gFEIHOEH3AijM/hnDqOu+pjwoJ1EAPLGQHA1AU0AlaN5vEPjosnRZwz9
 ha3FXHbCr9tUOQAwPfcH1ckXRrv5tdDH2jWuVJE9JCjQpKFqnqh+VITSC
 pL2NuA0MaFVv4p7+Sj1ZGUrxG+wTkuVyLnOsqZvt7titShI7pSJ0RdHtf
 AbSu9gjNKnUkwXyjtzTSSFdZ6evGQctRwUrywUorPJc9DQNc9v3nKF1dl
 6pu5NNDYcNnSUNup+h/Yk5utEmfrgdNjYXJa5Ep3LAgcRn32ZNBqu6qo/
 oU2fk7Edr61GwsKydFrnll3RR0MHcWM6sP5qvDt8d7jLFOXRNSbisuW0h A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="376920823"
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; d="scan'208";a="376920823"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2023 10:44:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="873991044"
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; d="scan'208";a="873991044"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Oct 2023 10:44:29 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 20 Oct 2023 10:44:28 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 20 Oct 2023 10:44:28 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 20 Oct 2023 10:44:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DBfvsAEVb5kxzrR8k03/pWIh0js62bp/ZOs1PLSO37Kw2YdKJRB8KlsomewZ+YZF9fiNdQrqFTMEyui69DKuhWB7AkCeLNInc34/0CZXixjwBl0GczKXrNpzcxwd+IqF1WOYEB/jCN6GxRZZZS2jHvdfSoASIXtQ60AW/eyadMqv2J+9EJrYag/C9c0l1pNuc2XdM124SWYiygauDCVru4AqxIDJI1Ibl6d8GceJVMiuU1zOHXHoIQ6frRjYhwyLufDBjgY/wClBDglB37NGvAv6V7ytwSUHGvxZLOjZj7dvqVoIO5vRl43E2Jria9tQZnKzzDjb9YVvtzxg3U24bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q4HNTOsmYR0Q/7vBcU1F4Z8UDm9LI/N8K65GYUriCMs=;
 b=U8q9PzR+obs75a5k/rvu7RaeaoEmBF75SKsP3g99P3R4HbxZtTPwXmTEO4gpi52aiPV7us4WYCvzMd8arQG7V7CTIDL7PIbEkYk2dF21H7Ir88br8UC5p9T6uniyE/e/3m2F0qGn8F/7dDYxki+KOFgEXREya5CLJwhBCuoL91cTqghSjAdTORwlPRbNehhg2GVh2W9J9jl9AfXAXWccOfGXn4dQCemBR/FIXNBOyBfiMsZ5F31kS/Ln2DNKlWFNmvBZ3GsquyyWhZR376z2zs6vnf6YiaXW7FjTG6GY2ffxqzfQVdkfVl7I1mEwe5bEEx4TSkYXZLID5Q1yNOgdNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB7705.namprd11.prod.outlook.com (2603:10b6:806:32f::16)
 by LV8PR11MB8724.namprd11.prod.outlook.com (2603:10b6:408:1fd::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.26; Fri, 20 Oct
 2023 17:44:26 +0000
Received: from SN7PR11MB7705.namprd11.prod.outlook.com
 ([fe80::51b2:a46b:a57e:9fd6]) by SN7PR11MB7705.namprd11.prod.outlook.com
 ([fe80::51b2:a46b:a57e:9fd6%6]) with mapi id 15.20.6886.034; Fri, 20 Oct 2023
 17:44:26 +0000
Message-ID: <ff03a8ef-4084-431b-8b33-cd87d07d9096@intel.com>
Date: Fri, 20 Oct 2023 10:44:24 -0700
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Stuart Summers <stuart.summers@intel.com>
References: <20231020172155.97172-1-stuart.summers@intel.com>
From: "Welty, Brian" <brian.welty@intel.com>
In-Reply-To: <20231020172155.97172-1-stuart.summers@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR17CA0029.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::42) To SN7PR11MB7705.namprd11.prod.outlook.com
 (2603:10b6:806:32f::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB7705:EE_|LV8PR11MB8724:EE_
X-MS-Office365-Filtering-Correlation-Id: 220d0cae-ec79-42a5-8952-08dbd194341d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Vn2KqaJQB2V8phXMrr6kCoZ6/x2o91IH68HOd/FPT3gIu6bxblNW63eFTEZ78fZUGSQcTvnAzFKFxsrDW40Grf2ZacPoGqLwUTMeHEYo/2XTWVe8SOOkNqek7kJALwjmgPZ8Pavq6r1OBoGwB5+sgYYoRsRBe0DnAh2VALbAUZ15vHGgNOhoUYUgzYMmgeF6vteOHYrqoO3dp907U6fgPMNOM43iSvSX4oHDjpx8XdUmmYibYqVv3zevSPs2mIXB1qKj+VT+gYP7vPMHHnTrFrpkFXE7GLiN++eEUPgd8fGwUY4ZIYvJ7Mux1YcrOfRL3b9lfnTL3qDf6DvE0nB/9BEVRzi4PD7VsRhi+SAundTvTAx9JsMyfODoiTiiNwn+qKpliEy2wqWgM3faGZR8NE25X4MctIIoDPPKpJwQiP3yw/nJrsq6MHD0YQJ46mufa3xIl3QKFiMKT+atFGZ+4iX/9sfQA8xozGv0O2fDUzpqwcKBZnt0mOpaW701eydagkT+ZkiyscbeF2OGE/V3BdL4VQROAmZYBfGQQTIiA+LbltlDDrD7jfvmHYlyM/BR+hAAU4A+RmD98bMs6Wj8Z55vZ+WhC//R+cHikne20lTBgBDSCEi3oUsMT5s8cgWUNGDMPvOOC4KOLB97y5vgNQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB7705.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(376002)(346002)(396003)(136003)(366004)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(31686004)(86362001)(2616005)(82960400001)(6506007)(38100700002)(36756003)(41300700001)(4326008)(6862004)(31696002)(83380400001)(6512007)(5660300002)(26005)(53546011)(2906002)(478600001)(6486002)(8936002)(8676002)(66946007)(66476007)(37006003)(6636002)(66556008)(316002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QitvUk13dUU2dG1KQVc5SzFGUUU0N3hNWi9vbXl6SHpWYU4wcGxNMmFac0py?=
 =?utf-8?B?RUg5bWVidXBNU0lWYnNoWDFiVWdqejZXUDBYQ2JtTkxZTithYng0ZDNVMFQz?=
 =?utf-8?B?UkhzRHdKRWJyZ2RWOFQwZ0p0RlpGcWlUdWpLK2RvZU9JZmI1MDVRUTF1aGM4?=
 =?utf-8?B?L2tpeGRxemNYT0pGNHorbjEzUVRUbDZjNWJlWlBwT0pCZ2RHZ1lCVlhVNzZQ?=
 =?utf-8?B?QnVBcUcvRlY1eWsrcEl2OFlxaGltanMxRVRmRXlvZzV2MkU0SHRPSG1kNFR6?=
 =?utf-8?B?QkhJREZFWlppZ0ZaSy8va1JxRnZmTHIxR0lXOTRXY0NxZTJqcUhlNzMvUjRs?=
 =?utf-8?B?MFl0eXFFZi8rOHc1SjgzN3lJQVFCM2RXSjJSVXpKd3lUcG90U3BoWGp3Nmxv?=
 =?utf-8?B?VkZQL254bDVEdjNUY1JZL2VIek9kbHdiWG9ObHM3UG5wMllhWTJRRXZBaWRl?=
 =?utf-8?B?ejBGT3N1T3d2dGlGSm1lUDJRRVNrRE1ZOFo5YWtTblVKVUJ3NHhRMllWSld0?=
 =?utf-8?B?NmdlWU9qM2Y5TWxMQytqUG5HR1VraWxtYnpQRlJ5aXhWa2ZMSWNKYi9CVGpZ?=
 =?utf-8?B?TlBuOGZwQ2tMTXd1UHpiNW9CYWp0YTZOQ0t2alBIY0k3VG9nTENCdlZrL0l1?=
 =?utf-8?B?SGpjeUR2dFVqdm1zZGZsMEVHR3J6dWVZL0gzZCs4SDExMWFCRUhEd3FBK3ZI?=
 =?utf-8?B?T3dhKzV3bjlUYnI4ZzlvSVdZVjFjbkhNYWVLbEI0MGJtankvaExqZmlBTE1M?=
 =?utf-8?B?dlVXTk9jOWhXa0ViREJBWXUvYitwVnRaNDJiQUk1a0MyZzR0VFpiZWQrWEpz?=
 =?utf-8?B?ZGZTc0MzeTc1K2EvUTRIa0xhbWJRSzRsdkdsRExXZ0h3ZW5XWFd6bzZmWERU?=
 =?utf-8?B?NTNqT0UwOFVTazJFa2dZK244OU1YNWpRVDRPbEJZakJoOGw5SDlzV0pqWm04?=
 =?utf-8?B?eDFUUFZmREtUaTIyaEFLOVRuWE1KN0NKSGxqdFZadDEvZXUyVkFlMUI0R0Z4?=
 =?utf-8?B?WW5GZHd0RjV2bjBZenBwYnh2S1VVRjUxaE5WM3JQRUNtWFBVRytSMWR4SlFi?=
 =?utf-8?B?VmNtUFFscUQ2Qm1zbk9MZWtOYnpDem4rV1ZqZXJ2bEpueGVITGhJa01YNDV1?=
 =?utf-8?B?UGR3YitrK3lQRGpsQlRXYm9nL0lDcm4zTDNkc2t3VEpPWFdYL2J4ZmgwVmd0?=
 =?utf-8?B?dldOa1RGUW96UE5UdVJDT1MrZGlER1E4REFIRWhIc2NtS2VFZFJEVVgrSWtx?=
 =?utf-8?B?QWVtM2FwYjltbU5waWYrSGVGaExadk5VL3kyNHlYR09rK3VuMXlQaTZnVGNN?=
 =?utf-8?B?RXM1K1MyR3lOM01FZXRrYm1pQkt1eDFPQkJCaXZhTVdCSFFFVlZZWW1LdmR4?=
 =?utf-8?B?ME1NYkI5K3FKRHh4TzhQdERWZi95MVZBWXdRMFMvZlRlWGUvdUhnQzFVTEZM?=
 =?utf-8?B?elovZDlXS0w3ay9WWm5tK0YwaUNHVzRIbnpxUFZ3M0J5SythbGh1aW5iSkFX?=
 =?utf-8?B?V1NuZU5tcVZjb3VTZnhVYWMvOHZzNkN4Nkpoait3SkJtZTZmZzUzR1I0REhR?=
 =?utf-8?B?a3NuWStxays4Vy9rRGR0cWk2SjAxdk9QbzlyUEZOaU1ENisxTjg1OW1JS2l5?=
 =?utf-8?B?V2ZUVkdxc1pxaURoV0xNME5aQ05MWTBVZlFTYk0vWm93VEw3VW1RVUdLTUpL?=
 =?utf-8?B?ZzUyaEdwL0U2OEFPNEVvSHU3YjF6Rm9GMjJuMnRmTGRhTFNBQWpxVWJoTWRL?=
 =?utf-8?B?enoxSUcyWWFUYUk1K1ZWMmE3TWVVMGpxMzRPS2M3Rm9EYk91UngrNm00R24v?=
 =?utf-8?B?UU9CWTBMZWxpZy8veURCd3FwYW9vQmNGVWNQdnZXSCsvN3k2eVc2THR6VjNM?=
 =?utf-8?B?cFlzVzVmSVlqVWlKcFJ4cm5LZ1Z4K1pvTDNCZHJNbkdLazhnbDN6TWRUSEdP?=
 =?utf-8?B?Tm5SSzhQd1lSOVdEQnJINlQ1ZVVCbENPZGhxMEJxR2I4Z0kvazBWOENid09s?=
 =?utf-8?B?eTJ4WkcyMHIweUluVlF4eVNLa0lhWTlsVFB5TnBWUC8rOGdCVk5ncVN0NTBP?=
 =?utf-8?B?SHRNRWdybytrRmlTMGRCZHkvVWlnaVo0TDAvRXhlWEY1V3UxaURSekZNWnJP?=
 =?utf-8?Q?Y8MYWi1RgJ68d2RyZvTdeCvCu?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 220d0cae-ec79-42a5-8952-08dbd194341d
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7705.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2023 17:44:26.4226 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: on/4uYBt6ks1xiKtcIH6uUbQQBG/mppQ5hHPcA3PQNR6oYXQPNkLCLA+I0cRKYk0Dc//FSOEeRV52sMHEYCM8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8724
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Move VM entries print to a trace
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
Cc: himanshu.girotra@intel.com, lucas.demarchi@intel.com,
 intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On 10/20/2023 10:21 AM, Stuart Summers wrote:
> While this information can be useful for debug, it is a little
> verbose to dump during a CI run, resulting in test failures due
> to disk limit issues in the CI machines.

But why does CI have this enabled?

The description for DRM_XE_DEBUG_VM says:  "Recommended for driver 
developers only."   I don't think it belongs turned on for CI.


> 
> For now, move these debug prints to a trace for manual debug.
> 
> Signed-off-by: Stuart Summers <stuart.summers@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_pt.c    | 35 +++++-------------------------
>   drivers/gpu/drm/xe/xe_pt.h    |  8 +++++++
>   drivers/gpu/drm/xe/xe_trace.h | 41 +++++++++++++++++++++++++++++++++++
>   3 files changed, 54 insertions(+), 30 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index 31afab617b4e..eb905878c4cb 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -908,6 +908,9 @@ static void xe_pt_commit_bind(struct xe_vma *vma,
>   
>   			pt_dir->dir.entries[j_] = &newpte->base;
>   		}
> +
> +		trace_xe_pt_commit_bind(&entries[i]);
> +
>   		kfree(entries[i].pt_entries);
>   	}
>   }
> @@ -929,34 +932,6 @@ xe_pt_prepare_bind(struct xe_tile *tile, struct xe_vma *vma,
>   	return err;
>   }
>   
> -static void xe_vm_dbg_print_entries(struct xe_device *xe,
> -				    const struct xe_vm_pgtable_update *entries,
> -				    unsigned int num_entries)
> -#if (IS_ENABLED(CONFIG_DRM_XE_DEBUG_VM))
> -{
> -	unsigned int i;
> -
> -	vm_dbg(&xe->drm, "%u entries to update\n", num_entries);
> -	for (i = 0; i < num_entries; i++) {
> -		const struct xe_vm_pgtable_update *entry = &entries[i];
> -		struct xe_pt *xe_pt = entry->pt;
> -		u64 page_size = 1ull << xe_pt_shift(xe_pt->level);
> -		u64 end;
> -		u64 start;
> -
> -		xe_assert(xe, !entry->pt->is_compact);
> -		start = entry->ofs * page_size;
> -		end = start + page_size * entry->qwords;
> -		vm_dbg(&xe->drm,
> -		       "\t%u: Update level %u at (%u + %u) [%llx...%llx) f:%x\n",
> -		       i, xe_pt->level, entry->ofs, entry->qwords,
> -		       xe_pt_addr(xe_pt) + start, xe_pt_addr(xe_pt) + end, 0);
> -	}
> -}
> -#else
> -{}
> -#endif
> -
>   #ifdef CONFIG_DRM_XE_USERPTR_INVAL_INJECT
>   
>   static int xe_pt_userptr_inject_eagain(struct xe_vma *vma)
> @@ -1276,7 +1251,6 @@ __xe_pt_bind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_exec_queue
>   		goto err;
>   	xe_tile_assert(tile, num_entries <= ARRAY_SIZE(entries));
>   
> -	xe_vm_dbg_print_entries(tile_to_xe(tile), entries, num_entries);
>   	xe_pt_calc_rfence_interval(vma, &bind_pt_update, entries,
>   				   num_entries);
>   
> @@ -1563,6 +1537,8 @@ xe_pt_commit_unbind(struct xe_vma *vma,
>   				pt_dir->dir.entries[i] = NULL;
>   			}
>   		}
> +
> +		trace_xe_pt_commit_unbind(entry);
>   	}
>   }
>   
> @@ -1627,7 +1603,6 @@ __xe_pt_unbind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_exec_queu
>   	num_entries = xe_pt_stage_unbind(tile, vma, entries);
>   	xe_tile_assert(tile, num_entries <= ARRAY_SIZE(entries));
>   
> -	xe_vm_dbg_print_entries(tile_to_xe(tile), entries, num_entries);
>   	xe_pt_calc_rfence_interval(vma, &unbind_pt_update, entries,
>   				   num_entries);
>   
> diff --git a/drivers/gpu/drm/xe/xe_pt.h b/drivers/gpu/drm/xe/xe_pt.h
> index d5460e58dbbf..c7e5f7111227 100644
> --- a/drivers/gpu/drm/xe/xe_pt.h
> +++ b/drivers/gpu/drm/xe/xe_pt.h
> @@ -18,6 +18,14 @@ struct xe_tile;
>   struct xe_vm;
>   struct xe_vma;
>   
> +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG_VM)
> +#define xe_pt_set_addr(__xe_pt, __addr) ((__xe_pt)->addr = (__addr))
> +#define xe_pt_addr(__xe_pt) ((__xe_pt)->addr)
> +#else
> +#define xe_pt_set_addr(__xe_pt, __addr)
> +#define xe_pt_addr(__xe_pt) 0ull
> +#endif
> +
>   #define xe_pt_write(xe, map, idx, data) \
>   	xe_map_wr(xe, map, (idx) * sizeof(u64), u64, data)
>   
> diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
> index e32f1cad51d9..24d898061d04 100644
> --- a/drivers/gpu/drm/xe/xe_trace.h
> +++ b/drivers/gpu/drm/xe/xe_trace.h
> @@ -17,8 +17,49 @@
>   #include "xe_gt_tlb_invalidation_types.h"
>   #include "xe_gt_types.h"
>   #include "xe_guc_exec_queue_types.h"
> +#include "xe_pt_types.h"
>   #include "xe_sched_job.h"
>   #include "xe_vm.h"
> +#include "xe_pt.h"
> +
> +DECLARE_EVENT_CLASS(xe_vm_pgtable_update,
> +		    TP_PROTO(struct xe_vm_pgtable_update *update),
> +		    TP_ARGS(update),
> +
> +		    TP_STRUCT__entry(
> +			     __field(u64, page_size)
> +			     __field(u64, end)
> +			     __field(u64, start)
> +			     __field(u64, pt_addr)
> +			     __field(unsigned int, level)
> +			     __field(u32, ofs)
> +			     __field(u32, qwords)
> +			     ),
> +
> +		    TP_fast_assign(
> +			   __entry->level = xe_pt_shift(update->pt->level);
> +			   __entry->page_size = 1ull << __entry->level;
> +			   __entry->pt_addr = xe_pt_addr(update->pt);
> +			   __entry->ofs = update->ofs;
> +			   __entry->qwords = update->qwords;
> +			   __entry->start = __entry->pt_addr + update->ofs * __entry->page_size;
> +			   __entry->end = __entry->start + __entry->page_size * update->qwords;
> +			   ),
> +
> +		    TP_printk("Update level %u at (%u + %u) [%llx...%llx]",
> +			      __entry->level, __entry->ofs, __entry->qwords,
> +			      __entry->start, __entry->end)
> +);
> +
> +DEFINE_EVENT(xe_vm_pgtable_update, xe_pt_commit_bind,
> +	     TP_PROTO(struct xe_vm_pgtable_update *entry),
> +	     TP_ARGS(entry)
> +);
> +
> +DEFINE_EVENT(xe_vm_pgtable_update, xe_pt_commit_unbind,
> +	     TP_PROTO(struct xe_vm_pgtable_update *entry),
> +	     TP_ARGS(entry)
> +);
>   
>   DECLARE_EVENT_CLASS(xe_gt_tlb_invalidation_fence,
>   		    TP_PROTO(struct xe_gt_tlb_invalidation_fence *fence),
