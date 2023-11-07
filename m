Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18F75C4332F
	for <intel-xe@archiver.kernel.org>; Tue,  7 Nov 2023 23:52:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDDBB10E189;
	Tue,  7 Nov 2023 23:52:45 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72A6410E189
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Nov 2023 23:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699401163; x=1730937163;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=6sr42LdwSF7ku87FmPqcgFLRq8XnPBc06YY4PCfY8hg=;
 b=lFTCK38+JCO5wnB/YnqyMH1zBXBHKBDXopYH17Mhnyw0wdyc/khNhCBj
 t2ox/YJ9GSbGfTKV/3PfEQEWJYZ6XY6sccw3g0vfonfXpHToqYaw1dvv4
 x2Bj02EDqSOembX8EV+wDR4j6MQ6A3o+w5qiM78qGFEUuydK1IaSb05v3
 J/QeJR5TTfubN3W76xx1u2s6lidKqPPBSOQdnDv6Rp8bbphRRnl8JLOqz
 dNfmeKRzph++jScJoY7p0Ru8KuXAhNRZ9/TYcfdOoQQDjyjB6eaUXGdxZ
 9UN0jYco4h44nH6YplJIwaCkyA+HCvcdc0EMoxm7zbMSTOo6wS7d16yay w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="456147592"
X-IronPort-AV: E=Sophos;i="6.03,284,1694761200"; 
 d="scan'208,217";a="456147592"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2023 15:52:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="762878673"
X-IronPort-AV: E=Sophos;i="6.03,284,1694761200"; 
 d="scan'208,217";a="762878673"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Nov 2023 15:52:42 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 7 Nov 2023 15:52:42 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 7 Nov 2023 15:52:41 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 7 Nov 2023 15:52:41 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 7 Nov 2023 15:52:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xuhf8xTDXW42aL5JoiJ1SGy8lOKWj5Llc2FOTRI9WWJ9ACdTeQ4vQzdkx+xAN9cFjB+2cXGHhUH+9WknvjTALL0p8ZMK4ive3yCA5buYBGDKeirbkJ7oQNsK18N3gW37Wxa0sCbmhQ7cjI915CG/cO8WD42wrUZnCXkVy/k4xalR+I7GyAlPo4RiTvDfFa4zcAXAneP8GlcYnJp8V24A5lFBdmUiUdLJBwslG7JIg0tNoQQD5lg24Qb24qnyFdsqy6fLZnU6sHoau/S9Le5yN0AvuQaBP1yZRemLIEN3R/TBRZrkDBHEQo5xjvhaMQI3vFTYUHNaxxt+11CkfL6mtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rqFPXYSkj/RXcPQ8H+0ZO+y91PIoL8IN9JOFBJJtjxY=;
 b=MJLPwkyYx572qf9VUwJYU5F6KKBpzCT4lKJ+MeBXlCB3Lx1ujfvlbmVZXSdH23ByAn+10KMzSUK7cVtkNuu2h8FBsddUKMElZRusbFPYVkdJLacuUTR5ik0DMKUuSY19vLT+c06JYG/MRl24W3YMkyVDax468jFGs9ahBbj4gQxQ6EbSw7V5VsUxHXjyAnwT2FfXHKni+SRazzYQaeEGXyTfrbTAcCCCJrXpxZl+AA7LuwsSr38E3Mix3iybhArqjlYQb6nYmZS4YqYB1mQXHlsG4BYdPjzdCzFK9qCL+DJx+KvMwyJDCVIeMbbMMlCg3R67H/Qji2Blsfc6jM60sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by BL1PR11MB5977.namprd11.prod.outlook.com (2603:10b6:208:384::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.21; Tue, 7 Nov
 2023 23:52:39 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::de08:93ac:5940:ec54]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::de08:93ac:5940:ec54%4]) with mapi id 15.20.6954.029; Tue, 7 Nov 2023
 23:52:39 +0000
Content-Type: multipart/alternative;
 boundary="------------UZimu236vhOVMWGZKDS4ZDj5"
Message-ID: <828ccf67-179f-4615-9bf3-cf70f807abb5@intel.com>
Date: Tue, 7 Nov 2023 15:52:36 -0800
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20231027222928.1981633-1-daniele.ceraolospurio@intel.com>
 <20231027222928.1981633-5-daniele.ceraolospurio@intel.com>
 <db3df54c-47f7-4a8d-9ad3-9ddb2e1626a1@intel.com>
 <b60165a0-923f-4ed2-a8b4-aeb3f7a0c87a@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <b60165a0-923f-4ed2-a8b4-aeb3f7a0c87a@intel.com>
X-ClientProxiedBy: MW4PR04CA0162.namprd04.prod.outlook.com
 (2603:10b6:303:85::17) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|BL1PR11MB5977:EE_
X-MS-Office365-Filtering-Correlation-Id: 701cc9de-aaa1-49cc-eed1-08dbdfec9fa9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RacivpAUnSvY7yY08r4j7FFg8MtMwP6Mr4VtltwzxM8GrKmTjNYWduCadBajfcExgoM1foMWNrlqwNi5HSbJVoMD5fIZxkwMN7Fb2kyDbJs2L6Nt3+nPFDwSI/xMASWAu8qShP5H9vUD7zh7Cs8KJt/9WJeSu8Lx7SnMjTE2ep4Rw2vlZ/zXwOE14EiTg//OBhlU4zxeXHLcEbLIOtJaR2vxgiynq7Dr0Bg0okO9iE2DPUD5zAmYotVhXlBo0FrFpSUXXNt/mIApCtD8yccxNAXIz1PUczgreSNsOihdAde53OOLSB7T+8wgktUCgf0SUZ9PC2+j/GD42IENdufykFxpKbfwV9S1LXDrVSyVynUWiwcnTN+YCZ2wj2Xwo/dG8WJQF2EeQs+DrfU9MKXDnyEEhY/cLG1GzxNwMDCubrIf4RWTU0oV9qN0djKAeluj0SduHFhR4+wfyh2CgYpT4NnUoUI6xDgyaaRQoeQ2cBfr9XCL2H1IW+jUNmHZt1M+75K5RHSVWfKPt9vZ9IBL+BKM74vv/wkM51M2RHTAR1U7XfWPjVs8ZYSoP1v3z/8FQ1N+bZZUQF6ToVJyzdLds+s6KBguLCFeAALMtqUG41tIi5O6DLif2kUGg9LW8TsY1QVAdFX+OoCNI17USU8o9w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(366004)(396003)(39860400002)(346002)(376002)(230922051799003)(451199024)(186009)(64100799003)(1800799009)(31686004)(33964004)(6506007)(6666004)(53546011)(38100700002)(83380400001)(82960400001)(4326008)(2616005)(6512007)(107886003)(30864003)(31696002)(66476007)(2906002)(8676002)(66946007)(8936002)(66556008)(316002)(6486002)(36756003)(5660300002)(26005)(86362001)(41300700001)(478600001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UDJlbWoxYW5ySFBPMDBMSWFndGZ1TlVNSnNiN0tZY3k3U1o5V3JZMkgzSjNI?=
 =?utf-8?B?bE1TNmUwK3U2eUowOFRaVTVVZXJDazV5NkRFSlhWZG51RUdmemNvaW42ZnYx?=
 =?utf-8?B?Q1J4MWxRdzJZOGJyMTdwTVkrUUd3eVRua1Y1a3FUcHNOY0VFZWMyT01vckU5?=
 =?utf-8?B?RnZLWWtWeERpc2d5TWx5UXJNN2ltTGRJL1cxNUlnSFdMZmUrNWxnVXZXc2VP?=
 =?utf-8?B?WkcxWm1SMFNpZzhEM0hxL1grMXk1ME9FQUVVaGc0U1lSLytvNGNLRVVNdkpu?=
 =?utf-8?B?WWtpdDZtcDErM29NODJ0UTVzdWI0RTNZcW1KWjU2RWRKUnM4M04yMTMvcUwz?=
 =?utf-8?B?b0UxZkxhYnZ2UXBKcEx3VU9LVHNYN0FOb0JuWisvdWgraSs1SDBUNEdlWFFj?=
 =?utf-8?B?ZDRiUDhQOVQ5eU5Tc3RkYkdLWjl5WWprQTFjR21kUnB5dTdoRjBxNWJPSjlU?=
 =?utf-8?B?V3ZEWDFHTVAveXBsZjI3ZkJTYWUrVGlObFptNEVsQ083OEFNUnRnU2c1TFNo?=
 =?utf-8?B?ODRZaTBvaUpQck12NjVZZ3V5d0xNejNpbnZZYk5PT1RDRkFYZkltdy9Mak9n?=
 =?utf-8?B?OTZXZHBCRGV2YnZxbnI3Q1FocEhsaEtCdlJsL25yMHBzNjhoRGNJZFpFM09K?=
 =?utf-8?B?RFdZMVRZVCtabEtxcGFMSHNqKzF2cndFQTc0emZaVGNkeStCN0Y4Nnk1UWN1?=
 =?utf-8?B?MTdqbjVLK1Ezend0bEdhL3NZOGdkbXZxeVhJcXowVm5zUHpkRXl6VUsvOVlE?=
 =?utf-8?B?R0x3TXpJc2NPcExBZDBMaGhyQ2c0UE9UOE9qbmZoMUhMZGlDS0JBTm9QUFcw?=
 =?utf-8?B?RFlSTHNGVUZVRVd5UkQ5d1YydXQ5a2VOVVhWTXcxZ21FRGRkQXdLeUM1Z2Jz?=
 =?utf-8?B?SnhTOGxFb2JVVHNmdDNKRlBtckFQVlBsTWkwYlpvSlY2TzlOcUZaZ2RkNTZa?=
 =?utf-8?B?ZXI4MS9BdWp2a29NMFNiR2t5TEFyc1RrdmJFWVByVVh1MEJ2VDVOd2pjenpv?=
 =?utf-8?B?dllWRWg0akt2NEdPTGdudVpXanUxN0tVb3UrVlNSZE1zb2EybTVXTGI2YUY1?=
 =?utf-8?B?UnZ6TVUxYVB3d0dSWXBIKzVlYVJNc3dYZ3pOSUdzZGUwdkJya3BLZmg0b0xK?=
 =?utf-8?B?Rm52RWVnczB0aU1jNUNOU2hOamU3bW50aFc2Uld5K0JjbWNUaStIMklGajZ1?=
 =?utf-8?B?UXYvTndDb1B3WWVBS0cxT1NvSU1XbUNxUDVxUXZPWHMzaGk4SXFFQTZ4ZVF1?=
 =?utf-8?B?Si9lRWNrK2FCZlQ0WXE4RCtXVlJYTWUvU29sTXhhWXNCQlhWS2hYeWw2M09x?=
 =?utf-8?B?U01DeXhid0EzRXdkK2pETllXeHRJMFYvRS8yMmVWb2puUFJuMWNxcjNXcEkx?=
 =?utf-8?B?ZWtKalM5L0ZiN04vN25KM1hrczd0Z3FTZk5JMVE0QzRzNUNlKzhteC9mbHF6?=
 =?utf-8?B?dG4xN3Y2aUVXaUlQOUMzRGZMaFFSYlg2RG9vRStRR2poMGl2UlVNQjl1TTFJ?=
 =?utf-8?B?Zzdvcjl4OEVlc0xHM2JXUlJPYXJVcHd3THh3NFJEVUJPWTFzeVhqTXRkcXNl?=
 =?utf-8?B?ZzZOd1QyZ2NMVmE1cU40eU1uWkFtc0laWkxjYSttalJ3djZYUDMzck5aSitr?=
 =?utf-8?B?a2ZabmdnRU95cXNldkxkbUZhRXJaTXMxV1VkcWZHRGYwOUQrOHhJN1hMTmxn?=
 =?utf-8?B?ZDRhNGJGaWJiMW1rbkgwWHdvaUZ0bTNUZlNpOE5yMXgwN2w3RG9iTkNHTHpS?=
 =?utf-8?B?QlBLanlyc1duN3BwSTBUQUdoS1VLTlFvQzl4MGFGeXZjdjFwSGJnZUxDbFo5?=
 =?utf-8?B?ODhYaHQvSFo3MHFFc3ZvRnJ1L3lZTWtoVUtEYTdoMWVOVE8zdU9YMVBrb1oz?=
 =?utf-8?B?b3huYUpyd3lyTDNQaE0yY3RCeU9YY2VoUWgrb3VBU0xJNXhVTFZmbGYzSDRT?=
 =?utf-8?B?dytGeG9YNUZPYVdWamp6NTdQbkxoMDRLVDV6SmMzTFYvRDZXRzZmckxHZ2VC?=
 =?utf-8?B?THNRNzkxVytaQ2s4Tk1kV1dybmpFd0xzQkZvZlEwYng3WHVybHZJMS9IS2U2?=
 =?utf-8?B?YXFaYUpBWTE4alU3TnFCNllCOVdVSDFEeE5OSzBFNU03TlNyNnl3WUlwSWR1?=
 =?utf-8?B?dXV1R0xqK3ZQNkNMVlZNY09mRTFiTEs4cDZ1ZGsrRkNUKzNsMzJsdUdQcXBj?=
 =?utf-8?B?N0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 701cc9de-aaa1-49cc-eed1-08dbdfec9fa9
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2023 23:52:39.0049 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZBKRS4GKNFq3CyolctTt4JWj1jI5dNAnLhfgHEmHJ09E6iVo4soheTGMlFP9NmbBIWoBeGnOpqiVTdacjAnNaF4NzhF5+9jfiypDDA6XTMw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5977
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 04/12] drm/xe/gsc: Introduce GSC FW
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

--------------UZimu236vhOVMWGZKDS4ZDj5
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 11/7/2023 15:32, Daniele Ceraolo Spurio wrote:
> On 11/7/2023 3:26 PM, John Harrison wrote:
>> On 10/27/2023 15:29, Daniele Ceraolo Spurio wrote:
>>> Add the basic definitions and init function. Same as HuC, GSC is only
>>> supported on the media GT on MTL and newer platforms.
>>> Note that the GSC requires submission resources which can't be 
>>> allocated
>>> during init (because we don't have the hwconfig yet), so it can't be
>>> marked as loadable at the end of the init function. The allocation of
>>> those resources will come in the patch that makes use of them to load
>>> the FW.
>>>
>>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>>> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
>>> Cc: John Harrison <John.C.Harrison@Intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/Makefile         |  1 +
>>>   drivers/gpu/drm/xe/xe_gsc.c         | 50 
>>> +++++++++++++++++++++++++++++
>>>   drivers/gpu/drm/xe/xe_gsc.h         | 13 ++++++++
>>>   drivers/gpu/drm/xe/xe_gsc_types.h   | 19 +++++++++++
>>>   drivers/gpu/drm/xe/xe_uc.c          |  9 ++++--
>>>   drivers/gpu/drm/xe/xe_uc_fw.c       | 21 ++++++++++--
>>>   drivers/gpu/drm/xe/xe_uc_fw.h       |  2 ++
>>>   drivers/gpu/drm/xe/xe_uc_fw_types.h |  5 +--
>>>   drivers/gpu/drm/xe/xe_uc_types.h    |  3 ++
>>>   9 files changed, 116 insertions(+), 7 deletions(-)
>>>   create mode 100644 drivers/gpu/drm/xe/xe_gsc.c
>>>   create mode 100644 drivers/gpu/drm/xe/xe_gsc.h
>>>   create mode 100644 drivers/gpu/drm/xe/xe_gsc_types.h
>>>
>>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>>> index cee57681732d..474b6044d054 100644
>>> --- a/drivers/gpu/drm/xe/Makefile
>>> +++ b/drivers/gpu/drm/xe/Makefile
>>> @@ -57,6 +57,7 @@ xe-y += xe_bb.o \
>>>       xe_exec_queue.o \
>>>       xe_force_wake.o \
>>>       xe_ggtt.o \
>>> +    xe_gsc.o \
>>>       xe_gt.o \
>>>       xe_gt_clock.o \
>>>       xe_gt_debugfs.o \
>>> diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c
>>> new file mode 100644
>>> index 000000000000..3f709577d73b
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/xe/xe_gsc.c
>>> @@ -0,0 +1,50 @@
>>> +// SPDX-License-Identifier: MIT
>>> +/*
>>> + * Copyright © 2023 Intel Corporation
>>> + */
>>> +
>>> +#include "xe_gsc.h"
>>> +
>>> +#include "xe_device.h"
>>> +#include "xe_gt.h"
>>> +#include "xe_gt_printk.h"
>>> +#include "xe_uc_fw.h"
>>> +
>>> +static struct xe_gt *
>>> +gsc_to_gt(struct xe_gsc *gsc)
>>> +{
>>> +    return container_of(gsc, struct xe_gt, uc.gsc);
>>> +}
>>> +
>>> +int xe_gsc_init(struct xe_gsc *gsc)
>>> +{
>>> +    struct xe_gt *gt = gsc_to_gt(gsc);
>>> +    struct xe_tile *tile = gt_to_tile(gt);
>>> +    int ret;
>>> +
>>> +    gsc->fw.type = XE_UC_FW_TYPE_GSC;
>>> +
>>> +    /* The GSC uC is only available on the media GT */
>>> +    if (tile->media_gt && (gt != tile->media_gt)) {
>>> +        xe_uc_fw_change_status(&gsc->fw, 
>>> XE_UC_FIRMWARE_NOT_SUPPORTED);
>>> +        return 0;
>>> +    }
>>> +
>>> +    /*
>>> +     * GSC can be "not supported" where GuC is instead supported, 
>>> so we
>>> +     * don't want to fail if xe_uc_fw_init() returns an error due 
>>> to that.
>> Not following this comment. Can you explain more?
>
> xe_uc_fw_init() is going to fail if the GSC FW is not defined for the 
> platform. The uC switch is global for all FWs, so either all FW init 
> functions are called or none of them; since we do have to handle the 
> case where GuC is supported and GSC is not, xe_gsc_init() needs to not 
> fail in that scenario. We do still have to call xe_uc_fw_init() as 
> that's where the FW selection is (and therefore where we find out if 
> it is defined or not), so the solution is to check the enablement 
> status first before checking the return code.
>
Maybe go with this instead?

    Some platforms can have GuC (and HuC?) but not GSC. That would cause
    xe_uc_fw_init(gsc) to return a "not supported" failure code and
    abort all firmware loading. So check for GSC being enabled before
    propagating the failure back up. That way the higher level will keep
    going and load GuC/HuC as appropriate.



>>
>>> +     * To avoid this problem, check the FW status before the return 
>>> code.
>>> +     */
>>> +    ret = xe_uc_fw_init(&gsc->fw);
>>> +    if (!xe_uc_fw_is_enabled(&gsc->fw))
>>> +        return 0;
>>> +    else if (ret)
>>> +        goto out;
>>> +
>>> +    return 0;
>>> +
>>> +out:
>>> +    xe_gt_err(gt, "GSC init failed with %d", ret);
>>> +    return ret;
>>> +}
>>> +
>>> diff --git a/drivers/gpu/drm/xe/xe_gsc.h b/drivers/gpu/drm/xe/xe_gsc.h
>>> new file mode 100644
>>> index 000000000000..baa7f21f4204
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/xe/xe_gsc.h
>>> @@ -0,0 +1,13 @@
>>> +/* SPDX-License-Identifier: MIT */
>>> +/*
>>> + * Copyright © 2023 Intel Corporation
>>> + */
>>> +
>>> +#ifndef _XE_GSC_H_
>>> +#define _XE_GSC_H_
>>> +
>>> +#include "xe_gsc_types.h"
>>> +
>>> +int xe_gsc_init(struct xe_gsc *gsc);
>>> +
>>> +#endif
>>> diff --git a/drivers/gpu/drm/xe/xe_gsc_types.h 
>>> b/drivers/gpu/drm/xe/xe_gsc_types.h
>>> new file mode 100644
>>> index 000000000000..135f156e3736
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/xe/xe_gsc_types.h
>>> @@ -0,0 +1,19 @@
>>> +/* SPDX-License-Identifier: MIT */
>>> +/*
>>> + * Copyright © 2023 Intel Corporation
>>> + */
>>> +
>>> +#ifndef _XE_GSC_TYPES_H_
>>> +#define _XE_GSC_TYPES_H_
>>> +
>>> +#include "xe_uc_fw_types.h"
>>> +
>>> +/**
>>> + * struct xe_gsc - GSC
>>> + */
>>> +struct xe_gsc {
>>> +    /** @fw: Generic uC firmware management */
>>> +    struct xe_uc_fw fw;
>>> +};
>>> +
>>> +#endif
>>> diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
>>> index 784f53c5f282..b67154c78dff 100644
>>> --- a/drivers/gpu/drm/xe/xe_uc.c
>>> +++ b/drivers/gpu/drm/xe/xe_uc.c
>>> @@ -6,6 +6,7 @@
>>>   #include "xe_uc.h"
>>>     #include "xe_device.h"
>>> +#include "xe_gsc.h"
>>>   #include "xe_gt.h"
>>>   #include "xe_guc.h"
>>>   #include "xe_guc_pc.h"
>>> @@ -32,8 +33,8 @@ int xe_uc_init(struct xe_uc *uc)
>>>       int ret;
>>>         /*
>>> -     * We call the GuC/HuC init functions even if GuC submission is 
>>> off to
>>> -     * correctly move our tracking of the FW state to "disabled".
>>> +     * We call the GuC/HuC/GSC init functions even if GuC 
>>> submission is off
>>> +     * to correctly move our tracking of the FW state to "disabled".
>>>        */
>>>         ret = xe_guc_init(&uc->guc);
>>> @@ -44,6 +45,10 @@ int xe_uc_init(struct xe_uc *uc)
>>>       if (ret)
>>>           goto err;
>>>   +    ret = xe_gsc_init(&uc->gsc);
>>> +    if (ret)
>>> +        goto err;
>>> +
>>>       if (!xe_device_uc_enabled(uc_to_xe(uc)))
>>>           return 0;
>>>   diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c 
>>> b/drivers/gpu/drm/xe/xe_uc_fw.c
>>> index 1f7dac394a1d..af3e5cba606f 100644
>>> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
>>> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
>>> @@ -158,11 +158,18 @@ XE_HUC_FIRMWARE_DEFS(XE_UC_MODULE_FIRMWARE,
>>>   static struct xe_gt *
>>>   __uc_fw_to_gt(struct xe_uc_fw *uc_fw, enum xe_uc_fw_type type)
>>>   {
>>> -    if (type == XE_UC_FW_TYPE_GUC)
>>> +    XE_WARN_ON(type >= XE_UC_FW_NUM_TYPES);
>>> +
>>> +    switch (type) {
>>> +    case XE_UC_FW_TYPE_GUC:
>>>           return container_of(uc_fw, struct xe_gt, uc.guc.fw);
>>> +    case XE_UC_FW_TYPE_HUC:
>>> +        return container_of(uc_fw, struct xe_gt, uc.huc.fw);
>>> +    case XE_UC_FW_TYPE_GSC:
>>> +        return container_of(uc_fw, struct xe_gt, uc.gsc.fw);
>>> +    }
>>>   -    XE_WARN_ON(type != XE_UC_FW_TYPE_HUC);
>>> -    return container_of(uc_fw, struct xe_gt, uc.huc.fw);
>>> +    return NULL;
>>>   }
>>>     static struct xe_gt *uc_fw_to_gt(struct xe_uc_fw *uc_fw)
>>> @@ -197,6 +204,14 @@ uc_fw_auto_select(struct xe_device *xe, struct 
>>> xe_uc_fw *uc_fw)
>>>       u32 count;
>>>       int i;
>>>   +    /*
>>> +     * GSC FW support is still not fully in place, so we're not 
>>> defining
>>> +     * the FW blob yet because we don't want the driver to attempt 
>>> to load
>>> +     * it until we're ready for it.
>>> +     */
>>> +    if (uc_fw->type == XE_UC_FW_TYPE_GSC)
>>> +        return;
>>> +
>>>       xe_assert(xe, uc_fw->type < ARRAY_SIZE(blobs_all));
>>>       entries = blobs_all[uc_fw->type].entries;
>>>       count = blobs_all[uc_fw->type].count;
>>> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.h 
>>> b/drivers/gpu/drm/xe/xe_uc_fw.h
>>> index 1d1a0c156cdf..d4682b0276e2 100644
>>> --- a/drivers/gpu/drm/xe/xe_uc_fw.h
>>> +++ b/drivers/gpu/drm/xe/xe_uc_fw.h
>>> @@ -96,6 +96,8 @@ static inline const char *xe_uc_fw_type_repr(enum 
>>> xe_uc_fw_type type)
>>>           return "GuC";
>>>       case XE_UC_FW_TYPE_HUC:
>>>           return "HuC";
>>> +    case XE_UC_FW_TYPE_GSC:
>>> +        return "GSC";
>>>       }
>>>       return "uC";
>>>   }
>>> diff --git a/drivers/gpu/drm/xe/xe_uc_fw_types.h 
>>> b/drivers/gpu/drm/xe/xe_uc_fw_types.h
>>> index e4774c560e67..239256bfdb07 100644
>>> --- a/drivers/gpu/drm/xe/xe_uc_fw_types.h
>>> +++ b/drivers/gpu/drm/xe/xe_uc_fw_types.h
>>> @@ -55,9 +55,10 @@ enum xe_uc_fw_status {
>>>     enum xe_uc_fw_type {
>>>       XE_UC_FW_TYPE_GUC = 0,
>>> -    XE_UC_FW_TYPE_HUC
>>> +    XE_UC_FW_TYPE_HUC,
>>> +    XE_UC_FW_TYPE_GSC
>>>   };
>>> -#define XE_UC_FW_NUM_TYPES 2
>>> +#define XE_UC_FW_NUM_TYPES 3
>> Why is this not just a sentinel entry of the enum?
>
> No idea, I'm just updating the value. It is the same in i915.
Seems like a good opportunity to fix it.

John.

>
> Daniele
>
>>
>> John.
>>
>>>     /**
>>>    * struct xe_uc_fw_version - Version for XE micro controller firmware
>>> diff --git a/drivers/gpu/drm/xe/xe_uc_types.h 
>>> b/drivers/gpu/drm/xe/xe_uc_types.h
>>> index 49bef6498b85..9924e4484866 100644
>>> --- a/drivers/gpu/drm/xe/xe_uc_types.h
>>> +++ b/drivers/gpu/drm/xe/xe_uc_types.h
>>> @@ -6,6 +6,7 @@
>>>   #ifndef _XE_UC_TYPES_H_
>>>   #define _XE_UC_TYPES_H_
>>>   +#include "xe_gsc_types.h"
>>>   #include "xe_guc_types.h"
>>>   #include "xe_huc_types.h"
>>>   #include "xe_wopcm_types.h"
>>> @@ -18,6 +19,8 @@ struct xe_uc {
>>>       struct xe_guc guc;
>>>       /** @huc: HuC */
>>>       struct xe_huc huc;
>>> +    /** @gsc: Graphics Security Controller */
>>> +    struct xe_gsc gsc;
>>>       /** @wopcm: WOPCM */
>>>       struct xe_wopcm wopcm;
>>>   };
>>
>

--------------UZimu236vhOVMWGZKDS4ZDj5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    On 11/7/2023 15:32, Daniele Ceraolo Spurio wrote:<br>
    <blockquote type="cite" cite="mid:b60165a0-923f-4ed2-a8b4-aeb3f7a0c87a@intel.com">
      On 11/7/2023 3:26 PM, John Harrison wrote:
      <br>
      <blockquote type="cite">
        On 10/27/2023 15:29, Daniele Ceraolo Spurio wrote:
        <br>
        <blockquote type="cite">Add the basic definitions and init
          function. Same as HuC, GSC is only
          <br>
          supported on the media GT on MTL and newer platforms.
          <br>
          Note that the GSC requires submission resources which can't be
          allocated
          <br>
          during init (because we don't have the hwconfig yet), so it
          can't be
          <br>
          marked as loadable at the end of the init function. The
          allocation of
          <br>
          those resources will come in the patch that makes use of them
          to load
          <br>
          the FW.
          <br>
          <br>
          Signed-off-by: Daniele Ceraolo Spurio
          <a class="moz-txt-link-rfc2396E" href="mailto:daniele.ceraolospurio@intel.com">&lt;daniele.ceraolospurio@intel.com&gt;</a>
          <br>
          Cc: Alan Previn <a class="moz-txt-link-rfc2396E" href="mailto:alan.previn.teres.alexis@intel.com">&lt;alan.previn.teres.alexis@intel.com&gt;</a>
          <br>
          Cc: John Harrison <a class="moz-txt-link-rfc2396E" href="mailto:John.C.Harrison@Intel.com">&lt;John.C.Harrison@Intel.com&gt;</a>
          <br>
          ---
          <br>
          &nbsp; drivers/gpu/drm/xe/Makefile&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 1 +
          <br>
          &nbsp; drivers/gpu/drm/xe/xe_gsc.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 50
          +++++++++++++++++++++++++++++
          <br>
          &nbsp; drivers/gpu/drm/xe/xe_gsc.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 13 ++++++++
          <br>
          &nbsp; drivers/gpu/drm/xe/xe_gsc_types.h&nbsp;&nbsp; | 19 +++++++++++
          <br>
          &nbsp; drivers/gpu/drm/xe/xe_uc.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 9 ++++--
          <br>
          &nbsp; drivers/gpu/drm/xe/xe_uc_fw.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 21 ++++++++++--
          <br>
          &nbsp; drivers/gpu/drm/xe/xe_uc_fw.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 2 ++
          <br>
          &nbsp; drivers/gpu/drm/xe/xe_uc_fw_types.h |&nbsp; 5 +--
          <br>
          &nbsp; drivers/gpu/drm/xe/xe_uc_types.h&nbsp;&nbsp;&nbsp; |&nbsp; 3 ++
          <br>
          &nbsp; 9 files changed, 116 insertions(+), 7 deletions(-)
          <br>
          &nbsp; create mode 100644 drivers/gpu/drm/xe/xe_gsc.c
          <br>
          &nbsp; create mode 100644 drivers/gpu/drm/xe/xe_gsc.h
          <br>
          &nbsp; create mode 100644 drivers/gpu/drm/xe/xe_gsc_types.h
          <br>
          <br>
          diff --git a/drivers/gpu/drm/xe/Makefile
          b/drivers/gpu/drm/xe/Makefile
          <br>
          index cee57681732d..474b6044d054 100644
          <br>
          --- a/drivers/gpu/drm/xe/Makefile
          <br>
          +++ b/drivers/gpu/drm/xe/Makefile
          <br>
          @@ -57,6 +57,7 @@ xe-y += xe_bb.o \
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe_exec_queue.o \
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe_force_wake.o \
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe_ggtt.o \
          <br>
          +&nbsp;&nbsp;&nbsp; xe_gsc.o \
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe_gt.o \
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe_gt_clock.o \
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe_gt_debugfs.o \
          <br>
          diff --git a/drivers/gpu/drm/xe/xe_gsc.c
          b/drivers/gpu/drm/xe/xe_gsc.c
          <br>
          new file mode 100644
          <br>
          index 000000000000..3f709577d73b
          <br>
          --- /dev/null
          <br>
          +++ b/drivers/gpu/drm/xe/xe_gsc.c
          <br>
          @@ -0,0 +1,50 @@
          <br>
          +// SPDX-License-Identifier: MIT
          <br>
          +/*
          <br>
          + * Copyright © 2023 Intel Corporation
          <br>
          + */
          <br>
          +
          <br>
          +#include &quot;xe_gsc.h&quot;
          <br>
          +
          <br>
          +#include &quot;xe_device.h&quot;
          <br>
          +#include &quot;xe_gt.h&quot;
          <br>
          +#include &quot;xe_gt_printk.h&quot;
          <br>
          +#include &quot;xe_uc_fw.h&quot;
          <br>
          +
          <br>
          +static struct xe_gt *
          <br>
          +gsc_to_gt(struct xe_gsc *gsc)
          <br>
          +{
          <br>
          +&nbsp;&nbsp;&nbsp; return container_of(gsc, struct xe_gt, uc.gsc);
          <br>
          +}
          <br>
          +
          <br>
          +int xe_gsc_init(struct xe_gsc *gsc)
          <br>
          +{
          <br>
          +&nbsp;&nbsp;&nbsp; struct xe_gt *gt = gsc_to_gt(gsc);
          <br>
          +&nbsp;&nbsp;&nbsp; struct xe_tile *tile = gt_to_tile(gt);
          <br>
          +&nbsp;&nbsp;&nbsp; int ret;
          <br>
          +
          <br>
          +&nbsp;&nbsp;&nbsp; gsc-&gt;fw.type = XE_UC_FW_TYPE_GSC;
          <br>
          +
          <br>
          +&nbsp;&nbsp;&nbsp; /* The GSC uC is only available on the media GT */
          <br>
          +&nbsp;&nbsp;&nbsp; if (tile-&gt;media_gt &amp;&amp; (gt !=
          tile-&gt;media_gt)) {
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe_uc_fw_change_status(&amp;gsc-&gt;fw,
          XE_UC_FIRMWARE_NOT_SUPPORTED);
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;
          <br>
          +&nbsp;&nbsp;&nbsp; }
          <br>
          +
          <br>
          +&nbsp;&nbsp;&nbsp; /*
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp; * GSC can be &quot;not supported&quot; where GuC is instead
          supported, so we
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp; * don't want to fail if xe_uc_fw_init() returns an error
          due to that.
          <br>
        </blockquote>
        Not following this comment. Can you explain more?
        <br>
      </blockquote>
      <br>
      xe_uc_fw_init() is going to fail if the GSC FW is not defined for
      the platform. The uC switch is global for all FWs, so either all
      FW init functions are called or none of them; since we do have to
      handle the case where GuC is supported and GSC is not,
      xe_gsc_init() needs to not fail in that scenario. We do still have
      to call xe_uc_fw_init() as that's where the FW selection is (and
      therefore where we find out if it is defined or not), so the
      solution is to check the enablement status first before checking
      the return code.
      <br>
      <br>
    </blockquote>
    Maybe go with this instead?<br>
    <blockquote>Some platforms can have GuC (and HuC?) but not GSC. That
      would cause xe_uc_fw_init(gsc) to return a &quot;not supported&quot; failure
      code and abort all firmware loading. So check for GSC being
      enabled before propagating the failure back up. That way the
      higher level will keep going and load GuC/HuC as appropriate.<br>
    </blockquote>
    <br>
    <br>
    <blockquote type="cite" cite="mid:b60165a0-923f-4ed2-a8b4-aeb3f7a0c87a@intel.com">
      <blockquote type="cite">
        <br>
        <blockquote type="cite">+&nbsp;&nbsp;&nbsp;&nbsp; * To avoid this problem, check the
          FW status before the return code.
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp; */
          <br>
          +&nbsp;&nbsp;&nbsp; ret = xe_uc_fw_init(&amp;gsc-&gt;fw);
          <br>
          +&nbsp;&nbsp;&nbsp; if (!xe_uc_fw_is_enabled(&amp;gsc-&gt;fw))
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;
          <br>
          +&nbsp;&nbsp;&nbsp; else if (ret)
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; goto out;
          <br>
          +
          <br>
          +&nbsp;&nbsp;&nbsp; return 0;
          <br>
          +
          <br>
          +out:
          <br>
          +&nbsp;&nbsp;&nbsp; xe_gt_err(gt, &quot;GSC init failed with %d&quot;, ret);
          <br>
          +&nbsp;&nbsp;&nbsp; return ret;
          <br>
          +}
          <br>
          +
          <br>
          diff --git a/drivers/gpu/drm/xe/xe_gsc.h
          b/drivers/gpu/drm/xe/xe_gsc.h
          <br>
          new file mode 100644
          <br>
          index 000000000000..baa7f21f4204
          <br>
          --- /dev/null
          <br>
          +++ b/drivers/gpu/drm/xe/xe_gsc.h
          <br>
          @@ -0,0 +1,13 @@
          <br>
          +/* SPDX-License-Identifier: MIT */
          <br>
          +/*
          <br>
          + * Copyright © 2023 Intel Corporation
          <br>
          + */
          <br>
          +
          <br>
          +#ifndef _XE_GSC_H_
          <br>
          +#define _XE_GSC_H_
          <br>
          +
          <br>
          +#include &quot;xe_gsc_types.h&quot;
          <br>
          +
          <br>
          +int xe_gsc_init(struct xe_gsc *gsc);
          <br>
          +
          <br>
          +#endif
          <br>
          diff --git a/drivers/gpu/drm/xe/xe_gsc_types.h
          b/drivers/gpu/drm/xe/xe_gsc_types.h
          <br>
          new file mode 100644
          <br>
          index 000000000000..135f156e3736
          <br>
          --- /dev/null
          <br>
          +++ b/drivers/gpu/drm/xe/xe_gsc_types.h
          <br>
          @@ -0,0 +1,19 @@
          <br>
          +/* SPDX-License-Identifier: MIT */
          <br>
          +/*
          <br>
          + * Copyright © 2023 Intel Corporation
          <br>
          + */
          <br>
          +
          <br>
          +#ifndef _XE_GSC_TYPES_H_
          <br>
          +#define _XE_GSC_TYPES_H_
          <br>
          +
          <br>
          +#include &quot;xe_uc_fw_types.h&quot;
          <br>
          +
          <br>
          +/**
          <br>
          + * struct xe_gsc - GSC
          <br>
          + */
          <br>
          +struct xe_gsc {
          <br>
          +&nbsp;&nbsp;&nbsp; /** @fw: Generic uC firmware management */
          <br>
          +&nbsp;&nbsp;&nbsp; struct xe_uc_fw fw;
          <br>
          +};
          <br>
          +
          <br>
          +#endif
          <br>
          diff --git a/drivers/gpu/drm/xe/xe_uc.c
          b/drivers/gpu/drm/xe/xe_uc.c
          <br>
          index 784f53c5f282..b67154c78dff 100644
          <br>
          --- a/drivers/gpu/drm/xe/xe_uc.c
          <br>
          +++ b/drivers/gpu/drm/xe/xe_uc.c
          <br>
          @@ -6,6 +6,7 @@
          <br>
          &nbsp; #include &quot;xe_uc.h&quot;
          <br>
          &nbsp; &nbsp; #include &quot;xe_device.h&quot;
          <br>
          +#include &quot;xe_gsc.h&quot;
          <br>
          &nbsp; #include &quot;xe_gt.h&quot;
          <br>
          &nbsp; #include &quot;xe_guc.h&quot;
          <br>
          &nbsp; #include &quot;xe_guc_pc.h&quot;
          <br>
          @@ -32,8 +33,8 @@ int xe_uc_init(struct xe_uc *uc)
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int ret;
          <br>
          &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*
          <br>
          -&nbsp;&nbsp;&nbsp;&nbsp; * We call the GuC/HuC init functions even if GuC
          submission is off to
          <br>
          -&nbsp;&nbsp;&nbsp;&nbsp; * correctly move our tracking of the FW state to
          &quot;disabled&quot;.
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp; * We call the GuC/HuC/GSC init functions even if GuC
          submission is off
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp; * to correctly move our tracking of the FW state to
          &quot;disabled&quot;.
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */
          <br>
          &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret = xe_guc_init(&amp;uc-&gt;guc);
          <br>
          @@ -44,6 +45,10 @@ int xe_uc_init(struct xe_uc *uc)
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ret)
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; goto err;
          <br>
          &nbsp; +&nbsp;&nbsp;&nbsp; ret = xe_gsc_init(&amp;uc-&gt;gsc);
          <br>
          +&nbsp;&nbsp;&nbsp; if (ret)
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; goto err;
          <br>
          +
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!xe_device_uc_enabled(uc_to_xe(uc)))
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;
          <br>
          &nbsp; diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c
          b/drivers/gpu/drm/xe/xe_uc_fw.c
          <br>
          index 1f7dac394a1d..af3e5cba606f 100644
          <br>
          --- a/drivers/gpu/drm/xe/xe_uc_fw.c
          <br>
          +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
          <br>
          @@ -158,11 +158,18 @@
          XE_HUC_FIRMWARE_DEFS(XE_UC_MODULE_FIRMWARE,
          <br>
          &nbsp; static struct xe_gt *
          <br>
          &nbsp; __uc_fw_to_gt(struct xe_uc_fw *uc_fw, enum xe_uc_fw_type
          type)
          <br>
          &nbsp; {
          <br>
          -&nbsp;&nbsp;&nbsp; if (type == XE_UC_FW_TYPE_GUC)
          <br>
          +&nbsp;&nbsp;&nbsp; XE_WARN_ON(type &gt;= XE_UC_FW_NUM_TYPES);
          <br>
          +
          <br>
          +&nbsp;&nbsp;&nbsp; switch (type) {
          <br>
          +&nbsp;&nbsp;&nbsp; case XE_UC_FW_TYPE_GUC:
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return container_of(uc_fw, struct xe_gt, uc.guc.fw);
          <br>
          +&nbsp;&nbsp;&nbsp; case XE_UC_FW_TYPE_HUC:
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return container_of(uc_fw, struct xe_gt, uc.huc.fw);
          <br>
          +&nbsp;&nbsp;&nbsp; case XE_UC_FW_TYPE_GSC:
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return container_of(uc_fw, struct xe_gt, uc.gsc.fw);
          <br>
          +&nbsp;&nbsp;&nbsp; }
          <br>
          &nbsp; -&nbsp;&nbsp;&nbsp; XE_WARN_ON(type != XE_UC_FW_TYPE_HUC);
          <br>
          -&nbsp;&nbsp;&nbsp; return container_of(uc_fw, struct xe_gt, uc.huc.fw);
          <br>
          +&nbsp;&nbsp;&nbsp; return NULL;
          <br>
          &nbsp; }
          <br>
          &nbsp; &nbsp; static struct xe_gt *uc_fw_to_gt(struct xe_uc_fw *uc_fw)
          <br>
          @@ -197,6 +204,14 @@ uc_fw_auto_select(struct xe_device *xe,
          struct xe_uc_fw *uc_fw)
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; u32 count;
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int i;
          <br>
          &nbsp; +&nbsp;&nbsp;&nbsp; /*
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp; * GSC FW support is still not fully in place, so we're
          not defining
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp; * the FW blob yet because we don't want the driver to
          attempt to load
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp; * it until we're ready for it.
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp; */
          <br>
          +&nbsp;&nbsp;&nbsp; if (uc_fw-&gt;type == XE_UC_FW_TYPE_GSC)
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return;
          <br>
          +
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe_assert(xe, uc_fw-&gt;type &lt;
          ARRAY_SIZE(blobs_all));
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; entries = blobs_all[uc_fw-&gt;type].entries;
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; count = blobs_all[uc_fw-&gt;type].count;
          <br>
          diff --git a/drivers/gpu/drm/xe/xe_uc_fw.h
          b/drivers/gpu/drm/xe/xe_uc_fw.h
          <br>
          index 1d1a0c156cdf..d4682b0276e2 100644
          <br>
          --- a/drivers/gpu/drm/xe/xe_uc_fw.h
          <br>
          +++ b/drivers/gpu/drm/xe/xe_uc_fw.h
          <br>
          @@ -96,6 +96,8 @@ static inline const char
          *xe_uc_fw_type_repr(enum xe_uc_fw_type type)
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return &quot;GuC&quot;;
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case XE_UC_FW_TYPE_HUC:
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return &quot;HuC&quot;;
          <br>
          +&nbsp;&nbsp;&nbsp; case XE_UC_FW_TYPE_GSC:
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return &quot;GSC&quot;;
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return &quot;uC&quot;;
          <br>
          &nbsp; }
          <br>
          diff --git a/drivers/gpu/drm/xe/xe_uc_fw_types.h
          b/drivers/gpu/drm/xe/xe_uc_fw_types.h
          <br>
          index e4774c560e67..239256bfdb07 100644
          <br>
          --- a/drivers/gpu/drm/xe/xe_uc_fw_types.h
          <br>
          +++ b/drivers/gpu/drm/xe/xe_uc_fw_types.h
          <br>
          @@ -55,9 +55,10 @@ enum xe_uc_fw_status {
          <br>
          &nbsp; &nbsp; enum xe_uc_fw_type {
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; XE_UC_FW_TYPE_GUC = 0,
          <br>
          -&nbsp;&nbsp;&nbsp; XE_UC_FW_TYPE_HUC
          <br>
          +&nbsp;&nbsp;&nbsp; XE_UC_FW_TYPE_HUC,
          <br>
          +&nbsp;&nbsp;&nbsp; XE_UC_FW_TYPE_GSC
          <br>
          &nbsp; };
          <br>
          -#define XE_UC_FW_NUM_TYPES 2
          <br>
          +#define XE_UC_FW_NUM_TYPES 3
          <br>
        </blockquote>
        Why is this not just a sentinel entry of the enum?
        <br>
      </blockquote>
      <br>
      No idea, I'm just updating the value. It is the same in i915.
      <br>
    </blockquote>
    Seems like a good opportunity to fix it.<br>
    <br>
    John.<br>
    <br>
    <blockquote type="cite" cite="mid:b60165a0-923f-4ed2-a8b4-aeb3f7a0c87a@intel.com">
      <br>
      Daniele
      <br>
      <br>
      <blockquote type="cite">
        <br>
        John.
        <br>
        <br>
        <blockquote type="cite">&nbsp; &nbsp; /**
          <br>
          &nbsp;&nbsp; * struct xe_uc_fw_version - Version for XE micro controller
          firmware
          <br>
          diff --git a/drivers/gpu/drm/xe/xe_uc_types.h
          b/drivers/gpu/drm/xe/xe_uc_types.h
          <br>
          index 49bef6498b85..9924e4484866 100644
          <br>
          --- a/drivers/gpu/drm/xe/xe_uc_types.h
          <br>
          +++ b/drivers/gpu/drm/xe/xe_uc_types.h
          <br>
          @@ -6,6 +6,7 @@
          <br>
          &nbsp; #ifndef _XE_UC_TYPES_H_
          <br>
          &nbsp; #define _XE_UC_TYPES_H_
          <br>
          &nbsp; +#include &quot;xe_gsc_types.h&quot;
          <br>
          &nbsp; #include &quot;xe_guc_types.h&quot;
          <br>
          &nbsp; #include &quot;xe_huc_types.h&quot;
          <br>
          &nbsp; #include &quot;xe_wopcm_types.h&quot;
          <br>
          @@ -18,6 +19,8 @@ struct xe_uc {
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct xe_guc guc;
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /** @huc: HuC */
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct xe_huc huc;
          <br>
          +&nbsp;&nbsp;&nbsp; /** @gsc: Graphics Security Controller */
          <br>
          +&nbsp;&nbsp;&nbsp; struct xe_gsc gsc;
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /** @wopcm: WOPCM */
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct xe_wopcm wopcm;
          <br>
          &nbsp; };
          <br>
        </blockquote>
        <br>
      </blockquote>
      <br>
    </blockquote>
    <br>
  </body>
</html>

--------------UZimu236vhOVMWGZKDS4ZDj5--
