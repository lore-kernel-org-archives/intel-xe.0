Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58CEBC46CD2
	for <intel-xe@archiver.kernel.org>; Mon, 22 Jan 2024 22:15:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 201E710F071;
	Mon, 22 Jan 2024 22:15:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47F7510F077
 for <Intel-Xe@lists.freedesktop.org>; Mon, 22 Jan 2024 22:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705961706; x=1737497706;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=sesUiyMMf6aAVClhqky3mVV2SEhPsN6SK81e8E9G2HQ=;
 b=L6lWh7I94PfhfHSHcjso30olqoR/DfqBY/1IxMlqmeHjzYXM+8NAPDB8
 IYEmv25zDtL9fRNPF7BP4KAvZU7c/iCH9daxg7AEwv3oJ04JIlrs3Rm99
 FBL7aBJUkNcBjbQKTAiyDUhLJMWtsbtN0mS9FtbdO5Et2F7wHgo6AZj/E
 XI4367L+vrMUnep93IhQ/oBn4EY0vJFtNpOudWiSBYgPNKP0AgGOdgNLh
 bsF6Z7WSaF+Jmwn5+ATKVhmxONqs9xZWgfwjyL0/IsHtomWj12gg4wY3q
 sGwWcm6EfsnUpI50pM41HU3OAMkYKmTpw4EBdg7i0vW4RIXIb+IqBiKE4 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="8452453"
X-IronPort-AV: E=Sophos;i="6.05,212,1701158400"; 
   d="scan'208";a="8452453"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2024 14:15:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="909080888"
X-IronPort-AV: E=Sophos;i="6.05,212,1701158400"; d="scan'208";a="909080888"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Jan 2024 14:15:02 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 22 Jan 2024 14:15:02 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 22 Jan 2024 14:15:01 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 22 Jan 2024 14:15:01 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 22 Jan 2024 14:15:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qcey7hNt3iptoIGDqj/O5ou1uMjiJh5eU/H67GzaFqETt05JY/0u/NQDEyvvGuWEr9ibPbEIvcgLbwXWLjg7Q+ThjA+9BnAKzNUCjwMvm4uCihfx30OxxsnUMDJmOkaxv/DCjwOm2jgiQcnbvlQmfQciFa7KG6ctPrVUAI4glQjKaF0iSgBKXcCRMrOIkE3jgkbwq8xr1ZB/+T8/3JfoaSFBbyjl4sqAmAcLW7QfzHC4O6URcKqBIS1qxC5tZ4ZmfTuPXbaREpbDZv3IRDuH1ZqFRFJXloY1QixQRRgsRo30w7hzKKX/UMP3NJbRFTGjjwAzawFrz00jHZpEqYzAxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nj1mrysjX6F54yDSWk2Wul6ETQ7P4jHOtQk8V0JPmoI=;
 b=ULPSgGT/noG3QX5eihz0XWmlqwLcukHImd8kVGRpW5iP9zJDledwoXssHVTE9Gp+or7CRpBsOXXTzspzq+yEzeNQJ3ibFHWh9ZmgbugQS7WHC53tUWhX6R2zuWegtq3OlXqnhadcKT5AF3WgLHsOBUlbTVI7HxXG4sMkcWshDEm3yuyy5a9ODXmiFUVetlmXoSeakKsBIhYwCIdYjWdsED31UMISYVju0+fNY1dUen+LSVF6nc+xSV2DcjKZysGlWBVSGf3KdeUSqHkLgkKyEaW1r+MJYaNvmlfymBqwlS591mCV/F8gbb7YMjxFmSEs76WBGwxcpeMWU722xp0Erg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB7705.namprd11.prod.outlook.com (2603:10b6:806:32f::16)
 by CH3PR11MB8342.namprd11.prod.outlook.com (2603:10b6:610:167::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.32; Mon, 22 Jan
 2024 22:14:58 +0000
Received: from SN7PR11MB7705.namprd11.prod.outlook.com
 ([fe80::83d:7cbc:ec45:cb9d]) by SN7PR11MB7705.namprd11.prod.outlook.com
 ([fe80::83d:7cbc:ec45:cb9d%7]) with mapi id 15.20.7202.034; Mon, 22 Jan 2024
 22:14:57 +0000
Message-ID: <069f1653-d286-4bce-84f7-e2198ba0c5e8@intel.com>
Date: Mon, 22 Jan 2024 14:14:56 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/xe/guc: Update to GuC firmware 70.19.1
Content-Language: en-US
To: <John.C.Harrison@Intel.com>, <Intel-Xe@Lists.FreeDesktop.Org>
References: <20240122213708.1841488-1-John.C.Harrison@Intel.com>
 <20240122213708.1841488-3-John.C.Harrison@Intel.com>
From: "Welty, Brian" <brian.welty@intel.com>
In-Reply-To: <20240122213708.1841488-3-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0295.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::30) To SN7PR11MB7705.namprd11.prod.outlook.com
 (2603:10b6:806:32f::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB7705:EE_|CH3PR11MB8342:EE_
X-MS-Office365-Filtering-Correlation-Id: 77f187c5-f511-4ead-b971-08dc1b9791b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JbSaNZZ56xsaCztCZrod/bP7M8maBfw9LYRCO3/rR1wC7P03L3LhLoZvRaeyLwwzIs/QKSRAIs6iUZcWaTdsDw2EjDkOlOznQZxwVLfQdkxDV0l4cE+BlDdJILeqlAlXvQ60q7rltdRK87+lHTenF2mjPZVh85Q9uE5A4jKyu+sXwBRlVOc/coxNy6o7yRX6tY41jmZkdMTiJKUT8rLVlYqla98p/u9oU+5vkMwgHiaLqEq+RS0AGP+bjWToWdeOphYdNIGamQFdtN8Cr/4JouZwBA2pQbuJh9OqZG9ZiDHvJoNqfxMsJlADImJMFfB4w1VS7iXt6nqGyIMMLl6O/y8JhxadQ2NPO7i3lTzWcYPaYsyBEXUABspUvSghGr6HNs33CqZPwLkSW2rbyKCP0e0/M3J22pEdqp2SFO4GdV+vxuTqi+4TDEhdkQ0cpU8Ukk9TGnfVQPJenLyh/88LTCMNLas4BacEzmFpLjHGoD4H1OpYHLlneU5LBEgNK8ldqu01ADJxqslRRQmSWPY3+71H8sxDwG4nAefG1tS2idKgblgxy0n5ndZObccGkGBD4+akRaUhqUU82iPxP929gT8g4b5feQiTrftnZ3RcL9tG/5xNRirR2kbEuYnpFFVhMm4O9JAnln7dQ70/XGsOTQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB7705.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(39860400002)(376002)(366004)(136003)(346002)(230922051799003)(186009)(64100799003)(1800799012)(451199024)(31686004)(26005)(6512007)(53546011)(2616005)(6506007)(36756003)(31696002)(82960400001)(38100700002)(86362001)(8936002)(8676002)(41300700001)(6486002)(2906002)(83380400001)(5660300002)(66946007)(478600001)(316002)(66556008)(66476007)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YSsrbkZsRVkvcGJWajV6NEZtWjhoTVNacFUrWHVoVVl6QVNKc1gwNnJPNll6?=
 =?utf-8?B?U1c0VGVydWxZWFRYcTZueFJ6WnM1MWlGdmtNMTdicWxGUVpvMFRzYmZIRVVq?=
 =?utf-8?B?NExKeXNNWnphNFl5SVhvZkhXYWlQN3Z4L24wdHNMZUpzUG1NcTZVejVpTW9N?=
 =?utf-8?B?bGoxdFpiTTlNdXZybnZ3Tm5iUGMvK29EVDFOQWJjeFhvOU9TMmllSlVOQzZ6?=
 =?utf-8?B?OC91TjBvQURSdks3L0JwT2Y2WjZORUhtTWhvSFhaZGo3YlNZWTRuQmJyYVlk?=
 =?utf-8?B?RnQ3aUE5Sm9ZU2ZFUnh2bGJ2ZlpzVk1BTncwWEZtRVg1Y3Fzcjdpa0UzTkNV?=
 =?utf-8?B?R1R0K0d0U0NrUGl1RkM3S0Z5TlBjbmZHSWZsRFJJUUZvVGR3ckNJMmcrc0g3?=
 =?utf-8?B?L1VjZlNYRXJLd1ozRG8vN0tnOUJibnJIY2RUMVVPM0tCRW9pSUxKaEcvZzZB?=
 =?utf-8?B?R3BJa2RIVVE4RGtaT29jRmQ3b0kya2sxeGR1RnBkaWNOdXZzeVNzdk5XUGdu?=
 =?utf-8?B?NHRaZWlMZEZobW9PMTNEVnVMdUdLUkV5alVoYXFlRDZNNjRtZlliVWhkemJZ?=
 =?utf-8?B?NmVkaXYrRUJtMXE3V1RtWll5QWVvUUY3NE5ZeSswdFFQNTNHWUJGdHo2UDN6?=
 =?utf-8?B?SzdpWCtKZ2U1UkM5MWIxU0ZxNzUreEovVGYyZlUxM2x6TmsramtqK0wxVHEv?=
 =?utf-8?B?b2xEWmlsWG04cENuQ1Z6bzRMV2xtRW5iRmw2UnlEaC80cWhycTc3eE9iMWJ5?=
 =?utf-8?B?cGwrZVVEaUdKU3hicWtXRmo5bEY3T09rK2x2bVlKR3Q1cGQ3TzZrNUI0QzVq?=
 =?utf-8?B?QWZ2cDZYdkl0YlBDS0ZwdzAvbU5NSi9oaGVMRjdaNjFrbTJ4RlM2SDJaK25U?=
 =?utf-8?B?NHA0S3pNa01PalpMRitDRTNKK0pXUzYzREpRYjNUb1o5NW1IU3E1M1c4Nkxj?=
 =?utf-8?B?aHVDUXM0cXI0VEo5QmZiRUo1N0VjNnluNnd0dzVkY3FDdDdJcEJxb0c1YTlK?=
 =?utf-8?B?VmxsbHVCNlhkTS92NjYxbHB0OFpncXM3S0RKVEw3SHplRC9ZclBYOHJTSjNW?=
 =?utf-8?B?L0ZaTUNvSFh2ZSt4QWkxNUhCbEtxRTE1TnBzdzdES1dJb08rbGpXMFE2RzdW?=
 =?utf-8?B?QkFGdWo3MnNlYlAydkd1cDB4UTVIU1RDZ1N0MWtjN08yWWt3dWJMWFVZTy9Q?=
 =?utf-8?B?NnBBekRZYVpoL1dNdkxhVk0vYi94emdRNTRDdDlZKzVaU0VxcE4yaHh0bFhC?=
 =?utf-8?B?ODhwY0pXbU12SXBJMVNLZVhmOGlJMVUxV1Z1VzBWdzhHVTNBWmxrTmZ6b2F4?=
 =?utf-8?B?Vlc0dmJnNUM1LzJOaEh3Y3dneGJlNFN3TmVyakxDTlh1dXdEMlFUL2hKOFI5?=
 =?utf-8?B?YXp4VGZ4OGkzZGhCcjNvLzllZzdZa2FEZlkySmNtYThqbHIwb2xGaVl6Vit1?=
 =?utf-8?B?UTdPK0d2SzRhODZvQkU2dTdwc3ZaeFFFdjg0cGQrTDRlS0p3NFdSZ2ZuNlNx?=
 =?utf-8?B?VnltT1NhRUFqL2RyY3g5QS9wM292cTlVcG9qY09Jd2FibDluMTd2WUxsZHpl?=
 =?utf-8?B?YnVRTDVXZXhtVHYrQ1FHR2VaRDRFK2hkclVRNVkwVWRJdnZicGxVZHprNk56?=
 =?utf-8?B?alFzc2lCS092MU5WNWZ2S29ZRHUyRVlBdGt3ZE9xRURzTmVhdHlCUStVRUlz?=
 =?utf-8?B?b0U2TDRhaFpiby94SHQ2NXlqMXlndWNsRldFb1E2dWVoWjhUZzZhREljUWU5?=
 =?utf-8?B?OSttN2ZKemhhbEhONmFlQnNtamdlWFFsY1pBdnFUMk9ZOUJFRHJDSW1XS2VT?=
 =?utf-8?B?blQyVXFBVDE3TVU5RGFDQWh5RW5SRkM5N2d2eFRKaUNkR1JDVFFFOS9mSFBn?=
 =?utf-8?B?THlEcEdCcEhhcUtEOGF3R1Q4U3l6ZzVXNCsxcUxoTEphVlVMaUEzZUhxT012?=
 =?utf-8?B?UWNtR0Z4azlMSXJ0WHVrWU9reWNtZExpMDVjQ0JyRDY0M3BJSk5BNFJGOXZO?=
 =?utf-8?B?UjFUdmRjN3U1OFpieXVYUlRSZWNPUGRiR25OL3Z6UHluRnB6eHdJeVM3dmtF?=
 =?utf-8?B?VW5Ha2xYbStMK3ltSDdaZjRPallTWkNUMldYOS8rZUlXZjIzSU1yM3pYZDla?=
 =?utf-8?Q?BBPT05o2X7tsKP6z8GjDYtReA?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 77f187c5-f511-4ead-b971-08dc1b9791b6
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7705.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2024 22:14:57.9467 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vaQlL0JLbVW00Clkg73Ywpic6du79Ne5o+/GeAMbfJhquQXiaLZGKlUOQPbDC+LP2RdrzXUasFL7clVCndcVjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8342
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



On 1/22/2024 1:37 PM, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
> 
> UAPI compatibility version: 1.8.1

I've wondered for awhile why was lagging behind here....

Reviewed-by: Brian Welty <brian.welty@intel.com>

> 
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> ---
>   drivers/gpu/drm/xe/xe_uc_fw.c | 16 ++++++++--------
>   1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
> index d3f0fe2101a7..8da6cbb8c9e2 100644
> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
> @@ -103,14 +103,14 @@ struct fw_blobs_by_type {
>   };
>   
>   #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)			\
> -	fw_def(METEORLAKE,	major_ver(i915,	guc,	mtl,	70, 7, 0))	\
> -	fw_def(DG2,		major_ver(i915,	guc,	dg2,	70, 5, 0))	\
> -	fw_def(DG1,		major_ver(i915,	guc,	dg1,	70, 5, 0))	\
> -	fw_def(ALDERLAKE_N,	major_ver(i915,	guc,	tgl,	70, 5, 0))	\
> -	fw_def(ALDERLAKE_P,	major_ver(i915,	guc,	adlp,	70, 5, 0))	\
> -	fw_def(ALDERLAKE_S,	major_ver(i915,	guc,	tgl,	70, 5, 0))	\
> -	fw_def(ROCKETLAKE,	major_ver(i915,	guc,	tgl,	70, 5, 0))	\
> -	fw_def(TIGERLAKE,	major_ver(i915,	guc,	tgl,	70, 5, 0))
> +	fw_def(METEORLAKE,	major_ver(i915,	guc,	mtl,	70, 19, 1))	\
> +	fw_def(DG2,		major_ver(i915,	guc,	dg2,	70, 19, 1))	\
> +	fw_def(DG1,		major_ver(i915,	guc,	dg1,	70, 19, 1))	\
> +	fw_def(ALDERLAKE_N,	major_ver(i915,	guc,	tgl,	70, 19, 1))	\
> +	fw_def(ALDERLAKE_P,	major_ver(i915,	guc,	adlp,	70, 19, 1))	\
> +	fw_def(ALDERLAKE_S,	major_ver(i915,	guc,	tgl,	70, 19, 1))	\
> +	fw_def(ROCKETLAKE,	major_ver(i915,	guc,	tgl,	70, 19, 1))	\
> +	fw_def(TIGERLAKE,	major_ver(i915,	guc,	tgl,	70, 19, 1))
>   
>   #define XE_HUC_FIRMWARE_DEFS(fw_def, mmp_ver, no_ver)		\
>   	fw_def(METEORLAKE,	no_ver(i915,	huc_gsc,	mtl))		\
