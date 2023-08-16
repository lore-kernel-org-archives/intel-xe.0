Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C624C0015E
	for <intel-xe@archiver.kernel.org>; Wed, 16 Aug 2023 02:21:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0717610E2B4;
	Wed, 16 Aug 2023 02:21:31 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA7E410E2B4
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Aug 2023 02:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692152489; x=1723688489;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=HWssvPB2qp+YP5uLXMprN4QxlgefMD6IGEplpSFAJ0s=;
 b=c2Y+aR61Vem5G+EJs6Iz1BPJ3XKnkeTGBa1A9C1ne2eO895F1Lgoeedi
 5cXuec3iD1J+6828Qhb0YxJm5Wa6WmnBkiab49ag04x5iOc3SPAkETsGx
 rzOZUU5VstDNAfWRILukhVu8zmwbPz6XHZn/FPIoq6LQUSKWSLjs9u5bc
 b9kGSBsCj6PKWYHA0QmpgsFuNMstJOjsqY9HoLdSPCBWTiH+8rwSZ0VGo
 IefycJNsYuOr/+FqehngYR8LzWgY4oT2AtWGM7LuInYMWfBcwgOXlRMBH
 zFB6KgLCE0X1Uojyem4uOsxZTSrlhXdejzyWlzPauIwQdUCXTHP/HnWNp g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="352750541"
X-IronPort-AV: E=Sophos;i="6.01,175,1684825200"; d="scan'208";a="352750541"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2023 19:21:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="824065562"
X-IronPort-AV: E=Sophos;i="6.01,175,1684825200"; d="scan'208";a="824065562"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by FMSMGA003.fm.intel.com with ESMTP; 15 Aug 2023 19:21:29 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 15 Aug 2023 19:21:28 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 15 Aug 2023 19:21:28 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.106)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 15 Aug 2023 19:21:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eHqH5e3cOoXuJ5SuT270vheuxwUJrlZFNM9tV+mv7EOQtsSSKqweBFA+rhUUux7l6zAsClJmosgvIBV0oVHmj7gtswtf9U5jt/h9BPuoh27pCCfyBlvstQOULmCKe1Vhs1slrLBuDOYS3Gic9z0Gj66P6B9fdX8YtDuUUpErR6uOEPEOjaaHvaeawgCls4rLDRa/jwWE9BdAUpMlHbvf+x3NKcbRmjwF/AFCZvD3w0XzF4QvkUFLQqEeMxBHzTz3asnLQGPLiSiBy4CfVuTpZQBNQ5jXpnEFyal9cFUTX0j9EJsOGuaXBBcb330xISpiHtgoqd5Gt2OIKvpcF4OCRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1y3nnxJ4Rv/RbtrTMoo8Ir/6a2e+h+EHxl7qYnbYRsg=;
 b=RAurq/EKKWCKXhixKHp2D6te87YNo2PvW4bqS2C7LJOlVDBtqPSozv8dEPfpuXEvdtSF3LfD/6KjeNQdI3VbofEw5Vt+tSCobPAd5MlMdKVy+z8nYz22/Nkn3xTuyrkxWODUKpU07j1LwoH5zAPncuNvU2cF0he4uPLhHsE3DhLU5Cvemc/dpHtNtQbTZUE4spWpPaJTvtFCAnchMNZ46fhioPrdlXZ7iWx5Xo563/3hsqv80c8bSgUA+HQ+5hN85ruYsTr1nPLsXBuSzay/27ZvYl9f2GgHN1PimwpXt7gVg8oiRuAJMv1nJvjuQB3PfdOyfJzkGE/eJEHROPTOIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB2987.namprd11.prod.outlook.com (2603:10b6:5:65::14) by
 SA3PR11MB8075.namprd11.prod.outlook.com (2603:10b6:806:303::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.26; Wed, 16 Aug
 2023 02:21:26 +0000
Received: from DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::5f98:c6b:6aa8:4a8d]) by DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::5f98:c6b:6aa8:4a8d%2]) with mapi id 15.20.6678.025; Wed, 16 Aug 2023
 02:21:26 +0000
Date: Tue, 15 Aug 2023 19:21:23 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Message-ID: <ZNwyo1luWAwQkhAj@orsosgc001.jf.intel.com>
References: <20230808013159.38811-1-ashutosh.dixit@intel.com>
 <20230808013159.38811-2-ashutosh.dixit@intel.com>
 <871qg4t132.wl-ashutosh.dixit@intel.com>
 <ZNwiW3GZmvcS+pqP@orsosgc001.jf.intel.com>
 <87y1ibsriz.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <87y1ibsriz.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR04CA0108.namprd04.prod.outlook.com
 (2603:10b6:303:83::23) To DM6PR11MB2987.namprd11.prod.outlook.com
 (2603:10b6:5:65::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2987:EE_|SA3PR11MB8075:EE_
X-MS-Office365-Filtering-Correlation-Id: cedf6b1f-7601-4d97-a2fd-08db9dff7df6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mSlHypGNAaBoWLPq1UTmeb9V5QtXlw3yqebXeTLS2Noaf7cG1VEL2zU4rAEGLbOVQl8FRGxqRZDwfXU2mQGn/kQwK/Pn0zg7RyRu0903a7qxFY/mq3pwBhMP/43sa/nB0ET1LI1sIl0v+atL2/wq4yKYL6jO77brXeNqkq1nD47zsr2RgBsdRAY+2kouGTPuhhEkLEc6JEcxWSDqwdM4MahRkNfRU25brlWKGILlIkPxLKHr++XsqEK0JY2j12OuwpbKAiFe+ekE7IFbF+o/qm4RSLNbkRc/DlMFxxhXiZfpQnAkDMXRfHF/uMRRV/waL+V7gClHGP4CBEBz55Ux9YEANc3Wh0Ikzr84OzxKCUmKqo8A2LJmKIk3QdZYonjtTS31eJYLtB/0xwLj1fFG/BZpwUqBWwGc4TfrakhAv79NE3+wR+PxreFYro9oUILyfpt6Sy95gQgkETSFfHiYLJN/+Ge5P0pfctR6zrKl+xTZrGMeRvZ/Nn9nWjR+JN0a3F28n3dbjmowqFQFMrIKZll+clVAfQea3o4gOdQZYu4vRJnEx9mn/Rbhbptuf3Uj
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2987.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(376002)(346002)(39860400002)(136003)(396003)(451199024)(186009)(1800799009)(478600001)(86362001)(6486002)(82960400001)(6506007)(66476007)(5660300002)(66556008)(66946007)(6636002)(316002)(41300700001)(26005)(6666004)(38100700002)(83380400001)(4326008)(6862004)(2906002)(8936002)(8676002)(6512007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NzN0ZHhsNnpaM2QvZzBYelJFMTVpWDBveFY0bEFUQjJFSUZtRFVheEl4YWlp?=
 =?utf-8?B?R2grR3p5eE5ycGR4cnBPRWhCenNFYlRJQXkzSHgzVHd6dEpvb2ZlbXpJM2dn?=
 =?utf-8?B?bVpmanZpckVDSlplK3JLZExOVjJadUloRXhza3BITjJvVEFwVURhYzlaWDhV?=
 =?utf-8?B?TG02RlNXKzJBbnpOdEhMb0x4YmFVZkdsMWUvWW9ETUlzTmxSaG9SWXhEbTB5?=
 =?utf-8?B?SzlqSkZpV2xuRnJwbWNmd1gyd3R3ZVFOaUtTL001NGYwcXEvVHZPOGc0VUxM?=
 =?utf-8?B?eFhPL2liR1owZ3RYU2hUWitsL3p5V3FxaGZQWjlPWU9ZSGJTU1pMYldjYVBh?=
 =?utf-8?B?SC9IUEJ4cHhMTkFhK3YwVzdtNk95Y0JDTmd0WFp5ZEVCWWl2RWtYcmtjZU1O?=
 =?utf-8?B?ZGhGUjlsaWcvUVBNTVg5L0tScHNndkJqUXVnVjhvV1lWK0JRN2I2ckV6a0dD?=
 =?utf-8?B?U3FtcTM1cytIKzhwcjhkTk1EVWNxTEQwQ3MxSjhwaHRKSE56QmJTMGFDY3NM?=
 =?utf-8?B?bDZpc1Q5MUo5U0tyTTRCWlEvaThuS3dlY3I5VlBNc054UUV4WjA4SGhKc3No?=
 =?utf-8?B?ZUs1RjR5b1pIYTIvZEdTMGtsS0NzckV0Q3RFaHN3K2FIMnZBTXhWUVpGQUNy?=
 =?utf-8?B?SGhBSVlDNEU0NCtoQ041aDlrcm1iaEV4cSs1aUEwakZyaTh2VzZRdEpYZWdN?=
 =?utf-8?B?NWJ2UWllNDhJc096SU1RM2RqUkV0ZTA3Y2QrUXZybEh6RzhZd3FtZGlseGYz?=
 =?utf-8?B?cTVra3MvRTdCSjVrcjdvbEJQMnIrcGNIVC90TUprZTJydWdZN0Y1NWxvK01Q?=
 =?utf-8?B?TThhM0Z0eHJWODJ4aG56c2l6a2hRMVpsZjIvQ1NOSFBSdDNIVGtOUWRFWUhZ?=
 =?utf-8?B?N0tudUtYczNYYkQ0MTUzd2ZtdU0xT2xHSzIxbUlrc2FueFAveEFjd0dId1lm?=
 =?utf-8?B?Y2RuMGVZVlh1VUw2TGNHUWROSXJieXU3Rmt0TzFIMmt1RmQ0TG1JdU04cDFT?=
 =?utf-8?B?TTdJTUJXVTBGTzNxWUV4alp3YlR5R2VDbVhqdnM2VjhyMHI1YklJSmZ3eThI?=
 =?utf-8?B?bFpJRlBNZXFMR3d5SGtCRFp1UWQ4MTRDdkNicmtwQkZOSEVZZkorR2gwQlFh?=
 =?utf-8?B?NGZ4TEZpQ2NvRnZlaWtzdHZNNDlueUptSUI0eEFhVFlWeW9XdFpXV2g2SUJy?=
 =?utf-8?B?RTdXeDVaVWRDY0c1WXVLVW9ZM2VJQlQ3b1F1NGVuNERwNTJZMGlnZmxwWjBG?=
 =?utf-8?B?aWc4ZGs5MnRjN1ZmMTJzWm1zUWpLc1I0K1pPYWZETU52RHcxNzVycEhGZUZl?=
 =?utf-8?B?VVp0cHhGMGx6VnpkL2Rqd3M5Z3dJQVNKelhTSVBzODBlczNoQ0Z4K21LYzF3?=
 =?utf-8?B?bG84ajhVeC9NcDdCNU5rbzJIUklSamgzSFhLYnBFSkJrendHUTYyWTJrdDFZ?=
 =?utf-8?B?RVI5MzVTMHZyY3BQeU5PbkNkZ1pPcEloQ01XcWViaFZ0dlg3N09vL2xKdGl4?=
 =?utf-8?B?eFZKazNqb3Nma1J5bzl4MmRBQnNrVHJ5MUxCNEFtV0N4dWFseStwR1Z1Y04v?=
 =?utf-8?B?QlNZUnphaG4rcEtkczZGdHlaZmZpVm5reXVXK3hlbGc5UEdKYjJHT0NEVFFZ?=
 =?utf-8?B?bUo1N2QvdjhiYWFWc2szbzBoNllGU0trdTh6YmNUdHVVTmRNZHRSWlNYNXE3?=
 =?utf-8?B?ZnFVbjJKaWhCV2wwZStyRTMya2F5b01jRWd0UzJXUnlTb0VrWFliaVp0UjVh?=
 =?utf-8?B?QkxKaElORHJXbXl5MEVZQmpPeExES0Y5eFAzeGgxS2xUNFZrK25mb21NS3hh?=
 =?utf-8?B?bEdXMkdXR2t6bld3cmVoTUd6VzhCQnFJUktBY3JJd05VWGduTGxtZEZQRWha?=
 =?utf-8?B?c0ZLVWdGTStRV3N4Vm9rQkFyekZXQUhhQldpcEVkd3ZMQ29SMkpraUJHdnMw?=
 =?utf-8?B?cjlmcWt0Q2RKdkdub01jZjZOWjJXdDRyd1JOb215cy9UOGprUEh2QktBUW13?=
 =?utf-8?B?cFYvT0tsaHFaWHJBYjNoZmRvdWc4ZncxOXFiRVVoVjZiSklKY2VabVg3QlJW?=
 =?utf-8?B?MEVTMTMwTEg3ekxFV1dXcWNPalJRSXBSVmxjaDJyRjArNmhUd3dEYVY2dGlN?=
 =?utf-8?B?aVV1MVZYeFI0eEQzalVYQmc2NTRYdFAyWUNqOXRLQ1RoTWI2UU5NdTR6WWhO?=
 =?utf-8?Q?ui9VFQC9vC2xFdgIKcIQnew=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cedf6b1f-7601-4d97-a2fd-08db9dff7df6
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2987.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2023 02:21:26.0119 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cy/q0oCtpSUD8jziBqvTikUdy6XAzQEezziWpix/Y66lMzU9ZhO4/e4CWqPVECk42TIomguLSIhn2JldplG5bwClcazwdSKgcdj1tB1sYAI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8075
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 01/10] drm/xe/oa: Introduce OA uapi
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

On Tue, Aug 15, 2023 at 06:30:12PM -0700, Dixit, Ashutosh wrote:
>On Tue, 15 Aug 2023 18:11:55 -0700, Umesh Nerlige Ramappa wrote:
>>
>> >> +	/**
>> >> +	 * Multiple engines may be mapped to the same OA unit. The OA unit is
>> >> +	 * identified by class:instance of any engine mapped to it.
>> >> +	 *
>> >> +	 * This parameter specifies the engine class and must be passed along
>> >> +	 * with DRM_XE_OA_PROP_OA_ENGINE_INSTANCE.
>> >> +	 */
>> >> +	DRM_XE_OA_PROP_OA_ENGINE_CLASS,
>> >> +
>> >> +	/**
>> >> +	 * This parameter specifies the engine instance and must be passed along
>> >> +	 * with DRM_XE_OA_PROP_OA_ENGINE_CLASS.
>> >> +	 */
>> >> +	DRM_XE_OA_PROP_OA_ENGINE_INSTANCE,
>> >
>> > Because oa_unit_id has been introduced above in
>> > drm_xe_engine_class_instance, should we remove these engine class/instance
>> > properties? Since it seems OA streams can be opened directly against the oa
>> > unit identified by oa_unit_id. And the driver can itself figure out the
>> > engine class/instance from the oa_unit_id?
>>
>> Agree for the OA buffer use case.
>>
>> For query, we have used the class:instance to enable query support for
>> specific engine instance. If we can work around that somehow, then we can
>> do away with these 2 params. More like enable query for all engines that
>> belong to the OAG unit. For render, it is straight forward since we have
>> one render per OAG unit. For compute, multiple compute instances can map to
>> one OAG unit and only one instance can support the query. So user may want
>> to choose which instance that is. Although, I would just simplify it and
>> support only instance 0 of compute. If UMD is okay with it, then we should
>> be good.
>
>Can we enable the query (I guess "query" is MI_RPC) on all attached compute
>engines and have the UMD execute the query on any of the attached engines?
>Or is this mode of operation never been tried out before so risky?

We cannot, since that is gated by a global configuration in HW that 
selects a specific instance to enable the query for compute (ccs_select 
to be specific). I think the limitation is that HW has only one OAC unit 
and only one ccs can use it.

Umesh

>
>Ashutosh
>
>>
>> Media engines do not support query, so we should be good for OAM.
>>
>> >
>> > Separately, there is also the question of whether we want to share the Xe
>> > OA IGT code with i915 as was done for this series. Since duplicating the
>> > IGT code as well as all the perf tools seems a bit much.
>> >
>> > Thanks.
>> > --
>> > Ashutosh
