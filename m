Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A2D6EB64D9
	for <intel-xe@archiver.kernel.org>; Fri,  7 Jul 2023 10:42:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E0A610E55E;
	Fri,  7 Jul 2023 10:42:53 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7B1710E55E
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Jul 2023 10:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688726570; x=1720262570;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Fyxvzp8K3O8OGgtQZ2bVZFm09NOmOOBAkZ+Dkg5tPyA=;
 b=J3uXMaLy/wNNOxaXzaj/I36ZoD+XJ5XxifTf+K7B4ea1iJiBEs9R+xAJ
 HOEuTKKmxiRVKq77sWjvrrsmRZFoPNNLoPSzSm6It/CYN+v96jL5Iisvq
 yO+M6S893cUVyWxnlSZtdJPVQu9qd8oMGGF8zZwqIXnJD4bHMnCJ3MlSf
 bYijmkbCJYVenAEg0HMLTf23SUzaQwuvt7iSkMVvN+XTmmlYYRsOgKZ+A
 C/RPk0BNaNn/1K7XauSprASiO3oVaSUVAOeuRqPOpLKmf7v0RzxMxhmuK
 pfqvLapuiL3ea3XNUOcFkiVofW7InTk8Uk6R2ij653w1yvjO4WKVA6FUS w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="427546652"
X-IronPort-AV: E=Sophos;i="6.01,187,1684825200"; d="scan'208";a="427546652"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2023 03:42:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="893948023"
X-IronPort-AV: E=Sophos;i="6.01,187,1684825200"; d="scan'208";a="893948023"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga005.jf.intel.com with ESMTP; 07 Jul 2023 03:42:49 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 7 Jul 2023 03:42:49 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 7 Jul 2023 03:42:48 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 7 Jul 2023 03:42:48 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.175)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 7 Jul 2023 03:42:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SbAG8Fp5kg1544ESGqnU6WLu5kdov/DLl4PVyeCLHinWpioSg8+0p2e+TVIdNXBTp4jZogmr7rgAowmAftGUeT63YelK5L13EXyJgdDU4+gPF6SXGsYpNdL2L1exyW2Je6afbbTzBczARzeuAPjkh/JOvej3zr+86fMcj+ct5IvW6600ofu8iJe7r3XiBJXgDPG7PoAVAnVnblNXXwoxyxSsBPRgAnPJNnDAggMZB8OtmuzTC44Q1f4JXoMg4KAkSaOfBdjzmKWRNzoYOVpMvmSInYoIfjtDjoqRiks+6t88y7vrkCBuZ3oZv+XC9I1ow63RxyIt/3Tf6rWdWsDNTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=70lBa8o43z4cIoP3VdousCN7+Tx6jMZy4nMRry4Ejlk=;
 b=WD3uWzBGH27L0Vh0NTtuAX1GySwjWE9lwCq924RG94vxZOsUNaee8ocNxxHiUjpcxqYMvikR+y3maJX+FQtVIgrBc0B1ZcYTf8m7iqrbqQ2A8omWWXKUIdeM/dbAfsGHkhGFFBYcIOVtdJtzwXBZYmNX2STNGr252tyK024zq4yJTHGrCCF4PeDlwRxyMF9UhqW6C5plg86j5JhHwMprknq0c/KKQnelEsenLMMekShNXbfKxXYkjP0AkBfiKvPyWWekOPPXszDY6Z+d2LsT8GpuPAATKs1Kja4ugV+xgpqgPPfJL+qgVlY8QGwHpCvfNWrUK6SAKVVbkjqTnE4mPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5474.namprd11.prod.outlook.com (2603:10b6:610:d5::8)
 by SA1PR11MB7086.namprd11.prod.outlook.com (2603:10b6:806:2b3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Fri, 7 Jul
 2023 10:42:46 +0000
Received: from CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::2ead:623d:b273:bd8f]) by CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::2ead:623d:b273:bd8f%4]) with mapi id 15.20.6565.025; Fri, 7 Jul 2023
 10:42:46 +0000
Message-ID: <3c4bec6c-7af0-ade7-91bc-bbd3bfa46357@intel.com>
Date: Fri, 7 Jul 2023 16:12:36 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.12.0
Content-Language: en-US
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
References: <20230627122113.1472532-1-aravind.iddamsetty@intel.com>
 <20230627122113.1472532-3-aravind.iddamsetty@intel.com>
 <87mt09daqu.wl-ashutosh.dixit@intel.com>
 <a6fbb435-6383-772c-703d-183f26a8144e@intel.com>
 <87a5w8cvmr.wl-ashutosh.dixit@intel.com>
 <04ae6811-9bc1-c66d-6cb8-640bfd8a9c7b@intel.com>
 <878rbsckzf.wl-ashutosh.dixit@intel.com>
From: "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>
In-Reply-To: <878rbsckzf.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0093.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9b::21) To CH0PR11MB5474.namprd11.prod.outlook.com
 (2603:10b6:610:d5::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5474:EE_|SA1PR11MB7086:EE_
X-MS-Office365-Filtering-Correlation-Id: 31e8c790-f516-4716-2af8-08db7ed6e653
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 96srdrB6rHtBv8GnKOsHM5+P38Poj1HjsGO8v6307nreBq9QN7AjbvAobP/HqYkKX+Eo3rxAsrj4geOWAZlRx7t0tWc3qKCbTRaTtEjalBLWs+LckXt3my6y2OIAK5vdSBVR7psQtWj7m/dM96WlgCGLXltvMCriJT+O7Ehc7cheS0AnWxPw0tR7iD3rT3fcVZoT8IzJH3RdIWyWR25x7XHQPUYePI3EOKwZ5Gvm5HPrECuIXHeDRJxbSIANPzQEQKPluQkAy170nE9nAvSk7JLnet/QvsRGWcQrFFA6iWX7VrKEAeeQTmDoQv6bIVDovGv+IaOfOy3b54F5e7E6lC4D8y+qn2H7U25zEr1rwEk6dXYnXSWDo4dLS2XgbhyZQewiWj6uLlY9t6wKGL7oxsotde291cTh7bs+shW8j+jhAbb+/eZ8CCPrL0Z/2m4f/FD/4+ktxaYl6exaLmWywnauC2R5+R+v22rC/Un348gNtQtn2s3x9JpKXmou/TEbMI3UqZ8ZLi4jWXZE2jPyZhir/7qFycxv8yDmTL/36TFr+wLz7P4RjW/uinn/+6nxGtVEn39UT+/7lZFs8PNrGxKtUGsBGNoSRPN5LHk6f05/yI9Fvv/3HegVgiMhyg/6+kMsV5Er4S7g2PyiAmYfhcjdIiFHtPv5x7IVgoCWjGzHHE9PySFxFdfPOt/6c/1N
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5474.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(376002)(136003)(346002)(366004)(39860400002)(451199021)(38100700002)(82960400001)(31696002)(36756003)(966005)(6512007)(86362001)(6486002)(6666004)(478600001)(186003)(53546011)(8676002)(26005)(6862004)(8936002)(107886003)(5660300002)(31686004)(54906003)(6636002)(66946007)(37006003)(41300700001)(66476007)(2906002)(66556008)(4326008)(6506007)(316002)(2616005)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QUM2RDhNcWxNNHZnNGpRN2tNaW5RU1FaZ2V1UDVGbG5yMTBwclQvWW9xdkNV?=
 =?utf-8?B?QXNRemJQOGNIUUd6Z1JrUFZ4S2tRQUI2MDB0dzdmSHRzUmRNbXd1VTh2TkN6?=
 =?utf-8?B?K1crdDRZRUFvU2diSEhNY2U0emRCRW5pNGNOMzFRdHBHNXNuMkppOFZmZ3lh?=
 =?utf-8?B?ejRna1psTzl5VmhJRC9kdU9HVVhOQ1RVdElvTVdRdVk3Q2grYVczeW91TVND?=
 =?utf-8?B?NjZGaUs3bmkvRDFoazE1Q2RIN2c3ak5aNHBoUGhSdjZQYms5ZlFzN0pqcU1s?=
 =?utf-8?B?eklyTldIenI4VFRxSERyN2o3MXJwZzhmSzNuUGZqdUp2dXRmclgyd1R3dEJE?=
 =?utf-8?B?eUhyRXZQeGFhMkpqTkp0L0lJL2NYSmV6Wmo0SmtUNWliTEFySUxYVVJkREF6?=
 =?utf-8?B?L0lvRlRweDdIbkM2NHo0eE52UGhDZ0h2cXJxRDE0NE1tSE1DRmlJVzJTc082?=
 =?utf-8?B?ZWIxZ2Z0OVFqb1lFMms1ZWxabVZObWtzWDU0bTcwS0c5eDExRy9VWUNRMWNU?=
 =?utf-8?B?VC94ZjlXR3RjMlRVeXg2ZzNMLzJKMExTZUdqNldWbEI0UGY2N2ZZSGk0WTdj?=
 =?utf-8?B?MWtvQllnOFhmWnNkOVFqM3djTGt3ZlNJblAyNk9JTzhDOVR4aVYyQ2RrMjMx?=
 =?utf-8?B?SnNxYVBlR0ZtUmNLNzJVQzNPVU9SMUtCdHIrWFY5a1YxWFl0YURiN3ZVV09U?=
 =?utf-8?B?OVN5RUlKc1lWZGo2MzJXTUtJc2pjSFlJYlkvb3QrNU9JWVRBTFRRMTRzbk9M?=
 =?utf-8?B?WmgvSkROL01acnlMMC8yV0xJcENCM1ZyNEtZOVFZWkdoQ0hSUHV5dmREZXhZ?=
 =?utf-8?B?TFk5ZHdrS3Vqdjh3aFRoUWtTUTZsNEthSXFmbDZsYUJ2WXBseXlnVEkwS0V6?=
 =?utf-8?B?aHU1Q0hTbkNHa0ZBUWI1ZmZ3TXM0RXg0ZTFSSGtyYXppaHpoQkI1aU8walRP?=
 =?utf-8?B?ejNqc29KZVlKTlh0ZFR3aUxkT3poSGJNQ01YQjlaTnp1Q2dMbjZjcENLVGNx?=
 =?utf-8?B?NVp5SEN0b2FWcWhXMm5BNGIxUmlkKzBhdnNYV1JMb1hUUnI4VjNyR042VmVP?=
 =?utf-8?B?NmZnbTArWWpJSDZaL2R1T0lQQ0xtZWdscXgwOStaUUt2TWpVaHI2TXVuY1hU?=
 =?utf-8?B?eEpINlU3cWdHZ3pubUphVk9PcXN4cEpoaDM3MzFTWVNLeXpJS3BVT0ZsQzlN?=
 =?utf-8?B?RXkzS0IxWi9QQmpIVDRkdEoxM1ZoUGxXSjI5UEFBSzBJQVRodk1Ua2pMdGY0?=
 =?utf-8?B?RDVGcGRCL3pNQnc2QjY2VWdoTGFwT3FVVjNGL1l1ZXFpMXdWQmJqQ3UrNWpL?=
 =?utf-8?B?bUlGbVMzMTdBdzY4Rmw1Wm1HN3ZLalRveDkyTHRoVUtLUmozV1liVGUvR1lN?=
 =?utf-8?B?YjN5OWtyVGw2a1NUREVXYlZTY3V2MTZrODdLbHM0RENOYWNHcnJrRzRLS0R6?=
 =?utf-8?B?WkJ6NWtuTldrWHh3Qzl1RFEwS2I4T1o0UkVYcUZmeEhaSWNwZGlyS1NWTFh3?=
 =?utf-8?B?VS9Ua3JWQjlGRDdnTzZyaVZnUlM5TEMrS3BMSHNJMHZNT3RiVGhGVEV2R3B2?=
 =?utf-8?B?Wk1hMDQvM0I5NVFGUEwvaXppakZwNDlFc0VOM3h6K2UxcTZOVmFRb3pubWJq?=
 =?utf-8?B?ZDVsMkZyWkVzSkFTcWpPNm5hYWRRZlR4akUvYU9kaDczS0tpdXdTaXlObnRN?=
 =?utf-8?B?M2ZmNVhMQzM2RWh1bk9OUjZsVDJMTU95bDR0bjRhZE9qQ0FmelhZMldwYi9h?=
 =?utf-8?B?NkpyTVNFb1QxNzFMQ0FIeCtxV3VwZTdWaWlPajVvcGVkWnVySVloOEZ4dDNi?=
 =?utf-8?B?enhmSDhsYndJRnVSKy9TN0tFWlNlaktJRTFPRkdiMS9wMytFSWdrV0ljTXJt?=
 =?utf-8?B?NDJLSDdIUnFBVEZ6aXlDV2IzclB3WEdFdzNOY3ovS28wazlwQ2NmcmF5Q1Rl?=
 =?utf-8?B?TmwvVFc3NTZhUENHbXNCM0VaeG9ibWZzS21MMzZqNk50cjFXYlcxQnAyM3Zx?=
 =?utf-8?B?dnAyMFh5ZGNidzlHYzBNcUZoODJuOWNsd0lXVVJySllsV0RZTTg5M3NmTGo1?=
 =?utf-8?B?dm1ZOUs5TE5UeXp2TnExcnE5MGsvd2xPdGVOUUV3dHR4VE9pTXlpeHJoS0Rm?=
 =?utf-8?B?YUNFaUVlRVg3VmxSWkFocVBsU0lOVVdGdGhxY2VOUUUyNmtrUHlIN3ljdHhJ?=
 =?utf-8?B?aFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 31e8c790-f516-4716-2af8-08db7ed6e653
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5474.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2023 10:42:46.4165 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s31YbH6Mbe0UPxIcec5O+1Fd449zx05D2jjKT5agSPjny+eLj4+ucJBWlrffFvgYCVsoUjPItU8hqM4RLCJkWsD507aAwDOAenvTeOnfSNs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7086
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 2/2] drm/xe/pmu: Enable PMU interface
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
Cc: Bommu Krishnaiah <krishnaiah.bommu@intel.com>,
 intel-xe@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 07-07-2023 11:38, Dixit, Ashutosh wrote:
> On Thu, 06 Jul 2023 20:53:47 -0700, Iddamsetty, Aravind wrote:
>>
> 
> Hi Aravind,
> 
Hi Ashutosh,

> I will look at the timing stuff later but one further question about the
> requirement:
> 
>>> Also, could you please explain where the requirement to expose these OAG
>>> group busy/free registers via the PMU is coming from? Since these are OA
>>> registers presumably they can be collected using the OA subsystem.
>>
>> L0 sysman needs this
>> https://spec.oneapi.io/level-zero/latest/sysman/api.html#zes-engine-properties-t
>> and xpumanager uses this
>> https://github.com/intel/xpumanager/blob/master/core/src/device/gpu/gpu_device.cpp
> 
> So fine these are UMD requirements, but why do these quantities (everything
> in this patch) have to exposed via PMU? I could just create sysfs or an
> ioctl to provide these to userland, right?

PMU is enhanced interface to present the metrics, it provides low
latency reads compared to sysfs and one can read multiple events in a
single shot and it will give timestamps as well which sysfs cannot
provide and which is one of the requirements of UMD. Also UMDs/
observability tools do not want to have any open handles to get these
info so ioctl is dropped out.

the other motivation to use PMU in xe is the existing tools like
intel_gpu_top will work with just a minor change.
> 
> I had this same question about i915 PMU which was never answered. i915 PMU
> IMO does truly strange things like sample freq's every 5 ms and provides
> software averages which I thought userspace can easily do.

that is a different thing nothing to do with PMU interface

Thanks,
Aravind.
> 
> I don't think it's the timestamps, maybe there is some convention related
> to the cpu pmu (which I am not familiar with).
> 
> Let's see, maybe Tvrtko can also answer why these things were exposed via
> i915 PMU.
> 
> Thanks.
> --
> Ashutosh
> 
> 
>>>
>>> The i915 PMU I believe deduces busyness by sampling the RING_CTL register
>>> using a timer. So these registers look better since you can get these
>>> busyness values directly. On the other hand you can only get busyness for
>>> an engine group and things like compute seem to be missing?
>>
>> The per engine busyness is a different thing we still need that and it
>> has different implementation with GuC enabled, I believe Umesh is
>> looking into that.
>>
>> compute group will still be accounted in XE_OAG_RENDER_BUSY_FREE and
>> also under XE_OAG_RC0_ANY_ENGINE_BUSY_FREE.
>>>
>>> Also, would you know about plans to expose other kinds of busyness-es? I
>>> think we may be exposing per-VF and also per-client busyness via PMU. Not
>>> sure what else GuC can expose. Knowing all this we can better understand
>>> how these particular busyness values will be used.
>>
>> ya, that shall be coming next probably from Umesh but per client
>> busyness is through fdinfo.
