Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA8B8C001B0
	for <intel-xe@archiver.kernel.org>; Wed, 16 Aug 2023 15:48:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EA2F10E37F;
	Wed, 16 Aug 2023 15:48:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2768D10E37F
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Aug 2023 15:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692200907; x=1723736907;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=PMr7tEAMn9VO3exuS9EHiAxvWwlCPUOz1EutOT6YC+4=;
 b=QDLgkM6u8Hm9arBXIg+zxMbiB7HXM7e8rf5xtQP4q9Ei7Xt4icBwoZ8w
 cB99Q6GW9+TXqX6US276IryXJQ7KuDdkqSUMEa6BXihij2UtuEqc9P4Mx
 sahXuXfBXa+LKHp2Kkx7G0c7U2+O8Q+ZItHQ2vDnUwIBE56ZzqTBC1Ivn
 0yDNxgBQoRLN/PbETpKu11S7nm4aqTZJw3dbkPJR/Dlk4ylX/LOIGai3K
 dIOb9aAsEMZA0CdNMtho2v3Y80l3BGOiIvLNjTUtmUIVqgHDlIOezcLkF
 1C1fr5IabvdLxPWsHYYHbawyIOXQTIlEFuG1V6Nd+i3nSsWBpEVLF/C2t Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="403541196"
X-IronPort-AV: E=Sophos;i="6.01,177,1684825200"; 
 d="scan'208,217";a="403541196"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2023 08:48:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="980770729"
X-IronPort-AV: E=Sophos;i="6.01,177,1684825200"; 
 d="scan'208,217";a="980770729"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga006.fm.intel.com with ESMTP; 16 Aug 2023 08:48:26 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 16 Aug 2023 08:48:25 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 16 Aug 2023 08:48:25 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 16 Aug 2023 08:48:25 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.49) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 16 Aug 2023 08:48:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cvkp8B4lo34FqH7NvqZqufaY1n2lwQ+VcDlAdL0vqk4wn9QJE5PkqHtJAqdKwvIKGAiJVwxlJFrElkFVqKnroV7fTm3/og83Kgz9ypQ2Z3vyYWhDojo+fcssfx/cRTUHNnBLqeRSrSfjofGzLvxkGRCNZjBfkUQpfVazrc2se1lPvYMoGp8KVQQu5Qsxnfe5MOV3PviEYiFQmJI5P2bqVNVvrZoppzE0ac0JSu8T5QIBgRx9+TuoiiNXejguAaom/ReHGNGlN0w/SKeW8NhP9ZFJufOzUydwejyyNySxjLDzaIFA+LOsgX4YfYr6tYQw2K9Z5xTuYZrghQQv/rmnSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6hg/4H5S5z49q2+lN4MC+POxKxZkt0KuC3GQ+mRbvXY=;
 b=ZvXRy6Eb6sF2hB1Yl6UHty/WRCuTGkLdLsHH6dIOGpZCBwt2IlblXLOB2+k6R0nT+VSrikphvdcgdfPDDICSvP4NTUTlSocN4HkmiMS7t2LxWexI6rRBUzP5JDD6QtMpo1ZgX/dvMpu+he0RmVkRiP3/JMigk2O/Vwe+o/EwFlMM3vSeNOiqfhBgVRI+L2wS7JMeDl/dQI0Moht1R1H0EhAFI7jym5YRKq2dtR+aoLLuiJzBGueiRYybi9dBkTPVPuPFa+p8fjMjD1+5V2/RqbvaXPKMPDIDVow5jJez3W+hECvh3TeAFi0NGvZkwS9p6O+olEhsqDadsautkauntQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by SA2PR11MB4889.namprd11.prod.outlook.com (2603:10b6:806:110::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.29; Wed, 16 Aug
 2023 15:48:22 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::1ed2:437d:1d6c:da25]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::1ed2:437d:1d6c:da25%6]) with mapi id 15.20.6678.029; Wed, 16 Aug 2023
 15:48:22 +0000
Content-Type: multipart/alternative;
 boundary="------------GFewcYcyoKAD5u4bIlvEDxbf"
Message-ID: <439234fc-4dcc-4f60-b71e-32e1be96d1b5@intel.com>
Date: Wed, 16 Aug 2023 21:18:12 +0530
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20230816115238.2340-1-niranjana.vishwanathapura@intel.com>
 <20230816115238.2340-3-niranjana.vishwanathapura@intel.com>
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20230816115238.2340-3-niranjana.vishwanathapura@intel.com>
X-ClientProxiedBy: PN2PR01CA0221.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:ea::17) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|SA2PR11MB4889:EE_
X-MS-Office365-Filtering-Correlation-Id: ece21de5-6c7c-4f91-11bf-08db9e7038a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JY/G+s+SP1xCVvAKqKCueex6C4qbgKB8yUjfYQjwWZjT7/BSaIdf1kW3z0t4zD9M/82oIhj7tck2MU6ShwI6ZPVyTCbSc1UIxKNE/Q7Nr4y876um3CyyCHp9hxvQJj50hcDinDxos98fGUOJTj3K5gGLi6bXuT3CAyo5hz/fdljusPSuRg2aaYNBtEzong5ijOZ/Y371DxnEPjy/IaZ/QdRuLQm0c3lZGTFNkBQAM0KOBzGCeMjln+hxOBDMOiBf1MtkUTJA/dyob0DlJskazA4cT6KCxUba7kDLV89277kf39n2hbk67jGwp1qWS8ni46Rh0zqBwsXSgM63pn2NrxeP+e2e73poZpA+gzWmSv91X5ZXibXVeRYRcnJKVgjQneFO8t89thoBn0ZLnxGzYi2xgm3zzGJV1rhUPSM1Jg49355NSyCbsQ4yRxO27i+v0iCEYxSRuFzMWPopEkkKceM3UeXf7+BV4Cd4jNhjVRjDCPhqVYnkZaD7Kx3zPZ2LF2K8bqiV/zDwB/WVeYc2Ey1WqIMHSEAEveI9Wt9vrfMYhohO9tfPPcLdVmue9HOt67PnQ6SvKJY62zuEUQwYuOpkWjEaakzCZrwRB6qQlZuxKzrU5LY4HAkz05XlzIGdN0Wg5+1fq7V7zzqdhhEs+w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(39860400002)(346002)(366004)(376002)(136003)(1800799009)(451199024)(186009)(316002)(66946007)(66476007)(66556008)(41300700001)(5660300002)(38100700002)(31686004)(8676002)(8936002)(82960400001)(2906002)(83380400001)(26005)(478600001)(86362001)(31696002)(6512007)(53546011)(6506007)(36756003)(6666004)(33964004)(2616005)(6486002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K3RGRE80bWV6dlJXSkxuSEhZU01BZ0t1cjUwb01BQWYwZmd4dENMMEdNd0Qw?=
 =?utf-8?B?TkRyT0FPN2p6R2IxOTlMbk4yNFBDa2VnVnFMUFpOMWZZNUZ3Yi9VQjlUL2hp?=
 =?utf-8?B?UmQyd3BNZ2JQMHFHU1JoemNpSVorR0tjWkYxc2V3Rkw0NUF3dHpuSHdxbXFl?=
 =?utf-8?B?ZkVpWnVLRnpQcXNuQmk1OW1TT2thd2hCMlBBQmJUU1pVOFkwRkIzY2NYUWcz?=
 =?utf-8?B?L0xkN1BjejJBSVVMVlpUT1RuMFBIbUxuNFJ6NXlBUDhUd0tJcHo2dmo4K1dS?=
 =?utf-8?B?TllVNVFQUVdNYlZmelNRR2xvaWNxMm1hblRZTDl6STlYeENTZm9PZ2d2TzRp?=
 =?utf-8?B?L0pPU3lMWFlNLy9JNzFXNFBwa2JuZXZ5S05pRlhBMHpMTlRPYjZXT1N4OEJQ?=
 =?utf-8?B?WEZSK3M5M1RPeVc5WWxkSko5YVdHRHhOeEVBblNycWRHdGgzd2k1NU0wMXFj?=
 =?utf-8?B?VjI3NEQwbUdOcU9pTEx6clJMQm5qR3NwNFRWVS9lVm5jRnFhTFhzZ0hhTG1s?=
 =?utf-8?B?bVowSmR2UGhTU2hUaXNnZTFMeXZLNy9hUHdmcitTVUZsN1A1RVdnYzRDNXRV?=
 =?utf-8?B?a1dxQnFyY3F0SStCS1lZbFhBV0Jhc3hTNk9EYWVBVXV6SHVXdHoydHVmVTZm?=
 =?utf-8?B?clFnQmtJazRWbHZyNE9FcXBkVjBhYkgxTlZSK1d6ZmVrcEdkNmdzdWZTU1NJ?=
 =?utf-8?B?Rm1hVGtnM1ZVMUxnTWk5WWtHSjZRVFB5aWhaRFFYNEc4Vm1QT1JENkZtbW5n?=
 =?utf-8?B?T2s0M25ueUp6REp5NTZvdGRoQVJZbzdldkFiUFI1ZFMwSGpjZU56Sm5MaTBM?=
 =?utf-8?B?eXMyQUV3TVU0OFB2QjRLYlZWcU9rNHVVVHA0eU5USzB2ajVhc0FBbWlBeEhl?=
 =?utf-8?B?UHBobm1pUkNWL2JOQ1ErWG55VjUzUlA4Z2xnWCtmZHorTmxrcGFYUFEzamF2?=
 =?utf-8?B?NVB3dmk2dXY0VnZqNS9pYVpiSkYvTzUxN0xub2hQRGpxN1RkczR0NS81REtV?=
 =?utf-8?B?cjdJcUczU1dtOUJSWGxiQnIyb2RqMXBoN2l0d1VrNzJRV01KY1RmTU1Ea3lN?=
 =?utf-8?B?WjltNzFYMHJ2Rm5KVm9pWVBUamxtNEZqdlpuazUveTg2cmZZcVdSNkt6OVZt?=
 =?utf-8?B?ZU14dXRNWVRGQTd5SmhBT1FHRm1XQTBZV2ZYUzZxUzJkVnBYenNVYzVVUlRG?=
 =?utf-8?B?N3ZBV3plaDd5b08ySVU2bnBJaVNpWVBqa3Z5MjZ4blRDVmcrOFhiTlB6RFRQ?=
 =?utf-8?B?d21nMXdYMnFqbjVOQ1FtQlAySWhqdjdEZHFHNC9HRXhPdkFQNHhMaDdVQnB2?=
 =?utf-8?B?Z21Pb21ZY1dKcnVRWGFhMUJoYnRPeExTcmFRQ0VtR1I4T1YybU5vVnJXNEkz?=
 =?utf-8?B?QUxadnZCQU9ESk95M21OZTJtTjF5REZoekZ6YTJwaElqODNEdDFKaHpFeXBh?=
 =?utf-8?B?YnY5UUd2eGZyK1V5UE5kdzZwZ0RFcm1FK1RyOTcyYVZacVVGcVhINk83blh5?=
 =?utf-8?B?bnJkZ1NkNUQyT1U3MGFwSHViM3FnNERGdVY5T202ODRtQU9QSDkwMktRVTdJ?=
 =?utf-8?B?OEdHcytBUjJXNlRTbkppZ3J2a2wvam01bkJlTnpKNUdTb2RjOTBPUTVmNjdS?=
 =?utf-8?B?TVJleThMNlJha21vdE9XR0dvVi8ra2xtK2JwdmZ3WGhMQXQ0Nk8wT2wxL0h4?=
 =?utf-8?B?ajgrU2Z1anpKNXpBZkVuMFFPYWtzRTFTTitJczJEa2NERnJjVE5vVmc1emZB?=
 =?utf-8?B?Mk5teEt5OWZWcUd0dk5oR2sySXRuU0wxMk90VXc5REFUUWNKNy9xYVR1Lytv?=
 =?utf-8?B?VFRoWFJ2bmxzY3RsMkIzVFZXZFlnUDM4bG53NjRUWk9UeldkdzZhRDBvL1hD?=
 =?utf-8?B?Rk5YL2MyWndNUkhJNmRETlJhS2cyRCtNVXFaRjRhN1JNNUVUSjNMd2pOeS9B?=
 =?utf-8?B?ZHM0ZHJwdkJjbiszaTloU2pjSW9kRnBzWXR4NnFnTDVqbENmaXdFamFQYmFS?=
 =?utf-8?B?SmI3dzBPV0I3Y1gvMUZ0emt4TFhrL2l1SnhEMW5OY1g1cS9IMVFock5sSVpy?=
 =?utf-8?B?Y1pZSWkvMDRmcU5sTVYrZGpFS3VFRmlNb0tOQ05NMEZZYzFyMFJENlJocERP?=
 =?utf-8?B?M2ZyL2R1NEVublk0Y1BZcnlzR0E1WlZtYWhaZ2VTTzlURXBOYk5WejBraUdD?=
 =?utf-8?Q?f5FvzjH0VkknXzLApDfE4vM=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ece21de5-6c7c-4f91-11bf-08db9e7038a3
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2023 15:48:22.8057 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WtmRPNDK56DBOEQ+Jk6MQ8Jl6s69QFrhXcDcI/cJFDsu6T1HvcKUIkJ3QXTpqzgtEvpIucSWW25B0edB1FNPe3bJ242bTALEheyXZq7qJ2E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4889
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 2/2] drm/xe: Add
 CONFIG_DRM_XE_PREEMPT_TIMEOUT
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

--------------GFewcYcyoKAD5u4bIlvEDxbf
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Niranjana,

On 16-08-2023 17:22, Niranjana Vishwanathapura wrote:
> Allow preemption timeout to be specified as a config option.
>
> v2: Change unit to microseconds (Tejas)
> v3: Remove get_default_preempt_timeout()
>
> Signed-off-by: Niranjana Vishwanathapura<niranjana.vishwanathapura@intel.com>
> ---
>   drivers/gpu/drm/xe/Kconfig.profile | 11 +++++++++++
>   drivers/gpu/drm/xe/xe_hw_engine.c  |  5 ++++-
>   drivers/gpu/drm/xe/xe_hw_engine.h  |  5 +++++
>   3 files changed, 20 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/Kconfig.profile b/drivers/gpu/drm/xe/Kconfig.profile
> index 9ad487647ca1..a3655ee6978e 100644
> --- a/drivers/gpu/drm/xe/Kconfig.profile
> +++ b/drivers/gpu/drm/xe/Kconfig.profile
> @@ -22,6 +22,17 @@ config DRM_XE_TIMESLICE_MIN
>   	help
>   	  Configures the default min timeslice duration between multiple
>   	  contexts by guc scheduling.
> +config DRM_XE_PREEMPT_TIMEOUT
> +	int "Preempt timeout (us, jiffy granularity)"
> +	default 640000 # microseconds
> +	help
> +	  How long to wait (in microseconds) for a preemption event to occur
> +	  when submitting a new context. If the current context does not hit
> +	  an arbitration point and yield to HW before the timer expires, the
> +	  HW will be reset to allow the more important context to execute.
> +
> +	  Value should be within the DRM_XE_PREEMPT_TIMEOUT_MIN/MAX limits.

Is there plan to make this config dependent on 
CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN/CONFIG_DRM_XE_PREEMPT_TIMEOUT_MAX ?

If not, value should be within 
XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN/XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX.

> +	  This is adjustable via XE_ENGINE_SET_PROPERTY_PREEMPTION_TIMEOUT.

If IIRC ioctl calls names are changed from XE_ENGINE_* to 
XE_EXEC_QUUEUE_*. Please confirm.

And this statement seems misleading, ioctl callwill set the properties 
for specific exec_queue and config is meant to be for all exec_queues 
unless changed by ioctl.

IMO better description will be "preemption property for exec_queue can 
be adjusted by XE_EXEC_QUEUE_SET_PROPERTY_PREEMPTION_TIMEOUT" or we can 
skip this

info altogether in kconfig because ioctl description might be already 
covering it.

BR

Himal Ghimiray

>   config DRM_XE_PREEMPT_TIMEOUT_MAX
>   	int "Default max  preempt timeout (us)"
>   	default 10000000 # microseconds
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index c44540684462..4c812d04e182 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -370,7 +370,7 @@ static void hw_engine_init_early(struct xe_gt *gt, struct xe_hw_engine *hwe,
>   		hwe->eclass->sched_props.timeslice_us = 1 * 1000;
>   		hwe->eclass->sched_props.timeslice_min = XE_HW_ENGINE_TIMESLICE_MIN;
>   		hwe->eclass->sched_props.timeslice_max = XE_HW_ENGINE_TIMESLICE_MAX;
> -		hwe->eclass->sched_props.preempt_timeout_us = 640 * 1000;
> +		hwe->eclass->sched_props.preempt_timeout_us = XE_HW_ENGINE_PREEMPT_TIMEOUT;
>   		hwe->eclass->sched_props.preempt_timeout_min = XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN;
>   		hwe->eclass->sched_props.preempt_timeout_max = XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX;
>   		/* Record default props */
> @@ -562,6 +562,9 @@ int xe_hw_engines_init_early(struct xe_gt *gt)
>   	read_copy_fuses(gt);
>   	read_compute_fuses(gt);
>   
> +	BUILD_BUG_ON(XE_HW_ENGINE_PREEMPT_TIMEOUT < XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN);
> +	BUILD_BUG_ON(XE_HW_ENGINE_PREEMPT_TIMEOUT > XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX);
> +
>   	for (i = 0; i < ARRAY_SIZE(gt->hw_engines); i++)
>   		hw_engine_init_early(gt, &gt->hw_engines[i], i);
>   
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.h b/drivers/gpu/drm/xe/xe_hw_engine.h
> index 3d37d6d44261..71968ee2f600 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.h
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.h
> @@ -30,6 +30,11 @@ struct drm_printer;
>   #else
>   #define XE_HW_ENGINE_TIMESLICE_MAX (10 * 1000 * 1000)
>   #endif
> +#ifdef CONFIG_DRM_XE_PREEMPT_TIMEOUT
> +#define XE_HW_ENGINE_PREEMPT_TIMEOUT CONFIG_DRM_XE_PREEMPT_TIMEOUT
> +#else
> +#define XE_HW_ENGINE_PREEMPT_TIMEOUT (640 * 1000)
> +#endif
>   #ifdef CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN
>   #define XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN
>   #else
--------------GFewcYcyoKAD5u4bIlvEDxbf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi Niranjana,<br>
    </p>
    <div class="moz-cite-prefix">On 16-08-2023 17:22, Niranjana
      Vishwanathapura wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20230816115238.2340-3-niranjana.vishwanathapura@intel.com">
      <pre class="moz-quote-pre" wrap="">Allow preemption timeout to be specified as a config option.

v2: Change unit to microseconds (Tejas)
v3: Remove get_default_preempt_timeout()

Signed-off-by: Niranjana Vishwanathapura <a class="moz-txt-link-rfc2396E" href="mailto:niranjana.vishwanathapura@intel.com">&lt;niranjana.vishwanathapura@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/Kconfig.profile | 11 +++++++++++
 drivers/gpu/drm/xe/xe_hw_engine.c  |  5 ++++-
 drivers/gpu/drm/xe/xe_hw_engine.h  |  5 +++++
 3 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/Kconfig.profile b/drivers/gpu/drm/xe/Kconfig.profile
index 9ad487647ca1..a3655ee6978e 100644
--- a/drivers/gpu/drm/xe/Kconfig.profile
+++ b/drivers/gpu/drm/xe/Kconfig.profile
@@ -22,6 +22,17 @@ config DRM_XE_TIMESLICE_MIN
 	help
 	  Configures the default min timeslice duration between multiple
 	  contexts by guc scheduling.
+config DRM_XE_PREEMPT_TIMEOUT
+	int &quot;Preempt timeout (us, jiffy granularity)&quot;
+	default 640000 # microseconds
+	help
+	  How long to wait (in microseconds) for a preemption event to occur
+	  when submitting a new context. If the current context does not hit
+	  an arbitration point and yield to HW before the timer expires, the
+	  HW will be reset to allow the more important context to execute.
+
+	  Value should be within the DRM_XE_PREEMPT_TIMEOUT_MIN/MAX limits.</pre>
    </blockquote>
    <p>Is there plan to make this config dependent on
      CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN/CONFIG_DRM_XE_PREEMPT_TIMEOUT_MAX
      ?</p>
    <p>If not, value should be within
      XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN/XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX.<br>
    </p>
    <blockquote type="cite" cite="mid:20230816115238.2340-3-niranjana.vishwanathapura@intel.com">
      <pre class="moz-quote-pre" wrap="">
+	  This is adjustable via XE_ENGINE_SET_PROPERTY_PREEMPTION_TIMEOUT.</pre>
    </blockquote>
    <p>If IIRC ioctl calls names are changed from XE_ENGINE_* to
      XE_EXEC_QUUEUE_*. Please confirm.</p>
    <p>And this statement seems misleading, ioctl call<span style="white-space: pre-wrap"> will set the properties for specific exec_queue and config is meant to be for all exec_queues unless changed by ioctl.</span></p>
    <p><span style="white-space: pre-wrap">IMO better description will be &quot;preemption property for exec_queue can be adjusted by </span><span style="white-space: pre-wrap">XE_EXEC_QUEUE_SET_PROPERTY_PREEMPTION_TIMEOUT&quot; or we can skip this </span></p>
    <p><span style="white-space: pre-wrap">info altogether in kconfig because ioctl description might be already covering it.</span></p>
    <p><span style="white-space: pre-wrap">BR</span></p>
    <p><span style="white-space: pre-wrap">Himal Ghimiray
</span></p>
    <p><span style="white-space: pre-wrap"></span></p>
    <blockquote type="cite" cite="mid:20230816115238.2340-3-niranjana.vishwanathapura@intel.com">
      <pre class="moz-quote-pre" wrap="">
 config DRM_XE_PREEMPT_TIMEOUT_MAX
 	int &quot;Default max  preempt timeout (us)&quot;
 	default 10000000 # microseconds
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index c44540684462..4c812d04e182 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -370,7 +370,7 @@ static void hw_engine_init_early(struct xe_gt *gt, struct xe_hw_engine *hwe,
 		hwe-&gt;eclass-&gt;sched_props.timeslice_us = 1 * 1000;
 		hwe-&gt;eclass-&gt;sched_props.timeslice_min = XE_HW_ENGINE_TIMESLICE_MIN;
 		hwe-&gt;eclass-&gt;sched_props.timeslice_max = XE_HW_ENGINE_TIMESLICE_MAX;
-		hwe-&gt;eclass-&gt;sched_props.preempt_timeout_us = 640 * 1000;
+		hwe-&gt;eclass-&gt;sched_props.preempt_timeout_us = XE_HW_ENGINE_PREEMPT_TIMEOUT;
 		hwe-&gt;eclass-&gt;sched_props.preempt_timeout_min = XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN;
 		hwe-&gt;eclass-&gt;sched_props.preempt_timeout_max = XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX;
 		/* Record default props */
@@ -562,6 +562,9 @@ int xe_hw_engines_init_early(struct xe_gt *gt)
 	read_copy_fuses(gt);
 	read_compute_fuses(gt);
 
+	BUILD_BUG_ON(XE_HW_ENGINE_PREEMPT_TIMEOUT &lt; XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN);
+	BUILD_BUG_ON(XE_HW_ENGINE_PREEMPT_TIMEOUT &gt; XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX);
+
 	for (i = 0; i &lt; ARRAY_SIZE(gt-&gt;hw_engines); i++)
 		hw_engine_init_early(gt, &amp;gt-&gt;hw_engines[i], i);
 
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.h b/drivers/gpu/drm/xe/xe_hw_engine.h
index 3d37d6d44261..71968ee2f600 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.h
+++ b/drivers/gpu/drm/xe/xe_hw_engine.h
@@ -30,6 +30,11 @@ struct drm_printer;
 #else
 #define XE_HW_ENGINE_TIMESLICE_MAX (10 * 1000 * 1000)
 #endif
+#ifdef CONFIG_DRM_XE_PREEMPT_TIMEOUT
+#define XE_HW_ENGINE_PREEMPT_TIMEOUT CONFIG_DRM_XE_PREEMPT_TIMEOUT
+#else
+#define XE_HW_ENGINE_PREEMPT_TIMEOUT (640 * 1000)
+#endif
 #ifdef CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN
 #define XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN
 #else
</pre>
    </blockquote>
  </body>
</html>

--------------GFewcYcyoKAD5u4bIlvEDxbf--
