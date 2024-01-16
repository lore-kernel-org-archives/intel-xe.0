Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34499C47077
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jan 2024 11:37:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5817710E32F;
	Tue, 16 Jan 2024 11:37:21 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27CCC10E32F
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Jan 2024 11:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705405040; x=1736941040;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=m0nAh+3f1fO3d3zR+pxiSuv/fZNGc9Jk8RUCIQ90Bu0=;
 b=Js7A47/1nz9cEbaAIs6JmoEDEOQlzFsQd1YJ6R2uAY7vVWp5cPRGPa3u
 jCp9G4x41NCj1PHTrfd6es7cInaGkgRwaA3+dJovRYVfOS4Fcciz/r6iH
 tqaUGifw50ieqUmAzfzzBTDZYsMdI17DFhHr5r0nijcQyKX6AhrO7jpmE
 IXMbngs1yZGQ9VrPh0Dot5se21UDdC9ZBWkOPy18Q6f/PGgye0JyL3AKm
 nXePYxjK7N1vcT3MphNyek0k9eBye8r1+MZ5r5FlzmE80Jn7jfMa/YM3g
 98v3nzBFwpFV10BGkK0q0dftkeuKxtq/c0UNqF6MmBiAZPJoUbMiARmOe w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10954"; a="7204979"
X-IronPort-AV: E=Sophos;i="6.05,199,1701158400"; 
   d="scan'208";a="7204979"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2024 03:37:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10954"; a="907351160"
X-IronPort-AV: E=Sophos;i="6.05,199,1701158400"; d="scan'208";a="907351160"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Jan 2024 03:37:19 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 16 Jan 2024 03:37:18 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 16 Jan 2024 03:37:18 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 16 Jan 2024 03:37:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FViOdO99aq3pbA0vpFU6xIRrx5/z8bxjMAb1Qe7U8gytID3H3IQOC5/PHTu4uhFRQG1QGrb+VUKlzsete/HGm9hUxqD+UM4aTMVKbewmhe8uI7ZH9w5wwxocv8UYsV7hQa30P2Xn52Y/2i3rQoAhM3ORlqEe4QYimesvEnW7+c8gKuyqAP5I5gD7ykTdvSFNvVfBbQRccZq1ODBS91oR6GS3lvZCHHIQyK/CpCtFAfbjChE4AcuIos3TqR9Fo5MutZ9+oYd8vSOGQ8tGHiWfyw0b/dplKX2SwIEJal21b97GHZn/BMZw6EnSUqPiZZfJPyTwWLjW4mJqaW6bhp+gdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j5vTkNqpJGTH1VvuIS2w4U5ITCF/hA2RIy/8eS0Ugtk=;
 b=XttdBv1bgna7TEbGxtzw2WR2xrSBxBJGvQdTU1s51g7+YnpYkYJi7KIFD9IXeWHyuJYFC9fnMtYg1y+jT5n0Sz9EvIJDyS34BVo7dBoY/Rs7KGfGJ03j8Yd+CyPOEUU2mUcBXcnGqCoVQ9zkC0hR0cxp9i2YDBNIBuuiL+E9Qu/iEJGc6di955XwZ7e2qQX/XlE9OgXxGCpt+zKjYArD25I602r10tm/ot11Itwo4fKgJKtF2wAUgXfcAOqAe+uMR+BVN3hTuvYqFSrhcgNSZ6wwazhZkKAVZrPnfoDneJYwH+SJilyY0UL9LkjrgOMHEV4YxddB+QQeHSyu0BXavA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by MW4PR11MB5800.namprd11.prod.outlook.com (2603:10b6:303:186::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.26; Tue, 16 Jan
 2024 11:37:16 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::8178:9420:e286:3136]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::8178:9420:e286:3136%4]) with mapi id 15.20.7181.029; Tue, 16 Jan 2024
 11:37:16 +0000
Message-ID: <7ea5cc7c-27d3-4f3b-9592-5c5181250203@intel.com>
Date: Tue, 16 Jan 2024 17:07:08 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/guc: Enable WA 14018913170
Content-Language: en-US
To: Karthik Poosa <karthik.poosa@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20240116095535.2304397-1-karthik.poosa@intel.com>
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20240116095535.2304397-1-karthik.poosa@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2P287CA0003.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:21b::17) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|MW4PR11MB5800:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c6fc2c4-d41b-469b-d33a-08dc16877d8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: x6+vMlsuY5KbrkPFmTYxQfQ4ZyWC178pF3Am3XSNLnEG+LXEyg3PxSkz5zS+v/keA7ybEPZ31F+HNOLrvxN81y5ME7CERuriq6pOqz+zrSicJNsrps+rADDArXdad1lbpgk/eNMCY+TT+n8sJlEqDn0YLOi0gey9+ejNapkI8OjKITFO+OWkBBYxpnxpn2NfMX5R4pnTS0C0a/JOi6YZPrx4E5SPQEGwwN87QPSYNDLWvU0OTgKN/KW1Dm/pHPGHV7symmAzCZLPpd+nSDrRJ/3Rel5JVfUpVQK7mfejJboYmmdBvIRgllhgTzJ0m1BWiOY/YEfmT6BtYL5Ret+0hB74XvbFsBFupvuRMIwzkEZVHuVsqPiiEXbzkpIkPLyqhYW0woj6SnGzav3D5JNlGSV8gTdQURuR7YZntSM6+wWQWFxiS4FKPJYZfWL1tUU5mMv6ILBimGowfCRQ9NIXRGcTL9E1xxHJt3ynO5AVFSp24iOEd+yNF8iHCTV09RX7Jw2DncTd33rfRd7J+GV3GJSFdUAxinFB3q25ew3cFusKYQJvzOMHufpTEiHJ//dKQ4sPmUHQ+v4++7aba9OQ6yZoVKwIa+PqAyoiks7YyMRrDr7GIvf7qNAW6TQEqZ+fJn+QX94jOewNEqXif3Bh2zdeY0I/m3kLf+VsqbOpEwIgdLLn62KPU4Qp4z3G8NW0
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(376002)(366004)(136003)(396003)(346002)(230173577357003)(230273577357003)(230922051799003)(1800799012)(64100799003)(186009)(451199024)(31686004)(83380400001)(41300700001)(36756003)(31696002)(82960400001)(86362001)(38100700002)(2616005)(26005)(107886003)(6512007)(6486002)(6666004)(478600001)(66476007)(66946007)(2906002)(8936002)(316002)(53546011)(66556008)(4326008)(5660300002)(6506007)(8676002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NW1tM0JDYng1bEwvcFFVRXBqL3o1bVFVRmhtT1BUeHk0N3pMTklPZWJtY01h?=
 =?utf-8?B?NUlNS1d5KzFGd2dkdDIwbkZKK2xKT0NPKy94Y2tTTVdnY0NvRWxaYjRaNmxF?=
 =?utf-8?B?MVNKRW9YMHF5blczdm9vaTF0eFk0S04wTk9Uc0R0QWNZUG1vVzNibHRPL2Ju?=
 =?utf-8?B?SWc1ZXc3UzhWeXljSUY5aXZ1RTdKdllWOFhFdG81S1dzb3dLcEcrYXdyRXAw?=
 =?utf-8?B?OTZxcDY0QWhyQ3hjbkRTeHVKMjVMVkNESGZjYlYrNTdBY2wrK29SM3JCS25W?=
 =?utf-8?B?bUd5eHoyV1h0UlhlS1NyQVM1WUtzTVhJeW9sdEpzQVh6QzhMS2ZHeFlEMzFL?=
 =?utf-8?B?L2twWEFDZklLSkVXaHQvRlFxWk1vWDNCRmtKT0RBUWNkTVFZMWtFcy9tNU1O?=
 =?utf-8?B?V1dtNFlOYmp0eVBKYlp0blRRNkU3WUlHRkQ0SHlOV29VS2gwU0htdnRZVkxw?=
 =?utf-8?B?WUQ2bkNMS3NCODRmQVlySVJwQWFpaEM1ekxZZk9FMnpSZmlyZGgxMWNnS3lZ?=
 =?utf-8?B?UkZCaFVPVHRobXJDeG56M3FCaEV0Rzdabnh2dFNVRTlXOUh1OUJlRXVqY3Jq?=
 =?utf-8?B?UmdWOXJXTXFwNmlVaFdyNmNVa3hMRWFENnM0bWJMTlFlTnFiUlkvRDJvalZm?=
 =?utf-8?B?b2ZmWC8rVUhqd08wRnBaQzUraVdGNWd6dHVWYkdQUkh1cXRrTGZhR2ZEMVdh?=
 =?utf-8?B?di9SS1hLb2dBNjFRaDR4bFBEaXcraXVybVBpQUJUL3FZZjZCcjBLZmhyNjRv?=
 =?utf-8?B?cEx5NCtqY3oxQ2NsVUJIYzJyYUJ5WkdPZTlMNldqaEE3eWVBK2MvY2s3U3BK?=
 =?utf-8?B?Y2s5ZCtweGp5eEE3QjA0UEtUV1JTWlprRFNUTW9JS3dDQlorU3BXOEs2MTM2?=
 =?utf-8?B?bDRoWXFMN2V3UEJhUHp0aEJGSUd5RUxwVi9LQTFMVFAxM3U1MVRWSVpXdGpV?=
 =?utf-8?B?eUhoY2xzUTIxdG1PNTBGU05rS2VRbjhGcyt1d0t1YTQwQTZuSzA0Q2NidnRP?=
 =?utf-8?B?SmsrOVA3QmhMb2NUcWxxb2xDbytWeE5MWnpROW1tZk81L21UUjdRLzZTK1BG?=
 =?utf-8?B?V3lDMGthdGowTm1CWFVRTzY1bnl1azVoZXd4eUhvSGN0V3ByaXpFSE1TRGxE?=
 =?utf-8?B?b3FSWDkzYzhJQm8yTHJCQ0xQci9Ic2pIZ3JTZmtqVVN0eVJCbkNxeWU3WWZK?=
 =?utf-8?B?RmZVQVplRSsyNldyQlZOS3lST0JJZDBWY2hablBiUTE3NFlTNk92YjJyd25F?=
 =?utf-8?B?QUk2UFFWb3BKcHo5OTVrRXo1WXo4ZXVjKzBWVExGd1d1NVJuaGpWVmVhWmo0?=
 =?utf-8?B?dnBXODN0UmxhQlo2Y3ZXSlExYnFkeFN6dENZK1FxV2p0akhNam02OGZmU2tY?=
 =?utf-8?B?dHh3RGxaZldjNGswNjBvWUdGTmVUMng2NDB5QTRPSkNjY0pxQlhEbjhJRjZu?=
 =?utf-8?B?R1NFVjF0QzQxK0lQbXpmU3hDWHg1bTVMT3dlWGE3V0xmQnBQZGR1OVZSWlZR?=
 =?utf-8?B?RXZGaFhZL0RjaDYwTlNIM2o0WVdLTHJ5M3lIQjA0a3NETWlqbi9QZzBES0Vw?=
 =?utf-8?B?TnRPandxUkp2YnRYbkE2WnZLOXlZS20zdlg5S3BIOTBvb1ZHcHc2QkRXYkJ1?=
 =?utf-8?B?SEpGMStRYW4rYURoc0lxVXlIVTRJWUlJSG92VzczcmNzY3dpTUFxOEtod0t1?=
 =?utf-8?B?dHUwb3dVOUpCTDRzRmVUeHlkYlhIeHU0QmhVanZ4T25wc0J5ZHkza2czeEYw?=
 =?utf-8?B?Y1JEK2xQbi9IQ1grbTlLTUJCa3B0allRcE15SjdsUjVtQnB4Q1hlZHlrdG9t?=
 =?utf-8?B?czZmcytQMXJ6cExWTktzOEplSUd3Mlh5Y2FjNHowelhqTlFzL2pxeEtCNE9z?=
 =?utf-8?B?U2Z5UTlQVDQyQ09wZGdnTmw1TEhteTNSWWs4U0x4T2FnOTRDc3FWazVpWGVo?=
 =?utf-8?B?clZka2R1OXZjQmtvaEFOK2w0dWhqb21QdTQ3MXNwcDRXNUNCWTJVVDQvRXRn?=
 =?utf-8?B?YTUwUm9rU3Q5YkxkZldteVJ4N3BLVmZQaHl3eWhvejNXQWdodVBlU21kTitI?=
 =?utf-8?B?dVpaMG9wV3FEUHhHdXlvcXo4azdsVkk5MXpBQU15MXB5aUtPTnB5NUN3dllW?=
 =?utf-8?B?ajdvQzA3VmIrK3htRzhyN255b05tSmw0VktNdmlPaTlhK1pZSGZON0w5M0Uz?=
 =?utf-8?B?TWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c6fc2c4-d41b-469b-d33a-08dc16877d8d
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2024 11:37:16.5957 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Oxjh4DvfhKipJF0cqfjf4ghJhSpVlOBvRswFjE/L/EX0B7VOH3kAS79waTNa9vKJR0Cr/YhXfNX/pk7m9vOQ3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5800
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
Cc: matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 16-01-2024 15:25, Karthik Poosa wrote:
> The GuC handles the WA, the KMD just needs to set the flag to enable
> it on the appropriate platforms.
> 
> v2: Fixed CI checkpatch warning, alignment should match open parenthesis.
> 
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_guc.c        | 13 +++++++++++++
>   drivers/gpu/drm/xe/xe_guc_fwif.h   |  1 +
>   drivers/gpu/drm/xe/xe_wa_oob.rules |  5 +++++
>   3 files changed, 19 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 235d27b17ff9..5ecd9cd964de 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -132,10 +132,15 @@ static u32 guc_ctl_ads_flags(struct xe_guc *guc)
>   	return flags;
>   }
>   
> +#define GUC_VER(maj, min, pat)	(((maj) << 16) | ((min) << 8) | (pat))
> +
>   static u32 guc_ctl_wa_flags(struct xe_guc *guc)
>   {
>   	struct xe_device *xe = guc_to_xe(guc);
>   	struct xe_gt *gt = guc_to_gt(guc);
> +	struct xe_uc_fw *uc_fw = &guc->fw;
> +	struct xe_uc_fw_version *version = &uc_fw->versions.found[XE_UC_FW_VER_COMPATIBILITY];
Why not XE_UC_FW_VER_RELEASE here?
> +
>   	u32 flags = 0;
>   
>   	if (XE_WA(gt, 22012773006))
> @@ -165,6 +170,14 @@ static u32 guc_ctl_wa_flags(struct xe_guc *guc)
>   	if (XE_WA(gt, 1509372804))
>   		flags |= GUC_WA_RENDER_RST_RC6_EXIT;
>   
> +	if (XE_WA(gt, 14018913170)) {
> +		if (GUC_VER(version->major, version->minor, version->patch) >= GUC_VER(70, 7, 0))
> +			flags |= GUC_WA_ENABLE_TSC_CHECK_ON_RC6;
> +		else
> +			drm_warn(&xe->drm, "can't apply WA 14018913170, GUC version expected >= 70.7.0, found %us %us %us\n",
> +				 version->major, version->minor, version->patch);
In bat results this warning is appearing even if guc firmware version is 
 > 70.7.0

Regards,
Badal
> +	}
> +
>   	return flags;
>   }
>   
> diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h b/drivers/gpu/drm/xe/xe_guc_fwif.h
> index 4dd5a88a7826..c281fdbfd2d6 100644
> --- a/drivers/gpu/drm/xe/xe_guc_fwif.h
> +++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
> @@ -97,6 +97,7 @@ struct guc_update_exec_queue_policy {
>   #define   GUC_WA_POLLCS			BIT(18)
>   #define   GUC_WA_RENDER_RST_RC6_EXIT	BIT(19)
>   #define   GUC_WA_RCS_REGS_IN_CCS_REGS_LIST	BIT(21)
> +#define   GUC_WA_ENABLE_TSC_CHECK_ON_RC6	BIT(22)
>   
>   #define GUC_CTL_FEATURE			2
>   #define   GUC_CTL_ENABLE_SLPC		BIT(2)
> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
> index e73b84e01ea1..b138cbd51bdb 100644
> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> @@ -17,3 +17,8 @@
>   14019821291	MEDIA_VERSION_RANGE(1300, 2000)
>   14015076503	MEDIA_VERSION(1300)
>   16020292621	GRAPHICS_VERSION(2004), GRAPHICS_STEP(A0, B0)
> +14018913170	GRAPHICS_VERSION(2004), GRAPHICS_STEP(A0, B0)
> +		MEDIA_VERSION(2000), GRAPHICS_STEP(A0, A1)
> +		GRAPHICS_VERSION_RANGE(1270, 1274)
> +		MEDIA_VERSION(1300)
> +		PLATFORM(DG2)
