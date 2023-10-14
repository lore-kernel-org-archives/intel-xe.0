Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFE1FCDB47E
	for <intel-xe@archiver.kernel.org>; Sat, 14 Oct 2023 01:05:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6894310E034;
	Sat, 14 Oct 2023 01:05:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C127F10E034
 for <intel-xe@lists.freedesktop.org>; Sat, 14 Oct 2023 01:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697245555; x=1728781555;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=degXfGL08zKpSAb9Ns1EXh04TxHuG65Br8VPGyTv1Dg=;
 b=X3dx28UHBrkTmo6wKX5Qgm0650gfaI4QznwpD1mHJ0oW8jaA027AZ3Yh
 rNzpNom4XqnajA46XRqjXwA8V493n3cU7PEaRsaUzByNEVVhEgHnqQ/Zk
 b+mhTjTkjxzSxhnx++/RstPe5P22gKCcH1qDszGGxYccQXL0glGebwM4W
 2dL5F4FBNfbmPpFryjsoZO7BHRO/DSNVX1i7zcePUWQ8EoGcV/xEroyn+
 jR7KQTud6BNaWEB+kjn6jNFBKbnXppDcgceOjsIR9kMTQZ+OSbOhC1l3m
 8oxTjBPyRVbIhPFNYxUyeG/Uwhk0KrMX6cwMz2isobXJlTyvVXx5XT7MH g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="364657087"
X-IronPort-AV: E=Sophos;i="6.03,223,1694761200"; d="scan'208";a="364657087"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2023 18:05:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="748555664"
X-IronPort-AV: E=Sophos;i="6.03,223,1694761200"; d="scan'208";a="748555664"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Oct 2023 18:05:55 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 13 Oct 2023 18:05:54 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 13 Oct 2023 18:05:54 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 13 Oct 2023 18:05:54 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 13 Oct 2023 18:05:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fav0nl60+sdVz8ufAd1/aOj5p5WQo5zX5YcNKl9C7P6dyvYaIfx9CLjF8c6sU2LaqGA911JVqYmf8GIidta+Hsi2UwaaHZMX31gqm2g+mu2x/EL3brQ9AVQBCHQdUvu3hsTOZYFOwXEcEm9Keg+ydb+yGFPPM1hS/nbROerQXlgjMBeVNgxNjmsKmRwV0hPUSI9troZFD6DgnvL0uTTAR/Nw7l4t23WzIlcRtdZYhoPZx/EJx8SHaXC+WFVQWT+IZxeN7/zo78q4R44HmcBJspibz+PuG0lPwcIcTiDLtp4ZI70aa6aCWzc/eRGy3NXfnJ0FI9Yz0ckzNB6hlGORNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CLGm8E+GqBS99oaBllhoiR55v5JnCCCNubgIZAkCIEQ=;
 b=NVYz2s0osPIS5vtMsqoSPLgFurpgra4OqZcJalEl+jH3YX0eZhtUkqeIPoVo7dwwbzMN07mUpXEPGivhJkVVcnHuRwsscVQowdedX2we/A3mLZ+cVusAUKnFbQxyFz5lDITBmN22o6F7hFJCZhAc2pErPhvSxMAtQJ2j7Y5o58cCUkuibd5h0TPSW//nugPu95BfOrvW2gKRfF3LET7yvpMQt/9TVc2Dx1Shq/8XAqkmNIqUJg3mvtiX43acoSR6QQ/NNgHHkJzpSs0gz0Rd85v9ZJYx9TC1ORSpxm/bkNL6jRQk353NUQbDEY6z0iO8SQVNUpZCyI4PLIOZKSOzAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB2987.namprd11.prod.outlook.com (2603:10b6:5:65::14) by
 MW3PR11MB4620.namprd11.prod.outlook.com (2603:10b6:303:54::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6863.42; Sat, 14 Oct 2023 01:05:52 +0000
Received: from DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::cd4f:fe89:df17:61d]) by DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::cd4f:fe89:df17:61d%5]) with mapi id 15.20.6863.046; Sat, 14 Oct 2023
 01:05:52 +0000
Date: Fri, 13 Oct 2023 18:05:50 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
Message-ID: <ZSnpbmKpGtZzNiJZ@unerlige-ril>
References: <20230919161049.2307855-1-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230919161049.2307855-1-ashutosh.dixit@intel.com>
X-ClientProxiedBy: BY5PR03CA0009.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::19) To DM6PR11MB2987.namprd11.prod.outlook.com
 (2603:10b6:5:65::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2987:EE_|MW3PR11MB4620:EE_
X-MS-Office365-Filtering-Correlation-Id: 65bed25f-c2e0-4cbd-acb0-08dbcc51b5f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6ffKTymH4d41tB81CyMa31TaClRNP2RqFPalJym4h6xnRaM/DtKWm7fxCycTAAguXRKLHifAeViqLBwkH1q64X+4pMNOcM1hyobCcw9MQegrADQjDvAN98P/R/VWCKcQ/I3Z2FluH5nb5JJFVOJ36tWPUNMGKKN76hZury2/qnQeEl8ujkcPIp4W0XswgEJCyUJ5CDL3yA0Jv8PUPmI91LMfdgB4Oz/dvfeHqfLdNfnxTfSTX2iPJYbtlnMpbx+38lp3VkoioRrNc/GlqtS0MsrwejST8eKaWowsCwYVjMv5ASYRvTlk24Gi8p5je8QhRV8ehBHwhCGtSrEp8Z/kTd3iZaPDUwf99B8SxoeQLlCcXcNbkKHgWxARaFK/xcCMm8T/dAJrLAdwohkiiERWoN8vFNyyQhk/3+BcfauqFSJNmxiZqL/jK8o3vJb6Pt4nJRrgRz+EbGqdRTmc5tqa9fjRMTwjj4AumEknwiPmUfR7Brj0tbEnKn7WHiinnnokkWC3oqKoJER4cM2ulyI1vy3/8ZJCPu2fbtnCn6oyuhdc+x4Lj0iFCjKKe04Qok3yS4bRzVdaIX3epHOvpCXACg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2987.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(366004)(396003)(39860400002)(376002)(346002)(136003)(230922051799003)(186009)(1800799009)(451199024)(64100799003)(478600001)(966005)(6486002)(6506007)(8676002)(316002)(5660300002)(83380400001)(4326008)(6862004)(8936002)(2906002)(38100700002)(86362001)(6636002)(33716001)(66946007)(66556008)(66476007)(41300700001)(82960400001)(6512007)(9686003)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?KzRveC9wSXdENUxKc2ZqMDhWd204Rkh0UlRNY3lVc0wwaEpvN0g0TGhqOHRh?=
 =?utf-8?B?Rjg4LzdFQ1dwSHI5L2dFZzJGYWNjRzI4dk1haE9QdktEckk1czVwczQ2RzNT?=
 =?utf-8?B?U1ZYWjZyV0Z0bWsrME13R3BuYTNtVk9zL3dlVzNIY1Q0MVRLckt6U1p2Y0tr?=
 =?utf-8?B?MkFkWGdLVkZjUjYyZWh2VENLWFZremVyQkpMRTVpaXBnSGRJcWlNV2dxemxh?=
 =?utf-8?B?Rk9NSzNWbG8ydkxKQ3lnRk1WVWkyd2h4QUFBSjZHVTZuRGgxUmUrbllqV0xQ?=
 =?utf-8?B?ZG5lU3JEUG9hVTJEOEs5UDk5V0l1enZwR1hCQ1FRWHltbzVLWUpMZGh1V1ll?=
 =?utf-8?B?cXd3VmpPUVJabWhQa3dROFkzdS95ZGpiRnJNSjNpRFZnZk82djRiWEl2aGFy?=
 =?utf-8?B?MjNnSXMvNE1uQ3kyVFBCaDMxeVpmMWhTeUhqcHd1NFE3VFBhblpUV3NJUDc0?=
 =?utf-8?B?RS9CaGp1Q3VDZzlON050WEFhWGozanZzZ1kzVHRvQ291Sk1XWnk1c2gvV0R1?=
 =?utf-8?B?SzJoNmhMUHlseEdGUG9uaEZZczV5WklOTlUvZ1JEYlpVQ2ZzTFk0dmpNSURS?=
 =?utf-8?B?eGdLUE5HNGtGbXNBZy8yN3dIcUZzUFRSbEx0U2F4dld1R0xsOG9ab2JEOWti?=
 =?utf-8?B?bE90Z2xyTWQ2SlI3UXpTMnVVd2R2OVo2Z0g4ZXpGWXZwSzN3TzE5STRocHFP?=
 =?utf-8?B?YTNXdU4xREN4ejVGc2ZFZ2Zla2l6dmx0V1FaR1E4ZGM1RVhYU2tMN2tlOHQ2?=
 =?utf-8?B?Ym4vbCsxTFU5dXdJNVU3UzZncjRMM0g3Unl6Rm51ZEliTUlDMFZlRjJjdmpa?=
 =?utf-8?B?eDB5MlVXL1NlQUd4ZmFFT1RwMWUzaHBEUEFsbk5BVFhZSDhFYS9ZSThaa1lt?=
 =?utf-8?B?YTFNWWI1YzRvbXZXaXVaOFl1akRsSjRpM0dmOU9rUXV5WEQ0UHZ0ei9qdTAv?=
 =?utf-8?B?NHZGSkpJRUdqTmpLMVhGbFlhcGZudUpSbHZwWlBYTm1KZVc1cG42K0hvbm5j?=
 =?utf-8?B?dVVQa1dkLzR1Z2t4OE5Jd29DT3pIUitDcGo4NTdmWmNWK3Z2U0xFQUw0bVFD?=
 =?utf-8?B?M2NEUHhmOVJpNWY3STdxakJLcXRlazIrcXk1ejZUbm41OVoxb3RyR0NiamJ2?=
 =?utf-8?B?WURTcnZ1elN3KzhVRFVSQWlUdmg1RTNWU3laTXBGZ3gzYU0xSUhhN2l6TWRu?=
 =?utf-8?B?c2RxNjQ2cWVnVW9Xem5PL1lmTDA2UDRRK1R2LzcrdmY5WWNFQjZSSzZZTWlh?=
 =?utf-8?B?S1VVM2RPSUQxTWFua1hucXp4bXgyNGJUQ2VGTFgzaXBkRk5DVkRTRDFHTFlW?=
 =?utf-8?B?ODF6RGhVcjdVN2VGdzByRlY0SFlkL25BVnpxUWxDSms2TGttMEs4VHdFV3BU?=
 =?utf-8?B?VWFGK3FUQ2Y0UlF4UzVBN1I2WVZYaXFKQUJVSm0rNjZUaGcrRnQwc0pzWGhm?=
 =?utf-8?B?K1VPc3dJSDVuS3liTWk3N0JCNHcvSUNheEpQK3czd0NzWE1pZ1IrdDFiS082?=
 =?utf-8?B?anlRRnJjL0F1ZWtsNWRyS3pQamhUcVpsZkR4QlQzRllKakh5a1ZCbS9IVHNr?=
 =?utf-8?B?OExTSi9PVFczdXIrZktyTjgzSVh1Zy82Y2pJMFhINmZTdWV4WDErRi9rQkg2?=
 =?utf-8?B?ZjFLYnU1bVZIQ1FVV1RXQkNzTi9leU0wVW9KZmtjVTF5TXlDYzBBMytDdUZI?=
 =?utf-8?B?ekRFcTk1b1NQNlo3bHd2Mlcxb3AyUmpvWVJJWDdFcHFrQWhjeVhuWGQyUTA4?=
 =?utf-8?B?cDg5WUJPMEo3Q0liSXRhQlZ2U2dPaDdMUVpqcTJJckY4RGFHbXRQMU5PaTBm?=
 =?utf-8?B?ekRxWGFrM0VYTTlBcWdxcTVBQWR2VjF0YXJjQUpCQkk2a0pIQWxJdVM3dCtQ?=
 =?utf-8?B?MWFneDNwcm5yN2QxUmlNK3BzZy9jTVVaQUpxU21paGt4dUE0d3hxVDVyVEJs?=
 =?utf-8?B?N1pkdEJmM2tzU0JJNU9jamxqV3NYN3lLSVdmS21LZ0RXcFJ6VlBrZlNCb1Bj?=
 =?utf-8?B?MkFBOGhlOFNPbWhHN1BkL2YxTHNkUWh3K3pMZXZ2TmRNMFRYSHBHZGxDVHl1?=
 =?utf-8?B?QTA5b3ZXRHB3aDN0TGhGZGRyRHpFeFE5NHFkOWg2d3FQNTBnRytJT3BrR0ZH?=
 =?utf-8?B?TDk2WXRidWRzSTBtUDliVk01TENhMkx1MDV2UGVab3dqOFlxV1F4S09lYmZW?=
 =?utf-8?Q?f/noYkbaXK9yKQIKQBQ6GSo=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 65bed25f-c2e0-4cbd-acb0-08dbcc51b5f3
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2987.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2023 01:05:52.1799 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ctK8qaOXYDLZdrw/BPGiXjsrblXbwk9ZHKXEM2MvTU3Co5v1Dq5eLe1zPpBFOgw8g4uDWdA1DC39bWquVwx2Oeaz6M/sVrmUHIegzWm1WBw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4620
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 00/21] Add OA functionality to Xe
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hi Ashutosh,

Overall, the non-uApi code looks good. I believe you are refining the 
uApi further, so will wait for that. Can you also please drop unused 
code and replace the patches with the final code for each piece. I can 
review it from scratch and refer to i915 offline as needed.

Thanks,
Umesh

On Tue, Sep 19, 2023 at 09:10:28AM -0700, Ashutosh Dixit wrote:
>This patchset is the initial port of i915 perf/OA functionality to the XE
>driver. The following features in i915 have not been ported and will be
>added (as new patches) if/as they are needed:
>
>* Inline batch submission on stream exec_queue/hw_engine
>* NOA wait
>* GuC ctx id (guc_sw_ctx_id)
>* CTX_R_PWR_CLK_STATE/GEN8_R_PWR_CLK_STATE
>* hold_preemption (DRM_XE_OA_PROP_HOLD_PREEMPTION)
>* sseu_config (DRM_XE_OA_PROP_GLOBAL_SSEU)
>* MTL bios_c6_setup
>* ratelimits
>* compat ioctl
>
>I am providing the following additional HAX patch (not part of this series)
>to help review these patches:
>
>https://patchwork.freedesktop.org/patch/551683/?series=120100&rev=4
>
>The commit message in the above patch explains how it can be useful for
>reviewing this series.
>
>This series is also available at:
>        https://gitlab.freedesktop.org/adixit/kernel/-/tree/xe-oa
>
>The series has been tested against this IGT series:
>        https://gitlab.freedesktop.org/adixit/igt-gpu-tools/-/tree/xe-oa
>
>v2: Fix build
>v3: Rebase, due to s/xe_engine/xe_exec_queue/
>v4: Re-run for testing
>v5: Address review comments, new patches 11 through 17
>v6: New patches 18 through 21
>
>Ashutosh Dixit (21):
>  drm/xe/uapi: Introduce OA (observability architecture) uapi
>  drm/xe/oa: Add OA types
>  drm/xe/oa: Add registers and GPU commands used by OA
>  drm/xe/oa: Module init/exit and probe/remove
>  drm/xe/oa: Add/remove config ioctl's
>  drm/xe/oa: Start implementing OA stream open ioctl
>  drm/xe/oa: OA stream initialization
>  drm/xe/oa: Expose OA stream fd
>  drm/xe/oa: Read file_operation
>  drm/xe/oa: Implement queries
>  drm/xe/oa: Override GuC RC with OA on PVC
>  drm/xe/uapi: "Perf" layer to support multiple perf counter stream
>    types
>  drm/xe/uapi: Multiplex PERF ops through a single PERF ioctl
>  drm/xe/uapi: Simplify OA configs in uapi
>  drm/xe/uapi: Remove OA format names from OA uapi
>  drm/xe/oa: Make xe_oa_timestamp_frequency per gt
>  drm/xe/oa: Remove filtering reports on context id
>  drm/xe/uapi: More OA uapi fixes/additions
>  drm/xe/uapi: Drop OA_IOCTL_VERSION
>  drm/xe/uapi: Use OA unit id to identify OA unit
>  drm/xe/uapi: Convert OA property key/value pairs to a struct
>
> drivers/gpu/drm/xe/Makefile               |    2 +
> drivers/gpu/drm/xe/regs/xe_engine_regs.h  |    2 +
> drivers/gpu/drm/xe/regs/xe_gpu_commands.h |   13 +
> drivers/gpu/drm/xe/regs/xe_oa_regs.h      |  173 ++
> drivers/gpu/drm/xe/xe_device.c            |   13 +
> drivers/gpu/drm/xe/xe_device_types.h      |    4 +
> drivers/gpu/drm/xe/xe_gt_types.h          |    4 +
> drivers/gpu/drm/xe/xe_guc_pc.c            |   60 +
> drivers/gpu/drm/xe/xe_guc_pc.h            |    3 +
> drivers/gpu/drm/xe/xe_hw_engine_types.h   |    2 +
> drivers/gpu/drm/xe/xe_module.c            |    5 +
> drivers/gpu/drm/xe/xe_oa.c                | 2314 +++++++++++++++++++++
> drivers/gpu/drm/xe/xe_oa.h                |   27 +
> drivers/gpu/drm/xe/xe_oa_types.h          |  307 +++
> drivers/gpu/drm/xe/xe_perf.c              |   36 +
> drivers/gpu/drm/xe/xe_perf.h              |   16 +
> drivers/gpu/drm/xe/xe_query.c             |    5 +-
> include/uapi/drm/xe_drm.h                 |  288 ++-
> 18 files changed, 3272 insertions(+), 2 deletions(-)
> create mode 100644 drivers/gpu/drm/xe/regs/xe_oa_regs.h
> create mode 100644 drivers/gpu/drm/xe/xe_oa.c
> create mode 100644 drivers/gpu/drm/xe/xe_oa.h
> create mode 100644 drivers/gpu/drm/xe/xe_oa_types.h
> create mode 100644 drivers/gpu/drm/xe/xe_perf.c
> create mode 100644 drivers/gpu/drm/xe/xe_perf.h
>
>-- 
>2.41.0
>
