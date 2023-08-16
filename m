Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB0C2C19F4F
	for <intel-xe@archiver.kernel.org>; Wed, 16 Aug 2023 19:59:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7362510E3A5;
	Wed, 16 Aug 2023 19:59:09 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B52710E0FC
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Aug 2023 19:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692215947; x=1723751947;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=rlOGAY6coddjBG1Z7xuf1vb7Wlaw+Izl6H5qSZ4GQqk=;
 b=WMwz4IpBYBq081vEzYvsS1XFJgxY3nOI+pnT8TY7hilvPF/FiSHMTFL1
 TA1KuPBpWu3sd5sYnyitkvlz/152AglxyXcIR/hIbrKsxg3oSwy+qQpJM
 vlDOwCSZJ5HEksJj8ue5cvTkBQ00vbXE9IMKgXh043BueLkABjYqIoSsW
 Ma03qshAdEap9afFQ0NEHyNPSfomPfAXYWs5Kr3cxyi5zZ+sJ4Wk6gAWE
 +6Hir/Y3WLy3elu3pvv60+oItvyyEInXxg4KJ5o3sXfrFqhfZudIskpzo
 OXAv7ghjsAbBInFUvMv4tdlNsk2qORcsRD60q4D6DQ5RJuCA/zTjozkQH Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="376360661"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200"; d="scan'208";a="376360661"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2023 12:59:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="908122546"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200"; d="scan'208";a="908122546"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga005.jf.intel.com with ESMTP; 16 Aug 2023 12:59:05 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 16 Aug 2023 12:59:05 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 16 Aug 2023 12:59:05 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.103)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 16 Aug 2023 12:59:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mxkGBVLO1X2o8zE6HXFPL+dRrxwjbekdti3PI+5PqhXcXYcieuER/SVeppDKVfvjMT+inSukkTFx2j4HrSH0Z4/UgO6efpf+Wje+K8fLFrG0L3yE645xuv21NRqFDKbSrNMSY2+ZpEIt38dY5Dku6JDhEFQxZ3ZMt4muAbpgQolHWk6LpsUayk35xSF5LElracT5OVDcT0LBHcq35p88vmvXGt2ZBWo0PiIHxga0xf1I0nrXvhrjJDeAmmGFgRSHIV5KpCqqWsDXhNf9v/dDjUFveWWTUs05iLcbOz0Rdcpwi0zks3LrmtjkBiukY0MrvXbPVBtjBhUeA0qwCsYBWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/1BYnNH/QuEPOQulccslo9vzz1QzLmWEJHq/x9fzxR4=;
 b=Sczxomrm+dIzu2D+DwgthihfKr1eBXhW/kpMaUBgx++9QXNgu6F8kWWZtS5O5LxxhrW0SLoQHTpCU0YUBhEdXTAP01p4aXn+FPQIL0K/WKtrqtURvr7/GbwL0SIbM2K88PumPyq2Vqvr36VhTBmNrF66mnEF0PcVhPYDE7P1rtP0Dp/FnnCuFPyM2UZbBJyTsoa2StDZ/NY/rHkhr3QZNHI3pUmQG8w8pazFGsT1FnB8tF+whw1GuUs3XBFrCrR6yYEuzHEuI8SfOoyQ6XcxJ8cAZ++cTDR+rO5BCS59dfq8c+/mxWbDuk6EoIcmJFqVxlhw+BuM6SX01d3hlFynHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB2987.namprd11.prod.outlook.com (2603:10b6:5:65::14) by
 DS7PR11MB6270.namprd11.prod.outlook.com (2603:10b6:8:96::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6678.30; Wed, 16 Aug 2023 19:59:02 +0000
Received: from DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::5f98:c6b:6aa8:4a8d]) by DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::5f98:c6b:6aa8:4a8d%2]) with mapi id 15.20.6678.025; Wed, 16 Aug 2023
 19:59:02 +0000
Date: Wed, 16 Aug 2023 12:58:52 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Message-ID: <ZN0qfPd4U0Ksc4fq@orsosgc001.jf.intel.com>
References: <20230808013159.38811-1-ashutosh.dixit@intel.com>
 <20230808013159.38811-2-ashutosh.dixit@intel.com>
 <871qg4t132.wl-ashutosh.dixit@intel.com>
 <ZNwiW3GZmvcS+pqP@orsosgc001.jf.intel.com>
 <87y1ibsriz.wl-ashutosh.dixit@intel.com>
 <ZNwyo1luWAwQkhAj@orsosgc001.jf.intel.com>
 <87wmxvslc4.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <87wmxvslc4.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR03CA0288.namprd03.prod.outlook.com
 (2603:10b6:303:b5::23) To DM6PR11MB2987.namprd11.prod.outlook.com
 (2603:10b6:5:65::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2987:EE_|DS7PR11MB6270:EE_
X-MS-Office365-Filtering-Correlation-Id: ff2f9511-1e36-4f07-c696-08db9e933d0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lR31+SEko9zlhrLjhTOHDiDSjggEkMuP8kvk5l9uLi41FVXNsM//vgVZXlc8h5qrnjXC6sU3u1Y+pcNt3acCV2iCfuIANs+8mKJo+Vu8D5eAbrPkt6xA4VMkxk1xkn4+IL2Q36CUiKbDURjqcddV99D7356T3pbEp0eZK6fwR7puao5hNTA4dJhm3YtTtky42/nNYNtYhH8faDA1cZM6OrjwVqhURYOUeZh4xoJ5sEoky6zWiSLnhe2fCPtedv9wuampXt7gKfVF0HzJf6WyXiIehgJTrE8aNeNf+rqSExERUNZsIHKolUpooFR48Z4YzMHe41878EQavgNfZdyY3xt5/nvXjuiBDD8CD7sDTbnPHP8oPlm8HxgiIGcSEtsLm4IcOdVRK1bz3jE+ne1odAGhERMdp72662fW/nZ8ZihtPpcHM38/CAs30YGrpt5EwXJZQsCKTw3M6KFY1/YgDxr9PdiIS0Bi/0soAX5nADIc5FqxDMFSpJTjbP4jvFKa/f9goTNC1iKJIgYPFaKGe0eGvS+0enwhSyry+hUvVjKKUGQ6+kBpiHMgVjwmQxm7
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2987.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(39860400002)(346002)(136003)(366004)(396003)(451199024)(1800799009)(186009)(316002)(6636002)(66946007)(66556008)(66476007)(5660300002)(41300700001)(38100700002)(8676002)(6862004)(4326008)(8936002)(82960400001)(2906002)(83380400001)(26005)(478600001)(86362001)(6512007)(6506007)(6666004)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NFZ4ajFxcFpldWdkRWM2Nzc2UmtEaE1KaEk0Zmt6dnYzTjlhR2pqNW1hc3la?=
 =?utf-8?B?MDNjN1A1RUs1dVRGRnBFQ1ozbmZGejNSbVdRU0Q5a3lpQ1F3enhTTVRKVGk4?=
 =?utf-8?B?SVBiRFR6WU05T3VneXQ1RUtCSzc0dkdodEZoSk03Kzl6dHlkU25PLzRSYitm?=
 =?utf-8?B?bERzU3F2WmwwaDRld2RPMEJYc2dYdmhQNmFjMlg1VmJjWHdKTlF4UXpkK1dT?=
 =?utf-8?B?TGxjOEt6cEswS1oxM3E5OVI2UGVKQmhBejVNMUt6SThqV0liU0VkcncrblJ4?=
 =?utf-8?B?L3NxeUkxSUtGZk10RTl3WERvMFNCNldnR1FjTmMzZmwzNjRlUlFySFowMG9M?=
 =?utf-8?B?Qm9ZL2c0Zm9Bc2ZuS3RMd0U1dmpDTzRqOHZnZzQ1cGdWWjg2V2ViK09RMWVx?=
 =?utf-8?B?b1JkVVdlZEUrOVkzNFBFeStiTisxS1JYR0VIM1RpVVNQN0pZQjNuN3o1N201?=
 =?utf-8?B?WmlvdFZsNnhDZklDdWZPc0VIUDdVT2N2NXVZcys2OWNYV1lsbDBqRVZGUk45?=
 =?utf-8?B?VVNJNDFmaXFhVVBoUmcvYzZJR25Yc2kxQWEwTHRlb2pDei9NNU5yMldlY1M3?=
 =?utf-8?B?U1JvQ1VTYmtjVGlOK1ViYlRYK3RuNG9iMjNaRk54dmIvdFZNZ29oZVM1cmF3?=
 =?utf-8?B?YmpHYk5YeVdiRGp0WGNTRGZMNGpMc0UxZlYvbnk1clAwejFiNHR5dC9JcDd0?=
 =?utf-8?B?RE9WWWFRbkN2Z2hqRStML3V6Z3JzL0cxL2xrZGN0SHY3ZHNJRE1CZi9CcXE5?=
 =?utf-8?B?UWxhV1gyb1dvQmpOYVJvMlZCejRzOTd5VmF6Q2hJU0h2MzRVZDF3ZnFReC82?=
 =?utf-8?B?VnRNQkRYKzFEZFd5dS9HYmh4am5kOU9sME5CODFGRFlsbW1EUXp0NHhBa3Bm?=
 =?utf-8?B?NldkenhOdTlyRFBXOHdTRjZ0MXpjb3c1SkcvMkVCd3NBaE82NXk1ZEdOVjdZ?=
 =?utf-8?B?Rk1tOUk4SEdqUUFrWVJXTzV6SU9IYVJmZEt6WlcyYkRKTFE3dGNINjQyVE9L?=
 =?utf-8?B?VWlQWHFUVzNzTDFKc2tEUTZ1RjZMcjdkemkraUt6RkRUdG9jVmFDT2ZoTXZh?=
 =?utf-8?B?cnAxV0dJSnlVcTRFNGVoRDVKNXE0L0xldjlhcm1CN0tyT2IwVkl3SFFXbDUv?=
 =?utf-8?B?MkxpL3RHQVRBTE8xVVhPMnBodXhpN014bGdsK3lVRm8vMS9VM3hVOEQ5RDZX?=
 =?utf-8?B?dUVYYlpOT2NKdWRIY3hBT2lTdzZBOHAwcW9VUW5OZ1c2dFJxWU9uaHRGTzQy?=
 =?utf-8?B?TjlRcElnNWVnUW1mTTM5TU5hcnMzdUg4djVDb2ZzZmhyRXBaSVBSSmZQV1pi?=
 =?utf-8?B?MW9DQnpHeldUNlFibldGZGMycTdXcExZQ3l0M1FDR2tEblo3bjl2K3dNTkNi?=
 =?utf-8?B?bHVJaTNXR1Z6UE5KVU1ZL0tRWUc3QWFIS0pUbHdsWmtFSEFyeE1nU0xuUjM1?=
 =?utf-8?B?NDh1WVRReEdwY0FWcHZMZXg5cytVODdTYWs3U0szK2luMXVyYTNPUVNKc09x?=
 =?utf-8?B?V3Vrb084eERhWWRYNXI0K0JlN2VOQzlKR1RMTWsxbE43NzFYcmpFUFhZVGtm?=
 =?utf-8?B?a25YRzRiN3RPNVJOM2hrQnliTm9KREFMOGQzTmhBSThvK2dsaEhrWDFIdUh3?=
 =?utf-8?B?UXJhSkFzZnVORnRGVzYyT3p1eGNNYjZSMnRBRjRrR3VITXRnN1B6aVlCUWtV?=
 =?utf-8?B?cHBDc1BVZGtCSmkyalpXdUFRaU9OYldJZXFabVFSMmI4anhEZDBOWU5MNTVD?=
 =?utf-8?B?K1RXUmo0c0RMSWdFTlNNWW9ieWFZTFRJaWx6ZW9zeVZ1OWVQM1gyWGxFanl4?=
 =?utf-8?B?N2J6eEpINlVjeWpSaFo0ZGVMVWNmeWNJdzJySWxobXhVS0pFS2VqYmNXZmZJ?=
 =?utf-8?B?VVprckNZbHpEVmNXQUtLbTAzOERpblROWWRMVXFKQUlQeW9HYzFNWU02THll?=
 =?utf-8?B?N1dISmVTR2t5M21jVWQrM3ZGcGFtcWJmZTJlOFUxMERmRTJCTVdWbUdLWVZS?=
 =?utf-8?B?R2wwYkJCWHcvUjZzOG5Yc0twbVB3d0Vwem1oZ2h4TS9iaG5PSmwrRnBsWTVL?=
 =?utf-8?B?WDkzRVdRbGtiR2Q3Q3dwOUt3bllzTDFjd2cvdUNDekxGeTJSUU5VcnhzRnVE?=
 =?utf-8?B?ZUI5N3ZzQ3BXZ1F5Z0lRYmpLMTI5NzRWR0FRSVhnc08yL0xKbGg5M0dPT09M?=
 =?utf-8?Q?Rkb3Wpdz3ck4QSK9YHFNXf4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ff2f9511-1e36-4f07-c696-08db9e933d0a
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2987.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2023 19:59:02.6549 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NgQODCQ1kMbcB5OAWpGlUH9q/JR9oUsALjIIZMkMQYubG/BmSaQuMBTj1KKBGRmaJui+3WI8T/iYunZWaLj2S8HrUmMEwIpsoI17QBC/3FE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6270
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

On Tue, Aug 15, 2023 at 08:43:55PM -0700, Dixit, Ashutosh wrote:
>On Tue, 15 Aug 2023 19:21:23 -0700, Umesh Nerlige Ramappa wrote:
>>
>> On Tue, Aug 15, 2023 at 06:30:12PM -0700, Dixit, Ashutosh wrote:
>> > On Tue, 15 Aug 2023 18:11:55 -0700, Umesh Nerlige Ramappa wrote:
>> >>
>> >> >> +	/**
>> >> >> +	 * Multiple engines may be mapped to the same OA unit. The OA unit is
>> >> >> +	 * identified by class:instance of any engine mapped to it.
>> >> >> +	 *
>> >> >> +	 * This parameter specifies the engine class and must be passed along
>> >> >> +	 * with DRM_XE_OA_PROP_OA_ENGINE_INSTANCE.
>> >> >> +	 */
>> >> >> +	DRM_XE_OA_PROP_OA_ENGINE_CLASS,
>> >> >> +
>> >> >> +	/**
>> >> >> +	 * This parameter specifies the engine instance and must be passed along
>> >> >> +	 * with DRM_XE_OA_PROP_OA_ENGINE_CLASS.
>> >> >> +	 */
>> >> >> +	DRM_XE_OA_PROP_OA_ENGINE_INSTANCE,
>> >> >
>> >> > Because oa_unit_id has been introduced above in
>> >> > drm_xe_engine_class_instance, should we remove these engine class/instance
>> >> > properties? Since it seems OA streams can be opened directly against the oa
>> >> > unit identified by oa_unit_id. And the driver can itself figure out the
>> >> > engine class/instance from the oa_unit_id?
>> >>
>> >> Agree for the OA buffer use case.
>> >>
>> >> For query, we have used the class:instance to enable query support for
>> >> specific engine instance. If we can work around that somehow, then we can
>> >> do away with these 2 params. More like enable query for all engines that
>> >> belong to the OAG unit. For render, it is straight forward since we have
>> >> one render per OAG unit. For compute, multiple compute instances can map to
>> >> one OAG unit and only one instance can support the query. So user may want
>> >> to choose which instance that is. Although, I would just simplify it and
>> >> support only instance 0 of compute. If UMD is okay with it, then we should
>> >> be good.
>> >
>> > Can we enable the query (I guess "query" is MI_RPC) on all attached compute
>> > engines and have the UMD execute the query on any of the attached engines?
>> > Or is this mode of operation never been tried out before so risky?
>>
>> We cannot, since that is gated by a global configuration in HW that selects
>> a specific instance to enable the query for compute (ccs_select to be
>> specific). I think the limitation is that HW has only one OAC unit and only
>> one ccs can use it.
>
>OK. But iiuc there is also a context (or, in Xe, an exec_queue). So we
>should be able to turn on the query on the context/exec_queue hw_engine, no?
>Assuming more than one hw_engine in the context/exec_queue is an error?

The global config (ccs_select) needs to be applied at the context switch 
granularity which the KMD is unaware of. If the ccs_select configuration 
were a part of the context image, it would have been simpler. If we were 
to do this, it would have to be in the WA batch buffer in the context.  
The WA batch would run every context switch and would do an LRI on the 
global register. Possible, but hacky and architecturally incorrect since 
we would be modifying a global state from the context.

Regards,
Umesh


>
>Ashutosh
>
>> >>
>> >> Media engines do not support query, so we should be good for OAM.
>> >>
>> >> >
>> >> > Separately, there is also the question of whether we want to share the Xe
>> >> > OA IGT code with i915 as was done for this series. Since duplicating the
>> >> > IGT code as well as all the perf tools seems a bit much.
>> >> >
>> >> > Thanks.
>> >> > --
>> >> > Ashutosh
