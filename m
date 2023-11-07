Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48D28C4332F
	for <intel-xe@archiver.kernel.org>; Tue,  7 Nov 2023 21:26:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 128E710E6B8;
	Tue,  7 Nov 2023 21:26:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE1BE10E6B6
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Nov 2023 21:26:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699392370; x=1730928370;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=uUP8MfA+gqa3SjtsHXA178VCxuMQ8DPZOCltVpzM74I=;
 b=FbZtLQz3nEv758DDrixlvIL7/i41CS/CsjzL6l2+VttDWI3i/Krfop9r
 qZlH9jAmbvW7D6b9idZBA0ZmvPuv613aaIOswCs8Jkf2AxFt5btasrOu4
 iD1d/8eDMekLwLCVhjFMCUOluUeOVsgPZOqe7Z1yVoqjR8Njz4itmga+C
 UyjmkyI9LiJsXbBXe7IJLQ2YRv6lPL4+iaajQW/HeFPGM1d8meIB/rBJ7
 yEK+LVkReYkWa4OwbgX5ZAHOB0CkiFj0hSG7JafU4gcNKSp4zpNQcXvQC
 ljiQ4Ezc/eL59skGer59fy2quY8JtG0NkSKMB+4zO9teK4EtmgLwI575V g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="388487334"
X-IronPort-AV: E=Sophos;i="6.03,284,1694761200"; d="scan'208";a="388487334"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2023 13:26:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="712701628"
X-IronPort-AV: E=Sophos;i="6.03,284,1694761200"; d="scan'208";a="712701628"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Nov 2023 13:26:09 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 7 Nov 2023 13:26:09 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 7 Nov 2023 13:26:08 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 7 Nov 2023 13:26:08 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 7 Nov 2023 13:26:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gJszcNxkYG7WlSMIG6Iiz2LaFfBi5GBVZnKPcS4XdWdFzt3jWYotkEY1R/c3sB1Qk4BvyZhGq2WjlbrKPHFNK6iDPEtmt1CiDQyvoQ7GgTUq1hF1j0tzQVQLX7kzXR8gg6op7QAffNkbdIkGcu4npLazc6N+dxb8YUjrlhGYwOuY2renxudOWM51K/LssxSFWuJbx6Az1u3SID9vJWUqD4sQRvjCLKLRolWr2tFBtVDYQ+xjXDGyBXtPm+RP45lL9ZJC/ixi/6eTNX1ALHuP3Jm/8hzer6mDXQflELkmi+BEuo8S0OfvFQP3/I2beCgCOpcRseLwt0hWvBvR0O9sFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5KcN4Abt0oUejq/XUE4yjqrznZ/XoYNwR6rzywe9Gx0=;
 b=iHzcxBkKlQFq/52yHakYam9oKGc5e9F0bL1SXV6GGIVTnGZETxI+OlvTZAklaE39MQFq9kJ3XsUhlG4J9esXZwTkal/F+XC9EEgah6PAEDP0CGcSLEVjwiXWXPrcXteahGhXjg1wifCL006vMnpFqXrhPcgTrPi758V1F9QNeO7Am0UqXoqzC81ekbg5jEFZV/OegSOrAu/lVSY++NsCdIfY5D9VgRG/g9lLTGfCuZ64Fqdal7uepY4Bkl1iAT+ONfnGn5y5SHOsqrQIsxuq1rXw2eqjWmk8l4HToigNlBt8wh7HHJgtz/9xBHkuLYe8OqKzZcdz0GVH5GdWR+TJiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by SJ0PR11MB5770.namprd11.prod.outlook.com (2603:10b6:a03:421::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.29; Tue, 7 Nov
 2023 21:26:03 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::588d:b37f:130c:9e86]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::588d:b37f:130c:9e86%6]) with mapi id 15.20.6954.028; Tue, 7 Nov 2023
 21:26:02 +0000
Message-ID: <98bebcf8-f997-4e32-8aed-c977fd5b1d42@intel.com>
Date: Tue, 7 Nov 2023 13:26:00 -0800
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Alexander Usyskin <alexander.usyskin@intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20231107115559.248879-1-alexander.usyskin@intel.com>
 <20231107115559.248879-2-alexander.usyskin@intel.com>
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20231107115559.248879-2-alexander.usyskin@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0215.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::10) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|SJ0PR11MB5770:EE_
X-MS-Office365-Filtering-Correlation-Id: 596b3a15-afdb-487e-9a68-08dbdfd824bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EbCZ/Bu2Xgm3WHejocW7DPvCMeNjpD5Y8g4NZIcDzodK1XArf4G81AJ5XXr1R6aAAHslPNhQCJgi7BpExMAHJs+wghvgGgf8li+KaDK0ysNWjbVvpKXOjeXcDVYiaNNXAjBqUD5AWGNZ0X7EzfwSR44L/PuWvboZyw9vUBjo/fufxNzTI4zeg3doyEpqnFsc7ne2s1yYIPqEsEdBcMrlhZ+mHMgA1KJFZjmf8IgXaFlxoOhKkbdibKT53tCaRSFtSySQmYR0NoBKluiN8p78VJv5JCb5eAjjugDBzlIezqe0RNGh0O+flCVY+e+wW9FHyGqFuUPTGaf1eWURXvzjWgqtlcIag5Ke7pCX9vK/4s4NxCmnWnoht7NSJ0hmnfx1xyQR24NhyTwYsRQBaB9eDEsLZWdcOEx4rKziVH2x0/BM4/SPHXBt0wZSVda2a3vk0pwqCm6BaLpwleHKyM9CWjb2Hu3KJPuv5BViZ4j3IJ3YsfZiOZ0BwJ2E1sTK21aGHOebwjGzQ4C8mx73/heeb2mGSo+BGCCGb0LLBRnoMiRjSwFNR5nIFjbAUhPRj5tv0GiRqhEu4LQBea3Tep6xLftxxY2XAzHNgNjghn6gFK9akqyB3ytfABYJHI6tFPCuLpzrbTnpxp2i5E4lLw75tw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(366004)(136003)(396003)(346002)(376002)(230922051799003)(1800799009)(64100799003)(451199024)(186009)(8676002)(8936002)(36756003)(2906002)(41300700001)(38100700002)(5660300002)(110136005)(4326008)(31696002)(6486002)(53546011)(66556008)(66476007)(6512007)(54906003)(316002)(6636002)(31686004)(86362001)(66946007)(83380400001)(26005)(82960400001)(2616005)(478600001)(6506007)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SENsRUdJd29hRGs0VmpyVkpnT1RVVDFFSkxxYTFWa0N4SmljRVMyc2Rpd1FW?=
 =?utf-8?B?ZUZyNzB2MWFUanlMdXhvTWZDQmZLclhTZUtYVk93SWtabzgyZVk1eFhTQVRE?=
 =?utf-8?B?ZVl6a3dkVWhCT1BuY283OHJic1pJMDIyVDdwbGdXZVhMNnFPRzVzaStPRzcy?=
 =?utf-8?B?dDhzVzh0UlRJejBwTkRNNzlQU3BYZWFFRDhYK1IwSkJIeWdyYkZWTjh3WDEz?=
 =?utf-8?B?ai9GaUVSSzVyN3lWYTNsRDlnQTd4UDdmcnJFcWVPYUZRdm1pa1Zta2pxaHF4?=
 =?utf-8?B?VURzd1gyYWczcTJZQktZNWMvem8yeHBRUnlyR0I2dk5sc00xcmVDV1dEZUpH?=
 =?utf-8?B?RnVqODNWSE5SZTh4cU1RcTBlYmhwc0x3Q2Mxd2dpY2RtdVpHQjNhMzdZdlU2?=
 =?utf-8?B?ZjlxNlJpdTNZQklPNWQ1RXNacklmTUkvZzU1czdvRjM0OTllbVpMMDJJeTh0?=
 =?utf-8?B?Wnc5eFdpcFlYSGJ6QTlhSTkwVDBGMHhvL1pjbUltZjZ2YUJhQnA3bTZ6cE1n?=
 =?utf-8?B?Z3BUYnp2bzR6VFlqdkNVenowK0NFMXZyTWw4Y0tEbXJ0d2t6VzRoZy80R2V6?=
 =?utf-8?B?WjZ6ckpOV3N0R1Jwci9udjh1WnFTY2FIWlFmaVBtcjRrUVpvQm9nUENmWjRj?=
 =?utf-8?B?aGZyRkhqMkJJU052dVpsTUhEWVU3VytDUjJRczRBRStOZnZRZkRtcy9YVzU4?=
 =?utf-8?B?b0V0OUxHQi8rbXFycXovWENsRzVhNlJtVTlDeHA5Q3BGSUZPN2oxbGwxYmd1?=
 =?utf-8?B?NFhNSEo4Y0JBOEMwaXVPOTF0WjRzNzdwTUlYeUdBbHJic3lUVXlaWlBGWnhH?=
 =?utf-8?B?SENGZTVjVnVoVUFmYnF1cmhWVE1Ka24yNThNaksyaTEwbTFsU2grQUtPbzF3?=
 =?utf-8?B?VzdzMDI2Wjc0WmV0REdaNlFPWlZtUTQrS2ZFYjZIZ2NjMnhWVGwxVEYvcnl5?=
 =?utf-8?B?WFE2ZEVvbU4zZHIyKzRWM0tGMGRjZkw4VW9EN0RYenI3Q2F2TTg2ZnVPeUs5?=
 =?utf-8?B?cUNFMndlWlJ5aVJUU2I3S3N2ditBS3RhL0hIVXZOc2o0eUdIVjJ2MWxzUjF0?=
 =?utf-8?B?NlhTNzJCb1NMQVpVVEkxYnVlV0tEYTVWcXJyUlhIS3NCZFB5azF3R3REVXho?=
 =?utf-8?B?elBLNGk4NiswcUYrR241ZDYrUzRWWUh5V25MM0VVL2NtNExBOTZzZVcvSFpa?=
 =?utf-8?B?UjFMaXVkdGFiNS9LTGRZcVhLRGVTTEFxZlBJUGJoM1FyOG5tVTRxT3FIbGVt?=
 =?utf-8?B?T0o4Wm9CR2NCbGtGc1FtUm5ya1VhcEFNbklXUDQ2U1cvemt0cWgvOHVpQ1VJ?=
 =?utf-8?B?bkJiVS9NL3laU2M5T3pVNnI4QUZpR0o4Szd6RGRUeVRPazRYdllxbmRZRXpl?=
 =?utf-8?B?UjREbXpPRzhZWGFPcHVHb1FGcGRUNm5pV2Y5YStoM3hDUXNUcEJSN3VDOE5r?=
 =?utf-8?B?Rmd5QlZ6V2lTL3pCQXZldndUbDZoWU5lSnhJdjg0RWcyb2RWOXlWVkRJZHk1?=
 =?utf-8?B?eTlIOWFid1RqVkpGeUR2UDh6YUFXOXBqQkpCK2VRTzNxK0g0VmpCb2ZPZWhI?=
 =?utf-8?B?QWZ2L3liWHl4VkdFTUdRQzZYWjdCM0RlN0NWb0M2MktTaWJPNFFLN0VITmZP?=
 =?utf-8?B?K0lheGIvQ21YM200dEg0L3NYT2d4MEhxb3BPZWJKVDRCZmx5SWxvQlpKTEZ5?=
 =?utf-8?B?ZHM2S09PTmgwbE5acGdndjlNZEVzY1JsbC81bVgwZEVUcTVvQ2RDbjM1d3R3?=
 =?utf-8?B?RTRCaEdHOUo0ZjFWMnFZR0l5SzNnb2tMWFdPUmxDcG04d2FVUVRTU1hBUlJj?=
 =?utf-8?B?MjkySmxaSEtUWUJCd1NIMWxFTm55UWIzYk9tUDArTEwxdEZQSmthOS9JVHla?=
 =?utf-8?B?NTAxVk9CbExEVWRMQ0RIRmp2UVh3d2NKVDBlZFZQREFLbGdncUV6T1Z4TGlB?=
 =?utf-8?B?OUhzcXRXYTgyRDdTZ2twdEFyem5LbUlVNnJ3KzVSM1hsTCtFVUkvdUpnNDA5?=
 =?utf-8?B?Zy95KzA4STVnaTIza2s3OExNV3VEYUpyWFRYSHdBaFF2U2hDeEFtUDc2NU9F?=
 =?utf-8?B?enpWV0lBajVZOWpEVUZwdzhjNS9DR0p6VW1Zem1ONlUrbzFPNklaQTdKVjFY?=
 =?utf-8?B?b01rcjhQS2ZmdU53YWpzYUpEbXhzY2ZxOG9nTnQyK0tzaSt2NTZmSzlzdmpy?=
 =?utf-8?B?M0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 596b3a15-afdb-487e-9a68-08dbdfd824bf
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2023 21:26:02.7108 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VkjAiheSG49lYYGTSzB6EJqnj9EwA62fDZAeNUKR42gv0EK80PSGQ9MjfIYNU3O1DcJvjU/g7tSGkkrJcPpfhbXlBo33aU7rb22+sNKxsbc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5770
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 1/2] drm/xe/gsc: enable pvc support
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
Cc: Tomas Winkler <tomas.winkler@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 11/7/2023 3:55 AM, Alexander Usyskin wrote:
> Configure and enable PVC HECI GSC support.
>
> Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
> ---
>   drivers/gpu/drm/xe/regs/xe_regs.h |  1 +
>   drivers/gpu/drm/xe/xe_heci_gsc.c  | 11 ++++++++++-
>   drivers/gpu/drm/xe/xe_pci.c       |  1 +
>   3 files changed, 12 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h b/drivers/gpu/drm/xe/regs/xe_regs.h
> index a646d13af03a..ec9372aa739f 100644
> --- a/drivers/gpu/drm/xe/regs/xe_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_regs.h
> @@ -35,6 +35,7 @@
>   #define XEHPC_BCS8_RING_BASE			0x3ee000
>   
>   #define DG1_GSC_HECI2_BASE                      0x00259000
> +#define PVC_GSC_HECI2_BASE                      0x00285000
>   #define DG2_GSC_HECI2_BASE                      0x00374000
>   

Just noticed that these define are in the middle of the engine mmio base 
defines. Might be cleaner to move them to a separate section, but not a 
blocker

>   #define GSCCS_RING_BASE				0x11a000
> diff --git a/drivers/gpu/drm/xe/xe_heci_gsc.c b/drivers/gpu/drm/xe/xe_heci_gsc.c
> index 3328ddca42d0..d8e982e3d9a2 100644
> --- a/drivers/gpu/drm/xe/xe_heci_gsc.c
> +++ b/drivers/gpu/drm/xe/xe_heci_gsc.c
> @@ -70,6 +70,13 @@ static const struct heci_gsc_def heci_gsc_def_dg2 = {
>   	.bar_size = GSC_BAR_LENGTH,
>   };
>   
> +static const struct heci_gsc_def heci_gsc_def_pvc = {
> +	.name = "mei-gscfi",
> +	.bar = PVC_GSC_HECI2_BASE,
> +	.bar_size = GSC_BAR_LENGTH,
> +	.slow_firmware = true,
> +};
> +
>   static void heci_gsc_release_dev(struct device *dev)
>   {
>   	struct auxiliary_device *aux_dev = to_auxiliary_dev(dev);
> @@ -172,7 +179,9 @@ void xe_heci_gsc_init(struct xe_device *xe)
>   
>   	heci_gsc->irq = -1;
>   
> -	if (xe->info.platform == XE_DG2) {
> +	if (xe->info.platform == XE_PVC) {
> +		def = &heci_gsc_def_pvc;

IIRC there are some power-related requirements for GSC in PVC. Is it 
safe to use the GSC without implementing that? Or am I just 
misunderstanding the requirements?

Daniele

> +	} else if (xe->info.platform == XE_DG2) {
>   		def = &heci_gsc_def_dg2;
>   	} else if (xe->info.platform == XE_DG1) {
>   		def = &heci_gsc_def_dg1;
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 2fae45b9d88e..682ba188e456 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -315,6 +315,7 @@ static const struct xe_device_desc pvc_desc = {
>   	PLATFORM(XE_PVC),
>   	.has_display = false,
>   	.require_force_probe = true,
> +	.has_heci_gscfi = 1,
>   };
>   
>   static const struct xe_device_desc mtl_desc = {

